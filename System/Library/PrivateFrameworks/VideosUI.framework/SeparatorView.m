@interface SeparatorView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI13SeparatorView)initWithCoder:(id)a3;
- (_TtC8VideosUI13SeparatorView)initWithFrame:(CGRect)a3;
@end

@implementation SeparatorView

- (_TtC8VideosUI13SeparatorView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI13SeparatorView *)sub_1E37AE500();
}

- (_TtC8VideosUI13SeparatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E37AE6C4();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  double v7 = sub_1E37AE7E8(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8VideosUI13SeparatorView_lineView);
}

@end