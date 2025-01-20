@interface SBContinuitySessionStateMachineStateLaunching
@end

@implementation SBContinuitySessionStateMachineStateLaunching

void __67___SBContinuitySessionStateMachineStateLaunching_enteredStateFrom___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[32])
  {
    WeakRetained[33] = 0;
    v2 = WeakRetained;
    [WeakRetained _reevaluateStateForReason:@"radar 124642623"];
    WeakRetained = v2;
  }
}

void __76___SBContinuitySessionStateMachineStateLaunching_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76___SBContinuitySessionStateMachineStateLaunching_appendDescriptionToStream___block_invoke_2;
  v6[3] = &unk_1E6AF5290;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v4 appendProem:v3 block:v6];
}

uint64_t __76___SBContinuitySessionStateMachineStateLaunching_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 32) withName:@"isCurrentState"];
  uint64_t result = [*(id *)(a1 + 32) hasSuccinctStyle];
  if ((result & 1) == 0) {
    return (uint64_t)(id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"handlingLaunchEvents"];
  }
  return result;
}

@end