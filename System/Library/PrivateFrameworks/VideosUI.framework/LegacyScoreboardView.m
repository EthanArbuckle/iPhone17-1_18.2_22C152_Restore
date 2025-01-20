@interface LegacyScoreboardView
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (_TtC8VideosUI20LegacyScoreboardView)init;
- (_TtC8VideosUI20LegacyScoreboardView)initWithCoder:(id)a3;
- (_TtC8VideosUI20LegacyScoreboardView)initWithFrame:(CGRect)a3;
@end

@implementation LegacyScoreboardView

- (_TtC8VideosUI20LegacyScoreboardView)init
{
  return (_TtC8VideosUI20LegacyScoreboardView *)sub_1E3244148();
}

- (_TtC8VideosUI20LegacyScoreboardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E32443E8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  v5 = self;
  sub_1E32455B8(a4);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC8VideosUI20LegacyScoreboardView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20LegacyScoreboardView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI20LegacyScoreboardView_materialBackgroundView));
  swift_bridgeObjectRelease();
  swift_release();
}

@end