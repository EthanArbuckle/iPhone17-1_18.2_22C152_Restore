@interface _PUWallpaperPosterEditorDebugPreferences
- (NSString)currentLookName;
- (UIColor)statusBarTintColor;
- (UIColor)timeColor;
- (UIFont)timeFont;
- (unint64_t)currentLookIndex;
- (unint64_t)numberOfLooks;
- (void)setCurrentLookIndex:(unint64_t)a3;
- (void)setCurrentLookName:(id)a3;
- (void)setNumberOfLooks:(unint64_t)a3;
- (void)setStatusBarTintColor:(id)a3;
- (void)setTimeColor:(id)a3;
- (void)setTimeFont:(id)a3;
@end

@implementation _PUWallpaperPosterEditorDebugPreferences

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLookName, 0);
  objc_storeStrong((id *)&self->_statusBarTintColor, 0);
  objc_storeStrong((id *)&self->_timeColor, 0);
  objc_storeStrong((id *)&self->_timeFont, 0);
}

- (void)setNumberOfLooks:(unint64_t)a3
{
  self->_numberOfLooks = a3;
}

- (unint64_t)numberOfLooks
{
  return self->_numberOfLooks;
}

- (void)setCurrentLookIndex:(unint64_t)a3
{
  self->_currentLookIndex = a3;
}

- (unint64_t)currentLookIndex
{
  return self->_currentLookIndex;
}

- (void)setCurrentLookName:(id)a3
{
}

- (NSString)currentLookName
{
  return self->_currentLookName;
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