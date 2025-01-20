@interface RCPNaturalInputCollectionSelection
- (CGPoint)direction;
- (CGPoint)location;
- (RCPNaturalInputCollectionSelection)initWithLocation:(CGPoint)a3 zPosition:(double)a4;
- (RCPNaturalInputCollectionSelection)initWithLocation:(CGPoint)a3 zPosition:(double)a4 direction:(CGPoint)a5 zDirection:(double)a6;
- (double)zDirection;
- (double)zPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation RCPNaturalInputCollectionSelection

- (RCPNaturalInputCollectionSelection)initWithLocation:(CGPoint)a3 zPosition:(double)a4 direction:(CGPoint)a5 zDirection:(double)a6
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat v10 = a3.y;
  CGFloat v11 = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)RCPNaturalInputCollectionSelection;
  result = [(RCPNaturalInputCollectionSelection *)&v13 init];
  result->_location.CGFloat x = v11;
  result->_location.CGFloat y = v10;
  result->_direction.CGFloat x = x;
  result->_direction.CGFloat y = y;
  result->_zPosition = a4;
  result->_zDirection = a6;
  return result;
}

- (RCPNaturalInputCollectionSelection)initWithLocation:(CGPoint)a3 zPosition:(double)a4
{
  return -[RCPNaturalInputCollectionSelection initWithLocation:zPosition:direction:zDirection:](self, "initWithLocation:zPosition:direction:zDirection:", a3.x, a3.y, a4, 0.0, 0.0, -1.0);
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(RCPNaturalInputCollectionSelection *)self location];
  uint64_t v6 = v5;
  [(RCPNaturalInputCollectionSelection *)self location];
  uint64_t v8 = v7;
  [(RCPNaturalInputCollectionSelection *)self zPosition];
  uint64_t v10 = v9;
  [(RCPNaturalInputCollectionSelection *)self direction];
  uint64_t v12 = v11;
  [(RCPNaturalInputCollectionSelection *)self direction];
  uint64_t v14 = v13;
  [(RCPNaturalInputCollectionSelection *)self zDirection];
  return (id)[v3 stringWithFormat:@"<%@: { location: (%f, %f), zPosition: %f, direction: (%f, %f), zDirection: %f }>", v4, v6, v8, v10, v12, v14, v15];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double zPosition = self->_zPosition;
  double zDirection = self->_zDirection;
  double x = self->_location.x;
  double y = self->_location.y;
  double v9 = self->_direction.x;
  double v10 = self->_direction.y;
  return (id)objc_msgSend(v4, "initWithLocation:zPosition:direction:zDirection:", x, y, zPosition, v9, v10, zDirection);
}

- (CGPoint)location
{
  objc_copyStruct(v4, &self->_location, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (double)zPosition
{
  return self->_zPosition;
}

- (CGPoint)direction
{
  objc_copyStruct(v4, &self->_direction, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (double)zDirection
{
  return self->_zDirection;
}

@end