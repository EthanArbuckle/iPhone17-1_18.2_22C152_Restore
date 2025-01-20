@interface CLBackgroundInertialOdometrySample(RTCoreDataTransformable)
+ (id)createWithManagedObject:()RTCoreDataTransformable;
+ (id)createWithTripSegmentInertialDataMO:()RTCoreDataTransformable;
- (id)managedObjectWithContext:()RTCoreDataTransformable;
@end

@implementation CLBackgroundInertialOdometrySample(RTCoreDataTransformable)

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
      v15 = "+[CLBackgroundInertialOdometrySample(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 36;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by CLBackgroundInertialOdometrySample+CoreDataTransformable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  v6 = 0;
LABEL_8:

  return v6;
}

+ (id)createWithTripSegmentInertialDataMO:()RTCoreDataTransformable
{
  v3 = (objc_class *)MEMORY[0x1E4F1E598];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = [v4 cfAbsTimestamp];
  [v4 machContinuousTimestamp_s];
  double v8 = v7;
  [v4 sampleInterval_s];
  double v10 = v9;
  id v11 = objc_alloc(MEMORY[0x1E4F1E580]);
  [v4 deltaPositionX_m];
  double v13 = v12;
  [v4 deltaPositionY_m];
  double v15 = v14;
  [v4 deltaPositionZ_m];
  int v17 = (void *)[v11 initWithX:v13 Y:v15 Z:v16];
  id v18 = objc_alloc(MEMORY[0x1E4F1E588]);
  [v4 deltaVelocityX_mps];
  double v20 = v19;
  [v4 deltaVelocityY_mps];
  double v22 = v21;
  [v4 deltaVelocityZ_mps];
  v24 = (void *)[v18 initWithX:v20 Y:v22 Z:v23];
  id v25 = objc_alloc(MEMORY[0x1E4F1E590]);
  [v4 quaternionX];
  double v27 = v26;
  [v4 quaternionY];
  double v29 = v28;
  [v4 quaternionZ];
  double v31 = v30;
  [v4 quaternionW];
  double v33 = v32;

  v34 = (void *)[v25 initWithX:v27 Y:v29 Z:v31 W:v33];
  v35 = (void *)[v5 initWithTimestamp:v6 machContinuousTimestamp:v17 sampleInterval:v24 deltaPosition:v34 deltaVelocity:v8 quaternion:v10];

  return v35;
}

- (id)managedObjectWithContext:()RTCoreDataTransformable
{
  if (a3)
  {
    v3 = +[RTBackgroundInertialOdometrySampleMO managedObjectWithCLBackgroundInertialOdometrySample:a1 inManagedObjectContext:a3];
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