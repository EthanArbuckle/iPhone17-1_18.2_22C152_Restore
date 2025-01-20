@interface SBSATimerAndDescriptionRecord
@end

@implementation SBSATimerAndDescriptionRecord

void __43___SBSATimerAndDescriptionRecord_schedule___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = [SBSAElapsedTimerDescription alloc];
    v3 = [WeakRetained timerDescription];
    id v4 = [(SBSAElapsedTimerDescription *)v2 initElapsedTimerDescriptionWithDescription:v3];
    [WeakRetained setTimerDescription:v4];

    [WeakRetained[1] invalidate];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end