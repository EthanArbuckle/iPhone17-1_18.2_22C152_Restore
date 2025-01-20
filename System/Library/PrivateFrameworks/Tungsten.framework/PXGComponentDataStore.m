@interface PXGComponentDataStore
- (BOOL)isEqual:(id)a3;
- (PXGComponentDataStore)init;
- (PXGComponentDataStore)initWithElementSize:(unint64_t)a3;
- (const)contents;
- (id)mutableCopy;
- (int64_t)capacity;
- (unint64_t)byteSize;
- (unint64_t)elementSize;
- (void)dealloc;
- (void)setCapacity:(int64_t)a3;
@end

@implementation PXGComponentDataStore

- (const)contents
{
  return self->_data;
}

- (unint64_t)elementSize
{
  return self->_elementSize;
}

- (unint64_t)byteSize
{
  int64_t v3 = [(PXGComponentDataStore *)self capacity];
  return [(PXGComponentDataStore *)self elementSize] * v3;
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (void)setCapacity:(int64_t)a3
{
  int64_t capacity = self->_capacity;
  if (capacity != a3)
  {
    if (capacity >= a3)
    {
      v12 = [MEMORY[0x263F08690] currentHandler];
      [v12 handleFailureInMethod:a2, self, @"PXGComponentDataStore.m", 42, @"Invalid parameter not satisfying: %@", @"capacity > _capacity" object file lineNumber description];
    }
    unint64_t v6 = [(PXGComponentDataStore *)self elementSize];
    int64_t v7 = self->_capacity * v6;
    int64_t v8 = v6 * a3;
    self->_int64_t capacity = a3;
    v9 = (char *)malloc_type_realloc(self->_data, v6 * a3, 0xFA539D40uLL);
    self->_data = v9;
    v10 = &v9[v7];
    bzero(v10, v8 - v7);
  }
}

- (PXGComponentDataStore)initWithElementSize:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXGComponentDataStore;
  result = [(PXGComponentDataStore *)&v5 init];
  if (result) {
    result->_elementSize = a3;
  }
  return result;
}

- (id)mutableCopy
{
  int64_t v3 = [(PXGComponentDataStore *)[PXGMutableComponentDataStore alloc] initWithElementSize:[(PXGComponentDataStore *)self elementSize]];
  [(PXGMutableComponentDataStore *)v3 setContentsFrom:self];
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 capacity];
    if (v6 == [(PXGComponentDataStore *)self capacity])
    {
      int64_t v7 = self;
      unsigned __int8 v8 = memcmp(-[PXGComponentDataStore contents](v7, "contents"), (const void *)[v5 contents], -[PXGComponentDataStore byteSize](v7, "byteSize")) == 0;
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXGComponentDataStore;
    unsigned __int8 v8 = [(PXGComponentDataStore *)&v10 isEqual:v4];
  }

  return v8;
}

- (void)dealloc
{
  data = self->_data;
  if (data) {
    free(data);
  }
  v4.receiver = self;
  v4.super_class = (Class)PXGComponentDataStore;
  [(PXGComponentDataStore *)&v4 dealloc];
}

- (PXGComponentDataStore)init
{
  objc_super v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGComponentDataStore.m", 27, @"%s is not available as initializer", "-[PXGComponentDataStore init]");

  abort();
}

@end