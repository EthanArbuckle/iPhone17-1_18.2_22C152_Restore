@interface SoundScapesDataSource
- (_TtC23SoundScapesViewServices21SoundScapesDataSource)init;
- (void)setupDataSourceWithTargetDeviceVersions:(id)a3 andFallbackResidentDeviceVersions:(id)a4;
@end

@implementation SoundScapesDataSource

- (void)setupDataSourceWithTargetDeviceVersions:(id)a3 andFallbackResidentDeviceVersions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = self;
  uint64_t v10 = sub_100029B80();
  uint64_t v8 = sub_100029B80();
  sub_10000A574(v10, v8);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (_TtC23SoundScapesViewServices21SoundScapesDataSource)init
{
  return (_TtC23SoundScapesViewServices21SoundScapesDataSource *)sub_10000F3F8();
}

- (void).cxx_destruct
{
  sub_100010C8C((id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayer));
  sub_1000073A4((uint64_t)self + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayerPeriodicObserver);
  sub_1000073A4((uint64_t)self + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource_demoPlayerEndtimeObserver);
  uint64_t v6 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__playbackProgress;
  uint64_t v2 = sub_1000102A0(&qword_100035860);
  (*(void (**)(char *))(*(void *)(v2 - 8) + 8))((char *)self + v6);
  uint64_t v7 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__selectedSoundScapes;
  uint64_t v12 = sub_1000102A0((uint64_t *)&unk_100035880);
  v13 = *(void (**)(char *))(*(void *)(v12 - 8) + 8);
  v13((char *)self + v7);
  uint64_t v8 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__dismiss;
  uint64_t v3 = sub_1000102A0(&qword_100035898);
  (*(void (**)(char *))(*(void *)(v3 - 8) + 8))((char *)self + v8);
  uint64_t v9 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__soundScapes;
  uint64_t v4 = sub_1000102A0(&qword_1000358B8);
  (*(void (**)(char *))(*(void *)(v4 - 8) + 8))((char *)self + v9);
  uint64_t v10 = OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__status;
  uint64_t v5 = sub_1000102A0(&qword_1000358D0);
  (*(void (**)(char *))(*(void *)(v5 - 8) + 8))((char *)self + v10);
  ((void (*)(char *, uint64_t))v13)((char *)self + OBJC_IVAR____TtC23SoundScapesViewServices21SoundScapesDataSource__nowplayingSoundScapes, v12);
}

@end