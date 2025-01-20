@interface KNAnimParameterGroupSavedPathElement
+ (BOOL)supportsSecureCoding;
- (CGPoint)cp1;
- (CGPoint)cp2;
- (CGPoint)toPoint;
- (KNAnimParameterGroupSavedPathElement)initWithCoder:(id)a3;
- (unint64_t)elementType;
- (void)encodeWithCoder:(id)a3;
- (void)setCp1:(CGPoint)a3;
- (void)setCp2:(CGPoint)a3;
- (void)setElementType:(unint64_t)a3;
- (void)setToPoint:(CGPoint)a3;
@end

@implementation KNAnimParameterGroupSavedPathElement

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KNAnimParameterGroupSavedPathElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)KNAnimParameterGroupSavedPathElement;
  v5 = [(KNAnimParameterGroupSavedPathElement *)&v16 init];
  if (v5)
  {
    v5->_elementType = (unint64_t)[v4 decodeIntegerForKey:@"ele"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tv"];
    [v6 CGPointValue];
    v5->_toPoint.x = v7;
    v5->_toPoint.y = v8;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cp1"];
    [v9 CGPointValue];
    v5->_cp1.x = v10;
    v5->_cp1.y = v11;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"cp2"];
    [v12 CGPointValue];
    v5->_cp2.x = v13;
    v5->_cp2.y = v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:[self elementType] forKey:@"ele"];
  [(KNAnimParameterGroupSavedPathElement *)self toPoint];
  v5 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  [v4 encodeObject:v5 forKey:@"tv"];

  [(KNAnimParameterGroupSavedPathElement *)self cp1];
  v6 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  [v4 encodeObject:v6 forKey:@"cp1"];

  [(KNAnimParameterGroupSavedPathElement *)self cp2];
  +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"cp2"];
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (void)setElementType:(unint64_t)a3
{
  self->_elementType = a3;
}

- (CGPoint)toPoint
{
  double x = self->_toPoint.x;
  double y = self->_toPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setToPoint:(CGPoint)a3
{
  self->_toPoint = a3;
}

- (CGPoint)cp1
{
  double x = self->_cp1.x;
  double y = self->_cp1.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCp1:(CGPoint)a3
{
  self->_cp1 = a3;
}

- (CGPoint)cp2
{
  double x = self->_cp2.x;
  double y = self->_cp2.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCp2:(CGPoint)a3
{
  self->_cp2 = a3;
}

@end