@interface SMWorkoutEventMO
+ (id)fetchRequest;
+ (id)getWorkoutEventMOFromWorkoutEvent:(id)a3 context:(id)a4;
+ (id)getWorkoutEventMOFromWorkoutEvents:(id)a3 context:(id)a4;
+ (id)managedObjectWithSMWorkoutEvent:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithSMWorkoutEvent:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation SMWorkoutEventMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMWorkoutEventMO"];
}

+ (id)managedObjectWithSMWorkoutEvent:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithSMWorkoutEvent:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithSMWorkoutEvent:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = v9;
  if (!v7)
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: workoutEvent";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (v9)
  {
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__145;
    v24 = __Block_byref_object_dispose__145;
    id v25 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __89__SMWorkoutEventMO_managedObjectWithSMWorkoutEvent_managedObject_inManagedObjectContext___block_invoke;
    v15[3] = &unk_1E6B91CA8;
    v19 = buf;
    id v16 = v8;
    id v17 = v10;
    id v18 = v7;
    [v17 performBlockAndWait:v15];
    id v11 = *((id *)v21 + 5);

    _Block_object_dispose(buf, 8);
    goto LABEL_8;
  }
  v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v13 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_12;
  }
LABEL_7:

  id v11 = 0;
LABEL_8:

  return v11;
}

void __89__SMWorkoutEventMO_managedObjectWithSMWorkoutEvent_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v2 = *(SMWorkoutEventMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[SMWorkoutEventMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  v5 = [*(id *)(a1 + 48) sessionIdentifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionIdentifier:v5];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setActivityType:(__int16)[*(id *)(a1 + 48) activityType]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocationType:(__int16)[*(id *)(a1 + 48) locationType]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSwimmingLocationType:*(__int16 *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionState:*(__int16 *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIsResumedSessionState:[*(id *)(a1 + 48) isResumedSessionState]];
  v6 = [*(id *)(a1 + 48) date];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDate:v6];

  id v7 = +[SMLocationMO fetchRequest];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = [*(id *)(a1 + 48) location];
  v10 = [v9 identifier];
  id v11 = [v8 predicateWithFormat:@"%K == %@", @"identifier", v10];
  [v7 setPredicate:v11];

  v12 = *(void **)(a1 + 40);
  id v20 = 0;
  v13 = [v12 executeFetchRequest:v7 error:&v20];
  id v14 = v20;
  if (v14)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v19 = [*(id *)(a1 + 48) location];
      *(_DWORD *)buf = 136315650;
      uint64_t v22 = "+[SMWorkoutEventMO managedObjectWithSMWorkoutEvent:managedObject:inManagedObjectContext:]_block_invoke";
      __int16 v23 = 2112;
      v24 = v19;
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "SMWorkoutEventMO,%s,workoutEvent.location,%@,location fetch error,%@", buf, 0x20u);
    }
  }
  id v16 = [*(id *)(a1 + 48) location];
  id v17 = [v13 firstObject];
  id v18 = +[SMLocationMO managedObjectWithLocation:v16 managedObject:v17 inManagedObjectContext:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setLocation:v18];
}

+ (id)getWorkoutEventMOFromWorkoutEvents:(id)a3 context:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc(MEMORY[0x1E4F1CA70]) initWithCapacity:[v5 count]];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
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
        v13 = +[SMWorkoutEventMO getWorkoutEventMOFromWorkoutEvent:context:](SMWorkoutEventMO, "getWorkoutEventMOFromWorkoutEvent:context:", *(void *)(*((void *)&v15 + 1) + 8 * i), v6, (void)v15);
        if (v13) {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

+ (id)getWorkoutEventMOFromWorkoutEvent:(id)a3 context:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[SMWorkoutEventMO fetchRequest];
  id v8 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v9 = [v6 identifier];
  uint64_t v10 = [v8 predicateWithFormat:@"%K == %@", @"identifier", v9];
  [v7 setPredicate:v10];

  uint64_t v15 = 0;
  uint64_t v11 = [v5 executeFetchRequest:v7 error:&v15];
  v12 = [v11 firstObject];
  v13 = +[SMWorkoutEventMO managedObjectWithSMWorkoutEvent:v6 managedObject:v12 inManagedObjectContext:v5];

  return v13;
}

@end