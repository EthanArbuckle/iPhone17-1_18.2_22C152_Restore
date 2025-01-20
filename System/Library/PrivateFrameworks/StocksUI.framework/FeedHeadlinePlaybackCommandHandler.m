@interface FeedHeadlinePlaybackCommandHandler
- (_TtC8StocksUI34FeedHeadlinePlaybackCommandHandler)init;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
@end

@implementation FeedHeadlinePlaybackCommandHandler

- (_TtC8StocksUI34FeedHeadlinePlaybackCommandHandler)init
{
  result = (_TtC8StocksUI34FeedHeadlinePlaybackCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8StocksUI34FeedHeadlinePlaybackCommandHandler_readingHistory));
  sub_20A4380C4((uint64_t)self + OBJC_IVAR____TtC8StocksUI34FeedHeadlinePlaybackCommandHandler_commandCenter);
  v3 = (char *)self + OBJC_IVAR____TtC8StocksUI34FeedHeadlinePlaybackCommandHandler_audioPlaybackContext;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  sub_20A4434F8();
  uint64_t v6 = sub_20A8CE180();
  id v7 = a3;
  v8 = self;
  sub_20A7CC95C(v6);

  swift_bridgeObjectRelease();
}

@end