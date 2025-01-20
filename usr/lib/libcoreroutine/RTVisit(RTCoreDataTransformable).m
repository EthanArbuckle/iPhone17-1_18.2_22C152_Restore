@interface RTVisit(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithVisitMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation RTVisit(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      v6 = [(id)objc_opt_class() createWithVisitMO:v5];

      goto LABEL_8;
    }
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      int v10 = 138413058;
      v11 = v9;
      __int16 v12 = 2112;
      __int16 v14 = 2080;
      id v13 = v4;
      v15 = "+[RTVisit(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 38;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTVisit+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)createWithVisitMO:()RTCoreDataTransformable
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F5CE00]);
  id v5 = [v3 locationLatitude];
  [v5 doubleValue];
  double v7 = v6;
  v8 = [v3 locationLongitude];
  [v8 doubleValue];
  double v10 = v9;
  v11 = [v3 locationUncertainty];
  [v11 doubleValue];
  double v13 = v12;
  __int16 v14 = [v3 locationDate];
  v15 = [v3 locationReferenceFrame];
  uint64_t v16 = [v4 initWithLatitude:v14 longitude:objc_msgSend(v15, "unsignedIntValue") horizontalUncertainty:v7 date:v10 referenceFrame:v13];

  int v17 = [v3 mapItem];

  v61 = (void *)v16;
  if (v17)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F5CE38];
    v19 = [v3 mapItem];
    v57 = [v18 createWithManagedObject:v19];

    v20 = [v3 finerGranularityMapItem];

    if (v20)
    {
      v21 = (void *)MEMORY[0x1E4F5CE38];
      v22 = [v3 finerGranularityMapItem];
      v55 = [v21 createWithManagedObject:v22];
    }
    else
    {
      v55 = 0;
    }
    id v23 = objc_alloc(MEMORY[0x1E4F5CE70]);
    v54 = [v3 placeInferenceUserType];
    uint64_t v60 = [v54 unsignedIntValue];
    v24 = [v3 placeInferenceUserTypeSource];
    uint64_t v25 = [v24 unsignedIntValue];
    v26 = [v3 placeInferencePlaceType];
    uint64_t v27 = [v26 unsignedIntValue];
    v28 = [v3 placeInferenceConfidence];
    [v28 doubleValue];
    double v30 = v29;
    v31 = [v3 placeInferenceFinerGranularityMapItemConfidence];
    [v31 doubleValue];
    double v33 = v32;
    v34 = [v3 placeInferenceLoiIdentifier];
    v59 = (void *)[v23 initWithMapItem:v57 finerGranularityMapItem:v55 userType:v60 userTypeSource:v25 placeType:v27 referenceLocation:v61 confidence:v30 finerGranularityMapItemConfidence:v33 loiIdentifier:v34];
  }
  else
  {
    v59 = 0;
  }
  id v35 = objc_alloc(MEMORY[0x1E4F5CFC8]);
  v58 = [v3 detectionDate];
  v36 = [v3 type];
  uint64_t v56 = [v36 unsignedIntValue];
  v37 = [v3 entryDate];
  v38 = [v3 exitDate];
  v39 = [v3 dataPointCount];
  uint64_t v40 = [v39 unsignedIntValue];
  v41 = [v3 confidence];
  [v41 doubleValue];
  double v43 = v42;
  v44 = [v3 source];
  v45 = [v35 initWithDate:v58 type:v56 location:v61 entry:v37 exit:v38 dataPointCount:v40 confidence:v43 placeInference:v59 source:[v44 unsignedIntValue]];

  if (v59)
  {
    v46 = [v59 mapItem];

    if (!v46)
    {
      v47 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = [v3 mapItem];
        *(_DWORD *)buf = 138412290;
        id v63 = v48;
        _os_log_impl(&dword_1D9BFA000, v47, OS_LOG_TYPE_INFO, "Corrupted RTAddressMO, %@", buf, 0xCu);
      }
      v49 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        v50 = [v3 mapItem];
        v51 = [v50 address];
        *(_DWORD *)buf = 138412290;
        id v63 = v51;
        _os_log_impl(&dword_1D9BFA000, v49, OS_LOG_TYPE_INFO, "Corrupted RTMapItemMO, %@", buf, 0xCu);
      }
      v52 = _rt_log_facility_get_os_log(RTLogFacilityDatabase);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v63 = v3;
        __int16 v64 = 2112;
        v65 = v45;
        _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, "Corrupted RTVisitMO, %@, was converted to RTVisit, %@", buf, 0x16u);
      }
    }
  }

  return v45;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    id v3 = +[RTVisitMO managedObjectWithVisit:a1 inManagedObjectContext:a3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

@end