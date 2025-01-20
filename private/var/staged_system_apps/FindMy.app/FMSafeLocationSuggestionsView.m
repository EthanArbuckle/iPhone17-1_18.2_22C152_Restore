@interface FMSafeLocationSuggestionsView
- (_TtC6FindMy29FMSafeLocationSuggestionsView)init;
- (_TtC6FindMy29FMSafeLocationSuggestionsView)initWithCoder:(id)a3;
- (void)locationRowTapWithSender:(id)a3;
@end

@implementation FMSafeLocationSuggestionsView

- (_TtC6FindMy29FMSafeLocationSuggestionsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004F67DC();
}

- (void)locationRowTapWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1004F4494(v4);
}

- (_TtC6FindMy29FMSafeLocationSuggestionsView)init
{
  result = (_TtC6FindMy29FMSafeLocationSuggestionsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy29FMSafeLocationSuggestionsView_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end