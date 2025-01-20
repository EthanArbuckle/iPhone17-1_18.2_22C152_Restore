@interface RTLocation(RTExtensions)
+ (uint64_t)convertLocationReferenceFrame:()RTExtensions;
- (double)distanceFromLocation:()RTExtensions locationShifter:error:;
- (id)initWithCLCircularRegion:()RTExtensions;
- (id)initWithCLLocation:()RTExtensions;
- (id)initWithCLLocationCoordinate2D:()RTExtensions;
- (id)initWithRTPair:()RTExtensions;
- (id)locationAtDistance:()RTExtensions course:;
- (uint64_t)initWithRTPLocation:()RTExtensions;
- (void)_distanceBetweenShiftedLocation:()RTExtensions unshiftedLocation:locationShifter:handler:;
- (void)distanceFromLocation:()RTExtensions locationShifter:handler:;
@end

@implementation RTLocation(RTExtensions)

- (id)initWithCLLocation:()RTExtensions
{
  if (a3)
  {
    id v4 = a3;
    if ([v4 type] == 1) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = 1;
    }
    [v4 coordinate];
    double v7 = v6;
    [v4 coordinate];
    double v9 = v8;
    [v4 horizontalAccuracy];
    double v11 = v10;
    [v4 altitude];
    double v13 = v12;
    [v4 verticalAccuracy];
    double v15 = v14;
    v16 = [v4 timestamp];
    uint64_t v17 = [v4 referenceFrame];
    [v4 speed];
    double v19 = v18;

    a1 = (id)[a1 initWithLatitude:v16 longitude:v17 horizontalUncertainty:v5 altitude:v7 verticalUncertainty:v9 date:v11 referenceFrame:v13 speed:v15 sourceAccuracy:v19];
    id v20 = a1;
  }
  else
  {
    id v20 = 0;
  }

  return v20;
}

- (void)distanceFromLocation:()RTExtensions locationShifter:handler:
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  double v11 = a5;
  if (v11)
  {
    if (v9)
    {
      BOOL v12 = [a1 referenceFrame] != 2;
      if ((v12 ^ ([v9 referenceFrame] == 2)))
      {
        [a1 latitude];
        [a1 longitude];
        [v9 latitude];
        [v9 longitude];
        RTCommonCalculateDistanceHighPrecision();
        v11[2](v11, 0);
      }
      else
      {
        double v18 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          double v19 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v32 = v19;
          __int16 v33 = 1024;
          int v34 = [a1 referenceFrame];
          __int16 v35 = 1024;
          int v36 = [v9 referenceFrame];
          _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "%@, reference frames don't match, self.referenceFrame, %d, location.referenceFrame, %d", buf, 0x18u);
        }
        if (v10)
        {
          if ([a1 referenceFrame] == 2)
          {
            id v20 = a1;
            id v21 = a1;
            id v22 = v9;
          }
          else
          {
            id v20 = a1;
            id v21 = v9;
            id v22 = a1;
          }
          [v20 _distanceBetweenShiftedLocation:v21 unshiftedLocation:v22 locationShifter:v10 handler:v11];
        }
        else
        {
          v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v24 = *MEMORY[0x1E4F5CFE8];
          uint64_t v29 = *MEMORY[0x1E4F28568];
          v30 = @"Reference frames do not match and we do not have a location shifter.";
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          v26 = [v23 errorWithDomain:v24 code:6 userInfo:v25];
          ((void (*)(void (**)(id, void), void *, double))v11[2])(v11, v26, INFINITY);

          v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v28 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v32 = v28;
            _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "%@, Unable to shift, no location shifter", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      double v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F5CFE8];
      uint64_t v37 = *MEMORY[0x1E4F28568];
      v38[0] = @"Location is required.";
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
      uint64_t v17 = [v14 errorWithDomain:v15 code:7 userInfo:v16];
      ((void (*)(void (**)(id, void), void *, double))v11[2])(v11, v17, INFINITY);
    }
  }
  else
  {
    double v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[RTLocation(RTExtensions) distanceFromLocation:locationShifter:handler:]";
      __int16 v33 = 1024;
      int v34 = 173;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
}

+ (uint64_t)convertLocationReferenceFrame:()RTExtensions
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (uint64_t)initWithRTPLocation:()RTExtensions
{
  id v4 = a3;
  [v4 latitude];
  double v6 = v5;
  [v4 longitude];
  double v8 = v7;
  [v4 uncertainty];
  double v10 = v9;
  double v11 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 timestamp];
  BOOL v12 = [v11 dateWithTimeIntervalSinceReferenceDate:];
  uint64_t v13 = [MEMORY[0x1E4F5CE00] convertLocationReferenceFrame:[v4 referenceFrame]];
  [v4 speed];
  double v15 = v14;

  uint64_t v16 = [a1 initWithLatitude:v12 longitude:v13 horizontalUncertainty:v6 altitude:v8 verticalUncertainty:v10 date:-1.0 referenceFrame:-1.0 speed:v15];
  return v16;
}

- (id)initWithRTPair:()RTExtensions
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    double v6 = [v4 firstObject];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v15 = 0;
      goto LABEL_7;
    }
    double v7 = [v5 secondObject];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v6 = [v5 firstObject];
      [v6 doubleValue];
      double v10 = v9;
      double v11 = [v5 secondObject];
      [v11 doubleValue];
      double v13 = v12;
      double v14 = [MEMORY[0x1E4F1C9C8] date];
      a1 = (id)[a1 initWithLatitude:v14 longitude:v10 horizontalUncertainty:v13 date:0.0];

      id v15 = a1;
LABEL_7:

      goto LABEL_8;
    }
  }
  id v15 = 0;
LABEL_8:

  return v15;
}

- (id)initWithCLLocationCoordinate2D:()RTExtensions
{
  if (a3)
  {
    double v4 = *a3;
    double v5 = a3[1];
    double v6 = [MEMORY[0x1E4F1C9C8] date];
    a1 = (id)[a1 initWithLatitude:v6 longitude:v4 horizontalUncertainty:v5 date:0.0];

    id v7 = a1;
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)initWithCLCircularRegion:()RTExtensions
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    [v4 geoCenter];
    double v7 = v6;
    [v5 geoCenter];
    double v9 = v8;
    [v5 geoRadius];
    a1 = (id)[a1 initWithLatitude:0 longitude:objc_msgSend(v5, "geoReferenceFrame") horizontalUncertainty:v7 date:v9 referenceFrame:v10];
    id v11 = a1;
  }
  else
  {
    double v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 0;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: region", (uint8_t *)v14, 2u);
    }

    id v11 = 0;
  }

  return v11;
}

- (double)distanceFromLocation:()RTExtensions locationShifter:error:
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    if (a5)
    {
      double v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v15 = *MEMORY[0x1E4F5CFE8];
      uint64_t v50 = *MEMORY[0x1E4F28568];
      v51[0] = @"Location is required.";
      uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
      *a5 = [v14 errorWithDomain:v15 code:7 userInfo:v16];
    }
    goto LABEL_16;
  }
  BOOL v11 = [a1 referenceFrame] != 2;
  if ((v11 ^ ([v9 referenceFrame] == 2)))
  {
    [a1 latitude];
    [a1 longitude];
    [v9 latitude];
    [v9 longitude];
    RTCommonCalculateDistanceHighPrecision();
    double v13 = v12;
    goto LABEL_26;
  }
  uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    __int16 v35 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v45 = v35;
    __int16 v46 = 1024;
    int v47 = [a1 referenceFrame];
    __int16 v48 = 1024;
    int v49 = [v9 referenceFrame];
    _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "%@, reference frames don't match, self.referenceFrame, %d, location.referenceFrame, %d", buf, 0x18u);
  }
  if (!v10)
  {
    if (a5)
    {
      v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F5CFE8];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43 = @"Reference frames do not match and we do not have a location shifter.";
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
      *a5 = [v23 errorWithDomain:v24 code:6 userInfo:v25];
    }
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
      uint64_t v37 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v45 = v37;
      _os_log_fault_impl(&dword_1D9BFA000, v26, OS_LOG_TYPE_FAULT, "%@, Unable to shift, no location shifter", buf, 0xCu);
    }
LABEL_16:
    double v13 = INFINITY;
    goto LABEL_26;
  }
  id v18 = a1;
  id v19 = v9;
  if ([v18 referenceFrame] == 2)
  {
    v38 = 0;
    uint64_t v20 = [v10 shiftedLocation:v19 allowNetwork:0 error:&v38];
    id v21 = v19;
    id v22 = v38;
    id v19 = (id)v20;
  }
  else
  {
    v39 = 0;
    uint64_t v27 = [v10 shiftedLocation:v18 allowNetwork:0 error:&v39];
    id v21 = v18;
    id v22 = v39;
    id v18 = (id)v27;
  }
  id v28 = v22;

  if (v28)
  {
    if (a5)
    {
      uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F5CFE8];
      uint64_t v40 = *MEMORY[0x1E4F28568];
      v41 = @"Reference frames do not match and we encounted an error when trying to shift.";
      v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      *a5 = [v29 errorWithDomain:v30 code:6 userInfo:v31];
    }
    v32 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      int v36 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v45 = v36;
      _os_log_error_impl(&dword_1D9BFA000, v32, OS_LOG_TYPE_ERROR, "%@, Unable to shift, location shifter error", buf, 0xCu);
    }
    double v13 = INFINITY;
  }
  else
  {
    [v18 latitude];
    [v18 longitude];
    [v19 latitude];
    [v19 longitude];
    RTCommonCalculateDistanceHighPrecision();
    double v13 = v33;
  }

LABEL_26:
  return v13;
}

- (void)_distanceBetweenShiftedLocation:()RTExtensions unshiftedLocation:locationShifter:handler:
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  [v13 latitude];
  CLLocationDegrees v15 = v14;
  [v13 longitude];
  CLLocationCoordinate2D v17 = CLLocationCoordinate2DMake(v15, v16);
  [v13 horizontalUncertainty];
  double v19 = v18;

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__RTLocation_RTExtensions___distanceBetweenShiftedLocation_unshiftedLocation_locationShifter_handler___block_invoke;
  v22[3] = &unk_1E6B978A0;
  id v24 = v11;
  uint64_t v25 = a2;
  id v23 = v10;
  id v20 = v10;
  id v21 = v11;
  [v12 shiftCoordinate:v22 accuracy:v17.latitude, v17.longitude handler:v19];
}

- (id)locationAtDistance:()RTExtensions course:
{
  double v6 = [MEMORY[0x1E4F1C9C8] date];
  id v7 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  [a1 latitude];
  CLLocationDegrees v9 = v8;
  [a1 longitude];
  CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v9, v10);
  [a1 horizontalUncertainty];
  id v13 = [v7 initWithCoordinate:v6 altitude:v11.latitude horizontalAccuracy:v11.longitude verticalAccuracy:0.0 course:v12 speed:a3 timestamp:a2];
  double v14 = [v13 propagateLocationToTime:1.0];
  id v15 = objc_alloc(MEMORY[0x1E4F5CE00]);
  [v14 coordinate];
  double v17 = v16;
  [v14 coordinate];
  double v19 = v18;
  [a1 horizontalUncertainty];
  double v21 = v20;
  id v22 = [a1 date];
  id v23 = [v15 initWithLatitude:v22 longitude:objc_msgSend(a1, "referenceFrame") horizontalUncertainty:v17 date:v19 referenceFrame:v21];

  return v23;
}

@end