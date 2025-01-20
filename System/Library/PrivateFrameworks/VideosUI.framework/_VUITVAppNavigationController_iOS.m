@interface _VUITVAppNavigationController_iOS
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

@implementation _VUITVAppNavigationController_iOS

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_VUITVAppNavigationController_iOS;
  [(_VUITVAppNavigationController_iOS *)&v4 viewDidLoad];
  v3 = [(_VUITVAppNavigationController_iOS *)self navigationBar];
  [v3 setPrefersLargeTitles:1];
}

- (void)_setContentOverlayInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  if ([(_VUITVAppNavigationController_iOS *)self shouldPreventContentFromShiftingVertically])
  {
    [(_VUITVAppNavigationController_iOS *)self _contentOverlayInsets];
    double top = v8;
    double bottom = v9;
  }
  v10.receiver = self;
  v10.super_class = (Class)_VUITVAppNavigationController_iOS;
  -[_VUITVAppNavigationController_iOS _setContentOverlayInsets:](&v10, sel__setContentOverlayInsets_, top, left, bottom, right);
}

- (BOOL)shouldPreventContentFromShiftingVertically
{
  return self->_shouldPreventContentFromShiftingVertically;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(_VUITVAppNavigationController_iOS *)self topViewController];
  int64_t v3 = [v2 preferredStatusBarStyle];

  return v3;
}

- (void)willPresentTraitsOverridingViewController
{
  [(_VUITVAppNavigationController_iOS *)self setShouldPreventContentFromShiftingVertically:1];
  id v4 = [(_VUITVAppNavigationController_iOS *)self navigationBar];
  -[_VUITVAppNavigationController_iOS setOriginalValueForNavigationBarForceFullHeightInLandscape:](self, "setOriginalValueForNavigationBarForceFullHeightInLandscape:", [v4 forceFullHeightInLandscape]);
  int64_t v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  if ((unint64_t)([v3 statusBarOrientation] - 1) <= 1) {
    [v4 setForceFullHeightInLandscape:1];
  }
  if (([v3 isStatusBarHidden] & 1) == 0) {
    [(_VUITVAppNavigationController_iOS *)self setShouldFakeStatusBarVisible:1];
  }
}

- (void)didPresentTraitsOverridingViewController
{
  int64_t v3 = [(_VUITVAppNavigationController_iOS *)self navigationBar];
  objc_msgSend(v3, "setForceFullHeightInLandscape:", -[_VUITVAppNavigationController_iOS originalValueForNavigationBarForceFullHeightInLandscape](self, "originalValueForNavigationBarForceFullHeightInLandscape"));

  [(_VUITVAppNavigationController_iOS *)self setShouldPreventContentFromShiftingVertically:0];
  [(_VUITVAppNavigationController_iOS *)self setShouldFakeStatusBarVisible:0];
  [(_VUITVAppNavigationController_iOS *)self setOriginalValueForNavigationBarForceFullHeightInLandscape:0];
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_VUITVAppNavigationController_iOS;
  [(_VUITVAppNavigationController_iOS *)&v6 didShowViewController:a3 animated:a4];
  v5 = [(_VUITVAppNavigationController_iOS *)self navigationBar];
  [v5 setAccessibilityIdentifier:@"UIA.TV.NavigationBar"];

  [(_VUITVAppNavigationController_iOS *)self setNeedsStatusBarAppearanceUpdate];
}

- (id)_accessibilityButtonBackgroundDefaultTintColor
{
  if (_accessibilityButtonBackgroundDefaultTintColor_onceToken != -1) {
    dispatch_once(&_accessibilityButtonBackgroundDefaultTintColor_onceToken, &__block_literal_global_164);
  }
  v2 = (void *)_accessibilityButtonBackgroundDefaultTintColor_defaultTintColor;
  return v2;
}

- (BOOL)shouldFakeStatusBarVisible
{
  return self->_shouldFakeStatusBarVisible;
}

- (void)setShouldFakeStatusBarVisible:(BOOL)a3
{
  self->_shouldFakeStatusBarVisible = a3;
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