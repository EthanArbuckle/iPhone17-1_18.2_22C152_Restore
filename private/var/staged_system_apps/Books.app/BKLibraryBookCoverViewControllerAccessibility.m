@interface BKLibraryBookCoverViewControllerAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (id)_bkaxBackButton;
- (id)_bkaxTarget;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_bkaxApplyAccessibilityInfo;
- (void)viewDidLoad;
@end

@implementation BKLibraryBookCoverViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return @"BKLibraryBookCoverViewController";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookCoverViewControllerAccessibility;
  [(BKLibraryBookCoverViewControllerAccessibility *)&v3 viewDidLoad];
  [(BKLibraryBookCoverViewControllerAccessibility *)self _bkaxApplyAccessibilityInfo];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookCoverViewControllerAccessibility;
  [(BKLibraryBookCoverViewControllerAccessibility *)&v3 _accessibilityLoadAccessibilityInformation];
  [(BKLibraryBookCoverViewControllerAccessibility *)self _bkaxApplyAccessibilityInfo];
}

- (id)_bkaxTarget
{
  objc_opt_class();
  v2 = __IMAccessibilityCastAsClass();

  return v2;
}

- (id)_bkaxBackButton
{
  objc_opt_class();
  objc_super v3 = [(BKLibraryBookCoverViewControllerAccessibility *)self imaxValueForKey:@"backButton"];
  v4 = __IMAccessibilityCastAsClass();

  return v4;
}

- (void)_bkaxApplyAccessibilityInfo
{
  sub_1000B86A8(@"back.button");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [(BKLibraryBookCoverViewControllerAccessibility *)self _bkaxBackButton];
  [v3 setAccessibilityLabel:v4];
}

@end