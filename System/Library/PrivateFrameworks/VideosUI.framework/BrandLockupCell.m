@interface BrandLockupCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI15BrandLockupCell)initWithCoder:(id)a3;
- (_TtC8VideosUI15BrandLockupCell)initWithFrame:(CGRect)a3;
- (id)zoomSourceView;
- (void)vui_setHighlighted:(BOOL)a3;
@end

@implementation BrandLockupCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  double v7 = sub_1E34CC3D8(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void)vui_setHighlighted:(BOOL)a3
{
  v4 = self;
  sub_1E34CC53C(a3);
}

- (_TtC8VideosUI15BrandLockupCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI15BrandLockupCell *)sub_1E34CC600();
}

- (_TtC8VideosUI15BrandLockupCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI15BrandLockupCell *)sub_1E34CC67C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15BrandLockupCell_brandImageView));
  swift_release();
}

- (id)zoomSourceView
{
  v2 = sub_1E34CC824();
  return v2;
}

@end