@interface PXGIndexSetArray
- (id)description;
- (int64_t)count;
- (void)dealloc;
- (void)indexSetReferences;
- (void)removeAllIndexes;
- (void)setCount:(int64_t)a3;
@end

@implementation PXGIndexSetArray

- (void)indexSetReferences
{
  return self->_indexSetReferences;
}

- (int64_t)count
{
  return self->_count;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@: %p,", v5, self];

  v7 = self;
  uint64_t v8 = [(PXGIndexSetArray *)v7 indexSetReferences];
  if ([(PXGIndexSetArray *)v7 count] >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      v10 = objc_msgSend(*(id *)(v8 + 8 * v9), "px_shortDescription");
      [v6 appendFormat:@" %li:%@", v9, v10];

      ++v9;
    }
    while (v9 < [(PXGIndexSetArray *)v7 count]);
  }
  [v6 appendString:@">"];

  return v6;
}

- (void)removeAllIndexes
{
  if (self->_count >= 1)
  {
    int64_t v3 = 0;
    do
      [self->_indexSetReferences[v3++] removeAllIndexes];
    while (v3 < self->_count);
  }
}

- (void)setCount:(int64_t)a3
{
  int64_t capacity = self->_capacity;
  if (capacity < a3)
  {
    int64_t v6 = a3;
    if (capacity)
    {
      int64_t v6 = self->_capacity;
      do
        v6 *= 2;
      while (v6 < a3);
    }
    self->_int64_t capacity = v6;
    for (self->_indexSetReferences = (void **)malloc_type_realloc(self->_indexSetReferences, 8 * v6, 0xFA539D40uLL);
          capacity < self->_capacity;
          ++capacity)
    {
      self->_indexSetReferences[capacity] = objc_alloc_init(MEMORY[0x263F089C8]);
    }
  }
  if (self->_count > a3)
  {
    int64_t v7 = a3;
    do
      [self->_indexSetReferences[v7++] removeAllIndexes];
    while (v7 < self->_count);
  }
  self->_count = a3;
}

- (void)dealloc
{
  if (self->_capacity >= 1)
  {
    int64_t v3 = 0;
    do

    while (v3 < self->_capacity);
  }
  indexSetReferences = self->_indexSetReferences;
  if (indexSetReferences) {
    free(indexSetReferences);
  }
  v5.receiver = self;
  v5.super_class = (Class)PXGIndexSetArray;
  [(PXGIndexSetArray *)&v5 dealloc];
}

@end