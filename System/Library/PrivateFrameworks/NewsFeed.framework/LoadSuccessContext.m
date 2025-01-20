@interface LoadSuccessContext
- (_TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadSuccessContext)init;
@end

@implementation LoadSuccessContext

- (_TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadSuccessContext)init
{
  result = (_TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadSuccessContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadSuccessContext_startDate;
  uint64_t v4 = sub_1C151631C();
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8NewsFeedP33_898A0B03A217A95A42970FA509579B3F18LoadSuccessContext_endDate;
  v6(v5, v4);
}

@end