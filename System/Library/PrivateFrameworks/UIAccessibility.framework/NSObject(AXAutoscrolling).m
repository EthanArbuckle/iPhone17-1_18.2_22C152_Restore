@interface NSObject(AXAutoscrolling)
- (BOOL)_accessibilityScrollToBottom;
- (BOOL)_accessibilityScrollToTop;
- (char)_scrollPageSelectorForAutoscrollDirection:()AXAutoscrolling;
- (id)_accessibilityAutoscrollTarget;
- (id)_accessibilityGetAllScrollViews;
- (uint64_t)_accessibilityAutoscrollInDirection:()AXAutoscrolling;
- (uint64_t)_accessibilityAvailableAutoscrollDirections;
- (uint64_t)_accessibilityIsAutoscrolling;
- (void)_accessibilityAutoscrollScrollToBottom;
- (void)_accessibilityAutoscrollScrollToTop;
- (void)_accessibilityDecreaseAutoscrollSpeed;
- (void)_accessibilityIncreaseAutoscrollSpeed;
- (void)_accessibilityPauseAutoscrolling;
- (void)_accessibilitySetAutoscrollSpeed:()AXAutoscrolling;
- (void)_accessibilitySetAutoscrollTarget:()AXAutoscrolling;
@end

@implementation NSObject(AXAutoscrolling)

- (void)_accessibilitySetAutoscrollTarget:()AXAutoscrolling
{
  id v10 = a3;
  v4 = +[UIAccessibilityAutoscrollManager sharedInstance];
  uint64_t v5 = [v4 scrollDirection];

  objc_msgSend(v10, "_accessibilityScrollAncestorForSelector:", objc_msgSend(a1, "_scrollPageSelectorForAutoscrollDirection:", v5));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6) {
    id v6 = v10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_10;
  }
  if (v6 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v7 = [v6 performSelector:sel__scroller];

      id v6 = (id)v7;
    }
  }
  else
  {
    id v6 = [v10 performSelector:sel__scroller];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_10:
    v8 = +[UIAccessibilityAutoscrollManager sharedInstance];
    [v8 setScrollView:v6];

    v9 = +[UIAccessibilityAutoscrollManager sharedInstance];
    [v9 setTargetToScroll:v10];
  }
  else
  {
    _AXLogWithFacility();
  }
}

- (char)_scrollPageSelectorForAutoscrollDirection:()AXAutoscrolling
{
  *((void *)&v4 + 1) = a3;
  *(void *)&long long v4 = a3 - 2;
  uint64_t v3 = v4 >> 1;
  uint64_t v5 = &selRef_accessibilityScrollDownPage;
  if (!v3) {
    uint64_t v5 = &selRef_accessibilityScrollUpPage;
  }
  if (v3 == 3) {
    uint64_t v5 = &selRef_accessibilityScrollRightPage;
  }
  if (v3 == 7) {
    id v6 = &selRef_accessibilityScrollLeftPage;
  }
  else {
    id v6 = v5;
  }
  return *v6;
}

- (id)_accessibilityAutoscrollTarget
{
  v0 = +[UIAccessibilityAutoscrollManager sharedInstance];
  v1 = [v0 scrollView];

  return v1;
}

- (uint64_t)_accessibilityAvailableAutoscrollDirections
{
  v0 = +[UIAccessibilityAutoscrollManager sharedInstance];
  uint64_t v1 = [v0 availableAutoscrollDirections];

  return v1;
}

- (uint64_t)_accessibilityIsAutoscrolling
{
  v0 = +[UIAccessibilityAutoscrollManager sharedInstance];
  uint64_t v1 = [v0 isAutoscrolling];

  return v1;
}

- (uint64_t)_accessibilityAutoscrollInDirection:()AXAutoscrolling
{
  uint64_t v5 = +[UIAccessibilityAutoscrollManager sharedInstance];
  uint64_t v6 = [v5 scrollDirection];

  if (v6 != a3)
  {
    uint64_t v7 = +[UIAccessibilityAutoscrollManager sharedInstance];
    [v7 setScrollDirection:a3];

    v8 = +[UIAccessibilityAutoscrollManager sharedInstance];
    v9 = [v8 targetToScroll];
    [a1 _accessibilitySetAutoscrollTarget:v9];
  }
  id v10 = +[UIAccessibilityAutoscrollManager sharedInstance];
  char v11 = [v10 autoscrollInDirection:a3];

  if (v11) {
    return 1;
  }
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  id v25 = 0;
  v13 = +[UIAccessibilityAutoscrollManager sharedInstance];
  v14 = [v13 targetToScroll];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __65__NSObject_AXAutoscrolling___accessibilityAutoscrollInDirection___block_invoke;
  v19[3] = &unk_1E59B9130;
  v19[4] = a1;
  v19[5] = &v20;
  [v14 _accessibilityIterateScrollParentsUsingBlock:v19];

  uint64_t v15 = v21[5];
  if (v15)
  {
    v16 = +[UIAccessibilityAutoscrollManager sharedInstance];
    [v16 setScrollView:v15];

    v17 = +[UIAccessibilityAutoscrollManager sharedInstance];
    uint64_t v12 = [v17 autoscrollInDirection:a3];
  }
  else
  {
    uint64_t v12 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (void)_accessibilityPauseAutoscrolling
{
  id v0 = +[UIAccessibilityAutoscrollManager sharedInstance];
  [v0 pause];
}

- (void)_accessibilityIncreaseAutoscrollSpeed
{
  id v0 = +[UIAccessibilityAutoscrollManager sharedInstance];
  [v0 incrementAutoscrollSpeed];
}

- (void)_accessibilityDecreaseAutoscrollSpeed
{
  id v0 = +[UIAccessibilityAutoscrollManager sharedInstance];
  [v0 decrementAutoscrollSpeed];
}

- (void)_accessibilitySetAutoscrollSpeed:()AXAutoscrolling
{
  id v2 = +[UIAccessibilityAutoscrollManager sharedInstance];
  [v2 setAutoscrollSpeed:a1];
}

- (id)_accessibilityGetAllScrollViews
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = +[UIAccessibilityElementTraversalOptions options];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__NSObject_AXAutoscrolling___accessibilityGetAllScrollViews__block_invoke;
  v9[3] = &unk_1E59B8A80;
  id v10 = v2;
  id v4 = v2;
  [v3 setLeafNodePredicate:v9];
  id v5 = (id)[a1 _accessibilityLeafDescendantsWithCount:0 options:v3];
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
  uint64_t v7 = [v6 allObjects];

  return v7;
}

- (BOOL)_accessibilityScrollToTop
{
  uint64_t v1 = [a1 _accessibilityScrollAncestor];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v1 adjustedContentInset];
    objc_msgSend(v1, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, 0.0, -v2);
    id v7 = v1;
    AXPerformBlockOnMainThreadAfterDelay();
    [v7 contentOffset];
    BOOL v5 = v4 == *(double *)(MEMORY[0x1E4F1DAD8] + 8) && v3 == *MEMORY[0x1E4F1DAD8];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilityScrollToBottom
{
  uint64_t v1 = [a1 _accessibilityScrollAncestor];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v1 contentSize];
    double v3 = v2;
    double v5 = v4;
    [v1 visibleBounds];
    if (v5 <= v7) {
      double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    else {
      double v8 = v5 - v7;
    }
    if (v3 <= v6) {
      double v9 = *MEMORY[0x1E4F1DAD8];
    }
    else {
      double v9 = v3 - v6;
    }
    objc_msgSend(v1, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, v9, v8);
    id v14 = v1;
    AXPerformBlockOnMainThreadAfterDelay();
    [v14 contentOffset];
    BOOL v12 = v11 == v8 && v10 == v9;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void)_accessibilityAutoscrollScrollToTop
{
  id v0 = +[UIAccessibilityAutoscrollManager sharedInstance];
  uint64_t v1 = [v0 scrollView];

  if (v1)
  {
    id v2 = +[UIAccessibilityAutoscrollManager sharedInstance];
    [v2 scrollToTop];
  }
  else
  {
    AXPerformSafeBlock();
  }
}

- (void)_accessibilityAutoscrollScrollToBottom
{
  id v0 = +[UIAccessibilityAutoscrollManager sharedInstance];
  [v0 scrollToBottom];
}

@end