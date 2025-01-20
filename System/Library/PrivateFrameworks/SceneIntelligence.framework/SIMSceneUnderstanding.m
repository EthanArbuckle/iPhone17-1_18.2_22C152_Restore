@interface SIMSceneUnderstanding
+ (NSString)compiledModelPath;
@end

@implementation SIMSceneUnderstanding

+ (NSString)compiledModelPath
{
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = [NSString stringWithUTF8String:kSIMSceneUnderstandingNetworkName];
  v4 = [v2 pathForResource:v3 ofType:@"mlmodelc"];

  return (NSString *)v4;
}

@end