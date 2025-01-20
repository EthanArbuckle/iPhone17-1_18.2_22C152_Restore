@interface RTLearnedTransitionMO
+ (id)fetchRequest;
+ (id)managedObjectWithTransition:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithTransition:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation RTLearnedTransitionMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"RTLearnedTransitionMO"];

  return v2;
}

+ (id)managedObjectWithTransition:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithTransition:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithTransition:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (!v8)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: transition";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    goto LABEL_17;
  }
  if (!v10)
  {
    v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v17 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_16;
  }
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v17 = "Invalid parameter not satisfying: [managedObject isKindOfClass:[RTLearnedTransitionMO class]]";
        goto LABEL_16;
      }
LABEL_17:

      goto LABEL_18;
    }
  }
  v12 = [v9 managedObjectContext];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_9:
    *(void *)buf = 0;
    v26 = buf;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__141;
    v29 = __Block_byref_object_dispose__141;
    id v30 = 0;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __90__RTLearnedTransitionMO_managedObjectWithTransition_managedObject_inManagedObjectContext___block_invoke;
    v19[3] = &unk_1E6B919F0;
    v23 = buf;
    SEL v24 = a2;
    id v20 = v8;
    id v21 = v9;
    id v22 = v11;
    [v22 performBlockAndWait:v19];
    id v15 = *((id *)v26 + 5);

    _Block_object_dispose(buf, 8);
    goto LABEL_19;
  }
  v14 = [v9 managedObjectContext];
  if (([v14 allowTombstones] & 1) != 0 || (objc_msgSend(v9, "flags") & 1) == 0)
  {

    goto LABEL_9;
  }

LABEL_18:
  id v15 = 0;
LABEL_19:

  return v15;
}

void __90__RTLearnedTransitionMO_managedObjectWithTransition_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) visitIdentifierOrigin];

  if (v2)
  {
    v3 = +[RTLearnedVisitMO fetchRequest];
    v4 = (void *)MEMORY[0x1E4F28F60];
    v5 = [*(id *)(a1 + 32) visitIdentifierOrigin];
    v6 = [v4 predicateWithFormat:@"%K == %@", @"identifier", v5];
    [v3 setPredicate:v6];

    [v3 setReturnsObjectsAsFaults:1];
    [v3 setFetchLimit:1];
    id v33 = 0;
    v7 = [v3 execute:&v33];
    id v8 = v33;
    v2 = [v7 firstObject];

    if (v8)
    {
      id v9 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412802;
        v35 = v10;
        __int16 v36 = 2112;
        v37 = v3;
        __int16 v38 = 2112;
        v39 = v8;
        _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, encountered error performing fetch, %@, error, %@", buf, 0x20u);
      }
      goto LABEL_14;
    }
    if (!v2)
    {
      v11 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = NSStringFromSelector(*(SEL *)(a1 + 64));
        *(_DWORD *)buf = 138412546;
        v35 = v12;
        __int16 v36 = 2112;
        v37 = v3;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%@, no results returned for fetch of transition origin, %@", buf, 0x16u);
      }
    }
  }
  v3 = [*(id *)(a1 + 32) visitIdentifierDestination];

  if (!v3) {
    goto LABEL_25;
  }
  id v8 = +[RTLearnedVisitMO fetchRequest];
  v13 = (void *)MEMORY[0x1E4F28F60];
  v14 = [*(id *)(a1 + 32) visitIdentifierDestination];
  id v15 = [v13 predicateWithFormat:@"%K == %@", @"identifier", v14];
  [v8 setPredicate:v15];

  [v8 setReturnsObjectsAsFaults:1];
  [v8 setFetchLimit:1];
  id v32 = 0;
  v16 = [v8 execute:&v32];
  id v9 = v32;
  v3 = [v16 firstObject];

  if (v9)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

LABEL_14:
LABEL_26:

      goto LABEL_27;
    }
    v28 = NSStringFromSelector(*(SEL *)(a1 + 64));
    *(_DWORD *)buf = 138412802;
    v35 = v28;
    __int16 v36 = 2112;
    v37 = v8;
    __int16 v38 = 2112;
    v39 = v9;
    v29 = "%@, encountered error performing fetch, %@, error, %@";
    id v30 = v17;
    uint32_t v31 = 32;
LABEL_30:
    _os_log_error_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);

    goto LABEL_13;
  }
  if (!v3)
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = NSStringFromSelector(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 138412546;
      v35 = v27;
      __int16 v36 = 2112;
      v37 = v8;
      _os_log_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_INFO, "%@, no results returned for fetch of transition destination, %@", buf, 0x16u);
    }
    v3 = 0;
    goto LABEL_25;
  }

  if (!v2)
  {
LABEL_25:
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_26;
    }
    id v9 = NSStringFromSelector(*(SEL *)(a1 + 64));
    v17 = [*(id *)(a1 + 32) visitIdentifierOrigin];
    v28 = [*(id *)(a1 + 32) visitIdentifierDestination];
    *(_DWORD *)buf = 138413314;
    v35 = v9;
    __int16 v36 = 2112;
    v37 = v17;
    __int16 v38 = 2112;
    v39 = v2;
    __int16 v40 = 2112;
    v41 = v28;
    __int16 v42 = 2112;
    v43 = v3;
    v29 = "%@, attempting to create a transition with nonexistent endpoints. origin, identifier, %@, visit, %@, destinati"
          "on, identifier, %@, visit, %@";
    id v30 = v8;
    uint32_t v31 = 52;
    goto LABEL_30;
  }
  v18 = *(RTLearnedTransitionMO **)(a1 + 40);
  v19 = v18;
  if (!v18) {
    v19 = [[RTLearnedTransitionMO alloc] initWithContext:*(void *)(a1 + 48)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v19);
  if (!v18) {

  }
  id v20 = [*(id *)(a1 + 32) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v20];

  id v21 = [*(id *)(a1 + 32) startDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStartDate:v21];

  id v22 = [*(id *)(a1 + 32) stopDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStopDate:v22];

  v23 = [*(id *)(a1 + 32) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCreationDate:v23];

  SEL v24 = [*(id *)(a1 + 32) expirationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setExpirationDate:v24];

  v25 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 32) predominantMotionActivityType]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPredominantMotionActivityType:v25];

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setOrigin:v2];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDestination:v3];
LABEL_27:
}

@end