@interface REPriorityQueue
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)allObjects;
- (REPriorityQueue)init;
- (REPriorityQueue)initWithComparator:(id)a3;
- (id)comparator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)minimumObject;
- (unint64_t)count;
- (void)dealloc;
- (void)enumerateObjects:(id)a3;
- (void)insertObject:(id)a3;
- (void)removeAllObjects;
- (void)removeMinimumObject;
@end

@implementation REPriorityQueue

- (REPriorityQueue)initWithComparator:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REPriorityQueue;
  v5 = [(REPriorityQueue *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id comparator = v5->_comparator;
    v5->_id comparator = (id)v6;

    id v8 = v5->_comparator;
    compareContext.version = 0;
    compareContext.info = v8;
    compareContext.retain = (const void *(__cdecl *)(const void *))REPriorityQueueRetain;
    compareContext.release = REPriorityQueueRelease;
    compareContext.copyDescription = (CFStringRef (__cdecl *)(const void *))REPriorityQueueCopyDescription;
    v5->_binaryHeap = CFBinaryHeapCreate(0, 0, &kREPriorityQueueCallbacks, &compareContext);
  }

  return v5;
}

- (unint64_t)count
{
  return CFBinaryHeapGetCount(self->_binaryHeap);
}

- (id)minimumObject
{
  v3 = [(REPriorityQueue *)self count];
  if (v3)
  {
    v3 = CFBinaryHeapGetMinimum(self->_binaryHeap);
  }
  return v3;
}

- (REPriorityQueue)init
{
  return [(REPriorityQueue *)self initWithComparator:&__block_literal_global_78];
}

uint64_t __23__REPriorityQueue_init__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (REPriorityQueue *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(REPriorityQueue *)self count];
      if (v6 == [(REPriorityQueue *)v5 count])
      {
        uint64_t v12 = 0;
        v13 = &v12;
        uint64_t v14 = 0x2020000000;
        char v15 = 1;
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __27__REPriorityQueue_isEqual___block_invoke;
        v9[3] = &unk_2644C01F8;
        objc_super v11 = &v12;
        v10 = v5;
        [(REPriorityQueue *)self enumerateObjects:v9];
        BOOL v7 = *((unsigned char *)v13 + 24) != 0;

        _Block_object_dispose(&v12, 8);
      }
      else
      {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

uint64_t __27__REPriorityQueue_isEqual___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    uint64_t result = [*(id *)(a1 + 32) containsObject:a2];
    uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  else
  {
    uint64_t result = 0;
  }
  *(unsigned char *)(v2 + 24) = result;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[REPriorityQueue allocWithZone:a3] initWithComparator:self->_comparator];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__REPriorityQueue_copyWithZone___block_invoke;
  v7[3] = &unk_2644BCC60;
  v5 = v4;
  id v8 = v5;
  [(REPriorityQueue *)self enumerateObjects:v7];

  return v5;
}

uint64_t __32__REPriorityQueue_copyWithZone___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) insertObject:a2];
}

- (void)dealloc
{
  CFRelease(self->_binaryHeap);
  v3.receiver = self;
  v3.super_class = (Class)REPriorityQueue;
  [(REPriorityQueue *)&v3 dealloc];
}

- (id)description
{
  uint64_t v2 = (__CFString *)CFCopyDescription(self->_binaryHeap);
  return v2;
}

- (NSArray)allObjects
{
  objc_super v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[REPriorityQueue count](self, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__REPriorityQueue_allObjects__block_invoke;
  v7[3] = &unk_2644BCC60;
  id v8 = v3;
  id v4 = v3;
  [(REPriorityQueue *)self enumerateObjects:v7];
  v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

uint64_t __29__REPriorityQueue_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)insertObject:(id)a3
{
}

- (void)removeAllObjects
{
}

- (void)removeMinimumObject
{
}

- (BOOL)containsObject:(id)a3
{
  return CFBinaryHeapContainsValue(self->_binaryHeap, a3) != 0;
}

- (void)enumerateObjects:(id)a3
{
}

- (id)comparator
{
  return self->_comparator;
}

- (void).cxx_destruct
{
}

@end