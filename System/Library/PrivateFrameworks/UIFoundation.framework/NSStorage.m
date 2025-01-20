@interface NSStorage
+ (void)initialize;
- (NSStorage)init;
- (NSStorage)initWithElementSize:(unint64_t)a3 capacity:(unint64_t)a4;
- (id)description;
- (unint64_t)capacity;
- (unint64_t)count;
- (unint64_t)elementSize;
- (unint64_t)hintCapacity;
- (void)addElement:(void *)a3;
- (void)dealloc;
- (void)elementAtIndex:(unint64_t)a3;
- (void)enumerateElementsUsingBlock:(id)a3;
- (void)insertElement:(void *)a3 atIndex:(unint64_t)a4;
- (void)insertElements:(void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)pointerToElement:(unint64_t)a3 directlyAccessibleElements:(_NSRange *)a4;
- (void)removeElementAtIndex:(unint64_t)a3;
- (void)removeElementsInRange:(_NSRange)a3;
- (void)replaceElementAtIndex:(unint64_t)a3 withElement:(void *)a4;
- (void)setHintCapacity:(unint64_t)a3;
@end

@implementation NSStorage

- (void)pointerToElement:(unint64_t)a3 directlyAccessibleElements:(_NSRange *)a4
{
  return (void *)CFStorageGetValueAtIndex();
}

- (void)insertElements:(void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  CFStorageInsertValues();
  if (a3)
  {
    id storage = self->_storage;
    MEMORY[0x1F40D8330](storage, a5, a4, a3);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)NSStorage;
  [(NSStorage *)&v3 dealloc];
}

- (NSStorage)initWithElementSize:(unint64_t)a3 capacity:(unint64_t)a4
{
  v6.receiver = self;
  v6.super_class = (Class)NSStorage;
  v4 = [(NSStorage *)&v6 init];
  v4->_id storage = (id)CFStorageCreate();
  return v4;
}

- (unint64_t)count
{
  return CFStorageGetCount();
}

- (void)removeElementsInRange:(_NSRange)a3
{
}

- (void)elementAtIndex:(unint64_t)a3
{
  return (void *)CFStorageGetValueAtIndex();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

- (NSStorage)init
{
  return [(NSStorage *)self initWithElementSize:8 capacity:0];
}

- (unint64_t)capacity
{
  return MEMORY[0x1F40D95C0](self->_storage, a2);
}

- (void)setHintCapacity:(unint64_t)a3
{
  self->_hintCapacity = a3;
}

- (unint64_t)hintCapacity
{
  return self->_hintCapacity;
}

- (unint64_t)elementSize
{
  return MEMORY[0x1F40D95C8](self->_storage, a2);
}

- (void)removeElementAtIndex:(unint64_t)a3
{
}

- (void)replaceElementAtIndex:(unint64_t)a3 withElement:(void *)a4
{
}

- (void)insertElement:(void *)a3 atIndex:(unint64_t)a4
{
}

- (void)addElement:(void *)a3
{
  unint64_t v5 = [(NSStorage *)self count];

  [(NSStorage *)self insertElements:a3 count:1 atIndex:v5];
}

- (id)description
{
  CFStringRef v2 = CFCopyDescription(self->_storage);
  objc_super v3 = (void *)CFMakeCollectable(v2);

  return v3;
}

- (void)enumerateElementsUsingBlock:(id)a3
{
  uint64_t Count = CFStorageGetCount();
  if (Count)
  {
    uint64_t v5 = 0;
    uint64_t v6 = Count - 1;
    do
    {
      char v9 = 0;
      uint64_t ValueAtIndex = CFStorageGetValueAtIndex();
      (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, ValueAtIndex, v5, &v9);
      if (v9) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = v6 == v5;
      }
      ++v5;
    }
    while (!v8);
  }
}

@end