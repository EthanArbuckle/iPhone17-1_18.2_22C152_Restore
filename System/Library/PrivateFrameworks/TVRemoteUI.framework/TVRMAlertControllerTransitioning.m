@interface TVRMAlertControllerTransitioning
@end

@implementation TVRMAlertControllerTransitioning

uint64_t __55___TVRMAlertControllerTransitioning_animateTransition___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v5];
  [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:*(double *)(a1 + 88)];
  return [*(id *)(*(void *)(a1 + 32) + 24) setAlpha:*(double *)(a1 + 88)];
}

uint64_t __55___TVRMAlertControllerTransitioning_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8))
  {
    v4 = [*(id *)(a1 + 40) viewForKey:*MEMORY[0x263F83C08]];
    [v4 removeFromSuperview];
  }
  v5 = *(void **)(a1 + 40);
  return [v5 completeTransition:a2];
}

@end