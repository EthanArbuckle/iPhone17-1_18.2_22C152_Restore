@interface OADNormalTextBodyAutoFit
- (BOOL)isEqual:(id)a3;
- (OADNormalTextBodyAutoFit)initWithFontScalePercent:(float)a3 lineSpacingReductionPercent:(float)a4;
- (float)fontScalePercent;
- (float)lineSpacingReductionPercent;
- (id)description;
- (unint64_t)hash;
@end

@implementation OADNormalTextBodyAutoFit

- (OADNormalTextBodyAutoFit)initWithFontScalePercent:(float)a3 lineSpacingReductionPercent:(float)a4
{
  v7.receiver = self;
  v7.super_class = (Class)OADNormalTextBodyAutoFit;
  result = [(OADTextBodyAutoFit *)&v7 initWithType:2];
  if (result)
  {
    *((float *)&result->super.mType + 1) = a3;
    result->mFontScalePercent = a4;
  }
  return result;
}

- (float)fontScalePercent
{
  return *((float *)&self->super.mType + 1);
}

- (float)lineSpacingReductionPercent
{
  return self->mFontScalePercent;
}

- (unint64_t)hash
{
  unint64_t v2 = (unint64_t)self->mFontScalePercent ^ (unint64_t)*((float *)&self->super.mType + 1);
  v4.receiver = self;
  v4.super_class = (Class)OADNormalTextBodyAutoFit;
  return v2 ^ [(OADTextBodyAutoFit *)&v4 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (float v5 = *((float *)&self->super.mType + 1), [v4 fontScalePercent], v5 == v6)
    && (float mFontScalePercent = self->mFontScalePercent,
        [v4 lineSpacingReductionPercent],
        mFontScalePercent == v8))
  {
    v11.receiver = self;
    v11.super_class = (Class)OADNormalTextBodyAutoFit;
    BOOL v9 = [(OADTextBodyAutoFit *)&v11 isEqual:v4];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)OADNormalTextBodyAutoFit;
  unint64_t v2 = [(OADTextBodyAutoFit *)&v4 description];
  return v2;
}

@end