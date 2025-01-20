@interface CLWorkoutDistanceCoreAnalytics
+ (BOOL)supportsSecureCoding;
- (CLWorkoutDistanceCoreAnalytics)initWithBeginTime:(double)a3 endTime:(double)a4 totalDistanceStepCount:(double)a5 totalDistanceStepCountMobility:(double)a6 totalDistanceOdometer:(double)a7 totalDistanceFused:(double)a8 percentageRemoteGPSSource:(double)a9 meanPaceStepCount:(double)a10 meanPaceFinalFused:(double)a11 totalStepCount:(int)a12;
- (CLWorkoutDistanceCoreAnalytics)initWithCoder:(id)a3;
- (CLWorkoutDistanceCoreAnalytics)initWithWorkoutDistanceMeasures:(const WorkoutDistanceMeasures *)a3;
- (double)beginTime;
- (double)endTime;
- (double)meanPaceFinalFused;
- (double)meanPaceStepCount;
- (double)percentageRemoteGPSSource;
- (double)totalDistanceFused;
- (double)totalDistanceOdometer;
- (double)totalDistanceStepCount;
- (double)totalDistanceStepCountMobility;
- (id)description;
- (int)totalStepCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLWorkoutDistanceCoreAnalytics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLWorkoutDistanceCoreAnalytics)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CLWorkoutDistanceCoreAnalytics;
  v4 = [(CLWorkoutDistanceCoreAnalytics *)&v15 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"beginTime"];
    v4->_beginTime = v5;
    [a3 decodeDoubleForKey:@"endTime"];
    v4->_endTime = v6;
    [a3 decodeDoubleForKey:@"totalDistanceStepCount"];
    v4->_totalDistanceStepCount = v7;
    [a3 decodeDoubleForKey:@"totalDistanceStepCountMobility"];
    v4->_totalDistanceStepCountMobility = v8;
    [a3 decodeDoubleForKey:@"totalDistanceOdometer"];
    v4->_totalDistanceOdometer = v9;
    [a3 decodeDoubleForKey:@"totalDistanceFused"];
    v4->_totalDistanceFused = v10;
    [a3 decodeDoubleForKey:@"percentageRemoteGPSSource"];
    v4->_percentageRemoteGPSSource = v11;
    [a3 decodeDoubleForKey:@"meanPaceStepCount"];
    v4->_meanPaceStepCount = v12;
    [a3 decodeDoubleForKey:@"meanPaceFinalFused"];
    v4->_meanPaceFinalFused = v13;
    v4->_totalStepCount = [a3 decodeInt32ForKey:@"totalStepCount"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"beginTime" forKey:self->_beginTime];
  [a3 encodeDouble:@"endTime" forKey:self->_endTime];
  [a3 encodeDouble:@"totalDistanceStepCount" forKey:self->_totalDistanceStepCount];
  [a3 encodeDouble:@"totalDistanceStepCountMobility" forKey:self->_totalDistanceStepCountMobility];
  [a3 encodeDouble:@"totalDistanceOdometer" forKey:self->_totalDistanceOdometer];
  [a3 encodeDouble:@"totalDistanceFused" forKey:self->_totalDistanceFused];
  [a3 encodeDouble:@"percentageRemoteGPSSource" forKey:self->_percentageRemoteGPSSource];
  [a3 encodeDouble:@"meanPaceStepCount" forKey:self->_meanPaceStepCount];
  [a3 encodeDouble:@"meanPaceFinalFused" forKey:self->_meanPaceFinalFused];
  uint64_t totalStepCount = self->_totalStepCount;

  [a3 encodeInt32:totalStepCount forKey:@"totalStepCount"];
}

- (CLWorkoutDistanceCoreAnalytics)initWithBeginTime:(double)a3 endTime:(double)a4 totalDistanceStepCount:(double)a5 totalDistanceStepCountMobility:(double)a6 totalDistanceOdometer:(double)a7 totalDistanceFused:(double)a8 percentageRemoteGPSSource:(double)a9 meanPaceStepCount:(double)a10 meanPaceFinalFused:(double)a11 totalStepCount:(int)a12
{
  v22.receiver = self;
  v22.super_class = (Class)CLWorkoutDistanceCoreAnalytics;
  result = [(CLWorkoutDistanceCoreAnalytics *)&v22 init];
  if (result)
  {
    result->_beginTime = a3;
    result->_endTime = a4;
    result->_totalDistanceStepCount = a5;
    result->_totalDistanceStepCountMobility = a6;
    result->_totalDistanceOdometer = a7;
    result->_totalDistanceFused = a8;
    result->_percentageRemoteGPSSource = a9;
    result->_meanPaceStepCount = a10;
    result->_meanPaceFinalFused = a11;
    result->_uint64_t totalStepCount = a12;
  }
  return result;
}

- (CLWorkoutDistanceCoreAnalytics)initWithWorkoutDistanceMeasures:(const WorkoutDistanceMeasures *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLWorkoutDistanceCoreAnalytics;
  result = [(CLWorkoutDistanceCoreAnalytics *)&v5 init];
  if (result)
  {
    result->_beginTime = a3->var0;
    result->_endTime = a3->var1;
    result->_totalDistanceStepCount = a3->var2;
    result->_totalDistanceStepCountMobility = a3->var3;
    result->_totalDistanceOdometer = a3->var4;
    result->_totalDistanceFused = a3->var5;
    result->_percentageRemoteGPSSource = a3->var6;
    result->_meanPaceStepCount = a3->var7;
    result->_meanPaceFinalFused = a3->var8;
    result->_uint64_t totalStepCount = a3->var9;
  }
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  [(CLWorkoutDistanceCoreAnalytics *)self beginTime];
  uint64_t v22 = v5;
  [(CLWorkoutDistanceCoreAnalytics *)self endTime];
  uint64_t v7 = v6;
  [(CLWorkoutDistanceCoreAnalytics *)self totalDistanceStepCount];
  uint64_t v9 = v8;
  [(CLWorkoutDistanceCoreAnalytics *)self totalDistanceStepCount];
  uint64_t v11 = v10;
  [(CLWorkoutDistanceCoreAnalytics *)self totalDistanceOdometer];
  uint64_t v13 = v12;
  [(CLWorkoutDistanceCoreAnalytics *)self totalDistanceFused];
  uint64_t v15 = v14;
  [(CLWorkoutDistanceCoreAnalytics *)self percentageRemoteGPSSource];
  uint64_t v17 = v16;
  [(CLWorkoutDistanceCoreAnalytics *)self meanPaceStepCount];
  uint64_t v19 = v18;
  [(CLWorkoutDistanceCoreAnalytics *)self meanPaceFinalFused];
  return +[NSString stringWithFormat:@"%@,<beginTime %f, endTime %f, totalDistanceStepCount %f, totalDistanceStepCountMobility %f, totalDistanceOdometer %f, totalDistanceFused %f, percentageRemoteGPSSource %f, meanPaceStepCount %f, meanPaceFinalFused %f, totalStepCount %d>", v4, v22, v7, v9, v11, v13, v15, v17, v19, v20, [(CLWorkoutDistanceCoreAnalytics *)self totalStepCount]];
}

- (double)beginTime
{
  return self->_beginTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (double)totalDistanceStepCount
{
  return self->_totalDistanceStepCount;
}

- (double)totalDistanceStepCountMobility
{
  return self->_totalDistanceStepCountMobility;
}

- (double)totalDistanceOdometer
{
  return self->_totalDistanceOdometer;
}

- (double)totalDistanceFused
{
  return self->_totalDistanceFused;
}

- (double)percentageRemoteGPSSource
{
  return self->_percentageRemoteGPSSource;
}

- (double)meanPaceStepCount
{
  return self->_meanPaceStepCount;
}

- (double)meanPaceFinalFused
{
  return self->_meanPaceFinalFused;
}

- (int)totalStepCount
{
  return self->_totalStepCount;
}

@end