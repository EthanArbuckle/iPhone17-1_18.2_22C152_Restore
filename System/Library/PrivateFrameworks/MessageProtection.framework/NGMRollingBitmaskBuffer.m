@interface NGMRollingBitmaskBuffer
- (BOOL)processIncomingCounter:(unsigned int)a3;
- (NGMRollingBitmaskBuffer)init;
- (NGMRollingBitmaskBuffer)initWithData:(id)a3 upperBufferIndex:(unsigned int)a4;
- (char)valid_values_buffer;
- (id)bufferData;
- (unsigned)upper_buffer_index;
- (unsigned)valid_values_buffer_size;
- (void)dealloc;
- (void)setUpper_buffer_index:(unsigned int)a3;
- (void)setValid_values_buffer:(char *)a3;
- (void)setValid_values_buffer_size:(unsigned int)a3;
@end

@implementation NGMRollingBitmaskBuffer

- (NGMRollingBitmaskBuffer)init
{
  v5.receiver = self;
  v5.super_class = (Class)NGMRollingBitmaskBuffer;
  v2 = [(NGMRollingBitmaskBuffer *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_upper_buffer_index = 0x100000001;
    v2->_valid_values_buffer = (char *)malloc_type_malloc(1uLL, 0xB769003uLL);
    __memset_chk();
  }
  return v3;
}

- (NGMRollingBitmaskBuffer)initWithData:(id)a3 upperBufferIndex:(unsigned int)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NGMRollingBitmaskBuffer;
  v7 = [(NGMRollingBitmaskBuffer *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_upper_buffer_index = a4;
    unsigned int v9 = [v6 length];
    v8->_valid_values_buffer_size = v9;
    v10 = (char *)malloc_type_malloc(v9, 0x280A3EDEuLL);
    v8->_valid_values_buffer = v10;
    memcpy(v10, (const void *)[v6 bytes], v8->_valid_values_buffer_size);
  }

  return v8;
}

- (BOOL)processIncomingCounter:(unsigned int)a3
{
  unsigned int upper_buffer_index = self->_upper_buffer_index;
  unsigned int valid_values_buffer_size = self->_valid_values_buffer_size;
  if (a3 < 8 * (upper_buffer_index - valid_values_buffer_size)) {
    return 0;
  }
  char v6 = a3;
  unsigned int v8 = a3 >> 3;
  if (8 * upper_buffer_index - 1 >= a3)
  {
    v17 = &self->_valid_values_buffer[v8 - (upper_buffer_index - valid_values_buffer_size)];
    unsigned int v18 = *v17;
    char v19 = a3 & 7;
    if (((v18 >> (a3 & 7)) & 1) == 0) {
      return 0;
    }
  }
  else
  {
    unsigned int v9 = v8 + 1;
    unsigned int v10 = v8 + 1 - upper_buffer_index;
    if (valid_values_buffer_size + v10 >= 0x30D4) {
      size_t v11 = 12500;
    }
    else {
      size_t v11 = valid_values_buffer_size + v10;
    }
    unsigned int v12 = 12500 - v10;
    if (valid_values_buffer_size < 12500 - v10) {
      unsigned int v12 = self->_valid_values_buffer_size;
    }
    unsigned int v13 = v10 >> 2;
    if (v13 >= 0xC35) {
      uint64_t v14 = 0;
    }
    else {
      uint64_t v14 = valid_values_buffer_size - v12;
    }
    if (v13 >= 0xC35) {
      size_t v15 = valid_values_buffer_size;
    }
    else {
      size_t v15 = v12;
    }
    v16 = (char *)malloc_type_malloc(v11, 0xB3BCC01EuLL);
    memset(v16, 255, v11);
    memcpy(v16, &self->_valid_values_buffer[v14], v15);
    free(self->_valid_values_buffer);
    self->_valid_values_buffer = v16;
    self->_unsigned int upper_buffer_index = v9;
    self->_unsigned int valid_values_buffer_size = v11;
    v17 = &v16[(v11 - 1)];
    LOBYTE(v18) = *v17;
    char v19 = v6 & 7;
  }
  BOOL result = 1;
  char *v17 = v18 & ~(1 << v19);
  return result;
}

- (id)bufferData
{
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytes:length:", -[NGMRollingBitmaskBuffer valid_values_buffer](self, "valid_values_buffer"), -[NGMRollingBitmaskBuffer valid_values_buffer_size](self, "valid_values_buffer_size"));
  return v2;
}

- (void)dealloc
{
  free([(NGMRollingBitmaskBuffer *)self valid_values_buffer]);
  v3.receiver = self;
  v3.super_class = (Class)NGMRollingBitmaskBuffer;
  [(NGMRollingBitmaskBuffer *)&v3 dealloc];
}

- (unsigned)upper_buffer_index
{
  return self->_upper_buffer_index;
}

- (void)setUpper_buffer_index:(unsigned int)a3
{
  self->_unsigned int upper_buffer_index = a3;
}

- (char)valid_values_buffer
{
  return self->_valid_values_buffer;
}

- (void)setValid_values_buffer:(char *)a3
{
  self->_valid_values_buffer = a3;
}

- (unsigned)valid_values_buffer_size
{
  return self->_valid_values_buffer_size;
}

- (void)setValid_values_buffer_size:(unsigned int)a3
{
  self->_unsigned int valid_values_buffer_size = a3;
}

@end