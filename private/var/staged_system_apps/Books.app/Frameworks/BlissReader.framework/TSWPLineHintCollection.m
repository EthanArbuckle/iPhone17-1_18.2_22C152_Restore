@interface TSWPLineHintCollection
- (BOOL)applePubUpdateRangesWithLineBreakIndexes:(id)a3 textStorage:(id)a4;
- (TSWPLineHintCollection)initWithApplePubData:(id)a3 context:(id)a4;
- (id)initForEmptyShapeWithPreviousRange:(_NSRange)a3 context:(id)a4;
@end

@implementation TSWPLineHintCollection

- (TSWPLineHintCollection)initWithApplePubData:(id)a3 context:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)TSWPLineHintCollection;
  v5 = [(TSWPLineHintCollection *)&v21 initWithContext:a4];
  if (v5)
  {
    v6 = [a3 bytes];
    v7 = (char *)[a3 length];
    uint64_t v8 = OBJC_IVAR___TSWPLineHintCollection_mHintsCount;
    uint64_t v9 = OBJC_IVAR___TSWPLineHintCollection_mHasColumnIndices;
    *(void *)((char *)v5 + OBJC_IVAR___TSWPLineHintCollection_mHintsCount) = 0;
    if ((unint64_t)v7 < 9
      || *v6 != 73
      || v6[1] != 66
      || v6[2] != 76
      || v6[3] != 70
      || (char v10 = v6[4], (v10 & 0xF0) != 0x10)
      || (v11 = v7 - 8,
          unint64_t v12 = v6[5],
          unint64_t v13 = (unint64_t)(v7 - 8) / v12,
          (unint64_t)(v7 - 8) % v12))
    {
      BOOL v14 = 0;
LABEL_10:
      *((unsigned char *)v5 + v9) = v14;
      *(void *)((char *)v5 + OBJC_IVAR___TSWPLineHintCollection_mHints) = 0;

      return 0;
    }
    int v16 = v10 & 0xF;
    BOOL v14 = v16 != 0;
    v17 = (char *)malloc_type_calloc((unint64_t)(v7 - 8) / v12, 0x38uLL, 0x10000405AA1D1E9uLL);
    if (!v17) {
      goto LABEL_10;
    }
    if ((unint64_t)v11 >= v12)
    {
      if (v13 <= 1) {
        uint64_t v18 = 1;
      }
      else {
        uint64_t v18 = v13;
      }
      v19 = (double *)(v17 + 24);
      v20 = (float *)(v6 + 12);
      do
      {
        *(v19 - 3) = *(v20 - 1);
        *(v19 - 2) = *v20;
        *(v19 - 1) = v20[1];
        double *v19 = v20[2];
        *((float *)v19 + 6) = v20[3];
        v19 += 7;
        v20 = (float *)((char *)v20 + v12);
        --v18;
      }
      while (v18);
    }
    *(void *)((char *)v5 + v8) = v13;
    *((unsigned char *)v5 + v9) = v16 != 0;
    *(void *)((char *)v5 + OBJC_IVAR___TSWPLineHintCollection_mHints) = v17;
  }
  return v5;
}

- (id)initForEmptyShapeWithPreviousRange:(_NSRange)a3 context:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v10.receiver = self;
  v10.super_class = (Class)TSWPLineHintCollection;
  v6 = [(TSWPLineHintCollection *)&v10 initWithContext:a4];
  v7 = v6;
  if (v6)
  {
    *(void *)((char *)v6 + OBJC_IVAR___TSWPLineHintCollection_mHintsCount) = 1;
    uint64_t v8 = malloc_type_calloc(1uLL, 0x38uLL, 0x10000405AA1D1E9uLL);
    *(void *)((char *)v7 + OBJC_IVAR___TSWPLineHintCollection_mHints) = v8;
    *uint64_t v8 = 0u;
    v8[1] = 0u;
    *((void *)v8 + 4) = location + length;
    *((void *)v8 + 5) = 0;
    *((_DWORD *)v8 + 12) = 0;
    *((unsigned char *)v7 + OBJC_IVAR___TSWPLineHintCollection_mValid) = 1;
  }
  return v7;
}

- (BOOL)applePubUpdateRangesWithLineBreakIndexes:(id)a3 textStorage:(id)a4
{
  v6 = (char *)[a4 length];
  v7 = (char *)[a3 firstIndex];
  unint64_t v8 = 0;
  uint64_t v9 = OBJC_IVAR___TSWPLineHintCollection_mHintsCount;
  char v10 = v7 != (char *)0x7FFFFFFFFFFFFFFFLL;
  if (v7 != (char *)0x7FFFFFFFFFFFFFFFLL && *(void *)((char *)self + OBJC_IVAR___TSWPLineHintCollection_mHintsCount))
  {
    v11 = v7;
    uint64_t v12 = 0;
    unint64_t v8 = 0;
    char v10 = 1;
    while (1)
    {
      unint64_t v13 = (char *)[a3 indexGreaterThanIndex:v11];
      if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL || v13 > v6) {
        break;
      }
      if (v13 <= v11)
      {
        [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPLineHintCollection(ApplePubAdditions) applePubUpdateRangesWithLineBreakIndexes:textStorage:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/compatibility/Publication/ApplePub/THImporter/TSWPLineHintCollection_ApplePubAdditions.m") lineNumber:155 description:@"shouldn't generate hint for zero-length range line"];
        char v10 = 0;
        break;
      }
      uint64_t v14 = *(void *)((char *)self + OBJC_IVAR___TSWPLineHintCollection_mHints) + v12;
      *(void *)(v14 + 32) = v11;
      *(void *)(v14 + 40) = v13 - v11;
      ++v8;
      v12 += 56;
      v11 = v13;
      if (v8 >= *(void *)((char *)self + v9))
      {
        char v10 = 1;
        break;
      }
    }
  }
  id v15 = [a3 count];
  uint64_t v16 = *(void *)((char *)self + v9);
  if (v8 == v16 && v15 == (id)(v16 + 1)) {
    BOOL result = v10;
  }
  else {
    BOOL result = 0;
  }
  *((unsigned char *)self + OBJC_IVAR___TSWPLineHintCollection_mValid) = result;
  return result;
}

@end