@interface BKPersonalizationEventDonor
- (BKPersonalizationEventDonor)init;
- (BKPersonalizationEventDonor)initWithType:(id)a3;
- (void)configurationDidChange:(id)a3;
- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5;
- (void)finishedBook:(id)a3;
- (void)setupWithLibraryManager:(id)a3;
@end

@implementation BKPersonalizationEventDonor

- (BKPersonalizationEventDonor)init
{
  sub_1007FA220();
  v2 = (void *)sub_1007FA210();
  id v3 = objc_allocWithZone((Class)type metadata accessor for PersonalizationEventDonor());
  v4 = (BKPersonalizationEventDonor *)sub_100034088(0xD000000000000021, 0x800000010091A100, v2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)configurationDidChange:(id)a3
{
}

- (BKPersonalizationEventDonor)initWithType:(id)a3
{
  uint64_t v3 = sub_1007FDC70();
  uint64_t v5 = v4;
  sub_1007FA220();
  v6 = (void *)sub_1007FA210();
  id v7 = objc_allocWithZone((Class)type metadata accessor for PersonalizationEventDonor());
  v8 = (BKPersonalizationEventDonor *)sub_100034088(v3, v5, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (void)setupWithLibraryManager:(id)a3
{
  v8[3] = sub_10004A860(0, (unint64_t *)&qword_100B331E0);
  v8[4] = &off_100A6F950;
  v8[0] = a3;
  uint64_t v5 = &self->BMBaseDonor_opaque[OBJC_IVAR___BKPersonalizationEventDonor_libraryAssetProvider];
  swift_beginAccess();
  id v6 = a3;
  id v7 = self;
  sub_1004E1E44((uint64_t)v8, (uint64_t)v5);
  swift_endAccess();
}

- (void)donateWithConfiguration:(id)a3 context:(id)a4 donationCompleteBlock:(id)a5
{
  v8 = _Block_copy(a5);
  if (a4)
  {
    uint64_t v9 = sub_1007FDC70();
    a4 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  _Block_copy(v8);
  id v11 = a3;
  v12 = self;
  sub_1004E0E84(v11, v9, (uint64_t)a4, v12, (void (**)(void, void))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
  sub_10005AFE8((uint64_t)&self->BMBaseDonor_opaque[OBJC_IVAR___BKPersonalizationEventDonor_libraryAssetProvider], &qword_100B37B80);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)finishedBook:(id)a3
{
}

@end