@interface THiOSIntroMediaViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THiOSIntroMediaViewAccessibility)_thaxView;
- (void)dealloc;
- (void)loadView;
- (void)thaxIntroMediaViewDidPerformEscapeGesture;
@end

@implementation THiOSIntroMediaViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THiOSIntroMediaViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSIntroMediaViewControllerAccessibility;
  [(THiOSIntroMediaViewControllerAccessibility *)&v4 loadView];
  [(THiOSIntroMediaViewAccessibility *)[(THiOSIntroMediaViewControllerAccessibility *)self _thaxView] thaxSetDelegate:self];
  if ([(THiOSIntroMediaViewControllerAccessibility *)self tsaxBoolValueForKey:@"p_isImage"])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_2872EC;
    v3[3] = &unk_456DE0;
    v3[4] = self;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
      abort();
    }
  }
}

- (void)dealloc
{
  if ([(THiOSIntroMediaViewControllerAccessibility *)self tsaxBoolValueForKey:@"isViewLoaded"])[(THiOSIntroMediaViewAccessibility *)[(THiOSIntroMediaViewControllerAccessibility *)self _thaxView] thaxSetDelegate:0]; {
  v3.receiver = self;
  }
  v3.super_class = (Class)THiOSIntroMediaViewControllerAccessibility;
  [(THiOSIntroMediaViewControllerAccessibility *)&v3 dealloc];
}

- (void)thaxIntroMediaViewDidPerformEscapeGesture
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_287578;
  v2[3] = &unk_456DE0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (THiOSIntroMediaViewAccessibility)_thaxView
{
  char v5 = 0;
  objc_super v3 = objc_opt_class();
  result = (THiOSIntroMediaViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THiOSIntroMediaViewControllerAccessibility *)self tsaxValueForKey:@"view"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end