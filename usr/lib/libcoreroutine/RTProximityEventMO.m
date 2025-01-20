@interface RTProximityEventMO
+ (id)fetchRequest;
+ (id)managedObjectWithEventID:(id)a3 startDate:(id)a4 endDate:(id)a5 relationship:(int64_t)a6 socialScore:(double)a7 frequency:(id)a8 recency:(id)a9 significance:(id)a10 inManagedObjectContext:(id)a11;
+ (id)managedObjectWithProximityEvent:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTProximityEventMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTProximityEventMO"];
}

+ (id)managedObjectWithProximityEvent:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v23 = 0;
    v19 = "Invalid parameter not satisfying: proximityEvent";
    v20 = (uint8_t *)&v23;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = [v5 eventID];
    v9 = [v5 startDate];
    v10 = [v5 endDate];
    uint64_t v11 = [v5 relationship];
    [v5 socialScore];
    double v13 = v12;
    v14 = [v5 combinedFrequencyScores];
    v15 = [v5 combinedRecencyScores];
    v16 = [v5 combinedSignificanceScores];
    v17 = +[RTProximityEventMO managedObjectWithEventID:v8 startDate:v9 endDate:v10 relationship:v11 socialScore:v14 frequency:v15 recency:v13 significance:v16 inManagedObjectContext:v7];

    goto LABEL_8;
  }
  v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: managedObjectContext";
    v20 = buf;
    goto LABEL_12;
  }
LABEL_7:

  v17 = 0;
LABEL_8:

  return v17;
}

+ (id)managedObjectWithEventID:(id)a3 startDate:(id)a4 endDate:(id)a5 relationship:(int64_t)a6 socialScore:(double)a7 frequency:(id)a8 recency:(id)a9 significance:(id)a10 inManagedObjectContext:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  v24 = v23;
  if (v23)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__161;
    v42 = __Block_byref_object_dispose__161;
    id v43 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __144__RTProximityEventMO_managedObjectWithEventID_startDate_endDate_relationship_socialScore_frequency_recency_significance_inManagedObjectContext___block_invoke;
    v27[3] = &unk_1E6B9C8F0;
    v35 = &v38;
    id v28 = v23;
    id v29 = v17;
    id v30 = v18;
    id v31 = v19;
    int64_t v36 = a6;
    double v37 = a7;
    id v32 = v20;
    id v33 = v21;
    id v34 = v22;
    [v28 performBlockAndWait:v27];
    id v25 = (id)v39[5];

    _Block_object_dispose(&v38, 8);
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

uint64_t __144__RTProximityEventMO_managedObjectWithEventID_startDate_endDate_relationship_socialScore_frequency_recency_significance_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[RTProximityEventMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 88) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setEventID:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setStartDate:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setEndDate:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setRelationship:*(void *)(a1 + 96)];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setSocialScore:*(double *)(a1 + 104)];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setFrequencyTransformable:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) setRecencyTransformable:*(void *)(a1 + 72)];
  uint64_t v5 = *(void *)(a1 + 80);
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);

  return [v6 setSignificanceTransformable:v5];
}

@end