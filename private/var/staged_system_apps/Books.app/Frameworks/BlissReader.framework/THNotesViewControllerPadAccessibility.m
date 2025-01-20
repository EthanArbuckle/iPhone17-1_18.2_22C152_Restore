@interface THNotesViewControllerPadAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
- (THUIBarButtonItemAccessibility)_thaxActionButton;
- (THUIBarButtonItemAccessibility)_thaxSelectButton;
- (void)_thaxApplyAccessibilityInfo;
- (void)handleAction:(id)a3;
- (void)handleStudy:(id)a3;
- (void)p_configureToolbarsForEditing:(BOOL)a3 collapsed:(BOOL)a4;
- (void)tsaxLoadAccessibilityInformation;
@end

@implementation THNotesViewControllerPadAccessibility

+ (id)tsaxTargetClassName
{
  return @"THNotesViewControllerPad";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)p_configureToolbarsForEditing:(BOOL)a3 collapsed:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THNotesViewControllerPadAccessibility;
  [(THNotesViewControllerPadAccessibility *)&v5 p_configureToolbarsForEditing:a3 collapsed:a4];
  [(THNotesViewControllerPadAccessibility *)self _thaxApplyAccessibilityInfo];
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)handleAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THNotesViewControllerPadAccessibility;
  [(THNotesViewControllerPadAccessibility *)&v4 handleAction:a3];
  UIAccessibilityPostNotification(TSAccessibilityMoveToElementNotification, [(THUIBarButtonItemAccessibility *)[(THNotesViewControllerPadAccessibility *)self _thaxSelectButton] thaxView]);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (void)handleStudy:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewControllerPadAccessibility;
  [(THNotesViewControllerPadAccessibility *)&v3 handleStudy:a3];
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
}

- (BOOL)accessibilityPerformEscape
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_293140;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
  return 1;
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)THNotesViewControllerPadAccessibility;
  [(THNotesViewControllerPadAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(THNotesViewControllerPadAccessibility *)self _thaxApplyAccessibilityInfo];
}

- (THUIBarButtonItemAccessibility)_thaxSelectButton
{
  char v5 = 0;
  objc_super v3 = objc_opt_class();
  result = (THUIBarButtonItemAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THNotesViewControllerPadAccessibility *)self tsaxValueForKey:@"_selectButtonItem"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THUIBarButtonItemAccessibility)_thaxActionButton
{
  char v5 = 0;
  objc_super v3 = objc_opt_class();
  result = (THUIBarButtonItemAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THNotesViewControllerPadAccessibility *)self tsaxValueForKey:@"_actionButtonItem"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)_thaxApplyAccessibilityInfo
{
  objc_super v3 = THAccessibilityLocalizedString(@"notes.select.button.hint.ios");
  objc_super v4 = [(THNotesViewControllerPadAccessibility *)self _thaxSelectButton];

  [(THUIBarButtonItemAccessibility *)v4 setAccessibilityHint:v3];
}

@end