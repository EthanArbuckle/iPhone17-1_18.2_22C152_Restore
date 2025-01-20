@interface RTWorkoutDistanceMO
+ (id)fetchRequest;
+ (id)managedObjectWithFirstWorkout:(id)a3 secondWorkout:(id)a4 distanceMetric:(int64_t)a5 workoutActivityType:(int64_t)a6 areBothWorkoutsDecimated:(BOOL)a7 distance:(double)a8 isVisited:(BOOL)a9 date:(id)a10 inManagedObjectContext:(id)a11;
+ (id)managedObjectWithWorkoutDistance:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTWorkoutDistanceMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTWorkoutDistanceMO"];
}

+ (id)managedObjectWithWorkoutDistance:(id)a3 inManagedObjectContext:(id)a4
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
    v19 = "Invalid parameter not satisfying: workoutDistance";
    v20 = (uint8_t *)&v23;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = [v5 firstWorkout];
    v9 = [v5 secondWorkout];
    uint64_t v10 = [v5 distanceMetric];
    uint64_t v11 = [v5 workoutActivityType];
    uint64_t v12 = [v5 areBothWorkoutsDecimated];
    [v5 distance];
    double v14 = v13;
    uint64_t v15 = [v5 isVisited];
    v16 = [v5 date];
    v17 = +[RTWorkoutDistanceMO managedObjectWithFirstWorkout:v8 secondWorkout:v9 distanceMetric:v10 workoutActivityType:v11 areBothWorkoutsDecimated:v12 distance:v15 isVisited:v14 date:v16 inManagedObjectContext:v7];

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

+ (id)managedObjectWithFirstWorkout:(id)a3 secondWorkout:(id)a4 distanceMetric:(int64_t)a5 workoutActivityType:(int64_t)a6 areBothWorkoutsDecimated:(BOOL)a7 distance:(double)a8 isVisited:(BOOL)a9 date:(id)a10 inManagedObjectContext:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a10;
  id v20 = a11;
  v21 = v20;
  if (v20)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__151;
    v39 = __Block_byref_object_dispose__151;
    id v40 = 0;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __174__RTWorkoutDistanceMO_managedObjectWithFirstWorkout_secondWorkout_distanceMetric_workoutActivityType_areBothWorkoutsDecimated_distance_isVisited_date_inManagedObjectContext___block_invoke;
    v24[3] = &unk_1E6B9C248;
    v29 = &v35;
    id v25 = v20;
    id v26 = v17;
    id v27 = v18;
    int64_t v30 = a5;
    int64_t v31 = a6;
    BOOL v33 = a7;
    double v32 = a8;
    BOOL v34 = a9;
    id v28 = v19;
    [v25 performBlockAndWait:v24];
    id v22 = (id)v36[5];

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

uint64_t __174__RTWorkoutDistanceMO_managedObjectWithFirstWorkout_secondWorkout_distanceMetric_workoutActivityType_areBothWorkoutsDecimated_distance_isVisited_date_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[RTWorkoutDistanceMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setFirstWorkout:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setSecondWorkout:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDistanceMetric:*(void *)(a1 + 72)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setWorkoutActivityType:*(void *)(a1 + 80)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setAreBothWorkoutsDecimated:*(unsigned __int8 *)(a1 + 96)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setDistance:*(double *)(a1 + 88)];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setIsVisited:*(unsigned __int8 *)(a1 + 97)];
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);

  return [v6 setDate:v5];
}

@end