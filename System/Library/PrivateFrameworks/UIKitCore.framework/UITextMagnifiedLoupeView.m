@interface UITextMagnifiedLoupeView
@end

@implementation UITextMagnifiedLoupeView

void __46___UITextMagnifiedLoupeView_setModelPosition___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_UIViewDebugSignposts_block_invoke___s_category_8)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Expected _transitionGroupCompletion to be nil. This could cause adverse behavior when closing the magnifier loupe.", v1, 2u);
  }
}

void __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[418] = 1;
    v2 = WeakRetained;
    [WeakRetained layoutSubviews];
    WeakRetained = v2;
  }
}

void __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[419] = 1;
    v2 = WeakRetained;
    [WeakRetained layoutSubviews];
    WeakRetained = v2;
  }
}

uint64_t __55___UITextMagnifiedLoupeView__updateOpenLoupeAnimation___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 416) = 1;
    [*(id *)(a1 + 40) increment];
    [WeakRetained _resetAnimationState];
    [WeakRetained layoutSubviews];
    [WeakRetained modelPosition];
    objc_msgSend(WeakRetained, "_updatePortalViewTransformForPosition:zoomScale:");
  }
}

uint64_t __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke_2(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048635, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __56___UITextMagnifiedLoupeView__updateCloseLoupeAnimation___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) complete];
}

void __56___UITextMagnifiedLoupeView__configuredGroupCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    WeakRetained[416] = 0;
  }
  id v6 = WeakRetained;
  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  [v3 setHidden:1];
  [v4 setHiddenForLoupeAnimation:0];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
  }
}

@end