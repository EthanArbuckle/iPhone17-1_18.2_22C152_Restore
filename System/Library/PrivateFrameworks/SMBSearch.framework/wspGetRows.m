@interface wspGetRows
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (void)setWctx:(id)a3;
- (wspContext)wctx;
- (wspGetRows)initWithCtx:(id)a3;
@end

@implementation wspGetRows

- (wspGetRows)initWithCtx:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)wspGetRows;
  v6 = [(wspGetRows *)&v9 init];
  v7 = (wspGetRows *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_235FADC50;
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
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:]5();
    }
    goto LABEL_7;
  }
  unint64_t v10 = v9 - a4;
  uint64_t v11 = [v8 bytes];
  if (v10 <= 0xF)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:](v10);
    }
    goto LABEL_7;
  }
  uint64_t v14 = v11;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v11 + a4) = self->msghdr;
  if (v10 - 16 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  v15 = [(wspGetRows *)self wctx];
  int v16 = [v15 cursor];

  *(_DWORD *)(v14 + a4 + 16) = v16;
  if (v10 - 20 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 20) = 32;
  if (v10 - 24 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    }
    goto LABEL_7;
  }
  v17 = [(wspGetRows *)self wctx];
  v18 = [v17 pidMap];
  int v19 = [v18 rowLength];

  *(_DWORD *)(v14 + a4 + 24) = v19;
  if (v10 - 28 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.5();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 28) = 20;
  if (v10 - 32 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.6();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 32) = 40;
  if (v10 - 36 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.7();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 36) = 0x4000;
  if (v10 - 40 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.8();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 40) = 0;
  if (v10 - 44 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:].cold.9();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 44) = 0;
  if (v10 - 48 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:]0();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v14 + a4 + 48) = 2;
  if (v10 - 52 > 3)
  {
    *(_DWORD *)(v14 + a4 + 52) = 0;
    if (v10 - 56 <= 3)
    {
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        goto LABEL_7;
      }
      goto LABEL_38;
    }
    unsigned int v25 = a4 + 52;
    v20 = [(wspGetRows *)self wctx];
    int v21 = [v20 seekBookmarkOffset];

    *(_DWORD *)(v14 + a4 + 56) = v21;
    if (v10 - 60 > 3)
    {
      v22 = [(wspGetRows *)self wctx];
      int v23 = [v22 seekSkip];

      *(_DWORD *)(v14 + a4 + 60) = v23;
      if (v10 - 64 > 3)
      {
        *(_DWORD *)(v14 + a4 + 64) = 0;
        unsigned int v24 = a4 + 68;
        int v12 = 0;
        *(_DWORD *)(v14 + 8) = getChecksum32(204, (int *)(v14 + 16), v25);
        *a5 = v24;
        goto LABEL_8;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:]4();
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:]3();
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
LABEL_38:
    -[wspGetRows encodeBuffer:BufferOffset:BytesWritten:]1();
  }
LABEL_7:
  int v12 = 12;
LABEL_8:

  return v12;
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

- (void)encodeBuffer:(uint64_t)a1 BufferOffset:BytesWritten:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "wspGetRows:encodeBuffer: no buffer space for WSP header, sizeAvail: %llu\n", (uint8_t *)&v1, 0xCu);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for hCursor, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for cbRowsToTransfer, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for cbRowWidth field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for cbSeek, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for cbReserved, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for cbReadBuffer, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for ulClientBase, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for fBwdFetch, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.10()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for eType, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.11()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for chapter, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.13()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for skip, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.14()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space for hregion, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRows:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end