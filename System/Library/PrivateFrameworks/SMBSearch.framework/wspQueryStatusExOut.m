@interface wspQueryStatusExOut
- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5;
- (unsigned)cDocumentsToFilter;
- (unsigned)cFilteredDocuments;
- (unsigned)cResultsFound;
- (unsigned)cRowsTotal;
- (unsigned)dwRatioFinishedDenominator;
- (unsigned)dwRatioFinishedNumerator;
- (unsigned)maxRank;
- (unsigned)qStatus;
- (unsigned)rowsetBookMark;
- (unsigned)whereID;
- (void)setCDocumentsToFilter:(unsigned int)a3;
- (void)setCFilteredDocuments:(unsigned int)a3;
- (void)setCResultsFound:(unsigned int)a3;
- (void)setCRowsTotal:(unsigned int)a3;
- (void)setDwRatioFinishedDenominator:(unsigned int)a3;
- (void)setDwRatioFinishedNumerator:(unsigned int)a3;
- (void)setMaxRank:(unsigned int)a3;
- (void)setQStatus:(unsigned int)a3;
- (void)setRowsetBookMark:(unsigned int)a3;
- (void)setWhdr:(id)a3;
- (void)setWhereID:(unsigned int)a3;
- (wspHeader)whdr;
- (wspQueryStatusExOut)init;
@end

@implementation wspQueryStatusExOut

- (wspQueryStatusExOut)init
{
  v7.receiver = self;
  v7.super_class = (Class)wspQueryStatusExOut;
  v2 = [(wspQueryStatusExOut *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_qStatus = 0;
    v4 = objc_alloc_init(wspHeader);
    whdr = v3->_whdr;
    v3->_whdr = v4;

    if (!v3->_whdr)
    {

      return 0;
    }
  }
  return v3;
}

- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesDecoded:(unsigned int *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  unsigned int v25 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:]4();
    }
    int v13 = 12;
  }
  else
  {
    id v10 = v8;
    uint64_t v11 = [v10 bytes];
    v12 = [(wspQueryStatusExOut *)self whdr];
    int v13 = [v12 decodeBuffer:v10 BufferOffset:v6 BytesDecoded:&v25];

    if (v13)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:]3();
      }
      unsigned int v14 = v25;
      goto LABEL_6;
    }
    uint64_t v16 = v25;
    v17 = [(wspQueryStatusExOut *)self whdr];
    int v18 = [v17 msgid];

    if (v18 == 231)
    {
      v19 = [(wspQueryStatusExOut *)self whdr];
      int v20 = [v19 status];

      if (!v20)
      {
        unsigned int v21 = v16 + v6;
        unint64_t v22 = v9 - v6 - v16;
        if (v22 > 3)
        {
          [(wspQueryStatusExOut *)self setQStatus:*(unsigned int *)(v11 + v21)];
          v25 += 4;
          unint64_t v23 = v22 & 0xFFFFFFFFFFFFFFFCLL;
          if (v23 == 4)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:]();
            }
          }
          else
          {
            [(wspQueryStatusExOut *)self setCFilteredDocuments:*(unsigned int *)(v11 + v21 + 4)];
            v25 += 4;
            if (v23 == 8)
            {
              if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:]();
              }
            }
            else
            {
              [(wspQueryStatusExOut *)self setCDocumentsToFilter:*(unsigned int *)(v11 + v21 + 8)];
              v25 += 4;
              if (v23 == 12)
              {
                if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                  -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.4();
                }
              }
              else
              {
                [(wspQueryStatusExOut *)self setDwRatioFinishedDenominator:*(unsigned int *)(v11 + v21 + 12)];
                v25 += 4;
                if (v23 == 16)
                {
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                    -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.5();
                  }
                }
                else
                {
                  [(wspQueryStatusExOut *)self setDwRatioFinishedNumerator:*(unsigned int *)(v11 + v21 + 16)];
                  v25 += 4;
                  if (v23 == 20)
                  {
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                      -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.6();
                    }
                  }
                  else
                  {
                    [(wspQueryStatusExOut *)self setRowsetBookMark:*(unsigned int *)(v11 + v21 + 20)];
                    v25 += 4;
                    if (v23 == 24)
                    {
                      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                        -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.7();
                      }
                    }
                    else
                    {
                      [(wspQueryStatusExOut *)self setCRowsTotal:*(unsigned int *)(v11 + v21 + 24)];
                      v25 += 4;
                      if (v23 == 28)
                      {
                        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                          -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.8();
                        }
                      }
                      else
                      {
                        [(wspQueryStatusExOut *)self setMaxRank:*(unsigned int *)(v11 + v21 + 28)];
                        v25 += 4;
                        if (v23 == 32)
                        {
                          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                            -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:].cold.9();
                          }
                        }
                        else
                        {
                          [(wspQueryStatusExOut *)self setCResultsFound:*(unsigned int *)(v11 + v21 + 32)];
                          v25 += 4;
                          unsigned int v24 = v21 + 36;
                          if (v23 != 36)
                          {
                            [(wspQueryStatusExOut *)self setWhereID:*(unsigned int *)(v11 + v24)];
                            int v13 = 0;
                            unsigned int v14 = v25 + 4;
                            v25 += 4;
LABEL_6:
                            *a5 = v14;
                            goto LABEL_10;
                          }
                          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
                            -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:]0();
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:]();
        }
        int v13 = 55;
        goto LABEL_10;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:]1(self);
      }
      int v13 = 0;
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspQueryStatusExOut decodeBuffer:BufferOffset:BytesDecoded:]2(self);
      }
      int v13 = 5;
    }
  }
LABEL_10:

  return v13;
}

- (wspHeader)whdr
{
  return (wspHeader *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWhdr:(id)a3
{
}

- (unsigned)qStatus
{
  return self->_qStatus;
}

- (void)setQStatus:(unsigned int)a3
{
  self->_qStatus = a3;
}

- (unsigned)cFilteredDocuments
{
  return self->_cFilteredDocuments;
}

- (void)setCFilteredDocuments:(unsigned int)a3
{
  self->_cFilteredDocuments = a3;
}

- (unsigned)cDocumentsToFilter
{
  return self->_cDocumentsToFilter;
}

- (void)setCDocumentsToFilter:(unsigned int)a3
{
  self->_cDocumentsToFilter = a3;
}

- (unsigned)dwRatioFinishedDenominator
{
  return self->_dwRatioFinishedDenominator;
}

- (void)setDwRatioFinishedDenominator:(unsigned int)a3
{
  self->_dwRatioFinishedDenominator = a3;
}

- (unsigned)dwRatioFinishedNumerator
{
  return self->_dwRatioFinishedNumerator;
}

- (void)setDwRatioFinishedNumerator:(unsigned int)a3
{
  self->_dwRatioFinishedNumerator = a3;
}

- (unsigned)rowsetBookMark
{
  return self->_rowsetBookMark;
}

- (void)setRowsetBookMark:(unsigned int)a3
{
  self->_rowsetBookMark = a3;
}

- (unsigned)cRowsTotal
{
  return self->_cRowsTotal;
}

- (void)setCRowsTotal:(unsigned int)a3
{
  self->_cRowsTotal = a3;
}

- (unsigned)maxRank
{
  return self->_maxRank;
}

- (void)setMaxRank:(unsigned int)a3
{
  self->_maxRank = a3;
}

- (unsigned)cResultsFound
{
  return self->_cResultsFound;
}

- (void)setCResultsFound:(unsigned int)a3
{
  self->_cResultsFound = a3;
}

- (unsigned)whereID
{
  return self->_whereID;
}

- (void)setWhereID:(unsigned int)a3
{
  self->_whereID = a3;
}

- (void).cxx_destruct
{
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode qStatus, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode cFilteredDocuments, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode cDocumentsToFilter, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode dwRatioFinishedDenominator, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode dwRatioFinishedNumerator, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode rowsetBookMark, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode cRowsTotal, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode maxRank, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.9()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode cResultsFound, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.10()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: out of buffer to decode whereID, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.11(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 msgid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspQueryStatusExOut:decodeBuffer: hdr status: 0x%x\n", v3, v4, v5, v6, v7);
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesDecoded:.cold.12(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 msgid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspQueryStatusExOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v3, v4, v5, v6, v7);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: Failed to decode wsp header, error: %d\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesDecoded:.cold.14()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspQueryStatusExOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end