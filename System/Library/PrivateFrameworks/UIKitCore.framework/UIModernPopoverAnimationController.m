@interface UIModernPopoverAnimationController
@end

@implementation UIModernPopoverAnimationController

uint64_t __57___UIModernPopoverAnimationController_animateTransition___block_invoke_3(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 80))
  {
    memset(&v7, 0, sizeof(v7));
    if ([*(id *)(a1 + 32) isPresenting])
    {
      long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v7.c = v2;
      *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    else
    {
      CGAffineTransformMakeScale(&v7, 0.01, 0.01);
    }
    [*(id *)(a1 + 32) isPresenting];
    double v3 = *(double *)(a1 + 64);
    if ([*(id *)(a1 + 32) isPresenting]) {
      double v4 = *(double *)(a1 + 72);
    }
    else {
      double v4 = 100.0;
    }
    objc_msgSend(*(id *)(a1 + 40), "setBounds:", 0.0, 0.0, v3, v4);
    CGAffineTransform v6 = v7;
    [*(id *)(a1 + 40) setTransform:&v6];
    [*(id *)(a1 + 40) setAnimationOvershootHeight:0.0];
    objc_msgSend(*(id *)(a1 + 40), "setContentSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  }
  objc_msgSend(*(id *)(a1 + 40), "setChromeHidden:", objc_msgSend(*(id *)(a1 + 32), "isPresenting") ^ 1);
  return [*(id *)(a1 + 40) layoutIfNeeded];
}

uint64_t __57___UIModernPopoverAnimationController_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setChromeHidden:1];
}

uint64_t __57___UIModernPopoverAnimationController_animateTransition___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 transitionWasCancelled] ^ 1;
  return [v1 completeTransition:v2];
}

uint64_t __57___UIModernPopoverAnimationController_animateTransition___block_invoke_4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _frameIgnoringLayerTransform];
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "setAnchorPoint:", 0.5, 0.5);
    if ([*(id *)(a1 + 40) isPresenting])
    {
      objc_msgSend(*(id *)(a1 + 32), "_setFrameIgnoringLayerTransform:", v3, v5, v7, v9);
      [*(id *)(a1 + 32) layoutIfNeeded];
    }
  }
  v10 = *(void **)(a1 + 48);
  uint64_t v11 = [v10 transitionWasCancelled] ^ 1;
  return [v10 completeTransition:v11];
}

@end