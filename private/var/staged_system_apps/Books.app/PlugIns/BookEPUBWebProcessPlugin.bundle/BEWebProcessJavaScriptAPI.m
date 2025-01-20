@interface BEWebProcessJavaScriptAPI
+ (void)exportForContext:(id)a3;
@end

@implementation BEWebProcessJavaScriptAPI

+ (void)exportForContext:(id)a3
{
  id v3 = a3;
  JSContextGetGroup((JSContextRef)[v3 JSGlobalContextRef]);
  JSContextGroupSetExecutionTimeLimit();
  [v3 setObject:&stru_209A8 forKeyedSubscript:@"adjustedTextRectsForRange"];
}

@end