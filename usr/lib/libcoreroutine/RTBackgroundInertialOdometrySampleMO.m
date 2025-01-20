@interface RTBackgroundInertialOdometrySampleMO
+ (id)fetchRequest;
+ (id)managedObjectWithCLBackgroundInertialOdometrySample:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTBackgroundInertialOdometrySampleMO

+ (id)managedObjectWithCLBackgroundInertialOdometrySample:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v25 = 0;
    v21 = "Invalid parameter not satisfying: ioSample";
    v22 = (uint8_t *)&v25;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_ERROR, v21, v22, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = [[RTBackgroundInertialOdometrySampleMO alloc] initWithContext:v6];
    v9 = [v5 cfAbsTimestamp];
    [(RTBackgroundInertialOdometrySampleMO *)v8 setCfAbsTimestamp:v9];

    [v5 machContinuousTimestamp_s];
    -[RTBackgroundInertialOdometrySampleMO setMachContinuousTimestamp_s:](v8, "setMachContinuousTimestamp_s:");
    [v5 sampleInterval_s];
    -[RTBackgroundInertialOdometrySampleMO setSampleInterval_s:](v8, "setSampleInterval_s:");
    v10 = [v5 deltaPosition_m];
    [v10 X];
    -[RTBackgroundInertialOdometrySampleMO setDeltaPositionX_m:](v8, "setDeltaPositionX_m:");

    v11 = [v5 deltaPosition_m];
    [v11 Y];
    -[RTBackgroundInertialOdometrySampleMO setDeltaPositionY_m:](v8, "setDeltaPositionY_m:");

    v12 = [v5 deltaPosition_m];
    [v12 Z];
    -[RTBackgroundInertialOdometrySampleMO setDeltaPositionZ_m:](v8, "setDeltaPositionZ_m:");

    v13 = [v5 deltaVelocity_mps];
    [v13 X];
    -[RTBackgroundInertialOdometrySampleMO setDeltaVelocityX_mps:](v8, "setDeltaVelocityX_mps:");

    v14 = [v5 deltaVelocity_mps];
    [v14 Y];
    -[RTBackgroundInertialOdometrySampleMO setDeltaVelocityY_mps:](v8, "setDeltaVelocityY_mps:");

    v15 = [v5 deltaVelocity_mps];
    [v15 Z];
    -[RTBackgroundInertialOdometrySampleMO setDeltaVelocityZ_mps:](v8, "setDeltaVelocityZ_mps:");

    v16 = [v5 quaternion];
    [v16 X];
    -[RTBackgroundInertialOdometrySampleMO setQuaternionX:](v8, "setQuaternionX:");

    v17 = [v5 quaternion];
    [v17 Y];
    -[RTBackgroundInertialOdometrySampleMO setQuaternionY:](v8, "setQuaternionY:");

    v18 = [v5 quaternion];
    [v18 Z];
    -[RTBackgroundInertialOdometrySampleMO setQuaternionZ:](v8, "setQuaternionZ:");

    v19 = [v5 quaternion];
    [v19 W];
    -[RTBackgroundInertialOdometrySampleMO setQuaternionW:](v8, "setQuaternionW:");

    goto LABEL_8;
  }
  v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    __int16 v24 = 0;
    v21 = "Invalid parameter not satisfying: managedObjectContext";
    v22 = (uint8_t *)&v24;
    goto LABEL_12;
  }
LABEL_7:

  v8 = 0;
LABEL_8:

  return v8;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTBackgroundInertialOdometrySampleMO"];
}

@end