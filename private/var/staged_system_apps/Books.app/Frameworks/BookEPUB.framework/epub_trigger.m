@interface epub_trigger
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation epub_trigger

+ (NSString)sourceName
{
  return (NSString *)@"epub_trigger.js";
}

+ (NSString)source
{
  return (NSString *)@"//  Copyright © 2011-2018 Apple Inc. All rights reserved.\n!function(){const e='http://www.w3.org/2001/xml-events',t=function(t){const n=this.getAttributeNS(e,'event');switch(t.type){case n:{'stop'===this.getAttributeNS(e,'propagate')&&t.stopPropagation(),'cancel'===this.getAttributeNS(e,'defaultAction')&&t.preventDefault();const n=document.getElementById(this.getAttribute('ref'));if (!n)return;switch(this.getAttribute('action')){case'show':n.style.visibility='visible';break;case'hide':n.style.visibility='hidden';break;case'play':n.seekable.length>0&&(n.currentTime=n.seekable.start(0)),n.play();break;case'pause':n.pause();break;case'resume':n.play();break;case'mute':n.muted=!0;break;case'unmute':n.muted=!1}break}case'DOMNodeRemovedFromDocument':o(this),t.target.isSameNode(this)||i.push(this)}},n=[],r=[];let i=[];const s=function(s){if (-1!=n.indexOf(s))return;const o=s.getAttributeNS(e,'event');if (null==o||''==o)return;let u=s.getAttributeNS(e,'observer');if (null==u||''==u)return;if (u=document.getElementById(u),null==u)return void(-1==i.indexOf(s)&&i.push(s));const c='capture'==s.getAttributeNS(e,'phase');s.handleEvent=t,u.addEventListener(o,s,c),u.addEventListener('DOMNodeRemovedFromDocument',s,!1),s.addEventListener('DOMNodeRemovedFromDocument',s,!1),n.push(s),r.push({target:u,event:o,capturing:c})},o=function(e){const t=n.indexOf(e);if (-1==t)return;const i=r[t];i.target.removeEventListener(i.event,e,i.capturing),i.target.removeEventListener('DOMNodeRemovedFromDocument',e,!1),n.splice(t,1),r.splice(t,1)},u=function(e){const t=e.querySelectorAll('*|trigger');for (let e=0;e<t.length;e++){const n=t[e];n.nodeType==Node.ELEMENT_NODE&&'http://www.idpf.org/2007/ops'==n.namespaceURI&&s(n)}};document.addEventListener('DOMNodeInserted',(function(e){u(e.relatedNode),function(){const e=[];for (let t=0;t<i.length;t++){const r=i[t];s(r),-1==n.indexOf(r)&&e.push(r)}i=e}()}),!1),u(document)}();\n";
}

@end