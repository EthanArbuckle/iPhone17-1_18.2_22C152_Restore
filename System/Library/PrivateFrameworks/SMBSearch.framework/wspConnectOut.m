@interface wspConnectOut
- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5;
- (unsigned)serverVersion;
- (void)setServerVersion:(unsigned int)a3;
- (void)setWhdr:(id)a3;
- (wspConnectOut)init;
- (wspHeader)whdr;
@end

@implementation wspConnectOut

- (wspConnectOut)init
{
  v6.receiver = self;
  v6.super_class = (Class)wspConnectOut;
  v2 = [(wspConnectOut *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(wspHeader);
    whdr = v2->_whdr;
    v2->_whdr = v3;

    if (v2->_whdr)
    {
      v2->_serverVersion = 0;
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
  unsigned int v23 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspConnectOut decodeBuffer:BufferOffset:BytesDecoded:].cold.5();
    }
    int v13 = 12;
  }
  else
  {
    id v10 = v8;
    uint64_t v11 = [v10 bytes];
    v12 = [(wspConnectOut *)self whdr];
    int v13 = [v12 decodeBuffer:v10 BufferOffset:v6 BytesDecoded:&v23];

    if (v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspConnectOut decodeBuffer:BufferOffset:BytesDecoded:].cold.4();
      }
      unsigned int v14 = v23;
      goto LABEL_6;
    }
    uint64_t v16 = v23;
    v17 = [(wspConnectOut *)self whdr];
    int v18 = [v17 msgid];

    if (v18 == 200)
    {
      v19 = [(wspConnectOut *)self whdr];
      int v20 = [v19 status];

      if (v20)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspConnectOut decodeBuffer:BufferOffset:BytesDecoded:](self);
        }
        int v13 = 0;
      }
      else
      {
        uint64_t v21 = v6;
        unsigned int v22 = v16 + v6;
        if (v9 - v21 - v16 > 3)
        {
          [(wspConnectOut *)self setServerVersion:*(unsigned int *)(v11 + v22)];
          int v13 = 0;
          unsigned int v14 = v23 + 4;
LABEL_6:
          *a5 = v14;
          goto LABEL_10;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspConnectOut decodeBuffer:BufferOffset:BytesDecoded:]();
        }
        int v13 = 55;
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspConnectOut decodeBuffer:BufferOffset:BytesDecoded:](self);
      }
      int v13 = 5;
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

- (unsigned)serverVersion
{
  return self->_serverVersion;
}

- (void)setServerVersion:(unsigned int)a3
{
  self->_serverVersion = a3;
}

- (void).cxx_destruct
{
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "decodeBuffer:decodeBuffer: no buffer space for ServerVersion, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.2(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 status];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspConnectOut:decodeBuffer: ConnectOut hdr status: 0x%x\n", v3, v4, v5, v6, v7);
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.3(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 msgid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspConnectOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v3, v4, v5, v6, v7);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspConnectOut:decodeBuffer: Failed to decode wsp header, error: %d\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspConnectOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end