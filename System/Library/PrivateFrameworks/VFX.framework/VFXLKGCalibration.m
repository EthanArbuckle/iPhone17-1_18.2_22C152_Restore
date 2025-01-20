@interface VFXLKGCalibration
- (BOOL)invView;
- (float)center;
- (float)displayAspect;
- (float)pitch;
- (float)subp;
- (float)tilt;
- (int)bi;
- (int)ri;
- (void)setBi:(int)a3;
- (void)setCenter:(float)a3;
- (void)setDisplayAspect:(float)a3;
- (void)setInvView:(BOOL)a3;
- (void)setPitch:(float)a3;
- (void)setRi:(int)a3;
- (void)setSubp:(float)a3;
- (void)setTilt:(float)a3;
@end

@implementation VFXLKGCalibration

- (float)pitch
{
  return self->_pitch;
}

- (void)setPitch:(float)a3
{
  self->_pitch = a3;
}

- (float)tilt
{
  return self->_tilt;
}

- (void)setTilt:(float)a3
{
  self->_tilt = a3;
}

- (float)center
{
  return self->_center;
}

- (void)setCenter:(float)a3
{
  self->_center = a3;
}

- (float)subp
{
  return self->_subp;
}

- (void)setSubp:(float)a3
{
  self->_subp = a3;
}

- (float)displayAspect
{
  return self->_displayAspect;
}

- (void)setDisplayAspect:(float)a3
{
  self->_displayAspect = a3;
}

- (int)ri
{
  return self->_ri;
}

- (void)setRi:(int)a3
{
  self->_ri = a3;
}

- (int)bi
{
  return self->_bi;
}

- (void)setBi:(int)a3
{
  self->_bi = a3;
}

- (BOOL)invView
{
  return self->_invView;
}

- (void)setInvView:(BOOL)a3
{
  self->_invView = a3;
}

@end