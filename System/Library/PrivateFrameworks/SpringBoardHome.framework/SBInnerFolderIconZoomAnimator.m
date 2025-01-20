@interface SBInnerFolderIconZoomAnimator
@end

@implementation SBInnerFolderIconZoomAnimator

void __51___SBInnerFolderIconZoomAnimator__prepareAnimation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 96))
  {
    v7 = objc_msgSend(v5, "iconLayerWithInfo:traitCollection:options:", *(void *)(a1 + 32), 1, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
    v9 = [v8 layer];
    [v9 addSublayer:v7];

    [v8 bounds];
    UIRectGetCenter();
    objc_msgSend(v7, "setPosition:");
  }
  else
  {
    v7 = objc_msgSend(*(id *)(a1 + 40), "gridCellImageOfSize:forIcon:iconImageInfo:compatibleWithTraitCollection:", v5, *(void *)(a1 + 32), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
  }

  if (([v5 isTimedOut] & 1) != 0 || objc_msgSend(v5, "progressState"))
  {
    v10 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A8]];
    id v11 = [MEMORY[0x1E4FB1618] colorWithWhite:0.5 alpha:1.0];
    uint64_t v12 = [v11 CGColor];
    [v10 setValue:v12 forKey:*MEMORY[0x1E4F3A148]];

    v13 = [v8 layer];
    v15[0] = v10;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    [v13 setFilters:v14];
  }
  [v6 prepareToCrossfadeImageWithView:v8 options:2];
}

uint64_t __51___SBInnerFolderIconZoomAnimator__cleanupAnimation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 cleanupAfterCrossfade];
}

uint64_t __85___SBInnerFolderIconZoomAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyIconCrossfadeForZoomFraction:*(double *)(a1 + 40)];
}

uint64_t __85___SBInnerFolderIconZoomAnimator__animateToFraction_afterDelay_withSharedCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyIconTransformForZoomFraction:*(double *)(a1 + 40)];
}

uint64_t __69___SBInnerFolderIconZoomAnimator__applyIconCrossfadeForZoomFraction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setCrossfadeFraction:*(double *)(a1 + 32)];
}

void __69___SBInnerFolderIconZoomAnimator__applyIconTransformForZoomFraction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  float64x2_t v12 = 0uLL;
  double v10 = 0.0;
  double v11 = 0.0;
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 _calculateZoomedOffset:&v12 scale:&v10 forIcon:a2 withView:v6];
  memset(&v9, 0, sizeof(v9));
  double v7 = *(double *)(a1 + 40);
  CGAffineTransformMakeScale(&v9, v7 * (v10 + -1.0) + 1.0, v7 * (v11 + -1.0) + 1.0);
  *(float64x2_t *)&v9.tx = vmulq_n_f64(v12, v7);
  CGAffineTransform v8 = v9;
  [v6 setTransform:&v8];
}

@end