@interface TIPointError
+ (TIPointError)errorWithErrorVector:(CGPoint)a3;
- (CGPoint)applyToPoint:(CGPoint)a3;
- (CGPoint)errorVector;
- (TIPointError)initWithCoder:(id)a3;
- (TIPointError)initWithErrorVector:(CGPoint)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIPointError

- (CGPoint)errorVector
{
  double x = self->_errorVector.x;
  double y = self->_errorVector.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"TIPointError:<%f,%f>", *(void *)&self->_errorVector.x, *(void *)&self->_errorVector.y);
}

- (CGPoint)applyToPoint:(CGPoint)a3
{
  double v3 = a3.x + self->_errorVector.x;
  double v4 = a3.y + self->_errorVector.y;
  result.double y = v4;
  result.double x = v3;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  CGFloat x = self->_errorVector.x;
  *(float *)&CGFloat x = x;
  id v7 = v4;
  [v4 encodeFloat:@"TIPointErrorX" forKey:x];
  CGFloat y = self->_errorVector.y;
  *(float *)&CGFloat y = y;
  [v7 encodeFloat:@"TIPointErrorY" forKey:y];
}

- (TIPointError)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TIPointError;
  v5 = [(TIPointError *)&v10 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"TIPointErrorX"];
    float v7 = v6;
    [v4 decodeFloatForKey:@"TIPointErrorY"];
    v5->_errorVector.CGFloat x = v7;
    v5->_errorVector.CGFloat y = v8;
  }

  return v5;
}

- (TIPointError)initWithErrorVector:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)TIPointError;
  CGPoint result = [(TIPointError *)&v6 init];
  if (result)
  {
    result->_errorVector.CGFloat x = x;
    result->_errorVector.CGFloat y = y;
  }
  return result;
}

+ (TIPointError)errorWithErrorVector:(CGPoint)a3
{
  double v3 = -[TIPointError initWithErrorVector:]([TIPointError alloc], "initWithErrorVector:", a3.x, a3.y);
  return v3;
}

@end