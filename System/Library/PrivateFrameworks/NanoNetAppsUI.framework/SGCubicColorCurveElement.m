@interface SGCubicColorCurveElement
- (__n128)color;
- (double)fraction;
- (void)setColor:(SGCubicColorCurveElement *)self;
- (void)setFraction:(double)a3;
@end

@implementation SGCubicColorCurveElement

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (__n128)color
{
  return a1[1];
}

- (void)setColor:(SGCubicColorCurveElement *)self
{
  *(_OWORD *)self->_color = v2;
}

@end