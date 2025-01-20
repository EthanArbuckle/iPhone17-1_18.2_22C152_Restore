@interface ibooks_object
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation ibooks_object

+ (NSString)sourceName
{
  return (NSString *)@"ibooks_object.js";
}

+ (NSString)source
{
  return (NSString *)@"//  Copyright © 2018 Apple Inc. All rights reserved.\nReflect.defineProperty(window,'iBooks',{value:{},writable:!1}),function(e){e.version='[[__version__]]',e.paginate=function(){return-1},e.log=function(e){},e.postMessage=function(e,t){let n=!1;const o=window.webkit.messageHandlers;if (o){const s=o[e];s&&(s.postMessage(t),n=!0)}return n},'function'!=typeof window.getMatchedCSSRules&&(e._getSheetRules=function(e){const t=e.media&&e.media.mediaText;return e.disabled||t&&t.length&&!window.matchMedia(t).matches?[]:[...e.cssRules]},window.getMatchedCSSRules=function(t){const n=[],o=[...window.document.styleSheets];for (const s of o){let o=e._getSheetRules(s);for (const s of o){if (s.styleSheet){o=[...e._getSheetRules(s.styleSheet),...o];continue}if (s.media){o=[...e._getSheetRules(s),...o];continue}const i=void 0!==s.selectorText,c=s.selectorText||'';i&&c.length>0&&!c.startsWith('@')&&t.webkitMatchesSelector(c)&&n.push(s)}}return n})}(window.iBooks);\n";
}

@end