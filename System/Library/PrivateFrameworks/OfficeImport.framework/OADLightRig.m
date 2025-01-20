@interface OADLightRig
- (BOOL)isEqual:(id)a3;
- (OADLightRig)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)rotation;
- (int)direction;
- (int)type;
- (unint64_t)hash;
- (void)setDirection:(int)a3;
- (void)setRotation:(id)a3;
- (void)setType:(int)a3;
@end

@implementation OADLightRig

- (OADLightRig)init
{
  v6.receiver = self;
  v6.super_class = (Class)OADLightRig;
  v2 = [(OADLightRig *)&v6 init];
  v3 = v2;
  if (v2)
  {
    mRotation = v2->mRotation;
    v2->mRotation = 0;

    *(void *)&v3->mType = 0;
  }
  return v3;
}

- (void)setRotation:(id)a3
{
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (void)setDirection:(int)a3
{
  self->mDirection = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OADRotation3D *)self->mRotation copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = *(void *)&self->mType;
  return v5;
}

- (id)rotation
{
  return self->mRotation;
}

- (int)type
{
  return self->mType;
}

- (int)direction
{
  return self->mDirection;
}

- (unint64_t)hash
{
  return [(OADRotation3D *)self->mRotation hash] ^ self->mType ^ (unint64_t)self->mDirection;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v5 = v4) != 0)
  {
    id v6 = v5;
    mRotation = self->mRotation;
    v8 = [v5 rotation];
    if ([(OADRotation3D *)mRotation isEqual:v8]
      && (int mType = self->mType, mType == [v6 type]))
    {
      int mDirection = self->mDirection;
      BOOL v11 = mDirection == [v6 direction];
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADLightRig;
  v2 = [(OADLightRig *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end