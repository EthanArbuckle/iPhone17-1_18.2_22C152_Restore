@interface wspSetBindingsIn
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (void)setWctx:(id)a3;
- (wspContext)wctx;
- (wspSetBindingsIn)initWithCtx:(id)a3;
@end

@implementation wspSetBindingsIn

- (wspSetBindingsIn)initWithCtx:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)wspSetBindingsIn;
  v6 = [(wspSetBindingsIn *)&v9 init];
  v7 = (wspSetBindingsIn *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 8) = xmmword_235FADCD0;
    objc_storeStrong((id *)v6 + 3, a3);
  }

  return v7;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned int v57 = 0;
  unint64_t v9 = [v8 length];
  uint64_t v10 = v9;
  if (v9 <= v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]1(v10, v6, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_7;
  }
  unint64_t v11 = v9 - v6;
  id v12 = v8;
  uint64_t v13 = [v12 bytes];
  if (v11 <= 0xF)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:](v11);
    }
LABEL_7:
    int v20 = 12;
    goto LABEL_8;
  }
  uint64_t v22 = v13;
  *($D892E086A49BFFF1EF9F4B456CBD0A06 *)(v13 + v6) = self->msghdr;
  if (v11 - 16 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  v23 = [(wspSetBindingsIn *)self wctx];
  int v24 = [v23 cursor];

  *(_DWORD *)(v22 + (v6 + 16)) = v24;
  if (v11 - 20 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  v52 = a5;
  v25 = [(wspSetBindingsIn *)self wctx];
  v26 = [v25 pidMap];
  int v27 = [v26 rowLength];

  *(_DWORD *)(v22 + (v6 + 20)) = v27;
  if (v11 - 24 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    }
    goto LABEL_7;
  }
  if (v11 - 28 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.5();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v22 + (v6 + 28)) = 0;
  if (v11 - 32 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.6();
    }
    goto LABEL_7;
  }
  v28 = [(wspSetBindingsIn *)self wctx];
  v29 = [v28 pidMap];
  v30 = [v29 colTableArr];
  int v50 = [v30 count];

  *(_DWORD *)(v22 + (v6 + 32)) = v50;
  uint64_t v31 = (v6 + 36);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v32 = [(wspSetBindingsIn *)self wctx];
  v33 = [v32 pidMap];
  v34 = [v33 colTableArr];

  id obj = v34;
  uint64_t v47 = [v34 countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (!v47) {
    goto LABEL_48;
  }
  id v35 = 0;
  v36 = 0;
  unint64_t v37 = v11 - 36;
  uint64_t v48 = *(void *)v54;
  while (2)
  {
    uint64_t v38 = 0;
    v39 = v35;
    v40 = v36;
    do
    {
      if (*(void *)v54 != v48) {
        objc_enumerationMutation(obj);
      }
      id v35 = *(id *)(*((void *)&v53 + 1) + 8 * v38);

      v41 = [v35 propSpec];

      v51 = v41;
      int v42 = [v41 encodeBuffer:v12 BufferOffset:v31 BytesWritten:&v57];
      if (v42)
      {
        int v20 = v42;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]0(v41, v20);
        }
        goto LABEL_78;
      }
      unint64_t v43 = v37 - v57;
      if (v43 <= 3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.7();
        }
        goto LABEL_77;
      }
      unsigned int v44 = v57 + v31;
      *(_DWORD *)(v22 + v44) = [v35 vType];
      if (v43 == 4)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.8();
        }
        goto LABEL_77;
      }
      *(unsigned char *)(v22 + v44 + 4) = [v35 aggregateUsed];
      if (v43 == 5)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:].cold.9();
        }
        goto LABEL_77;
      }
      *(unsigned char *)(v22 + v44 + 5) = [v35 aggregateType];
      if (v43 == 6)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]0();
        }
        goto LABEL_77;
      }
      *(unsigned char *)(v22 + v44 + 6) = [v35 valueUsed];
      if (v43 == 7)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]1();
        }
        goto LABEL_77;
      }
      *(unsigned char *)(v22 + v44 + 7) = 0;
      if (v43 - 8 <= 1)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]2();
        }
        goto LABEL_77;
      }
      *(_WORD *)(v22 + v44 + 8) = [v35 valueOffset];
      if (v43 - 10 <= 1)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]3();
        }
        goto LABEL_77;
      }
      *(_WORD *)(v22 + v44 + 10) = [v35 valueSize];
      if (v43 == 12)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]4();
        }
        goto LABEL_77;
      }
      *(unsigned char *)(v22 + v44 + 12) = [v35 statusUsed];
      if (v43 == 13)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]5();
        }
        goto LABEL_77;
      }
      *(unsigned char *)(v22 + v44 + 13) = 0;
      if (v43 - 14 <= 1)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]6();
        }
        goto LABEL_77;
      }
      *(_WORD *)(v22 + v44 + 14) = [v35 statusOffset];
      if (v43 == 16)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]7();
        }
        goto LABEL_77;
      }
      int v45 = [v35 lengthUsed];
      *(unsigned char *)(v22 + v44 + 16) = v45;
      uint64_t v31 = v44 + 17;
      unint64_t v37 = v43 - 17;
      if (!v45) {
        goto LABEL_45;
      }
      if (v43 == 17)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]8();
        }
LABEL_77:
        int v20 = 12;
LABEL_78:

        goto LABEL_8;
      }
      *(unsigned char *)(v22 + v31) = 0;
      if (v43 - 18 <= 1)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspSetBindingsIn encodeBuffer:BufferOffset:BytesWritten:]9();
        }
        goto LABEL_77;
      }
      *(_WORD *)(v22 + v44 + 18) = [v35 lengthOffset];
      uint64_t v31 = v44 + 20;
      unint64_t v37 = v43 - 20;
LABEL_45:
      ++v38;
      v39 = v35;
      v40 = v51;
    }
    while (v47 != v38);
    uint64_t v46 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    v36 = v51;
    uint64_t v47 = v46;
    if (v46) {
      continue;
    }
    break;
  }

LABEL_48:
  *(_DWORD *)(v22 + (v6 + 24)) = v31 - 32;
  int v20 = 0;
  *(_DWORD *)(v22 + 8) = getChecksum32(208, (int *)(v22 + 16), (int)v31 - 16);
  unsigned int *v52 = v31 + 3;
LABEL_8:

  return v20;
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
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "wspSetBindingsIn:encodeBuffer: no buffer space for WSP header, sizeAvail: %llu\n", (uint8_t *)&v1, 0xCu);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for hCursor, size: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for cbRow field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for cBindingDesc field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for dummy field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for cColumns field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.7()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for vType field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.8()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for AggregateUsed field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.9()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for AggregateType field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.10()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for ValueUsed field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.11()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for _padding field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.12()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for ValueOffset field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.13()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for ValuesSize field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.14()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for StatusUsed field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.15()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for padding2 field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.16()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for StatusOffset field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.17()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for LengthUsed field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.18()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for padding3 field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.19()
{
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspSetBindingsIn:encodeBuffer: no buffer space for LengthOffset field: %u, sizeAvail: %llu\n", v1, v2, v3, v4, 0);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(int)a2 BytesWritten:.cold.20(void *a1, int a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109376;
  v3[1] = [a1 propID];
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "wspSetBindingsIn:encodeBuffer: PropSpecId: %u, encodeBuffer error: %d\n", (uint8_t *)v3, 0xEu);
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end