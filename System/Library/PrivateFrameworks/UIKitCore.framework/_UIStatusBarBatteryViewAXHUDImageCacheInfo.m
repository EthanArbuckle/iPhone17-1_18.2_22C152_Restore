@interface _UIStatusBarBatteryViewAXHUDImageCacheInfo
- (BOOL)cacheMatchesCapacity:(double)a3 fillColor:(id)a4 tintColor:(id)a5 showingBolt:(BOOL)a6 reverseLayout:(BOOL)a7 scale:(double)a8 showsPercentage:(BOOL)a9 contentSizeCategory:(id)a10;
- (BOOL)reverseLayoutDirection;
- (BOOL)showBolt;
- (BOOL)showsPercentage;
- (NSString)contentSizeCategory;
- (UIColor)fillColor;
- (UIColor)tintColor;
- (UIImage)cachedImage;
- (double)capacity;
- (double)scale;
- (void)setCachedImage:(id)a3;
- (void)setCapacity:(double)a3;
- (void)setContentSizeCategory:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setReverseLayoutDirection:(BOOL)a3;
- (void)setScale:(double)a3;
- (void)setShowBolt:(BOOL)a3;
- (void)setShowsPercentage:(BOOL)a3;
- (void)setTintColor:(id)a3;
@end

@implementation _UIStatusBarBatteryViewAXHUDImageCacheInfo

- (BOOL)cacheMatchesCapacity:(double)a3 fillColor:(id)a4 tintColor:(id)a5 showingBolt:(BOOL)a6 reverseLayout:(BOOL)a7 scale:(double)a8 showsPercentage:(BOOL)a9 contentSizeCategory:(id)a10
{
  BOOL v11 = a9;
  BOOL v13 = a7;
  BOOL v14 = a6;
  id v18 = a4;
  id v19 = a5;
  id v20 = a10;
  [(_UIStatusBarBatteryViewAXHUDImageCacheInfo *)self capacity];
  if (v21 == a3)
  {
    v22 = [(_UIStatusBarBatteryViewAXHUDImageCacheInfo *)self fillColor];
    if ([v22 isEqual:v18])
    {
      v23 = [(_UIStatusBarBatteryViewAXHUDImageCacheInfo *)self tintColor];
      if ([v23 isEqual:v19]
        && [(_UIStatusBarBatteryViewAXHUDImageCacheInfo *)self showBolt] == v14
        && [(_UIStatusBarBatteryViewAXHUDImageCacheInfo *)self reverseLayoutDirection] == v13
        && ([(_UIStatusBarBatteryViewAXHUDImageCacheInfo *)self scale], v24 == a8)
        && [(_UIStatusBarBatteryViewAXHUDImageCacheInfo *)self showsPercentage] == v11)
      {
        v27 = [(_UIStatusBarBatteryViewAXHUDImageCacheInfo *)self contentSizeCategory];
        char v25 = [v27 isEqualToString:v20];
      }
      else
      {
        char v25 = 0;
      }
    }
    else
    {
      char v25 = 0;
    }
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (void)setCachedImage:(id)a3
{
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
}

- (double)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(double)a3
{
  self->_capacity = a3;
}

- (BOOL)showBolt
{
  return self->_showBolt;
}

- (void)setShowBolt:(BOOL)a3
{
  self->_showBolt = a3;
}

- (BOOL)reverseLayoutDirection
{
  return self->_reverseLayoutDirection;
}

- (void)setReverseLayoutDirection:(BOOL)a3
{
  self->_reverseLayoutDirection = a3;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

- (BOOL)showsPercentage
{
  return self->_showsPercentage;
}

- (void)setShowsPercentage:(BOOL)a3
{
  self->_showsPercentage = a3;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (void)setContentSizeCategory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_cachedImage, 0);
}

@end