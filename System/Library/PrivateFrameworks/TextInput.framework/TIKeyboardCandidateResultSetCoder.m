@interface TIKeyboardCandidateResultSetCoder
+ (Class)classFromCandidateType:(int)a3;
+ (id)candidateTypeToClassNameMap;
+ (id)decodeWithData:(id)a3;
+ (id)encodeWithCandidateResultSet:(id)a3;
- (BOOL)decodeBool;
- (BOOL)isDecoding;
- (BOOL)offsetHasPassedEndOfData;
- (NSData)data;
- (NSMutableData)mutableData;
- (TIKeyboardCandidateResultSetCoder)initWithData:(id)a3 mutableData:(id)a4;
- (const)bytes;
- (const)currentPosition;
- (double)decodeDouble;
- (id)candidateResultSet;
- (id)dataFromCandidateResultSet:(id)a3;
- (id)decodeCandidate;
- (id)decodePointerValueArray;
- (id)decodeString;
- (id)decodeStringArray;
- (id)initForDecodingWithData:(id)a3;
- (id)initForEncoding;
- (unint64_t)decodeUInt64;
- (unint64_t)offset;
- (unsigned)decodeByte;
- (unsigned)decodeShort;
- (unsigned)decodeUInt32;
- (void)encodeByte:(unsigned __int8)a3;
- (void)encodeDouble:(double)a3;
- (void)encodePointerValueArray:(id)a3;
- (void)encodeShort:(unsigned __int16)a3;
- (void)encodeString:(id)a3;
- (void)encodeStringArray:(id)a3;
- (void)encodeUInt32:(unsigned int)a3;
- (void)encodeUInt64:(unint64_t)a3;
- (void)readNumberOfBytes:(unint64_t)a3 into:(void *)a4;
- (void)setData:(id)a3;
- (void)setMutableData:(id)a3;
- (void)setOffset:(unint64_t)a3;
- (void)setOffsetHasPassedEndOfData:(BOOL)a3;
@end

@implementation TIKeyboardCandidateResultSetCoder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);

  objc_storeStrong((id *)&self->_mutableData, 0);
}

- (void)setOffsetHasPassedEndOfData:(BOOL)a3
{
  self->_offsetHasPassedEndOfData = a3;
}

- (BOOL)offsetHasPassedEndOfData
{
  return self->_offsetHasPassedEndOfData;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setData:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setMutableData:(id)a3
{
}

- (NSMutableData)mutableData
{
  return self->_mutableData;
}

- (id)candidateResultSet
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v3 = objc_alloc_init(TIKeyboardCandidateResultSet);
  v4 = [(TIKeyboardCandidateResultSetCoder *)self data];
  unint64_t v5 = [v4 length];

  if (v5 <= 0x38)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x1E4F14500];
      v7 = "TIKeyboardCandidateResultSet cannot be decoded : size of header is bigger than the data being decoded";
      uint32_t v8 = 2;
LABEL_59:
      _os_log_error_impl(&dword_18D240000, v6, OS_LOG_TYPE_ERROR, v7, buf, v8);
      goto LABEL_70;
    }
    goto LABEL_70;
  }
  id v9 = [(TIKeyboardCandidateResultSetCoder *)self data];
  v10 = (unsigned int *)[v9 bytes];

  if (*v10 == -1) {
    uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v11 = *v10;
  }
  [(TIKeyboardCandidateResultSet *)v3 setInitialSelectedIndex:v11];
  [(TIKeyboardCandidateResultSet *)v3 setGeneratedCandidateCount:*(unsigned int *)((char *)v10 + 13)];
  [(TIKeyboardCandidateResultSet *)v3 setBatchCandidateLocation:*(unsigned int *)((char *)v10 + 17)];
  if (*(unsigned int *)((char *)v10 + 53) == -1) {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v12 = *(unsigned int *)((char *)v10 + 53);
  }
  [(TIKeyboardCandidateResultSet *)v3 setSelectedDisambiguationCandidateIndex:v12];
  unint64_t v13 = *(unsigned int *)((char *)v10 + 33);
  if (v13 == -1)
  {
    v17 = 0;
    goto LABEL_21;
  }
  v14 = [(TIKeyboardCandidateResultSetCoder *)self data];
  unint64_t v15 = [v14 length];

  if (v15 > v13)
  {
    [(TIKeyboardCandidateResultSetCoder *)self setOffset:*(unsigned int *)((char *)v10 + 33)];
    uint64_t v16 = *(unsigned int *)((char *)v10 + 9);
    v17 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v16];
    if (v16)
    {
      do
      {
        v18 = [(TIKeyboardCandidateResultSetCoder *)self decodeCandidate];
        if (v18) {
          [v17 addObject:v18];
        }

        --v16;
      }
      while (v16);
    }
    v19 = objc_msgSend(v17, "subarrayWithRange:", 0, *(unsigned int *)((char *)v10 + 5));
    [(TIKeyboardCandidateResultSet *)v3 setCandidates:v19];

    if (*(unsigned int *)((char *)v10 + 25))
    {
      v20 = [v17 subarrayWithRange:*(unsigned int *)((char *)v10 + 21)];
      [(TIKeyboardCandidateResultSet *)v3 setDisambiguationCandidates:v20];
    }
    if (*((unsigned char *)v10 + 4))
    {
      v21 = [v17 lastObject];
      [(TIKeyboardCandidateResultSet *)v3 setDefaultCandidate:v21];
    }
LABEL_21:
    unint64_t v22 = *(unsigned int *)((char *)v10 + 29);
    v77 = v10;
    if (v22 != -1)
    {
      v23 = [(TIKeyboardCandidateResultSetCoder *)self data];
      unint64_t v24 = [v23 length];

      if (v24 <= v22)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        int v66 = *(unsigned int *)((char *)v10 + 29);
        *(_DWORD *)buf = 67109120;
        int v89 = v66;
        v67 = MEMORY[0x1E4F14500];
        v68 = "TIKeyboardCandidateResultSet cannot be decoded : header sort method group offset [%d] is not within the bo"
              "unds of the data being decoded";
        goto LABEL_68;
      }
      v73 = v3;
      [(TIKeyboardCandidateResultSetCoder *)self setOffset:*(unsigned int *)((char *)v10 + 29)];
      v76 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(unsigned int *)((char *)v10 + 37)];
      v75 = [(TIKeyboardCandidateResultSetCoder *)self decodeStringArray];
      if (*(unsigned int *)((char *)v10 + 37))
      {
        unint64_t v25 = 0;
        do
        {
          unsigned int v26 = [(TIKeyboardCandidateResultSetCoder *)self decodeUInt32];
          uint64_t v27 = v26;
          v28 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v26];
          if (v26)
          {
            uint64_t v29 = 0;
            do
            {
              v30 = objc_alloc_init(TIKeyboardCandidateGroup);
              v31 = [(TIKeyboardCandidateResultSetCoder *)self decodeString];
              [(TIKeyboardCandidateGroup *)v30 setTitle:v31];

              unsigned int v32 = [(TIKeyboardCandidateResultSetCoder *)self decodeUInt32];
              if (v32)
              {
                uint64_t v33 = v32;
                do
                {
                  v34 = objc_msgSend(v17, "objectAtIndex:", -[TIKeyboardCandidateResultSetCoder decodeShort](self, "decodeShort"));
                  [(TIKeyboardCandidateGroup *)v30 addCandidate:v34];

                  --v33;
                }
                while (v33);
              }
              [v28 addObject:v30];

              ++v29;
            }
            while (v29 != v27);
          }
          v35 = [v75 objectAtIndex:v25];
          [v76 setObject:v28 forKey:v35];

          ++v25;
          v10 = v77;
        }
        while (v25 < *(unsigned int *)((char *)v77 + 37));
      }
      v3 = v73;
      [(TIKeyboardCandidateResultSet *)v73 setSortMethodGroups:v76];
    }
    unint64_t v36 = *(unsigned int *)((char *)v10 + 41);
    if (v36 != -1)
    {
      v37 = [(TIKeyboardCandidateResultSetCoder *)self data];
      unint64_t v38 = [v37 length];

      if (v38 <= v36)
      {
        if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_69;
        }
        int v69 = *(unsigned int *)((char *)v10 + 41);
        *(_DWORD *)buf = 67109120;
        int v89 = v69;
        v67 = MEMORY[0x1E4F14500];
        v68 = "TIKeyboardCandidateResultSet cannot be decoded : header sort method offset [%d] is not within the bounds o"
              "f the data being decoded";
        goto LABEL_68;
      }
      [(TIKeyboardCandidateResultSetCoder *)self setOffset:*(unsigned int *)((char *)v10 + 41)];
      v39 = [(TIKeyboardCandidateResultSetCoder *)self decodeStringArray];
      [(TIKeyboardCandidateResultSet *)v3 setSortMethods:v39];
    }
    unint64_t v40 = *(unsigned int *)((char *)v10 + 45);
    if (v40 == -1) {
      goto LABEL_46;
    }
    v41 = [(TIKeyboardCandidateResultSetCoder *)self data];
    unint64_t v42 = [v41 length];

    if (v42 > v40)
    {
      [(TIKeyboardCandidateResultSetCoder *)self setOffset:*(unsigned int *)((char *)v10 + 45)];
      v43 = [(TIKeyboardCandidateResultSetCoder *)self decodeStringArray];
      v44 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v43, "count"));
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id v45 = v43;
      uint64_t v46 = [v45 countByEnumeratingWithState:&v82 objects:v87 count:16];
      if (v46)
      {
        uint64_t v47 = v46;
        uint64_t v48 = *(void *)v83;
        do
        {
          for (uint64_t i = 0; i != v47; ++i)
          {
            if (*(void *)v83 != v48) {
              objc_enumerationMutation(v45);
            }
            uint64_t v50 = *(void *)(*((void *)&v82 + 1) + 8 * i);
            v51 = [(TIKeyboardCandidateResultSetCoder *)self decodeStringArray];
            [v44 setObject:v51 forKey:v50];
          }
          uint64_t v47 = [v45 countByEnumeratingWithState:&v82 objects:v87 count:16];
        }
        while (v47);
      }

      [(TIKeyboardCandidateResultSet *)v3 setIndexTitles:v44];
      v10 = v77;
LABEL_46:
      unint64_t v52 = *(unsigned int *)((char *)v10 + 49);
      if (v52 == -1)
      {
LABEL_56:
        v64 = v3;

        goto LABEL_71;
      }
      v53 = [(TIKeyboardCandidateResultSetCoder *)self data];
      unint64_t v54 = [v53 length];

      if (v54 > v52)
      {
        v74 = v3;
        [(TIKeyboardCandidateResultSetCoder *)self setOffset:*(unsigned int *)((char *)v10 + 49)];
        v55 = [(TIKeyboardCandidateResultSetCoder *)self decodeStringArray];
        v56 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v55, "count"));
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v57 = v55;
        uint64_t v58 = [v57 countByEnumeratingWithState:&v78 objects:v86 count:16];
        if (v58)
        {
          uint64_t v59 = v58;
          uint64_t v60 = *(void *)v79;
          do
          {
            for (uint64_t j = 0; j != v59; ++j)
            {
              if (*(void *)v79 != v60) {
                objc_enumerationMutation(v57);
              }
              uint64_t v62 = *(void *)(*((void *)&v78 + 1) + 8 * j);
              v63 = objc_msgSend(NSNumber, "numberWithBool:", -[TIKeyboardCandidateResultSetCoder decodeByte](self, "decodeByte") != 0);
              [v56 setObject:v63 forKey:v62];
            }
            uint64_t v59 = [v57 countByEnumeratingWithState:&v78 objects:v86 count:16];
          }
          while (v59);
        }

        v3 = v74;
        [(TIKeyboardCandidateResultSet *)v74 setShowExtensionCandidates:v56];

        goto LABEL_56;
      }
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        int v71 = *(unsigned int *)((char *)v10 + 49);
        *(_DWORD *)buf = 67109120;
        int v89 = v71;
        v67 = MEMORY[0x1E4F14500];
        v68 = "TIKeyboardCandidateResultSet cannot be decoded : show extension candidates offset [%d] is not within the b"
              "ounds of the data being decoded";
        goto LABEL_68;
      }
LABEL_69:

      goto LABEL_70;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_69;
    }
    int v70 = *(unsigned int *)((char *)v10 + 45);
    *(_DWORD *)buf = 67109120;
    int v89 = v70;
    v67 = MEMORY[0x1E4F14500];
    v68 = "TIKeyboardCandidateResultSet cannot be decoded : index titles offset [%d] is not within the bounds of the data being decoded";
LABEL_68:
    _os_log_error_impl(&dword_18D240000, v67, OS_LOG_TYPE_ERROR, v68, buf, 8u);
    goto LABEL_69;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    int v65 = *(unsigned int *)((char *)v10 + 33);
    *(_DWORD *)buf = 67109120;
    int v89 = v65;
    v6 = MEMORY[0x1E4F14500];
    v7 = "TIKeyboardCandidateResultSet cannot be decoded : header candidates offset [%d] is not within the bounds of the "
         "data being decoded";
    uint32_t v8 = 8;
    goto LABEL_59;
  }
LABEL_70:
  v64 = 0;
LABEL_71:

  return v64;
}

- (id)dataFromCandidateResultSet:(id)a3
{
  uint64_t v151 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 initialSelectedIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    int v96 = -1;
  }
  else {
    int v96 = [v4 initialSelectedIndex];
  }
  v99 = [v4 defaultCandidate];

  unint64_t v5 = [v4 candidates];
  int v95 = [v5 count];

  int v94 = [v4 generatedCandidateCount];
  int v93 = [v4 batchCandidateLocation];
  v6 = [v4 disambiguationCandidates];
  int v98 = [v6 count];

  v7 = [v4 sortMethodGroups];
  int v97 = [v7 count];

  if ([v4 selectedDisambiguationCandidateIndex] == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v92 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v92 = [v4 selectedDisambiguationCandidateIndex];
  }
  v105 = v4;
  if (v97)
  {
    uint32_t v8 = (void *)MEMORY[0x1E4F1CA48];
    id v9 = [v4 candidates];
    v114 = [v8 arrayWithArray:v9];

    v10 = [v4 candidates];
    uint64_t v11 = [v10 count];

    uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v11];
    unint64_t v13 = 0x1E4F28000uLL;
    v14 = v4;
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        uint64_t v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", i, v92);
        v17 = [v14 candidates];
        v18 = [v17 objectAtIndex:i];
        [v12 setObject:v16 forKey:v18];

        unint64_t v13 = 0x1E4F28000uLL;
      }
    }
    v19 = objc_msgSend(v14, "sortMethodGroups", v92);
    v20 = [v19 allKeys];

    [(TIKeyboardCandidateResultSetCoder *)self encodeStringArray:v20];
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    obuint64_t j = v20;
    id v4 = v14;
    uint64_t v102 = [obj countByEnumeratingWithState:&v140 objects:v150 count:16];
    if (v102)
    {
      uint64_t v101 = *(void *)v141;
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v141 != v101) {
            objc_enumerationMutation(obj);
          }
          uint64_t v103 = v21;
          uint64_t v22 = *(void *)(*((void *)&v140 + 1) + 8 * v21);
          v23 = [v4 sortMethodGroups];
          unint64_t v24 = [v23 objectForKey:v22];

          -[TIKeyboardCandidateResultSetCoder encodeUInt32:](self, "encodeUInt32:", [v24 count]);
          long long v138 = 0u;
          long long v139 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          id v106 = v24;
          uint64_t v110 = [v106 countByEnumeratingWithState:&v136 objects:v149 count:16];
          if (v110)
          {
            uint64_t v108 = *(void *)v137;
            do
            {
              uint64_t v25 = 0;
              do
              {
                if (*(void *)v137 != v108) {
                  objc_enumerationMutation(v106);
                }
                uint64_t v112 = v25;
                unsigned int v26 = *(void **)(*((void *)&v136 + 1) + 8 * v25);
                uint64_t v27 = [v26 title];
                [(TIKeyboardCandidateResultSetCoder *)self encodeString:v27];

                v28 = [v26 candidates];
                -[TIKeyboardCandidateResultSetCoder encodeUInt32:](self, "encodeUInt32:", [v28 count]);

                long long v134 = 0u;
                long long v135 = 0u;
                long long v132 = 0u;
                long long v133 = 0u;
                uint64_t v29 = [v26 candidates];
                uint64_t v30 = [v29 countByEnumeratingWithState:&v132 objects:v148 count:16];
                if (v30)
                {
                  uint64_t v31 = v30;
                  uint64_t v32 = *(void *)v133;
                  do
                  {
                    for (uint64_t j = 0; j != v31; ++j)
                    {
                      if (*(void *)v133 != v32) {
                        objc_enumerationMutation(v29);
                      }
                      uint64_t v34 = *(void *)(*((void *)&v132 + 1) + 8 * j);
                      v35 = [v12 objectForKey:v34];
                      unsigned __int16 v36 = [v35 integerValue];
                      if (!v35)
                      {
                        [v114 addObject:v34];
                        v37 = [*(id *)(v13 + 3792) numberWithUnsignedInteger:v11];
                        [v12 setObject:v37 forKey:v34];

                        unint64_t v13 = 0x1E4F28000;
                        unsigned __int16 v36 = v11++;
                      }
                      [(TIKeyboardCandidateResultSetCoder *)self encodeShort:v36];
                    }
                    uint64_t v31 = [v29 countByEnumeratingWithState:&v132 objects:v148 count:16];
                  }
                  while (v31);
                }

                uint64_t v25 = v112 + 1;
              }
              while (v112 + 1 != v110);
              uint64_t v110 = [v106 countByEnumeratingWithState:&v136 objects:v149 count:16];
            }
            while (v110);
          }

          uint64_t v21 = v103 + 1;
          id v4 = v105;
        }
        while (v103 + 1 != v102);
        uint64_t v102 = [obj countByEnumeratingWithState:&v140 objects:v150 count:16];
      }
      while (v102);
    }

    if (v114)
    {
      id v38 = v114;
      int v115 = 57;
      v113 = v38;
      goto LABEL_39;
    }
    int v39 = 57;
  }
  else
  {
    int v39 = -1;
  }
  int v115 = v39;
  objc_msgSend(v4, "candidates", v92);
  id v38 = (id)objc_claimAutoreleasedReturnValue();
  v113 = 0;
LABEL_39:
  int v111 = [v38 count];
  int v40 = v98 + [v38 count];
  if (v99) {
    ++v40;
  }
  int v109 = v40;
  if (v40)
  {
    v41 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
    int v107 = [v41 length];

    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id v42 = v38;
    uint64_t v43 = [v42 countByEnumeratingWithState:&v128 objects:v147 count:16];
    if (v43)
    {
      uint64_t v44 = v43;
      uint64_t v45 = *(void *)v129;
      do
      {
        for (uint64_t k = 0; k != v44; ++k)
        {
          if (*(void *)v129 != v45) {
            objc_enumerationMutation(v42);
          }
          [*(id *)(*((void *)&v128 + 1) + 8 * k) encodeWithCandidateResultSetCoder:self];
        }
        uint64_t v44 = [v42 countByEnumeratingWithState:&v128 objects:v147 count:16];
      }
      while (v44);
    }

    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    uint64_t v47 = [v105 disambiguationCandidates];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v124 objects:v146 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v125;
      do
      {
        for (uint64_t m = 0; m != v49; ++m)
        {
          if (*(void *)v125 != v50) {
            objc_enumerationMutation(v47);
          }
          [*(id *)(*((void *)&v124 + 1) + 8 * m) encodeWithCandidateResultSetCoder:self];
        }
        uint64_t v49 = [v47 countByEnumeratingWithState:&v124 objects:v146 count:16];
      }
      while (v49);
    }

    id v4 = v105;
    unint64_t v52 = [v105 defaultCandidate];

    if (v52)
    {
      v53 = [v105 defaultCandidate];
      [v53 encodeWithCandidateResultSetCoder:self];
    }
  }
  else
  {
    int v107 = -1;
  }
  unint64_t v54 = [v4 sortMethods];
  v55 = v4;
  uint64_t v56 = [v54 count];

  if (v56)
  {
    id v57 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
    int v104 = [v57 length];

    uint64_t v58 = [v55 sortMethods];
    [(TIKeyboardCandidateResultSetCoder *)self encodeStringArray:v58];
  }
  else
  {
    int v104 = -1;
  }
  uint64_t v59 = v55;
  uint64_t v60 = [v55 indexTitles];
  uint64_t v61 = [v60 count];

  if (v61)
  {
    uint64_t v62 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
    int v63 = [v62 length];

    v64 = [v55 indexTitles];
    int v65 = [v64 allKeys];
    [(TIKeyboardCandidateResultSetCoder *)self encodeStringArray:v65];

    long long v122 = 0u;
    long long v123 = 0u;
    long long v120 = 0u;
    long long v121 = 0u;
    int v66 = [v55 indexTitles];
    uint64_t v67 = [v66 countByEnumeratingWithState:&v120 objects:v145 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v121;
      do
      {
        for (uint64_t n = 0; n != v68; ++n)
        {
          if (*(void *)v121 != v69) {
            objc_enumerationMutation(v66);
          }
          uint64_t v71 = *(void *)(*((void *)&v120 + 1) + 8 * n);
          v72 = [v59 indexTitles];
          v73 = [v72 objectForKey:v71];

          [(TIKeyboardCandidateResultSetCoder *)self encodeStringArray:v73];
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v120 objects:v145 count:16];
      }
      while (v68);
    }
  }
  else
  {
    int v63 = -1;
  }
  v74 = [v59 showExtensionCandidates];
  uint64_t v75 = [v74 count];

  if (v75)
  {
    v76 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
    int v77 = [v76 length];

    long long v78 = [v59 showExtensionCandidates];
    long long v79 = [v78 allKeys];
    [(TIKeyboardCandidateResultSetCoder *)self encodeStringArray:v79];

    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v80 = [v59 showExtensionCandidates];
    uint64_t v81 = [v80 countByEnumeratingWithState:&v116 objects:v144 count:16];
    if (v81)
    {
      uint64_t v82 = v81;
      uint64_t v83 = *(void *)v117;
      do
      {
        for (iuint64_t i = 0; ii != v82; ++ii)
        {
          if (*(void *)v117 != v83) {
            objc_enumerationMutation(v80);
          }
          uint64_t v85 = *(void *)(*((void *)&v116 + 1) + 8 * ii);
          v86 = [v105 showExtensionCandidates];
          v87 = [v86 objectForKey:v85];

          -[TIKeyboardCandidateResultSetCoder encodeByte:](self, "encodeByte:", [v87 integerValue] != 0);
        }
        uint64_t v82 = [v80 countByEnumeratingWithState:&v116 objects:v144 count:16];
      }
      while (v82);
    }

    uint64_t v59 = v105;
  }
  else
  {
    int v77 = -1;
  }
  id v88 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
  uint64_t v89 = [v88 bytes];

  *(_DWORD *)uint64_t v89 = v96;
  *(unsigned char *)(v89 + 4) = v99 != 0;
  *(_DWORD *)(v89 + 5) = v95;
  *(_DWORD *)(v89 + 9) = v109;
  *(_DWORD *)(v89 + 13) = v94;
  *(_DWORD *)(v89 + 17) = v93;
  *(_DWORD *)(v89 + 21) = v111;
  *(_DWORD *)(v89 + 25) = v98;
  *(_DWORD *)(v89 + 29) = v115;
  *(_DWORD *)(v89 + 33) = v107;
  *(_DWORD *)(v89 + 37) = v97;
  *(_DWORD *)(v89 + 41) = v104;
  *(_DWORD *)(v89 + 45) = v63;
  *(_DWORD *)(v89 + 49) = v77;
  *(_DWORD *)(v89 + 53) = v92;
  uint64_t v90 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];

  return v90;
}

- (id)decodePointerValueArray
{
  unsigned int v3 = [(TIKeyboardCandidateResultSetCoder *)self decodeUInt32];
  uint64_t v4 = v3;
  unint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  if (v3)
  {
    do
    {
      unint64_t v6 = [(TIKeyboardCandidateResultSetCoder *)self decodeUInt64];
      v7 = [NSNumber numberWithUnsignedLongLong:v6];
      [v5 addObject:v7];

      --v4;
    }
    while (v4);
  }

  return v5;
}

- (void)encodePointerValueArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v15 = [v4 count];
  unint64_t v5 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
  [v5 appendBytes:&v15 length:4];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[TIKeyboardCandidateResultSetCoder encodeUInt64:](self, "encodeUInt64:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v10++), "unsignedLongLongValue", (void)v11));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)decodeStringArray
{
  unsigned int v3 = [(TIKeyboardCandidateResultSetCoder *)self decodeUInt32];
  uint64_t v4 = v3;
  unint64_t v5 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  if (v3)
  {
    do
    {
      id v6 = [(TIKeyboardCandidateResultSetCoder *)self decodeString];
      [v5 addObject:v6];

      --v4;
    }
    while (v4);
  }

  return v5;
}

- (void)encodeStringArray:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v15 = [v4 count];
  unint64_t v5 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
  [v5 appendBytes:&v15 length:4];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[TIKeyboardCandidateResultSetCoder encodeString:](self, "encodeString:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v8);
  }
}

- (id)decodeString
{
  unsigned int v3 = [(TIKeyboardCandidateResultSetCoder *)self currentPosition];
  [(TIKeyboardCandidateResultSetCoder *)self setOffset:strlen(v3) + [(TIKeyboardCandidateResultSetCoder *)self offset] + 1];
  if ([(TIKeyboardCandidateResultSetCoder *)self offsetHasPassedEndOfData])
  {
    id v4 = &stru_1EDBDCE38;
  }
  else
  {
    id v4 = [NSString stringWithUTF8String:v3];
  }

  return v4;
}

- (void)encodeString:(id)a3
{
  uint64_t v4 = [a3 UTF8String];
  if (v4) {
    unint64_t v5 = (const char *)v4;
  }
  else {
    unint64_t v5 = "";
  }
  id v6 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
  [v6 appendBytes:v5 length:strlen(v5) + 1];
}

- (unint64_t)decodeUInt64
{
  unint64_t v3 = 0;
  [(TIKeyboardCandidateResultSetCoder *)self readNumberOfBytes:8 into:&v3];
  return v3;
}

- (void)encodeUInt64:(unint64_t)a3
{
  unint64_t v4 = a3;
  unint64_t v3 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
  [v3 appendBytes:&v4 length:8];
}

- (unsigned)decodeUInt32
{
  unsigned int v3 = 0;
  [(TIKeyboardCandidateResultSetCoder *)self readNumberOfBytes:4 into:&v3];
  return v3;
}

- (void)encodeUInt32:(unsigned int)a3
{
  unsigned int v4 = a3;
  unsigned int v3 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
  [v3 appendBytes:&v4 length:4];
}

- (double)decodeDouble
{
  double v3 = 0.0;
  [(TIKeyboardCandidateResultSetCoder *)self readNumberOfBytes:8 into:&v3];
  return v3;
}

- (void)encodeDouble:(double)a3
{
  double v4 = a3;
  double v3 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
  [v3 appendBytes:&v4 length:8];
}

- (unsigned)decodeShort
{
  unsigned __int16 v3 = 0;
  [(TIKeyboardCandidateResultSetCoder *)self readNumberOfBytes:2 into:&v3];
  return v3;
}

- (void)encodeShort:(unsigned __int16)a3
{
  unsigned __int16 v4 = a3;
  unsigned __int16 v3 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
  [v3 appendBytes:&v4 length:2];
}

- (void)readNumberOfBytes:(unint64_t)a3 into:(void *)a4
{
  if (a3 && a4)
  {
    if ([(TIKeyboardCandidateResultSetCoder *)self offsetHasPassedEndOfData])
    {
      unint64_t v7 = 0;
    }
    else
    {
      uint64_t v8 = [(TIKeyboardCandidateResultSetCoder *)self data];
      int v9 = [v8 length];
      unint64_t v7 = (int)(v9 - [(TIKeyboardCandidateResultSetCoder *)self offset]);
    }
    if (v7 >= a3)
    {
      memcpy(a4, [(TIKeyboardCandidateResultSetCoder *)self currentPosition], a3);
      unint64_t v10 = [(TIKeyboardCandidateResultSetCoder *)self offset] + a3;
      [(TIKeyboardCandidateResultSetCoder *)self setOffset:v10];
    }
  }
}

- (unsigned)decodeByte
{
  if ([(TIKeyboardCandidateResultSetCoder *)self offsetHasPassedEndOfData]) {
    return 0;
  }
  unsigned __int8 v3 = *[(TIKeyboardCandidateResultSetCoder *)self currentPosition];
  [(TIKeyboardCandidateResultSetCoder *)self setOffset:[(TIKeyboardCandidateResultSetCoder *)self offset] + 1];
  return v3;
}

- (void)encodeByte:(unsigned __int8)a3
{
  unsigned __int8 v4 = a3;
  unsigned __int8 v3 = [(TIKeyboardCandidateResultSetCoder *)self mutableData];
  [v3 appendBytes:&v4 length:1];
}

- (BOOL)decodeBool
{
  return [(TIKeyboardCandidateResultSetCoder *)self decodeByte] != 0;
}

- (id)decodeCandidate
{
  unsigned __int8 v3 = (objc_class *)objc_msgSend((id)objc_opt_class(), "classFromCandidateType:", -[TIKeyboardCandidateResultSetCoder bytes](self, "bytes")[-[TIKeyboardCandidateResultSetCoder offset](self, "offset")]);
  if (v3) {
    unsigned __int8 v3 = (objc_class *)[[v3 alloc] initWithCandidateResultSetCoder:self];
  }

  return v3;
}

- (const)currentPosition
{
  unsigned __int8 v3 = [(TIKeyboardCandidateResultSetCoder *)self bytes];
  return &v3[[(TIKeyboardCandidateResultSetCoder *)self offset]];
}

- (const)bytes
{
  id v2 = [(TIKeyboardCandidateResultSetCoder *)self data];
  unsigned __int8 v3 = (const char *)[v2 bytes];

  return v3;
}

- (BOOL)isDecoding
{
  id v2 = [(TIKeyboardCandidateResultSetCoder *)self data];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setOffset:(unint64_t)a3
{
  if ([(TIKeyboardCandidateResultSetCoder *)self isDecoding])
  {
    unint64_t v5 = [(TIKeyboardCandidateResultSetCoder *)self data];
    uint64_t v6 = [v5 length];

    if (v6)
    {
      unint64_t v7 = [(TIKeyboardCandidateResultSetCoder *)self data];
      unint64_t v8 = [v7 length];

      if (v8 <= a3)
      {
        [(TIKeyboardCandidateResultSetCoder *)self offsetHasPassedEndOfData];
        [(TIKeyboardCandidateResultSetCoder *)self setOffsetHasPassedEndOfData:1];
        int v9 = [(TIKeyboardCandidateResultSetCoder *)self data];
        a3 = [v9 length] - 1;
      }
    }
    else
    {
      [(TIKeyboardCandidateResultSetCoder *)self offsetHasPassedEndOfData];
      [(TIKeyboardCandidateResultSetCoder *)self setOffsetHasPassedEndOfData:1];
      a3 = 0;
    }
  }
  self->_offset = a3;
}

- (TIKeyboardCandidateResultSetCoder)initWithData:(id)a3 mutableData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardCandidateResultSetCoder;
  int v9 = [(TIKeyboardCandidateResultSetCoder *)&v12 init];
  unint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_data, a3);
    objc_storeStrong((id *)&v10->_mutableData, a4);
    v10->_offset = 0;
    v10->_offsetHasPassedEndOfData = 0;
  }

  return v10;
}

- (id)initForDecodingWithData:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    self = [(TIKeyboardCandidateResultSetCoder *)self initWithData:v4 mutableData:0];
    unint64_t v5 = self;
  }
  else
  {
    unint64_t v5 = 0;
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)initForEncoding
{
  BOOL v3 = [MEMORY[0x1E4F1CA58] dataWithLength:57];
  id v4 = [(TIKeyboardCandidateResultSetCoder *)self initWithData:0 mutableData:v3];

  return v4;
}

+ (id)decodeWithData:(id)a3
{
  id v3 = a3;
  id v4 = [[TIKeyboardCandidateResultSetCoder alloc] initForDecodingWithData:v3];

  unint64_t v5 = [v4 candidateResultSet];

  return v5;
}

+ (id)encodeWithCandidateResultSet:(id)a3
{
  id v3 = a3;
  id v4 = [[TIKeyboardCandidateResultSetCoder alloc] initForEncoding];
  unint64_t v5 = [v4 dataFromCandidateResultSet:v3];

  return v5;
}

+ (Class)classFromCandidateType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  unint64_t v5 = (void *)classFromCandidateType____candidateTypeToClassMap;
  if (!classFromCandidateType____candidateTypeToClassMap)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = (void *)classFromCandidateType____candidateTypeToClassMap;
    classFromCandidateType____candidateTypeToClassMap = (uint64_t)v6;

    unint64_t v5 = (void *)classFromCandidateType____candidateTypeToClassMap;
  }
  id v8 = [NSNumber numberWithUnsignedInt:v3];
  Class v9 = (Class)(id)[v5 objectForKey:v8];

  if (!v9)
  {
    unint64_t v10 = [a1 candidateTypeToClassNameMap];
    long long v11 = [NSNumber numberWithUnsignedInt:v3];
    objc_super v12 = [v10 objectForKey:v11];

    if (v12)
    {
      Class v9 = NSClassFromString(v12);
      if (v9)
      {
        long long v13 = (void *)classFromCandidateType____candidateTypeToClassMap;
        long long v14 = [NSNumber numberWithUnsignedInt:v3];
        [v13 setObject:v9 forKey:v14];
      }
    }
    else
    {
      Class v9 = 0;
    }
  }

  return v9;
}

+ (id)candidateTypeToClassNameMap
{
  if (candidateTypeToClassNameMap___onceToken != -1) {
    dispatch_once(&candidateTypeToClassNameMap___onceToken, &__block_literal_global_4178);
  }
  id v2 = (void *)candidateTypeToClassNameMap___candidateTypeToClassNameMap;

  return v2;
}

void __64__TIKeyboardCandidateResultSetCoder_candidateTypeToClassNameMap__block_invoke()
{
  v3[12] = *MEMORY[0x1E4F143B8];
  v2[0] = &unk_1EDC38438;
  v2[1] = &unk_1EDC38450;
  v3[0] = @"TIKeyboardCandidate";
  v3[1] = @"TIKeyboardCandidateSingle";
  v2[2] = &unk_1EDC38468;
  v2[3] = &unk_1EDC38480;
  v3[2] = @"TIMecabraCandidate";
  v3[3] = @"TIPinyinDisambiguationCandidate";
  v2[4] = &unk_1EDC38498;
  v2[5] = &unk_1EDC384B0;
  v3[4] = @"TIHandwritingCandidate";
  v3[5] = @"TIZephyrCandidate";
  v2[6] = &unk_1EDC384C8;
  v2[7] = &unk_1EDC384E0;
  v3[6] = @"TIShortcutConversionCandidate";
  v3[7] = @"TICompositeMecabraCandidate";
  v2[8] = &unk_1EDC384F8;
  v2[9] = &unk_1EDC38510;
  v3[8] = @"TIMecabraFacemarkCandidate";
  v3[9] = @"TITextAnimationCandidate";
  v2[10] = &unk_1EDC38528;
  v2[11] = &unk_1EDC38540;
  v3[10] = @"TILiveConversionCandidate";
  v3[11] = @"TILabeledKeyboardCandidate";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:12];
  v1 = (void *)candidateTypeToClassNameMap___candidateTypeToClassNameMap;
  candidateTypeToClassNameMap___candidateTypeToClassNameMap = v0;
}

@end