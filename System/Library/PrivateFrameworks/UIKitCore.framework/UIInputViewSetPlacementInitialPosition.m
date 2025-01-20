@interface UIInputViewSetPlacementInitialPosition
- (BOOL)isEqual:(id)a3;
@end

@implementation UIInputViewSetPlacementInitialPosition

- (BOOL)isEqual:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UIInputViewSetPlacementInitialPosition;
  v4 = (UIInputViewSetPlacementInitialPosition *)a3;
  BOOL v5 = [(UIInputViewSetPlacement *)&v7 isEqual:v4];

  return self != v4 && v5;
}

@end