@interface content_load
+ (NSString)source;
+ (NSString)sourceName;
@end

@implementation content_load

+ (NSString)sourceName
{
  return (NSString *)@"content_load.js";
}

+ (NSString)source
{
  return (NSString *)@"// Copyright  © 2018-2019 Apple Inc. All rights reserved.\nwindow.addEventListener('load',(()=>{iBooks.postMessage('BENavigationHandlerJSLoadComplete',!0)}));\n";
}

@end