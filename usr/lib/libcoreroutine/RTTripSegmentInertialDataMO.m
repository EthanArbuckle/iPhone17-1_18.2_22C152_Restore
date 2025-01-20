@interface RTTripSegmentInertialDataMO
+ (id)fetchRequest;
+ (id)managedObjectWithTripSegmentInertialData:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTTripSegmentInertialDataMO

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTTripSegmentInertialDataMO"];
}

+ (id)managedObjectWithTripSegmentInertialData:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v15 = 0;
    v11 = "Invalid parameter not satisfying: inertialData";
    v12 = (uint8_t *)&v15;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = [[RTTripSegmentInertialDataMO alloc] initWithContext:v6];
    v9 = [v5 timestamp];
    [(RTTripSegmentInertialDataMO *)v8 setTimestamp:v9];

    [v5 dataPeriod_s];
    -[RTTripSegmentInertialDataMO setDataPeriodSec:](v8, "setDataPeriodSec:");
    [v5 deltaCourse_rad];
    -[RTTripSegmentInertialDataMO setDeltaCourseRad:](v8, "setDeltaCourseRad:");
    [v5 deltaSpeed_mps];
    -[RTTripSegmentInertialDataMO setDeltaSpeedMps:](v8, "setDeltaSpeedMps:");
    [v5 deltaCourseVar_rad2];
    -[RTTripSegmentInertialDataMO setDeltaCourseVarRad2:](v8, "setDeltaCourseVarRad2:");
    [v5 deltaSpeedVar_mps2];
    -[RTTripSegmentInertialDataMO setDeltaSpeedVarMps2:](v8, "setDeltaSpeedVarMps2:");
    [v5 deltaCourseSpeedCovar_radmps];
    -[RTTripSegmentInertialDataMO setDeltaCourseSpeedCovRadMps:](v8, "setDeltaCourseSpeedCovRadMps:");
    goto LABEL_8;
  }
  v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    __int16 v14 = 0;
    v11 = "Invalid parameter not satisfying: managedObjectContext";
    v12 = (uint8_t *)&v14;
    goto LABEL_12;
  }
LABEL_7:

  v8 = 0;
LABEL_8:

  return v8;
}

@end