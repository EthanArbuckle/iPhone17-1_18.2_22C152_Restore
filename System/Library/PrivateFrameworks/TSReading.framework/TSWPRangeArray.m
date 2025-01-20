@interface TSWPRangeArray
- (BOOL)isEmpty;
- (TSWPRangeArray)init;
- (TSWPRangeArray)initWithRange:(_NSRange)a3;
- (TSWPRangeArray)initWithRangeVector:(const void *)a3;
- (_NSRange)rangeAtIndex:(unint64_t)a3;
- (_NSRange)rangeReferenceAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)finish;
- (unint64_t)rangeCount;
- (unint64_t)start;
- (void)addRange:(_NSRange)a3;
- (void)dealloc;
- (void)enumerateRangesInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)enumerateRangesUsingBlock:(id)a3;
- (void)removeRange:(_NSRange)a3;
@end

@implementation TSWPRangeArray

- (TSWPRangeArray)init
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPRangeArray;
  if ([(TSWPRangeArray *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (TSWPRangeArray)initWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v5 = [(TSWPRangeArray *)self init];
  v6 = v5;
  if (v5)
  {
    rangeVectorOpaque = v5->_rangeVectorOpaque;
    v8 = (NSUInteger *)*((void *)rangeVectorOpaque + 1);
    unint64_t v9 = *((void *)rangeVectorOpaque + 2);
    if ((unint64_t)v8 >= v9)
    {
      v11 = *(NSUInteger **)rangeVectorOpaque;
      uint64_t v12 = ((uint64_t)v8 - *(void *)rangeVectorOpaque) >> 4;
      unint64_t v13 = v12 + 1;
      if ((unint64_t)(v12 + 1) >> 60) {
        abort();
      }
      uint64_t v14 = v9 - (void)v11;
      if (v14 >> 3 > v13) {
        unint64_t v13 = v14 >> 3;
      }
      if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v15 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v13;
      }
      if (v15)
      {
        v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)rangeVectorOpaque + 16, v15);
        v11 = *(NSUInteger **)rangeVectorOpaque;
        v8 = (NSUInteger *)*((void *)rangeVectorOpaque + 1);
      }
      else
      {
        v16 = 0;
      }
      v17 = (NSUInteger *)&v16[16 * v12];
      v18 = &v16[16 * v15];
      NSUInteger *v17 = location;
      v17[1] = length;
      v10 = v17 + 2;
      if (v8 != v11)
      {
        do
        {
          *((_OWORD *)v17 - 1) = *((_OWORD *)v8 - 1);
          v17 -= 2;
          v8 -= 2;
        }
        while (v8 != v11);
        v11 = *(NSUInteger **)rangeVectorOpaque;
      }
      *(void *)rangeVectorOpaque = v17;
      *((void *)rangeVectorOpaque + 1) = v10;
      *((void *)rangeVectorOpaque + 2) = v18;
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      NSUInteger *v8 = location;
      v8[1] = length;
      v10 = v8 + 2;
    }
    *((void *)rangeVectorOpaque + 1) = v10;
  }
  return v6;
}

- (TSWPRangeArray)initWithRangeVector:(const void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSWPRangeArray;
  if ([(TSWPRangeArray *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  rangeVectorOpaque = (void **)self->_rangeVectorOpaque;
  if (rangeVectorOpaque)
  {
    objc_super v4 = *rangeVectorOpaque;
    if (*rangeVectorOpaque)
    {
      rangeVectorOpaque[1] = v4;
      operator delete(v4);
    }
    MEMORY[0x223CB8F20](rangeVectorOpaque, 0x20C40960023A9);
  }
  v5.receiver = self;
  v5.super_class = (Class)TSWPRangeArray;
  [(TSWPRangeArray *)&v5 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = +[TSWPRangeArray allocWithZone:a3];
  rangeVectorOpaque = self->_rangeVectorOpaque;

  return [(TSWPRangeArray *)v4 initWithRangeVector:rangeVectorOpaque];
}

- (unint64_t)rangeCount
{
  return (uint64_t)(*((void *)self->_rangeVectorOpaque + 1) - *(void *)self->_rangeVectorOpaque) >> 4;
}

- (_NSRange)rangeAtIndex:(unint64_t)a3
{
  uint64_t v4 = *(void *)self->_rangeVectorOpaque;
  unint64_t v5 = (*((void *)self->_rangeVectorOpaque + 1) - v4) >> 4;
  if (v5 <= a3)
  {
    v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSWPRangeArray rangeAtIndex:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRangeArray.mm"), 83, @"Bogus range index");
    uint64_t v4 = *(void *)self->_rangeVectorOpaque;
    unint64_t v5 = (*((void *)self->_rangeVectorOpaque + 1) - v4) >> 4;
  }
  if (v5 <= a3)
  {
    NSUInteger v11 = 0;
    NSUInteger v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v9 = (NSUInteger *)(v4 + 16 * a3);
    NSUInteger v10 = *v9;
    NSUInteger v11 = v9[1];
  }
  result.NSUInteger length = v11;
  result.NSUInteger location = v10;
  return result;
}

- (BOOL)isEmpty
{
  uint64_t v2 = *(void *)self->_rangeVectorOpaque;
  uint64_t v3 = (*((void *)self->_rangeVectorOpaque + 1) - v2) >> 4;
  if (!v3) {
    return 1;
  }
  if (v3 == 1) {
    return *(void *)(v2 + 8) == 0;
  }
  return 0;
}

- (unint64_t)finish
{
  rangeVectorOpaque = (unint64_t **)self->_rangeVectorOpaque;
  if (*rangeVectorOpaque == rangeVectorOpaque[1]) {
    return 0;
  }
  else {
    return **rangeVectorOpaque;
  }
}

- (unint64_t)start
{
  rangeVectorOpaque = (uint64_t *)self->_rangeVectorOpaque;
  uint64_t v4 = *rangeVectorOpaque;
  uint64_t v3 = rangeVectorOpaque[1];
  if (v4 == v3) {
    return 0;
  }
  else {
    return *(void *)(v3 - 8) + *(void *)(v3 - 16);
  }
}

- (void)addRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  TSWPRangeVector::addRange((TSWPRangeVector *)self->_rangeVectorOpaque, &v3);
}

- (_NSRange)rangeReferenceAtIndex:(unint64_t)a3
{
  return (_NSRange *)(*(void *)self->_rangeVectorOpaque + 16 * a3);
}

- (void)removeRange:(_NSRange)a3
{
  _NSRange v3 = a3;
  TSWPRangeVector::removeRange((TSWPRangeVector *)self->_rangeVectorOpaque, &v3);
}

- (void)enumerateRangesUsingBlock:(id)a3
{
  char v11 = 0;
  unint64_t v5 = [(TSWPRangeArray *)self rangeCount];
  if (v5)
  {
    unint64_t v6 = v5;
    unint64_t v7 = 1;
    do
    {
      uint64_t v8 = [(TSWPRangeArray *)self rangeAtIndex:v7 - 1];
      (*((void (**)(id, uint64_t, uint64_t, unint64_t, char *))a3 + 2))(a3, v8, v9, v7 - 1, &v11);
      if (v11) {
        BOOL v10 = 1;
      }
      else {
        BOOL v10 = v7 >= v6;
      }
      ++v7;
    }
    while (!v10);
  }
}

- (void)enumerateRangesInRange:(_NSRange)a3 usingBlock:(id)a4
{
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  char v7 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__TSWPRangeArray_enumerateRangesInRange_usingBlock___block_invoke;
  v4[3] = &unk_2646B27E8;
  _NSRange v5 = a3;
  v4[4] = a4;
  v4[5] = v6;
  [(TSWPRangeArray *)self enumerateRangesUsingBlock:v4];
  _Block_object_dispose(v6, 8);
}

NSUInteger __52__TSWPRangeArray_enumerateRangesInRange_usingBlock___block_invoke(NSRange *a1, NSRange range2, uint64_t a3, unsigned char *a4)
{
  NSRange v7 = NSIntersectionRange(a1[3], range2);
  NSUInteger result = v7.location;
  uint64_t v8 = *(void *)(a1[2].length + 8);
  if (v7.length)
  {
    *(unsigned char *)(v8 + 24) = 1;
    uint64_t v9 = *(uint64_t (**)(void))(a1[2].location + 16);
    return v9();
  }
  else
  {
    *a4 = *(unsigned char *)(v8 + 24);
  }
  return result;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<(TSWPRangeArray*) %p>, %@", self, TSWPRangeVector::description((TSWPRangeVector *)self->_rangeVectorOpaque)];
}

@end