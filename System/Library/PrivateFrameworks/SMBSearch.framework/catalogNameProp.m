@interface catalogNameProp
- (catalogNameProp)initWithCatName:(id)a3 UseExtBTypes:(BOOL)a4;
- (cbaseVariant)variant;
- (cdbProp)cProps;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (unsigned)propertyID;
- (void)setCProps:(id)a3;
- (void)setVariant:(id)a3;
@end

@implementation catalogNameProp

- (catalogNameProp)initWithCatName:(id)a3 UseExtBTypes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v46.receiver = self;
  v46.super_class = (Class)catalogNameProp;
  v7 = [(catalogNameProp *)&v46 init];
  if (v7)
  {
    v8 = objc_alloc_init(cbaseVariant);
    variant = v7->_variant;
    v7->_variant = v8;

    v10 = v7->_variant;
    if (!v10)
    {
      BOOL v19 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v19) {
        -[catalogNameProp initWithCatName:UseExtBTypes:](v19, v20, v21, v22, v23, v24, v25, v26);
      }
      goto LABEL_15;
    }
    if (v4)
    {
      if ([(cbaseVariant *)v10 setStringType:31 UTF8Str:v6])
      {
        BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
        if (v11) {
          -[catalogNameProp initWithCatName:UseExtBTypes:](v11, v12, v13, v14, v15, v16, v17, v18);
        }
LABEL_15:

        v7 = 0;
        goto LABEL_16;
      }
    }
    else if ([(cbaseVariant *)v10 setStringType:8 UTF8Str:v6])
    {
      BOOL v27 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v27) {
        -[catalogNameProp initWithCatName:UseExtBTypes:].cold.4(v27, v28, v29, v30, v31, v32, v33, v34);
      }
      goto LABEL_15;
    }
    v35 = [[cdbProp alloc] initWithPropID:2];
    cProps = v7->_cProps;
    v7->_cProps = v35;

    if (!v7->_cProps)
    {
      BOOL v37 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v37) {
        -[catalogNameProp initWithCatName:UseExtBTypes:](v37, v38, v39, v40, v41, v42, v43, v44);
      }
      goto LABEL_15;
    }
  }
LABEL_16:

  return v7;
}

- (unsigned)propertyID
{
  v2 = [(catalogNameProp *)self cProps];
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
      -[catalogNameProp encodeBuffer:BufferOffset:BytesWritten:]();
    }
    int v11 = 12;
  }
  else
  {
    id v9 = v8;
    [v9 bytes];
    v10 = [(catalogNameProp *)self cProps];
    int v11 = [v10 encodeBuffer:v9 BufferOffset:v6 BytesWritten:&v16];

    if (v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[catalogNameProp encodeBuffer:BufferOffset:BytesWritten:]();
      }
    }
    else
    {
      int v13 = v16;
      uint64_t v14 = (v16 + v6);
      uint64_t v15 = [(catalogNameProp *)self variant];
      int v11 = [v15 encodeBuffer:v9 BufferOffset:v14 BytesWritten:&v16];

      if (v11)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[catalogNameProp encodeBuffer:BufferOffset:BytesWritten:]();
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

- (void)initWithCatName:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCatName:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCatName:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCatName:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "catalogNameProp:encodeBuffer: encode variant error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "catalogNameProp:encodeBuffer: encode cProps error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "catalogNameProp:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end