@interface NTKColorCurveElement
- (CAMediaTimingFunction)timingFunction;
- (NTKColorCurveElement)initWithColor:(id)a3 fraction:(float)a4;
- (UIColor)color;
- (float)fraction;
- (id)description;
- (void)setColor:(id)a3;
- (void)setFraction:(float)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation NTKColorCurveElement

- (NTKColorCurveElement)initWithColor:(id)a3 fraction:(float)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKColorCurveElement;
  v7 = [(NTKColorCurveElement *)&v13 init];
  v8 = v7;
  if (v7)
  {
    [(NTKColorCurveElement *)v7 setColor:v6];
    *(float *)&double v9 = a4;
    [(NTKColorCurveElement *)v8 setFraction:v9];
    v10 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [(NTKColorCurveElement *)v8 setTimingFunction:v10];

    v11 = v8;
  }

  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: %p> fraction: %f color: %@", objc_opt_class(), self, self->_fraction, self->_color];
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (float)fraction
{
  return self->_fraction;
}

- (void)setFraction:(float)a3
{
  self->_fraction = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_storeStrong((id *)&self->_color, 0);
}

@end