@interface RTLearnedPlaceTypeInferenceMO
+ (id)fetchRequest;
+ (id)initWithLearnedPlaceTypeInference:(id)a3 managedObjectContext:(id)a4;
+ (id)managedObjectWithIdentifier:(id)a3 sessionId:(id)a4 learnedPlaceIdentifier:(id)a5 placeType:(unint64_t)a6 metricSource:(unint64_t)a7 creationDate:(id)a8 managedObjectContext:(id)a9;
@end

@implementation RTLearnedPlaceTypeInferenceMO

+ (id)initWithLearnedPlaceTypeInference:(id)a3 managedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v20 = 0;
    v16 = "Invalid parameter not satisfying: learnedPlaceTypeInference";
    v17 = (uint8_t *)&v20;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, v17, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = [v5 identifier];
    v9 = [v5 sessionId];
    v10 = [v5 learnedPlaceIdentifier];
    uint64_t v11 = [v5 placeType];
    uint64_t v12 = [v5 metricSource];
    v13 = [v5 creationDate];
    v14 = +[RTLearnedPlaceTypeInferenceMO managedObjectWithIdentifier:v8 sessionId:v9 learnedPlaceIdentifier:v10 placeType:v11 metricSource:v12 creationDate:v13 managedObjectContext:v7];

    goto LABEL_8;
  }
  v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: managedObjectContext";
    v17 = buf;
    goto LABEL_12;
  }
LABEL_7:

  v14 = 0;
LABEL_8:

  return v14;
}

+ (id)managedObjectWithIdentifier:(id)a3 sessionId:(id)a4 learnedPlaceIdentifier:(id)a5 placeType:(unint64_t)a6 metricSource:(unint64_t)a7 creationDate:(id)a8 managedObjectContext:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  id v18 = a9;
  v19 = v18;
  if (v18)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__15;
    v35 = __Block_byref_object_dispose__15;
    id v36 = 0;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __151__RTLearnedPlaceTypeInferenceMO_managedObjectWithIdentifier_sessionId_learnedPlaceIdentifier_placeType_metricSource_creationDate_managedObjectContext___block_invoke;
    v22[3] = &unk_1E6B91D98;
    v28 = &v31;
    id v23 = v18;
    id v24 = v14;
    id v25 = v15;
    id v26 = v16;
    unint64_t v29 = a6;
    unint64_t v30 = a7;
    id v27 = v17;
    [v23 performBlockAndWait:v22];
    id v20 = (id)v32[5];

    _Block_object_dispose(&v31, 8);
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

uint64_t __151__RTLearnedPlaceTypeInferenceMO_managedObjectWithIdentifier_sessionId_learnedPlaceIdentifier_placeType_metricSource_creationDate_managedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[RTLearnedPlaceTypeInferenceMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setIdentifier:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSessionId:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLearnedPlaceIdentifier:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPlaceType:*(__int16 *)(a1 + 80)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setMetricSource:*(__int16 *)(a1 + 88)];
  uint64_t v5 = *(void *)(a1 + 64);
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);

  return [v6 setCreationDate:v5];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTLearnedPlaceTypeInferenceMO"];
}

@end