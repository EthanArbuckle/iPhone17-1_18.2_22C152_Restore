@interface LeagueStandingsCard
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI19LeagueStandingsCard)initWithCoder:(id)a3;
- (_TtC8VideosUI19LeagueStandingsCard)initWithFrame:(CGRect)a3;
- (void)contentSizeCategoryDidChange;
- (void)dealloc;
- (void)vui_prepareForReuse;
@end

@implementation LeagueStandingsCard

- (_TtC8VideosUI19LeagueStandingsCard)initWithFrame:(CGRect)a3
{
  return (_TtC8VideosUI19LeagueStandingsCard *)sub_1E2FD6CAC();
}

- (_TtC8VideosUI19LeagueStandingsCard)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E2FD6DD4();
}

- (void)dealloc
{
  v2 = self;
  sub_1E2FD6EA8();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI19LeagueStandingsCard_hostingView));
  swift_release();
}

- (void)contentSizeCategoryDidChange
{
  v2 = self;
  sub_1E2FD701C();
}

- (void)vui_prepareForReuse
{
  v2 = self;
  sub_1E2FD74D0();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  OUTLINED_FUNCTION_5_1();
  id v6 = v5;
  double v7 = OUTLINED_FUNCTION_11_2();
  double v9 = sub_1E2FD7628(a4, v7, v8);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

@end