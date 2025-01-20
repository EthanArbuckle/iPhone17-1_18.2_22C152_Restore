@interface HistoryFeedDataManager
- (_TtC7NewsUI222HistoryFeedDataManager)init;
- (void)dealloc;
- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4;
- (void)readingHistory:(id)a3 didChangeOffensiveStateForArticlesWithIDs:(id)a4;
- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4;
- (void)readingHistoryDidClear:(id)a3;
- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6;
@end

@implementation HistoryFeedDataManager

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_readingList);
  v5 = self;
  objc_msgSend(v4, sel_removeObserver_, v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(HistoryFeedDataManager *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_headlineService);
  swift_release();
  swift_release();
  swift_release();
}

- (_TtC7NewsUI222HistoryFeedDataManager)init
{
  result = (_TtC7NewsUI222HistoryFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
}

- (void)readingHistoryDidClear:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DFB46938();
}

- (void)readingHistory:(id)a3 didChangeOffensiveStateForArticlesWithIDs:(id)a4
{
  uint64_t v6 = sub_1DFDFE220();
  id v7 = a3;
  v12 = self;
  uint64_t v8 = sub_1DE9DB9D8(v6);
  v9 = (char *)v12 + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_delegate;
  if (MEMORY[0x1E01EFB70]((char *)v12 + OBJC_IVAR____TtC7NewsUI222HistoryFeedDataManager_delegate))
  {
    uint64_t v10 = *((void *)v9 + 1);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(_TtC7NewsUI222HistoryFeedDataManager *, _UNKNOWN **, uint64_t, uint64_t, uint64_t))(v10 + 16))(v12, &off_1F3AC76B8, v8, ObjectType, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t v8 = sub_1DFDFE220();
  sub_1DFDFE220();
  id v9 = a3;
  uint64_t v10 = self;
  sub_1DFB46A34(v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end