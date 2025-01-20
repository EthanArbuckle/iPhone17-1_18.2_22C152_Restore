@interface PDBuild
- (BOOL)isAnimateBackground;
- (BOOL)isEqual:(id)a3;
- (PDBuild)init;
- (id)description;
- (id)drawable;
- (unint64_t)hash;
- (void)setDrawable:(id)a3;
- (void)setIsAnimateBackground:(BOOL)a3;
@end

@implementation PDBuild

- (PDBuild)init
{
  v3.receiver = self;
  v3.super_class = (Class)PDBuild;
  result = [(PDBuild *)&v3 init];
  if (result) {
    result->mIsAnimateBackground = 1;
  }
  return result;
}

- (void)setIsAnimateBackground:(BOOL)a3
{
  self->mIsAnimateBackground = a3;
}

- (BOOL)isAnimateBackground
{
  return self->mIsAnimateBackground;
}

- (id)drawable
{
  return self->mDrawable;
}

- (void)setDrawable:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = TSUDynamicCast(v5, (uint64_t)v4);
  v7 = v6;
  if (v6
    && (int mIsAnimateBackground = self->mIsAnimateBackground,
        mIsAnimateBackground == [v6 isAnimateBackground]))
  {
    mDrawable = self->mDrawable;
    v10 = [v7 drawable];
    BOOL v11 = mDrawable == v10;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(OADDrawable *)self->mDrawable hash];
  v5.receiver = self;
  v5.super_class = (Class)PDBuild;
  return [(PDBuild *)&v5 hash] ^ v3;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)PDBuild;
  v2 = [(PDBuild *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end