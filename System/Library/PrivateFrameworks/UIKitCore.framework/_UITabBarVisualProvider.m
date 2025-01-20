@interface _UITabBarVisualProvider
+ (BOOL)shouldDecodeSubviews;
- (BOOL)_shim_shadowHidden;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)useModernAppearance;
- (BOOL)wantsFocus;
- (UITabBar)tabBar;
- (_UIBarAppearanceChangeObserver)appearanceObserver;
- (_UITabBarVisualProvider)initWithTabBar:(id)a3;
- (double)_shim_heightForCustomizingItems;
- (double)_shim_shadowAlpha;
- (double)backgroundTransitionProgress;
- (double)defaultAnimationDuration;
- (double)minimumWidthForHorizontalLayout;
- (id)_shim_accessoryView;
- (id)_shim_compatibilityBackgroundView;
- (id)_shim_shadowView;
- (id)createViewForTabBarItem:(id)a3;
- (id)defaultTintColor;
- (id)exchangeItem:(id)a3 withItem:(id)a4;
- (id)preferredFocusedView;
- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4;
- (void)changeItemsTo:(id)a3 removingItems:(id)a4 selectedItem:(id)a5 oldSelectedItem:(id)a6 animate:(BOOL)a7;
- (void)teardown;
@end

@implementation _UITabBarVisualProvider

- (id)defaultTintColor
{
  return 0;
}

- (_UITabBarVisualProvider)initWithTabBar:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UITabBarVisualProvider;
  result = [(_UITabBarVisualProvider *)&v5 init];
  if (result) {
    result->_tabBar = (UITabBar *)a3;
  }
  return result;
}

- (id)_shim_shadowView
{
  return 0;
}

- (void)teardown
{
  self->_tabBar = 0;
}

- (void)changeItemsTo:(id)a3 removingItems:(id)a4 selectedItem:(id)a5 oldSelectedItem:(id)a6 animate:(BOOL)a7
{
}

- (id)exchangeItem:(id)a3 withItem:(id)a4
{
  return [(UITabBar *)self->_tabBar items];
}

- (double)backgroundTransitionProgress
{
  return 0.0;
}

- (BOOL)useModernAppearance
{
  return 0;
}

- (_UIBarAppearanceChangeObserver)appearanceObserver
{
  return 0;
}

- (double)minimumWidthForHorizontalLayout
{
  return 0.0;
}

- (id)createViewForTabBarItem:(id)a3
{
  return 0;
}

+ (BOOL)shouldDecodeSubviews
{
  return 1;
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  id v4 = a4;
  return v4;
}

- (BOOL)wantsFocus
{
  return 0;
}

- (id)preferredFocusedView
{
  return 0;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (double)defaultAnimationDuration
{
  return 0.2;
}

- (UITabBar)tabBar
{
  return self->_tabBar;
}

- (id)_shim_compatibilityBackgroundView
{
  return 0;
}

- (id)_shim_accessoryView
{
  return 0;
}

- (double)_shim_shadowAlpha
{
  return 1.0;
}

- (BOOL)_shim_shadowHidden
{
  return 0;
}

- (double)_shim_heightForCustomizingItems
{
  [(UIView *)self->_tabBar bounds];
  return v2;
}

@end