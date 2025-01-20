@interface THiOSStudyViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)accessibilityPerformEscape;
- (THNoteCardsControllerAccessibility)_thaxNoteCardsController;
- (void)done:(id)a3;
- (void)p_animateTransitionInWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation THiOSStudyViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THiOSStudyViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityPerformEscape
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_28B0C4;
  v3[3] = &unk_456DE0;
  v3[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
  return 1;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)THiOSStudyViewControllerAccessibility;
  [(THiOSStudyViewControllerAccessibility *)&v3 viewDidLoad];
  [self tsaxValueForKey:@"view" setAccessibilityViewIsModal:1];
  [(UIView *)[(THNoteCardsControllerAccessibility *)[(THiOSStudyViewControllerAccessibility *)self _thaxNoteCardsController] thaxNoteCardsView] thaxSetUsesChildrenFramesForSorting:1];
}

- (void)p_animateTransitionInWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_28B1C4;
  v4[3] = &unk_457868;
  v4[4] = a3;
  v3.receiver = self;
  v3.super_class = (Class)THiOSStudyViewControllerAccessibility;
  [(THiOSStudyViewControllerAccessibility *)&v3 p_animateTransitionInWithCompletion:v4];
}

- (void)done:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THiOSStudyViewControllerAccessibility;
  -[THiOSStudyViewControllerAccessibility done:](&v4, "done:");
  [a3 _accessibilityUnregister];
}

- (THNoteCardsControllerAccessibility)_thaxNoteCardsController
{
  char v5 = 0;
  objc_super v3 = objc_opt_class();
  result = (THNoteCardsControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THiOSStudyViewControllerAccessibility *)self tsaxValueForKey:@"_noteCardsController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end