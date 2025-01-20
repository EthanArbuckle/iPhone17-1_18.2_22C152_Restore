@interface PXCArrayStore
- (PXCArrayStore)init;
- (PXCArrayStore)initWithElementSize:(unint64_t)a3;
- (void)_sharedArrayWithElementsCount:(unint64_t)a3;
- (void)accessArrayWithElementsCount:(unint64_t)a3 accessBlock:(id)a4;
- (void)dealloc;
@end

@implementation PXCArrayStore

- (void)_sharedArrayWithElementsCount:(unint64_t)a3
{
  unint64_t sharedArrayCapacity = self->_sharedArrayCapacity;
  if (sharedArrayCapacity >= a3) {
    return self->_sharedArray;
  }
  if (!sharedArrayCapacity)
  {
    unint64_t sharedArrayCapacity = 8;
    self->_unint64_t sharedArrayCapacity = 8;
  }
  if (sharedArrayCapacity < a3)
  {
    do
      sharedArrayCapacity *= 2;
    while (sharedArrayCapacity < a3);
    self->_unint64_t sharedArrayCapacity = sharedArrayCapacity;
  }
  result = malloc_type_realloc(self->_sharedArray, self->_elementSize * sharedArrayCapacity, 0xBCAF1ADFuLL);
  self->_sharedArray = result;
  return result;
}

- (void)accessArrayWithElementsCount:(unint64_t)a3 accessBlock:(id)a4
{
  v8 = (void (**)(id, void *))a4;
  if ([MEMORY[0x263F08B88] isMainThread] && !self->_isSharedArrayInUse)
  {
    v7 = [(PXCArrayStore *)self _sharedArrayWithElementsCount:a3];
    self->_isSharedArrayInUse = 1;
    v8[2](v8, v7);
    self->_isSharedArrayInUse = 0;
  }
  else
  {
    v6 = malloc_type_calloc(a3, self->_elementSize, 0x3A0784A5uLL);
    v8[2](v8, v6);
    free(v6);
  }
}

- (void)dealloc
{
  free(self->_sharedArray);
  v3.receiver = self;
  v3.super_class = (Class)PXCArrayStore;
  [(PXCArrayStore *)&v3 dealloc];
}

- (PXCArrayStore)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCArrayStore.m", 29, @"%s is not available as initializer", "-[PXCArrayStore init]");

  abort();
}

- (PXCArrayStore)initWithElementSize:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXCArrayStore;
  result = [(PXCArrayStore *)&v5 init];
  if (result) {
    result->_elementSize = a3;
  }
  return result;
}

@end