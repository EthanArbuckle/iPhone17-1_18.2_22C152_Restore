@interface UIModulationFeedbackGenerator
@end

@implementation UIModulationFeedbackGenerator

uint64_t __62___UIModulationFeedbackGenerator_activateWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  v4 = [*(id *)(a1 + 32) playingContinuousFeedback];

  if (v4) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = a2 == 0;
  }
  if (!v5)
  {
    v6 = [*(id *)(a1 + 32) _modulationConfiguration];
    v7 = [v6 feedback];
    v8 = (void *)[v7 copy];

    if (v8)
    {
      v9 = [*(id *)(a1 + 32) _modulationConfiguration];
      v10 = [v9 feedbackUpdateBlock];
      ((void (**)(void, void *, double))v10)[2](v10, v8, *(double *)(*(void *)(a1 + 32) + 168));

      [*(id *)(a1 + 32) setPlayingContinuousFeedback:v8];
      objc_msgSend(*(id *)(a1 + 32), "_playFeedback:atLocation:", v8, 1.79769313e308, 1.79769313e308);
    }
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v12 = *(uint64_t (**)(void))(result + 16);
    return v12();
  }
  return result;
}

@end