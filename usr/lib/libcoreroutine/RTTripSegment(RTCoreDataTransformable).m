@interface RTTripSegment(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithTripSegmentMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation RTTripSegment(RTCoreDataTransformable)

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
      v6 = [(id)objc_opt_class() createWithTripSegmentMO:v5];

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
      v15 = "+[RTTripSegment(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 31;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTTripSegment+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)createWithTripSegmentMO:()RTCoreDataTransformable
{
  v3 = (objc_class *)MEMORY[0x1E4F5CF78];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 identifier];
  id v7 = objc_alloc(MEMORY[0x1E4F28C18]);
  v8 = [v4 startDate];
  v9 = [v4 endDate];
  int v10 = (void *)[v7 initWithStartDate:v8 endDate:v9];
  [v4 tripDistance_m];
  double v12 = v11;
  [v4 tripDistanceUncertainty_m];
  double v14 = v13;
  int v15 = [v4 modeOfTransportation];

  __int16 v16 = (void *)[v5 initWithTripSegmentIdentifier:v6 dateInterval:v10 tripDistance:v15 tripDistanceUncertainty:v12 modeOfTransportation:v14];

  return v16;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    v3 = +[RTTripSegmentMO managedObjectWithTripSegment:a1 inManagedObjectContext:a3];
  }
  else
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    v3 = 0;
  }

  return v3;
}

@end