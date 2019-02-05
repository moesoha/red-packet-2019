<template>
  <div id="app">
    <div class="redbag" :style="{background: wowRedBag[thisBagIdx].a}">
      <div class="header" :style="{background: wowRedBag[thisBagIdx].b}">
        <img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTI7IiB4bWw6c3BhY2U9InByZXNlcnZlIiB3aWR0aD0iNTEycHgiIGhlaWdodD0iNTEycHgiPgo8ZyB0cmFuc2Zvcm09Im1hdHJpeCgxLjI1IDAgMCAtMS4yNSAwIDQ1KSI+Cgk8Zz4KCQk8Zz4KCQkJPHBhdGggc3R5bGU9ImZpbGw6I0Y0QUJCQTsiIGQ9Ik0zODkuMDQtMTIwLjMyMmM0LjQwMyw0LjIyMSw4LjM0LDkuMDQ1LDExLjYwNSwxNC41NjRjMTkuMTcyLDMyLjQ2MSwzLjA2MSwxMTcuMS02LjczNiwxMjIuODggICAgIGMtNy45MTksNC42NzYtNjIuOTE5LTExLjk0Ny05My44MjEtMzUuNjM1QzI3MS42NTYtMS40ODEsMjM5LjI4Niw4LjU3NywyMDQuOCw4LjU3N2MtMzQuMzg0LDAtNjYuNjI4LTEwLjAwMS05NC45OTMtMjYuOTMxICAgICBDNzguODQ4LDUuMjU1LDI0LjA5OCwyMS43ODcsMTYuMjAyLDE3LjEyMmMtOS43OTYtNS43OC0yNS44OTYtOTAuNDE5LTYuNzM2LTEyMi44OGMzLjE2My01LjM1OSw2Ljk5Ny0xMC4wNTgsMTEuMjUzLTE0LjIxMSAgICAgQzcuNTY2LTE0OC45OTQsMC0xODAuNzQ5LDAtMjEzLjAzOWMwLTExMy42NjQsOTEuMTM2LTE0Mi40NzMsMjA0LjgtMTQyLjQ3M2MxMTMuNjUzLDAsMjA0LjgsMjguODA5LDIwNC44LDE0Mi40NzMgICAgIEM0MDkuNi0xODAuODc0LDQwMi4wNzktMTQ5LjI2NywzODkuMDQtMTIwLjMyMiIvPgoJCQk8Zz4KCQkJCTxwYXRoIHN0eWxlPSJmaWxsOiNFQTU5NkU7IiBkPSJNODQuMjA3LTM2LjQ3OUM1OS41NjMtMjIuMDUyLDM0LjEyMi0xMi44MTMsMjkuNTk0LTE1LjQ4NyAgICAgIGMtNi40ODUtMy44MjMtMTIuMzIyLTU2Ljg2Ni0zLjk5NC05NC4wMjZDNDAuMDczLTgxLjI4NSw2MC4xNzctNTYuMjUzLDg0LjIwNy0zNi40NzkiLz4KCQkJCTxwYXRoIHN0eWxlPSJmaWxsOiNFQTU5NkU7IiBkPSJNMzg0LjA2OC0xMDkuNTdjOC4zMjksMzcuMTcxLDIuNDkyLDkwLjIwMy0zLjk5NCw5NC4wMzcgICAgICBjLTQuNTI4LDIuNjYyLTI5Ljk2OS02LjU3Ni01NC42MTMtMjEuMDAzQzM0OS41MDMtNTYuMjk5LDM2OS42MDctODEuMzMsMzg0LjA2OC0xMDkuNTciLz4KCQkJCTxwYXRoIHN0eWxlPSJmaWxsOiNFQTU5NkU7IiBkPSJNMzE4LjYxMi0yMzEuNzc4YzAtNTEuMDUyLTM1LjIzNy0xMDYuNjY3LTExMy43NzgtMTA2LjY2NyAgICAgIGMtNzguNTUyLDAtMTEzLjc3OCw1NS42MTUtMTEzLjc3OCwxMDYuNjY3czM1LjIyNiw2NCwxMTMuNzc4LDY0QzI4My4zNzUtMTY3Ljc3OCwzMTguNjEyLTE4MC43MjYsMzE4LjYxMi0yMzEuNzc4Ii8+CgkJCTwvZz4KCQkJPHBhdGggaWQ9IlNWR0NsZWFuZXJJZF8wIiBzdHlsZT0iZmlsbDojNjYyMTEzOyIgZD0iTTE3MC43MDEtMjQ4LjU2MWMwLTIxLjEyOS0zLjg2OC0yNy4zMDctMTcuMDY3LTI3LjMwNyAgICAgYy0xMy4xOTgsMC0xNy4wNjcsNi4xNzgtMTcuMDY3LDI3LjMwN2MwLDIxLjExNywzLjg2OCwyNy4yOTUsMTcuMDY3LDI3LjI5NUMxNjYuODMyLTIyMS4yNjUsMTcwLjcwMS0yMjcuNDQ0LDE3MC43MDEtMjQ4LjU2MSIvPgoJCQk8ZyB0cmFuc2Zvcm09InRyYW5zbGF0ZSg5KSI+CgkJCQk8cGF0aCBpZD0iU1ZHQ2xlYW5lcklkXzBfMV8iIHN0eWxlPSJmaWxsOiM2NjIxMTM7IiBkPSJNMjczLjEwMS0yNDguNTYxYzAtMjEuMTI5LTMuODY4LTI3LjMwNy0xNy4wNjctMjcuMzA3ICAgICAgYy0xMy4xOTgsMC0xNy4wNjcsNi4xNzgtMTcuMDY3LDI3LjMwN2MwLDIxLjExNywzLjg2OCwyNy4yOTUsMTcuMDY3LDI3LjI5NUMyNjkuMjMyLTIyMS4yNjUsMjczLjEwMS0yMjcuNDQ0LDI3My4xMDEtMjQ4LjU2MSIvPgoJCQk8L2c+CgkJCTxnPgoJCQkJPHBhdGggc3R5bGU9ImZpbGw6IzI5MkYzMzsiIGQ9Ik0xMDIuNDM0LTE2Mi4wOWMwLTEyLjU2MS0xMC4xOTQtMjIuNzU2LTIyLjc1Ni0yMi43NTZzLTIyLjc1NiwxMC4xOTQtMjIuNzU2LDIyLjc1NiAgICAgIGMwLDEyLjU3MiwxMC4xOTQsMjIuNzU2LDIyLjc1NiwyMi43NTZTMTAyLjQzNC0xNDkuNTE3LDEwMi40MzQtMTYyLjA5Ii8+CgkJCQk8cGF0aCBzdHlsZT0iZmlsbDojMjkyRjMzOyIgZD0iTTM1Mi43NDUtMTYyLjA5YzAtMTIuNTYxLTEwLjE4My0yMi43NTYtMjIuNzU2LTIyLjc1NmMtMTIuNTYxLDAtMjIuNzU2LDEwLjE5NC0yMi43NTYsMjIuNzU2ICAgICAgYzAsMTIuNTcyLDEwLjE5NCwyMi43NTYsMjIuNzU2LDIyLjc1NkMzNDIuNTYyLTEzOS4zMzQsMzUyLjc0NS0xNDkuNTE3LDM1Mi43NDUtMTYyLjA5Ii8+CgkJCTwvZz4KCQk8L2c+Cgk8L2c+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" />
        <!--The icon made by <a href="https://www.flaticon.com/authors/twitter" title="Twitter">Twitter</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a>-->
      </div>
      <div class="open" @click="nextBagIdx">开</div>
    </div>
    <p style="text-align: center; margin: 1em auto;">{{poem}}</p>
    <modal v-if="showModal" @close="showModal=false">
      <h2 slot="header">在拿红包之前，你最好先了解这些内容。</h2>
      <template slot="body">
        <button @click="showModal=false">我读完了</button>
        <ol style="font-size: 1.2rem;">
          <li>这是一个红包解谜游戏，完成所有内容，你最终可以获得一个支付宝红包口令，凭此口令可进入支付宝领取红包。</li>
          <li>本次红包口令被拆成了四组：第一组为 1 个汉字，第二组为 1 个数字，第三组为 3 个数字，第四组为 4 个数字。最后的红包口令为这四组<b>依次</b>组合而成。</li>
          <li>各组口令的线索之间没有联系，即每组口令的线索都是独立的。</li>
          <li>本次活动时间从 2019 年 2 月 4 日 20 时开始，持续 24 个小时，如果红包被提前领完，则游戏提前结束。共设 10 个红包，总额 100 人民币元，红包领取规则为“拼手气红包”。</li>
          <li>这个游戏由 Soha 制作，在游戏结束后也将在 Soha 的博客 https://soha.moe 上放出题解。如有疑问也请通过博客的“关于我”页面上所述的联系方式联系。</li>
          <li>5 日 14 时 30 分又更新了一次提示。（你们快来拿啊！！！）</li>
          <li style="color: #ff084a">最后祝大家，新年快乐！</li>
          <li><small>那么开始找<b style="font-weight: normal;">红</b>包吧！</small></li>
        </ol>
      </template>
    </modal>
  </div>
</template>

<script>
import Modal from '../components/Modal'
import axios from 'axios'

const wowRedBag=[{
  a: '#fc3468',
  b: '#ff084a'
},{
  a: '#ffcf40',
  b: '#ffbf00'
},{
  a: '#d896ff',
  b: '#be29ec'
},{
  a: '#e3272b',
  b: '#da1313' // do not change
},{
  a: '#40e0d0',
  b: '#3bd6c6'
},{
  a: '#8dde28',
  b: '#76d119'
},{
  a: '#00abff',
  b: '#005eff'
},{
  a: '#b4b5db',
  b: '#acaedb'
},{
  a: '#cb8b8b',
  b: '#d47474'
},{
  a: '#a8daf9',
  b: '#92d2f9'
}];

export default {
  name: 'app',
  components: { Modal },
  data(){
    return {
      thisBagIdx: wowRedBag.findIndex((o)=>o.a==='#e3272b'),
      wowRedBag: wowRedBag,
      showModal: true,
      poem: ''
    };
  },
  mounted(){
    this.getPoem();
  },
  methods: {
    nextBagIdx(){
      this.thisBagIdx=(this.thisBagIdx+1)%wowRedBag.length;
    },
    async getPoem(){
      try{
        let {data}=await axios.get('/getPoem.php', {
          params: {
            id: Math.floor(Math.random()*20+1)
          }
        });
        if(data.status!==200){
          throw JSON.stringify(data);
        }
        this.poem=data.return;
      }catch(e){
        alert(e);
      }
    }
  }
}
</script>

<style scoped>
  .redbag {
    position: relative;
    height: 540px;
    width: 380px;
    margin: auto;
    padding: 1em;
    border-radius: 0 0 6px 6px;
    background: #e3272b;
    color: #fff;
    box-shadow: -5px 4px rgba(130,130,130,0.6);
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
  }
  .redbag .header{
    top: 0;
    left: 0;
    right: 0;
    position: absolute;
    height: 190px;
    border-radius: 0 0 380px 380px;
    box-shadow: -1px 3px rgba(0,0,0,0.18);
    background: #da1313;
  }
  .redbag img{
    position: absolute;
    left: 0;
    right: 0;
    bottom: -50px;
    margin: auto;
    width: 100px;
  }
  .redbag .open{
    position: relative;
    top: 60%;
    display: block;
    width: 100px;
    height: 100px;
    border-radius: 100%;
    font-size: 36px;
    margin: auto;
    text-align: center;
    line-height: 100px;
    background: #f9a528;
    color: #fff;
    cursor: grab;
    transition: 0.66s ease all;
  }
  .redbag .open:hover{
    width: 120px;
    height: 120px;
    line-height: 120px;
    font-size: 40px;
    top: 58%;
    box-shadow: -5px 5px rgba(0,0,0,0.38);
  }
</style>
