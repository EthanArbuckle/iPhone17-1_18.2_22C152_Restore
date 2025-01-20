@interface includeScopesProp
- (cbaseVariant)variant;
- (cdbProp)cProps;
- (includeScopesProp)initWithIncludeScopes:(id)a3 UseExtBTypes:(BOOL)a4;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (unsigned)propertyID;
- (void)setCProps:(id)a3;
- (void)setVariant:(id)a3;
@end

@implementation includeScopesProp

- (includeScopesProp)initWithIncludeScopes:(id)a3 UseExtBTypes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v30.receiver = self;
  v30.super_class = (Class)includeScopesProp;
  v7 = [(includeScopesProp *)&v30 init];
  if (v7)
  {
    v8 = objc_alloc_init(cbaseVariant);
    variant = v7->_variant;
    v7->_variant = v8;

    v10 = v7->_variant;
    if (!v10)
    {
      BOOL v11 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v11) {
        -[includeScopesProp initWithIncludeScopes:UseExtBTypes:](v11, v12, v13, v14, v15, v16, v17, v18);
      }
      goto LABEL_15;
    }
    if (v4)
    {
      if ([(cbaseVariant *)v10 setVectorWithType:31 ValueArray:v6])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[includeScopesProp initWithIncludeScopes:UseExtBTypes:]();
        }
LABEL_15:

        v7 = 0;
        goto LABEL_16;
      }
    }
    else if ([(cbaseVariant *)v10 setArrayWithType:8 ValueArray:v6])
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[includeScopesProp initWithIncludeScopes:UseExtBTypes:].cold.4();
      }
      goto LABEL_15;
    }
    v19 = [[cdbProp alloc] initWithPropID:3];
    cProps = v7->_cProps;
    v7->_cProps = v19;

    if (!v7->_cProps)
    {
      BOOL v21 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
      if (v21) {
        -[includeScopesProp initWithIncludeScopes:UseExtBTypes:](v21, v22, v23, v24, v25, v26, v27, v28);
      }
      goto LABEL_15;
    }
  }
LABEL_16:

  return v7;
}

- (unsigned)propertyID
{
  v2 = [(includeScopesProp *)self cProps];
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
      -[includeScopesProp encodeBuffer:BufferOffset:BytesWritten:]();
    }
    int v11 = 12;
  }
  else
  {
    id v9 = v8;
    [v9 bytes];
    v10 = [(includeScopesProp *)self cProps];
    int v11 = [v10 encodeBuffer:v9 BufferOffset:v6 BytesWritten:&v16];

    if (v11)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[includeScopesProp encodeBuffer:BufferOffset:BytesWritten:]();
      }
    }
    else
    {
      int v13 = v16;
      uint64_t v14 = (v16 + v6);
      uint64_t v15 = [(includeScopesProp *)self variant];
      int v11 = [v15 encodeBuffer:v9 BufferOffset:v14 BytesWritten:&v16];

      if (v11)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[includeScopesProp encodeBuffer:BufferOffset:BytesWritten:]();
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

- (void)initWithIncludeScopes:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithIncludeScopes:(uint64_t)a3 UseExtBTypes:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithIncludeScopes:UseExtBTypes:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "includeScopesProp:initWithScopes: setVectorWithType error: %d\n", v1, v2, v3, v4, v5);
}

- (void)initWithIncludeScopes:UseExtBTypes:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "includeScopesProp:initWithScopes: setArrayWithType error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "includeScopesProp:encodeBuffer: encode variant error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "includeScopesProp:encodeBuffer: encode cProps error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "includeScopesProp:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end