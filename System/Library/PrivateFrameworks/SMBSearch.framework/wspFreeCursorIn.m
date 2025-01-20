@interface wspFreeCursorIn
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (unsigned)cursorToFree;
- (void)setCursorToFree:(unsigned int)a3;
- (wspFreeCursorIn)initWithCursor:(unsigned int)a3;
@end

@implementation wspFreeCursorIn

- (wspFreeCursorIn)initWithCursor:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)wspFreeCursorIn;
  result = [(wspFreeCursorIn *)&v5 init];
  if (result)
  {
    result->msghdr = ($D892E086A49BFFF1EF9F4B456CBD0A06)xmmword_235FADCA0;
    result->_cursorToFree = a3;
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
      -[wspFreeCursorIn encodeBuffer:BufferOffset:BytesWritten:]();
    }
  }
  else
  {
    unint64_t v10 = v9 - a4;
    uint64_t v11 = [v8 bytes];
    if (v10 > 0xF)
    {
      *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v11 + a4) = self->msghdr;
      unint64_t v19 = v10 - 16;
      if (v19 > 3)
      {
        int v27 = 0;
        *(_DWORD *)(v11 + a4 + 16) = self->_cursorToFree;
        *a5 = a4 + 20;
        goto LABEL_11;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspFreeCursorIn encodeBuffer:BufferOffset:BytesWritten:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[wspFreeCursorIn encodeBuffer:BufferOffset:BytesWritten:](v10, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  int v27 = 12;
LABEL_11:

  return v27;
}

- (unsigned)cursorToFree
{
  return self->_cursorToFree;
}

- (void)setCursorToFree:(unsigned int)a3
{
  self->_cursorToFree = a3;
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspFreeCursorIn:encodePrimaryQuery: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end