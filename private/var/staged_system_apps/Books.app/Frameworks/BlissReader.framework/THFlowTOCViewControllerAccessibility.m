@interface THFlowTOCViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (UIButton)_thaxHeaderImageViews;
- (void)_thaxApplyAccessibilityInfo;
- (void)accessoryTapped:(id)a3;
- (void)introMediaControllerShouldAdvancePast:(id)a3;
- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4;
- (void)tsaxLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation THFlowTOCViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THFlowTOCViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THFlowTOCViewControllerAccessibility;
  [(THFlowTOCViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [self tsaxValueForKey:@"backgroundButton"] setIsAccessibilityElement:0;
  [(THFlowTOCViewControllerAccessibility *)self _thaxApplyAccessibilityInfo];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2927A8;
  v3[3] = &unk_457278;
  BOOL v4 = a3;
  v3[4] = self;
  [(THTOCViewControllerAccessibility *)self _axPerformBlockAffectingMediaControllerState:v3];
}

- (void)introMediaControllerShouldAdvancePast:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THFlowTOCViewControllerAccessibility;
  [(THFlowTOCViewControllerAccessibility *)&v5 introMediaControllerShouldAdvancePast:a3];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_292880;
  v4[3] = &unk_456DE0;
  v4[4] = self;
  TSAccessibilityPerformBlockOnMainThreadAfterDelay(v4, 0.75);
}

- (void)accessoryTapped:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)THFlowTOCViewControllerAccessibility;
  [(THFlowTOCViewControllerAccessibility *)&v3 accessoryTapped:a3];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)setIntroMediaViewController:(id)a3 showIt:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)THFlowTOCViewControllerAccessibility;
  -[THFlowTOCViewControllerAccessibility setIntroMediaViewController:showIt:](&v6, "setIntroMediaViewController:showIt:", a3);
  if (v4) {
    [(THTOCViewControllerAccessibility *)self _axHideToolbar];
  }
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)THFlowTOCViewControllerAccessibility;
  [(THFlowTOCViewControllerAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(THFlowTOCViewControllerAccessibility *)self _thaxApplyAccessibilityInfo];
}

- (void)_thaxApplyAccessibilityInfo
{
  [(UIButton *)[(THFlowTOCViewControllerAccessibility *)self _thaxHeaderImageViews] setIsAccessibilityElement:1];
  [(UIButton *)[(THFlowTOCViewControllerAccessibility *)self _thaxHeaderImageViews] _accessibilitySetRoleDescription:THAccessibilityLocalizedString(@"image")];
  objc_super v3 = [(THFlowTOCViewControllerAccessibility *)self _thaxHeaderImageViews];
  UIAccessibilityTraits v4 = UIAccessibilityTraitButton;
  unint64_t v5 = (unint64_t)[(UIButton *)v3 accessibilityTraits] & ~v4;

  [(UIButton *)v3 setAccessibilityTraits:v5];
}

- (UIButton)_thaxHeaderImageViews
{
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  result = (UIButton *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THFlowTOCViewControllerAccessibility *)self tsaxValueForKey:@"headerImageViews"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end