@interface CLSerializableWalkingSpeedStrideCal
+ (BOOL)supportsSecureCoding;
- (CLSerializableWalkingSpeedStrideCal)initWithCoder:(id)a3;
- (CLSerializableWalkingSpeedStrideCal)initWithWalkingSpeedStrideCal:(const WalkingSpeedStrideCal *)a3;
- (id).cxx_construct;
- (void)encodeWithCoder:(id)a3;
- (void)getWalkingSpeedStrideCal:(WalkingSpeedStrideCal *)a3;
@end

@implementation CLSerializableWalkingSpeedStrideCal

- (CLSerializableWalkingSpeedStrideCal)initWithWalkingSpeedStrideCal:(const WalkingSpeedStrideCal *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSerializableWalkingSpeedStrideCal;
  result = [(CLSerializableWalkingSpeedStrideCal *)&v7 init];
  if (result)
  {
    long long v5 = *(_OWORD *)&a3->startTime;
    long long v6 = *(_OWORD *)&a3->cadenceWatch;
    *(_OWORD *)&result->_strideCal.meanWalkingSpeed = *(_OWORD *)&a3->meanWalkingSpeed;
    *(_OWORD *)&result->_strideCal.cadenceWatch = v6;
    *(_OWORD *)&result->_strideCal.startTime = v5;
  }
  return result;
}

- (void)getWalkingSpeedStrideCal:(WalkingSpeedStrideCal *)a3
{
  long long v3 = *(_OWORD *)&self->_strideCal.startTime;
  long long v4 = *(_OWORD *)&self->_strideCal.meanWalkingSpeed;
  *(_OWORD *)&a3->cadenceWatch = *(_OWORD *)&self->_strideCal.cadenceWatch;
  *(_OWORD *)&a3->meanWalkingSpeed = v4;
  *(_OWORD *)&a3->startTime = v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeDouble:@"startTime" forKey:self->_strideCal.startTime];
  [a3 encodeDouble:@"endTime" forKey:self->_strideCal.endTime];
  [a3 encodeDouble:@"cadenceWatch" forKey:self->_strideCal.cadenceWatch];
  [a3 encodeDouble:@"cadenceGaitCycle" forKey:self->_strideCal.cadenceGaitCycle];
  [a3 encodeDouble:@"meanWalkingSpeed" forKey:self->_strideCal.meanWalkingSpeed];
  double gaitCycleYield = self->_strideCal.gaitCycleYield;

  [a3 encodeDouble:@"gaitCycleYield" forKey:gaitCycleYield];
}

- (CLSerializableWalkingSpeedStrideCal)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CLSerializableWalkingSpeedStrideCal;
  long long v4 = [(CLSerializableWalkingSpeedStrideCal *)&v12 init];
  if (v4)
  {
    [a3 decodeDoubleForKey:@"startTime"];
    v4->_strideCal.startTime = v5;
    [a3 decodeDoubleForKey:@"endTime"];
    v4->_strideCal.endTime = v6;
    [a3 decodeDoubleForKey:@"cadenceWatch"];
    v4->_strideCal.cadenceWatch = v7;
    [a3 decodeDoubleForKey:@"cadenceGaitCycle"];
    v4->_strideCal.cadenceGaitCycle = v8;
    [a3 decodeDoubleForKey:@"meanWalkingSpeed"];
    v4->_strideCal.meanWalkingSpeed = v9;
    [a3 decodeDoubleForKey:@"gaitCycleYield"];
    v4->_strideCal.double gaitCycleYield = v10;
  }
  return v4;
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end