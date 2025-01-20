@interface FetchFairPlayKeyOperation
- (_TtC8Podcasts25FetchFairPlayKeyOperation)init;
@end

@implementation FetchFairPlayKeyOperation

- (_TtC8Podcasts25FetchFairPlayKeyOperation)init
{
  result = (_TtC8Podcasts25FetchFairPlayKeyOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100050358(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts25FetchFairPlayKeyOperation_input), self->super.lock[OBJC_IVAR____TtC8Podcasts25FetchFairPlayKeyOperation_input]);
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts25FetchFairPlayKeyOperation_episodeLocation;
  uint64_t v4 = type metadata accessor for URL();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end