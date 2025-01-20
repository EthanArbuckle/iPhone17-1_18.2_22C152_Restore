@interface VMURangeArray
- (BOOL)containsLocation:(unint64_t)a3;
- (BOOL)containsRange:(_VMURange)a3;
- (BOOL)intersectsRange:(_VMURange)a3;
- (VMURangeArray)init;
- (VMURangeArray)initWithRanges:(const _VMURange *)a3 count:(unsigned int)a4;
- (_VMURange)largestRange;
- (_VMURange)range;
- (_VMURange)rangeAtIndex:(unsigned int)a3;
- (_VMURange)rangeForLocation:(unint64_t)a3;
- (_VMURange)ranges;
- (_VMURange)subrangeNotExcludedBySelfForRange:(_VMURange)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)indexForLocation:(unint64_t)a3;
- (unint64_t)sumLengths;
- (unsigned)count;
- (void)addRange:(_VMURange)a3;
- (void)addRanges:(id)a3;
- (void)dealloc;
- (void)insertRange:(_VMURange)a3 atIndex:(unsigned int)a4;
- (void)removeAllRanges;
- (void)removeRangeAtIndex:(unsigned int)a3;
- (void)setCapacity:(unsigned int)a3;
- (void)sort;
@end

@implementation VMURangeArray

- (VMURangeArray)init
{
  v5.receiver = self;
  v5.super_class = (Class)VMURangeArray;
  v2 = [(VMURangeArray *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_max = 8;
    v2->_count = 0;
    v2->_ranges = (_VMURange *)malloc_type_malloc(0x80uLL, 0x1000040451B5BE8uLL);
    v3->_sorted = 1;
  }
  return v3;
}

- (VMURangeArray)initWithRanges:(const _VMURange *)a3 count:(unsigned int)a4
{
  v11.receiver = self;
  v11.super_class = (Class)VMURangeArray;
  v6 = [(VMURangeArray *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if (a4 <= 8) {
      unsigned int v8 = 8;
    }
    else {
      unsigned int v8 = a4;
    }
    v6->_max = v8;
    v6->_count = a4;
    v9 = (_VMURange *)malloc_type_malloc(16 * v8, 0x1000040451B5BE8uLL);
    v7->_ranges = v9;
    memmove(v9, a3, 16 * a4);
    v7->_sorted = 0;
  }
  return v7;
}

- (void)dealloc
{
  ranges = self->_ranges;
  if (ranges) {
    free(ranges);
  }
  v4.receiver = self;
  v4.super_class = (Class)VMURangeArray;
  [(VMURangeArray *)&v4 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [+[VMURangeArray allocWithZone:a3] initWithRanges:self->_ranges count:self->_count];
  if (result) {
    *((unsigned char *)result + 28) = self->_sorted;
  }
  return result;
}

- (void)setCapacity:(unsigned int)a3
{
  if (self->_max < a3)
  {
    self->_max = a3;
    self->_ranges = (_VMURange *)malloc_type_realloc(self->_ranges, 16 * a3, 0x1000040451B5BE8uLL);
  }
}

- (void)sort
{
  if (!self->_sorted)
  {
    mergesort(self->_ranges, self->_count, 0x10uLL, (int (__cdecl *)(const void *, const void *))compareRange);
    self->_sorted = 1;
  }
}

- (void)addRange:(_VMURange)a3
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  if (self->_sorted)
  {
    unsigned int count = self->_count;
    if (count)
    {
      v6 = &self->_ranges[count - 1];
      if (v6->length + v6->location > a3.location) {
        self->_sorted = 0;
      }
    }
  }
  v7 = self;
  unsigned int v8 = v7;
  unsigned int v9 = v7->_count;
  if (v9 >= v7->_max)
  {
    unsigned int v11 = (3 * v9 + 3) >> 1;
    v7->_max = v11;
    v13 = v7;
    ranges = (_VMURange *)malloc_type_realloc(v7->_ranges, 16 * v11, 0x1000040451B5BE8uLL);
    unsigned int v8 = v13;
    v13->_ranges = ranges;
    unsigned int v9 = v13->_count;
  }
  else
  {
    ranges = v7->_ranges;
  }
  v8->_unsigned int count = v9 + 1;
  p_unint64_t location = &ranges[v9].location;
  *p_unint64_t location = location;
  p_location[1] = length;
}

- (void)addRanges:(id)a3
{
  if (a3)
  {
    uint64_t v3 = *((unsigned int *)a3 + 2);
    if (v3)
    {
      objc_super v5 = (void *)(*((void *)a3 + 2) + 8);
      do
      {
        -[VMURangeArray addRange:](self, "addRange:", *(v5 - 1), *v5);
        v5 += 2;
        --v3;
      }
      while (v3);
    }
  }
}

- (_VMURange)rangeAtIndex:(unsigned int)a3
{
  if (self->_count <= a3)
  {
    unint64_t location = 0;
    unint64_t length = 0;
  }
  else
  {
    uint64_t v3 = &self->_ranges[a3];
    unint64_t location = v3->location;
    unint64_t length = v3->length;
  }
  result.unint64_t length = length;
  result.unint64_t location = location;
  return result;
}

- (unint64_t)indexForLocation:(unint64_t)a3
{
  BOOL sorted = self->_sorted;
  unint64_t result = self->_count;
  if (!sorted)
  {
    for (unint64_t i = result; i * 16; --i)
    {
      --result;
      unsigned int v11 = &self->_ranges[i];
      if (a3 - v11[-1].location < v11[-1].length) {
        return result;
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (!result) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v6 = 0;
  ranges = self->_ranges;
  while (1)
  {
    uint64_t v8 = v6 + (result >> 1);
    unsigned int v9 = &ranges[v8];
    if (a3 - v9->location < v9->length) {
      break;
    }
    if (a3 < v9->location)
    {
      result >>= 1;
    }
    else
    {
      uint64_t v6 = v8 + 1;
      result += ~(result >> 1);
    }
    if (!result) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6 + (result >> 1);
}

- (_VMURange)rangeForLocation:(unint64_t)a3
{
  unint64_t v4 = [(VMURangeArray *)self indexForLocation:a3];

  unint64_t v5 = [(VMURangeArray *)self rangeAtIndex:v4];
  result.unint64_t length = v6;
  result.unint64_t location = v5;
  return result;
}

- (void)insertRange:(_VMURange)a3 atIndex:(unsigned int)a4
{
}

- (void)removeRangeAtIndex:(unsigned int)a3
{
}

- (void)removeAllRanges
{
  self->_unsigned int count = 0;
}

- (BOOL)containsLocation:(unint64_t)a3
{
  return [(VMURangeArray *)self indexForLocation:a3] != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsRange:(_VMURange)a3
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  unint64_t count = self->_count;
  if (self->_sorted)
  {
    if (count)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = v7 + (count >> 1);
        unsigned int v9 = &self->_ranges[v8];
        unint64_t v10 = v9->location;
        BOOL v11 = VMURangeContainsRange(v9->location, v9->length, location, length);
        if (v11) {
          break;
        }
        if (location < v10)
        {
          count >>= 1;
        }
        else
        {
          uint64_t v7 = v8 + 1;
          count += ~(count >> 1);
        }
      }
      while (count);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v12 = 16 * count;
    do
    {
      uint64_t v13 = v12 - 16;
      BOOL v11 = v12 != 0;
      if (!v12) {
        break;
      }
      BOOL v14 = VMURangeContainsRange(*(unint64_t *)((char *)&self->_ranges[-1].location + v12), *(void *)((char *)self->_ranges + v12 - 8), location, length);
      uint64_t v12 = v13;
    }
    while (!v14);
  }
  return v11;
}

- (BOOL)intersectsRange:(_VMURange)a3
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  unint64_t count = self->_count;
  if (self->_sorted)
  {
    if (count)
    {
      uint64_t v7 = 0;
      do
      {
        uint64_t v8 = v7 + (count >> 1);
        unsigned int v9 = &self->_ranges[v8];
        unint64_t v10 = v9->location;
        BOOL v11 = VMURangeIntersectsRange(v9->location, v9->length, location, length);
        if (v11) {
          break;
        }
        if (location < v10)
        {
          count >>= 1;
        }
        else
        {
          uint64_t v7 = v8 + 1;
          count += ~(count >> 1);
        }
      }
      while (count);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    uint64_t v12 = 16 * count;
    do
    {
      uint64_t v13 = v12 - 16;
      BOOL v11 = v12 != 0;
      if (!v12) {
        break;
      }
      BOOL v14 = VMURangeIntersectsRange(*(unint64_t *)((char *)&self->_ranges[-1].location + v12), *(void *)((char *)self->_ranges + v12 - 8), location, length);
      uint64_t v12 = v13;
    }
    while (!v14);
  }
  return v11;
}

- (_VMURange)subrangeNotExcludedBySelfForRange:(_VMURange)a3
{
  unint64_t length = a3.length;
  unint64_t location = a3.location;
  if (a3.length)
  {
    unsigned int count = self->_count;
    if (count)
    {
      unsigned int v7 = count - 1;
      while (1)
      {
        uint64_t v8 = &self->_ranges[v7];
        unint64_t v9 = VMUIntersectionRange(location, length, v8->location, v8->length);
        if (v9 == location && length == v10) {
          break;
        }
        if (v10)
        {
          if (v9 == location)
          {
            location += v10;
            length -= v10;
          }
          else
          {
            unint64_t length = v9 - location;
          }
        }
        if (!(unint64_t)v7--) {
          goto LABEL_15;
        }
      }
      unint64_t location = 0;
      unint64_t length = 0;
    }
  }
LABEL_15:
  unint64_t v13 = location;
  unint64_t v14 = length;
  result.unint64_t length = v14;
  result.unint64_t location = v13;
  return result;
}

- (_VMURange)range
{
  uint64_t count = self->_count;
  if (self->_sorted)
  {
    if (count)
    {
      ranges = self->_ranges;
      unint64_t location = ranges->location;
      unint64_t v5 = ranges[(count - 1)].length + ranges[(count - 1)].location;
      goto LABEL_13;
    }
LABEL_12:
    unint64_t v5 = 0;
    unint64_t location = -1;
    goto LABEL_13;
  }
  if (!count) {
    goto LABEL_12;
  }
  unint64_t v5 = 0;
  p_unint64_t length = &self->_ranges->length;
  unint64_t location = -1;
  do
  {
    unint64_t v7 = *(p_length - 1);
    if (v7 < location) {
      unint64_t location = *(p_length - 1);
    }
    if (*p_length + v7 > v5) {
      unint64_t v5 = *p_length + v7;
    }
    p_length += 2;
    --count;
  }
  while (count);
LABEL_13:
  unint64_t v8 = v5 - location;
  result.unint64_t length = v8;
  result.unint64_t location = location;
  return result;
}

- (_VMURange)largestRange
{
  unsigned int count = self->_count;
  if (count)
  {
    unint64_t location = 0;
    unint64_t length = 0;
    ranges = self->_ranges;
    unsigned int v7 = count - 1;
    do
    {
      uint64_t v8 = v7;
      if (ranges[v7].length >= length)
      {
        unint64_t location = ranges[v7].location;
        unint64_t length = ranges[v7].length;
      }
      --v7;
    }
    while (v8);
  }
  else
  {
    unint64_t length = 0;
    unint64_t location = 0;
  }
  result.unint64_t length = length;
  result.unint64_t location = location;
  return result;
}

- (unint64_t)sumLengths
{
  uint64_t count = self->_count;
  if (!count) {
    return 0;
  }
  unint64_t result = 0;
  p_unint64_t length = &self->_ranges->length;
  do
  {
    unint64_t v6 = *p_length;
    p_length += 2;
    result += v6;
    --count;
  }
  while (count);
  return result;
}

- (_VMURange)ranges
{
  return self->_ranges;
}

- (unsigned)count
{
  return self->_count;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] string];
  unint64_t v4 = v3;
  if (self->_sorted) {
    unint64_t v5 = "YES";
  }
  else {
    unint64_t v5 = "NO";
  }
  [v3 appendFormat:@"_sorted?  %s\n", v5];
  if (self->_count)
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      [v4 appendFormat:@"[%#qx to %#qx] (length: %qd)\n", self->_ranges[v6].location, self->_ranges[v6].length + self->_ranges[v6].location, self->_ranges[v6].length];
      ++v7;
      ++v6;
    }
    while (v7 < self->_count);
  }

  return v4;
}

@end