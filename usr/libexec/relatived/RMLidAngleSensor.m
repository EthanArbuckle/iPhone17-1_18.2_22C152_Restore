@interface RMLidAngleSensor
- (__IOHIDDevice)lidAngleSensor;
- (double)lidAngle;
- (void)dealloc;
- (void)setLidAngleSensor:(__IOHIDDevice *)a3;
@end

@implementation RMLidAngleSensor

- (void)dealloc
{
  [(RMLidAngleSensor *)self stopLidAngleUpdates];
  v3.receiver = self;
  v3.super_class = (Class)RMLidAngleSensor;
  [(RMLidAngleSensor *)&v3 dealloc];
}

- (double)lidAngle
{
  return -1.0;
}

- (__IOHIDDevice)lidAngleSensor
{
  return self->_lidAngleSensor;
}

- (void)setLidAngleSensor:(__IOHIDDevice *)a3
{
  self->_lidAngleSensor = a3;
}

@end