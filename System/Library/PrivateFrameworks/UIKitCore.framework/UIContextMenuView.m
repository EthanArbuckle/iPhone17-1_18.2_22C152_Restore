@interface UIContextMenuView
@end

@implementation UIContextMenuView

void __45___UIContextMenuView_setReversesActionOrder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 409);
  id v3 = [a2 listView];
  [v3 setReversesActionOrder:v2];
}

void __34___UIContextMenuView_visibleMenus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 menu];
  [v2 addObject:v3];
}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke(uint64_t a1)
{
  CAFrameRateRange v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v13.minimum;
  float maximum = v13.maximum;
  float preferred = v13.preferred;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_2;
  v10[3] = &unk_1E52DA9A8;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v6;
  *(float *)&double v7 = minimum;
  *(float *)&double v8 = maximum;
  *(float *)&double v9 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v10, v7, v8, v9);
}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) submenus];
  id v3 = [v2 current];
  v4 = [*(id *)(a1 + 32) departingNode];

  if (v3 != v4)
  {
    id v5 = [*(id *)(a1 + 32) departingNode];
    uint64_t v6 = [v5 listView];
    [v6 removeFromSuperview];

    double v7 = *(void **)(a1 + 32);
    [v7 setDepartingNode:0];
  }
}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setDisplayedMenu:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCollectionViewAlpha:0.0];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v15.minimum;
  float maximum = v15.maximum;
  float preferred = v15.preferred;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_6;
  v10[3] = &unk_1E52DAA20;
  void v10[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v13 = v5;
  uint64_t v14 = v6;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  *(float *)&double v7 = minimum;
  *(float *)&double v8 = maximum;
  *(float *)&double v9 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v10, v7, v8, v9);
}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_6(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  CGRect v6 = CGRectInset(v5, -1.0, -1.0);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 64));
  }
  [*(id *)(a1 + 40) setCollectionViewAlpha:1.0];
  [*(id *)(a1 + 48) setAlpha:0.0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_7;
  v4[3] = &unk_1E52D9F70;
  v4[4] = *(void *)(a1 + 32);
  return +[UIView _performWithoutRetargetingAnimations:v4];
}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) scrollToFirstSignificantAction];
  [*(id *)(a1 + 32) setNeedsLayout];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_8(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 didCompleteInPlaceMenuTransition];
}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_9(uint64_t a1)
{
  CAFrameRateRange v18 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v18.minimum;
  float maximum = v18.maximum;
  float preferred = v18.preferred;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_10;
  v12[3] = &unk_1E52DAA20;
  id v5 = *(id *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 64);
  id v16 = v5;
  uint64_t v17 = v6;
  id v13 = *(id *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v14 = v7;
  uint64_t v15 = v8;
  *(float *)&double v9 = minimum;
  *(float *)&double v10 = maximum;
  *(float *)&double v11 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v12, v9, v10, v11);
}

uint64_t __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_10(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 64));
  }
  [*(id *)(a1 + 32) setEmphasized:1];
  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        CGAffineTransformMakeScale(&v13, 0.97, 0.97);
        double v9 = [v8 listView];
        CGAffineTransform v12 = v13;
        [v9 setTransform:&v12];

        double v10 = [v8 listView];
        [v10 setAlpha:0.0];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 48) setNeedsLayout];
  return [*(id *)(a1 + 48) layoutIfNeeded];
}

void __80___UIContextMenuView__displayMenu_inPlaceOfMenu_updateType_alongsideAnimations___block_invoke_11(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v5), "listView", (void)v7);
        [v6 removeFromSuperview];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

uint64_t __49___UIContextMenuView__handleSelectionForElement___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unHighlightItemAtIndexPath:*(void *)(a1 + 40)];
}

void __46___UIContextMenuView__handleSelectionGesture___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id obj = [a2 listView];
  [*(id *)(a1 + 32) locationInView:obj];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  [obj bounds];
  v11.x = v6;
  v11.y = v8;
  if (CGRectContainsPoint(v12, v11))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
    *a3 = 1;
  }
}

BOOL __46___UIContextMenuView__handleSelectionGesture___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4FB3418], "variantForSelector:", objc_msgSend(a2, "action"));
  BOOL v3 = v2 != 0;

  return v3;
}

BOOL __46___UIContextMenuView__handleSelectionGesture___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4FB3418];
  BOOL v3 = [a2 identifier];
  uint64_t v4 = [v2 variantForActionIdentifier:v3];
  BOOL v5 = v4 != 0;

  return v5;
}

void __52___UIContextMenuView__handleHoverGestureRecognizer___block_invoke(uint64_t a1)
{
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__8;
  v46 = __Block_byref_object_dispose__8;
  id v47 = 0;
  if ([*(id *)(a1 + 32) state] <= 2)
  {
    uint64_t v2 = [*(id *)(a1 + 40) submenus];
    uint64_t v36 = MEMORY[0x1E4F143A8];
    uint64_t v37 = 3221225472;
    v38 = __52___UIContextMenuView__handleHoverGestureRecognizer___block_invoke_2;
    v39 = &unk_1E52DAA70;
    id v40 = *(id *)(a1 + 32);
    v41 = &v42;
    [v2 reverseEnumerateNodes:&v36];
  }
  BOOL v3 = (void *)v43[5];
  if (!v3) {
    goto LABEL_9;
  }
  uint64_t v4 = [v3 next];
  BOOL v5 = [*(id *)(a1 + 40) submenus];
  CGFloat v6 = [v5 current];

  if (v4 == v6)
  {
    long long v10 = *(void **)(a1 + 32);
    CGPoint v11 = [(id)v43[5] listView];
    [v10 locationInView:v11];
    double v13 = v12;
    double v15 = v14;

    long long v16 = [(id)v43[5] listView];
    long long v17 = objc_msgSend(v16, "indexPathForItemAtPoint:", v13, v15);

    CAFrameRateRange v18 = [(id)v43[5] listView];
    uint64_t v19 = [*(id *)(a1 + 40) currentListView];
    v20 = [v19 displayedMenu];
    v21 = [v18 indexPathForElement:v20];

    if ([v17 isEqual:v21])
    {

LABEL_9:
      objc_msgSend(*(id *)(a1 + 40), "_clearHoverAutoExitTimer", v36, v37, v38, v39);
      goto LABEL_17;
    }
    v22 = [*(id *)(a1 + 40) hoverVelocityIntegrator];
    [v22 velocity];
    long double v24 = v23;

    v25 = [*(id *)(a1 + 40) hoverVelocityIntegrator];
    [v25 velocity];
    long double v27 = v26;

    v28 = [(id)v43[5] next];
    int v29 = [v28 leftOfParentWhenCascading];

    BOOL v30 = v24 < 0.0;
    if (!v29) {
      BOOL v30 = v24 > 0.0;
    }
    if (v30 && hypot(v24, v27) > 10.0)
    {

      [*(id *)(a1 + 40) _setHoverAutoExitTimer];
      goto LABEL_17;
    }
  }
  else
  {
    double v7 = (void *)v43[5];
    CGFloat v8 = [*(id *)(a1 + 40) submenus];
    long long v9 = [v8 current];

    if (v7 == v9) {
      goto LABEL_9;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "_clearHoverAutoExitTimer", v36, v37, v38, v39);
  v31 = *(void **)(a1 + 40);
  v32 = [v31 currentListView];
  v33 = [v32 displayedMenu];
  [v31 _handleSelectionForElement:v33];

LABEL_17:
  v34 = (void *)v43[5];
  v35 = objc_msgSend(*(id *)(a1 + 40), "hoveredNode", v36, v37, v38, v39);

  if (v34 != v35)
  {
    [*(id *)(a1 + 40) setHoveredNode:v43[5]];
    [*(id *)(a1 + 40) setNeedsLayout];
    [*(id *)(a1 + 40) layoutIfNeeded];
  }
  _Block_object_dispose(&v42, 8);
}

void __52___UIContextMenuView__handleHoverGestureRecognizer___block_invoke_2(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v4 = [v11 listView];
  [*(id *)(a1 + 32) locationInView:v4];
  uint64_t v7 = *(void *)(a1 + 40);
  if (!*(void *)(*(void *)(v7 + 8) + 40))
  {
    CGFloat v8 = v5;
    CGFloat v9 = v6;
    [v4 bounds];
    v13.x = v8;
    v13.y = v9;
    BOOL v10 = CGRectContainsPoint(v14, v13);
    uint64_t v7 = *(void *)(a1 + 40);
    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(v7 + 8) + 40), a2);
      uint64_t v7 = *(void *)(a1 + 40);
    }
  }
  [v4 setEmphasized:*(void *)(*(void *)(v7 + 8) + 40) == (void)v11];
}

void __40___UIContextMenuView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  double v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v6 listView];
  objc_msgSend(v5, "convertPoint:toView:", v7, *(double *)(a1 + 56), *(double *)(a1 + 64));
  double v9 = v8;
  double v11 = v10;

  double v12 = [v6 listView];

  uint64_t v13 = objc_msgSend(v12, "hitTest:withEvent:", *(void *)(a1 + 40), v9, v11);
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  double v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *a3 = 1;
  }
}

void __83___UIContextMenuView__setAutoNavigationTimerIfNecessaryForElement_isTrackpadHover___block_invoke(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleSelectionForElement:*(void *)(a1 + 32)];

  id v4 = objc_loadWeakRetained(v2);
  double v5 = [v4 currentListView];
  id v6 = [v5 indexPathForElement:*(void *)(a1 + 32)];
  id v7 = objc_loadWeakRetained(v2);
  [v7 setUnselectableIndexPath:v6];

  id v9 = objc_loadWeakRetained(v2);
  double v8 = [v9 feedbackGenerator];
  [*(id *)(a1 + 40) center];
  objc_msgSend(v8, "selectionChangedAtLocation:");
}

void __44___UIContextMenuView__setHoverAutoExitTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained currentListView];
  uint64_t v2 = [v1 displayedMenu];
  [WeakRetained _handleSelectionForElement:v2];
}

id __33___UIContextMenuView_keyCommands__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[UIKeyCommand keyCommandWithInput:a1 modifierFlags:0 action:a2];
  [v2 setWantsPriorityOverSystemBehavior:1];
  return v2;
}

@end