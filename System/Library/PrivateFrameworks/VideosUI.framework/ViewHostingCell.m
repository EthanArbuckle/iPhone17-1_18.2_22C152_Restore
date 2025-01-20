@interface ViewHostingCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI15ViewHostingCell)initWithCoder:(id)a3;
- (_TtC8VideosUI15ViewHostingCell)initWithFrame:(CGRect)a3;
@end

@implementation ViewHostingCell

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v4 = self;
  sub_1E3324CC4();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC8VideosUI15ViewHostingCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI15ViewHostingCell *)sub_1E3325B68();
}

- (_TtC8VideosUI15ViewHostingCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI15ViewHostingCell *)sub_1E3325C00(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15ViewHostingCell_stackView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC8VideosUI15ViewHostingCell____lazy_storage___hostedViewsActionHandler);
  sub_1E2C5FB90(v3);
}

@end