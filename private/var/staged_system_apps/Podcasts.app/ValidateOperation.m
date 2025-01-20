@interface ValidateOperation
- (_TtC8Podcasts17ValidateOperation)init;
@end

@implementation ValidateOperation

- (_TtC8Podcasts17ValidateOperation)init
{
  result = (_TtC8Podcasts17ValidateOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100050358(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts17ValidateOperation_input), self->super.lock[OBJC_IVAR____TtC8Podcasts17ValidateOperation_input]);
  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts17ValidateOperation_source;
  uint64_t v4 = type metadata accessor for URL();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8Podcasts17ValidateOperation_origin, v4);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v6 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Podcasts17ValidateOperation_log);
}

@end