@interface RTLearnedLocationOfInterestTransitionMO
+ (id)fetchRequest;
+ (id)managedObjectWithTransition:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithTransition:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
@end

@implementation RTLearnedLocationOfInterestTransitionMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"RTLearnedLocationOfInterestTransitionMO"];

  return v2;
}

+ (id)managedObjectWithTransition:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithTransition:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithTransition:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
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
    v13 = "Invalid parameter not satisfying: transition";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
    goto LABEL_7;
  }
  if (v9)
  {
    *(void *)buf = 0;
    v21 = buf;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__135;
    v24 = __Block_byref_object_dispose__135;
    id v25 = 0;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __108__RTLearnedLocationOfInterestTransitionMO_managedObjectWithTransition_managedObject_inManagedObjectContext___block_invoke;
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

void __108__RTLearnedLocationOfInterestTransitionMO_managedObjectWithTransition_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(RTLearnedLocationOfInterestTransitionMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[RTLearnedLocationOfInterestTransitionMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v3);
  if (!v2) {

  }
  v4 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setIdentifier:v4];

  v5 = [*(id *)(a1 + 48) startDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStartDate:v5];

  v6 = [*(id *)(a1 + 48) stopDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStopDate:v6];

  id v7 = [*(id *)(a1 + 48) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCreationDate:v7];

  id v8 = [*(id *)(a1 + 48) expirationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setExpirationDate:v8];

  id v9 = [*(id *)(a1 + 48) visitIdentifierOrigin];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setVisitIdentifierOrigin:v9];

  v10 = [*(id *)(a1 + 48) visitIdentifierDestination];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setVisitIdentifierDestination:v10];

  [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 48) predominantMotionActivityType]];
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPredominantMotionActivityType:v11];
}

@end