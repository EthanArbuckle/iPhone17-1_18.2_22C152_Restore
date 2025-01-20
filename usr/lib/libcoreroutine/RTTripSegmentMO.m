@interface RTTripSegmentMO
+ (id)fetchRequest;
+ (id)managedObjectWithTripSegment:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTTripSegmentMO

+ (id)managedObjectWithTripSegment:(id)a3 inManagedObjectContext:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v9 = 0;
      goto LABEL_10;
    }
    LOWORD(v19) = 0;
    v16 = "Invalid parameter not satisfying: tripSegment";
LABEL_14:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v19, 2u);
    goto LABEL_9;
  }
  if (!v6)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    LOWORD(v19) = 0;
    v16 = "Invalid parameter not satisfying: managedObjectContext";
    goto LABEL_14;
  }
  v8 = _rt_log_facility_get_os_log(RTLogFacilityTripSegment);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v18 = [v5 identifier];
    int v19 = 138412290;
    v20 = v18;
    _os_log_debug_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_DEBUG, "RTTripSegmentMO: invoked managedObjectWithTripSegment on UUID %@", (uint8_t *)&v19, 0xCu);
  }
  v9 = [[RTTripSegmentMO alloc] initWithContext:v7];
  v10 = [v5 identifier];
  [(RTTripSegmentMO *)v9 setIdentifier:v10];

  v11 = [v5 dateInterval];
  v12 = [v11 startDate];
  [(RTTripSegmentMO *)v9 setStartDate:v12];

  v13 = [v5 dateInterval];
  v14 = [v13 endDate];
  [(RTTripSegmentMO *)v9 setEndDate:v14];

  [v5 tripDistance];
  -[RTTripSegmentMO setTripDistance_m:](v9, "setTripDistance_m:");
  [v5 tripDistanceUncertainty];
  -[RTTripSegmentMO setTripDistanceUncertainty_m:](v9, "setTripDistanceUncertainty_m:");
  -[RTTripSegmentMO setModeOfTransportation:](v9, "setModeOfTransportation:", (__int16)[v5 modeOfTransportation]);
LABEL_10:

  return v9;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTTripSegmentMO"];
}

@end