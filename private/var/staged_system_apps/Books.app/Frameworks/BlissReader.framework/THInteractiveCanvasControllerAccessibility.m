@interface THInteractiveCanvasControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)thaxAbsolutePageNumberIsFirstPageOfChapter:(unint64_t)a3;
- (BOOL)thaxAbsolutePageNumberIsFirstPageOfLesson:(unint64_t)a3;
- (BOOL)thaxHyperlinkFieldRepresentsAGlossaryTerm:(id)a3;
- (BOOL)thaxIsAtEndOfBook;
- (BOOL)thaxIsOnFirstPageOfCurrentChapter;
- (BOOL)thaxIsOnFirstPageOfCurrentLesson;
- (BOOL)thaxShouldFilterTopLevelRepsForHitTesting;
- (NSString)thaxCurrentChapterName;
- (NSString)thaxCurrentLessonName;
- (NSString)thaxCurrentSectionString;
- (THDocumentNavigatorAccessibility)thaxDocumentNavigator;
- (THDocumentRootAccessibility)thaxDocumentRoot;
- (THDocumentViewControllerAccessibility)thaxDocumentViewController;
- (THModelContentNodeAccessibility)thaxCurrentContentNode;
- (THModelNodeAccessibility)thaxCurrentChapterNode;
- (THModelNodeAccessibility)thaxCurrentLessonNode;
- (id)_accessibilityResponderElement;
- (id)thaxBodyRepForStorage:(id)a3;
- (id)thaxCurrentNavigationUnit;
- (id)thaxCurrentResponderElement;
- (id)thaxSectionNameForAbsolutePageIndex:(unint64_t)a3;
- (unint64_t)thaxCurrentAbsolutePageIndex;
- (void)thaxHandleHyperlink:(id)a3 hitRep:(id)a4;
- (void)thaxPressableRepWasPressedAtActivationPoint:(id)a3;
- (void)thaxSetCurrentResponderElement:(id)a3;
- (void)thaxSetShouldFilterTopLevelRepsForHitTesting:(BOOL)a3;
@end

@implementation THInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THInteractiveCanvasController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (THDocumentNavigatorAccessibility)thaxDocumentNavigator
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THDocumentNavigatorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"documentNavigator"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THDocumentRootAccessibility)thaxDocumentRoot
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (THDocumentRootAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THInteractiveCanvasControllerAccessibility *)self tsaxValueForKey:@"documentRoot"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THModelNodeAccessibility)thaxCurrentChapterNode
{
  v3 = [(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxNavigationModel];
  v4 = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentContentNode];

  return (THModelNodeAccessibility *)[(THDocumentNavigationModelAccessibility *)v3 thaxChapterNodeForContentNode:v4];
}

- (THModelNodeAccessibility)thaxCurrentLessonNode
{
  v3 = [(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxNavigationModel];
  v4 = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentContentNode];

  return (THModelNodeAccessibility *)[(THDocumentNavigationModelAccessibility *)v3 thaxLessonNodeForContentNode:v4];
}

- (THModelContentNodeAccessibility)thaxCurrentContentNode
{
  id v3 = +[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:[(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxContext]];
  v4 = [(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxRootNode];
  unint64_t v5 = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentAbsolutePageIndex];

  return (THModelContentNodeAccessibility *)[(THModelNodeAccessibility *)v4 thaxContentNodeForRelativePageIndex:v5 forPresentationType:v3];
}

- (unint64_t)thaxCurrentAbsolutePageIndex
{
  v2 = [(THInteractiveCanvasControllerAccessibility *)self thaxDocumentNavigator];

  return [(THDocumentNavigatorAccessibility *)v2 thaxCurrentAbsolutePageIndex];
}

- (NSString)thaxCurrentChapterName
{
  id v3 = [(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxNavigationModel];
  id v4 = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentNavigationUnit];

  return (NSString *)[(THDocumentNavigationModelAccessibility *)v3 thaxChapterAndNumberStringForNavigationUnit:v4];
}

- (NSString)thaxCurrentSectionString
{
  v2 = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentContentNode];
  id v3 = [(THModelContainerNodeAccessibility *)[(THModelNodeAccessibility *)v2 thaxParent] thaxIndexOfNode:v2];
  if (v3 && v3 != (id)0x7FFFFFFFFFFFFFFFLL) {
    return +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", THAccessibilityLocalizedString(@"section.number %@"), +[NSNumber numberWithUnsignedInteger:v3]);
  }
  else {
    return 0;
  }
}

- (NSString)thaxCurrentLessonName
{
  id v3 = [(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot];
  id v4 = +[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:[(THDocumentRootAccessibility *)v3 thaxContext]];
  unint64_t v5 = [(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxNavigationModel];
  unint64_t v6 = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentAbsolutePageIndex];

  return (NSString *)[(THDocumentNavigationModelAccessibility *)v5 thaxMinorSnippetForAbsolutePageIndex:v6 withDocumentRoot:v3 forPresentationType:v4];
}

- (BOOL)thaxIsOnFirstPageOfCurrentChapter
{
  unint64_t v3 = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentAbsolutePageIndex];

  return [(THInteractiveCanvasControllerAccessibility *)self thaxAbsolutePageNumberIsFirstPageOfChapter:v3];
}

- (BOOL)thaxIsOnFirstPageOfCurrentLesson
{
  unint64_t v3 = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentAbsolutePageIndex];

  return [(THInteractiveCanvasControllerAccessibility *)self thaxAbsolutePageNumberIsFirstPageOfLesson:v3];
}

- (id)thaxCurrentNavigationUnit
{
  unint64_t v3 = [(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxNavigationModel];
  id v4 = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentContentNode];

  return [(THDocumentNavigationModelAccessibility *)v3 thaxNavigationUnitContainingContentNode:v4];
}

- (BOOL)thaxIsAtEndOfBook
{
  if ([[(THModelNodeAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxCurrentChapterNode] thaxParent] thaxAbsolutePageRangeForPresentationType:+[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:[(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxContext]]])
  {
    int ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
    if (ShouldPerformValidationChecks)
    {
      int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      int v11 = __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Expected parent model node of chapter node to contain the full book.", v6, v7, v8, v9, v10, v13);
      LOBYTE(ShouldPerformValidationChecks) = 0;
      if (v11) {
        abort();
      }
    }
  }
  else
  {
    LOBYTE(ShouldPerformValidationChecks) = (char *)[(THInteractiveCanvasControllerAccessibility *)self thaxCurrentAbsolutePageIndex]+ 1 == v3;
  }
  return ShouldPerformValidationChecks;
}

- (void)thaxHandleHyperlink:(id)a3 hitRep:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2838D8;
  v4[3] = &unk_456F28;
  v4[4] = self;
  v4[5] = a3;
  v4[6] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
}

- (id)thaxSectionNameForAbsolutePageIndex:(unint64_t)a3
{
  id v5 = +[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:[(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxContext]];
  uint64_t v6 = [(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxNavigationModel];
  uint64_t v7 = [(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot];

  return [(THDocumentNavigationModelAccessibility *)v6 thaxMinorSnippetForAbsolutePageIndex:a3 withDocumentRoot:v7 forPresentationType:v5];
}

- (BOOL)thaxAbsolutePageNumberIsFirstPageOfChapter:(unint64_t)a3
{
  id v4 = [(THModelNodeAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxCurrentChapterNode] thaxAbsolutePageRangeForPresentationType:+[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:[(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxContext]]];
  return a3 != 0x7FFFFFFFFFFFFFFFLL && v4 == (id)a3;
}

- (BOOL)thaxAbsolutePageNumberIsFirstPageOfLesson:(unint64_t)a3
{
  id v4 = [(THModelNodeAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxCurrentLessonNode] thaxAbsolutePageRangeForPresentationType:+[THPresentationTypeAccessibility thaxPaginatedPresentationTypeInContext:[(THDocumentRootAccessibility *)[(THInteractiveCanvasControllerAccessibility *)self thaxDocumentRoot] thaxContext]]];
  return a3 != 0x7FFFFFFFFFFFFFFFLL && v4 == (id)a3;
}

- (id)thaxBodyRepForStorage:(id)a3
{
  id v4 = [(TSDCanvasAccessibility *)[(TSDInteractiveCanvasControllerAccessibility *)self tsaxCanvas] tsaxAllReps];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = *(void *)v15;
LABEL_3:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v15 != v7) {
      objc_enumerationMutation(v4);
    }
    uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * v8);
    uint64_t v10 = objc_opt_class();
    Class v11 = __TSAccessibilityCastAsSafeCategory(v10, v9, 0, 0);
    if (v11)
    {
      Class v12 = v11;
      if ([(objc_class *)v11 tsaxStorage] == a3) {
        return v12;
      }
    }
    if (v6 == (id)++v8)
    {
      id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)thaxShouldFilterTopLevelRepsForHitTesting
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_573A6E);
}

- (void)thaxSetShouldFilterTopLevelRepsForHitTesting:(BOOL)a3
{
}

- (id)thaxCurrentResponderElement
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A6F);
}

- (void)thaxSetCurrentResponderElement:(id)a3
{
}

- (THDocumentViewControllerAccessibility)thaxDocumentViewController
{
  unint64_t v3 = objc_opt_class();
  id v4 = [(TSDInteractiveCanvasControllerAccessibility *)self tsaxDelegate];

  return (THDocumentViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);
}

- (BOOL)thaxHyperlinkFieldRepresentsAGlossaryTerm:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v5 = [(THInteractiveCanvasControllerAccessibility *)self thaxDocumentViewController];
  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_296BE4;
    v8[3] = &unk_46C7B8;
    v8[4] = self;
    v8[5] = a3;
    v8[6] = v5;
    v8[7] = &v9;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
      abort();
    }
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (void)thaxPressableRepWasPressedAtActivationPoint:(id)a3
{
  if (TSAccessibilityShouldPerformValidationChecks()
    && ([a3 conformsToProtocol:NSProtocolFromString(@"THWPressableRep")] & 1) == 0
    && (int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
        __TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"You should not call this method for a rep that does not conform to the THWPressableRep protocol!", v6, v7, v8, v9, v10, v11[0]))|| (v11[0] = (uint64_t)_NSConcreteStackBlock, v11[1] = 3221225472, v11[2] = (uint64_t)sub_296D10, v11[3] = (uint64_t)&unk_456E38, v11[4] = (uint64_t)self, v11[5] = (uint64_t)a3, __TSAccessibilityPerformSafeBlock((uint64_t)v11)))
  {
    abort();
  }
}

- (id)_accessibilityResponderElement
{
  id result = [(THInteractiveCanvasControllerAccessibility *)self thaxCurrentResponderElement];
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)THInteractiveCanvasControllerAccessibility;
    return [(THInteractiveCanvasControllerAccessibility *)&v4 _accessibilityResponderElement];
  }
  return result;
}

@end