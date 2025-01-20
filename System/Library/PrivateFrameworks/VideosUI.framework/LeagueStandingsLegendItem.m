@interface LeagueStandingsLegendItem
- (CGSize)intrinsicContentSize;
- (_TtC8VideosUI25LeagueStandingsLegendItem)initWithCoder:(id)a3;
- (_TtC8VideosUI25LeagueStandingsLegendItem)initWithFrame:(CGRect)a3;
@end

@implementation LeagueStandingsLegendItem

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1E35F07B0();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC8VideosUI25LeagueStandingsLegendItem)initWithCoder:(id)a3
{
  return 0;
}

- (_TtC8VideosUI25LeagueStandingsLegendItem)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI25LeagueStandingsLegendItem____lazy_storage___mainStack));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI25LeagueStandingsLegendItem_indicatorView);
}

@end