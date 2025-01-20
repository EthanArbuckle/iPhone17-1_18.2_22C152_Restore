@interface cNodeRestriction
- (NSMutableArray)restrictArray;
- (cNodeRestriction)initWithType:(unsigned int)a3 Weight:(unsigned int)a4;
- (int)appendRestriction:(id)a3;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)restrictId;
- (int)restrictionNumber;
- (unsigned)nodeCount;
- (unsigned)ulType;
- (unsigned)weight;
- (void)setRestrictArray:(id)a3;
- (void)setRestrictId:(int)a3;
- (void)setUlType:(unsigned int)a3;
- (void)setWeight:(unsigned int)a3;
@end

@implementation cNodeRestriction

- (cNodeRestriction)initWithType:(unsigned int)a3 Weight:(unsigned int)a4
{
  v11.receiver = self;
  v11.super_class = (Class)cNodeRestriction;
  v6 = [(cNodeRestriction *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->restrictId = 0;
    v6->ulType = a3;
    v6->weight = a4;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    restrictArray = v7->_restrictArray;
    v7->_restrictArray = v8;

    if (!v7->_restrictArray)
    {

      return 0;
    }
  }
  return v7;
}

- (int)restrictionNumber
{
  return 0;
}

- (unsigned)nodeCount
{
  v2 = [(cNodeRestriction *)self restrictArray];
  unsigned int v3 = [v2 count];

  return v3;
}

- (int)appendRestriction:(id)a3
{
  id v4 = a3;
  v5 = [(cNodeRestriction *)self restrictArray];
  [v5 addObject:v4];

  return 0;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned int v34 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.6();
    }
    goto LABEL_7;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
LABEL_7:
    int v13 = 12;
    goto LABEL_8;
  }
  uint64_t v15 = v12;
  *(_DWORD *)(v12 + a4) = [(cNodeRestriction *)self ulType];
  if (v10 - 4 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v15 + a4 + 4) = self->weight;
  if (v10 - 8 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  v27 = a5;
  v16 = [(cNodeRestriction *)self restrictArray];
  int v17 = [v16 count];

  *(_DWORD *)(v15 + a4 + 8) = v17;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(cNodeRestriction *)self restrictArray];
  uint64_t v18 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (!v18)
  {
    int v23 = 12;
    goto LABEL_31;
  }
  uint64_t v19 = v18;
  id v20 = 0;
  unint64_t v21 = v10 - 12;
  uint64_t v22 = a4 + 12;
  uint64_t v29 = *(void *)v31;
  LOBYTE(v13) = 1;
  int v23 = 12;
  while (2)
  {
    uint64_t v24 = 0;
    v25 = v20;
    do
    {
      if (*(void *)v31 != v29) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(id *)(*((void *)&v30 + 1) + 8 * v24);

      if ((v13 & 1) == 0)
      {
        unsigned int v26 = align4Pad(v22);
        if (v26)
        {
          if (v21 < v26)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.5();
            }
            int v13 = 12;
            goto LABEL_35;
          }
          v23 += v26;
          uint64_t v22 = v26 + v22;
          v21 -= v26;
        }
      }
      int v13 = [v20 encodeBuffer:v11 BufferOffset:v22 BytesWritten:&v34];
      if (v13)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[cNodeRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.4();
        }
LABEL_35:

        goto LABEL_8;
      }
      v23 += v34;
      uint64_t v22 = v34 + v22;
      v21 -= v34;
      ++v24;
      v25 = v20;
    }
    while (v19 != v24);
    uint64_t v19 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    LOBYTE(v13) = 0;
    if (v19) {
      continue;
    }
    break;
  }

LABEL_31:
  int v13 = 0;
  unsigned int *v27 = v23;
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

- (NSMutableArray)restrictArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRestrictArray:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cNodeRestriction:encodeBuffer: no buffer space for ulType, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cNodeRestriction:encodeBuffer: no buffer space for weight, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cNodeRestriction:encodeBuffer: no buffer space for count, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cNodeRestriction:encodeBuffer: encode cRestriction obj error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cNodeRestriction:encodeBuffer: no space for align4, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "cNodeRestriction:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end