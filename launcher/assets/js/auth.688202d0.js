(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["auth"],{4186:function(e,t,s){},"59c9":function(e,t,s){"use strict";s("4186")},"9ed6":function(e,t,s){"use strict";s.r(t);var a=function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"main"},[s("div",{staticClass:"loginBox"},[s("div",{staticClass:"title"},[e._v(" Login ")]),s("div",{staticClass:"container"},[s("w-input",{attrs:{type:"email",name:"email",placeholder:"Username",disable:e.loading},model:{value:e.username,callback:function(t){e.username=t},expression:"username"}}),s("w-input",{attrs:{type:"password",name:"password",placeholder:"Password",disable:e.loading},on:{enter:e.signIn},model:{value:e.password,callback:function(t){e.password=t},expression:"password"}}),e._m(0),s("div",{staticClass:"actions"},[s("w-btn",{attrs:{label:"Sign in",disable:!e.canContinue},on:{click:e.signIn}})],1)],1)])])},i=[function(){var e=this,t=e.$createElement,s=e._self._c||t;return s("div",{staticClass:"signupText"},[e._v(" To create an account, go to "),s("pre",[e._v("https://forum.plutonium.pw/register")])])}],n=s("5530"),o=s("2f62"),r={name:"Login",data:function(){return{username:"",password:"",remember:!0}},computed:Object(n["a"])(Object(n["a"])({},Object(o["b"])({loading:"ui/showLoadingModal"})),{},{canContinue:function(){return this.username&&this.password&&!this.loading}}),beforeCreate:function(){this.$store.dispatch("ui/setLoadingState",{show:!0,message:"Checking for saved credentials..."})},mounted:function(){var e=this;this.$route.query.logout?this.$store.dispatch("ui/setLoadingState",{show:!1}):this.$nextTick((function(){try{var t=isTokenAvailable();t?e.$store.dispatch("authentication/preAuthed"):e.$store.dispatch("ui/setLoadingState",{show:!1})}catch(s){console.error("error while trying to check if nix is logged in. Probably because nix isn't ready yet."),e.$store.dispatch("ui/setLoadingState",{show:!1})}}))},methods:{signIn:function(){this.username&&this.password&&this.$store.dispatch("authentication/authenticate",{username:this.username,password:this.password,remember:this.remember})}}},c=r,u=(s("59c9"),s("2877")),d=Object(u["a"])(c,a,i,!1,null,"51d897ea",null);t["default"]=d.exports}}]);
//# sourceMappingURL=auth.688202d0.js.map