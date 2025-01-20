@interface UIClickHighlightInteractionEffect
@end

@implementation UIClickHighlightInteractionEffect

void __71___UIClickHighlightInteractionEffect_interaction_didChangeWithContext___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 16);
  v2 = [*(id *)(a1 + 32) targetedPreview];
  v3 = [v2 parameters];
  uint64_t v4 = [v3 _previewMode];

  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    double v5 = 1.0;
    double v6 = 1.0;
    if (v4 == 1) {
      double v6 = fmax(fmin(*(double *)(a1 + 56) / 0.1, 1.0), 0.0);
    }
    [*(id *)(a1 + 40) setBackgroundAlpha:v6];
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v7 == 2)
    {
      v15 = [*(id *)(a1 + 40) anchorView];
      v16 = [v15 layer];
      [v16 setZPosition:100.0];

      [*(id *)(a1 + 48) maximumProgress];
      double v18 = (*(double *)(a1 + 56) + -1.0) / (v17 + -1.0);
      [*(id *)(a1 + 40) bounds];
      double Width = CGRectGetWidth(v35);
      [*(id *)(a1 + 40) bounds];
      double Height = CGRectGetHeight(v36);
      if (Width >= Height) {
        double Height = Width;
      }
      double v21 = _UIPlatterLiftScaleForEdgeDimensions(Height);
      double v5 = fmax(fmin(1.0 - v18 + v18 * v21, v21), 1.0);
      [*(id *)(a1 + 40) setShadowAlpha:v18 + (1.0 - v18) * 0.0];
    }
    else if (v7 == 1)
    {
      [*(id *)(a1 + 40) bounds];
      CGFloat x = v33.origin.x;
      CGFloat y = v33.origin.y;
      CGFloat v10 = v33.size.width;
      CGFloat v11 = v33.size.height;
      double v12 = CGRectGetWidth(v33);
      v34.origin.CGFloat x = x;
      v34.origin.CGFloat y = y;
      v34.size.width = v10;
      v34.size.height = v11;
      double v13 = CGRectGetHeight(v34);
      if (v12 >= v13) {
        double v13 = v12;
      }
      double v14 = fmin((v13 + -14.36) / v13, 0.96);
      if (v14 < 0.87) {
        double v14 = 0.87;
      }
      double v5 = 1.0 - *(double *)(a1 + 56) + *(double *)(a1 + 56) * v14;
    }
    if (_AXSReduceMotionEnabled()) {
      double v5 = 1.0;
    }
    v22 = [*(id *)(a1 + 40) anchorView];
    [v22 setProgress:1.0];
  }
  else
  {
    [*(id *)(a1 + 40) setShadowAlpha:0.0];
    double v5 = 1.0;
    if (v4 == 1) {
      [*(id *)(a1 + 40) setBackgroundAlpha:0.0];
    }
  }
  v23 = [*(id *)(a1 + 32) continuationPreview];
  int v24 = [v23 _isVisible];

  if (v24) {
    [*(id *)(a1 + 32) continuationPreview];
  }
  else {
  v25 = [*(id *)(a1 + 32) targetedPreview];
  }
  v26 = [v25 target];
  v27 = v26;
  if (v26) {
    [v26 transform];
  }
  else {
    memset(&v31, 0, sizeof(v31));
  }
  CGAffineTransform v32 = v31;

  CGAffineTransform v31 = v32;
  CGAffineTransformScale(&v30, &v31, v5, v5);
  v28 = [*(id *)(a1 + 40) anchorView];
  CGAffineTransform v29 = v30;
  [v28 setTransform:&v29];
}

uint64_t __71___UIClickHighlightInteractionEffect_interaction_didChangeWithContext___block_invoke_2(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 16);
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
  if (has_internal_diagnostics)
  {
    if (v3 < 0)
    {
      double v5 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "Over-decremented highlight effect animation count!", buf, 2u);
      }
    }
  }
  else if (v3 < 0)
  {
    double v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &kClickHighlightMatchMoveAnimationKey_block_invoke___s_category)+ 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Over-decremented highlight effect animation count!", v7, 2u);
    }
  }
  uint64_t result = *(void *)(a1 + 32);
  if (!*(void *)(result + 16) && !*(unsigned char *)(result + 24)) {
    return [(id)result _completeHighlightEffect];
  }
  return result;
}

uint64_t __71___UIClickHighlightInteractionEffect_interaction_didChangeWithContext___block_invoke_46(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

@end