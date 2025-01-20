@interface RTVisitMO
+ (id)fetchRequest;
+ (id)managedObjectWithVisit:(id)a3 inManagedObjectContext:(id)a4;
- (NSUUID)cachedPlaceInferenceLoiIdentifier;
- (RTMapItemMO)cachedFinerGranularityMapItem;
- (RTMapItemMO)cachedMapItem;
- (id)description;
- (id)finerGranularityMapItem;
- (id)mapItem;
- (id)placeInferenceLoiIdentifier;
- (void)setCachedFinerGranularityMapItem:(id)a3;
- (void)setCachedMapItem:(id)a3;
- (void)setCachedPlaceInferenceLoiIdentifier:(id)a3;
- (void)setFinerGranularityMapItem:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setPlaceInferenceLoiIdentifier:(id)a3;
@end

@implementation RTVisitMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTVisitMO"];
}

- (id)mapItem
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(RTVisitMO *)self willAccessValueForKey:@"mapItem"];
  v4 = [(RTVisitMO *)self cachedMapItem];

  if (!v4)
  {
    v5 = [(RTVisitMO *)self placeInferenceMapItemIdentifier];
    id v13 = 0;
    v6 = +[RTMapItemMO mapItemForIdentifier:v5 error:&v13];
    id v7 = v13;
    [(RTVisitMO *)self setCachedMapItem:v6];

    if (v7)
    {
      v8 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = NSStringFromSelector(a2);
        v12 = [(RTVisitMO *)self placeInferenceMapItemIdentifier];
        *(_DWORD *)buf = 138412802;
        v15 = v11;
        __int16 v16 = 2112;
        id v17 = v7;
        __int16 v18 = 2112;
        v19 = v12;
        _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property mapItem, %@, map item identifier, %@", buf, 0x20u);
      }
    }
  }
  [(RTVisitMO *)self didAccessValueForKey:@"mapItem"];
  v9 = [(RTVisitMO *)self cachedMapItem];

  return v9;
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
  objc_storeStrong((id *)&self->cachedPlaceInferenceLoiIdentifier, 0);
  objc_storeStrong((id *)&self->cachedFinerGranularityMapItem, 0);

  objc_storeStrong((id *)&self->cachedMapItem, 0);
}

- (void)setMapItem:(id)a3
{
  id v4 = a3;
  [(RTVisitMO *)self willChangeValueForKey:@"mapItem"];
  v5 = [v4 identifier];
  [(RTVisitMO *)self setPlaceInferenceMapItemIdentifier:v5];

  [(RTVisitMO *)self setCachedMapItem:v4];

  [(RTVisitMO *)self didChangeValueForKey:@"mapItem"];
}

- (id)finerGranularityMapItem
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(RTVisitMO *)self willAccessValueForKey:@"finerGranularityMapItem"];
  id v4 = [(RTVisitMO *)self placeInferenceFinerGranularityMapItemIdentifier];

  if (v4)
  {
    v5 = [(RTVisitMO *)self cachedFinerGranularityMapItem];

    if (!v5)
    {
      v6 = [(RTVisitMO *)self placeInferenceFinerGranularityMapItemIdentifier];
      id v14 = 0;
      id v7 = +[RTMapItemMO mapItemForIdentifier:v6 error:&v14];
      id v8 = v14;
      [(RTVisitMO *)self setCachedFinerGranularityMapItem:v7];

      if (v8)
      {
        v9 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v12 = NSStringFromSelector(a2);
          id v13 = [(RTVisitMO *)self placeInferenceFinerGranularityMapItemIdentifier];
          *(_DWORD *)buf = 138412802;
          __int16 v16 = v12;
          __int16 v17 = 2112;
          id v18 = v8;
          __int16 v19 = 2112;
          uint64_t v20 = v13;
          _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property finerGranularityMapItem, %@, map item identifier, %@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    [(RTVisitMO *)self setCachedFinerGranularityMapItem:0];
  }
  [(RTVisitMO *)self didAccessValueForKey:@"finerGranularityMapItem"];
  v10 = [(RTVisitMO *)self cachedFinerGranularityMapItem];

  return v10;
}

- (void)setFinerGranularityMapItem:(id)a3
{
  id v4 = a3;
  [(RTVisitMO *)self willChangeValueForKey:@"finerGranularityMapItem"];
  v5 = [v4 identifier];
  [(RTVisitMO *)self setPlaceInferenceFinerGranularityMapItemIdentifier:v5];

  [(RTVisitMO *)self setCachedFinerGranularityMapItem:v4];

  [(RTVisitMO *)self didChangeValueForKey:@"finerGranularityMapItem"];
}

- (id)placeInferenceLoiIdentifier
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(RTVisitMO *)self willAccessValueForKey:@"placeInferenceLoiIdentifier"];
  id v4 = [(RTVisitMO *)self cachedPlaceInferenceLoiIdentifier];

  if (v4)
  {
    v5 = [(RTVisitMO *)self cachedPlaceInferenceLoiIdentifier];
  }
  else
  {
    v6 = +[RTLearnedLocationOfInterestMO fetchRequest];
    [v6 setReturnsObjectsAsFaults:0];
    [v6 setFetchLimit:1];
    id v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = [(RTVisitMO *)self placeInferenceMapItemIdentifier];
    v9 = [v7 predicateWithFormat:@"%K == %@", @"placeMapItemIdentifier", v8];
    [v6 setPredicate:v9];

    id v16 = 0;
    v10 = [v6 execute:&v16];
    id v11 = v16;
    if (v11)
    {
      v12 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        id v18 = v15;
        __int16 v19 = 2112;
        id v20 = v11;
        _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "%@, Error fulfilling transient property placeInferenceLoiIdentifier, %@", buf, 0x16u);
      }
    }
    [(RTVisitMO *)self didAccessValueForKey:@"placeInferenceLoiIdentifier"];
    id v13 = [v10 firstObject];
    v5 = [v13 identifier];
    [(RTVisitMO *)self setCachedPlaceInferenceLoiIdentifier:v5];
  }

  return v5;
}

- (void)setPlaceInferenceLoiIdentifier:(id)a3
{
  id v4 = a3;
  [(RTVisitMO *)self willChangeValueForKey:@"placeInferenceLoiIdentifier"];
  [(RTVisitMO *)self setCachedPlaceInferenceLoiIdentifier:v4];

  [(RTVisitMO *)self didChangeValueForKey:@"placeInferenceLoiIdentifier"];
}

+ (id)managedObjectWithVisit:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    if (v7)
    {
      v9 = [v6 placeInference];
      v10 = [v9 mapItem];

      if (!v10) {
        goto LABEL_9;
      }
      id v11 = [v6 placeInference];
      v12 = [v11 mapItem];
      id v73 = 0;
      +[RTMapItemMO updateDatabaseWithMapItem:v12 managedObjectContext:v8 error:&v73];
      id v13 = v73;

      if (v13)
      {
        id v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
LABEL_12:

          goto LABEL_14;
        }
        v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v75 = v15;
        __int16 v76 = 2112;
        id v77 = v6;
        __int16 v78 = 2112;
        v79 = v13;
      }
      else
      {
LABEL_9:
        __int16 v17 = [v6 placeInference];
        id v18 = [v17 finerGranularityMapItem];

        if (!v18) {
          goto LABEL_18;
        }
        __int16 v19 = [v6 placeInference];
        id v20 = [v19 finerGranularityMapItem];
        id v72 = 0;
        +[RTMapItemMO updateDatabaseWithMapItem:v20 managedObjectContext:v8 error:&v72];
        id v13 = v72;

        if (!v13)
        {
LABEL_18:
          uint64_t v21 = [[RTVisitMO alloc] initWithContext:v8];
          v23 = NSNumber;
          [v6 confidence];
          v24 = [v23 numberWithDouble:x0];
          [(RTVisitMO *)v21 setConfidence:v24];

          v25 = [NSNumber numberWithInteger:[v6 dataPointCount]];
          [(RTVisitMO *)v21 setDataPointCount:v25];

          v26 = [v6 date];
          [(RTVisitMO *)v21 setDetectionDate:v26];

          v27 = [v6 entry];
          [(RTVisitMO *)v21 setEntryDate:v27];

          v28 = [v6 exit];
          [(RTVisitMO *)v21 setExitDate:v28];

          v29 = NSNumber;
          v30 = [v6 location];
          [v30 latitude];
          v31 = [v29 numberWithDouble:];
          [(RTVisitMO *)v21 setLocationLatitude:v31];

          v32 = NSNumber;
          v33 = [v6 location];
          [v33 longitude];
          v34 = [v32 numberWithDouble:x0];
          [(RTVisitMO *)v21 setLocationLongitude:v34];

          v35 = NSNumber;
          v36 = [v6 location];
          [v36 horizontalUncertainty];
          v37 = [v35 numberWithDouble:x0];
          [(RTVisitMO *)v21 setLocationUncertainty:v37];

          v38 = NSNumber;
          v39 = [v6 location];
          v40 = [v38 numberWithUnsignedInt:[v39 referenceFrame]];
          [(RTVisitMO *)v21 setLocationReferenceFrame:v40];

          v41 = [v6 location];
          v42 = [v41 date];
          [(RTVisitMO *)v21 setLocationDate:v42];

          v43 = [v6 placeInference];
          [v43 confidence];
          if (v44 == 0.0)
          {
            [(RTVisitMO *)v21 setPlaceInferenceConfidence:0];
          }
          else
          {
            v45 = NSNumber;
            v46 = [v6 placeInference];
            [v46 confidence];
            v47 = [v45 numberWithDouble:];
            [(RTVisitMO *)v21 setPlaceInferenceConfidence:v47];
          }
          v48 = [v6 placeInference];
          v49 = [v48 mapItem];
          v50 = [v49 identifier];
          [(RTVisitMO *)v21 setPlaceInferenceMapItemIdentifier:v50];

          v51 = [v6 placeInference];
          [v51 finerGranularityMapItemConfidence];
          if (v52 == 0.0)
          {
            [(RTVisitMO *)v21 setPlaceInferenceFinerGranularityMapItemConfidence:0];
          }
          else
          {
            v53 = NSNumber;
            v54 = [v6 placeInference];
            [v54 finerGranularityMapItemConfidence];
            v55 = [v53 numberWithDouble:];
            [(RTVisitMO *)v21 setPlaceInferenceFinerGranularityMapItemConfidence:v55];
          }
          v56 = [v6 placeInference];
          v57 = [v56 finerGranularityMapItem];
          v58 = [v57 identifier];
          [(RTVisitMO *)v21 setPlaceInferenceFinerGranularityMapItemIdentifier:v58];

          v59 = [v6 placeInference];
          if ([v59 placeType])
          {
            v60 = NSNumber;
            v61 = [v6 placeInference];
            v62 = [v60 numberWithUnsignedInteger:[v61 placeType]];
            [(RTVisitMO *)v21 setPlaceInferencePlaceType:v62];
          }
          else
          {
            [(RTVisitMO *)v21 setPlaceInferencePlaceType:0];
          }

          v63 = [v6 placeInference];
          if ([v63 userType])
          {
            v64 = NSNumber;
            v65 = [v6 placeInference];
            v66 = [v64 numberWithUnsignedInteger:[v65 userType]];
            [(RTVisitMO *)v21 setPlaceInferenceUserType:v66];
          }
          else
          {
            [(RTVisitMO *)v21 setPlaceInferenceUserType:0];
          }

          v67 = [v6 placeInference];
          if ([v67 userTypeSource])
          {
            v68 = NSNumber;
            v69 = [v6 placeInference];
            v70 = [v68 numberWithUnsignedInteger:[v69 userTypeSource]];
            [(RTVisitMO *)v21 setPlaceInferenceUserTypeSource:v70];
          }
          else
          {
            [(RTVisitMO *)v21 setPlaceInferenceUserTypeSource:0];
          }

          v71 = [NSNumber numberWithInteger:[v6 source]];
          [(RTVisitMO *)v21 setSource:v71];

          id v13 = [NSNumber numberWithInteger:[v6 type]];
          [(RTVisitMO *)v21 setType:v13];
          goto LABEL_15;
        }
        id v14 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          goto LABEL_12;
        }
        v15 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412802;
        v75 = v15;
        __int16 v76 = 2112;
        id v77 = v6;
        __int16 v78 = 2112;
        v79 = v13;
      }
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%@, error persisting visit, %@, error, %@", buf, 0x20u);

      goto LABEL_12;
    }
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    *(_WORD *)buf = 0;
    id v16 = "Invalid parameter not satisfying: managedObjectContext";
LABEL_35:
    _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_14;
  }
  id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    id v16 = "Invalid parameter not satisfying: visit";
    goto LABEL_35;
  }
LABEL_14:
  uint64_t v21 = 0;
LABEL_15:

  return v21;
}

- (id)description
{
  __int16 v17 = NSString;
  v26 = [(RTVisitMO *)self confidence];
  v28 = [(RTVisitMO *)self dataPointCount];
  uint64_t v21 = [(RTVisitMO *)self detectionDate];
  v15 = [v21 stringFromDate];
  id v20 = [(RTVisitMO *)self entryDate];
  v27 = [v20 stringFromDate];
  __int16 v19 = [(RTVisitMO *)self exitDate];
  v25 = [v19 stringFromDate];
  id v14 = [(RTVisitMO *)self locationLatitude];
  v24 = [(RTVisitMO *)self locationLongitude];
  v23 = [(RTVisitMO *)self locationUncertainty];
  v22 = [(RTVisitMO *)self locationReferenceFrame];
  id v16 = [(RTVisitMO *)self locationDate];
  id v13 = [v16 stringFromDate];
  v12 = [(RTVisitMO *)self placeInferenceConfidence];
  v3 = [(RTVisitMO *)self placeInferenceMapItemIdentifier];
  id v4 = [(RTVisitMO *)self placeInferenceFinerGranularityMapItemConfidence];
  v5 = [(RTVisitMO *)self placeInferenceFinerGranularityMapItemIdentifier];
  id v6 = [(RTVisitMO *)self placeInferencePlaceType];
  id v7 = [(RTVisitMO *)self placeInferenceUserType];
  id v8 = [(RTVisitMO *)self placeInferenceUserTypeSource];
  v9 = [(RTVisitMO *)self source];
  v10 = [(RTVisitMO *)self type];
  objc_msgSend(v17, "stringWithFormat:", @"confidence, %@, dataPointCount, %@, detectionDate, %@, entryDate, %@, exitDate, %@, locationLatitude, %@, locationLongitude, %@, locationUncertainty, %@, locationReferenceFrame, %@, locationDate, %@, placeInferenceConfidence, %@, placeInferenceMapItemIdentifier, %@, placeInferenceFinerGranularityMapItemConfidence, %@, placeInferenceFinerGranularityMapItemIdentifier, %@, placeInferencePlaceType, %@, placeInferenceUserType, %@, placeInferenceUserTypeSource, %@, source, %@, type, %@", v26, v28, v15, v27, v25, v14, v24, v23, v22, v13, v12, v3, v4, v5, v6, v7,
    v8,
    v9,
  id v18 = v10);

  return v18;
}

- (RTMapItemMO)cachedFinerGranularityMapItem
{
  return self->cachedFinerGranularityMapItem;
}

- (void)setCachedFinerGranularityMapItem:(id)a3
{
}

- (NSUUID)cachedPlaceInferenceLoiIdentifier
{
  return self->cachedPlaceInferenceLoiIdentifier;
}

- (void)setCachedPlaceInferenceLoiIdentifier:(id)a3
{
}

@end