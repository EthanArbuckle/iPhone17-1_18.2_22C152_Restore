@interface RTLocationOfInterestVisit(RTCoreDataTransformable)
+ (id)createWithLearnedLocationOfInterestVisitMO:()RTCoreDataTransformable;
+ (id)createWithManagedObject:()RTCoreDataTransformable;
@end

@implementation RTLocationOfInterestVisit(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [(id)objc_opt_class() createWithLearnedLocationOfInterestVisitMO:v3];
      goto LABEL_8;
    }
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2080;
      v10 = "+[RTLocationOfInterestVisit(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v11 = 1024;
      int v12 = 33;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLocationOfInterestVisit+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v4 = 0;
LABEL_8:

  return v4;
}

+ (id)createWithLearnedLocationOfInterestVisitMO:()RTCoreDataTransformable
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5CE00]);
    v5 = [v3 locationLatitude];
    [v5 doubleValue];
    double v7 = v6;
    id v8 = [v3 locationLongitude];
    [v8 doubleValue];
    double v10 = v9;
    __int16 v11 = [v3 locationHorizontalUncertainty];
    [v11 doubleValue];
    double v13 = v12;
    v14 = [v3 locationAltitude];
    [v14 doubleValue];
    double v16 = v15;
    v17 = [v3 locationVerticalUncertainty];
    [v17 doubleValue];
    double v19 = v18;
    v20 = [v3 locationReferenceFrame];
    uint64_t v21 = [v20 intValue];
    v22 = [v3 locationSourceAccuracy];
    v23 = [v4 initWithLatitude:0 longitude:v21 horizontalUncertainty:(int)objc_msgSend(v22, "intValue") altitude:v7 verticalUncertainty:v10 date:v13 referenceFrame:v16 speed:v19 sourceAccuracy:0.0];

    if (v23)
    {
      id v24 = objc_alloc(MEMORY[0x1E4F5CE28]);
      v25 = [v3 identifier];
      v26 = [v3 entryDate];
      v27 = [v3 exitDate];
      v28 = [v3 locationOfInterestConfidence];
      [v28 doubleValue];
      double v30 = v29;
      v31 = [v3 locationOfInterestSource];
      v32 = [v24 initWithIdentifier:v25 entry:v26 exit:v27 location:v23 locationOfInterestConfidence:[v31 unsignedIntegerValue] locationOfInterestSource:v30];
    }
    else
    {
      v32 = 0;
    }
  }
  else
  {
    v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v35 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: learnedLocationOfInterestVisitMO", v35, 2u);
    }

    v32 = 0;
  }

  return v32;
}

@end