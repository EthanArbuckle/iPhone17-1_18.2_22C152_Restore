@interface UIInteractiveHighlightEnvironment
@end

@implementation UIInteractiveHighlightEnvironment

uint64_t __96___UIInteractiveHighlightEnvironment_applyBackgroundEffectWithMagnitude_interactive_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained presentationValue];
  double v4 = v3;

  [*(id *)(*(void *)(a1 + 32) + 64) setFractionComplete:v4];
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 120);
  if (result)
  {
    v7 = *(uint64_t (**)(__n128))(result + 16);
    v5.n128_f64[0] = v4;
    return v7(v5);
  }
  return result;
}

void __96___UIInteractiveHighlightEnvironment_applyBackgroundEffectWithMagnitude_interactive_completion___block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setValue:v1];
}

uint64_t __96___UIInteractiveHighlightEnvironment_applyBackgroundEffectWithMagnitude_interactive_completion___block_invoke_3(uint64_t a1, uint64_t a2, char a3)
{
  if (!*(unsigned char *)(a1 + 56)
    && (a3 & 1) == 0
    && [*(id *)(*(void *)(a1 + 32) + 104) isEqual:*(void *)(a1 + 40)])
  {
    [*(id *)(a1 + 32) finalizeBackgroundEffect];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    __n128 v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __68___UIInteractiveHighlightEnvironment_setHidden_animated_completion___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:v1];
}

uint64_t __68___UIInteractiveHighlightEnvironment_setHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setHidden:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:1.0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

BOOL __63___UIInteractiveHighlightEnvironment_indexOfViewRecordForView___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v6 = [a2 view];
  v7 = *(void **)(a1 + 32);

  if (v6 == v7) {
    *a4 = 1;
  }
  return v6 == v7;
}

BOOL __63___UIInteractiveHighlightEnvironment_removeViewRecordsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  double v3 = [v2 view];

  if (v3)
  {
    double v4 = [v2 interactiveHighlightEffects];
    BOOL v5 = [v4 count] == 0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

uint64_t __63___UIInteractiveHighlightEnvironment_removeViewRecordsIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finalizeViewRecord:a2];
}

uint64_t __58___UIInteractiveHighlightEnvironment_removeAllViewRecords__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finalizeViewRecord:a2];
}

void __65___UIInteractiveHighlightEnvironment_newBackgroundEffectAnimator__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) backgroundVisualEffectForProgress:1.6];
  [*(id *)(*(void *)(a1 + 32) + 32) setBackgroundEffects:v2];
}

@end