@interface EPBorder
+ (id)borderWithBorder:(id)a3 precedence:(unint64_t)a4 resources:(id)a5;
- (BOOL)isEqualToBorder:(id)a3;
- (EPBorder)initWithBorder:(id)a3 precedence:(unint64_t)a4 resources:(id)a5;
- (unint64_t)precedence;
@end

@implementation EPBorder

- (EPBorder)initWithBorder:(id)a3 precedence:(unint64_t)a4 resources:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EPBorder;
  v10 = [(EDBorder *)&v14 initWithResources:v9];
  if (v10)
  {
    v10->super.mType = [v8 type];
    uint64_t v11 = [v8 colorReference];
    mColorReference = v10->super.mColorReference;
    v10->super.mColorReference = (EDColorReference *)v11;

    v10->super.mDiagonalType = [v8 diagonalType];
    v10->mPrecedence = a4;
  }

  return v10;
}

- (unint64_t)precedence
{
  return self->mPrecedence;
}

- (BOOL)isEqualToBorder:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->mPrecedence != v4[5])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)EPBorder;
    BOOL v5 = [(EDBorder *)&v7 isEqualToBorder:v4];
  }

  return v5;
}

+ (id)borderWithBorder:(id)a3 precedence:(unint64_t)a4 resources:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = (void *)[objc_alloc((Class)a1) initWithBorder:v8 precedence:a4 resources:v9];

  return v10;
}

@end