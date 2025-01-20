@interface TTSAssetProxyAsset
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
- (_TtC14SiriTTSService18TTSAssetProxyAsset)init;
- (int64_t)gender;
- (int64_t)purgeCondition;
- (int64_t)versionNumber;
- (void)cancelDownloadingThen:(id)a3;
- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6;
- (void)purge;
- (void)purgeImmediately:(BOOL)a3;
- (void)setPurgeCondition:(int64_t)a3;
@end

@implementation TTSAssetProxyAsset

- (TTSAssetType)assetType
{
  v2 = self;
  id v3 = sub_19CE1A6F4();

  return (TTSAssetType *)v3;
}

- (TTSAssetSource)assetSource
{
  v2 = self;
  id v3 = sub_19CE1A974();

  return (TTSAssetSource *)v3;
}

- (TTSAssetTechnology)technology
{
  v2 = self;
  id v3 = sub_19CE1AA14();

  return (TTSAssetTechnology *)v3;
}

- (TTSAssetQuality)quality
{
  id v2 = sub_19CE1AF08();
  return (TTSAssetQuality *)v2;
}

- (NSString)name
{
  return (NSString *)sub_19CE1B0E0(self, (uint64_t)a2, (void (*)(void))sub_19CE1AF30);
}

- (NSString)identifier
{
  return (NSString *)sub_19CE1B0E0(self, (uint64_t)a2, (void (*)(void))sub_19CE1AF58);
}

- (int64_t)versionNumber
{
  id v2 = self;
  int64_t v3 = sub_19CE1B0BC();

  return v3;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19CE1B0E0(self, (uint64_t)a2, (void (*)(void))sub_19CE1B150);
}

- (NSArray)supportedLanguages
{
  id v2 = self;
  sub_19CE1B240();

  int64_t v3 = (void *)sub_19CED5530();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)gender
{
  id v2 = self;
  int64_t v3 = sub_19CE1B448();

  return v3;
}

- (NSNumber)age
{
  id v2 = self;
  int64_t v3 = (void *)sub_19CE1B4B8();

  return (NSNumber *)v3;
}

- (NSNumber)downloadSize
{
  id v2 = self;
  int64_t v3 = (void *)sub_19CE1B504();

  return (NSNumber *)v3;
}

- (NSNumber)diskSize
{
  id v2 = self;
  int64_t v3 = (void *)sub_19CE1B550();

  return (NSNumber *)v3;
}

- (NSDictionary)attributes
{
  sub_19CE1B5C0();
  id v2 = (void *)sub_19CED5150();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (NSBundle)bundle
{
  id v2 = self;
  int64_t v3 = sub_19CE1B614();

  return (NSBundle *)v3;
}

- (BOOL)locallyAvailable
{
  return sub_19CE1B9C4();
}

- (BOOL)purgeable
{
  return 1;
}

- (BOOL)downloading
{
  id v2 = self;
  char v3 = sub_19CE1BA1C();

  return v3 & 1;
}

- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6
{
  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  if (a3)
  {
    uint64_t v11 = sub_19CED5260();
    a3 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  v15 = self;
  sub_19CE1BF0C(v11, (uint64_t)a3, 0, (uint64_t)sub_19CDFD668, (void (*)(void, void))v13, (void (*)(id))sub_19CDFD81C, (void (*)(id))v14);

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
  sub_19CE1CC98((uint64_t)sub_19CDE9048, v5);

  swift_release();
}

- (void)purge
{
  id v2 = self;
  sub_19CE1D79C();
}

- (void)purgeImmediately:(BOOL)a3
{
  v4 = self;
  sub_19CE1D7F8(a3);
}

- (void)setPurgeCondition:(int64_t)a3
{
  v4 = self;
  sub_19CE1DB40(a3);
}

- (int64_t)purgeCondition
{
  id v2 = self;
  int64_t v3 = sub_19CE1DF44();

  return v3;
}

- (_TtC14SiriTTSService18TTSAssetProxyAsset)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14SiriTTSService18TTSAssetProxyAsset_authorizedBundle));
  swift_bridgeObjectRelease();
}

@end