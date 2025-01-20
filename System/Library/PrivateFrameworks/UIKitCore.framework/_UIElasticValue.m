@interface _UIElasticValue
- (BOOL)isSteady;
- (_UIElasticValue)init;
- (_UIElasticValue)initWithValue:(double)a3;
- (double)currentValue;
- (double)friction;
- (double)momentum;
- (double)speed;
- (double)targetValue;
- (id)description;
- (void)setCurrentValue:(double)a3;
- (void)setFriction:(double)a3;
- (void)setMomentum:(double)a3;
- (void)setSpeed:(double)a3;
- (void)setTargetValue:(double)a3;
- (void)update:(double)a3;
- (void)updateFromDisplayLink:(id)a3;
@end

@implementation _UIElasticValue

- (_UIElasticValue)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIElasticValue;
  v2 = [(_UIElasticValue *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_targetValue = 0.0;
    v2->_speed = 0.0;
    *(_OWORD *)&v2->_friction = xmmword_186B9B490;
    v4 = v2;
  }

  return v3;
}

- (_UIElasticValue)initWithValue:(double)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UIElasticValue;
  v4 = [(_UIElasticValue *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_targetValue = a3;
    objc_super v6 = v4;
  }

  return v5;
}

- (void)update:(double)a3
{
  double currentValue = self->_currentValue;
  double v4 = self->_speed * self->_momentum + (self->_targetValue - currentValue) * (1.0 - self->_friction);
  self->_speed = v4;
  self->_double currentValue = currentValue + v4 * a3;
}

- (void)updateFromDisplayLink:(id)a3
{
  id v8 = a3;
  [v8 duration];
  double v5 = v4;
  double v6 = 0.0;
  if (v5 > 0.0)
  {
    objc_msgSend(v8, "duration", 0.0);
    double v6 = 0.0166666667 / v7;
  }
  [(_UIElasticValue *)self update:v6];
}

- (BOOL)isSteady
{
  double speed = self->_speed;
  if (speed != 0.0)
  {
    float v3 = speed * 1000.0;
    double speed = roundf(v3) / 1000.0;
  }
  return speed == 0.0;
}

- (id)description
{
  float v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_UIElasticValue;
  double v4 = [(_UIElasticValue *)&v11 description];
  long long v10 = *(_OWORD *)&self->_currentValue;
  double speed = self->_speed;
  BOOL v6 = [(_UIElasticValue *)self isSteady];
  double v7 = @"NO";
  if (v6) {
    double v7 = @"YES";
  }
  id v8 = [v3 stringWithFormat:@"%@ {currentValue = %0.3f, targetValue = %0.3f, speed = %f, steady = %@}", v4, v10, *(void *)&speed, v7];

  return v8;
}

- (double)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(double)a3
{
  self->_double currentValue = a3;
}

- (double)targetValue
{
  return self->_targetValue;
}

- (void)setTargetValue:(double)a3
{
  self->_targetValue = a3;
}

- (double)speed
{
  return self->_speed;
}

- (void)setSpeed:(double)a3
{
  self->_double speed = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)momentum
{
  return self->_momentum;
}

- (void)setMomentum:(double)a3
{
  self->_momentum = a3;
}

@end