@interface MediaShowcaseHostingView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI24MediaShowcaseHostingView)initWithCoder:(id)a3;
- (_TtC8VideosUI24MediaShowcaseHostingView)initWithFrame:(CGRect)a3;
@end

@implementation MediaShowcaseHostingView

- (_TtC8VideosUI24MediaShowcaseHostingView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI24MediaShowcaseHostingView *)sub_1E3663FA8();
}

- (_TtC8VideosUI24MediaShowcaseHostingView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E366402C();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1E36640C0(a4, width, height);
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
}

@end