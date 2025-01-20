@interface cPropertyRestriction
- (cPropertyRestriction)initWithRelop:(unsigned int)a3 Weight:(unsigned int)a4;
- (cbaseVariant)prVal;
- (fullPropSpec)propSpec;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)restrictId;
- (int)restrictionNumber;
- (unsigned)lcid;
- (unsigned)relOp;
- (unsigned)ulType;
- (unsigned)weight;
- (void)setLcid:(unsigned int)a3;
- (void)setPrVal:(id)a3;
- (void)setPropSpec:(id)a3;
- (void)setRelOp:(unsigned int)a3;
- (void)setRestrictId:(int)a3;
- (void)setUlType:(unsigned int)a3;
- (void)setWeight:(unsigned int)a3;
@end

@implementation cPropertyRestriction

- (cPropertyRestriction)initWithRelop:(unsigned int)a3 Weight:(unsigned int)a4
{
  v12.receiver = self;
  v12.super_class = (Class)cPropertyRestriction;
  v6 = [(cPropertyRestriction *)&v12 init];
  v7 = v6;
  if (v6)
  {
    v6->ulType = 5;
    v6->weight = a4;
    v6->_relOp = a3;
    v8 = (void *)MEMORY[0x263EFF960];
    v9 = [MEMORY[0x263EFF960] currentLocale];
    v10 = [v9 localeIdentifier];
    v7->_lcid = [v8 windowsLocaleCodeFromLocaleIdentifier:v10];
  }
  return v7;
}

- (int)restrictionNumber
{
  return 1;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  unsigned int v25 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.8();
    }
    goto LABEL_7;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
LABEL_7:
    int v13 = 12;
    goto LABEL_8;
  }
  uint64_t v15 = v12;
  *(_DWORD *)(v12 + a4) = self->ulType;
  if (v10 - 4 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v12 + a4 + 4) = self->weight;
  if (v10 - 8 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v12 + a4 + 8) = self->_relOp;
  unsigned int v16 = a4 + 12;
  v17 = [(cPropertyRestriction *)self propSpec];
  int v13 = [v17 encodeBuffer:v11 BufferOffset:a4 + 12 BytesWritten:&v25];

  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.7();
    }
  }
  else
  {
    uint64_t v18 = v25;
    uint64_t v19 = v25 + v16;
    v20 = [(cPropertyRestriction *)self prVal];
    int v13 = [v20 encodeBuffer:v11 BufferOffset:v19 BytesWritten:&v25];

    if (!v13)
    {
      int v21 = v18 + v25 + 12;
      unsigned int v22 = v25 + v19;
      unint64_t v23 = v10 - (v18 + v25) - 12;
      unsigned int v24 = align4Pad(v25 + v19);
      if (v24)
      {
        if (v23 < v24)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.5();
          }
          goto LABEL_7;
        }
        v21 += v24;
        v22 += v24;
        v23 -= v24;
      }
      if (v23 > 3)
      {
        int v13 = 0;
        *(_DWORD *)(v15 + v22) = self->_lcid;
        *a5 = v21 + 4;
        goto LABEL_8;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.4();
      }
      goto LABEL_7;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cPropertyRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.6();
    }
  }
LABEL_8:

  return v13;
}

- (int)restrictId
{
  return self->restrictId;
}

- (void)setRestrictId:(int)a3
{
  self->restrictId = a3;
}

- (unsigned)ulType
{
  return self->ulType;
}

- (void)setUlType:(unsigned int)a3
{
  self->ulType = a3;
}

- (unsigned)weight
{
  return self->weight;
}

- (void)setWeight:(unsigned int)a3
{
  self->weight = a3;
}

- (unsigned)relOp
{
  return self->_relOp;
}

- (void)setRelOp:(unsigned int)a3
{
  self->_relOp = a3;
}

- (fullPropSpec)propSpec
{
  return (fullPropSpec *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropSpec:(id)a3
{
}

- (cbaseVariant)prVal
{
  return (cbaseVariant *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPrVal:(id)a3
{
}

- (unsigned)lcid
{
  return self->_lcid;
}

- (void)setLcid:(unsigned int)a3
{
  self->_lcid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prVal, 0);

  objc_storeStrong((id *)&self->_propSpec, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cPropertyRestriction:encodeBuffer: no buffer space for ulType, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cPropertyRestriction:encodeBuffer: no buffer space for weight, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cPropertyRestriction:encodeBuffer: no buffer space for relOp, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cPropertyRestriction:encodeBuffer: no buffer space for LCID, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cPropertyRestriction:encodeBuffer: no buffer space for align LCID, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cPropertyRestriction:encodeBuffer: encode prVal error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.7()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cPropertyRestriction:encodeBuffer: encode propSpec error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "cPropertyRestriction:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end