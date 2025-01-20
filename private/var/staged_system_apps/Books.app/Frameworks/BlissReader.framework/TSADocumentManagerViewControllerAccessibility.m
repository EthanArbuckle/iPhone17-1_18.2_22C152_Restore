@interface TSADocumentManagerViewControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)_tsaxAddButton;
- (id)_tsaxShareButton;
- (void)_loadEditModeToolbarForInterfaceOrientation:(int64_t)a3;
- (void)_loadNormalModeToolbarForInterfaceOrientation:(int64_t)a3;
@end

@implementation TSADocumentManagerViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSADocumentManagerViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (void)_loadNormalModeToolbarForInterfaceOrientation:(int64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)TSADocumentManagerViewControllerAccessibility;
  [(TSADocumentManagerViewControllerAccessibility *)&v18 _loadNormalModeToolbarForInterfaceOrientation:a3];
  id v4 = [(TSADocumentManagerViewControllerAccessibility *)self _tsaxAddButton];
  if (TSAccessibilityShouldPerformValidationChecks()
    && !v4
    && (int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
        __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Add button should not be nil.", v6, v7, v8, v9, v10, (uint64_t)v18.receiver))|| ([v4 setAccessibilityLabel:TSAccessibilityLocalizedString(@"create.document.button.label")], id v11 = -[TSADocumentManagerViewControllerAccessibility _tsaxShareButton](self, "_tsaxShareButton"), TSAccessibilityShouldPerformValidationChecks())&& !v11&& (v12 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(), __TSAccessibilityHandleValidationErrorWithDescription(v12,
                        0,
                        @"Share button should not be nil.",
                        v13,
                        v14,
                        v15,
                        v16,
                        v17,
                        (uint64_t)v18.receiver)))
  {
    abort();
  }
  [v11 setAccessibilityLabel:TSAccessibilityLocalizedString(@"share.button.label")];
}

- (void)_loadEditModeToolbarForInterfaceOrientation:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSADocumentManagerViewControllerAccessibility;
  [(TSADocumentManagerViewControllerAccessibility *)&v4 _loadEditModeToolbarForInterfaceOrientation:a3];
  [-[TSADocumentManagerViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"_deleteButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"delete.button")];
  [-[TSADocumentManagerViewControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"_duplicateButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"duplicate.button")];
}

- (id)_tsaxAddButton
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADocumentManagerViewControllerAccessibility *)self tsaxValueForKey:@"_addButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)_tsaxShareButton
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSADocumentManagerViewControllerAccessibility *)self tsaxValueForKey:@"_shareButton"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end