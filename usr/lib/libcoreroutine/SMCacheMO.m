@interface SMCacheMO
+ (id)fetchRequest;
+ (id)getLocationMOFromLocation:(id)a3 context:(id)a4;
+ (id)getLocationMOFromLocations:(id)a3 context:(id)a4;
+ (id)managedObjectWithCache:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithCache:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation SMCacheMO

+ (id)managedObjectWithCache:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithCache:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithCache:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    if (v7)
    {
      *(void *)buf = 0;
      v19 = buf;
      uint64_t v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__37;
      v22 = __Block_byref_object_dispose__37;
      id v23 = 0;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __73__SMCacheMO_managedObjectWithCache_managedObject_inManagedObjectContext___block_invoke;
      v13[3] = &unk_1E6B91CA8;
      v17 = buf;
      id v14 = v8;
      id v15 = v9;
      id v16 = v7;
      [v15 performBlockAndWait:v13];
      id v10 = *((id *)v19 + 5);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v10 = v8;
    }
  }
  else
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
    }

    id v10 = 0;
  }

  return v10;
}

void __73__SMCacheMO_managedObjectWithCache_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(SMCacheMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[SMCacheMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  v5 = +[SMDeviceStatusMO fetchRequest];
  v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = [*(id *)(a1 + 48) deviceStatus];
  id v8 = [v7 identifier];
  id v9 = [v6 predicateWithFormat:@"%K == %@", @"identifier", v8];
  [v5 setPredicate:v9];

  id v10 = *(void **)(a1 + 40);
  id v33 = 0;
  v11 = [v10 executeFetchRequest:v5 error:&v33];
  id v12 = v33;
  v13 = [*(id *)(a1 + 48) deviceStatus];
  id v14 = [v11 firstObject];
  id v15 = +[SMDeviceStatusMO managedObjectWithDeviceStatus:v13 managedObject:v14 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDeviceStatus:v15];

  id v16 = [*(id *)(a1 + 48) locationsDuringSession];
  v17 = +[SMCacheMO getLocationMOFromLocations:v16 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationsDuringSession:v17];

  v18 = [*(id *)(a1 + 48) unlockLocation];
  v19 = +[SMCacheMO getLocationMOFromLocation:v18 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setUnlockLocation:v19];

  uint64_t v20 = [*(id *)(a1 + 48) lockLocation];
  v21 = +[SMCacheMO getLocationMOFromLocation:v20 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLockLocation:v21];

  v22 = [*(id *)(a1 + 48) mostRecentLocation];
  id v23 = +[SMCacheMO getLocationMOFromLocation:v22 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMostRecentLocation:v23];

  v24 = [*(id *)(a1 + 48) startingLocation];
  v25 = +[SMCacheMO getLocationMOFromLocation:v24 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStartingLocation:v25];

  v26 = [*(id *)(a1 + 48) offWristLocation];
  v27 = +[SMCacheMO getLocationMOFromLocation:v26 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setOffWristLocation:v27];

  v28 = [*(id *)(a1 + 48) parkedCarLocation];
  v29 = +[SMCacheMO getLocationMOFromLocation:v28 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setParkedCarLocation:v29];

  v30 = [*(id *)(a1 + 48) destinationMapItem];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDestinationMapItem:v30];

  v31 = [*(id *)(a1 + 48) workoutEvents];
  v32 = +[SMWorkoutEventMO getWorkoutEventMOFromWorkoutEvents:v31 context:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWorkoutEvents:v32];
}

+ (id)getLocationMOFromLocations:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:[v5 count]];
  if (v5)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = +[SMCacheMO getLocationMOFromLocation:context:](SMCacheMO, "getLocationMOFromLocation:context:", *(void *)(*((void *)&v15 + 1) + 8 * i), v6, (void)v15);
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }

  return v7;
}

+ (id)getLocationMOFromLocation:(id)a3 context:(id)a4
{
  if (a3)
  {
    id v5 = a4;
    id v6 = a3;
    id v7 = +[SMLocationMO fetchRequest];
    id v8 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v9 = [v6 identifier];
    uint64_t v10 = [v8 predicateWithFormat:@"%K == %@", @"identifier", v9];
    [v7 setPredicate:v10];

    uint64_t v15 = 0;
    uint64_t v11 = [v5 executeFetchRequest:v7 error:&v15];
    id v12 = [v11 firstObject];
    v13 = +[SMLocationMO managedObjectWithLocation:v6 managedObject:v12 inManagedObjectContext:v5];
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMCacheMO"];
}

@end