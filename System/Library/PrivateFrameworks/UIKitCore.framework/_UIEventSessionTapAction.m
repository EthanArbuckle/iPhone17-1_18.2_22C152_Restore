@interface _UIEventSessionTapAction
- (CGPoint)buttonLocation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)typeEncoding;
- (int64_t)actionType;
- (void)setButtonLocation:(CGPoint)a3;
@end

@implementation _UIEventSessionTapAction

- (id)copyWithZone:(_NSZone *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIEventSessionTapAction;
  id result = [(_UIEventSessionAction *)&v5 copyWithZone:a3];
  *(CGPoint *)((char *)result + 72) = self->_buttonLocation;
  return result;
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)_UIEventSessionTapAction;
  v3 = [(_UIEventSessionAction *)&v13 description];
  v4 = [MEMORY[0x1E4F1CA48] array];
  objc_super v5 = NSString;
  [(_UIEventSessionTapAction *)self buttonLocation];
  uint64_t v7 = v6;
  [(_UIEventSessionTapAction *)self buttonLocation];
  v9 = objc_msgSend(v5, "stringWithFormat:", @" buttonLocation = (%f,%f)", v7, v8);
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
  return @"Button";
}

- (int64_t)actionType
{
  return 22;
}

- (CGPoint)buttonLocation
{
  double x = self->_buttonLocation.x;
  double y = self->_buttonLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setButtonLocation:(CGPoint)a3
{
  self->_buttonLocation = a3;
}

@end