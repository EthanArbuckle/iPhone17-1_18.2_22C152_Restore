@interface MutablePosterRenderingPreferences
- (BOOL)hideChrome;
- (BOOL)userTapEventsRequested;
- (UIColor)statusBarTintColor;
- (UIColor)timeColor;
- (UIFont)timeFont;
- (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences)init;
- (unint64_t)significantEventOptions;
- (unint64_t)significantEventTime;
- (void)setHideChrome:(BOOL)a3;
- (void)setSignificantEventOptions:(unint64_t)a3;
- (void)setSignificantEventTime:(unint64_t)a3;
- (void)setStatusBarTintColor:(id)a3;
- (void)setTimeColor:(id)a3;
- (void)setTimeFont:(id)a3;
- (void)setUserTapEventsRequested:(BOOL)a3;
@end

@implementation MutablePosterRenderingPreferences

- (UIFont)timeFont
{
  v2 = self;
  id v3 = sub_100006F44();

  return (UIFont *)v3;
}

- (void)setTimeFont:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100006FE0(a3);
}

- (UIColor)timeColor
{
  v2 = self;
  id v3 = sub_100007074();

  return (UIColor *)v3;
}

- (void)setTimeColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100007110(a3);
}

- (UIColor)statusBarTintColor
{
  v2 = self;
  id v3 = sub_1000071A4();

  return (UIColor *)v3;
}

- (void)setStatusBarTintColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100007240(a3);
}

- (unint64_t)significantEventTime
{
  v2 = self;
  id v3 = sub_1000072C4();

  return (unint64_t)v3;
}

- (void)setSignificantEventTime:(unint64_t)a3
{
  v4 = self;
  sub_100007330(a3);
}

- (unint64_t)significantEventOptions
{
  v2 = self;
  unint64_t v3 = sub_100007380();

  return v3;
}

- (void)setSignificantEventOptions:(unint64_t)a3
{
  v4 = self;
  sub_100007460(a3);
}

- (BOOL)hideChrome
{
  v2 = self;
  char v3 = sub_100007530();

  return v3 & 1;
}

- (void)setHideChrome:(BOOL)a3
{
  v4 = self;
  sub_1000075AC(a3);
}

- (BOOL)userTapEventsRequested
{
  v2 = self;
  unsigned __int8 v3 = sub_1000075FC();

  return v3 & 1;
}

- (void)setUserTapEventsRequested:(BOOL)a3
{
  v4 = self;
  sub_10000767C(a3);
}

- (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD433MutablePosterRenderingPreferences)init
{
}

- (void).cxx_destruct
{
}

@end