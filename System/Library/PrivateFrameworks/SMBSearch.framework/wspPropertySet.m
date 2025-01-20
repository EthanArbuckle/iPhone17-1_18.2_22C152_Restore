@interface wspPropertySet
- (NSMutableArray)propArr;
- (id)propertyForPropID:(unsigned int)a3;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)propsetID;
- (unint64_t)propertyCount;
- (void)addProperty:(id)a3;
- (void)setPropArr:(id)a3;
- (void)setPropsetID:(int)a3;
- (wspPropertySet)initWithPropSetID:(int)a3;
@end

@implementation wspPropertySet

- (wspPropertySet)initWithPropSetID:(int)a3
{
  v10.receiver = self;
  v10.super_class = (Class)wspPropertySet;
  v4 = [(wspPropertySet *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_propsetID = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    propArr = v5->_propArr;
    v5->_propArr = v6;

    if (v5->_propArr)
    {
      switch(a3)
      {
        case 1:
          v8 = &propset_fscifrmwork_ext_guid;
          goto LABEL_9;
        case 2:
          v8 = &propset_cifrmwrkcore_ext_guid;
          goto LABEL_9;
        case 3:
          v8 = &propset_query_ext_guid;
          goto LABEL_9;
        case 4:
          v8 = &propset_msidxs_rowsetext_guid;
LABEL_9:
          v5->propSetGuid = (network_uuid)*v8;
          break;
        default:
          return v5;
      }
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

- (void)addProperty:(id)a3
{
  id v4 = a3;
  id v5 = [(wspPropertySet *)self propArr];
  [v5 addObject:v4];
}

- (id)propertyForPropID:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(wspPropertySet *)self propArr];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0;
      objc_super v10 = v7;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        id v7 = *(id *)(*((void *)&v13 + 1) + 8 * v9);

        if ([v7 propertyID] == a3)
        {
          id v11 = v7;
          goto LABEL_12;
        }
        ++v9;
        objc_super v10 = v7;
      }
      while (v6 != v9);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

- (unint64_t)propertyCount
{
  v2 = [(wspPropertySet *)self propArr];
  unint64_t v3 = [v2 count];

  return v3;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned int v42 = 0;
  unint64_t v9 = [v8 length];
  uint64_t v10 = v9;
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:].cold.6(self, v10, a4);
    }
    goto LABEL_7;
  }
  unint64_t v11 = v9 - a4;
  id v12 = v8;
  uint64_t v13 = [v12 bytes];
  if (v11 <= 0xF)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:](self);
    }
LABEL_7:
    unsigned int v14 = 12;
    goto LABEL_8;
  }
  uint64_t v16 = v13;
  *(network_uuid *)(v13 + a4) = self->propSetGuid;
  unsigned int v14 = a4 + 16;
  unint64_t v17 = v11 - 16;
  unsigned int v18 = align4Pad(v14);
  if (v18)
  {
    unsigned int v19 = v18;
    if (v17 <= v18)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:].cold.5(self);
      }
      goto LABEL_7;
    }
    uint64_t v36 = v16;
    bzero((void *)(v16 + v14), v18);
    v14 += v19;
    v17 -= v19;
    int v20 = v19 + 20;
  }
  else
  {
    uint64_t v36 = v16;
    int v20 = 20;
  }
  unint64_t v21 = v17 - 4;
  if (v17 <= 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:](self);
    }
    goto LABEL_7;
  }
  v35 = a5;
  v22 = [(wspPropertySet *)self propArr];
  int v23 = [v22 count];

  *(_DWORD *)(v36 + v14) = v23;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = [(wspPropertySet *)self propArr];
  uint64_t v24 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (!v24) {
    goto LABEL_29;
  }
  uint64_t v25 = v24;
  v33 = self;
  id v34 = v8;
  id v26 = 0;
  uint64_t v27 = v14 + 4;
  uint64_t v28 = *(void *)v39;
  LOBYTE(v14) = 1;
  while (2)
  {
    uint64_t v29 = 0;
    v30 = v26;
    do
    {
      if (*(void *)v39 != v28) {
        objc_enumerationMutation(obj);
      }
      id v26 = *(id *)(*((void *)&v38 + 1) + 8 * v29);

      if ((v14 & 1) == 0)
      {
        unsigned int v31 = align4Pad(v27);
        if (v31)
        {
          unsigned int v32 = v31;
          if (v21 <= v31)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:].cold.4(v33);
            }
            unsigned int v14 = 12;
            goto LABEL_37;
          }
          bzero((void *)(v36 + v27), v31);
          v20 += v32;
          uint64_t v27 = v32 + v27;
          v21 -= v32;
        }
      }
      unsigned int v14 = [v26 encodeBuffer:v12 BufferOffset:v27 BytesWritten:&v42];
      if (v14)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspPropertySet encodeBuffer:BufferOffset:BytesWritten:](v33, v26, v14);
        }
LABEL_37:
        id v8 = v34;

        goto LABEL_8;
      }
      v20 += v42;
      uint64_t v27 = v42 + v27;
      v21 -= v42;
      ++v29;
      v30 = v26;
    }
    while (v25 != v29);
    uint64_t v25 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    LOBYTE(v14) = 0;
    if (v25) {
      continue;
    }
    break;
  }

  id v8 = v34;
LABEL_29:

  unsigned int v14 = 0;
  unsigned int *v35 = v20;
LABEL_8:

  return v14;
}

- (int)propsetID
{
  return self->_propsetID;
}

- (void)setPropsetID:(int)a3
{
  self->_propsetID = a3;
}

- (NSMutableArray)propArr
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropArr:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.1(void *a1)
{
  [a1 propsetID];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "wspPropertySet:encodeBuffer: propsetID: %u encodeBuffer: no buffer space for propSetGuid, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  [a1 propsetID];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "wspPropertySet:encodeBuffer: propsetID: %u, no buffer space for cProperties, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(void *)a2 BytesWritten:(int)a3 .cold.3(void *a1, void *a2, int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5[0] = 67109632;
  v5[1] = [a1 propsetID];
  __int16 v6 = 1024;
  int v7 = [a2 propertyID];
  __int16 v8 = 1024;
  int v9 = a3;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "wspPropertySet:encodeBuffer: propsetID: %u, encode propId: %u error: %d\n", (uint8_t *)v5, 0x14u);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.4(void *a1)
{
  [a1 propsetID];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "wspPropertySet:encodeBuffer: propsetID: %u, no buffer space for alignment, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.5(void *a1)
{
  [a1 propsetID];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "wspPropertySet:encodeBuffer: propsetID: %u, no buffer space for _padding field, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(uint64_t)a2 BytesWritten:(int)a3 .cold.6(void *a1, uint64_t a2, int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5[0] = 67109632;
  v5[1] = [a1 propsetID];
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 1024;
  int v9 = a3;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "wspPropertySet: %u encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", (uint8_t *)v5, 0x18u);
}

@end