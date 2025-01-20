@interface UIApplicationAuditIssuesAccessibility
+ (BOOL)_axAuditElementIsClipping:(id)a3;
+ (BOOL)_axAuditSetSwizzledImp:(void *)a3 orOrigImp:(void *)a4 forMethod:(objc_method *)a5 withSwizzling:(BOOL)a6;
+ (BOOL)_axAuditShouldElementBeCheckedForClipping:(id)a3;
+ (BOOL)_axAuditSwiftUIViewHasText:(id)a3;
+ (BOOL)_axAuditSwiftUIViewIsClipping:(id)a3;
+ (BOOL)_axAuditSwizzleAwayContentSize:(BOOL)a3;
+ (BOOL)_axAuditViewIsSwiftUI:(id)a3;
+ (CGRect)_axAuditBoundsForRange:(_NSRange)a3 onSwiftUIView:(id)a4;
+ (id)_accessibilityGetAllSubviews:(id)a3 withFiltering:(BOOL)a4;
+ (id)_accessibilityGetAllSwiftUISubviews:(id)a3 withFiltering:(BOOL)a4;
+ (id)_axAuditContrastDetectionForSwiftUIView:(id)a3;
+ (id)_axAuditCreateElementInfoDictionariesForSubviews:(id)a3;
+ (id)_axAuditDereferenceCellsForViewHierarchy:(id)a3;
+ (id)_axAuditFindAllCollectionViewsInHierarchyForElements:(id)a3;
+ (id)_axAuditFindAllCollectionViewsInHierarchyForView:(id)a3;
+ (id)_axAuditFindAllTablesInHierarchyForElements:(id)a3;
+ (id)_axAuditFindAllTablesInHierarchyForView:(id)a3;
+ (id)_axAuditFindDescendantInaccessibleElements:(id)a3 honorsGroups:(BOOL)a4;
+ (id)_axAuditFindElementsNotSupportingDynamicText:(id)a3;
+ (id)_axAuditFindFrontmostViewControllerForHierarchy:(id)a3;
+ (id)_axAuditGetAllFontSizes;
+ (id)_axAuditGetAllTableAndCollectionViewsForHierarchy:(id)a3;
+ (id)_axAuditGetAttrLabelFromSwiftUIView:(id)a3;
+ (id)_axAuditGetCellReferenceMapTable;
+ (id)_axAuditGetFontAttrFromAttributedString:(id)a3;
+ (id)_axAuditGetFontForElement:(id)a3;
+ (id)_axAuditGetFontForSwiftUIView:(id)a3;
+ (id)_axAuditGetIndexPathsDictionaryForCaptureActionForView:(id)a3;
+ (id)_axAuditGetIndexPathsDictionaryForUpdateActionForView:(id)a3;
+ (id)_axAuditGetOriginalContentOffsetForView:(id)a3;
+ (id)_axAuditGetTextFromObject:(id)a3;
+ (id)_axAuditHelperToFindRelevantSubviewsOfCellView:(id)a3;
+ (id)_axAuditMatchReferenceSubviews:(id)a3 againstNewSubviews:(id)a4;
+ (id)_axAuditUnlabeledIssueDictForElement:(id)a3 honorsGroups:(BOOL)a4;
+ (void)_axAuditCaptureReferenceToCellsForViewHierarchy:(id)a3;
+ (void)_axAuditCheckElementForClipping:(id)a3 storeIntoSet:(id)a4;
+ (void)_axAuditCheckSwiftUIViewForClipping:(id)a3 storeIntoSet:(id)a4;
+ (void)_axAuditForHierarchy:(id)a3 withTableOrCollectionViews:(id)a4 performAction:(id)a5 performBlockOnEachCell:(id)a6;
+ (void)_axAuditRemoveUIViewsFromArray:(id)a3 usingFilter:(id)a4;
+ (void)_axAuditRemoveUnsupportedCategories:(id)a3;
+ (void)_axAuditSpinRunloopForDuration:(double)a3;
+ (void)_axAuditStoreClippedElementsIntoSet:(id)a3 forReferenceMatches:(id)a4;
+ (void)_axAuditStoreFontForElement:(id)a3 intoDictionary:(id)a4 forCurrentFont:(id)a5;
+ (void)_axAuditStoreFontForSwiftUIView:(id)a3 intoDictionary:(id)a4 forCurrentFont:(id)a5;
+ (void)_axAuditStoreFontsIntoDictionary:(id)a3 forReferenceMatches:(id)a4;
+ (void)_axAuditUIKitShouldReportFontSize:(id)a3;
+ (void)_axAuditUpdateClippingStatusForReferenceMatches:(id)a3;
+ (void)_axAuditUpdateFontsForReferenceMatches:(id)a3 forFontSize:(id)a4;
+ (void)_axAuditUpdateReferenceOfCellsForViewHierarchy:(id)a3 forFontSize:(id)a4;
+ (void)_axAuditUpdateRowHeightForTableAndCollectionViewsOfElements:(id)a3;
@end

@implementation UIApplicationAuditIssuesAccessibility

+ (id)_axAuditGetCellReferenceMapTable
{
  return (id)cellReferenceMapTable;
}

+ (id)_accessibilityGetAllSubviews:(id)a3 withFiltering:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "axArrayByIgnoringNilElementsWithCount:", 1, a3);
  v6 = [MEMORY[0x1E4F1CA48] array];
  if ([v5 count])
  {
    unsigned int v7 = 0;
    double v8 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      v10 = [v5 firstObject];
      [v5 removeObjectAtIndex:0];
      if (!v4) {
        goto LABEL_15;
      }
      [v10 bounds];
      if (v8 != v12 || v9 != v11)
      {
        [v10 bounds];
        double v15 = v14;
        double v17 = v16;
        double v19 = v18;
        double v21 = v20;
        v22 = [v10 window];
        objc_msgSend(v10, "convertRect:toView:", v22, v15, v17, v19, v21);
        double v24 = v23;
        double v26 = v25;

        v27 = [MEMORY[0x1E4F42D90] mainScreen];
        [v27 bounds];
        double v29 = v28;
        double v31 = v30;

        if (([v10 isHidden] & 1) == 0)
        {
          char v32 = [v10 accessibilityElementsHidden];
          BOOL v33 = v24 <= v29 && v26 <= v31;
          if (v33 && (v32 & 1) == 0)
          {
LABEL_15:
            if (([v6 containsObject:v10] & 1) == 0)
            {
              v34 = [v10 subviews];
              [v5 addObjectsFromArray:v34];
              [v6 addObject:v10];
            }
          }
        }
      }

      if (![v5 count]) {
        break;
      }
    }
    while (v7++ < 0x270F);
  }

  return v6;
}

+ (id)_accessibilityGetAllSwiftUISubviews:(id)a3 withFiltering:(BOOL)a4
{
  BOOL v4 = a4;
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "axArrayByIgnoringNilElementsWithCount:", 1, a3);
  v6 = [MEMORY[0x1E4F1CA48] array];
  unsigned int v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;

  if ([v5 count])
  {
    unsigned int v12 = 0;
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    do
    {
      double v15 = [v5 firstObject];
      [v5 removeObjectAtIndex:0];
      double v16 = 0;
      if (objc_opt_respondsToSelector())
      {
        double v16 = [v15 automationElements];
      }
      if ([v16 count])
      {
        [v5 addObjectsFromArray:v16];
      }
      else if (!v4 {
             || (objc_opt_respondsToSelector() & 1) == 0
      }
             || (([v15 accessibilityFrame], v13 != v20) || v14 != v19) && v17 <= v9 && v18 <= v11)
      {
        [v6 addObject:v15];
      }

      if (![v5 count]) {
        break;
      }
    }
    while (v12++ < 0x270F);
  }

  return v6;
}

+ (id)_axAuditGetAllFontSizes
{
  v12[12] = *MEMORY[0x1E4F143B8];
  v2 = (void *)ALLFONTSIZES;
  if (!ALLFONTSIZES)
  {
    uint64_t v3 = *MEMORY[0x1E4F437C8];
    v12[0] = *MEMORY[0x1E4F437A8];
    v12[1] = v3;
    uint64_t v4 = *MEMORY[0x1E4F437B0];
    v12[2] = *MEMORY[0x1E4F437B8];
    v12[3] = v4;
    uint64_t v5 = *MEMORY[0x1E4F43798];
    v12[4] = *MEMORY[0x1E4F437A0];
    v12[5] = v5;
    uint64_t v6 = *MEMORY[0x1E4F43780];
    v12[6] = *MEMORY[0x1E4F43790];
    v12[7] = v6;
    uint64_t v7 = *MEMORY[0x1E4F43770];
    v12[8] = *MEMORY[0x1E4F43778];
    v12[9] = v7;
    uint64_t v8 = *MEMORY[0x1E4F43760];
    v12[10] = *MEMORY[0x1E4F43768];
    v12[11] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:12];
    double v10 = (void *)ALLFONTSIZES;
    ALLFONTSIZES = v9;

    v2 = (void *)ALLFONTSIZES;
  }

  return v2;
}

+ (id)_axAuditFindAllTablesInHierarchyForView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  do
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 addObject:v3];
    }
    uint64_t v5 = [v3 superview];

    id v3 = (id)v5;
  }
  while (v5);
  uint64_t v6 = (void *)[v4 copy];

  return v6;
}

+ (id)_axAuditFindAllTablesInHierarchyForElements:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v12 = objc_msgSend(a1, "_axAuditFindAllTablesInHierarchyForView:", v11, (void)v15);
          if ([v12 count]) {
            [v5 unionSet:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  double v13 = (void *)[v5 copy];

  return v13;
}

+ (id)_axAuditFindAllCollectionViewsInHierarchyForView:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  do
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v4 addObject:v3];
    }
    uint64_t v5 = [v3 superview];

    id v3 = (id)v5;
  }
  while (v5);
  id v6 = (void *)[v4 copy];

  return v6;
}

+ (id)_axAuditFindAllCollectionViewsInHierarchyForElements:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unsigned int v12 = objc_msgSend(a1, "_axAuditFindAllCollectionViewsInHierarchyForView:", v11, (void)v15);
          if ([v12 count]) {
            [v5 unionSet:v12];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  double v13 = (void *)[v5 copy];

  return v13;
}

+ (void)_axAuditUpdateRowHeightForTableAndCollectionViewsOfElements:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [a1 _axAuditFindAllTablesInHierarchyForElements:v4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [v10 beginUpdates];
        [v10 endUpdates];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
  uint64_t v11 = [a1 _axAuditFindAllCollectionViewsInHierarchyForElements:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v17 + 1) + 8 * j);
        [v16 reloadData];
        [v16 layoutIfNeeded];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

+ (void)_axAuditRemoveUIViewsFromArray:(id)a3 usingFilter:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = (unsigned int (**)(id, void *))a4;
  uint64_t v7 = [MEMORY[0x1E4F28E60] indexSet];
  long long v24 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [v5 count];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t i = 0; i != v9; ++i)
    {
      uint64_t v11 = [v5 objectAtIndex:i];
      if (v6[2](v6, v11))
      {
        [v7 addIndex:i];
        [v24 addObject:v11];
      }
    }
  }
  objc_msgSend(v5, "removeObjectsAtIndexes:", v7, v7);
  uint64_t v12 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v13 = [v5 count];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t j = 0; j != v14; ++j)
    {
      long long v16 = [v5 objectAtIndex:j];
      long long v17 = [v16 window];

      if (v17)
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v18 = v24;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v26;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v26 != v21) {
                objc_enumerationMutation(v18);
              }
              if ([v16 isDescendantOfView:*(void *)(*((void *)&v25 + 1) + 8 * v22)]) {
                [v12 addIndex:j];
              }
              ++v22;
            }
            while (v20 != v22);
            uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
          }
          while (v20);
        }
      }
      else
      {
        [v12 addIndex:j];
      }
    }
  }
  [v5 removeObjectsAtIndexes:v12];
}

+ (id)_axAuditFindFrontmostViewControllerForHierarchy:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  if ([v4 count])
  {
    id v5 = v3;
    do
    {
      uint64_t v6 = [v4 firstObject];
      [v4 removeObjectAtIndex:0];
      uint64_t v7 = [v6 presentedViewController];

      if (v7)
      {
        uint64_t v8 = [v6 presentedViewController];

        [MEMORY[0x1E4F1CA48] arrayWithObject:v8];
        id v4 = v9 = v4;
        id v5 = (void *)v8;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([v6 topViewController],
              double v10 = objc_claimAutoreleasedReturnValue(),
              v10,
              v10))
        {
          uint64_t v11 = (void *)MEMORY[0x1E4F1CA48];
          uint64_t v9 = [v6 topViewController];
          uint64_t v12 = [v11 arrayWithObject:v9];

          id v4 = (void *)v12;
        }
        else
        {
          uint64_t v9 = [v6 childViewControllers];
          [v4 addObjectsFromArray:v9];
        }
      }
    }
    while ([v4 count]);
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

+ (id)_axAuditGetFontForElement:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 textLabel];
    id v5 = [v4 font];

    if (v5) {
      goto LABEL_26;
    }
    uint64_t v6 = [v3 detailTextLabel];
    uint64_t v7 = [v6 font];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v3 attributedText];
    uint64_t v7 = +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:v6];
LABEL_6:
    id v5 = (void *)v7;

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_10;
  }
  objc_opt_class();
  uint64_t v8 = [v3 safeValueForKey:@"font"];
  id v5 = __UIAccessibilityCastAsClass();

LABEL_9:
  if (v5) {
    goto LABEL_26;
  }
LABEL_10:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v9 = [v3 layoutManager];
    double v10 = v9;
    if (v9)
    {
      uint64_t v11 = [v9 textStorage];
      if (v11)
      {
        id v5 = +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:v11];
      }
      else
      {
        id v5 = 0;
      }
    }
    else
    {
      id v5 = 0;
    }
    goto LABEL_25;
  }
  uint64_t v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  if (![v13 isEqualToString:@"_UITextContainerView"])
  {

LABEL_18:
    double v10 = [v3 _accessibilityAXAttributedValue];
    if ([v10 isAXAttributedString]) {
      uint64_t v15 = [v10 cfAttributedString];
    }
    else {
      uint64_t v15 = 0;
    }
    goto LABEL_22;
  }
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) == 0) {
    goto LABEL_18;
  }
  double v10 = [v3 performSelector:sel_textStorage];
  uint64_t v15 = (uint64_t)v10;
LABEL_22:
  id v5 = +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:v15];
LABEL_25:

LABEL_26:
  id v16 = v5;

  return v16;
}

+ (id)_axAuditGetFontForSwiftUIView:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() _axAuditGetAttrLabelFromSwiftUIView:v3];

  if (v4)
  {
    id v5 = +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_axAuditGetFontAttrFromAttributedString:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v22 = 0;
    long long v23 = &v22;
    uint64_t v24 = 0x3032000000;
    long long v25 = __Block_byref_object_copy__1;
    long long v26 = __Block_byref_object_dispose__1;
    id v27 = 0;
    uint64_t v5 = [v3 length];
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x3032000000;
    uint64_t v19 = __Block_byref_object_copy__1;
    uint64_t v20 = __Block_byref_object_dispose__1;
    id v21 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = (double *)&v12;
    uint64_t v14 = 0x2020000000;
    unint64_t v15 = 0xBFF0000000000000;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__UIApplicationAuditIssuesAccessibility__axAuditGetFontAttrFromAttributedString___block_invoke;
    v11[3] = &unk_1E59B8D58;
    v11[4] = &v22;
    v11[5] = &v16;
    v11[6] = &v12;
    objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v11);
    uint64_t v6 = (void *)v23[5];
    if (!v6)
    {
      if (!v17[5] || v13[3] == -1.0)
      {
        uint64_t v6 = 0;
      }
      else
      {
        uint64_t v7 = objc_msgSend(MEMORY[0x1E4F42A30], "fontWithName:size:");
        uint64_t v8 = (void *)v23[5];
        v23[5] = v7;

        uint64_t v6 = (void *)v23[5];
      }
    }
    id v9 = v6;
    _Block_object_dispose(&v12, 8);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

void __81__UIApplicationAuditIssuesAccessibility__axAuditGetFontAttrFromAttributedString___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v7 = a2;
  uint64_t v8 = *MEMORY[0x1E4F42508];
  id v9 = [v7 objectForKey:*MEMORY[0x1E4F42508]];

  if (v9)
  {
    objc_opt_class();
    double v10 = [v7 objectForKey:v8];
    uint64_t v11 = __UIAccessibilityCastAsClass();

    uint64_t v12 = *(void *)(a1[4] + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    *a5 = 1;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F489D0];
    uint64_t v15 = [v7 objectForKey:*MEMORY[0x1E4F489D0]];
    if (v15)
    {
      uint64_t v16 = (void *)v15;
      long long v17 = (void *)MEMORY[0x1E4F489D8];
      uint64_t v18 = [v7 objectForKey:*MEMORY[0x1E4F489D8]];

      if (v18)
      {
        objc_opt_class();
        uint64_t v19 = [v7 objectForKey:*v14];
        uint64_t v20 = __UIAccessibilityCastAsClass();

        uint64_t v21 = *(void *)(a1[5] + 8);
        uint64_t v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;

        objc_opt_class();
        long long v23 = [v7 objectForKey:*v17];
        uint64_t v24 = __UIAccessibilityCastAsClass();

        [v24 floatValue];
        *(double *)(*(void *)(a1[6] + 8) + 24) = v25;
        *a5 = 1;
      }
    }
  }
}

+ (id)_axAuditFindElementsNotSupportingDynamicText:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v43 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v54;
    v44 = (void *)*MEMORY[0x1E4F437A8];
    uint64_t v40 = *(void *)v54;
    id v41 = a1;
    do
    {
      uint64_t v9 = 0;
      uint64_t v42 = v7;
      do
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v53 + 1) + 8 * v9);
        uint64_t v11 = objc_msgSend(v5, "objectForKey:", v10, v35, v36, v37, v38, v39);
        unint64_t v12 = [v11 count];

        if (v12 >= 2)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = [a1 _axAuditGetTextFromObject:v10];
            if (![v13 length]) {
              goto LABEL_40;
            }
          }
          else if ([(id)objc_opt_class() _axAuditViewIsSwiftUI:v10])
          {
            uint64_t v14 = [(id)objc_opt_class() _axAuditGetAttrLabelFromSwiftUIView:v10];
            uint64_t v13 = [v14 string];

            if (![(id)objc_opt_class() _axAuditSwiftUIViewHasText:v10]) {
              goto LABEL_40;
            }
          }
          else
          {
            uint64_t v13 = 0;
          }
          uint64_t v45 = v9;
          v46 = v13;
          id v15 = v44;
          uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v17 = [a1 _axAuditGetAllFontSizes];
          uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
          v48 = v16;
          if (v18)
          {
            uint64_t v19 = v18;
            char v47 = 0;
            uint64_t v20 = *(void *)v50;
            double v21 = 0.0;
            double v22 = 0.0;
            double v23 = 0.0;
            do
            {
              uint64_t v24 = 0;
              double v25 = v22;
              do
              {
                if (*(void *)v50 != v20) {
                  objc_enumerationMutation(v17);
                }
                long long v26 = *(void **)(*((void *)&v49 + 1) + 8 * v24);
                id v27 = [v5 objectForKey:v10];
                long long v28 = [v27 objectForKey:v26];

                if (v28)
                {
                  double v29 = [v27 objectForKeyedSubscript:v26];
                  [v29 pointSize];
                  double v22 = v30;
                  if (v21 == 0.0)
                  {
                    id v31 = v26;

                    id v15 = v31;
                    double v21 = v22;
                  }
                  else
                  {
                    if (v23 == 0.0) {
                      double v23 = v30;
                    }
                    if (v30 <= v25)
                    {
                      [v48 addObject:v26];
                      char v47 = 1;
                    }
                  }

                  double v25 = v22;
                }
                else
                {
                  double v22 = v25;
                }

                ++v24;
              }
              while (v19 != v24);
              uint64_t v19 = [v17 countByEnumeratingWithState:&v49 objects:v57 count:16];
            }
            while (v19);

            if (v21 < v23)
            {
              uint64_t v8 = v40;
              a1 = v41;
              uint64_t v7 = v42;
              uint64_t v9 = v45;
              uint64_t v16 = v48;
              if ((v47 & 1) == 0)
              {
LABEL_39:

                uint64_t v13 = v46;
LABEL_40:

                goto LABEL_41;
              }
LABEL_36:
              [v43 setObject:v16 forKey:v10];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0
                || ([a1 _axAuditGetTextFromObject:v10],
                    char v32 = objc_claimAutoreleasedReturnValue(),
                    uint64_t v33 = [v32 length],
                    v32,
                    uint64_t v16 = v48,
                    v33))
              {
                [v16 componentsJoinedByString:@", "];
                v39 = v38 = v46;
                v36 = @"AX Audit: Element: %@, with text: %@, does not support these font sizes:%@";
                uint64_t v37 = v10;
                LOBYTE(v35) = 1;
                _AXLogWithFacility();

                uint64_t v16 = v48;
              }
              goto LABEL_39;
            }
            uint64_t v8 = v40;
            a1 = v41;
            uint64_t v7 = v42;
            uint64_t v9 = v45;
            uint64_t v16 = v48;
          }
          else
          {

            uint64_t v9 = v45;
          }
          [v16 insertObject:v15 atIndex:0];
          goto LABEL_36;
        }
LABEL_41:
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v7);
  }

  return v43;
}

+ (void)_axAuditStoreFontForElement:(id)a3 intoDictionary:(id)a4 forCurrentFont:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a1 _axAuditGetFontForElement:v19];
  uint64_t v11 = [a1 _axAuditGetTextFromObject:v19];
  unint64_t v12 = (void *)v11;
  if (v10 && v11)
  {
    uint64_t v13 = [v8 objectForKey:v19];

    if (v13)
    {
      uint64_t v14 = [v8 objectForKey:v19];
      id v15 = v14;
      uint64_t v16 = v10;
      id v17 = v9;
    }
    else
    {
      LOBYTE(v18) = 1;
      _AXLogWithFacility();
      id v15 = [MEMORY[0x1E4F1CA60] dictionary:v18, @"AX Audit: %s: Could not find existing entry for element: %@", "+[UIApplicationAuditIssuesAccessibility _axAuditStoreFontForElement:intoDictionary:forCurrentFont:]", v19];
      [v15 setObject:v10 forKeyedSubscript:v9];
      uint64_t v14 = v8;
      uint64_t v16 = v15;
      id v17 = v19;
    }
    [v14 setObject:v16 forKey:v17];
  }
}

+ (void)_axAuditStoreFontForSwiftUIView:(id)a3 intoDictionary:(id)a4 forCurrentFont:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [a1 _axAuditGetFontForSwiftUIView:v16];
  if (v10)
  {
    uint64_t v11 = [v8 objectForKey:v16];

    if (v11)
    {
      unint64_t v12 = [v8 objectForKey:v16];
      uint64_t v13 = v12;
      uint64_t v14 = v10;
      id v15 = v9;
    }
    else
    {
      uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
      [v13 setObject:v10 forKeyedSubscript:v9];
      unint64_t v12 = v8;
      uint64_t v14 = v13;
      id v15 = v16;
    }
    [v12 setObject:v14 forKey:v15];
  }
}

+ (void)_axAuditRemoveUnsupportedCategories:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  double v23 = [MEMORY[0x1E4F1CA48] array];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v4 = v3;
  uint64_t v26 = [v4 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v26)
  {
    id v24 = v4;
    uint64_t v25 = *(void *)v37;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v37 != v25) {
          objc_enumerationMutation(v4);
        }
        uint64_t v6 = *(void **)(*((void *)&v36 + 1) + 8 * v5);
        if (v6)
        {
          uint64_t v27 = v5;
          uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
          id v8 = [v4 objectForKey:v6];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
          if (v9)
          {
            uint64_t v10 = v9;
            uint64_t v11 = *(void *)v33;
            do
            {
              uint64_t v12 = 0;
              do
              {
                if (*(void *)v33 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * v12);
                id v14 = v6;
                while ([v14 _accessibilitySupportsContentSizeCategory:v13])
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    uint64_t v15 = [v14 superview];

                    id v14 = (id)v15;
                    if (v15) {
                      continue;
                    }
                  }

                  goto LABEL_18;
                }

                [v7 addObject:v13];
LABEL_18:
                ++v12;
              }
              while (v12 != v10);
              uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v41 count:16];
            }
            while (v10);
          }
          [v8 removeObjectsForKeys:v7];
          id v16 = [v8 allKeys];
          uint64_t v17 = [v16 count];

          if (!v17) {
            [v23 addObject:v6];
          }

          id v4 = v24;
          uint64_t v5 = v27;
        }
        ++v5;
      }
      while (v5 != v26);
      uint64_t v26 = [v4 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v26);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v23;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v18);
        }
        [v4 removeObjectForKey:*(void *)(*((void *)&v28 + 1) + 8 * v22++)];
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v20);
  }
}

+ (void)_axAuditSpinRunloopForDuration:(double)a3
{
}

+ (void)_axAuditCheckElementForClipping:(id)a3 storeIntoSet:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([a1 _axAuditElementIsClipping:v7]) {
    [v6 addObject:v7];
  }
}

+ (BOOL)_axAuditElementIsClipping:(id)a3
{
  id v4 = a3;
  if ([a1 _axAuditShouldElementBeCheckedForClipping:v4])
  {
    [v4 frame];
    objc_msgSend(v4, "alignmentRectForFrame:");
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    double v10 = v9;
    double v12 = v11;
    objc_msgSend(v4, "sizeThatFits:", v9, v11);
    double v15 = v13;
    double v16 = v14;
    BOOL v17 = v10 + 5.0 < v13 && v13 != *MEMORY[0x1E4F43ED8];
    BOOL v18 = v12 + 5.0 < v14 && v14 != *MEMORY[0x1E4F43ED8];
    v26.origin.x = v6;
    v26.origin.y = v8;
    v26.size.width = v10;
    v26.size.height = v12;
    BOOL v19 = CGRectEqualToRect(v26, *MEMORY[0x1E4F1DB28]);
    double v20 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    BOOL v21 = v10 == *MEMORY[0x1E4F1DB30];
    if (v12 != v20) {
      BOOL v21 = 0;
    }
    char v22 = v19 || v21;
    BOOL v23 = v15 == *MEMORY[0x1E4F1DB30];
    if (v16 != v20) {
      BOOL v23 = 0;
    }
    BOOL v24 = (v17 || v18) & ~(v22 | v23);
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

+ (void)_axAuditCheckSwiftUIViewForClipping:(id)a3 storeIntoSet:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([a1 _axAuditSwiftUIViewIsClipping:v7]) {
    [v6 addObject:v7];
  }
}

+ (BOOL)_axAuditSwiftUIViewIsClipping:(id)a3
{
  id v4 = a3;
  if ([a1 _axAuditSwiftUIViewHasText:v4])
  {
    double v5 = [(id)objc_opt_class() _axAuditGetAttrLabelFromSwiftUIView:v4];
    id v6 = v5;
    if (v5 && (unint64_t)[v5 length] >= 2)
    {
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", 0, 1, v4);
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", 1, 1, v4);
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", objc_msgSend(v6, "length") - 1, 1, v4);
      double v49 = v25;
      double v50 = v24;
      double v47 = v27;
      double v48 = v26;
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", objc_msgSend(v6, "length") - 2, 1, v4);
      v51.origin.x = v28;
      v51.origin.y = v29;
      v51.size.width = v30;
      v51.size.height = v31;
      if (objc_opt_respondsToSelector())
      {
        [v4 accessibilityFrame];
        CGFloat v45 = v33;
        CGFloat v46 = v32;
        CGFloat v43 = v35;
        CGFloat v44 = v34;
      }
      else
      {
        CGFloat v45 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        CGFloat v46 = *MEMORY[0x1E4F1DB28];
        CGFloat v43 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        CGFloat v44 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      }
      if (AX_CGRectAlmostEqualToRect())
      {
        v52.origin.x = v9;
        v52.origin.y = v11;
        v52.size.width = v13;
        v52.size.height = v15;
        v55.origin.x = v46;
        v55.origin.y = v45;
        v55.size.width = v44;
        v55.size.height = v43;
        CGFloat v37 = v49;
        CGFloat v36 = v50;
        CGFloat v39 = v47;
        CGFloat v38 = v48;
        if (CGRectEqualToRect(v52, v55))
        {
          LOBYTE(v40) = 0;
        }
        else
        {
          v53.origin.y = v19;
          v53.origin.x = v17;
          v53.size.height = v23;
          v53.size.width = v21;
          v56.origin.x = v46;
          v56.origin.y = v45;
          v56.size.width = v44;
          v56.size.height = v43;
          BOOL v40 = !CGRectEqualToRect(v53, v56);
        }
      }
      else
      {
        LOBYTE(v40) = 0;
        CGFloat v37 = v49;
        CGFloat v36 = v50;
        CGFloat v39 = v47;
        CGFloat v38 = v48;
      }
      if (!AX_CGRectAlmostEqualToRect()) {
        goto LABEL_16;
      }
      v54.origin.x = v36;
      v54.origin.y = v37;
      v54.size.width = v38;
      v54.size.height = v39;
      v57.origin.x = v46;
      v57.origin.y = v45;
      v57.size.width = v44;
      v57.size.height = v43;
      if (!CGRectEqualToRect(v54, v57))
      {
        v58.origin.x = v46;
        v58.origin.y = v45;
        v58.size.width = v44;
        v58.size.height = v43;
        BOOL v41 = !CGRectEqualToRect(v51, v58);
      }
      else
      {
LABEL_16:
        LOBYTE(v41) = 0;
      }
      BOOL v7 = v40 || v41;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

+ (BOOL)_axAuditShouldElementBeCheckedForClipping:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = [v4 delegate];
      if (objc_opt_respondsToSelector() & 1) != 0 && ([v5 textFieldShouldBeginEditing:v4])
      {
        BOOL v6 = 0;
LABEL_18:

        goto LABEL_19;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ([v4 isEditable] & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ([v4 isScrollEnabled] & 1) == 0)
      {
        uint64_t v7 = [v4 superview];
        if (!v7
          || (double v8 = (void *)v7,
              [v4 superview],
              CGFloat v9 = objc_claimAutoreleasedReturnValue(),
              char v10 = [v9 conformsToProtocol:&unk_1EF1BE0D8],
              v9,
              v8,
              (v10 & 1) == 0))
        {
          double v5 = [a1 _axAuditGetTextFromObject:v4];
          BOOL v6 = [v5 length] != 0;
          goto LABEL_18;
        }
      }
    }
  }
  BOOL v6 = 0;
LABEL_19:

  return v6;
}

+ (id)_axAuditContrastDetectionForSwiftUIView:(id)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([a1 _axAuditSwiftUIViewHasText:v4])
  {
    double v5 = [a1 _axAuditGetAttrLabelFromSwiftUIView:v4];
    BOOL v6 = v5;
    if (v5)
    {
      uint64_t v21 = 0;
      double v22 = &v21;
      uint64_t v23 = 0x3032000000;
      double v24 = __Block_byref_object_copy__1;
      double v25 = __Block_byref_object_dispose__1;
      id v26 = 0;
      uint64_t v7 = [v5 length];
      uint64_t v8 = *MEMORY[0x1E4F42510];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __81__UIApplicationAuditIssuesAccessibility__axAuditContrastDetectionForSwiftUIView___block_invoke;
      v20[3] = &unk_1E59B8D80;
      v20[4] = &v21;
      objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v8, 0, v7, 0, v20);
      if (v22[5])
      {
        CGFloat v9 = +[UIViewAuditIssuesAccessibility _axAuditHexValueForColor:](UIViewAuditIssuesAccessibility, "_axAuditHexValueForColor:");
      }
      else
      {
        CGFloat v9 = 0;
      }
      CGFloat v11 = +[UIApplicationAuditIssuesAccessibility _axAuditGetFontAttrFromAttributedString:v6];
      double v12 = v11;
      if (v11)
      {
        CGFloat v13 = NSNumber;
        [v11 pointSize];
        double v14 = objc_msgSend(v13, "numberWithDouble:");
      }
      else
      {
        double v14 = 0;
      }
      LOBYTE(v19) = 1;
      _AXLogWithFacility();
      CGFloat v15 = [v6 string:v19, @"AX Audit: SwiftUI view %@ has an unknown contrast issue type.", v4];
      double v16 = [v6 string];
      CGFloat v17 = +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:4001 element:v4 additionalInfo:0 identifier:v15 foregroundColor:v9 backgroundColor:0 fontSize:v14 elementRect:0 text:v16];
      v27[0] = v17;
      char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];

      _Block_object_dispose(&v21, 8);
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

void __81__UIApplicationAuditIssuesAccessibility__axAuditContrastDetectionForSwiftUIView___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    *a5 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

+ (BOOL)_axAuditSwiftUIViewHasText:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() _axAuditViewIsSwiftUI:v3])
  {
    id v4 = [(id)objc_opt_class() _axAuditGetAttrLabelFromSwiftUIView:v3];
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "_axAuditBoundsForRange:onSwiftUIView:", 0, objc_msgSend(v4, "length"), v3);
      BOOL v5 = !CGRectEqualToRect(v7, *MEMORY[0x1E4F1DB28]);
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (CGRect)_axAuditBoundsForRange:(_NSRange)a3 onSwiftUIView:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  double v7 = *MEMORY[0x1E4F1DB28];
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if ([(id)objc_opt_class() _axAuditViewIsSwiftUI:v6]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "_accessibilityBoundsForRange:", location, length);
    double v7 = v11;
    double v8 = v12;
    double v9 = v13;
    double v10 = v14;
  }

  double v15 = v7;
  double v16 = v8;
  double v17 = v9;
  double v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

+ (id)_axAuditGetAttrLabelFromSwiftUIView:(id)a3
{
  id v3 = a3;
  if ([(id)objc_opt_class() _axAuditViewIsSwiftUI:v3]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = [v3 performSelector:sel_accessibilityAttributedLabel];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)_axAuditViewIsSwiftUI:(id)a3
{
  id v3 = a3;
  NSClassFromString(&cfstr_SwiftuiAccessi.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)_axAuditFindDescendantInaccessibleElements:(id)a3 honorsGroups:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v97 = [MEMORY[0x1E4F1CA48] array];
  double v7 = (void *)MEMORY[0x1E4F1CA48];
  v95 = v6;
  double v8 = [v6 subviews];
  double v9 = [v7 arrayWithArray:v8];

  double v10 = [MEMORY[0x1E4F1CA48] array];
  v88 = [MEMORY[0x1E4F1CA48] array];
  v96 = v9;
  if ([v9 count])
  {
    unsigned int v11 = 0;
    int v12 = !v4;
    while (1)
    {
      double v13 = [v96 firstObject];
      [v96 removeObjectAtIndex:0];
      if (([v13 accessibilityElementsHidden] & 1) == 0)
      {
        [v13 bounds];
        if (v15 >= 1.0)
        {
          [v13 bounds];
          BOOL v16 = v17 >= 1.0;
        }
        else
        {
          BOOL v16 = 0;
        }
        [v13 alpha];
        double v19 = v18;
        int v20 = [v13 isAccessibilityElement];
        if (((v20 | v12) & 1) == 0) {
          int v20 = [v13 accessibilityContainerType] == 4;
        }
        uint64_t v21 = [(id)objc_opt_class() _axAuditFindAllTablesInHierarchyForView:v13];
        uint64_t v22 = [v21 count];

        if (!v22)
        {
          char v24 = 0;
LABEL_17:
          if ((v24 & 1) == 0)
          {
            double v25 = [v13 subviews];
            BOOL v26 = [v25 count] == 0;

            int v27 = v26 & ~v20 & v16;
            if (v19 <= 0.0) {
              int v27 = 0;
            }
            if ((v27 | v20) == 1)
            {
              if (v27) {
                CGFloat v28 = v10;
              }
              else {
                CGFloat v28 = v88;
              }
              [v28 addObject:v13];
            }
            if (([v13 isAccessibilityElement] & 1) == 0)
            {
              id v29 = a1;
              long long v112 = 0u;
              long long v113 = 0u;
              long long v110 = 0u;
              long long v111 = 0u;
              CGFloat v30 = [v13 subviews];
              uint64_t v31 = [v30 countByEnumeratingWithState:&v110 objects:v117 count:16];
              if (v31)
              {
                uint64_t v32 = v31;
                uint64_t v33 = *(void *)v111;
                do
                {
                  for (uint64_t i = 0; i != v32; ++i)
                  {
                    if (*(void *)v111 != v33) {
                      objc_enumerationMutation(v30);
                    }
                    uint64_t v35 = *(void *)(*((void *)&v110 + 1) + 8 * i);
                    if (([v96 containsObject:v35] & 1) == 0) {
                      [v96 addObject:v35];
                    }
                  }
                  uint64_t v32 = [v30 countByEnumeratingWithState:&v110 objects:v117 count:16];
                }
                while (v32);
              }

              a1 = v29;
            }
          }
          goto LABEL_4;
        }
        NSClassFromString(&cfstr_Uitablecellacc.isa);
        char isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        char v24 = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) == 0) {
          goto LABEL_17;
        }
      }
LABEL_4:

      if ([v96 count])
      {
        if (v11++ < 0x270F) {
          continue;
        }
      }
      break;
    }
  }
  v87 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v93 = [v10 count];
  if (v93)
  {
    for (uint64_t j = 0; j != v93; ++j)
    {
      long long v108 = 0u;
      long long v109 = 0u;
      long long v106 = 0u;
      long long v107 = 0u;
      id v37 = v88;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v106 objects:v116 count:16];
      if (v38)
      {
        uint64_t v39 = *(void *)v107;
        while (2)
        {
          for (uint64_t k = 0; k != v38; ++k)
          {
            if (*(void *)v107 != v39) {
              objc_enumerationMutation(v37);
            }
            BOOL v41 = *(void **)(*((void *)&v106 + 1) + 8 * k);
            uint64_t v42 = [v10 objectAtIndex:j];
            [v41 bounds];
            objc_msgSend(v41, "convertRect:toView:", v95);
            double v44 = v43;
            double v46 = v45;
            double v48 = v47;
            double v50 = v49;
            [v42 bounds];
            objc_msgSend(v42, "convertRect:toView:", v95);
            double v52 = v51;
            double v54 = v53;
            double v56 = v55;
            double v58 = v57;
            uint64_t v59 = [v41 subviews];
            if ([v59 count])
            {
            }
            else
            {
              v120.origin.x = v44;
              v120.origin.y = v46;
              v120.size.width = v48;
              v120.size.height = v50;
              v121.origin.x = v52;
              v121.origin.y = v54;
              v121.size.width = v56;
              v121.size.height = v58;
              BOOL v60 = CGRectIntersectsRect(v120, v121);

              if (v60)
              {
                LODWORD(v38) = 0;
                char v67 = 1;
                goto LABEL_61;
              }
            }
            double v61 = vabdd_f64(v46, v54);
            double v62 = vabdd_f64(v48, v56);
            double v63 = vabdd_f64(v50, v58);
            if (vabdd_f64(v44, v52) <= 20.0 && v61 <= 20.0 && v62 <= 50.0 && v63 <= 50.0)
            {
              char v67 = 0;
              LODWORD(v38) = 1;
LABEL_61:

              goto LABEL_62;
            }
          }
          uint64_t v38 = [v37 countByEnumeratingWithState:&v106 objects:v116 count:16];
          if (v38) {
            continue;
          }
          break;
        }
      }
      char v67 = 0;
LABEL_62:

      if ((v67 & 1) != 0 || v38) {
        [v87 addIndex:j];
      }
    }
  }
  [v10 removeObjectsAtIndexes:v87];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  obuint64_t j = v10;
  uint64_t v91 = [obj countByEnumeratingWithState:&v102 objects:v115 count:16];
  if (v91)
  {
    uint64_t v90 = *(void *)v103;
    do
    {
      for (uint64_t m = 0; m != v91; ++m)
      {
        if (*(void *)v103 != v90) {
          objc_enumerationMutation(obj);
        }
        v69 = *(void **)(*((void *)&v102 + 1) + 8 * m);
        v70 = +[UIViewAuditIssuesAccessibility _axAuditTextCandidateForView:](UIViewAuditIssuesAccessibility, "_axAuditTextCandidateForView:", v69, v83);
        v71 = (void *)MEMORY[0x1E4F29238];
        [v69 bounds];
        objc_msgSend(v69, "convertRect:toView:", v95);
        v72 = objc_msgSend(v71, "valueWithCGRect:");
        if ([v70 count])
        {
          v92 = v70;
          uint64_t v94 = m;
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          id v73 = v70;
          uint64_t v74 = [v73 countByEnumeratingWithState:&v98 objects:v114 count:16];
          if (v74)
          {
            uint64_t v75 = v74;
            uint64_t v76 = *(void *)v99;
            do
            {
              for (uint64_t n = 0; n != v75; ++n)
              {
                if (*(void *)v99 != v76) {
                  objc_enumerationMutation(v73);
                }
                v78 = *(void **)(*((void *)&v98 + 1) + 8 * n);
                v79 = objc_msgSend(NSString, "stringWithFormat:", @"%li", 1007, v85, v86);
                [v78 setObject:v79 forKey:@"AXAuditIssueTypeKey"];

                [v78 setObject:v72 forKey:@"AXAuditIssueElementRectKey"];
                [v78 setObject:v69 forKey:@"AXAuditIssueElementKey"];
                v80 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v78];
                [v97 addObject:v80];

                v85 = @"AX Audit: Element: %@ is inaccessible and has text.";
                v86 = v69;
                LOBYTE(v84) = 1;
                _AXLogWithFacility();
              }
              uint64_t v75 = [v73 countByEnumeratingWithState:&v98, v114, 16, v84, @"AX Audit: Element: %@ is inaccessible and has text.", v69 objects count];
            }
            while (v75);
          }

          v70 = v92;
          uint64_t m = v94;
        }
        else
        {
          v81 = +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:1006 element:v69 additionalInfo:0 identifier:0 foregroundColor:0 backgroundColor:0 fontSize:0 elementRect:v72 text:0];
          [v97 addObject:v81];

          v85 = @"AX Audit: Element: %@ is inaccessible.";
          v86 = v69;
          LOBYTE(v83) = 1;
          _AXLogWithFacility();
        }
      }
      uint64_t v91 = [obj countByEnumeratingWithState:&v102 objects:v115 count:16];
    }
    while (v91);
  }

  return v97;
}

+ (id)_axAuditUnlabeledIssueDictForElement:(id)a3 honorsGroups:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 accessibilityContainerType];
  double v7 = 0;
  if (v4 && v6 == 4)
  {
    id v8 = [v5 accessibilityLabel];
    if ([v8 length])
    {
      double v7 = 0;
LABEL_5:

      goto LABEL_8;
    }
    double v9 = [v5 accessibilityValue];
    uint64_t v10 = [v9 length];

    if (!v10)
    {
      id v8 = v5;
      int v12 = [v8 window];

      if (v12)
      {
        double v13 = [v8 superview];
        [v8 frame];
        objc_msgSend(v13, "convertPoint:toView:", 0);
        double v15 = v14;
        double v17 = v16;

        [v8 bounds];
        double v19 = v18;
        [v8 bounds];
        int v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v15, v17, v19);
      }
      else
      {
        int v20 = 0;
      }
      double v7 = +[UIAccessibilityAuditUtilities dictionaryWithAXAuditIssue:1000 element:v8 additionalInfo:0 identifier:0 foregroundColor:0 backgroundColor:0 fontSize:0 elementRect:v20 text:0];

      goto LABEL_5;
    }
    double v7 = 0;
  }
LABEL_8:

  return v7;
}

+ (id)_axAuditGetAllTableAndCollectionViewsForHierarchy:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  if ([v5 count])
  {
    unsigned int v6 = 0;
    do
    {
      double v7 = [v5 firstObject];
      [v5 removeObjectAtIndex:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
        [v4 addObject:v7];
      }
      id v8 = [v7 subviews];
      [v5 addObjectsFromArray:v8];

      if (![v5 count]) {
        break;
      }
    }
    while (v6++ < 0x270F);
  }

  return v4;
}

+ (id)_axAuditGetIndexPathsDictionaryForCaptureActionForView:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(id)cellReferenceMapTable objectForKey:v3];
  if (!v4)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA60] dictionary];
    [(id)cellReferenceMapTable setObject:v4 forKey:v3];
  }
  id v5 = [v4 objectForKey:@"Index Paths"];
  if (!v5)
  {
    id v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [v4 setObject:v5 forKey:@"Index Paths"];
  }
  unsigned int v6 = [v4 objectForKey:@"Content Offset"];
  if (!v6)
  {
    if (objc_opt_respondsToSelector())
    {
      objc_opt_class();
      double v7 = [v3 safeValueForKey:@"contentOffset"];
      unsigned int v6 = __UIAccessibilityCastAsClass();

      if (v6) {
        [v4 setObject:v6 forKey:@"Content Offset"];
      }
    }
    else
    {
      unsigned int v6 = 0;
    }
  }

  return v5;
}

+ (id)_axAuditGetIndexPathsDictionaryForUpdateActionForView:(id)a3
{
  id v3 = [(id)cellReferenceMapTable objectForKey:a3];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 objectForKey:@"Index Paths"];
    unsigned int v6 = v5;
    if (v5) {
      id v7 = v5;
    }
  }
  else
  {
    unsigned int v6 = 0;
  }

  return v6;
}

+ (id)_axAuditGetOriginalContentOffsetForView:(id)a3
{
  id v3 = [(id)cellReferenceMapTable objectForKey:a3];
  BOOL v4 = [v3 objectForKey:@"Content Offset"];

  return v4;
}

+ (void)_axAuditForHierarchy:(id)a3 withTableOrCollectionViews:(id)a4 performAction:(id)a5 performBlockOnEachCell:(id)a6
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void (**)(id, uint64_t, void *, void))a6;
  int v50 = [v9 isEqualToString:@"Capture Cell References"];
  int v11 = [v9 isEqualToString:@"Update Cell References Key"];
  double v44 = v9;
  int v48 = [v9 isEqualToString:@"Dereference Cells"];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  obuint64_t j = v8;
  uint64_t v51 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
  if (v51)
  {
    uint64_t v49 = *(void *)v68;
    int v46 = v11 | v48;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v68 != v49) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v67 + 1) + 8 * i);
        if (v50)
        {
          double v14 = [a1 _axAuditGetIndexPathsDictionaryForCaptureActionForView:*(void *)(*((void *)&v67 + 1) + 8 * i)];
        }
        else if (v46)
        {
          double v14 = [a1 _axAuditGetIndexPathsDictionaryForUpdateActionForView:*(void *)(*((void *)&v67 + 1) + 8 * i)];
          if (!v14) {
            continue;
          }
        }
        else
        {
          double v14 = 0;
        }
        uint64_t v53 = i;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        char v16 = objc_opt_isKindOfClass();
        char v17 = v16;
        if (isKindOfClass)
        {
          double v18 = [v13 indexPathsForVisibleRows];
        }
        else if (v16)
        {
          double v18 = [v13 indexPathsForVisibleItems];
        }
        else
        {
          double v18 = 0;
        }
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        id v54 = v18;
        uint64_t v19 = [v54 countByEnumeratingWithState:&v63 objects:v73 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v64;
          do
          {
            for (uint64_t j = 0; j != v20; ++j)
            {
              if (*(void *)v64 != v21) {
                objc_enumerationMutation(v54);
              }
              uint64_t v23 = *(void *)(*((void *)&v63 + 1) + 8 * j);
              if (isKindOfClass)
              {
                uint64_t v24 = [v13 cellForRowAtIndexPath:*(void *)(*((void *)&v63 + 1) + 8 * j)];
              }
              else
              {
                if ((v17 & 1) == 0) {
                  continue;
                }
                uint64_t v24 = [v13 cellForItemAtIndexPath:*(void *)(*((void *)&v63 + 1) + 8 * j)];
              }
              double v25 = (void *)v24;
              if (v24)
              {
                v10[2](v10, v24, v14, v23);
              }
            }
            uint64_t v20 = [v54 countByEnumeratingWithState:&v63 objects:v73 count:16];
          }
          while (v20);
        }

        if (isKindOfClass)
        {
          id v26 = [v13 _accessibilityIndicesOfVisibleHeadersAndFooters];
          long long v59 = 0u;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v59 objects:v72 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v60;
            do
            {
              for (uint64_t k = 0; k != v28; ++k)
              {
                if (*(void *)v60 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void **)(*((void *)&v59 + 1) + 8 * k);
                uint64_t v32 = objc_msgSend(v13, "headerViewForSection:", objc_msgSend(v31, "integerValue"));
                uint64_t v33 = objc_msgSend(v13, "footerViewForSection:", objc_msgSend(v31, "integerValue"));
                if (v32) {
                  ((void (**)(id, uint64_t, void *, void *))v10)[2](v10, (uint64_t)v32, v14, v31);
                }
                if (v33) {
                  ((void (**)(id, uint64_t, void *, void *))v10)[2](v10, (uint64_t)v33, v14, v31);
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v72 count:16];
            }
            while (v28);
          }
LABEL_54:

          goto LABEL_55;
        }
        if (v17)
        {
          id v26 = v13;
          double v34 = [v26 _accessibilityIndexPathToOtherCollectionViewItems];
          if ([v34 count])
          {
            id v45 = v26;
            long long v57 = 0u;
            long long v58 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            id v35 = v34;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v55 objects:v71 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v56;
              do
              {
                for (uint64_t m = 0; m != v37; ++m)
                {
                  if (*(void *)v56 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  uint64_t v40 = *(void *)(*((void *)&v55 + 1) + 8 * m);
                  BOOL v41 = [v35 objectForKeyedSubscript:v40];
                  v10[2](v10, (uint64_t)v41, v14, v40);
                }
                uint64_t v37 = [v35 countByEnumeratingWithState:&v55 objects:v71 count:16];
              }
              while (v37);
            }

            id v26 = v45;
          }

          goto LABEL_54;
        }
LABEL_55:
        uint64_t i = v53;
        if (v48)
        {
          uint64_t v42 = [a1 _axAuditGetOriginalContentOffsetForView:v13];
          double v43 = v42;
          if (v42)
          {
            [v42 CGPointValue];
            objc_msgSend(v13, "setContentOffset:");
          }
        }
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v67 objects:v74 count:16];
    }
    while (v51);
  }
}

+ (void)_axAuditCaptureReferenceToCellsForViewHierarchy:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F28E10];
  id v5 = a3;
  uint64_t v6 = [v4 weakToStrongObjectsMapTable];
  id v7 = (void *)cellReferenceMapTable;
  cellReferenceMapTable = v6;

  id v8 = [a1 _axAuditGetAllTableAndCollectionViewsForHierarchy:v5];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__UIApplicationAuditIssuesAccessibility__axAuditCaptureReferenceToCellsForViewHierarchy___block_invoke;
  aBlock[3] = &__block_descriptor_40_e64_v32__0__UIView_8__NSMutableDictionary_16__NSObject_NSCopying__24l;
  aBlock[4] = a1;
  id v9 = _Block_copy(aBlock);
  [a1 _axAuditForHierarchy:v5 withTableOrCollectionViews:v8 performAction:@"Capture Cell References" performBlockOnEachCell:v9];
}

void __89__UIApplicationAuditIssuesAccessibility__axAuditCaptureReferenceToCellsForViewHierarchy___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) _axAuditHelperToFindRelevantSubviewsOfCellView:a2];
  if ([v8 count])
  {
    id v9 = [*(id *)(a1 + 32) _axAuditCreateElementInfoDictionariesForSubviews:v8];
    [v10 setObject:v9 forKey:v7];
  }
}

+ (void)_axAuditUpdateReferenceOfCellsForViewHierarchy:(id)a3 forFontSize:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _axAuditGetAllTableAndCollectionViewsForHierarchy:v7];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  double v13 = __100__UIApplicationAuditIssuesAccessibility__axAuditUpdateReferenceOfCellsForViewHierarchy_forFontSize___block_invoke;
  double v14 = &unk_1E59B8DC8;
  id v15 = v6;
  id v16 = a1;
  id v9 = v6;
  id v10 = _Block_copy(&v11);
  objc_msgSend(a1, "_axAuditForHierarchy:withTableOrCollectionViews:performAction:performBlockOnEachCell:", v7, v8, @"Update Cell References Key", v10, v11, v12, v13, v14);
}

void __100__UIApplicationAuditIssuesAccessibility__axAuditUpdateReferenceOfCellsForViewHierarchy_forFontSize___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 40);
  id v8 = a4;
  id v9 = a3;
  id v12 = [v7 _axAuditHelperToFindRelevantSubviewsOfCellView:a2];
  id v10 = [v9 objectForKey:v8];

  uint64_t v11 = [*(id *)(a1 + 40) _axAuditMatchReferenceSubviews:v10 againstNewSubviews:v12];
  [*(id *)(a1 + 40) _axAuditUpdateFontsForReferenceMatches:v11 forFontSize:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) _axAuditUpdateClippingStatusForReferenceMatches:v11];
}

+ (id)_axAuditDereferenceCellsForViewHierarchy:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _axAuditGetAllTableAndCollectionViewsForHierarchy:v4];
  id v6 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  id v7 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v6, @"Font Info for Cells", v7, @"Clipping Info for Cells", 0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__UIApplicationAuditIssuesAccessibility__axAuditDereferenceCellsForViewHierarchy___block_invoke;
  aBlock[3] = &unk_1E59B8DF0;
  id v16 = v7;
  id v17 = a1;
  id v15 = v6;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = _Block_copy(aBlock);
  [a1 _axAuditForHierarchy:v4 withTableOrCollectionViews:v5 performAction:@"Dereference Cells" performBlockOnEachCell:v11];

  id v12 = (void *)cellReferenceMapTable;
  cellReferenceMapTable = 0;

  return v8;
}

void __82__UIApplicationAuditIssuesAccessibility__axAuditDereferenceCellsForViewHierarchy___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = *(void **)(a1 + 48);
  id v8 = a4;
  id v9 = a3;
  id v12 = [v7 _axAuditHelperToFindRelevantSubviewsOfCellView:a2];
  id v10 = [v9 objectForKey:v8];

  uint64_t v11 = [*(id *)(a1 + 48) _axAuditMatchReferenceSubviews:v10 againstNewSubviews:v12];
  [*(id *)(a1 + 48) _axAuditStoreFontsIntoDictionary:*(void *)(a1 + 32) forReferenceMatches:v11];
  [*(id *)(a1 + 48) _axAuditStoreClippedElementsIntoSet:*(void *)(a1 + 40) forReferenceMatches:v11];
}

+ (id)_axAuditHelperToFindRelevantSubviewsOfCellView:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F1CA48] arrayWithObject:a3];
  id v22 = [MEMORY[0x1E4F1CA48] array];
  if ([v4 count])
  {
    unsigned int v5 = 0;
    uint64_t v21 = v4;
    do
    {
      id v6 = [v4 firstObject];
      [v4 removeObjectAtIndex:0];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v7 = [a1 _axAuditGetFontForElement:v6];
          uint64_t v8 = [a1 _axAuditGetTextFromObject:v6];
          id v9 = (void *)v8;
          if (v7 && v8)
          {
            uint64_t v23 = (void *)v8;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v24 = 0u;
            long long v25 = 0u;
            id v10 = v22;
            uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v25;
              while (2)
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v25 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v15 = *(void *)(*((void *)&v24 + 1) + 8 * i);
                  id v16 = [a1 _axAuditGetFontForElement:v15];
                  id v17 = [a1 _axAuditGetTextFromObject:v15];
                  if ([v7 isEqual:v16]
                    && [v23 isEqualToString:v17])
                  {

                    goto LABEL_18;
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v28 count:16];
                if (v12) {
                  continue;
                }
                break;
              }
            }

            [v10 addObject:v6];
LABEL_18:
            id v4 = v21;
            id v9 = v23;
          }
          double v18 = [v6 subviews];
          [v4 addObjectsFromArray:v18];
        }
      }

      if (![v4 count]) {
        break;
      }
    }
    while (v5++ < 0x270F);
  }

  return v22;
}

+ (id)_axAuditCreateElementInfoDictionariesForSubviews:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unsigned int v5 = [MEMORY[0x1E4F1CA48] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = (objc_class *)objc_opt_class();
        uint64_t v12 = NSStringFromClass(v11);
        uint64_t v13 = [a1 _axAuditGetTextFromObject:v10];
        double v14 = [MEMORY[0x1E4F1CA60] dictionary];
        v23[0] = @"Class Name";
        v23[1] = @"Text";
        v24[0] = v12;
        v24[1] = v13;
        v23[2] = @"Font Dictionary";
        v23[3] = @"Clipping Status";
        v24[2] = v14;
        v24[3] = MEMORY[0x1E4F1CC28];
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:4];
        id v16 = (void *)[v15 mutableCopy];
        [v5 addObject:v16];
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)_axAuditMatchReferenceSubviews:(id)a3 againstNewSubviews:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v5 = a4;
  id v26 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  obuint64_t j = v5;
  uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v24)
  {
    uint64_t v21 = *(void *)v33;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v6;
        uint64_t v7 = *(void *)(*((void *)&v32 + 1) + 8 * v6);
        uint64_t v8 = (objc_class *)objc_opt_class();
        id v9 = NSStringFromClass(v8);
        uint64_t v27 = v7;
        uint64_t v10 = [a1 _axAuditGetTextFromObject:v7];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        id v11 = v23;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v29;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
              id v17 = [v16 objectForKey:@"Class Name"];
              double v18 = [v16 objectForKey:@"Text"];
              if ([v9 isEqualToString:v17]
                && [v10 isEqualToString:v18])
              {
                [v26 setObject:v16 forKey:v27];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v36 count:16];
          }
          while (v13);
        }

        uint64_t v6 = v25 + 1;
      }
      while (v25 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v24);
  }

  return v26;
}

+ (void)_axAuditUpdateFontsForReferenceMatches:(id)a3 forFontSize:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = [v6 objectForKey:v12];
        uint64_t v14 = [a1 _axAuditGetFontForElement:v12];
        if (v14)
        {
          uint64_t v15 = [v13 objectForKey:@"Font Dictionary"];
          [v15 setObject:v14 forKey:v7];
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

+ (void)_axAuditUpdateClippingStatusForReferenceMatches:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v3, "objectForKey:", v8, (void)v12);
        uint64_t v10 = [v9 objectForKey:@"Clipping Status"];
        char v11 = [v10 BOOLValue];

        if (v11)
        {

          goto LABEL_13;
        }
        if (+[UIApplicationAuditIssuesAccessibility _axAuditElementIsClipping:v8])
        {
          [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"Clipping Status"];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

+ (id)_axAuditGetTextFromObject:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    uint64_t v4 = [v3 safeValueForKey:@"text"];
    uint64_t v5 = __UIAccessibilityCastAsClass();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ![v5 length])
    {
      uint64_t v14 = [v3 placeholder];

      uint64_t v5 = (void *)v14;
      if (v14) {
        goto LABEL_17;
      }
    }
    else if (v5)
    {
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v3 layoutManager];
    id v7 = v6;
    if (v6)
    {
      uint64_t v8 = [v6 textStorage];
      uint64_t v9 = v8;
      if (v8)
      {
        id v10 = v8;

        id v3 = v10;
      }
    }
  }
  else
  {
    char v11 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v11);
    if ([v7 isEqualToString:@"_UITextContainerView"])
    {
      char v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) == 0) {
        goto LABEL_14;
      }
      [v3 performSelector:sel_textStorage];
      id v7 = v3;
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

LABEL_14:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 string];
  }
  else
  {
    uint64_t v5 = 0;
  }
LABEL_17:

  return v5;
}

+ (void)_axAuditStoreFontsIntoDictionary:(id)a3 forReferenceMatches:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v12 = [v6 objectForKey:v11];
        long long v13 = [v12 objectForKey:@"Font Dictionary"];
        if (v13) {
          [v5 setObject:v13 forKey:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

+ (void)_axAuditStoreClippedElementsIntoSet:(id)a3 forReferenceMatches:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        char v12 = [v6 objectForKey:v11];
        long long v13 = [v12 objectForKey:@"Clipping Status"];
        int v14 = [v13 BOOLValue];

        if (v14) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

+ (void)_axAuditUIKitShouldReportFontSize:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 copy];
  id v5 = (void *)_axFontSizeToReturn;
  _axFontSizeToReturuint64_t n = v4;

  if (dyld_program_sdk_at_least()) {
    [MEMORY[0x1E4F42D90] mainScreen];
  }
  else {
  id v6 = [MEMORY[0x1E4F42738] sharedApplication];
  }
  AXPerformSafeBlock();
  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4F43788];
  v12[0] = *MEMORY[0x1E4F437C0];
  uint64_t v9 = (void *)[v3 copy];

  v12[1] = @"UIContentSizeCategoryTextLegibilityEnabledKey";
  v13[0] = v9;
  id v10 = [NSNumber numberWithBool:UIAccessibilityIsBoldTextEnabled()];
  v13[1] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];
  [v7 postNotificationName:v8 object:v6 userInfo:v11];
}

uint64_t __75__UIApplicationAuditIssuesAccessibility__axAuditUIKitShouldReportFontSize___block_invoke()
{
  return [MEMORY[0x1E4F42D90] _enumerateScreensWithBlock:&__block_literal_global_656];
}

uint64_t __75__UIApplicationAuditIssuesAccessibility__axAuditUIKitShouldReportFontSize___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _updateTraits];
}

+ (BOOL)_axAuditSwizzleAwayContentSize:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v5, sel_preferredContentSizeCategory);
  uint64_t v7 = (objc_class *)objc_opt_class();
  Method v8 = class_getInstanceMethod(v7, sel_preferredContentSizeCategory);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  long long v13 = __72__UIApplicationAuditIssuesAccessibility__axAuditSwizzleAwayContentSize___block_invoke;
  int v14 = &__block_descriptor_48_e5_v8__0l;
  Method v15 = InstanceMethod;
  Method v16 = v8;
  if (_axAuditSwizzleAwayContentSize__onceToken != -1) {
    dispatch_once(&_axAuditSwizzleAwayContentSize__onceToken, &v11);
  }
  char v9 = objc_msgSend(a1, "_axAuditSetSwizzledImp:orOrigImp:forMethod:withSwizzling:", axAuditSwizzlePreferredContentSizeCategory1, _axAuditOrigPreferredContentSizeCategory1, InstanceMethod, v3, v11, v12, v13, v14, v15, v16);
  return v9 & [a1 _axAuditSetSwizzledImp:axAuditSwizzlePreferredContentSizeCategory2 orOrigImp:_axAuditOrigPreferredContentSizeCategory2 forMethod:v8 withSwizzling:v3];
}

objc_method *__72__UIApplicationAuditIssuesAccessibility__axAuditSwizzleAwayContentSize___block_invoke(uint64_t a1)
{
  v2 = *(objc_method **)(a1 + 32);
  if (v2) {
    _axAuditOrigPreferredContentSizeCategory1 = (uint64_t)method_getImplementation(v2);
  }
  CGRect result = *(objc_method **)(a1 + 40);
  if (result)
  {
    CGRect result = (objc_method *)method_getImplementation(result);
    _axAuditOrigPreferredContentSizeCategory2 = (uint64_t)result;
  }
  return result;
}

+ (BOOL)_axAuditSetSwizzledImp:(void *)a3 orOrigImp:(void *)a4 forMethod:(objc_method *)a5 withSwizzling:(BOOL)a6
{
  if (a5)
  {
    if (!a6) {
      a3 = a4;
    }
    method_setImplementation(a5, (IMP)a3);
  }
  return a5 != 0;
}

@end