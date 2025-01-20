@interface UISlideriOSVisualElement
@end

@implementation UISlideriOSVisualElement

void __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  v1 = (void *)_MergedGlobals_19_8;
  _MergedGlobals_19_8 = (uint64_t)v0;
}

void __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke_2(void *a1)
{
  v2 = (void *)a1[4];
  if (v2)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v2 CGColor];
  }
  else
  {
    id v3 = +[UIColor whiteColor];
    *(void *)(*(void *)(a1[5] + 8) + 24) = [v3 CGColor];
  }
  id v4 = +[UIColor _controlShadowColor];
  *(void *)(*(void *)(a1[6] + 8) + 24) = [v4 CGColor];
}

void __76___UISlideriOSVisualElement__modernThumbImageWithTraitCollection_tintColor___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) userInterfaceIdiom];
  v5 = (CGContext *)[v3 CGContext];
  uint64_t v6 = 0;
  if (v4 == 5)
  {
    double v7 = 0.0;
    CGFloat v8 = 1.0;
  }
  else
  {
    double v7 = 6.0;
    CGFloat v8 = 13.0;
  }
  CGContextSetShadowWithColor(v5, *(CGSize *)&v6, v8, *(CGColorRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  CGContextSetFillColorWithColor((CGContextRef)[v3 CGContext], *(CGColorRef *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  +[_UISlideriOSVisualElement drawingMetricsForPlatform];
  v9 = +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", v11, v12, v13, v14);
  [v9 fill];
  CGContextSetStrokeColorWithColor((CGContextRef)[v3 CGContext], *(CGColorRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
  if ([*(id *)(a1 + 32) userInterfaceIdiom] == 5)
  {
    [v9 stroke];
  }
  else
  {
    v10 = (CGContext *)[v3 CGContext];
    v15.width = 0.0;
    v15.height = 0.5;
    CGContextSetShadowWithColor(v10, v15, 4.0, *(CGColorRef *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
    [v9 fill];
  }
}

uint64_t __40___UISlideriOSVisualElement__initImages__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 528) setMinimumTrackImage:*(void *)(a1 + 40) forState:0];
}

void __54___UISlideriOSVisualElement_drawingMetricsForPlatform__block_invoke()
{
  id v0 = +[UIDevice currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  double v2 = 31.0;
  int32x2_t v3 = vdup_n_s32(v1 == 5);
  if (v1 == 5) {
    double v2 = 20.0;
  }
  v4.i64[0] = v3.u32[0];
  v4.i64[1] = v3.u32[1];
  int8x16_t v5 = (int8x16_t)vcltzq_s64(vshlq_n_s64(v4, 0x3FuLL));
  __asm { FMOV            V3.2D, #2.0 }
  xmmword_1EB25E4A0 = (__int128)vbslq_s8(v5, _Q3, (int8x16_t)xmmword_186B9AF30);
  int8x16_t v11 = vbslq_s8(v5, (int8x16_t)xmmword_186B9AF50, (int8x16_t)xmmword_186B9AF40);
  qword_1EB25E4B0 = v11.i64[0];
  *(int8x16_t *)algn_1EB25E4B8 = v11;
  __asm { FMOV            V3.2D, #24.0 }
  *(long long *)((char *)&xmmword_1EB25E4C0 + 8) = (__int128)vbslq_s8(v5, _Q3, (int8x16_t)xmmword_186B9AF60);
  qword_1EB25E4D8 = *(void *)&v2;
}

void __63___UISlideriOSVisualElement__traitCollectionDidChangeInternal___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    os_variant_has_internal_diagnostics();
    +[UITraitCollection _currentTraitCollectionIfExists]();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    double v2 = [v1 traitCollection];
    +[UITraitCollection setCurrentTraitCollection:v2];

    int32x2_t v3 = (void *)_UISetCurrentFallbackEnvironment(v1);
    int64x2_t v4 = [v1 slider];
    int8x16_t v5 = [v4 minimumTrackTintColor];

    if (v5) {
      [v1 _updateMinimumTrackTintColor];
    }
    uint64_t v6 = [v1 slider];
    double v7 = [v6 maximumTrackTintColor];

    if (v7)
    {
      CGFloat v8 = (void *)v1[64];
      v1[64] = 0;

      [v1 _updateMaxTrackColorForInitialization:0];
    }
    [v1 _rebuildControlThumb:1 track:1];
    _UIRestorePreviousFallbackEnvironment(v3);
    +[UITraitCollection setCurrentTraitCollection:v9];
    [v1 _layoutSubviewsForBoundsChange:0];
  }
}

void __67___UISlideriOSVisualElement__updateMaxTrackColorForInitialization___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) slider];
  [v2 setMaximumTrackImage:0 forStates:0];

  int32x2_t v3 = [*(id *)(a1 + 32) slider];
  [v3 setMaximumTrackImage:0 forStates:7];

  int64x2_t v4 = [*(id *)(a1 + 32) traitCollection];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 536));
  [*(id *)(a1 + 32) bounds];
  objc_msgSend(WeakRetained, "trackRectForBounds:");
  id v9 = +[UIProgressView _tintedImageWithTraitCollection:v4 forHeight:*(void *)(*(void *)(a1 + 32) + 512) andColors:v6];

  LODWORD(v3) = dyld_program_sdk_at_least();
  double v7 = [*(id *)(a1 + 32) slider];
  CGFloat v8 = v7;
  if (v3) {
    [v7 setMaximumTrackImage:v9 forStates:0];
  }
  else {
    [v7 setMaximumTrackImage:v9 forState:0];
  }
}

uint64_t __47___UISlideriOSVisualElement_setValue_animated___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return [*(id *)(a1 + 32) _setValue:0 andSendAction:a2];
}

uint64_t __47___UISlideriOSVisualElement_setValue_animated___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _sliderAnimationDidStop:a2];
}

uint64_t __70___UISlideriOSVisualElement_didChangeMinimumTrackVisibleWithDuration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:0 delay:a2 options:a3 animations:*(double *)(a1 + 32) completion:0.0];
}

uint64_t __70___UISlideriOSVisualElement_didChangeMinimumTrackVisibleWithDuration___block_invoke_2(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 440);
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
  int64x2_t v4 = *(void **)(*(void *)(a1 + 32) + 432);
  if (*(unsigned char *)(a1 + 40)) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  return [v4 setAlpha:v5];
}

@end