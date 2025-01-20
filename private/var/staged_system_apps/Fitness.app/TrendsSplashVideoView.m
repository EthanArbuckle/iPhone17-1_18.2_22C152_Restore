@interface TrendsSplashVideoView
- (CGSize)intrinsicContentSize;
- (_TtC10FitnessApp21TrendsSplashVideoView)initWithCoder:(id)a3;
- (_TtC10FitnessApp21TrendsSplashVideoView)initWithFrame:(CGRect)a3;
- (void)configurePlayer;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)teardownPlayer;
@end

@implementation TrendsSplashVideoView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TrendsSplashVideoView();
  v2 = (char *)v5.receiver;
  [(TrendsSplashVideoView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_playerLayer];
  if (v3)
  {
    v4 = v3;
    [v2 bounds];
    [v4 setFrame:];

    v2 = v4;
  }
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_100013ED0();
}

- (void)configurePlayer
{
  v2 = self;
  sub_100044B1C();
}

- (CGSize)intrinsicContentSize
{
  v3 = self;
  v4 = self;
  id v5 = [v3 mainScreen];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v20.origin.x = v7;
  v20.origin.y = v9;
  v20.size.width = v11;
  v20.size.height = v13;
  CGFloat Width = CGRectGetWidth(v20);
  if (qword_10094AE00 != -1) {
    swift_once();
  }
  UIRoundToScale();
  double v16 = v15;

  double v17 = Width;
  double v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (_TtC10FitnessApp21TrendsSplashVideoView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_player) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_playerLayer) = 0;
  type metadata accessor for TrendsSplashVideoView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (_TtC10FitnessApp21TrendsSplashVideoView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC10FitnessApp21TrendsSplashVideoView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_playerLayer));
  v3 = (char *)self + OBJC_IVAR____TtC10FitnessApp21TrendsSplashVideoView_url;
  uint64_t v4 = type metadata accessor for URL();
  id v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)teardownPlayer
{
  v2 = self;
  sub_10020AC5C();
}

@end