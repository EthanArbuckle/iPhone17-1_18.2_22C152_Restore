@interface CLMobilityCalGaitMetrics
+ (BOOL)supportsSecureCoding;
- (CLMobilityCalGaitMetrics)initWithCoder:(id)a3;
- (CLMobilityCalGaitMetrics)initWithGaitMetrics:(const GaitMetrics *)a3;
- (CLMobilityCalGaitMetrics)initWithRecordId:(int)a3 startTime:(double)a4 timestamp:(unint64_t)a5 walkingSpeed:(float)a6 stepLength:(float)a7 cycleTime:(float)a8;
- (double)startTime;
- (float)cycleTime;
- (float)stepLength;
- (float)walkingSpeed;
- (id)description;
- (int)recordId;
- (unint64_t)timestamp;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMobilityCalGaitMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMobilityCalGaitMetrics)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLMobilityCalGaitMetrics;
  v4 = [(CLMobilityCalGaitMetrics *)&v10 init];
  if (v4)
  {
    v4->_recordId = [a3 decodeInt32ForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_startTime = v5;
    v4->_timestamp = (unint64_t)[a3 decodeInt64ForKey:@"timestamp"];
    [a3 decodeFloatForKey:@"walkingSpeed"];
    v4->_walkingSpeed = v6;
    [a3 decodeFloatForKey:@"stepLength"];
    v4->_stepLength = v7;
    [a3 decodeFloatForKey:@"cycleTime"];
    v4->_cycleTime = v8;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_recordId forKey:@"recordId"];
  [a3 encodeDouble:@"startTime" forKey:self->_startTime];
  [a3 encodeInt64:self->_timestamp forKey:@"timestamp"];
  *(float *)&double v5 = self->_walkingSpeed;
  [a3 encodeFloat:@"walkingSpeed" forKey:v5];
  *(float *)&double v6 = self->_stepLength;
  [a3 encodeFloat:@"stepLength" forKey:v6];
  *(float *)&double v7 = self->_cycleTime;

  [a3 encodeFloat:@"cycleTime" forKey:v7];
}

- (CLMobilityCalGaitMetrics)initWithRecordId:(int)a3 startTime:(double)a4 timestamp:(unint64_t)a5 walkingSpeed:(float)a6 stepLength:(float)a7 cycleTime:(float)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CLMobilityCalGaitMetrics;
  result = [(CLMobilityCalGaitMetrics *)&v15 init];
  if (result)
  {
    result->_recordId = a3;
    result->_startTime = a4;
    result->_timestamp = a5;
    result->_walkingSpeed = a6;
    result->_stepLength = a7;
    result->_cycleTime = a8;
  }
  return result;
}

- (CLMobilityCalGaitMetrics)initWithGaitMetrics:(const GaitMetrics *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLMobilityCalGaitMetrics;
  result = [(CLMobilityCalGaitMetrics *)&v5 init];
  if (result)
  {
    result->_recordId = *(_DWORD *)&a3->var0;
    *(void *)&result->_startTime = a3->var8;
    result->_timestamp = a3->var9;
    result->_walkingSpeed = a3->var10;
    result->_stepLength = a3->var12;
    result->_cycleTime = a3->var16;
  }
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [(CLMobilityCalGaitMetrics *)self recordId];
  [(CLMobilityCalGaitMetrics *)self startTime];
  uint64_t v7 = v6;
  unint64_t v8 = [(CLMobilityCalGaitMetrics *)self timestamp];
  [(CLMobilityCalGaitMetrics *)self walkingSpeed];
  double v10 = v9;
  [(CLMobilityCalGaitMetrics *)self stepLength];
  double v12 = v11;
  [(CLMobilityCalGaitMetrics *)self cycleTime];
  return +[NSString stringWithFormat:@"%@,<recordId %d, startTime %f, timestamp %llu, walkingSpeed %f, stepLength %f, cycleTime %f>", v4, v5, v7, v8, *(void *)&v10, *(void *)&v12, v13];
}

- (int)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (float)walkingSpeed
{
  return self->_walkingSpeed;
}

- (float)stepLength
{
  return self->_stepLength;
}

- (float)cycleTime
{
  return self->_cycleTime;
}

@end