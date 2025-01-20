@interface RTPlaceInferenceQuery(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithPlaceInferenceQueryMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation RTPlaceInferenceQuery(RTCoreDataTransformable)

+ (id)createWithPlaceInferenceQueryMO:()RTCoreDataTransformable
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [v3 locationLatitude];
  double v6 = v5;
  [v3 locationLongitude];
  double v8 = v7;
  [v3 locationUncertainty];
  double v10 = v9;
  v11 = [v3 locationDate];
  v12 = [v3 locationReferenceFrame];
  uint64_t v13 = [v4 initWithLatitude:v11 longitude:objc_msgSend(v12, "intValue") horizontalUncertainty:v6 date:v8 referenceFrame:v10];

  v14 = [v3 mapItem];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F5CE38];
    v16 = [v3 mapItem];
    v14 = [v15 createWithManagedObject:v16];
  }
  id v17 = objc_alloc(MEMORY[0x1E4F5CE70]);
  v18 = [v3 userType];
  uint64_t v19 = [v18 unsignedIntegerValue];
  v20 = [v3 userTypeSource];
  uint64_t v21 = [v20 unsignedIntegerValue];
  v22 = [v3 placeType];
  uint64_t v23 = [v22 unsignedIntegerValue];
  [v3 confidence];
  v36 = [v17 initWithMapItem:v14 userType:v19 userTypeSource:v21 placeType:v23 referenceLocation:v13 confidence:0 loiIdentifier:];

  id v24 = objc_alloc(MEMORY[0x1E4F5CE80]);
  v25 = [v3 identifier];
  v26 = [v3 date];
  v27 = [v3 errorCode];
  uint64_t v28 = [v27 integerValue];
  v29 = [v3 fidelityPolicyMask];
  v35 = (void *)v13;
  uint64_t v30 = [v29 unsignedIntegerValue];
  [v3 sourceIdentifier];
  v32 = v31 = v14;
  v33 = (void *)[v24 initWithIdentifier:v25 date:v26 errorCode:v28 fidelityPolicyMask:v30 placeInference:v36 sourceIdentifier:v32];

  return v33;
}

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
      double v6 = [(id)objc_opt_class() createWithPlaceInferenceQueryMO:v5];

      goto LABEL_8;
    }
    double v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      double v9 = NSStringFromSelector(a2);
      int v10 = 138413058;
      v11 = v9;
      __int16 v12 = 2112;
      __int16 v14 = 2080;
      id v13 = v4;
      v15 = "+[RTPlaceInferenceQuery(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 36;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTPlaceInferenceQuery+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  double v6 = 0;
LABEL_8:

  return v6;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    id v3 = +[RTPlaceInferenceQueryMO managedObjectWithPlaceInferenceQuery:a1 inManagedObjectContext:a3];
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