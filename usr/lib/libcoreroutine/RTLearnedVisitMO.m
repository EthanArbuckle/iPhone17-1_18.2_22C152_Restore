@interface RTLearnedVisitMO
+ (id)fetchRequest;
+ (id)managedObjectWithVisit:(id)a3 finerGranularityInferredMapItem:(id)a4 place:(id)a5 inManagedObjectContext:(id)a6;
+ (id)managedObjectWithVisit:(id)a3 finerGranularityInferredMapItem:(id)a4 place:(id)a5 managedObject:(id)a6 inManagedObjectContext:(id)a7;
+ (id)managedObjectWithVisit:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithVisit:(id)a3 place:(id)a4 inManagedObjectContext:(id)a5;
- (BOOL)intersectsWithVisit:(id)a3 distanceCalculator:(id)a4;
- (BOOL)overlapsWithVisit:(id)a3;
- (NSDateInterval)interval;
- (NSNumber)locationHorizontalUncertainty;
- (RTMapItemMO)cachedFinerGranularityMapItem;
- (id)finerGranularityInferredMapItem;
- (id)finerGranularityMapItem;
- (void)setCachedFinerGranularityMapItem:(id)a3;
- (void)setFinerGranularityMapItem:(id)a3;
- (void)setLocationHorizontalUncertainty:(id)a3;
@end

@implementation RTLearnedVisitMO

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"RTLearnedVisitMO"];

  return v2;
}

- (NSNumber)locationHorizontalUncertainty
{
  [(RTLearnedVisitMO *)self willAccessValueForKey:@"locationUncertainty"];
  v3 = [(RTLearnedVisitMO *)self primitiveValueForKey:@"locationUncertainty"];
  [(RTLearnedVisitMO *)self didAccessValueForKey:@"locationUncertainty"];

  return (NSNumber *)v3;
}

- (void)setLocationHorizontalUncertainty:(id)a3
{
  id v6 = a3;
  v4 = [(RTLearnedVisitMO *)self locationUncertainty];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(RTCloudManagedObject *)self willChangeValueForKey:@"locationUncertainty"];
    [(RTLearnedVisitMO *)self setPrimitiveValue:v6 forKey:@"locationUncertainty"];
    [(RTLearnedVisitMO *)self didChangeValueForKey:@"locationUncertainty"];
  }
}

- (id)finerGranularityMapItem
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(RTLearnedVisitMO *)self willAccessValueForKey:@"finerGranularityMapItem"];
  v4 = [(RTLearnedVisitMO *)self finerGranularityMapItemIdentifier];

  if (v4)
  {
    char v5 = [(RTLearnedVisitMO *)self cachedFinerGranularityMapItem];

    if (!v5)
    {
      id v6 = [(RTLearnedVisitMO *)self finerGranularityMapItemIdentifier];
      id v14 = 0;
      v7 = +[RTMapItemMO mapItemForIdentifier:v6 error:&v14];
      id v8 = v14;
      [(RTLearnedVisitMO *)self setCachedFinerGranularityMapItem:v7];

      if (v8)
      {
        v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v12 = NSStringFromSelector(a2);
          v13 = [(RTLearnedVisitMO *)self finerGranularityMapItemIdentifier];
          *(_DWORD *)buf = 138412802;
          v16 = v12;
          __int16 v17 = 2112;
          id v18 = v8;
          __int16 v19 = 2112;
          v20 = v13;
          _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property finerGranularityMapItemIdentifier, %@, map item identifier, %@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    [(RTLearnedVisitMO *)self setCachedFinerGranularityMapItem:0];
  }
  [(RTLearnedVisitMO *)self didAccessValueForKey:@"finerGranularityMapItem"];
  v10 = [(RTLearnedVisitMO *)self cachedFinerGranularityMapItem];

  return v10;
}

- (void)setFinerGranularityMapItem:(id)a3
{
  id v4 = a3;
  [(RTCloudManagedObject *)self willChangeValueForKey:@"finerGranularityMapItem"];
  char v5 = [v4 identifier];
  [(RTLearnedVisitMO *)self setFinerGranularityMapItemIdentifier:v5];

  [(RTLearnedVisitMO *)self setCachedFinerGranularityMapItem:v4];

  [(RTLearnedVisitMO *)self didChangeValueForKey:@"finerGranularityMapItem"];
}

- (BOOL)intersectsWithVisit:(id)a3 distanceCalculator:(id)a4
{
  id v6 = (RTLearnedVisitMO *)a3;
  id v7 = a4;
  if (v6 == self)
  {
    BOOL v47 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      id v54 = objc_alloc(MEMORY[0x1E4F5CE00]);
      v52 = [(RTLearnedVisitMO *)self locationLatitude];
      [v52 doubleValue];
      double v10 = v9;
      v50 = [(RTLearnedVisitMO *)self locationLongitude];
      [v50 doubleValue];
      double v12 = v11;
      v13 = [(RTLearnedVisitMO *)self locationHorizontalUncertainty];
      [v13 doubleValue];
      double v15 = v14;
      v16 = [(RTLearnedVisitMO *)self locationAltitude];
      [v16 doubleValue];
      double v18 = v17;
      __int16 v19 = [(RTLearnedVisitMO *)self locationVerticalUncertainty];
      [v19 doubleValue];
      double v21 = v20;
      v22 = [(RTLearnedVisitMO *)self entryDate];
      [(RTLearnedVisitMO *)self locationReferenceFrame];
      v23 = v56 = v7;
      [v23 doubleValue];
      uint64_t v25 = v24;
      v26 = [(RTLearnedVisitMO *)self locationSourceAccuracy];
      v55 = [v54 initWithLatitude:v22 longitude:v25 horizontalUncertainty:(int)objc_msgSend(v26, "intValue") altitude:v10 verticalUncertainty:v12 date:v15 referenceFrame:v18 speed:v21 sourceAccuracy:0.0];

      id v49 = objc_alloc(MEMORY[0x1E4F5CE00]);
      v53 = [(RTLearnedVisitMO *)v8 locationLatitude];
      [v53 doubleValue];
      double v28 = v27;
      v51 = [(RTLearnedVisitMO *)v8 locationLongitude];
      [v51 doubleValue];
      double v30 = v29;
      v31 = [(RTLearnedVisitMO *)v8 locationHorizontalUncertainty];
      [v31 doubleValue];
      double v33 = v32;
      v34 = [(RTLearnedVisitMO *)v8 locationAltitude];
      [v34 doubleValue];
      double v36 = v35;
      v37 = [(RTLearnedVisitMO *)v8 locationVerticalUncertainty];
      [v37 doubleValue];
      double v39 = v38;
      v40 = [(RTLearnedVisitMO *)v8 entryDate];
      v41 = [(RTLearnedVisitMO *)v8 locationReferenceFrame];
      [v41 doubleValue];
      uint64_t v43 = v42;
      v44 = [(RTLearnedVisitMO *)v8 locationSourceAccuracy];
      v45 = [v49 initWithLatitude:v40 longitude:v43 horizontalUncertainty:(int)objc_msgSend(v44, "intValue") altitude:v28 verticalUncertainty:v30 date:v33 referenceFrame:v36 speed:v39 sourceAccuracy:0.0];

      id v7 = v56;
      uint64_t v57 = 0;
      [v56 distanceFromLocation:v55 toLocation:v45 error:&v57];
      BOOL v47 = 0;
      if (!v57 && v46 <= 200.0) {
        BOOL v47 = [(RTLearnedVisitMO *)self overlapsWithVisit:v8];
      }
    }
    else
    {
      BOOL v47 = 0;
    }
  }

  return v47;
}

- (BOOL)overlapsWithVisit:(id)a3
{
  id v4 = (RTLearnedVisitMO *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v5 = v4;
      id v6 = [(RTLearnedVisitMO *)self interval];
      id v7 = [(RTLearnedVisitMO *)v5 interval];

      char v8 = [v6 intersectsDateInterval:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

+ (id)managedObjectWithVisit:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithVisit:a3 finerGranularityInferredMapItem:0 place:0 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithVisit:(id)a3 place:(id)a4 inManagedObjectContext:(id)a5
{
  if (a4)
  {
    char v5 = [a1 managedObjectWithVisit:a3 finerGranularityInferredMapItem:0 place:a4 managedObject:0 inManagedObjectContext:a5];
  }
  else
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v8 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v8, 2u);
    }

    char v5 = 0;
  }

  return v5;
}

+ (id)managedObjectWithVisit:(id)a3 finerGranularityInferredMapItem:(id)a4 place:(id)a5 inManagedObjectContext:(id)a6
{
  if (a5)
  {
    id v6 = [a1 managedObjectWithVisit:a3 finerGranularityInferredMapItem:a4 place:a5 managedObject:0 inManagedObjectContext:a6];
  }
  else
  {
    id v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v9, 2u);
    }

    id v6 = 0;
  }

  return v6;
}

+ (id)managedObjectWithVisit:(id)a3 finerGranularityInferredMapItem:(id)a4 place:(id)a5 managedObject:(id)a6 inManagedObjectContext:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  double v17 = v16;
  if (!v12)
  {
    double v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }
    goto LABEL_19;
  }
  if (!v16)
  {
    double v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
    }
    goto LABEL_19;
  }
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [managedObject isKindOfClass:[RTLearnedVisitMO class]]", buf, 2u);
      }
LABEL_19:

      goto LABEL_20;
    }
  }
  if (!v13
    || ([v13 mapItem],
        double v18 = objc_claimAutoreleasedReturnValue(),
        id v32 = 0,
        +[RTMapItemMO updateDatabaseWithMapItem:v18 managedObjectContext:v17 error:&v32], __int16 v19 = (uint64_t (*)(uint64_t, uint64_t))v32, v18, !v19))
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__168;
    double v35 = __Block_byref_object_dispose__168;
    id v36 = 0;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __118__RTLearnedVisitMO_managedObjectWithVisit_finerGranularityInferredMapItem_place_managedObject_inManagedObjectContext___block_invoke;
    v25[3] = &unk_1E6B9D058;
    v31 = buf;
    id v26 = v15;
    id v27 = v17;
    id v28 = v12;
    id v29 = v14;
    id v30 = v13;
    [v27 performBlockAndWait:v25];
    id v22 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
    goto LABEL_21;
  }
  double v20 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    double v24 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v34 = v19;
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, "%@, error persisting visit, %@, error, %@", buf, 0x20u);
  }
LABEL_20:
  id v22 = 0;
LABEL_21:

  return v22;
}

void __118__RTLearnedVisitMO_managedObjectWithVisit_finerGranularityInferredMapItem_place_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = *(RTLearnedVisitMO **)(a1 + 32);
  v3 = v2;
  if (!v2) {
    v3 = [[RTLearnedVisitMO alloc] initWithContext:*(void *)(a1 + 40)];
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v3);
  if (!v2) {

  }
  id v4 = NSNumber;
  char v5 = [*(id *)(a1 + 48) location];
  [v5 confidence];
  id v6 = [v4 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setConfidence:v6];

  id v7 = NSNumber;
  char v8 = [*(id *)(a1 + 48) location];
  double v9 = [v7 numberWithUnsignedInteger:[v8 dataPointCount]];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDataPointCount:v9];

  double v10 = [*(id *)(a1 + 48) entryDate];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setEntryDate:v10];

  double v11 = [*(id *)(a1 + 48) exitDate];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setExitDate:v11];

  id v12 = [*(id *)(a1 + 48) identifier];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setIdentifier:v12];

  id v13 = [*(id *)(a1 + 48) creationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCreationDate:v13];

  id v14 = [*(id *)(a1 + 48) expirationDate];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setExpirationDate:v14];

  id v15 = NSNumber;
  id v16 = [*(id *)(a1 + 48) location];
  double v17 = [v16 location];
  [v17 latitude];
  double v18 = [v15 numberWithDouble:x0];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLocationLatitude:v18];

  __int16 v19 = NSNumber;
  double v20 = [*(id *)(a1 + 48) location];
  double v21 = [v20 location];
  [v21 longitude];
  id v22 = [v19 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLocationLongitude:v22];

  v23 = NSNumber;
  double v24 = [*(id *)(a1 + 48) location];
  uint64_t v25 = [v24 location];
  [v25 horizontalUncertainty];
  id v26 = [v23 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLocationHorizontalUncertainty:v26];

  id v27 = NSNumber;
  id v28 = [*(id *)(a1 + 48) location];
  id v29 = [v28 location];
  [v29 altitude];
  id v30 = [v27 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLocationAltitude:v30];

  v31 = NSNumber;
  id v32 = [*(id *)(a1 + 48) location];
  double v33 = [v32 location];
  [v33 verticalUncertainty];
  v34 = [v31 numberWithDouble:x0];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLocationVerticalUncertainty:v34];

  double v35 = NSNumber;
  id v36 = [*(id *)(a1 + 48) location];
  uint64_t v37 = [v36 location];
  double v38 = [v35 numberWithUnsignedInteger:[v37 sourceAccuracy]];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLocationSourceAccuracy:v38];

  double v39 = NSNumber;
  v40 = [*(id *)(a1 + 48) location];
  v41 = [v40 location];
  double v42 = [v39 numberWithUnsignedInt:[v41 referenceFrame]];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLocationReferenceFrame:v42];

  uint64_t v43 = NSNumber;
  [*(id *)(a1 + 48) placeConfidence];
  v44 = [v43 numberWithDouble:];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPlaceConfidence:v44];

  v45 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 48) placeSource]];
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPlaceSource:v45];

  if (*(void *)(a1 + 56))
  {
    double v46 = +[RTLearnedPlaceMO fetchRequest];
    BOOL v47 = (void *)MEMORY[0x1E4F28F60];
    v48 = [*(id *)(a1 + 56) identifier];
    id v49 = [v47 predicateWithFormat:@"%K == %@", @"identifier", v48];
    [v46 setPredicate:v49];

    v50 = *(void **)(a1 + 40);
    id v62 = 0;
    v51 = [v50 executeFetchRequest:v46 error:&v62];
    id v52 = v62;
    uint64_t v53 = *(void *)(a1 + 56);
    id v54 = [v51 firstObject];
    v55 = +[RTLearnedPlaceMO managedObjectWithPlace:v53 managedObject:v54 inManagedObjectContext:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setPlace:v55];
  }
  v56 = *(void **)(a1 + 64);
  if (v56)
  {
    uint64_t v57 = [v56 mapItem];
    v58 = [v57 identifier];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFinerGranularityMapItemIdentifier:v58];

    v59 = NSNumber;
    [*(id *)(a1 + 64) confidence];
    v60 = [v59 numberWithDouble:x0];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFinerGranularityMapItemConfidence:v60];

    v61 = [NSNumber numberWithUnsignedInteger:[*(id *)(a1 + 64) source]];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFinerGranularityMapItemSource:v61];
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFinerGranularityMapItemIdentifier:0];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFinerGranularityMapItemConfidence:0];
    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFinerGranularityMapItemSource:0];
  }
}

- (id)finerGranularityInferredMapItem
{
  v3 = [(RTLearnedVisitMO *)self finerGranularityMapItem];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5CDF8]);
    char v5 = (void *)MEMORY[0x1E4F5CE38];
    id v6 = [(RTLearnedVisitMO *)self finerGranularityMapItem];
    id v7 = [v5 createWithManagedObject:v6];
    char v8 = [(RTLearnedVisitMO *)self finerGranularityMapItemConfidence];
    [v8 doubleValue];
    double v10 = v9;
    double v11 = [(RTLearnedVisitMO *)self finerGranularityMapItemSource];
    id v12 = [v4 initWithMapItem:v7 confidence:[v11 unsignedIntegerValue] source:v10];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (NSDateInterval)interval
{
  interval = self->_interval;
  if (!interval)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28C18]);
    char v5 = [(RTLearnedVisitMO *)self entryDate];
    id v6 = [(RTLearnedVisitMO *)self exitDate];
    id v7 = (NSDateInterval *)[v4 initWithStartDate:v5 endDate:v6];
    char v8 = self->_interval;
    self->_interval = v7;

    interval = self->_interval;
  }
  double v9 = interval;

  return v9;
}

- (RTMapItemMO)cachedFinerGranularityMapItem
{
  return self->cachedFinerGranularityMapItem;
}

- (void)setCachedFinerGranularityMapItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedFinerGranularityMapItem, 0);

  objc_storeStrong((id *)&self->_interval, 0);
}

@end