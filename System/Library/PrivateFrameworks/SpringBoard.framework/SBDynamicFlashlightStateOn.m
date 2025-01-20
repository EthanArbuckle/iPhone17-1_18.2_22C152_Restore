@interface SBDynamicFlashlightStateOn
- (BOOL)isEqual:(id)a3;
- (BOOL)isOn;
- (BOOL)isUnavailable;
- (NSString)description;
- (SBDynamicFlashlightStateOn)initWithInitialIntensity:(double)a3 width:(double)a4;
- (double)initialIntensity;
- (double)initialWidth;
@end

@implementation SBDynamicFlashlightStateOn

- (SBDynamicFlashlightStateOn)initWithInitialIntensity:(double)a3 width:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBDynamicFlashlightStateOn;
  result = [(SBDynamicFlashlightStateOn *)&v7 init];
  if (result)
  {
    result->_initialIntensity = a3;
    result->_initialWidth = a4;
  }
  return result;
}

- (BOOL)isOn
{
  return 1;
}

- (BOOL)isUnavailable
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBDynamicFlashlightStateOn *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      objc_super v7 = v4;
      double initialIntensity = self->_initialIntensity;
      [(SBDynamicFlashlightStateOn *)v7 initialIntensity];
      if (initialIntensity == v9)
      {
        double initialWidth = self->_initialWidth;
        [(SBDynamicFlashlightStateOn *)v7 initialWidth];
        BOOL v6 = initialWidth == v11;
      }
      else
      {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<state=ON, initialIntensity=%.3f, initialWidth=%.3f>", *(void *)&self->_initialIntensity, *(void *)&self->_initialWidth];
}

- (double)initialIntensity
{
  return self->_initialIntensity;
}

- (double)initialWidth
{
  return self->_initialWidth;
}

@end