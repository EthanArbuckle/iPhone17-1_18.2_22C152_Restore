@interface TTSAssetTrialResourceAsset
- (NSDictionary)attributes;
- (NSNumber)age;
- (NSString)identifier;
- (NSString)name;
- (TTSAssetQuality)quality;
- (TTSAssetTechnology)technology;
- (TTSAssetType)assetType;
- (int64_t)gender;
@end

@implementation TTSAssetTrialResourceAsset

- (TTSAssetType)assetType
{
  v2 = self;
  id v3 = sub_19CDAD858(&qword_1EB5349E8, (void **)&qword_1EB5349E0);

  return (TTSAssetType *)v3;
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
  sub_19CDFBFBC();
  v2 = (void *)sub_19CED5230();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)gender
{
  return 0;
}

- (NSNumber)age
{
  return (NSNumber *)0;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)sub_19CDFC01C(self, (uint64_t)a2, (void (*)(void))sub_19CDFC098);
}

@end