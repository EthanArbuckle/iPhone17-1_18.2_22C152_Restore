@interface EDDifferentialStyle
+ (id)differentialStyle;
- (EDAlignmentInfo)alignmentInfo;
- (EDBorders)borders;
- (EDContentFormat)contentFormat;
- (EDFill)fill;
- (EDFont)font;
- (EDProtection)protection;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setAlignmentInfo:(id)a3;
- (void)setBorders:(id)a3;
- (void)setContentFormat:(id)a3;
- (void)setFill:(id)a3;
- (void)setFont:(id)a3;
- (void)setProtection:(id)a3;
@end

@implementation EDDifferentialStyle

+ (id)differentialStyle
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (void)setBorders:(id)a3
{
}

- (void)setFont:(id)a3
{
}

- (void)setFill:(id)a3
{
}

- (void)setContentFormat:(id)a3
{
}

- (EDBorders)borders
{
  return self->mBorders;
}

- (EDFill)fill
{
  return self->mFill;
}

- (EDFont)font
{
  return self->mFont;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    uint64_t v5 = [(EDAlignmentInfo *)self->mAlignmentInfo copy];
    v6 = (void *)v4[1];
    v4[1] = v5;

    uint64_t v7 = [(EDBorders *)self->mBorders copy];
    v8 = (void *)v4[2];
    v4[2] = v7;

    uint64_t v9 = [(EDFill *)self->mFill copy];
    v10 = (void *)v4[3];
    v4[3] = v9;

    uint64_t v11 = [(EDFont *)self->mFont copy];
    v12 = (void *)v4[4];
    v4[4] = v11;

    uint64_t v13 = [(EDProtection *)self->mProtection copy];
    v14 = (void *)v4[5];
    v4[5] = v13;

    uint64_t v15 = [(EDContentFormat *)self->mContentFormat copy];
    v16 = (void *)v4[6];
    v4[6] = v15;

    v17 = v4;
  }

  return v4;
}

- (id)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDDifferentialStyle;
  id v2 = [(EDDifferentialStyle *)&v4 description];
  return v2;
}

- (EDAlignmentInfo)alignmentInfo
{
  return self->mAlignmentInfo;
}

- (void)setAlignmentInfo:(id)a3
{
}

- (EDProtection)protection
{
  return self->mProtection;
}

- (void)setProtection:(id)a3
{
}

- (EDContentFormat)contentFormat
{
  return self->mContentFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mContentFormat, 0);
  objc_storeStrong((id *)&self->mProtection, 0);
  objc_storeStrong((id *)&self->mFont, 0);
  objc_storeStrong((id *)&self->mFill, 0);
  objc_storeStrong((id *)&self->mBorders, 0);
  objc_storeStrong((id *)&self->mAlignmentInfo, 0);
}

@end