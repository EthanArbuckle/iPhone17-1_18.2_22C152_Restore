@interface TTSAssetMAAsset
- (BOOL)downloading;
- (BOOL)locallyAvailable;
- (BOOL)purgeable;
- (NSArray)supportedLanguages;
- (NSBundle)bundle;
- (NSDictionary)attributes;
- (NSNumber)age;
- (NSNumber)diskSize;
- (NSNumber)downloadSize;
- (NSString)identifier;
- (NSString)name;
- (NSString)versionDescription;
- (TTSAssetQuality)quality;
- (TTSAssetSource)assetSource;
- (TTSAssetTechnology)technology;
- (TTSAssetType)assetType;
- (_TtC14SiriTTSService15TTSAssetMAAsset)init;
- (int64_t)gender;
- (int64_t)versionNumber;
- (void)cancelDownloadingThen:(id)a3;
- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6;
- (void)purge;
@end

@implementation TTSAssetMAAsset

- (TTSAssetType)assetType
{
  v2 = self;
  id v3 = sub_19CE20C4C();

  return (TTSAssetType *)v3;
}

- (TTSAssetSource)assetSource
{
  v2 = self;
  id v3 = sub_19CDAD858(&qword_1EB5348E8, (void **)&qword_1EB534918);

  return (TTSAssetSource *)v3;
}

- (TTSAssetTechnology)technology
{
  v2 = self;
  id v3 = sub_19CE20D80();

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  v2 = self;
  id v3 = sub_19CE21578();

  return (TTSAssetQuality *)v3;
}

- (NSString)name
{
  return (NSString *)sub_19CE22F2C(self, (uint64_t)a2, (void (*)(void))sub_19CE219F4);
}

- (NSString)identifier
{
  return (NSString *)sub_19CE22F2C(self, (uint64_t)a2, (void (*)(void))sub_19CE21D7C);
}

- (int64_t)versionNumber
{
  v2 = self;
  int64_t v3 = sub_19CE22E80();

  return v3;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19CE22F2C(self, (uint64_t)a2, (void (*)(void))sub_19CE22F9C);
}

- (NSArray)supportedLanguages
{
  v2 = self;
  sub_19CE23604();

  int64_t v3 = (void *)sub_19CED5530();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)gender
{
  v2 = self;
  int64_t v3 = sub_19CE23950();

  return v3;
}

- (NSNumber)age
{
  v2 = self;
  id v3 = sub_19CE23D64();

  return (NSNumber *)v3;
}

- (NSDictionary)attributes
{
  v2 = self;
  sub_19CE23EF0();

  id v3 = (void *)sub_19CED5150();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (NSNumber)downloadSize
{
  v2 = self;
  id v3 = sub_19CE243CC();

  return (NSNumber *)v3;
}

- (NSNumber)diskSize
{
  v2 = self;
  id v3 = sub_19CE2452C();

  return (NSNumber *)v3;
}

- (NSBundle)bundle
{
  v2 = self;
  id v3 = sub_19CE246A4();

  return (NSBundle *)v3;
}

- (BOOL)downloading
{
  v2 = self;
  BOOL v3 = sub_19CE248C8();

  return v3;
}

- (BOOL)purgeable
{
  v2 = self;
  BOOL v3 = sub_19CE24930();

  return v3;
}

- (BOOL)locallyAvailable
{
  v2 = self;
  unsigned __int8 v3 = sub_19CE2499C();

  return v3 & 1;
}

- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6
{
  v10 = _Block_copy(a5);
  v11 = _Block_copy(a6);
  if (a3) {
    sub_19CED5260();
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v10;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v11;
  v14 = self;
  sub_19CE249C8((uint64_t)v14, v15, a4, (uint64_t)sub_19CE2593C, v12, (uint64_t)sub_19CDDD65C, v13);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cancelDownloadingThen:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_19CE24E30((uint64_t)sub_19CDDD4D8, v5);

  swift_release();
}

- (void)purge
{
  v2 = self;
  sub_19CE25080();
}

- (_TtC14SiriTTSService15TTSAssetMAAsset)init
{
}

- (void).cxx_destruct
{
}

@end