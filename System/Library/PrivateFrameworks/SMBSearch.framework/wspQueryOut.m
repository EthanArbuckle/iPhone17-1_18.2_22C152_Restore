@interface wspQueryOut
- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5;
- (unsigned)cursor;
- (unsigned)trueSequential;
- (unsigned)workID;
- (void)setCursor:(unsigned int)a3;
- (void)setTrueSequential:(unsigned int)a3;
- (void)setWhdr:(id)a3;
- (void)setWorkID:(unsigned int)a3;
- (wspHeader)whdr;
- (wspQueryOut)init;
@end

@implementation wspQueryOut

- (wspQueryOut)init
{
  v6.receiver = self;
  v6.super_class = (Class)wspQueryOut;
  v2 = [(wspQueryOut *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(wspHeader);
    whdr = v2->_whdr;
    v2->_whdr = v3;

    if (v2->_whdr)
    {
      v2->_workID = 0;
      v2->_cursor = 0;
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v26 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.7();
    }
    int v13 = 12;
  }
  else
  {
    id v10 = v8;
    uint64_t v11 = [v10 bytes];
    v12 = [(wspQueryOut *)self whdr];
    int v13 = [v12 decodeBuffer:v10 BufferOffset:v6 BytesDecoded:&v26];

    if (v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.6();
      }
      unsigned int v14 = v26;
      goto LABEL_6;
    }
    uint64_t v16 = v26;
    v17 = [(wspQueryOut *)self whdr];
    int v18 = [v17 msgid];

    if (v18 == 202)
    {
      v19 = [(wspQueryOut *)self whdr];
      int v20 = [v19 status];

      if (!v20)
      {
        uint64_t v21 = v6;
        unsigned int v22 = v16 + v6;
        unint64_t v23 = v9 - v21 - v16;
        if (v23 > 3)
        {
          [(wspQueryOut *)self setTrueSequential:*(unsigned int *)(v11 + v22)];
          v26 += 4;
          unint64_t v24 = v23 & 0xFFFFFFFFFFFFFFFCLL;
          if (v24 == 4)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:]();
            }
          }
          else
          {
            [(wspQueryOut *)self setWorkID:*(unsigned int *)(v11 + v22 + 4)];
            v26 += 4;
            unsigned int v25 = v22 + 8;
            if (v24 != 8)
            {
              [(wspQueryOut *)self setCursor:*(unsigned int *)(v11 + v25)];
              int v13 = 0;
              unsigned int v14 = v26 + 4;
LABEL_6:
              *a5 = v14;
              goto LABEL_10;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:]();
            }
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:]();
        }
        int v13 = 55;
        goto LABEL_10;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.4(self);
      }
      int v13 = 0;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryOut decodeBuffer:BufferOffset:BytesDecoded:].cold.5(self);
      }
      int v13 = 5;
    }
  }
LABEL_10:

  return v13;
}

- (wspHeader)whdr
{
  return (wspHeader *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWhdr:(id)a3
{
}

- (unsigned)trueSequential
{
  return self->_trueSequential;
}

- (void)setTrueSequential:(unsigned int)a3
{
  self->_trueSequential = a3;
}

- (unsigned)workID
{
  return self->_workID;
}

- (void)setWorkID:(unsigned int)a3
{
  self->_workID = a3;
}

- (unsigned)cursor
{
  return self->_cursor;
}

- (void)setCursor:(unsigned int)a3
{
  self->_cursor = a3;
}

- (void).cxx_destruct
{
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryOut:decodeBuffer: out of buffer to decode trueSequential, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryOut:decodeBuffer: out of buffer to decode workID, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryOut:decodeBuffer: out of buffer to decode cursor, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.4(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 msgid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspQueryOut:decodeBuffer: ConnectOut hdr status: 0x%x\n", v3, v4, v5, v6, v7);
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.5(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 msgid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspQueryOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v3, v4, v5, v6, v7);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryOut:decodeBuffer: Failed to decode wsp header, error: %d\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end