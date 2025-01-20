@interface OrdinalListCell
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI15OrdinalListCell)initWithCoder:(id)a3;
- (_TtC8VideosUI15OrdinalListCell)initWithFrame:(CGRect)a3;
- (id)zoomSourceView;
@end

@implementation OrdinalListCell

- (_TtC8VideosUI15OrdinalListCell)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI15OrdinalListCell *)sub_1E3615C44();
}

- (_TtC8VideosUI15OrdinalListCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3615D44();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  v6 = self;
  double v7 = sub_1E3615E08(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15OrdinalListCell_numberLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15OrdinalListCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15OrdinalListCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15OrdinalListCell_cellImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI15OrdinalListCell____lazy_storage___bottomSeparatorView);
}

- (id)zoomSourceView
{
  v2 = self;
  id v3 = (void *)sub_1E3617758();

  return v3;
}

@end