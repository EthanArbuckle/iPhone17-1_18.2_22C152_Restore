@interface queryTypeProp
- (cbaseVariant)variant;
- (cdbProp)cProps;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (queryTypeProp)init;
- (unsigned)propertyID;
- (void)init;
- (void)setCProps:(id)a3;
- (void)setVariant:(id)a3;
@end

@implementation queryTypeProp

- (queryTypeProp)init
{
  v34.receiver = self;
  v34.super_class = (Class)queryTypeProp;
  v2 = [(queryTypeProp *)&v34 init];
  if (v2)
  {
    v3 = objc_alloc_init(cbaseVariant);
    variant = v2->_variant;
    v2->_variant = v3;

    if (v2->_variant)
    {
      uint64_t v5 = [NSNumber numberWithInt:0];
      if (v5)
      {
        v6 = (void *)v5;
        if ([(cbaseVariant *)v2->_variant setScalarType:3 ScalarValue:v5])
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[queryTypeProp init].cold.4();
          }
        }
        else
        {
          v24 = [[cdbProp alloc] initWithPropID:7];
          cProps = v2->_cProps;
          v2->_cProps = v24;

          if (v2->_cProps) {
            goto LABEL_14;
          }
          BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v26) {
            [(queryTypeProp *)v26 init];
          }
        }
        goto LABEL_13;
      }
      BOOL v15 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v15) {
        [(queryTypeProp *)v15 init];
      }
    }
    else
    {
      BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v7) {
        [(queryTypeProp *)v7 init];
      }
    }
    v6 = 0;
LABEL_13:

    v2 = 0;
    goto LABEL_14;
  }
  v6 = 0;
LABEL_14:

  return v2;
}

- (unsigned)propertyID
{
  v2 = [(queryTypeProp *)self cProps];
  unsigned int v3 = [v2 dbPropId];

  return v3;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  int v16 = 0;
  if ([v8 length] <= (unint64_t)v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[queryTypeProp encodeBuffer:BufferOffset:BytesWritten:]();
    }
    int v11 = 12;
  }
  else
  {
    id v9 = v8;
    [v9 bytes];
    uint64_t v10 = [(queryTypeProp *)self cProps];
    int v11 = [v10 encodeBuffer:v9 BufferOffset:v6 BytesWritten:&v16];

    if (v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[queryTypeProp encodeBuffer:BufferOffset:BytesWritten:]();
      }
    }
    else
    {
      int v13 = v16;
      uint64_t v14 = (v16 + v6);
      BOOL v15 = [(queryTypeProp *)self variant];
      int v11 = [v15 encodeBuffer:v9 BufferOffset:v14 BytesWritten:&v16];

      if (v11)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[queryTypeProp encodeBuffer:BufferOffset:BytesWritten:]();
        }
      }
      else
      {
        *a5 = v16 + v13;
      }
    }
  }

  return v11;
}

- (cdbProp)cProps
{
  return (cdbProp *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCProps:(id)a3
{
}

- (cbaseVariant)variant
{
  return (cbaseVariant *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVariant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);

  objc_storeStrong((id *)&self->_cProps, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "queryTypeProp:init: setScalarType error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "queryTypeProp:encodeBuffer: encode variant error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "queryTypeProp:encodeBuffer: encode cProps error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "queryTypeProp:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end