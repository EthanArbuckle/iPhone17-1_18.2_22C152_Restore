@interface RTLearnedLocationOfInterestMO
+ (id)fetchRequest;
+ (id)fetchRequestSortedByCreation;
+ (id)managedObjectWithLocationOfInterest:(id)a3 inManagedObjectContext:(id)a4;
+ (id)managedObjectWithLocationOfInterest:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5;
- (RTMapItemMO)cachedMapItem;
- (id)mapItem;
- (void)setCachedMapItem:(id)a3;
- (void)setMapItem:(id)a3;
- (void)updateWithLearnedLocation:(id)a3;
@end

@implementation RTLearnedLocationOfInterestMO

+ (id)fetchRequestSortedByCreation
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 fetchRequest];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"placeCreationDate" ascending:1];
  v6[0] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [v2 setSortDescriptors:v4];

  return v2;
}

+ (id)fetchRequest
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C0D0]) initWithEntityName:@"RTLearnedLocationOfInterestMO"];

  return v2;
}

- (id)mapItem
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(RTLearnedLocationOfInterestMO *)self willAccessValueForKey:@"mapItem"];
  v3 = [(RTLearnedLocationOfInterestMO *)self cachedMapItem];

  if (v3)
  {
    v4 = [(RTLearnedLocationOfInterestMO *)self cachedMapItem];
  }
  else
  {
    v5 = +[RTMapItemMO fetchRequest];
    [v5 setReturnsObjectsAsFaults:0];
    [v5 setFetchLimit:1];
    v6 = (void *)MEMORY[0x1E4F28F60];
    v7 = [(RTLearnedLocationOfInterestMO *)self placeMapItemIdentifier];
    v8 = [v6 predicateWithFormat:@"%K == %@", @"identifier", v7];
    [v5 setPredicate:v8];

    id v13 = 0;
    v9 = [v5 execute:&v13];
    id v10 = v13;
    if (v10)
    {
      v11 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v10;
        _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Error fulfilling transient property mapItem, %@", buf, 0xCu);
      }
    }
    [(RTLearnedLocationOfInterestMO *)self didAccessValueForKey:@"mapItem"];
    v4 = [v9 firstObject];
    [(RTLearnedLocationOfInterestMO *)self setCachedMapItem:v4];
  }

  return v4;
}

- (void)setMapItem:(id)a3
{
  id v4 = a3;
  [(RTLearnedLocationOfInterestMO *)self willChangeValueForKey:@"mapItem"];
  v5 = [v4 identifier];

  [(RTLearnedLocationOfInterestMO *)self setPlaceMapItemIdentifier:v5];
  [(RTLearnedLocationOfInterestMO *)self setCachedMapItem:0];

  [(RTLearnedLocationOfInterestMO *)self didChangeValueForKey:@"mapItem"];
}

+ (id)managedObjectWithLocationOfInterest:(id)a3 inManagedObjectContext:(id)a4
{
  return (id)[a1 managedObjectWithLocationOfInterest:a3 managedObject:0 inManagedObjectContext:a4];
}

+ (id)managedObjectWithLocationOfInterest:(id)a3 managedObject:(id)a4 inManagedObjectContext:(id)a5
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v60 = a4;
  id v8 = a5;
  v58 = v8;
  v59 = v7;
  if (!v7)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationOfInterest", buf, 2u);
    }
    goto LABEL_11;
  }
  v9 = v8;
  if (!v8)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: managedObjectContext", buf, 2u);
    }
LABEL_11:

    v64 = 0;
    goto LABEL_34;
  }
  *(void *)buf = 0;
  v82 = buf;
  uint64_t v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__78;
  v85 = __Block_byref_object_dispose__78;
  id v86 = 0;
  v76[0] = MEMORY[0x1E4F143A8];
  v76[1] = 3221225472;
  v76[2] = __106__RTLearnedLocationOfInterestMO_managedObjectWithLocationOfInterest_managedObject_inManagedObjectContext___block_invoke;
  v76[3] = &unk_1E6B974D8;
  id v61 = v7;
  id v77 = v61;
  v80 = buf;
  id v78 = v9;
  id v10 = v60;
  id v79 = v10;
  id v65 = v78;
  [v78 performBlockAndWait:v76];
  if ([*((id *)v82 + 5) count])
  {
    if (v10) {
      v64 = (RTLearnedLocationOfInterestMO *)v10;
    }
    else {
      v64 = [[RTLearnedLocationOfInterestMO alloc] initWithContext:v65];
    }
    v12 = [v61 location];
    [(RTLearnedLocationOfInterestMO *)v64 updateWithLearnedLocation:v12];

    id v13 = [v61 identifier];
    [(RTLearnedLocationOfInterestMO *)v64 setIdentifier:v13];

    v14 = [v61 place];
    id v15 = [v14 customLabel];
    [(RTLearnedLocationOfInterestMO *)v64 setPlaceCustomLabel:v15];

    uint64_t v16 = [v61 place];
    v17 = [v16 identifier];
    [(RTLearnedLocationOfInterestMO *)v64 setPlaceIdentifier:v17];

    v18 = NSNumber;
    v19 = [v61 place];
    v20 = [v18 numberWithUnsignedInteger:[v19 type]];
    [(RTLearnedLocationOfInterestMO *)v64 setPlaceType:v20];

    v21 = NSNumber;
    v22 = [v61 place];
    v23 = [v21 numberWithUnsignedInteger:[v22 typeSource]];
    [(RTLearnedLocationOfInterestMO *)v64 setPlaceTypeSource:v23];

    v24 = [v61 place];
    v25 = [v24 mapItem];
    v26 = [v25 identifier];
    [(RTLearnedLocationOfInterestMO *)v64 setPlaceMapItemIdentifier:v26];

    v27 = [v61 place];
    v28 = [v27 creationDate];
    [(RTLearnedLocationOfInterestMO *)v64 setPlaceCreationDate:v28];

    v29 = [v61 place];
    v30 = [v29 expirationDate];
    [(RTLearnedLocationOfInterestMO *)v64 setPlaceExpirationDate:v30];

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    v31 = [v61 visits];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v72 objects:v88 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v73;
      obuint64_t j = v31;
      do
      {
        for (uint64_t i = 0; i != v32; ++i)
        {
          if (*(void *)v73 != v33) {
            objc_enumerationMutation(obj);
          }
          v35 = *(void **)(*((void *)&v72 + 1) + 8 * i);
          v36 = +[RTLearnedLocationOfInterestVisitMO fetchRequest];
          v37 = (void *)MEMORY[0x1E4F28F60];
          v38 = [v35 identifier];
          v39 = [v37 predicateWithFormat:@"%K == %@", @"identifier", v38, v58];
          [v36 setPredicate:v39];

          id v71 = 0;
          v40 = [v65 executeFetchRequest:v36 error:&v71];
          id v41 = v71;
          v42 = [v40 firstObject];
          v43 = +[RTLearnedLocationOfInterestVisitMO managedObjectWithVisit:v35 managedObject:v42 inManagedObjectContext:v65];

          if (v43) {
            [(RTLearnedLocationOfInterestMO *)v64 addVisitsObject:v43];
          }
        }
        v31 = obj;
        uint64_t v32 = [obj countByEnumeratingWithState:&v72 objects:v88 count:16];
      }
      while (v32);
    }

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    v44 = [v61 transitions];
    uint64_t v45 = [v44 countByEnumeratingWithState:&v67 objects:v87 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v68;
      id obja = v44;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v68 != v46) {
            objc_enumerationMutation(obja);
          }
          v48 = *(void **)(*((void *)&v67 + 1) + 8 * j);
          v49 = +[RTLearnedLocationOfInterestTransitionMO fetchRequest];
          v50 = (void *)MEMORY[0x1E4F28F60];
          v51 = [v48 identifier];
          v52 = [v50 predicateWithFormat:@"%K == %@", @"identifier", v51];
          [v49 setPredicate:v52];

          id v66 = 0;
          v53 = [v65 executeFetchRequest:v49 error:&v66];
          id v54 = v66;
          v55 = [v53 firstObject];
          v56 = +[RTLearnedLocationOfInterestTransitionMO managedObjectWithTransition:v48 managedObject:v55 inManagedObjectContext:v65];

          if (v56) {
            [(RTLearnedLocationOfInterestMO *)v64 addTransitionsObject:v56];
          }
        }
        v44 = obja;
        uint64_t v45 = [obja countByEnumeratingWithState:&v67 objects:v87 count:16];
      }
      while (v45);
    }
  }
  else
  {
    v64 = 0;
  }

  _Block_object_dispose(buf, 8);
LABEL_34:

  return v64;
}

void __106__RTLearnedLocationOfInterestMO_managedObjectWithLocationOfInterest_managedObject_inManagedObjectContext___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = +[RTMapItemMO fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28F60];
  id v4 = [*(id *)(a1 + 32) place];
  v5 = [v4 mapItem];
  v6 = [v5 identifier];
  id v7 = [v3 predicateWithFormat:@"%K == %@", @"identifier", v6];
  [v2 setPredicate:v7];

  id v8 = *(void **)(a1 + 40);
  id v15 = 0;
  uint64_t v9 = [v8 executeFetchRequest:v2 error:&v15];
  id v10 = v15;
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;

  if (![*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count])
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = @"update";
      if (!*(void *)(a1 + 48)) {
        v14 = @"create";
      }
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      __int16 v18 = 2080;
      v19 = "+[RTLearnedLocationOfInterestMO managedObjectWithLocationOfInterest:managedObject:inManagedObjectContext:]_block_invoke";
      __int16 v20 = 1024;
      int v21 = 56;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "attempting to %@ a learnedLocationOfInterest without a backing mapItem (in %s:%d)", buf, 0x1Cu);
    }
  }
}

- (void)updateWithLearnedLocation:(id)a3
{
  if (a3)
  {
    id v4 = NSNumber;
    id v5 = a3;
    [v5 confidence];
    v6 = [v4 numberWithDouble:x0];
    [(RTLearnedLocationOfInterestMO *)self setConfidence:v6];

    id v7 = [NSNumber numberWithUnsignedInteger:[v5 dataPointCount]];
    [(RTLearnedLocationOfInterestMO *)self setDataPointCount:v7];

    id v8 = NSNumber;
    uint64_t v9 = [v5 location];
    [v9 latitude];
    id v10 = [v8 numberWithDouble:];
    [(RTLearnedLocationOfInterestMO *)self setLocationLatitude:v10];

    uint64_t v11 = NSNumber;
    v12 = [v5 location];
    [v12 longitude];
    id v13 = [v11 numberWithDouble:];
    [(RTLearnedLocationOfInterestMO *)self setLocationLongitude:v13];

    v14 = NSNumber;
    id v15 = [v5 location];
    [v15 horizontalUncertainty];
    uint64_t v16 = [v14 numberWithDouble:];
    [(RTLearnedLocationOfInterestMO *)self setLocationHorizontalUncertainty:v16];

    v17 = NSNumber;
    __int16 v18 = [v5 location];
    [v18 altitude];
    v19 = [v17 numberWithDouble:x0];
    [(RTLearnedLocationOfInterestMO *)self setLocationAltitude:v19];

    __int16 v20 = NSNumber;
    int v21 = [v5 location];
    [v21 verticalUncertainty];
    uint64_t v22 = [v20 numberWithDouble:];
    [(RTLearnedLocationOfInterestMO *)self setLocationVerticalUncertainty:v22];

    v23 = NSNumber;
    v24 = [v5 location];
    v25 = [v23 numberWithUnsignedInteger:[v24 sourceAccuracy]];
    [(RTLearnedLocationOfInterestMO *)self setLocationSourceAccuracy:v25];

    v26 = NSNumber;
    id v28 = [v5 location];

    v27 = [v26 numberWithUnsignedInt:[v28 referenceFrame]];
    [(RTLearnedLocationOfInterestMO *)self setLocationReferenceFrame:v27];
  }
}

- (RTMapItemMO)cachedMapItem
{
  return self->cachedMapItem;
}

- (void)setCachedMapItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end