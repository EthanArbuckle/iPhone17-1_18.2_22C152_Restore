@interface MattingV2SemanticConfig
- (BOOL)constraintsEnabled;
- (BOOL)useDepthFilter;
- (float)bgThresholdValue;
- (float)epsilon;
- (float)fgThresholdValue;
- (unsigned)erosionKernelSize;
- (unsigned)height;
- (unsigned)iterations;
- (unsigned)kernelSpatialDiameter;
- (unsigned)width;
- (void)setBgThresholdValue:(float)a3;
- (void)setConstraintsEnabled:(BOOL)a3;
- (void)setEpsilon:(float)a3;
- (void)setErosionKernelSize:(unsigned int)a3;
- (void)setFgThresholdValue:(float)a3;
- (void)setHeight:(unsigned int)a3;
- (void)setIterations:(unsigned int)a3;
- (void)setKernelSpatialDiameter:(unsigned int)a3;
- (void)setUseDepthFilter:(BOOL)a3;
- (void)setWidth:(unsigned int)a3;
@end

@implementation MattingV2SemanticConfig

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  self->_height = a3;
}

- (unsigned)kernelSpatialDiameter
{
  return self->_kernelSpatialDiameter;
}

- (void)setKernelSpatialDiameter:(unsigned int)a3
{
  self->_kernelSpatialDiameter = a3;
}

- (float)epsilon
{
  return self->_epsilon;
}

- (void)setEpsilon:(float)a3
{
  self->_epsilon = a3;
}

- (unsigned)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unsigned int)a3
{
  self->_iterations = a3;
}

- (BOOL)useDepthFilter
{
  return self->_useDepthFilter;
}

- (void)setUseDepthFilter:(BOOL)a3
{
  self->_useDepthFilter = a3;
}

- (BOOL)constraintsEnabled
{
  return self->_constraintsEnabled;
}

- (void)setConstraintsEnabled:(BOOL)a3
{
  self->_constraintsEnabled = a3;
}

- (float)fgThresholdValue
{
  return self->_fgThresholdValue;
}

- (void)setFgThresholdValue:(float)a3
{
  self->_fgThresholdValue = a3;
}

- (float)bgThresholdValue
{
  return self->_bgThresholdValue;
}

- (void)setBgThresholdValue:(float)a3
{
  self->_bgThresholdValue = a3;
}

- (unsigned)erosionKernelSize
{
  return self->_erosionKernelSize;
}

- (void)setErosionKernelSize:(unsigned int)a3
{
  self->_erosionKernelSize = a3;
}

@end