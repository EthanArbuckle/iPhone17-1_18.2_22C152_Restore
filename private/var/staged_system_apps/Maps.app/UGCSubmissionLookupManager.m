@interface UGCSubmissionLookupManager
- (_TtC4Maps26UGCSubmissionLookupManager)init;
- (void)cancelIfNeeded;
- (void)fetchSubmissionWithCommunityIDAndICloudIDFor:(unint64_t)a3 identifierHistory:(id)a4 completion:(id)a5;
- (void)fetchSubmissionWithICloudIDFor:(unint64_t)a3 completion:(id)a4;
@end

@implementation UGCSubmissionLookupManager

- (_TtC4Maps26UGCSubmissionLookupManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps26UGCSubmissionLookupManager_ticket) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UGCSubmissionLookupManager();
  return [(UGCSubmissionLookupManager *)&v3 init];
}

- (void).cxx_destruct
{
}

- (void)fetchSubmissionWithICloudIDFor:(unint64_t)a3 completion:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_1001DC444;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1001DA31C(a3, (void (*)(void, uint64_t))v6, v7);
  sub_10006C5D8((uint64_t)v6);
}

- (void)fetchSubmissionWithCommunityIDAndICloudIDFor:(unint64_t)a3 identifierHistory:(id)a4 completion:(id)a5
{
  uint64_t v7 = (void (*)(void, uint64_t))_Block_copy(a5);
  sub_1001DB5FC();
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v7)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v7;
    uint64_t v7 = sub_1001DB674;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = self;
  sub_1001DA7B4(a3, v8, v7, v9);
  sub_10006C5D8((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)cancelIfNeeded
{
}

@end