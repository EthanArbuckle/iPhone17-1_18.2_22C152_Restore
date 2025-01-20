@interface ErrorContentView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (UIView)accessibilityDescriptionView;
- (UIView)accessibilityTitleView;
- (_TtC8VideosUI16ErrorContentView)initWithCoder:(id)a3;
- (_TtC8VideosUI16ErrorContentView)initWithFrame:(CGRect)a3;
@end

@implementation ErrorContentView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E31D51D8(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (UIView)accessibilityTitleView
{
  v2 = self;
  v3 = (void *)sub_1E31D585C();

  return (UIView *)v3;
}

- (UIView)accessibilityDescriptionView
{
  v2 = self;
  v3 = (void *)sub_1E31D58D4();

  return (UIView *)v3;
}

- (_TtC8VideosUI16ErrorContentView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI16ErrorContentView *)sub_1E31D5908();
}

- (_TtC8VideosUI16ErrorContentView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI16ErrorContentView *)sub_1E31D59B4(a3);
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16ErrorContentView_descriptionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI16ErrorContentView_debugTextView));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8VideosUI16ErrorContentView_debugTextView2);
}

@end