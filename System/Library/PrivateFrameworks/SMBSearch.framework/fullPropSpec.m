@interface fullPropSpec
- (fullPropSpec)initWithPropertyNumber:(int)a3;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)propNumber;
- (unsigned)propID;
- (unsigned)ulKind;
- (void)setPropID:(unsigned int)a3;
- (void)setPropNumber:(int)a3;
- (void)setUlKind:(unsigned int)a3;
@end

@implementation fullPropSpec

- (fullPropSpec)initWithPropertyNumber:(int)a3
{
  v15.receiver = self;
  v15.super_class = (Class)fullPropSpec;
  v4 = [(fullPropSpec *)&v15 init];
  v5 = (fullPropSpec *)v4;
  if (v4)
  {
    switch(a3)
    {
      case 0:
        v6 = &QueryGuid;
        goto LABEL_15;
      case 1:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        int v7 = 14;
        goto LABEL_38;
      case 2:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        int v7 = 10;
        goto LABEL_38;
      case 3:
        *(_OWORD *)(v4 + 8) = QueryGuid;
        int v7 = 5;
        goto LABEL_38;
      case 4:
        *(_OWORD *)(v4 + 8) = ShellDetailsGuid;
        int v7 = 24;
        goto LABEL_38;
      case 5:
        *(_OWORD *)(v4 + 8) = ShellDetailsGuid;
        int v7 = 25;
        goto LABEL_38;
      case 6:
        v8 = &ShellDetailsGuid;
        goto LABEL_22;
      case 7:
        v9 = &unknown1_guid;
        goto LABEL_37;
      case 8:
        v6 = &unknown2_guid;
LABEL_15:
        *(_OWORD *)(v4 + 8) = *v6;
        int v7 = 3;
        goto LABEL_38;
      case 9:
        int v10 = 19;
        goto LABEL_18;
      case 10:
        int v10 = 4;
LABEL_18:
        *((_DWORD *)v4 + 8) = v10;
        v11 = &StorageGuid;
        goto LABEL_20;
      case 11:
        *((_DWORD *)v4 + 8) = 100;
        v11 = &unknown3_guid;
LABEL_20:
        *(_OWORD *)(v4 + 8) = *v11;
        goto LABEL_39;
      case 12:
        v8 = &StorageGuid;
LABEL_22:
        *(_OWORD *)(v4 + 8) = *v8;
        int v7 = 11;
        goto LABEL_38;
      case 13:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        int v7 = 13;
        goto LABEL_38;
      case 14:
        v12 = &StorageGuid;
        goto LABEL_32;
      case 15:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        int v7 = 16;
        goto LABEL_38;
      case 16:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        int v7 = 12;
        goto LABEL_38;
      case 17:
        v13 = &shell_sfgao_flags_strings_guid;
        goto LABEL_29;
      case 18:
        v13 = &shell_omit_from_view_guid;
LABEL_29:
        *(_OWORD *)(v4 + 8) = *v13;
        int v7 = 2;
        goto LABEL_38;
      case 19:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        int v7 = 22;
        goto LABEL_38;
      case 20:
        v12 = &QueryGuid;
LABEL_32:
        *(_OWORD *)(v4 + 8) = *v12;
        int v7 = 15;
        goto LABEL_38;
      case 21:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        int v7 = 18;
        goto LABEL_38;
      case 22:
        *(_OWORD *)(v4 + 8) = StorageGuid;
        int v7 = 21;
        goto LABEL_38;
      case 23:
        v9 = &SystemFilenameGuid;
        goto LABEL_37;
      case 24:
        v9 = &SystemFileExtensionGuid;
LABEL_37:
        *(_OWORD *)(v4 + 8) = *v9;
        int v7 = 100;
LABEL_38:
        *((_DWORD *)v4 + 8) = v7;
LABEL_39:
        *((_DWORD *)v4 + 6) = a3;
        *((_DWORD *)v4 + 7) = 1;
        break;
      default:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[fullPropSpec initWithPropertyNumber:](a3);
        }

        v5 = 0;
        break;
    }
  }
  return v5;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  unint64_t v9 = [v8 length];
  uint64_t v10 = v9;
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:].cold.5(self, v10, a4);
    }
  }
  else
  {
    unint64_t v11 = v9 - a4;
    uint64_t v12 = [v8 bytes];
    unsigned int v13 = align8Pad(a4);
    if (v13 && v11 < v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:](self);
      }
    }
    else
    {
      unint64_t v14 = v11 - v13;
      if (v14 > 0xF)
      {
        unsigned int v15 = v13 + a4;
        *(network_uuid *)(v12 + v13 + a4) = self->propGuid;
        if (v14 - 16 > 3)
        {
          *(_DWORD *)(v12 + v15 + 16) = self->_ulKind;
          *a5 = v13 + 20;
          if (v14 - 20 > 3)
          {
            int v16 = 0;
            *(_DWORD *)(v12 + v15 + 20) = self->_propID;
            *a5 = v13 + 24;
            goto LABEL_18;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:].cold.4(self);
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:](self);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        -[fullPropSpec encodeBuffer:BufferOffset:BytesWritten:](self);
      }
    }
  }
  int v16 = 12;
LABEL_18:

  return v16;
}

- (int)propNumber
{
  return self->_propNumber;
}

- (void)setPropNumber:(int)a3
{
  self->_propNumber = a3;
}

- (unsigned)ulKind
{
  return self->_ulKind;
}

- (void)setUlKind:(unsigned int)a3
{
  self->_ulKind = a3;
}

- (unsigned)propID
{
  return self->_propID;
}

- (void)setPropID:(unsigned int)a3
{
  self->_propID = a3;
}

- (void)initWithPropertyNumber:(int)a1 .cold.1(int a1)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "fullPropSpec:initWithPropertyNumber: propNum: %u not supported\n", (uint8_t *)v1, 8u);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.1(void *a1)
{
  [a1 propNumber];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space for guid align, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  [a1 propNumber];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space for guid, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.3(void *a1)
{
  [a1 propNumber];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space for ulType, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.4(void *a1)
{
  [a1 propNumber];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space for PrSpec, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:(uint64_t)a2 BytesWritten:(int)a3 .cold.5(void *a1, uint64_t a2, int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v5[0] = 67109632;
  v5[1] = [a1 propNumber];
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 1024;
  int v9 = a3;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "fullPropSpec:encodeBuffer: propNum: %u, no buffer space, bLen: %llu, bOffset: %u\n", (uint8_t *)v5, 0x18u);
}

@end