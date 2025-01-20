@interface PUDynamicValueFilter
- (PUDynamicValueFilter)init;
- (double)currentTime;
- (double)outputValue;
- (double)outputValueChangeRate;
- (double)targetValue;
- (double)updatedValue:(double)a3 withTargetValue:(double)a4 timeInterval:(double)a5;
- (void)_update;
- (void)setCurrentTime:(double)a3;
- (void)setTargetValue:(double)a3;
@end

@implementation PUDynamicValueFilter

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setTargetValue:(double)a3
{
  self->_targetValue = a3;
}

- (double)targetValue
{
  return self->_targetValue;
}

- (double)updatedValue:(double)a3 withTargetValue:(double)a4 timeInterval:(double)a5
{
  return a4;
}

- (void)_update
{
  [(PUDynamicValueFilter *)self currentTime];
  double v4 = v3;
  [(PUValueFilter *)self currentValue];
  double v6 = v5;
  [(PUDynamicValueFilter *)self targetValue];
  double v8 = v7;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v10 = v9;
  [(PUDynamicValueFilter *)self updatedValue:v6 withTargetValue:v8 timeInterval:v9 - v4];
  -[PUValueFilter setCurrentValue:](self, "setCurrentValue:");
  [(PUDynamicValueFilter *)self setCurrentTime:v10];
}

- (double)outputValueChangeRate
{
  [(PUDynamicValueFilter *)self currentTime];
  double v4 = v3;
  [(PUValueFilter *)self currentValue];
  double v6 = v5;
  [(PUDynamicValueFilter *)self _update];
  [(PUDynamicValueFilter *)self currentTime];
  double v8 = v7;
  [(PUValueFilter *)self currentValue];
  return (v9 - v6) / (v8 - v4);
}

- (double)outputValue
{
  [(PUDynamicValueFilter *)self _update];
  [(PUValueFilter *)self currentValue];
  return result;
}

- (PUDynamicValueFilter)init
{
  v4.receiver = self;
  v4.super_class = (Class)PUDynamicValueFilter;
  v2 = [(PUValueFilter *)&v4 init];
  if (v2)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    -[PUDynamicValueFilter setCurrentTime:](v2, "setCurrentTime:");
  }
  return v2;
}

@end