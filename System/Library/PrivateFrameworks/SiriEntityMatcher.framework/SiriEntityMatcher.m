uint64_t sub_25C7CC2B8(uint64_t a1, skit::internal *a2, __int16 a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x263EF8340];
  *(void *)a1 = &unk_2709DEF10;
  v11 = *((void *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    v12 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(skit::internal **)a2;
    v12 = v11;
  }
  v13 = (void *)sub_25C7D8CCC((uint64_t)&off_2654BB5F0, a2, v12);
  *(void *)(a1 + 8) = v13;
  v14 = v13[5];
  *(void *)(a1 + 16) = &unk_2709DEF60;
  *(void *)(a1 + 24) = v14;
  v15 = v13[7];
  *(void *)(a1 + 32) = &unk_2709DEF60;
  *(void *)(a1 + 40) = v15;
  v16 = v13[6];
  *(void *)(a1 + 48) = &unk_2709DEF60;
  *(void *)(a1 + 56) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)a6;
  *(void *)a6 = 0;
  *(void *)(a6 + 8) = 0;
  *(void *)(a1 + 80) = MEMORY[0x263F8C780] + 16;
  *(void *)(a1 + 88) = MEMORY[0x263F8C780] + 64;
  *(void *)(a1 + 96) = 0x500000000;
  *(_DWORD *)(a1 + 96) = 1065353216;
  *(void *)(a1 + 104) = MEMORY[0x263F8C788] + 16;
  *(void *)(a1 + 112) = MEMORY[0x263F8C788] + 64;
  *(_DWORD *)(a1 + 120) = 1056964608;
  *(_WORD *)(a1 + 124) = 4;
  *(void *)(a1 + 128) = &unk_2709DEFC0;
  *(void *)(a1 + 136) = &unk_2709DEFF0;
  *(void *)(a1 + 144) = 0;
  *(void *)(a1 + 152) = &unk_2709DF050;
  *(void *)(a1 + 160) = &unk_2709DF080;
  *(void *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = a4;
  *(void *)(a1 + 184) = a5;
  *(_WORD *)(a1 + 192) = a3;
  *(void *)(a1 + 216) = 0;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 208) = 0;
  if (a3)
  {
    morphun::util::LocaleUtils::toLocale();
    *(void *)(a1 + 200) = morphun::dictionary::DictionaryMetaData::createDictionary();
    morphun::util::ULocale::~ULocale((morphun::util::ULocale *)&v19);
    a3 = *(_WORD *)(a1 + 192);
  }
  if ((a3 & 4) != 0)
  {
    v17 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_DEBUG))
    {
      v19 = 136315394;
      v20 = "Analyzer";
      v21 = 1024;
      v22 = a5;
      _os_log_debug_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_DEBUG, "%s phonetic search enabled. n-gram order from trial: %d", (uint8_t *)&v19, 0x12u);
    }
  }
  return a1;
}

void sub_25C7CC5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  morphun::util::ULocale::~ULocale((morphun::util::ULocale *)&a9);
  v11 = *(std::__shared_weak_count **)(v9 + 216);
  if (v11) {
    sub_25C7D2280(v11);
  }

  v12 = *(std::__shared_weak_count **)(v9 + 72);
  if (v12) {
    sub_25C7D2280(v12);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25C7CC5FC(uint64_t a1)
{
  *(void *)a1 = &unk_2709DEF10;
  v2 = *(const void **)(a1 + 144);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(std::__shared_weak_count **)(a1 + 216);
  if (v3) {
    sub_25C7D2280(v3);
  }

  v4 = *(std::__shared_weak_count **)(a1 + 72);
  if (v4) {
    sub_25C7D2280(v4);
  }
  return a1;
}

void sub_25C7CC66C(void *a1)
{
}

void sub_25C7CC684(uint64_t a1)
{
  sub_25C7CC5FC(a1);
  JUMPOUT(0x261194470);
}

void sub_25C7CC6BC(void *a1)
{
  if (!a1[26] && !a1[28])
  {
    v2 = operator new(0x168uLL);
    v2[1] = 0;
    v2[2] = 0;
    void *v2 = &unk_2709DF0E0;
    v3 = v2 + 3;
    morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory((morphun::analysis::DefaultAnalyzerFactory *)(v2 + 3));
    v4 = (std::__shared_weak_count *)a1[27];
    a1[26] = v2 + 3;
    a1[27] = v2;
    if (v4)
    {
      sub_25C7D2280(v4);
      v3 = (void *)a1[26];
    }
    uint64_t v5 = a1[1];
    size_t v6 = *(void *)(v5 + 24);
    if (v6 >= 0x7FFFFFFFFFFFFFF8) {
      sub_25C7D00F4();
    }
    v7 = *(const void **)(v5 + 16);
    if (v6 >= 0x17)
    {
      uint64_t v9 = (v6 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v6 | 7) != 0x17) {
        uint64_t v9 = v6 | 7;
      }
      uint64_t v10 = v9 + 1;
      v8 = (void **)operator new(v9 + 1);
      __dst[1] = (void *)v6;
      unint64_t v12 = v10 | 0x8000000000000000;
      __dst[0] = v8;
    }
    else
    {
      HIBYTE(v12) = *(void *)(v5 + 24);
      v8 = __dst;
      if (!v6)
      {
LABEL_13:
        *((unsigned char *)v8 + v6) = 0;
        morphun::util::ULocale::ULocale();
        a1[28] = (*(uint64_t (**)(void *, unsigned char *))(*v3 + 24))(v3, v13);
        morphun::util::ULocale::~ULocale((morphun::util::ULocale *)v13);
        if (SHIBYTE(v12) < 0) {
          operator delete(__dst[0]);
        }
        return;
      }
    }
    memmove(v8, v7, v6);
    goto LABEL_13;
  }
}

void sub_25C7CC880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,char a33)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  if (a32 < 0) {
    operator delete(a27);
  }
  _Unwind_Resume(a1);
}

void sub_25C7CC8EC(uint64_t a1, uint64_t *a2, void *a3, unint64_t a4)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 64);
  if (v5)
  {
    if ((*(unsigned char *)(*(void *)(a1 + 8) + 32) & 0x40) != 0) {
      int v6 = (*(unsigned __int16 *)(a1 + 192) >> 3) & 1;
    }
    else {
      int v6 = 0;
    }
    sub_25C82059C(v5, a2, a3, a4, v6);
  }
  else
  {
    v7 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      uint64_t v9 = "analyze_str";
      _os_log_error_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_ERROR, "%s Unsupported - this analyzer was constructed without a Tokenizer.", (uint8_t *)&v8, 0xCu);
    }
  }
}

uint64_t sub_25C7CC9F4(uint64_t a1, uint64_t *a2)
{
  void (*v5)(long long *__return_ptr, long long *);
  uint64_t v6;
  uint64_t v7;
  skit *v8;
  uint64_t result;
  float v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  __int16 v14;
  unint64_t v15;
  int v17;
  uint64_t v18;
  long long v20;
  uint64_t v21;
  long long v22;
  uint64_t v23;
  void **v24;

  uint64_t v3 = *(void *)(a1 + 8);
  BOOL v4 = **(unsigned __int16 **)(v3 + 16) != 28261;
  uint64_t v5 = *(void (**)(long long *__return_ptr, long long *))(v3 + 80);
  if (v5)
  {
    v20 = *(_OWORD *)a2;
    v21 = a2[2];
    a2[1] = 0;
    a2[2] = 0;
    *a2 = 0;
    v5(&v22, &v20);
    sub_25C7D01D0(a2);
    *(_OWORD *)a2 = v22;
    a2[2] = v23;
    v23 = 0;
    v22 = 0uLL;
    v24 = (void **)&v22;
    sub_25C7D025C(&v24);
    v24 = (void **)&v20;
    sub_25C7D025C(&v24);
  }
  int v6 = *a2;
  v7 = a2[1];
  if (*a2 == v7)
  {
    int v8 = 0;
  }
  else
  {
    LODWORD(v8) = 0;
    do
    {
      int v8 = (skit *)(v8 + ((*(unsigned __int16 *)(v6 + 40) << 31 >> 31) & *(unsigned __int16 *)(v6 + 38)));
      v6 += 48;
    }
    while (v6 != v7);
  }
  result = skit::entity_token_wgt(v8);
  unint64_t v12 = *a2;
  v11 = a2[1];
  if (v12 != v11)
  {
    v13 = v10;
    do
    {
      v14 = *(_WORD *)(v12 + 40);
      if (v14) {
        *(float *)(v12 + 32) = v13 * *(float *)(v12 + 32);
      }
      if (v4) {
        goto LABEL_13;
      }
      if (*(char *)(v12 + 23) < 0)
      {
        v15 = *(void *)(v12 + 8);
        if ((v14 & 7) != 3 || v15 <= 2) {
          goto LABEL_13;
        }
        v18 = *(void *)v12;
        v17 = *(_DWORD *)(*(void *)v12 + 2 * v15 - 4);
      }
      else
      {
        v15 = *(unsigned __int8 *)(v12 + 23);
        if ((v14 & 7) != 3 || v15 < 3) {
          goto LABEL_13;
        }
        v17 = *(_DWORD *)(v12 + 2 * v15 - 4);
        v18 = v12;
      }
      if (v17 == 7536679 || *(_DWORD *)(v18 + 2 * v15 - 4) == 7544857) {
        result = sub_25C7D02B0(v12, v15 - 2, 0);
      }
LABEL_13:
      v12 += 48;
    }
    while (v12 != v11);
  }
  return result;
}

void sub_25C7CCBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_25C7D025C((void ***)va);
  _Unwind_Resume(a1);
}

void sub_25C7CCBCC(uint64_t a1@<X0>, TokenStream *a2@<X1>, __int16 a3@<W2>, long long *a4@<X3>, long long *a5@<X4>, uint64_t *a6@<X8>)
{
  void (*v27)(long long *__return_ptr, Token **);
  unint64_t *p_end_cap;
  unint64_t end;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t *v34;
  void v35[3];
  Token *v36;
  long long v37;
  Token **v38;
  long long v39;
  Token *v40;
  char *v41;
  __compressed_pair<skit::Token *, std::allocator<skit::Token>> *v42;

  uint64_t v9 = a2;
  uint64_t v11 = *(void *)(a1 + 8);
  unint64_t v12 = *(uint64_t **)(v11 + 64);
  begin = a2->__begin_;
  uint64_t v14 = *((unsigned int *)v12 + 2);
  if (!v14) {
    goto LABEL_24;
  }
  uint64_t v15 = 0;
  uint64_t v16 = *v12;
  unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((a2->__end_ - begin) >> 4);
  while (1)
  {
    uint64_t v18 = v16 + 56 * v15;
    unint64_t v19 = *(unsigned int *)(v18 + 48);
    if (v19) {
      BOOL v20 = v17 >= v19;
    }
    else {
      BOOL v20 = 0;
    }
    if (v20)
    {
      uint64_t v21 = 0;
      while (1)
      {
        a2 = (TokenStream *)((char *)begin + 48 * v21);
        if (SHIBYTE(a2->__end_cap_.__value_) < 0)
        {
          a2 = (TokenStream *)a2->__begin_;
          value_high = (unsigned __int16 *)*((void *)begin + 6 * v21 + 1);
        }
        else
        {
          value_high = (unsigned __int16 *)HIBYTE(a2->__end_cap_.__value_);
        }
        v23 = (unsigned __int16 **)(v18 + 16 * v21);
        v24 = v23[1];
        if (v24 != value_high) {
          goto LABEL_8;
        }
        if (v24)
        {
          v25 = *v23;
          while (LOWORD(a2->__begin_) == *v25)
          {
            ++v25;
            a2 = (TokenStream *)((char *)a2 + 2);
            v24 = (unsigned __int16 *)((char *)v24 - 1);
            if (!v24) {
              goto LABEL_19;
            }
          }
          goto LABEL_8;
        }
LABEL_19:
        if (++v21 == v19) {
          goto LABEL_22;
        }
      }
    }
    if (v17 >= v19) {
      break;
    }
LABEL_8:
    if (++v15 == v14) {
      goto LABEL_24;
    }
  }
  if (v19)
  {
LABEL_22:
    v26 = (_WORD *)((char *)begin + 40);
    do
    {
      _WORD *v26 = *v26 & 0xFFFA | 4;
      v26 += 24;
      --v19;
    }
    while (v19);
  }
LABEL_24:
  v27 = *(void (**)(long long *__return_ptr, Token **))(v11 + 80);
  if (v27)
  {
    v36 = begin;
    v37 = *(_OWORD *)&v9->__end_;
    v9->__begin_ = 0;
    v9->__end_ = 0;
    v9->__end_cap_.__value_ = 0;
    v27(&v39, &v36);
    sub_25C7D01D0((uint64_t *)v9);
    *(_OWORD *)&v9->__begin_ = v39;
    v9->__end_cap_.__value_ = v40;
    v40 = 0;
    v38 = (Token **)&v39;
    v39 = 0uLL;
    sub_25C7D025C((void ***)&v38);
    v38 = &v36;
    sub_25C7D025C((void ***)&v38);
  }
  v34 = a6;
  if (a4 == a5)
  {
    end = (unint64_t)v9->__end_;
  }
  else
  {
    p_end_cap = (unint64_t *)&v9->__end_cap_;
    end = (unint64_t)v9->__end_;
    do
    {
      if (end >= *p_end_cap)
      {
        v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(end - (unint64_t)v9->__begin_) >> 4);
        v31 = v30 + 1;
        if (v30 + 1 > 0x555555555555555) {
          sub_25C7D06B8();
        }
        if (0x5555555555555556 * ((uint64_t)(*p_end_cap - (unint64_t)v9->__begin_) >> 4) > v31) {
          v31 = 0x5555555555555556 * ((uint64_t)(*p_end_cap - (unint64_t)v9->__begin_) >> 4);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*p_end_cap - (unint64_t)v9->__begin_) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
          v32 = 0x555555555555555;
        }
        else {
          v32 = v31;
        }
        v42 = &v9->__end_cap_;
        if (v32) {
          v33 = (char *)sub_25C7D06D0((uint64_t)&v9->__end_cap_, v32);
        }
        else {
          v33 = 0;
        }
        *(void *)&v39 = v33;
        *((void *)&v39 + 1) = &v33[48 * v30];
        v40 = (Token *)*((void *)&v39 + 1);
        v41 = &v33[48 * v32];
        sub_25C7D051C(*((uint64_t *)&v39 + 1), a4);
        v40 = (Token *)((char *)v40 + 48);
        sub_25C7D0640((uint64_t *)v9, &v39);
        end = (unint64_t)v9->__end_;
        sub_25C7D0848((uint64_t)&v39);
      }
      else
      {
        sub_25C7D051C(end, a4);
        end += 48;
        v9->__end_ = (Token *)end;
      }
      v9->__end_ = (Token *)end;
      *(_WORD *)(end - 12) = a3;
      a4 = (long long *)((char *)a4 + 104);
    }
    while (a4 != a5);
  }
  v35[0] = v9->__begin_;
  v35[1] = end;
  v35[2] = v9->__end_cap_.__value_;
  v9->__end_ = 0;
  v9->__end_cap_.__value_ = 0;
  v9->__begin_ = 0;
  skit::Analyzer::dedup(v34, (skit::Analyzer *)v35, a2);
  *(void *)&v39 = v35;
  sub_25C7D025C((void ***)&v39);
}

void sub_25C7CCEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  sub_25C7D025C((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7CCEF8(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  __int16 v4 = a4;
  uint64_t v6 = a2;
  v7 = (uint64_t *)result;
  if ((a4 - 2) < 2)
  {
    if (a2 != a3)
    {
      do
      {
        *(_DWORD *)(v6 + 32) = 1065353216;
        *(_WORD *)(v6 + 40) = *(_WORD *)(v6 + 40) & 0xFFFA | 1;
        sub_25C7CFD10(v7[3], v6);
        sub_25C7CFEE4((uint64_t)(v7 + 16), (uint64_t *)v6);
        skit::EmojiFilter::filter((skit::EmojiFilter *)(v7 + 10), (Token *)v6);
        skit::NumberFilter::filter((skit::NumberFilter *)(v7 + 13), (Token *)v6);
        result = sub_25C7D0080((uint64_t)(v7 + 19), (uint64_t *)v6);
        *(_WORD *)(v6 + 36) = v4;
        v6 += 48;
      }
      while (v6 != a3);
    }
  }
  else if ((a4 - 5) >= 2)
  {
    if (a4 == 4)
    {
      if (a2 != a3)
      {
        do
        {
          *(_DWORD *)(v6 + 32) = 1065353216;
          *(_WORD *)(v6 + 40) = *(_WORD *)(v6 + 40) & 0xFFFA | 1;
          sub_25C7CFD10(v7[5], v6);
          sub_25C7CFD10(v7[7], v6);
          sub_25C7CFEE4((uint64_t)(v7 + 16), (uint64_t *)v6);
          skit::EmojiFilter::filter((skit::EmojiFilter *)(v7 + 10), (Token *)v6);
          skit::NumberFilter::filter((skit::NumberFilter *)(v7 + 13), (Token *)v6);
          result = sub_25C7D0080((uint64_t)(v7 + 19), (uint64_t *)v6);
          *(_WORD *)(v6 + 36) = 4;
          v6 += 48;
        }
        while (v6 != a3);
      }
    }
    else if (a2 != a3)
    {
      do
      {
        *(_DWORD *)(v6 + 32) = 1065353216;
        *(_WORD *)(v6 + 40) = *(_WORD *)(v6 + 40) & 0xFFFA | 1;
        *(_WORD *)(v6 + 36) = a4;
        v6 += 48;
      }
      while (v6 != a3);
    }
  }
  else if (a2 != a3)
  {
    do
    {
      *(_DWORD *)(v6 + 32) = 1065353216;
      *(_WORD *)(v6 + 40) = *(_WORD *)(v6 + 40) & 0xFFFA | 1;
      sub_25C7CFD10(v7[5], v6);
      skit::EmojiFilter::filter((skit::EmojiFilter *)(v7 + 10), (Token *)v6);
      result = skit::NumberFilter::filter((skit::NumberFilter *)(v7 + 13), (Token *)v6);
      *(_WORD *)(v6 + 36) = v4;
      v6 += 48;
    }
    while (v6 != a3);
  }
  return result;
}

uint64_t sub_25C7CD104(uint64_t a1, void *a2, int a3, unint64_t a4)
{
  uint64_t v4 = a2[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a2) >> 4) > a4)
  {
    uint64_t v5 = *a2 + 48 * a4;
    if (v5 != v4)
    {
      int v6 = a3;
      v7 = a2;
      unsigned __int8 v8 = 0;
      int v9 = 0;
      while (1)
      {
        if (*(char *)(v5 + 23) < 0) {
          unint64_t v10 = *(void *)(v5 + 8);
        }
        else {
          unint64_t v10 = *(unsigned __int8 *)(v5 + 23);
        }
        skit::strip_bidi();
        uint64_t v11 = *(unsigned __int8 *)(v5 + 23);
        if (*(char *)(v5 + 23) < 0) {
          unint64_t v12 = *(void *)(v5 + 8);
        }
        else {
          unint64_t v12 = *(unsigned __int8 *)(v5 + 23);
        }
        int v38 = v10;
        if (v10 > v12)
        {
          if ((v11 & 0x80u) == 0) {
            uint64_t v13 = *(unsigned __int8 *)(v5 + 23);
          }
          else {
            uint64_t v13 = *(void *)(v5 + 8);
          }
          if (!v13) {
            goto LABEL_25;
          }
          if ((*(_WORD *)(v5 + 40) & 2) == 0)
          {
            if ((v11 & 0x80u) == 0) {
              uint64_t v14 = (unsigned __int16 *)v5;
            }
            else {
              uint64_t v14 = *(unsigned __int16 **)v5;
            }
            uint64_t v15 = &v14[v13];
            do
            {
              uint64_t v16 = 0;
              while (*(unsigned __int16 *)&asc_25C849506[v16] != *v14)
              {
                v16 += 2;
                if (v16 == 12) {
                  goto LABEL_31;
                }
              }
              ++v14;
            }
            while (v14 != v15);
LABEL_25:
            unint64_t v17 = v7;
            uint64_t v18 = v5 + 48;
            uint64_t v19 = v17[1];
            if (v5 + 48 == v19)
            {
              uint64_t v21 = v5;
            }
            else
            {
              uint64_t v20 = v5;
              do
              {
                if (*(char *)(v20 + 23) < 0) {
                  operator delete(*(void **)v20);
                }
                *(_OWORD *)uint64_t v20 = *(_OWORD *)(v20 + 48);
                *(void *)(v20 + 16) = *(void *)(v20 + 64);
                *(unsigned char *)(v20 + 71) = 0;
                *(_WORD *)(v20 + 48) = 0;
                uint64_t v21 = v20 + 48;
                *(_OWORD *)(v20 + 24) = *(_OWORD *)(v20 + 72);
                *(void *)(v20 + 40) = *(void *)(v20 + 88);
                uint64_t v22 = v20 + 96;
                v20 += 48;
              }
              while (v22 != v19);
              uint64_t v18 = a2[1];
            }
            int v6 = a3;
            while (v18 != v21)
            {
              if (*(char *)(v18 - 25) < 0) {
                operator delete(*(void **)(v18 - 48));
              }
              v18 -= 48;
            }
            v7 = a2;
            int v9 = v9 - v38 + v13;
            a2[1] = v21;
            goto LABEL_65;
          }
        }
LABEL_31:
        if ((v11 & 0x80) != 0)
        {
          v23 = *(_WORD **)v5;
          uint64_t v11 = *(void *)(v5 + 8);
        }
        else
        {
          v23 = (_WORD *)v5;
        }
        if (v11 == 1 && *v23 == 38) {
          sub_25C7D08D8((void **)v5, **(void ***)(*(void *)(a1 + 8) + 72), *(void *)(*(void *)(*(void *)(a1 + 8) + 72) + 8));
        }
        LODWORD(v24) = *(unsigned __int8 *)(v5 + 23);
        if (*(char *)(v5 + 23) < 0)
        {
          v25 = *(_WORD **)v5;
          uint64_t v26 = *(void *)(v5 + 8);
        }
        else
        {
          v25 = (_WORD *)v5;
          uint64_t v26 = *(unsigned __int8 *)(v5 + 23);
        }
        v27 = &v25[v26];
        if (v26) {
          break;
        }
LABEL_56:
        if ((v24 & 0x80) != 0) {
          uint64_t v24 = *(void *)(v5 + 8);
        }
        if (v6) {
          int v31 = v9;
        }
        else {
          int v31 = 0;
        }
        uint64_t v32 = (*(_DWORD *)(v5 + 24) + v31);
        v9 += v24 - v38;
        if (v6) {
          int v33 = v9;
        }
        else {
          int v33 = 0;
        }
        *(void *)(v5 + 24) = v32 | ((unint64_t)(v33 + *(_DWORD *)(v5 + 28)) << 32);
        v5 += 48;
        uint64_t v21 = v7[1];
LABEL_65:
        if (v5 == v21) {
          return v8;
        }
      }
      while (1)
      {
        int v28 = (unsigned __int16)*v25;
        if ((v28 & 0xFFFE) == 0x2018) {
          break;
        }
        if ((v28 & 0xFFFE) == 0x201C)
        {
          int v28 = 34;
LABEL_45:
          _WORD *v25 = v28;
        }
        if ((v8 & 1) == 0)
        {
          uint64_t v29 = 0;
          while ((unsigned __int16)word_25C826558[v29] != v28)
          {
            if (++v29 == 76)
            {
              v30 = (__int16 *)"N13semskitbridge8AnalyzerE";
              goto LABEL_52;
            }
          }
          v30 = &word_25C826558[v29];
LABEL_52:
          if ((char *)v30 - (char *)word_25C826558 != 152) {
            unsigned __int8 v8 = 1;
          }
        }
        if (++v25 == v27)
        {
          LODWORD(v24) = *(unsigned __int8 *)(v5 + 23);
          goto LABEL_56;
        }
      }
      int v28 = 39;
      goto LABEL_45;
    }
  }
  return 0;
}

id sub_25C7CD42C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  int v6 = *(void **)(a1 + 168);
  if (v6) {
    goto LABEL_16;
  }
  if ((*(_WORD *)(a1 + 192) & 4) == 0)
  {
    v7 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
    {
      LODWORD(__p) = 136315138;
      *(void *)((char *)&__p + 4) = "get_pronunciations_for_orthography";
      unsigned __int8 v8 = "%s SEMG2PExecutor is not set up as TrialFactors::use_contact_phonetic_search is not enabled.";
LABEL_24:
      _os_log_error_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&__p, 0xCu);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  int v9 = [SEMG2PExecutor alloc];
  uint64_t v11 = *(void *)(a1 + 8);
  size_t v12 = *(void *)(v11 + 24);
  if (v12 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C7D00F4();
  }
  uint64_t v13 = v9;
  uint64_t v14 = *(const void **)(v11 + 16);
  if (v12 >= 0x17)
  {
    uint64_t v16 = (v12 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v12 | 7) != 0x17) {
      uint64_t v16 = v12 | 7;
    }
    uint64_t v17 = v16 + 1;
    p_p = operator new(v16 + 1);
    *((void *)&__p + 1) = v12;
    unint64_t v32 = v17 | 0x8000000000000000;
    *(void *)&long long __p = p_p;
  }
  else
  {
    HIBYTE(v32) = *(void *)(v11 + 24);
    p_p = &__p;
    if (!v12) {
      goto LABEL_13;
    }
  }
  memmove(p_p, v14, v12);
LABEL_13:
  *((unsigned char *)p_p + v12) = 0;
  uint64_t v18 = sub_25C80DCC4((uint64_t)&__p, v10);
  uint64_t isJit = objc_msgSend_initWithLocale_isJit_(v13, v19, (uint64_t)v18, 1);
  uint64_t v21 = *(void **)(a1 + 168);
  *(void *)(a1 + 168) = isJit;

  if (SHIBYTE(v32) < 0) {
    operator delete((void *)__p);
  }
  int v6 = *(void **)(a1 + 168);
LABEL_16:
  uint64_t v22 = objc_msgSend_user_profile(v6, a2, a3, a4, __p, v32, v33);
  BOOL v23 = v22 == 0;

  if (!v23)
  {
    v25 = *(void **)(a1 + 168);
    uint64_t v26 = sub_25C80DCC4((uint64_t)a2, v24);
    uint64_t v29 = objc_msgSend_pronunciationsForOrthography_(v25, v27, (uint64_t)v26, v28);

    goto LABEL_20;
  }
  v7 = qword_26B3549C0;
  if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
  {
    LODWORD(__p) = 136315138;
    *(void *)((char *)&__p + 4) = "get_pronunciations_for_orthography";
    unsigned __int8 v8 = "%s G2P user profile is nil.";
    goto LABEL_24;
  }
LABEL_19:
  uint64_t v29 = 0;
LABEL_20:
  return v29;
}

void sub_25C7CD67C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_25C7CD6B8(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned __int8 a4, int a5)
{
  int v5 = a5;
  v107[19] = *MEMORY[0x263EF8340];
  if (a5 < 0 && (int v5 = *(_DWORD *)(a1 + 184), v5 < 0))
  {
    int v5 = 3;
  }
  else if (!v5)
  {
    int v9 = qword_26B3549C0;
    if (!os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "generate_phoneme_ngrams";
    unint64_t v10 = "%s Error in Analyzer::generate_phoneme_ngrams: Ngram order is out of bounds";
    goto LABEL_21;
  }
  uint64_t v11 = *(unsigned __int8 *)(a3 + 23);
  if ((v11 & 0x80u) != 0) {
    uint64_t v11 = *(void *)(a3 + 8);
  }
  if (!v11)
  {
    int v9 = qword_26B3549C0;
    if (!os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR)) {
      return;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "generate_phoneme_ngrams";
    unint64_t v10 = "%s Error in Analyzer::generate_phoneme_ngrams: Input is empty string";
LABEL_21:
    _os_log_error_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0xCu);
    return;
  }
  sub_25C7D0AE0(v93, "<");
  sub_25C7D0AE0(v91, ">");
  int64x2_t v89 = 0uLL;
  v90 = 0;
  if (*(char *)(a3 + 23) >= 0) {
    unint64_t v12 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    unint64_t v12 = *(void *)(a3 + 8);
  }
  if (v12)
  {
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
      sub_25C7D06B8();
    }
    v100 = &v90;
    uint64_t v13 = (char *)sub_25C7D0B94(v12);
    uint64_t v15 = v89.i64[1];
    uint64_t v16 = v89.i64[0];
    if (v89.i64[1] == v89.i64[0])
    {
      int64x2_t v19 = vdupq_n_s64(v89.u64[1]);
      uint64_t v17 = v13;
    }
    else
    {
      uint64_t v17 = v13;
      do
      {
        long long v18 = *(_OWORD *)(v15 - 24);
        *((void *)v17 - 1) = *(void *)(v15 - 8);
        *(_OWORD *)(v17 - 24) = v18;
        v17 -= 24;
        *(void *)(v15 - 16) = 0;
        *(void *)(v15 - 8) = 0;
        *(void *)(v15 - 24) = 0;
        v15 -= 24;
      }
      while (v15 != v16);
      int64x2_t v19 = v89;
    }
    v89.i64[0] = (uint64_t)v17;
    v89.i64[1] = (uint64_t)v13;
    *(int64x2_t *)&buf[8] = v19;
    uint64_t v20 = (uint64_t)v90;
    v90 = &v13[24 * v14];
    uint64_t v99 = v20;
    *(void *)buf = v19.i64[0];
    sub_25C7D0BDC((uint64_t)buf);
  }
  unsigned int v83 = v5;
  uint64_t v84 = MEMORY[0x263F8C328] + 104;
  v107[0] = MEMORY[0x263F8C328] + 104;
  uint64_t v21 = MEMORY[0x263F8C328] + 64;
  *(void *)&buf[16] = MEMORY[0x263F8C328] + 64;
  uint64_t v22 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v23 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  *(void *)buf = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = v23;
  *(void *)&buf[8] = 0;
  uint64_t v24 = (std::ios_base *)&buf[*(void *)(*(void *)buf - 24)];
  std::ios_base::init(v24, &v99);
  uint64_t v25 = MEMORY[0x263F8C328] + 24;
  v24[1].__vftable = 0;
  v24[1].__fmtflags_ = -1;
  uint64_t v26 = v22[5];
  *(void *)&buf[16] = v22[4];
  *(void *)&buf[*(void *)(*(void *)&buf[16] - 24) + 16] = v26;
  *(void *)buf = v22[1];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = v22[6];
  v107[0] = v84;
  *(void *)buf = v25;
  *(void *)&buf[16] = v21;
  std::streambuf::basic_streambuf();
  uint64_t v85 = MEMORY[0x263F8C318] + 16;
  uint64_t v99 = MEMORY[0x263F8C318] + 16;
  long long v104 = 0u;
  long long v105 = 0u;
  int v106 = 24;
  std::string::operator=((std::string *)&v104, (const std::string *)a3);
  *((void *)&v105 + 1) = 0;
  if ((SBYTE7(v105) & 0x80u) == 0) {
    v27 = (char *)&v104;
  }
  else {
    v27 = (char *)v104;
  }
  if ((SBYTE7(v105) & 0x80u) == 0) {
    unint64_t v28 = BYTE7(v105);
  }
  else {
    unint64_t v28 = *((void *)&v104 + 1);
  }
  if ((v106 & 8) != 0)
  {
    v101[0] = v27;
    v101[1] = v27;
    *((void *)&v105 + 1) = &v27[v28];
    v101[2] = &v27[v28];
  }
  if ((v106 & 0x10) != 0)
  {
    *((void *)&v105 + 1) = &v27[v28];
    if ((SBYTE7(v105) & 0x80u) == 0) {
      std::string::size_type v29 = 22;
    }
    else {
      std::string::size_type v29 = (v105 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    }
    std::string::resize((std::string *)&v104, v29, 0);
    uint64_t v30 = BYTE7(v105);
    if (SBYTE7(v105) < 0) {
      uint64_t v30 = *((void *)&v104 + 1);
    }
    v101[3] = v27;
    v102 = v27;
    v103 = &v27[v30];
    if ((v106 & 3) != 0)
    {
      if (v28 >> 31)
      {
        uint64_t v31 = ((v28 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v32 = 0x7FFFFFFF * ((v31 + ((v28 - 0x80000000 - v31) >> 1)) >> 30);
        v27 += v32 + 0x7FFFFFFF;
        unint64_t v28 = v28 - v32 - 0x7FFFFFFF;
        v102 = v27;
      }
      if (v28) {
        v102 = &v27[v28];
      }
    }
  }
  memset(&v88, 0, sizeof(v88));
  while (2)
  {
    MEMORY[0x2611943A0](&__dst, buf, 1);
    if (!__dst.__r_.__value_.__s.__data_[0]) {
      goto LABEL_61;
    }
    if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
    {
      *v88.__r_.__value_.__l.__data_ = 0;
      v88.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      v88.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&v88.__r_.__value_.__s + 23) = 0;
    }
    uint64_t v33 = 0;
    while (1)
    {
      v34 = *(void **)((char *)v101 + *(void *)(*(void *)buf - 24));
      v35 = (unsigned char *)v34[3];
      if (v35 != (unsigned char *)v34[4])
      {
        v34[3] = v35 + 1;
        LOBYTE(v34) = *v35;
        goto LABEL_52;
      }
      LODWORD(v34) = (*(uint64_t (**)(void *))(*v34 + 80))(v34);
      if (v34 == -1) {
        break;
      }
LABEL_52:
      if (v34 == a4)
      {
        int v36 = 0;
        goto LABEL_60;
      }
      std::string::push_back(&v88, (std::string::value_type)v34);
      --v33;
      if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0 && v88.__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7)
      {
        int v36 = 4;
        goto LABEL_60;
      }
    }
    if (v33) {
      int v36 = 2;
    }
    else {
      int v36 = 6;
    }
LABEL_60:
    std::ios_base::clear((std::ios_base *)&buf[*(void *)(*(void *)buf - 24)], *(_DWORD *)((char *)&v101[-1] + *(void *)(*(void *)buf - 24)) | v36);
LABEL_61:
    if ((*((unsigned char *)&v101[-1] + *(void *)(*(void *)buf - 24)) & 5) == 0)
    {
      v37 = (_OWORD *)v89.i64[1];
      if (v89.i64[1] >= (unint64_t)v90)
      {
        unint64_t v39 = 0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3);
        unint64_t v40 = v39 + 1;
        if (v39 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_25C7D06B8();
        }
        if (0x5555555555555556 * ((uint64_t)&v90[-v89.i64[0]] >> 3) > v40) {
          unint64_t v40 = 0x5555555555555556 * ((uint64_t)&v90[-v89.i64[0]] >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v90[-v89.i64[0]] >> 3) >= 0x555555555555555) {
          unint64_t v41 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v41 = v40;
        }
        v97 = &v90;
        if (v41)
        {
          v43 = (char *)sub_25C7D0B94(v41);
        }
        else
        {
          v43 = 0;
          uint64_t v42 = 0;
        }
        std::string::size_type size = (std::string::size_type)&v43[24 * v39];
        __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
        __dst.__r_.__value_.__l.__size_ = size;
        __dst.__r_.__value_.__r.__words[2] = size;
        std::string::size_type v96 = (std::string::size_type)&v43[24 * v42];
        if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_25C7D0C40((unsigned char *)size, v88.__r_.__value_.__l.__data_, v88.__r_.__value_.__l.__size_);
          v47 = (char *)__dst.__r_.__value_.__r.__words[2];
          std::string::size_type size = __dst.__r_.__value_.__l.__size_;
        }
        else
        {
          long long v46 = *(_OWORD *)&v88.__r_.__value_.__l.__data_;
          *(void *)(size + 16) = *((void *)&v88.__r_.__value_.__l + 2);
          *(_OWORD *)std::string::size_type size = v46;
          v47 = &v43[24 * v39];
        }
        uint64_t v49 = v89.i64[1];
        uint64_t v48 = v89.i64[0];
        if (v89.i64[1] == v89.i64[0])
        {
          int64x2_t v51 = vdupq_n_s64(v89.u64[1]);
        }
        else
        {
          do
          {
            long long v50 = *(_OWORD *)(v49 - 24);
            *(void *)(size - 8) = *(void *)(v49 - 8);
            *(_OWORD *)(size - 24) = v50;
            size -= 24;
            *(void *)(v49 - 16) = 0;
            *(void *)(v49 - 8) = 0;
            *(void *)(v49 - 24) = 0;
            v49 -= 24;
          }
          while (v49 != v48);
          int64x2_t v51 = v89;
        }
        v44 = v47 + 24;
        v89.i64[0] = size;
        v89.i64[1] = (uint64_t)(v47 + 24);
        *(int64x2_t *)&__dst.__r_.__value_.__r.__words[1] = v51;
        std::string::size_type v52 = (std::string::size_type)v90;
        v90 = (char *)v96;
        std::string::size_type v96 = v52;
        __dst.__r_.__value_.__r.__words[0] = v51.i64[0];
        sub_25C7D0BDC((uint64_t)&__dst);
      }
      else
      {
        if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0)
        {
          sub_25C7D0C40((unsigned char *)v89.i64[1], v88.__r_.__value_.__l.__data_, v88.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v38 = *(_OWORD *)&v88.__r_.__value_.__l.__data_;
          *(void *)(v89.i64[1] + 16) = *((void *)&v88.__r_.__value_.__l + 2);
          _OWORD *v37 = v38;
        }
        v44 = (char *)v37 + 24;
      }
      v89.i64[1] = (uint64_t)v44;
      continue;
    }
    break;
  }
  unint64_t v53 = 0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3);
  if (v53 >= v83) {
    int v54 = v83;
  }
  else {
    int v54 = -1431655765 * ((v89.i64[1] - v89.i64[0]) >> 3);
  }
  unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 3);
  unint64_t v56 = v53 - 0x5555555555555555 * ((a2[1] - *a2) >> 3) - v54 + 1;
  uint64_t v86 = (uint64_t)(a2 + 2);
  v57 = (void *)MEMORY[0x263F8C2B8];
  if (0xAAAAAAAAAAAAAAABLL * ((a2[2] - *a2) >> 3) < v56)
  {
    if (v56 > 0xAAAAAAAAAAAAAAALL) {
      sub_25C7D06B8();
    }
    v97 = (char **)(a2 + 2);
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)sub_25C7D0D58(v86, v56);
    __dst.__r_.__value_.__l.__size_ = __dst.__r_.__value_.__r.__words[0] + 24 * v55;
    __dst.__r_.__value_.__r.__words[2] = __dst.__r_.__value_.__l.__size_;
    std::string::size_type v96 = __dst.__r_.__value_.__r.__words[0] + 24 * v58;
    sub_25C7D0CE0(a2, &__dst);
    sub_25C7D0EC0((uint64_t)&__dst);
    unint64_t v53 = 0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3);
  }
  int v59 = v54 - 1;
  if (v53 > v54 - 1)
  {
    uint64_t v60 = v59;
    uint64_t v61 = v59 + 1;
    uint64_t v62 = 24 * v59 - 24 * v59;
    unint64_t v63 = v59;
    do
    {
      sub_25C7D0AE0(&v87, "");
      uint64_t v64 = v62;
      uint64_t v65 = v61;
      if (v54 >= 1)
      {
        do
        {
          std::string::size_type v66 = HIBYTE(v87.__r_.__value_.__r.__words[2]);
          if ((v87.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            std::string::size_type v66 = v87.__r_.__value_.__l.__size_;
          }
          if (v66)
          {
            v67 = std::string::append(&v87, ".", 1uLL);
            int v68 = *(char *)(v89.i64[0] + v64 + 23);
            if (v68 >= 0) {
              v69 = (const std::string::value_type *)(v89.i64[0] + v64);
            }
            else {
              v69 = *(const std::string::value_type **)(v89.i64[0] + v64);
            }
            if (v68 >= 0) {
              std::string::size_type v70 = *(unsigned __int8 *)(v89.i64[0] + v64 + 23);
            }
            else {
              std::string::size_type v70 = *(void *)(v89.i64[0] + v64 + 8);
            }
          }
          else
          {
            int v71 = *(char *)(v89.i64[0] + v64 + 23);
            if (v71 >= 0) {
              v69 = (const std::string::value_type *)(v89.i64[0] + v64);
            }
            else {
              v69 = *(const std::string::value_type **)(v89.i64[0] + v64);
            }
            if (v71 >= 0) {
              std::string::size_type v70 = *(unsigned __int8 *)(v89.i64[0] + v64 + 23);
            }
            else {
              std::string::size_type v70 = *(void *)(v89.i64[0] + v64 + 8);
            }
            v67 = &v87;
          }
          std::string::append(v67, v69, v70);
          v64 += 24;
        }
        while (v65-- > 1);
      }
      v57 = (void *)MEMORY[0x263F8C2B8];
      if (v63 == v60)
      {
        sub_25C7CE5AC(&__dst, (const void **)v93, (const void **)&v87.__r_.__value_.__l.__data_);
        if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v87.__r_.__value_.__l.__data_);
        }
        std::string v87 = __dst;
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3) - 1 == v63)
      {
        sub_25C7CE5AC(&__dst, (const void **)&v87.__r_.__value_.__l.__data_, (const void **)v91);
        if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v87.__r_.__value_.__l.__data_);
        }
        std::string v87 = __dst;
      }
      skit::to_u16string();
      unint64_t v74 = a2[1];
      unint64_t v73 = a2[2];
      if (v74 >= v73)
      {
        unint64_t v75 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v74 - *a2) >> 3);
        unint64_t v76 = v75 + 1;
        if (v75 + 1 > 0xAAAAAAAAAAAAAAALL) {
          sub_25C7D06B8();
        }
        unint64_t v77 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v73 - *a2) >> 3);
        if (2 * v77 > v76) {
          unint64_t v76 = 2 * v77;
        }
        if (v77 >= 0x555555555555555) {
          unint64_t v78 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v78 = v76;
        }
        v97 = (char **)(a2 + 2);
        if (v78) {
          v79 = sub_25C7D0D58(v86, v78);
        }
        else {
          v79 = 0;
        }
        std::string::size_type v80 = (std::string::size_type)v79 + 24 * v75;
        __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v79;
        __dst.__r_.__value_.__l.__size_ = v80;
        std::string::size_type v96 = (std::string::size_type)v79 + 24 * v78;
        *(void *)(v80 + 16) = 0;
        *(_OWORD *)std::string::size_type v80 = 0uLL;
        __dst.__r_.__value_.__r.__words[2] = v80 + 24;
        sub_25C7D0CE0(a2, &__dst);
        uint64_t v81 = a2[1];
        sub_25C7D0EC0((uint64_t)&__dst);
        a2[1] = v81;
      }
      else
      {
        *(void *)(v74 + 16) = 0;
        *(_OWORD *)unint64_t v74 = 0uLL;
        a2[1] = v74 + 24;
      }
      if (SHIBYTE(v87.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v87.__r_.__value_.__l.__data_);
      }
      ++v63;
      v62 += 24;
    }
    while (0xAAAAAAAAAAAAAAABLL * ((v89.i64[1] - v89.i64[0]) >> 3) > v63);
  }
  if (SHIBYTE(v88.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v88.__r_.__value_.__l.__data_);
  }
  *(void *)buf = *v57;
  uint64_t v82 = v57[9];
  *(void *)&buf[*(void *)(*(void *)buf - 24)] = v57[8];
  *(void *)&buf[16] = v82;
  uint64_t v99 = v85;
  if (SBYTE7(v105) < 0) {
    operator delete((void *)v104);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x261194420](v107);
  *(void *)buf = &v89;
  sub_25C7D0F50((void ***)buf);
  if (v92 < 0) {
    operator delete(v91[0]);
  }
  if (v94 < 0) {
    operator delete(v93[0]);
  }
}

void sub_25C7CE45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  sub_25C7CE6C0((uint64_t)&a48);
  long long __p = &a28;
  sub_25C7D0F50((void ***)&__p);
  if (a36 < 0) {
    operator delete(a31);
  }
  if (a42 < 0) {
    operator delete(a37);
  }
  _Unwind_Resume(a1);
}

void *sub_25C7CE5AC(void *__dst, const void **a2, const void **a3)
{
  uint64_t v3 = __dst;
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  int v6 = *((char *)a3 + 23);
  if (v6 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  unint64_t v8 = v7 + v5;
  if (v7 + v5 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C7D00F4();
  }
  if (v8 <= 0x16)
  {
    __dst[1] = 0;
    __dst[2] = 0;
    *std::string __dst = 0;
    *((unsigned char *)__dst + 23) = v8;
    if (!v5) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  uint64_t v11 = (v8 & 0xFFFFFFFFFFFFFFF8) + 8;
  if ((v8 | 7) != 0x17) {
    uint64_t v11 = v8 | 7;
  }
  uint64_t v12 = v11 + 1;
  std::string __dst = operator new(v11 + 1);
  v3[1] = v8;
  v3[2] = v12 | 0x8000000000000000;
  void *v3 = __dst;
  uint64_t v3 = __dst;
  if (v5)
  {
LABEL_14:
    if (v4 >= 0) {
      uint64_t v13 = a2;
    }
    else {
      uint64_t v13 = *a2;
    }
    std::string __dst = memmove(v3, v13, v5);
  }
LABEL_18:
  uint64_t v14 = (char *)v3 + v5;
  if (v7)
  {
    if (v6 >= 0) {
      uint64_t v15 = a3;
    }
    else {
      uint64_t v15 = *a3;
    }
    std::string __dst = memmove(v14, v15, v7);
  }
  v14[v7] = 0;
  return __dst;
}

uint64_t sub_25C7CE6C0(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2B8];
  uint64_t v3 = *MEMORY[0x263F8C2B8];
  *(void *)a1 = *MEMORY[0x263F8C2B8];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 16) = v4;
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 111) < 0) {
    operator delete(*(void **)(a1 + 88));
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x261194420](a1 + 128);
  return a1;
}

void sub_25C7CE7F8(uint64_t a1@<X0>, unsigned __int16 **a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  *a4 = a4 + 2;
  a4[1] = 0x200000000;
  sub_25C7CE874(a1, a2, (size_t)a4, a3);
  if (*(unsigned char *)(a1 + 177)) {
    sub_25C7CEF44(a1, (uint64_t *)a2, (uint64_t)a4);
  }
}

void sub_25C7CE860(_Unwind_Exception *a1)
{
  sub_25C7D2390(v1);
  _Unwind_Resume(a1);
}

void sub_25C7CE874(uint64_t a1, unsigned __int16 **a2, size_t a3, int a4)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)(*(void *)(a1 + 8) + 32) & 2) == 0) {
    return;
  }
  unsigned int v8 = *(_DWORD *)(a3 + 8)
     + ((-1431655765 * ((unint64_t)((char *)a2[1] - (char *)*a2) >> 4)) << ((*(unsigned char *)(*(void *)(a1 + 8) + 32) & 4) != 0));
  if (*(_DWORD *)(a3 + 12) < v8) {
    sub_25C7D241C((long long **)a3, v8);
  }
  morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory((morphun::analysis::DefaultAnalyzerFactory *)v69);
  uint64_t v9 = *(void *)(a1 + 8);
  size_t v10 = *(void *)(v9 + 24);
  if (v10 > 0x7FFFFFFFFFFFFFF7) {
    sub_25C7D00F4();
  }
  uint64_t v11 = *(const void **)(v9 + 16);
  if (v10 >= 0x17)
  {
    uint64_t v13 = (v10 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v10 | 7) != 0x17) {
      uint64_t v13 = v10 | 7;
    }
    uint64_t v14 = v13 + 1;
    p_dst = (void **)operator new(v13 + 1);
    size_t v64 = v10;
    int64_t v65 = v14 | 0x8000000000000000;
    std::string __dst = p_dst;
  }
  else
  {
    HIBYTE(v65) = *(void *)(v9 + 24);
    p_dst = (void **)&__dst;
    if (!v10) {
      goto LABEL_12;
    }
  }
  memmove(p_dst, v11, v10);
LABEL_12:
  *((unsigned char *)p_dst + v10) = 0;
  memset(v62, 0, sizeof(v62));
  memset(v61, 0, sizeof(v61));
  morphun::util::ULocale::ULocale();
  uint64_t Analyzer = morphun::analysis::DefaultAnalyzerFactory::createAnalyzer((morphun::analysis::DefaultAnalyzerFactory *)v69, (const morphun::util::ULocale *)&v66);
  morphun::util::ULocale::~ULocale((morphun::util::ULocale *)&v66);
  size_t v60 = a3;
  if (SHIBYTE(v65) < 0) {
    operator delete(__dst);
  }
  uint64_t v16 = *a2;
  uint64_t v17 = a2[1];
  if (*a2 != v17)
  {
    int v18 = 0;
    int v59 = a4;
    while (1)
    {
      uint64_t v19 = (*(uint64_t (**)(uint64_t, unsigned __int16 *))(*(void *)Analyzer + 64))(Analyzer, v16);
      (*(void (**)(void **__return_ptr))(*(void *)v19 + 72))(&v66);
      LOWORD(v61[0]) = 1024;
      int v20 = v18 + 1;
      LODWORD(v62[0]) = v18;
      HIDWORD(v62[0]) = v18 + 1;
      if ((*(unsigned char *)(*(void *)(a1 + 8) + 32) & 4) == 0) {
        goto LABEL_75;
      }
      unint64_t v21 = v68;
      uint64_t v22 = (char *)&v66;
      if ((v68 & 0x80u) != 0)
      {
        uint64_t v22 = (char *)v66;
        unint64_t v21 = v67;
      }
      if (!v21) {
        goto LABEL_75;
      }
      uint64_t v23 = 0;
      unint64_t v24 = v21;
      while (*(_WORD *)&v22[v23] != 32)
      {
        v23 += 2;
        if (!--v24) {
          goto LABEL_75;
        }
      }
      if (v23 == -2)
      {
LABEL_75:
        if (!a4) {
          goto LABEL_89;
        }
        goto LABEL_76;
      }
      std::string __dst = 0;
      size_t v64 = 0;
      int64_t v65 = 0;
      if (v21 > 0x7FFFFFFFFFFFFFF7) {
        sub_25C7D00F4();
      }
      if (v21 >= 0xB) {
        break;
      }
LABEL_42:
      unint64_t v38 = v68;
      if ((v68 & 0x80u) == 0) {
        unint64_t v39 = (unsigned __int16 *)&v66;
      }
      else {
        unint64_t v39 = (unsigned __int16 *)v66;
      }
      if ((v68 & 0x80u) != 0) {
        unint64_t v38 = v67;
      }
      if (v38)
      {
        uint64_t v40 = 2 * v38;
        while (1)
        {
          int v41 = *v39;
          if (v41 != 32) {
            break;
          }
LABEL_58:
          ++v39;
          v40 -= 2;
          if (!v40) {
            goto LABEL_59;
          }
        }
        if (SHIBYTE(v65) < 0)
        {
          uint64_t v43 = v64;
          uint64_t v42 = (v65 & 0x7FFFFFFFFFFFFFFFLL) - 1;
          if (v64 == v42)
          {
LABEL_54:
            sub_25C7D03C4((uint64_t)&__dst, v42, 1uLL, v42, v42, 0, 0);
            uint64_t v43 = v42;
          }
          v44 = __dst;
          size_t v64 = v43 + 1;
        }
        else
        {
          if (HIBYTE(v65) == 10)
          {
            uint64_t v42 = 10;
            goto LABEL_54;
          }
          uint64_t v43 = HIBYTE(v65);
          HIBYTE(v65) = (HIBYTE(v65) + 1) & 0x7F;
          v44 = (void **)&__dst;
        }
        v45 = (_WORD *)v44 + v43;
        _WORD *v45 = v41;
        v45[1] = 0;
        goto LABEL_58;
      }
LABEL_59:
      a4 = v59;
      if (!v59)
      {
LABEL_73:
        sub_25C7CF814(v60, (uint64_t *)&__dst, (uint64_t *)v62, (__int16 *)v61);
        char v47 = HIBYTE(v65);
        goto LABEL_74;
      }
      size_t v46 = HIBYTE(v65);
      char v47 = HIBYTE(v65);
      if (v65 < 0) {
        size_t v46 = v64;
      }
      uint64_t v48 = *((unsigned __int8 *)v16 + 23);
      int v49 = (char)v48;
      if ((v48 & 0x80u) != 0) {
        uint64_t v48 = *((void *)v16 + 1);
      }
      if (v46 == v48)
      {
        if (!v46) {
          goto LABEL_73;
        }
        long long v50 = __dst;
        if (v65 >= 0) {
          long long v50 = (void **)&__dst;
        }
        if (v49 >= 0) {
          int64x2_t v51 = v16;
        }
        else {
          int64x2_t v51 = *(unsigned __int16 **)v16;
        }
        while (*v51 == *(unsigned __int16 *)v50)
        {
          long long v50 = (void **)((char *)v50 + 2);
          ++v51;
          if (!--v46) {
            goto LABEL_73;
          }
        }
      }
LABEL_74:
      if ((v47 & 0x80) == 0) {
        goto LABEL_75;
      }
      operator delete(__dst);
      if (!v59) {
        goto LABEL_89;
      }
LABEL_76:
      unint64_t v52 = v68;
      unsigned __int8 v53 = v68;
      if ((v68 & 0x80u) != 0) {
        unint64_t v52 = v67;
      }
      uint64_t v54 = *((unsigned __int8 *)v16 + 23);
      int v55 = (char)v54;
      if ((v54 & 0x80u) != 0) {
        uint64_t v54 = *((void *)v16 + 1);
      }
      if (v52 != v54) {
        goto LABEL_90;
      }
      if (v52)
      {
        unint64_t v56 = (unsigned __int16 *)v66;
        if ((v68 & 0x80u) == 0) {
          unint64_t v56 = (unsigned __int16 *)&v66;
        }
        if (v55 >= 0) {
          v57 = v16;
        }
        else {
          v57 = *(unsigned __int16 **)v16;
        }
        while (*v57 == *v56)
        {
          ++v56;
          ++v57;
          if (!--v52) {
            goto LABEL_89;
          }
        }
        goto LABEL_90;
      }
LABEL_89:
      sub_25C7CF814(v60, (uint64_t *)&v66, (uint64_t *)v62, (__int16 *)v61);
      unsigned __int8 v53 = v68;
LABEL_90:
      if ((v53 & 0x80) != 0) {
        operator delete(v66);
      }
      (*(void (**)(uint64_t))(*(void *)v19 + 16))(v19);
      v16 += 24;
      int v18 = v20;
      if (v16 == v17) {
        goto LABEL_96;
      }
    }
    if ((v21 | 3) == 0xB)
    {
      unint64_t v25 = v21 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v26 = v25 + 5;
      if (v25 < 7)
      {
        v27 = 0;
        size_t v28 = 0;
        std::string::size_type v29 = (void **)&__dst;
        char v30 = 1;
        int v31 = 1;
        goto LABEL_34;
      }
    }
    else
    {
      uint64_t v26 = (v21 | 3) + 1;
    }
    std::string::size_type v29 = (void **)sub_25C7D04E8((uint64_t)&__dst, v26);
    uint64_t v26 = v32;
    char v30 = 0;
    if (SHIBYTE(v65) < 0)
    {
      int v31 = 1;
      v27 = __dst;
      size_t v28 = v64;
    }
    else
    {
      int v31 = 0;
      size_t v28 = HIBYTE(v65);
      v27 = (void **)&__dst;
    }
LABEL_34:
    BOOL v33 = __CFADD__(v28, 1);
    size_t v34 = v28 + 1;
    if (v33)
    {
      if (v31) {
        goto LABEL_40;
      }
    }
    else
    {
      v35 = v29;
      uint64_t v58 = v29;
      char v36 = v30;
      v37 = v27;
      memmove(v35, v27, 2 * v34);
      v27 = v37;
      char v30 = v36;
      std::string::size_type v29 = v58;
      if (v31)
      {
LABEL_40:
        operator delete(v27);
        if (v30)
        {
LABEL_38:
          HIBYTE(v65) = 0;
          goto LABEL_42;
        }
        goto LABEL_41;
      }
    }
    if (v30) {
      goto LABEL_38;
    }
LABEL_41:
    size_t v64 = 0;
    int64_t v65 = v26 | 0x8000000000000000;
    std::string __dst = v29;
    goto LABEL_42;
  }
LABEL_96:
  morphun::analysis::DefaultAnalyzerFactory::~DefaultAnalyzerFactory((morphun::analysis::DefaultAnalyzerFactory *)v69);
}

void sub_25C7CEE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,void *a37,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,char a56)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (a36 < 0) {
    operator delete(a31);
  }
  morphun::analysis::DefaultAnalyzerFactory::~DefaultAnalyzerFactory((morphun::analysis::DefaultAnalyzerFactory *)&a56);
  _Unwind_Resume(a1);
}

void sub_25C7CEF44(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  if (!*(void *)(a1 + 144))
  {
    CFStringCreateWithCharacters(0, **(const UniChar ***)(a1 + 8), *(void *)(*(void *)(a1 + 8) + 8));
    *(void *)(a1 + 144) = CEMCreateEmojiLocaleData();
  }
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  int v18 = 0;
  __int16 v14 = 1280;
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  if (*a2 != v7)
  {
    do
    {
      if (*(char *)(v6 + 23) < 0)
      {
        uint64_t v9 = *(const UniChar **)v6;
        CFIndex v8 = *(void *)(v6 + 8);
      }
      else
      {
        CFIndex v8 = *(unsigned __int8 *)(v6 + 23);
        uint64_t v9 = (const UniChar *)v6;
      }
      CFStringCreateWithCharacters(0, v9, v8);
      if (CEMStringIsSingleEmoji())
      {
        LODWORD(v13) = *((_DWORD *)v16 + 6);
        HIDWORD(v13) = v13 + 1;
        sub_25C7CF8F8(a3, (long long *)v6, &v13, &v14);
      }
      else
      {
        if (*(char *)(v6 + 23) < 0)
        {
          uint64_t v11 = *(const UniChar **)v6;
          CFIndex v10 = *(void *)(v6 + 8);
        }
        else
        {
          CFIndex v10 = *(unsigned __int8 *)(v6 + 23);
          uint64_t v11 = (const UniChar *)v6;
        }
        CFStringRef v12 = CFStringCreateWithCharacters(0, v11, v10);
        CFStringGetLength(v12);
        CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock();
      }
      ++*((_DWORD *)v16 + 6);
      v6 += 48;
    }
    while (v6 != v7);
  }
  _Block_object_dispose(&v15, 8);
}

void sub_25C7CF0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25C7CF11C(uint64_t a1@<X1>, long long ***a2@<X2>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v6 = *a2;
  size_t v5 = a2[1];
  uint64_t v7 = (char *)v5 - (char *)*a2;
  if (v5 == *a2)
  {
    uint64_t v9 = 0;
  }
  else
  {
    if (v7 < 0) {
      sub_25C7D06B8();
    }
    uint64_t v9 = sub_25C7D0FDC(v7 >> 5);
    *a3 = v9;
    a3[1] = v9;
    a3[2] = &v9[v10];
    uint64_t v6 = *a2;
    size_t v5 = a2[1];
  }
  if (v6 != v5)
  {
    char v30 = v5;
    do
    {
      unint64_t v11 = a3[2];
      if ((unint64_t)v9 >= v11)
      {
        CFStringRef v12 = (_WORD *)*a3;
        uint64_t v13 = (uint64_t)v9 - *a3;
        if (v13 <= -3) {
          sub_25C7D06B8();
        }
        uint64_t v14 = v13 >> 1;
        unint64_t v15 = v11 - (void)v12;
        if (v15 <= (v13 >> 1) + 1) {
          unint64_t v16 = v14 + 1;
        }
        else {
          unint64_t v16 = v15;
        }
        if (v15 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v17 = v16;
        }
        if (v17) {
          uint64_t v17 = (uint64_t)sub_25C7D0FDC(v17);
        }
        else {
          uint64_t v18 = 0;
        }
        uint64_t v19 = (_WORD *)(v17 + 2 * v14);
        *uint64_t v19 = *((_WORD *)v6 + 12);
        int v20 = v19 + 1;
        if (v9 != v12)
        {
          do
          {
            __int16 v21 = *--v9;
            *--uint64_t v19 = v21;
          }
          while (v9 != v12);
          uint64_t v9 = (_WORD *)*a3;
        }
        *a3 = v19;
        a3[1] = v20;
        a3[2] = v17 + 2 * v18;
        if (v9) {
          operator delete(v9);
        }
        uint64_t v9 = v20;
      }
      else
      {
        *v9++ = *((_WORD *)v6 + 12);
      }
      a3[1] = v9;
      uint64_t v22 = *v6;
      uint64_t v23 = v6[1];
      if (*v6 != v23)
      {
        unsigned int v24 = *(_DWORD *)(a1 + 8);
        do
        {
          if (v24 == *(_DWORD *)(a1 + 12))
          {
            sub_25C7D241C((long long **)a1, v24 + (v24 >> 1) + 1);
            unsigned int v24 = *(_DWORD *)(a1 + 8);
          }
          unint64_t v25 = *(long long **)a1;
          if (*((char *)v22 + 23) < 0)
          {
            sub_25C7D059C(&__dst, *(void **)v22, *((void *)v22 + 1));
          }
          else
          {
            long long v26 = *v22;
            uint64_t v32 = *((void *)v22 + 2);
            long long __dst = v26;
          }
          v27 = (char *)v25 + 40 * v24;
          __int16 v28 = *((_WORD *)v6 + 12);
          uint64_t v29 = v32;
          *(_OWORD *)v27 = __dst;
          *((void *)v27 + 2) = v29;
          *((void *)v27 + 3) = 0x100000000;
          *((_WORD *)v27 + 16) = v28;
          unsigned int v24 = *(_DWORD *)(a1 + 8) + 1;
          *(_DWORD *)(a1 + 8) = v24;
          v22 += 3;
        }
        while (v22 != v23);
      }
      v6 += 4;
    }
    while (v6 != v30);
  }
}

void sub_25C7CF318(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    *(void *)(v1 + 8) = v2;
    operator delete(v2);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C7CF344(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v4 = a3;
  size_t v5 = v4;
  if (v4)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v4;
    uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v40, (uint64_t)v44, 16);
    if (v7)
    {
      LODWORD(v11) = 0;
      int v31 = v5;
      uint64_t v32 = *(void *)v41;
      do
      {
        uint64_t v34 = v7;
        uint64_t v12 = 0;
        unsigned int v13 = v11;
        do
        {
          if (*(void *)v41 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v40 + 1) + 8 * v12);
          uint64_t v37 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = 0;
          objc_msgSend_phoneSequence(v14, v8, v9, v10);
          id v15 = objc_claimAutoreleasedReturnValue();
          uint64_t v19 = (char *)objc_msgSend_UTF8String(v15, v16, v17, v18);
          sub_25C7D0AE0(__p, v19);

          sub_25C7CD6B8(a1, &v37, (uint64_t)__p, 0x20u, -1);
          uint64_t v21 = v37;
          uint64_t v20 = v38;
          unsigned int v22 = *(_DWORD *)(a2 + 8) - 1431655765 * ((unint64_t)(v38 - v37) >> 3);
          if (*(_DWORD *)(a2 + 12) < v22)
          {
            sub_25C7D241C((long long **)a2, v22);
            uint64_t v21 = v37;
            uint64_t v20 = v38;
          }
          uint64_t v11 = v13 + 1;
          if (v21 != v20)
          {
            unint64_t v23 = v13 | (unint64_t)(v11 << 32);
            unsigned int v24 = *(_DWORD *)(a2 + 8);
            do
            {
              if (v24 == *(_DWORD *)(a2 + 12))
              {
                sub_25C7D241C((long long **)a2, v24 + (v24 >> 1) + 1);
                unsigned int v24 = *(_DWORD *)(a2 + 8);
              }
              unint64_t v25 = *(long long **)a2;
              if (*(char *)(v21 + 23) < 0)
              {
                sub_25C7D059C(buf, *(void **)v21, *(void *)(v21 + 8));
              }
              else
              {
                long long v26 = *(_OWORD *)v21;
                uint64_t v46 = *(void *)(v21 + 16);
                *(_OWORD *)buf = v26;
              }
              v27 = (char *)v25 + 40 * v24;
              uint64_t v28 = v46;
              *(_OWORD *)v27 = *(_OWORD *)buf;
              *((void *)v27 + 2) = v28;
              *((void *)v27 + 3) = v23;
              *((_WORD *)v27 + 16) = 1792;
              unsigned int v24 = *(_DWORD *)(a2 + 8) + 1;
              *(_DWORD *)(a2 + 8) = v24;
              v21 += 24;
            }
            while (v21 != v20);
          }
          if (v36 < 0) {
            operator delete(__p[0]);
          }
          *(void *)buf = &v37;
          sub_25C7D1010((void ***)buf);
          ++v12;
          unsigned int v13 = v11;
          size_t v5 = v31;
        }
        while (v12 != v34);
        uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v40, (uint64_t)v44, 16);
      }
      while (v7);
    }
  }
  else
  {
    uint64_t v29 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "append_dynamic_phonetic_aliases";
      _os_log_error_impl(&dword_25C7CA000, v29, OS_LOG_TYPE_ERROR, "%s Empty ASR phone sequence found", buf, 0xCu);
    }
  }
}

void sub_25C7CF600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,char a21)
{
  _Unwind_Resume(a1);
}

void sub_25C7CF66C(uint64_t a1, size_t a2, long long **a3)
{
  size_t v5 = *a3;
  uint64_t v6 = a3[1];
  unsigned int v7 = *(_DWORD *)(a2 + 12);
  unsigned int v8 = *(_DWORD *)(a2 + 8) - 1431655765 * ((unint64_t)((char *)v6 - (char *)*a3) >> 4);
  if (v7 < v8)
  {
    sub_25C7D241C((long long **)a2, v8);
    size_t v5 = *a3;
    uint64_t v6 = a3[1];
  }
  __int16 v17 = 1536;
  if (v5 != v6)
  {
    int v10 = 0;
    do
    {
      int v11 = v10 + 1;
      LODWORD(v16) = v10;
      HIDWORD(v16) = v10 + 1;
      uint64_t v12 = *(void *)(a1 + 224);
      if (v12)
      {
        uint64_t v13 = (*(uint64_t (**)(uint64_t, long long *))(*(void *)v12 + 64))(v12, v5);
        (*(void (**)(void **__return_ptr))(*(void *)v13 + 72))(__p);
        sub_25C7CF814(a2, (uint64_t *)__p, &v16, &v17);
        if (v15 < 0) {
          operator delete(__p[0]);
        }
        (*(void (**)(uint64_t))(*(void *)v13 + 16))(v13);
      }
      else
      {
        sub_25C7CF8F8(a2, v5, &v16, &v17);
      }
      v5 += 3;
      int v10 = v11;
    }
    while (v5 != v6);
  }
}

void sub_25C7CF7C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  (*(void (**)(uint64_t))(*(void *)v15 + 16))(v15);
  _Unwind_Resume(a1);
}

size_t sub_25C7CF814(size_t result, uint64_t *a2, uint64_t *a3, __int16 *a4)
{
  size_t v7 = result;
  unsigned int v8 = *(_DWORD *)(result + 8);
  if (v8 == *(_DWORD *)(result + 12))
  {
    result = sub_25C7D241C((long long **)result, v8 + (v8 >> 1) + 1);
    unsigned int v8 = *(_DWORD *)(v7 + 8);
  }
  uint64_t v9 = *(void *)v7 + 40 * v8;
  uint64_t v10 = *a2;
  *(void *)&long long v14 = a2[1];
  *(void *)((char *)&v14 + 7) = *(uint64_t *)((char *)a2 + 15);
  char v11 = *((unsigned char *)a2 + 23);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  uint64_t v12 = *a3;
  __int16 v13 = *a4;
  *(void *)uint64_t v9 = v10;
  *(void *)(v9 + 8) = v14;
  *(void *)(v9 + 15) = *(void *)((char *)&v14 + 7);
  *(unsigned char *)(v9 + 23) = v11;
  *(void *)(v9 + 24) = v12;
  *(_WORD *)(v9 + 32) = v13;
  ++*(_DWORD *)(v7 + 8);
  return result;
}

double sub_25C7CF8F8(uint64_t a1, long long *a2, uint64_t *a3, __int16 *a4)
{
  unsigned int v8 = *(_DWORD *)(a1 + 8);
  if (v8 == *(_DWORD *)(a1 + 12))
  {
    sub_25C7D241C((long long **)a1, v8 + (v8 >> 1) + 1);
    unsigned int v8 = *(_DWORD *)(a1 + 8);
  }
  uint64_t v9 = *(long long **)a1;
  if (*((char *)a2 + 23) < 0)
  {
    sub_25C7D059C(&v15, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v15 = *a2;
    uint64_t v16 = *((void *)a2 + 2);
  }
  uint64_t v10 = (char *)v9 + 40 * v8;
  uint64_t v11 = *a3;
  __int16 v12 = *a4;
  double result = *(double *)&v15;
  uint64_t v14 = v16;
  *(_OWORD *)uint64_t v10 = v15;
  *((void *)v10 + 2) = v14;
  *((void *)v10 + 3) = v11;
  *((_WORD *)v10 + 16) = v12;
  ++*(_DWORD *)(a1 + 8);
  return result;
}

CFIndex sub_25C7CF9BC(uint64_t a1, CFArrayRef theArray)
{
  v19[2] = *MEMORY[0x263EF8340];
  CFIndex result = CFArrayGetCount(theArray);
  if (result >= 1)
  {
    for (CFIndex i = 0; i < result; ++i)
    {
      if (CFArrayGetValueAtIndex(theArray, i))
      {
        uint64_t v6 = *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
        CFStringRef String = (const __CFString *)CEMEmojiTokenGetString();
        long long __p = 0;
        long long v18 = 0uLL;
        CFIndex Length = CFStringGetLength(String);
        sub_25C7D02B0((uint64_t)&__p, Length, 0);
        if (v18 >= 0) {
          p_p = (UniChar *)&__p;
        }
        else {
          p_p = (UniChar *)__p;
        }
        v20.location = 0;
        v20.length = Length;
        CFStringGetCharacters(String, v20, p_p);
        uint64_t v10 = *(void *)(a1 + 40);
        unsigned int v11 = *(_DWORD *)(v10 + 8);
        if (v11 == *(_DWORD *)(v10 + 12))
        {
          sub_25C7D241C(*(long long ***)(a1 + 40), v11 + (v11 >> 1) + 1);
          unsigned int v11 = *(_DWORD *)(v10 + 8);
        }
        uint64_t v12 = *(void *)v10 + 40 * v11;
        __int16 v13 = __p;
        v19[0] = v18;
        *(void *)((char *)v19 + 7) = *(void *)((char *)&v18 + 7);
        char v14 = HIBYTE(v18);
        long long v18 = 0uLL;
        long long __p = 0;
        __int16 v15 = *(_WORD *)(a1 + 48);
        *(void *)(v12 + 15) = *(void *)((char *)v19 + 7);
        uint64_t v16 = v19[0];
        *(void *)uint64_t v12 = v13;
        *(void *)(v12 + 8) = v16;
        *(unsigned char *)(v12 + 23) = v14;
        *(void *)(v12 + 24) = v6 | ((unint64_t)(v6 + 1) << 32);
        *(_WORD *)(v12 + 32) = v15;
        ++*(_DWORD *)(v10 + 8);
        if (SHIBYTE(v18) < 0) {
          operator delete(__p);
        }
      }
      CFIndex result = CFArrayGetCount(theArray);
    }
  }
  return result;
}

void sub_25C7CFB64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C7CFB88(uint64_t a1, unsigned __int16 **a2)
{
  uint64_t v3 = *a2;
  id v4 = a2[1];
  unint64_t v5 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v4 - (char *)v3) >> 3));
  if (v4 == v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }
  sub_25C7D10B4((unint64_t)v3, v4, (uint64_t)&v9, v6, 1);
  size_t v7 = sub_25C7D20A4(*a2, a2[1], (uint64_t)&v10);
  return sub_25C7CFC04((uint64_t)a2, (uint64_t)v7, (long long *)a2[1]);
}

uint64_t sub_25C7CFC04(uint64_t a1, uint64_t a2, long long *a3)
{
  if ((long long *)a2 != a3)
  {
    sub_25C7D220C((uint64_t)&v9, a3, *(long long **)(a1 + 8), a2);
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7 != v5)
    {
      do
      {
        if (*(char *)(v7 - 1) < 0) {
          operator delete(*(void **)(v7 - 24));
        }
        v7 -= 24;
      }
      while (v7 != v6);
    }
    *(void *)(a1 + 8) = v6;
  }
  return a2;
}

void sub_25C7CFC8C()
{
}

void sub_25C7CFCA0(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 4);
  uint64_t v4 = v3 - a3;
  if (v3 > a3)
  {
    uint64_t v7 = 48 * a3;
    do
    {
      sub_25C7CFD10(*(void *)(a1 + 8), *a2 + v7);
      v7 += 48;
      --v4;
    }
    while (v4);
  }
}

float sub_25C7CFD10(uint64_t a1, uint64_t a2)
{
  int v3 = *(char *)(a2 + 23);
  if (v3 >= 0) {
    uint64_t v4 = (skit::internal *)a2;
  }
  else {
    uint64_t v4 = *(skit::internal **)a2;
  }
  if (v3 >= 0) {
    uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  uint64_t v6 = *(void *)(a1 + 24);
  if (v5)
  {
    uint64_t v8 = *(__int16 *)(*(void *)(a1 + 8)
                    + 2
                    * (*(_DWORD *)(a1 + 16) & skit::internal::murmur3_32(v4, (const unsigned __int8 *)(2 * v5))));
    if ((v8 & 0x8000000000000000) == 0)
    {
      uint64_t v9 = *(void *)a1 + 24 * (int)v8;
      if (*(void *)(v9 + 8) == v5)
      {
        char v10 = *(unsigned __int16 **)v9;
        while (*(unsigned __int16 *)v4 == *v10)
        {
          ++v10;
          uint64_t v4 = (skit::internal *)((char *)v4 + 2);
          if (!--v5)
          {
            uint64_t v6 = *(void *)a1 + 24 * v8;
            break;
          }
        }
      }
    }
  }
  float result = *(float *)(v6 + 16) * *(float *)(a2 + 32);
  *(float *)(a2 + 32) = result;
  *(_WORD *)(a2 + 40) = (*(_WORD *)(a2 + 40) | *(_WORD *)(v6 + 20) & 4) & (*(_WORD *)(v6 + 20) | 0xFFFE);
  return result;
}

void sub_25C7CFDFC()
{
}

uint64_t sub_25C7CFE10(uint64_t result, void *a2, unint64_t a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 4);
  uint64_t v4 = v3 - a3;
  if (v3 > a3)
  {
    uint64_t v6 = result;
    uint64_t v7 = 48 * a3;
    do
    {
      float result = sub_25C7CFEE4(v6, (uint64_t *)(*a2 + v7));
      v7 += 48;
      --v4;
    }
    while (v4);
  }
  return result;
}

BOOL sub_25C7CFE80(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  return a3 == 1 && *a2 - 97 < 0x1A;
}

void sub_25C7CFEA8()
{
}

BOOL sub_25C7CFEC0(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  return a3 == 1 && *a2 - 97 < 0x1A;
}

uint64_t sub_25C7CFEE4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    uint64_t v4 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (uint64_t *)*a2;
    uint64_t v4 = v3;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 24))(a1, a2, v4);
  if (result)
  {
    *((_DWORD *)v2 + 8) = 1056964608;
    *((_WORD *)v2 + 20) |= 4u;
  }
  return result;
}

void sub_25C7CFF58()
{
}

uint64_t sub_25C7CFF6C(uint64_t result, void *a2, unint64_t a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(a2[1] - *a2) >> 4);
  uint64_t v4 = v3 - a3;
  if (v3 > a3)
  {
    uint64_t v6 = result;
    uint64_t v7 = 48 * a3;
    do
    {
      uint64_t result = sub_25C7D0080(v6, (uint64_t *)(*a2 + v7));
      v7 += 48;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t sub_25C7CFFDC(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a3 != 1) {
    return 0;
  }
  unsigned int v3 = *a2;
  uint64_t result = 1;
  if (v3 <= 0xD6)
  {
    if (v3 == 43 || v3 == 61) {
      return result;
    }
    return 0;
  }
  if (v3 != 215 && v3 != 247) {
    return 0;
  }
  return result;
}

void sub_25C7D0024()
{
}

uint64_t sub_25C7D003C(uint64_t a1, unsigned __int16 *a2, uint64_t a3)
{
  if (a3 != 1) {
    return 0;
  }
  unsigned int v3 = *a2;
  uint64_t result = 1;
  if (v3 <= 0xD6)
  {
    if (v3 == 43 || v3 == 61) {
      return result;
    }
    return 0;
  }
  if (v3 != 215 && v3 != 247) {
    return 0;
  }
  return result;
}

uint64_t sub_25C7D0080(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = a2[1];
  if (*((char *)a2 + 23) >= 0)
  {
    uint64_t v4 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = (uint64_t *)*a2;
    uint64_t v4 = v3;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(void *)a1 + 24))(a1, a2, v4);
  if (result)
  {
    *((_DWORD *)v2 + 8) = 1056964608;
    *((_WORD *)v2 + 20) |= 4u;
  }
  return result;
}

void sub_25C7D00F4()
{
}

void sub_25C7D010C(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_25C7D0168(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2654BB4F8, MEMORY[0x263F8C060]);
}

void sub_25C7D0154(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_25C7D0168(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void sub_25C7D019C()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_25C7D01D0(uint64_t *a1)
{
  if (*a1)
  {
    sub_25C7D020C(a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void sub_25C7D020C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 48)
  {
    if (*(char *)(i - 25) < 0) {
      operator delete(*(void **)(i - 48));
    }
  }
  a1[1] = v2;
}

void sub_25C7D025C(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_25C7D020C((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

uint64_t sub_25C7D02B0(uint64_t result, unint64_t a2, __int16 a3)
{
  if (*(char *)(result + 23) < 0)
  {
    unint64_t v3 = *(void *)(result + 8);
    if (v3 >= a2)
    {
      *(void *)(result + 8) = a2;
      uint64_t result = *(void *)result;
      goto LABEL_7;
    }
    return sub_25C7D02F4(result, a2 - v3, a3);
  }
  unint64_t v3 = *(unsigned __int8 *)(result + 23);
  if (v3 < a2) {
    return sub_25C7D02F4(result, a2 - v3, a3);
  }
  *(unsigned char *)(result + 23) = a2 & 0x7F;
LABEL_7:
  *(_WORD *)(result + 2 * a2) = 0;
  return result;
}

uint64_t sub_25C7D02F4(uint64_t a1, unint64_t a2, __int16 a3)
{
  if (a2)
  {
    LODWORD(v6) = *(char *)(a1 + 23);
    if ((v6 & 0x80000000) != 0)
    {
      uint64_t v7 = *(void *)(a1 + 8);
      unint64_t v9 = *(void *)(a1 + 16);
      unint64_t v8 = (v9 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      unint64_t v6 = HIBYTE(v9);
    }
    else
    {
      uint64_t v7 = *(unsigned __int8 *)(a1 + 23);
      unint64_t v8 = 10;
    }
    if (v8 - v7 < a2)
    {
      sub_25C7D03C4(a1, v8, a2 - v8 + v7, v7, v7, 0, 0);
      *(void *)(a1 + 8) = v7;
      LOBYTE(v6) = *(unsigned char *)(a1 + 23);
    }
    uint64_t v10 = a1;
    if ((v6 & 0x80) != 0) {
      uint64_t v10 = *(void *)a1;
    }
    unsigned int v11 = (_WORD *)(v10 + 2 * v7);
    unint64_t v12 = a2;
    do
    {
      *v11++ = a3;
      --v12;
    }
    while (v12);
    unint64_t v13 = v7 + a2;
    if (*(char *)(a1 + 23) < 0) {
      *(void *)(a1 + 8) = v13;
    }
    else {
      *(unsigned char *)(a1 + 23) = v13 & 0x7F;
    }
    *(_WORD *)(v10 + 2 * v13) = 0;
  }
  return a1;
}

void sub_25C7D03C4(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (0x7FFFFFFFFFFFFFF7 - a2 < a3) {
    sub_25C7D00F4();
  }
  unint64_t v13 = (char *)a1;
  if (*(char *)(a1 + 23) < 0) {
    unint64_t v13 = *(char **)a1;
  }
  unint64_t v14 = a3 + a2;
  if (a3 + a2 <= 2 * a2) {
    unint64_t v14 = 2 * a2;
  }
  uint64_t v15 = (v14 & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if ((v14 | 3) != 0xB) {
    uint64_t v15 = v14 | 3;
  }
  if (v14 >= 0xB) {
    uint64_t v16 = v15 + 1;
  }
  else {
    uint64_t v16 = 11;
  }
  if (a2 <= 0x3FFFFFFFFFFFFFF2) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = 0x7FFFFFFFFFFFFFF7;
  }
  long long v18 = (char *)sub_25C7D04E8(a1, v17);
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  if (a5) {
    memmove(v18, v13, 2 * a5);
  }
  if (a4 != a6 + a5) {
    memmove(&v19[2 * a5 + 2 * a7], &v13[2 * a5 + 2 * a6], 2 * (a4 - (a6 + a5)));
  }
  if (a2 != 10) {
    operator delete(v13);
  }
  *(void *)a1 = v19;
  *(void *)(a1 + 16) = v21 | 0x8000000000000000;
}

void *sub_25C7D04E8(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    sub_25C7D019C();
  }
  return operator new(2 * a2);
}

uint64_t sub_25C7D051C(uint64_t a1, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_25C7D059C(&v4, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    uint64_t v5 = *((void *)a2 + 2);
  }
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0x100003F800000;
  *(_WORD *)(a1 + 40) = 3;
  *(_DWORD *)(a1 + 44) = 0;
  return a1;
}

void *sub_25C7D059C(unsigned char *__dst, void *__src, unint64_t a3)
{
  uint64_t v5 = __dst;
  if (a3 > 0xA)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_25C7D00F4();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a3 | 3) != 0xB) {
      uint64_t v6 = a3 | 3;
    }
    uint64_t v7 = sub_25C7D04E8((uint64_t)__dst, v6 + 1);
    v5[1] = a3;
    v5[2] = v8 | 0x8000000000000000;
    *uint64_t v5 = v7;
    uint64_t v5 = v7;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, 2 * a3 + 2);
}

uint64_t sub_25C7D0640(uint64_t *a1, void *a2)
{
  uint64_t result = sub_25C7D0718((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void sub_25C7D06B8()
{
}

void *sub_25C7D06D0(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_25C7D019C();
  }
  return operator new(48 * a2);
}

uint64_t sub_25C7D0718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v16 = a6;
  *((void *)&v16 + 1) = a7;
  long long v15 = v16;
  v13[0] = a1;
  v13[1] = &v15;
  v13[2] = &v16;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 48);
      *(void *)(v9 - 32) = *(void *)(a3 - 32);
      *(_OWORD *)(v9 - 48) = v10;
      *(void *)(a3 - 40) = 0;
      *(void *)(a3 - 32) = 0;
      *(void *)(a3 - 48) = 0;
      long long v11 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v11;
      v9 -= 48;
      v7 -= 48;
      a3 -= 48;
    }
    while (a3 != a5);
    *((void *)&v16 + 1) = v9;
  }
  char v14 = 1;
  sub_25C7D07C8((uint64_t)v13);
  return a6;
}

uint64_t sub_25C7D07C8(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_25C7D0800(a1);
  }
  return a1;
}

void sub_25C7D0800(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 48;
  }
}

uint64_t sub_25C7D0848(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25C7D0880(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 6;
      *(void *)(a1 + 16) = v2 - 6;
      if (*((char *)v2 - 25) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void **sub_25C7D08D8(void **__dst, void *__src, unint64_t a3)
{
  LODWORD(v6) = *((char *)__dst + 23);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = (unint64_t)__dst[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < a3)
    {
      uint64_t v8 = (uint64_t)__dst[1];
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = *__dst;
  }
  else
  {
    uint64_t v7 = __dst;
    if (a3 > 0xA)
    {
      uint64_t v8 = *((unsigned __int8 *)__dst + 23);
      unint64_t v9 = 10;
LABEL_6:
      sub_25C7D0998((uint64_t)__dst, v9, a3 - v9, v8, 0, v8, a3, __src);
      return __dst;
    }
  }
  if (a3)
  {
    memmove(v7, __src, 2 * a3);
    LOBYTE(v6) = *((unsigned char *)__dst + 23);
  }
  if ((v6 & 0x80) != 0) {
    __dst[1] = (void *)a3;
  }
  else {
    *((unsigned char *)__dst + 23) = a3 & 0x7F;
  }
  *((_WORD *)v7 + a3) = 0;
  return __dst;
}

void sub_25C7D0998(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, const void *a8)
{
  if (0x7FFFFFFFFFFFFFF6 - a2 < a3) {
    sub_25C7D00F4();
  }
  long long v15 = (char *)a1;
  if (*(char *)(a1 + 23) < 0) {
    long long v15 = *(char **)a1;
  }
  unint64_t v16 = a3 + a2;
  if (a3 + a2 <= 2 * a2) {
    unint64_t v16 = 2 * a2;
  }
  uint64_t v17 = (v16 & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if ((v16 | 3) != 0xB) {
    uint64_t v17 = v16 | 3;
  }
  if (v16 >= 0xB) {
    uint64_t v18 = v17 + 1;
  }
  else {
    uint64_t v18 = 11;
  }
  if (a2 > 0x3FFFFFFFFFFFFFF2) {
    uint64_t v19 = 0x7FFFFFFFFFFFFFF7;
  }
  else {
    uint64_t v19 = v18;
  }
  uint64_t v20 = sub_25C7D04E8(a1, v19);
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  if (a5) {
    memmove(v20, v15, 2 * a5);
  }
  if (a7) {
    memmove(&v21[a5], a8, 2 * a7);
  }
  uint64_t v24 = a4 - (a6 + a5);
  if (v24) {
    memmove(&v21[a5 + a7], &v15[2 * a5 + 2 * a6], 2 * v24);
  }
  if (a2 != 10) {
    operator delete(v15);
  }
  uint64_t v25 = a7 + a5 + v24;
  *(void *)a1 = v21;
  *(void *)(a1 + 8) = v25;
  *(void *)(a1 + 16) = v23 | 0x8000000000000000;
  v21[v25] = 0;
}

void *sub_25C7D0AE0(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C7D00F4();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void *sub_25C7D0B94(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    sub_25C7D019C();
  }
  return operator new(24 * a1);
}

uint64_t sub_25C7D0BDC(uint64_t a1)
{
  unint64_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      size_t v4 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v4);
        size_t v4 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *sub_25C7D0C40(unsigned char *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      sub_25C7D00F4();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *size_t v5 = v8;
    size_t v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t sub_25C7D0CE0(uint64_t *a1, void *a2)
{
  uint64_t result = sub_25C7D0DA0((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_25C7D0D58(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_25C7D019C();
  }
  return operator new(24 * a2);
}

uint64_t sub_25C7D0DA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      long long v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 8) = 0;
      *(void *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }
  char v13 = 1;
  sub_25C7D0E40((uint64_t)v12);
  return a6;
}

uint64_t sub_25C7D0E40(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_25C7D0E78(a1);
  }
  return a1;
}

void sub_25C7D0E78(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 24;
  }
}

uint64_t sub_25C7D0EC0(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25C7D0EF8(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

void sub_25C7D0F50(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    size_t v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *sub_25C7D0FDC(uint64_t a1)
{
  if (a1 < 0) {
    sub_25C7D019C();
  }
  return operator new(2 * a1);
}

void sub_25C7D1010(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_25C7D1064((uint64_t *)v2);
    unint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_25C7D1064(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

void sub_25C7D10B4(unint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v104 = *MEMORY[0x263EF8340];
  while (2)
  {
    long long v11 = a2 - 12;
    v97 = a2 - 24;
    unint64_t v99 = (unint64_t)a2;
    unint64_t v12 = a2 - 36;
    unint64_t v13 = a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v13;
          uint64_t v14 = (uint64_t)a2 - v13;
          unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)a2 - v13) >> 3);
          if (v6 || !v5)
          {
            switch(v15)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                if ((sub_25C7D1E30(v11, (unsigned __int16 *)a1) & 0x80) != 0)
                {
                  long long v42 = *(_OWORD *)a1;
                  uint64_t v101 = *(void *)(a1 + 16);
                  long long v100 = v42;
                  long long v43 = *(_OWORD *)v11;
                  *(void *)(a1 + 16) = *((void *)v11 + 2);
                  *(_OWORD *)a1 = v43;
                  long long v44 = v100;
                  *((void *)v11 + 2) = v101;
                  *(_OWORD *)long long v11 = v44;
                }
                break;
              case 3uLL:
                sub_25C7D1B14((unsigned __int16 *)a1, (unsigned __int16 *)(a1 + 24), v11);
                break;
              case 4uLL:
                sub_25C7D1EC8(a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48), (long long *)v11);
                break;
              case 5uLL:
                sub_25C7D1F98(a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48), (long long *)(a1 + 72), (long long *)v11);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v14 <= 575)
          {
            v45 = (unsigned __int16 *)(a1 + 24);
            BOOL v47 = (unsigned __int16 *)a1 == a2 || v45 == a2;
            if (a5)
            {
              if (!v47)
              {
                uint64_t v48 = 0;
                unint64_t v49 = a1;
                do
                {
                  long long v50 = (unsigned __int16 *)v49;
                  unint64_t v49 = (unint64_t)v45;
                  if ((sub_25C7D1E30(v45, v50) & 0x80) != 0)
                  {
                    long long v51 = *(_OWORD *)v49;
                    uint64_t v101 = *(void *)(v49 + 16);
                    long long v100 = v51;
                    *(void *)(v49 + 8) = 0;
                    *(void *)(v49 + 16) = 0;
                    *(void *)unint64_t v49 = 0;
                    uint64_t v52 = v48;
                    while (1)
                    {
                      uint64_t v53 = a1 + v52;
                      *(_OWORD *)(v53 + 24) = *(_OWORD *)(a1 + v52);
                      *(void *)(v53 + 40) = *(void *)(a1 + v52 + 16);
                      *(unsigned char *)(v53 + 23) = 0;
                      *(_WORD *)uint64_t v53 = 0;
                      if (!v52) {
                        break;
                      }
                      v52 -= 24;
                      if ((sub_25C7D1E30((unsigned __int16 *)&v100, (unsigned __int16 *)(v52 + a1)) & 0x80) == 0)
                      {
                        uint64_t v54 = a1 + v52 + 24;
                        goto LABEL_87;
                      }
                    }
                    uint64_t v54 = a1;
LABEL_87:
                    long long v55 = v100;
                    *(void *)(v54 + 16) = v101;
                    *(_OWORD *)uint64_t v54 = v55;
                  }
                  v45 = (unsigned __int16 *)(v49 + 24);
                  v48 += 24;
                }
                while ((unsigned __int16 *)(v49 + 24) != a2);
              }
            }
            else if (!v47)
            {
              unint64_t v89 = a1 - 24;
              do
              {
                v90 = (unsigned __int16 *)a1;
                a1 = (unint64_t)v45;
                if ((sub_25C7D1E30(v45, v90) & 0x80) != 0)
                {
                  long long v91 = *(_OWORD *)a1;
                  uint64_t v101 = *(void *)(a1 + 16);
                  long long v100 = v91;
                  *(void *)(a1 + 8) = 0;
                  *(void *)(a1 + 16) = 0;
                  *(void *)a1 = 0;
                  unint64_t v92 = v89;
                  do
                  {
                    *(_OWORD *)(v92 + 48) = *(_OWORD *)(v92 + 24);
                    *(void *)(v92 + 64) = *(void *)(v92 + 40);
                    *(unsigned char *)(v92 + 47) = 0;
                    *(_WORD *)(v92 + 24) = 0;
                    char v93 = sub_25C7D1E30((unsigned __int16 *)&v100, (unsigned __int16 *)v92);
                    v92 -= 24;
                  }
                  while (v93 < 0);
                  long long v94 = v100;
                  *(void *)(v92 + 64) = v101;
                  *(_OWORD *)(v92 + 48) = v94;
                }
                v45 = (unsigned __int16 *)(a1 + 24);
                v89 += 24;
              }
              while ((unsigned __int16 *)(a1 + 24) != a2);
            }
            return;
          }
          if (!a4)
          {
            if ((unsigned __int16 *)a1 != a2)
            {
              int64_t v56 = (v15 - 2) >> 1;
              int64_t v57 = v56;
              do
              {
                int64_t v58 = v57;
                if (v56 >= v57)
                {
                  uint64_t v59 = (2 * v57) | 1;
                  unint64_t v60 = a1 + 24 * v59;
                  if (2 * v57 + 2 < (uint64_t)v15
                    && (sub_25C7D1E30((unsigned __int16 *)(a1 + 24 * v59), (unsigned __int16 *)(v60 + 24)) & 0x80u) != 0)
                  {
                    v60 += 24;
                    uint64_t v59 = 2 * v58 + 2;
                  }
                  unint64_t v61 = a1 + 24 * v58;
                  a2 = (unsigned __int16 *)v99;
                  if ((sub_25C7D1E30((unsigned __int16 *)v60, (unsigned __int16 *)v61) & 0x80) == 0)
                  {
                    long long v62 = *(_OWORD *)v61;
                    uint64_t v101 = *(void *)(v61 + 16);
                    long long v100 = v62;
                    *(void *)(v61 + 8) = 0;
                    *(void *)(v61 + 16) = 0;
                    *(void *)unint64_t v61 = 0;
                    do
                    {
                      unint64_t v63 = v60;
                      long long v64 = *(_OWORD *)v60;
                      *(void *)(v61 + 16) = *(void *)(v60 + 16);
                      *(_OWORD *)unint64_t v61 = v64;
                      *(unsigned char *)(v60 + 23) = 0;
                      *(_WORD *)unint64_t v60 = 0;
                      if (v56 < v59) {
                        break;
                      }
                      uint64_t v65 = (2 * v59) | 1;
                      unint64_t v60 = a1 + 24 * v65;
                      uint64_t v66 = 2 * v59 + 2;
                      if (v66 < (uint64_t)v15
                        && (sub_25C7D1E30((unsigned __int16 *)(a1 + 24 * v65), (unsigned __int16 *)(v60 + 24)) & 0x80u) != 0)
                      {
                        v60 += 24;
                        uint64_t v65 = v66;
                      }
                      unint64_t v61 = v63;
                      uint64_t v59 = v65;
                    }
                    while ((sub_25C7D1E30((unsigned __int16 *)v60, (unsigned __int16 *)&v100) & 0x80) == 0);
                    long long v67 = v100;
                    *(void *)(v63 + 16) = v101;
                    *(_OWORD *)unint64_t v63 = v67;
                    a2 = (unsigned __int16 *)v99;
                  }
                }
                int64_t v57 = v58 - 1;
              }
              while (v58);
              int64_t v68 = v14 / 0x18uLL;
              do
              {
                v69 = a2;
                uint64_t v70 = 0;
                uint64_t v96 = *(void *)a1;
                *(void *)&long long v102 = *(void *)(a1 + 8);
                *(void *)((char *)&v102 + 7) = *(void *)(a1 + 15);
                char v98 = *(unsigned char *)(a1 + 23);
                *(void *)(a1 + 8) = 0;
                *(void *)(a1 + 16) = 0;
                *(void *)a1 = 0;
                uint64_t v71 = v68 - 2;
                if (v68 < 2) {
                  uint64_t v71 = v68 - 1;
                }
                uint64_t v72 = v71 >> 1;
                unint64_t v73 = a1;
                do
                {
                  uint64_t v74 = v73 + 24 * v70 + 24;
                  uint64_t v75 = 2 * v70;
                  uint64_t v70 = (2 * v70) | 1;
                  uint64_t v76 = v75 + 2;
                  if (v75 + 2 < v68
                    && (sub_25C7D1E30((unsigned __int16 *)v74, (unsigned __int16 *)(v74 + 24)) & 0x80u) != 0)
                  {
                    v74 += 24;
                    uint64_t v70 = v76;
                  }
                  if (*(char *)(v73 + 23) < 0) {
                    operator delete(*(void **)v73);
                  }
                  long long v77 = *(_OWORD *)v74;
                  *(void *)(v73 + 16) = *(void *)(v74 + 16);
                  *(_OWORD *)unint64_t v73 = v77;
                  *(unsigned char *)(v74 + 23) = 0;
                  *(_WORD *)uint64_t v74 = 0;
                  unint64_t v73 = v74;
                }
                while (v70 <= v72);
                a2 = v69 - 12;
                if ((unsigned __int16 *)v74 == v69 - 12)
                {
                  *(void *)uint64_t v74 = v96;
                  uint64_t v87 = *(void *)((char *)&v102 + 7);
                  *(void *)(v74 + 8) = v102;
                  *(void *)(v74 + 15) = v87;
                  *(unsigned char *)(v74 + 23) = v98;
                }
                else
                {
                  long long v78 = *(_OWORD *)a2;
                  *(void *)(v74 + 16) = *((void *)v69 - 1);
                  *(_OWORD *)uint64_t v74 = v78;
                  *((void *)v69 - 3) = v96;
                  uint64_t v79 = v102;
                  *(void *)((char *)v69 - 9) = *(void *)((char *)&v102 + 7);
                  *((void *)v69 - 2) = v79;
                  *((unsigned char *)v69 - 1) = v98;
                  uint64_t v80 = v74 - a1 + 24;
                  if (v80 >= 25)
                  {
                    unint64_t v81 = (v80 / 0x18uLL - 2) >> 1;
                    unint64_t v82 = a1 + 24 * v81;
                    if ((sub_25C7D1E30((unsigned __int16 *)v82, (unsigned __int16 *)v74) & 0x80) != 0)
                    {
                      long long v83 = *(_OWORD *)v74;
                      uint64_t v101 = *(void *)(v74 + 16);
                      long long v100 = v83;
                      *(void *)(v74 + 8) = 0;
                      *(void *)(v74 + 16) = 0;
                      *(void *)uint64_t v74 = 0;
                      do
                      {
                        uint64_t v84 = v82;
                        long long v85 = *(_OWORD *)v82;
                        *(void *)(v74 + 16) = *(void *)(v82 + 16);
                        *(_OWORD *)uint64_t v74 = v85;
                        *(unsigned char *)(v82 + 23) = 0;
                        *(_WORD *)unint64_t v82 = 0;
                        if (!v81) {
                          break;
                        }
                        unint64_t v81 = (v81 - 1) >> 1;
                        unint64_t v82 = a1 + 24 * v81;
                        uint64_t v74 = v84;
                      }
                      while ((sub_25C7D1E30((unsigned __int16 *)v82, (unsigned __int16 *)&v100) & 0x80) != 0);
                      long long v86 = v100;
                      *(void *)(v84 + 16) = v101;
                      *(_OWORD *)uint64_t v84 = v86;
                      a2 = v69 - 12;
                    }
                  }
                }
              }
              while (v68-- > 2);
            }
            return;
          }
          unint64_t v16 = a1 + 24 * (v15 >> 1);
          if ((unint64_t)v14 >= 0xC01)
          {
            sub_25C7D1B14((unsigned __int16 *)a1, (unsigned __int16 *)(a1 + 24 * (v15 >> 1)), v11);
            sub_25C7D1B14((unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 24 * (v15 >> 1) - 24), v97);
            sub_25C7D1B14((unsigned __int16 *)(a1 + 48), (unsigned __int16 *)(a1 + 24 + 24 * (v15 >> 1)), v12);
            sub_25C7D1B14((unsigned __int16 *)(a1 + 24 * (v15 >> 1) - 24), (unsigned __int16 *)v16, (unsigned __int16 *)(a1 + 24 + 24 * (v15 >> 1)));
            long long v17 = *(_OWORD *)a1;
            uint64_t v101 = *(void *)(a1 + 16);
            long long v100 = v17;
            uint64_t v18 = *(void *)(v16 + 16);
            *(_OWORD *)a1 = *(_OWORD *)v16;
            *(void *)(a1 + 16) = v18;
            long long v19 = v100;
            *(void *)(v16 + 16) = v101;
            *(_OWORD *)unint64_t v16 = v19;
          }
          else
          {
            sub_25C7D1B14((unsigned __int16 *)(a1 + 24 * (v15 >> 1)), (unsigned __int16 *)a1, v11);
          }
          --a4;
          a2 = (unsigned __int16 *)v99;
          if ((a5 & 1) != 0 || (sub_25C7D1E30((unsigned __int16 *)(a1 - 24), (unsigned __int16 *)a1) & 0x80) != 0) {
            break;
          }
          long long v32 = *(_OWORD *)a1;
          uint64_t v103 = *(void *)(a1 + 16);
          long long v102 = v32;
          *(void *)(a1 + 8) = 0;
          *(void *)(a1 + 16) = 0;
          *(void *)a1 = 0;
          if ((sub_25C7D1E30((unsigned __int16 *)&v102, v11) & 0x80) != 0)
          {
            unint64_t v13 = a1;
            do
              v13 += 24;
            while ((sub_25C7D1E30((unsigned __int16 *)&v102, (unsigned __int16 *)v13) & 0x80) == 0);
          }
          else
          {
            BOOL v33 = (unsigned __int16 *)(a1 + 24);
            do
            {
              unint64_t v13 = (unint64_t)v33;
              if ((unint64_t)v33 >= v99) {
                break;
              }
              char v34 = sub_25C7D1E30((unsigned __int16 *)&v102, v33);
              BOOL v33 = (unsigned __int16 *)(v13 + 24);
            }
            while ((v34 & 0x80) == 0);
          }
          unint64_t v35 = v99;
          if (v13 < v99)
          {
            unint64_t v35 = v99;
            do
              v35 -= 24;
            while ((sub_25C7D1E30((unsigned __int16 *)&v102, (unsigned __int16 *)v35) & 0x80) != 0);
          }
          while (v13 < v35)
          {
            long long v36 = *(_OWORD *)v13;
            uint64_t v101 = *(void *)(v13 + 16);
            long long v100 = v36;
            long long v37 = *(_OWORD *)v35;
            *(void *)(v13 + 16) = *(void *)(v35 + 16);
            *(_OWORD *)unint64_t v13 = v37;
            long long v38 = v100;
            *(void *)(v35 + 16) = v101;
            *(_OWORD *)unint64_t v35 = v38;
            do
              v13 += 24;
            while ((sub_25C7D1E30((unsigned __int16 *)&v102, (unsigned __int16 *)v13) & 0x80) == 0);
            do
              v35 -= 24;
            while ((sub_25C7D1E30((unsigned __int16 *)&v102, (unsigned __int16 *)v35) & 0x80) != 0);
          }
          uint64_t v39 = (long long *)(v13 - 24);
          BOOL v5 = v13 - 24 >= a1;
          BOOL v6 = v13 - 24 == a1;
          if (v13 - 24 == a1)
          {
            if (*(char *)(v13 - 1) < 0) {
              operator delete(*(void **)a1);
            }
          }
          else
          {
            if (*(char *)(a1 + 23) < 0) {
              operator delete(*(void **)a1);
            }
            long long v40 = *v39;
            *(void *)(a1 + 16) = *(void *)(v13 - 8);
            *(_OWORD *)a1 = v40;
            *(unsigned char *)(v13 - 1) = 0;
            *(_WORD *)(v13 - 24) = 0;
          }
          a5 = 0;
          long long v41 = v102;
          *(void *)(v13 - 8) = v103;
          *uint64_t v39 = v41;
        }
        uint64_t v20 = 0;
        long long v21 = *(_OWORD *)a1;
        uint64_t v103 = *(void *)(a1 + 16);
        long long v102 = v21;
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)a1 = 0;
        do
          v20 += 24;
        while ((sub_25C7D1E30((unsigned __int16 *)(v20 + a1), (unsigned __int16 *)&v102) & 0x80) != 0);
        unint64_t v22 = a1 + v20;
        uint64_t v23 = (unsigned __int16 *)v99;
        if (v20 == 24)
        {
          uint64_t v23 = (unsigned __int16 *)v99;
          do
          {
            if (v22 >= (unint64_t)v23) {
              break;
            }
            v23 -= 12;
          }
          while ((sub_25C7D1E30(v23, (unsigned __int16 *)&v102) & 0x80) == 0);
        }
        else
        {
          do
            v23 -= 12;
          while ((sub_25C7D1E30(v23, (unsigned __int16 *)&v102) & 0x80) == 0);
        }
        unint64_t v13 = a1 + v20;
        if (v22 < (unint64_t)v23)
        {
          uint64_t v24 = v23;
          do
          {
            long long v25 = *(_OWORD *)v13;
            uint64_t v101 = *(void *)(v13 + 16);
            long long v100 = v25;
            long long v26 = *(_OWORD *)v24;
            *(void *)(v13 + 16) = *((void *)v24 + 2);
            *(_OWORD *)unint64_t v13 = v26;
            long long v27 = v100;
            *((void *)v24 + 2) = v101;
            *(_OWORD *)uint64_t v24 = v27;
            do
              v13 += 24;
            while ((sub_25C7D1E30((unsigned __int16 *)v13, (unsigned __int16 *)&v102) & 0x80) != 0);
            do
              v24 -= 12;
            while ((sub_25C7D1E30(v24, (unsigned __int16 *)&v102) & 0x80) == 0);
          }
          while (v13 < (unint64_t)v24);
        }
        uint64_t v28 = (long long *)(v13 - 24);
        if (v13 - 24 == a1)
        {
          if (*(char *)(v13 - 1) < 0) {
            operator delete(*(void **)a1);
          }
        }
        else
        {
          if (*(char *)(a1 + 23) < 0) {
            operator delete(*(void **)a1);
          }
          long long v29 = *v28;
          *(void *)(a1 + 16) = *(void *)(v13 - 8);
          *(_OWORD *)a1 = v29;
          *(unsigned char *)(v13 - 1) = 0;
          *(_WORD *)(v13 - 24) = 0;
        }
        long long v30 = v102;
        *(void *)(v13 - 8) = v103;
        *uint64_t v28 = v30;
        if (v22 >= (unint64_t)v23) {
          break;
        }
LABEL_35:
        sub_25C7D10B4(a1, v13 - 24, a3, a4, a5 & 1);
        a5 = 0;
      }
      BOOL v31 = sub_25C7D1C38(a1, v13 - 24);
      if (sub_25C7D1C38(v13, v99)) {
        break;
      }
      if (!v31) {
        goto LABEL_35;
      }
    }
    a2 = (unsigned __int16 *)(v13 - 24);
    if (!v31) {
      continue;
    }
    break;
  }
}

uint64_t sub_25C7D1B14(unsigned __int16 *a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  char v6 = sub_25C7D1E30(a2, a1);
  uint64_t result = sub_25C7D1E30(a3, a2);
  if (v6 < 0)
  {
    if ((char)result < 0)
    {
      uint64_t v17 = *((void *)a1 + 2);
      long long v18 = *(_OWORD *)a1;
      uint64_t v20 = *((void *)a3 + 2);
      *(_OWORD *)a1 = *(_OWORD *)a3;
      *((void *)a1 + 2) = v20;
    }
    else
    {
      uint64_t v14 = *((void *)a1 + 2);
      long long v15 = *(_OWORD *)a1;
      uint64_t v16 = *((void *)a2 + 2);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((void *)a1 + 2) = v16;
      *(_OWORD *)a2 = v15;
      *((void *)a2 + 2) = v14;
      uint64_t result = sub_25C7D1E30(a3, a2);
      if ((result & 0x80) == 0) {
        return result;
      }
      uint64_t v17 = *((void *)a2 + 2);
      long long v18 = *(_OWORD *)a2;
      uint64_t v19 = *((void *)a3 + 2);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((void *)a2 + 2) = v19;
    }
    *(_OWORD *)a3 = v18;
    *((void *)a3 + 2) = v17;
  }
  else if ((char)result < 0)
  {
    uint64_t v8 = *((void *)a2 + 2);
    long long v9 = *(_OWORD *)a2;
    uint64_t v10 = *((void *)a3 + 2);
    *(_OWORD *)a2 = *(_OWORD *)a3;
    *((void *)a2 + 2) = v10;
    *(_OWORD *)a3 = v9;
    *((void *)a3 + 2) = v8;
    uint64_t result = sub_25C7D1E30(a2, a1);
    if ((result & 0x80) != 0)
    {
      uint64_t v11 = *((void *)a1 + 2);
      long long v12 = *(_OWORD *)a1;
      uint64_t v13 = *((void *)a2 + 2);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((void *)a1 + 2) = v13;
      *(_OWORD *)a2 = v12;
      *((void *)a2 + 2) = v11;
    }
  }
  return result;
}

BOOL sub_25C7D1C38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      uint64_t v6 = a2 - 24;
      if ((sub_25C7D1E30((unsigned __int16 *)(a2 - 24), (unsigned __int16 *)a1) & 0x80) != 0)
      {
        uint64_t v7 = *(void *)(a1 + 16);
        long long v8 = *(_OWORD *)a1;
        uint64_t v9 = *(void *)(v6 + 16);
        *(_OWORD *)a1 = *(_OWORD *)v6;
        *(void *)(a1 + 16) = v9;
        *(_OWORD *)uint64_t v6 = v8;
        *(void *)(v6 + 16) = v7;
      }
      return 1;
    case 3uLL:
      sub_25C7D1B14((unsigned __int16 *)a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a2 - 24));
      return 1;
    case 4uLL:
      sub_25C7D1EC8(a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48), (long long *)(a2 - 24));
      return 1;
    case 5uLL:
      sub_25C7D1F98(a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48), (long long *)(a1 + 72), (long long *)(a2 - 24));
      return 1;
    default:
      uint64_t v10 = (unsigned __int16 *)(a1 + 48);
      sub_25C7D1B14((unsigned __int16 *)a1, (unsigned __int16 *)(a1 + 24), (unsigned __int16 *)(a1 + 48));
      uint64_t v11 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    if ((sub_25C7D1E30((unsigned __int16 *)v11, v10) & 0x80) != 0)
    {
      long long v17 = *(_OWORD *)v11;
      uint64_t v18 = *(void *)(v11 + 16);
      *(void *)(v11 + 8) = 0;
      *(void *)(v11 + 16) = 0;
      *(void *)uint64_t v11 = 0;
      uint64_t v14 = v12;
      while (1)
      {
        uint64_t v15 = a1 + v14;
        *(_OWORD *)(v15 + 72) = *(_OWORD *)(a1 + v14 + 48);
        *(void *)(v15 + 88) = *(void *)(a1 + v14 + 64);
        *(unsigned char *)(v15 + 71) = 0;
        *(_WORD *)(v15 + 48) = 0;
        if (v14 == -48) {
          break;
        }
        v14 -= 24;
        if ((sub_25C7D1E30((unsigned __int16 *)&v17, (unsigned __int16 *)(v15 + 24)) & 0x80) == 0)
        {
          uint64_t v16 = a1 + v14 + 72;
          goto LABEL_12;
        }
      }
      uint64_t v16 = a1;
LABEL_12:
      *(_OWORD *)uint64_t v16 = v17;
      *(void *)(v16 + 16) = v18;
      if (++v13 == 8) {
        return v11 + 24 == a2;
      }
    }
    uint64_t v10 = (unsigned __int16 *)v11;
    v12 += 24;
    v11 += 24;
    if (v11 == a2) {
      return 1;
    }
  }
}

uint64_t sub_25C7D1E30(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unint64_t v2 = *((unsigned __int8 *)a1 + 23);
  int v3 = (char)v2;
  if ((v2 & 0x80u) != 0) {
    unint64_t v2 = *((void *)a1 + 1);
  }
  unint64_t v4 = *((unsigned __int8 *)a2 + 23);
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    unint64_t v4 = *((void *)a2 + 1);
  }
  if (v4 >= v2) {
    unint64_t v6 = v2;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v6)
  {
    if (v5 >= 0) {
      uint64_t v7 = a2;
    }
    else {
      uint64_t v7 = *(unsigned __int16 **)a2;
    }
    if (v3 >= 0) {
      long long v8 = a1;
    }
    else {
      long long v8 = *(unsigned __int16 **)a1;
    }
    do
    {
      unsigned int v9 = *v8;
      unsigned int v10 = *v7;
      if (v9 < v10) {
        return 255;
      }
      if (v10 < v9) {
        return 1;
      }
      ++v8;
      ++v7;
    }
    while (--v6);
  }
  if (v2 == v4) {
    return 0;
  }
  if (v2 < v4) {
    return 255;
  }
  return 1;
}

__n128 sub_25C7D1EC8(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, long long *a4)
{
  sub_25C7D1B14((unsigned __int16 *)a1, a2, a3);
  if ((sub_25C7D1E30((unsigned __int16 *)a4, a3) & 0x80) != 0)
  {
    uint64_t v9 = *((void *)a3 + 2);
    long long v10 = *(_OWORD *)a3;
    uint64_t v11 = *((void *)a4 + 2);
    *(_OWORD *)a3 = *a4;
    *((void *)a3 + 2) = v11;
    *a4 = v10;
    *((void *)a4 + 2) = v9;
    if ((sub_25C7D1E30(a3, a2) & 0x80) != 0)
    {
      uint64_t v12 = *((void *)a2 + 2);
      long long v13 = *(_OWORD *)a2;
      uint64_t v14 = *((void *)a3 + 2);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *((void *)a2 + 2) = v14;
      *(_OWORD *)a3 = v13;
      *((void *)a3 + 2) = v12;
      if ((sub_25C7D1E30(a2, (unsigned __int16 *)a1) & 0x80) != 0)
      {
        uint64_t v15 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v16 = *((void *)a2 + 2);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v16;
        *(__n128 *)a2 = result;
        *((void *)a2 + 2) = v15;
      }
    }
  }
  return result;
}

__n128 sub_25C7D1F98(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, long long *a4, long long *a5)
{
  sub_25C7D1EC8(a1, a2, a3, a4);
  if ((sub_25C7D1E30((unsigned __int16 *)a5, (unsigned __int16 *)a4) & 0x80) != 0)
  {
    uint64_t v11 = *((void *)a4 + 2);
    long long v12 = *a4;
    uint64_t v13 = *((void *)a5 + 2);
    *a4 = *a5;
    *((void *)a4 + 2) = v13;
    *a5 = v12;
    *((void *)a5 + 2) = v11;
    if ((sub_25C7D1E30((unsigned __int16 *)a4, a3) & 0x80) != 0)
    {
      uint64_t v14 = *((void *)a3 + 2);
      long long v15 = *(_OWORD *)a3;
      uint64_t v16 = *((void *)a4 + 2);
      *(_OWORD *)a3 = *a4;
      *((void *)a3 + 2) = v16;
      *a4 = v15;
      *((void *)a4 + 2) = v14;
      if ((sub_25C7D1E30(a3, a2) & 0x80) != 0)
      {
        uint64_t v17 = *((void *)a2 + 2);
        long long v18 = *(_OWORD *)a2;
        uint64_t v19 = *((void *)a3 + 2);
        *(_OWORD *)a2 = *(_OWORD *)a3;
        *((void *)a2 + 2) = v19;
        *(_OWORD *)a3 = v18;
        *((void *)a3 + 2) = v17;
        if ((sub_25C7D1E30(a2, (unsigned __int16 *)a1) & 0x80) != 0)
        {
          uint64_t v20 = *(void *)(a1 + 16);
          __n128 result = *(__n128 *)a1;
          uint64_t v21 = *((void *)a2 + 2);
          *(_OWORD *)a1 = *(_OWORD *)a2;
          *(void *)(a1 + 16) = v21;
          *(__n128 *)a2 = result;
          *((void *)a2 + 2) = v20;
        }
      }
    }
  }
  return result;
}

void **sub_25C7D20A4(unsigned __int16 *a1, unsigned __int16 *a2, uint64_t a3)
{
  __n128 result = (void **)a2;
  if (a1 != a2)
  {
    do
    {
      uint64_t v7 = a1 + 12;
      if (a1 + 12 == a2) {
        return (void **)a2;
      }
      BOOL v8 = sub_25C7D2188(a3, a1, a1 + 12);
      a1 = v7;
    }
    while (!v8);
    uint64_t v9 = v7 + 12;
    long long v10 = v7 - 12;
    if (v9 == a2)
    {
      uint64_t v11 = (void **)v10;
    }
    else
    {
      do
      {
        if (sub_25C7D2188(a3, v10, v9))
        {
          uint64_t v11 = (void **)v10;
        }
        else
        {
          uint64_t v11 = (void **)(v10 + 12);
          if (*((char *)v10 + 47) < 0) {
            operator delete(*v11);
          }
          long long v12 = *(_OWORD *)v9;
          *((void *)v10 + 5) = *((void *)v9 + 2);
          *(_OWORD *)uint64_t v11 = v12;
          *((unsigned char *)v9 + 23) = 0;
          *uint64_t v9 = 0;
          v10 += 12;
        }
        v9 += 12;
      }
      while (v9 != a2);
    }
    return v11 + 3;
  }
  return result;
}

BOOL sub_25C7D2188(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  int v3 = *((char *)a2 + 23);
  uint64_t v4 = *((void *)a2 + 1);
  if (v3 >= 0) {
    uint64_t v4 = *((unsigned __int8 *)a2 + 23);
  }
  uint64_t v5 = *((unsigned __int8 *)a3 + 23);
  int v6 = (char)v5;
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *((void *)a3 + 1);
  }
  if (v4 != v5) {
    return 0;
  }
  if (!v4) {
    return 1;
  }
  if (v3 >= 0) {
    uint64_t v7 = a2;
  }
  else {
    uint64_t v7 = *(unsigned __int16 **)a2;
  }
  if (v6 >= 0) {
    BOOL v8 = a3;
  }
  else {
    BOOL v8 = *(unsigned __int16 **)a3;
  }
  uint64_t v9 = v4 - 1;
  do
  {
    int v11 = *v7++;
    int v10 = v11;
    int v13 = *v8++;
    int v12 = v13;
    BOOL v15 = v9-- != 0;
    BOOL result = v12 == v10;
  }
  while (v12 == v10 && v15);
  return result;
}

long long *sub_25C7D220C(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(char *)(a4 + 23) < 0) {
        operator delete(*(void **)a4);
      }
      long long v7 = *v5;
      *(void *)(a4 + 16) = *((void *)v5 + 2);
      *(_OWORD *)a4 = v7;
      a4 += 24;
      *((unsigned char *)v5 + 23) = 0;
      *(_WORD *)uint64_t v5 = 0;
      uint64_t v5 = (long long *)((char *)v5 + 24);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void sub_25C7D2280(std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void sub_25C7D22F4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709DF0E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25C7D2314(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709DF0E0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x261194470);
}

uint64_t sub_25C7D2368(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 8))();
}

uint64_t *sub_25C7D2390(uint64_t *a1)
{
  if ((uint64_t *)*a1 != a1 + 2) {
    free((void *)*a1);
  }
  return a1;
}

void sub_25C7D23D0(uint64_t *a1)
{
  uint64_t v1 = *((unsigned int *)a1 + 2);
  if (v1)
  {
    uint64_t v2 = *a1;
    uint64_t v3 = 40 * v1;
    do
    {
      if (*(char *)(v2 + 23) < 0) {
        operator delete(*(void **)v2);
      }
      v2 += 40;
      v3 -= 40;
    }
    while (v3);
  }
}

size_t sub_25C7D241C(long long **a1, unsigned int a2)
{
  uint64_t v3 = (long long *)malloc_type_malloc(40 * a2, 0x10120408116F198uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v14 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v14, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  uint64_t v4 = v3;
  uint64_t v5 = *a1;
  uint64_t v6 = *((unsigned int *)a1 + 2);
  if (v6)
  {
    long long v7 = v3;
    BOOL v8 = *a1;
    do
    {
      long long v9 = *v8;
      *((void *)v7 + 2) = *((void *)v8 + 2);
      long long *v7 = v9;
      *((void *)v8 + 1) = 0;
      *((void *)v8 + 2) = 0;
      *(void *)BOOL v8 = 0;
      uint64_t v10 = *((void *)v8 + 3);
      *((_WORD *)v7 + 16) = *((_WORD *)v8 + 16);
      *((void *)v7 + 3) = v10;
      BOOL v8 = (long long *)((char *)v8 + 40);
      long long v7 = (long long *)((char *)v7 + 40);
    }
    while (v8 != (long long *)((char *)v5 + 40 * v6));
    uint64_t v11 = 40 * v6;
    do
    {
      if (*((char *)v5 + 23) < 0) {
        operator delete(*(void **)v5);
      }
      uint64_t v5 = (long long *)((char *)v5 + 40);
      v11 -= 40;
    }
    while (v11);
    uint64_t v5 = *a1;
  }
  if (v5 != (long long *)(a1 + 2)) {
    free(v5);
  }
  *a1 = v4;
  size_t result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x28;
  return result;
}

BOOL sub_25C7D2540(uint64_t *a1, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = *a2;
  if (v3 < 2) {
    return 0;
  }
  uint64_t v6 = v3 - 2;
  sub_25C7D264C(a1, *((unsigned __int16 *)a2 + 2));
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  BOOL v9 = v7 == v8;
  if (v3 >= 0xA && v7 != v8)
  {
    uint64_t v11 = (unsigned __int16 *)a2 + 3;
    uint64_t v12 = v7 + 48;
    unint64_t v13 = v6;
    while (1)
    {
      uint64_t v14 = *v11;
      uint64_t v15 = v11[1];
      *(void *)(v12 - 24) = v14 | (v15 << 32);
      if (v14 > v15) {
        break;
      }
      uint64_t v16 = 2 * (v15 - v14);
      uint64_t v6 = v13 - (v16 + 8);
      if (v13 < v16 + 8) {
        break;
      }
      sub_25C7D08D8((void **)(v12 - 48), v11 + 2, (v15 - v14));
      _H0 = v11[(unint64_t)v16 / 2 + 2];
      __asm { FCVT            S0, H0 }
      *(_DWORD *)(v12 - 16) = _S0;
      *(_WORD *)(v12 - 8) = v11[(unint64_t)v16 / 2 + 3];
      BOOL v9 = v12 == v8;
      if (v12 != v8)
      {
        uint64_t v11 = (unsigned __int16 *)((char *)v11 + v16 + 8);
        v12 += 48;
        unint64_t v13 = v6;
        if (v6 > 7) {
          continue;
        }
      }
      return !v6 && v9;
    }
    BOOL v9 = 0;
    uint64_t v6 = v13;
  }
  return !v6 && v9;
}

void sub_25C7D264C(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 4);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    sub_25C7D3414(a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *a1 + 48 * a2;
    while (v3 != v7)
    {
      if (*(char *)(v3 - 25) < 0) {
        operator delete(*(void **)(v3 - 48));
      }
      v3 -= 48;
    }
    a1[1] = v7;
  }
}

uint64_t sub_25C7D26EC(unint64_t a1, unsigned __int16 a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3) {
    goto LABEL_15;
  }
  uint64_t v7 = *a3;
  uint64_t v8 = a3[1];
  if (*a3 != v8)
  {
    uint64_t v9 = 2;
    do
    {
      uint64_t v10 = *(unsigned __int8 *)(v7 + 23);
      if ((v10 & 0x80u) != 0) {
        uint64_t v10 = *(void *)(v7 + 8);
      }
      v9 += 2 * v10 + 18;
      v7 += 48;
    }
    while (v7 != v8);
    if (!v9)
    {
LABEL_15:
      unsigned int v14 = 0;
      if (!a4) {
        goto LABEL_55;
      }
      goto LABEL_16;
    }
  }
  sub_25C7D2AD8(&v53, a3);
  uint64_t v11 = v53;
  if (v54 == v53) {
    uint64_t v12 = &unk_26A5D7088;
  }
  else {
    uint64_t v12 = v53;
  }
  unsigned int v13 = sub_25C7D4168(a1, v12, v54 - v53);
  if (v11) {
    operator delete(v11);
  }
  unsigned int v14 = v13;
  if (v4)
  {
LABEL_16:
    uint64_t v15 = *(void *)(v4 + 8) - *(void *)v4;
    unsigned __int16 v49 = a2;
    unsigned int v48 = v14;
    if (v15)
    {
      if (v15 < 0) {
        sub_25C7D06B8();
      }
      uint64_t v16 = (char *)sub_25C7D3588(v15 >> 5);
      long long v18 = v16;
      uint64_t v19 = *(void *)v4;
      uint64_t v50 = *(void *)(v4 + 8);
      if (*(void *)v4 == v50)
      {
        BOOL v31 = v16;
      }
      else
      {
        uint64_t v20 = &v16[4 * v17];
        uint64_t v21 = v16;
        do
        {
          uint64_t v53 = 0;
          uint64_t v54 = 0;
          uint64_t v55 = 0;
          sub_25C7D35C0((char *)&v53, *(long long **)v19, *(long long **)(v19 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v19 + 8) - *(void *)v19) >> 4));
          unsigned __int16 v56 = *(_WORD *)(v19 + 24);
          sub_25C7D2AD8(&v51, (uint64_t *)&v53);
          unint64_t v22 = v51;
          if (v52 == v51) {
            uint64_t v23 = (void **)&unk_26A5D7088;
          }
          else {
            uint64_t v23 = v51;
          }
          unsigned int v24 = sub_25C7D4168(a1, v23, (char *)v52 - (char *)v51);
          int v25 = v56;
          sub_25C7D37F0(a1);
          unsigned int v26 = v24;
          *(unsigned char *)(a1 + 70) = 1;
          int v27 = *(_DWORD *)(a1 + 32);
          int v28 = *(_DWORD *)(a1 + 48);
          int v29 = *(_DWORD *)(a1 + 40);
          sub_25C7D3854((_DWORD *)a1, 4, v26);
          sub_25C7D3DDC(a1, 6, v25);
          int v30 = sub_25C7D3E90(a1, v27 - v28 + v29);
          if (v22) {
            operator delete(v22);
          }
          if (v21 >= v20)
          {
            uint64_t v32 = (v21 - v18) >> 2;
            unint64_t v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 62) {
              sub_25C7D06B8();
            }
            if ((v20 - v18) >> 1 > v33) {
              unint64_t v33 = (v20 - v18) >> 1;
            }
            if ((unint64_t)(v20 - v18) >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v34 = v33;
            }
            if (v34) {
              unint64_t v34 = (unint64_t)sub_25C7D3588(v34);
            }
            else {
              uint64_t v35 = 0;
            }
            long long v36 = (char *)(v34 + 4 * v32);
            *(_DWORD *)long long v36 = v30;
            BOOL v31 = v36 + 4;
            while (v21 != v18)
            {
              int v37 = *((_DWORD *)v21 - 1);
              v21 -= 4;
              *((_DWORD *)v36 - 1) = v37;
              v36 -= 4;
            }
            uint64_t v20 = (char *)(v34 + 4 * v35);
            if (v18) {
              operator delete(v18);
            }
            long long v18 = v36;
          }
          else
          {
            *(_DWORD *)uint64_t v21 = v30;
            BOOL v31 = v21 + 4;
          }
          long long v51 = (void **)&v53;
          sub_25C7D025C(&v51);
          v19 += 32;
          uint64_t v21 = v31;
        }
        while (v19 != v50);
      }
    }
    else
    {
      long long v18 = 0;
      BOOL v31 = 0;
    }
    uint64_t v38 = v31 - v18;
    if (v31 == v18) {
      uint64_t v39 = (char *)&unk_25C82675C;
    }
    else {
      uint64_t v39 = v18;
    }
    uint64_t v4 = v38 >> 2;
    sub_25C7D41E4(a1, v38 >> 2, 4uLL);
    if (v18 != v31)
    {
      long long v40 = v39 - 4;
      uint64_t v41 = v4;
      do
      {
        int v42 = sub_25C7D3930((_DWORD *)a1, *(_DWORD *)&v40[4 * v41]);
        sub_25C7D39A0(a1, v42);
        --v41;
      }
      while (v41);
    }
    LODWORD(v4) = sub_25C7D4250(a1, v4);
    if (v18) {
      operator delete(v18);
    }
    a2 = v49;
    unsigned int v14 = v48;
  }
LABEL_55:
  sub_25C7D37F0(a1);
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v44 = *(void *)(a1 + 40);
  uint64_t v43 = *(void *)(a1 + 48);
  uint64_t v45 = *(void *)(a1 + 32);
  if (v4)
  {
    int v46 = sub_25C7D3930((_DWORD *)a1, v4);
    sub_25C7D38A4(a1, 8, v46);
  }
  sub_25C7D3854((_DWORD *)a1, 6, v14);
  sub_25C7D3DDC(a1, 4, a2);
  return sub_25C7D3E90(a1, (int)v45 - (int)v43 + (int)v44);
}

void sub_25C7D2A74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (v15) {
    operator delete(v15);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C7D2AD8(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  size_t v5 = 2;
  if (*a2 != v4)
  {
    uint64_t v6 = *a2;
    do
    {
      uint64_t v7 = *(unsigned __int8 *)(v6 + 23);
      if ((v7 & 0x80u) != 0) {
        uint64_t v7 = *(void *)(v6 + 8);
      }
      v5 += 2 * v7 + 8;
      v6 += 48;
    }
    while (v6 != v4);
    if (v5 <= 1)
    {
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
      return;
    }
    if ((v5 & 0x8000000000000000) != 0) {
      sub_25C7D06B8();
    }
  }
  uint64_t v8 = operator new(v5);
  bzero(v8, v5);
  *uint64_t v8 = -21845 * ((v4 - v3) >> 4);
  uint64_t v9 = v5 - 2;
  if (v4 == v3)
  {
LABEL_25:
    if (!v9)
    {
      *a1 = v8;
      a1[1] = (char *)v8 + v5;
      a1[2] = (char *)v8 + v5;
      return;
    }
  }
  else
  {
    uint64_t v10 = v8 + 1;
    while (1)
    {
      uint64_t v11 = *(unsigned __int8 *)(v3 + 23);
      int v12 = (char)v11;
      if ((v11 & 0x80u) != 0) {
        uint64_t v11 = *(void *)(v3 + 8);
      }
      uint64_t v13 = v11;
      uint64_t v14 = 2 * v11 + 8;
      BOOL v15 = v9 < v14;
      v9 -= v14;
      if (v15) {
        break;
      }
      *uint64_t v10 = *(_DWORD *)(v3 + 24);
      v10[1] = *(_DWORD *)(v3 + 28);
      uint64_t v16 = v12 >= 0 ? (const void *)v3 : *(const void **)v3;
      memcpy(v10 + 2, v16, 2 * v11);
      float v17 = *(float *)(v3 + 32);
      float v18 = v17 <= 65504.0 ? *(float *)(v3 + 32) : 65504.0;
      _S0 = v17 >= -65504.0 ? v18 : -65504.0;
      __asm { FCVT            H0, S0 }
      int v25 = &v10[v13];
      v25[2] = _H0;
      v25[3] = *(_WORD *)(v3 + 40);
      if (v14 < 1) {
        break;
      }
      uint64_t v10 = (_WORD *)((char *)v10 + v14);
      v3 += 48;
      if (v3 == v4) {
        goto LABEL_25;
      }
    }
  }
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  operator delete(v8);
}

uint64_t sub_25C7D2CB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = (const void *)objc_msgSend_bytes(v3, v4, v5, v6);
  size_t v11 = objc_msgSend_length(v3, v8, v9, v10);
  size_t v12 = v11;
  if (v11)
  {
    if ((v11 & 0x8000000000000000) != 0) {
      sub_25C7D06B8();
    }
    uint64_t v13 = operator new(v11);
    memcpy(v13, v7, v12);
    uint64_t v14 = v13;
  }
  else
  {
    uint64_t v14 = 0;
    uint64_t v13 = &unk_26A5D7088;
  }
  uint64_t v15 = sub_25C7D4168(a1, v13, v12);
  if (v14) {
    operator delete(v14);
  }

  return v15;
}

void sub_25C7D2D64(_Unwind_Exception *a1)
{
  if (v2) {
    operator delete(v2);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_25C7D2D88(unint64_t a1, int a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v90 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  unint64_t v82 = v9;
  uint64_t v14 = objc_msgSend_data(v9, v11, v12, v13);
  unsigned int v78 = sub_25C7D2CB0(a1, v14);

  if (v10)
  {
    unint64_t v18 = objc_msgSend_count(v10, v15, v16, v17);
    if (v18)
    {
      if (v18 >> 62) {
        sub_25C7D06B8();
      }
      uint64_t v19 = (char *)sub_25C7D3588(v18);
      uint64_t v21 = &v19[4 * v20];
    }
    else
    {
      uint64_t v19 = 0;
      uint64_t v21 = 0;
    }
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id obj = v10;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v85, (uint64_t)v89, 16);
    if (v26)
    {
      uint64_t v84 = *(void *)v86;
      int v27 = v19;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v86 != v84) {
            objc_enumerationMutation(obj);
          }
          int v29 = objc_msgSend_data(*(void **)(*((void *)&v85 + 1) + 8 * i), v23, v24, v25);
          unsigned int v30 = sub_25C7D2CB0(a1, v29);

          id v31 = v10;
          sub_25C7D37F0(a1);
          unsigned int v32 = v30;
          *(unsigned char *)(a1 + 70) = 1;
          uint64_t v33 = *(void *)(a1 + 40);
          uint64_t v34 = *(void *)(a1 + 48);
          uint64_t v35 = *(void *)(a1 + 32);
          sub_25C7D3854((_DWORD *)a1, 4, v32);
          int v36 = sub_25C7D3E90(a1, (int)v35 - (int)v34 + (int)v33);
          int v37 = v36;
          if (v27 >= v21)
          {
            uint64_t v38 = (v27 - v19) >> 2;
            unint64_t v39 = v38 + 1;
            if ((unint64_t)(v38 + 1) >> 62) {
              sub_25C7D06B8();
            }
            if ((v21 - v19) >> 1 > v39) {
              unint64_t v39 = (v21 - v19) >> 1;
            }
            if ((unint64_t)(v21 - v19) >= 0x7FFFFFFFFFFFFFFCLL) {
              unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v40 = v39;
            }
            if (v40) {
              unint64_t v40 = (unint64_t)sub_25C7D3588(v40);
            }
            else {
              uint64_t v23 = 0;
            }
            uint64_t v41 = (char *)(v40 + 4 * v38);
            *(_DWORD *)uint64_t v41 = v37;
            int v42 = v41 + 4;
            while (v27 != v19)
            {
              int v43 = *((_DWORD *)v27 - 1);
              v27 -= 4;
              *((_DWORD *)v41 - 1) = v43;
              v41 -= 4;
            }
            uint64_t v21 = (char *)(v40 + 4 * (void)v23);
            if (v19) {
              operator delete(v19);
            }
            uint64_t v19 = v41;
            int v27 = v42;
          }
          else
          {
            *(_DWORD *)int v27 = v36;
            v27 += 4;
          }
          id v10 = v31;
        }
        uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v23, (uint64_t)&v85, (uint64_t)v89, 16);
      }
      while (v26);

      if (v19 != v27)
      {
        sub_25C7D41E4(a1, (v27 - v19) >> 2, 4uLL);
        uint64_t v44 = ((v27 - v19) >> 2) - 1;
        do
        {
          int v45 = sub_25C7D3930((_DWORD *)a1, *(_DWORD *)&v19[4 * v44]);
          sub_25C7D39A0(a1, v45);
          --v44;
        }
        while (v44 != -1);
        unsigned int v46 = sub_25C7D4250(a1, (v27 - v19) >> 2);
        goto LABEL_37;
      }
    }
    else
    {
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  unsigned int v46 = 0;
LABEL_37:
  uint64_t v48 = *a7;
  uint64_t v47 = a7[1];
  if (*a7 == v47)
  {
    unsigned int v53 = 0;
  }
  else
  {
    uint64_t v49 = (v47 - v48) >> 2;
    sub_25C7D41E4(a1, v49, 4uLL);
    uint64_t v50 = v48 - 4;
    uint64_t v51 = v49;
    do
    {
      int v52 = sub_25C7D3930((_DWORD *)a1, *(_DWORD *)(v50 + 4 * v51));
      sub_25C7D39A0(a1, v52);
      --v51;
    }
    while (v51);
    unsigned int v53 = sub_25C7D4250(a1, v49);
  }
  unint64_t v54 = *(void *)(a5 + 8);
  if (v54) {
    unsigned int v55 = sub_25C7D3370(a1, *(const void **)a5, v54);
  }
  else {
    unsigned int v55 = 0;
  }
  unint64_t v56 = *(void *)(a6 + 8);
  if (v56)
  {
    unsigned int v57 = sub_25C7D3370(a1, *(const void **)a6, v56);
    int64_t v58 = v10;
  }
  else
  {
    int64_t v58 = v10;
    unsigned int v57 = 0;
  }
  sub_25C7D37F0(a1);
  unsigned int v59 = v57;
  *(unsigned char *)(a1 + 70) = 1;
  int v60 = *(_DWORD *)(a1 + 32);
  int v61 = *(_DWORD *)(a1 + 48);
  int v62 = *(_DWORD *)(a1 + 40);
  sub_25C7D3854((_DWORD *)a1, 12, v59);
  sub_25C7D3854((_DWORD *)a1, 10, v55);
  if (v46)
  {
    int v63 = sub_25C7D3930((_DWORD *)a1, v46);
    sub_25C7D38A4(a1, 8, v63);
  }
  sub_25C7D3854((_DWORD *)a1, 6, v78);
  sub_25C7D3DDC(a1, 4, a2);
  unsigned int v64 = sub_25C7D3E90(a1, v60 - v61 + v62);
  sub_25C7D37F0(a1);
  *(unsigned char *)(a1 + 70) = 1;
  int v65 = *(_DWORD *)(a1 + 32);
  int v66 = *(_DWORD *)(a1 + 48);
  int v67 = *(_DWORD *)(a1 + 40);
  if (v64)
  {
    int v68 = sub_25C7D3930((_DWORD *)a1, v64);
    sub_25C7D38A4(a1, 8, v68);
  }
  if (v53)
  {
    int v69 = sub_25C7D3930((_DWORD *)a1, v53);
    sub_25C7D38A4(a1, 6, v69);
  }
  sub_25C7D39F8(a1, 1uLL);
  uint64_t v70 = (unsigned char *)(*(void *)(a1 + 48) - sub_25C7D3A7C(a1, 1uLL));
  *(void *)(a1 + 48) = v70;
  *uint64_t v70 = 1;
  uint64_t v71 = *(void *)(a1 + 40);
  uint64_t v72 = *(void *)(a1 + 48);
  uint64_t v73 = *(void *)(a1 + 32);
  sub_25C7D3A7C(a1, 8uLL);
  **(void **)(a1 + 56) = (v73 - v72 + v71) | 0x400000000;
  *(void *)(a1 + 56) += 8;
  ++*(_DWORD *)(a1 + 64);
  unsigned int v74 = *(unsigned __int16 *)(a1 + 68);
  if (v74 <= 4) {
    LOWORD(v74) = 4;
  }
  *(_WORD *)(a1 + 68) = v74;
  uint64_t v75 = sub_25C7D3E90(a1, v65 - v66 + v67);
  if (v19) {
    operator delete(v19);
  }

  return v75;
}

void sub_25C7D32D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (v16) {
    operator delete(v16);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_25C7D3370(uint64_t a1, const void *a2, unint64_t a3)
{
  sub_25C7D37F0(a1);
  sub_25C7D4130(a1, a3 + 1, 4uLL);
  uint64_t v6 = (unsigned char *)(*(void *)(a1 + 48) - sub_25C7D3A7C(a1, 1uLL));
  *(void *)(a1 + 48) = v6;
  *uint64_t v6 = 0;
  uint64_t v7 = (void *)(*(void *)(a1 + 48) - sub_25C7D3A7C(a1, a3));
  *(void *)(a1 + 48) = v7;
  memcpy(v7, a2, a3);
  sub_25C7D39A0(a1, a3);
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

uint64_t sub_25C7D3414(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(result - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 4) >= a2)
  {
    if (a2)
    {
      uint64_t v13 = v7 + 48 * a2;
      do
      {
        *(_OWORD *)(v7 + 16) = 0uLL;
        *(_OWORD *)(v7 + 32) = 0uLL;
        *(_OWORD *)uint64_t v7 = 0uLL;
        *(_DWORD *)(v7 + 32) = 1065353216;
        *(_DWORD *)(v7 + 38) = 196609;
        v7 += 48;
      }
      while (v7 != v13);
      uint64_t v7 = v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 4);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x555555555555555) {
      sub_25C7D06B8();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 4);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v11 = 0x555555555555555;
    }
    else {
      unint64_t v11 = v9;
    }
    v16[4] = result;
    if (v11) {
      uint64_t v12 = (char *)sub_25C7D06D0(result, v11);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v14 = &v12[48 * v8];
    v16[0] = v12;
    v16[1] = v14;
    v16[3] = &v12[48 * v11];
    uint64_t v15 = &v14[48 * a2];
    do
    {
      *((_OWORD *)v14 + 1) = 0uLL;
      *((_OWORD *)v14 + 2) = 0uLL;
      *(_OWORD *)uint64_t v14 = 0uLL;
      *((_DWORD *)v14 + 8) = 1065353216;
      *(_DWORD *)(v14 + 38) = 196609;
      v14 += 48;
    }
    while (v14 != v15);
    v16[2] = v15;
    sub_25C7D0640(a1, v16);
    return sub_25C7D0848((uint64_t)v16);
  }
  return result;
}

void sub_25C7D3574(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C7D0848((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_25C7D3588(unint64_t a1)
{
  if (a1 >> 62) {
    sub_25C7D019C();
  }
  return operator new(4 * a1);
}

char *sub_25C7D35C0(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    sub_25C7D3648(result, a4);
    uint64_t result = sub_25C7D369C((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((void *)v6 + 1) = result;
  }
  return result;
}

void sub_25C7D3628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  sub_25C7D025C(&a9);
  _Unwind_Resume(a1);
}

char *sub_25C7D3648(void *a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    sub_25C7D06B8();
  }
  uint64_t result = (char *)sub_25C7D06D0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

char *sub_25C7D369C(uint64_t a1, long long *a2, long long *a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v13 = __dst;
  uint64_t v14 = __dst;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  char v12 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_25C7D059C(v4, *(void **)v6, *((void *)v6 + 1));
        unint64_t v8 = v14;
      }
      else
      {
        long long v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)uint64_t v4 = v7;
        unint64_t v8 = v4;
      }
      long long v9 = *(long long *)((char *)v6 + 24);
      *((void *)v4 + 5) = *((void *)v6 + 5);
      *(_OWORD *)(v4 + 24) = v9;
      v6 += 3;
      uint64_t v4 = v8 + 48;
      uint64_t v14 = v8 + 48;
    }
    while (v6 != a3);
  }
  char v12 = 1;
  sub_25C7D3770((uint64_t)v11);
  return v4;
}

void sub_25C7D375C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_25C7D3770(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_25C7D37A8(a1);
  }
  return a1;
}

void sub_25C7D37A8(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 25) < 0) {
      operator delete(*(void **)(v1 - 48));
    }
    v1 -= 48;
  }
}

uint64_t sub_25C7D37F0(uint64_t result)
{
  if (*(unsigned char *)(result + 70)) {
    __assert_rtn("NotNested", "flatbuffers.h", 1432, "!nested");
  }
  if (*(_DWORD *)(result + 64)) {
    __assert_rtn("NotNested", "flatbuffers.h", 1434, "!num_field_loc");
  }
  return result;
}

_DWORD *sub_25C7D3854(_DWORD *result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    unint64_t v4 = (unint64_t)result;
    int v5 = sub_25C7D3930(result, a3);
    return (_DWORD *)sub_25C7D38A4(v4, a2, v5);
  }
  return result;
}

unint64_t sub_25C7D38A4(unint64_t result, uint64_t a2, int a3)
{
  uint64_t v4 = result;
  if (a3 || *(unsigned char *)(result + 80))
  {
    unsigned int v5 = sub_25C7D39A0(result, a3);
    uint64_t result = sub_25C7D3A7C(v4, 8uLL);
    **(void **)(v4 + 56) = v5 | (unint64_t)(a2 << 32);
    *(void *)(v4 + 56) += 8;
    ++*(_DWORD *)(v4 + 64);
    unsigned int v6 = *(unsigned __int16 *)(v4 + 68);
    if (v6 <= a2) {
      LOWORD(v6) = a2;
    }
    *(_WORD *)(v4 + 68) = v6;
  }
  return result;
}

uint64_t sub_25C7D3930(_DWORD *a1, unsigned int a2)
{
  sub_25C7D39F8((uint64_t)a1, 4uLL);
  if (!a2 || (v4 = a1[8] - a1[12] + a1[10], BOOL v5 = v4 >= a2, v6 = v4 - a2, !v5)) {
    __assert_rtn("ReferTo", "flatbuffers.h", 1419, "off && off <= GetSize()");
  }
  return v6 + 4;
}

uint64_t sub_25C7D39A0(uint64_t a1, int a2)
{
  sub_25C7D39F8(a1, 4uLL);
  unsigned int v4 = (_DWORD *)(*(void *)(a1 + 48) - sub_25C7D3A7C(a1, 4uLL));
  *(void *)(a1 + 48) = v4;
  _DWORD *v4 = a2;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

unint64_t sub_25C7D39F8(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 72) < a2) {
    *(void *)(a1 + 72) = a2;
  }
  return sub_25C7D3A2C(a1, (a2 - 1) & -(uint64_t)(*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40)));
}

unint64_t sub_25C7D3A2C(uint64_t a1, unint64_t a2)
{
  unint64_t result = sub_25C7D3A7C(a1, a2);
  *(void *)(a1 + 48) -= result;
  if (a2)
  {
    uint64_t v5 = 0;
    do
      *(unsigned char *)(*(void *)(a1 + 48) + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t sub_25C7D3A7C(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 48);
  unint64_t v3 = *(void *)(a1 + 56);
  if (v2 < v3 || (unint64_t v5 = *(void *)(a1 + 40), v3 < v5)) {
    __assert_rtn("ensure_space", "flatbuffers.h", 988, "cur_ >= scratch_ && scratch_ >= buf_");
  }
  if (v2 - v3 < a2)
  {
    sub_25C7D3B2C((uint64_t *)a1, a2);
    unint64_t v5 = *(void *)(a1 + 40);
    unint64_t v2 = *(void *)(a1 + 48);
  }
  if ((*(_DWORD *)(a1 + 32) - v2 + v5) >= 0x7FFFFFFF) {
    __assert_rtn("ensure_space", "flatbuffers.h", 992, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  return a2;
}

char *sub_25C7D3B2C(uint64_t *a1, unint64_t a2)
{
  unint64_t v5 = a1[4];
  unsigned int v4 = (char *)a1[5];
  unsigned int v6 = &v4[v5 - a1[6]];
  uint64_t v7 = a1[7] - (void)v4;
  if (v5) {
    unint64_t v8 = v5 >> 1;
  }
  else {
    unint64_t v8 = a1[2];
  }
  if (v8 > a2) {
    a2 = v8;
  }
  unint64_t v9 = (v5 + a1[3] + a2 - 1) & -a1[3];
  a1[4] = v9;
  uint64_t v10 = *a1;
  if (v4)
  {
    if (v10)
    {
      unint64_t result = (char *)(*(uint64_t (**)(uint64_t))(*(void *)v10 + 32))(v10);
    }
    else
    {
      uint64_t v13 = &unk_2709DF130;
      unint64_t result = sub_25C7D3C90((uint64_t)&v13, v4, v5, v9, v6, v7);
    }
  }
  else
  {
    if (!v10)
    {
      uint64_t v13 = &unk_2709DF130;
      operator new[]();
    }
    unint64_t result = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v10 + 16))(v10, v9);
  }
  char v12 = &result[a1[4] - v6];
  a1[5] = (uint64_t)result;
  a1[6] = (uint64_t)v12;
  a1[7] = (uint64_t)&result[v7];
  return result;
}

char *sub_25C7D3C90(uint64_t a1, char *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  if (a4 <= a3) {
    __assert_rtn("reallocate_downward", "flatbuffers.h", 687, "new_size > old_size");
  }
  char v12 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)a1 + 16))(a1, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(uint64_t, char *, unint64_t))(*(void *)a1 + 24))(a1, a2, a3);
  return v12;
}

void sub_25C7D3D90()
{
}

void sub_25C7D3DA4()
{
}

void sub_25C7D3DBC(uint64_t a1, uint64_t a2)
{
  if (a2) {
    JUMPOUT(0x261194450);
  }
}

unint64_t sub_25C7D3DDC(unint64_t result, uint64_t a2, int a3)
{
  __int16 v3 = a3;
  uint64_t v5 = result;
  if (a3 || *(unsigned char *)(result + 80))
  {
    sub_25C7D39F8(result, 2uLL);
    unsigned int v6 = (_WORD *)(*(void *)(v5 + 48) - sub_25C7D3A7C(v5, 2uLL));
    *(void *)(v5 + 48) = v6;
    *unsigned int v6 = v3;
    uint64_t v7 = (*(_DWORD *)(v5 + 32) - v6 + *(_DWORD *)(v5 + 40));
    unint64_t result = sub_25C7D3A7C(v5, 8uLL);
    **(void **)(v5 + 56) = v7 | (a2 << 32);
    *(void *)(v5 + 56) += 8;
    ++*(_DWORD *)(v5 + 64);
    unsigned int v8 = *(unsigned __int16 *)(v5 + 68);
    if (v8 <= a2) {
      LOWORD(v8) = a2;
    }
    *(_WORD *)(v5 + 68) = v8;
  }
  return result;
}

uint64_t sub_25C7D3E90(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 70)) {
    __assert_rtn("EndTable", "flatbuffers.h", 1450, "nested");
  }
  sub_25C7D39F8(a1, 4uLL);
  unsigned int v4 = (_DWORD *)(*(void *)(a1 + 48) - sub_25C7D3A7C(a1, 4uLL));
  *(void *)(a1 + 48) = v4;
  _DWORD *v4 = 0;
  uint64_t v5 = *(void *)(a1 + 32) - (void)v4 + *(void *)(a1 + 40);
  if ((unsigned __int16)(*(_WORD *)(a1 + 68) + 2) <= 4u) {
    unint64_t v6 = 4;
  }
  else {
    unint64_t v6 = (unsigned __int16)(*(_WORD *)(a1 + 68) + 2);
  }
  *(_WORD *)(a1 + 68) = v6;
  uint64_t v7 = (void *)(*(void *)(a1 + 48) - sub_25C7D3A7C(a1, v6));
  *(void *)(a1 + 48) = v7;
  bzero(v7, v6);
  unsigned __int16 v8 = v5 - a2;
  if ((v5 - a2) >= 0x10000) {
    __assert_rtn("EndTable", "flatbuffers.h", 1465, "table_object_size < 0x10000");
  }
  unint64_t v9 = *(unsigned __int16 **)(a1 + 48);
  if (!v9) {
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  }
  v9[1] = v8;
  *unint64_t v9 = *(_WORD *)(a1 + 68);
  unint64_t v10 = *(void *)(a1 + 56);
  if (!v10) {
    __assert_rtn("scratch_end", "flatbuffers.h", 1026, "scratch_");
  }
  uint64_t v11 = *(unsigned int *)(a1 + 64);
  unint64_t v12 = v10 - 8 * v11;
  if (v11)
  {
    uint64_t v13 = (int *)(v10 - 8 * v11);
    do
    {
      uint64_t v14 = *((unsigned __int16 *)v13 + 2);
      if (*(unsigned __int16 *)((char *)v9 + v14)) {
        __assert_rtn("EndTable", "flatbuffers.h", 1476, "!ReadScalar<voffset_t>(buf_.data() + field_location->id)");
      }
      int v15 = *v13;
      v13 += 2;
      *(unsigned __int16 *)((char *)v9 + v14) = v5 - v15;
    }
    while ((unint64_t)v13 < v10);
  }
  *(void *)(a1 + 56) = v12;
  *(_DWORD *)(a1 + 64) = 0;
  *(_WORD *)(a1 + 68) = 0;
  uint64_t v17 = *(void *)(a1 + 32);
  unint64_t v16 = *(void *)(a1 + 40);
  LODWORD(v18) = v17 - v9 + v16;
  if (*(unsigned char *)(a1 + 81))
  {
    if (!v16) {
      __assert_rtn("scratch_data", "flatbuffers.h", 1021, "buf_");
    }
    if (v16 < v12)
    {
      size_t v19 = *v9;
      uint64_t v20 = v16 + v17;
      uint64_t v21 = *(unsigned int **)(a1 + 40);
      while (1)
      {
        uint64_t v18 = *v21;
        if (v19 == *(unsigned __int16 *)(v20 - v18) && !memcmp((const void *)(v20 - v18), v9, v19)) {
          break;
        }
        if ((unint64_t)++v21 >= v12)
        {
          LODWORD(v18) = v17 - v9 + v16;
          goto LABEL_21;
        }
      }
      unint64_t v9 = (unsigned __int16 *)((char *)v9 + (v17 - v9 + v16 - v5));
      *(void *)(a1 + 48) = v9;
    }
  }
LABEL_21:
  if (v18 == v17 + v16 - v9)
  {
    sub_25C7D3A7C(a1, 4uLL);
    unint64_t v22 = *(_DWORD **)(a1 + 56);
    *unint64_t v22 = v18;
    *(void *)(a1 + 56) = v22 + 1;
    uint64_t v17 = *(void *)(a1 + 32);
    unint64_t v16 = *(void *)(a1 + 40);
  }
  *(_DWORD *)(v16 + v17 - v5) = v18 - v5;
  *(unsigned char *)(a1 + 70) = 0;
  return v5;
}

unint64_t sub_25C7D4130(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (*(void *)(a1 + 72) < a3) {
    *(void *)(a1 + 72) = a3;
  }
  return sub_25C7D3A2C(a1, (a3 - 1) & (-a2 - (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40))));
}

uint64_t sub_25C7D4168(uint64_t a1, const void *a2, unint64_t a3)
{
  sub_25C7D41E4(a1, a3, 1uLL);
  if (a3)
  {
    unint64_t v6 = (void *)(*(void *)(a1 + 48) - sub_25C7D3A7C(a1, a3));
    *(void *)(a1 + 48) = v6;
    memcpy(v6, a2, a3);
  }
  return sub_25C7D4250(a1, a3);
}

unint64_t sub_25C7D41E4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  sub_25C7D37F0(a1);
  *(unsigned char *)(a1 + 70) = 1;
  uint64_t v6 = a3 * a2;
  sub_25C7D4130(a1, v6, 4uLL);
  return sub_25C7D4130(a1, v6, a3);
}

uint64_t sub_25C7D4250(uint64_t a1, int a2)
{
  if (!*(unsigned char *)(a1 + 70)) {
    __assert_rtn("EndVector", "flatbuffers.h", 1672, "nested");
  }
  *(unsigned char *)(a1 + 70) = 0;
  return sub_25C7D39A0(a1, a2);
}

uint64_t sub_25C7D42A0(uint64_t a1, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  skit::IndexWriter::IndexWriter((skit::IndexWriter *)(a1 + 16));
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  std::__fs::filesystem::path v9 = *a2;
  a2->__pn_.__r_.__value_.__l.__size_ = 0;
  a2->__pn_.__r_.__value_.__r.__words[2] = 0;
  a2->__pn_.__r_.__value_.__r.__words[0] = 0;
  std::__fs::filesystem::path __p = *a3;
  a3->__pn_.__r_.__value_.__r.__words[0] = 0;
  a3->__pn_.__r_.__value_.__l.__size_ = 0;
  a3->__pn_.__r_.__value_.__r.__words[2] = 0;
  skit::Alias::Alias((skit::Alias *)(a1 + 88), &v9, &__p);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__pn_.__r_.__value_.__l.__data_);
  }
  *(_WORD *)(a1 + 108) = 0;
  *(_DWORD *)(a1 + 104) = 0;
  *(_DWORD *)(a1 + 112) = -1;
  *(unsigned char *)(a1 + 116) = 0;
  if (skit::Alias::init((skit::Alias *)(a1 + 88)))
  {
    uint64_t v6 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "Indexer";
      _os_log_error_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_ERROR, "%s Failed to initialize alias", buf, 0xCu);
    }
  }
  return a1;
}

void sub_25C7D4410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v24 = *(std::__shared_weak_count **)(v21 + 96);
  if (v24) {
    sub_25C7D2280(v24);
  }
  uint64_t v25 = *(std::__shared_weak_count **)(v21 + 80);
  if (v25) {
    sub_25C7D2280(v25);
  }
  uint64_t v26 = *(std::__shared_weak_count **)(v21 + 64);
  if (v26) {
    sub_25C7D2280(v26);
  }
  if (*(char *)(v21 + 55) < 0) {
    operator delete(*(void **)(v21 + 32));
  }
  MEMORY[0x261193EB0](v22);
  skit::ContextV2::~ContextV2((skit::ContextV2 *)v21);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7D4490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, std::__fs::filesystem::path *a5, std::__fs::filesystem::path *a6, uint64_t a7, uint64_t a8, __int16 a9)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  char v20 = 2;
  int __p = 7733363;
  __int16 __p_4 = 0;
  skit::ContextV2::ContextV2();
  skit::ContextV2::index_writer();
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  std::__fs::filesystem::path v17 = *a5;
  a5->__pn_.__r_.__value_.__l.__size_ = 0;
  a5->__pn_.__r_.__value_.__r.__words[2] = 0;
  a5->__pn_.__r_.__value_.__r.__words[0] = 0;
  std::__fs::filesystem::path v16 = *a6;
  a6->__pn_.__r_.__value_.__r.__words[0] = 0;
  a6->__pn_.__r_.__value_.__l.__size_ = 0;
  a6->__pn_.__r_.__value_.__r.__words[2] = 0;
  skit::Alias::Alias((skit::Alias *)(a1 + 88), &v17, &v16);
  if (SHIBYTE(v16.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__pn_.__r_.__value_.__l.__data_);
  }
  *(void *)(a1 + 104) = a7;
  *(void *)(a1 + 112) = a8;
  *(_WORD *)(a1 + 120) = a9;
  skit::IndexWriter::set_mode((skit::IndexWriter *)(a1 + 16));
  skit::IndexWriter::set_dp_class((skit::IndexWriter *)(a1 + 16));
  skit::IndexWriter::flush_threshold((skit::IndexWriter *)(a1 + 16));
  skit::IndexWriter::set_term_index_write_cache((skit::IndexWriter *)(a1 + 16));
  skit::IndexWriter::set_doc_store_write_cache((skit::IndexWriter *)(a1 + 16));
  if (skit::Alias::init((skit::Alias *)(a1 + 88)))
  {
    uint64_t v14 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v22 = "Indexer";
      _os_log_error_impl(&dword_25C7CA000, v14, OS_LOG_TYPE_ERROR, "%s Failed to initialize alias", buf, 0xCu);
    }
  }
  return a1;
}

void sub_25C7D4690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  unsigned int v30 = *(std::__shared_weak_count **)(v27 + 80);
  if (v30) {
    sub_25C7D2280(v30);
  }
  id v31 = *(std::__shared_weak_count **)(v27 + 64);
  if (v31) {
    sub_25C7D2280(v31);
  }
  if (*(char *)(v27 + 55) < 0) {
    operator delete(*(void **)(v27 + 32));
  }
  MEMORY[0x261193EB0](v28);
  skit::ContextV2::~ContextV2((skit::ContextV2 *)v27);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7D4728(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  long long v40 = 0uLL;
  uint64_t v41 = 0;
  id v31 = 0;
  char v32 = 0;
  long long v33 = xmmword_25C826760;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v36 = 0;
  uint64_t v37 = 1;
  __int16 v38 = 256;
  uint64_t v39 = 0;
  if (!sub_25C7D4B7C(a1, v10, v11, a5, a6, (uint64_t *)&v40, (unint64_t)&v31))
  {
LABEL_20:
    uint64_t v24 = 0xFFFFFFFFLL;
    goto LABEL_21;
  }
  v30[2] = sub_25C7D5258((uint64_t)&v31);
  v30[3] = (v34 - v35 + DWORD2(v34));
  uint64_t v12 = v40;
  if ((void)v40 == *((void *)&v40 + 1)) {
    goto LABEL_6;
  }
  int v13 = 0;
  do
  {
    v13 += (*(unsigned __int16 *)(v12 + 40) << 31 >> 31) & *(unsigned __int16 *)(v12 + 38);
    v12 += 48;
  }
  while (v12 != *((void *)&v40 + 1));
  if (!v13)
  {
LABEL_6:
    uint64_t v14 = (id)qword_26B3549C0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = (void *)MEMORY[0x263F50070];
      std::__fs::filesystem::path v16 = objc_opt_class();
      uint64_t v20 = objc_msgSend_itemType(v16, v17, v18, v19);
      uint64_t v23 = objc_msgSend_descriptionForTypeIdentifier_(v15, v21, v20, v22);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "add_cascade_item";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      _os_log_impl(&dword_25C7CA000, v14, OS_LOG_TYPE_INFO, "%s Cascade item content has 0 indexed fields. itemType: %@", buf, 0x16u);
    }
    sub_25C7D78F0(buf, (char *)&word_25C849514);
    *(void *)&long long v49 = 0;
    *((void *)&v49 + 1) = 0x100003F800000;
    LOWORD(v50) = 3;
    HIDWORD(v50) = 0;
    if ((buf[23] & 0x80000000) != 0)
    {
      sub_25C7D059C(&__dst, *(void **)buf, *(unint64_t *)&buf[8]);
    }
    else
    {
      long long __dst = *(_OWORD *)buf;
      uint64_t v45 = *(void *)&buf[16];
    }
    long long v46 = v49;
    uint64_t v47 = v50;
    v30[0] = 0;
    long long v29 = 0uLL;
    int v42 = (void **)&v29;
    char v43 = 0;
    *(void *)&long long v29 = operator new(0x30uLL);
    *((void *)&v29 + 1) = v29;
    v30[0] = v29 + 48;
    *((void *)&v29 + 1) = sub_25C7D6B2C((uint64_t)v30, &__dst, (long long *)buf, (char *)v29);
    sub_25C7D01D0((uint64_t *)&v40);
    long long v40 = v29;
    uint64_t v41 = v30[0];
    v30[0] = 0;
    long long v29 = 0uLL;
    int v42 = (void **)&v29;
    sub_25C7D025C(&v42);
    if (SHIBYTE(v45) < 0) {
      operator delete((void *)__dst);
    }
    if ((buf[23] & 0x80000000) != 0) {
      operator delete(*(void **)buf);
    }
  }
  if (skit::IndexWriter::append() <= 0)
  {
    uint64_t v25 = (id)qword_26B3549C0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = __error();
      uint64_t v28 = strerror(*v27);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "add_cascade_item";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v28;
      _os_log_error_impl(&dword_25C7CA000, v25, OS_LOG_TYPE_ERROR, "%s ERROR: failed to append token stream to index. errno: %s", buf, 0x16u);
    }

    goto LABEL_20;
  }
  uint64_t v24 = 0;
LABEL_21:
  sub_25C7D6C00(&v31);
  id v31 = (void **)&v40;
  sub_25C7D025C(&v31);

  return v24;
}

void sub_25C7D4AD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void **a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  if (*(char *)(v29 - 105) < 0) {
    operator delete(*(void **)(v29 - 128));
  }
  sub_25C7D6C00(&a15);
  a15 = (void **)&a27;
  sub_25C7D025C(&a15);

  _Unwind_Resume(a1);
}

uint64_t sub_25C7D4B7C(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t *a6, unint64_t a7)
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v13 = a2;
  id v14 = a3;
  memset(v75, 0, sizeof(v75));
  memset(v74, 0, sizeof(v74));
  int __p = 0;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  unsigned int v78 = (void **)&v80;
  uint64_t v79 = 0x200000000;
  int v15 = objc_opt_class();
  uint64_t v19 = objc_msgSend_itemType(v15, v16, v17, v18);
  int v20 = sub_25C821174(v19);
  unsigned __int16 v70 = v20;
  if (v20)
  {
    uint64_t v65 = a4;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    int v69 = 0;
    v66[12] = a7;
    id v67 = 0;
    v66[0] = MEMORY[0x263EF8330];
    v66[1] = 3221225472;
    v66[2] = sub_25C7D52BC;
    v66[3] = &unk_2654BB5D0;
    v66[6] = a1;
    v66[7] = &v70;
    v66[8] = v74;
    v66[9] = &v78;
    v66[10] = a6;
    v66[11] = &__p;
    v66[4] = v68;
    v66[5] = v75;
    objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v13, v21, (uint64_t)&v67, (uint64_t)v66);
    uint64_t v22 = v67;
    if (v22)
    {
      uint64_t v23 = qword_26B3549C0;
      if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "analyze_cascade_item";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v22;
        _os_log_error_impl(&dword_25C7CA000, v23, OS_LOG_TYPE_ERROR, "%s Field enumeration failed: %@", buf, 0x16u);
      }
      uint64_t v24 = 0;
    }
    else
    {
      unsigned __int16 v64 = v70;
      sub_25C821AFC(v70, *(void *)(a1 + 104), *(_WORD *)(a1 + 120), (uint64_t)&v81);
      uint64_t v62 = a5;
      int v63 = v14;
      if (v79)
      {
        uint64_t v27 = v78;
        uint64_t v28 = &v78[5 * v79];
        int v61 = (unint64_t *)(a6 + 2);
        do
        {
          if (skit::AliasSpanMatchCompare::compare_locale((skit::AliasSpanMatchCompare *)*((unsigned __int8 *)v27 + 32)))
          {
            uint64_t v29 = v82;
            if (v82)
            {
              unsigned int v30 = v81;
              while ((skit::AliasSpanMatchCompare::compare_entity_type((skit::AliasSpanMatchCompare *)*((unsigned __int8 *)v27 + 33)) & 1) == 0)
              {
                ++v30;
                if (!--v29) {
                  goto LABEL_51;
                }
              }
              uint64_t v31 = *a6;
              unint64_t v32 = a6[1];
              if (*a6 != v32)
              {
                long long v33 = (char *)*((unsigned __int8 *)v27 + 23);
                int v34 = (char)v33;
                if ((char)v33 < 0) {
                  long long v33 = (char *)v27[1];
                }
                long long v35 = (unsigned __int16 *)*a6;
                do
                {
                  uint64_t v36 = (char *)*((unsigned __int8 *)v35 + 23);
                  int v37 = (char)v36;
                  if ((char)v36 < 0) {
                    uint64_t v36 = (char *)*((void *)v35 + 1);
                  }
                  if (v36 == v33)
                  {
                    if (!v33) {
                      goto LABEL_51;
                    }
                    if (v37 >= 0) {
                      __int16 v38 = v35;
                    }
                    else {
                      __int16 v38 = *(unsigned __int16 **)v35;
                    }
                    uint64_t v39 = (unsigned __int16 *)*v27;
                    if (v34 >= 0) {
                      uint64_t v39 = (unsigned __int16 *)v27;
                    }
                    long long v40 = v33;
                    while (*v39 == *v38)
                    {
                      ++v38;
                      ++v39;
                      if (!--v40) {
                        goto LABEL_51;
                      }
                    }
                  }
                  v35 += 24;
                }
                while (v35 != (unsigned __int16 *)v32);
              }
              uint64_t v42 = *((unsigned int *)v27 + 6);
              uint64_t v41 = *((unsigned int *)v27 + 7);
              float v43 = 0.0;
              float v44 = (float)(v41 - v42);
              float v45 = 1.0 / (float)(v44 + 1.0);
              if (v41 > v42)
              {
                float v46 = v45 * v44;
                uint64_t v47 = v41 - v42;
                uint64_t v48 = (float *)(v31 + 48 * v42 + 32);
                do
                {
                  float v43 = v43 + *v48;
                  *uint64_t v48 = v46 * *v48;
                  v48 += 12;
                  --v47;
                }
                while (v47);
              }
              int v77 = 1;
              float v76 = v45 * v43;
              if (v32 >= *v61)
              {
                unint64_t v50 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v32 - v31) >> 4);
                if (v50 + 1 > 0x555555555555555) {
                  sub_25C7D06B8();
                }
                unint64_t v51 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*v61 - v31) >> 4);
                uint64_t v52 = 2 * v51;
                if (2 * v51 <= v50 + 1) {
                  uint64_t v52 = v50 + 1;
                }
                if (v51 >= 0x2AAAAAAAAAAAAAALL) {
                  unint64_t v53 = 0x555555555555555;
                }
                else {
                  unint64_t v53 = v52;
                }
                long long v86 = a6 + 2;
                if (v53) {
                  unint64_t v54 = (char *)sub_25C7D06D0((uint64_t)v61, v53);
                }
                else {
                  unint64_t v54 = 0;
                }
                *(void *)buf = v54;
                *(void *)&buf[8] = &v54[48 * v50];
                *(void *)&uint8_t buf[16] = *(void *)&buf[8];
                long long v85 = &v54[48 * v53];
                sub_25C7D698C(*(uint64_t *)&buf[8], (long long *)v27, &v77, (int *)&v76);
                *(void *)&buf[16] += 48;
                sub_25C7D0640(a6, buf);
                unint64_t v49 = a6[1];
                sub_25C7D0848((uint64_t)buf);
              }
              else
              {
                sub_25C7D698C(v32, (long long *)v27, &v77, (int *)&v76);
                unint64_t v49 = v32 + 48;
                a6[1] = v32 + 48;
              }
              a6[1] = v49;
              *(_WORD *)(v49 - 12) = v64;
            }
          }
LABEL_51:
          v27 += 5;
        }
        while (v27 != v28);
      }
      if (v81 != (char *)&v83) {
        free(v81);
      }
      if (v79)
      {
        unsigned int v55 = v78;
        uint64_t v56 = 40 * v79;
        do
        {
          if (*((char *)v55 + 23) < 0) {
            operator delete(*v55);
          }
          v55 += 5;
          v56 -= 40;
        }
        while (v56);
      }
      LODWORD(v79) = 0;
      id v14 = v63;
      unsigned int v57 = sub_25C7D2D88(a7, v19, v13, v63, v65, v62, (uint64_t *)&__p);
      sub_25C7D37F0(a7);
      *(void *)(a7 + 56) = *(void *)(a7 + 40);
      sub_25C7D4130(a7, 4, *(void *)(a7 + 72));
      int v58 = sub_25C7D3930((_DWORD *)a7, v57);
      sub_25C7D39A0(a7, v58);
      *(unsigned char *)(a7 + 71) = 1;
      uint64_t v24 = v70;
    }
    _Block_object_dispose(v68, 8);
  }
  else
  {
    uint64_t v22 = (id)qword_26B3549C0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v60 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v25, v19, v26);
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "analyze_cascade_item";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v60;
      _os_log_error_impl(&dword_25C7CA000, v22, OS_LOG_TYPE_ERROR, "%s Item_type: %@ does not map to a valid SearchGroup", buf, 0x16u);
    }
    uint64_t v24 = 0;
  }

  sub_25C7D2390((uint64_t *)&v78);
  if (__p)
  {
    uint64_t v72 = __p;
    operator delete(__p);
  }
  unsigned int v78 = (void **)v74;
  sub_25C7D7494(&v78);
  unsigned int v78 = (void **)v75;
  sub_25C7D025C(&v78);

  return v24;
}

void sub_25C7D5188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *__p,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char *a44)
{
  uint64_t v47 = *(void **)(v45 - 184);
  if (v47 != (void *)(v45 - 168)) {
    free(v47);
  }
  _Block_object_dispose(&a29, 8);
  sub_25C7D2390((uint64_t *)&a44);
  if (__p)
  {
    a35 = (uint64_t)__p;
    operator delete(__p);
  }
  a44 = &a37;
  sub_25C7D7494((void ***)&a44);
  a44 = &a40;
  sub_25C7D025C((void ***)&a44);

  _Unwind_Resume(a1);
}

uint64_t sub_25C7D5258(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 71)) {
    __assert_rtn("Finished", "flatbuffers.h", 1319, "finished");
  }
  uint64_t result = *(void *)(a1 + 48);
  if (!result) {
    __assert_rtn("data", "flatbuffers.h", 1016, "cur_");
  }
  return result;
}

void sub_25C7D52BC(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = a2;
  int v7 = objc_msgSend_fieldType(v3, v4, v5, v6);
  if (sub_25C8216B4(v7))
  {
    int v11 = objc_msgSend_dataType(v3, v8, v9, v10);
    switch(v11)
    {
      case 0:
        int v20 = objc_msgSend_stringValueNoCopy(v3, v12, v13, v14);
        sub_25C7D554C((uint64_t **)(a1 + 40), v7, v20, *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
LABEL_9:

        break;
      case 1:
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        uint64_t v21 = objc_msgSend_repeatedStringValueNoCopy(v3, v12, v13, v14, 0);
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v28, (uint64_t)v36, 16);
        if (v23)
        {
          uint64_t v24 = *(void *)v29;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v29 != v24) {
                objc_enumerationMutation(v21);
              }
              sub_25C7D554C((uint64_t **)(a1 + 40), v7, *(void **)(*((void *)&v28 + 1) + 8 * v25++), *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
            }
            while (v23 != v25);
            uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v26, (uint64_t)&v28, (uint64_t)v36, 16);
          }
          while (v23);
        }

        break;
      case 20:
        int v15 = objc_msgSend_rawEnumValue(v3, v12, v13, v14);
        std::__fs::filesystem::path v16 = sub_25C821ACC(v15, v7);
        int v20 = v16;
        if (v16 && objc_msgSend_length(v16, v17, v18, v19)) {
          sub_25C7D554C((uint64_t **)(a1 + 40), v7, v20, *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
        }
        goto LABEL_9;
      default:
        uint64_t v27 = qword_26B3549C0;
        if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          long long v33 = "analyze_cascade_item_block_invoke";
          __int16 v34 = 2112;
          id v35 = v3;
          _os_log_error_impl(&dword_25C7CA000, v27, OS_LOG_TYPE_ERROR, "%s Ignoring field with unhandled data type: %@", buf, 0x16u);
        }
        break;
    }
  }
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
}

void sub_25C7D5508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7D554C(uint64_t **a1, int a2, void *a3, unsigned __int16 a4)
{
  uint64_t v137 = *MEMORY[0x263EF8340];
  id v7 = a3;
  unsigned __int16 v8 = a1[1];
  if (!objc_msgSend_length(v7, v9, v10, v11)) {
    goto LABEL_134;
  }
  id v109 = v7;
  id v12 = v7;
  std::__fs::filesystem::path v16 = (char *)objc_msgSend_UTF8String(v12, v13, v14, v15);
  unsigned __int16 v108 = a4;
  strlen(v16);
  v114[1] = 0;
  uint64_t v115 = 0;
  v114[0] = 0;
  skit::to_u16string();
  uint64_t v18 = **a1;
  uint64_t v17 = (*a1)[1];
  (*(void (**)(uint64_t))(*(void *)v8[9] + 16))(v8[9]);
  char v106 = sub_25C7CD104(v8[9], *a1, 1, 0xAAAAAAAAAAAAAAABLL * ((v17 - v18) >> 4));
  sub_25C7CCEF8(v8[9], **a1, (*a1)[1], *(unsigned __int16 *)a1[2]);
  __int16 v19 = *(_WORD *)a1[2];
  if ((v19 & 0xFFFE) == 2)
  {
    v110 = a1[3];
    uint64_t v20 = v8[9];
    if ((*(_WORD *)(v20 + 192) & 4) != 0)
    {
      uint64_t v21 = 0;
      uint64_t v22 = (__int16 *)"NSt3__120__shared_ptr_emplaceIN13semskitbridge9TokenizerENS_9allocatorIS2_EEEE";
      while ((unsigned __int16)word_25C826770[v21] != a2)
      {
        if (++v21 == 4) {
          goto LABEL_9;
        }
      }
      uint64_t v22 = &word_25C826770[v21];
LABEL_9:
      if ((char *)v22 - (char *)word_25C826770 != 8)
      {
        sub_25C7D0AE0(buf, v16);
        uint64_t v25 = sub_25C7CD42C(v20, (const char *)buf, v23, v24);
        if (SBYTE7(v134) < 0) {
          operator delete(*(void **)buf);
        }
        if (v25)
        {
          long long v129 = 0uLL;
          uint64_t v130 = 0;
          *(_OWORD *)v125 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v105 = v25;
          id v26 = v25;
          uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)v125, (uint64_t)buf, 16);
          if (v28)
          {
            uint64_t v29 = *(void *)v126;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v126 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = v8[9];
                id v32 = *((id *)v125[1] + i);
                uint64_t v36 = (char *)objc_msgSend_UTF8String(v32, v33, v34, v35);
                sub_25C7D0AE0(__p, v36);
                sub_25C7CD6B8(v31, (uint64_t *)&v129, (uint64_t)__p, 0x2Eu, -1);
                if (SHIBYTE(v119) < 0) {
                  operator delete(__p[0]);
                }
              }
              uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v37, (uint64_t)v125, (uint64_t)buf, 16);
            }
            while (v28);
          }

          sub_25C7CFB88(v8[9], (unsigned __int16 **)&v129);
          LOWORD(v131) = 1792;
          uint64_t v39 = (long long *)*((void *)&v129 + 1);
          for (j = (long long *)v129; j != v39; j = (long long *)((char *)j + 24))
          {
            if (*((char *)j + 23) < 0)
            {
              sub_25C7D059C(&__dst, *(void **)j, *((void *)j + 1));
              uint64_t v40 = *((unsigned __int8 *)j + 23);
            }
            else
            {
              uint64_t v40 = *((unsigned __int8 *)j + 23);
              long long v41 = *j;
              unint64_t v117 = *((void *)j + 2);
              long long __dst = v41;
            }
            *(_OWORD *)int __p = __dst;
            unint64_t v119 = v117;
            unint64_t v117 = 0;
            long long __dst = 0uLL;
            int v121 = 1065353216;
            int v123 = 196609;
            int v124 = 0;
            __int16 v122 = v19;
            if ((v40 & 0x80) != 0) {
              uint64_t v40 = *((void *)j + 1);
            }
            uint64_t v120 = v40 << 32;
            sub_25C7D627C((long long *)__p, (unsigned __int16 *)&v131, v110);
            if (SHIBYTE(v119) < 0) {
              operator delete(__p[0]);
            }
          }
          __p[0] = &v129;
          sub_25C7D1010((void ***)__p);
          uint64_t v25 = v105;
        }
        else
        {
          uint64_t v42 = qword_26B3549C0;
          if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&uint8_t buf[4] = "add_phonetic_ngrams_for_field";
            _os_log_error_impl(&dword_25C7CA000, v42, OS_LOG_TYPE_ERROR, "%s Prons is nil, aborting.", buf, 0xCu);
          }
        }
      }
    }
    if (v106)
    {
      uint64_t v43 = v8[9];
      if ((*(unsigned char *)(*(void *)(v43 + 8) + 32) & 8) != 0 && (*(_WORD *)(v43 + 192) & 2) != 0)
      {
        if (!*(void *)(v43 + 224))
        {
          sub_25C7CC6BC((void *)v43);
          uint64_t v43 = v8[9];
        }
        uint64_t v44 = *(void *)(v43 + 224);
        sub_25C7D78F0(buf, (char *)v114);
        uint64_t v45 = (*(uint64_t (**)(uint64_t, uint8_t *))(*(void *)v44 + 64))(v44, buf);
        if (SBYTE7(v134) < 0) {
          operator delete(*(void **)buf);
        }
        (*(void (**)(void **__return_ptr, uint64_t))(*(void *)v45 + 72))(v125, v45);
        float v46 = (void *)BYTE7(v126);
        char v47 = BYTE7(v126);
        if (SBYTE7(v126) < 0) {
          float v46 = v125[1];
        }
        if (v46)
        {
          (*(void (**)(void **__return_ptr, uint64_t))(*(void *)v45 + 72))(__p, v45);
          *(void *)&long long v134 = v119;
          *(_OWORD *)buf = *(_OWORD *)__p;
          __p[1] = 0;
          unint64_t v119 = 0;
          __p[0] = 0;
          *(_DWORD *)v135 = 1065353216;
          *(_DWORD *)&v135[6] = 196609;
          int v136 = 0;
          *(_WORD *)&v135[4] = v19;
          uint64_t v48 = BYTE7(v134);
          int v49 = SBYTE7(v134);
          if (SBYTE7(v134) < 0) {
            uint64_t v48 = *(void *)&buf[8];
          }
          *((void *)&v134 + 1) = v48 << 32;
          LOWORD(v129) = 1536;
          sub_25C7D627C((long long *)buf, (unsigned __int16 *)&v129, v110);
          if (v49 < 0) {
            operator delete(*(void **)buf);
          }
          char v47 = BYTE7(v126);
        }
        if (v47 < 0) {
          operator delete(v125[0]);
        }
        (*(void (**)(uint64_t))(*(void *)v45 + 16))(v45);
      }
    }
  }
  unint64_t v50 = *a1;
  uint64_t v51 = (uint64_t)a1[3];
  long long v129 = 0uLL;
  uint64_t v130 = 0;
  sub_25C7D35C0((char *)&v129, (long long *)*v50, (long long *)v50[1], 0xAAAAAAAAAAAAAAABLL * ((v50[1] - *v50) >> 4));
  sub_25C7CC9F4(v8[9], (uint64_t *)&v129);
  long long v112 = v129;
  uint64_t v113 = v130;
  long long v129 = 0uLL;
  uint64_t v130 = 0;
  skit::Analyzer::dedup((uint64_t *)buf, (skit::Analyzer *)&v112, v52);
  sub_25C7D01D0((uint64_t *)&v129);
  long long v129 = *(_OWORD *)buf;
  uint64_t v130 = v134;
  *(void *)&long long v134 = 0;
  memset(buf, 0, sizeof(buf));
  v125[0] = buf;
  sub_25C7D025C((void ***)v125);
  v125[0] = &v112;
  sub_25C7D025C((void ***)v125);
  skit::Alias::match();
  sub_25C7D6CB4(a1[5], a1[5][1], (long long *)v129, *((long long **)&v129 + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v129 + 1) - v129) >> 4));
  uint64_t v54 = *((void *)&v129 + 1);
  uint64_t v53 = v129;
  while (v54 != v53)
  {
    if (*(char *)(v54 - 25) < 0) {
      operator delete(*(void **)(v54 - 48));
    }
    v54 -= 48;
  }
  *((void *)&v129 + 1) = v53;
  unsigned int v55 = (long long ***)a1[3];
  uint64_t v56 = *v55;
  unsigned int v57 = v55[1];
  if (*v55 != v57)
  {
    do
    {
      sub_25C7D71B8(a1[5], (long long *)a1[5][1], *v56, v56[1], 0xAAAAAAAAAAAAAAABLL * (v56[1] - *v56));
      v56 += 4;
    }
    while (v56 != v57);
  }
  int v58 = a1[2];
  if ((*(_WORD *)v58 & 0xFFFE) != 2) {
    goto LABEL_110;
  }
  uint64_t v59 = v8[9];
  if ((*(_WORD *)(v59 + 192) & 1) == 0 || (*(unsigned char *)(*(void *)(v59 + 8) + 32) & 0x10) == 0) {
    goto LABEL_110;
  }
  long long __dst = 0uLL;
  unint64_t v117 = 0;
  int v60 = *a1;
  int v61 = (long long *)(*a1)[1];
  uint64_t v62 = (uint64_t)v61 - **a1;
  if (!v62)
  {
    uint64_t v83 = 0;
    unsigned int v82 = 0;
    goto LABEL_104;
  }
  uint64_t v104 = v51;
  uint64_t v63 = 0;
  __int16 v64 = *(_WORD *)v58;
  if ((unint64_t)(v62 / 48) <= 1) {
    uint64_t v65 = 1;
  }
  else {
    uint64_t v65 = v62 / 48;
  }
  v111 = *a1;
  uint64_t v107 = v65;
  do
  {
    uint64_t v66 = *v60;
    uint64_t v67 = *v60 + 48 * v63;
    if ((*(_WORD *)(v67 + 40) & 6) != 2) {
      goto LABEL_101;
    }
    if (*(char *)(v67 + 23) < 0)
    {
      sub_25C7D059C(v125, *(void **)v67, *(void *)(v67 + 8));
    }
    else
    {
      long long v68 = *(_OWORD *)v67;
      *(void *)&long long v126 = *(void *)(v67 + 16);
      *(_OWORD *)v125 = v68;
    }
    int v69 = (_DWORD *)(v66 + 48 * v63 + 24);
    unint64_t v70 = 2;
    while ((SBYTE7(v126) & 0x80000000) == 0)
    {
      unint64_t v71 = BYTE7(v126);
      if (v70 >= (unint64_t)BYTE7(v126) - 1) {
        goto LABEL_100;
      }
      uint64_t v72 = v125;
LABEL_78:
      if (v71 >= v70 + 1) {
        unint64_t v73 = v70 + 1;
      }
      else {
        unint64_t v73 = v71;
      }
      v131 = v72;
      unint64_t v132 = v73;
      if (!morphun::dictionary::DictionaryMetaData::isKnownWord() || (skit::is_significant() & 1) == 0) {
        goto LABEL_98;
      }
      *(_OWORD *)buf = 0u;
      long long v134 = 0u;
      *(void *)v135 = 0x100003F800000;
      *(_WORD *)&v135[8] = 3;
      int v136 = 0;
      unint64_t v74 = v132;
      if (v132 >= 0x7FFFFFFFFFFFFFF8) {
        sub_25C7D00F4();
      }
      uint64_t v75 = v131;
      if (v132 >= 0xB)
      {
        uint64_t v77 = (v132 & 0xFFFFFFFFFFFFFFFCLL) + 4;
        if ((v132 | 3) != 0xB) {
          uint64_t v77 = v132 | 3;
        }
        float v76 = sub_25C7D04E8((uint64_t)__p, v77 + 1);
        __p[1] = (void *)v74;
        unint64_t v119 = v78 | 0x8000000000000000;
        __p[0] = v76;
LABEL_90:
        uint64_t v79 = 2 * v74;
        do
        {
          __int16 v80 = *(_WORD *)v75;
          uint64_t v75 = (void **)((char *)v75 + 2);
          *v76++ = v80;
          v79 -= 2;
        }
        while (v79);
        goto LABEL_92;
      }
      HIBYTE(v119) = v132;
      float v76 = __p;
      if (v132) {
        goto LABEL_90;
      }
LABEL_92:
      *float v76 = 0;
      if (SBYTE7(v134) < 0) {
        operator delete(*(void **)buf);
      }
      *(_OWORD *)buf = *(_OWORD *)__p;
      *(void *)&long long v134 = v119;
      *(_WORD *)&v135[8] |= 0xBu;
      unint64_t v81 = BYTE7(v126);
      if (SBYTE7(v126) < 0) {
        unint64_t v81 = (unint64_t)v125[1];
      }
      *(float *)v135 = (float)v132 / (float)v81;
      *((void *)&v134 + 1) = *v69 | ((unint64_t)(v70 + *v69 + 1) << 32);
      *(_WORD *)&v135[4] = v64;
      sub_25C7D65DC((uint64_t *)&__dst, (long long *)buf);
      if (SBYTE7(v134) < 0) {
        operator delete(*(void **)buf);
      }
LABEL_98:
      ++v70;
    }
    unint64_t v71 = (unint64_t)v125[1];
    if ((void *)v70 < (char *)v125[1] - 1)
    {
      uint64_t v72 = (void **)v125[0];
      goto LABEL_78;
    }
    operator delete(v125[0]);
LABEL_100:
    int v60 = v111;
    uint64_t v65 = v107;
LABEL_101:
    ++v63;
  }
  while (v63 != v65);
  int v60 = *a1;
  int v61 = (long long *)(*a1)[1];
  uint64_t v83 = (long long *)*((void *)&__dst + 1);
  unsigned int v82 = (long long *)__dst;
  uint64_t v51 = v104;
LABEL_104:
  sub_25C7D71B8(v60, v61, v82, v83, 0xAAAAAAAAAAAAAAABLL * (v83 - v82));
  sub_25C7CC9F4(v8[9], (uint64_t *)&__dst);
  sub_25C7D6CB4(a1[5], a1[5][1], (long long *)__dst, *((long long **)&__dst + 1), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&__dst + 1) - __dst) >> 4));
  uint64_t v85 = *((void *)&__dst + 1);
  uint64_t v84 = __dst;
  while (v85 != v84)
  {
    if (*(char *)(v85 - 25) < 0) {
      operator delete(*(void **)(v85 - 48));
    }
    v85 -= 48;
  }
  *((void *)&__dst + 1) = v84;
  *(void *)buf = &__dst;
  sub_25C7D025C((void ***)buf);
LABEL_110:
  long long v86 = a1[6];
  int v87 = sub_25C7D26EC((unint64_t)a1[7], v108, v50, v51);
  int v88 = v87;
  uint64_t v90 = (_DWORD *)v86[1];
  unint64_t v89 = v86[2];
  if ((unint64_t)v90 >= v89)
  {
    unint64_t v92 = (_DWORD *)*v86;
    uint64_t v93 = ((uint64_t)v90 - *v86) >> 2;
    unint64_t v94 = v93 + 1;
    if ((unint64_t)(v93 + 1) >> 62) {
      sub_25C7D06B8();
    }
    uint64_t v95 = v89 - (void)v92;
    if (v95 >> 1 > v94) {
      unint64_t v94 = v95 >> 1;
    }
    if ((unint64_t)v95 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v96 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v96 = v94;
    }
    if (v96)
    {
      if (v96 >> 62) {
        sub_25C7D019C();
      }
      v97 = (char *)operator new(4 * v96);
      unint64_t v92 = (_DWORD *)*v86;
      uint64_t v90 = (_DWORD *)v86[1];
    }
    else
    {
      v97 = 0;
    }
    char v98 = &v97[4 * v93];
    unint64_t v99 = &v97[4 * v96];
    *(_DWORD *)char v98 = v88;
    long long v91 = v98 + 4;
    if (v90 == v92)
    {
      id v7 = v109;
    }
    else
    {
      id v7 = v109;
      do
      {
        int v100 = *--v90;
        *((_DWORD *)v98 - 1) = v100;
        v98 -= 4;
      }
      while (v90 != v92);
    }
    *long long v86 = (uint64_t)v98;
    v86[1] = (uint64_t)v91;
    v86[2] = (uint64_t)v99;
    if (v92) {
      operator delete(v92);
    }
  }
  else
  {
    _DWORD *v90 = v87;
    long long v91 = v90 + 1;
    id v7 = v109;
  }
  v86[1] = (uint64_t)v91;
  sub_25C7D020C(*a1);
  uint64_t v101 = a1[3];
  uint64_t v102 = *v101;
  uint64_t v103 = v101[1];
  while (v103 != v102)
  {
    v103 -= 32;
    *(void *)buf = v103;
    sub_25C7D025C((void ***)buf);
  }
  v101[1] = v102;
  *(void *)buf = &v129;
  sub_25C7D025C((void ***)buf);
  if (SHIBYTE(v115) < 0) {
    operator delete(v114[0]);
  }
LABEL_134:
}

void sub_25C7D60C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  if (v48 < 0) {
    operator delete(*(void **)(v50 - 240));
  }
  if (a42 < 0) {
    operator delete(__p);
  }
  (*(void (**)(uint64_t))(*(void *)v49 + 16))(v49);
  if (a23 < 0) {
    operator delete(a18);
  }

  _Unwind_Resume(a1);
}

void sub_25C7D627C(long long *a1, unsigned __int16 *a2, uint64_t *a3)
{
  *((void *)&v36 + 1) = *MEMORY[0x263EF8340];
  uint64_t v6 = a3[1];
  if (*a3 == v6)
  {
LABEL_5:
    long long v27 = 0uLL;
    __int16 v29 = 0;
    uint64_t v28 = 0;
    if (*((char *)a1 + 23) < 0)
    {
      sub_25C7D059C(__p, *(void **)a1, *((void *)a1 + 1));
    }
    else
    {
      *(_OWORD *)int __p = *a1;
      long long v33 = (char *)*((void *)a1 + 2);
    }
    long long v34 = *(long long *)((char *)a1 + 24);
    uint64_t v35 = *((void *)a1 + 5);
    uint64_t v26 = 0;
    long long v25 = 0uLL;
    long long v30 = (void **)&v25;
    char v31 = 0;
    *(void *)&long long v25 = operator new(0x30uLL);
    *((void *)&v25 + 1) = v25;
    uint64_t v26 = v25 + 48;
    *((void *)&v25 + 1) = sub_25C7D6B2C((uint64_t)&v26, (long long *)__p, &v36, (char *)v25);
    sub_25C7D01D0((uint64_t *)&v27);
    long long v27 = v25;
    uint64_t v28 = v26;
    uint64_t v26 = 0;
    long long v25 = 0uLL;
    long long v30 = (void **)&v25;
    sub_25C7D025C(&v30);
    if (SHIBYTE(v33) < 0) {
      operator delete(__p[0]);
    }
    __int16 v29 = *a2;
    unint64_t v11 = a3[1];
    if (v11 >= a3[2])
    {
      uint64_t v12 = sub_25C7D757C(a3, (uint64_t)&v27);
    }
    else
    {
      sub_25C7D7508((uint64_t)a3, (uint64_t)&v27);
      uint64_t v12 = v11 + 32;
    }
    a3[1] = v12;
    __p[0] = &v27;
    sub_25C7D025C((void ***)__p);
  }
  else
  {
    uint64_t v7 = *a3 + 16;
    while (*(unsigned __int16 *)(v7 + 8) != *a2)
    {
      uint64_t v8 = v7 + 16;
      v7 += 32;
      if (v8 == v6) {
        goto LABEL_5;
      }
    }
    unint64_t v9 = *(void *)(v7 - 8);
    if (v9 >= *(void *)v7)
    {
      uint64_t v13 = *(void *)(v7 - 16);
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v13) >> 4);
      if (v14 + 1 > 0x555555555555555) {
        sub_25C7D06B8();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((*(void *)v7 - v13) >> 4);
      uint64_t v16 = 2 * v15;
      if (2 * v15 <= v14 + 1) {
        uint64_t v16 = v14 + 1;
      }
      if (v15 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v17 = 0x555555555555555;
      }
      else {
        unint64_t v17 = v16;
      }
      *((void *)&v34 + 1) = v7;
      if (v17) {
        uint64_t v18 = (char *)sub_25C7D06D0(v7, v17);
      }
      else {
        uint64_t v18 = 0;
      }
      uint64_t v21 = &v18[48 * v14];
      __p[0] = v18;
      __p[1] = v21;
      long long v33 = v21;
      *(void *)&long long v34 = &v18[48 * v17];
      if (*((char *)a1 + 23) < 0)
      {
        sub_25C7D059C(v21, *(void **)a1, *((void *)a1 + 1));
        uint64_t v21 = v33;
      }
      else
      {
        long long v22 = *a1;
        *((void *)v21 + 2) = *((void *)a1 + 2);
        *(_OWORD *)uint64_t v21 = v22;
      }
      uint64_t v23 = &v18[48 * v14];
      long long v24 = *(long long *)((char *)a1 + 24);
      *((void *)v23 + 5) = *((void *)a1 + 5);
      *(_OWORD *)(v23 + 24) = v24;
      long long v33 = v21 + 48;
      sub_25C7D0640((uint64_t *)(v7 - 16), __p);
      unint64_t v20 = *(void *)(v7 - 8);
      sub_25C7D0848((uint64_t)__p);
    }
    else
    {
      if (*((char *)a1 + 23) < 0)
      {
        sub_25C7D059C(*(unsigned char **)(v7 - 8), *(void **)a1, *((void *)a1 + 1));
      }
      else
      {
        long long v10 = *a1;
        *(void *)(v9 + 16) = *((void *)a1 + 2);
        *(_OWORD *)unint64_t v9 = v10;
      }
      long long v19 = *(long long *)((char *)a1 + 24);
      *(void *)(v9 + 40) = *((void *)a1 + 5);
      *(_OWORD *)(v9 + 24) = v19;
      unint64_t v20 = v9 + 48;
      *(void *)(v7 - 8) = v9 + 48;
    }
    *(void *)(v7 - 8) = v20;
  }
}

void sub_25C7D6574(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  *(void *)(v24 - 8) = v25;
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C7D65DC(uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - *a1) >> 4);
    unint64_t v12 = v11 + 1;
    if (v11 + 1 > 0x555555555555555) {
      sub_25C7D06B8();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - *a1) >> 4);
    if (2 * v13 > v12) {
      unint64_t v12 = 2 * v13;
    }
    if (v13 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v14 = 0x555555555555555;
    }
    else {
      unint64_t v14 = v12;
    }
    v20[4] = v4;
    if (v14) {
      unint64_t v15 = (char *)sub_25C7D06D0(v4, v14);
    }
    else {
      unint64_t v15 = 0;
    }
    uint64_t v16 = &v15[48 * v11];
    v20[0] = v15;
    v20[1] = v16;
    v20[3] = &v15[48 * v14];
    long long v17 = *a2;
    *((void *)v16 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v16 = v17;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v18 = *(long long *)((char *)a2 + 24);
    *((void *)v16 + 5) = *((void *)a2 + 5);
    *(_OWORD *)(v16 + 24) = v18;
    v20[2] = v16 + 48;
    sub_25C7D0640(a1, v20);
    uint64_t v10 = a1[1];
    sub_25C7D0848((uint64_t)v20);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    long long v9 = *(long long *)((char *)a2 + 24);
    *(void *)(v7 + 40) = *((void *)a2 + 5);
    *(_OWORD *)(v7 + 24) = v9;
    uint64_t v10 = v7 + 48;
    a1[1] = v7 + 48;
  }
  a1[1] = v10;
  return v10 - 48;
}

void sub_25C7D6728(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C7D0848((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7D673C(uint64_t a1, const char *a2, char *a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  *(void *)(a1 + 24) = a2;
  sub_25C821A30((uint64_t)a2, a2, &__p);
  sub_25C7D693C((void **)(a1 + 32), &__p);
  if (v28 < 0) {
    operator delete(__p);
  }
  unint64_t v12 = *(std::__shared_weak_count **)a6;
  uint64_t v11 = *(void *)(a6 + 8);
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v13 = *(std::__shared_weak_count **)(a1 + 64);
  *(void *)(a1 + 56) = v12;
  *(void *)(a1 + 64) = v11;
  if (v13)
  {
    sub_25C7D2280(v13);
    unint64_t v12 = *(std::__shared_weak_count **)(a1 + 56);
  }
  if (v12) {
    goto LABEL_13;
  }
  if (*(char *)(a1 + 55) < 0)
  {
    unint64_t v15 = *(skit::internal **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
  }
  else
  {
    uint64_t v14 = *(unsigned __int8 *)(a1 + 55);
    unint64_t v15 = (skit::internal *)(a1 + 32);
  }
  int v16 = (a5 >> 3) & ((*(unsigned char *)(sub_25C7D8CCC((uint64_t)&off_2654BB5F0, v15, v14) + 32) & 0x40) >> 6);
  long long v17 = (std::__shared_weak_count *)operator new(0xC0uLL);
  v17->__shared_owners_ = 0;
  v17->__shared_weak_owners_ = 0;
  v17->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709DF190;
  unint64_t v12 = v17 + 1;
  sub_25C820154((uint64_t)&v17[1], a1 + 32, a3, a4, v16);
  long long v18 = *(std::__shared_weak_count **)(a1 + 64);
  *(void *)(a1 + 56) = v17 + 1;
  *(void *)(a1 + 64) = v17;
  if (v18)
  {
    sub_25C7D2280(v18);
    unint64_t v12 = *(std::__shared_weak_count **)(a1 + 56);
LABEL_13:
    long long v17 = *(std::__shared_weak_count **)(a1 + 64);
  }
  long long v19 = operator new(0x100uLL);
  unint64_t v20 = v19;
  v19[1] = 0;
  v19[2] = 0;
  *long long v19 = &unk_2709DF1E0;
  uint64_t v21 = v19 + 3;
  uint64_t v22 = *(void *)(a1 + 104);
  uint64_t v23 = *(void *)(a1 + 112);
  int __p = v12;
  long long v27 = v17;
  if (v17) {
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  sub_25C7CC2B8((uint64_t)(v19 + 3), (skit::internal *)(a1 + 32), a5, v22, v23, (uint64_t)&__p);
  if (v27) {
    sub_25C7D2280(v27);
  }
  uint64_t v24 = *(std::__shared_weak_count **)(a1 + 80);
  *(void *)(a1 + 72) = v21;
  *(void *)(a1 + 80) = v20;
  if (v24) {
    sub_25C7D2280(v24);
  }
  return 0;
}

void sub_25C7D68F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  std::__shared_weak_count::~__shared_weak_count(v15);
  operator delete(v17);
  _Unwind_Resume(a1);
}

void **sub_25C7D693C(void **result, void **a2)
{
  if (result != a2)
  {
    if (*((char *)result + 23) < 0)
    {
      unint64_t v3 = (unint64_t)a2[1];
      if (*((char *)a2 + 23) >= 0)
      {
        unint64_t v4 = *((unsigned __int8 *)a2 + 23);
      }
      else
      {
        a2 = (void **)*a2;
        unint64_t v4 = v3;
      }
      return sub_25C7D7A48(result, a2, v4);
    }
    else if ((*((unsigned char *)a2 + 23) & 0x80) != 0)
    {
      return (void **)sub_25C7D79D4(result, *a2, (unint64_t)a2[1]);
    }
    else
    {
      long long v2 = *(_OWORD *)a2;
      result[2] = a2[2];
      *(_OWORD *)uint64_t result = v2;
    }
  }
  return result;
}

uint64_t sub_25C7D698C(uint64_t a1, long long *a2, _DWORD *a3, int *a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_25C7D059C(&v10, *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v10 = *a2;
    uint64_t v11 = *((void *)a2 + 2);
  }
  __int16 v7 = *a3;
  int v8 = *a4;
  *(_OWORD *)a1 = v10;
  *(void *)(a1 + 16) = v11;
  *(void *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 32) = v8;
  *(_WORD *)(a1 + 36) = 0;
  *(_WORD *)(a1 + 38) = v7;
  *(_WORD *)(a1 + 40) = 3;
  *(_DWORD *)(a1 + 44) = 0;
  return a1;
}

void *sub_25C7D6A24(void *a1)
{
  if (*((unsigned char *)a1 + 8) && *a1) {
    (*(void (**)(void))(*(void *)*a1 + 8))(*a1);
  }
  *a1 = 0;
  *((unsigned char *)a1 + 8) = 0;
  return a1;
}

void *sub_25C7D6A8C(void *result)
{
  uint64_t v1 = result;
  uint64_t v2 = result[5];
  if (v2)
  {
    uint64_t v3 = *result;
    if (*v1)
    {
      uint64_t result = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 24))(v3);
    }
    else
    {
      unint64_t v4 = &unk_2709DF130;
      uint64_t result = (void *)MEMORY[0x261194450](v2, 0x1000C8077774924);
    }
  }
  v1[5] = 0;
  return result;
}

char *sub_25C7D6B2C(uint64_t a1, long long *a2, long long *a3, char *__dst)
{
  unint64_t v4 = __dst;
  unint64_t v13 = __dst;
  uint64_t v14 = __dst;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  char v12 = 0;
  if (a2 != a3)
  {
    unint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_25C7D059C(v4, *(void **)v6, *((void *)v6 + 1));
        int v8 = v14;
      }
      else
      {
        long long v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)unint64_t v4 = v7;
        int v8 = v4;
      }
      long long v9 = *(long long *)((char *)v6 + 24);
      *((void *)v4 + 5) = *((void *)v6 + 5);
      *(_OWORD *)(v4 + 24) = v9;
      v6 += 3;
      unint64_t v4 = v8 + 48;
      uint64_t v14 = v8 + 48;
    }
    while (v6 != a3);
  }
  char v12 = 1;
  sub_25C7D3770((uint64_t)v11);
  return v4;
}

void sub_25C7D6BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_25C7D6C00(void *a1)
{
  uint64_t v2 = a1[11];
  if (v2)
  {
    sub_25C7D6C60(a1[11], *(void **)(v2 + 8));
    MEMORY[0x261194470](v2, 0x1060C40C2B13FB5);
  }
  return sub_25C7D6A24(a1);
}

void sub_25C7D6C60(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_25C7D6C60(a1, *a2);
    sub_25C7D6C60(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_25C7D6CB4(uint64_t *a1, uint64_t a2, long long *a3, long long *a4, uint64_t a5)
{
  if (a5 < 1) {
    return;
  }
  unint64_t v6 = a3;
  uint64_t v7 = a2;
  uint64_t v11 = a1[2];
  uint64_t v9 = (uint64_t)(a1 + 2);
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v12) >> 4)) < a5)
  {
    uint64_t v13 = *a1;
    unint64_t v14 = a5 - 0x5555555555555555 * ((uint64_t)(v12 - *a1) >> 4);
    if (v14 > 0x555555555555555) {
      sub_25C7D06B8();
    }
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((a2 - v13) >> 4);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v13) >> 4);
    uint64_t v17 = 2 * v16;
    if (2 * v16 <= v14) {
      uint64_t v17 = v14;
    }
    if (v16 >= 0x2AAAAAAAAAAAAAALL) {
      unint64_t v18 = 0x555555555555555;
    }
    else {
      unint64_t v18 = v17;
    }
    uint64_t v37 = v9;
    if (v18) {
      long long v19 = (char *)sub_25C7D06D0(v9, v18);
    }
    else {
      long long v19 = 0;
    }
    __int16 v29 = &v19[48 * v15];
    long long v33 = v19;
    long long v34 = v29;
    long long v36 = &v19[48 * v18];
    long long v30 = &v29[48 * a5];
    do
    {
      long long v31 = *v6;
      *((void *)v29 + 2) = *((void *)v6 + 2);
      *(_OWORD *)__int16 v29 = v31;
      *((void *)v6 + 1) = 0;
      *((void *)v6 + 2) = 0;
      *(void *)unint64_t v6 = 0;
      long long v32 = *(long long *)((char *)v6 + 24);
      *((void *)v29 + 5) = *((void *)v6 + 5);
      *(_OWORD *)(v29 + 24) = v32;
      v29 += 48;
      v6 += 3;
    }
    while (v29 != v30);
    uint64_t v35 = (unint64_t *)v30;
    sub_25C7D6FC4((uint64_t)a1, &v33, (long long *)v7);
    sub_25C7D0848((uint64_t)&v33);
    return;
  }
  uint64_t v20 = v12 - a2;
  if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - a2) >> 4)) >= a5)
  {
    uint64_t v21 = &a3[3 * a5];
LABEL_19:
    sub_25C7D6F3C((uint64_t)a1, v7, v12, v7 + 48 * a5);
    for (; v6 != v21; v6 += 3)
    {
      if (*(char *)(v7 + 23) < 0) {
        operator delete(*(void **)v7);
      }
      long long v27 = *v6;
      *(void *)(v7 + 16) = *((void *)v6 + 2);
      *(_OWORD *)uint64_t v7 = v27;
      *((unsigned char *)v6 + 23) = 0;
      *(_WORD *)unint64_t v6 = 0;
      long long v28 = *(long long *)((char *)v6 + 24);
      *(void *)(v7 + 40) = *((void *)v6 + 5);
      *(_OWORD *)(v7 + 24) = v28;
      v7 += 48;
    }
    return;
  }
  uint64_t v38 = *(void *)(v9 - 8);
  unint64_t v39 = v12;
  uint64_t v21 = &a3[(uint64_t)(v12 - a2) >> 4];
  long long v33 = (char *)v9;
  long long v34 = (char *)&v38;
  uint64_t v35 = &v39;
  unint64_t v22 = v12;
  if (v21 != a4)
  {
    uint64_t v23 = &a3[(uint64_t)(v12 - a2) >> 4];
    unint64_t v24 = v12;
    do
    {
      long long v25 = *v23;
      *(void *)(v24 + 16) = *((void *)v23 + 2);
      *(_OWORD *)unint64_t v24 = v25;
      *((void *)v23 + 1) = 0;
      *((void *)v23 + 2) = 0;
      *(void *)uint64_t v23 = 0;
      long long v26 = *(long long *)((char *)v23 + 24);
      *(void *)(v24 + 40) = *((void *)v23 + 5);
      *(_OWORD *)(v24 + 24) = v26;
      v24 += 48;
      v22 += 48;
      v23 += 3;
    }
    while (v23 != a4);
    unint64_t v39 = v24;
  }
  LOBYTE(v36) = 1;
  sub_25C7D3770((uint64_t)&v33);
  a1[1] = v22;
  if (v20 >= 1) {
    goto LABEL_19;
  }
}

void sub_25C7D6F28(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C7D0848((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7D6F3C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 8);
  unint64_t v7 = a2 + v6 - a4;
  uint64_t v8 = v6;
  if (v7 < a3)
  {
    unint64_t v9 = v7;
    uint64_t v8 = *(void *)(a1 + 8);
    do
    {
      long long v10 = *(_OWORD *)v9;
      *(void *)(v8 + 16) = *(void *)(v9 + 16);
      *(_OWORD *)uint64_t v8 = v10;
      *(void *)(v9 + 8) = 0;
      *(void *)(v9 + 16) = 0;
      *(void *)unint64_t v9 = 0;
      long long v11 = *(_OWORD *)(v9 + 24);
      *(void *)(v8 + 40) = *(void *)(v9 + 40);
      *(_OWORD *)(v8 + 24) = v11;
      v8 += 48;
      v9 += 48;
    }
    while (v9 < a3);
  }
  *(void *)(a1 + 8) = v8;
  return sub_25C7D7078((uint64_t)&v13, a2, v7, v6);
}

uint64_t sub_25C7D6FC4(uint64_t a1, void *a2, long long *a3)
{
  uint64_t v6 = a2[1];
  uint64_t v7 = a1 + 16;
  sub_25C7D0718(a1 + 16, (uint64_t)a3, (uint64_t)a3, *(void *)a1, *(void *)a1, v6, v6);
  a2[1] = v8;
  a2[2] = sub_25C7D7120(v7, a3, *(long long **)(a1 + 8), a2[2]);
  uint64_t v9 = *(void *)a1;
  *(void *)a1 = a2[1];
  a2[1] = v9;
  uint64_t v10 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = a2[2];
  a2[2] = v10;
  uint64_t v11 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return v6;
}

uint64_t sub_25C7D7078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a4 + v7;
      uint64_t v9 = (void **)(a4 + v7 - 48);
      if (*(char *)(a4 + v7 - 25) < 0) {
        operator delete(*v9);
      }
      uint64_t v10 = (long long *)(a3 + v7 - 48);
      long long v11 = *v10;
      *(void *)(a4 + v7 - 32) = *(void *)(a3 + v7 - 32);
      *(_OWORD *)uint64_t v9 = v11;
      *(unsigned char *)(a3 + v7 - 25) = 0;
      *(_WORD *)uint64_t v10 = 0;
      long long v12 = *(_OWORD *)(a3 + v7 - 24);
      *(void *)(v8 - 8) = *(void *)(a3 + v7 - 8);
      *(_OWORD *)(v8 - 24) = v12;
      v7 -= 48;
    }
    while (a3 + v7 != a2);
  }
  return a3;
}

uint64_t sub_25C7D7120(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v11 = a4;
  uint64_t v10 = a4;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  if (a2 != a3)
  {
    do
    {
      long long v5 = *a2;
      *(void *)(v4 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v4 = v5;
      *((void *)a2 + 1) = 0;
      *((void *)a2 + 2) = 0;
      *(void *)a2 = 0;
      long long v6 = *(long long *)((char *)a2 + 24);
      *(void *)(v4 + 40) = *((void *)a2 + 5);
      *(_OWORD *)(v4 + 24) = v6;
      v4 += 48;
      a2 += 3;
    }
    while (a2 != a3);
    uint64_t v11 = v4;
  }
  char v9 = 1;
  sub_25C7D3770((uint64_t)v8);
  return v4;
}

long long *sub_25C7D71B8(uint64_t *a1, long long *a2, long long *a3, long long *a4, uint64_t a5)
{
  long long v5 = a2;
  if (a5 >= 1)
  {
    uint64_t v11 = a1[2];
    uint64_t v9 = (uint64_t)(a1 + 2);
    uint64_t v10 = v11;
    unint64_t v12 = *(void *)(v9 - 8);
    if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v12) >> 4)) >= a5)
    {
      uint64_t v20 = v12 - (void)a2;
      if ((uint64_t)(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - (void)a2) >> 4)) >= a5)
      {
        uint64_t v21 = &a3[3 * a5];
      }
      else
      {
        uint64_t v21 = &a3[(uint64_t)(v12 - (void)a2) >> 4];
        a1[1] = (uint64_t)sub_25C7D369C(v9, v21, a4, *(char **)(v9 - 8));
        if (v20 < 1) {
          return v5;
        }
      }
      sub_25C7D6F3C((uint64_t)a1, (uint64_t)v5, v12, (uint64_t)&v5[3 * a5]);
      sub_25C7D7420((uint64_t)a3, (uint64_t)v21, (uint64_t)v5);
    }
    else
    {
      uint64_t v13 = *a1;
      unint64_t v14 = a5 - 0x5555555555555555 * ((uint64_t)(v12 - *a1) >> 4);
      if (v14 > 0x555555555555555) {
        sub_25C7D06B8();
      }
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - v13) >> 4);
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v10 - v13) >> 4);
      uint64_t v17 = 2 * v16;
      if (2 * v16 <= v14) {
        uint64_t v17 = v14;
      }
      if (v16 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v18 = 0x555555555555555;
      }
      else {
        unint64_t v18 = v17;
      }
      uint64_t v27 = v9;
      if (v18) {
        long long v19 = (char *)sub_25C7D06D0(v9, v18);
      }
      else {
        long long v19 = 0;
      }
      uint64_t v23 = v19;
      unint64_t v24 = &v19[48 * v15];
      long long v25 = v24;
      long long v26 = &v19[48 * v18];
      sub_25C7D737C(&v23, a3, a5);
      long long v5 = (long long *)sub_25C7D6FC4((uint64_t)a1, &v23, v5);
      sub_25C7D0848((uint64_t)&v23);
    }
  }
  return v5;
}

void sub_25C7D735C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  *(void *)(v10 + 8) = v11;
  _Unwind_Resume(exception_object);
}

void *sub_25C7D737C(void *result, long long *a2, uint64_t a3)
{
  uint64_t v3 = result;
  uint64_t v4 = result[2];
  if (a3)
  {
    uint64_t v6 = v4 + 48 * a3;
    uint64_t v7 = 48 * a3;
    do
    {
      if (*((char *)a2 + 23) < 0)
      {
        uint64_t result = sub_25C7D059C((unsigned char *)v4, *(void **)a2, *((void *)a2 + 1));
      }
      else
      {
        long long v8 = *a2;
        *(void *)(v4 + 16) = *((void *)a2 + 2);
        *(_OWORD *)uint64_t v4 = v8;
      }
      long long v9 = *(long long *)((char *)a2 + 24);
      *(void *)(v4 + 40) = *((void *)a2 + 5);
      *(_OWORD *)(v4 + 24) = v9;
      v4 += 48;
      a2 += 3;
      v7 -= 48;
    }
    while (v7);
    uint64_t v4 = v6;
  }
  v3[2] = v4;
  return result;
}

void sub_25C7D7418(_Unwind_Exception *a1)
{
  *(void *)(v1 + 16) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_25C7D7420(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1;
  if (a1 == a2) {
    return a1;
  }
  uint64_t v5 = a2;
  do
  {
    sub_25C7D693C((void **)a3, (void **)v4);
    uint64_t v6 = *(void *)(v4 + 40);
    *(_OWORD *)(a3 + 24) = *(_OWORD *)(v4 + 24);
    *(void *)(a3 + 40) = v6;
    a3 += 48;
    v4 += 48;
  }
  while (v4 != v5);
  return v5;
}

void sub_25C7D7494(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void **)**a1;
  if (v2)
  {
    uint64_t v4 = (void **)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 4;
        uint64_t v6 = v4;
        sub_25C7D025C(&v6);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *sub_25C7D7508(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(void *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = 0;
  *(void *)(v4 + 16) = 0;
  uint64_t result = sub_25C7D35C0((char *)v4, *(long long **)a2, *(long long **)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 4));
  *(_WORD *)(v4 + 24) = *(_WORD *)(a2 + 24);
  *(void *)(a1 + 8) = v4 + 32;
  return result;
}

void sub_25C7D7574(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_25C7D757C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 5;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59) {
    sub_25C7D06B8();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 4 > v5) {
    unint64_t v5 = v8 >> 4;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v17 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_25C7D7700(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = &v10[32 * v4];
  v14[0] = v10;
  v14[1] = v11;
  unint64_t v15 = v11;
  unint64_t v16 = &v10[32 * v9];
  *(void *)uint64_t v11 = 0;
  *((void *)v11 + 1) = 0;
  *((void *)v11 + 2) = 0;
  sub_25C7D35C0(v11, *(long long **)a2, *(long long **)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 4));
  *((_WORD *)v11 + 12) = *(_WORD *)(a2 + 24);
  v15 += 32;
  sub_25C7D7688(a1, v14);
  uint64_t v12 = a1[1];
  sub_25C7D7868(v14);
  return v12;
}

void sub_25C7D7674(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C7D7868((void **)va);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7D7688(uint64_t *a1, void *a2)
{
  uint64_t result = sub_25C7D7738((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_25C7D7700(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    sub_25C7D019C();
  }
  return operator new(32 * a2);
}

uint64_t sub_25C7D7738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(void *)(v7 - 32) = 0;
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      long long v8 = *(_OWORD *)(a3 - 32);
      a3 -= 32;
      *(_OWORD *)(v7 - 32) = v8;
      *(void *)(v7 - 16) = *(void *)(a3 + 16);
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(_WORD *)(v7 - 8) = *(_WORD *)(a3 + 24);
      uint64_t v7 = *((void *)&v14 + 1) - 32;
      *((void *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  sub_25C7D77E4((uint64_t)v11);
  return v9;
}

uint64_t sub_25C7D77E4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    sub_25C7D781C(a1);
  }
  return a1;
}

void sub_25C7D781C(uint64_t a1)
{
  uint64_t v1 = *(void ***)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void ***)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = v1;
    sub_25C7D025C(&v3);
    v1 += 4;
  }
}

void **sub_25C7D7868(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_25C7D789C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    uint64_t v4 = (void **)(i - 32);
    *(void *)(a1 + 16) = v4;
    uint64_t v5 = v4;
    sub_25C7D025C(&v5);
  }
}

unsigned char *sub_25C7D78F0(unsigned char *__dst, char *__src)
{
  if (!*(_WORD *)__src)
  {
    unint64_t v7 = 0;
    __dst[23] = 0;
    goto LABEL_9;
  }
  size_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    int v6 = *(unsigned __int16 *)&__src[v4 + 2];
    --v5;
    v4 += 2;
  }
  while (v6);
  unint64_t v7 = -v5;
  if ((unint64_t)-v5 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C7D00F4();
  }
  if (v7 >= 0xB)
  {
    uint64_t v9 = (v7 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((v7 | 3) != 0xB) {
      uint64_t v9 = v7 | 3;
    }
    long long v8 = sub_25C7D04E8((uint64_t)__dst, v9 + 1);
    *((void *)__dst + 1) = v7;
    *((void *)__dst + 2) = v10 | 0x8000000000000000;
    *(void *)long long __dst = v8;
    goto LABEL_13;
  }
  __dst[23] = v7;
  long long v8 = __dst;
  if (v5)
  {
LABEL_13:
    memmove(v8, __src, v4);
    goto LABEL_14;
  }
  unint64_t v7 = 0;
LABEL_9:
  long long v8 = __dst;
LABEL_14:
  *((_WORD *)v8 + v7) = 0;
  return __dst;
}

unsigned char *sub_25C7D79D4(unsigned char *__dst, void *__src, unint64_t a3)
{
  BOOL v5 = a3 > 0xA;
  unint64_t v6 = a3 - 10;
  if (v5)
  {
    sub_25C7D0998((uint64_t)__dst, 0xAuLL, v6, __dst[23] & 0x7F, 0, __dst[23] & 0x7F, a3, __src);
  }
  else
  {
    __dst[23] = a3;
    if (a3) {
      memmove(__dst, __src, 2 * a3);
    }
    *(_WORD *)&__dst[2 * a3] = 0;
  }
  return __dst;
}

void **sub_25C7D7A48(void **a1, void *__src, unint64_t a3)
{
  unint64_t v5 = (unint64_t)a1[2] & 0x7FFFFFFFFFFFFFFFLL;
  if (v5 <= a3)
  {
    sub_25C7D0998((uint64_t)a1, v5 - 1, a3 - v5 + 1, (uint64_t)a1[1], 0, (uint64_t)a1[1], a3, __src);
  }
  else
  {
    unint64_t v6 = *a1;
    a1[1] = (void *)a3;
    if (a3) {
      memmove(v6, __src, 2 * a3);
    }
    *((_WORD *)v6 + a3) = 0;
  }
  return a1;
}

void sub_25C7D7AD4(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709DF190;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25C7D7AF4(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709DF190;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x261194470);
}

void sub_25C7D7B48(uint64_t a1)
{
}

void sub_25C7D7B54(morphun::util::ULocale *this)
{
  uint64_t v2 = *((void *)this + 19);
  *((void *)this + 19) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }
  uint64_t v3 = *((void *)this + 17);
  *((void *)this + 17) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
  }
  uint64_t v4 = *((void *)this + 16);
  *((void *)this + 16) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
  }
  morphun::util::ULocale::~ULocale(this);
}

void sub_25C7D7C18(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709DF1E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25C7D7C38(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709DF1E0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x261194470);
}

uint64_t sub_25C7D7C8C(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

uint64_t **sub_25C7D7CB4@<X0>(uint64_t **result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v3 = *result;
  uint64_t v38 = result[1];
  if (*result != v38)
  {
    uint64_t v37 = (uint64_t)(a2 + 2);
LABEL_3:
    if ((v3[5] & 1) == 0) {
      goto LABEL_33;
    }
    if (*((char *)v3 + 23) < 0)
    {
      unint64_t v5 = (uint64_t *)*v3;
      uint64_t v4 = v3[1];
    }
    else
    {
      LODWORD(v4) = *((unsigned __int8 *)v3 + 23);
      unint64_t v5 = v3;
    }
    if ((int)v4 < 1)
    {
LABEL_32:
      uint64_t result = (uint64_t **)sub_25C7D65DC(a2, (long long *)v3);
      goto LABEL_33;
    }
    int v6 = 0;
    int v7 = 0;
    while (1)
    {
      uint64_t v8 = v7 + 1;
      if ((*((_WORD *)v5 + v7) & 0xFC00) != 0xD800 || v8 == v4)
      {
        ++v7;
      }
      else if ((*((_WORD *)v5 + v8) & 0xFC00) == 0xDC00)
      {
        v7 += 2;
      }
      else
      {
        ++v7;
      }
      LODWORD(v42) = 0;
      unsigned int Script = uscript_getScript();
      if ((int)v42 > 0) {
        goto LABEL_32;
      }
      if (Script > 0x36) {
        break;
      }
      if (((1 << Script) & 0x40000000520020) != 0) {
        goto LABEL_28;
      }
      if (((1 << Script) & 3) == 0) {
        break;
      }
LABEL_29:
      if (v7 >= (int)v4)
      {
        if (v6)
        {
          int v41 = 0;
          uint64_t result = (uint64_t **)ubrk_open();
          if (v41 < 1)
          {
            int v12 = ubrk_first();
            if (v12 != -1)
            {
              while (1)
              {
                int v13 = ubrk_next();
                int v14 = v13;
                if (v13 == -1) {
                  goto LABEL_66;
                }
                if (*((char *)v3 + 23) < 0)
                {
                  unint64_t v15 = v3[1];
                  if (v15 < v12) {
LABEL_68:
                  }
                    sub_25C7D8D74();
                  unint64_t v16 = (uint64_t *)*v3;
                }
                else
                {
                  unint64_t v15 = *((unsigned __int8 *)v3 + 23);
                  unint64_t v16 = v3;
                  if (v15 < v12) {
                    goto LABEL_68;
                  }
                }
                unint64_t v17 = v15 - v12;
                if (v17 >= v13 - v12) {
                  unint64_t v18 = v13 - v12;
                }
                else {
                  unint64_t v18 = v17;
                }
                if (v18 >= 0x7FFFFFFFFFFFFFF8) {
                  sub_25C7D00F4();
                }
                if (v18 >= 0xB) {
                  break;
                }
                HIBYTE(v40) = v18;
                p_dst = (void **)&__dst;
                if (v18) {
                  goto LABEL_53;
                }
LABEL_54:
                *((_WORD *)p_dst + v18) = 0;
                unint64_t v22 = a2[1];
                unint64_t v23 = a2[2];
                if (v22 >= v23)
                {
                  unint64_t v27 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v22 - *a2) >> 4);
                  unint64_t v28 = v27 + 1;
                  if (v27 + 1 > 0x555555555555555) {
                    sub_25C7D06B8();
                  }
                  unint64_t v29 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - *a2) >> 4);
                  if (2 * v29 > v28) {
                    unint64_t v28 = 2 * v29;
                  }
                  if (v29 >= 0x2AAAAAAAAAAAAAALL) {
                    unint64_t v30 = 0x555555555555555;
                  }
                  else {
                    unint64_t v30 = v28;
                  }
                  uint64_t v45 = v37;
                  long long v31 = (char *)sub_25C7D06D0(v37, v30);
                  long long v32 = &v31[48 * v27];
                  *(void *)&long long v42 = v31;
                  *((void *)&v42 + 1) = v32;
                  uint64_t v44 = &v31[48 * v33];
                  long long v34 = __dst;
                  *(void *)&v46[7] = *(void *)((char *)&v40 + 7);
                  *(void *)float v46 = v40;
                  char v35 = HIBYTE(v40);
                  long long v40 = 0uLL;
                  long long __dst = 0;
                  uint64_t v36 = *(void *)v46;
                  *(void *)long long v32 = v34;
                  *((void *)v32 + 1) = v36;
                  *(void *)(v32 + 15) = *(void *)&v46[7];
                  v32[23] = v35;
                  *((void *)v32 + 3) = 0;
                  *((void *)v32 + 4) = 0x100003F800000;
                  *((_WORD *)v32 + 20) = 3;
                  *((_DWORD *)v32 + 11) = 0;
                  uint64_t v43 = v32 + 48;
                  sub_25C7D0640(a2, &v42);
                  uint64_t v26 = a2[1];
                  sub_25C7D0848((uint64_t)&v42);
                }
                else
                {
                  unint64_t v24 = __dst;
                  *(void *)&long long v42 = v40;
                  *(void *)((char *)&v42 + 7) = *(void *)((char *)&v40 + 7);
                  char v25 = HIBYTE(v40);
                  long long v40 = 0uLL;
                  long long __dst = 0;
                  *(void *)unint64_t v22 = v24;
                  *(void *)(v22 + 8) = v42;
                  *(void *)(v22 + 15) = *(void *)((char *)&v42 + 7);
                  *(unsigned char *)(v22 + 23) = v25;
                  *(void *)(v22 + 24) = 0;
                  *(void *)(v22 + 32) = 0x100003F800000;
                  *(_WORD *)(v22 + 40) = 3;
                  *(_DWORD *)(v22 + 44) = 0;
                  uint64_t v26 = v22 + 48;
                }
                a2[1] = v26;
                if (SHIBYTE(v40) < 0)
                {
                  operator delete(__dst);
                  uint64_t v26 = a2[1];
                }
                *(void *)(v26 - 24) = (*((_DWORD *)v3 + 6) + v12) | ((unint64_t)(*((_DWORD *)v3 + 6) + v14) << 32);
                *(_DWORD *)(v26 - 16) = *((_DWORD *)v3 + 8);
                *(_WORD *)(v26 - 12) = *((_WORD *)v3 + 18);
                *(_DWORD *)(v26 - 10) = *(_DWORD *)((char *)v3 + 38);
                int v12 = v14;
              }
              uint64_t v20 = (v18 & 0xFFFFFFFFFFFFFFFCLL) + 4;
              if ((v18 | 3) != 0xB) {
                uint64_t v20 = v18 | 3;
              }
              p_dst = (void **)sub_25C7D04E8((uint64_t)&__dst, v20 + 1);
              *(void *)&long long v40 = v18;
              *((void *)&v40 + 1) = v21 | 0x8000000000000000;
              long long __dst = p_dst;
LABEL_53:
              memmove(p_dst, (char *)v16 + 2 * v12, 2 * v18);
              goto LABEL_54;
            }
LABEL_66:
            uint64_t result = (uint64_t **)ubrk_close();
          }
LABEL_33:
          v3 += 6;
          if (v3 == v38) {
            return result;
          }
          goto LABEL_3;
        }
        goto LABEL_32;
      }
    }
    BOOL v11 = Script - 73 > 0x20 || ((1 << (Script - 73)) & 0x100000003) == 0;
    if (v11 && Script != 172) {
      goto LABEL_32;
    }
LABEL_28:
    ++v6;
    goto LABEL_29;
  }
  return result;
}

void sub_25C7D8160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, char a20)
{
}

void sub_25C7D81BC(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 4) >= 2)
  {
    int v29 = -1;
    unint64_t v6 = 1;
    do
    {
      unint64_t v7 = v6 - 1;
      unint64_t v8 = v5 + 48 * (v6 - 1);
      if (*(char *)(v8 + 23) < 0)
      {
        sub_25C7D059C(__dst, *(void **)v8, *(void *)(v8 + 8));
        uint64_t v10 = *a1;
      }
      else
      {
        long long v9 = *(_OWORD *)v8;
        uint64_t v41 = *(void *)(v8 + 16);
        *(_OWORD *)long long __dst = v9;
        uint64_t v10 = v5;
      }
      uint64_t v11 = v5 + 48 * v7;
      long long v12 = *(_OWORD *)(v11 + 24);
      *(void *)&v42[16] = *(void *)(v11 + 40);
      *(_OWORD *)long long v42 = v12;
      unint64_t v13 = v10 + 48 * v6;
      if (*(char *)(v13 + 23) < 0)
      {
        sub_25C7D059C(__p, *(void **)v13, *(void *)(v13 + 8));
      }
      else
      {
        long long v14 = *(_OWORD *)v13;
        uint64_t v37 = *(void *)(v13 + 16);
        *(_OWORD *)int __p = v14;
      }
      unint64_t v15 = v10 + 48 * v6;
      long long v16 = *(_OWORD *)(v15 + 24);
      uint64_t v39 = *(void *)(v15 + 40);
      long long v38 = v16;
      if (*(_DWORD *)&v42[4] != v16 || (v42[16] & 2) == 0) {
        goto LABEL_15;
      }
      if ((v39 & 2) != 0)
      {
        if (v7 != v29)
        {
          v32[0] = (void *)(MEMORY[0x263F8C780] + 16);
          v32[1] = (void *)(MEMORY[0x263F8C780] + 64);
          LODWORD(v33) = 1065353216;
          WORD2(v33) = 5;
          if (skit::EmojiFilter::filter()) {
            goto LABEL_15;
          }
          unint64_t v17 = HIBYTE(v41);
          if (v41 >= 0) {
            unint64_t v18 = __dst;
          }
          else {
            unint64_t v18 = (void **)__dst[0];
          }
          if (v41 < 0) {
            unint64_t v17 = (unint64_t)__dst[1];
          }
          if (v17)
          {
            for (uint64_t i = 2 * v17; i; i -= 2)
            {
              uint64_t v20 = *(unsigned __int16 *)v18;
              if (v20 > 0xFF) {
                goto LABEL_65;
              }
              int v21 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v20 + 60);
              if ((v21 & 0x400) != 0) {
                goto LABEL_15;
              }
              if (v20 <= 0x7F)
              {
                if ((v21 & 0x2000) != 0) {
                  goto LABEL_15;
                }
              }
              else
              {
LABEL_65:
                if (__maskrune(v20, 0x2000uLL)) {
                  goto LABEL_15;
                }
              }
              unint64_t v18 = (void **)((char *)v18 + 2);
            }
          }
        }
        v32[0] = (void *)(MEMORY[0x263F8C780] + 16);
        v32[1] = (void *)(MEMORY[0x263F8C780] + 64);
        LODWORD(v33) = 1065353216;
        WORD2(v33) = 5;
        if ((skit::EmojiFilter::filter() & 1) == 0)
        {
          unint64_t v22 = HIBYTE(v37);
          if (v37 >= 0) {
            unint64_t v23 = __p;
          }
          else {
            unint64_t v23 = (void **)__p[0];
          }
          if (v37 < 0) {
            unint64_t v22 = (unint64_t)__p[1];
          }
          if (v22)
          {
            for (uint64_t j = 2 * v22; j; j -= 2)
            {
              uint64_t v25 = *(unsigned __int16 *)v23;
              if (v25 > 0xFF) {
                goto LABEL_66;
              }
              int v26 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v25 + 60);
              if ((v26 & 0x400) != 0) {
                goto LABEL_14;
              }
              if (v25 <= 0x7F)
              {
                if ((v26 & 0x2000) != 0) {
                  goto LABEL_14;
                }
              }
              else
              {
LABEL_66:
                if (__maskrune(v25, 0x2000uLL)) {
                  goto LABEL_14;
                }
              }
              unint64_t v23 = (void **)((char *)v23 + 2);
            }
          }
          *(_OWORD *)long long v32 = 0u;
          long long v33 = 0u;
          *(void *)long long v34 = 0x100003F800000;
          *(_WORD *)&v34[8] = 3;
          int v35 = 0;
          uint64_t v27 = a1[1];
          if (*(_DWORD *)(v27 - 20) == v38)
          {
            sub_25C7D8688((uint64_t)&v30, (const void **)(v27 - 48), (const void **)__p);
            if (SBYTE7(v33) < 0) {
              operator delete(v32[0]);
            }
            *(_OWORD *)long long v32 = v30;
            *(void *)&long long v33 = v31;
            uint64_t v28 = *(unsigned int *)(a1[1] - 24);
          }
          else
          {
            sub_25C7D8688((uint64_t)&v30, (const void **)__dst, (const void **)__p);
            if (SBYTE7(v33) < 0) {
              operator delete(v32[0]);
            }
            *(_OWORD *)long long v32 = v30;
            *(void *)&long long v33 = v31;
            uint64_t v28 = *(unsigned int *)v42;
          }
          *((void *)&v33 + 1) = v28 | ((unint64_t)DWORD1(v38) << 32);
          *(_DWORD *)long long v34 = *(_DWORD *)&v42[8];
          *(_WORD *)&v34[4] = *(_WORD *)&v42[12];
          *(_DWORD *)&v34[6] = *(_DWORD *)&v42[14];
          sub_25C7D65DC(a1, (long long *)v32);
          if (SBYTE7(v33) < 0) {
            operator delete(v32[0]);
          }
          int v29 = v6;
          goto LABEL_15;
        }
      }
LABEL_14:
      ++v6;
LABEL_15:
      if (SHIBYTE(v37) < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v41) < 0) {
        operator delete(__dst[0]);
      }
      ++v6;
      uint64_t v5 = *a1;
      uint64_t v4 = a1[1];
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 4));
  }
  *a2 = v5;
  a2[1] = v4;
  a2[2] = a1[2];
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
}

void sub_25C7D862C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (a38 < 0) {
    operator delete(a33);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C7D8688(uint64_t a1, const void **a2, const void **a3)
{
  if (*((char *)a2 + 23) >= 0) {
    unint64_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    unint64_t v5 = (unint64_t)a2[1];
  }
  if (*((char *)a3 + 23) >= 0) {
    unint64_t v6 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    unint64_t v6 = (unint64_t)a3[1];
  }
  uint64_t result = sub_25C7D8E14(a1, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    unint64_t v8 = (char *)result;
  }
  else {
    unint64_t v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a2 + 23) >= 0) {
      long long v9 = a2;
    }
    else {
      long long v9 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, 2 * v5);
  }
  if (v6)
  {
    if (*((char *)a3 + 23) >= 0) {
      uint64_t v10 = a3;
    }
    else {
      uint64_t v10 = *a3;
    }
    uint64_t result = (uint64_t)memmove(&v8[2 * v5], v10, 2 * v6);
  }
  *(_WORD *)&v8[2 * v5 + 2 * v6] = 0;
  return result;
}

void sub_25C7D8744(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  v61[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  uint64_t v5 = v3 - *a1;
  if (v3 == *a1)
  {
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
  }
  else
  {
    if (v5 < 0) {
      sub_25C7D06B8();
    }
    unint64_t v7 = v5 / 48;
    unint64_t v8 = (char *)operator new(8 * ((unint64_t)(v5 / 48 - 1) >> 6) + 8);
    if (v7 >= 0x41) {
      unint64_t v9 = (v7 - 1) >> 6;
    }
    else {
      unint64_t v9 = 0;
    }
    *(void *)&v8[8 * v9] = 0;
    unint64_t v10 = v7 >> 6;
    int v58 = v8;
    if (v7 >= 0x40)
    {
      bzero(v8, 8 * v10);
      unint64_t v8 = v58;
    }
    if ((v7 & 0x3F) != 0) {
      *(void *)&v8[8 * v10] &= ~(0xFFFFFFFFFFFFFFFFLL >> -(v7 & 0x3F));
    }
    unint64_t v11 = 0;
    if (v7 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v7;
    }
    do
    {
      unint64_t v13 = (unsigned __int16 **)(v4 + 48 * v11);
      long long v14 = (unsigned __int16 *)*((unsigned __int8 *)v13 + 23);
      BOOL v15 = (char)v14 < 0;
      if ((char)v14 < 0) {
        long long v14 = v13[1];
      }
      if (v15) {
        long long v16 = *v13;
      }
      else {
        long long v16 = (unsigned __int16 *)(v4 + 48 * v11);
      }
      unint64_t v17 = &qword_25C826818;
      do
      {
        int v18 = *((char *)v17 + 23);
        uint64_t v19 = v17[1];
        if (v18 >= 0) {
          uint64_t v19 = *((unsigned __int8 *)v17 + 23);
        }
        if ((unsigned __int16 *)v19 == v14)
        {
          if (!v14) {
            goto LABEL_32;
          }
          if (v18 >= 0) {
            uint64_t v20 = (unsigned __int16 *)v17;
          }
          else {
            uint64_t v20 = (unsigned __int16 *)*v17;
          }
          int v21 = v14;
          unint64_t v22 = v16;
          while (*v22 == *v20)
          {
            ++v20;
            ++v22;
            int v21 = (unsigned __int16 *)((char *)v21 - 1);
            if (!v21) {
              goto LABEL_32;
            }
          }
        }
        v17 += 3;
      }
      while (v17 != (uint64_t *)&unk_25C8268D8);
      unint64_t v17 = (uint64_t *)&unk_25C8268D8;
LABEL_32:
      int64_t v23 = (char *)v17 - (char *)&qword_25C826818;
      unint64_t v24 = v11 >> 6;
      uint64_t v25 = 1 << v11;
      if (v23 == 192) {
        uint64_t v26 = *(void *)&v8[8 * v24] & ~v25;
      }
      else {
        uint64_t v26 = *(void *)&v8[8 * v24] | v25;
      }
      *(void *)&v8[8 * v24] = v26;
      ++v11;
    }
    while (v11 != v12);
    unint64_t v27 = 0;
    *a2 = 0;
    a2[1] = 0;
    a2[2] = 0;
    unsigned int v57 = a2;
    do
    {
      if ((*(void *)&v8[(v27 >> 3) & 0x1FFFFFFFFFFFFFF8] >> v27))
      {
        unint64_t v28 = v27 + 1;
        if (v27 + 1 >= 0xAAAAAAAAAAAAAAABLL * ((v3 - v4) >> 4))
        {
          BOOL v29 = 0;
          unint64_t v30 = v27;
        }
        else
        {
          LOBYTE(v29) = 0;
          unint64_t v30 = v27;
          while (1)
          {
            unint64_t v31 = v28;
            long long v32 = (const void **)(v4 + 48 * v27);
            unint64_t v33 = v31 >> 3;
            long long v34 = &word_25C849514;
            if (*((_DWORD *)v32 + 7) != *(_DWORD *)(v4 + 48 * v31 + 24))
            {
              long long v34 = &word_25C849528;
              if (((*(void *)&v8[v33 & 0x1FFFFFFFFFFFFFF8] >> v31) & 1) == 0 && v29) {
                break;
              }
            }
            if (*((char *)v32 + 23) >= 0) {
              unint64_t v35 = *((unsigned __int8 *)v32 + 23);
            }
            else {
              unint64_t v35 = (unint64_t)v32[1];
            }
            if (*v34)
            {
              uint64_t v36 = 0;
              do
                uint64_t v37 = v36 + 1;
              while (v34[++v36]);
            }
            else
            {
              uint64_t v37 = 0;
            }
            sub_25C7D8E14((uint64_t)&__p, v37 + v35);
            if (v60 >= 0) {
              p_p = (char *)&__p;
            }
            else {
              p_p = (char *)__p;
            }
            if (v35)
            {
              if (*((char *)v32 + 23) >= 0) {
                long long v40 = v32;
              }
              else {
                long long v40 = *v32;
              }
              memmove(p_p, v40, 2 * v35);
            }
            uint64_t v41 = &p_p[2 * v35];
            if (v37) {
              memcpy(v41, v34, 2 * v37);
            }
            *(_WORD *)&v41[2 * v37] = 0;
            uint64_t v42 = *a1 + 48 * v31;
            int v43 = *(char *)(v42 + 23);
            if (v43 >= 0) {
              uint64_t v44 = (const void *)(*a1 + 48 * v31);
            }
            else {
              uint64_t v44 = *(const void **)v42;
            }
            if (v43 >= 0) {
              unint64_t v45 = *(unsigned __int8 *)(v42 + 23);
            }
            else {
              unint64_t v45 = *(void *)(v42 + 8);
            }
            if (v60 >= 0) {
              unint64_t v46 = 10;
            }
            else {
              unint64_t v46 = (*((void *)&v60 + 1) & 0x7FFFFFFFFFFFFFFFLL) - 1;
            }
            if (v60 >= 0) {
              uint64_t v47 = HIBYTE(v60);
            }
            else {
              uint64_t v47 = v60;
            }
            if (v46 - v47 >= v45)
            {
              if (v45)
              {
                if (v60 >= 0) {
                  int v48 = &__p;
                }
                else {
                  int v48 = __p;
                }
                memmove(&v48[v47], v44, 2 * v45);
                unint64_t v49 = v47 + v45;
                if (SHIBYTE(v60) < 0) {
                  *(void *)&long long v60 = v47 + v45;
                }
                else {
                  HIBYTE(v60) = v49 & 0x7F;
                }
                v48[v49] = 0;
              }
            }
            else
            {
              sub_25C7D0998((uint64_t)&__p, v46, v47 + v45 - v46, v47, v47, 0, v45, v44);
            }
            uint64_t v50 = __p;
            v61[0] = v60;
            *(void *)((char *)v61 + 7) = *(void *)((char *)&v60 + 7);
            char v51 = HIBYTE(v60);
            long long v60 = 0uLL;
            int __p = 0;
            uint64_t v52 = *a1 + 48 * v27;
            if (*(char *)(v52 + 23) < 0) {
              operator delete(*(void **)v52);
            }
            uint64_t v53 = v61[0];
            *(void *)uint64_t v52 = v50;
            *(void *)(v52 + 8) = v53;
            *(void *)(v52 + 15) = *(void *)((char *)v61 + 7);
            *(unsigned char *)(v52 + 23) = v51;
            if (SHIBYTE(v60) < 0) {
              operator delete(__p);
            }
            uint64_t v54 = *a1 + 48 * v27;
            unsigned int v55 = (unint64_t *)(v54 + 24);
            uint64_t v56 = *(unsigned int *)(v54 + 24);
            if (*(char *)(v54 + 23) < 0) {
              uint64_t v54 = *(void *)(v54 + 8);
            }
            else {
              LODWORD(v54) = *(unsigned __int8 *)(v54 + 23);
            }
            unint64_t v8 = v58;
            *unsigned int v55 = v56 | ((unint64_t)(v56 + v54) << 32);
            uint64_t v4 = *a1;
            BOOL v29 = ((*(void *)&v58[v33 & 0x1FFFFFFFFFFFFFF8] >> v31) & 1) == 0
               && *(_DWORD *)(v4 + 48 * v27 + 28) != *(_DWORD *)(v4 + 48 * v31 + 24);
            unint64_t v28 = v31 + 1;
            unint64_t v30 = v31;
            if (v31 + 1 >= 0xAAAAAAAAAAAAAAABLL * ((a1[1] - v4) >> 4)) {
              goto LABEL_97;
            }
          }
          BOOL v29 = 1;
          unint64_t v28 = v31;
        }
LABEL_97:
        a2 = v57;
        sub_25C7D65DC(v57, (long long *)(v4 + 48 * v27));
        if (v29) {
          unint64_t v27 = v28;
        }
        else {
          unint64_t v27 = v30 + 2;
        }
      }
      else
      {
        sub_25C7D65DC(a2, (long long *)(v4 + 48 * v27++));
      }
      unint64_t v8 = v58;
      uint64_t v4 = *a1;
      uint64_t v3 = a1[1];
    }
    while (v27 < 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 4));
    operator delete(v58);
  }
}

void sub_25C7D8C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *__p, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  a13 = a10;
  sub_25C7D025C((void ***)&a13);
  operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7D8CCC(uint64_t a1, skit::internal *this, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (a3)
  {
    uint64_t v4 = a3;
    uint64_t v5 = this;
    uint64_t v7 = *(__int16 *)(*(void *)(a1 + 8)
                    + 2
                    * (*(_DWORD *)(a1 + 16) & skit::internal::murmur3_32(this, (const unsigned __int8 *)(2 * a3))));
    if ((v7 & 0x8000000000000000) == 0)
    {
      uint64_t v8 = *(void *)a1 + 88 * (int)v7;
      if (v4 == *(void *)(v8 + 8))
      {
        for (uint64_t i = *(unsigned __int16 **)v8; *i == *(unsigned __int16 *)v5; ++i)
        {
          uint64_t v5 = (skit::internal *)((char *)v5 + 2);
          if (!--v4) {
            return *(void *)a1 + 88 * v7;
          }
        }
      }
    }
  }
  return v3;
}

void sub_25C7D8D74()
{
}

void sub_25C7D8D84()
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_25C7D8DD8(exception);
  __cxa_throw(exception, (struct type_info *)off_2654BB500, MEMORY[0x263F8C068]);
}

void sub_25C7D8DC4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_25C7D8DD8(std::logic_error *a1)
{
  uint64_t result = std::logic_error::logic_error(a1, "basic_string");
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

uint64_t sub_25C7D8E14(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C7D00F4();
  }
  if (a2 > 0xA)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a2 | 3) != 0xB) {
      uint64_t v4 = a2 | 3;
    }
    uint64_t v5 = v4 + 1;
    if (v4 + 1 < 0) {
      sub_25C7D019C();
    }
    unint64_t v6 = operator new(2 * v5);
    *(void *)(a1 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000;
    *(void *)a1 = v6;
  }
  else
  {
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 23) = a2;
  }
  return a1;
}

void *sub_25C7D8EA4()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26B3549C8, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_26B3549C8))
  {
    qword_26B3549C0 = (uint64_t)os_log_create("com.apple.siri.vocabulary", "semskitbridge");
    __cxa_guard_release(&qword_26B3549C8);
  }
  return &unk_26A5D7090;
}

id sub_25C7D8F0C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v7[2] = *MEMORY[0x263EF8340];
  v7[0] = 0;
  v7[1] = 0;
  objc_msgSend_getUUIDBytes_(a1, a2, (uint64_t)v7, a4);
  uint64_t v5 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v4, (uint64_t)v7, 16);
  return v5;
}

id sub_25C7D8F88(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_sem_data(a1, a2, a3, a4);
  uint64_t v7 = objc_msgSend_base64EncodedStringWithOptions_(v4, v5, 0, v6);

  unint64_t v10 = objc_msgSend_substringToIndex_(v7, v8, 22, v9);

  return v10;
}

id sub_25C7D8FF0(void *a1, const char *a2, void *a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_copy(a3, a2, (uint64_t)a3, a4);
  uint64_t v9 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  if (objc_msgSend_length(v5, v6, v7, v8) == 22)
  {
    uint64_t v13 = objc_msgSend_stringByAppendingString_(v9, v10, @"==", v12);

    uint64_t v9 = (void *)v13;
  }
  if (objc_msgSend_length(v9, v10, v11, v12) == 24)
  {
    id v14 = objc_alloc(MEMORY[0x263EFF8F8]);
    long long v16 = objc_msgSend_initWithBase64EncodedString_options_(v14, v15, (uint64_t)v9, 0);
    if (v16)
    {
      id v17 = a1;
      id v18 = v16;
      uint64_t v22 = objc_msgSend_bytes(v18, v19, v20, v21);
      uint64_t v25 = objc_msgSend_initWithUUIDBytes_(v17, v23, v22, v24);
    }
    else
    {
      uint64_t v25 = 0;
    }
  }
  else
  {
LABEL_7:
    uint64_t v25 = 0;
  }

  return v25;
}

void *sub_25C7D90D8(void *a1, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *a1 = 0;
  a1[1] = 0;
  skit::ContextV2::index_reader();
  std::__fs::filesystem::path v9 = *a2;
  a2->__pn_.__r_.__value_.__l.__size_ = 0;
  a2->__pn_.__r_.__value_.__r.__words[2] = 0;
  a2->__pn_.__r_.__value_.__r.__words[0] = 0;
  std::__fs::filesystem::path __p = *a3;
  a3->__pn_.__r_.__value_.__r.__words[0] = 0;
  a3->__pn_.__r_.__value_.__l.__size_ = 0;
  a3->__pn_.__r_.__value_.__r.__words[2] = 0;
  skit::Alias::Alias((skit::Alias *)(a1 + 4), &v9, &__p);
  if (SHIBYTE(__p.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__pn_.__r_.__value_.__l.__data_);
  }
  if (skit::Alias::init((skit::Alias *)(a1 + 4)))
  {
    uint64_t v6 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v11 = "Searcher";
      _os_log_error_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_ERROR, "%s Failed to initialize alias", buf, 0xCu);
    }
  }
  return a1;
}

void sub_25C7D922C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v24 = (std::__shared_weak_count *)*((void *)v21 + 5);
  if (v24) {
    sub_25C7D2280(v24);
  }
  MEMORY[0x261193DD0](v22);
  skit::ContextV2::~ContextV2(v21);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7D9284(uint64_t a1, uint64_t a2, std::__fs::filesystem::path *a3, std::__fs::filesystem::path *a4)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  char v13 = 2;
  int __p = 7733363;
  __int16 __p_4 = 0;
  skit::ContextV2::ContextV2();
  skit::ContextV2::index_reader();
  std::__fs::filesystem::path v10 = *a3;
  a3->__pn_.__r_.__value_.__l.__size_ = 0;
  a3->__pn_.__r_.__value_.__r.__words[2] = 0;
  a3->__pn_.__r_.__value_.__r.__words[0] = 0;
  std::__fs::filesystem::path v9 = *a4;
  a4->__pn_.__r_.__value_.__r.__words[0] = 0;
  a4->__pn_.__r_.__value_.__l.__size_ = 0;
  a4->__pn_.__r_.__value_.__r.__words[2] = 0;
  skit::Alias::Alias((skit::Alias *)(a1 + 32), &v10, &v9);
  if (SHIBYTE(v9.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v10.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__pn_.__r_.__value_.__l.__data_);
  }
  if (skit::Alias::init((skit::Alias *)(a1 + 32)))
  {
    uint64_t v7 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v15 = "Searcher";
      _os_log_error_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_ERROR, "%s Failed to initialize alias", buf, 0xCu);
    }
  }
  return a1;
}

void sub_25C7D9408(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  uint64_t v24 = (std::__shared_weak_count *)*((void *)v21 + 5);
  if (v24) {
    sub_25C7D2280(v24);
  }
  MEMORY[0x261193DD0](v22);
  skit::ContextV2::~ContextV2(v21);
  _Unwind_Resume(a1);
}

void sub_25C7D9460(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x25C7D9458);
}

void sub_25C7D9478(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned __int16 **a3@<X2>, uint64_t *a4@<X8>)
{
  v39[12] = *(void ***)MEMORY[0x263EF8340];
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  memset(v36, 0, sizeof(v36));
  uint64_t v9 = *(void *)(a2 + 168);
  uint64_t v8 = *(std::__shared_weak_count **)(a2 + 176);
  uint64_t v34 = v9;
  unint64_t v35 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unint64_t v31 = 0;
  long long v32 = 0;
  uint64_t v33 = 0;
  sub_25C7D35C0((char *)&v31, *(long long **)a2, *(long long **)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 4));
  id v10 = *(id *)(a2 + 48);
  sub_25C7D99E8((uint64_t)&v29, a2);
  char v11 = sub_25C7CD104(v9, &v31, 0, 0);
  if (*(char *)(a2 + 79) < 0)
  {
    sub_25C7D059C(__p, *(void **)(a2 + 56), *(void *)(a2 + 64));
  }
  else
  {
    *(_OWORD *)int __p = *(_OWORD *)(a2 + 56);
    uint64_t v27 = *(void *)(a2 + 72);
  }
  memset(v25, 0, sizeof(v25));
  sub_25C7D35C0((char *)v25, v31, v32, 0xAAAAAAAAAAAAAAABLL * (v32 - v31));
  skit::FieldSpanMatcherV3::FieldSpanMatcherV3();
  v39[0] = v25;
  sub_25C7D025C(v39);
  if (SHIBYTE(v27) < 0) {
    operator delete(__p[0]);
  }
  sub_25C7CE7F8(v9, (unsigned __int16 **)&v31, 0, v39);
  if ((*(_WORD *)(v9 + 192) & 4) != 0) {
    sub_25C7CF344(v9, (uint64_t)v39, v10);
  }
  if ((*(unsigned char *)(*(void *)(v9 + 8) + 32) & 8) != 0 && (*(_WORD *)(v9 + 192) & 2) != 0)
  {
    if (v11) {
      sub_25C7CC6BC((void *)v9);
    }
    sub_25C7CF66C(v9, (size_t)v39, &v31);
  }
  uint64_t v12 = *(std::__shared_weak_count **)(a1 + 40);
  uint64_t v24 = v12;
  if (v12) {
    atomic_fetch_add_explicit(&v12->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)&long long buf = v38;
  *((void *)&buf + 1) = 0x800000000;
  int v13 = skit::FieldSpanMatcherV3::alias_span_matcher();
  if ((unsigned char *)buf != v38) {
    free((void *)buf);
  }
  if (v24) {
    sub_25C7D2280(v24);
  }
  if (v13 < 0)
  {
    int64_t v23 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "match_spans";
      _os_log_error_impl(&dword_25C7CA000, v23, OS_LOG_TYPE_ERROR, "%s ERROR: alias span matcher cannot be set up", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    sub_25C7D9DD0(a4, ((char *)a3[1] - (char *)*a3) >> 5);
    id v14 = *a3;
    BOOL v15 = a3[1];
    if (*a3 != v15)
    {
      do
      {
        if (v30)
        {
          unint64_t v16 = *v14;
          uint8x8_t v17 = (uint8x8_t)vcnt_s8(v30);
          v17.i16[0] = vaddlv_u8(v17);
          if (v17.u32[0] > 1uLL)
          {
            unint64_t v18 = *v14;
            if (*(void *)&v30 <= v16) {
              unint64_t v18 = v16 % *(void *)&v30;
            }
          }
          else
          {
            unint64_t v18 = (v30.i32[0] - 1) & v16;
          }
          uint64_t v19 = *(uint64_t ****)(v29 + 8 * v18);
          if (v19)
          {
            for (uint64_t i = *v19; i; uint64_t i = (uint64_t **)*i)
            {
              unint64_t v21 = (unint64_t)i[1];
              if (v21 == v16)
              {
                if (*((unsigned __int16 *)i + 8) == v16)
                {
                  sub_25C7CCEF8(v9, (uint64_t)v31, (uint64_t)v32, *v14);
                  sub_25C821AFC(v16, *(void *)(v9 + 176), *(_WORD *)(v9 + 192), (uint64_t)&buf);
                  skit::FieldSpanMatcherV3::alias_filters();
                  if ((unsigned char *)buf != v38) {
                    free((void *)buf);
                  }
                  int v22 = *((_DWORD *)v14 + 4) - *((void *)v14 + 1);
                  *(void *)&long long buf = *((void *)v14 + 1);
                  DWORD2(buf) = v22;
                  sub_25C7D9E54();
                  break;
                }
              }
              else
              {
                if (v17.u32[0] > 1uLL)
                {
                  if (v21 >= *(void *)&v30) {
                    v21 %= *(void *)&v30;
                  }
                }
                else
                {
                  v21 &= *(void *)&v30 - 1;
                }
                if (v21 != v18) {
                  break;
                }
              }
            }
          }
        }
        v14 += 16;
      }
      while (v14 != v15);
    }
  }
  sub_25C7D2390((uint64_t *)v39);
  if (v28) {
    sub_25C7D2280(v28);
  }
  sub_25C7DFD9C((uint64_t)&v29);

  v39[0] = (void **)&v31;
  sub_25C7D025C(v39);
  if (v8) {
    sub_25C7D2280(v8);
  }
  v39[0] = (void **)v36;
  sub_25C7DFCCC(v39);
}

void sub_25C7D98DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,void *a36)
{
  sub_25C7DFD9C((uint64_t)&a23);

  *(void *)(v39 - 192) = &a28;
  sub_25C7D025C((void ***)(v39 - 192));
  if (v36) {
    sub_25C7D2280(v36);
  }
  *(void *)(v39 - 192) = &a33;
  sub_25C7DFCCC((void ***)(v39 - 192));
  *(void *)(v39 - 192) = v37;
  sub_25C7DFD20((void ***)(v39 - 192));
  _Unwind_Resume(a1);
}

void sub_25C7D99E8(uint64_t a1, uint64_t a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  *((void *)&v4 + 1) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (*(void *)(a2 + 112) || *(void *)(a2 + 152))
  {
    uint64_t v5 = *(uint64_t ***)(a2 + 144);
    if (!v5) {
      goto LABEL_12;
    }
    *(void *)&long long v4 = 136315394;
    long long v31 = v4;
    do
    {
      uint64_t v6 = *((unsigned __int16 *)v5 + 8);
      int v7 = objc_msgSend_itemTypeForFieldType_error_(MEMORY[0x263F50070], (const char *)a2, v6, 0, v31);
      int v8 = sub_25C821174(v7);
      unsigned __int16 v32 = v8;
      if (v8)
      {
        sub_25C7DC744(a1, &v32, &v32);
      }
      else
      {
        uint64_t v9 = (id)qword_26B3549C0;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v12 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v10, v6, v11);
          *(_DWORD *)long long buf = v31;
          uint64_t v34 = "included_search_groups";
          __int16 v35 = 2112;
          v36[0] = v12;
          _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Ignoring invalid FieldType filter: %@", buf, 0x16u);
        }
      }
      uint64_t v5 = (uint64_t **)*v5;
    }
    while (v5);
    if (!*(void *)(a1 + 24))
    {
LABEL_12:
      for (uint64_t i = *(uint64_t ***)(a2 + 104); i; uint64_t i = (uint64_t **)*i)
      {
        uint64_t v14 = *((unsigned __int16 *)i + 8);
        int v15 = sub_25C821174(*((unsigned __int16 *)i + 8));
        unsigned __int16 v32 = v15;
        if (v15)
        {
          sub_25C7DC744(a1, &v32, &v32);
        }
        else
        {
          unint64_t v16 = (id)qword_26B3549C0;
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v19 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v17, v14, v18);
            *(_DWORD *)long long buf = 136315394;
            uint64_t v34 = "included_search_groups";
            __int16 v35 = 2112;
            v36[0] = v19;
            _os_log_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_INFO, "%s Ignoring invalid ItemType filter: %@", buf, 0x16u);
          }
        }
      }
    }
  }
  else
  {
    sub_25C821D80((uint64_t)buf, word_25C839CF8, word_25C839D04);
    if (buf != (uint8_t *)a1)
    {
      *(_DWORD *)(a1 + 32) = v37;
      uint64_t v20 = *(uint64_t ***)((char *)v36 + 2);
      uint64_t v21 = *(void *)(a1 + 8);
      if (!v21) {
        goto LABEL_29;
      }
      for (uint64_t j = 0; j != v21; *(void *)(*(void *)a1 + 8 * j++) = 0)
        ;
      int64_t v23 = *(uint64_t **)(a1 + 16);
      *(void *)(a1 + 16) = 0;
      *(void *)(a1 + 24) = 0;
      if (v23)
      {
        while (v20)
        {
          unint64_t v24 = *((unsigned __int16 *)v20 + 8);
          *((_WORD *)v23 + 8) = v24;
          uint64_t v25 = (uint64_t *)*v23;
          v23[1] = v24;
          uint64_t v26 = sub_25C7DC30C(a1, v24, (unsigned __int16 *)v23 + 8);
          sub_25C7DC65C((void *)a1, v23, v26);
          uint64_t v20 = (uint64_t **)*v20;
          int64_t v23 = v25;
          if (!v25) {
            goto LABEL_29;
          }
        }
        do
        {
          int8x8_t v30 = (uint64_t *)*v23;
          operator delete(v23);
          int64_t v23 = v30;
        }
        while (v30);
      }
      else
      {
LABEL_29:
        while (v20)
        {
          unint64_t v27 = *((unsigned __int16 *)v20 + 8);
          unint64_t v28 = operator new(0x18uLL);
          v28[8] = v27;
          *(void *)unint64_t v28 = 0;
          *((void *)v28 + 1) = v27;
          uint64_t v29 = sub_25C7DC30C(a1, v27, v28 + 8);
          sub_25C7DC65C((void *)a1, v28, v29);
          uint64_t v20 = (uint64_t **)*v20;
        }
      }
    }
    sub_25C7DFD9C((uint64_t)buf);
  }
}

void sub_25C7D9D28(_Unwind_Exception *a1)
{
  sub_25C7DFD9C(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_25C7D9DD0(uint64_t *result, unint64_t a2)
{
  if (a2 > (result[2] - *result) >> 5)
  {
    if (a2 >> 59) {
      sub_25C7D06B8();
    }
    uint64_t v2 = result;
    uint64_t v3 = result[1] - *result;
    v5[4] = result + 2;
    v5[0] = sub_25C7DCC28(a2);
    v5[1] = v5[0] + v3;
    v5[2] = v5[0] + v3;
    v5[3] = v5[0] + 32 * v4;
    sub_25C7DCBB0(v2, v5);
    return (uint64_t *)sub_25C7DCDE0((uint64_t)v5);
  }
  return result;
}

void sub_25C7D9E54()
{
  uint64_t v0 = MEMORY[0x270FA5388]();
  uint64_t v2 = v1;
  v176 = v3;
  uint64_t v5 = v4;
  v173 = (uint64_t *)v0;
  v205[8] = *MEMORY[0x263EF8340];
  id v177 = v6;
  uint64_t v7 = (uint64_t)*v5;
  uint64_t v8 = **v5;
  uint64_t v9 = *((unsigned int *)v5 + 2);
  *(void *)long long buf = *v5;
  *(void *)&buf[8] = v9;
  *(_OWORD *)&uint8_t buf[16] = xmmword_25C839A70;
  *(void *)&buf[32] = 0;
  LOBYTE(v197) = 1;
  if (v9 >= 0x7FFFFFFF) {
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  }
  id v10 = (int *)(v7 + v8);
  if (!sub_25C7DCECC((uint64_t *)buf, (int *)(v7 + v8))) {
    goto LABEL_97;
  }
  uint64_t v11 = (unsigned __int16 *)((char *)v10 - *v10);
  unsigned int v12 = *v11;
  if (v12 >= 5
    && v11[2]
    && (*(void *)&buf[8] < 2uLL || *(void *)&buf[8] - 1 < (unint64_t)v10 + v11[2] - *(void *)buf))
  {
    goto LABEL_97;
  }
  if (!sub_25C7DCE44((int *)(v7 + v8), (uint64_t)buf, 6u)) {
    goto LABEL_97;
  }
  if (v12 >= 7 && v11[3])
  {
    if (!sub_25C7DCF84((uint64_t)buf, (unsigned int *)((char *)v10 + v11[3] + *(unsigned int *)((char *)v10 + v11[3])), 4uLL, 0))goto LABEL_97; {
    int v13 = (unsigned __int16 *)((char *)v10 - *v10);
    }
    if (*v13 >= 7u)
    {
      uint64_t v14 = v13[3];
      if (v14)
      {
        uint64_t v15 = *(unsigned int *)((char *)v10 + v14);
        v167 = (int *)((char *)v10 + v14 + v15);
        if (*v167)
        {
          unint64_t v16 = 0;
          uint64_t v174 = v7 + v8 + v14 + v15 + 8;
          uint64_t v17 = v15 + v14 + v8 + v7;
          uint64_t v169 = v17 + 8;
          uint64_t v171 = v17 + 14;
          do
          {
            uint64_t v18 = &v167[v16 + 1];
            uint64_t v19 = *v18;
            uint64_t v20 = (int *)((char *)v18 + v19);
            if (!sub_25C7DCECC((uint64_t *)buf, (int *)((char *)v18 + v19))) {
              goto LABEL_97;
            }
            uint64_t v21 = (unsigned __int16 *)((char *)v20 - *v20);
            unsigned int v22 = *v21;
            if (v22 >= 5
              && v21[2]
              && (*(void *)&buf[8] < 3uLL || *(void *)&buf[8] - 2 < (unint64_t)v20
                                                                        + v21[2]
                                                                        - *(void *)buf))
            {
              goto LABEL_97;
            }
            if (!sub_25C7DCE44(v20, (uint64_t)buf, 6u)) {
              goto LABEL_97;
            }
            if (v22 >= 7 && v21[3])
            {
              int64_t v23 = (unsigned int *)((char *)v20 + v21[3] + *(unsigned int *)((char *)v20 + v21[3]));
              unint64_t v24 = (unint64_t)v23 - *(void *)buf;
              if ((((unint64_t)v23 - *(void *)buf) & 3) != 0 && v197 != 0) {
                goto LABEL_97;
              }
              if (*(void *)&buf[8] < 5uLL) {
                goto LABEL_97;
              }
              if (*(void *)&buf[8] - 4 < v24) {
                goto LABEL_97;
              }
              uint64_t v26 = *v23;
              if (v26 > 0x7FFFFFFE) {
                goto LABEL_97;
              }
              unint64_t v27 = v26 + 4;
              BOOL v29 = *(void *)&buf[8] >= v27;
              unint64_t v28 = *(void *)&buf[8] - v27;
              BOOL v29 = v28 != 0 && v29 && v28 >= v24;
              if (!v29) {
                goto LABEL_97;
              }
            }
            if (!sub_25C7DCE44(v20, (uint64_t)buf, 8u)) {
              goto LABEL_97;
            }
            if (v22 >= 9 && v21[4])
            {
              if (!sub_25C7DCF84((uint64_t)buf, (unsigned int *)((char *)v20 + v21[4] + *(unsigned int *)((char *)v20 + v21[4])), 4uLL, 0))goto LABEL_97; {
              int8x8_t v30 = (unsigned __int16 *)((char *)v20 - *v20);
              }
              if (*v30 >= 9u)
              {
                uint64_t v31 = v30[4];
                if (v31)
                {
                  uint64_t v32 = *(unsigned int *)((char *)v20 + v31);
                  v162 = (char *)v20 + v31;
                  if (*(int *)((char *)v20 + v31 + v32))
                  {
                    unint64_t v33 = 0;
                    uint64_t v163 = v174 + v19 + v31;
                    uint64_t v34 = v31 + v19;
                    uint64_t v164 = v171 + v34;
                    uint64_t v35 = v169 + v34;
                    do
                    {
                      uint64_t v36 = *(unsigned int *)(v35 + v32);
                      int v37 = (int *)(v35 + v32 + v36);
                      uint64_t v38 = v32;
                      if (!sub_25C7DCECC((uint64_t *)buf, v37) || !sub_25C7DCE44(v37, (uint64_t)buf, 4u)) {
                        goto LABEL_97;
                      }
                      uint64_t v32 = v38;
                      uint64_t v39 = *(int *)(v35 + v38 + v36);
                      unsigned int v40 = *(unsigned __int16 *)(v35 + v38 + v36 - v39);
                      if (v40 >= 5)
                      {
                        if (*(_WORD *)(v35 + v38 + v36 - v39 + 4))
                        {
                          uint64_t v41 = *(unsigned __int16 *)(v35 + v38 + v36 - v39 + 4);
                          if (!sub_25C7DCF84((uint64_t)buf, (unsigned int *)(v35 + v38 + v36 + v41 + *(unsigned int *)(v35 + v38 + v36 + v41)), 1uLL, 0))goto LABEL_97; {
                          uint64_t v32 = v38;
                          }
                          uint64_t v42 = *(int *)(v35 + v38 + v36);
                          uint64_t v43 = -v42;
                          unsigned int v40 = *(unsigned __int16 *)(v35 + v38 + v36 - v42);
                        }
                        else
                        {
                          uint64_t v43 = -v39;
                        }
                        if (v40 >= 7
                          && *(_WORD *)(v164 + v32 + v43 + v36)
                          && (*(void *)&buf[8] < 3uLL
                           || *(void *)&buf[8] - 2 < v32
                                                       + v163
                                                       + v36
                                                       + (unint64_t)*(unsigned __int16 *)(v164 + v32 + v43 + v36)
                                                       - *(void *)buf))
                        {
                          goto LABEL_97;
                        }
                      }
                      --*(_DWORD *)&buf[16];
                      ++v33;
                      v163 += 4;
                      v164 += 4;
                      v35 += 4;
                    }
                    while (v33 < *(unsigned int *)&v162[v32]);
                  }
                }
              }
            }
            --*(_DWORD *)&buf[16];
            ++v16;
            v174 += 4;
            v169 += 4;
            v171 += 4;
          }
          while (v16 < *v167);
        }
      }
    }
  }
  if (sub_25C7DCE44(v10, (uint64_t)buf, 8u))
  {
    uint64_t v44 = (unsigned __int16 *)((char *)v10 - *v10);
    if (*v44 < 9u) {
      goto LABEL_100;
    }
    uint64_t v45 = v44[4];
    if (!v45) {
      goto LABEL_100;
    }
    unint64_t v46 = (int *)((char *)v10 + v45 + *(unsigned int *)((char *)v10 + v45));
    if (sub_25C7DCECC((uint64_t *)buf, v46))
    {
      uint64_t v47 = (unsigned __int16 *)((char *)v46 - *v46);
      unsigned int v48 = *v47;
      if ((v48 < 5
         || !v47[2]
         || *(void *)&buf[8] >= 3uLL && *(void *)&buf[8] - 2 >= (unint64_t)v46 + v47[2] - *(void *)buf)
        && sub_25C7DCE44(v46, (uint64_t)buf, 6u)
        && (v48 < 7
         || !v47[3]
         || sub_25C7DCF84((uint64_t)buf, (unsigned int *)((char *)v46 + v47[3] + *(unsigned int *)((char *)v46 + v47[3])), 1uLL, 0))&& sub_25C7DCE44(v46, (uint64_t)buf, 8u))
      {
        unint64_t v49 = (unsigned __int16 *)((char *)v46 - *v46);
        if (*v49 < 9u) {
          goto LABEL_83;
        }
        uint64_t v50 = v49[4];
        if (!v50) {
          goto LABEL_83;
        }
        if (sub_25C7DCF84((uint64_t)buf, (unsigned int *)((char *)v46 + v50 + *(unsigned int *)((char *)v46 + v50)), 4uLL, 0))
        {
          char v51 = (unsigned __int16 *)((char *)v46 - *v46);
          if (*v51 >= 9u)
          {
            uint64_t v52 = v51[4];
            if (v52)
            {
              uint64_t v53 = (int *)((char *)v46 + v52 + *(unsigned int *)((char *)v46 + v52));
              if (*v53)
              {
                unint64_t v54 = 0;
                unsigned int v55 = v53 + 1;
                do
                {
                  uint64_t v56 = *v55;
                  if (!sub_25C7DCECC((uint64_t *)buf, (int *)((char *)v55 + v56))) {
                    goto LABEL_97;
                  }
                  if (!sub_25C7DCE44((int *)((char *)v55 + v56), (uint64_t)buf, 4u)) {
                    goto LABEL_97;
                  }
                  uint64_t v57 = v56 - *(int *)((char *)v55 + v56);
                  if (*(unsigned __int16 *)((char *)v55 + v57) >= 5u)
                  {
                    uint64_t v58 = *(unsigned __int16 *)((char *)v55 + v57 + 4);
                    if (v58)
                    {
                      if (!sub_25C7DCF84((uint64_t)buf, (unsigned int *)((char *)v55 + v56 + v58 + *(unsigned int *)((char *)v55 + v56 + v58)), 1uLL, 0))goto LABEL_97; {
                    }
                      }
                  }
                  --*(_DWORD *)&buf[16];
                  ++v54;
                  ++v55;
                }
                while (v54 < *v53);
              }
            }
          }
LABEL_83:
          if (sub_25C7DCE44(v46, (uint64_t)buf, 0xAu))
          {
            uint64_t v59 = (unsigned __int16 *)((char *)v46 - *v46);
            if (*v59 >= 0xBu && (uint64_t v60 = v59[5]) != 0) {
              int v61 = (unsigned int *)((char *)v46 + v60 + *(unsigned int *)((char *)v46 + v60));
            }
            else {
              int v61 = 0;
            }
            if (sub_25C7DCFF4(buf, v61) && sub_25C7DCE44(v46, (uint64_t)buf, 0xCu))
            {
              uint64_t v62 = (unsigned __int16 *)((char *)v46 - *v46);
              if (*v62 >= 0xDu && (uint64_t v63 = v62[6]) != 0) {
                __int16 v64 = (unsigned int *)((char *)v46 + v63 + *(unsigned int *)((char *)v46 + v63));
              }
              else {
                __int16 v64 = 0;
              }
              if (sub_25C7DCFF4(buf, v64))
              {
                --*(_DWORD *)&buf[16];
                goto LABEL_100;
              }
            }
          }
        }
      }
    }
  }
LABEL_97:
  uint64_t v65 = qword_26B3549C0;
  if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v201) = 136315138;
    *(void *)((char *)&v201 + 4) = "verify_document";
    _os_log_error_impl(&dword_25C7CA000, v65, OS_LOG_TYPE_ERROR, "%s Document failed verification", (uint8_t *)&v201, 0xCu);
  }
  id v10 = 0;
LABEL_100:
  uint64_t v66 = (unsigned __int16 *)((char *)v10 - *v10);
  if (*v66 < 5u)
  {
    uint64_t v75 = qword_26B3549C0;
    if (!os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_125;
    }
    LODWORD(v76) = 0;
LABEL_111:
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "match_spans_of_document";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v76;
    _os_log_error_impl(&dword_25C7CA000, v75, OS_LOG_TYPE_ERROR, "%s Skipping document with unsupported entity_type: %u", buf, 0x12u);
    goto LABEL_125;
  }
  if (!v66[2] || *((unsigned char *)v10 + v66[2]) != 1)
  {
    uint64_t v75 = qword_26B3549C0;
    if (!os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_125;
    }
    uint64_t v76 = v66[2];
    if (v66[2]) {
      LODWORD(v76) = *((unsigned __int8 *)v10 + v76);
    }
    goto LABEL_111;
  }
  id v67 = v177;
  long long v68 = sub_25C80DE54(v10, 0);
  unint64_t v70 = v68;
  if (v68)
  {
    uint64_t v188 = 0;
    v189 = &v188;
    uint64_t v190 = 0x3812000000;
    v191 = sub_25C7DD070;
    v192 = nullsub_7;
    v193 = &unk_25C8548B9;
    uint64_t v71 = *v10;
    uint64_t v72 = *(unsigned __int16 *)((char *)v10 - v71 + 6);
    if (*(_WORD *)((char *)v10 - v71 + 6))
    {
      uint64_t v73 = *(unsigned int *)((char *)v10 + v72);
      unint64_t v74 = (char *)v10 + v72 + v73;
    }
    else
    {
      uint64_t v72 = 0;
      unint64_t v74 = 0;
      uint64_t v73 = *v10;
    }
    v172 = v67;
    v194 = v74 + 4;
    uint64_t v77 = (uint64_t)&v10[*(int *)((char *)v10 + v72 + v73) + 1] + v72 + v73;
    uint64_t v184 = 0;
    v185 = &v184;
    uint64_t v186 = 0x2020000000;
    int v187 = 0;
    uint64_t v180 = 0;
    v181 = &v180;
    uint64_t v182 = 0x2020000000;
    char v183 = 1;
    v178[0] = MEMORY[0x263EF8330];
    v178[1] = 3321888768;
    v178[2] = sub_25C7DD080;
    v178[3] = &unk_2709E0148;
    v178[4] = &v180;
    v178[5] = &v188;
    v178[6] = &v184;
    v178[7] = v77;
    v178[8] = v176;
    id v179 = 0;
    v168 = v68;
    char v78 = objc_msgSend_recursivelyEnumerateFieldsWithError_usingBlock_(v68, v69, (uint64_t)&v179, (uint64_t)v178);
    id v170 = v179;
    if (*((unsigned char *)v181 + 24)) {
      char v79 = v78;
    }
    else {
      char v79 = 0;
    }
    if (v79)
    {
      if (v189[6] == v77)
      {
        *(void *)long long buf = *v5;
        sub_25C7DD510(v173, buf);
        int v88 = objc_opt_class();
        int v92 = objc_msgSend_itemType(v88, v89, v90, v91);
        switch(sub_25C82141C(v92))
        {
          case 1u:
            uint64_t v93 = v173[1];
            *(_WORD *)long long buf = 0;
            memset(&buf[8], 0, 32);
            uint64_t v197 = 0;
            v198 = (skit::SpanMatchV3 *)v200;
            uint64_t v199 = 0x400000000;
            uint64_t v95 = *v176;
            uint64_t v94 = v176[1];
            if (*v176 != v94)
            {
              unint64_t v96 = (void *)(v93 - 32);
              do
              {
                skit::FieldSpanMatcherV3::match();
                skit::to_u16string();
                skit::FieldSpanMatcherV3::finalize();
                sub_25C7DDCF0(v96, (uint64_t)buf);
                v95 += 72;
              }
              while (v95 != v94);
            }
            sub_25C7DE078((char **)&v198);
            if ((buf[31] & 0x80000000) != 0) {
              operator delete(*(void **)&buf[8]);
            }
            goto LABEL_122;
          case 2u:
            uint64_t v131 = *v176;
            uint64_t v132 = v176[1];
            if (*v176 != v132)
            {
              uint64_t v133 = v173[1];
              do
              {
                *(_WORD *)long long buf = 0;
                memset(&buf[8], 0, 32);
                uint64_t v197 = 0;
                v198 = (skit::SpanMatchV3 *)v200;
                uint64_t v199 = 0x400000000;
                skit::FieldSpanMatcherV3::match();
                int v134 = v199;
                if (v199)
                {
                  skit::to_u16string();
                  skit::FieldSpanMatcherV3::finalize();
                  sub_25C7DDCF0((void *)(v133 - 32), (uint64_t)buf);
                }
                else
                {
                  v135 = qword_26B3549C0;
                  if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_DEBUG))
                  {
                    LODWORD(v201) = 136315138;
                    *(void *)((char *)&v201 + 4) = "match_all_fields";
                    _os_log_debug_impl(&dword_25C7CA000, v135, OS_LOG_TYPE_DEBUG, "%s empty span matches. Removing the whole item", (uint8_t *)&v201, 0xCu);
                  }
                  uint64_t v137 = *(void *)(v133 - 24);
                  for (uint64_t i = *(void *)(v133 - 16); i != v137; sub_25C7DCCE4(i))
                    i -= 568;
                  *(void *)(v133 - 16) = v137;
                }
                sub_25C7DE078((char **)&v198);
                if ((buf[31] & 0x80000000) != 0) {
                  operator delete(*(void **)&buf[8]);
                }
                if (!v134) {
                  break;
                }
                v131 += 72;
              }
              while (v131 != v132);
            }
            goto LABEL_122;
          case 3u:
            uint64_t v97 = *v176;
            uint64_t v165 = v176[1];
            if (*v176 == v165) {
              goto LABEL_122;
            }
            uint64_t v98 = v173[1];
            do
            {
              *(_WORD *)long long buf = 0;
              memset(&buf[8], 0, 32);
              uint64_t v197 = 0;
              v198 = (skit::SpanMatchV3 *)v200;
              uint64_t v199 = 0x400000000;
              skit::FieldSpanMatcherV3::match();
              skit::to_u16string();
              skit::FieldSpanMatcherV3::finalize();
              uint64_t v166 = v97;
              if (v199)
              {
                unint64_t v99 = v198;
                int v100 = (skit::SpanMatchV3 *)((char *)v198 + 64 * (unint64_t)v199);
                unint64_t v101 = 0x193D4BB7E327A977 * ((uint64_t)(*(void *)(v98 - 16) - *(void *)(v98 - 24)) >> 3);
                while (1)
                {
                  if (!v101) {
                    goto LABEL_164;
                  }
                  uint64_t v102 = 0;
                  unsigned int v103 = 0;
                  while (1)
                  {
                    int v104 = *(_DWORD *)skit::SpanMatchV3::span(v99);
                    if (v104 == *(_DWORD *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*(void *)(v98 - 24)
                                                                                        + 568 * v102
                                                                                        + 488)))
                    {
                      int v105 = *(_DWORD *)(skit::SpanMatchV3::span(v99) + 4);
                      if (v105 == *(_DWORD *)(skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*(void *)(v98 - 24)
                                                                                           + 568 * v102
                                                                                           + 488))
                                             + 4))
                        break;
                    }
                    char v106 = (_DWORD *)skit::SpanMatchV3::span(v99);
                    uint64_t v107 = (_DWORD *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*(void *)(v98 - 24)
                                                                                 + 568 * v102
                                                                                 + 488));
                    if (*v106 >= *v107 && v106[1] <= v107[1]) {
                      goto LABEL_165;
                    }
                    unsigned __int16 v108 = (_DWORD *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*(void *)(v98 - 24)
                                                                                 + 568 * v102
                                                                                 + 488));
                    id v109 = (_DWORD *)skit::SpanMatchV3::span(v99);
                    if (*v108 >= *v109 && v108[1] <= v109[1]) {
                      goto LABEL_148;
                    }
                    uint64_t v102 = ++v103;
                    if (v101 <= v103) {
                      goto LABEL_164;
                    }
                  }
                  unsigned int v110 = skit::SpanMatchV3::edit_dist(v99);
                  if (v110 < skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(void *)(v98 - 24)
                                                                                             + 568 * v102
                                                                                             + 488)))
                    break;
                  skit::SpanMatchV3::score(v99);
                  float v112 = v111;
                  skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(void *)(v98 - 24) + 568 * v102 + 488));
                  if (v112 > v113) {
                    break;
                  }
LABEL_165:
                  unint64_t v99 = (skit::SpanMatchV3 *)((char *)v99 + 64);
                  if (v99 == v100) {
                    goto LABEL_166;
                  }
                }
LABEL_148:
                uint64_t v114 = *(void *)(v98 - 16);
                uint64_t v115 = *(void *)(v98 - 24) + 568 * v103;
                uint64_t v116 = v115 + 568;
                if (v115 + 568 != v114)
                {
                  do
                  {
                    unint64_t v117 = *(void **)v115;
                    uint64_t v118 = *(unsigned int *)(v115 + 8);
                    if (v118)
                    {
                      uint64_t v119 = 112 * v118;
                      do
                      {
                        unint64_t v117 = (void *)(sub_25C7DCD98((uint64_t)v117) + 112);
                        v119 -= 112;
                      }
                      while (v119);
                      unint64_t v117 = *(void **)v115;
                    }
                    if (v117 != (void *)(v115 + 16)) {
                      free(v117);
                    }
                    sub_25C7DF800(v115, v116);
                    uint64_t v120 = (void **)(v115 + 464);
                    if (*(char *)(v115 + 487) < 0) {
                      operator delete(*v120);
                    }
                    *(_OWORD *)uint64_t v120 = *(_OWORD *)(v116 + 464);
                    *(void *)(v115 + 480) = *(void *)(v116 + 480);
                    *(unsigned char *)(v116 + 487) = 0;
                    *(_WORD *)(v116 + 464) = 0;
                    *(_OWORD *)(v115 + 488) = *(_OWORD *)(v116 + 488);
                    *(_OWORD *)(v115 + 500) = *(_OWORD *)(v116 + 500);
                    int v121 = *(void **)(v115 + 520);
                    if (v121 != (void *)(v115 + 536)) {
                      free(v121);
                    }
                    sub_25C7DDFD0(v115 + 520, v116 + 520);
                    *(_DWORD *)(v115 + 544) = *(_DWORD *)(v116 + 544);
                    *(void *)(v115 + 552) = *(void *)(v116 + 552);
                    *(_DWORD *)(v115 + 560) = *(_DWORD *)(v116 + 560);
                    v116 += 568;
                    v115 += 568;
                  }
                  while (v116 != v114);
                  uint64_t v116 = *(void *)(v98 - 16);
                }
                while (v116 != v115)
                {
                  v116 -= 568;
                  sub_25C7DCCE4(v116);
                }
                *(void *)(v98 - 16) = v115;
LABEL_164:
                sub_25C7DF588((uint64_t)&v201, (long long *)v99);
                sub_25C7DF964((void *)(v98 - 32));
              }
LABEL_166:
              sub_25C7DE078((char **)&v198);
              if ((buf[31] & 0x80000000) != 0) {
                operator delete(*(void **)&buf[8]);
              }
              uint64_t v97 = v166 + 72;
            }
            while (v166 + 72 != v165);
            goto LABEL_122;
          case 4u:
            uint64_t v122 = v173[1];
            id v123 = v172;
            *(void *)&long long v201 = &v202;
            *((void *)&v201 + 1) = 0x800000000;
            uint64_t v124 = *v176;
            uint64_t v125 = v176[1];
            unsigned int v126 = 954437177 * ((unint64_t)(v125 - *v176) >> 3);
            id v175 = v123;
            if (v126 >= 9)
            {
              sub_25C7DDDC4((void **)&v201, v126);
              uint64_t v124 = *v176;
              uint64_t v125 = v176[1];
            }
            if (v124 == v125) {
              goto LABEL_207;
            }
            break;
          default:
            v138 = (id)qword_26B3549C0;
            if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
            {
              v153 = (void *)MEMORY[0x263F50070];
              v154 = objc_opt_class();
              uint64_t v158 = objc_msgSend_itemType(v154, v155, v156, v157);
              v161 = objc_msgSend_descriptionForTypeIdentifier_(v153, v159, v158, v160);
              *(_DWORD *)long long buf = 136315394;
              *(void *)&uint8_t buf[4] = "match_spans_of_cascade_entity";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v161;
              _os_log_error_impl(&dword_25C7CA000, v138, OS_LOG_TYPE_ERROR, "%s Document contains item of unsupported type: %@", buf, 0x16u);
            }
            goto LABEL_122;
        }
        do
        {
          if (*(void *)(v124 + 32) != *(void *)(v124 + 24))
          {
            unsigned int v127 = DWORD2(v201);
            if (DWORD2(v201) == HIDWORD(v201))
            {
              sub_25C7DDDC4((void **)&v201, DWORD2(v201) + (DWORD2(v201) >> 1) + 1);
              unsigned int v127 = DWORD2(v201);
            }
            uint64_t v128 = v201 + 320 * v127;
            *(_OWORD *)(v128 + 288) = 0u;
            *(_OWORD *)(v128 + 304) = 0u;
            *(_OWORD *)(v128 + 256) = 0u;
            *(_OWORD *)(v128 + 272) = 0u;
            *(_OWORD *)(v128 + 224) = 0u;
            *(_OWORD *)(v128 + 240) = 0u;
            *(_OWORD *)(v128 + 192) = 0u;
            *(_OWORD *)(v128 + 208) = 0u;
            *(_OWORD *)(v128 + 160) = 0u;
            *(_OWORD *)(v128 + 176) = 0u;
            *(_OWORD *)(v128 + 128) = 0u;
            *(_OWORD *)(v128 + 144) = 0u;
            *(_OWORD *)(v128 + 96) = 0u;
            *(_OWORD *)(v128 + 112) = 0u;
            *(_OWORD *)(v128 + 80) = 0u;
            *(_OWORD *)(v128 + 32) = 0u;
            *(_OWORD *)(v128 + 48) = 0u;
            *(_OWORD *)uint64_t v128 = 0u;
            *(_OWORD *)(v128 + 16) = 0u;
            *(_OWORD *)(v128 + 64) = 0u;
            *(void *)(v128 + 48) = v128 + 64;
            *(void *)(v128 + 56) = 0x400000000;
            ++DWORD2(v201);
            sub_25C7CE7F8(*v2, (unsigned __int16 **)(v124 + 24), 1, buf);
            sub_25C7CF11C((uint64_t)buf, (long long ***)(v124 + 48), &v203);
            long long v129 = v203;
            if (v203 != (void *)v204)
            {
              while (*v129 != 1536)
              {
                if (++v129 == (_WORD *)v204)
                {
                  long long v129 = (_WORD *)v204;
                  break;
                }
              }
            }
            if (v129 == (_WORD *)v204)
            {
              uint64_t v130 = *v2;
              if ((*(unsigned char *)(*(void *)(*v2 + 8) + 32) & 8) != 0 && (*(_WORD *)(v130 + 192) & 2) != 0) {
                sub_25C7CF66C(v130, (size_t)buf, (long long **)(v124 + 24));
              }
            }
            skit::FieldSpanMatcherV3::match();
            skit::to_u16string();
            if (v203)
            {
              uint64_t v204 = (uint64_t)v203;
              operator delete(v203);
            }
            sub_25C7D2390((uint64_t *)buf);
          }
          v124 += 72;
        }
        while (v124 != v125);
LABEL_207:
        *(void *)long long buf = 0;
        *(void *)&buf[8] = 0;
        *(void *)&uint8_t buf[16] = &buf[32];
        *(void *)&unsigned char buf[24] = 0x800000000;
        v203 = v205;
        uint64_t v204 = 0x800000000;
        unsigned int v139 = DWORD2(v201);
        if (DWORD2(v201) >= 9)
        {
          sub_25C7DE194((uint64_t)&v203, DWORD2(v201));
          unsigned int v139 = DWORD2(v201);
        }
        if (v139)
        {
          v140 = (unsigned __int16 *)v201;
          uint64_t v141 = 320 * v139;
          do
          {
            if (*((_DWORD *)v140 + 14) && sub_25C821A0C(*v140))
            {
              v195 = v140;
              sub_25C7DE138((size_t)&v203, &v195);
            }
            v140 += 160;
            v141 -= 320;
          }
          while (v141);
        }
        v142 = (unsigned __int16 **)v203;
        unint64_t v143 = v204;
        if (v204 < 0x81)
        {
          v144 = 0;
          uint64_t v146 = 0;
        }
        else
        {
          v144 = (unsigned __int16 **)sub_25C7DE248(v204);
          uint64_t v146 = v145;
        }
        sub_25C7DE2AC(v142, &v142[v143], v143, v144, v146);
        if (v144) {
          operator delete(v144);
        }
        if (DWORD2(v201))
        {
          v147 = (unsigned __int16 *)v201;
          uint64_t v148 = 320 * DWORD2(v201);
          do
          {
            if (!*((_DWORD *)v147 + 14) && sub_25C821A0C(*v147))
            {
              v195 = v147;
              sub_25C7DE138((size_t)&v203, &v195);
            }
            v147 += 160;
            v148 -= 320;
          }
          while (v148);
        }
        if (v204)
        {
          v149 = (char *)v203;
          uint64_t v150 = 8 * v204;
          do
          {
            skit::FieldSpanMatcherV3::merge_field();
            v149 += 8;
            v150 -= 8;
          }
          while (v150);
        }
        skit::FieldSpanMatcherV3::finalize();
        if (v203 != v205) {
          free(v203);
        }
        sub_25C7DDB60(v122 - 32, (uint64_t)buf);
        if (DWORD2(v201))
        {
          v151 = (unsigned __int16 *)v201;
          uint64_t v152 = 320 * DWORD2(v201);
          do
          {
            if (*((_DWORD *)v151 + 14) && !sub_25C821A0C(*v151))
            {
              skit::FieldSpanMatcherV3::finalize();
              sub_25C7DDCF0((void *)(v122 - 32), (uint64_t)v151);
            }
            v151 += 160;
            v152 -= 320;
          }
          while (v152);
        }
        sub_25C7DFB60((char **)&buf[16]);
        sub_25C7DFBEC((char **)&v201);
      }
      else
      {
        __int16 v80 = (void *)qword_26B3549C0;
        if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
        {
          int v81 = *((_DWORD *)v185 + 6);
          unsigned int v82 = (char *)v10 - *v10;
          uint64_t v83 = v80;
          int v84 = *(int *)((char *)v10
                       + *((unsigned __int16 *)v82 + 3)
                       + *(unsigned int *)((char *)v10 + *((unsigned __int16 *)v82 + 3)));
          *(_DWORD *)long long buf = 136315650;
          *(void *)&uint8_t buf[4] = "match_spans_of_cascade_entity";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v81;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v84;
          _os_log_error_impl(&dword_25C7CA000, v83, OS_LOG_TYPE_ERROR, "%s Invalid document - enumerated %u content fields but expected: %u", buf, 0x18u);
        }
      }
    }
    else
    {
      uint64_t v85 = qword_26B3549C0;
      if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        *(void *)&uint8_t buf[4] = "match_spans_of_cascade_entity";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v170;
        _os_log_error_impl(&dword_25C7CA000, v85, OS_LOG_TYPE_ERROR, "%s Failed to enumerate fields of document: %@", buf, 0x16u);
      }
    }
LABEL_122:

    id v67 = v172;
    _Block_object_dispose(&v180, 8);
    _Block_object_dispose(&v184, 8);
    _Block_object_dispose(&v188, 8);
    unint64_t v70 = v168;
  }

  sub_25C7DFC58((uint64_t)v176, *v176);
  uint64_t v86 = v173[1];
  if (*(void *)(v86 - 24) == *(void *)(v86 - 16))
  {
    uint64_t v87 = v86 - 32;
    *(void *)long long buf = v86 - 24;
    sub_25C7DCC60((void ***)buf);
    v173[1] = v87;
  }
LABEL_125:
}

void sub_25C7DB448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);

  _Unwind_Resume(a1);
}

void sub_25C7DB608(void *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v99 = *MEMORY[0x263EF8340];
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  memset(v87, 0, sizeof(v87));
  uint64_t v7 = *(void *)(a2 + 168);
  id v6 = *(std::__shared_weak_count **)(a2 + 176);
  uint64_t v85 = v7;
  uint64_t v86 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  uint64_t v59 = v6;
  long long v82 = 0u;
  long long v83 = 0u;
  float v84 = 1.0;
  char v79 = 0;
  __int16 v80 = 0;
  uint64_t v81 = 0;
  uint64_t v76 = 0;
  uint64_t v77 = 0;
  uint64_t v78 = 0;
  sub_25C7D35C0((char *)&v76, *(long long **)a2, *(long long **)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 4));
  uint64_t v73 = 0;
  unint64_t v74 = 0;
  uint64_t v75 = 0;
  sub_25C7D35C0((char *)&v73, *(long long **)(a2 + 24), *(long long **)(a2 + 32), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 32) - *(void *)(a2 + 24)) >> 4));
  id v61 = *(id *)(a2 + 48);
  unint64_t v70 = 0;
  *(void *)uint64_t v71 = 0;
  uint64_t v72 = 0;
  if (skit::IndexReader::is_open((skit::IndexReader *)(a1 + 2)))
  {
    char v8 = sub_25C7CD104(v7, &v76, 0, 0);
    sub_25C7CD104(v7, &v73, 0, 0);
    if (*(char *)(a2 + 79) < 0)
    {
      sub_25C7D059C(__p, *(void **)(a2 + 56), *(void *)(a2 + 64));
    }
    else
    {
      *(_OWORD *)int __p = *(_OWORD *)(a2 + 56);
      uint64_t v67 = *(void *)(a2 + 72);
    }
    memset(v65, 0, sizeof(v65));
    sub_25C7D35C0((char *)v65, v76, v77, 0xAAAAAAAAAAAAAAABLL * (v77 - v76));
    skit::FieldSpanMatcherV3::FieldSpanMatcherV3();
    *(void *)long long buf = v65;
    sub_25C7D025C((void ***)buf);
    if (SHIBYTE(v67) < 0) {
      operator delete(__p[0]);
    }
    sub_25C7CE7F8(v7, (unsigned __int16 **)&v76, 0, buf);
    if ((*(_WORD *)(v7 + 192) & 4) != 0) {
      sub_25C7CF344(v7, (uint64_t)buf, v61);
    }
    if ((*(unsigned char *)(*(void *)(v7 + 8) + 32) & 8) != 0 && (*(_WORD *)(v7 + 192) & 2) != 0)
    {
      if (v8) {
        sub_25C7CC6BC((void *)v7);
      }
      sub_25C7CF66C(v7, (size_t)buf, &v76);
    }
    id v10 = (std::__shared_weak_count *)a1[5];
    v63[3] = a1[4];
    __int16 v64 = v10;
    if (v10) {
      atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    *(void *)unint64_t v96 = &v96[16];
    *(void *)&v96[8] = 0x800000000;
    int v11 = skit::FieldSpanMatcherV3::alias_span_matcher();
    if (*(unsigned char **)v96 != &v96[16]) {
      free(*(void **)v96);
    }
    if (v64) {
      sub_25C7D2280(v64);
    }
    if (v11 < 0)
    {
      uint64_t v58 = qword_26B3549C0;
      if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)unint64_t v96 = 136315138;
        *(void *)&v96[4] = "match_spans";
        _os_log_error_impl(&dword_25C7CA000, v58, OS_LOG_TYPE_ERROR, "%s ERROR: alias span matcher cannot be set up", v96, 0xCu);
      }
    }
    else
    {
      unsigned int v12 = v76;
      int v13 = v77;
      uint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (v77 - v76);
      unint64_t v15 = v14 - 0x5555555555555555 * (v74 - v73);
      unint64_t v16 = v70;
      if (0xAAAAAAAAAAAAAAABLL * ((v72 - (uint64_t)v70) >> 4) < v15)
      {
        if (v15 >= 0x555555555555556) {
          sub_25C7D06B8();
        }
        uint64_t v17 = *(long long **)v71;
        uint64_t v98 = &v72;
        *(void *)unint64_t v96 = sub_25C7D06D0((uint64_t)&v72, v15);
        *(void *)&v96[8] = *(void *)v96 + (char *)v17 - (char *)v16;
        *(void *)&v96[16] = *(void *)&v96[8];
        uint64_t v97 = *(void *)v96 + 48 * v18;
        sub_25C7D0640((uint64_t *)&v70, v96);
        sub_25C7D0848((uint64_t)v96);
        unsigned int v12 = v76;
        int v13 = v77;
        uint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (v77 - v76);
      }
      sub_25C7D71B8((uint64_t *)&v70, *(long long **)v71, v12, v13, v14);
      sub_25C7D71B8((uint64_t *)&v70, *(long long **)v71, v73, v74, 0xAAAAAAAAAAAAAAABLL * (v74 - v73));
      sub_25C7D99E8((uint64_t)v96, a2);
      uint64_t v19 = *(uint64_t ***)&v96[16];
      if (*(void *)&v96[16])
      {
        uint64_t v60 = v7;
        do
        {
          uint64_t token_stream_begin = skit::FieldSpanMatcherV3::query_token_stream_begin((skit::FieldSpanMatcherV3 *)v68);
          uint64_t token_stream_end = skit::FieldSpanMatcherV3::query_token_stream_end((skit::FieldSpanMatcherV3 *)v68);
          sub_25C7CCEF8(v7, token_stream_begin, token_stream_end, *((unsigned __int16 *)v19 + 8));
          sub_25C7CCEF8(v7, (uint64_t)v70, *(uint64_t *)v71, *((unsigned __int16 *)v19 + 8));
          sub_25C821AFC(*((unsigned __int16 *)v19 + 8), *(void *)(v7 + 176), *(_WORD *)(v7 + 192), (uint64_t)&v90);
          skit::FieldSpanMatcherV3::alias_filters();
          if (v90 != (char *)&v92 + 4) {
            free(v90);
          }
          memset(&v62, 0, sizeof(v62));
          sub_25C7D35C0((char *)&v62, v70, *(long long **)v71, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)v71 - (void)v70) >> 4));
          unint64_t v22 = *((unsigned __int16 *)v19 + 8);
          alias_matches_begin = (long long *)skit::FieldSpanMatcherV3::query_alias_matches_begin((skit::FieldSpanMatcherV3 *)v68);
          alias_matches_end = (long long *)skit::FieldSpanMatcherV3::query_alias_matches_end((skit::FieldSpanMatcherV3 *)v68);
          sub_25C7CCBCC(v7, &v62, v22, alias_matches_begin, alias_matches_end, v63);
          uint64_t v90 = &v62;
          sub_25C7D025C((void ***)&v90);
          int v91 = 0;
          uint64_t v90 = 0;
          int v94 = 1;
          uint64_t v92 = 0x100000014;
          int v93 = 872415232;
          int v25 = *((unsigned __int16 *)v19 + 8);
          if (v25 == 1)
          {
            int v26 = 2;
          }
          else
          {
            if (v25 != 5) {
              goto LABEL_37;
            }
            int v26 = 3;
          }
          HIDWORD(v90) = v26;
LABEL_37:
          skit::IndexReader::search();
          sub_25C7D9DD0(a3, 0xCCCCCCCCCCCCCCCDLL * ((v80 - (unsigned char *)v79) >> 3) + ((a3[1] - *a3) >> 5));
          unint64_t v28 = v79;
          unint64_t v27 = v80;
          if (v79 != v80)
          {
            while (1)
            {
              if (!v28[3])
              {
                unint64_t v22 = qword_26B3549C0;
                if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)int v88 = 136315138;
                  unint64_t v89 = "match_spans";
                  _os_log_error_impl(&dword_25C7CA000, (os_log_t)v22, OS_LOG_TYPE_ERROR, "%s Document missing", v88, 0xCu);
                }
                goto LABEL_113;
              }
              unint64_t v29 = v28[1];
              unint64_t v30 = *((void *)&v82 + 1);
              if (*((void *)&v82 + 1))
              {
                uint8x8_t v31 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v82 + 8));
                v31.i16[0] = vaddlv_u8(v31);
                if (v31.u32[0] > 1uLL)
                {
                  unint64_t v22 = v28[1];
                  if (*((void *)&v82 + 1) <= v29) {
                    unint64_t v22 = v29 % *((void *)&v82 + 1);
                  }
                }
                else
                {
                  unint64_t v22 = (*((void *)&v82 + 1) - 1) & v29;
                }
                uint64_t v32 = *(void **)(v82 + 8 * v22);
                if (v32)
                {
                  for (uint64_t i = (void *)*v32; i; uint64_t i = (void *)*i)
                  {
                    unint64_t v34 = i[1];
                    if (v34 == v29)
                    {
                      if (i[2] == v29) {
                        goto LABEL_113;
                      }
                    }
                    else
                    {
                      if (v31.u32[0] > 1uLL)
                      {
                        if (v34 >= *((void *)&v82 + 1)) {
                          v34 %= *((void *)&v82 + 1);
                        }
                      }
                      else
                      {
                        v34 &= *((void *)&v82 + 1) - 1;
                      }
                      if (v34 != v22) {
                        break;
                      }
                    }
                  }
                }
              }
              uint64_t v35 = operator new(0x18uLL);
              void *v35 = 0;
              v35[1] = v29;
              v35[2] = v29;
              float v36 = (float)(unint64_t)(*((void *)&v83 + 1) + 1);
              if (!v30 || (float)(v84 * (float)v30) < v36) {
                break;
              }
LABEL_103:
              uint64_t v52 = v82;
              uint64_t v53 = *(void **)(v82 + 8 * v22);
              if (v53)
              {
                void *v35 = *v53;
LABEL_111:
                *uint64_t v53 = v35;
                goto LABEL_112;
              }
              void *v35 = v83;
              *(void *)&long long v83 = v35;
              *(void *)(v52 + 8 * v22) = &v83;
              if (*v35)
              {
                unint64_t v54 = *(void *)(*v35 + 8);
                if ((v30 & (v30 - 1)) != 0)
                {
                  if (v54 >= v30) {
                    v54 %= v30;
                  }
                }
                else
                {
                  v54 &= v30 - 1;
                }
                uint64_t v53 = (void *)(v82 + 8 * v54);
                goto LABEL_111;
              }
LABEL_112:
              ++*((void *)&v83 + 1);
              sub_25C7D9E54();
LABEL_113:
              v28 += 5;
              if (v28 == (void *)v27)
              {
                unint64_t v28 = v79;
                goto LABEL_124;
              }
            }
            BOOL v37 = (v30 & (v30 - 1)) != 0;
            if (v30 < 3) {
              BOOL v37 = 1;
            }
            unint64_t v38 = v37 | (2 * v30);
            unint64_t v39 = vcvtps_u32_f32(v36 / v84);
            if (v38 <= v39) {
              int8x8_t prime = (int8x8_t)v39;
            }
            else {
              int8x8_t prime = (int8x8_t)v38;
            }
            if (*(void *)&prime == 1)
            {
              int8x8_t prime = (int8x8_t)2;
            }
            else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
            {
              int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
              unint64_t v30 = *((void *)&v82 + 1);
            }
            if (*(void *)&prime <= v30)
            {
              if (*(void *)&prime < v30)
              {
                unint64_t v47 = vcvtps_u32_f32((float)*((unint64_t *)&v83 + 1) / v84);
                if (v30 < 3
                  || (uint8x8_t v48 = (uint8x8_t)vcnt_s8((int8x8_t)v30), v48.i16[0] = vaddlv_u8(v48), v48.u32[0] > 1uLL))
                {
                  unint64_t v47 = std::__next_prime(v47);
                }
                else
                {
                  uint64_t v49 = 1 << -(char)__clz(v47 - 1);
                  if (v47 >= 2) {
                    unint64_t v47 = v49;
                  }
                }
                if (*(void *)&prime <= v47) {
                  int8x8_t prime = (int8x8_t)v47;
                }
                if (*(void *)&prime >= v30)
                {
                  unint64_t v30 = *((void *)&v82 + 1);
                }
                else
                {
                  if (prime) {
                    goto LABEL_69;
                  }
                  unsigned int v55 = (void *)v82;
                  *(void *)&long long v82 = 0;
                  if (v55) {
                    operator delete(v55);
                  }
                  unint64_t v30 = 0;
                  *((void *)&v82 + 1) = 0;
                }
              }
            }
            else
            {
LABEL_69:
              if (*(void *)&prime >> 61) {
                sub_25C7D019C();
              }
              uint64_t v41 = operator new(8 * *(void *)&prime);
              uint64_t v42 = (void *)v82;
              *(void *)&long long v82 = v41;
              if (v42) {
                operator delete(v42);
              }
              uint64_t v43 = 0;
              *((int8x8_t *)&v82 + 1) = prime;
              do
                *(void *)(v82 + 8 * v43++) = 0;
              while (*(void *)&prime != v43);
              uint64_t v44 = (void **)v83;
              if ((void)v83)
              {
                unint64_t v45 = *(void *)(v83 + 8);
                uint8x8_t v46 = (uint8x8_t)vcnt_s8(prime);
                v46.i16[0] = vaddlv_u8(v46);
                if (v46.u32[0] > 1uLL)
                {
                  if (v45 >= *(void *)&prime) {
                    v45 %= *(void *)&prime;
                  }
                }
                else
                {
                  v45 &= *(void *)&prime - 1;
                }
                *(void *)(v82 + 8 * v45) = &v83;
                for (j = *v44; j; unint64_t v45 = v51)
                {
                  unint64_t v51 = j[1];
                  if (v46.u32[0] > 1uLL)
                  {
                    if (v51 >= *(void *)&prime) {
                      v51 %= *(void *)&prime;
                    }
                  }
                  else
                  {
                    v51 &= *(void *)&prime - 1;
                  }
                  if (v51 != v45)
                  {
                    if (!*(void *)(v82 + 8 * v51))
                    {
                      *(void *)(v82 + 8 * v51) = v44;
                      goto LABEL_94;
                    }
                    unsigned __int16 *v44 = (void *)*j;
                    void *j = **(void **)(v82 + 8 * v51);
                    **(void **)(v82 + 8 * v51) = j;
                    uint64_t j = v44;
                  }
                  unint64_t v51 = v45;
LABEL_94:
                  uint64_t v44 = (void **)j;
                  uint64_t j = (void *)*j;
                }
              }
              unint64_t v30 = (unint64_t)prime;
            }
            if ((v30 & (v30 - 1)) != 0)
            {
              if (v30 <= v29) {
                unint64_t v22 = v29 % v30;
              }
              else {
                unint64_t v22 = v29;
              }
            }
            else
            {
              unint64_t v22 = (v30 - 1) & v29;
            }
            goto LABEL_103;
          }
LABEL_124:
          __int16 v80 = v28;
          uint64_t v90 = v63;
          sub_25C7D025C((void ***)&v90);
          uint64_t v19 = (uint64_t **)*v19;
          uint64_t v7 = v60;
        }
        while (v19);
      }
      sub_25C7DFD9C((uint64_t)v96);
      uint64_t v56 = qword_26B3549C0;
      if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v57 = (a3[1] - *a3) >> 5;
        *(_DWORD *)unint64_t v96 = 136315394;
        *(void *)&v96[4] = "match_spans";
        *(_WORD *)&v96[12] = 2048;
        *(void *)&v96[14] = v57;
        _os_log_debug_impl(&dword_25C7CA000, v56, OS_LOG_TYPE_DEBUG, "%s Skit search produced %lu document hit(s)", v96, 0x16u);
      }
    }
    sub_25C7D2390((uint64_t *)buf);
    if (v69) {
      sub_25C7D2280(v69);
    }
  }
  else
  {
    uint64_t v9 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = "match_spans";
      _os_log_error_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_ERROR, "%s ERROR: index reader is not open", buf, 0xCu);
    }
  }
  *(void *)long long buf = &v70;
  sub_25C7D025C((void ***)buf);

  *(void *)long long buf = &v73;
  sub_25C7D025C((void ***)buf);
  *(void *)long long buf = &v76;
  sub_25C7D025C((void ***)buf);
  if (v79)
  {
    __int16 v80 = v79;
    operator delete(v79);
  }
  sub_25C7DFD9C((uint64_t)&v82);
  if (v59) {
    sub_25C7D2280(v59);
  }
  *(void *)long long buf = v87;
  sub_25C7DFCCC((void ***)buf);
}

void sub_25C7DC160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, char a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,uint64_t a36,std::__shared_weak_count *a37,char a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,void *__p,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,void *a62)
{
  sub_25C7D0848(v63 - 160);
  sub_25C7D2390((uint64_t *)(v63 - 256));
  if (a37) {
    sub_25C7D2280(a37);
  }
  *(void *)(v63 - 256) = &a38;
  sub_25C7D025C((void ***)(v63 - 256));

  *(void *)(v63 - 256) = &a41;
  sub_25C7D025C((void ***)(v63 - 256));
  *(void *)(v63 - 256) = &a44;
  sub_25C7D025C((void ***)(v63 - 256));
  if (__p)
  {
    a48 = (uint64_t)__p;
    operator delete(__p);
  }
  sub_25C7DFD9C((uint64_t)&a50);
  if (a10) {
    sub_25C7D2280(a10);
  }
  *(void *)(v63 - 256) = &a57;
  sub_25C7DFCCC((void ***)(v63 - 256));
  *(void *)(v63 - 256) = v62;
  sub_25C7DFD20((void ***)(v63 - 256));
  _Unwind_Resume(a1);
}

uint64_t *sub_25C7DC30C(uint64_t a1, unint64_t a2, unsigned __int16 *a3)
{
  unint64_t v6 = *(void *)(a1 + 8);
  float v7 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v8 = *(float *)(a1 + 32);
  if (!v6 || (float)(v8 * (float)v6) < v7)
  {
    BOOL v9 = 1;
    if (v6 >= 3) {
      BOOL v9 = (v6 & (v6 - 1)) != 0;
    }
    unint64_t v10 = v9 | (2 * v6);
    unint64_t v11 = vcvtps_u32_f32(v7 / v8);
    if (v10 <= v11) {
      int8x8_t prime = (int8x8_t)v11;
    }
    else {
      int8x8_t prime = (int8x8_t)v10;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v6 = *(void *)(a1 + 8);
    }
    if (*(void *)&prime > v6) {
      goto LABEL_74;
    }
    if (*(void *)&prime >= v6) {
      goto LABEL_43;
    }
    unint64_t v19 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (v6 < 3 || (uint8x8_t v20 = (uint8x8_t)vcnt_s8((int8x8_t)v6), v20.i16[0] = vaddlv_u8(v20), v20.u32[0] > 1uLL))
    {
      unint64_t v19 = std::__next_prime(v19);
    }
    else
    {
      uint64_t v21 = 1 << -(char)__clz(v19 - 1);
      if (v19 >= 2) {
        unint64_t v19 = v21;
      }
    }
    if (*(void *)&prime <= v19) {
      int8x8_t prime = (int8x8_t)v19;
    }
    if (*(void *)&prime >= v6)
    {
      unint64_t v6 = *(void *)(a1 + 8);
      goto LABEL_43;
    }
    if (prime)
    {
LABEL_74:
      if (*(void *)&prime >> 61) {
        sub_25C7D019C();
      }
      int v13 = operator new(8 * *(void *)&prime);
      uint64_t v14 = *(void **)a1;
      *(void *)a1 = v13;
      if (v14) {
        operator delete(v14);
      }
      uint64_t v15 = 0;
      *(int8x8_t *)(a1 + 8) = prime;
      do
        *(void *)(*(void *)a1 + 8 * v15++) = 0;
      while (*(void *)&prime != v15);
      unint64_t v16 = *(uint64_t ***)(a1 + 16);
      if (v16)
      {
        unint64_t v17 = (unint64_t)v16[1];
        uint8x8_t v18 = (uint8x8_t)vcnt_s8(prime);
        v18.i16[0] = vaddlv_u8(v18);
        if (v18.u32[0] > 1uLL)
        {
          if (v17 >= *(void *)&prime) {
            v17 %= *(void *)&prime;
          }
        }
        else
        {
          v17 &= *(void *)&prime - 1;
        }
        *(void *)(*(void *)a1 + 8 * v17) = a1 + 16;
        for (uint64_t i = *v16; *v16; uint64_t i = *v16)
        {
          unint64_t v23 = i[1];
          if (v18.u32[0] > 1uLL)
          {
            if (v23 >= *(void *)&prime) {
              v23 %= *(void *)&prime;
            }
          }
          else
          {
            v23 &= *(void *)&prime - 1;
          }
          if (v23 == v17)
          {
            unint64_t v16 = (uint64_t **)i;
          }
          else
          {
            unint64_t v24 = i;
            if (*(void *)(*(void *)a1 + 8 * v23))
            {
              do
              {
                int v25 = v24;
                unint64_t v24 = (uint64_t *)*v24;
              }
              while (v24 && *((unsigned __int16 *)i + 8) == *((unsigned __int16 *)v24 + 8));
              *unint64_t v16 = v24;
              void *v25 = **(void **)(*(void *)a1 + 8 * v23);
              **(void **)(*(void *)a1 + 8 * v23) = i;
            }
            else
            {
              *(void *)(*(void *)a1 + 8 * v23) = v16;
              unint64_t v16 = (uint64_t **)i;
              unint64_t v17 = v23;
            }
          }
        }
      }
      unint64_t v6 = (unint64_t)prime;
    }
    else
    {
      uint64_t v35 = *(void **)a1;
      *(void *)a1 = 0;
      if (v35) {
        operator delete(v35);
      }
      unint64_t v6 = 0;
      *(void *)(a1 + 8) = 0;
    }
  }
LABEL_43:
  uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v26.i16[0] = vaddlv_u8(v26);
  if (v26.u32[0] > 1uLL)
  {
    unint64_t v27 = a2;
    if (v6 <= a2) {
      unint64_t v27 = a2 % v6;
    }
  }
  else
  {
    unint64_t v27 = (v6 - 1) & a2;
  }
  unint64_t v28 = *(uint64_t **)(*(void *)a1 + 8 * v27);
  if (!v28) {
    return 0;
  }
  int v29 = 0;
  do
  {
    uint64_t result = v28;
    unint64_t v28 = (uint64_t *)*v28;
    if (!v28) {
      break;
    }
    unint64_t v31 = v28[1];
    if (v26.u32[0] > 1uLL)
    {
      unint64_t v32 = v28[1];
      if (v31 >= v6) {
        unint64_t v32 = v31 % v6;
      }
    }
    else
    {
      unint64_t v32 = v31 & (v6 - 1);
    }
    if (v32 != v27) {
      break;
    }
    BOOL v33 = v31 == a2 && *((unsigned __int16 *)v28 + 8) == *a3;
    int v34 = v29 & !v33;
    v29 |= v33;
  }
  while (v34 != 1);
  return result;
}

void *sub_25C7DC65C(void *result, void *a2, void *a3)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  if (!a3)
  {
    *a2 = result[2];
    result[2] = a2;
    *(void *)(*result + 8 * v4) = result + 2;
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
LABEL_18:
    *(void *)(*result + 8 * v6) = a2;
    goto LABEL_19;
  }
  *a2 = *a3;
  *a3 = a2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v3) {
        v6 %= *(void *)&v3;
      }
    }
    else
    {
      v6 &= *(void *)&v3 - 1;
    }
    if (v6 != v4) {
      goto LABEL_18;
    }
  }
LABEL_19:
  ++result[3];
  return result;
}

void *sub_25C7DC744(uint64_t a1, unsigned __int16 *a2, _WORD *a3)
{
  unint64_t v6 = *a2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = *a2;
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    BOOL v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      unint64_t v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == v6)
          {
            if (*((unsigned __int16 *)v10 + 8) == v6) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          unint64_t v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  unint64_t v10 = operator new(0x18uLL);
  *unint64_t v10 = 0;
  v10[1] = v6;
  *((_WORD *)v10 + 8) = *a3;
  float v12 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      size_t v17 = v16;
    }
    else {
      size_t v17 = v15;
    }
    sub_25C7DC964(a1, v17);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v18 = *(void *)a1;
  unint64_t v19 = *(void **)(*(void *)a1 + 8 * v3);
  if (v19)
  {
    *unint64_t v10 = *v19;
LABEL_38:
    *unint64_t v19 = v10;
    goto LABEL_39;
  }
  *unint64_t v10 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v10;
  *(void *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    unint64_t v20 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7) {
        v20 %= v7;
      }
    }
    else
    {
      v20 &= v7 - 1;
    }
    unint64_t v19 = (void *)(*(void *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_25C7DC950(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_25C7DC964(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      sub_25C7DCA54(a1, prime);
    }
  }
}

void sub_25C7DCA54(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      sub_25C7D019C();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      unint64_t v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            void *v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            unint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          unint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

uint64_t *sub_25C7DCBB0(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  int8x8_t v4 = (void *)a2[1];
  while (v2 != v3)
  {
    uint64_t v5 = *(void *)(v2 - 32);
    v2 -= 32;
    *(v4 - 4) = v5;
    v4 -= 4;
    v4[2] = 0;
    v4[3] = 0;
    v4[1] = 0;
    *(_OWORD *)(v4 + 1) = *(_OWORD *)(v2 + 8);
    v4[3] = *(void *)(v2 + 24);
    *(void *)(v2 + 8) = 0;
    *(void *)(v2 + 16) = 0;
    *(void *)(v2 + 24) = 0;
  }
  a2[1] = v4;
  uint64_t v6 = *result;
  *uint64_t result = (uint64_t)v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_25C7DCC28(unint64_t a1)
{
  if (a1 >> 59) {
    sub_25C7D019C();
  }
  return operator new(32 * a1);
}

void sub_25C7DCC60(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    uint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 568;
        sub_25C7DCCE4(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_25C7DCCE4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 520);
  if (v2 != (void *)(a1 + 536)) {
    free(v2);
  }
  if (*(char *)(a1 + 487) < 0) {
    operator delete(*(void **)(a1 + 464));
  }
  return sub_25C7DCD3C(a1);
}

uint64_t sub_25C7DCD3C(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(unsigned int *)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = 112 * v3;
    do
    {
      uint64_t v2 = (void *)(sub_25C7DCD98((uint64_t)v2) + 112);
      v4 -= 112;
    }
    while (v4);
    uint64_t v2 = *(void **)a1;
  }
  if (v2 != (void *)(a1 + 16)) {
    free(v2);
  }
  return a1;
}

uint64_t sub_25C7DCD98(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  if (v2 != (void *)(a1 + 96)) {
    free(v2);
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

uint64_t sub_25C7DCDE0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 32;
    uint64_t v5 = (void **)(i - 24);
    sub_25C7DCC60(&v5);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

BOOL sub_25C7DCE44(int *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v3 <= a3) {
    return 1;
  }
  uint64_t v4 = *(unsigned __int16 *)((char *)v3 + a3);
  if (!v4) {
    return 1;
  }
  unint64_t v5 = (unint64_t)a1 + v4 - *(void *)a2;
  if ((v5 & 3) != 0 && *(unsigned char *)(a2 + 40) != 0) {
    return 0;
  }
  BOOL result = 0;
  unint64_t v8 = *(void *)(a2 + 8);
  if (v8 >= 5 && v8 - 4 >= v5)
  {
    uint64_t v9 = *(unsigned int *)(*(void *)a2 + v5);
    if ((int)v9 >= 1) {
      return v8 - 1 >= v5 + v9;
    }
    return 0;
  }
  return result;
}

BOOL sub_25C7DCECC(uint64_t *a1, int *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = (unint64_t)a2 - *a1;
  if ((v3 & 3) != 0 && *((unsigned char *)a1 + 40)) {
    return 0;
  }
  unint64_t v4 = a1[1];
  BOOL v5 = v4 >= 5 && v4 - 4 >= v3;
  if (!v5) {
    return 0;
  }
  uint64_t v6 = *a2;
  unsigned int v7 = *((_DWORD *)a1 + 5);
  unsigned int v8 = *((_DWORD *)a1 + 4) + 1;
  *((_DWORD *)a1 + 4) = v8;
  unsigned int v9 = *((_DWORD *)a1 + 6) + 1;
  *((_DWORD *)a1 + 6) = v9;
  if (v8 > v7 || v9 > *((_DWORD *)a1 + 7)) {
    return 0;
  }
  unint64_t v10 = v3 - v6;
  if (v10)
  {
    uint64_t v11 = 0;
    if (*((unsigned char *)a1 + 40) || v4 - 2 < v10) {
      return v11;
    }
  }
  else if (v4 - 2 < v10)
  {
    return 0;
  }
  unint64_t v12 = *(unsigned __int16 *)(v2 + v10);
  if ((v12 & 1) != 0 && *((unsigned char *)a1 + 40)) {
    return 0;
  }
  BOOL v5 = v4 >= v12;
  unint64_t v14 = v4 - v12;
  return v14 != 0 && v5 && v14 >= v10;
}

BOOL sub_25C7DCF84(uint64_t a1, unsigned int *a2, unint64_t a3, void *a4)
{
  unint64_t v4 = (unint64_t)a2 - *(void *)a1;
  if ((v4 & 3) != 0 && *(unsigned char *)(a1 + 40)) {
    return 0;
  }
  unint64_t v5 = *(void *)(a1 + 8);
  if (v5 < 5 || v5 - 4 < v4) {
    return 0;
  }
  unint64_t v7 = *a2;
  if (0x7FFFFFFF / a3 <= v7) {
    return 0;
  }
  unint64_t v8 = v7 * a3 + 4;
  if (a4)
  {
    *a4 = v8 + v4;
    unint64_t v5 = *(void *)(a1 + 8);
  }
  BOOL v9 = v5 > v8;
  unint64_t v10 = v5 - v8;
  return v9 && v10 >= v4;
}

BOOL sub_25C7DCFF4(void *a1, unsigned int *a2)
{
  if (!a2) {
    return 1;
  }
  unint64_t v6 = 0;
  BOOL result = sub_25C7DCF84((uint64_t)a1, a2, 1uLL, &v6);
  if (result)
  {
    unint64_t v4 = a1[1];
    return v4 >= 2 && v4 - 1 >= v6 && *(unsigned char *)(*a1 + v6) == 0;
  }
  return result;
}

uint64_t sub_25C7DD070(uint64_t result, uint64_t a2)
{
  *(void *)(result + 48) = *(void *)(a2 + 48);
  return result;
}

void sub_25C7DD080(void *a1, void *a2)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v73 = a2;
  if (*(unsigned char *)(*(void *)(a1[4] + 8) + 24))
  {
    unint64_t v6 = *(unsigned int **)(*(void *)(a1[5] + 8) + 48);
    if (v6 != (unsigned int *)a1[7])
    {
      unint64_t v7 = (int *)((char *)v6 + *v6);
      unint64_t v8 = (unsigned __int16 *)((char *)v7 - *v7);
      if (*v8 >= 5u && (uint64_t v9 = v8[2]) != 0) {
        int v10 = *(unsigned __int16 *)((char *)v7 + v9);
      }
      else {
        int v10 = 0;
      }
      if (*(_DWORD *)(*(void *)(a1[6] + 8) + 24) == v10)
      {
        int v74 = objc_msgSend_fieldType(v73, v3, v4, v5);
        int v14 = objc_msgSend_dataType(v73, v11, v12, v13);
        if (v14)
        {
          if (v14 == 1)
          {
            long long v77 = 0u;
            long long v78 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            uint64_t v50 = objc_msgSend_repeatedStringValueNoCopy(v73, v15, v16, v17);
            uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v51, (uint64_t)&v75, (uint64_t)v85, 16);
            if (v52)
            {
              uint64_t v53 = *(void *)v76;
              do
              {
                for (uint64_t i = 0; i != v52; ++i)
                {
                  if (*(void *)v76 != v53) {
                    objc_enumerationMutation(v50);
                  }
                  unsigned int v55 = *(unsigned int **)(*(void *)(a1[5] + 8) + 48);
                  uint64_t v56 = *v55;
                  id v57 = *(id *)(*((void *)&v75 + 1) + 8 * i);
                  if (objc_msgSend_length(v57, v58, v59, v60))
                  {
                    id v61 = (int64x2_t *)a1[8];
                    id v62 = v57;
                    uint64_t v66 = (char *)objc_msgSend_UTF8String(v62, v63, v64, v65);
                    uint64_t v67 = (int *)((char *)v55 + v56);
                    unint64_t v68 = v61->u64[1];
                    if (v68 >= v61[1].i64[0])
                    {
                      uint64_t v69 = sub_25C7DD67C(v61, v74, v67, v66);
                    }
                    else
                    {
                      sub_25C7DD60C((uint64_t)v61, v74, v67, v66);
                      uint64_t v69 = v68 + 72;
                    }
                    v61->i64[1] = v69;

                    *(void *)(*(void *)(a1[5] + 8) + 48) += 4;
                  }
                  else
                  {
                  }
                }
                uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v50, v70, (uint64_t)&v75, (uint64_t)v85, 16);
              }
              while (v52);
            }
          }
          else
          {
            if (v14 == 20)
            {
              int v18 = objc_msgSend_rawEnumValue(v73, v15, v16, v17);
              unint64_t v19 = sub_25C821ACC(v18, v74);
              unint64_t v20 = *(unsigned int **)(*(void *)(a1[5] + 8) + 48);
              uint64_t v21 = *v20;
              id v22 = v19;
              if (objc_msgSend_length(v22, v23, v24, v25))
              {
                uint8x8_t v26 = (int64x2_t *)a1[8];
                id v27 = v22;
                unint64_t v31 = (char *)objc_msgSend_UTF8String(v27, v28, v29, v30);
                unint64_t v32 = (int *)((char *)v20 + v21);
                unint64_t v33 = v26->u64[1];
                if (v33 >= v26[1].i64[0])
                {
                  uint64_t v34 = sub_25C7DD67C(v26, v74, v32, v31);
                }
                else
                {
                  sub_25C7DD60C((uint64_t)v26, v74, v32, v31);
                  uint64_t v34 = v33 + 72;
                }
                v26->i64[1] = v34;

                *(void *)(*(void *)(a1[5] + 8) + 48) += 4;
                goto LABEL_39;
              }
LABEL_34:

LABEL_39:
              goto LABEL_40;
            }
            uint64_t v71 = qword_26B3549C0;
            if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_ERROR))
            {
              int v72 = *(_DWORD *)(*(void *)(a1[6] + 8) + 24);
              *(_DWORD *)long long buf = 136315650;
              __int16 v80 = "match_spans_of_cascade_entity_block_invoke";
              __int16 v81 = 1024;
              int v82 = v72;
              __int16 v83 = 2112;
              id v84 = v73;
              _os_log_error_impl(&dword_25C7CA000, v71, OS_LOG_TYPE_ERROR, "%s field index: %u has unexpected type: %@", buf, 0x1Cu);
            }
            *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
          }
        }
        else
        {
          uint64_t v35 = objc_msgSend_stringValueNoCopy(v73, v15, v16, v17);
          float v36 = *(unsigned int **)(*(void *)(a1[5] + 8) + 48);
          uint64_t v37 = *v36;
          id v22 = v35;
          if (!objc_msgSend_length(v22, v38, v39, v40)) {
            goto LABEL_34;
          }
          uint64_t v41 = (int64x2_t *)a1[8];
          id v42 = v22;
          uint8x8_t v46 = (char *)objc_msgSend_UTF8String(v42, v43, v44, v45);
          unint64_t v47 = (int *)((char *)v36 + v37);
          unint64_t v48 = v41->u64[1];
          if (v48 >= v41[1].i64[0])
          {
            uint64_t v49 = sub_25C7DD67C(v41, v74, v47, v46);
          }
          else
          {
            sub_25C7DD60C((uint64_t)v41, v74, v47, v46);
            uint64_t v49 = v48 + 72;
          }
          v41->i64[1] = v49;

          *(void *)(*(void *)(a1[5] + 8) + 48) += 4;
        }
      }
    }
  }
LABEL_40:
  ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
}

void sub_25C7DD49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C7DD500(uint64_t result, uint64_t a2)
{
  *(void *)(result + 56) = *(void *)(a2 + 56);
  return result;
}

uint64_t *sub_25C7DD510(uint64_t *result, void *a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result + 2;
  unint64_t v5 = result[2];
  unint64_t v6 = (void *)result[1];
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = ((uint64_t)v6 - *result) >> 5;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 59) {
      sub_25C7D06B8();
    }
    uint64_t v10 = v5 - *result;
    if (v10 >> 4 > v9) {
      unint64_t v9 = v10 >> 4;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v11 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v9;
    }
    v14[4] = v4;
    if (v11) {
      unint64_t v11 = (unint64_t)sub_25C7DCC28(v11);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v13 = (void *)(v11 + 32 * v8);
    v14[0] = v11;
    v14[1] = v13;
    v14[3] = v11 + 32 * v12;
    *uint64_t v13 = *a2 + *(unsigned int *)*a2;
    v13[1] = 0;
    v13[2] = 0;
    void v13[3] = 0;
    v14[2] = v13 + 4;
    sub_25C7DCBB0(v3, v14);
    unint64_t v7 = (void *)v3[1];
    BOOL result = (uint64_t *)sub_25C7DCDE0((uint64_t)v14);
  }
  else
  {
    *unint64_t v6 = *a2 + *(unsigned int *)*a2;
    v6[1] = 0;
    v6[2] = 0;
    v6[3] = 0;
    unint64_t v7 = v6 + 4;
  }
  v3[1] = (uint64_t)v7;
  return result;
}

uint64_t sub_25C7DD60C(uint64_t a1, __int16 a2, int *a3, char *__s)
{
  uint64_t v8 = *(void *)(a1 + 8);
  size_t v9 = strlen(__s);
  uint64_t result = sub_25C7DD864(v8, a2, a3, (uint64_t)__s, v9);
  *(void *)(a1 + 8) = v8 + 72;
  return result;
}

void sub_25C7DD674(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_25C7DD67C(int64x2_t *a1, __int16 a2, int *a3, const char *a4)
{
  unint64_t v4 = 0x8E38E38E38E38E39 * ((a1->i64[1] - a1->i64[0]) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x38E38E38E38E38ELL) {
    sub_25C7D06B8();
  }
  if (0x1C71C71C71C71C72 * ((a1[1].i64[0] - a1->i64[0]) >> 3) > v5) {
    unint64_t v5 = 0x1C71C71C71C71C72 * ((a1[1].i64[0] - a1->i64[0]) >> 3);
  }
  if (0x8E38E38E38E38E39 * ((a1[1].i64[0] - a1->i64[0]) >> 3) >= 0x1C71C71C71C71C7) {
    unint64_t v10 = 0x38E38E38E38E38ELL;
  }
  else {
    unint64_t v10 = v5;
  }
  id v27 = a1 + 1;
  if (v10)
  {
    if (v10 > 0x38E38E38E38E38ELL) {
      sub_25C7D019C();
    }
    unint64_t v11 = (char *)operator new(72 * v10);
  }
  else
  {
    unint64_t v11 = 0;
  }
  uint64_t v24 = v11;
  v25.i64[0] = (uint64_t)&v11[72 * v4];
  uint8x8_t v26 = &v11[72 * v10];
  size_t v12 = strlen(a4);
  sub_25C7DD864(v25.i64[0], a2, a3, (uint64_t)a4, v12);
  uint64_t v13 = v25.i64[0];
  uint64_t v14 = v25.i64[0] + 72;
  v25.i64[1] = v25.i64[0] + 72;
  uint64_t v16 = a1->i64[0];
  unint64_t v15 = a1->u64[1];
  if (v15 == a1->i64[0])
  {
    int64x2_t v21 = vdupq_n_s64(v15);
  }
  else
  {
    uint64_t v17 = 0;
    do
    {
      uint64_t v18 = v13 + v17;
      uint64_t v19 = v15 + v17;
      uint64_t v20 = *(void *)(v15 + v17 - 56);
      *(_OWORD *)(v18 - 72) = *(_OWORD *)(v15 + v17 - 72);
      *(void *)(v18 - 56) = v20;
      *(void *)(v18 - 48) = 0;
      *(void *)(v18 - 40) = 0;
      *(void *)(v18 - 32) = 0;
      *(_OWORD *)(v18 - 48) = *(_OWORD *)(v15 + v17 - 48);
      *(void *)(v18 - 32) = *(void *)(v15 + v17 - 32);
      *(void *)(v19 - 48) = 0;
      *(void *)(v19 - 40) = 0;
      *(void *)(v19 - 32) = 0;
      *(void *)(v18 - 24) = 0;
      *(void *)(v18 - 16) = 0;
      *(void *)(v18 - 8) = 0;
      *(_OWORD *)(v18 - 24) = *(_OWORD *)(v15 + v17 - 24);
      *(void *)(v18 - 8) = *(void *)(v15 + v17 - 8);
      *(void *)(v19 - 24) = 0;
      *(void *)(v19 - 16) = 0;
      *(void *)(v19 - 8) = 0;
      v17 -= 72;
    }
    while (v15 + v17 != v16);
    int64x2_t v21 = *a1;
    uint64_t v14 = v25.i64[1];
    v13 += v17;
  }
  a1->i64[0] = v13;
  a1->i64[1] = v14;
  int64x2_t v25 = v21;
  id v22 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v26;
  uint8x8_t v26 = v22;
  uint64_t v24 = (char *)v21.i64[0];
  sub_25C7DDAE4((uint64_t)&v24);
  return v14;
}

void sub_25C7DD850(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C7DDAE4((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7DD864(uint64_t a1, __int16 a2, int *a3, uint64_t a4, uint64_t a5)
{
  *(_WORD *)a1 = a2;
  *(void *)(a1 + 8) = a4;
  *(void *)(a1 + 16) = a5;
  *(_OWORD *)(a1 + 24) = 0u;
  unint64_t v7 = (uint64_t *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  uint64_t v8 = (unsigned __int16 *)((char *)a3 - *a3);
  if (*v8 >= 7u && (uint64_t v9 = v8[3]) != 0) {
    unint64_t v10 = (unsigned int *)((char *)a3 + v9 + *(unsigned int *)((char *)a3 + v9));
  }
  else {
    unint64_t v10 = 0;
  }
  sub_25C7D2540((uint64_t *)(a1 + 24), v10);
  uint64_t v11 = *a3;
  if (*(unsigned __int16 *)((char *)a3 - v11) >= 9u && *(_WORD *)((char *)a3 - v11 + 8))
  {
    unint64_t v12 = *(unsigned int *)((char *)a3
                          + *(unsigned __int16 *)((char *)a3 - v11 + 8)
                          + *(unsigned int *)((char *)a3 + *(unsigned __int16 *)((char *)a3 - v11 + 8)));
    uint64_t v13 = *(void *)(a1 + 48);
    if (v12 > (*(void *)(a1 + 64) - v13) >> 5)
    {
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v38 = a1 + 64;
      uint64_t v34 = (char *)sub_25C7D7700(a1 + 64, v12);
      uint64_t v35 = &v34[v14 - v13];
      float v36 = v35;
      uint64_t v37 = &v34[32 * v15];
      sub_25C7D7688(v7, &v34);
      sub_25C7D7868((void **)&v34);
      uint64_t v11 = *a3;
    }
    uint64_t v16 = *(unsigned __int16 *)((char *)a3 - v11 + 8);
    uint64_t v17 = *(unsigned int *)((char *)a3 + v16);
    uint64_t v18 = (unsigned int *)((char *)a3 + v16 + v17);
    uint64_t v19 = *v18;
    if (v19)
    {
      unint64_t v20 = 0;
      uint64_t v21 = 4 * v19;
      id v22 = (char *)a3 + v16 + v17;
      do
      {
        uint64_t v23 = v18[v20 / 4 + 1];
        uint64_t v34 = 0;
        uint64_t v35 = 0;
        LOWORD(v37) = 0;
        float v36 = 0;
        uint64_t v24 = v23 - *(int *)((char *)&v18[v20 / 4 + 1] + v23);
        int64x2_t v25 = &v22[v20 + v24];
        unsigned int v26 = *((unsigned __int16 *)v25 + 2);
        if (v26 < 7)
        {
          if (v26 < 5) {
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v27 = *((unsigned __int16 *)v25 + 5);
          if (v27) {
            LOWORD(v27) = *(_WORD *)&v22[v20 + 4 + v23 + v27];
          }
          LOWORD(v37) = v27;
        }
        uint64_t v28 = *(unsigned __int16 *)&v22[v20 + 8 + v24];
        if (!v28)
        {
LABEL_18:
          uint64_t v29 = 0;
          goto LABEL_19;
        }
        uint64_t v29 = (unsigned int *)&v22[v20 + 4 + v23 + v28 + *(unsigned int *)&v22[v20 + 4 + v23 + v28]];
LABEL_19:
        sub_25C7D2540((uint64_t *)&v34, v29);
        unint64_t v30 = *(void *)(a1 + 56);
        if (v30 >= *(void *)(a1 + 64))
        {
          uint64_t v31 = sub_25C7D757C(v7, (uint64_t)&v34);
        }
        else
        {
          sub_25C7D7508((uint64_t)v7, (uint64_t)&v34);
          uint64_t v31 = v30 + 32;
        }
        *(void *)(a1 + 56) = v31;
        unint64_t v33 = &v34;
        sub_25C7D025C((void ***)&v33);
        v20 += 4;
      }
      while (v21 != v20);
    }
  }
  return a1;
}

void sub_25C7DDA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9, void *a10)
{
}

uint64_t sub_25C7DDAE4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 72;
    unint64_t v5 = (void **)(i - 24);
    sub_25C7D7494(&v5);
    unint64_t v5 = (void **)(i - 48);
    sub_25C7D025C(&v5);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_25C7DDB60(uint64_t result, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a2 + 24);
  if (v2)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)(a2 + 16);
    unint64_t v6 = (uint64_t *)(result + 8);
    unint64_t v7 = (unint64_t *)(result + 24);
    unint64_t v8 = *(void *)(result + 16);
    uint64_t v9 = 552 * v2;
    do
    {
      if (v8 >= *v7)
      {
        uint64_t v10 = 0x193D4BB7E327A977 * ((uint64_t)(v8 - *v6) >> 3);
        unint64_t v11 = v10 + 1;
        if ((unint64_t)(v10 + 1) > 0x73615A240E6C2BLL) {
          sub_25C7D06B8();
        }
        if (0x327A976FC64F52EELL * ((uint64_t)(*v7 - *v6) >> 3) > v11) {
          unint64_t v11 = 0x327A976FC64F52EELL * ((uint64_t)(*v7 - *v6) >> 3);
        }
        if ((unint64_t)(0x193D4BB7E327A977 * ((uint64_t)(*v7 - *v6) >> 3)) >= 0x39B0AD12073615) {
          unint64_t v12 = 0x73615A240E6C2BLL;
        }
        else {
          unint64_t v12 = v11;
        }
        uint64_t v18 = v7;
        if (v12) {
          unint64_t v12 = (unint64_t)sub_25C7DF7B4(v12);
        }
        else {
          uint64_t v13 = 0;
        }
        unint64_t v14 = v12;
        uint64_t v15 = v12 + 568 * v10;
        uint64_t v16 = v15;
        unint64_t v17 = v12 + 568 * v13;
        sub_25C7DF2B8(v15, (unsigned int *)a2, v5);
        v16 += 568;
        sub_25C7DF6B8(v6, &v14);
        unint64_t v8 = *(void *)(v4 + 16);
        uint64_t result = sub_25C7DF914((uint64_t)&v14);
      }
      else
      {
        uint64_t result = sub_25C7DF2B8(v8, (unsigned int *)a2, v5);
        v8 += 568;
        *(void *)(v4 + 16) = v8;
      }
      *(void *)(v4 + 16) = v8;
      v5 += 552;
      v9 -= 552;
    }
    while (v9);
  }
  return result;
}

void sub_25C7DDCD0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C7DF914((uint64_t)va);
  _Unwind_Resume(a1);
}

void *sub_25C7DDCF0(void *result, uint64_t a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a2 + 56))
  {
    unsigned int v2 = result;
    sub_25C7DF588((uint64_t)v3, *(long long **)(a2 + 48));
    sub_25C7DF964(v2);
  }
  return result;
}

void sub_25C7DDDA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  if (a14 != v14) {
    free(a14);
  }
  _Unwind_Resume(exception_object);
}

size_t sub_25C7DDDC4(void **a1, unsigned int a2)
{
  unint64_t v3 = (char *)malloc_type_malloc(320 * a2, 0x103204007ED9757uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    int64x2_t v25 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v25, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  uint64_t v4 = v3;
  uint64_t v5 = (void **)*a1;
  unsigned int v6 = *((_DWORD *)a1 + 2);
  if (v6)
  {
    uint64_t v27 = v3;
    uint64_t v28 = a1;
    uint64_t v26 = *((unsigned int *)a1 + 2);
    unint64_t v7 = (char *)&v5[40 * v6];
    unint64_t v8 = v3;
    uint64_t v9 = (char *)*a1;
    do
    {
      *(_WORD *)unint64_t v8 = *(_WORD *)v9;
      long long v10 = *(_OWORD *)(v9 + 8);
      *((void *)v8 + 3) = *((void *)v9 + 3);
      *(_OWORD *)(v8 + 8) = v10;
      *((void *)v9 + 2) = 0;
      *((void *)v9 + 3) = 0;
      *((void *)v9 + 1) = 0;
      *((_OWORD *)v8 + 2) = *((_OWORD *)v9 + 2);
      unint64_t v11 = (char *)*((void *)v9 + 6);
      if (v11 == v9 + 64)
      {
        *((void *)v8 + 6) = v8 + 64;
        uint64_t v13 = *((unsigned int *)v9 + 14);
        if (v13)
        {
          uint64_t v14 = 0;
          uint64_t v15 = *((void *)v9 + 6);
          do
          {
            uint64_t v16 = &v8[v14];
            uint64_t v17 = v15 + v14;
            long long v18 = *(_OWORD *)(v15 + v14);
            *(_OWORD *)(v16 + 76) = *(_OWORD *)(v15 + v14 + 12);
            *((_OWORD *)v16 + 4) = v18;
            sub_25C7DDFD0((uint64_t)&v8[v14 + 96], v15 + v14 + 32);
            *((_DWORD *)v16 + 30) = *(_DWORD *)(v15 + v14 + 56);
            v14 += 64;
          }
          while (v17 + 64 != v15 + (v13 << 6));
          uint64_t v19 = v13 << 6;
          unint64_t v20 = (void *)(v15 + 48);
          do
          {
            uint64_t v21 = (void *)*(v20 - 2);
            if (v20 != v21) {
              free(v21);
            }
            v20 += 8;
            v19 -= 64;
          }
          while (v19);
        }
        unint64_t v12 = v8 + 60;
      }
      else
      {
        *((void *)v8 + 6) = v11;
        unint64_t v12 = v9 + 60;
        *((_DWORD *)v8 + 15) = *((_DWORD *)v9 + 15);
        *((void *)v9 + 6) = v9 + 64;
      }
      _DWORD *v12 = 4;
      *((_DWORD *)v8 + 14) = *((_DWORD *)v9 + 14);
      *((_DWORD *)v9 + 14) = 0;
      v8 += 320;
      v9 += 320;
    }
    while (v9 != v7);
    uint64_t v22 = 320 * v26;
    do
    {
      sub_25C7DE0E8((uint64_t)v5);
      v5 += 40;
      v22 -= 320;
    }
    while (v22);
    uint64_t v4 = v27;
    a1 = v28;
    uint64_t v5 = (void **)*v28;
  }
  if (v5 != a1 + 2) {
    free(v5);
  }
  *a1 = v4;
  size_t result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x140;
  return result;
}

uint64_t sub_25C7DDFD0(uint64_t result, uint64_t a2)
{
  if (*(void *)a2 == a2 + 16)
  {
    unint64_t v3 = (_WORD *)(result + 16);
    *(void *)size_t result = result + 16;
    uint64_t v4 = *(unsigned int *)(a2 + 8);
    if (v4)
    {
      uint64_t v5 = *(__int16 **)a2;
      uint64_t v6 = 2 * v4;
      do
      {
        __int16 v7 = *v5++;
        *v3++ = v7;
        v6 -= 2;
      }
      while (v6);
    }
    unsigned int v2 = (_DWORD *)(result + 12);
  }
  else
  {
    *(void *)size_t result = *(void *)a2;
    unsigned int v2 = (_DWORD *)(a2 + 12);
    *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
    *(void *)a2 = a2 + 16;
  }
  _DWORD *v2 = 4;
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_25C7DE03C(uint64_t a1)
{
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

char **sub_25C7DE078(char **a1)
{
  unsigned int v2 = *a1;
  uint64_t v3 = *((unsigned int *)a1 + 2);
  if (v3)
  {
    uint64_t v4 = v3 << 6;
    uint64_t v5 = v2 + 48;
    do
    {
      uint64_t v6 = (char *)*((void *)v5 - 2);
      if (v5 != v6) {
        free(v6);
      }
      v5 += 64;
      v4 -= 64;
    }
    while (v4);
    unsigned int v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2)) {
    free(v2);
  }
  return a1;
}

void sub_25C7DE0E8(uint64_t a1)
{
  sub_25C7DE078((char **)(a1 + 48));
  if (*(char *)(a1 + 31) < 0)
  {
    unsigned int v2 = *(void **)(a1 + 8);
    operator delete(v2);
  }
}

size_t sub_25C7DE138(size_t result, void *a2)
{
  size_t v3 = result;
  unsigned int v4 = *(_DWORD *)(result + 8);
  if (v4 == *(_DWORD *)(result + 12))
  {
    size_t result = sub_25C7DE194(result, v4 + (v4 >> 1) + 1);
    unsigned int v4 = *(_DWORD *)(v3 + 8);
  }
  *(void *)(*(void *)v3 + 8 * v4) = *a2;
  *(_DWORD *)(v3 + 8) = v4 + 1;
  return result;
}

size_t sub_25C7DE194(uint64_t a1, unsigned int a2)
{
  size_t v3 = malloc_type_malloc(8 * a2, 0x6004044C4A2DFuLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unint64_t v12 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v12, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  unsigned int v4 = v3;
  uint64_t v5 = *(uint64_t **)a1;
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  if (v6)
  {
    uint64_t v7 = 8 * v6;
    unint64_t v8 = v4;
    do
    {
      uint64_t v9 = *v5++;
      *v8++ = v9;
      v7 -= 8;
    }
    while (v7);
    uint64_t v5 = *(uint64_t **)a1;
  }
  if (v5 != (uint64_t *)(a1 + 16)) {
    free(v5);
  }
  *(void *)a1 = v4;
  size_t result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result >> 3;
  return result;
}

void *sub_25C7DE248(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0xFFFFFFFFFFFFFFFLL) {
    unint64_t v1 = 0xFFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v1 = a1;
  }
  unsigned int v2 = (const std::nothrow_t *)MEMORY[0x263F8C180];
  while (1)
  {
    size_t result = operator new(8 * v1, v2);
    if (result) {
      break;
    }
    BOOL v4 = v1 > 1;
    v1 >>= 1;
    if (!v4) {
      return 0;
    }
  }
  return result;
}

unsigned __int16 **sub_25C7DE2AC(unsigned __int16 **result, unsigned __int16 **a2, unint64_t a3, unsigned __int16 **a4, uint64_t a5)
{
  if (a3 >= 2)
  {
    uint64_t v6 = result;
    if (a3 == 2)
    {
      size_t result = (unsigned __int16 **)sub_25C7DE4D8(*(a2 - 1), *result);
      if (result)
      {
        uint64_t v7 = *v6;
        *uint64_t v6 = *(a2 - 1);
        *(a2 - 1) = v7;
      }
    }
    else if ((uint64_t)a3 > 128)
    {
      long long v18 = a4;
      unint64_t v19 = a3 >> 1;
      unint64_t v20 = &result[a3 >> 1];
      unint64_t v21 = a3 >> 1;
      if ((uint64_t)a3 <= a5)
      {
        sub_25C7DE848(result, v20, v21, a4);
        uint64_t v22 = &v18[v19];
        size_t result = sub_25C7DE848(&v6[a3 >> 1], a2, a3 - (a3 >> 1), v22);
        uint64_t v23 = &v18[a3];
        uint64_t v24 = v22;
        while (v24 != v23)
        {
          size_t result = (unsigned __int16 **)sub_25C7DE4D8(*v24, *v18);
          if (result) {
            int64x2_t v25 = v24;
          }
          else {
            int64x2_t v25 = v18;
          }
          v18 += result ^ 1;
          v24 += result;
          *v6++ = *v25;
          if (v18 == v22)
          {
            if (v24 != v23)
            {
              uint64_t v26 = 0;
              do
              {
                v6[v26] = v24[v26];
                ++v26;
              }
              while (&v24[v26] != v23);
            }
            return result;
          }
        }
        if (v18 != v22)
        {
          uint64_t v27 = 0;
          do
          {
            v6[v27] = v18[v27];
            ++v27;
          }
          while (&v18[v27] != v22);
        }
      }
      else
      {
        sub_25C7DE2AC(result, v20, v21, a4, a5);
        sub_25C7DE2AC(&v6[a3 >> 1], a2, a3 - (a3 >> 1), v18, a5);
        return (unsigned __int16 **)sub_25C7DEA28((uint64_t)v6, &v6[a3 >> 1], a2, a3 >> 1, a3 - (a3 >> 1), v18, a5);
      }
    }
    else if (result != a2)
    {
      uint64_t v9 = result + 1;
      if (result + 1 != a2)
      {
        uint64_t v10 = 0;
        unint64_t v11 = result;
        do
        {
          uint64_t v13 = *v11;
          unint64_t v12 = v11[1];
          unint64_t v11 = v9;
          size_t result = (unsigned __int16 **)sub_25C7DE4D8(v12, v13);
          if (result)
          {
            uint64_t v14 = *v11;
            uint64_t v15 = v10;
            while (1)
            {
              *(unsigned __int16 **)((char *)v6 + v15 + 8) = *(unsigned __int16 **)((char *)v6 + v15);
              if (!v15) {
                break;
              }
              size_t result = (unsigned __int16 **)sub_25C7DE4D8(v14, *(unsigned __int16 **)((char *)v6 + v15 - 8));
              v15 -= 8;
              if ((result & 1) == 0)
              {
                uint64_t v16 = (unsigned __int16 **)((char *)v6 + v15 + 8);
                goto LABEL_15;
              }
            }
            uint64_t v16 = v6;
LABEL_15:
            *uint64_t v16 = v14;
          }
          uint64_t v9 = v11 + 1;
          v10 += 8;
        }
        while (v11 + 1 != a2);
      }
    }
  }
  return result;
}

BOOL sub_25C7DE4D8(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unint64_t v54 = 0;
  unsigned int v55 = 0;
  uint64_t v56 = 0;
  int __p = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  sub_25C7DEF68((void **)&v54, *((unsigned int *)a1 + 14));
  sub_25C7DEF68(&__p, *((unsigned int *)a2 + 14));
  sub_25C7DF004((uint64_t)a1, (uint64_t)&v54);
  sub_25C7DF004((uint64_t)a2, (uint64_t)&__p);
  BOOL v4 = v54;
  uint64_t v49 = v55;
  uint64_t v5 = (char *)__p;
  if ((char *)v55 - (char *)v54 == 4 && v52 - (unsigned char *)__p == 4)
  {
    unsigned int v6 = *v54;
    unsigned int v7 = *(_DWORD *)__p;
  }
  else
  {
    uint8x8_t v46 = v54;
    if (v54 == v55)
    {
      unsigned int v50 = 0;
      unsigned int v7 = 0;
    }
    else
    {
      unsigned int v50 = 0;
      unsigned int v7 = 0;
      unint64_t v8 = v52;
      unint64_t v47 = (char *)__p + 4;
      unint64_t v48 = (char *)__p;
      unsigned int v9 = -1;
      do
      {
        uint64_t v10 = (unsigned int *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*((void *)a1 + 6)
                                                                          + ((unint64_t)*v4 << 6)));
        if (v5 != v8)
        {
          unsigned int v11 = *v10;
          unint64_t v12 = v47;
          do
          {
            unsigned int v13 = *(_DWORD *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*((void *)a2 + 6)
                                                                         + ((unint64_t)*((unsigned int *)v12 - 1) << 6)));
            uint64_t v14 = (unsigned int *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*((void *)a1 + 6)
                                                                              + ((unint64_t)*v4 << 6)));
            uint64_t v15 = (unsigned int *)skit::SpanMatchV3::span((skit::SpanMatchV3 *)(*((void *)a2 + 6)
                                                                              + ((unint64_t)*((unsigned int *)v12 - 1) << 6)));
            unsigned int v16 = *v14;
            unsigned int v17 = v14[1];
            unsigned int v18 = *v15;
            unsigned int v19 = v15[1];
            if (*v14 <= *v15) {
              unsigned int v20 = *v15;
            }
            else {
              unsigned int v20 = *v14;
            }
            if (v19 >= v17) {
              unsigned int v21 = v14[1];
            }
            else {
              unsigned int v21 = v15[1];
            }
            unsigned int v22 = v16 - v19;
            if (v16 < v18) {
              unsigned int v22 = v18 - v17;
            }
            if (v16 == v18 && v17 == v19) {
              unsigned int v24 = 0;
            }
            else {
              unsigned int v24 = v22;
            }
            unsigned int v25 = v18 - v16;
            BOOL v26 = v16 >= v18;
            unsigned int v27 = v16 - v18;
            if (v27 == 0 || !v26) {
              unsigned int v27 = v25;
            }
            if (v20 > v21) {
              unsigned int v27 = v24;
            }
            if (v27 < v9)
            {
              unsigned int v50 = *v4;
              unsigned int v7 = *((_DWORD *)v12 - 1);
              unsigned int v9 = v27;
            }
            BOOL v28 = v11 < v13 || v12 == v8;
            v12 += 4;
          }
          while (!v28);
        }
        ++v4;
        uint64_t v5 = v48;
      }
      while (v4 != v49);
    }
    BOOL v4 = v46;
    unsigned int v6 = v50;
    if (!v5) {
      goto LABEL_38;
    }
  }
  operator delete(v5);
LABEL_38:
  if (v4) {
    operator delete(v4);
  }
  uint64_t v29 = (skit::SpanMatchV3 *)(*((void *)a1 + 6) + ((unint64_t)v6 << 6));
  unint64_t v30 = (skit::SpanMatchV3 *)(*((void *)a2 + 6) + ((unint64_t)v7 << 6));
  unsigned int v31 = *(_DWORD *)skit::SpanMatchV3::span(v29);
  if (v31 < *(_DWORD *)skit::SpanMatchV3::span(v30)) {
    return 1;
  }
  unsigned int v33 = *(_DWORD *)skit::SpanMatchV3::span(v29);
  if (v33 > *(_DWORD *)skit::SpanMatchV3::span(v30)) {
    return 0;
  }
  uint64_t v34 = (_DWORD *)skit::SpanMatchV3::span(v29);
  unsigned int v35 = v34[1] - *v34;
  float v36 = (_DWORD *)skit::SpanMatchV3::span(v30);
  if (v35 > v36[1] - *v36) {
    return 1;
  }
  uint64_t v37 = (_DWORD *)skit::SpanMatchV3::span(v29);
  unsigned int v38 = v37[1] - *v37;
  uint64_t v39 = (_DWORD *)skit::SpanMatchV3::span(v30);
  if (v38 < v39[1] - *v39) {
    return 0;
  }
  unsigned int v40 = skit::SpanMatchV3::alias_token_cnt(v29);
  if (v40 < skit::SpanMatchV3::alias_token_cnt(v30)) {
    return 1;
  }
  unsigned int v41 = skit::SpanMatchV3::alias_token_cnt(v29);
  if (v41 > skit::SpanMatchV3::alias_token_cnt(v30)) {
    return 0;
  }
  unsigned int v42 = *a1 - 19679;
  if (v42 > 4) {
    unsigned int v43 = 5;
  }
  else {
    unsigned int v43 = dword_25C839A80[(__int16)v42];
  }
  unsigned int v44 = *a2 - 19679;
  if (v44 > 4) {
    unsigned int v45 = 5;
  }
  else {
    unsigned int v45 = dword_25C839A80[(__int16)v44];
  }
  return v43 < v45;
}

void sub_25C7DE80C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{
  if (a15) {
    operator delete(a15);
  }
  if (a18) {
    operator delete(a18);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int16 **sub_25C7DE848(unsigned __int16 **result, unsigned __int16 **a2, unint64_t a3, unsigned __int16 **a4)
{
  if (a3)
  {
    BOOL v4 = a4;
    unsigned int v6 = result;
    if (a3 == 1)
    {
LABEL_9:
      unsigned int *v4 = *v6;
      return result;
    }
    if (a3 == 2)
    {
      unint64_t v8 = a2 - 1;
      size_t result = (unsigned __int16 **)sub_25C7DE4D8(*(a2 - 1), *result);
      if (result) {
        unsigned int v9 = v8;
      }
      else {
        unsigned int v9 = v6;
      }
      *v4++ = *v9;
      if (!result) {
        unsigned int v6 = v8;
      }
      goto LABEL_9;
    }
    if ((uint64_t)a3 > 8)
    {
      unsigned int v18 = &result[a3 >> 1];
      sub_25C7DE2AC(result, v18, a3 >> 1, a4, a3 >> 1);
      size_t result = (unsigned __int16 **)sub_25C7DE2AC(&v6[a3 >> 1], a2, a3 - (a3 >> 1), &v4[a3 >> 1], a3 - (a3 >> 1));
      unsigned int v19 = &v6[a3 >> 1];
      while (v19 != a2)
      {
        size_t result = (unsigned __int16 **)sub_25C7DE4D8(*v19, *v6);
        if (result) {
          unsigned int v20 = v19;
        }
        else {
          unsigned int v20 = v6;
        }
        v19 += result;
        v6 += result ^ 1;
        *v4++ = *v20;
        if (v6 == v18)
        {
          if (v19 != a2)
          {
            uint64_t v21 = 0;
            do
            {
              v4[v21] = v19[v21];
              ++v21;
            }
            while (&v19[v21] != a2);
          }
          return result;
        }
      }
      if (v6 != v18)
      {
        uint64_t v22 = 0;
        do
        {
          v4[v22] = v6[v22];
          ++v22;
        }
        while (&v6[v22] != v18);
      }
    }
    else if (result != a2)
    {
      uint64_t v10 = result + 1;
      *a4 = *result;
      if (result + 1 != a2)
      {
        uint64_t v11 = 0;
        unint64_t v12 = a4;
        do
        {
          unsigned int v13 = v12;
          uint64_t v14 = *v12++;
          size_t result = (unsigned __int16 **)sub_25C7DE4D8(*v10, v14);
          uint64_t v15 = v12;
          if (result)
          {
            v13[1] = *v13;
            uint64_t v15 = v4;
            if (v13 != v4)
            {
              uint64_t v16 = v11;
              while (1)
              {
                uint64_t v15 = (unsigned __int16 **)((char *)v4 + v16);
                size_t result = (unsigned __int16 **)sub_25C7DE4D8(*v10, *(unsigned __int16 **)((char *)v4 + v16 - 8));
                if (!result) {
                  break;
                }
                *uint64_t v15 = *(v15 - 1);
                v16 -= 8;
                if (!v16)
                {
                  uint64_t v15 = v4;
                  break;
                }
              }
            }
          }
          unsigned int v17 = *v10++;
          *uint64_t v15 = v17;
          v11 += 8;
        }
        while (v10 != a2);
      }
    }
  }
  return result;
}

uint64_t sub_25C7DEA28(uint64_t result, unsigned __int16 **a2, unsigned __int16 **a3, uint64_t a4, uint64_t a5, unsigned __int16 **a6, uint64_t a7)
{
  if (a5)
  {
    uint64_t v9 = a5;
    unint64_t v12 = (unsigned __int16 **)result;
    while (a4 > a7 && v9 > a7)
    {
      if (!a4) {
        return result;
      }
      unint64_t v13 = 0;
      uint64_t v14 = 0;
      while (1)
      {
        size_t result = sub_25C7DE4D8(*a2, v12[v14]);
        if (result) {
          break;
        }
        ++v14;
        v13 -= 8;
        if (a4 == v14) {
          return result;
        }
      }
      size_t result = (uint64_t)&v12[v13 / 0xFFFFFFFFFFFFFFF8];
      if (a4 - v14 >= v9)
      {
        if (a4 - 1 == v14)
        {
          int v74 = v12[v14];
          v12[v14] = *a2;
          *a2 = v74;
          return result;
        }
        uint64_t v24 = (a4 - v14) / 2;
        unsigned int v25 = &v12[v24];
        if (a3 == a2)
        {
          unsigned int v31 = a3;
          unsigned int v17 = a3;
        }
        else
        {
          char v79 = &v12[v13 / 0xFFFFFFFFFFFFFFF8];
          uint64_t v82 = a7;
          unint64_t v26 = a3 - a2;
          unsigned int v17 = a2;
          do
          {
            unsigned int v27 = &v17[v26 >> 1];
            uint64_t v29 = *v27;
            BOOL v28 = v27 + 1;
            BOOL v30 = sub_25C7DE4D8(v29, v25[v14]);
            if (v30) {
              v26 += ~(v26 >> 1);
            }
            else {
              v26 >>= 1;
            }
            if (v30) {
              unsigned int v17 = v28;
            }
          }
          while (v26);
          unsigned int v31 = a2;
          size_t result = (uint64_t)v79;
          a7 = v82;
          uint64_t v24 = (a4 - v14) / 2;
        }
        unsigned int v19 = &v25[v13 / 0xFFFFFFFFFFFFFFF8];
        uint64_t v16 = v17 - v31;
      }
      else
      {
        if (v9 >= 0) {
          uint64_t v15 = v9;
        }
        else {
          uint64_t v15 = v9 + 1;
        }
        uint64_t v16 = v15 >> 1;
        unsigned int v17 = &a2[v15 >> 1];
        if ((unsigned __int16 **)result == a2)
        {
          unsigned int v19 = a2;
          uint64_t v23 = a2;
        }
        else
        {
          uint64_t v76 = v15 >> 1;
          long long v77 = a6;
          long long v78 = &v12[v13 / 0xFFFFFFFFFFFFFFF8];
          unint64_t v18 = (uint64_t)((char *)a2 - (char *)v12 + v13) >> 3;
          unsigned int v19 = (unsigned __int16 **)result;
          do
          {
            unsigned int v20 = &v19[v18 >> 1];
            uint64_t v22 = *v20;
            uint64_t v21 = v20 + 1;
            if (sub_25C7DE4D8(*v17, v22))
            {
              v18 >>= 1;
            }
            else
            {
              unsigned int v19 = v21;
              v18 += ~(v18 >> 1);
            }
          }
          while (v18);
          a6 = v77;
          size_t result = (uint64_t)v78;
          uint64_t v23 = v78;
          uint64_t v16 = v76;
        }
        uint64_t v24 = v19 - v23;
      }
      unint64_t v32 = v17;
      if (v19 != a2)
      {
        unint64_t v32 = v19;
        if (a2 != v17)
        {
          if (v19 + 1 == a2)
          {
            __int16 v80 = *v19;
            uint64_t v83 = a7;
            int64_t v39 = (char *)v17 - (char *)a2;
            uint64_t v40 = result;
            unsigned int v41 = a2;
            size_t v42 = (char *)v17 - (char *)a2;
            uint64_t v43 = v16;
            uint64_t v44 = v24;
            memmove(v19, v41, v42);
            uint64_t v24 = v44;
            uint64_t v16 = v43;
            size_t result = v40;
            unint64_t v32 = (unsigned __int16 **)((char *)v19 + v39);
            a7 = v83;
            *unint64_t v32 = v80;
          }
          else if (a2 + 1 == v17)
          {
            unsigned int v45 = *(v17 - 1);
            unint64_t v32 = v19 + 1;
            if (v17 - 1 != v19)
            {
              uint64_t v81 = result;
              id v84 = *(v17 - 1);
              uint64_t v46 = v16;
              uint64_t v47 = v24;
              memmove(v19 + 1, v19, (char *)(v17 - 1) - (char *)v19);
              size_t result = v81;
              unsigned int v45 = v84;
              uint64_t v24 = v47;
              uint64_t v16 = v46;
            }
            *unsigned int v19 = v45;
          }
          else
          {
            uint64_t v33 = a2 - v19;
            if (v33 == v17 - a2)
            {
              uint64_t v34 = 0;
              do
              {
                unsigned int v35 = v19[v34];
                v19[v34] = a2[v34];
                uint64_t v36 = (uint64_t)&v19[v34 + 1];
                a2[v34] = v35;
                uint64_t v37 = (uint64_t)&a2[++v34];
              }
              while ((unsigned __int16 **)v36 != a2 && v37 != (void)v17);
              unint64_t v32 = a2;
            }
            else
            {
              uint64_t v48 = v17 - a2;
              uint64_t v49 = a2 - v19;
              do
              {
                uint64_t v50 = v49;
                uint64_t v49 = v48;
                uint64_t v48 = v50 % v48;
              }
              while (v48);
              if (v49)
              {
                unint64_t v51 = &v19[v49];
                do
                {
                  uint64_t v53 = *--v51;
                  uint64_t v52 = v53;
                  unint64_t v54 = &v51[v33];
                  unsigned int v55 = v51;
                  do
                  {
                    uint64_t v56 = v55;
                    unsigned int v55 = v54;
                    *uint64_t v56 = *v54;
                    BOOL v57 = __OFSUB__(v33, v17 - v54);
                    uint64_t v59 = v33 - (v17 - v54);
                    char v58 = (v59 < 0) ^ v57;
                    unint64_t v54 = &v19[v59];
                    if (v58) {
                      unint64_t v54 = &v55[v33];
                    }
                  }
                  while (v54 != v51);
                  *unsigned int v55 = v52;
                }
                while (v51 != v19);
              }
              unint64_t v32 = &v19[v17 - a2];
            }
          }
        }
      }
      uint64_t v60 = a4 - v24 - v14;
      uint64_t v61 = v9 - v16;
      if (v24 + v16 >= v9 + a4 - (v24 + v16) - v14)
      {
        uint64_t v63 = result;
        uint64_t v64 = v24;
        uint64_t v65 = v60;
        uint64_t v66 = v16;
        size_t result = sub_25C7DEA28(v32, v17, a3, v65, v61, a6, a7);
        id v62 = (unsigned __int16 **)v63;
        unsigned int v17 = v19;
        uint64_t v61 = v66;
        uint64_t v60 = v64;
        a3 = v32;
      }
      else
      {
        size_t result = sub_25C7DEA28(result, v19, v32, v24, v16, a6, a7);
        id v62 = v32;
      }
      a4 = v60;
      uint64_t v9 = v61;
      unint64_t v12 = v62;
      a2 = v17;
      if (!v61) {
        return result;
      }
    }
    if (a4 <= v9)
    {
      if (v12 != a2)
      {
        uint64_t v71 = 0;
        do
        {
          a6[v71] = v12[v71];
          ++v71;
        }
        while (&v12[v71] != a2);
        if (v71 * 8)
        {
          int v72 = a6;
          while (a2 != a3)
          {
            size_t result = sub_25C7DE4D8(*a2, *v72);
            if (result) {
              id v73 = a2;
            }
            else {
              id v73 = v72;
            }
            v72 += result ^ 1;
            a2 += result;
            *v12++ = *v73;
            if (&a6[v71] == v72) {
              return result;
            }
          }
          return (uint64_t)memmove(v12, v72, (char *)a6 - (char *)v72 + v71 * 8);
        }
      }
    }
    else if (a2 != a3)
    {
      uint64_t v67 = 0;
      do
      {
        a6[v67] = a2[v67];
        ++v67;
      }
      while (&a2[v67] != a3);
      if (v67 * 8)
      {
        unint64_t v68 = &a6[v67];
        uint64_t v69 = a3 - 1;
        while (a2 != v12)
        {
          size_t result = sub_25C7DE4D8(*(v68 - 1), *(a2 - 1));
          if (result) {
            unint64_t v70 = a2;
          }
          else {
            unint64_t v70 = v68;
          }
          if (result) {
            --a2;
          }
          else {
            --v68;
          }
          *v69-- = *(v70 - 1);
          if (v68 == a6) {
            return result;
          }
        }
        uint64_t v75 = 0;
        do
        {
          v69[v75] = v68[v75 - 1];
          --v75;
        }
        while (&v68[v75] != a6);
      }
    }
  }
  return result;
}

void sub_25C7DEF68(void **a1, unint64_t a2)
{
  if (a2 > ((unsigned char *)a1[2] - (unsigned char *)*a1) >> 2)
  {
    int64_t v3 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    BOOL v4 = (char *)sub_25C7D3588(a2);
    uint64_t v5 = &v4[v3 & 0xFFFFFFFFFFFFFFFCLL];
    unsigned int v7 = &v4[4 * v6];
    unint64_t v8 = (char *)*a1;
    uint64_t v9 = (char *)a1[1];
    uint64_t v10 = v5;
    if (v9 != *a1)
    {
      uint64_t v10 = v5;
      do
      {
        int v11 = *((_DWORD *)v9 - 1);
        v9 -= 4;
        *((_DWORD *)v10 - 1) = v11;
        v10 -= 4;
      }
      while (v9 != v8);
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void sub_25C7DF004(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(_DWORD **)(a2 + 8);
  unint64_t v4 = *(void *)(a2 + 16);
  if ((unint64_t)v5 >= v4)
  {
    unsigned int v7 = *(_DWORD **)a2;
    uint64_t v8 = ((uint64_t)v5 - *(void *)a2) >> 2;
    unint64_t v9 = v8 + 1;
    if ((unint64_t)(v8 + 1) >> 62) {
LABEL_53:
    }
      sub_25C7D06B8();
    uint64_t v10 = v4 - (void)v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    BOOL v11 = (unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL;
    unint64_t v12 = 0x3FFFFFFFFFFFFFFFLL;
    if (!v11) {
      unint64_t v12 = v9;
    }
    if (v12)
    {
      unint64_t v12 = (unint64_t)sub_25C7D3588(v12);
      unsigned int v7 = *(_DWORD **)a2;
      uint64_t v5 = *(_DWORD **)(a2 + 8);
    }
    else
    {
      uint64_t v13 = 0;
    }
    uint64_t v14 = (_DWORD *)(v12 + 4 * v8);
    unint64_t v15 = v12 + 4 * v13;
    *uint64_t v14 = 0;
    uint64_t v6 = v14 + 1;
    while (v5 != v7)
    {
      int v16 = *--v5;
      *--uint64_t v14 = v16;
    }
    *(void *)a2 = v14;
    *(void *)(a2 + 8) = v6;
    *(void *)(a2 + 16) = v15;
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    *uint64_t v5 = 0;
    uint64_t v6 = v5 + 1;
  }
  *(void *)(a2 + 8) = v6;
  if (*(_DWORD *)(a1 + 56) >= 2u)
  {
    uint64_t v17 = 0;
    for (unint64_t i = 1; i < *(unsigned int *)(a1 + 56); ++i)
    {
      skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(void *)(a1 + 48) + (i << 6)));
      float v20 = v19;
      skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(void *)(a1 + 48) + (v17 << 6)));
      if (v20 > v21
        && (unsigned int v22 = skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(void *)(a1 + 48) + (i << 6))),
            v22 <= skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(void *)(a1 + 48) + (v17 << 6)))))
      {
        BOOL v30 = *(_DWORD **)a2;
        *(void *)(a2 + 8) = *(void *)a2;
        unint64_t v31 = *(void *)(a2 + 16);
        if ((unint64_t)v30 >= v31)
        {
          uint64_t v32 = v31 - (void)v30;
          uint64_t v33 = v32 >> 1;
          if ((unint64_t)(v32 >> 1) <= 1) {
            uint64_t v33 = 1;
          }
          if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v34 = v33;
          }
          uint64_t v36 = sub_25C7D3588(v34);
          uint64_t v37 = *(_DWORD **)a2;
          unsigned int v38 = *(_DWORD **)(a2 + 8);
          *uint64_t v36 = i;
          uint64_t v29 = v36 + 1;
          int64_t v39 = v36;
          while (v38 != v37)
          {
            int v40 = *--v38;
            *--int64_t v39 = v40;
          }
          unsigned int v41 = &v36[v35];
          uint64_t v17 = i;
LABEL_48:
          *(void *)a2 = v39;
          *(void *)(a2 + 8) = v29;
          *(void *)(a2 + 16) = v41;
          if (v37) {
            operator delete(v37);
          }
          goto LABEL_50;
        }
        uint64_t v17 = i;
        _DWORD *v30 = i;
        uint64_t v29 = v30 + 1;
      }
      else
      {
        skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(void *)(a1 + 48) + (i << 6)));
        float v24 = v23;
        skit::SpanMatchV3::score((skit::SpanMatchV3 *)(*(void *)(a1 + 48) + (v17 << 6)));
        if (v24 != v25) {
          continue;
        }
        int v26 = skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(void *)(a1 + 48) + (i << 6)));
        if (v26 != skit::SpanMatchV3::edit_dist((skit::SpanMatchV3 *)(*(void *)(a1 + 48) + (v17 << 6)))) {
          continue;
        }
        BOOL v28 = *(_DWORD **)(a2 + 8);
        unint64_t v27 = *(void *)(a2 + 16);
        if ((unint64_t)v28 >= v27)
        {
          uint64_t v37 = *(_DWORD **)a2;
          uint64_t v42 = ((uint64_t)v28 - *(void *)a2) >> 2;
          unint64_t v43 = v42 + 1;
          if ((unint64_t)(v42 + 1) >> 62) {
            goto LABEL_53;
          }
          uint64_t v44 = v27 - (void)v37;
          if (v44 >> 1 > v43) {
            unint64_t v43 = v44 >> 1;
          }
          if ((unint64_t)v44 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v45 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v45 = v43;
          }
          if (v45)
          {
            unint64_t v45 = (unint64_t)sub_25C7D3588(v45);
            uint64_t v37 = *(_DWORD **)a2;
            BOOL v28 = *(_DWORD **)(a2 + 8);
          }
          else
          {
            uint64_t v46 = 0;
          }
          int64_t v39 = (_DWORD *)(v45 + 4 * v42);
          *int64_t v39 = i;
          uint64_t v29 = v39 + 1;
          while (v28 != v37)
          {
            int v47 = *--v28;
            *--int64_t v39 = v47;
          }
          unsigned int v41 = (_DWORD *)(v45 + 4 * v46);
          goto LABEL_48;
        }
        *BOOL v28 = i;
        uint64_t v29 = v28 + 1;
      }
LABEL_50:
      *(void *)(a2 + 8) = v29;
    }
  }
}

uint64_t sub_25C7DF2B8(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v6 = sub_25C7DF3F8((uint64_t *)a1, *(void *)a3, *(void *)a3 + 112 * *(unsigned int *)(a3 + 8)) + 58;
  if (*(char *)(a3 + 487) < 0)
  {
    sub_25C7D059C(v6, *(void **)(a3 + 464), *(void *)(a3 + 472));
  }
  else
  {
    long long v7 = *(_OWORD *)(a3 + 464);
    v6[2] = *(void *)(a3 + 480);
    *(_OWORD *)uint64_t v6 = v7;
  }
  sub_25C7DF588(a1 + 488, (long long *)(a3 + 488));
  uint64_t v8 = *(unsigned int *)(a3 + 8);
  if (v8)
  {
    unsigned int v9 = 0;
    uint64_t v10 = *(void *)a3;
    uint64_t v11 = 112 * v8;
    unint64_t v12 = (int *)(*(void *)a3 + 32);
    uint64_t v13 = v11;
    do
    {
      int v14 = *v12;
      v12 += 28;
      v9 += v14;
      v13 -= 112;
    }
    while (v13);
    unsigned int v15 = 0;
    if (*a2 > v9) {
      unsigned int v9 = *a2;
    }
    *(_DWORD *)(a1 + 552) = v9;
    int v16 = (int *)(v10 + 36);
    uint64_t v17 = v11;
    do
    {
      int v18 = *v16;
      v16 += 28;
      v15 += v18;
      v17 -= 112;
    }
    while (v17);
    unsigned int v19 = 0;
    if (a2[1] > v15) {
      unsigned int v15 = a2[1];
    }
    *(_DWORD *)(a1 + 556) = v15;
    float v20 = (int *)(v10 + 44);
    do
    {
      int v21 = *v20;
      v20 += 28;
      v19 += v21;
      v11 -= 112;
    }
    while (v11);
  }
  else
  {
    unsigned int v19 = 0;
    *(_DWORD *)(a1 + 552) = *a2;
    *(_DWORD *)(a1 + 556) = a2[1];
  }
  unsigned int v22 = a2[3];
  if (v22 <= v19) {
    unsigned int v22 = v19;
  }
  *(_DWORD *)(a1 + 560) = v22;
  return a1;
}

void sub_25C7DF3E4(_Unwind_Exception *a1)
{
  sub_25C7DCD3C(v1);
  _Unwind_Resume(a1);
}

uint64_t *sub_25C7DF3F8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = -1227133513 * ((a3 - a2) >> 4);
  if (v6 < 5)
  {
    unsigned int v9 = a1 + 2;
    *a1 = (uint64_t)(a1 + 2);
    LODWORD(v8) = 4;
  }
  else
  {
    long long v7 = malloc_type_malloc(0xFFFFFFE000000010 * ((a3 - a2) >> 4), 0x1032040567AB6A7uLL);
    if (!v7)
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      uint64_t v17 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v17, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
    }
    *a1 = (uint64_t)v7;
    uint64_t v8 = ((malloc_size(v7) >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64;
    unsigned int v9 = (uint64_t *)*a1;
  }
  *((_DWORD *)a1 + 2) = v6;
  *((_DWORD *)a1 + 3) = v8;
  if (a2 != a3)
  {
    uint64_t v10 = 0;
    do
    {
      uint64_t v11 = a2 + v10 * 8;
      LOWORD(v9[v10]) = *(_WORD *)(a2 + v10 * 8);
      unint64_t v12 = &v9[v10 + 1];
      uint64_t v13 = (void **)(a2 + v10 * 8 + 8);
      if (*(char *)(a2 + v10 * 8 + 31) < 0)
      {
        sub_25C7D059C(v12, *v13, *(void *)(v11 + 16));
      }
      else
      {
        long long v14 = *(_OWORD *)v13;
        v9[v10 + 3] = *(void *)(a2 + v10 * 8 + 24);
        *(_OWORD *)unint64_t v12 = v14;
      }
      *(_OWORD *)&v9[v10 + 4] = *(_OWORD *)(v11 + 32);
      sub_25C7DF588((uint64_t)&v9[v10 + 6], (long long *)(a2 + v10 * 8 + 48));
      v10 += 14;
    }
    while (v11 + 112 != a3);
  }
  return a1;
}

void sub_25C7DF550(void *a1)
{
  __cxa_begin_catch(a1);
  for (; v2; v2 -= 112)
  {
    sub_25C7DCD98(v1);
    v1 += 112;
  }
  __cxa_rethrow();
}

void sub_25C7DF574(_Unwind_Exception *a1)
{
}

uint64_t sub_25C7DF588(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(_OWORD *)(a1 + 12) = *(long long *)((char *)a2 + 12);
  *(_OWORD *)a1 = v4;
  sub_25C7DF5DC(a1 + 32, *((char **)a2 + 4), (char *)(*((void *)a2 + 4) + 2 * *((unsigned int *)a2 + 10)));
  *(_DWORD *)(a1 + 56) = *((_DWORD *)a2 + 14);
  return a1;
}

uint64_t sub_25C7DF5DC(uint64_t a1, char *a2, char *a3)
{
  long long v4 = a2;
  unint64_t v6 = (unint64_t)(a3 - a2) >> 1;
  if (v6 < 5)
  {
    unsigned int v9 = (_WORD *)(a1 + 16);
    *(void *)a1 = a1 + 16;
    LODWORD(v8) = 4;
  }
  else
  {
    long long v7 = sub_25C7DF660((unint64_t)(a3 - a2) >> 1);
    *(void *)a1 = v7;
    size_t v8 = malloc_size(v7) >> 1;
    unsigned int v9 = *(_WORD **)a1;
  }
  *(_DWORD *)(a1 + 8) = v6;
  *(_DWORD *)(a1 + 12) = v8;
  while (v4 != a3)
  {
    __int16 v10 = *(_WORD *)v4;
    v4 += 2;
    *v9++ = v10;
  }
  return a1;
}

void *sub_25C7DF660(unsigned int a1)
{
  size_t result = malloc_type_malloc(2 * a1, 0x1000040BDFB0063uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    int64_t v3 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v3, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  return result;
}

uint64_t *sub_25C7DF6B8(uint64_t *result, void *a2)
{
  int64_t v3 = result;
  uint64_t v5 = *result;
  uint64_t v4 = result[1];
  uint64_t v6 = a2[1];
  if (v4 != *result)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = v6 + v7;
      uint64_t v9 = v4 + v7;
      sub_25C7DF800(v6 + v7 - 568, v4 + v7 - 568);
      long long v10 = *(_OWORD *)(v4 + v7 - 104);
      *(void *)(v8 - 88) = *(void *)(v4 + v7 - 88);
      *(_OWORD *)(v8 - 104) = v10;
      *(void *)(v9 - 104) = 0;
      *(void *)(v9 - 96) = 0;
      *(void *)(v9 - 88) = 0;
      long long v11 = *(_OWORD *)(v4 + v7 - 80);
      *(_OWORD *)(v8 - 68) = *(_OWORD *)(v4 + v7 - 68);
      *(_OWORD *)(v8 - 80) = v11;
      size_t result = (uint64_t *)sub_25C7DDFD0(v6 + v7 - 48, v4 + v7 - 48);
      *(_DWORD *)(v8 - 24) = *(_DWORD *)(v4 + v7 - 24);
      uint64_t v12 = *(void *)(v4 + v7 - 16);
      *(_DWORD *)(v8 - 8) = *(_DWORD *)(v4 + v7 - 8);
      *(void *)(v8 - 16) = v12;
      v7 -= 568;
    }
    while (v4 + v7 != v5);
    v6 += v7;
  }
  a2[1] = v6;
  uint64_t v13 = *v3;
  uint64_t *v3 = v6;
  a2[1] = v13;
  uint64_t v14 = v3[1];
  v3[1] = a2[2];
  a2[2] = v14;
  uint64_t v15 = v3[2];
  v3[2] = a2[3];
  a2[3] = v15;
  *a2 = a2[1];
  return result;
}

void *sub_25C7DF7B4(unint64_t a1)
{
  if (a1 >= 0x73615A240E6C2CLL) {
    sub_25C7D019C();
  }
  return operator new(568 * a1);
}

uint64_t sub_25C7DF800(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  if (*(void *)a2 == a2 + 16)
  {
    uint64_t v5 = result + 16;
    *(void *)size_t result = result + 16;
    uint64_t v6 = *(unsigned int *)(a2 + 8);
    if (v6)
    {
      uint64_t v7 = *(void *)a2;
      uint64_t v8 = *(void *)a2 + 112 * v6;
      uint64_t v9 = *(void *)a2;
      do
      {
        *(_WORD *)uint64_t v5 = *(_WORD *)v9;
        long long v10 = *(_OWORD *)(v9 + 8);
        *(void *)(v5 + 24) = *(void *)(v9 + 24);
        *(_OWORD *)(v5 + 8) = v10;
        *(void *)(v9 + 16) = 0;
        *(void *)(v9 + 24) = 0;
        *(void *)(v9 + 8) = 0;
        *(_OWORD *)(v5 + 32) = *(_OWORD *)(v9 + 32);
        long long v11 = *(_OWORD *)(v9 + 48);
        *(_OWORD *)(v5 + 60) = *(_OWORD *)(v9 + 60);
        *(_OWORD *)(v5 + 48) = v11;
        sub_25C7DDFD0(v5 + 80, v9 + 80);
        *(_DWORD *)(v5 + 104) = *(_DWORD *)(v9 + 104);
        v9 += 112;
        v5 += 112;
      }
      while (v9 != v8);
      uint64_t v12 = 112 * v6;
      do
      {
        size_t result = sub_25C7DCD98(v7);
        v7 += 112;
        v12 -= 112;
      }
      while (v12);
    }
    uint64_t v4 = (_DWORD *)(v3 + 12);
  }
  else
  {
    *(void *)size_t result = *(void *)a2;
    uint64_t v4 = (_DWORD *)(a2 + 12);
    *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
    *(void *)a2 = a2 + 16;
  }
  _DWORD *v4 = 4;
  *(_DWORD *)(v3 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_25C7DF914(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 568;
    sub_25C7DCCE4(i - 568);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25C7DF964(void *a1)
{
  uint64_t v1 = a1 + 3;
  unint64_t v2 = a1[3];
  unint64_t v3 = a1[2];
  if (v3 < v2) {
    sub_25C7DFAC8();
  }
  uint64_t v4 = a1[1];
  uint64_t v5 = 0x193D4BB7E327A977 * ((uint64_t)(v3 - v4) >> 3);
  if ((unint64_t)(v5 + 1) <= 0x73615A240E6C2BLL)
  {
    unint64_t v6 = 0x193D4BB7E327A977 * ((uint64_t)(v2 - v4) >> 3);
    uint64_t v7 = 2 * v6;
    if (2 * v6 <= v5 + 1) {
      uint64_t v7 = v5 + 1;
    }
    if (v6 >= 0x39B0AD12073615) {
      unint64_t v8 = 0x73615A240E6C2BLL;
    }
    else {
      unint64_t v8 = v7;
    }
    uint64_t v14 = v1;
    if (v8) {
      unint64_t v8 = (unint64_t)sub_25C7DF7B4(v8);
    }
    else {
      uint64_t v9 = 0;
    }
    unint64_t v10 = v8;
    unint64_t v11 = v8 + 568 * v5;
    unint64_t v12 = v11;
    unint64_t v13 = v8 + 568 * v9;
    sub_25C7DFAC8();
  }
  sub_25C7D06B8();
}

void sub_25C7DFAA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C7DF914((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_25C7DFAC8()
{
}

char **sub_25C7DFB60(char **a1)
{
  unint64_t v2 = *a1;
  unsigned int v3 = *((_DWORD *)a1 + 2);
  if (v3)
  {
    uint64_t v4 = v2 + 536;
    uint64_t v5 = 552 * v3;
    do
    {
      unint64_t v6 = (char *)*((void *)v4 - 2);
      if (v4 != v6) {
        free(v6);
      }
      if (*(v4 - 49) < 0) {
        operator delete(*((void **)v4 - 9));
      }
      sub_25C7DCD3C((uint64_t)(v4 - 536));
      v4 += 552;
      v5 -= 552;
    }
    while (v5);
    unint64_t v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2)) {
    free(v2);
  }
  return a1;
}

char **sub_25C7DFBEC(char **a1)
{
  unint64_t v2 = *a1;
  uint64_t v3 = *((unsigned int *)a1 + 2);
  if (v3)
  {
    uint64_t v4 = 320 * v3;
    do
    {
      sub_25C7DE0E8((uint64_t)v2);
      v2 += 320;
      v4 -= 320;
    }
    while (v4);
    unint64_t v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2)) {
    free(v2);
  }
  return a1;
}

void sub_25C7DFC58(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 8); i != a2; i -= 72)
  {
    uint64_t v5 = (void **)(i - 24);
    sub_25C7D7494(&v5);
    uint64_t v5 = (void **)(i - 48);
    sub_25C7D025C(&v5);
  }
  *(void *)(a1 + 8) = a2;
}

void sub_25C7DFCCC(void ***a1)
{
  unint64_t v2 = (uint64_t *)*a1;
  if (*v2)
  {
    sub_25C7DFC58((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void sub_25C7DFD20(void ***a1)
{
  uint64_t v1 = *a1;
  unint64_t v2 = (char *)**a1;
  if (v2)
  {
    uint64_t v4 = (char *)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        unint64_t v6 = v4 - 32;
        uint64_t v7 = (void **)(v4 - 24);
        sub_25C7DCC60(&v7);
        uint64_t v4 = v6;
      }
      while (v6 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_25C7DFD9C(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      operator delete(v2);
      unint64_t v2 = v3;
    }
    while (v3);
  }
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_25C7DFF6C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ((objc_msgSend__isCustomerInstall_(*(void **)(a1 + 32), a2, *(void *)(a1 + 48), a4) & 1) == 0)
  {
    int isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(*(void **)(*(void *)(a1 + 32) + 8), v5, v6, v7);
    uint64_t v9 = qword_26B3549D8;
    if (isEvaluationEnabled && os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v27 = 136315138;
      BOOL v28 = "-[SEMAdminConnection beginEvaluation:completion:]_block_invoke";
      _os_log_error_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_ERROR, "%s Evaluation is already enabled.", (uint8_t *)&v27, 0xCu);
      uint64_t v9 = qword_26B3549D8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      int v27 = 136315394;
      BOOL v28 = "-[SEMAdminConnection beginEvaluation:completion:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v12;
      _os_log_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_INFO, "%s Beginning evaluaton with serializedSets: %@", (uint8_t *)&v27, 0x16u);
    }
    objc_msgSend_setEvaluationEnabled_(*(void **)(*(void *)(a1 + 32) + 8), v10, 1, v11);
    uint64_t v15 = objc_msgSend_setEnumeratorWithSerializedSets_(MEMORY[0x263F31768], v13, *(void *)(a1 + 40), v14);
    if (objc_msgSend_clearAllState(*(void **)(*(void *)(a1 + 32) + 16), v16, v17, v18)
      && objc_msgSend_rebuildAllStateWithSetEnumerator_(*(void **)(*(void *)(a1 + 32) + 16), v19, (uint64_t)v15, v20))
    {
      uint64_t v21 = *(void *)(a1 + 48);
      if (v21) {
        (*(void (**)(uint64_t, uint64_t))(v21 + 16))(v21, 1);
      }
    }
    else
    {
      unsigned int v22 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = *(void *)(a1 + 40);
        int v27 = 136315394;
        BOOL v28 = "-[SEMAdminConnection beginEvaluation:completion:]_block_invoke";
        __int16 v29 = 2112;
        uint64_t v30 = v26;
        _os_log_error_impl(&dword_25C7CA000, v22, OS_LOG_TYPE_ERROR, "%s Failed to begin evaluation with serializedSets: %@", (uint8_t *)&v27, 0x16u);
      }
      uint64_t v25 = *(void *)(a1 + 48);
      if (v25) {
        (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, 2);
      }
      objc_msgSend_setEvaluationEnabled_(*(void **)(*(void *)(a1 + 32) + 8), v23, 0, v24);
    }
  }
}

uint64_t sub_25C7E0230(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t result = objc_msgSend__isCustomerInstall_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
  if ((result & 1) == 0)
  {
    char isEvaluationEnabled = objc_msgSend_isEvaluationEnabled(*(void **)(*(void *)(a1 + 32) + 8), v6, v7, v8);
    unint64_t v10 = qword_26B3549D8;
    if (isEvaluationEnabled)
    {
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
      {
        int v17 = 136315138;
        uint64_t v18 = "-[SEMAdminConnection endEvaluation:]_block_invoke";
        _os_log_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_INFO, "%s Clearing all state and ending evaluation", (uint8_t *)&v17, 0xCu);
      }
      objc_msgSend_clearAllState(*(void **)(*(void *)(a1 + 32) + 16), v11, v12, v13);
      objc_msgSend_setEvaluationEnabled_(*(void **)(*(void *)(a1 + 32) + 8), v14, 0, v15);
      uint64_t result = *(void *)(a1 + 40);
      if (result)
      {
        int v16 = *(uint64_t (**)(void))(result + 16);
        return v16();
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        int v17 = 136315138;
        uint64_t v18 = "-[SEMAdminConnection endEvaluation:]_block_invoke";
        _os_log_error_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_ERROR, "%s Evaluation is not enabled. Use beginEvaluation API to enable evaluation.", (uint8_t *)&v17, 0xCu);
      }
      uint64_t result = *(void *)(a1 + 40);
      if (result)
      {
        int v16 = *(uint64_t (**)(void))(result + 16);
        return v16();
      }
    }
  }
  return result;
}

uint64_t sub_25C7E043C(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  unint64_t v2 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = @"clean ";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v5 = &stru_2709E04D0;
    }
    int v9 = 136315394;
    unint64_t v10 = "-[SEMAdminConnection triggerMaintenance:completion:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v5;
    _os_log_impl(&dword_25C7CA000, v2, OS_LOG_TYPE_INFO, "%s Triggering %@maintenance", (uint8_t *)&v9, 0x16u);
  }
  int v6 = objc_msgSend_performMaintenance_(*(void **)(*(void *)(a1 + 32) + 16), v3, 0, v4);
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    if (v6) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v8);
  }
  return result;
}

void sub_25C7E06F4()
{
  unint64_t v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("SEMAdministrator", v2);
  uint64_t v1 = (void *)qword_26B3549F8;
  qword_26B3549F8 = (uint64_t)v0;
}

uint64_t sub_25C7E09C4(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v3 = 1;
    }
    else {
      uint64_t v3 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v3);
  }
  return result;
}

uint64_t sub_25C7E0C00(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = @"NOT ";
    if (a2 == 1) {
      uint64_t v5 = &stru_2709E04D0;
    }
    int v8 = 136315394;
    int v9 = "-[SEMAdministrator beginEvaluation:completion:]_block_invoke";
    __int16 v10 = 2112;
    __int16 v11 = v5;
    _os_log_impl(&dword_25C7CA000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@activated", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

uint64_t sub_25C7E0FD0(uint64_t a1, const char *a2)
{
  return objc_msgSend_beginEvaluation_completion_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), (uint64_t)a2);
}

uint64_t sub_25C7E107C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_beginEvaluationWithSerializedSets_completion_, *(void *)(a1 + 40), a2);
}

uint64_t sub_25C7E121C(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = @"NOT ";
    if (a2 == 1) {
      uint64_t v5 = &stru_2709E04D0;
    }
    int v8 = 136315394;
    int v9 = "-[SEMAdministrator endEvaluation:]_block_invoke";
    __int16 v10 = 2112;
    __int16 v11 = v5;
    _os_log_impl(&dword_25C7CA000, v4, OS_LOG_TYPE_INFO, "%s Evaluation mode %@deactivated", (uint8_t *)&v8, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (a2 == 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v7);
  }
  return result;
}

uint64_t sub_25C7E1380(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_endEvaluation_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4);
}

void sub_25C7E1570(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_25C7E1588(uint64_t a1, char a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = a2;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == 4)
    {
      uint64_t v4 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = NSNumber;
        double v6 = *(double *)(*(void *)(a1 + 32) + 16);
        uint64_t v7 = v4;
        __int16 v11 = objc_msgSend_numberWithDouble_(v5, v8, v9, v10, v6);
        int v12 = 136315394;
        uint64_t v13 = "-[SEMAdministrator _synchronouslyWrapRequest:]_block_invoke";
        __int16 v14 = 2112;
        uint64_t v15 = v11;
        _os_log_error_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_ERROR, "%s Timed out waiting for admin service. timeout: %@ seconds", (uint8_t *)&v12, 0x16u);
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
}

void sub_25C7E16B4(uint64_t a1, char a2)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_25C7E174C;
  v4[3] = &unk_2654DDF70;
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t sub_25C7E174C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t sub_25C7E1764(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_25C7E1888(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_beginEvaluation_completion_(a2, (const char *)a2, *(void *)(a1 + 32), a3);
}

uint64_t sub_25C7E18AC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_endEvaluation_(a2, (const char *)a2, a3, a4);
}

uint64_t sub_25C7E1924(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend_triggerMaintenance_completion_(a2, (const char *)a2, *(unsigned __int8 *)(a1 + 32), a3);
}

id SEMAppCustomVocabularyTypeToNumber(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1 - 1 >= 2) {
    objc_msgSend_numberWithInteger_(NSNumber, a2, 0, a4);
  }
  else {
  uint64_t v4 = objc_msgSend_numberWithInteger_(NSNumber, a2, a1, a4);
  }
  return v4;
}

BOOL SEMAppCustomVocabularyTypeIsValid(int a1)
{
  return (a1 - 1) < 2;
}

uint64_t SEMAppCustomVocabularyTypeFromNumber(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4 = (unsigned __int16)objc_msgSend_integerValue(a1, a2, a3, a4);
  if (v4 - 1 >= 2) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_25C7E3340(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  qword_26B354A08 = objc_msgSend__buildKnownIdentifierToUniversalOriginAppIdMap(SEMAppIdMapper, a2, a3, a4);
  return MEMORY[0x270F9A758]();
}

void sub_25C7E36D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7E36EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C7E36FC(uint64_t a1)
{
}

void sub_25C7E3704(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (AFOfflineDictationStatusStringIsInstalled()) {
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v3, (uint64_t)v5, v4);
  }
}

uint64_t sub_25C7E66EC()
{
  return 1;
}

void sub_25C7E7D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7E7DC0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C7E7DD0(uint64_t a1)
{
}

void sub_25C7E7DD8(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v7 = [SEMDatabaseValueRow alloc];
  uint64_t v10 = objc_msgSend_initWithDatabaseValueArray_(v7, v8, (uint64_t)v6, v9);

  uint64_t v11 = a1[4];
  uint64_t v12 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v12 + 40);
  char v13 = (*(uint64_t (**)(void))(v11 + 16))();
  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v13 & 1) == 0)
  {
    *a4 = 1;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

uint64_t sub_25C7E7F48(uint64_t a1, const char *a2, void *a3, unsigned char *a4)
{
  v17[1] = *MEMORY[0x263EF8340];
  int v8 = objc_msgSend_recordFromDatabaseValueRow_(*(void **)(a1 + 40), a2, (uint64_t)a2, (uint64_t)a4);
  if (!v8)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    v17[0] = @"Unrecognized database record converted from SQLite value row";
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v17, (uint64_t)&v16, 1);
    char v13 = objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, 0x2709E0C50, 15, v11);
    __int16 v14 = v13;
    if (a3 && v13) {
      *a3 = v13;
    }

    goto LABEL_8;
  }
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
LABEL_8:
    uint64_t v9 = 0;
    *a4 = 1;
    goto LABEL_9;
  }
  uint64_t v9 = 1;
LABEL_9:

  return v9;
}

uint64_t sub_25C7E84A8(uint64_t a1, const char *a2, void *a3, unsigned char *a4)
{
  v17[1] = *MEMORY[0x263EF8340];
  int v8 = objc_msgSend_recordFromDatabaseValueRow_(*(void **)(a1 + 40), a2, (uint64_t)a2, (uint64_t)a4);
  if (!v8)
  {
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F80];
    v17[0] = @"Unrecognized database record converted from SQLite value row";
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v7, (uint64_t)v17, (uint64_t)&v16, 1);
    char v13 = objc_msgSend_errorWithDomain_code_userInfo_(v10, v12, 0x2709E0C50, 15, v11);
    __int16 v14 = v13;
    if (a3 && v13) {
      *a3 = v13;
    }

    goto LABEL_8;
  }
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0)
  {
LABEL_8:
    uint64_t v9 = 0;
    *a4 = 1;
    goto LABEL_9;
  }
  uint64_t v9 = 1;
LABEL_9:

  return v9;
}

uint64_t sub_25C7E9850(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_openWithError_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4);
}

uint64_t sub_25C7E9904(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_closeWithError_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4);
}

void sub_25C7E9B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7E9B3C(void *a1, const char *a2)
{
  uint64_t result = objc_msgSend_enumerateRecordResultsOfSelect_recordClass_error_usingBlock_(*(void **)(a1[4] + 8), a2, a1[5], a1[8], a1[9], a1[6]);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

void sub_25C7E9D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7E9D74(uint64_t a1, const char *a2)
{
  uint64_t result = objc_msgSend_enumerateRecordResultsOfSelect_recordClass_batchSize_offset_enumerateAll_error_usingBlock_(*(void **)(*(void *)(a1 + 32) + 8), a2, *(void *)(a1 + 40), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(unsigned __int8 *)(a1 + 96), *(void *)(a1 + 88), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

void sub_25C7E9F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7E9FA0(void *a1, const char *a2)
{
  uint64_t result = objc_msgSend_enumerateRowResultsOfSelect_error_usingBlock_(*(void **)(a1[4] + 8), a2, a1[5], a1[8], a1[6]);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = result;
  return result;
}

void sub_25C7EA1B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7EA1D4(uint64_t a1, const char *a2)
{
  uint64_t result = objc_msgSend_enumerateRowResultsOfSelect_batchSize_offset_enumerateAll_error_usingBlock_(*(void **)(*(void *)(a1 + 32) + 8), a2, *(void *)(a1 + 40), *(void *)(a1 + 64), *(void *)(a1 + 72), *(unsigned __int8 *)(a1 + 88), *(void *)(a1 + 80), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

id sub_25C7EAB68(uint64_t a1)
{
  id v2 = [NSString alloc];
  uint64_t v4 = objc_msgSend_initWithData_encoding_(v2, v3, a1, 4);
  return v4;
}

id sub_25C7EABB0(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_databaseValue_toString(a1, a2, a3, a4);
  int v8 = objc_msgSend_databaseValue_toNumber(v4, v5, v6, v7);

  return v8;
}

uint64_t sub_25C7EAC00()
{
  return 1;
}

uint64_t sub_25C7EAC08(id a1, const char *a2, uint64_t *a3, uint64_t a4)
{
  if (a3) {
    *a3 = objc_msgSend_length(a1, a2, (uint64_t)a3, a4);
  }
  id v5 = a1;
  return objc_msgSend_bytes(v5, v6, v7, v8);
}

uint64_t sub_25C7EAC54()
{
  return 0;
}

uint64_t sub_25C7EAC5C()
{
  return 0;
}

uint64_t sub_25C7EAC64()
{
  return 0;
}

uint64_t sub_25C7EAC6C()
{
  return 4;
}

id sub_25C7EAC7C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_databaseValue_toString(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_databaseValue_toData(v4, v5, v6, v7);

  return v8;
}

uint64_t sub_25C7EACC8(void *a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v1 = a1;
  unsigned int v5 = *(char *)objc_msgSend_objCType(v1, v2, v3, v4) - 66;
  if (v5 > 0x31) {
    goto LABEL_6;
  }
  if (((1 << v5) & 0x2848200028483) != 0) {
    return 3;
  }
  if (((1 << v5) & 0x1400000000) != 0) {
    return 2;
  }
LABEL_6:
  uint64_t v7 = (void *)qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    id v8 = v1;
    uint64_t v9 = v7;
    int v13 = 136315650;
    __int16 v14 = "-[NSNumber(SEMDatabaseValue) databaseValue_type]";
    __int16 v15 = 2112;
    id v16 = v1;
    __int16 v17 = 2080;
    uint64_t v18 = objc_msgSend_objCType(v8, v10, v11, v12);
    _os_log_error_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_ERROR, "%s %@ (objCType = %s)", (uint8_t *)&v13, 0x20u);
  }
  return 0;
}

id sub_25C7EAE1C(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_length(a1, a2, a3, a4);
  id v6 = objc_alloc(MEMORY[0x263F08B08]);
  uint64_t v9 = objc_msgSend_initWithString_(v6, v7, (uint64_t)a1, v8);
  uint64_t v51 = 0;
  if (objc_msgSend_scanUnsignedLongLong_(v9, v10, (uint64_t)&v51, v11)
    && objc_msgSend_scanLocation(v9, v12, v13, v14) == v5)
  {
    uint64_t v15 = v51;
    if (v51 != -1)
    {
LABEL_6:
      uint64_t v16 = objc_msgSend_numberWithUnsignedLongLong_(NSNumber, v12, v15, v14);
      goto LABEL_25;
    }
    if (objc_msgSend_isEqualToString_(a1, v12, @"18446744073709551615", v14))
    {
      uint64_t v15 = v51;
      goto LABEL_6;
    }
LABEL_23:
    id v39 = objc_alloc(MEMORY[0x263F087B0]);
    uint64_t v16 = objc_msgSend_initWithString_(v39, v40, (uint64_t)a1, v41);
    goto LABEL_25;
  }
  objc_msgSend_setScanLocation_(v9, v12, 0, v14);
  uint64_t v50 = 0;
  if (objc_msgSend_scanLongLong_(v9, v17, (uint64_t)&v50, v18)
    && objc_msgSend_scanLocation(v9, v19, v20, v21) == v5)
  {
    uint64_t v22 = v50;
    if (v50 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((objc_msgSend_isEqualToString_(a1, v19, @"+9223372036854775807", v21) & 1) == 0) {
        goto LABEL_23;
      }
      uint64_t v22 = v50;
    }
    if (v22 == 0x8000000000000000)
    {
      if (!objc_msgSend_isEqualToString_(a1, v19, @"-9223372036854775808", v21)) {
        goto LABEL_23;
      }
      uint64_t v22 = v50;
    }
    uint64_t v16 = objc_msgSend_numberWithLongLong_(NSNumber, v19, v22, v21);
    goto LABEL_25;
  }
  objc_msgSend_setScanLocation_(v9, v19, 0, v21);
  long long v48 = 0uLL;
  int v49 = 0;
  BOOL v28 = 0;
  if (!objc_msgSend_scanDecimal_(v9, v23, (uint64_t)&v48, v24)) {
    goto LABEL_26;
  }
  if (objc_msgSend_scanLocation(v9, v25, v26, v27) != v5)
  {
    BOOL v28 = 0;
    goto LABEL_26;
  }
  if ((BYTE1(v48) & 0xC) == 0
    && (objc_msgSend_setScanLocation_(v9, v29, 0, v30),
        *(void *)&long long v46 = 0,
        objc_msgSend_scanDouble_(v9, v31, (uint64_t)&v46, v32))
    && objc_msgSend_scanLocation(v9, v33, v34, v35) == v5)
  {
    uint64_t v16 = objc_msgSend_numberWithDouble_(NSNumber, v36, v37, v38, *(double *)&v46);
  }
  else
  {
    id v42 = objc_alloc(MEMORY[0x263F087B0]);
    long long v46 = v48;
    int v47 = v49;
    uint64_t v16 = objc_msgSend_initWithDecimal_(v42, v43, (uint64_t)&v46, v44);
  }
LABEL_25:
  BOOL v28 = (void *)v16;
LABEL_26:

  return v28;
}

uint64_t sub_25C7EB040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](a1, sel_dataUsingEncoding_, 4, a4);
}

uint64_t sub_25C7EB048()
{
  return 5;
}

uint64_t sub_25C7EB050(void *a1)
{
  id v1 = a1;
  return objc_msgSend_UTF8String(v1, v2, v3, v4);
}

__CFString *sub_25C7EB25C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1 >= 4)
  {
    uint64_t v5 = NSString;
    id v6 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a2, a1, a4);
    objc_msgSend_stringWithFormat_(v5, v7, @"%@", v8, v6);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = off_2654DE1D8[(char)a1];
  }
  return v4;
}

void sub_25C7ECE44()
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  dispatch_queue_t v0 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v21 = 136315138;
    uint64_t v22 = "+[SEMDispatcher sharedInstance]_block_invoke";
    _os_log_impl(&dword_25C7CA000, v0, OS_LOG_TYPE_INFO, "%s Starting up...", (uint8_t *)&v21, 0xCu);
  }
  id v1 = sub_25C7F012C();
  uint64_t v4 = objc_msgSend_setEnumeratorWithUseCase_(MEMORY[0x263F31770], v2, 0x2709E3830, v3);
  uint64_t v8 = objc_msgSend_defaultSettings(SEMSettings, v5, v6, v7);
  uint64_t v9 = [SEMIndexSiteCache alloc];
  Only = objc_msgSend_initWithManagerDirectory_readOnly_(v9, v10, (uint64_t)v1, 0);
  uint64_t v12 = [SEMIndexSiteManager alloc];
  uint64_t v14 = objc_msgSend_initWithManagerDirectory_indexSiteCache_setEnumerator_settings_(v12, v13, (uint64_t)v1, (uint64_t)Only, v4, v8);
  uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v16 = dispatch_queue_create("Siri Entity Matcher Dispatcher", v15);

  id v17 = objc_alloc((Class)objc_opt_class());
  uint64_t v19 = objc_msgSend_initWithIndexSiteManager_indexSiteCache_settings_queue_(v17, v18, (uint64_t)v14, (uint64_t)Only, v8, v16);
  uint64_t v20 = (void *)qword_26B354A20;
  qword_26B354A20 = v19;
}

uint64_t sub_25C7ED200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_handleSetChangeBatch_, a2, a4);
}

uint64_t sub_25C7EDA90(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v2 = (void *)qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    unsigned int v4 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v5 = v2;
    uint64_t v9 = sub_25C7FBC68(v4, v6, v7, v8);
    int v11 = 136315394;
    uint64_t v12 = "-[SEMDispatcher indexSiteAvailableWithType:]_block_invoke";
    __int16 v13 = 2112;
    uint64_t v14 = v9;
    _os_log_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_INFO, "%s Handling index site available with type: %@", (uint8_t *)&v11, 0x16u);
  }
  return objc_msgSend_handleIndexSiteAvailableWithType_shouldDefer_(*(void **)(*(void *)(a1 + 32) + 8), v3, *(unsigned __int8 *)(a1 + 40), 0);
}

BOOL SEMEntityTypeIsValid(int a1)
{
  return a1 == 1;
}

__CFString *SEMEntityTypeDescription(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    if (a1 == 1)
    {
      uint64_t v5 = @"Cascade";
    }
    else
    {
      objc_msgSend_stringWithFormat_(NSString, a2, @"Undefined (%u)", a4, a1);
      uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v5 = @"Undefined";
  }
  return v5;
}

void sub_25C7EEC54(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, id a15, __int16 a16)
{
  if (a2 == 1)
  {
    id v17 = objc_begin_catch(a1);
    uint64_t v18 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = NSStringFromClass(v16);
      LODWORD(buf) = 136315906;
      *(void *)((char *)&buf + 4) = "-[SEMFilesystemBase(FileStorage) readFileWithName:objectClass:inDirectory:]";
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v19;
      a14 = 2112;
      a15 = v17;
      a16 = 2112;
      _os_log_error_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_ERROR, "%s Failed to decode data of type: %@ with exception: '%@' for file: '%@'", (uint8_t *)&buf, 0x2Au);
    }
    objc_end_catch();
    JUMPOUT(0x25C7EE94CLL);
  }
  _Unwind_Resume(a1);
}

id sub_25C7EFC30(void *a1, void *a2)
{
  id v6 = a1;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v3, v4, v5);
    int DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v7, v8, (uint64_t)v6, 1, 0, a2);

    id v10 = 0;
    if (DirectoryAtURL_withIntermediateDirectories_attributes_error) {
      id v10 = v6;
    }
  }
  else
  {
    int v11 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v3, *MEMORY[0x263F07F70], -1000, 0);
    uint64_t v12 = v11;
    if (a2 && v11) {
      *a2 = v11;
    }

    id v10 = 0;
  }

  return v10;
}

uint64_t sub_25C7EFD04(void *a1, void *a2)
{
  v27[1] = *MEMORY[0x263EF8340];
  id v6 = a1;
  if (v6)
  {
    uint64_t v7 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v3, v4, v5);
    id v25 = 0;
    char v9 = objc_msgSend_removeItemAtURL_error_(v7, v8, (uint64_t)v6, (uint64_t)&v25);
    id v10 = v25;
    id v14 = v10;
    if (v9)
    {

LABEL_9:
      uint64_t v22 = 1;
      goto LABEL_10;
    }
    uint64_t v23 = objc_msgSend_code(v10, v11, v12, v13);

    if (v23 == 4) {
      goto LABEL_9;
    }
    uint64_t v22 = 0;
    if (a2 && v14)
    {
      id v14 = v14;
      uint64_t v22 = 0;
      *a2 = v14;
    }
  }
  else
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F07F70];
    uint64_t v26 = *MEMORY[0x263F08320];
    objc_msgSend_stringWithFormat_(NSString, v3, @"Invalid item URL: %@", v5, 0);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v17, (uint64_t)v27, (uint64_t)&v26, 1);
    uint64_t v20 = objc_msgSend_errorWithDomain_code_userInfo_(v15, v19, v16, -1000, v18);
    int v21 = v20;
    if (a2 && v20) {
      *a2 = v20;
    }

    uint64_t v22 = 0;
  }
LABEL_10:

  return v22;
}

uint64_t sub_25C7EFEA8(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v7 = a2;
  char v9 = objc_msgSend_dataWithPropertyList_format_options_error_(MEMORY[0x263F08AC0], v8, a1, 200, 0, a4);
  if (objc_msgSend_length(v9, v10, v11, v12))
  {
    objc_msgSend_path(v7, v13, v14, v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    uint64_t v20 = (const char *)objc_msgSend_UTF8String(v16, v17, v18, v19);
    uint64_t v21 = open_dprotected_np(v20, 1538, a3, 0, 384);

    id v22 = objc_alloc(MEMORY[0x263F08840]);
    uint64_t v24 = objc_msgSend_initWithFileDescriptor_closeOnDealloc_(v22, v23, v21, 1);
    uint64_t v29 = objc_msgSend_writeData_error_(v24, v25, (uint64_t)v9, a4);
    if ((v29 & 1) == 0)
    {
      uint64_t v30 = objc_msgSend_URLByDeletingLastPathComponent(v7, v26, v27, v28);
      uint64_t v34 = objc_msgSend_path(v30, v31, v32, v33);

      unsigned __int8 v43 = 0;
      uint64_t v38 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v35, v36, v37);
      char isDirectory = objc_msgSend_fileExistsAtPath_isDirectory_(v38, v39, (uint64_t)v34, (uint64_t)&v43);

      if ((isDirectory & 1) == 0)
      {
        uint64_t v41 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136315650;
          unint64_t v45 = "SEMWritePropertyList";
          __int16 v46 = 2112;
          int v47 = v34;
          __int16 v48 = 1024;
          int v49 = v43;
          _os_log_error_impl(&dword_25C7CA000, v41, OS_LOG_TYPE_ERROR, "%s Parent directory: %@ does not exist (isDirectory: %i)", buf, 0x1Cu);
        }
      }
    }
  }
  else
  {
    uint64_t v29 = 0;
  }

  return v29;
}

id sub_25C7F0098(uint64_t a1, const char *a2, uint64_t a3)
{
  id v6 = objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x263EFF8F8], a2, a1, 0, a3);
  if (v6)
  {
    id v7 = objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x263F08AC0], v5, (uint64_t)v6, (uint64_t)a2, 0, a3);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id sub_25C7F012C()
{
  dispatch_queue_t v0 = NSURL;
  id v1 = (void *)CPSharedResourcesDirectory();
  uint64_t v4 = objc_msgSend_stringByAppendingPathComponent_(v1, v2, @"Library/Assistant/SiriVocabulary", v3);
  id v6 = objc_msgSend_fileURLWithPath_isDirectory_(NSURL, v5, (uint64_t)v4, 1);

  uint64_t v8 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v7, @"Modules", 1, v6);

  id v10 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(v0, v9, @"SEM", 1, v8);

  return v10;
}

uint64_t sub_25C7F1D40(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return 1;
}

uint64_t sub_25C7F1FFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v8 = objc_msgSend_externalId(v3, v5, v6, v7);
  objc_msgSend_objectForKey_(v4, v9, (uint64_t)v8, v10);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v14 = *(void **)(a1 + 32);
    uint64_t v18 = objc_msgSend_externalId(v3, v15, v16, v17);
    objc_msgSend_setObject_forKey_(v14, v19, (uint64_t)v11, (uint64_t)v18);
  }
  objc_msgSend_addObject_(v11, v12, (uint64_t)v3, v13);

  return 1;
}

void sub_25C7F32AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t sub_25C7F32F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C7F3304(uint64_t a1)
{
}

void sub_25C7F330C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_changePublisherWithUseCase_(*(void **)(a1 + 32), a2, 0x2709E3830, a4);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_25C7F3468;
  v21[3] = &unk_2654DE298;
  uint64_t v24 = *(void *)(a1 + 80);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v22 = v7;
  uint64_t v23 = v8;
  uint64_t v25 = *(void *)(a1 + 88);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_25C7F3534;
  v15[3] = &unk_2654DE2C0;
  id v9 = *(id *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 80);
  id v17 = v9;
  uint64_t v18 = v10;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(a1 + 64);
  v15[4] = *(void *)(a1 + 56);
  v15[5] = v11;
  id v16 = v12;
  long long v19 = *(_OWORD *)(a1 + 88);
  uint64_t v20 = *(void *)(a1 + 104);
  id v14 = (id)objc_msgSend_drivableSinkWithBookmark_completion_shouldContinue_(v5, v13, v6, (uint64_t)v21, v15);
}

void sub_25C7F3468(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_msgSend_state(v5, v7, v8, v9))
  {
    uint64_t v13 = objc_msgSend_error(v5, v10, v11, v12);
    uint64_t v14 = *(void *)(a1[7] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  else
  {
    id v16 = (void *)a1[4];
    uint64_t v17 = a1[5];
    uint64_t v18 = *(void *)(a1[7] + 8);
    id obj = *(id *)(v18 + 40);
    char updated = objc_msgSend_updateBookmark_forSet_error_(v16, v10, (uint64_t)v6, v17, &obj);
    objc_storeStrong((id *)(v18 + 40), obj);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = updated;
  }
}

uint64_t sub_25C7F3534(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!(*(unsigned int (**)(void))(*(void *)(a1 + 56) + 16))())
  {
    id v7 = v3;
    uint64_t v11 = objc_msgSend_sharedItem(v7, v8, v9, v10);
    id v12 = objc_alloc(MEMORY[0x263F08C38]);
    objc_msgSend_prefixedSharedIdentifier_(*(void **)(a1 + 40), v13, (uint64_t)v11, v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v19 = objc_msgSend_bytes(v15, v16, v17, v18);
    id v22 = objc_msgSend_initWithUUIDBytes_(v12, v20, v19, v21);

    int v26 = objc_msgSend_sharedItemChangeType(v7, v23, v24, v25);
    if (v26 == 2)
    {
      uint64_t v33 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v34 = *(void *)(*(void *)(a1 + 72) + 8);
      id v37 = *(id *)(v34 + 40);
      char v35 = objc_msgSend_deleteExternalId_error_(v33, v27, (uint64_t)v22, (uint64_t)&v37);
      objc_storeStrong((id *)(v34 + 40), v37);
      if (v35)
      {
        uint64_t v32 = *(void *)(a1 + 88);
        goto LABEL_11;
      }
    }
    else
    {
      if (v26)
      {
LABEL_12:
        uint64_t v6 = 1;
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v28 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v29 = *(void *)(a1 + 48);
      uint64_t v30 = *(void *)(*(void *)(a1 + 72) + 8);
      id obj = *(id *)(v30 + 40);
      char inserted = objc_msgSend_insertRecordsFromCascadeItem_originAppId_externalId_error_(v28, v27, (uint64_t)v11, v29, v22, &obj);
      objc_storeStrong((id *)(v30 + 40), obj);
      if (inserted)
      {
        uint64_t v32 = *(void *)(a1 + 80);
LABEL_11:
        ++*(_DWORD *)(*(void *)(v32 + 8) + 24);
        goto LABEL_12;
      }
    }
    uint64_t v6 = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    goto LABEL_14;
  }
  uint64_t v4 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)long long buf = 136315394;
    int v40 = "-[SEMFTSUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]_block_invoke_3";
    __int16 v41 = 2112;
    uint64_t v42 = v5;
    _os_log_impl(&dword_25C7CA000, v4, OS_LOG_TYPE_INFO, "%s (%@) Aborting update due to deferral signal", buf, 0x16u);
  }
  uint64_t v6 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
LABEL_15:

  return v6;
}

void sub_25C7F4910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_25C7F4950(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C7F4960(uint64_t a1)
{
}

void sub_25C7F4968(void *a1, void *a2)
{
  v62[4] = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v7 = objc_msgSend_fieldType(v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_stringValueNoCopy(v3, v8, v9, v10);

  if (*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    if (objc_msgSend__isIndexedFieldType_(SEMFTSWriter, v12, v7, v13) && v11 != 0)
    {
      uint64_t v17 = a1[5];
      v62[0] = a1[4];
      uint64_t v18 = objc_msgSend_encodedExternalIdString_(SEMFTSRecord, v14, v17, v15);
      v62[1] = v18;
      uint64_t v21 = objc_msgSend_numberWithUnsignedShort_(NSNumber, v19, v7, v20);
      v62[2] = v21;
      v62[3] = v11;
      uint64_t v23 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v22, (uint64_t)v62, 4);

      if ((objc_msgSend_updateParameters_(*(void **)(*(void *)(a1[8] + 8) + 40), v24, (uint64_t)v23, v25) & 1) == 0)
      {
        v61[0] = 0x2709E0BD0;
        v61[1] = 0x2709E0BF0;
        v61[2] = 0x2709E0C10;
        void v61[3] = 0x2709E0C30;
        uint64_t v27 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], v26, (uint64_t)v61, 4);
        uint64_t v29 = objc_msgSend_builderWithTableName_columnNames_(SEMDatabaseInsert, v28, 0x2709E0BB0, (uint64_t)v27);

        objc_msgSend_setColumnValues_(v29, v30, (uint64_t)v23, v31);
        uint64_t v32 = *(void *)(a1[9] + 8);
        id obj = *(id *)(v32 + 40);
        uint64_t v35 = objc_msgSend_buildWithError_(v29, v33, (uint64_t)&obj, v34);
        objc_storeStrong((id *)(v32 + 40), obj);
        uint64_t v36 = *(void *)(a1[8] + 8);
        id v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = v35;

        uint64_t v39 = *(void *)(*(void *)(a1[8] + 8) + 40);
        if (!v39)
        {
          unint64_t v45 = qword_26B3549D8;
          if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
          {
            uint64_t v49 = *(void *)(a1[6] + 8);
            uint64_t v50 = *(void *)(*(void *)(a1[9] + 8) + 40);
            *(_DWORD *)long long buf = 136315906;
            unint64_t v54 = "-[SEMFTSWriter insertRecordsFromCascadeItem:originAppId:externalId:error:]_block_invoke";
            __int16 v55 = 2112;
            uint64_t v56 = v49;
            __int16 v57 = 2112;
            char v58 = v23;
            __int16 v59 = 2112;
            uint64_t v60 = v50;
            _os_log_error_impl(&dword_25C7CA000, v45, OS_LOG_TYPE_ERROR, "%s (%@) Failed to build Insert with params: {%@} error: %@", buf, 0x2Au);
          }
          *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;

          goto LABEL_16;
        }
        objc_msgSend_setObject_forKey_(*(void **)(a1[6] + 16), v38, v39, (uint64_t)&unk_2709EA538);
      }
      int v40 = *(void **)(a1[6] + 8);
      uint64_t v41 = *(void *)(*(void *)(a1[8] + 8) + 40);
      uint64_t v42 = *(void *)(a1[9] + 8);
      id v51 = *(id *)(v42 + 40);
      char v43 = objc_msgSend_executeCommand_error_(v40, v26, v41, (uint64_t)&v51);
      objc_storeStrong((id *)(v42 + 40), v51);
      if ((v43 & 1) == 0)
      {
        uint64_t v44 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v46 = *(void *)(a1[6] + 8);
          int v47 = *(void **)(*(void *)(a1[8] + 8) + 40);
          uint64_t v48 = *(void *)(*(void *)(a1[9] + 8) + 40);
          *(_DWORD *)long long buf = 136315906;
          unint64_t v54 = "-[SEMFTSWriter insertRecordsFromCascadeItem:originAppId:externalId:error:]_block_invoke";
          __int16 v55 = 2112;
          uint64_t v56 = v46;
          __int16 v57 = 2112;
          char v58 = v47;
          __int16 v59 = 2112;
          uint64_t v60 = v48;
          _os_log_error_impl(&dword_25C7CA000, v44, OS_LOG_TYPE_ERROR, "%s (%@) Failed to execute insert: {%@} error: %@", buf, 0x2Au);
        }
        *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 0;
      }
LABEL_16:
    }
  }
}

void sub_25C7F4DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7F4E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7F50B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_25C7F5180(char a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = v2;
  if (a1) {
    objc_msgSend_addObject_(v2, v3, @"PrefixMatching", v4);
  }
  if ((a1 & 2) != 0) {
    objc_msgSend_addObject_(v5, v3, @"DiacriticsStripping", v4);
  }
  if ((a1 & 4) != 0) {
    objc_msgSend_addObject_(v5, v3, @"PhoneticSearch", v4);
  }
  if ((a1 & 8) != 0) {
    objc_msgSend_addObject_(v5, v3, @"TokenLemmatization", v4);
  }
  uint64_t v6 = objc_msgSend_componentsJoinedByString_(v5, v3, @"|", v4);

  return v6;
}

void sub_25C7F5230(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C7F55D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C7F55E4(uint64_t a1)
{
}

void sub_25C7F55EC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_objectForKey_(*(void **)(a1[4] + 16), a2, a1[5], a4);
  uint64_t v6 = *(void *)(a1[7] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v8 = a1[6];
    if (v8)
    {
      uint64_t v9 = (*(void (**)(void))(v8 + 16))();
      uint64_t v10 = *(void *)(a1[7] + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      uint64_t v13 = *(void *)(*(void *)(a1[7] + 8) + 40);
      if (v13)
      {
        uint64_t v14 = a1[5];
        uint64_t v15 = *(void **)(a1[4] + 16);
        objc_msgSend_setObject_forKey_(v15, v12, v13, v14);
      }
    }
  }
}

id sub_25C7F5940(unsigned __int8 a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v9 = v7;
  if (v5) {
    objc_msgSend_setObject_forKey_(v7, v8, (uint64_t)v5, *MEMORY[0x263F07F80]);
  }
  if (v6) {
    objc_msgSend_setObject_forKey_(v9, v8, (uint64_t)v6, *MEMORY[0x263F08608]);
  }
  uint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v8, @"com.apple.siri.inference.EntityMatcher.indexSite", a1, v9);

  return v10;
}

void sub_25C7F5B60(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 16));
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = v3[4];
    uint64_t v5 = *(void *)(a1[6] + 8);
    id obj = *(id *)(v5 + 40);
    id v6 = objc_msgSend__loadIndexSiteDirectoryWithName_parentDirectory_error_(v3, v2, @"Default", v4, &obj);
    objc_storeStrong((id *)(v5 + 40), obj);
    if (v6)
    {
      id v7 = [SEMIndexSite alloc];
      uint64_t v9 = objc_msgSend_initWithType_indexSiteURL_dataProtectionClass_personaIdentifier_(v7, v8, 1, (uint64_t)v6, 3, 0);
      uint64_t v10 = *(void *)(a1[5] + 8);
      uint64_t v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      id v12 = *(void **)(*(void *)(a1[5] + 8) + 40);
      if (v12) {
        objc_storeStrong((id *)(a1[4] + 16), v12);
      }
    }
  }
}

void sub_25C7F5F54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = 0;
}

void sub_25C7F608C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 16))
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = sub_25C7F6130;
    v3[3] = &unk_2654DDE80;
    v3[4] = v1;
    id v4 = *(id *)(a1 + 40);
    objc_msgSend_runAsPersonaIdentifier_block_(SEMPersonaUtilities, v2, 0, (uint64_t)v3);
  }
}

void sub_25C7F6130(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[SEMIndexSiteCache enumerateIndexSitesUsingBlock:]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_25C7CA000, v3, OS_LOG_TYPE_INFO, "%s Invoking block with index site (%@)", (uint8_t *)&v4, 0x16u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_25C7F6334(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v2 = a2;
  id v3 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    uint64_t v14 = "-[SEMIndexSiteCache indexSiteUnavailableSoonWithType:]_block_invoke";
    __int16 v15 = 2112;
    id v16 = v2;
    _os_log_impl(&dword_25C7CA000, v3, OS_LOG_TYPE_INFO, "%s Marking cached index site (%@) as unavailable soon", (uint8_t *)&v13, 0x16u);
  }
  objc_msgSend_setIsUnavailableSoon_(v2, v4, 1, v5);
  uint64_t v9 = objc_msgSend_uvTransaction(v2, v6, v7, v8);
  if (v9)
  {
    uint64_t v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315650;
      uint64_t v14 = "-[SEMIndexSiteCache indexSiteUnavailableSoonWithType:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v2;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_INFO, "%s (%@) Releasing UVTransaction: %@", (uint8_t *)&v13, 0x20u);
    }
    objc_msgSend_setUvTransaction_(v2, v11, 0, v12);
  }
}

uint64_t sub_25C7F65C0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__evictCachedUserVaultIndexSite_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4);
}

void sub_25C7F6700(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (objc_msgSend_isUnavailableSoon(v3, v4, v5, v6))
  {
    uint64_t v7 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[SEMIndexSiteCache indexSiteAvailableWithType:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_INFO, "%s Cached index site (%@) was previously marked unavailable soon but is now available", (uint8_t *)&v10, 0x16u);
    }
    objc_msgSend__evictCachedUserVaultIndexSite_(*(void **)(a1 + 32), v8, (uint64_t)v3, v9);
  }
}

uint64_t sub_25C7F6A54(uint64_t a1, const char *a2)
{
  uint64_t result = objc_msgSend__didHandleUpdatedSets_shouldDefer_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t sub_25C7F6B3C(uint64_t a1, const char *a2)
{
  uint64_t result = objc_msgSend__didRefreshSettings_skipMaintenance_(*(void **)(a1 + 32), a2, 0, 0);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_25C7F6C48(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend__performMaintenance_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t sub_25C7F6D2C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend__resetManagerDirectory(*(void **)(a1 + 32), a2, a3, a4);
  if (result) {
    uint64_t result = objc_msgSend__performOperationAtAllIndexSites_shouldDefer_(*(void **)(a1 + 32), v6, 4, 0);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_25C7F6E40(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = objc_msgSend__rebuildAllStateWithSetEnumerator_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t sub_25C7F6EEC(uint64_t a1, const char *a2)
{
  return objc_msgSend__performOperationAtAllIndexSites_shouldDefer_(*(void **)(a1 + 32), a2, 5, 0);
}

uint64_t sub_25C7F6FD8(uint64_t a1, const char *a2)
{
  uint64_t result = objc_msgSend__performAnyDeferredOperationsAtIndexSiteType_shouldDefer_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

id sub_25C7F77C0(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v2 = [SEMIndexSiteWriter alloc];
  int v4 = objc_msgSend_initWithIndexSite_settings_(v2, v3, *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 48));
  id v20 = 0;
  objc_msgSend_schemaVersion_(v4, v5, (uint64_t)&v20, v6);
  uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v8 = v20;
  if (v8)
  {
    uint64_t v11 = v8;
    __int16 v12 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315650;
      id v22 = "-[SEMIndexSiteManager _cachedWriterForIndexSiteType:]_block_invoke";
      __int16 v23 = 2112;
      uint64_t v24 = v4;
      __int16 v25 = 2112;
      uint64_t v26 = (uint64_t)v11;
      _os_log_error_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_ERROR, "%s Failed to read schema verison for site (%@) error: %@", buf, 0x20u);
    }
  }
  if (objc_msgSend_isEqual_(&unk_2709EA550, v9, (uint64_t)v7, v10)) {
    goto LABEL_11;
  }
  id v13 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    __int16 v17 = @"empty";
    *(_DWORD *)long long buf = 136315906;
    id v22 = "-[SEMIndexSiteManager _cachedWriterForIndexSiteType:]_block_invoke";
    __int16 v23 = 2112;
    if (v7) {
      __int16 v17 = v7;
    }
    uint64_t v24 = v4;
    __int16 v25 = 2112;
    uint64_t v26 = 0x2709EA550;
    __int16 v27 = 2112;
    uint64_t v28 = v17;
    _os_log_impl(&dword_25C7CA000, v13, OS_LOG_TYPE_INFO, "%s Index site (%@) schema (expected: %@) not initialized yet (found: %@)", buf, 0x2Au);
  }
  if (objc_msgSend_resetSiteDirectory(v4, v14, v15, v16)) {
LABEL_11:
  }
    id v18 = v4;
  else {
    id v18 = 0;
  }

  return v18;
}

void sub_25C7F7CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C7F7D00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C7F7D10(uint64_t a1)
{
}

void sub_25C7F7D18(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend__cachedWriterForIndexSiteType_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 72), a4);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v8 = &stru_2709E04D0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    id v8 = @"Not ";
  }
  uint64_t v9 = NSString;
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = objc_msgSend_currentPersonaIdentifier(SEMPersonaUtilities, v5, v6, v7);
  uint64_t v14 = objc_msgSend_stringWithFormat_(v9, v12, @"%@:%@ - %@Available", v13, v10, v11, v8);

  objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v15, (uint64_t)v14, v16);
}

uint64_t sub_25C7F8374(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__discoverAllSetsForIndexSiteType_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40), a4);
}

void sub_25C7F8750(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_25C7F8774(uint64_t a1, const char *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_25C7F88F0;
  v15[3] = &unk_2654DE540;
  v15[4] = *(void *)(a1 + 40);
  id v16 = 0;
  char v4 = objc_msgSend_enumerateAllSets_withOptions_usingBlock_(v3, a2, (uint64_t)&v16, 0, v15);
  id v5 = v16;
  if ((v4 & 1) == 0)
  {
    uint64_t v6 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v9 = *(unsigned __int8 *)(a1 + 48);
      uint64_t v10 = v6;
      uint64_t v14 = sub_25C7FBC68(v9, v11, v12, v13);
      *(_DWORD *)long long buf = 136315650;
      uint64_t v18 = "-[SEMIndexSiteManager _discoverAllSetsForIndexSiteType:]_block_invoke";
      __int16 v19 = 2112;
      id v20 = v14;
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_error_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_ERROR, "%s Failed to enumerate %@ sets: %@", buf, 0x20u);
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = 0;
  }
}

uint64_t sub_25C7F88F0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2, (uint64_t)a2, a4);
}

void sub_25C7F8904(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = objc_msgSend_currentPersonaIdentifier(SEMPersonaUtilities, a2, a3, a4);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
    id v24 = 0;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_25C7F8ACC;
    v21[3] = &unk_2654DE568;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 40);
    id v22 = v7;
    uint64_t v23 = v8;
    char v10 = objc_msgSend_enumerateAllSets_withOptions_usingBlock_(v6, v9, (uint64_t)&v24, 0, v21);
    id v11 = v24;
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        unsigned int v15 = *(unsigned __int8 *)(a1 + 48);
        id v16 = v12;
        id v20 = sub_25C7FBC68(v15, v17, v18, v19);
        *(_DWORD *)long long buf = 136315906;
        uint64_t v26 = "-[SEMIndexSiteManager _discoverAllSetsForIndexSiteType:]_block_invoke";
        __int16 v27 = 2112;
        uint64_t v28 = v20;
        __int16 v29 = 2112;
        id v30 = v7;
        __int16 v31 = 2112;
        id v32 = v11;
        _os_log_error_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_ERROR, "%s Failed to enumerate sets for site (%@) persona: %@ error: %@", buf, 0x2Au);
      }
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = 0;
    }
  }
}

void sub_25C7F8ACC(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  uint64_t v8 = objc_msgSend_personaIdentifier(v3, v5, v6, v7);
  LOBYTE(v4) = objc_msgSend_isEqual_(v4, v9, (uint64_t)v8, v10);

  if (v4)
  {
    objc_msgSend_addObject_(*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v11, (uint64_t)v3, v12);
  }
  else
  {
    uint64_t v13 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 136315650;
      id v16 = "-[SEMIndexSiteManager _discoverAllSetsForIndexSiteType:]_block_invoke_2";
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl(&dword_25C7CA000, v13, OS_LOG_TYPE_INFO, "%s Ignoring set from enumeration that does not match the current persona (%@): %@", (uint8_t *)&v15, 0x20u);
    }
  }
}

void sub_25C7F8E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25C7F8E84(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a2;
  uint64_t v5 = *(void *)(a1 + 48);
  if (!v5)
  {
    char shouldDefer = objc_msgSend__performOperation_atIndexSite_withDate_shouldDefer_(*(void **)(a1 + 32), v3, *(unsigned __int8 *)(a1 + 64), (uint64_t)v4, *(void *)(a1 + 40), 0);
LABEL_8:
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    if (*(unsigned char *)(v9 + 24)) {
      char v10 = shouldDefer;
    }
    else {
      char v10 = 0;
    }
    *(unsigned char *)(v9 + 24) = v10;
    goto LABEL_12;
  }
  if (((*(uint64_t (**)(void))(v5 + 16))() & 1) == 0)
  {
    char shouldDefer = objc_msgSend__performOperation_atIndexSite_withDate_shouldDefer_(*(void **)(a1 + 32), v6, *(unsigned __int8 *)(a1 + 64), (uint64_t)v4, *(void *)(a1 + 40), *(void *)(a1 + 48));
    goto LABEL_8;
  }
  uint64_t v7 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[SEMIndexSiteManager _performOperationAtAllIndexSites:shouldDefer:]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_INFO, "%s Exiting after deferral signal - skipping site (%@)", (uint8_t *)&v11, 0x16u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_12:
}

id sub_25C7F9450(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_25C7FA1F8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_25C7FA228(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v11 = 0;
  if (objc_msgSend__checkLastDateOfOperation_isOverdue_atSite_(*(void **)(a1 + 32), v4, 4, (uint64_t)&v11, v3))BOOL v6 = v11 == 0; {
  else
  }
    BOOL v6 = 0;
  if (v6)
  {
    char v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315394;
      __int16 v13 = "-[SEMIndexSiteManager _didRefreshSettings:skipMaintenance:]_block_invoke";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_debug_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_DEBUG, "%s Reset already performed at site (%@)", buf, 0x16u);
    }
  }
  else
  {
    char shouldDefer = objc_msgSend__performOperation_atIndexSite_shouldDefer_(*(void **)(a1 + 32), v5, 4, (uint64_t)v3, *(void *)(a1 + 40));
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v8 + 24)) {
      char v9 = shouldDefer;
    }
    else {
      char v9 = 0;
    }
    *(unsigned char *)(v8 + 24) = v9;
  }
}

void sub_25C7FA560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_25C7FA580(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  char v18 = 0;
  if ((objc_msgSend__performAnyDeferredOperationsAtIndexSite_outOperationPerformed_shouldDefer_(*(void **)(a1 + 32), v4, (uint64_t)v3, (uint64_t)&v18, *(void *)(a1 + 40)) & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_15;
  }
  if (v18 == 1) {
    goto LABEL_11;
  }
  if (v18 == 2)
  {
    BOOL v6 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = v6;
      char v11 = sub_25C7FBCF8(2u, v8, v9, v10);
      *(_DWORD *)long long buf = 136315650;
      id v20 = "-[SEMIndexSiteManager _performMaintenance:]_block_invoke";
      __int16 v21 = 2112;
      id v22 = v3;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_INFO, "%s No further maintenance to perform at site (%@) following operation \"%@\"", buf, 0x20u);
    }
    goto LABEL_15;
  }
  char shouldDefer = objc_msgSend__performOperation_atIndexSite_shouldDefer_(*(void **)(a1 + 32), v5, 1, (uint64_t)v3, *(void *)(a1 + 40));
  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
  char v14 = *(unsigned char *)(v13 + 24) ? shouldDefer : 0;
  *(unsigned char *)(v13 + 24) = v14;
  if (v18 != 3)
  {
LABEL_11:
    char v15 = objc_msgSend__performOperation_atIndexSite_shouldDefer_(*(void **)(a1 + 32), v5, 3, (uint64_t)v3, *(void *)(a1 + 40));
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    if (*(unsigned char *)(v16 + 24)) {
      char v17 = v15;
    }
    else {
      char v17 = 0;
    }
    *(unsigned char *)(v16 + 24) = v17;
  }
LABEL_15:
}

void sub_25C7FAACC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_description(*(void **)(a1 + 32), a2, a3, a4);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (const char *)objc_msgSend_UTF8String(v4, v5, v6, v7);
  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v14 = dispatch_queue_create(v8, v9);

  uint64_t v10 = [SEMIndexSiteMonitor alloc];
  uint64_t v12 = objc_msgSend_initWithQueue_uvSession_(v10, v11, (uint64_t)v14, 0);
  uint64_t v13 = (void *)qword_26B354A30;
  qword_26B354A30 = v12;
}

uint64_t sub_25C7FADD8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_25C7FAE94(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v3 = *(id *)(*(void *)(a1 + 32) + 24);
  uint64_t v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v24, (uint64_t)v32, 16);
  if (v5)
  {
    uint64_t v9 = v5;
    uint64_t v10 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v3);
        }
        uint64_t v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend_observer(v12, v6, v7, v8, (void)v24);
        uint64_t v16 = (void *)v13;
        if (v13 && v13 != *(void *)(a1 + 40)) {
          objc_msgSend_addObject_(v2, v14, (uint64_t)v12, v15);
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v24, (uint64_t)v32, 16);
    }
    while (v9);
  }

  if (*(unsigned char *)(a1 + 48))
  {
    char v17 = objc_opt_new();
    objc_msgSend_setObserver_(v17, v18, *(void *)(a1 + 40), v19);
    objc_msgSend_addObject_(v2, v20, (uint64_t)v17, v21);
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), v2);
  id v22 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 24);
    *(_DWORD *)long long buf = 136315394;
    __int16 v29 = "-[SEMIndexSiteMonitor _registerObserver:exists:]_block_invoke";
    __int16 v30 = 2112;
    uint64_t v31 = v23;
    _os_log_impl(&dword_25C7CA000, v22, OS_LOG_TYPE_INFO, "%s Observers re-registered: %@", buf, 0x16u);
  }
}

void sub_25C7FB180()
{
  sub_25C7F012C();
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = [SEMIndexSiteCache alloc];
  Only = objc_msgSend_initWithManagerDirectory_readOnly_(v0, v1, (uint64_t)v11, 1);
  uint64_t v6 = objc_msgSend_defaultSettings(SEMSettings, v3, v4, v5);
  id v7 = objc_alloc((Class)objc_opt_class());
  uint64_t v9 = objc_msgSend_initWithIndexSiteCache_settings_(v7, v8, (uint64_t)Only, (uint64_t)v6);
  uint64_t v10 = (void *)qword_26B354A38;
  qword_26B354A38 = v9;
}

void sub_25C7FB2E8(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  uint64_t v5 = objc_msgSend_cachedObjectForKey_initBlock_(v15, v4, (uint64_t)v3, 0);

  if (objc_opt_isKindOfClass()) {
    objc_msgSend_deactivate(v5, v6, v7, v8);
  }
  uint64_t v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = NSStringFromClass(v9);
  uint64_t v12 = objc_msgSend_cachedObjectForKey_initBlock_(v15, v11, (uint64_t)v10, 0);

  if (objc_opt_isKindOfClass()) {
    objc_msgSend_deactivateWithError_(v12, v13, 0, v14);
  }
}

id sub_25C7FB6B8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_skitDirectoryURL(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v6, v7, v8);
  uint64_t v13 = objc_msgSend_path(v5, v10, v11, v12);
  int v16 = objc_msgSend_fileExistsAtPath_(v9, v14, (uint64_t)v13, v15);

  if (v16)
  {
    char v17 = [SEMSkitReader alloc];
    uint64_t v21 = objc_msgSend_description(*(void **)(a1 + 32), v18, v19, v20);
    uint64_t v23 = objc_msgSend_initWithSkitDirectoryURL_description_(v17, v22, (uint64_t)v5, (uint64_t)v21);
  }
  else
  {
    long long v24 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      long long v26 = v24;
      __int16 v30 = objc_msgSend_path(v5, v27, v28, v29);
      int v32 = 136315650;
      uint64_t v33 = "-[SEMIndexSiteReadAccess skitReadAccessWithIndexSiteType:]_block_invoke";
      __int16 v34 = 2112;
      uint64_t v35 = v25;
      __int16 v36 = 2112;
      id v37 = v30;
      _os_log_impl(&dword_25C7CA000, v26, OS_LOG_TYPE_INFO, "%s (%@) SKIT directory has not been created at path: %@", (uint8_t *)&v32, 0x20u);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

id sub_25C7FBAC4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_ftsDirectoryURL(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_path(v5, v6, v7, v8);

  uint64_t v13 = objc_msgSend_defaultManager(MEMORY[0x263F08850], v10, v11, v12);
  int v16 = objc_msgSend_fileExistsAtPath_(v13, v14, (uint64_t)v9, v15);

  if (v16)
  {
    uint64_t v20 = objc_msgSend_ftsDatabaseURL(*(void **)(a1 + 32), v17, v18, v19);
    uint64_t v23 = objc_msgSend_readerForDatabaseAtURL_(SEMDatabaseReader, v21, (uint64_t)v20, v22);
  }
  else
  {
    long long v24 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      int v27 = 136315650;
      uint64_t v28 = "-[SEMIndexSiteReadAccess ftsDatabaseReadAccessWithIndexSiteType:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v25;
      __int16 v31 = 2112;
      int v32 = v9;
      _os_log_impl(&dword_25C7CA000, v24, OS_LOG_TYPE_INFO, "%s (%@) FTS database has not been created at path: %@", (uint8_t *)&v27, 0x20u);
    }
    uint64_t v23 = 0;
  }

  return v23;
}

__CFString *sub_25C7FBC68(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1 == 1)
  {
    uint64_t v5 = @"Default";
  }
  else if (a1 == 2)
  {
    uint64_t v5 = @"UserVault";
  }
  else
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"Undefined (%u)", a4, a1);
    uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

__CFString *sub_25C7FBCF8(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1 - 1 >= 5)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"Undefined (%u)", a4, a1);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = off_2654DE760[(char)(a1 - 1)];
  }
  return v4;
}

void sub_25C7FBE7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FC140(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FC1EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FC268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FC5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FC77C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FC918(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FCFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_25C7FD0F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = objc_msgSend_personaIdentifier(v5, v7, v8, v9);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_25C7FD26C;
  v18[3] = &unk_2654DE6D0;
  id v11 = v5;
  id v19 = v11;
  id v20 = *(id *)(a1 + 32);
  id v12 = v6;
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void **)(a1 + 48);
  id v21 = v12;
  uint64_t v22 = v13;
  id v23 = v14;
  id v15 = *(id *)(a1 + 56);
  uint64_t v16 = *(void *)(a1 + 64);
  id v24 = v15;
  uint64_t v25 = v16;
  objc_msgSend_runAsPersonaIdentifier_block_(SEMPersonaUtilities, v17, (uint64_t)v10, (uint64_t)v18);
}

void sub_25C7FD224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, void *a18, void *a19)
{
  _Unwind_Resume(a1);
}

void sub_25C7FD26C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_changePublisherWithUseCase_(*(void **)(a1 + 32), a2, 0x2709E3830, a4);
  uint64_t v8 = objc_msgSend_descriptionForBookmark_(*(void **)(a1 + 40), v6, *(void *)(a1 + 48), v7);
  int isBookmarkUpToDate = objc_msgSend_isBookmarkUpToDate_(v5, v9, *(void *)(a1 + 48), v10);
  id v12 = qword_26B3549D8;
  if (isBookmarkUpToDate)
  {
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = *(void *)(a1 + 64);
      uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 40);
      int v27 = 136315906;
      uint64_t v28 = "-[SEMIndexSiteWriter _logCurrentStateWithAllSetsBlock:]_block_invoke_2";
      __int16 v29 = 2112;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      __int16 v34 = v8;
      _os_log_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_INFO, "%s (%@) [%@] Up-to-date: %@", (uint8_t *)&v27, 0x2Au);
    }
  }
  else
  {
    char v17 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(a1 + 64);
      uint64_t v22 = *(void *)(*(void *)(a1 + 56) + 40);
      uint64_t v23 = *(void *)(a1 + 32);
      int v27 = 136316674;
      uint64_t v28 = "-[SEMIndexSiteWriter _logCurrentStateWithAllSetsBlock:]_block_invoke";
      __int16 v29 = 2112;
      uint64_t v30 = v22;
      __int16 v31 = 2112;
      uint64_t v32 = v21;
      __int16 v33 = 2112;
      __int16 v34 = v8;
      __int16 v35 = 2112;
      uint64_t v36 = v23;
      __int16 v37 = 2048;
      uint64_t v38 = objc_msgSend_sharedItemCount(v5, v18, v19, v20);
      __int16 v39 = 2048;
      uint64_t v40 = objc_msgSend_localItemInstanceCount(v5, v24, v25, v26);
      _os_log_impl(&dword_25C7CA000, v17, OS_LOG_TYPE_INFO, "%s (%@) [%@] OUTDATED: %@ with current set %@ sharedItemCount: %lu localItemInstanceCount: %lu", (uint8_t *)&v27, 0x48u);
    }
  }
  objc_msgSend_removeObject_(*(void **)(a1 + 72), v13, *(void *)(a1 + 32), v14);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
}

void sub_25C7FD460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FD490(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_changePublisherWithUseCase_(*(void **)(a1 + 32), a2, 0x2709E3830, a4);
  id v6 = (id)qword_26B3549D8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 40);
    uint64_t v12 = *(void *)(a1 + 48);
    int v16 = 136316418;
    char v17 = "-[SEMIndexSiteWriter _logCurrentStateWithAllSetsBlock:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    uint64_t v21 = v12;
    __int16 v22 = 2112;
    uint64_t v23 = v10;
    __int16 v24 = 2048;
    uint64_t v25 = objc_msgSend_sharedItemCount(v5, v7, v8, v9);
    __int16 v26 = 2048;
    uint64_t v27 = objc_msgSend_localItemInstanceCount(v5, v13, v14, v15);
    _os_log_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_INFO, "%s (%@) [%@] EXCLUDED applicable set: %@ has sharedItemCount: %lu localItemInstanceCount: %lu", (uint8_t *)&v16, 0x3Eu);
  }
}

void sub_25C7FD5BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FD7DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FE5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C7FE6EC()
{
  return 0;
}

void sub_25C7FE828(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FE8C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FEC20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_25C7FED30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FEDD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FEE68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

__CFString *sub_25C7FEEE8(unsigned int a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1 - 1 >= 3)
  {
    objc_msgSend_stringWithFormat_(NSString, a2, @"Undefined (%u)", a4, a1);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v4 = off_2654DE788[(char)(a1 - 1)];
  }
  return v4;
}

void sub_25C7FEFBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FF094(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FF0F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FF1B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FF244(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FF2C4(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

uint64_t sub_25C7FF3E0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C7FF3F0(uint64_t a1)
{
}

void sub_25C7FF3F8(uint64_t a1)
{
}

void sub_25C7FF4FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  if (!v5)
  {
    uint64_t v6 = objc_msgSend_currentDictationLanguageCodes(SEMAssistantSettingsBridge, 0, a3, a4);
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v6;

    id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  }
  uint64_t v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  objc_storeStrong(v9, v5);
}

void sub_25C7FF5E0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = objc_msgSend_currentSiriLanguageCode(SEMAssistantSettingsBridge, a2, a3, a4);
  uint64_t v6 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    int v20 = 136315650;
    uint64_t v21 = "-[SEMLocalization refresh]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v5;
    __int16 v24 = 2112;
    uint64_t v25 = v9;
    _os_log_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_INFO, "%s Siri language is %@, previously %@", (uint8_t *)&v20, 0x20u);
  }
  if ((objc_msgSend_isEqual_(v5, v7, *(void *)(*(void *)(a1 + 32) + 8), v8) & 1) == 0)
  {
    uint64_t v13 = a1 + 32;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), v5);
    *(_DWORD *)(*(void *)v13 + 32) = 0;
    *(unsigned char *)(*(void *)v13 + 36) = 0;
    uint64_t v14 = *(void **)(*(void *)(a1 + 32) + 24);
    *(void *)(*(void *)v13 + 24) = 0;
  }
  uint64_t v15 = objc_msgSend_currentDictationLanguageCodes(SEMAssistantSettingsBridge, v10, v11, v12);
  int v16 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 16);
    int v20 = 136315650;
    uint64_t v21 = "-[SEMLocalization refresh]_block_invoke";
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v19;
    _os_log_impl(&dword_25C7CA000, v16, OS_LOG_TYPE_INFO, "%s Dictation languages are %@, previously %@", (uint8_t *)&v20, 0x20u);
  }
  if ((objc_msgSend_isEqual_(v15, v17, *(void *)(*(void *)(a1 + 32) + 16), v18) & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), v15);
  }
}

void sub_25C7FF7B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FF86C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FF8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_25C7FF900(uint64_t a1, const char *a2)
{
  if ((unint64_t)(a1 - 1) > 0x2B)
  {
    uint64_t v6 = 0;
  }
  else
  {
    id v2 = (void *)MEMORY[0x263EFF960];
    id v3 = objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)off_2654DE840[a1], 4);
    uint64_t v6 = objc_msgSend_localeWithLocaleIdentifier_(v2, v4, (uint64_t)v3, v5);
  }
  return v6;
}

void sub_25C7FF98C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FFA94(_Unwind_Exception *exception_object)
{
}

void sub_25C7FFB74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C7FFB90(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_localeIdentifier(a1, a2, a3, a4);
  uint64_t v5 = sub_25C800A14(v4);

  return v5;
}

void sub_25C7FFBC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C7FFCFC(void *a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 36))
  {
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(v2 + 24));
LABEL_3:
    id v3 = objc_opt_class();
    *(void *)(*(void *)(a1[6] + 8) + 24) = objc_msgSend_supportedLocaleFromLanguageCode_(v3, v4, *(void *)(a1[4] + 8), v5);
    return;
  }
  uint64_t v6 = objc_opt_class();
  uint64_t v10 = objc_msgSend_supportedNSLocaleFromLanguageCode_(v6, v7, *(void *)(a1[4] + 8), v8);
  if (v10)
  {
    uint64_t v11 = (void *)a1[4];
    uint64_t v12 = *(void *)(a1[5] + 8);
    id obj = *(id *)(v12 + 40);
    char MorphunAssetForLocale_outAssetPath_error = objc_msgSend__locateMorphunAssetForLocale_outAssetPath_error_(v11, v9, (uint64_t)v10, (uint64_t)&obj, a1[7]);
    objc_storeStrong((id *)(v12 + 40), obj);
    if (MorphunAssetForLocale_outAssetPath_error)
    {
      *(unsigned char *)(a1[4] + 36) = 1;
      objc_storeStrong((id *)(a1[4] + 24), *(id *)(*(void *)(a1[5] + 8) + 40));

      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(a1[4] + 8);
      *(_DWORD *)long long buf = 136315394;
      uint64_t v30 = "-[SEMLocalization locateMorphunAssetForSiriLanguage:error:]_block_invoke";
      __int16 v31 = 2112;
      uint64_t v32 = v17;
      _os_log_impl(&dword_25C7CA000, v14, OS_LOG_TYPE_INFO, "%s Unsupported Siri Language: %@", buf, 0x16u);
    }
    uint64_t v18 = (void *)a1[7];
    uint64_t v19 = (void *)MEMORY[0x263F087E8];
    uint64_t v27 = *MEMORY[0x263F08320];
    int v20 = objc_msgSend_stringWithFormat_(NSString, v15, @"Unsupported Siri Language: \"%@\"", v16, *(void *)(a1[4] + 8));
    uint64_t v28 = v20;
    __int16 v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v21, (uint64_t)&v28, (uint64_t)&v27, 1);
    __int16 v24 = objc_msgSend_errorWithDomain_code_userInfo_(v19, v23, @"com.apple.siri.entitymatcher.tokenization", 1, v22);
    uint64_t v25 = v24;
    if (v18)
    {
      if (v24) {
        *uint64_t v18 = v24;
      }
    }
  }
}

void sub_25C7FFF38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C800670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C800744(uint64_t a1, int a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (id)qword_26B3549D8;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = objc_msgSend_localeIdentifier(*(void **)(a1 + 32), v7, v8, v9);
    int v23 = 136315906;
    __int16 v24 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v10;
    __int16 v27 = 1024;
    int v28 = a2;
    __int16 v29 = 2112;
    id v30 = v5;
    _os_log_impl(&dword_25C7CA000, v6, OS_LOG_TYPE_INFO, "%s MorphunAssets download completion invoked for locale: %@ result: %d error: %@", (uint8_t *)&v23, 0x26u);
  }
  if (v5)
  {
    sub_25C81F288(0, v5);
  }
  else
  {
    uint64_t v11 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = objc_msgSend_localeIdentifier(*(void **)(a1 + 32), v12, v13, v14);
      int v23 = 136315394;
      __int16 v24 = "-[SEMLocalization _locateMorphunAssetForLocale:outAssetPath:error:]_block_invoke";
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      _os_log_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_INFO, "%s MorphunAssets finished downloading asynchronously for locale: %@. Rebuilding indexing", (uint8_t *)&v23, 0x16u);
    }
    uint64_t v19 = objc_msgSend_sharedInstance(SEMDispatcher, v16, v17, v18);
    objc_msgSend_handleSettingsChange(v19, v20, v21, v22);
  }
}

void sub_25C8008F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_25C800988(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if ((unint64_t)(a1 - 1) >= 0x2C) {
    unsigned __int8 v4 = 0;
  }
  else {
    unsigned __int8 v4 = a1;
  }
  id v5 = objc_msgSend_numberWithUnsignedChar_(NSNumber, a2, v4, a4);
  return v5;
}

uint64_t sub_25C8009D0(uint64_t a1, const char *a2)
{
  if ((unint64_t)(a1 - 1) >= 0x2C) {
    unsigned __int8 v2 = 0;
  }
  else {
    unsigned __int8 v2 = a1;
  }
  if (v2 <= 0x2Cu) {
    return objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)off_2654DE840[v2], 4);
  }
  else {
    return objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)"", 4);
  }
}

uint64_t sub_25C800A14(void *a1)
{
  id v3 = a1;
  if (qword_26B354A50 != -1) {
    dispatch_once(&qword_26B354A50, &unk_2709E0258);
  }
  unsigned __int8 v4 = objc_msgSend_objectForKey_((void *)qword_26B354A48, v1, (uint64_t)v3, v2);
  unsigned int v8 = objc_msgSend_unsignedShortValue(v4, v5, v6, v7);
  if ((unint64_t)v8 - 1 >= 0x2C) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v8;
  }

  return v9;
}

void sub_25C800AA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C800ABC()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v1 = (void *)qword_26B354A48;
  qword_26B354A48 = (uint64_t)v0;

  for (uint64_t i = 0; i != 45; ++i)
  {
    if ((unint64_t)(i - 1) <= 0x2B)
    {
      uint64_t v7 = objc_msgSend_stringWithCString_encoding_(NSString, v2, (uint64_t)off_2654DE840[i], 4);
      if (v7)
      {
        unsigned int v8 = (void *)qword_26B354A48;
        uint64_t v9 = sub_25C800988(i, v4, v5, v6);
        objc_msgSend_setObject_forKey_(v8, v10, (uint64_t)v9, (uint64_t)v7);
      }
    }
  }
}

void sub_25C800B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_25C800B98(uint64_t a1, const char *a2)
{
  id v3 = NSString;
  if ((unint64_t)(a1 - 1) >= 0x2C) {
    unsigned __int8 v4 = 0;
  }
  else {
    unsigned __int8 v4 = a1;
  }
  if (v4 <= 0x2Cu) {
    objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)off_2654DE840[v4], 4);
  }
  else {
  uint64_t v5 = objc_msgSend_stringWithCString_encoding_(NSString, a2, (uint64_t)"", 4);
  }
  unsigned int v8 = objc_msgSend_numberWithInteger_(NSNumber, v6, a1, v7);
  uint64_t v11 = objc_msgSend_stringWithFormat_(v3, v9, @"%@ (%@)", v10, v5, v8);

  return v11;
}

void sub_25C800C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C800C84()
{
  qword_26B3549D8 = (uint64_t)os_log_create("com.apple.siri.inference", "EntityMatcher");
  return MEMORY[0x270F9A758]();
}

void sub_25C801014(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf, id a16, void *a17)
{
  if ((_BYTE)a17) {
  if (a2 == 1)
  }
  {
    __int16 v24 = __cxa_begin_catch(a1);
    __int16 v25 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = NSString;
      uint64_t v27 = (*(uint64_t (**)(void *))(*(void *)v24 + 16))(v24);
      __int16 v29 = objc_msgSend_stringWithCString_encoding_(v26, v28, v27, 4);
      LODWORD(buf) = 136315650;
      *(void *)((char *)&buf + 4) = "+[SEMOntologyMapper ontologyGraphFromSpanMatch:]";
      WORD6(buf) = 2112;
      *(void *)((char *)&buf + 14) = v17;
      HIWORD(a16) = 2112;
      a17 = v29;
      _os_log_error_impl(&dword_25C7CA000, v25, OS_LOG_TYPE_ERROR, "%s Caught exception while building USOGraph from span match: %@ \nCaught %@", (uint8_t *)&buf, 0x20u);
    }
    __cxa_end_catch();
    JUMPOUT(0x25C800EF8);
  }

  _Unwind_Resume(a1);
}

void sub_25C8015E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_25C802440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C8024B8()
{
  id v0 = objc_alloc(MEMORY[0x263EFF9C0]);
  uint64_t v3 = objc_msgSend_initWithCapacity_(v0, v1, 20, v2);
  unsigned __int8 v4 = (void *)qword_26B354A58;
  qword_26B354A58 = v3;

  objc_msgSend_addObject_((void *)qword_26B354A58, v5, *MEMORY[0x263F73890], v6);
  objc_msgSend_addObject_((void *)qword_26B354A58, v7, *MEMORY[0x263F73858], v8);
  objc_msgSend_addObject_((void *)qword_26B354A58, v9, *MEMORY[0x263F73818], v10);
  objc_msgSend_addObject_((void *)qword_26B354A58, v11, *MEMORY[0x263F73820], v12);
  objc_msgSend_addObject_((void *)qword_26B354A58, v13, *MEMORY[0x263F73848], v14);
  objc_msgSend_addObject_((void *)qword_26B354A58, v15, *MEMORY[0x263F73810], v16);
  objc_msgSend_addObject_((void *)qword_26B354A58, v17, *MEMORY[0x263F73800], v18);
  objc_msgSend_addObject_((void *)qword_26B354A58, v19, *MEMORY[0x263F73808], v20);
  objc_msgSend_addObject_((void *)qword_26B354A58, v21, 0x2709E2110, v22);
  objc_msgSend_addObject_((void *)qword_26B354A58, v23, 0x2709E2130, v24);
  objc_msgSend_addObject_((void *)qword_26B354A58, v25, *MEMORY[0x263F73880], v26);
  objc_msgSend_addObject_((void *)qword_26B354A58, v27, *MEMORY[0x263F73868], v28);
  objc_msgSend_addObject_((void *)qword_26B354A58, v29, *MEMORY[0x263F73888], v30);
  objc_msgSend_addObject_((void *)qword_26B354A58, v31, *MEMORY[0x263F73878], v32);
  objc_msgSend_addObject_((void *)qword_26B354A58, v33, *MEMORY[0x263F73870], v34);
  objc_msgSend_addObject_((void *)qword_26B354A58, v35, 0x2709E1B50, v36);
  objc_msgSend_addObject_((void *)qword_26B354A58, v37, 0x2709E1B70, v38);
  objc_msgSend_addObject_((void *)qword_26B354A58, v39, 0x2709E1B90, v40);
  objc_msgSend_addObject_((void *)qword_26B354A58, v41, 0x2709E1BB0, v42);
  unint64_t v45 = (void *)qword_26B354A58;
  return objc_msgSend_addObject_(v45, v43, 0x2709E1BD0, v44);
}

void sub_25C802B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_25C802DA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25C8030B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C803228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v12 = v11;

  _Unwind_Resume(a1);
}

void sub_25C8035A0(_Unwind_Exception *a1)
{
  uint64_t v9 = v7;

  _Unwind_Resume(a1);
}

void sub_25C803788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_25C803948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v15 = v13;

  _Unwind_Resume(a1);
}

void sub_25C803B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_25C803B70(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a2;
  switch(objc_msgSend_fieldType(v3, v4, v5, v6))
  {
    case 0xBFADu:
      id v7 = (id)*MEMORY[0x263F73888];
      uint64_t v11 = objc_msgSend_stringValue(v3, v8, v9, v10);
      goto LABEL_10;
    case 0xBFAEu:
      id v7 = (id)*MEMORY[0x263F73870];
      uint64_t v11 = objc_msgSend_stringValue(v3, v14, v15, v16);
      goto LABEL_10;
    case 0xBFAFu:
      id v7 = (id)*MEMORY[0x263F73880];
      uint64_t v11 = objc_msgSend_stringValue(v3, v17, v18, v19);
      goto LABEL_10;
    case 0xBFB0u:
      id v7 = (id)*MEMORY[0x263F73878];
      uint64_t v11 = objc_msgSend_stringValue(v3, v20, v21, v22);
      goto LABEL_10;
    case 0xBFB1u:
      id v7 = (id)*MEMORY[0x263F73868];
      uint64_t v26 = objc_msgSend_rawEnumValue(v3, v23, v24, v25);
      uint64_t v11 = objc_msgSend__radioStationSignalTypeAsString_(SEMOntologyMapper, v27, v26, v28);
LABEL_10:
      uint64_t v13 = (void *)v11;
      if (v7) {
        BOOL v29 = v11 == 0;
      }
      else {
        BOOL v29 = 1;
      }
      if (!v29)
      {
        uint64_t v30 = *(void **)(a1 + 40);
        id v31 = objc_alloc(MEMORY[0x263F73A08]);
        uint64_t v33 = objc_msgSend_initWithKey_valueString_(v31, v32, (uint64_t)v7, (uint64_t)v13);
        objc_msgSend_addObject_(v30, v34, (uint64_t)v33, v35);
      }
      break;
    default:
      uint64_t v12 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = *(void *)(a1 + 32);
        int v37 = 136315394;
        uint64_t v38 = "+[SEMOntologyMapper _appendSpanProperties:forRadioStationMatch:entityInfo:]_block_invoke";
        __int16 v39 = 2112;
        uint64_t v40 = v36;
        _os_log_error_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_ERROR, "%s Unknown fieldType on radio station: %@ Could not associate fieldValue with identifier constant", (uint8_t *)&v37, 0x16u);
      }
      uint64_t v13 = 0;
      id v7 = 0;
      break;
  }
}

void sub_25C803DB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C804014(_Unwind_Exception *a1)
{
  uint64_t v8 = v6;

  _Unwind_Resume(a1);
}

void sub_25C804148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_25C8042E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v14 = v13;

  _Unwind_Resume(a1);
}

void sub_25C804668(_Unwind_Exception *a1)
{
  uint64_t v8 = v6;

  _Unwind_Resume(a1);
}

void sub_25C804710()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3B0] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C200], MEMORY[0x263F8C088]);
}

void sub_25C80475C(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709E02C8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25C80477C(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709E02C8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x261194470);
}

void sub_25C8047D0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
}
  }

id sub_25C8047E8(void *a1)
{
  id v1 = a1;
  uint64_t v5 = v1;
  if (v1)
  {
    int isPartialMatch = objc_msgSend_isPartialMatch(v1, v2, v3, v4);
    int isApproximateMatch = objc_msgSend_isApproximateMatch(v5, v7, v8, v9);
    int isAliasMatch = objc_msgSend_isAliasMatch(v5, v11, v12, v13);
    if (isPartialMatch) {
      unsigned int v15 = 2;
    }
    else {
      unsigned int v15 = 0;
    }
    if (isApproximateMatch) {
      v15 |= 4u;
    }
    if (isAliasMatch) {
      v15 |= 8u;
    }
    if (v15 <= 1) {
      unsigned int v15 = 1;
    }
    unsigned int v58 = v15;
    id v16 = objc_alloc(MEMORY[0x263F739F8]);
    objc_msgSend_matchScore(v5, v17, v18, v19);
    int v21 = v20;
    uint64_t v25 = objc_msgSend_maxTokenCount(v5, v22, v23, v24);
    uint64_t v29 = objc_msgSend_matchedTokenCount(v5, v26, v27, v28);
    uint64_t v33 = objc_msgSend_maxStopWordCount(v5, v30, v31, v32);
    uint64_t v37 = objc_msgSend_matchedStopWordCount(v5, v34, v35, v36);
    uint64_t v41 = objc_msgSend_editDistance(v5, v38, v39, v40);
    unsigned int v45 = objc_msgSend_maxAliasCount(v5, v42, v43, v44);
    unsigned int v49 = objc_msgSend_matchedAliasCount(v5, v46, v47, v48);
    uint64_t v53 = objc_msgSend_getAliasTypesArray(v5, v50, v51, v52);
    LODWORD(v54) = v21;
    matched = objc_msgSend_initWithMatchSignalBitSet_matchScore_maxTokenCount_matchedTokenCount_maxStopWordCount_matchedStopWordCount_editDistance_maxAliasCount_matchedAliasCount_matchedAliasTypes_(v16, v55, v58, v25, v29, v33, v37, v41, v54, __PAIR64__(v49, v45), v53);
  }
  else
  {
    matched = 0;
  }

  return matched;
}

void sub_25C804964(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C804EA0(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    uint64_t v4 = objc_loadWeakRetained(v2);
    uint64_t v8 = v4;
    if (!*((unsigned char *)v4 + 48))
    {
      char v10 = (*(uint64_t (**)(void))(v4[7] + 16))();
      id v11 = 0;
      uint64_t v12 = v11;
      if ((v10 & 1) == 0)
      {
        uint64_t v13 = qword_26B3549D8;
        if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
        {
          uint64_t v14 = v8[1];
          *(_DWORD *)long long buf = 136315394;
          id v16 = "-[SEMProvisionalResourceManager activateAsyncWithCompletion:]_block_invoke";
          __int16 v17 = 2112;
          uint64_t v18 = v14;
          _os_log_error_impl(&dword_25C7CA000, v13, OS_LOG_TYPE_ERROR, "%s Failed to activate resource: %@", buf, 0x16u);
        }
        (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

        goto LABEL_10;
      }
      *((unsigned char *)v8 + 48) = 1;
    }
    objc_msgSend__setExpirationTimer(v8, v5, v6, v7);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_10:

    return;
  }
  uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  v9();
}

void sub_25C8051F0(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    uint64_t v3 = 3;
LABEL_5:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
    ++*(void *)(*(void *)(a1 + 32) + 72);
    return;
  }
  if ((*(uint64_t (**)(void))(*(void *)(v2 + 56) + 16))())
  {
    uint64_t v3 = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
    goto LABEL_5;
  }
  uint64_t v4 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    int v6 = 136315394;
    uint64_t v7 = "-[SEMProvisionalResourceManager activateWithError:operationBlock:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_error_impl(&dword_25C7CA000, v4, OS_LOG_TYPE_ERROR, "%s Failed to activate resource: %@", (uint8_t *)&v6, 0x16u);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 5;
}

uint64_t sub_25C805318(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_25C805328(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend__setExpirationTimer(*(void **)(a1 + 32), a2, a3, a4);
}

void sub_25C8053F0(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    uint64_t v3 = *(void *)(v2 + 72);
    if (v3)
    {
      uint64_t v4 = (void *)qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(v2 + 8);
        uint64_t v9 = NSNumber;
        uint64_t v10 = v4;
        uint64_t v13 = objc_msgSend_numberWithInteger_(v9, v11, v3, v12);
        int v15 = 136315650;
        id v16 = "-[SEMProvisionalResourceManager deactivateWithError:]_block_invoke";
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        __int16 v19 = 2112;
        int v20 = v13;
        _os_log_debug_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_DEBUG, "%s Skipping deactivation of resource: %@ with %@ operation(s) in-progress.", (uint8_t *)&v15, 0x20u);
      }
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v6 = 7;
    }
    else
    {
      if ((*(uint64_t (**)(void))(*(void *)(v2 + 64) + 16))())
      {
        *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
        *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
        return;
      }
      uint64_t v7 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
        int v15 = 136315394;
        id v16 = "-[SEMProvisionalResourceManager deactivateWithError:]_block_invoke";
        __int16 v17 = 2112;
        uint64_t v18 = v14;
        _os_log_error_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_ERROR, "%s Failed to deactivate resource: %@", (uint8_t *)&v15, 0x16u);
      }
      uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v6 = 6;
    }
  }
  else
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = 4;
  }
  *(void *)(v5 + 24) = v6;
}

void sub_25C805694(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_expirationDate(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_now(MEMORY[0x263EFF910], v6, v7, v8);
  uint64_t v12 = objc_msgSend_compare_(v5, v10, (uint64_t)v9, v11);

  if (v12 == -1)
  {
    int v15 = *(void **)(a1 + 32);
    id v39 = 0;
    uint64_t v16 = objc_msgSend_deactivateWithError_(v15, v13, (uint64_t)&v39, v14);
    id v17 = v39;
    if (v16 == 6)
    {
      uint64_t v31 = (void *)qword_26B3549D8;
      if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
      {
LABEL_7:

        return;
      }
      uint64_t v32 = *(void *)(a1 + 32);
      uint64_t v33 = *(void *)(v32 + 8);
      uint64_t v34 = NSNumber;
      double v35 = *(double *)(v32 + 40);
      uint64_t v23 = v31;
      uint64_t v27 = objc_msgSend_numberWithDouble_(v34, v36, v37, v38, v35);
      *(_DWORD *)long long buf = 136315906;
      uint64_t v41 = "-[SEMProvisionalResourceManager _setExpirationTimer]_block_invoke";
      __int16 v42 = 2112;
      uint64_t v43 = v33;
      __int16 v44 = 2112;
      unsigned int v45 = v27;
      __int16 v46 = 2112;
      id v47 = v17;
      uint64_t v28 = "%s Tried to expire resource %@ after %@ seconds of inactivity, but failed due to error: %@";
      uint64_t v29 = v23;
      uint32_t v30 = 42;
    }
    else
    {
      if (v16 != 2) {
        goto LABEL_7;
      }
      uint64_t v18 = (void *)qword_26B3549D8;
      if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_7;
      }
      uint64_t v19 = *(void *)(a1 + 32);
      uint64_t v20 = *(void *)(v19 + 8);
      uint64_t v21 = NSNumber;
      double v22 = *(double *)(v19 + 40);
      uint64_t v23 = v18;
      uint64_t v27 = objc_msgSend_numberWithDouble_(v21, v24, v25, v26, v22);
      *(_DWORD *)long long buf = 136315650;
      uint64_t v41 = "-[SEMProvisionalResourceManager _setExpirationTimer]_block_invoke";
      __int16 v42 = 2112;
      uint64_t v43 = v20;
      __int16 v44 = 2112;
      unsigned int v45 = v27;
      uint64_t v28 = "%s Expired resource %@ after %@ seconds of inactivity.";
      uint64_t v29 = v23;
      uint32_t v30 = 32;
    }
    _os_log_debug_impl(&dword_25C7CA000, v29, OS_LOG_TYPE_DEBUG, v28, buf, v30);

    goto LABEL_7;
  }
}

uint64_t sub_25C805960(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 48);
  return result;
}

void sub_25C806450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C806B5C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  objc_msgSend_reset(*(void **)(*(void *)(a1 + 32) + 40), a2, a3, a4);
  uint64_t result = objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 72), v5, v6, v7);
  uint64_t v9 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v9 + 56))
  {
    uint64_t v10 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = *(void *)(v9 + 16);
      int v18 = 136315394;
      uint64_t v19 = "-[SEMSandbox dealloc]_block_invoke";
      __int16 v20 = 2112;
      uint64_t v21 = v14;
      _os_log_impl(&dword_25C7CA000, v10, OS_LOG_TYPE_INFO, "%s Destroying %@", (uint8_t *)&v18, 0x16u);
      uint64_t v9 = *(void *)(a1 + 32);
    }
    objc_msgSend_clearAllState(*(void **)(v9 + 104), v11, v12, v13);
    return objc_msgSend_remove(*(void **)(*(void *)(a1 + 32) + 48), v15, v16, v17);
  }
  return result;
}

unsigned char *sub_25C806CCC(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 16);
    int v17 = 136315394;
    int v18 = "-[SEMSandbox reset]_block_invoke";
    __int16 v19 = 2112;
    uint64_t v20 = v6;
    _os_log_impl(&dword_25C7CA000, v2, OS_LOG_TYPE_INFO, "%s Resetting %@", (uint8_t *)&v17, 0x16u);
  }
  objc_msgSend_reset(*(void **)(*(void *)(a1 + 32) + 40), v3, v4, v5);
  objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 72), v7, v8, v9);
  objc_msgSend_clearAllState(*(void **)(*(void *)(a1 + 32) + 104), v10, v11, v12);
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[56]) {
    return (unsigned char *)objc_msgSend__saveSettings(result, v13, v14, v15);
  }
  return result;
}

void sub_25C806E40(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 56))
  {
    uint64_t v3 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(v1 + 16);
      int v56 = 136315394;
      __int16 v57 = "-[SEMSandbox save]_block_invoke";
      __int16 v58 = 2112;
      uint64_t v59 = v7;
      _os_log_impl(&dword_25C7CA000, v3, OS_LOG_TYPE_INFO, "%s Saving %@", (uint8_t *)&v56, 0x16u);
      uint64_t v1 = *(void *)(a1 + 32);
    }
    objc_msgSend__saveSettings((void *)v1, v4, v5, v6);
    uint64_t v14 = objc_msgSend_save(*(void **)(*(void *)(a1 + 32) + 48), v8, v9, v10);
    if (v14)
    {
      objc_msgSend_reset(*(void **)(*(void *)(a1 + 32) + 40), v11, v12, v13);
      objc_msgSend_clearAllState(*(void **)(*(void *)(a1 + 32) + 104), v15, v16, v17);
      objc_msgSend_removeAllObjects(*(void **)(*(void *)(a1 + 32) + 72), v18, v19, v20);
      objc_msgSend_remove(*(void **)(*(void *)(a1 + 32) + 48), v21, v22, v23);
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v14);
      uint64_t v24 = [SEMSandboxIndexSiteCache alloc];
      uint64_t v28 = objc_msgSend_rootDirectory(*(void **)(*(void *)(a1 + 32) + 48), v25, v26, v27);
      uint64_t Only = objc_msgSend_initWithManagerDirectory_sharedOverrideCache_readOnly_(v24, v29, (uint64_t)v28, *(void *)(*(void *)(a1 + 32) + 72), 0);
      uint64_t v31 = *(void *)(a1 + 32);
      uint64_t v32 = *(void **)(v31 + 96);
      *(void *)(v31 + 96) = Only;

      uint64_t v33 = [SEMSandboxIndexSiteCache alloc];
      uint64_t v37 = objc_msgSend_rootDirectory(*(void **)(*(void *)(a1 + 32) + 48), v34, v35, v36);
      uint64_t v39 = objc_msgSend_initWithManagerDirectory_sharedOverrideCache_readOnly_(v33, v38, (uint64_t)v37, *(void *)(*(void *)(a1 + 32) + 72), 1);
      uint64_t v40 = *(void *)(a1 + 32);
      uint64_t v41 = *(void **)(v40 + 88);
      *(void *)(v40 + 88) = v39;

      __int16 v42 = [SEMIndexSiteManager alloc];
      __int16 v46 = objc_msgSend_rootDirectory(*(void **)(*(void *)(a1 + 32) + 48), v43, v44, v45);
      uint64_t v48 = objc_msgSend_initWithManagerDirectory_indexSiteCache_setEnumerator_settings_(v42, v47, (uint64_t)v46, *(void *)(*(void *)(a1 + 32) + 96), *(void *)(*(void *)(a1 + 32) + 64), *(void *)(*(void *)(a1 + 32) + 32));
      uint64_t v49 = *(void *)(a1 + 32);
      uint64_t v50 = *(void **)(v49 + 104);
      *(void *)(v49 + 104) = v48;

      uint64_t v51 = [SEMIndexSiteReadAccess alloc];
      uint64_t v53 = objc_msgSend_initWithIndexSiteCache_settings_(v51, v52, *(void *)(*(void *)(a1 + 32) + 88), *(void *)(*(void *)(a1 + 32) + 32));
      uint64_t v54 = *(void *)(a1 + 32);
      __int16 v55 = *(void **)(v54 + 40);
      *(void *)(v54 + 40) = v53;

      *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
    }
  }
}

uint64_t sub_25C80757C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C80758C(uint64_t a1)
{
}

uint64_t sub_25C807594(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend_rootDirectory(*(void **)(*(void *)(a1 + 32) + 48), a2, a3, a4);
  return MEMORY[0x270F9A758]();
}

Class sub_25C807890(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!qword_26B354A70)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = sub_25C8079E4;
    void v4[4] = &unk_2654DE1F8;
    v4[5] = v4;
    long long v5 = xmmword_2654DED48;
    uint64_t v6 = 0;
    qword_26B354A70 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_26B354A70)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CESRRawSpeechProfileConverter");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_26B354A68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_25C8079E4()
{
  uint64_t result = _sl_dlopen();
  qword_26B354A70 = result;
  return result;
}

uint64_t sub_25C807FE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_indexSiteUnavailableSoonWithType_, 2, a4);
}

uint64_t sub_25C8081B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_indexSiteUnavailableWithType_, 2, a4);
}

void sub_25C8085D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C808624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8086D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8088E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C808968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25C808BD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C808CD8(uint64_t a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x263EF8340];
  long long v5 = a3;
  if (v5[2]())
  {
    uint64_t v8 = objc_msgSend_stringWithFormat_(NSString, v6, @"Function '%s' got nonzero result from SKIT.", v7, a1);
    uint64_t v9 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = *MEMORY[0x263F08320];
    v17[0] = v8;
    uint64_t v11 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v10, (uint64_t)v17, (uint64_t)&v16, 1);
    uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(v9, v12, @"com.apple.siri.inference.semskitbridge", -1, v11);
    sub_25C81F288(a2, v13);

    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 1;
  }

  return v14;
}

void sub_25C808E00(_Unwind_Exception *a1)
{
  long long v5 = v4;

  _Unwind_Resume(a1);
}

void sub_25C809A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v41 - 121) < 0) {
    operator delete(*(void **)(v41 - 144));
  }
  if (*(char *)(v41 - 97) < 0) {
    operator delete(*(void **)(v41 - 120));
  }

  _Unwind_Resume(a1);
}

void sub_25C809BD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80A298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_25C80A5F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80A874(_Unwind_Exception *a1)
{
  if (v2) {
    sub_25C7D2280(v2);
  }

  _Unwind_Resume(a1);
}

void sub_25C80A93C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80A9DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80AB1C(_Unwind_Exception *a1)
{
  skit::ContextV2::~ContextV2(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_25C80AB30()
{
  return 1;
}

uint64_t *sub_25C80AB38(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  if (v2 != *result)
  {
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = v4 + v5;
      uint64_t v7 = v2 + v5;
      *(_WORD *)(v6 - 32) = *(_WORD *)(v2 + v5 - 32);
      *(void *)(v6 - 16) = 0;
      *(void *)(v6 - 8) = 0;
      *(void *)(v6 - 24) = 0;
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(void *)(v6 - 8) = *(void *)(v2 + v5 - 8);
      *(void *)(v7 - 24) = 0;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      v5 -= 32;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  uint64_t v8 = *result;
  *uint64_t result = v4;
  a2[1] = v8;
  uint64_t v9 = result[1];
  result[1] = a2[2];
  a2[2] = v9;
  uint64_t v10 = result[2];
  result[2] = a2[3];
  a2[3] = v10;
  *a2 = a2[1];
  return result;
}

uint64_t sub_25C80ABCC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != v3)
  {
    *(void *)(a1 + 16) = v2 - 32;
    uint64_t v4 = *(void **)(v2 - 24);
    if (v4)
    {
      *(void *)(v2 - 16) = v4;
      operator delete(v4);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_25C80AC30(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    uint64_t v4 = *(void **)(i - 24);
    if (v4)
    {
      *(void *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void sub_25C80ADA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80AF08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  std::__shared_weak_count::~__shared_weak_count(v28);
  operator delete(v30);
  _Unwind_Resume(a1);
}

void sub_25C80B328(_Unwind_Exception *a1)
{
  uint64_t v7 = v5;

  _Unwind_Resume(a1);
}

void sub_25C80B3D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80B42C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  uint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)SEMSkitReader;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

uint64_t sub_25C80B50C(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_25C80B5BC;
  v5[3] = &unk_2654DED70;
  id v6 = *(id *)(a1 + 32);
  uint64_t v3 = sub_25C808CD8((uint64_t)"-[SEMSkitReader _activationBlock]_block_invoke", a2, v5);

  return v3;
}

void sub_25C80B5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C80B5BC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend_boostrap(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    objc_msgSend_searcher(v8, v5, v6, v7);
    uint64_t v9 = v12;
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v13 = 0;
  }
  uint64_t v10 = skit::IndexReader::open((skit::IndexReader *)(v9 + 16));
  if (v13) {
    sub_25C7D2280(v13);
  }
  return v10;
}

void sub_25C80B628(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_25C7D2280(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_25C80B6E8(uint64_t a1, void *a2)
{
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_25C80B7AC;
  v9[3] = &unk_2654DED70;
  id v10 = *(id *)(a1 + 32);
  uint64_t v7 = sub_25C808CD8((uint64_t)"-[SEMSkitReader _deactivationBlock]_block_invoke", a2, v9);
  if (v7) {
    objc_msgSend_teardown(*(void **)(a1 + 32), v4, v5, v6);
  }

  return v7;
}

void sub_25C80B794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C80B7AC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend_searcher(v4, a2, a3, a4);
    uint64_t v5 = v8;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v9 = 0;
  }
  uint64_t v6 = skit::IndexReader::close((skit::IndexReader *)(v5 + 16));
  if (v9) {
    sub_25C7D2280(v9);
  }
  return v6;
}

void sub_25C80B80C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_25C7D2280(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C80B91C(_Unwind_Exception *exception_object)
{
}

void sub_25C80B9E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80BAD8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ((unint64_t)(a2 - 1) >= 4)
  {
    uint64_t v5 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315650;
      uint64_t v7 = "-[SEMSkitReader prewarm]_block_invoke";
      __int16 v8 = 1024;
      int v9 = a2;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_error_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_ERROR, "%s Prewarm failed (%i): %@", (uint8_t *)&v6, 0x1Cu);
    }
  }
}

void sub_25C80BD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  if (v23) {
    sub_25C7D2280(v23);
  }
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_25C80BDE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C80BDF4(uint64_t a1)
{
}

void sub_25C80BDFC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = (void **)a1[4];
  if (v5)
  {
    objc_msgSend_searcher(v5, a2, a3, a4);
    uint64_t v5 = v15;
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
  }
  sub_25C7DB608(v5, a1[6], v17);
  if (v16) {
    sub_25C7D2280(v16);
  }
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v7 = *(void *)(a1[5] + 8);
  __int16 v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  int v9 = (int **)v17[0];
  uint64_t v10 = v17[1];
  while (v9 != (int **)v10)
  {
    id v11 = *(void **)(*(void *)(a1[5] + 8) + 40);
    uint64_t v12 = sub_25C80E710(v9);
    objc_msgSend_addObjectsFromArray_(v11, v13, (uint64_t)v12, v14);

    v9 += 4;
  }
  uint64_t v15 = (void **)v17;
  sub_25C7DFD20(&v15);
}

void sub_25C80BED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void **a10, uint64_t a11, char a12)
{
  a10 = (void **)&a12;
  sub_25C7DFD20(&a10);
  _Unwind_Resume(a1);
}

uint64_t sub_25C80BF18(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(result + 56) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void sub_25C80BF34(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    sub_25C7D2280(v1);
  }
}

std::string *sub_25C80BFA0(std::string *this, char *a2, char *a3)
{
  id v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = a3 - a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    uint64_t v10 = this;
  }
  if (v10 > (std::string *)v4 || (char *)&v10->__r_.__value_.__l.__data_ + size + 1 <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size + v7 - v9, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    uint64_t v14 = this;
    if ((v6 & 0x80) != 0) {
      uint64_t v14 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    uint64_t v15 = (char *)v14 + size;
    do
    {
      char v16 = *v4++;
      *v15++ = v16;
    }
    while (v4 != a3);
    *uint64_t v15 = 0;
    std::string::size_type v17 = size + v7;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v17;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v17 & 0x7F;
    }
  }
  else
  {
    sub_25C80C110(__p, v4, a3, v7);
    if ((v20 & 0x80u) == 0) {
      uint64_t v12 = __p;
    }
    else {
      uint64_t v12 = (void **)__p[0];
    }
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v13 = v20;
    }
    else {
      std::string::size_type v13 = (std::string::size_type)__p[1];
    }
    std::string::append(this, (const std::string::value_type *)v12, v13);
    if ((char)v20 < 0) {
      operator delete(__p[0]);
    }
  }
  return this;
}

void sub_25C80C0F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_25C80C110(void *result, char *a2, char *a3, unint64_t a4)
{
  id v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C7D00F4();
  }
  if (a4 > 0x16)
  {
    uint64_t v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17) {
      uint64_t v8 = a4 | 7;
    }
    uint64_t v9 = v8 + 1;
    uint64_t result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    void *v4 = result;
    id v4 = result;
  }
  else
  {
    *((unsigned char *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    char v10 = *a2++;
    *(unsigned char *)id v4 = v10;
    id v4 = (void *)((char *)v4 + 1);
  }
  *(unsigned char *)id v4 = 0;
  return result;
}

void sub_25C80C1B8(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709E0370;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25C80C1D8(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709E0370;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x261194470);
}

void sub_25C80C22C(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 64);
  if (v2) {
    sub_25C7D2280(v2);
  }
  MEMORY[0x261193DD0](a1 + 40);
  skit::ContextV2::~ContextV2((skit::ContextV2 *)(a1 + 24));
}

void sub_25C80C394(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80C47C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80C59C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80CED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C80CFF0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25C80D000(uint64_t a1)
{
}

void sub_25C80D008(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = objc_msgSend_changePublisherWithUseCase_(*(void **)(a1 + 32), a2, 0x2709E3830, a4);
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_25C80D1A8;
  v24[3] = &unk_2654DEDE0;
  uint64_t v27 = *(void *)(a1 + 88);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  id v25 = v7;
  uint64_t v26 = v8;
  uint64_t v28 = *(void *)(a1 + 96);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_25C80D298;
  v16[3] = &unk_2654DEE08;
  id v9 = *(id *)(a1 + 80);
  uint64_t v10 = *(void *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 96);
  id v19 = v9;
  uint64_t v20 = v10;
  uint64_t v12 = *(void *)(a1 + 32);
  std::string::size_type v13 = *(void **)(a1 + 64);
  v16[4] = *(void *)(a1 + 56);
  void v16[5] = v12;
  uint64_t v22 = *(void *)(a1 + 120);
  uint64_t v23 = v11;
  long long v21 = *(_OWORD *)(a1 + 104);
  id v17 = v13;
  id v18 = *(id *)(a1 + 72);
  id v15 = (id)objc_msgSend_drivableSinkWithBookmark_completion_shouldContinue_(v5, v14, v6, (uint64_t)v24, v16);
}

void sub_25C80D178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_25C80D1A8(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v9 = a3;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24) && !objc_msgSend_state(v5, v6, v7, v8))
  {
    std::string::size_type v13 = (void *)a1[4];
    uint64_t v14 = a1[5];
    uint64_t v15 = *(void *)(a1[7] + 8);
    id obj = *(id *)(v15 + 40);
    char updated = objc_msgSend_updateBookmark_forSet_error_(v13, v6, (uint64_t)v9, v14, &obj);
    objc_storeStrong((id *)(v15 + 40), obj);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = updated;
  }
  else
  {
    uint64_t v10 = objc_msgSend_error(v5, v6, v7, v8);
    uint64_t v11 = *(void *)(a1[7] + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

void sub_25C80D284(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C80D298(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!(*(unsigned int (**)(void))(*(void *)(a1 + 64) + 16))())
  {
    id v7 = v3;
    uint64_t v11 = objc_msgSend_sharedItem(v7, v8, v9, v10);
    id v12 = objc_alloc(MEMORY[0x263F08C38]);
    objc_msgSend_prefixedSharedIdentifier_(*(void **)(a1 + 40), v13, (uint64_t)v11, v14);
    id v15 = objc_claimAutoreleasedReturnValue();
    uint64_t v19 = objc_msgSend_bytes(v15, v16, v17, v18);
    uint64_t v22 = objc_msgSend_initWithUUIDBytes_(v12, v20, v19, v21);

    int v26 = objc_msgSend_sharedItemChangeType(v7, v23, v24, v25);
    switch(v26)
    {
      case 0:
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        goto LABEL_13;
      case 1:
        uint64_t v31 = (_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
        int v30 = 1;
        break;
      case 2:
        int v30 = 0;
        uint64_t v31 = (_DWORD *)(*(void *)(*(void *)(a1 + 96) + 8) + 24);
        break;
      default:
        goto LABEL_14;
    }
    ++*v31;
    uint64_t v32 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v33 = *(void *)(*(void *)(a1 + 104) + 8);
    id obj = *(id *)(v33 + 40);
    int v34 = objc_msgSend_removeItemWithExternalId_error_(v32, v27, (uint64_t)v22, (uint64_t)&obj);
    objc_storeStrong((id *)(v33 + 40), obj);
    if (!v34) {
      goto LABEL_15;
    }
    if (v30)
    {
LABEL_13:
      uint64_t v35 = *(void **)(*(void *)(a1 + 32) + 16);
      uint64_t v36 = objc_msgSend_content(v11, v27, v28, v29);
      uint64_t v39 = objc_msgSend__allMetaContent_(*(void **)(a1 + 32), v37, (uint64_t)v7, v38);
      uint64_t v40 = *(void *)(a1 + 48);
      uint64_t v41 = *(void *)(a1 + 56);
      uint64_t v42 = *(void *)(*(void *)(a1 + 104) + 8);
      id v45 = *(id *)(v42 + 40);
      LOBYTE(v35) = objc_msgSend_addCascadeSharedItemContent_allMetaContent_sourceIdentifier_personaIdentifier_externalId_error_(v35, v43, (uint64_t)v36, (uint64_t)v39, v40, v41, v22, &v45);
      objc_storeStrong((id *)(v42 + 40), v45);

      if (v35) {
        goto LABEL_14;
      }
LABEL_15:
      uint64_t v6 = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      goto LABEL_16;
    }
LABEL_14:
    uint64_t v6 = 1;
LABEL_16:

    goto LABEL_17;
  }
  id v4 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)long long buf = 136315394;
    uint64_t v48 = "-[SEMSkitUpdater indexUpdatesToSets:changeRegistry:shouldDefer:error:]_block_invoke_3";
    __int16 v49 = 2112;
    uint64_t v50 = v5;
    _os_log_impl(&dword_25C7CA000, v4, OS_LOG_TYPE_INFO, "%s (%@) Aborting update due to deferral signal", buf, 0x16u);
  }
  uint64_t v6 = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
LABEL_17:

  return v6;
}

void sub_25C80D538(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80D8D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80D94C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80DAC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80DB5C(const char *a1@<X1>, uint64_t a2@<X3>, std::string *a3@<X8>)
{
  id v4 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x263F086E0], a1, @"com.apple.siri.SiriEntityMatcher", a2);
  uint64_t v6 = objc_msgSend_pathForResource_ofType_(v4, v5, @"NameTrie", 0);

  if (v6)
  {
    id v7 = v6;
    uint64_t v11 = (char *)objc_msgSend_UTF8String(v7, v8, v9, v10);
    sub_25C80F44C(a3, &v11);
  }
  else
  {
    a3->__r_.__value_.__r.__words[0] = 0;
    a3->__r_.__value_.__l.__size_ = 0;
    a3->__r_.__value_.__r.__words[2] = 0;
  }
}

void sub_25C80DBFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C80DC10(const char *a1@<X1>, uint64_t a2@<X3>, std::string *a3@<X8>)
{
  id v4 = objc_msgSend_bundleWithIdentifier_(MEMORY[0x263F086E0], a1, @"com.apple.siri.SiriEntityMatcher", a2);
  uint64_t v6 = objc_msgSend_pathForResource_ofType_(v4, v5, @"AliasTrie", 0);

  if (v6)
  {
    id v7 = v6;
    uint64_t v11 = (char *)objc_msgSend_UTF8String(v7, v8, v9, v10);
    sub_25C80F44C(a3, &v11);
  }
  else
  {
    a3->__r_.__value_.__r.__words[0] = 0;
    a3->__r_.__value_.__l.__size_ = 0;
    a3->__r_.__value_.__r.__words[2] = 0;
  }
}

void sub_25C80DCB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C80DCC4(uint64_t a1, const char *a2)
{
  if (*(char *)(a1 + 23) >= 0) {
    return objc_msgSend_stringWithCString_encoding_(NSString, a2, a1, 4);
  }
  else {
    return objc_msgSend_stringWithCString_encoding_(NSString, a2, *(void *)a1, 4);
  }
}

id sub_25C80DCE8()
{
  __p[1] = 0;
  uint64_t v4 = 0;
  __p[0] = 0;
  skit::to_string();
  uint64_t v1 = objc_msgSend_stringWithCString_encoding_(NSString, v0, (uint64_t)__p, 4);
  if (SHIBYTE(v4) < 0) {
    operator delete(__p[0]);
  }
  return v1;
}

void sub_25C80DD84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C80DDA4(void *a1@<X0>, uint64_t a2@<X8>)
{
  CFStringRef v3 = a1;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  theCFStringRef String = (__CFString *)v3;
  if (v3)
  {
    CFIndex Length = CFStringGetLength(v3);
    sub_25C7D02B0(a2, Length, 0);
    if (*(char *)(a2 + 23) >= 0) {
      uint64_t v5 = (UniChar *)a2;
    }
    else {
      uint64_t v5 = *(UniChar **)a2;
    }
    v8.location = 0;
    v8.length = Length;
    CFStringGetCharacters(theString, v8, v5);
  }
}

void sub_25C80DE30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (*(char *)(v10 + 23) < 0) {
    operator delete(*(void **)v10);
  }

  _Unwind_Resume(a1);
}

id sub_25C80DE54(int *a1, int a2)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  uint64_t v2 = (unsigned __int16 *)((char *)a1 - *a1);
  if (*v2 < 9u || (uint64_t v3 = v2[4]) == 0)
  {
    uint64_t v9 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v51 = "SEMCascadeContentFromDocument";
      _os_log_error_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_ERROR, "%s Document missing Cascade item", buf, 0xCu);
    }
    goto LABEL_17;
  }
  uint64_t v4 = (int *)((char *)a1 + v3 + *(unsigned int *)((char *)a1 + v3));
  uint64_t v5 = (unsigned __int16 *)((char *)v4 - *v4);
  unsigned int v6 = *v5;
  if (v6 <= 4)
  {
    uint64_t v8 = 0;
LABEL_14:
    uint64_t v18 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v33 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v19, v8, v20);
      *(_DWORD *)long long buf = 136315394;
      uint64_t v51 = "SEMCascadeContentFromDocument";
      __int16 v52 = 2112;
      id v53 = v33;
      _os_log_error_impl(&dword_25C7CA000, v18, OS_LOG_TYPE_ERROR, "%s Document with type %@ missing content", buf, 0x16u);
    }
LABEL_17:
    id v21 = 0;
    goto LABEL_18;
  }
  if (v5[2]) {
    uint64_t v8 = *(unsigned __int16 *)((char *)v4 + v5[2]);
  }
  else {
    uint64_t v8 = 0;
  }
  if (v6 < 7) {
    goto LABEL_14;
  }
  uint64_t v10 = v5[3];
  if (!v10) {
    goto LABEL_14;
  }
  uint64_t v11 = (unsigned int *)((char *)v4 + v10 + *(unsigned int *)((char *)v4 + v10));
  uint64_t v12 = *v11;
  id v13 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v15 = (uint64_t)(v11 + 1);
  if (a2) {
    uint64_t v16 = objc_msgSend_initWithBytes_length_(v13, v14, v15, v12);
  }
  else {
    uint64_t v16 = objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(v13, v14, v15, v12, 0);
  }
  uint64_t v23 = (void *)v16;
  id v49 = 0;
  uint64_t v24 = objc_msgSend_contentMessageForItemType_data_error_(MEMORY[0x263F31718], v17, v8, v16, &v49);
  id v25 = v49;
  if (!v24)
  {
    int v30 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int v34 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v31, v8, v32);
      *(_DWORD *)long long buf = 136315650;
      uint64_t v51 = "SEMCascadeContentFromDocument";
      __int16 v52 = 2112;
      id v53 = v34;
      __int16 v54 = 2112;
      id v55 = v25;
      _os_log_error_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_ERROR, "%s Document with type %@ content failed to decode: %@", buf, 0x20u);
    }
    goto LABEL_30;
  }
  int v26 = objc_opt_class();
  if (objc_msgSend_itemType(v26, v27, v28, v29) != v8)
  {
    int v30 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = (void *)MEMORY[0x263F50070];
      uint64_t v38 = objc_opt_class();
      uint64_t v42 = objc_msgSend_itemType(v38, v39, v40, v41);
      id v45 = objc_msgSend_descriptionForTypeIdentifier_(v37, v43, v42, v44);
      uint64_t v48 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v46, v8, v47);
      *(_DWORD *)long long buf = 136315906;
      uint64_t v51 = "SEMCascadeContentFromDocument";
      __int16 v52 = 2112;
      id v53 = v36;
      __int16 v54 = 2112;
      id v55 = v45;
      __int16 v56 = 2112;
      __int16 v57 = v48;
      _os_log_error_impl(&dword_25C7CA000, v30, OS_LOG_TYPE_ERROR, "%s Document contains content: %@ of unexpected type (%@) expected: %@", buf, 0x2Au);
    }
LABEL_30:

    id v21 = 0;
    goto LABEL_31;
  }
  id v21 = v24;
LABEL_31:

LABEL_18:
  return v21;
}

void sub_25C80E238(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_25C80E2A0(void *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v5 = objc_msgSend_entityInfo(v1, v2, v3, v4);
  unsigned int v6 = sub_25C80E468(v5);

  uint64_t v10 = objc_msgSend_allMetaContent(v6, v7, v8, v9);

  if (v10)
  {
    unsigned int v14 = objc_msgSend_duplicateIndex(v1, v11, v12, v13);
    uint64_t v18 = objc_msgSend_allMetaContent(v6, v15, v16, v17);
    unint64_t v22 = objc_msgSend_count(v18, v19, v20, v21);

    if (v22 >= v14)
    {
      uint64_t v27 = objc_msgSend_allMetaContent(v6, v23, v24, v25);
      unsigned int v31 = objc_msgSend_duplicateIndex(v1, v28, v29, v30);
      uint64_t v10 = objc_msgSend_objectAtIndex_(v27, v32, v31, v33);
    }
    else
    {
      int v26 = qword_26B3549D8;
      if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
      {
        int v35 = 136315394;
        id v36 = "SEMCascadeMetaContentForResult";
        __int16 v37 = 2112;
        id v38 = v1;
        _os_log_error_impl(&dword_25C7CA000, v26, OS_LOG_TYPE_ERROR, "%s Unexpected result - duplicateIndex beyond allMetaContent range: %@", (uint8_t *)&v35, 0x16u);
      }
      uint64_t v10 = 0;
    }
  }

  return v10;
}

void sub_25C80E428(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_25C80E468(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    uint64_t v3 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      unsigned int v6 = NSStringFromClass(v5);
      int v7 = 136315650;
      uint64_t v8 = "SEMCascadeEntityInfoOrNil";
      __int16 v9 = 2112;
      id v10 = v1;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_error_impl(&dword_25C7CA000, v3, OS_LOG_TYPE_ERROR, "%s Unexpected entity info: %@ expected %@", (uint8_t *)&v7, 0x20u);
    }
    id v2 = 0;
  }

  return v2;
}

void sub_25C80E598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_25C80E5BC(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
  }
  else
  {
    uint64_t v3 = (id)qword_26B3549D8;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      unsigned int v6 = NSStringFromClass(v5);
      int v7 = 136315650;
      uint64_t v8 = "SEMCascadeEntityFieldInfoOrNil";
      __int16 v9 = 2112;
      id v10 = v1;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_error_impl(&dword_25C7CA000, v3, OS_LOG_TYPE_ERROR, "%s Unexpected entity field info: %@ expected %@", (uint8_t *)&v7, 0x20u);
    }
    id v2 = 0;
  }

  return v2;
}

void sub_25C80E6EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_25C80E710(int **a1)
{
  uint64_t v163 = *MEMORY[0x263EF8340];
  id v1 = *a1;
  id v2 = (unsigned __int16 *)((char *)*a1 - **a1);
  if (*v2 < 5u)
  {
    __int16 v11 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
LABEL_11:
      id v13 = 0;
      goto LABEL_12;
    }
    LODWORD(v12) = 0;
LABEL_28:
    *(_DWORD *)int __p = 136315394;
    *(void *)&__p[4] = "SEMSpanMatchResultsFromItemResult";
    __int16 v155 = 1024;
    LODWORD(v156) = v12;
    _os_log_error_impl(&dword_25C7CA000, v11, OS_LOG_TYPE_ERROR, "%s Matched document has unsupported entity type: %u", __p, 0x12u);
    goto LABEL_11;
  }
  if (!v2[2] || *((unsigned char *)v1 + v2[2]) != 1)
  {
    __int16 v11 = qword_26B3549D8;
    if (!os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    uint64_t v12 = v2[2];
    if (v2[2]) {
      LODWORD(v12) = *((unsigned __int8 *)v1 + v12);
    }
    goto LABEL_28;
  }
  id v142 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v137 = sub_25C80DE54(*a1, 1);
  if (v137)
  {
    uint64_t v4 = objc_opt_class();
    unsigned int v150 = objc_msgSend_itemType(v4, v5, v6, v7);
    uint64_t v8 = (unsigned __int16 *)((char *)*a1 - **a1);
    if (*v8 >= 9u && (uint64_t v9 = v8[4]) != 0) {
      id v10 = (int *)((char *)*a1 + v9 + *(unsigned int *)((char *)*a1 + v9));
    }
    else {
      id v10 = 0;
    }
    uint64_t v15 = *v10;
    uint64_t v16 = -v15;
    uint64_t v17 = (char *)v10 - v15;
    unsigned int v18 = *(unsigned __int16 *)((char *)v10 - v15);
    if (v18 < 0xB)
    {
      uint64_t v22 = 0;
    }
    else
    {
      uint64_t v19 = *((unsigned __int16 *)v17 + 5);
      if (v19)
      {
        uint64_t v20 = (unsigned int *)((char *)v10 + v19 + *(unsigned int *)((char *)v10 + v19));
        sub_25C80F3B4(__p, v20 + 1, *v20);
        if (v157 >= 0) {
          objc_msgSend_stringWithCString_encoding_(NSString, v21, (uint64_t)__p, 4);
        }
        else {
        uint64_t v22 = objc_msgSend_stringWithCString_encoding_(NSString, v21, *(uint64_t *)__p, 4);
        }
        if (SHIBYTE(v157) < 0) {
          operator delete(*(void **)__p);
        }
        uint64_t v23 = *v10;
        uint64_t v16 = -v23;
        unsigned int v18 = *(unsigned __int16 *)((char *)v10 - v23);
      }
      else
      {
        uint64_t v22 = 0;
      }
      if (v18 >= 0xD)
      {
        if (!*(_WORD *)((char *)v10 + v16 + 12))
        {
          v135 = 0;
          goto LABEL_40;
        }
        sub_25C80F3B4(__p, (char *)v10+ *(unsigned __int16 *)((char *)v10 + v16 + 12)+ *(unsigned int *)((char *)v10 + *(unsigned __int16 *)((char *)v10 + v16 + 12))+ 4, *(unsigned int *)((char *)v10+ *(unsigned __int16 *)((char *)v10 + v16 + 12)+ *(unsigned int *)((char *)v10 + *(unsigned __int16 *)((char *)v10 + v16 + 12))));
        if (v157 >= 0) {
          objc_msgSend_stringWithCString_encoding_(NSString, v24, (uint64_t)__p, 4);
        }
        else {
        v135 = objc_msgSend_stringWithCString_encoding_(NSString, v24, *(uint64_t *)__p, 4);
        }
        if (SHIBYTE(v157) < 0) {
          operator delete(*(void **)__p);
        }
        uint64_t v25 = *v10;
        uint64_t v16 = -v25;
        unsigned int v18 = *(unsigned __int16 *)((char *)v10 - v25);
LABEL_39:
        if (v18 < 9)
        {
          int v136 = (void *)v22;
          goto LABEL_50;
        }
LABEL_40:
        int v136 = (void *)v22;
        if (*(_WORD *)((char *)v10 + v16 + 8))
        {
          id v26 = objc_alloc(MEMORY[0x263EFF980]);
          uint64_t v27 = (unsigned int *)((char *)v10 + *(unsigned __int16 *)((char *)v10 - *v10 + 8));
          uint64_t v148 = objc_msgSend_initWithCapacity_(v26, v28, *(unsigned int *)((char *)v27 + *v27), v29);
          uint64_t v30 = *(unsigned __int16 *)((char *)v10 - *v10 + 8);
          uint64_t v31 = *(unsigned int *)((char *)v10 + v30);
          uint64_t v32 = (unsigned int *)((char *)v10 + v30 + v31);
          uint64_t v33 = *v32;
          if (v33)
          {
            unint64_t v34 = 0;
            int v35 = 0;
            uint64_t v36 = 4 * v33;
            __int16 v37 = (char *)v10 + v30 + v31;
            while (1)
            {
              uint64_t v38 = v32[v34 / 4 + 1];
              id v39 = objc_alloc(MEMORY[0x263EFF8F8]);
              uint64_t v41 = *(int *)((char *)&v32[v34 / 4 + 1] + v38);
              uint64_t v42 = *(unsigned __int16 *)&v37[v34 + 8 + v38 - v41];
              if (*(_WORD *)&v37[v34 + 8 + v38 - v41])
              {
                uint64_t v43 = *(unsigned int *)&v37[v34 + 4 + v38 + v42];
                uint64_t v44 = (uint64_t)&v37[v34 + 4 + v38 + v42 + v43];
              }
              else
              {
                uint64_t v42 = 0;
                uint64_t v44 = 0;
                uint64_t v43 = *(unsigned int *)((char *)&v32[v34 / 4 + 1] + v38);
              }
              uint64_t v45 = objc_msgSend_initWithBytes_length_(v39, v40, v44 + 4, *(unsigned int *)&v37[v38 + 4 + v42 + v43 + v34]);
              id v153 = v35;
              __int16 v46 = (void *)v45;
              uint64_t v48 = objc_msgSend_metaContentMessageForItemType_data_error_(MEMORY[0x263F31718], v47, v150, v45, &v153);
              id v138 = v153;

              if (!v48) {
                break;
              }
              objc_msgSend_addObject_(v148, v49, (uint64_t)v48, v50);

              v34 += 4;
              int v35 = v138;
              if (v36 == v34)
              {
                id v51 = v138;
                goto LABEL_52;
              }
            }
            uint64_t v130 = (id)qword_26B3549D8;
            if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
            {
              uint64_t v133 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v131, v150, v132);
              *(_DWORD *)int __p = 136315650;
              *(void *)&__p[4] = "_cascadeSpanMatchResults";
              __int16 v155 = 2112;
              uint64_t v156 = (uint64_t)v133;
              __int16 v157 = 2112;
              id v158 = v138;
              _os_log_error_impl(&dword_25C7CA000, v130, OS_LOG_TYPE_ERROR, "%s Document with type %@ metacontent failed to decode: %@", __p, 0x20u);
            }
            id v13 = 0;
LABEL_98:

            goto LABEL_99;
          }
LABEL_51:
          id v51 = 0;
LABEL_52:
          __int16 v52 = [SEMCascadeEntityInfo alloc];
          __int16 v56 = objc_msgSend_copy(v148, v53, v54, v55);
          id v138 = v51;
          uint64_t v149 = objc_msgSend_initWithContent_allMetaContent_sourceIdentifier_personaIdentifier_(v52, v57, (uint64_t)v137, (uint64_t)v56, v136, v135);

          uint64_t v58 = a1[1];
          unsigned int v139 = a1[2];
          if (v58 != v139)
          {
            do
            {
              v140 = (unsigned int *)v58;
              if (v58[2])
              {
                uint64_t v59 = (skit::SpanMatchV3 *)(v58 + 122);
                uint64_t v60 = skit::SpanMatchV3::alias_ids((skit::SpanMatchV3 *)(v58 + 122));
                sub_25C7DF5DC((uint64_t)__p, *(char **)v60, (char *)(*(void *)v60 + 2 * *(unsigned int *)(v60 + 8)));
                if (*(_DWORD *)&__p[8])
                {
                  int v61 = 0;
                  uint64_t v62 = 2 * *(unsigned int *)&__p[8];
                  uint64_t v63 = (unsigned __int8 *)(*(void *)__p + 1);
                  do
                  {
                    int v64 = *v63;
                    v63 += 2;
                    switch(v64)
                    {
                      case 1:
                        v61 |= 1u;
                        break;
                      case 2:
                        v61 |= 2u;
                        break;
                      case 3:
                        v61 |= 4u;
                        break;
                      case 4:
                        v61 |= 8u;
                        break;
                      case 6:
                        v61 |= 0x10u;
                        break;
                      case 7:
                        v61 |= 0x40u;
                        break;
                      case 8:
                        v61 |= 0x81u;
                        break;
                      case 9:
                        v61 |= 0x20u;
                        break;
                      default:
                        break;
                    }
                    v62 -= 2;
                  }
                  while (v62);
                }
                else
                {
                  LOWORD(v61) = 0;
                }
                if (*(uint64_t **)__p != (uint64_t *)((char *)&v156 + 2)) {
                  free(*(void **)__p);
                }
                if (v140[136]) {
                  __int16 v66 = v61 | 0x20;
                }
                else {
                  __int16 v66 = v61;
                }
                __int16 v152 = v66;
                uint64_t v146 = sub_25C80DCE8();
                v144 = [SEMSpanInfo alloc];
                uint64_t v67 = *(unsigned int *)skit::SpanMatchV3::span(v59);
                unint64_t v68 = (int *)skit::SpanMatchV3::span(v59);
                int v69 = *v68;
                int v70 = v68[1];
                skit::SpanMatchV3::score(v59);
                int v72 = v71;
                uint64_t v73 = v140[138];
                uint64_t v74 = skit::SpanMatchV3::token_cnt(v59);
                uint64_t v75 = v140[139];
                unsigned int v76 = skit::SpanMatchV3::stop_word_cnt(v59);
                uint64_t v77 = v140[2];
                if (v77)
                {
                  unsigned int v78 = 0;
                  uint64_t v79 = 112 * v77;
                  __int16 v80 = (int *)(*(void *)v140 + 40);
                  do
                  {
                    int v81 = *v80;
                    v80 += 28;
                    v78 += v81;
                    v79 -= 112;
                  }
                  while (v79);
                }
                else
                {
                  unsigned int v78 = 0;
                }
                unsigned int v82 = skit::SpanMatchV3::alias_token_cnt(v59);
                unsigned int v83 = skit::SpanMatchV3::edit_dist(v59);
                LOWORD(v134) = v152;
                LODWORD(v84) = v72;
                matched = objc_msgSend_initWithValue_location_length_matchScore_maxTokenCount_matchedTokenCount_maxStopWordCount_matchedStopWordCount_maxAliasCount_matchedAliasCount_editDistance_aliasMatchOptions_(v144, v85, v146, v67, (v70 - v69), v73, v74, v75, v84, __PAIR64__(v78, v76), __PAIR64__(v83, v82), v134);
                uint64_t v65 = v146;
              }
              else
              {
                uint64_t v65 = (id)qword_26B3549D8;
                if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v128 = sub_25C80DCE8();
                  *(_DWORD *)long long buf = 136315394;
                  uint64_t v160 = "_spanInfoFromCascadeSpanMatchResult";
                  __int16 v161 = 2112;
                  v162 = v128;
                  _os_log_error_impl(&dword_25C7CA000, v65, OS_LOG_TYPE_ERROR, "%s skit MergedFieldMatchV2 has zero-length fields. value: %@", buf, 0x16u);
                }
                matched = 0;
              }

              id v86 = objc_alloc(MEMORY[0x263EFF980]);
              uint64_t v141 = objc_msgSend_initWithCapacity_(v86, v87, v140[2], v88);
              uint64_t v89 = v140[2];
              if (v89)
              {
                uint64_t v143 = 112 * v89;
                uint64_t v90 = (skit::SpanMatchV3 *)(*(void *)v140 + 48);
                while (1)
                {
                  uint64_t v145 = [SEMSpanInfo alloc];
                  v147 = sub_25C80DCE8();
                  uint64_t v91 = *(unsigned int *)skit::SpanMatchV3::span(v90);
                  int v92 = *(_DWORD *)(skit::SpanMatchV3::span(v90) + 4);
                  int v93 = *(_DWORD *)skit::SpanMatchV3::span(v90);
                  skit::SpanMatchV3::score(v90);
                  int v95 = v94;
                  uint64_t v96 = *((unsigned int *)v90 - 4);
                  uint64_t v97 = skit::SpanMatchV3::token_cnt(v90);
                  uint64_t v98 = *((unsigned int *)v90 - 3);
                  unsigned int v99 = skit::SpanMatchV3::stop_word_cnt(v90);
                  unsigned int v100 = *((_DWORD *)v90 - 2);
                  unsigned int v101 = skit::SpanMatchV3::alias_token_cnt(v90);
                  unsigned int v102 = skit::SpanMatchV3::edit_dist(v90);
                  LOWORD(v134) = 0;
                  LODWORD(v103) = v95;
                  int v105 = objc_msgSend_initWithValue_location_length_matchScore_maxTokenCount_matchedTokenCount_maxStopWordCount_matchedStopWordCount_maxAliasCount_matchedAliasCount_editDistance_aliasMatchOptions_(v145, v104, (uint64_t)v147, v91, (v92 - v93), v96, v97, v98, v103, __PAIR64__(v100, v99), __PAIR64__(v102, v101), v134);

                  char v106 = [SEMCascadeEntityFieldInfo alloc];
                  id v109 = objc_msgSend_initWithFieldType_(v106, v107, *((unsigned __int16 *)v90 - 24), v108);
                  unsigned int v110 = [SEMFieldMatch alloc];
                  uint64_t v114 = objc_msgSend_initWithSpanInfo_entityFieldInfo_(v110, v111, (uint64_t)v105, (uint64_t)v109);
                  if (!v114) {
                    break;
                  }
                  objc_msgSend_addObject_(v141, v112, (uint64_t)v114, v113);

                  uint64_t v90 = (skit::SpanMatchV3 *)((char *)v90 + 112);
                  v143 -= 112;
                  if (!v143) {
                    goto LABEL_86;
                  }
                }
                unint64_t v117 = (id)qword_26B3549D8;
                if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
                {
                  long long v129 = sub_25C80DCE8();
                  *(_DWORD *)int __p = 136315394;
                  *(void *)&__p[4] = "_fieldMatchesFromCascadeSpanMatchResult";
                  __int16 v155 = 2112;
                  uint64_t v156 = (uint64_t)v129;
                  _os_log_error_impl(&dword_25C7CA000, v117, OS_LOG_TYPE_ERROR, "%s Failed to convert SKIT field match to SEMFieldMatch. value: %@", __p, 0x16u);
                }
                id v116 = 0;
                uint64_t v115 = v141;
              }
              else
              {
LABEL_86:
                uint64_t v115 = v141;
                id v116 = v141;
              }

              unint64_t v118 = 0;
              do
              {
                uint64_t v119 = [SEMSpanMatchResult alloc];
                id v123 = objc_msgSend_initWithEntityInfo_spanInfo_fieldMatches_duplicateIndex_(v119, v120, v149, (uint64_t)matched, v116, v118);
                if (v123)
                {
                  objc_msgSend_addObject_(v142, v121, (uint64_t)v123, v122);
                }
                else
                {
                  uint64_t v124 = qword_26B3549D8;
                  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)int __p = 136315394;
                    *(void *)&__p[4] = "_cascadeSpanMatchResults";
                    __int16 v155 = 2112;
                    uint64_t v156 = v149;
                    _os_log_error_impl(&dword_25C7CA000, v124, OS_LOG_TYPE_ERROR, "%s Failed to convert SKIT match result to SEMSpanMatchResult. entityInfo: %@", __p, 0x16u);
                  }
                }

                unint64_t v118 = (v118 + 1);
              }
              while (objc_msgSend_count(v148, v125, v126, v127) > v118);

              uint64_t v58 = (int *)(v140 + 142);
            }
            while (v140 + 142 != (unsigned int *)v139);
          }
          id v13 = v142;
          __int16 v46 = (void *)v149;
          goto LABEL_98;
        }
LABEL_50:
        uint64_t v148 = 0;
        goto LABEL_51;
      }
    }
    v135 = 0;
    goto LABEL_39;
  }
  id v138 = 0;
  id v13 = 0;
LABEL_99:

LABEL_12:
  return v13;
}

void sub_25C80F1E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  _Unwind_Resume(a1);
}

void *sub_25C80F3B4(void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *long long __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    uint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_8;
    }
  }
  memmove(v6, __src, __len);
LABEL_8:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

std::string *sub_25C80F44C(std::string *this, char **a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = v3 - 1;
  while (*++v4)
    ;
  sub_25C80BFA0(this, v3, v4);
  return this;
}

void sub_25C80F490(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C80F824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  if (*(char *)(v44 - 105) < 0) {
    operator delete(*(void **)(v44 - 128));
  }
  MEMORY[0x261194470](v43, 0x1032C40418FB21DLL);
  if (a16 < 0) {
    operator delete(a11);
  }
  if (a22 < 0) {
    operator delete(a17);
  }

  _Unwind_Resume(a1);
}

void sub_25C80F940(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C80FA74(uint64_t a1)
{
  return MEMORY[0x270F9B290](*(void *)(*(void *)(a1 + 32) + 24) + 16);
}

void sub_25C80FC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25C80FCA8(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v2 = (skit::IndexWriter *)(*(void *)(*(void *)(a1 + 32) + 24) + 16);
  unsigned int v3 = skit::IndexWriter::segment_cnt(v2);
  if (v3 >= 0x14)
  {
    unsigned int v4 = v3;
    if (v3 >= 0xC9)
    {
      uint64_t v5 = qword_26B3549C0;
      char v6 = 1;
      if (!os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      int v16 = 136315650;
      uint64_t v17 = "should_auto_merge";
      __int16 v18 = 1024;
      unsigned int v19 = v4;
      __int16 v20 = 1024;
      int v21 = 200;
      size_t v7 = "%s Index segment count (%u) exceeds maximum threshold (%u)";
      size_t v8 = v5;
      uint32_t v9 = 24;
LABEL_8:
      _os_log_impl(&dword_25C7CA000, v8, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v16, v9);
      goto LABEL_10;
    }
    unint64_t v10 = (unint64_t)((double)(unint64_t)skit::IndexWriter::flush_threshold(v2) * 0.25);
    unsigned int v11 = skit::IndexWriter::index_count_threshold(v2);
    if (v4 >> 1 < v11)
    {
      unsigned int v12 = v11;
      uint64_t v13 = qword_26B3549C0;
      char v6 = 1;
      if (!os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_INFO)) {
        goto LABEL_10;
      }
      int v16 = 136316162;
      uint64_t v17 = "should_auto_merge";
      __int16 v18 = 1024;
      unsigned int v19 = v12;
      __int16 v20 = 1024;
      int v21 = v4;
      __int16 v22 = 2048;
      unint64_t v23 = v10;
      __int16 v24 = 1024;
      unsigned int v25 = v4 >> 1;
      size_t v7 = "%s Index has %u/%u segments smaller than %lu bytes exceeding threshold %u";
      size_t v8 = v13;
      uint32_t v9 = 40;
      goto LABEL_8;
    }
  }
  char v6 = 0;
LABEL_10:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 24) + 16;
  return MEMORY[0x270F9B278](v14);
}

uint64_t sub_25C810020(uint64_t a1)
{
  return MEMORY[0x270F9B288](*(void *)(*(void *)(a1 + 32) + 24) + 16);
}

void sub_25C810088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8100D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C810360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C8103E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4 = *(const char **)(a1 + 40);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 24);
  char v6 = *(char **)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  unsigned int v8 = objc_msgSend_indexFeatures(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v11 = 0;
  unsigned int v12 = 0;
  uint64_t v9 = sub_25C7D673C(v5, v4, v6, v7, v8, (uint64_t)&v11);
  if (v12) {
    sub_25C7D2280(v12);
  }
  return v9;
}

void sub_25C81045C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    sub_25C7D2280(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_25C810654(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8109A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C810A30(uint64_t a1)
{
  return sub_25C7D4728(*(void *)(*(void *)(a1 + 32) + 24), *(void *)(a1 + 56), *(void **)(a1 + 40), *(void **)(a1 + 48), a1 + 64, a1 + 80);
}

uint64_t sub_25C810B38()
{
  return skit::IndexWriter::erase() - 1;
}

uint64_t sub_25C810CE8(uint64_t a1)
{
  return MEMORY[0x270F9B260](*(void *)(*(void *)(a1 + 32) + 24) + 16);
}

uint64_t sub_25C810D74(uint64_t a1)
{
  return MEMORY[0x270F9B328](*(void *)(*(void *)(a1 + 32) + 24));
}

uint64_t sub_25C810E30(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v2 = (skit::IndexWriter *)(*(void *)(*(void *)(a1 + 32) + 24) + 16);
  if (skit::IndexWriter::should_merge(v2))
  {
    BOOL v3 = 1;
  }
  else if ((unint64_t)skit::IndexWriter::size(v2) < 0x3E8)
  {
    BOOL v3 = 0;
  }
  else
  {
    float v4 = (float)(unint64_t)skit::IndexWriter::record_cnt(v2);
    BOOL v3 = (float)((float)(unint64_t)skit::IndexWriter::size(v2) * 0.9) >= v4;
  }
  uint64_t v5 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    char v6 = @"NO";
    if (v3) {
      char v6 = @"YES";
    }
    int v9 = 136315394;
    unint64_t v10 = "-[SEMSkitWriter shouldMerge:error:]_block_invoke";
    __int16 v11 = 2112;
    unsigned int v12 = v6;
    _os_log_impl(&dword_25C7CA000, v5, OS_LOG_TYPE_INFO, "%s Skit should_merge = %@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = *(unsigned char **)(a1 + 40);
  if (v7) {
    unsigned char *v7 = v3;
  }
  return 0;
}

void sub_25C810FE4(uint64_t a1)
{
  id v2 = *(std::__shared_weak_count **)(a1 + 96);
  if (v2) {
    sub_25C7D2280(v2);
  }
  BOOL v3 = *(std::__shared_weak_count **)(a1 + 80);
  if (v3) {
    sub_25C7D2280(v3);
  }
  float v4 = *(std::__shared_weak_count **)(a1 + 64);
  if (v4) {
    sub_25C7D2280(v4);
  }
  if (*(char *)(a1 + 55) < 0) {
    operator delete(*(void **)(a1 + 32));
  }
  MEMORY[0x261193EB0](a1 + 16);
  skit::ContextV2::~ContextV2((skit::ContextV2 *)a1);
  JUMPOUT(0x261194470);
}

void sub_25C81124C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8112B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8113D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C811454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C811604(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C811794(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8119BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21)
{
  _Unwind_Resume(a1);
}

void sub_25C811A2C()
{
}

void sub_25C811A34()
{
}

void sub_25C811A3C()
{
}

void sub_25C811A44()
{
}

void sub_25C811A4C()
{
}

void sub_25C811A54()
{
}

void sub_25C811CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C811E8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C811FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_25C813028(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  int v9 = v7;
  if (v6) {
    objc_msgSend_setObject_forKey_(v7, v8, (uint64_t)v6, *MEMORY[0x263F07F80]);
  }
  if (v5) {
    objc_msgSend_setObject_forKey_(v9, v8, (uint64_t)v5, *MEMORY[0x263F08608]);
  }
  unint64_t v10 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v8, @"com.apple.siri.inference.SEMSpanMatcher", a2, v9);

  return v10;
}

void sub_25C813364(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8133C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C813680(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C813824(_Unwind_Exception *exception_object)
{
}

void sub_25C8139A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C813B54(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C813CB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C813E34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C813E9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8142BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *__p,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
  if (*(char *)(v44 - 121) < 0) {
    operator delete(*(void **)(v44 - 144));
  }

  _Unwind_Resume(a1);
}

void sub_25C8143F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8147C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,char a29)
{
  _Unwind_Resume(a1);
}

void *sub_25C81496C(void *result)
{
  if (result[3])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[2];
    if (result)
    {
      do
      {
        id v2 = (void *)*result;
        operator delete(result);
        uint64_t result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    uint64_t v3 = v1[1];
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        *(void *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void sub_25C8149D4(float *a1, unsigned __int16 a2, __int16 a3)
{
  unint64_t v6 = a2;
  unint64_t v7 = *((void *)a1 + 1);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    int v9 = *(uint64_t ****)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (uint64_t i = *v9; i; uint64_t i = (uint64_t **)*i)
      {
        unint64_t v11 = (unint64_t)i[1];
        if (v11 == a2)
        {
          if (*((unsigned __int16 *)i + 8) == a2) {
            return;
          }
        }
        else
        {
          if (v8.u32[0] > 1uLL)
          {
            if (v11 >= v7) {
              v11 %= v7;
            }
          }
          else
          {
            v11 &= v7 - 1;
          }
          if (v11 != v3) {
            break;
          }
        }
      }
    }
  }
  unsigned int v12 = operator new(0x18uLL);
  void *v12 = 0;
  v12[1] = v6;
  *((_WORD *)v12 + 8) = a3;
  float v13 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v14 = a1[8];
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    BOOL v15 = 1;
    if (v7 >= 3) {
      BOOL v15 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v7);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      int8x8_t prime = (int8x8_t)v17;
    }
    else {
      int8x8_t prime = (int8x8_t)v16;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v7 = *((void *)a1 + 1);
    }
    if (*(void *)&prime > v7) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v7)
    {
      unint64_t v25 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v7 < 3 || (uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v26.i16[0] = vaddlv_u8(v26), v26.u32[0] > 1uLL))
      {
        unint64_t v25 = std::__next_prime(v25);
      }
      else
      {
        uint64_t v27 = 1 << -(char)__clz(v25 - 1);
        if (v25 >= 2) {
          unint64_t v25 = v27;
        }
      }
      if (*(void *)&prime <= v25) {
        int8x8_t prime = (int8x8_t)v25;
      }
      if (*(void *)&prime >= v7)
      {
        unint64_t v7 = *((void *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            sub_25C7D019C();
          }
          unsigned int v19 = operator new(8 * *(void *)&prime);
          __int16 v20 = *(void **)a1;
          *(void *)a1 = v19;
          if (v20) {
            operator delete(v20);
          }
          uint64_t v21 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v21++) = 0;
          while (*(void *)&prime != v21);
          __int16 v22 = (void *)*((void *)a1 + 2);
          if (v22)
          {
            unint64_t v23 = v22[1];
            uint8x8_t v24 = (uint8x8_t)vcnt_s8(prime);
            v24.i16[0] = vaddlv_u8(v24);
            if (v24.u32[0] > 1uLL)
            {
              if (v23 >= *(void *)&prime) {
                v23 %= *(void *)&prime;
              }
            }
            else
            {
              v23 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v23) = a1 + 4;
            uint64_t v28 = (void *)*v22;
            if (*v22)
            {
              do
              {
                unint64_t v29 = v28[1];
                if (v24.u32[0] > 1uLL)
                {
                  if (v29 >= *(void *)&prime) {
                    v29 %= *(void *)&prime;
                  }
                }
                else
                {
                  v29 &= *(void *)&prime - 1;
                }
                if (v29 != v23)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v29))
                  {
                    *(void *)(*(void *)a1 + 8 * v29) = v22;
                    goto LABEL_55;
                  }
                  *__int16 v22 = *v28;
                  *uint64_t v28 = **(void **)(*(void *)a1 + 8 * v29);
                  **(void **)(*(void *)a1 + 8 * v29) = v28;
                  uint64_t v28 = v22;
                }
                unint64_t v29 = v23;
LABEL_55:
                __int16 v22 = v28;
                uint64_t v28 = (void *)*v28;
                unint64_t v23 = v29;
              }
              while (v28);
            }
          }
          unint64_t v7 = (unint64_t)prime;
          goto LABEL_59;
        }
        uint64_t v33 = *(void **)a1;
        *(void *)a1 = 0;
        if (v33) {
          operator delete(v33);
        }
        unint64_t v7 = 0;
        *((void *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v30 = *(void **)a1;
  uint64_t v31 = *(void **)(*(void *)a1 + 8 * v3);
  if (v31)
  {
    void *v12 = *v31;
LABEL_72:
    *uint64_t v31 = v12;
    goto LABEL_73;
  }
  void *v12 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v12;
  v30[v3] = a1 + 4;
  if (*v12)
  {
    unint64_t v32 = *(void *)(*v12 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v32 >= v7) {
        v32 %= v7;
      }
    }
    else
    {
      v32 &= v7 - 1;
    }
    uint64_t v31 = (void *)(*(void *)a1 + 8 * v32);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
}

void sub_25C814DA8(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

__n128 sub_25C814DBC(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    sub_25C7D059C(*(unsigned char **)(a1 + 8), *(void **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
  }
  __n128 result = *(__n128 *)((char *)a2 + 24);
  *(void *)(v4 + 40) = *((void *)a2 + 5);
  *(__n128 *)(v4 + 24) = result;
  *(void *)(a1 + 8) = v4 + 48;
  return result;
}

void sub_25C814E2C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t sub_25C814E34(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    sub_25C7D06B8();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555;
  }
  else {
    unint64_t v9 = v5;
  }
  __int16 v20 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_25C7D06D0(v7, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = &v10[48 * v4];
  v17[0] = v10;
  v17[1] = v11;
  __int16 v18 = v11;
  unsigned int v19 = &v10[48 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_25C7D059C(v11, *(void **)a2, *((void *)a2 + 1));
    unint64_t v11 = v18;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v11 = v12;
  }
  float v13 = &v10[48 * v4];
  long long v14 = *(long long *)((char *)a2 + 24);
  *((void *)v13 + 5) = *((void *)a2 + 5);
  *(_OWORD *)(v13 + 24) = v14;
  __int16 v18 = v11 + 48;
  sub_25C7D0640(a1, v17);
  uint64_t v15 = a1[1];
  sub_25C7D0848((uint64_t)v17);
  return v15;
}

void sub_25C814F5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C7D0848((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t **sub_25C814F70(void *a1, unsigned __int16 a2)
{
  unint64_t v2 = a1[1];
  if (!v2) {
    return 0;
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)v2);
  v3.i16[0] = vaddlv_u8(v3);
  if (v3.u32[0] > 1uLL)
  {
    unint64_t v4 = a2;
    if (v2 <= a2) {
      unint64_t v4 = a2 % v2;
    }
  }
  else
  {
    unint64_t v4 = (v2 - 1) & a2;
  }
  unint64_t v5 = *(uint64_t ****)(*a1 + 8 * v4);
  if (!v5) {
    return 0;
  }
  for (__n128 result = *v5; result; __n128 result = (uint64_t **)*result)
  {
    unint64_t v7 = (unint64_t)result[1];
    if (v7 == a2)
    {
      if (*((unsigned __int16 *)result + 8) == a2) {
        return result;
      }
    }
    else
    {
      if (v3.u32[0] > 1uLL)
      {
        if (v7 >= v2) {
          v7 %= v2;
        }
      }
      else
      {
        v7 &= v2 - 1;
      }
      if (v7 != v4) {
        return 0;
      }
    }
  }
  return result;
}

void sub_25C815024(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709E03C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_25C815044(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_2709E03C0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x261194470);
}

void sub_25C815098(uint64_t a1)
{
  unint64_t v2 = *(std::__shared_weak_count **)(a1 + 200);
  if (v2) {
    sub_25C7D2280(v2);
  }
  sub_25C7DFD9C(a1 + 152);
  sub_25C7DFD9C(a1 + 112);
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }

  uint8x8_t v3 = (void **)(a1 + 48);
  sub_25C7D025C(&v3);
  uint8x8_t v3 = (void **)(a1 + 24);
  sub_25C7D025C(&v3);
}

void sub_25C815370(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C815400(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8154D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C815578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8155FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C815708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8157EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C8158C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C815A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C815EC0(_Unwind_Exception *a1)
{
  unint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_25C815FA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_25C81648C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v5 = a3;
  unint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  unint64_t v10 = objc_msgSend__rankerPolicyForGroupKey_(v6, v8, (uint64_t)v7, v9);
  unint64_t v11 = sub_25C81672C(v7);

  long long v12 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)uint64_t v43 = 136315394;
    *(void *)&v43[4] = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]_block_invoke";
    *(_WORD *)&v43[12] = 2112;
    *(void *)&v43[14] = v11;
    _os_log_impl(&dword_25C7CA000, v12, OS_LOG_TYPE_INFO, "%s Processing candidate group: %@", v43, 0x16u);
  }
  long long v14 = objc_msgSend__filterRankAndThresholdCandidates_ofQuery_withPolicy_(*(void **)(a1 + 32), v13, (uint64_t)v5, *(void *)(a1 + 40), v10);
  int v15 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 8);
  unint64_t v16 = (void *)qword_26B3549D8;
  BOOL v17 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO);
  if (v15)
  {
    if (v17)
    {
      __int16 v20 = v16;
      int v24 = objc_msgSend_count(v14, v21, v22, v23);
      int v28 = objc_msgSend_count(v5, v25, v26, v27);
      uint64_t v31 = sub_25C8167F8(v14, (const char *)*(unsigned __int8 *)(*(void *)(a1 + 32) + 8), v29, v30);
      *(_DWORD *)uint64_t v43 = 136316163;
      *(void *)&v43[4] = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]_block_invoke";
      *(_WORD *)&v43[12] = 1024;
      *(_DWORD *)&v43[14] = v24;
      *(_WORD *)&v43[18] = 1024;
      *(_DWORD *)&v43[20] = v28;
      *(_WORD *)uint64_t v44 = 2112;
      *(void *)&v44[2] = v11;
      *(_WORD *)&v44[10] = 2117;
      *(void *)&v44[12] = v31;
      unint64_t v32 = "%s Accepted %u / %u candidate(s) in group: %@%{sensitive}@";
LABEL_8:
      _os_log_impl(&dword_25C7CA000, v20, OS_LOG_TYPE_INFO, v32, v43, 0x2Cu);
    }
  }
  else if (v17)
  {
    __int16 v20 = v16;
    int v36 = objc_msgSend_count(v14, v33, v34, v35);
    int v40 = objc_msgSend_count(v5, v37, v38, v39);
    uint64_t v31 = sub_25C8167F8(v14, (const char *)*(unsigned __int8 *)(*(void *)(a1 + 32) + 8), v41, v42);
    *(_DWORD *)uint64_t v43 = 136316162;
    *(void *)&v43[4] = "-[SEMSpanMatchResultInterpreter interpretSpanMatchResults:ofQuery:]_block_invoke";
    *(_WORD *)&v43[12] = 1024;
    *(_DWORD *)&v43[14] = v36;
    *(_WORD *)&v43[18] = 1024;
    *(_DWORD *)&v43[20] = v40;
    *(_WORD *)uint64_t v44 = 2112;
    *(void *)&v44[2] = v11;
    *(_WORD *)&v44[10] = 2112;
    *(void *)&v44[12] = v31;
    unint64_t v32 = "%s Accepted %u / %u candidate(s) in group: %@%@";
    goto LABEL_8;
  }
  objc_msgSend_addObjectsFromArray_(*(void **)(a1 + 48), v18, (uint64_t)v14, v19, *(_OWORD *)v43, *(void *)&v43[16], *(_OWORD *)v44, *(void *)&v44[16]);
}

id sub_25C81672C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_25C818920(v1);
  id v5 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v3, v2, v4);
  uint64_t v6 = sub_25C818974(v1);

  if (v6 == (unsigned __int16)*MEMORY[0x263F316D0])
  {
    id v9 = v5;
  }
  else
  {
    unint64_t v10 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v7, v6, v8);
    objc_msgSend_stringByAppendingFormat_(v5, v11, @".%@", v12, v10);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

__CFString *sub_25C8167F8(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v130 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v4 = &stru_2709E04D0;
  }
  else
  {
    id v5 = objc_msgSend_sortedArrayUsingComparator_(a1, a2, (uint64_t)&unk_2709E0430, a4);
    id v6 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v10 = objc_msgSend_count(v5, v7, v8, v9);
    float v13 = objc_msgSend_initWithCapacity_(v6, v11, v10, v12);
    if (objc_msgSend_count(v5, v14, v15, v16))
    {
      unint64_t v19 = 0;
      int v20 = 0;
      uint64_t v115 = v13;
      id v116 = v5;
      do
      {
        int v124 = v20;
        uint64_t v21 = objc_msgSend_objectAtIndex_(v5, v17, v19, v18);
        unint64_t v25 = objc_msgSend_entityInfo(v21, v22, v23, v24);
        unsigned int v29 = objc_msgSend_entityType(v25, v26, v27, v28);

        uint64_t v33 = &stru_2709E04D0;
        unsigned int v123 = v29;
        if (v29 == 1)
        {
          id v122 = v21;
          __int16 v37 = objc_msgSend_entityInfo(v122, v34, v35, v36);
          uint64_t v38 = sub_25C80E468(v37);

          uint64_t v42 = objc_msgSend_sourceIdentifier(v38, v39, v40, v41);
          uint64_t v43 = (void *)MEMORY[0x263F50070];
          int v121 = v38;
          uint64_t v47 = objc_msgSend_itemType(v38, v44, v45, v46);
          uint64_t v50 = objc_msgSend_descriptionForTypeIdentifier_(v43, v48, v47, v49);
          uint64_t v119 = (void *)v42;
          uint64_t v120 = v21;
          unint64_t v118 = v50;
          if (v42)
          {
            objc_msgSend_stringWithFormat_(NSString, v51, @"%@:%@", v52, v50, v42);
            id v53 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v53 = v50;
          }
          unint64_t v117 = v53;
          long long v127 = 0u;
          long long v128 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          __int16 v57 = objc_msgSend_fieldMatches(v122, v54, v55, v56);
          uint64_t v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v58, (uint64_t)&v125, (uint64_t)v129, 16);
          if (v59)
          {
            uint64_t v63 = v59;
            id v64 = 0;
            uint64_t v65 = *(void *)v126;
            do
            {
              for (uint64_t i = 0; i != v63; ++i)
              {
                if (*(void *)v126 != v65) {
                  objc_enumerationMutation(v57);
                }
                uint64_t v67 = objc_msgSend_entityFieldInfo(*(void **)(*((void *)&v125 + 1) + 8 * i), v60, v61, v62);
                unint64_t v68 = sub_25C80E5BC(v67);
                uint64_t v72 = objc_msgSend_fieldType(v68, v69, v70, v71);

                uint64_t v75 = objc_msgSend_descriptionForTypeIdentifier_(MEMORY[0x263F50070], v73, v72, v74);
                unsigned int v78 = v75;
                if (v64)
                {
                  uint64_t v79 = objc_msgSend_stringByAppendingFormat_(v64, v76, @"|%@", v77, v75);

                  id v64 = (id)v79;
                }
                else
                {
                  id v64 = v75;
                }
              }
              uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v57, v60, (uint64_t)&v125, (uint64_t)v129, 16);
            }
            while (v63);
          }
          else
          {
            id v64 = 0;
          }

          uint64_t v85 = objc_msgSend_personaIdentifier(v121, v80, v81, v82);
          if (v85)
          {
            objc_msgSend_stringWithFormat_(NSString, v83, @" persona: %@", v84, v85);
            id v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v86 = &stru_2709E04D0;
          }
          uint64_t v87 = sub_25C80E2A0(v122);
          uint64_t v91 = objc_msgSend_sourceItemIdentifier(v87, v88, v89, v90);

          if (v91)
          {
            objc_msgSend_stringWithFormat_(NSString, v92, @" sourceItemIdentifier: \"%@\"", v93, v91);
            int v94 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            int v94 = &stru_2709E04D0;
          }
          objc_msgSend_stringWithFormat_(NSString, v92, @" source: %@ match: %@%@%@", v93, v117, v64, v86, v94);
          uint64_t v33 = (__CFString *)objc_claimAutoreleasedReturnValue();

          float v13 = v115;
          id v5 = v116;
          uint64_t v21 = v120;
        }
        int v95 = NSString;
        unint64_t v19 = (v124 + 1);
        uint64_t v96 = objc_msgSend_spanInfo(v21, v30, v31, v32);
        unsigned int v100 = SEMEntityTypeDescription(v123, v97, v98, v99);
        double v103 = objc_msgSend_stringWithFormat_(v95, v101, @"%u.\t%@\n\tEntity type: %@%@", v102, v19, v96, v100, v33);
        objc_msgSend_addObject_(v13, v104, (uint64_t)v103, v105);

        unint64_t v109 = objc_msgSend_count(v5, v106, v107, v108);
        int v20 = v124 + 1;
      }
      while (v109 > v19);
    }
    unsigned int v110 = NSString;
    float v111 = objc_msgSend_componentsJoinedByString_(v13, v17, @"\n\n", v18);
    objc_msgSend_stringWithFormat_(v110, v112, @"\n\n%@\n_", v113, v111);
    uint64_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

uint64_t sub_25C817160(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_fieldMatches(a1, a2, a3, a4);
  uint64_t v8 = objc_msgSend_firstObject(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_entityFieldInfo(v8, v9, v10, v11);
  float v13 = sub_25C80E5BC(v12);

  if (v13) {
    uint64_t v17 = objc_msgSend_fieldType(v13, v14, v15, v16);
  }
  else {
    uint64_t v17 = (unsigned __int16)*MEMORY[0x263F316D0];
  }

  return v17;
}

id sub_25C8171E8(__int16 a1, __int16 a2)
{
  __int16 v10 = a1;
  __int16 v9 = a2;
  id v2 = objc_alloc(MEMORY[0x263EFF990]);
  id v5 = objc_msgSend_initWithLength_(v2, v3, 4, v4);
  objc_msgSend_replaceBytesInRange_withBytes_(v5, v6, 0, 2, &v10);
  objc_msgSend_replaceBytesInRange_withBytes_(v5, v7, 2, 2, &v9);
  return v5;
}

uint64_t sub_25C818920(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4) == 4)
  {
    id v5 = v1;
    __int16 v9 = (unsigned __int16 *)objc_msgSend_bytes(v5, v6, v7, v8);
  }
  else
  {
    __int16 v9 = (unsigned __int16 *)MEMORY[0x263F316D0];
  }
  uint64_t v10 = *v9;

  return v10;
}

uint64_t sub_25C818974(void *a1)
{
  id v1 = a1;
  if (objc_msgSend_length(v1, v2, v3, v4) == 4)
  {
    id v5 = v1;
    __int16 v9 = (unsigned __int16 *)(objc_msgSend_bytes(v5, v6, v7, v8) + 2);
  }
  else
  {
    __int16 v9 = (unsigned __int16 *)MEMORY[0x263F316D0];
  }
  uint64_t v10 = *v9;

  return v10;
}

uint64_t sub_25C818A5C(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  objc_msgSend_score(v6, v8, v9, v10);
  float v12 = v11;
  objc_msgSend_score(v7, v13, v14, v15);
  if (v12 < v19) {
    goto LABEL_5;
  }
  objc_msgSend_score(v6, v16, v17, v18);
  float v21 = v20;
  objc_msgSend_score(v7, v22, v23, v24);
  if (v21 > v28)
  {
    uint64_t v29 = -1;
    goto LABEL_6;
  }
  uint64_t v30 = objc_msgSend_spanInfo(v6, v25, v26, v27);
  objc_msgSend_matchScore(v30, v31, v32, v33);
  float v35 = v34;
  uint64_t v39 = objc_msgSend_spanInfo(v7, v36, v37, v38);
  objc_msgSend_matchScore(v39, v40, v41, v42);
  float v44 = v43;

  if (v35 < v44)
  {
LABEL_5:
    uint64_t v29 = 1;
    goto LABEL_6;
  }
  uint64_t v49 = objc_msgSend_spanInfo(v6, v45, v46, v47);
  objc_msgSend_matchScore(v49, v50, v51, v52);
  float v54 = v53;
  uint64_t v58 = objc_msgSend_spanInfo(v7, v55, v56, v57);
  objc_msgSend_matchScore(v58, v59, v60, v61);
  float v63 = v62;

  if (v54 <= v63) {
    uint64_t v29 = 0;
  }
  else {
    uint64_t v29 = -1;
  }
LABEL_6:

  return v29;
}

id sub_25C81C6B4(void *a1)
{
  id v1 = a1;
  id v5 = v1;
  if (v1)
  {
    id v6 = v1;
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v2, v3, v4);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v7 = v6;

  return v7;
}

id sub_25C81C710(int a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = sqlite3_errstr(a1);
    if (v4)
    {
      uint64_t v5 = (uint64_t)v4;
      id v6 = [NSString alloc];
      uint64_t v9 = objc_msgSend_initWithUTF8String_(v6, v7, v5, v8);
      id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      id v13 = v10;
      if (v9)
      {
        objc_msgSend_setObject_forKey_(v10, v11, (uint64_t)v9, *MEMORY[0x263F08320]);
      }
    }
    else
    {
      id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    }
    uint64_t v15 = objc_msgSend_numberWithInt_(NSNumber, v11, a2, v12);
    objc_msgSend_setObject_forKey_(v13, v16, (uint64_t)v15, @"SEMSQLiteAPIErrorExtendedCode");

    uint64_t v17 = (void *)MEMORY[0x263F087E8];
    float v21 = objc_msgSend_copy(v13, v18, v19, v20);
    uint64_t v14 = objc_msgSend_errorWithDomain_code_userInfo_(v17, v22, @"com.apple.siri.vocabulary.sqlite.api", a1, v21);
  }
  else
  {
    uint64_t v14 = 0;
  }
  uint64_t v23 = sub_25C81C6B4(v14);

  return v23;
}

id sub_25C81D72C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a1;
  id v10 = [SEMDatabaseExecutionResult alloc];
  uint64_t v11 = mach_absolute_time();
  id v13 = objc_msgSend_initWithCommand_beginMachTime_endMachTime_rowValueTuples_error_(v10, v12, (uint64_t)v9, a2, v11, v8, v7);

  return v13;
}

void sub_25C81DB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C81DD3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C81DEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void sub_25C81DFA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C81E6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,char *a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (v32) {
    (*(void (**)(uint64_t))(*(void *)v32 + 16))(v32);
  }
  a22 = &a24;
  sub_25C7D1010((void ***)&a22);
  if (a32 < 0) {
    operator delete(__p);
  }
  if (a19 < 0) {
    operator delete(a14);
  }

  _Unwind_Resume(a1);
}

void sub_25C81E8BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_25C81E8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_addTokenWithValue_cleanValue_normalizedValues_beginIndex_endIndex_isSignificant_isWhitespace_, a3, a4);
}

uint64_t sub_25C81E95C(uint64_t a1)
{
  id v2 = *(morphun::Token **)(a1 + 16);
  if (v2)
  {
    Next = (const Token *)morphun::Token::getNext(v2);
    uint64_t v4 = *(const Token **)(a1 + 16);
  }
  else
  {
    uint64_t v4 = 0;
    Next = 0;
  }
  morphun::TokenIterator::TokenIterator((morphun::TokenIterator *)&v6, Next, v4);
  return v6;
}

uint64_t sub_25C81E9B0(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_25C7D06B8();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  if (v9) {
    id v10 = (char *)sub_25C7D0D58(v7, v9);
  }
  else {
    id v10 = 0;
  }
  uint64_t v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  uint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_25C7D059C(v11, *(void **)a2, *((void *)a2 + 1));
    uint64_t v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v11 = v12;
  }
  uint64_t v16 = v11 + 24;
  sub_25C7D0CE0(a1, v15);
  uint64_t v13 = a1[1];
  sub_25C7D0EC0((uint64_t)v15);
  return v13;
}

void sub_25C81EAC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  sub_25C7D0EC0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_25C81EB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C81EB6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_25C81EB80(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  objc_msgSend_refresh((void *)qword_26B3549E8, a2, a3, a4);
  int BoolTrialValueForTrialCli_withFactor_andNamespaceName = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v4, qword_26B3549E8, @"useContactAliasSpanMatches", @"SIRI_VALUE_INFERENCE_ENTITY_MATCHER");
  uint64_t v45 = BoolTrialValueForTrialCli_withFactor_andNamespaceName | objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v6, qword_26B3549E8, @"useContactAliasSpanMatches", @"SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION");
  int v8 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v7, qword_26B3549E8, @"useContactEmojiSpanMatches", @"SIRI_VALUE_INFERENCE_ENTITY_MATCHER");
  if (v8 | objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v9, qword_26B3549E8, @"useContactEmojiSpanMatches", @"SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION"))uint64_t v11 = 256; {
  else
  }
    uint64_t v11 = 0;
  int v12 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v10, qword_26B3549E8, @"useContactTokenNormalizationForIndexing", @"SIRI_VALUE_INFERENCE_ENTITY_MATCHER");
  if (v12 | objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v13, qword_26B3549E8, @"useContactTokenNormalizationForIndexing", @"SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION"))uint64_t v15 = 0x10000; {
  else
  }
    uint64_t v15 = 0;
  int v16 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v14, qword_26B3549E8, @"useContactPrefixSpanMatches", @"SIRI_VALUE_INFERENCE_ENTITY_MATCHER");
  if (v16 | objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v17, qword_26B3549E8, @"useContactPrefixSpanMatches", @"SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION"))unint64_t v19 = 0x1000000; {
  else
  }
    unint64_t v19 = 0;
  if (objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v18, qword_26B3549E8, @"useTokenLemmatization", @"SIRI_VALUE_INFERENCE_ENTITY_MATCHER"))unint64_t v21 = 0x10000000000; {
  else
  }
    unint64_t v21 = 0;
  int v22 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v20, qword_26B3549E8, @"useContactPhoneticSearch", @"SIRI_VALUE_INFERENCE_ENTITY_MATCHER");
  int v24 = objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v23, qword_26B3549E8, @"useContactPhoneticSearch", @"SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION");
  int v26 = v22 | v24;
  uint64_t v27 = 0x100000000;
  if (v26) {
    uint64_t v28 = 0x100000000;
  }
  else {
    uint64_t v28 = 0;
  }
  int v43 = HIDWORD(v28);
  unint64_t v44 = v11;
  uint64_t v29 = v11 | v45;
  unint64_t v30 = v15;
  _X20 = v29 | v15 | v19 | v21 | v28;
  if (v24) {
    unsigned int LongTrialValueForTrialCli_withFactor_andNamespaceName = objc_msgSend_getLongTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v25, qword_26B3549E8, @"phoneticSearchNgramOrder", @"SIRI_VALUE_INFERENCE_CONTACT_RESOLUTION");
  }
  else {
    unsigned int LongTrialValueForTrialCli_withFactor_andNamespaceName = objc_msgSend_getLongTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v25, qword_26B3549E8, @"phoneticSearchNgramOrder", @"SIRI_VALUE_INFERENCE_ENTITY_MATCHER");
  }
  unsigned int v34 = LongTrialValueForTrialCli_withFactor_andNamespaceName;
  if (!objc_msgSend_getBoolTrialValueForTrialCli_withFactor_andNamespaceName_(SEMTrialUtilities, v33, qword_26B3549E8, @"useMediaThresholdFiltering", @"SIRI_VALUE_INFERENCE_ENTITY_MATCHER"))uint64_t v27 = 0; {
  *(void *)long long buf = _X20;
  }
  *(void *)&buf[8] = v27 & 0xFFFFFFFF00000000 | v34;
  uint64_t v35 = qword_26B3549B0;
  do
  {
    _X3 = unk_26B3549B8;
    __asm { CASPAL          X2, X3, X20, X21, [X8] }
    _ZF = _X2 == v35;
    uint64_t v35 = _X2;
  }
  while (!_ZF);
  uint64_t v42 = qword_26B3549D8;
  if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136317186;
    *(void *)&uint8_t buf[4] = "_refreshTrialFactors";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v45;
    __int16 v47 = 1024;
    int v48 = v44 >> 8;
    __int16 v49 = 1024;
    int v50 = v30 >> 16;
    __int16 v51 = 1024;
    int v52 = v19 >> 24;
    __int16 v53 = 1024;
    int v54 = v43;
    __int16 v55 = 1024;
    int v56 = v21 >> 40;
    __int16 v57 = 1024;
    unsigned int v58 = v34;
    __int16 v59 = 1024;
    int v60 = HIDWORD(v27);
    _os_log_debug_impl(&dword_25C7CA000, v42, OS_LOG_TYPE_DEBUG, "%s Trial factors refreshed. use_contact_aliases: %d, use_contact_emoji_matches: %d, use_contact_diacritics_stripping: %d, use_contact_prefix_matching: %d, use_contact_phonetic_search: %d, use_token_lemmatization: %d, phonetic_search_n_gram_order: %d, use_media_threshold_filtering: %d", buf, 0x3Cu);
  }
}

unint64_t sub_25C81EEE4()
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (qword_26B3549F0 != -1) {
    dispatch_once(&qword_26B3549F0, &unk_2709E0450);
  }
  *(_DWORD *)keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"use_contact_alias_span_matches", @"com.apple.siri.vocabulary", &keyExistsAndHasValidFormat[3]);
  int v1 = CFPreferencesGetAppBooleanValue(@"use_contact_phonetic_search", @"com.apple.siri.vocabulary", &keyExistsAndHasValidFormat[2]);
  int v2 = CFPreferencesGetAppBooleanValue(@"use_media_threshold_filtering", @"com.apple.siri.vocabulary", keyExistsAndHasValidFormat);
  int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"phonetic_ngram_order", @"com.apple.siri.vocabulary", &keyExistsAndHasValidFormat[1]);
  if (keyExistsAndHasValidFormat[3]
    || keyExistsAndHasValidFormat[2]
    || keyExistsAndHasValidFormat[1]
    || keyExistsAndHasValidFormat[0])
  {
    uint64_t v13 = qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136316162;
      unint64_t v19 = "SEMGetTrialFactors";
      __int16 v20 = 1024;
      int v21 = AppBooleanValue;
      __int16 v22 = 1024;
      int v23 = v1;
      __int16 v24 = 1024;
      int v25 = AppIntegerValue;
      __int16 v26 = 1024;
      int v27 = v2;
      _os_log_debug_impl(&dword_25C7CA000, v13, OS_LOG_TYPE_DEBUG, "%s Some trial factors were overridden by user default. use_contact_aliases: %d, use_contact_phonetic_search: %d, phonetic_ngram_order: %d, use_media_threshold_filtering: %d", buf, 0x24u);
    }
    _X0 = 0;
    _X1 = 0;
    __asm { CASPAL          X0, X1, X0, X1, [X8] }
    unint64_t v11 = HIDWORD(_X0);
    if (keyExistsAndHasValidFormat[3]) {
      BOOL v12 = AppBooleanValue != 0;
    }
    else {
      BOOL v12 = _X0;
    }
    if (keyExistsAndHasValidFormat[2]) {
      LOBYTE(v11) = v1 != 0;
    }
  }
  else
  {
    _X0 = 0;
    _X1 = 0;
    __asm { CASPAL          X0, X1, X0, X1, [X8] }
    unint64_t v11 = HIDWORD(_X0);
    BOOL v12 = _X0;
  }
  return _X0 & 0xFFFFFF00FFFFFF00 | ((unint64_t)v11 << 32) | v12;
}

id sub_25C81F114(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = objc_msgSend_clientWithIdentifier_(MEMORY[0x263F80E18], a2, 112, a4);
  unint64_t v5 = (void *)qword_26B3549E8;
  qword_26B3549E8 = v4;

  uint64_t v6 = CFPreferencesAppSynchronize(@"com.apple.siri.vocabulary");
  sub_25C81EB80(v6, v7, v8, v9);
  return (id)objc_msgSend_addUpdateHandlerForNamespaceName_usingBlock_((void *)qword_26B3549E8, v10, @"SIRI_VALUE_INFERENCE_ENTITY_MATCHER", (uint64_t)&unk_2709E0470);
}

void sub_25C81F184()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v0 = qword_26B3549D8;
  BOOL v1 = os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_DEBUG);
  if (v1)
  {
    int v5 = 136315138;
    uint64_t v6 = "SEMGetTrialFactors_block_invoke_2";
    _os_log_debug_impl(&dword_25C7CA000, v0, OS_LOG_TYPE_DEBUG, "%s Trial updates detected. Refreshing trial factor levels", (uint8_t *)&v5, 0xCu);
  }
  sub_25C81EB80(v1, v2, v3, v4);
}

unint64_t sub_25C81F234()
{
  unsigned int v0 = sub_25C81EEE4();
  unsigned int v1 = (sub_25C81EEE4() >> 15) & 2 | HIBYTE(v0) & 1;
  unint64_t v2 = (sub_25C81EEE4() >> 30) & 4;
  return v1 | v2 | (sub_25C81EEE4() >> 37) & 8;
}

void sub_25C81F288(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v7 = v3;
  if (a1 && v3) {
    *a1 = v3;
  }
  uint64_t v8 = objc_msgSend_domain(v7, v4, v5, v6);
  uint64_t v12 = objc_msgSend_length(v8, v9, v10, v11);

  if (v12)
  {
    id v13 = v7;
    AnalyticsSendEventLazy();
  }
}

id sub_25C81F35C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v41[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend_underlyingErrors(*(void **)(a1 + 32), a2, a3, a4);
  uint64_t v9 = objc_msgSend_firstObject(v5, v6, v7, v8);

  id v13 = objc_msgSend_description(*(void **)(a1 + 32), v10, v11, v12);
  v40[0] = @"domain";
  uint64_t v17 = objc_msgSend_domain(*(void **)(a1 + 32), v14, v15, v16);
  v41[0] = v17;
  v40[1] = @"code";
  uint64_t v18 = NSNumber;
  uint64_t v22 = objc_msgSend_code(*(void **)(a1 + 32), v19, v20, v21);
  uint64_t v28 = objc_msgSend_numberWithInteger_(v18, v23, v22, v24);
  v41[1] = v28;
  v40[2] = @"underlyingCode";
  if (v9)
  {
    uint64_t v29 = NSNumber;
    uint64_t v30 = objc_msgSend_code(v9, v25, v26, v27);
    objc_msgSend_numberWithInteger_(v29, v31, v30, v32);
  }
  else
  {
    objc_msgSend_null(MEMORY[0x263EFF9D0], v25, v26, v27);
  uint64_t v36 = };
  v41[2] = v36;
  v40[3] = @"description";
  uint64_t v37 = v13;
  if (!v13)
  {
    uint64_t v37 = objc_msgSend_null(MEMORY[0x263EFF9D0], v33, v34, v35);
  }
  v41[3] = v37;
  uint64_t v38 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v33, (uint64_t)v41, (uint64_t)v40, 4);
  if (!v13) {

  }
  return v38;
}

void sub_25C81F938(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_INFO))
    {
      int v6 = *(unsigned __int16 *)(a1 + 40);
      uint64_t v7 = v3;
      uint64_t v11 = objc_msgSend_clientId(WeakRetained, v8, v9, v10);
      int v14 = 136315650;
      uint64_t v15 = "-[SEMXPCClient _failureHandlerWithResponse:]_block_invoke";
      __int16 v16 = 1024;
      int v17 = v6;
      __int16 v18 = 2112;
      unint64_t v19 = v11;
      _os_log_impl(&dword_25C7CA000, v7, OS_LOG_TYPE_INFO, "%s XPC connection terminated (%u) for client %@", (uint8_t *)&v14, 0x1Cu);
    }
    objc_msgSend_setFailureCode_(WeakRetained, v4, *(unsigned __int16 *)(a1 + 40), v5);
    objc_msgSend_setConnection_(WeakRetained, v12, 0, v13);
  }
}

void sub_25C81FB38(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v5 = (void *)qword_26B3549D8;
    if (os_log_type_enabled((os_log_t)qword_26B3549D8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = v5;
      unint64_t v19 = objc_msgSend_clientId(WeakRetained, v16, v17, v18);
      int v20 = 136315650;
      uint64_t v21 = "-[SEMXPCClient _errorHandlerWithCompletion:]_block_invoke";
      __int16 v22 = 2112;
      id v23 = v3;
      __int16 v24 = 2112;
      int v25 = v19;
      _os_log_error_impl(&dword_25C7CA000, v15, OS_LOG_TYPE_ERROR, "%s XPC request hit error (%@) for client %@", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v9 = objc_msgSend_interruptionCode(WeakRetained, v6, v7, v8);
    objc_msgSend_setFailureCode_(WeakRetained, v10, v9, v11);
    objc_msgSend_setConnection_(WeakRetained, v12, 0, v13);
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v14, v9);
  }
}

uint64_t sub_25C81FE04(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_25C81FF00(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, 0);
  }
  return result;
}

uint64_t sub_25C81FFF8(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

uint64_t sub_25C820154(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, int a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  morphun::util::LocaleUtils::toLocale();
  *(void *)(a1 + 128) = 0;
  uint64_t v8 = (uint64_t *)(a1 + 128);
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 136) = 0;
  if (a3)
  {
    sub_25C7D0AE0(__p, a3);
    morphun::resources::DataRegistrationService::registerDataPathForLocale();
    if (SHIBYTE(v19) < 0) {
      operator delete(*(void **)__p);
    }
    uint64_t v9 = qword_26B3549C0;
    if (os_log_type_enabled((os_log_t)qword_26B3549C0, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = (void *)(a1 + 8);
      if (*(char *)(a1 + 31) < 0) {
        uint64_t v15 = (void *)*v15;
      }
      *(_DWORD *)int __p = 136315650;
      *(void *)&__p[4] = "Tokenizer";
      __int16 v17 = 2080;
      uint64_t v18 = v15;
      __int16 v19 = 2080;
      int v20 = a3;
      _os_log_debug_impl(&dword_25C7CA000, v9, OS_LOG_TYPE_DEBUG, "%s Registered Morphun assets from Trial for %s : %s", __p, 0x20u);
    }
  }
  if (*(char *)(a1 + 31) < 0)
  {
    uint64_t v10 = *(_WORD **)(a1 + 8);
    uint64_t v11 = *(void *)(a1 + 16);
  }
  else
  {
    uint64_t v10 = (_WORD *)(a1 + 8);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 31);
  }
  if (v11 != 2 || *v10 != 28261) {
    operator new();
  }
  uint64_t Tokenizer = morphun::TokenizerFactory::createTokenizer();
  uint64_t v14 = *v8;
  *uint64_t v8 = Tokenizer;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 16))(v14);
  }
  if (a5) {
    operator new();
  }
  return a1;
}

void sub_25C82040C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, int a10, __int16 a11, uint64_t a12, char a13, char a14, uint64_t a15)
{
  MEMORY[0x261194470](v16, 0x10F3C40F4CE41AFLL);
  uint64_t v19 = *((void *)v15 + 19);
  *((void *)v15 + 19) = 0;
  if (v19) {
    (*(void (**)(uint64_t))(*(void *)v19 + 16))(v19);
  }
  uint64_t v20 = *((void *)v15 + 17);
  *((void *)v15 + 17) = 0;
  if (v20) {
    (*(void (**)(uint64_t))(*(void *)v20 + 16))(v20);
  }
  uint64_t v21 = *v17;
  *__int16 v17 = 0;
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 16))(v21);
  }
  morphun::util::ULocale::~ULocale(v15);
  _Unwind_Resume(a1);
}

void sub_25C82059C(uint64_t a1, uint64_t *a2, void *__src, unint64_t a4, int a5)
{
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_25C7D00F4();
  }
  if (a4 >= 0xB)
  {
    uint64_t v9 = (a4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a4 | 3) != 0xB) {
      uint64_t v9 = a4 | 3;
    }
    uint64_t v8 = (void **)sub_25C7D04E8((uint64_t)__dst, v9 + 1);
    __dst[1] = (void *)a4;
    unint64_t v87 = v10 | 0x8000000000000000;
    __dst[0] = v8;
  }
  else
  {
    HIBYTE(v87) = a4;
    uint64_t v8 = __dst;
    if (!a4) {
      goto LABEL_9;
    }
  }
  memmove(v8, __src, 2 * a4);
LABEL_9:
  *((_WORD *)v8 + a4) = 0;
  unsigned int v83 = 0;
  uint64_t v84 = 0;
  unint64_t v85 = 0;
  if (*(char *)(a1 + 31) < 0)
  {
    uint64_t v11 = *(_WORD **)(a1 + 8);
    uint64_t v12 = *(void *)(a1 + 16);
  }
  else
  {
    uint64_t v11 = (_WORD *)(a1 + 8);
    uint64_t v12 = *(unsigned __int8 *)(a1 + 31);
  }
  if (v12 == 2 && *v11 == 28261) {
    uint64_t v13 = (uint64_t (**)(void))(**(void **)(a1 + 128) + 24);
  }
  else {
    uint64_t v13 = (uint64_t (**)(void))(**(void **)(a1 + 144) + 64);
  }
  uint64_t v14 = (const Token **)(*v13)();
  if (*(void *)(a1 + 152)) {
    uint64_t v81 = (const Token **)(*(uint64_t (**)(void, const Token **))(**(void **)(a1 + 160) + 72))(*(void *)(a1 + 160), v14);
  }
  else {
    uint64_t v81 = 0;
  }
  uint64_t v15 = (morphun::TokenIterator *)morphun::TokenIterator::TokenIterator((morphun::TokenIterator *)&v93, v14[1], v14[2]);
  if (v81) {
    morphun::TokenIterator::TokenIterator(v15, v81[1], v81[2]);
  }
  else {
    morphun::TokenIterator::TokenIterator(v15, v14[1], v14[2]);
  }
  uint64_t v79 = v14;
  while (1)
  {
    *(void *)&long long v93 = sub_25C81E95C((uint64_t)v14);
    *((void *)&v93 + 1) = v16;
    if (!morphun::TokenIterator::operator!=()) {
      break;
    }
    __int16 v17 = (morphun::Token *)morphun::TokenIterator::operator->();
    if ((morphun::Token::isHead(v17) & 1) == 0)
    {
      uint64_t v18 = (morphun::Token *)morphun::TokenIterator::operator->();
      if ((morphun::Token::isTail(v18) & 1) == 0)
      {
        if (v81)
        {
          while (1)
          {
            uint64_t v19 = morphun::TokenIterator::operator->();
            int v20 = (*(uint64_t (**)(uint64_t))(*(void *)v19 + 24))(v19);
            uint64_t v21 = morphun::TokenIterator::operator->();
            if (v20 >= (*(int (**)(uint64_t))(*(void *)v21 + 24))(v21))
            {
              __int16 v22 = (morphun::Token *)morphun::TokenIterator::operator->();
              if (!morphun::Token::isHead(v22)) {
                break;
              }
            }
            morphun::TokenIterator::operator++();
          }
          id v23 = v83;
          for (uint64_t i = v84; i != v23; i -= 3)
          {
            if (*((char *)i - 1) < 0) {
              operator delete(*(i - 3));
            }
          }
          uint64_t v84 = v23;
          uint64_t v14 = v79;
          while (1)
          {
            uint64_t v25 = morphun::TokenIterator::operator->();
            int v26 = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 24))(v25);
            uint64_t v27 = morphun::TokenIterator::operator->();
            if (v26 > (*(int (**)(uint64_t))(*(void *)v27 + 24))(v27)) {
              break;
            }
            uint64_t v28 = morphun::TokenIterator::operator->();
            int v29 = (*(uint64_t (**)(uint64_t))(*(void *)v28 + 32))(v28);
            uint64_t v30 = morphun::TokenIterator::operator->();
            if (v29 < (*(int (**)(uint64_t))(*(void *)v30 + 32))(v30)) {
              break;
            }
            uint64_t v31 = (morphun::Token *)morphun::TokenIterator::operator->();
            uint64_t Value = morphun::Token::getValue(v31);
            uint64_t v33 = (morphun::Token *)morphun::TokenIterator::operator->();
            uint64_t v34 = morphun::Token::getValue(v33);
            uint64_t v35 = *(unsigned __int8 *)(Value + 23);
            int v36 = (char)v35;
            if ((v35 & 0x80u) != 0) {
              uint64_t v35 = *(void *)(Value + 8);
            }
            uint64_t v37 = *(unsigned __int8 *)(v34 + 23);
            int v38 = (char)v37;
            if ((v37 & 0x80u) != 0) {
              uint64_t v37 = *(void *)(v34 + 8);
            }
            if (v35 != v37) {
              break;
            }
            if (v35)
            {
              if (v36 >= 0) {
                uint64_t v39 = (unsigned __int16 *)Value;
              }
              else {
                uint64_t v39 = *(unsigned __int16 **)Value;
              }
              if (v38 >= 0) {
                uint64_t v40 = (unsigned __int16 *)v34;
              }
              else {
                uint64_t v40 = *(unsigned __int16 **)v34;
              }
              while (*v40 == *v39)
              {
                ++v39;
                ++v40;
                if (!--v35) {
                  goto LABEL_51;
                }
              }
              break;
            }
LABEL_51:
            uint64_t v41 = (morphun::Token *)morphun::TokenIterator::operator->();
            Cleanuint64_t Value = morphun::Token::getCleanValue(v41);
            int v43 = (long long *)v84;
            if ((unint64_t)v84 >= v85)
            {
              uint64_t v45 = (void **)sub_25C81E9B0((uint64_t *)&v83, (long long *)CleanValue);
            }
            else
            {
              if (*(char *)(CleanValue + 23) < 0)
              {
                sub_25C7D059C(v84, *(void **)CleanValue, *(void *)(CleanValue + 8));
              }
              else
              {
                long long v44 = *(_OWORD *)CleanValue;
                v84[2] = *(void **)(CleanValue + 16);
                long long *v43 = v44;
              }
              uint64_t v45 = (void **)v43 + 3;
            }
            uint64_t v84 = v45;
            morphun::TokenIterator::operator++();
          }
        }
        uint64_t v46 = (morphun::Token *)morphun::TokenIterator::operator*();
        long long v93 = 0u;
        long long v94 = 0u;
        uint64_t v95 = 0x100003F800000;
        __int16 v96 = 3;
        int v97 = 0;
        uint64_t v47 = morphun::Token::getValue(v46);
        int v48 = *(char *)(v47 + 23);
        if (v48 >= 0) {
          __int16 v49 = (void *)v47;
        }
        else {
          __int16 v49 = *(void **)v47;
        }
        if (v48 >= 0) {
          unint64_t v50 = *(unsigned __int8 *)(v47 + 23);
        }
        else {
          unint64_t v50 = *(void *)(v47 + 8);
        }
        uint64_t v51 = morphun::Token::getCleanValue(v46);
        int v52 = *(char *)(v51 + 23);
        if (v52 >= 0) {
          __int16 v53 = (void *)v51;
        }
        else {
          __int16 v53 = *(void **)v51;
        }
        if (v52 >= 0) {
          unint64_t v54 = *(unsigned __int8 *)(v51 + 23);
        }
        else {
          unint64_t v54 = *(void *)(v51 + 8);
        }
        unsigned int v55 = (*(uint64_t (**)(morphun::Token *))(*(void *)v46 + 24))(v46);
        uint64_t v56 = (*(uint64_t (**)(morphun::Token *))(*(void *)v46 + 32))(v46);
        int isWhitespace = morphun::Token::isWhitespace(v46);
        char isSignificant = morphun::Token::isSignificant(v46);
        if (sub_25C820E74((uint64_t)&v93, v49, v50, v53, v54, v55, v56, isWhitespace, isSignificant)) {
          sub_25C7D65DC(a2, &v93);
        }
        if (a5)
        {
          int v60 = v83;
          __int16 v59 = v84;
          if (v84 != v83)
          {
            *(_OWORD *)int __p = 0u;
            long long v89 = 0u;
            uint64_t v90 = 0x100003F800000;
            __int16 v91 = 3;
            int v92 = 0;
            do
            {
              uint64_t v61 = morphun::Token::getValue(v46);
              int v62 = *(char *)(v61 + 23);
              if (v62 >= 0) {
                float v63 = (unsigned __int16 *)v61;
              }
              else {
                float v63 = *(unsigned __int16 **)v61;
              }
              if (v62 >= 0) {
                id v64 = (char *)*(unsigned __int8 *)(v61 + 23);
              }
              else {
                id v64 = *(char **)(v61 + 8);
              }
              if (*((char *)v60 + 23) < 0)
              {
                __int16 v66 = (unsigned __int16 *)*v60;
                uint64_t v65 = (char *)v60[1];
              }
              else
              {
                uint64_t v65 = (char *)*((unsigned __int8 *)v60 + 23);
                __int16 v66 = (unsigned __int16 *)v60;
              }
              char v67 = morphun::Token::isWhitespace(v46);
              if (v65) {
                char v68 = v67;
              }
              else {
                char v68 = 1;
              }
              if ((v68 & 1) == 0)
              {
                if (v65 == v64)
                {
                  while (*v63 == *v66)
                  {
                    ++v66;
                    ++v63;
                    if (!--v64) {
                      goto LABEL_103;
                    }
                  }
                }
                uint64_t v69 = morphun::Token::getValue(v46);
                int v70 = *(char *)(v69 + 23);
                if (v70 >= 0) {
                  uint64_t v71 = (void *)v69;
                }
                else {
                  uint64_t v71 = *(void **)v69;
                }
                if (v70 >= 0) {
                  unint64_t v72 = *(unsigned __int8 *)(v69 + 23);
                }
                else {
                  unint64_t v72 = *(void *)(v69 + 8);
                }
                if (*((char *)v60 + 23) < 0)
                {
                  uint64_t v74 = *v60;
                  unint64_t v73 = (unint64_t)v60[1];
                }
                else
                {
                  unint64_t v73 = *((unsigned __int8 *)v60 + 23);
                  uint64_t v74 = v60;
                }
                unsigned int v75 = (*(uint64_t (**)(morphun::Token *))(*(void *)v46 + 24))(v46);
                uint64_t v76 = (*(uint64_t (**)(morphun::Token *))(*(void *)v46 + 32))(v46);
                int v77 = morphun::Token::isWhitespace(v46);
                char v78 = morphun::Token::isSignificant(v46);
                if (sub_25C820E74((uint64_t)__p, v71, v72, v74, v73, v75, v76, v77, v78)) {
                  sub_25C7D65DC(a2, (long long *)__p);
                }
              }
LABEL_103:
              v60 += 3;
            }
            while (v60 != v59);
            if (SBYTE7(v89) < 0) {
              operator delete(__p[0]);
            }
            uint64_t v14 = v79;
          }
        }
        if (SBYTE7(v94) < 0) {
          operator delete((void *)v93);
        }
      }
    }
    morphun::TokenIterator::operator++();
  }
  if (v81) {
    (*((void (**)(const Token **))*v81 + 2))(v81);
  }
  if (v14) {
    (*((void (**)(const Token **))*v14 + 2))(v14);
  }
  *(void *)&long long v93 = &v83;
  sub_25C7D1010((void ***)&v93);
  if (SHIBYTE(v87) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_25C820D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,char *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (v33) {
    (*(void (**)(uint64_t))(*(void *)v33 + 16))(v33);
  }
  a28 = &a19;
  sub_25C7D1010((void ***)&a28);
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_25C820E74(uint64_t a1, void *a2, unint64_t a3, void *__src, unint64_t a5, unsigned int a6, uint64_t a7, int a8, char a9)
{
  if ((a8 & 1) == 0)
  {
    if (a5)
    {
      a2 = __src;
      a3 = a5;
    }
    sub_25C7D08D8((void **)a1, a2, a3);
    *(void *)(a1 + 24) = a6 | (unint64_t)(a7 << 32);
    if ((a9 & 1) == 0)
    {
      *(_WORD *)(a1 + 40) &= 0xFFFCu;
      *(_DWORD *)(a1 + 32) = 0;
    }
  }
  return a8 ^ 1u;
}

uint64_t sub_25C820EEC(int a1)
{
  uint64_t v1 = 2;
  if (a1 <= 26511)
  {
    if (a1 > 14024)
    {
      if (a1 > 16250)
      {
        if (a1 <= 18539)
        {
          if (a1 == 16251) {
            return 3;
          }
          int v3 = 17034;
        }
        else
        {
          if (a1 == 18540) {
            return 3;
          }
          if (a1 == 19668) {
            return v1;
          }
          int v3 = 25883;
        }
      }
      else if (a1 <= 14815)
      {
        if (a1 == 14025) {
          return 3;
        }
        int v3 = 14706;
      }
      else
      {
        if (a1 == 14816 || a1 == 15572) {
          return 3;
        }
        int v3 = 15757;
      }
    }
    else if (a1 > 7821)
    {
      if (a1 <= 12009)
      {
        if (a1 == 7822) {
          return 3;
        }
        int v3 = 8194;
      }
      else
      {
        if (a1 == 12010 || a1 == 12996) {
          return 3;
        }
        int v3 = 13884;
      }
    }
    else
    {
      if (a1 <= 5594)
      {
        if (a1 != 800 && a1 != 3615) {
          return 0;
        }
        return 3;
      }
      if (a1 == 5595 || a1 == 7690) {
        return 3;
      }
      int v3 = 7719;
    }
    goto LABEL_60;
  }
  if (a1 <= 44934)
  {
    if (a1 > 36058)
    {
      if (a1 <= 38250)
      {
        if (a1 == 36059) {
          return 3;
        }
        int v3 = 36434;
      }
      else
      {
        if (a1 == 38251 || a1 == 42184) {
          return 3;
        }
        int v3 = 42611;
      }
    }
    else if (a1 <= 30597)
    {
      if (a1 == 26512) {
        return 3;
      }
      int v3 = 27122;
    }
    else
    {
      if (a1 == 30598 || a1 == 32965) {
        return 3;
      }
      int v3 = 34307;
    }
    goto LABEL_60;
  }
  if (a1 <= 53613)
  {
    if (a1 <= 49065)
    {
      if (a1 == 44935) {
        return 3;
      }
      int v3 = 47341;
    }
    else
    {
      if (a1 == 49066 || a1 == 53482) {
        return 3;
      }
      int v3 = 53601;
    }
LABEL_60:
    if (a1 != v3) {
      return 0;
    }
    return 3;
  }
  if (a1 <= 61508)
  {
    if (a1 != 53614 && a1 != 54385)
    {
      int v2 = 61352;
      goto LABEL_43;
    }
    return 3;
  }
  if (a1 == 61509) {
    return 1;
  }
  if (a1 == 62158) {
    return 3;
  }
  int v2 = 63369;
LABEL_43:
  if (a1 != v2) {
    return 0;
  }
  return v1;
}

uint64_t sub_25C821174(int a1)
{
  if (a1 > 26511)
  {
    if (a1 > 44934)
    {
      if (a1 > 53613)
      {
        if (a1 <= 61508)
        {
          if (a1 != 53614 && a1 != 54385)
          {
            int v1 = 61352;
            goto LABEL_49;
          }
          return 1;
        }
        if (a1 == 63369) {
          return 3;
        }
        if (a1 == 62158) {
          return 1;
        }
        int v1 = 61509;
LABEL_49:
        if (a1 == v1) {
          return 3;
        }
        return 0;
      }
      if (a1 > 49065)
      {
        if (a1 != 49066)
        {
          if (a1 == 53482) {
            return 1;
          }
          int v2 = 53601;
          return a1 == v2;
        }
        return 4;
      }
      if (a1 == 44935) {
        return 1;
      }
      int v2 = 47341;
      return a1 == v2;
    }
    if (a1 <= 36058)
    {
      if (a1 <= 30597)
      {
        if (a1 == 26512) {
          return 1;
        }
        int v1 = 27122;
        goto LABEL_49;
      }
      if (a1 == 30598 || a1 == 32965) {
        return 1;
      }
      int v2 = 34307;
      return a1 == v2;
    }
    if (a1 > 38250)
    {
      if (a1 == 38251) {
        return 1;
      }
      if (a1 == 42184) {
        return 4;
      }
      int v2 = 42611;
      return a1 == v2;
    }
    if (a1 == 36059) {
      return 1;
    }
    if (a1 != 36434) {
      return 0;
    }
    return 6;
  }
  if (a1 > 14024)
  {
    if (a1 <= 16250)
    {
      if (a1 <= 14815)
      {
        if (a1 == 14025) {
          return 1;
        }
        int v2 = 14706;
      }
      else
      {
        if (a1 == 14816 || a1 == 15572) {
          return 1;
        }
        int v2 = 15757;
      }
      return a1 == v2;
    }
    if (a1 > 18539)
    {
      if (a1 == 18540) {
        return 4;
      }
      if (a1 == 19668) {
        return 2;
      }
      int v2 = 25883;
      return a1 == v2;
    }
    if (a1 == 16251) {
      return 1;
    }
    if (a1 != 17034) {
      return 0;
    }
    return 5;
  }
  if (a1 > 7821)
  {
    if (a1 <= 12009)
    {
      if (a1 == 7822) {
        return 1;
      }
      int v2 = 8194;
    }
    else
    {
      if (a1 == 12010 || a1 == 12996) {
        return 1;
      }
      int v2 = 13884;
    }
    return a1 == v2;
  }
  if (a1 > 5594)
  {
    if (a1 == 5595) {
      return 1;
    }
    if (a1 != 7690)
    {
      int v2 = 7719;
      return a1 == v2;
    }
    return 5;
  }
  if (a1 == 800) {
    return 6;
  }
  return a1 == 3615;
}

uint64_t sub_25C82141C(int a1)
{
  uint64_t v1 = 4;
  if (a1 <= 26511)
  {
    if (a1 > 14024)
    {
      if (a1 <= 16250)
      {
        if (a1 > 14815)
        {
          if (a1 == 14816 || a1 == 15572) {
            return 1;
          }
          int v2 = 15757;
          return a1 == v2;
        }
        if (a1 != 14025)
        {
          int v2 = 14706;
          return a1 == v2;
        }
        return 3;
      }
      if (a1 <= 18539)
      {
        if (a1 != 16251)
        {
          int v2 = 17034;
          return a1 == v2;
        }
        return 1;
      }
      if (a1 == 18540) {
        return 1;
      }
      if (a1 != 19668)
      {
        int v2 = 25883;
        return a1 == v2;
      }
      return v1;
    }
    if (a1 <= 7821)
    {
      if (a1 > 5594)
      {
        if (a1 == 5595 || a1 == 7690) {
          return 1;
        }
        int v2 = 7719;
        return a1 == v2;
      }
      if (a1 == 800) {
        return 1;
      }
      if (a1 != 3615) {
        return 0;
      }
      return 3;
    }
    if (a1 > 12009)
    {
      if (a1 != 12010 && a1 != 12996)
      {
        int v2 = 13884;
        return a1 == v2;
      }
      return 3;
    }
    if (a1 != 7822)
    {
      int v3 = 8194;
      goto LABEL_57;
    }
    return 3;
  }
  if (a1 > 44934)
  {
    if (a1 > 53613)
    {
      if (a1 <= 61508)
      {
        if (a1 == 53614 || a1 == 54385) {
          return 1;
        }
        int v2 = 61352;
        return a1 == v2;
      }
      if (a1 != 63369)
      {
        if (a1 == 62158) {
          return 2;
        }
        int v2 = 61509;
        return a1 == v2;
      }
      return 1;
    }
    if (a1 > 49065)
    {
      if (a1 != 49066)
      {
        if (a1 != 53482)
        {
          int v2 = 53601;
          return a1 == v2;
        }
        return 1;
      }
      return 3;
    }
    if (a1 == 44935) {
      return 1;
    }
    int v3 = 47341;
    goto LABEL_57;
  }
  if (a1 > 36058)
  {
    if (a1 > 38250)
    {
      if (a1 == 38251 || a1 == 42184) {
        return 1;
      }
      int v3 = 42611;
      goto LABEL_57;
    }
    if (a1 != 36059)
    {
      int v3 = 36434;
      goto LABEL_57;
    }
    return 3;
  }
  if (a1 > 30597)
  {
    if (a1 == 30598 || a1 == 32965) {
      return 1;
    }
    int v3 = 34307;
LABEL_57:
    if (a1 != v3) {
      return 0;
    }
    return 3;
  }
  if (a1 == 26512) {
    return 1;
  }
  if (a1 != 27122) {
    return 0;
  }
  return v1;
}

uint64_t sub_25C8216B4(int a1)
{
  uint64_t result = 1;
  if (a1 > 19746)
  {
    if (a1 > 44937)
    {
      if (a1 > 53603)
      {
        if (a1 <= 61511)
        {
          if (a1 <= 54387)
          {
            if (a1 == 53604) {
              return result;
            }
            int v3 = 53617;
          }
          else
          {
            if ((a1 - 54388) < 2) {
              return result;
            }
            int v3 = 61355;
          }
        }
        else
        {
          if ((a1 - 62159) < 4 || (a1 - 61512) < 2) {
            return result;
          }
          int v3 = 63372;
        }
      }
      else if (a1 > 49068)
      {
        if ((a1 - 49069) < 5) {
          return result;
        }
        int v3 = 53485;
      }
      else
      {
        if ((a1 - 47347) <= 6 && ((1 << (a1 + 13)) & 0x67) != 0) {
          return result;
        }
        int v3 = 44938;
      }
    }
    else if (a1 <= 34311)
    {
      if (a1 > 26514)
      {
        if (a1 > 30600)
        {
          if (a1 == 30601) {
            return result;
          }
          int v3 = 32968;
        }
        else
        {
          if ((a1 - 27126) <= 6 && ((1 << (a1 + 10)) & 0x61) != 0) {
            return result;
          }
          int v3 = 26515;
        }
      }
      else
      {
        if ((a1 - 19747) <= 0x12 && ((1 << (a1 - 35)) & 0x41805) != 0) {
          return result;
        }
        int v3 = 25886;
      }
    }
    else if (a1 <= 38253)
    {
      if (a1 > 36438)
      {
        if (a1 == 36439) {
          return result;
        }
        int v3 = 36441;
      }
      else
      {
        if (a1 == 34312) {
          return result;
        }
        int v3 = 36064;
      }
    }
    else
    {
      if ((a1 - 42618) < 5 || (a1 - 42188) < 3) {
        return result;
      }
      int v3 = 38254;
    }
  }
  else if (a1 <= 15767)
  {
    if (a1 > 7824)
    {
      if (a1 > 13886)
      {
        if (a1 <= 14708)
        {
          if (a1 == 13887) {
            return result;
          }
          int v3 = 14030;
        }
        else
        {
          if (a1 == 14709 || a1 == 14819) {
            return result;
          }
          int v3 = 15575;
        }
      }
      else if (a1 > 12012)
      {
        if ((a1 - 12999) < 2) {
          return result;
        }
        int v3 = 12013;
      }
      else
      {
        if (a1 == 7825 || a1 == 7830) {
          return result;
        }
        int v3 = 8199;
      }
    }
    else
    {
      if (a1 > 7700)
      {
        unsigned int v4 = a1 - 7701;
        if (v4 > 0x15 || ((1 << v4) & 0x2003BB) == 0) {
          return 0;
        }
        return result;
      }
      if (a1 == 803 || a1 == 3620) {
        return result;
      }
      int v3 = 5598;
    }
  }
  else if (a1 <= 17040)
  {
    if ((a1 - 15768) < 6 || a1 == 16254) {
      return result;
    }
    int v3 = 17037;
  }
  else
  {
    if ((a1 - 18555) < 0xC || (a1 - 19679) <= 0xE && ((1 << (a1 + 33)) & 0x401F) != 0) {
      return result;
    }
    int v3 = 17041;
  }
  if (a1 != v3) {
    return 0;
  }
  return result;
}

BOOL sub_25C821A0C(int a1)
{
  return (a1 - 19679) < 5 || (a1 - 27131) < 2;
}

void sub_25C821A30(uint64_t a1@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  sub_25C8009D0(a1, a2);
  id v8 = objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (const char *)objc_msgSend_UTF8String(v8, v4, v5, v6);
  strlen(v7);
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  skit::to_u16string();
}

void sub_25C821AA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  if (*(char *)(v10 + 23) < 0) {
    operator delete(*(void **)v10);
  }

  _Unwind_Resume(a1);
}

__CFString *sub_25C821ACC(int a1, int a2)
{
  if (a2 == 49073 && (a1 - 1) <= 4) {
    return off_2654DF010[a1 - 1];
  }
  else {
    return 0;
  }
}

void sub_25C821AFC(int a1@<W0>, __int16 a2@<W1>, char a3@<W3>, uint64_t a4@<X8>)
{
  v13[1] = *MEMORY[0x263EF8340];
  if ((a1 - 2) >= 2)
  {
    if (a1 == 5)
    {
      *(_WORD *)(a4 + 16) = 2049;
      *(void *)a4 = a4 + 16;
      uint64_t v9 = 0x800000002;
    }
    else
    {
      *(unsigned char *)(a4 + 16) = -1;
      *(void *)a4 = a4 + 16;
      uint64_t v9 = 0x800000001;
    }
    *(void *)(a4 + 8) = v9;
  }
  else
  {
    uint64_t v11 = v13;
    size_t __n = 0x800000000;
    if (a2)
    {
      char v10 = 2;
      sub_25C821D20((size_t)&v11, &v10);
      char v10 = 3;
      sub_25C821D20((size_t)&v11, &v10);
      char v10 = 4;
      sub_25C821D20((size_t)&v11, &v10);
      if ((a2 & 0x100) != 0)
      {
        char v10 = 5;
        sub_25C821D20((size_t)&v11, &v10);
      }
    }
    if ((a3 & 2) != 0)
    {
      char v10 = 6;
      sub_25C821D20((size_t)&v11, &v10);
    }
    if (a3)
    {
      char v10 = 9;
      sub_25C821D20((size_t)&v11, &v10);
    }
    if ((a3 & 4) != 0)
    {
      char v10 = 7;
      sub_25C821D20((size_t)&v11, &v10);
    }
    size_t v7 = __n;
    if (__n)
    {
      if (v11 == v13)
      {
        *(void *)a4 = a4 + 16;
        id v8 = (_DWORD *)(a4 + 12);
        memcpy((void *)(a4 + 16), v13, v7);
      }
      else
      {
        id v8 = (_DWORD *)&__n + 1;
        *(void *)a4 = v11;
        *(_DWORD *)(a4 + 12) = HIDWORD(__n);
      }
      *id v8 = 8;
      *(_DWORD *)(a4 + 8) = v7;
    }
    else
    {
      *(unsigned char *)(a4 + 16) = -1;
      *(void *)a4 = a4 + 16;
      *(void *)(a4 + 8) = 0x800000001;
      if (v11 != v13) {
        free(v11);
      }
    }
  }
}

void sub_25C821CEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  if (a11 != v11) {
    free(a11);
  }
  _Unwind_Resume(exception_object);
}

size_t sub_25C821D20(size_t result, unsigned char *a2)
{
  size_t v3 = result;
  unsigned int v4 = *(_DWORD *)(result + 8);
  if (v4 == *(_DWORD *)(result + 12))
  {
    uint64_t result = sub_25C821DFC(result, v4 + (v4 >> 1) + 1);
    unsigned int v4 = *(_DWORD *)(v3 + 8);
  }
  *(unsigned char *)(*(void *)v3 + v4) = *a2;
  ++*(_DWORD *)(v3 + 8);
  return result;
}

uint64_t sub_25C821D80(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a2 != a3)
  {
    uint64_t v5 = a2;
    do
    {
      sub_25C7DC744(a1, v5, v5);
      ++v5;
    }
    while (v5 != a3);
  }
  return a1;
}

void sub_25C821DE8(_Unwind_Exception *a1)
{
  sub_25C7DFD9C(v1);
  _Unwind_Resume(a1);
}

size_t sub_25C821DFC(uint64_t a1, size_t size)
{
  size_t v3 = malloc_type_malloc(size, 0x100004077774924uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v11 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v11, MEMORY[0x263F8C218], MEMORY[0x263F8C170]);
  }
  unsigned int v4 = v3;
  uint64_t v5 = *(char **)a1;
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  if (v6)
  {
    size_t v7 = v4;
    do
    {
      char v8 = *v5++;
      *v7++ = v8;
      --v6;
    }
    while (v6);
    uint64_t v5 = *(char **)a1;
  }
  if (v5 != (char *)(a1 + 16)) {
    free(v5);
  }
  *(void *)a1 = v4;
  size_t result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result;
  return result;
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x270F0ECE8]();
}

uint64_t AFOfflineDictationStatusStringIsInstalled()
{
  return MEMORY[0x270F0EE60]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CEMCreateEmojiLocaleData()
{
  return MEMORY[0x270F18BE0]();
}

uint64_t CEMEmojiLocaleDataEnumerateSearchResultsInStringWithBlock()
{
  return MEMORY[0x270F18C00]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x270F18C38]();
}

uint64_t CEMStringIsSingleEmoji()
{
  return MEMORY[0x270F18C68]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x270EE50F8](alloc, chars, numChars);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x270F0CDD0]();
}

uint64_t KVFieldTypeFromCascadeFieldType()
{
  return MEMORY[0x270F468E0]();
}

uint64_t KVFieldTypeFromNumber()
{
  return MEMORY[0x270F468E8]();
}

uint64_t KVFieldTypeToCascadeFieldType()
{
  return MEMORY[0x270F468F0]();
}

uint64_t KVItemTypeFromNumber()
{
  return MEMORY[0x270F46908]();
}

uint64_t KVItemTypeToCascadeItemType()
{
  return MEMORY[0x270F46910]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t PB::Writer::Writer(PB::Writer *this)
{
  return MEMORY[0x270F588A0](this);
}

void PB::Writer::~Writer(PB::Writer *this)
{
}

uint64_t siri::ontology::UsoGraphProtoWriter::toProtobuf()
{
  return MEMORY[0x270F6BB60]();
}

uint64_t siri::ontology::oname::graph::ontology_init::common_App(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F548](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Group(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F550](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_name(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F558](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Person(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F570](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_label(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F578](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_names(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F580](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_value(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F588](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Workout(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5A8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_entity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5B0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_AppEntity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5C0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_MediaItem(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5C8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Medication(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5D0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_NoteFolder(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5D8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_UserEntity(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5E0](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_UserProfile(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F5F8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_Organization(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F610](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_RadioStation(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F618](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ReminderList(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F620](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_VoiceCommand(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F628](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_CalendarEvent(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F630](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PostalAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F640](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_ContactAddress(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F660](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PaymentAccount(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F670](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_frequencyName(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F678](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PointOfInterest(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F680](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_WorkoutInstructor(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6A8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::Argument_relationshipType(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F6B8](this);
}

uint64_t siri::ontology::oname::graph::ontology_init::common_PersonRelationship(siri::ontology::oname::graph::ontology_init *this)
{
  return MEMORY[0x270F6F700](this);
}

uint64_t skit::strip_bidi()
{
  return MEMORY[0x270F9B210]();
}

uint64_t skit::IndexReader::open(skit::IndexReader *this)
{
  return MEMORY[0x270F9B218](this);
}

uint64_t skit::IndexReader::close(skit::IndexReader *this)
{
  return MEMORY[0x270F9B220](this);
}

uint64_t skit::IndexReader::IndexReader(skit::IndexReader *this)
{
  return MEMORY[0x270F9B228](this);
}

void skit::IndexReader::~IndexReader(skit::IndexReader *this)
{
}

uint64_t skit::IndexReader::operator=()
{
  return MEMORY[0x270F9B238]();
}

uint64_t skit::IndexWriter::set_dp_class(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B240](this);
}

uint64_t skit::IndexWriter::flush_threshold(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B248](this);
}

{
  return MEMORY[0x270F9B380](this);
}

uint64_t skit::IndexWriter::set_doc_store_write_cache(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B250](this);
}

uint64_t skit::IndexWriter::set_term_index_write_cache(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B258](this);
}

uint64_t skit::IndexWriter::erase()
{
  return MEMORY[0x270F9B268]();
}

uint64_t skit::IndexWriter::append()
{
  return MEMORY[0x270F9B270]();
}

uint64_t skit::IndexWriter::set_mode(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B280](this);
}

uint64_t skit::IndexWriter::IndexWriter(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B298](this);
}

void skit::IndexWriter::~IndexWriter(skit::IndexWriter *this)
{
}

uint64_t skit::IndexWriter::operator=()
{
  return MEMORY[0x270F9B2A8]();
}

uint64_t skit::to_u16string()
{
  return MEMORY[0x270F9B2B0]();
}

uint64_t skit::is_significant()
{
  return MEMORY[0x270F9B2B8]();
}

uint64_t skit::entity_token_wgt(skit *this)
{
  return MEMORY[0x270F9B2C0](this);
}

uint64_t skit::FieldSpanMatcherV3::alias_filters()
{
  return MEMORY[0x270F9B2C8]();
}

uint64_t skit::FieldSpanMatcherV3::alias_span_matcher()
{
  return MEMORY[0x270F9B2D0]();
}

uint64_t skit::FieldSpanMatcherV3::query_token_stream_end(skit::FieldSpanMatcherV3 *this)
{
  return MEMORY[0x270F9B2D8](this);
}

uint64_t skit::FieldSpanMatcherV3::query_token_stream_begin(skit::FieldSpanMatcherV3 *this)
{
  return MEMORY[0x270F9B2E0](this);
}

uint64_t skit::FieldSpanMatcherV3::FieldSpanMatcherV3()
{
  return MEMORY[0x270F9B2E8]();
}

uint64_t skit::AliasSpanMatchCompare::compare_locale(skit::AliasSpanMatchCompare *this)
{
  return MEMORY[0x270F9B2F0](this);
}

uint64_t skit::AliasSpanMatchCompare::compare_entity_type(skit::AliasSpanMatchCompare *this)
{
  return MEMORY[0x270F9B2F8](this);
}

uint64_t skit::Alias::init(skit::Alias *this)
{
  return MEMORY[0x270F9B300](this);
}

uint64_t skit::Alias::Alias(skit::Alias *this, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  return MEMORY[0x270F9B308](this, a2, a3);
}

uint64_t skit::Analyzer::dedup(skit::Analyzer *this, TokenStream *a2)
{
  return MEMORY[0x270F9B310](this, a2);
}

uint64_t skit::internal::murmur3_32(skit::internal *this, const unsigned __int8 *a2)
{
  return MEMORY[0x270F9B318](this, a2);
}

void skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::MergedFieldMatchImpl()
{
  while (1)
    ;
}

uint64_t skit::ContextV2::index_writer()
{
  return MEMORY[0x270F9B320]();
}

uint64_t skit::ContextV2::ContextV2()
{
  return MEMORY[0x270F9B330]();
}

void skit::ContextV2::~ContextV2(skit::ContextV2 *this)
{
}

uint64_t skit::to_string()
{
  return MEMORY[0x270F9B340]();
}

uint64_t morphun::dictionary::DictionaryMetaData::createDictionary()
{
  return MEMORY[0x270F99F28]();
}

uint64_t morphun::TokenIterator::TokenIterator(morphun::TokenIterator *this, const Token *a2, const Token *a3)
{
  return MEMORY[0x270F99F30](this, a2, a3);
}

uint64_t morphun::TokenIterator::operator++()
{
  return MEMORY[0x270F99F38]();
}

uint64_t morphun::TokenizerFactory::createTokenizer()
{
  return MEMORY[0x270F99F40]();
}

uint64_t morphun::util::LocaleUtils::toLocale()
{
  return MEMORY[0x270F99F50]();
}

uint64_t morphun::util::ULocale::ULocale()
{
  return MEMORY[0x270F99F60]();
}

void morphun::util::ULocale::~ULocale(morphun::util::ULocale *this)
{
}

uint64_t morphun::analysis::DefaultAnalyzerFactory::createAnalyzer(morphun::analysis::DefaultAnalyzerFactory *this, const morphun::util::ULocale *a2)
{
  return MEMORY[0x270F99F70](this, a2);
}

uint64_t morphun::analysis::DefaultAnalyzerFactory::DefaultAnalyzerFactory(morphun::analysis::DefaultAnalyzerFactory *this)
{
  return MEMORY[0x270F99F78](this);
}

void morphun::analysis::DefaultAnalyzerFactory::~DefaultAnalyzerFactory(morphun::analysis::DefaultAnalyzerFactory *this)
{
}

uint64_t morphun::resources::DataRegistrationService::registerDataPathForLocale()
{
  return MEMORY[0x270F99F98]();
}

uint64_t skit::EmojiFilter::filter()
{
  return MEMORY[0x270F9B348]();
}

uint64_t skit::EmojiFilter::filter(skit::EmojiFilter *this, Token *a2)
{
  return MEMORY[0x270F9B350](this, a2);
}

uint64_t skit::IndexReader::search()
{
  return MEMORY[0x270F9B358]();
}

uint64_t skit::IndexReader::is_open(skit::IndexReader *this)
{
  return MEMORY[0x270F9B360](this);
}

uint64_t skit::IndexWriter::record_cnt(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B368](this);
}

uint64_t skit::IndexWriter::segment_cnt(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B370](this);
}

uint64_t skit::IndexWriter::should_merge(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B378](this);
}

uint64_t skit::IndexWriter::index_count_threshold(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B388](this);
}

uint64_t skit::IndexWriter::size(skit::IndexWriter *this)
{
  return MEMORY[0x270F9B390](this);
}

uint64_t skit::SpanMatchV3::stop_word_cnt(skit::SpanMatchV3 *this)
{
  return MEMORY[0x270F9B398](this);
}

uint64_t skit::SpanMatchV3::alias_token_cnt(skit::SpanMatchV3 *this)
{
  return MEMORY[0x270F9B3A0](this);
}

uint64_t skit::SpanMatchV3::span(skit::SpanMatchV3 *this)
{
  return MEMORY[0x270F9B3A8](this);
}

uint64_t skit::SpanMatchV3::score(skit::SpanMatchV3 *this)
{
  return MEMORY[0x270F9B3B0](this);
}

uint64_t skit::SpanMatchV3::alias_ids(skit::SpanMatchV3 *this)
{
  return MEMORY[0x270F9B3B8](this);
}

uint64_t skit::SpanMatchV3::edit_dist(skit::SpanMatchV3 *this)
{
  return MEMORY[0x270F9B3C0](this);
}

uint64_t skit::SpanMatchV3::token_cnt(skit::SpanMatchV3 *this)
{
  return MEMORY[0x270F9B3C8](this);
}

uint64_t skit::NumberFilter::filter(skit::NumberFilter *this, Token *a2)
{
  return MEMORY[0x270F9B3D0](this, a2);
}

uint64_t skit::FieldSpanMatcherV3::merge_field()
{
  return MEMORY[0x270F9B3D8]();
}

uint64_t skit::FieldSpanMatcherV3::query_alias_matches_end(skit::FieldSpanMatcherV3 *this)
{
  return MEMORY[0x270F9B3E0](this);
}

uint64_t skit::FieldSpanMatcherV3::query_alias_matches_begin(skit::FieldSpanMatcherV3 *this)
{
  return MEMORY[0x270F9B3E8](this);
}

uint64_t skit::FieldSpanMatcherV3::match()
{
  return MEMORY[0x270F9B3F0]();
}

{
  return MEMORY[0x270F9B3F8]();
}

uint64_t skit::FieldSpanMatcherV3::finalize()
{
  return MEMORY[0x270F9B400]();
}

{
  return MEMORY[0x270F9B408]();
}

uint64_t skit::Alias::match()
{
  return MEMORY[0x270F9B410]();
}

uint64_t skit::ContextV2::index_reader()
{
  return MEMORY[0x270F9B418]();
}

uint64_t morphun::dictionary::DictionaryMetaData::isKnownWord()
{
  return MEMORY[0x270F99FA0]();
}

uint64_t morphun::TokenIterator::operator*()
{
  return MEMORY[0x270F99FA8]();
}

uint64_t morphun::TokenIterator::operator!=()
{
  return MEMORY[0x270F99FB0]();
}

uint64_t morphun::TokenIterator::operator->()
{
  return MEMORY[0x270F99FB8]();
}

uint64_t morphun::Token::isWhitespace(morphun::Token *this)
{
  return MEMORY[0x270F99FC0](this);
}

uint64_t morphun::Token::getCleanValue(morphun::Token *this)
{
  return MEMORY[0x270F99FC8](this);
}

uint64_t morphun::Token::isSignificant(morphun::Token *this)
{
  return MEMORY[0x270F99FD0](this);
}

uint64_t morphun::Token::isHead(morphun::Token *this)
{
  return MEMORY[0x270F99FD8](this);
}

uint64_t morphun::Token::isTail(morphun::Token *this)
{
  return MEMORY[0x270F99FE0](this);
}

uint64_t morphun::Token::getNext(morphun::Token *this)
{
  return MEMORY[0x270F99FE8](this);
}

uint64_t morphun::Token::getValue(morphun::Token *this)
{
  return MEMORY[0x270F99FF0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::__grow_by(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x270F98E58](this);
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz, const std::nothrow_t *a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B498](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x270F9B4A0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x270F9B4B0](a1, *(void *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x270F9B4B8](a1, *(void *)&a2);
}

int sqlite3_bind_parameter_count(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B4C0](a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x270F9B540](a1);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B550](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x270F9B560](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B580](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  MEMORY[0x270F9B590](a1, *(void *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x270F9B5C0](a1, *(void *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5D0](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x270F9B660](*(void *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x270F9B668](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x270F9B678](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B690](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x270F9B710](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x270F9B720](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x270F9B730](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x270F9B800](a1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t ubrk_close()
{
  return MEMORY[0x270F99610]();
}

uint64_t ubrk_first()
{
  return MEMORY[0x270F99620]();
}

uint64_t ubrk_next()
{
  return MEMORY[0x270F99648]();
}

uint64_t ubrk_open()
{
  return MEMORY[0x270F99650]();
}

uint64_t uscript_getScript()
{
  return MEMORY[0x270F998E8]();
}

uint64_t xpc_copy_entitlements_for_self()
{
  return MEMORY[0x270EDBF58]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC050](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}