@interface AmbientPhotoFramePlayergroundViewController.PlaygroundPosterMutablePreferences
- (BOOL)hideChrome;
- (BOOL)userTapEventsRequested;
- (UIColor)statusBarTintColor;
- (UIColor)timeColor;
- (UIFont)timeFont;
- (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences)init;
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

@implementation AmbientPhotoFramePlayergroundViewController.PlaygroundPosterMutablePreferences

- (BOOL)userTapEventsRequested
{
  return sub_1AEB8D160() & 1;
}

- (void)setUserTapEventsRequested:(BOOL)a3
{
}

- (BOOL)hideChrome
{
  return sub_1AEB8D1D0() & 1;
}

- (void)setHideChrome:(BOOL)a3
{
}

- (UIFont)timeFont
{
  v2 = sub_1AEB8D24C();
  return (UIFont *)v2;
}

- (void)setTimeFont:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEB8D2D8((uint64_t)a3);
}

- (UIColor)timeColor
{
  v2 = sub_1AEB8D320();
  return (UIColor *)v2;
}

- (void)setTimeColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEB8D3AC((uint64_t)a3);
}

- (UIColor)statusBarTintColor
{
  v2 = sub_1AEB8D3F4();
  return (UIColor *)v2;
}

- (void)setStatusBarTintColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AEB8D480((uint64_t)a3);
}

- (unint64_t)significantEventTime
{
  return sub_1AEB8D4B8();
}

- (void)setSignificantEventTime:(unint64_t)a3
{
}

- (unint64_t)significantEventOptions
{
  return sub_1AEB8D524();
}

- (void)setSignificantEventOptions:(unint64_t)a3
{
}

- (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences)init
{
  return (_TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences *)sub_1AEB8D56C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences_timeFont));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences_timeColor));
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCC15PhotosUIPrivate43AmbientPhotoFramePlayergroundViewControllerP33_AA406F95772BEA5A2E5AABA48A24960034PlaygroundPosterMutablePreferences_statusBarTintColor);
}

@end