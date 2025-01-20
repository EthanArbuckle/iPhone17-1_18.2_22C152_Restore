@interface THTOCViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxIntroMediaControllerIsActive;
- (THBookViewControllerAccessibility)thaxDelegate;
- (double)_thaxLastTimestampForPerformingBlockAffectingMediaControllerState;
- (id)thaxDocumentViewController;
- (void)_axHideToolbar;
- (void)_axPerformBlockAffectingMediaControllerState:(id)a3;
- (void)_axShowToolbar;
- (void)_thaxSetLastTimestampForPerformingBlockAffectingMediaControllerState:(double)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation THTOCViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THTOCViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (double)_thaxLastTimestampForPerformingBlockAffectingMediaControllerState
{
  __TSAccessibilityGetAssociatedTimeInterval(self, &unk_573A6C);
  return result;
}

- (void)_thaxSetLastTimestampForPerformingBlockAffectingMediaControllerState:(double)a3
{
}

- (THBookViewControllerAccessibility)thaxDelegate
{
  char v5 = 0;
  v3 = objc_opt_class();
  double result = (THBookViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THTOCViewControllerAccessibility *)self tsaxValueForKey:@"delegate"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (BOOL)thaxIntroMediaControllerIsActive
{
  return [(THTOCViewControllerAccessibility *)self tsaxBoolValueForKey:@"introMediaControllerIsActive"];
}

- (id)thaxDocumentViewController
{
  id result = [(THTOCViewControllerAccessibility *)self thaxDelegate];
  if (result)
  {
    return [result tsaxValueForKey:@"documentViewController"];
  }
  return result;
}

- (void)_axShowToolbar
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v3 = [(THTOCViewControllerAccessibility *)self thaxDocumentViewController];
    if (objc_opt_respondsToSelector())
    {
      [v3 showToolbarAnimated:0];
    }
  }
}

- (void)_axHideToolbar
{
  if (UIAccessibilityIsVoiceOverRunning())
  {
    id v3 = [(THTOCViewControllerAccessibility *)self thaxDocumentViewController];
    if (objc_opt_respondsToSelector())
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_2939AC;
      v4[3] = &unk_456DE0;
      v4[4] = v3;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
        abort();
      }
    }
  }
}

- (void)_axPerformBlockAffectingMediaControllerState:(id)a3
{
  [(THTOCViewControllerAccessibility *)self _thaxLastTimestampForPerformingBlockAffectingMediaControllerState];
  double v6 = v5;
  +[NSDate timeIntervalSinceReferenceDate];
  if (v7 - v6 <= 1.0)
  {
    v8 = (void (*)(id))*((void *)a3 + 2);
    v8(a3);
  }
  else
  {
    -[THTOCViewControllerAccessibility _thaxSetLastTimestampForPerformingBlockAffectingMediaControllerState:](self, "_thaxSetLastTimestampForPerformingBlockAffectingMediaControllerState:");
    (*((void (**)(id))a3 + 2))(a3);
    if ([(THTOCViewControllerAccessibility *)self tsaxBoolValueForKey:@"introMediaControllerIsActive"])
    {
      [(THTOCViewControllerAccessibility *)self _axHideToolbar];
    }
    else
    {
      [(THTOCViewControllerAccessibility *)self _axShowToolbar];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_293B78;
  v3[3] = &unk_457278;
  BOOL v4 = a3;
  v3[4] = self;
  [(THTOCViewControllerAccessibility *)self _axPerformBlockAffectingMediaControllerState:v3];
}

@end