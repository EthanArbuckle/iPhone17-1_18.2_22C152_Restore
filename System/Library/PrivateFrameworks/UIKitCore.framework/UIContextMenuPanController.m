@interface UIContextMenuPanController
@end

@implementation UIContextMenuPanController

void __68___UIContextMenuPanController_moveToDetentPosition_updateScrubPath___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  v4 = [*(id *)(a1 + 32) panGestureRecognizer];
  if ([v4 state] <= 0)
  {
  }
  else
  {
    v5 = [*(id *)(a1 + 32) panGestureRecognizer];
    uint64_t v6 = [v5 state];

    if (v6 <= 2)
    {
      v7 = [*(id *)(a1 + 32) panGestureRecognizer];
      v8 = [*(id *)(a1 + 32) containerView];
      [v7 locationInView:v8];

      goto LABEL_6;
    }
  }
  [*(id *)(a1 + 32) originalPlatterCenter];
LABEL_6:
  v9 = *(void **)(a1 + 32);
  id v11 = [v9 panGestureRecognizer];
  v10 = [*(id *)(a1 + 32) containerView];
  [v11 locationInView:v10];
  objc_msgSend(v9, "_updateMenuScrubPathWithLocationIfNecessary:");
}

void __75___UIContextMenuPanController__updateMenuScrubPathWithLocationIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v27 = a2;
  v3 = [*(id *)(a1 + 32) submenus];
  id v4 = [v3 first];

  v5 = v27;
  if (v4 != v27)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    v7 = [v27 listView];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    v16 = [*(id *)(a1 + 40) containerView];
    objc_msgSend(v6, "convertRect:toView:", v16, v9, v11, v13, v15);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    v25 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    v26 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v18, v20, v22, v24);
    [v25 appendPath:v26];

    v5 = v27;
  }
}

uint64_t __95___UIContextMenuPanController__updateViewPositionsWithTranslation_location_ended_withVelocity___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _canSwipeDownToDismiss];
  v3 = *(void **)(a1 + 32);
  if (v2) {
    objc_msgSend(v3, "_animationsForPreviewPlusActionsStyleWithTranslation:location:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
  else {
    objc_msgSend(v3, "_animationsForActionsStyleWithLocation:ended:", *(unsigned __int8 *)(a1 + 88), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
  id v4 = *(void **)(a1 + 32);
  return [v4 _animationsForAnyAttachedAccessoryViews];
}

uint64_t __95___UIContextMenuPanController__updateViewPositionsWithTranslation_location_ended_withVelocity___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048614, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

@end