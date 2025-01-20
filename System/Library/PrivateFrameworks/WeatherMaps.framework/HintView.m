@interface HintView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC11WeatherMaps8HintView)initWithCoder:(id)a3;
- (_TtC11WeatherMaps8HintView)initWithFrame:(CGRect)a3;
- (void)dismissTapped;
- (void)layoutSubviews;
@end

@implementation HintView

- (_TtC11WeatherMaps8HintView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A241A98();
}

- (void)dismissTapped
{
  v2 = self;
  sub_20A241E40();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_20A240DDC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_20A24298C();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC11WeatherMaps8HintView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11WeatherMaps8HintView_onDismissHandler);
  sub_20A1E59F0(v3);
}

@end