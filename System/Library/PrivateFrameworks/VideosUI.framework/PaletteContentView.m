@interface PaletteContentView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI18PaletteContentView)initWithCoder:(id)a3;
- (_TtC8VideosUI18PaletteContentView)initWithFrame:(CGRect)a3;
@end

@implementation PaletteContentView

- (_TtC8VideosUI18PaletteContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E347CAAC();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E347CB34(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC8VideosUI18PaletteContentView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI18PaletteContentView_hostedView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8VideosUI18PaletteContentView_trailingView);
}

@end