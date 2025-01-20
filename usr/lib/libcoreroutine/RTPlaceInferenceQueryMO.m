@interface RTPlaceInferenceQueryMO
+ (id)fetchRequest;
+ (id)managedObjectWithPlaceInferenceQuery:(id)a3 inManagedObjectContext:(id)a4;
- (RTMapItemMO)cachedMapItem;
- (id)mapItem;
- (void)setCachedMapItem:(id)a3;
- (void)setMapItem:(id)a3;
@end

@implementation RTPlaceInferenceQueryMO

- (void).cxx_destruct
{
}

- (id)mapItem
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(RTPlaceInferenceQueryMO *)self willAccessValueForKey:@"mapItem"];
  v4 = [(RTPlaceInferenceQueryMO *)self cachedMapItem];

  if (v4)
  {
    v5 = [(RTPlaceInferenceQueryMO *)self cachedMapItem];
  }
  else
  {
    v6 = +[RTMapItemMO fetchRequest];
    [v6 setReturnsObjectsAsFaults:0];
    [v6 setFetchLimit:1];
    v7 = (void *)MEMORY[0x1E4F28F60];
    v8 = [(RTPlaceInferenceQueryMO *)self mapItemIdentifier];
    v9 = [v7 predicateWithFormat:@"%K == %@", @"identifier", v8];
    [v6 setPredicate:v9];

    id v15 = 0;
    v10 = [v6 execute:&v15];
    id v11 = v15;
    if (v11)
    {
      v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v14 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v17 = v14;
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property mapItem, %@", buf, 0x16u);
      }
    }
    [(RTPlaceInferenceQueryMO *)self didAccessValueForKey:@"mapItem"];
    v5 = [v10 firstObject];
    [(RTPlaceInferenceQueryMO *)self setCachedMapItem:v5];
  }

  return v5;
}

- (void)setCachedMapItem:(id)a3
{
}

- (RTMapItemMO)cachedMapItem
{
  return self->cachedMapItem;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTPlaceInferenceQueryMO"];
}

+ (id)managedObjectWithPlaceInferenceQuery:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  if (!v6)
  {
    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      v17 = 0;
      goto LABEL_17;
    }
    *(_WORD *)v65 = 0;
    id v19 = "Invalid parameter not satisfying: placeInferenceQuery";
LABEL_22:
    _os_log_error_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_ERROR, v19, v65, 2u);
    goto LABEL_16;
  }
  if (!v7)
  {
    __int16 v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    *(_WORD *)v65 = 0;
    id v19 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_22;
  }
  v9 = [v6 placeInference];
  v10 = [v9 mapItem];

  if (v10)
  {
    *(void *)v65 = 0;
    v66 = v65;
    uint64_t v67 = 0x3032000000;
    v68 = __Block_byref_object_copy__33;
    v69 = __Block_byref_object_dispose__33;
    id v70 = 0;
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __87__RTPlaceInferenceQueryMO_managedObjectWithPlaceInferenceQuery_inManagedObjectContext___block_invoke;
    v61[3] = &unk_1E6B93BE8;
    id v11 = v6;
    id v62 = v11;
    v64 = v65;
    id v12 = v8;
    id v63 = v12;
    [v12 performBlockAndWait:v61];
    uint64_t v55 = 0;
    v56 = &v55;
    uint64_t v57 = 0x3032000000;
    v58 = __Block_byref_object_copy__33;
    v59 = __Block_byref_object_dispose__33;
    id v60 = 0;
    if (![*((id *)v66 + 5) count])
    {
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __87__RTPlaceInferenceQueryMO_managedObjectWithPlaceInferenceQuery_inManagedObjectContext___block_invoke_2;
      v51[3] = &unk_1E6B91128;
      id v52 = v11;
      id v53 = v12;
      v54 = &v55;
      [v53 performBlockAndWait:v51];
    }
    uint64_t v13 = v56[5];
    if (v13)
    {
      v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = NSStringFromSelector(a2);
        uint64_t v16 = v56[5];
        *(_DWORD *)buf = 138412802;
        v72 = v15;
        __int16 v73 = 2112;
        id v74 = v11;
        __int16 v75 = 2112;
        uint64_t v76 = v16;
        _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%@, error persisting visit, %@, error, %@", buf, 0x20u);
      }
    }
    _Block_object_dispose(&v55, 8);

    _Block_object_dispose(v65, 8);
    if (v13)
    {
      v17 = 0;
      goto LABEL_18;
    }
  }
  v17 = [[RTPlaceInferenceQueryMO alloc] initWithContext:v8];
  uint64_t v20 = [v6 identifier];
  [(RTPlaceInferenceQueryMO *)v17 setIdentifier:v20];

  v21 = [v6 placeInference];
  [v21 confidence];
  -[RTPlaceInferenceQueryMO setConfidence:](v17, "setConfidence:");

  v22 = [v6 date];
  [(RTPlaceInferenceQueryMO *)v17 setDate:v22];

  v23 = [NSNumber numberWithInteger:[v6 errorCode]];
  [(RTPlaceInferenceQueryMO *)v17 setErrorCode:v23];

  v24 = [NSNumber numberWithUnsignedInteger:[v6 fidelityPolicyMask]];
  [(RTPlaceInferenceQueryMO *)v17 setFidelityPolicyMask:v24];

  v25 = [v6 placeInference];
  v26 = [v25 referenceLocation];
  v27 = [v26 date];
  [(RTPlaceInferenceQueryMO *)v17 setLocationDate:v27];

  v28 = [v6 placeInference];
  v29 = [v28 referenceLocation];
  [v29 latitude];
  -[RTPlaceInferenceQueryMO setLocationLatitude:](v17, "setLocationLatitude:");

  v30 = [v6 placeInference];
  v31 = [v30 referenceLocation];
  [v31 longitude];
  -[RTPlaceInferenceQueryMO setLocationLongitude:](v17, "setLocationLongitude:");

  v32 = [v6 placeInference];
  v33 = [v32 referenceLocation];
  [v33 horizontalUncertainty];
  -[RTPlaceInferenceQueryMO setLocationUncertainty:](v17, "setLocationUncertainty:");

  v34 = NSNumber;
  v35 = [v6 placeInference];
  v36 = [v35 referenceLocation];
  v37 = [v34 numberWithUnsignedInt:[v36 referenceFrame]];
  [(RTPlaceInferenceQueryMO *)v17 setLocationReferenceFrame:v37];

  v38 = [v6 placeInference];
  v39 = [v38 mapItem];
  v40 = [v39 identifier];
  [(RTPlaceInferenceQueryMO *)v17 setMapItemIdentifier:v40];

  v41 = NSNumber;
  v42 = [v6 placeInference];
  v43 = [v41 numberWithUnsignedInteger:[v42 placeType]];
  [(RTPlaceInferenceQueryMO *)v17 setPlaceType:v43];

  v44 = [v6 sourceIdentifier];
  [(RTPlaceInferenceQueryMO *)v17 setSourceIdentifier:v44];

  v45 = NSNumber;
  v46 = [v6 placeInference];
  v47 = [v45 numberWithUnsignedInteger:[v46 userType]];
  [(RTPlaceInferenceQueryMO *)v17 setUserType:v47];

  v48 = NSNumber;
  __int16 v18 = [v6 placeInference];
  v49 = [v48 numberWithUnsignedInteger:-[NSObject userTypeSource](v18, "userTypeSource")];
  [(RTPlaceInferenceQueryMO *)v17 setUserTypeSource:v49];

LABEL_17:
LABEL_18:

  return v17;
}

void __87__RTPlaceInferenceQueryMO_managedObjectWithPlaceInferenceQuery_inManagedObjectContext___block_invoke(uint64_t a1)
{
  v2 = +[RTMapItemMO fetchRequest];
  v3 = (void *)MEMORY[0x1E4F28F60];
  v4 = [*(id *)(a1 + 32) placeInference];
  v5 = [v4 mapItem];
  id v6 = [v5 identifier];
  id v7 = [v3 predicateWithFormat:@"%K == %@", @"identifier", v6];
  [v2 setPredicate:v7];

  v8 = *(void **)(a1 + 40);
  id v13 = 0;
  uint64_t v9 = [v8 executeFetchRequest:v2 error:&v13];
  id v10 = v13;
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v9;
}

void __87__RTPlaceInferenceQueryMO_managedObjectWithPlaceInferenceQuery_inManagedObjectContext___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) placeInference];
  v3 = [v2 mapItem];
  id v4 = +[RTMapItemMO managedObjectWithMapItem:v3 inManagedObjectContext:*(void *)(a1 + 40)];

  v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v6 + 40);
  [v5 save:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
}

- (void)setMapItem:(id)a3
{
  id v4 = a3;
  [(RTPlaceInferenceQueryMO *)self willChangeValueForKey:@"mapItem"];
  v5 = [v4 identifier];
  [(RTPlaceInferenceQueryMO *)self setMapItemIdentifier:v5];

  [(RTPlaceInferenceQueryMO *)self setCachedMapItem:v4];

  [(RTPlaceInferenceQueryMO *)self didChangeValueForKey:@"mapItem"];
}

@end