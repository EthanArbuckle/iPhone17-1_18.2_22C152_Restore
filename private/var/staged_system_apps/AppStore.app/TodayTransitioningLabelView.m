@interface TodayTransitioningLabelView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore27TodayTransitioningLabelView)initWithCoder:(id)a3;
- (_TtC8AppStore27TodayTransitioningLabelView)initWithFrame:(CGRect)a3;
- (void)layoutDirectionDidChange;
- (void)layoutSubviews;
@end

@implementation TodayTransitioningLabelView

- (void)layoutSubviews
{
  v2 = self;
  sub_100059D4C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_fadeInLabel))
    [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_fadeInLabel) sizeThatFits:a3.width, a3.height];
  else {
    [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_label) sizeThatFits:a3.width, a3.height];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC8AppStore27TodayTransitioningLabelView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000E9758();
}

- (void)layoutDirectionDidChange
{
  v2 = self;
  sub_1000E909C();
}

- (_TtC8AppStore27TodayTransitioningLabelView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC8AppStore27TodayTransitioningLabelView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_fadeInLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_defaultFont));
  sub_10006012C(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8AppStore27TodayTransitioningLabelView_applyPendingFontChange));

  swift_bridgeObjectRelease();
}

@end