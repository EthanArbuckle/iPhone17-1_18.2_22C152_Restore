@interface RCPNaturalInputCollectionManipulator
- (BOOL)isOpen;
- (CGPoint)location;
- (RCPNaturalInputCollectionManipulator)initWithLocation:(CGPoint)a3 zPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6 isOpen:(BOOL)a7;
- (double)zPosition;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)interactionMethod;
- (int64_t)sourceGroup;
@end

@implementation RCPNaturalInputCollectionManipulator

- (RCPNaturalInputCollectionManipulator)initWithLocation:(CGPoint)a3 zPosition:(double)a4 sourceGroup:(int64_t)a5 interactionMethod:(int64_t)a6 isOpen:(BOOL)a7
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)RCPNaturalInputCollectionManipulator;
  result = [(RCPNaturalInputCollectionManipulator *)&v14 init];
  result->_location.CGFloat x = x;
  result->_location.CGFloat y = y;
  result->_zPosition = a4;
  result->_sourceGroup = a5;
  result->_interactionMethod = a6;
  result->_isOpen = a7;
  return result;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(RCPNaturalInputCollectionManipulator *)self location];
  uint64_t v6 = v5;
  [(RCPNaturalInputCollectionManipulator *)self location];
  uint64_t v8 = v7;
  [(RCPNaturalInputCollectionManipulator *)self zPosition];
  uint64_t v10 = v9;
  int64_t v11 = [(RCPNaturalInputCollectionManipulator *)self sourceGroup];
  int64_t v12 = [(RCPNaturalInputCollectionManipulator *)self interactionMethod];
  BOOL v13 = [(RCPNaturalInputCollectionManipulator *)self isOpen];
  objc_super v14 = @"NO";
  if (v13) {
    objc_super v14 = @"YES";
  }
  return (id)[v3 stringWithFormat:@"<%@: { Location: (%f, %f), zPosition: %f, Source Group: %ld, Interaction Method: %ld, Open: %@ }>", v4, v6, v8, v10, v11, v12, v14];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  double zPosition = self->_zPosition;
  int64_t sourceGroup = self->_sourceGroup;
  int64_t interactionMethod = self->_interactionMethod;
  BOOL isOpen = self->_isOpen;
  double x = self->_location.x;
  double y = self->_location.y;
  return (id)objc_msgSend(v4, "initWithLocation:zPosition:sourceGroup:interactionMethod:isOpen:", sourceGroup, interactionMethod, isOpen, x, y, zPosition);
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

- (int64_t)sourceGroup
{
  return self->_sourceGroup;
}

- (int64_t)interactionMethod
{
  return self->_interactionMethod;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

@end