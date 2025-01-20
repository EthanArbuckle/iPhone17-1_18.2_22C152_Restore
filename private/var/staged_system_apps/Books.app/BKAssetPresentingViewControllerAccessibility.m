@interface BKAssetPresentingViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)bkaxView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BKAssetPresentingViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKAssetPresentingViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)BKAssetPresentingViewControllerAccessibility;
  [(BKAssetPresentingViewControllerAccessibility *)&v4 viewDidLoad];
  v3 = [(BKAssetPresentingViewControllerAccessibility *)self bkaxView];
  [v3 setAccessibilityViewIsModal:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)BKAssetPresentingViewControllerAccessibility;
  [(BKAssetPresentingViewControllerAccessibility *)&v3 viewDidAppear:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (id)bkaxView
{
  objc_opt_class();
  objc_super v3 = [(BKAssetPresentingViewControllerAccessibility *)self imaxValueForKey:@"view"];
  objc_super v4 = __IMAccessibilityCastAsClass();

  return v4;
}

@end