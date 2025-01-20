@interface _UIToolbarAppearanceStorage
+ (int64_t)typicalBarPosition;
- (BOOL)hidesShadow;
- (UIImage)backgroundImage;
- (UIImage)miniBackgroundImage;
- (UIImage)miniTopBackgroundImage;
- (UIImage)shadowImage;
- (UIImage)topBackgroundImage;
- (UIImage)topShadowImage;
- (void)setBackgroundImage:(id)a3;
- (void)setHidesShadow:(BOOL)a3;
- (void)setMiniBackgroundImage:(id)a3;
- (void)setMiniTopBackgroundImage:(id)a3;
- (void)setShadowImage:(id)a3;
- (void)setTopBackgroundImage:(id)a3;
- (void)setTopShadowImage:(id)a3;
@end

@implementation _UIToolbarAppearanceStorage

+ (int64_t)typicalBarPosition
{
  return 1;
}

- (void)setHidesShadow:(BOOL)a3
{
  self->_hidesShadow = a3;
}

- (BOOL)hidesShadow
{
  return self->_hidesShadow;
}

- (UIImage)shadowImage
{
  return self->_shadowImage;
}

- (UIImage)backgroundImage
{
  return (UIImage *)[(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:0 barMetrics:0];
}

- (UIImage)miniBackgroundImage
{
  return (UIImage *)[(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:0 barMetrics:1];
}

- (UIImage)topBackgroundImage
{
  return (UIImage *)[(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:2 barMetrics:0];
}

- (UIImage)miniTopBackgroundImage
{
  return (UIImage *)[(_UIBarAppearanceStorage *)self backgroundImageForBarPosition:2 barMetrics:1];
}

- (void)setBackgroundImage:(id)a3
{
}

- (void)setMiniBackgroundImage:(id)a3
{
}

- (void)setTopBackgroundImage:(id)a3
{
}

- (void)setMiniTopBackgroundImage:(id)a3
{
}

- (void)setShadowImage:(id)a3
{
}

- (UIImage)topShadowImage
{
  return self->_topShadowImage;
}

- (void)setTopShadowImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topShadowImage, 0);
  objc_storeStrong((id *)&self->_shadowImage, 0);
  objc_storeStrong((id *)&self->_miniTopBackgroundImage, 0);
  objc_storeStrong((id *)&self->_topBackgroundImage, 0);
  objc_storeStrong((id *)&self->_miniBackgroundImage, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
}

@end