@interface TSWPLineHintCollection
- (BOOL)checkSubCollectionRange:(_NSRange)a3;
- (BOOL)hasColumnIndices;
- (BOOL)valid;
- (TSWPLineHintCollection)initWithContainingCollection:(id)a3 range:(_NSRange)a4 context:(id)a5;
- (_NSRange)hintRangeForColumnIndex:(unint64_t)a3 frameBounds:(CGRect)a4 charIndex:(unint64_t)a5;
- (_NSRange)hintRangeForLineStartingAtHintIndex:(unint64_t)a3;
- (const)hints;
- (id)descriptionWithStorage:(id)a3;
- (id)newSubCollectionWithRange:(_NSRange)a3;
- (unint64_t)hintsCount;
- (unint64_t)p_columnIndexForHintIndex:(unint64_t)a3;
- (void)dealloc;
@end

@implementation TSWPLineHintCollection

- (void)dealloc
{
  mContainingCollection = self->mContainingCollection;
  if (mContainingCollection) {

  }
  else {
    free(self->mHints);
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPLineHintCollection;
  [(TSWPLineHintCollection *)&v4 dealloc];
}

- (const)hints
{
  return self->mHints;
}

- (TSWPLineHintCollection)initWithContainingCollection:(id)a3 range:(_NSRange)a4 context:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v10.receiver = self;
  v10.super_class = (Class)TSWPLineHintCollection;
  v8 = [(TSPObject *)&v10 initWithContext:a5];
  if (v8)
  {
    v8->mContainingCollection = (TSWPLineHintCollection *)a3;
    v8->mHints = ($3F8F9197BE0E1D7EB0532A081E49366E *)([a3 hints] + 56 * location);
    v8->mHintsCount = length;
    v8->mHasColumnIndices = [a3 hasColumnIndices];
  }
  return v8;
}

- (BOOL)checkSubCollectionRange:(_NSRange)a3
{
  NSUInteger v3 = a3.location + a3.length;
  unint64_t mHintsCount = self->mHintsCount;
  if (a3.location + a3.length > mHintsCount) {
    return 0;
  }
  mHints = self->mHints;
  if ((mHints[a3.location].var2 & 1) == 0) {
    return 0;
  }
  NSUInteger v6 = v3 <= a3.location + 1 ? a3.location + 1 : a3.location + a3.length;
  p_var2 = &mHints[a3.location + 1].var2;
  while (++a3.location < v3)
  {
    char v8 = *(unsigned char *)p_var2;
    p_var2 += 14;
    if (v8) {
      return 0;
    }
  }
  return v6 >= mHintsCount || (mHints[v6].var2 & 1) != 0;
}

- (id)newSubCollectionWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (!-[TSWPLineHintCollection checkSubCollectionRange:](self, "checkSubCollectionRange:")) {
    return 0;
  }
  id v6 = objc_alloc((Class)objc_opt_class());
  v7 = [(TSPObject *)self context];

  return (id)objc_msgSend(v6, "initWithContainingCollection:range:context:", self, location, length, v7);
}

- (unint64_t)p_columnIndexForHintIndex:(unint64_t)a3
{
  if (self->mHintsCount <= a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return SHIBYTE(self->mHints[a3].var2);
  }
}

- (_NSRange)hintRangeForColumnIndex:(unint64_t)a3 frameBounds:(CGRect)a4 charIndex:(unint64_t)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  if (![(TSWPLineHintCollection *)self valid])
  {
LABEL_12:
    NSUInteger v18 = 0;
    NSUInteger v19 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_29;
  }
  v12 = [(TSWPLineHintCollection *)self hints];
  unint64_t v13 = [(TSWPLineHintCollection *)self hintsCount];
  unint64_t v14 = v13;
  if (self->mHasColumnIndices)
  {
    if (v13)
    {
      NSUInteger v15 = 0;
      while (1)
      {
        unint64_t v16 = [(TSWPLineHintCollection *)self p_columnIndexForHintIndex:v15];
        if (v16 >= a3) {
          break;
        }
        if (v14 == ++v15) {
          goto LABEL_12;
        }
      }
      unint64_t v20 = v16;
      goto LABEL_15;
    }
  }
  else if (v13)
  {
    NSUInteger v15 = 0;
    p_size = &v12->var0.size;
    while (*(void *)&p_size[1].width < a5)
    {
      ++v15;
      p_size = (CGSize *)((char *)p_size + 56);
      if (v13 == v15) {
        goto LABEL_12;
      }
    }
    double v24 = TSDCenterOfRect(p_size[-1].width, p_size[-1].height, p_size->width, p_size->height);
    v26.origin.CGFloat x = x;
    v26.origin.CGFloat y = y;
    v26.size.CGFloat width = width;
    v26.size.CGFloat height = height;
    if (v24 >= CGRectGetMinX(v26)
      && (v27.origin.x = x, v27.origin.CGFloat y = y,
                            v27.size.CGFloat width = width,
                            v27.size.CGFloat height = height,
                            v24 <= CGRectGetMaxX(v27)))
    {
      NSUInteger v19 = 0x7FFFFFFFFFFFFFFFLL;
      unint64_t v20 = a3;
    }
    else
    {
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v19 = v15;
    }
    goto LABEL_16;
  }
  NSUInteger v15 = 0;
  unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_15:
  NSUInteger v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_16:
  NSUInteger v18 = 0;
  if (v20 == a3 && v15 < v14)
  {
    p_var2 = &v12[v15 + 1].var2;
    NSUInteger v22 = v15;
    while (v14 - 1 != v22)
    {
      ++v22;
      char v23 = *(unsigned char *)p_var2;
      p_var2 += 14;
      if ((v23 & 4) != 0) {
        goto LABEL_23;
      }
    }
    NSUInteger v22 = v14;
LABEL_23:
    NSUInteger v18 = v22 - v15;
    NSUInteger v19 = v15;
  }
LABEL_29:
  result.NSUInteger length = v18;
  result.NSUInteger location = v19;
  return result;
}

- (_NSRange)hintRangeForLineStartingAtHintIndex:(unint64_t)a3
{
  if (![(TSWPLineHintCollection *)self valid]) {
    goto LABEL_10;
  }
  v5 = [(TSWPLineHintCollection *)self hints];
  unint64_t v6 = [(TSWPLineHintCollection *)self hintsCount];
  unint64_t v7 = v6;
  if (v6 <= a3)
  {
    v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSWPLineHintCollection hintRangeForLineStartingAtHintIndex:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPLineHintCollection.mm"), 182, @"invalid hint index %lu (count = %lu)", a3, v7);
LABEL_10:
    NSUInteger v10 = 0;
    a3 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_11;
  }
  p_var2 = &v5[a3].var2;
  unint64_t v9 = a3;
  while (v9 <= a3 || (*(unsigned char *)p_var2 & 8) == 0)
  {
    ++v9;
    p_var2 += 14;
    if (v6 == v9)
    {
      unint64_t v9 = v6;
      break;
    }
  }
  NSUInteger v10 = v9 - a3;
LABEL_11:
  NSUInteger v13 = a3;
  result.NSUInteger length = v10;
  result.NSUInteger location = v13;
  return result;
}

- (id)descriptionWithStorage:(id)a3
{
  v5 = objc_msgSend(MEMORY[0x263F089D8], "stringWithString:", -[TSWPLineHintCollection description](self, "description"));
  objc_msgSend(v5, "appendFormat:", @" valid=%d hintsCounts=%lu", self->mValid, self->mHintsCount);
  uint64_t v6 = [a3 length];
  if (self->mHintsCount)
  {
    unint64_t v7 = v6;
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      NSUInteger v10 = &self->mHints[v8];
      NSUInteger location = v10->var1.location;
      v11.NSUInteger length = v10->var1.length;
      if (v11.length + location <= v7)
      {
        NSUInteger v13 = (__CFString *)objc_msgSend(a3, "substringWithRange:");
        unint64_t v14 = &self->mHints[v8];
        NSUInteger location = v14->var1.location;
        v11.NSUInteger length = v14->var1.length;
      }
      else
      {
        NSUInteger v13 = @"<invalid>";
      }
      v11.NSUInteger location = location;
      NSUInteger v15 = NSStringFromRange(v11);
      [v5 appendFormat:@"\n- [%lu] %p %p %@ %@ - '%@'", v9++, self, a3, v15, NSStringFromCGRect(self->mHints[v8++].var0), v13];
    }
    while (v9 < self->mHintsCount);
  }
  return v5;
}

- (unint64_t)hintsCount
{
  return self->mHintsCount;
}

- (BOOL)valid
{
  return self->mValid;
}

- (BOOL)hasColumnIndices
{
  return self->mHasColumnIndices;
}

@end