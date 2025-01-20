@interface UIFloatingShadowView
@end

@implementation UIFloatingShadowView

uint64_t __39___UIFloatingShadowView_initWithFrame___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setShadowContentsCenter:", 0.5, 0.5, 0.01, 0.01);
  [*(id *)(a1 + 32) setShadowRadius:20.0];
  [*(id *)(a1 + 32) setShadowOpacity:0.2];
  [*(id *)(a1 + 32) setShadowVerticalOffset:25.0];
  [*(id *)(a1 + 32) setShadowExpansion:35.0];
  [*(id *)(a1 + 32) setShadowEnabled:1];
  [*(id *)(a1 + 32) setCornerRadius:6.0];
  v2 = *(void **)(a1 + 32);
  return [v2 _updateShadowLayer];
}

void __48___UIFloatingShadowView__setShadowImageIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) shadowRadius];
  double v3 = v2;
  [*(id *)(a1 + 32) cornerRadius];
  v5 = +[_UIStretchableShadow shadowWithRadius:v3 cornerRadius:v4];
  v6 = *(void **)(a1 + 32);
  id v7 = +[UIImage imageWithCGImage:v5];
  [v6 setShadowImage:v7];
}

void __51___UIFloatingShadowView__shadowPathForSize_radius___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
  v1 = (void *)_MergedGlobals_3_2;
  _MergedGlobals_3_2 = v0;
}

@end