@interface RTSettledStateTransitionMO
+ (id)fetchRequest;
+ (id)managedObjectWithSettledStateTransition:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTSettledStateTransitionMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTSettledStateTransitionMO"];
}

+ (id)managedObjectWithSettledStateTransition:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: settledStateTransition";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    *(void *)buf = 0;
    v17 = buf;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__155;
    v20 = __Block_byref_object_dispose__155;
    id v21 = 0;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __93__RTSettledStateTransitionMO_managedObjectWithSettledStateTransition_inManagedObjectContext___block_invoke;
    v12[3] = &unk_1E6B970D0;
    v15 = buf;
    id v13 = v6;
    id v14 = v5;
    [v13 performBlockAndWait:v12];
    id v8 = *((id *)v17 + 5);

    _Block_object_dispose(buf, 8);
    goto LABEL_8;
  }
  v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v10 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_12;
  }
LABEL_7:

  id v8 = 0;
LABEL_8:

  return v8;
}

void __93__RTSettledStateTransitionMO_managedObjectWithSettledStateTransition_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[RTSettledStateTransitionMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = [*(id *)(a1 + 40) date];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDate:v5];

  id v6 = [NSNumber numberWithInteger:[*(id *)(a1 + 40) transitionFromType]];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTransitionFromType:v6];

  [NSNumber numberWithInteger:[*(id *)(a1 + 40) transitionToType]];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setTransitionToType:v7];
}

@end