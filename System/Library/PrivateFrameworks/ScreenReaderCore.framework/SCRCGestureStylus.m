@interface SCRCGestureStylus
- (SCRCGestureStylus)initWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5 altitude:(double)a6 azimuth:(double)a7;
- (double)altitude;
- (double)azimuth;
- (int64_t)type;
@end

@implementation SCRCGestureStylus

- (SCRCGestureStylus)initWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5 altitude:(double)a6 azimuth:(double)a7
{
  v10.receiver = self;
  v10.super_class = (Class)SCRCGestureStylus;
  result = -[SCRCGestureFinger initWithIdentifier:location:pressure:](&v10, sel_initWithIdentifier_location_pressure_, a3, a4.x, a4.y, a5);
  if (result)
  {
    result->_altitude = a6;
    result->_azimuth = a7;
  }
  return result;
}

- (int64_t)type
{
  return 1;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)azimuth
{
  return self->_azimuth;
}

@end