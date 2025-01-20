@interface RTElevation(RTCoreDataTransformable)
+ (id)createWithElevationMO:()RTCoreDataTransformable;
+ (id)createWithManagedObject:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation RTElevation(RTCoreDataTransformable)

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
      v6 = [(id)objc_opt_class() createWithElevationMO:v5];

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
      v15 = "+[RTElevation(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 36;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTElevation+CoreDataTransformable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)createWithElevationMO:()RTCoreDataTransformable
{
  id v3 = a3;
  id v4 = [v3 startDate];

  if (v4)
  {
    id v5 = [v3 startDate];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1C9C8];
    v7 = [v3 startDate];
    id v5 = [v6 dateWithTimeInterval:v7 sinceDate:-2.56];
  }
  id v8 = objc_alloc(MEMORY[0x1E4F28C18]);
  v9 = [v3 endDate];
  int v10 = (void *)[v8 initWithStartDate:v5 endDate:v9];

  v11 = [v3 startDate];

  id v12 = objc_alloc(MEMORY[0x1E4F5CDC0]);
  [v3 elevation];
  double v14 = v13;
  if (v11)
  {
    [v3 elevationUncertainty];
    uint64_t v16 = [v12 initWithElevation:v10 dateInterval:(int)[v3 estimationStatus] elevationUncertainty:v14 estimationStatus:v15];
  }
  else
  {
    uint64_t v16 = [v12 initWithElevation:v10 dateInterval:v13];
  }
  int v17 = (void *)v16;

  return v17;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    id v3 = +[RTElevationMO managedObjectWithElevation:a1 inManagedObjectContext:a3];
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