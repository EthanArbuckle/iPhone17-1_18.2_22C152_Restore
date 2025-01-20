@interface CLLocation(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithRTCLLocationMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation CLLocation(RTCoreDataTransformable)

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  id v4 = a3;
  if (v4)
  {
    [a1 coordinate];
    double v29 = v5;
    [a1 coordinate];
    double v7 = v6;
    [a1 altitude];
    double v9 = v8;
    [a1 horizontalAccuracy];
    double v11 = v10;
    [a1 verticalAccuracy];
    double v13 = v12;
    [a1 course];
    double v15 = v14;
    [a1 courseAccuracy];
    double v17 = v16;
    [a1 speed];
    double v19 = v18;
    [a1 speedAccuracy];
    uint64_t v21 = v20;
    v22 = [a1 timestamp];
    v23 = [NSNumber numberWithUnsignedInt:[a1 type]];
    v24 = [NSNumber numberWithUnsignedInt:[a1 signalEnvironmentType]];
    v25 = [NSNumber numberWithUnsignedInt:[a1 integrity]];
    v26 = +[RTCLLocationMO managedObjectWithLatitude:v22 longitude:v23 altitude:v24 horizontalAccuracy:v25 verticalAccuracy:v4 course:v29 courseAccuracy:v7 speed:v9 speedAccuracy:v11 timestamp:v13 type:v15 signalEnvironmentType:v17 integrity:v19 inManagedObjectContext:v21];
  }
  else
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", buf, 2u);
    }

    v26 = 0;
  }

  return v26;
}

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    double v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    LOWORD(v10) = 0;
    double v6 = "Invalid parameter not satisfying: managedObject";
    double v7 = v5;
    uint32_t v8 = 2;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, v6, (uint8_t *)&v10, v8);
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(id)objc_opt_class() createWithRTCLLocationMO:v3];
    goto LABEL_8;
  }
  double v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412802;
    id v11 = v3;
    __int16 v12 = 2080;
    double v13 = "+[CLLocation(RTCoreDataTransformable) createWithManagedObject:]";
    __int16 v14 = 1024;
    int v15 = 31;
    double v6 = "managedObject, %@, is not supported by CLLocation+CoreDataTransformable (in %s:%d)";
    double v7 = v5;
    uint32_t v8 = 28;
    goto LABEL_12;
  }
LABEL_7:

  id v4 = 0;
LABEL_8:

  return v4;
}

+ (id)createWithRTCLLocationMO:()RTCoreDataTransformable
{
  id v3 = a3;
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithRTCLLocationMO:v3];
  }
  else
  {
    double v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v7 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: rtCLLocationMO", v7, 2u);
    }

    id v4 = 0;
  }

  return v4;
}

@end