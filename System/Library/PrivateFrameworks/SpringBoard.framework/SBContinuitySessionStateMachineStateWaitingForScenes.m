@interface SBContinuitySessionStateMachineStateWaitingForScenes
@end

@implementation SBContinuitySessionStateMachineStateWaitingForScenes

void __83___SBContinuitySessionStateMachineStateWaitingForScenes_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83___SBContinuitySessionStateMachineStateWaitingForScenes_appendDescriptionToStream___block_invoke_2;
  v6[3] = &unk_1E6AF5290;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [v4 appendProem:v3 block:v6];
}

uint64_t __83___SBContinuitySessionStateMachineStateWaitingForScenes_appendDescriptionToStream___block_invoke_2(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 28) withName:@"isCurrentState"];
  uint64_t result = [*(id *)(a1 + 32) hasSuccinctStyle];
  if ((result & 1) == 0)
  {
    id v4 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 27) withName:@"validDisplayUUID"];
    id v5 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 24) withName:@"mainSceneConnected"];
    uint64_t result = SBFEffectiveArtworkSubtype();
    if (result <= 2795)
    {
      if (result != 2556 && result != 2622) {
        return result;
      }
LABEL_8:
      id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 25) withName:@"systemApertureSceneConnected"];
      return (uint64_t)(id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 26) withName:@"systemApertureCurtainSceneConnected"];
    }
    if (result == 2868 || result == 2796) {
      goto LABEL_8;
    }
  }
  return result;
}

@end