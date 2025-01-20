@interface PU
@end

@implementation PU

void __103__PU_VKCImageSubjectGlowLayer_configureAnimationWithViewScale_screenScale_path_index_count_identifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  v7 = NSNumber;
  double v8 = *(double *)(a1 + 72);
  id v9 = a2;
  id v10 = [v7 numberWithDouble:v8];
  [v3 renderGlowParameters:v9 path:v4 pathLength:v10 duration:*(void *)(a1 + 40) maxStrokeLengthFraction:v5 beginDelay:v6 identifier:*(double *)(a1 + 80)];
}

uint64_t __67__PU_VKCImageSubjectGlowLayer_stopAnimationForIdentifier_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_removeFromSuperlayer];
}

uint64_t __40__PU_VKCImageSubjectGlowLayer_hideGlow___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) makeObjectsPerformSelector:sel_removeFromSuperlayer];
}

@end