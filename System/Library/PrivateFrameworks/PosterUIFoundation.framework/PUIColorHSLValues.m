@interface PUIColorHSLValues
- (PUIColorHSLValues)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5;
- (double)hue;
- (double)luminance;
- (double)saturation;
- (id)hsbValues;
@end

@implementation PUIColorHSLValues

- (PUIColorHSLValues)initWithHue:(double)a3 saturation:(double)a4 luminance:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PUIColorHSLValues;
  result = [(PUIColorHSLValues *)&v9 init];
  if (result)
  {
    result->_hue = a3;
    result->_saturation = a4;
    result->_luminance = a5;
  }
  return result;
}

- (id)hsbValues
{
  double luminance = self->_luminance;
  double v3 = 1.0 - luminance;
  if (luminance < 1.0 - luminance) {
    double v3 = self->_luminance;
  }
  double v4 = luminance + self->_saturation * v3;
  double v5 = 0.0;
  if (v4 > 0.0) {
    double v5 = 2.0 - (luminance + luminance) / v4;
  }
  v6 = [[PUIColorHSBValues alloc] initWithHue:self->_hue saturation:v5 brightness:v4];
  return v6;
}

- (double)hue
{
  return self->_hue;
}

- (double)saturation
{
  return self->_saturation;
}

- (double)luminance
{
  return self->_luminance;
}

@end