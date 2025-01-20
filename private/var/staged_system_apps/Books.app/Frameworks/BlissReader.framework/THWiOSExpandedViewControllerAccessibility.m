@interface THWiOSExpandedViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
- (THWAdornmentControllerAccessibility)thaxAdornmentController;
- (TSDInteractiveCanvasControllerAccessibility)thaxIcc;
- (TSDiOSCanvasViewControllerAccessibility)thaxCvc;
- (UIView)thaxView;
- (id)thaxExpandedRep;
- (int)thaxExpandedRepControllerState;
- (void)animationControllerDidPresentPostCommit:(id)a3;
- (void)thaxDismiss;
- (void)thaxSetInsetsNeedUpdate;
@end

@implementation THWiOSExpandedViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWiOSExpandedViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)animationControllerDidPresentPostCommit:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWiOSExpandedViewControllerAccessibility;
  [(THWiOSExpandedViewControllerAccessibility *)&v4 animationControllerDidPresentPostCommit:a3];
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    [(THWAdornmentControllerAccessibility *)[(THWiOSExpandedViewControllerAccessibility *)self thaxAdornmentController] thaxSetAlwaysShowPanels:[(THWiOSExpandedViewControllerAccessibility *)self thaxExpandedRepControllerState] == 2];
    [(THWiOSExpandedViewControllerAccessibility *)self thaxSetInsetsNeedUpdate];
    UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0);
  }
}

- (BOOL)accessibilityPerformEscape
{
  return 1;
}

- (void)thaxDismiss
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_29A2E8;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)thaxSetInsetsNeedUpdate
{
  id v2 = [(THWiOSExpandedViewControllerAccessibility *)self thaxExpandedRep];
  +[TSAccessibilitySafeCategory tsaxTargetClass];
  if (objc_opt_isKindOfClass())
  {
    char v5 = 0;
    v3 = objc_opt_class();
    Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v5);
    if (v5) {
      abort();
    }
    [(objc_class *)v4 thaxSetInsetsNeedUpdate];
  }
}

- (UIView)thaxView
{
  return (UIView *)[(THWiOSExpandedViewControllerAccessibility *)self tsaxValueForKey:@"view"];
}

- (id)thaxExpandedRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWiOSExpandedViewControllerAccessibility *)self tsaxValueForKey:@"expandedRep"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSDInteractiveCanvasControllerAccessibility)thaxIcc
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWiOSExpandedViewControllerAccessibility *)self tsaxValueForKey:@"icc"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSDiOSCanvasViewControllerAccessibility)thaxCvc
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = (TSDiOSCanvasViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWiOSExpandedViewControllerAccessibility *)self tsaxValueForKey:@"cvc"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THWAdornmentControllerAccessibility)thaxAdornmentController
{
  char v5 = 0;
  v3 = objc_opt_class();
  id result = (THWAdornmentControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWiOSExpandedViewControllerAccessibility *)self tsaxValueForKey:@"adornmentController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (int)thaxExpandedRepControllerState
{
  return [(THWiOSExpandedViewControllerAccessibility *)self tsaxIntValueForKey:@"expandedRepControllerState"];
}

@end