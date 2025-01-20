@interface NPTSpeedMetric
+ (BOOL)supportsSecureCoding;
- (NPTSpeedMetric)initWithCoder:(id)a3;
- (NPTSpeedMetric)initWithPointInTime:(id)a3 timeSinceStart:(double)a4 bytesTransferred:(int64_t)a5 totalBytesExpected:(int64_t)a6;
- (NPTSpeedMetric)initWithPointInTime:(id)a3 timeSinceStart:(double)a4 bytesTransferred:(int64_t)a5 totalBytesExpected:(int64_t)a6 speed:(double)a7 responsiveness:(int64_t)a8;
- (NSDate)pointInTime;
- (double)speed;
- (double)timeSinceStart;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)bytesTransferred;
- (int64_t)responsiveness;
- (int64_t)totalBytesExpected;
- (void)encodeWithCoder:(id)a3;
- (void)setBytesTransferred:(int64_t)a3;
- (void)setPointInTime:(id)a3;
- (void)setResponsiveness:(int64_t)a3;
- (void)setTimeSinceStart:(double)a3;
- (void)setTotalBytesExpected:(int64_t)a3;
@end

@implementation NPTSpeedMetric

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPTSpeedMetric)initWithPointInTime:(id)a3 timeSinceStart:(double)a4 bytesTransferred:(int64_t)a5 totalBytesExpected:(int64_t)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NPTSpeedMetric;
  v12 = [(NPTSpeedMetric *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_pointInTime, a3);
    v13->_timeSinceStart = a4;
    v13->_bytesTransferred = a5;
    v13->_totalBytesExpected = a6;
    v13->_responsiveness = 0;
  }

  return v13;
}

- (NPTSpeedMetric)initWithPointInTime:(id)a3 timeSinceStart:(double)a4 bytesTransferred:(int64_t)a5 totalBytesExpected:(int64_t)a6 speed:(double)a7 responsiveness:(int64_t)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)NPTSpeedMetric;
  v16 = [(NPTSpeedMetric *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_pointInTime, a3);
    v17->_timeSinceStart = a4;
    v17->_bytesTransferred = a5;
    v17->_totalBytesExpected = a6;
    v17->_responsiveness = a8;
    v17->privateSpeed = a7;
  }

  return v17;
}

- (double)speed
{
  double result = self->privateSpeed;
  if (result <= 0.0)
  {
    double v4 = (double)[(NPTSpeedMetric *)self bytesTransferred] * 8.0;
    [(NPTSpeedMetric *)self timeSinceStart];
    return v4 / v5 / 1000000.0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v4 = [+[NPTSpeedMetric allocWithZone:a3] init];
  double v5 = [(NPTSpeedMetric *)self pointInTime];
  [(NPTSpeedMetric *)v4 setPointInTime:v5];

  [(NPTSpeedMetric *)self timeSinceStart];
  -[NPTSpeedMetric setTimeSinceStart:](v4, "setTimeSinceStart:");
  [(NPTSpeedMetric *)v4 setBytesTransferred:[(NPTSpeedMetric *)self bytesTransferred]];
  [(NPTSpeedMetric *)v4 setTotalBytesExpected:[(NPTSpeedMetric *)self totalBytesExpected]];
  [(NPTSpeedMetric *)v4 setResponsiveness:[(NPTSpeedMetric *)self responsiveness]];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[NPTSpeedMetric bytesTransferred](self, "bytesTransferred"), @"bytesTransferred");
  objc_msgSend(v5, "encodeInteger:forKey:", -[NPTSpeedMetric totalBytesExpected](self, "totalBytesExpected"), @"totalBytesExpected");
  [(NPTSpeedMetric *)self timeSinceStart];
  objc_msgSend(v5, "encodeDouble:forKey:", @"timeSinceStart");
  double v4 = [(NPTSpeedMetric *)self pointInTime];
  [v5 encodeObject:v4 forKey:@"pointInTime"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[NPTSpeedMetric responsiveness](self, "responsiveness"), @"responsiveness");
}

- (NPTSpeedMetric)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NPTSpeedMetric;
  id v3 = a3;
  double v4 = [(NPTSpeedMetric *)&v7 init];
  -[NPTSpeedMetric setBytesTransferred:](v4, "setBytesTransferred:", (int)objc_msgSend(v3, "decodeIntegerForKey:", @"bytesTransferred", v7.receiver, v7.super_class));
  -[NPTSpeedMetric setTotalBytesExpected:](v4, "setTotalBytesExpected:", (int)[v3 decodeIntegerForKey:@"totalBytesExpected"]);
  [v3 decodeDoubleForKey:@"timeSinceStart"];
  -[NPTSpeedMetric setTimeSinceStart:](v4, "setTimeSinceStart:");
  id v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"pointInTime"];
  [(NPTSpeedMetric *)v4 setPointInTime:v5];

  LODWORD(v5) = [v3 decodeIntegerForKey:@"responsiveness"];
  [(NPTSpeedMetric *)v4 setResponsiveness:(int)v5];
  return v4;
}

- (NSDate)pointInTime
{
  return self->_pointInTime;
}

- (void)setPointInTime:(id)a3
{
}

- (double)timeSinceStart
{
  return self->_timeSinceStart;
}

- (void)setTimeSinceStart:(double)a3
{
  self->_timeSinceStart = a3;
}

- (int64_t)bytesTransferred
{
  return self->_bytesTransferred;
}

- (void)setBytesTransferred:(int64_t)a3
{
  self->_bytesTransferred = a3;
}

- (int64_t)totalBytesExpected
{
  return self->_totalBytesExpected;
}

- (void)setTotalBytesExpected:(int64_t)a3
{
  self->_totalBytesExpected = a3;
}

- (int64_t)responsiveness
{
  return self->_responsiveness;
}

- (void)setResponsiveness:(int64_t)a3
{
  self->_responsiveness = a3;
}

- (void).cxx_destruct
{
}

@end