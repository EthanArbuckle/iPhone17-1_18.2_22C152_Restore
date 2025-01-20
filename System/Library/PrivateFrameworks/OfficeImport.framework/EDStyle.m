@interface EDStyle
+ (id)styleWithResources:(id)a3;
- (BOOL)isAlignmentInfoApplied;
- (BOOL)isAlignmentInfoOverridden;
- (BOOL)isBordersApplied;
- (BOOL)isBordersOverridden;
- (BOOL)isCenterAcrossAligned;
- (BOOL)isContentFormatApplied;
- (BOOL)isContentFormatOverridden;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToStyle:(id)a3;
- (BOOL)isEquivalentToStyle:(id)a3;
- (BOOL)isFillApplied;
- (BOOL)isFillOverridden;
- (BOOL)isFontApplied;
- (BOOL)isFontOverridden;
- (BOOL)isProtectionApplied;
- (BOOL)isProtectionOverridden;
- (EDAlignmentInfo)alignmentInfo;
- (EDBorders)borders;
- (EDContentFormat)contentFormat;
- (EDFill)fill;
- (EDFont)font;
- (EDProtection)protection;
- (EDStyle)initWithResources:(id)a3;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parent;
- (unint64_t)alignmentInfoIndex;
- (unint64_t)bordersIndex;
- (unint64_t)contentFormatId;
- (unint64_t)fillIndex;
- (unint64_t)fontIndex;
- (unint64_t)hash;
- (unint64_t)index;
- (unint64_t)parentIndex;
- (void)setAlignmentInfo:(id)a3;
- (void)setAlignmentInfoApplied:(BOOL)a3;
- (void)setAlignmentInfoIndex:(unint64_t)a3;
- (void)setAlignmentInfoOverridden:(BOOL)a3;
- (void)setBorders:(id)a3;
- (void)setBordersApplied:(BOOL)a3;
- (void)setBordersIndex:(unint64_t)a3;
- (void)setBordersOverridden:(BOOL)a3;
- (void)setContentFormat:(id)a3;
- (void)setContentFormatApplied:(BOOL)a3;
- (void)setContentFormatId:(unint64_t)a3;
- (void)setContentFormatOverridden:(BOOL)a3;
- (void)setDoNotModify:(BOOL)a3;
- (void)setFill:(id)a3;
- (void)setFillApplied:(BOOL)a3;
- (void)setFillIndex:(unint64_t)a3;
- (void)setFillOverridden:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setFontApplied:(BOOL)a3;
- (void)setFontIndex:(unint64_t)a3;
- (void)setFontOverridden:(BOOL)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setParent:(id)a3;
- (void)setParentIndex:(unint64_t)a3;
- (void)setProtection:(id)a3;
- (void)setProtectionApplied:(BOOL)a3;
- (void)setProtectionOverridden:(BOOL)a3;
@end

@implementation EDStyle

- (EDStyle)initWithResources:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EDStyle;
  v5 = [(EDStyle *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->mResources, v4);
    *(void *)&long long v7 = -1;
    *((void *)&v7 + 1) = -1;
    *(_OWORD *)&v6->mParentIndex = xmmword_238EDF070;
    *(_OWORD *)&v6->mFontIndex = v7;
    *(_OWORD *)&v6->mAlignmentInfoIndex = v7;
    v6->mIndex = -1;
    *(void *)&v6->mContentFormatOverridden = 0;
    *(void *)&v6->mFillApplied = 0;
  }

  return v6;
}

- (void)setParentIndex:(unint64_t)a3
{
  if (!self->mDoNotModify) {
    self->mParentIndex = a3;
  }
}

- (void)setFontIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mFontOverridden = 257;
    self->mFontIndex = a3;
  }
}

- (void)setAlignmentInfo:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    v6 = [WeakRetained alignmentInfos];

    self->mAlignmentInfoIndex = [v6 addOrEquivalentObject:v7];
    *(_WORD *)&self->mAlignmentInfoOverridden = 257;

    id v4 = v7;
  }
}

- (void)setBorders:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    v6 = [WeakRetained borders];

    self->mBordersIndex = [v6 addOrEquivalentObject:v7];
    *(_WORD *)&self->mBordersOverridden = 257;

    id v4 = v7;
  }
}

- (void)setFill:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    v6 = [WeakRetained fills];

    self->mFillIndex = [v6 addOrEquivalentObject:v7];
    *(_WORD *)&self->mFillOverridden = 257;

    id v4 = v7;
  }
}

- (void)setProtection:(id)a3
{
  v5 = (EDProtection *)a3;
  if (!self->mDoNotModify && self->mProtection != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mProtection, a3);
    v5 = v6;
    *(_WORD *)&self->mProtectionOverridden = 257;
  }
}

- (void)setContentFormatId:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mContentFormatOverridden = 257;
    self->mContentFormatId = a3;
  }
}

- (void)setFontOverridden:(BOOL)a3
{
  if (!self->mDoNotModify) {
    self->mFontOverridden = a3;
  }
}

- (void)setAlignmentInfoOverridden:(BOOL)a3
{
  if (!self->mDoNotModify) {
    self->mAlignmentInfoOverridden = a3;
  }
}

- (void)setBordersOverridden:(BOOL)a3
{
  if (!self->mDoNotModify) {
    self->mBordersOverridden = a3;
  }
}

- (void)setFillOverridden:(BOOL)a3
{
  if (!self->mDoNotModify) {
    self->mFillOverridden = a3;
  }
}

- (void)setProtectionOverridden:(BOOL)a3
{
  if (!self->mDoNotModify) {
    self->mProtectionOverridden = a3;
  }
}

- (void)setContentFormatOverridden:(BOOL)a3
{
  if (!self->mDoNotModify) {
    self->mContentFormatOverridden = a3;
  }
}

- (void)setDoNotModify:(BOOL)a3
{
  self->mDoNotModify = a3;
}

- (void)setIndex:(unint64_t)a3
{
  self->mIndex = a3;
}

- (EDFont)font
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained fonts];

  v5 = [v4 objectAtIndex:self->mFontIndex];

  return (EDFont *)v5;
}

- (BOOL)isAlignmentInfoOverridden
{
  return self->mAlignmentInfoOverridden;
}

- (BOOL)isBordersOverridden
{
  return self->mBordersOverridden;
}

- (EDFill)fill
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained fills];

  v5 = [v4 objectAtIndex:self->mFillIndex];

  return (EDFill *)v5;
}

- (EDAlignmentInfo)alignmentInfo
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained alignmentInfos];

  v5 = [v4 objectAtIndex:self->mAlignmentInfoIndex];

  return (EDAlignmentInfo *)v5;
}

- (unint64_t)index
{
  return self->mIndex;
}

- (EDBorders)borders
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained borders];

  v5 = [v4 objectAtIndex:self->mBordersIndex];

  return (EDBorders *)v5;
}

- (BOOL)isContentFormatOverridden
{
  return self->mContentFormatOverridden;
}

- (unint64_t)contentFormatId
{
  return self->mContentFormatId;
}

- (EDContentFormat)contentFormat
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  id v4 = [WeakRetained contentFormats];

  v5 = [v4 objectWithKey:self->mContentFormatId];

  return (EDContentFormat *)v5;
}

- (BOOL)isFontOverridden
{
  return self->mFontOverridden;
}

- (void)setBordersIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mBordersOverridden = 257;
    self->mBordersIndex = a3;
  }
}

- (void)setFillIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mFillOverridden = 257;
    self->mFillIndex = a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  uint64_t v7 = [v5 initWithResources:WeakRetained];

  if (v7)
  {
    *(void *)(v7 + 16) = self->mParentIndex;
    *(void *)(v7 + 24) = self->mContentFormatId;
    *(void *)(v7 + 32) = self->mFontIndex;
    *(void *)(v7 + 40) = self->mFillIndex;
    *(void *)(v7 + 48) = self->mAlignmentInfoIndex;
    *(void *)(v7 + 56) = self->mBordersIndex;
    id v8 = [(EDProtection *)self->mProtection copyWithZone:a3];
    objc_super v9 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = v8;

    *(void *)(v7 + 72) = self->mIndex;
    *(unsigned char *)(v7 + 80) = self->mContentFormatOverridden;
    *(unsigned char *)(v7 + 82) = self->mFontOverridden;
    *(unsigned char *)(v7 + 84) = self->mFillOverridden;
    *(unsigned char *)(v7 + 86) = self->mAlignmentInfoOverridden;
    *(unsigned char *)(v7 + 88) = self->mBordersOverridden;
    *(unsigned char *)(v7 + 90) = self->mProtectionOverridden;
    *(unsigned char *)(v7 + 83) = self->mFontApplied;
    *(unsigned char *)(v7 + 85) = self->mFillApplied;
    *(unsigned char *)(v7 + 87) = self->mAlignmentInfoApplied;
    *(unsigned char *)(v7 + 89) = self->mBordersApplied;
    *(unsigned char *)(v7 + 81) = self->mContentFormatApplied;
    *(unsigned char *)(v7 + 91) = self->mProtectionApplied;
    *(unsigned char *)(v7 + 92) = 0;
    id v10 = (id)v7;
  }

  return (id)v7;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    v6 = [WeakRetained fonts];

    self->mFontIndex = [v6 addOrEquivalentObject:v7];
    *(_WORD *)&self->mFontOverridden = 257;

    id v4 = v7;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (EDStyle *)a3;
  id v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDStyle *)self isEqualToStyle:v5];

  return v6;
}

- (BOOL)isEqualToStyle:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  id v5 = v4;
  BOOL v6 = self->mContentFormatOverridden == v4[80]
    && self->mFontOverridden == v4[82]
    && self->mFillOverridden == v4[84]
    && self->mAlignmentInfoOverridden == v4[86]
    && self->mBordersOverridden == v4[88]
    && self->mProtectionOverridden == v4[90]
    && self->mParentIndex == *((void *)v4 + 2)
    && [(EDStyle *)self isEquivalentToStyle:v4];

  return v6;
}

- (BOOL)isEquivalentToStyle:(id)a3
{
  id v4 = (char *)a3;
  id v5 = v4;
  if (*(_OWORD *)&self->mContentFormatId == *(_OWORD *)(v4 + 24)
    && self->mFillIndex == *((void *)v4 + 5)
    && self->mBordersIndex == *((void *)v4 + 7)
    && self->mAlignmentInfoIndex == *((void *)v4 + 6))
  {
    mProtection = self->mProtection;
    if (mProtection == (EDProtection *)v5[8]) {
      char v7 = 1;
    }
    else {
      char v7 = -[EDProtection isEqual:](mProtection, "isEqual:");
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

+ (id)styleWithResources:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithResources:v3];

  return v4;
}

- (unint64_t)hash
{
  return (self->mFontIndex << 12)
       + (self->mParentIndex << 16)
       + (self->mBordersIndex << 8)
       + 16 * self->mContentFormatId
       + self->mFillIndex;
}

- (void)setContentFormat:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mContentFormatOverridden = 257;
    id v9 = v4;
    unint64_t v5 = [v4 formatId];
    if (v5 == -1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
      char v7 = [WeakRetained contentFormats];

      id v8 = objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "addOrEquivalentObject:", v9));
      self->mContentFormatId = [v8 formatId];
    }
    else
    {
      self->mContentFormatId = v5;
    }
    id v4 = v9;
  }
}

- (BOOL)isFillOverridden
{
  return self->mFillOverridden;
}

- (BOOL)isCenterAcrossAligned
{
  v2 = [(EDStyle *)self alignmentInfo];
  id v3 = v2;
  if (v2) {
    BOOL v4 = [v2 horizontalAlignment] == 6;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isProtectionOverridden
{
  return self->mProtectionOverridden;
}

- (EDProtection)protection
{
  return self->mProtection;
}

- (id)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
  BOOL v4 = [WeakRetained styles];

  unint64_t v5 = [v4 objectAtIndex:self->mParentIndex];

  return v5;
}

- (void)setParent:(id)a3
{
  id v4 = a3;
  if (!self->mDoNotModify)
  {
    id v7 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->mResources);
    BOOL v6 = [WeakRetained styles];

    self->mParentIndex = [v6 addObject:v7];
    id v4 = v7;
  }
}

- (BOOL)isContentFormatApplied
{
  return self->mContentFormatApplied;
}

- (void)setContentFormatApplied:(BOOL)a3
{
  self->mContentFormatApplied = a3;
}

- (BOOL)isFontApplied
{
  return self->mFontApplied;
}

- (void)setFontApplied:(BOOL)a3
{
  self->mFontApplied = a3;
}

- (BOOL)isFillApplied
{
  return self->mFillApplied;
}

- (void)setFillApplied:(BOOL)a3
{
  self->mFillApplied = a3;
}

- (BOOL)isAlignmentInfoApplied
{
  return self->mAlignmentInfoApplied;
}

- (void)setAlignmentInfoApplied:(BOOL)a3
{
  self->mAlignmentInfoApplied = a3;
}

- (BOOL)isBordersApplied
{
  return self->mBordersApplied;
}

- (void)setBordersApplied:(BOOL)a3
{
  self->mBordersApplied = a3;
}

- (BOOL)isProtectionApplied
{
  return self->mProtectionApplied;
}

- (void)setProtectionApplied:(BOOL)a3
{
  self->mProtectionApplied = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProtection, 0);
  objc_destroyWeak((id *)&self->mResources);
}

- (unint64_t)fontIndex
{
  return self->mFontIndex;
}

- (unint64_t)parentIndex
{
  return self->mParentIndex;
}

- (unint64_t)bordersIndex
{
  return self->mBordersIndex;
}

- (unint64_t)fillIndex
{
  return self->mFillIndex;
}

- (unint64_t)alignmentInfoIndex
{
  return self->mAlignmentInfoIndex;
}

- (void)setAlignmentInfoIndex:(unint64_t)a3
{
  if (!self->mDoNotModify)
  {
    *(_WORD *)&self->mAlignmentInfoOverridden = 257;
    self->mAlignmentInfoIndex = a3;
  }
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDStyle;
  v2 = [(EDStyle *)&v4 description];
  return (NSString *)v2;
}

@end