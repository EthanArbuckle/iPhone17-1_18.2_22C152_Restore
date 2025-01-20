@interface RTVehicle(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithVehicleMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation RTVehicle(RTCoreDataTransformable)

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
      v6 = [(id)objc_opt_class() createWithVehicleMO:v5];

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
      v15 = "+[RTVehicle(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 31;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTVehicle+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)createWithVehicleMO:()RTCoreDataTransformable
{
  v3 = (objc_class *)MEMORY[0x1E4F5CFB8];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v6 = objc_alloc(MEMORY[0x1E4F28C18]);
  v7 = [v4 startDate];
  v8 = [v4 endDate];
  v9 = (void *)[v6 initWithStartDate:v7 endDate:v8];
  int v10 = [v4 vehicleName];
  v11 = [v4 vehicleModelName];
  __int16 v12 = [v4 bluetoothAddress];

  id v13 = (void *)[v5 initWithDateInterval:v9 vehicleName:v10 vehicleModelName:v11 bluetoothAddress:v12];

  return v13;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    v3 = +[RTVehicleMO managedObjectWithVehicle:a1 inManagedObjectContext:a3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    v3 = 0;
  }

  return v3;
}

@end