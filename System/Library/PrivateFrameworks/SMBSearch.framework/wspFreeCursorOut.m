@interface wspFreeCursorOut
- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5;
- (unsigned)cursorsRemaining;
- (void)setCursorsRemaining:(unsigned int)a3;
- (void)setWhdr:(id)a3;
- (wspFreeCursorOut)init;
- (wspHeader)whdr;
@end

@implementation wspFreeCursorOut

- (wspFreeCursorOut)init
{
  v7.receiver = self;
  v7.super_class = (Class)wspFreeCursorOut;
  v2 = [(wspFreeCursorOut *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_cursorsRemaining = 0;
    v4 = objc_alloc_init(wspHeader);
    whdr = v3->_whdr;
    v3->_whdr = v4;

    if (!v3->_whdr)
    {

      return 0;
    }
  }
  return v3;
}

- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v30 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:].cold.5();
    }
    LODWORD(v13) = 12;
  }
  else
  {
    id v10 = v8;
    uint64_t v11 = [v10 bytes];
    v12 = [(wspFreeCursorOut *)self whdr];
    uint64_t v13 = [v12 decodeBuffer:v10 BufferOffset:v6 BytesDecoded:&v30];

    if (v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:].cold.4(v13, v14, v15, v16, v17, v18, v19, v20);
      }
      unsigned int v21 = v30;
      goto LABEL_6;
    }
    uint64_t v23 = v30;
    v24 = [(wspFreeCursorOut *)self whdr];
    int v25 = [v24 msgid];

    if (v25 == 203)
    {
      v26 = [(wspFreeCursorOut *)self whdr];
      int v27 = [v26 status];

      if (v27)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:](self);
        }
        LODWORD(v13) = 0;
      }
      else
      {
        uint64_t v28 = v6;
        unsigned int v29 = v23 + v6;
        if (v9 - v28 - v23 > 3)
        {
          [(wspFreeCursorOut *)self setCursorsRemaining:*(unsigned int *)(v11 + v29)];
          LODWORD(v13) = 0;
          unsigned int v21 = v30 + 4;
LABEL_6:
          *a5 = v21;
          goto LABEL_10;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:]();
        }
        LODWORD(v13) = 55;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspFreeCursorOut decodeBuffer:BufferOffset:BytesDecoded:](self);
      }
      LODWORD(v13) = 5;
    }
  }
LABEL_10:

  return v13;
}

- (wspHeader)whdr
{
  return (wspHeader *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWhdr:(id)a3
{
}

- (unsigned)cursorsRemaining
{
  return self->_cursorsRemaining;
}

- (void)setCursorsRemaining:(unsigned int)a3
{
  self->_cursorsRemaining = a3;
}

- (void).cxx_destruct
{
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspFreeCursorOut:decodeBuffer: out of buffer to decode qStatus, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.2(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 msgid];
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspFreeCursorOut:decodeBuffer: ConnectOut hdr status: 0x%x\n", v3, v4, v5, v6, 0);
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.3(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 msgid];
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspFreeCursorOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v3, v4, v5, v6, 0);
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesDecoded:(uint64_t)a5 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspFreeCursorOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end