@interface ContentFetcher
- (_TtC4Tips14ContentFetcher)init;
- (void)appController:(id)a3 loadingContent:(BOOL)a4;
@end

@implementation ContentFetcher

- (void)appController:(id)a3 loadingContent:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_10006AC30(v6, a4);
}

- (_TtC4Tips14ContentFetcher)init
{
  result = (_TtC4Tips14ContentFetcher *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000143B4((uint64_t)self + OBJC_IVAR____TtC4Tips14ContentFetcher_continuation, &qword_1000CA240);
}

@end