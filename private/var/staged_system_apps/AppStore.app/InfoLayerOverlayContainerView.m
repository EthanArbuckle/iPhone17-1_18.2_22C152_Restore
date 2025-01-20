@interface InfoLayerOverlayContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore29InfoLayerOverlayContainerView)initWithCoder:(id)a3;
- (_TtC8AppStore29InfoLayerOverlayContainerView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation InfoLayerOverlayContainerView

- (void)layoutSubviews
{
  v2 = self;
  sub_10001B118();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_100056BB8(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (_TtC8AppStore29InfoLayerOverlayContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29InfoLayerOverlayContainerView *)sub_1000119E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29InfoLayerOverlayContainerView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1006A26FC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29InfoLayerOverlayContainerView_overlayView));
}

@end