@interface ComposeButtonsView
- (_TtC7Journal18ComposeButtonsView)initWithCoder:(id)a3;
- (_TtC7Journal18ComposeButtonsView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)updateTransparencyEffects;
@end

@implementation ComposeButtonsView

- (_TtC7Journal18ComposeButtonsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10002D6A8();
}

- (_TtC7Journal18ComposeButtonsView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal18ComposeButtonsView *)sub_10002C5EC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18ComposeButtonsView_floatingButtons);
  id v8 = a4;
  v9 = self;
  -[ComposeButtonsView convertPoint:toCoordinateSpace:](v9, "convertPoint:toCoordinateSpace:", v7, x, y);
  id v10 = [v7 hitTest:v8];

  return v10;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ComposeButtonsView();
  v2 = (char *)v5.receiver;
  [(ComposeButtonsView *)&v5 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC7Journal18ComposeButtonsView_blurEffectView];
  id v4 = *(id *)&v2[OBJC_IVAR____TtC7Journal18ComposeButtonsView_blurGradientLayer];
  [v3 bounds];
  [v4 setFrame:];
}

- (void)updateTransparencyEffects
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18ComposeButtonsView_blurView);
  id v3 = self;
  [v2 setHidden:UIAccessibilityIsReduceTransparencyEnabled()];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18ComposeButtonsView_blurGradientLayer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18ComposeButtonsView_floatingButtons));

  id v3 = (char *)self + OBJC_IVAR____TtC7Journal18ComposeButtonsView_delegate;

  sub_1000109BC((uint64_t)v3);
}

@end