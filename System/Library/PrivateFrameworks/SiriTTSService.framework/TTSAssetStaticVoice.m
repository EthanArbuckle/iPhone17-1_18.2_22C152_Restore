@interface TTSAssetStaticVoice
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
- (_TtC14SiriTTSService19TTSAssetStaticVoice)init;
- (int64_t)gender;
- (int64_t)versionNumber;
@end

@implementation TTSAssetStaticVoice

- (NSArray)supportedLanguages
{
  return (NSArray *)sub_19CDAC118(self, (uint64_t)a2, (void (*)(void))sub_19CDAC198);
}

- (int64_t)versionNumber
{
  v2 = self;
  int64_t v3 = sub_19CDAC32C();

  return v3;
}

- (TTSAssetQuality)quality
{
  v2 = self;
  id v3 = sub_19CDACF3C();

  return (TTSAssetQuality *)v3;
}

- (TTSAssetTechnology)technology
{
  v2 = self;
  id v3 = sub_19CDAD240();

  return (TTSAssetTechnology *)v3;
}

- (NSString)name
{
  return (NSString *)sub_19CDAF47C(self, (uint64_t)a2, (void (*)(void))sub_19CDAF75C);
}

- (TTSAssetType)assetType
{
  v2 = self;
  id v3 = (void *)sub_19CDAFA34();

  return (TTSAssetType *)v3;
}

- (int64_t)gender
{
  v2 = self;
  int64_t v3 = sub_19CDB14F4();

  return v3;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19CDAF47C(self, (uint64_t)a2, (void (*)(void))sub_19CDB1670);
}

- (TTSAssetSource)assetSource
{
}

- (NSString)identifier
{
  return (NSString *)sub_19CDAF47C(self, (uint64_t)a2, (void (*)(void))sub_19CE3A05C);
}

- (NSNumber)age
{
  v2 = self;
  int64_t v3 = (void *)sub_19CE3ABBC();

  return (NSNumber *)v3;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)sub_19CE3BF88(self, (uint64_t)a2, (void (*)(void))sub_19CE3AC6C);
}

- (NSNumber)diskSize
{
  v2 = self;
  id v3 = sub_19CE3ACC0();

  return (NSNumber *)v3;
}

- (NSBundle)bundle
{
  v2 = sub_19CE3AD40();
  return (NSBundle *)v2;
}

- (_TtC14SiriTTSService19TTSAssetStaticVoice)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
}

@end