@interface CLLocation(MNExtras)
+ (__CFString)_navigation_stringWithType:()MNExtras;
+ (uint64_t)_navigation_isLocation:()MNExtras equalTo:;
- (BOOL)_navigation_isEqualToLocationCoordinate:()MNExtras;
- (double)_navigation_geoCoordinate;
- (double)_navigation_geoCoordinate3D;
- (double)_navigation_rawShiftedCoordinate;
- (double)_navigation_speedAccuracy;
- (id)_navigation_geoLocation;
- (id)initWithCoordinate:()MNExtras rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:serializedCoarseMetaData:;
- (uint64_t)_navigation_detailedMatchInfo;
- (uint64_t)_navigation_gtLog;
- (uint64_t)_navigation_hasMatch;
- (uint64_t)_navigation_hasValidCourse;
- (uint64_t)_navigation_isStale;
- (uint64_t)_navigation_locationDescription;
- (uint64_t)_navigation_routeMatch;
- (uint64_t)initWithCoordinate:()MNExtras rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:;
- (uint64_t)initWithGeoLocation:()MNExtras;
- (void)_navigation_setGtLog:()MNExtras;
@end

@implementation CLLocation(MNExtras)

- (uint64_t)_navigation_routeMatch
{
  return 0;
}

- (uint64_t)_navigation_isStale
{
  return 0;
}

- (uint64_t)_navigation_hasValidCourse
{
  [a1 course];
  if (v2 < 0.0) {
    return 0;
  }
  [a1 courseAccuracy];
  if (((int)v4 & 0x80000000) == 0)
  {
    [a1 courseAccuracy];
    if (v5 < 180.0) {
      return 1;
    }
  }
  return GEOConfigGetBOOL();
}

- (BOOL)_navigation_isEqualToLocationCoordinate:()MNExtras
{
  [a1 coordinate];
  BOOL v6 = vabdd_f64(v5, a2) < 0.000000999999997;
  return vabdd_f64(v7, a3) < 0.000000999999997 && v6;
}

- (void)_navigation_setGtLog:()MNExtras
{
  objc_msgSend(NSNumber, "numberWithBool:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_navigation_gtLogKey, v2, (void *)1);
}

- (uint64_t)_navigation_gtLog
{
  v1 = objc_getAssociatedObject(a1, &_navigation_gtLogKey);
  id v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (double)_navigation_speedAccuracy
{
  [a1 clientLocation];
  return v2;
}

- (uint64_t)_navigation_hasMatch
{
  return 0;
}

+ (__CFString)_navigation_stringWithType:()MNExtras
{
  if ((a3 - 1) > 0xC) {
    return @"Unknown";
  }
  else {
    return off_1E60FAC08[a3 - 1];
  }
}

- (uint64_t)initWithCoordinate:()MNExtras rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:
{
  return objc_msgSend(a1, "initWithCoordinate:rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:serializedCoarseMetaData:", a3, a4, 0);
}

- (id)initWithCoordinate:()MNExtras rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:serializedCoarseMetaData:
{
  int v24 = 0xFFFF;
  double v25 = a2;
  double v26 = a3;
  uint64_t v27 = a20;
  uint64_t v28 = a18;
  uint64_t v29 = a21;
  double v30 = a9;
  uint64_t v31 = a17;
  double v32 = a6;
  double v33 = a8;
  uint64_t v34 = a19;
  int v35 = 0;
  unint64_t v36 = 0xBFF0000000000000;
  int v37 = a11;
  double v38 = a4;
  double v39 = a5;
  double v40 = a7;
  uint64_t v41 = 0;
  int v42 = a12;
  uint64_t v44 = 0;
  uint64_t v43 = 0;
  int v45 = 0;
  if (a13) {
    v21 = (void *)[a1 initWithClientLocation:&v24 coarseMetaData:a13];
  }
  else {
    v21 = (void *)[a1 initWithClientLocation:&v24];
  }
  id v22 = v21;

  return v22;
}

- (uint64_t)initWithGeoLocation:()MNExtras
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [v4 latLng];
  [v5 lat];
  CLLocationDegrees v7 = v6;
  v8 = [v4 latLng];
  [v8 lng];
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v7, v9);

  v11 = [v4 rawCoordinate];
  [v11 lat];
  CLLocationDegrees v13 = v12;
  v14 = [v4 rawCoordinate];
  [v14 lng];
  CLLocationCoordinate2D v16 = CLLocationCoordinate2DMake(v13, v15);

  if ([v4 hasCoarseMetadata])
  {
    v17 = (void *)MEMORY[0x1E4F28DB0];
    v18 = [v4 coarseMetadata];
    id v44 = 0;
    v19 = [v17 archivedDataWithRootObject:v18 requiringSecureCoding:1 error:&v44];
    id v20 = v44;

    if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v46 = v20;
      _os_log_impl(&dword_1B542B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to encode coarse location metadata: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v19 = 0;
  }
  [v4 course];
  double v43 = v21;
  [v4 rawCourse];
  double v23 = v22;
  [v4 courseAccuracy];
  double v25 = v24;
  [v4 speed];
  double v27 = v26;
  [v4 speedAccuracy];
  uint64_t v29 = v28;
  int v30 = [v4 altitude];
  [v4 timestamp];
  uint64_t v32 = v31;
  [v4 horizontalAccuracy];
  uint64_t v34 = v33;
  [v4 verticalAccuracy];
  uint64_t v36 = v35;
  unsigned int v37 = [v4 type] - 1;
  if (v37 > 2) {
    uint64_t v38 = 0;
  }
  else {
    uint64_t v38 = dword_1B5542C10[v37];
  }
  int v39 = [v4 referenceFrame];
  if (v39 == 1) {
    uint64_t v40 = 1;
  }
  else {
    uint64_t v40 = 2 * (v39 == 2);
  }
  uint64_t v41 = objc_msgSend(a1, "initWithCoordinate:rawCoordinate:course:rawCourse:courseAccuracy:speed:speedAccuracy:altitude:timestamp:horizontalAccuracy:verticalAccuracy:type:referenceFrame:serializedCoarseMetaData:", v38, v40, v19, v10.latitude, v10.longitude, v16.latitude, v16.longitude, v43, v23, v25, v27, v29, (double)v30, v32, v34, v36);

  return v41;
}

- (uint64_t)_navigation_locationDescription
{
  double v2 = NSString;
  [a1 coordinate];
  uint64_t v4 = v3;
  [a1 coordinate];
  uint64_t v6 = v5;
  [a1 horizontalAccuracy];
  return [v2 stringWithFormat:@"(%+.5f, %+.5f) ±%.2fm", v4, v6, v7];
}

+ (uint64_t)_navigation_isLocation:()MNExtras equalTo:
{
  unint64_t v5 = a3;
  unint64_t v6 = a4;
  uint64_t v7 = (void *)v6;
  if (!(v5 | v6))
  {
LABEL_2:
    uint64_t v8 = 1;
    goto LABEL_3;
  }
  uint64_t v8 = 0;
  if (v5 && v6)
  {
    if (v5 != v6)
    {
      [(id)v6 coordinate];
      uint64_t v8 = objc_msgSend((id)v5, "_navigation_isEqualToLocationCoordinate:");
      goto LABEL_3;
    }
    goto LABEL_2;
  }
LABEL_3:

  return v8;
}

- (double)_navigation_rawShiftedCoordinate
{
  return *MEMORY[0x1E4F1E750];
}

- (uint64_t)_navigation_detailedMatchInfo
{
  return 0;
}

- (id)_navigation_geoLocation
{
  id v2 = objc_alloc(MEMORY[0x1E4F64660]);
  [a1 coordinate];
  double v4 = v3;
  [a1 coordinate];
  unint64_t v5 = objc_msgSend(v2, "initWithLatitude:longitude:", v4);
  return v5;
}

- (double)_navigation_geoCoordinate
{
  [a1 coordinate];
  double v3 = v2;
  [a1 coordinate];
  return v3;
}

- (double)_navigation_geoCoordinate3D
{
  [a1 coordinate];
  double v3 = v2;
  [a1 coordinate];
  [a1 altitude];
  return v3;
}

@end