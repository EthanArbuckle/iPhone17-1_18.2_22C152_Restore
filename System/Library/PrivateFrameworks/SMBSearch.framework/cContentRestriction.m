@interface cContentRestriction
- (NSData)pwcsPhrase;
- (NSString)phraseStr;
- (cContentRestriction)initWithMethod:(int)a3 Weight:(unsigned int)a4;
- (fullPropSpec)propSpec;
- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (int)genMethod;
- (int)restrictId;
- (int)restrictionNumber;
- (int)setPhrase:(id)a3;
- (unsigned)charCount;
- (unsigned)lcid;
- (unsigned)ulType;
- (unsigned)weight;
- (void)setCharCount:(unsigned int)a3;
- (void)setGenMethod:(int)a3;
- (void)setLcid:(unsigned int)a3;
- (void)setPhraseStr:(id)a3;
- (void)setPropSpec:(id)a3;
- (void)setPwcsPhrase:(id)a3;
- (void)setRestrictId:(int)a3;
- (void)setUlType:(unsigned int)a3;
- (void)setWeight:(unsigned int)a3;
@end

@implementation cContentRestriction

- (cContentRestriction)initWithMethod:(int)a3 Weight:(unsigned int)a4
{
  v15.receiver = self;
  v15.super_class = (Class)cContentRestriction;
  v6 = [(cContentRestriction *)&v15 init];
  v7 = v6;
  if (v6)
  {
    v6->ulType = 4;
    propSpec = v6->_propSpec;
    v6->_propSpec = 0;

    v7->_charCount = 0;
    pwcsPhrase = v7->_pwcsPhrase;
    v7->_pwcsPhrase = 0;

    phraseStr = v7->_phraseStr;
    v7->_phraseStr = 0;

    v7->_genMethod = a3;
    v7->weight = a4;
    v11 = (void *)MEMORY[0x263EFF960];
    v12 = [MEMORY[0x263EFF960] currentLocale];
    v13 = [v12 localeIdentifier];
    v7->_lcid = [v11 windowsLocaleCodeFromLocaleIdentifier:v13];
  }
  return v7;
}

- (int)restrictionNumber
{
  return 2;
}

- (int)setPhrase:(id)a3
{
  unsigned int v8 = 0;
  id v4 = a3;
  [(cContentRestriction *)self setPhraseStr:v4];
  utf8_to_utf16le_data(v4, &v8, 0);
  v5 = (NSData *)objc_claimAutoreleasedReturnValue();

  pwcsPhrase = self->_pwcsPhrase;
  self->_pwcsPhrase = v5;

  if (!self->_pwcsPhrase) {
    return 12;
  }
  int result = 0;
  self->_charCount = v8;
  return result;
}

- (int)encodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  id v8 = a3;
  unsigned int v31 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cContentRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.9();
    }
    goto LABEL_7;
  }
  unint64_t v10 = v9 - a4;
  id v11 = v8;
  uint64_t v12 = [v11 bytes];
  if (v10 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cContentRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  uint64_t v15 = v12;
  *(_DWORD *)(v12 + a4) = self->ulType;
  if (v10 - 4 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[cContentRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_7;
  }
  *(_DWORD *)(v12 + a4 + 4) = self->weight;
  unsigned int v16 = a4 + 8;
  v17 = [(cContentRestriction *)self propSpec];
  int v13 = [v17 encodeBuffer:v11 BufferOffset:a4 + 8 BytesWritten:&v31];

  if (!v13)
  {
    unsigned int v18 = v31;
    unint64_t v19 = v10 - v31 - 8;
    if (v19 > 3)
    {
      unsigned int v20 = v31 + v16;
      *(_DWORD *)(v15 + v20) = self->_charCount;
      unint64_t v21 = v19 - 4;
      unsigned int v22 = [(NSData *)self->_pwcsPhrase length];
      unsigned int v23 = v22;
      if (v21 >= v22)
      {
        uint64_t v24 = v22;
        uint64_t v25 = v20 + 4;
        unsigned int v26 = v18 + v22;
        memcpy((void *)(v15 + v25), [(NSData *)self->_pwcsPhrase bytes], v22);
        unsigned int v27 = v26 + 12;
        unsigned int v28 = v25 + v23;
        unint64_t v29 = v21 - v24;
        unsigned int v30 = align4Pad(v28);
        if (v30)
        {
          if (v29 < v30)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[cContentRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.7();
            }
            goto LABEL_7;
          }
          v27 += v30;
          v28 += v30;
          v29 -= v30;
        }
        if (v29 > 3)
        {
          *(_DWORD *)(v15 + v28) = self->_lcid;
          if (v29 - 4 > 3)
          {
            int v13 = 0;
            *(_DWORD *)(v15 + v28 + 4) = self->_genMethod;
            *a5 = v27 + 8;
            goto LABEL_8;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[cContentRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.6();
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          -[cContentRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.5();
        }
        goto LABEL_7;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[cContentRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.4();
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      -[cContentRestriction encodeBuffer:BufferOffset:BytesWritten:]();
    }
LABEL_7:
    int v13 = 12;
    goto LABEL_8;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[cContentRestriction encodeBuffer:BufferOffset:BytesWritten:].cold.8();
  }
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

- (fullPropSpec)propSpec
{
  return (fullPropSpec *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPropSpec:(id)a3
{
}

- (unsigned)charCount
{
  return self->_charCount;
}

- (void)setCharCount:(unsigned int)a3
{
  self->_charCount = a3;
}

- (NSData)pwcsPhrase
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPwcsPhrase:(id)a3
{
}

- (NSString)phraseStr
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPhraseStr:(id)a3
{
}

- (unsigned)lcid
{
  return self->_lcid;
}

- (void)setLcid:(unsigned int)a3
{
  self->_lcid = a3;
}

- (int)genMethod
{
  return self->_genMethod;
}

- (void)setGenMethod:(int)a3
{
  self->_genMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phraseStr, 0);
  objc_storeStrong((id *)&self->_pwcsPhrase, 0);

  objc_storeStrong((id *)&self->_propSpec, 0);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cContentRestriction:encodeBuffer: no buffer space for ulType, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.2()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cContentRestriction:encodeBuffer: no buffer space for weight, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cContentRestriction:encodeBuffer: no buffer space for CharCount, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cContentRestriction:encodeBuffer: no buffer space for Phrase, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cContentRestriction:encodeBuffer: no buffer space for lcid, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cContentRestriction:encodeBuffer: no buffer space for Method field, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.7()
{
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8(&dword_235F82000, &_os_log_internal, v0, "cContentRestriction:encodeBuffer: no buffer space to align LCID, sizeAvail: %llu\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.8()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "cContentRestriction:encodeBuffer: encode propSpec error: %d\n", v1, v2, v3, v4, v5);
}

- (void)encodeBuffer:BufferOffset:BytesWritten:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "cContentRestriction:encodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end