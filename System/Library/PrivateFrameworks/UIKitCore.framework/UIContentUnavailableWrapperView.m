@interface UIContentUnavailableWrapperView
@end

@implementation UIContentUnavailableWrapperView

uint64_t __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v6 = *(void **)(*(void *)(a1 + 32) + 432);
  v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  v8 = [v6 objectForKey:v7];

  v9 = [*(id *)(a1 + 40) _defaultContentScrollViewForEdge:a3];
  if (v8 == v9)
  {
    if (v8) {
      goto LABEL_7;
    }
LABEL_11:
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  v10 = [v8 _temporaryCoordinatingReplacement];
  v11 = *(void **)(a1 + 48);

  if (v10 == v11) {
    [v8 _setTemporaryCoordinatingReplacement:0];
  }
  v12 = *(void **)(*(void *)(a1 + 32) + 432);
  v13 = [NSNumber numberWithUnsignedInteger:a3];
  if (!v9)
  {
    [v12 removeObjectForKey:v13];

    goto LABEL_11;
  }
  [v12 setObject:v9 forKey:v13];

LABEL_7:
  if (*(unsigned char *)(a1 + 56))
  {
    objc_msgSend(a2, "setKeyboardDismissMode:", objc_msgSend(v9, "keyboardDismissMode"));
    objc_msgSend(a2, "setAlwaysBounceVertical:", objc_msgSend(v9, "alwaysBounceVertical"));
  }
  [v9 _setTemporaryCoordinatingReplacement:a2];
  uint64_t v14 = 1;
LABEL_12:

  return v14;
}

void __64___UIContentUnavailableWrapperView_reconfigureContentScrollView__block_invoke_2(void *a1, void *a2)
{
  id v5 = [a1 panGestureRecognizer];
  v3 = [v5 view];

  if (v3 != a2)
  {
    v4 = [v5 view];
    [v4 removeGestureRecognizer:v5];

    [a2 addGestureRecognizer:v5];
  }
}

uint64_t __80___UIContentUnavailableWrapperView__replaceContentViewWithViewForConfiguration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __80___UIContentUnavailableWrapperView__replaceContentViewWithViewForConfiguration___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _replaceContentViewWithViewForConfiguration:*(void *)(a1 + 40)];
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    [v4 removeFromSuperview];
  }
}

void __103___UIContentUnavailableWrapperView__updateBackgroundViewHandlersForPreviousContentView_newContentView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateBackgroundView];
}

uint64_t __57___UIContentUnavailableWrapperView__updateBackgroundView__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  [*(id *)(a1 + 32) setAutoresizingMask:18];
  [*(id *)(a1 + 40) insertSubview:*(void *)(a1 + 32) atIndex:0];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __57___UIContentUnavailableWrapperView__updateBackgroundView__block_invoke_2(id *a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (a3)
  {
    [a1[4] removeFromSuperview];
    id v5 = WeakRetained;
    if (!WeakRetained) {
      goto LABEL_6;
    }
    objc_storeStrong(WeakRetained + 52, a1[5]);
  }
  else
  {
    [a1[5] removeFromSuperview];
  }
  id v5 = WeakRetained;
LABEL_6:
}

@end