@interface HistoryService
- (_TtC7NewsUI214HistoryService)init;
- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
- (void)readingHistory:(id)a3 didChangeOffensiveStateForArticlesWithIDs:(id)a4;
- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4;
@end

@implementation HistoryService

- (_TtC7NewsUI214HistoryService)init
{
  result = (_TtC7NewsUI214HistoryService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI214HistoryService_headlineModelFactory);
  v3 = (char *)self + OBJC_IVAR____TtC7NewsUI214HistoryService_headlineService;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  if (a4)
  {
    sub_1DE919914(0, (unint64_t *)&qword_1EBABB070);
    uint64_t v6 = sub_1DFDFDAF0();
    id v7 = a3;
    v8 = self;
    uint64_t v9 = sub_1DEC79C80(v6);
    __swift_project_boxed_opaque_existential_1((Class *)((char *)&v8->super.isa + OBJC_IVAR____TtC7NewsUI214HistoryService_headlineService), *(void *)&v8->issueReadingHistory[OBJC_IVAR____TtC7NewsUI214HistoryService_headlineService]);
    uint64_t v10 = *MEMORY[0x1E4F7DFD8];
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v8;
    v12 = v8;
    sub_1DF85BC74(v9, v10, 17, (uint64_t)sub_1DF60DEFC, v11);

    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
  if (a4) {
    uint64_t v6 = sub_1DFDFE220();
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = a3;
  v8 = self;
  sub_1DF60C380(a3, v6);

  swift_bridgeObjectRelease();
}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
}

- (void)readingHistory:(id)a3 didChangeOffensiveStateForArticlesWithIDs:(id)a4
{
}

@end