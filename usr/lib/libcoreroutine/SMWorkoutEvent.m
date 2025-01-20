@interface SMWorkoutEvent
@end

@implementation SMWorkoutEvent

void __70__SMWorkoutEvent_RTCoreDataTransformable__createWithSMWorkoutEventMO___block_invoke(uint64_t a1)
{
  id v16 = objc_alloc(MEMORY[0x1E4F999E0]);
  id v17 = [*(id *)(a1 + 32) identifier];
  v2 = [*(id *)(a1 + 32) sessionIdentifier];
  v3 = (void *)MEMORY[0x1E4F998C8];
  v4 = [*(id *)(a1 + 32) location];
  v5 = [v3 createWithManagedObject:v4];
  uint64_t v6 = (int)[*(id *)(a1 + 32) activityType];
  uint64_t v7 = (int)[*(id *)(a1 + 32) locationType];
  uint64_t v8 = (int)[*(id *)(a1 + 32) swimmingLocationType];
  uint64_t v9 = (int)[*(id *)(a1 + 32) sessionState];
  char v10 = [*(id *)(a1 + 32) isResumedSessionState];
  v11 = [*(id *)(a1 + 32) date];
  LOBYTE(v15) = v10;
  uint64_t v12 = [v16 initWithIdentifier:v17 sessionIdentifier:v2 location:v5 activityType:v6 locationType:v7 swimmingLocationType:v8 sessionState:v9 isResumedSessionState:v15 date:v11];
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

@end