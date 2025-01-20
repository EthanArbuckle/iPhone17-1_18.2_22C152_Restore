@interface NSObject(UIAccessibilityElementTraversal)
- (BOOL)_accessibilityAppendOrderedChildLeafDescendantsToArray:()UIAccessibilityElementTraversal count:shouldStopAtRemoteElement:options:treeLogger:;
- (BOOL)_accessibilityHasVisibleFrame;
- (id)_accessibilityElementsInDirectionWithCount:()UIAccessibilityElementTraversal options:;
- (id)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:treeLogger:;
- (id)_accessibilityParentFromOrderedChildrenContainer:()UIAccessibilityElementTraversal;
- (id)_accessibilityTraverseTreeWithLogger:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:;
- (id)_accessibilityTreeAsString;
- (id)_accessibilityTreeAsStringWithOptions:()UIAccessibilityElementTraversal;
- (id)_accessibilityViewChildrenForEnumeratingSiblingsWithOptions:()UIAccessibilityElementTraversal;
- (uint64_t)_accessibilityCompareGeometryForViewOrDictionary:()UIAccessibilityElementTraversal;
- (uint64_t)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:;
- (uint64_t)_accessibilityIsLeafNodeWithOptions:()UIAccessibilityElementTraversal;
- (uint64_t)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal options:;
- (uint64_t)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:;
- (uint64_t)_accessibilityLeafDescendantsWithOptions:()UIAccessibilityElementTraversal;
- (uint64_t)_accessibilityShouldBeAddedToViewChildrenWithOptions:()UIAccessibilityElementTraversal;
- (uint64_t)_accessibilityShouldBeProcessed:()UIAccessibilityElementTraversal;
- (uint64_t)_accessibilityShouldUseSupplementaryViews;
- (uint64_t)_accessibilityTraverseTreeWithLogger:()UIAccessibilityElementTraversal options:;
- (uint64_t)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal;
- (void)_accessibilityEnumerateSiblingsFromOrderedChildrenContainer:()UIAccessibilityElementTraversal fromChildAtIndex:headerIndex:footerIndex:options:usingBlock:;
- (void)_addAccessibilityElementsAndOrderedContainersWithOptions:()UIAccessibilityElementTraversal toCollection:;
- (void)_handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:()UIAccessibilityElementTraversal childOfElementOrOrderedChildrenContainer:headerIndex:footerIndex:allowedElementsForTraversal:;
@end

@implementation NSObject(UIAccessibilityElementTraversal)

- (id)_accessibilityElementsInDirectionWithCount:()UIAccessibilityElementTraversal options:
{
  id v7 = a4;
  if (!v7)
  {
    _AXAssert();
    if (a3) {
      goto LABEL_3;
    }
LABEL_34:
    _AXAssert();
    goto LABEL_3;
  }
  if (!a3) {
    goto LABEL_34;
  }
LABEL_3:
  v8 = AXLogElementTraversal();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(UIAccessibilityElementTraversal) _accessibilityElementsInDirectionWithCount:options:]((uint64_t)v7, a3, v8);
  }

  if ([v7 shouldReturnScannerGroups]) {
    _AXAssert();
  }
  v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a3];
  id v10 = a1;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x2020000000;
  uint64_t v36 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  while (v10)
  {
    unint64_t v27 = a3;
    id v28 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __96__NSObject_UIAccessibilityElementTraversal___accessibilityElementsInDirectionWithCount_options___block_invoke;
    v22[3] = &unk_1E59B8B60;
    v25 = &v33;
    id v11 = v7;
    id v23 = v11;
    id v12 = v9;
    id v24 = v12;
    v26 = &v29;
    char v13 = [v10 _accessibilityEnumerateSiblingsWithParent:&v28 options:v11 usingBlock:v22];
    id v14 = v28;
    if ((v13 & 1) != 0 && !*((unsigned char *)v30 + 24))
    {
      if ([v10 _accessibilityIsRemoteElement]
        && ([v10 onClientSide] & 1) == 0)
      {
        if (v14) {
          _AXAssert();
        }
        if (v34[3] >= a3) {
          _AXAssert();
        }
        [v12 addObject:v10];
      }
      v16 = [v11 allowedElementsForTraversal];
      if (v16)
      {
        v4 = [v11 allowedElementsForTraversal];
        if ([v4 containsObject:v14])
        {

          goto LABEL_26;
        }
      }
      char v17 = [v14 _accessibilityIsRootElementForElementTraversal];
      char v18 = v17;
      if (v16)
      {

        if (v18) {
          goto LABEL_26;
        }
LABEL_28:
        id v19 = v14;
      }
      else
      {
        if ((v17 & 1) == 0) {
          goto LABEL_28;
        }
LABEL_26:
        id v19 = 0;
      }

      char v15 = 1;
      id v10 = v19;
      goto LABEL_12;
    }
    char v15 = 0;
LABEL_12:

    if ((v15 & 1) == 0) {
      break;
    }
  }
  id v20 = v9;
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

- (id)_accessibilityTreeAsString
{
  v2 = +[UIAccessibilityElementTraversalOptions voiceOverOptionsIncludingElementsFromOpaqueProviders:1 honorsGroups:0];
  v3 = [a1 _accessibilityTreeAsStringWithOptions:v2];

  return v3;
}

- (id)_accessibilityTreeAsStringWithOptions:()UIAccessibilityElementTraversal
{
  id v4 = a3;
  v5 = objc_alloc_init(UIAccessibilityInMemoryStringBasedTreeLogger);
  [a1 _accessibilityTraverseTreeWithLogger:v5 options:v4];

  v6 = [(UIAccessibilityInMemoryStringBasedTreeLogger *)v5 stringRepresentation];

  return v6;
}

- (uint64_t)_accessibilityTraverseTreeWithLogger:()UIAccessibilityElementTraversal options:
{
  return [a1 _accessibilityTraverseTreeWithLogger:a3 shouldStopAtRemoteElement:0 options:a4];
}

- (id)_accessibilityTraverseTreeWithLogger:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:
{
  return (id)[a1 _accessibilityLeafDescendantsWithCount:0 shouldStopAtRemoteElement:a4 options:a5 treeLogger:a3];
}

- (uint64_t)_accessibilityLeafDescendantsWithOptions:()UIAccessibilityElementTraversal
{
  return [a1 _accessibilityLeafDescendantsWithCount:0 options:a3];
}

- (uint64_t)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal options:
{
  return [a1 _accessibilityLeafDescendantsWithCount:a3 shouldStopAtRemoteElement:0 options:a4];
}

- (uint64_t)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:
{
  return [a1 _accessibilityLeafDescendantsWithCount:a3 shouldStopAtRemoteElement:a4 options:a5 treeLogger:0];
}

- (uint64_t)_accessibilityShouldBeAddedToViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  id v4 = a3;
  if (([a1 _accessibilityShouldBeProcessed:v4] & 1) == 0)
  {
    id v11 = a1;
    _AXAssert();
  }
  uint64_t v5 = objc_msgSend(v4, "leafNodePredicate", v11);
  if (v5
    && (v6 = (void *)v5,
        [v4 leafNodePredicate],
        id v7 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue(),
        char v8 = ((uint64_t (**)(void, void *))v7)[2](v7, a1),
        v7,
        v6,
        (v8 & 1) != 0)
    || ([a1 _accessibilityHasOrderedChildren] & 1) != 0)
  {
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = [a1 isAccessibilityElement];
  }

  return v9;
}

- (id)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:treeLogger:
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (!v10) {
    _AXAssert();
  }
  BOOL v12 = [v10 direction] == 2;
  if ([v10 forSpeakScreen]
    && [a1 _accessibilitySpeakThisShouldOnlyIncludeVisibleElements]
    && ([v10 shouldOnlyIncludeElementsWithVisibleFrame] & 1) == 0)
  {
    int v13 = 1;
    [v10 setShouldOnlyIncludeElementsWithVisibleFrame:1];
  }
  else
  {
    int v13 = 0;
  }
  id v14 = [MEMORY[0x1E4F1CA48] array];
  if (![v10 shouldOnlyIncludeElementsWithVisibleFrame]
    || [a1 _accessibilityHasVisibleFrame])
  {
    int v38 = a4;
    v39 = v14;
    id v15 = v14;
    int v16 = [a1 _accessibilityIsLeafNodeWithOptions:v10];
    if (v16)
    {
      int v17 = 0;
      id v18 = v15;
    }
    else
    {
      if ([v10 shouldReturnScannerGroups]
        && [a1 _accessibilityIsScannerGroup])
      {
        id v18 = [MEMORY[0x1E4F1CA48] array];

        int v17 = 1;
      }
      else
      {
        int v17 = 0;
        id v18 = v15;
      }
      if ([v10 shouldReturnScannerGroups])
      {
        if (a3) {
          _AXAssert();
        }
        int v37 = v13;
        if ([v10 direction] != 1) {
          _AXAssert();
        }
        id v19 = v11;
        if (v38) {
          _AXAssert();
        }
        uint64_t v20 = [a1 _accessibilityScannerGroupElements];
        if (v20)
        {
          v21 = (void *)v20;
          [v18 addObjectsFromArray:v20];

          id v11 = v19;
          int v13 = v37;
          if (v17) {
            goto LABEL_37;
          }
          goto LABEL_44;
        }
        int v13 = v37;
      }
    }
    if (!a3 || [v15 count] < a3)
    {
      [v11 logElement:a1];
      if (v16)
      {
        [v15 addObject:a1];
        if ((v17 & 1) == 0) {
          goto LABEL_44;
        }
LABEL_37:
        int v23 = v13;
        id v24 = (void *)MEMORY[0x1E4F1CA60];
        v53 = @"GroupElements";
        v54[0] = v18;
        v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
        v26 = [v24 dictionaryWithDictionary:v25];

        uint64_t v27 = [a1 _accessibilityScannerGroupTraits];
        if (v27)
        {
          id v28 = [NSNumber numberWithUnsignedLong:v27];
          [v26 setObject:v28 forKeyedSubscript:@"GroupTraits"];
        }
        uint64_t v29 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(a1, "_accessibilityScanningBehaviorTraits") | 0x10);
        [v26 setObject:v29 forKeyedSubscript:@"GroupScanBehaviorTraits"];

        v30 = [a1 _accessibilityAXAttributedLabel];
        if ([v30 length]) {
          [v26 setObject:v30 forKeyedSubscript:@"GroupLabel"];
        }
        uint64_t v31 = [a1 _accessibilityGroupIdentifier];
        if (v31) {
          [v26 setObject:v31 forKeyedSubscript:@"GroupIdentifier"];
        }
        [v15 addObject:v26];

        int v13 = v23;
        goto LABEL_44;
      }
      uint64_t v22 = 2 * v12;
      if ([a1 _accessibilityHasOrderedChildren])
      {
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = __129__NSObject_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke;
        v47[3] = &unk_1E59B8B88;
        id v18 = v18;
        id v48 = v18;
        unint64_t v51 = a3;
        char v52 = v38;
        id v49 = v10;
        id v50 = v11;
        [a1 accessibilityEnumerateContainerElementsWithOptions:2 * v12 usingBlock:v47];

        if ((v17 & 1) == 0) {
          goto LABEL_44;
        }
        goto LABEL_37;
      }
      if (([a1 isAccessibilityElement] & 1) == 0)
      {
        uint64_t v33 = [a1 _accessibilityViewChildrenWithOptions:v10];
        [v11 push];
        v40[0] = MEMORY[0x1E4F143A8];
        v40[1] = 3221225472;
        v40[2] = __129__NSObject_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke_2;
        v40[3] = &unk_1E59B8BB0;
        BOOL v45 = a3 != 0;
        id v41 = v15;
        unint64_t v44 = a3;
        char v46 = v38;
        id v42 = v10;
        int v34 = v13;
        id v35 = v11;
        id v43 = v35;
        [v33 enumerateObjectsWithOptions:v22 usingBlock:v40];
        uint64_t v36 = v35;
        int v13 = v34;
        [v36 pop];

        if ((v17 & 1) == 0) {
          goto LABEL_44;
        }
        goto LABEL_37;
      }
    }
    if (v17) {
      goto LABEL_37;
    }
LABEL_44:

    id v14 = v39;
  }
  if (v13) {
    [v10 setShouldOnlyIncludeElementsWithVisibleFrame:0];
  }

  return v14;
}

- (uint64_t)_accessibilityIsLeafNodeWithOptions:()UIAccessibilityElementTraversal
{
  id v5 = a3;
  v6 = [v5 leafNodePredicate];
  if (v6)
  {
    v3 = [v5 leafNodePredicate];
    if (((unsigned int (**)(void, void *))v3)[2](v3, a1))
    {

LABEL_10:
      uint64_t v10 = 1;
      goto LABEL_11;
    }
  }
  id v7 = [v5 leafNodePredicate];
  if (v7 || ![a1 isAccessibilityElement])
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v8 = [a1 accessibilityTraits];
    BOOL v9 = (UIAccessibilityTraitSpacer & ~v8) != 0;
  }

  if (v6)
  {

    if (v9) {
      goto LABEL_10;
    }
  }
  else if (v9)
  {
    goto LABEL_10;
  }
  if ([a1 _accessibilityIsRemoteElement]) {
    uint64_t v10 = [a1 onClientSide];
  }
  else {
    uint64_t v10 = 0;
  }
LABEL_11:

  return v10;
}

- (BOOL)_accessibilityAppendOrderedChildLeafDescendantsToArray:()UIAccessibilityElementTraversal count:shouldStopAtRemoteElement:options:treeLogger:
{
  id v11 = a3;
  id v12 = a6;
  id v30 = a7;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  uint64_t v13 = [v12 direction];
  if (!a4)
  {
    if (!a5) {
      goto LABEL_11;
    }
LABEL_7:
    id v15 = [v11 lastObject];
    int v16 = [v15 _accessibilityIsRemoteElement];

    if (!v16) {
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  unint64_t v14 = [v11 count];
  if (v14 < a4 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 < a4)
  {
LABEL_11:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __151__NSObject_UIAccessibilityElementTraversal___accessibilityAppendOrderedChildLeafDescendantsToArray_count_shouldStopAtRemoteElement_options_treeLogger___block_invoke;
    aBlock[3] = &unk_1E59B8C00;
    uint64_t v36 = 2 * (v13 != 1);
    id v18 = v30;
    id v32 = v18;
    id v35 = &v39;
    id v19 = v11;
    id v33 = v19;
    unint64_t v37 = a4;
    char v38 = a5;
    id v20 = v12;
    id v34 = v20;
    v21 = (void (**)(void *, void *))_Block_copy(aBlock);
    if ([a1 _accessibilityShouldUseSupplementaryViews]
      && ([v20 shouldExcludeSupplementaryViews] & 1) == 0)
    {
      if (v13 == 1) {
        [a1 _accessibilitySupplementaryHeaderViews];
      }
      else {
      int v23 = [a1 _accessibilitySupplementaryFooterViews];
      }
      v21[2](v21, v23);

      int v22 = 0;
    }
    else
    {
      int v22 = 1;
    }
    if (!*((unsigned char *)v40 + 24))
    {
      [v18 push];
      uint64_t v24 = a4 ? a4 - [v19 count] : 0;
      v25 = [a1 _accessibilityLeafDescendantsWithCount:v24 shouldStopAtRemoteElement:a5 options:v20 treeLogger:v18];
      [v19 addObjectsFromArray:v25];

      [v18 pop];
      BOOL v26 = a4 && [v19 count] >= a4;
      *((unsigned char *)v40 + 24) = v26;
      if (((v22 | v26) & 1) == 0)
      {
        if (v13 == 1) {
          [a1 _accessibilitySupplementaryFooterViews];
        }
        else {
        uint64_t v27 = [a1 _accessibilitySupplementaryHeaderViews];
        }
        v21[2](v21, v27);
      }
    }

    BOOL v17 = *((unsigned char *)v40 + 24) != 0;
    goto LABEL_31;
  }
LABEL_8:
  if ([v11 count] > a4) {
    _AXAssert();
  }
  BOOL v17 = 1;
  *((unsigned char *)v40 + 24) = 1;
LABEL_31:
  _Block_object_dispose(&v39, 8);

  return v17;
}

- (void)_accessibilityEnumerateSiblingsFromOrderedChildrenContainer:()UIAccessibilityElementTraversal fromChildAtIndex:headerIndex:footerIndex:options:usingBlock:
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = [v15 direction];
  uint64_t v18 = [v14 accessibilityElementCount];
  if ((a4 & 0x8000000000000000) == 0 && v18 > a4)
  {
    uint64_t v34 = v18;
    uint64_t v43 = 0;
    unint64_t v44 = &v43;
    uint64_t v45 = 0x2020000000;
    char v46 = 0;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __165__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsFromOrderedChildrenContainer_fromChildAtIndex_headerIndex_footerIndex_options_usingBlock___block_invoke;
    aBlock[3] = &unk_1E59B8C28;
    char v42 = &v43;
    id v33 = v16;
    id v19 = v16;
    id v41 = v19;
    id v35 = (void (**)(void *, void *))_Block_copy(aBlock);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __165__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsFromOrderedChildrenContainer_fromChildAtIndex_headerIndex_footerIndex_options_usingBlock___block_invoke_2;
    v36[3] = &unk_1E59B8C50;
    char v38 = &v43;
    BOOL v39 = v17 == 1;
    id v37 = v19;
    id v20 = (void (**)(void *, void *, uint64_t))_Block_copy(v36);
    if (v17 == 1)
    {
      if (a5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v21 = [a1 _accessibilitySupplementaryHeaderViews];
        v20[2](v20, v21, a5 + 1);

        v35[2](v35, a1);
      }
      int v22 = [a1 _accessibilitySupplementaryFooterViews];
      if (a6 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = a6 + 1;
      }
    }
    else
    {
      if (a6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v24 = [a1 _accessibilitySupplementaryFooterViews];
        v20[2](v20, v24, a6 - 1);

        v35[2](v35, a1);
      }
      int v22 = [a1 _accessibilitySupplementaryHeaderViews];
      if (a5 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = a5 - 1;
      }
    }
    v20[2](v20, v22, v23);

    if (*((unsigned char *)v44 + 24))
    {
LABEL_16:

      _Block_object_dispose(&v43, 8);
      id v16 = v33;
      goto LABEL_17;
    }
    if (v17 == 1) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = -1;
    }
    for (uint64_t i = v25 + a4; ; i += v25)
    {
      if (v17 == 1)
      {
        if (i >= v34) {
          goto LABEL_16;
        }
      }
      else if (i < 0)
      {
        goto LABEL_16;
      }
      if (*((unsigned char *)v44 + 24)) {
        goto LABEL_16;
      }
      uint64_t v27 = [v14 accessibilityElementAtIndex:i];
      if ([v27 _accessibilityShouldBeProcessed:v15]) {
        break;
      }
      if (v27)
      {
        uint64_t v29 = AXLogElementTraversal();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v48 = v14;
          __int16 v49 = 2112;
          uint64_t v50 = (uint64_t)v27;
          _os_log_impl(&dword_19F2DB000, v29, OS_LOG_TYPE_INFO, "Ordered container %@ gave us an element %@ that was invalid for the current element traversal options, so we are skipping over it. It was probably invisible.", buf, 0x16u);
        }
      }
      else
      {
        uint64_t v29 = AXLogElementTraversal();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          id v48 = v14;
          __int16 v49 = 2048;
          uint64_t v50 = i;
          __int16 v51 = 2048;
          uint64_t v52 = v34;
          _os_log_error_impl(&dword_19F2DB000, v29, OS_LOG_TYPE_ERROR, "Ordered container %@ failed to provide an element at index %ld, but had count %ld.  This is probably an app accessibility bug.", buf, 0x20u);
        }
      }
LABEL_45:
    }
    int v28 = [v27 _accessibilityIsLeafNodeWithOptions:v15];
    if (v17 == 1)
    {
      uint64_t v29 = [v27 _accessibilitySupplementaryHeaderViews];
      id v30 = [v27 _accessibilitySupplementaryFooterViews];
      if (v28)
      {
        uint64_t v31 = 0;
LABEL_36:
        v20[2](v20, v29, v31);
      }
    }
    else
    {
      uint64_t v29 = [v27 _accessibilitySupplementaryFooterViews];
      id v30 = [v27 _accessibilitySupplementaryHeaderViews];
      if (v28)
      {
        uint64_t v31 = [v29 count] - 1;
        goto LABEL_36;
      }
    }
    v35[2](v35, v27);
    if (v28)
    {
      if (v17 == 1) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = [v30 count] - 1;
      }
      v20[2](v20, v30, v32);
    }

    goto LABEL_45;
  }
  _AXAssert();
LABEL_17:
}

- (id)_accessibilityParentFromOrderedChildrenContainer:()UIAccessibilityElementTraversal
{
  id v4 = a3;
  id v5 = a1;
  v6 = [v4 _accessibilitySupplementaryHeaderViews];
  id v7 = [v4 _accessibilitySupplementaryFooterViews];
  id v8 = v5;
  while (v8 != v4)
  {
    BOOL v9 = [v8 accessibilityContainer];

    if (!v9) {
      goto LABEL_9;
    }
    if ([v4 indexOfAccessibilityElement:v9] == 0x7FFFFFFFFFFFFFFFLL
      && ([v6 containsObject:v9] & 1) == 0)
    {
      id v8 = v9;
      if (![v7 containsObject:v9]) {
        continue;
      }
    }
    id v10 = v9;
    BOOL v9 = v10;
    goto LABEL_10;
  }
  BOOL v9 = v4;
LABEL_9:
  _AXLogWithFacility();
  id v10 = 0;
LABEL_10:
  id v11 = v10;

  return v11;
}

- (void)_handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:()UIAccessibilityElementTraversal childOfElementOrOrderedChildrenContainer:headerIndex:footerIndex:allowedElementsForTraversal:
{
  id v12 = a7;
  uint64_t v13 = [*a3 _accessibilitySupplementaryHeaderViews];
  id v14 = [*a3 _accessibilitySupplementaryFooterViews];
  if (v13)
  {
    uint64_t v15 = [v13 indexOfObject:a1];
    *a5 = v15;
    if (!v14) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v15 = *a5;
    if (!v14)
    {
LABEL_7:
      if (v15 == 0x7FFFFFFFFFFFFFFFLL && *a6 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_12;
      }
      goto LABEL_9;
    }
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *a6 = [v14 indexOfObject:a1];
    uint64_t v15 = *a5;
    goto LABEL_7;
  }
LABEL_9:
  *a4 = *a3;
  *a3 = [*a3 _accessibilityOrderedChildrenContainerWithinElements:v12];
  id v16 = AXLogElementTraversal();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(UIAccessibilityElementTraversal) _handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:childOfElementOrOrderedChildrenContainer:headerIndex:footerIndex:allowedElementsForTraversal:]((uint64_t)a3, v16, v17, v18, v19, v20, v21, v22);
  }

LABEL_12:
}

- (uint64_t)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  BOOL v9 = a5;
  uint64_t v10 = [v8 direction];
  uint64_t v11 = [v8 allowedElementsForTraversal];
  id v12 = [a1 _accessibilityOrderedChildrenContainerWithinElements:v11];
  id v13 = a1;
  uint64_t v88 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v89 = 0x7FFFFFFFFFFFFFFFLL;
  id v14 = AXLogElementTraversal();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:].cold.6();
  }

  if (v12)
  {
    id v86 = v13;
    id v87 = v12;
    [v13 _handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:&v87 childOfElementOrOrderedChildrenContainer:&v86 headerIndex:&v89 footerIndex:&v88 allowedElementsForTraversal:v11];
    unint64_t v15 = (unint64_t)v87;

    id v16 = v86;
  }
  else
  {
    unint64_t v15 = 0;
    id v16 = v13;
  }
  if (!(v11 | v15))
  {
    uint64_t v69 = v10;
    id v72 = v16;
    uint64_t v17 = AXLogElementTraversal();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:](v17);
    }

    uint64_t v18 = (void **)MEMORY[0x1E4F43630];
    id v73 = (id)*MEMORY[0x1E4F43630];
    v74 = v13;
    uint64_t v19 = *v18;
    id v20 = [v13 _accessibilityWindow];
    uint64_t v21 = [v19 _accessibilityViewChildrenWithOptions:v8 referenceWindow:v20];
    goto LABEL_44;
  }
  if (!v11 || v15)
  {
    uint64_t v31 = [(id)v15 indexOfAccessibilityElement:v16];
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v32 = AXLogElementTraversal();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:].cold.4((void *)v15, v32);
      }

      id v33 = [v13 _accessibilityParentFromOrderedChildrenContainer:v15];
      if (v33)
      {
        uint64_t v69 = v10;
        id v72 = v16;
        id v34 = (id)v15;
        id v80 = v13;
        id v81 = v33;
        id v35 = v33;
        v74 = v13;
        id v36 = v13;
        [v36 _handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:&v81 childOfElementOrOrderedChildrenContainer:&v80 headerIndex:&v89 footerIndex:&v88 allowedElementsForTraversal:v11];
        id v37 = v81;
        id v73 = v35;

        id v20 = v80;
        uint64_t v38 = [v37 indexOfAccessibilityElement:v20];
        if (v38 == 0x7FFFFFFFFFFFFFFFLL || v89 == 0x7FFFFFFFFFFFFFFFLL && v88 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v21 = [v73 _accessibilityViewChildrenForEnumeratingSiblingsWithOptions:v8];
        }
        else
        {
          objc_msgSend(v73, "_accessibilityEnumerateSiblingsFromOrderedChildrenContainer:fromChildAtIndex:headerIndex:footerIndex:options:usingBlock:", v34, v38);
          id v43 = v37;

          uint64_t v21 = 0;
          id v73 = v43;
        }

        unint64_t v15 = (unint64_t)v34;
        goto LABEL_44;
      }
      char v42 = AXLogElementTraversal();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:]();
      }

      id v40 = (id)v15;
    }
    else
    {
      uint64_t v39 = v31;
      id v40 = (id)v15;
      id v41 = AXLogElementTraversal();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
        -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:].cold.5();
      }

      [v16 _accessibilityEnumerateSiblingsFromOrderedChildrenContainer:v40 fromChildAtIndex:v39 headerIndex:v89 footerIndex:v88 options:v8 usingBlock:v9];
    }
    uint64_t v21 = 0;
LABEL_61:
    uint64_t v54 = 1;
    goto LABEL_78;
  }
  uint64_t v69 = v10;
  v74 = v13;
  id v72 = v16;
  v65 = a3;
  uint64_t v21 = [MEMORY[0x1E4F1C978] array];
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  id v20 = (id)v11;
  uint64_t v22 = [v20 countByEnumeratingWithState:&v82 objects:v98 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v66 = v11;
    v64 = v9;
    uint64_t v24 = *(void *)v83;
    uint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
    while (1)
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        uint64_t v27 = v21;
        if (*(void *)v83 != v24) {
          objc_enumerationMutation(v20);
        }
        int v28 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        if ([v28 isAccessibilityElement])
        {
          uint64_t v29 = v25;
          if (![v28 _accessibilityIsLeafNodeWithOptions:v8]) {
            goto LABEL_22;
          }
          v97 = v28;
          uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
        }
        else
        {
          uint64_t v30 = [v28 _accessibilityViewChildrenForEnumeratingSiblingsWithOptions:v8];
        }
        uint64_t v29 = (void *)v30;
LABEL_22:
        uint64_t v21 = [v27 arrayByAddingObjectsFromArray:v29];
      }
      uint64_t v23 = [v20 countByEnumeratingWithState:&v82 objects:v98 count:16];
      if (!v23)
      {
        id v73 = 0;
        BOOL v9 = v64;
        a3 = v65;
        uint64_t v11 = v66;
        goto LABEL_37;
      }
    }
  }
  id v73 = 0;
LABEL_37:
  unint64_t v15 = 0;
LABEL_44:

  if (!v21)
  {
    uint64_t v54 = 1;
LABEL_77:
    id v16 = v72;
    id v40 = v73;
    goto LABEL_78;
  }
  uint64_t v44 = [v21 count];
  if (!v44)
  {
    v55 = AXLogElementTraversal();
    id v16 = v72;
    id v40 = v73;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
      -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:]();
    }

    goto LABEL_61;
  }
  unint64_t v45 = v44;
  uint64_t v46 = [v21 indexOfObject:v74];
  if (v46 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_66:
    unint64_t v71 = v15;
    uint64_t v68 = v11;
    buf[0] = 0;
    if (v69 == 1)
    {
      if (v46 + 1 < v45)
      {
        unint64_t v58 = v46 + 2;
        do
        {
          v59 = [v21 objectAtIndexedSubscript:v58 - 1];
          v9[2](v9, v59, buf);

          if (v58 >= v45) {
            break;
          }
          ++v58;
        }
        while (!buf[0]);
      }
    }
    else
    {
      uint64_t v60 = v46 - 1;
      if (v46 - 1 >= 0)
      {
        do
        {
          v61 = [v21 objectAtIndexedSubscript:v60];
          v9[2](v9, v61, buf);

          BOOL v62 = v60-- != 0;
        }
        while (v62 && !buf[0]);
      }
    }
    uint64_t v54 = 1;
    uint64_t v11 = v68;
    unint64_t v15 = v71;
    goto LABEL_77;
  }
  if ([v8 includeAncestorsOfSelfInSiblingMatch])
  {
    unint64_t v70 = v15;
    uint64_t v67 = v11;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v47 = v21;
    uint64_t v48 = [v47 countByEnumeratingWithState:&v76 objects:v96 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v77;
LABEL_50:
      uint64_t v51 = 0;
      while (1)
      {
        if (*(void *)v77 != v50) {
          objc_enumerationMutation(v47);
        }
        uint64_t v52 = *(void *)(*((void *)&v76 + 1) + 8 * v51);
        v75[0] = MEMORY[0x1E4F143A8];
        v75[1] = 3221225472;
        v75[2] = __106__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsWithParent_options_usingBlock___block_invoke;
        v75[3] = &unk_1E59B8A80;
        v75[4] = v52;
        uint64_t v53 = [v74 _accessibilityFindAncestor:v75 startWithSelf:0];
        if (v53) {
          break;
        }
        if (v49 == ++v51)
        {
          uint64_t v49 = [v47 countByEnumeratingWithState:&v76 objects:v96 count:16];
          if (v49) {
            goto LABEL_50;
          }
          goto LABEL_56;
        }
      }
      v56 = (void *)v53;
      uint64_t v46 = [v47 indexOfObject:v53];

      uint64_t v11 = v67;
      unint64_t v15 = v70;
      if (v46 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_66;
      }
    }
    else
    {
LABEL_56:

      uint64_t v11 = v67;
    }
  }
  v57 = AXLogElementTraversal();
  id v40 = v73;
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v91 = v74;
    __int16 v92 = 2114;
    id v93 = v73;
    __int16 v94 = 2114;
    v95 = v21;
    _os_log_debug_impl(&dword_19F2DB000, v57, OS_LOG_TYPE_DEBUG, "Could not find %{public}@ in a list of sorted view [parent: %{public}@] siblings %{public}@.  If this happened right around a screen change, it might be okay, but otherwise this is probably a bug.", buf, 0x20u);
  }

  uint64_t v54 = 0;
  id v16 = v72;
LABEL_78:
  if (a3) {
    *a3 = v40;
  }

  return v54;
}

- (uint64_t)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  return 0;
}

- (id)_accessibilityViewChildrenForEnumeratingSiblingsWithOptions:()UIAccessibilityElementTraversal
{
  id v4 = a3;
  id v5 = [v4 alternateViewChildrenHandler];

  if (v5)
  {
    v6 = [v4 alternateViewChildrenHandler];
    id v7 = ((void (**)(void, void *, id))v6)[2](v6, a1, v4);
  }
  else
  {
    id v7 = [a1 _accessibilityViewChildrenWithOptions:v4];
  }

  return v7;
}

- (uint64_t)_accessibilityCompareGeometryForViewOrDictionary:()UIAccessibilityElementTraversal
{
  id v4 = a3;
  id v5 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    do
    {
      v6 = [v5 objectForKey:@"GroupElements"];
      id v7 = [v6 firstObject];

      objc_opt_class();
      id v5 = v7;
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v4;
  objc_opt_class();
  BOOL v9 = v8;
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = v8;
    do
    {
      uint64_t v11 = [v10 objectForKey:@"GroupElements"];
      BOOL v9 = [v11 firstObject];

      objc_opt_class();
      uint64_t v10 = v9;
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }
  if (!v7 || v9)
  {
    if (v7 || !v9)
    {
      uint64_t v12 = 0;
      if (v7 && v9) {
        uint64_t v12 = [v7 accessibilityCompareGeometry:v9];
      }
    }
    else
    {
      uint64_t v12 = 1;
    }
  }
  else
  {
    uint64_t v12 = -1;
  }

  return v12;
}

- (BOOL)_accessibilityHasVisibleFrame
{
  if (AXDeviceIsPad())
  {
    if ([(id)*MEMORY[0x1E4F43630] safeBoolForKey:@"_isClassic"])
    {
      v2 = [a1 _accessibilityParentView];
      v3 = [v2 window];
      NSClassFromString(&cfstr_Uiclassicwindo.isa);
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        return 1;
      }
    }
  }
  [a1 _accessibilityVisibleFrame];
  return v7 > 2.0 && v6 > 2.0;
}

- (uint64_t)_accessibilityShouldBeProcessed:()UIAccessibilityElementTraversal
{
  return 1;
}

- (uint64_t)_accessibilityShouldUseSupplementaryViews
{
  return 0;
}

- (void)_addAccessibilityElementsAndOrderedContainersWithOptions:()UIAccessibilityElementTraversal toCollection:
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([a1 _accessibilityShouldBeProcessed:v6])
  {
    int v8 = [a1 _accessibilityShouldBeAddedToViewChildrenWithOptions:v6];
    BOOL v9 = [a1 _accessibilityAdditionalElements];
    uint64_t v10 = objc_msgSend(v9, "ax_filteredArrayUsingBlock:", &__block_literal_global_479);
    [v7 axSafelyAddObjectsFromArray:v10];

    if (v8)
    {
      if ([a1 _accessibilityShouldUseSupplementaryViews]
        && ([v6 shouldExcludeSupplementaryViews] & 1) == 0)
      {
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        uint64_t v29 = [a1 _accessibilitySupplementaryHeaderViews];
        uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v57 count:16];
        if (v30)
        {
          uint64_t v31 = v30;
          uint64_t v32 = *(void *)v52;
          do
          {
            uint64_t v33 = 0;
            do
            {
              if (*(void *)v52 != v32) {
                objc_enumerationMutation(v29);
              }
              id v34 = *(void **)(*((void *)&v51 + 1) + 8 * v33);
              if (v34 == a1) {
                _AXAssert();
              }
              else {
                [v34 _addAccessibilityElementsAndOrderedContainersWithOptions:v6 toCollection:v7];
              }
              ++v33;
            }
            while (v31 != v33);
            uint64_t v31 = [v29 countByEnumeratingWithState:&v51 objects:v57 count:16];
          }
          while (v31);
        }

        [v7 addObject:a1];
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        id v35 = [a1 _accessibilitySupplementaryFooterViews];
        uint64_t v36 = [v35 countByEnumeratingWithState:&v47 objects:v56 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v48;
          do
          {
            uint64_t v39 = 0;
            do
            {
              if (*(void *)v48 != v38) {
                objc_enumerationMutation(v35);
              }
              id v40 = *(void **)(*((void *)&v47 + 1) + 8 * v39);
              if (v40 == a1) {
                _AXAssert();
              }
              [v40 _addAccessibilityElementsAndOrderedContainersWithOptions:v6 toCollection:v7];
              ++v39;
            }
            while (v37 != v39);
            uint64_t v37 = [v35 countByEnumeratingWithState:&v47 objects:v56 count:16];
          }
          while (v37);
        }
      }
      else
      {
        [v7 addObject:a1];
      }
LABEL_53:
      id v41 = [a1 _accessibilityAdditionalElements];
      char v42 = objc_msgSend(v41, "ax_filteredArrayUsingBlock:", &__block_literal_global_490);
      [v7 axSafelyAddObjectsFromArray:v42];

      goto LABEL_54;
    }
    id v11 = v7;
    if ([v6 shouldReturnScannerGroups]
      && [a1 _accessibilityIsScannerGroup])
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA48] array];

      int v13 = 1;
    }
    else
    {
      int v13 = 0;
      uint64_t v12 = v11;
    }
    if ([v6 shouldReturnScannerGroups]
      && ([a1 _accessibilityScannerGroupElements], (uint64_t v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      unint64_t v15 = (void *)v14;
      [v12 addObjectsFromArray:v14];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_22:
        if (v13)
        {
          if (([a1 _accessibilityScannerGroupTraits] & 0x20) == 0) {
            [v12 sortUsingSelector:sel__accessibilityCompareGeometryForViewOrDictionary_];
          }
          id v20 = a1;
          uint64_t v21 = (void *)MEMORY[0x1E4F1CA60];
          id v22 = v12;
          uint64_t v23 = [v21 dictionary];
          [v23 setObject:v22 forKeyedSubscript:@"GroupElements"];

          uint64_t v24 = [v20 _accessibilityScannerGroupTraits];
          if (v24)
          {
            uint64_t v25 = [NSNumber numberWithUnsignedLong:v24];
            [v23 setObject:v25 forKeyedSubscript:@"GroupTraits"];
          }
          BOOL v26 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(v20, "_accessibilityScanningBehaviorTraits") | 0x10);
          [v23 setObject:v26 forKeyedSubscript:@"GroupScanBehaviorTraits"];

          uint64_t v27 = [v20 _accessibilityAXAttributedLabel];
          if (v27) {
            [v23 setObject:v27 forKeyedSubscript:@"GroupLabel"];
          }
          int v28 = [v20 _accessibilityGroupIdentifier];
          if (v28) {
            [v23 setObject:v28 forKeyedSubscript:@"GroupIdentifier"];
          }

          [v11 addObject:v23];
        }

        goto LABEL_53;
      }
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      unint64_t v15 = objc_msgSend(a1, "_accessibilitySubviewsForGettingElementsWithOptions:", v6, 0);
      uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v55 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v44;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v44 != v18) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v43 + 1) + 8 * v19++) _addAccessibilityElementsAndOrderedContainersWithOptions:v6 toCollection:v12];
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v55 count:16];
        }
        while (v17);
      }
    }

    goto LABEL_22;
  }
LABEL_54:
}

- (void)_accessibilityElementsInDirectionWithCount:()UIAccessibilityElementTraversal options:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_19F2DB000, a2, a3, "Getting %lu accessibility elements, with options %{public}@.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:()UIAccessibilityElementTraversal childOfElementOrOrderedChildrenContainer:headerIndex:footerIndex:allowedElementsForTraversal:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19F2DB000, v0, v1, "We should have had some elements or containers within the parent (%{public}@) of %{public}@.  If this happened right around a screen change, it might be okay, but otherwise this is probably a bug.");
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl(&dword_19F2DB000, log, OS_LOG_TYPE_DEBUG, "We got to the top without finding a UIAccessibilityContainer node.  Our parent is the root node, the application.", v1, 2u);
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_19F2DB000, v0, v1, "This element has no parent that descends from the ordered child container. We can't continue to traverse this ordered child container because we don't know where to start traversing from. Setting the parent to be the ordered child container so that we at least continue traversing outside this ordered child container: %@", v2, v3, v4, v5, v6);
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.4(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _accessibilityElements];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_19F2DB000, a2, OS_LOG_TYPE_DEBUG, "The node was not a direct child of the ancestor UIAccessibilityContainer (container elements %{public}@).  Time to go up the chain and find that child...", v4, 0xCu);
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_19F2DB000, v0, v1, "We were able to find the child %{public}@ at index %ld.");
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_19F2DB000, v0, v1, "Self is %{public}@.  Ordered children container is %{public}@.");
}

@end