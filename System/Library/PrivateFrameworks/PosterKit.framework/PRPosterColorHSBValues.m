@interface PRPosterColorHSBValues
- (PRPosterColorHSBValues)initWithColor:(id)a3;
- (PRPosterColorHSBValues)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5;
- (double)brightness;
- (double)hue;
- (double)saturation;
- (id)colorWithAlpha:(double)a3;
- (id)hslValues;
@end

@implementation PRPosterColorHSBValues

- (PRPosterColorHSBValues)initWithColor:(id)a3
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 1.0;
  [a3 getHue:&v7 saturation:&v6 brightness:&v5 alpha:0];
  return [(PRPosterColorHSBValues *)self initWithHue:v7 saturation:v6 brightness:v5];
}

- (PRPosterColorHSBValues)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PRPosterColorHSBValues;
  result = [(PRPosterColorHSBValues *)&v9 init];
  if (result)
  {
    result->_hue = a3;
    result->_saturation = a4;
    result->_brightness = a5;
  }
  return result;
}

- (id)hslValues
{
  double brightness = self->_brightness;
  double v3 = brightness + brightness * self->_saturation * -0.5;
  double v4 = 1.0 - v3;
  if (v3 < 1.0 - v3) {
    double v4 = brightness + brightness * self->_saturation * -0.5;
  }
  double v5 = 0.0;
  if (v4 > 0.0) {
    double v5 = (brightness - v3) / v4;
  }
  double v6 = [[PRPosterColorHSLValues alloc] initWithHue:self->_hue saturation:v5 luminance:v3];
  return v6;
}

- (id)colorWithAlpha:(double)a3
{
  double v5 = (void *)MEMORY[0x1E4FB1618];
  [(PRPosterColorHSBValues *)self hue];
  double v7 = v6;
  [(PRPosterColorHSBValues *)self saturation];
  double v9 = v8;
  [(PRPosterColorHSBValues *)self brightness];
  return (id)[v5 colorWithHue:v7 saturation:v9 brightness:v10 alpha:a3];
}

- (double)hue
{
  return self->_hue;
}

- (double)saturation
{
  return self->_saturation;
}

- (double)brightness
{
  return self->_brightness;
}

@end