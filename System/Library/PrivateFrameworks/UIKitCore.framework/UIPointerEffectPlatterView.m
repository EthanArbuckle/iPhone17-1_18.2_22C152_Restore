@interface UIPointerEffectPlatterView
@end

@implementation UIPointerEffectPlatterView

void __46___UIPointerEffectPlatterView_setShadowAlpha___block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(a1 + 32) _newShadowView];
  [*(id *)(a1 + 32) setShadowView:v2];

  v3 = *(void **)(a1 + 32);
  id v5 = [v3 shadowView];
  v4 = [*(id *)(a1 + 32) contentSourceView];
  [v3 insertSubview:v5 aboveSubview:v4];
}

void __43___UIPointerEffectPlatterView_setTintMode___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[54];
  if ((unint64_t)(v3 - 1) >= 2)
  {
    if (!v3)
    {
      v11 = [v2 tintView];
      [v11 removeFromSuperview];

      [*(id *)(a1 + 32) setTintView:0];
      v12 = [*(id *)(a1 + 32) lumaTrackingView];
      [v12 removeFromSuperview];

      v13 = *(void **)(a1 + 32);
      [v13 setLumaTrackingView:0];
    }
  }
  else
  {
    v4 = (void *)[v2 _newTintView];
    [*(id *)(a1 + 32) setTintView:v4];

    [*(id *)(a1 + 32) _layoutTintView];
    id v5 = *(void **)(a1 + 32);
    v6 = [v5 tintView];
    [v5 addSubview:v6];

    v7 = *(void **)(a1 + 32);
    v8 = [v7 tintView];
    v9 = (void *)[v7 _newLumaTrackingViewForTintView:v8];
    [*(id *)(a1 + 32) setLumaTrackingView:v9];

    v10 = *(void **)(a1 + 32);
    id v14 = [v10 lumaTrackingView];
    [v10 addSubview:v14];
  }
}

void __52___UIPointerEffectPlatterView_setSpecularHighlight___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[57];
  v4 = [v2 specularOverlayView];
  id v5 = v4;
  if (v3)
  {

    if (v5)
    {
      v6 = [*(id *)(a1 + 32) specularOverlayView];
      [v6 removeFromSuperview];

      [*(id *)(a1 + 32) setSpecularOverlayView:0];
    }
    v7 = objc_msgSend(*(id *)(a1 + 32), "_specularOverlayView:withOptions:", *(void *)(*(void *)(a1 + 32) + 456), objc_msgSend(*(id *)(a1 + 32), "specularOptions"));
    [*(id *)(a1 + 32) setSpecularOverlayView:v7];

    v8 = *(void **)(a1 + 32);
    id v10 = [v8 specularOverlayView];
    [v8 addSubview:v10];
  }
  else
  {
    [v4 removeFromSuperview];

    v9 = *(void **)(a1 + 32);
    [v9 setSpecularOverlayView:0];
  }
}

@end