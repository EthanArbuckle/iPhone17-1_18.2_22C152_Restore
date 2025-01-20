@interface wspHeader
- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5;
- (unsigned)checksum;
- (unsigned)msgid;
- (unsigned)reserved2;
- (unsigned)status;
- (void)setChecksum:(unsigned int)a3;
- (void)setMsgid:(unsigned int)a3;
- (void)setReserved2:(unsigned int)a3;
- (void)setStatus:(unsigned int)a3;
- (wspHeader)init;
@end

@implementation wspHeader

- (wspHeader)init
{
  v3.receiver = self;
  v3.super_class = (Class)wspHeader;
  result = [(wspHeader *)&v3 init];
  if (result)
  {
    *(void *)&result->_msgid = 0;
    *(void *)&result->_checksum = 0;
  }
  return result;
}

- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5
{
  id v8 = a3;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:].cold.5();
    }
    int v12 = 12;
  }
  else
  {
    unint64_t v10 = v9 - a4;
    uint64_t v11 = [v8 bytes];
    if (v10 > 3)
    {
      uint64_t v13 = v11;
      [(wspHeader *)self setMsgid:*(unsigned int *)(v11 + a4)];
      unint64_t v14 = v10 & 0xFFFFFFFFFFFFFFFCLL;
      if (v14 == 4)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:]();
        }
      }
      else
      {
        [(wspHeader *)self setStatus:*(unsigned int *)(v13 + a4 + 4)];
        if (v14 == 8)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:]();
          }
        }
        else
        {
          [(wspHeader *)self setChecksum:*(unsigned int *)(v13 + a4 + 8)];
          unsigned int v15 = a4 + 12;
          if (v14 != 12)
          {
            [(wspHeader *)self setReserved2:*(unsigned int *)(v13 + v15)];
            int v12 = 0;
            *a5 = 16;
            goto LABEL_18;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:].cold.4();
          }
        }
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[wspHeader decodeBuffer:BufferOffset:BytesDecoded:]();
    }
    int v12 = 55;
  }
LABEL_18:

  return v12;
}

- (unsigned)msgid
{
  return self->_msgid;
}

- (void)setMsgid:(unsigned int)a3
{
  self->_msgid = a3;
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned int)a3
{
  self->_status = a3;
}

- (unsigned)checksum
{
  return self->_checksum;
}

- (void)setChecksum:(unsigned int)a3
{
  self->_checksum = a3;
}

- (unsigned)reserved2
{
  return self->_reserved2;
}

- (void)setReserved2:(unsigned int)a3
{
  self->_reserved2 = a3;
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspHeader:decodeBuffer: no buffer space for msgid, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspHeader:decodeBuffer: no buffer space for status, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspHeader:decodeBuffer: no buffer space for checksum, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspHeader:decodeBuffer: no buffer space for reserved2, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspHeader:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end