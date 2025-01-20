@interface _NURAWNoiseReductionProperties
- (NSString)description;
- (double)color;
- (double)contrast;
- (double)detail;
- (double)luminance;
- (double)sharpness;
- (void)setColor:(double)a3;
- (void)setContrast:(double)a3;
- (void)setDetail:(double)a3;
- (void)setLuminance:(double)a3;
- (void)setSharpness:(double)a3;
@end

@implementation _NURAWNoiseReductionProperties

- (void)setDetail:(double)a3
{
  self->_detail = a3;
}

- (double)detail
{
  return self->_detail;
}

- (void)setContrast:(double)a3
{
  self->_contrast = a3;
}

- (double)contrast
{
  return self->_contrast;
}

- (void)setSharpness:(double)a3
{
  self->_sharpness = a3;
}

- (double)sharpness
{
  return self->_sharpness;
}

- (void)setColor:(double)a3
{
  self->_color = a3;
}

- (double)color
{
  return self->_color;
}

- (void)setLuminance:(double)a3
{
  self->_luminance = a3;
}

- (double)luminance
{
  return self->_luminance;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(_NURAWNoiseReductionProperties *)self luminance];
  uint64_t v6 = v5;
  [(_NURAWNoiseReductionProperties *)self color];
  uint64_t v8 = v7;
  [(_NURAWNoiseReductionProperties *)self sharpness];
  uint64_t v10 = v9;
  [(_NURAWNoiseReductionProperties *)self contrast];
  uint64_t v12 = v11;
  [(_NURAWNoiseReductionProperties *)self detail];
  return (NSString *)[v3 stringWithFormat:@"<%@:%p> luminance=%f color=%f sharpness=%f contrast=%f detail=%f", v4, self, v6, v8, v10, v12, v13];
}

@end