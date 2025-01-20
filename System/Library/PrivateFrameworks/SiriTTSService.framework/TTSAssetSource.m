@interface TTSAssetSource
+ (TTSAssetSource)adhoc;
+ (TTSAssetSource)factory;
+ (TTSAssetSource)macosLegacy;
+ (TTSAssetSource)mobileAsset;
+ (TTSAssetSource)preinstalled;
+ (TTSAssetSource)turiTrial;
@end

@implementation TTSAssetSource

+ (TTSAssetSource)macosLegacy
{
  id v2 = static TTSAssetSource.macosLegacy.getter();
  return (TTSAssetSource *)v2;
}

+ (TTSAssetSource)mobileAsset
{
  id v2 = static TTSAssetSource.mobileAsset.getter();
  return (TTSAssetSource *)v2;
}

+ (TTSAssetSource)turiTrial
{
  id v2 = static TTSAssetSource.turiTrial.getter();
  return (TTSAssetSource *)v2;
}

+ (TTSAssetSource)adhoc
{
  id v2 = static TTSAssetSource.adhoc.getter();
  return (TTSAssetSource *)v2;
}

+ (TTSAssetSource)preinstalled
{
  id v2 = static TTSAssetSource.preinstalled.getter();
  return (TTSAssetSource *)v2;
}

+ (TTSAssetSource)factory
{
  id v2 = static TTSAssetSource.factory.getter();
  return (TTSAssetSource *)v2;
}

@end