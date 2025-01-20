@interface wspQueryStatusIn
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (void)setWctx:(id)a3;
- (wspContext)wctx;
- (wspQueryStatusIn)initWithCtx:(id)a3;
@end

@implementation wspQueryStatusIn

- (wspQueryStatusIn)initWithCtx:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)wspQueryStatusIn;
  v6 = [(wspQueryStatusIn *)&v9 init];
  v7 = (wspQueryStatusIn *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_235FADC80;
    objc_storeStrong((id *)v6 + 3, a3);
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
      -[wspQueryStatusIn encodeBuffer:BufferOffset:BytesWritten:]();
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
        v15 = [(wspQueryStatusIn *)self wctx];
        int v16 = [v15 cursor];

        int v13 = 0;
        *(_DWORD *)(v12 + a4 + 16) = v16;
        *a5 = a4 + 20;
        goto LABEL_11;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryStatusIn encodeBuffer:BufferOffset:BytesWritten:]();
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[wspQueryStatusIn encodeBuffer:BufferOffset:BytesWritten:]();
    }
  }
  int v13 = 12;
LABEL_11:

  return v13;
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWctx:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusIn:encodeBuffer: no buffer space for WSP header, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusIn:encodeBuffer: no buffer space for hCursor, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusIn:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end