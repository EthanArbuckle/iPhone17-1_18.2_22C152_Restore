@interface PUVelocityFilter
+ (id)gestureVelocityFilter;
- (PUVelocityFilter)init;
- (double)_minimumSampleInterval;
- (double)_previousVelocityWeight;
- (double)outputValue;
- (void)_setMinimumSampleInterval:(double)a3;
- (void)_setPreviousVelocityWeight:(double)a3;
- (void)setInputValue:(double)a3;
@end

@implementation PUVelocityFilter

- (void)_setPreviousVelocityWeight:(double)a3
{
  self->__previousVelocityWeight = a3;
}

- (double)_previousVelocityWeight
{
  return self->__previousVelocityWeight;
}

- (void)_setMinimumSampleInterval:(double)a3
{
  self->__minimumSampleInterval = a3;
}

- (double)_minimumSampleInterval
{
  return self->__minimumSampleInterval;
}

- (double)outputValue
{
  return self->_filteredVelocity;
}

- (void)setInputValue:(double)a3
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double lastTime = self->_lastTime;
  if (v5 >= lastTime + self->__minimumSampleInterval)
  {
    double velocity = self->_velocity;
    double v8 = (a3 - self->_lastValue) / (v5 - lastTime);
    double previousVelocityWeight = self->__previousVelocityWeight;
    self->_lastValue = a3;
    self->_double lastTime = v5;
    self->_double velocity = v8;
    self->_previousVelocity = velocity;
    self->_filteredVelocity = velocity * previousVelocityWeight + (1.0 - previousVelocityWeight) * v8;
  }
}

- (PUVelocityFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUVelocityFilter;
  result = [(PUDynamicValueFilter *)&v3 init];
  if (result) {
    result->__minimumSampleInterval = 0.00000011920929;
  }
  return result;
}

+ (id)gestureVelocityFilter
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 _setMinimumSampleInterval:0.008];
  [v2 _setPreviousVelocityWeight:0.75];
  return v2;
}

@end