@interface RTStateModelLocation
+ (BOOL)supportsSecureCoding;
- (RTStateModelLocation)init;
- (RTStateModelLocation)initWithCLLocation:(id)a3;
- (RTStateModelLocation)initWithCoder:(id)a3;
- (RTStateModelLocation)initWithLat:(double)a3 Lon:(double)a4 Uncertainty:(double)a5 confidence:(double)a6 andTimestamp_s:(double)a7;
- (RTStateModelLocation)initWithLat:(double)a3 Lon:(double)a4 Uncertainty:(double)a5 confidence:(double)a6 andTimestamp_s:(double)a7 referenceFrame:(int)a8;
- (RTStateModelLocation)initWithLatitude:(double)a3 longitude:(double)a4 uncertainty:(double)a5;
- (RTStateModelLocation)initWithRTLocation:(id)a3;
- (double)Latitude_deg;
- (double)Longitude_deg;
- (double)confidence;
- (double)timestamp_s;
- (double)uncertainty_m;
- (id)description;
- (int)referenceFrame;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setLatitude_deg:(double)a3;
- (void)setLongitude_deg:(double)a3;
- (void)setReferenceFrame:(int)a3;
- (void)setTimestamp_s:(double)a3;
- (void)setUncertainty_m:(double)a3;
@end

@implementation RTStateModelLocation

- (RTStateModelLocation)initWithRTLocation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 latitude];
    double v6 = v5;
    [v4 longitude];
    double v8 = v7;
    [v4 horizontalUncertainty];
    double v10 = v9;
    v11 = [v4 date];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;
    uint64_t v14 = [v4 referenceFrame];

    self = [(RTStateModelLocation *)self initWithLat:v14 Lon:v6 Uncertainty:v8 confidence:v10 andTimestamp_s:0.0 referenceFrame:v13];
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (RTStateModelLocation)initWithLat:(double)a3 Lon:(double)a4 Uncertainty:(double)a5 confidence:(double)a6 andTimestamp_s:(double)a7 referenceFrame:(int)a8
{
  v15.receiver = self;
  v15.super_class = (Class)RTStateModelLocation;
  result = [(RTStateModelLocation *)&v15 init];
  if (result)
  {
    result->_Latitude_deg = a3;
    result->_Longitude_deg = a4;
    result->_uncertainty_m = a5;
    result->_confidence = a6;
    result->_timestamp_s = a7;
    result->_referenceFrame = a8;
  }
  return result;
}

- (RTStateModelLocation)init
{
  double Current = CFAbsoluteTimeGetCurrent();

  return [(RTStateModelLocation *)self initWithLat:0 Lon:-360.0 Uncertainty:-360.0 confidence:-1.0 andTimestamp_s:0.0 referenceFrame:Current];
}

- (RTStateModelLocation)initWithLat:(double)a3 Lon:(double)a4 Uncertainty:(double)a5 confidence:(double)a6 andTimestamp_s:(double)a7
{
  return [(RTStateModelLocation *)self initWithLat:0 Lon:a3 Uncertainty:a4 confidence:a5 andTimestamp_s:a6 referenceFrame:a7];
}

- (RTStateModelLocation)initWithCLLocation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 coordinate];
    double v6 = v5;
    [v4 coordinate];
    double v8 = v7;
    [v4 horizontalAccuracy];
    double v10 = v9;
    v11 = [v4 timestamp];
    [v11 timeIntervalSinceReferenceDate];
    double v13 = v12;
    uint64_t v14 = [v4 referenceFrame];

    self = [(RTStateModelLocation *)self initWithLat:v14 Lon:v6 Uncertainty:v8 confidence:v10 andTimestamp_s:0.0 referenceFrame:v13];
    objc_super v15 = self;
  }
  else
  {
    objc_super v15 = 0;
  }

  return v15;
}

- (RTStateModelLocation)initWithLatitude:(double)a3 longitude:(double)a4 uncertainty:(double)a5
{
  double Current = CFAbsoluteTimeGetCurrent();

  return [(RTStateModelLocation *)self initWithLat:a3 Lon:a4 Uncertainty:a5 confidence:0.0 andTimestamp_s:Current];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(RTStateModelLocation *)self Latitude_deg];
  [v4 encodeDouble:@"Latitude_deg" forKey:@"Latitude_deg"];
  [(RTStateModelLocation *)self Longitude_deg];
  [v4 encodeDouble:@"Longitude_deg" forKey:@"Longitude_deg"];
  [(RTStateModelLocation *)self uncertainty_m];
  [v4 encodeDouble:@"uncertainty_m" forKey:@"uncertainty_m"];
  [(RTStateModelLocation *)self confidence];
  [v4 encodeDouble:@"confidence" forKey:@"confidence"];
  [(RTStateModelLocation *)self timestamp_s];
  [v4 encodeDouble:@"timestamp_s" forKey:];
}

- (RTStateModelLocation)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"Latitude_deg"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"Longitude_deg"];
  double v8 = v7;
  [v4 decodeDoubleForKey:@"uncertainty_m"];
  double v10 = v9;
  double v11 = 0.0;
  if ([v4 containsValueForKey:@"confidence"])
  {
    [v4 decodeDoubleForKey:@"confidence"];
    double v11 = v12;
  }
  [v4 decodeDoubleForKey:@"timestamp_s"];
  uint64_t v14 = [(RTStateModelLocation *)self initWithLat:v6 Lon:v8 Uncertainty:v10 confidence:v11 andTimestamp_s:v13];

  return v14;
}

- (id)description
{
  v3 = NSString;
  [(RTStateModelLocation *)self Latitude_deg];
  uint64_t v5 = v4;
  [(RTStateModelLocation *)self Longitude_deg];
  uint64_t v7 = v6;
  [(RTStateModelLocation *)self uncertainty_m];
  uint64_t v9 = v8;
  [(RTStateModelLocation *)self confidence];
  uint64_t v11 = v10;
  [(RTStateModelLocation *)self timestamp_s];
  double v13 = v12;
  if (v12 == -1.0)
  {
    objc_super v15 = 0;
  }
  else
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F1C9C8];
    [(RTStateModelLocation *)self timestamp_s];
    objc_super v15 = [v14 stringFromTimestamp:x0];
  }
  v16 = [v3 stringWithFormat:@"<%f, %f> +/- %f, confidence, %f, date, %@, referenceFrame, %d", v5, v7, v9, v11, v15, -[RTStateModelLocation referenceFrame](self, "referenceFrame")];
  if (v13 != -1.0) {

  }
  return v16;
}

- (double)Latitude_deg
{
  return self->_Latitude_deg;
}

- (void)setLatitude_deg:(double)a3
{
  self->_Latitude_deg = a3;
}

- (double)Longitude_deg
{
  return self->_Longitude_deg;
}

- (void)setLongitude_deg:(double)a3
{
  self->_Longitude_deg = a3;
}

- (double)uncertainty_m
{
  return self->_uncertainty_m;
}

- (void)setUncertainty_m:(double)a3
{
  self->_uncertainty_m = a3;
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (double)timestamp_s
{
  return self->_timestamp_s;
}

- (void)setTimestamp_s:(double)a3
{
  self->_timestamp_s = a3;
}

- (int)referenceFrame
{
  return self->_referenceFrame;
}

- (void)setReferenceFrame:(int)a3
{
  self->_referenceFrame = a3;
}

@end