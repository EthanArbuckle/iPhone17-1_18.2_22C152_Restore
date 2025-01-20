@interface FeedHeadlinePlaybackCommandHandler
- (_TtC7NewsUI234FeedHeadlinePlaybackCommandHandler)init;
- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4;
@end

@implementation FeedHeadlinePlaybackCommandHandler

- (_TtC7NewsUI234FeedHeadlinePlaybackCommandHandler)init
{
  result = (_TtC7NewsUI234FeedHeadlinePlaybackCommandHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7NewsUI234FeedHeadlinePlaybackCommandHandler_readingHistory));
  sub_1DEB1DDEC((uint64_t)self + OBJC_IVAR____TtC7NewsUI234FeedHeadlinePlaybackCommandHandler_commandCenter);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI234FeedHeadlinePlaybackCommandHandler_audioPlaybackContext);
  swift_release();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  sub_1DEA69724();
  uint64_t v6 = sub_1DFDFDAF0();
  id v7 = a3;
  v8 = self;
  sub_1DFB736E0(v6);

  swift_bridgeObjectRelease();
}

@end