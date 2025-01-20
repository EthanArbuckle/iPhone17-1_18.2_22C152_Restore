@interface NTKFloatCurveElement
- (CAMediaTimingFunction)timingFunction;
- (NTKFloatCurveElement)initWithFloatValue:(double)a3 fraction:(double)a4;
- (double)floatValue;
- (double)fraction;
- (int64_t)curve;
- (void)setCurve:(int64_t)a3;
- (void)setFloatValue:(double)a3;
- (void)setFraction:(double)a3;
- (void)setTimingFunction:(id)a3;
@end

@implementation NTKFloatCurveElement

- (NTKFloatCurveElement)initWithFloatValue:(double)a3 fraction:(double)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NTKFloatCurveElement;
  v6 = [(NTKFloatCurveElement *)&v10 init];
  v7 = v6;
  if (v6)
  {
    [(NTKFloatCurveElement *)v6 setFloatValue:a3];
    [(NTKFloatCurveElement *)v7 setFraction:a4];
    [(NTKFloatCurveElement *)v7 setCurve:0];
    v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [(NTKFloatCurveElement *)v7 setTimingFunction:v8];
  }
  return v7;
}

- (double)floatValue
{
  return self->_floatValue;
}

- (void)setFloatValue:(double)a3
{
  self->_floatValue = a3;
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (int64_t)curve
{
  return self->_curve;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
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
}

@end