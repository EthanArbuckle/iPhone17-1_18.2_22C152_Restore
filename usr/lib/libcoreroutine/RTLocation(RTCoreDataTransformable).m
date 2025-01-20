@interface RTLocation(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithMapItemMO:()RTCoreDataTransformable;
@end

@implementation RTLocation(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [(id)objc_opt_class() createWithMapItemMO:v3];
      goto LABEL_8;
    }
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2080;
      v10 = "+[RTLocation(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v11 = 1024;
      int v12 = 32;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTLocation+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v4 = 0;
LABEL_8:

  return v4;
}

+ (id)createWithMapItemMO:()RTCoreDataTransformable
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5CE00]);
    v5 = [v3 latitude];
    [v5 doubleValue];
    double v7 = v6;
    id v8 = [v3 longitude];
    [v8 doubleValue];
    double v10 = v9;
    __int16 v11 = [v3 uncertainty];
    [v11 doubleValue];
    double v13 = v12;
    v14 = [v3 creationDate];
    v15 = [v3 referenceFrame];
    v16 = [v4 initWithLatitude:v14 longitude:objc_msgSend(v15, "intValue") horizontalUncertainty:v7 date:v10 referenceFrame:v13];
  }
  else
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: mapItemMO", v19, 2u);
    }

    v16 = 0;
  }

  return v16;
}

@end