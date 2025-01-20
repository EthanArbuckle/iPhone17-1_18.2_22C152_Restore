@interface ReadingListObserver
- (_TtC12NewsArticles19ReadingListObserver)init;
- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6;
@end

@implementation ReadingListObserver

- (_TtC12NewsArticles19ReadingListObserver)init
{
  result = (_TtC12NewsArticles19ReadingListObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t v8 = sub_1BF7E3C78();
  id v9 = a3;
  v10 = self;
  sub_1BF4F39E8(v8);

  swift_bridgeObjectRelease();
}

@end