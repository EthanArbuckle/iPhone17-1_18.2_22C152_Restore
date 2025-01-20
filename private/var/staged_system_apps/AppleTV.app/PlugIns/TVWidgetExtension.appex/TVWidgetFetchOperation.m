@interface TVWidgetFetchOperation
- (_TtC17TVWidgetExtension22TVWidgetFetchOperation)init;
- (void)dealloc;
@end

@implementation TVWidgetFetchOperation

- (void)dealloc
{
  v2 = self;
  sub_1000A4130();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetFetchOperation_context;
  uint64_t v4 = sub_1000E5860();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000147B8((uint64_t)self + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetFetchOperation__widgetEntry, &qword_10012D448);
  sub_1000147B8((uint64_t)self + OBJC_IVAR____TtC17TVWidgetExtension22TVWidgetFetchOperation__suggestedRefreshDate, &qword_100129F30);

  swift_errorRelease();
}

- (_TtC17TVWidgetExtension22TVWidgetFetchOperation)init
{
  result = (_TtC17TVWidgetExtension22TVWidgetFetchOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end