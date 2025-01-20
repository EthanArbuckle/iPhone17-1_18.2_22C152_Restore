@interface VerticalStackView.ExpandableView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtCC8VideosUI17VerticalStackView14ExpandableView)initWithCoder:(id)a3;
- (_TtCC8VideosUI17VerticalStackView14ExpandableView)initWithFrame:(CGRect)a3;
@end

@implementation VerticalStackView.ExpandableView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  double v8 = sub_1E374E34C(a4, width, height);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtCC8VideosUI17VerticalStackView14ExpandableView)initWithFrame:(CGRect)a3
{
  return (_TtCC8VideosUI17VerticalStackView14ExpandableView *)sub_1E374EA24();
}

- (_TtCC8VideosUI17VerticalStackView14ExpandableView)initWithCoder:(id)a3
{
  return (_TtCC8VideosUI17VerticalStackView14ExpandableView *)sub_1E374EAAC(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC8VideosUI17VerticalStackView14ExpandableView____lazy_storage___scrollView);
}

@end