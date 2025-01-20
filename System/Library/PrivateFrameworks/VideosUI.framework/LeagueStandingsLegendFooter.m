@interface LeagueStandingsLegendFooter
- (CGSize)intrinsicContentSize;
- (_TtC8VideosUI27LeagueStandingsLegendFooter)initWithCoder:(id)a3;
- (_TtC8VideosUI27LeagueStandingsLegendFooter)initWithFrame:(CGRect)a3;
@end

@implementation LeagueStandingsLegendFooter

- (_TtC8VideosUI27LeagueStandingsLegendFooter)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI27LeagueStandingsLegendFooter *)sub_1E37279D0();
}

- (_TtC8VideosUI27LeagueStandingsLegendFooter)initWithCoder:(id)a3
{
  return 0;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1E3727D80();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI27LeagueStandingsLegendFooter_legendView);
}

@end