@interface CRLPopoverBasedViewControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
- (UIBarButtonItem)_crlaxDoneButton;
- (void)_crlaxApplyAccessibilityInfo;
- (void)crlaxLoadAccessibilityInformation;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CRLPopoverBasedViewControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLPopoverBasedViewController";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLPopoverBasedViewControllerAccessibility;
  [(CRLPopoverBasedViewControllerAccessibility *)&v4 viewWillAppear:a3];
  [(CRLPopoverBasedViewControllerAccessibility *)self _crlaxApplyAccessibilityInfo];
}

- (BOOL)accessibilityPerformEscape
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100303B04;
  v3[3] = &unk_1014CBBB0;
  v3[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
  return 1;
}

- (void)crlaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)CRLPopoverBasedViewControllerAccessibility;
  [(CRLPopoverBasedViewControllerAccessibility *)&v3 crlaxLoadAccessibilityInformation];
  [(CRLPopoverBasedViewControllerAccessibility *)self _crlaxApplyAccessibilityInfo];
}

- (UIBarButtonItem)_crlaxDoneButton
{
  v2 = [(CRLPopoverBasedViewControllerAccessibility *)self navigationItem];
  objc_super v3 = [v2 rightBarButtonItem];

  return (UIBarButtonItem *)v3;
}

- (void)_crlaxApplyAccessibilityInfo
{
  objc_super v3 = [(CRLPopoverBasedViewControllerAccessibility *)self _crlaxDoneButton];
  objc_super v4 = [v3 title];
  id v5 = [v4 length];

  if (!v5)
  {
    id v8 = +[NSBundle mainBundle];
    v6 = [v8 localizedStringForKey:@"Done" value:0 table:0];
    v7 = [(CRLPopoverBasedViewControllerAccessibility *)self _crlaxDoneButton];
    [v7 setAccessibilityLabel:v6];
  }
}

@end