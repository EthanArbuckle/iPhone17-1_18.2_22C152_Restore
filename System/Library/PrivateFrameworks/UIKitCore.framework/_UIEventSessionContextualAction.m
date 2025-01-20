@interface _UIEventSessionContextualAction
- (CGPoint)originatingLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeEncoding;
- (int64_t)actionType;
- (void)setOriginatingLocation:(CGPoint)a3;
@end

@implementation _UIEventSessionContextualAction

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEventSessionContextualAction;
  id result = [(_UIEventSessionAction *)&v5 copyWithZone:a3];
  *(CGPoint *)((char *)result + 72) = self->_originatingLocation;
  return result;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)_UIEventSessionContextualAction;
  v3 = [(_UIEventSessionAction *)&v13 description];
  v4 = [MEMORY[0x1E4F1CA48] array];
  objc_super v5 = NSString;
  [(_UIEventSessionContextualAction *)self originatingLocation];
  uint64_t v7 = v6;
  [(_UIEventSessionContextualAction *)self originatingLocation];
  v9 = objc_msgSend(v5, "stringWithFormat:", @" originatingLocation = (%f,%f)", v7, v8);
  [v4 addObject:v9];

  if ([v4 count])
  {
    v10 = [v4 componentsJoinedByString:@", "];
    uint64_t v11 = [v3 stringByAppendingFormat:@" %@", v10];

    v3 = (void *)v11;
  }

  return v3;
}

- (id)typeEncoding
{
  return @"Menu";
}

- (int64_t)actionType
{
  return 24;
}

- (CGPoint)originatingLocation
{
  double x = self->_originatingLocation.x;
  double y = self->_originatingLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOriginatingLocation:(CGPoint)a3
{
  self->_originatingLocation = a3;
}

@end