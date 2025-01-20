@interface TVAnimatedLabel
@end

@implementation TVAnimatedLabel

void __41___TVAnimatedLabel_setAttributedStrings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    BOOL v5 = [*(id *)(a1 + 32) effectiveUserInterfaceLayoutDirection] == 1;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41___TVAnimatedLabel_setAttributedStrings___block_invoke_2;
    v6[3] = &unk_264BA6A38;
    objc_copyWeak(&v7, (id *)(a1 + 40));
    objc_msgSend(v4, "tv_resolveWithTextLayoutDirection:layoutObserver:", v5, v6);
    objc_destroyWeak(&v7);
  }
}

void __41___TVAnimatedLabel_setAttributedStrings___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsDisplay];
}

void __33___TVAnimatedLabel_setAnimating___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 939))
  {
    id v4 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
      __33___TVAnimatedLabel_setAnimating___block_invoke_cold_1(a1, v4);
    }
    [v3 setNeedsDisplay];
  }
}

void __58___TVAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained && WeakRetained[940])
  {
    id v4 = (void *)TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
      __58___TVAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke_cold_1(a1, v4);
    }
    v3[940] = 0;
    [v3 stopAnimating];
  }
}

void __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentMarqueeView];
  id v3 = [v2 layer];
  [v3 contentsRect];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = *(double *)(a1 + 40);
  double v13 = 0.0;
  if (v5 > v12 / *(double *)(a1 + 56) - v5)
  {
    [*(id *)(a1 + 32) replicationPadding];
    double v13 = (v12 + v14) / *(double *)(a1 + 56);
  }
  id v16 = [*(id *)(a1 + 32) currentMarqueeView];
  v15 = [v16 layer];
  objc_msgSend(v15, "setContentsRect:", v13, v7, v9, v11);
}

uint64_t __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAnimating:0];
}

uint64_t __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_34(uint64_t a1)
{
  v2 = (void *)TVMLKitLogObject;
  if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEBUG)) {
    __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_34_cold_1(a1, v2);
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setAnimationDuration:0.2];
  id v3 = *(void **)(*(void *)(a1 + 32) + 944);
  double v4 = *(double *)(a1 + 56) + 20.0;
  [v3 bounds];
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v4);
  double v5 = *(void **)(*(void *)(a1 + 32) + 944);
  double v6 = (*(double *)(a1 + 56) + -20.0) * 0.5;
  [v5 position];
  [v5 setPosition:v6];
  return [MEMORY[0x263F158F8] commit];
}

void __35___TVAnimatedLabel_drawTextInRect___block_invoke()
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  id v3 = +[TVMLUtilities TVMLKitBundle];
  uint64_t v1 = [v0 imageNamed:@"UILabelMarqueeRightFade.png" inBundle:v3];
  v2 = (void *)drawTextInRect____maskImage;
  drawTextInRect____maskImage = v1;
}

uint64_t __49___TVAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

void __49___TVAnimatedLabel__prepareNextMarqueeWithDelay___block_invoke_2(id *a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  if (WeakRetained)
  {
    WeakRetained[936] = 0;
    double v9 = WeakRetained;
    double v5 = WeakRetained;
    objc_sync_enter(v5);
    objc_storeWeak(v5 + 127, a1[4]);
    objc_storeWeak(v5 + 128, a1[5]);
    objc_sync_exit(v5);

    double v6 = [v5 nextMarqueeView];
    [v6 setAlpha:0.0];

    double v7 = [v5 nextMarqueeView];
    [v7 setHidden:1];

    double v8 = [a1[6] currentMarqueeView];
    [v5 bringSubviewToFront:v8];

    id WeakRetained = v9;
    if (a2)
    {
      [a1[6] _startMarqueeIfNeeded];
      id WeakRetained = v9;
    }
  }
}

uint64_t __41___TVAnimatedLabel__startMarqueeIfNeeded__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 938) = 0;
  uint64_t result = [*(id *)(a1 + 32) isAnimating];
  if (result)
  {
    int v3 = [*(id *)(a1 + 32) _shouldCycle];
    double v4 = *(unsigned char **)(a1 + 32);
    if (v3)
    {
      uint64_t v5 = 40;
      if (!v4[937]) {
        uint64_t v5 = 48;
      }
      double v6 = *(double *)(a1 + v5);
      return [v4 _prepareNextMarqueeWithDelay:v6];
    }
    else
    {
      uint64_t result = [v4 isPaused];
      if ((result & 1) == 0)
      {
        double v7 = *(void **)(a1 + 32);
        return [v7 _startMarqueeIfNeeded];
      }
    }
  }
  return result;
}

void __41___TVAnimatedLabel__startMarqueeIfNeeded__block_invoke_2()
{
  v0 = (void *)MEMORY[0x263F1C6B0];
  id v3 = +[TVMLUtilities TVMLKitBundle];
  uint64_t v1 = [v0 imageNamed:@"UILabelMarqueeMask.png" inBundle:v3];
  v2 = (void *)_startMarqueeIfNeeded___maskImage;
  _startMarqueeIfNeeded___maskImage = v1;
}

void __33___TVAnimatedLabel_setAnimating___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [(id)OUTLINED_FUNCTION_1() text];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B4C000, v5, v6, "AL(%@): starting timeout end", v7, v8, v9, v10, v11);
}

void __58___TVAnimatedLabel_stopAnimatingWithoutResetWithDuration___block_invoke_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [(id)OUTLINED_FUNCTION_1() text];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B4C000, v5, v6, "AL(%@): stopping timeout end", v7, v8, v9, v10, v11);
}

void __51___TVAnimatedLabel_stopAndResetScrollWithDuration___block_invoke_34_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [(id)OUTLINED_FUNCTION_1() text];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_230B4C000, v5, v6, "AL(%@): stop-and-reset timeout end", v7, v8, v9, v10, v11);
}

@end