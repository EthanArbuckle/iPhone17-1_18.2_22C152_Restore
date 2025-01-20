@interface SMSessionMonitorState
@end

@implementation SMSessionMonitorState

void __84__SMSessionMonitorState_RTCoreDataTransformable__createWithSMSessionMonitorStateMO___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F99970]);
  id v10 = [*(id *)(a1 + 32) sessionIdentifier];
  uint64_t v3 = (int)[*(id *)(a1 + 32) currentRegionState];
  uint64_t v4 = [*(id *)(a1 + 32) triggerPending];
  uint64_t v5 = [*(id *)(a1 + 32) triggerConfirmed];
  v6 = [*(id *)(a1 + 32) date];
  uint64_t v7 = [v2 initWithSessionIdentifier:v10 currentRegionState:v3 triggerPending:v4 triggerConfirmed:v5 date:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

@end