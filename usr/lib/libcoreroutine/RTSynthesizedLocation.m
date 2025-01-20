@interface RTSynthesizedLocation
+ (BOOL)supportsSecureCoding;
+ (id)createWithManagedObject:(id)a3;
+ (id)createWithSynhtesizedLocationMO:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLocation:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (NSDate)timestamp;
- (NSString)description;
- (RTSynthesizedLocation)initWithCLLocation:(id)a3;
- (RTSynthesizedLocation)initWithCLTripSegmentLocation:(id)a3;
- (RTSynthesizedLocation)initWithCoder:(id)a3;
- (RTSynthesizedLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 geoRoadClass:(int64_t)a11 geoFormOfWay:(int64_t)a12 locationType:(int64_t)a13 timestamp:(id)a14;
- (RTSynthesizedLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 geoRoadClass:(int64_t)a11 geoFormOfWay:(int64_t)a12 locationType:(int64_t)a13 timestamp:(id)a14 downsamplingLevel:(int64_t)a15;
- (double)altitude;
- (double)course;
- (double)courseAccuracy;
- (double)horizontalAccuracy;
- (double)speed;
- (double)speedAccuracy;
- (double)verticalAccuracy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)managedObjectWithContext:(id)a3;
- (int64_t)convertCLLocationType:(int)a3;
- (int64_t)convertFormOfWay:(int)a3;
- (int64_t)convertGeoRoadClass:(int)a3;
- (int64_t)convertReconstructedLocationType:(id)a3;
- (int64_t)downsamplingLevel;
- (int64_t)geoFormOfWay;
- (int64_t)geoRoadClass;
- (int64_t)locationType;
- (void)encodeWithCoder:(id)a3;
- (void)setDownsamplingLevel:(int64_t)a3;
- (void)setGeoFormOfWay:(int64_t)a3;
- (void)setGeoRoadClass:(int64_t)a3;
- (void)setLocationType:(int64_t)a3;
@end

@implementation RTSynthesizedLocation

- (int64_t)convertGeoRoadClass:(int)a3
{
  if (a3 > 9) {
    return 0;
  }
  else {
    return qword_1DA0FF100[a3];
  }
}

- (int64_t)convertFormOfWay:(int)a3
{
  if ((a3 - 1) > 0x15) {
    return 0;
  }
  else {
    return qword_1DA0FF150[a3 - 1];
  }
}

- (int64_t)convertCLLocationType:(int)a3
{
  if ((a3 - 1) > 0xC) {
    return 0;
  }
  else {
    return qword_1DA0FF200[a3 - 1];
  }
}

- (int64_t)convertReconstructedLocationType:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 isOriginalLocationType];
  int v6 = [v4 isInertialIntegrated];
  int v7 = [v4 isLinearInterpolated];
  int v8 = [v4 isMapMatched];
  if ([v4 isOriginalLocationType])
  {
    int64_t v9 = -[RTSynthesizedLocation convertCLLocationType:](self, "convertCLLocationType:", [v4 locType]);
  }
  else
  {
    int64_t v10 = -[RTSynthesizedLocation convertCLLocationType:](self, "convertCLLocationType:", [v4 locTypeStart]);
    int64_t v9 = -[RTSynthesizedLocation convertCLLocationType:](self, "convertCLLocationType:", [v4 locTypeStop]) | v10;
  }
  uint64_t v11 = v5;
  if (v6) {
    uint64_t v11 = v5 | 2;
  }
  if (v7) {
    v11 |= 4uLL;
  }
  if (v8) {
    v11 |= 8uLL;
  }
  int64_t v12 = v9 | v11;

  return v12;
}

- (RTSynthesizedLocation)initWithCLTripSegmentLocation:(id)a3
{
  id v4 = a3;
  [v4 latitude];
  double v29 = v5;
  [v4 longitude];
  double v7 = v6;
  int64_t v8 = -[RTSynthesizedLocation convertGeoRoadClass:](self, "convertGeoRoadClass:", [v4 mapsRoadClass]);
  int64_t v9 = -[RTSynthesizedLocation convertFormOfWay:](self, "convertFormOfWay:", [v4 mapsFormOfWay]);
  int64_t v10 = [(RTSynthesizedLocation *)self convertReconstructedLocationType:v4];
  uint64_t v11 = [RTSynthesizedLocation alloc];
  [v4 altitude];
  double v13 = v12;
  [v4 horizontalAccuracy];
  double v15 = v14;
  [v4 altitudeAccuracy];
  double v17 = v16;
  [v4 course];
  double v19 = v18;
  [v4 courseAccuracy];
  double v21 = v20;
  [v4 speed];
  double v23 = v22;
  [v4 speedAccuracy];
  uint64_t v25 = v24;
  v26 = [v4 timestamp];

  v27 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", v8, v9, v10, v26, 0, v29, v7, v13, v15, v17, v19, v21, v23, v25);
  return v27;
}

- (RTSynthesizedLocation)initWithCLLocation:(id)a3
{
  id v4 = a3;
  double v5 = [RTSynthesizedLocation alloc];
  [v4 coordinate];
  double v26 = v6;
  double v8 = v7;
  [v4 altitude];
  double v10 = v9;
  [v4 horizontalAccuracy];
  double v12 = v11;
  [v4 verticalAccuracy];
  double v14 = v13;
  [v4 course];
  double v16 = v15;
  [v4 courseAccuracy];
  double v18 = v17;
  [v4 speed];
  double v20 = v19;
  [v4 speedAccuracy];
  uint64_t v22 = v21;
  double v23 = [v4 timestamp];

  uint64_t v24 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](v5, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", 0, 0, 1, v23, 0, v26, v8, v10, v12, v14, v16, v18, v20, v22);
  return v24;
}

- (RTSynthesizedLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 geoRoadClass:(int64_t)a11 geoFormOfWay:(int64_t)a12 locationType:(int64_t)a13 timestamp:(id)a14 downsamplingLevel:(int64_t)a15
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  id v29 = a14;
  v33.receiver = self;
  v33.super_class = (Class)RTSynthesizedLocation;
  v30 = [(RTSynthesizedLocation *)&v33 init];
  v31 = v30;
  if (v30)
  {
    v30->_coordinate.CLLocationDegrees latitude = latitude;
    v30->_coordinate.CLLocationDegrees longitude = longitude;
    v30->_altitude = a4;
    v30->_horizontalAccuracy = a5;
    v30->_verticalAccuracy = a6;
    v30->_course = a7;
    v30->_courseAccuracy = a8;
    v30->_speed = a9;
    v30->_speedAccuracy = a10;
    v30->_geoRoadClass = a11;
    v30->_geoFormOfWay = a12;
    v30->_locationType = a13;
    objc_storeStrong((id *)&v30->_timestamp, a14);
    v31->_downsamplingLevel = a15;
  }

  return v31;
}

- (RTSynthesizedLocation)initWithCoordinate:(CLLocationCoordinate2D)a3 altitude:(double)a4 horizontalAccuracy:(double)a5 verticalAccuracy:(double)a6 course:(double)a7 courseAccuracy:(double)a8 speed:(double)a9 speedAccuracy:(double)a10 geoRoadClass:(int64_t)a11 geoFormOfWay:(int64_t)a12 locationType:(int64_t)a13 timestamp:(id)a14
{
  double longitude = a3.longitude;
  double latitude = a3.latitude;
  id v25 = a14;
  double v26 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:]([RTSynthesizedLocation alloc], "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", a11, a12, a13, v25, 0, latitude, longitude, a4, a5, a6, a7, a8, a9, *(void *)&a10);

  return v26;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTSynthesizedLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"latitude"];
  double v29 = v5;
  [v4 decodeDoubleForKey:@"longitude"];
  double v7 = v6;
  [v4 decodeDoubleForKey:@"altitude"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"horizontalUncertainty"];
  double v11 = v10;
  [v4 decodeDoubleForKey:@"verticalUncertainty"];
  double v13 = v12;
  [v4 decodeDoubleForKey:@"speed"];
  double v15 = v14;
  [v4 decodeDoubleForKey:@"speedAccuracy"];
  uint64_t v17 = v16;
  [v4 decodeDoubleForKey:@"course"];
  double v19 = v18;
  [v4 decodeDoubleForKey:@"courseAccuracy"];
  double v21 = v20;
  uint64_t v22 = (int)[v4 decodeIntForKey:@"geoRoadClass"];
  uint64_t v23 = (int)[v4 decodeIntForKey:@"geoFormOfWay"];
  uint64_t v24 = (int)[v4 decodeIntForKey:@"locationType"];
  id v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
  int v26 = [v4 decodeIntForKey:@"downsamplingLevel"];

  v27 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](self, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", v22, v23, v24, v25, v26, v29, v7, v9, v11, v13, v19, v21, v15, v17);
  return v27;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [(RTSynthesizedLocation *)self coordinate];
  [v6 encodeDouble:@"latitude" forKey:@"latitude"];
  [(RTSynthesizedLocation *)self coordinate];
  [v6 encodeDouble:@"longitude" forKey:v4];
  [(RTSynthesizedLocation *)self altitude];
  [v6 encodeDouble:@"altitude" forKey:@"altitude"];
  [(RTSynthesizedLocation *)self horizontalAccuracy];
  [v6 encodeDouble:x0 forKey:@"horizontalUncertainty"];
  [(RTSynthesizedLocation *)self verticalAccuracy];
  [v6 encodeDouble:@"verticalUncertainty" forKey:@"verticalUncertainty"];
  [(RTSynthesizedLocation *)self speed];
  [v6 encodeDouble:@"speed" forKey:];
  [(RTSynthesizedLocation *)self speedAccuracy];
  [v6 encodeDouble:@"speedAccuracy" forKey:@"speedAccuracy"];
  [(RTSynthesizedLocation *)self course];
  [v6 encodeDouble:x0 forKey:@"course"];
  [(RTSynthesizedLocation *)self courseAccuracy];
  [v6 encodeDouble:@"courseAccuracy" forKey:];
  [v6 encodeInt64:-[RTSynthesizedLocation geoRoadClass](self, "geoRoadClass") forKey:@"geoRoadClass"];
  [v6 encodeInt64:-[RTSynthesizedLocation geoFormOfWay](self, "geoFormOfWay") forKey:@"geoFormOfWay"];
  [v6 encodeInt64:-[RTSynthesizedLocation locationType](self, "locationType") forKey:@"locationType"];
  double v5 = [(RTSynthesizedLocation *)self timestamp];
  [v6 encodeObject:v5 forKey:@"timestamp"];

  [v6 encodeInt64:-[RTSynthesizedLocation downsamplingLevel](self, "downsamplingLevel") forKey:@"downsamplingLevel"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[(id)[(id)[objc_opt_class() allocWithZone:a3] initWithCoordinate:self->_coordinate.latitude, self->_coordinate.longitude, self->_altitude, self->_horizontalAccuracy, self->_verticalAccuracy, self->_course, self->_courseAccuracy, self->_speed, *(void *)&self->_speedAccuracy] locationType:self->_locationType] timestamp:self->_timestamp] downsamplingLevel:self->_downsamplingLevel];
}

- (BOOL)isEqualToLocation:(id)a3
{
  id v4 = a3;
  [(RTSynthesizedLocation *)self coordinate];
  double v6 = v5;
  [v4 coordinate];
  if (v6 != v7) {
    goto LABEL_14;
  }
  [(RTSynthesizedLocation *)self coordinate];
  double v9 = v8;
  [v4 coordinate];
  if (v9 != v10) {
    goto LABEL_14;
  }
  [(RTSynthesizedLocation *)self altitude];
  double v12 = v11;
  [v4 altitude];
  if (v12 != v13) {
    goto LABEL_14;
  }
  [(RTSynthesizedLocation *)self horizontalAccuracy];
  double v15 = v14;
  [v4 horizontalAccuracy];
  if (v15 != v16) {
    goto LABEL_14;
  }
  [(RTSynthesizedLocation *)self verticalAccuracy];
  double v18 = v17;
  [v4 verticalAccuracy];
  if (v18 != v19) {
    goto LABEL_14;
  }
  [(RTSynthesizedLocation *)self course];
  double v21 = v20;
  [v4 course];
  if (v21 != v22) {
    goto LABEL_14;
  }
  [(RTSynthesizedLocation *)self courseAccuracy];
  double v24 = v23;
  [v4 courseAccuracy];
  if (v24 != v25) {
    goto LABEL_14;
  }
  [(RTSynthesizedLocation *)self speed];
  double v27 = v26;
  [v4 speed];
  if (v27 != v28) {
    goto LABEL_14;
  }
  [(RTSynthesizedLocation *)self speedAccuracy];
  double v30 = v29;
  [v4 speedAccuracy];
  if (v30 == v31
    && (int64_t v32 = -[RTSynthesizedLocation geoRoadClass](self, "geoRoadClass"), v32 == [v4 geoRoadClass])
    && (int64_t v33 = -[RTSynthesizedLocation geoFormOfWay](self, "geoFormOfWay"), v33 == [v4 geoFormOfWay])
    && (int64_t v34 = -[RTSynthesizedLocation locationType](self, "locationType"), v34 == [v4 locationType]))
  {
    v35 = [(RTSynthesizedLocation *)self timestamp];
    v36 = [v4 timestamp];
    char v37 = [v35 isEqualToDate:v36];
  }
  else
  {
LABEL_14:
    char v37 = 0;
  }

  return v37;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTSynthesizedLocation *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(RTSynthesizedLocation *)self isEqualToLocation:v5];

  return v6;
}

- (NSString)description
{
  double v25 = NSString;
  [(RTSynthesizedLocation *)self coordinate];
  uint64_t v24 = v3;
  [(RTSynthesizedLocation *)self coordinate];
  uint64_t v23 = v4;
  [(RTSynthesizedLocation *)self altitude];
  uint64_t v6 = v5;
  [(RTSynthesizedLocation *)self horizontalAccuracy];
  uint64_t v8 = v7;
  [(RTSynthesizedLocation *)self verticalAccuracy];
  uint64_t v10 = v9;
  [(RTSynthesizedLocation *)self course];
  uint64_t v12 = v11;
  [(RTSynthesizedLocation *)self courseAccuracy];
  uint64_t v14 = v13;
  [(RTSynthesizedLocation *)self speed];
  uint64_t v16 = v15;
  [(RTSynthesizedLocation *)self speedAccuracy];
  uint64_t v18 = v17;
  double v19 = [(RTSynthesizedLocation *)self timestamp];
  [v19 timeIntervalSinceReferenceDate];
  objc_msgSend(v25, "stringWithFormat:", @"lat,%.6f,lon,%.6f,alt,%.2f,hunc,%.2f,vunc,%.2f,course,%.2f,cunc,%.2f,speed,%.2f,sunc,%.1f,timestamp,%.3f,downsamplingLevel,%lu,geoRoadClass,%ld,formOfWay,%ld,locationType,%ld,BC,%ld,II,%ld,LI,%ld,MM,%ld,EA,%ld,WiFi,%ld,GPS,%ld,LOI,%ld", v24, v23, v6, v8, v10, v12, v14, v16, v18, v20, -[RTSynthesizedLocation downsamplingLevel](self, "downsamplingLevel"), -[RTSynthesizedLocation geoRoadClass](self, "geoRoadClass"), -[RTSynthesizedLocation geoFormOfWay](self, "geoFormOfWay"), -[RTSynthesizedLocation locationType](self, "locationType"), -[RTSynthesizedLocation locationType](self, "locationType") & 1, ((unint64_t)-[RTSynthesizedLocation locationType](self, "locationType") >> 1) & 1,
    ((unint64_t)[(RTSynthesizedLocation *)self locationType] >> 2) & 1,
    ((unint64_t)[(RTSynthesizedLocation *)self locationType] >> 3) & 1,
    ((unint64_t)[(RTSynthesizedLocation *)self locationType] >> 4) & 1,
    ((unint64_t)[(RTSynthesizedLocation *)self locationType] >> 6) & 1,
    ((unint64_t)[(RTSynthesizedLocation *)self locationType] >> 5) & 1,
  double v21 = ((unint64_t)[(RTSynthesizedLocation *)self locationType] >> 7) & 1);

  return (NSString *)v21;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)horizontalAccuracy
{
  return self->_horizontalAccuracy;
}

- (double)verticalAccuracy
{
  return self->_verticalAccuracy;
}

- (double)course
{
  return self->_course;
}

- (double)courseAccuracy
{
  return self->_courseAccuracy;
}

- (double)speed
{
  return self->_speed;
}

- (double)speedAccuracy
{
  return self->_speedAccuracy;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)downsamplingLevel
{
  return self->_downsamplingLevel;
}

- (void)setDownsamplingLevel:(int64_t)a3
{
  self->_downsamplingLevel = a3;
}

- (int64_t)geoRoadClass
{
  return self->_geoRoadClass;
}

- (void)setGeoRoadClass:(int64_t)a3
{
  self->_geoRoadClass = a3;
}

- (int64_t)geoFormOfWay
{
  return self->_geoFormOfWay;
}

- (void)setGeoFormOfWay:(int64_t)a3
{
  self->_geoFormOfWay = a3;
}

- (int64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(int64_t)a3
{
  self->_locationType = a3;
}

- (void).cxx_destruct
{
}

+ (id)createWithManagedObject:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      uint64_t v6 = [(id)objc_opt_class() createWithSynhtesizedLocationMO:v5];

      goto LABEL_8;
    }
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = NSStringFromSelector(a2);
      int v10 = 138413058;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      __int16 v14 = 2080;
      id v13 = v4;
      uint64_t v15 = "+[RTSynthesizedLocation(RTCoreDataTransformable) createWithManagedObject:]";
      __int16 v16 = 1024;
      int v17 = 34;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "%@, managedObject, %@, is not supported by RTTripSegment+CoreDataReadable (in %s:%d)", (uint8_t *)&v10, 0x26u);
    }
  }
  uint64_t v6 = 0;
LABEL_8:

  return v6;
}

+ (id)createWithSynhtesizedLocationMO:(id)a3
{
  id v3 = a3;
  [v3 latitude];
  double v29 = v4;
  [v3 longitude];
  double v6 = v5;
  if ([v3 downsamplingLevel]) {
    uint64_t v7 = (int)[v3 downsamplingLevel];
  }
  else {
    uint64_t v7 = 0;
  }
  if ([v3 geoRoadClass]) {
    uint64_t v8 = (int)[v3 geoRoadClass];
  }
  else {
    uint64_t v8 = 0;
  }
  if ([v3 geoFormOfWay]) {
    uint64_t v9 = (int)[v3 geoFormOfWay];
  }
  else {
    uint64_t v9 = 0;
  }
  if ([v3 locationType]) {
    uint64_t v10 = (int)[v3 locationType];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [RTSynthesizedLocation alloc];
  [v3 altitude];
  double v13 = v12;
  [v3 horizontalAccuracy];
  double v15 = v14;
  [v3 verticalAccuracy];
  double v17 = v16;
  [v3 course];
  double v19 = v18;
  [v3 courseAccuracy];
  double v21 = v20;
  [v3 speed];
  double v23 = v22;
  [v3 speedAccuracy];
  uint64_t v25 = v24;
  double v26 = [v3 timestamp];
  double v27 = -[RTSynthesizedLocation initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:](v11, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:course:courseAccuracy:speed:speedAccuracy:geoRoadClass:geoFormOfWay:locationType:timestamp:downsamplingLevel:", v8, v9, v10, v26, v7, v29, v6, v13, v15, v17, v19, v21, v23, v25);

  return v27;
}

- (id)managedObjectWithContext:(id)a3
{
  if (a3)
  {
    id v3 = +[RTSynthesizedLocationMO managedObjectWithSynthesizedLocation:self inManagedObjectContext:a3];
  }
  else
  {
    double v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v6 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: context", v6, 2u);
    }

    id v3 = 0;
  }

  return v3;
}

@end