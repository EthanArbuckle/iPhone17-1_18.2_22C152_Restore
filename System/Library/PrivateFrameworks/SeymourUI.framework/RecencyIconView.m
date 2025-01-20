@interface RecencyIconView
- (CGSize)intrinsicContentSize;
- (NSLayoutYAxisAnchor)firstBaselineAnchor;
- (NSLayoutYAxisAnchor)lastBaselineAnchor;
- (UIView)viewForLastBaselineLayout;
- (_TtC9SeymourUI15RecencyIconView)initWithCoder:(id)a3;
- (_TtC9SeymourUI15RecencyIconView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)layoutSubviews;
@end

@implementation RecencyIconView

- (NSLayoutYAxisAnchor)firstBaselineAnchor
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_label), sel_firstBaselineAnchor);

  return (NSLayoutYAxisAnchor *)v2;
}

- (NSLayoutYAxisAnchor)lastBaselineAnchor
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_label), sel_lastBaselineAnchor);

  return (NSLayoutYAxisAnchor *)v2;
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_label));
}

- (CGSize)intrinsicContentSize
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_label);
  v3 = self;
  objc_msgSend(v2, sel_intrinsicContentSize);
  double v5 = *(double *)((char *)&v3->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_layout);
  double v6 = v4
     + *(double *)((char *)&v3->super.super.__layeringSceneIdentity + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_layout)
     + *(double *)((char *)&v3->super._cachedTraitCollection + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_layout);
  double v8 = v7 + *(double *)((char *)&v3->super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_layout);

  double v9 = v8 + v5;
  double v10 = v6;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_239DABBD0();
}

- (void)didMoveToSuperview
{
  id v2 = self;
  sub_239DABCE8();
}

- (_TtC9SeymourUI15RecencyIconView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239DAC7C0();
}

- (_TtC9SeymourUI15RecencyIconView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC9SeymourUI15RecencyIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI15RecencyIconView_layoutView);
}

@end