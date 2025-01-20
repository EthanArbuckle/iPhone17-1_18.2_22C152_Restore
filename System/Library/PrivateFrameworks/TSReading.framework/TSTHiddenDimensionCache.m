@interface TSTHiddenDimensionCache
- (BOOL)anyHiddenIndicesInRange:(_NSRange)a3;
- (BOOL)anyUserHiddenIndicesInRange:(_NSRange)a3;
- (BOOL)isIndexHidden:(unint64_t)a3;
- (BOOL)isIndexUserHidden:(unint64_t)a3;
- (NSIndexSet)visibleIndices;
- (TSTHiddenDimensionCache)initWithUserHiddenInformation:(BOOL)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)findNextVisibleIndex:(unint64_t)a3;
- (unint64_t)findNthNextVisibleIndex:(unint64_t)a3 fromIndex:(unint64_t)a4;
- (unint64_t)findNthPreviousVisibleIndex:(unint64_t)a3 fromIndex:(unint64_t)a4;
- (unint64_t)findPreviousVisibleIndex:(unint64_t)a3;
- (unint64_t)numberHiddenIndicesInRange:(_NSRange)a3;
- (unint64_t)numberUserHiddenIndicesInRange:(_NSRange)a3;
- (unsigned)numberOfVisibleIndicesToMarkIndexFrom:(unint64_t)a3;
- (void)dealloc;
- (void)deleteRange:(_NSRange)a3;
- (void)insertRange:(_NSRange)a3;
- (void)invalidate:(_NSRange)a3;
- (void)moveRangeFrom:(_NSRange)a3 toIndex:(unint64_t)a4;
- (void)setAllInvalidValuesUsingBlock:(id)a3;
- (void)setAllValuesToZero;
- (void)setCount:(unint64_t)a3;
- (void)setMarkIndex:(unint64_t)a3;
@end

@implementation TSTHiddenDimensionCache

- (TSTHiddenDimensionCache)initWithUserHiddenInformation:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)TSTHiddenDimensionCache;
  v4 = [(TSTHiddenDimensionCache *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->mCount = 0;
    v4->mCachedVisible = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    if (v3) {
      v5->mCachedUserVisible = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    }
    v5->mInvalidRanges = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x263F089C8]);
    v5->mMarkIndex = 0;
  }
  return v5;
}

- (void)dealloc
{
  self->mCachedVisible = 0;
  self->mCachedUserVisible = 0;

  self->mInvalidRanges = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSTHiddenDimensionCache;
  [(TSTHiddenDimensionCache *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[TSTHiddenDimensionCache allocWithZone:a3] init];
  v4->mCount = self->mCount;
  v4->mCachedVisible = (NSMutableIndexSet *)[(NSMutableIndexSet *)self->mCachedVisible mutableCopy];
  v4->mCachedUserVisible = (NSMutableIndexSet *)[(NSMutableIndexSet *)self->mCachedUserVisible mutableCopy];
  v4->mInvalidRanges = (NSMutableIndexSet *)[(NSMutableIndexSet *)self->mInvalidRanges mutableCopy];
  v4->mMarkIndex = self->mMarkIndex;
  return v4;
}

- (void)setCount:(unint64_t)a3
{
  if (a3 != self->mCount)
  {
    -[TSTHiddenDimensionCache invalidate:](self, "invalidate:");
    self->mCount = a3;
    -[NSMutableIndexSet removeIndexesInRange:](self->mInvalidRanges, "removeIndexesInRange:", a3, ~a3);
    -[NSMutableIndexSet removeIndexesInRange:](self->mCachedVisible, "removeIndexesInRange:", a3, ~a3);
    mCachedUserVisible = self->mCachedUserVisible;
    -[NSMutableIndexSet removeIndexesInRange:](mCachedUserVisible, "removeIndexesInRange:", a3, ~a3);
  }
}

- (void)invalidate:(_NSRange)a3
{
}

- (BOOL)isIndexHidden:(unint64_t)a3
{
  return [(NSMutableIndexSet *)self->mCachedVisible containsIndex:a3] ^ 1;
}

- (BOOL)isIndexUserHidden:(unint64_t)a3
{
  return [(NSMutableIndexSet *)self->mCachedUserVisible containsIndex:a3] ^ 1;
}

- (unint64_t)numberHiddenIndicesInRange:(_NSRange)a3
{
  return a3.length
       - [(NSMutableIndexSet *)self->mCachedVisible countOfIndexesInRange:a3.location];
}

- (unint64_t)numberUserHiddenIndicesInRange:(_NSRange)a3
{
  return a3.length
       - [(NSMutableIndexSet *)self->mCachedUserVisible countOfIndexesInRange:a3.location];
}

- (BOOL)anyHiddenIndicesInRange:(_NSRange)a3
{
  return -[NSMutableIndexSet containsIndexesInRange:](self->mCachedVisible, "containsIndexesInRange:", a3.location, a3.length) ^ 1;
}

- (BOOL)anyUserHiddenIndicesInRange:(_NSRange)a3
{
  return -[NSMutableIndexSet containsIndexesInRange:](self->mCachedUserVisible, "containsIndexesInRange:", a3.location, a3.length) ^ 1;
}

- (unint64_t)findPreviousVisibleIndex:(unint64_t)a3
{
  return [(NSMutableIndexSet *)self->mCachedVisible indexLessThanOrEqualToIndex:a3];
}

- (unint64_t)findNextVisibleIndex:(unint64_t)a3
{
  return [(NSMutableIndexSet *)self->mCachedVisible indexGreaterThanOrEqualToIndex:a3];
}

- (unint64_t)findNthPreviousVisibleIndex:(unint64_t)a3 fromIndex:(unint64_t)a4
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  unint64_t v12 = a4;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = a3;
  mCachedVisible = self->mCachedVisible;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __65__TSTHiddenDimensionCache_findNthPreviousVisibleIndex_fromIndex___block_invoke;
  v7[3] = &unk_2646B39E8;
  v7[4] = v8;
  v7[5] = &v9;
  -[NSMutableIndexSet enumerateRangesInRange:options:usingBlock:](mCachedVisible, "enumerateRangesInRange:options:usingBlock:", 0, a4, 2, v7);
  unint64_t v5 = v10[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __65__TSTHiddenDimensionCache_findNthPreviousVisibleIndex_fromIndex___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  unint64_t v4 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  if (v4 >= a3) {
    unint64_t v4 = a3;
  }
  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)(result + 40) + 8);
    if (*(void *)(v5 + 24) >= v4)
    {
      *(void *)(v5 + 24) = a2 + a3 - v4;
      *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) -= v4;
      if (*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24)) {
        return result;
      }
    }
    else
    {
      *(void *)(v5 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  *a4 = 1;
  return result;
}

- (unint64_t)findNthNextVisibleIndex:(unint64_t)a3 fromIndex:(unint64_t)a4
{
  uint64_t v7 = [(NSMutableIndexSet *)self->mCachedVisible lastIndex] + 1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  unint64_t v19 = a4;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  unint64_t v15 = a3;
  mCachedVisible = self->mCachedVisible;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __61__TSTHiddenDimensionCache_findNthNextVisibleIndex_fromIndex___block_invoke;
  v11[3] = &unk_2646B39E8;
  v11[4] = &v12;
  v11[5] = &v16;
  -[NSMutableIndexSet enumerateRangesInRange:options:usingBlock:](mCachedVisible, "enumerateRangesInRange:options:usingBlock:", a4, v7, 0, v11);
  if (v13[3])
  {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    v17[3] = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v9 = v17[3];
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

uint64_t __61__TSTHiddenDimensionCache_findNthNextVisibleIndex_fromIndex___block_invoke(uint64_t result, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v5 = *(void *)(v4 + 24);
  if (v5 >= a3) {
    unint64_t v6 = a3;
  }
  else {
    unint64_t v6 = *(void *)(v4 + 24);
  }
  *(void *)(v4 + 24) = v5 - v6;
  if (!*(void *)(*(void *)(*(void *)(result + 32) + 8) + 24))
  {
    *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = a2 + v6 - 1;
    *a4 = 1;
  }
  return result;
}

- (void)setMarkIndex:(unint64_t)a3
{
  self->mMarkIndex = a3;
}

- (unsigned)numberOfVisibleIndicesToMarkIndexFrom:(unint64_t)a3
{
  if (self->mMarkIndex <= a3) {
    return -[NSMutableIndexSet countOfIndexesInRange:](self->mCachedVisible, "countOfIndexesInRange:");
  }
  else {
    return 0;
  }
}

- (void)setAllValuesToZero
{
  -[NSMutableIndexSet addIndexesInRange:](self->mCachedVisible, "addIndexesInRange:", 0, self->mCount);
  -[NSMutableIndexSet addIndexesInRange:](self->mCachedUserVisible, "addIndexesInRange:", 0, self->mCount);
  mInvalidRanges = self->mInvalidRanges;

  [(NSMutableIndexSet *)mInvalidRanges removeAllIndexes];
}

- (void)setAllInvalidValuesUsingBlock:(id)a3
{
  mInvalidRanges = self->mInvalidRanges;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__TSTHiddenDimensionCache_setAllInvalidValuesUsingBlock___block_invoke;
  v5[3] = &unk_2646B3A10;
  v5[4] = self;
  v5[5] = a3;
  [(NSMutableIndexSet *)mInvalidRanges enumerateIndexesWithOptions:0 usingBlock:v5];
  [(NSMutableIndexSet *)self->mInvalidRanges removeAllIndexes];
}

void *__57__TSTHiddenDimensionCache_setAllInvalidValuesUsingBlock___block_invoke(void *result, unint64_t a2)
{
  if (*(void *)(result[4] + 8) <= a2) {
    return result;
  }
  objc_super v3 = result;
  int v4 = (*(uint64_t (**)(void))(result[5] + 16))();
  unint64_t v5 = *(void **)(v3[4] + 16);
  if (v4)
  {
    [v5 removeIndex:a2];
    result = *(void **)(v3[4] + 24);
    if (!result) {
      return result;
    }
    if (v4 == 1)
    {
      return (void *)[result removeIndex:a2];
    }
  }
  else
  {
    [v5 addIndex:a2];
    result = *(void **)(v3[4] + 24);
    if (!result) {
      return result;
    }
  }

  return (void *)[result addIndex:a2];
}

- (void)moveRangeFrom:(_NSRange)a3 toIndex:(unint64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  -[NSMutableIndexSet tsu_moveIndexesInRange:toOffset:](self->mCachedVisible, "tsu_moveIndexesInRange:toOffset:");
  mCachedUserVisible = self->mCachedUserVisible;

  -[NSMutableIndexSet tsu_moveIndexesInRange:toOffset:](mCachedUserVisible, "tsu_moveIndexesInRange:toOffset:", location, length, a4);
}

- (void)deleteRange:(_NSRange)a3
{
  NSUInteger v4 = a3.location + a3.length;
  NSUInteger v5 = -a3.length;
  [(NSMutableIndexSet *)self->mCachedVisible shiftIndexesStartingAtIndex:a3.location + a3.length by:-a3.length];
  [(NSMutableIndexSet *)self->mCachedUserVisible shiftIndexesStartingAtIndex:v4 by:v5];
  mInvalidRanges = self->mInvalidRanges;

  [(NSMutableIndexSet *)mInvalidRanges shiftIndexesStartingAtIndex:v4 by:v5];
}

- (void)insertRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  -[NSMutableIndexSet shiftIndexesStartingAtIndex:by:](self->mCachedVisible, "shiftIndexesStartingAtIndex:by:");
  [(NSMutableIndexSet *)self->mCachedUserVisible shiftIndexesStartingAtIndex:location by:length];
  [(NSMutableIndexSet *)self->mInvalidRanges shiftIndexesStartingAtIndex:location by:length];

  -[TSTHiddenDimensionCache invalidate:](self, "invalidate:", location, length);
}

- (id)description
{
  objc_super v3 = (void *)MEMORY[0x263F089D8];
  NSUInteger v4 = (objc_class *)objc_opt_class();
  NSUInteger v5 = (void *)[v3 stringWithFormat:@"<%@ %p count=%d mark=%d", NSStringFromClass(v4), self, self->mCount, self->mMarkIndex];
  [v5 appendString:@" visibleRanges={"];
  mCachedVisible = self->mCachedVisible;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __38__TSTHiddenDimensionCache_description__block_invoke;
  v10[3] = &unk_2646B34E0;
  v10[4] = v5;
  [(NSMutableIndexSet *)mCachedVisible enumerateRangesUsingBlock:v10];
  [v5 appendString:@"}"];
  if (self->mCachedUserVisible)
  {
    [v5 appendString:@" userVisibleRanges={"];
    mCachedUserVisible = self->mCachedUserVisible;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __38__TSTHiddenDimensionCache_description__block_invoke_2;
    v9[3] = &unk_2646B34E0;
    v9[4] = v5;
    [(NSMutableIndexSet *)mCachedUserVisible enumerateRangesUsingBlock:v9];
    [v5 appendString:@"}"];
  }
  [v5 appendString:@"}>"];
  return v5;
}

uint64_t __38__TSTHiddenDimensionCache_description__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"{%d-%d},", a2, (a2 + a3 - 1));
}

uint64_t __38__TSTHiddenDimensionCache_description__block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"{%d-%d},", a2, (a2 + a3 - 1));
}

- (NSIndexSet)visibleIndices
{
  return &self->mCachedVisible->super;
}

@end