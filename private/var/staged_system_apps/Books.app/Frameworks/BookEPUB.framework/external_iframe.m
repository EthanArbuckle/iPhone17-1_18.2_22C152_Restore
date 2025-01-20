@interface external_iframe
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation external_iframe

+ (NSString)sourceName
{
  return (NSString *)@"external_iframe.js";
}

+ (NSString)source
{
  return (NSString *)@"//  Copyright © 2017-2018 Apple Inc. All rights reserved.\nReflect.defineProperty(window,'__ibooks_external_iframe',{value:{},writable:!1}),function(e){e.blockedLinkSet={},e.blockedFrameMap={},e.addBlockedLink=function(t){t=t.replace(/\\/$/,'');const o=e.blockedLinkSet;if (null==o)return;o[t]=!0;const n=e.blockedFrameMap,r=e.contentBlockerUrl,c=document.getElementsByTagName('iframe');for (let e=0;e<c.length;++e){const t=c[e],l=t.getAttribute('src');o[l]&&(t.setAttribute('src',r),n[l]||(n[l]=[]),n[l].push(t))}},e.refreshWithoutBlocker=function(){const t=e.blockedFrameMap;for (const e in t){const o=t[e];for (let t=0;t<o.length;++t)o[t].setAttribute('src',e)}e.blockedLinkSet=e.blockedFrameMap=null}}(__ibooks_external_iframe);\n";
}

@end