@interface VerticalStackView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI17VerticalStackView)initWithCoder:(id)a3;
- (_TtC8VideosUI17VerticalStackView)initWithFrame:(CGRect)a3;
- (double)bottomMarginWithBaselineMargin:(double)a3;
@end

@implementation VerticalStackView

- (_TtC8VideosUI17VerticalStackView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI17VerticalStackView *)sub_1E3483640();
}

- (_TtC8VideosUI17VerticalStackView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E34838C4();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = self;
  sub_1E3483964(a4, width, height);
  double v9 = v8;
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  v4 = self;
  double v5 = sub_1E3485108(a3);

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17VerticalStackView_platterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17VerticalStackView____lazy_storage___expandableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17VerticalStackView____lazy_storage___panelView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17VerticalStackView_footerView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17VerticalStackView____lazy_storage___platterContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17VerticalStackView_topPlatterGradient));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17VerticalStackView_bottomExpandableGradient));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI17VerticalStackView_bottomPlatterGradient);
}

@end