@interface NSRunStorage
+ (void)_setConsistencyCheckingEnabled:(BOOL)a3 superCheckEnabled:(BOOL)a4;
+ (void)initialize;
- (NSRunStorage)init;
- (NSRunStorage)initWithElementSize:(unint64_t)a3 capacity:(unint64_t)a4;
- (NSRunStorage)initWithRunStorage:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)count;
- (unint64_t)elementSize;
- (void)_allocData:(unint64_t)a3;
- (void)_consistencyCheck:(int64_t)a3;
- (void)_consistencyError:(int64_t)a3 startAtZeroError:(BOOL)a4 cacheError:(BOOL)a5 inconsistentBlockError:(BOOL)a6;
- (void)_deallocData;
- (void)_ensureCapacity:(unint64_t)a3;
- (void)_moveGapAndMergeWithBlockRange:(_NSRange)a3;
- (void)_moveGapToBlockIndex:(unint64_t)a3;
- (void)_reallocData:(unint64_t)a3;
- (void)dealloc;
- (void)elementAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (void)insertElement:(void *)a3 range:(_NSRange)a4 coalesceRuns:(BOOL)a5;
- (void)removeElementsInRange:(_NSRange)a3 coalesceRuns:(BOOL)a4;
- (void)replaceElementsInRange:(_NSRange)a3 withElement:(void *)a4 coalesceRuns:(BOOL)a5;
@end

@implementation NSRunStorage

- (void)insertElement:(void *)a3 range:(_NSRange)a4 coalesceRuns:(BOOL)a5
{
  if (a4.length)
  {
    v6.location = a4.location;
    v6.length = 0;
    _replaceElements((int64x2_t *)self, v6, a4.length, a3, a5);
  }
}

- (void)dealloc
{
  if (self->_runs) {
    [(NSRunStorage *)self _deallocData];
  }
  v3.receiver = self;
  v3.super_class = (Class)NSRunStorage;
  [(NSRunStorage *)&v3 dealloc];
}

- (void)_deallocData
{
  self->_runs = 0;
}

- (NSRunStorage)initWithElementSize:(unint64_t)a3 capacity:(unint64_t)a4
{
  v10.receiver = self;
  v10.super_class = (Class)NSRunStorage;
  NSRange v6 = [(NSRunStorage *)&v10 init];
  v7 = (NSRunStorage *)v6;
  if (v6)
  {
    unint64_t v8 = 5;
    if (a4 > 5) {
      unint64_t v8 = a4;
    }
    *((void *)v6 + 3) = 0;
    *((void *)v6 + 4) = v8;
    *(_OWORD *)(v6 + 40) = xmmword_18E5F72A0;
    *((void *)v6 + 1) = 0;
    *((void *)v6 + 2) = a3;
    *((int64x2_t *)v6 + 4) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    *((void *)v6 + 10) = 0;
    *((void *)v6 + 11) = 0;
    [v6 _allocData:v8 * (a3 + 8)];
    if (!v7->_runs)
    {
      [(NSRunStorage *)v7 dealloc];
      return 0;
    }
  }
  return v7;
}

- (void)_allocData:(unint64_t)a3
{
  self->_runs = (_NSRunBlock *)NSAllocateCollectable(a3, 0);
}

- (unint64_t)count
{
  return self->_count;
}

- (void)replaceElementsInRange:(_NSRange)a3 withElement:(void *)a4 coalesceRuns:(BOOL)a5
{
  if (a3.length)
  {
    v7.location = v5;
    v7.length = v6;
    _replaceElements((int64x2_t *)self, v7, v6, a4, a5);
  }
}

- (void)_moveGapToBlockIndex:(unint64_t)a3
{
  unint64_t numBlocks = self->_numBlocks;
  unint64_t maxBlocks = self->_maxBlocks;
  unint64_t v7 = maxBlocks - numBlocks;
  if (maxBlocks != numBlocks)
  {
    unint64_t gapBlockIndex = self->_gapBlockIndex;
    if (gapBlockIndex < a3)
    {
      runs = self->_runs;
      unint64_t v10 = self->_elementSize + 8;
      v11 = (char *)runs + v10 * (v7 + gapBlockIndex);
      v12 = (char *)runs + v10 * gapBlockIndex;
      size_t v13 = v10 * (a3 - gapBlockIndex);
LABEL_6:
      memmove(v12, v11, v13);
      goto LABEL_7;
    }
    if (gapBlockIndex > a3)
    {
      v14 = self->_runs;
      unint64_t v15 = self->_elementSize + 8;
      v11 = (char *)v14 + v15 * a3;
      v12 = (char *)v14 + v15 * (maxBlocks - (numBlocks - a3));
      size_t v13 = v15 * (gapBlockIndex - a3);
      goto LABEL_6;
    }
  }
LABEL_7:
  self->_unint64_t gapBlockIndex = a3;
}

- (void)_ensureCapacity:(unint64_t)a3
{
  unint64_t maxBlocks = self->_maxBlocks;
  if (maxBlocks < a3)
  {
    if (maxBlocks >> 16) {
      unint64_t v5 = ((5 * maxBlocks) >> 2) + 1;
    }
    else {
      unint64_t v5 = ((3 * maxBlocks) >> 1) + 1;
    }
    if (maxBlocks <= 0xFFF) {
      unint64_t v5 = (2 * maxBlocks) | 1;
    }
    if (v5 <= a3) {
      unint64_t v5 = a3;
    }
    self->_unint64_t maxBlocks = v5;
    unint64_t numBlocks = self->_numBlocks;
    [(NSRunStorage *)self _reallocData:(self->_elementSize + 8) * v5];
    unint64_t gapBlockIndex = self->_gapBlockIndex;
    unint64_t v8 = self->_numBlocks;
    BOOL v9 = v8 > gapBlockIndex;
    unint64_t v10 = v8 - gapBlockIndex;
    if (v9)
    {
      runs = self->_runs;
      unint64_t v12 = self->_elementSize + 8;
      size_t v13 = (char *)runs + (self->_maxBlocks - v10) * v12;
      memmove(v13, (char *)runs + v12 * (maxBlocks - numBlocks + gapBlockIndex), v12 * v10);
    }
  }
}

- (void)_reallocData:(unint64_t)a3
{
  self->_runs = (_NSRunBlock *)NSReallocateCollectable(self->_runs, a3, 0);
}

- (void)_moveGapAndMergeWithBlockRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger gapBlockIndex = self->_gapBlockIndex;
  if (gapBlockIndex < a3.location || gapBlockIndex > a3.location + a3.length) {
    -[NSRunStorage _moveGapToBlockIndex:](self, "_moveGapToBlockIndex:");
  }
  else {
    self->_NSUInteger gapBlockIndex = a3.location;
  }
  self->_numBlocks -= length;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (NSRunStorage)init
{
  return [(NSRunStorage *)self initWithElementSize:8 capacity:0];
}

- (NSRunStorage)initWithRunStorage:(id)a3
{
  v4 = [(NSRunStorage *)self initWithElementSize:*((void *)a3 + 2) capacity:*((void *)a3 + 4)];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_count = *((void *)a3 + 1);
    v4->_unint64_t numBlocks = *((void *)a3 + 3);
    memmove(v4->_runs, *((const void **)a3 + 7), (v4->_elementSize + 8) * v4->_maxBlocks);
    *((void *)a3 + 11) = v5->_gapBlockIndex;
    *((void *)a3 + 5) = v5->_indexDeltaStartBlock;
    *((void *)a3 + 6) = v5->_indexDelta;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];

  return (id)[v4 initWithRunStorage:self];
}

- (unint64_t)elementSize
{
  return self->_elementSize;
}

- (void)elementAtIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  _NSBlockNumberForIndex(self, a3, (__n128 *)a4);
  if (self->_gapBlockIndex <= v5) {
    unint64_t v6 = self->_maxBlocks - self->_numBlocks;
  }
  else {
    unint64_t v6 = 0;
  }
  return &self->_runs->var1[(self->_elementSize + 8) * (v6 + v5)];
}

- (void)removeElementsInRange:(_NSRange)a3 coalesceRuns:(BOOL)a4
{
}

- (id)description
{
  v13.receiver = self;
  v13.super_class = (Class)NSRunStorage;
  objc_super v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@\n", -[NSRunStorage description](&v13, sel_description)];
  objc_msgSend(v3, "appendFormat:", @"    %lu %lu-byte element(s) in %lu block(s).  Capacity %lu blocks.\n", self->_count, self->_elementSize, self->_numBlocks, self->_maxBlocks);
  if (self->_indexDeltaStartBlock == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = @"    Index delta not currently in use.\n";
  }
  else
  {
    int64_t indexDelta = self->_indexDelta;
    unint64_t indexDeltaStartBlock = self->_indexDeltaStartBlock;
    v4 = @"    Index delta of %ld, starting at block %lu.\n";
  }
  objc_msgSend(v3, "appendFormat:", v4, indexDelta, indexDeltaStartBlock);
  objc_msgSend(v3, "appendFormat:", @"    Gap at block index %lu.\n", self->_gapBlockIndex);
  if (self->_numBlocks)
  {
    [v3 appendString:@"    Block ranges: "];
    unint64_t numBlocks = self->_numBlocks;
    if (numBlocks)
    {
      uint64_t v6 = 0;
      for (unint64_t i = 0; i < numBlocks; ++i)
      {
        if (self->_gapBlockIndex <= i) {
          unint64_t v8 = self->_maxBlocks - numBlocks;
        }
        else {
          unint64_t v8 = 0;
        }
        uint64_t v9 = *(unint64_t *)((char *)&self->_runs->var0 + (self->_elementSize + 8) * (v8 + i));
        if (i >= self->_indexDeltaStartBlock) {
          v9 += self->_indexDelta;
        }
        if (i)
        {
          [v3 appendFormat:@"%lu: {%lu, %lu}, ", i - 1, v6, v9 - v6];
          unint64_t numBlocks = self->_numBlocks;
        }
        uint64_t v6 = v9;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
    [v3 appendFormat:@"%lu: {%lu, %lu}\n", numBlocks - 1, v9, self->_count - v9];
  }
  return v3;
}

+ (void)_setConsistencyCheckingEnabled:(BOOL)a3 superCheckEnabled:(BOOL)a4
{
  _NSConsistencyCheckEnabled = a3;
  _NSSuperConsistencyCheckEnabled = a4;
  v4 = (void *)_NSPreviousValidDescription;
  uint64_t v5 = _NSPreviousValidDescription;
  atomic_compare_exchange_strong(&_NSPreviousValidDescription, (unint64_t *)&v5, 0);
  if ((void *)v5 == v4) {
}
  }

- (void)_consistencyCheck:(int64_t)a3
{
  if (!a3)
  {
    if (_NSSuperConsistencyCheckEnabled)
    {
      uint64_t v5 = (void *)_NSPreviousValidDescription;
      id v6 = [(NSRunStorage *)self description];
      unint64_t v7 = v5;
      atomic_compare_exchange_strong(&_NSPreviousValidDescription, (unint64_t *)&v7, (unint64_t)v6);
      if (v7 == v5)
      {
        id v8 = v6;
      }
    }
  }
  unint64_t numBlocks = self->_numBlocks;
  if (!numBlocks)
  {
    char v18 = 0;
    int v19 = 0;
    goto LABEL_28;
  }
  unint64_t v10 = 0;
  char v11 = 0;
  char v12 = 0;
  char v13 = 0;
  unint64_t v14 = 0;
  uint64_t v15 = 1;
  if (numBlocks + 1 > 1) {
    uint64_t v15 = numBlocks + 1;
  }
  do
  {
    if (numBlocks == v14)
    {
      unint64_t count = self->_count;
    }
    else
    {
      if (self->_gapBlockIndex <= v14) {
        unint64_t v17 = self->_maxBlocks - numBlocks;
      }
      else {
        unint64_t v17 = 0;
      }
      unint64_t count = *(unint64_t *)((char *)&self->_runs->var0 + (self->_elementSize + 8) * (v17 + v14));
      if (self->_indexDeltaStartBlock <= v14) {
        count += self->_indexDelta;
      }
    }
    if (v14)
    {
      if (v14 - 1 == self->_cachedBlock
        && (self->_cachedBlockRange.location != v10 || self->_cachedBlockRange.length != count - v10))
      {
        char v12 = 1;
      }
      if (count <= v10) {
        char v11 = 1;
      }
    }
    else if (count)
    {
      char v13 = 1;
    }
    ++v14;
    unint64_t v10 = count;
  }
  while (v15 != v14);
  char v18 = v12;
  int v19 = v11 & 1;
  if ((v13 & 1) == 0)
  {
LABEL_28:
    if ((v18 & 1) == 0 && !v19) {
      return;
    }
  }

  -[NSRunStorage _consistencyError:startAtZeroError:cacheError:inconsistentBlockError:](self, "_consistencyError:startAtZeroError:cacheError:inconsistentBlockError:", a3);
}

- (void)_consistencyError:(int64_t)a3 startAtZeroError:(BOOL)a4 cacheError:(BOOL)a5 inconsistentBlockError:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  unint64_t v10 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"NSRunStorage inconsistent (outData = %ld):\n", a3);
  char v11 = v10;
  if (v8)
  {
    [v10 appendFormat:@"    Error: First block's index is not zero.\n"];
    if (!v7)
    {
LABEL_3:
      if (!v6) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if (!v7)
  {
    goto LABEL_3;
  }
  [v11 appendFormat:@"    Error: Access cache range is invalid.\n"];
  if (v6) {
LABEL_4:
  }
    [v11 appendFormat:@"    Error: A block's index is less than or equal to its preceding block's index.\n"];
LABEL_5:
  if (_NSSuperConsistencyCheckEnabled) {
    [v11 appendFormat:@"    Previous state: %@\n", _NSPreviousValidDescription];
  }
  [v11 appendFormat:@"    Current state: %@\n", -[NSRunStorage description](self, "description")];
  NSLog((NSString *)@"%@", v11);
}

@end