@interface ExpandTapAction
- (_TtC15PromotedContent15ExpandTapAction)initWithActionType:(int64_t)a3 confirmedClickInterval:(double)a4;
@end

@implementation ExpandTapAction

- (_TtC15PromotedContent15ExpandTapAction)initWithActionType:(int64_t)a3 confirmedClickInterval:(double)a4
{
  result = (_TtC15PromotedContent15ExpandTapAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC15PromotedContent15ExpandTapAction_expandedDestinationURL;
  uint64_t v4 = sub_1B5CB2FC0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC15PromotedContent15ExpandTapAction_delegate;
  sub_1B5C16D70((uint64_t)v5);
}

@end