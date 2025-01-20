@interface RTPeopleDensityMO
+ (id)fetchRequest;
+ (id)managedObjectWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 densityScore:(double)a6 scanDuration:(double)a7 rssiHistogram:(id)a8 inManagedObjectContext:(id)a9;
+ (id)managedObjectWithPeopleDensity:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTPeopleDensityMO

+ (id)managedObjectWithPeopleDensity:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v22 = 0;
    v18 = "Invalid parameter not satisfying: peopleDensity";
    v19 = (uint8_t *)&v22;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, v18, v19, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = [v5 uuid];
    v9 = [v5 startDate];
    v10 = [v5 endDate];
    [v5 densityScore];
    double v12 = v11;
    [v5 scanDuration];
    double v14 = v13;
    v15 = [v5 rssiHistogram];
    v16 = +[RTPeopleDensityMO managedObjectWithIdentifier:v8 startDate:v9 endDate:v10 densityScore:v15 scanDuration:v7 rssiHistogram:v12 inManagedObjectContext:v14];

    goto LABEL_8;
  }
  v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    __int16 v21 = 0;
    v18 = "Invalid parameter not satisfying: managedObjectContext";
    v19 = (uint8_t *)&v21;
    goto LABEL_12;
  }
LABEL_7:

  v16 = 0;
LABEL_8:

  return v16;
}

+ (id)managedObjectWithIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 densityScore:(double)a6 scanDuration:(double)a7 rssiHistogram:(id)a8 inManagedObjectContext:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  v20 = v19;
  if (v19)
  {
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__25;
    v36 = __Block_byref_object_dispose__25;
    id v37 = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __130__RTPeopleDensityMO_managedObjectWithIdentifier_startDate_endDate_densityScore_scanDuration_rssiHistogram_inManagedObjectContext___block_invoke;
    v23[3] = &unk_1E6B91D98;
    v29 = &v32;
    id v24 = v19;
    id v25 = v15;
    id v26 = v16;
    id v27 = v17;
    double v30 = a6;
    double v31 = a7;
    id v28 = v18;
    [v24 performBlockAndWait:v23];
    id v21 = (id)v33[5];

    _Block_object_dispose(&v32, 8);
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

uint64_t __130__RTPeopleDensityMO_managedObjectWithIdentifier_startDate_endDate_densityScore_scanDuration_rssiHistogram_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = [[RTPeopleDensityMO alloc] initWithContext:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 72) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setIdentifier:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setStartDate:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setEndDate:*(void *)(a1 + 56)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDensityScore:*(double *)(a1 + 80)];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setScanDuration:*(double *)(a1 + 88)];
  uint64_t v5 = *(void *)(a1 + 64);
  id v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);

  return [v6 setRssiHistogram:v5];
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTPeopleDensityMO"];
}

@end