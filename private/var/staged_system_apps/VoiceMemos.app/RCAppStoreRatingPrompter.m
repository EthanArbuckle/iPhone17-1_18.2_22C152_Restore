@interface RCAppStoreRatingPrompter
- (_TtC10VoiceMemos24RCAppStoreRatingPrompter)init;
- (_TtC10VoiceMemos24RCAppStoreRatingPrompter)initWithSavedRecordingsModel:(id)a3;
- (void)applicationDidEnterForeground;
- (void)promptForRatingIfNeeded;
@end

@implementation RCAppStoreRatingPrompter

- (_TtC10VoiceMemos24RCAppStoreRatingPrompter)initWithSavedRecordingsModel:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC10VoiceMemos24RCAppStoreRatingPrompter____lazy_storage___gatingController;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v5 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC10VoiceMemos24RCAppStoreRatingPrompter_recordingCountProvider);
  id *v5 = a3;
  v5[1] = &off_1002257E8;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for RCAppStoreRatingPrompter();
  id v6 = a3;
  return [(RCAppStoreRatingPrompter *)&v8 init];
}

- (void)applicationDidEnterForeground
{
  uint64_t v3 = sub_100028654(&qword_1002699E0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = self;
  v15 = self;
  id v7 = [v6 currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  if (v8)
  {
    v9 = v15;
  }
  else
  {
    uint64_t v10 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
    v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v12 = v15;
    v11[4] = v15;
    v13 = v12;
    sub_10001E1A8((uint64_t)v5, (uint64_t)&unk_1002669A8, (uint64_t)v11);

    swift_release();
  }
}

- (void)promptForRatingIfNeeded
{
  v2 = self;
  sub_1000F9EE4();
}

- (_TtC10VoiceMemos24RCAppStoreRatingPrompter)init
{
  result = (_TtC10VoiceMemos24RCAppStoreRatingPrompter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000285F8((uint64_t)self + OBJC_IVAR____TtC10VoiceMemos24RCAppStoreRatingPrompter____lazy_storage___gatingController, &qword_100266990);

  swift_unknownObjectRelease();
}

@end