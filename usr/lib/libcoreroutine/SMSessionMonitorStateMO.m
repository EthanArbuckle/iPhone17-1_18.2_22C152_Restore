@interface SMSessionMonitorStateMO
+ (id)fetchRequest;
+ (id)initWithSessionMonitorState:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithSessionIdentifier:(id)a3 currentRegionState:(unint64_t)a4 triggerPending:(BOOL)a5 triggerConfirmed:(BOOL)a6 date:(id)a7 managedObjectContext:(id)a8;
@end

@implementation SMSessionMonitorStateMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"SMSessionMonitorStateMO"];
}

+ (id)initWithSessionMonitorState:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v20 = 0;
    v16 = "Invalid parameter not satisfying: state";
    v17 = (uint8_t *)&v20;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_7;
  }
  if (v7)
  {
    v9 = [v6 sessionIdentifier];
    uint64_t v10 = [v6 currentRegionState];
    uint64_t v11 = [v6 triggerPending];
    uint64_t v12 = [v6 triggerConfirmed];
    v13 = [v6 date];
    v14 = [a1 managedObjectWithSessionIdentifier:v9 currentRegionState:v10 triggerPending:v11 triggerConfirmed:v12 date:v13 managedObjectContext:v8];

    goto LABEL_8;
  }
  v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    __int16 v19 = 0;
    v16 = "Invalid parameter not satisfying: managedObjectContext";
    v17 = (uint8_t *)&v19;
    goto LABEL_12;
  }
LABEL_7:

  v14 = 0;
LABEL_8:

  return v14;
}

+ (id)managedObjectWithSessionIdentifier:(id)a3 currentRegionState:(unint64_t)a4 triggerPending:(BOOL)a5 triggerConfirmed:(BOOL)a6 date:(id)a7 managedObjectContext:(id)a8
{
  id v13 = a3;
  id v14 = a7;
  id v15 = a8;
  v16 = v15;
  if (v15)
  {
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__113;
    v31 = __Block_byref_object_dispose__113;
    id v32 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __139__SMSessionMonitorStateMO_managedObjectWithSessionIdentifier_currentRegionState_triggerPending_triggerConfirmed_date_managedObjectContext___block_invoke;
    v19[3] = &unk_1E6B9A188;
    v23 = &v27;
    id v20 = v15;
    id v21 = v13;
    id v22 = v14;
    unint64_t v24 = a4;
    BOOL v25 = a5;
    BOOL v26 = a6;
    [v20 performBlockAndWait:v19];
    id v17 = (id)v28[5];

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

uint64_t __139__SMSessionMonitorStateMO_managedObjectWithSessionIdentifier_currentRegionState_triggerPending_triggerConfirmed_date_managedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[SMSessionMonitorStateMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setSessionIdentifier:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDate:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCurrentRegionState:*(__int16 *)(a1 + 64)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTriggerPending:*(unsigned __int8 *)(a1 + 72)];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 73);
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);

  return [v6 setTriggerConfirmed:v5];
}

@end