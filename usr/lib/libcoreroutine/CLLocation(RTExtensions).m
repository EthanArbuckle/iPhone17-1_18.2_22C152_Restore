@interface CLLocation(RTExtensions)
- (id)initWithRTCLLocationMO:()RTExtensions;
- (id)initWithRTLocation:()RTExtensions;
- (id)initWithRTLocation:()RTExtensions speed:;
- (id)initWithRTLocation:()RTExtensions speed:type:signalEnvironmentType:integrity:;
- (id)initWithRTLocationOfInterest:()RTExtensions;
- (id)toString;
- (id)toVerboseString;
- (uint64_t)coordinateToString;
- (uint64_t)initWithRTLocation:()RTExtensions speed:type:;
- (uint64_t)initWithRTLocation:()RTExtensions speed:type:signalEnvironmentType:;
- (uint64_t)initWithRTPLocation:()RTExtensions;
- (uint64_t)initWithSMInitiatorLocation:()RTExtensions;
- (uint64_t)initWithSMLocation:()RTExtensions;
@end

@implementation CLLocation(RTExtensions)

- (id)toString
{
  v2 = NSString;
  [a1 coordinate];
  uint64_t v24 = v3;
  [a1 coordinate];
  uint64_t v5 = v4;
  [a1 horizontalAccuracy];
  uint64_t v7 = v6;
  [a1 altitude];
  uint64_t v9 = v8;
  [a1 verticalAccuracy];
  uint64_t v11 = v10;
  [a1 speed];
  uint64_t v13 = v12;
  [a1 speedAccuracy];
  uint64_t v15 = v14;
  [a1 course];
  uint64_t v17 = v16;
  [a1 courseAccuracy];
  uint64_t v19 = v18;
  v20 = [a1 timestamp];
  v21 = [v20 stringFromDate];
  v22 = [v2 stringWithFormat:@"<%+.8f,%+.8f> +/- %.2fm alt %.2f +/- %.2fm, speed %.2f +/- %.2fmps, course %.2f +/- %.2fdeg, @ %@, type, %u", v24, v5, v7, v9, v11, v13, v15, v17, v19, v21, [a1 type]];

  return v22;
}

- (uint64_t)coordinateToString
{
  v2 = NSString;
  [a1 coordinate];
  uint64_t v4 = v3;
  [a1 coordinate];
  return [v2 stringWithFormat:@"<%+.8f,%+.8f>", v4, v5];
}

- (id)initWithRTLocation:()RTExtensions
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 latitude];
    CLLocationDegrees v7 = v6;
    [v5 longitude];
    CLLocationCoordinate2D v9 = CLLocationCoordinate2DMake(v7, v8);
    [v5 horizontalUncertainty];
    double v11 = v10;
    uint64_t v12 = [v5 date];
    a1 = (id)[a1 initWithCoordinate:v12 altitude:v9.latitude horizontalAccuracy:v9.longitude verticalAccuracy:0.0 timestamp:v11];

    id v13 = a1;
  }
  else
  {
    uint64_t v14 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v16[0] = 0;
      _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", (uint8_t *)v16, 2u);
    }

    id v13 = 0;
  }

  return v13;
}

- (id)initWithRTLocation:()RTExtensions speed:
{
  id v6 = a4;
  CLLocationDegrees v7 = v6;
  if (v6)
  {
    [v6 latitude];
    CLLocationDegrees v9 = v8;
    [v7 longitude];
    CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v9, v10);
    [v7 horizontalUncertainty];
    double v13 = v12;
    uint64_t v14 = [v7 date];
    a1 = (id)[a1 initWithCoordinate:v14 altitude:v11.latitude longitude:v11.longitude horizontalAccuracy:0.0 verticalAccuracy:0.0 course:v13 speed:0.0 timestamp:a2];

    id v15 = a1;
  }
  else
  {
    uint64_t v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v18[0] = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", (uint8_t *)v18, 2u);
    }

    id v15 = 0;
  }

  return v15;
}

- (uint64_t)initWithRTLocation:()RTExtensions speed:type:
{
  return [a1 initWithRTLocation:a3 speed:a4 type:0 signalEnvironmentType:];
}

- (uint64_t)initWithRTLocation:()RTExtensions speed:type:signalEnvironmentType:
{
  return [a1 initWithRTLocation:a3 speed:a4 type:a5 signalEnvironmentType:*MEMORY[0x1E4F1E768]];
}

- (id)initWithRTLocation:()RTExtensions speed:type:signalEnvironmentType:integrity:
{
  id v12 = a4;
  if (!v12)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "Invalid parameter not satisfying: location";
LABEL_12:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_13;
  }
  if (a5 >= 0xE)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    uint64_t v16 = "Invalid parameter not satisfying: type >= kCLLocationType_Unknown && type < kCLLocationType_Max";
    goto LABEL_12;
  }
  if (a6 >= 7)
  {
    id v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = "Invalid parameter not satisfying: signalEnvironmentType >= kCLClientSignalEnvUnavailable && signalEnvironmen"
            "tType <= kCLClientSignalEnvFoliage";
      goto LABEL_12;
    }
LABEL_13:

    id v17 = 0;
    goto LABEL_14;
  }
  long long v28 = 0u;
  memset(v29, 0, 28);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  *(_OWORD *)buf = 0u;
  double v13 = (void *)[objc_alloc(MEMORY[0x1E4F1E5F0]) initWithRTLocation:v12 speed:a2];
  uint64_t v14 = v13;
  if (v13)
  {
    [v13 clientLocation];
  }
  else
  {
    long long v28 = 0u;
    memset(v29, 0, 28);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    *(_OWORD *)buf = 0u;
  }

  HIDWORD(v29[0]) = a6;
  LODWORD(v27) = a5;
  LODWORD(v29[0]) = a7;
  v19[6] = v27;
  v19[7] = v28;
  v20[0] = v29[0];
  *(_OWORD *)((char *)v20 + 12) = *(_OWORD *)((char *)v29 + 12);
  v19[2] = v23;
  v19[3] = v24;
  v19[4] = v25;
  v19[5] = v26;
  v19[0] = *(_OWORD *)buf;
  v19[1] = v22;
  a1 = (id)[a1 initWithClientLocation:v19];
  id v17 = a1;
LABEL_14:

  return v17;
}

- (id)initWithRTLocationOfInterest:()RTExtensions
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 location];
    [v6 latitude];
    CLLocationDegrees v8 = v7;
    CLLocationDegrees v9 = [v5 location];
    [v9 longitude];
    CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v8, v10);
    id v12 = [v5 location];
    [v12 altitude];
    double v14 = v13;
    id v15 = [v5 location];
    [v15 horizontalUncertainty];
    double v17 = v16;
    uint64_t v18 = [v5 location];
    [v18 verticalUncertainty];
    double v20 = v19;
    v21 = [MEMORY[0x1E4F1C9C8] date];
    a1 = (id)[a1 initWithCoordinate:v21 altitude:v11.latitude horizontalAccuracy:v11.longitude verticalAccuracy:v14 timestamp:v20];

    id v22 = a1;
  }
  else
  {
    long long v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25[0] = 0;
      _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: loi", (uint8_t *)v25, 2u);
    }

    id v22 = 0;
  }

  return v22;
}

- (uint64_t)initWithRTPLocation:()RTExtensions
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F5CE00]);
    [v4 latitude];
    double v7 = v6;
    [v4 longitude];
    double v9 = v8;
    [v4 uncertainty];
    double v11 = v10;
    id v12 = (void *)MEMORY[0x1E4F1C9C8];
    [v4 timestamp];
    double v13 = [v12 dateWithTimeIntervalSinceReferenceDate:];
    double v14 = (void *)[v5 initWithLatitude:v13 longitude:v7 horizontalUncertainty:v9 date:v11];

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1E5F0]) initWithRTLocation:v14];
  }
  else
  {
    double v16 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", v18, 2u);
    }

    uint64_t v15 = 0;
  }

  return v15;
}

- (id)initWithRTCLLocationMO:()RTExtensions
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    [v4 courseAccuracy];
    double v6 = -1.0;
    BOOL v8 = v7 == 0.0;
    double v9 = -1.0;
    if (!v8) {
      [v5 courseAccuracy:-1.0];
    }
    double v37 = v9;
    [v5 speedAccuracy];
    if (v10 != 0.0)
    {
      [v5 speedAccuracy];
      double v6 = v11;
    }
    id v12 = objc_alloc(MEMORY[0x1E4F1E5F0]);
    [v5 latitude];
    CLLocationDegrees v14 = v13;
    [v5 longitude];
    CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v14, v15);
    [v5 altitude];
    double v18 = v17;
    [v5 horizontalAccuracy];
    double v20 = v19;
    [v5 verticalAccuracy];
    double v22 = v21;
    [v5 course];
    double v24 = v23;
    [v5 speed];
    double v26 = v25;
    long long v27 = [v5 timestamp];
    long long v28 = [v12 initWithCoordinate:v27 altitude:v16.latitude longitude:v16.longitude horizontalAccuracy:v18 verticalAccuracy:v20 course:v22 courseAccuracy:v24 speed:v37 speedAccuracy:v26 timestamp:v6];

    long long v47 = 0u;
    memset(v48, 0, 28);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    *(_OWORD *)buf = 0u;
    if (v28) {
      [v28 clientLocation];
    }
    v29 = [v5 type];
    if (v29)
    {
      v30 = [v5 type];
      LODWORD(v46) = [v30 unsignedIntValue];
    }
    else
    {
      LODWORD(v46) = 0;
    }

    v32 = [v5 signalEnvironmentType];
    if (v32)
    {
      v33 = [v5 signalEnvironmentType];
      HIDWORD(v48[0]) = [v33 unsignedIntValue];
    }
    else
    {
      HIDWORD(v48[0]) = 0;
    }

    v34 = [v5 integrity];
    if (v34)
    {
      v35 = [v5 integrity];
      LODWORD(v48[0]) = [v35 unsignedIntValue];
    }
    else
    {
      LODWORD(v48[0]) = *MEMORY[0x1E4F1E768];
    }

    v38[6] = v46;
    v38[7] = v47;
    v39[0] = v48[0];
    *(_OWORD *)((char *)v39 + 12) = *(_OWORD *)((char *)v48 + 12);
    v38[2] = v42;
    v38[3] = v43;
    v38[4] = v44;
    v38[5] = v45;
    v38[0] = *(_OWORD *)buf;
    v38[1] = v41;
    a1 = (id)[a1 initWithClientLocation:v38];
    id v31 = a1;
  }
  else
  {
    long long v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationMO", buf, 2u);
    }
    id v31 = 0;
  }

  return v31;
}

- (uint64_t)initWithSMLocation:()RTExtensions
{
  id v4 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v5 = a3;
  id v6 = [v4 alloc];
  [v5 latitude];
  CLLocationDegrees v8 = v7;
  [v5 longitude];
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v8, v9);
  [v5 altitude];
  double v12 = v11;
  [v5 hunc];
  double v14 = v13;
  [v5 vunc];
  double v16 = v15;
  double v17 = [v5 date];

  uint64_t v18 = [v6 initWithCoordinate:v17 altitude:v10.latitude horizontalAccuracy:v10.longitude verticalAccuracy:v12 timestamp:v14];
  return v18;
}

- (uint64_t)initWithSMInitiatorLocation:()RTExtensions
{
  id v4 = (objc_class *)MEMORY[0x1E4F1E5F0];
  id v5 = a3;
  id v6 = [v4 alloc];
  [v5 latitude];
  CLLocationDegrees v8 = v7;
  [v5 longitude];
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v8, v9);
  [v5 altitude];
  double v12 = v11;
  [v5 hunc];
  double v14 = v13;
  [v5 vunc];
  double v16 = v15;
  double v17 = [v5 date];

  uint64_t v18 = [v6 initWithCoordinate:v17 altitude:v10.latitude horizontalAccuracy:v10.longitude verticalAccuracy:v12 timestamp:v14];
  return v18;
}

- (id)toVerboseString
{
  v2 = [a1 sourceInformation];
  if (v2)
  {
    uint64_t v3 = [a1 sourceInformation];
    uint64_t v4 = [v3 isSimulatedBySoftware];
  }
  else
  {
    uint64_t v4 = -1;
  }

  id v5 = [a1 sourceInformation];
  if (v5)
  {
    id v6 = [a1 sourceInformation];
    uint64_t v7 = [v6 isProducedByAccessory];
  }
  else
  {
    uint64_t v7 = -1;
  }

  CLLocationDegrees v8 = NSString;
  [a1 coordinate];
  uint64_t v35 = v9;
  [a1 coordinate];
  uint64_t v34 = v10;
  [a1 altitude];
  uint64_t v12 = v11;
  [a1 horizontalAccuracy];
  uint64_t v14 = v13;
  [a1 verticalAccuracy];
  uint64_t v16 = v15;
  [a1 speed];
  uint64_t v18 = v17;
  [a1 speedAccuracy];
  uint64_t v20 = v19;
  [a1 course];
  uint64_t v22 = v21;
  [a1 courseAccuracy];
  uint64_t v24 = v23;
  uint64_t v25 = [a1 type];
  uint64_t v26 = [a1 integrity];
  long long v27 = [a1 timestamp];
  [v27 timeIntervalSinceReferenceDate];
  uint64_t v29 = v28;
  v30 = [a1 timestamp];
  id v31 = [v30 stringFromDate];
  v32 = [v8 stringWithFormat:@"lat, % 12.9f, lon, % 12.9f, alt, % 9.3f, hacc, % 9.3f, vacc, % 9.3f, speed, % 9.3f, sacc, % 9.3f, course, % 9.3f, cacc, % 9.3f, type, %3d, integrity, %3d, simulated, %+3ld, accessory, %+3ld, timestamp, %.3f, date, %@", v35, v34, v12, v14, v16, v18, v20, v22, v24, v25, v26, v4, v7, v29, v31];

  return v32;
}

@end