@interface SSBinaryHeap
- (BOOL)containsObject:(id)a3;
- (SSBinaryHeap)initWithComparator:(id)a3 maxCount:(unint64_t)a4;
- (id)minimumValue;
- (unint64_t)count;
- (unint64_t)countForObject:(id)a3;
- (void)addObject:(id)a3;
- (void)dealloc;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)removeAllObjects;
- (void)removeMinimumValue;
@end

@implementation SSBinaryHeap

- (SSBinaryHeap)initWithComparator:(id)a3 maxCount:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SSBinaryHeap;
  v7 = [(SSBinaryHeap *)&v11 init];
  if (v7)
  {
    uint64_t v8 = MEMORY[0x1C1885400](v6);
    id comparator = v7->_comparator;
    v7->_id comparator = (id)v8;

    v7->_maxCount = a4;
    compareContext.version = 0;
    memset(&compareContext.retain, 0, 24);
    compareContext.info = v7;
    v7->_binaryHeap = CFBinaryHeapCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &commonHeapCreate_heapCallbacks, &compareContext);
  }

  return v7;
}

- (void)dealloc
{
  CFRelease(self->_binaryHeap);
  v3.receiver = self;
  v3.super_class = (Class)SSBinaryHeap;
  [(SSBinaryHeap *)&v3 dealloc];
}

- (void)addObject:(id)a3
{
  CFBinaryHeapAddValue(self->_binaryHeap, a3);
  if ([(SSBinaryHeap *)self count] > self->_maxCount)
  {
    [(SSBinaryHeap *)self removeMinimumValue];
  }
}

- (BOOL)containsObject:(id)a3
{
  return CFBinaryHeapContainsValue(self->_binaryHeap, a3) != 0;
}

- (unint64_t)count
{
  return CFBinaryHeapGetCount(self->_binaryHeap);
}

- (unint64_t)countForObject:(id)a3
{
  return CFBinaryHeapGetCountOfValue(self->_binaryHeap, a3);
}

- (id)minimumValue
{
  return (id)CFBinaryHeapGetMinimum(self->_binaryHeap);
}

- (void)removeMinimumValue
{
}

- (void)removeAllObjects
{
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end