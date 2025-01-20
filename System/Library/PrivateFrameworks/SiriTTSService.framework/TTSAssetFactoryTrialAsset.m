@interface TTSAssetFactoryTrialAsset
- (BOOL)downloading;
- (BOOL)locallyAvailable;
- (BOOL)purgeable;
- (NSArray)supportedLanguages;
- (NSBundle)bundle;
- (NSNumber)diskSize;
- (NSString)name;
- (NSString)versionDescription;
- (TTSAssetQuality)quality;
- (TTSAssetSource)assetSource;
- (TTSAssetTechnology)technology;
- (TTSAssetType)assetType;
- (_TtC14SiriTTSService25TTSAssetFactoryTrialAsset)init;
- (int64_t)gender;
- (int64_t)versionNumber;
- (void)purge;
@end

@implementation TTSAssetFactoryTrialAsset

- (TTSAssetSource)assetSource
{
  v2 = self;
  id v3 = sub_19CDC1790();

  return (TTSAssetSource *)v3;
}

- (TTSAssetType)assetType
{
  v2 = self;
  id v3 = sub_19CDC1830();

  return (TTSAssetType *)v3;
}

- (NSArray)supportedLanguages
{
  v2 = self;
  sub_19CDC1BE0();

  id v3 = (void *)sub_19CED5530();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (NSString)name
{
  return (NSString *)sub_19CDC3074(self, (uint64_t)a2, (void (*)(void))sub_19CDC1D3C);
}

- (TTSAssetTechnology)technology
{
  v2 = self;
  id v3 = sub_19CDC1E00();

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  v2 = self;
  id v3 = sub_19CDC22BC();

  return (TTSAssetQuality *)v3;
}

- (int64_t)gender
{
  v2 = self;
  int64_t v3 = sub_19CDC25D4();

  return v3;
}

- (NSBundle)bundle
{
  v2 = self;
  id v3 = sub_19CDC2804();

  return (NSBundle *)v3;
}

- (NSNumber)diskSize
{
  v2 = self;
  sub_19CDC2A88();
  v4 = v3;

  return (NSNumber *)v4;
}

- (int64_t)versionNumber
{
  v2 = self;
  sub_19CDC2D98();
  int64_t v4 = v3;

  return v4;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19CDC3074(self, (uint64_t)a2, (void (*)(void))sub_19CDC30E4);
}

- (BOOL)downloading
{
  return 0;
}

- (BOOL)purgeable
{
  v2 = self;
  unsigned __int8 v3 = sub_19CDC31BC();

  return v3 & 1;
}

- (BOOL)locallyAvailable
{
  v2 = self;
  unsigned __int8 v3 = sub_19CDC321C();

  return v3 & 1;
}

- (void)purge
{
  v2 = self;
  sub_19CDC3248();
}

- (_TtC14SiriTTSService25TTSAssetFactoryTrialAsset)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end