@interface VUICollisionSafeIdentifier
- (BOOL)isEqual:(id)a3;
- (NSCopying)rootIdentifier;
- (VUICollisionSafeIdentifier)initWithRootIdentifier:(id)a3 collisionCount:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)collisionCount;
- (unint64_t)hash;
- (void)setCollisionCount:(unint64_t)a3;
- (void)setRootIdentifier:(id)a3;
@end

@implementation VUICollisionSafeIdentifier

- (VUICollisionSafeIdentifier)initWithRootIdentifier:(id)a3 collisionCount:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUICollisionSafeIdentifier;
  v7 = [(VUICollisionSafeIdentifier *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    rootIdentifier = v7->_rootIdentifier;
    v7->_rootIdentifier = (NSCopying *)v8;

    v7->_collisionCount = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(VUICollisionSafeIdentifier);
  uint64_t v5 = [(NSCopying *)self->_rootIdentifier copy];
  rootIdentifier = v4->_rootIdentifier;
  v4->_rootIdentifier = (NSCopying *)v5;

  v4->_collisionCount = self->_collisionCount;
  return v4;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUICollisionSafeIdentifier *)self collisionCount];
  v4 = [(VUICollisionSafeIdentifier *)self rootIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUICollisionSafeIdentifier *)a3;
  unint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v6 = v5;
        v7 = [(VUICollisionSafeIdentifier *)self rootIdentifier];
        uint64_t v8 = [(VUICollisionSafeIdentifier *)v6 rootIdentifier];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          objc_super v11 = v10;
          if (!v9 || !v10)
          {

LABEL_14:
            BOOL v13 = 0;
            goto LABEL_15;
          }
          char v12 = [v9 isEqual:v10];

          if ((v12 & 1) == 0) {
            goto LABEL_14;
          }
        }
        unint64_t v14 = [(VUICollisionSafeIdentifier *)self collisionCount];
        BOOL v13 = v14 == [(VUICollisionSafeIdentifier *)v6 collisionCount];
LABEL_15:

        goto LABEL_16;
      }
    }
    BOOL v13 = 0;
  }
LABEL_16:

  return v13;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(VUICollisionSafeIdentifier *)self rootIdentifier];
  unint64_t v5 = [v3 stringWithFormat:@"%@_%lu", v4, -[VUICollisionSafeIdentifier collisionCount](self, "collisionCount")];

  return v5;
}

- (NSCopying)rootIdentifier
{
  return self->_rootIdentifier;
}

- (void)setRootIdentifier:(id)a3
{
}

- (unint64_t)collisionCount
{
  return self->_collisionCount;
}

- (void)setCollisionCount:(unint64_t)a3
{
  self->_collisionCount = a3;
}

- (void).cxx_destruct
{
}

@end