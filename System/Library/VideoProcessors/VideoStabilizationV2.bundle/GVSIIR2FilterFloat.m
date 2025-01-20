@interface GVSIIR2FilterFloat
- (GVSIIR2FilterFloat)init;
- (float)filteredValue;
- (float)updateValue:(float)result withPole:(float)a4;
- (void)applyOffset:(float)a3;
- (void)reset;
@end

@implementation GVSIIR2FilterFloat

- (GVSIIR2FilterFloat)init
{
  v5.receiver = self;
  v5.super_class = (Class)GVSIIR2FilterFloat;
  v2 = [(GVSIIR2FilterFloat *)&v5 init];
  v3 = v2;
  if (v2) {
    [(GVSIIR2FilterFloat *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  self->_filteredValue = 0.0;
  *(void *)&self->_lowPassBuffer1 = 0;
  self->_isFilterInitialized = 0;
}

- (float)updateValue:(float)result withPole:(float)a4
{
  if (a4 > 1.0 || a4 < 0.0) {
    return self->_filteredValue;
  }
  if (self->_isFilterInitialized)
  {
    float v4 = result + (float)(a4 * (float)(self->_lowPassBuffer1 - result));
    result = v4 + (float)(a4 * (float)(self->_lowPassBuffer2 - v4));
    self->_lowPassBuffer1 = v4;
    self->_lowPassBuffer2 = result;
  }
  else
  {
    self->_lowPassBuffer1 = result;
    self->_lowPassBuffer2 = result;
    self->_isFilterInitialized = 1;
  }
  self->_filteredValue = result;
  return result;
}

- (void)applyOffset:(float)a3
{
  *(float32x2_t *)&self->_lowPassBuffer1 = vadd_f32(*(float32x2_t *)&self->_lowPassBuffer1, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&a3, 0));
  self->_filteredValue = self->_filteredValue + a3;
}

- (float)filteredValue
{
  return self->_filteredValue;
}

@end