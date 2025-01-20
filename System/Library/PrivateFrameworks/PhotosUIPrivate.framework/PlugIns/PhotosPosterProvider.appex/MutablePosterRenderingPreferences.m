@interface MutablePosterRenderingPreferences
- (BOOL)hideChrome;
- (BOOL)userTapEventsRequested;
- (UIColor)statusBarTintColor;
- (UIColor)timeColor;
- (UIFont)timeFont;
- (_TtC20PhotosPosterProvider33MutablePosterRenderingPreferences)init;
- (unint64_t)significantEventOptions;
- (unint64_t)significantEventTime;
- (void)setSignificantEventOptions:(unint64_t)a3;
- (void)setSignificantEventTime:(unint64_t)a3;
- (void)setStatusBarTintColor:(id)a3;
- (void)setTimeColor:(id)a3;
- (void)setTimeFont:(id)a3;
- (void)setUserTapEventsRequested:(BOOL)a3;
@end

@implementation MutablePosterRenderingPreferences

- (BOOL)userTapEventsRequested
{
  return sub_100003D2C() & 1;
}

- (void)setUserTapEventsRequested:(BOOL)a3
{
}

- (UIFont)timeFont
{
  v2 = self;
  id v3 = sub_100003E04();

  return (UIFont *)v3;
}

- (void)setTimeFont:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100003EA0();
}

- (UIColor)timeColor
{
  v2 = self;
  id v3 = sub_100003F30();

  return (UIColor *)v3;
}

- (void)setTimeColor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100003FCC();
}

- (UIColor)statusBarTintColor
{
  v2 = self;
  id v3 = sub_10000405C();

  return (UIColor *)v3;
}

- (void)setStatusBarTintColor:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000040F8();
}

- (unint64_t)significantEventTime
{
  v2 = self;
  id v3 = sub_100004178();

  return (unint64_t)v3;
}

- (void)setSignificantEventTime:(unint64_t)a3
{
  id v4 = self;
  sub_1000041E4(a3);
}

- (unint64_t)significantEventOptions
{
  v2 = self;
  unint64_t v3 = sub_100004234();

  return v3;
}

- (void)setSignificantEventOptions:(unint64_t)a3
{
  id v4 = self;
  sub_1000042FC(a3);
}

- (BOOL)hideChrome
{
  return 0;
}

- (_TtC20PhotosPosterProvider33MutablePosterRenderingPreferences)init
{
}

- (void).cxx_destruct
{
}

@end