@interface OADAdjustedColor
- (BOOL)gray;
- (BOOL)invert;
- (BOOL)invert128;
- (BOOL)isEqual:(id)a3;
- (OADAdjustedColor)initWithBaseColor:(id)a3 adjustmentType:(int)a4 adjustmentParam:(unsigned __int8)a5 invert:(BOOL)a6 invert128:(BOOL)a7 gray:(BOOL)a8;
- (id)baseColor;
- (id)copyWithZone:(_NSZone *)a3;
- (int)adjustmentType;
- (unint64_t)hash;
- (unsigned)adjustmentParam;
@end

@implementation OADAdjustedColor

- (OADAdjustedColor)initWithBaseColor:(id)a3 adjustmentType:(int)a4 adjustmentParam:(unsigned __int8)a5 invert:(BOOL)a6 invert128:(BOOL)a7 gray:(BOOL)a8
{
  id v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)OADAdjustedColor;
  v16 = [(OADAdjustedColor *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->mBaseColor, a3);
    v17->mAdjustmentType = a4;
    v17->mAdjustmentParam = a5;
    v17->mInvert = a6;
    v17->mInvert128 = a7;
    v17->mGray = a8;
  }

  return v17;
}

- (id)baseColor
{
  return self->mBaseColor;
}

- (BOOL)gray
{
  return self->mGray;
}

- (unsigned)adjustmentParam
{
  return self->mAdjustmentParam;
}

- (int)adjustmentType
{
  return self->mAdjustmentType;
}

- (BOOL)invert
{
  return self->mInvert;
}

- (BOOL)invert128
{
  return self->mInvert128;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    mBaseColor = self->mBaseColor;
    v7 = [v5 baseColor];
    if ([(OADColor *)mBaseColor isEqual:v7]
      && (int mAdjustmentType = self->mAdjustmentType, mAdjustmentType == [v5 adjustmentType])
      && (int mAdjustmentParam = self->mAdjustmentParam,
          mAdjustmentParam == [v5 adjustmentParam])
      && (int mInvert = self->mInvert, mInvert == [v5 invert])
      && (int mInvert128 = self->mInvert128, mInvert128 == [v5 invert128])
      && (int mGray = self->mGray, mGray == [v5 gray]))
    {
      v15.receiver = self;
      v15.super_class = (Class)OADAdjustedColor;
      BOOL v13 = [(OADColor *)&v15 isEqual:v5];
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

- (unint64_t)hash
{
  unint64_t v3 = [(OADColor *)self->mBaseColor hash] ^ self->mAdjustmentType ^ (unint64_t)self->mAdjustmentParam ^ self->mInvert ^ (unint64_t)self->mInvert128 ^ self->mGray;
  v5.receiver = self;
  v5.super_class = (Class)OADAdjustedColor;
  return v3 ^ [(OADColor *)&v5 hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = -[OADColor copyWithZone:](self->mBaseColor, "copyWithZone:");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBaseColor:adjustmentType:adjustmentParam:invert:invert128:gray:", v5, self->mAdjustmentType, self->mAdjustmentParam, self->mInvert, self->mInvert128, self->mGray);
  v7 = [(OADColor *)self transforms];
  v8 = (void *)[v7 copyWithZone:a3];

  [v6 setTransforms:v8];
  return v6;
}

- (void).cxx_destruct
{
}

@end