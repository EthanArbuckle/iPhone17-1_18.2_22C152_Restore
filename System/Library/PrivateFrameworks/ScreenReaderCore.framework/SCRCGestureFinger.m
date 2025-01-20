@interface SCRCGestureFinger
- (CGPoint)location;
- (SCRCGestureFinger)initWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5;
- (double)pressure;
- (id)description;
- (int64_t)type;
- (unint64_t)identifier;
@end

@implementation SCRCGestureFinger

- (SCRCGestureFinger)initWithIdentifier:(unint64_t)a3 location:(CGPoint)a4 pressure:(double)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)SCRCGestureFinger;
  result = [(SCRCGestureFinger *)&v10 init];
  if (result)
  {
    result->_identifier = a3;
    result->_location.CGFloat x = x;
    result->_location.CGFloat y = y;
    result->_pressure = a5;
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"Finger %2lu: x=%.2lf y=%.2lf", self->_identifier, *(void *)&self->_location.x, *(void *)&self->_location.y);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (CGPoint)location
{
  double x = self->_location.x;
  double y = self->_location.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)pressure
{
  return self->_pressure;
}

- (int64_t)type
{
  return 0;
}

@end