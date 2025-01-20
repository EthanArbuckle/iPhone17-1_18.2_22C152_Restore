@interface UIPanelInternalState
@end

@implementation UIPanelInternalState

void __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke(uint64_t a1, void *a2)
{
  v3 = a2;
  v6 = objc_alloc_init(UISlidingBarState);
  v4 = [*(id *)(a1 + 32) configuration];
  v5 = (void *)[v4 copy];
  [(UISlidingBarState *)v6 setConfiguration:v5];

  -[UISlidingBarState _setCollapsedState:](v6, "_setCollapsedState:", [*(id *)(a1 + 32) collapsedState]);
  v3[2](v3, v6);

  if ([(UISlidingBarState *)v6 leadingOverlapsMain]
    && UIKeyboardAutomaticIsOnScreen())
  {
    [*(id *)(a1 + 32) keyboardAdjustment];
    -[UISlidingBarState set_keyboardAdjustment:](v6, "set_keyboardAdjustment:");
  }
  [*(id *)(a1 + 40) addObject:v6];
}

id __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a2)
  {
    v8 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "doubleValue", (void)v19);
          UIRoundToViewScale(*(void **)(a1 + 32));
          if (v14 > 0.0)
          {
            v15 = objc_msgSend(NSNumber, "numberWithDouble:");
            [v8 addObject:v15];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    if (a4)
    {
      id v16 = [&unk_1ED3EF7A0 arrayByAddingObjectsFromArray:v8];
    }
    else
    {
      id v16 = v8;
    }
    v17 = v16;
  }
  else
  {
    v17 = &unk_1ED3EF788;
  }

  return v17;
}

uint64_t __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_203(uint64_t result, double a2, double a3)
{
  uint64_t v4 = result;
  if (a2 > 0.0)
  {
    v5 = *(void **)(result + 32);
    [*(id *)(result + 40) _currentScreenScale];
    result = objc_msgSend(v5, "leadingBorderWidthForScale:");
  }
  if (a3 > 0.0)
  {
    v6 = *(void **)(v4 + 32);
    [*(id *)(v4 + 40) _currentScreenScale];
    return objc_msgSend(v6, "trailingBorderWidthForScale:");
  }
  return result;
}

double __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_2_205(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v1 = a1;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  double v3 = 0.0;
  if (v2)
  {
    uint64_t v4 = v2;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "doubleValue", (void)v9);
        if (v7 > 0.0)
        {
          double v3 = v7;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

void __84___UIPanelInternalState_computePossibleStatesGivenParentView_withSize_forceOverlay___block_invoke_210(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setLeadingWidth:*(double *)(a1 + 32)];
  [v3 setTrailingWidth:*(double *)(a1 + 40)];
  [v3 setSupplementaryWidth:*(double *)(a1 + 48)];
  [v3 setMainWidth:*(double *)(a1 + 56)];
  if (!*(unsigned char *)(a1 + 88))
  {
    [v3 _setLeadingOverlayWidth:*(double *)(a1 + 32) - *(double *)(a1 + 64)];
    [v3 _setTrailingOverlayWidth:*(double *)(a1 + 40) - *(double *)(a1 + 72)];
    [v3 _setSupplementaryOverlayWidth:*(double *)(a1 + 48) - *(double *)(a1 + 80)];
  }
}

@end