void sub_2129ABD3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

__CFString *userVisibleStringForURL(NSURL *a1, BOOL *a2)
{
  v3 = a1;
  id v4 = [(NSURL *)v3 _lp_originalData];
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];
  int v7 = v6;
  if ((int)v6 >= 715827882)
  {
    v24 = 0;
  }
  else
  {
    v107 = v3;
    size_t v110 = (0x300000000 * v6 + 0x100000000) >> 32;
    v8 = (char *)malloc_type_malloc(v110, 0xE8F59FE3uLL);
    v9 = v8;
    v10 = v8;
    if (v7 >= 1)
    {
      int v11 = 0;
      v10 = v8;
      do
      {
        uint64_t v12 = v11;
        int v13 = *(unsigned __int8 *)(v5 + v11);
        uint64_t v14 = v11 + 1;
        BOOL v15 = v13 == 37 && (int)v14 < v7;
        if (!v15
          || (char v16 = *(unsigned char *)(v5 + v14), (v16 - 48) >= 0xAu)
          && (*(unsigned __int8 *)(v5 + v14) - 65 <= 0x25
            ? (BOOL v17 = ((1 << (v16 - 65)) & 0x3F0000003FLL) == 0)
            : (BOOL v17 = 1),
              v17)
          || (uint64_t v18 = v11 + 2, v11 + 2 >= v7)
          || (*(unsigned char *)(v5 + v18) - 48) >= 0xAu
          && ((v19 = *(unsigned __int8 *)(v5 + v18) - 65, BOOL v15 = v19 > 0x25, v20 = (1 << v19) & 0x3F0000003FLL, !v15)
            ? (BOOL v21 = v20 == 0)
            : (BOOL v21 = 1),
              v21))
        {
          *v10++ = v13;
        }
        else
        {
          int v22 = hexDigitValue(v16);
          unsigned int v23 = hexDigitValue(*(char *)(v5 + v18)) | (16 * v22);
          if (v23 < 0x80)
          {
            char *v10 = *(unsigned char *)(v5 + v12);
            v10[1] = *(unsigned char *)(v5 + v14);
            v10[2] = *(unsigned char *)(v5 + v18);
            v10 += 3;
          }
          else
          {
            *v10++ = v23;
          }
          int v11 = v12 + 2;
        }
        ++v11;
      }
      while (v11 < v7);
    }
    char *v10 = 0;
    v25 = [NSString stringWithUTF8String:v9];
    if (!v25)
    {
      int v26 = v10 - v9;
      v27 = &v9[v110 - ((int)v10 - (int)v9)];
      memmove(v27 - 1, v9, v26 + 1);
      unsigned int v28 = *(v27 - 1);
      v29 = v9;
      if (*(v27 - 1))
      {
        v30 = v9;
        do
        {
          if ((v28 & 0x80) != 0)
          {
            if (v28 <= 0x9F) {
              char v31 = 48;
            }
            else {
              char v31 = 55;
            }
            v30[1] = v31 + (v28 >> 4);
            v28 &= 0xFu;
            if (v28 <= 9) {
              char v32 = 48;
            }
            else {
              char v32 = 55;
            }
            char v33 = v32 + v28;
            v29 = v30 + 3;
            v30[2] = v33;
            LOBYTE(v28) = 37;
          }
          else
          {
            v29 = v30 + 1;
          }
          char *v30 = v28;
          unsigned int v34 = *v27++;
          unsigned int v28 = v34;
          v30 = v29;
        }
        while (v34);
      }
      char *v29 = 0;
      v25 = [NSString stringWithUTF8String:v9];
    }
    free(v9);
    v3 = v107;
    v35 = mapHostNames(v25, 0, a2);

    v36 = [v35 precomposedStringWithCanonicalMapping];

    if (a2 && !*a2)
    {
      __p = 0;
      p_p = &__p;
      uint64_t v115 = 0x2020000000;
      char v116 = 0;
      v112[0] = MEMORY[0x263EF8330];
      v112[1] = 3221225472;
      v112[2] = ___ZL23userVisibleStringForURLP5NSURLPb_block_invoke;
      v112[3] = &unk_2641960F0;
      v112[4] = &__p;
      v37 = (void *)MEMORY[0x216688A00](v112);
      applyHostNameFunctionToURLString(v36, v37);
      *a2 |= *((unsigned char *)p_p + 24);

      _Block_object_dispose(&__p, 8);
    }
    CFIndex Length = CFStringGetLength(v36);
    __p = 0;
    p_p = 0;
    uint64_t v115 = 0;
    if (Length)
    {
      std::vector<unsigned short>::__vallocate[abi:nn180100](&__p, Length);
      v39 = (char *)p_p;
      bzero(p_p, 2 * Length);
      p_p = &v39[2 * Length];
      v40 = (UniChar *)__p;
    }
    else
    {
      v40 = 0;
    }
    v123.location = 0;
    v123.length = Length;
    CFStringGetCharacters(v36, v123, v40);
    v119 = 0;
    v120 = 0;
    v121[0] = 0;
    if (Length >= 1)
    {
      v106 = v36;
      CFIndex v41 = 0;
      unsigned int v42 = 0;
      unsigned __int8 v43 = 0;
      uint64_t v44 = 0;
      CFIndex v108 = Length;
      while (1)
      {
        CFIndex v45 = v41 + 1;
        unsigned int v46 = *((unsigned __int16 *)__p + v41);
        if ((v46 & 0xFC00) != 0xD800 || v45 == Length)
        {
          CFIndex v48 = v41 + 1;
        }
        else
        {
          int v49 = *((unsigned __int16 *)__p + v45);
          BOOL v50 = (v49 & 0xFC00) == 56320;
          int v51 = v49 + (v46 << 10) - 56613888;
          if (v50) {
            unsigned int v46 = v51;
          }
          if (v50) {
            CFIndex v48 = v41 + 2;
          }
          else {
            CFIndex v48 = v41 + 1;
          }
        }
        CFIndex v109 = v48;
        unsigned int v111 = v46;
        if (isLookalikeCharacter(v44 | v43 | v42, v46))
        {
          if (v46 <= 0x7F)
          {
            LOBYTE(v117) = v46;
            uint64_t v52 = 1;
            goto LABEL_95;
          }
          if (v46 <= 0x7FF)
          {
            LOBYTE(v117) = (v46 >> 6) | 0xC0;
            HIBYTE(v117) = v46 & 0x3F | 0x80;
            uint64_t v52 = 2;
            goto LABEL_95;
          }
          if (v46 >> 11 < 0x1B || (v46 & 0xFFFFE000) == 0xE000)
          {
            LOBYTE(v117) = (v46 >> 12) | 0xE0;
            HIBYTE(v117) = (v46 >> 6) & 0x3F | 0x80;
            LOBYTE(v118) = v46 & 0x3F | 0x80;
            uint64_t v52 = 3;
LABEL_95:
            uint64_t v65 = 0;
            v66 = v120;
            do
            {
              v67 = (char *)v121[0];
              if ((unint64_t)v66 >= v121[0])
              {
                v69 = v119;
                uint64_t v70 = v66 - v119;
                if (v66 - v119 <= -3) {
                  abort();
                }
                uint64_t v71 = v70 >> 1;
                if (v121[0] - (void)v119 <= (unint64_t)((v70 >> 1) + 1)) {
                  uint64_t v72 = v71 + 1;
                }
                else {
                  uint64_t v72 = v121[0] - (void)v119;
                }
                if (v121[0] - (void)v119 >= 0x7FFFFFFFFFFFFFFEuLL) {
                  uint64_t v73 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v73 = v72;
                }
                if (v73)
                {
                  v74 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)v121, v73);
                  v69 = v119;
                  v66 = v120;
                }
                else
                {
                  v74 = 0;
                }
                v75 = &v74[2 * v71];
                *(_WORD *)v75 = 37;
                v68 = v75 + 2;
                while (v66 != v69)
                {
                  __int16 v76 = *((_WORD *)v66 - 1);
                  v66 -= 2;
                  *((_WORD *)v75 - 1) = v76;
                  v75 -= 2;
                }
                v67 = &v74[2 * v73];
                v119 = v75;
                v120 = v68;
                v121[0] = v67;
                if (v69)
                {
                  operator delete(v69);
                  v67 = (char *)v121[0];
                }
              }
              else
              {
                *(_WORD *)v66 = 37;
                v68 = v66 + 2;
              }
              v120 = v68;
              unsigned int v77 = *((unsigned __int8 *)&v117 + v65);
              if (v77 <= 0x9F) {
                int v78 = 48;
              }
              else {
                int v78 = 55;
              }
              unsigned int v79 = v78 + (v77 >> 4);
              if (v68 >= v67)
              {
                v81 = v119;
                uint64_t v82 = v68 - v119;
                if (v68 - v119 <= -3) {
                  abort();
                }
                uint64_t v83 = v82 >> 1;
                unint64_t v84 = v67 - v119;
                if (v84 <= (v82 >> 1) + 1) {
                  unint64_t v85 = v83 + 1;
                }
                else {
                  unint64_t v85 = v84;
                }
                if (v84 >= 0x7FFFFFFFFFFFFFFELL) {
                  uint64_t v86 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v86 = v85;
                }
                if (v86)
                {
                  v87 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)v121, v86);
                  v81 = v119;
                  v68 = v120;
                }
                else
                {
                  v87 = 0;
                }
                v88 = &v87[2 * v83];
                *(_WORD *)v88 = v79;
                v80 = v88 + 2;
                while (v68 != v81)
                {
                  __int16 v89 = *((_WORD *)v68 - 1);
                  v68 -= 2;
                  *((_WORD *)v88 - 1) = v89;
                  v88 -= 2;
                }
                v67 = &v87[2 * v86];
                v119 = v88;
                v120 = v80;
                v121[0] = v67;
                if (v81)
                {
                  operator delete(v81);
                  v67 = (char *)v121[0];
                }
              }
              else
              {
                *(_WORD *)v68 = v79;
                v80 = v68 + 2;
              }
              char v90 = *((unsigned char *)&v117 + v65);
              v120 = v80;
              unsigned int v91 = v90 & 0xF;
              if (v91 <= 9) {
                __int16 v92 = 48;
              }
              else {
                __int16 v92 = 55;
              }
              __int16 v93 = v92 + v91;
              if (v80 >= v67)
              {
                v94 = v119;
                uint64_t v95 = v80 - v119;
                if (v80 - v119 <= -3) {
                  abort();
                }
                uint64_t v96 = v95 >> 1;
                unint64_t v97 = v67 - v119;
                if (v97 <= (v95 >> 1) + 1) {
                  unint64_t v98 = v96 + 1;
                }
                else {
                  unint64_t v98 = v97;
                }
                if (v97 >= 0x7FFFFFFFFFFFFFFELL) {
                  uint64_t v99 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v99 = v98;
                }
                if (v99)
                {
                  v100 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)v121, v99);
                  v94 = v119;
                  v80 = v120;
                }
                else
                {
                  v100 = 0;
                }
                v101 = &v100[2 * v96];
                *(_WORD *)v101 = v93;
                v66 = v101 + 2;
                while (v80 != v94)
                {
                  __int16 v102 = *((_WORD *)v80 - 1);
                  v80 -= 2;
                  *((_WORD *)v101 - 1) = v102;
                  v101 -= 2;
                }
                v119 = v101;
                v120 = v66;
                v121[0] = &v100[2 * v99];
                if (v94) {
                  operator delete(v94);
                }
              }
              else
              {
                *(_WORD *)v80 = v93;
                v66 = v80 + 2;
              }
              v120 = v66;
              ++v65;
            }
            while (v65 != v52);
            goto LABEL_154;
          }
          if (!((v46 - 0x10000) >> 20))
          {
            LOBYTE(v117) = (v46 >> 18) | 0xF0;
            HIBYTE(v117) = (v46 >> 12) & 0x3F | 0x80;
            LOBYTE(v118) = (v46 >> 6) & 0x3F | 0x80;
            HIBYTE(v118) = v46 & 0x3F | 0x80;
            uint64_t v52 = 4;
            goto LABEL_95;
          }
        }
        else
        {
          if (!HIWORD(v46))
          {
            __int16 v117 = v46;
            uint64_t v53 = 1;
            goto LABEL_70;
          }
          if (HIWORD(v46) <= 0x10u)
          {
            __int16 v117 = (v46 >> 10) - 10304;
            __int16 v118 = v46 & 0x3FF | 0xDC00;
            uint64_t v53 = 2;
LABEL_70:
            uint64_t v54 = 0;
            v55 = v120;
            do
            {
              if ((unint64_t)v55 >= v121[0])
              {
                v57 = v119;
                uint64_t v58 = v55 - v119;
                if (v55 - v119 <= -3) {
                  abort();
                }
                uint64_t v59 = v58 >> 1;
                if (v121[0] - (void)v119 <= (unint64_t)((v58 >> 1) + 1)) {
                  uint64_t v60 = v59 + 1;
                }
                else {
                  uint64_t v60 = v121[0] - (void)v119;
                }
                if (v121[0] - (void)v119 >= 0x7FFFFFFFFFFFFFFEuLL) {
                  uint64_t v61 = 0x7FFFFFFFFFFFFFFFLL;
                }
                else {
                  uint64_t v61 = v60;
                }
                if (v61)
                {
                  v62 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)v121, v61);
                  v57 = v119;
                  v55 = v120;
                }
                else
                {
                  v62 = 0;
                }
                v63 = &v62[2 * v59];
                *(_WORD *)v63 = *(&v117 + v54);
                v56 = v63 + 2;
                while (v55 != v57)
                {
                  __int16 v64 = *((_WORD *)v55 - 1);
                  v55 -= 2;
                  *((_WORD *)v63 - 1) = v64;
                  v63 -= 2;
                }
                v119 = v63;
                v120 = v56;
                v121[0] = &v62[2 * v61];
                if (v57) {
                  operator delete(v57);
                }
              }
              else
              {
                *(_WORD *)v55 = *(&v117 + v54);
                v56 = v55 + 2;
              }
              v120 = v56;
              ++v54;
              v55 = v56;
            }
            while (v54 != v53);
          }
        }
LABEL_154:
        unsigned __int8 v43 = v111;
        unsigned int v42 = v111 & 0xFFFFFF00;
        uint64_t v44 = 0x100000000;
        CFIndex Length = v108;
        CFIndex v41 = v109;
        if (v109 >= v108)
        {
          v103 = (const UniChar *)v119;
          v104 = v120;
          v3 = v107;
          v36 = v106;
          goto LABEL_157;
        }
      }
    }
    v104 = 0;
    v103 = 0;
LABEL_157:
    v24 = (__CFString *)CFStringCreateWithCharacters(0, v103, (v104 - (char *)v103) >> 1);
    if (v119)
    {
      v120 = v119;
      operator delete(v119);
    }
    if (__p)
    {
      p_p = __p;
      operator delete(__p);
    }
  }
  return v24;
}

void sub_2129AC624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  _Block_object_dispose(&__p, 8);
  _Unwind_Resume(a1);
}

void sub_2129AC86C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Block_object_dispose((const void *)(v25 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2129AC8E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSString *encodeHostName(NSString *a1)
{
  v1 = a1;
  if ([(NSString *)v1 canBeConvertedToEncoding:1])
  {
    v2 = v1;
  }
  else
  {
    v11.length = [(NSString *)v1 length];
    v11.location = 0;
    uint64_t v6 = encodeHostNameWithRange(v1, v11, v3, v4, v5);
    int v7 = (void *)v6;
    if (v6) {
      v8 = (void *)v6;
    }
    else {
      v8 = v1;
    }
    v2 = v8;
  }
  return v2;
}

void sub_2129AC988(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id decodeHostName(NSString *a1)
{
  v1 = a1;
  v8.length = [(NSString *)v1 length];
  v8.location = 0;
  uint64_t v4 = decodeHostNameWithRange(v1, v8, 0, v2, v3);
  uint64_t v5 = v4;
  if (!v4) {
    uint64_t v4 = v1;
  }
  id v6 = v4;

  return v6;
}

void sub_2129ACA00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id decodeHostNameWithRange(NSString *a1, _NSRange a2, BOOL *a3, uint64_t a4, BOOL *a5)
{
  uint64_t v5 = mapHostNameWithRange(a1, a2, 0, (uint64_t)a3, a5);
  return v5;
}

id mapHostNameWithRange(NSString *a1, _NSRange a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  uint64_t v5 = (void *)MEMORY[0x270FA5388](a1, a2.location, a2.length, a3, a4, a5);
  int v7 = v6;
  int v9 = v8;
  unint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v87 = *MEMORY[0x263EF8340];
  uint64_t v14 = v5;
  BOOL v15 = v14;
  if (v11 > 0x800 || ![(__CFString *)v14 length]) {
    goto LABEL_147;
  }
  if (v9
    && [(__CFString *)v15 rangeOfString:@"%", 2, v13, v11 options range] != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[__CFString substringWithRange:](v15, "substringWithRange:", v13, v11);
    char v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    BOOL v17 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, v16, &stru_26C3C6F50);

    if (v17)
    {
      uint64_t v18 = v17;

      unint64_t v11 = [(__CFString *)v18 length];
      uint64_t v13 = 0;
      BOOL v15 = v18;
    }
  }
  -[__CFString getCharacters:range:](v15, "getCharacters:range:", v83, v13, v11);
  int v81 = 0;
  long long v80 = xmmword_2129B25C0;
  if (v9) {
    unsigned int v19 = (uint64_t (*)(uint64_t, unsigned char *, unint64_t, _WORD *, uint64_t, long long *, int *))MEMORY[0x263F8C478];
  }
  else {
    unsigned int v19 = (uint64_t (*)(uint64_t, unsigned char *, unint64_t, _WORD *, uint64_t, long long *, int *))MEMORY[0x263F8C480];
  }
  if (internationalDomainNameTranscoder(void)::onceToken != -1) {
    dispatch_once(&internationalDomainNameTranscoder(void)::onceToken, &__block_literal_global_55);
  }
  int v20 = v19(internationalDomainNameTranscoder(void)::encoder, v83, v11, __s2, 2048, &v80, &v81);
  if (v81 > 0 || DWORD1(v80)) {
    goto LABEL_144;
  }
  int v21 = v20;
  if (v20 == v11 && !memcmp(v83, __s2, 2 * (int)v11))
  {
LABEL_147:
    v69 = 0;
    goto LABEL_148;
  }
  if ((v9 & 1) == 0)
  {
    if (allCharactersInIDNScriptAllowList(unsigned short const*,int)::onceToken != -1) {
      dispatch_once(&allCharactersInIDNScriptAllowList(unsigned short const*,int)::onceToken, &__block_literal_global_57);
    }
    if (v21 >= 1)
    {
      int v22 = 0;
      unsigned int v23 = 0;
      unsigned __int8 v24 = 0;
      uint64_t v25 = 0;
      while (1)
      {
        uint64_t v26 = v22 + 1;
        UChar32 v27 = (unsigned __int16)__s2[v22];
        if ((v27 & 0xFC00) != 0xD800 || v26 == v21)
        {
          ++v22;
        }
        else
        {
          int v29 = (unsigned __int16)__s2[v26];
          BOOL v30 = (v29 & 0xFC00) == 56320;
          UChar32 v31 = (v27 << 10) - 56613888 + v29;
          if (v30) {
            UChar32 v27 = v31;
          }
          if (v30) {
            v22 += 2;
          }
          else {
            ++v22;
          }
        }
        LODWORD(v84) = 0;
        uint64_t Script = uscript_getScript();
        if (v84)
        {
          NSLog(&cfstr_GotIcuErrorWhi.isa, v84);
          goto LABEL_43;
        }
        if ((Script & 0x80000000) != 0) {
          break;
        }
        if (Script > 0xC7
          || ((IDNScriptAllowList[Script >> 5] >> Script) & 1) == 0
          || isLookalikeCharacter(v25 | v24 | v23, v27))
        {
          goto LABEL_43;
        }
        unsigned int v23 = v27 & 0xFFFFFF00;
        uint64_t v25 = 0x100000000;
        unsigned __int8 v24 = v27;
        if (v22 >= v21) {
          goto LABEL_152;
        }
      }
      NSLog(&cfstr_GotNegativeNum.isa, Script);
LABEL_43:
      if (__s2[v21 - 1] == 46) {
        unsigned int v33 = v21 - 1;
      }
      else {
        unsigned int v33 = v21;
      }
      uint64_t v34 = v33 - 4;
      if ((int)v33 >= 4)
      {
        v35 = &__s2[v33];
        if (*(_DWORD *)(v35 - 3) != 71303214 || *(v35 - 1) != 1092)
        {
          uint64_t v37 = v33 - 5;
          if (v33 < 5)
          {
LABEL_95:
            int v52 = *(_DWORD *)(v35 - 3);
            int v53 = (unsigned __int16)*(v35 - 1);
            if (v52 != 70320174 || v53 != 1075) {
              goto LABEL_144;
            }
            uint64_t v55 = v33 - 3;
            unint64_t v84 = &unk_26C3C6DD8;
            uint64_t v86 = &v84;
            while ((int)v55 > 0)
            {
              int v43 = (unsigned __int16)__s2[v55 - 1];
              std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v55]);
              if ((v56 & 1) == 0) {
                goto LABEL_143;
              }
            }
            goto LABEL_151;
          }
          if (*((void *)v35 - 1) == 0x44104430440002ELL)
          {
            unint64_t v84 = &unk_26C3C6C70;
            unint64_t v85 = isRussianDomainNameCharacter;
            uint64_t v86 = &v84;
            while ((int)v34 > 0)
            {
              int v43 = (unsigned __int16)__s2[v34 - 1];
              std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v34]);
              if ((v47 & 1) == 0) {
                goto LABEL_143;
              }
            }
            goto LABEL_151;
          }
          if (v33 < 8)
          {
            if (v33 <= 5) {
              goto LABEL_88;
            }
            v39 = v35 - 5;
            if (*(void *)(v35 - 5) != 0x44204350434002ELL || *(v35 - 1) != 1080)
            {
LABEL_84:
              uint64_t v49 = *(void *)v39;
              int v50 = (unsigned __int16)v39[4];
              if (v49 == 0x43904300441002ELL && v50 == 1090)
              {
                unint64_t v84 = &unk_26C3C6C70;
                unint64_t v85 = isRussianDomainNameCharacter;
                uint64_t v86 = &v84;
                while ((int)v37 > 0)
                {
                  int v43 = (unsigned __int16)__s2[v37 - 1];
                  std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v37]);
                  if ((v61 & 1) == 0) {
                    goto LABEL_143;
                  }
                }
                goto LABEL_151;
              }
LABEL_88:
              switch(*((void *)v35 - 1))
              {
                case 0x4330440043E002ELL:
                  unint64_t v84 = &unk_26C3C6C70;
                  unint64_t v85 = isRussianDomainNameCharacter;
                  uint64_t v86 = &v84;
                  while ((int)v34 > 0)
                  {
                    int v43 = (unsigned __int16)__s2[v34 - 1];
                    std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v34]);
                    if ((v60 & 1) == 0) {
                      goto LABEL_143;
                    }
                  }
                  break;
                case 0x43B04350431002ELL:
                  unint64_t v84 = &unk_26C3C6BE0;
                  uint64_t v86 = &v84;
                  while ((int)v34 > 0)
                  {
                    int v43 = (unsigned __int16)__s2[v34 - 1];
                    std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v34]);
                    if ((v62 & 1) == 0) {
                      goto LABEL_143;
                    }
                  }
                  break;
                case 0x4370430049B002ELL:
                  unint64_t v84 = &unk_26C3C6C28;
                  uint64_t v86 = &v84;
                  while ((int)v34 > 0)
                  {
                    int v43 = (unsigned __int16)__s2[v34 - 1];
                    std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v34]);
                    if ((v63 & 1) == 0) {
                      goto LABEL_143;
                    }
                  }
                  break;
                case 0x440043A0443002ELL:
                  unint64_t v84 = &unk_26C3C6CB8;
                  uint64_t v86 = &v84;
                  while ((int)v34 > 0)
                  {
                    int v43 = (unsigned __int16)__s2[v34 - 1];
                    std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v34]);
                    if ((v64 & 1) == 0) {
                      goto LABEL_143;
                    }
                  }
                  break;
                case 0x43104400441002ELL:
                  unint64_t v84 = &unk_26C3C6D00;
                  uint64_t v86 = &v84;
                  while ((int)v34 > 0)
                  {
                    int v43 = (unsigned __int16)__s2[v34 - 1];
                    std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v34]);
                    if ((v65 & 1) == 0) {
                      goto LABEL_143;
                    }
                  }
                  break;
                case 0x434043A043C002ELL:
                  unint64_t v84 = &unk_26C3C6D48;
                  uint64_t v86 = &v84;
                  while ((int)v34 > 0)
                  {
                    int v43 = (unsigned __int16)__s2[v34 - 1];
                    std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v34]);
                    if ((v66 & 1) == 0) {
                      goto LABEL_143;
                    }
                  }
                  break;
                case 0x43D043E043C002ELL:
                  unint64_t v84 = &unk_26C3C6D90;
                  uint64_t v86 = &v84;
                  while ((int)v34 > 0)
                  {
                    int v43 = (unsigned __int16)__s2[v34 - 1];
                    std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v34]);
                    if ((v67 & 1) == 0) {
                      goto LABEL_143;
                    }
                  }
                  break;
                default:
                  goto LABEL_95;
              }
LABEL_151:
              std::__function::__value_func<BOOL ()(unsigned short)>::~__value_func[abi:nn180100](&v84);
LABEL_152:
              int v71 = 0;
              v68 = v7;
              while (1)
              {
                uint64_t v72 = v71 + 1;
                int v73 = (unsigned __int16)__s2[v71];
                if ((v73 & 0xFC00) != 0xD800 || v72 == v21)
                {
                  if (v73 == 37) {
                    goto LABEL_171;
                  }
                }
                else
                {
                  int v75 = (unsigned __int16)__s2[v72];
                  BOOL v76 = (v75 & 0xFC00) == 56320;
                  int v77 = v71 + 2;
                  int v78 = (v73 << 10) - 56613888 + v75;
                  if (v76) {
                    int v73 = v78;
                  }
                  if (v76) {
                    LODWORD(v72) = v77;
                  }
                }
                if ((v73 - 35) <= 0x3A
                  && ((1 << (v73 - 35)) & 0x700000030801005) != 0)
                {
                  goto LABEL_145;
                }
LABEL_171:
                int v71 = v72;
                if ((int)v72 >= v21) {
                  goto LABEL_172;
                }
              }
            }
          }
          else
          {
            if (*(void *)(v35 - 7) == 0x441043E043C002ELL && *((void *)v35 - 1) == 0x4300432043A0441)
            {
              uint64_t v58 = v33 - 7;
              unint64_t v84 = &unk_26C3C6C70;
              unint64_t v85 = isRussianDomainNameCharacter;
              uint64_t v86 = &v84;
              while ((int)v58 > 0)
              {
                int v43 = (unsigned __int16)__s2[v58 - 1];
                std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v58]);
                if ((v59 & 1) == 0) {
                  goto LABEL_143;
                }
              }
              goto LABEL_151;
            }
            v39 = v35 - 5;
            if (*(void *)(v35 - 5) != 0x44204350434002ELL || *(v35 - 1) != 1080)
            {
              if (*(void *)(v35 - 7) == 0x43B043D043E002ELL && *((void *)v35 - 1) == 0x43D04390430043BLL)
              {
                uint64_t v42 = v33 - 7;
                unint64_t v84 = &unk_26C3C6C70;
                unint64_t v85 = isRussianDomainNameCharacter;
                uint64_t v86 = &v84;
                while ((int)v42 > 0)
                {
                  int v43 = (unsigned __int16)__s2[v42 - 1];
                  std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v42]);
                  if ((v44 & 1) == 0) {
                    goto LABEL_143;
                  }
                }
                goto LABEL_151;
              }
              goto LABEL_84;
            }
          }
          unint64_t v84 = &unk_26C3C6C70;
          unint64_t v85 = isRussianDomainNameCharacter;
          uint64_t v86 = &v84;
          while ((int)v37 > 0)
          {
            int v43 = (unsigned __int16)__s2[v37 - 1];
            std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v37]);
            if ((v57 & 1) == 0) {
              goto LABEL_143;
            }
          }
          goto LABEL_151;
        }
        uint64_t v45 = v33 - 3;
        unint64_t v84 = &unk_26C3C6C70;
        unint64_t v85 = isRussianDomainNameCharacter;
        uint64_t v86 = &v84;
        do
        {
          if ((int)v45 <= 0) {
            goto LABEL_151;
          }
          int v43 = (unsigned __int16)__s2[v45 - 1];
          std::function<BOOL ()(unsigned short)>::operator()((uint64_t)&v84, __s2[--v45]);
        }
        while ((v46 & 1) != 0);
LABEL_143:
        std::__function::__value_func<BOOL ()(unsigned short)>::~__value_func[abi:nn180100](&v84);
        if (v43 == 46) {
          goto LABEL_152;
        }
      }
LABEL_144:
      v68 = v7;
LABEL_145:
      if (v68)
      {
        v69 = 0;
        unsigned char *v68 = 1;
        goto LABEL_148;
      }
      goto LABEL_147;
    }
  }
LABEL_172:
  v69 = [NSString stringWithCharacters:__s2 length:v21];
LABEL_148:

  return v69;
}

void sub_2129AD5AC(_Unwind_Exception *a1)
{
  std::__function::__value_func<BOOL ()(unsigned short)>::~__value_func[abi:nn180100]((void *)(v2 - 128));

  _Unwind_Resume(a1);
}

BOOL isLookalikeCharacter(uint64_t a1, UChar32 c)
{
  if (!u_isprint(c) || u_isUWhiteSpace(c) || u_hasBinaryProperty(c, UCHAR_DEFAULT_IGNORABLE_CODE_POINT)) {
    return 1;
  }
  UBlockCode Code = ublock_getCode(c);
  BOOL result = 1;
  if (Code == UBLOCK_IPA_EXTENSIONS || Code == UBLOCK_DESERET) {
    return result;
  }
  if (c > 8721)
  {
    if (c <= 12289)
    {
      if (c > 11002)
      {
        if ((c - 12272) < 0xC || c == 11003) {
          return result;
        }
        int v9 = 11005;
      }
      else if (c <= 9133)
      {
        if ((c - 8722) <= 0x24 && ((1 << (c - 18)) & 0x1000000019) != 0) {
          return result;
        }
        int v9 = 9023;
      }
      else if (c <= 9584)
      {
        if (c == 9134) {
          return result;
        }
        int v9 = 9290;
      }
      else
      {
        if ((c - 9585) < 2 || c == 10742) {
          return result;
        }
        int v9 = 10744;
      }
    }
    else if (c > 65043)
    {
      if (c <= 65376)
      {
        if ((c - 65087) <= 0x1F && ((1 << (c - 63)) & 0xC0000001) != 0 || (c - 65044) < 2) {
          return result;
        }
        int v8 = -65294;
        goto LABEL_72;
      }
      if ((c - 128271) < 5 || (c - 65532) < 2) {
        return result;
      }
      int v9 = 65377;
    }
    else
    {
      if (c <= 13229)
      {
        if ((c - 12290) <= 0x33 && ((1 << (c - 2)) & 0xA0000000C0041) != 0) {
          return result;
        }
        int v8 = -12829;
        goto LABEL_72;
      }
      if (c <= 42800)
      {
        if ((c - 13230) > 0x31 || ((1 << (c + 82)) & 0x2000001000003) == 0) {
          goto LABEL_86;
        }
        return result;
      }
      if (c == 42801 || c == 42865) {
        return result;
      }
      int v9 = 42889;
    }
    goto LABEL_85;
  }
  if (c > 5940)
  {
    if (c > 8207)
    {
      if ((c - 8531) < 0xD
        || (c - 8228) <= 0x2E && ((1 << (c - 36)) & 0x400120600009) != 0)
      {
        return result;
      }
      int v8 = -8208;
      goto LABEL_72;
    }
    if (c > 7835)
    {
      if ((c - 7836) < 2) {
        return result;
      }
      int v8 = -7934;
LABEL_72:
      if ((c + v8) < 2) {
        return result;
      }
      goto LABEL_86;
    }
    if ((c - 7428) <= 0x1E && ((1 << (c - 4)) & 0x71000801) != 0) {
      return result;
    }
    int v9 = 5941;
LABEL_85:
    if (c != v9) {
      goto LABEL_86;
    }
    return result;
  }
  if (c <= 1416)
  {
    if (c <= 566)
    {
      if (c > 447)
      {
        if (c != 448 && c != 451) {
          goto LABEL_86;
        }
      }
      else if ((c - 188) >= 3)
      {
        if (c == 46) {
          return 0;
        }
        goto LABEL_86;
      }
      return result;
    }
    if (c <= 774)
    {
      if (((c - 567) > 0x2A || ((1 << (c - 55)) & 0x40004000001) == 0) && c != 720) {
        goto LABEL_86;
      }
      return result;
    }
    if ((c - 823) < 2) {
      return result;
    }
    if (c == 775)
    {
      BOOL v11 = a1 == 567 || a1 == 305;
      if ((a1 & 0xFF00000000) == 0 || !v11) {
        return (a1 & 0xFF00000000) != 0 && a1 == 1493;
      }
      return result;
    }
    if (c == 821) {
      return result;
    }
LABEL_86:
    if ((isLookalikeSequence<(UScriptCode)3>(a1, c) & 1) != 0
      || (isLookalikeSequence<(UScriptCode)35>(a1, c) & 1) != 0
      || (isLookalikeSequence<(UScriptCode)40>(a1, c) & 1) != 0
      || (isLookalikeSequence<(UScriptCode)38>(a1, c) & 1) != 0)
    {
      return 1;
    }
    if ((c - 1611) <= 0x14)
    {
      if ((a1 & 0xFF00000000) != 0) {
        return ublock_getCode(a1) != UBLOCK_ARABIC;
      }
      return 1;
    }
    return 0;
  }
  if (c > 1615)
  {
    if ((c - 1748) <= 0x30 && ((1 << (c + 44)) & 0x1E00010000001) != 0) {
      return result;
    }
    if ((c - 1616) > 0x1A) {
      goto LABEL_86;
    }
    int v6 = 1 << (c - 80);
    int v7 = 67174401;
  }
  else
  {
    if ((c - 1417) <= 0x3B && ((1 << (c + 119)) & 0xF0B080000000001) != 0) {
      return result;
    }
    if ((c - 1524) > 0x16) {
      goto LABEL_86;
    }
    int v6 = 1 << (c + 12);
    int v7 = 6291457;
  }
  if ((v6 & v7) == 0) {
    goto LABEL_86;
  }
  return result;
}

uint64_t isLookalikeSequence<(UScriptCode)40>(uint64_t a1, unsigned __int16 a2)
{
  uint64_t result = 0;
  if ((a1 & 0xFF00000000) != 0 && a1 != 47)
  {
    if (isLookalikeCharacterOfScriptType<(UScriptCode)40>(a2) && !isOfScriptType<(UScriptCode)40>())
    {
      if ((unsigned __int16)(a1 - 33) >= 0x20u)
      {
        uint64_t result = 1;
        if ((unsigned __int16)a1 - 94 > 0x20
          || ((1 << (a1 - 94)) & 0x1E0000007) == 0)
        {
          return result;
        }
      }
      else if (unsigned __int16)(a1 - 35) < 0x1Eu && ((0x30801005u >> (a1 - 35)))
      {
        return 1;
      }
    }
    uint64_t result = isLookalikeCharacterOfScriptType<(UScriptCode)40>((unsigned __int16)a1);
    if (result)
    {
      if (isOfScriptType<(UScriptCode)40>())
      {
        return 0;
      }
      else
      {
        unsigned int v5 = (0x30801005u >> (a2 - 35)) & 1;
        if ((unsigned __int16)(a2 - 35) >= 0x1Eu) {
          unsigned int v5 = 0;
        }
        unint64_t v6 = (0x1FFFFFF8uLL >> (a2 - 94)) & 1;
        if ((unsigned __int16)(a2 - 94) >= 0x21u) {
          LODWORD(v6) = 1;
        }
        if ((unsigned __int16)(a2 - 33) >= 0x20u) {
          return v6;
        }
        else {
          return v5;
        }
      }
    }
  }
  return result;
}

uint64_t isLookalikeCharacterOfScriptType<(UScriptCode)40>(int a1)
{
  uint64_t result = 1;
  if (a1 > 5572)
  {
    if (((a1 - 5573) > 0x2F || ((1 << (a1 + 59)) & 0x901002000001) == 0)
      && (a1 - 5741) >= 2)
    {
      return 0;
    }
  }
  else if ((a1 - 5229) > 0x3D || ((1 << (a1 - 109)) & 0x2000000000000025) == 0)
  {
    unsigned int v3 = a1 - 5500;
    if (v3 > 0x38 || ((1 << v3) & 0x108000000000801) == 0) {
      return 0;
    }
  }
  return result;
}

unint64_t isLookalikeSequence<(UScriptCode)3>(uint64_t a1, unsigned __int16 a2)
{
  unint64_t result = 0;
  if ((a1 & 0xFF00000000) != 0 && a1 != 47)
  {
    if (a2 - 1352 <= 0x3D
      && ((1 << (a2 - 72)) & 0x2221000000002221) != 0
      && !isOfScriptType<(UScriptCode)3>())
    {
      unsigned int v5 = (0x30801005u >> (a1 - 35)) & 1;
      if ((unsigned __int16)(a1 - 35) >= 0x1Eu) {
        unsigned int v5 = 0;
      }
      unint64_t v6 = (0x1FFFFFF8uLL >> (a1 - 94)) & 1;
      if ((unsigned __int16)(a1 - 94) >= 0x21u) {
        LODWORD(v6) = 1;
      }
      if ((unsigned __int16)(a1 - 33) >= 0x20u) {
        return v6;
      }
      else {
        return v5;
      }
    }
    else
    {
      unint64_t result = 0;
      if ((unsigned __int16)a1 - 1352 <= 0x3D
        && ((1 << (a1 - 72)) & 0x2221000000002221) != 0)
      {
        if (isOfScriptType<(UScriptCode)3>())
        {
          return 0;
        }
        else if ((unsigned __int16)(a2 - 33) >= 0x20u)
        {
          if ((unsigned __int16)(a2 - 94) >= 0x21u) {
            return 1;
          }
          else {
            return (0x1FFFFFF8uLL >> (a2 - 94)) & 1;
          }
        }
        else if ((unsigned __int16)(a2 - 35) >= 0x1Eu)
        {
          return 0;
        }
        else
        {
          return (0x30801005u >> (a2 - 35)) & 1;
        }
      }
    }
  }
  return result;
}

uint64_t isLookalikeSequence<(UScriptCode)38>(uint64_t a1, __int16 a2)
{
  uint64_t result = 0;
  if ((a1 & 0xFF00000000) != 0 && a1 != 47)
  {
    if (a2 == 3585 && !isOfScriptType<(UScriptCode)38>())
    {
      unsigned int v5 = (unsigned __int16)(a1 - 33);
      unsigned int v6 = (0x30801005u >> (a1 - 35)) & 1;
      if ((unsigned __int16)(a1 - 35) >= 0x1Eu) {
        unsigned int v6 = 0;
      }
      unsigned __int16 v7 = a1 - 94;
    }
    else
    {
      if ((unsigned __int16)a1 != 3585 || isOfScriptType<(UScriptCode)38>()) {
        return 0;
      }
      unsigned int v5 = (unsigned __int16)(a2 - 33);
      unsigned int v6 = (0x30801005u >> (a2 - 35)) & 1;
      if ((unsigned __int16)(a2 - 35) >= 0x1Eu) {
        unsigned int v6 = 0;
      }
      unsigned __int16 v7 = a2 - 94;
    }
    BOOL v8 = v7 >= 0x21u;
    unint64_t v9 = (0x1FFFFFF8uLL >> v7) & 1;
    if (v8) {
      LODWORD(v9) = 1;
    }
    if (v5 >= 0x20) {
      return v9;
    }
    else {
      return v6;
    }
  }
  return result;
}

uint64_t isLookalikeSequence<(UScriptCode)35>(uint64_t a1, __int16 a2)
{
  uint64_t result = 0;
  if ((a1 & 0xFF00000000) != 0 && a1 != 47)
  {
    if (a2 == 3046 && !isOfScriptType<(UScriptCode)35>())
    {
      unsigned int v5 = (unsigned __int16)(a1 - 33);
      unsigned int v6 = (0x30801005u >> (a1 - 35)) & 1;
      if ((unsigned __int16)(a1 - 35) >= 0x1Eu) {
        unsigned int v6 = 0;
      }
      unsigned __int16 v7 = a1 - 94;
    }
    else
    {
      if ((unsigned __int16)a1 != 3046 || isOfScriptType<(UScriptCode)35>()) {
        return 0;
      }
      unsigned int v5 = (unsigned __int16)(a2 - 33);
      unsigned int v6 = (0x30801005u >> (a2 - 35)) & 1;
      if ((unsigned __int16)(a2 - 35) >= 0x1Eu) {
        unsigned int v6 = 0;
      }
      unsigned __int16 v7 = a2 - 94;
    }
    BOOL v8 = v7 >= 0x21u;
    unint64_t v9 = (0x1FFFFFF8uLL >> v7) & 1;
    if (v8) {
      LODWORD(v9) = 1;
    }
    if (v5 >= 0x20) {
      return v9;
    }
    else {
      return v6;
    }
  }
  return result;
}

void sub_2129AE1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_2129AE310(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(2 * a2);
}

NSString *mapHostNames(NSString *a1, int a2, BOOL *a3)
{
  unsigned int v5 = a1;
  unsigned int v6 = v5;
  if (a2 && [(NSString *)v5 canBeConvertedToEncoding:1])
  {
    unsigned __int16 v7 = v6;
  }
  else
  {
    uint64_t v28 = 0;
    int v29 = &v28;
    uint64_t v30 = 0x3032000000;
    UChar32 v31 = __Block_byref_object_copy__0;
    char v32 = __Block_byref_object_dispose__0;
    id v33 = 0;
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = ___ZL12mapHostNamesP8NSStringbPb_block_invoke;
    v27[3] = &unk_2641960F0;
    v27[4] = &v28;
    BOOL v8 = (void *)MEMORY[0x216688A00](v27);
    applyHostNameFunctionToURLString(v6, v8);
    unint64_t v9 = (void *)v29[5];
    if (v9)
    {
      int v10 = [v9 count];
      BOOL v11 = 0;
      if (v10)
      {
        unsigned int v12 = v10 - 1;
        do
        {
          uint64_t v13 = v12;
          uint64_t v14 = [(id)v29[5] objectAtIndex:v12];
          NSUInteger v15 = [v14 rangeValue];
          NSUInteger v17 = v16;

          BOOL v26 = 0;
          v21.location = v15;
          v21.length = v17;
          if (a2) {
            encodeHostNameWithRange(v6, v21, v18, v19, v20);
          }
          else {
          uint64_t v22 = decodeHostNameWithRange(v6, v21, &v26, v19, v20);
          }
          unsigned int v23 = (void *)v22;
          if (a3) {
            *a3 |= v26;
          }
          if (v22)
          {
            if (!v11) {
              BOOL v11 = (void *)[(NSString *)v6 mutableCopy];
            }
            objc_msgSend(v11, "replaceCharactersInRange:withString:", v15, v17, v23);
          }

          --v12;
        }
        while (v13);
      }
      if (v11) {
        unsigned __int8 v24 = (NSString *)v11;
      }
      else {
        unsigned __int8 v24 = v6;
      }
      unsigned __int16 v7 = v24;
    }
    else
    {
      unsigned __int16 v7 = v6;
    }

    _Block_object_dispose(&v28, 8);
  }

  return v7;
}

void sub_2129AE594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void applyHostNameFunctionToURLString(void *a1, void *a2)
{
  id v33 = a1;
  id v3 = a2;
  if (objc_msgSend(v33, "_lp_hasCaseInsensitivePrefix:", @"mailto:"))
  {
    id v4 = v33;
    unsigned int v5 = (void (**)(id, id, void, uint64_t))v3;
    {
      applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostNameOrStringStartCharacters = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\"@?"];
    }
    {
      applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostNameEndCharacters = [MEMORY[0x263F08708] characterSetWithCharactersInString:@">,?"];
    }
    {
      applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::quotedStringCharacters = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\"\\""];
    }
    uint64_t v6 = 0;
    uint64_t v7 = [v4 length];
    uint64_t v8 = v7;
LABEL_9:
    do
    {
      uint64_t v10 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostNameOrStringStartCharacters, 0, v6, v8);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v11 = v9;
      int v12 = [v4 characterAtIndex:v10];
      uint64_t v13 = v10 + v11;
      if (v12 != 64)
      {
        if (v12 != 63)
        {
          while (1)
          {
            uint64_t v15 = [v4 rangeOfCharacterFromSet:applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::quotedStringCharacters options:0 range:v13];
            if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
              break;
            }
            uint64_t v16 = v14;
            int v17 = [v4 characterAtIndex:v15];
            uint64_t v6 = v15 + v16;
            uint64_t v8 = v7 - v6;
            if (v17 == 34) {
              goto LABEL_9;
            }
            if (!v8) {
              break;
            }
            uint64_t v13 = v6 + 1;
          }
        }
        break;
      }
      uint64_t v18 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", applyHostNameFunctionToMailToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostNameEndCharacters, 0, v13, v7 - v13);
      uint64_t v6 = v18;
      if (v18 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v19 = v7;
      }
      else {
        uint64_t v19 = v18;
      }
      v5[2](v5, v4, v13, v19 - v13);
      uint64_t v8 = v7 - v6;
    }
    while (v6 != 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    uint64_t v21 = [v33 rangeOfString:@"://"];
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int v22 = v20;
      {
        char v32 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+-."];
        applyHostNameFunctionToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::nonSchemeCharacters = [v32 invertedSet];
      }
      if (objc_msgSend(v33, "rangeOfCharacterFromSet:options:range:", applyHostNameFunctionToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::nonSchemeCharacters, 0, 0, v21) == 0x7FFFFFFFFFFFFFFFLL)
      {
        int v23 = [v33 length];
        {
          uint64_t v24 = applyHostNameFunctionToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostTerminators;
        }
        else
        {
          uint64_t v24 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@":/?#"];
          applyHostNameFunctionToURLString(NSString *,void({block_pointer})(NSString *,_NSRange))::hostTerminators = v24;
        }
        int v25 = v21 + v22;
        uint64_t v26 = (v21 + v22);
        uint64_t v27 = objc_msgSend(v33, "rangeOfCharacterFromSet:options:range:", v24, 0, v26, (v23 - v25));
        if (v27 == 0x7FFFFFFFFFFFFFFFLL) {
          int v28 = v23;
        }
        else {
          int v28 = v27;
        }
        uint64_t v29 = objc_msgSend(v33, "rangeOfString:options:range:", @"@", 0, v26, (v28 - v25));
        unsigned int v31 = v29 + v30;
        if (v29 == 0x7FFFFFFFFFFFFFFFLL) {
          unsigned int v31 = v26;
        }
        (*((void (**)(id, id, void, void))v3 + 2))(v3, v33, v31, v28 - v31);
      }
    }
  }
}

void sub_2129AE98C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2129AEA48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL23userVisibleStringForURLP5NSURLPb_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  __p = 0;
  int v25 = 0;
  uint64_t v26 = 0;
  uint64_t v8 = (int)a4;
  if (a4 << 32)
  {
    std::vector<unsigned short>::__vallocate[abi:nn180100](&__p, (int)a4);
    uint64_t v9 = (char *)v25;
    bzero(v25, 2 * (int)a4);
    int v25 = &v9[2 * (int)a4];
    uint64_t v10 = __p;
  }
  else
  {
    uint64_t v10 = 0;
  }
  objc_msgSend(v7, "getCharacters:range:", v10, a3, a4);
  uint64_t v11 = (unsigned __int16 *)__p;
  if ((int)a4 < 1)
  {
    LOBYTE(v22) = 0;
  }
  else
  {
    uint64_t v12 = 0;
    unsigned int v13 = 0;
    unsigned __int8 v14 = 0;
    uint64_t v15 = 0;
    do
    {
      uint64_t v16 = v12 + 1;
      UChar32 v17 = v11[v12];
      if ((v17 & 0xFC00) != 0xD800 || v16 == v8)
      {
        ++v12;
      }
      else
      {
        int v19 = v11[v16];
        BOOL v20 = (v19 & 0xFC00) == 56320;
        int v21 = v19 + (v17 << 10) - 56613888;
        if (v20) {
          UChar32 v17 = v21;
        }
        if (v20) {
          v12 += 2;
        }
        else {
          ++v12;
        }
      }
      BOOL v22 = isLookalikeCharacter(v15 | v14 | v13, v17);
      unsigned int v13 = v17 & 0xFFFFFF00;
      int v23 = v12 >= v8 || v22;
      uint64_t v15 = 0x100000000;
      unsigned __int8 v14 = v17;
    }
    while (v23 != 1);
    uint64_t v11 = (unsigned __int16 *)__p;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= v22;
  if (v11)
  {
    int v25 = v11;
    operator delete(v11);
  }
}

void sub_2129AEBD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

char *std::vector<unsigned short>::__vallocate[abi:nn180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned short>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void ___ZL12mapHostNamesP8NSStringbPb_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v12 = a2;
  id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v7 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a3, a4);
  [v7 addObject:v11];
}

void sub_2129AECF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_2129AEE58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZL33allCharactersInIDNScriptAllowListPKti_block_invoke()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v0 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 0xFFFFuLL, 1);
  int v1 = [v0 count];
  if (v1 < 1)
  {
LABEL_6:
    allowIDNScript("Common");
    allowIDNScript("Inherited");
    allowIDNScript("Arabic");
    allowIDNScript("Armenian");
    allowIDNScript("Bopomofo");
    allowIDNScript("Canadian_Aboriginal");
    allowIDNScript("Devanagari");
    allowIDNScript("Deseret");
    allowIDNScript("Gujarati");
    allowIDNScript("Gurmukhi");
    allowIDNScript("Hangul");
    allowIDNScript("Han");
    allowIDNScript("Hebrew");
    allowIDNScript("Hiragana");
    allowIDNScript("Katakana_Or_Hiragana");
    allowIDNScript("Katakana");
    allowIDNScript("Latin");
    allowIDNScript("Tamil");
    allowIDNScript("Thai");
    allowIDNScript("Yi");
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v3 = v1;
    while (1)
    {
      uint64_t v4 = [v0 objectAtIndex:v2];
      id v5 = [v4 stringByAppendingPathComponent:@"IDNScriptWhiteList.txt"];
      uint64_t v6 = v5;
      if (v5)
      {
        id v7 = v5;
        id v8 = fopen((const char *)[v7 fileSystemRepresentation], "r");
        uint64_t v9 = v8;
        if (v8) {
          break;
        }
      }

      if (v3 == ++v2) {
        goto LABEL_6;
      }
    }
    if (fscanf(v8, " #%*[^\n\r]%*[\n\r]") != -1)
    {
      do
      {
        int v10 = fscanf(v9, " %32[^# \t\n\r]%*[^# \t\n\r] ", v11);
        if (v10 == 1)
        {
          allowIDNScript(v11);
        }
        else if (v10 == -1)
        {
          break;
        }
      }
      while (fscanf(v9, " #%*[^\n\r]%*[\n\r]") != -1);
    }
    fclose(v9);
  }
}

void sub_2129AF108(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t allowIDNScript(const char *a1)
{
  uint64_t result = MEMORY[0x216688AB0](4106, a1);
  if (result <= 0xC7) {
    IDNScriptAllowList[result >> 5] |= 1 << result;
  }
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t ___ZL33internationalDomainNameTranscoderv_block_invoke()
{
  int v1 = 0;
  uint64_t result = MEMORY[0x216688B00](60, &v1);
  internationalDomainNameTranscoder(void)::encoder = result;
  return result;
}

void sub_2129AF308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129AF408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129AF454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129AF4E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t damerauLevenshteinDistance(NSString *a1, NSString *a2)
{
  uint64_t v100 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = a2;
  unint64_t v70 = [(__CFString *)v3 length];
  unint64_t v5 = [(__CFString *)v4 length];
  unint64_t v11 = v5;
  if (v70 <= 0x3E8 && v5 < 0x3E9 && v70 && v5)
  {
    unint64_t v12 = v5 + 1;
    MEMORY[0x270FA5388](v5, v6, v7, v8, v9, v10);
    unsigned __int8 v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v15 = 0;
    do
    {
      *(_DWORD *)&v14[4 * v15] = v15;
      ++v15;
    }
    while (v12 != v15);
    __int16 v93 = v3;
    uint64_t v96 = 0;
    int64_t v97 = v70;
    v68 = v4;
    v69 = v3;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    if (CharactersPtr) {
      CStringPtr = 0;
    }
    else {
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    }
    int64_t v98 = 0;
    int64_t v99 = 0;
    uint64_t v95 = CStringPtr;
    unint64_t v85 = v4;
    uint64_t v88 = 0;
    int64_t v89 = v11;
    uint64_t v86 = CFStringGetCharactersPtr(v4);
    char v67 = &v65;
    if (v86) {
      UChar32 v17 = 0;
    }
    else {
      UChar32 v17 = CFStringGetCStringPtr(v4, 0x600u);
    }
    unint64_t v66 = v11;
    if (v11 <= 1) {
      uint64_t v18 = 1;
    }
    else {
      uint64_t v18 = v11;
    }
    uint64_t v90 = 0;
    int64_t v91 = 0;
    uint64_t v87 = v17;
    unint64_t v19 = 1;
    BOOL v20 = v14;
    int v21 = &v14[4 * v12];
    uint64_t v76 = v18;
    while (1)
    {
      uint64_t v22 = 0;
      uint64_t v23 = 0;
      uint64_t v24 = v21;
      int v25 = *(_DWORD *)v21;
      *(_DWORD *)int v21 = v19;
      int64_t v26 = (v19 - 1);
      int64_t v27 = v26 - 4;
      if (v26 < 4) {
        int64_t v27 = 0;
      }
      uint64_t v74 = v27;
      int64_t v28 = v27 + 64;
      int64_t v29 = (v19 - 2);
      int64_t v30 = v29 - 4;
      if (v29 < 4) {
        int64_t v30 = 0;
      }
      uint64_t v72 = v30;
      int64_t v73 = v28;
      int64_t v71 = v30 + 64;
      uint64_t v31 = -1;
      uint64_t v32 = 65;
      unint64_t v33 = 1;
      int v34 = (int)v17;
      unint64_t v80 = v19;
      int v81 = v20;
      int64_t v78 = (v19 - 1);
      unsigned int v79 = v24;
      int64_t v77 = (v19 - 2);
      do
      {
        LODWORD(v17) = v25;
        if (v33 >= 5) {
          uint64_t v35 = 5;
        }
        else {
          uint64_t v35 = v33;
        }
        v36 = &v24[v22];
        int v25 = *(_DWORD *)&v24[v22 + 4];
        int64_t v37 = v97;
        if (v97 <= v26)
        {
          int v40 = 0;
        }
        else
        {
          v38 = (UniChar *)CharactersPtr;
          if (CharactersPtr)
          {
            uint64_t v39 = v96 + v26;
LABEL_31:
            int v40 = v38[v39];
            goto LABEL_33;
          }
          if (!v95)
          {
            if (v99 <= v26 || (uint64_t v44 = v98, v98 > v26))
            {
              int v83 = *(_DWORD *)&v24[v22 + 4];
              int v45 = (int)v17;
              if (v73 < v97) {
                int64_t v37 = v73;
              }
              int64_t v98 = v74;
              int64_t v99 = v37;
              v101.location = v96 + v74;
              v101.length = v37 - v74;
              CFStringGetCharacters(v93, v101, v92);
              uint64_t v44 = v98;
              LODWORD(v19) = v80;
              BOOL v20 = v81;
              uint64_t v18 = v76;
              int64_t v29 = v77;
              LODWORD(v17) = v45;
              int64_t v26 = v78;
              uint64_t v24 = v79;
              int v25 = v83;
            }
            uint64_t v39 = v26 - v44;
            v38 = v92;
            goto LABEL_31;
          }
          int v40 = v95[v96 + v26];
        }
LABEL_33:
        int64_t v41 = v23 + 1;
        uint64_t v42 = v89;
        if (v89 >= v23 + 1)
        {
          if (v86)
          {
            UniChar v43 = v86[v23 + v88];
          }
          else if (v87)
          {
            UniChar v43 = v87[v88 + v23];
          }
          else
          {
            if (v91 < v41 || (uint64_t v46 = v90, v90 >= v41))
            {
              int v82 = v40;
              int v83 = v25;
              int v75 = (int)v17;
              uint64_t v47 = v23 - v35 + 65;
              if (v47 >= v89) {
                uint64_t v47 = v89;
              }
              uint64_t v90 = v23 - v35 + 1;
              int64_t v91 = v47;
              if (v89 >= v32 - v35) {
                uint64_t v42 = v32 - v35;
              }
              v102.length = v42 + v35 + v31;
              v102.location = v23 - v35 + 1 + v88;
              CFStringGetCharacters(v85, v102, v84);
              uint64_t v46 = v90;
              LODWORD(v19) = v80;
              BOOL v20 = v81;
              uint64_t v18 = v76;
              int64_t v29 = v77;
              LODWORD(v17) = v75;
              int64_t v26 = v78;
              uint64_t v24 = v79;
              int v40 = v82;
              int v25 = v83;
            }
            UniChar v43 = v84[v23 - v46];
          }
        }
        else
        {
          UniChar v43 = 0;
        }
        unsigned int v48 = *(_DWORD *)&v20[v22];
        int v49 = *(_DWORD *)&v20[v22 + 4];
        if ((unsigned __int16)v40 != v43) {
          ++v48;
        }
        if (*(_DWORD *)&v24[v22] + 1 >= (v49 + 1)) {
          unsigned int v50 = v49 + 1;
        }
        else {
          unsigned int v50 = *(_DWORD *)&v24[v22] + 1;
        }
        if (v48 >= v50) {
          unsigned int v48 = v50;
        }
        *((_DWORD *)v36 + 1) = v48;
        if (v19 >= 2 && (unint64_t)v41 >= 2)
        {
          int64_t v51 = v97;
          if (v97 <= v29)
          {
            UniChar v54 = 0;
          }
          else
          {
            int v52 = (UniChar *)CharactersPtr;
            if (CharactersPtr)
            {
              uint64_t v53 = v96 + v29;
              goto LABEL_67;
            }
            if (v95)
            {
              UniChar v54 = v95[v96 + v29];
            }
            else
            {
              if (v99 <= v29 || (uint64_t v60 = v98, v98 > v29))
              {
                int v82 = v40;
                int v83 = v25;
                int v61 = (int)v17;
                if (v71 < v97) {
                  int64_t v51 = v71;
                }
                int64_t v98 = v72;
                int64_t v99 = v51;
                v103.location = v96 + v72;
                v103.length = v51 - v72;
                CFStringGetCharacters(v93, v103, v92);
                uint64_t v60 = v98;
                LODWORD(v19) = v80;
                BOOL v20 = v81;
                uint64_t v18 = v76;
                int64_t v29 = v77;
                LODWORD(v17) = v61;
                int64_t v26 = v78;
                uint64_t v24 = v79;
                int v40 = v82;
                int v25 = v83;
              }
              uint64_t v53 = v29 - v60;
              int v52 = v92;
LABEL_67:
              UniChar v54 = v52[v53];
            }
          }
          int64_t v55 = v23 - 1;
          uint64_t v56 = v89;
          if (v89 <= v23 - 1)
          {
            unsigned __int16 v58 = 0;
          }
          else
          {
            if (v86)
            {
              char v57 = (UniChar *)&v86[v23 + v88];
              goto LABEL_72;
            }
            if (v87)
            {
              unsigned __int16 v58 = v87[v88 - 1 + v23];
            }
            else
            {
              if (v91 <= v55 || (uint64_t v62 = v90, v90 > v55))
              {
                int v82 = v40;
                int v83 = v25;
                int v75 = (int)v17;
                if ((unint64_t)v55 >= 4) {
                  uint64_t v63 = v23 - 5;
                }
                else {
                  uint64_t v63 = 0;
                }
                if (v63 + 64 < v89) {
                  uint64_t v56 = v63 + 64;
                }
                uint64_t v90 = v63;
                int64_t v91 = v56;
                v104.location = v88 + v63;
                v104.length = v56 - v63;
                CFStringGetCharacters(v85, v104, v84);
                uint64_t v62 = v90;
                LODWORD(v19) = v80;
                BOOL v20 = v81;
                uint64_t v18 = v76;
                int64_t v29 = v77;
                LODWORD(v17) = v75;
                int64_t v26 = v78;
                uint64_t v24 = v79;
                LOWORD(v40) = v82;
                int v25 = v83;
              }
              char v57 = &v84[v23 - v62];
LABEL_72:
              unsigned __int16 v58 = *(v57 - 1);
            }
          }
          if ((unsigned __int16)v40 == v58 && v43 == v54)
          {
            if ((v34 + 1) < *((_DWORD *)v36 + 1)) {
              int v59 = v34 + 1;
            }
            else {
              int v59 = *((_DWORD *)v36 + 1);
            }
            *((_DWORD *)v36 + 1) = v59;
          }
        }
        ++v33;
        ++v23;
        v22 += 4;
        --v31;
        ++v32;
        int v34 = (int)v17;
      }
      while (v18 != v23);
      unint64_t v19 = (v19 + 1);
      int v21 = v20;
      BOOL v20 = v24;
      if (v70 < v19)
      {
        unint64_t v11 = *(unsigned int *)&v24[4 * v66];
        uint64_t v4 = v68;
        uint64_t v3 = v69;
        goto LABEL_103;
      }
    }
  }
  if (v70 > v5) {
    unint64_t v11 = v70;
  }
LABEL_103:

  return v11;
}

void sub_2129AFAF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129AFBA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129AFC70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129B0320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t isLookalikeCharacterOfScriptType<(UScriptCode)3>(int a1)
{
  return ((a1 - 1352) < 0x3E) & (0x2221000000002221uLL >> (a1 - 72));
}

BOOL isLookalikeCharacterOfScriptType<(UScriptCode)35>(int a1)
{
  return a1 == 3046;
}

BOOL isLookalikeCharacterOfScriptType<(UScriptCode)38>(int a1)
{
  return a1 == 3585;
}

BOOL isLookalikeSequence<(UScriptCode)2>(uint64_t a1, int a2)
{
  if ((a2 - 1611) > 0x14) {
    return 0;
  }
  if ((a1 & 0xFF00000000) != 0) {
    return ublock_getCode(a1) != UBLOCK_ARABIC;
  }
  return 1;
}

id encodeHostNameWithRange(NSString *a1, _NSRange a2, uint64_t a3, uint64_t a4, BOOL *a5)
{
  unint64_t v5 = mapHostNameWithRange(a1, a2, 1, 0, a5);
  return v5;
}

void sub_2129B0504(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129B05AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129B07A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129B08AC(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;

  _Unwind_Resume(a1);
}

void sub_2129B0B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129B0BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129B0CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2129B0E34(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

BOOL isOfScriptType<(UScriptCode)3>()
{
  return uscript_getScript() == 3;
}

BOOL isOfScriptType<(UScriptCode)35>()
{
  return uscript_getScript() == 35;
}

BOOL isOfScriptType<(UScriptCode)40>()
{
  return uscript_getScript() == 40;
}

BOOL isOfScriptType<(UScriptCode)38>()
{
  return uscript_getScript() == 38;
}

uint64_t isRussianDomainNameCharacter(int a1)
{
  BOOL v2 = a1 == 45 || (a1 - 48) < 0xA;
  unsigned int v3 = (a1 - 1072) < 0x20 || v2;
  if (a1 == 1105) {
    return 1;
  }
  else {
    return v3;
  }
}

void std::function<BOOL ()(unsigned short)>::operator()(uint64_t a1, __int16 a2)
{
  __int16 v3 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    (*(void (**)(uint64_t, __int16 *))(*(void *)v2 + 48))(v2, &v3);
  }
  else
  {
    std::__throw_bad_function_call[abi:nn180100]();
    std::__throw_bad_function_call[abi:nn180100]();
  }
}

void std::__throw_bad_function_call[abi:nn180100]()
{
}

void std::__function::__func<BOOL (*)(unsigned short),std::allocator<BOOL (*)(unsigned short)>,BOOL ()(unsigned short)>::~__func()
{
}

void *std::__function::__func<BOOL (*)(unsigned short),std::allocator<BOOL (*)(unsigned short)>,BOOL ()(unsigned short)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26C3C6C70;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(unsigned short),std::allocator<BOOL (*)(unsigned short)>,BOOL ()(unsigned short)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26C3C6C70;
  a2[1] = v2;
  return result;
}

uint64_t std::__function::__func<BOOL (*)(unsigned short),std::allocator<BOOL (*)(unsigned short)>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  return (*(uint64_t (**)(void))(a1 + 8))(*a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void *std::__function::__value_func<BOOL ()(unsigned short)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0>,BOOL ()(unsigned short)>::~__func()
{
}

void *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0>,BOOL ()(unsigned short)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26C3C6BE0;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0>,BOOL ()(unsigned short)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26C3C6BE0;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_0>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2 = *a2;
  BOOL result = 1;
  if ((v2 - 1072) >= 0x20)
  {
    BOOL v4 = (v2 - 1105) > 0xD || ((1 << (v2 - 81)) & 0x2021) == 0;
    if (v4 && v2 != 8217) {
      return v2 == 45 || (v2 - 48) < 0xA;
    }
  }
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1>,BOOL ()(unsigned short)>::~__func()
{
}

void *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1>,BOOL ()(unsigned short)>::__clone()
{
  BOOL result = operator new(0x10uLL);
  *BOOL result = &unk_26C3C6C28;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1>,BOOL ()(unsigned short)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26C3C6C28;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_1>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2 = *a2;
  BOOL result = 1;
  if ((v2 - 1072) < 0x20) {
    return result;
  }
  if (*a2 <= 0x492u)
  {
    if (v2 == 1105 || v2 == 1110) {
      return result;
    }
    return v2 == 45 || (v2 - 48) < 0xA;
  }
  BOOL v4 = (v2 - 1171) > 0x28 || ((1 << (v2 + 109)) & 0x10050010101) == 0;
  if (v4 && v2 != 1241 && v2 != 1257) {
    return v2 == 45 || (v2 - 48) < 0xA;
  }
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2>,BOOL ()(unsigned short)>::~__func()
{
}

void *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2>,BOOL ()(unsigned short)>::__clone()
{
  BOOL result = operator new(0x10uLL);
  *BOOL result = &unk_26C3C6CB8;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2>,BOOL ()(unsigned short)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26C3C6CB8;
}

uint64_t std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_2>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2 = *a2;
  uint64_t result = 1;
  if ((v2 - 1072) >= 0x20
    && ((v2 - 1110) > 0x3B || ((1 << (v2 - 86)) & 0x800000000000003) == 0))
  {
    BOOL v6 = v2 == 45 || (v2 - 48) < 0xA;
    if (v2 == 1105) {
      BOOL v6 = 1;
    }
    return v2 == 1028 || v6;
  }
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3>,BOOL ()(unsigned short)>::~__func()
{
}

void *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3>,BOOL ()(unsigned short)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26C3C6D00;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3>,BOOL ()(unsigned short)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26C3C6D00;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_3>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2 = *a2;
  BOOL v3 = (v2 - 1072) >= 9 && (unsigned __int16)(v2 - 1082) >= 0xFu;
  if (!v3 || (v2 - 1106) < 0xE && ((0x23C1u >> (v2 - 82)) & 1) != 0) {
    return 1;
  }
  return v2 == 45 || (v2 - 48) < 0xA;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4>,BOOL ()(unsigned short)>::~__func()
{
}

void *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4>,BOOL ()(unsigned short)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26C3C6D48;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4>,BOOL ()(unsigned short)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26C3C6D48;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_4>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2 = *a2;
  BOOL v3 = (v2 - 1072) >= 9 && (unsigned __int16)(v2 - 1082) >= 0xFu;
  if (!v3 || (v2 - 1107) < 0xD && ((0x12E5u >> (v2 - 83)) & 1) != 0) {
    return 1;
  }
  return v2 == 45 || (v2 - 48) < 0xA;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5>,BOOL ()(unsigned short)>::~__func()
{
}

void *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5>,BOOL ()(unsigned short)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26C3C6D90;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5>,BOOL ()(unsigned short)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26C3C6D90;
}

uint64_t std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_5>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2 = *a2;
  uint64_t result = 1;
  if ((v2 - 1072) >= 0x20 && v2 != 1105)
  {
    BOOL v5 = v2 == 45 || (v2 - 48) < 0xA;
    if (v2 == 1257) {
      BOOL v5 = 1;
    }
    return v2 == 1199 || v5;
  }
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6>,BOOL ()(unsigned short)>::~__func()
{
}

void *std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6>,BOOL ()(unsigned short)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26C3C6DD8;
  return result;
}

void std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6>,BOOL ()(unsigned short)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26C3C6DD8;
}

BOOL std::__function::__func<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6,std::allocator<allCharactersAllowedByTLDRules(unsigned short const*,int)::$_6>,BOOL ()(unsigned short)>::operator()(uint64_t a1, unsigned __int16 *a2)
{
  int v2 = *a2;
  BOOL v3 = v2 != 1100 && (unsigned __int16)(v2 - 1072) >= 0x1Bu;
  if (!v3 || (unsigned __int16)(v2 - 1102) < 0x10u && ((0x8007u >> (v2 - 78)) & 1) != 0) {
    return 1;
  }
  return v2 == 45 || (v2 - 48) < 0xA;
}

uint64_t hexDigitValue(int a1)
{
  uint64_t result = (a1 - 48);
  if (result > 9)
  {
    if ((a1 - 65) > 5)
    {
      if ((a1 - 97) > 5)
      {
        NSLog(&cfstr_IllegalHexDigi.isa, v1, v2);
        return 0;
      }
      else
      {
        return (a1 - 87);
      }
    }
    else
    {
      return (a1 - 55);
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void isOfScriptType<(UScriptCode)3>()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_2129AA000, MEMORY[0x263EF8438], v0, "ICU error under uscript_getScript: %d", v1, v2, v3, v4, v5);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x270EE50F8](alloc, chars, numChars);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFURLRef CFURLCreateAbsoluteURLWithBytes(CFAllocatorRef alloc, const UInt8 *relativeURLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL, Boolean useCompatibilityMode)
{
  return (CFURLRef)MEMORY[0x270EE5380](alloc, relativeURLBytes, length, *(void *)&encoding, baseURL, useCompatibilityMode);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x270EE53D8](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x270EE53E8](allocator, URLBytes, length, *(void *)&encoding, baseURL);
}

CFURLRef CFURLGetBaseURL(CFURLRef anURL)
{
  return (CFURLRef)MEMORY[0x270EE5418](anURL);
}

CFRange CFURLGetByteRangeForComponent(CFURLRef url, CFURLComponentType component, CFRange *rangeIncludingSeparators)
{
  CFIndex v3 = MEMORY[0x270EE5420](url, component, rangeIncludingSeparators);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFURLGetBytes(CFURLRef url, UInt8 *buffer, CFIndex bufferLength)
{
  return MEMORY[0x270EE5428](url, buffer, bufferLength);
}

void NSLog(NSString *format, ...)
{
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x270EF2BD8](directory, domainMask, expandTilde);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFHostIsDomainTopLevel()
{
  return MEMORY[0x270EE2A58]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

void free(void *a1)
{
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9AB0](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int32_t u_getPropertyValueEnum(UProperty property, const char *alias)
{
  return MEMORY[0x270F99510](*(void *)&property, alias);
}

UBool u_hasBinaryProperty(UChar32 c, UProperty which)
{
  return MEMORY[0x270F99518](*(void *)&c, *(void *)&which);
}

UBool u_isUWhiteSpace(UChar32 c)
{
  return MEMORY[0x270F99530](*(void *)&c);
}

UBool u_isprint(UChar32 c)
{
  return MEMORY[0x270F99558](*(void *)&c);
}

UBlockCode ublock_getCode(UChar32 c)
{
  return MEMORY[0x270F99608](*(void *)&c);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x270F99718](*(void *)&options, pErrorCode);
}

uint64_t uscript_getScript()
{
  return MEMORY[0x270F998E8]();
}