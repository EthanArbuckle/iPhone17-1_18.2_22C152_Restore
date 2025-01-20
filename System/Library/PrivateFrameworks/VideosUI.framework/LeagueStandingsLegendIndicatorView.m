@interface LeagueStandingsLegendIndicatorView
- (CGSize)intrinsicContentSize;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI34LeagueStandingsLegendIndicatorView)initWithCoder:(id)a3;
- (_TtC8VideosUI34LeagueStandingsLegendIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LeagueStandingsLegendIndicatorView

- (_TtC8VideosUI34LeagueStandingsLegendIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3428464();
}

- (_TtC8VideosUI34LeagueStandingsLegendIndicatorView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI34LeagueStandingsLegendIndicatorView *)sub_1E34284EC();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  double v3 = sub_1E3428624();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v5 = self;
  double v6 = sub_1E342887C(a4);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1E3428B60();
}

- (void).cxx_destruct
{
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI34LeagueStandingsLegendIndicatorView_indicatorImageView);
}

@end