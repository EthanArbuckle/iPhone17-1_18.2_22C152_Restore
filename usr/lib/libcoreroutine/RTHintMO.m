@interface RTHintMO
+ (id)fetchRequest;
+ (id)managedObjectWithHint:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 source:(int64_t)a6 date:(id)a7 inManagedObjectContext:(id)a8;
@end

@implementation RTHintMO

uint64_t __105__RTHintMO_managedObjectWithLatitude_longitude_horizontalUncertainty_source_date_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[RTHintMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setLatitude:*(double *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setLongitude:*(double *)(a1 + 64)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setHorizontalUncertainty:*(double *)(a1 + 72)];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setSource:*(void *)(a1 + 80)];
  uint64_t v5 = *(void *)(a1 + 40);
  v6 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

  return [v6 setDate:v5];
}

+ (id)managedObjectWithHint:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v25 = 0;
    v21 = "Invalid parameter not satisfying: hint";
    v22 = (uint8_t *)&v25;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v21, v22, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = [v5 location];
    [v8 latitude];
    double v10 = v9;
    v11 = [v5 location];
    [v11 longitude];
    double v13 = v12;
    v14 = [v5 location];
    [v14 horizontalUncertainty];
    double v16 = v15;
    uint64_t v17 = [v5 source];
    v18 = [v5 date];
    v19 = +[RTHintMO managedObjectWithLatitude:v17 longitude:v18 horizontalUncertainty:v7 source:v10 date:v13 inManagedObjectContext:v16];

    goto LABEL_8;
  }
  v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = 0;
    v21 = "Invalid parameter not satisfying: managedObjectContext";
    v22 = (uint8_t *)&v24;
    goto LABEL_12;
  }
LABEL_7:

  v19 = 0;
LABEL_8:

  return v19;
}

+ (id)managedObjectWithLatitude:(double)a3 longitude:(double)a4 horizontalUncertainty:(double)a5 source:(int64_t)a6 date:(id)a7 inManagedObjectContext:(id)a8
{
  id v13 = a7;
  id v14 = a8;
  double v15 = v14;
  if (v14)
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__87;
    v30 = __Block_byref_object_dispose__87;
    id v31 = 0;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __105__RTHintMO_managedObjectWithLatitude_longitude_horizontalUncertainty_source_date_inManagedObjectContext___block_invoke;
    v18[3] = &unk_1E6B98668;
    v21 = &v26;
    id v19 = v14;
    double v22 = a3;
    double v23 = a4;
    double v24 = a5;
    int64_t v25 = a6;
    id v20 = v13;
    [v19 performBlockAndWait:v18];
    id v16 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTHintMO"];
}

@end