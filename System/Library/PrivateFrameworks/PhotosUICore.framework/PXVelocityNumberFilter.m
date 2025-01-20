@interface PXVelocityNumberFilter
+ (id)gestureVelocityFilter;
- (PXVelocityNumberFilter)initWithInput:(double)a3;
- (double)updatedOutput;
@end

@implementation PXVelocityNumberFilter

- (double)updatedOutput
{
  [(PXNumberFilter *)self input];
  double v4 = v3;
  [(PXNumberFilter *)self currentTime];
  double lastTime = self->_lastTime;
  if (v5 < lastTime + self->_minimumSampleInterval) {
    return self->_filteredVelocity;
  }
  double velocity = self->_velocity;
  double v9 = (v4 - self->_lastValue) / (v5 - lastTime);
  double v7 = velocity * self->_previousVelocityWeight + (1.0 - self->_previousVelocityWeight) * v9;
  self->_lastValue = v4;
  self->_double lastTime = v5;
  self->_double velocity = v9;
  self->_previousVelocity = velocity;
  self->_filteredVelocity = v7;
  return v7;
}

- (PXVelocityNumberFilter)initWithInput:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXVelocityNumberFilter;
  result = [(PXNumberFilter *)&v4 initWithInput:a3];
  if (result) {
    result->_minimumSampleInterval = 0.00000011920929;
  }
  return result;
}

+ (id)gestureVelocityFilter
{
  v2 = objc_alloc_init((Class)a1);
  v2[17] = 0x3F80624DE0000000;
  v2[18] = 0x3FE8000000000000;
  return v2;
}

@end