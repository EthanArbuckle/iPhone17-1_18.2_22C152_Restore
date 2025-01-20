@interface VKTextRange
+ (VKTextRange)emptyRange;
+ (VKTextRange)rangeWithNSRange:(_NSRange)a3;
+ (VKTextRange)rangeWithNSRanges:(id)a3;
+ (VKTextRange)rangeWithStart:(id)a3 end:(id)a4;
+ (VKTextRange)rangeWithStartOffset:(unint64_t)a3 endOffset:(unint64_t)a4;
+ (VKTextRange)rangeWithVKRanges:(id)a3;
+ (id)emptyRangeWithOffset:(unint64_t)a3;
+ (id)emptyRangeWithPosition:(id)a3;
- (BOOL)containsMultipleRanges;
- (BOOL)containsTextPosition:(id)a3;
- (BOOL)intersectsNSRange:(_NSRange)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNSNotFound;
- (NSArray)nsRangeArray;
- (NSArray)rangeArray;
- (NSIndexSet)indexSet;
- (VKTextPosition)end;
- (VKTextPosition)start;
- (VKTextRange)initWithIndexSet:(id)a3;
- (VKTextRange)initWithRange:(_NSRange)a3;
- (VKTextRange)initWithStart:(id)a3 end:(id)a4;
- (VKTextRange)initWithStartOffset:(unint64_t)a3 endOffset:(unint64_t)a4;
- (_NSRange)nsRange;
- (id)summaryDescription;
- (int64_t)emptyIndex;
- (unint64_t)endOffset;
- (unint64_t)hash;
- (unint64_t)length;
- (unint64_t)rangeCount;
- (unint64_t)totalLength;
- (void)setEmptyIndex:(int64_t)a3;
- (void)setIndexSet:(id)a3;
- (void)setNsRangeArray:(id)a3;
- (void)setRangeArray:(id)a3;
@end

@implementation VKTextRange

- (VKTextRange)initWithStart:(id)a3 end:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 offset];
  uint64_t v8 = [v6 offset];

  return [(VKTextRange *)self initWithStartOffset:v7 endOffset:v8];
}

- (VKTextRange)initWithStartOffset:(unint64_t)a3 endOffset:(unint64_t)a4
{
  v13.receiver = self;
  v13.super_class = (Class)VKTextRange;
  id v6 = [(VKTextRange *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    if (a3 >= a4) {
      unint64_t v8 = a4;
    }
    else {
      unint64_t v8 = a3;
    }
    if (a3 <= a4) {
      unint64_t v9 = a4;
    }
    else {
      unint64_t v9 = a3;
    }
    if (v8 == 0x7FFFFFFFFFFFFFFFLL || v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v10 = [MEMORY[0x1E4F28D60] indexSet];
    }
    else
    {
      if (v9 == v8)
      {
        v6->_emptyIndex = v8;
        return v7;
      }
      uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:");
    }
    indexSet = v7->_indexSet;
    v7->_indexSet = (NSIndexSet *)v10;
  }
  return v7;
}

- (VKTextRange)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)VKTextRange;
  v5 = [(VKTextRange *)&v9 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", location, length);
    indexSet = v5->_indexSet;
    v5->_indexSet = (NSIndexSet *)v6;

    if (!length) {
      [(VKTextRange *)v5 setEmptyIndex:location];
    }
  }
  return v5;
}

- (VKTextRange)initWithIndexSet:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKTextRange;
  v5 = [(VKTextRange *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    indexSet = v5->_indexSet;
    v5->_indexSet = (NSIndexSet *)v6;
  }
  return v5;
}

+ (VKTextRange)rangeWithStart:(id)a3 end:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (void *)[objc_alloc((Class)a1) initWithStart:v7 end:v6];

  return (VKTextRange *)v8;
}

+ (VKTextRange)rangeWithStartOffset:(unint64_t)a3 endOffset:(unint64_t)a4
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithStartOffset:a3 endOffset:a4];
  return (VKTextRange *)v4;
}

+ (id)emptyRangeWithPosition:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithStart:v4 end:v4];

  return v5;
}

+ (id)emptyRangeWithOffset:(unint64_t)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3, 0);
  return v3;
}

+ (VKTextRange)rangeWithNSRange:(_NSRange)a3
{
  v3 = objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);
  return (VKTextRange *)v3;
}

+ (VKTextRange)rangeWithNSRanges:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    id v4 = [VKTextRange alloc];
    id v5 = [v3 firstObject];
    uint64_t v6 = [v5 rangeValue];
    unint64_t v8 = -[VKTextRange initWithRange:](v4, "initWithRange:", v6, v7);
LABEL_5:

    goto LABEL_7;
  }
  if ((unint64_t)[v3 count] >= 2)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__VKTextRange_rangeWithNSRanges___block_invoke;
    v11[3] = &unk_1E6BF1998;
    id v12 = v9;
    id v5 = v9;
    [v3 enumerateObjectsUsingBlock:v11];
    unint64_t v8 = [[VKTextRange alloc] initWithIndexSet:v5];

    goto LABEL_5;
  }
  unint64_t v8 = +[VKTextRange emptyRange];
LABEL_7:

  return v8;
}

uint64_t __33__VKTextRange_rangeWithNSRanges___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = [a2 rangeValue];
  return objc_msgSend(v2, "addIndexesInRange:", v4, v3);
}

+ (VKTextRange)rangeWithVKRanges:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  if (v4 == 1)
  {
    uint64_t v5 = [v3 firstObject];
LABEL_8:
    id v9 = (VKTextRange *)v5;
    goto LABEL_9;
  }
  if (v4 < 2)
  {
    uint64_t v5 = +[VKTextRange emptyRange];
    goto LABEL_8;
  }
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __33__VKTextRange_rangeWithVKRanges___block_invoke;
  v14 = &unk_1E6BF19C0;
  id v7 = v6;
  id v15 = v7;
  v16 = &v17;
  [v3 enumerateObjectsUsingBlock:&v11];
  unint64_t v8 = [VKTextRange alloc];
  id v9 = -[VKTextRange initWithIndexSet:](v8, "initWithIndexSet:", v7, v11, v12, v13, v14);
  if ([(VKTextRange *)v9 isEmpty]) {
    [(VKTextRange *)v9 setEmptyIndex:v18[3]];
  }

  _Block_object_dispose(&v17, 8);
LABEL_9:

  return v9;
}

void __33__VKTextRange_rangeWithVKRanges___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 nsRange];
  objc_msgSend(v3, "addIndexesInRange:", v5, v6);
  unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v8 = [v4 startOffset];

  if (v7 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
}

- (BOOL)containsTextPosition:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(VKTextRange *)self indexSet];
  uint64_t v6 = [v4 offset];

  LOBYTE(v4) = [v5 containsIndex:v6];
  return (char)v4;
}

+ (VKTextRange)emptyRange
{
  v2 = objc_alloc_init(VKTextRange);
  return v2;
}

- (BOOL)isEmpty
{
  v2 = [(VKTextRange *)self indexSet];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (BOOL)containsMultipleRanges
{
  return [(VKTextRange *)self rangeCount] > 1;
}

- (_NSRange)nsRange
{
  BOOL v3 = [(VKTextRange *)self nsRangeArray];
  if ([v3 count])
  {
    id v4 = [v3 firstObject];
    uint64_t v5 = [v4 rangeValue];

    uint64_t v6 = [v3 lastObject];
    uint64_t v7 = [v6 rangeValue];
    uint64_t v9 = v8;

    NSUInteger v10 = v9 - v5 + v7;
  }
  else
  {
    uint64_t v5 = [(VKTextRange *)self emptyIndex];
    NSUInteger v10 = 0;
  }

  NSUInteger v11 = v5;
  NSUInteger v12 = v10;
  result.NSUInteger length = v12;
  result.NSUInteger location = v11;
  return result;
}

- (NSArray)nsRangeArray
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!self->_nsRangeArray)
  {
    if ([(VKTextRange *)self isEmpty])
    {
      BOOL v3 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", -[VKTextRange emptyIndex](self, "emptyIndex"), 0);
      v8[0] = v3;
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    }
    else
    {
      BOOL v3 = [(VKTextRange *)self indexSet];
      objc_msgSend(v3, "vk_rangeArray");
      id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    nsRangeArray = self->_nsRangeArray;
    self->_nsRangeArray = v4;
  }
  uint64_t v6 = self->_nsRangeArray;
  return v6;
}

- (NSArray)rangeArray
{
  rangeArray = self->_rangeArray;
  if (!rangeArray)
  {
    id v4 = [(VKTextRange *)self nsRangeArray];
    objc_msgSend(v4, "vk_map:", &__block_literal_global_6);
    uint64_t v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_rangeArray;
    self->_rangeArray = v5;

    rangeArray = self->_rangeArray;
  }
  return rangeArray;
}

VKTextRange *__25__VKTextRange_rangeArray__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 rangeValue];
  return +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v3, v2);
}

- (VKTextPosition)start
{
  uint64_t v2 = [(VKTextRange *)self nsRange];
  return +[VKTextPosition positionWithOffset:v2];
}

- (VKTextPosition)end
{
  uint64_t v2 = [(VKTextRange *)self nsRange];
  return +[VKTextPosition positionWithOffset:v2 + v3];
}

- (BOOL)isNSNotFound
{
  uint64_t v3 = [(VKTextRange *)self indexSet];
  BOOL v4 = [v3 firstIndex] == 0x7FFFFFFFFFFFFFFFLL
    || [(NSIndexSet *)self->_indexSet lastIndex] == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (unint64_t)endOffset
{
  uint64_t v2 = [(VKTextRange *)self nsRange];
  return v2 + v3;
}

- (unint64_t)totalLength
{
  [(VKTextRange *)self nsRange];
  return v2;
}

- (unint64_t)rangeCount
{
  unint64_t v2 = [(VKTextRange *)self indexSet];
  unint64_t v3 = [v2 rangeCount];

  return v3;
}

- (unint64_t)length
{
  unint64_t v2 = [(VKTextRange *)self indexSet];
  unint64_t v3 = [v2 count];

  return v3;
}

- (BOOL)intersectsNSRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v5 = [(VKTextRange *)self indexSet];
  LOBYTE(length) = objc_msgSend(v5, "intersectsIndexesInRange:", location, length);

  return length;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ([v4 isEmpty] && -[VKTextRange isEmpty](self, "isEmpty"))
    {
      int64_t v5 = [(VKTextRange *)self emptyIndex];
      char v6 = v5 == [v4 emptyIndex];
    }
    else
    {
      uint64_t v7 = [(VKTextRange *)self indexSet];
      uint64_t v8 = [v4 indexSet];
      char v6 = [v7 isEqualToIndexSet:v8];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2 = [(VKTextRange *)self indexSet];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)summaryDescription
{
  unint64_t v3 = NSString;
  unint64_t v4 = [(VKTextRange *)self startOffset];
  unint64_t v5 = [(VKTextRange *)self endOffset];
  v10.NSUInteger location = [(VKTextRange *)self nsRange];
  char v6 = NSStringFromRange(v10);
  uint64_t v7 = [v3 stringWithFormat:@"Start: %ld End:%ld Range: %@", v4, v5, v6];

  return v7;
}

- (void)setNsRangeArray:(id)a3
{
}

- (void)setRangeArray:(id)a3
{
}

- (NSIndexSet)indexSet
{
  return self->_indexSet;
}

- (void)setIndexSet:(id)a3
{
}

- (int64_t)emptyIndex
{
  return self->_emptyIndex;
}

- (void)setEmptyIndex:(int64_t)a3
{
  self->_emptyIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);
  objc_storeStrong((id *)&self->_rangeArray, 0);
  objc_storeStrong((id *)&self->_nsRangeArray, 0);
}

@end