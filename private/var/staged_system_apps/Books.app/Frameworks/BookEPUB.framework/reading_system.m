@interface reading_system
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation reading_system

+ (NSString)sourceName
{
  return (NSString *)@"reading_system.js";
}

+ (NSString)source
{
  return (NSString *)@"//  Copyright © 2018 Apple Inc. All rights reserved.\nReflect.defineProperty(navigator,'epubReadingSystem',{value:{},writable:!1}),function(e){e.name='iBooks',e.version='[[__version__]]',e.layoutStyle='[[__layoutStyle__]]',e.hasFeature=function(e){const t=window.self===window.top;let n=!1;return'dom-manipulation'==e?n=!0:'layout-changes'==e?n=!t:'touch-events'==e?n=[[__touchEvents__]]:'mouse-events'==e?n=[[__mouseEvents__]]:('keyboard-events'==e||'spine-scripting'==e||'embedded-web-content'==e)&&(n=!0),n}}(navigator.epubReadingSystem);\n";
}

@end