@interface CountDownProgressView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI21CountDownProgressView)initWithCoder:(id)a3;
- (_TtC8VideosUI21CountDownProgressView)initWithFrame:(CGRect)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation CountDownProgressView

- (_TtC8VideosUI21CountDownProgressView)initWithCoder:(id)a3
{
  return 0;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1E366648C(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (_TtC8VideosUI21CountDownProgressView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CountDownProgressView_imageTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CountDownProgressView_imageSymbolConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI21CountDownProgressView_visualEffectView));
  swift_release();

  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI21CountDownProgressView____lazy_storage___imageView);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1E36666A0((uint64_t)v7, a4);
}

@end