@interface enableRowSetEventsProp
- (cbaseVariant)variant;
- (cdbProp)cProps;
- (enableRowSetEventsProp)initWithBool:(BOOL)a3;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (unsigned)propertyID;
- (void)setCProps:(id)a3;
- (void)setVariant:(id)a3;
@end

@implementation enableRowSetEventsProp

- (enableRowSetEventsProp)initWithBool:(BOOL)a3
{
  BOOL v3 = a3;
  v36.receiver = self;
  v36.super_class = (Class)enableRowSetEventsProp;
  v4 = [(enableRowSetEventsProp *)&v36 init];
  if (v4)
  {
    v5 = objc_alloc_init(cbaseVariant);
    variant = v4->_variant;
    v4->_variant = v5;

    if (v4->_variant)
    {
      uint64_t v7 = [NSNumber numberWithBool:v3];
      if (v7)
      {
        v8 = (void *)v7;
        if ([(cbaseVariant *)v4->_variant setScalarType:11 ScalarValue:v7])
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[enableRowSetEventsProp initWithBool:].cold.4();
          }
        }
        else
        {
          v26 = [[cdbProp alloc] initWithPropID:16];
          cProps = v4->_cProps;
          v4->_cProps = v26;

          if (v4->_cProps) {
            goto LABEL_14;
          }
          BOOL v28 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v28) {
            -[enableRowSetEventsProp initWithBool:](v28, v29, v30, v31, v32, v33, v34, v35);
          }
        }
        goto LABEL_13;
      }
      BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v17) {
        -[enableRowSetEventsProp initWithBool:](v17, v18, v19, v20, v21, v22, v23, v24);
      }
    }
    else
    {
      BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v9) {
        -[enableRowSetEventsProp initWithBool:](v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
    v8 = 0;
LABEL_13:

    v4 = 0;
    goto LABEL_14;
  }
  v8 = 0;
LABEL_14:

  return v4;
}

- (unsigned)propertyID
{
  v2 = [(enableRowSetEventsProp *)self cProps];
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
      -[enableRowSetEventsProp encodeBuffer:BufferOffset:BytesWritten:]();
    }
    int v11 = 12;
  }
  else
  {
    id v9 = v8;
    [v9 bytes];
    uint64_t v10 = [(enableRowSetEventsProp *)self cProps];
    int v11 = [v10 encodeBuffer:v9 BufferOffset:v6 BytesWritten:&v16];

    if (v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[enableRowSetEventsProp encodeBuffer:BufferOffset:BytesWritten:]();
      }
    }
    else
    {
      int v13 = v16;
      uint64_t v14 = (v16 + v6);
      uint64_t v15 = [(enableRowSetEventsProp *)self variant];
      int v11 = [v15 encodeBuffer:v9 BufferOffset:v14 BytesWritten:&v16];

      if (v11)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[enableRowSetEventsProp encodeBuffer:BufferOffset:BytesWritten:]();
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

- (void)initWithBool:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBool:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBool:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithBool:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "enableRowSetEventsProp:initWithBool: setScalarType error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "enableRowSetEventsProp:encodeBuffer: encode variant error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "enableRowSetEventsProp:encodeBuffer: encode cProps error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "enableRowSetEventsProp:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end