@interface _UINavigationBarVisualProvider
+ (BOOL)shouldDecodeSubviews;
- ($1AB5FA073B851C12C2339EC22442E995)layoutHeightsFittingWidth:(double)a3;
- (BOOL)_accessibility_shouldBeginHUDGestureAtPoint:(CGPoint)a3;
- (BOOL)_shim_107516167;
- (BOOL)_shim_34415965;
- (BOOL)_shim_disableBlurTinting;
- (BOOL)_shim_throwConstraintExceptions;
- (BOOL)_shim_wantsCustomTouchHandlingForTouches:(id)a3;
- (BOOL)allowsUserInteractionDuringTransitions;
- (BOOL)canHandleStatusBarTouchAtPoint:(CGPoint)a3;
- (BOOL)forceScrollEdgeAppearance;
- (BOOL)gestureRecognizerShouldBegin:(id)a3 defaultAnswer:(id)a4;
- (BOOL)isActiveTabBarHost;
- (BOOL)isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange;
- (BOOL)isContentViewHidden;
- (BOOL)isInCustomization;
- (BOOL)scrollEdgeAppearanceHasChromelessBehavior;
- (BOOL)shouldFadeStaticNavBarButton;
- (BOOL)shouldUseHeightRangeFittingWidth;
- (BOOL)staticNavBarButtonLingers;
- (BOOL)supportsRefreshControlHosting;
- (BOOL)topItemHasVariableHeight;
- (BOOL)updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3;
- (BOOL)useInlineBackgroundHeightWhenLarge;
- (BOOL)wantsHostedTabBarMetrics;
- (BOOL)wantsLargeTitleDisplayed;
- (CGSize)intrinsicContentSize;
- (NSDirectionalEdgeInsets)resolvedLargeTitleMargins;
- (UIBarButtonItem)staticNavBarButtonItem;
- (UINavigationBar)navigationBar;
- (_UIBarAppearanceChangeObserver)appearanceObserver;
- (_UINavigationBarItemStack)stack;
- (_UINavigationBarVisualProvider)initWithNavigationBar:(id)a3;
- (_UINavigationControllerRefreshControlHost)refreshControlHost;
- (_UITabContainerView)tabBarHostedView;
- (double)_shim_backgroundHeight;
- (double)_shim_shadowAlpha;
- (double)backgroundAlpha;
- (double)heightForRestoringFromCancelledTransition;
- (double)navItemContentLayoutGuideAnimationDistance;
- (double)titleAlpha;
- (id)_accessibility_HUDItemForPoint:(CGPoint)a3;
- (id)_accessibility_controlToActivateForHUDGestureLiftAtPoint:(CGPoint)a3;
- (id)_immediatelyFinishRunningTransition;
- (id)_shim_backIndicatorView;
- (id)_shim_compatibilityBackgroundView;
- (id)_shim_contentView;
- (id)_shim_displayViewsIncludingHiddenBackButtonViews:(BOOL)a3;
- (id)_shim_layoutView;
- (id)_shim_promptText;
- (id)_shim_userContentGuide;
- (id)contentViewVisualProvider;
- (id)description;
- (id)hitTest:(CGPoint)a3 defaultViewHit:(id)a4;
- (id)preferredFocusedView;
- (id)restingHeights;
- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4;
- (int64_t)_shim_backdropStyle;
- (int64_t)appearanceAPIVersion;
- (int64_t)currentContentSize;
- (int64_t)statusBarStyle;
- (void)appendToDescription:(id)a3;
- (void)popAnimated:(BOOL)a3 completion:(id)a4;
- (void)pushAnimated:(BOOL)a3 completion:(id)a4;
- (void)setActiveTabBarHost:(BOOL)a3;
- (void)setStack:(id)a3;
- (void)teardown;
@end

@implementation _UINavigationBarVisualProvider

- (id)contentViewVisualProvider
{
  return 0;
}

- (BOOL)shouldUseHeightRangeFittingWidth
{
  return 1;
}

- (BOOL)_shim_34415965
{
  return 0;
}

- (NSDirectionalEdgeInsets)resolvedLargeTitleMargins
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setStack:(id)a3
{
  double v4 = (_UINavigationBarItemStack *)a3;
  stack = self->_stack;
  if (stack != v4)
  {
    v9 = v4;
    v6 = v4;
    v7 = self->_stack;
    self->_stack = v6;
    v8 = stack;

    [(_UINavigationBarVisualProvider *)self stackDidChangeFrom:v8];
    double v4 = v9;
  }
}

- (_UINavigationBarVisualProvider)initWithNavigationBar:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UINavigationBarVisualProvider;
  NSDirectionalEdgeInsets result = [(_UINavigationBarVisualProvider *)&v5 init];
  if (result) {
    result->_navigationBar = (UINavigationBar *)a3;
  }
  return result;
}

- (BOOL)_shim_107516167
{
  return 0;
}

- (_UINavigationBarItemStack)stack
{
  return self->_stack;
}

- (id)_shim_promptText
{
  return 0;
}

+ (BOOL)shouldDecodeSubviews
{
  return 1;
}

- (void)teardown
{
  stack = self->_stack;
  self->_navigationBar = 0;
  self->_stack = 0;
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemForMeasuring, 0);
  objc_storeStrong((id *)&self->_stack, 0);
}

- (id)_shim_displayViewsIncludingHiddenBackButtonViews:(BOOL)a3
{
  return 0;
}

- (BOOL)isInCustomization
{
  return 0;
}

- (int64_t)currentContentSize
{
  return 0;
}

- (id)hitTest:(CGPoint)a3 defaultViewHit:(id)a4
{
  id v4 = a4;
  return v4;
}

- (CGSize)intrinsicContentSize
{
  -[_UINavigationBarVisualProvider sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)layoutHeightsFittingWidth:(double)a3
{
  -[_UINavigationBarVisualProvider sizeThatFits:](self, "sizeThatFits:", a3, 0.0);
  double v4 = v3;
  double v5 = v3;
  result.var2 = v5;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (BOOL)topItemHasVariableHeight
{
  return 0;
}

- (id)restingHeights
{
  v7[1] = *MEMORY[0x1E4F143B8];
  double v2 = NSNumber;
  [(_UINavigationBarVisualProvider *)self intrinsicContentSize];
  double v4 = [v2 numberWithDouble:v3];
  v7[0] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (void)pushAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  navigationBar = self->_navigationBar;
  id v7 = a4;
  id v9 = [(UINavigationBar *)navigationBar _stack];
  v8 = [v9 transitionAssistant];
  (*((void (**)(id, BOOL, void *))a4 + 2))(v7, v5, v8);
}

- (void)popAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  navigationBar = self->_navigationBar;
  id v7 = a4;
  id v9 = [(UINavigationBar *)navigationBar _stack];
  v8 = [v9 transitionAssistant];
  (*((void (**)(id, BOOL, void *))a4 + 2))(v7, v5, v8);
}

- (double)heightForRestoringFromCancelledTransition
{
  [(UIView *)self->_navigationBar frame];
  return v2;
}

- (BOOL)wantsLargeTitleDisplayed
{
  return 0;
}

- (BOOL)useInlineBackgroundHeightWhenLarge
{
  return 0;
}

- (double)backgroundAlpha
{
  return 1.0;
}

- (double)titleAlpha
{
  return 1.0;
}

- (int64_t)appearanceAPIVersion
{
  return 0;
}

- (_UIBarAppearanceChangeObserver)appearanceObserver
{
  return 0;
}

- (BOOL)forceScrollEdgeAppearance
{
  return 0;
}

- (BOOL)scrollEdgeAppearanceHasChromelessBehavior
{
  return 0;
}

- (BOOL)allowsUserInteractionDuringTransitions
{
  return 0;
}

- (_UITabContainerView)tabBarHostedView
{
  return 0;
}

- (BOOL)wantsHostedTabBarMetrics
{
  return 0;
}

- (UIBarButtonItem)staticNavBarButtonItem
{
  return 0;
}

- (BOOL)isContentViewHidden
{
  return 0;
}

- (BOOL)shouldFadeStaticNavBarButton
{
  return 0;
}

- (BOOL)staticNavBarButtonLingers
{
  return 0;
}

- (BOOL)isAnimatingNavItemContentLayoutGuideForStaticButtonVisibilityChange
{
  return 0;
}

- (double)navItemContentLayoutGuideAnimationDistance
{
  return 0.0;
}

- (BOOL)updateNavItemContentLayoutGuideAnimationConstraintConstant:(double)a3
{
  return 0;
}

- (id)traitCollectionForChild:(id)a3 baseTraitCollection:(id)a4
{
  id v4 = a4;
  return v4;
}

- (BOOL)supportsRefreshControlHosting
{
  return 0;
}

- (_UINavigationControllerRefreshControlHost)refreshControlHost
{
  return 0;
}

- (int64_t)statusBarStyle
{
  return 0;
}

- (BOOL)canHandleStatusBarTouchAtPoint:(CGPoint)a3
{
  return 0;
}

- (id)preferredFocusedView
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3 defaultAnswer:(id)a4
{
  return (*((uint64_t (**)(id, id))a4 + 2))(a4, a3);
}

- (id)_immediatelyFinishRunningTransition
{
  return &__block_literal_global_57;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)_UINavigationBarVisualProvider;
  double v3 = [(_UINavigationBarVisualProvider *)&v6 description];
  id v4 = (void *)[v3 mutableCopy];

  [(_UINavigationBarVisualProvider *)self appendToDescription:v4];
  return v4;
}

- (void)appendToDescription:(id)a3
{
  objc_msgSend(a3, "appendFormat:", @" navigationBar=%p stack=%p", self->_navigationBar, self->_stack);
}

- (BOOL)isActiveTabBarHost
{
  return self->_activeTabBarHost;
}

- (void)setActiveTabBarHost:(BOOL)a3
{
  self->_activeTabBarHost = a3;
}

- (id)_shim_contentView
{
  return 0;
}

- (id)_shim_layoutView
{
  return 0;
}

- (id)_shim_compatibilityBackgroundView
{
  return 0;
}

- (double)_shim_shadowAlpha
{
  return 1.0;
}

- (BOOL)_shim_disableBlurTinting
{
  return 0;
}

- (double)_shim_backgroundHeight
{
  return 0.0;
}

- (int64_t)_shim_backdropStyle
{
  return 0;
}

- (id)_shim_userContentGuide
{
  return 0;
}

- (id)_shim_backIndicatorView
{
  return 0;
}

- (BOOL)_shim_wantsCustomTouchHandlingForTouches:(id)a3
{
  return 0;
}

- (BOOL)_shim_throwConstraintExceptions
{
  return 0;
}

- (BOOL)_accessibility_shouldBeginHUDGestureAtPoint:(CGPoint)a3
{
  return 1;
}

- (id)_accessibility_HUDItemForPoint:(CGPoint)a3
{
  return 0;
}

- (id)_accessibility_controlToActivateForHUDGestureLiftAtPoint:(CGPoint)a3
{
  return 0;
}

@end