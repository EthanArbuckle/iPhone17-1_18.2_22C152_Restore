@interface LoadFailureContext
- (_TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext)init;
@end

@implementation LoadFailureContext

- (_TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext)init
{
  result = (_TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext_startDate;
  uint64_t v4 = sub_1C151631C();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext_endDate, v4);
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadFailureContext_error);
}

@end