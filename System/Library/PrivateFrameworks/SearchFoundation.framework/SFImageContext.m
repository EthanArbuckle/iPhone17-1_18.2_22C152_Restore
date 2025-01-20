@interface SFImageContext
- (BOOL)hasDarkAppearance;
- (BOOL)ignoreImageDataCache;
- (double)uiScale;
- (void)setHasDarkAppearance:(BOOL)a3;
- (void)setIgnoreImageDataCache:(BOOL)a3;
- (void)setUiScale:(double)a3;
@end

@implementation SFImageContext

- (void)setIgnoreImageDataCache:(BOOL)a3
{
  self->_ignoreImageDataCache = a3;
}

- (BOOL)ignoreImageDataCache
{
  return self->_ignoreImageDataCache;
}

- (void)setHasDarkAppearance:(BOOL)a3
{
  self->_hasDarkAppearance = a3;
}

- (BOOL)hasDarkAppearance
{
  return self->_hasDarkAppearance;
}

- (void)setUiScale:(double)a3
{
  self->_uiScale = a3;
}

- (double)uiScale
{
  return self->_uiScale;
}

@end