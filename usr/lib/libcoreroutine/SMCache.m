@interface SMCache
@end

@implementation SMCache

void __56__SMCache_RTCoreDataTransformable__createWithSMCacheMO___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4F99818]);
  v34 = [*(id *)(a1 + 32) identifier];
  v3 = (void *)MEMORY[0x1E4F99858];
  v32 = [*(id *)(a1 + 32) deviceStatus];
  v33 = [v3 createWithManagedObject:v32];
  v4 = (void *)MEMORY[0x1E4F99818];
  v31 = [*(id *)(a1 + 32) locationsDuringSession];
  v5 = [v4 _getOrCreateManagedLocationsFromLocations:v31];
  v6 = (void *)MEMORY[0x1E4F998C8];
  v30 = [*(id *)(a1 + 32) unlockLocation];
  v26 = [v6 createWithManagedObject:v30];
  v7 = (void *)MEMORY[0x1E4F998C8];
  v29 = [*(id *)(a1 + 32) lockLocation];
  v24 = [v7 createWithManagedObject:v29];
  v8 = (void *)MEMORY[0x1E4F998C8];
  v28 = [*(id *)(a1 + 32) mostRecentLocation];
  v23 = [v8 createWithManagedObject:v28];
  v9 = (void *)MEMORY[0x1E4F998C8];
  v27 = [*(id *)(a1 + 32) startingLocation];
  v22 = [v9 createWithManagedObject:v27];
  v10 = (void *)MEMORY[0x1E4F998C8];
  v25 = [*(id *)(a1 + 32) offWristLocation];
  v21 = [v10 createWithManagedObject:v25];
  v11 = (void *)MEMORY[0x1E4F998C8];
  v12 = [*(id *)(a1 + 32) parkedCarLocation];
  v13 = [v11 createWithManagedObject:v12];
  v14 = [*(id *)(a1 + 32) destinationMapItem];
  v15 = (void *)MEMORY[0x1E4F999E0];
  v16 = [*(id *)(a1 + 32) workoutEvents];
  v17 = [v15 createWithSMWorkoutEventMOs:v16];
  uint64_t v18 = [v2 initWithIdentifier:v34 deviceStatus:v33 locationsDuringSession:v5 unlockLocation:v26 lockLocation:v24 mostRecentLocation:v23 startingLocation:v22 offWristLocation:v21 parkedCarLocation:v13 destinationMapItem:v14 workoutEvents:v17];
  uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
  v20 = *(void **)(v19 + 40);
  *(void *)(v19 + 40) = v18;
}

@end