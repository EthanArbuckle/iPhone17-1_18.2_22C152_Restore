@interface UIDragFeedbackGenerator
@end

@implementation UIDragFeedbackGenerator

uint64_t __61___UIDragFeedbackGenerator_userInteractionStartedAtLocation___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v3 _dragConfiguration];
    v5 = [v4 interactionStartedFeedback];
    objc_msgSend(v3, "_playFeedback:atLocation:", v5, *(double *)(a1 + 40), *(double *)(a1 + 48));

    [*(id *)(a1 + 32) _startPlayingContinuousFeedback];
  }
  v6 = *(void **)(a1 + 32);
  return [v6 deactivate];
}

@end