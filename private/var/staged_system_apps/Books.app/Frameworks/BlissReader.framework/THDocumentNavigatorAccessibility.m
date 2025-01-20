@interface THDocumentNavigatorAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (THInteractiveCanvasControllerAccessibility)thaxInteractiveCanvasController;
- (THSectionControllerAccessibility)_thaxSectionController;
- (unint64_t)thaxAbsolutePageIndexForBeginningOfSection;
- (unint64_t)thaxCurrentAbsolutePageIndex;
- (void)p_jumpToStorageAnchor:(id)a3 pulse:(BOOL)a4;
@end

@implementation THDocumentNavigatorAccessibility

+ (id)tsaxTargetClassName
{
  return @"THDocumentNavigator";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thaxCurrentAbsolutePageIndex
{
  return (unint64_t)[(THDocumentNavigatorAccessibility *)self tsaxUnsignedIntegerValueForKey:@"currentAbsolutePageIndex"];
}

- (unint64_t)thaxAbsolutePageIndexForBeginningOfSection
{
  return (unint64_t)[(THDocumentNavigatorAccessibility *)self tsaxUnsignedIntegerValueForKey:@"absolutePageIndexForBeginningOfSection"];
}

- (THInteractiveCanvasControllerAccessibility)thaxInteractiveCanvasController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THDocumentNavigatorAccessibility *)self tsaxValueForKey:@"interactiveCanvasController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)p_jumpToStorageAnchor:(id)a3 pulse:(BOOL)a4
{
  v13.receiver = self;
  v13.super_class = (Class)THDocumentNavigatorAccessibility;
  [(THDocumentNavigatorAccessibility *)&v13 p_jumpToStorageAnchor:a3 pulse:a4];
  if ([(TSDCanvasViewAccessibility *)[(THTSDInteractiveCanvasControllerAccessibility *)[(THDocumentNavigatorAccessibility *)self thaxInteractiveCanvasController] thaxCanvasView] tsaxCanMoveAXFocusIntoContent])
  {
    char v12 = 0;
    v6 = objc_opt_class();
    Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)[a3 contentNode], 1, &v12);
    if (v12) {
      abort();
    }
    Class v8 = v7;
    v9 = [(THSectionControllerAccessibility *)[(THDocumentNavigatorAccessibility *)self _thaxSectionController] thaxPresentationType];
    id v10 = [(objc_class *)v8 thaxBodyStorageForPresentationType:v9];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_29A6FC;
    v11[3] = &unk_46C8B0;
    v11[4] = [(objc_class *)v8 thaxNodeUniqueIDForInfo:v10];
    v11[5] = a3;
    v11[6] = self;
    v11[7] = v10;
    v11[8] = v8;
    v11[9] = v9;
    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v11, 1.0);
  }
}

- (THSectionControllerAccessibility)_thaxSectionController
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THSectionControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THDocumentNavigatorAccessibility *)self tsaxValueForKey:@"sectionController"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

@end