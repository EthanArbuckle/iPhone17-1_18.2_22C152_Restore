@interface CalibrationTrack
+ (BOOL)supportsSecureCoding;
- (CalibrationTrack)initWithCoder:(id)a3;
- (CalibrationTrack)initWithStart:(id)a3 stop:(id)a4 distanceGps:(double)a5 distanceRawPed:(double)a6 steps:(double)a7 gpsSource:(int)a8;
- (NSDate)start;
- (NSDate)stop;
- (double)distanceGps;
- (double)distanceRawPed;
- (double)steps;
- (id)description;
- (int)gpsSource;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDistanceGps:(double)a3;
- (void)setDistanceRawPed:(double)a3;
- (void)setGpsSource:(int)a3;
- (void)setStart:(id)a3;
- (void)setSteps:(double)a3;
- (void)setStop:(id)a3;
@end

@implementation CalibrationTrack

- (CalibrationTrack)initWithStart:(id)a3 stop:(id)a4 distanceGps:(double)a5 distanceRawPed:(double)a6 steps:(double)a7 gpsSource:(int)a8
{
  v16.receiver = self;
  v16.super_class = (Class)CalibrationTrack;
  v14 = [(CalibrationTrack *)&v16 init];
  if (v14)
  {
    v14->_start = (NSDate *)a3;
    v14->_stop = (NSDate *)a4;
    v14->_distanceGps = a5;
    v14->_distanceRawPed = a6;
    v14->_steps = a7;
    v14->_gpsSource = a8;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CalibrationTrack)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CalibrationTrack;
  v4 = [(CalibrationTrack *)&v9 init];
  if (v4)
  {
    v4->_start = (NSDate *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCMCalibrationTrackCodingKeyStart"];
    v4->_stop = (NSDate *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCMCalibrationTrackCodingKeyStop"];
    [a3 decodeDoubleForKey:@"kCMCalibrationTrackCodingKeyDistanceGps"];
    v4->_distanceGps = v5;
    [a3 decodeDoubleForKey:@"kCMCalibrationTrackCodingKeyDistanceRawPed"];
    v4->_distanceRawPed = v6;
    [a3 decodeDoubleForKey:@"kCMCalibrationTrackCodingKeySteps"];
    v4->_steps = v7;
    v4->_gpsSource = [a3 decodeInt32ForKey:@"kCMCalibrationTrackCodingKeyGpsSource"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_start forKey:@"kCMCalibrationTrackCodingKeyStart"];
  [a3 encodeObject:self->_stop forKey:@"kCMCalibrationTrackCodingKeyStop"];
  [a3 encodeDouble:@"kCMCalibrationTrackCodingKeyDistanceGps" forKey:self->_distanceGps];
  [a3 encodeDouble:@"kCMCalibrationTrackCodingKeyDistanceRawPed" forKey:self->_distanceRawPed];
  [a3 encodeDouble:@"kCMCalibrationTrackCodingKeySteps" forKey:self->_steps];
  uint64_t gpsSource = self->_gpsSource;

  [a3 encodeInt32:gpsSource forKey:@"kCMCalibrationTrackCodingKeyGpsSource"];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CalibrationTrack;
  [(CalibrationTrack *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(NSDate *)[(CalibrationTrack *)self start] timeIntervalSinceReferenceDate];
  uint64_t v6 = v5;
  [(NSDate *)[(CalibrationTrack *)self stop] timeIntervalSinceReferenceDate];
  uint64_t v8 = v7;
  [(CalibrationTrack *)self distanceGps];
  uint64_t v10 = v9;
  [(CalibrationTrack *)self distanceRawPed];
  uint64_t v12 = v11;
  [(CalibrationTrack *)self steps];
  return +[NSString stringWithFormat:@"%@,TimeStart,%0.2f,TimeEnd,%0.2f,DistanceGps,%0.2f,DistanceRawPed,%0.2f,Steps,%0.2f,GpsSource,%ld", v4, v6, v8, v10, v12, v13, [(CalibrationTrack *)self gpsSource]];
}

- (NSDate)start
{
  return self->_start;
}

- (void)setStart:(id)a3
{
}

- (NSDate)stop
{
  return self->_stop;
}

- (void)setStop:(id)a3
{
}

- (double)distanceGps
{
  return self->_distanceGps;
}

- (void)setDistanceGps:(double)a3
{
  self->_distanceGps = a3;
}

- (double)distanceRawPed
{
  return self->_distanceRawPed;
}

- (void)setDistanceRawPed:(double)a3
{
  self->_distanceRawPed = a3;
}

- (double)steps
{
  return self->_steps;
}

- (void)setSteps:(double)a3
{
  self->_steps = a3;
}

- (int)gpsSource
{
  return self->_gpsSource;
}

- (void)setGpsSource:(int)a3
{
  self->_uint64_t gpsSource = a3;
}

@end