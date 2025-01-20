@interface TTSAssetTrialVoiceAsset
- (NSDictionary)attributes;
- (NSNumber)age;
- (NSString)identifier;
- (NSString)name;
- (TTSAssetQuality)quality;
- (TTSAssetTechnology)technology;
- (TTSAssetType)assetType;
- (int64_t)gender;
@end

@implementation TTSAssetTrialVoiceAsset

- (int64_t)gender
{
  v2 = self;
  int64_t v3 = sub_19CD9E708();

  return v3;
}

- (TTSAssetQuality)quality
{
  v2 = self;
  sub_19CDA1024();
  v4 = v3;

  return (TTSAssetQuality *)v4;
}

- (TTSAssetTechnology)technology
{
  v2 = self;
  sub_19CDA1460();
  v4 = v3;

  return (TTSAssetTechnology *)v4;
}

- (TTSAssetType)assetType
{
  v2 = self;
  sub_19CDB01D4();
  v4 = v3;

  return (TTSAssetType *)v4;
}

- (NSString)name
{
  return (NSString *)sub_19CDB068C(self, (uint64_t)a2, (void (*)(void))sub_19CDAF504);
}

- (NSString)identifier
{
  return (NSString *)sub_19CDB068C(self, (uint64_t)a2, (void (*)(void))sub_19CDFB350);
}

- (NSNumber)age
{
  v2 = self;
  int64_t v3 = (void *)sub_19CDFBB24();

  return (NSNumber *)v3;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)sub_19CDFC01C(self, (uint64_t)a2, (void (*)(void))sub_19CDFBBDC);
}

@end