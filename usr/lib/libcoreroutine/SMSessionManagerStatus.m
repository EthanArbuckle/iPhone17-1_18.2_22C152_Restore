@interface SMSessionManagerStatus
@end

@implementation SMSessionManagerStatus

void __84__SMSessionManagerStatus_RTCoreDataTransformable__createWithSessionManagerStatusMO___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F99950];
  v3 = [*(id *)(a1 + 32) state];
  id v11 = [v2 createWithManagedObject:v3];

  id v4 = objc_alloc(MEMORY[0x1E4F99958]);
  v5 = [*(id *)(a1 + 32) identifier];
  v6 = [*(id *)(a1 + 32) stateQueryDate];
  v7 = [*(id *)(a1 + 32) lastSessionIDDuringMagnetBreak];
  uint64_t v8 = [v4 initWithIdentifier:v5 stateQueryDate:v6 lastSessionIDDuringMagnetBreak:v7 state:v11];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

@end