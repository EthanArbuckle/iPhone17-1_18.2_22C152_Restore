@interface VFXMTLBufferAllocatorSubBuffer
- (VFXMTLBufferAllocatorSubBuffer)initWithPage:(id)a3 allocator:(id)a4;
- (void)dealloc;
@end

@implementation VFXMTLBufferAllocatorSubBuffer

- (VFXMTLBufferAllocatorSubBuffer)initWithPage:(id)a3 allocator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)VFXMTLBufferAllocatorSubBuffer;
  result = [(VFXMTLBufferAllocatorSubBuffer *)&v6 init];
  if (result) {
    result->_parentPage = (VFXFixedSizePage *)a3;
  }
  return result;
}

- (void)dealloc
{
  parentPage = self->_parentPage;
  uint64_t v6 = objc_msgSend_offset(self, a2, v2, v3);
  objc_msgSend_deallocateElementAtOffset_(parentPage, v7, v6, v8);
  v9.receiver = self;
  v9.super_class = (Class)VFXMTLBufferAllocatorSubBuffer;
  [(VFXMTLBuffer *)&v9 dealloc];
}

@end