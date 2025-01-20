@interface TVRCGameControllerEvent
+ (BOOL)supportsSecureCoding;
- (BOOL)isDown;
- (CGPoint)joystickLocation;
- (TVRCGameControllerEvent)initWithCoder:(id)a3;
- (double)timestamp;
- (id)_initWithTimestamp:(double)a3 isDown:(BOOL)a4 joystickLocation:(CGPoint)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TVRCGameControllerEvent

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TVRCGameControllerEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TVRCGameControllerEvent;
  v5 = [(TVRCGameControllerEvent *)&v10 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_timestamp = v6;
    v5->_down = [v4 decodeBoolForKey:@"down"];
    [v4 decodeDoubleForKey:@"joystickLocation.x"];
    v5->_joystickLocation.x = v7;
    [v4 decodeDoubleForKey:@"joystickLocation.y"];
    v5->_joystickLocation.y = v8;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeBool:self->_down forKey:@"down"];
  [v5 encodeDouble:@"joystickLocation.x" forKey:self->_joystickLocation.x];
  [v5 encodeDouble:@"joystickLocation.y" forKey:self->_joystickLocation.y];
}

- (id)_initWithTimestamp:(double)a3 isDown:(BOOL)a4 joystickLocation:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  v10.receiver = self;
  v10.super_class = (Class)TVRCGameControllerEvent;
  id result = [(TVRCGameControllerEvent *)&v10 init];
  if (result)
  {
    *((unsigned char *)result + 8) = a4;
    *((double *)result + 2) = a3;
    *((CGFloat *)result + 3) = x;
    *((CGFloat *)result + 4) = y;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@ %p; down=%d; location={%g, %g}>",
               objc_opt_class(),
               self,
               self->_down,
               *(void *)&self->_joystickLocation.x,
               *(void *)&self->_joystickLocation.y);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (BOOL)isDown
{
  return self->_down;
}

- (CGPoint)joystickLocation
{
  double x = self->_joystickLocation.x;
  double y = self->_joystickLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end