@interface CompassTestDeviceMotion
- ($1AB5FA073B851C12C2339EC22442E995)gravity;
- (double)heading;
- (int)magneticFieldCalibrationLevel;
- (void)setGravity:(id)a3;
- (void)setHeading:(double)a3;
@end

@implementation CompassTestDeviceMotion

- (int)magneticFieldCalibrationLevel
{
  return -1;
}

- ($1AB5FA073B851C12C2339EC22442E995)gravity
{
  double x = self->_gravity.x;
  double y = self->_gravity.y;
  double z = self->_gravity.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setGravity:(id)a3
{
  self->_gravitdouble y = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- (double)heading
{
  return self->_heading;
}

- (void)setHeading:(double)a3
{
  self->_heading = a3;
}

@end