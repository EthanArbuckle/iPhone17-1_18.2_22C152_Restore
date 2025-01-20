@interface TTSAssetLegacyAsset
- (BOOL)purgeable;
- (NSArray)supportedLanguages;
- (NSBundle)bundle;
- (NSDictionary)attributes;
- (NSNumber)age;
- (NSNumber)diskSize;
- (NSString)identifier;
- (NSString)name;
- (NSString)versionDescription;
- (TTSAssetQuality)quality;
- (TTSAssetSource)assetSource;
- (TTSAssetTechnology)technology;
- (TTSAssetType)assetType;
- (_TtC14SiriTTSService19TTSAssetLegacyAsset)init;
- (int64_t)gender;
- (int64_t)versionNumber;
- (void)purge;
@end

@implementation TTSAssetLegacyAsset

- (TTSAssetType)assetType
{
  v2 = self;
  id v3 = sub_19CE7CC14();

  return (TTSAssetType *)v3;
}

- (TTSAssetSource)assetSource
{
  v2 = self;
  id v3 = sub_19CE7CE88();

  return (TTSAssetSource *)v3;
}

- (TTSAssetTechnology)technology
{
  v2 = self;
  id v3 = sub_19CE7CF28();

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  v2 = self;
  id v3 = sub_19CE7D39C();

  return (TTSAssetQuality *)v3;
}

- (NSString)name
{
  return (NSString *)sub_19CE7DD8C(self, (uint64_t)a2, (void (*)(void))sub_19CE7D780);
}

- (NSString)identifier
{
  return (NSString *)sub_19CE7DD8C(self, (uint64_t)a2, (void (*)(void))sub_19CE7D864);
}

- (int64_t)versionNumber
{
  v2 = self;
  int64_t v3 = sub_19CE7DAE4();

  return v3;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19CE7DD8C(self, (uint64_t)a2, (void (*)(void))sub_19CE7DDFC);
}

- (NSArray)supportedLanguages
{
  v2 = self;
  sub_19CE7E040();

  int64_t v3 = (void *)sub_19CED5530();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)gender
{
  v2 = self;
  int64_t v3 = sub_19CE7E198();

  return v3;
}

- (NSNumber)age
{
  v2 = self;
  int64_t v3 = (void *)sub_19CE7E270();

  return (NSNumber *)v3;
}

- (NSNumber)diskSize
{
  v2 = self;
  sub_19CE7E358();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSDictionary)attributes
{
  v2 = self;
  sub_19CE7E920();

  int64_t v3 = (void *)sub_19CED5150();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (NSBundle)bundle
{
  v2 = sub_19CE7ECC0();
  return (NSBundle *)v2;
}

- (BOOL)purgeable
{
  v2 = self;
  BOOL v3 = sub_19CE7ED24();

  return v3;
}

- (void)purge
{
  v2 = self;
  sub_19CE7EDDC();
}

- (_TtC14SiriTTSService19TTSAssetLegacyAsset)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end