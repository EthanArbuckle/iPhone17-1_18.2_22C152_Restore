@interface CLDeviceMotionProperties
- (CLDeviceMotionProperties)initWithMode:(int)a3;
- (id)description;
- (int)mode;
- (void)setMode:(int)a3;
@end

@implementation CLDeviceMotionProperties

- (CLDeviceMotionProperties)initWithMode:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLDeviceMotionProperties;
  result = [(CLDeviceMotionProperties *)&v5 init];
  if (result) {
    result->_mode = a3;
  }
  return result;
}

- (id)description
{
  CFStringRef v2 = 0;
  int mode = self->_mode;
  if (mode > 14)
  {
    CFStringRef v4 = @"3AxisDynamicGyro";
    CFStringRef v5 = @"6AxisThrottledGyro";
    if (mode != 67) {
      CFStringRef v5 = 0;
    }
    if (mode != 34) {
      CFStringRef v4 = v5;
    }
    if (mode == 19) {
      CFStringRef v2 = @"BuildGYTT";
    }
    if (mode == 15) {
      CFStringRef v2 = @"9AxisWithNorthReference";
    }
    if (mode > 33) {
      CFStringRef v2 = v4;
    }
  }
  else
  {
    switch(mode)
    {
      case 0:
        CFStringRef v2 = @"Unknown";
        break;
      case 2:
        CFStringRef v2 = @"GyroOnly";
        break;
      case 3:
        CFStringRef v2 = @"6Axis";
        break;
      case 7:
        CFStringRef v2 = @"9Axis";
        break;
      default:
        return +[NSString stringWithFormat:@"CLDeviceMotionProperties<DeviceMotion=%@>", v2];
    }
  }
  return +[NSString stringWithFormat:@"CLDeviceMotionProperties<DeviceMotion=%@>", v2];
}

- (int)mode
{
  return self->_mode;
}

- (void)setMode:(int)a3
{
  self->_int mode = a3;
}

@end