@interface UIView
@end

@implementation UIView

uint64_t __75__UIView_SafariServicesExtras__safari_performWithoutRetargetingAnimations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 40) _performWithoutRetargetingAnimations:*(void *)(a1 + 32)];
}

void __61__UIView_SafariServicesExtras___sf_setOrderedSubviews_count___block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  v5 = *(void **)(a1[7] + 8 * a2);
  v6 = (void *)a1[4];
  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  v7 = objc_msgSend(v6, "objectAtIndexedSubscript:");

  if (v5 != v7)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a3 = 1;
  }
}

uint64_t __156__UIView_SafariGraphicsUtilities__sf_animate_usingDefaultDampedSpringWithDelay_initialSpringVelocity_options_preferredFrameRateRange_animations_completion___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  LODWORD(a4) = *(_DWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 40), "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1638400, *(void *)(a1 + 32), a2, a3, a4);
}

void __81__UIView_SafariServicesExtras___sf_viewAncestrySummaryWithMinDepth_paddingLevel___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = a2;
  if (*(void *)(a1 + 48) + a3)
  {
    unint64_t v5 = 0;
    do
    {
      [*(id *)(a1 + 32) appendString:@"\t"];
      ++v5;
    }
    while (v5 < *(void *)(a1 + 48) + a3);
  }
  [*(id *)(a1 + 32) appendString:v6];
  if ([*(id *)(a1 + 40) count] - 1 > a3) {
    [*(id *)(a1 + 32) appendString:@"\n"];
  }
}

void __157__UIView_SafariServicesExtras___sf_animateLinkImage_withAnimation_fromRect_inView_toRect_inView_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v12 = a2;
  uint64_t v5 = [v12 valueForKey:@"afterImageDisappearsKey"];
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
  uint64_t v7 = [v12 valueForKey:@"afterDestinationLayerBounces"];
  v8 = (void *)v7;
  if (v7) {
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
  v9 = [v12 valueForKey:@"layer"];
  [v9 removeFromSuperlayer];

  if (a3)
  {
    v10 = [v12 valueForKey:@"isDestinationLayerAnimation"];
    int v11 = [v10 BOOLValue];

    if (v11) {
      objc_msgSend(*(id *)(a1 + 48), "_sf_cancelLinkAnimationsOnSourceWindow:destinationWindow:", *(void *)(a1 + 32), *(void *)(a1 + 40));
    }
  }
}

uint64_t __122__UIView_SafariGraphicsUtilities__sf_animate_usingDefaultTimingWithOptions_preferredFrameRateRange_animations_completion___block_invoke(uint64_t a1, double a2, double a3, double a4)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 48);
  LODWORD(a3) = *(_DWORD *)(a1 + 52);
  LODWORD(a4) = *(_DWORD *)(a1 + 56);
  return objc_msgSend(*(id *)(a1 + 40), "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1638400, *(void *)(a1 + 32), a2, a3, a4);
}

@end