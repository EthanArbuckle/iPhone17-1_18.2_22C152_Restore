@interface RTSynthesizedLocationMO
+ (id)fetchRequest;
+ (id)managedObjectWithSynthesizedLocation:(id)a3 inManagedObjectContext:(id)a4;
@end

@implementation RTSynthesizedLocationMO

+ (id)managedObjectWithSynthesizedLocation:(id)a3 inManagedObjectContext:(id)a4
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
    v12 = "Invalid parameter not satisfying: synthesizedLocation";
    v13 = (uint8_t *)&v16;
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, v12, v13, 2u);
    goto LABEL_7;
  }
  if (v6)
  {
    v8 = [[RTSynthesizedLocationMO alloc] initWithContext:v6];
    [v5 coordinate];
    -[RTSynthesizedLocationMO setLatitude:](v8, "setLatitude:");
    [v5 coordinate];
    [(RTSynthesizedLocationMO *)v8 setLongitude:v9];
    [v5 altitude];
    -[RTSynthesizedLocationMO setAltitude:](v8, "setAltitude:");
    [v5 horizontalAccuracy];
    -[RTSynthesizedLocationMO setHorizontalAccuracy:](v8, "setHorizontalAccuracy:");
    [v5 verticalAccuracy];
    -[RTSynthesizedLocationMO setVerticalAccuracy:](v8, "setVerticalAccuracy:");
    [v5 speed];
    -[RTSynthesizedLocationMO setSpeed:](v8, "setSpeed:");
    [v5 course];
    -[RTSynthesizedLocationMO setCourse:](v8, "setCourse:");
    [v5 speedAccuracy];
    -[RTSynthesizedLocationMO setSpeedAccuracy:](v8, "setSpeedAccuracy:");
    [v5 courseAccuracy];
    -[RTSynthesizedLocationMO setCourseAccuracy:](v8, "setCourseAccuracy:");
    v10 = [v5 timestamp];
    [(RTSynthesizedLocationMO *)v8 setTimestamp:v10];

    -[RTSynthesizedLocationMO setDownsamplingLevel:](v8, "setDownsamplingLevel:", (__int16)[v5 downsamplingLevel]);
    -[RTSynthesizedLocationMO setGeoRoadClass:](v8, "setGeoRoadClass:", (__int16)[v5 geoRoadClass]);
    -[RTSynthesizedLocationMO setGeoFormOfWay:](v8, "setGeoFormOfWay:", (__int16)[v5 geoFormOfWay]);
    -[RTSynthesizedLocationMO setLocationType:](v8, "setLocationType:", (__int16)[v5 locationType]);
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
  return (id)[MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"RTSynthesizedLocationMO"];
}

@end