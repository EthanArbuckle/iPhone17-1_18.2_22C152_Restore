@interface SegmentedControlView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore20SegmentedControlView)initWithCoder:(id)a3;
- (_TtC8AppStore20SegmentedControlView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)selectedIndexChangedIn:(id)a3;
@end

@implementation SegmentedControlView

- (_TtC8AppStore20SegmentedControlView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore20SegmentedControlView *)sub_10021797C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore20SegmentedControlView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentDidChangeHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC8AppStore20SegmentedControlView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v4 = self;
  [(SegmentedControlView *)v4 layoutMargins];
  CGSize.subtracting(insets:)();
  [*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentedControl) sizeThatFits:];
  CGSize.adding(outsets:)();
  double v6 = v5;

  double v7 = width;
  double v8 = v6;
  result.height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SegmentedControlView();
  v2 = (char *)v10.receiver;
  [(SegmentedControlView *)&v10 layoutSubviews];
  LayoutMarginsAware<>.layoutFrame.getter();
  double Width = CGRectGetWidth(v11);
  v4 = *(void **)&v2[OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentedControl];
  LayoutMarginsAware<>.layoutFrame.getter();
  [v4 sizeThatFits:v5, v6, [v10 receiver], [v10 super_class]];
  double v8 = v7;
  LayoutMarginsAware<>.layoutFrame.getter();
  double MinX = CGRectGetMinX(v12);
  LayoutMarginsAware<>.layoutFrame.getter();
  [v4 setFrame:MinX, (CGRectGetHeight(v13) - v8) * 0.5, Width, v8];
}

- (void)selectedIndexChangedIn:(id)a3
{
  v3 = *(void (**)(id))((char *)&self->super.super.super.isa
                                 + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentDidChangeHandler);
  if (v3)
  {
    id v5 = a3;
    double v6 = self;
    sub_100060050((uint64_t)v3);
    v3(v5);
    sub_10006012C((uint64_t)v3);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentedControl));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8AppStore20SegmentedControlView_segmentDidChangeHandler);

  sub_10006012C(v3);
}

@end