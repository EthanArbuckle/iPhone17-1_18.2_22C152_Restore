@interface cdbProp
- (cdbProp)initWithPropID:(unsigned int)a3;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (unsigned)colidEKind;
- (unsigned)colidULID;
- (unsigned)dbPropId;
- (unsigned)dbPropOptions;
- (unsigned)dbPropStatus;
- (void)setColidEKind:(unsigned int)a3;
- (void)setColidULID:(unsigned int)a3;
- (void)setDbPropId:(unsigned int)a3;
- (void)setDbPropOptions:(unsigned int)a3;
- (void)setDbPropStatus:(unsigned int)a3;
- (void)setTimeMidGuid;
@end

@implementation cdbProp

- (cdbProp)initWithPropID:(unsigned int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)cdbProp;
  result = [(cdbProp *)&v5 init];
  if (result)
  {
    *(void *)&result->colidGuid.u1 = 0;
    *(void *)result->colidGuid.u4 = 0;
    result->_dbPropId = a3;
    *(_OWORD *)&result->_dbPropOptions = xmmword_235FADC10;
  }
  return result;
}

- (void)setTimeMidGuid
{
  self->colidGuid = (network_uuid)TimeMidGuid;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  unint64_t v9 = [v8 length];
  uint64_t v10 = v9;
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.8(self, v10, a4);
    }
    goto LABEL_7;
  }
  unint64_t v11 = v9 - a4;
  uint64_t v12 = [v8 bytes];
  if (v11 > 3)
  {
    uint64_t v15 = v12;
    *(_DWORD *)(v12 + a4) = self->_dbPropId;
    if (v11 - 4 > 3)
    {
      *(_DWORD *)(v12 + a4 + 4) = self->_dbPropOptions;
      if (v11 - 8 > 3)
      {
        *(_DWORD *)(v12 + a4 + 8) = self->_dbPropStatus;
        if (v11 - 12 > 3)
        {
          *(_DWORD *)(v12 + a4 + 12) = self->_colidEKind;
          unsigned int v16 = a4 + 16;
          unint64_t v17 = v11 - 16;
          unsigned int v18 = align8Pad(v16);
          if (v18)
          {
            unsigned int v19 = v18;
            if (v17 <= v18)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.7(self);
              }
              goto LABEL_7;
            }
            bzero((void *)(v15 + v16), v18);
            v16 += v19;
            v17 -= v19;
            unsigned int v20 = v19 + 36;
          }
          else
          {
            unsigned int v20 = 36;
          }
          if (v17 > 0xF)
          {
            *(network_uuid *)(v15 + v16) = self->colidGuid;
            if (v17 - 16 > 3)
            {
              int v13 = 0;
              *(_DWORD *)(v15 + v16 + 16) = self->_colidULID;
              *a5 = v20;
              goto LABEL_8;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.6(self);
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.5(self);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          -[cdbProp encodeBuffer:BufferOffset:BytesWritten:].cold.4(self);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        -[cdbProp encodeBuffer:BufferOffset:BytesWritten:](self);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[cdbProp encodeBuffer:BufferOffset:BytesWritten:](self);
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[cdbProp encodeBuffer:BufferOffset:BytesWritten:](self);
  }
LABEL_7:
  int v13 = 12;
LABEL_8:

  return v13;
}

- (unsigned)dbPropId
{
  return self->_dbPropId;
}

- (void)setDbPropId:(unsigned int)a3
{
  self->_dbPropId = a3;
}

- (unsigned)dbPropOptions
{
  return self->_dbPropOptions;
}

- (void)setDbPropOptions:(unsigned int)a3
{
  self->_dbPropOptions = a3;
}

- (unsigned)dbPropStatus
{
  return self->_dbPropStatus;
}

- (void)setDbPropStatus:(unsigned int)a3
{
  self->_dbPropStatus = a3;
}

- (unsigned)colidEKind
{
  return self->_colidEKind;
}

- (void)setColidEKind:(unsigned int)a3
{
  self->_colidEKind = a3;
}

- (unsigned)colidULID
{
  return self->_colidULID;
}

- (void)setColidULID:(unsigned int)a3
{
  self->_colidULID = a3;
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.1(void *a1)
{
  [a1 dbPropId];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cdbProp:encodeBuffer: propId: %u, no buffer space for dbPropId, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  [a1 dbPropId];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cdbProp:encodeBuffer: propId: %u, no buffer space for dbPropOptions, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.3(void *a1)
{
  [a1 dbPropId];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cdbProp:encodeBuffer: propId: %u, no buffer space for dbPropStatus, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.4(void *a1)
{
  [a1 dbPropId];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cdbProp:encodeBuffer: propId: %u, no buffer space for colidEKind, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.5(void *a1)
{
  [a1 dbPropId];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cdbProp:encodeBuffer: propId: %u, no buffer space for colidGuid, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.6(void *a1)
{
  [a1 dbPropId];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cdbProp:encodeBuffer: propId: %u, no buffer space for colidULID, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.7(void *a1)
{
  [a1 dbPropId];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cdbProp:encodeBuffer: propId: %u, no buffer space for paddingGuidAlign, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(uint64_t)a2 BytesWritten:(int)a3 .cold.8(void *a1, uint64_t a2, int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5[0] = 67109632;
  v5[1] = [a1 dbPropId];
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 1024;
  int v9 = a3;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cdbProp:encodeBuffer: propId: %u, no buffer space, bLen: %llu, bOffset: %u\n", (uint8_t *)v5, 0x18u);
}

@end