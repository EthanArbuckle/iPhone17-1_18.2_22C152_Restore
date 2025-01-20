@interface VMUNonOverlappingRangeArray
- (id)subtract:(id)a3 mergeRanges:(BOOL)a4;
- (void)_mergeAllBitsOfRange:(_VMURange)a3 excludingRanges:(id)a4 mergeRanges:(BOOL)a5;
- (void)addOrExtendRange:(_VMURange)a3;
- (void)mergeRange:(_VMURange)a3;
- (void)mergeRange:(_VMURange)a3 excludingRanges:(id)a4;
- (void)mergeRanges:(id)a3;
- (void)mergeRanges:(id)a3 excludingRanges:(id)a4;
- (void)sortAndMergeRanges;
@end

@implementation VMUNonOverlappingRangeArray

- (void)addOrExtendRange:(_VMURange)a3
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  unsigned int count = self->super._count;
  if (!count) {
    goto LABEL_5;
  }
  v7 = &self->super._ranges[count - 1];
  unint64_t v8 = v7->location;
  uint64_t v9 = v7->length;
  if (VMURangeContainsRange(v7->location, v9, a3.location, a3.length)) {
    return;
  }
  if (VMURangeIntersectsOrAbutsRange(location, length, v8, v9))
  {
    v10 = &self->super._ranges[self->super._count - 1];
    v10->unint64_t location = VMUUnionRange(location, length, v8);
    v10->unint64_t length = v11;
  }
  else
  {
LABEL_5:
    v12.receiver = self;
    v12.super_class = (Class)VMUNonOverlappingRangeArray;
    -[VMURangeArray addRange:](&v12, sel_addRange_, location, length);
  }
}

- (void)sortAndMergeRanges
{
  if (!self->super._sorted)
  {
    v6.receiver = self;
    v6.super_class = (Class)VMUNonOverlappingRangeArray;
    [(VMURangeArray *)&v6 sort];
  }
  ranges = self->super._ranges;
  uint64_t count = self->super._count;
  self->super._uint64_t count = 0;
  self->super._max = 8;
  self->super._ranges = (_VMURange *)malloc_type_malloc(0x80uLL, 0x1000040451B5BE8uLL);
  if (count)
  {
    p_unint64_t length = &ranges->length;
    do
    {
      -[VMUNonOverlappingRangeArray addOrExtendRange:](self, "addOrExtendRange:", *(p_length - 1), *p_length);
      p_length += 2;
      --count;
    }
    while (count);
  }
  free(ranges);
}

- (void)mergeRange:(_VMURange)a3
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  if (!self->super._sorted) {
    [(VMURangeArray *)self sort];
  }
  unsigned int count = self->super._count;
  if (count)
  {
    unsigned int v7 = 0;
    while (1)
    {
      unsigned int v8 = v7 + (count >> 1);
      uint64_t v9 = &self->super._ranges[v8];
      unint64_t v10 = v9->location;
      uint64_t v11 = v9->length;
      if (v9->location == location && v11 == length) {
        break;
      }
      if (VMURangeIntersectsRange(location, length + 1, v9->location, v11 + 1))
      {
        unint64_t v13 = VMUUnionRange(v10, v11, location);
        uint64_t v15 = v14;
        RangeArrayRemoveRangeAtIndex(self, v7 + (count >> 1));
        -[VMUNonOverlappingRangeArray mergeRange:](self, "mergeRange:", v13, v15);
        return;
      }
      if (location >= v10) {
        count += ~(count >> 1);
      }
      else {
        count >>= 1;
      }
      if (location >= v10) {
        unsigned int v7 = v8 + 1;
      }
      if (!count) {
        goto LABEL_18;
      }
    }
  }
  else
  {
    unsigned int v7 = 0;
LABEL_18:
    RangeArrayInsertRangeAtIndex(self, location, length, v7);
  }
}

- (void)mergeRanges:(id)a3
{
  int v3 = *((_DWORD *)a3 + 2);
  if (v3)
  {
    unsigned int v6 = v3 - 1;
    do
    {
      uint64_t v7 = v6;
      unsigned int v8 = (void *)(*((void *)a3 + 2) + 16 * v6);
      -[VMUNonOverlappingRangeArray mergeRange:](self, "mergeRange:", *v8, v8[1]);
      --v6;
    }
    while (v7);
  }
}

- (void)mergeRange:(_VMURange)a3 excludingRanges:(id)a4
{
  uint64_t v5 = [a4 subrangeNotExcludedBySelfForRange:a3.location length:a3.length];
  if (v6)
  {
    -[VMUNonOverlappingRangeArray mergeRange:](self, "mergeRange:", v5, v6);
  }
}

- (void)mergeRanges:(id)a3 excludingRanges:(id)a4
{
  int v4 = *((_DWORD *)a3 + 2);
  if (v4)
  {
    unsigned int v8 = v4 - 1;
    do
    {
      uint64_t v9 = v8;
      unint64_t v10 = (void *)(*((void *)a3 + 2) + 16 * v8);
      -[VMUNonOverlappingRangeArray mergeRange:excludingRanges:](self, "mergeRange:excludingRanges:", *v10, v10[1], a4);
      --v8;
    }
    while (v9);
  }
}

- (void)_mergeAllBitsOfRange:(_VMURange)a3 excludingRanges:(id)a4 mergeRanges:(BOOL)a5
{
  BOOL v5 = a5;
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  uint64_t v9 = (unsigned int *)a4;
  if (length)
  {
    v16 = v9;
    uint64_t v10 = 16 * v9[2];
    while (1)
    {
      uint64_t v11 = v10 - 16;
      if (!v10) {
        break;
      }
      unint64_t v12 = VMUIntersectionRange(location, length, *(void *)(*((void *)v16 + 2) + v10 - 16), *(void *)(*((void *)v16 + 2) + v10 - 8));
      uint64_t v10 = v11;
      if (v13)
      {
        unint64_t v14 = v12;
        uint64_t v15 = v13;
        -[VMUNonOverlappingRangeArray _mergeAllBitsOfRange:excludingRanges:mergeRanges:](self, "_mergeAllBitsOfRange:excludingRanges:mergeRanges:", location, v12 - location, v16, v5);
        -[VMUNonOverlappingRangeArray _mergeAllBitsOfRange:excludingRanges:mergeRanges:](self, "_mergeAllBitsOfRange:excludingRanges:mergeRanges:", v14 + v15, location + length - (v14 + v15), v16, v5);
        goto LABEL_9;
      }
    }
    if (v5) {
      -[VMUNonOverlappingRangeArray mergeRange:](self, "mergeRange:", location, length);
    }
    else {
      -[VMURangeArray addRange:](self, "addRange:", location, length);
    }
LABEL_9:
    uint64_t v9 = v16;
  }
}

- (id)subtract:(id)a3 mergeRanges:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_opt_new();
  if (self->super._count)
  {
    uint64_t v8 = 0;
    unint64_t v9 = 0;
    do
    {
      ++v9;
      [v7 _mergeAllBitsOfRange:self->super._ranges[v8].location length:self->super._ranges[v8].length excludingRanges:v6 mergeRanges:v4];
      ++v8;
    }
    while (v9 < self->super._count);
  }

  return v7;
}

@end