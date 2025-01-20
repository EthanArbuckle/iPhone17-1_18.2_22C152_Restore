@interface TTSAssetQuality
+ (TTSAssetQuality)beta;
+ (TTSAssetQuality)compact;
+ (TTSAssetQuality)premium;
+ (TTSAssetQuality)premiumhigh;
@end

@implementation TTSAssetQuality

+ (TTSAssetQuality)compact
{
  id v2 = static TTSAssetQuality.compact.getter();
  return (TTSAssetQuality *)v2;
}

+ (TTSAssetQuality)premium
{
  id v2 = static TTSAssetQuality.premium.getter();
  return (TTSAssetQuality *)v2;
}

+ (TTSAssetQuality)premiumhigh
{
  id v2 = static TTSAssetQuality.premiumhigh.getter();
  return (TTSAssetQuality *)v2;
}

+ (TTSAssetQuality)beta
{
  id v2 = static TTSAssetQuality.beta.getter();
  return (TTSAssetQuality *)v2;
}

@end