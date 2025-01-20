@interface LeagueRankView
- (CGSize)intrinsicContentSize;
- (_TtC8VideosUI14LeagueRankView)initWithCoder:(id)a3;
- (_TtC8VideosUI14LeagueRankView)initWithFrame:(CGRect)a3;
@end

@implementation LeagueRankView

- (_TtC8VideosUI14LeagueRankView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E3386B4C();
}

- (_TtC8VideosUI14LeagueRankView)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI14LeagueRankView *)sub_1E3386BDC();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1E3386CF0();
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
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14LeagueRankView____lazy_storage___mainContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14LeagueRankView_indicatorView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14LeagueRankView_rankTextView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14LeagueRankView____lazy_storage___favoritesSpacer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI14LeagueRankView____lazy_storage___indicatorSpacer));
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8VideosUI14LeagueRankView____lazy_storage___rankSpacer);
}

@end