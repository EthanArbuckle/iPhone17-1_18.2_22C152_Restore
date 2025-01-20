@interface OADScene3D
+ (id)nullScene3D;
- (BOOL)isEqual:(id)a3;
- (OADScene3D)init;
- (id)backdrop;
- (id)camera;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)lightRig;
- (unint64_t)hash;
- (void)setBackdrop:(id)a3;
- (void)setCamera:(id)a3;
- (void)setLightRig:(id)a3;
@end

@implementation OADScene3D

+ (id)nullScene3D
{
  v2 = (void *)+[OADScene3D nullScene3D]::theNullScene3D;
  if (!+[OADScene3D nullScene3D]::theNullScene3D)
  {
    v3 = objc_alloc_init(OADScene3D);
    v4 = (void *)+[OADScene3D nullScene3D]::theNullScene3D;
    +[OADScene3D nullScene3D]::theNullScene3D = (uint64_t)v3;

    v2 = (void *)+[OADScene3D nullScene3D]::theNullScene3D;
  }
  return v2;
}

- (OADScene3D)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADScene3D;
  v2 = [(OADScene3D *)&v8 init];
  v3 = v2;
  if (v2)
  {
    mCamera = v2->mCamera;
    v2->mCamera = 0;

    mLightRig = v3->mLightRig;
    v3->mLightRig = 0;

    mBackdrop = v3->mBackdrop;
    v3->mBackdrop = 0;
  }
  return v3;
}

- (void)setCamera:(id)a3
{
}

- (void)setLightRig:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OADCamera *)self->mCamera copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(OADLightRig *)self->mLightRig copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(OADBackdrop *)self->mBackdrop copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  return v5;
}

- (id)camera
{
  return self->mCamera;
}

- (id)lightRig
{
  return self->mLightRig;
}

- (id)backdrop
{
  return self->mBackdrop;
}

- (void)setBackdrop:(id)a3
{
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADCamera *)self->mCamera hash];
  unint64_t v4 = [(OADLightRig *)self->mLightRig hash] ^ v3;
  return v4 ^ [(OADBackdrop *)self->mBackdrop hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v5 = v4) != 0)
  {
    id v6 = v5;
    mCamera = self->mCamera;
    id v8 = [v5 camera];
    if ([(OADCamera *)mCamera isEqual:v8])
    {
      mLightRig = self->mLightRig;
      id v10 = [v6 lightRig];
      if ([(OADLightRig *)mLightRig isEqual:v10])
      {
        mBackdrop = self->mBackdrop;
        v12 = [v6 backdrop];
        BOOL v13 = [(OADBackdrop *)mBackdrop isEqual:v12];
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
  v4.super_class = (Class)OADScene3D;
  v2 = [(OADScene3D *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBackdrop, 0);
  objc_storeStrong((id *)&self->mLightRig, 0);
  objc_storeStrong((id *)&self->mCamera, 0);
}

@end