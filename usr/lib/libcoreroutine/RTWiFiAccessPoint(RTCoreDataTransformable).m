@interface RTWiFiAccessPoint(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithWiFiAccessPointMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation RTWiFiAccessPoint(RTCoreDataTransformable)

+ (id)createWithManagedObject:()RTCoreDataTransformable
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [(id)objc_opt_class() createWithWiFiAccessPointMO:v3];
      goto LABEL_8;
    }
    v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412802;
      id v8 = v3;
      __int16 v9 = 2080;
      v10 = "+[RTWiFiAccessPoint(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v11 = 1024;
      int v12 = 31;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "managedObject, %@, is not supported by RTWiFiAccessPoint+CoreDataTransformable (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }
  }
  v4 = 0;
LABEL_8:

  return v4;
}

+ (id)createWithWiFiAccessPointMO:()RTCoreDataTransformable
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5CFD0]);
    v5 = [v3 mac];
    v6 = [v3 rssi];
    uint64_t v7 = [v6 integerValue];
    id v8 = [v3 channel];
    uint64_t v9 = [v8 integerValue];
    v10 = [v3 age];
    [v10 doubleValue];
    double v12 = v11;
    uint64_t v13 = [v3 date];
    v14 = (void *)[v4 initWithMac:v5 rssi:v7 channel:v9 age:v13 date:v12];
  }
  else
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiAccessPointMO", v17, 2u);
    }

    v14 = 0;
  }

  return v14;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    id v3 = +[RTWiFiAccessPointMO managedObjectWithAccessPoint:a1 inManagedObjectContext:a3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

@end