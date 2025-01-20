@interface ColorBackgroundSeparatorDecorationView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI38ColorBackgroundSeparatorDecorationView)initWithCoder:(id)a3;
- (_TtC8VideosUI38ColorBackgroundSeparatorDecorationView)initWithFrame:(CGRect)a3;
@end

@implementation ColorBackgroundSeparatorDecorationView

- (_TtC8VideosUI38ColorBackgroundSeparatorDecorationView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI38ColorBackgroundSeparatorDecorationView *)sub_1E3712B00();
}

- (_TtC8VideosUI38ColorBackgroundSeparatorDecorationView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3712CB4();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E3712D48(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI38ColorBackgroundSeparatorDecorationView_lineView));
}

@end