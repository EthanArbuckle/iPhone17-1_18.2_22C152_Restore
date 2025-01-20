@interface cRestrictionArray
- (BOOL)isPresent;
- (RestrictionProtocol)restriction;
- (cRestrictionArray)init;
- (cRestrictionArray)initWithRestriction:(id)a3;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (void)setRestriction:(id)a3;
@end

@implementation cRestrictionArray

- (cRestrictionArray)init
{
  v6.receiver = self;
  v6.super_class = (Class)cRestrictionArray;
  v2 = [(cRestrictionArray *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->_isPresent = 0;
    restriction = v2->_restriction;
    v2->_restriction = 0;
  }
  return v3;
}

- (cRestrictionArray)initWithRestriction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)cRestrictionArray;
  objc_super v6 = [(cRestrictionArray *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_isPresent = 1;
    objc_storeStrong((id *)&v6->_restriction, a3);
  }

  return v7;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  int v28 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    }
    goto LABEL_12;
  }
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  *(unsigned char *)(v11 + a4) = 1;
  unint64_t v12 = v9 + ~(unint64_t)a4;
  if (!v12)
  {
    BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v15) {
      -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_12;
  }
  *(unsigned char *)(v11 + a4 + 1) = [(cRestrictionArray *)self isPresent];
  if (![(cRestrictionArray *)self isPresent])
  {
    unsigned int v24 = 2;
LABEL_20:
    int v23 = 0;
    *a5 = v24;
    goto LABEL_21;
  }
  uint64_t v13 = a4 + 2;
  unsigned int v14 = align4Pad(v13);
  if (v14)
  {
    if (v12 - 1 < v14)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:]();
      }
LABEL_12:
      int v23 = 12;
      goto LABEL_21;
    }
    int v25 = v14 + 2;
    uint64_t v13 = v14 + v13;
  }
  else
  {
    int v25 = 2;
  }
  v26 = [(cRestrictionArray *)self restriction];
  int v23 = [v26 encodeBuffer:v10 BufferOffset:v13 BytesWritten:&v28];

  if (!v23)
  {
    unsigned int v24 = v28 + v25;
    goto LABEL_20;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[cRestrictionArray encodeBuffer:BufferOffset:BytesWritten:]();
  }
LABEL_21:

  return v23;
}

- (BOOL)isPresent
{
  return self->_isPresent;
}

- (RestrictionProtocol)restriction
{
  return (RestrictionProtocol *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRestriction:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)encodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cRestrictionArray:encodeBuffer: encode cRestriction error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cRestrictionArray:encodeBuffer: no buffer space for align, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "cRestrictionArray:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end