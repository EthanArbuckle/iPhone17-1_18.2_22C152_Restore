@interface CLPredictedWalkDistanceData
+ (BOOL)supportsSecureCoding;
- (CLPredictedWalkDistanceData)initWithCoder:(id)a3;
- (CLPredictedWalkDistanceData)initWithPredictedWalkDistanceBoutEntry:(const CLPredictedWalkDistanceBoutEntry *)a3;
- (double)activeTime;
- (double)distance;
- (double)distanceGPS;
- (double)endTime;
- (double)startTime;
- (id)description;
- (int)boutType;
- (int)recordId;
- (unsigned)elevationAscended;
- (unsigned)elevationDescended;
- (unsigned)stepCount;
- (unsigned)stepCountGPS;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLPredictedWalkDistanceData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLPredictedWalkDistanceData)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CLPredictedWalkDistanceData;
  v4 = [(CLPredictedWalkDistanceData *)&v11 init];
  if (v4)
  {
    v4->_recordId = [a3 decodeIntForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_startTime = v5;
    [a3 decodeDoubleForKey:@"endTime"];
    v4->_endTime = v6;
    v4->_stepCount = [a3 decodeInt32ForKey:@"stepCount"];
    [a3 decodeDoubleForKey:@"distance"];
    v4->_distance = v7;
    [a3 decodeDoubleForKey:@"activeTime"];
    v4->_activeTime = v8;
    v4->_elevationAscended = [a3 decodeInt32ForKey:@"elevationAscended"];
    v4->_elevationDescended = [a3 decodeInt32ForKey:@"elevationDescended"];
    v4->_stepCountGPS = [a3 decodeInt32ForKey:@"stepCountGPS"];
    [a3 decodeDoubleForKey:@"distanceGPS"];
    v4->_distanceGPS = v9;
    v4->_boutType = [a3 decodeIntForKey:@"boutType"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt:self->_recordId forKey:@"recordId"];
  [a3 encodeDouble:@"startTime" forKey:self->_startTime];
  [a3 encodeDouble:@"endTime" forKey:self->_endTime];
  [a3 encodeInt32:self->_stepCount forKey:@"stepCount"];
  [a3 encodeDouble:@"distance" forKey:self->_distance];
  [a3 encodeDouble:@"activeTime" forKey:self->_activeTime];
  [a3 encodeInt32:self->_elevationAscended forKey:@"elevationAscended"];
  [a3 encodeInt32:self->_elevationDescended forKey:@"elevationDescended"];
  [a3 encodeInt32:self->_stepCountGPS forKey:@"stepCountGPS"];
  [a3 encodeDouble:@"distanceGPS" forKey:self->_distanceGPS];
  uint64_t boutType = self->_boutType;

  [a3 encodeInt:boutType forKey:@"boutType"];
}

- (CLPredictedWalkDistanceData)initWithPredictedWalkDistanceBoutEntry:(const CLPredictedWalkDistanceBoutEntry *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLPredictedWalkDistanceData;
  result = [(CLPredictedWalkDistanceData *)&v7 init];
  if (result)
  {
    result->_recordId = a3->recordId;
    result->_startTime = a3->startTime;
    result->_endTime = a3->endTime;
    result->_stepCount = a3->stepCount;
    result->_distance = a3->distance;
    result->_activeTime = a3->activeTime;
    result->_elevationAscended = a3->elevationAscended;
    result->_elevationDescended = a3->elevationDescended;
    unsigned int stepCountGPS = a3->stepCountGPS;
    result->_distanceGPS = a3->distanceGPS;
    int boutType = a3->boutType;
    result->_unsigned int stepCountGPS = stepCountGPS;
    result->_int boutType = boutType;
  }
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [(CLPredictedWalkDistanceData *)self recordId];
  [(CLPredictedWalkDistanceData *)self startTime];
  uint64_t v7 = v6;
  [(CLPredictedWalkDistanceData *)self endTime];
  uint64_t v9 = v8;
  uint64_t v10 = [(CLPredictedWalkDistanceData *)self stepCount];
  [(CLPredictedWalkDistanceData *)self distance];
  uint64_t v12 = v11;
  [(CLPredictedWalkDistanceData *)self activeTime];
  uint64_t v14 = v13;
  uint64_t v15 = [(CLPredictedWalkDistanceData *)self elevationAscended];
  uint64_t v16 = [(CLPredictedWalkDistanceData *)self elevationDescended];
  uint64_t v17 = [(CLPredictedWalkDistanceData *)self stepCountGPS];
  [(CLPredictedWalkDistanceData *)self distanceGPS];
  return +[NSString stringWithFormat:@"%@,<recordId %d, startTime %f, endTime %f, stepCount %u, distance %f, activeTime %f, elevationAscended %u, elevationDescended %u, stepCountGPS %u, distanceGPS %f, boutType %d>", v4, v5, v7, v9, v10, v12, v14, v15, v16, v17, v18, [(CLPredictedWalkDistanceData *)self boutType]];
}

- (int)recordId
{
  return self->_recordId;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)endTime
{
  return self->_endTime;
}

- (unsigned)stepCount
{
  return self->_stepCount;
}

- (double)distance
{
  return self->_distance;
}

- (double)activeTime
{
  return self->_activeTime;
}

- (unsigned)elevationAscended
{
  return self->_elevationAscended;
}

- (unsigned)elevationDescended
{
  return self->_elevationDescended;
}

- (unsigned)stepCountGPS
{
  return self->_stepCountGPS;
}

- (double)distanceGPS
{
  return self->_distanceGPS;
}

- (int)boutType
{
  return self->_boutType;
}

@end