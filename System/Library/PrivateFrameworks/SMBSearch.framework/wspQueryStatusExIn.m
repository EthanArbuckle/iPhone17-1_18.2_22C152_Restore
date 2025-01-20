@interface wspQueryStatusExIn
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (unsigned)bmk;
- (void)setBmk:(unsigned int)a3;
- (void)setWctx:(id)a3;
- (wspContext)wctx;
- (wspQueryStatusExIn)initWithCtx:(id)a3;
@end

@implementation wspQueryStatusExIn

- (wspQueryStatusExIn)initWithCtx:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)wspQueryStatusExIn;
  v6 = [(wspQueryStatusExIn *)&v9 init];
  v7 = (wspQueryStatusExIn *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_235FADC90;
    objc_storeStrong((id *)v6 + 4, a3);
    v7->_bmk = -4;
  }

  return v7;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryStatusExIn encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    }
  }
  else
  {
    unint64_t v10 = v9 - a4;
    uint64_t v11 = [v8 bytes];
    if (v10 > 0xF)
    {
      uint64_t v12 = v11;
      *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v11 + a4) = self->msghdr;
      if (v10 - 16 > 3)
      {
        v13 = [(wspQueryStatusExIn *)self wctx];
        int v14 = [v13 cursor];

        *(_DWORD *)(v12 + a4 + 16) = v14;
        if (v10 - 20 > 3)
        {
          unsigned int v17 = [(wspQueryStatusExIn *)self bmk];
          int v15 = 0;
          *(_DWORD *)(v12 + a4 + 20) = v17;
          *a5 = a4 + 24;
          goto LABEL_14;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspQueryStatusExIn encodeBuffer:BufferOffset:BytesWritten:]();
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        -[wspQueryStatusExIn encodeBuffer:BufferOffset:BytesWritten:]();
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[wspQueryStatusExIn encodeBuffer:BufferOffset:BytesWritten:]();
    }
  }
  int v15 = 12;
LABEL_14:

  return v15;
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWctx:(id)a3
{
}

- (unsigned)bmk
{
  return self->_bmk;
}

- (void)setBmk:(unsigned int)a3
{
  self->_bmk = a3;
}

- (void).cxx_destruct
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExIn:encodeBuffer: no buffer space for WSP header, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExIn:encodeBuffer: no buffer space for hCursor, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExIn:encodeBuffer: no buffer space for bmk, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExIn:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end