@interface _UIViewCubicTimingFunction
- (BOOL)isEqual:(id)a3;
- (CGPoint)controlPoint1;
- (CGPoint)controlPoint2;
- (_UIViewCubicTimingFunction)init;
- (_UIViewCubicTimingFunction)initWithCoder:(id)a3;
- (_UIViewCubicTimingFunction)initWithControlPoint1:(CGPoint)a3 controlPoint2:(CGPoint)a4;
- (id)_mediaTimingFunction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _UIViewCubicTimingFunction

- (CGPoint)controlPoint2
{
  double x = self->_point2.x;
  double y = self->_point2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)controlPoint1
{
  double x = self->_point1.x;
  double y = self->_point1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (_UIViewCubicTimingFunction)initWithControlPoint1:(CGPoint)a3 controlPoint2:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGFloat v6 = a3.y;
  CGFloat v7 = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)_UIViewCubicTimingFunction;
  CGPoint result = [(_UIViewCubicTimingFunction *)&v9 init];
  result->_point1.CGFloat x = v7;
  result->_point1.CGFloat y = v6;
  result->_point2.CGFloat x = x;
  result->_point2.CGFloat y = y;
  return result;
}

- (id)_mediaTimingFunction
{
  CGFloat x = self->_point1.x;
  CGFloat y = self->_point1.y;
  *(float *)&CGFloat x = x;
  *(float *)&CGFloat y = y;
  CGFloat v4 = self->_point2.x;
  CGFloat v5 = self->_point2.y;
  *(float *)&CGFloat v4 = v4;
  *(float *)&CGFloat v5 = v5;
  return (id)[MEMORY[0x1E4F39C10] functionWithControlPoints:x :y :v4 :v5];
}

- (_UIViewCubicTimingFunction)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  CGFloat v5 = [NSString stringWithUTF8String:"-[_UIViewCubicTimingFunction init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double x = self->_point1.x;
  double y = self->_point1.y;
  double v7 = self->_point2.x;
  double v8 = self->_point2.y;
  return (id)objc_msgSend(v4, "initWithControlPoint1:controlPoint2:", x, y, v7, v8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(_UIViewCubicTimingFunction *)self controlPoint1];
    double v7 = v6;
    double v9 = v8;
    [v5 controlPoint1];
    if (v7 == v11 && v9 == v10)
    {
      [(_UIViewCubicTimingFunction *)self controlPoint2];
      double v15 = v14;
      double v17 = v16;
      [v5 controlPoint2];
      BOOL v13 = v17 == v19 && v15 == v18;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  double x = self->_point1.x;
  double y = self->_point1.y;
  id v6 = a3;
  objc_msgSend(v6, "encodeCGPoint:forKey:", @"point1", x, y);
  objc_msgSend(v6, "encodeCGPoint:forKey:", @"point2", self->_point2.x, self->_point2.y);
}

- (_UIViewCubicTimingFunction)initWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding])
  {
    v14.receiver = self;
    v14.super_class = (Class)_UIViewCubicTimingFunction;
    id v5 = [(_UIViewCubicTimingFunction *)&v14 init];
    if (v5)
    {
      [v4 decodeCGPointForKey:@"point1"];
      CGFloat v7 = v6;
      CGFloat v9 = v8;
      [v4 decodeCGPointForKey:@"point2"];
      v5->_point1.double x = v7;
      v5->_point1.double y = v9;
      v5->_point2.double x = v10;
      v5->_point2.double y = v11;
    }
    self = v5;
    v12 = self;
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28498], @"%@ only supports keyed coding.", objc_opt_class() format];
    v12 = 0;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  double v6 = NSStringFromCGPoint(self->_point1);
  CGFloat v7 = NSStringFromCGPoint(self->_point2);
  double v8 = [v3 stringWithFormat:@"<%@ point1 = %@ point2 = %@>", v5, v6, v7];

  return v8;
}

@end