@interface TSWPDeletionRangeMap
- (BOOL)containsCharIndex:(unint64_t)a3;
- (TSWPDeletionRangeMap)initWithSubRange:(_NSRange)a3 removeRanges:(id)a4;
- (_NSRange)mappedCharRange:(_NSRange)a3;
- (_NSRange)unmappedCharRange:(_NSRange)a3;
- (id)inverseRangesInStorageRange:(_NSRange)a3;
- (unint64_t)mappedCharIndex:(unint64_t)a3;
- (unint64_t)unmappedCharIndex:(unint64_t)a3;
- (void)adjustByDelta:(int64_t)a3;
- (void)dealloc;
@end

@implementation TSWPDeletionRangeMap

- (TSWPDeletionRangeMap)initWithSubRange:(_NSRange)a3 removeRanges:(id)a4
{
  NSUInteger location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)TSWPDeletionRangeMap;
  v6 = [(TSWPDeletionRangeMap *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_subRangeStart = location;
    v6->_removedRanges = (TSWPRangeArray *)[a4 copy];
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPDeletionRangeMap;
  [(TSWPDeletionRangeMap *)&v3 dealloc];
}

- (unint64_t)mappedCharIndex:(unint64_t)a3
{
  if (self->_subRangeStart > a3) {
    return 0;
  }
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  int v12 = 0;
  removedRanges = self->_removedRanges;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __40__TSWPDeletionRangeMap_mappedCharIndex___block_invoke;
  v8[3] = &unk_2646B29A0;
  v8[4] = &v9;
  v8[5] = a3;
  [(TSWPRangeArray *)removedRanges enumerateRangesUsingBlock:v8];
  unint64_t v3 = a3 - self->_subRangeStart - *((unsigned int *)v10 + 6);
  _Block_object_dispose(&v9, 8);
  return v3;
}

uint64_t __40__TSWPDeletionRangeMap_mappedCharIndex___block_invoke(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  unint64_t v5 = *(void *)(result + 40);
  if (v5 <= a2)
  {
    *a5 = 1;
  }
  else if (a2 + a3 <= v5)
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) += a3;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) += v5 - a2;
  }
  return result;
}

- (unint64_t)unmappedCharIndex:(unint64_t)a3
{
  unint64_t v4 = self->_subRangeStart + a3;
  unint64_t v5 = [(TSWPRangeArray *)self->_removedRanges rangeCount];
  if (v5)
  {
    unint64_t v6 = v5;
    uint64_t v7 = 0;
    unsigned int v8 = 0;
    do
    {
      if ([(TSWPRangeArray *)self->_removedRanges rangeAtIndex:v7] - (unint64_t)v8 > v4) {
        break;
      }
      v8 += v9;
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    unsigned int v8 = 0;
  }
  return v4 + v8;
}

- (_NSRange)mappedCharRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = -[TSWPDeletionRangeMap mappedCharIndex:](self, "mappedCharIndex:");
  NSUInteger v7 = [(TSWPDeletionRangeMap *)self mappedCharIndex:location + length];
  if (v6 <= v7) {
    NSUInteger v8 = v7;
  }
  else {
    NSUInteger v8 = v6;
  }
  if (v6 < v7) {
    NSUInteger v7 = v6;
  }
  NSUInteger v9 = v8 - v7;
  result.NSUInteger length = v9;
  result.NSUInteger location = v7;
  return result;
}

- (_NSRange)unmappedCharRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  unint64_t v6 = -[TSWPDeletionRangeMap unmappedCharIndex:](self, "unmappedCharIndex:");
  NSUInteger v7 = v6;
  if (length) {
    unint64_t v8 = [(TSWPDeletionRangeMap *)self unmappedCharIndex:length + location - 1] + 1;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v7 <= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  if (v7 >= v8) {
    NSUInteger v10 = v8;
  }
  else {
    NSUInteger v10 = v7;
  }
  NSUInteger v11 = v9 - v10;
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (void)adjustByDelta:(int64_t)a3
{
  unint64_t subRangeStart = self->_subRangeStart;
  removedRanges = self->_removedRanges;
  self->_unint64_t subRangeStart = subRangeStart + a3;
  uint64_t v7 = [(TSWPRangeArray *)removedRanges rangeCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t i = 0; i != v8; ++i)
    {
      NSUInteger v10 = [(TSWPRangeArray *)self->_removedRanges rangeReferenceAtIndex:i];
      v10->location += a3;
    }
  }
}

- (id)inverseRangesInStorageRange:(_NSRange)a3
{
  unint64_t v4 = -[TSWPRangeArray initWithRange:]([TSWPRangeArray alloc], "initWithRange:", a3.location, a3.length);
  unint64_t v5 = [(TSWPRangeArray *)self->_removedRanges rangeCount];
  if (v5)
  {
    unint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
    {
      uint64_t v8 = [(TSWPRangeArray *)self->_removedRanges rangeReferenceAtIndex:i];
      -[TSWPRangeArray removeRange:](v4, "removeRange:", v8->location, v8->length);
    }
  }

  return v4;
}

- (BOOL)containsCharIndex:(unint64_t)a3
{
  if (self->_subRangeStart <= a3)
  {
    unint64_t v3 = [(TSWPRangeArray *)self->_removedRanges rangeCount];
    if (v3)
    {
      uint64_t v6 = 0;
      unint64_t v7 = v3 - 1;
      do
      {
        unint64_t v9 = [(TSWPRangeArray *)self->_removedRanges rangeAtIndex:v6];
        BOOL v10 = a3 < v9 || a3 - v9 >= v8;
        LOBYTE(v3) = !v10;
        if (!v10) {
          break;
        }
      }
      while (a3 > v9 && v7 != v6++);
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

@end