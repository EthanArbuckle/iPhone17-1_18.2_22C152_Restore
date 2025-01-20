@interface CLTripSegmentInertialData(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithTripSegmentInertialDataMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation CLTripSegmentInertialData(RTCoreDataTransformable)

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
      v6 = [(id)objc_opt_class() createWithTripSegmentInertialDataMO:v5];

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
      v15 = "+[CLTripSegmentInertialData(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 35;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTTripSegmentInertialData+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)createWithTripSegmentInertialDataMO:()RTCoreDataTransformable
{
  v3 = (objc_class *)MEMORY[0x1E4F1E660];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 timestamp];
  [v4 dataPeriodSec];
  double v8 = v7;
  [v4 deltaCourseRad];
  double v10 = v9;
  [v4 deltaSpeedMps];
  double v12 = v11;
  [v4 deltaCourseVarRad2];
  double v14 = v13;
  [v4 deltaSpeedVarMps2];
  double v16 = v15;
  [v4 deltaCourseSpeedCovRadMps];
  double v18 = v17;

  v19 = (void *)[v5 initWithTime:v6 dataPeriodSec:v8 deltaCourseRad:v10 deltaSpeedMps:v12 deltaCourseVarRad2:v14 deltaSpeedVarMps2:v16 deltaCourseSpeedCovarRadMps:v18];

  return v19;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    v3 = +[RTTripSegmentInertialDataMO managedObjectWithTripSegmentInertialData:a1 inManagedObjectContext:a3];
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