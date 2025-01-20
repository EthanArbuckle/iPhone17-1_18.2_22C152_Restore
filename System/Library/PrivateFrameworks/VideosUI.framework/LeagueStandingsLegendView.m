@interface LeagueStandingsLegendView
- (CGSize)intrinsicContentSize;
- (_TtC8VideosUI25LeagueStandingsLegendView)initWithCoder:(id)a3;
- (_TtC8VideosUI25LeagueStandingsLegendView)initWithFrame:(CGRect)a3;
@end

@implementation LeagueStandingsLegendView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1E305C814();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC8VideosUI25LeagueStandingsLegendView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI25LeagueStandingsLegendView *)sub_1E305CA88();
}

- (_TtC8VideosUI25LeagueStandingsLegendView)initWithCoder:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI25LeagueStandingsLegendView____lazy_storage___mainStack);
}

@end