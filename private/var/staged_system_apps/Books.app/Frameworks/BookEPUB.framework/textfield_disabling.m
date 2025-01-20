@interface textfield_disabling
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation textfield_disabling

+ (NSString)sourceName
{
  return (NSString *)@"textfield_disabling.js";
}

+ (NSString)source
{
  return (NSString *)@"//  Copyright © 2019 Apple Inc. All rights reserved.\n(()=>{const t={text:!0,search:!0,tel:!0,url:!0,email:!0,password:!0,number:!0,textarea:!0};function e(e){return e instanceof HTMLInputElement||t[e.type]||e.toString().includes('HTMLInputElement')}function n(t){const n=t.filter((t=>e(t)));n.length,n.forEach((t=>{t.setAttribute('disabled',!0)}))}function r(t){for (const r of t){if ('childList'===r.type){const t=Array.from(r.addedNodes);n(t)}else if ('attributes'===r.type){const t=r.target;e(t)&&!t.disabled&&n([t])}r.type,r.target}}const o={attributes:!0,childList:!0,subtree:!0,characterData:!0};window.addEventListener('DOMContentLoaded',(function(){new MutationObserver(r).observe(document,o),n(Array.from(document.querySelectorAll('input,textarea')))}))})();\n";
}

@end