@interface NavigationBarView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI17NavigationBarView)initWithCoder:(id)a3;
- (_TtC8VideosUI17NavigationBarView)initWithFrame:(CGRect)a3;
@end

@implementation NavigationBarView

- (_TtC8VideosUI17NavigationBarView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI17NavigationBarView *)sub_1E2FF3A68();
}

- (_TtC8VideosUI17NavigationBarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E2FF3BF0();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v5 = self;
  double v6 = sub_1E2FF3CB8(width);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.double width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17NavigationBarView_navigationBar));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI17NavigationBarView_navigationItem);
}

@end