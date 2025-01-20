@interface _UIFloatingTabBarLayoutAttributes
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroupItemMinimized;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setGroupItemMinimized:(BOOL)a3;
@end

@implementation _UIFloatingTabBarLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIFloatingTabBarLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setGroupItemMinimized:", -[_UIFloatingTabBarLayoutAttributes isGroupItemMinimized](self, "isGroupItemMinimized"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFloatingTabBarLayoutAttributes;
  if ([(UICollectionViewLayoutAttributes *)&v8 isEqual:v4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = [(_UIFloatingTabBarLayoutAttributes *)self isGroupItemMinimized];
      int v6 = v5 ^ [v4 isGroupItemMinimized] ^ 1;
    }
    else
    {
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)isGroupItemMinimized
{
  return self->_groupItemMinimized;
}

- (void)setGroupItemMinimized:(BOOL)a3
{
  self->_groupItemMinimized = a3;
}

@end