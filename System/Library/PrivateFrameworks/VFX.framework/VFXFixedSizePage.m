@interface VFXFixedSizePage
- (BOOL)hasFreeElementsLeft;
- (BOOL)isFull;
- (MTLBuffer)buffer;
- (VFXFixedSizePage)initWithBuffer:(id)a3 elementSize:(unint64_t)a4;
- (id)newSubBufferForAllocator:(id)a3;
- (unint64_t)_allocateElement;
- (void)dealloc;
- (void)deallocateElementAtOffset:(unint64_t)a3;
@end

@implementation VFXFixedSizePage

- (VFXFixedSizePage)initWithBuffer:(id)a3 elementSize:(unint64_t)a4
{
  v15.receiver = self;
  v15.super_class = (Class)VFXFixedSizePage;
  v6 = [(VFXFixedSizePage *)&v15 init];
  unint64_t v10 = objc_msgSend_length(a3, v7, v8, v9) / a4;
  v6->_buffer = (MTLBuffer *)a3;
  id v11 = objc_alloc(MEMORY[0x1E4F28E60]);
  uint64_t v13 = objc_msgSend_initWithIndexesInRange_(v11, v12, 0, v10);
  v6->_elementSize = a4;
  v6->_freeIndices = (NSMutableIndexSet *)v13;
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXFixedSizePage;
  [(VFXFixedSizePage *)&v3 dealloc];
}

- (BOOL)isFull
{
  return objc_msgSend_count(self->_freeIndices, a2, v2, v3) == 0;
}

- (BOOL)hasFreeElementsLeft
{
  return objc_msgSend_count(self->_freeIndices, a2, v2, v3) != 0;
}

- (unint64_t)_allocateElement
{
  if (!objc_msgSend_count(self->_freeIndices, a2, v2, v3)) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Internal consistency error – no free index", v6, v7, v8, v9, v10, v11, (uint64_t)"_freeIndices.count > 0");
  }
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend_count(self->_freeIndices, v5, v6, v7))
  {
    uint64_t Index = objc_msgSend_firstIndex(self->_freeIndices, v12, v13, v14);
    if (Index == 0x7FFFFFFFFFFFFFFFLL) {
      sub_1B63F2F54(17, @"Assertion '%s' failed. Internal consistency error – no free index", v17, v18, v19, v20, v21, v22, (uint64_t)"firstFreeIndex != NSNotFound");
    }
    objc_msgSend_removeIndex_(self->_freeIndices, v16, Index, v18);
    return self->_elementSize * Index;
  }
  return v15;
}

- (void)deallocateElementAtOffset:(unint64_t)a3
{
  unint64_t elementSize = self->_elementSize;
  unint64_t v10 = a3 / elementSize;
  if (a3 % elementSize) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. offset should be exactly equal to size", a3, v3, v4, v5, v6, v7, (uint64_t)"(offset % _elementSize) == 0");
  }
  freeIndices = self->_freeIndices;

  objc_msgSend_addIndex_(freeIndices, a2, v10, v3);
}

- (id)newSubBufferForAllocator:(id)a3
{
  uint64_t v5 = [VFXMTLBufferAllocatorSubBuffer alloc];
  uint64_t v7 = objc_msgSend_initWithPage_allocator_(v5, v6, (uint64_t)self, (uint64_t)a3);
  objc_msgSend_setBuffer_(v7, v8, (uint64_t)self->_buffer, v9);
  uint64_t Element = objc_msgSend__allocateElement(self, v10, v11, v12);
  objc_msgSend_setOffset_(v7, v14, Element, v15);
  if (objc_msgSend_offset(v7, v16, v17, v18) == 0x7FFFFFFFFFFFFFFFLL) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. should have some index free", v19, v20, v21, v22, v23, v24, (uint64_t)"mtlBuffer.offset != NSNotFound");
  }
  return v7;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

@end