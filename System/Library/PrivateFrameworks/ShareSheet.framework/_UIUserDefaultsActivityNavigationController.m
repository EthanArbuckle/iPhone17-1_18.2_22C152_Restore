@interface _UIUserDefaultsActivityNavigationController
+ (BOOL)_preventsAppearanceProxyCustomization;
- (BOOL)_shouldUseContentOverlayInsetsAsStatusBarUnderlapHeight;
- (BOOL)_viewControllerUnderlapsStatusBar;
- (CGSize)preferredContentSize;
- (double)_statusBarHeightAdjustmentForCurrentOrientation;
- (void)setPreferredContentSize:(CGSize)a3;
@end

@implementation _UIUserDefaultsActivityNavigationController

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (CGSize)preferredContentSize
{
  v2 = [(_UIUserDefaultsActivityNavigationController *)self topViewController];
  [v2 preferredContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(_UIUserDefaultsActivityNavigationController *)self topViewController];
  objc_msgSend(v5, "setPreferredContentSize:", width, height);
}

- (BOOL)_shouldUseContentOverlayInsetsAsStatusBarUnderlapHeight
{
  double v3 = [(_UIUserDefaultsActivityNavigationController *)self viewIfLoaded];
  double v4 = [v3 window];
  id v5 = [v4 rootViewController];

  BOOL v7 = 0;
  if (v5)
  {
    if ([v5 _providesCustomBasePresentationInsets])
    {
      [(_UIUserDefaultsActivityNavigationController *)self _contentOverlayInsets];
      if (v6 > 0.0) {
        BOOL v7 = 1;
      }
    }
  }

  return v7;
}

- (double)_statusBarHeightAdjustmentForCurrentOrientation
{
  if ([(_UIUserDefaultsActivityNavigationController *)self _shouldUseContentOverlayInsetsAsStatusBarUnderlapHeight])
  {
    [(_UIUserDefaultsActivityNavigationController *)self _contentOverlayInsets];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)_UIUserDefaultsActivityNavigationController;
    [(_UIUserDefaultsActivityNavigationController *)&v4 _statusBarHeightAdjustmentForCurrentOrientation];
  }
  return result;
}

- (BOOL)_viewControllerUnderlapsStatusBar
{
  if ([(_UIUserDefaultsActivityNavigationController *)self _shouldUseContentOverlayInsetsAsStatusBarUnderlapHeight])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIUserDefaultsActivityNavigationController;
  return [(_UIUserDefaultsActivityNavigationController *)&v4 _viewControllerUnderlapsStatusBar];
}

@end