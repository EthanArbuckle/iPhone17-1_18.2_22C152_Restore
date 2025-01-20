@interface CRLFollowBorderHighlightView
- (_TtC8Freeform28CRLFollowBorderHighlightView)initWithCoder:(id)a3;
- (_TtC8Freeform28CRLFollowBorderHighlightView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CRLFollowBorderHighlightView

- (_TtC8Freeform28CRLFollowBorderHighlightView)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Freeform28CRLFollowBorderHighlightView_defaultCornerRadius) = (Class)0x4030000000000000;
  id v5 = a3;

  result = (_TtC8Freeform28CRLFollowBorderHighlightView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLFollowBorderHighlightView();
  id v2 = v3.receiver;
  [(CRLFollowBorderHighlightView *)&v3 layoutSubviews];
  [v2 setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  objc_super v3 = self;
  sub_100A59A64();
}

- (_TtC8Freeform28CRLFollowBorderHighlightView)initWithFrame:(CGRect)a3
{
  result = (_TtC8Freeform28CRLFollowBorderHighlightView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtC8Freeform28CRLFollowBorderHighlightView_delegate);
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform28CRLFollowBorderHighlightView_color);
}

@end