@interface UIAccessibilityMathNavigationBar
- (BOOL)accessibilityPerformEscape;
- (UIAccessibilityMathNavigationBar)initWithFrame:(CGRect)a3;
- (id)_popNavigationItemWithTransition:(int)a3;
- (void)_pushNavigationItem:(id)a3 transition:(int)a4;
@end

@implementation UIAccessibilityMathNavigationBar

- (UIAccessibilityMathNavigationBar)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UIAccessibilityMathNavigationBar;
  v3 = -[UIAccessibilityMathNavigationBar initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(UIAccessibilityMathNavigationBar *)v3 _setHidesShadow:1];
    v11.width = 1.0;
    v11.height = 1.0;
    UIGraphicsBeginImageContext(v11);
    v5 = UIGraphicsGetImageFromCurrentImageContext();
    v6 = objc_msgSend(v5, "resizableImageWithCapInsets:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));

    UIGraphicsEndImageContext();
    [(UIAccessibilityMathNavigationBar *)v4 setBackgroundImage:v6 forBarMetrics:0];
    v7 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIAccessibilityMathNavigationBar *)v4 setBackgroundColor:v7];

    v8 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIAccessibilityMathNavigationBar *)v4 setTintColor:v8];

    [(UIAccessibilityMathNavigationBar *)v4 setTranslucent:1];
  }
  return v4;
}

- (BOOL)accessibilityPerformEscape
{
  v2 = [MEMORY[0x1E4F42738] sharedApplication];
  v3 = [v2 accessibilityPresentingViewController];

  v4 = [v3 presentedViewController];

  if (!v4) {
    _AXAssert();
  }
  v5 = [v3 presentedViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_super v10 = v5;
    _AXAssert();
    goto LABEL_7;
  }
  v6 = [v5 viewControllers];
  uint64_t v7 = [v6 count];

  if (v7 == 1)
  {
LABEL_7:
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0, v10);
    goto LABEL_8;
  }
  id v8 = (id)[v5 popViewControllerAnimated:1];
LABEL_8:

  return 1;
}

- (void)_pushNavigationItem:(id)a3 transition:(int)a4
{
  if (a4) {
    uint64_t v4 = 6;
  }
  else {
    uint64_t v4 = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)UIAccessibilityMathNavigationBar;
  [(UIAccessibilityMathNavigationBar *)&v5 _pushNavigationItem:a3 transition:v4];
}

- (id)_popNavigationItemWithTransition:(int)a3
{
  if (a3) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIAccessibilityMathNavigationBar;
  uint64_t v4 = [(UIAccessibilityMathNavigationBar *)&v6 _popNavigationItemWithTransition:v3];

  return v4;
}

- (void).cxx_destruct
{
}

@end