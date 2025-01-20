@interface _TVAppNavigationController_iOS
- (BOOL)originalValueForNavigationBarForceFullHeightInLandscape;
- (BOOL)shouldFakeStatusBarVisible;
- (BOOL)shouldPreventContentFromShiftingVertically;
- (id)_accessibilityButtonBackgroundDefaultTintColor;
- (int64_t)preferredStatusBarStyle;
- (void)_setContentOverlayInsets:(UIEdgeInsets)a3;
- (void)didPresentTraitsOverridingViewController;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)setOriginalValueForNavigationBarForceFullHeightInLandscape:(BOOL)a3;
- (void)setShouldFakeStatusBarVisible:(BOOL)a3;
- (void)setShouldPreventContentFromShiftingVertically:(BOOL)a3;
- (void)viewDidLoad;
- (void)willPresentTraitsOverridingViewController;
@end

@implementation _TVAppNavigationController_iOS

- (int64_t)preferredStatusBarStyle
{
  v2 = [(_TVAppNavigationController_iOS *)self topViewController];
  int64_t v3 = [v2 preferredStatusBarStyle];

  return v3;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_TVAppNavigationController_iOS;
  [(_TVAppNavigationController_iOS *)&v4 viewDidLoad];
  int64_t v3 = [(_TVAppNavigationController_iOS *)self navigationBar];
  [v3 setPrefersLargeTitles:1];
}

- (void)willPresentTraitsOverridingViewController
{
  [(_TVAppNavigationController_iOS *)self setShouldPreventContentFromShiftingVertically:1];
  id v4 = [(_TVAppNavigationController_iOS *)self navigationBar];
  -[_TVAppNavigationController_iOS setOriginalValueForNavigationBarForceFullHeightInLandscape:](self, "setOriginalValueForNavigationBarForceFullHeightInLandscape:", [v4 forceFullHeightInLandscape]);
  int64_t v3 = [MEMORY[0x263F1C408] sharedApplication];
  if ((unint64_t)([v3 statusBarOrientation] - 1) <= 1) {
    [v4 setForceFullHeightInLandscape:1];
  }
  if (([v3 isStatusBarHidden] & 1) == 0) {
    [(_TVAppNavigationController_iOS *)self setShouldFakeStatusBarVisible:1];
  }
}

- (void)didPresentTraitsOverridingViewController
{
  int64_t v3 = [(_TVAppNavigationController_iOS *)self navigationBar];
  objc_msgSend(v3, "setForceFullHeightInLandscape:", -[_TVAppNavigationController_iOS originalValueForNavigationBarForceFullHeightInLandscape](self, "originalValueForNavigationBarForceFullHeightInLandscape"));

  [(_TVAppNavigationController_iOS *)self setShouldPreventContentFromShiftingVertically:0];
  [(_TVAppNavigationController_iOS *)self setShouldFakeStatusBarVisible:0];
  [(_TVAppNavigationController_iOS *)self setOriginalValueForNavigationBarForceFullHeightInLandscape:0];
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_TVAppNavigationController_iOS;
  [(_TVAppNavigationController_iOS *)&v5 didShowViewController:a3 animated:a4];
  [(_TVAppNavigationController_iOS *)self setNeedsStatusBarAppearanceUpdate];
}

- (id)_accessibilityButtonBackgroundDefaultTintColor
{
  if (_accessibilityButtonBackgroundDefaultTintColor_onceToken != -1) {
    dispatch_once(&_accessibilityButtonBackgroundDefaultTintColor_onceToken, &__block_literal_global_33);
  }
  v2 = (void *)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  return v2;
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ([(_TVAppNavigationController_iOS *)self shouldPreventContentFromShiftingVertically])
  {
    [(_TVAppNavigationController_iOS *)self _contentOverlayInsets];
    double top = v8;
    double bottom = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)_TVAppNavigationController_iOS;
  -[_TVAppNavigationController_iOS _setContentOverlayInsets:](&v10, sel__setContentOverlayInsets_, top, left, bottom, right);
}

- (BOOL)shouldFakeStatusBarVisible
{
  return self->_shouldFakeStatusBarVisible;
}

- (void)setShouldFakeStatusBarVisible:(BOOL)a3
{
  self->_shouldFakeStatusBarVisible = a3;
}

- (BOOL)shouldPreventContentFromShiftingVertically
{
  return self->_shouldPreventContentFromShiftingVertically;
}

- (void)setShouldPreventContentFromShiftingVertically:(BOOL)a3
{
  self->_shouldPreventContentFromShiftingVertically = a3;
}

- (BOOL)originalValueForNavigationBarForceFullHeightInLandscape
{
  return self->_originalValueForNavigationBarForceFullHeightInLandscape;
}

- (void)setOriginalValueForNavigationBarForceFullHeightInLandscape:(BOOL)a3
{
  self->_originalValueForNavigationBarForceFullHeightInLandscape = a3;
}

@end