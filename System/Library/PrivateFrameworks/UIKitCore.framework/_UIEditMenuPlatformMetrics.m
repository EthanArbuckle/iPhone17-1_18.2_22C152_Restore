@interface _UIEditMenuPlatformMetrics
- (BOOL)showsSeparatorBetweenItems;
- (CGSize)arrowSize;
- (CGSize)shadowOffset;
- (UIButtonConfiguration)pageButtonConfiguration;
- (UIColor)destructiveColor;
- (UIColor)menuHighlightBackgroundColor;
- (UIColor)separatorEffectColor;
- (UIEdgeInsets)menuItemMargins;
- (UIShape)cellBackgroundShape;
- (UIVisualEffect)menuBackgroundEffect;
- (UIVisualEffect)menuHighlightBackgroundEffect;
- (UIVisualEffect)separatorEffect;
- (_UIEditMenuPlatformMetrics)init;
- (double)arrowSideRadius;
- (double)arrowTipRadius;
- (double)horizontalMenuCornerRadius;
- (double)horizontalMenuMaximumWidth;
- (double)shadowOpacity;
- (double)shadowRadius;
- (double)verticalMenuCornerRadius;
- (double)verticalMenuMaximumHeight;
- (id)containerViewConfigurator;
- (id)menuBackgroundConfigurator;
- (int64_t)overrideUserInterfaceStyle;
- (void)setArrowSideRadius:(double)a3;
- (void)setArrowSize:(CGSize)a3;
- (void)setArrowTipRadius:(double)a3;
- (void)setCellBackgroundShape:(id)a3;
- (void)setContainerViewConfigurator:(id)a3;
- (void)setDestructiveColor:(id)a3;
- (void)setHorizontalMenuCornerRadius:(double)a3;
- (void)setHorizontalMenuMaximumWidth:(double)a3;
- (void)setMenuBackgroundConfigurator:(id)a3;
- (void)setMenuBackgroundEffect:(id)a3;
- (void)setMenuHighlightBackgroundColor:(id)a3;
- (void)setMenuHighlightBackgroundEffect:(id)a3;
- (void)setMenuItemMargins:(UIEdgeInsets)a3;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
- (void)setPageButtonConfiguration:(id)a3;
- (void)setSeparatorEffect:(id)a3;
- (void)setSeparatorEffectColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowRadius:(double)a3;
- (void)setShowsSeparatorBetweenItems:(BOOL)a3;
- (void)setVerticalMenuCornerRadius:(double)a3;
- (void)setVerticalMenuMaximumHeight:(double)a3;
@end

@implementation _UIEditMenuPlatformMetrics

- (_UIEditMenuPlatformMetrics)init
{
  v14.receiver = self;
  v14.super_class = (Class)_UIEditMenuPlatformMetrics;
  v2 = [(_UIEditMenuPlatformMetrics *)&v14 init];
  if (v2)
  {
    v3 = +[UIBlurEffect effectWithStyle:9];
    [(_UIEditMenuPlatformMetrics *)v2 setMenuBackgroundEffect:v3];
    v4 = +[UIVibrancyEffect effectForBlurEffect:v3 style:6];
    [(_UIEditMenuPlatformMetrics *)v2 setMenuHighlightBackgroundEffect:v4];

    v5 = +[UIColor whiteColor];
    [(_UIEditMenuPlatformMetrics *)v2 setMenuHighlightBackgroundColor:v5];

    v6 = +[UIVibrancyEffect effectForBlurEffect:v3 style:7];
    [(_UIEditMenuPlatformMetrics *)v2 setSeparatorEffect:v6];

    v7 = +[UIColor whiteColor];
    [(_UIEditMenuPlatformMetrics *)v2 setSeparatorEffectColor:v7];

    [(_UIEditMenuPlatformMetrics *)v2 setShowsSeparatorBetweenItems:1];
    [(_UIEditMenuPlatformMetrics *)v2 setOverrideUserInterfaceStyle:0];
    [(_UIEditMenuPlatformMetrics *)v2 setShadowRadius:12.0];
    [(_UIEditMenuPlatformMetrics *)v2 setShadowOpacity:0.25];
    -[_UIEditMenuPlatformMetrics setShadowOffset:](v2, "setShadowOffset:", 0.0, 3.0);
    [(_UIEditMenuPlatformMetrics *)v2 setHorizontalMenuMaximumWidth:768.0];
    [(_UIEditMenuPlatformMetrics *)v2 setHorizontalMenuCornerRadius:10.0];
    [(_UIEditMenuPlatformMetrics *)v2 setVerticalMenuMaximumHeight:1.79769313e308];
    [(_UIEditMenuPlatformMetrics *)v2 setVerticalMenuCornerRadius:13.0];
    -[_UIEditMenuPlatformMetrics setArrowSize:](v2, "setArrowSize:", 16.0, 8.0);
    [(_UIEditMenuPlatformMetrics *)v2 setArrowSideRadius:3.0];
    [(_UIEditMenuPlatformMetrics *)v2 setArrowTipRadius:2.0];
    -[_UIEditMenuPlatformMetrics setMenuItemMargins:](v2, "setMenuItemMargins:", 11.0, 16.0, 11.0, 16.0);
    v8 = +[UIColor systemRedColor];
    [(_UIEditMenuPlatformMetrics *)v2 setDestructiveColor:v8];

    v9 = +[UIBackgroundConfiguration clearConfiguration];
    v10 = +[UIButtonConfiguration plainButtonConfiguration];
    v11 = +[UIColor labelColor];
    [v10 setBaseForegroundColor:v11];

    [v10 setBackground:v9];
    [(_UIEditMenuPlatformMetrics *)v2 setPageButtonConfiguration:v10];
    v12 = +[UIShape rectShape];
    [(_UIEditMenuPlatformMetrics *)v2 setCellBackgroundShape:v12];
  }
  return v2;
}

- (id)containerViewConfigurator
{
  return self->_containerViewConfigurator;
}

- (void)setContainerViewConfigurator:(id)a3
{
}

- (id)menuBackgroundConfigurator
{
  return self->_menuBackgroundConfigurator;
}

- (void)setMenuBackgroundConfigurator:(id)a3
{
}

- (UIVisualEffect)menuBackgroundEffect
{
  return self->_menuBackgroundEffect;
}

- (void)setMenuBackgroundEffect:(id)a3
{
}

- (UIVisualEffect)menuHighlightBackgroundEffect
{
  return self->_menuHighlightBackgroundEffect;
}

- (void)setMenuHighlightBackgroundEffect:(id)a3
{
}

- (UIColor)menuHighlightBackgroundColor
{
  return self->_menuHighlightBackgroundColor;
}

- (void)setMenuHighlightBackgroundColor:(id)a3
{
}

- (UIVisualEffect)separatorEffect
{
  return self->_separatorEffect;
}

- (void)setSeparatorEffect:(id)a3
{
}

- (UIColor)separatorEffectColor
{
  return self->_separatorEffectColor;
}

- (void)setSeparatorEffectColor:(id)a3
{
}

- (BOOL)showsSeparatorBetweenItems
{
  return self->_showsSeparatorBetweenItems;
}

- (void)setShowsSeparatorBetweenItems:(BOOL)a3
{
  self->_showsSeparatorBetweenItems = a3;
}

- (int64_t)overrideUserInterfaceStyle
{
  return self->_overrideUserInterfaceStyle;
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  self->_overrideUserInterfaceStyle = a3;
}

- (double)shadowOpacity
{
  return self->_shadowOpacity;
}

- (void)setShadowOpacity:(double)a3
{
  self->_shadowOpacity = a3;
}

- (CGSize)shadowOffset
{
  double width = self->_shadowOffset.width;
  double height = self->_shadowOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShadowOffset:(CGSize)a3
{
  self->_shadowOffset = a3;
}

- (double)shadowRadius
{
  return self->_shadowRadius;
}

- (void)setShadowRadius:(double)a3
{
  self->_shadowRadius = a3;
}

- (double)horizontalMenuMaximumWidth
{
  return self->_horizontalMenuMaximumWidth;
}

- (void)setHorizontalMenuMaximumWidth:(double)a3
{
  self->_horizontalMenuMaximumWidth = a3;
}

- (double)horizontalMenuCornerRadius
{
  return self->_horizontalMenuCornerRadius;
}

- (void)setHorizontalMenuCornerRadius:(double)a3
{
  self->_horizontalMenuCornerRadius = a3;
}

- (double)verticalMenuMaximumHeight
{
  return self->_verticalMenuMaximumHeight;
}

- (void)setVerticalMenuMaximumHeight:(double)a3
{
  self->_verticalMenuMaximumHeight = a3;
}

- (double)verticalMenuCornerRadius
{
  return self->_verticalMenuCornerRadius;
}

- (void)setVerticalMenuCornerRadius:(double)a3
{
  self->_verticalMenuCornerRadius = a3;
}

- (CGSize)arrowSize
{
  double width = self->_arrowSize.width;
  double height = self->_arrowSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setArrowSize:(CGSize)a3
{
  self->_arrowSize = a3;
}

- (double)arrowSideRadius
{
  return self->_arrowSideRadius;
}

- (void)setArrowSideRadius:(double)a3
{
  self->_arrowSideRadius = a3;
}

- (double)arrowTipRadius
{
  return self->_arrowTipRadius;
}

- (void)setArrowTipRadius:(double)a3
{
  self->_arrowTipRadius = a3;
}

- (UIEdgeInsets)menuItemMargins
{
  double top = self->_menuItemMargins.top;
  double left = self->_menuItemMargins.left;
  double bottom = self->_menuItemMargins.bottom;
  double right = self->_menuItemMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setMenuItemMargins:(UIEdgeInsets)a3
{
  self->_menuItemMargins = a3;
}

- (UIShape)cellBackgroundShape
{
  return self->_cellBackgroundShape;
}

- (void)setCellBackgroundShape:(id)a3
{
}

- (UIColor)destructiveColor
{
  return self->_destructiveColor;
}

- (void)setDestructiveColor:(id)a3
{
}

- (UIButtonConfiguration)pageButtonConfiguration
{
  return self->_pageButtonConfiguration;
}

- (void)setPageButtonConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_destructiveColor, 0);
  objc_storeStrong((id *)&self->_cellBackgroundShape, 0);
  objc_storeStrong((id *)&self->_separatorEffectColor, 0);
  objc_storeStrong((id *)&self->_separatorEffect, 0);
  objc_storeStrong((id *)&self->_menuHighlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_menuHighlightBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_menuBackgroundEffect, 0);
  objc_storeStrong(&self->_menuBackgroundConfigurator, 0);
  objc_storeStrong(&self->_containerViewConfigurator, 0);
}

@end