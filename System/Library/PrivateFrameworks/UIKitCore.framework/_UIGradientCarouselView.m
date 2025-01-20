@interface _UIGradientCarouselView
- (_TtC5UIKit23_UIGradientCarouselView)initWithCoder:(id)a3;
- (_TtC5UIKit23_UIGradientCarouselView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation _UIGradientCarouselView

- (_TtC5UIKit23_UIGradientCarouselView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC5UIKit23_UIGradientCarouselView_animationKey);
  void *v4 = 0xD000000000000010;
  v4[1] = 0x8000000186BAAC90;
  id v5 = a3;

  result = (_TtC5UIKit23_UIGradientCarouselView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for _UIGradientCarouselView();
  v2 = (char *)v7.receiver;
  [(UIView *)&v7 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v7.receiver, v7.super_class);
  double v4 = v3;
  objc_msgSend(v2, sel_bounds);
  if (v4 > v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC5UIKit23_UIGradientCarouselView_gradientLayer], sel_setBounds_, 0.0, 0.0, v6 * 3.0, v6 * 3.0);
  sub_185AEC11C();
}

- (_TtC5UIKit23_UIGradientCarouselView)initWithFrame:(CGRect)a3
{
  result = (_TtC5UIKit23_UIGradientCarouselView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit23_UIGradientCarouselView_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit23_UIGradientCarouselView_gradientLayer));
  swift_bridgeObjectRelease();
}

@end