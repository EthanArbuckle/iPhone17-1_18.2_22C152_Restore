@interface PMCachedBitmapObject
- (PMCachedBitmapObject)initWithBitmap:(const void *)a3;
- (shared_ptr<PCBitmap>)bitmap;
- (void)dealloc;
@end

@implementation PMCachedBitmapObject

- (PMCachedBitmapObject)initWithBitmap:(const void *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PMCachedBitmapObject;
  if ([(PMCachedBitmapObject *)&v4 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  bitmap = self->_bitmap;
  if (bitmap)
  {
    objc_super v4 = (std::__shared_weak_count *)*((void *)bitmap + 1);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    MEMORY[0x1BA9BFBA0](bitmap, 0x20C40A4A59CD2);
  }
  v5.receiver = self;
  v5.super_class = (Class)PMCachedBitmapObject;
  [(PMCachedBitmapObject *)&v5 dealloc];
}

- (shared_ptr<PCBitmap>)bitmap
{
  bitmap = (uint64_t *)self->_bitmap;
  uint64_t v5 = *bitmap;
  uint64_t v4 = bitmap[1];
  void *v2 = v5;
  v2[1] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (PCBitmap *)self;
  return result;
}

@end