@interface cRestriction
- (RestrictionProtocol)restrictionObj;
- (cRestriction)initWithType:(unsigned int)a3 Weight:(unsigned int)a4;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)restrictId;
- (unsigned)ulType;
- (unsigned)weight;
- (void)setRestrictId:(int)a3;
- (void)setRestrictionObj:(id)a3;
- (void)setUlType:(unsigned int)a3;
- (void)setWeight:(unsigned int)a3;
@end

@implementation cRestriction

- (cRestriction)initWithType:(unsigned int)a3 Weight:(unsigned int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)cRestriction;
  result = [(cRestriction *)&v7 init];
  if (result)
  {
    result->ulType = a3;
    result->weight = a4;
  }
  return result;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  int v16 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    }
    goto LABEL_10;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
LABEL_10:
    int v13 = 12;
    goto LABEL_11;
  }
  *(_DWORD *)(v12 + a4) = self->ulType;
  if (v10 - 4 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_10;
  }
  *(_DWORD *)(v12 + a4 + 4) = self->weight;
  v15 = [(cRestriction *)self restrictionObj];
  int v13 = [v15 encodeBuffer:v11 BufferOffset:a4 + 8 BytesWritten:&v16];

  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
  }
  else
  {
    *a5 = v16 + 8;
  }
LABEL_11:

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

- (RestrictionProtocol)restrictionObj
{
  return (RestrictionProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRestrictionObj:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cRestriction:encodeBuffer: no buffer space for ulType, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cRestriction:encodeBuffer: no buffer space for weight, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cRestriction:encodeBuffer: encode cRestriction obj error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "cRestriction:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end