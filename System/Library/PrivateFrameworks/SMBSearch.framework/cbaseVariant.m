@interface cbaseVariant
- (NSNumber)scalarValue;
- (cbaseVariant)init;
- (int)encodeArray:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)encodeIntArray:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)encodeIntVector:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)encodeStrArray:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)encodeStrVector:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)encodeVector:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)setArrayWithType:(unsigned __int16)a3 ValueArray:(id)a4;
- (int)setIntArrayType:(unsigned int)a3 ValueArray:(id)a4;
- (int)setIntVectorType:(unsigned int)a3 ValueArray:(id)a4;
- (int)setScalarType:(unsigned __int16)a3 ScalarValue:(id)a4;
- (int)setStrArrayType:(unsigned __int16)a3 ValueArray:(id)a4;
- (int)setStrVectorType:(unsigned __int16)a3 ValueArray:(id)a4;
- (int)setStringType:(unsigned __int16)a3 UTF8Str:(id)a4;
- (int)setVectorWithType:(unsigned __int16)a3 ValueArray:(id)a4;
- (unsigned)vData1;
- (unsigned)vData2;
- (unsigned)vType;
- (utf16leData)strData;
- (void)setArrObj:(id)a3;
- (void)setVectObj:(id)a3;
- (vtSafeArray)arrObj;
- (vtVector)vectObj;
@end

@implementation cbaseVariant

- (cbaseVariant)init
{
  v9.receiver = self;
  v9.super_class = (Class)cbaseVariant;
  v2 = [(cbaseVariant *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(_DWORD *)&v2->_vData1 = 0;
    scalarValue = v2->_scalarValue;
    v2->_scalarValue = 0;

    strData = v3->_strData;
    v3->_strData = 0;

    vectObj = v3->_vectObj;
    v3->_vectObj = 0;

    arrObj = v3->_arrObj;
    v3->_arrObj = 0;
  }
  return v3;
}

- (int)setScalarType:(unsigned __int16)a3 ScalarValue:(id)a4
{
  int v5 = a3;
  id v7 = a4;
  if ((v5 - 2) <= 0x3E && ((1 << (v5 - 2)) & 0x400000000003C203) != 0)
  {
    objc_storeStrong((id *)&self->_scalarValue, a4);
    int v8 = 0;
    self->_vType = v5;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant setScalarType:ScalarValue:]();
    }
    int v8 = 22;
  }

  return v8;
}

- (int)setStringType:(unsigned __int16)a3 UTF8Str:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  if (v4 == 8 || v4 == 31)
  {
    id v7 = [[utf16leData alloc] initWithStr:v6];
    strData = self->_strData;
    self->_strData = v7;

    if (self->_strData)
    {
      int v9 = 0;
      self->_vType = v4;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[cbaseVariant setStringType:UTF8Str:]();
      }
      int v9 = 12;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant setStringType:UTF8Str:]();
    }
    int v9 = 22;
  }

  return v9;
}

- (int)setVectorWithType:(unsigned __int16)a3 ValueArray:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if (v4 <= 0x1F)
  {
    if (((1 << v4) & 0xF080C) != 0)
    {
      int v7 = [(cbaseVariant *)self setIntVectorType:v4 ValueArray:v6];
LABEL_6:
      int v8 = v7;
      goto LABEL_7;
    }
    if (((1 << v4) & 0x80000100) != 0)
    {
      int v7 = [(cbaseVariant *)self setStrVectorType:v4 ValueArray:v6];
      goto LABEL_6;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[cbaseVariant setVectorWithType:ValueArray:]();
  }
  int v8 = 22;
LABEL_7:

  return v8;
}

- (int)setStrVectorType:(unsigned __int16)a3 ValueArray:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = objc_alloc_init(vtVector);
  [(cbaseVariant *)self setVectObj:v7];

  int v8 = [(cbaseVariant *)self vectObj];

  if (v8)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      __int16 v36 = v4;
      id v37 = v6;
      v12 = 0;
      id v13 = 0;
      uint64_t v14 = *(void *)v39;
      while (2)
      {
        uint64_t v15 = 0;
        v16 = v12;
        v17 = v13;
        do
        {
          if (*(void *)v39 != v14) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(id *)(*((void *)&v38 + 1) + 8 * v15);

          v12 = [[utf16leData alloc] initWithStr:v13];
          if (!v12)
          {
            BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
            if (v20) {
              -[cbaseVariant setStrVectorType:ValueArray:](v20, v21, v22, v23, v24, v25, v26, v27);
            }

            int v19 = 12;
            id v6 = v37;
            goto LABEL_18;
          }
          v18 = [(cbaseVariant *)self vectObj];
          [v18 addElement:v12];

          ++v15;
          v16 = v12;
          v17 = v13;
        }
        while (v11 != v15);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v11) {
          continue;
        }
        break;
      }

      id v6 = v37;
      LOWORD(v4) = v36;
    }

    int v19 = 0;
    self->_vType = v4 | 0x1000;
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant setStrVectorType:ValueArray:](v4, v28, v29, v30, v31, v32, v33, v34);
    }
    int v19 = 12;
  }
LABEL_18:

  return v19;
}

- (int)setIntVectorType:(unsigned int)a3 ValueArray:(id)a4
{
  __int16 v4 = a3;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int v7 = objc_alloc_init(vtVector);
  [(cbaseVariant *)self setVectObj:v7];

  int v8 = [(cbaseVariant *)self vectObj];

  if (v8)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = 0;
      uint64_t v13 = *(void *)v28;
      do
      {
        uint64_t v14 = 0;
        uint64_t v15 = v12;
        do
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v9);
          }
          id v12 = *(id *)(*((void *)&v27 + 1) + 8 * v14);

          v16 = [(cbaseVariant *)self vectObj];
          [v16 addElement:v12];

          ++v14;
          uint64_t v15 = v12;
        }
        while (v11 != v14);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }
    int v17 = 0;
    self->_vType = v4 | 0x1000;
  }
  else
  {
    BOOL v18 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v18) {
      -[cbaseVariant setIntVectorType:ValueArray:](v18, v19, v20, v21, v22, v23, v24, v25);
    }
    int v17 = 12;
  }

  return v17;
}

- (int)setArrayWithType:(unsigned __int16)a3 ValueArray:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  if (v4 <= 0x1F)
  {
    if (((1 << v4) & 0xF080C) != 0)
    {
      int v7 = [(cbaseVariant *)self setIntArrayType:v4 ValueArray:v6];
LABEL_6:
      int v8 = v7;
      goto LABEL_7;
    }
    if (((1 << v4) & 0x80000100) != 0)
    {
      int v7 = [(cbaseVariant *)self setStrArrayType:v4 ValueArray:v6];
      goto LABEL_6;
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[cbaseVariant setArrayWithType:ValueArray:]();
  }
  int v8 = 22;
LABEL_7:

  return v8;
}

- (int)setStrArrayType:(unsigned __int16)a3 ValueArray:(id)a4
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (!v7)
  {
    BOOL v26 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v26) {
      -[cbaseVariant setStrArrayType:ValueArray:](v26, v27, v28, v29, v30, v31, v32, v33);
    }
    goto LABEL_22;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unsigned __int16 v45 = a3;
    v46 = self;
    id v47 = v6;
    uint64_t v11 = 0;
    id v12 = 0;
    uint64_t v13 = *(void *)v49;
    while (2)
    {
      uint64_t v14 = 0;
      uint64_t v15 = v11;
      v16 = v12;
      do
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v48 + 1) + 8 * v14);

        uint64_t v11 = [[utf16leData alloc] initWithStr:v12];
        if (!v11)
        {
          BOOL v17 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
          if (v17) {
            -[cbaseVariant setStrArrayType:ValueArray:](v17, v18, v19, v20, v21, v22, v23, v24);
          }

          int v25 = 12;
          id v6 = v47;
          goto LABEL_23;
        }
        [v7 addObject:v11];
        ++v14;
        uint64_t v15 = v11;
        v16 = v12;
      }
      while (v10 != v14);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    self = v46;
    id v6 = v47;
    a3 = v45;
  }
  else
  {
    uint64_t v11 = 0;
  }

  uint64_t v34 = [[vtSafeArray alloc] initWithArray:v7 ElementSize:4];
  [(cbaseVariant *)self setArrObj:v34];

  v35 = [(cbaseVariant *)self arrObj];

  if (!v35)
  {
    BOOL v36 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v36) {
      -[cbaseVariant setStrArrayType:ValueArray:](v36, v37, v38, v39, v40, v41, v42, v43);
    }

LABEL_22:
    int v25 = 12;
    goto LABEL_23;
  }
  self->_vType = a3 | 0x2000;

  int v25 = 0;
LABEL_23:

  return v25;
}

- (int)setIntArrayType:(unsigned int)a3 ValueArray:(id)a4
{
  id v6 = [MEMORY[0x263EFF980] arrayWithArray:a4];
  if (v6)
  {
    uint64_t v7 = 1;
    switch(a3)
    {
      case 0xBu:
      case 0x12u:
        goto LABEL_7;
      case 0xCu:
      case 0xDu:
      case 0xEu:
      case 0xFu:
        goto LABEL_13;
      case 0x10u:
      case 0x11u:
        goto LABEL_9;
      case 0x13u:
        goto LABEL_8;
      default:
        if (a3 == 3)
        {
LABEL_8:
          uint64_t v7 = 4;
        }
        else
        {
          if (a3 != 2)
          {
LABEL_13:
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[cbaseVariant setIntArrayType:ValueArray:]();
            }
            break;
          }
LABEL_7:
          uint64_t v7 = 2;
        }
LABEL_9:
        id v8 = [[vtSafeArray alloc] initWithArray:v6 ElementSize:v7];
        [(cbaseVariant *)self setArrObj:v8];

        uint64_t v9 = [(cbaseVariant *)self arrObj];

        if (v9)
        {
          int v10 = 0;
          self->_vType = a3 | 0x2000;
          goto LABEL_16;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[cbaseVariant setIntArrayType:ValueArray:]();
        }
        break;
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[cbaseVariant setIntArrayType:ValueArray:]();
  }
  int v10 = 12;
LABEL_16:

  return v10;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  int v44 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:]2();
    }
    goto LABEL_7;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:](self);
    }
LABEL_7:
    int v13 = 12;
    goto LABEL_8;
  }
  uint64_t v15 = v12;
  *(_WORD *)(v12 + a4) = self->_vType;
  *(unsigned char *)(v12 + a4 + 2) = self->_vData1;
  *(unsigned char *)(v12 + a4 + 3) = self->_vData2;
  uint64_t v16 = a4 + 4;
  int v17 = [(cbaseVariant *)self vType];
  if (v17 <= 4097)
  {
    unint64_t v19 = v10 - 4;
    switch(v17)
    {
      case 2:
      case 18:
        if (v19 > 1)
        {
          [(cbaseVariant *)self vType];
          BOOL v26 = [(cbaseVariant *)self scalarValue];
          __int16 v27 = [v26 shortValue];

          *(_WORD *)(v15 + v16) = v27;
          goto LABEL_55;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        goto LABEL_45;
      case 3:
      case 19:
        if (v19 > 3)
        {
          [(cbaseVariant *)self vType];
          uint64_t v28 = [(cbaseVariant *)self scalarValue];
          int v29 = [v28 intValue];

          *(_DWORD *)(v15 + v16) = v29;
          unsigned int v21 = 8;
          goto LABEL_25;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        goto LABEL_45;
      case 4:
      case 5:
      case 6:
      case 7:
      case 9:
      case 10:
      case 12:
      case 13:
      case 14:
      case 15:
        goto LABEL_40;
      case 8:
        goto LABEL_37;
      case 11:
        if (v19 > 1)
        {
          uint64_t v34 = [(cbaseVariant *)self scalarValue];
          __int16 v35 = [v34 BOOLValue];

          *(_WORD *)(v15 + v16) = (__int16)(v35 << 15) >> 15;
LABEL_55:
          unsigned int v21 = 6;
          goto LABEL_25;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        goto LABEL_45;
      case 16:
      case 17:
        if (v10 != 4)
        {
          int v22 = [(cbaseVariant *)self vType];
          uint64_t v23 = [(cbaseVariant *)self scalarValue];
          uint64_t v24 = v23;
          if (v22 == 16) {
            char v25 = [v23 charValue];
          }
          else {
            char v25 = [v23 unsignedCharValue];
          }
          *(unsigned char *)(v15 + v16) = v25;

          unsigned int v21 = 5;
          goto LABEL_25;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:](self);
        }
        goto LABEL_7;
      default:
        if (v17 == 31)
        {
LABEL_37:
          if (v19 > 3)
          {
            int v30 = [(cbaseVariant *)self vType];
            uint64_t v31 = [(cbaseVariant *)self strData];
            uint64_t v32 = v31;
            if (v30 == 8) {
              int v33 = [v31 byteCount];
            }
            else {
              int v33 = [v31 charCount];
            }
            int v36 = v33;

            *(_DWORD *)(v15 + v16) = v36;
            uint64_t v37 = [(cbaseVariant *)self strData];
            unsigned int v38 = [v37 byteCount];

            if (v10 - 8 < v38)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.9(self);
              }
              goto LABEL_7;
            }
            uint64_t v39 = (void *)(v15 + a4 + 8);
            uint64_t v40 = [(cbaseVariant *)self strData];
            id v41 = [v40 datab];
            memcpy(v39, (const void *)[v41 bytes], v38);

            unsigned int v21 = v38 + 8;
LABEL_25:
            int v13 = 0;
            *a5 = v21;
            goto LABEL_8;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_7;
          }
        }
        else
        {
          if (v17 != 64) {
            goto LABEL_40;
          }
          if (v19 > 7)
          {
            uint64_t v42 = [(cbaseVariant *)self scalarValue];
            uint64_t v43 = [v42 unsignedLongLongValue];

            *(void *)(v15 + v16) = v43;
            unsigned int v21 = 12;
            goto LABEL_25;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            goto LABEL_7;
          }
        }
LABEL_45:
        -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:].cold.4(self);
        goto LABEL_7;
    }
  }
  if ((v17 - 4098) <= 0x1D && ((1 << (v17 - 2)) & 0x2003C243) != 0)
  {
    int v20 = [(cbaseVariant *)self encodeVector:v11 BufferOffset:a4 + 4 BytesWritten:&v44];
    if (v20)
    {
      int v13 = v20;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:]1(self);
      }
      goto LABEL_8;
    }
    goto LABEL_24;
  }
  if ((v17 - 8194) <= 0x1D && ((1 << (v17 - 2)) & 0x2003C243) != 0)
  {
    int v18 = [(cbaseVariant *)self encodeArray:v11 BufferOffset:a4 + 4 BytesWritten:&v44];
    if (!v18)
    {
LABEL_24:
      unsigned int v21 = v44 + 4;
      goto LABEL_25;
    }
    int v13 = v18;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:]0(self);
    }
  }
  else
  {
LABEL_40:
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeBuffer:BufferOffset:BytesWritten:](self);
    }
    int v13 = 22;
  }
LABEL_8:

  return v13;
}

- (int)encodeArray:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  int v31 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.8();
    }
    goto LABEL_19;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:](self);
    }
LABEL_19:
    int v23 = 12;
    goto LABEL_20;
  }
  uint64_t v13 = v12;
  uint64_t v14 = [(cbaseVariant *)self arrObj];
  __int16 v15 = [v14 cDims];

  *(_WORD *)(v13 + a4) = v15;
  if (v10 - 2 <= 1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:](self);
    }
    goto LABEL_19;
  }
  uint64_t v16 = [(cbaseVariant *)self arrObj];
  __int16 v17 = [v16 fFeatures];

  *(_WORD *)(v13 + a4 + 2) = v17;
  if (v10 - 4 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:](self);
    }
    goto LABEL_19;
  }
  int v18 = [(cbaseVariant *)self arrObj];
  int v19 = [v18 cbElementSize];

  *(_DWORD *)(v13 + a4 + 4) = v19;
  if (v10 - 8 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.4(self);
    }
    goto LABEL_19;
  }
  int v20 = [(cbaseVariant *)self arrObj];
  unsigned int v21 = [v20 rgsBoundArr];
  int v22 = [v21 cElements];

  *(_DWORD *)(v13 + a4 + 8) = v22;
  if (v10 - 12 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.5(self);
    }
    goto LABEL_19;
  }
  char v25 = [(cbaseVariant *)self arrObj];
  BOOL v26 = [v25 rgsBoundArr];
  int v27 = [v26 lowBound];

  *(_DWORD *)(v13 + a4 + 12) = v27;
  uint64_t v28 = a4 + 16;
  if ([(cbaseVariant *)self vType] == 8200 || [(cbaseVariant *)self vType] == 8223)
  {
    int v29 = [(cbaseVariant *)self encodeStrArray:v11 BufferOffset:v28 BytesWritten:&v31];
    if (v29)
    {
      int v23 = v29;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.6(self);
      }
      goto LABEL_20;
    }
LABEL_29:
    int v23 = 0;
    *a5 = v31 + 16;
    goto LABEL_20;
  }
  int v30 = [(cbaseVariant *)self encodeIntArray:v11 BufferOffset:v28 BytesWritten:&v31];
  if (!v30) {
    goto LABEL_29;
  }
  int v23 = v30;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[cbaseVariant encodeArray:BufferOffset:BytesWritten:].cold.7(self);
  }
LABEL_20:

  return v23;
}

- (int)encodeStrArray:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeStrArray:BufferOffset:BytesWritten:]();
    }
    int v26 = 12;
    goto LABEL_25;
  }
  uint64_t v10 = [v8 bytes];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v11 = [(cbaseVariant *)self arrObj];
  uint64_t v12 = [v11 vData];

  id obj = v12;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v13)
  {
    unsigned int v15 = 0;
    goto LABEL_19;
  }
  uint64_t v14 = v13;
  uint64_t v34 = a5;
  id v35 = v8;
  unsigned int v15 = 0;
  id v16 = 0;
  unint64_t v17 = v9 - a4;
  uint64_t v37 = *(void *)v40;
  unsigned int v38 = self;
  while (2)
  {
    uint64_t v18 = 0;
    int v19 = v16;
    do
    {
      if (*(void *)v40 != v37) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(id *)(*((void *)&v39 + 1) + 8 * v18);

      if (([(cbaseVariant *)v38 vType] & 8) != 0) {
        int v20 = [v16 byteCount];
      }
      else {
        int v20 = [v16 charCount];
      }
      if (v17 <= 3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[cbaseVariant encodeStrArray:BufferOffset:BytesWritten:](v17);
        }
        goto LABEL_24;
      }
      *(_DWORD *)(v10 + a4) = v20;
      unint64_t v21 = v17 - 4;
      size_t v22 = [v16 byteCount];
      if (v21 < v22)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[cbaseVariant encodeStrArray:BufferOffset:BytesWritten:](v22, v21, v27, v28, v29, v30, v31, v32);
        }
LABEL_24:

        int v26 = 12;
        id v8 = v35;
        goto LABEL_25;
      }
      int v23 = v15 + v22;
      uint64_t v24 = a4 + 4;
      id v25 = [v16 datab];
      memcpy((void *)(v10 + v24), (const void *)[v25 bytes], v22);

      unsigned int v15 = v23 + 4;
      a4 = v22 + v24;
      unint64_t v17 = v21 - v22;
      ++v18;
      int v19 = v16;
    }
    while (v14 != v18);
    uint64_t v14 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v14) {
      continue;
    }
    break;
  }

  a5 = v34;
  id v8 = v35;
LABEL_19:

  int v26 = 0;
  *a5 = v15;
LABEL_25:

  return v26;
}

- (int)encodeIntArray:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:].cold.6();
    }
    int v25 = 12;
  }
  else
  {
    unint64_t v10 = v9 - a4;
    uint64_t v11 = [v8 bytes];
    uint64_t v12 = [(cbaseVariant *)self arrObj];
    [v12 cbElementSize];

    int v13 = [(cbaseVariant *)self vType];
    switch(v13)
    {
      case 8203:
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v42 = [(cbaseVariant *)self arrObj];
        uint64_t v43 = [v42 vData];

        id obj = v43;
        uint64_t v44 = [v43 countByEnumeratingWithState:&v54 objects:v70 count:16];
        if (!v44) {
          goto LABEL_62;
        }
        uint64_t v45 = v44;
        long long v51 = a5;
        id v52 = v8;
        unsigned int v24 = 0;
        id v19 = 0;
        uint64_t v46 = *(void *)v55;
        while (1)
        {
          uint64_t v47 = 0;
          long long v48 = v19;
          do
          {
            if (*(void *)v55 != v46) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(id *)(*((void *)&v54 + 1) + 8 * v47);

            if (v10 <= 1)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:](self);
              }
              goto LABEL_66;
            }
            *(_WORD *)(v11 + a4) = (__int16)((unsigned __int16)[v19 BOOLValue] << 15) >> 15;
            v24 += 2;
            a4 += 2;
            v10 -= 2;
            ++v47;
            long long v48 = v19;
          }
          while (v45 != v47);
          uint64_t v45 = [obj countByEnumeratingWithState:&v54 objects:v70 count:16];
          if (!v45) {
            goto LABEL_61;
          }
        }
      case 8204:
      case 8205:
      case 8206:
      case 8207:
        goto LABEL_46;
      case 8208:
      case 8209:
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        uint64_t v14 = [(cbaseVariant *)self arrObj];
        unsigned int v15 = [v14 vData];

        id obj = v15;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v66 objects:v73 count:16];
        if (!v16) {
          goto LABEL_62;
        }
        uint64_t v17 = v16;
        long long v51 = a5;
        id v52 = v8;
        int v18 = 0;
        id v19 = 0;
        uint64_t v20 = *(void *)v67;
        while (2)
        {
          uint64_t v21 = 0;
          int v50 = v18;
          size_t v22 = v19;
          do
          {
            if (*(void *)v67 != v20) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(id *)(*((void *)&v66 + 1) + 8 * v21);

            if (v10 == v21)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:](self);
              }
              goto LABEL_66;
            }
            if (([(cbaseVariant *)self vType] & 0x10) != 0) {
              char v23 = [v19 charValue];
            }
            else {
              char v23 = [v19 unsignedCharValue];
            }
            *(unsigned char *)(v11 + a4 + v21++) = v23;
            size_t v22 = v19;
          }
          while (v17 != v21);
          uint64_t v17 = [obj countByEnumeratingWithState:&v66 objects:v73 count:16];
          int v18 = v50 + v21;
          v10 -= v21;
          a4 += v21;
          if (v17) {
            continue;
          }
          break;
        }
        unsigned int v24 = v50 + v21;
LABEL_61:
        a5 = v51;
        id v8 = v52;

LABEL_63:
        int v25 = 0;
        *a5 = v24;
        break;
      case 8210:
        goto LABEL_32;
      case 8211:
        goto LABEL_20;
      default:
        if (v13 == 8194)
        {
LABEL_32:
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          uint64_t v34 = [(cbaseVariant *)self arrObj];
          id v35 = [v34 vData];

          id obj = v35;
          uint64_t v36 = [v35 countByEnumeratingWithState:&v62 objects:v72 count:16];
          if (v36)
          {
            uint64_t v37 = v36;
            long long v51 = a5;
            id v52 = v8;
            unsigned int v24 = 0;
            id v19 = 0;
            uint64_t v38 = *(void *)v63;
LABEL_34:
            uint64_t v39 = 0;
            long long v40 = v19;
            while (1)
            {
              if (*(void *)v63 != v38) {
                objc_enumerationMutation(obj);
              }
              id v19 = *(id *)(*((void *)&v62 + 1) + 8 * v39);

              if (v10 <= 1) {
                break;
              }
              if (([(cbaseVariant *)self vType] & 2) != 0) {
                __int16 v41 = [v19 shortValue];
              }
              else {
                __int16 v41 = [v19 unsignedShortValue];
              }
              *(_WORD *)(v11 + a4) = v41;
              v24 += 2;
              a4 += 2;
              v10 -= 2;
              ++v39;
              long long v40 = v19;
              if (v37 == v39)
              {
                uint64_t v37 = [obj countByEnumeratingWithState:&v62 objects:v72 count:16];
                if (!v37) {
                  goto LABEL_61;
                }
                goto LABEL_34;
              }
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:](self);
            }
            goto LABEL_66;
          }
LABEL_62:
          unsigned int v24 = 0;
          goto LABEL_63;
        }
        if (v13 == 8195)
        {
LABEL_20:
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          int v26 = [(cbaseVariant *)self arrObj];
          uint64_t v27 = [v26 vData];

          id obj = v27;
          uint64_t v28 = [v27 countByEnumeratingWithState:&v58 objects:v71 count:16];
          if (v28)
          {
            uint64_t v29 = v28;
            long long v51 = a5;
            id v52 = v8;
            unsigned int v24 = 0;
            id v19 = 0;
            uint64_t v30 = *(void *)v59;
LABEL_22:
            uint64_t v31 = 0;
            uint64_t v32 = v19;
            while (1)
            {
              if (*(void *)v59 != v30) {
                objc_enumerationMutation(obj);
              }
              id v19 = *(id *)(*((void *)&v58 + 1) + 8 * v31);

              if (v10 <= 3) {
                break;
              }
              if (([(cbaseVariant *)self vType] & 3) != 0) {
                int v33 = [v19 intValue];
              }
              else {
                int v33 = [v19 unsignedIntValue];
              }
              *(_DWORD *)(v11 + a4) = v33;
              v24 += 4;
              a4 += 4;
              v10 -= 4;
              ++v31;
              uint64_t v32 = v19;
              if (v29 == v31)
              {
                uint64_t v29 = [obj countByEnumeratingWithState:&v58 objects:v71 count:16];
                if (!v29) {
                  goto LABEL_61;
                }
                goto LABEL_22;
              }
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:](self);
            }
LABEL_66:

            int v25 = 12;
            id v8 = v52;
            break;
          }
          goto LABEL_62;
        }
LABEL_46:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[cbaseVariant encodeIntArray:BufferOffset:BytesWritten:](self);
        }
        int v25 = 22;
        break;
    }
  }

  return v25;
}

- (int)encodeVector:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  int v21 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeVector:BufferOffset:BytesWritten:].cold.4();
    }
    goto LABEL_7;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 > 3)
  {
    uint64_t v15 = v12;
    uint64_t v16 = [(cbaseVariant *)self vectObj];
    int v17 = [v16 vVectorElements];

    *(_DWORD *)(v15 + a4) = v17;
    uint64_t v18 = a4 + 4;
    if ([(cbaseVariant *)self vType] == 4127 || [(cbaseVariant *)self vType] == 4104)
    {
      int v19 = [(cbaseVariant *)self encodeStrVector:v11 BufferOffset:v18 BytesWritten:&v21];
      if (v19)
      {
        int v13 = v19;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
LABEL_13:
        -[cbaseVariant encodeVector:BufferOffset:BytesWritten:](self);
        goto LABEL_8;
      }
    }
    else
    {
      int v20 = [(cbaseVariant *)self encodeIntVector:v11 BufferOffset:v18 BytesWritten:&v21];
      if (v20)
      {
        int v13 = v20;
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_8;
        }
        goto LABEL_13;
      }
    }
    int v13 = 0;
    *a5 = v21 + 4;
    goto LABEL_8;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[cbaseVariant encodeVector:BufferOffset:BytesWritten:](self);
  }
LABEL_7:
  int v13 = 12;
LABEL_8:

  return v13;
}

- (int)encodeStrVector:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeStrVector:BufferOffset:BytesWritten:]();
    }
    int v24 = 12;
    goto LABEL_25;
  }
  uint64_t v10 = [v8 bytes];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v11 = [(cbaseVariant *)self vectObj];
  uint64_t v12 = [v11 vVectorData];

  id obj = v12;
  uint64_t v30 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v30)
  {
    unsigned int v13 = 0;
    goto LABEL_19;
  }
  int v26 = a5;
  id v27 = v8;
  unsigned int v13 = 0;
  id v14 = 0;
  unint64_t v15 = v9 - a4;
  uint64_t v29 = *(void *)v32;
  while (2)
  {
    uint64_t v16 = 0;
    int v17 = v14;
    do
    {
      if (*(void *)v32 != v29) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(*((void *)&v31 + 1) + 8 * v16);

      if ([(cbaseVariant *)self vType] == 4104) {
        int v18 = [v14 byteCount];
      }
      else {
        int v18 = [v14 charCount];
      }
      if (v15 <= 3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[cbaseVariant encodeStrVector:BufferOffset:BytesWritten:](self);
        }
        goto LABEL_24;
      }
      *(_DWORD *)(v10 + a4) = v18;
      size_t v19 = v15 - 4;
      size_t v20 = [v14 byteCount];
      if (v19 < v20)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[cbaseVariant encodeStrVector:BufferOffset:BytesWritten:](self);
        }
LABEL_24:

        int v24 = 12;
        id v8 = v27;
        goto LABEL_25;
      }
      int v21 = v13 + v20;
      uint64_t v22 = a4 + 4;
      id v23 = [v14 datab];
      memcpy((void *)(v10 + v22), (const void *)[v23 bytes], v20);

      unsigned int v13 = v21 + 4;
      a4 = v20 + v22;
      unint64_t v15 = v19 - v20;
      ++v16;
      int v17 = v14;
    }
    while (v30 != v16);
    uint64_t v30 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v30) {
      continue;
    }
    break;
  }

  a5 = v26;
  id v8 = v27;
LABEL_19:

  int v24 = 0;
  *a5 = v13;
LABEL_25:

  return v24;
}

- (int)encodeIntVector:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:].cold.6();
    }
    int v24 = 12;
  }
  else
  {
    unint64_t v10 = v9 - a4;
    uint64_t v11 = [v8 bytes];
    int v12 = [(cbaseVariant *)self vType];
    switch(v12)
    {
      case 4107:
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        __int16 v41 = [(cbaseVariant *)self vectObj];
        long long v42 = [v41 vVectorData];

        id obj = v42;
        uint64_t v43 = [v42 countByEnumeratingWithState:&v53 objects:v69 count:16];
        if (!v43) {
          goto LABEL_62;
        }
        uint64_t v44 = v43;
        int v50 = a5;
        id v51 = v8;
        unsigned int v23 = 0;
        id v18 = 0;
        uint64_t v45 = *(void *)v54;
        while (1)
        {
          uint64_t v46 = 0;
          uint64_t v47 = v18;
          do
          {
            if (*(void *)v54 != v45) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(id *)(*((void *)&v53 + 1) + 8 * v46);

            if (v10 <= 1)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:](self);
              }
              goto LABEL_66;
            }
            *(_WORD *)(v11 + a4) = (__int16)((unsigned __int16)[v18 BOOLValue] << 15) >> 15;
            v23 += 2;
            a4 += 2;
            v10 -= 2;
            ++v46;
            uint64_t v47 = v18;
          }
          while (v44 != v46);
          uint64_t v44 = [obj countByEnumeratingWithState:&v53 objects:v69 count:16];
          if (!v44) {
            goto LABEL_61;
          }
        }
      case 4108:
      case 4109:
      case 4110:
      case 4111:
        goto LABEL_46;
      case 4112:
      case 4113:
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        unsigned int v13 = [(cbaseVariant *)self vectObj];
        id v14 = [v13 vVectorData];

        id obj = v14;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v65 objects:v72 count:16];
        if (!v15) {
          goto LABEL_62;
        }
        uint64_t v16 = v15;
        int v50 = a5;
        id v51 = v8;
        int v17 = 0;
        id v18 = 0;
        uint64_t v19 = *(void *)v66;
        while (2)
        {
          uint64_t v20 = 0;
          int v49 = v17;
          int v21 = v18;
          do
          {
            if (*(void *)v66 != v19) {
              objc_enumerationMutation(obj);
            }
            id v18 = *(id *)(*((void *)&v65 + 1) + 8 * v20);

            if (v10 == v20)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:](self);
              }
              goto LABEL_66;
            }
            if (([(cbaseVariant *)self vType] & 0x10) != 0) {
              char v22 = [v18 charValue];
            }
            else {
              char v22 = [v18 unsignedCharValue];
            }
            *(unsigned char *)(v11 + a4 + v20++) = v22;
            int v21 = v18;
          }
          while (v16 != v20);
          uint64_t v16 = [obj countByEnumeratingWithState:&v65 objects:v72 count:16];
          int v17 = v49 + v20;
          v10 -= v20;
          a4 += v20;
          if (v16) {
            continue;
          }
          break;
        }
        unsigned int v23 = v49 + v20;
LABEL_61:
        a5 = v50;
        id v8 = v51;

LABEL_63:
        int v24 = 0;
        *a5 = v23;
        break;
      case 4114:
        goto LABEL_32;
      case 4115:
        goto LABEL_20;
      default:
        if (v12 == 4098)
        {
LABEL_32:
          long long v63 = 0u;
          long long v64 = 0u;
          long long v61 = 0u;
          long long v62 = 0u;
          long long v33 = [(cbaseVariant *)self vectObj];
          long long v34 = [v33 vVectorData];

          id obj = v34;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v71 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            int v50 = a5;
            id v51 = v8;
            unsigned int v23 = 0;
            id v18 = 0;
            uint64_t v37 = *(void *)v62;
LABEL_34:
            uint64_t v38 = 0;
            uint64_t v39 = v18;
            while (1)
            {
              if (*(void *)v62 != v37) {
                objc_enumerationMutation(obj);
              }
              id v18 = *(id *)(*((void *)&v61 + 1) + 8 * v38);

              if (v10 <= 1) {
                break;
              }
              if (([(cbaseVariant *)self vType] & 2) != 0) {
                __int16 v40 = [v18 shortValue];
              }
              else {
                __int16 v40 = [v18 unsignedShortValue];
              }
              *(_WORD *)(v11 + a4) = v40;
              v23 += 2;
              a4 += 2;
              v10 -= 2;
              ++v38;
              uint64_t v39 = v18;
              if (v36 == v38)
              {
                uint64_t v36 = [obj countByEnumeratingWithState:&v61 objects:v71 count:16];
                if (!v36) {
                  goto LABEL_61;
                }
                goto LABEL_34;
              }
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:](self);
            }
            goto LABEL_66;
          }
LABEL_62:
          unsigned int v23 = 0;
          goto LABEL_63;
        }
        if (v12 == 4099)
        {
LABEL_20:
          long long v59 = 0u;
          long long v60 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          int v25 = [(cbaseVariant *)self vectObj];
          int v26 = [v25 vVectorData];

          id obj = v26;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v57 objects:v70 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            int v50 = a5;
            id v51 = v8;
            unsigned int v23 = 0;
            id v18 = 0;
            uint64_t v29 = *(void *)v58;
LABEL_22:
            uint64_t v30 = 0;
            long long v31 = v18;
            while (1)
            {
              if (*(void *)v58 != v29) {
                objc_enumerationMutation(obj);
              }
              id v18 = *(id *)(*((void *)&v57 + 1) + 8 * v30);

              if (v10 <= 3) {
                break;
              }
              if (([(cbaseVariant *)self vType] & 3) != 0) {
                int v32 = [v18 intValue];
              }
              else {
                int v32 = [v18 unsignedIntValue];
              }
              *(_DWORD *)(v11 + a4) = v32;
              v23 += 4;
              a4 += 4;
              v10 -= 4;
              ++v30;
              long long v31 = v18;
              if (v28 == v30)
              {
                uint64_t v28 = [obj countByEnumeratingWithState:&v57 objects:v70 count:16];
                if (!v28) {
                  goto LABEL_61;
                }
                goto LABEL_22;
              }
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:](self);
            }
LABEL_66:

            int v24 = 12;
            id v8 = v51;
            break;
          }
          goto LABEL_62;
        }
LABEL_46:
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[cbaseVariant encodeIntVector:BufferOffset:BytesWritten:](self);
        }
        int v24 = 22;
        break;
    }
  }

  return v24;
}

- (unsigned)vType
{
  return self->_vType;
}

- (unsigned)vData1
{
  return self->_vData1;
}

- (unsigned)vData2
{
  return self->_vData2;
}

- (NSNumber)scalarValue
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (utf16leData)strData
{
  return (utf16leData *)objc_getProperty(self, a2, 24, 1);
}

- (vtVector)vectObj
{
  return (vtVector *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVectObj:(id)a3
{
}

- (vtSafeArray)arrObj
{
  return (vtSafeArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setArrObj:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrObj, 0);
  objc_storeStrong((id *)&self->_vectObj, 0);
  objc_storeStrong((id *)&self->_strData, 0);

  objc_storeStrong((id *)&self->_scalarValue, 0);
}

- (void)setScalarType:ScalarValue:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cbaseVariant:setScalarType: vt_type: 0x%x not a supported scalar type\n", v1, v2, v3, v4, v5);
}

- (void)setStringType:UTF8Str:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cbaseVariant:setStringType: vt_type: 0x%x not a string type\n", v1, v2, v3, v4, v5);
}

- (void)setStringType:UTF8Str:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cbaseVariant:setStringType: vt_type: 0x%x, failed to aloc utf16leData\n", v1, v2, v3, v4, v5);
}

- (void)setVectorWithType:ValueArray:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cbaseVariant:setVectorWithType: vt_type: 0x%x not a valid vector type\n", v1, v2, v3, v4, v5);
}

- (void)setStrVectorType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setStrVectorType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setIntVectorType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setArrayWithType:ValueArray:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cbaseVariant:setArrayWithType: vt_type: 0x%x not a valid array type\n", v1, v2, v3, v4, v5);
}

- (void)setStrArrayType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setStrArrayType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setStrArrayType:(uint64_t)a3 ValueArray:(uint64_t)a4 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setIntArrayType:ValueArray:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cbaseVariant:setIntArrayType: vt_type: 0x%x, no memory for temporary array object\n", v1, v2, v3, v4, v5);
}

- (void)setIntArrayType:ValueArray:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cbaseVariant:setIntArrayType: vt_type: 0x%x not a legal array type\n", v1, v2, v3, v4, v5);
}

- (void)setIntArrayType:ValueArray:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cbaseVariant:setIntArrayType: vt_type: 0x%x, no memory for safearray object\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.1(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space for vType, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeBuffer: vType: 0x%x is not supported\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.3(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space for value, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.4(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space for value, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.9(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space for str len: %u, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.10(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeBuffer: vType: 0x%x encodeStrArray error: %d\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.11(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeBuffer: vType: 0x%x encodeVector error: %d\n", v2, v3, v4, v5, v6);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.12()
{
  OUTLINED_FUNCTION_11();
  [v0 vType];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeBuffer: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v2, v3, v4, v5, v6);
}

- (void)encodeArray:(void *)a1 BufferOffset:BytesWritten:.cold.1(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for cDims, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeArray:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for fFeatures, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeArray:(void *)a1 BufferOffset:BytesWritten:.cold.3(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for cbElements, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeArray:(void *)a1 BufferOffset:BytesWritten:.cold.4(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for rgsabound cElements, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeArray:(void *)a1 BufferOffset:BytesWritten:.cold.5(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space for rgsabound ILBound, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeArray:(void *)a1 BufferOffset:BytesWritten:.cold.6(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeArray: vType: 0x%x, encodeStrArray error: %d\n", v2, v3, v4, v5, v6);
}

- (void)encodeArray:(void *)a1 BufferOffset:BytesWritten:.cold.7(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeArray: vType: 0x%x, encodeIntArray error: %d\n", v2, v3, v4, v5, v6);
}

- (void)encodeArray:BufferOffset:BytesWritten:.cold.8()
{
  OUTLINED_FUNCTION_11();
  [v0 vType];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeArray: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v2, v3, v4, v5, v6);
}

- (void)encodeStrArray:(uint64_t)a1 BufferOffset:BytesWritten:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "cbaseVariant:encodeStrArray: no buffer space for str count, sizeAvail: %llu\n", (uint8_t *)&v1, 0xCu);
}

- (void)encodeStrArray:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)encodeStrArray:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_11();
  [v0 vType];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeStrArray: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v2, v3, v4, v5, v6);
}

- (void)encodeIntArray:(void *)a1 BufferOffset:BytesWritten:.cold.1(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeIntArray: vType: 0x%x not supported\n", v2, v3, v4, v5, v6);
}

- (void)encodeIntArray:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeIntArray: no buffer space for vtype: 0x%x, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeIntArray:(void *)a1 BufferOffset:BytesWritten:.cold.3(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeIntArray: no buffer space for vtype: 0x%x, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeIntArray:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_11();
  [v0 vType];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeIntArray: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v2, v3, v4, v5, v6);
}

- (void)encodeVector:(void *)a1 BufferOffset:BytesWritten:.cold.1(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeVector: vType: 0x%x, no buffer space for vVectorElements, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeVector:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeVector: vType: 0x%x, encodeStrVector error: %d\n", v2, v3, v4, v5, v6);
}

- (void)encodeVector:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_11();
  [v0 vType];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeVector: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v2, v3, v4, v5, v6);
}

- (void)encodeStrVector:(void *)a1 BufferOffset:BytesWritten:.cold.1(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeStrVector: vType: 0x%x,  no buffer space for str count, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeStrVector:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5_0(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeStrVector: vType: 0x%x,  no buffer space for str len: %u, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeStrVector:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_11();
  [v0 vType];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeStrVector: vType: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v2, v3, v4, v5, v6);
}

- (void)encodeIntVector:(void *)a1 BufferOffset:BytesWritten:.cold.1(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeIntVector: vtype: 0x%x does not contain a scalar\n", v2, v3, v4, v5, v6);
}

- (void)encodeIntVector:(void *)a1 BufferOffset:BytesWritten:.cold.2(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeIntVector: no buffer space for vtype: 0x%x, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeIntVector:(void *)a1 BufferOffset:BytesWritten:.cold.3(void *a1)
{
  [a1 vType];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeIntVector: no buffer space for vtype: 0x%x, sizeAvail: %llu\n", v2, v3, v4, v5, v6);
}

- (void)encodeIntVector:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_11();
  [v0 vType];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5_0(&dword_235F82000, &_os_log_internal, v1, "cbaseVariant:encodeIntVector: vtype: 0x%x, no buffer space, bLen: %llu, bOffset: %u\n", v2, v3, v4, v5, v6);
}

@end