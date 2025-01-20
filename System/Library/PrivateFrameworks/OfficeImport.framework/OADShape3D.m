@interface OADShape3D
+ (id)nullShape3D;
- (BOOL)isEqual:(id)a3;
- (OADShape3D)init;
- (float)contourWidth;
- (float)extrusionHeight;
- (float)shapeDepth;
- (id)bottomBevel;
- (id)contourColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)extrusionColor;
- (id)topBevel;
- (int)material;
- (unint64_t)hash;
- (void)setBottomBevel:(id)a3;
- (void)setContourColor:(id)a3;
- (void)setContourWidth:(float)a3;
- (void)setExtrusionColor:(id)a3;
- (void)setExtrusionHeight:(float)a3;
- (void)setMaterial:(int)a3;
- (void)setShapeDepth:(float)a3;
- (void)setTopBevel:(id)a3;
@end

@implementation OADShape3D

+ (id)nullShape3D
{
  v2 = (void *)+[OADShape3D nullShape3D]::theNullShape3D;
  if (!+[OADShape3D nullShape3D]::theNullShape3D)
  {
    v3 = objc_alloc_init(OADShape3D);
    v4 = (void *)+[OADShape3D nullShape3D]::theNullShape3D;
    +[OADShape3D nullShape3D]::theNullShape3D = (uint64_t)v3;

    [(id)+[OADShape3D nullShape3D]::theNullShape3D setMaterial:0];
    v2 = (void *)+[OADShape3D nullShape3D]::theNullShape3D;
  }
  return v2;
}

- (OADShape3D)init
{
  v9.receiver = self;
  v9.super_class = (Class)OADShape3D;
  v2 = [(OADShape3D *)&v9 init];
  v3 = v2;
  if (v2)
  {
    mTopBevel = v2->mTopBevel;
    v2->mTopBevel = 0;

    mBottomBevel = v3->mBottomBevel;
    v3->mBottomBevel = 0;

    mExtrusionColor = v3->mExtrusionColor;
    v3->mExtrusionColor = 0;

    v3->mExtrusionHeight = 0.0;
    mContourColor = v3->mContourColor;
    v3->mContourColor = 0;

    *(void *)&v3->mContourWidth = 0;
    v3->mMaterial = 8;
  }
  return v3;
}

- (void)setMaterial:(int)a3
{
  self->mMaterial = a3;
}

- (void)setTopBevel:(id)a3
{
}

- (void)setContourColor:(id)a3
{
}

- (void)setContourWidth:(float)a3
{
  self->mContourWidth = a3;
}

- (void)setBottomBevel:(id)a3
{
}

- (void)setExtrusionHeight:(float)a3
{
  self->mExtrusionHeight = a3;
}

- (void)setShapeDepth:(float)a3
{
  self->mShapeDepth = a3;
}

- (void)setExtrusionColor:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(OADBevel *)self->mTopBevel copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  id v8 = [(OADBevel *)self->mBottomBevel copyWithZone:a3];
  objc_super v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  id v10 = [(OADColor *)self->mExtrusionColor copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  *(float *)(v5 + 32) = self->mExtrusionHeight;
  id v12 = [(OADColor *)self->mContourColor copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  *(float *)(v5 + 48) = self->mContourWidth;
  *(float *)(v5 + 52) = self->mShapeDepth;
  *(_DWORD *)(v5 + 56) = self->mMaterial;
  return (id)v5;
}

- (id)topBevel
{
  return self->mTopBevel;
}

- (id)bottomBevel
{
  return self->mBottomBevel;
}

- (id)extrusionColor
{
  return self->mExtrusionColor;
}

- (float)extrusionHeight
{
  return self->mExtrusionHeight;
}

- (id)contourColor
{
  return self->mContourColor;
}

- (float)contourWidth
{
  return self->mContourWidth;
}

- (float)shapeDepth
{
  return self->mShapeDepth;
}

- (int)material
{
  return self->mMaterial;
}

- (unint64_t)hash
{
  unint64_t v3 = [(OADBevel *)self->mTopBevel hash];
  unint64_t v4 = [(OADBevel *)self->mBottomBevel hash];
  unint64_t v5 = [(OADColor *)self->mExtrusionColor hash];
  return v4 ^ v3 ^ v5 ^ [(OADColor *)self->mContourColor hash] ^ (unint64_t)self->mExtrusionHeight ^ (unint64_t)self->mContourWidth ^ (unint64_t)self->mShapeDepth ^ self->mMaterial;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (id v5 = v4) != 0)
  {
    id v6 = v5;
    mTopBevel = self->mTopBevel;
    id v8 = [v5 topBevel];
    if ([(OADBevel *)mTopBevel isEqual:v8])
    {
      mBottomBevel = self->mBottomBevel;
      id v10 = [v6 bottomBevel];
      if ([(OADBevel *)mBottomBevel isEqual:v10])
      {
        mExtrusionColor = self->mExtrusionColor;
        id v12 = [v6 extrusionColor];
        if ([(OADColor *)mExtrusionColor isEqual:v12])
        {
          mContourColor = self->mContourColor;
          v14 = [v6 contourColor];
          if ([(OADColor *)mContourColor isEqual:v14]
            && (float mExtrusionHeight = self->mExtrusionHeight, [v6 extrusionHeight], mExtrusionHeight == v16)
            && (float mContourWidth = self->mContourWidth, [v6 contourWidth], mContourWidth == v18)
            && (float mShapeDepth = self->mShapeDepth, [v6 shapeDepth], mShapeDepth == v20))
          {
            int mMaterial = self->mMaterial;
            BOOL v22 = mMaterial == [v6 material];
          }
          else
          {
            BOOL v22 = 0;
          }
        }
        else
        {
          BOOL v22 = 0;
        }
      }
      else
      {
        BOOL v22 = 0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADShape3D;
  v2 = [(OADShape3D *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContourColor, 0);
  objc_storeStrong((id *)&self->mExtrusionColor, 0);
  objc_storeStrong((id *)&self->mBottomBevel, 0);
  objc_storeStrong((id *)&self->mTopBevel, 0);
}

@end