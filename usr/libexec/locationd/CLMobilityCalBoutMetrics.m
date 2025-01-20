@interface CLMobilityCalBoutMetrics
+ (BOOL)supportsSecureCoding;
- (BOOL)isStepLengthValid;
- (BOOL)isWalkingSpeedValid;
- (CLMobilityCalBoutMetrics)initWithBoutMetrics:(const BoutMetrics *)a3;
- (CLMobilityCalBoutMetrics)initWithCoder:(id)a3;
- (CLMobilityCalBoutMetrics)initWithRecordId:(int)a3 startTime:(double)a4 endTime:(double)a5 invalidGradePercentage:(double)a6 boundaryType:(int)a7 isWalkingSpeedValid:(BOOL)a8 isStepLengthValid:(BOOL)a9;
- (double)endTime;
- (double)invalidGradePercentage;
- (double)startTime;
- (id)description;
- (int)boundaryType;
- (int)recordId;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLMobilityCalBoutMetrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLMobilityCalBoutMetrics)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLMobilityCalBoutMetrics;
  v4 = [(CLMobilityCalBoutMetrics *)&v9 init];
  if (v4)
  {
    v4->_recordId = [a3 decodeInt32ForKey:@"recordId"];
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_startTime = v5;
    [a3 decodeDoubleForKey:@"endTime"];
    v4->_endTime = v6;
    [a3 decodeDoubleForKey:@"invalidGradePercentage"];
    v4->_invalidGradePercentage = v7;
    v4->_boundaryType = [a3 decodeIntForKey:@"boundaryType"];
    v4->_isWalkingSpeedValid = [a3 decodeBoolForKey:@"isWalkingSpeedValid"];
    v4->_isStepLengthValid = [a3 decodeBoolForKey:@"isStepLengthValid"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_recordId forKey:@"recordId"];
  [a3 encodeDouble:@"startTime" forKey:self->_startTime];
  [a3 encodeDouble:@"endTime" forKey:self->_endTime];
  [a3 encodeDouble:@"invalidGradePercentage" forKey:self->_invalidGradePercentage];
  [a3 encodeInt:self->_boundaryType forKey:@"boundaryType"];
  [a3 encodeBool:self->_isWalkingSpeedValid forKey:@"isWalkingSpeedValid"];
  BOOL isStepLengthValid = self->_isStepLengthValid;

  [a3 encodeBool:isStepLengthValid forKey:@"isStepLengthValid"];
}

- (CLMobilityCalBoutMetrics)initWithRecordId:(int)a3 startTime:(double)a4 endTime:(double)a5 invalidGradePercentage:(double)a6 boundaryType:(int)a7 isWalkingSpeedValid:(BOOL)a8 isStepLengthValid:(BOOL)a9
{
  v17.receiver = self;
  v17.super_class = (Class)CLMobilityCalBoutMetrics;
  result = [(CLMobilityCalBoutMetrics *)&v17 init];
  if (result)
  {
    result->_startTime = a4;
    result->_endTime = a5;
    result->_invalidGradePercentage = a6;
    result->_recordId = a3;
    result->_boundaryType = a7;
    result->_isWalkingSpeedValid = a8;
    result->_BOOL isStepLengthValid = a9;
  }
  return result;
}

- (CLMobilityCalBoutMetrics)initWithBoutMetrics:(const BoutMetrics *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLMobilityCalBoutMetrics;
  result = [(CLMobilityCalBoutMetrics *)&v8 init];
  if (result)
  {
    int recordId = a3->recordId;
    result->_startTime = a3->startTime;
    result->_endTime = a3->endTime;
    result->_invalidGradePercentage = a3->invalidGradePercentage;
    int boundaryType = a3->boundaryType;
    result->_int recordId = recordId;
    result->_int boundaryType = boundaryType;
    if (boundaryType) {
      int v7 = 42;
    }
    else {
      int v7 = -1;
    }
    result->_isWalkingSpeedValid = (v7 & a3->walkingSpeedRejectionStatus) == 0;
    result->_BOOL isStepLengthValid = (a3->stepLengthRejectionStatus & v7) == 0;
  }
  return result;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  uint64_t v5 = [(CLMobilityCalBoutMetrics *)self recordId];
  [(CLMobilityCalBoutMetrics *)self startTime];
  uint64_t v7 = v6;
  [(CLMobilityCalBoutMetrics *)self endTime];
  uint64_t v9 = v8;
  [(CLMobilityCalBoutMetrics *)self invalidGradePercentage];
  return +[NSString stringWithFormat:@"%@,<recordId %d, startTime %f, endTime %f, invalidGradePercentage %f, boundaryType %d, isWalkingSpeedValid %d, isStepLengthValid %d>", v4, v5, v7, v9, v10, [(CLMobilityCalBoutMetrics *)self boundaryType], [(CLMobilityCalBoutMetrics *)self isWalkingSpeedValid], [(CLMobilityCalBoutMetrics *)self isStepLengthValid]];
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

- (double)invalidGradePercentage
{
  return self->_invalidGradePercentage;
}

- (int)boundaryType
{
  return self->_boundaryType;
}

- (BOOL)isWalkingSpeedValid
{
  return self->_isWalkingSpeedValid;
}

- (BOOL)isStepLengthValid
{
  return self->_isStepLengthValid;
}

@end