@interface PUIColorHSBValues
- (PUIColorHSBValues)initWithColor:(id)a3;
- (PUIColorHSBValues)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5;
- (double)brightness;
- (double)hue;
- (double)saturation;
- (id)colorWithAlpha:(double)a3;
- (id)hslValues;
@end

@implementation PUIColorHSBValues

- (PUIColorHSBValues)initWithColor:(id)a3
{
  double v6 = 0.0;
  double v7 = 0.0;
  double v5 = 1.0;
  [a3 getHue:&v7 saturation:&v6 brightness:&v5 alpha:0];
  return [(PUIColorHSBValues *)self initWithHue:v7 saturation:v6 brightness:v5];
}

- (PUIColorHSBValues)initWithHue:(double)a3 saturation:(double)a4 brightness:(double)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PUIColorHSBValues;
  result = [(PUIColorHSBValues *)&v9 init];
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
  double v6 = [[PUIColorHSLValues alloc] initWithHue:self->_hue saturation:v5 luminance:v3];
  return v6;
}

- (id)colorWithAlpha:(double)a3
{
  double v5 = (void *)MEMORY[0x263F1C550];
  [(PUIColorHSBValues *)self hue];
  double v7 = v6;
  [(PUIColorHSBValues *)self saturation];
  double v9 = v8;
  [(PUIColorHSBValues *)self brightness];
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