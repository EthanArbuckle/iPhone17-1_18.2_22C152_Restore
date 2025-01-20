@interface THApplePubAssetPluginProvider
+ (id)sharedPlugin;
@end

@implementation THApplePubAssetPluginProvider

+ (id)sharedPlugin
{
  return +[THApplePubAssetPlugin sharedPlugin];
}

@end