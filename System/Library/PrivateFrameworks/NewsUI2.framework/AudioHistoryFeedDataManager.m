@interface AudioHistoryFeedDataManager
- (_TtC7NewsUI227AudioHistoryFeedDataManager)init;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
@end

@implementation AudioHistoryFeedDataManager

- (_TtC7NewsUI227AudioHistoryFeedDataManager)init
{
  result = (_TtC7NewsUI227AudioHistoryFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioHistoryFeedDataManager_delegate);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioHistoryFeedDataManager_headlineService);

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI227AudioHistoryFeedDataManager_accessQueue);
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  sub_1DE919914(0, (unint64_t *)&qword_1EBABB070);
  sub_1DFDFDAF0();
  id v6 = a3;
  v7 = self;
  sub_1DEEBE018(v6);

  swift_bridgeObjectRelease();
}

@end