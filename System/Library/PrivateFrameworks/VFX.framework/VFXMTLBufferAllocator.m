@interface VFXMTLBufferAllocator
- (VFXMTLBufferAllocator)initWithDevice:(id)a3 fixedSizeElement:(unint64_t)a4 buffersize:(unint64_t)a5 name:(id)a6;
- (id)_newSubBuffer;
- (id)newSubBufferWithBytes:(const void *)a3 length:(unint64_t)a4 renderContext:(id)a5;
- (unint64_t)bufferSize;
- (unint64_t)elementSize;
- (void)dealloc;
@end

@implementation VFXMTLBufferAllocator

- (VFXMTLBufferAllocator)initWithDevice:(id)a3 fixedSizeElement:(unint64_t)a4 buffersize:(unint64_t)a5 name:(id)a6
{
  v21.receiver = self;
  v21.super_class = (Class)VFXMTLBufferAllocator;
  v10 = [(VFXMTLBufferAllocator *)&v21 init];
  v10->_device = (MTLDevice *)a3;
  uint64_t v14 = objc_msgSend_copy(a6, v11, v12, v13);
  unint64_t v15 = (a4 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v16 = a5 / a4;
  if (a4 > a5) {
    unint64_t v16 = 100;
  }
  v10->_elementSize = v15;
  v10->_name = (NSString *)v14;
  v10->_bufferSize = v16 * v15;
  id v17 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v10->_pages = (NSMutableArray *)objc_msgSend_initWithCapacity_(v17, v18, 10, v19);
  v10->_allocatorLock._os_unfair_lock_opaque = 0;
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLBufferAllocator;
  [(VFXMTLBufferAllocator *)&v3 dealloc];
}

- (id)_newSubBuffer
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_allocatorLock = &self->_allocatorLock;
  os_unfair_lock_lock(&self->_allocatorLock);
  if (!objc_msgSend_hasFreeElementsLeft(self->_currentAllocatorPage, v4, v5, v6))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    pages = self->_pages;
    uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(pages, v7, (uint64_t)&v26, (uint64_t)v30, 16);
    if (v10)
    {
      uint64_t v14 = v10;
      uint64_t v15 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(pages);
          }
          id v17 = *(VFXFixedSizePage **)(*((void *)&v26 + 1) + 8 * i);
          if (objc_msgSend_hasFreeElementsLeft(v17, v11, v12, v13))
          {
            self->_currentAllocatorPage = v17;
            uint64_t v23 = objc_msgSend_newSubBufferForAllocator_(v17, v11, (uint64_t)self, v13);
            goto LABEL_13;
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(pages, v11, (uint64_t)&v26, (uint64_t)v30, 16);
        if (v14) {
          continue;
        }
        break;
      }
    }
    v18 = objc_msgSend_newBufferWithLength_options_(self->_device, v11, self->_bufferSize, 32);
    uint64_t v19 = [VFXFixedSizePage alloc];
    self->_currentAllocatorPage = (VFXFixedSizePage *)objc_msgSend_initWithBuffer_elementSize_(v19, v20, (uint64_t)v18, self->_elementSize);

    objc_msgSend_addObject_(self->_pages, v21, (uint64_t)self->_currentAllocatorPage, v22);
  }
  uint64_t v23 = objc_msgSend_newSubBufferForAllocator_(self->_currentAllocatorPage, v7, (uint64_t)self, v8);
LABEL_13:
  v24 = (void *)v23;
  os_unfair_lock_unlock(p_allocatorLock);
  return v24;
}

- (id)newSubBufferWithBytes:(const void *)a3 length:(unint64_t)a4 renderContext:(id)a5
{
  if (self->_elementSize < a4) {
    sub_1B63F2F54(17, @"Assertion '%s' failed. subBuffer size overflow %d > %d", (uint64_t)a3, a4, (uint64_t)a5, v5, v6, v7, (uint64_t)"length <= _elementSize");
  }
  uint64_t v12 = objc_msgSend__newSubBuffer(self, a2, (uint64_t)a3, a4);
  uint64_t v14 = objc_msgSend_newBufferWithBytes_length_options_(self->_device, v13, (uint64_t)a3, a4, 1);
  v18 = (void **)objc_msgSend_resourceBlitEncoder(a5, v15, v16, v17);
  uint64_t v22 = objc_msgSend_buffer(v12, v19, v20, v21);
  uint64_t v26 = objc_msgSend_offset(v12, v23, v24, v25);
  objc_msgSend_copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_(*v18, v27, (uint64_t)v14, 0, v22, v26, a4);

  return v12;
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (unint64_t)elementSize
{
  return self->_elementSize;
}

@end