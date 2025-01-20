@interface FMStatusBar
- (_TtC6FindMy11FMStatusBar)initWithCoder:(id)a3;
- (_TtC6FindMy11FMStatusBar)initWithFrame:(CGRect)a3;
- (void)handleTapWithSender:(id)a3;
- (void)layoutSubviews;
@end

@implementation FMStatusBar

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMStatusBar();
  v2 = (char *)v5.receiver;
  [(FMStatusBar *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC6FindMy11FMStatusBar_pillView];
  [v3 frame];
  [v3 _setContinuousCornerRadius:v4 * 0.5];
}

- (_TtC6FindMy11FMStatusBar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10034CCB0();
}

- (void)handleTapWithSender:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_10034CE74();
}

- (_TtC6FindMy11FMStatusBar)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy11FMStatusBar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy11FMStatusBar_textLabelBottomConstraint);
}

@end