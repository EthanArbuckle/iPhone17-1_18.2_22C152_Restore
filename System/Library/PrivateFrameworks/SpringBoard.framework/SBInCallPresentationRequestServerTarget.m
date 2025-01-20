@interface SBInCallPresentationRequestServerTarget
@end

@implementation SBInCallPresentationRequestServerTarget

void __80___SBInCallPresentationRequestServerTarget_presentWithConfiguration_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 16));
  [WeakRetained presentWithConfiguration:a1[5] completion:a1[6]];
}

@end