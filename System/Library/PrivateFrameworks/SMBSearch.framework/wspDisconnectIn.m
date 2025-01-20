@interface wspDisconnectIn
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (wspDisconnectIn)init;
@end

@implementation wspDisconnectIn

- (wspDisconnectIn)init
{
  v3.receiver = self;
  v3.super_class = (Class)wspDisconnectIn;
  result = [(wspDisconnectIn *)&v3 init];
  if (result) {
    result->msghdr = ($D892E086A49BFFF1EF9F4B456CBD0A06)xmmword_235FADCB0;
  }
  return result;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspDisconnectIn encodeBuffer:BufferOffset:BytesWritten:]();
    }
  }
  else
  {
    unint64_t v10 = v9 - a4;
    uint64_t v11 = [v8 bytes];
    if (v10 > 0xF)
    {
      int v19 = 0;
      *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v11 + a4) = self->msghdr;
      *a5 = a4 + 16;
      goto LABEL_9;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspDisconnectIn encodeBuffer:BufferOffset:BytesWritten:](v10, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  int v19 = 12;
LABEL_9:

  return v19;
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspDisconnectIn:encodePrimaryQuery: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end