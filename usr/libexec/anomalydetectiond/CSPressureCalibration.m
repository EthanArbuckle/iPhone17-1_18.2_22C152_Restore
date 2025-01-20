@interface CSPressureCalibration
- (float)inertialX;
- (float)inertialY;
- (float)inertialZ;
- (float)maxTemp;
- (float)medTocFactoryTemp;
- (float)medianToc;
- (unint64_t)timestamp;
- (void)setInertialX:(float)a3;
- (void)setInertialY:(float)a3;
- (void)setInertialZ:(float)a3;
- (void)setMaxTemp:(float)a3;
- (void)setMedTocFactoryTemp:(float)a3;
- (void)setMedianToc:(float)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation CSPressureCalibration

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (float)medianToc
{
  return self->_medianToc;
}

- (void)setMedianToc:(float)a3
{
  self->_medianToc = a3;
}

- (float)medTocFactoryTemp
{
  return self->_medTocFactoryTemp;
}

- (void)setMedTocFactoryTemp:(float)a3
{
  self->_medTocFactoryTemp = a3;
}

- (float)maxTemp
{
  return self->_maxTemp;
}

- (void)setMaxTemp:(float)a3
{
  self->_maxTemp = a3;
}

- (float)inertialX
{
  return self->_inertialX;
}

- (void)setInertialX:(float)a3
{
  self->_inertialX = a3;
}

- (float)inertialY
{
  return self->_inertialY;
}

- (void)setInertialY:(float)a3
{
  self->_inertialY = a3;
}

- (float)inertialZ
{
  return self->_inertialZ;
}

- (void)setInertialZ:(float)a3
{
  self->_inertialZ = a3;
}

@end