@interface TSKShuffleMapping
- (BOOL)isMove;
- (BOOL)isVertical;
- (TSKShuffleMapping)initWithStartIndex:(unsigned __int16)a3 endIndex:(unsigned __int16)a4;
- (TSKShuffleMapping)initWithStartIndex:(unsigned __int16)a3 endIndex:(unsigned __int16)a4 mapping:(unsigned __int16 *)a5;
- (id)copyInverse;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForMovedIndicesStartingAtIndex:(unsigned __int16)a3 destinationIndex:(unsigned __int16)a4 numberOfIndices:(unsigned __int16)a5 vertical:(BOOL)a6;
- (unsigned)endIndex;
- (unsigned)mapIndex:(unsigned __int16)a3;
- (unsigned)mapping;
- (unsigned)mappingSize;
- (unsigned)reverseMapIndex:(unsigned __int16)a3;
- (unsigned)startIndex;
- (void)dealloc;
- (void)enumerateMappingRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)insert:(unsigned __int16)a3 indicesAtIndex:(unsigned __int16)a4 insertingBefore:(BOOL)a5;
- (void)remove:(unsigned __int16)a3 indicesAtIndex:(unsigned __int16)a4;
- (void)swapIndex:(unsigned __int16)a3 withIndex:(unsigned __int16)a4;
@end

@implementation TSKShuffleMapping

- (TSKShuffleMapping)initWithStartIndex:(unsigned __int16)a3 endIndex:(unsigned __int16)a4 mapping:(unsigned __int16 *)a5
{
  v14.receiver = self;
  v14.super_class = (Class)TSKShuffleMapping;
  v8 = [(TSKShuffleMapping *)&v14 init];
  v9 = v8;
  if (v8)
  {
    v8->mStartIndex = a3;
    v8->mEndIndex = a4;
    *(_WORD *)&v8->mIsVertical = 1;
    uint64_t v10 = (unsigned __int16)(a4 - a3 + 1);
    v11 = (unsigned __int16 *)malloc_type_malloc(2 * v10, 0x1000040BDFB0063uLL);
    v9->mMapping = v11;
    if (a5)
    {
      memcpy(v11, a5, 2 * v10);
    }
    else if (v10)
    {
      for (uint64_t i = 0; i != v10; ++i)
        v11[i] = i;
    }
  }
  return v9;
}

- (TSKShuffleMapping)initWithStartIndex:(unsigned __int16)a3 endIndex:(unsigned __int16)a4
{
  return [(TSKShuffleMapping *)self initWithStartIndex:a3 endIndex:a4 mapping:0];
}

- (id)initForMovedIndicesStartingAtIndex:(unsigned __int16)a3 destinationIndex:(unsigned __int16)a4 numberOfIndices:(unsigned __int16)a5 vertical:(BOOL)a6
{
  int v7 = a5;
  unsigned int v8 = a4;
  unsigned int v9 = a3;
  unsigned int v11 = a5 + a3;
  if (a4 <= a3) {
    unsigned __int16 v12 = a5 + a3;
  }
  else {
    unsigned __int16 v12 = a4;
  }
  v13 = malloc_type_malloc(2 * v12, 0x1000040BDFB0063uLL);
  objc_super v14 = v13;
  if (v7)
  {
    if (v8 <= v9) {
      __int16 v15 = 0;
    }
    else {
      __int16 v15 = v7;
    }
    __int16 v16 = v8 - v9 - v15;
    unsigned int v17 = v9;
    do
    {
      *((_WORD *)v13 + (unsigned __int16)v17) = v16 + v17;
      ++v17;
    }
    while (v11 > (unsigned __int16)v17);
  }
  if (v8 <= v9)
  {
    if (v8 >= v9) {
      goto LABEL_23;
    }
    uint64_t v19 = v8;
    do
    {
      *((_WORD *)v13 + v19) = v19 + v7;
      ++v19;
    }
    while (v9 != v19);
  }
  else
  {
    if (v8 <= (unsigned __int16)v11) {
      goto LABEL_19;
    }
    unint64_t v18 = (unsigned __int16)v11;
    do
    {
      *((_WORD *)v13 + v18) = v18 - v7;
      ++v18;
    }
    while (v18 < v8);
  }
  if (v8 > v9)
  {
LABEL_19:
    if (v9)
    {
      for (uint64_t i = 0; i != v9; ++i)
        *((_WORD *)v13 + i) = i;
    }
    goto LABEL_26;
  }
LABEL_23:
  if (v8)
  {
    for (uint64_t j = 0; j != v8; ++j)
      *((_WORD *)v13 + j) = j;
  }
LABEL_26:
  v22 = [(TSKShuffleMapping *)self initWithStartIndex:0 endIndex:(unsigned __int16)(v12 - 1) mapping:v13];
  v23 = v22;
  if (v22)
  {
    v22->mIsVertical = a6;
    v22->mIsMoveOperation = 1;
    v22->mFirstMovedIndex = v9;
    v22->mDestinationIndexForMove = v8;
    v22->mNumberOfIndicesMoved = v7;
  }
  free(v14);
  return v23;
}

- (void)dealloc
{
  free(self->mMapping);
  v3.receiver = self;
  v3.super_class = (Class)TSKShuffleMapping;
  [(TSKShuffleMapping *)&v3 dealloc];
}

- (unsigned)mappingSize
{
  return self->mEndIndex - self->mStartIndex + 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[TSKShuffleMapping allocWithZone:a3] initWithStartIndex:self->mStartIndex endIndex:self->mEndIndex mapping:self->mMapping];
  if (result)
  {
    *((unsigned char *)result + 24) = self->mIsVertical;
    *((unsigned char *)result + 25) = self->mIsMoveOperation;
    *((_WORD *)result + 13) = self->mFirstMovedIndex;
    *((_WORD *)result + 14) = self->mDestinationIndexForMove;
    *((_WORD *)result + 15) = self->mNumberOfIndicesMoved;
  }
  return result;
}

- (id)copyInverse
{
  objc_super v3 = (void *)[(TSKShuffleMapping *)self copy];
  int v4 = [(TSKShuffleMapping *)self mappingSize];
  uint64_t v5 = [v3 mapping];
  if (v4)
  {
    uint64_t v6 = 0;
    mMapping = self->mMapping;
    do
    {
      *(_WORD *)(v5 + 2 * mMapping[v6]) = v6;
      ++v6;
    }
    while (v4 != v6);
  }
  return v3;
}

- (unsigned)mapIndex:(unsigned __int16)a3
{
  uint64_t mStartIndex = self->mStartIndex;
  if (mStartIndex <= a3 && self->mEndIndex >= a3) {
    return self->mMapping[a3 - mStartIndex] + mStartIndex;
  }
  return a3;
}

- (unsigned)reverseMapIndex:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  unsigned int v5 = [(TSKShuffleMapping *)self mappingSize];
  unsigned int mStartIndex = self->mStartIndex;
  if (mStartIndex <= v3 && self->mEndIndex >= v3 && v5 != 0)
  {
    unsigned __int16 v8 = 0;
    while (v3 - mStartIndex != self->mMapping[v8])
    {
      if (v5 <= ++v8) {
        return v3;
      }
    }
    LOWORD(v3) = v8 + mStartIndex;
  }
  return v3;
}

- (BOOL)isVertical
{
  return self->mIsVertical;
}

- (BOOL)isMove
{
  return self->mNumberOfIndicesMoved != 0;
}

- (void)enumerateMappingRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length = a3.length;
  unint64_t location = a3.location;
  v13.unint64_t location = self->mStartIndex;
  v13.NSUInteger length = self->mEndIndex - v13.location;
  v12.unint64_t location = location;
  v12.NSUInteger length = length;
  NSRange v8 = NSIntersectionRange(v12, v13);
  if (location < 0x10000)
  {
    NSUInteger v10 = location;
    int v9 = location;
  }
  else
  {
    int v9 = location;
    do
    {
      (*((void (**)(id, void, void))a4 + 2))(a4, (unsigned __int16)v9, (unsigned __int16)v9);
      ++v9;
    }
    while (location > (unsigned __int16)v9);
    NSUInteger v10 = (unsigned __int16)v9;
  }
  if (v8.location + v8.length > v10)
  {
    do
    {
      (*((void (**)(id, void, void))a4 + 2))(a4, (unsigned __int16)v9++, self->mMapping[v10]);
      NSUInteger v10 = (unsigned __int16)v9;
    }
    while (v8.location + v8.length > (unsigned __int16)v9);
  }
  unint64_t v11 = location + length;
  if (v11 > v10)
  {
    do
    {
      (*((void (**)(id, void, void))a4 + 2))(a4, (unsigned __int16)v9, (unsigned __int16)v9);
      ++v9;
    }
    while (v11 > (unsigned __int16)v9);
  }
}

- (void)insert:(unsigned __int16)a3 indicesAtIndex:(unsigned __int16)a4 insertingBefore:(BOOL)a5
{
  unsigned int mStartIndex = self->mStartIndex;
  BOOL v6 = a4 >= mStartIndex;
  unsigned __int16 v7 = a4 - mStartIndex;
  if (v6 && self->mEndIndex >= a4)
  {
    unsigned int v9 = a3;
    if (a5)
    {
      unsigned __int16 v10 = self->mMapping[v7];
      unsigned __int16 v11 = v7;
    }
    else
    {
      unsigned __int16 v11 = v7 + 1;
      unsigned __int16 v10 = self->mMapping[v7] + 1;
    }
    unsigned int v12 = [(TSKShuffleMapping *)self mappingSize];
    mMapping = self->mMapping;
    if (v12)
    {
      uint64_t v14 = v12;
      __int16 v15 = self->mMapping;
      do
      {
        unsigned int v16 = *v15;
        if (v16 >= v10) {
          *__int16 v15 = v16 + v9;
        }
        ++v15;
        --v14;
      }
      while (v14);
    }
    unsigned __int16 v17 = v12 + v9;
    self->mEndIndex += v9;
    unint64_t v18 = (unsigned __int16 *)malloc_type_realloc(mMapping, 2 * (unsigned __int16)(v12 + v9), 0x1000040BDFB0063uLL);
    self->mMapping = v18;
    if (!v18)
    {
      uint64_t v19 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v20 = [NSString stringWithUTF8String:"-[TSKShuffleMapping insert:indicesAtIndex:insertingBefore:]"];
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKShuffleMapping.mm"), 327, @"shuffle mapping couldn't grow mapping table!");
      unint64_t v18 = self->mMapping;
    }
    memmove(&v18[v9 + v11], &v18[v11], 2 * (int)(v17 - (v9 + v11)));
    if (v9)
    {
      uint64_t v21 = 0;
      uint64x2_t v22 = (uint64x2_t)vdupq_n_s64((unint64_t)v9 - 1);
      v23 = &self->mMapping[v11];
      int64x2_t v24 = (int64x2_t)xmmword_223838000;
      int64x2_t v25 = vdupq_n_s64(2uLL);
      do
      {
        int32x2_t v26 = vmovn_s64((int64x2_t)vcgeq_u64(v22, (uint64x2_t)v24));
        if (v26.i8[0]) {
          v23[v21] = v10 + v21;
        }
        if (v26.i8[4]) {
          v23[v21 + 1] = v10 + (v21 | 1);
        }
        v21 += 2;
        int64x2_t v24 = vaddq_s64(v24, v25);
      }
      while (((v9 + 1) & 0x1FFFE) != v21);
    }
  }
}

- (void)remove:(unsigned __int16)a3 indicesAtIndex:(unsigned __int16)a4
{
  unsigned int mStartIndex = self->mStartIndex;
  unsigned __int16 v5 = a4 - mStartIndex;
  if (a4 >= mStartIndex)
  {
    unsigned int mEndIndex = self->mEndIndex;
    BOOL v8 = mEndIndex >= a4;
    unsigned int v9 = mEndIndex - a4;
    if (v8)
    {
      if ((int)(v9 + 1) < a3) {
        unsigned __int16 v10 = v9 + 1;
      }
      else {
        unsigned __int16 v10 = a3;
      }
      unsigned int v11 = [(TSKShuffleMapping *)self mappingSize];
      __int16 v12 = v11;
      unsigned int v13 = v10 + v5;
      if (v10)
      {
        mMapping = self->mMapping;
        unsigned __int16 v15 = v5;
        do
        {
          uint64_t v16 = v11;
          unsigned __int16 v17 = mMapping;
          if (v11)
          {
            do
            {
              unsigned int v18 = *v17;
              if (v18 > mMapping[v15]) {
                *unsigned __int16 v17 = v18 - 1;
              }
              ++v17;
              --v16;
            }
            while (v16);
          }
          mMapping[v15++] = 0;
        }
        while (v13 > v15);
      }
      else
      {
        mMapping = self->mMapping;
      }
      memmove(&mMapping[v5], &mMapping[v13], 2 * (int)(v11 - v13));
      self->mEndIndex -= v10;
      uint64_t v19 = (unsigned __int16 *)malloc_type_realloc(self->mMapping, 2 * (unsigned __int16)(v12 - v10), 0x1000040BDFB0063uLL);
      self->mMapping = v19;
      if (!v19)
      {
        uint64_t v20 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v21 = [NSString stringWithUTF8String:"-[TSKShuffleMapping remove:indicesAtIndex:]"];
        uint64_t v22 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKShuffleMapping.mm"];
        [v20 handleFailureInFunction:v21 file:v22 lineNumber:384 description:@"shuffle mapping couldn't shrink translation table!"];
      }
    }
  }
}

- (void)swapIndex:(unsigned __int16)a3 withIndex:(unsigned __int16)a4
{
  unsigned int mStartIndex = self->mStartIndex;
  if (mStartIndex > a3
    || ((mEndIndex = self->mEndIndex, mEndIndex >= a4) ? (BOOL v9 = mStartIndex > a4) : (BOOL v9 = 1),
        !v9 ? (BOOL v10 = mEndIndex >= a3) : (BOOL v10 = 0),
        !v10))
  {
    unsigned int v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSKShuffleMapping swapIndex:withIndex:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKShuffleMapping.mm"), 395, @"Can't swap indices outside of mapping range!");
    LOWORD(mStartIndex) = self->mStartIndex;
  }
  mMapping = self->mMapping;
  uint64_t v14 = (unsigned __int16)(a3 - mStartIndex);
  unsigned __int16 v15 = mMapping[v14];
  uint64_t v16 = (unsigned __int16)(a4 - mStartIndex);
  mMapping[v14] = mMapping[v16];
  mMapping[v16] = v15;
}

- (unsigned)startIndex
{
  return self->mStartIndex;
}

- (unsigned)endIndex
{
  return self->mEndIndex;
}

- (unsigned)mapping
{
  return self->mMapping;
}

@end