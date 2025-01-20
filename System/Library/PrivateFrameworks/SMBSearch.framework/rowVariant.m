@interface rowVariant
- (NSMutableArray)vector;
- (NSString)strValue;
- (int)decodeBuffer:(id)a3 BaseOffset:(unsigned int)a4 RowStart:(unsigned int)a5 ValueOffset:(unsigned int)a6 ValueLen:(unsigned int)a7 Use64bit:(BOOL)a8;
- (int)int4Val;
- (int)utf16StrLen:(id)a3 Offset:(unint64_t)a4 Result:(unsigned int *)a5;
- (rowVariant)init;
- (signed)vType;
- (timespec)timeSpec;
- (unint64_t)uint64Val;
- (unint64_t)vectorCount;
- (unsigned)reserved1;
- (unsigned)reserved2;
- (unsigned)uint4Val;
- (void)setInt4Val:(int)a3;
- (void)setReserved1:(unsigned __int8)a3;
- (void)setReserved2:(unsigned int)a3;
- (void)setStrValue:(id)a3;
- (void)setTimeSpec:(timespec)a3;
- (void)setUint4Val:(unsigned int)a3;
- (void)setUint64Val:(unint64_t)a3;
- (void)setVType:(signed __int16)a3;
- (void)setVector:(id)a3;
- (void)setVectorCount:(unint64_t)a3;
@end

@implementation rowVariant

- (rowVariant)init
{
  v9.receiver = self;
  v9.super_class = (Class)rowVariant;
  v2 = [(rowVariant *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_vType = 0;
    strValue = v2->_strValue;
    v2->_strValue = 0;

    vector = v3->_vector;
    v3->_vector = 0;

    v3->_vectorCount = 0;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = v3->_vector;
    v3->_vector = v6;
  }
  return v3;
}

- (int)decodeBuffer:(id)a3 BaseOffset:(unsigned int)a4 RowStart:(unsigned int)a5 ValueOffset:(unsigned int)a6 ValueLen:(unsigned int)a7 Use64bit:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v66 = *MEMORY[0x263EF8340];
  uint64_t v53 = 0;
  uint64_t v54 = 0;
  unsigned int v55 = 0;
  id v14 = a3;
  uint64_t v15 = [v14 bytes];
  unsigned int v16 = [v14 length];
  unsigned int v17 = v16;
  unsigned int v18 = a6 + a5;
  if (v18 + 2 > v16)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]();
    }
LABEL_4:
    v19 = 0;
    LODWORD(v20) = 55;
    goto LABEL_73;
  }
  unsigned int v51 = a4;
  id v52 = v14;
  self->_vType = *(_WORD *)(v15 + v18);
  p_vType = &self->_vType;
  unsigned int v22 = v18 + 8;
  if (v18 + 8 > v16 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]2();
  }
  LODWORD(v20) = *p_vType;
  if ((int)v20 <= 20)
  {
    if (*p_vType)
    {
      if (v20 != 3 && v20 != 19) {
        goto LABEL_41;
      }
      if (v18 + 12 <= v17)
      {
        unsigned int v26 = *(_DWORD *)(v15 + v22);
        if (v20 == 3)
        {
          self->_int4Val = v26;
          id v14 = v52;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
            -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.4();
          }
        }
        else
        {
          self->_uint4Val = v26;
          id v14 = v52;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
            -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.5();
          }
        }
        goto LABEL_61;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]();
      }
LABEL_70:
      v19 = 0;
LABEL_71:
      LODWORD(v20) = 55;
LABEL_72:
      id v14 = v52;
      goto LABEL_73;
    }
LABEL_50:
    v19 = 0;
    goto LABEL_72;
  }
  if ((int)v20 <= 63)
  {
    if (v20 == 21)
    {
      if (v18 + 16 <= v17)
      {
        LODWORD(v20) = 0;
        v19 = 0;
        self->_uint64Val = *(void *)(v15 + v22);
        goto LABEL_72;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.7();
      }
      goto LABEL_70;
    }
    if (v20 == 31)
    {
      if (v8) {
        int v23 = 8;
      }
      else {
        int v23 = 4;
      }
      unsigned int v24 = v23 + v22;
      if (v23 + v22 > v17)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.8();
        }
        goto LABEL_70;
      }
      __memcpy_chk();
      if (v8)
      {
        id v14 = v52;
        unsigned int v28 = v51;
        if (a7 <= 0x18)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.9();
          }
LABEL_77:
          v19 = 0;
LABEL_44:
          LODWORD(v20) = 22;
          goto LABEL_73;
        }
      }
      else
      {
        id v14 = v52;
        unsigned int v28 = v51;
        if (a7 <= 0x10)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]2();
          }
          goto LABEL_77;
        }
      }
      int v37 = [(rowVariant *)self utf16StrLen:v14 Offset:v54 Result:&v55];
      if (v37)
      {
        LODWORD(v20) = v37;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]1(&v54, v17, v20);
        }
        goto LABEL_62;
      }
      if (v54 + v28 + (unint64_t)v55 > v17)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110144;
          unsigned int v57 = v28;
          __int16 v58 = 2048;
          uint64_t v59 = v54;
          __int16 v60 = 1024;
          unsigned int v61 = v55;
          __int16 v62 = 1024;
          unsigned int v63 = v24;
          __int16 v64 = 1024;
          unsigned int v65 = v17;
          _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "rowVariant: out of buffer for VT_LPWSTR string, baseOffset: %u offSet: 0x%llx, strLen: %u bOffset: %u, bLen: %u\n", buf, 0x24u);
        }
        goto LABEL_4;
      }
      id v45 = [NSString alloc];
      v46 = (NSString *)[v45 initWithBytes:v15 + v54 length:v55 - 2 encoding:2483028224];
      strValue = self->_strValue;
      self->_strValue = v46;

      if (!self->_strValue)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]0();
        }
        v19 = 0;
        LODWORD(v20) = 5;
        goto LABEL_73;
      }
LABEL_61:
      LODWORD(v20) = 0;
LABEL_62:
      v19 = 0;
      goto LABEL_73;
    }
LABEL_41:
    id v14 = v52;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]();
    }
    v19 = 0;
    signed __int16 *p_vType = 0;
    goto LABEL_44;
  }
  if (v20 == 64)
  {
    if (v18 + 16 > v17)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:].cold.6();
      }
      goto LABEL_70;
    }
    unint64_t v27 = *(void *)(v15 + v22);
    self->_uint64Val = v27;
    smb_time_NT2local(v27, &self->_timeSpec.tv_sec);
    LODWORD(v20) = 0;
    goto LABEL_50;
  }
  if (v20 != 4127) {
    goto LABEL_41;
  }
  if (v8)
  {
    if (a7 <= 0x18)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]3();
      }
      goto LABEL_33;
    }
    unsigned int v29 = 8;
    int v30 = -24;
  }
  else
  {
    if (a7 <= 0x10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]1();
    }
    unsigned int v29 = 4;
    int v30 = -16;
  }
  unsigned int v31 = v29 + v22;
  if (v29 + v22 > v17)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]4();
    }
    goto LABEL_70;
  }
  p_vectorCount = &self->_vectorCount;
  v33 = (const void *)(v15 + v22);
  unint64_t v34 = v29;
  unsigned int v35 = v29;
  memcpy(&self->_vectorCount, v33, v29);
  unsigned int v50 = v35;
  if (v31 + v35 > v17)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]5();
    }
    goto LABEL_70;
  }
  unint64_t v20 = v30 + a7;
  __memcpy_chk();
  if (*p_vectorCount)
  {
    v19 = 0;
    unint64_t v38 = 0;
    uint64_t v39 = 0;
    while (1)
    {
      if (v34 + v51 + v39 > v17)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_DWORD *)buf = 67109888;
        unsigned int v57 = v51;
        __int16 v58 = 2048;
        uint64_t v59 = v53;
        __int16 v60 = 1024;
        unsigned int v61 = v50;
        __int16 v62 = 1024;
        unsigned int v63 = v17;
        v48 = &_os_log_internal;
        v49 = "rowVariant: out of buffer for VT_LPWSTR vectorStart, baseOffset: %u, vectOffset: %llu, desiredLen: %u, bLen: %u\n";
LABEL_111:
        _os_log_error_impl(&dword_235F82000, v48, OS_LOG_TYPE_ERROR, v49, buf, 0x1Eu);
        goto LABEL_71;
      }
      __memcpy_chk();
      unint64_t v40 = v20 - v34;
      if (v20 <= v34)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]0();
        }
        goto LABEL_34;
      }
      int v41 = [(rowVariant *)self utf16StrLen:v52 Offset:v51 Result:&v55];
      if (v41)
      {
        LODWORD(v20) = v41;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]9();
        }
        goto LABEL_72;
      }
      if (v51 + (unint64_t)v55 > v17)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_71;
        }
        *(_DWORD *)buf = 67109888;
        unsigned int v57 = v51;
        __int16 v58 = 2048;
        uint64_t v59 = 0;
        __int16 v60 = 1024;
        unsigned int v61 = v55;
        __int16 v62 = 1024;
        unsigned int v63 = v17;
        v48 = &_os_log_internal;
        v49 = "rowVariant: out of buffer for VT_LPWSTR vector, baseOffset: %u, vectStart: %llu, vectLen: %u, bLen: %u\n";
        goto LABEL_111;
      }
      id v42 = [NSString alloc];
      uint64_t v43 = [v42 initWithBytes:v15 length:v55 - 2 encoding:2483028224];

      if (!v43) {
        break;
      }
      v44 = [(rowVariant *)self vector];
      [v44 addObject:v43];

      uint64_t v39 = v53 + v34;
      v53 += v34;
      unint64_t v20 = v40 - v55;
      if (v40 < v55)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]8();
        }
        LODWORD(v20) = 5;
        goto LABEL_117;
      }
      ++v38;
      v19 = (void *)v43;
      if (v38 >= *p_vectorCount) {
        goto LABEL_95;
      }
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]7();
    }
LABEL_33:
    v19 = 0;
LABEL_34:
    LODWORD(v20) = 5;
    goto LABEL_72;
  }
  uint64_t v43 = 0;
LABEL_95:
  if (!v20)
  {
LABEL_117:
    v19 = (void *)v43;
    goto LABEL_72;
  }
  id v14 = v52;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:]6();
  }
  LODWORD(v20) = 0;
  v19 = (void *)v43;
LABEL_73:

  return v20;
}

- (int)utf16StrLen:(id)a3 Offset:(unint64_t)a4 Result:(unsigned int *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 bytes];
  unint64_t v9 = [v7 length];
  if (v9 <= a4)
  {
LABEL_5:
    int v11 = 2;
  }
  else
  {
    uint64_t v10 = 0;
    while (*(_WORD *)(v8 + a4 + v10))
    {
      v10 += 2;
      if (a4 + v10 >= v9) {
        goto LABEL_5;
      }
    }
    int v11 = 0;
    *a5 = v10 + 2;
  }

  return v11;
}

- (signed)vType
{
  return self->_vType;
}

- (void)setVType:(signed __int16)a3
{
  self->_vType = a3;
}

- (unsigned)reserved1
{
  return self->_reserved1;
}

- (void)setReserved1:(unsigned __int8)a3
{
  self->_reserved1 = a3;
}

- (unsigned)reserved2
{
  return self->_reserved2;
}

- (void)setReserved2:(unsigned int)a3
{
  self->_reserved2 = a3;
}

- (unint64_t)uint64Val
{
  return self->_uint64Val;
}

- (void)setUint64Val:(unint64_t)a3
{
  self->_uint64Val = a3;
}

- (timespec)timeSpec
{
  objc_copyStruct(v4, &self->_timeSpec, 16, 1, 0);
  __darwin_time_t v2 = v4[0];
  uint64_t v3 = v4[1];
  result.tv_nsec = v3;
  result.tv_sec = v2;
  return result;
}

- (void)setTimeSpec:(timespec)a3
{
  timespec v3 = a3;
  objc_copyStruct(&self->_timeSpec, &v3, 16, 1, 0);
}

- (unsigned)uint4Val
{
  return self->_uint4Val;
}

- (void)setUint4Val:(unsigned int)a3
{
  self->_uint4Val = a3;
}

- (int)int4Val
{
  return self->_int4Val;
}

- (void)setInt4Val:(int)a3
{
  self->_int4Val = a3;
}

- (NSString)strValue
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStrValue:(id)a3
{
}

- (NSMutableArray)vector
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVector:(id)a3
{
}

- (unint64_t)vectorCount
{
  return self->_vectorCount;
}

- (void)setVectorCount:(unint64_t)a3
{
  self->_vectorCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vector, 0);

  objc_storeStrong((id *)&self->_strValue, 0);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235F82000, &_os_log_internal, v0, "rowVariant: out of buffer for vType, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.2()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(&dword_235F82000, &_os_log_internal, v0, "rowVariant:decodeBuffer: vt_type: 0x%x not supported\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235F82000, &_os_log_internal, v0, "rowVariant: out of buffer for VT_I4 value, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.4()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(&dword_235F82000, &_os_log_internal, v0, "rowVariant: decoded VT_I4: 0x%x\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.5()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(&dword_235F82000, &_os_log_internal, v0, "rowVariant: decoded VT_UI4: 0x%x\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.6()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235F82000, &_os_log_internal, v0, "rowVariant: out of buffer for VT_FILETIME value, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.7()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235F82000, &_os_log_internal, v0, "rowVariant: out of buffer for VT_I8 value, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.8()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235F82000, &_os_log_internal, v0, "rowVariant: out of buffer for VT_LPWSTR offSet field, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.9()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v0, "rowVariant: LPWSTR: valLen: %u less than VALUE_LEN_64bit: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.10()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "rowVariant: failed to decode LPWSTR\n", v0, 2u);
}

- (void)decodeBuffer:(int)a3 BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.11(uint64_t *a1, int a2, int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  int v4 = 134218496;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 1024;
  int v9 = a3;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "rowVariant: LPWSTR: offSet: %llu, bLen: %u, utf16StrLen error: %d", (uint8_t *)&v4, 0x18u);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.12()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v0, "rowVariant: LPWSTR: valLen: %u less than VALUE_LEN_32bit: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.13()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v0, "rowVariant: valLen: %u is <= than VALUE_LEN_64bit: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.14()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235F82000, &_os_log_internal, v0, "rowVariant: out of buffer for VT_LPWSTR vector count field, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.15()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235F82000, &_os_log_internal, v0, "rowVariant: out of buffer for VT_LPWSTR vectorOffset, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.16()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "rowVariant: vectRemain: %llu not zero like it should be\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.17()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "rowVariant: failed to decode LPWSTR Vect at index: %llu\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.18()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  __int16 v5 = 2048;
  uint64_t v6 = v1;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "rowVariant: strLen: %u > vectRemain: %llu, LPWSTR Vect at index: %llu\n", v2, 0x1Cu);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.19()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "rowVariant:decodeBuffer error decoding LPWSTR Vect at index: %llu\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.20()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "rowVariant:decodeBuffer vectRemain way too small: %llu\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.21()
{
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v0, "rowVariant: valLen: %u is <= VALUE_LEN_32bit: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:.cold.22()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_235F82000, &_os_log_internal, v0, "rowVariant: out of buffer for reserved fields, rowStart: %u, bOffset: %u, bLen: %u\n", v1, v2, v3, v4, v5);
}

@end