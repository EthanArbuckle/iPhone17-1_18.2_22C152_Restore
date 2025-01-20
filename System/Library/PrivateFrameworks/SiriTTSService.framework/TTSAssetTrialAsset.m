@interface TTSAssetTrialAsset
- (BOOL)downloading;
- (BOOL)locallyAvailable;
- (BOOL)purgeable;
- (NSArray)supportedLanguages;
- (NSBundle)bundle;
- (NSNumber)diskSize;
- (NSNumber)downloadSize;
- (NSString)versionDescription;
- (TTSAssetSource)assetSource;
- (_TtC14SiriTTSService18TTSAssetTrialAsset)init;
- (int64_t)purgeCondition;
- (int64_t)versionNumber;
- (void)cancelDownloadingThen:(id)a3;
- (void)downloadWithReservation:(id)a3 useBattery:(BOOL)a4 progress:(id)a5 then:(id)a6;
- (void)purge;
- (void)purgeImmediately:(BOOL)a3;
- (void)setPurgeCondition:(int64_t)a3;
@end

@implementation TTSAssetTrialAsset

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC14SiriTTSService18TTSAssetTrialAsset_progressQueue);
}

- (TTSAssetSource)assetSource
{
  v2 = self;
  id v3 = sub_19CDAD858(&qword_1EB533D50, (void **)&qword_1EB533D10);

  return (TTSAssetSource *)v3;
}

- (NSArray)supportedLanguages
{
  v2 = self;
  sub_19CDAFCC0();

  id v3 = (void *)sub_19CED5530();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (int64_t)versionNumber
{
  v2 = self;
  sub_19CDB1A18();
  int64_t v4 = v3;

  return v4;
}

- (NSString)versionDescription
{
  return (NSString *)sub_19CDB068C(self, (uint64_t)a2, (void (*)(void))sub_19CD9EB2C);
}

- (BOOL)locallyAvailable
{
  return sub_19CDB6914();
}

- (NSNumber)downloadSize
{
  v2 = self;
  id v3 = sub_19CDF7EA8();

  return (NSNumber *)v3;
}

- (NSNumber)diskSize
{
  v2 = self;
  sub_19CDF812C();
  int64_t v4 = v3;

  return (NSNumber *)v4;
}

- (NSBundle)bundle
{
  v2 = self;
  id v3 = sub_19CDF83DC();

  return (NSBundle *)v3;
}

- (BOOL)downloading
{
  v2 = self;
  char v3 = sub_19CDF8488();

  return v3 & 1;
}

- (BOOL)purgeable
{
  v2 = self;
  unsigned __int8 v3 = sub_19CDF8564();

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
  sub_19CDF92A0((uint64_t)v14, v15, a4, (uint64_t)sub_19CDFD668, v12, (uint64_t)sub_19CDFD81C, v13);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)cancelDownloadingThen:(id)a3
{
  int64_t v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_19CDF9ED0((char *)v5, (void (**)(void, void))v4);
  _Block_release(v4);
}

- (void)purge
{
  v2 = self;
  sub_19CDFA5A0();
}

- (void)purgeImmediately:(BOOL)a3
{
  int64_t v4 = self;
  sub_19CDFAA70(a3);
}

- (void)setPurgeCondition:(int64_t)a3
{
  int64_t v4 = self;
  sub_19CDFAF90(a3);
}

- (int64_t)purgeCondition
{
  v2 = self;
  int64_t v3 = sub_19CDFB180();

  return v3;
}

- (_TtC14SiriTTSService18TTSAssetTrialAsset)init
{
}

@end