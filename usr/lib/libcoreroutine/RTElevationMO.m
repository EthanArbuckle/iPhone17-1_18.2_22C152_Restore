@interface RTElevationMO
+ (id)fetchRequest;
+ (id)managedObjectWithElevation:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTElevationMO

+ (id)managedObjectWithElevation:(id)a3 inManagedObjectContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    __int16 v16 = 0;
    v12 = "Invalid parameter not satisfying: elevation";
    v13 = (uint8_t *)&v16;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = [[RTElevationMO alloc] initWithContext:v6];
    [v5 elevation];
    -[RTElevationMO setElevation:](v8, "setElevation:");
    v9 = [v5 startDate];
    [(RTElevationMO *)v8 setStartDate:v9];

    v10 = [v5 endDate];
    [(RTElevationMO *)v8 setEndDate:v10];

    [v5 elevationUncertainty];
    -[RTElevationMO setElevationUncertainty:](v8, "setElevationUncertainty:");
    -[RTElevationMO setEstimationStatus:](v8, "setEstimationStatus:", (__int16)[v5 estimationStatus]);
    goto LABEL_8;
  }
  v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    __int16 v15 = 0;
    v12 = "Invalid parameter not satisfying: managedObjectContext";
    v13 = (uint8_t *)&v15;
    goto LABEL_12;
  }
LABEL_7:

  v8 = 0;
LABEL_8:

  return v8;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTElevationMO"];
}

@end