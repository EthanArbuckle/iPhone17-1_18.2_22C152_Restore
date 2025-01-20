@interface CRFormContentTypePredictor
- (BOOL)_predictAndAssignContentTypesForFields:(id)a3 fieldsAndRegions:(id)a4 locale:(id)a5 updateExternal:(BOOL)a6;
- (BOOL)predictAndAssignContentTypesForFields:(id)a3 fieldsAndRegions:(id)a4 locale:(id)a5 updateExternal:(BOOL)a6;
- (CRFormContentTypePredictor)init;
- (id).cxx_construct;
- (id)_modelInputWithFields:(id)a3 fieldsAndRegions:(id)a4 locale:(id)a5;
- (void)_decodeCoreMLOutput:(id)a3 forFields:(id)a4 updateExternal:(BOOL)a5;
- (void)_decodeEspressoOutput:(id *)a3 forFields:(id)a4 locale:(id)a5 updateExternal:(BOOL)a6;
@end

@implementation CRFormContentTypePredictor

- (CRFormContentTypePredictor)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CRFormContentTypePredictor;
  if ([(CRFormContentTypePredictor *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (id)_modelInputWithFields:(id)a3 fieldsAndRegions:(id)a4 locale:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = [v8 _nonFieldRegions];
  if ([v7 count] && objc_msgSend(v10, "count"))
  {
    id v35 = 0;
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1E9A8]) initWithShape:&unk_1F3933448 dataType:65568 error:&v35];
    id v12 = v35;
    if (v12)
    {
      id v13 = v12;
      v14 = CROSLogForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v15 = [v13 description];
        *(_DWORD *)buf = 138412290;
        v38 = v15;
        _os_log_impl(&dword_1DD733000, v14, OS_LOG_TYPE_FAULT, "Failed to create a field array: %@", buf, 0xCu);
      }
      v16 = 0;
    }
    else
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke;
      v32[3] = &unk_1E6CDB3D8;
      v17 = v7;
      v33 = v17;
      id v18 = v8;
      id v34 = v18;
      [v11 getMutableBytesWithHandler:v32];
      id v19 = objc_alloc(MEMORY[0x1E4F1E9A8]);
      v36[0] = &unk_1F3932F68;
      v36[1] = &unk_1F3932F80;
      v20 = [NSNumber numberWithUnsignedLong:7700];
      v36[2] = v20;
      v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:3];
      id v31 = 0;
      v26 = (void *)[v19 initWithShape:v21 dataType:65568 error:&v31];
      id v13 = v31;

      if (v13)
      {
        v22 = CROSLogForCategory(0);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          v23 = [v13 description];
          *(_DWORD *)buf = 138412290;
          v38 = v23;
          _os_log_impl(&dword_1DD733000, v22, OS_LOG_TYPE_FAULT, "Failed to create a label array: %@", buf, 0xCu);
        }
        v16 = 0;
      }
      else
      {
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke_73;
        v27[3] = &unk_1E6CDB400;
        v24 = v10;
        v28 = v24;
        id v29 = v18;
        id v30 = v9;
        [v26 getMutableBytesWithHandler:v27];
        v16 = [[CRFormContentTypeModelInput alloc] initWithFieldArray:v11 labelArray:v26 fieldCount:[v17 count] labelCount:[v24 count] useFloatOnly:1];

        v22 = v28;
      }

      v14 = v33;
    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke(uint64_t a1, float *a2, int64_t a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v25 = a4;
  if (a3 >= 1) {
    bzero(a2, a3);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v7)
  {
    uint64_t v26 = 0;
    uint64_t v8 = *(void *)v30;
LABEL_5:
    uint64_t v9 = 0;
    uint64_t v10 = v26 + 1;
    v26 += v7;
    while (1)
    {
      if (*(void *)v30 != v8) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
      unint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "indexOfObject:", v11, v25);
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = *(void **)(a1 + 40);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke_2;
        v28[3] = &unk_1E6CDB3B0;
        v28[4] = v11;
        unint64_t v12 = [v13 indexOfObjectPassingTest:v28];
      }
      *a2 = (float)v12;
      v14 = [v11 boundingQuad];
      [v14 boundingBox];
      *(float *)&double v15 = v15;
      a2[1] = *(float *)&v15;

      v16 = [v11 boundingQuad];
      [v16 boundingBox];
      float v18 = v17;
      a2[2] = v18;

      id v19 = [v11 boundingQuad];
      [v19 boundingBox];
      float v21 = v20;
      a2[3] = v21;

      v22 = [v11 boundingQuad];
      [v22 boundingBox];
      float v24 = v23;
      a2[4] = v24;

      if ((unint64_t)(v10 + v9) >= 0x80) {
        break;
      }
      a2 += 5;
      if (v7 == ++v9)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
}

BOOL __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    BOOL v8 = 1;
  }
  else
  {
    v5 = CRCastAsClass<CRFormField>(v3);
    v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 originalField];
      BOOL v8 = v7 == *(void **)(a1 + 32);
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  return v8;
}

void __76__CRFormContentTypePredictor__modelInputWithFields_fieldsAndRegions_locale___block_invoke_73(uint64_t a1, float *a2, int64_t a3, void *a4)
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v90 = a4;
  if (a3 >= 1) {
    bzero(a2, a3);
  }
  long long v105 = 0u;
  long long v106 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v94 = [obj countByEnumeratingWithState:&v103 objects:v120 count:16];
  if (!v94) {
    goto LABEL_109;
  }
  uint64_t v93 = *(void *)v104;
  uint64_t v91 = 0;
LABEL_5:
  uint64_t v100 = 0;
  uint64_t v97 = v91;
  v91 += v94;
  while (2)
  {
    if (*(void *)v104 != v93) {
      objc_enumerationMutation(obj);
    }
    v6 = *(void **)(*((void *)&v103 + 1) + 8 * v100);
    *a2 = (float)(unint64_t)[*(id *)(a1 + 40) indexOfObject:v6];
    uint64_t v7 = [v6 boundingQuad];
    [v7 boundingBox];
    *(float *)&double v8 = v8;
    a2[1] = *(float *)&v8;

    uint64_t v9 = [v6 boundingQuad];
    [v9 boundingBox];
    float v11 = v10;
    a2[2] = v11;

    unint64_t v12 = [v6 boundingQuad];
    [v12 boundingBox];
    float v14 = v13;
    a2[3] = v14;

    double v15 = [v6 boundingQuad];
    [v15 boundingBox];
    float v17 = v16;
    a2[4] = v17;

    uint64_t v18 = [v6 text];
    v95 = (void *)v18;
    id v19 = &stru_1F38EED68;
    if (v18) {
      id v19 = (__CFString *)v18;
    }
    double v20 = *(void **)(a1 + 48);
    float v21 = v19;
    id v101 = v20;
    v96 = v21;
    v22 = [(__CFString *)v21 lowercaseString];
    double v23 = [v22 _crStringByRemovingParenthesizedText];
    if ((unint64_t)[v23 length] >= 0xB)
    {
      id v24 = v23;

      v22 = v24;
    }

    id v102 = v22;
    std::string::basic_string[abi:ne180100]<0>(&v119, (char *)[v102 UTF8String]);
    __x[0] = 0;
    std::vector<float>::vector(&v117, 0x12uLL, __x);
    uint64_t v25 = 0;
    __dst = (char *)(a2 + 5);
    do
    {
      if (!std::string::compare(&v119, (&CRFormContentTypeModelVocabulary::keywords_full_match)[v25])) {
        *((_DWORD *)v117 + v25) = 1065353216;
      }
      ++v25;
    }
    while (v25 != 18);
    uint64_t v26 = NSString;
    v27 = [v101 lowercaseString];
    v28 = [v26 stringWithFormat:@"<LANG_%@>", v27];

    id v29 = v28;
    std::string::basic_string[abi:ne180100]<0>(__s1, (char *)[v29 UTF8String]);

    __x[0] = 0;
    std::vector<float>::vector(&__p, 0x1DFDuLL, __x);
    if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::vector<int>::size_type size = HIBYTE(v119.__r_.__value_.__r.__words[2]);
    }
    else {
      std::vector<int>::size_type size = v119.__r_.__value_.__l.__size_;
    }
    __x[0] = 0;
    std::vector<int>::vector(&v111, size, __x);
    uint64_t v31 = 0;
    long long v32 = (float *)__p;
    std::vector<int>::pointer begin = v111.__begin_;
    do
    {
      uint64_t v34 = CRFormContentTypeModelVocabulary::keywords[v31];
      id v35 = (void *)strlen(v34);
      int64_t v36 = (int64_t)v35;
      if ((char)v116 < 0)
      {
        if (v35 != __s1[1]) {
          goto LABEL_27;
        }
        if (v35 == (void *)-1) {
          std::string::__throw_out_of_range[abi:ne180100]();
        }
        v37 = (void **)__s1[0];
      }
      else
      {
        if (v35 != (void *)v116) {
          goto LABEL_27;
        }
        v37 = __s1;
      }
      if (!memcmp(v37, v34, v36))
      {
        v32[v31] = v32[v31] + 1.0;
        goto LABEL_44;
      }
LABEL_27:
      int64_t v38 = HIBYTE(v119.__r_.__value_.__r.__words[2]);
      if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        uint64_t v39 = &v119;
      }
      else {
        uint64_t v39 = (std::string *)v119.__r_.__value_.__r.__words[0];
      }
      if (v36)
      {
        if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          int64_t v38 = v119.__r_.__value_.__l.__size_;
        }
        if (v38 >= v36)
        {
          v40 = (char *)v39 + v38;
          int v41 = *v34;
          v42 = v39;
          do
          {
            int64_t v43 = v38 - v36;
            if (v43 == -1) {
              break;
            }
            v44 = (char *)memchr(v42, v41, v43 + 1);
            if (!v44) {
              break;
            }
            v45 = v44;
            if (!memcmp(v44, v34, v36))
            {
              if (v45 != v40)
              {
                int64_t v46 = v45 - (char *)v39;
                if (v45 - (char *)v39 != -1) {
                  goto LABEL_41;
                }
              }
              break;
            }
            v42 = (std::string *)(v45 + 1);
            int64_t v38 = v40 - (v45 + 1);
          }
          while (v38 >= v36);
        }
      }
      else
      {
        int64_t v46 = 0;
LABEL_41:
        v32[v31] = v32[v31] + 1.0;
        size_t v47 = strlen(v34);
        if (v47) {
          memset_pattern16(&begin[v46], &unk_1DD8CDD60, 4 * v47);
        }
      }
LABEL_44:
      ++v31;
    }
    while (v31 != 7677);
    v48 = [v102 componentsSeparatedByString:@" "];
    long long v109 = 0u;
    long long v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    id v49 = v48;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v107 objects:__x count:16];
    uint64_t v51 = v50;
    if (v50)
    {
      unint64_t v52 = 0;
      uint64_t v53 = *(void *)v108;
      do
      {
        uint64_t v54 = 0;
        do
        {
          if (*(void *)v108 != v53) {
            objc_enumerationMutation(v49);
          }
          int v55 = 0;
          v56 = *(void **)(*((void *)&v107 + 1) + 8 * v54);
          for (unint64_t i = v52; i < [v56 length] + v52; ++i)
            v55 += v111.__begin_[i];
          if ([v56 length] > (unint64_t)v55) {
            *(v113 - 1) = *(v113 - 1) + 1.0;
          }
          v52 += [v56 length] + 1;
          ++v54;
        }
        while (v54 != v51);
        uint64_t v51 = [v49 countByEnumeratingWithState:&v107 objects:__x count:16];
      }
      while (v51);
    }

    v58 = (char *)v117;
    if (v118 - (unsigned char *)v117 >= 1)
    {
      uint64_t v59 = (v118 - (unsigned char *)v117) >> 2;
      v60 = v113;
      int64_t v61 = (char *)v113 - (unsigned char *)__p;
      v62 = (char *)__p + (((char *)v113 - (unsigned char *)__p) & 0xFFFFFFFFFFFFFFFCLL);
      if (v59 > (v114 - (char *)v113) >> 2)
      {
        uint64_t v63 = v61 >> 2;
        unint64_t v64 = (v61 >> 2) + v59;
        if (v64 >> 62) {
          std::vector<int>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v65 = v114 - (unsigned char *)__p;
        if ((v114 - (unsigned char *)__p) >> 1 > v64) {
          unint64_t v64 = v65 >> 1;
        }
        if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v66 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v66 = v64;
        }
        if (v66)
        {
          v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)&v114, v66);
          uint64_t v69 = v68;
        }
        else
        {
          v67 = 0;
          uint64_t v69 = 0;
        }
        v79 = &v67[4 * v63];
        v80 = &v79[4 * v59];
        uint64_t v81 = 4 * v59;
        v82 = v79;
        do
        {
          int v83 = *(_DWORD *)v58;
          v58 += 4;
          *(_DWORD *)v82 = v83;
          v82 += 4;
          v81 -= 4;
        }
        while (v81);
        v84 = (char *)__p;
        if (__p != v62)
        {
          v85 = v62;
          do
          {
            int v86 = *((_DWORD *)v85 - 1);
            v85 -= 4;
            *((_DWORD *)v79 - 1) = v86;
            v79 -= 4;
          }
          while (v85 != v84);
        }
        v87 = (char *)((char *)v113 - v62);
        if (v113 != (float *)v62) {
          memmove(v80, v62, (char *)v113 - v62);
        }
        v88 = __p;
        __p = v79;
        v113 = (float *)&v87[(void)v80];
        v114 = &v67[4 * v69];
        if (v88) {
          operator delete(v88);
        }
        goto LABEL_94;
      }
      uint64_t v70 = (char *)v113 - v62;
      uint64_t v71 = ((char *)v113 - v62) >> 2;
      if (v71 >= v59)
      {
        v72 = (char *)v117 + 4 * v59;
        v74 = v113;
      }
      else
      {
        v72 = (char *)v117 + 4 * v71;
        uint64_t v73 = v118 - v72;
        if (v118 != v72) {
          memmove(v113, (char *)v117 + 4 * v71, v118 - v72);
        }
        v74 = (float *)((char *)v60 + v73);
        v113 = (float *)((char *)v60 + v73);
        if (v70 < 1) {
          goto LABEL_94;
        }
      }
      v75 = &v74[-v59];
      v76 = v74;
      while (v75 < v60)
      {
        int v77 = *(_DWORD *)v75++;
        *(_DWORD *)v76++ = v77;
      }
      v78 = (float *)&v62[4 * v59];
      v113 = v76;
      if (v74 != v78) {
        memmove(&v74[-(v74 - v78)], v62, (char *)v74 - (char *)v78);
      }
      if (v72 != v58) {
        memmove(v62, v58, v72 - v58);
      }
    }
LABEL_94:
    int64_t v89 = (char *)v113 - (unsigned char *)__p;
    if (v113 != __p) {
      memmove(__dst, __p, (char *)v113 - (unsigned char *)__p);
    }

    if (v111.__begin_)
    {
      v111.__end_ = v111.__begin_;
      operator delete(v111.__begin_);
    }
    if (__p)
    {
      v113 = (float *)__p;
      operator delete(__p);
    }
    if ((char)v116 < 0) {
      operator delete(__s1[0]);
    }
    if (v117)
    {
      v118 = v117;
      operator delete(v117);
    }
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v119.__r_.__value_.__l.__data_);
    }

    if ((unint64_t)++v97 < 0x80)
    {
      a2 = (float *)&__dst[v89];
      if (++v100 != v94) {
        continue;
      }
      uint64_t v94 = [obj countByEnumeratingWithState:&v103 objects:v120 count:16];
      if (!v94) {
        break;
      }
      goto LABEL_5;
    }
    break;
  }
LABEL_109:
}

- (void)_decodeCoreMLOutput:(id)a3 forFields:(id)a4 updateExternal:(BOOL)a5
{
  BOOL v34 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v31 = a4;
  v6 = [v30 featureValueForName:@"score"];
  uint64_t v7 = [v6 multiArrayValue];

  id v8 = v7;
  uint64_t v9 = (_DWORD *)[v8 dataPointer];
  double v10 = [v8 shape];
  id v11 = v8;
  unint64_t v12 = [v10 objectAtIndexedSubscript:2];
  uint64_t v13 = [v12 unsignedIntegerValue];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v31;
  uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v14)
  {
    uint64_t v33 = *(void *)v38;
    do
    {
      uint64_t v15 = 0;
      uint64_t v35 = v14;
      do
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(obj);
        }
        int64_t v36 = *(void **)(*((void *)&v37 + 1) + 8 * v15);
        double v16 = 0;
        unint64_t v17 = 0;
        if (v13)
        {
          unint64_t v18 = 0;
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (v17 >= v18)
            {
              uint64_t v20 = (uint64_t)(v17 - (void)v16) >> 4;
              unint64_t v21 = v20 + 1;
              if ((unint64_t)(v20 + 1) >> 60) {
                std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
              }
              if ((uint64_t)(v18 - (void)v16) >> 3 > v21) {
                unint64_t v21 = (uint64_t)(v18 - (void)v16) >> 3;
              }
              if (v18 - (unint64_t)v16 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v22 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v22 = v21;
              }
              if (v22) {
                unint64_t v22 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTextRecognition::CRCTLD::CTLDObstacle>>(v22);
              }
              else {
                uint64_t v23 = 0;
              }
              unint64_t v24 = v22 + 16 * v20;
              *(_DWORD *)unint64_t v24 = *v9;
              *(void *)(v24 + 8) = i;
              if ((void *)v17 == v16)
              {
                uint64_t v26 = (void *)(v22 + 16 * v20);
              }
              else
              {
                unint64_t v25 = v22 + 16 * v20;
                do
                {
                  uint64_t v26 = (void *)(v25 - 16);
                  *(_OWORD *)(v25 - 16) = *(_OWORD *)(v17 - 16);
                  v17 -= 16;
                  v25 -= 16;
                }
                while ((void *)v17 != v16);
              }
              unint64_t v18 = v22 + 16 * v23;
              unint64_t v17 = v24 + 16;
              if (v16) {
                operator delete(v16);
              }
              double v16 = v26;
            }
            else
            {
              *(_DWORD *)unint64_t v17 = *v9;
              *(void *)(v17 + 8) = i;
              v17 += 16;
            }
            ++v9;
          }
        }
        id v8 = v11;
        if (+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:v36 updateExternalFields:v34 allowOverride:0 allowAllDetectionSources:1])
        {
          unint64_t v27 = 126 - 2 * __clz((uint64_t)(v17 - (void)v16) >> 4);
          if ((void *)v17 == v16) {
            uint64_t v28 = 0;
          }
          else {
            uint64_t v28 = v27;
          }
          std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::tuple<float,unsigned long> *,false>((unint64_t)v16, v17, v28, 1);
          id v29 = [NSString stringWithUTF8String:(&CRFormContentTypeModelVocabulary::classnames)[v16[1]]];
          objc_msgSend(v36, "setTextContentType:", +[CRFormContentTypeUtilities contentTypeFromString:](CRFormContentTypeUtilities, "contentTypeFromString:", v29));
        }
        else if (!v16)
        {
          goto LABEL_35;
        }
        operator delete(v16);
LABEL_35:
        ++v15;
      }
      while (v15 != v35);
      uint64_t v14 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v14);
  }
}

- (void)_decodeEspressoOutput:(id *)a3 forFields:(id)a4 locale:(id)a5 updateExternal:(BOOL)a6
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  id v71 = a4;
  id v66 = a5;
  std::string::basic_string[abi:ne180100]<0>(__p, "None");
  uint64_t v9 = 0;
  uint64_t v10 = HIBYTE(v75);
  id v11 = *(unsigned char **)__p;
  uint64_t v12 = *(void *)&__p[8];
  while (1)
  {
    size_t v13 = strlen((&CRFormContentTypeModelVocabulary::classnames)[v9]);
    size_t v14 = v13;
    if ((v10 & 0x80) != 0) {
      break;
    }
    if (v13 == v10)
    {
      uint64_t v15 = __p;
      goto LABEL_7;
    }
LABEL_8:
    if (++v9 == 34)
    {
      double v16 = (char **)&OBJC_PROTOCOL___CROutputRegionLayoutContributing;
      if ((v10 & 0x80) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  if (v13 != v12) {
    goto LABEL_8;
  }
  uint64_t v15 = v11;
  if (v12 == -1) {
    std::string::__throw_out_of_range[abi:ne180100]();
  }
LABEL_7:
  if (memcmp(v15, (&CRFormContentTypeModelVocabulary::classnames)[v9], v14)) {
    goto LABEL_8;
  }
  double v16 = &(&CRFormContentTypeModelVocabulary::classnames)[v9];
  if ((v10 & 0x80) != 0) {
LABEL_10:
  }
    operator delete(v11);
LABEL_11:
  id v17 = v66;
  float v18 = 0.7;
  uint64_t v69 = v17;
  if (v17 && (unint64_t)[v17 length] >= 2)
  {
    id v19 = [v69 substringToIndex:2];
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v19 UTF8String]);

    left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> *)self->_customNoneBonuses.__tree_.__pair1_.__value_.__left_;
    float v18 = 0.7;
    if (left)
    {
      p_pair1 = &self->_customNoneBonuses.__tree_.__pair1_;
      do
      {
        BOOL v22 = std::less<std::string>::operator()[abi:ne180100]((uint64_t)&self->_customNoneBonuses.__tree_.__pair3_, (const void **)&left[4].__value_.__left_, (const void **)__p);
        uint64_t v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> **)&left[1];
        if (!v22)
        {
          uint64_t v23 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, float>, void *>>> **)left;
          p_pair1 = left;
        }
        left = *v23;
      }
      while (*v23);
      if (p_pair1 != &self->_customNoneBonuses.__tree_.__pair1_
        && !std::less<std::string>::operator()[abi:ne180100]((uint64_t)&self->_customNoneBonuses.__tree_.__pair3_, (const void **)__p, (const void **)&p_pair1[4].__value_.__left_))
      {
        float v18 = *(float *)&p_pair1[7].__value_.__left_;
      }
    }
    if (SHIBYTE(v75) < 0) {
      operator delete(*(void **)__p);
    }
  }

  espresso_buffer_unpack_tensor_shape();
  double v73 = 0.0;
  uint64_t v24 = 0;
  uint64_t v25 = v88;
  var0 = a3->var0;
  uint64_t v68 = 4 * (v16 - &CRFormContentTypeModelVocabulary::classnames);
  *(void *)&long long v27 = 136315138;
  long long v65 = v27;
  while (2)
  {
    unint64_t v28 = objc_msgSend(v71, "count", v65);
    unint64_t v29 = v87;
    if (v87 >= v28) {
      unint64_t v29 = v28;
    }
    if (*(void *)&v73 < v29)
    {
      id v30 = 0;
      unint64_t v31 = 0;
      unint64_t v32 = 0;
      uint64_t v33 = 0;
      do
      {
        if (v31 >= v32)
        {
          uint64_t v34 = (uint64_t)(v31 - (void)v30) >> 4;
          unint64_t v35 = v34 + 1;
          if ((unint64_t)(v34 + 1) >> 60) {
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          }
          if ((uint64_t)(v32 - (void)v30) >> 3 > v35) {
            unint64_t v35 = (uint64_t)(v32 - (void)v30) >> 3;
          }
          if (v32 - (unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v36 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v36 = v35;
          }
          if (v36) {
            unint64_t v36 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CRTextRecognition::CRCTLD::CTLDObstacle>>(v36);
          }
          else {
            uint64_t v37 = 0;
          }
          unint64_t v38 = v36 + 16 * v34;
          *(_DWORD *)unint64_t v38 = *var0;
          *(void *)(v38 + 8) = v33;
          if ((float *)v31 == v30)
          {
            long long v40 = (float *)(v36 + 16 * v34);
          }
          else
          {
            unint64_t v39 = v36 + 16 * v34;
            do
            {
              long long v40 = (float *)(v39 - 16);
              *(_OWORD *)(v39 - 16) = *(_OWORD *)(v31 - 16);
              v31 -= 16;
              v39 -= 16;
            }
            while ((float *)v31 != v30);
          }
          unint64_t v32 = v36 + 16 * v37;
          unint64_t v31 = v38 + 16;
          if (v30) {
            operator delete(v30);
          }
          id v30 = v40;
        }
        else
        {
          *(_DWORD *)unint64_t v31 = *var0;
          *(void *)(v31 + 8) = v33;
          v31 += 16;
        }
        ++var0;
        ++v33;
      }
      while (v33 != v25);
      v30[v68] = v18 + v30[v68];
      v72 = [v71 objectAtIndexedSubscript:*(void *)&v73];
      if (+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:](CRFormContentTypeUtilities, "shouldAssignTextContentTypeForField:updateExternalFields:allowOverride:allowAllDetectionSources:"))
      {
        unint64_t v41 = 126 - 2 * __clz((uint64_t)(v31 - (void)v30) >> 4);
        if ((float *)v31 == v30) {
          uint64_t v42 = 0;
        }
        else {
          uint64_t v42 = v41;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::greater<void> &,std::tuple<float,unsigned long> *,false>((unint64_t)v30, v31, v42, 1);
        float v43 = *v30;
        float v44 = v30[4];
        uint64_t v45 = *((void *)v30 + 3);
        double v46 = [NSString stringWithUTF8String:(&CRFormContentTypeModelVocabulary::classnames)[*((void *)v30 + 1)]];
        uint64_t v70 = [NSString stringWithUTF8String:(&CRFormContentTypeModelVocabulary::classnames)[v45]];
        unint64_t v47 = +[CRFormContentTypeUtilities contentTypeFromString:*(void *)&v46];
        unint64_t v48 = +[CRFormContentTypeUtilities contentTypeFromString:v70];
        double v49 = COERCE_DOUBLE(v69);
        if (v24 != 39 || v47 != 1 || v48 != 38) {
          goto LABEL_63;
        }
        if (!+[CRImageReader languageIsJapanese:*(void *)&v49]
          && !+[CRImageReader languageIsKorean:*(void *)&v49])
        {
          BOOL v51 = +[CRImageReader languageIsChinese:*(void *)&v49];
          *(float *)&double v50 = v44 + 3.0;
          if ((float)(v44 + 3.0) <= v43 || !v51) {
            goto LABEL_63;
          }
          goto LABEL_68;
        }
        *(float *)&double v50 = v44 + 1.5;
        if ((float)(v44 + 1.5) > v43) {
          goto LABEL_68;
        }
LABEL_63:
        if (+[CRImageReader languageIsFrench:](CRImageReader, "languageIsFrench:", *(void *)&v49, v50)
          && (float)(v44 + 2.1) > v43
          && !v24
          && v47 == 6
          && v48 == 2)
        {
LABEL_68:

          uint64_t v53 = CROSLogForCategory(6);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)__p = 136316163;
            *(void *)&__p[4] = "-[CRFormContentTypePredictor _decodeEspressoOutput:forFields:locale:updateExternal:]";
            *(_WORD *)&__p[12] = 2113;
            *(void *)&__p[14] = v70;
            __int16 v75 = 2048;
            double v76 = v44;
            __int16 v77 = 2113;
            double v78 = v46;
            __int16 v79 = 2048;
            double v80 = v43;
            _os_log_impl(&dword_1DD733000, v53, OS_LOG_TYPE_DEBUG, "%s: Adopt second candidate %{private}@ %lf over %{private}@ %lf.", __p, 0x34u);
          }

          double v49 = v46;
          double v46 = COERCE_DOUBLE(v70);
        }
        else
        {
          float v44 = v43;
        }

        if ([v72 fieldSource] == 4)
        {
          uint64_t v54 = CROSLogForCategory(6);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            v67 = [v72 boundingQuad];
            [v67 topLeft];
            double v56 = v55;
            v57 = [v72 boundingQuad];
            [v57 topLeft];
            uint64_t v59 = v58;
            v60 = [v72 boundingQuad];
            [v60 size];
            uint64_t v62 = v61;
            uint64_t v63 = [v72 boundingQuad];
            [v63 size];
            *(_DWORD *)__p = 136316931;
            *(void *)&__p[4] = "-[CRFormContentTypePredictor _decodeEspressoOutput:forFields:locale:updateExternal:]";
            *(_WORD *)&__p[12] = 2113;
            *(double *)&__p[14] = v46;
            __int16 v75 = 2048;
            double v76 = v73;
            __int16 v77 = 2048;
            double v78 = v44;
            __int16 v79 = 2048;
            double v80 = v56;
            __int16 v81 = 2048;
            uint64_t v82 = v59;
            __int16 v83 = 2048;
            uint64_t v84 = v62;
            __int16 v85 = 2048;
            uint64_t v86 = v64;
            _os_log_impl(&dword_1DD733000, v54, OS_LOG_TYPE_DEBUG, "%s: Setting content type %{private}@ to PDF widget #%lu (score:%f x:%f y:%f w:%f h:%f).", __p, 0x52u);
          }
        }
        objc_msgSend(v72, "setTextContentType:", +[CRFormContentTypeUtilities contentTypeFromString:](CRFormContentTypeUtilities, "contentTypeFromString:", *(void *)&v46));
        uint64_t v24 = [v72 textContentType];
      }
      operator delete(v30);
      ++*(void *)&v73;
      continue;
    }
    break;
  }
}

- (BOOL)_predictAndAssignContentTypesForFields:(id)a3 fieldsAndRegions:(id)a4 locale:(id)a5 updateExternal:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v51 = v11;
  unint64_t v52 = v10;
  size_t v13 = [(CRFormContentTypePredictor *)self _modelInputWithFields:v10 fieldsAndRegions:v11 locale:v12];
  if (v13)
  {
    BOOL v48 = v6;
    size_t v14 = self;
    objc_sync_enter(v14);
    uint64_t v15 = [v13 fields];
    uint64_t v53 = [v15 shape];

    double v16 = [v13 labels];
    double v50 = [v16 shape];

    uint64_t value = (uint64_t)v14->_espressoModel.__ptr_.__value_;
    id v18 = [v13 fields];
    uint64_t v19 = [v18 dataPointer];
    uint64_t v20 = [v53 objectAtIndexedSubscript:1];
    uint64_t v21 = [v20 unsignedIntegerValue];
    BOOL v22 = [v53 objectAtIndexedSubscript:2];
    uint64_t v23 = [v22 unsignedIntegerValue];
    uint64_t v24 = (int64x2_t *)operator new(0x20uLL);
    *((void *)&buf + 1) = v24 + 2;
    v57 = v24 + 2;
    int64x2_t *v24 = vdupq_n_s64(1uLL);
    v24[1].i64[0] = v21;
    v24[1].i64[1] = v23;
    *(void *)&long long buf = v24;
    if (CoreRecognition::EspressoModelWrapper::bindInput(value, v19))
    {
      uint64_t v25 = (uint64_t)v14->_espressoModel.__ptr_.__value_;
      id v49 = [v13 labels];
      uint64_t v26 = [v49 dataPointer];
      unint64_t v47 = [v50 objectAtIndexedSubscript:1];
      uint64_t v27 = [v47 unsignedIntegerValue];
      double v46 = [v50 objectAtIndexedSubscript:2];
      uint64_t v28 = [v46 unsignedIntegerValue];
      unint64_t v29 = (int64x2_t *)operator new(0x20uLL);
      *((void *)&v58 + 1) = v29 + 2;
      uint64_t v59 = v29 + 2;
      *unint64_t v29 = vdupq_n_s64(1uLL);
      v29[1].i64[0] = v27;
      v29[1].i64[1] = v28;
      *(void *)&long long v58 = v29;
      if (CoreRecognition::EspressoModelWrapper::bindInput(v25, v26))
      {
        uint64_t v30 = (uint64_t)v14->_espressoModel.__ptr_.__value_;
        id v45 = [v13 length];
        uint64_t v31 = [v45 dataPointer];
        unint64_t v32 = operator new(0x20uLL);
        *unint64_t v32 = xmmword_1DD8CE520;
        v32[1] = unk_1DD8CE530;
        double v55 = v32;
        if (CoreRecognition::EspressoModelWrapper::bindInput(v30, v31))
        {
          uint64_t v33 = (uint64_t)v14->_espressoModel.__ptr_.__value_;
          objc_msgSend(v13, "num_labels");
          id v34 = objc_claimAutoreleasedReturnValue();
          uint64_t v35 = [v34 dataPointer];
          unint64_t v36 = operator new(0x20uLL);
          *unint64_t v36 = xmmword_1DD8CE520;
          v36[1] = unk_1DD8CE530;
          __p = v36;
          int v37 = CoreRecognition::EspressoModelWrapper::bindInput(v33, v35);
          if (__p) {
            operator delete(__p);
          }

          int v38 = v37 ^ 1;
        }
        else
        {
          int v38 = 1;
        }
        if (v55) {
          operator delete(v55);
        }
      }
      else
      {
        int v38 = 1;
      }
      if ((void)v58)
      {
        *((void *)&v58 + 1) = v58;
        operator delete((void *)v58);
      }
    }
    else
    {
      int v38 = 1;
    }
    if ((void)buf)
    {
      *((void *)&buf + 1) = buf;
      operator delete((void *)buf);
    }

    if (v38)
    {
      long long v40 = CROSLogForCategory(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = "-[CRFormContentTypePredictor _predictAndAssignContentTypesForFields:fieldsAndReg"
                                        "ions:locale:updateExternal:]";
        _os_log_impl(&dword_1DD733000, v40, OS_LOG_TYPE_FAULT, "%s: Input binding failed for Espresso model", (uint8_t *)&buf, 0xCu);
      }

      goto LABEL_33;
    }
    if (CoreRecognition::EspressoModelWrapper::bindOutput((uint64_t)v14->_espressoModel.__ptr_.__value_, (uint64_t)&buf, (uint64_t)"score", 1))
    {
      if (CoreRecognition::EspressoModelWrapper::execute((CoreRecognition::EspressoModelWrapper *)v14->_espressoModel.__ptr_.__value_))
      {
        [(CRFormContentTypePredictor *)v14 _decodeEspressoOutput:&buf forFields:v52 locale:v12 updateExternal:v48];
        int v41 = 0;
LABEL_34:

        BOOL v39 = v41 == 0;
        objc_sync_exit(v14);

        goto LABEL_35;
      }
      uint64_t v42 = CROSLogForCategory(0);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        goto LABEL_32;
      }
      LODWORD(v58) = 136315138;
      *(void *)((char *)&v58 + 4) = "-[CRFormContentTypePredictor _predictAndAssignContentTypesForFields:fieldsAndRegio"
                                      "ns:locale:updateExternal:]";
      float v43 = "%s: Inference failed for Espresso model";
    }
    else
    {
      uint64_t v42 = CROSLogForCategory(0);
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
      {
LABEL_32:

LABEL_33:
        int v41 = 1;
        goto LABEL_34;
      }
      LODWORD(v58) = 136315138;
      *(void *)((char *)&v58 + 4) = "-[CRFormContentTypePredictor _predictAndAssignContentTypesForFields:fieldsAndRegio"
                                      "ns:locale:updateExternal:]";
      float v43 = "%s: Output binding failed for Espresso model";
    }
    _os_log_impl(&dword_1DD733000, v42, OS_LOG_TYPE_FAULT, v43, (uint8_t *)&v58, 0xCu);
    goto LABEL_32;
  }
  BOOL v39 = 0;
LABEL_35:

  return v39;
}

- (BOOL)predictAndAssignContentTypesForFields:(id)a3 fieldsAndRegions:(id)a4 locale:(id)a5 updateExternal:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v35 = a4;
  id v34 = a5;
  unint64_t v36 = objc_opt_new();
  uint64_t v9 = 0;
  for (uint64_t i = 1; ; ++i)
  {
    unint64_t v11 = [v35 count];
    unint64_t v12 = i - 1;
    if (i - 1 >= v11) {
      break;
    }
    size_t v13 = [v35 objectAtIndexedSubscript:i - 1];
    size_t v14 = &unk_1F3946040;
    id v15 = v13;
    if ([v15 conformsToProtocol:v14]) {
      id v16 = v15;
    }
    else {
      id v16 = 0;
    }

    if (v16)
    {
      id v17 = CRCastAsClass<CRFormField>(v16);
      id v18 = v17;
      if (!v17
        || ([v17 originalField],
            uint64_t v19 = objc_claimAutoreleasedReturnValue(),
            BOOL v20 = v19 == 0,
            v19,
            v20))
      {
        [v36 addObject:v16];
      }
      else
      {
        uint64_t v21 = [v18 originalField];
        [v36 addObject:v21];
      }
    }
    if (i - v9 - [v36 count] == 128
      || [v36 count] == 128
      || i == [v35 count])
    {
      BOOL v22 = objc_msgSend(v35, "subarrayWithRange:", v9, i - v9);
      uint64_t v23 = CROSLogForCategory(6);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = [v35 count];
        uint64_t v25 = [v36 count];
        *(_DWORD *)long long buf = 136316162;
        float v43 = "-[CRFormContentTypePredictor predictAndAssignContentTypesForFields:fieldsAndRegions:locale:updateExternal:]";
        __int16 v44 = 2048;
        uint64_t v45 = v9;
        __int16 v46 = 2048;
        uint64_t v47 = i - 1;
        __int16 v48 = 2048;
        uint64_t v49 = v24;
        __int16 v50 = 2048;
        uint64_t v51 = v25;
        _os_log_impl(&dword_1DD733000, v23, OS_LOG_TYPE_DEBUG, "%s: Predicting content types for range #%lu–%lu/%lu (including %lu fields)", buf, 0x34u);
      }

      if ([v36 count]
        && ![(CRFormContentTypePredictor *)self _predictAndAssignContentTypesForFields:v36 fieldsAndRegions:v22 locale:v34 updateExternal:v6])
      {

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v26 = v32;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v27; ++j)
            {
              if (*(void *)v38 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              if (+[CRFormContentTypeUtilities shouldAssignTextContentTypeForField:v30 updateExternalFields:v6 allowOverride:1 allowAllDetectionSources:1])
              {
                [v30 setTextContentType:1];
              }
            }
            uint64_t v27 = [v26 countByEnumeratingWithState:&v37 objects:v41 count:16];
          }
          while (v27);
        }

        break;
      }
      [v36 removeAllObjects];
      if (v9 + 1 > i - 25) {
        ++v9;
      }
      else {
        uint64_t v9 = i - 25;
      }
    }
  }

  return v12 >= v11;
}

- (void).cxx_destruct
{
  std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::destroy((char *)self->_customNoneBonuses.__tree_.__pair1_.__value_.__left_);
  std::unique_ptr<CoreRecognition::EspressoModelWrapper>::reset[abi:ne180100]((void ***)&self->_espressoModel, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 1) = 0;
  *((void *)self + 2) = (char *)self + 24;
  return self;
}

@end