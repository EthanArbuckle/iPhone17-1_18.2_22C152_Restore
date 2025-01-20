@interface _UITabBarAppearanceStorage
- (UIColor)barTintColor;
- (UIColor)selectedImageTintColor;
- (UIColor)unselectedImageTintColor;
- (UIImage)backgroundImage;
- (UIImage)selectionIndicatorImage;
- (UIImage)shadowImage;
- (_UITabBarItemAppearanceStorage)tabItemAppearanceStorage;
- (id)_tabItemAppearanceStorage;
- (void)setBackgroundImage:(id)a3;
- (void)setBarTintColor:(id)a3;
- (void)setSelectedImageTintColor:(id)a3;
- (void)setSelectionIndicatorImage:(id)a3;
- (void)setShadowImage:(id)a3;
- (void)setTabItemAppearanceStorage:(id)a3;
- (void)setUnselectedImageTintColor:(id)a3;
@end

@implementation _UITabBarAppearanceStorage

- (void)setTabItemAppearanceStorage:(id)a3
{
}

- (_UITabBarItemAppearanceStorage)tabItemAppearanceStorage
{
  tabItemAppearanceStorage = self->tabItemAppearanceStorage;
  if (!tabItemAppearanceStorage)
  {
    v4 = objc_alloc_init(_UITabBarItemAppearanceStorage);
    v5 = self->tabItemAppearanceStorage;
    self->tabItemAppearanceStorage = v4;

    tabItemAppearanceStorage = self->tabItemAppearanceStorage;
  }
  return tabItemAppearanceStorage;
}

- (id)_tabItemAppearanceStorage
{
  return self->tabItemAppearanceStorage;
}

- (UIImage)backgroundImage
{
  return self->backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
}

- (UIImage)shadowImage
{
  return self->shadowImage;
}

- (void)setShadowImage:(id)a3
{
}

- (UIImage)selectionIndicatorImage
{
  return self->selectionIndicatorImage;
}

- (void)setSelectionIndicatorImage:(id)a3
{
}

- (UIColor)barTintColor
{
  return self->barTintColor;
}

- (void)setBarTintColor:(id)a3
{
}

- (UIColor)selectedImageTintColor
{
  return self->selectedImageTintColor;
}

- (void)setSelectedImageTintColor:(id)a3
{
}

- (UIColor)unselectedImageTintColor
{
  return self->_unselectedImageTintColor;
}

- (void)setUnselectedImageTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unselectedImageTintColor, 0);
  objc_storeStrong((id *)&self->tabItemAppearanceStorage, 0);
  objc_storeStrong((id *)&self->selectedImageTintColor, 0);
  objc_storeStrong((id *)&self->barTintColor, 0);
  objc_storeStrong((id *)&self->selectionIndicatorImage, 0);
  objc_storeStrong((id *)&self->shadowImage, 0);
  objc_storeStrong((id *)&self->backgroundImage, 0);
}

@end