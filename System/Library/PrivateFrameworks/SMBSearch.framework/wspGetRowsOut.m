@interface wspGetRowsOut
- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5;
- (searchResults)results;
- (unsigned)rowsReturned;
- (void)setResults:(id)a3;
- (void)setRowsReturned:(unsigned int)a3;
- (void)setWctx:(id)a3;
- (void)setWhdr:(id)a3;
- (wspContext)wctx;
- (wspGetRowsOut)initWithCtx:(id)a3;
- (wspHeader)whdr;
@end

@implementation wspGetRowsOut

- (wspGetRowsOut)initWithCtx:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)wspGetRowsOut;
  v6 = [(wspGetRowsOut *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_wctx, a3);
    v8 = objc_alloc_init(wspHeader);
    whdr = v7->_whdr;
    v7->_whdr = v8;

    if (v7->_whdr
      && (v10 = objc_alloc_init(searchResults),
          results = v7->_results,
          v7->_results = v10,
          results,
          v7->_results))
    {
      v7->_rowsReturned = 0;
    }
    else
    {

      v7 = 0;
    }
  }

  return v7;
}

- (int)decodeBuffer:(id)a3 BufferOffset:(unsigned int)a4 BytesWritten:(unsigned int *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v162 = *MEMORY[0x263EF8340];
  id v8 = a3;
  unsigned int v157 = 0;
  unint64_t v9 = [v8 length];
  if (v9 <= v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]4();
    }
    int v13 = 12;
    goto LABEL_9;
  }
  id v10 = v8;
  uint64_t v11 = [v10 bytes];
  v12 = [(wspGetRowsOut *)self whdr];
  int v13 = [v12 decodeBuffer:v10 BufferOffset:v6 BytesDecoded:&v157];

  if (v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]3();
    }
    *a5 = v157;
    goto LABEL_9;
  }
  uint64_t v15 = v157;
  v16 = [(wspGetRowsOut *)self whdr];
  int v17 = [v16 msgid];

  if (v17 != 204)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]2(self);
    }
LABEL_16:
    int v13 = 5;
    goto LABEL_9;
  }
  v18 = [(wspGetRowsOut *)self whdr];
  int v19 = [v18 status];

  if (v19)
  {
    v20 = [(wspGetRowsOut *)self whdr];
    if ([v20 status] == 265926)
    {
    }
    else
    {
      v21 = [(wspGetRowsOut *)self whdr];
      v155 = a5;
      int v22 = [v21 status];

      BOOL v23 = v22 == 265933;
      a5 = v155;
      if (!v23)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]1(self);
        }
        goto LABEL_30;
      }
    }
  }
  unsigned int v24 = v15 + v6;
  unint64_t v25 = v9 - v6 - v15;
  if (v25 <= 3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_34;
  }
  v156 = a5;
  int v26 = v15 + v6;
  uint64_t v27 = *(unsigned int *)(v11 + v24);
  [(wspGetRowsOut *)self setRowsReturned:v27];
  v28 = [(wspGetRowsOut *)self wctx];
  objc_msgSend(v28, "setRowsSoFar:", objc_msgSend(v28, "rowsSoFar") + v27);

  v157 += 4;
  if (![(wspGetRowsOut *)self rowsReturned])
  {
    BOOL v30 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
    if (v30) {
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:](v30, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_30;
  }
  int v153 = v26;
  unint64_t v29 = v25 & 0xFFFFFFFFFFFFFFFCLL;
  if ((v25 & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]();
    }
    goto LABEL_34;
  }
  int v39 = *(_DWORD *)(v11 + (v26 + 4));
  unsigned int v40 = v157;
  v157 += 4;
  if (v29 == 8)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.4();
    }
    goto LABEL_34;
  }
  unsigned int v157 = v40 + 8;
  unsigned int v41 = v26 + 12;
  switch(v39)
  {
    case 0:
      uint64_t v148 = v11;
      BOOL v42 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v42) {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]4(v42, v43, v44, v45, v46, v47, v48, v49);
      }
      v50 = [(wspGetRowsOut *)self wctx];
      [v50 setSeekBookmarkOffset:4294967292];

      v51 = [(wspGetRowsOut *)self wctx];
      uint64_t v52 = [v51 rowsSoFar];
      v53 = [(wspGetRowsOut *)self wctx];
      [v53 setSeekSkip:v52];

      goto LABEL_88;
    case 1:
      unint64_t v54 = v25 - 12;
      uint64_t v148 = v11;
      BOOL v55 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v55) {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]6(v55, v56, v57, v58, v59, v60, v61, v62);
      }
      v63 = v156;
      if (v54 > 3)
      {
        v157 += 4;
        goto LABEL_89;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]5();
      }
      goto LABEL_34;
    case 2:
      unint64_t v64 = v25 - 12;
      BOOL v65 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v65) {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]0(v65, v66, v67, v68, v69, v70, v71, v72);
      }
      if (v64 > 3)
      {
        uint64_t v90 = *(unsigned int *)(v11 + v41);
        v91 = [(wspGetRowsOut *)self wctx];
        [v91 setSeekBookmarkOffset:v90];

        v157 += 4;
        if (v29 == 16)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]8();
          }
        }
        else
        {
          uint64_t v97 = *(unsigned int *)(v11 + (v153 + 16));
          v98 = [(wspGetRowsOut *)self wctx];
          [v98 setSeekSkip:v97];

          unsigned int v99 = v157;
          v157 += 4;
          if (v29 != 20)
          {
            uint64_t v148 = v11;
            unsigned int v101 = v99 + 8;
            goto LABEL_87;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]9();
          }
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]7();
      }
      goto LABEL_34;
    case 3:
      unint64_t v73 = v25 - 12;
      BOOL v74 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v74) {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]4(v74, v75, v76, v77, v78, v79, v80, v81);
      }
      if (v73 <= 3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]1();
        }
        goto LABEL_34;
      }
      unsigned int v92 = v157;
      v157 += 4;
      if (v29 == 16)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]2();
        }
        goto LABEL_34;
      }
      unsigned int v157 = v92 + 8;
      if (v29 == 20)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]3();
        }
        goto LABEL_34;
      }
      uint64_t v148 = v11;
      unsigned int v101 = v92 + 12;
LABEL_87:
      unsigned int v157 = v101;
LABEL_88:
      v63 = v156;
      goto LABEL_89;
    case 4:
      BOOL v82 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
      if (v82) {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]0(v82, v83, v84, v85, v86, v87, v88, v89);
      }
      if (v25 - 12 <= 3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]5();
        }
        goto LABEL_34;
      }
      int v93 = *(_DWORD *)(v11 + v41);
      unsigned int v94 = v157 + 4;
      v157 += 4;
      unsigned int v95 = v153 + 16;
      unint64_t v96 = v25 - 16;
      if (v93)
      {
        while (v96 > 3)
        {
          v94 += 4;
          unsigned int v157 = v94;
          v95 += 4;
          v96 -= 4;
          if (!--v93) {
            goto LABEL_71;
          }
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]9();
        }
LABEL_34:
        int v13 = 55;
        goto LABEL_9;
      }
LABEL_71:
      if (v96 <= 3)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        goto LABEL_73;
      }
      uint64_t v148 = v11;
      int v100 = *(_DWORD *)(v11 + v95);
      unsigned int v157 = v94 + 4;
      if ((v96 & 0xFFFFFFFFFFFFFFFCLL) == 4)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
LABEL_73:
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]6();
        goto LABEL_34;
      }
      unsigned int v157 = v94 + 8;
      v63 = v156;
      if (v100)
      {
        unint64_t v142 = v96 - 8;
        unsigned int v143 = v95 + 8;
        unsigned int v144 = v94 + 12;
        while (v142 > 3)
        {
          unsigned int v157 = v144;
          v143 += 4;
          v142 -= 4;
          v144 += 4;
          if (!--v100) {
            goto LABEL_89;
          }
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]8();
        }
        goto LABEL_34;
      }
LABEL_89:
      if (![(wspGetRowsOut *)self rowsReturned])
      {
        v103 = 0;
        v139 = 0;
LABEL_109:
        unsigned int *v63 = v157;

LABEL_30:
        int v13 = 0;
        goto LABEL_9;
      }
      v154 = 0;
      v103 = 0;
      v104 = 0;
      unsigned int v146 = 0;
      unsigned int v150 = v6 + 40;
      unint64_t v105 = 0x264C97000uLL;
      *(void *)&long long v102 = 67109376;
      long long v145 = v102;
LABEL_91:
      v106 = v104;
      context = (void *)MEMORY[0x237DFA610]();
      id v107 = objc_alloc_init(*(Class *)(v105 + 1760));

      v149 = v107;
      if (!v107)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.6();
        }
        int v13 = 12;
        goto LABEL_140;
      }
      unsigned int v108 = 0;
      uint64_t v152 = v148 + v150;
      v151 = v103;
      while (1)
      {
        v109 = [(wspGetRowsOut *)self wctx];
        v110 = [v109 pidMap];
        v111 = [v110 colTableArr];
        unint64_t v112 = [v111 count];

        if (v112 <= v108)
        {
          v103 = v151;
          v104 = v149;
          v133 = [v149 columns];
          uint64_t v134 = [v133 count];

          if (v134)
          {
            v135 = [(wspGetRowsOut *)self results];
            v136 = [v135 rows];
            [v136 addObject:v149];

            v137 = [(wspGetRowsOut *)self wctx];
            v138 = [v137 pidMap];
            v150 += [v138 rowLength];

            ++v146;
            v63 = v156;
            unint64_t v105 = 0x264C97000;
            if (v146 < [(wspGetRowsOut *)self rowsReturned]) {
              goto LABEL_91;
            }

            v139 = v154;
            goto LABEL_109;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]3();
          }
          int v13 = 5;
LABEL_140:
          v140 = context;
          v141 = v149;
          goto LABEL_131;
        }
        int v113 = v108;
        v114 = [(wspGetRowsOut *)self wctx];
        v115 = [v114 pidMap];
        v116 = [v115 colTableArr];
        v117 = [v116 objectAtIndex:v108];

        unsigned int v118 = [v117 statusOffset];
        unsigned int v119 = [v117 lengthOffset];
        v154 = v117;
        uint64_t v120 = [v117 valueOffset];
        if (v9 < v150 + 1 + v118)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.7();
          }
          int v13 = 55;
LABEL_116:
          v140 = context;
          v141 = v149;
LABEL_120:
          v103 = v151;
          goto LABEL_131;
        }
        int v121 = *(unsigned __int8 *)(v152 + v118);
        if (!v121) {
          break;
        }
        int v122 = v113;
        if (v121 != 2)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.8(v121, v146, v113);
          }
          int v13 = 5;
          goto LABEL_116;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v145;
          unsigned int v159 = v146;
          __int16 v160 = 1024;
          int v161 = v113;
          _os_log_debug_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, colStatus: StoreStatusNull\n", buf, 0xEu);
        }
LABEL_104:
        unsigned int v108 = v122 + 1;
      }
      int v122 = v113;
      if (v9 < v150 + 4 + v119)
      {
        v141 = v149;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.9();
        }
        int v13 = 55;
        v140 = context;
        goto LABEL_120;
      }
      uint64_t v123 = v120;
      uint64_t v124 = *(unsigned int *)(v152 + v119);
      v125 = objc_alloc_init(rowVariant);
      if (!v125)
      {
        v140 = context;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]0();
        }
        goto LABEL_126;
      }
      v126 = [(wspGetRowsOut *)self wctx];
      int v127 = -[rowVariant decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:](v125, "decodeBuffer:BaseOffset:RowStart:ValueOffset:ValueLen:Use64bit:", v10, v6, v150, v123, v124, [v126 supports64BitOffsets]);

      if (v127)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]2();
        }
        v140 = context;
LABEL_126:
        v141 = v149;
        v103 = v151;
        goto LABEL_130;
      }
      v128 = [searchColumn alloc];
      v129 = [v154 propSpec];
      v130 = -[searchColumn initWithPropertyNumber:RVariant:](v128, "initWithPropertyNumber:RVariant:", [v129 propNumber], v125);

      if (v130)
      {
        v131 = [v149 columns];
        v132 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[searchColumn propNumber](v130, "propNumber"));
        [v131 setObject:v130 forKey:v132];

        v151 = v130;
        goto LABEL_104;
      }
      v141 = v149;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:]1();
      }
      v103 = 0;
      v140 = context;
LABEL_130:

      int v13 = 12;
LABEL_131:

LABEL_9:
      return v13;
    default:
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        -[wspGetRowsOut decodeBuffer:BufferOffset:BytesWritten:].cold.5();
      }
      goto LABEL_16;
  }
}

- (wspHeader)whdr
{
  return (wspHeader *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWhdr:(id)a3
{
}

- (wspContext)wctx
{
  return (wspContext *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWctx:(id)a3
{
}

- (unsigned)rowsReturned
{
  return self->_rowsReturned;
}

- (void)setRowsReturned:(unsigned int)a3
{
  self->_rowsReturned = a3;
}

- (searchResults)results
{
  return (searchResults *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_wctx, 0);

  objc_storeStrong((id *)&self->_whdr, 0);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode cRowsReturned, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eType, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode chapter, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.5()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: unknown seek description: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.6()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: row: %u, no memory for new searchRow\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: field Status: Out of buffer row: %u, col: %u, field: Status\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(unsigned __int8)a1 BufferOffset:(int)a2 BytesWritten:(int)a3 .cold.8(unsigned __int8 a1, int a2, int a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3[0] = 67109632;
  v3[1] = a2;
  __int16 v4 = 1024;
  int v5 = a3;
  __int16 v6 = 1024;
  int v7 = a1;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, colStatus: 0x%x\n", (uint8_t *)v3, 0x14u);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: field Status: Out of buffer row: %u, col: %u, field: Length\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.10()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, no memory for rowVariant\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.11()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, no memory for new searchColumn\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.12()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  __int16 v3 = v0;
  int v4 = v1;
  _os_log_error_impl(&dword_235F82000, &_os_log_internal, OS_LOG_TYPE_ERROR, "wspGetRowsOut:decodeBuffer: row: %u, col: %u, rowVariant decodeBuffer error: %d\n", v2, 0x14u);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.13()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: row: %u is empty, no columns were decoded\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.15()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowsSeekNext:cskip, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.17()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAt:bmkOffset, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.18()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAt:cskip, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.19()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAt:hregion, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.21()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAtRatio:ulNumerator, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.22()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAtRatio:ulDenominator, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.23()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekAtRatio:hregion, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.25()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekByBookmark:cBookMarks, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.26()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekByBookmark:maxRet, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.28()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekByBookmark:HRESULT, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.29()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: out of buffer to decode eRowSeekByBookmark:aBookMark, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:(uint64_t)a3 BufferOffset:(uint64_t)a4 BytesWritten:(uint64_t)a5 .cold.30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.31(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 msgid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspGetRowsOut:decodeBuffer: hdr status: 0x%x\n", v3, v4, v5, v6, v7);
}

- (void)decodeBuffer:(void *)a1 BufferOffset:BytesWritten:.cold.32(void *a1)
{
  uint64_t v1 = [a1 whdr];
  [v1 msgid];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v2, "wspGetRowsOut:decodeBuffer: Unexpected MsgId: 0x%x\n", v3, v4, v5, v6, v7);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.33()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: Failed to decode wsp header, error: %d\n", v1, v2, v3, v4, v5);
}

- (void)decodeBuffer:BufferOffset:BytesWritten:.cold.34()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4(&dword_235F82000, &_os_log_internal, v0, "wspGetRowsOut:decodeBuffer: no buffer space, bLen: %llu, bOffset: %u\n", v1, v2, v3, v4, v5);
}

@end