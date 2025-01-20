@interface FullScreenRouteView
- (_TtC7Journal19FullScreenRouteView)initWithCoder:(id)a3;
- (_TtC7Journal19FullScreenRouteView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenRouteView

- (_TtC7Journal19FullScreenRouteView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal19FullScreenRouteView *)sub_10041247C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal19FullScreenRouteView)initWithCoder:(id)a3
{
  return (_TtC7Journal19FullScreenRouteView *)sub_1004125A0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal19FullScreenRouteView_backgroundView));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal19FullScreenRouteView_dropShadowView);
}

@end