<?php

function getIP(){
	if(isset($_SERVER['HTTP_X_REAL_IP'])){
		return trim($_SERVER['HTTP_X_REAL_IP']);
	}
	if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])){
		$ips=explode(',',$_SERVER['HTTP_X_FORWARDED_FOR']);
		return trim($ips[0]);
	}
	return $_SERVER['REMOTE_ADDR'];
}

class Poem extends SQLite3{
	function __construct(){
		$this->open('poems.db',SQLITE3_OPEN_READONLY);
	}
	
	public function get($a='1'){
		$sql="SELECT * FROM poems WHERE `id`=$a;";
		//var_dump($sql);
		return $this->query($sql);
	}
}

class MyRedis extends Redis{
	function __construct(){
		parent::__construct();
		$this->connect('127.0.0.1',6379);
	}
	
	public function setCache($ip='',$return=''){
		return $this->setEx($ip,15,$return);
	}
	
	public function getCache($ip=''){
		return $this->get($ip);
	}
}


function doget($id){
	$redis=new MyRedis();
	
	$cache=$redis->getCache(getIP());
	if($cache!=false){
		return [
			"status"=>200,
			"return"=>$cache,
			"error"=>"One IP can only request a new result in 60s."
		];
	}
	if(!empty($id)){
		$db=new Poem();
		$ret=$db->get($id);
		if(!$ret){
			return;
		}
		$row=$ret->fetchArray(SQLITE3_ASSOC);
		$redis->setCache(getIP(),$row['content']);
		return [
			"status"=>200,
			"return"=>$row['content']
		];
	}
}

echo json_encode(doget($_GET['id']) ?? [
	"status"=>400,
	"return"=>null
]);