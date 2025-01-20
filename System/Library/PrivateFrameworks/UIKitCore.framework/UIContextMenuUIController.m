@interface UIContextMenuUIController
@end

@implementation UIContextMenuUIController

void __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, char a4, unsigned char *a5)
{
  id v10 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v14 = v10;
    v11 = [v10 collapsedPreview];
    v12 = [*(id *)(a1 + 32) _targetedLiftPreview];
    int v13 = [v11 _isRoughlyEqualToPreview:v12];

    id v10 = v14;
    if (v13)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
      id v10 = v14;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a4;
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
      *a5 = 1;
    }
  }
}

void __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didBeginMorphToDragPreview];
  v3 = [WeakRetained delegate];
  id v4 = objc_loadWeakRetained(v1);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke_3;
  v5[3] = &unk_1E52D9F70;
  v5[4] = WeakRetained;
  [v3 contextMenuUIController:v4 didRequestDismissalWithReason:6 alongsideActions:0 completion:v5];
}

uint64_t __72___UIContextMenuUIController_livePreviewForDragItem_preferringFullSize___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCompleteMorphToDragPreview];
}

void __87___UIContextMenuUIController__primaryPlatterDragPreviewForDragItem_preferringFullSize___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setDeferPreviewUpdates:0];
  v2 = [*(id *)(a1 + 32) previewProvider];

  if (!v2)
  {
    v3 = [*(id *)(a1 + 32) _targetedLiftPreview];
    id v4 = [v3 _duiPreview];
    uint64_t v5 = [v4 preferredStackOrder];

    v6 = [*(id *)(a1 + 32) _targetedLiftPreview];
    v7 = [v6 _duiPreview];
    [v7 liftAnchorPoint];
    uint64_t v9 = v8;
    uint64_t v11 = v10;

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87___UIContextMenuUIController__primaryPlatterDragPreviewForDragItem_preferringFullSize___block_invoke_2;
    v12[3] = &unk_1E530A358;
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = v5;
    uint64_t v15 = v9;
    uint64_t v16 = v11;
    [*(id *)(a1 + 32) setPreviewProvider:v12];
  }
}

id __87___UIContextMenuUIController__primaryPlatterDragPreviewForDragItem_preferringFullSize___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) _duiPreview];
  [v3 setPreferredStackOrder:v2];

  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  v6 = [*(id *)(a1 + 32) _duiPreview];
  objc_msgSend(v6, "setLiftAnchorPoint:", v4, v5);

  v7 = *(void **)(a1 + 32);
  return v7;
}

uint64_t __57___UIContextMenuUIController_dragWillCancelWithAnimator___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  [*(id *)(a1 + 32) setAlpha:1.0];
  [*(id *)(a1 + 32) setCollapsedShadowStyle:0];
  return [*(id *)(a1 + 32) setHideChromeWhenCollapsed:1];
}

uint64_t __57___UIContextMenuUIController_dragWillCancelWithAnimator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpDragViews];
}

void __59___UIContextMenuUIController_gestureRecognizerShouldBegin___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  [v6 locationInView:v7];
  objc_msgSend(v7, "hitTest:withEvent:", 0);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

uint64_t __79___UIContextMenuUIController_shouldMaintainKeyboardAssertionForFirstResponder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isDescendantOfView:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlatterAndActionViewLayoutForce:1 updateAttachment:0];
}

uint64_t __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __76___UIContextMenuUIController__adjustViewForKeyboardVisibility_keyboardInfo___block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __64___UIContextMenuUIController__needsToAvoidKeyboardForResponder___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isDescendantOfView:a2];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __73___UIContextMenuUIController__layoutWithUpdatedAttachment_concealedMenu___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closestScrollTruncationDetentToHeight:");
}

void __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setPreviewSizeDidChange:0];
  [*(id *)(a1 + 32) _updateLayoutAndAttachment:*(unsigned __int8 *)(a1 + 40)];
  id v2 = *(id *)(*(void *)(a1 + 32) + 64);
  long long v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v2)
  {
    [v2 preview];
    double v6 = *((double *)&v51 + 1);
    double v5 = *(double *)&v51;
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    double v6 = 0.0;
    double v5 = 0.0;
    long long v50 = 0u;
    long long v51 = 0u;
  }
  objc_msgSend(v3, "contextMenuUIControllerWillPerformLayout:withPreviewSize:", v4, v5, v6);

  id v7 = [*(id *)(a1 + 32) contentPlatterView];
  id v8 = [*(id *)(a1 + 32) menuView];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  if (v7) {
    [v7 transform3D];
  }
  uint64_t v9 = [v7 layer];
  [v9 zPosition];
  double v11 = v10;

  if (v2) {
    [v2 preview];
  }
  else {
    memset(v41, 0, sizeof(v41));
  }
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_2;
  v38[3] = &unk_1E52DA9F8;
  id v12 = v7;
  uint64_t v13 = *(void *)(a1 + 32);
  id v39 = v12;
  uint64_t v40 = v13;
  _UIContextMenuItemLayoutApply((double *)v41, v12, v38);
  uint64_t v14 = [*(id *)(a1 + 32) menuConfiguration];
  int v15 = [v14 isMultiItemMenu];

  if (v15)
  {
    v37[4] = v46;
    v37[5] = v47;
    v37[6] = v48;
    v37[7] = v49;
    v37[0] = v42;
    v37[1] = v43;
    v37[2] = v44;
    v37[3] = v45;
    [v12 setTransform3D:v37];
    uint64_t v16 = [v12 layer];
    [v16 setZPosition:v11];
  }
  if (v2) {
    [v2 menu];
  }
  else {
    memset(v36, 0, sizeof(v36));
  }
  _UIContextMenuItemLayoutApply((double *)v36, v8, 0);
  v31 = v8;
  [v8 layoutIfNeeded];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v17 = [*(id *)(a1 + 32) menuConfiguration];
  v18 = [v17 accessoryViews];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v58 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        v24 = [v2 accessoryPositions];
        v25 = [v24 objectForKey:v23];
        [v25 CGPointValue];
        objc_msgSend(v23, "setCenter:");
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v58 count:16];
    }
    while (v20);
  }

  if (*(unsigned char *)(a1 + 41))
  {
    v26 = [*(id *)(a1 + 32) platterContainerView];
    v27 = v31;
    [v31 activeSubmenuFrameInCoordinateSpace:v26];
    double MaxY = CGRectGetMaxY(v60);
    [v26 bounds];
    uint64_t v29 = 2 * (MaxY <= CGRectGetMaxY(v61));
  }
  else
  {
    uint64_t v29 = 1;
    v27 = v31;
  }
  v30 = [*(id *)(a1 + 32) platterPanController];
  [v30 moveToDetentPosition:v29 updateScrubPath:1];
}

void __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_2(uint64_t a1, int a2, int a3)
{
  if (a2) {
    [*(id *)(a1 + 32) updateContentSize];
  }
  if (a3)
  {
    id v5 = [*(id *)(a1 + 40) flocker];
    [v5 updateFlockLocation];
  }
}

uint64_t __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_3(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_4(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_5;
  v1[3] = &unk_1E52DA040;
  id v2 = *(id *)(a1 + 32);
  +[UIView _animateByRetargetingAnimations:v1 completion:0];
}

uint64_t __99___UIContextMenuUIController__updatePlatterAndActionViewLayoutForce_updateAttachment_adjustDetent___block_invoke_5(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __62___UIContextMenuUIController_retargetDismissingMenuToPreview___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumeratePlatterViewsWithBlock:&__block_literal_global_555];
}

uint64_t __62___UIContextMenuUIController_retargetDismissingMenuToPreview___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAlpha:0.0];
}

uint64_t __63___UIContextMenuUIController_contextMenuView_didSelectElement___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) contextMenuUIController:*(void *)(a1 + 40) didSelectMenuLeaf:*(void *)(a1 + 48)];
}

void __54___UIContextMenuUIController__displayMenu_updateType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createMenuViewIfNecessaryForMenu:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) menuView];
  [v2 displayMenu:*(void *)(a1 + 40) updateType:0 alongsideAnimations:0];

  long long v3 = [*(id *)(a1 + 32) contentPlatterView];
  uint64_t v4 = [v3 superview];
  CAFrameRateRange v5 = [*(id *)(a1 + 32) menuView];
  [v4 addSubview:v5];

  double v6 = [*(id *)(a1 + 32) menuView];
  id v7 = [*(id *)(a1 + 32) platterPanController];
  [v7 setMenuView:v6];

  id v8 = [*(id *)(a1 + 32) _layoutWithUpdatedAttachment:1 concealedMenu:1];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 menu];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  double v10 = objc_msgSend(*(id *)(a1 + 32), "menuView", v12, v13, v14, v15, v16, v17, v18, v19);
  _UIContextMenuItemLayoutApply((double *)&v12, v10, 0);

  double v11 = [*(id *)(a1 + 32) menuView];
  [v11 layoutIfNeeded];
}

uint64_t __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_3;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlatterAndActionViewLayoutForce:1 updateAttachment:0 adjustDetent:0];
}

uint64_t __54___UIContextMenuUIController__displayMenu_updateType___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlatterAndActionViewLayoutForce:1 updateAttachment:0 adjustDetent:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __59___UIContextMenuUIController__replaceVisibleMenu_withMenu___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (a2 == 5) {
    return [v2 _concealMenu];
  }
  else {
    return [v2 _updatePlatterAndActionViewLayoutForce:1 updateAttachment:0 adjustDetent:0];
  }
}

uint64_t __42___UIContextMenuUIController__concealMenu__block_invoke(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42___UIContextMenuUIController__concealMenu__block_invoke_2;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __42___UIContextMenuUIController__concealMenu__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updatePlatterAndActionViewLayoutForce:1 updateAttachment:0 adjustDetent:0];
}

uint64_t __42___UIContextMenuUIController__concealMenu__block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) platterPanController];
  [v2 setMenuView:0];

  uint64_t v3 = *(void *)(a1 + 32);
  CAFrameRateRange v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = 0;

  CAFrameRateRange v5 = *(void **)(a1 + 40);
  return [v5 removeFromSuperview];
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  uint64_t v3 = *(void **)(a2 + 8);
  if (!v3 || (CAFrameRateRange v4 = *(void **)a2) != 0 && v3[13] == v4[13] && v3[15] == v4[15])
  {
    uint64_t v5 = [v3 userInterfaceStyle];
    if (v5 != [*(id *)a2 userInterfaceStyle])
    {
      id v6 = objc_loadWeakRetained(&to);
      [v6 _updatePlatterContainerViewTraitCollection];
    }
  }
  else
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_2;
    v7[3] = &unk_1E52DC308;
    objc_copyWeak(&v8, &to);
    dispatch_async(MEMORY[0x1E4F14428], v7);
    objc_destroyWeak(&v8);
  }
  objc_destroyWeak(&to);
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_2(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePlatterAndActionViewLayoutForce:1 updateAttachment:1];

  id v4 = objc_loadWeakRetained(v1);
  uint64_t v3 = [v4 menuView];
  [v3 setNeedsLayout];
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_3(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  uint64_t v2 = [v1 delegate];
  id v3 = objc_loadWeakRetained(&to);
  [v2 contextMenuUIController:v3 didRequestDismissalWithReason:0 alongsideActions:0 completion:0];

  objc_destroyWeak(&to);
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_4(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v1 = objc_loadWeakRetained(&to);
  uint64_t v2 = [v1 state];

  if (v2)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_5;
    v3[3] = &unk_1E52DC308;
    objc_copyWeak(&v4, &to);
    dispatch_async(MEMORY[0x1E4F14428], v3);
    objc_destroyWeak(&v4);
  }
  objc_destroyWeak(&to);
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_5(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __50___UIContextMenuUIController_platterContainerView__block_invoke_6;
  v1[3] = &unk_1E52DC308;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  +[UIView performWithoutAnimation:v1];
  objc_destroyWeak(&v2);
}

void __50___UIContextMenuUIController_platterContainerView__block_invoke_6(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 contextMenuUIController:v3 didRequestDismissalWithReason:4 alongsideActions:0 completion:0];
}

@end