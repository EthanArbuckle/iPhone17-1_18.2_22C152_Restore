@interface EpisodeSectionHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI24EpisodeSectionHeaderView)initWithCoder:(id)a3;
- (_TtC8VideosUI24EpisodeSectionHeaderView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation EpisodeSectionHeaderView

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v4 = self;
  double v5 = sub_1E34CDDF0(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E34CE020();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double width = a3.width;
  double v6 = self;
  double v7 = sub_1E34CDDF8(a4, width);
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (_TtC8VideosUI24EpisodeSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI24EpisodeSectionHeaderView *)sub_1E34CE110();
}

- (_TtC8VideosUI24EpisodeSectionHeaderView)initWithCoder:(id)a3
{
  return (_TtC8VideosUI24EpisodeSectionHeaderView *)sub_1E34CE19C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24EpisodeSectionHeaderView_buttonView));
  swift_release();
}

@end