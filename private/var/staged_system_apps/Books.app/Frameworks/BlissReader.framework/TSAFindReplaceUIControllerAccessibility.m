@interface TSAFindReplaceUIControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSAFindReplaceControllerAccessibility)_tsaxFindReplaceController;
- (TSWPEditingControllerAccessibility)tsaxTextEditingController;
- (TSWPSelectionAccessibility)_tsaxActiveTextFindResultSelection;
- (id)tsaxExitFind;
- (void)_tsaxClearWeakReferences;
- (void)dealloc;
- (void)p_findNextResultInDirection:(unint64_t)a3 alertingIfNotFound:(BOOL)a4;
- (void)viewDidLoad;
- (void)viewWillUnload;
@end

@implementation TSAFindReplaceUIControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSAFindReplaceUIController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (TSWPEditingControllerAccessibility)tsaxTextEditingController
{
  if (![+[TSAccessibility sharedInstance] supportsAdvancedTextSearchExperience])return 0; {
  v3 = objc_opt_class();
  }
  id v4 = objc_msgSend(objc_msgSend(objc_msgSend(-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", @"_documentViewController"), "tsaxValueForKey:", @"interactiveCanvasController"), "tsaxValueForKey:", @"editorController"), "tsaxValueForKey:", @"textInputEditor");

  return (TSWPEditingControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);
}

- (id)tsaxExitFind
{
  v3 = [(TSAFindReplaceUIControllerAccessibility *)self _tsaxActiveTextFindResultSelection];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_260A1C;
  v5[3] = &unk_456DE0;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  return v3;
}

- (TSAFindReplaceControllerAccessibility)_tsaxFindReplaceController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSAFindReplaceControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSAFindReplaceUIControllerAccessibility *)self tsaxValueForKey:@"findReplaceController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (TSWPSelectionAccessibility)_tsaxActiveTextFindResultSelection
{
  v2 = [(TSAFindReplaceUIControllerAccessibility *)self _tsaxFindReplaceController];

  return [(TSAFindReplaceControllerAccessibility *)v2 tsaxActiveTextFindResultSelection];
}

- (void)_tsaxClearWeakReferences
{
  char v6 = 0;
  v3 = (objc_class *)objc_opt_class();
  id v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v6);
  if (v6) {
    abort();
  }
  char v5 = v4;
  if ([v4 isViewLoaded]) {
    objc_msgSend(objc_msgSend(v5, "view"), "tsaxSetParentFindReplaceController:", 0);
  }
}

- (void)dealloc
{
  [(TSAFindReplaceUIControllerAccessibility *)self _tsaxClearWeakReferences];
  v3.receiver = self;
  v3.super_class = (Class)TSAFindReplaceUIControllerAccessibility;
  [(TSAFindReplaceUIControllerAccessibility *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)TSAFindReplaceUIControllerAccessibility;
  [(TSAFindReplaceUIControllerAccessibility *)&v6 viewDidLoad];
  char v5 = 0;
  objc_super v3 = (objc_class *)objc_opt_class();
  id v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)self, 1, &v5);
  if (v5) {
    abort();
  }
  objc_msgSend(objc_msgSend(v4, "view"), "tsaxSetParentFindReplaceController:", self);
  [-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"_findField", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"find.field")];
  [-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"_nextButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"next.findreplace")];
  [-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"_previousButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"previous.findreplace")];
  [-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"_replaceWithField", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"replace.field")];
  [-[TSAFindReplaceUIControllerAccessibility tsaxValueForKey:](self tsaxValueForKey:@"_gearButton", "setAccessibilityLabel:", TSAccessibilityLocalizedString(@"options.button")];
}

- (void)viewWillUnload
{
  [(TSAFindReplaceUIControllerAccessibility *)self _tsaxClearWeakReferences];
  v3.receiver = self;
  v3.super_class = (Class)TSAFindReplaceUIControllerAccessibility;
  [(TSAFindReplaceUIControllerAccessibility *)&v3 viewWillUnload];
}

- (void)p_findNextResultInDirection:(unint64_t)a3 alertingIfNotFound:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = [(TSAFindReplaceUIControllerAccessibility *)self tsaxTextEditingController];
  if (v7)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_260E34;
    v12[3] = &unk_46BC80;
    BOOL v13 = v4;
    v12[4] = self;
    v12[5] = a3;
    [(TSWPEditingControllerAccessibility *)v7 tsaxPerformBlockAffectingTextSelection:v12];
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)TSAFindReplaceUIControllerAccessibility;
    [(TSAFindReplaceUIControllerAccessibility *)&v11 p_findNextResultInDirection:a3 alertingIfNotFound:v4];
  }
  char v10 = 0;
  v8 = objc_opt_class();
  Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)[self tsaxValueForKey:@"_documentViewController"], 1, &v10);
  if (v10) {
    abort();
  }
  [(TSAFindReplaceControllerAccessibility *)[(TSAFindReplaceUIControllerAccessibility *)self _tsaxFindReplaceController] tsaxDidChangeActiveFindResultInInteractiveCanvasController:v9 window:0];
}

@end