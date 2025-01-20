@interface VFXMTLBuffer
- (MTLBuffer)buffer;
- (id)dataSource;
- (int64_t)decrementUsedCount;
- (int64_t)usedCount;
- (unint64_t)offset;
- (void)contents;
- (void)dealloc;
- (void)incrementUsedCount;
- (void)setBuffer:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setUsedCount:(int64_t)a3;
@end

@implementation VFXMTLBuffer

- (void)contents
{
  buffer = self->_buffer;
  if (!buffer)
  {
    sub_1B63F2F54(17, @"Assertion '%s' failed. Null argument", v2, v3, v4, v5, v6, v7, (uint64_t)"_buffer");
    buffer = self->_buffer;
  }
  return (void *)(objc_msgSend_contents(buffer, a2, v2, v3) + self->_offset);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)VFXMTLBuffer;
  [(VFXMTLBuffer *)&v3 dealloc];
}

- (void)incrementUsedCount
{
  uint64_t v6 = objc_msgSend_usedCount(self, a2, v2, v3) + 1;

  objc_msgSend_setUsedCount_(self, v5, v6, v7);
}

- (int64_t)decrementUsedCount
{
  uint64_t v5 = objc_msgSend_usedCount(self, a2, v2, v3);
  objc_msgSend_setUsedCount_(self, v6, v5 - 1, v7);

  return objc_msgSend_usedCount(self, v8, v9, v10);
}

- (int64_t)usedCount
{
  return self->_usedCount;
}

- (void)setUsedCount:(int64_t)a3
{
  self->_usedCount = a3;
}

- (MTLBuffer)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (id)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  self->_dataSource = a3;
}

@end