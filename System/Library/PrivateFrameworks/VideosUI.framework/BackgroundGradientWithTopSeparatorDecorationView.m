@interface BackgroundGradientWithTopSeparatorDecorationView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView)initWithCoder:(id)a3;
- (_TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView)initWithFrame:(CGRect)a3;
@end

@implementation BackgroundGradientWithTopSeparatorDecorationView

- (_TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView *)sub_1E34A8140();
}

- (_TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E34A82C0();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1E34A839C(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView_lineView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI48BackgroundGradientWithTopSeparatorDecorationView_gradientView);
}

@end