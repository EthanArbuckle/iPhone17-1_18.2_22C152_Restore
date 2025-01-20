@interface FeedbackCommunityIDManager
+ (_TtC4Maps26FeedbackCommunityIDManager)shared;
- (_TtC4Maps19CommunityIDMapsSync)syncCache;
- (_TtC4Maps26FeedbackCommunityIDManager)init;
- (void)fetchAuthenticationInfoForRAPReportWithReportID:(id)a3 completion:(id)a4;
- (void)fetchAuthenticationInfoForRAPReportWithReportID:(id)a3 shouldIncreaseCount:(BOOL)a4 completion:(id)a5;
- (void)fetchAuthenticationInfoForReviewedPlaceWithMuid:(unint64_t)a3 identifierHistory:(id)a4 shouldIncreaseCount:(BOOL)a5 completion:(id)a6;
@end

@implementation FeedbackCommunityIDManager

+ (_TtC4Maps26FeedbackCommunityIDManager)shared
{
  if (qword_1015CBF18 != -1) {
    swift_once();
  }
  v2 = (void *)qword_101611BA0;

  return (_TtC4Maps26FeedbackCommunityIDManager *)v2;
}

- (_TtC4Maps19CommunityIDMapsSync)syncCache
{
  return (_TtC4Maps19CommunityIDMapsSync *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                   + OBJC_IVAR____TtC4Maps26FeedbackCommunityIDManager_syncCache));
}

- (_TtC4Maps26FeedbackCommunityIDManager)init
{
  uint64_t v2 = OBJC_IVAR____TtC4Maps26FeedbackCommunityIDManager_syncCache;
  uint64_t v3 = qword_1015CBB20;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  v5 = (void *)qword_101611218;
  *(Class *)((char *)&v4->super.isa + v2) = (Class)qword_101611218;
  id v6 = v5;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for FeedbackCommunityIDManager();
  return [(FeedbackCommunityIDManager *)&v8 init];
}

- (void).cxx_destruct
{
}

- (void)fetchAuthenticationInfoForReviewedPlaceWithMuid:(unint64_t)a3 identifierHistory:(id)a4 shouldIncreaseCount:(BOOL)a5 completion:(id)a6
{
  v9 = (uint64_t (*)())_Block_copy(a6);
  sub_100100830(0, (unint64_t *)&qword_1015D5D50);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v9;
    v9 = sub_1001DC444;
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = self;
  v12 = self;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a3;
  *(void *)(v14 + 24) = v9;
  *(void *)(v14 + 32) = v10;
  *(void *)(v14 + 40) = v12;
  *(unsigned char *)(v14 + 48) = a5;
  v17[4] = sub_1002C9280;
  v17[5] = v14;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_1002C6824;
  v17[3] = &unk_1012E2010;
  v15 = _Block_copy(v17);
  v16 = v12;
  sub_1000F4F24((uint64_t)v9);
  swift_release();
  [v11 fetchReviewedPlaceForMUID:a3 withIdentifierHistory:isa completion:v15];
  _Block_release(v15);

  sub_10006C5D8((uint64_t)v9);
  swift_bridgeObjectRelease();
}

- (void)fetchAuthenticationInfoForRAPReportWithReportID:(id)a3 completion:(id)a4
{
  id v6 = (uint64_t (*)())_Block_copy(a4);
  v7 = v6;
  if (a3)
  {
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v9;
    if (v7)
    {
LABEL_3:
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v7;
      v7 = sub_1001DC444;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (v6) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
LABEL_6:
  v11 = self;
  sub_1002C7278(v8, (uint64_t)a3, v7, v10);
  sub_10006C5D8((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)fetchAuthenticationInfoForRAPReportWithReportID:(id)a3 shouldIncreaseCount:(BOOL)a4 completion:(id)a5
{
  uint64_t v8 = (void (*)(uint64_t, uint64_t))_Block_copy(a5);
  v9 = v8;
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v11;
    if (v9)
    {
LABEL_3:
      uint64_t v12 = swift_allocObject();
      *(void *)(v12 + 16) = v9;
      v9 = sub_1001DB674;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (v8) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
LABEL_6:
  v13 = self;
  sub_1002C7438(v10, (uint64_t)a3, a4, (uint64_t)v9, v12);
  sub_10006C5D8((uint64_t)v9);

  swift_bridgeObjectRelease();
}

@end