@interface _PUWallpaperDebugMutablePreferences
- (BOOL)hideChrome;
- (BOOL)userTapEventsRequested;
- (UIColor)statusBarTintColor;
- (UIColor)timeColor;
- (UIFont)timeFont;
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

@implementation _PUWallpaperDebugMutablePreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusBarTintColor, 0);
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_timeFont, 0);
}

- (void)setHideChrome:(BOOL)a3
{
  self->_hideChrome = a3;
}

- (BOOL)hideChrome
{
  return self->_hideChrome;
}

- (void)setUserTapEventsRequested:(BOOL)a3
{
  self->_userTapEventsRequested = a3;
}

- (BOOL)userTapEventsRequested
{
  return self->_userTapEventsRequested;
}

- (void)setSignificantEventOptions:(unint64_t)a3
{
  self->_significantEventOptions = a3;
}

- (unint64_t)significantEventOptions
{
  return self->_significantEventOptions;
}

- (void)setSignificantEventTime:(unint64_t)a3
{
  self->_significantEventTime = a3;
}

- (unint64_t)significantEventTime
{
  return self->_significantEventTime;
}

- (void)setStatusBarTintColor:(id)a3
{
}

- (UIColor)statusBarTintColor
{
  return self->_statusBarTintColor;
}

- (void)setTimeColor:(id)a3
{
}

- (UIColor)timeColor
{
  return self->_timeColor;
}

- (void)setTimeFont:(id)a3
{
}

- (UIFont)timeFont
{
  return self->_timeFont;
}

@end