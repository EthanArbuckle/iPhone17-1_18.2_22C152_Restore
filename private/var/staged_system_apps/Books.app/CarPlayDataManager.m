@interface CarPlayDataManager
- (_TtC5Books18CarPlayDataManager)init;
- (void)dealloc;
- (void)libraryProvider:(id)a3 contentDidChange:(id)a4;
- (void)libraryProvider:(id)a3 contentDidLoad:(id)a4;
- (void)player:(id)a3 audiobookDidChange:(id)a4;
- (void)player:(id)a3 audiobookWillChange:(id)a4;
- (void)player:(id)a3 chapterDidChange:(id)a4;
- (void)player:(id)a3 failedWithError:(id)a4;
- (void)player:(id)a3 playbackRateDidChange:(float)a4;
- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5;
@end

@implementation CarPlayDataManager

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18CarPlayDataManager_player);
  v3 = self;
  [v2 removeObserver:v3];
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for CarPlayDataManager();
  [(CarPlayDataManager *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_10023E454((uint64_t)self + OBJC_IVAR____TtC5Books18CarPlayDataManager_delegate);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18CarPlayDataManager_accessQueue);
}

- (_TtC5Books18CarPlayDataManager)init
{
  result = (_TtC5Books18CarPlayDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)libraryProvider:(id)a3 contentDidLoad:(id)a4
{
  sub_10004A860(0, (unint64_t *)&unk_100B2FF20);
  unint64_t v5 = sub_1007FDFF0();
  swift_unknownObjectRetain();
  v6 = self;
  sub_100658E28(v5, 0xD000000000000022, 0x8000000100923FF0, (uint64_t)&unk_100A66AC0, (uint64_t)sub_100659A1C, (uint64_t)&unk_100A66AD8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)libraryProvider:(id)a3 contentDidChange:(id)a4
{
  sub_10004A860(0, (unint64_t *)&unk_100B2FF20);
  unint64_t v5 = sub_1007FDFF0();
  swift_unknownObjectRetain();
  v6 = self;
  sub_100658E28(v5, 0xD000000000000024, 0x8000000100923FC0, (uint64_t)&unk_100A66A70, (uint64_t)sub_100659A0C, (uint64_t)&unk_100A66A88);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)player:(id)a3 audiobookWillChange:(id)a4
{
}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  CarPlayDataManager.player(_:audiobookDidChange:)(a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)player:(id)a3 chapterDidChange:(id)a4
{
}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  if (a5 == 2)
  {
    swift_unknownObjectRetain();
    v7 = self;
    sub_100658524();
    swift_unknownObjectRelease();
  }
}

- (void)player:(id)a3 playbackRateDidChange:(float)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_unknownObjectRetain();
    v7 = self;
    id v8 = [a3 precisionRates];
    sub_10004A860(0, (unint64_t *)&qword_100B2F3B0);
    unint64_t v9 = sub_1007FDFF0();

    sub_1003451BC(v9, a4);
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)player:(id)a3 failedWithError:(id)a4
{
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books18CarPlayDataManager_lastBookAssetID);
  void *v6 = 0;
  v6[1] = 0;
  swift_unknownObjectRetain();
  id v7 = a4;
  id v8 = self;
  swift_bridgeObjectRelease();
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_1003453C8();

    swift_unknownObjectRelease();
  }
  else
  {
  }

  swift_unknownObjectRelease();
}

@end