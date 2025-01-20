@interface UIButtonFeedbackGenerator
@end

@implementation UIButtonFeedbackGenerator

void __63___UIButtonFeedbackGenerator_userInteractionStartedAtLocation___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    id v5 = [v3 _buttonConfiguration];
    v4 = [v5 interactionStartedFeedback];
    objc_msgSend(v3, "_playFeedback:atLocation:", v4, *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

@end