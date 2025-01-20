@interface NSObject
- (id)_accessibilityFindAXDescendantsPassingTest:(void *)a3 byYieldingElements:;
- (id)_accessibilityFindFirstAXDescendantPassingTest:(void *)a3 byYieldingElements:;
- (uint64_t)_accessibilityCompareGeometry:(void *)a1;
- (void)_accessibilityEnumerateAXDescendants:(void *)a3 passingTest:(void *)a4 byYieldingElements:;
@end

@implementation NSObject

uint64_t __52__NSObject_AXPrivCategory___accessibilityUnregister__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __52__NSObject_AXPrivCategory___accessibilityUnregister__block_invoke(uint64_t a1, void *a2)
{
  _UIAccessibilityCompleteUnregistration(a2);

  _UIAXCleanupRotorCache(a2);
}

uint64_t __59__NSObject_AXPrivCategory___accessibilityAncestorIsKindOf___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __96__NSObject_UIAccessibilityElementTraversal___accessibilityElementsInDirectionWithCount_options___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  v5 = [v10 _accessibilityLeafDescendantsWithCount:*(void *)(a1 + 64) - *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) shouldStopAtRemoteElement:1 options:*(void *)(a1 + 32)];
  if ([v5 count])
  {
    [*(id *)(a1 + 40) addObjectsFromArray:v5];
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v5 count];
  }
  unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  unint64_t v7 = *(void *)(a1 + 64);
  if (v6 < v7)
  {
    v8 = [v5 lastObject];
    int v9 = [v8 _accessibilityIsRemoteElement];

    if (!v9) {
      goto LABEL_9;
    }
    unint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    unint64_t v7 = *(void *)(a1 + 64);
  }
  if (v6 > v7) {
    _AXAssert();
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  *a3 = 1;
LABEL_9:
}

uint64_t __129__NSObject_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 _accessibilityAppendOrderedChildLeafDescendantsToArray:*(void *)(a1 + 32) count:*(void *)(a1 + 56) shouldStopAtRemoteElement:*(unsigned __int8 *)(a1 + 64) options:*(void *)(a1 + 40) treeLogger:*(void *)(a1 + 48)];
  *a4 = result;
  return result;
}

void __129__NSObject_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v11 = a2;
  if (*(unsigned char *)(a1 + 64) && (unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 56)
    || *(unsigned char *)(a1 + 65)
    && ([*(id *)(a1 + 32) lastObject],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 _accessibilityIsRemoteElement],
        v6,
        v7))
  {
    if ((unint64_t)[*(id *)(a1 + 32) count] > *(void *)(a1 + 56)) {
      _AXAssert();
    }
    *a4 = 1;
  }
  else
  {
    if (*(unsigned char *)(a1 + 64))
    {
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v9 = v8 - [*(id *)(a1 + 32) count];
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = [v11 _accessibilityLeafDescendantsWithCount:v9 shouldStopAtRemoteElement:*(unsigned __int8 *)(a1 + 65) options:*(void *)(a1 + 40) treeLogger:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) addObjectsFromArray:v10];
  }
}

void __151__NSObject_UIAccessibilityElementTraversal___accessibilityAppendOrderedChildLeafDescendantsToArray_count_shouldStopAtRemoteElement_options_treeLogger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 64);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __151__NSObject_UIAccessibilityElementTraversal___accessibilityAppendOrderedChildLeafDescendantsToArray_count_shouldStopAtRemoteElement_options_treeLogger___block_invoke_2;
  v9[3] = &unk_1E59B8BD8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 56);
  id v10 = v5;
  uint64_t v13 = v6;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 72);
  id v11 = v7;
  uint64_t v14 = v8;
  char v15 = *(unsigned char *)(a1 + 80);
  id v12 = *(id *)(a1 + 48);
  [a2 enumerateObjectsWithOptions:v4 usingBlock:v9];
}

uint64_t __151__NSObject_UIAccessibilityElementTraversal___accessibilityAppendOrderedChildLeafDescendantsToArray_count_shouldStopAtRemoteElement_options_treeLogger___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 logElement:v7];
  [*(id *)(a1 + 32) push];
  LOBYTE(v6) = [v7 _accessibilityAppendOrderedChildLeafDescendantsToArray:*(void *)(a1 + 40) count:*(void *)(a1 + 64) shouldStopAtRemoteElement:*(unsigned __int8 *)(a1 + 72) options:*(void *)(a1 + 48) treeLogger:*(void *)(a1 + 32)];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)v6;
  uint64_t result = [*(id *)(a1 + 32) pop];
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  return result;
}

uint64_t __165__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsFromOrderedChildrenContainer_fromChildAtIndex_headerIndex_footerIndex_options_usingBlock___block_invoke(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __165__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsFromOrderedChildrenContainer_fromChildAtIndex_headerIndex_footerIndex_options_usingBlock___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v9 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    unint64_t v5 = [v9 count];
    if (v5 > a3)
    {
      unint64_t v6 = v5;
      do
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
          break;
        }
        uint64_t v7 = *(void *)(a1 + 32);
        uint64_t v8 = [v9 objectAtIndexedSubscript:a3];
        (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))(v7, v8, *(void *)(*(void *)(a1 + 40) + 8) + 24);

        if (*(unsigned char *)(a1 + 48)) {
          ++a3;
        }
        else {
          --a3;
        }
      }
      while (a3 < v6);
    }
  }
}

BOOL __106__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsWithParent_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

uint64_t __115__NSObject_UIAccessibilityElementTraversal___addAccessibilityElementsAndOrderedContainersWithOptions_toCollection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityAdditionalElementOrderedLast] ^ 1;
}

uint64_t __115__NSObject_UIAccessibilityElementTraversal___addAccessibilityElementsAndOrderedContainersWithOptions_toCollection___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _accessibilityAdditionalElementOrderedLast];
}

BOOL __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke()
{
  if (UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_onceToken != -1) {
    dispatch_once(&UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_onceToken, &__block_literal_global_5);
  }
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_BaseImplementation;
}

void __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2()
{
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel_accessibilityHitTest_withEvent_);
    }
  }
}

double __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v7, "convertPoint:fromView:", *(void *)(a1 + 32), a3, a4);
LABEL_9:
      a3 = v8;
      goto LABEL_10;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v9 = [*(id *)(a1 + 32) layer];
    objc_msgSend(v7, "convertPoint:fromLayer:", v9, a3, a4);
    a3 = v10;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v8 = UIAccessibilityPointToPoint(*(void **)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
      goto LABEL_9;
    }
  }
LABEL_10:

  return a3;
}

id __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(v3, "accessibilityHitTest:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (!v4)
  {
    (*(void (**)(double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56));
    uint64_t v4 = objc_msgSend(v3, "_accessibilityHitTest:withEvent:", *(void *)(a1 + 32));
  }

  return v4;
}

void __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isAccessibilityElement]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __61__NSObject_AXPrivCategory____accessibilityVisibleScrollArea___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 _accessibilityVisibleScrollArea:*(unsigned __int8 *)(a1 + 40)];
  if (v6 != 2147483650.0)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    *(double *)(v8 + 32) = v6;
    *(void *)(v8 + 40) = v7;
    *a3 = 1;
  }
  return result;
}

void __72__NSObject_AXPrivCategory___accessibilityShouldSpeakScrollStatusOnEntry__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  unint64_t v5 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v5, *(SEL *)(a1 + 40)) != (Method)_accessibilityShouldSpeakScrollStatusOnEntry_BaseNSObjectMethod
    && [v6 _accessibilityShouldSpeakScrollStatusOnEntry])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

void __54__NSObject_AXPrivCategory___accessibilityScrollStatus__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v6 _accessibilityIsScrollAncestor])
  {
    unint64_t v5 = [v6 _accessibilityScrollStatus];
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
      *a3 = 1;
    }
  }
}

void __93__NSObject_AXPrivCategory___accessibilityScrollAncestorForSelector_alwaysAllowRefreshAction___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v15 = a2;
  if ([v15 _accessibilityIsScrollAncestor])
  {
    if (!a1[6]
      || (objc_opt_respondsToSelector() & 1) != 0
      && ([v15 safeValueForKey:a1[4]],
          id v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 BOOLValue],
          v6,
          v7))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        id v8 = v15;
        [v8 safeCGSizeForKey:@"_accessibilityContentSize"];
      }
      else
      {
        if (![v15 _accessibilityIsWebDocumentView])
        {
          id v8 = 0;
LABEL_15:
          objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a2);
          *a3 = 1;
LABEL_16:

          goto LABEL_17;
        }
        id v8 = [v15 safeValueForKey:@"_scroller"];
        [v8 contentSize];
      }
      double v11 = v9;
      double v12 = v10;
      if (v8)
      {
        [v8 visibleBounds];
        if (v14 == v11 && v13 == v12) {
          goto LABEL_16;
        }
      }
      goto LABEL_15;
    }
  }
LABEL_17:
}

uint64_t __69__NSObject_AXPrivCategory___accessibilityIterateParentsForTestBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __53__NSObject_AXPrivCategory___accessibilityIsEscapable__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  unint64_t v5 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v5, *(SEL *)(a1 + 48)) == (Method)_accessibilityIsEscapable_BaseCanPerformMethod)
  {
    int v7 = (objc_class *)objc_opt_class();
    if (class_getInstanceMethod(v7, *(SEL *)(a1 + 56)) != (Method)_accessibilityIsEscapable_BaseNSObjectMethod)
    {
      uint64_t v6 = 1;
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [MEMORY[0x1E4F42FF8] viewControllerForView:v4];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v8);
      if (v8)
      {
        double v9 = (objc_class *)objc_opt_class();
        if (class_getInstanceMethod(v9, *(SEL *)(a1 + 48)) != (Method)_accessibilityIsEscapable_BaseCanPerformMethod)
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          uint64_t v6 = [v8 _accessibilityCanPerformEscapeAction];
LABEL_11:

          goto LABEL_14;
        }
        double v10 = (objc_class *)objc_opt_class();
        if (class_getInstanceMethod(v10, *(SEL *)(a1 + 56)) != (Method)_accessibilityIsEscapable_BaseNSObjectMethod)
        {
          uint64_t v6 = 1;
          goto LABEL_11;
        }
      }
    }
    uint64_t v6 = 0;
    goto LABEL_14;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v6 = [v4 _accessibilityCanPerformEscapeAction];
LABEL_14:

  return v6;
}

uint64_t __54__NSObject_AXPrivCategory___accessibilityIsScrollable__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _accessibilityIsWebDocumentView]) {
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_7;
  }
  if (!UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_2_BaseNSObjectMethod)
  {
    id v3 = (objc_class *)objc_opt_class();
    UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_2_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v3, sel_accessibilityScroll_);
  }
  id v4 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v4, sel_accessibilityScroll_) != (Method)UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_2_BaseNSObjectMethod
    || (uint64_t v5 = [v2 accessibilityTraits], (UIAccessibilityTraitScrollable & v5) != 0))
  {
LABEL_7:
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [MEMORY[0x1E4F42FF8] viewControllerForView:v2];
      if (v8)
      {
        double v9 = (objc_class *)objc_opt_class();
        if (class_getInstanceMethod(v9, sel_accessibilityScroll_) == (Method)UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_2_BaseNSObjectMethod) {
          char v6 = 0;
        }
        else {
          char v6 = -1;
        }
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6 & 1;
}

BOOL __56__NSObject_AXPrivCategory___accessibilityTabBarAncestor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 accessibilityTraits];
  return (*MEMORY[0x1E4F43560] & ~v2) == 0;
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AXLogScrollToVisible();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_8(v3);
  }

  if (([v3 _accessibilityScrollingEnabled] & 1) == 0)
  {
    uint64_t v5 = AXLogScrollToVisible();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_7();
    }
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v3 accessibilityScrollToVisibleWithChild:*(void *)(a1 + 32)];
    uint64_t v5 = AXLogScrollToVisible();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_2();
    }
LABEL_9:

    goto LABEL_10;
  }
  if (objc_opt_respondsToSelector())
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= [v3 accessibilityScrollToVisible];
    uint64_t v5 = AXLogScrollToVisible();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_3();
    }
    goto LABEL_9;
  }
  if (*(id *)(a1 + 32) != v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || [v3 _accessibilityIsWebDocumentView])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v7 = *(id *)(a1 + 32);
      }
      else
      {
        NSClassFromString(&cfstr_Uiaccessibilit_6.isa);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v5 = 0;
          goto LABEL_25;
        }
        int v7 = [*(id *)(a1 + 32) safeValueForKey:@"view"];
      }
      uint64_t v5 = v7;
LABEL_25:
      id v8 = [v3 _accessibilityUserTestingElementBaseType];
      double v9 = NSClassFromString(v8);

      if (!v9) {
        double v9 = (objc_class *)objc_opt_class();
      }
      double v10 = AXLogScrollToVisible();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_6((int)v5, v9);
      }

      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
        || ([*(id *)(a1 + 32) _accessibilityAncestorIsKindOf:v9],
            id v11 = (id)objc_claimAutoreleasedReturnValue(),
            v11,
            v11 != v3))
      {
        int v12 = [*(id *)(a1 + 32) _accessibilityShouldAttemptScrollToFrameOnParentView];
        double v13 = AXLogScrollToVisible();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_5();
        }

        if (v12)
        {
          [*(id *)(a1 + 32) accessibilityFrameForScrolling];
          char v14 = objc_msgSend(v3, "_accessibilityScrollToFrame:forView:", v5);
          id v15 = AXLogScrollToVisible();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
            __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_4();
          }

          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v14;
        }
      }
      goto LABEL_9;
    }
  }
LABEL_10:
  char v6 = AXLogScrollToVisible();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_1(v3);
  }
}

void __69__NSObject_AXPrivCategory___animateScrollViewWithScrollAmount_point___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v19 = a2;
  if ([v19 _accessibilityIsScrollAncestor])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v19 isScrollEnabled])
      {
        if (*(double *)(a1 + 48) >= 0.0)
        {
          [v19 contentSize];
          double v13 = v12;
          [v19 accessibilityFrame];
          double v15 = v13 - v14;
          [v19 contentOffset];
          double v17 = v15 - v16;
          [v19 adjustedContentInset];
          double v10 = v18 + v17;
          if (v18 + v17 <= 0.0) {
            goto LABEL_13;
          }
          uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
          if (v10 >= *(double *)(v11 + 24)) {
            double v10 = *(double *)(v11 + 24);
          }
        }
        else
        {
          [v19 contentOffset];
          double v7 = v6;
          [v19 adjustedContentInset];
          double v9 = v7 + v8;
          if (v9 <= 0.0) {
            goto LABEL_13;
          }
          double v10 = -v9;
          uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
          if (*(double *)(v11 + 24) > v10) {
            double v10 = *(double *)(v11 + 24);
          }
        }
        *(double *)(v11 + 24) = v10;
        *a3 = 1;
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      }
    }
  }
LABEL_13:
}

void __62__NSObject_AXPrivCategory___accessibilityScrollRectToVisible___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  if ([v22 _accessibilityIsScrollAncestor])
  {
    if ([v22 _accessibilityScrollingEnabled])
    {
      [v22 _accessibilityContentOffset];
      double v4 = v3;
      double v6 = v5;
      objc_msgSend(v22, "_accessibilityScrollToFrame:forView:", 0, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
      [v22 _accessibilityContentOffset];
      double v9 = v8;
      double v10 = v7;
      if (v4 != v8 || v6 != v7)
      {
        double v11 = UIAccessibilityFrameToBounds(v22, *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 56));
        double v12 = v9 - v4;
        double v13 = v10 - v6;
        double v17 = UIAccessibilityFrameForBounds(v22, v11 - v12, v14 - v13, v15, v16);
        uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
        *(double *)(v18 + 32) = v17;
        *(void *)(v18 + 40) = v19;
        *(void *)(v18 + 48) = v20;
        *(void *)(v18 + 56) = v21;
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32) = v12
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                + 32);
        *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v13
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                                + 40);
      }
    }
  }
}

void __61__NSObject_AXPrivCategory___accessibilityHandlePublicScroll___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  if ([v8 accessibilityScroll:*(void *)(a1 + 48)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([*(id *)(a1 + 32) _accessibilityIgnoreDelegate])
      {
        double v5 = 0;
      }
      else
      {
        double v5 = [v8 safeValueForKey:@"delegate"];
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v5 accessibilityScroll:*(void *)(a1 + 48)])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
    else
    {
      double v5 = 0;
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
      {
        double v6 = [v8 safeValueForKey:@"dataSource"];
        if (v6 != v5
          && (objc_opt_respondsToSelector() & 1) != 0
          && [v6 accessibilityScroll:*(void *)(a1 + 48)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
        }
      }
    }
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        double v7 = [MEMORY[0x1E4F42FF8] viewControllerForView:v8];
        if ([v7 accessibilityScroll:*(void *)(a1 + 48)])
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
        }
      }
    }
  }
}

void __54__NSObject_AXPrivCategory___accessibilityScrollParent__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 _accessibilityIsScrollAncestor])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

uint64_t __64__NSObject_AXPrivCategory___accessibility2DBrailleCanvasElement__block_invoke(uint64_t a1, void *a2)
{
  return ([a2 _accessibilityMediaAnalysisOptions] >> 20) & 1;
}

uint64_t __62__NSObject_AXPrivCategory___accessibilityMediaAnalysisElement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityCanBeConsideredMediaAnalysisElement];
}

Method __86__NSObject_AXPrivCategory__accessibilityShouldEnumerateContainerElementsArrayDirectly__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  accessibilityShouldEnumerateContainerElementsArrayDirectly_elementsBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel__accessibilityElements);
  accessibilityShouldEnumerateContainerElementsArrayDirectly_elementsCountBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityElementCount);
  Method result = class_getInstanceMethod(v0, sel_accessibilityElementAtIndex_);
  accessibilityShouldEnumerateContainerElementsArrayDirectly_elementAtIndexBaseMethod = (uint64_t)result;
  return result;
}

uint64_t __90__NSObject_AXPrivCategory__accessibilityEnumerateContainerElementsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) objectAtIndex:*(void *)(a1 + 48)];

  return MEMORY[0x1F41817F8]();
}

BOOL __63__NSObject_AXPrivCategory___accessibilityContainerInDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = ([v3 _accessibilityIsTouchContainer] & 1) != 0 || *(void *)(a1 + 32) == (void)v3;

  return v4;
}

BOOL __66__NSObject_AXPrivCategory___accessibilityGuideElementInDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = ([v3 _accessibilityIsGuideElement] & 1) != 0 || *(void *)(a1 + 32) == (void)v3;

  return v4;
}

void __44__NSObject_AXPrivCategory___axAncestorTypes__block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([v8 safeValueForKey:@"_browserAccessibilityStoredValueContainerType"],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    uint64_t v5 = [v8 accessibilityContainerType];
    if (!v5) {
      goto LABEL_8;
    }
    uint64_t v4 = [*(id *)(a1 + 32) axContainerTypeFromUIKitContainerType:v5];
    goto LABEL_7;
  }
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "beaxContainerTypeFromUIKitContainerType:", objc_msgSend(v8, "safeIntegerForKey:", @"browserAccessibilityContainerType"));
  if (v4)
  {
LABEL_7:
    id v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    double v7 = [NSNumber numberWithUnsignedLong:v4];
    [v6 setObject:v8 forKey:v7];
  }
LABEL_8:
}

void __90__NSObject_AXPrivCategory___accessibilitySiblingWithAncestor_isFirst_isLast_sawAXElement___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if (*(id *)(a1 + 32) == v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
LABEL_8:
    *a4 = 1;
    goto LABEL_9;
  }
  id v7 = v6;
  if ([v6 isAccessibilityElement])
  {
    **(unsigned char **)(a1 + 48) = 1;
LABEL_7:
    id v6 = v7;
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) _accessibilitySiblingWithAncestor:v7 isFirst:*(unsigned __int8 *)(a1 + 56) isLast:*(unsigned __int8 *)(a1 + 57) sawAXElement:*(void *)(a1 + 48)])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    goto LABEL_7;
  }
  id v6 = v7;
  if (**(unsigned char **)(a1 + 48)) {
    goto LABEL_8;
  }
LABEL_9:
}

void __56__NSObject_AXPrivCategory___accessibilityContainerTypes__block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) _accessibilityGetBlockForAttribute:43];
  uint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  }
  else {
    uint64_t v5 = [v12 accessibilityContainerType];
  }
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      double v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      id v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    double v11 = objc_msgSend(NSNumber, "numberWithUnsignedLong:", objc_msgSend(*(id *)(a1 + 32), "axContainerTypeFromUIKitContainerType:", v6));
    [v7 addObject:v11];
  }
}

id __70__NSObject_AXPrivCategory___accessibilityInternalTextLinkCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = [WeakRetained _accessibilityInternalTextLinks];
  if ([v5 count])
  {
    uint64_t v6 = [v3 currentItem];
    id v7 = [v6 targetElement];
    uint64_t v8 = [v5 indexOfObject:v7];

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v9 = 0;
    }
    else if ([v3 searchDirection])
    {
      unint64_t v9 = v8 + 1;
    }
    else
    {
      unint64_t v9 = v8 - 1;
    }
    if (v9 >= [*(id *)(a1 + 32) count])
    {
      unint64_t v9 = 0;
    }
    else if ((v9 & 0x8000000000000000) != 0)
    {
      unint64_t v9 = [*(id *)(a1 + 32) count] - 1;
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F426D0]);
    double v11 = [v5 objectAtIndex:v9];
    [v10 setTargetElement:v11];
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __56__NSObject_AXPrivCategory___accessibilityActiveKeyboard__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __56__NSObject_AXPrivCategory___accessibilityActiveKeyboard__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass()) {
    char isKindOfClass = 1;
  }
  else {
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __63__NSObject_AXPrivCategory___accessibilityAccessibleDescendants__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

uint64_t __64__NSObject_AXPrivCategory___accessibilityWatchAutoSpeakElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [v2 _iosAccessibilityAttributeValue:15000];
  uint64_t v4 = [v2 _iosAccessibilityAttributeValue:15002];
  uint64_t v5 = [v2 _iosAccessibilityAttributeValue:15001];

  uint64_t v6 = 0;
  if (v3 && v4 && v5)
  {
    id v7 = [MEMORY[0x1E4F49458] sharedInstance];
    int v8 = [v7 gizmoGetAutoSpeakEnabledForComplication:v5 slot:v4 face:v3];

    if (v8)
    {
      unint64_t v9 = AXLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412546;
        id v12 = v4;
        __int16 v13 = 2112;
        double v14 = v3;
        _os_log_impl(&dword_19F2DB000, v9, OS_LOG_TYPE_INFO, "auto speak element at slot: %@, face: %@", (uint8_t *)&v11, 0x16u);
      }

      uint64_t v6 = 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  return v6;
}

uint64_t __63__NSObject_AXPrivCategory___accessibilitySoftwareMimicKeyboard__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityIsSoftwareKeyboardMimic];
}

void __55__NSObject_AXPrivCategory___accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 count])
  {
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;

      id v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    }
    [v3 addObjectsFromArray:v7];
  }
}

BOOL __55__NSObject_AXPrivCategory___accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 sortPriority];
  unint64_t v6 = [v4 sortPriority];

  return v5 > v6;
}

BOOL __62__NSObject_AXPrivCategory___accessibilityFirstElementForFocus__block_invoke()
{
  if (kAXContainerAncestorTypeKey_block_invoke_3_onceToken != -1) {
    dispatch_once(&kAXContainerAncestorTypeKey_block_invoke_3_onceToken, &__block_literal_global_753);
  }
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstElementForFocus);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)kAXContainerAncestorTypeKey_block_invoke_3_BaseImplementation;
}

void __62__NSObject_AXPrivCategory___accessibilityFirstElementForFocus__block_invoke_2()
{
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstElementForFocus);
  if (InstanceMethod)
  {
    kAXContainerAncestorTypeKey_block_invoke_3_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstElementForFocus);
    }
  }
}

BOOL __74__NSObject_AXPrivCategory___accessibilityFirstElementForFocusWithOptions___block_invoke()
{
  if (kAXContainerAncestorTypeKey_block_invoke_4_onceToken != -1) {
    dispatch_once(&kAXContainerAncestorTypeKey_block_invoke_4_onceToken, &__block_literal_global_757);
  }
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstElementForFocus);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)kAXContainerAncestorTypeKey_block_invoke_4_BaseImplementation;
}

void __74__NSObject_AXPrivCategory___accessibilityFirstElementForFocusWithOptions___block_invoke_2()
{
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstElementForFocus);
  if (InstanceMethod)
  {
    kAXContainerAncestorTypeKey_block_invoke_4_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstElementForFocus);
    }
  }
}

uint64_t __57__NSObject_AXPrivCategory___accessibilityFirstWebElement__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 accessibilityTraits];
  if ((*MEMORY[0x1E4F48DE8] & v4) != 0) {
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t __111__NSObject_AXPrivCategory___accessibilityFirstContainedElementForTechnology_honoringGroups_shouldAlwaysScroll___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == a2) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

Method __67__NSObject_AXPrivCategory___accessibilityFirstElementsForSpeakThis__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v0, sel__accessibilitySpeakThisElementsAndStrings);
  _accessibilityFirstElementsForSpeakThis_speakThisElementsBaseMethod = (uint64_t)result;
  return result;
}

Method __66__NSObject_AXPrivCategory___accessibilityNextElementsForSpeakThis__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  _accessibilityNextElementsForSpeakThis_speakThisElementsBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel__accessibilitySpeakThisElementsAndStrings);
  v1 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v1, sel__accessibilitySpeakThisElementsAndStrings);
  _accessibilityNextElementsForSpeakThis_speakThisElementsVCBaseMethod = (uint64_t)result;
  return result;
}

void __66__NSObject_AXPrivCategory___accessibilityHeaderElementsForColumn___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 accessibilityHeaderElementsForColumn:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a3 = 1;
  }
}

void __63__NSObject_AXPrivCategory___accessibilityHeaderElementsForRow___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 accessibilityHeaderElementsForRow:*(void *)(a1 + 40)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a3 = 1;
  }
}

uint64_t __60__NSObject_AXPrivCategory___accessibilityPublicCustomRotors__block_invoke()
{
  RotorCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

Method __84__NSObject_AXPrivCategory___accessibilityOverridesPotentiallyAttributedAPISelector___block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityLabelBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityLabel);
  v1 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod = (uint64_t)class_getInstanceMethod(v1, sel_accessibilityValue);
  id v2 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityHintBaseMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityHint);
  id v3 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityUserInputLabelsBaseMethod = (uint64_t)class_getInstanceMethod(v3, sel_accessibilityUserInputLabels);
  uint64_t v4 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedLabelBaseMethod = (uint64_t)class_getInstanceMethod(v4, sel_accessibilityAttributedLabel);
  uint64_t v5 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod = (uint64_t)class_getInstanceMethod(v5, sel_accessibilityAttributedValue);
  uint64_t v6 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedHintBaseMethod = (uint64_t)class_getInstanceMethod(v6, sel_accessibilityAttributedHint);
  id v7 = (objc_class *)objc_opt_class();
  Method result = class_getInstanceMethod(v7, sel_accessibilityAttributedUserInputLabels);
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedUserInputLabelsBaseMethod = (uint64_t)result;
  return result;
}

uint64_t __133__NSObject_AXPrivCategory___accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector___block_invoke()
{
  uint64_t result = objc_opt_class();
  _accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__NSObjectClass = result;
  return result;
}

void __112__NSObject_AXPrivCategory___accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector___block_invoke()
{
  _accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityLabelSEL = (uint64_t)sel_accessibilityLabel;
  _accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityValueSEL = (uint64_t)sel_accessibilityValue;
  _accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityHintSEL = (uint64_t)sel_accessibilityHint;
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:512 capacity:16];
  v1 = (void *)processedClasses;
  processedClasses = v0;

  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 addObserver:objc_opt_class() selector:sel__accessibilityClearProcessedClasses_ name:*MEMORY[0x1E4FB8FA8] object:0];
}

id __69__NSObject_AXPrivCategory___accessibilityAXAttributedUserInputLabels__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F488F0];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithCFAttributedString:v3];

  return v4;
}

id __69__NSObject_AXPrivCategory___accessibilityAXAttributedUserInputLabels__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F488F0];
  id v3 = a2;
  uint64_t v4 = (void *)[[v2 alloc] initWithCFAttributedString:v3];

  return v4;
}

uint64_t __55__NSObject_AXPrivCategory___accessibilityGroupedParent__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityIsGroupedParent];
}

uint64_t __70__NSObject_AXPrivCategory___accessibilityProcessChildrenForParameter___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ((id)a1[4] != v3 && (*(unsigned int (**)(void))(a1[6] + 16))())
  {
    uint64_t v4 = [v3 _accessibilityGroupedParent];
    uint64_t v5 = (void *)a1[5];
    if (v4)
    {
      if (v5 && ([v5 isEqual:v4] & 1) != 0) {
        goto LABEL_6;
      }
    }
    else if (!v5)
    {
LABEL_6:
      uint64_t v6 = 1;
LABEL_10:

      goto LABEL_11;
    }
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  uint64_t v6 = 0;
LABEL_11:

  return v6;
}

uint64_t __73__NSObject_AXPrivCategory___iosAccessibilityAttributeValue_forParameter___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == a2) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke_1113()
{
  if (processedClasses_block_invoke_5_onceToken != -1) {
    dispatch_once(&processedClasses_block_invoke_5_onceToken, &__block_literal_global_1115);
  }
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySelectedChildren);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_5_BaseImplementation;
}

void __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySelectedChildren);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_5_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilitySelectedChildren);
    }
  }
}

void __66__NSObject_AXPrivCategory___accessibilityBrailleMapsFromGraphData__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  id v34 = v5;
  if (*(unsigned char *)(a1 + 96))
  {
    double v6 = (double)a3 / (double)*(unint64_t *)(a1 + 72);
  }
  else
  {
    id v7 = [v5 xValue];
    [v7 number];
    double v6 = v8;

    id v5 = v34;
  }
  double v9 = (v6 - *(double *)(a1 + 80)) / (*(double *)(a1 + 88) - *(double *)(a1 + 80));
  id v10 = [v5 yValue];
  [v10 number];
  double v12 = v11;
  [*(id *)(a1 + 32) lowerBound];
  double v14 = v12 - v13;
  [*(id *)(a1 + 32) upperBound];
  double v16 = v15;
  [*(id *)(a1 + 32) lowerBound];
  double v18 = v14 / (v16 - v17);

  [*(id *)(a1 + 40) dimensions];
  uint64_t v21 = v34;
  if (v19 >= (double)(int)(v9 * v19)) {
    double v19 = (double)(int)(v9 * v19);
  }
  int v22 = (int)v19;
  double v23 = v20 - (double)(int)(v18 * v20);
  if (v20 < v23) {
    double v23 = v20;
  }
  int v24 = *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v24 != v22)
  {
    int v25 = (int)v23;
    BOOL v26 = v24 != -1 && v24 < v22;
    int v27 = v26;
    int v28 = v22 - v27;
    int v29 = (int)(v20 + -1.0);
    if (v22 <= v22 - v27) {
      int v30 = v22 - v27;
    }
    else {
      int v30 = v22;
    }
    do
    {
      if ([*(id *)(a1 + 48) isContinuous])
      {
        LODWORD(v31) = 1.0;
        objc_msgSend(*(id *)(a1 + 40), "setHeight:atPoint:", v31, (double)v28, (double)v25);
      }
      else if (v29 >= v25)
      {
        int v32 = v29;
        do
        {
          LODWORD(v31) = 1.0;
          objc_msgSend(*(id *)(a1 + 40), "setHeight:atPoint:", v31, (double)v28, (double)v32);
          BOOL v26 = v32-- <= v25;
        }
        while (!v26);
      }
    }
    while (v28++ != v30);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v25;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v22;
    uint64_t v21 = v34;
  }
}

void __65__NSObject_AXPrivCategory__accessibilityElementForRow_andColumn___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 accessibilityDataTableCellElementForRow:a1[5] column:a1[6]];
  uint64_t v6 = *(void *)(a1[4] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(a1[4] + 8) + 40)) {
    *a3 = 1;
  }
}

uint64_t __53__NSObject_AXPrivCategory___accessibilityColumnCount__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 accessibilityColumnCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t __53__NSObject_AXPrivCategory___accessibilityColumnRange__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 accessibilityColumnRange];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v6 + 32) = result;
  *(void *)(v6 + 40) = v7;
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32);
  if (v8 != 0x7FFFFFFF && v8 != 0x7FFFFFFFFFFFFFFFLL) {
    *a3 = 1;
  }
  return result;
}

void __76__NSObject_AXPrivCategory___accessibilityRowRangeFromTableOrCollectionView___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  uint64_t v5 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v5, *(SEL *)(a1 + 40));
  uint64_t v7 = [v10 accessibilityRowRange];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  *(void *)(v8 + 32) = v7;
  *(void *)(v8 + 40) = v9;
  if (InstanceMethod != (Method)_accessibilityRowRangeFromTableOrCollectionView__BaseNSObjectMethod
    || [v10 _accessibilityIsInTabBar])
  {
    *a3 = 1;
    if (*(void *)(a1 + 48)) {
      **(unsigned char **)(a1 + 48) = [v10 _accessibilityImplementsDefaultRowRange];
    }
  }
}

uint64_t __50__NSObject_AXPrivCategory___accessibilityRowCount__block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 accessibilityRowCount];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

void __38__NSObject_AXPrivCategory___fkaMoveUp__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _accessibilityFocusContainer];
  [v1 _accessibilityMoveFocusWithHeading:1];
}

void __40__NSObject_AXPrivCategory___fkaMoveDown__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _accessibilityFocusContainer];
  [v1 _accessibilityMoveFocusWithHeading:2];
}

void __40__NSObject_AXPrivCategory___fkaMoveLeft__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _accessibilityFocusContainer];
  [v1 _accessibilityMoveFocusWithHeading:4];
}

void __41__NSObject_AXPrivCategory___fkaMoveRight__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _accessibilityFocusContainer];
  [v1 _accessibilityMoveFocusWithHeading:8];
}

void __81__NSObject_AXPrivCategory___accessibilityElementToFocusForAppearanceScreenChange__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

uint64_t __59__NSObject_AXPrivCategory___accessibilityFocusRingAncestor__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v2 canBecomeFocused]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 _accessibilityDrawsFocusRingWhenChildrenFocused];
  }

  return v3;
}

uint64_t __54__NSObject_AXPrivCategory___accessibilityChartElement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityIsChartElement];
}

BOOL __60__NSObject_AXPrivCategory___accessibilityFirstOpaqueElement__block_invoke()
{
  if (processedClasses_block_invoke_6_onceToken != -1) {
    dispatch_once(&processedClasses_block_invoke_6_onceToken, &__block_literal_global_1337);
  }
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    uint64_t v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_6_BaseImplementation;
}

void __60__NSObject_AXPrivCategory___accessibilityFirstOpaqueElement__block_invoke_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_6_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstOpaqueElement);
    }
  }
}

BOOL __72__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementWithOptions___block_invoke()
{
  if (processedClasses_block_invoke_7_onceToken != -1) {
    dispatch_once(&processedClasses_block_invoke_7_onceToken, &__block_literal_global_1341);
  }
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    uint64_t v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_7_BaseImplementation;
}

void __72__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementWithOptions___block_invoke_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_7_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstOpaqueElement);
    }
  }
}

BOOL __68__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocus__block_invoke()
{
  if (processedClasses_block_invoke_8_onceToken != -1) {
    dispatch_once(&processedClasses_block_invoke_8_onceToken, &__block_literal_global_1343);
  }
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElementForFocus);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    uint64_t v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_8_BaseImplementation;
}

void __68__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocus__block_invoke_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElementForFocus);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_8_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstOpaqueElementForFocus);
    }
  }
}

BOOL __80__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocusWithOptions___block_invoke()
{
  if (processedClasses_block_invoke_9_onceToken != -1) {
    dispatch_once(&processedClasses_block_invoke_9_onceToken, &__block_literal_global_1347);
  }
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElementForFocus);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    uint64_t v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_9_BaseImplementation;
}

void __80__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocusWithOptions___block_invoke_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElementForFocus);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_9_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstOpaqueElementForFocus);
    }
  }
}

BOOL __59__NSObject_AXPrivCategory___accessibilityLastOpaqueElement__block_invoke()
{
  if (processedClasses_block_invoke_10_onceToken != -1) {
    dispatch_once(&processedClasses_block_invoke_10_onceToken, &__block_literal_global_1349);
  }
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    uint64_t v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_10_BaseImplementation;
}

void __59__NSObject_AXPrivCategory___accessibilityLastOpaqueElement__block_invoke_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_10_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityLastOpaqueElement);
    }
  }
}

BOOL __71__NSObject_AXPrivCategory___accessibilityLastOpaqueElementWithOptions___block_invoke()
{
  if (processedClasses_block_invoke_11_onceToken != -1) {
    dispatch_once(&processedClasses_block_invoke_11_onceToken, &__block_literal_global_1353);
  }
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    uint64_t v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_11_BaseImplementation;
}

void __71__NSObject_AXPrivCategory___accessibilityLastOpaqueElementWithOptions___block_invoke_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_11_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    id v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityLastOpaqueElement);
    }
  }
}

uint64_t __149__NSObject_AXPrivCategory___accessibilityNextOpaqueElementsForTechnology_startElement_direction_searchType_range_shouldScrollToVisible_honorsGroups___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _accessibilityHasOrderedChildren]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isAccessibilityOpaqueElementProvider];
  }

  return v3;
}

uint64_t __149__NSObject_AXPrivCategory___accessibilityNextOpaqueElementsForTechnology_startElement_direction_searchType_range_shouldScrollToVisible_honorsGroups___block_invoke_1356(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _accessibilityHasOrderedChildren]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isAccessibilityOpaqueElementProvider];
  }

  return v3;
}

BOOL __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _accessibilityOpaqueElementParent];
  [v1 _accessibilityVisibleFrame];
  BOOL v4 = v3 > 0.0 && v2 > 0.0;

  return v4;
}

BOOL __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _accessibilityVisibleFrame];
  return v2 > 0.0 && v1 > 0.0;
}

uint64_t __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == a2) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__2;
  double v16 = __Block_byref_object_dispose__2;
  id v17 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_5;
  v6[3] = &unk_1E59B9350;
  uint64_t v8 = &v12;
  long long v9 = *(_OWORD *)(a1 + 40);
  char v10 = *(unsigned char *)(a1 + 56);
  id v7 = *(id *)(a1 + 32);
  char v11 = *(unsigned char *)(a1 + 57);
  [v3 enumerateObjectsWithOptions:2 * ((void)v9 == 2) usingBlock:v6];
  id v4 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v4;
}

void __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 _accessibilityFindElementInDirection:*(void *)(a1 + 48) searchType:*(void *)(a1 + 56) allowOutOfBoundsChild:*(unsigned __int8 *)(a1 + 64) startingTouchContainer:*(void *)(a1 + 32) honorGroups:*(unsigned __int8 *)(a1 + 65)];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a4 = 1;
  }
}

BOOL __62__NSObject_AXPrivCategory___accessibilitySortedElementsWithin__block_invoke()
{
  if (processedClasses_block_invoke_12_onceToken != -1) {
    dispatch_once(&processedClasses_block_invoke_12_onceToken, &__block_literal_global_1364);
  }
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_12_BaseImplementation;
}

void __62__NSObject_AXPrivCategory___accessibilitySortedElementsWithin__block_invoke_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_12_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    double v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilitySortedElementsWithin);
    }
  }
}

BOOL __74__NSObject_AXPrivCategory___accessibilitySortedElementsWithinWithOptions___block_invoke()
{
  if (processedClasses_block_invoke_13_onceToken != -1) {
    dispatch_once(&processedClasses_block_invoke_13_onceToken, &__block_literal_global_1368);
  }
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    IMP Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    id v3 = AXLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();
    }

    IMP Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_13_BaseImplementation;
}

void __74__NSObject_AXPrivCategory___accessibilitySortedElementsWithinWithOptions___block_invoke_2()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_13_BaseIMP Implementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    double v2 = AXLogCommon();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilitySortedElementsWithin);
    }
  }
}

uint64_t __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 32) == a2) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke_1372(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilitySortedElementsWithinWithOptions:");
}

void __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke_1377(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = [a2 _accessibilityFindElementInDirection:*(void *)(a1 + 48) searchType:*(void *)(a1 + 56) allowOutOfBoundsChild:*(unsigned __int8 *)(a1 + 64) startingTouchContainer:*(void *)(a1 + 32) honorGroups:*(unsigned __int8 *)(a1 + 65)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a3 = 1;
  }
}

uint64_t __85__NSObject_AXPrivCategory___accessibilityVisibleOpaqueElementsHonoringGroups_sorted___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    uint64_t v5 = 0;
  }
  else if ([v3 isAccessibilityElement])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = [v4 _accessibilityIsGroupedParent];
  }

  return v5;
}

uint64_t __59__NSObject_AXPrivCategory___accessibilityDescendantOfType___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __62__NSObject_AXPrivCategory___accessibilityHasDescendantOfType___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __61__NSObject_AXPrivCategory___accessibilityUnignoredDescendant__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isAccessibilityElement];
}

uint64_t __60__NSObject_AXPrivCategory__accessibilityViewWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessibilityIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __79__NSObject_AXPrivCategory___accessibilityAncestorIsAccessibilityElementsHidden__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessibilityElementsHidden];
}

- (void)_accessibilityEnumerateAXDescendants:(void *)a3 passingTest:(void *)a4 byYieldingElements:
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    char v23 = 0;
    uint64_t v18 = 0;
    double v19 = &v18;
    uint64_t v20 = 0x2050000000;
    uint64_t v21 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    char v11 = __96__NSObject_AXPrivCategory___accessibilityEnumerateAXDescendants_passingTest_byYieldingElements___block_invoke;
    uint64_t v12 = &unk_1E59B93E8;
    id v13 = v8;
    double v16 = v22;
    id v14 = v7;
    id v15 = v9;
    id v17 = &v18;
    v19[3] = (uint64_t)v10;
    v11(v10, a1);
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(v22, 8);
  }
}

BOOL __96__NSObject_AXPrivCategory___accessibilityEnumerateAXDescendants_passingTest_byYieldingElements___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(a1[4] + 16))()) {
    (*(void (**)(void))(a1[5] + 16))();
  }
  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    BOOL v4 = 0;
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    BOOL v4 = *(unsigned char *)(*(void *)(a1[7] + 8) + 24) == 0;
  }

  return v4;
}

- (id)_accessibilityFindAXDescendantsPassingTest:(void *)a3 byYieldingElements:
{
  if (a1)
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA48];
    id v6 = a3;
    id v7 = a2;
    id v8 = objc_alloc_init(v5);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __90__NSObject_AXPrivCategory___accessibilityFindAXDescendantsPassingTest_byYieldingElements___block_invoke;
    v11[3] = &unk_1E59B9410;
    id v9 = v8;
    id v12 = v9;
    -[NSObject _accessibilityEnumerateAXDescendants:passingTest:byYieldingElements:](a1, v11, v7, v6);
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

uint64_t __90__NSObject_AXPrivCategory___accessibilityFindAXDescendantsPassingTest_byYieldingElements___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)_accessibilityFindFirstAXDescendantPassingTest:(void *)a3 byYieldingElements:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__2;
    id v15 = __Block_byref_object_dispose__2;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __94__NSObject_AXPrivCategory___accessibilityFindFirstAXDescendantPassingTest_byYieldingElements___block_invoke;
    v10[3] = &unk_1E59B9438;
    v10[4] = &v11;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __94__NSObject_AXPrivCategory___accessibilityFindFirstAXDescendantPassingTest_byYieldingElements___block_invoke_2;
    v8[3] = &unk_1E59B9460;
    id v9 = v5;
    -[NSObject _accessibilityEnumerateAXDescendants:passingTest:byYieldingElements:](a1, v10, v8, v6);
    a1 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return a1;
}

void __94__NSObject_AXPrivCategory___accessibilityFindFirstAXDescendantPassingTest_byYieldingElements___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __94__NSObject_AXPrivCategory___accessibilityFindFirstAXDescendantPassingTest_byYieldingElements___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (a3)
  {
    if (result) {
      *a3 = 1;
    }
  }
  return result;
}

void __57__NSObject_AXPrivCategory___accessibilityFindDescendant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ([v6 _accessibilityHasOrderedChildren])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__NSObject_AXPrivCategory___accessibilityFindDescendant___block_invoke_2;
    v19[3] = &unk_1E59B9488;
    id v20 = v5;
    [v6 accessibilityEnumerateContainerElementsWithOptions:0 usingBlock:v19];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (void *)MEMORY[0x19F3CA890]();
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v8 = *(void **)(a1 + 32);
      id v9 = objc_msgSend(v6, "subviews", 0);
      char v10 = [v8 _accessibilityGeometrySortedElements:v9];

      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
LABEL_6:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          if (!(*((unsigned int (**)(id, void))v5 + 2))(v5, *(void *)(*((void *)&v15 + 1) + 8 * v14))) {
            break;
          }
          if (v12 == ++v14)
          {
            uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v21 count:16];
            if (v12) {
              goto LABEL_6;
            }
            break;
          }
        }
      }
    }
  }
}

uint64_t __57__NSObject_AXPrivCategory___accessibilityFindDescendant___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    char v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    if (a4)
    {
      if ((v6 & 1) == 0) {
        *a4 = 1;
      }
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __64__NSObject_AXPrivCategory___accessibilityFindSubviewDescendant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v6 = objc_msgSend(v5, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10))) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

void __76__NSObject_AXPrivCategory___accessibilityFindSubviewDescendantsPassingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    char v6 = objc_msgSend(v5, "subviews", 0);
    uint64_t v7 = [v6 reverseObjectEnumerator];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11))) {
          break;
        }
        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v9) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

void __71__NSObject_AXPrivCategory___accessibilityFindViewControllerDescendant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a2;
  id v5 = a3;
  char v17 = 0;
  objc_opt_class();
  char v6 = __UIAccessibilityCastAsClass();
  uint64_t v7 = v6;
  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = objc_msgSend(v6, "childViewControllers", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v14;
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v12))) {
          break;
        }
        if (v10 == ++v12)
        {
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v18 count:16];
          if (v10) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

uint64_t __77__NSObject_AXPrivCategory___accessibilityFindViewControllerDescendantOfType___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __84__NSObject_AXPrivCategory___accessibilityFindUnsortedSubviewDescendantsPassingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v6 = objc_msgSend(v5, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!v4[2](v4, *(void *)(*((void *)&v11 + 1) + 8 * v10))) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
}

void __77__NSObject_AXPrivCategory___accessibilityFindUnsortedDescendantsPassingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if ([v5 _accessibilityHasOrderedChildren])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __77__NSObject_AXPrivCategory___accessibilityFindUnsortedDescendantsPassingTest___block_invoke_2;
    v15[3] = &unk_1E59B9488;
    id v16 = v4;
    [v5 accessibilityEnumerateContainerElementsWithOptions:0 usingBlock:v15];
    char v6 = v16;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_14;
    }
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    char v6 = objc_msgSend(v5, "subviews", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
LABEL_7:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (!(*((unsigned int (**)(id, void))v4 + 2))(v4, *(void *)(*((void *)&v11 + 1) + 8 * v10))) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v17 count:16];
          if (v8) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
  }

LABEL_14:
}

uint64_t __77__NSObject_AXPrivCategory___accessibilityFindUnsortedDescendantsPassingTest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (a2)
  {
    char v6 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    if (a4)
    {
      if ((v6 & 1) == 0) {
        *a4 = 1;
      }
    }
  }

  return MEMORY[0x1F41817F8]();
}

uint64_t __70__NSObject_AXPrivCategory___accessibilityControlDescendantWithTarget___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_isKindOfClass())
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = objc_msgSend(v3, "allTargets", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v11 + 1) + 8 * v8) isEqual:*(void *)(a1 + 32)])
          {
            uint64_t v9 = 1;
            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    uint64_t v9 = 0;
LABEL_13:
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __70__NSObject_AXPrivCategory___accessibilityControlDescendantWithAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_opt_isKindOfClass())
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = [v3 allTargets];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          uint64_t v10 = objc_msgSend(v3, "actionsForTarget:forControlEvent:", v9, 0, 0);
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                if ([*(id *)(*((void *)&v17 + 1) + 8 * j) isEqualToString:*(void *)(a1 + 32)])
                {

                  uint64_t v15 = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
        uint64_t v15 = 0;
      }
      while (v6);
    }
    else
    {
      uint64_t v15 = 0;
    }
LABEL_21:
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

uint64_t __94__NSObject_AXPrivCategory___accessibilityVisibleElementsHonoringGroups_respectGroupedParents___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    if (*(id *)(a1 + 32) == v3)
    {
      uint64_t v5 = 0;
    }
    else if ([v3 isAccessibilityElement])
    {
      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v5 = [v4 _accessibilityIsGroupedParent];
    }
  }
  else
  {
    uint64_t v5 = [v3 accessibilityContainerType] != 0;
  }

  return v5;
}

uint64_t __94__NSObject_AXPrivCategory___accessibilityVisibleElementsHonoringGroups_respectGroupedParents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    uint64_t v5 = 0;
  }
  else if ([v3 isAccessibilityElement])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = [v4 _accessibilityIsGroupedParent];
  }

  return v5;
}

BOOL __97__NSObject_AXPrivCategory___accessibilityScannerElementsGrouped_shouldIncludeNonScannerElements___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isAccessibilityElement]
    && (uint64_t v3 = [v2 accessibilityTraits], ((*MEMORY[0x1E4F48CD0] | *MEMORY[0x1E4F48C70]) & v3) == 0))
  {
    BOOL v4 = (*MEMORY[0x1E4F48CE0] & v3) == 0 || (*MEMORY[0x1E4F48BA8] & v3) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

void __67__NSObject_AXPrivCategory___accessibilityChildrenUnionContentFrame__block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if ([v13 isAccessibilityElement])
  {
    if (CGRectIsEmpty(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)))
    {
      [v13 _accessibilityContentFrame];
    }
    else
    {
      uint64_t v7 = *(CGRect **)(*(void *)(a1 + 32) + 8);
      [v13 _accessibilityContentFrame];
      v15.origin.x = v8;
      v15.origin.y = v9;
      v15.size.width = v10;
      v15.size.height = v11;
      *(CGRect *)&uint64_t v3 = CGRectUnion(v7[1], v15);
    }
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 8);
    v12[4] = v3;
    v12[5] = v4;
    v12[6] = v5;
    v12[7] = v6;
  }
}

- (uint64_t)_accessibilityCompareGeometry:(void *)a1
{
  uint64_t v299 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (!a1)
  {
    uint64_t v46 = 0;
    goto LABEL_223;
  }
  [a1 _accessibilityFrameForSorting];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 _accessibilityFrameForSorting];
  double v270 = v12;
  double v275 = v13;
  double v15 = v14;
  double v17 = v16;
  long long v18 = [a1 _accessibilityWindow];
  uint64_t v19 = [v3 _accessibilityWindow];
  long long v20 = (void *)v19;
  if (v18) {
    BOOL v21 = v19 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  int v22 = !v21;
  int v247 = v22;
  if (!v21)
  {
    long long v23 = [v18 windowScene];
    long long v24 = [v20 windowScene];

    if (v23 != v24)
    {
      double v266 = v15;
      double v277 = v17;
      [v18 frame];
      double v26 = v25;
      double v28 = v27;
      int v29 = [v18 screen];
      int v30 = [v29 coordinateSpace];
      objc_msgSend(v18, "convertPoint:toCoordinateSpace:", v30, v26, v28);
      double v32 = v31;
      double v34 = v33;

      [v20 frame];
      double v36 = v35;
      double v38 = v37;
      v39 = [v20 screen];
      v40 = [v39 coordinateSpace];
      objc_msgSend(v20, "convertPoint:toCoordinateSpace:", v40, v36, v38);
      double v42 = v41;
      double v44 = v43;

      BOOL v45 = v34 < v44 || v32 < v42;
      uint64_t v46 = v45 ? -1 : 1;
      if (v32 != v42) {
        goto LABEL_222;
      }
      BOOL v21 = v34 == v44;
      double v17 = v277;
      double v15 = v266;
      if (!v21) {
        goto LABEL_222;
      }
    }
  }
  v278 = v3;
  if ([MEMORY[0x1E4FBA8A8] _accessibilityHasUnitTestingOrientation])
  {
    uint64_t v47 = [MEMORY[0x1E4FBA8A8] _accessibilityUnitTestingOrientation];
  }
  else
  {
    int v48 = [MEMORY[0x1E4F43058] _transformLayerRotationsAreEnabled];
    v49 = (void *)MEMORY[0x1E4F43630];
    if (v48)
    {
      if (v18) {
        uint64_t v50 = [v18 _accessibilityInterfaceOrientationForScreenCoordinates];
      }
      else {
        uint64_t v50 = 0;
      }
      if (v20) {
        uint64_t v52 = [v20 _accessibilityInterfaceOrientationForScreenCoordinates];
      }
      else {
        uint64_t v52 = 0;
      }
      uint64_t v51 = [a1 _accessibilityOrientationForCompareGeometryForApplication:*v49];
      [v18 bounds];
      [v18 _windowInterfaceOrientation];
      _UIConvertRectFromOrientationToOrientation();
      double v5 = v53;
      double v7 = v54;
      double v9 = v55;
      double v11 = v56;
      [v20 bounds];
      [v20 _windowInterfaceOrientation];
      _UIConvertRectFromOrientationToOrientation();
      double v270 = v57;
      double v275 = v58;
      double v15 = v59;
      double v17 = v60;
      goto LABEL_31;
    }
    uint64_t v47 = [a1 _accessibilityOrientationForCompareGeometryForApplication:*MEMORY[0x1E4F43630]];
  }
  uint64_t v51 = v47;
  uint64_t v52 = 1;
  uint64_t v50 = 1;
LABEL_31:
  objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", v50, v51, v5, v7, v9, v11);
  double v62 = v61;
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", v52, v51, v270, v275, v15, v17);
  double v70 = v69;
  double v72 = v71;
  double v74 = v73;
  double v76 = v75;
  id v3 = v278;
  uint64_t v46 = _checkSortPriority(a1, v278);
  if (v46) {
    goto LABEL_222;
  }
  double v276 = v64;
  double rect = v62;
  double v250 = v68;
  uint64_t v248 = v50;
  v244 = v18;
  uint64_t v77 = _scrollParentForComparingGeometryOfView(a1);
  uint64_t v78 = _scrollParentForComparingGeometryOfView(v278);
  HIDWORD(v243) = [(id)v78 _accessibilityIsDescendantOfElement:v77];
  int v79 = [(id)v77 _accessibilityIsDescendantOfElement:v78];
  v245 = v20;
  LODWORD(v243) = v79;
  if (v77 == v78)
  {
    uint64_t v246 = v52;
    double v80 = v74;
    goto LABEL_52;
  }
  double v80 = v74;
  if (v77 && v78)
  {
    if (v79)
    {
      double rect_8 = v76;
      double v251 = v74;
      double v253 = v70;
      double v271 = v72;
      double v81 = *MEMORY[0x1E4F437F8];
      double v82 = *(double *)(MEMORY[0x1E4F437F8] + 8);
      double v83 = *(double *)(MEMORY[0x1E4F437F8] + 16);
      double v84 = *(double *)(MEMORY[0x1E4F437F8] + 24);
      [(id)v77 _accessibilityContentFrame];
      double v86 = v85;
      double v88 = v87;
      double v90 = v89;
      double v92 = v91;
      v93 = [(id)v77 accessibilityContainer];
      v94 = _scrollParentForComparingGeometryOfView(v93);

      for (; ([v94 isEqual:v78] & 1) == 0; uint64_t v77 = v95)
      {
        uint64_t v95 = (uint64_t)v94;
        if (!objc_msgSend(v94, "_accessibilityIsDescendantOfElement:", v78, v243)) {
          break;
        }
        [(id)v78 _accessibilityVisibleContentInset];
        UIEdgeInsetsAdd();
        double v81 = v96;
        double v82 = v97;
        double v83 = v98;
        double v84 = v99;

        [v94 _accessibilityContentFrame];
        double v86 = v100;
        double v88 = v101;
        double v90 = v102;
        double v92 = v103;
        v104 = [v94 accessibilityContainer];
        v94 = _scrollParentForComparingGeometryOfView(v104);
      }
      double v132 = v88 + v81;
      double v129 = v90 - (v84 + v82);
      double v131 = v86 + v82;
      double v130 = v92 - (v83 + v81);
      double v80 = v251;
      double v70 = v253;
      double v72 = v271;
      double v76 = rect_8;
    }
    else if (HIDWORD(v243))
    {
      double v272 = v66;
      double v105 = *MEMORY[0x1E4F437F8];
      double v106 = *(double *)(MEMORY[0x1E4F437F8] + 8);
      double v107 = *(double *)(MEMORY[0x1E4F437F8] + 16);
      double v108 = *(double *)(MEMORY[0x1E4F437F8] + 24);
      [(id)v78 _accessibilityContentFrame];
      double v110 = v109;
      double v112 = v111;
      double v114 = v113;
      double v116 = v115;
      v117 = [(id)v78 accessibilityContainer];
      v118 = _scrollParentForComparingGeometryOfView(v117);

      if (([v118 isEqual:v77] & 1) == 0)
      {
        do
        {
          uint64_t v119 = (uint64_t)v118;
          if (!objc_msgSend(v118, "_accessibilityIsDescendantOfElement:", v77, v243)) {
            break;
          }
          [(id)v78 _accessibilityVisibleContentInset];
          UIEdgeInsetsAdd();
          double v105 = v120;
          double v106 = v121;
          double v107 = v122;
          double v108 = v123;

          [v118 _accessibilityContentFrame];
          double v110 = v124;
          double v112 = v125;
          double v114 = v126;
          double v116 = v127;
          v128 = [v118 accessibilityContainer];
          v118 = _scrollParentForComparingGeometryOfView(v128);

          uint64_t v78 = v119;
        }
        while (![v118 isEqual:v77]);
      }

      double v133 = v106 + v110;
      double v72 = v105 + v112;
      double v80 = v114 - (v106 + v108);
      double v134 = v107 + v105;
      double v70 = v133;
      double v76 = v116 - v134;
      double v131 = rect;
      double v129 = v272;
      double v132 = v276;
      double v130 = v250;
    }
    else
    {
      double v129 = v66;
      double v130 = v68;
      double v131 = v62;
      double v132 = v276;
    }
    objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", v248, v51, v131, v132, v129, v130, v243);
    double v136 = v135;
    double v138 = v137;
    double v66 = v139;
    double v141 = v140;
    objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", v52, v51, v70, v72, v80, v76);
    double v70 = v142;
    double v72 = v143;
    double v80 = v144;
    double v76 = v145;
    uint64_t v146 = _checkSortPriority((void *)v77, (void *)v78);
    if (v146) {
      goto LABEL_115;
    }
    double v276 = v138;
    double rect = v136;
    double v250 = v141;
  }
  uint64_t v246 = v52;
  while (1)
  {
LABEL_52:
    if (!(v77 | v78))
    {
      double v274 = v72;
      uint64_t v77 = 0;
      uint64_t v78 = 0;
      int v181 = 1;
LABEL_104:
      long long v20 = v245;
      goto LABEL_105;
    }
    if (v77 == v78)
    {
      double v274 = v72;
      int v181 = 1;
      goto LABEL_103;
    }
    if (([(id)v77 _accessibilityIsDescendantOfElement:v78] & 1) != 0
      || ([(id)v78 _accessibilityIsDescendantOfElement:v77] & 1) != 0)
    {
      break;
    }
    v147 = [(id)v77 accessibilityContainer];
    v148 = [v147 _accessibilityContainingParentForOrdering];

    v149 = [(id)v78 accessibilityContainer];
    v150 = [v149 _accessibilityContainingParentForOrdering];

    if (([v148 _accessibilityIsDescendantOfElement:v150] & 1) != 0
      || ([v150 _accessibilityIsDescendantOfElement:v148] & 1) != 0)
    {
      int v151 = 1;
    }
    else if (!v148 {
           || ([v148 isEqual:v150] & 1) != 0
    }
           || ([v148 _accessibilityIsDescendantOfElement:v78] & 1) != 0
           || ([v148 _accessibilityIsDescendantOfElement:v150] & 1) != 0)
    {
      int v151 = 1;
      if (v150) {
        goto LABEL_84;
      }
    }
    else
    {
      id v180 = v148;

      int v151 = 0;
      uint64_t v77 = (uint64_t)v180;
      if (v150)
      {
LABEL_84:
        if ((objc_msgSend(v150, "isEqual:", v148, v243) & 1) == 0
          && ([v150 _accessibilityIsDescendantOfElement:v77] & 1) == 0
          && ([v150 _accessibilityIsDescendantOfElement:v148] & 1) == 0)
        {
          id v178 = v150;

          int v151 = 0;
          uint64_t v78 = (uint64_t)v178;
        }
      }
    }
    if (v148)
    {
      while ((objc_msgSend((id)v78, "_accessibilityIsDescendantOfElement:", v148, v243) & 1) == 0)
      {
        id v152 = v148;

        v153 = [v152 accessibilityContainer];
        v148 = _scrollParentForComparingGeometryOfView(v153);

        uint64_t v77 = (uint64_t)v152;
        if (!v148)
        {
          uint64_t v77 = (uint64_t)v152;
          break;
        }
      }
    }
    if (v150)
    {
      while ((objc_msgSend((id)v77, "_accessibilityIsDescendantOfElement:", v150, v243) & 1) == 0)
      {
        id v154 = v150;

        v155 = [v154 accessibilityContainer];
        v150 = _scrollParentForComparingGeometryOfView(v155);

        uint64_t v78 = (uint64_t)v154;
        if (!v150)
        {
          uint64_t v78 = (uint64_t)v154;
          break;
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      int isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      int isKindOfClass = 0;
    }
    if (objc_msgSend(a1, "_accessibilityIsOrnamentWindow", v243)) {
      int v157 = 1;
    }
    else {
      int v157 = [v278 _accessibilityIsOrnamentWindow];
    }
    if (isKindOfClass & v157)
    {
      CGFloat v158 = v76;
      CGFloat v159 = v80;
      CGFloat v160 = v72;
    }
    else
    {
      objc_msgSend(a1, "_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:", v77, v248, v51, rect, v276, v66, v250);
      double v161 = v80;
      CGFloat v163 = v162;
      double v164 = v72;
      CGFloat v166 = v165;
      double v167 = v70;
      CGFloat v169 = v168;
      CGFloat v171 = v170;
      CGFloat v252 = v161;
      CGFloat v254 = v167;
      CGFloat v273 = v164;
      CGFloat rect_8a = v76;
      objc_msgSend(a1, "_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:", v78, v246, v51);
      CGFloat rect_16 = v172;
      CGFloat rect_24 = v173;
      CGFloat v249 = v174;
      CGFloat v267 = v175;
      v300.origin.x = rect;
      double v176 = v276;
      v300.origin.y = v276;
      double v177 = v66;
      v300.size.width = v66;
      v300.size.height = v250;
      v306.origin.x = v163;
      v306.origin.y = v166;
      v306.size.width = v169;
      v306.size.height = v171;
      if (!CGRectEqualToRect(v300, v306))
      {
        double v250 = v171;
        double v177 = v169;
        double v176 = v166;
        double rect = v163;
      }
      v301.origin.x = v254;
      v307.size.height = v267;
      v301.origin.y = v273;
      v301.size.width = v252;
      CGFloat v158 = rect_8a;
      v307.origin.x = rect_16;
      v301.size.height = rect_8a;
      v307.origin.y = rect_24;
      CGFloat v159 = v249;
      v307.size.width = v249;
      double v276 = v176;
      if (CGRectEqualToRect(v301, v307))
      {
        CGFloat v159 = v252;
        double v70 = v254;
        CGFloat v160 = v273;
        double v66 = v177;
      }
      else
      {
        double v66 = v177;
        CGFloat v160 = rect_24;
        CGFloat v158 = v267;
        double v70 = rect_16;
      }
    }

    double v76 = v158;
    double v80 = v159;
    double v72 = v160;
    double v179 = v70;
    if (v151) {
      goto LABEL_94;
    }
  }
  CGFloat v158 = v76;
  CGFloat v159 = v80;
  CGFloat v160 = v72;
  double v179 = v70;
LABEL_94:
  if (v77 == v78)
  {
    int v181 = 1;
    double v70 = v179;
    double v274 = v160;
    double v80 = v159;
    double v76 = v158;
LABEL_103:
    uint64_t v77 = v78;
    goto LABEL_104;
  }
  long long v20 = v245;
  double v70 = v179;
  if (v78)
  {
    if (v77)
    {
      uint64_t v146 = _checkSortPriority((void *)v77, (void *)v78);
      if (v146)
      {
LABEL_115:
        uint64_t v46 = v146;
        goto LABEL_221;
      }
    }
  }
  if ((HIDWORD(v243) | v243)) {
    goto LABEL_99;
  }
  if ([(id)v77 _accessibilityAlwaysOrderedFirst]) {
    goto LABEL_208;
  }
  if ([(id)v78 _accessibilityAlwaysOrderedFirst]) {
    goto LABEL_185;
  }
LABEL_99:
  int v181 = 0;
  double v274 = v160;
  double v80 = v159;
  double v76 = v158;
LABEL_105:
  double v182 = 13.0;
  if ((AXDeviceIsPad() & 1) == 0)
  {
    if (AXDeviceIsWatch()) {
      double v182 = 4.0;
    }
    else {
      double v182 = 8.0;
    }
  }
  if (v77
    && ((v181 & 1) != 0
     || ([(id)v77 _accessibilityIsDescendantOfElement:v78] & 1) != 0
     || [(id)v78 _accessibilityIsDescendantOfElement:v77]))
  {
    objc_opt_class();
    LODWORD(v183) = objc_opt_isKindOfClass();
    id v3 = v278;
    objc_opt_class();
    int v184 = objc_opt_isKindOfClass();
    if (v181)
    {
      uint64_t v146 = [(id)v77 _accessibilityCompareElement:a1 toElement:v278];
      if (v146) {
        goto LABEL_115;
      }
    }
    if (((v183 | v184) & 1) == 0) {
      goto LABEL_188;
    }
    int rect_16a = v181;
    char v268 = v184;
    char rect_24a = v183;
    if (v183)
    {
      long long v293 = 0u;
      long long v294 = 0u;
      long long v291 = 0u;
      long long v292 = 0u;
      uint64_t v183 = [(id)v77 _accessibilitySupplementaryHeaderViews];
      uint64_t v190 = [(id)v183 countByEnumeratingWithState:&v291 objects:v298 count:16];
      if (v190)
      {
        uint64_t v191 = v190;
        char v192 = 0;
        char v193 = 0;
        uint64_t v194 = *(void *)v292;
        do
        {
          for (uint64_t i = 0; i != v191; ++i)
          {
            if (*(void *)v292 != v194) {
              objc_enumerationMutation((id)v183);
            }
            uint64_t v196 = *(void *)(*((void *)&v291 + 1) + 8 * i);
            if (objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v196, v243)) {
              char v192 = 1;
            }
            if ([v278 _accessibilityIsDescendantOfElement:v196]) {
              char v193 = 1;
            }
          }
          uint64_t v191 = [(id)v183 countByEnumeratingWithState:&v291 objects:v298 count:16];
        }
        while (v191);
      }
      else
      {
        char v192 = 0;
        char v193 = 0;
      }

      int v197 = v192 & 1;
      int v198 = v193 & 1;
      id v3 = v278;
      long long v20 = v245;
      LOBYTE(v184) = v268;
      LOBYTE(v183) = rect_24a;
    }
    else
    {
      int v197 = 0;
      int v198 = 0;
    }
    if ((v184 & 1) == 0) {
      goto LABEL_154;
    }
    int v255 = v198;
    int rect_8c = v197;
    long long v289 = 0u;
    long long v290 = 0u;
    long long v287 = 0u;
    long long v288 = 0u;
    uint64_t v183 = [(id)v78 _accessibilitySupplementaryHeaderViews];
    uint64_t v199 = [(id)v183 countByEnumeratingWithState:&v287 objects:v297 count:16];
    if (v199)
    {
      uint64_t v200 = v199;
      char v201 = 0;
      char v202 = 0;
      uint64_t v203 = *(void *)v288;
      do
      {
        for (uint64_t j = 0; j != v200; ++j)
        {
          if (*(void *)v288 != v203) {
            objc_enumerationMutation((id)v183);
          }
          uint64_t v205 = *(void *)(*((void *)&v287 + 1) + 8 * j);
          if (objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v205, v243)) {
            char v201 = 1;
          }
          if ([v278 _accessibilityIsDescendantOfElement:v205]) {
            char v202 = 1;
          }
        }
        uint64_t v200 = [(id)v183 countByEnumeratingWithState:&v287 objects:v297 count:16];
      }
      while (v200);
    }
    else
    {
      char v201 = 0;
      char v202 = 0;
    }

    id v3 = v278;
    long long v20 = v245;
    LOBYTE(v184) = v268;
    LOBYTE(v183) = rect_24a;
    int v197 = rect_8c;
    int v198 = v255;
    if (v201 & 1) == 0 || (v202)
    {
LABEL_154:
      if ((v198 ^ 1 | v197) != 1)
      {
LABEL_185:
        uint64_t v46 = 1;
        goto LABEL_221;
      }
      if (v183)
      {
        long long v285 = 0u;
        long long v286 = 0u;
        long long v283 = 0u;
        long long v284 = 0u;
        v206 = [(id)v77 _accessibilitySupplementaryFooterViews];
        uint64_t v207 = [v206 countByEnumeratingWithState:&v283 objects:v296 count:16];
        if (v207)
        {
          uint64_t v208 = v207;
          char v209 = 0;
          char v210 = 0;
          uint64_t v211 = *(void *)v284;
          do
          {
            for (uint64_t k = 0; k != v208; ++k)
            {
              if (*(void *)v284 != v211) {
                objc_enumerationMutation(v206);
              }
              uint64_t v213 = *(void *)(*((void *)&v283 + 1) + 8 * k);
              if (objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v213, v243)) {
                char v209 = 1;
              }
              if ([v278 _accessibilityIsDescendantOfElement:v213]) {
                char v210 = 1;
              }
            }
            uint64_t v208 = [v206 countByEnumeratingWithState:&v283 objects:v296 count:16];
          }
          while (v208);
        }
        else
        {
          char v209 = 0;
          char v210 = 0;
        }

        int v214 = v209 & 1;
        int v215 = v210 & 1;
        id v3 = v278;
        long long v20 = v245;
        int v181 = rect_16a;
        LOBYTE(v184) = v268;
      }
      else
      {
        int v214 = 0;
        int v215 = 0;
        int v181 = rect_16a;
      }
      if (v184)
      {
        int v269 = v214;
        long long v281 = 0u;
        long long v282 = 0u;
        long long v279 = 0u;
        long long v280 = 0u;
        v216 = [(id)v78 _accessibilitySupplementaryFooterViews];
        uint64_t v217 = [v216 countByEnumeratingWithState:&v279 objects:v295 count:16];
        if (v217)
        {
          uint64_t v218 = v217;
          int rect_24b = v215;
          char v219 = 0;
          char v220 = 0;
          uint64_t v221 = *(void *)v280;
          do
          {
            for (uint64_t m = 0; m != v218; ++m)
            {
              if (*(void *)v280 != v221) {
                objc_enumerationMutation(v216);
              }
              uint64_t v223 = *(void *)(*((void *)&v279 + 1) + 8 * m);
              if (objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v223, v243)) {
                char v219 = 1;
              }
              if ([v278 _accessibilityIsDescendantOfElement:v223]) {
                char v220 = 1;
              }
            }
            uint64_t v218 = [v216 countByEnumeratingWithState:&v279 objects:v295 count:16];
          }
          while (v218);

          id v3 = v278;
          long long v20 = v245;
          int v181 = rect_16a;
          int v214 = v269;
          int v215 = rect_24b;
          if ((v219 & 1) != 0 && (v220 & 1) == 0) {
            goto LABEL_185;
          }
        }
        else
        {

          long long v20 = v245;
          int v181 = rect_16a;
          int v214 = v269;
        }
      }
      if ((v215 ^ 1 | v214) == 1)
      {
LABEL_188:
        double v187 = v276;
        CGFloat rect_8b = v76;
        CGFloat v188 = v80;
        objc_msgSend((id)v77, "_accessibilityAllowedGeometryOverlap", v243);
        double v225 = v224;
        if ((v181 & [(id)v77 _accessibilityOnlyComparesByXAxis]) != 0) {
          double v182 = 10000.0;
        }
        else {
          double v182 = v225;
        }
        [(id)v77 _accessibilityAllowedGeometryOverlapX];
        double v189 = v226;
        goto LABEL_192;
      }
    }
LABEL_208:
    uint64_t v46 = -1;
    goto LABEL_221;
  }
  v185 = _accessibilityCommonAncestor((void *)v77, (void *)v78);
  v186 = [v185 _accessibilityContainingParentForOrdering];

  uint64_t v46 = [v186 _accessibilityCompareElement:v77 toElement:v78];
  if (v46) {
    goto LABEL_221;
  }
  double v187 = v276;
  CGFloat rect_8b = v76;
  CGFloat v188 = v80;
  double v189 = 0.0;
LABEL_192:
  v227 = objc_msgSend((id)v77, "_accessibilityScrollParentForComparingByXAxis", v243);
  uint64_t v228 = [(id)v78 _accessibilityScrollParentForComparingByXAxis];
  v229 = (void *)v228;
  if (v227 && v227 == (void *)v228 && ([v227 _accessibilityOnlyComparesByXAxis] & 1) != 0
    || v229 && v229 == (void *)v77 && ([(id)v77 _accessibilityOnlyComparesByXAxis] & 1) != 0
    || v227 && v227 == (void *)v78 && [(id)v78 _accessibilityOnlyComparesByXAxis])
  {
    double v182 = 10000.0;
  }
  if (vabdd_f64(v187, v274) >= v182)
  {
    if (v187 > v274) {
      goto LABEL_217;
    }
    double v232 = v187;
    double v233 = v274;
    if (v187 < v274) {
      goto LABEL_219;
    }
LABEL_214:
    if (v232 <= v233)
    {
      if (v232 >= v233)
      {
        v302.origin.x = rect;
        v302.origin.y = v232;
        v302.size.width = v66;
        v302.size.height = v250;
        double MaxY = CGRectGetMaxY(v302);
        v303.origin.x = v70;
        v303.origin.y = v233;
        v303.size.width = v188;
        v303.size.height = rect_8b;
        if (MaxY > CGRectGetMaxY(v303)) {
          goto LABEL_217;
        }
        v304.origin.x = rect;
        v304.origin.y = v232;
        v304.size.width = v66;
        v304.size.height = v250;
        double v235 = CGRectGetMaxY(v304);
        v305.origin.x = v70;
        v305.origin.y = v233;
        v305.size.width = v188;
        v305.size.height = rect_8b;
        if (v235 >= CGRectGetMaxY(v305))
        {
          if (!v247) {
            goto LABEL_227;
          }
          [v244 windowLevel];
          double v238 = v237;
          [v245 windowLevel];
          if (v238 > v239) {
            goto LABEL_217;
          }
          [v244 windowLevel];
          double v241 = v240;
          [v245 windowLevel];
          if (v241 >= v242)
          {
LABEL_227:
            uint64_t v46 = 0;
            goto LABEL_220;
          }
        }
      }
LABEL_219:
      uint64_t v46 = -1;
      goto LABEL_220;
    }
LABEL_217:
    uint64_t v46 = 1;
    goto LABEL_220;
  }
  if (rect - v70 <= v189)
  {
    double v232 = v187;
    double v233 = v274;
    if (v70 - rect > v189)
    {
      BOOL v230 = objc_msgSend(a1, "_accessibilityIsRTL", v70 - rect) == 0;
      uint64_t v231 = 1;
      goto LABEL_211;
    }
    goto LABEL_214;
  }
  BOOL v230 = objc_msgSend(a1, "_accessibilityIsRTL", rect - v70) == 0;
  uint64_t v231 = -1;
LABEL_211:
  if (v230) {
    uint64_t v46 = -v231;
  }
  else {
    uint64_t v46 = v231;
  }
LABEL_220:

  long long v20 = v245;
LABEL_221:

  long long v18 = v244;
LABEL_222:

LABEL_223:
  return v46;
}

void __55__NSObject_AXPrivCategory___accessibilityVisibleFrame___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v7 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v7 _accessibilityContentFrame];
    *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectIntersection(v9, *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32));
    if (CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)))
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
      *(_OWORD *)(v5 + 32) = *MEMORY[0x1E4F1DB28];
      *(_OWORD *)(v5 + 48) = v6;
      *a3 = 1;
    }
  }
}

void __81__NSObject_AXPrivCategory___accessibilityConvertSystemBoundedPathToContextSpace___block_invoke(uint64_t a1, int a2, double *a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v7 = a4;
    double v8 = a3 + 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_accessibilityConvertSystemBoundedScreenPointToContextSpace:", *(v8 - 1), *v8);
      *((void *)v8 - 1) = v9;
      *(void *)double v8 = v10;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  switch(a2)
  {
    case 0:
      double v11 = *(CGPath **)(a1 + 40);
      CGFloat v12 = *a3;
      CGFloat v13 = a3[1];
      CGPathMoveToPoint(v11, 0, v12, v13);
      break;
    case 1:
      double v14 = *(CGPath **)(a1 + 40);
      CGFloat v15 = *a3;
      CGFloat v16 = a3[1];
      CGPathAddLineToPoint(v14, 0, v15, v16);
      break;
    case 2:
      double v17 = *(CGPath **)(a1 + 40);
      CGFloat v18 = *a3;
      CGFloat v19 = a3[1];
      CGFloat v20 = a3[2];
      CGFloat v21 = a3[3];
      CGPathAddQuadCurveToPoint(v17, 0, v18, v19, v20, v21);
      break;
    case 3:
      int v22 = *(CGPath **)(a1 + 40);
      CGFloat v23 = *a3;
      CGFloat v24 = a3[1];
      CGFloat v25 = a3[2];
      CGFloat v26 = a3[3];
      CGFloat v27 = a3[4];
      CGFloat v28 = a3[5];
      CGPathAddCurveToPoint(v22, 0, v23, v24, v25, v26, v27, v28);
      break;
    case 4:
      int v29 = *(CGPath **)(a1 + 40);
      CGPathCloseSubpath(v29);
      break;
    default:
      return;
  }
}

void __52__NSObject_AXPrivCategory___axOutermostScrollParent__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 _accessibilityIsScrollAncestor]) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
}

uint64_t __70__NSObject_AXPrivCategory___accessibilityAuthenticatedPasteWithValue___block_invoke(uint64_t a1)
{
  return [MEMORY[0x1E4F42C50] _attemptAuthenticationWithMessage:*(void *)(a1 + 32)];
}

BOOL __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  CGFloat v12 = __Block_byref_object_copy__2;
  CGFloat v13 = __Block_byref_object_dispose__2;
  id v14 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  id v3 = v2;
  AXPerformSafeBlock();
  id v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  BOOL v6 = 0;
  if (v4)
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    if (class_getInstanceMethod(v5, sel_accessibilityPerformEscape) != (Method)_accessibilityPerformEscape_BaseNSObjectMethod
      && (objc_msgSend(v4, "accessibilityPerformEscape", v8, 3221225472, __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_2, &unk_1E59B9578) & 1) != 0)
    {
      BOOL v6 = 1;
    }
  }

  return v6;
}

uint64_t __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(id)_accessibilityPerformEscape_AXUIViewControllerClass viewControllerForView:*(void *)(a1 + 32)];

  return MEMORY[0x1F41817F8]();
}

uint64_t __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(a2, "subviews", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        BOOL v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 accessibilityPerformEscape])
        {
          UIAccessibilityPostNotification(*MEMORY[0x1E4F43490], 0);
          uint64_t v3 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v3;
}

void __80__NSObject_AXPrivCategory___accessibilityConvertStyleAttributesToAccessibility___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = *MEMORY[0x1E4F42510];
  uint64_t v11 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F42510]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    CGFloat v12 = AXColorStringForColor();
    [v8 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F489E0]];

    [v9 addObject:v10];
  }
  int v48 = (void *)v11;
  char v53 = 0;
  objc_opt_class();
  uint64_t v13 = *MEMORY[0x1E4F42508];
  id v14 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  CGFloat v15 = __UIAccessibilityCastAsClass();

  if (v15)
  {
    uint64_t v46 = v13;
    uint64_t v47 = v9;
    CGFloat v16 = [v15 fontName];
    [v8 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F489D0]];

    double v17 = [v15 familyName];
    [v8 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F489C8]];

    CGFloat v18 = NSNumber;
    [v15 pointSize];
    CGFloat v19 = objc_msgSend(v18, "numberWithDouble:");
    [v8 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F489D8]];

    CGFloat v20 = [v15 fontDescriptor];
    char v21 = [v20 symbolicTraits];
    uint64_t v22 = MEMORY[0x1E4F1CC38];
    uint64_t v23 = MEMORY[0x1E4F1CC28];
    if ((v21 & 2) != 0) {
      uint64_t v24 = MEMORY[0x1E4F1CC38];
    }
    else {
      uint64_t v24 = MEMORY[0x1E4F1CC28];
    }
    [v8 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F48970]];

    CGFloat v25 = [v15 fontDescriptor];
    if ([v25 symbolicTraits]) {
      uint64_t v26 = v22;
    }
    else {
      uint64_t v26 = v23;
    }
    [v8 setObject:v26 forKeyedSubscript:*MEMORY[0x1E4F48A10]];

    CGFloat v27 = NSNumber;
    uint64_t v28 = *MEMORY[0x1E4F425C8];
    int v29 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F425C8]];
    int v30 = objc_msgSend(v27, "numberWithInt:", (int)objc_msgSend(v29, "intValue") > 0);
    [v8 setObject:v30 forKeyedSubscript:*MEMORY[0x1E4F48B38]];

    double v31 = NSNumber;
    double v32 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F42568]];
    double v33 = objc_msgSend(v31, "numberWithInt:", (int)objc_msgSend(v32, "intValue") > 0);
    [v8 setObject:v33 forKeyedSubscript:*MEMORY[0x1E4F48B20]];

    double v34 = NSNumber;
    double v35 = [v7 objectForKeyedSubscript:v28];
    double v36 = objc_msgSend(v34, "numberWithInt:", (int)objc_msgSend(v35, "intValue") > 0);
    [v8 setObject:v36 forKeyedSubscript:*MEMORY[0x1E4F48B38]];

    double v37 = NSNumber;
    char v53 = 0;
    objc_opt_class();
    double v38 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F42540]];
    v39 = __UIAccessibilityCastAsClass();

    v40 = objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v39, "alignment"));
    [v8 setObject:v40 forKeyedSubscript:*MEMORY[0x1E4F48A78]];

    id v9 = v47;
    [v47 addObject:v46];
  }
  if ([v8 count]) {
    objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", v8, a3, a4);
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v41 = v9;
  uint64_t v42 = [v41 countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v43; ++i)
      {
        if (*(void *)v50 != v44) {
          objc_enumerationMutation(v41);
        }
        objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *(void *)(*((void *)&v49 + 1) + 8 * i), a3, a4);
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v43);
  }
}

void __115__NSObject_AXPrivCategory___accessibilityPostValueChangedNotificationWithChangeType_insertedText_keyInputDelegate___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)MEMORY[0x1E4F43630];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [*v2 _accessibilityResponderElementForFocus];
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (![v3 _accessibilityTextInputProxiesForRealTextView]
    || ![*(id *)(a1 + 32) length])
  {
LABEL_12:
    _UIAccessibilitySetAssociatedElementContextForNextNotification(v3);
    id v8 = [v3 _accessibilityTextViewTextOperationResponder];
    int v9 = [v8 _accessibilityTextViewIgnoresValueChanges];

    if (v9)
    {
      uint64_t v4 = AXLogCommon();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CGFloat v20 = v3;
        _os_log_impl(&dword_19F2DB000, v4, OS_LOG_TYPE_INFO, "Ignoring ax value notifications for %@", buf, 0xCu);
      }
    }
    else
    {
      if (*(void *)(a1 + 48))
      {
        uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
        [v10 setObject:*(void *)(a1 + 48) forKeyedSubscript:*MEMORY[0x1E4F48DD0]];
        uint64_t v11 = *(void **)(a1 + 40);
        if (v11)
        {
          CGFloat v12 = UIAXRuntimeConvertOutgoingValue(3072, v11);
          [v10 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F48DD8]];
        }
        uint64_t v13 = (void *)[v10 copy];
      }
      else
      {
        uint64_t v13 = 0;
      }
      UIAccessibilityPostNotification(UIAccessibilityValueChangedNotification, v13);

      if ([*(id *)(a1 + 32) length])
      {
        uint64_t v14 = *(void *)(a1 + 32);
        double v17 = @"InsertedText";
        uint64_t v18 = v14;
        uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      }
      else
      {
        uint64_t v4 = 0;
      }
      CGFloat v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 postNotificationName:@"UIAccessibilityValueChangedLocalNotification" object:0 userInfo:v4];
    }
    goto LABEL_24;
  }
  uint64_t v4 = [v3 accessibilityValue];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v4 string];
  }
  else
  {
    uint64_t v5 = v4;
  }
  BOOL v6 = v5;
  if (([v5 containsString:*(void *)(a1 + 32)] & 1) != 0
    || (uint64_t v7 = [v3 accessibilityTraits], (UIAccessibilityTraitSecureTextField & v7) != 0))
  {

    goto LABEL_12;
  }
  CGFloat v16 = AXLogCommon();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CGFloat v20 = v3;
    _os_log_impl(&dword_19F2DB000, v16, OS_LOG_TYPE_INFO, "Ignoring proxied view changes %@", buf, 0xCu);
  }

LABEL_24:
}

uint64_t __76__NSObject_AXPrivCategory___accessibilityElementForTextInsertionAndDeletion__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilitySupportsTextInsertionAndDeletion];
}

uint64_t __60__NSObject_AXPrivCategory___accessibilityHandwritingElement__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilitySupportsHandwriting];
}

void __79__NSObject_AXPrivCategory___accessibilityReplaceCharactersAtCursor_withString___block_invoke()
{
  uint64_t v0 = AXLogAppAccessibility();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v1 = 0;
    _os_log_impl(&dword_19F2DB000, v0, OS_LOG_TYPE_INFO, "Unblocking notifications after replacing characaters.", v1, 2u);
  }

  AXUIUnblockKeyboardEntryNotifications();
}

uint64_t __79__NSObject_AXPrivCategory___accessibilityReplaceCharactersAtCursor_withString___block_invoke_1824(uint64_t a1)
{
  return [*(id *)(a1 + 32) waitUntilAllTasksAreFinished];
}

uint64_t __41__NSObject_AXPrivCategory___axSuperviews__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 name];
  if ([v3 isEqualToString:@"InvertColorsDoubleInvert"])
  {
    uint64_t v4 = 1;
  }
  else
  {
    uint64_t v5 = [v2 name];
    if ([v5 isEqualToString:@"UIInvertColorsDoubleInvertPrivateKey"])
    {
      uint64_t v4 = 1;
    }
    else
    {
      BOOL v6 = [v2 name];
      uint64_t v4 = [v6 isEqualToString:@"InvertColorsDarkModeWindowFilter"];
    }
  }

  return v4;
}

void __60__NSObject_AXPrivCategory___accessibilitySupportedLanguages__block_invoke()
{
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v0 = [v2 preferredLocalizations];
  double v1 = (void *)_accessibilitySupportedLanguages_Supported;
  _accessibilitySupportedLanguages_Supported = v0;
}

uint64_t __90__NSObject_AXPrivCategory___accessibilityPostPasteboardTextForOperation_associatedObject___block_invoke()
{
  _accessibilityPostPasteboardTextForOperation_associatedObject__pasteBoardQueue = (uint64_t)dispatch_queue_create("UIAX-PasteBoard-Queue", 0);

  return MEMORY[0x1F41817F8]();
}

void __90__NSObject_AXPrivCategory___accessibilityPostPasteboardTextForOperation_associatedObject___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42C50] generalPasteboard];
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = __Block_byref_object_copy__2;
  int v9 = __Block_byref_object_dispose__2;
  id v10 = [v2 string];
  if ([(id)v6[5] length])
  {
    id v3 = *(id *)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    AXPerformBlockOnMainThread();
  }
  _Block_object_dispose(&v5, 8);
}

void __90__NSObject_AXPrivCategory___accessibilityPostPasteboardTextForOperation_associatedObject___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) length])
  {
    id v2 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v3 = UIKitAccessibilityLocalizedString(*(void **)(a1 + 32));
    uint64_t v4 = [v2 stringByAppendingFormat:@", %@", v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    BOOL v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  id argument = [MEMORY[0x1E4F488F0] axAttributedStringWithString:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  [argument setAttribute:MEMORY[0x1E4F1CC38] forKey:*MEMORY[0x1E4F48A80]];
  _UIAccessibilitySetAssociatedElementContextForNextNotification(*(void **)(a1 + 40));
  UIAccessibilityPostNotification(*MEMORY[0x1E4F43400], argument);
}

uint64_t __69__NSObject_AXPrivCategory___accessibilityIsDraggableElementAttribute__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityHasDragSources];
}

uint64_t __69__NSObject_AXPrivCategory___accessibilityIsDraggableElementAttribute__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _accessibilityHasDragSources];
}

BOOL __89__NSObject_AXPrivCategory___accessibilityFilterInteractionLocationDescriptorsForVisible___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 view];
  uint64_t v4 = [v3 window];
  uint64_t v5 = v4;
  if (v4 && ([v4 isHidden] & 1) == 0)
  {
    [v2 point];
    objc_msgSend(v5, "convertPoint:fromView:", v3);
    uint64_t v7 = objc_msgSend(v5, "hitTest:withEvent:", 0);
    id v8 = (void *)v7;
    for (BOOL i = v7 != 0; v8 != v3 && v8; BOOL i = v8 != 0)
    {
      int v9 = v8;
      id v8 = [v8 superview];
    }
  }
  else
  {
    BOOL i = 0;
  }

  return i;
}

uint64_t __87__NSObject_AXPrivCategory___accessibilityDragSourceDescriptorDictionaryRepresentations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 view];
  uint64_t v3 = [v2 _accessibilityCanDrag];

  return v3;
}

id __87__NSObject_AXPrivCategory___accessibilityDragSourceDescriptorDictionaryRepresentations__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dictionaryRepresentation];
  uint64_t v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [*(id *)(a1 + 32) _accessibilityDragSourceDescriptorAuxiliaryDictionary];
  if (v5) {
    [v4 addEntriesFromDictionary:v5];
  }

  return v4;
}

id __86__NSObject_AXPrivCategory___accessibilityDropPointDescriptorDictionaryRepresentations__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 dictionaryRepresentation];
  uint64_t v5 = (void *)[v4 mutableCopy];

  BOOL v6 = [v3 view];
  uint64_t v7 = [v6 window];

  id v8 = [v3 view];
  [v3 point];
  objc_msgSend(v8, "convertPoint:toView:", v7);
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v7, "convertPoint:toWindow:", 0, v10, v12);
  AXUIConvertPointFromScreenToContextSpace();
  valuePtr[0] = v13;
  valuePtr[1] = v14;
  CGFloat v15 = [v3 view];
  [v3 point];
  double v17 = v16;
  double v19 = v18;

  CGFloat v20 = [MEMORY[0x1E4F42D90] mainScreen];
  uint64_t v21 = [v20 fixedCoordinateSpace];
  objc_msgSend(v15, "convertPoint:toCoordinateSpace:", v21, v17, v19);
  uint64_t v29 = v22;
  uint64_t v30 = v23;

  uint64_t v24 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "_contextId", v29, v30));
  [v5 setObject:v24 forKeyedSubscript:*MEMORY[0x1E4F48850]];

  AXValueRef v25 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  [v5 setObject:CFAutorelease(v25) forKeyedSubscript:*MEMORY[0x1E4F48858]];
  AXValueRef v26 = AXValueCreate(kAXValueTypeCGPoint, &v29);
  [v5 setObject:CFAutorelease(v26) forKeyedSubscript:*MEMORY[0x1E4F48868]];
  CGFloat v27 = [*(id *)(a1 + 32) _accessibilityDropPointDescriptorAuxiliaryDictionary];
  if (v27) {
    [v5 addEntriesFromDictionary:v27];
  }

  return v5;
}

uint64_t __74__NSObject_AXPrivCategory___accessibilityUseContextlessPassthroughForDrag__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityHasDragSources];
}

void __65__NSObject_AXAutoscrolling___accessibilityAutoscrollInDirection___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v13 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([*(id *)(a1 + 32) _accessibilityIgnoreDelegate])
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [v13 safeValueForKey:@"delegate"];
    }
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [v5 _accessibilityScrollAncestor];
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      *a3 = 1;
      goto LABEL_19;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    double v9 = [v13 safeValueForKey:@"dataSource"];
    if (v9 != v5 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
LABEL_17:
      uint64_t v10 = [v9 _accessibilityScrollAncestor];
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      double v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      *a3 = 1;
      goto LABEL_18;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_19;
  }
  double v9 = [MEMORY[0x1E4F42FF8] viewControllerForView:v13];
  if (objc_opt_respondsToSelector()) {
    goto LABEL_17;
  }
LABEL_18:

LABEL_19:
}

uint64_t __60__NSObject_AXAutoscrolling___accessibilityGetAllScrollViews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v4 = [v3 _accessibilityScrollingEnabled];
  }
  else {
    int v4 = 0;
  }
  int v5 = [v3 _accessibilityIsRemoteElement];
  if (v5) {
    int v5 = [v3 onClientSide];
  }
  if ((v4 | v5) == 1) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 0;
}

void __54__NSObject_AXAutoscrolling___accessibilityScrollToTop__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x1E4F43450];
  id v2 = [*(id *)(a1 + 32) _accessibilityFirstOpaqueElement];
  UIAccessibilityPostNotification(v1, v2);
}

void __57__NSObject_AXAutoscrolling___accessibilityScrollToBottom__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1 = *MEMORY[0x1E4F43450];
  id v2 = [*(id *)(a1 + 32) _accessibilityLastOpaqueElement];
  UIAccessibilityPostNotification(v1, v2);
}

void __64__NSObject_AXAutoscrolling___accessibilityAutoscrollScrollToTop__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _accessibilityWindow];
  [*(id *)(a1 + 32) accessibilityActivationPoint];
  objc_msgSend(v2, "_scrollToTopViewsUnderScreenPointIfNecessary:resultHandler:", &__block_literal_global_3009);
}

void __89__NSObject_UIStorage___accessibilityActivateDragWithDescriptorDictionary_forServiceName___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __89__NSObject_UIStorage___accessibilityActivateDragWithDescriptorDictionary_forServiceName___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __68__NSObject_UIStorage___accessibilitySpeakThisElementWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accessibilityIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __57__NSObject_UIStorage___drawsFocusRingWhenChildrenFocused__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityDrawsFocusRingWhenChildrenFocused];
}

uint64_t __51__NSObject_UIStorage___accessibilityFocusContainer__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _accessibilityIsFocusContainer];
}

void __58__NSObject_UIStorage___accessibilityClearLastFocusedChild__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 _accessibilityRemembersLastFocusedChild]) {
    [v2 _axSetLastFocusedChild:0];
  }
}

BOOL __77__NSObject_UIStorage___accessibilityIsContainedByPreferredNativeFocusElement__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

Class __62__NSObject_UIStorage___accessibilityIsContainedByVideoElement__block_invoke()
{
  _accessibilityIsContainedByVideoElement_AVPlayerViewControllerClass = (uint64_t)NSClassFromString(&cfstr_Avplayerviewco.isa);
  Class result = NSClassFromString(&cfstr_Avinfopanelvie.isa);
  _accessibilityIsContainedByVideoElement_AVInfoPanelViewController = (uint64_t)result;
  return result;
}

uint64_t __62__NSObject_UIStorage___accessibilityIsContainedByVideoElement__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 _accessibilityViewController];
  if (objc_opt_isKindOfClass()) {
    char isKindOfClass = 1;
  }
  else {
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

uint64_t __58__NSObject_UIStorage___accessibilitySortExplorerElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  uint64_t v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a3, "_accessibilityExplorerElementReadPriority"));
  uint64_t v7 = NSNumber;
  uint64_t v8 = [v5 _accessibilityExplorerElementReadPriority];

  double v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

BOOL __54__NSObject_UIStorage___isAccessibilityExplorerElement__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v2 accessibilityTraits];
    BOOL v4 = (*MEMORY[0x1E4F43500] & v3) != 0;
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

uint64_t __83__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSupplementaryViews___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

uint64_t __90__NSObject_UIAccessibilityAutomation___accessibilityBaseImplementationUserTestingChildren__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

uint64_t __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessibilityViewIsModal];
}

void __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_375(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 48) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    if (([v7 _accessibilityUserTestingIsElementClassAcceptable] & 1) == 0)
    {
      double v9 = AXLogUIA();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_375_cold_3((uint64_t)v7, v9);
      }
    }
    uint64_t v10 = (void *)_AXCreateAXUIElementWithElement();
    [v8 setObject:v10 forKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];

    uint64_t v11 = AXLogUIA();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_375_cold_2();
    }

    double v12 = AXLogUIA();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_375_cold_1();
    }

    [*(id *)(a1 + 32) addObject:v8];
    [*(id *)(a1 + 40) addObject:v8];
  }
}

uint64_t __148__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotAncestorsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessibilityViewIsModal];
}

void __148__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotAncestorsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_378(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (*(void *)(a1 + 56) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    double v9 = (void *)_AXCreateAXUIElementWithElement();
    [v8 setObject:v9 forKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];

    uint64_t v10 = AXLogUIA();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_375_cold_1();
    }

    uint64_t v11 = *(void **)(a1 + 32);
    unint64_t v12 = *(void *)(a1 + 64);
    id v15 = 0;
    id v13 = _accessibilityAttributesForObject(v7, v11, v12, 1, &v15);
    id v14 = v15;
    [v8 setObject:v13 forKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributes"];

    if (*(void *)(a1 + 40)) {
      [v8 setObject:v14 forKeyedSubscript:@"UIAccessibilitySnapshotKeyAttributeArrayCounts"];
    }
    [*(id *)(a1 + 48) addObject:v8];
  }
}

uint64_t __84__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __79__NSObject_UIAccessibilityTextAttributeRotor___accessibilityUnderlineTextMatch__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:*MEMORY[0x1E4F425C8]];
  BOOL v3 = (int)[v2 intValue] > 0;

  return v3;
}

uint64_t __76__NSObject_UIAccessibilityTextAttributeRotor___accessibilityItalicTextMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  id v7 = __UIAccessibilityCastAsClass();

  uint64_t v8 = [v7 fontDescriptor];
  uint64_t v9 = [v8 symbolicTraits] & 1;

  return v9;
}

uint64_t __74__NSObject_UIAccessibilityTextAttributeRotor___accessibilityBoldTextMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  id v7 = __UIAccessibilityCastAsClass();

  uint64_t v8 = [v7 fontDescriptor];
  uint64_t v9 = ([v8 symbolicTraits] >> 1) & 1;

  return v9;
}

uint64_t __75__NSObject_UIAccessibilityTextAttributeRotor___accessibilityPlainTextMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  uint64_t v6 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  id v7 = __UIAccessibilityCastAsClass();

  uint64_t v8 = [v7 fontDescriptor];
  char v9 = [v8 symbolicTraits];

  uint64_t v10 = [v7 fontDescriptor];
  int v11 = [v10 symbolicTraits] & 2 | v9 & 1;

  unint64_t v12 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F425C8]];
  int v13 = [v12 intValue];

  if (v11) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = v13 < 1;
  }
  uint64_t v15 = v14;

  return v15;
}

uint64_t __77__NSObject_UIAccessibilityTextAttributeRotor___accessibilityStyleChangeMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  uint64_t v6 = *MEMORY[0x1E4F42508];
  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  uint64_t v8 = __UIAccessibilityCastAsClass();

  char v9 = [(id)v8 fontDescriptor];
  int v30 = [v9 symbolicTraits];

  uint64_t v10 = [(id)v8 fontDescriptor];
  char v11 = [v10 symbolicTraits];

  uint64_t v12 = *MEMORY[0x1E4F425C8];
  int v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F425C8]];
  int v14 = [v13 intValue];

  objc_opt_class();
  uint64_t v15 = [v5 objectForKeyedSubscript:v6];
  uint64_t v16 = __UIAccessibilityCastAsClass();

  double v17 = [(id)v16 fontDescriptor];
  char v18 = [v17 symbolicTraits];

  double v19 = [(id)v16 fontDescriptor];
  char v20 = [v19 symbolicTraits];

  uint64_t v21 = [v5 objectForKeyedSubscript:v12];
  int v22 = [v21 intValue];

  BOOL v24 = v14 < 1 || v22 > 0;
  int v25 = (v30 ^ ((v18 & 1) == 0)) & (((v11 & 2) == 0) | ((v20 & 2) >> 1)) & (((v20 & 2) == 0) | ((v11 & 2) >> 1)) & *(_DWORD *)&v24;
  if (v14 <= 0 && v22 >= 1) {
    int v25 = 0;
  }
  unsigned int v27 = v25 ^ 1;
  if (v8 | v16) {
    uint64_t v28 = v27;
  }
  else {
    uint64_t v28 = 0;
  }

  return v28;
}

uint64_t __76__NSObject_UIAccessibilityTextAttributeRotor___accessibilityFontChangeMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  uint64_t v6 = *MEMORY[0x1E4F42508];
  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
  uint64_t v8 = __UIAccessibilityCastAsClass();

  objc_opt_class();
  char v9 = [v5 objectForKeyedSubscript:v6];
  uint64_t v10 = __UIAccessibilityCastAsClass();

  if (v8 | v10) {
    uint64_t v11 = [(id)v8 isEqual:v10] ^ 1;
  }
  else {
    uint64_t v11 = 0;
  }

  return v11;
}

BOOL __77__NSObject_UIAccessibilityTextAttributeRotor___accessibilityColorChangeMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *MEMORY[0x1E4F42510];
  id v5 = a3;
  uint64_t v6 = [a2 objectForKeyedSubscript:v4];
  uint64_t v7 = [v5 objectForKeyedSubscript:v4];

  if (v6 | v7) {
    BOOL v8 = !UIAccessibilityColorEqualToColor((void *)v6, (void *)v7);
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

void __78__NSObject_UIAccessibilityTextAttributeRotor___accessibilityAttributeMatcher___block_invoke(uint64_t a1)
{
  v16[7] = *MEMORY[0x1E4F143B8];
  v15[0] = &unk_1EF171CF8;
  int v14 = [*(id *)(a1 + 32) _accessibilityBoldTextMatch];
  v16[0] = v14;
  v15[1] = &unk_1EF171D10;
  id v2 = [*(id *)(a1 + 32) _accessibilityItalicTextMatch];
  v16[1] = v2;
  v15[2] = &unk_1EF171D28;
  BOOL v3 = [*(id *)(a1 + 32) _accessibilityUnderlineTextMatch];
  v16[2] = v3;
  uint64_t v4 = [NSNumber numberWithInteger:UIAccessibilityCustomSystemRotorTypePlainText];
  v15[3] = v4;
  id v5 = [*(id *)(a1 + 32) _accessibilityPlainTextMatch];
  v16[3] = v5;
  uint64_t v6 = [NSNumber numberWithInteger:UIAccessibilityCustomSystemRotorTypeColorChange];
  void v15[4] = v6;
  uint64_t v7 = [*(id *)(a1 + 32) _accessibilityColorChangeMatch];
  v16[4] = v7;
  BOOL v8 = [NSNumber numberWithInteger:UIAccessibilityCustomSystemRotorTypeFontChange];
  v15[5] = v8;
  char v9 = [*(id *)(a1 + 32) _accessibilityFontChangeMatch];
  v16[5] = v9;
  uint64_t v10 = [NSNumber numberWithInteger:UIAccessibilityCustomSystemRotorTypeStyleChange];
  v15[6] = v10;
  uint64_t v11 = [*(id *)(a1 + 32) _accessibilityStyleChangeMatch];
  v16[6] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:7];
  int v13 = (void *)_accessibilityAttributeMatcher__Matchers;
  _accessibilityAttributeMatcher__Matchers = v12;
}

id __84__NSObject_UIAccessibilityTextAttributeRotor___accessibilityTextStylingCustomRotor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 currentItem];
  id v5 = [v4 targetElement];
  uint64_t v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    double v33 = [*(id *)(a1 + 32) _accessibilityAttributeMatcher:*(void *)(a1 + 40)];
    BOOL v8 = __UIAccessibilityCastAsProtocol();
    double v32 = [v3 currentItem];
    char v9 = [v32 targetRange];
    uint64_t v10 = [v3 searchDirection];
    if (!v9)
    {
      if (v10 == 1)
      {
        uint64_t v11 = [v8 beginningOfDocument];
        [v8 beginningOfDocument];
      }
      else
      {
        uint64_t v11 = [v8 endOfDocument];
        [v8 endOfDocument];
      uint64_t v12 = };
      char v9 = [v8 textRangeFromPosition:v11 toPosition:v12];
    }
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3010000000;
    id v41 = "";
    long long v42 = xmmword_19F3490A0;
    int v13 = [*(id *)(a1 + 32) _accessibilityAttributedTextRetrieval];
    if ([v13 length])
    {
      int v14 = [v8 beginningOfDocument];
      uint64_t v15 = [v9 start];
      unint64_t v16 = [v8 offsetFromPosition:v14 toPosition:v15];

      if (v16 >= [v13 length]) {
        unint64_t v16 = [v13 length] - 1;
      }
      double v17 = [v8 beginningOfDocument];
      char v18 = [v9 end];
      uint64_t v19 = [v8 offsetFromPosition:v17 toPosition:v18];

      if (v10 == 1)
      {
        unint64_t v20 = [v13 length] - v19;
      }
      else
      {
        uint64_t v19 = 0;
        unint64_t v20 = v16;
      }
      uint64_t v21 = [v13 attributesAtIndex:v16 effectiveRange:0];
      if (*(void *)(a1 + 40) == 13)
      {
        uint64_t v22 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityMisspelledWordIn:searchRange:next:", v13, v19, v20, v10 == 1);
        uint64_t v23 = v39;
        v39[4] = v22;
        v23[5] = v24;
      }
      else
      {
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __84__NSObject_UIAccessibilityTextAttributeRotor___accessibilityTextStylingCustomRotor___block_invoke_2;
        v34[3] = &unk_1E59B9CD0;
        id v36 = v33;
        id v35 = v21;
        double v37 = &v38;
        objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", v19, v20, 2 * (v10 != 1), v34);
      }
    }
    uint64_t v25 = v39[4];
    if (v25 == 0x7FFFFFFF || v25 == 0x7FFFFFFFFFFFFFFFLL)
    {

      _Block_object_dispose(&v38, 8);
      uint64_t v7 = 0;
    }
    else
    {
      AXValueRef v26 = [v8 beginningOfDocument];
      unsigned int v27 = [v8 positionFromPosition:v26 offset:v39[4]];
      uint64_t v28 = [v8 beginningOfDocument];
      uint64_t v29 = [v8 positionFromPosition:v28 offset:v39[5] + v39[4]];
      int v30 = [v8 textRangeFromPosition:v27 toPosition:v29];

      _Block_object_dispose(&v38, 8);
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F426D0]) initWithTargetElement:*(void *)(a1 + 32) targetRange:v30];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

uint64_t __84__NSObject_UIAccessibilityTextAttributeRotor___accessibilityTextStylingCustomRotor___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    *(void *)(v10 + 32) = a3;
    *(void *)(v10 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

void __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_7();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  id v2 = (objc_class *)OUTLINED_FUNCTION_6();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19F2DB000, v4, v5, "Attempted to check for nonexistent method: %@ on class: %@", v6, v7, v8, v9, 2u);
}

void __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(const char *a1)
{
  SEL v1 = NSStringFromSelector(a1);
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19F2DB000, v4, v5, "Attempted to check for nonexistent method: %@ on class: %@", v6, v7, v8, v9, 2u);
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_1(void *a1)
{
  [a1 _accessibilityContentOffset];
  SEL v1 = NSStringFromCGPoint(v8);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v2, v3, "After scrolling parent %{private}@, it had accessibility content offset %{private}@", v4, v5, v6, v7, 3u);
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_19F2DB000, v0, v1, "Scrolled with child: %i.", v2, v3, v4, v5, v6);
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_19F2DB000, v0, v1, "Scrolled parent to visible: %i.", v2, v3, v4, v5, v6);
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_19F2DB000, v0, v1, "Did frame scroll: %i", v2, v3, v4, v5, v6);
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_5()
{
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11(&dword_19F2DB000, v0, v1, "Should frame scroll: %i", v2, v3, v4, v5, v6);
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_6(int a1, Class aClass)
{
  uint64_t v2 = NSStringFromClass(aClass);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v3, v4, "scrollToView: %{private}@. Parent base class: %{private}@", v5, v6, v7, v8, 3u);
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_7()
{
  OUTLINED_FUNCTION_15();
  _os_log_debug_impl(&dword_19F2DB000, v0, OS_LOG_TYPE_DEBUG, "Skipping", v1, 2u);
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_8(void *a1)
{
  [a1 _accessibilityContentOffset];
  uint64_t v1 = NSStringFromCGPoint(v8);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v2, v3, "Checking parent %{private}@ with accessibility content offset %{private}@", v4, v5, v6, v7, 3u);
}

void __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_375_cold_1()
{
  OUTLINED_FUNCTION_7();
  id v1 = (id)objc_opt_class();
  uint64_t v2 = [v0 objectForKeyedSubscript:@"UIAccessibilitySnapshotKeyElement"];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v3, v4, "Setting child snapshot element: %{private}@, %{private}@", v5, v6, v7, v8, v9);
}

void __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_375_cold_2()
{
  id v0 = (id)objc_opt_class();
  OUTLINED_FUNCTION_8(&dword_19F2DB000, v1, v2, "Snapshot element going in:%p %{public}@", v3, v4, v5, v6, 2u);
}

void __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_375_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19F2DB000, a2, OS_LOG_TYPE_ERROR, "This child can't be serialized correctly: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end