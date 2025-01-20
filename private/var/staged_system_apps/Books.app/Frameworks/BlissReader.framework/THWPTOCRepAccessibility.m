@interface THWPTOCRepAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)_thaxContainsSmartFields;
- (BOOL)isAccessibilityElement;
- (THChapterBrowserControllerAccessibility)thaxChapterBrowserController;
- (THChapterViewControllerAccessibility)thaxChapterViewController;
- (THTOCTileModelAccessibility)thaxTileModel;
- (id)_thaxHyperlinkFieldForRange:(_NSRange)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)accessibilityContainerType;
- (unint64_t)thaxLineCount;
- (void)dealloc;
- (void)tsaxChildWillBeRemoved:(id)a3;
- (void)tsaxLoadAccessibilityInformation;
- (void)tsaxLoadChildrenIntoCollection:(id)a3;
@end

@implementation THWPTOCRepAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWPTOCRep";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)thaxLineCount
{
  v2 = [(TSWPRepAccessibility *)self tsaxColumns];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  unint64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += (unint64_t)[*(id *)(*((void *)&v9 + 1) + 8 * i) tsaxCountLines];
    }
    id v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
}

- (THChapterViewControllerAccessibility)thaxChapterViewController
{
  char v17 = 0;
  id v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(TSWPRepAccessibility *)self tsaxInteractiveCanvasController], 1, &v17);
  if (v17) {
    goto LABEL_5;
  }
  Class v5 = v4;
  char v16 = 0;
  uint64_t v6 = objc_opt_class();
  Class v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)[(objc_class *)v5 tsaxDelegate], 1, &v16);
  if (v16) {
    goto LABEL_5;
  }
  Class v8 = v7;
  char v15 = 0;
  long long v9 = objc_opt_class();
  Class v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)[(objc_class *)v8 thaxDelegate], 1, &v15);
  if (v15
    || (Class v11 = v10,
        char v14 = 0,
        long long v12 = objc_opt_class(),
        result = (THChapterViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v12, (uint64_t)objc_msgSend(-[objc_class tsaxInteractiveCanvasController](v11, "tsaxInteractiveCanvasController"), "tsaxDelegate"), 1, &v14), v14))
  {
LABEL_5:
    abort();
  }
  return result;
}

- (THChapterBrowserControllerAccessibility)thaxChapterBrowserController
{
  char v5 = 0;
  id v3 = objc_opt_class();
  result = (THChapterBrowserControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THChapterViewControllerAccessibility *)[(THWPTOCRepAccessibility *)self thaxChapterViewController] thaxDelegate], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (THTOCTileModelAccessibility)thaxTileModel
{
  id v3 = [(THWPTOCRepAccessibility *)self thaxChapterBrowserController];
  char v7 = 0;
  Class v4 = objc_opt_class();
  Class v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)[(THChapterBrowserControllerAccessibility *)v3 thaxDelegate], 1, &v7);
  if (v7) {
    abort();
  }
  return (THTOCTileModelAccessibility *)[(objc_class *)v5 thaxChapterBrowserController:v3 tocTileModelAtIndex:[(THChapterViewControllerAccessibility *)[(THWPTOCRepAccessibility *)self thaxChapterViewController] thaxChapterIndex]];
}

- (void)dealloc
{
  [(THWPTOCRepAccessibility *)self tsaxInvalidateChildrenImmediately];
  v3.receiver = self;
  v3.super_class = (Class)THWPTOCRepAccessibility;
  [(TSDRepAccessibility *)&v3 dealloc];
}

- (BOOL)isAccessibilityElement
{
  return ![(THWPTOCRepAccessibility *)self _thaxContainsSmartFields];
}

- (int64_t)accessibilityContainerType
{
  v5.receiver = self;
  v5.super_class = (Class)THWPTOCRepAccessibility;
  id v3 = [(THWPTOCRepAccessibility *)&v5 accessibilityContainerType];
  if ([(THWPTOCRepAccessibility *)self isAccessibilityElement]) {
    return (int64_t)v3;
  }
  else {
    return 4;
  }
}

- (id)accessibilityLabel
{
  if ([(THWPTOCRepAccessibility *)self isAccessibilityElement]) {
    return 0;
  }

  return THAccessibilityLocalizedString(@"table.of.contents");
}

- (id)accessibilityValue
{
  if (![(THWPTOCRepAccessibility *)self isAccessibilityElement]) {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)THWPTOCRepAccessibility;
  return [(TSWPRepAccessibility *)&v4 accessibilityValue];
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return ![(THWPTOCRepAccessibility *)self isAccessibilityElement];
}

- (void)tsaxLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)THWPTOCRepAccessibility;
  [(TSWPRepAccessibility *)&v3 tsaxLoadAccessibilityInformation];
  [(THWPTOCRepAccessibility *)self tsaxEnsureChildrenAreLoaded];
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  obj = [(TSWPRepAccessibility *)self tsaxColumns];
  id v17 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v17)
  {
    uint64_t v16 = *(void *)v19;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        char v7 = (char *)[v6 tsaxCountLines];
        if (v7)
        {
          Class v8 = v7;
          for (j = 0; j != v8; ++j)
          {
            id v10 = [v6 tsaxRangeOfLineFragmentAtIndex:j];
            uint64_t v12 = v11;
            id v13 = -[THWPTOCRepAccessibility _thaxHyperlinkFieldForRange:](self, "_thaxHyperlinkFieldForRange:", v10, v11);
            if (v13)
            {
              char v14 = -[THWPTOCRepEntryAccessibilityElement initWithParentTOCRep:linkField:textRange:indexInTOC:]([THWPTOCRepEntryAccessibilityElement alloc], "initWithParentTOCRep:linkField:textRange:indexInTOC:", self, v13, v10, v12, j);
              [a3 addObject:v14];
            }
          }
        }
      }
      id v17 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v17);
  }
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
  objc_super v4 = (objc_class *)objc_opt_class();
  objc_super v5 = (void *)__TSAccessibilityCastAsClass(v4, (uint64_t)a3, 0, 0);

  [v5 setParentTOCRep:0];
}

- (BOOL)_thaxContainsSmartFields
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_299360;
  v4[3] = &unk_46C888;
  v4[4] = &v5;
  [(TSWPStorageAccessibility *)[(TSWPRepAccessibility *)self tsaxStorage] tsaxEnumerateSmartFieldsUsingBlock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)_thaxHyperlinkFieldForRange:(_NSRange)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  long long v9 = sub_29947C;
  id v10 = sub_29948C;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_299498;
  v5[3] = &unk_46C888;
  v5[4] = &v6;
  -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:]([(TSWPRepAccessibility *)self tsaxStorage], "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, a3.location, a3.length, v5);
  objc_super v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end