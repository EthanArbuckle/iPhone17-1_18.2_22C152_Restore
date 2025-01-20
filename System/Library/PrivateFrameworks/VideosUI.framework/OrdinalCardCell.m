@interface OrdinalCardCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (CGSize)vui_sizeThatFits:(CGSize)a3;
- (_TtC8VideosUI15OrdinalCardCell)initWithCoder:(id)a3;
- (_TtC8VideosUI15OrdinalCardCell)initWithFrame:(CGRect)a3;
- (id)zoomSourceView;
@end

@implementation OrdinalCardCell

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = OUTLINED_FUNCTION_11_2();
  CGFloat v5 = sub_1E3326CA8(v4);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4 = self;
  OUTLINED_FUNCTION_11_2();
  sub_1E3327B9C();
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC8VideosUI15OrdinalCardCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI15OrdinalCardCell *)sub_1E33286C4();
}

- (_TtC8VideosUI15OrdinalCardCell)initWithCoder:(id)a3
{
  return (_TtC8VideosUI15OrdinalCardCell *)sub_1E3328770(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15OrdinalCardCell_cellImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15OrdinalCardCell_numberLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15OrdinalCardCell_titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI15OrdinalCardCell_subtitleLabel);
}

- (id)zoomSourceView
{
  v2 = self;
  v3 = (void *)sub_1E3328B74();

  return v3;
}

@end