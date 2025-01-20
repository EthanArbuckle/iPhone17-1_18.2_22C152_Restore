@interface OADBackdrop
- (BOOL)isEqual:(id)a3;
- (OADBackdrop)init;
- (id)anchor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)normal;
- (id)up;
- (unint64_t)hash;
- (void)setAnchor:(id)a3;
- (void)setNormal:(id)a3;
- (void)setUp:(id)a3;
@end

@implementation OADBackdrop

- (OADBackdrop)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADBackdrop;
  v2 = [(OADBackdrop *)&v8 init];
  v3 = v2;
  if (v2)
  {
    mAnchor = v2->mAnchor;
    v2->mAnchor = 0;

    mNormal = v3->mNormal;
    v3->mNormal = 0;

    mUp = v3->mUp;
    v3->mUp = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OADPoint3D *)self->mAnchor copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(OADVector3D *)self->mNormal copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(OADVector3D *)self->mUp copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (id)anchor
{
  return self->mAnchor;
}

- (void)setAnchor:(id)a3
{
}

- (id)normal
{
  return self->mNormal;
}

- (void)setNormal:(id)a3
{
}

- (id)up
{
  return self->mUp;
}

- (void)setUp:(id)a3
{
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADPoint3D *)self->mAnchor hash];
  unint64_t v4 = [(OADVector3D *)self->mNormal hash] ^ v3;
  return v4 ^ [(OADVector3D *)self->mUp hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v5 = v4) != 0)
  {
    id v6 = v5;
    mAnchor = self->mAnchor;
    id v8 = [v5 anchor];
    if ([(OADPoint3D *)mAnchor isEqual:v8])
    {
      mNormal = self->mNormal;
      id v10 = [v6 normal];
      if ([(OADVector3D *)mNormal isEqual:v10])
      {
        mUp = self->mUp;
        v12 = [v6 up];
        BOOL v13 = [(OADVector3D *)mUp isEqual:v12];
      }
      else
      {
        BOOL v13 = 0;
      }
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADBackdrop;
  v2 = [(OADBackdrop *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mUp, 0);
  objc_storeStrong((id *)&self->mNormal, 0);
  objc_storeStrong((id *)&self->mAnchor, 0);
}

@end