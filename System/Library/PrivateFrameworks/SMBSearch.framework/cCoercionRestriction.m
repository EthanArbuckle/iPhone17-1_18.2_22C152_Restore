@interface cCoercionRestriction
- (RestrictionProtocol)restrictionObj;
- (cCoercionRestriction)initWithOp:(int)a3 FValue:(unsigned int)a4 Weight:(unsigned int)a5;
- (int)cop;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)restrictId;
- (int)restrictionNumber;
- (unsigned)fValue;
- (unsigned)ulType;
- (unsigned)weight;
- (void)setCop:(int)a3;
- (void)setFValue:(unsigned int)a3;
- (void)setRestrictId:(int)a3;
- (void)setRestriction:(id)a3;
- (void)setRestrictionObj:(id)a3;
- (void)setUlType:(unsigned int)a3;
- (void)setWeight:(unsigned int)a3;
@end

@implementation cCoercionRestriction

- (cCoercionRestriction)initWithOp:(int)a3 FValue:(unsigned int)a4 Weight:(unsigned int)a5
{
  v12.receiver = self;
  v12.super_class = (Class)cCoercionRestriction;
  v8 = [(cCoercionRestriction *)&v12 init];
  v9 = v8;
  if (v8)
  {
    if ((a3 - 10) <= 2) {
      v8->ulType = a3;
    }
    restrictionObj = v8->_restrictionObj;
    v8->_restrictionObj = 0;

    v9->_fValue = a4;
    v9->weight = a5;
  }
  return v9;
}

- (int)restrictionNumber
{
  return 4;
}

- (void)setRestriction:(id)a3
{
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  int v16 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cCoercionRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.5();
    }
    goto LABEL_13;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cCoercionRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_13;
  }
  *(_DWORD *)(v12 + a4) = self->ulType;
  if (v10 - 4 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  *(_DWORD *)(v12 + a4 + 4) = self->weight;
  if (v10 - 8 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
LABEL_12:
    }
      -[cCoercionRestriction encodeBuffer:BufferOffset:BytesWritten:]();
LABEL_13:
    int v13 = 12;
    goto LABEL_14;
  }
  *(_DWORD *)(v12 + a4 + 8) = self->_fValue;
  v15 = [(cCoercionRestriction *)self restrictionObj];
  int v13 = [v15 encodeBuffer:v11 BufferOffset:a4 + 12 BytesWritten:&v16];

  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cCoercionRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.4();
    }
  }
  else
  {
    *a5 = v16 + 12;
  }
LABEL_14:

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

- (int)cop
{
  return self->_cop;
}

- (void)setCop:(int)a3
{
  self->_cop = a3;
}

- (unsigned)fValue
{
  return self->_fValue;
}

- (void)setFValue:(unsigned int)a3
{
  self->_fValue = a3;
}

- (RestrictionProtocol)restrictionObj
{
  return (RestrictionProtocol *)objc_getProperty(self, a2, 32, 1);
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
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cCoercionRestriction:encodeBuffer: no buffer space for ulType, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cCoercionRestriction:encodeBuffer: no buffer space for weight, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cCoercionRestriction:encodeBuffer: encode restrictObj error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "cCoercionRestriction:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end