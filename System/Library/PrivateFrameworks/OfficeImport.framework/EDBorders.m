@interface EDBorders
+ (id)bordersWithLeft:(id)a3 right:(id)a4 top:(id)a5 bottom:(id)a6 diagonal:(id)a7 resources:(id)a8;
+ (id)bordersWithLeft:(id)a3 right:(id)a4 top:(id)a5 bottom:(id)a6 diagonal:(id)a7 vertical:(id)a8 horizontal:(id)a9 resources:(id)a10;
+ (id)bordersWithResources:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToBorders:(id)a3;
- (EDBorders)initWithResources:(id)a3;
- (id)bottomBorder;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)diagonalBorder;
- (id)horizontalBorder;
- (id)leftBorder;
- (id)rightBorder;
- (id)topBorder;
- (id)verticalBorder;
- (unint64_t)hash;
- (void)setBottomBorder:(id)a3;
- (void)setDiagonalBorder:(id)a3;
- (void)setHorizontalBorder:(id)a3;
- (void)setLeftBorder:(id)a3;
- (void)setRightBorder:(id)a3;
- (void)setTopBorder:(id)a3;
- (void)setVerticalBorder:(id)a3;
@end

@implementation EDBorders

+ (id)bordersWithLeft:(id)a3 right:(id)a4 top:(id)a5 bottom:(id)a6 diagonal:(id)a7 resources:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = [a1 bordersWithResources:a8];
  [v19 setLeftBorder:v14];
  [v19 setRightBorder:v15];
  [v19 setTopBorder:v16];
  [v19 setBottomBorder:v17];
  [v19 setDiagonalBorder:v18];

  return v19;
}

+ (id)bordersWithResources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
}

- (EDBorders)initWithResources:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDBorders;
  v5 = [(EDBorders *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(void *)&long long v7 = -1;
    *((void *)&v7 + 1) = -1;
    *(_OWORD *)&v6->mLeftBorderIndex = v7;
    *(_OWORD *)&v6->mTopBorderIndex = v7;
    *(_OWORD *)&v6->mDiagonalBorderIndex = v7;
    v6->mHorizontalBorderIndex = -1;
  }

  return v6;
}

- (void)setLeftBorder:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained border];
  self->mLeftBorderIndex = [v5 addOrEquivalentObject:v6];
}

- (void)setRightBorder:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained border];
  self->mRightBorderIndex = [v5 addOrEquivalentObject:v6];
}

- (void)setTopBorder:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained border];
  self->mTopBorderIndex = [v5 addOrEquivalentObject:v6];
}

- (void)setBottomBorder:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained border];
  self->mBottomBorderIndex = [v5 addOrEquivalentObject:v6];
}

- (void)setDiagonalBorder:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  v5 = [WeakRetained border];
  self->mDiagonalBorderIndex = [v5 addOrEquivalentObject:v6];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDBorders *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDBorders *)self isEqualToBorders:v5];

  return v6;
}

- (BOOL)isEqualToBorders:(id)a3
{
  id v4 = a3;
  BOOL v5 = *(_OWORD *)&self->mLeftBorderIndex == v4[1]
    && self->mTopBorderIndex == *((void *)v4 + 4)
    && self->mBottomBorderIndex == *((void *)v4 + 5)
    && self->mDiagonalBorderIndex == *((void *)v4 + 6)
    && self->mVerticalBorderIndex == *((void *)v4 + 7)
    && self->mHorizontalBorderIndex == *((void *)v4 + 8);

  return v5;
}

- (id)topBorder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained border];
  BOOL v5 = [v4 objectAtIndex:self->mTopBorderIndex];

  return v5;
}

- (id)leftBorder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained border];
  BOOL v5 = [v4 objectAtIndex:self->mLeftBorderIndex];

  return v5;
}

- (id)bottomBorder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained border];
  BOOL v5 = [v4 objectAtIndex:self->mBottomBorderIndex];

  return v5;
}

- (id)rightBorder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained border];
  BOOL v5 = [v4 objectAtIndex:self->mRightBorderIndex];

  return v5;
}

+ (id)bordersWithLeft:(id)a3 right:(id)a4 top:(id)a5 bottom:(id)a6 diagonal:(id)a7 vertical:(id)a8 horizontal:(id)a9 resources:(id)a10
{
  id v16 = a8;
  id v17 = a9;
  id v18 = [a1 bordersWithLeft:a3 right:a4 top:a5 bottom:a6 diagonal:a7 resources:a10];
  [v18 setVerticalBorder:v16];
  [v18 setHorizontalBorder:v17];

  return v18;
}

- (void)setVerticalBorder:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  BOOL v5 = [WeakRetained border];
  self->mVerticalBorderIndex = [v5 addOrEquivalentObject:v6];
}

- (void)setHorizontalBorder:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  BOOL v5 = [WeakRetained border];
  self->mHorizontalBorderIndex = [v5 addOrEquivalentObject:v6];
}

- (id)verticalBorder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained border];
  BOOL v5 = [v4 objectAtIndex:self->mVerticalBorderIndex];

  return v5;
}

- (id)diagonalBorder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained border];
  BOOL v5 = [v4 objectAtIndex:self->mDiagonalBorderIndex];

  return v5;
}

- (id)horizontalBorder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained border];
  BOOL v5 = [v4 objectAtIndex:self->mHorizontalBorderIndex];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v6 = (void *)[v4 initWithResources:WeakRetained];

  if (v6)
  {
    v6[2] = self->mLeftBorderIndex;
    v6[3] = self->mRightBorderIndex;
    v6[4] = self->mTopBorderIndex;
    v6[5] = self->mBottomBorderIndex;
    v6[6] = self->mDiagonalBorderIndex;
    v6[7] = self->mVerticalBorderIndex;
    v6[8] = self->mHorizontalBorderIndex;
    long long v7 = v6;
  }

  return v6;
}

- (unint64_t)hash
{
  return vaddvq_s64(vaddq_s64((int64x2_t)vshlq_u64(*(uint64x2_t *)&self->mLeftBorderIndex, (uint64x2_t)xmmword_238EDF520), (int64x2_t)vshlq_u64(*(uint64x2_t *)&self->mTopBorderIndex, (uint64x2_t)xmmword_238EDF510)))+ (self->mVerticalBorderIndex ^ self->mDiagonalBorderIndex ^ self->mHorizontalBorderIndex);
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDBorders;
  v2 = [(EDBorders *)&v4 description];
  return v2;
}

- (void).cxx_destruct
{
}

@end