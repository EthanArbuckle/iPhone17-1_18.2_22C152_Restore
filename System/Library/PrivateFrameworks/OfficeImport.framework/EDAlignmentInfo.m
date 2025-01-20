@interface EDAlignmentInfo
+ (id)alignmentInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAlignmentInfo:(id)a3;
- (BOOL)isHorizontalAlignOverridden;
- (BOOL)isIndentOverridden;
- (BOOL)isTextWrapped;
- (BOOL)isTextWrappedOverridden;
- (BOOL)isVerticalAlignOverridden;
- (EDAlignmentInfo)init;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (int)horizontalAlignment;
- (int)indent;
- (int)textRotation;
- (int)verticalAlignment;
- (unint64_t)hash;
- (void)setDoNotModify:(BOOL)a3;
- (void)setHorizontalAlignment:(int)a3;
- (void)setIndent:(int)a3;
- (void)setTextRotation:(int)a3;
- (void)setTextWrapped:(BOOL)a3;
- (void)setVerticalAlignment:(int)a3;
@end

@implementation EDAlignmentInfo

+ (id)alignmentInfo
{
  id v2 = objc_alloc_init((Class)objc_opt_class());
  return v2;
}

- (EDAlignmentInfo)init
{
  v3.receiver = self;
  v3.super_class = (Class)EDAlignmentInfo;
  result = [(EDAlignmentInfo *)&v3 init];
  if (result)
  {
    *(_DWORD *)&result->mHorizontalAlignOverridden = 0;
    *(void *)&result->mHorizontalAlignment = 0x200000000;
    result->mDoNotModify = 0;
    *(void *)&result->mIndent = 0;
    result->mTextWrapped = 0;
  }
  return result;
}

- (void)setHorizontalAlignment:(int)a3
{
  if (!self->mDoNotModify)
  {
    self->mHorizontalAlignOverridden = 1;
    self->mHorizontalAlignment = a3;
  }
}

- (void)setVerticalAlignment:(int)a3
{
  if (!self->mDoNotModify)
  {
    self->mVerticalAlignOverridden = 1;
    self->mVerticalAlignment = a3;
  }
}

- (void)setIndent:(int)a3
{
  if (!self->mDoNotModify)
  {
    self->mIndentOverridden = 1;
    self->mIndent = a3;
  }
}

- (void)setTextWrapped:(BOOL)a3
{
  if (!self->mDoNotModify)
  {
    self->mTextWrappedOveridden = 1;
    self->mTextWrapped = a3;
  }
}

- (void)setTextRotation:(int)a3
{
  if (!self->mDoNotModify) {
    self->mTextRotation = a3;
  }
}

- (void)setDoNotModify:(BOOL)a3
{
  self->mDoNotModify = a3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EDAlignmentInfo *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(EDAlignmentInfo *)self isEqualToAlignmentInfo:v5];

  return v6;
}

- (BOOL)isEqualToAlignmentInfo:(id)a3
{
  v4 = a3;
  BOOL v5 = self->mHorizontalAlignOverridden == *((unsigned __int8 *)v4 + 25)
    && self->mHorizontalAlignment == v4[2]
    && self->mVerticalAlignOverridden == *((unsigned __int8 *)v4 + 26)
    && self->mVerticalAlignment == v4[3]
    && self->mIndentOverridden == *((unsigned __int8 *)v4 + 27)
    && self->mIndent == v4[4]
    && self->mTextWrappedOveridden == *((unsigned __int8 *)v4 + 28)
    && self->mTextWrapped == *((unsigned __int8 *)v4 + 24)
    && self->mTextRotation == v4[5];

  return v5;
}

- (BOOL)isVerticalAlignOverridden
{
  return self->mVerticalAlignOverridden;
}

- (int)verticalAlignment
{
  return self->mVerticalAlignment;
}

- (BOOL)isHorizontalAlignOverridden
{
  return self->mHorizontalAlignOverridden;
}

- (int)horizontalAlignment
{
  return self->mHorizontalAlignment;
}

- (int)indent
{
  return self->mIndent;
}

- (BOOL)isTextWrapped
{
  return self->mTextWrapped;
}

- (int)textRotation
{
  return self->mTextRotation;
}

- (BOOL)isTextWrappedOverridden
{
  return self->mTextWrappedOveridden;
}

- (BOOL)isIndentOverridden
{
  return self->mIndentOverridden;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  BOOL v5 = v4;
  if (v4)
  {
    *((void *)v4 + 1) = *(void *)&self->mHorizontalAlignment;
    *((_DWORD *)v4 + 4) = self->mIndent;
    *((_DWORD *)v4 + 5) = self->mTextRotation;
    *((unsigned char *)v4 + 24) = self->mTextWrapped;
    *((unsigned char *)v4 + 25) = self->mHorizontalAlignOverridden;
    *((unsigned char *)v4 + 26) = self->mVerticalAlignOverridden;
    *((unsigned char *)v4 + 27) = self->mIndentOverridden;
    *((unsigned char *)v4 + 28) = self->mTextWrappedOveridden;
    *((unsigned char *)v4 + 29) = 0;
    id v6 = v4;
  }

  return v5;
}

- (unint64_t)hash
{
  return (self->mVerticalAlignment << 8) + (self->mHorizontalAlignment << 16) + (self->mTextRotation ^ self->mIndent);
}

- (NSString)description
{
  v4.receiver = self;
  v4.super_class = (Class)EDAlignmentInfo;
  id v2 = [(EDAlignmentInfo *)&v4 description];
  return (NSString *)v2;
}

@end