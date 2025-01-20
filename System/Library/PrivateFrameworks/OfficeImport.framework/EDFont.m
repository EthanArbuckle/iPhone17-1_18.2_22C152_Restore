@interface EDFont
+ (EDFont)fontWithResources:(id)a3;
- (BOOL)isBold;
- (BOOL)isBoldOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToFont:(id)a3;
- (BOOL)isHeightOverridden;
- (BOOL)isItalic;
- (BOOL)isItalicOverridden;
- (BOOL)isNameOverridden;
- (BOOL)isOutline;
- (BOOL)isShadow;
- (BOOL)isStrike;
- (BOOL)isStrikeOverridden;
- (BOOL)isUnderlineOverridden;
- (BOOL)isWeightOverridden;
- (EDFont)initWithResources:(id)a3;
- (NSString)description;
- (double)height;
- (id)color;
- (id)colorReference;
- (id)copyWithZone:(_NSZone *)a3;
- (id)name;
- (int)charSet;
- (int)family;
- (int)script;
- (int)underline;
- (unint64_t)hash;
- (unsigned)weight;
- (void)setBold:(BOOL)a3;
- (void)setCharSet:(int)a3;
- (void)setColor:(id)a3;
- (void)setColorReference:(id)a3;
- (void)setDoNotModify:(BOOL)a3;
- (void)setFamily:(int)a3;
- (void)setHeight:(double)a3;
- (void)setItalic:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setOutline:(BOOL)a3;
- (void)setScript:(int)a3;
- (void)setShadow:(BOOL)a3;
- (void)setStrike:(BOOL)a3;
- (void)setUnderline:(int)a3;
- (void)setWeight:(unsigned int)a3;
@end

@implementation EDFont

- (EDFont)initWithResources:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDFont;
  v5 = [(EDFont *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(void *)&v6->mUnderline = 0;
    v6->mOutline = 0;
    v6->mHeightInTwips = 200.0;
    *(void *)&v6->mCharSet = 0;
    *(void *)&v6->mWeight = 400;
    *(_DWORD *)&v6->mUnderlineOverridden = 0;
    *(_DWORD *)&v6->mWeightOverridden = 0;
    mName = v6->mName;
    v6->mName = (NSString *)@"Verdana";

    v6->mDoNotModify = 0;
  }

  return v6;
}

- (void)setName:(id)a3
{
  v5 = (NSString *)a3;
  if (!self->mDoNotModify && self->mName != v5)
  {
    self->mNameOverridden = 1;
    v6 = v5;
    objc_storeStrong((id *)&self->mName, a3);
    v5 = v6;
  }
}

- (void)setHeight:(double)a3
{
  if (!self->mDoNotModify)
  {
    self->mHeightInTwips = a3;
    self->mHeightOverridden = 1;
  }
}

- (void)setWeight:(unsigned int)a3
{
  if (!self->mDoNotModify)
  {
    self->mWeight = a3;
    self->mWeightOverridden = 1;
  }
}

- (void)setCharSet:(int)a3
{
  if (!self->mDoNotModify) {
    self->mCharSet = a3;
  }
}

- (void)setFamily:(int)a3
{
  if (!self->mDoNotModify) {
    self->mFamily = a3;
  }
}

- (void)setColorReference:(id)a3
{
  v5 = (EDColorReference *)a3;
  if (!self->mDoNotModify)
  {
    mColorReference = self->mColorReference;
    p_mColorReference = &self->mColorReference;
    if (mColorReference != v5)
    {
      v8 = v5;
      objc_storeStrong((id *)p_mColorReference, a3);
      v5 = v8;
    }
  }
}

- (void)setBold:(BOOL)a3
{
  if (!self->mDoNotModify)
  {
    self->mBold = a3;
    self->mBoldOverridden = 1;
  }
}

- (void)setItalic:(BOOL)a3
{
  if (!self->mDoNotModify)
  {
    self->mItalic = a3;
    self->mItalicOverridden = 1;
  }
}

- (void)setStrike:(BOOL)a3
{
  if (!self->mDoNotModify)
  {
    self->mStrike = a3;
    self->mStrikeOverridden = 1;
  }
}

- (void)setShadow:(BOOL)a3
{
  if (!self->mDoNotModify) {
    self->mShadow = a3;
  }
}

- (void)setOutline:(BOOL)a3
{
  if (!self->mDoNotModify) {
    self->mOutline = a3;
  }
}

- (void)setScript:(int)a3
{
  if (!self->mDoNotModify) {
    self->mScript = a3;
  }
}

- (void)setUnderline:(int)a3
{
  if (!self->mDoNotModify)
  {
    self->mUnderline = a3;
    self->mUnderlineOverridden = 1;
  }
}

- (void)setDoNotModify:(BOOL)a3
{
  self->mDoNotModify = a3;
}

- (id)name
{
  return self->mName;
}

- (BOOL)isBoldOverridden
{
  return self->mBoldOverridden;
}

- (BOOL)isBold
{
  return self->mBold;
}

- (BOOL)isItalicOverridden
{
  return self->mItalicOverridden;
}

- (BOOL)isItalic
{
  return self->mItalic;
}

- (BOOL)isStrikeOverridden
{
  return self->mStrikeOverridden;
}

- (BOOL)isStrike
{
  return self->mStrike;
}

- (BOOL)isUnderlineOverridden
{
  return self->mUnderlineOverridden;
}

- (int)underline
{
  return self->mUnderline;
}

- (id)color
{
  return [(EDColorReference *)self->mColorReference color];
}

- (BOOL)isHeightOverridden
{
  return self->mHeightOverridden;
}

- (double)height
{
  return self->mHeightInTwips;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  uint64_t v7 = [v5 initWithResources:WeakRetained];

  if (v7)
  {
    uint64_t v8 = [(NSString *)self->mName copyWithZone:a3];
    objc_super v9 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v8;

    id v10 = [(EDColorReference *)self->mColorReference copyWithZone:a3];
    v11 = *(void **)(v7 + 24);
    *(void *)(v7 + 24) = v10;

    *(void *)(v7 + 32) = *(void *)&self->mUnderline;
    *(double *)(v7 + 40) = self->mHeightInTwips;
    *(_DWORD *)(v7 + 48) = self->mCharSet;
    *(_DWORD *)(v7 + 52) = self->mFamily;
    *(_DWORD *)(v7 + 56) = self->mWeight;
    *(unsigned char *)(v7 + 60) = self->mBold;
    *(unsigned char *)(v7 + 61) = self->mItalic;
    *(unsigned char *)(v7 + 62) = self->mShadow;
    *(unsigned char *)(v7 + 63) = self->mStrike;
    *(unsigned char *)(v7 + 64) = self->mOutline;
    *(unsigned char *)(v7 + 65) = self->mUnderlineOverridden;
    *(unsigned char *)(v7 + 66) = self->mStrikeOverridden;
    *(unsigned char *)(v7 + 67) = self->mBoldOverridden;
    *(unsigned char *)(v7 + 68) = self->mWeightOverridden;
    *(unsigned char *)(v7 + 69) = self->mItalicOverridden;
    *(unsigned char *)(v7 + 70) = self->mHeightOverridden;
    *(unsigned char *)(v7 + 71) = self->mNameOverridden;
    *(unsigned char *)(v7 + 72) = 0;
    id v12 = (id)v7;
  }

  return (id)v7;
}

- (void)setColor:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v9 = v4;
    id v5 = [EDColorReference alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    uint64_t v7 = [(EDColorReference *)v5 initWithColor:v9 resources:WeakRetained];
    mColorReference = self->mColorReference;
    self->mColorReference = v7;

    id v4 = v9;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDFont *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDFont *)self isEqualToFont:v5];

  return v6;
}

- (BOOL)isEqualToFont:(id)a3
{
  id v4 = (NSString **)a3;
  mName = self->mName;
  BOOL v7 = (mName == v4[2] || -[NSString isEqual:](mName, "isEqual:"))
    && ((mColorReference = self->mColorReference, mColorReference == (EDColorReference *)v4[3])
     || -[EDColorReference isEqual:](mColorReference, "isEqual:"))
    && self->mBold == *((unsigned __int8 *)v4 + 60)
    && self->mItalic == *((unsigned __int8 *)v4 + 61)
    && self->mShadow == *((unsigned __int8 *)v4 + 62)
    && self->mStrike == *((unsigned __int8 *)v4 + 63)
    && self->mOutline == *((unsigned __int8 *)v4 + 64)
    && self->mUnderline == *((_DWORD *)v4 + 8)
    && self->mScript == *((_DWORD *)v4 + 9)
    && self->mHeightInTwips == *((double *)v4 + 5)
    && self->mCharSet == *((_DWORD *)v4 + 12)
    && self->mFamily == *((_DWORD *)v4 + 13)
    && self->mWeight == *((_DWORD *)v4 + 14)
    && self->mUnderlineOverridden == *((unsigned __int8 *)v4 + 65)
    && self->mStrikeOverridden == *((unsigned __int8 *)v4 + 66)
    && self->mBoldOverridden == *((unsigned __int8 *)v4 + 67)
    && self->mItalicOverridden == *((unsigned __int8 *)v4 + 69)
    && self->mWeightOverridden == *((unsigned __int8 *)v4 + 68)
    && self->mNameOverridden == *((unsigned __int8 *)v4 + 71);

  return v7;
}

- (id)colorReference
{
  return self->mColorReference;
}

+ (EDFont)fontWithResources:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return (EDFont *)v4;
}

- (unint64_t)hash
{
  unint64_t mHeightInTwips = (unint64_t)self->mHeightInTwips;
  NSUInteger v4 = [(NSString *)self->mName hash];
  return v4 ^ [(EDColorReference *)self->mColorReference hash] ^ mHeightInTwips;
}

- (int)script
{
  return self->mScript;
}

- (BOOL)isNameOverridden
{
  return self->mNameOverridden;
}

- (BOOL)isShadow
{
  return self->mShadow;
}

- (BOOL)isOutline
{
  return self->mOutline;
}

- (int)charSet
{
  return self->mCharSet;
}

- (int)family
{
  return self->mFamily;
}

- (unsigned)weight
{
  return self->mWeight;
}

- (BOOL)isWeightOverridden
{
  return self->mWeightOverridden;
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDFont;
  v2 = [(EDFont *)&v4 description];
  return (NSString *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mColorReference, 0);
  objc_storeStrong((id *)&self->mName, 0);
  objc_destroyWeak((id *)&self->mResources);
}

@end