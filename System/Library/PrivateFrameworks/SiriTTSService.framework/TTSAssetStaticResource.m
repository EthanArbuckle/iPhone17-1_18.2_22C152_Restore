@interface TTSAssetStaticResource
- (BOOL)purgeable;
- (NSArray)supportedLanguages;
- (NSBundle)bundle;
- (NSDictionary)attributes;
- (NSNumber)diskSize;
- (NSString)identifier;
- (NSString)name;
- (NSString)versionDescription;
- (TTSAssetQuality)quality;
- (TTSAssetSource)assetSource;
- (TTSAssetTechnology)technology;
- (TTSAssetType)assetType;
- (_TtC14SiriTTSService22TTSAssetStaticResource)init;
- (int64_t)versionNumber;
@end

@implementation TTSAssetStaticResource

- (TTSAssetType)assetType
{
  v2 = self;
  id v3 = sub_19CDAD858(&qword_1EB5349E8, (void **)&qword_1EB5349E0);

  return (TTSAssetType *)v3;
}

- (TTSAssetSource)assetSource
{
}

- (TTSAssetTechnology)technology
{
  v2 = self;
  id v3 = sub_19CDAD858(&qword_1EB5345C0, (void **)&qword_1EB534680);

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  v2 = self;
  id v3 = sub_19CDAD858(&qword_1EB52EE30, (void **)&qword_1EB5332A8);

  return (TTSAssetQuality *)v3;
}

- (NSString)name
{
  v2 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)identifier
{
  return (NSString *)sub_19CDAF47C(self, (uint64_t)a2, (void (*)(void))sub_19CE3B8A4);
}

- (int64_t)versionNumber
{
  v2 = self;
  sub_19CE3BCC4();
  int64_t v4 = v3;

  return v4;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19CDAF47C(self, (uint64_t)a2, (void (*)(void))sub_19CE3BD68);
}

- (NSArray)supportedLanguages
{
  return (NSArray *)sub_19CDAC118(self, (uint64_t)a2, (void (*)(void))sub_19CE3BE58);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)sub_19CE3BF88(self, (uint64_t)a2, (void (*)(void))sub_19CDFC098);
}

- (NSNumber)diskSize
{
  v2 = self;
  sub_19CE3C048();
  int64_t v4 = v3;

  return (NSNumber *)v4;
}

- (NSBundle)bundle
{
  v2 = sub_19CE3C308();
  return (NSBundle *)v2;
}

- (BOOL)purgeable
{
  v2 = self;
  unsigned __int8 v3 = sub_19CE3C36C();

  return v3 & 1;
}

- (_TtC14SiriTTSService22TTSAssetStaticResource)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end