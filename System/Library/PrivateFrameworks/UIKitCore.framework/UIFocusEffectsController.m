@interface UIFocusEffectsController
@end

@implementation UIFocusEffectsController

void __51___UIFocusEffectsController_startRollbackAnimation__block_invoke(uint64_t a1, double a2, double a3)
{
  double v3 = *(double *)(a1 + 40) * a3;
  double v4 = *(double *)(a1 + 48) * a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", *(double *)(a1 + 56) * a3, *(double *)(a1 + 64) * a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateCurrentOffset:overrideDisplayOffset:", v6, v3, v4);
}

void __51___UIFocusEffectsController_startRollbackAnimation__block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    double v3 = *(void **)(v2 + 8);
    *(void *)(v2 + 8) = 0;
  }
}

@end