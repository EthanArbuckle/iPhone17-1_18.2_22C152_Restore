@interface EDColorReference
+ (EDColorReference)colorReferenceWithColor:(id)a3 resources:(id)a4;
+ (EDColorReference)colorReferenceWithColorIndex:(unint64_t)a3 resources:(id)a4;
+ (EDColorReference)colorReferenceWithResources:(id)a3;
+ (EDColorReference)colorReferenceWithSystemColorID:(int)a3 resources:(id)a4;
+ (EDColorReference)colorReferenceWithThemeIndex:(unint64_t)a3 tint:(double)a4 resources:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToColorReference:(id)a3;
- (BOOL)isValid;
- (EDColorReference)initWithColor:(id)a3 resources:(id)a4;
- (EDColorReference)initWithResources:(id)a3;
- (double)tint;
- (id)color;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)systemColorID;
- (unint64_t)colorIndex;
- (unint64_t)hash;
- (unint64_t)themeIndex;
@end

@implementation EDColorReference

+ (EDColorReference)colorReferenceWithColorIndex:(unint64_t)a3 resources:(id)a4
{
  id v6 = a4;
  if (+[EDColorsCollection isSystemColorId:a3])
  {
    v7 = +[EDColorReference colorReferenceWithSystemColorID:resources:](EDColorReference, "colorReferenceWithSystemColorID:resources:", +[EDColorsCollection systemColorIdFromIndex:a3], v6);
  }
  else
  {
    v7 = [a1 colorReferenceWithResources:v6];
    v7[3] = a3;
  }

  return (EDColorReference *)v7;
}

+ (EDColorReference)colorReferenceWithSystemColorID:(int)a3 resources:(id)a4
{
  v5 = [a1 colorReferenceWithResources:a4];
  v5[4] = a3;
  return (EDColorReference *)v5;
}

+ (EDColorReference)colorReferenceWithResources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return (EDColorReference *)v4;
}

- (EDColorReference)initWithResources:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EDColorReference;
  v5 = [(EDColorReference *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    v6->mSystemColorID = 0;
    v6->mColorIndex = -1;
    v6->mThemeIndex = -1;
    v6->mTint = 0.0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDColorReference *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDColorReference *)self isEqualToColorReference:v5];

  return v6;
}

- (BOOL)isEqualToColorReference:(id)a3
{
  id v4 = (char *)a3;
  BOOL v5 = *(_OWORD *)(v4 + 24) == *(_OWORD *)&self->mColorIndex && *((_DWORD *)v4 + 4) == self->mSystemColorID;

  return v5;
}

- (id)color
{
  if (self->mSystemColorID)
  {
    v2 = +[OITSUColor colorWithSystemColorID:](OITSUColor, "colorWithSystemColorID:");
  }
  else
  {
    unint64_t mThemeIndex = self->mThemeIndex;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    BOOL v6 = WeakRetained;
    if (mThemeIndex == -1)
    {
      v11 = [WeakRetained colors];
      v2 = [v11 objectAtIndex:self->mColorIndex];
    }
    else
    {
      v7 = [WeakRetained themes];
      objc_super v8 = [v7 objectAtIndex:self->mThemeIndex];

      double mTint = self->mTint;
      if (mTint >= 0.0)
      {
        if (mTint <= 0.0)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = [v8 colorWithTintValue:1.0 - mTint];
        }
      }
      else
      {
        id v10 = [v8 colorWithShadeValue:mTint + 1.0];
      }
      v2 = v10;
    }
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  uint64_t v6 = [v4 initWithResources:WeakRetained];

  if (v6)
  {
    *(_DWORD *)(v6 + 16) = self->mSystemColorID;
    *(void *)(v6 + 24) = self->mColorIndex;
    *(void *)(v6 + 32) = self->mThemeIndex;
    *(double *)(v6 + 40) = self->mTint;
    id v7 = (id)v6;
  }

  return (id)v6;
}

- (EDColorReference)initWithColor:(id)a3 resources:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(EDColorReference *)self initWithResources:v7];
  if (v8)
  {
    v9 = [v7 colors];
    v8->mColorIndex = [v9 addOrEquivalentColorExcludingDefaults:v6];
  }
  return v8;
}

+ (EDColorReference)colorReferenceWithThemeIndex:(unint64_t)a3 tint:(double)a4 resources:(id)a5
{
  uint64_t v7 = [a1 colorReferenceWithResources:a5];
  *(void *)(v7 + 32) = a3;
  *(double *)(v7 + 40) = a4;
  return (EDColorReference *)(id)v7;
}

+ (EDColorReference)colorReferenceWithColor:(id)a3 resources:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithColor:v5 resources:v6];

  return (EDColorReference *)v7;
}

- (unint64_t)themeIndex
{
  return self->mThemeIndex;
}

- (unint64_t)hash
{
  return (self->mThemeIndex << 8)
       + (self->mColorIndex << 16)
       + self->mSystemColorID
       + (unint64_t)self->mTint;
}

- (BOOL)isValid
{
  return self->mSystemColorID || self->mColorIndex != -1 || self->mThemeIndex != -1;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDColorReference;
  v2 = [(EDColorReference *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

- (int)systemColorID
{
  return self->mSystemColorID;
}

- (unint64_t)colorIndex
{
  return self->mColorIndex;
}

- (double)tint
{
  return self->mTint;
}

@end