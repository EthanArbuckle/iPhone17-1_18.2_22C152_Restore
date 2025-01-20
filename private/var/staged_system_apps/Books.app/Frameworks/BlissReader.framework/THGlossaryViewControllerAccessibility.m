@interface THGlossaryViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)followGlossaryAnchor:(id)a3;
- (id)_thaxActiveEntryViewControllerBeingLoaded;
- (void)_axDefinitionsScrollViewPositionDidChange;
- (void)_axDidSwitchToEntryViewController:(id)a3 shouldWaitForEntryToBeLoaded:(BOOL *)a4;
- (void)_axGlossaryDefinitionsViewController:(id)a3 entryDidLoad:(id)a4;
- (void)_thaxSetActiveEntryViewControllerBeingLoaded:(id)a3;
- (void)didScrollToEntry:(id)a3;
@end

@implementation THGlossaryViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THGlossaryViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)_thaxActiveEntryViewControllerBeingLoaded
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A58);
}

- (void)_thaxSetActiveEntryViewControllerBeingLoaded:(id)a3
{
}

- (void)_axDefinitionsScrollViewPositionDidChange
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_2865A0;
  v2[3] = &unk_456DE0;
  v2[4] = [[[self tsaxValueForKey:@"definitionsViewController"] tsaxValueForKey:@"mEntryViewControllers"] tsaxValueForKey:@"valueEnumerator"];
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2)) {
    abort();
  }
}

- (void)_axDidSwitchToEntryViewController:(id)a3 shouldWaitForEntryToBeLoaded:(BOOL *)a4
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  if (([a3 tsaxBoolValueForKey:@"loading"] & 1) == 0)
  {
    id v6 = [a3 tsaxValueForKey:@"mInfo"];
    id v7 = [a3 tsaxValueForKey:@"mICC"];
    id v8 = [v6 tsaxValueForKey:@"headerInfo"];
    if (v8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_286860;
      v9[3] = &unk_457DC8;
      v9[4] = v7;
      v9[5] = v8;
      v9[6] = &v10;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v9)) {
        abort();
      }
    }
  }
  if (a4) {
    *a4 = *((unsigned char *)v11 + 24) ^ 1;
  }
  _Block_object_dispose(&v10, 8);
}

- (void)didScrollToEntry:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THGlossaryViewControllerAccessibility;
  [(THGlossaryViewControllerAccessibility *)&v4 didScrollToEntry:a3];
  [(THGlossaryViewControllerAccessibility *)self _axDefinitionsScrollViewPositionDidChange];
}

- (BOOL)followGlossaryAnchor:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)THGlossaryViewControllerAccessibility;
  BOOL v4 = [(THGlossaryViewControllerAccessibility *)&v16 followGlossaryAnchor:a3];
  [(THGlossaryViewControllerAccessibility *)self _axDefinitionsScrollViewPositionDidChange];
  id v5 = [(THGlossaryViewControllerAccessibility *)self tsaxValueForKey:@"definitionsViewController"];
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  char v13 = sub_286AA8;
  v14 = sub_286AB8;
  uint64_t v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_286AC4;
  v9[3] = &unk_458E98;
  v9[4] = [v5 tsaxValueForKey:@"mEntryViewControllers"];
  v9[5] = &v10;
  v9[6] = [v5 tsaxIntegerValueForKey:@"p_currentEntryIndex"];
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v9)) {
    abort();
  }
  uint64_t v6 = v11[5];
  if (v6)
  {
    char v8 = 1;
    [(THGlossaryViewControllerAccessibility *)self _axDidSwitchToEntryViewController:v6 shouldWaitForEntryToBeLoaded:&v8];
    if (v8) {
      [(THGlossaryViewControllerAccessibility *)self _thaxSetActiveEntryViewControllerBeingLoaded:v11[5]];
    }
  }
  else
  {
    UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
  }
  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)_axGlossaryDefinitionsViewController:(id)a3 entryDidLoad:(id)a4
{
  id v6 = [(THGlossaryViewControllerAccessibility *)self _thaxActiveEntryViewControllerBeingLoaded];
  if (v6 && v6 == a4)
  {
    char v7 = 1;
    [(THGlossaryViewControllerAccessibility *)self _axDidSwitchToEntryViewController:a4 shouldWaitForEntryToBeLoaded:&v7];
    if (!v7) {
      [(THGlossaryViewControllerAccessibility *)self _thaxSetActiveEntryViewControllerBeingLoaded:0];
    }
  }
}

@end