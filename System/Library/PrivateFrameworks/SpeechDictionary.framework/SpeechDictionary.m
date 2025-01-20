void SLCartDict::SLCartDict(SLCartDict *this, _DWORD *a2)
{
  uint64_t v3;
  long long v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;

  SLDictionary::SLDictionary(this);
  *(void *)v3 = &unk_26D52A750;
  v4 = *(_OWORD *)a2;
  *(_DWORD *)(v3 + 56) = a2[4];
  *(_OWORD *)(v3 + 40) = v4;
  *(void *)(v3 + 64) = a2 + 5;
  v5 = *(_DWORD *)(v3 + 56);
  v6 = bswap32(v5);
  if (*(_DWORD *)(v3 + 16) == *(_DWORD *)(v3 + 20)) {
    v7 = v5;
  }
  else {
    v7 = v6;
  }
  v8 = (char *)a2 + v7 + 21;
  SLCartDict::SymtabRead((SLCartDict *)v3, &v8, (SLCartDict::Symtab *)(v3 + 80));
}

void sub_222A4191C(_Unwind_Exception *a1)
{
  uint64_t v3 = *((void *)v1 + 13);
  if (v3) {
    MEMORY[0x223CA4010](v3, 0x1010C8082113244);
  }
  uint64_t v4 = *((void *)v1 + 11);
  if (v4) {
    MEMORY[0x223CA4010](v4, 0x1010C8082113244);
  }
  SLDictionary::~SLDictionary(v1);
  _Unwind_Resume(a1);
}

void SLCartDict::SymtabRead(SLCartDict *this, char **a2, SLCartDict::Symtab *a3)
{
  uint64_t v3 = (uint64_t)*a2;
  unsigned int v4 = *(_DWORD *)(*a2 + 13);
  unsigned int v5 = bswap32(v4);
  if (*((_DWORD *)this + 4) != *((_DWORD *)this + 5)) {
    unsigned int v4 = v5;
  }
  *(_DWORD *)a3 = v4;
  *a2 = (char *)(v3 + 21);
  operator new[]();
}

void SLCartDict::Symtab::~Symtab(SLCartDict::Symtab *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    MEMORY[0x223CA4010](v1, 0x1010C8082113244);
  }
}

{
  uint64_t v1;

  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    MEMORY[0x223CA4010](v1, 0x1010C8082113244);
  }
}

void SLCartDict::~SLCartDict(SLCartDict *this)
{
  *(void *)this = &unk_26D52A750;
  uint64_t v2 = *((void *)this + 9);
  if (v2) {
    MEMORY[0x223CA4010](v2, 0x1020C80FD9D5386);
  }
  uint64_t v3 = *((void *)this + 13);
  if (v3) {
    MEMORY[0x223CA4010](v3, 0x1010C8082113244);
  }
  uint64_t v4 = *((void *)this + 11);
  if (v4) {
    MEMORY[0x223CA4010](v4, 0x1010C8082113244);
  }
  SLDictionary::~SLDictionary(this);
}

{
  uint64_t vars8;

  SLCartDict::~SLCartDict(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLCartDict::Lookup(SLCartDict *this, const char *a2, uint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  uint64_t result = SLCartDict::LTGenResultRaw(this, a2, a3);
  if (result)
  {
    unsigned int v42 = result;
    SLCartDict::LTCleanupLabels((uint64_t)this);
    (**(void (***)(SLWordBuilder *, const char *))a4)(a4, "CART");
    (*(void (**)(SLWordBuilder *))(*(void *)a4 + 8))(a4);
    (*(void (**)(SLWordBuilder *, const char *, uint64_t))(*(void *)a4 + 16))(a4, a2, a3);
    (*(void (**)(SLWordBuilder *))(*(void *)a4 + 56))(a4);
    v10 = operator new(1uLL);
    unsigned char *v10 = 2;
    v11 = v10 + 1;
    v44 = v10 + 1;
    v45 = v10 + 1;
    unint64_t __p = (unint64_t)v10;
    v13 = (unsigned __int16 *)((char *)this + 240);
    unsigned int v12 = *((unsigned __int16 *)this + 120);
    if ((v12 & 0x8000) == 0)
    {
      v14 = 0;
      unsigned __int8 v15 = 0;
      while (v12 < *((unsigned __int8 *)this + 32) || v12 > *((unsigned __int8 *)this + 33))
      {
        uint64_t v16 = *((void *)this + 3);
        uint64_t v17 = *(unsigned __int8 *)(v16 + v12);
        if (*(unsigned char *)(v16 + v12))
        {
          if (v15 == 0xFF)
          {
            unsigned __int8 v15 = -1;
          }
          else
          {
            unsigned int v18 = (*(uint64_t (**)(SLCartDict *, uint64_t))(*(void *)this + 24))(this, v17);
            v11 = v44;
            if (v18 > v15)
            {
              v14 = &v44[-__p];
              unsigned __int8 v15 = v18;
            }
          }
LABEL_29:
          if (v11 >= v45)
          {
            v30 = &v11[-__p];
            uint64_t v31 = (uint64_t)&v11[-__p + 1];
            if (v31 < 0) {
              std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
            }
            unint64_t v32 = (unint64_t)&v45[-__p];
            if (2 * (uint64_t)&v45[-__p] > (unint64_t)v31) {
              uint64_t v31 = 2 * v32;
            }
            if (v32 >= 0x3FFFFFFFFFFFFFFFLL) {
              size_t v33 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else {
              size_t v33 = v31;
            }
            if (v33) {
              v34 = (char *)operator new(v33);
            }
            else {
              v34 = 0;
            }
            v35 = &v30[(void)v34];
            v36 = &v30[(void)v34];
            char *v36 = v17;
            v29 = v36 + 1;
            if (v11 != (char *)__p)
            {
              v37 = &v11[~__p];
              do
              {
                char v38 = *--v11;
                (v37--)[(void)v34] = v38;
              }
              while (v11 != (char *)__p);
              v11 = (char *)__p;
              v35 = v34;
            }
            unint64_t __p = (unint64_t)v35;
            v45 = &v34[v33];
            if (v11) {
              operator delete(v11);
            }
          }
          else
          {
            char *v11 = v17;
            v29 = v11 + 1;
          }
          v44 = v29;
          v11 = v29;
        }
LABEL_47:
        int v39 = (__int16)v13[1];
        ++v13;
        unsigned int v12 = (unsigned __int16)v39;
        if (v39 < 0)
        {
          v10 = (unsigned char *)__p;
          if (v11 == (char *)__p) {
            goto LABEL_57;
          }
          goto LABEL_51;
        }
      }
      if (v11 >= v45)
      {
        v20 = &v11[-__p];
        uint64_t v21 = (uint64_t)&v11[-__p + 1];
        if (v21 < 0) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v22 = (unint64_t)&v45[-__p];
        if (2 * (uint64_t)&v45[-__p] > (unint64_t)v21) {
          uint64_t v21 = 2 * v22;
        }
        if (v22 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v23 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v23 = v21;
        }
        if (v23) {
          v24 = (char *)operator new(v23);
        }
        else {
          v24 = 0;
        }
        v25 = &v20[(void)v24];
        v26 = &v20[(void)v24];
        char *v26 = 1;
        v19 = v26 + 1;
        if (v11 != (char *)__p)
        {
          v27 = &v11[~__p];
          do
          {
            char v28 = *--v11;
            (v27--)[(void)v24] = v28;
          }
          while (v11 != (char *)__p);
          v11 = (char *)__p;
          v25 = v24;
        }
        unint64_t __p = (unint64_t)v25;
        v45 = &v24[v23];
        if (v11) {
          operator delete(v11);
        }
      }
      else
      {
        char *v11 = 1;
        v19 = v11 + 1;
      }
      v44 = v19;
      LOBYTE(v17) = *(unsigned char *)(*((void *)this + 3) + *v13);
      unsigned __int8 v15 = -1;
      v11 = v19;
      if (!(_BYTE)v17) {
        goto LABEL_47;
      }
      goto LABEL_29;
    }
    v14 = 0;
    unsigned __int8 v15 = 0;
LABEL_51:
    unint64_t v40 = 0;
    do
    {
      if (v14 != (char *)v40 || v15 == 0xFF)
      {
        uint64_t v41 = v10[v40];
      }
      else
      {
        (*(void (**)(SLWordBuilder *, uint64_t))(*(void *)a4 + 72))(a4, 1);
        uint64_t v41 = (*(uint64_t (**)(SLCartDict *, void))(*(void *)this + 32))(this, v14[__p]);
      }
      (*(void (**)(SLWordBuilder *, uint64_t))(*(void *)a4 + 72))(a4, v41);
      ++v40;
      v10 = (unsigned char *)__p;
    }
    while (v40 < (unint64_t)&v44[-__p]);
LABEL_57:
    SLWordBuilder::SetPartOfSpeech((uint64_t)a4, *((_DWORD *)this + 9));
    (*(void (**)(SLWordBuilder *))(*(void *)a4 + 96))(a4);
    (*(void (**)(SLWordBuilder *))(*(void *)a4 + 48))(a4);
    if (__p) {
      operator delete((void *)__p);
    }
    return v42;
  }
  return result;
}

void sub_222A42058(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
}

uint64_t SLCartDict::LTGenResultRaw(SLCartDict *this, const char *a2, uint64_t a3)
{
  unsigned int v5 = this;
  uint64_t v30 = *MEMORY[0x263EF8340];
  unsigned int v6 = *((_DWORD *)this + 12);
  unsigned int v7 = bswap32(v6);
  if (*((_DWORD *)this + 4) != *((_DWORD *)this + 5)) {
    unsigned int v6 = v7;
  }
  size_t v8 = (unint64_t)(v6 - 1) >> 1;
  memset(__b, 33, v8);
  if (!a3) {
    goto LABEL_16;
  }
  unint64_t v9 = 0;
  do
  {
    __darwin_ct_rune_t v11 = *(unsigned __int8 *)a2++;
    __darwin_ct_rune_t v10 = v11;
    if ((v11 - 97) >= 0x1A)
    {
      if ((v10 - 65) > 0x19) {
        goto LABEL_9;
      }
      LOBYTE(v10) = __tolower(v10);
    }
    size_t v12 = v9 + v8;
    ++v9;
    __b[v12] = v10;
LABEL_9:
    --a3;
  }
  while (a3);
  char v28 = &__b[v8];
  memset(&__b[v8 + v9], 33, v8);
  if (!v9)
  {
LABEL_16:
    uint64_t v24 = 0;
    goto LABEL_17;
  }
  v13 = (char *)*((void *)v5 + 8);
  char v14 = __b[v8];
  uint64_t result = (uint64_t)strchr(v13, v14);
  if (result)
  {
    unint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v27 = (uint64_t)v5;
    __s = v13;
    uint64_t v26 = (uint64_t)v5 + 80;
    char v18 = v14;
    v19 = &__b[v8];
    v20 = &__b[v8];
    while (1)
    {
      uint64_t v21 = *(void *)(v27 + 72) + 32 * (result - (void)v13);
      *(unsigned char *)(v27 + 112 + v17) = v16;
      v19[v16] = 43;
      uint64_t v22 = (uint64_t)&v20[-v8];
      *(_WORD *)(v27 + 240 + 2 * v17) = SLCartDict::LTGenLabelConfusions(v27, v21, v22, v26);
      uint64_t v23 = v17 | 1;
      *(unsigned char *)(v27 + 112 + (v17 | 1)) = v16;
      v28[v16] = 45;
      v17 += 2;
      *(_WORD *)(v27 + 240 + 2 * v23) = SLCartDict::LTGenLabelConfusions(v27, v21, v22, v26);
      v19 = &__b[v8];
      v28[v16++] = v18;
      if (v16 == v9) {
        break;
      }
      v20 = &v28[v16];
      char v18 = v28[v16];
      v13 = __s;
      uint64_t result = (uint64_t)strchr(__s, v18);
      if (!result) {
        return v16 >= v9;
      }
    }
    uint64_t v24 = v17 & 0xFFFFFFFE;
    unsigned int v5 = (SLCartDict *)v27;
LABEL_17:
    *((_WORD *)v5 + v24 + 120) = -1;
    *((unsigned char *)v5 + v24 + 112) = -1;
    return 1;
  }
  return result;
}

uint64_t SLCartDict::LTCleanupLabels(uint64_t this)
{
  unsigned int v1 = *(_DWORD *)(this + 44);
  unsigned int v2 = bswap32(v1);
  if (*(_DWORD *)(this + 16) != *(_DWORD *)(this + 20)) {
    unsigned int v1 = v2;
  }
  if ((*(__int16 *)(this + 240) & 0x80000000) == 0)
  {
    uint64_t v3 = 0;
    int v4 = 0;
    int v5 = *(unsigned __int16 *)(this + 240);
    do
    {
      int v6 = *(unsigned __int16 *)(this + 2 * v3 + 242);
      if (v6 == v5 || v1 == v6)
      {
        uint64_t v8 = v4;
      }
      else
      {
        uint64_t v8 = v4 + 1;
        *(_WORD *)(this + 2 * v8 + 240) = v6;
        *(unsigned char *)(this + v8 + 112) = *(unsigned char *)(this + v3 + 113);
        ++v4;
      }
      int v9 = *(__int16 *)(this + 2 * v8 + 240);
      int v5 = *(unsigned __int16 *)(this + 2 * v8 + 240);
      ++v3;
    }
    while ((v9 & 0x80000000) == 0);
  }
  return this;
}

uint64_t SLCartDict::LTGenLabelConfusions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_WORD *)(a2 + 4))
  {
    int v5 = *(unsigned __int8 **)(a2 + 16);
    uint64_t v6 = *(void *)(a4 + 8);
    int v7 = *(_DWORD *)(a1 + 16);
    int v8 = *(_DWORD *)(a1 + 20);
    int v9 = v5;
    do
    {
      __darwin_ct_rune_t v10 = (void **)(v6 + 16 * v9[1]);
      if (memchr(v10[1], *(char *)(a3 + *v9), *(int *)v10)) {
        uint64_t v11 = 2;
      }
      else {
        uint64_t v11 = 4;
      }
      unsigned int v12 = *(unsigned __int16 *)&v9[v11];
      unsigned int v13 = bswap32(v12) >> 16;
      if (v7 != v8) {
        LOWORD(v12) = v13;
      }
      int v9 = &v5[6 * (unsigned __int16)v12];
    }
    while ((v12 & 0x8000) == 0);
    return (unsigned __int16)(v12 ^ 0x8000);
  }
  else
  {
    return *(unsigned __int8 *)(a2 + 12);
  }
}

void SLCartDictEng::SLCartDictEng(SLCartDictEng *this, const __CFURL *a2, SLMMapHint *a3)
{
}

void SLCartMappedFileDict::SLCartMappedFileDict(SLCartMappedFileDict *this, const __CFURL *a2, SLMMapHint *a3)
{
  *(void *)this = &unk_26D52ABA8;
  int v4 = (_DWORD *)SLMappedFileDict::SetMappedFile((SLCartMappedFileDict *)((char *)this + 496), a2, a3);
  SLCartDict::SLCartDict(this, v4);
}

void sub_222A424B4(_Unwind_Exception *a1, void *a2)
{
  SLMappedFileDict::~SLMappedFileDict(v2, a2);
  _Unwind_Resume(a1);
}

uint64_t SLCartDictEng::VowelQuality(SLCartDictEng *this, int a2)
{
  if (a2 == 25 || a2 == 11) {
    int v3 = 1;
  }
  else {
    int v3 = 2;
  }
  return ((int)(SLPhonEng::sFlags[a2] << 31) >> 31) & v3;
}

uint64_t SLCartDictEng::PimpMySchwa(SLCartDictEng *this, unsigned int a2)
{
  if (a2 == 25) {
    unsigned int v2 = 4;
  }
  else {
    unsigned int v2 = a2;
  }
  if (a2 == 11) {
    return 8;
  }
  else {
    return v2;
  }
}

void SLCartDict::Create(SLCartDict *this, const __CFLocale *a2, const __CFURL *a3)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFEqual(Value, @"en")) {
    operator new();
  }
  SLCartDict::Create();
}

void sub_222A425B4(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F1C40323799D2);
  _Unwind_Resume(a1);
}

uint64_t SLCartDict::VowelQuality(SLCartDict *this)
{
  return 0;
}

uint64_t SLCartDict::PimpMySchwa(SLCartDict *this, uint64_t a2)
{
  return a2;
}

void SLCartDictEng::~SLCartDictEng(SLCartDictEng *this)
{
  SLCartMappedFileDict::~SLCartMappedFileDict(this);
  JUMPOUT(0x223CA4030);
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26463DB78, MEMORY[0x263F8C060]);
}

void sub_222A42684(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

uint64_t SLCompressedDict::CompareEntry(SLCompressedDict *this, const char *a2, size_t a3, unsigned __int8 *a4)
{
  v18[4] = *MEMORY[0x263EF8340];
  int v4 = -(int)a4;
  unsigned int v6 = *a4;
  int v5 = a4 + 1;
  int v7 = v6 >> 3;
  unsigned int v8 = v6 << 10;
  int v9 = v18;
  unsigned __int8 v17 = v6 >> 3;
  int v10 = 10;
  do
  {
    int v11 = v4 + v5;
    while (v10 > 8)
    {
      int v12 = *v5++;
      v8 |= v12 << (v10 - 8);
      ++v11;
      v10 -= 8;
    }
    unsigned int v13 = (v8 >> 8) & 0x1F;
    if (v13 >= 3) {
      char v14 = v13 + 62;
    }
    else {
      char v14 = 0x272E2Du >> (8 * (BYTE1(v8) & 0x1F));
    }
    *v9++ = v14;
    unsigned int v8 = 32 * v8;
    v10 += 5;
  }
  while (v7-- >= 2);
  *((_DWORD *)this + 8) = v11;
  return SLUncompressedDict::CompareEntry(this, a2, a3, &v17);
}

uint64_t SLCompressedDict::EntryLength(SLCompressedDict *this, unsigned __int8 *a2)
{
  return *((unsigned int *)this + 8);
}

void SLCompressedDict::~SLCompressedDict(SLCompressedDict *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLWordBuilder::BeginHomograph(uint64_t this)
{
  *(unsigned char *)(this + 8) = 0;
  *(_DWORD *)(this + 12) = 0;
  return this;
}

uint64_t SLWordBuilder::BeginSyllable(uint64_t this)
{
  *(unsigned char *)(this + 8) = 1;
  return this;
}

uint64_t SLWordBuilder::AddPhonemes(uint64_t this, const unsigned __int8 *a2, int a3)
{
  if (a3 >= 1)
  {
    uint64_t v4 = this;
    unsigned int v5 = a3 + 1;
    do
    {
      unsigned int v6 = *a2++;
      this = (*(uint64_t (**)(uint64_t, void))(*(void *)v4 + 72))(v4, v6);
      --v5;
    }
    while (v5 > 1);
  }
  return this;
}

uint64_t SLWordBuilder::AddPartOfSpeech(uint64_t this, char a2)
{
  *(_DWORD *)(this + 12) |= 1 << a2;
  return this;
}

uint64_t SLWordBuilder::SetPartOfSpeech(uint64_t this, int a2)
{
  *(_DWORD *)(this + 12) = a2;
  return this;
}

void SLWordBuilder::SLWordBuilder(SLWordBuilder *this)
{
  *(void *)this = &unk_26D52A8C0;
}

{
  *(void *)this = &unk_26D52A8C0;
}

void SLWordBuilder::~SLWordBuilder(SLWordBuilder *this)
{
}

uint64_t SLWordBuilderProxy::SetDictionary(SLWordBuilderProxy *this, const char *a2)
{
  return (***((uint64_t (****)(void, const char *))this + 2))(*((void *)this + 2), a2);
}

uint64_t SLWordBuilderProxy::BeginWord(SLWordBuilderProxy *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 8))();
}

uint64_t SLWordBuilderProxy::SetText(SLWordBuilderProxy *this, const char *a2)
{
  return (*(uint64_t (**)(void, const char *))(**((void **)this + 2) + 16))(*((void *)this + 2), a2);
}

uint64_t SLWordBuilderProxy::SetBoundary(SLWordBuilderProxy *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 24))();
}

uint64_t SLWordBuilderProxy::SetEmphasis(SLWordBuilderProxy *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 32))();
}

uint64_t SLWordBuilderProxy::SetPosition(SLWordBuilderProxy *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 40))();
}

uint64_t SLWordBuilderProxy::EndWord(SLWordBuilderProxy *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 48))();
}

uint64_t SLWordBuilderProxy::BeginHomograph(SLWordBuilderProxy *this)
{
  *((unsigned char *)this + 8) = 0;
  *((_DWORD *)this + 3) = 0;
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 56))();
}

uint64_t SLWordBuilderProxy::BeginSyllable(SLWordBuilderProxy *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 64))();
}

uint64_t SLWordBuilderProxy::AddPhoneme(SLWordBuilderProxy *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 72))();
}

uint64_t SLWordBuilderProxy::AddPhonemes(SLWordBuilderProxy *this, const unsigned __int8 *a2)
{
  return (*(uint64_t (**)(void, const unsigned __int8 *))(**((void **)this + 2) + 80))(*((void *)this + 2), a2);
}

uint64_t SLWordBuilderProxy::SetTags(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 88))();
}

uint64_t SLWordBuilderProxy::EndHomograph(SLWordBuilderProxy *this)
{
  uint64_t v1 = (_DWORD *)*((void *)this + 2);
  v1[3] = *((_DWORD *)this + 3);
  return (*(uint64_t (**)(_DWORD *))(*(void *)v1 + 96))(v1);
}

uint64_t SLWordBuilderPhonemeProxy::AddPhoneme(SLWordBuilderPhonemeProxy *this, char a2)
{
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 2) + 72))(*((void *)this + 2));
  *((unsigned char *)this + 24) = a2;
  return result;
}

uint64_t SLWordBuilderPhonemeProxy::AddPhonemes(SLWordBuilderPhonemeProxy *this, const unsigned __int8 *a2, int a3)
{
  uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 2) + 80))(*((void *)this + 2));
  if (a3) {
    *((unsigned char *)this + 24) = a2[a3 - 1];
  }
  return result;
}

void SLDictionary::SLDictionary(SLDictionary *this)
{
  *(void *)this = &unk_26D52A958;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0x100000002;
}

float SLDictionary::SmartSwapFloat32Value(SLDictionary *this, float result)
{
  float v2 = COERCE_FLOAT(bswap32(LODWORD(result)));
  if (*((_DWORD *)this + 4) != *((_DWORD *)this + 5)) {
    return v2;
  }
  return result;
}

uint64_t SLEncyclopedia::Lookup(SLEncyclopedia *this, const char *a2, uint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  uint64_t v5 = *((void *)this + 3);
  if (!v5) {
    return 0;
  }
  do
  {
    uint64_t result = (**(uint64_t (***)(uint64_t, const char *, uint64_t, SLWordBuilder *, SLDictionary *))v5)(v5, a2, a3, a4, a5);
    if (result) {
      break;
    }
    uint64_t v5 = *(void *)(v5 + 8);
  }
  while (v5);
  return result;
}

uint64_t SLEncyclopedia::PushFront(uint64_t this, SLDictionary *a2)
{
  uint64_t v2 = *(void *)(this + 24);
  if (!v2) {
    *(void *)(this + 32) = a2;
  }
  *((void *)a2 + 1) = v2;
  *(void *)(this + 24) = a2;
  return this;
}

uint64_t SLEncyclopedia::PushBack(uint64_t this, SLDictionary *a2)
{
  uint64_t v2 = *(void *)(this + 32);
  if (v2) {
    int v3 = (void *)(v2 + 8);
  }
  else {
    int v3 = (void *)(this + 24);
  }
  *int v3 = a2;
  *((void *)a2 + 1) = 0;
  *(void *)(this + 32) = a2;
  return this;
}

void SLEncyclopedia::~SLEncyclopedia(SLEncyclopedia *this)
{
  *(void *)this = &unk_26D52A980;
  for (i = (void *)*((void *)this + 3); i; i = (void *)*((void *)this + 3))
  {
    *((void *)this + 3) = i[1];
    if (*((void **)this + 4) == i) {
      *((void *)this + 4) = 0;
    }
    (*(void (**)(void *))(*i + 16))(i);
  }
}

{
  uint64_t vars8;

  SLEncyclopedia::~SLEncyclopedia(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLEncyclopedia::Remove(uint64_t this, SLDictionary *a2)
{
  uint64_t v2 = (void *)(this + 24);
  int v3 = *(SLDictionary **)(this + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      uint64_t v5 = 0;
LABEL_7:
      if (v5) {
        uint64_t v2 = (void *)((char *)v5 + 8);
      }
      *uint64_t v2 = *((void *)a2 + 1);
      if (*(SLDictionary **)(this + 32) == a2) {
        *(void *)(this + 32) = v5;
      }
    }
    else
    {
      while (1)
      {
        uint64_t v4 = (SLDictionary *)*((void *)v3 + 1);
        if (!v4) {
          break;
        }
        uint64_t v5 = v3;
        int v3 = (SLDictionary *)*((void *)v3 + 1);
        if (v4 == a2) {
          goto LABEL_7;
        }
      }
    }
  }
  return this;
}

void SLDictionaryRecursion::SLDictionaryRecursion(SLDictionaryRecursion *this, SLDictionary *a2, uint64_t a3)
{
  *((void *)this + 2) = 0x100000002;
  *(void *)this = &unk_26D52A9A8;
  *((void *)this + 1) = 0;
  *((void *)this + 3) = a2;
  *((void *)this + 4) = a3;
}

{
  *((void *)this + 2) = 0x100000002;
  *(void *)this = &unk_26D52A9A8;
  *((void *)this + 1) = 0;
  *((void *)this + 3) = a2;
  *((void *)this + 4) = a3;
}

uint64_t SLDictionaryRecursion::Lookup(SLDictionaryRecursion *this, const char *a2, uint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  uint64_t v5 = *((void *)this + 4);
  if (!v5) {
    return 0;
  }
  *((void *)this + 4) = v5 - 1;
  uint64_t result = (***((uint64_t (****)(void, const char *, uint64_t, SLWordBuilder *, SLDictionary *))this + 3))(*((void *)this + 3), a2, a3, a4, a5);
  ++*((void *)this + 4);
  return result;
}

CFBundleRef SLGetSpeechDictionaryBundle(void)
{
  return CFBundleGetBundleWithIdentifier(@"com.apple.speech.SpeechDictionary");
}

uint64_t SLWordBuilder::WrappedToken(SLWordBuilder *this)
{
  return 0;
}

uint64_t SLWordBuilder::AllowShortcut(SLWordBuilder *this)
{
  return 0;
}

void SLWordBuilderProxy::~SLWordBuilderProxy(SLWordBuilderProxy *this)
{
}

void SLWordBuilderPhonemeProxy::~SLWordBuilderPhonemeProxy(SLWordBuilderPhonemeProxy *this)
{
}

void SLDictionaryRecursion::~SLDictionaryRecursion(SLDictionaryRecursion *this)
{
}

uint64_t SLMappedFileDict::SetMappedFile(SLMappedFileDict *this, const __CFURL *a2, SLMMapHint *a3)
{
  uint64_t result = SLMMapCache::Map(a2, 0, a3);
  *(void *)this = result;
  return result;
}

void SLMappedFileDict::~SLMappedFileDict(SLMMapCache **this, void *a2)
{
}

{
  SLMMapCache::Unmap(*this, a2);
}

void __clang_call_terminate(void *a1)
{
}

void SLCartMappedFileDict::~SLCartMappedFileDict(SLCartMappedFileDict *this)
{
  SLCartDict::~SLCartDict(this);
  SLMMapCache::Unmap(*(SLMMapCache **)(v1 + 496), v2);
}

{
  uint64_t vars8;

  SLCartMappedFileDict::~SLCartMappedFileDict(this);
  JUMPOUT(0x223CA4030);
}

void SLPrefixMappedFileDict::~SLPrefixMappedFileDict(SLMMapCache **this, void *a2)
{
  SLMMapCache::Unmap(this[7], a2);
  SLPrefixDict::~SLPrefixDict((SLPrefixDict *)this);
}

{
  uint64_t vars8;

  SLPrefixMappedFileDict::~SLPrefixMappedFileDict(this, a2);
  JUMPOUT(0x223CA4030);
}

void SLPrefixMappedFileDict::SLPrefixMappedFileDict(SLPrefixMappedFileDict *this, const __CFURL *a2)
{
  SLDictionary::SLDictionary(this);
  *uint64_t v4 = &unk_26D52AB80;
  int v7 = &unk_26D52AC60;
  int v8 = 0;
  unint64_t v9 = 0;
  uint64_t v10 = 0;
  unsigned int v6 = (_DWORD *)SLMMapCache::Map(a2, 0, v5);
  SLPrefixDict::SetFileInfo((uint64_t)this, v6, 0, 0);
  SLMMapHint::~SLMMapHint((SLMMapHint *)&v7);
}

void sub_222A43190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  SLMMapHint::~SLMMapHint((SLMMapHint *)&a9);
  SLMappedFileDict::~SLMappedFileDict(v9 + 7, v11);
  SLPrefixDict::~SLPrefixDict((SLPrefixDict *)v9);
  _Unwind_Resume(a1);
}

uint64_t SLPrefixDictMapHint::MappedSize(SLPrefixDictMapHint *this)
{
  return *((void *)this + 3);
}

void SLPrefixDictMapHint::~SLPrefixDictMapHint(SLPrefixDictMapHint *this)
{
  SLMMapHint::~SLMMapHint(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphTraits::SLMorphTraits(SLMorphTraits *this, const char *a2, int a3)
{
  *(_DWORD *)this = a3;
  *((void *)this + 1) = newlocale(63, a2, 0);
}

void SLMorphTraits::~SLMorphTraits(locale_t *this)
{
}

{
  freelocale(this[1]);
}

uint64_t SLMorph::SLMorph(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, int a5, int a6, uint64_t a7, uint64_t a8)
{
  SLDictionary::SLDictionary((SLDictionary *)a1);
  *unint64_t v16 = &unk_26D52ACA0;
  v16[3] = a2;
  *(void *)(a1 + 32) = strlen(a2);
  *(void *)(a1 + 40) = a4;
  __int16 v17 = *(_WORD *)(a3 + 8);
  *(void *)(a1 + 48) = *(void *)a3;
  *(_WORD *)(a1 + 56) = v17;
  *(_DWORD *)(a1 + 60) = a5;
  *(_DWORD *)(a1 + 64) = a6;
  *(void *)(a1 + 68) = a7;
  *(void *)(a1 + 76) = a8;
  return a1;
}

uint64_t SLMorph::Lookup(SLMorph *this, const char *a2, uint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  if (!(*(unsigned int (**)(SLMorph *))(*(void *)this + 24))(this)) {
    return 0;
  }
  SLTokenBuilder::SLTokenBuilder((SLTokenBuilder *)v12, a4, 0);
  uint64_t v10 = (*(uint64_t (**)(SLMorph *, const char *, uint64_t, SLDictionary *, unsigned char *))(*(void *)this + 32))(this, a2, a3, a5, v12);
  if (v10)
  {
    (*(void (**)(SLMorph *, uint64_t))(*(void *)this + 56))(this, v13);
    *(void *)(v13 + 24) = "Dictionary+Morph";
    SLTokenBuilder::Forward((SLTokenBuilder *)v12);
  }
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)v12);
  return v10;
}

void sub_222A43450(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)va);
  _Unwind_Resume(a1);
}

BOOL SLMorph::Match(SLMorph *this, const char *a2, unint64_t a3)
{
  size_t v4 = *((void *)this + 4);
  if (a3 > v4 && ((uint64_t v5 = (const char *)*((void *)this + 3), a3 - v4 > 1) || *v5 == 39)) {
    return strncasecmp_l(&a2[a3 - v4], v5, v4, *(locale_t *)(*((void *)this + 5) + 8)) == 0;
  }
  else {
    return 0;
  }
}

uint64_t SLMorph::MarkAllCaps(uint64_t result, uint64_t a2, int a3)
{
  if ((*(unsigned char *)(*(void *)(a2 + 40) + 16) & 8) != 0)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(char *)(a2 + 39) < 0 ? *(void *)(a2 + 24) : *(unsigned __int8 *)(a2 + 39);
    uint64_t v6 = a3 - v5;
    if (a3 != v5)
    {
      uint64_t v7 = 0;
      char v8 = 0;
      unint64_t v9 = (uint64_t *)(a2 + 16);
      uint64_t v10 = MEMORY[0x263EF8318];
LABEL_7:
      ++v7;
      do
      {
        uint64_t v11 = a2 + 16;
        if (*(char *)(a2 + 39) < 0) {
          uint64_t v11 = *v9;
        }
        uint64_t result = *(char *)(v11 + v7 - 1);
        if ((result & 0x80000000) != 0)
        {
          uint64_t result = __maskrune_l(result, 0x8000uLL, *(locale_t *)(*(void *)(v4 + 40) + 8));
          if (result)
          {
LABEL_22:
            char v8 = 1;
            if (v6 + v7) {
              goto LABEL_7;
            }
            goto LABEL_25;
          }
        }
        else if ((*(_DWORD *)(v10 + 4 * result + 60) & 0x8000) != 0)
        {
          goto LABEL_22;
        }
        uint64_t v12 = a2 + 16;
        if (*(char *)(a2 + 39) < 0) {
          uint64_t v12 = *v9;
        }
        uint64_t result = *(char *)(v12 + v7 - 1);
        if ((result & 0x80000000) != 0)
        {
          uint64_t result = __maskrune_l(result, 0x1000uLL, *(locale_t *)(*(void *)(v4 + 40) + 8));
          if (result) {
            return result;
          }
        }
        else if ((*(_DWORD *)(v10 + 4 * result + 60) & 0x1000) != 0)
        {
          return result;
        }
        ++v7;
      }
      while (v6 + v7 != 1);
      if ((v8 & 1) == 0) {
        return result;
      }
LABEL_25:
      *(_DWORD *)(*(void *)(a2 + 40) + 16) = *(_DWORD *)(*(void *)(a2 + 40) + 16) & 0xFFFFFFE7 | 0x10;
    }
  }
  return result;
}

uint64_t SLMorph::RestoreSuffix(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 48))(a1, *(void *)(a2 + 40));
  if (v6)
  {
    SLMorph::MarkAllCaps(a1, a2, 0);
    int v7 = *(char *)(a3 + 23);
    if (v7 >= 0) {
      char v8 = (const std::string::value_type *)a3;
    }
    else {
      char v8 = *(const std::string::value_type **)a3;
    }
    if (v7 >= 0) {
      std::string::size_type v9 = *(unsigned __int8 *)(a3 + 23);
    }
    else {
      std::string::size_type v9 = *(void *)(a3 + 8);
    }
    std::string::append((std::string *)(a2 + 16), v8, v9);
  }
  return v6;
}

uint64_t SLMorph::RestoreSuffix(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 48))(a1, *(void *)(a2 + 40));
  if (v8)
  {
    SLMorph::MarkAllCaps(a1, a2, a4);
    if (*(char *)(a2 + 39) < 0) {
      uint64_t v9 = *(void *)(a2 + 24);
    }
    else {
      uint64_t v9 = *(unsigned __int8 *)(a2 + 39);
    }
    int v10 = *(char *)(a3 + 23);
    if (v10 >= 0) {
      uint64_t v11 = (const std::string::value_type *)a3;
    }
    else {
      uint64_t v11 = *(const std::string::value_type **)a3;
    }
    if (v10 >= 0) {
      std::string::size_type v12 = *(unsigned __int8 *)(a3 + 23);
    }
    else {
      std::string::size_type v12 = *(void *)(a3 + 8);
    }
    std::string::replace((std::string *)(a2 + 16), v9 - a4, a4, v11, v12);
  }
  return v8;
}

uint64_t SLMorph::MorphLookup(SLMorph *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4);
  size_t v10 = a3 - v9;
  std::string::basic_string[abi:ne180100](&__dst, (void *)&a2[a3 - v9], v9);
  if ((**(unsigned int (***)(SLDictionary *, const char *, size_t, SLTokenBuilder *, SLDictionary *))a4)(a4, a2, v10, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v11 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v11;
}

void sub_222A43878(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

BOOL SLMorph::POSFromSuffix(SLMorph *this, SLToken *a2, char a3)
{
  uint64_t v3 = *((void *)a2 + 10);
  uint64_t v4 = *((void *)a2 + 11);
  if (v4 != v3)
  {
    unint64_t v8 = 0;
    size_t v9 = (SLMorph *)((char *)this + 68);
    while (1)
    {
      uint64_t v10 = *(void *)(v3 + 8 * v8);
      if ((*((_DWORD *)this + 16) & *(_DWORD *)v10) == 0
        || SLWordTagSet::find((SLWordTagSet *)(v10 + 4), 68) && !SLWordTagSet::find(v9, 68)
        || (a3 & 1) == 0 && SLWordTagSet::find((SLWordTagSet *)(v10 + 4), 64) && !SLWordTagSet::find(v9, 64)
        || SLWordTagSet::find((SLWordTagSet *)(v10 + 4), 72))
      {
        uint64_t v11 = *((void *)a2 + 10);
        uint64_t v12 = *((void *)a2 + 11);
        uint64_t v13 = v11 + 8 * v8;
        uint64_t v14 = v12 - (v13 + 8);
        if (v12 != v13 + 8) {
          memmove((void *)(v11 + 8 * v8), (const void *)(v13 + 8), v12 - (v13 + 8));
        }
        *((void *)a2 + 11) = v13 + v14;
        SLHomograph::~SLHomograph((SLHomograph *)v10);
        MEMORY[0x223CA4030]();
        goto LABEL_18;
      }
      int v15 = *((_DWORD *)this + 15);
      if (v15 != **((_DWORD **)this + 5)) {
        goto LABEL_16;
      }
      if ((*(_DWORD *)v10 & v15) == 0) {
        break;
      }
LABEL_17:
      ++v8;
LABEL_18:
      uint64_t v3 = *((void *)a2 + 10);
      uint64_t v4 = *((void *)a2 + 11);
      if (v8 >= (v4 - v3) >> 3) {
        return v3 != v4;
      }
    }
    int v15 = 1;
LABEL_16:
    *(_DWORD *)uint64_t v10 = v15;
    goto LABEL_17;
  }
  uint64_t v3 = *((void *)a2 + 11);
  return v3 != v4;
}

char *SLMorph::AddAffix(char *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    uint64_t v4 = (uint64_t)this;
    unint64_t v5 = 0;
    uint64_t v6 = this + 50;
    do
    {
      this = std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(*(void *)(v2 + 8 * v5) + 32, *(char **)(*(void *)(v2 + 8 * v5) + 40), v6, &v6[*(__int16 *)(v4 + 48)], *(__int16 *)(v4 + 48));
      ++v5;
      uint64_t v2 = *((void *)a2 + 10);
    }
    while (v5 < (*((void *)a2 + 11) - v2) >> 3);
  }
  return this;
}

BOOL SLMorph::PrefixMatch(SLMorph *this, const char *a2, size_t a3)
{
  size_t v4 = *((void *)this + 4);
  BOOL v5 = a3 > v4;
  unint64_t v6 = a3 - v4;
  return v5
      && v6 >= 3
      && strncasecmp_l(a2, *((const char **)this + 3), v4, *(locale_t *)(*((void *)this + 5) + 8)) == 0;
}

uint64_t SLMorph::PrefixMorphLookup(SLMorph *this, char *a2, uint64_t a3, uint64_t a4, SLDictionary *a5, SLTokenBuilder *a6)
{
  std::string::basic_string[abi:ne180100](&__dst, a2, *((void *)this + 4));
  uint64_t v12 = *((void *)this + 4);
  uint64_t v13 = &a2[v12];
  uint64_t v14 = a3 - v12;
  if (a4)
  {
    if (*v13 == 45)
    {
      std::string::push_back(&__dst, 45);
      ++v13;
      --v14;
      a4 = 1;
    }
    else
    {
      a4 = 0;
    }
  }
  if ((**(unsigned int (***)(SLDictionary *, const char *, uint64_t, SLTokenBuilder *, SLDictionary *))a5)(a5, v13, v14, a6, a5))
  {
    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_dst = &__dst;
    }
    else {
      p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
    }
    if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(__dst.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __dst.__r_.__value_.__l.__size_;
    }
    std::string::insert((std::string *)((char *)a6 + 16), 0, (const std::string::value_type *)p_dst, size);
    uint64_t v17 = (*(uint64_t (**)(SLMorph *, void, uint64_t))(*(void *)this + 40))(this, *((void *)a6 + 5), a4);
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v17;
}

void sub_222A43C08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *SLMorph::PrefixAddAffix(char *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    uint64_t v4 = (uint64_t)this;
    unint64_t v5 = 0;
    unint64_t v6 = this + 50;
    do
    {
      this = std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(*(void *)(v2 + 8 * v5) + 32, (char *)(*(void *)(*(void *)(v2 + 8 * v5) + 32) + 1), v6, &v6[*(__int16 *)(v4 + 48)], *(__int16 *)(v4 + 48));
      ++v5;
      uint64_t v2 = *((void *)a2 + 10);
    }
    while (v5 < (*((void *)a2 + 11) - v2) >> 3);
  }
  return this;
}

uint64_t SLMorph_Apostrophe::MorphLookup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (***a4)(void, uint64_t, uint64_t, uint64_t, void), uint64_t a5)
{
  uint64_t result = (**a4)(a4, a2, a3 - 1, a5, a4);
  if (result)
  {
    uint64_t v8 = *(void *)(a5 + 40);
    size_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 48);
    return v9(a1, v8);
  }
  return result;
}

void SLMorphRules::Create(SLMorphRules *this, const __CFLocale *a2)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFEqual(Value, @"en"))
  {
    SLCreateMorphRulesEng();
  }
  SLMorphRules::Create();
}

void SLMorphRules::CreateFlat(SLMorphRules *this, const __CFLocale *a2, SLDictionary *a3)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFEqual(Value, @"en"))
  {
    SLCreateFlatMorphRulesEng(a2);
  }
  SLMorphRules::CreateFlat();
}

void SLMorphRules::~SLMorphRules(SLMorphRules *this)
{
  SLEncyclopedia::~SLEncyclopedia(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLFlatMorphRules::Lookup(SLFlatMorphRules *this, const char *a2, uint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  uint64_t v5 = *((void *)this + 3);
  if (!v5) {
    return 0;
  }
  do
  {
    uint64_t result = (**(uint64_t (***)(uint64_t, const char *, uint64_t, SLWordBuilder *, void))v5)(v5, a2, a3, a4, *((void *)this + 5));
    if (result) {
      break;
    }
    uint64_t v5 = *(void *)(v5 + 8);
  }
  while (v5);
  return result;
}

void SLFlatMorphRules::~SLFlatMorphRules(SLFlatMorphRules *this)
{
  SLEncyclopedia::~SLEncyclopedia(this);
  JUMPOUT(0x223CA4030);
}

void SLMorph::~SLMorph(SLMorph *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLMorph::POSFromSuffix(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 40))(a1, a2, 0);
}

void SLMorph_Apostrophe::~SLMorph_Apostrophe(SLMorph_Apostrophe *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void *std::string::basic_string[abi:ne180100](void *__dst, void *__src, size_t __len)
{
  if (__len >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v7 = __len | 7;
    }
    size_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    __dst[1] = __len;
    __dst[2] = v8 | 0x8000000000000000;
    *std::string __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = __len;
    unint64_t v6 = __dst;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __dst;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    size_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

char *std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
{
  uint64_t v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    uint64_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15)
    {
      size_t v16 = v15;
      uint64_t v17 = (char *)operator new(v15);
    }
    else
    {
      size_t v16 = 0;
      uint64_t v17 = 0;
    }
    uint64_t v27 = &v13[(void)v17];
    memcpy(&v13[(void)v17], __src, a5);
    char v28 = &v13[(void)v17];
    size_t v29 = v16;
    if (v11 != v5)
    {
      do
      {
        v13[(void)v17 - 1] = v13[(void)(v11 - 1)];
        --v13;
      }
      while (v13);
      uint64_t v10 = *(char **)(a1 + 8);
      char v28 = v17;
    }
    uint64_t v30 = &v27[a5];
    uint64_t v31 = &v17[v29];
    if (v10 != v5) {
      memmove(v30, v5, v10 - v5);
    }
    unint64_t v32 = *(char **)a1;
    *(void *)a1 = v28;
    *(void *)(a1 + 8) = &v30[v10 - v5];
    *(void *)(a1 + 16) = v31;
    if (v32) {
      operator delete(v32);
    }
    return v27;
  }
  uint64_t v18 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    v19 = &__src[a5];
    uint64_t v21 = *(char **)(a1 + 8);
LABEL_17:
    uint64_t v22 = &v5[a5];
    uint64_t v23 = &v21[-a5];
    uint64_t v24 = v21;
    if (&v21[-a5] < v10)
    {
      int64_t v25 = &v10[a5] - v21;
      uint64_t v24 = v21;
      do
      {
        char v26 = *v23++;
        *v24++ = v26;
        --v25;
      }
      while (v25);
    }
    *(void *)(a1 + 8) = v24;
    if (v21 != v22) {
      memmove(&v5[a5], v5, v21 - v22);
    }
    if (v19 != __src) {
      memmove(v5, __src, v19 - __src);
    }
    return v5;
  }
  v19 = &__src[v18];
  int64_t v20 = a4 - &__src[v18];
  if (a4 != &__src[v18]) {
    memmove(*(void **)(a1 + 8), &__src[v18], a4 - &__src[v18]);
  }
  uint64_t v21 = &v10[v20];
  *(void *)(a1 + 8) = &v10[v20];
  if (v18 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

uint64_t SLUncompressedDict::CompareEntry(SLUncompressedDict *this, const char *a2, size_t a3, unsigned __int8 *a4)
{
  uint64_t v4 = a4 + 1;
  size_t v5 = *a4;
  if (v5 >= a3)
  {
    LODWORD(result) = memcmp(v4, a2, a3);
    if (result) {
      return result;
    }
    else {
      return v5 > a3;
    }
  }
  else
  {
    LODWORD(result) = memcmp(v4, a2, *a4);
    if (result) {
      return result;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
}

uint64_t SLUncompressedDict::EntryLength(SLUncompressedDict *this, unsigned __int8 *a2)
{
  return *a2 + 1;
}

uint64_t SLUncompressedDict::FindEntry(SLUncompressedDict *this, const char *a2, uint64_t a3)
{
  std::string::size_type v6 = (unsigned int *)*((void *)this + 3);
  LODWORD(v7) = v6[288];
  int v8 = *((_DWORD *)this + 4);
  int v9 = *((_DWORD *)this + 5);
  unsigned int v10 = bswap32(v7);
  if (v8 == v9) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = v10;
  }
  int v11 = *(unsigned __int8 *)a2;
  if ((v11 - 65) > 0x19)
  {
    if ((char)v11 > 64)
    {
      unsigned int v15 = bswap32(v6[29]);
      if (v8 == v9) {
        unsigned int v13 = v6[29];
      }
      else {
        unsigned int v13 = v15;
      }
      unint64_t v14 = v6 + 3;
    }
    else
    {
      unsigned int v13 = 0;
      unint64_t v14 = v6 + 4;
    }
  }
  else
  {
    unsigned int v12 = bswap32(v6[v11 - 65 + 4]);
    if (v8 == v9) {
      unsigned int v13 = v6[v11 - 65 + 4];
    }
    else {
      unsigned int v13 = v12;
    }
    unint64_t v14 = &v6[v11 - 64 + 4];
  }
  unsigned int v16 = *v14;
  unsigned int v17 = bswap32(v16);
  if (v8 == v9) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v17;
  }
  if (v13 < v18)
  {
    v19 = (char *)v6 + v7;
    do
    {
      uint64_t v20 = (v13 + v18) >> 1;
      LODWORD(v21) = *(_DWORD *)&v19[4 * v20];
      unsigned int v22 = bswap32(v21);
      if (*((_DWORD *)this + 4) == *((_DWORD *)this + 5)) {
        uint64_t v21 = v21;
      }
      else {
        uint64_t v21 = v22;
      }
      uint64_t v23 = *((void *)this + 3) + v21;
      int v24 = (*(uint64_t (**)(SLUncompressedDict *, const char *, uint64_t, uint64_t))(*(void *)this + 24))(this, a2, a3, v23);
      if (v24 <= 0)
      {
        if ((v24 & 0x80000000) == 0) {
          return v23;
        }
        unsigned int v13 = v20 + 1;
        uint64_t v20 = v18;
      }
      uint64_t v18 = v20;
    }
    while (v13 < v20);
  }
  return 0;
}

uint64_t SLUncompressedDict::ExtractPOS(uint64_t this, int a2, SLWordBuilder *a3)
{
  uint64_t v4 = this;
  uint64_t v5 = 0;
  uint64_t v6 = 8 * a2 + 124;
  do
  {
    __int16 v7 = *(_WORD *)(*(void *)(v4 + 24) + v6 + v5);
    if (*(_DWORD *)(v4 + 16) != *(_DWORD *)(v4 + 20)) {
      LOBYTE(v7) = HIBYTE(*(_WORD *)(*(void *)(v4 + 24) + v6 + v5));
    }
    if ((v7 > 0x20u || ((1 << v7) & 0x118000000) == 0) && v7 != 255) {
      this = SLWordBuilder::AddPartOfSpeech((uint64_t)a3, v7 & 0x1F);
    }
    v5 += 2;
  }
  while (v5 != 8);
  return this;
}

char *SLUncompressedDict::ExtractHomograph(SLUncompressedDict *this, char *a2, SLWordBuilder *a3)
{
  (*(void (**)(SLWordBuilder *))(*(void *)a3 + 56))(a3);
  (*(void (**)(SLWordBuilder *, uint64_t))(*(void *)a3 + 72))(a3, 2);
  while (1)
  {
    int v7 = *a2++;
    unsigned __int8 v6 = v7;
    char v8 = v7;
    if (v7 < 0) {
      break;
    }
    if ((v8 & 0x40) != 0)
    {
      (*(void (**)(SLWordBuilder *, uint64_t))(*(void *)a3 + 72))(a3, 1);
      v6 &= ~0x40u;
    }
    (*(void (**)(SLWordBuilder *, void))(*(void *)a3 + 72))(a3, v6);
  }
  (*(void (**)(SLUncompressedDict *, void, SLWordBuilder *))(*(void *)this + 56))(this, v8 & 0x7F, a3);
  (*(void (**)(SLWordBuilder *))(*(void *)a3 + 96))(a3);
  return a2;
}

BOOL SLUncompressedDict::Lookup(SLUncompressedDict *this, const char *a2, uint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  uint64_t v9 = (*(uint64_t (**)(SLUncompressedDict *, const char *, uint64_t, SLWordBuilder *, SLDictionary *))(*(void *)this + 40))(this, a2, a3, a4, a5);
  if (v9)
  {
    uint64_t v10 = v9 + (*(int (**)(SLUncompressedDict *, uint64_t))(*(void *)this + 32))(this, v9);
    (**(void (***)(SLWordBuilder *, const char *))a4)(a4, "Dictionary");
    (*(void (**)(SLWordBuilder *))(*(void *)a4 + 8))(a4);
    (*(void (**)(SLWordBuilder *, const char *, uint64_t))(*(void *)a4 + 16))(a4, a2, a3);
    int v11 = (unsigned __int8 *)(*(uint64_t (**)(SLUncompressedDict *, uint64_t, SLWordBuilder *))(*(void *)this + 48))(this, v10, a4);
    if (*v11 == 255) {
      (*(void (**)(SLUncompressedDict *, unsigned __int8 *, SLWordBuilder *))(*(void *)this + 48))(this, v11 + 1, a4);
    }
    (*(void (**)(SLWordBuilder *))(*(void *)a4 + 48))(a4);
  }
  return v9 != 0;
}

void SLUncompressedDict::~SLUncompressedDict(SLUncompressedDict *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLPronouncer::Create(SLPronouncer *this, const __CFLocale *a2, const SLDictLookup *a3)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFEqual(Value, @"en"))
  {
    SLCreatePronouncerEng(a2);
  }
  SLPronouncer::Create();
}

void SLPronouncerImpl::MakePluralUnit(SLPronouncerImpl *this, SLToken *a2, SLToken *a3)
{
  if (a3)
  {
    SLToken::~SLToken(a3);
    JUMPOUT(0x223CA4030);
  }
}

uint64_t SLPronouncerImpl::AppendUnit(uint64_t a1, char **a2, unsigned char *a3, char a4, uint64_t a5, uint64_t a6)
{
  if (a4)
  {
    SLTokenList::SLTokenList((SLTokenList *)__p);
    (*(void (**)(uint64_t, char **, void **, void, void))(*(void *)a1 + 232))(a1, a2, __p, 0, 0);
    int v11 = (void **)__p[0];
    uint64_t v12 = *((void *)__p[0] + 2);
    uint64_t v13 = *(void *)__p[0];
    *(void *)(v13 + 8) = *((void *)__p[0] + 1);
    *v11[1] = v13;
    --v22;
    operator delete(v11);
    while (1)
    {
      uint64_t v14 = v22;
      if (!v22) {
        break;
      }
      unsigned int v15 = (void **)__p[0];
      unsigned int v16 = (SLToken *)*((void *)__p[0] + 2);
      uint64_t v17 = *(void *)__p[0];
      *(void *)(v17 + 8) = *((void *)__p[0] + 1);
      *v15[1] = v17;
      uint64_t v22 = v14 - 1;
      operator delete(v15);
      if (v16)
      {
        SLToken::~SLToken(v16);
        MEMORY[0x223CA4030]();
      }
    }
    v19 = strpbrk(*a2, "|;");
    if (v19 && *v19 == 124)
    {
      int v18 = 0;
      v23[1] = a2[1];
      v23[0] = v19 + 1;
      a2 = (char **)v23;
    }
    else
    {
      int v18 = 1;
    }
    std::__list_imp<SLToken *>::clear(__p);
  }
  else
  {
    int v18 = 0;
    uint64_t v12 = 0;
  }
  a3[24] = 2;
  uint64_t result = (*(uint64_t (**)(uint64_t, char **, unsigned char *, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, a2, a3, a5, a6);
  if (v18) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 184))(a1, *(void *)(*(void *)a3 + 16));
  }
  if (v12) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)a1 + 264))(a1, *(void *)(*(void *)a3 + 16), v12);
  }
  return result;
}

void sub_222A44B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t SLPronouncerImpl::AppendUnitModifier(uint64_t result, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12 = result;
  switch(a3)
  {
    case '3':
      unsigned int v15 = *(uint64_t (**)(void))(*(void *)result + 216);
      goto LABEL_8;
    case '2':
      unsigned int v15 = *(uint64_t (**)(void))(*(void *)result + 216);
LABEL_8:
      uint64_t result = v15();
      uint64_t v13 = result;
      uint64_t v14 = a6;
      if (!result) {
        break;
      }
      goto LABEL_9;
    case '/':
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 216))(result, 228);
      uint64_t v13 = result;
      uint64_t v14 = a6 - 1;
      if (result) {
LABEL_9:
      }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 232))(v12, v13, a5, v14, 1);
      break;
  }
  if (a2)
  {
    *(unsigned char *)(a5 + 24) = 2;
    unsigned int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 240);
    return v16(v12, a2, a5, a4, a6, a7);
  }
  return result;
}

uint64_t SLPronouncerImpl::SymbolLookup(uint64_t a1, uint64_t a2, unint64_t a3, char *__s1)
{
  if (!a3) {
    return 0;
  }
  unint64_t v5 = a3;
  while (1)
  {
    uint64_t v8 = a2 + 16 * (v5 >> 1);
    int v9 = strcmp(__s1, *(const char **)v8);
    if (!v9) {
      break;
    }
    if (v9 <= 0)
    {
      v5 >>= 1;
    }
    else
    {
      a2 = v8 + 16;
      unint64_t v5 = (uint64_t)(16 * v5 - (16 * (v5 >> 1) + 16)) >> 4;
    }
    if (!v5) {
      return 0;
    }
  }
  uint64_t v11 = *(void *)(v8 + 8);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216);
  return v12(a1, v11);
}

uint64_t SLPronouncerImpl::AppendSymbol(uint64_t result, char **a2)
{
  if (a2)
  {
    for (i = *a2; !*i || *i == 33; ++i)
      ;
    uint64_t v3 = strpbrk(i, " ;|");
    if (v3) {
      size_t v4 = v3 - i;
    }
    else {
      size_t v4 = strlen(i);
    }
    if (v4 == 1 && (*i & 0xFE) == 0x28) {
      operator new();
    }
    operator new();
  }
  return result;
}

void sub_222A4515C(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

uint64_t SLPronouncerImpl::AppendAccentedCharacterSpelling(SLPronouncerImpl *this, unsigned int a2, SLTokenList *a3, uint64_t a4, uint64_t a5)
{
  unsigned int v7 = a2 & 0x3F | (SLChar::sUniMap[(unint64_t)a2 >> 6] << 6);
  unsigned int v8 = (unsigned __int16)SLChar::sCharClass[v7];
  SLPronouncerImpl::AppendCharacterSpelling(this, SLChar::sFoldAll[v7] + a2, a3, a4, a5, (v8 & 0x9F) == 129);
  switch((v8 >> 8) & 7)
  {
    case 1u:
      uint64_t v9 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 119);
      goto LABEL_10;
    case 2u:
      uint64_t v9 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 120);
      goto LABEL_10;
    case 3u:
      uint64_t v9 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 121);
      goto LABEL_10;
    case 4u:
      uint64_t v9 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 122);
      goto LABEL_10;
    case 5u:
      uint64_t v9 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 123);
      goto LABEL_10;
    case 6u:
      uint64_t v9 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 124);
      goto LABEL_10;
    case 7u:
      uint64_t v9 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 125);
LABEL_10:
      uint64_t v10 = v9;
      break;
    default:
      uint64_t v10 = 0;
      break;
  }
  uint64_t v11 = *(uint64_t (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, void, void))(*(void *)this + 232);
  return v11(this, v10, a3, 0, 0);
}

void SLPronouncerImpl::AppendCharacterSpelling(SLPronouncerImpl *this, unsigned int a2, SLTokenList *a3, uint64_t a4, uint64_t a5)
{
  memset(&__p, 0, sizeof(__p));
  SLChar::PushUTF8(&__p, (unsigned __int16)(SLChar::sToUpper[a2 & 0x3F | (SLChar::sUniMap[(unint64_t)a2 >> 6] << 6)] + a2));
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v10 = (*(uint64_t (**)(SLPronouncerImpl *, std::string *))(*(void *)this + 208))(this, p_p);
  if (!v10) {
    operator new();
  }
  (*(void (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)this + 232))(this, v10, a3, a4, a5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_222A45670(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SLPronouncerImpl::PronounceCharByChar(SLPronouncerImpl *this, SLToken *a2, SLTokenList *a3, char a4)
{
  if ((a4 & 0x20) != 0) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
  uint64_t v8 = -4;
  if ((*((unsigned char *)a2 + 18) & 8) == 0) {
    uint64_t v8 = -2;
  }
  uint64_t v9 = *((void *)a2 + 7);
  uint64_t v10 = *((void *)a2 + 8) + v8;
  if (v9 != v10)
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 2;
    if ((a4 & 0x20) != 0) {
      uint64_t v14 = 4;
    }
    unint64_t v20 = v14;
    uint64_t v21 = *((void *)a2 + 4);
    do
    {
      unsigned int v15 = *(unsigned __int16 *)(v9 + 2 * v13);
      if ((a4 & 0x40) != 0 || v15 >= 0x20)
      {
        if (v7 == v13
          && (v20 < ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1 || (*((unsigned char *)a2 + 18) & 0x20) != 0)
          && *((unsigned char *)a2 + 2) != 4)
        {
          *((unsigned char *)a3 + 25) = 4;
        }
        if (a4 < 0 && v15 == 38)
        {
          uint64_t v16 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 118);
          (*(void (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)this + 232))(this, v16, a3, v21 + v13, 1);
        }
        else if ((a4 & 0x20) == 0 || (v13 & 1) == 0)
        {
          SLPronouncerImpl::AppendCharacterSpelling(this, v15, a3, v21 + v13, v7);
        }
      }
      ++v13;
      v12 += 2;
    }
    while (v9 + v12 != v10);
  }
  if (*((void *)a3 + 2))
  {
    uint64_t v17 = *((void *)a3 + 1);
    *(_WORD *)(*(void *)(v17 + 16) + 1) = *(_WORD *)((char *)a2 + 1);
    *(_DWORD *)(*(void *)(*(void *)a3 + 16) + 16) |= *((_DWORD *)a2 + 4) & 1;
    for (i = *(SLTokenList **)(v17 + 8); i != a3; i = (SLTokenList *)*((void *)i + 1))
      *(unsigned char *)(*((void *)i + 2) + 1) = 1;
    if ((*((unsigned char *)a2 + 18) & 8) != 0)
    {
      v19 = *(void (**)(SLPronouncerImpl *))(*(void *)this + 184);
      v19(this);
    }
  }
}

uint64_t SLPronouncerImpl::PronouncePhoneNumber(SLPronouncerImpl *this, SLToken *a2, SLTokenList *a3)
{
  *((unsigned char *)a3 + 24) = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 168))(this, 1);
  unsigned __int8 v6 = (unsigned __int16 *)*((void *)a2 + 7);
  unint64_t v7 = *((void *)a2 + 8) - 2;
  if (v6 != (unsigned __int16 *)v7)
  {
    int v8 = 0;
    uint64_t v9 = *((void *)a2 + 4);
    do
    {
      unint64_t v10 = *v6;
      int v11 = SLChar::sCharClass[v10 & 0x3F | (SLChar::sUniMap[v10 >> 6] << 6)] & 0x1F;
      if (v11 == 1)
      {
        SLPronouncerImpl::AppendCharacterSpelling(this, v10, a3, v9, 1);
        *((unsigned char *)a3 + 24) = 1;
      }
      else if (v11 == 2)
      {
        if (v10 == 56 && v8 <= 1 && (unint64_t)(v6 + 2) < v7 && v6[1] == 48 && v6[2] == 48)
        {
          uint64_t v12 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 134);
          (*(void (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)this + 232))(this, v12, a3, v9, 1);
          *((unsigned char *)a3 + 24) = 1;
          uint64_t v13 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 155);
          (*(void (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)this + 232))(this, v13, a3, v9 + 1, 2);
          *((unsigned char *)a3 + 24) = (*(uint64_t (**)(SLPronouncerImpl *, void))(*(void *)this + 168))(this, 0);
          v9 += 2;
          v8 += 2;
          v6 += 2;
        }
        else
        {
          uint64_t v16 = (*(uint64_t (**)(SLPronouncerImpl *, unint64_t))(*(void *)this + 216))(this, v10 + 78);
          (*(void (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)this + 232))(this, v16, a3, v9, 1);
          *((unsigned char *)a3 + 24) = 1;
        }
        ++v8;
      }
      else
      {
        uint64_t v14 = *(void *)this;
        if (v10 == 43)
        {
          uint64_t v15 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(v14 + 216))(this, 218);
          (*(void (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)this + 232))(this, v15, a3, v9, 1);
        }
        else
        {
          *((unsigned char *)a3 + 24) = (*(uint64_t (**)(SLPronouncerImpl *, void))(v14 + 168))(this, 0);
        }
      }
      ++v6;
      ++v9;
    }
    while (v6 != (unsigned __int16 *)v7);
  }
  uint64_t result = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 168))(this, 1);
  *((unsigned char *)a3 + 24) = result;
  return result;
}

uint64_t SLPronouncerImpl::PronounceWordByWord(uint64_t this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v29 = this;
  uint64_t v3 = (uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1;
  unint64_t v4 = v3 - 1;
  if (v3 != 1)
  {
    uint64_t v6 = 0;
    uint64_t v7 = v3 - 2;
    uint64_t v27 = v3 - 3;
    uint64_t v28 = v3 - 4;
    uint64_t v30 = v3 - 2;
    do
    {
      if (v4 - v6 < 2)
      {
        BOOL v9 = 0;
      }
      else
      {
        uint64_t v8 = *((void *)a2 + 7);
        if ((SLChar::sCharClass[*(_WORD *)(v8 + 2 * v6) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v8 + 2 * v6) >> 6] << 6)] & 0x9F) == 0x81)
        {
          BOOL v9 = 1;
        }
        else
        {
          unint64_t v10 = *(unsigned __int16 *)(v8 + 2 * v6 + 2);
          BOOL v9 = (SLChar::sCharClass[v10 & 0x3F | (SLChar::sUniMap[v10 >> 6] << 6)] & 0x9F) == 129;
        }
      }
      if (v6 + 1 >= v4)
      {
        uint64_t v18 = 0;
        unint64_t v13 = v6 + 1;
        goto LABEL_37;
      }
      int v11 = 0;
      uint64_t v12 = *((void *)a2 + 7);
      unint64_t v13 = v6;
      while (1)
      {
        unint64_t v14 = *(unsigned __int16 *)(v12 + 2 * v13 + 2);
        int v15 = (unsigned __int16)SLChar::sCharClass[v14 & 0x3F | (SLChar::sUniMap[v14 >> 6] << 6)];
        if (v15 == 4)
        {
          if (v28 == v13)
          {
            if (*(_WORD *)(v12 + 2 * v7) == 115)
            {
              int v17 = (*(uint64_t (**)(uint64_t))(*(void *)v29 + 176))(v29);
              if (v17) {
                unint64_t v13 = v4;
              }
              else {
                unint64_t v13 = v27;
              }
              uint64_t v18 = v17 ^ 1u;
              goto LABEL_37;
            }
            unint64_t v13 = v27;
          }
          else
          {
            ++v13;
          }
          uint64_t v18 = 1;
          goto LABEL_37;
        }
        int v16 = v15 & 0x9F;
        if (v9)
        {
          if (v16 != 129)
          {
            uint64_t v18 = 0;
            ++v13;
            goto LABEL_37;
          }
          v11 |= (v15 & 0x20) >> 5;
          goto LABEL_16;
        }
        if (v16 == 129) {
          break;
        }
LABEL_16:
        if (v7 == ++v13)
        {
          uint64_t v18 = 0;
          unint64_t v13 = v4;
          goto LABEL_37;
        }
      }
      if (v14 == 115)
      {
        if (v27 == v13)
        {
          uint64_t v18 = 0;
          goto LABEL_36;
        }
        unint64_t v19 = *(unsigned __int16 *)(v12 + 2 * v13 + 4);
        __int16 v20 = SLChar::sCharClass[v19 & 0x3F | (SLChar::sUniMap[v19 >> 6] << 6)];
        if (v20 == 4)
        {
          uint64_t v18 = 1;
          goto LABEL_36;
        }
        uint64_t v18 = 0;
        if ((v20 & 0x9F) == 1) {
LABEL_36:
        }
          v13 += 2;
      }
      else
      {
        uint64_t v18 = 0;
      }
LABEL_37:
      if (v6 || v13 != 2)
      {
        if (v6)
        {
          if (v13 < v4 && v13 - v6 == 1)
          {
            uint64_t v24 = *((void *)a2 + 7);
            unint64_t v25 = *(unsigned __int16 *)(v24 + 2 * (v6 - 1));
            if (SLChar::sCharClass[v25 & 0x3F | (SLChar::sUniMap[v25 >> 6] << 6)] == 4
              && SLChar::sCharClass[*(_WORD *)(v24 + 2 * v13) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v24 + 2 * v13) >> 6] << 6)] == 4)
            {
              std::string::basic_string[abi:ne180100]<0>(&v32, "'");
              unint64_t v26 = *(unsigned __int16 *)(*((void *)a2 + 7) + 2 * v6);
              SLChar::PushUTF8(&v32, (unsigned __int16)(SLChar::sToUpper[v26 & 0x3F | (SLChar::sUniMap[v26 >> 6] << 6)] + v26));
              std::string::push_back(&v32, 39);
              operator new();
            }
          }
        }
LABEL_48:
        operator new();
      }
      uint64_t v21 = (_WORD *)*((void *)a2 + 7);
      if (*v21 != 77 || v21[v6 + 1] != 99) {
        goto LABEL_48;
      }
      uint64_t v22 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v29 + 216))(v29, 231);
      this = (*(uint64_t (**)(uint64_t, uint64_t, SLTokenList *, void, uint64_t))(*(void *)v29 + 232))(v29, v22, a3, *((void *)a2 + 4), 2);
      uint64_t v23 = *(void *)(*(void *)a3 + 16);
      *(_DWORD *)(v23 + 16) &= ~8u;
      *(unsigned char *)(v23 + 5) = 1;
      uint64_t v6 = v18 + 2;
      uint64_t v7 = v30;
    }
    while (v18 + 2 < v4);
  }
  return this;
}

void sub_222A46460(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  MEMORY[0x223CA4030](v23, 0x10F0C4034644DEDLL);
  if (a23 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void SLPronouncerImpl::PronounceURL(SLPronouncerImpl *this, SLToken *a2, SLTokenList *a3)
{
}

void sub_222A46F28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  std::__list_imp<SLToken *>::clear(&a16);
  if (a27 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v27 - 89) < 0) {
    operator delete(*(void **)(v27 - 112));
  }
  _Unwind_Resume(a1);
}

uint64_t SLPronouncerImpl::IsURLDomain(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t *a5)
{
  *a5 = 0;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v21 = 0;
  if (a4 != 46)
  {
LABEL_13:
    if (a3 != 46 || ((a4 - 33) > 0x1F || ((1 << (a4 - 33)) & 0x82004011) == 0) && a4) {
      goto LABEL_30;
    }
    std::operator+<char>();
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v21 = v19;
    *(_OWORD *)std::string __p = *(_OWORD *)v18;
    unint64_t v13 = v19 >= 0 ? __p : (void **)__p[0];
    uint64_t v14 = (*(uint64_t (**)(uint64_t, void **))(*(void *)a1 + 208))(a1, v13);
    *a5 = v14;
    if (!v14)
    {
      unint64_t v15 = *(unsigned __int8 *)(a2 + 23);
      if ((v15 & 0x80u) != 0) {
        unint64_t v15 = *(void *)(a2 + 8);
      }
      if (v15 >= 3) {
        goto LABEL_30;
      }
    }
LABEL_28:
    uint64_t v16 = 1;
    goto LABEL_31;
  }
  if ((a3 - 33) <= 0x1F && ((1 << (a3 - 33)) & 0x82004011) != 0 || !a3)
  {
    std::operator+<char>();
    if (SHIBYTE(v21) < 0) {
      operator delete(__p[0]);
    }
    uint64_t v21 = v19;
    *(_OWORD *)std::string __p = *(_OWORD *)v18;
    HIBYTE(v19) = 0;
    LOBYTE(v18[0]) = 0;
    if (v21 >= 0) {
      unint64_t v10 = __p;
    }
    else {
      unint64_t v10 = (void **)__p[0];
    }
    uint64_t v11 = (*(uint64_t (**)(uint64_t, void **))(*(void *)a1 + 208))(a1, v10);
    *a5 = v11;
    if (v11) {
      goto LABEL_28;
    }
    unint64_t v12 = *(unsigned __int8 *)(a2 + 23);
    if ((v12 & 0x80u) != 0) {
      unint64_t v12 = *(void *)(a2 + 8);
    }
    if (v12 < 3) {
      goto LABEL_28;
    }
    goto LABEL_13;
  }
LABEL_30:
  uint64_t v16 = 0;
LABEL_31:
  if (SHIBYTE(v21) < 0) {
    operator delete(__p[0]);
  }
  return v16;
}

void sub_222A47244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::list<SLToken *>::splice(uint64_t result, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  if (a4 != a5)
  {
    unint64_t v5 = (void *)*a5;
    if (result != a3)
    {
      uint64_t v6 = 1;
      if (v5 != a4)
      {
        uint64_t v7 = a4;
        do
        {
          uint64_t v7 = (void *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(void *)(a3 + 16) -= v6;
      *(void *)(result + 16) += v6;
    }
    uint64_t v8 = *a4;
    *(void *)(v8 + 8) = v5[1];
    *(void *)v5[1] = v8;
    uint64_t v9 = *a2;
    *(void *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

void SLPronouncerImpl::PronounceURLSymbol(SLPronouncerImpl *this, unsigned int a2, SLTokenList *a3, uint64_t a4)
{
  unsigned int v6 = a2;
  if (a2 >= 0x80)
  {
    if (SLChar::sCharClass[a2 & 0x3F | (SLChar::sUniMap[(unint64_t)a2 >> 6] << 6)] != 6) {
      goto LABEL_6;
    }
    unsigned int v6 = 45;
  }
  v9[0] = 47;
  v9[2] = 0;
  v9[1] = v6;
  uint64_t v8 = (*(uint64_t (**)(SLPronouncerImpl *, unsigned char *))(*(void *)this + 208))(this, v9);
  if (v8)
  {
    (*(void (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)this + 232))(this, v8, a3, a4, 1);
    return;
  }
LABEL_6:
  SLPronouncerImpl::AppendCharacterSpelling(this, v6, a3, a4, 1);
}

uint64_t SLPronouncerImpl::PronounceNumber(uint64_t a1, uint64_t a2, unsigned char *a3, void *a4, uint64_t a5, uint64_t a6)
{
  int v9 = *(unsigned __int8 *)a4;
  uint64_t v10 = 10 * *(unsigned __int8 *)a4 + 20;
  uint64_t v11 = a4[2];
  if (v11 > v10 || (uint64_t v12 = a4[6], v12 > 5) || (v15 = a4[4], v16 = v15 | v12, !v9) && !v16 && a4[7] >= 0xF4241uLL) {
    operator new();
  }
  if (v9) {
    uint64_t v17 = a5 | 0x20;
  }
  else {
    uint64_t v17 = a5;
  }
  if (v16)
  {
    uint64_t v18 = v17 | 0x100;
    *((_WORD *)a3 + 12) = *(_WORD *)(a2 + 1);
    uint64_t v19 = a3 + 24;
    if (v15)
    {
      (*(void (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56))(a1, a2, a4[1]);
      unint64_t v20 = a4[7];
      if (v20 > 0x14 || (uint64_t)a4[4] >= 5) {
        unsigned char *v19 = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 168))(a1, v20 > 0x4E20);
      }
      uint64_t v21 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 209);
      (*(void (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, v21, a3, *(void *)(a2 + 32) + a4[3] - 1, 1);
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void, unsigned char *, uint64_t, uint64_t))(*(void *)a1 + 64))(a1, a2, a4[3], a4[4], a3, v18, a6);
      goto LABEL_25;
    }
  }
  else
  {
    if (v17 & 3 | a6)
    {
      uint64_t v18 = v17 | 0x100;
      a3[24] = *(unsigned char *)(a2 + 1);
      uint64_t v19 = a3 + 24;
    }
    else
    {
      a3[24] = *(unsigned char *)(a2 + 1);
      uint64_t v19 = a3 + 24;
      uint64_t v18 = v17;
    }
    a3[25] = *(unsigned char *)(a2 + 2);
  }
  if ((v18 & 0x200) != 0)
  {
    uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 219);
    (*(void (**)(uint64_t, uint64_t, unsigned char *, void, void))(*(void *)a1 + 232))(a1, v23, a3, 0, 0);
    uint64_t v11 = a4[2];
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, unsigned char *, uint64_t, uint64_t))(*(void *)a1 + 56))(a1, a2, a4[1], v11, a3, v18, a6);
  if ((v18 & 0x200) != 0)
  {
    uint64_t v24 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 227);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unsigned char *, void, void))(*(void *)a1 + 232))(a1, v24, a3, 0, 0);
  }
LABEL_25:
  if (a4[6])
  {
    a3[24] = (*(uint64_t (**)(uint64_t, BOOL))(*(void *)a1 + 168))(a1, a4[7] > 0x4E20uLL);
    uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 213);
    (*(void (**)(uint64_t, uint64_t, unsigned char *, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, v25, a3, *(void *)(a2 + 32) + a4[5] - 1, 1);
    uint64_t v26 = a4[5];
    if (*(_WORD *)(*(void *)(a2 + 56) + 2 * v26) == 43) {
      uint64_t v27 = v26 + 1;
    }
    else {
      uint64_t v27 = a4[5];
    }
    uint64_t v28 = a4[6] - (*(_WORD *)(*(void *)(a2 + 56) + 2 * v26) == 43);
    uint64_t v18 = v18 & 2 | (*(unsigned int (**)(uint64_t))(*(void *)a1 + 272))(a1);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned char *, uint64_t, void))(*(void *)a1 + 56))(a1, a2, v27, v28, a3, v18 | 0x100, 0);
  }
  if ((v18 & 2) != 0) {
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 184))(a1, *(void *)(*(void *)a3 + 16));
  }
  if (a4[7] > 0x3E7uLL || (uint64_t)a4[4] > 1 || a4[6])
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 168))(a1, 0);
    unsigned char *v19 = result;
  }
  return result;
}

void sub_222A479AC(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLPronouncerImpl::PronounceFraction(SLPronouncerImpl *this, SLToken *a2, SLTokenList *a3)
{
  if ((*((unsigned char *)a2 + 17) & 4) != 0)
  {
    uint64_t v6 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t))(*(void *)this + 216))(this, 210);
    (*(void (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, void, void))(*(void *)this + 232))(this, v6, a3, 0, 0);
  }
  memset(&__p, 0, sizeof(__p));
  SLChar::PushUTF8(&__p, **((unsigned __int16 **)a2 + 7));
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  uint64_t v8 = (char **)(*(uint64_t (**)(SLPronouncerImpl *, std::string *))(*(void *)this + 208))(this, p_p);
  int v9 = v8;
  if ((*((unsigned char *)a2 + 17) & 4) != 0)
  {
    uint64_t v10 = strchr(*v8, 59);
    if (v10)
    {
      v11[1] = v9[1];
      v11[0] = v10 + 1;
      int v9 = (char **)v11;
    }
  }
  (*(void (**)(SLPronouncerImpl *, char **, SLTokenList *, void, uint64_t))(*(void *)this + 232))(this, v9, a3, *((void *)a2 + 4), 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_222A47B40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *SLPronouncerImpl::PronounceRoman(SLPronouncerImpl *this, SLToken *a2, CFRange a3, unint64_t a4, SLTokenList *a5, uint64_t a6, uint64_t a7)
{
  CFIndex length = a3.length;
  if ((*((unsigned char *)a2 + 18) & 0x40) != 0)
  {
    uint64_t v13 = (*(uint64_t (**)(SLPronouncerImpl *, uint64_t, CFIndex))(*(void *)this + 216))(this, 219, a3.location);
    (*(void (**)(SLPronouncerImpl *, uint64_t, SLTokenList *, void, void))(*(void *)this + 232))(this, v13, a5, 0, 0);
  }
  uint64_t v14 = (void **)((char *)a2 + 56);
  uint64_t v15 = (char *)*((void *)a2 + 7);
  *((void *)a2 + 8) = v15;
  if (a4 < 0x3E8)
  {
    unint64_t v18 = a4;
  }
  else
  {
    __int16 v16 = (char)(a4 / 0x3E8 + 48);
    unint64_t v17 = *((void *)a2 + 9);
    if ((unint64_t)v15 >= v17)
    {
      unint64_t v19 = v17 - (void)v15;
      if (v19 <= 1) {
        uint64_t v20 = 1;
      }
      else {
        uint64_t v20 = v19;
      }
      if (v19 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v21);
      uint64_t v23 = (char *)*((void *)a2 + 7);
      uint64_t v24 = (char *)*((void *)a2 + 8);
      uint64_t v26 = &v22[v25];
      *uint64_t v22 = v16;
      uint64_t v15 = (char *)(v22 + 1);
      while (v24 != v23)
      {
        __int16 v27 = *((_WORD *)v24 - 1);
        v24 -= 2;
        *--uint64_t v22 = v27;
      }
      *((void *)a2 + 7) = v22;
      *((void *)a2 + 8) = v15;
      *((void *)a2 + 9) = v26;
      if (v23) {
        operator delete(v23);
      }
    }
    else
    {
      *(_WORD *)uint64_t v15 = v16;
      v15 += 2;
    }
    *((void *)a2 + 8) = v15;
    unint64_t v18 = a4 % 0x3E8;
  }
  if (a4 > 0x3E7 || v18 >= 0x64)
  {
    __int16 v28 = ((unsigned __int16)v18 / 0x64u) | 0x30;
    unint64_t v29 = *((void *)a2 + 9);
    if ((unint64_t)v15 >= v29)
    {
      uint64_t v31 = (char *)*v14;
      uint64_t v32 = v15 - (unsigned char *)*v14;
      if (v32 <= -3) {
        goto LABEL_100;
      }
      uint64_t v33 = v32 >> 1;
      unint64_t v34 = v29 - (void)v31;
      if (v34 <= (v32 >> 1) + 1) {
        unint64_t v35 = v33 + 1;
      }
      else {
        unint64_t v35 = v34;
      }
      if (v34 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v36 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v36 = v35;
      }
      if (v36)
      {
        v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v36);
        uint64_t v31 = (char *)*((void *)a2 + 7);
        uint64_t v15 = (char *)*((void *)a2 + 8);
      }
      else
      {
        v37 = 0;
      }
      char v38 = &v37[2 * v33];
      int v39 = &v37[2 * v36];
      *(_WORD *)char v38 = v28;
      uint64_t v30 = v38 + 2;
      while (v15 != v31)
      {
        __int16 v40 = *((_WORD *)v15 - 1);
        v15 -= 2;
        *((_WORD *)v38 - 1) = v40;
        v38 -= 2;
      }
      *((void *)a2 + 7) = v38;
      *((void *)a2 + 8) = v30;
      *((void *)a2 + 9) = v39;
      if (v31) {
        operator delete(v31);
      }
    }
    else
    {
      *(_WORD *)uint64_t v15 = v28;
      uint64_t v30 = v15 + 2;
    }
    *((void *)a2 + 8) = v30;
    v18 %= 0x64uLL;
    uint64_t v15 = v30;
  }
  else if (v18 < 0xA)
  {
    goto LABEL_59;
  }
  unsigned int v41 = v18 / 0xAu + 48;
  unint64_t v42 = *((void *)a2 + 9);
  if ((unint64_t)v15 >= v42)
  {
    v44 = (char *)*v14;
    uint64_t v45 = v15 - (unsigned char *)*v14;
    if (v45 <= -3) {
      goto LABEL_100;
    }
    uint64_t v46 = v45 >> 1;
    unint64_t v47 = v42 - (void)v44;
    if (v47 <= (v45 >> 1) + 1) {
      unint64_t v48 = v46 + 1;
    }
    else {
      unint64_t v48 = v47;
    }
    if (v47 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v49 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v49 = v48;
    }
    if (v49)
    {
      v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v49);
      v44 = (char *)*((void *)a2 + 7);
      uint64_t v15 = (char *)*((void *)a2 + 8);
    }
    else
    {
      v50 = 0;
    }
    v51 = &v50[2 * v46];
    v52 = &v50[2 * v49];
    *(_WORD *)v51 = v41;
    v43 = v51 + 2;
    while (v15 != v44)
    {
      __int16 v53 = *((_WORD *)v15 - 1);
      v15 -= 2;
      *((_WORD *)v51 - 1) = v53;
      v51 -= 2;
    }
    *((void *)a2 + 7) = v51;
    *((void *)a2 + 8) = v43;
    *((void *)a2 + 9) = v52;
    if (v44) {
      operator delete(v44);
    }
  }
  else
  {
    *(_WORD *)uint64_t v15 = v41;
    v43 = v15 + 2;
  }
  *((void *)a2 + 8) = v43;
  v18 %= 0xAuLL;
  uint64_t v15 = v43;
LABEL_59:
  __int16 v54 = v18 | 0x30;
  v55 = (char *)*((void *)a2 + 9);
  if (v15 >= v55)
  {
    v57 = (char *)*v14;
    uint64_t v58 = v15 - (unsigned char *)*v14;
    if (v58 <= -3) {
      goto LABEL_100;
    }
    uint64_t v59 = v58 >> 1;
    unint64_t v60 = v55 - v57;
    if (v60 <= (v58 >> 1) + 1) {
      unint64_t v61 = v59 + 1;
    }
    else {
      unint64_t v61 = v60;
    }
    if (v60 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v62 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v62 = v61;
    }
    if (v62)
    {
      v63 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v62);
      v57 = (char *)*((void *)a2 + 7);
      uint64_t v15 = (char *)*((void *)a2 + 8);
    }
    else
    {
      v63 = 0;
    }
    v64 = &v63[2 * v59];
    v55 = &v63[2 * v62];
    *(_WORD *)v64 = v54;
    v56 = v64 + 2;
    while (v15 != v57)
    {
      __int16 v65 = *((_WORD *)v15 - 1);
      v15 -= 2;
      *((_WORD *)v64 - 1) = v65;
      v64 -= 2;
    }
    *((void *)a2 + 7) = v64;
    *((void *)a2 + 8) = v56;
    *((void *)a2 + 9) = v55;
    if (v57)
    {
      operator delete(v57);
      v55 = (char *)*((void *)a2 + 9);
    }
  }
  else
  {
    *(_WORD *)uint64_t v15 = v54;
    v56 = v15 + 2;
  }
  *((void *)a2 + 8) = v56;
  if (v56 < v55)
  {
    *(_WORD *)v56 = 0;
    v66 = v56 + 2;
    goto LABEL_93;
  }
  v67 = (char *)*v14;
  uint64_t v68 = v56 - (unsigned char *)*v14;
  if (v68 <= -3) {
LABEL_100:
  }
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  uint64_t v69 = v68 >> 1;
  unint64_t v70 = v55 - v67;
  if (v70 <= (v68 >> 1) + 1) {
    unint64_t v71 = v69 + 1;
  }
  else {
    unint64_t v71 = v70;
  }
  if (v70 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v72 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v72 = v71;
  }
  if (v72)
  {
    v73 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v72);
    v67 = (char *)*((void *)a2 + 7);
    v56 = (char *)*((void *)a2 + 8);
  }
  else
  {
    v73 = 0;
  }
  v74 = &v73[2 * v69];
  v75 = &v73[2 * v72];
  *(_WORD *)v74 = 0;
  v66 = v74 + 2;
  while (v56 != v67)
  {
    __int16 v76 = *((_WORD *)v56 - 1);
    v56 -= 2;
    *((_WORD *)v74 - 1) = v76;
    v74 -= 2;
  }
  *((void *)a2 + 7) = v74;
  *((void *)a2 + 8) = v66;
  *((void *)a2 + 9) = v75;
  if (v67) {
    operator delete(v67);
  }
LABEL_93:
  *((void *)a2 + 8) = v66;
  uint64_t v77 = (((uint64_t)v66 - *((void *)a2 + 7)) >> 1) - 1;
  SLTokenList::SLTokenList((SLTokenList *)&v87);
  (*(void (**)(SLPronouncerImpl *, SLToken *, void, uint64_t, uint64_t *, uint64_t, uint64_t))(*(void *)this + 56))(this, a2, 0, v77, &v87, a6, a7);
  CFIndex v78 = length + a7;
  while (1)
  {
    uint64_t v79 = v89;
    if (!v89) {
      break;
    }
    v80 = (void **)__p;
    uint64_t v81 = *((void *)__p + 2);
    uint64_t v82 = *(void *)__p;
    *(void *)(v82 + 8) = *((void *)__p + 1);
    *v80[1] = v82;
    uint64_t v89 = v79 - 1;
    operator delete(v80);
    *(_DWORD *)(v81 + 16) |= 0x10u;
    if (v89)
    {
      uint64_t v83 = 0;
      CFIndex v84 = 0;
    }
    else
    {
      uint64_t v83 = *((void *)a2 + 4);
      CFIndex v84 = v78;
    }
    *(void *)(v81 + 32) = v83;
    *(void *)(v81 + 40) = v84;
    SLTokenList::push_back(a5, (SLToken *)v81);
  }
  return std::__list_imp<SLToken *>::clear(&v87);
}

void sub_222A480E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  std::__list_imp<SLToken *>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SLPronouncerImpl::PronounceInteger(uint64_t this, SLToken *a2, CFRange a3, SLTokenList *a4, unint64_t a5, uint64_t a6)
{
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  uint64_t v10 = this;
  if (a3.length < 1)
  {
    CFIndex v18 = a3.location;
    goto LABEL_13;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  CFIndex v13 = 2 * a3.location;
  uint64_t v14 = 1;
  while (1)
  {
    uint64_t v15 = *((void *)a2 + 7);
    int v16 = *(unsigned __int16 *)(v15 + v13 + 2 * v11);
    switch(v16)
    {
      case '#':
        uint64_t v17 = 217;
        break;
      case '-':
        uint64_t v17 = 214;
        break;
      case '+':
        uint64_t v17 = 216;
        break;
      default:
        goto LABEL_22;
    }
    this = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, v17);
    if (!this) {
      break;
    }
    this = (*(uint64_t (**)(uint64_t, uint64_t, SLTokenList *, CFIndex, uint64_t))(*(void *)v10 + 232))(v10, this, a4, location + v11 + *((void *)a2 + 4), 1);
    v12 -= 2;
    ++v11;
    --v14;
    if (length + v14 <= 1)
    {
      CFIndex length = 0;
      CFIndex v18 = location + v11;
LABEL_13:
      char v19 = a5;
      uint64_t v20 = *((void *)a2 + 7);
      goto LABEL_14;
    }
  }
  uint64_t v15 = *((void *)a2 + 7);
  int v16 = *(unsigned __int16 *)(v15 + v13 + 2 * v11);
LABEL_22:
  unint64_t v31 = length - v11;
  uint64_t v32 = location + v11;
  if ((a5 & 0x100) != 0 || v16 != 48)
  {
    CFIndex v38 = v13 - v12;
    uint64_t v39 = -v11;
    uint64_t v20 = *((void *)a2 + 7);
    CFIndex v18 = v32 + v31;
    while (*(_WORD *)(v20 + v38) == 48)
    {
      --v39;
      v38 += 2;
      if (length + v39 + 1 <= 1)
      {
        CFIndex length = 0;
        char v19 = a5;
LABEL_14:
        uint64_t v21 = (char *)(v20 + 2 * v18);
        uint64_t v22 = *((void *)a2 + 4) + v18;
LABEL_15:
        LOBYTE(v23) = 0;
        switch(length)
        {
          case 0:
            if ((v19 & 4) != 0) {
              return this;
            }
            if (v19) {
              uint64_t v24 = 167;
            }
            else {
              uint64_t v24 = 126;
            }
            uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, v24);
            uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)v10 + 232);
            uint64_t v27 = v10;
            __int16 v28 = a4;
            uint64_t v29 = v22 - 1;
            uint64_t v30 = a6 + 1;
            goto LABEL_91;
          case 1:
            uint64_t v63 = v19 & 1;
            uint64_t v64 = a6 + 1;
            goto LABEL_88;
          case 2:
            int v66 = *(unsigned __int16 *)v21;
            if (v66 != 48) {
              goto LABEL_122;
            }
            if (*((_WORD *)v21 + 1) == 48) {
              return this;
            }
            LOBYTE(v66) = 48;
            goto LABEL_122;
          case 3:
            goto LABEL_106;
          default:
            int v23 = 0;
            unint64_t v85 = v19 & 0x20;
            unint64_t v40 = v85 >> 5;
            uint64_t v41 = (v85 >> 5) + 3;
            v90 = a4;
            break;
        }
        while (2)
        {
          char v42 = 48;
          char v43 = 48;
          switch(length % v41)
          {
            case 0:
            case 3:
              char v44 = *v21;
              v21 += 2;
              char v42 = v44;
              ++v22;
              goto LABEL_43;
            case 1:
              goto LABEL_44;
            case 2:
LABEL_43:
              char v45 = *v21;
              v21 += 2;
              char v43 = v45;
              ++v22;
LABEL_44:
              char v47 = *v21;
              v21 += 2;
              char v46 = v47;
              uint64_t v48 = v22 + 1;
              break;
            default:
              uint64_t v48 = v22;
              char v43 = 48;
              char v46 = 48;
              break;
          }
          uint64_t v49 = (length - 1) / v41;
          v21 += 2 * v40;
          uint64_t v22 = v48 + v40;
          CFIndex length = (int)v41 * (int)v49 - (int)v40;
          if (v42 == 48 && v43 == 48 && v46 == 48)
          {
            a4 = v90;
LABEL_85:
            if ((int)length <= 3) {
              goto LABEL_106;
            }
            continue;
          }
          break;
        }
        uint64_t v89 = v48 + v40;
        int v50 = v43;
        int v86 = v42;
        SLPronouncerImpl::PronounceThreeDigits(v10, v42, v43, v46, v48 - 3, (uint64_t)v90, 0, 0);
        if ((int)length < 1)
        {
LABEL_59:
          *((unsigned char *)v90 + 24) = 2;
          if ((v19 & 1) == 0)
          {
            char v58 = 0;
            goto LABEL_62;
          }
          uint64_t v54 = (*(uint64_t (**)(uint64_t, void))(*(void *)v10 + 216))(v10, (int)v49 + 195);
          BOOL v55 = 0;
          CFIndex v56 = length + a6;
          uint64_t v57 = v89;
        }
        else
        {
          v51 = v21;
          while (1)
          {
            uint64_t v52 = *(unsigned __int16 *)v51;
            if (v52 <= 0xFF
              && v52 != 48
              && (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v52 + 60) & 0x400) != 0)
            {
              break;
            }
            v51 += 2;
            if (v51 >= &v21[2 * length]) {
              goto LABEL_59;
            }
          }
          *((unsigned char *)v90 + 24) = 2;
          char v58 = 1;
LABEL_62:
          uint64_t v54 = (*(uint64_t (**)(uint64_t, void))(*(void *)v10 + 216))(v10, (int)v49 + 155);
          uint64_t v59 = v89 - 1;
          if (!v85) {
            uint64_t v59 = v48;
          }
          BOOL v55 = (v58 & 1) != 0;
          if (v58) {
            uint64_t v57 = v59;
          }
          else {
            uint64_t v57 = v89;
          }
          if (v58) {
            CFIndex v56 = v85 >> 5;
          }
          else {
            CFIndex v56 = length + a6;
          }
          char v19 = a5;
        }
        (*(void (**)(uint64_t, uint64_t, SLTokenList *, uint64_t, CFIndex))(*(void *)v10 + 232))(v10, v54, v90, v57, v56);
        if (!v55)
        {
          uint64_t v22 = v89;
          a4 = v90;
LABEL_106:
          int v74 = *((unsigned __int16 *)v21 + 1);
          if (v74 == 48 && *((_WORD *)v21 + 2) == 48)
          {
            int v75 = *v21;
            return SLPronouncerImpl::PronounceThreeDigits(v10, v75, 48, 48, v22, (uint64_t)a4, v19, a6);
          }
          uint64_t v76 = *(unsigned __int16 *)v21;
          if (v76 == 48)
          {
            if ((v23 & 1) == 0) {
              goto LABEL_119;
            }
          }
          else
          {
            uint64_t v77 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, (char)v76 + 78);
            (*(void (**)(uint64_t, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)v10 + 232))(v10, v77, a4, v22, 1);
            *((unsigned char *)a4 + 24) = 2;
            uint64_t v78 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, 155);
            (*(void (**)(uint64_t, uint64_t, SLTokenList *, uint64_t, void))(*(void *)v10 + 232))(v10, v78, a4, -1, 0);
            int v74 = *((unsigned __int16 *)v21 + 1);
          }
          if (v74 == 48) {
            uint64_t v79 = 211;
          }
          else {
            uint64_t v79 = 1167;
          }
          uint64_t v80 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, v79);
          (*(void (**)(uint64_t, uint64_t, SLTokenList *, uint64_t, void))(*(void *)v10 + 232))(v10, v80, a4, -1, 0);
          LOBYTE(v74) = v21[2];
LABEL_119:
          int v81 = v21[4];
          uint64_t v82 = v22 + 1;
          int v83 = (char)v74;
          uint64_t v84 = v10;
LABEL_123:
          return SLPronouncerImpl::PronounceTwoDigits(v84, v83, v81, v82, (uint64_t)a4, v19, a6);
        }
        BOOL v62 = (int)v49 > 1 || v86 > 48 || v50 > 49;
        if ((v62 | v23))
        {
          a4 = v90;
          *((unsigned char *)v90 + 24) = (*(uint64_t (**)(uint64_t, void))(*(void *)v10 + 168))(v10, 0);
          int v23 = 1;
        }
        else
        {
          int v23 = 1;
          a4 = v90;
        }
        uint64_t v22 = v89;
        goto LABEL_85;
      }
    }
    uint64_t v21 = (char *)(v20 + v38);
    uint64_t v67 = *((void *)a2 + 4);
    uint64_t v22 = location + v67 - v39;
    length += v39;
    if ((a5 & 0x80) == 0 || length != 3)
    {
      char v19 = a5;
      goto LABEL_15;
    }
    if (*(_WORD *)(v20 + v38 + 2) == 48 && !*(_WORD *)(v20 + v38 + 4))
    {
      LOBYTE(v23) = 0;
      char v19 = a5;
      goto LABEL_106;
    }
    uint64_t v68 = *v21;
    CFIndex v69 = location + v67 - v39;
    CFIndex v70 = v69;
    uint64_t v63 = a5 & 1;
    uint64_t v64 = a6 + 1;
    uint64_t v71 = 119;
    if ((a5 & 1) == 0) {
      uint64_t v71 = 78;
    }
    uint64_t v72 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, v68 + v71);
    (*(void (**)(uint64_t, uint64_t, SLTokenList *, CFIndex, uint64_t))(*(void *)v10 + 232))(v10, v72, a4, v69, v64);
    int v66 = *(unsigned __int16 *)(v20 + v38 + 2);
    if (v66 != 48)
    {
      uint64_t v21 = (char *)(v20 + v38 + 2);
      uint64_t v22 = v70 + 1;
      char v19 = a5;
LABEL_122:
      int v81 = v21[2];
      int v83 = (char)v66;
      uint64_t v84 = v10;
      uint64_t v82 = v22;
      goto LABEL_123;
    }
    uint64_t v73 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, 136);
    uint64_t v22 = v69 + 2;
    (*(void (**)(uint64_t, uint64_t, SLTokenList *, CFIndex, uint64_t))(*(void *)v10 + 232))(v10, v73, a4, v69 + 1, 1);
    uint64_t v21 = (char *)(v20 + v38 + 4);
LABEL_88:
    uint64_t v65 = 119;
    if (!v63) {
      uint64_t v65 = 78;
    }
    uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, *v21 + v65);
    uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)v10 + 232);
    uint64_t v27 = v10;
    __int16 v28 = a4;
    uint64_t v29 = v22;
    uint64_t v30 = v64;
LABEL_91:
    return v26(v27, v25, v28, v29, v30);
  }
  else
  {
    BOOL v33 = (a5 & 0x10) == 0 && length - 2 == v11;
    uint64_t v34 = (a5 >> 3) & 1;
    if (v33) {
      LODWORD(v34) = 1;
    }
    if (v31 >= 2 && v34 && *(_WORD *)(v15 + v13 + 2 * v11 + 2) != 48)
    {
      uint64_t v32 = location + v11 + 1;
      uint64_t v35 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, 136);
      (*(void (**)(uint64_t, uint64_t, SLTokenList *, CFIndex, uint64_t))(*(void *)v10 + 232))(v10, v35, a4, location + v11 + *((void *)a2 + 4), 1);
      unint64_t v31 = ~v11 + length;
    }
    do
    {
      uint64_t v36 = v32 + *((void *)a2 + 4);
      uint64_t v37 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 216))(v10, *(char *)(*((void *)a2 + 7) + 2 * v32) + 78);
      this = (*(uint64_t (**)(uint64_t, uint64_t, SLTokenList *, uint64_t, uint64_t))(*(void *)v10 + 232))(v10, v37, a4, v36, 1);
      ++v32;
      --v31;
    }
    while (v31);
  }
  return this;
}

uint64_t SLPronouncerImpl::PronounceOneDigit(uint64_t a1, int a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v9 = a6 + 1;
  uint64_t v10 = 119;
  if ((a5 & 1) == 0) {
    uint64_t v10 = 78;
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, v10 + a2);
  uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232);
  return v12(a1, v11, a4, a3, v9);
}

uint64_t SLPronouncerImpl::PronounceTwoDigits(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v12 = result;
  if (a2 == 48)
  {
LABEL_13:
    if (a3 == 48) {
      return result;
    }
    *(unsigned char *)(a5 + 24) = 2;
    ++a4;
    CFIndex v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v12 + 216);
    uint64_t v14 = a7 + 1;
    uint64_t v25 = 119;
    if ((a6 & 1) == 0) {
      uint64_t v25 = 78;
    }
    uint64_t v15 = v25 + a3;
    goto LABEL_17;
  }
  if (a2 == 49)
  {
    CFIndex v13 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 216);
    uint64_t v14 = a7 + 2;
    if (a6) {
      uint64_t v15 = a3 + 129;
    }
    else {
      uint64_t v15 = a3 + 89;
    }
LABEL_17:
    uint64_t v17 = v13(v12, v15);
    CFIndex v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 232);
    uint64_t v19 = v12;
    uint64_t v20 = a5;
    uint64_t v21 = a4;
    uint64_t v22 = v14;
    goto LABEL_18;
  }
  int v16 = *(uint64_t (**)(uint64_t, void))(*(void *)result + 216);
  if (a3 != 48 || (a6 & 1) == 0)
  {
    uint64_t v23 = v16(result, a2 + 97);
    if (a3 == 48) {
      uint64_t v24 = a7 + 2;
    }
    else {
      uint64_t v24 = 1;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 232))(v12, v23, a5, a4, v24);
    goto LABEL_13;
  }
  uint64_t v17 = v16(result, (a2 + 137));
  CFIndex v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 232);
  uint64_t v19 = v12;
  uint64_t v20 = a5;
  uint64_t v21 = a4;
  uint64_t v22 = a7 + 2;
LABEL_18:
  return v18(v19, v17, v20, v21, v22);
}

uint64_t SLPronouncerImpl::PronounceThreeDigits(uint64_t result, int a2, int a3, int a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8)
{
  uint64_t v14 = result;
  BOOL v16 = a3 != 48 || a4 != 48;
  if (a2 >= 49)
  {
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)result + 216))(result, a2 + 78);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 232))(v14, v17, a6, a5, 1);
    *(unsigned char *)(a6 + 24) = 2;
    char v18 = (a7 & 1) == 0 || v16;
    uint64_t v19 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v14 + 216);
    if ((v18 & 1) == 0)
    {
      uint64_t v25 = v19(v14, 195);
      uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 232);
      uint64_t v27 = v14;
      uint64_t v28 = a6;
      uint64_t v29 = a5 + 1;
      uint64_t v30 = a8 + 2;
      goto LABEL_25;
    }
    uint64_t v20 = v19(v14, 155);
    if (v16) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = a8 + 2;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 232))(v14, v20, a6, a5 + 1, v21);
  }
  if (a3 != 48)
  {
    return SLPronouncerImpl::PronounceTwoDigits(v14, a3, a4, a5 + 1, a6, a7, a8);
  }
  if (a4 == 48) {
    return result;
  }
  uint64_t v22 = a5 + 2;
  uint64_t v23 = a8 + 1;
  uint64_t v24 = 119;
  if ((a7 & 1) == 0) {
    uint64_t v24 = 78;
  }
  uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v14 + 216))(v14, v24 + a4);
  uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v14 + 232);
  uint64_t v27 = v14;
  uint64_t v28 = a6;
  uint64_t v29 = v22;
  uint64_t v30 = v23;
LABEL_25:
  return v26(v27, v25, v28, v29, v30);
}

uint64_t SLPronouncerImpl::PronounceDigits(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  char v30 = 0;
  __int16 v29 = 0;
  uint64_t v7 = a4 - 1;
  if (a4 >= 1)
  {
    uint64_t v11 = result;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)(a2 + 56) + 2 * a3;
    uint64_t v14 = 119;
    if ((a6 & 1) == 0) {
      uint64_t v14 = 78;
    }
    uint64_t v27 = v14;
    uint64_t v28 = a7 + 1;
    while (1)
    {
      unsigned int v15 = v12 % 3;
      if (v12)
      {
        if (!v15 && v7 != v12) {
          *(unsigned char *)(a5 + 24) = (*(uint64_t (**)(uint64_t, void))(*(void *)v11 + 168))(v11, 0);
        }
      }
      uint64_t v17 = (char *)&v29 - 3 * (v12 / 3);
      __int16 v18 = *(_WORD *)(v13 + 2 * v12);
      BOOL v19 = !v15 && v7 == v12;
      BOOL v20 = !v19 && *(unsigned __int16 *)(v13 + 2 * v12) == v17[v12];
      char v21 = v20 ? 2 : 3;
      *(unsigned char *)(a5 + 25) = v21;
      v17[v12] = v18;
      uint64_t v22 = a3 + v12 + *(void *)(a2 + 32);
      uint64_t v23 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)v11 + 216);
      if (v7 == v12) {
        break;
      }
      uint64_t v24 = v23(v11, (char)v18 + 78);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v11 + 232))(v11, v24, a5, v22, 1);
      ++v12;
    }
    uint64_t v25 = v23(v11, v27 + (char)v18);
    uint64_t v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v11 + 232);
    return v26(v11, v25, a5, v22, v28);
  }
  return result;
}

void *SLPronouncerImpl::PronounceMoney(uint64_t a1, char **a2, uint64_t a3, uint64_t a4, unsigned __int8 *a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t *a10)
{
  unsigned int v17 = *a5;
  long long v36 = *(_OWORD *)a2;
  __int16 v18 = strchr(*a2, 59);
  SLTokenList::SLTokenList((SLTokenList *)v35);
  if (a5[3])
  {
    if (!v18) {
      goto LABEL_9;
    }
  }
  else
  {
    *((void *)a5 + 4) = 0;
    if (!v18) {
      goto LABEL_9;
    }
  }
  if (*((void *)a5 + 4) == 2 && !a6 && !*((void *)a5 + 6) && *((void *)a5 + 2) <= 10 * v17 + 20)
  {
    if (*((void *)a5 + 7))
    {
      (*(void (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56))(a1, a4, *((void *)a5 + 1));
      (*(void (**)(uint64_t, long long *, uint64_t *, BOOL, void, void))(*(void *)a1 + 240))(a1, &v36, a10, *((void *)a5 + 7) != 1, *(void *)(a3 + 32), *(void *)(a3 + 40));
      *((unsigned char *)a10 + 24) = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 168))(a1, 0);
      uint64_t v27 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 339);
      (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, v27, a10, *(void *)(a4 + 32) + *((void *)a5 + 4) - 1, 1);
      uint64_t v28 = *((void *)a5 + 4);
    }
    else
    {
      uint64_t v28 = 2;
    }
    if (*a5) {
      uint64_t v29 = 32;
    }
    else {
      uint64_t v29 = 256;
    }
    (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t *, uint64_t, void))(*(void *)a1 + 56))(a1, a4, *((void *)a5 + 3), v28, a10, v29, 0);
    *(void *)&long long v36 = v18 + 1;
    if (*((void *)a5 + 7))
    {
      uint64_t v30 = 0;
      uint64_t v31 = 0;
    }
    else
    {
      uint64_t v30 = *(void *)(a3 + 32);
      uint64_t v31 = *(void *)(a3 + 40);
    }
    (*(void (**)(uint64_t, long long *, uint64_t *, BOOL, uint64_t, uint64_t))(*(void *)a1 + 240))(a1, &v36, a10, a5[1] == 0, v30, v31);
    goto LABEL_21;
  }
LABEL_9:
  (*(void (**)(uint64_t, uint64_t, uint64_t *, unsigned __int8 *, uint64_t, void))(*(void *)a1 + 48))(a1, a4, a10, a5, 256, 0);
  if (a6)
  {
    SLTokenList::SLTokenList((SLTokenList *)&v32);
    (*(void (**)(uint64_t, uint64_t, uint64_t *, void, uint64_t, uint64_t))(*(void *)a1 + 240))(a1, a6, &v32, 0, a7, a8);
    if (v34)
    {
      SLToken::SetCapitalization(v33[2], a9);
      uint64_t v19 = v34;
      if (v34)
      {
        uint64_t v21 = v32;
        BOOL v20 = v33;
        uint64_t v22 = *v33;
        *(void *)(v22 + 8) = *(void *)(v32 + 8);
        **(void **)(v21 + 8) = v22;
        uint64_t v23 = *a10;
        *(void *)(v23 + 8) = v20;
        void *v20 = v23;
        *a10 = v21;
        *(void *)(v21 + 8) = a10;
        a10[2] += v19;
        uint64_t v34 = 0;
      }
    }
    std::__list_imp<SLToken *>::clear(&v32);
  }
  if (a6) {
    BOOL v24 = 1;
  }
  else {
    BOOL v24 = a5[2] == 0;
  }
  uint64_t v25 = v24;
  (*(void (**)(uint64_t, long long *, uint64_t *, uint64_t, void, void))(*(void *)a1 + 240))(a1, &v36, a10, v25, *(void *)(a3 + 32), *(void *)(a3 + 40));
LABEL_21:
  *((unsigned char *)a10 + 24) = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 168))(a1, 0);
  return std::__list_imp<SLToken *>::clear(v35);
}

void sub_222A49770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  std::__list_imp<SLToken *>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SLPronouncerImpl::PronounceYear(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v11 = (__int16 *)(*(void *)(a2 + 56) + 2 * a4);
  uint64_t v12 = *(void *)(a2 + 32) + a4;
  BOOL v13 = v11[2] == 48 && v11[3] == 48;
  int v14 = (unsigned __int16)v11[1];
  __int16 v15 = *v11;
  if (v14 == 48)
  {
    uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, (char)v15 + 78);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, v16, a3, v12, 1);
    uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 156);
    if (v13) {
      uint64_t v18 = a7 + 3;
    }
    else {
      uint64_t v18 = 1;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, v17, a3, v12 + 1, v18);
    if (!v13)
    {
      int v20 = *((char *)v11 + 4);
      int v21 = *((char *)v11 + 6);
      uint64_t v22 = v12 + 2;
      goto LABEL_18;
    }
LABEL_15:
    if ((a6 & 2) == 0) {
      return result;
    }
    goto LABEL_19;
  }
  SLPronouncerImpl::PronounceTwoDigits(a1, (char)v15, (char)v14, v12, a3, 0, 0);
  if (!v13)
  {
    int v24 = (unsigned __int16)v11[2];
    if (v24 != 48)
    {
      int v21 = *((char *)v11 + 6);
      uint64_t v22 = v12 + 2;
      int v20 = (char)v24;
LABEL_18:
      uint64_t result = SLPronouncerImpl::PronounceTwoDigits(a1, v20, v21, v22, a3, 0, a7);
      if ((a6 & 2) == 0) {
        return result;
      }
      goto LABEL_19;
    }
    uint64_t v25 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 136);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, v25, a3, v12 + 2, 1);
    uint64_t v26 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, *((char *)v11 + 6) + 78);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, v26, a3, v12 + 3, a7 + 1);
    goto LABEL_15;
  }
  uint64_t v23 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 155);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, v23, a3, v12 + 2, a7 + 2);
  if ((a6 & 2) == 0) {
    return result;
  }
LABEL_19:
  uint64_t v27 = *(void *)(*(void *)a3 + 16);
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 184);
  return v28(a1, v27);
}

uint64_t SLPronouncerImpl::PronounceDate(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t *, void))(*a1 + 296))(a1, *(unsigned __int8 *)(a4 + 4));
  (*(void (**)(uint64_t *, uint64_t, uint64_t, void, void))(*a1 + 232))(a1, v8, a3, *(void *)(a4 + 24) + *(void *)(a2 + 32), *(void *)(a4 + 32));
  (*(void (**)(uint64_t *, uint64_t, void, void, uint64_t, uint64_t, void))(*a1 + 56))(a1, a2, *(void *)(a4 + 40), *(void *)(a4 + 48), a3, 257, 0);
  *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t *, void))(*a1 + 168))(a1, 0);
  uint64_t v9 = *(void *)(a4 + 8);
  uint64_t v10 = *a1;
  if (*(void *)(a4 + 16) == 4)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(v10 + 96);
    return v11(a1, a2, a3, v9, 4, 0, 0);
  }
  else
  {
    BOOL v13 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v10 + 56);
    return v13(a1, a2, v9);
  }
}

uint64_t SLPronouncerImpl::PronounceTime(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(a2 + 1) == 2) {
    char v8 = 2;
  }
  else {
    char v8 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 288))(a1, 0);
  }
  *(unsigned char *)(a3 + 24) = v8;
  if (*(unsigned char *)(a4 + 3) == 32) {
    uint64_t v9 = 16;
  }
  else {
    uint64_t v9 = 256;
  }
  (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t, void))(*(void *)a1 + 56))(a1, a2, *(void *)(a4 + 8), *(void *)(a4 + 16), a3, v9, 0);
  if (*(unsigned char *)(a4 + 1) || *(unsigned char *)(a4 + 2) || (int v10 = *(unsigned __int8 *)(a4 + 3), v10 == 32))
  {
    *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 288))(a1, 1);
    (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, void, void))(*(void *)a1 + 56))(a1, a2, *(void *)(a4 + 24), *(void *)(a4 + 32), a3, 0, 0);
    int v10 = *(unsigned __int8 *)(a4 + 3);
  }
  if (*(void *)(a4 + 48))
  {
    if (!*(unsigned char *)(a4 + 2) && v10 != 32)
    {
      BOOL v11 = 1;
      goto LABEL_18;
    }
    *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 288))(a1, 1);
    (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, void, void))(*(void *)a1 + 56))(a1, a2, *(void *)(a4 + 40), *(void *)(a4 + 48), a3, 0, 0);
    int v10 = *(unsigned __int8 *)(a4 + 3);
  }
  if (v10 == 32) {
    goto LABEL_25;
  }
  BOOL v11 = *(unsigned char *)(a4 + 2) == 0;
LABEL_18:
  if (*(unsigned char *)(a4 + 1) || !v11)
  {
    *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 288))(a1, 1);
    int v10 = *(unsigned __int8 *)(a4 + 3);
  }
  if (v10 == 65) {
    uint64_t v12 = 220;
  }
  else {
    uint64_t v12 = 221;
  }
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, v12);
  (*(void (**)(uint64_t, uint64_t, uint64_t, void, void))(*(void *)a1 + 232))(a1, v13, a3, *(void *)(a4 + 72) + *(void *)(a2 + 32), *(void *)(a4 + 80));
LABEL_25:
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 288))(a1, 0);
  *(unsigned char *)(a3 + 24) = result;
  return result;
}

uint64_t SLPronouncerImpl::PronounceElapsedTime(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (*(unsigned char *)(a2 + 1) == 2) {
    char v8 = 2;
  }
  else {
    char v8 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 288))(a1, 0);
  }
  *(unsigned char *)(a3 + 24) = v8;
  (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t, void))(*(void *)a1 + 56))(a1, a2, a4[1], a4[2], a3, 16, 0);
  *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 288))(a1, 1);
  (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, void, void))(*(void *)a1 + 56))(a1, a2, a4[3], a4[4], a3, 0, 0);
  if (a4[6])
  {
    *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 288))(a1, 1);
    (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, void, void))(*(void *)a1 + 56))(a1, a2, a4[5], a4[6], a3, 0, 0);
  }
  if (a4[8])
  {
    *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 168))(a1, 0);
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, 209);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 232))(a1, v9, a3, *(void *)(a2 + 32) + a4[7] - 1, 1);
    (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, void, void))(*(void *)a1 + 64))(a1, a2, a4[7], a4[8], a3, 0, 0);
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 288))(a1, 0);
  *(unsigned char *)(a3 + 24) = result;
  return result;
}

uint64_t SLPronouncerImpl::PronounceNumericPair(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)(a2 + 56);
  do
    int v8 = *(unsigned __int16 *)(v7 + 2 * v6++);
  while (v8 != 58);
  uint64_t v9 = ~v6 + ((*(void *)(a2 + 64) - v7) >> 1);
  *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 288))(a1, 0);
  (*(void (**)(uint64_t, uint64_t, void, uint64_t, uint64_t, void, void))(*(void *)a1 + 56))(a1, a2, 0, v6 - 1, a3, 0, 0);
  *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 288))(a1, 1);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(*(void *)a1 + 56))(a1, a2, v6, v9, a3, 0, 0);
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 288))(a1, 0);
  *(unsigned char *)(a3 + 24) = result;
  return result;
}

uint64_t SLPronouncerImpl::PronounceDimensions(SLPronouncerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v4 = *((void *)a2 + 7);
  unint64_t v5 = ((*((void *)a2 + 8) - v4) >> 1) - 1;
  if ((*((void *)a2 + 8) - v4) >> 1 != 1)
  {
    if (v5 <= 1) {
      unint64_t v5 = 1;
    }
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(_WORD *)(v4 + 2 * i) == 120) {
        break;
      }
    }
    operator new();
  }
  uint64_t result = (*(uint64_t (**)(SLPronouncerImpl *, void))(*(void *)this + 168))(this, 0);
  *((unsigned char *)a3 + 24) = result;
  return result;
}

void sub_222A4A548(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLPronouncerImpl::PronounceLegalSection(SLPronouncerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v3 = 0;
  do
  {
    int v4 = (unsigned __int16)SLChar::sCharClass[*(_WORD *)(*((void *)a2 + 7) + 2 * v3) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(*((void *)a2 + 7) + 2 * v3) >> 6] << 6)];
    ++v3;
  }
  while (v4 == 2);
  operator new();
}

void sub_222A4A6FC(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLPronouncerImpl::PronounceGeoLoc(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a4[2]) {
    operator new();
  }
  if (a4[6]) {
    operator new();
  }
  if (a4[10]) {
    operator new();
  }
  if (a4[14]) {
    operator new();
  }
}

void sub_222A4AA68(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

uint64_t SLPronouncerImpl::PronounceDottedNumber(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(unsigned char *)(a3 + 24) = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 168))(a1, 1);
  if (((*(unsigned char *)a4 == 0) & (*(_DWORD *)(a2 + 16) >> 10)) != 0) {
    uint64_t v8 = 81;
  }
  else {
    uint64_t v8 = 209;
  }
  (*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 216))(a1, v8);
  if (*(void *)(a4 + 16) != *(void *)(a4 + 8)) {
    operator new();
  }
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 168))(a1, 1);
  *(unsigned char *)(a3 + 24) = result;
  return result;
}

void sub_222A4ACC4(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

uint64_t SLPronouncerImpl::HasApostropheS(SLPronouncerImpl *this)
{
  return 1;
}

uint64_t SLPronouncerImpl::MonthBeforeDay(SLPronouncerImpl *this)
{
  return 1;
}

uint64_t SLPronouncerImpl::ExponentIsOrdinal(SLPronouncerImpl *this)
{
  return 1;
}

void *std::__list_imp<SLToken *>::clear(void *result)
{
  if (result[2])
  {
    uint64_t v1 = result;
    uint64_t result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        int v4 = (void *)result[1];
        operator delete(result);
        uint64_t result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

uint64_t SLSplitCartDict::Lookup(uint64_t (****this)(void), const char *a2, uint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  SLTokenBuilder::SLTokenBuilder((SLTokenBuilder *)v31, a4, 1);
  uint64_t v8 = (**this[3])();
  if (v8)
  {
    uint64_t v9 = (uint64_t *)v32[10];
    uint64_t v10 = *v9;
    v32[11] = v9;
    *(_DWORD *)uint64_t v10 = 1;
    BOOL v11 = (_WORD *)(v10 + 4);
    uint64_t v12 = *(unsigned __int16 *)(v10 + 4);
    if (v12 <= 6)
    {
      uint64_t v13 = v12 + 1;
      _WORD *v11 = v13;
      v11[v13] = 64;
    }
    ((void (*)(uint64_t (***)(void), const char *, uint64_t, unsigned char *, void))**this[4])(this[4], a2, a3, v31, 0);
    int v14 = v32;
    __int16 v15 = (void *)v32[11];
    unint64_t v16 = v32[12];
    if ((unint64_t)v15 >= v16)
    {
      uint64_t v18 = (void **)(v32 + 10);
      uint64_t v19 = v32[10];
      uint64_t v20 = ((uint64_t)v15 - v19) >> 3;
      if ((unint64_t)(v20 + 1) >> 61) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v21 = v16 - v19;
      uint64_t v22 = v21 >> 2;
      if (v21 >> 2 <= (unint64_t)(v20 + 1)) {
        uint64_t v22 = v20 + 1;
      }
      if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v23 = v22;
      }
      if (v23) {
        int v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)(v32 + 12), v23);
      }
      else {
        int v24 = 0;
      }
      uint64_t v25 = &v24[8 * v20];
      uint64_t v26 = &v24[8 * v23];
      *(void *)uint64_t v25 = v10;
      uint64_t v17 = v25 + 8;
      uint64_t v28 = (char *)v14[10];
      uint64_t v27 = (char *)v14[11];
      if (v27 != v28)
      {
        do
        {
          uint64_t v29 = *((void *)v27 - 1);
          v27 -= 8;
          *((void *)v25 - 1) = v29;
          v25 -= 8;
        }
        while (v27 != v28);
        uint64_t v27 = (char *)*v18;
      }
      v14[10] = v25;
      v14[11] = v17;
      v14[12] = v26;
      if (v27) {
        operator delete(v27);
      }
    }
    else
    {
      *__int16 v15 = v10;
      uint64_t v17 = v15 + 1;
    }
    v14[11] = v17;
    SLTokenBuilder::Forward((SLTokenBuilder *)v31);
  }
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)v31);
  return v8;
}

void sub_222A4B06C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)va);
  _Unwind_Resume(a1);
}

void SLSplitCartDict::~SLSplitCartDict(SLSplitCartDict *this)
{
  *(void *)this = &unk_26D52B100;
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
  }
  SLDictionary::~SLDictionary(this);
}

{
  uint64_t vars8;

  SLSplitCartDict::~SLSplitCartDict(this);
  JUMPOUT(0x223CA4030);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t SLPrefixDict::SLPDFindPage(int a1, uint64_t a2, uint64_t a3, void *__s1, unint64_t a5, size_t *a6)
{
  uint64_t v8 = a3 + *(unsigned int *)(a2 + 28);
  if (a5 >= 5) {
    size_t v9 = 5;
  }
  else {
    size_t v9 = a5;
  }
  if (v9)
  {
    uint64_t v18 = a6;
    uint64_t v11 = *(unsigned __int16 *)(a2 + 2 * v9 + 12);
    do
    {
      size_t v12 = v9 - 1;
      uint64_t v13 = *(unsigned __int16 *)(a2 + 2 * (v9 - 1) + 12);
      if (v13 < v11)
      {
        unsigned int v14 = *(unsigned __int16 *)(a2 + 2 * (v9 - 1) + 12);
        do
        {
          uint64_t v15 = (v11 + v14) >> 1;
          int v16 = memcmp(__s1, (const void *)(v8 + 8 * v15), v9);
          if ((v16 & 0x80000000) == 0)
          {
            if (!v16) {
              goto LABEL_14;
            }
            unsigned int v14 = v15 + 1;
            uint64_t v15 = v11;
          }
          uint64_t v11 = v15;
        }
        while (v14 < v15);
      }
      uint64_t v11 = v13;
      --v9;
    }
    while (v12);
    uint64_t v15 = 0;
LABEL_14:
    a6 = v18;
  }
  else
  {
    uint64_t v15 = 0;
  }
  *a6 = v9;
  return a3 + *(unsigned int *)(a2 + 32) + 4 * bswap32(*(_DWORD *)(v8 + 8 * v15 + 4) & 0xFFFFFF00);
}

uint64_t SLPrefixDict::SetFileInfo(uint64_t this, _DWORD *a2, int a3, uint64_t a4)
{
  *(void *)(this + 24) = a2;
  *(_DWORD *)(this + 44) = a3;
  *(void *)(this + 48) = a4;
  if (*a2 == 1146113107)
  {
    *(unsigned char *)(this + 40) = 1;
    operator new();
  }
  if (*a2 == 1397510212)
  {
    *(unsigned char *)(this + 40) = 0;
    *(void *)(this + 32) = a2;
  }
  return this;
}

void SLPrefixDict::~SLPrefixDict(SLPrefixDict *this)
{
  *(void *)this = &unk_26D52B140;
  if (*((unsigned char *)this + 40))
  {
    uint64_t v2 = *((void *)this + 4);
    if (v2) {
      MEMORY[0x223CA4030](v2, 0x1000C40F3912DEFLL);
    }
  }
  SLDictionary::~SLDictionary(this);
}

{
  uint64_t vars8;

  SLPrefixDict::~SLPrefixDict(this);
  JUMPOUT(0x223CA4030);
}

BOOL SLPrefixDict::Decoder::DecodePhoneme(SLPrefixDict::Decoder *this, char a2)
{
  BOOL v3 = a2 < 0;
  uint64_t v4 = a2 & 0x3F;
  if ((a2 & 0x40) != 0) {
    (*(void (**)(void, void))(**((void **)this + 3) + 72))(*((void *)this + 3), *((unsigned __int8 *)this + 16));
  }
  if (v4 == 63) {
    return 1;
  }
  (*(void (**)(void, uint64_t))(**((void **)this + 3) + 72))(*((void *)this + 3), v4);
  return v3;
}

char *SLPrefixDict::Decoder::DecodePhonemes(SLPrefixDict::Decoder *this, char *a2)
{
  do
    char v4 = *a2++;
  while (!SLPrefixDict::Decoder::DecodePhoneme(this, v4));
  return a2;
}

uint64_t SLPrefixDict::Decoder::FoundWord(SLPrefixDict::Decoder *this, const char *a2, uint64_t a3, char *a4, const unsigned __int8 *a5, const unsigned __int16 *a6, const unsigned int *a7, const unsigned __int16 *a8)
{
  (*(void (**)(void))(**((void **)this + 3) + 8))(*((void *)this + 3));
  (***((void (****)(void, void))this + 3))(*((void *)this + 3), *((void *)this + 1));
  (*(void (**)(void, const char *, uint64_t))(**((void **)this + 3) + 16))(*((void *)this + 3), a2, a3);
  do
  {
    (*(void (**)(void))(**((void **)this + 3) + 56))(*((void *)this + 3));
    (*(void (**)(void, uint64_t))(**((void **)this + 3) + 72))(*((void *)this + 3), 2);
    unint64_t v16 = *a4;
    uint64_t v17 = a5;
    if (v16 >= 0x40)
    {
      unsigned int v18 = a6[(v16 >> 6) - 1];
      unsigned int v19 = bswap32(v18) >> 16;
      if (*(unsigned char *)this) {
        LOWORD(v18) = v19;
      }
      uint64_t v17 = &a5[(unsigned __int16)v18];
    }
    do
      char v20 = *v17++;
    while (!SLPrefixDict::Decoder::DecodePhoneme(this, v20));
    char v22 = *a4;
    uint64_t v21 = a4 + 1;
    if (!SLPrefixDict::Decoder::DecodePhoneme(this, v22 & 0x3F))
    {
      do
        char v23 = *v21++;
      while (!SLPrefixDict::Decoder::DecodePhoneme(this, v23));
    }
    unint64_t v24 = *v21;
    if (*v21 < 0)
    {
      uint64_t v26 = v21[1];
      uint64_t v25 = (unsigned __int8 *)(v21 + 2);
      unint64_t v24 = ((v24 & 0x7F) << 7) | v26;
    }
    else
    {
      uint64_t v25 = (unsigned __int8 *)(v21 + 1);
    }
    unsigned int v27 = a7[v24];
    unsigned int v28 = bswap32(v27);
    if (*(unsigned char *)this) {
      int v29 = v28;
    }
    else {
      int v29 = v27;
    }
    SLWordBuilder::SetPartOfSpeech(*((void *)this + 3), v29);
    v39[0] = 0;
    unsigned int v30 = *v25;
    if ((v30 & 0x7F) != 0)
    {
      unsigned int v31 = 0;
      int v32 = *(unsigned __int8 *)this;
      do
      {
        unint64_t v33 = v30;
        if ((v30 & 0x80) != 0)
        {
          uint64_t v34 = v25[1];
          v25 += 2;
          unint64_t v33 = ((unint64_t)(v30 & 0x7F) << 7) | v34;
        }
        else
        {
          ++v25;
        }
        if (v31 <= 6)
        {
          unsigned int v35 = a8[v33];
          unsigned int v36 = bswap32(v35) >> 16;
          if (v32) {
            LOWORD(v35) = v36;
          }
          v39[0] = ++v31;
          v39[v31] = v35;
        }
        unsigned int v30 = *v25;
      }
      while ((v30 & 0x7F) != 0);
    }
    (*(void (**)(void, _WORD *))(**((void **)this + 3) + 88))(*((void *)this + 3), v39);
    (*(void (**)(void))(**((void **)this + 3) + 96))(*((void *)this + 3));
    int v37 = *v25;
    a4 = (char *)(v25 + 1);
  }
  while (v37 != 128);
  (*(void (**)(void))(**((void **)this + 3) + 48))(*((void *)this + 3));
  return 1;
}

uint64_t SLPrefixDict::Lookup(SLPrefixDict *this, char *__s1, unint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  size_t v39 = 0;
  uint64_t v10 = *((void *)this + 3);
  uint64_t v9 = *((void *)this + 4);
  uint64_t v11 = SLPrefixDict::SLPDFindPage((int)this, v9, v10, __s1, a3, &v39);
  int v12 = *((unsigned __int8 *)this + 40);
  unsigned int v13 = *(unsigned __int16 *)(v11 + 6);
  unsigned int v14 = bswap32(v13) >> 16;
  if (*((unsigned char *)this + 40)) {
    LOWORD(v13) = v14;
  }
  if (!(_WORD)v13) {
    return 0;
  }
  uint64_t v15 = (const unsigned __int16 *)v11;
  uint64_t v31 = v10;
  int v32 = a4;
  unint64_t v16 = 0;
  unint64_t v17 = (unsigned __int16)v13;
  unsigned int v18 = (const unsigned __int8 *)(v11 + 2 * (unsigned __int16)v13 + 8);
  unsigned int v30 = (const unsigned int *)(v10 + *(unsigned int *)(v9 + 36));
  int v29 = (unsigned __int16 *)(v10 + *(unsigned int *)(v9 + 40));
  unint64_t v33 = __s1;
  unint64_t v34 = a3;
  unsigned int v19 = &__s1[v39];
  size_t v20 = a3 - v39;
  while (1)
  {
    unint64_t v21 = (v17 + v16) >> 1;
    unsigned int v22 = v15[v21 + 4];
    unsigned int v23 = bswap32(v22) >> 16;
    if (v12) {
      LOWORD(v22) = v23;
    }
    unint64_t v24 = &v18[(unsigned __int16)v22];
    int v25 = memcmp(v19, v24, v20);
    if (v25 < 1) {
      break;
    }
    unint64_t v16 = v21 + 1;
    unint64_t v21 = v17;
LABEL_11:
    unint64_t v17 = v21;
    if (v16 >= v21) {
      return 0;
    }
  }
  if (v25 < 0 || v24[v20]) {
    goto LABEL_11;
  }
  uint64_t v27 = v31 + *(unsigned int *)(v9 + 24);
  char v28 = *(unsigned char *)(v9 + 8);
  v35[0] = v12;
  uint64_t v36 = v27;
  char v37 = v28;
  CFIndex v38 = v32;
  SLPrefixDict::Decoder::FoundWord((SLPrefixDict::Decoder *)v35, v33, v34, (char *)&v24[v20 + 1], v18, v15, v30, v29);
  return 1;
}

uint64_t SLMMapHint::MappedSize(SLMMapHint *this)
{
  return *((void *)this + 2);
}

void SLMMapHint::~SLMMapHint(SLMMapHint *this)
{
}

uint64_t SLMMapCache::Map(SLMMapCache *this, const __CFURL *a2, SLMMapHint *a3)
{
  CFStringRef v3 = CFURLCopyFileSystemPath(this, kCFURLPOSIXPathStyle);
  if (v3)
  {
    CFStringGetMaximumSizeOfFileSystemRepresentation(v3);
    operator new[]();
  }
  return -1;
}

void sub_222A4BA64(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x1000C4077774924);
  _Unwind_Resume(a1);
}

uint64_t SLMMapCache::Map(SLMMapCache *this, const char *a2, SLMMapHint *a3)
{
  if (stat((const char *)this, &v7) < 0) {
    return -1;
  }
  pthread_mutex_lock(&sMapCacheMutex);
  uint64_t v5 = sMappedFiles;
  if (!sMappedFiles) {
LABEL_6:
  }
    operator new();
  while (*(_DWORD *)(v5 + 8) != v7.st_dev || *(void *)(v5 + 16) != v7.st_ino)
  {
    uint64_t v5 = *(void *)v5;
    if (!v5) {
      goto LABEL_6;
    }
  }
  ++*(_DWORD *)(v5 + 48);
  if (a2)
  {
    *((_DWORD *)a2 + 2) = open((const char *)this, 0);
    *((_OWORD *)a2 + 1) = *(_OWORD *)(v5 + 32);
  }
  pthread_mutex_unlock(&sMapCacheMutex);
  return *(void *)(v5 + 24);
}

uint64_t SLMMapCache::Unmap(SLMMapCache *this, void *a2)
{
  pthread_mutex_lock(&sMapCacheMutex);
  CFStringRef v3 = &sMappedFiles;
  while (1)
  {
    char v4 = v3;
    CFStringRef v3 = (uint64_t *)*v3;
    if (!v3) {
      break;
    }
    if ((SLMMapCache *)v3[3] == this)
    {
      int v5 = *((_DWORD *)v3 + 12) - 1;
      *((_DWORD *)v3 + 12) = v5;
      if (!v5)
      {
        munmap(this, v3[5]);
        *char v4 = *v3;
        MEMORY[0x223CA4030](v3, 0x10A0C40695E290ELL);
      }
      break;
    }
  }
  return pthread_mutex_unlock(&sMapCacheMutex);
}

uint64_t SLMMapCache::IsFileAlreadyMapped(SLMMapCache *this, const char *a2)
{
  if (stat((const char *)this, &v5) < 0)
  {
    char v3 = 0;
  }
  else
  {
    pthread_mutex_lock(&sMapCacheMutex);
    uint64_t v2 = sMappedFiles;
    if (sMappedFiles)
    {
      char v3 = 0;
      do
      {
        if (*(_DWORD *)(v2 + 8) == v5.st_dev) {
          v3 |= *(void *)(v2 + 16) == v5.st_ino;
        }
        uint64_t v2 = *(void *)v2;
      }
      while (v2);
    }
    else
    {
      char v3 = 0;
    }
    pthread_mutex_unlock(&sMapCacheMutex);
  }
  return v3 & 1;
}

void SLTuples::Create(SLTuples *this, CFLocaleRef locale, const __CFLocale *a3)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFEqual(Value, @"en"))
  {
    SLCreateTuplesEng(this);
  }
  SLTuples::Create();
}

void SLTuplesImpl::SLTuplesImpl(SLTuplesImpl *this, SLLexer *a2, const __CFString *a3)
{
  *(void *)this = &unk_26D52B2A8;
  SLLexerBuffer::SLLexerBuffer((SLTuplesImpl *)((char *)this + 8), a2, 1);
  *(void *)this = &unk_26D52B1B8;
  *((void *)this + 1) = &unk_26D52B238;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  std::string::basic_string[abi:ne180100]<0>((void *)this + 18, ".");
  stat v5 = SLGetSpeechDictionaryBundle();
  if (v5) {
    *((void *)this + 13) = CFBundleCopyResourceURL(v5, a3, 0, 0);
  }
}

void sub_222A4BF0C(_Unwind_Exception *a1)
{
  if (v1[103] < 0) {
    operator delete(*v3);
  }
  SLLexerBuffer::~SLLexerBuffer(v2);
  SLLexer::~SLLexer((SLLexer *)v1);
  _Unwind_Resume(a1);
}

uint64_t SLTuplesImpl::HasTupleDB(SLTuplesImpl *this)
{
  if (*((void *)this + 14)) {
    return 1;
  }
  CFURLRef v3 = (const __CFURL *)*((void *)this + 13);
  if (v3)
  {
    CFStringRef v4 = CFURLCopyFileSystemPath(v3, kCFURLPOSIXPathStyle);
    CFRelease(*((CFTypeRef *)this + 13));
    *((void *)this + 13) = 0;
    if (v4)
    {
      CFStringGetMaximumSizeOfFileSystemRepresentation(v4);
      operator new[]();
    }
  }
  return 0;
}

void sub_222A4C0A8(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x1000C4077774924);
  _Unwind_Resume(a1);
}

sqlite3_int64 SLTuplesImpl::TupleLookup(sqlite3_stmt **this, const char *a2)
{
  if (!SLTuplesImpl::HasTupleDB((SLTuplesImpl *)this)) {
    return 0;
  }
  int v4 = sqlite3_bind_text(this[15], 1, a2, -1, 0);
  sqlite3_int64 v5 = 0;
  if (!v4)
  {
    if (sqlite3_step(this[15]) == 100) {
      sqlite3_int64 v5 = sqlite3_column_int64(this[15], 0);
    }
    else {
      sqlite3_int64 v5 = 0;
    }
    sqlite3_reset(this[15]);
  }
  return v5;
}

sqlite3_int64 SLTuplesImpl::AbstractTupleLookup(sqlite3_stmt **this, const char *a2)
{
  if (!SLTuplesImpl::HasTupleDB((SLTuplesImpl *)this)) {
    return 0;
  }
  int v4 = this[16];
  if (!v4) {
    return 0;
  }
  if (a2)
  {
    sqlite3_int64 v5 = 0;
    if (sqlite3_bind_text(v4, 1, a2, -1, 0)) {
      return v5;
    }
    int v4 = this[16];
  }
  if (sqlite3_step(v4) != 100)
  {
LABEL_41:
    sqlite3_reset(this[16]);
    return 0;
  }
  while (1)
  {
    sqlite3_int64 v5 = sqlite3_column_int64(this[16], 0);
    int v6 = sqlite3_column_bytes(this[16], 1);
    if (!v6) {
      return v5;
    }
    int v7 = v6;
    uint64_t v8 = (char *)sqlite3_column_blob(this[16], 1);
    if (v7 < 1) {
      return v5;
    }
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    uint64_t v11 = &v8[v7];
    while (1)
    {
      int v12 = (SLToken *)SLLexerBuffer::operator[](this + 1, v10);
      if (!v12) {
        break;
      }
      unsigned int v13 = v12;
      int v14 = 0;
      int64_t v15 = v11 - v9;
      unint64_t v16 = v9 + 1;
      while (1)
      {
        v14 |= *(v16 - 1) & 0x7F;
        if ((*(v16 - 1) & 0x80) == 0) {
          break;
        }
        ++v16;
        v14 <<= 7;
        if (!--v15)
        {
          unint64_t v16 = v11;
          break;
        }
      }
      if (v14 && !SLToken::HasPOS(v12, v14)) {
        break;
      }
      if (v16 < v11)
      {
        int v17 = 0;
        int64_t v18 = v11 - v16++;
        while (1)
        {
          v17 |= *(v16 - 1) & 0x7F;
          if ((*(v16 - 1) & 0x80) == 0) {
            break;
          }
          ++v16;
          v17 <<= 7;
          if (!--v18)
          {
            unint64_t v16 = v11;
            break;
          }
        }
        if (v17 && SLToken::HasPOS(v13, v17)) {
          break;
        }
      }
LABEL_24:
      while (v16 < v11)
      {
        unsigned int v19 = *v16;
        if (!*v16) {
          break;
        }
        int v20 = v19 & 0x7F;
        ++v16;
        unsigned int v21 = v19 >> 7;
        while (1)
        {
          int v22 = v20;
          if (!v20) {
            break;
          }
          if (v16 >= v11)
          {
            LOWORD(v23) = 0;
          }
          else
          {
            int v23 = 0;
            int64_t v24 = v11 - v16++;
            while (1)
            {
              v23 |= *(v16 - 1) & 0x7F;
              if ((*(v16 - 1) & 0x80) == 0) {
                break;
              }
              ++v16;
              v23 <<= 7;
              if (!--v24)
              {
                unint64_t v16 = v11;
                break;
              }
            }
          }
          --v20;
          if (v21 == SLToken::HasTag(v13, (unsigned __int16)v23))
          {
            if (!v22) {
              goto LABEL_24;
            }
            goto LABEL_40;
          }
        }
      }
      uint64_t v9 = v16 + 1;
      ++v10;
      if (v9 >= v11) {
        return v5;
      }
    }
LABEL_40:
    if (sqlite3_step(this[16]) != 100) {
      goto LABEL_41;
    }
  }
}

void SLTuplesImpl::~SLTuplesImpl(SLTuplesImpl *this)
{
  *(void *)this = &unk_26D52B1B8;
  uint64_t v2 = (SLTuplesImpl *)((char *)this + 8);
  *((void *)this + 1) = &unk_26D52B238;
  CFURLRef v3 = (const void *)*((void *)this + 13);
  if (v3) {
    CFRelease(v3);
  }
  int v4 = (sqlite3_stmt *)*((void *)this + 15);
  if (v4) {
    sqlite3_finalize(v4);
  }
  sqlite3_int64 v5 = (sqlite3_stmt *)*((void *)this + 16);
  if (v5) {
    sqlite3_finalize(v5);
  }
  int v6 = (sqlite3 *)*((void *)this + 14);
  if (v6) {
    sqlite3_close(v6);
  }
  if (*((char *)this + 167) < 0) {
    operator delete(*((void **)this + 18));
  }
  if (*((char *)this + 103) < 0) {
    operator delete(*((void **)this + 10));
  }
  SLLexerBuffer::~SLLexerBuffer(v2);
  SLLexer::~SLLexer(this);
}

SLToken *SLTuplesImpl::NextToken(int64x2_t *this)
{
  uint64_t v103 = *MEMORY[0x263EF8340];
  uint64_t v2 = this[8].i64[1];
  if (v2) {
    goto LABEL_169;
  }
  CFURLRef v3 = &this->i64[1];
  int v4 = (unsigned __int8 *)SLLexerBuffer::operator[](&this->i64[1], 0);
  if (!v4 || SLTokenGetClass(v4) != 32)
  {
    uint64_t v2 = 1;
    this[8].i64[1] = 1;
    goto LABEL_169;
  }
  uint64_t v2 = this[8].i64[1];
  if (v2) {
    goto LABEL_169;
  }
  int v86 = (const std::string::value_type **)&this[9];
  do
  {
    v98[0] = v98;
    v98[1] = v98;
    uint64_t v99 = 0;
    *(void *)&long long v96 = &v96;
    *((void *)&v96 + 1) = &v96;
    uint64_t v97 = 0;
    v92[0] = 0;
    int v93 = 0;
    std::string::basic_string[abi:ne180100]<0>(&v94, "");
    sqlite3_int64 v5 = std::__list_imp<SLTupleHypothesis>::__create_node[abi:ne180100]<SLTupleHypothesis const&>((uint64_t)v98, 0, 0, (uint64_t)v92);
    int v6 = v98[0];
    v5->__r_.__value_.__l.__data_ = (std::string::pointer)v98[0];
    v5->__r_.__value_.__l.__size_ = (std::string::size_type)v98;
    v6[1] = v5;
    v98[0] = v5;
    uint64_t v7 = ++v99;
    if (this[10].i8[7] < 0)
    {
      std::string::size_type v8 = this[9].u64[1];
      if (!v8) {
        goto LABEL_12;
      }
      LOBYTE(buffer) = 0;
      HIDWORD(buffer) = 10000;
      std::string::__init_copy_ctor_external(&v102, *v86, v8);
    }
    else
    {
      if (!this[10].i8[7]) {
        goto LABEL_12;
      }
      LOBYTE(buffer) = 0;
      HIDWORD(buffer) = 10000;
      *(_OWORD *)&v102.__r_.__value_.__l.__data_ = *(_OWORD *)v86;
      v102.__r_.__value_.__r.__words[2] = this[10].u64[0];
    }
    uint64_t v9 = std::__list_imp<SLTupleHypothesis>::__create_node[abi:ne180100]<SLTupleHypothesis const&>((uint64_t)v98, 0, 0, (uint64_t)&buffer);
    unint64_t v10 = v98[0];
    v9->__r_.__value_.__l.__data_ = (std::string::pointer)v98[0];
    v9->__r_.__value_.__l.__size_ = (std::string::size_type)v98;
    v10[1] = v9;
    v98[0] = v9;
    uint64_t v7 = ++v99;
    if ((SHIBYTE(v102.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
LABEL_12:
      if (!v7) {
        goto LABEL_155;
      }
      goto LABEL_13;
    }
    operator delete(v102.__r_.__value_.__l.__data_);
    if (!v99) {
      goto LABEL_155;
    }
LABEL_13:
    unint64_t v11 = 0;
    BOOL v12 = 0;
    unint64_t v13 = 0;
    sqlite3_int64 v14 = 0;
    int first_high = -1;
    while (1)
    {
      unint64_t v16 = (unsigned __int8 *)SLLexerBuffer::operator[](v3, v11);
      memset(&v91, 0, sizeof(v91));
      BOOL v17 = v16 == 0;
      uint64_t v87 = (SLToken *)v16;
      if (!v16)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, ".");
        std::vector<std::string>::pointer end = v91.__end_;
        if (v91.__end_ < v91.__end_cap_.__value_) {
          goto LABEL_28;
        }
        unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_ - (char *)v91.__begin_) >> 3);
        unint64_t v25 = v21 + 1;
        if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) > v25) {
          unint64_t v25 = 0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v23 = v25;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v91.__end_cap_;
        if (!v23)
        {
          unsigned int v30 = 0;
          goto LABEL_42;
        }
        goto LABEL_135;
      }
      Class = (SLTuplesImpl *)SLTokenGetClass(v16);
      if ((Class - 46) < 2) {
        goto LABEL_18;
      }
      if (Class != 32)
      {
        if (Class != 43) {
          goto LABEL_44;
        }
LABEL_18:
        unsigned int v19 = (char *)SLTuplesImpl::TokenContext(Class, v87);
        std::string::basic_string[abi:ne180100]<0>(__p, v19);
        std::vector<std::string>::pointer end = v91.__end_;
        if (v91.__end_ < v91.__end_cap_.__value_) {
          goto LABEL_28;
        }
        unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_ - (char *)v91.__begin_) >> 3);
        unint64_t v22 = v21 + 1;
        if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) > v22) {
          unint64_t v22 = 0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v23 = v22;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v91.__end_cap_;
        if (!v23)
        {
          unsigned int v30 = 0;
          goto LABEL_42;
        }
LABEL_135:
        unsigned int v30 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v91.__end_cap_, v23);
        goto LABEL_42;
      }
      CFStringRef Text = SLTokenGetText(v87);
      CStringPtr = (char *)CFStringGetCStringPtr(Text, 0x8000100u);
      if (CStringPtr)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, CStringPtr);
        std::vector<std::string>::pointer v28 = v91.__end_;
        if (v91.__end_ >= v91.__end_cap_.__value_)
        {
          unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_ - (char *)v91.__begin_) >> 3);
          unint64_t v56 = v55 + 1;
          if (v55 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) > v56) {
            unint64_t v56 = 0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) >= 0x555555555555555) {
            unint64_t v57 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v57 = v56;
          }
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v91.__end_cap_;
          if (v57) {
            char v58 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v91.__end_cap_, v57);
          }
          else {
            char v58 = 0;
          }
          uint64_t v63 = v58 + v55;
          __v.__first_ = v58;
          __v.__begin_ = v63;
          __v.__end_cap_.__value_ = &v58[v57];
          long long v64 = *(_OWORD *)__p;
          v63->__r_.__value_.__r.__words[2] = v90;
          *(_OWORD *)&v63->__r_.__value_.__l.__data_ = v64;
          __p[1] = 0;
          std::string::size_type v90 = 0;
          __p[0] = 0;
          __v.__end_ = v63 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v91, &__v);
          uint64_t v65 = v91.__end_;
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          v91.__end_ = v65;
          if (SHIBYTE(v90) < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v29 = *(_OWORD *)__p;
          v91.__end_->__r_.__value_.__r.__words[2] = v90;
          *(_OWORD *)&v28->__r_.__value_.__l.__data_ = v29;
          v91.__end_ = v28 + 1;
        }
        std::string::basic_string[abi:ne180100]<0>(__p, "*");
        std::vector<std::string>::pointer end = v91.__end_;
        if (v91.__end_ < v91.__end_cap_.__value_) {
          goto LABEL_28;
        }
        unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_ - (char *)v91.__begin_) >> 3);
        unint64_t v66 = v21 + 1;
        if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) > v66) {
          unint64_t v66 = 0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v23 = v66;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v91.__end_cap_;
        if (!v23)
        {
          unsigned int v30 = 0;
          goto LABEL_42;
        }
        goto LABEL_135;
      }
      if (!CFStringGetCString(Text, (char *)&buffer, 64, 0x8000100u)) {
        goto LABEL_44;
      }
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)&buffer);
      std::vector<std::string>::pointer v53 = v91.__end_;
      if (v91.__end_ >= v91.__end_cap_.__value_)
      {
        unint64_t v59 = 0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_ - (char *)v91.__begin_) >> 3);
        unint64_t v60 = v59 + 1;
        if (v59 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) > v60) {
          unint64_t v60 = 0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v61 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v61 = v60;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v91.__end_cap_;
        if (v61) {
          BOOL v62 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v91.__end_cap_, v61);
        }
        else {
          BOOL v62 = 0;
        }
        uint64_t v67 = v62 + v59;
        __v.__first_ = v62;
        __v.__begin_ = v67;
        __v.__end_cap_.__value_ = &v62[v61];
        long long v68 = *(_OWORD *)__p;
        v67->__r_.__value_.__r.__words[2] = v90;
        *(_OWORD *)&v67->__r_.__value_.__l.__data_ = v68;
        __p[1] = 0;
        std::string::size_type v90 = 0;
        __p[0] = 0;
        __v.__end_ = v67 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v91, &__v);
        CFIndex v69 = v91.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
        v91.__end_ = v69;
        if (SHIBYTE(v90) < 0) {
          operator delete(__p[0]);
        }
      }
      else
      {
        long long v54 = *(_OWORD *)__p;
        v91.__end_->__r_.__value_.__r.__words[2] = v90;
        *(_OWORD *)&v53->__r_.__value_.__l.__data_ = v54;
        v91.__end_ = v53 + 1;
      }
      std::string::basic_string[abi:ne180100]<0>(__p, "*");
      std::vector<std::string>::pointer end = v91.__end_;
      if (v91.__end_ < v91.__end_cap_.__value_)
      {
LABEL_28:
        long long v24 = *(_OWORD *)__p;
        end->__r_.__value_.__r.__words[2] = v90;
        *(_OWORD *)&end->__r_.__value_.__l.__data_ = v24;
        v91.__end_ = end + 1;
        goto LABEL_44;
      }
      unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_ - (char *)v91.__begin_) >> 3);
      unint64_t v70 = v21 + 1;
      if (v21 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) > v70) {
        unint64_t v70 = 0x5555555555555556 * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_cap_.__value_ - (char *)v91.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v23 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v23 = v70;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v91.__end_cap_;
      if (v23) {
        goto LABEL_135;
      }
      unsigned int v30 = 0;
LABEL_42:
      uint64_t v31 = v30 + v21;
      __v.__first_ = v30;
      __v.__begin_ = v31;
      __v.__end_cap_.__value_ = &v30[v23];
      long long v32 = *(_OWORD *)__p;
      v31->__r_.__value_.__r.__words[2] = v90;
      *(_OWORD *)&v31->__r_.__value_.__l.__data_ = v32;
      __p[1] = 0;
      std::string::size_type v90 = 0;
      __p[0] = 0;
      __v.__end_ = v31 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v91, &__v);
      unint64_t v33 = v91.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v91.__end_ = v33;
      if (SHIBYTE(v90) < 0) {
        operator delete(__p[0]);
      }
LABEL_44:
      if (v91.__begin_ == v91.__end_) {
        break;
      }
      if (v99)
      {
        while (1)
        {
          __v.__first_ = (std::__split_buffer<std::string>::pointer)*((void *)v98[1] + 2);
          if (*((char *)v98[1] + 47) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)&__v.__begin_, *((const std::string::value_type **)v98[1] + 3), *((void *)v98[1] + 4));
          }
          else
          {
            *(_OWORD *)&__v.__begin_ = *(_OWORD *)((char *)v98[1] + 24);
            __v.__end_cap_.__value_ = (std::string *)*((void *)v98[1] + 5);
          }
          std::__split_buffer<std::string>::pointer value_high = __v.__end_;
          if (SHIBYTE(__v.__end_cap_.__value_) >= 0) {
            std::__split_buffer<std::string>::pointer value_high = (std::__split_buffer<std::string>::pointer)HIBYTE(__v.__end_cap_.__value_);
          }
          if (value_high) {
            break;
          }
          if (v91.__end_ != v91.__begin_)
          {
            uint64_t v45 = 0;
            unint64_t v46 = 0;
            do
            {
              __v.__first_ = (std::__split_buffer<std::string>::pointer)*((void *)v98[1] + 2);
              std::string::operator=((std::string *)&__v.__begin_, (const std::string *)v98[1] + 1);
              std::string::operator=((std::string *)&__v.__begin_, &v91.__begin_[v45]);
              if (v46)
              {
                LOBYTE(__v.__first_) = 1;
                --HIDWORD(__v.__first_);
              }
              char v47 = std::__list_imp<SLTupleHypothesis>::__create_node[abi:ne180100]<SLTupleHypothesis const&>((uint64_t)&v96, 0, 0, (uint64_t)&__v);
              uint64_t v48 = v96;
              v47->__r_.__value_.__r.__words[0] = v96;
              v47->__r_.__value_.__l.__size_ = (std::string::size_type)&v96;
              *(void *)(v48 + 8) = v47;
              *(void *)&long long v96 = v47;
              ++v97;
              ++v46;
              ++v45;
            }
            while (v46 < 0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_ - (char *)v91.__begin_) >> 3));
          }
LABEL_84:
          uint64_t v49 = (void **)v98[1];
          uint64_t v50 = *(void *)v98[1];
          *(void *)(v50 + 8) = *((void *)v98[1] + 1);
          *(void *)v49[1] = v50;
          --v99;
          std::__list_imp<SLTupleHypothesis>::__delete_node[abi:ne180100]<>((int)v98, v49);
          if (SHIBYTE(__v.__end_cap_.__value_) < 0) {
            operator delete(__v.__begin_);
          }
          if (!v99) {
            goto LABEL_87;
          }
        }
        if (v91.__end_ == v91.__begin_) {
          goto LABEL_84;
        }
        uint64_t v35 = 0;
LABEL_54:
        __v.__first_ = (std::__split_buffer<std::string>::pointer)*((void *)v98[1] + 2);
        std::string::operator=((std::string *)&__v.__begin_, (const std::string *)v98[1] + 1);
        if (v35)
        {
          LOBYTE(__v.__first_) = 1;
          int v36 = 99;
        }
        else
        {
          int v36 = 100;
        }
        HIDWORD(__v.__first_) += v36;
        std::string::push_back((std::string *)&__v.__begin_, 95);
        char v37 = &v91.__begin_[v35];
        int v38 = SHIBYTE(v37->__r_.__value_.__r.__words[2]);
        if (v38 >= 0) {
          size_t v39 = &v91.__begin_[v35];
        }
        else {
          size_t v39 = (std::string *)v37->__r_.__value_.__r.__words[0];
        }
        if (v38 >= 0) {
          std::string::size_type size = HIBYTE(v37->__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v37->__r_.__value_.__l.__size_;
        }
        std::string::append((std::string *)&__v.__begin_, (const std::string::value_type *)v39, size);
        if (SHIBYTE(__v.__end_cap_.__value_) >= 0) {
          p_std::vector<std::string>::pointer begin = (const char *)&__v.__begin_;
        }
        else {
          p_std::vector<std::string>::pointer begin = (const char *)__v.__begin_;
        }
        if (LOBYTE(__v.__first_)) {
          sqlite3_int64 v42 = SLTuplesImpl::AbstractTupleLookup((sqlite3_stmt **)this, p_begin);
        }
        else {
          sqlite3_int64 v42 = SLTuplesImpl::TupleLookup((sqlite3_stmt **)this, p_begin);
        }
        while (1)
        {
          if (v42 == 2) {
            goto LABEL_74;
          }
          if (!v42)
          {
            if (++v35 >= 0xAAAAAAAAAAAAAAABLL * (((char *)v91.__end_ - (char *)v91.__begin_) >> 3)) {
              goto LABEL_84;
            }
            goto LABEL_54;
          }
          if (SHIDWORD(__v.__first_) > first_high)
          {
            sqlite3_int64 v14 = v42;
            int first_high = HIDWORD(__v.__first_);
            unint64_t v13 = v11 + 1;
            BOOL v12 = v17;
          }
          if ((v42 & 2) != 0)
          {
LABEL_74:
            char v43 = std::__list_imp<SLTupleHypothesis>::__create_node[abi:ne180100]<SLTupleHypothesis const&>((uint64_t)&v96, 0, 0, (uint64_t)&__v);
            uint64_t v44 = v96;
            v43->__r_.__value_.__r.__words[0] = v96;
            v43->__r_.__value_.__l.__size_ = (std::string::size_type)&v96;
            *(void *)(v44 + 8) = v43;
            *(void *)&long long v96 = v43;
            ++v97;
          }
          sqlite3_int64 v42 = 0;
          if (LOBYTE(__v.__first_)) {
            sqlite3_int64 v42 = SLTuplesImpl::AbstractTupleLookup((sqlite3_stmt **)this, 0);
          }
        }
      }
LABEL_87:
      uint64_t v51 = v97;
      uint64_t v99 = v97;
      uint64_t v97 = 0;
      *(_OWORD *)v98 = v96;
      if (v51)
      {
        *(void *)v98[1] = v98;
        uint64_t v52 = (void **)((char *)v98[0] + 8);
      }
      else
      {
        v98[0] = v98;
        uint64_t v52 = &v98[1];
      }
      CFURLRef v3 = &this->i64[1];
      char *v52 = v98;
      *(void *)&long long v96 = &v96;
      *((void *)&v96 + 1) = &v96;
      buffer = (void **)&v91;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&buffer);
      if (v87)
      {
        ++v11;
        if (v99) {
          continue;
        }
      }
      goto LABEL_138;
    }
    buffer = (void **)&v91;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&buffer);
    CFURLRef v3 = &this->i64[1];
LABEL_138:
    if (v13)
    {
      __v.__first_ = (std::__split_buffer<std::string>::pointer)(v13 - v12);
      LODWORD(__p[0]) = 0;
      unsigned __int8 v88 = 0;
      (*(void (**)(int64x2_t *, sqlite3_int64, void **, unsigned __int8 *))(this->i64[0] + 72))(this, v14, __p, &v88);
      v91.__begin_ = 0;
      if (__v.__first_)
      {
        unint64_t v71 = 0;
        do
        {
          uint64_t v72 = SLLexerBuffer::operator[](v3, v71);
          uint64_t v73 = v72;
          if (v91.__begin_ && ((uint64_t)__p[0] & 1) != 0 && (*((unsigned __int8 *)v72 + 1) | 2) != 3) {
            *((unsigned char *)v72 + 1) = 2;
          }
          (*(void (**)(int64x2_t *))(this->i64[0] + 80))(this);
          *((_DWORD *)v73 + 4) |= 0x100000u;
          LOWORD(buffer) = 0;
          SLToken::SelectHomographs((SLToken *)v73, 0, (const SLWordTagSet *)&buffer);
          std::vector<std::string>::pointer begin = v91.__begin_;
          if (v88 != 255)
          {
            *((unsigned char *)v73 + 20) = v88;
            if (begin >= (std::vector<std::string>::pointer)((char *)&__v.__first_[-1].__r_.__value_.__r.__words[2] + 7)) {
              char v75 = 62;
            }
            else {
              char v75 = 45;
            }
            if (!begin) {
              char v75 = 60;
            }
            *((unsigned char *)v73 + 6) = v75;
          }
          unint64_t v71 = (unint64_t)begin->__r_.__value_.__r.__words + 1;
          v91.__begin_ = (std::vector<std::string>::pointer)((char *)&begin->__r_.__value_.__l.__data_ + 1);
        }
        while ((std::__split_buffer<std::string>::pointer)((unint64_t)begin->__r_.__value_.__r.__words + 1) < __v.__first_);
      }
      (*(void (**)(int64x2_t *, std::__split_buffer<std::string> *, void))(this->i64[0] + 88))(this, &__v, LODWORD(__p[0]));
      this[8].i64[1] = (uint64_t)__v.__first_;
      goto LABEL_164;
    }
LABEL_155:
    uint64_t v76 = SLLexerBuffer::operator[](v3, 0);
    if (!v76 || *((unsigned char *)v76 + 1) == 1) {
      goto LABEL_162;
    }
    unint64_t v77 = 1;
    do
    {
      unint64_t v78 = v77;
      uint64_t v79 = SLLexerBuffer::operator[](v3, v77);
      if (!v79) {
        break;
      }
      unint64_t v77 = v78 + 1;
    }
    while (*((unsigned char *)v79 + 1) == 1);
    if (v78 < 2
      || ((*(uint64_t (**)(int64x2_t *, unint64_t))(this->i64[0] + 104))(this, v78) & 1) == 0)
    {
LABEL_162:
      unint64_t v78 = 1;
    }
    this[8].i64[1] = v78;
LABEL_164:
    if (v95 < 0) {
      operator delete(v94);
    }
    std::__list_imp<SLTupleHypothesis>::clear(&v96);
    std::__list_imp<SLTupleHypothesis>::clear(v98);
    uint64_t v2 = this[8].i64[1];
  }
  while (!v2);
LABEL_169:
  this[8].i64[1] = v2 - 1;
  uint64_t v80 = (SLToken *)SLLexerBuffer::operator[](&this->i64[1], 0);
  int v81 = v80;
  if (v80)
  {
    if (*((void *)v80 + 8) - *((void *)v80 + 7) == 4)
    {
      int v82 = *((_DWORD *)v80 + 4);
      if ((v82 & 0x10) == 0)
      {
        if ((v82 & 0x400) == 0)
        {
          LODWORD(buffer) = 4784129;
          SLToken::SelectHomographs(v80, 0x7FFFFFFF, (const SLWordTagSet *)&buffer);
        }
        LODWORD(buffer) = 5046273;
        SLToken::SelectHomographs(v81, 0x7FFFFFFF, (const SLWordTagSet *)&buffer);
      }
    }
    this[4] = vaddq_s64(this[4], (int64x2_t)xmmword_222ABEE70);
    std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this[2].i64, 1);
    int v83 = (SLTuplesImpl *)SLTokenGetClass((unsigned __int8 *)v81);
    if ((v83 - 35) > 0x38 || ((1 << (v83 - 35)) & 0x100000010000001) == 0)
    {
      uint64_t v84 = SLTuplesImpl::TokenContext(v83, v81);
      MEMORY[0x223CA3F50](&this[9], v84);
    }
  }
  else
  {
    SLLexerBuffer::clear((SLLexerBuffer *)&this->u64[1]);
  }
  return v81;
}

void sub_222A4D364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char *a48)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  a48 = &a26;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v48 - 168));
  if (a35 < 0) {
    operator delete(a30);
  }
  std::__list_imp<SLTupleHypothesis>::clear(&a36);
  std::__list_imp<SLTupleHypothesis>::clear(&a39);
  _Unwind_Resume(a1);
}

const char *SLTuplesImpl::TokenContext(SLTuplesImpl *this, SLToken *a2)
{
  if (!a2) {
    return ".";
  }
  int Class = SLTokenGetClass((unsigned __int8 *)a2);
  if (Class == 43 || Class == 47) {
    return ".";
  }
  if (Class != 46 || *((void *)a2 + 8) - *((void *)a2 + 7) != 6) {
    return "";
  }
  CFStringRef Text = SLTokenGetText(a2);
  int CharacterAtIndex = CFStringGetCharacterAtIndex(Text, 0);
  uint64_t result = ".";
  if (CharacterAtIndex <= 57)
  {
    if (CharacterAtIndex != 33 && CharacterAtIndex != 46) {
      return ",";
    }
  }
  else
  {
    if (CharacterAtIndex == 8212) {
      return ":";
    }
    if (CharacterAtIndex != 63)
    {
      if (CharacterAtIndex == 58) {
        return ":";
      }
      return ",";
    }
  }
  return result;
}

void SLLexerBuffer::clear(SLLexerBuffer *this)
{
  uint64_t v2 = (void **)*((void *)this + 4);
  uint64_t v3 = *((void *)this + 5);
  *((void *)this + 8) = 0;
  unint64_t v4 = v3 - (void)v2;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v5 = *((void *)this + 5);
      uint64_t v2 = (void **)(*((void *)this + 4) + 8);
      *((void *)this + 4) = v2;
      unint64_t v4 = v5 - (void)v2;
    }
    while (v4 > 0x10);
  }
  if (v4 >> 3 == 1)
  {
    uint64_t v6 = 256;
  }
  else
  {
    if (v4 >> 3 != 2) {
      return;
    }
    uint64_t v6 = 512;
  }
  *((void *)this + 7) = v6;
}

BOOL SLTuplesImpl::HasTuple(sqlite3_stmt **this, char *a2, ...)
{
  va_start(va, a2);
  std::string::basic_string[abi:ne180100]<0>(&v8, a2);
  va_copy(v7, va);
  while (1)
  {
    uint64_t v3 = va_arg(v7, const std::string::value_type *);
    if (!v3) {
      break;
    }
    std::string::push_back(&v8, 95);
    std::string::append(&v8, v3);
  }
  if ((v8.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v4 = &v8;
  }
  else {
    unint64_t v4 = (std::string *)v8.__r_.__value_.__r.__words[0];
  }
  sqlite3_int64 v5 = SLTuplesImpl::TupleLookup(this, (const char *)v4);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  return v5 != 0;
}

void sub_222A4D6B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLTuplesImpl::LexerBehavior(SLTuplesImpl *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 8))();
}

uint64_t SLTuplesImpl::SetLexerBehavior(SLTuplesImpl *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 16))();
}

uint64_t SLTuplesImpl::SetDelim(SLTuplesImpl *this, const unsigned __int16 *a2)
{
  return (*(uint64_t (**)(void, const unsigned __int16 *))(**((void **)this + 2) + 24))(*((void *)this + 2), a2);
}

uint64_t SLTuplesImpl::Delim(SLTuplesImpl *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 32))();
}

uint64_t SLTuplesImpl::SetErrorHandler(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40))();
}

uint64_t SLTuples::HasTuple(SLTuples *this, const char *a2, ...)
{
  return 0;
}

void std::__list_imp<SLTupleHypothesis>::clear(void *a1)
{
  if (a1[2])
  {
    uint64_t v3 = *a1;
    uint64_t v2 = a1[1];
    unint64_t v4 = *(void **)v2;
    v4[1] = *(void *)(*a1 + 8);
    **(void **)(v3 + 8) = v4;
    a1[2] = 0;
    while ((void *)v2 != a1)
    {
      uint64_t v5 = *(void *)(v2 + 8);
      std::__list_imp<SLTupleHypothesis>::__delete_node[abi:ne180100]<>((int)a1, (void **)v2);
      uint64_t v2 = v5;
    }
  }
}

void std::__list_imp<SLTupleHypothesis>::__delete_node[abi:ne180100]<>(int a1, void **__p)
{
  if (*((char *)__p + 47) < 0) {
    operator delete(__p[3]);
  }
  operator delete(__p);
}

uint64_t std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x200) {
    a2 = 1;
  }
  if (v2 < 0x400) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8;
    *(void *)(a1 + 32) -= 512;
  }
  return v4 ^ 1u;
}

std::string *std::__list_imp<SLTupleHypothesis>::__create_node[abi:ne180100]<SLTupleHypothesis const&>(uint64_t a1, std::string::size_type a2, std::string::size_type a3, uint64_t a4)
{
  va_list v7 = (std::string *)operator new(0x30uLL);
  v7->__r_.__value_.__r.__words[0] = a2;
  v7->__r_.__value_.__l.__size_ = a3;
  v7->__r_.__value_.__r.__words[2] = *(void *)a4;
  std::string v8 = v7 + 1;
  if (*(char *)(a4 + 31) < 0)
  {
    std::string::__init_copy_ctor_external(v8, *(const std::string::value_type **)(a4 + 8), *(void *)(a4 + 16));
  }
  else
  {
    *(_OWORD *)&v8->__r_.__value_.__l.__data_ = *(_OWORD *)(a4 + 8);
    v7[1].__r_.__value_.__r.__words[2] = *(void *)(a4 + 24);
  }
  return v7;
}

void sub_222A4D920(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  unint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
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

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  std::vector<std::string>::pointer begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::vector<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
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

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  if (this->__first_) {
    operator delete(this->__first_);
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
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

void SLToken::SLToken(SLToken *this, char a2, int a3)
{
  *(unsigned char *)this = a2;
  *(_DWORD *)((char *)this + 1) = 0;
  *(_WORD *)((char *)this + 5) = 0x2000;
  *((_DWORD *)this + 4) = a3;
  *((unsigned char *)this + 20) = -1;
  *((void *)this + 3) = "(None)";
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 12) = 0;
}

{
  *(unsigned char *)this = a2;
  *(_DWORD *)((char *)this + 1) = 0;
  *(_WORD *)((char *)this + 5) = 0x2000;
  *((_DWORD *)this + 4) = a3;
  *((unsigned char *)this + 20) = -1;
  *((void *)this + 3) = "(None)";
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((void *)this + 12) = 0;
}

void SLToken::~SLToken(SLToken *this)
{
  SLToken::clear(this);
  uint64_t v2 = (void *)*((void *)this + 10);
  if (v2)
  {
    *((void *)this + 11) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 7);
  if (v3)
  {
    *((void *)this + 8) = v3;
    operator delete(v3);
  }
}

void SLToken::clear(SLToken *this)
{
  uint64_t v2 = (const void *)*((void *)this + 6);
  if (v2)
  {
    CFRelease(v2);
    *((void *)this + 6) = 0;
  }
LABEL_3:
  uint64_t v4 = *((void *)this + 10);
  uint64_t v3 = *((void *)this + 11);
  while (v3 != v4)
  {
    uint64_t v6 = *(SLHomograph **)(v3 - 8);
    v3 -= 8;
    uint64_t v5 = v6;
    *((void *)this + 11) = v3;
    if (v6)
    {
      SLHomograph::~SLHomograph(v5);
      MEMORY[0x223CA4030]();
      goto LABEL_3;
    }
  }
}

void SLToken::SetType(SLToken *this, char a2)
{
  *(unsigned char *)this = a2;
  *((_DWORD *)this + 4) &= ~0x40u;
  SLToken::clear(this);
}

void SLToken::ChooseHomograph(SLToken *this, SLHomograph *a2)
{
  uint64_t v5 = (void *)*((void *)this + 10);
  uint64_t v4 = (void *)*((void *)this + 11);
  if (v4 == v5)
  {
    uint64_t v5 = (void *)*((void *)this + 11);
  }
  else
  {
    do
    {
      uint64_t v7 = (SLHomograph *)*--v4;
      uint64_t v6 = v7;
      *((void *)this + 11) = v4;
      if (v7 != a2 && v6 != 0)
      {
        SLHomograph::~SLHomograph(v6);
        MEMORY[0x223CA4030]();
        uint64_t v5 = (void *)*((void *)this + 10);
        uint64_t v4 = (void *)*((void *)this + 11);
      }
    }
    while (v4 != v5);
  }
  unint64_t v9 = *((void *)this + 12);
  if ((unint64_t)v5 >= v9)
  {
    uint64_t v11 = v9 - (void)v5;
    uint64_t v12 = v11 >> 2;
    if ((unint64_t)(v11 >> 2) <= 1) {
      uint64_t v12 = 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    long long v14 = std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)this + 96, v13);
    unint64_t v16 = &v14[v15];
    void *v14 = a2;
    long long v10 = v14 + 1;
    int64_t v18 = (char *)*((void *)this + 10);
    BOOL v17 = (char *)*((void *)this + 11);
    if (v17 != v18)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *--long long v14 = v19;
      }
      while (v17 != v18);
      BOOL v17 = (char *)*((void *)this + 10);
    }
    *((void *)this + 10) = v14;
    *((void *)this + 11) = v10;
    *((void *)this + 12) = v16;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *uint64_t v5 = a2;
    long long v10 = v5 + 1;
  }
  *((void *)this + 11) = v10;
}

uint64_t SLToken::SelectHomographs(SLToken *this, int a2, const SLWordTagSet *a3)
{
  uint64_t v3 = *((void *)this + 10);
  if (*((void *)this + 11) == v3) {
    return 0;
  }
  unint64_t v23 = (char *)this + 80;
  unint64_t v7 = 0;
  unsigned int v8 = 0;
  unsigned int v9 = 0;
  do
  {
    long long v10 = *(int **)(v3 + 8 * v7);
    int v11 = *v10 & a2;
    if (v11)
    {
      unint64_t v12 = 0;
      int *v10 = v11;
      unint64_t v13 = (SLWordTagSet *)(v10 + 1);
      int v14 = 1;
      while (v12 < *(unsigned __int16 *)a3)
      {
        unint64_t v15 = v12 + 1;
        unint64_t v16 = (char *)a3 + 2 * v12;
        v14 &= SLWordTagSet::find(v13, *((unsigned __int16 *)v16 + 1));
        BOOL v17 = SLWordTagSet::find(v13, *((unsigned __int16 *)v16 + 1) ^ 1);
        unint64_t v12 = v15;
        if (v17)
        {
          if ((v14 & 1) == 0) {
            goto LABEL_12;
          }
          goto LABEL_10;
        }
      }
      if (v14)
      {
LABEL_10:
        v8 |= 1 << v7;
        goto LABEL_12;
      }
      v9 |= 1 << v7;
    }
LABEL_12:
    ++v7;
    uint64_t v3 = *((void *)this + 10);
    uint64_t v18 = *((void *)this + 11);
  }
  while (v7 < (v18 - v3) >> 3);
  if (!v8)
  {
    unsigned int v8 = v9;
    if (!v9) {
      return 0;
    }
  }
  if (v8 != ~(-1 << ((unint64_t)(v18 - v3) >> 3)))
  {
    if (v18 == v3)
    {
      unint64_t v20 = 0;
    }
    else
    {
      unint64_t v19 = 0;
      unint64_t v20 = 0;
      do
      {
        unint64_t v21 = *(SLHomograph **)(v3 + 8 * v19);
        if ((v8 >> v19))
        {
          *(void *)(v3 + 8 * v20++) = v21;
        }
        else if (v21)
        {
          SLHomograph::~SLHomograph(v21);
          MEMORY[0x223CA4030]();
        }
        ++v19;
        uint64_t v3 = *((void *)this + 10);
      }
      while (v19 < (*((void *)this + 11) - v3) >> 3);
    }
    std::vector<SLHomograph *>::resize((uint64_t)v23, v20);
  }
  return 1;
}

void std::vector<SLHomograph *>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<SLHomograph *>::__append((void **)a1, a2 - v2);
  }
}

uint64_t SLToken::ExcludeHomographs(SLToken *this, const SLWordTagSet *a2)
{
  uint64_t v2 = *((void *)this + 10);
  if (*((void *)this + 11) == v2) {
    goto LABEL_13;
  }
  unint64_t v5 = 0;
  char v6 = 0;
  do
  {
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)(v2 + 8 * v5);
    do
    {
      if (v7 >= *(unsigned __int16 *)a2)
      {
        uint64_t v11 = *((void *)this + 11);
        goto LABEL_10;
      }
      unint64_t v9 = v7 + 1;
      BOOL v10 = SLWordTagSet::find((SLWordTagSet *)(v8 + 4), *((unsigned __int16 *)a2 + v7 + 1));
      unint64_t v7 = v9;
    }
    while (!v10);
    if (v8)
    {
      SLHomograph::~SLHomograph((SLHomograph *)v8);
      MEMORY[0x223CA4030]();
    }
    *(void *)(*((void *)this + 10) + 8 * v5) = *(void *)(*((void *)this + 11) - 8);
    uint64_t v11 = *((void *)this + 11) - 8;
    *((void *)this + 11) = v11;
    char v6 = 1;
LABEL_10:
    ++v5;
    uint64_t v2 = *((void *)this + 10);
  }
  while (v5 < (v11 - v2) >> 3);
  if (v11 == v2) {
LABEL_13:
  }
    SLToken::ExcludeHomographs();
  return v6 & 1;
}

BOOL SLToken::HasTag(SLToken *this, int a2)
{
  uint64_t v2 = *((void *)this + 10);
  if (*((void *)this + 11) == v2) {
    return 0;
  }
  unint64_t v5 = 0;
  do
  {
    BOOL result = SLWordTagSet::find((SLWordTagSet *)(*(void *)(v2 + 8 * v5) + 4), a2);
    if (result) {
      break;
    }
    ++v5;
    uint64_t v2 = *((void *)this + 10);
  }
  while (v5 < (*((void *)this + 11) - v2) >> 3);
  return result;
}

BOOL SLToken::HasPOS(SLToken *this, int a2)
{
  uint64_t v2 = (_DWORD **)*((void *)this + 10);
  uint64_t v3 = *((void *)this + 11) - (void)v2;
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3 >> 3;
  if (v4 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = v4;
  }
  if ((**v2 & a2) != 0) {
    return 1;
  }
  uint64_t v7 = 1;
  do
  {
    unint64_t v8 = v7;
    if (v5 == v7) {
      break;
    }
    int v9 = *v2[v7++];
  }
  while ((v9 & a2) == 0);
  return v8 < v4;
}

void SLToken::SetText(SLToken *this, char *a2)
{
  unint64_t v4 = (void **)((char *)this + 56);
  *((void *)this + 8) = *((void *)this + 7);
  uint64_t v5 = (const void *)*((void *)this + 6);
  if (v5)
  {
    CFRelease(v5);
    *((void *)this + 6) = 0;
  }
  char v6 = *a2;
  if (*a2)
  {
    while (1)
    {
      __int16 v7 = v6;
      if (v6 < 0)
      {
        if ((v6 & 0xE0) == 0xC0)
        {
          __int16 v8 = a2[1] & 0x3F | ((v6 & 0x1F) << 6);
          a2 += 2;
          __int16 v7 = v8;
          goto LABEL_32;
        }
        if ((v6 & 0xF0) == 0xE0)
        {
          __int16 v7 = (v6 << 12) | ((a2[1] & 0x3F) << 6) | a2[2] & 0x3F;
          a2 += 3;
          goto LABEL_32;
        }
        if ((v6 & 0xF8) == 0xF0)
        {
          int v9 = ((v6 & 0xF) << 18) | ((a2[1] & 0x3F) << 12) | ((a2[2] & 0x3F) << 6);
          unsigned int v10 = v9 | a2[3] & 0x3F;
          __int16 v7 = ((a2[1] & 0x3F) << 12) | ((a2[2] & 0x3F) << 6) | a2[3] & 0x3F;
          if (v10 >= 0x10000)
          {
            unsigned int v11 = ((v9 + 67043328) >> 10) - 10240;
            unint64_t v13 = (char *)*((void *)this + 8);
            unint64_t v12 = *((void *)this + 9);
            if ((unint64_t)v13 >= v12)
            {
              unint64_t v15 = (char *)*v4;
              uint64_t v16 = v13 - (unsigned char *)*v4;
              if (v16 <= -3) {
                goto LABEL_70;
              }
              uint64_t v17 = v16 >> 1;
              unint64_t v18 = v12 - (void)v15;
              if (v18 <= (v16 >> 1) + 1) {
                unint64_t v19 = v17 + 1;
              }
              else {
                unint64_t v19 = v18;
              }
              if (v18 >= 0x7FFFFFFFFFFFFFFELL) {
                uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                uint64_t v20 = v19;
              }
              if (v20)
              {
                unint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 72, v20);
                unint64_t v15 = (char *)*((void *)this + 7);
                unint64_t v13 = (char *)*((void *)this + 8);
              }
              else
              {
                unint64_t v21 = 0;
              }
              unint64_t v22 = &v21[2 * v17];
              *(_WORD *)unint64_t v22 = v11;
              int v14 = v22 + 2;
              while (v13 != v15)
              {
                __int16 v23 = *((_WORD *)v13 - 1);
                v13 -= 2;
                *((_WORD *)v22 - 1) = v23;
                v22 -= 2;
              }
              *((void *)this + 7) = v22;
              *((void *)this + 8) = v14;
              *((void *)this + 9) = &v21[2 * v20];
              if (v15) {
                operator delete(v15);
              }
            }
            else
            {
              *(_WORD *)unint64_t v13 = v11;
              int v14 = v13 + 2;
            }
            *((void *)this + 8) = v14;
            __int16 v7 = v10 & 0x3FF | 0xDC00;
          }
          a2 += 4;
          goto LABEL_32;
        }
        __int16 v7 = 0;
      }
      ++a2;
LABEL_32:
      unint64_t v25 = (char *)*((void *)this + 8);
      unint64_t v24 = *((void *)this + 9);
      if ((unint64_t)v25 >= v24)
      {
        uint64_t v27 = (char *)*v4;
        uint64_t v28 = v25 - (unsigned char *)*v4;
        if (v28 <= -3) {
          goto LABEL_70;
        }
        uint64_t v29 = v28 >> 1;
        unint64_t v30 = v24 - (void)v27;
        if (v30 <= (v28 >> 1) + 1) {
          unint64_t v31 = v29 + 1;
        }
        else {
          unint64_t v31 = v30;
        }
        if (v30 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v32 = v31;
        }
        if (v32)
        {
          unint64_t v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 72, v32);
          uint64_t v27 = (char *)*((void *)this + 7);
          unint64_t v25 = (char *)*((void *)this + 8);
        }
        else
        {
          unint64_t v33 = 0;
        }
        unint64_t v34 = &v33[2 * v29];
        *(_WORD *)unint64_t v34 = v7;
        uint64_t v26 = v34 + 2;
        while (v25 != v27)
        {
          __int16 v35 = *((_WORD *)v25 - 1);
          v25 -= 2;
          *((_WORD *)v34 - 1) = v35;
          v34 -= 2;
        }
        *((void *)this + 7) = v34;
        *((void *)this + 8) = v26;
        *((void *)this + 9) = &v33[2 * v32];
        if (v27) {
          operator delete(v27);
        }
      }
      else
      {
        *(_WORD *)unint64_t v25 = v7;
        uint64_t v26 = v25 + 2;
      }
      *((void *)this + 8) = v26;
      char v6 = *a2;
      if (!*a2) {
        goto LABEL_52;
      }
    }
  }
  uint64_t v26 = (char *)*((void *)this + 8);
LABEL_52:
  unint64_t v36 = *((void *)this + 9);
  if ((unint64_t)v26 >= v36)
  {
    int v38 = (char *)*v4;
    uint64_t v39 = v26 - (unsigned char *)*v4;
    if (v39 <= -3) {
LABEL_70:
    }
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    uint64_t v40 = v39 >> 1;
    unint64_t v41 = v36 - (void)v38;
    if (v41 <= (v39 >> 1) + 1) {
      unint64_t v42 = v40 + 1;
    }
    else {
      unint64_t v42 = v41;
    }
    if (v41 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v43 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v43 = v42;
    }
    if (v43)
    {
      uint64_t v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 72, v43);
      int v38 = (char *)*((void *)this + 7);
      uint64_t v26 = (char *)*((void *)this + 8);
    }
    else
    {
      uint64_t v44 = 0;
    }
    uint64_t v45 = &v44[2 * v40];
    unint64_t v46 = &v44[2 * v43];
    *(_WORD *)uint64_t v45 = 0;
    char v37 = v45 + 2;
    while (v26 != v38)
    {
      __int16 v47 = *((_WORD *)v26 - 1);
      v26 -= 2;
      *((_WORD *)v45 - 1) = v47;
      v45 -= 2;
    }
    *((void *)this + 7) = v45;
    *((void *)this + 8) = v37;
    *((void *)this + 9) = v46;
    if (v38) {
      operator delete(v38);
    }
  }
  else
  {
    *(_WORD *)uint64_t v26 = 0;
    char v37 = v26 + 2;
  }
  *((void *)this + 8) = v37;
}

char *SLToken::AppendToken(SLToken *this, char **a2)
{
  BOOL result = std::vector<unsigned short>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned short *>,std::__wrap_iter<unsigned short *>>((uint64_t)this + 56, *((void *)this + 8) - 2, a2[7], a2[8] - 2, (a2[8] - 2 - a2[7]) >> 1);
  *((_DWORD *)this + 4) = a2[2] & 0x1001 | *((_DWORD *)this + 4) & 0xFFFFEFFE;
  uint64_t v5 = *((void *)this + 5);
  if (a2[4] == (char *)(v5 + *((void *)this + 4))) {
    *((void *)this + 5) = &a2[5][v5];
  }
  return result;
}

void SLToken::SetTokenRange(SLToken *this, SLToken *a2, CFRange a3)
{
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  __int16 v7 = (void **)((char *)this + 56);
  std::vector<unsigned short>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned short *>,std::__wrap_iter<unsigned short *>>((char *)this + 56, (char *)(*((void *)a2 + 7) + 2 * a3.location), *((void *)a2 + 7) + 2 * a3.location + 2 * a3.length, a3.length);
  unint64_t v8 = *((void *)this + 9);
  int v9 = (char *)*((void *)this + 8);
  if ((unint64_t)v9 >= v8)
  {
    unsigned int v11 = (char *)*v7;
    uint64_t v12 = v9 - (unsigned char *)*v7;
    if (v12 <= -3) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v13 = v12 >> 1;
    unint64_t v14 = v8 - (void)v11;
    if (v14 <= (v12 >> 1) + 1) {
      unint64_t v15 = v13 + 1;
    }
    else {
      unint64_t v15 = v14;
    }
    if (v14 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v16 = v15;
    }
    if (v16)
    {
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 72, v16);
      unsigned int v11 = (char *)*((void *)this + 7);
      int v9 = (char *)*((void *)this + 8);
    }
    else
    {
      uint64_t v17 = 0;
    }
    unint64_t v18 = &v17[2 * v13];
    unint64_t v19 = &v17[2 * v16];
    *(_WORD *)unint64_t v18 = 0;
    unsigned int v10 = v18 + 2;
    while (v9 != v11)
    {
      __int16 v20 = *((_WORD *)v9 - 1);
      v9 -= 2;
      *((_WORD *)v18 - 1) = v20;
      v18 -= 2;
    }
    *((void *)this + 7) = v18;
    *((void *)this + 8) = v10;
    *((void *)this + 9) = v19;
    if (v11) {
      operator delete(v11);
    }
  }
  else
  {
    *(_WORD *)int v9 = 0;
    unsigned int v10 = v9 + 2;
  }
  *((void *)this + 8) = v10;
  *((void *)this + 4) = location;
  *((void *)this + 5) = length;
  *((void *)this + 4) = *((void *)a2 + 4) + location;
}

void *SLToken::RemoveRange(void *this, CFRange a2)
{
  CFIndex length = a2.length;
  uint64_t v3 = (uint64_t)this;
  if (a2.length)
  {
    unint64_t v4 = (unsigned char *)this[8];
    uint64_t v5 = (char *)(this[7] + 2 * a2.location);
    char v6 = &v5[2 * a2.length];
    uint64_t v7 = v4 - v6;
    if (v4 != v6) {
      this = memmove(v5, v6, v4 - v6);
    }
    *(void *)(v3 + 64) = &v5[v7];
  }
  *(void *)(v3 + 40) -= length;
  return this;
}

void SLToken::TransferTokenRange(SLToken *this, SLToken *a2, CFRange a3)
{
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  SLToken::SetTokenRange(this, a2, a3);
  if (length)
  {
    char v6 = (unsigned char *)*((void *)a2 + 8);
    uint64_t v7 = (char *)(*((void *)a2 + 7) + 2 * location);
    unint64_t v8 = &v7[2 * length];
    uint64_t v9 = v6 - v8;
    if (v6 != v8) {
      memmove(v7, v8, v6 - v8);
    }
    *((void *)a2 + 8) = &v7[v9];
  }
  *((void *)a2 + 5) -= length;
}

uint64_t SLToken::Capitalization(SLToken *this)
{
  int v1 = *((_DWORD *)this + 4);
  if ((v1 & 0x10) != 0) {
    return 33;
  }
  if (*((unsigned char *)this + 5) == 1)
  {
    if (*((void *)this + 8) - *((void *)this + 7) == 4) {
      return 33;
    }
    else {
      return 43;
    }
  }
  else if ((v1 & 8) != 0)
  {
    return 63;
  }
  else
  {
    uint64_t v3 = (_WORD *)*((void *)this + 7);
    unint64_t v4 = *((void *)this + 8) - (void)v3;
    uint64_t result = 63;
    if (v4 >= 4)
    {
      if ((SLChar::sCharClass[*v3 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v3 >> 6] << 6)] & 0x1F) == 1) {
        return 45;
      }
      else {
        return 63;
      }
    }
  }
  return result;
}

uint64_t SLToken::SetCapitalization(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 16);
  *(_DWORD *)(result + 16) = v2 & 0xFFFFFFF7;
  if (a2 != 45)
  {
    if (a2 == 43)
    {
      *(unsigned char *)(result + 5) = 1;
    }
    else
    {
      if (a2 == 33) {
        unsigned int v3 = v2 & 0xFFFFFFE7 | 0x10;
      }
      else {
        unsigned int v3 = v2 | 8;
      }
      *(_DWORD *)(result + 16) = v3;
    }
  }
  return result;
}

char *SLToken::TypeName(SLToken *this)
{
  return sTypeName[this];
}

char *SLToken::FlagName(SLToken *this)
{
  return sFlagName[(void)this];
}

void SLPhonTune::SLPhonTune(SLPhonTune *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 1) = 0;
}

{
  *(_DWORD *)this = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 1) = 0;
}

void SLHomograph::SLHomograph(SLHomograph *this)
{
  *(_DWORD *)this = 0;
  *((_WORD *)this + 2) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((void *)this + 9) = 0;
}

{
  *(_DWORD *)this = 0;
  *((_WORD *)this + 2) = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((void *)this + 9) = 0;
}

void SLHomograph::~SLHomograph(SLHomograph *this)
{
  int v2 = (const void *)*((void *)this + 3);
  if (v2) {
    CFRelease(v2);
  }
  unint64_t v4 = (void **)((char *)this + 56);
  std::vector<SLPhonTune>::__destroy_vector::operator()[abi:ne180100](&v4);
  unsigned int v3 = (void *)*((void *)this + 4);
  if (v3)
  {
    *((void *)this + 5) = v3;
    operator delete(v3);
  }
}

void SLTokenCreateTemp()
{
}

uint64_t (***SLTokenCreateFromBuffer(uint64_t a1))(void)
{
  if (!SLLexerBuffer::operator[]((void *)a1, 0)) {
    return 0;
  }
  if (*(unsigned char *)SLLexerBuffer::operator[]((void *)a1, 0) == 36
    || *(unsigned char *)SLLexerBuffer::operator[]((void *)a1, 0) == 34)
  {
    int v2 = (SLToken *)SLLexerBuffer::operator[]((void *)a1, 0);
    *(int64x2_t *)(a1 + 56) = vaddq_s64(*(int64x2_t *)(a1 + 56), (int64x2_t)xmmword_222ABEE70);
    std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](a1 + 24, 1);
    if (v2)
    {
      SLToken::~SLToken(v2);
      MEMORY[0x223CA4030]();
    }
    return 0;
  }
  if (SLLexerBuffer::operator[]((void *)a1, 1uLL)) {
    operator new();
  }
  unsigned int v3 = SLLexerBuffer::operator[]((void *)a1, 0);
  *(int64x2_t *)(a1 + 56) = vaddq_s64(*(int64x2_t *)(a1 + 56), (int64x2_t)xmmword_222ABEE70);
  std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](a1 + 24, 1);
  uint64_t v5 = v3[11];
  if (v5 != v3[10]) {
    operator new();
  }
  char v6 = v3[11];
  v3[10] = 0;
  v3[11] = 0;
  uint64_t v9 = v6;
  v3[12] = 0;
  if (v5 == v6)
  {
    char v6 = v5;
    if (!v5) {
      return v3;
    }
LABEL_19:
    operator delete(v6);
    return v3;
  }
  do
  {
    unint64_t v8 = (SLHomograph *)*--v5;
    uint64_t v7 = v8;
    if (v8)
    {
      SLHomograph::~SLHomograph(v7);
      MEMORY[0x223CA4030]();
      char v6 = v9;
    }
  }
  while (v5 != v6);
  if (v6) {
    goto LABEL_19;
  }
  return v3;
}

void sub_222A4F31C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p,uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFStringRef SLTokenGetText(void *a1)
{
  CFStringRef result = (CFStringRef)a1[6];
  if (!result)
  {
    unsigned int v3 = (const UniChar *)a1[7];
    unint64_t v4 = (const UniChar *)a1[8];
    if (v3 == v4) {
      CFStringRef result = &stru_26D52CCD8;
    }
    else {
      CFStringRef result = CFStringCreateWithCharactersNoCopy(0, v3, v4 - v3 - 1, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    }
    a1[6] = result;
  }
  return result;
}

char *SLTokenAddHomographs(uint64_t a1, uint64_t a2)
{
  CFStringRef result = std::vector<SLHomograph *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<SLHomograph **>,std::__wrap_iter<SLHomograph **>>(a1 + 80, *(void *)(a1 + 88), *(char **)(a2 + 80), *(char **)(a2 + 88), (uint64_t)(*(void *)(a2 + 88) - *(void *)(a2 + 80)) >> 3);
  *(void *)(a2 + 88) = *(void *)(a2 + 80);
  return result;
}

SLToken *SLTokenRelease(SLToken *result)
{
  if (result)
  {
    SLToken::~SLToken(result);
    JUMPOUT(0x223CA4030);
  }
  return result;
}

uint64_t SLTokenGetClass(unsigned __int8 *a1)
{
  int v2 = *a1;
  uint64_t result = 32;
  switch(v2)
  {
    case 0:
    case 1:
    case 2:
    case 7:
    case 8:
      return result;
    case 3:
      return 91;
    case 4:
    case 5:
    case 10:
    case 11:
    case 12:
    case 14:
      goto LABEL_4;
    case 6:
      return 47;
    case 9:
      uint64_t v5 = a1 + 80;
      unint64_t v4 = (_DWORD **)*((void *)a1 + 10);
      if (*((_DWORD ***)v5 + 1) != v4 && (**v4 & 0x80000000) != 0) {
        goto LABEL_9;
      }
      return result;
    case 13:
LABEL_9:
      uint64_t result = 46;
      break;
    case 15:
      uint64_t result = 43;
      break;
    case 16:
      uint64_t result = 35;
      break;
    default:
      if (v2 != 33) {
LABEL_4:
      }
        uint64_t result = 63;
      break;
  }
  return result;
}

uint64_t SLTokenGetInfo(SLToken *this, int a2, _WORD *a3)
{
  uint64_t result = 0;
  if (a2 <= 1668577647)
  {
    if (a2 <= 1667330110)
    {
      if (a2 == 1634759278)
      {
        if ((*((unsigned char *)this + 17) & 4) == 0)
        {
          uint64_t result = 0;
          *a3 = 73;
          return result;
        }
        *a3 = 72;
        return 1;
      }
      if (a2 != 1651863140) {
        return result;
      }
      char v5 = *((unsigned char *)this + 1);
      goto LABEL_31;
    }
    switch(a2)
    {
      case 1667330111:
        *(_DWORD *)a3 = SLToken::Capitalization(this);
        return 1;
      case 1667657315:
        return (*((unsigned __int8 *)this + 17) >> 3) & 1;
      case 1668313709:
        if (*(unsigned char *)this == 3)
        {
          int v6 = *((_DWORD *)this + 3);
LABEL_28:
          *(_DWORD *)a3 = v6;
          return 1;
        }
        return 0;
    }
  }
  else
  {
    if (a2 <= 1802071651)
    {
      if (a2 != 1668577648)
      {
        if (a2 != 1684628340)
        {
          if (a2 != 1701671016) {
            return result;
          }
          char v5 = *((unsigned char *)this + 2);
          goto LABEL_31;
        }
        *(void *)a3 = *((void *)this + 3);
        return 1;
      }
      if (*(unsigned char *)this == 3)
      {
        int v6 = *((_DWORD *)this + 2);
        goto LABEL_28;
      }
      return 0;
    }
    switch(a2)
    {
      case 1802071652:
        if ((*(unsigned __int8 *)this | 2) == 0xF)
        {
          char v5 = **((unsigned char **)this + 7);
LABEL_31:
          *(unsigned char *)a3 = v5;
          return 1;
        }
        return 0;
      case 1886352161:
        return (*((unsigned __int8 *)this + 18) >> 4) & 1;
      case 2003330418:
        *(_OWORD *)a3 = *((_OWORD *)this + 2);
        return 1;
    }
  }
  return result;
}

uint64_t SLTokenGetTupleGroup(uint64_t a1, unsigned char *a2)
{
  if (a2) {
    *a2 = *(unsigned char *)(a1 + 20);
  }
  return *(unsigned __int8 *)(a1 + 6);
}

uint64_t SLTokenCountHomographs(uint64_t a1)
{
  return (uint64_t)(*(void *)(a1 + 88) - *(void *)(a1 + 80)) >> 3;
}

uint64_t SLTokenGetHomograph(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 80) + 8 * a2);
}

uint64_t SLHomographGetPOS(unsigned int *a1)
{
  return *a1;
}

uint64_t SLHomographGetTags(uint64_t a1)
{
  return *(void *)(a1 + 4);
}

CFDataRef SLHomographGetPhonemes(uint64_t a1)
{
  CFDataRef result = *(CFDataRef *)(a1 + 24);
  if (!result)
  {
    CFDataRef result = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)(a1 + 32), *(void *)(a1 + 40) - *(void *)(a1 + 32), (CFAllocatorRef)*MEMORY[0x263EFFB28]);
    *(void *)(a1 + 24) = result;
  }
  return result;
}

void SLTokenList::SLTokenList(SLTokenList *this)
{
  *(void *)this = this;
  *((void *)this + 1) = this;
  *((void *)this + 2) = 0;
  *((_WORD *)this + 12) = 0;
}

{
  *(void *)this = this;
  *((void *)this + 1) = this;
  *((void *)this + 2) = 0;
  *((_WORD *)this + 12) = 0;
}

void *SLTokenList::push_back(SLTokenList *this, SLToken *a2)
{
  if (*((unsigned char *)this + 24))
  {
    *((unsigned char *)a2 + 1) = *((unsigned char *)this + 24);
    *((unsigned char *)this + 24) = 0;
  }
  if (*((unsigned char *)this + 25))
  {
    *((unsigned char *)a2 + 2) = *((unsigned char *)this + 25);
    *((unsigned char *)this + 25) = 0;
  }
  CFDataRef result = operator new(0x18uLL);
  result[1] = this;
  result[2] = a2;
  uint64_t v5 = *(void *)this;
  *CFDataRef result = *(void *)this;
  *(void *)(v5 + 8) = result;
  *(void *)this = result;
  ++*((void *)this + 2);
  return result;
}

CFArrayRef SLHomographCopyTune(uint64_t a1)
{
  int v1 = *(void **)(a1 + 56);
  int v2 = *(void **)(a1 + 64);
  if (v1 == v2) {
    return 0;
  }
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  for (uint64_t i = 0; v1 < v2; v1 += 4)
  {
    *(_OWORD *)unint64_t v46 = 0u;
    long long v47 = 0u;
    long long v45 = 0u;
    unsigned int v3 = (const void *)kCFTuneDurationKey;
    CFNumberRef v4 = CFNumberCreate(0, kCFNumberFloat32Type, v1);
    SLCFDictionaryBuilder::push_back((SLCFDictionaryBuilder *)&v45, v3, v4);
    unint64_t v5 = v1[1];
    unint64_t v6 = v1[2];
    if (v5 != v6)
    {
      unint64_t v42 = 0;
      uint64_t v43 = 0;
      uint64_t v44 = 0;
      while (v5 < v6)
      {
        *(_OWORD *)std::string __p = 0u;
        long long v41 = 0u;
        long long v39 = 0u;
        uint64_t v7 = (const void *)kCFTunePitchKey;
        CFNumberRef v8 = CFNumberCreate(0, kCFNumberFloat32Type, (const void *)v5);
        SLCFDictionaryBuilder::push_back((SLCFDictionaryBuilder *)&v39, v7, v8);
        uint64_t v9 = (const void *)kCFTuneLocationKey;
        CFNumberRef v10 = CFNumberCreate(0, kCFNumberFloat32Type, (const void *)(v5 + 4));
        SLCFDictionaryBuilder::push_back((SLCFDictionaryBuilder *)&v39, v9, v10);
        CFDictionaryRef Dictionary = SLCFDictionaryBuilder::CreateDictionary((const void ***)&v39);
        CFDictionaryRef v12 = Dictionary;
        uint64_t v13 = v43;
        if (v43 >= v44)
        {
          uint64_t v15 = v43 - v42;
          if ((unint64_t)(v15 + 1) >> 61) {
            std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v16 = ((char *)v44 - (char *)v42) >> 2;
          if (v16 <= v15 + 1) {
            unint64_t v16 = v15 + 1;
          }
          if ((unint64_t)((char *)v44 - (char *)v42) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            unint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)&v44, v17);
          }
          else {
            unint64_t v18 = 0;
          }
          unint64_t v19 = (const void **)&v18[8 * v15];
          char *v19 = v12;
          unint64_t v14 = v19 + 1;
          unint64_t v21 = v42;
          __int16 v20 = v43;
          if (v43 != v42)
          {
            do
            {
              unint64_t v22 = *--v20;
              *--unint64_t v19 = v22;
            }
            while (v20 != v21);
            __int16 v20 = v42;
          }
          unint64_t v42 = v19;
          uint64_t v43 = v14;
          uint64_t v44 = (const void **)&v18[8 * v17];
          if (v20) {
            operator delete(v20);
          }
        }
        else
        {
          std::string *v43 = Dictionary;
          unint64_t v14 = v13 + 1;
        }
        uint64_t v43 = v14;
        if (__p[1])
        {
          *(void **)&long long v41 = __p[1];
          operator delete(__p[1]);
        }
        SLCFArrayBuilder::~SLCFArrayBuilder((SLCFArrayBuilder *)&v39);
        v5 += 8;
      }
      __int16 v23 = (const void *)kCFTunePitchTargetsKey;
      CFArrayRef v24 = SLCFArrayBuilder::CreateArray(&v42);
      SLCFDictionaryBuilder::push_back((SLCFDictionaryBuilder *)&v45, v23, v24);
      SLCFArrayBuilder::~SLCFArrayBuilder((SLCFArrayBuilder *)&v42);
    }
    CFDictionaryRef v25 = SLCFDictionaryBuilder::CreateDictionary((const void ***)&v45);
    CFDictionaryRef v26 = v25;
    uint64_t v27 = v49;
    if (v49 >= i)
    {
      uint64_t v29 = v49 - v48;
      if ((unint64_t)(v29 + 1) >> 61) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v30 = ((char *)i - (char *)v48) >> 2;
      if (v30 <= v29 + 1) {
        unint64_t v30 = v29 + 1;
      }
      if ((unint64_t)((char *)i - (char *)v48) >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v30;
      }
      if (v31) {
        uint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)&i, v31);
      }
      else {
        uint64_t v32 = 0;
      }
      unint64_t v33 = (const void **)&v32[8 * v29];
      *unint64_t v33 = v26;
      uint64_t v28 = v33 + 1;
      __int16 v35 = v48;
      unint64_t v34 = v49;
      if (v49 != v48)
      {
        do
        {
          unint64_t v36 = *--v34;
          *--unint64_t v33 = v36;
        }
        while (v34 != v35);
        unint64_t v34 = v48;
      }
      uint64_t v48 = v33;
      uint64_t v49 = v28;
      uint64_t i = (const void **)&v32[8 * v31];
      if (v34) {
        operator delete(v34);
      }
    }
    else
    {
      *uint64_t v49 = v25;
      uint64_t v28 = v27 + 1;
    }
    uint64_t v49 = v28;
    if (v46[1])
    {
      *(void **)&long long v47 = v46[1];
      operator delete(v46[1]);
    }
    SLCFArrayBuilder::~SLCFArrayBuilder((SLCFArrayBuilder *)&v45);
  }
  CFArrayRef v37 = SLCFArrayBuilder::CreateArray(&v48);
  SLCFArrayBuilder::~SLCFArrayBuilder((SLCFArrayBuilder *)&v48);
  return v37;
}

void sub_222A4FB0C(_Unwind_Exception *a1)
{
  SLCFArrayBuilder::~SLCFArrayBuilder((SLCFArrayBuilder *)(v1 - 112));
  _Unwind_Resume(a1);
}

void SLCFDictionaryBuilder::~SLCFDictionaryBuilder(SLCFDictionaryBuilder *this)
{
  int v2 = (void *)*((void *)this + 3);
  if (v2)
  {
    *((void *)this + 4) = v2;
    operator delete(v2);
  }
  SLCFArrayBuilder::~SLCFArrayBuilder(this);
}

void std::vector<SLHomograph *>::__append(void **a1, unint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 3);
    if (v9 >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v8 >> 3;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 2 > v9) {
      unint64_t v9 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(v4, v12);
    }
    else {
      uint64_t v13 = 0;
    }
    unint64_t v14 = &v13[8 * v10];
    uint64_t v15 = &v13[8 * v12];
    bzero(v14, 8 * a2);
    unint64_t v16 = &v14[8 * a2];
    unint64_t v18 = (char *)*a1;
    unint64_t v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        uint64_t v19 = *((void *)v17 - 1);
        v17 -= 8;
        *((void *)v14 - 1) = v19;
        v14 -= 8;
      }
      while (v17 != v18);
      unint64_t v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

char *std::vector<unsigned short>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned short *>,std::__wrap_iter<unsigned short *>>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  unint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 1)
  {
    uint64_t v13 = *(void **)a1;
    if (a5 + ((uint64_t)(v12 - *(void *)a1) >> 1) < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = (__dst - (uint64_t)v13) >> 1;
    unint64_t v15 = v10 - (void)v13;
    if (v15 <= a5 + ((uint64_t)(v12 - *(void *)a1) >> 1)) {
      unint64_t v16 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 1);
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
    uint64_t v37 = v9;
    if (v17) {
      unint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v9, v17);
    }
    else {
      unint64_t v18 = 0;
    }
    uint64_t v28 = &v18[2 * v14];
    std::string __p = v18;
    unint64_t v34 = v28;
    unint64_t v36 = &v18[2 * v17];
    uint64_t v29 = 2 * a5;
    unint64_t v30 = &v28[2 * a5];
    do
    {
      __int16 v31 = *(_WORD *)v7;
      v7 += 2;
      *(_WORD *)uint64_t v28 = v31;
      v28 += 2;
      v29 -= 2;
    }
    while (v29);
    __int16 v35 = v30;
    unint64_t v5 = std::vector<unsigned short>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 1) & 0xFFFFFFFFFFFFFFFELL;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 1;
  if (v20 >= a5)
  {
    unint64_t v21 = &__src[2 * a5];
    __int16 v23 = *(char **)(v9 - 8);
LABEL_18:
    CFArrayRef v24 = &v5[2 * a5];
    CFDictionaryRef v25 = &v23[-2 * a5];
    CFDictionaryRef v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      CFDictionaryRef v26 = v23;
      do
      {
        __int16 v27 = *(_WORD *)v25;
        v25 += 2;
        *(_WORD *)CFDictionaryRef v26 = v27;
        v26 += 2;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-2 * ((v23 - v24) >> 1)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  unint64_t v21 = &__src[2 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[2 * v20], a4 - v21);
  }
  __int16 v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_18;
  }
  return v5;
}

void sub_222A4FE88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned short>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  unint64_t v5 = *(char **)(a2 + 8);
  unint64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    uint64_t v8 = __src;
    uint64_t v7 = *(char **)(a2 + 8);
    do
    {
      __int16 v9 = *((_WORD *)v8 - 1);
      v8 -= 2;
      *((_WORD *)v7 - 1) = v9;
      v7 -= 2;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    uint64_t v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  uint64_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  uint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  unint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

char *std::vector<unsigned short>::__assign_with_size[abi:ne180100]<std::__wrap_iter<unsigned short *>,std::__wrap_iter<unsigned short *>>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = *((void *)result + 2);
  __int16 v9 = *(char **)result;
  if (a4 > (uint64_t)(v8 - *(void *)result) >> 1)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    if (v8 <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v8 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v11 = v10;
    }
    CFDataRef result = std::vector<unsigned short>::__vallocate[abi:ne180100](v7, v11);
    uint64_t v13 = (char *)v7[1];
    int64_t v12 = (void **)(v7 + 1);
    __int16 v9 = v13;
LABEL_17:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  int64_t v12 = (void **)(result + 8);
  uint64_t v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 1;
  if (v15 >= a4) {
    goto LABEL_17;
  }
  unint64_t v16 = &__src[2 * v15];
  if (v14 != v9)
  {
    CFDataRef result = (char *)memmove(*(void **)result, __src, 2 * v15);
    __int16 v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_19:
    CFDataRef result = (char *)memmove(v18, v19, v17);
  }
LABEL_20:
  *int64_t v12 = &v9[v17];
  return result;
}

char *std::vector<unsigned short>::__vallocate[abi:ne180100](void *a1, uint64_t a2)
{
  if (a2 < 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  CFDataRef result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[2 * v4];
  return result;
}

void std::vector<SLPhonTune>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  int v2 = *a1;
  if (*v2)
  {
    std::vector<SLPhonTune>::__clear[abi:ne180100]((uint64_t *)v2);
    unsigned int v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<SLPhonTune>::__clear[abi:ne180100](uint64_t *a1)
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

void *std::vector<unsigned char>::__assign_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, char *__src, char *a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = result[2];
  __int16 v9 = (char *)*result;
  if (v8 - *result < a4)
  {
    if (v9)
    {
      result[1] = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = 2 * v8;
    if (2 * v8 <= a4) {
      uint64_t v10 = a4;
    }
    if (v8 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v10;
    }
    CFDataRef result = std::vector<unsigned char>::__vallocate[abi:ne180100](v7, v11);
    __int16 v9 = (char *)v7[1];
    goto LABEL_17;
  }
  int64_t v12 = (unsigned char *)result[1];
  size_t v13 = v12 - v9;
  if (v12 - v9 >= a4)
  {
LABEL_17:
    size_t v16 = a3 - __src;
    if (v16) {
      CFDataRef result = memmove(v9, __src, v16);
    }
    unint64_t v15 = &v9[v16];
    goto LABEL_20;
  }
  uint64_t v14 = &__src[v13];
  if (v12 != v9)
  {
    CFDataRef result = memmove((void *)*result, __src, v13);
    __int16 v9 = (char *)v7[1];
  }
  if (a3 != v14) {
    CFDataRef result = memmove(v9, v14, a3 - v14);
  }
  unint64_t v15 = &v9[a3 - v14];
LABEL_20:
  v7[1] = v15;
  return result;
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  CFDataRef result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

char *std::vector<SLHomograph *>::__insert_with_size[abi:ne180100]<std::__wrap_iter<SLHomograph **>,std::__wrap_iter<SLHomograph **>>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  unint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 3)
  {
    size_t v13 = *(void **)a1;
    unint64_t v14 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 3);
    if (v14 >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v15 = (__dst - (uint64_t)v13) >> 3;
    uint64_t v16 = v10 - (void)v13;
    if (v16 >> 2 > v14) {
      unint64_t v14 = v16 >> 2;
    }
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v17 = v14;
    }
    uint64_t v37 = v9;
    if (v17) {
      unint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(v9, v17);
    }
    else {
      unint64_t v18 = 0;
    }
    uint64_t v28 = &v18[8 * v15];
    std::string __p = v18;
    unint64_t v34 = v28;
    unint64_t v36 = &v18[8 * v17];
    uint64_t v29 = 8 * a5;
    unint64_t v30 = &v28[8 * a5];
    do
    {
      uint64_t v31 = *(void *)v7;
      v7 += 8;
      *(void *)uint64_t v28 = v31;
      v28 += 8;
      v29 -= 8;
    }
    while (v29);
    __int16 v35 = v30;
    unint64_t v5 = std::vector<SLHomograph *>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 7) & 0xFFFFFFFFFFFFFFF8;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 3;
  if (v20 >= a5)
  {
    unint64_t v21 = &__src[8 * a5];
    __int16 v23 = *(char **)(v9 - 8);
LABEL_17:
    CFArrayRef v24 = &v5[8 * a5];
    CFDictionaryRef v25 = &v23[-8 * a5];
    CFDictionaryRef v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      CFDictionaryRef v26 = v23;
      do
      {
        uint64_t v27 = *(void *)v25;
        v25 += 8;
        *(void *)CFDictionaryRef v26 = v27;
        v26 += 8;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-8 * ((v23 - v24) >> 3)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  unint64_t v21 = &__src[8 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[8 * v20], a4 - v21);
  }
  __int16 v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

void sub_222A504A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<SLHomograph *>::__swap_out_circular_buffer(void **a1, uint64_t a2, char *__src)
{
  unint64_t v5 = *(char **)(a2 + 8);
  unint64_t v6 = (char *)*a1;
  uint64_t v7 = v5;
  if (*a1 != __src)
  {
    unint64_t v8 = __src;
    uint64_t v7 = *(char **)(a2 + 8);
    do
    {
      uint64_t v9 = *((void *)v8 - 1);
      v8 -= 8;
      *((void *)v7 - 1) = v9;
      v7 -= 8;
    }
    while (v8 != v6);
  }
  *(void *)(a2 + 8) = v7;
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(a2 + 16);
  int64_t v12 = v10 - __src;
  if (v10 != __src)
  {
    memmove(*(void **)(a2 + 16), __src, v10 - __src);
    uint64_t v7 = *(char **)(a2 + 8);
  }
  *(void *)(a2 + 16) = v11 + v12;
  size_t v13 = (char *)*a1;
  *a1 = v7;
  *(void *)(a2 + 8) = v13;
  unint64_t v14 = a1[1];
  a1[1] = *(void **)(a2 + 16);
  *(void *)(a2 + 16) = v14;
  uint64_t v15 = a1[2];
  a1[2] = *(void **)(a2 + 24);
  *(void *)(a2 + 24) = v15;
  *(void *)a2 = *(void *)(a2 + 8);
  return v5;
}

char *std::vector<unsigned char>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned char const*>,std::__wrap_iter<unsigned char const*>>(uint64_t a1, char *__dst, char *__src, char *a4, uint64_t a5)
{
  unint64_t v5 = __dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v6 = a5;
  uint64_t v7 = __src;
  uint64_t v10 = *(char **)(a1 + 8);
  uint64_t v9 = *(void *)(a1 + 16);
  if (v9 - (uint64_t)v10 < a5)
  {
    uint64_t v11 = *(char **)a1;
    uint64_t v12 = (uint64_t)&v10[a5 - *(void *)a1];
    if (v12 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    size_t v13 = (char *)(__dst - v11);
    unint64_t v14 = v9 - (void)v11;
    if (2 * v14 > v12) {
      uint64_t v12 = 2 * v14;
    }
    if (v14 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v15 = v12;
    }
    if (v15) {
      uint64_t v16 = operator new(v15);
    }
    else {
      uint64_t v16 = 0;
    }
    CFDictionaryRef v26 = &v13[(void)v16];
    uint64_t v27 = &v13[(void)v16 + v6];
    uint64_t v28 = v26;
    do
    {
      char v29 = *v7++;
      *v28++ = v29;
      --v6;
    }
    while (v6);
    unint64_t v30 = *(char **)a1;
    if (*(char **)a1 == v5)
    {
      uint64_t v32 = v26;
    }
    else
    {
      uint64_t v31 = v5;
      uint64_t v32 = v26;
      do
      {
        char v33 = *--v31;
        *--uint64_t v32 = v33;
      }
      while (v31 != v30);
      uint64_t v10 = *(char **)(a1 + 8);
    }
    unint64_t v34 = (char *)v16 + v15;
    if (v10 != v5) {
      memmove(v27, v5, v10 - v5);
    }
    __int16 v35 = *(char **)a1;
    *(void *)a1 = v32;
    *(void *)(a1 + 8) = &v27[v10 - v5];
    *(void *)(a1 + 16) = v34;
    if (v35) {
      operator delete(v35);
    }
    return v26;
  }
  uint64_t v17 = v10 - __dst;
  if (v10 - __dst >= a5)
  {
    unint64_t v18 = &__src[a5];
    uint64_t v20 = *(char **)(a1 + 8);
LABEL_17:
    unint64_t v21 = &v5[v6];
    int64_t v22 = &v20[-v6];
    __int16 v23 = v20;
    if (&v20[-v6] < v10)
    {
      int64_t v24 = &v10[v6] - v20;
      __int16 v23 = v20;
      do
      {
        char v25 = *v22++;
        *v23++ = v25;
        --v24;
      }
      while (v24);
    }
    *(void *)(a1 + 8) = v23;
    if (v20 != v21) {
      memmove(&v5[v6], v5, v20 - v21);
    }
    if (v18 != v7) {
      memmove(v5, v7, v18 - v7);
    }
    return v5;
  }
  unint64_t v18 = &__src[v17];
  int64_t v19 = a4 - &__src[v17];
  if (a4 != &__src[v17]) {
    memmove(*(void **)(a1 + 8), &__src[v17], a4 - &__src[v17]);
  }
  uint64_t v20 = &v10[v19];
  *(void *)(a1 + 8) = &v10[v19];
  if (v17 >= 1) {
    goto LABEL_17;
  }
  return v5;
}

uint64_t SLFirstPOSInSet(unsigned int a1)
{
  unsigned __int8 v1 = __clz(__rbit32(a1));
  if (!a1) {
    return -1;
  }
  return v1;
}

const char *SLTag::Name(SLTag *this)
{
  if ((this - 154) >= 0xFFFFFFA6) {
    return SLTag::sName[(int)this - 64];
  }
  else {
    return "";
  }
}

BOOL SLWordTagSet::find(SLWordTagSet *this, int a2)
{
  unint64_t v2 = 0;
  unsigned int v5 = *(unsigned __int16 *)this;
  unsigned int v3 = (char *)this + 2;
  unint64_t v4 = v5;
  do
  {
    unint64_t v6 = v2;
    if (v4 == v2) {
      break;
    }
    ++v2;
  }
  while (*(unsigned __int16 *)&v3[2 * v6] != a2);
  return v6 < v4;
}

unsigned __int16 *SLWordTagSet::erase(unsigned __int16 *this, int a2)
{
  unsigned __int16 v2 = *this;
  if (*this)
  {
    unint64_t v3 = 0;
    do
    {
      unint64_t v4 = &this[v3];
      if (v4[1] == a2)
      {
        *this = v2 - 1;
        v4[1] = this[v2--];
      }
      ++v3;
    }
    while (v3 < v2);
  }
  return this;
}

_WORD *operator+=(_WORD *result, _WORD *a2)
{
  uint64_t v2 = (unsigned __int16)*a2;
  if (*a2)
  {
    unint64_t v3 = (unsigned __int16)*result;
    do
    {
      uint64_t v4 = 0;
      int v5 = (unsigned __int16)a2[v2--];
      while (v3 != v4)
      {
        uint64_t v6 = v4 + 1;
        int v7 = (unsigned __int16)result[++v4];
        if (v7 == v5)
        {
          unint64_t v8 = v6 - 1;
          goto LABEL_8;
        }
      }
      unint64_t v8 = v3;
LABEL_8:
      if (v3 <= 6 && v8 >= v3)
      {
        *CFDataRef result = ++v3;
        result[v3] = v5;
      }
    }
    while (v2);
  }
  return result;
}

void SLElementNames::~SLElementNames(SLElementNames *this)
{
}

void SLElementNames::Create(SLElementNames *this, const __CFLocale *a2)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFEqual(Value, @"en"))
  {
    SLCreateElementNamesEng();
  }
  SLElementNames::Create();
}

const char *SLElementNames::PhonName(SLElementNames *this, int a2)
{
  uint64_t v2 = "Stress1";
  if (!a2) {
    uint64_t v2 = "SIL";
  }
  if (a2 == 255) {
    return "None";
  }
  else {
    return v2;
  }
}

const char *SLElementNames::PhonText(SLElementNames *this, int a2)
{
  uint64_t v2 = "1";
  if (!a2) {
    uint64_t v2 = "%";
  }
  if (a2 == 255) {
    return "???";
  }
  else {
    return v2;
  }
}

const char *SLElementNames::POSName(SLElementNames *this, int a2)
{
  if (a2) {
    return "Undef";
  }
  else {
    return "Noun";
  }
}

const char *SLElementNames::TagName(SLElementNames *this, int a2)
{
  if ((a2 - 154) >= 0xFFFFFFA6) {
    return SLTag::sName[a2 - 64];
  }
  else {
    return "";
  }
}

char *SLElementNames::BndName(SLElementNames *this, int a2)
{
  return SLBnd::sName[a2];
}

uint64_t SLElementNames::EmphName(SLElementNames *this, unsigned int a2)
{
  return *((void *)&SLEmph::sName + a2);
}

void SLCFStringTextSource::SLCFStringTextSource(SLCFStringTextSource *this, const __CFString *a2)
{
  *(void *)this = &unk_26D52B360;
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = CFStringCreateCopy(0, a2);
  *((_WORD *)this + 144) = 0;
}

{
  *(void *)this = &unk_26D52B360;
  *((unsigned char *)this + 8) = 1;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = CFStringCreateCopy(0, a2);
  *((_WORD *)this + 144) = 0;
}

uint64_t SLCFStringTextSource::CreateMoreText(SLCFStringTextSource *this)
{
  return 0;
}

void SLCFStringTextSource::~SLCFStringTextSource(SLCFStringTextSource *this)
{
  *(void *)this = &unk_26D52B360;
  unsigned __int8 v1 = (const void *)*((void *)this + 3);
  if (v1) {
    CFRelease(v1);
  }
}

{
  uint64_t vars8;

  SLCFStringTextSource::~SLCFStringTextSource(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLCFStringTextSource::Refill(SLCFStringTextSource *this, char **a2, unsigned __int16 **a3, const unsigned __int16 *a4)
{
  unint64_t v8 = *a2;
  if (v8)
  {
    int64_t v9 = (char *)*a3 - v8;
    if (v9 <= -2) {
      SLCFStringTextSource::Refill();
    }
    uint64_t v10 = v9 >> 1;
    __int16 v23 = v8;
    memmove((char *)this + 32, v8, v9);
  }
  else
  {
    __int16 v23 = (char *)this + 32;
    if (*((unsigned char *)this + 8))
    {
      *((_WORD *)this + 16) = 10;
      *((unsigned char *)this + 8) = 0;
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  uint64_t v11 = (unsigned __int16 *)((char *)this + 32);
  uint64_t v12 = (unsigned __int16 *)((char *)this + 2 * v10 + 32);
  *a2 = (char *)this + 32;
  *a3 = v12;
  CFStringRef v13 = (const __CFString *)*((void *)this + 3);
  if (!v13)
  {
    *((unsigned char *)this + 8) = 0;
    CFStringRef v13 = (const __CFString *)(*(uint64_t (**)(SLCFStringTextSource *))(*(void *)this + 24))(this);
    *((void *)this + 3) = v13;
  }
  BOOL v14 = v10 < 128;
  if (v13 && v10 <= 127)
  {
    do
    {
      CFIndex Length = CFStringGetLength(v13);
      v16.CFIndex location = *((void *)this + 2);
      if (Length - v16.location >= 128 - v10) {
        CFIndex v17 = 128 - v10;
      }
      else {
        CFIndex v17 = Length - v16.location;
      }
      if (v17)
      {
        v16.CFIndex length = v17;
        CFStringGetCharacters(*((CFStringRef *)this + 3), v16, &v11[v10]);
        v10 += v17;
        unint64_t v18 = &v11[v10];
        *a3 = v18;
        *((void *)this + 2) += v17;
      }
      else
      {
        unint64_t v18 = *a3;
      }
      CFStringRef v13 = (const __CFString *)*((void *)this + 3);
      if (v18 < (unsigned __int16 *)this + 144)
      {
        CFRelease(v13);
        *((unsigned char *)this + 8) = 0;
        CFStringRef v13 = (const __CFString *)(*(uint64_t (**)(SLCFStringTextSource *))(*(void *)this + 24))(this);
        *((void *)this + 2) = 0;
        *((void *)this + 3) = v13;
      }
      BOOL v14 = v10 < 128;
    }
    while (v13 && v10 < 128);
  }
  for (uint64_t i = *a3; v11 < i; ++v11)
  {
    int v20 = *v11;
    if ((v20 | 0x10) == 0x10)
    {
      if (v11 >= v12)
      {
        unsigned __int16 *v11 = 32;
      }
      else if (v11 == i - 1 && !*v11)
      {
        *a3 = v11;
        uint64_t i = v11;
      }
      continue;
    }
    if (v20 == *a4)
    {
      if (!a4[1])
      {
        unint64_t v21 = v11;
        goto LABEL_35;
      }
      unint64_t v21 = v11 + 1;
      if (v11 + 1 == (unsigned __int16 *)((char *)this + 288))
      {
        *a3 = --i;
        --*((void *)this + 2);
        break;
      }
      if (v21 == i) {
        break;
      }
      if (*v21 == a4[1])
      {
        *v11++ = 32;
LABEL_35:
        *unint64_t v21 = 16;
        a4 = (const unsigned __int16 *)&SLLexerInstance::sNoDelim;
      }
    }
  }
  if (*((void *)this + 3)) {
    BOOL v14 = 0;
  }
  if (v14)
  {
    unsigned __int16 *i = 0;
    *a3 = i + 1;
  }
  return (v23 - *a2) >> 1;
}

void SLTokenTextSource::SLTokenTextSource(SLTokenTextSource *this, SLToken *a2)
{
  *(void *)this = &unk_26D52B390;
  *((void *)this + 1) = a2;
}

{
  *(void *)this = &unk_26D52B390;
  *((void *)this + 1) = a2;
}

uint64_t SLTokenTextSource::Refill(SLTokenTextSource *this, unsigned __int16 **a2, unsigned __int16 **a3, const unsigned __int16 *a4)
{
  uint64_t v4 = *(unsigned __int16 **)(*((void *)this + 1) + 56);
  *a2 = v4;
  *a3 = (unsigned __int16 *)((char *)v4
                           + *(void *)(*((void *)this + 1) + 64)
                           - *(void *)(*((void *)this + 1) + 56));
  return 0;
}

void SLLexerInstance::SLLexerInstance(SLLexerInstance *this, SLTextSource *a2, int a3)
{
  *(void *)this = &unk_26D52B3B8;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 4) = a3;
  *((void *)this + 3) = 0;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *((void *)this + 9) = &SLLexerInstance::sNoDelim;
  *((_WORD *)this + 44) = 256;
}

uint64_t SLLexerInstance::Refill(SLLexerInstance *this)
{
  uint64_t v2 = (uint64_t *)((char *)this + 64);
  uint64_t result = (***((uint64_t (****)(void, char *, char *, void))this + 1))(*((void *)this + 1), (char *)this + 64, (char *)this + 40, *((void *)this + 9));
  uint64_t v4 = *((void *)this + 3);
  if (v4)
  {
    uint64_t v5 = v4 - 2 * result;
    uint64_t v6 = *((void *)this + 7) - 2 * result;
    *((void *)this + 6) -= 2 * result;
    *((void *)this + 7) = v6;
    *((_DWORD *)this + 4) += result;
    uint64_t v7 = *((void *)this + 8);
  }
  else
  {
    uint64_t v7 = *v2;
    uint64_t v5 = *v2;
  }
  *((void *)this + 3) = v5;
  *((void *)this + 4) = v7;
  return result;
}

void SLLexerInstance::CreateToken(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 64);
  if ((*(_DWORD *)(this + 16) & 0x80000000) != 0 && v1 == *(void *)(this + 32)) {
    *(void *)(this + 64) = v1 + 2;
  }
  SLLexerInstance::CreateToken<unsigned short>(this);
}

void SLLexerInstance::CreateToken(SLLexerInstance *this, unsigned __int8 a2, unsigned int a3, const char *__s)
{
  strlen(__s);
  SLLexerInstance::CreateToken<char>((uint64_t)this);
}

void SLLexerInstance::CreateToken<char>(uint64_t a1)
{
  *(unsigned char *)(a1 + 89) = 0;
  uint64_t v1 = *(_WORD **)(a1 + 24);
  unsigned int v2 = (unsigned __int16)(SLChar::sLexFold[*v1 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v1 >> 6] << 6)]
                        + *v1);
  BOOL v4 = v2 <= 0x20
    && ((1 << (LOBYTE(SLChar::sLexFold[*v1 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v1 >> 6] << 6)])
               + *(unsigned char *)v1)) & 0x100002601) != 0
    || v2 == 8239;
  if (v4 || v2 == 160)
  {
    *(unsigned char *)(a1 + 89) = 1;
    __int16 v5 = 32;
  }
  else
  {
    __int16 v5 = *(v1 - 1);
  }
  *(_WORD *)(a1 + 90) = v5;
  operator new();
}

void sub_222A5117C(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLLexerInstance::CreateToken(SLLexerInstance *this)
{
}

void SLLexerInstance::CreateToken<unsigned short>(uint64_t a1)
{
  *(unsigned char *)(a1 + 89) = 0;
  uint64_t v1 = *(_WORD **)(a1 + 24);
  unsigned int v2 = (unsigned __int16)(SLChar::sLexFold[*v1 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v1 >> 6] << 6)]
                        + *v1);
  BOOL v4 = v2 <= 0x20
    && ((1 << (LOBYTE(SLChar::sLexFold[*v1 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v1 >> 6] << 6)])
               + *(unsigned char *)v1)) & 0x100002601) != 0
    || v2 == 8239;
  if (v4 || v2 == 160)
  {
    *(unsigned char *)(a1 + 89) = 1;
    __int16 v5 = 32;
  }
  else
  {
    __int16 v5 = *(v1 - 1);
  }
  *(_WORD *)(a1 + 90) = v5;
  operator new();
}

void sub_222A513BC(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLLexerInstance::CreateCommandToken(SLLexerInstance *this)
{
}

void SLLexerImpl::CreateBehaviorToken(SLLexerImpl *this)
{
}

double SLLexerImpl::SLLexerImpl(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 16) = -1;
  *(void *)(a1 + 24) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(void *)(a1 + 72) = &SLLexerInstance::sNoDelim;
  *(_WORD *)(a1 + 88) = 256;
  *(void *)a1 = &unk_26D52B408;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 92) = 0;
  *(void *)(a1 + 112) = 0;
  *(unsigned char *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = a3;
  return result;
}

void SLLexerImpl::~SLLexerImpl(SLLexerImpl *this)
{
  *(void *)this = &unk_26D52B408;
  unsigned int v2 = (const void *)*((void *)this + 14);
  if (v2) {
    _Block_release(v2);
  }
  uint64_t v3 = *((void *)this + 16);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
}

{
  uint64_t vars8;

  SLLexerImpl::~SLLexerImpl(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLLexerImpl::SetDelim(SLLexerImpl *this, const unsigned __int16 *a2)
{
  *((void *)this + 10) = *(void *)a2;
  uint64_t result = (uint64_t)this + 80;
  *(void *)(result - 8) = result;
  return result;
}

void *SLLexerImpl::SetErrorHandler(uint64_t a1, void *aBlock)
{
  BOOL v4 = *(const void **)(a1 + 112);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t result = _Block_copy(aBlock);
  *(void *)(a1 + 112) = result;
  return result;
}

uint64_t SLLexerImpl::Error(SLLexerImpl *this)
{
  uint64_t result = *((void *)this + 14);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, ((*((void *)this + 3) + 2 * *((int *)this + 4) - *((void *)this + 4)) >> 1) - 1);
  }
  return result;
}

unsigned __int16 *SLLexerImpl::SpaceDelimitedToken(SLLexerImpl *this, unsigned __int16 *a2, unsigned __int16 *a3, unsigned int *a4)
{
  uint64_t result = a2;
  for (*a4 = 0; result < a3; ++result)
  {
    unsigned int v5 = *result;
    if (v5 > 0x9F)
    {
      if (v5 != 8239 && v5 != 160) {
        break;
      }
    }
    else if (v5 != 9 && v5 != 32)
    {
      break;
    }
  }
  if (result < a3)
  {
    unsigned int v6 = 1;
    uint64_t v7 = result;
    do
    {
      unsigned int v8 = *v7;
      if (v8 > 0x9F)
      {
        if (v8 == 160 || v8 == 8239) {
          return result;
        }
      }
      else if (v8 == 9 || v8 == 32)
      {
        return result;
      }
      ++v7;
      *a4 = v6++;
    }
    while (v7 < a3);
  }
  return result;
}

void SLLexerBuffer::SLLexerBuffer(SLLexerBuffer *this, SLLexer *a2, char a3)
{
  *(void *)this = &unk_26D52B458;
  *((void *)this + 1) = a2;
  *((unsigned char *)this + 16) = a3;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
}

{
  *(void *)this = &unk_26D52B458;
  *((void *)this + 1) = a2;
  *((unsigned char *)this + 16) = a3;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
}

void SLLexerBuffer::~SLLexerBuffer(SLLexerBuffer *this)
{
  *(void *)this = &unk_26D52B458;
  if (*((unsigned char *)this + 16))
  {
    uint64_t v2 = *((void *)this + 1);
    if (v2) {
      (*(void (**)(uint64_t))(*(void *)v2 + 56))(v2);
    }
  }
  while (1)
  {
    uint64_t v3 = *((void *)this + 8);
    if (!v3) {
      break;
    }
    BOOL v4 = *(SLToken **)(*(void *)(*((void *)this + 4) + ((*((void *)this + 7) >> 6) & 0x3FFFFFFFFFFFFF8))
                     + 8 * (*((void *)this + 7) & 0x1FFLL));
    ++*((void *)this + 7);
    *((void *)this + 8) = v3 - 1;
    std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 24, 1);
    if (v4)
    {
      SLToken::~SLToken(v4);
      MEMORY[0x223CA4030]();
    }
  }
  std::deque<SLToken *>::~deque[abi:ne180100]((void *)this + 3);
}

{
  uint64_t vars8;

  SLLexerBuffer::~SLLexerBuffer(this);
  JUMPOUT(0x223CA4030);
}

void *SLLexerBuffer::push_front(SLLexerBuffer *this, const SLTokenList *a2)
{
  uint64_t v3 = *((void *)this + 4);
  BOOL v4 = (char *)(v3 + 8 * (*((void *)this + 7) >> 9));
  if (*((void *)this + 5) == v3) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)v4 + 8 * (*((void *)this + 7) & 0x1FFLL);
  }
  unsigned int v6 = (const SLTokenList *)*((void *)a2 + 1);
  if (v6 == a2)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v7 = 0;
    unsigned int v8 = (const SLTokenList *)*((void *)a2 + 1);
    do
    {
      ++v7;
      unsigned int v8 = (const SLTokenList *)*((void *)v8 + 1);
    }
    while (v8 != a2);
  }
  return std::deque<SLToken *>::__insert_bidirectional[abi:ne180100]<std::__list_const_iterator<SLToken *,void *>>((uint64_t)this + 24, v4, v5, v6, a2, v7);
}

uint64_t (***SLLexerBuffer::operator[](void *a1, unint64_t a2))(void)
{
  if (a1[8] > a2) {
    return *(uint64_t (****)(void))(*(void *)(a1[4] + (((a1[7] + a2) >> 6) & 0x3FFFFFFFFFFFFF8))
  }
                                              + 8 * ((a1[7] + a2) & 0x1FF));
  while (1)
  {
    uint64_t result = (uint64_t (***)(void))a1[1];
    if (!result) {
      break;
    }
    uint64_t v6 = 0;
    uint64_t v6 = (**result)(result);
    if (v6)
    {
      std::deque<SLToken *>::push_back(a1 + 3, &v6);
    }
    else
    {
      if (a1[8] != a2
        || a2
        && !*(void *)(*(void *)(a1[4] + (((a2 - 1 + a1[7]) >> 6) & 0x3FFFFFFFFFFFFF8))
                      + 8 * ((a2 - 1 + a1[7]) & 0x1FF)))
      {
        return 0;
      }
      uint64_t v5 = 0;
      std::deque<SLToken *>::push_back(a1 + 3, &v5);
    }
    if (a1[8] > a2) {
      return *(uint64_t (****)(void))(*(void *)(a1[4] + (((a1[7] + a2) >> 6) & 0x3FFFFFFFFFFFFF8))
    }
                                                + 8 * ((a1[7] + a2) & 0x1FF));
  }
  return result;
}

void std::deque<SLToken *>::push_back(void *a1, void *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 6) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<SLToken *>::__add_back_capacity(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }
  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

void SLLexer::Create(SLLexer *this, SLTextSource *a2, SLDictLookup *a3, SLPronouncer *a4, const __CFLocale *a5)
{
}

void SLTokenTextSource::~SLTokenTextSource(SLTokenTextSource *this)
{
}

uint64_t SLLexerImpl::LexerBehavior(SLLexerImpl *this)
{
  return *((unsigned int *)this + 23);
}

uint64_t SLLexerImpl::SetLexerBehavior(uint64_t this, int a2)
{
  *(_DWORD *)(this + 92) = a2;
  return this;
}

uint64_t SLLexerImpl::Delim(SLLexerImpl *this)
{
  return *((void *)this + 9);
}

uint64_t SLLexerChain::NextToken(SLLexerChain *this)
{
  return (***((uint64_t (****)(void))this + 2))(*((void *)this + 2));
}

uint64_t SLLexerChain::LexerBehavior(SLLexerChain *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 8))();
}

uint64_t SLLexerChain::SetLexerBehavior(SLLexerChain *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 16))();
}

uint64_t SLLexerChain::SetDelim(SLLexerChain *this, const unsigned __int16 *a2)
{
  return (*(uint64_t (**)(void, const unsigned __int16 *))(**((void **)this + 2) + 24))(*((void *)this + 2), a2);
}

uint64_t SLLexerChain::Delim(SLLexerChain *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 2) + 32))();
}

uint64_t SLLexerChain::SetErrorHandler(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40))();
}

void SLLexerChain::~SLLexerChain(SLLexerChain *this)
{
  *(void *)this = &unk_26D52B580;
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 56))(v1);
  }
}

{
  uint64_t v1;
  uint64_t vars8;

  *(void *)this = &unk_26D52B580;
  uint64_t v1 = *((void *)this + 1);
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 56))(v1);
  }
  JUMPOUT(0x223CA4030);
}

char *std::vector<unsigned short>::__assign_with_size[abi:ne180100]<unsigned short const*,unsigned short const*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  unint64_t v8 = *((void *)result + 2);
  int64_t v9 = *(char **)result;
  if (a4 > (uint64_t)(v8 - *(void *)result) >> 1)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      unint64_t v8 = 0;
      *uint64_t v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    if (v8 <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v8 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t result = std::vector<unsigned short>::__vallocate[abi:ne180100](v7, v11);
    CFStringRef v13 = (char *)v7[1];
    uint64_t v12 = (void **)(v7 + 1);
    int64_t v9 = v13;
LABEL_17:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      int64_t v19 = __src;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  uint64_t v12 = (void **)(result + 8);
  BOOL v14 = (unsigned char *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 1;
  if (v15 >= a4) {
    goto LABEL_17;
  }
  CFRange v16 = &__src[2 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    int64_t v9 = (char *)*v12;
  }
  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    int64_t v19 = v16;
LABEL_19:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }
LABEL_20:
  *uint64_t v12 = &v9[v17];
  return result;
}

char *std::vector<unsigned short>::__assign_with_size[abi:ne180100]<char const*,char const*>(void *a1, char *a2, char *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  unint64_t v8 = a1[2];
  uint64_t result = (char *)*a1;
  if (a4 <= (uint64_t)(v8 - (void)result) >> 1)
  {
    unint64_t v18 = (char *)a1[1];
    CFStringRef v13 = a1 + 1;
    uint64_t v12 = v18;
    unint64_t v19 = (v18 - result) >> 1;
    if (v19 >= a4)
    {
      if (a2 == a3)
      {
        uint64_t v25 = (uint64_t)result;
      }
      else
      {
        uint64_t v25 = (uint64_t)&result[2 * (void)a3 + -2 * (void)a2];
        CFDictionaryRef v26 = result;
        do
        {
          __int16 v27 = *v6++;
          *(_WORD *)CFDictionaryRef v26 = v27;
          v26 += 2;
        }
        while (v6 != a3);
      }
      size_t v17 = (char *)(v25 - (void)result);
      uint64_t v12 = result;
    }
    else
    {
      int v20 = &a2[v19];
      if (v12 != result)
      {
        do
        {
          __int16 v21 = *v6++;
          *(_WORD *)uint64_t result = v21;
          result += 2;
          --v19;
        }
        while (v19);
      }
      int64_t v22 = v12;
      if (v20 != a3)
      {
        __int16 v23 = v12;
        do
        {
          __int16 v24 = *v20++;
          *(_WORD *)__int16 v23 = v24;
          v23 += 2;
          v22 += 2;
        }
        while (v20 != a3);
      }
      size_t v17 = (char *)(v22 - v12);
    }
  }
  else
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      unint64_t v8 = 0;
      *a1 = 0;
      a1[1] = 0;
      a1[2] = 0;
    }
    if ((a4 & 0x8000000000000000) != 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    if (v8 <= a4) {
      unint64_t v10 = a4;
    }
    else {
      unint64_t v10 = v8;
    }
    if (v8 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v11 = v10;
    }
    uint64_t result = std::vector<unsigned short>::__vallocate[abi:ne180100](a1, v11);
    BOOL v14 = (char *)a1[1];
    CFStringRef v13 = a1 + 1;
    uint64_t v12 = v14;
    unint64_t v15 = v14;
    if (v6 != a3)
    {
      unint64_t v15 = v12;
      do
      {
        __int16 v16 = *v6++;
        *(_WORD *)unint64_t v15 = v16;
        v15 += 2;
      }
      while (v6 != a3);
    }
    size_t v17 = (char *)(v15 - v12);
  }
  void *v13 = &v17[(void)v12];
  return result;
}

uint64_t std::deque<SLToken *>::~deque[abi:ne180100](void *a1)
{
  uint64_t v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  a1[5] = 0;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      uint64_t v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 256;
  }
  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 512;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    uint64_t v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<SLToken **>::~__split_buffer((uint64_t)a1);
}

uint64_t std::__split_buffer<SLToken **>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  }
  unint64_t v4 = *(void **)a1;
  if (*(void *)a1) {
    operator delete(v4);
  }
  return a1;
}

void *std::deque<SLToken *>::__insert_bidirectional[abi:ne180100]<std::__list_const_iterator<SLToken *,void *>>(uint64_t a1, char *a2, uint64_t a3, void *a4, void *a5, unint64_t a6)
{
  unint64_t v6 = a6;
  unint64_t v10 = *(void *)(a1 + 32);
  unint64_t v11 = v10 >> 9;
  uint64_t v12 = *(void *)(a1 + 8);
  uint64_t v13 = *(void *)(a1 + 16);
  BOOL v14 = (char *)(v12 + 8 * (v10 >> 9));
  if (v13 == v12) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = *(void *)v14 + 8 * (*(void *)(a1 + 32) & 0x1FFLL);
  }
  if (a3 == v15) {
    unint64_t v16 = 0;
  }
  else {
    unint64_t v16 = ((a3 - *(void *)a2) >> 3) + ((a2 - v14) << 6) - ((v15 - *(void *)v14) >> 3);
  }
  uint64_t v17 = *(void *)(a1 + 40);
  if (v16 < v17 - v16)
  {
    if (a6 > v10)
    {
      std::deque<SLToken *>::__add_front_capacity((void **)a1, a6 - v10);
      unint64_t v10 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 8);
      uint64_t v13 = *(void *)(a1 + 16);
      unint64_t v11 = v10 >> 9;
    }
    unint64_t v18 = (void *)(v12 + 8 * v11);
    if (v13 == v12) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = *v18 + 8 * (v10 & 0x1FF);
    }
    v74.n128_u64[0] = v12 + 8 * v11;
    v74.n128_u64[1] = v19;
    unint64_t v25 = v16 - v6;
    if (v16 >= v6)
    {
      __int16 v27 = a4;
      if (!v6) {
        goto LABEL_108;
      }
      goto LABEL_93;
    }
    if (v16 >= v6 >> 1)
    {
      unint64_t v32 = v6 - v16;
      if ((uint64_t)(v6 - v16) < 0)
      {
        __int16 v27 = a4;
        do
        {
          __int16 v27 = (void *)*v27;
          --v25;
        }
        while (v25);
      }
      else
      {
        if (!v32) {
          goto LABEL_91;
        }
        unint64_t v33 = v32 + 1;
        __int16 v27 = a4;
        do
        {
          __int16 v27 = (void *)v27[1];
          --v33;
        }
        while (v33 > 1);
      }
    }
    else if ((uint64_t)v16 < 1)
    {
      if (v16)
      {
        unint64_t v34 = 1 - v16;
        __int16 v27 = a5;
        do
        {
          __int16 v27 = (void *)v27[1];
          --v34;
        }
        while (v34 > 1);
      }
      else
      {
        __int16 v27 = a5;
      }
    }
    else
    {
      unint64_t v26 = v16;
      __int16 v27 = a5;
      do
      {
        __int16 v27 = (void *)*v27;
        --v26;
      }
      while (v26);
    }
    if (v27 != a4)
    {
      uint64_t v53 = *(void *)(a1 + 40);
      long long v54 = v27;
      do
      {
        if (v19 == *v18)
        {
          uint64_t v55 = *--v18;
          uint64_t v19 = v55 + 4096;
        }
        long long v54 = (void *)*v54;
        *(void *)(v19 - 8) = v54[2];
        v19 -= 8;
        --v10;
        ++v53;
      }
      while (v54 != a4);
      *(void *)(a1 + 32) = v10;
      *(void *)(a1 + 40) = v53;
LABEL_92:
      unint64_t v6 = v16;
      if (!v16) {
        goto LABEL_108;
      }
LABEL_93:
      unint64_t v56 = (char **)std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator+[abi:ne180100]((uint64_t)&v74, v6);
      char v58 = v56;
      unint64_t v59 = v57;
      unint64_t v60 = (void *)v74.n128_u64[1];
      if ((char *)v74.n128_u64[1] != v57)
      {
        int64x2_t v61 = *(int64x2_t *)(a1 + 32);
        BOOL v62 = v56;
        uint64_t v63 = v57;
        do
        {
          if (v19 == *v18)
          {
            uint64_t v64 = *--v18;
            uint64_t v19 = v64 + 4096;
          }
          if (v63 == *v62)
          {
            uint64_t v65 = (uint64_t)*--v62;
            uint64_t v63 = (char *)(v65 + 4096);
          }
          uint64_t v66 = *((void *)v63 - 1);
          v63 -= 8;
          *(void *)(v19 - 8) = v66;
          v19 -= 8;
          int64x2_t v61 = vaddq_s64(v61, (int64x2_t)xmmword_222ABEEC0);
          unint64_t v60 = (void *)v74.n128_u64[1];
        }
        while (v63 != (char *)v74.n128_u64[1]);
        *(int64x2_t *)(a1 + 32) = v61;
      }
      if (v6 >= v16)
      {
        CFIndex v69 = (void *)v74.n128_u64[0];
      }
      else
      {
        uint64_t v67 = (char **)std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator+[abi:ne180100]((uint64_t)&v74, v16);
        __n128 v75 = v74;
        std::__for_each_segment[abi:ne180100]<std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>>>(v58, v59, v67, v68, (uint64_t)&v75);
        unint64_t v60 = (void *)v75.n128_u64[1];
        CFIndex v69 = (void *)v75.n128_u64[0];
        __n128 v74 = v75;
      }
      while (v27 != a5)
      {
        *v60++ = v27[2];
        if ((void *)((char *)v60 - *v69) == (void *)4096)
        {
          unint64_t v70 = (void *)v69[1];
          ++v69;
          unint64_t v60 = v70;
        }
        __int16 v27 = (void *)v27[1];
      }
      goto LABEL_108;
    }
LABEL_91:
    __int16 v27 = a4;
    goto LABEL_92;
  }
  uint64_t v20 = ((v13 - v12) << 6) - 1;
  if (v13 == v12) {
    uint64_t v20 = 0;
  }
  unint64_t v21 = v10 + v17;
  unint64_t v22 = v20 - v21;
  if (a6 > v22)
  {
    std::deque<SLToken *>::__add_back_capacity((void *)a1, a6 - v22);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 8);
    uint64_t v13 = *(void *)(a1 + 16);
    unint64_t v21 = *(void *)(a1 + 32) + v17;
  }
  __int16 v23 = (void *)(v12 + 8 * (v21 >> 9));
  if (v13 == v12) {
    __int16 v24 = 0;
  }
  else {
    __int16 v24 = (void *)(*v23 + 8 * (v21 & 0x1FF));
  }
  v74.n128_u64[0] = v12 + 8 * (v21 >> 9);
  v74.n128_u64[1] = (unint64_t)v24;
  unint64_t v28 = v17 - v16;
  uint64_t v29 = v6 - (v17 - v16);
  if (v6 <= v17 - v16)
  {
    uint64_t v31 = a5;
    if (!v6) {
      goto LABEL_108;
    }
    goto LABEL_68;
  }
  if (v28 >= v6 >> 1)
  {
    if (v29 < 1)
    {
      unint64_t v36 = v28 - v6 + 1;
      uint64_t v31 = a5;
      do
      {
        uint64_t v31 = (void *)v31[1];
        --v36;
      }
      while (v36 > 1);
    }
    else
    {
      uint64_t v31 = a5;
      do
      {
        uint64_t v31 = (void *)*v31;
        --v29;
      }
      while (v29);
    }
  }
  else if ((v28 & 0x8000000000000000) != 0)
  {
    uint64_t v35 = v16 - v17;
    uint64_t v31 = a4;
    do
    {
      uint64_t v31 = (void *)*v31;
      --v35;
    }
    while (v35);
  }
  else if (v28)
  {
    unint64_t v30 = v28 + 1;
    uint64_t v31 = a4;
    do
    {
      uint64_t v31 = (void *)v31[1];
      --v30;
    }
    while (v30 > 1);
  }
  else
  {
    uint64_t v31 = a4;
  }
  if (v31 == a5)
  {
    uint64_t v31 = a5;
  }
  else
  {
    uint64_t v37 = v31;
    do
    {
      *v24++ = v37[2];
      if ((void *)((char *)v24 - *v23) == (void *)4096)
      {
        int v38 = (void *)v23[1];
        ++v23;
        __int16 v24 = v38;
      }
      uint64_t v37 = (void *)v37[1];
      ++v17;
    }
    while (v37 != a5);
    *(void *)(a1 + 40) = v17;
  }
  unint64_t v6 = v28;
  if (v28)
  {
LABEL_68:
    long long v39 = (char **)std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator-[abi:ne180100]((uint64_t)&v74, v6);
    long long v41 = v39;
    unint64_t v42 = v40;
    unint64_t v43 = v74.n128_u64[1];
    if ((char *)v74.n128_u64[1] != v40)
    {
      uint64_t v44 = *(void *)(a1 + 40);
      long long v45 = v39;
      unint64_t v46 = v40;
      do
      {
        *v24++ = *(void *)v46;
        if ((void *)((char *)v24 - *v23) == (void *)4096)
        {
          long long v47 = (void *)v23[1];
          ++v23;
          __int16 v24 = v47;
        }
        v46 += 8;
        if (v46 - *v45 == 4096)
        {
          uint64_t v48 = v45[1];
          ++v45;
          unint64_t v46 = v48;
        }
        ++v44;
        unint64_t v43 = v74.n128_u64[1];
      }
      while (v46 != (char *)v74.n128_u64[1]);
      *(void *)(a1 + 40) = v44;
    }
    if (v6 < v28)
    {
      uint64_t v49 = (char **)std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator-[abi:ne180100]((uint64_t)&v74, v28);
      std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>(v49, v50, v41, v42, v74.n128_u64[0], (char *)v74.n128_u64[1], &v75);
      unint64_t v43 = v76.n128_u64[1];
      __n128 v74 = v76;
    }
    if (v31 != a4)
    {
      uint64_t v51 = (void *)v74.n128_u64[0];
      do
      {
        if (v43 == *v51)
        {
          uint64_t v52 = *--v51;
          unint64_t v43 = v52 + 4096;
        }
        uint64_t v31 = (void *)*v31;
        *(void *)(v43 - 8) = v31[2];
        v43 -= 8;
      }
      while (v31 != a4);
    }
  }
LABEL_108:
  uint64_t v71 = *(void *)(a1 + 8);
  if (*(void *)(a1 + 16) == v71) {
    uint64_t v72 = 0;
  }
  else {
    uint64_t v72 = *(void *)(v71 + 8 * (*(void *)(a1 + 32) >> 9)) + 8 * (*(void *)(a1 + 32) & 0x1FFLL);
  }
  v75.n128_u64[0] = v71 + 8 * (*(void *)(a1 + 32) >> 9);
  v75.n128_u64[1] = v72;
  return std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator+[abi:ne180100]((uint64_t)&v75, v16);
}

void std::deque<SLToken *>::__add_front_capacity(void **a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = a1[2];
  uint64_t v5 = v4 - v3;
  if (v4 == v3) {
    unint64_t v6 = a2 + 1;
  }
  else {
    unint64_t v6 = a2;
  }
  if (v4 == v3) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = ((v4 - v3) << 6) - 1;
  }
  if ((v6 & 0x1FF) != 0) {
    unint64_t v8 = (v6 >> 9) + 1;
  }
  else {
    unint64_t v8 = v6 >> 9;
  }
  uint64_t v9 = (uint64_t)a1[4];
  unint64_t v10 = v7 - ((void)a1[5] + v9);
  if (v8 >= v10 >> 9) {
    unint64_t v11 = v10 >> 9;
  }
  else {
    unint64_t v11 = v8;
  }
  if (v8 <= v10 >> 9)
  {
    for (a1[4] = (void *)(v9 + (v11 << 9)); v11; --v11)
    {
      uint64_t v19 = (void **)a1[2];
      __p[0] = *(v19 - 1);
      a1[2] = v19 - 1;
      std::__split_buffer<SLToken **>::push_front((uint64_t)a1, __p);
    }
  }
  else
  {
    uint64_t v12 = (uint64_t)(a1 + 3);
    unint64_t v13 = v8 - v11;
    uint64_t v14 = (unsigned char *)a1[3] - (unsigned char *)*a1;
    if (v8 - v11 <= (v14 >> 3) - (v5 >> 3))
    {
      if (v13)
      {
        if (v3 == *a1)
        {
LABEL_30:
          unint64_t v22 = v13;
          do
          {
            __p[0] = operator new(0x1000uLL);
            std::__split_buffer<SLToken **>::push_back(a1, __p);
            --v22;
          }
          while (v22);
          v11 += v13;
          uint64_t v9 = (uint64_t)a1[4];
        }
        else
        {
          while (1)
          {
            __p[0] = operator new(0x1000uLL);
            std::__split_buffer<SLToken **>::push_front((uint64_t)a1, __p);
            uint64_t v20 = a1[1];
            uint64_t v21 = (unsigned char *)a1[2] - v20 == 8 ? 511 : 512;
            uint64_t v9 = (uint64_t)a1[4] + v21;
            a1[4] = (void *)v9;
            if (!--v13) {
              break;
            }
            if (v20 == *a1) {
              goto LABEL_30;
            }
          }
        }
      }
      for (a1[4] = (void *)(v9 + (v11 << 9)); v11; --v11)
      {
        __int16 v23 = (void **)a1[2];
        __p[0] = *(v23 - 1);
        a1[2] = v23 - 1;
        std::__split_buffer<SLToken **>::push_front((uint64_t)a1, __p);
      }
    }
    else
    {
      BOOL v15 = v4 == v3;
      unint64_t v16 = v8 << 9;
      if (v14 >> 2 <= v13 + (v5 >> 3)) {
        unint64_t v17 = v13 + (v5 >> 3);
      }
      else {
        unint64_t v17 = v14 >> 2;
      }
      unint64_t v70 = a1 + 3;
      if (v17) {
        unint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(v12, v17);
      }
      else {
        unint64_t v18 = 0;
      }
      unint64_t v24 = v16 - v15;
      __p[0] = v18;
      __p[1] = v18;
      long long v68 = v18;
      CFIndex v69 = &v18[8 * v17];
      do
      {
        uint64_t v66 = operator new(0x1000uLL);
        std::__split_buffer<SLToken **>::push_back(__p, &v66);
        --v13;
      }
      while (v13);
      unint64_t v25 = (char *)a1[2];
      for (uint64_t i = v68; v11; --v11)
      {
        if (i == v69)
        {
          int64_t v27 = (char *)__p[1] - (char *)__p[0];
          if (__p[1] <= __p[0])
          {
            if (i == __p[0]) {
              unint64_t v35 = 1;
            }
            else {
              unint64_t v35 = (i - (char *)__p[0]) >> 2;
            }
            unint64_t v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)v70, v35);
            int v38 = (uint64_t *)__p[1];
            uint64_t i = &v36[8 * (v35 >> 2)];
            uint64_t v39 = v68 - (char *)__p[1];
            if (v68 != __p[1])
            {
              uint64_t i = &v36[8 * (v35 >> 2) + (v39 & 0xFFFFFFFFFFFFFFF8)];
              uint64_t v40 = 8 * (v39 >> 3);
              long long v41 = &v36[8 * (v35 >> 2)];
              do
              {
                uint64_t v42 = *v38++;
                *(void *)long long v41 = v42;
                v41 += 8;
                v40 -= 8;
              }
              while (v40);
            }
            unint64_t v43 = __p[0];
            __p[0] = v36;
            __p[1] = &v36[8 * (v35 >> 2)];
            long long v68 = i;
            CFIndex v69 = &v36[8 * v37];
            if (v43)
            {
              operator delete(v43);
              uint64_t i = v68;
            }
          }
          else
          {
            uint64_t v28 = v27 >> 3;
            BOOL v29 = v27 >> 3 < -1;
            uint64_t v30 = (v27 >> 3) + 2;
            if (v29) {
              uint64_t v31 = v30;
            }
            else {
              uint64_t v31 = v28 + 1;
            }
            unint64_t v32 = (char *)__p[1] - 8 * (v31 >> 1);
            int64_t v33 = i - (char *)__p[1];
            if (i != __p[1])
            {
              memmove((char *)__p[1] - 8 * (v31 >> 1), __p[1], i - (char *)__p[1]);
              uint64_t i = (char *)__p[1];
            }
            unint64_t v34 = &i[-8 * (v31 >> 1)];
            uint64_t i = &v32[v33];
            __p[1] = v34;
            long long v68 = &v32[v33];
          }
        }
        *(void *)uint64_t i = *((void *)v25 - 1);
        uint64_t i = v68 + 8;
        v68 += 8;
        unint64_t v25 = (char *)a1[2] - 8;
        a1[2] = v25;
      }
      uint64_t v44 = (char *)a1[1];
      if (v44 == v25)
      {
        uint64_t v44 = v25;
      }
      else
      {
        do
        {
          if (i == v69)
          {
            int64_t v45 = (char *)__p[1] - (char *)__p[0];
            if (__p[1] <= __p[0])
            {
              if (i == __p[0]) {
                unint64_t v52 = 1;
              }
              else {
                unint64_t v52 = (i - (char *)__p[0]) >> 2;
              }
              uint64_t v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)v70, v52);
              uint64_t v55 = (uint64_t *)__p[1];
              uint64_t i = &v53[8 * (v52 >> 2)];
              uint64_t v56 = v68 - (char *)__p[1];
              if (v68 != __p[1])
              {
                uint64_t i = &v53[8 * (v52 >> 2) + (v56 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v57 = 8 * (v56 >> 3);
                char v58 = &v53[8 * (v52 >> 2)];
                do
                {
                  uint64_t v59 = *v55++;
                  *(void *)char v58 = v59;
                  v58 += 8;
                  v57 -= 8;
                }
                while (v57);
              }
              unint64_t v60 = __p[0];
              __p[0] = v53;
              __p[1] = &v53[8 * (v52 >> 2)];
              long long v68 = i;
              CFIndex v69 = &v53[8 * v54];
              if (v60)
              {
                operator delete(v60);
                uint64_t i = v68;
              }
            }
            else
            {
              uint64_t v46 = v45 >> 3;
              BOOL v29 = v45 >> 3 < -1;
              uint64_t v47 = (v45 >> 3) + 2;
              if (v29) {
                uint64_t v48 = v47;
              }
              else {
                uint64_t v48 = v46 + 1;
              }
              uint64_t v49 = (char *)__p[1] - 8 * (v48 >> 1);
              int64_t v50 = i - (char *)__p[1];
              if (i != __p[1])
              {
                memmove((char *)__p[1] - 8 * (v48 >> 1), __p[1], i - (char *)__p[1]);
                uint64_t i = (char *)__p[1];
              }
              uint64_t v51 = &i[-8 * (v48 >> 1)];
              uint64_t i = &v49[v50];
              __p[1] = v51;
              long long v68 = &v49[v50];
            }
          }
          uint64_t v61 = *(void *)v44;
          v44 += 8;
          *(void *)uint64_t i = v61;
          uint64_t i = v68 + 8;
          v68 += 8;
        }
        while (v44 != a1[2]);
        unint64_t v25 = (char *)a1[1];
      }
      BOOL v62 = v69;
      uint64_t v63 = (char *)a1[3];
      uint64_t v64 = (char *)a1[4];
      a1[2] = i;
      a1[3] = v62;
      uint64_t v65 = *a1;
      *(_OWORD *)a1 = *(_OWORD *)__p;
      __p[0] = v65;
      __p[1] = v25;
      long long v68 = v44;
      CFIndex v69 = v63;
      a1[4] = &v64[v24];
      if (v44 != v25) {
        long long v68 = &v44[(v25 - v44 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v65) {
        operator delete(v65);
      }
    }
  }
}

void sub_222A52A84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator+[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)a1;
  if (a2)
  {
    uint64_t v4 = a2 + ((uint64_t)(*(void *)(a1 + 8) - *result) >> 3);
    if (v4 < 1) {
      result -= (unint64_t)(511 - v4) >> 9;
    }
    else {
      result += (unint64_t)v4 >> 9;
    }
  }
  return result;
}

void std::deque<SLToken *>::__add_back_capacity(void *a1, unint64_t a2)
{
  uint64_t v3 = (char *)a1[2];
  uint64_t v4 = (uint64_t)&v3[-a1[1]];
  if (v4) {
    unint64_t v5 = a2;
  }
  else {
    unint64_t v5 = a2 + 1;
  }
  if ((v5 & 0x1FF) != 0) {
    unint64_t v6 = (v5 >> 9) + 1;
  }
  else {
    unint64_t v6 = v5 >> 9;
  }
  unint64_t v7 = a1[4];
  if (v6 >= v7 >> 9) {
    unint64_t v8 = v7 >> 9;
  }
  else {
    unint64_t v8 = v6;
  }
  if (v6 <= v7 >> 9)
  {
    for (a1[4] = v7 - (v8 << 9); v8; --v8)
    {
      unint64_t v16 = (void *)a1[1];
      uint64_t v19 = *v16;
      unint64_t v17 = (char *)(v16 + 1);
      uint64_t v18 = v19;
      a1[1] = v17;
      if (v3 == (char *)a1[3])
      {
        uint64_t v20 = (uint64_t)&v17[-*a1];
        if ((unint64_t)v17 <= *a1)
        {
          if (v3 == (char *)*a1) {
            unint64_t v28 = 1;
          }
          else {
            unint64_t v28 = (uint64_t)&v3[-*a1] >> 2;
          }
          BOOL v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)(a1 + 3), v28);
          uint64_t v31 = &v29[8 * (v28 >> 2)];
          unint64_t v32 = (uint64_t *)a1[1];
          uint64_t v3 = v31;
          uint64_t v33 = a1[2] - (void)v32;
          if (v33)
          {
            uint64_t v3 = &v31[v33 & 0xFFFFFFFFFFFFFFF8];
            uint64_t v34 = 8 * (v33 >> 3);
            unint64_t v35 = &v29[8 * (v28 >> 2)];
            do
            {
              uint64_t v36 = *v32++;
              *(void *)unint64_t v35 = v36;
              v35 += 8;
              v34 -= 8;
            }
            while (v34);
          }
          uint64_t v37 = (char *)*a1;
          *a1 = v29;
          a1[1] = v31;
          a1[2] = v3;
          a1[3] = &v29[8 * v30];
          if (v37)
          {
            operator delete(v37);
            uint64_t v3 = (char *)a1[2];
          }
        }
        else
        {
          uint64_t v21 = v20 >> 3;
          BOOL v22 = v20 >> 3 < -1;
          uint64_t v23 = (v20 >> 3) + 2;
          if (v22) {
            uint64_t v24 = v23;
          }
          else {
            uint64_t v24 = v21 + 1;
          }
          unint64_t v25 = &v17[-8 * (v24 >> 1)];
          int64_t v26 = v3 - v17;
          if (v3 != v17)
          {
            memmove(&v17[-8 * (v24 >> 1)], v17, v3 - v17);
            uint64_t v3 = (char *)a1[1];
          }
          int64_t v27 = &v3[-8 * (v24 >> 1)];
          uint64_t v3 = &v25[v26];
          a1[1] = v27;
          a1[2] = &v25[v26];
        }
      }
      *(void *)uint64_t v3 = v18;
      uint64_t v3 = (char *)(a1[2] + 8);
      a1[2] = v3;
    }
  }
  else
  {
    unint64_t v9 = v6 - v8;
    uint64_t v10 = a1[3] - *a1;
    if (v6 - v8 <= (v10 >> 3) - (v4 >> 3))
    {
      if (v9)
      {
        while (a1[3] != a1[2])
        {
          __p[0] = operator new(0x1000uLL);
          std::__split_buffer<SLToken **>::push_back(a1, __p);
          --v6;
          if (!--v9) {
            goto LABEL_75;
          }
        }
        for (uint64_t i = 0; i != v9; ++i)
        {
          __p[0] = operator new(0x1000uLL);
          std::__split_buffer<SLToken **>::push_front((uint64_t)a1, __p);
          if (a1[2] - a1[1] == 8) {
            uint64_t v64 = 511;
          }
          else {
            uint64_t v64 = 512;
          }
          uint64_t v65 = v64 + a1[4];
          a1[4] = v65;
        }
        unint64_t v8 = v6;
      }
      else
      {
LABEL_75:
        uint64_t v65 = a1[4];
      }
      a1[4] = v65 - (v8 << 9);
      if (v8)
      {
        uint64_t v66 = (char *)a1[2];
        do
        {
          uint64_t v67 = (void *)a1[1];
          uint64_t v70 = *v67;
          long long v68 = (char *)(v67 + 1);
          uint64_t v69 = v70;
          a1[1] = v68;
          if (v66 == (char *)a1[3])
          {
            uint64_t v71 = (uint64_t)&v68[-*a1];
            if ((unint64_t)v68 <= *a1)
            {
              if (v66 == (char *)*a1) {
                unint64_t v78 = 1;
              }
              else {
                unint64_t v78 = (uint64_t)&v66[-*a1] >> 2;
              }
              uint64_t v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)(a1 + 3), v78);
              int v81 = &v79[8 * (v78 >> 2)];
              int v82 = (uint64_t *)a1[1];
              uint64_t v66 = v81;
              uint64_t v83 = a1[2] - (void)v82;
              if (v83)
              {
                uint64_t v66 = &v81[v83 & 0xFFFFFFFFFFFFFFF8];
                uint64_t v84 = 8 * (v83 >> 3);
                unint64_t v85 = &v79[8 * (v78 >> 2)];
                do
                {
                  uint64_t v86 = *v82++;
                  *(void *)unint64_t v85 = v86;
                  v85 += 8;
                  v84 -= 8;
                }
                while (v84);
              }
              uint64_t v87 = (char *)*a1;
              *a1 = v79;
              a1[1] = v81;
              a1[2] = v66;
              a1[3] = &v79[8 * v80];
              if (v87)
              {
                operator delete(v87);
                uint64_t v66 = (char *)a1[2];
              }
            }
            else
            {
              uint64_t v72 = v71 >> 3;
              BOOL v22 = v71 >> 3 < -1;
              uint64_t v73 = (v71 >> 3) + 2;
              if (v22) {
                uint64_t v74 = v73;
              }
              else {
                uint64_t v74 = v72 + 1;
              }
              __n128 v75 = &v68[-8 * (v74 >> 1)];
              int64_t v76 = v66 - v68;
              if (v66 != v68)
              {
                memmove(&v68[-8 * (v74 >> 1)], v68, v66 - v68);
                uint64_t v66 = (char *)a1[1];
              }
              unint64_t v77 = &v66[-8 * (v74 >> 1)];
              uint64_t v66 = &v75[v76];
              a1[1] = v77;
              a1[2] = &v75[v76];
            }
          }
          *(void *)uint64_t v66 = v69;
          uint64_t v66 = (char *)(a1[2] + 8);
          a1[2] = v66;
          --v8;
        }
        while (v8);
      }
    }
    else
    {
      uint64_t v11 = v4 >> 3;
      unint64_t v12 = v10 >> 2;
      if (v12 <= v9 + v11) {
        unint64_t v13 = v9 + v11;
      }
      else {
        unint64_t v13 = v12;
      }
      unint64_t v14 = v11 - v8;
      std::vector<std::string> v91 = a1 + 3;
      if (v13) {
        BOOL v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)(a1 + 3), v13);
      }
      else {
        BOOL v15 = 0;
      }
      uint64_t v38 = v8 << 9;
      __p[0] = v15;
      __p[1] = &v15[8 * v14];
      *(void **)&long long v90 = __p[1];
      *((void *)&v90 + 1) = &v15[8 * v13];
      do
      {
        unsigned __int8 v88 = operator new(0x1000uLL);
        std::__split_buffer<SLToken **>::push_back(__p, &v88);
        --v9;
      }
      while (v9);
      if (v8)
      {
        uint64_t v39 = (void *)a1[1];
        uint64_t v40 = (char *)v90;
        do
        {
          if (v40 == *((char **)&v90 + 1))
          {
            int64_t v41 = (char *)__p[1] - (char *)__p[0];
            if (__p[1] <= __p[0])
            {
              if (v40 == __p[0]) {
                unint64_t v48 = 1;
              }
              else {
                unint64_t v48 = (v40 - (char *)__p[0]) >> 2;
              }
              uint64_t v49 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)v91, v48);
              uint64_t v51 = (uint64_t *)__p[1];
              uint64_t v40 = &v49[8 * (v48 >> 2)];
              uint64_t v52 = v90 - (unint64_t)__p[1];
              if ((void *)v90 != __p[1])
              {
                uint64_t v40 = &v49[8 * (v48 >> 2) + (v52 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v53 = 8 * (v52 >> 3);
                uint64_t v54 = &v49[8 * (v48 >> 2)];
                do
                {
                  uint64_t v55 = *v51++;
                  *(void *)uint64_t v54 = v55;
                  v54 += 8;
                  v53 -= 8;
                }
                while (v53);
              }
              uint64_t v56 = __p[0];
              __p[0] = v49;
              __p[1] = &v49[8 * (v48 >> 2)];
              *(void *)&long long v90 = v40;
              *((void *)&v90 + 1) = &v49[8 * v50];
              if (v56)
              {
                operator delete(v56);
                uint64_t v40 = (char *)v90;
              }
            }
            else
            {
              uint64_t v42 = v41 >> 3;
              BOOL v22 = v41 >> 3 < -1;
              uint64_t v43 = (v41 >> 3) + 2;
              if (v22) {
                uint64_t v44 = v43;
              }
              else {
                uint64_t v44 = v42 + 1;
              }
              int64_t v45 = (char *)__p[1] - 8 * (v44 >> 1);
              int64_t v46 = v40 - (char *)__p[1];
              if (v40 != __p[1])
              {
                memmove((char *)__p[1] - 8 * (v44 >> 1), __p[1], v40 - (char *)__p[1]);
                uint64_t v40 = (char *)__p[1];
              }
              uint64_t v47 = &v40[-8 * (v44 >> 1)];
              uint64_t v40 = &v45[v46];
              __p[1] = v47;
              *(void *)&long long v90 = &v45[v46];
            }
          }
          *(void *)uint64_t v40 = *v39;
          uint64_t v40 = (char *)(v90 + 8);
          *(void *)&long long v90 = v90 + 8;
          uint64_t v39 = (void *)(a1[1] + 8);
          a1[1] = v39;
          --v8;
        }
        while (v8);
      }
      uint64_t v57 = (void *)a1[2];
      uint64_t v58 = -7 - (void)v57;
      while (v57 != (void *)a1[1])
      {
        --v57;
        v58 += 8;
        std::__split_buffer<SLToken **>::push_front((uint64_t)__p, v57);
      }
      uint64_t v59 = (char *)*a1;
      long long v60 = *(_OWORD *)__p;
      long long v61 = v90;
      __p[0] = *(void **)a1;
      __p[1] = v57;
      long long v62 = *((_OWORD *)a1 + 1);
      *(_OWORD *)a1 = v60;
      *((_OWORD *)a1 + 1) = v61;
      long long v90 = v62;
      a1[4] -= v38;
      if (v57 != (void *)v62) {
        *(void *)&long long v90 = v62 + (-(v62 + v58) & 0xFFFFFFFFFFFFFFF8);
      }
      if (v59) {
        operator delete(v59);
      }
    }
  }
}

void sub_222A53074(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator-[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)a1;
  if (a2)
  {
    uint64_t v4 = ((uint64_t)(*(void *)(a1 + 8) - *result) >> 3) - a2;
    if (v4 < 1) {
      result -= (unint64_t)(511 - v4) >> 9;
    }
    else {
      result += (unint64_t)v4 >> 9;
    }
  }
  return result;
}

void std::__split_buffer<SLToken **>::push_front(uint64_t a1, void *a2)
{
  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = a1 + 24;
    unint64_t v7 = *(unsigned char **)(a1 + 24);
    unint64_t v8 = *(unsigned char **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4) {
        unint64_t v12 = 1;
      }
      else {
        unint64_t v12 = (v7 - v4) >> 2;
      }
      uint64_t v13 = 2 * v12;
      unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(v6, v12);
      unint64_t v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      unint64_t v16 = *(uint64_t **)(a1 + 8);
      unint64_t v17 = v5;
      uint64_t v18 = *(void *)(a1 + 16) - (void)v16;
      if (v18)
      {
        unint64_t v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v19 = 8 * (v18 >> 3);
        uint64_t v20 = v5;
        do
        {
          uint64_t v21 = *v16++;
          *(void *)uint64_t v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      BOOL v22 = *(char **)a1;
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v17;
      *(void *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        unint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      uint64_t v9 = (v7 - v8) >> 3;
      if (v9 >= -1) {
        uint64_t v10 = v9 + 1;
      }
      else {
        uint64_t v10 = v9 + 2;
      }
      uint64_t v11 = v10 >> 1;
      unint64_t v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    unint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  unsigned char *v6;
  unsigned char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  uint64_t v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    uint64_t v6 = *(unsigned char **)(a1 + 16);
    unint64_t v7 = *(unsigned char **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = (v7 - v4) >> 2;
      }
      unint64_t v12 = 2 * v11;
      uint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(*(void *)(a1 + 32), v11);
      unint64_t v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v15 = *(uint64_t **)(a1 + 8);
      unint64_t v16 = v5;
      unint64_t v17 = *(void *)(a1 + 16) - (void)v15;
      if (v17)
      {
        unint64_t v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v18 = 8 * (v17 >> 3);
        uint64_t v19 = v5;
        do
        {
          uint64_t v20 = *v15++;
          *(void *)uint64_t v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      uint64_t v21 = *(char **)a1;
      *(void *)a1 = v13;
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v16;
      *(void *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        unint64_t v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      unint64_t v8 = (v7 - v6) >> 3;
      if (v8 >= -1) {
        uint64_t v9 = v8 + 1;
      }
      else {
        uint64_t v9 = v8 + 2;
      }
      uint64_t v10 = v9 >> 1;
      unint64_t v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        uint64_t v4 = *(char **)(a1 + 16);
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    unint64_t v5 = *(char **)(a1 + 8);
  }
  *((void *)v5 - 1) = *a2;
  *(void *)(a1 + 8) -= 8;
}

void std::__split_buffer<SLToken **>::push_back(void *a1, void *a2)
{
  unint64_t v5 = (char *)a1[3];
  uint64_t v4 = (uint64_t)(a1 + 3);
  uint64_t v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    unint64_t v7 = (char *)a1[1];
    uint64_t v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1) {
        unint64_t v18 = 1;
      }
      else {
        unint64_t v18 = (uint64_t)&v6[-*a1] >> 2;
      }
      uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(v4, v18);
      uint64_t v21 = &v19[8 * (v18 >> 2)];
      BOOL v22 = (uint64_t *)a1[1];
      uint64_t v6 = v21;
      uint64_t v23 = a1[2] - (void)v22;
      if (v23)
      {
        uint64_t v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v24 = 8 * (v23 >> 3);
        unint64_t v25 = &v19[8 * (v18 >> 2)];
        do
        {
          uint64_t v26 = *v22++;
          *(void *)unint64_t v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      int64_t v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        uint64_t v6 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v9 = v8 >> 3;
      BOOL v10 = v8 >> 3 < -1;
      uint64_t v11 = (v8 >> 3) + 2;
      if (v10) {
        uint64_t v12 = v11;
      }
      else {
        uint64_t v12 = v9 + 1;
      }
      uint64_t v13 = -(v12 >> 1);
      uint64_t v14 = v12 >> 1;
      uint64_t v15 = &v7[-8 * v14];
      int64_t v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        uint64_t v6 = (char *)a1[1];
      }
      unint64_t v17 = &v6[8 * v13];
      uint64_t v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(void *)uint64_t v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    unint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        int64_t v16 = 1;
      }
      else {
        int64_t v16 = (uint64_t)&v4[-*a1] >> 2;
      }
      unint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(a1[4], v16);
      uint64_t v19 = &v17[8 * (v16 >> 2)];
      uint64_t v20 = (uint64_t *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        BOOL v22 = 8 * (v21 >> 3);
        uint64_t v23 = &v17[8 * (v16 >> 2)];
        do
        {
          uint64_t v24 = *v20++;
          *(void *)uint64_t v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      unint64_t v7 = v6 >> 3;
      uint64_t v8 = v6 >> 3 < -1;
      uint64_t v9 = (v6 >> 3) + 2;
      if (v8) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      uint64_t v12 = v10 >> 1;
      uint64_t v13 = &v5[-8 * v12];
      uint64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      uint64_t v15 = &v4[8 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(void *)uint64_t v4 = *a2;
  a1[2] += 8;
}

double std::__for_each_segment[abi:ne180100]<std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>>>(char **a1, char *__src, char **a3, char *a4, uint64_t a5)
{
  if (a1 == a3)
  {
    uint64_t v11 = *(void ***)a5;
    uint64_t v12 = *(char **)(a5 + 8);
    BOOL v10 = __src;
  }
  else
  {
    uint64_t v8 = a1 + 1;
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,SLToken **,SLToken **,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>(__src, *(char **)(a5 + 8), *a1 + 4096, *(void ***)a5, &v14);
    for (*(_OWORD *)a5 = v15; v8 != a3; *(_OWORD *)a5 = v15)
    {
      uint64_t v9 = *v8++;
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,SLToken **,SLToken **,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>(v9, *(char **)(a5 + 8), v9 + 4096, *(void ***)a5, &v14);
    }
    BOOL v10 = *a3;
    uint64_t v11 = *(void ***)a5;
    uint64_t v12 = *(char **)(a5 + 8);
  }
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,SLToken **,SLToken **,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>(v10, v12, a4, v11, &v14);
  double result = *(double *)&v15;
  *(_OWORD *)a5 = v15;
  return result;
}

char *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,SLToken **,SLToken **,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>@<X0>(char *__src@<X0>, char *__dst@<X3>, char *a3@<X1>, void **a4@<X2>, char **a5@<X8>)
{
  uint64_t v6 = a4;
  if (__src != a3)
  {
    uint64_t v9 = __src;
    uint64_t v6 = a4 + 1;
    BOOL v10 = (char *)*a4;
    while (1)
    {
      uint64_t v11 = v10 - __dst + 4096;
      uint64_t v12 = (a3 - v9) >> 3 >= v11 >> 3 ? v11 >> 3 : (a3 - v9) >> 3;
      if (v12) {
        __src = (char *)memmove(__dst, v9, 8 * v12);
      }
      v9 += 8 * v12;
      if (v9 == a3) {
        break;
      }
      uint64_t v13 = (char *)*v6++;
      BOOL v10 = v13;
      std::string __dst = v13;
    }
    __dst += 8 * v12;
    if ((char *)*(v6 - 1) + 4096 == __dst) {
      std::string __dst = (char *)*v6;
    }
    else {
      --v6;
    }
  }
  *a5 = a3;
  a5[1] = (char *)v6;
  a5[2] = __dst;
  return __src;
}

__n128 std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>@<Q0>(char **a1@<X1>, char *a2@<X2>, char **a3@<X3>, char *a4@<X4>, void *a5@<X5>, char *a6@<X6>, __n128 *a7@<X8>)
{
  if (a1 == a3)
  {
    uint64_t v19 = a2;
    unint64_t v18 = a4;
    long long v15 = a5;
    int64_t v16 = a6;
  }
  else
  {
    uint64_t v13 = a3 - 1;
    uint64_t v12 = *a3;
    uint64_t v14 = a4;
    long long v15 = a5;
    int64_t v16 = a6;
    while (1)
    {
      std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<SLToken **,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>(v12, v14, v15, v16, &v21);
      int64_t v16 = (char *)v22.n128_u64[1];
      long long v15 = (void *)v22.n128_u64[0];
      if (v13 == a1) {
        break;
      }
      unint64_t v17 = *v13--;
      uint64_t v12 = v17;
      uint64_t v14 = v17 + 4096;
    }
    unint64_t v18 = *a1 + 4096;
    uint64_t v19 = a2;
  }
  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<SLToken **,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>(v19, v18, v15, v16, &v21);
  __n128 result = v22;
  a7->n128_u64[0] = (unint64_t)a3;
  a7->n128_u64[1] = (unint64_t)a4;
  a7[1] = result;
  return result;
}

void *std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<SLToken **,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>@<X0>(char *a1@<X1>, char *a2@<X2>, void *a3@<X3>, char *a4@<X4>, void *a5@<X8>)
{
  uint64_t v6 = a3;
  if (a1 == a2)
  {
    uint64_t v9 = a1;
  }
  else
  {
    uint64_t v9 = a2;
    uint64_t v10 = *a3;
    uint64_t v11 = a2;
    while (1)
    {
      uint64_t v12 = (uint64_t)&a4[-v10];
      if ((v11 - a1) >> 3 >= v12 >> 3) {
        uint64_t v13 = v12 >> 3;
      }
      else {
        uint64_t v13 = (v11 - a1) >> 3;
      }
      v11 -= 8 * v13;
      a4 -= 8 * v13;
      if (v13) {
        __n128 result = memmove(a4, v11, 8 * v13);
      }
      if (v11 == a1) {
        break;
      }
      uint64_t v15 = *--v6;
      uint64_t v10 = v15;
      a4 = (char *)(v15 + 4096);
    }
    if ((char *)(*v6 + 4096) == a4)
    {
      int64_t v16 = (char *)v6[1];
      ++v6;
      a4 = v16;
    }
  }
  *a5 = v9;
  a5[1] = v6;
  a5[2] = a4;
  return result;
}

void std::deque<SLToken *>::__add_back_capacity(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    unint64_t v7 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    uint64_t v9 = (char *)(v7 + 1);
    uint64_t v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(void *)uint64_t v8 = v10;
      a1[2] += 8;
      return;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v33 = 1;
      }
      else {
        unint64_t v33 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(v5, v33);
      unint64_t v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        uint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v40 = 8 * (v39 >> 3);
        int64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)int64_t v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    uint64_t v13 = v12 >> 3;
    BOOL v14 = v12 >> 3 < -1;
    uint64_t v15 = (v12 >> 3) + 2;
    if (v14) {
      uint64_t v16 = v15;
    }
    else {
      uint64_t v16 = v13 + 1;
    }
    uint64_t v17 = -(v16 >> 1);
    uint64_t v18 = v16 >> 1;
    uint64_t v19 = &v9[-8 * v18];
    int64_t v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      uint64_t v9 = (char *)a1[1];
    }
    uint64_t v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  uint64_t v21 = a1[2];
  unint64_t v22 = (v21 - a1[1]) >> 3;
  uint64_t v23 = a1[3];
  uint64_t v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(void *)&long long v54 = operator new(0x1000uLL);
      std::__split_buffer<SLToken **>::push_back(a1, &v54);
      return;
    }
    *(void *)&long long v54 = operator new(0x1000uLL);
    std::__split_buffer<SLToken **>::push_front((uint64_t)a1, &v54);
    uint64_t v44 = (void *)a1[1];
    uint64_t v8 = (char *)a1[2];
    uint64_t v45 = *v44;
    uint64_t v9 = (char *)(v44 + 1);
    uint64_t v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3]) {
      goto LABEL_33;
    }
    uint64_t v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1) {
        unint64_t v46 = 1;
      }
      else {
        unint64_t v46 = (uint64_t)&v8[-*a1] >> 2;
      }
      uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)(a1 + 3), v46);
      unint64_t v35 = &v34[8 * (v46 >> 2)];
      uint64_t v37 = &v34[8 * v47];
      unint64_t v48 = (uint64_t *)a1[1];
      uint64_t v8 = v35;
      uint64_t v49 = a1[2] - (void)v48;
      if (v49)
      {
        uint64_t v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        uint64_t v50 = 8 * (v49 >> 3);
        uint64_t v51 = &v34[8 * (v46 >> 2)];
        do
        {
          uint64_t v52 = *v48++;
          *(void *)uint64_t v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      uint64_t v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        uint64_t v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1) {
    unint64_t v25 = 1;
  }
  else {
    unint64_t v25 = v24 >> 2;
  }
  uint64_t v56 = a1 + 3;
  *(void *)&long long v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)(a1 + 3), v25);
  *((void *)&v54 + 1) = v54 + 8 * v22;
  *(void *)&long long v55 = *((void *)&v54 + 1);
  *((void *)&v55 + 1) = v54 + 8 * v26;
  uint64_t v53 = operator new(0x1000uLL);
  std::__split_buffer<SLToken **>::push_back(&v54, &v53);
  int64_t v27 = (void *)a1[2];
  uint64_t v28 = -7 - (void)v27;
  while (v27 != (void *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<SLToken **>::push_front((uint64_t)&v54, v27);
  }
  BOOL v29 = (char *)*a1;
  long long v30 = v54;
  long long v31 = v55;
  *(void *)&long long v54 = *a1;
  *((void *)&v54 + 1) = v27;
  long long v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  long long v55 = v32;
  if (v27 != (void *)v32) {
    *(void *)&long long v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  }
  if (v29) {
    operator delete(v29);
  }
}

void sub_222A53BA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  operator delete(v13);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__CFBundle *SLDictLookup::Create(SLDictLookup *this, const __CFLocale *a2)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFStringCompare(Value, @"en", 0)) {
    SLDictLookup::Create();
  }
  __n128 result = SLGetSpeechDictionaryBundle();
  if (result)
  {
    uint64_t v5 = result;
    CopyLocalizedResourceURL(result, @"PrefixDictionary", v4);
    CopyLocalizedResourceURL(v5, @"CartLite", v6);
    CopyLocalizedResourceURL(v5, @"CartNames", v7);
    operator new();
  }
  return result;
}

void sub_222A53EC8(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F1C40125E1C2CLL);
  _Unwind_Resume(a1);
}

CFURLRef CopyLocalizedResourceURL(__CFBundle *a1, const __CFString *a2, const __CFString *a3)
{
  CFStringRef v4 = CFStringCreateWithFormat(0, 0, @"%@Eng", a2);
  CFURLRef v5 = CFBundleCopyResourceURL(a1, v4, 0, 0);
  CFRelease(v4);
  return v5;
}

CFArrayRef SLDictLookup::CreatePhonemeSymbols(SLDictLookup *this, const __CFLocale *a2)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFStringCompare(Value, @"en", 0)) {
    SLDictLookup::CreatePhonemeSymbols();
  }
  BOOL v3 = SLGetSpeechDictionaryBundle();
  if (!v3) {
    return 0;
  }
  CFURLRef v5 = CopyLocalizedResourceURL(v3, @"PhonemeSymbols", v4);
  if (!v5) {
    return 0;
  }
  CFStringRef v7 = v5;
  uint64_t v8 = (SLMMapCache *)SLMMapCache::Map(v5, 0, v6);
  CFRelease(v7);
  if (v8 == (SLMMapCache *)-1) {
    return 0;
  }
  unint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  if (*(_WORD *)v8)
  {
    uint64_t v10 = 0;
    uint64_t v11 = __rev16(*(unsigned __int16 *)v8);
    do
    {
      *(_OWORD *)std::string __p = 0u;
      long long v34 = 0u;
      long long v32 = 0u;
      __int16 valuePtr = bswap32(*((unsigned __int16 *)v8 + 27 * v10 + 1)) >> 16;
      CFNumberRef v12 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
      SLCFDictionaryBuilder::push_back((SLCFDictionaryBuilder *)&v32, @"Opcode", v12);
      CFStringRef v13 = CFStringCreateWithPascalString(0, (ConstStr255Param)v8 + 54 * v10 + 4, 0x8000100u);
      SLCFDictionaryBuilder::push_back((SLCFDictionaryBuilder *)&v32, @"Symbol", v13);
      CFStringRef v14 = CFStringCreateWithPascalString(0, (ConstStr255Param)v8 + 54 * v10 + 20, 0x8000100u);
      SLCFDictionaryBuilder::push_back((SLCFDictionaryBuilder *)&v32, @"Example", v14);
      __int16 valuePtr = bswap32(*((unsigned __int16 *)v8 + 27 * v10 + 26)) >> 16;
      CFNumberRef v15 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
      SLCFDictionaryBuilder::push_back((SLCFDictionaryBuilder *)&v32, @"HiliteStart", v15);
      __int16 valuePtr = bswap32(*((unsigned __int16 *)v8 + 27 * v10 + 27)) >> 16;
      CFNumberRef v16 = CFNumberCreate(0, kCFNumberSInt16Type, &valuePtr);
      SLCFDictionaryBuilder::push_back((SLCFDictionaryBuilder *)&v32, @"HiliteEnd", v16);
      CFDictionaryRef Dictionary = SLCFDictionaryBuilder::CreateDictionary((const void ***)&v32);
      CFDictionaryRef v18 = Dictionary;
      uint64_t v19 = v36;
      if (v36 >= v37)
      {
        uint64_t v21 = v36 - v35;
        if ((unint64_t)(v21 + 1) >> 61) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v22 = ((char *)v37 - (char *)v35) >> 2;
        if (v22 <= v21 + 1) {
          unint64_t v22 = v21 + 1;
        }
        if ((unint64_t)((char *)v37 - (char *)v35) >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v23) {
          uint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)&v37, v23);
        }
        else {
          uint64_t v24 = 0;
        }
        unint64_t v25 = (const void **)&v24[8 * v21];
        char *v25 = v18;
        int64_t v20 = v25 + 1;
        int64_t v27 = v35;
        uint64_t v26 = v36;
        if (v36 != v35)
        {
          do
          {
            uint64_t v28 = *--v26;
            *--unint64_t v25 = v28;
          }
          while (v26 != v27);
          uint64_t v26 = v35;
        }
        unint64_t v35 = v25;
        uint64_t v36 = v20;
        uint64_t v37 = (const void **)&v24[8 * v23];
        if (v26) {
          operator delete(v26);
        }
      }
      else
      {
        char *v36 = Dictionary;
        int64_t v20 = v19 + 1;
      }
      uint64_t v36 = v20;
      if (__p[1])
      {
        *(void **)&long long v34 = __p[1];
        operator delete(__p[1]);
      }
      SLCFArrayBuilder::~SLCFArrayBuilder((SLCFArrayBuilder *)&v32);
      ++v10;
    }
    while (v10 != v11);
  }
  SLMMapCache::Unmap(v8, v9);
  CFArrayRef v29 = SLCFArrayBuilder::CreateArray(&v35);
  SLCFArrayBuilder::~SLCFArrayBuilder((SLCFArrayBuilder *)&v35);
  return v29;
}

void sub_222A5427C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  SLCFArrayBuilder::~SLCFArrayBuilder((SLCFArrayBuilder *)va);
  _Unwind_Resume(a1);
}

void SLDictLookup::~SLDictLookup(SLDictLookup *this)
{
  *(void *)this = &unk_26D52B5E8;
  uint64_t v2 = *((void *)this + 1);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }
  uint64_t v3 = *((void *)this + 2);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
  }
  uint64_t v4 = *((void *)this + 4);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
}

{
  uint64_t vars8;

  SLDictLookup::~SLDictLookup(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLDictLookup::Lookup(SLDictLookup *this, SLDictionary *a2, const char *a3, uint64_t a4, SLToken *a5, int a6)
{
  SLWordBuilder::SLWordBuilder((SLWordBuilder *)v13);
  v13[0] = &unk_26D52B608;
  memset(&v13[2], 0, 24);
  v13[5] = a5;
  v13[7] = 0;
  char v14 = 1;
  if (a6) {
    operator new();
  }
  uint64_t v11 = (**(uint64_t (***)(SLDictionary *, const char *, uint64_t, void *, void))a2)(a2, a3, a4, v13, 0);
  if (v11) {
    SLTokenBuilder::Build((SLTokenBuilder *)v13);
  }
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)v13);
  return v11;
}

void sub_222A544E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x223CA4030](v2, 0x10A1C40DD1828A3);
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)va);
  _Unwind_Resume(a1);
}

void SLTokenBuilder::SLTokenBuilder(SLTokenBuilder *this, SLToken *a2)
{
  SLWordBuilder::SLWordBuilder(this);
  *(void *)uint64_t v3 = &unk_26D52B608;
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = a2;
  *(void *)(v3 + 56) = 0;
  *(unsigned char *)(v3 + 64) = 1;
}

{
  uint64_t v3;

  SLWordBuilder::SLWordBuilder(this);
  *(void *)uint64_t v3 = &unk_26D52B608;
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
  *(void *)(v3 + 40) = a2;
  *(void *)(v3 + 56) = 0;
  *(unsigned char *)(v3 + 64) = 1;
}

void SLTokenBuilder::Build(SLTokenBuilder *this)
{
  uint64_t v2 = (char *)this + 16;
  if ((*((char *)this + 39) & 0x80000000) == 0)
  {
    if (!*((unsigned char *)this + 39)) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (*((void *)this + 3))
  {
    uint64_t v2 = *(char **)v2;
LABEL_6:
    SLToken::SetText(*((SLToken **)this + 5), v2);
  }
LABEL_7:
  *(_DWORD *)(*((void *)this + 5) + 16) |= 0x40u;
}

void SLTokenBuilder::SLTokenBuilder(SLTokenBuilder *this, SLWordBuilder *a2, int a3)
{
  SLWordBuilder::SLWordBuilder(this);
  *CFStringRef v6 = &unk_26D52B608;
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = 0;
  uint64_t v7 = (*(uint64_t (**)(SLWordBuilder *))(*(void *)a2 + 104))(a2);
  if (!a3 || !(*(unsigned int (**)(SLWordBuilder *))(*(void *)a2 + 112))(a2))
  {
    *((unsigned char *)this + 64) = 0;
LABEL_6:
    *((void *)this + 7) = a2;
    operator new();
  }
  *((unsigned char *)this + 64) = v7 != 0;
  if (!v7) {
    goto LABEL_6;
  }
  *((void *)this + 5) = v7;
  *((void *)this + 7) = 0;
}

void sub_222A54758(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v2, 0x10F0C4034644DEDLL);
  if (v1[39] < 0) {
    operator delete(*v3);
  }
  SLWordBuilder::~SLWordBuilder((SLWordBuilder *)v1);
  _Unwind_Resume(a1);
}

void SLTokenBuilder::~SLTokenBuilder(SLTokenBuilder *this)
{
  *(void *)this = &unk_26D52B608;
  if (*((void *)this + 7))
  {
    uint64_t v2 = (SLToken *)*((void *)this + 5);
    if (v2)
    {
      SLToken::~SLToken(v2);
      MEMORY[0x223CA4030]();
    }
  }
  if (*((char *)this + 39) < 0) {
    operator delete(*((void **)this + 2));
  }
  SLWordBuilder::~SLWordBuilder(this);
}

{
  uint64_t vars8;

  SLTokenBuilder::~SLTokenBuilder(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLTokenBuilder::Forward(SLTokenBuilder *this)
{
  uint64_t v2 = *((void *)this + 7);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
    (***((void (****)(void, void))this + 7))(*((void *)this + 7), *(void *)(*((void *)this + 5) + 24));
    if (*((char *)this + 39) < 0)
    {
      uint64_t v3 = (char *)*((void *)this + 2);
      uint64_t v4 = *((void *)this + 3);
    }
    else
    {
      uint64_t v3 = (char *)this + 16;
      uint64_t v4 = *((unsigned __int8 *)this + 39);
    }
    (*(void (**)(void, char *, uint64_t))(**((void **)this + 7) + 16))(*((void *)this + 7), v3, v4);
    uint64_t v7 = *((void *)this + 5);
    if (*(unsigned char *)(v7 + 1))
    {
      (*(void (**)(void))(**((void **)this + 7) + 24))(*((void *)this + 7));
      uint64_t v7 = *((void *)this + 5);
    }
    if (*(unsigned char *)(v7 + 2))
    {
      (*(void (**)(void))(**((void **)this + 7) + 24))(*((void *)this + 7));
      uint64_t v7 = *((void *)this + 5);
    }
    if (*(void *)(v7 + 40))
    {
      (*(void (**)(void, void))(**((void **)this + 7) + 40))(*((void *)this + 7), *(void *)(v7 + 32));
      uint64_t v7 = *((void *)this + 5);
    }
    uint64_t v9 = v7 + 80;
    uint64_t v8 = *(void *)(v7 + 80);
    if (*(void *)(v9 + 8) != v8)
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t v11 = *(void *)(v8 + 8 * v10);
        (*(void (**)(void))(**((void **)this + 7) + 56))(*((void *)this + 7));
        uint64_t v12 = *(void *)(v11 + 32);
        if (*(void *)(v11 + 40) != v12)
        {
          unint64_t v13 = 0;
          do
          {
            (*(void (**)(void, void))(**((void **)this + 7) + 72))(*((void *)this + 7), *(unsigned __int8 *)(v12 + v13++));
            uint64_t v12 = *(void *)(v11 + 32);
          }
          while (v13 < *(void *)(v11 + 40) - v12);
        }
        SLWordBuilder::SetPartOfSpeech(*((void *)this + 7), *(_DWORD *)v11);
        (*(void (**)(void, uint64_t))(**((void **)this + 7) + 88))(*((void *)this + 7), v11 + 4);
        (*(void (**)(void))(**((void **)this + 7) + 96))(*((void *)this + 7));
        ++v10;
        uint64_t v8 = *(void *)(*((void *)this + 5) + 80);
      }
      while (v10 < (*(void *)(*((void *)this + 5) + 88) - v8) >> 3);
    }
    (*(void (**)(void))(**((void **)this + 7) + 48))(*((void *)this + 7));
    uint64_t result = (*(uint64_t (**)(void))(**((void **)this + 7) + 104))(*((void *)this + 7));
    if (result) {
      *(_DWORD *)(result + 16) = *(_DWORD *)(result + 16) & 0xFFFFFFE7 | (8
    }
                                                                        * ((*(_DWORD *)(*((void *)this + 5) + 16) >> 3) & 3));
  }
  else
  {
    CFURLRef v5 = *(uint64_t (**)(SLTokenBuilder *))(*(void *)this + 136);
    return v5(this);
  }
  return result;
}

uint64_t SLTokenBuilder::SetDictionary(uint64_t this, const char *a2)
{
  *(void *)(*(void *)(this + 40) + 24) = a2;
  return this;
}

void SLTokenBuilder::BeginWord(SLToken **this)
{
}

void SLTokenBuilder::SetText(SLTokenBuilder *this, const char *a2)
{
}

uint64_t SLTokenBuilder::SetBoundary(uint64_t this, char a2)
{
  *(unsigned char *)(*(void *)(this + 40) + 1) = a2;
  return this;
}

uint64_t SLTokenBuilder::SetEmphasis(uint64_t this, char a2)
{
  *(unsigned char *)(*(void *)(this + 40) + 2) = a2;
  return this;
}

uint64_t SLTokenBuilder::SetPosition(uint64_t this, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(this + 40);
  *(void *)(v3 + 32) = a2;
  *(void *)(v3 + 40) = a3;
  return this;
}

void SLTokenBuilder::BeginHomograph(SLTokenBuilder *this)
{
}

void sub_222A54C08(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x1070C40CEE27CEALL);
  _Unwind_Resume(a1);
}

void SLTokenBuilder::AddPhoneme(SLTokenBuilder *this, char a2)
{
  uint64_t v3 = (void *)*((void *)this + 6);
  CFURLRef v5 = (unsigned char *)v3[5];
  unint64_t v4 = v3[6];
  if ((unint64_t)v5 >= v4)
  {
    unint64_t v7 = v3[4];
    uint64_t v8 = &v5[-v7];
    uint64_t v9 = (uint64_t)&v5[-v7 + 1];
    if (v9 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = v4 - v7;
    if (2 * v10 > v9) {
      uint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v9;
    }
    if (v11) {
      uint64_t v12 = operator new(v11);
    }
    else {
      uint64_t v12 = 0;
    }
    unint64_t v13 = &v12[v11];
    v8[(void)v12] = a2;
    uint64_t v6 = (uint64_t)&v8[(void)v12 + 1];
    if (v5 == (unsigned char *)v7)
    {
      uint64_t v12 = &v8[(void)v12];
    }
    else
    {
      char v14 = &v5[~v7];
      do
      {
        char v15 = *--v5;
        (v14--)[(void)v12] = v15;
      }
      while (v5 != (unsigned char *)v7);
      CFURLRef v5 = (unsigned char *)v3[4];
    }
    v3[4] = v12;
    v3[5] = v6;
    v3[6] = v13;
    if (v5) {
      operator delete(v5);
    }
  }
  else
  {
    *CFURLRef v5 = a2;
    uint64_t v6 = (uint64_t)(v5 + 1);
  }
  v3[5] = v6;
}

__n128 SLTokenBuilder::SetTags(SLTokenBuilder *this, __n128 *a2)
{
  __n128 result = *a2;
  *(__n128 *)(*((void *)this + 6) + 4) = *a2;
  return result;
}

void SLTokenBuilder::EndHomograph(SLTokenBuilder *this)
{
  uint64_t v3 = (void *)*((void *)this + 5);
  uint64_t v2 = (_DWORD *)*((void *)this + 6);
  *uint64_t v2 = *((_DWORD *)this + 3);
  unint64_t v4 = (void *)v3[11];
  unint64_t v5 = v3[12];
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = v3[10];
    uint64_t v8 = ((uint64_t)v4 - v7) >> 3;
    if ((unint64_t)(v8 + 1) >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v9 = v5 - v7;
    uint64_t v10 = v9 >> 2;
    if (v9 >> 2 <= (unint64_t)(v8 + 1)) {
      uint64_t v10 = v8 + 1;
    }
    if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v11 = v10;
    }
    if (v11)
    {
      uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)(v3 + 12), v11);
      uint64_t v2 = (_DWORD *)*((void *)this + 6);
    }
    else
    {
      uint64_t v12 = 0;
    }
    unint64_t v13 = &v12[8 * v8];
    char v14 = &v12[8 * v11];
    *(void *)unint64_t v13 = v2;
    uint64_t v6 = v13 + 8;
    CFNumberRef v16 = (char *)v3[10];
    char v15 = (char *)v3[11];
    if (v15 != v16)
    {
      do
      {
        uint64_t v17 = *((void *)v15 - 1);
        v15 -= 8;
        *((void *)v13 - 1) = v17;
        v13 -= 8;
      }
      while (v15 != v16);
      char v15 = (char *)v3[10];
    }
    v3[10] = v13;
    v3[11] = v6;
    v3[12] = v14;
    if (v15) {
      operator delete(v15);
    }
  }
  else
  {
    *unint64_t v4 = v2;
    uint64_t v6 = v4 + 1;
  }
  v3[11] = v6;
}

void SLTmpLookup::SLTmpLookup()
{
}

void sub_222A54EB0(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLTmpLookup::~SLTmpLookup(SLTmpLookup *this)
{
  uint64_t v1 = (SLToken *)*((void *)this + 1);
  if (v1)
  {
    SLToken::~SLToken(v1);
    MEMORY[0x223CA4030]();
  }
}

uint64_t SLTokenBuilder::WrappedToken(SLTokenBuilder *this)
{
  return *((void *)this + 5);
}

uint64_t SLTokenBuilder::AllowShortcut(SLTokenBuilder *this)
{
  return *((unsigned __int8 *)this + 64);
}

void SLCreateMorphRulesEng()
{
}

void sub_222A54F78(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10A1C4006A16F6ELL);
  _Unwind_Resume(a1);
}

void SLCreateFlatMorphRulesEng(SLDictionary *a1)
{
}

void sub_222A54FF8(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10A1C40532DF389);
  _Unwind_Resume(a1);
}

void SLMorphEng::Store_S_or_Z(SLMorphEng *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    unint64_t v4 = 0;
    while (1)
    {
      unint64_t v5 = *(void **)(v2 + 8 * v4);
      uint64_t v6 = v5 + 4;
      uint64_t v7 = (char *)v5[5];
      int v8 = SLPhonEng::sFlags[*(v7 - 1)];
      if ((*(v7 - 1) & 0xFE) == 0x2A || (*(void *)&v8 & 0x20000) != 0) {
        break;
      }
      uint64_t v12 = v8 & 6;
      unint64_t v13 = v5[6];
      if (v12 != 2)
      {
        if ((unint64_t)v7 >= v13)
        {
          uint64_t v21 = (char *)*v6;
          unint64_t v22 = &v7[-*v6];
          unint64_t v23 = (unint64_t)(v22 + 1);
          if ((uint64_t)(v22 + 1) < 0) {
            goto LABEL_94;
          }
          unint64_t v24 = v13 - (void)v21;
          if (2 * v24 > v23) {
            unint64_t v23 = 2 * v24;
          }
          if (v24 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v25 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v25 = v23;
          }
          if (v25) {
            uint64_t v26 = operator new(v25);
          }
          else {
            uint64_t v26 = 0;
          }
          uint64_t v52 = &v22[(void)v26];
          uint64_t v53 = (char *)v26 + v25;
          v22[(void)v26] = 43;
          uint64_t v46 = (uint64_t)&v22[(void)v26 + 1];
          if (v7 != v21)
          {
            uint64_t v56 = &v7[~(unint64_t)v21];
            do
            {
              char v57 = *--v7;
              (v56--)[(void)v26] = v57;
            }
            while (v7 != v21);
            goto LABEL_88;
          }
          goto LABEL_90;
        }
        goto LABEL_64;
      }
      if ((unint64_t)v7 >= v13)
      {
        int64_t v27 = (char *)*v6;
        uint64_t v28 = &v7[-*v6];
        unint64_t v29 = (unint64_t)(v28 + 1);
        if ((uint64_t)(v28 + 1) < 0) {
          goto LABEL_94;
        }
        unint64_t v30 = v13 - (void)v27;
        if (2 * v30 > v29) {
          unint64_t v29 = 2 * v30;
        }
        if (v30 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v31 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v31 = v29;
        }
        if (v31) {
          uint64_t v26 = operator new(v31);
        }
        else {
          uint64_t v26 = 0;
        }
        uint64_t v52 = &v28[(void)v26];
        uint64_t v53 = (char *)v26 + v31;
        v28[(void)v26] = 42;
        uint64_t v46 = (uint64_t)&v28[(void)v26 + 1];
        if (v7 != v27)
        {
          uint64_t v58 = &v7[~(unint64_t)v27];
          do
          {
            char v59 = *--v7;
            (v58--)[(void)v26] = v59;
          }
          while (v7 != v27);
          goto LABEL_88;
        }
        goto LABEL_90;
      }
      char v14 = 42;
LABEL_65:
      *uint64_t v7 = v14;
      uint64_t v46 = (uint64_t)(v7 + 1);
LABEL_92:
      v5[5] = v46;
      ++v4;
      uint64_t v2 = *((void *)a2 + 10);
      if (v4 >= (*((void *)a2 + 11) - v2) >> 3) {
        return;
      }
    }
    unint64_t v10 = v5[6];
    if ((unint64_t)v7 < v10)
    {
      *uint64_t v7 = 60;
      unint64_t v11 = v7 + 1;
      goto LABEL_45;
    }
    char v15 = (char *)*v6;
    CFNumberRef v16 = &v7[-*v6];
    unint64_t v17 = (unint64_t)(v16 + 1);
    if ((uint64_t)(v16 + 1) < 0) {
      goto LABEL_94;
    }
    unint64_t v18 = v10 - (void)v15;
    if (2 * v18 > v17) {
      unint64_t v17 = 2 * v18;
    }
    if (v18 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v19 = v17;
    }
    if (v19) {
      int64_t v20 = operator new(v19);
    }
    else {
      int64_t v20 = 0;
    }
    long long v32 = (char *)v20 + v19;
    v16[(void)v20] = 60;
    unint64_t v11 = &v16[(void)v20 + 1];
    if (v7 == v15)
    {
      v5[4] = &v16[(void)v20];
      v5[5] = v11;
      v5[6] = v32;
    }
    else
    {
      unint64_t v33 = &v7[~(unint64_t)v15];
      do
      {
        char v34 = *--v7;
        (v33--)[(void)v20] = v34;
      }
      while (v7 != v15);
      uint64_t v7 = (char *)v5[4];
      v5[4] = v20;
      v5[5] = v11;
      v5[6] = v32;
      if (!v7)
      {
LABEL_45:
        v5[5] = v11;
        unint64_t v35 = v5[6];
        if ((unint64_t)v11 < v35)
        {
          char *v11 = 25;
          uint64_t v7 = v11 + 1;
          goto LABEL_63;
        }
        uint64_t v36 = (char *)*v6;
        uint64_t v37 = &v11[-*v6];
        unint64_t v38 = (unint64_t)(v37 + 1);
        if ((uint64_t)(v37 + 1) < 0) {
          goto LABEL_94;
        }
        unint64_t v39 = v35 - (void)v36;
        if (2 * v39 > v38) {
          unint64_t v38 = 2 * v39;
        }
        if (v39 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v40 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v40 = v38;
        }
        if (v40) {
          int64_t v41 = operator new(v40);
        }
        else {
          int64_t v41 = 0;
        }
        uint64_t v42 = (char *)v41 + v40;
        v37[(void)v41] = 25;
        uint64_t v7 = &v37[(void)v41 + 1];
        if (v11 == v36)
        {
          v5[4] = &v37[(void)v41];
          v5[5] = v7;
          v5[6] = v42;
        }
        else
        {
          uint64_t v43 = &v11[~(unint64_t)v36];
          do
          {
            char v44 = *--v11;
            (v43--)[(void)v41] = v44;
          }
          while (v11 != v36);
          unint64_t v11 = (char *)v5[4];
          v5[4] = v41;
          v5[5] = v7;
          v5[6] = v42;
          if (!v11)
          {
LABEL_63:
            v5[5] = v7;
            unint64_t v45 = v5[6];
            if ((unint64_t)v7 >= v45)
            {
              uint64_t v47 = (char *)*v6;
              unint64_t v48 = &v7[-*v6];
              unint64_t v49 = (unint64_t)(v48 + 1);
              if ((uint64_t)(v48 + 1) < 0) {
LABEL_94:
              }
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              unint64_t v50 = v45 - (void)v47;
              if (2 * v50 > v49) {
                unint64_t v49 = 2 * v50;
              }
              if (v50 >= 0x3FFFFFFFFFFFFFFFLL) {
                size_t v51 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                size_t v51 = v49;
              }
              if (v51) {
                uint64_t v26 = operator new(v51);
              }
              else {
                uint64_t v26 = 0;
              }
              uint64_t v52 = &v48[(void)v26];
              uint64_t v53 = (char *)v26 + v51;
              v48[(void)v26] = 43;
              uint64_t v46 = (uint64_t)&v48[(void)v26 + 1];
              if (v7 != v47)
              {
                long long v54 = &v7[~(unint64_t)v47];
                do
                {
                  char v55 = *--v7;
                  (v54--)[(void)v26] = v55;
                }
                while (v7 != v47);
LABEL_88:
                uint64_t v7 = (char *)v5[4];
                v5[4] = v26;
                v5[5] = v46;
                v5[6] = v53;
                if (!v7) {
                  goto LABEL_92;
                }
LABEL_91:
                operator delete(v7);
                goto LABEL_92;
              }
LABEL_90:
              v5[4] = v52;
              v5[5] = v46;
              v5[6] = v53;
              goto LABEL_91;
            }
LABEL_64:
            char v14 = 43;
            goto LABEL_65;
          }
        }
        operator delete(v11);
        goto LABEL_63;
      }
    }
    operator delete(v7);
    goto LABEL_45;
  }
}

void SLMorphEng::Store_T_or_D(SLMorphEng *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    unint64_t v4 = 0;
    while (1)
    {
      unint64_t v5 = *(void **)(v2 + 8 * v4);
      uint64_t v6 = v5 + 4;
      uint64_t v7 = (char *)v5[5];
      uint64_t v8 = *(v7 - 1);
      if ((v8 & 0xFE) == 0x30) {
        break;
      }
      int v11 = SLPhonEng::sFlags[v8] & 6;
      unint64_t v12 = v5[6];
      if (v11 != 2)
      {
        if ((unint64_t)v7 >= v12)
        {
          int64_t v20 = (char *)*v6;
          uint64_t v21 = &v7[-*v6];
          unint64_t v22 = (unint64_t)(v21 + 1);
          if ((uint64_t)(v21 + 1) < 0) {
            goto LABEL_91;
          }
          unint64_t v23 = v12 - (void)v20;
          if (2 * v23 > v22) {
            unint64_t v22 = 2 * v23;
          }
          if (v23 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v24 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v24 = v22;
          }
          if (v24) {
            size_t v25 = operator new(v24);
          }
          else {
            size_t v25 = 0;
          }
          size_t v51 = &v21[(void)v25];
          uint64_t v52 = (char *)v25 + v24;
          v21[(void)v25] = 49;
          uint64_t v45 = (uint64_t)&v21[(void)v25 + 1];
          if (v7 != v20)
          {
            char v55 = &v7[~(unint64_t)v20];
            do
            {
              char v56 = *--v7;
              (v55--)[(void)v25] = v56;
            }
            while (v7 != v20);
            goto LABEL_85;
          }
          goto LABEL_87;
        }
        goto LABEL_61;
      }
      if ((unint64_t)v7 >= v12)
      {
        uint64_t v26 = (char *)*v6;
        int64_t v27 = &v7[-*v6];
        unint64_t v28 = (unint64_t)(v27 + 1);
        if ((uint64_t)(v27 + 1) < 0) {
          goto LABEL_91;
        }
        unint64_t v29 = v12 - (void)v26;
        if (2 * v29 > v28) {
          unint64_t v28 = 2 * v29;
        }
        if (v29 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v30 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v30 = v28;
        }
        if (v30) {
          size_t v25 = operator new(v30);
        }
        else {
          size_t v25 = 0;
        }
        size_t v51 = &v27[(void)v25];
        uint64_t v52 = (char *)v25 + v30;
        v27[(void)v25] = 48;
        uint64_t v45 = (uint64_t)&v27[(void)v25 + 1];
        if (v7 != v26)
        {
          char v57 = &v7[~(unint64_t)v26];
          do
          {
            char v58 = *--v7;
            (v57--)[(void)v25] = v58;
          }
          while (v7 != v26);
          goto LABEL_85;
        }
        goto LABEL_87;
      }
      char v13 = 48;
LABEL_62:
      *uint64_t v7 = v13;
      uint64_t v45 = (uint64_t)(v7 + 1);
LABEL_89:
      v5[5] = v45;
      ++v4;
      uint64_t v2 = *((void *)a2 + 10);
      if (v4 >= (*((void *)a2 + 11) - v2) >> 3) {
        return;
      }
    }
    unint64_t v9 = v5[6];
    if ((unint64_t)v7 < v9)
    {
      *uint64_t v7 = 60;
      unint64_t v10 = v7 + 1;
      goto LABEL_42;
    }
    char v14 = (char *)*v6;
    char v15 = &v7[-*v6];
    unint64_t v16 = (unint64_t)(v15 + 1);
    if ((uint64_t)(v15 + 1) < 0) {
      goto LABEL_91;
    }
    unint64_t v17 = v9 - (void)v14;
    if (2 * v17 > v16) {
      unint64_t v16 = 2 * v17;
    }
    if (v17 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v18 = v16;
    }
    if (v18) {
      size_t v19 = operator new(v18);
    }
    else {
      size_t v19 = 0;
    }
    size_t v31 = (char *)v19 + v18;
    v15[(void)v19] = 60;
    unint64_t v10 = &v15[(void)v19 + 1];
    if (v7 == v14)
    {
      v5[4] = &v15[(void)v19];
      v5[5] = v10;
      v5[6] = v31;
    }
    else
    {
      long long v32 = &v7[~(unint64_t)v14];
      do
      {
        char v33 = *--v7;
        (v32--)[(void)v19] = v33;
      }
      while (v7 != v14);
      uint64_t v7 = (char *)v5[4];
      v5[4] = v19;
      v5[5] = v10;
      v5[6] = v31;
      if (!v7)
      {
LABEL_42:
        v5[5] = v10;
        unint64_t v34 = v5[6];
        if ((unint64_t)v10 < v34)
        {
          char *v10 = 25;
          uint64_t v7 = v10 + 1;
          goto LABEL_60;
        }
        unint64_t v35 = (char *)*v6;
        uint64_t v36 = &v10[-*v6];
        unint64_t v37 = (unint64_t)(v36 + 1);
        if ((uint64_t)(v36 + 1) < 0) {
          goto LABEL_91;
        }
        unint64_t v38 = v34 - (void)v35;
        if (2 * v38 > v37) {
          unint64_t v37 = 2 * v38;
        }
        if (v38 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v39 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v39 = v37;
        }
        if (v39) {
          size_t v40 = operator new(v39);
        }
        else {
          size_t v40 = 0;
        }
        int64_t v41 = (char *)v40 + v39;
        v36[(void)v40] = 25;
        uint64_t v7 = &v36[(void)v40 + 1];
        if (v10 == v35)
        {
          v5[4] = &v36[(void)v40];
          v5[5] = v7;
          v5[6] = v41;
        }
        else
        {
          uint64_t v42 = &v10[~(unint64_t)v35];
          do
          {
            char v43 = *--v10;
            (v42--)[(void)v40] = v43;
          }
          while (v10 != v35);
          unint64_t v10 = (char *)v5[4];
          v5[4] = v40;
          v5[5] = v7;
          v5[6] = v41;
          if (!v10)
          {
LABEL_60:
            v5[5] = v7;
            unint64_t v44 = v5[6];
            if ((unint64_t)v7 >= v44)
            {
              uint64_t v46 = (char *)*v6;
              uint64_t v47 = &v7[-*v6];
              unint64_t v48 = (unint64_t)(v47 + 1);
              if ((uint64_t)(v47 + 1) < 0) {
LABEL_91:
              }
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              unint64_t v49 = v44 - (void)v46;
              if (2 * v49 > v48) {
                unint64_t v48 = 2 * v49;
              }
              if (v49 >= 0x3FFFFFFFFFFFFFFFLL) {
                size_t v50 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                size_t v50 = v48;
              }
              if (v50) {
                size_t v25 = operator new(v50);
              }
              else {
                size_t v25 = 0;
              }
              size_t v51 = &v47[(void)v25];
              uint64_t v52 = (char *)v25 + v50;
              v47[(void)v25] = 49;
              uint64_t v45 = (uint64_t)&v47[(void)v25 + 1];
              if (v7 != v46)
              {
                uint64_t v53 = &v7[~(unint64_t)v46];
                do
                {
                  char v54 = *--v7;
                  (v53--)[(void)v25] = v54;
                }
                while (v7 != v46);
LABEL_85:
                uint64_t v7 = (char *)v5[4];
                v5[4] = v25;
                v5[5] = v45;
                v5[6] = v52;
                if (!v7) {
                  goto LABEL_89;
                }
LABEL_88:
                operator delete(v7);
                goto LABEL_89;
              }
LABEL_87:
              v5[4] = v51;
              v5[5] = v45;
              v5[6] = v52;
              goto LABEL_88;
            }
LABEL_61:
            char v13 = 49;
            goto LABEL_62;
          }
        }
        operator delete(v10);
        goto LABEL_60;
      }
    }
    operator delete(v7);
    goto LABEL_42;
  }
}

uint64_t SLMorphEng::MorphLookup_Y(SLMorphEng *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4);
  size_t v10 = a3 - v9;
  std::string::basic_string[abi:ne180100](&__dst, (void *)&a2[a3 - v9], v9);
  int v11 = (char *)a5 + 16;
  MEMORY[0x223CA3F60]((char *)a5 + 16, a2, v10);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_dst = &__dst;
  }
  else {
    p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  unsigned int v13 = p_dst->__r_.__value_.__s.__data_[0];
  if ((v13 & 0x80000000) != 0) {
    int v14 = __maskrune(v13, 0x8000uLL);
  }
  else {
    int v14 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x8000;
  }
  if (v14) {
    std::string::value_type v15 = 89;
  }
  else {
    std::string::value_type v15 = 121;
  }
  std::string::append((std::string *)((char *)a5 + 16), 1uLL, v15);
  if (*((char *)a5 + 39) < 0)
  {
    int v11 = (char *)*((void *)a5 + 2);
    uint64_t v16 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v16 = *((unsigned __int8 *)a5 + 39);
  }
  if ((**(unsigned int (***)(SLDictionary *, char *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, v11, v16, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v17 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p, 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v17;
}

void sub_222A55968(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLMorphEng_S::MorphLookup(SLMorphEng_S *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4);
  size_t v10 = a3 - v9;
  int v11 = (char *)&a2[a3 - v9];
  std::string::basic_string[abi:ne180100](&__dst, v11, v9);
  unsigned int v12 = *(v11 - 1);
  if ((v12 & 0x80000000) != 0) {
    __darwin_ct_rune_t v13 = ___toupper_l(v12, *(locale_t *)(*((void *)this + 5) + 8));
  }
  else {
    __darwin_ct_rune_t v13 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v12 + 2108);
  }
  if (v13 == 83 && **((unsigned char **)this + 3) == 83
    || !(**(unsigned int (***)(SLDictionary *, const char *, size_t, SLTokenBuilder *, SLDictionary *))a4)(a4, a2, v10, a5, a4))
  {
    uint64_t v14 = 0;
  }
  else
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v14 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v14;
}

void sub_222A55AE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void SLMorphEng_S::AddAffix(SLMorphEng_S *this, SLToken *a2)
{
  SLMorphEng::Store_S_or_Z(this, a2);
  if (**((unsigned char **)this + 3) == 39)
  {
    uint64_t v4 = *((void *)a2 + 10);
    if (*((void *)a2 + 11) != v4)
    {
      unint64_t v5 = 0;
      while (1)
      {
        uint64_t v6 = (SLWordTagSet *)(*(void *)(v4 + 8 * v5) + 4);
        if (!SLWordTagSet::find(v6, 84))
        {
          uint64_t v7 = *(unsigned __int16 *)v6;
          if (v7 <= 6)
          {
            uint64_t v8 = v7 + 1;
            *(_WORD *)uint64_t v6 = v8;
            *((_WORD *)v6 + v8) = 84;
          }
        }
        if (SLWordTagSet::find((SLWordTagSet *)(*(void *)(*((void *)a2 + 10) + 8 * v5) + 4), 76)) {
          break;
        }
        ++v5;
        uint64_t v4 = *((void *)a2 + 10);
        if (v5 >= (*((void *)a2 + 11) - v4) >> 3) {
          return;
        }
      }
      v9[0] = 4980737;
      SLToken::SelectHomographs(a2, 0x7FFFFFFF, (const SLWordTagSet *)v9);
    }
  }
}

uint64_t SLMorphEng_ES::MorphLookup(SLMorphEng_ES *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4);
  unint64_t v10 = a3 - v9;
  std::string::basic_string[abi:ne180100](&__str, (void *)&a2[a3 - v9], v9);
  if (v10 >= 3)
  {
    unsigned int v11 = a2[v10 - 1];
    if ((v11 & 0x80000000) != 0) {
      __darwin_ct_rune_t v12 = ___toupper_l(v11, *(locale_t *)(*((void *)this + 5) + 8));
    }
    else {
      __darwin_ct_rune_t v12 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v11 + 2108);
    }
    switch(v12)
    {
      case 'H':
        unsigned int v13 = a2[v10 - 2];
        if ((v13 & 0x80000000) != 0) {
          __darwin_ct_rune_t v14 = ___toupper_l(v13, *(locale_t *)(*((void *)this + 5) + 8));
        }
        else {
          __darwin_ct_rune_t v14 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 2108);
        }
        if ((v14 | 0x10) == 0x53) {
          goto LABEL_21;
        }
        break;
      case 'S':
        unsigned int v15 = a2[v10 - 2];
        if ((v15 & 0x80000000) != 0) {
          __darwin_ct_rune_t v16 = ___toupper_l(v15, *(locale_t *)(*((void *)this + 5) + 8));
        }
        else {
          __darwin_ct_rune_t v16 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v15 + 2108);
        }
        if (v16 == 83) {
          goto LABEL_21;
        }
        break;
      case 'X':
        goto LABEL_21;
    }
  }
  if ((**(unsigned int (***)(SLDictionary *, const char *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, a2, v10 + 1, a5, a4))
  {
    std::string::basic_string(&v21, &__str, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v23);
    uint64_t v17 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&v21);
    if ((SHIBYTE(v21.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_29;
    }
    size_t v18 = &v21;
    goto LABEL_28;
  }
LABEL_21:
  if (!(**(unsigned int (***)(SLDictionary *, const char *, unint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, a2, v10, a5, a4))
  {
    uint64_t v17 = 0;
    goto LABEL_29;
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v20, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
  }
  else {
    std::string v20 = __str;
  }
  uint64_t v17 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&v20);
  if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    goto LABEL_29;
  }
  size_t v18 = &v20;
LABEL_28:
  operator delete(v18->__r_.__value_.__l.__data_);
LABEL_29:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  return v17;
}

void sub_222A55E28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a26 < 0) {
    operator delete(a21);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLMorphEng_ES::POSFromSuffix(SLMorphEng_ES *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) == v2) {
    return 0;
  }
  unint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = *(void *)(v2 + 8 * v5);
    if (!SLWordTagSet::find((SLWordTagSet *)(v6 + 4), 68)) {
      break;
    }
    ++v5;
    uint64_t v2 = *((void *)a2 + 10);
    if (v5 >= (*((void *)a2 + 11) - v2) >> 3) {
      return 0;
    }
  }
  uint64_t v7 = 1;
  if (*(_DWORD *)v6 == 2) {
    int v8 = 2;
  }
  else {
    int v8 = 1;
  }
  *((_DWORD *)this + 15) = v8;
  SLToken::ChooseHomograph(a2, (SLHomograph *)v6);
  int v9 = *((_DWORD *)this + 15);
  if (v9 != 16499) {
    *(_DWORD *)uint64_t v6 = v9;
  }
  return v7;
}

uint64_t SLMorphEng_IES::MorphLookup(SLMorphEng_IES *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  if (SLMorphEng::MorphLookup_Y(this, a2, a3, a4, a5)) {
    return 1;
  }
  size_t v11 = *((void *)this + 4) - 2;
  size_t v12 = a3 - v11;
  std::string::basic_string[abi:ne180100](&__dst, (void *)&a2[v12], v11);
  if ((**(unsigned int (***)(SLDictionary *, const char *, size_t, SLTokenBuilder *, SLDictionary *))a4)(a4, a2, v12, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v10 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v10;
}

void sub_222A5603C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLMorphEng_E::MorphLookup(SLMorphEng_E *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4);
  unint64_t v10 = a3 - v9;
  std::string::basic_string[abi:ne180100](&__dst, (void *)&a2[a3 - v9], v9);
  size_t v11 = (char *)a5 + 16;
  MEMORY[0x223CA3F60]((char *)a5 + 16, a2, v10);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_dst = &__dst;
  }
  else {
    p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  unsigned int v13 = p_dst->__r_.__value_.__s.__data_[0];
  uint64_t v14 = MEMORY[0x263EF8318];
  if ((v13 & 0x80000000) != 0) {
    int v15 = __maskrune(v13, 0x8000uLL);
  }
  else {
    int v15 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x8000;
  }
  if (v15) {
    std::string::value_type v16 = 69;
  }
  else {
    std::string::value_type v16 = 101;
  }
  std::string::append((std::string *)((char *)a5 + 16), 1uLL, v16);
  unint64_t v17 = v10 - 1;
  unsigned int v18 = a2[v10 - 1];
  if ((v18 & 0x80000000) != 0) {
    __darwin_ct_rune_t v19 = ___toupper_l(v18, *(locale_t *)(*((void *)this + 5) + 8));
  }
  else {
    __darwin_ct_rune_t v19 = *(_DWORD *)(v14 + 4 * v18 + 2108);
  }
  HIDWORD(v21) = v19 - 65;
  LODWORD(v21) = v19 - 65;
  unsigned int v20 = v21 >> 1;
  BOOL v22 = v20 > 0xA;
  int v23 = (1 << v20) & 0x495;
  if (v22 || v23 == 0)
  {
    if (*((char *)a5 + 39) < 0)
    {
      size_t v11 = (char *)*((void *)a5 + 2);
      uint64_t v28 = *((void *)a5 + 3);
    }
    else
    {
      uint64_t v28 = *((unsigned __int8 *)a5 + 39);
    }
    if ((**(unsigned int (***)(SLDictionary *, char *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, v11, v28, a5, a4))
    {
      if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v35, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
      }
      else {
        std::string v35 = __dst;
      }
      char v31 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&v35, 1);
      char v32 = v31;
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v35.__r_.__value_.__l.__data_);
        if (v32)
        {
LABEL_46:
          uint64_t v27 = 1;
          goto LABEL_52;
        }
      }
      else if (v31)
      {
        goto LABEL_46;
      }
    }
  }
  unsigned int v25 = a2[v17];
  if ((v25 & 0x80000000) != 0) {
    __darwin_ct_rune_t v26 = ___toupper_l(a2[v17], *(locale_t *)(*((void *)this + 5) + 8));
  }
  else {
    __darwin_ct_rune_t v26 = *(_DWORD *)(v14 + 4 * v25 + 2108);
  }
  if ((v26 - 65) > 0x14) {
    goto LABEL_35;
  }
  if (((1 << (v26 - 65)) & 0x104931) != 0) {
    goto LABEL_22;
  }
  if (v26 == 83)
  {
    if (v10 >= 2)
    {
      unsigned int v29 = a2[v10 - 2];
      __darwin_ct_rune_t v30 = (v29 & 0x80000000) != 0
          ? ___toupper_l(v29, *(locale_t *)(*((void *)this + 5) + 8))
          : *(_DWORD *)(v14 + 4 * v29 + 2108);
      if (v30 != 83 && (v30 != 85 || v10 <= 2)) {
        goto LABEL_51;
      }
    }
  }
  else
  {
LABEL_35:
    if (v10 >= 3 && a2[v10 - 2] == v25)
    {
      std::string::insert(&__dst, 0, 1uLL, v25);
      --v10;
    }
  }
LABEL_22:
  if (!(**(unsigned int (***)(SLDictionary *, const char *, unint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, a2, v10, a5, a4))
  {
LABEL_51:
    uint64_t v27 = 0;
    goto LABEL_52;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = __dst;
  }
  uint64_t v27 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
LABEL_52:
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v27;
}

void sub_222A563A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLMorphEng_ED::POSFromSuffix(SLMorphEng_ED *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) == v2) {
    return 0;
  }
  unint64_t v5 = 0;
  uint64_t v6 = 0;
  while (1)
  {
    uint64_t v7 = *(void *)(v2 + 8 * v5);
    if (!SLWordTagSet::find((SLWordTagSet *)(v7 + 4), 68) && !SLWordTagSet::find((SLWordTagSet *)(v7 + 4), 64))
    {
      if (!v6) {
        uint64_t v6 = v7;
      }
      if ((*(unsigned char *)v7 & 2) != 0) {
        break;
      }
    }
    ++v5;
    uint64_t v2 = *((void *)a2 + 10);
    if (v5 >= (*((void *)a2 + 11) - v2) >> 3)
    {
      uint64_t v7 = v6;
      if (!v6) {
        return 0;
      }
      break;
    }
  }
  SLToken::ChooseHomograph(a2, (SLHomograph *)v7);
  int v8 = *((_DWORD *)this + 15);
  if (v8 != 16499) {
    *(_DWORD *)uint64_t v7 = v8;
  }
  return 1;
}

void SLMorphEng_ISH::SLMorphEng_ISH(SLMorphEng_ISH *this, const SLMorphTraits *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v8 = 423362563;
  char v9 = 44;
  *(void *)SLMorph::SLMorph((uint64_t)this, "ISH", (uint64_t)&v8, (uint64_t)a2, 64, 16499, 0, a8) = &unk_26D52B6D8;
}

void SLMorphEng_ISH::~SLMorphEng_ISH(SLMorphEng_ISH *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLMorphEng_IER::POSFromSuffix(SLMorphEng_IER *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) == v2) {
    return 0;
  }
  unint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = *(void *)(v2 + 8 * v5);
    if (!SLWordTagSet::find((SLWordTagSet *)(v6 + 4), 68) && !SLWordTagSet::find((SLWordTagSet *)(v6 + 4), 64)) {
      break;
    }
    ++v5;
    uint64_t v2 = *((void *)a2 + 10);
    if (v5 >= (*((void *)a2 + 11) - v2) >> 3) {
      return 0;
    }
  }
  if (*(_DWORD *)v6 & 2) == 0 || (*(_DWORD *)v6) {
    int v8 = 64;
  }
  else {
    int v8 = 1;
  }
  *((_DWORD *)this + 15) = v8;
  SLToken::ChooseHomograph(a2, (SLHomograph *)v6);
  int v9 = *((_DWORD *)this + 15);
  if (v9 != 16499) {
    *(_DWORD *)uint64_t v6 = v9;
  }
  return 1;
}

char *SLMorphEng_ILY::AddAffix(char *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    uint64_t v4 = (uint64_t)this;
    unint64_t v5 = 0;
    uint64_t v6 = this + 50;
    do
    {
      uint64_t v7 = *(void *)(v2 + 8 * v5);
      int v8 = *(char **)(v7 + 40);
      if (*(v8 - 1) == 3)
      {
        *(v8 - 1) = 25;
        int v8 = *(char **)(v7 + 40);
      }
      this = std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v7 + 32, v8, v6, &v6[*(__int16 *)(v4 + 48)], *(__int16 *)(v4 + 48));
      ++v5;
      uint64_t v2 = *((void *)a2 + 10);
    }
    while (v5 < (*((void *)a2 + 11) - v2) >> 3);
  }
  return this;
}

uint64_t SLMorphEng_BLY::MorphLookup(SLMorphEng_BLY *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  uint64_t v10 = (char *)a5 + 16;
  MEMORY[0x223CA3F60]((char *)a5 + 16);
  unsigned int v11 = a2[a3 - 1];
  if ((v11 & 0x80000000) != 0) {
    int v12 = __maskrune(v11, 0x8000uLL);
  }
  else {
    int v12 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v11 + 60) & 0x8000;
  }
  if (v12) {
    char v13 = 69;
  }
  else {
    char v13 = 101;
  }
  if (*((char *)a5 + 39) < 0)
  {
    int v15 = (char *)*((void *)a5 + 2);
    uint64_t v14 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v14 = *((unsigned __int8 *)a5 + 39);
    int v15 = v10;
  }
  std::string::value_type v16 = &v15[v14];
  char v17 = *(v16 - 1);
  *(v16 - 1) = v13;
  if (*((char *)a5 + 39) < 0)
  {
    __darwin_ct_rune_t v19 = (char *)*((void *)a5 + 2);
    uint64_t v18 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v18 = *((unsigned __int8 *)a5 + 39);
    __darwin_ct_rune_t v19 = v10;
  }
  uint64_t result = (**(uint64_t (***)(SLDictionary *, char *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, v19, v18, a5, a4);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(SLMorphEng_BLY *, void))(*(void *)this + 48))(this, *((void *)a5 + 5));
    if (result)
    {
      if (*((char *)a5 + 39) < 0)
      {
        uint64_t v10 = (char *)*((void *)a5 + 2);
        uint64_t v21 = *((void *)a5 + 3);
      }
      else
      {
        uint64_t v21 = *((unsigned __int8 *)a5 + 39);
      }
      v10[v21 - 1] = v17;
      return 1;
    }
  }
  return result;
}

char *SLMorphEng_BLY::AddAffix(char *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    uint64_t v4 = (uint64_t)this;
    unint64_t v5 = 0;
    uint64_t v6 = this + 50;
    do
    {
      uint64_t v7 = *(void *)(v2 + 8 * v5);
      int v8 = *(char **)(v7 + 40);
      if ((unint64_t)&v8[-*(void *)(v7 + 32)] >= 2 && *(v8 - 2) == 11)
      {
        *(v8 - 2) = 60;
        int v8 = *(char **)(v7 + 40);
      }
      this = std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v7 + 32, v8, v6, &v6[*(__int16 *)(v4 + 48)], *(__int16 *)(v4 + 48));
      ++v5;
      uint64_t v2 = *((void *)a2 + 10);
    }
    while (v5 < (*((void *)a2 + 11) - v2) >> 3);
  }
  return this;
}

uint64_t SLMorphEng_UM::MorphLookup(SLMorphEng_UM *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4);
  size_t v10 = a3 - v9;
  std::string::basic_string[abi:ne180100](&__dst, (void *)&a2[a3 - v9], v9);
  unsigned int v11 = (char *)a5 + 16;
  MEMORY[0x223CA3F60]((char *)a5 + 16, a2, v10);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_dst = &__dst;
  }
  else {
    p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  unsigned int v13 = p_dst->__r_.__value_.__s.__data_[0];
  if ((v13 & 0x80000000) != 0) {
    int v14 = __maskrune(v13, 0x8000uLL);
  }
  else {
    int v14 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x8000;
  }
  if (v14) {
    int v15 = "UM";
  }
  else {
    int v15 = "um";
  }
  std::string::append((std::string *)((char *)a5 + 16), v15);
  if (*((char *)a5 + 39) < 0)
  {
    unsigned int v11 = (char *)*((void *)a5 + 2);
    uint64_t v16 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v16 = *((unsigned __int8 *)a5 + 39);
  }
  if ((**(unsigned int (***)(SLDictionary *, char *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, v11, v16, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v17 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p, 2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v17;
}

void sub_222A56A64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

char *SLMorphEng_UM::AddAffix(char *this, SLToken *a2)
{
  uint64_t v3 = *((void *)a2 + 10);
  uint64_t v2 = *((void *)a2 + 11);
  if (v2 != v3)
  {
    unint64_t v5 = this;
    unint64_t v6 = 0;
    uint64_t v7 = this + 50;
    do
    {
      uint64_t v8 = *(void *)(v3 + 8 * v6);
      this = (char *)(v8 + 32);
      uint64_t v9 = *(void *)(v8 + 40);
      if ((unint64_t)(v9 - *(void *)(v8 + 32)) >= 2)
      {
        *(void *)(v8 + 40) = v9 - 2;
        this = std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>((uint64_t)this, (char *)(v9 - 2), v7, &v7[*((__int16 *)v5 + 24)], *((__int16 *)v5 + 24));
        uint64_t v3 = *((void *)a2 + 10);
        uint64_t v2 = *((void *)a2 + 11);
      }
      ++v6;
    }
    while (v6 < (v2 - v3) >> 3);
  }
  return this;
}

uint64_t SLMorphEng_CALLY::MorphLookup(SLMorphEng_CALLY *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4) - 1;
  size_t v10 = a3 - v9;
  std::string::basic_string[abi:ne180100](&__dst, (void *)&a2[a3 - v9], v9);
  if ((**(unsigned int (***)(SLDictionary *, const char *, size_t, SLTokenBuilder *, SLDictionary *))a4)(a4, a2, v10, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v11 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p, 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v11;
}

void sub_222A56C3C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLMorphEng_OR::MorphLookup(SLMorphEng_OR *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4);
  size_t v10 = a3 - v9;
  std::string::basic_string[abi:ne180100](&__dst, (void *)&a2[a3 - v9], v9);
  uint64_t v11 = (char *)a5 + 16;
  MEMORY[0x223CA3F60]((char *)a5 + 16, a2, v10);
  if ((__dst.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_dst = &__dst;
  }
  else {
    p_dst = (std::string *)__dst.__r_.__value_.__r.__words[0];
  }
  unsigned int v13 = p_dst->__r_.__value_.__s.__data_[0];
  if ((v13 & 0x80000000) != 0) {
    int v14 = __maskrune(v13, 0x8000uLL);
  }
  else {
    int v14 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x8000;
  }
  if (v14) {
    std::string::value_type v15 = 69;
  }
  else {
    std::string::value_type v15 = 101;
  }
  std::string::append((std::string *)((char *)a5 + 16), 1uLL, v15);
  if (*((char *)a5 + 39) < 0)
  {
    uint64_t v11 = (char *)*((void *)a5 + 2);
    uint64_t v16 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v16 = *((unsigned __int8 *)a5 + 39);
  }
  if ((**(unsigned int (***)(SLDictionary *, char *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, v11, v16, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v22, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string v22 = __dst;
    }
    char v17 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&v22, 1);
    char v18 = v17;
    if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v22.__r_.__value_.__l.__data_);
      if (v18) {
        goto LABEL_19;
      }
    }
    else if (v17)
    {
LABEL_19:
      uint64_t v19 = 1;
      goto LABEL_28;
    }
  }
  if ((**(unsigned int (***)(SLDictionary *, const char *, size_t, SLTokenBuilder *, SLDictionary *))a4)(a4, a2, v10, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v19 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
LABEL_28:
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v19;
}

void sub_222A56E90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLMorphEng_Elvis::MorphLookup(SLMorphEng_Elvis *this, const char *a2, unint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = (std::string *)((char *)a5 + 16);
  MEMORY[0x223CA3F60]((char *)a5 + 16, a2, a3 - 1);
  if (a3 >= 2)
  {
    unsigned int v11 = a2[a3 - 2];
    if ((v11 & 0x80000000) != 0) {
      int v12 = __maskrune(v11, 0x8000uLL);
    }
    else {
      int v12 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v11 + 60) & 0x8000;
    }
    if (v12) {
      std::string::value_type v10 = 71;
    }
    else {
      std::string::value_type v10 = 103;
    }
  }
  else
  {
    std::string::value_type v10 = 71;
  }
  std::string::append(v9, 1uLL, v10);
  if (*((char *)a5 + 39) < 0)
  {
    int v14 = (std::string *)*((void *)a5 + 2);
    uint64_t v13 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v13 = *((unsigned __int8 *)a5 + 39);
    int v14 = v9;
  }
  uint64_t result = (**(uint64_t (***)(SLDictionary *, std::string *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, v14, v13, a5, a4);
  if (result)
  {
    if (*((char *)a5 + 39) < 0)
    {
      size_t v9 = (std::string *)*((void *)a5 + 2);
      uint64_t v16 = *((void *)a5 + 3);
    }
    else
    {
      uint64_t v16 = *((unsigned __int8 *)a5 + 39);
    }
    v9->__r_.__value_.__s.__data_[v16 - 1] = 39;
  }
  return result;
}

uint64_t SLMorphEng_Elvis::POSFromSuffix(SLMorphEng_Elvis *this, SLToken *a2)
{
  return 1;
}

void SLMorphEng_Elvis::AddAffix(SLMorphEng_Elvis *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    unint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(v2 + 8 * v3);
      uint64_t v5 = *(void *)(v4 + 40);
      if ((unint64_t)(v5 - *(void *)(v4 + 32)) >= 2 && *(unsigned char *)(v5 - 1) == 37)
      {
        *(unsigned char *)(v5 - 1) = 36;
        uint64_t v6 = *(void *)(v4 + 40);
        int v8 = *(unsigned __int8 *)(v6 - 2);
        uint64_t v7 = (unsigned char *)(v6 - 2);
        if (v8 == 4) {
          *uint64_t v7 = 25;
        }
      }
      ++v3;
      uint64_t v2 = *((void *)a2 + 10);
    }
    while (v3 < (*((void *)a2 + 11) - v2) >> 3);
  }
}

uint64_t SLMorphEng_Apostrophe::AddAffix(uint64_t this, SLToken *a2)
{
  if (**(unsigned char **)(this + 24) == 83)
  {
    uint64_t v3 = *((void *)a2 + 10);
    if (*((void *)a2 + 11) != v3)
    {
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = (SLWordTagSet *)(*(void *)(v3 + 8 * v4) + 4);
        this = SLWordTagSet::find(v5, 84);
        if ((this & 1) == 0)
        {
          uint64_t v6 = *(unsigned __int16 *)v5;
          if (v6 <= 6)
          {
            uint64_t v7 = v6 + 1;
            *(_WORD *)uint64_t v5 = v7;
            *((_WORD *)v5 + v7) = 84;
          }
        }
        ++v4;
        uint64_t v3 = *((void *)a2 + 10);
      }
      while (v4 < (*((void *)a2 + 11) - v3) >> 3);
    }
  }
  return this;
}

BOOL SLMorphEng_Saur::Match(SLMorphEng_Saur *this, const char *a2, unint64_t a3)
{
  uint64_t v3 = *((void *)this + 4);
  return v3 + 4 <= a3 && *(_DWORD *)&a2[a3 - v3 - 4] == 1381318995 && SLMorph::Match(this, a2, a3);
}

char *SLMorphEng_Saur::AddAffix(char *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    uint64_t v4 = (uint64_t)this;
    unint64_t v5 = 0;
    uint64_t v6 = this + 50;
    do
    {
      uint64_t v7 = *(void *)(v2 + 8 * v5);
      int v8 = *(char **)(v7 + 40);
      if (*(v8 - 2) == 9)
      {
        size_t v9 = (char *)memchr(*(void **)(v7 + 32), 1, (size_t)&v8[-*(void *)(v7 + 32) - 2]);
        if (v9) {
          std::string::value_type v10 = v9;
        }
        else {
          std::string::value_type v10 = v8 - 2;
        }
        if (v10 != v8)
        {
          char *v10 = 58;
          int v8 = *(char **)(v7 + 40);
        }
        char v11 = 1;
        std::vector<unsigned char>::insert((void *)(v7 + 32), v8 - 2, &v11);
        int v8 = *(char **)(v7 + 40);
      }
      this = std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v7 + 32, v8, v6, &v6[*(__int16 *)(v4 + 48)], *(__int16 *)(v4 + 48));
      ++v5;
      uint64_t v2 = *((void *)a2 + 10);
    }
    while (v5 < (*((void *)a2 + 11) - v2) >> 3);
  }
  return this;
}

char *std::vector<unsigned char>::insert(void *a1, char *__src, char *a3)
{
  uint64_t v4 = __src;
  uint64_t v6 = (char *)a1[1];
  unint64_t v7 = a1[2];
  if ((unint64_t)v6 >= v7)
  {
    std::string::value_type v10 = (char *)*a1;
    uint64_t v11 = (uint64_t)&v6[-*a1 + 1];
    if (v11 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    int v12 = (char *)(__src - v10);
    unint64_t v13 = v7 - (void)v10;
    if (2 * v13 > v11) {
      uint64_t v11 = 2 * v13;
    }
    if (v13 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v14 = v11;
    }
    char v31 = a1 + 2;
    if (v14) {
      std::string::value_type v15 = (char *)operator new(v14);
    }
    else {
      std::string::value_type v15 = 0;
    }
    uint64_t v27 = v15;
    uint64_t v28 = &v12[(void)v15];
    std::string __dst = &v12[(void)v15];
    __darwin_ct_rune_t v30 = &v15[v14];
    std::__split_buffer<unsigned char>::push_back((uint64_t)&v27, a3);
    uint64_t v16 = v28;
    char v17 = (char *)*a1;
    char v18 = v28;
    if ((char *)*a1 != v4)
    {
      uint64_t v19 = v4;
      char v18 = v28;
      do
      {
        char v20 = *--v19;
        *--char v18 = v20;
      }
      while (v19 != v17);
    }
    uint64_t v28 = v18;
    uint64_t v21 = (unsigned char *)a1[1];
    std::string v22 = (char *)__dst;
    uint64_t v23 = v21 - v4;
    if (v21 != v4)
    {
      memmove(__dst, v4, v21 - v4);
      char v18 = v28;
      uint64_t v4 = (char *)a1[1];
    }
    size_t v24 = (char *)*a1;
    *a1 = v18;
    a1[1] = &v22[v23];
    unsigned int v25 = (char *)a1[2];
    a1[2] = v30;
    std::string __dst = v4;
    __darwin_ct_rune_t v30 = v25;
    uint64_t v27 = v24;
    uint64_t v28 = v24;
    if (v4 != v24) {
      std::string __dst = v24;
    }
    if (v24) {
      operator delete(v24);
    }
    return v16;
  }
  else if (__src == v6)
  {
    *__src = *a3;
    a1[1] = __src + 1;
  }
  else
  {
    int v8 = __src + 1;
    if (v6)
    {
      *uint64_t v6 = *(v6 - 1);
      size_t v9 = v6 + 1;
    }
    else
    {
      size_t v9 = 0;
    }
    a1[1] = v9;
    if (v6 != v8) {
      memmove(__src + 1, __src, v6 - v8);
    }
    *uint64_t v4 = *a3;
  }
  return v4;
}

void sub_222A573D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLMorphEng_BILITY::MorphLookup(SLMorphEng_BILITY *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4) - 1;
  size_t v10 = a3 - v9;
  std::string::basic_string[abi:ne180100](&__dst, (void *)&a2[a3 - v9], v9);
  uint64_t v11 = (char *)a5 + 16;
  MEMORY[0x223CA3F60]((char *)a5 + 16, a2, v10);
  int v12 = &a2[v10];
  std::string::append((std::string *)((char *)a5 + 16), 1uLL, v12[1]);
  unsigned int v13 = v12[2];
  if ((v13 & 0x80000000) != 0) {
    int v14 = __maskrune(v13, 0x8000uLL);
  }
  else {
    int v14 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x8000;
  }
  if (v14) {
    std::string::value_type v15 = 69;
  }
  else {
    std::string::value_type v15 = 101;
  }
  std::string::append((std::string *)((char *)a5 + 16), 1uLL, v15);
  if (*((char *)a5 + 39) < 0)
  {
    uint64_t v11 = (char *)*((void *)a5 + 2);
    uint64_t v16 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v16 = *((unsigned __int8 *)a5 + 39);
  }
  if ((**(unsigned int (***)(SLDictionary *, char *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, v11, v16, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v17 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p, 2);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v17;
}

void sub_222A57584(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

BOOL SLMorphEng_BILITY::POSFromSuffix(SLMorphEng_BILITY *this, SLToken *a2)
{
  uint64_t v3 = (char *)*((void *)a2 + 10);
  uint64_t v2 = (char *)*((void *)a2 + 11);
  if (v2 == v3)
  {
    uint64_t v3 = (char *)*((void *)a2 + 11);
  }
  else
  {
    unint64_t v6 = 0;
    do
    {
      unint64_t v7 = &v3[8 * v6];
      int v8 = *(SLHomograph **)v7;
      if ((*((_DWORD *)this + 16) & **(_DWORD **)v7) != 0
        && *((void *)v8 + 5) - *((void *)v8 + 4) > 5uLL
        && ((v9 = *((void *)v8 + 5), int v12 = *(unsigned __int8 *)(v9 - 4), v10 = (unsigned char *)(v9 - 4), v11 = v12, v12 != 25)
          ? (BOOL v13 = v11 == 11)
          : (BOOL v13 = 1),
            v13 && v10[1] == 47 && v10[2] == 11 && v10[3] == 33))
      {
        *(_DWORD *)int v8 = *((_DWORD *)this + 15);
        ++v6;
      }
      else
      {
        int64_t v14 = v2 - (v7 + 8);
        if (v2 != v7 + 8) {
          memmove(v7, v7 + 8, v2 - (v7 + 8));
        }
        *((void *)a2 + 11) = &v7[v14];
        SLHomograph::~SLHomograph(v8);
        MEMORY[0x223CA4030]();
      }
      uint64_t v3 = (char *)*((void *)a2 + 10);
      uint64_t v2 = (char *)*((void *)a2 + 11);
    }
    while (v6 < (v2 - v3) >> 3);
  }
  return v3 != v2;
}

char *SLMorphEng_BILITY::AddAffix(char *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    uint64_t v4 = (uint64_t)this;
    unint64_t v5 = 0;
    unint64_t v6 = this + 50;
    do
    {
      uint64_t v7 = *(void *)(v2 + 8 * v5);
      uint64_t v8 = *(void *)(v7 + 32);
      uint64_t v9 = *(void *)(v7 + 40);
      uint64_t v10 = v9;
      while (v10 != v8)
      {
        int v11 = *(unsigned __int8 *)--v10;
        if (v11 == 1)
        {
          uint64_t v12 = v10 + 1;
          goto LABEL_8;
        }
      }
      uint64_t v12 = *(void *)(v7 + 32);
LABEL_8:
      if (v12 != v8)
      {
        *(unsigned char *)(v12 - 1) = 58;
        uint64_t v9 = *(void *)(v7 + 40);
      }
      *(void *)(v7 + 40) = v9 - 3;
      this = std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v7 + 32, (char *)(v9 - 3), v6, &v6[*(__int16 *)(v4 + 48)], *(__int16 *)(v4 + 48));
      ++v5;
      uint64_t v2 = *((void *)a2 + 10);
    }
    while (v5 < (*((void *)a2 + 11) - v2) >> 3);
  }
  return this;
}

uint64_t SLMorphEng_ITOUS::MorphLookup(SLMorphEng_ITOUS *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4) - 2;
  size_t v10 = a3 - v9;
  int v11 = (char *)&a2[a3 - v9];
  std::string::basic_string[abi:ne180100](&__dst, v11, v9);
  uint64_t v12 = (char *)a5 + 16;
  MEMORY[0x223CA3F60]((char *)a5 + 16, a2, v10);
  unsigned int v13 = *v11;
  if ((v13 & 0x80000000) != 0) {
    int v14 = __maskrune(v13, 0x8000uLL);
  }
  else {
    int v14 = *(_DWORD *)(MEMORY[0x263EF8318] + 4 * v13 + 60) & 0x8000;
  }
  if (v14) {
    std::string::value_type v15 = 89;
  }
  else {
    std::string::value_type v15 = 121;
  }
  std::string::append((std::string *)((char *)a5 + 16), 1uLL, v15);
  if (*((char *)a5 + 39) < 0)
  {
    uint64_t v12 = (char *)*((void *)a5 + 2);
    uint64_t v16 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v16 = *((unsigned __int8 *)a5 + 39);
  }
  if ((**(unsigned int (***)(SLDictionary *, char *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, v12, v16, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v17 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p, 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v17;
}

void sub_222A5793C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void SLMorphEng_ITOUS::AddAffix(SLMorphEng_ITOUS *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = *(void **)(v2 + 8 * v4);
      *(unsigned char *)(v5[5] - 1) = 25;
      uint64_t v7 = (unsigned char *)v5[5];
      unint64_t v6 = v5[6];
      if ((unint64_t)v7 >= v6)
      {
        unint64_t v9 = v5[4];
        size_t v10 = &v7[-v9];
        uint64_t v11 = (uint64_t)&v7[-v9 + 1];
        if (v11 < 0) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v12 = v6 - v9;
        if (2 * v12 > v11) {
          uint64_t v11 = 2 * v12;
        }
        if (v12 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v13 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v13 = v11;
        }
        if (v13) {
          int v14 = (char *)operator new(v13);
        }
        else {
          int v14 = 0;
        }
        std::string::value_type v15 = &v10[(void)v14];
        uint64_t v16 = &v10[(void)v14];
        *uint64_t v16 = 42;
        uint64_t v8 = v16 + 1;
        if (v7 != (unsigned char *)v9)
        {
          uint64_t v17 = &v7[~v9];
          do
          {
            char v18 = *--v7;
            (v17--)[(void)v14] = v18;
          }
          while (v7 != (unsigned char *)v9);
          uint64_t v7 = (unsigned char *)v5[4];
          std::string::value_type v15 = v14;
        }
        v5[4] = v15;
        v5[5] = v8;
        v5[6] = &v14[v13];
        if (v7) {
          operator delete(v7);
        }
      }
      else
      {
        *uint64_t v7 = 42;
        uint64_t v8 = v7 + 1;
      }
      v5[5] = v8;
      ++v4;
      uint64_t v2 = *((void *)a2 + 10);
    }
    while (v4 < (*((void *)a2 + 11) - v2) >> 3);
  }
}

uint64_t SLMorphEng_Tion::SLMorphEng_Tion(uint64_t a1, const char *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  uint64_t v11 = (void *)SLMorph::SLMorph(a1, a2, a3, a6, 1, a7, 0, a8);
  void *v11 = &unk_26D52B740;
  v11[11] = a4;
  *(void *)(a1 + 96) = strlen(a4);
  __int16 v12 = *(_WORD *)(a5 + 8);
  *(void *)(a1 + 104) = *(void *)a5;
  *(_WORD *)(a1 + 112) = v12;
  *(unsigned char *)(a1 + 114) = memchr((void *)(a1 + 50), 1, *(__int16 *)(a1 + 48)) != 0;
  return a1;
}

BOOL SLMorphEng_Tion::Match(SLMorphEng_Tion *this, const char *a2, unint64_t a3)
{
  unint64_t v3 = *((void *)this + 4);
  return v3 < a3
      && strncasecmp_l(&a2[a3 - v3], *((const char **)this + 3), v3 - 4, *(locale_t *)(*((void *)this + 5) + 8)) == 0;
}

uint64_t SLMorphEng_Tion::MorphLookup(SLMorphEng_Tion *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  size_t v9 = *((void *)this + 4);
  size_t v10 = a3 - v9;
  std::string::basic_string[abi:ne180100](&__dst, (void *)&a2[a3 - v9], v9);
  uint64_t v11 = (char *)a5 + 16;
  MEMORY[0x223CA3F60]((char *)a5 + 16, a2, v10);
  std::string::append((std::string *)((char *)a5 + 16), *((const std::string::value_type **)this + 11), *((void *)this + 12));
  if (*((char *)a5 + 39) < 0)
  {
    uint64_t v11 = (char *)*((void *)a5 + 2);
    uint64_t v12 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v12 = *((unsigned __int8 *)a5 + 39);
  }
  if ((**(unsigned int (***)(SLDictionary *, char *, uint64_t, SLTokenBuilder *, SLDictionary *))a4)(a4, v11, v12, a5, a4))
  {
    if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&__p, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
    }
    else {
      std::string __p = __dst;
    }
    uint64_t v13 = SLMorph::RestoreSuffix((uint64_t)this, (uint64_t)a5, (uint64_t)&__p, *((_DWORD *)this + 24));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (SHIBYTE(__dst.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  return v13;
}

void sub_222A57CCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

BOOL SLMorphEng_Tion::POSFromSuffix(SLMorphEng_Tion *this, SLToken *a2)
{
  uint64_t v2 = (char *)*((void *)a2 + 10);
  unint64_t v3 = (char *)*((void *)a2 + 11);
  if (v3 == v2)
  {
    uint64_t v2 = (char *)*((void *)a2 + 11);
  }
  else
  {
    unint64_t v6 = 0;
    uint64_t v7 = (char *)this + 106;
    do
    {
      uint64_t v8 = (SLHomograph **)&v2[8 * v6];
      size_t v9 = *v8;
      if ((*((_DWORD *)this + 16) & *(_DWORD *)*v8) != 0
        && !memcmp((const void *)(*((void *)v9 + 5) - *((__int16 *)this + 52)), v7, *((__int16 *)this + 52)))
      {
        *(_DWORD *)size_t v9 = *((_DWORD *)this + 15);
        ++v6;
      }
      else
      {
        if (v3 != (char *)(v8 + 1)) {
          memmove(v8, v8 + 1, v3 - (char *)(v8 + 1));
        }
        *((void *)a2 + 11) = v3 - 8;
        SLHomograph::~SLHomograph(v9);
        MEMORY[0x223CA4030]();
        uint64_t v2 = (char *)*((void *)a2 + 10);
        unint64_t v3 = (char *)*((void *)a2 + 11);
      }
    }
    while (v6 < (v3 - v2) >> 3);
  }
  return v3 != v2;
}

char *SLMorphEng_Tion::AddAffix(char *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    uint64_t v4 = (uint64_t)this;
    unint64_t v5 = 0;
    unint64_t v6 = this + 50;
    do
    {
      uint64_t v7 = *(void *)(v2 + 8 * v5);
      uint64_t v8 = *(unsigned char **)(v7 + 40);
      if (*(unsigned char *)(v4 + 114))
      {
        size_t v9 = memchr(*(void **)(v7 + 32), 1, (size_t)&v8[-*(void *)(v7 + 32)]);
        if (!v9) {
          size_t v9 = v8;
        }
        size_t v10 = v8;
        if (v9 != v8)
        {
          do
          {
            *size_t v9 = 58;
            size_t v9 = memchr(v9 + 1, 1, v8 - (v9 + 1));
            if (!v9) {
              size_t v9 = v8;
            }
          }
          while (v9 != v8);
          size_t v10 = *(char **)(v7 + 40);
        }
      }
      else
      {
        size_t v10 = *(char **)(v7 + 40);
      }
      uint64_t v11 = *(__int16 *)(v4 + 104);
      if (*(_WORD *)(v4 + 104))
      {
        uint64_t v12 = &v8[-v11];
        uint64_t v13 = &v12[v11];
        size_t v14 = v10 - v13;
        if (v10 != v13) {
          memmove(v12, v13, v14);
        }
        size_t v10 = &v12[v14];
        *(void *)(v7 + 40) = &v12[v14];
      }
      if (*(v10 - 1) == 58) {
        *(void *)(v7 + 40) = --v10;
      }
      this = std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(v7 + 32, v10, v6, &v6[*(__int16 *)(v4 + 48)], *(__int16 *)(v4 + 48));
      ++v5;
      uint64_t v2 = *((void *)a2 + 10);
    }
    while (v5 < (*((void *)a2 + 11) - v2) >> 3);
  }
  return this;
}

void SLMorphEng_Brit::SLMorphEng_Brit(SLMorphEng_Brit *this, const char *a2, const char *a3, const SLMorphTraits *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v10[0] = 0;
  SLMorph::SLMorph((uint64_t)this, a2, (uint64_t)v10, (uint64_t)a4, 16499, 16499, 0, a8);
  *(void *)this = &unk_26D52B7A8;
  *((void *)this + 11) = a3;
  *((void *)this + 12) = strlen(a3);
}

uint64_t SLMorphEng_Brit::MorphLookup(SLMorphEng_Brit *this, const char *a2, uint64_t a3, uint64_t (***a4)(SLDictionary *, std::string *, uint64_t, SLTokenBuilder *, SLDictionary *), SLTokenBuilder *a5)
{
  uint64_t v8 = (std::string *)((char *)a5 + 16);
  MEMORY[0x223CA3F60]((char *)a5 + 16, a2, a3 - *((void *)this + 4));
  std::string::append(v8, *((const std::string::value_type **)this + 11), *((void *)this + 12));
  if (*((char *)a5 + 39) < 0)
  {
    uint64_t v8 = (std::string *)*((void *)a5 + 2);
    uint64_t v9 = *((void *)a5 + 3);
  }
  else
  {
    uint64_t v9 = *((unsigned __int8 *)a5 + 39);
  }
  size_t v10 = **a4;
  return v10((SLDictionary *)a4, v8, v9, a5, (SLDictionary *)a4);
}

BOOL SLMorphEng_Brit::POSFromSuffix(SLMorphEng_Brit *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  uint64_t v3 = *((void *)a2 + 11);
  if (v3 == v2)
  {
    uint64_t v2 = *((void *)a2 + 11);
  }
  else
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(v2 + 8 * v5);
      if (SLWordTagSet::find((SLWordTagSet *)(v6 + 4), 68) || SLWordTagSet::find((SLWordTagSet *)(v6 + 4), 64))
      {
        uint64_t v7 = *((void *)a2 + 10);
        uint64_t v8 = *((void *)a2 + 11);
        uint64_t v9 = v7 + 8 * v5;
        uint64_t v10 = v8 - (v9 + 8);
        if (v8 != v9 + 8) {
          memmove((void *)(v7 + 8 * v5), (const void *)(v9 + 8), v8 - (v9 + 8));
        }
        *((void *)a2 + 11) = v9 + v10;
        if (v6)
        {
          SLHomograph::~SLHomograph((SLHomograph *)v6);
          MEMORY[0x223CA4030]();
        }
      }
      else
      {
        ++v5;
      }
      uint64_t v2 = *((void *)a2 + 10);
      uint64_t v3 = *((void *)a2 + 11);
    }
    while (v5 < (v3 - v2) >> 3);
  }
  return v3 != v2;
}

uint64_t SLTionRules::Lookup(SLTionRules *this, const char *a2, unint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  if (a3 < 5 || strncasecmp_l(&a2[a3 - 4], "TION", 4uLL, *(locale_t *)(*((void *)this + 5) + 8))) {
    return 0;
  }
  return SLEncyclopedia::Lookup(this, a2, a3, a4, a5);
}

uint64_t SLMorphEng_NameEnding::Lookup(SLMorphEng_NameEnding *this, const char *a2, unint64_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  if (a3 < 4) {
    return 0;
  }
  unint64_t v9 = a3 - 2;
  __darwin_ct_rune_t v10 = __toupper(a2[a3 - 2]);
  if (a2[a3 - 1] != 78) {
    return 0;
  }
  __darwin_ct_rune_t v11 = v10;
  int v12 = (char)v10;
  uint64_t result = (uint64_t)memchr("AEIO", (char)v10, 5uLL);
  if (!result) {
    return result;
  }
  uint64_t result = (uint64_t)memchr("DLNST", a2[a3 - 3], 6uLL);
  if (!result) {
    return result;
  }
  SLTokenBuilder::SLTokenBuilder((SLTokenBuilder *)v33, a4, 1);
  MEMORY[0x223CA3F60](v34, a2, a3);
  HIDWORD(v15) = v12 - 65;
  LODWORD(v15) = v12 - 65;
  unsigned int v14 = v15 >> 1;
  if (v14 >= 8) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = (&off_26463E0E8)[v14];
  }
  char v17 = *v16;
  if (!*v16)
  {
LABEL_36:
    SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)v33);
    return 0;
  }
  if (v11 << 24 == 1325400064 || v11 << 24 == 1090519040) {
    char v19 = 11;
  }
  else {
    char v19 = 25;
  }
  while (1)
  {
    char v20 = (v35 & 0x80u) == 0 ? v34 : (void *)v34[0];
    *((unsigned char *)v20 + v9) = v17;
    uint64_t v21 = (v35 & 0x80u) == 0 ? v34 : (void *)v34[0];
    uint64_t v22 = (v35 & 0x80u) == 0 ? v35 : v34[1];
    if ((**(unsigned int (***)(SLDictionary *, void *, uint64_t, unsigned char *, SLDictionary *))a5)(a5, v21, v22, v33, a5))
    {
      uint64_t v23 = v36[10];
      if (v36[11] != v23)
      {
        unint64_t v24 = 0;
        do
        {
          unsigned int v25 = *(void **)(v23 + 8 * v24);
          if (SLWordTagSet::find((SLWordTagSet *)((char *)v25 + 4), 64))
          {
            *(unsigned char *)(v25[5] - 2) = v19;
            ++v24;
          }
          else
          {
            __darwin_ct_rune_t v26 = v36;
            uint64_t v27 = v36[10];
            uint64_t v28 = v36[11];
            uint64_t v29 = v27 + 8 * v24;
            uint64_t v30 = v28 - (v29 + 8);
            if (v28 != v29 + 8) {
              memmove((void *)(v27 + 8 * v24), (const void *)(v29 + 8), v28 - (v29 + 8));
            }
            v26[11] = v29 + v30;
            if (v25)
            {
              SLHomograph::~SLHomograph((SLHomograph *)v25);
              MEMORY[0x223CA4030]();
            }
          }
          uint64_t v23 = v36[10];
          uint64_t v31 = v36[11];
        }
        while (v24 < (v31 - v23) >> 3);
        if (v23 != v31) {
          break;
        }
      }
    }
    int v32 = *++v16;
    char v17 = v32;
    if (!v32) {
      goto LABEL_36;
    }
  }
  v36[3] = "Dictionary+Morph";
  SLTokenBuilder::Forward((SLTokenBuilder *)v33);
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)v33);
  return 1;
}

void sub_222A58450(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)va);
  _Unwind_Resume(a1);
}

void SLMorphRulesEng::SLMorphRulesEng(SLMorphRulesEng *this)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  SLDictionary::SLDictionary(this);
  v1[3] = 0;
  v1[4] = 0;
  void *v1 = &unk_26D52B810;
  SLMorphTraits::SLMorphTraits((SLMorphTraits *)(v1 + 5), "en_US.UTF-8", 16499);
  operator new();
}

void sub_222A5ADA8(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v3, 0x10F1C40852DCFC7);
  SLMorphTraits::~SLMorphTraits(v2);
  SLMorphRules::~SLMorphRules(v1);
  _Unwind_Resume(a1);
}

void SLMorphRulesEng::~SLMorphRulesEng(locale_t *this)
{
  *this = (locale_t)&unk_26D52B810;
  SLMorphTraits::~SLMorphTraits(this + 5);
  SLMorphRules::~SLMorphRules((SLMorphRules *)this);
}

{
  uint64_t vars8;

  *this = (locale_t)&unk_26D52B810;
  SLMorphTraits::~SLMorphTraits(this + 5);
  SLMorphRules::~SLMorphRules((SLMorphRules *)this);
}

{
  uint64_t vars8;

  *this = (locale_t)&unk_26D52B810;
  SLMorphTraits::~SLMorphTraits(this + 5);
  SLMorphRules::~SLMorphRules((SLMorphRules *)this);
  JUMPOUT(0x223CA4030);
}

void SLFlatMorphRulesEng::SLFlatMorphRulesEng(SLFlatMorphRulesEng *this, SLDictionary *a2, char a3)
{
  SLDictionary::SLDictionary(this);
  v5[3] = 0;
  v5[4] = 0;
  v5[5] = a2;
  *unint64_t v5 = &unk_26D52B838;
  if ((a3 & 1) == 0) {
    operator new();
  }
}

void sub_222A5B258(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v2, 0x10A1C40AFD1EA57);
  SLFlatMorphRules::~SLFlatMorphRules(v1);
  _Unwind_Resume(a1);
}

void SLMorphEng_S::~SLMorphEng_S(SLMorphEng_S *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_ES::~SLMorphEng_ES(SLMorphEng_ES *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_IES::~SLMorphEng_IES(SLMorphEng_IES *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_E::~SLMorphEng_E(SLMorphEng_E *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_ED::~SLMorphEng_ED(SLMorphEng_ED *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_Y::~SLMorphEng_Y(SLMorphEng_Y *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_IER::~SLMorphEng_IER(SLMorphEng_IER *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_ILY::~SLMorphEng_ILY(SLMorphEng_ILY *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_BLY::~SLMorphEng_BLY(SLMorphEng_BLY *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_UM::~SLMorphEng_UM(SLMorphEng_UM *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_CALLY::~SLMorphEng_CALLY(SLMorphEng_CALLY *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_OR::~SLMorphEng_OR(SLMorphEng_OR *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_Elvis::~SLMorphEng_Elvis(SLMorphEng_Elvis *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_Apostrophe::~SLMorphEng_Apostrophe(SLMorphEng_Apostrophe *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_Saur::~SLMorphEng_Saur(SLMorphEng_Saur *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_BILITY::~SLMorphEng_BILITY(SLMorphEng_BILITY *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_ITOUS::~SLMorphEng_ITOUS(SLMorphEng_ITOUS *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_Tion::~SLMorphEng_Tion(SLMorphEng_Tion *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_Brit::~SLMorphEng_Brit(SLMorphEng_Brit *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLTionRules::~SLTionRules(SLTionRules *this)
{
  SLEncyclopedia::~SLEncyclopedia(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng_NameEnding::~SLMorphEng_NameEnding(SLMorphEng_NameEnding *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLFlatMorphRulesEng::~SLFlatMorphRulesEng(SLFlatMorphRulesEng *this)
{
  SLFlatMorphRules::~SLFlatMorphRules(this);
  JUMPOUT(0x223CA4030);
}

void SLMorphEng::~SLMorphEng(SLMorphEng *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

void SLPrefixMorphEng::~SLPrefixMorphEng(SLPrefixMorphEng *this)
{
  SLDictionary::~SLDictionary(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLPrefixMorphEng::Match(SLPrefixMorphEng *this, const char *a2)
{
  return (*(uint64_t (**)(SLPrefixMorphEng *, const char *))(*(void *)this + 64))(this, a2);
}

uint64_t SLPrefixMorphEng::MorphLookup(SLPrefixMorphEng *this, const char *a2, uint64_t a3, SLDictionary *a4, SLTokenBuilder *a5)
{
  return (*(uint64_t (**)(SLPrefixMorphEng *, const char *, uint64_t, void, SLDictionary *, SLTokenBuilder *))(*(void *)this + 72))(this, a2, a3, *((unsigned __int8 *)this + 84), a4, a5);
}

uint64_t SLPrefixMorphEng::AddAffix(SLPrefixMorphEng *this, SLToken *a2)
{
  return (*(uint64_t (**)(SLPrefixMorphEng *, SLToken *))(*(void *)this + 80))(this, a2);
}

void SLMorphEng_BILITY::SLMorphEng_BILITY(SLMorphEng_BILITY *this, const SLMorphTraits *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  __int16 v8 = 8;
  uint64_t v9 = 0x330192104012F3CLL;
  *(void *)SLMorph::SLMorph((uint64_t)this, "BILITY", (uint64_t)&v8, (uint64_t)a2, 1, 64, 0, a8) = &unk_26D52C040;
}

void std::__split_buffer<unsigned char>::push_back(uint64_t a1, char *a2)
{
  uint64_t v4 = *(char **)(a1 + 16);
  if (v4 == *(char **)(a1 + 24))
  {
    uint64_t v6 = *(unsigned char **)a1;
    unint64_t v5 = *(char **)(a1 + 8);
    uint64_t v7 = &v5[-*(void *)a1];
    if ((unint64_t)v5 <= *(void *)a1)
    {
      if ((unint64_t)(2 * (v4 - v6)) <= 1) {
        size_t v13 = 1;
      }
      else {
        size_t v13 = 2 * (v4 - v6);
      }
      unsigned int v14 = (char *)operator new(v13);
      unint64_t v15 = &v14[v13 >> 2];
      uint64_t v17 = v4 - v5;
      BOOL v16 = v4 == v5;
      uint64_t v4 = v15;
      if (!v16)
      {
        uint64_t v4 = &v15[v17];
        char v18 = &v14[v13 >> 2];
        do
        {
          char v19 = *v5++;
          *v18++ = v19;
          --v17;
        }
        while (v17);
      }
      *(void *)a1 = v14;
      *(void *)(a1 + 8) = v15;
      *(void *)(a1 + 16) = v4;
      *(void *)(a1 + 24) = &v14[v13];
      if (v6)
      {
        operator delete(v6);
        uint64_t v4 = *(char **)(a1 + 16);
      }
    }
    else
    {
      if ((uint64_t)(v7 + 1) >= 0) {
        uint64_t v8 = (uint64_t)(v7 + 1);
      }
      else {
        uint64_t v8 = (uint64_t)(v7 + 2);
      }
      uint64_t v9 = -(v8 >> 1);
      uint64_t v10 = &v5[-(v8 >> 1)];
      uint64_t v11 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-(v8 >> 1)], *(const void **)(a1 + 8), v4 - v5);
        uint64_t v4 = *(char **)(a1 + 8);
      }
      int v12 = &v4[v9];
      uint64_t v4 = &v10[v11];
      *(void *)(a1 + 8) = v12;
      *(void *)(a1 + 16) = &v10[v11];
    }
  }
  *uint64_t v4 = *a2;
  ++*(void *)(a1 + 16);
}

const char *SLTagEng::Name(SLTagEng *this)
{
  if (this <= 0x3FF) {
    return SLTag::Name(this);
  }
  if (this <= 0x423) {
    return SLTagEng::sName[(int)this - 1024];
  }
  return "";
}

char *SLBndEng::Name(SLBndEng *this)
{
  uint64_t v1 = &SLBnd::sName[this];
  if (this >= 4) {
    uint64_t v1 = &SLBndEng::sName[(int)this - 4];
  }
  return *v1;
}

void SLCreateElementNamesEng(void)
{
}

uint64_t SLPhonEng::Find(SLPhonEng *this, int a2)
{
  unsigned __int8 v2 = 72;
  switch((int)this)
  {
    case '!':
      return v2;
    case '%':
      return 0;
    case '+':
      return 74;
    case ',':
      return 68;
    case '-':
      return 61;
    case '.':
      return 70;
    case '/':
      return 62;
    case '1':
      return 1;
    case '2':
      return 58;
    case '3':
      return 59;
    case ':':
      return 69;
    case '=':
      return 60;
    case '>':
      return 65;
    case '?':
      return 71;
    case 'A':
      if (a2 > 86)
      {
        switch(a2)
        {
          case 'W':
            return 16;
          case 'X':
            return 11;
          case 'Y':
            return 14;
          default:
            goto LABEL_74;
        }
      }
      else
      {
        switch(a2)
        {
          case 'A':
            return 7;
          case 'E':
            return 6;
          case 'O':
            return 9;
          default:
            goto LABEL_74;
        }
      }
    case 'C':
      return 52;
    case 'D':
      return 41;
    case 'E':
      if (a2 == 89) {
        unsigned __int8 v2 = 13;
      }
      else {
        unsigned __int8 v2 = -1;
      }
      BOOL v6 = a2 == 72;
      unsigned __int8 v7 = 5;
      goto LABEL_60;
    case 'I':
      unsigned __int8 v2 = 4;
      char v3 = 3;
      if (a2 == 88) {
        char v4 = 25;
      }
      else {
        char v4 = -1;
      }
      BOOL v5 = a2 == 89;
      goto LABEL_34;
    case 'J':
      return 53;
    case 'N':
      return 37;
    case 'O':
      if (a2 == 89) {
        unsigned __int8 v2 = 15;
      }
      else {
        unsigned __int8 v2 = -1;
      }
      BOOL v6 = a2 == 87;
      unsigned __int8 v7 = 17;
LABEL_60:
      if (v6) {
        return v7;
      }
      return v2;
    case 'S':
      return 44;
    case 'T':
      return 40;
    case 'U':
      unsigned __int8 v2 = 10;
      char v3 = 8;
      if (a2 == 87) {
        char v4 = 18;
      }
      else {
        char v4 = -1;
      }
      BOOL v5 = a2 == 88;
LABEL_34:
      if (!v5) {
        char v3 = v4;
      }
      if (a2 != 72) {
        unsigned __int8 v2 = v3;
      }
      break;
    case 'Z':
      unsigned __int8 v2 = 45;
      break;
    case '\\':
      unsigned __int8 v2 = 63;
      break;
    case '_':
      unsigned __int8 v2 = 2;
      break;
    case 'b':
      unsigned __int8 v2 = 47;
      break;
    case 'd':
      unsigned __int8 v2 = 49;
      break;
    case 'f':
      unsigned __int8 v2 = 38;
      break;
    case 'g':
      unsigned __int8 v2 = 51;
      break;
    case 'h':
      unsigned __int8 v2 = 34;
      break;
    case 'k':
      unsigned __int8 v2 = 50;
      break;
    case 'l':
      unsigned __int8 v2 = 33;
      break;
    case 'm':
      unsigned __int8 v2 = 35;
      break;
    case 'n':
      unsigned __int8 v2 = 36;
      break;
    case 'p':
      unsigned __int8 v2 = 46;
      break;
    case 'r':
      unsigned __int8 v2 = 32;
      break;
    case 's':
      unsigned __int8 v2 = 42;
      break;
    case 't':
      unsigned __int8 v2 = 48;
      break;
    case 'v':
      unsigned __int8 v2 = 39;
      break;
    case 'w':
      unsigned __int8 v2 = 30;
      break;
    case 'y':
      unsigned __int8 v2 = 31;
      break;
    case 'z':
      unsigned __int8 v2 = 43;
      break;
    case '~':
      unsigned __int8 v2 = 75;
      break;
    default:
LABEL_74:
      unsigned __int8 v2 = -1;
      break;
  }
  return v2;
}

char *SLElementNamesEng::PhonName(SLElementNamesEng *this, int a2)
{
  return SLPhonEng::sName[a2];
}

char *SLElementNamesEng::PhonText(SLElementNamesEng *this, int a2)
{
  return SLPhonEng::sText[a2];
}

char *SLElementNamesEng::POSName(SLElementNamesEng *this, int a2)
{
  return SLPOSEng::sName[a2];
}

const char *SLElementNamesEng::TagName(SLElementNamesEng *this, SLTag *a2)
{
  if (a2 <= 0x3FF) {
    return SLTag::Name(a2);
  }
  if (a2 <= 0x423) {
    return SLTagEng::sName[(int)a2 - 1024];
  }
  return "";
}

char *SLElementNamesEng::BndName(SLElementNamesEng *this, unsigned int a2)
{
  unsigned __int8 v2 = &SLBnd::sName[a2];
  if (a2 >= 4) {
    unsigned __int8 v2 = &SLBndEng::sName[a2 - 4];
  }
  return *v2;
}

void SLElementNamesEng::~SLElementNamesEng(SLElementNamesEng *this)
{
  SLElementNames::~SLElementNames(this);
  JUMPOUT(0x223CA4030);
}

void SLPostLexerImpl::SLPostLexerImpl(SLPostLexerImpl *this, SLLexer *a2, SLDictLookup *a3, SLPronouncer *a4)
{
  SLLexerInstance::SLLexerInstance(this, 0, -1);
  *uint64_t v8 = &unk_26D52C548;
  SLLexerBuffer::SLLexerBuffer((SLLexerBuffer *)(v8 + 12), a2, 1);
  *(void *)this = &unk_26D52C3F0;
  *((void *)this + 12) = &unk_26D52C4D8;
  *((void *)this + 21) = a3;
  *((void *)this + 22) = a4;
  SLDissecter::Create(a4, v9);
}

void sub_222A5C0B0(_Unwind_Exception *a1)
{
  SLLexerBuffer::~SLLexerBuffer(v2);
  SLLexer::~SLLexer(v1);
  _Unwind_Resume(a1);
}

void SLPostLexerImpl::clear(SLPostLexerImpl *this)
{
  *((_WORD *)this + 121) = 256;
  *((unsigned char *)this + 244) = 0;
  SLLexerBuffer::clear((SLPostLexerImpl *)((char *)this + 96));
}

void SLPostLexerImpl::~SLPostLexerImpl(SLPostLexerImpl *this)
{
  *(void *)this = &unk_26D52C3F0;
  unsigned __int8 v2 = (SLPostLexerImpl *)((char *)this + 96);
  *((void *)this + 12) = &unk_26D52C4D8;
  uint64_t v3 = *((void *)this + 23);
  if (v3) {
    MEMORY[0x223CA4030](v3, 0x1000C405D080610);
  }
  for (uint64_t i = 0; i != -96; i -= 24)
  {
    if (*((char *)this + i + 431) < 0) {
      operator delete(*(void **)((char *)this + i + 408));
    }
  }
  BOOL v5 = (void *)*((void *)this + 27);
  if (v5)
  {
    *((void *)this + 28) = v5;
    operator delete(v5);
  }
  SLLexerBuffer::~SLLexerBuffer(v2);
  SLLexer::~SLLexer(this);
}

{
  uint64_t vars8;

  SLPostLexerImpl::~SLPostLexerImpl(this);
  JUMPOUT(0x223CA4030);
}

void non-virtual thunk to'SLPostLexerImpl::~SLPostLexerImpl(SLPostLexerImpl *this)
{
}

{
  uint64_t vars8;

  SLPostLexerImpl::~SLPostLexerImpl((SLPostLexerImpl *)((char *)this - 96));
  JUMPOUT(0x223CA4030);
}

char *SLPostLexerImpl::NextToken(SLPostLexerImpl *this)
{
  unsigned __int8 v2 = "\xBC";
  if (*((unsigned char *)this + 243))
  {
    uint64_t v3 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
    if (v3)
    {
      char v4 = v3;
      if (*(unsigned char *)v3 == 13 && **((_WORD **)v3 + 7) == 9)
      {
        *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
        std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
        SLToken::~SLToken(v4);
        MEMORY[0x223CA4030]();
      }
    }
    *((unsigned char *)this + 243) = 0;
  }
  while (1)
  {
    BOOL v5 = SLLexerBuffer::operator[]((void *)this + 12, 0);
    if (!v5)
    {
      *((_WORD *)this + 121) = 256;
      *((unsigned char *)this + 244) = 0;
      SLLexerBuffer::clear((SLPostLexerImpl *)((char *)this + 96));
      return 0;
    }
    std::string::size_type v6 = (std::string::size_type)v5;
    *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
    std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
    if ((*(unsigned char *)(v6 + 16) & 0x40) != 0) {
      break;
    }
    if (*((unsigned char *)this + 240))
    {
      if (v6 != *((void *)this + 31))
      {
        *((void *)this + 31) = v6;
        __p.__r_.__value_.__r.__words[0] = v6;
        std::deque<SLToken *>::push_front((uint64_t)this + 120, &__p);
        return (char *)v6;
      }
      unsigned __int8 v7 = *(const void **)(v6 + 48);
      if (v7)
      {
        CFRelease(v7);
        *(void *)(v6 + 48) = 0;
      }
      *((void *)this + 31) = 0;
    }
    SLTokenList::SLTokenList((SLTokenList *)&__p);
    int v9 = 1;
    int v10 = 0;
    switch(*(unsigned char *)v6)
    {
      case 0:
        SLPostLexerImpl::HandleAlpha(this, (SLToken *)v6);
        goto LABEL_78;
      case 1:
        SLPostLexerImpl::HandleNumber(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 2:
        SLPostLexerImpl::HandleAlphaNumeric(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 4:
      case 5:
        SLPostLexerImpl::HandleInsert(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 6:
        SLPostLexerImpl::HandleParagraph(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 7:
        SLPostLexerImpl::HandleURL(this, (int64x2_t *)v6, (SLTokenList **)&__p);
        goto LABEL_78;
      case 0xA:
        SLPostLexerImpl::HandleCitChar(this, (SLToken *)v6, (SLTokenList *)&__p);
      case 0xB:
        goto LABEL_58;
      case 0xC:
        int v10 = 1;
LABEL_58:
        SLPostLexerImpl::HandleLiteral(this, (SLToken *)v6, v10, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0xD:
        (*(void (**)(SLPostLexerImpl *, std::string::size_type, void))(*(void *)this + 104))(this, v6, 0);
        goto LABEL_78;
      case 0xE:
        (*(void (**)(void, std::string::size_type, std::string *))(**((void **)this + 22) + 24))(*((void *)this + 22), v6, &__p);
        SLToken::~SLToken((SLToken *)v6);
        MEMORY[0x223CA4030]();
        goto LABEL_78;
      case 0x11:
        SLPostLexerImpl::HandleRomanNumeral(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x12:
        SLPostLexerImpl::HandleTime(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x13:
        SLPostLexerImpl::HandleElapsedTime(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x14:
        SLPostLexerImpl::HandleNumericPair(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x15:
        SLPostLexerImpl::HandleDimensions(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x16:
        (*(void (**)(SLPostLexerImpl *, std::string::size_type, std::string *))(*(void *)this + 136))(this, v6, &__p);
        goto LABEL_78;
      case 0x17:
        SLPostLexerImpl::HandleMusicalKey(v8, (SLToken *)v6, (SLTokenList *)&__p);
      case 0x18:
        SLPostLexerImpl::HandleDate(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x19:
        *((_DWORD *)this + 64) = *(_DWORD *)(v6 + 12);
        break;
      case 0x1A:
        SLPostLexerImpl::HandleFraction(this, (SLToken *)v6);
        goto LABEL_78;
      case 0x1B:
        SLPostLexerImpl::HandleLegalSection(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x1C:
        SLPostLexerImpl::HandleGeoLoc(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x1D:
        SLPostLexerImpl::HandleDottedNumbers(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x1E:
        SLPostLexerImpl::HandleRange(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x1F:
        SLPostLexerImpl::HandleNumericBullet(this, (SLToken *)v6, (SLTokenList *)&__p);
      case 0x20:
        SLPostLexerImpl::HandleEmoji(this, (SLToken *)v6, (SLTokenList *)&__p);
        goto LABEL_78;
      case 0x21:
        SLPostLexerImpl::HandleIPA(this, (int64x2_t *)v6, (SLTokenList *)&__p);
LABEL_78:
        if (__p.__r_.__value_.__r.__words[2]) {
          SLPostLexerImpl::push_front(this, (const SLTokenList *)&__p);
        }
        int v9 = 0;
        std::string::size_type v6 = (std::string::size_type)v2;
        break;
      default:
        break;
    }
    std::__list_imp<SLToken *>::clear(&__p);
    unsigned __int8 v2 = (char *)v6;
LABEL_82:
    if (v9 == 1) {
      return v2;
    }
  }
  unsigned int Class = SLTokenGetClass((unsigned __int8 *)v6);
  if (Class != 32)
  {
    if (Class <= 0x2F && ((1 << Class) & 0xC80000000000) != 0) {
      *((unsigned char *)this + 260) = 0;
    }
    return (char *)v6;
  }
  int v12 = *(_DWORD *)(v6 + 16);
  if ((v12 & 0x4000) != 0) {
    *(_DWORD *)(v6 + 16) = v12 & 0xFFFFBFF7 | 8;
  }
  if (!*(unsigned char *)v6
    && (unint64_t)(((uint64_t)(*(void *)(v6 + 64) - *(void *)(v6 + 56)) >> 1) - 3) <= 0xFFFFFFFFFFFFFFFDLL
    && !SLToken::HasTag((SLToken *)v6, 70))
  {
    *((unsigned char *)this + 244) = (*(_DWORD *)(v6 + 16) & 0x18) == 16;
  }
  if (SLPostLexerImpl::HasPossessive(this, (SLToken *)v6)) {
    SLPostLexerImpl::HandlePossessive(this, (SLToken *)v6);
  }
  size_t v13 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
  if (v13)
  {
    unsigned int v14 = v13;
    if (*(unsigned __int8 *)v13 - 1 <= 1) {
      (*(void (**)(SLPostLexerImpl *, std::string::size_type, SLToken *))(*(void *)this + 120))(this, v6, v13);
    }
    if (*((unsigned char *)v14 + 18))
    {
      unint64_t v15 = (SLPostLexerImpl *)SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
      if (v15 && !*(unsigned char *)v15)
      {
        SLPostLexerImpl::Transcribe(v15, v15, 2, 0, ((uint64_t)(*((void *)v15 + 8) - *((void *)v15 + 7)) >> 1) - 1, &__p);
        SLTmpLookup::SLTmpLookup(v26, &__p, *((void *)this + 21));
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        if (v26[0]) {
          BOOL v16 = v27;
        }
        else {
          BOOL v16 = 0;
        }
        SLPostLexerImpl::PredictRomanNumeral(this, v14, (SLToken *)v6, v16);
        SLTmpLookup::~SLTmpLookup((SLTmpLookup *)v26);
      }
      else
      {
        SLPostLexerImpl::PredictRomanNumeral(this, v14, (SLToken *)v6, 0);
      }
    }
    if (!*(unsigned char *)v14)
    {
      uint64_t v17 = (char *)*((void *)v14 + 7);
      if (*((void *)v14 + 8) - (void)v17 == 4
        && (SLChar::sCharClass[*(_WORD *)v17 & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)v17 >> 6] << 6)] & 0x9F) == 1
        && (*((unsigned char *)v14 + 17) & 0x40) == 0)
      {
        (*(void (**)(SLPostLexerImpl *, std::string::size_type, SLToken *))(*(void *)this + 128))(this, v6, v14);
      }
    }
  }
  if ((*((unsigned char *)this + 257) & 1) != 0 && SLToken::HasTag((SLToken *)v6, 68))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 4521985;
    if ((SLToken::SelectHomographs((SLToken *)v6, 0x7FFFFFFF, (const SLWordTagSet *)&__p) & 1) == 0)
    {
      SLToken::SetType((SLToken *)v6, 11);
      uint64_t v18 = *(void *)(v6 + 64);
      if (*(_WORD *)(v18 - 4) == 46)
      {
        uint64_t v19 = *(void *)(v6 + 56) + 2 * ((v18 - *(void *)(v6 + 56)) >> 1);
        uint64_t v20 = v19 - 4;
        uint64_t v21 = v18 - (v19 - 2);
        if (v18 != v19 - 2) {
          memmove((void *)(v19 - 4), (const void *)(v19 - 2), v18 - (v19 - 2));
        }
        *(void *)(v6 + 64) = v20 + v21;
      }
      __p.__r_.__value_.__r.__words[0] = v6;
      std::deque<SLToken *>::push_front((uint64_t)this + 120, &__p);
      int v9 = 2;
      goto LABEL_82;
    }
  }
  int v22 = *(unsigned __int8 *)(v6 + 2);
  if (v22 == 5)
  {
    char v23 = 1;
LABEL_93:
    *(unsigned char *)(v6 + 2) = v23;
    return (char *)v6;
  }
  if (v22 != 1)
  {
    if (*(unsigned char *)(v6 + 2)) {
      return (char *)v6;
    }
    char v23 = *((unsigned char *)this + 260);
    goto LABEL_93;
  }
  *((unsigned char *)this + 260) = 2;
  return (char *)v6;
}

void sub_222A5C998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, char a18)
{
}

BOOL SLPostLexerImpl::HasPossessive(SLPostLexerImpl *this, SLToken *a2)
{
  char v4 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
  BOOL v5 = 0;
  if ((*((unsigned char *)a2 + 16) & 1) == 0)
  {
    std::string::size_type v6 = v4;
    if (v4)
    {
      if (*(unsigned char *)v4) {
        return 0;
      }
      if (*((void *)v4 + 8) - *((void *)v4 + 7) != 6) {
        return 0;
      }
      if ((*((unsigned char *)v4 + 16) & 0x40) != 0) {
        return 0;
      }
      unsigned __int8 v7 = (SLPostLexerImpl *)(*(uint64_t (**)(void))(**((void **)this + 22) + 176))(*((void *)this + 22));
      if (!v7) {
        return 0;
      }
      SLPostLexerImpl::Transcribe(v7, v6, 2, 0, ((uint64_t)(*((void *)v6 + 8) - *((void *)v6 + 7)) >> 1) - 1, &__p);
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) == 2) {
          return LOWORD(__p.__r_.__value_.__l.__data_) == 21287;
        }
        return 0;
      }
      BOOL v5 = __p.__r_.__value_.__l.__size_ == 2 && *(_WORD *)__p.__r_.__value_.__l.__data_ == 21287;
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  return v5;
}

void SLPostLexerImpl::HandlePossessive(SLPostLexerImpl *this, SLToken *a2)
{
  char v4 = (char **)SLLexerBuffer::operator[]((void *)this + 12, 0);
  *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
  std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
  *((_WORD *)v4[7] + 1) += SLChar::sToUpper[*((_WORD *)v4[7] + 1) & 0x3F | (SLChar::sUniMap[(unint64_t)*((unsigned __int16 *)v4[7] + 1) >> 6] << 6)];
  SLToken::AppendToken(a2, v4);
  (*(void (**)(void, SLToken *))(**((void **)this + 22) + 192))(*((void *)this + 22), a2);
  SLToken::~SLToken((SLToken *)v4);
  JUMPOUT(0x223CA4030);
}

void SLPostLexerImpl::PredictRomanNumeral(SLPostLexerImpl *this, SLToken *a2, SLToken *a3, SLToken *a4)
{
  int v8 = *((_DWORD *)a2 + 4);
  if ((v8 & 0x1000) != 0)
  {
    char IsRomanOrdinal = SLPostLexerImpl::IsRomanOrdinal(this, a2);
    int v8 = *((_DWORD *)a2 + 4);
    if ((IsRomanOrdinal & 1) == 0) {
      goto LABEL_8;
    }
  }
  if ((v8 & 0x200) != 0
    && ((*(uint64_t (**)(void))(**((void **)this + 22) + 176))(*((void *)this + 22)) & 1) == 0)
  {
LABEL_7:
    int v8 = *((_DWORD *)a2 + 4);
LABEL_8:
    unsigned int v10 = v8 & 0xFFFEFFFF;
LABEL_9:
    *((_DWORD *)a2 + 4) = v10;
    goto LABEL_36;
  }
  if (a3)
  {
    if (SLToken::HasTag(a3, 84)) {
      goto LABEL_7;
    }
    if (SLToken::HasTag(a3, 82))
    {
      uint64_t v11 = (_WORD *)*((void *)a2 + 7);
      if (*((void *)a2 + 8) - (void)v11 == 4 && *v11 == 73 && !*((unsigned char *)a3 + 5)) {
        goto LABEL_7;
      }
      SLToken::SetType(a2, 17);
      int v12 = 5373953;
      goto LABEL_34;
    }
  }
  if (a4 && SLToken::HasTag(a4, 88))
  {
    SLToken::SetType(a2, 17);
    int v13 = *((_DWORD *)a2 + 4);
    if ((v13 & 0x400) == 0) {
      *((_DWORD *)a2 + 4) = v13 | 0x20000;
    }
    v23[0] = 5767169;
    unsigned int v14 = a4;
    goto LABEL_35;
  }
  if (a3)
  {
    unint64_t v15 = (unsigned __int16 *)*((void *)a2 + 7);
    int v16 = *v15;
    if (memchr("XVI", v16, 4uLL))
    {
      uint64_t v17 = *((void *)a2 + 8) - (void)v15;
      if (v17 == 4)
      {
        if ((*((unsigned char *)a2 + 16) & 1) == 0)
        {
          if (SLPostLexerImpl::IsInitial(this, a2, 1uLL)) {
            return;
          }
          int v16 = **((unsigned __int16 **)a2 + 7);
        }
        if (v16 == 73 || v16 == 88)
        {
          if (!SLToken::HasTag(a3, 80)) {
            goto LABEL_7;
          }
          goto LABEL_31;
        }
      }
      if (SLToken::HasTag(a3, 80))
      {
LABEL_31:
        SLToken::SetType(a2, 17);
        int v18 = *((_DWORD *)a2 + 4);
        if ((v18 & 0x400) == 0) {
          *((_DWORD *)a2 + 4) = v18 | 0x420000;
        }
        int v12 = 5242881;
LABEL_34:
        v23[0] = v12;
        unsigned int v14 = a3;
LABEL_35:
        SLToken::SelectHomographs(v14, 0x7FFFFFFF, (const SLWordTagSet *)v23);
        goto LABEL_36;
      }
      if (a4 && v17 == 4 && SLToken::HasTag(a4, 64)) {
        goto LABEL_7;
      }
      BOOL HasTag = SLToken::HasTag(a3, 64);
      if (HasTag)
      {
        SLToken::SetType(a2, 17);
        v23[0] = 4194305;
        SLToken::SelectHomographs(a3, 1, (const SLWordTagSet *)v23);
      }
      else
      {
        if (!SLPostLexerImpl::LooksLikeName((SLPostLexerImpl *)HasTag, a3, 0)) {
          goto LABEL_36;
        }
        SLToken::SetType(a2, 17);
      }
      int v22 = *((_DWORD *)a2 + 4);
      if ((v22 & 0x400) == 0)
      {
        unsigned int v10 = v22 | 0x420000;
        goto LABEL_9;
      }
    }
  }
LABEL_36:
  int v19 = *((_DWORD *)a2 + 4);
  if (*(unsigned char *)a2 == 17)
  {
    if ((*((_DWORD *)a2 + 4) & 0x1400) != 0x1000) {
      return;
    }
    unsigned int v20 = v19 | 0x20000;
  }
  else
  {
    unsigned int v20 = v19 & 0xFFFFFBFF;
  }
  *((_DWORD *)a2 + 4) = v20;
}

void *SLPostLexerImpl::HandleAlpha(SLPostLexerImpl *this, SLToken *a2)
{
  SLTokenList::SLTokenList((SLTokenList *)v32);
  char v4 = (SLPostLexerImpl *)SLLexerBuffer::operator[]((void *)this + 12, 0);
  BOOL v5 = v4;
  if (v4)
  {
    char v4 = (SLPostLexerImpl *)SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
    std::string::size_type v6 = v4;
    unsigned __int8 v7 = (char *)a2 + 16;
    if ((*((unsigned char *)a2 + 18) & 1) != 0 && !*(unsigned char *)v5)
    {
      SLPostLexerImpl::Transcribe(v4, v5, 2, 0, ((uint64_t)(*((void *)v5 + 8) - *((void *)v5 + 7)) >> 1) - 1, &__p);
      SLTmpLookup::SLTmpLookup(v30, &__p, *((void *)this + 21));
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v30[0])
      {
        SLPostLexerImpl::PredictRomanNumeral(this, a2, 0, v31);
        if (*(unsigned char *)a2 == 17)
        {
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
          std::deque<SLToken *>::push_front((uint64_t)this + 120, &__p);
          SLTmpLookup::~SLTmpLookup((SLTmpLookup *)v30);
          return std::__list_imp<SLToken *>::clear(v32);
        }
      }
      SLTmpLookup::~SLTmpLookup((SLTmpLookup *)v30);
    }
  }
  else
  {
    std::string::size_type v6 = 0;
    unsigned __int8 v7 = (char *)a2 + 16;
  }
  SLPostLexerImpl::Classify(v4, a2);
  uint64_t v9 = (uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1;
  unint64_t v10 = v9 - 1;
  if (v9 == 4)
  {
    if (v5 && *(unsigned char *)v5 == 1)
    {
      Unit = (char **)SLPostLexerImpl::FindUnit(this, a2, 0, v10, 36);
      if (Unit) {
        goto LABEL_24;
      }
      unint64_t v13 = ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1;
    }
    else
    {
      unint64_t v13 = 3;
    }
    uint64_t v14 = SLPostLexerImpl::FindUnit(this, a2, 0, v13, 60);
    if (v14 && (SLPostLexerImpl::HandleDayAbbr((uint64_t)this, v14, (uint64_t)a2) & 1) != 0) {
      return std::__list_imp<SLToken *>::clear(v32);
    }
    goto LABEL_35;
  }
  if (v9 != 3)
  {
    if (v9 == 2)
    {
      if (*((unsigned char *)a2 + 5))
      {
        uint64_t IsInitial = SLPostLexerImpl::IsInitial(this, a2, 0);
        if (IsInitial) {
          return std::__list_imp<SLToken *>::clear(v32);
        }
      }
      if (v6)
      {
        if (*(unsigned char *)v5 == 13
          && *(unsigned char *)v6 == 13
          && ((*((_DWORD *)v5 + 4) | *(_DWORD *)v7) & 1) == 0
          && **((_WORD **)v5 + 7) == 46)
        {
          *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
          std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
          SLToken::~SLToken(v5);
          MEMORY[0x223CA4030]();
          SLToken::SetType(a2, 11);
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
          std::deque<SLToken *>::push_front((uint64_t)this + 120, &__p);
          return std::__list_imp<SLToken *>::clear(v32);
        }
      }
      else if (!v5)
      {
        goto LABEL_47;
      }
      if (*v7)
      {
        int v16 = 1;
        if (!v5) {
          goto LABEL_87;
        }
LABEL_51:
        if (!v16) {
          goto LABEL_87;
        }
        if (*(unsigned char *)v5) {
          goto LABEL_87;
        }
        if (*((void *)v5 + 8) - *((void *)v5 + 7) != 4) {
          goto LABEL_87;
        }
        SLPostLexerImpl::Classify((SLPostLexerImpl *)IsInitial, v5);
        if (*((unsigned __int8 *)a2 + 5) != *((unsigned __int8 *)v5 + 5)) {
          goto LABEL_87;
        }
        int v17 = **((unsigned __int16 **)a2 + 7);
        int v18 = **((unsigned __int16 **)v5 + 7);
        SLToken::SetType(a2, 11);
        uint64_t v19 = 1;
        do
        {
          unsigned int v20 = (unsigned __int8 *)SLLexerBuffer::operator[]((void *)this + 12, v19 - 1);
          uint64_t v21 = v20;
          if (!v20) {
            break;
          }
          if (*v20) {
            break;
          }
          if (*((void *)v20 + 8) - *((void *)v20 + 7) != 4) {
            break;
          }
          SLPostLexerImpl::Classify((SLPostLexerImpl *)v20, (SLToken *)v20);
          if (*((unsigned __int8 *)a2 + 5) != v21[5]) {
            break;
          }
          SLToken::SetType((SLToken *)v21, 11);
          ++v19;
        }
        while ((v21[16] & 1) != 0);
        if (v17 == v18 && v19 == 2) {
          *((unsigned char *)SLLexerBuffer::operator[]((void *)this + 12, 0) + 2) = 3;
        }
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
        std::deque<SLToken *>::push_front((uint64_t)this + 120, &__p);
        return std::__list_imp<SLToken *>::clear(v32);
      }
LABEL_47:
      uint64_t IsInitial = (*(uint64_t (**)(SLPostLexerImpl *, void))(*(void *)this + 80))(this, **((unsigned __int16 **)a2 + 7));
      if (!IsInitial)
      {
        SLToken::SetType(a2, 11);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)a2;
        std::deque<SLToken *>::push_front((uint64_t)this + 120, &__p);
        return std::__list_imp<SLToken *>::clear(v32);
      }
      int v16 = *v7 & 1;
      if (!v5)
      {
LABEL_87:
        SLPostLexerImpl::HandleApostrophes(this, a2, (SLTokenList *)v32);
        SLPostLexerImpl::push_front(this, (const SLTokenList *)v32);
        return std::__list_imp<SLToken *>::clear(v32);
      }
      goto LABEL_51;
    }
LABEL_35:
    if (!v5 && (v7[2] & 4) == 0) {
      goto LABEL_87;
    }
    uint64_t v15 = SLPostLexerImpl::FindUnit(this, a2, 0, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, 62);
    if (!v15 || (SLPostLexerImpl::HandleMonthAbbr((uint64_t)this, v15, (uint64_t)a2) & 1) == 0) {
      goto LABEL_87;
    }
    return std::__list_imp<SLToken *>::clear(v32);
  }
  if (!v5 || *((unsigned char *)a2 + 5) != 2)
  {
    if (v5 && *(unsigned char *)v5 == 1)
    {
LABEL_42:
      Unit = (char **)SLPostLexerImpl::FindUnit(this, a2, 0, v10, 36);
      if (!Unit) {
        goto LABEL_87;
      }
LABEL_24:
      SLPostLexerImpl::HandleCurrency((uint64_t)this, Unit, a2);
      return std::__list_imp<SLToken *>::clear(v32);
    }
LABEL_76:
    if (v6 && (*v7 & 1) == 0 && *(unsigned char *)v5 == 13 && **((_WORD **)v5 + 7) == 46 && *(unsigned char *)v6 == 1)
    {
      SLToken::AppendToken(a2, (char **)v5);
      __darwin_ct_rune_t v26 = (char **)SLPostLexerImpl::FindUnit(this, a2, 0, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, 36);
      if (v26)
      {
        *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
        std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
        SLToken::~SLToken(v5);
        MEMORY[0x223CA4030]();
        SLPostLexerImpl::HandleCurrency((uint64_t)this, v26, a2);
        return std::__list_imp<SLToken *>::clear(v32);
      }
      uint64_t v27 = *((void *)a2 + 8);
      *(_WORD *)(v27 - 4) = 0;
      *((void *)a2 + 8) = v27 - 2;
      --*((void *)a2 + 5);
      *((_DWORD *)a2 + 4) &= ~1u;
    }
    goto LABEL_87;
  }
  int v12 = *(unsigned __int8 *)v5;
  if (v12 != 2)
  {
    if (v12 == 1)
    {
      if ((*((unsigned char *)v5 + 17) & 0x10) == 0 && *((void *)v5 + 8) - *((void *)v5 + 7) == 12) {
        goto LABEL_67;
      }
      goto LABEL_42;
    }
    goto LABEL_76;
  }
  if (*((void *)v5 + 8) - *((void *)v5 + 7) != 22) {
    goto LABEL_76;
  }
LABEL_67:
  uint64_t v22 = SLPostLexerImpl::FindUnit(this, a2, 0, v10, 58);
  if (!v22) {
    goto LABEL_87;
  }
  if (*(unsigned char *)v5 == 2)
  {
    uint64_t v23 = 0;
    uint64_t v24 = *((void *)v5 + 7);
    do
    {
      if (v23 == 10)
      {
        if (SLChar::sCharClass[*(_WORD *)(v24 + 10) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v24 + 10) >> 6] << 6)] != 6) {
          goto LABEL_87;
        }
      }
      else if (SLChar::sCharClass[*(_WORD *)(v24 + v23) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v24 + v23) >> 6] << 6)] != 2)
      {
        goto LABEL_87;
      }
      v23 += 2;
    }
    while (v23 != 20);
    char v25 = 7;
  }
  else
  {
    char v25 = 11;
  }
  SLToken::SetType(v5, v25);
  (*(void (**)(void, uint64_t, void *, void, void))(**((void **)this + 22) + 232))(*((void *)this + 22), v22, v32, *((void *)a2 + 4), *((void *)a2 + 5));
  SLPostLexerImpl::push_front(this, (const SLTokenList *)v32);
  SLToken::~SLToken(a2);
  MEMORY[0x223CA4030]();
  return std::__list_imp<SLToken *>::clear(v32);
}

void sub_222A5D610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18)
{
}

void SLPostLexerImpl::HandleNumber(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  if ((*((unsigned char *)this + 256) & 0x20) != 0)
  {
    if (SLPostLexerImpl::HasPossessive(this, a2))
    {
      uint64_t v14 = (char **)SLLexerBuffer::operator[]((void *)this + 12, 0);
      *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
      std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
      SLToken::AppendToken(a2, v14);
      if (v14)
      {
        SLToken::~SLToken((SLToken *)v14);
        MEMORY[0x223CA4030]();
      }
    }
    goto LABEL_20;
  }
  int v6 = *((_DWORD *)a2 + 4);
  if ((v6 & 0x800000) == 0)
  {
    if ((v6 & 0x1000) != 0
      || ((*(uint64_t (**)(SLPostLexerImpl *, SLToken *))(*(void *)this + 200))(this, a2) & 1) == 0)
    {
      if ((SLPostLexerImpl::HandleTokenInDictionary(this, a2) & 1) != 0
        || (SLPostLexerImpl::HandleURLInSymbols(this, a2, a3) & 1) != 0)
      {
        return;
      }
      unsigned __int8 v7 = SLLexerBuffer::operator[]((void *)this + 12, 0);
      uint64_t v8 = (uint64_t)v7;
      unint64_t v9 = *((unsigned int *)a2 + 4);
      int v10 = 0;
      if (v7)
      {
        int v11 = *(unsigned __int8 *)v7;
        if (*(unsigned char *)v7) {
          BOOL v12 = v11 == 11;
        }
        else {
          BOOL v12 = 1;
        }
        int v13 = v12;
        if (v11 != 13 || (v9 & 1) != 0)
        {
          BOOL v73 = 0;
        }
        else
        {
          BOOL v73 = memchr("%+", *(unsigned __int16 *)v7[7], 3uLL) != 0;
          int v10 = 1;
        }
      }
      else
      {
        int v13 = 0;
        BOOL v73 = 0;
      }
      int v17 = v9 & 0x20000;
      uint64_t v74 = (v9 >> 17) & 1;
      if ((v9 & 0x1000) == 0)
      {
        uint64_t v18 = ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1;
        if (v17) {
          goto LABEL_32;
        }
        if ((v9 & 1) != 0 && v13 == 1) {
          goto LABEL_59;
        }
        if (!v10) {
          goto LABEL_109;
        }
        if (**(_WORD **)(v8 + 56) != 35)
        {
LABEL_32:
          if (((v10 ^ 1 | ((v9 & 0x80) >> 7)) & 1) == 0)
          {
            int v19 = **(unsigned __int16 **)(v8 + 56);
            if (v19 == **(char **)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 22) + 216))(*((void *)this + 22), 207)&& (*(unsigned char *)(v8 + 16) & 1) == 0)
            {
              SLPostLexerImpl::HandleThousandsSeparators(this, a2, 35);
              return;
            }
          }
        }
        else
        {
LABEL_59:
          if (*((unsigned char *)this + 257)) {
            goto LABEL_109;
          }
          if ((~v9 & 0x200001) != 0)
          {
            uint64_t v38 = *(void *)(v8 + 64) - *(void *)(v8 + 56);
          }
          else
          {
            unint64_t v37 = *(_WORD **)(v8 + 56);
            uint64_t v38 = *(void *)(v8 + 64) - (void)v37;
            if (v38 == 4)
            {
              if ((SLChar::sCharClass[*v37 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v37 >> 6] << 6)] & 0x1F) == 1) {
                goto LABEL_109;
              }
              uint64_t v38 = 4;
            }
          }
          Unit = (unsigned __int8 **)SLPostLexerImpl::FindUnit(this, (SLToken *)v8, 0, (v38 >> 1) - 1, 124);
          if (Unit
            || (Unit = (unsigned __int8 **)SLPostLexerImpl::FindUnit(this, (SLToken *)v8, 0, ((uint64_t)(*(void *)(v8 + 64) - *(void *)(v8 + 56)) >> 1) - 1, 35)) != 0)
          {
            int v60 = **Unit;
            if ((v60 - 43) > 0x15 || ((1 << (v60 - 43)) & 0x200005) == 0)
            {
              v82[0] = 0;
              if (*(unsigned char *)(v8 + 16))
              {
                int v68 = 0;
                uint64_t UnitModifier = 0;
              }
              else
              {
                uint64_t v66 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
                uint64_t v67 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 2uLL);
                uint64_t UnitModifier = SLPostLexerImpl::FindUnitModifier(this, v66, v67, v82);
                int v68 = v82[0];
                int v60 = **Unit;
              }
              if (v60 != 33
                || v68
                || !SLLexerBuffer::operator[]((void *)this + 12, 1uLL)
                || *(unsigned char *)SLLexerBuffer::operator[]((void *)this + 12, 1uLL) == 13)
              {
                uint64_t v69 = *(void *)(v8 + 40);
                unint64_t v75 = *(void *)(v8 + 32);
                *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
                std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
                if (!v68)
                {
                  unint64_t v70 = *(unsigned __int16 *)(*(void *)(v8 + 64) - 4);
                  if ((SLChar::sCharClass[v70 & 0x3F | (SLChar::sUniMap[v70 >> 6] << 6)] & 0x9F) == 0x81
                    && SLPostLexerImpl::FollowedByPeriod(this, (SLToken *)v8))
                  {
                    uint64_t v71 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
                    *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
                    std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
                    if (v71)
                    {
                      SLToken::~SLToken(v71);
                      MEMORY[0x223CA4030]();
                    }
                    ++v69;
                  }
                }
                SLToken::~SLToken((SLToken *)v8);
                MEMORY[0x223CA4030]();
                SLDissecter::DissectNumber(*((void *)this + 23), (uint64_t)a2, 0, v18, (uint64_t)&v76);
                (*(void (**)(void, SLToken *, SLTokenList *, SLToken **, void, void))(**((void **)this + 22) + 48))(*((void *)this + 22), a2, a3, &v76, 0, 0);
                BOOL v48 = BYTE2(v76) == 0;
                int v51 = (char)v68;
                uint64_t v52 = this;
                uint64_t v53 = (uint64_t)Unit;
                char v54 = a3;
                unint64_t v50 = v75;
                uint64_t v49 = v69;
                uint64_t v55 = UnitModifier;
                goto LABEL_87;
              }
            }
          }
        }
LABEL_109:
        SLDissecter::DissectNumber(*((void *)this + 23), (uint64_t)a2, 0, v18, (uint64_t)&v76);
        if (v8)
        {
          BOOL v62 = v73;
          if ((*((_DWORD *)a2 + 4) & 0x8000) == 0 && !*(unsigned char *)v8)
          {
            *(_DWORD *)(v8 + 16) |= 0x40000u;
            if (v80 - 1 <= 0x1F)
            {
              uint64_t v63 = SLPostLexerImpl::FindUnit(this, (SLToken *)v8, 0, ((uint64_t)(*(void *)(v8 + 64) - *(void *)(v8 + 56)) >> 1) - 1, 62);
              if (v63)
              {
                uint64_t v64 = v63;
                *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
                std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
                if (SLPostLexerImpl::HandleMonthAbbr((uint64_t)this, v64, v8))
                {
                  uint64_t v74 = 513;
                }
                else
                {
                  *(void *)int v82 = v8;
                  std::deque<SLToken *>::push_front((uint64_t)this + 120, v82);
                }
                goto LABEL_118;
              }
            }
          }
        }
        else
        {
          BOOL v62 = v73;
        }
        if (!v8)
        {
LABEL_123:
          unint64_t v65 = v74 | ((unint64_t)*((unsigned int *)a2 + 4) >> 3) & 0x80;
          if ((*((unsigned char *)this + 256) & 0x40) != 0 || v65 || v18 != 4 || v62 || v77 != 4 || v80 < 0x44C || v80 > 0x833)
          {
            (*(void (**)(void, SLToken *, SLTokenList *, SLToken **, unint64_t, void))(**((void **)this + 22) + 48))(*((void *)this + 22), a2, a3, &v76, v65, 0);
            if (v62 && !*(unsigned char *)(v8 + 1)) {
              *((unsigned char *)a3 + 24) = 2;
            }
            goto LABEL_135;
          }
          char v57 = *(void (**)(void))(**((void **)this + 22) + 96);
          goto LABEL_131;
        }
LABEL_118:
        if ((v9 & 1) == 0 && *(unsigned char *)v8 == 26 && !v78 && !v79) {
          *(_DWORD *)(v8 + 16) |= 0x400u;
        }
        goto LABEL_123;
      }
      SLDissecter::DissectUnit(*((void *)this + 23), (uint64_t)a2, (uint64_t)v82);
      uint64_t v21 = v83;
      uint64_t v20 = v84;
      char v81 = 0;
      if (v9)
      {
        uint64_t v24 = 0;
      }
      else
      {
        uint64_t v22 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
        uint64_t v23 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
        uint64_t v24 = SLPostLexerImpl::FindUnitModifier(this, v22, v23, &v81);
      }
      if (v86 == 1)
      {
        unint64_t v25 = *(unsigned __int16 *)(*((void *)a2 + 7) + 2 * v85);
        BOOL v26 = (SLChar::sCharClass[v25 & 0x3F | (SLChar::sUniMap[v25 >> 6] << 6)] & 0x1F) == 1;
      }
      else
      {
        BOOL v26 = 0;
      }
      char v27 = v81;
      if (v81 || (!v82[0] ? (char v28 = 1) : (char v28 = v26), (v28 & 1) == 0))
      {
        uint64_t v31 = (char **)SLPostLexerImpl::FindUnit(this, a2, v85, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, 124);
        if (!v31)
        {
          uint64_t v31 = (char **)SLPostLexerImpl::FindUnit(this, a2, v85, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, 35);
          if (v31 || !v82[0])
          {
LABEL_67:
            if (!v31) {
              goto LABEL_88;
            }
            goto LABEL_68;
          }
          uint64_t CommonCountable = SLPostLexerImpl::FindCommonCountable(this, a2, v85);
LABEL_66:
          uint64_t v31 = (char **)CommonCountable;
          goto LABEL_67;
        }
      }
      else
      {
        unint64_t v29 = v85;
        if (!v26)
        {
          unint64_t v32 = ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1;
          char v33 = this;
          unint64_t v34 = a2;
          int v35 = 35;
          goto LABEL_65;
        }
        uint64_t v30 = *((void *)a2 + 7);
        if ((SLChar::sCharClass[*(_WORD *)(v30 + 2 * v85) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v30 + 2 * v85) >> 6] << 6)] & 0x9F) != 0x81) {
          operator new();
        }
        uint64_t v31 = (char **)SLPostLexerImpl::FindUnit(this, a2, v85, ((*((void *)a2 + 8) - v30) >> 1) - 1, 35);
        if (!v31)
        {
          unint64_t v29 = v85;
          unint64_t v32 = ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1;
          char v33 = this;
          unint64_t v34 = a2;
          int v35 = 124;
LABEL_65:
          uint64_t CommonCountable = SLPostLexerImpl::FindUnit(v33, v34, v29, v32, v35);
          goto LABEL_66;
        }
      }
LABEL_68:
      uint64_t v39 = (uint64_t)*v31;
      int v40 = **v31;
      BOOL v41 = v17 != 0;
      if (v40 != 64)
      {
        uint64_t v42 = v21;
        uint64_t v43 = v24;
        if (v40 == 45)
        {
          BOOL v45 = 0;
          uint64_t v31 = 0;
          int v44 = 1;
        }
        else
        {
          int v44 = 0;
          if (v40 == 43)
          {
            uint64_t v31 = 0;
            v74 |= 2uLL;
            BOOL v45 = 1;
          }
          else
          {
            BOOL v45 = 0;
          }
        }
        goto LABEL_81;
      }
      unsigned int v46 = *(char *)(v39 + 1);
      if ((v46 & 0x80000000) != 0 || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v46 + 60) & 0x400) == 0)
      {
LABEL_76:
        uint64_t v42 = v21;
        uint64_t v43 = v24;
        int v44 = 0;
        uint64_t v31 = 0;
        BOOL v45 = v46 == 43;
        uint64_t v47 = 3;
        if (v46 != 43) {
          uint64_t v47 = 1;
        }
        uint64_t v74 = v47;
        BOOL v41 = 1;
LABEL_81:
        SLDissecter::DissectNumber(*((void *)this + 23), (uint64_t)a2, v42, v20, (uint64_t)&v76);
        if (!v41 && !v45 || !v82[0] && !v79)
        {
          if (!v31)
          {
            if (((v44 | v41 | !v45 | ((*((unsigned char *)this + 256) & 0x40) >> 6)) & 1) != 0
              || v20 != 4
              || v73
              || v77 != 4
              || v80 < 0x44C
              || v80 > 0x833)
            {
              (*(void (**)(void, SLToken *, SLTokenList *, SLToken **, uint64_t, uint64_t))(**((void **)this + 22) + 48))(*((void *)this + 22), a2, a3, &v76, v74, v86);
              if (v44)
              {
                uint64_t v58 = *(void *)(*(void *)a3 + 16);
                if (v58)
                {
                  (*(void (**)(SLPostLexerImpl *, uint64_t, unint64_t, unint64_t))(*(void *)this + 208))(this, v58, *((void *)a2 + 7) + 2 * v85, *((void *)a2 + 7) + 2 * v85 + 2 * v86);
                  *(_DWORD *)(v58 + 16) = *(_DWORD *)(v58 + 16) & 0xFFFFBFBF | 0x4000;
                  *(unsigned char *)(v58 + 3) = 0;
                }
              }
              goto LABEL_135;
            }
            char v57 = *(void (**)(void))(**((void **)this + 22) + 96);
LABEL_131:
            v57();
            goto LABEL_135;
          }
          (*(void (**)(void, SLToken *, SLTokenList *, SLToken **, void, void))(**((void **)this + 22)
                                                                                               + 48))(*((void *)this + 22), a2, a3, &v76, 0, 0);
          BOOL v48 = (v82[0] | BYTE2(v76)) == 0;
          uint64_t v49 = v86;
          unint64_t v50 = v85 + *((void *)a2 + 4);
          unint64_t v85 = v50;
          int v51 = v27;
          uint64_t v52 = this;
          uint64_t v53 = (uint64_t)v31;
          char v54 = a3;
          uint64_t v55 = v43;
LABEL_87:
          SLPostLexerImpl::AppendFullUnit((uint64_t)v52, v53, (uint64_t)v54, v50, v49, v48, v55, v51);
LABEL_135:
          SLToken::~SLToken(a2);
          MEMORY[0x223CA4030]();
          return;
        }
        goto LABEL_88;
      }
      if (*(unsigned __int16 *)(*((void *)a2 + 7) + 2 * v20 - 2) == v46)
      {
        LOBYTE(v46) = *(unsigned char *)(v39 + 2);
        goto LABEL_76;
      }
LABEL_88:
      SLDissecter::DissectNumber(*((void *)this + 23), (uint64_t)a2, v83, v84, (uint64_t)&v76);
      if (v78) {
        char v56 = 7;
      }
      else {
        char v56 = 2;
      }
      SLToken::SetType(a2, v56);
      *((_DWORD *)a2 + 4) &= ~0x1000u;
      uint64_t v87 = a2;
      uint64_t v15 = (char *)this + 120;
      int v16 = &v87;
      goto LABEL_21;
    }
LABEL_20:
    SLToken::SetType(a2, 11);
    int64_t v76 = a2;
    uint64_t v15 = (char *)this + 120;
    int v16 = &v76;
LABEL_21:
    std::deque<SLToken *>::push_front((uint64_t)v15, v16);
    return;
  }
  SLPostLexerImpl::HandleElapsedSymbol(this, a2, a3);
}

void sub_222A5E3A0(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void *SLPostLexerImpl::HandleFraction(SLPostLexerImpl *this, SLToken *a2)
{
  SLTokenList::SLTokenList((SLTokenList *)v31);
  unsigned int v4 = *((_DWORD *)a2 + 4);
  if ((v4 & 0x1000) != 0)
  {
    SLDissecter::DissectUnit(*((void *)this + 23), (uint64_t)a2, (uint64_t)v28);
    char v27 = 0;
    if (*((unsigned char *)a2 + 16))
    {
      uint64_t UnitModifier = 0;
    }
    else
    {
      unsigned __int8 v7 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
      uint64_t v8 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
      uint64_t UnitModifier = SLPostLexerImpl::FindUnitModifier(this, v7, v8, &v27);
    }
    Unit = (char **)SLPostLexerImpl::FindUnit(this, a2, v29, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, 124);
    if (!Unit
      && (Unit = (char **)SLPostLexerImpl::FindUnit(this, a2, v29, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, 35)) == 0|| ((v11 = **Unit - 43, BOOL v12 = v11 > 0x15, v13 = (1 << v11) & 0x200005, !v12) ? (v14 = v13 == 0) : (v14 = 1), !v14))
    {
      operator new();
    }
    (*(void (**)(void, SLToken *, void *))(**((void **)this + 22) + 80))(*((void *)this + 22), a2, v31);
    v29 += *((void *)a2 + 4);
    SLPostLexerImpl::AppendFullUnit((uint64_t)this, (uint64_t)Unit, (uint64_t)v31, v29, v30, (v4 >> 10) & 1, UnitModifier, v27);
  }
  else
  {
    BOOL v5 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
    int v6 = v5;
    if (!v5) {
      goto LABEL_4;
    }
    if (*(unsigned char *)v5) {
      goto LABEL_4;
    }
    uint64_t v15 = (unsigned char **)SLPostLexerImpl::FindUnit(this, v5, 0, ((uint64_t)(*((void *)v5 + 8) - *((void *)v5 + 7)) >> 1) - 1, 124);
    if (!v15)
    {
      uint64_t v15 = (unsigned char **)SLPostLexerImpl::FindUnit(this, v6, 0, ((uint64_t)(*((void *)v6 + 8) - *((void *)v6 + 7)) >> 1) - 1, 35);
      if (!v15) {
        goto LABEL_4;
      }
    }
    v28[0] = 0;
    if (*((unsigned char *)v6 + 16))
    {
      int v19 = 0;
      uint64_t v18 = 0;
    }
    else
    {
      int v16 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
      int v17 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 2uLL);
      uint64_t v18 = SLPostLexerImpl::FindUnitModifier(this, v16, v17, v28);
      int v19 = v28[0];
    }
    BOOL v20 = **v15 == 33 && v19 == 0;
    if (!v20
      || !SLLexerBuffer::operator[]((void *)this + 12, 1uLL)
      || *(unsigned char *)SLLexerBuffer::operator[]((void *)this + 12, 1uLL) == 13)
    {
      uint64_t v26 = v18;
      uint64_t v21 = *((void *)v6 + 4);
      uint64_t v22 = *((void *)v6 + 5);
      *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
      std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
      if (!v19)
      {
        unint64_t v23 = *(unsigned __int16 *)(*((void *)v6 + 8) - 4);
        if ((SLChar::sCharClass[v23 & 0x3F | (SLChar::sUniMap[v23 >> 6] << 6)] & 0x9F) == 0x81
          && SLPostLexerImpl::FollowedByPeriod(this, v6))
        {
          uint64_t v24 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
          *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
          std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
          if (v24)
          {
            SLToken::~SLToken(v24);
            MEMORY[0x223CA4030]();
          }
          ++v22;
        }
      }
      SLToken::~SLToken(v6);
      MEMORY[0x223CA4030]();
      (*(void (**)(void, SLToken *, void *))(**((void **)this + 22) + 80))(*((void *)this + 22), a2, v31);
      SLPostLexerImpl::AppendFullUnit((uint64_t)this, (uint64_t)v15, (uint64_t)v31, v21, v22, (v4 >> 10) & 1, v26, (char)v19);
    }
    else
    {
LABEL_4:
      (*(void (**)(void, SLToken *, void *))(**((void **)this + 22) + 80))(*((void *)this + 22), a2, v31);
    }
  }
  SLToken::~SLToken(a2);
  MEMORY[0x223CA4030]();
  SLPostLexerImpl::push_front(this, (const SLTokenList *)v31);
  return std::__list_imp<SLToken *>::clear(v31);
}

void sub_222A5E8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  std::__list_imp<SLToken *>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SLPostLexerImpl::HandleLegalSection(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t result = (*(uint64_t (**)(void, SLToken *, SLTokenList *))(**((void **)this + 22) + 144))(*((void *)this + 22), a2, a3);
  if (a2)
  {
    SLToken::~SLToken(a2);
    JUMPOUT(0x223CA4030);
  }
  return result;
}

SLToken *SLPostLexerImpl::HandleGeoLoc(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  int v6 = *((_DWORD *)a2 + 4);
  SLDissecter::DissectGeoLoc(*((void *)this + 23), (uint64_t)a2, (uint64_t)v12);
  if ((v6 & 0x400) != 0
    && ((*((unsigned char *)a2 + 17) & 2) == 0 || !v13)
    && *(unsigned __int16 *)(*((void *)a2 + 7) + 2 * (((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 2)) != *(unsigned __int16 *)(*((void *)a2 + 8) - 6))
  {
    uint64_t v7 = *((void *)this + 28);
    if (v7 != *((void *)this + 27))
    {
      if ((*(unsigned int (**)(SLPostLexerImpl *, void))(*(void *)this + 72))(this, *(unsigned __int16 *)(v7 - 2)))
      {
        operator new();
      }
    }
  }
  (*(void (**)(void, SLToken *, SLTokenList *, unsigned char *))(**((void **)this + 22) + 152))(*((void *)this + 22), a2, a3, v12);
  SLToken::~SLToken(a2);
  uint64_t result = (SLToken *)MEMORY[0x223CA4030]();
  if ((v6 & 0x400) == 0)
  {
    uint64_t result = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
    if (result)
    {
      unint64_t v9 = result;
      if (!*(unsigned char *)result && *((void *)result + 8) - *((void *)result + 7) == 4)
      {
        uint64_t result = (SLToken *)(*(uint64_t (**)(SLPostLexerImpl *, SLToken *))(*(void *)this + 192))(this, result);
        if (result)
        {
          *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
          std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
          uint64_t v10 = *((void *)this + 22);
          uint64_t Unit = SLPostLexerImpl::FindUnit(this, v9, 0, ((uint64_t)(*((void *)v9 + 8) - *((void *)v9 + 7)) >> 1) - 1, 94);
          (*(void (**)(uint64_t, uint64_t, SLTokenList *, void, void, void))(*(void *)v10 + 240))(v10, Unit, a3, 0, *((void *)v9 + 4), *((void *)v9 + 5));
          SLToken::~SLToken(v9);
          return (SLToken *)MEMORY[0x223CA4030]();
        }
      }
    }
  }
  return result;
}

void sub_222A5EBF0(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLPostLexerImpl::HandleDottedNumbers(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  std::string __p = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  SLDissecter::DissectDottedNumber(*((void *)this + 23), (uint64_t)a2, (uint64_t)&v6);
  (*(void (**)(void, SLToken *, SLTokenList *, uint64_t *))(**((void **)this + 22) + 160))(*((void *)this + 22), a2, a3, &v6);
  if (a2)
  {
    SLToken::~SLToken(a2);
    MEMORY[0x223CA4030]();
  }
  if (__p)
  {
    uint64_t v8 = __p;
    operator delete(__p);
  }
}

void sub_222A5ECC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SLPostLexerImpl::HandleNumericBullet(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  SLDissecter::DissectNumericBullet(*((void *)this + 23), (uint64_t)a2, (uint64_t)v3);
  operator new();
}

void sub_222A5EE38(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

uint64_t SLPostLexerImpl::HandleLiteral(SLPostLexerImpl *this, SLToken *a2, int a3, SLTokenList *a4)
{
  if (a3) {
    int v8 = 32;
  }
  else {
    int v8 = 0;
  }
  int v9 = (*((_DWORD *)a2 + 4) >> 3) & 0x80;
  if (SLPostLexerImpl::HasApostrophe(this, a2))
  {
    uint64_t v10 = -3;
    if (!a3) {
      uint64_t v10 = -2;
    }
    unint64_t v11 = *(unsigned __int16 *)(*((void *)a2 + 7) + 2 * (v10 + ((*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1)));
    if ((unsigned __int16)(SLChar::sToUpper[v11 & 0x3F | (SLChar::sUniMap[v11 >> 6] << 6)] + v11) == 83)
    {
      BOOL v12 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
      *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
      std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
      if (v12)
      {
        SLToken::~SLToken(v12);
        MEMORY[0x223CA4030]();
      }
    }
  }
  uint64_t v13 = v9 | v8;
  if (*((void *)a2 + 8) - *((void *)a2 + 7) == 4)
  {
    uint64_t v14 = 1;
    do
    {
      unint64_t v15 = v14;
      int v16 = SLLexerBuffer::operator[]((void *)this + 12, v14 - 1);
      if (!v16) {
        break;
      }
      int v17 = *(unsigned __int8 *)v16;
      if (v17 != 13 && v17 != 11) {
        break;
      }
      int v19 = (char *)v16[7];
      if ((char *)v16[8] - v19 != 4) {
        break;
      }
      int v20 = *(unsigned __int16 *)v19;
      uint64_t v14 = v15 + 1;
    }
    while (v20 == **((unsigned __int16 **)a2 + 7));
    if (v15 >= 4)
    {
      uint64_t v21 = SLLexerBuffer::operator[]((void *)this + 12, 0);
      uint64_t v22 = SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
      uint64_t v23 = *((void *)this + 20) - 1;
      ++*((void *)this + 19);
      *((void *)this + 20) = v23;
      std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
      *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
      std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
      do
      {
        uint64_t v24 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
        *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
        std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
        if (v24)
        {
          SLToken::~SLToken(v24);
          MEMORY[0x223CA4030]();
        }
        --v15;
      }
      while (v15 > 3);
      uint64_t v26 = v22;
      std::deque<SLToken *>::push_front((uint64_t)this + 120, &v26);
      uint64_t v26 = v21;
      std::deque<SLToken *>::push_front((uint64_t)this + 120, &v26);
    }
  }
  uint64_t result = (*(uint64_t (**)(void, SLToken *, SLTokenList *, uint64_t))(**((void **)this + 22) + 16))(*((void *)this + 22), a2, a4, v13);
  if (a2)
  {
    SLToken::~SLToken(a2);
    return MEMORY[0x223CA4030]();
  }
  return result;
}

void SLPostLexerImpl::HandleEmoji(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  memset(&__p, 0, sizeof(__p));
  uint64_t v6 = (unsigned __int16 *)*((void *)a2 + 7);
  switch((uint64_t)(*((void *)a2 + 8) - (void)v6) >> 1)
  {
    case 2:
      goto LABEL_9;
    case 3:
      unsigned int v7 = *v6;
      if (v7 >> 11 >= 0x1B)
      {
        unsigned int v8 = v6[1];
        if (v8 < 0xE000) {
          goto LABEL_32;
        }
      }
      SLChar::PushUTF8(&__p, v7);
      uint64_t v9 = 1;
      goto LABEL_8;
    case 4:
      unsigned int v10 = *v6;
      if (v10 >> 11 < 0x1B || (unsigned int v11 = v6[1], v11 >> 13 > 6))
      {
        SLChar::PushUTF8(&__p, v10);
        uint64_t v23 = *((void *)a2 + 7);
        uint64_t v14 = (unsigned __int16 *)(v23 + 2);
        unint64_t v15 = (unsigned __int16 *)(v23 + 4);
LABEL_31:
        unsigned int v7 = *v14;
        unsigned int v8 = *v15;
LABEL_32:
        SLChar::PushUTF8(&__p, v7, v8);
      }
      else
      {
        SLChar::PushUTF8(&__p, v10, v11);
        uint64_t v9 = 2;
LABEL_8:
        uint64_t v6 = (unsigned __int16 *)(*((void *)a2 + 7) + 2 * v9);
LABEL_9:
        SLChar::PushUTF8(&__p, *v6);
      }
LABEL_33:
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      uint64_t v27 = (*(uint64_t (**)(void, std::string *))(**((void **)this + 22) + 208))(*((void *)this + 22), p_p);
      if (v27)
      {
        (*(void (**)(void, uint64_t, SLTokenList *, void, void))(**((void **)this + 22) + 232))(*((void *)this + 22), v27, a3, *((void *)a2 + 4), *((void *)a2 + 5));
        SLToken::~SLToken(a2);
        MEMORY[0x223CA4030]();
      }
      else
      {
        (*(void (**)(SLPostLexerImpl *, SLToken *, SLTokenList *))(*(void *)this + 136))(this, a2, a3);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      return;
    case 5:
      unsigned int v12 = *v6;
      if (v12 != 55356) {
        goto LABEL_18;
      }
      unsigned int v12 = 55356;
      if (v6[1] != 56825 || v6[2] != 55356 || v6[3] != 56828) {
        goto LABEL_18;
      }
      if (isInMainlandChina(void)::onceToken != -1) {
        dispatch_once(&isInMainlandChina(void)::onceToken, &__block_literal_global);
      }
      if (isInMainlandChina(void)::isInMainlandChina) {
        goto LABEL_33;
      }
      uint64_t v6 = (unsigned __int16 *)*((void *)a2 + 7);
      unsigned int v12 = *v6;
LABEL_18:
      SLChar::PushUTF8(&__p, v12, v6[1]);
      uint64_t v13 = *((void *)a2 + 7);
      uint64_t v14 = (unsigned __int16 *)(v13 + 4);
      unint64_t v15 = (unsigned __int16 *)(v13 + 6);
      goto LABEL_31;
    case 6:
      SLChar::PushUTF8(&__p, *v6, v6[1]);
      SLChar::PushUTF8(&__p, *(unsigned __int16 *)(*((void *)a2 + 7) + 4));
      uint64_t v16 = *((void *)a2 + 7);
      uint64_t v14 = (unsigned __int16 *)(v16 + 6);
      unint64_t v15 = (unsigned __int16 *)(v16 + 8);
      goto LABEL_31;
    case 9:
      SLChar::PushUTF8(&__p, *v6, v6[1]);
      SLChar::PushUTF8(&__p, *(unsigned __int16 *)(*((void *)a2 + 7) + 4));
      uint64_t v17 = *((void *)a2 + 7);
      unsigned int v18 = *(unsigned __int16 *)(v17 + 6);
      if (v18 >> 11 < 0x1B || (unsigned int v19 = *(unsigned __int16 *)(v17 + 8), v19 >> 13 > 6))
      {
        SLChar::PushUTF8(&__p, v18);
        SLChar::PushUTF8(&__p, *(unsigned __int16 *)(*((void *)a2 + 7) + 8));
      }
      else
      {
        SLChar::PushUTF8(&__p, v18, v19);
      }
      SLChar::PushUTF8(&__p, *(unsigned __int16 *)(*((void *)a2 + 7) + 10));
      uint64_t v24 = *((void *)a2 + 7);
      uint64_t v14 = (unsigned __int16 *)(v24 + 12);
      unint64_t v15 = (unsigned __int16 *)(v24 + 14);
      goto LABEL_31;
    case 12:
      SLChar::PushUTF8(&__p, *v6, v6[1]);
      SLChar::PushUTF8(&__p, *(unsigned __int16 *)(*((void *)a2 + 7) + 4));
      uint64_t v20 = *((void *)a2 + 7);
      unsigned int v21 = *(unsigned __int16 *)(v20 + 6);
      if (v21 >> 11 < 0x1B || (unsigned int v22 = *(unsigned __int16 *)(v20 + 8), v22 >> 13 > 6))
      {
        SLChar::PushUTF8(&__p, v21);
        SLChar::PushUTF8(&__p, *(unsigned __int16 *)(*((void *)a2 + 7) + 8));
      }
      else
      {
        SLChar::PushUTF8(&__p, v21, v22);
      }
      SLChar::PushUTF8(&__p, *(unsigned __int16 *)(*((void *)a2 + 7) + 10));
      SLChar::PushUTF8(&__p, *(unsigned __int16 *)(*((void *)a2 + 7) + 12), *(unsigned __int16 *)(*((void *)a2 + 7) + 14));
      SLChar::PushUTF8(&__p, *(unsigned __int16 *)(*((void *)a2 + 7) + 16));
      uint64_t v25 = *((void *)a2 + 7);
      uint64_t v14 = (unsigned __int16 *)(v25 + 18);
      unint64_t v15 = (unsigned __int16 *)(v25 + 20);
      goto LABEL_31;
    default:
      goto LABEL_33;
  }
}

void sub_222A5F4F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SLPostLexerImpl::HandleAlphaNumeric(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  if ((SLPostLexerImpl::HandleTokenInDictionary(this, a2) & 1) != 0
    || (SLPostLexerImpl::HandleURLInSymbols(this, a2, a3) & 1) != 0)
  {
    return;
  }
  int v30 = 0;
  uint64_t v31 = this;
  int v35 = a3;
  int v32 = 0;
  unint64_t v6 = 0;
  uint64_t v27 = 0;
  unint64_t v28 = 0;
  uint64_t v29 = 0;
  int v7 = 0;
  uint64_t v8 = *((void *)a2 + 7);
  uint64_t v36 = a2;
  while (2)
  {
    unsigned int v9 = (unsigned __int16)SLChar::sCharClass[*(_WORD *)(v8 + 2 * v6) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v8 + 2 * v6) >> 6] << 6)];
    unint64_t v37 = v6;
    int v33 = v7;
    int v34 = v7;
    unsigned int v10 = v28;
    int v11 = HIDWORD(v28);
    int v13 = v27;
    int v12 = HIDWORD(v27);
    switch(v9 & 0x1F)
    {
      case 0u:
      case 6u:
        goto LABEL_5;
      case 1u:
        if ((v29 & 0x100000000) != 0)
        {
LABEL_5:
          if ((v29 & v32 & 1) == 0)
          {
            if ((v29 & 1) == 0) {
              operator new();
            }
LABEL_11:
            operator new();
          }
LABEL_10:
          operator new();
        }
        if ((v9 & 0x80) != 0)
        {
          v30 |= (v9 & 0x20) >> 5;
          if (v28 > 1 && HIDWORD(v28) == 0) {
            int v13 = v27 | 8;
          }
          int v11 = HIDWORD(v28) + 1;
        }
        else
        {
          v30 |= (v9 & 0x20) >> 5;
          if (HIDWORD(v28)) {
            int v13 = v27 | 8;
          }
          else {
            int v12 = HIDWORD(v27) + 1;
          }
          unsigned int v10 = v28 + 1;
        }
        LODWORD(v27) = v13 | (v9 >> 1) & 0x20;
        HIDWORD(v27) = v12;
        uint64_t v29 = 1;
        int v33 = v34;
        unint64_t v28 = __PAIR64__(v11, v10);
LABEL_16:
        uint64_t v14 = v36;
        ++v6;
        uint64_t v8 = *((void *)v36 + 7);
        int v7 = v33;
        if (v37 + 1 <= ((*((void *)v36 + 8) - v8) >> 1) - 1) {
          continue;
        }
        uint64_t v16 = (SLTokenList **)*((void *)v35 + 1);
        if (v16 == (SLTokenList **)v35) {
          goto LABEL_67;
        }
        uint64_t v17 = 0;
        char v18 = 1;
        while (2)
        {
          unsigned int v19 = v16[1];
          if (v18) {
            unsigned __int8 v20 = *((unsigned char *)v16[2] + 16) | (v19 == v35);
          }
          else {
            unsigned __int8 v20 = 0;
          }
          if (v17 == 1)
          {
            unsigned int v21 = v16[2];
            if (*((void *)v35 + 2) != 2) {
              goto LABEL_38;
            }
            if (*(unsigned char *)v21 != 1)
            {
              if (**(unsigned char **)(*((void *)v35 + 1) + 16))
              {
LABEL_38:
                *((unsigned char *)v21 + 2) = 4;
              }
              else
              {
                SLTokenList::SLTokenList((SLTokenList *)v39);
                SLTokenList::SLTokenList((SLTokenList *)v38);
                if (!SLPostLexerImpl::HandleLookup(v31, *(SLToken **)(*((void *)v35 + 1) + 16), 0, (SLTokenList *)v39)|| !SLToken::HasTag(*(SLToken **)(*((void *)v35 + 1) + 16), 64)|| !SLPostLexerImpl::HandleLookup(v31, *(SLToken **)(*(void *)v35 + 16), 0, (SLTokenList *)v38)|| !SLToken::HasTag(*(SLToken **)(*(void *)v35 + 16), 64))
                {
                  *((unsigned char *)v16[2] + 2) = 4;
                }
                std::__list_imp<SLToken *>::clear(v38);
                std::__list_imp<SLToken *>::clear(v39);
              }
            }
          }
          unsigned int v22 = v16[2];
          if (!*(unsigned char *)v22)
          {
            unsigned int v23 = *((_DWORD *)v22 + 4);
            uint64_t v24 = *((void *)v22 + 5);
            if ((v23 & 0x10) != 0 && (v24 & 0xFFFFFFFFFFFFFFFELL) == 2) {
              goto LABEL_49;
            }
            if (v24 != 1) {
              goto LABEL_50;
            }
            if ((v20 & (v19 != v35)) != 1 || **((unsigned char **)v19 + 2))
            {
LABEL_49:
              SLToken::SetType(v22, 11);
            }
            else if (v17)
            {
              if (((*(uint64_t (**)(SLPostLexerImpl *, void, void))(*(void *)v31 + 96))(v31, **((unsigned __int16 **)v22 + 7), (v23 >> 4) & 1) & 1) == 0)goto LABEL_47; {
LABEL_66:
              }
              *((_DWORD *)v16[2] + 4) |= 0x4000u;
              ++v17;
            }
            else
            {
              if ((*(uint64_t (**)(SLPostLexerImpl *, void, void))(*(void *)v31 + 88))(v31, **((unsigned __int16 **)v22 + 7), (v23 >> 4) & 1))goto LABEL_66; {
LABEL_47:
              }
              SLToken::SetType(v16[2], 11);
              *((unsigned char *)v16[2] + 2) = 5;
            }
          }
LABEL_50:
          uint64_t v25 = v16[2];
          if (v19 != v35) {
            *((_DWORD *)v25 + 4) |= 0x200000u;
          }
          int v26 = *(unsigned __int8 *)v25;
          if (v26 == 12)
          {
            v17 += *((void *)v25 + 5) / 2;
          }
          else if (v26 == 11)
          {
            v17 += *((void *)v25 + 5);
          }
          else
          {
            ++v17;
          }
          char v18 = *((unsigned char *)v25 + 16) & 1;
          uint64_t v16 = (SLTokenList **)v16[1];
          if (v16 != (SLTokenList **)v35) {
            continue;
          }
          break;
        }
        uint64_t v14 = v36;
LABEL_67:
        if (*((unsigned char *)v31 + 241)) {
          operator new();
        }
        if (v14)
        {
          SLToken::~SLToken(v14);
          MEMORY[0x223CA4030]();
        }
        return;
      case 2u:
        if ((v29 & 1) == 0)
        {
          uint64_t v29 = 0x100000000;
          int v33 = v34;
          goto LABEL_16;
        }
        if (v32) {
          goto LABEL_10;
        }
        goto LABEL_11;
      case 3u:
        v32 |= v6 == 1;
        goto LABEL_16;
      default:
        goto LABEL_16;
    }
  }
}

void sub_222A601E4(_Unwind_Exception *a1)
{
  unsigned int v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 64) = v4;
    operator delete(v4);
  }
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLPostLexerImpl::HandleURL(SLPostLexerImpl *this, int64x2_t *a2, SLTokenList **a3)
{
  if ((a2[1].i8[1] & 4) != 0)
  {
    uint64_t v6 = a2[4].i64[0];
    uint64_t v7 = v6 - 4;
    memmove((void *)(v6 - 4), (const void *)(v6 - 2), 2uLL);
    uint64_t v8 = a2[3].i64[1];
    a2[4].i64[0] = v7 + 2;
    size_t v9 = v7 - v8;
    if (v9) {
      memmove((void *)v8, (const void *)(v8 + 2), v9);
    }
    a2[4].i64[0] = v8 + v9;
    a2[2] = vaddq_s64(a2[2], (int64x2_t)xmmword_222ABF4C0);
    a2[1].i32[0] = a2[1].i32[0] & 0xFFFFFBFE | 1;
  }
  if ((SLPostLexerImpl::HandleTokenInDictionary(this, (SLToken *)a2) & 1) != 0
    || (SLPostLexerImpl::HandleURLInSymbols(this, (SLToken *)a2, (SLTokenList *)a3) & 1) != 0)
  {
    return;
  }
  if ((a2[1].i8[0] & 1) == 0)
  {
    unsigned int v10 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
    if (v10)
    {
      int v11 = v10;
      if (*(unsigned char *)v10 == 7)
      {
        a2[2].i64[1] += *((void *)v10 + 5);
        std::vector<unsigned short>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned short *>,std::__wrap_iter<unsigned short *>>((uint64_t)&a2[3].i64[1], a2[4].i64[0] - 2, *((char **)v10 + 7), (char *)(*((void *)v10 + 8) - 2), (*((void *)v10 + 8) - 2 - *((void *)v10 + 7)) >> 1);
        a2[1].i32[0] = a2[1].i32[0] & 0xFFFFFFFE | *((_DWORD *)v11 + 4) & 1;
        int v12 = (char *)this + 120;
        *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
        std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
        int v13 = v11;
LABEL_12:
        SLToken::~SLToken(v13);
        MEMORY[0x223CA4030]();
        unsigned __int8 v20 = a2;
        std::deque<SLToken *>::push_front((uint64_t)v12, &v20);
        return;
      }
      uint64_t v14 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
      if (v14)
      {
        if (*(unsigned char *)v11 == 13)
        {
          unint64_t v15 = v14;
          if (*(unsigned char *)v14 == 7 && (*((unsigned char *)v11 + 16) & 1) == 0)
          {
            a2[2].i64[1] += *((void *)v14 + 5) + *((void *)v11 + 5);
            std::vector<unsigned short>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned short *>,std::__wrap_iter<unsigned short *>>((uint64_t)&a2[3].i64[1], a2[4].i64[0] - 2, *((char **)v11 + 7), (char *)(*((void *)v11 + 8) - 2), (*((void *)v11 + 8) - 2 - *((void *)v11 + 7)) >> 1);
            std::vector<unsigned short>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned short *>,std::__wrap_iter<unsigned short *>>((uint64_t)&a2[3].i64[1], a2[4].i64[0] - 2, *((char **)v15 + 7), (char *)(*((void *)v15 + 8) - 2), (*((void *)v15 + 8) - 2 - *((void *)v15 + 7)) >> 1);
            a2[1].i32[0] = a2[1].i32[0] & 0xFFFFFFFE | *((_DWORD *)v15 + 4) & 1;
            int v12 = (char *)this + 120;
            uint64_t v16 = *((void *)this + 20) - 1;
            ++*((void *)this + 19);
            *((void *)this + 20) = v16;
            std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
            *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
            std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
            SLToken::~SLToken(v11);
            MEMORY[0x223CA4030]();
            int v13 = v15;
            goto LABEL_12;
          }
        }
      }
    }
  }
  BOOL HasPossessive = SLPostLexerImpl::HasPossessive(this, (SLToken *)a2);
  (*(void (**)(void, int64x2_t *, SLTokenList **))(**((void **)this + 22) + 40))(*((void *)this + 22), a2, a3);
  if (!HasPossessive) {
    goto LABEL_24;
  }
  char v18 = a3[1];
  while (a3 != (SLTokenList **)v18)
  {
    a3 = (SLTokenList **)*a3;
    unsigned int v19 = a3[2];
    if (*(unsigned char *)v19 != 15)
    {
      SLPostLexerImpl::HandlePossessive(this, v19);
      break;
    }
  }
  if (a2)
  {
LABEL_24:
    SLToken::~SLToken((SLToken *)a2);
    JUMPOUT(0x223CA4030);
  }
}

void SLPostLexerImpl::HandleCitChar(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v5 = *((void *)this + 28);
  if (v5 == *((void *)this + 27)
    || !(*(unsigned int (**)(SLPostLexerImpl *, void, void))(*(void *)this + 72))(this, *(unsigned __int16 *)(v5 - 2), **((unsigned __int16 **)a2 + 7)))
  {
    char v7 = (*(uint64_t (**)(SLPostLexerImpl *, void, void))(*(void *)this + 72))(this, **((unsigned __int16 **)a2 + 7), *(unsigned __int16 *)(*((void *)a2 + 7) + 4));
    uint64_t v6 = SLLexerBuffer::operator[]((void *)this + 12, 0);
    if (v7) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v6 = SLLexerBuffer::operator[]((void *)this + 12, 0);
  }
  if ((*((unsigned char *)a2 + 16) & 1) == 0 && v6 && !*(unsigned char *)v6) {
    operator new();
  }
LABEL_8:
  operator new();
}

void sub_222A60CD4(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

uint64_t SLPostLexerImpl::HandleInsert(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  if (**((_WORD **)a2 + 7) == 40 && (*((unsigned char *)a2 + 16) & 1) == 0)
  {
    uint64_t result = SLPostLexerImpl::IsCopyright(this, a2, a3);
    if (result) {
      return result;
    }
  }
  char v7 = SLLexerBuffer::operator[]((void *)this + 12, 0);
  uint64_t v8 = SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
  if (SLChar::sCharClass[**((_WORD **)a2 + 7) & 0x3F | (SLChar::sUniMap[(unint64_t)**((unsigned __int16 **)a2 + 7) >> 6] << 6)] == 4
    && (*((unsigned char *)a2 + 16) & 1) == 0
    && v7)
  {
    int v9 = *(unsigned __int8 *)v7;
    if (v9 == 1)
    {
      if ((char *)v7[8] - (char *)v7[7] != 6) {
        goto LABEL_19;
      }
      if (!v8
        || *(unsigned char *)v8 != 4
        || !(*(unsigned int (**)(SLPostLexerImpl *))(*(void *)this + 72))(this))
      {
        SLToken::~SLToken(a2);
        JUMPOUT(0x223CA4030);
      }
      int v9 = *(unsigned __int8 *)v7;
    }
    if (v9 == 28 && (v7[2] & 0x600) == 0x400)
    {
      SLDissecter::DissectGeoLoc(*((void *)this + 23), (uint64_t)v7, (uint64_t)v22);
      if (v23 == 2)
      {
        uint64_t v10 = *((void *)this + 28);
        if (v10 != *((void *)this + 27)
          && ((*(uint64_t (**)(SLPostLexerImpl *, void, void))(*(void *)this + 72))(this, *(unsigned __int16 *)(v10 - 2), *((unsigned __int16 *)v7[7] + v24)) & 1) != 0)
        {
          SLToken::~SLToken(a2);
          return MEMORY[0x223CA4030]();
        }
      }
    }
  }
LABEL_19:
  if (!SLPostLexerImpl::SeenMatchingParenQuote(this, **((unsigned __int16 **)a2 + 7), (*((_DWORD *)a2 + 4) & 4) != 0, a3))
  {
    int v12 = *((_DWORD *)a2 + 4);
    if ((v12 & 4) != 0)
    {
      int v11 = v12 ^ 4;
      goto LABEL_40;
    }
    if (*(unsigned char *)a2 != 4 || (int v13 = SLLexerBuffer::operator[]((void *)this + 12, 0)) == 0)
    {
LABEL_38:
      SLToken::SetType(a2, 15);
      int v11 = *((_DWORD *)a2 + 4) | 2;
      goto LABEL_40;
    }
    uint64_t v14 = v13;
    unint64_t v15 = 1;
    while (1)
    {
      unint64_t v16 = v15 - 1;
      int v17 = *(unsigned __int8 *)v14;
      if (v17 == 28) {
        break;
      }
      if (v17 != 4) {
        goto LABEL_36;
      }
      char v18 = (*(uint64_t (**)(SLPostLexerImpl *, void, void))(*(void *)this + 72))(this, **((unsigned __int16 **)a2 + 7), *(unsigned __int16 *)v14[7]);
      if (v16 > 0x62 || (v18 & 1) != 0) {
        goto LABEL_38;
      }
LABEL_37:
      uint64_t v14 = SLLexerBuffer::operator[]((void *)this + 12, v15++);
      if (!v14) {
        goto LABEL_38;
      }
    }
    if ((*((unsigned char *)v14 + 17) & 4) != 0
      && *((unsigned __int16 *)v14[7] + (((char *)v14[8] - (char *)v14[7]) >> 1) - 2) != *((unsigned __int16 *)v14[8] - 3))
    {
      if ((*(unsigned int (**)(SLPostLexerImpl *, void))(*(void *)this + 72))(this, **((unsigned __int16 **)a2 + 7)))
      {
        SLDissecter::DissectGeoLoc(*((void *)this + 23), (uint64_t)v14, (uint64_t)v22);
        if ((*((unsigned char *)a2 + 17) & 2) == 0 || !v23) {
          operator new();
        }
      }
    }
LABEL_36:
    if (v16 > 0x62) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  SLToken::SetType(a2, 15);
  int v11 = *((_DWORD *)a2 + 4);
  if ((v11 & 6) == 0)
  {
    v11 |= 4u;
LABEL_40:
    *((_DWORD *)a2 + 4) = v11;
  }
  if (*(unsigned char *)a2 == 15)
  {
    unsigned int v19 = (__int16 *)*((void *)a2 + 7);
    int v20 = (unsigned __int16)*v19;
    if ((v11 & 2) != 0)
    {
      __int16 v21 = 40;
      if (v20 != 40 && v20 != 91 && v20 != 123) {
        __int16 v21 = 96;
      }
    }
    else
    {
      __int16 v21 = 41;
      if (v20 != 41 && v20 != 93 && v20 != 125) {
        __int16 v21 = 39;
      }
    }
    __int16 *v19 = v21;
  }
  *((_DWORD *)a2 + 4) = v11 | 0x40;
  return (uint64_t)SLTokenList::push_back(a3, a2);
}

void sub_222A6117C(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void *SLPostLexerImpl::HandleParagraph(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v6 = (void *)((char *)this + 96);
  char v7 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    if (*(unsigned char *)v7 == 13 && **((_WORD **)v7 + 7) == 9)
    {
      *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
      std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
      SLToken::~SLToken(v8);
      MEMORY[0x223CA4030]();
    }
  }
  unsigned int v9 = *((_DWORD *)a2 + 4);
  if ((v9 & 0x400) != 0)
  {
    if (!*((unsigned char *)this + 242) || (*((unsigned char *)this + 242) = 0, (uint64_t result = SLLexerBuffer::operator[](v6, 0)) == 0))
    {
LABEL_18:
      SLToken::~SLToken(a2);
      JUMPOUT(0x223CA4030);
    }
    unint64_t v11 = 1;
    do
    {
      int v12 = *(unsigned __int8 *)result;
      if (v12 == 13)
      {
        if (*(_WORD *)result[7] == 9)
        {
          unsigned int v9 = *((_DWORD *)a2 + 4) & 0xFFFFFBFF;
          goto LABEL_6;
        }
      }
      else if (v12 == 6)
      {
        break;
      }
      uint64_t result = SLLexerBuffer::operator[](v6, v11++);
    }
    while (result);
    if (a2) {
      goto LABEL_18;
    }
  }
  else
  {
LABEL_6:
    *((unsigned char *)this + 242) = 0;
    *((void *)this + 28) = *((void *)this + 27);
    *((_DWORD *)a2 + 4) = v9 | 0x40;
    return SLTokenList::push_back(a3, a2);
  }
  return result;
}

void SLPostLexerImpl::HandleRange(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v6 = *((void *)this + 22);
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 216))(v6, 215);
  (*(void (**)(uint64_t, uint64_t, SLTokenList *, void, void))(*(void *)v6 + 232))(v6, v7, a3, *((void *)a2 + 4), *((void *)a2 + 5));
  uint64_t v8 = SLLexerBuffer::operator[]((void *)this + 12, 0);
  if (v8) {
    *((unsigned char *)v8 + 1) = 2;
  }
  SLToken::~SLToken(a2);
  JUMPOUT(0x223CA4030);
}

void *SLPostLexerImpl::HandleRomanNumeral(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  if ((*((unsigned char *)this + 256) & 0x80) != 0)
  {
    SLToken::SetType(a2, 11);
    return SLTokenList::push_back(a3, a2);
  }
  else
  {
    int v5 = *((_DWORD *)a2 + 4);
    if ((v5 & 0x200) != 0)
    {
      *((_DWORD *)a2 + 4) = v5 ^ 0x200;
      SLPostLexerImpl::StripPossessive(this, a2, a3);
    }
    if ((v5 & 0x1000) != 0)
    {
      SLDissecter::DissectRoman(*((void *)this + 23), (uint64_t)a2, &v12);
      unsigned int v11 = SLDissecter::EvaluateRoman(*((SLDissecter **)this + 23), a2, v13);
      if ((*((unsigned char *)a2 + 18) & 2) == 0) {
        operator new();
      }
      (*(void (**)(void, SLToken *, CFIndex, CFIndex, void, SLTokenList *, uint64_t, uint64_t))(**((void **)this + 22) + 72))(*((void *)this + 22), a2, v13.location, v13.length, v11, a3, 1, v14);
    }
    else
    {
      CFIndex v7 = ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1;
      uint64_t v8 = *((void *)this + 22);
      v16.CFIndex location = 0;
      v16.CFIndex length = v7;
      uint64_t v9 = SLDissecter::EvaluateRoman(*((SLDissecter **)this + 23), a2, v16);
      (*(void (**)(uint64_t, SLToken *, void, CFIndex, uint64_t, SLTokenList *, unint64_t, void))(*(void *)v8 + 72))(v8, a2, 0, v7, v9, a3, ((unint64_t)*((unsigned int *)a2 + 4) >> 17) & 1, 0);
    }
    SLToken::~SLToken(a2);
    MEMORY[0x223CA4030]();
    uint64_t result = SLLexerBuffer::operator[]((void *)this + 12, 0);
    if (result) {
      *((_DWORD *)result + 4) |= 0x40000u;
    }
  }
  return result;
}

void sub_222A6166C(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLPostLexerImpl::HandleTime(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v6 = (void *)((char *)this + 96);
  CFIndex v7 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
  if (!v7)
  {
    memset(&__p, 0, sizeof(__p));
    if ((*((unsigned char *)this + 256) & 0x40) == 0)
    {
LABEL_15:
      LOBYTE(v10) = 0;
      goto LABEL_16;
    }
LABEL_22:
    LOBYTE(v10) = 0;
    goto LABEL_23;
  }
  uint64_t v8 = v7;
  uint64_t v9 = (SLPostLexerImpl *)SLLexerBuffer::operator[](v6, 1uLL);
  memset(&__p, 0, sizeof(__p));
  if (v9
    && *(unsigned char *)v8 == 13
    && SLChar::sCharClass[**((_WORD **)v8 + 7) & 0x3F | (SLChar::sUniMap[(unint64_t)**((unsigned __int16 **)v8 + 7) >> 6] << 6)] == 6
    && (*(unsigned char *)v9 & 0xFE) == 0x12)
  {
    SLToken::SetType(v8, 30);
  }
  if ((*((unsigned char *)this + 256) & 0x40) != 0) {
    goto LABEL_22;
  }
  if ((*((unsigned char *)a2 + 17) & 0x10) != 0 || (*(unsigned __int8 *)v8 | 2) != 2) {
    goto LABEL_15;
  }
  SLPostLexerImpl::Transcribe(v9, v8, 2, 0, ((uint64_t)(*((void *)v8 + 8) - *((void *)v8 + 7)) >> 1) - 1, &v21);
  std::string __p = v21;
  std::string::size_type v10 = HIBYTE(v21.__r_.__value_.__r.__words[2]);
  BOOL v11 = (v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
  if ((*((unsigned char *)&v21.__r_.__value_.__s + 23) & 0x80) != 0)
  {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
    if (!__p.__r_.__value_.__l.__size_) {
      goto LABEL_16;
    }
    if (__p.__r_.__value_.__l.__size_ != 2) {
      goto LABEL_50;
    }
    uint64_t v12 = (std::string *)__p.__r_.__value_.__r.__words[0];
LABEL_45:
    if (LOWORD(v12->__r_.__value_.__l.__data_) == 19777) {
      goto LABEL_64;
    }
    if ((*((unsigned char *)&v21.__r_.__value_.__s + 23) & 0x80) == 0)
    {
      if (v10 != 2) {
        goto LABEL_16;
      }
      BOOL v11 = 0;
      p_p = &__p;
      LODWORD(v10) = 2;
      goto LABEL_52;
    }
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
LABEL_50:
    if (size != 2)
    {
LABEL_55:
      if (size != 4) {
        goto LABEL_16;
      }
      BOOL v11 = 1;
      uint64_t v12 = (std::string *)__p.__r_.__value_.__r.__words[0];
      goto LABEL_57;
    }
    BOOL v11 = 1;
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
LABEL_52:
    if (LOWORD(p_p->__r_.__value_.__l.__data_) == 19792) {
      goto LABEL_64;
    }
    if (!v11) {
      goto LABEL_16;
    }
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
    goto LABEL_55;
  }
  uint64_t v12 = &__p;
  if (v10 == 2) {
    goto LABEL_45;
  }
  if (v10 != 4) {
    goto LABEL_16;
  }
  BOOL v11 = 0;
LABEL_57:
  if (LODWORD(v12->__r_.__value_.__l.__data_) != 776810049)
  {
    if (v11)
    {
      if (__p.__r_.__value_.__l.__size_ != 4) {
        goto LABEL_16;
      }
      char v18 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (v10 != 4) {
        goto LABEL_16;
      }
      char v18 = &__p;
      LOBYTE(v10) = 4;
    }
    if (LODWORD(v18->__r_.__value_.__l.__data_) == 776810064) {
      goto LABEL_64;
    }
LABEL_16:
    uint64_t v8 = 0;
    int v13 = 32;
    goto LABEL_17;
  }
LABEL_64:
  BOOL v19 = !v11;
  int v20 = &__p;
  if (!v19) {
    int v20 = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  int v13 = v20->__r_.__value_.__s.__data_[0];
LABEL_17:
  SLDissecter::DissectTime(*((void *)this + 23), (uint64_t)a2, (uint64_t)&v23);
  if (v8)
  {
    unsigned __int8 v26 = v13;
    LOBYTE(v10) = *((unsigned char *)&__p.__r_.__value_.__s + 23);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v14 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v14 = __p.__r_.__value_.__l.__size_;
    }
    uint64_t v27 = *((void *)v8 + 4) - *((void *)a2 + 4);
    std::string::size_type v28 = v14;
  }
  else
  {
    int v13 = v26;
  }
  if (v13 == 32) {
    unsigned int v15 = 25;
  }
  else {
    unsigned int v15 = 13;
  }
  if (v15 <= v23 || v24 > 0x3Bu || v25 > 0x3Cu)
  {
    if ((*((unsigned char *)a2 + 17) & 0x10) != 0 || v24 > 0x3Bu || v25 >= 0x3Cu)
    {
      SLToken::SetType(a2, 7);
      SLTokenList::push_back(a3, a2);
      goto LABEL_24;
    }
LABEL_23:
    SLToken::SetType(a2, 19);
    SLTokenList::push_back(a3, a2);
    goto LABEL_24;
  }
  if (v8)
  {
    *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
    std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
    SLToken::~SLToken(v8);
    MEMORY[0x223CA4030]();
  }
  (*(void (**)(void, SLToken *, SLTokenList *, unsigned __int8 *))(**((void **)this + 22) + 112))(*((void *)this + 22), a2, a3, &v23);
  if (a2)
  {
    SLToken::~SLToken(a2);
    MEMORY[0x223CA4030]();
  }
LABEL_24:
  if ((v10 & 0x80) != 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_222A61A48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p)
{
  if (v13 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *SLPostLexerImpl::HandleElapsedTime(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v6 = (void *)((char *)this + 96);
  CFIndex v7 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = SLLexerBuffer::operator[](v6, 1uLL);
    if (v9)
    {
      if (*(unsigned char *)v8 == 13
        && SLChar::sCharClass[**((_WORD **)v8 + 7) & 0x3F | (SLChar::sUniMap[(unint64_t)**((unsigned __int16 **)v8
                                                                                                + 7) >> 6] << 6)] == 6
        && (*(unsigned char *)v9 & 0xFE) == 0x12)
      {
        SLToken::SetType(v8, 30);
      }
    }
  }
  SLDissecter::DissectTime(*((void *)this + 23), (uint64_t)a2, (uint64_t)v11);
  if (v11[1] > 0x3Bu || v11[2] > 0x3Bu)
  {
    SLToken::SetType(a2, 7);
    return SLTokenList::push_back(a3, a2);
  }
  else
  {
    (*(void (**)(void, SLToken *, SLTokenList *, unsigned char *))(**((void **)this + 22) + 120))(*((void *)this + 22), a2, a3, v11);
    if ((*((unsigned char *)a2 + 17) & 0x10) != 0) {
      operator new();
    }
    SLToken::~SLToken(a2);
    return (void *)MEMORY[0x223CA4030]();
  }
}

void sub_222A61C08(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void *SLPostLexerImpl::HandleDate(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  SLDissecter::DissectDate(*((void *)this + 23), (uint64_t)a2, (uint64_t)v10);
  if (v10[0]) {
    BOOL v6 = v11 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v8 = v6 || v11 > 0xCu || v12 == 0;
  if (v8 || v12 > 0x20u)
  {
    SLToken::SetType(a2, 2);
    *((_DWORD *)a2 + 4) &= ~0x400u;
    return SLTokenList::push_back(a3, a2);
  }
  else
  {
    uint64_t result = (void *)(*(uint64_t (**)(void, SLToken *, SLTokenList *, unsigned char *))(**((void **)this + 22)
                                                                                            + 104))(*((void *)this + 22), a2, a3, v10);
    if (a2)
    {
      SLToken::~SLToken(a2);
      return (void *)MEMORY[0x223CA4030]();
    }
  }
  return result;
}

uint64_t SLPostLexerImpl::HandleNumericPair(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t result = (*(uint64_t (**)(void, SLToken *, SLTokenList *))(**((void **)this + 22) + 128))(*((void *)this + 22), a2, a3);
  if (a2)
  {
    SLToken::~SLToken(a2);
    JUMPOUT(0x223CA4030);
  }
  return result;
}

uint64_t SLPostLexerImpl::HandleDimensions(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t result = (*(uint64_t (**)(void, SLToken *, SLTokenList *))(**((void **)this + 22) + 136))(*((void *)this + 22), a2, a3);
  if (a2)
  {
    SLToken::~SLToken(a2);
    JUMPOUT(0x223CA4030);
  }
  return result;
}

void SLPostLexerImpl::HandleMusicalKey(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
}

void sub_222A62070(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLPostLexerImpl::HandleIPA(SLPostLexerImpl *this, int64x2_t *a2, SLTokenList *a3)
{
  int v5 = this;
  uint64_t v6 = a2[3].i64[1];
  uint64_t v7 = (a2[4].i64[0] - v6) >> 1;
  unint64_t v8 = v7 - 1;
  if (v7 != 1)
  {
    uint64_t v9 = 0;
    uint64_t v10 = v7 - 2;
    while (1)
    {
      int v11 = *(unsigned __int16 *)(v6 + 2 * (void)v9);
      if (v11 == 32) {
        break;
      }
      if (v11 == 44)
      {
        unsigned __int8 v12 = v9;
        goto LABEL_7;
      }
      char v13 = (SLPostLexerImpl *)((char *)v9 + 1);
LABEL_16:
      uint64_t v9 = v13;
      if (v13 == (SLPostLexerImpl *)v8) {
        goto LABEL_21;
      }
    }
    unsigned __int8 v12 = 0;
LABEL_7:
    char v13 = (SLPostLexerImpl *)((char *)v9 + 1);
    if ((unint64_t)v9 + 1 < v8)
    {
      std::string::size_type v14 = v9;
      do
      {
        uint64_t v15 = (uint64_t)v14 + 1;
        int v16 = *(unsigned __int16 *)(v6 + 2 + 2 * (void)v14);
        if (v16 == 32)
        {
          this = v12;
        }
        else
        {
          this = (SLPostLexerImpl *)((char *)v14 + 1);
          if (v16 != 44)
          {
            if (v12) {
              operator new();
            }
            operator new();
          }
        }
        std::string::size_type v14 = (SLPostLexerImpl *)((char *)v14 + 1);
        unsigned __int8 v12 = this;
      }
      while (v10 != v15);
    }
    goto LABEL_16;
  }
LABEL_21:
  uint64_t v17 = 208;
  if ((a2[1].i8[1] & 4) == 0) {
    uint64_t v17 = 200;
  }
  uint64_t v18 = *(void *)((char *)v5 + v17);
  if (!v18)
  {
    SLToken::~SLToken((SLToken *)a2);
    JUMPOUT(0x223CA4030);
  }
  SLPostLexerImpl::Transcribe(this, (SLToken *)a2, 0, 1uLL, ((a2[4].i64[0] - a2[3].i64[1]) >> 1) - 2, &v44);
  std::string::size_type size = HIBYTE(v44.__r_.__value_.__r.__words[2]);
  if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v44.__r_.__value_.__l.__size_;
  }
  std::vector<unsigned char>::vector(&__p, 2 * size);
  if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v20 = HIBYTE(v44.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v20 = v44.__r_.__value_.__l.__size_;
  }
  if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string v21 = &v44;
  }
  else {
    std::string v21 = (std::string *)v44.__r_.__value_.__r.__words[0];
  }
  unsigned int v22 = __p;
  uint64_t v23 = (*(uint64_t (**)(uint64_t, std::string::size_type, std::string *, int64_t, void *))(*(void *)v18 + 32))(v18, v20, v21, v43 - (unsigned char *)__p, __p);
  uint64_t v24 = (*(uint64_t (**)(SLPostLexerImpl *, void *, uint64_t))(*(void *)v5 + 144))(v5, v22, v23);
  unint64_t v25 = a2[6].u64[0];
  unsigned __int8 v26 = (uint64_t *)a2[5].i64[1];
  if ((unint64_t)v26 >= v25)
  {
    uint64_t v28 = a2[5].i64[0];
    uint64_t v29 = ((uint64_t)v26 - v28) >> 3;
    if ((unint64_t)(v29 + 1) >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v30 = v25 - v28;
    uint64_t v31 = v30 >> 2;
    if (v30 >> 2 <= (unint64_t)(v29 + 1)) {
      uint64_t v31 = v29 + 1;
    }
    if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v32 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v32 = v31;
    }
    if (v32) {
      int v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)a2[6].i64, v32);
    }
    else {
      int v33 = 0;
    }
    int v34 = (uint64_t *)&v33[8 * v29];
    int v35 = &v33[8 * v32];
    uint64_t *v34 = v24;
    uint64_t v27 = v34 + 1;
    unint64_t v37 = (char *)a2[5].i64[0];
    uint64_t v36 = (char *)a2[5].i64[1];
    if (v36 != v37)
    {
      do
      {
        uint64_t v38 = *((void *)v36 - 1);
        v36 -= 8;
        *--int v34 = v38;
      }
      while (v36 != v37);
      uint64_t v36 = (char *)a2[5].i64[0];
    }
    a2[5].i64[0] = (uint64_t)v34;
    a2[5].i64[1] = (uint64_t)v27;
    a2[6].i64[0] = (uint64_t)v35;
    if (v36) {
      operator delete(v36);
    }
  }
  else
  {
    uint64_t *v26 = v24;
    uint64_t v27 = v26 + 1;
  }
  a2[5].i64[1] = (uint64_t)v27;
  a2[1].i32[0] |= 0x40u;
  a2[2] = vaddq_s64(a2[2], (int64x2_t)xmmword_222ABF4C0);
  uint64_t v39 = operator new(0x18uLL);
  int v40 = (void *)*((void *)a3 + 1);
  *uint64_t v39 = a3;
  v39[1] = v40;
  v39[2] = a2;
  *int v40 = v39;
  uint64_t v41 = *((void *)a3 + 2) + 1;
  *((void *)a3 + 1) = v39;
  *((void *)a3 + 2) = v41;
  if (__p)
  {
    uint64_t v43 = __p;
    operator delete(__p);
  }
  if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v44.__r_.__value_.__l.__data_);
  }
}

void sub_222A6248C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  MEMORY[0x223CA4030](v17, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void *SLPostLexerImpl::push_front(SLPostLexerImpl *this, const SLTokenList *a2)
{
  char v4 = *((unsigned char *)a2 + 24);
  if (v4)
  {
    unint64_t v5 = *((void *)a2 + 2) && SLPostLexerImpl::HasPossessive(this, *(SLToken **)(*(void *)a2 + 16));
    uint64_t v6 = SLLexerBuffer::operator[]((void *)this + 12, v5);
    if (v6)
    {
      if (!*((unsigned char *)v6 + 1)) {
        *((unsigned char *)v6 + 1) = v4;
      }
    }
  }
  return SLLexerBuffer::push_front((SLPostLexerImpl *)((char *)this + 96), a2);
}

void SLPostLexerImpl::Classify(SLPostLexerImpl *this, SLToken *a2)
{
  if (*((unsigned char *)a2 + 3))
  {
    unsigned int v2 = *((_DWORD *)a2 + 4);
    goto LABEL_3;
  }
  *(_WORD *)((char *)a2 + 3) = 1;
  *((unsigned char *)a2 + 5) = 0;
  unsigned int v2 = *((_DWORD *)a2 + 4) & 0xFFFFFFE7;
  *((_DWORD *)a2 + 4) = v2;
  uint64_t v3 = (unsigned __int16 *)*((void *)a2 + 7);
  uint64_t v4 = (uint64_t)(*((void *)a2 + 8) - (void)v3) >> 1;
  uint64_t v5 = v4 - 1;
  if (v4 != 1)
  {
    int v6 = 0;
    unsigned __int8 v7 = 0;
    int v8 = 0;
    int v9 = 0;
    char v10 = 0;
    char v11 = 0;
    while (1)
    {
      unsigned int v12 = *v3++;
      __int16 v13 = SLChar::sCharClass[v12 & 0x3F | (SLChar::sUniMap[(unint64_t)v12 >> 6] << 6)];
      if ((v13 & 0x1F) == 4)
      {
        int v6 = v8 + 1;
        *((unsigned char *)a2 + 4) = ++v8;
      }
      else if ((v13 & 0x1F) == 1)
      {
        if ((v13 & 0x80) != 0)
        {
          if (!(v11 & 1 | (v7 < 2u))) {
            goto LABEL_17;
          }
        }
        else
        {
          if ((v11 & 1) == 0)
          {
            if ((_BYTE)v6)
            {
              char v11 = 0;
              int v8 = v6;
              if ((v13 & 0x40) == 0) {
                goto LABEL_20;
              }
            }
            else
            {
              int v8 = 0;
              char v11 = 0;
              *((unsigned char *)a2 + 5) = ++v7;
              if ((v13 & 0x40) == 0) {
                goto LABEL_20;
              }
            }
LABEL_19:
            v2 |= 0x20u;
            *((_DWORD *)a2 + 4) = v2;
LABEL_20:
            v9 |= (v13 & 0x20) >> 5;
            char v10 = 1;
            goto LABEL_21;
          }
LABEL_17:
          v2 |= 8u;
          *((_DWORD *)a2 + 4) = v2;
        }
        char v11 = 1;
        if ((v13 & 0x40) != 0) {
          goto LABEL_19;
        }
        goto LABEL_20;
      }
LABEL_21:
      if (!--v5)
      {
        if (v10)
        {
          if ((v11 & 1) == 0) {
            v2 |= 0x10u;
          }
          if ((v9 & 1) == 0) {
            v2 |= 0x100u;
          }
          if ((v11 & 1 & v9) == 0) {
            *((_DWORD *)a2 + 4) = v2;
          }
        }
        break;
      }
    }
  }
LABEL_3:
  if ((v2 & 0x4000) != 0) {
    *((_DWORD *)a2 + 4) = v2 & 0xFFFFFFE7;
  }
}

uint64_t SLPostLexerImpl::IsInitial(SLPostLexerImpl *this, SLToken *a2, unint64_t a3)
{
  uint64_t v3 = (_WORD *)*((void *)a2 + 7);
  if (*((void *)a2 + 8) - (void)v3 != 4) {
    return 0;
  }
  if (*((unsigned char *)a2 + 16)) {
    return 0;
  }
  if ((SLChar::sCharClass[*v3 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v3 >> 6] << 6)] & 0x9F) != 1) {
    return 0;
  }
  unsigned __int8 v7 = (void *)((char *)this + 96);
  int v8 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, a3);
  if (!v8) {
    return 0;
  }
  int v9 = v8;
  if (*(unsigned char *)v8 != 13) {
    return 0;
  }
  if ((*((unsigned char *)v8 + 16) & 1) == 0) {
    return 0;
  }
  if (**((_WORD **)v8 + 7) != 46) {
    return 0;
  }
  char v10 = (SLPostLexerImpl *)SLLexerBuffer::operator[](v7, a3 + 1);
  if (!v10) {
    return 0;
  }
  char v11 = v10;
  if (*(unsigned char *)v10
    || !SLPostLexerImpl::LooksLikeName(v10, v10, 1) && !SLPostLexerImpl::IsInitial(this, v11, a3 + 2))
  {
    return 0;
  }
  if (a3 > 1) {
    return 1;
  }
  if (a3 == 1)
  {
    *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
    std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
  }
  std::string::size_type v14 = (char *)this + 120;
  *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
  uint64_t v12 = 1;
  std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)v14, 1);
  SLToken::~SLToken(v9);
  MEMORY[0x223CA4030]();
  SLToken::SetType(a2, 11);
  ++*((void *)a2 + 5);
  uint64_t v15 = a2;
  std::deque<SLToken *>::push_front((uint64_t)v14, &v15);
  return v12;
}

void *SLPostLexerImpl::HandleCurrency(uint64_t a1, char **a2, SLToken *a3)
{
  SLTokenList::SLTokenList((SLTokenList *)v31);
  int v6 = (SLToken *)SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
  uint64_t v7 = a1 + 120;
  unint64_t v23 = 1;
  *(int64x2_t *)(a1 + 152) = vaddq_s64(*(int64x2_t *)(a1 + 152), (int64x2_t)xmmword_222ABEE70);
  std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](a1 + 120, 1);
  if ((*((unsigned char *)v6 + 16) & 0x81) == 0)
  {
    std::string::size_type v20 = SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
    if (v20)
    {
      if (*(unsigned char *)v20 == 13 && ((_BYTE)v20[2] & 1) == 0)
      {
        int v21 = *(unsigned __int16 *)v20[7];
        if (v21 == **(char **)(*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 176) + 216))(*(void *)(a1 + 176), 207))
        {
          SLPostLexerImpl::HandleThousandsSeparators((SLPostLexerImpl *)a1, v6, 43);
          int v6 = (SLToken *)SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
          *(int64x2_t *)(a1 + 152) = vaddq_s64(*(int64x2_t *)(a1 + 152), (int64x2_t)xmmword_222ABEE70);
          std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](a1 + 120, 1);
        }
      }
    }
  }
  if ((*((unsigned char *)v6 + 17) & 0x10) != 0)
  {
    SLDissecter::DissectUnit(*(void *)(a1 + 184), (uint64_t)v6, (uint64_t)v26);
    if (v26[0]) {
      int v16 = 42;
    }
    else {
      int v16 = 43;
    }
    uint64_t Unit = SLPostLexerImpl::FindUnit((SLPostLexerImpl *)a1, v6, v29, ((uint64_t)(*((void *)v6 + 8) - *((void *)v6 + 7)) >> 1) - 1, v16);
    if (!Unit)
    {
      SLDissecter::DissectNumber(*(void *)(a1 + 184), (uint64_t)v6, v27, v28, (uint64_t)v24);
      if (v25) {
        char v22 = 7;
      }
      else {
        char v22 = 2;
      }
      SLToken::SetType(v6, v22);
      v32[0] = v6;
      std::deque<SLToken *>::push_front(a1 + 120, v32);
      v32[0] = a3;
      std::deque<SLToken *>::push_front(a1 + 120, v32);
      return std::__list_imp<SLToken *>::clear(v31);
    }
    uint64_t v14 = v27;
    uint64_t v12 = v28;
    uint64_t v7 = v30;
    unint64_t v23 = *((void *)v6 + 4) + v29;
    int v13 = 63;
  }
  else
  {
    int v9 = (char *)*((void *)v6 + 7);
    int v8 = (char *)*((void *)v6 + 8);
    char v10 = (SLToken *)SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
    char v11 = v10;
    uint64_t v12 = ((v8 - v9) >> 1) - 1;
    if (v10 && !*(unsigned char *)v10)
    {
      uint64_t Unit = SLPostLexerImpl::FindUnit((SLPostLexerImpl *)a1, v10, 0, ((uint64_t)(*((void *)v10 + 8) - *((void *)v10 + 7)) >> 1) - 1, 42);
      if (Unit)
      {
        *(int64x2_t *)(a1 + 152) = vaddq_s64(*(int64x2_t *)(a1 + 152), (int64x2_t)xmmword_222ABEE70);
        std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](a1 + 120, 1);
        uint64_t v7 = *((void *)v11 + 5);
        unint64_t v23 = *((void *)v11 + 4);
        int v13 = SLToken::Capitalization(v11);
        SLToken::~SLToken(v11);
        MEMORY[0x223CA4030]();
      }
      else
      {
        int v13 = 0;
      }
      uint64_t v14 = 0;
    }
    else
    {
      int v13 = 0;
      uint64_t v14 = 0;
      uint64_t Unit = 0;
    }
  }
  SLDissecter::DissectNumber(*(void *)(a1 + 184), (uint64_t)v6, v14, v12, (uint64_t)v24);
  if (Unit
    || (uint64_t v17 = v25) == 0
    || strchr(*a2, 59) && v17 == 2
    || !(*(unsigned int (**)(uint64_t, char **, SLToken *))(*(void *)a1 + 112))(a1, a2, v6))
  {
    (*(void (**)(void, char **, SLToken *, SLToken *, unsigned char *, uint64_t, unint64_t, uint64_t, int, void *))(**(void **)(a1 + 176) + 88))(*(void *)(a1 + 176), a2, a3, v6, v24, Unit, v23, v7, v13, v31);
  }
  else
  {
    (*(void (**)(void, SLToken *, void *, unsigned char *, void, void))(**(void **)(a1 + 176) + 48))(*(void *)(a1 + 176), v6, v31, v24, 0, 0);
  }
  uint64_t v18 = SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
  if (v18) {
    *((unsigned char *)v18 + 1) = 2;
  }
  SLPostLexerImpl::push_front((SLPostLexerImpl *)a1, (const SLTokenList *)v31);
  if (a3)
  {
    SLToken::~SLToken(a3);
    MEMORY[0x223CA4030]();
  }
  SLToken::~SLToken(v6);
  MEMORY[0x223CA4030]();
  return std::__list_imp<SLToken *>::clear(v31);
}

void sub_222A62CB4(_Unwind_Exception *a1)
{
  std::__list_imp<SLToken *>::clear((void *)(v1 - 128));
  _Unwind_Resume(a1);
}

uint64_t SLPostLexerImpl::HandleDayAbbr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (void *)(a1 + 96);
  uint64_t v7 = (SLPostLexerImpl *)SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
  SLPostLexerImpl::Transcribe(v7, (SLToken *)a3, 2, 0, ((uint64_t)(*(void *)(a3 + 64) - *(void *)(a3 + 56)) >> 1) - 1, &__p);
  SLTmpLookup::SLTmpLookup(v22, &__p, *(void *)(a1 + 168));
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (!v22[0]
    || (BOOL HasTag = SLToken::HasTag(v23, 64), !v22[0])
    || (*(unsigned char *)(a3 + 5) != 1 ? (char v9 = 1) : (char v9 = HasTag), (v9 & 1) == 0))
  {
    int v10 = 0;
    goto LABEL_16;
  }
  if (!v7) {
    goto LABEL_43;
  }
  if ((*(unsigned char *)(a3 + 16) & 1) == 0)
  {
    if (*(unsigned char *)v7 != 13) {
      goto LABEL_43;
    }
    if (**((_WORD **)v7 + 7) == 46)
    {
      uint64_t v7 = (SLPostLexerImpl *)SLLexerBuffer::operator[](v6, 1uLL);
      if (v7)
      {
        int v10 = 1;
        goto LABEL_22;
      }
LABEL_43:
      uint64_t v14 = 0;
      goto LABEL_20;
    }
  }
  int v10 = 0;
LABEL_22:
  int v16 = *(unsigned __int8 *)v7;
  if (v16 == 13)
  {
    if (**((_WORD **)v7 + 7) != 44) {
      goto LABEL_43;
    }
    int v17 = v10 + 1;
    uint64_t v18 = (SLPostLexerImpl *)SLLexerBuffer::operator[](v6, (v10 + 1));
    uint64_t v7 = v18;
    if (!v18) {
      goto LABEL_43;
    }
    int v16 = *(unsigned __int8 *)v18;
  }
  else
  {
    int v17 = v10;
  }
  if (v16)
  {
LABEL_28:
    if (v16 == 18 || v16 == 24) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
  if (!SLPostLexerImpl::FindUnit((SLPostLexerImpl *)a1, v7, 0, ((uint64_t)(*((void *)v7 + 8) - *((void *)v7 + 7)) >> 1) - 1, 62))
  {
    int v16 = *(unsigned __int8 *)v7;
    goto LABEL_28;
  }
  BOOL v19 = *((void *)v7 + 8) - *((void *)v7 + 7) == 8 && (*((unsigned char *)v7 + 16) & 1) == 0;
  std::string::size_type v20 = SLLexerBuffer::operator[](v6, (v17 + 1));
  if (!v20) {
    goto LABEL_43;
  }
  if (v19)
  {
    int v16 = *(unsigned __int8 *)v20;
    if (v16 != 13) {
      goto LABEL_42;
    }
    if (*(_WORD *)v20[7] == 46)
    {
      std::string::size_type v20 = SLLexerBuffer::operator[](v6, (v17 + 2));
      if (!v20) {
        goto LABEL_43;
      }
    }
  }
  int v16 = *(unsigned __int8 *)v20;
LABEL_42:
  if (v16 != 1) {
    goto LABEL_43;
  }
LABEL_16:
  SLTokenList::SLTokenList((SLTokenList *)&__p);
  (*(void (**)(void, uint64_t, std::string *, void, void))(**(void **)(a1 + 176) + 232))(*(void *)(a1 + 176), a2, &__p, *(void *)(a3 + 32), *(void *)(a3 + 40));
  uint64_t v11 = *(void *)(__p.__r_.__value_.__l.__size_ + 16);
  int v12 = SLToken::Capitalization((SLToken *)a3);
  SLToken::SetCapitalization(v11, v12);
  SLToken::~SLToken((SLToken *)a3);
  MEMORY[0x223CA4030]();
  if (v10)
  {
    int v13 = (SLToken *)SLLexerBuffer::operator[](v6, 0);
    *(int64x2_t *)(a1 + 152) = vaddq_s64(*(int64x2_t *)(a1 + 152), (int64x2_t)xmmword_222ABEE70);
    std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](a1 + 120, 1);
    if (v13)
    {
      SLToken::~SLToken(v13);
      MEMORY[0x223CA4030]();
    }
  }
  SLPostLexerImpl::push_front((SLPostLexerImpl *)a1, (const SLTokenList *)&__p);
  std::__list_imp<SLToken *>::clear(&__p);
  uint64_t v14 = 1;
LABEL_20:
  SLTmpLookup::~SLTmpLookup((SLTmpLookup *)v22);
  return v14;
}

void sub_222A62FE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, char a16)
{
}

uint64_t SLPostLexerImpl::HandleMonthAbbr(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6 = (void *)(a1 + 96);
  uint64_t v7 = (SLPostLexerImpl *)SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
  SLPostLexerImpl::Transcribe(v7, (SLToken *)a3, 2, 0, ((uint64_t)(*(void *)(a3 + 64) - *(void *)(a3 + 56)) >> 1) - 1, &__p);
  SLTmpLookup::SLTmpLookup(v34, &__p, *(void *)(a1 + 168));
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v34[0]) {
    BOOL HasTag = SLToken::HasTag(v35, 64);
  }
  else {
    BOOL HasTag = 0;
  }
  unsigned int v9 = *(_DWORD *)(a3 + 16);
  BOOL v10 = (v9 & 1) == 0 && *(unsigned char *)v7 == 13 && **((unsigned __int16 **)v7 + 7) == 46;
  if (v34[0])
  {
    if (*(unsigned char *)(a3 + 5) == 1 && HasTag) {
      int v12 = (v9 >> 18) & 1;
    }
    else {
      int v12 = *(unsigned __int8 *)(a3 + 5) == 1;
    }
    if (v9) {
      goto LABEL_21;
    }
  }
  else
  {
    int v12 = 1;
    if (v9) {
      goto LABEL_21;
    }
  }
  if (*(unsigned char *)v7 != 13) {
    goto LABEL_69;
  }
LABEL_21:
  if (v12)
  {
    if (v10)
    {
      int v13 = (SLPostLexerImpl *)SLLexerBuffer::operator[](v6, 1uLL);
      uint64_t v7 = v13;
      if (!v13) {
        goto LABEL_68;
      }
      if (*(unsigned char *)v13 == 1) {
        goto LABEL_41;
      }
      if (*(unsigned char *)v13) {
        goto LABEL_68;
      }
      int v14 = *((_DWORD *)v13 + 4);
      if ((v14 & 0x10000) == 0)
      {
        BOOL v10 = (SLChar::sCharClass[**((_WORD **)v13 + 7) & 0x3F | (SLChar::sUniMap[(unint64_t)**((unsigned __int16 **)v13 + 7) >> 6] << 6)] & 0x9F) == 129;
        goto LABEL_46;
      }
      if ((v14 & 0x1000) == 0
        || !memchr("MDL", **((unsigned __int16 **)v13 + 7), 4uLL)
        && SLPostLexerImpl::IsRomanOrdinal((SLPostLexerImpl *)a1, v7))
      {
        SLToken::SetType(v7, 17);
        if (*(unsigned char *)v7 != 1) {
          goto LABEL_66;
        }
LABEL_41:
        LOBYTE(v10) = 1;
        goto LABEL_47;
      }
    }
    else if (!v7)
    {
      goto LABEL_68;
    }
    BOOL v10 = 0;
  }
  else
  {
    if (v10) {
      uint64_t v7 = (SLPostLexerImpl *)SLLexerBuffer::operator[](v6, 1uLL);
    }
    if (!v7) {
      goto LABEL_69;
    }
    int v15 = *(unsigned __int8 *)v7;
    if (!*(unsigned char *)v7)
    {
      int v16 = *((_DWORD *)v7 + 4);
      if ((v16 & 0x10000) != 0)
      {
        int v17 = (char *)*((void *)v7 + 7);
        if (((unint64_t)(((uint64_t)(*((void *)v7 + 8) - (void)v17) >> 1) - 3) < 0xFFFFFFFFFFFFFFFELL
           || *(_WORD *)v17 != 73)
          && ((v16 & 0x1000) == 0
           || !memchr("MDL", *(unsigned __int16 *)v17, 4uLL)
           && SLPostLexerImpl::IsRomanOrdinal((SLPostLexerImpl *)a1, v7)))
        {
          SLToken::SetType(v7, 17);
        }
      }
      int v15 = *(unsigned __int8 *)v7;
    }
    if ((v15 | 0x10) != 0x11) {
      goto LABEL_69;
    }
  }
LABEL_46:
  if (*(unsigned char *)v7 == 1)
  {
LABEL_47:
    if ((*((unsigned char *)v7 + 17) & 0x10) != 0)
    {
      SLDissecter::DissectUnit(*(void *)(a1 + 184), (uint64_t)v7, (uint64_t)&__p);
      uint64_t Unit = (char **)SLPostLexerImpl::FindUnit((SLPostLexerImpl *)a1, v7, v30, ((uint64_t)(*((void *)v7 + 8) - *((void *)v7 + 7)) >> 1) - 1, 35);
      BOOL v20 = 0;
      if (Unit)
      {
        char v22 = *Unit;
        if (*v22 == 64 && !strchr(v22, 43)) {
          BOOL v20 = 1;
        }
      }
      unint64_t v18 = v30;
      uint64_t v19 = v31;
    }
    else
    {
      unint64_t v18 = 0;
      uint64_t v19 = ((uint64_t)(*((void *)v7 + 8) - *((void *)v7 + 7)) >> 1) - 1;
      BOOL v20 = 1;
    }
    SLDissecter::DissectNumber(*(void *)(a1 + 184), (uint64_t)v7, v18, v19, (uint64_t)&__p);
    if (v31 | v32) {
      BOOL v23 = 0;
    }
    else {
      BOOL v23 = v20;
    }
    if ((v12 | v23))
    {
      if (!v33) {
        BOOL v23 = 0;
      }
      if (v23 && v33 <= 0x20) {
        *((_DWORD *)v7 + 4) |= 0x20000u;
      }
      if (!v10) {
        goto LABEL_68;
      }
      goto LABEL_66;
    }
LABEL_69:
    uint64_t v27 = 0;
    goto LABEL_70;
  }
  if (v10)
  {
LABEL_66:
    uint64_t v24 = (SLToken *)SLLexerBuffer::operator[](v6, 0);
    *(int64x2_t *)(a1 + 152) = vaddq_s64(*(int64x2_t *)(a1 + 152), (int64x2_t)xmmword_222ABEE70);
    std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](a1 + 120, 1);
    if (v24)
    {
      SLToken::~SLToken(v24);
      MEMORY[0x223CA4030]();
    }
  }
LABEL_68:
  SLTokenList::SLTokenList((SLTokenList *)&__p);
  (*(void (**)(void, uint64_t, std::string *, void, void))(**(void **)(a1 + 176) + 232))(*(void *)(a1 + 176), a2, &__p, *(void *)(a3 + 32), *(void *)(a3 + 40));
  uint64_t v25 = *(void *)(__p.__r_.__value_.__l.__size_ + 16);
  int v26 = SLToken::Capitalization((SLToken *)a3);
  SLToken::SetCapitalization(v25, v26);
  SLToken::~SLToken((SLToken *)a3);
  MEMORY[0x223CA4030]();
  SLPostLexerImpl::push_front((SLPostLexerImpl *)a1, (const SLTokenList *)&__p);
  std::__list_imp<SLToken *>::clear(&__p);
  uint64_t v27 = 1;
LABEL_70:
  SLTmpLookup::~SLTmpLookup((SLTmpLookup *)v34);
  return v27;
}

void sub_222A634A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20)
{
}

void SLPostLexerImpl::HandleApostrophes(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = (unsigned __int16 *)*((void *)a2 + 7);
  uint64_t v5 = (char **)((char *)a2 + 56);
  uint64_t v6 = (uint64_t)(*((void *)a2 + 8) - (void)v4) >> 1;
  if (v6 == 1
    || ((int v7 = (unsigned __int16)SLChar::sCharClass[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)*v4 >> 6] << 6)],
         v6 != 2)
      ? (v9 = v4[v6 - 2], BOOL v8 = SLChar::sCharClass[v9 & 0x3F | (SLChar::sUniMap[v9 >> 6] << 6)] == 4)
      : (BOOL v8 = 0),
        v7 != 4 ? (unsigned int v10 = v8) : (unsigned int v10 = v8 + 1),
        v7 != 4 ? (BOOL v11 = !v8) : (BOOL v11 = 0),
        v11))
  {
    SLPostLexerImpl::HandleLookup(this, a2, 1, a3);
    return;
  }
  uint64_t v49 = a2;
  unsigned int v12 = *((unsigned __int8 *)a2 + 4);
  BOOL v48 = this;
  if (v7 == 4)
  {
    int v13 = !v8;
    BOOL v14 = v6 != 4;
    if (v6 == 4 && (v13 & 1) == 0)
    {
      if ((SLChar::sCharClass[v4[1] & 0x3F | (SLChar::sUniMap[(unint64_t)v4[1] >> 6] << 6)] & 0x9F) == 1)
      {
        if (v10 >= v12)
        {
          uint64_t v47 = 0;
          if (!v8) {
            goto LABEL_46;
          }
          goto LABEL_39;
        }
        goto LABEL_34;
      }
      BOOL v14 = 0;
      int v13 = 0;
    }
  }
  else
  {
    uint64_t v15 = *((void *)this + 28);
    if (v15 == *((void *)this + 27))
    {
      int v13 = !v8;
      BOOL v14 = 1;
    }
    else
    {
      if ((*(uint64_t (**)(SLPostLexerImpl *, void, void, SLTokenList *))(*(void *)this + 72))(this, *(unsigned __int16 *)(v15 - 2), v4[v6 - 2], a3))
      {
        if (v10 >= v12)
        {
          if (!v8) {
            return;
          }
          uint64_t v47 = 0x100000000;
          goto LABEL_43;
        }
        goto LABEL_41;
      }
      int v13 = !v8;
      BOOL v14 = 1;
      this = v48;
      a2 = v49;
    }
  }
  LODWORD(v47) = v13;
  HIDWORD(v47) = v7 != 4;
  if (SLPostLexerImpl::HandleLookup(this, a2, 0, a3)) {
    return;
  }
  if (v10 < v12)
  {
    if (v7 == 4)
    {
LABEL_34:
      uint64_t v16 = 1;
      do
      {
        int v17 = (unsigned __int16)SLChar::sCharClass[*(_WORD *)&(*v5)[2 * v16] & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)&(*v5)[2 * v16] >> 6] << 6)];
        ++v16;
      }
      while (v17 != 4);
      goto LABEL_42;
    }
    do
    {
LABEL_41:
      int v18 = (unsigned __int16)SLChar::sCharClass[*(_WORD *)&(*v5)[2 * v6 - 6] & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)&(*v5)[2 * v6 - 6] >> 6] << 6)];
      --v6;
    }
    while (v18 != 4);
LABEL_42:
    operator new();
  }
  if (v8)
  {
    if (v14)
    {
LABEL_43:
      uint64_t v19 = *((void *)v49 + 8);
      *((void *)v49 + 8) = v19 - 2;
      __int16 v20 = *(_WORD *)(v19 - 4);
      *(_WORD *)(v19 - 4) = 0;
      --*((unsigned char *)v49 + 4);
      --*((void *)v49 + 5);
      if (SLPostLexerImpl::HandleLookup(v48, v49, SHIDWORD(v47), a3)) {
        operator new();
      }
      unint64_t v24 = *((void *)v49 + 9);
      uint64_t v25 = (char *)*((void *)v49 + 8);
      *((_WORD *)v25 - 1) = v20;
      if ((unint64_t)v25 >= v24)
      {
        int v26 = *v5;
        uint64_t v27 = v25 - *v5;
        if (v27 <= -3) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v28 = v27 >> 1;
        unint64_t v29 = v24 - (void)v26;
        if (v29 <= (v27 >> 1) + 1) {
          unint64_t v30 = v28 + 1;
        }
        else {
          unint64_t v30 = v29;
        }
        if (v29 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v31 = v30;
        }
        if (v31)
        {
          uint64_t v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)v49 + 72, v31);
          int v26 = (char *)*((void *)v49 + 7);
          uint64_t v25 = (char *)*((void *)v49 + 8);
        }
        else
        {
          uint64_t v32 = 0;
        }
        unint64_t v33 = &v32[2 * v28];
        int v34 = &v32[2 * v31];
        *(_WORD *)unint64_t v33 = 0;
        BOOL v23 = v33 + 2;
        while (v25 != v26)
        {
          __int16 v35 = *((_WORD *)v25 - 1);
          v25 -= 2;
          *((_WORD *)v33 - 1) = v35;
          v33 -= 2;
        }
        *((void *)v49 + 7) = v33;
        *((void *)v49 + 8) = v23;
        *((void *)v49 + 9) = v34;
        if (v26) {
          operator delete(v26);
        }
      }
      else
      {
        *(_WORD *)uint64_t v25 = 0;
        BOOL v23 = v25 + 2;
      }
      *((void *)v49 + 8) = v23;
      uint64_t v21 = *((void *)v49 + 5) + 1;
      *((void *)v49 + 5) = v21;
      char v22 = v49;
      ++*((unsigned char *)v49 + 4);
      if (v7 == 4)
      {
LABEL_65:
        uint64_t v36 = *((void *)v22 + 4);
        uint64_t v37 = *((void *)v22 + 7);
        uint64_t v38 = (unsigned char *)(v37 + 2);
        uint64_t v39 = &v23[-v37 - 2];
        if (v23 == (char *)(v37 + 2))
        {
          uint64_t v43 = *((void *)v22 + 7);
          uint64_t v42 = v21;
        }
        else
        {
          size_t v40 = v23 - v38;
          uint64_t v41 = v22;
          memmove(*((void **)v22 + 7), v38, v40);
          char v22 = v41;
          uint64_t v36 = *((void *)v41 + 4);
          uint64_t v42 = *((void *)v41 + 5);
          uint64_t v43 = *((void *)v41 + 7);
        }
        *((void *)v22 + 8) = &v39[v37];
        *((void *)v22 + 4) = v36 + 1;
        *((void *)v22 + 5) = v42 - 1;
        --*((unsigned char *)v22 + 4);
        unint64_t v44 = ((uint64_t)&v39[v37 - v43] >> 1) - 1;
        unint64_t v45 = *((unsigned __int8 *)v22 + 5);
        if (v44 > v45)
        {
          int v46 = *((unsigned __int8 *)v22 + 5);
          do
          {
            if ((SLChar::sCharClass[*(_WORD *)(v43 + 2 * v45) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v43 + 2 * v45) >> 6] << 6)] & 0x9F) != 1) {
              break;
            }
            *((unsigned char *)v22 + 5) = ++v46;
            unint64_t v45 = v46;
          }
          while (v44 > v46);
        }
        SLPostLexerImpl::HandleLookup(v48, v22, v47, a3);
        operator new();
      }
      return;
    }
LABEL_39:
    if ((*(unsigned int (**)(SLPostLexerImpl *, void, void, SLTokenList *))(*(void *)v48 + 72))(v48, *(unsigned __int16 *)*v5, *((unsigned __int16 *)*v5 + 2), v3))
    {
      SLToken::SetType(v49, 10);
      int v51 = v49;
      std::deque<SLToken *>::push_front((uint64_t)v48 + 120, &v51);
      return;
    }
    goto LABEL_43;
  }
  if (v7 == 4)
  {
LABEL_46:
    uint64_t v21 = *((void *)v49 + 5);
    char v22 = v49;
    BOOL v23 = (char *)*((void *)v49 + 8);
    goto LABEL_65;
  }
}

void sub_222A64158(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

uint64_t SLPostLexerImpl::SingleLetterWordAtEnd(SLPostLexerImpl *this)
{
  return 0;
}

uint64_t SLPostLexerImpl::SingleLetterWordAsPrefix(SLPostLexerImpl *this)
{
  return 0;
}

uint64_t SLPostLexerImpl::SingleLetterWordAsInfix(SLPostLexerImpl *this)
{
  return 0;
}

uint64_t SLPostLexerImpl::IsRomanOrdinal(SLPostLexerImpl *this, SLToken *a2)
{
  SLDissecter::DissectRoman(*((void *)this + 23), (uint64_t)a2, &v9);
  uint64_t Unit = (void *)SLPostLexerImpl::FindUnit(this, a2, v11, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, 35);
  if (Unit)
  {
    uint64_t v5 = (unsigned char *)*Unit;
    if (*(unsigned char *)*Unit == 64)
    {
      if (!v5[1]) {
        return 1;
      }
      if (!v5[2])
      {
        __int16 v6 = (char)v5[1];
        if ((((unsigned __int16)SLDissecter::EvaluateRoman(*((SLDissecter **)this + 23), a2, v10) % 0xAu) | 0x30) == v6) {
          return 1;
        }
      }
    }
  }
  BOOL v7 = v10.length >= 2 && v12 == 1;
  if (v7 && memchr("abcd", *(unsigned __int16 *)(*((void *)a2 + 7) + 2 * v11), 5uLL))
  {
    *((_DWORD *)a2 + 4) |= 0x400u;
    return 1;
  }
  uint64_t result = 0;
  *((_DWORD *)a2 + 4) &= 0xFFFEEFFF;
  return result;
}

uint64_t SLPostLexerImpl::PeekMatchingQuote(SLPostLexerImpl *this, uint64_t a2)
{
  uint64_t v2 = *((void *)this + 28);
  if (v2 == *((void *)this + 27)) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(SLPostLexerImpl *, void, uint64_t))(*(void *)this + 72))(this, *(unsigned __int16 *)(v2 - 2), a2);
  }
}

uint64_t SLPostLexerImpl::HandleLookup(SLPostLexerImpl *this, SLToken *a2, int a3, SLTokenList *a4)
{
  BOOL v7 = this;
  int v8 = 0;
  memset(&__str, 0, sizeof(__str));
  if ((*((unsigned char *)a2 + 16) & 8) != 0)
  {
    SLPostLexerImpl::Transcribe(this, a2, 0, 0, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, &v44);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    std::string __str = v44;
    if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_str = &__str;
    }
    else {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    if ((v44.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v44.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    this = (SLPostLexerImpl *)SLDictLookup::Lookup(*((SLDictLookup **)v7 + 21), *(SLDictionary **)(*((void *)v7 + 21) + 8), (const char *)p_str, size, a2, 1);
    if (this)
    {
      int v8 = 0;
LABEL_52:
      if (SLToken::HasTag(a2, 78))
      {
        if ((*((unsigned char *)v7 + 256) & 0x80) != 0) {
          LODWORD(v44.__r_.__value_.__l.__data_) = 5111809;
        }
        else {
          LODWORD(v44.__r_.__value_.__l.__data_) = 5177345;
        }
        SLToken::ExcludeHomographs(a2, (const SLWordTagSet *)&v44);
      }
      if (SLPostLexerImpl::FollowedByPeriod(v7, a2))
      {
        std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)&__str.__r_.__value_.__l.__data_, 46, (uint64_t)&__p);
        SLPostLexerImpl::HandleAbbreviation((uint64_t)v7);
      }
      SLTokenList::push_back(a4, a2);
      if ((*((unsigned char *)a2 + 18) & 4) != 0 && SLToken::HasTag(a2, 86))
      {
        int v23 = *((unsigned __int8 *)a2 + 1);
        if ((v23 - 1) >= 2)
        {
          if (*((unsigned char *)a2 + 1)) {
            *((unsigned char *)a4 + 24) = v23;
          }
          *((unsigned char *)a2 + 1) = 2;
        }
      }
      *((_DWORD *)a2 + 4) |= v8;
      goto LABEL_75;
    }
    *((_DWORD *)a2 + 4) &= ~8u;
    int v8 = 8;
  }
  SLPostLexerImpl::Transcribe(this, a2, 2, 0, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, &v44);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  std::string __str = v44;
  int v11 = *((_DWORD *)a2 + 4);
  if ((v11 & 0x20) != 0)
  {
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v15 = &__str;
    }
    else {
      uint64_t v15 = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v16 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v16 = __str.__r_.__value_.__l.__size_;
    }
    uint64_t v17 = SLDictLookup::Lookup(*((SLDictLookup **)v7 + 21), *(SLDictionary **)(*((void *)v7 + 21) + 8), (const char *)v15, v16, a2, 1);
    if (v17) {
      goto LABEL_52;
    }
    uint64_t v18 = (uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1;
    if (v18 == 2)
    {
      SLToken::SetType(a2, 11);
      SLTokenList::push_back(a4, a2);
LABEL_75:
      uint64_t v24 = 1;
      goto LABEL_76;
    }
    SLPostLexerImpl::Transcribe((SLPostLexerImpl *)v17, a2, 1, 0, v18 - 1, &v44);
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    std::string __str = v44;
    if ((*((_DWORD *)a2 + 4) & 0x10) == 0) {
      goto LABEL_45;
    }
  }
  else if ((v11 & 0x10) == 0)
  {
    goto LABEL_45;
  }
  if ((unint64_t)(((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 3) <= 2)
  {
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v12 = &__str;
    }
    else {
      uint64_t v12 = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v13 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v13 = __str.__r_.__value_.__l.__size_;
    }
    if (SLDictLookup::Lookup(*((SLDictLookup **)v7 + 21), *(SLDictionary **)(*((void *)v7 + 21) + 24), (const char *)v12, v13, a2, 0))
    {
      if ((unint64_t)(((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 5) < 0xFFFFFFFFFFFFFFFCLL
        || SLToken::HasTag(a2, 90)
        || SLToken::HasTag(a2, 70)
        || *((unsigned char *)v7 + 244)
        || (SLPostLexerImpl::FollowedByAllCaps(v7) & 1) != 0)
      {
        goto LABEL_52;
      }
      *((_DWORD *)a2 + 4) &= ~0x40u;
      SLToken::clear(a2);
    }
    if (a3)
    {
      char v14 = 0;
LABEL_58:
      *((_DWORD *)a2 + 4) |= v8;
      if (*((unsigned char *)a2 + 4)
        && (*(unsigned int (**)(void))(**((void **)v7 + 22) + 176))(*((void *)v7 + 22)))
      {
        std::string::size_type v21 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
          std::string::size_type v21 = __str.__r_.__value_.__l.__size_;
        }
        std::string::basic_string(&v44, &__str, v21 - 2, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v47);
        if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
        {
          char v22 = (SLPostLexerImpl *)v44.__r_.__value_.__r.__words[0];
          if (v44.__r_.__value_.__l.__size_ != 2)
          {
            operator delete(v44.__r_.__value_.__l.__data_);
            goto LABEL_89;
          }
        }
        else
        {
          if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) != 2) {
            goto LABEL_89;
          }
          char v22 = (SLPostLexerImpl *)&v44;
        }
        BOOL v26 = *(_WORD *)v22 == 21287
           && ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 3 == *((unsigned __int8 *)a2 + 5);
        if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v44.__r_.__value_.__l.__data_);
          if (v26) {
LABEL_87:
          }
            SLPostLexerImpl::StripPossessive(v22, a2, a4);
        }
        else if (v26)
        {
          goto LABEL_87;
        }
      }
LABEL_89:
      if ((*((unsigned char *)a2 + 16) & 8) != 0 || *((unsigned char *)a2 + 4))
      {
        (*(void (**)(void, SLToken *, SLTokenList *))(**((void **)v7 + 22) + 32))(*((void *)v7 + 22), a2, a4);
        SLToken::~SLToken(a2);
        MEMORY[0x223CA4030]();
        goto LABEL_75;
      }
      SLTokenList::SLTokenList((SLTokenList *)&v44);
      int v27 = *((_DWORD *)a2 + 4);
      if ((v27 & 0x8000) != 0) {
        unint64_t v28 = 4;
      }
      else {
        unint64_t v28 = 2;
      }
      if (SLPostLexerImpl::FollowedByPeriod(v7, a2))
      {
        std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)&__str.__r_.__value_.__l.__data_, 46, (uint64_t)&v43);
        SLPostLexerImpl::HandleAbbreviation((uint64_t)v7);
      }
      if ((*((unsigned char *)a2 + 17) & 0x80) != 0
        && (unint64_t)(((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 5) <= 0xFFFFFFFFFFFFFFFBLL)
      {
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v42, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
        }
        else {
          std::string v42 = __str;
        }
        SLPostLexerImpl::HandleNameInitial();
      }
      if (v14)
      {
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unint64_t v29 = &__str;
        }
        else {
          unint64_t v29 = (std::string *)__str.__r_.__value_.__r.__words[0];
        }
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v30 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v30 = __str.__r_.__value_.__l.__size_;
        }
        int v31 = SLAgglomerate::Lookup(*(SLAgglomerate **)(*((void *)v7 + 21) + 32), (const char *)v29, v30, v28, (v27 & 0x8000) != 0, (SLTokenList *)&v44);
        int v32 = *((_DWORD *)a2 + 4);
        if (v31)
        {
          uint64_t v33 = *((void *)a2 + 4);
          *(_DWORD *)(*(void *)(v44.__r_.__value_.__r.__words[0] + 16) + 16) |= *((_DWORD *)a2 + 4) & 1;
          int v34 = *((_DWORD *)a2 + 4) & 0x10;
          SLToken::~SLToken(a2);
          MEMORY[0x223CA4030]();
          char v35 = 0;
          while (v44.__r_.__value_.__r.__words[2])
          {
            uint64_t v36 = *(void *)(v44.__r_.__value_.__l.__size_ + 16);
            if (!v36) {
              break;
            }
            *(_DWORD *)(v36 + 16) |= v34;
            if ((v35 & 1) != 0
              || ((*(uint64_t (**)(SLPostLexerImpl *, uint64_t))(*(void *)v7 + 184))(v7, v36) & 1) == 0)
            {
              *(unsigned char *)(v36 + 2) = 2;
            }
            else
            {
              char v35 = 1;
            }
            uint64_t v37 = ((uint64_t)(*(void *)(v36 + 64) - *(void *)(v36 + 56)) >> 1) - 1;
            *(void *)(v36 + 32) = v33;
            *(void *)(v36 + 40) = v37;
            uint64_t v38 = (void **)v44.__r_.__value_.__l.__size_;
            uint64_t v39 = *(void *)v44.__r_.__value_.__l.__size_;
            *(void *)(v39 + 8) = *(void *)(v44.__r_.__value_.__l.__size_ + 8);
            *v38[1] = v39;
            --v44.__r_.__value_.__r.__words[2];
            operator delete(v38);
            v33 += v37;
            SLTokenList::push_back(a4, (SLToken *)v36);
          }
LABEL_127:
          std::__list_imp<SLToken *>::clear(&v44);
          goto LABEL_75;
        }
      }
      else
      {
        int v32 = *((_DWORD *)a2 + 4);
      }
      if (*((unsigned char *)v7 + 241)
        && (v32 & 0x100) == 0
        && (unint64_t)(((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 52) >= 0xFFFFFFFFFFFFFFCDLL)
      {
        SLToken::clear(a2);
        operator new();
      }
      if ((v32 & 0x110) != 0
        || (unint64_t)(((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 52) <= 0xFFFFFFFFFFFFFFCCLL)
      {
        SLToken::SetType(a2, 11);
      }
      else
      {
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          size_t v40 = &__str;
        }
        else {
          size_t v40 = (std::string *)__str.__r_.__value_.__r.__words[0];
        }
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v41 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v41 = __str.__r_.__value_.__l.__size_;
        }
        SLDictLookup::Lookup(*((SLDictLookup **)v7 + 21), *(SLDictionary **)(*((void *)v7 + 21) + 16), (const char *)v40, v41, a2, 0);
      }
      SLTokenList::push_back(a4, a2);
      goto LABEL_127;
    }
    goto LABEL_79;
  }
LABEL_45:
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v19 = &__str;
  }
  else {
    uint64_t v19 = (std::string *)__str.__r_.__value_.__r.__words[0];
  }
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v20 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v20 = __str.__r_.__value_.__l.__size_;
  }
  if (SLDictLookup::Lookup(*((SLDictLookup **)v7 + 21), *(SLDictionary **)(*((void *)v7 + 21) + 8), (const char *)v19, v20, a2, 1))goto LABEL_52; {
  if (a3)
  }
  {
    char v14 = 1;
    goto LABEL_58;
  }
LABEL_79:
  uint64_t v24 = 0;
  *((_DWORD *)a2 + 4) |= v8;
LABEL_76:
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  return v24;
}

void sub_222A64BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  MEMORY[0x223CA4030](v31, 0x10F0C4034644DEDLL);
  std::__list_imp<SLToken *>::clear(&a22);
  if (*(char *)(v32 - 73) < 0) {
    operator delete(*(void **)(v32 - 96));
  }
  _Unwind_Resume(a1);
}

void std::vector<unsigned short>::push_back[abi:ne180100](uint64_t a1, _WORD *a2)
{
  uint64_t v4 = a1 + 16;
  unint64_t v5 = *(void *)(a1 + 16);
  __int16 v6 = *(_WORD **)(a1 + 8);
  if ((unint64_t)v6 >= v5)
  {
    int v8 = *(_WORD **)a1;
    uint64_t v9 = (uint64_t)v6 - *(void *)a1;
    if (v9 <= -3) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v9 >> 1;
    unint64_t v11 = v5 - (void)v8;
    if (v11 <= (v9 >> 1) + 1) {
      unint64_t v12 = v10 + 1;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v11 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v12;
    }
    if (v13)
    {
      char v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v4, v13);
      int v8 = *(_WORD **)a1;
      __int16 v6 = *(_WORD **)(a1 + 8);
    }
    else
    {
      char v14 = 0;
    }
    uint64_t v15 = &v14[2 * v10];
    std::string::size_type v16 = &v14[2 * v13];
    *(_WORD *)uint64_t v15 = *a2;
    BOOL v7 = v15 + 2;
    while (v6 != v8)
    {
      __int16 v17 = *--v6;
      *((_WORD *)v15 - 1) = v17;
      v15 -= 2;
    }
    *(void *)a1 = v15;
    *(void *)(a1 + 8) = v7;
    *(void *)(a1 + 16) = v16;
    if (v8) {
      operator delete(v8);
    }
  }
  else
  {
    *__int16 v6 = *a2;
    BOOL v7 = v6 + 1;
  }
  *(void *)(a1 + 8) = v7;
}

BOOL SLPostLexerImpl::FollowedByPeriod(SLPostLexerImpl *this, SLToken *a2)
{
  uint64_t v3 = SLLexerBuffer::operator[]((void *)this + 12, 0);
  uint64_t v4 = 0;
  if ((*((unsigned char *)a2 + 16) & 1) == 0 && v3) {
    return (uint64_t (**)(void))(*((void *)a2 + 5) + *((void *)a2 + 4)) == v3[4]
  }
        && *(unsigned char *)v3 == 13
        && *(unsigned __int16 *)v3[7] == 46;
  return v4;
}

void SLPostLexerImpl::HandleAbbreviation(uint64_t a1)
{
  uint64_t v1 = (void *)(a1 + 96);
  SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
  SLLexerBuffer::operator[](v1, 1uLL);
  operator new();
}

void sub_222A65334(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  uint64_t result = std::string::basic_string[abi:ne180100](a3, v5 + 1);
  if (*(char *)(result + 23) >= 0) {
    BOOL v7 = (char *)result;
  }
  else {
    BOOL v7 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      int v8 = a1;
    }
    else {
      int v8 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v7, v8, v5);
  }
  uint64_t v9 = &v7[v5];
  *uint64_t v9 = a2;
  v9[1] = 0;
  return result;
}

uint64_t SLPostLexerImpl::FollowedByAllCaps(SLPostLexerImpl *this)
{
  unint64_t v2 = 0;
  uint64_t v3 = (void *)((char *)this + 96);
  while (1)
  {
    uint64_t result = (uint64_t)SLLexerBuffer::operator[](v3, v2);
    if (!result) {
      break;
    }
    uint64_t v5 = result;
    if (!*(unsigned char *)result)
    {
      SLPostLexerImpl::Classify((SLPostLexerImpl *)result, (SLToken *)result);
      unint64_t v7 = *(unsigned __int8 *)(v5 + 5);
      if (((uint64_t)(*(void *)(v5 + 64) - *(void *)(v5 + 56)) >> 1) - 1 != v7) {
        return 0;
      }
      SLPostLexerImpl::Transcribe(v6, (SLToken *)v5, 2, 0, v7, &__p);
      SLTmpLookup::SLTmpLookup(v10, &__p, *((void *)this + 21));
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (!v10[0])
      {
        SLTmpLookup::~SLTmpLookup((SLTmpLookup *)v10);
        return 1;
      }
      BOOL HasTag = SLToken::HasTag(v11, 70);
      SLTmpLookup::~SLTmpLookup((SLTmpLookup *)v10);
      if (!HasTag) {
        return 1;
      }
    }
    if (++v2 == 7) {
      return 0;
    }
  }
  return result;
}

void sub_222A654F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
}

BOOL std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1) {
        goto LABEL_10;
      }
      a1 = (void *)*a1;
      return memcmp(a1, __s, v4) == 0;
    }
  }
  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1) {
LABEL_10:
    }
      std::string::__throw_out_of_range[abi:ne180100]();
    return memcmp(a1, __s, v4) == 0;
  }
  return 0;
}

void SLPostLexerImpl::StripPossessive(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
}

void sub_222A65928(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLPostLexerImpl::HandleNameInitial()
{
}

void sub_222A65B2C(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLToken::SLToken(SLToken *this, const SLToken *a2)
{
  long long v4 = *(_OWORD *)a2;
  long long v5 = *((_OWORD *)a2 + 1);
  long long v6 = *((_OWORD *)a2 + 2);
  *((void *)this + 6) = *((void *)a2 + 6);
  *((_OWORD *)this + 1) = v5;
  *((_OWORD *)this + 2) = v6;
  *(_OWORD *)this = v4;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>((void *)this + 7, *((const void **)a2 + 7), *((void *)a2 + 8), (uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1);
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  std::vector<SLHomograph *>::__init_with_size[abi:ne180100]<SLHomograph **,SLHomograph **>((void *)this + 10, *((const void **)a2 + 10), *((void *)a2 + 11), (uint64_t)(*((void *)a2 + 11) - *((void *)a2 + 10)) >> 3);
}

void sub_222A65BF0(_Unwind_Exception *exception_object)
{
  long long v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 64) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(exception_object);
}

BOOL SLPostLexerImpl::EmphasizeAgglomeratedWord(SLPostLexerImpl *this, SLToken *a2)
{
  return !SLToken::HasTag(a2, 68);
}

uint64_t SLPostLexerImpl::IsCompassDirection(SLPostLexerImpl *this, SLToken *a2)
{
  return 0;
}

uint64_t SLPostLexerImpl::IsHouseNumber(SLPostLexerImpl *this, SLToken *a2)
{
  return 0;
}

void SLPostLexerImpl::Transcribe(SLPostLexerImpl *a1@<X0>, SLToken *a2@<X1>, int a3@<W2>, unint64_t a4@<X3>, unint64_t a5@<X4>, std::string *a6@<X8>)
{
  SLPostLexerImpl::Classify(a1, a2);
  a6->__r_.__value_.__r.__words[0] = 0;
  a6->__r_.__value_.__l.__size_ = 0;
  a6->__r_.__value_.__r.__words[2] = 0;
  if (a4 < a5)
  {
    do
    {
      unint64_t v11 = *(unsigned __int16 *)(*((void *)a2 + 7) + 2 * a4);
      uint64_t v12 = v11 & 0x3F | (SLChar::sUniMap[v11 >> 6] << 6);
      if (SLChar::sCharClass[v12] == 4)
      {
        std::string::push_back(a6, 39);
      }
      else if (v11 != 173)
      {
        if (a3 == 2)
        {
          unsigned __int16 v13 = SLChar::sToUpper[v12] + v11;
          switch(v13)
          {
            case 0xFB00u:
LABEL_21:
              unsigned __int16 v13 = 70;
              std::string::push_back(a6, 70);
              goto LABEL_10;
            case 0xFB01u:
              goto LABEL_23;
            case 0xFB02u:
              goto LABEL_25;
            case 0xFB03u:
LABEL_22:
              std::string::push_back(a6, 70);
LABEL_23:
              std::string::push_back(a6, 70);
              unsigned __int16 v13 = 73;
              goto LABEL_10;
            case 0xFB04u:
LABEL_24:
              std::string::push_back(a6, 70);
LABEL_25:
              std::string::push_back(a6, 70);
              unsigned __int16 v13 = 76;
              break;
            case 0xFB05u:
            case 0xFB06u:
LABEL_16:
              std::string::push_back(a6, 83);
              unsigned __int16 v13 = 84;
              break;
            default:
              goto LABEL_10;
          }
          goto LABEL_10;
        }
        if (a3 != 1)
        {
          if (a3) {
            unsigned __int16 v13 = 0;
          }
          else {
            unsigned __int16 v13 = *(_WORD *)(*((void *)a2 + 7) + 2 * a4);
          }
          goto LABEL_10;
        }
        unsigned __int16 v13 = SLChar::sFoldAll[v12] + v11;
        if (v13 > 0x1E9Du)
        {
          switch(v13)
          {
            case 0xFB00u:
              goto LABEL_21;
            case 0xFB01u:
              goto LABEL_23;
            case 0xFB02u:
              goto LABEL_25;
            case 0xFB03u:
              goto LABEL_22;
            case 0xFB04u:
              goto LABEL_24;
            case 0xFB05u:
            case 0xFB06u:
              goto LABEL_16;
            default:
              if (v13 == 7838)
              {
                unsigned __int16 v13 = 83;
                std::string::push_back(a6, 83);
              }
              break;
          }
          goto LABEL_10;
        }
        switch(v13)
        {
          case 0xC6u:
            std::string::value_type v14 = 65;
LABEL_29:
            std::string::push_back(a6, v14);
            unsigned __int16 v13 = 69;
            break;
          case 0x132u:
            std::string::push_back(a6, 73);
            unsigned __int16 v13 = 74;
            break;
          case 0x152u:
            std::string::value_type v14 = 79;
            goto LABEL_29;
        }
LABEL_10:
        SLChar::PushUTF8(a6, v13);
      }
      ++a4;
    }
    while (a5 != a4);
  }
}

void sub_222A65E80(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLPostLexerImpl::HasApostrophe(SLPostLexerImpl *this, SLToken *a2)
{
  long long v4 = SLLexerBuffer::operator[]((void *)this + 12, 0);
  uint64_t result = 0;
  if ((*((unsigned char *)a2 + 16) & 1) == 0 && v4)
  {
    if (*(unsigned char *)v4 == 4
      && SLChar::sCharClass[*(_WORD *)v4[7] & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)v4[7] >> 6] << 6)] == 4)
    {
      uint64_t v6 = *((void *)this + 28);
      if (v6 == *((void *)this + 27)) {
        return 1;
      }
      else {
        return (*(unsigned int (**)(SLPostLexerImpl *, void))(*(void *)this + 72))(this, *(unsigned __int16 *)(v6 - 2)) ^ 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t SLPostLexerImpl::HandleTokenInDictionary(SLPostLexerImpl *this, SLToken *a2)
{
  SLTokenList::SLTokenList((SLTokenList *)v13);
  BOOL HasPossessive = SLPostLexerImpl::HasPossessive(this, a2);
  BOOL v5 = HasPossessive;
  SLPostLexerImpl::Classify((SLPostLexerImpl *)HasPossessive, a2);
  if (*((unsigned char *)a2 + 5) == 2)
  {
    uint64_t v6 = (unsigned __int16 *)*((void *)a2 + 7);
    if (v6[2] == 45
      && ((SLChar::sCharClass[*v6 & 0x3F | (SLChar::sUniMap[(unint64_t)*v6 >> 6] << 6)] & 0x3F) == 0x21
       || (SLChar::sCharClass[v6[1] & 0x3F | (SLChar::sUniMap[(unint64_t)v6[1] >> 6] << 6)] & 0x3F) == 0x21))
    {
      goto LABEL_15;
    }
  }
  if (!SLPostLexerImpl::HasApostrophe(this, a2))
  {
LABEL_10:
    if (SLPostLexerImpl::HandleLookup(this, a2, 0, (SLTokenList *)v13))
    {
      if (v5) {
        SLPostLexerImpl::HandlePossessive(this, *(SLToken **)(v13[0] + 16));
      }
      SLPostLexerImpl::push_front(this, (const SLTokenList *)v13);
      goto LABEL_14;
    }
LABEL_15:
    uint64_t v11 = 0;
    goto LABEL_16;
  }
  unint64_t v7 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
  *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
  std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
  int v8 = (char *)(*((void *)a2 + 8) - 2);
  LOWORD(v14) = 39;
  std::vector<unsigned short>::insert((uint64_t)a2 + 56, v8, &v14);
  ++*((void *)a2 + 5);
  if (!SLPostLexerImpl::HandleLookup(this, a2, 0, (SLTokenList *)v13))
  {
    --*((void *)a2 + 5);
    uint64_t v9 = *((void *)a2 + 8);
    uint64_t v10 = v9 - 4;
    memmove((void *)(v9 - 4), (const void *)(v9 - 2), 2uLL);
    *((void *)a2 + 8) = v10 + 2;
    std::string::value_type v14 = v7;
    std::deque<SLToken *>::push_front((uint64_t)this + 120, &v14);
    goto LABEL_10;
  }
  SLPostLexerImpl::push_front(this, (const SLTokenList *)v13);
  if (v7)
  {
    SLToken::~SLToken(v7);
    MEMORY[0x223CA4030]();
  }
LABEL_14:
  uint64_t v11 = 1;
LABEL_16:
  std::__list_imp<SLToken *>::clear(v13);
  return v11;
}

void sub_222A661C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__list_imp<SLToken *>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t SLPostLexerImpl::HandleURLInSymbols(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  SLPostLexerImpl::Transcribe(this, a2, 2, 0, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, &v8);
  long long v4 = std::string::insert(&v8, 0, "//");
  long long v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  int64_t v10 = v4->__r_.__value_.__r.__words[2];
  *(_OWORD *)std::string __p = v5;
  v4->__r_.__value_.__l.__size_ = 0;
  v4->__r_.__value_.__r.__words[2] = 0;
  v4->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  if (v10 >= 0) {
    uint64_t v6 = __p;
  }
  else {
    uint64_t v6 = (void **)__p[0];
  }
  if ((*(uint64_t (**)(void, void **))(**((void **)this + 22) + 208))(*((void *)this + 22), v6)) {
    operator new();
  }
  if (SHIBYTE(v10) < 0) {
    operator delete(__p[0]);
  }
  return 0;
}

void sub_222A66674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLPostLexerImpl::FindUnit(SLPostLexerImpl *this, SLToken *a2, unint64_t a3, unint64_t a4, int a5)
{
  v20[2] = *MEMORY[0x263EF8340];
  SLPostLexerImpl::Transcribe(this, a2, 0, a3, a4, &v18);
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v10.__i_ = (std::__wrap_iter<const char *>::iterator_type)&v18;
  }
  else {
    v10.__i_ = (std::__wrap_iter<const char *>::iterator_type)v18.__r_.__value_.__r.__words[0];
  }
  std::string::insert(&v18, v10, a5);
  std::string __p = v18;
  if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)v18.__r_.__value_.__r.__words[0];
  }
  uint64_t v12 = (*(uint64_t (**)(void, std::string *))(**((void **)this + 22) + 208))(*((void *)this + 22), p_p);
  if (!v12)
  {
    if (a5 == 43 || a4 - a3 > 1 || *(unsigned __int16 *)(*((void *)a2 + 7) + 2 * a3) >= 0x100u)
    {
      SLPostLexerImpl::Transcribe(0, a2, 2, a3, a4, &v18);
      if ((v18.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        v13.__i_ = (std::__wrap_iter<const char *>::iterator_type)&v18;
      }
      else {
        v13.__i_ = (std::__wrap_iter<const char *>::iterator_type)v18.__r_.__value_.__r.__words[0];
      }
      std::string::insert(&v18, v13, a5);
      v20[0] = v18.__r_.__value_.__l.__size_;
      std::string::size_type v14 = v18.__r_.__value_.__r.__words[0];
      *(void *)((char *)v20 + 7) = *(std::string::size_type *)((char *)&v18.__r_.__value_.__r.__words[1] + 7);
      char v15 = HIBYTE(v18.__r_.__value_.__r.__words[2]);
      memset(&v18, 0, sizeof(v18));
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        __p.__r_.__value_.__r.__words[0] = v14;
        __p.__r_.__value_.__l.__size_ = v20[0];
        *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v20 + 7);
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = v15;
        if (SHIBYTE(v18.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v18.__r_.__value_.__l.__data_);
          char v15 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
          std::string::size_type v14 = __p.__r_.__value_.__r.__words[0];
        }
      }
      else
      {
        __p.__r_.__value_.__r.__words[0] = v14;
        __p.__r_.__value_.__l.__size_ = v20[0];
        *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v20 + 7);
        *((unsigned char *)&__p.__r_.__value_.__s + 23) = v15;
      }
      if (v15 >= 0) {
        std::string::size_type v16 = &__p;
      }
      else {
        std::string::size_type v16 = (std::string *)v14;
      }
      uint64_t v12 = (*(uint64_t (**)(void, std::string *))(**((void **)this + 22) + 208))(*((void *)this + 22), v16);
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v12;
}

void sub_222A66904(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLPostLexerImpl::FindCommonCountable(SLPostLexerImpl *this, SLToken *a2, unint64_t a3)
{
  SLPostLexerImpl::Transcribe(this, a2, 2, a3, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, &__p);
  SLTmpLookup::SLTmpLookup(v6, &__p, *((void *)this + 21));
  if (v6[0] && SLToken::HasTag(v7, 86)) {
    uint64_t v4 = SLPostLexerImpl::GenerateSymbol((uint64_t)this, &__p, 0x7FFFFFFF, 86, 0);
  }
  else {
    uint64_t v4 = 0;
  }
  SLTmpLookup::~SLTmpLookup((SLTmpLookup *)v6);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v4;
}

void sub_222A66A08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t SLPostLexerImpl::IsCopyright(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v6 = (void *)((char *)this + 96);
  unint64_t v7 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
  if (!v7) {
    return 0;
  }
  std::string v8 = v7;
  uint64_t v9 = (char *)*((void *)v7 + 7);
  if (*((void *)v7 + 8) - (void)v9 != 4) {
    return 0;
  }
  if ((unsigned __int16)(SLChar::sToUpper[*(_WORD *)v9 & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)v9 >> 6] << 6)]
                        + *(_WORD *)v9) != 67)
    return 0;
  if (*((unsigned char *)v7 + 16)) {
    return 0;
  }
  std::string::const_iterator v10 = (SLToken *)SLLexerBuffer::operator[](v6, 1uLL);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  if (**((_WORD **)v10 + 7) != 41) {
    return 0;
  }
  uint64_t v12 = SLLexerBuffer::operator[](v6, 2uLL);
  if (!v12) {
    return 0;
  }
  if (*(unsigned char *)v12 == 1)
  {
    if ((*((unsigned char *)v12 + 17) & 0x10) == 0 && (char *)v12[8] - (char *)v12[7] == 10) {
      goto LABEL_18;
    }
    return 0;
  }
  if (*(unsigned char *)v12) {
    return 0;
  }
  std::string::const_iterator v13 = (char *)v12[7];
  if ((v12[2] & 0x11000) != 0x10000
    || (unsigned __int16)(SLChar::sToUpper[*(_WORD *)v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)v13 >> 6] << 6)]
                        + *(_WORD *)v13) != 77)
  {
    SLPostLexerImpl::Transcribe((SLPostLexerImpl *)v12, (SLToken *)v12, 2, 0, (((char *)v12[8] - v13) >> 1) - 1, &__p);
    BOOL v14 = std::operator==[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&__p, "COPYRIGHT");
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (!v14) {
      return 0;
    }
  }
LABEL_18:
  uint64_t v15 = *((void *)this + 20) - 1;
  ++*((void *)this + 19);
  *((void *)this + 20) = v15;
  uint64_t v16 = 1;
  std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
  *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
  std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
  SLToken::~SLToken(v8);
  MEMORY[0x223CA4030]();
  SLToken::~SLToken(v11);
  MEMORY[0x223CA4030]();
  SLToken::SetType(a2, 11);
  **((_WORD **)a2 + 7) = 169;
  *((void *)a2 + 5) = 3;
  SLTokenList::push_back(a3, a2);
  return v16;
}

uint64_t SLPostLexerImpl::SeenMatchingParenQuote(SLPostLexerImpl *this, uint64_t a2, char a3, SLTokenList *a4)
{
  unint64_t v7 = (_WORD *)*((void *)this + 28);
  std::string v8 = (void *)((char *)this + 216);
  if (v7 == *((_WORD **)this + 27))
  {
    if (a3) {
      return 0;
    }
  }
  else
  {
    int v9 = (unsigned __int16)*(v7 - 1);
    int v10 = (*(uint64_t (**)(SLPostLexerImpl *, void, uint64_t))(*(void *)this + 72))(this, (unsigned __int16)*(v7 - 1), a2);
    uint64_t v11 = *((void *)this + 28);
    if (v10)
    {
      *((void *)this + 28) = v11 - 2;
      return 1;
    }
    uint64_t v13 = v11 - *v8;
    if ((unint64_t)v13 >= 3
      && (a2 == 41 || a2 == 93 || a2 == 125 || v9 != 40 && v9 != 91 && v9 != 123)
      && (*(unsigned int (**)(SLPostLexerImpl *, void, uint64_t))(*(void *)this + 72))(this, *(unsigned __int16 *)(*v8 + 2 * (v13 >> 1) - 4), a2))
    {
      *((void *)this + 28) -= 4;
      operator new();
    }
    if (a3) {
      return 0;
    }
    unint64_t v7 = (_WORD *)*((void *)this + 28);
  }
  unint64_t v14 = *((void *)this + 29);
  if ((unint64_t)v7 >= v14)
  {
    uint64_t v16 = (_WORD *)*v8;
    uint64_t v17 = (uint64_t)v7 - *v8;
    if (v17 <= -3) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v18 = v17 >> 1;
    unint64_t v19 = v14 - (void)v16;
    if (v19 <= (v17 >> 1) + 1) {
      unint64_t v20 = v18 + 1;
    }
    else {
      unint64_t v20 = v19;
    }
    if (v19 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v21 = v20;
    }
    if (v21)
    {
      char v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)this + 232, v21);
      uint64_t v16 = (_WORD *)*((void *)this + 27);
      unint64_t v7 = (_WORD *)*((void *)this + 28);
    }
    else
    {
      char v22 = 0;
    }
    int v23 = &v22[2 * v18];
    uint64_t v24 = &v22[2 * v21];
    *(_WORD *)int v23 = a2;
    uint64_t v15 = v23 + 2;
    while (v7 != v16)
    {
      __int16 v25 = *--v7;
      *((_WORD *)v23 - 1) = v25;
      v23 -= 2;
    }
    *((void *)this + 27) = v23;
    *((void *)this + 28) = v15;
    *((void *)this + 29) = v24;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    *unint64_t v7 = a2;
    uint64_t v15 = v7 + 1;
  }
  uint64_t result = 0;
  *((void *)this + 28) = v15;
  return result;
}

void sub_222A67044(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void *SLLexerBuffer::insert(SLLexerBuffer *this, uint64_t a2, SLToken *a3)
{
  int v10 = a3;
  uint64_t v3 = *((void *)this + 4);
  if (*((void *)this + 5) == v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = *(void *)(v3 + 8 * (*((void *)this + 7) >> 9)) + 8 * (*((void *)this + 7) & 0x1FFLL);
  }
  long long v5 = (void **)((char *)this + 24);
  v9[0] = v3 + 8 * (*((void *)this + 7) >> 9);
  v9[1] = v4;
  uint64_t v6 = (char *)std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator+[abi:ne180100]((uint64_t)v9, a2);
  return std::deque<SLToken *>::insert(v5, v6, v7, (char *)&v10);
}

uint64_t SLPostLexerImpl::MatchingParenQuote(SLPostLexerImpl *this, int a2, int a3)
{
  uint64_t result = 0;
  if (a2 > 8217)
  {
    if (a2 > 8244)
    {
      switch(a2)
      {
        case 8245:
          int v9 = 8242;
          return a3 == v9;
        case 8246:
          int v9 = 8243;
          return a3 == v9;
        case 8249:
          int v9 = 8250;
          return a3 == v9;
        case 8250:
          int v9 = 8249;
          return a3 == v9;
        default:
          return result;
      }
    }
    if ((a2 - 8218) < 2)
    {
LABEL_34:
      BOOL v10 = a3 == 8218 && a2 != 8218;
      return a3 == 8217 || v10;
    }
    if ((a2 - 8222) < 2 || a2 == 8220)
    {
      if (a3 == 8221) {
        return 1;
      }
      else {
        return a3 == 8222 && a2 != 8222;
      }
    }
  }
  else if (a2 <= 95)
  {
    BOOL v4 = a3 == 41;
    BOOL v5 = a3 == 93;
    if (a2 != 91) {
      BOOL v5 = 0;
    }
    if (a2 != 40) {
      BOOL v4 = v5;
    }
    BOOL v6 = a3 == 34;
    BOOL v8 = a3 == 39 || a3 == 180;
    if (a2 != 39) {
      BOOL v8 = 0;
    }
    if (a2 != 34) {
      BOOL v6 = v8;
    }
    if (a2 <= 39) {
      return v6;
    }
    else {
      return v4;
    }
  }
  else
  {
    if (a2 > 170)
    {
      switch(a2)
      {
        case 171:
          BOOL v14 = a3 == 187;
          break;
        case 187:
          BOOL v14 = a3 == 171;
          break;
        case 8216:
          goto LABEL_34;
        default:
          return result;
      }
      return v14;
    }
    BOOL v11 = a3 == 180;
    if (a3 == 96) {
      BOOL v11 = 1;
    }
    unsigned int v12 = a3 == 39 || v11;
    BOOL v13 = a3 == 125;
    if (a2 != 123) {
      BOOL v13 = 0;
    }
    if (a2 == 96) {
      return v12;
    }
    else {
      return v13;
    }
  }
  return result;
}

void SLPostLexerImpl::HandlePunct(SLPostLexerImpl *this, SLToken *a2)
{
  BOOL v4 = SLLexerBuffer::operator[]((void *)this + 12, 0);
  if (v4
    && *(unsigned char *)v4 == 1
    && (*((unsigned char *)a2 + 17) & 0x20) != 0
    && (uint64_t Unit = (char **)SLPostLexerImpl::FindUnit(this, a2, 0, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, 36)) != 0)
  {
    SLPostLexerImpl::HandleCurrency((uint64_t)this, Unit, a2);
  }
  else
  {
    if (**((_WORD **)a2 + 7) == 45)
    {
      SLToken::~SLToken(a2);
      JUMPOUT(0x223CA4030);
    }
    SLToken::SetType(a2, 11);
    BOOL v6 = a2;
    std::deque<SLToken *>::push_front((uint64_t)this + 120, &v6);
  }
}

uint64_t SLPostLexerImpl::GenerateSymbol(uint64_t a1, const std::string *a2, int a3, __int16 a4, __int16 a5)
{
  uint64_t v9 = *(void *)(a1 + 264);
  uint64_t v10 = a1 + 336;
  std::string::operator=((std::string *)(a1 + 336 + 24 * v9), a2);
  uint64_t v11 = *(void *)(a1 + 264);
  unsigned int v12 = (uint64_t **)(v10 + 24 * v11);
  if (*((char *)v12 + 23) < 0) {
    unsigned int v12 = (uint64_t **)*v12;
  }
  uint64_t v13 = a1 + 16 * v9;
  uint64_t result = v13 + 272;
  *(void *)(v13 + 272) = v12;
  *(_DWORD *)(v13 + 280) = a3;
  *(_WORD *)(v13 + 284) = a4;
  *(_WORD *)(v13 + 286) = a5;
  *(void *)(a1 + 264) = ((_BYTE)v11 + 1) & 3;
  return result;
}

uint64_t SLPostLexerImpl::FindUnitModifier(SLPostLexerImpl *this, SLToken *a2, SLToken *a3, char *a4)
{
  *a4 = 0;
  if (!a2) {
    return 0;
  }
  BOOL v4 = (unsigned __int16 *)*((void *)a2 + 7);
  if (*((void *)a2 + 8) - (void)v4 != 4) {
    return 0;
  }
  uint64_t result = 0;
  int v9 = *v4;
  if (v9 <= 178)
  {
    if (v9 != 47)
    {
      if (v9 != 178) {
        return result;
      }
      char v11 = 50;
      goto LABEL_20;
    }
    char v10 = 47;
LABEL_14:
    char v11 = 0;
    *a4 = v10;
    if (!a3 || (*((_DWORD *)a2 + 4) & 1) != 0) {
      goto LABEL_20;
    }
    uint64_t result = SLPostLexerImpl::FindUnit(this, a3, 0, ((uint64_t)(*((void *)a3 + 8) - *((void *)a3 + 7)) >> 1) - 1, 124);
    if (!result)
    {
      uint64_t result = SLPostLexerImpl::FindUnit(this, a3, 0, ((uint64_t)(*((void *)a3 + 8) - *((void *)a3 + 7)) >> 1) - 1, 35);
      if (!result)
      {
        uint64_t result = SLPostLexerImpl::FindCommonCountable(this, a3, 0);
        if (!result)
        {
          char v11 = 0;
          goto LABEL_20;
        }
      }
    }
    return result;
  }
  if (v9 == 179)
  {
    char v11 = 51;
LABEL_20:
    uint64_t result = 0;
    *a4 = v11;
    return result;
  }
  if (v9 == 8901 || v9 == 183)
  {
    char v10 = 42;
    goto LABEL_14;
  }
  return result;
}

uint64_t SLPostLexerImpl::AppendFullUnit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, int a8)
{
  int v8 = a8;
  uint64_t UnitModifier = a7;
  int v10 = a6;
  if (a7) {
    BOOL v12 = a8 == 42;
  }
  else {
    BOOL v12 = 0;
  }
  unsigned int v13 = !v12;
  if (a6) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(void **)(a1 + 176)
                                                                                          + 240))(*(void *)(a1 + 176), a2, a3, v14, a4, a5);
  if (v8)
  {
    do
    {
      uint64_t v16 = UnitModifier;
      uint64_t UnitModifier = 0;
      int v17 = *((_DWORD *)SLLexerBuffer::operator[]((void *)(a1 + 96), 0) + 4);
      char v28 = 0;
      uint64_t v18 = (char)v8;
      if ((int)v18 >= 50) {
        unint64_t v19 = 1;
      }
      else {
        unint64_t v19 = 2;
      }
      if ((v17 & 1) == 0)
      {
        unint64_t v20 = (SLToken *)SLLexerBuffer::operator[]((void *)(a1 + 96), v19);
        uint64_t v21 = (SLToken *)SLLexerBuffer::operator[]((void *)(a1 + 96), (v19 + 1));
        uint64_t UnitModifier = SLPostLexerImpl::FindUnitModifier((SLPostLexerImpl *)a1, v20, v21, &v28);
      }
      v10 &= v14 ^ 1;
      if (v10)
      {
        if (UnitModifier) {
          BOOL v22 = v28 == 42;
        }
        else {
          BOOL v22 = 0;
        }
        uint64_t v14 = !v22;
      }
      else
      {
        uint64_t v14 = 0;
      }
      uint64_t v23 = *(void *)(a1 + 176);
      uint64_t v24 = SLLexerBuffer::operator[]((void *)(a1 + 96), (v19 - 1));
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (**)(void), uint64_t (**)(void)))(*(void *)v23 + 248))(v23, v16, v18, v14, a3, v24[4], v24[5]);
      __int16 v25 = (SLToken *)SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
      *(int64x2_t *)(a1 + 152) = vaddq_s64(*(int64x2_t *)(a1 + 152), (int64x2_t)xmmword_222ABEE70);
      uint64_t result = std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](a1 + 120, 1);
      if (v25)
      {
        SLToken::~SLToken(v25);
        uint64_t result = MEMORY[0x223CA4030]();
      }
      if ((int)v18 <= 49)
      {
        BOOL v26 = (SLToken *)SLLexerBuffer::operator[]((void *)(a1 + 96), 0);
        *(int64x2_t *)(a1 + 152) = vaddq_s64(*(int64x2_t *)(a1 + 152), (int64x2_t)xmmword_222ABEE70);
        uint64_t result = std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100](a1 + 120, 1);
        if (v26)
        {
          SLToken::~SLToken(v26);
          uint64_t result = MEMORY[0x223CA4030]();
        }
      }
      LOBYTE(v8) = v28;
    }
    while (v28);
  }
  return result;
}

char *SLPostLexerImpl::AppendMorph(SLPostLexerImpl *this, SLToken *a2, char *a3, char *a4)
{
  return std::vector<unsigned short>::__insert_with_size[abi:ne180100]<unsigned short const*,unsigned short const*>((uint64_t)a2 + 56, *((void *)a2 + 8) - 2, a3, a4, (a4 - a3) >> 1);
}

void SLPostLexerImpl::HandleElapsedSymbol(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  BOOL v6 = (void *)((char *)this + 96);
  uint64_t v7 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 12, 0);
  if (!v7) {
    goto LABEL_26;
  }
  int v8 = v7;
  if ((*((unsigned char *)v7 + 18) & 0x80) == 0) {
    goto LABEL_26;
  }
  SLDissecter::DissectUnit(*((void *)this + 23), (uint64_t)a2, (uint64_t)v25);
  SLPostLexerImpl::Transcribe(v9, a2, 2, v26, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, &v24);
  SLDissecter::DissectUnit(*((void *)this + 23), (uint64_t)v8, (uint64_t)v25);
  SLPostLexerImpl::Transcribe(v10, v8, 2, v26, ((uint64_t)(*((void *)v8 + 8) - *((void *)v8 + 7)) >> 1) - 1, &__p);
  for (unint64_t i = 0; ; unint64_t i = v22 + 1)
  {
    unint64_t v22 = i;
    if (((*(uint64_t (**)(SLPostLexerImpl *, std::string *, unint64_t *))(*(void *)this + 152))(this, &v24, &v22) & 1) == 0|| (unint64_t v21 = v22 + 1, ((*(uint64_t (**)(SLPostLexerImpl *, std::string *, unint64_t *))(*(void *)this + 152))(this, &__p, &v21) & 1) == 0))
    {
LABEL_16:
      for (unint64_t j = 0; ; ++j)
      {
        int v17 = SLLexerBuffer::operator[](v6, j);
        if (!v17) {
          break;
        }
        int v18 = *((_DWORD *)v17 + 4);
        if ((v18 & 0x800000) == 0) {
          break;
        }
        *((_DWORD *)v17 + 4) = v18 & 0xFF7FFFFF;
      }
      char v19 = 1;
      goto LABEL_21;
    }
    if ((*(unsigned int (**)(SLPostLexerImpl *, unint64_t, unint64_t))(*(void *)this + 160))(this, v22, v21))
    {
      break;
    }
  }
  for (unint64_t k = 1; ; ++k)
  {
    unsigned int v13 = (SLToken *)SLLexerBuffer::operator[](v6, k);
    uint64_t v14 = v13;
    if (!v13 || (*((unsigned char *)v13 + 18) & 0x80) == 0) {
      break;
    }
    SLDissecter::DissectUnit(*((void *)this + 23), (uint64_t)v13, (uint64_t)v25);
    SLPostLexerImpl::Transcribe(v15, v14, 2, v26, ((uint64_t)(*((void *)v14 + 8) - *((void *)v14 + 7)) >> 1) - 1, &v20);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v20;
    v20.__r_.__value_.__r.__words[0] = v21 + 1;
    if (!(*(unsigned int (**)(SLPostLexerImpl *, std::string *, std::string *))(*(void *)this + 152))(this, &__p, &v20)|| ((*(uint64_t (**)(SLPostLexerImpl *, unint64_t, std::string::size_type))(*(void *)this+ 160))(this, v21, v20.__r_.__value_.__r.__words[0]) & 1) == 0)
    {
      goto LABEL_16;
    }
    unint64_t v21 = v20.__r_.__value_.__r.__words[0];
  }
  SLPostLexerImpl::PronounceElapsed(this, a2, v22, a3);
  char v19 = 0;
LABEL_21:
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (v19)
  {
LABEL_26:
    *((_DWORD *)a2 + 4) &= ~0x800000u;
    SLTokenList::push_back(a3, a2);
  }
}

void sub_222A67ADC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

void SLPostLexerImpl::HandleThousandsSeparators(SLPostLexerImpl *this, SLToken *a2, char a3)
{
  int v6 = **(char **)(*(uint64_t (**)(void, uint64_t))(**((void **)this + 22) + 216))(*((void *)this + 22), 207);
  SLDissecter::DissectNumber(*((void *)this + 23), (uint64_t)a2, 0, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, (uint64_t)v28);
  if (v31 <= 0x3E7 && v28[4] == 0 && v29 >= *((void *)a2 + 5))
  {
    int v8 = SLLexerBuffer::operator[]((void *)this + 12, 1uLL);
    if (v8)
    {
      BOOL v9 = 0;
      int v10 = 0;
      uint64_t v11 = 0;
      unint64_t v12 = 3;
      while (1)
      {
        uint64_t v13 = (uint64_t)v8;
        int v14 = *(unsigned __int8 *)v8;
        if (v14 != 1) {
          break;
        }
        if (v9) {
          goto LABEL_39;
        }
        uint64_t v15 = (char *)v8[7];
        if (SLChar::sCharClass[*(_WORD *)v15 & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)v15 >> 6] << 6)] != 2) {
          goto LABEL_39;
        }
        int v16 = *((_DWORD *)v8 + 4);
        if ((v16 & 0x1000) != 0)
        {
          SLDissecter::DissectUnit(*((void *)this + 23), (uint64_t)v8, (uint64_t)v27);
          if (LOBYTE(v27[0])) {
            BOOL v17 = a3 == 43;
          }
          else {
            BOOL v17 = 0;
          }
          if (v17) {
            a3 = 42;
          }
          if (!SLPostLexerImpl::FindUnit(this, a2, v27[3], ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, a3))goto LABEL_39; {
          uint64_t v11 = v27[1];
          }
          uint64_t v18 = v27[2];
        }
        else
        {
          uint64_t v18 = (((char *)v8[8] - v15) >> 1) - 1;
        }
        SLDissecter::DissectNumber(*((void *)this + 23), v13, v11, v18, (uint64_t)v28);
        if (v29 != 3 || v30) {
          goto LABEL_39;
        }
        BOOL v9 = *(void *)(v13 + 40) != 3 || (v16 & 0x1000) != 0;
        if ((*(unsigned char *)(v13 + 16) & 1) == 0)
        {
          char v19 = SLLexerBuffer::operator[]((void *)this + 12, v12 - 1);
          if (v19)
          {
            if (*(unsigned char *)v19 == 13 && *(unsigned __int16 *)v19[7] == v6 && ((_BYTE)v19[2] & 1) == 0)
            {
              int v8 = SLLexerBuffer::operator[]((void *)this + 12, v12);
              v12 += 2;
              int v10 = (uint64_t (***)(void))v13;
              if (v8) {
                continue;
              }
            }
          }
        }
        std::string v20 = 0;
        goto LABEL_33;
      }
      if (*(unsigned char *)v8)
      {
        if (v14 == 2 || v14 == 14)
        {
          uint64_t v23 = (char *)v8[7];
          unint64_t v24 = (((char *)v8[8] - v23) >> 1) - 1;
          if (v24 >= 5)
          {
            uint64_t v25 = 0;
            while (1)
            {
              int v26 = v25 == 3 ? 6 : 2;
              if (v26 != (unsigned __int16)SLChar::sCharClass[*(_WORD *)&v23[2 * v25] & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)&v23[2 * v25] >> 6] << 6)]) {
                break;
              }
              if (v24 == ++v25)
              {
                int v10 = v8;
                goto LABEL_54;
              }
            }
          }
        }
        else
        {
          uint64_t v13 = 0;
LABEL_54:
          std::string v20 = (char **)v13;
          uint64_t v13 = (uint64_t)v10;
          if (v10)
          {
            do
            {
              while (1)
              {
LABEL_33:
                unint64_t v21 = (char **)SLLexerBuffer::operator[]((void *)this + 12, 0);
                *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
                std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)this + 120, 1);
                if (v21 == v20) {
                  operator new();
                }
                SLToken::AppendToken(a2, v21);
                if (v21) {
                  break;
                }
                if (!v13) {
                  goto LABEL_39;
                }
              }
              SLToken::~SLToken((SLToken *)v21);
              MEMORY[0x223CA4030]();
            }
            while (v21 != (char **)v13);
          }
        }
      }
    }
  }
LABEL_39:
  *((_DWORD *)a2 + 4) |= 0x80u;
  v27[0] = a2;
  std::deque<SLToken *>::push_front((uint64_t)this + 120, v27);
}

void sub_222A67FB8(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLPostLexerImpl::PronounceElapsed(SLPostLexerImpl *this, SLToken *a2, uint64_t a3, SLTokenList *a4)
{
  uint64_t v20 = a3;
  uint64_t v7 = (void *)((char *)this + 96);
  int v8 = (char *)this + 120;
  do
  {
    while (1)
    {
      SLDissecter::DissectUnit(*((void *)this + 23), (uint64_t)a2, (uint64_t)v15);
      SLPostLexerImpl::Transcribe(v9, a2, 2, v18, ((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1, &__p);
      (*(void (**)(SLPostLexerImpl *, std::string *, uint64_t *))(*(void *)this + 152))(this, &__p, &v20);
      SLDissecter::DissectNumber(*((void *)this + 23), (uint64_t)a2, v16, v17, (uint64_t)v13);
      (*(void (**)(void, SLToken *, SLTokenList *, unsigned char *, void, void))(**((void **)this + 22) + 48))(*((void *)this + 22), a2, a4, v13, 0, 0);
      v18 += *((void *)a2 + 4);
      (*(void (**)(SLPostLexerImpl *, std::string *, uint64_t, BOOL, unsigned char *))(*(void *)this + 168))(this, &__p, v20, v13[2] == 0, v12);
      *((unsigned char *)a4 + 24) = 2;
      (*(void (**)(void, unsigned char *, SLTokenList *, unint64_t, uint64_t))(**((void **)this + 22)
                                                                                        + 232))(*((void *)this + 22), v12, a4, v18, v19);
      SLToken::~SLToken(a2);
      MEMORY[0x223CA4030]();
      int v10 = (SLToken *)SLLexerBuffer::operator[](v7, 0);
      a2 = v10;
      if (!v10) {
        goto LABEL_4;
      }
      if ((*((unsigned char *)v10 + 18) & 0x80) != 0)
      {
        *((unsigned char *)v10 + 1) = (*(uint64_t (**)(void, void))(**((void **)this + 22) + 168))(*((void *)this + 22), 0);
        *(int64x2_t *)((char *)this + 152) = vaddq_s64(*(int64x2_t *)((char *)this + 152), (int64x2_t)xmmword_222ABEE70);
        std::deque<SLToken *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)v8, 1);
        ++v20;
        char v11 = 1;
      }
      else
      {
LABEL_4:
        char v11 = 0;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        break;
      }
      if ((v11 & 1) == 0) {
        return;
      }
    }
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  while ((v11 & 1) != 0);
}

void sub_222A68244(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLPostLexerImpl::FindElapsed()
{
  return 0;
}

uint64_t SLPostLexerImpl::ElapsedSequence(SLPostLexerImpl *this)
{
  return 0;
}

void std::vector<unsigned short>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 1;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 2 * a2;
    }
  }
  else
  {
    std::vector<unsigned short>::__append((char **)a1, a2 - v2);
  }
}

uint64_t SLPostLexerImpl::StartsCurrencyRange()
{
  return 0;
}

BOOL SLPostLexerImpl::LooksLikeName(SLPostLexerImpl *this, SLToken *a2, int a3)
{
  if (*(unsigned char *)a2) {
    return 0;
  }
  uint64_t v3 = (unsigned __int16 *)*((void *)a2 + 7);
  if ((unint64_t)(((uint64_t)(*((void *)a2 + 8) - (void)v3) >> 1) - 1) < 2) {
    return 0;
  }
  if (a3 && (SLChar::sCharClass[v3[1] & 0x3F | (SLChar::sUniMap[(unint64_t)v3[1] >> 6] << 6)] & 0x1F) == 1) {
    return 1;
  }
  if ((SLChar::sCharClass[*v3 & 0x3F | (SLChar::sUniMap[(unint64_t)*v3 >> 6] << 6)] & 0x9F) != 1) {
    return 0;
  }
  unsigned int v5 = (unsigned __int16)SLChar::sCharClass[v3[1] & 0x3F | (SLChar::sUniMap[(unint64_t)v3[1] >> 6] << 6)];
  if ((v5 & 0x1F) != 4)
  {
    if ((v5 & 0x1F) == 1) {
      return (v5 >> 7) & 1;
    }
    return 0;
  }
  return (SLChar::sCharClass[v3[2] & 0x3F | (SLChar::sUniMap[(unint64_t)v3[2] >> 6] << 6)] & 0x9F) == 1;
}

uint64_t SLPostLexerImpl::PeriodIsEndOfSentence()
{
  return 1;
}

char *std::vector<unsigned short>::insert(uint64_t a1, char *__src, _WORD *a3)
{
  BOOL v4 = __src;
  int v6 = *(char **)(a1 + 8);
  unint64_t v9 = *(void *)(a1 + 16);
  uint64_t v7 = a1 + 16;
  unint64_t v8 = v9;
  if ((unint64_t)v6 >= v9)
  {
    int v14 = *(unsigned char **)a1;
    uint64_t v15 = (uint64_t)&v6[-*(void *)a1];
    if (v15 <= -3) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v16 = (__src - v14) >> 1;
    uint64_t v17 = v15 >> 1;
    unint64_t v18 = v8 - (void)v14;
    if (v18 <= v17 + 1) {
      unint64_t v19 = v17 + 1;
    }
    else {
      unint64_t v19 = v18;
    }
    if (v18 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v20 = v19;
    }
    uint64_t v27 = v7;
    if (v20) {
      unint64_t v21 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v7, v20);
    }
    else {
      unint64_t v21 = 0;
    }
    std::string __p = v21;
    unint64_t v24 = &v21[2 * v16];
    uint64_t v25 = v24;
    int v26 = &v21[2 * v20];
    std::__split_buffer<unsigned short>::push_back(&__p, a3);
    BOOL v4 = std::vector<unsigned short>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v4);
    if (v25 != v24) {
      v25 += (v24 - v25 + 1) & 0xFFFFFFFFFFFFFFFELL;
    }
    if (__p) {
      operator delete(__p);
    }
  }
  else if (__src == v6)
  {
    *(_WORD *)__src = *a3;
    *(void *)(a1 + 8) = __src + 2;
  }
  else
  {
    int v10 = __src + 2;
    char v11 = v6 - 2;
    unint64_t v12 = v6;
    while (v11 < v6)
    {
      __int16 v13 = *(_WORD *)v11;
      v11 += 2;
      *(_WORD *)unint64_t v12 = v13;
      v12 += 2;
    }
    *(void *)(a1 + 8) = v12;
    if (v6 != v10) {
      memmove(&v6[-2 * ((v6 - v10) >> 1)], __src, v6 - v10);
    }
    *(_WORD *)BOOL v4 = *a3;
  }
  return v4;
}

void sub_222A68514(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLPostLexerImpl::HandleUnknownChar(SLPostLexerImpl *this, SLToken *a2, SLTokenList *a3)
{
  SLToken::SetType(a2, 0);
  uint64_t result = SLPostLexerImpl::HandleTokenInDictionary(this, a2);
  if (a2 && (result & 1) == 0)
  {
    SLToken::~SLToken(a2);
    JUMPOUT(0x223CA4030);
  }
  return result;
}

void SLPostLexerImpl::CreateIPAHomograph(SLPostLexerImpl *this, const unsigned __int8 *a2)
{
}

void SLPostLexer::Create(SLPostLexer *this, SLLexer *a2, SLDictLookup *a3, CFLocaleRef locale, const __CFLocale *a5)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFStringCompare(Value, @"en", 0)) {
    operator new();
  }
  SLCreatePostLexerEng(this, a2, a3);
}

void sub_222A686A0(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F3C40ACABD4A7);
  _Unwind_Resume(a1);
}

uint64_t SLPostLexerImpl::LexerBehavior(SLPostLexerImpl *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 13) + 8))();
}

uint64_t SLPostLexerImpl::SetLexerBehavior(SLPostLexerImpl *this, int a2)
{
  *((_DWORD *)this + 64) = a2;
  return (*(uint64_t (**)(void))(**((void **)this + 13) + 16))();
}

uint64_t SLPostLexerImpl::SetDelim(SLPostLexerImpl *this, const unsigned __int16 *a2)
{
  return (*(uint64_t (**)(void, const unsigned __int16 *))(**((void **)this + 13) + 24))(*((void *)this + 13), a2);
}

uint64_t SLPostLexerImpl::Delim(SLPostLexerImpl *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 13) + 32))();
}

uint64_t SLPostLexerImpl::SetErrorHandler(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 104) + 40))();
}

uint64_t SLPostLexerImpl::SetTuples(uint64_t this, SLTuples *a2)
{
  *(void *)(this + 192) = a2;
  return this;
}

void std::deque<SLToken *>::push_front(uint64_t a1, void *a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    std::deque<SLToken *>::__add_front_capacity((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }
  uint64_t v5 = *(void *)(a1 + 8);
  int v6 = (void *)(v5 + 8 * (v4 >> 9));
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = *v6 + 8 * (v4 & 0x1FF);
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4096;
  }
  *(void *)(v7 - 8) = *a2;
  uint64_t v8 = *(void *)(a1 + 40) + 1;
  *(void *)(a1 + 32) = v4 - 1;
  *(void *)(a1 + 40) = v8;
}

void std::deque<SLToken *>::__add_front_capacity(void **a1)
{
  unint64_t v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = v3 - v2;
  if (v3 == v2) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = ((v3 - v2) << 6) - 1;
  }
  int v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x200)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    unint64_t v9 = *a1;
    uint64_t v10 = v8 - (unsigned char *)*a1;
    if (v4 >= v10)
    {
      if (v8 == v9) {
        unint64_t v11 = 1;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      int v46 = a1 + 3;
      std::string __p = std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(v7, v11);
      uint64_t v43 = (char *)__p;
      std::string v44 = (char *)__p;
      unint64_t v45 = (char *)__p + 8 * v12;
      std::string::size_type v41 = operator new(0x1000uLL);
      std::__split_buffer<SLToken **>::push_back(&__p, &v41);
      __int16 v13 = (char *)a1[1];
      int v14 = v44;
      if (v13 == a1[2])
      {
        uint64_t v33 = (char *)a1[1];
      }
      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (unsigned char *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1;
              }
              else {
                unint64_t v23 = (v14 - (unsigned char *)__p) >> 2;
              }
              unint64_t v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)v46, v23);
              int v26 = v43;
              int v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                int v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8)];
                uint64_t v28 = 8 * (v27 >> 3);
                uint64_t v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)uint64_t v29 = v30;
                  v29 += 8;
                  v28 -= 8;
                }
                while (v28);
              }
              unint64_t v31 = __p;
              std::string __p = v24;
              uint64_t v43 = &v24[8 * (v23 >> 2)];
              std::string v44 = v14;
              unint64_t v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                int v14 = v44;
              }
            }
            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                int v14 = v43;
              }
              unint64_t v22 = &v14[-8 * (v19 >> 1)];
              int v14 = &v20[v21];
              uint64_t v43 = v22;
              std::string v44 = &v20[v21];
            }
          }
          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)int v14 = v32;
          int v14 = v44 + 8;
          v44 += 8;
        }
        while (v13 != a1[2]);
        uint64_t v33 = (char *)a1[1];
      }
      uint64_t v36 = *a1;
      uint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      std::string __p = v36;
      uint64_t v43 = v33;
      uint64_t v38 = (char *)a1[3];
      uint64_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      std::string v44 = v13;
      unint64_t v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 256;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 512;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        std::string v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8];
      }
      if (v36) {
        operator delete(v36);
      }
    }
    else
    {
      if (v2 == v9)
      {
        std::string __p = operator new(0x1000uLL);
        std::__split_buffer<SLToken **>::push_back(a1, &__p);
        int v34 = a1[2];
        std::string __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }
      else
      {
        std::string __p = operator new(0x1000uLL);
      }
      std::__split_buffer<SLToken **>::push_front((uint64_t)a1, &__p);
      if ((unsigned char *)a1[2] - (unsigned char *)a1[1] == 8) {
        uint64_t v35 = 256;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 512;
      }
      a1[4] = (void *)v35;
    }
  }
  else
  {
    a1[4] = v6 + 512;
    std::string __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    std::__split_buffer<SLToken **>::push_front((uint64_t)a1, &__p);
  }
}

void sub_222A68AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  operator delete(v12);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *std::vector<unsigned short>::__init_with_size[abi:ne180100]<unsigned short *,unsigned short *>(void *result, const void *a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    uint64_t result = std::vector<unsigned short>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_222A68B98(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<SLHomograph *>::__init_with_size[abi:ne180100]<SLHomograph **,SLHomograph **>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    int v6 = result;
    uint64_t result = std::vector<SLHomograph *>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_222A68C14(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<SLHomograph *>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

CFStringRef ___ZL17isInMainlandChinav_block_invoke()
{
  CFStringRef result = (const __CFString *)CPGetDeviceRegionCode();
  if (result)
  {
    CFStringRef result = (const __CFString *)CFStringCompare(result, @"CH", 0);
    isInMainlandChina(void)::isInMainlandChina = result == 0;
  }
  return result;
}

void *std::deque<SLToken *>::insert(void **a1, char *a2, uint64_t a3, char *a4)
{
  unint64_t v6 = (unint64_t)a1[4];
  uint64_t v7 = a1[1];
  size_t v8 = a1[2];
  unint64_t v9 = &v7[8 * (v6 >> 9)];
  if (v8 == v7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = *(void *)v9 + 8 * ((unint64_t)a1[4] & 0x1FF);
  }
  if (a3 == v10) {
    unint64_t v11 = 0;
  }
  else {
    unint64_t v11 = ((a3 - *(void *)a2) >> 3) + ((a2 - v9) << 6) - ((v10 - *(void *)v9) >> 3);
  }
  uint64_t v12 = (char *)a1[5];
  unint64_t v13 = (unint64_t)&v12[-v11];
  if (v11 >= (unint64_t)&v12[-v11])
  {
    if (v8 == v7) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = ((v8 - v7) << 6) - 1;
    }
    if ((char *)v21 == &v12[v6])
    {
      std::deque<SLToken *>::__add_back_capacity(a1);
      uint64_t v12 = (char *)a1[5];
      unint64_t v13 = (unint64_t)&v12[-v11];
    }
    if (v12 == (char *)v11)
    {
      *(void *)(*(void *)((char *)a1[1] + ((((unint64_t)a1[4] + v11) >> 6) & 0x3FFFFFFFFFFFFF8))
                + 8 * (((unint64_t)a1[4] + v11) & 0x1FF)) = *(void *)a4;
      a1[5] = (void *)(v11 + 1);
    }
    else
    {
      uint64_t v58 = a4;
      unint64_t v22 = (unint64_t)&v12[(void)a1[4]];
      unint64_t v23 = (char *)a1[1];
      unint64_t v24 = &v23[8 * (v22 >> 9)];
      uint64_t v25 = *(void *)v24;
      int v26 = (char *)(*(void *)v24 + 8 * (v22 & 0x1FF));
      if (a1[2] == v23) {
        int v26 = 0;
      }
      char v56 = v24;
      char v57 = v26;
      uint64_t v27 = (uint64_t)&v26[-v25];
      uint64_t v28 = (uint64_t)&v26[-v25] >> 3;
      if (v27 < 9)
      {
        unint64_t v44 = 512 - v28;
        uint64_t v30 = &v24[-8 * (v44 >> 9)];
        unint64_t v31 = (char *)(*(void *)v30 + 8 * (~(_WORD)v44 & 0x1FF));
      }
      else
      {
        unint64_t v29 = v28 - 1;
        uint64_t v30 = &v24[8 * (v29 >> 9)];
        unint64_t v31 = (char *)(*(void *)v30 + 8 * (v29 & 0x1FF));
      }
      if (v31 == a4)
      {
        uint64_t v58 = v26;
        a4 = v26;
      }
      *(void *)int v26 = *(void *)v31;
      a1[5] = v12 + 1;
      if (v13 >= 2)
      {
        unint64_t v45 = (char *)std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator-[abi:ne180100]((uint64_t)&v56, v13);
        unint64_t v24 = std::deque<SLToken *>::__move_backward_and_check((uint64_t)a1, v45, v46, v30, v31, v56, v57, (unint64_t *)&v58);
        int v26 = v47;
        char v56 = v24;
        char v57 = v47;
        a4 = v58;
      }
      uint64_t v48 = *(void *)a4;
      if (v26 == *(char **)v24)
      {
        char v56 = v24 - 8;
        int v26 = (char *)(*((void *)v24 - 1) + 4096);
      }
      *((void *)v26 - 1) = v48;
    }
  }
  else
  {
    if (v6)
    {
      if (v11)
      {
LABEL_10:
        uint64_t v58 = a4;
        unint64_t v14 = (unint64_t)a1[4];
        int64_t v15 = (char *)a1[1];
        uint64_t v16 = (uint64_t *)&v15[8 * (v14 >> 9)];
        uint64_t v17 = *v16;
        if (a1[2] == v15) {
          uint64_t v18 = 0;
        }
        else {
          uint64_t v18 = (char *)(*v16 + 8 * ((unint64_t)a1[4] & 0x1FF));
        }
        char v56 = &v15[8 * (v14 >> 9)];
        char v57 = v18;
        uint64_t v19 = (uint64_t)&v18[-v17] >> 3;
        if ((uint64_t)&v18[-v17] < 9) {
          uint64_t v20 = (char *)(v16[-((unint64_t)(512 - v19) >> 9)] + 8 * (~(512 - (_WORD)v19) & 0x1FF));
        }
        else {
          uint64_t v20 = (char *)(*(uint64_t *)((char *)v16 + (((unint64_t)(v19 - 1) >> 6) & 0x3FFFFFFFFFFFFF8))
        }
                       + 8 * ((v19 - 1) & 0x1FF));
        if (v18 == a4)
        {
          uint64_t v58 = v20;
          a4 = v20;
        }
        *(void *)uint64_t v20 = *(void *)v18;
        uint64_t v37 = (uint64_t)a1[5] + 1;
        a1[4] = (void *)(v14 - 1);
        a1[5] = (void *)v37;
        if (v11 >= 2)
        {
          uint64_t v38 = (uint64_t)&v18[-*v16];
          uint64_t v39 = v38 >> 3;
          if (v38 < -7)
          {
            unint64_t v49 = 510 - v39;
            std::string::size_type v41 = (char *)&v16[-(v49 >> 9)];
            uint64_t v42 = *(void *)v41;
            uint64_t v43 = ~v49 & 0x1FFLL;
          }
          else
          {
            unint64_t v40 = v39 + 1;
            std::string::size_type v41 = (char *)&v16[v40 >> 9];
            uint64_t v42 = *(void *)v41;
            uint64_t v43 = v40 & 0x1FF;
          }
          unint64_t v50 = (char *)(v42 + 8 * v43);
          int v51 = (char *)std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator+[abi:ne180100]((uint64_t)&v56, v11);
          char v56 = (char *)std::deque<SLToken *>::__move_and_check((int)a1, v41, v50, v51, v52, (void **)v56, v57, (unint64_t *)&v58);
          char v57 = v18;
          a4 = v58;
        }
        *(void *)uint64_t v18 = *(void *)a4;
        goto LABEL_50;
      }
    }
    else
    {
      std::deque<SLToken *>::__add_front_capacity(a1);
      if (v11) {
        goto LABEL_10;
      }
    }
    unint64_t v32 = (unint64_t)a1[4];
    uint64_t v33 = (char *)a1[1];
    int v34 = &v33[8 * (v32 >> 9)];
    if (a1[2] == v33) {
      uint64_t v35 = 0;
    }
    else {
      uint64_t v35 = *(void *)v34 + 8 * ((unint64_t)a1[4] & 0x1FF);
    }
    if (v35 == *(void *)v34) {
      uint64_t v35 = *((void *)v34 - 1) + 4096;
    }
    *(void *)(v35 - 8) = *(void *)a4;
    uint64_t v36 = (uint64_t)a1[5] + 1;
    a1[4] = (void *)(v32 - 1);
    a1[5] = (void *)v36;
  }
LABEL_50:
  uint64_t v53 = a1[1];
  if (a1[2] == v53) {
    char v54 = 0;
  }
  else {
    char v54 = (char *)(v53[(unint64_t)a1[4] >> 9] + 8 * ((unint64_t)a1[4] & 0x1FF));
  }
  char v56 = (char *)&v53[(unint64_t)a1[4] >> 9];
  char v57 = v54;
  return std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>::operator+[abi:ne180100]((uint64_t)&v56, v11);
}

void **std::deque<SLToken *>::__move_and_check(int a1, char *a2, char *__src, char *a4, char *a5, void **a6, char *__dst, unint64_t *a8)
{
  if (a5 != __src)
  {
    v27[9] = v8;
    v27[10] = v9;
    uint64_t v10 = __src;
    unint64_t v11 = a2;
    uint64_t v12 = ((uint64_t)&a5[-*(void *)a4] >> 3) + ((a4 - a2) << 6) - ((uint64_t)&__src[-*(void *)a2] >> 3);
    if (v12 >= 1)
    {
      do
      {
        uint64_t v14 = *(void *)v11;
        uint64_t v15 = *(void *)v11 + 4096;
        uint64_t v16 = (v15 - (uint64_t)v10) >> 3;
        if (v16 >= v12) {
          uint64_t v17 = v12;
        }
        else {
          uint64_t v17 = (v15 - (uint64_t)v10) >> 3;
        }
        if (v16 <= v12) {
          uint64_t v18 = (char *)(*(void *)v11 + 4096);
        }
        else {
          uint64_t v18 = &v10[8 * v12];
        }
        unint64_t v19 = *a8;
        if ((unint64_t)v10 <= *a8 && v19 < (unint64_t)v18)
        {
          if (v10 != __dst)
          {
            uint64_t v21 = (((char *)a6 - v11) << 6) - ((uint64_t)&v10[-v14] >> 3) + ((__dst - (unsigned char *)*a6) >> 3);
            if (v21)
            {
              uint64_t v22 = v21 + ((uint64_t)(v19 - v14) >> 3);
              if (v22 < 1) {
                unint64_t v19 = *(void *)&v11[-8 * ((unint64_t)(511 - v22) >> 9)] + 8 * (~(511 - (_WORD)v22) & 0x1FF);
              }
              else {
                unint64_t v19 = *(void *)&v11[((unint64_t)v22 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v22 & 0x1FF);
              }
            }
          }
          *a8 = v19;
        }
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,SLToken **,SLToken **,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>(v10, __dst, v18, a6, v27);
        if (v17)
        {
          uint64_t v23 = v17 + ((uint64_t)&v10[-*(void *)v11] >> 3);
          if (v23 < 1)
          {
            unint64_t v24 = 511 - v23;
            v11 -= 8 * (v24 >> 9);
            uint64_t v10 = (char *)(*(void *)v11 + 8 * (~(_WORD)v24 & 0x1FF));
          }
          else
          {
            v11 += 8 * ((unint64_t)v23 >> 9);
            uint64_t v10 = (char *)(*(void *)v11 + 8 * (v23 & 0x1FF));
          }
        }
        a6 = (void **)v27[1];
        std::string __dst = v27[2];
        BOOL v25 = v12 <= v17;
        v12 -= v17;
      }
      while (!v25);
    }
  }
  return a6;
}

char *std::deque<SLToken *>::__move_backward_and_check(uint64_t a1, char *a2, char *a3, char *a4, char *a5, char *a6, char *a7, unint64_t *a8)
{
  if (a5 != a3)
  {
    v27[13] = v8;
    v27[14] = v9;
    uint64_t v10 = a4;
    uint64_t v11 = ((uint64_t)&a5[-*(void *)a4] >> 3) + ((a4 - a2) << 6) - ((uint64_t)&a3[-*(void *)a2] >> 3);
    if (v11 >= 1)
    {
      while (1)
      {
        unint64_t v13 = *(char **)v10;
        if (a5 == *(char **)v10)
        {
          uint64_t v14 = (char *)*((void *)v10 - 1);
          v10 -= 8;
          unint64_t v13 = v14;
          a5 = v14 + 4096;
        }
        uint64_t v15 = (uint64_t)(a5 - 8);
        uint64_t v16 = (a5 - v13) >> 3;
        if (v16 >= v11) {
          uint64_t v17 = v11;
        }
        else {
          uint64_t v17 = (a5 - v13) >> 3;
        }
        if (v16 <= v11) {
          uint64_t v18 = v13;
        }
        else {
          uint64_t v18 = &a5[-8 * v11];
        }
        unint64_t v19 = *a8;
        BOOL v20 = *a8 >= (unint64_t)a5 || (unint64_t)v18 > v19;
        if (v20) {
          goto LABEL_23;
        }
        if ((char *)v15 == a7) {
          break;
        }
        uint64_t v21 = ~((v15 - (uint64_t)v13) >> 3) + ((a6 - v10) << 6) + ((uint64_t)&a7[-*(void *)a6] >> 3);
        if (v21) {
          goto LABEL_19;
        }
LABEL_22:
        *a8 = v19;
LABEL_23:
        std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<SLToken **,std::__deque_iterator<SLToken *,SLToken **,SLToken *&,SLToken ***,long,512l>,0>(v18, a5, a6, a7, v27);
        if (v17 != 1)
        {
          unint64_t v23 = ((v15 - *(void *)v10) >> 3) - v17;
          if (v23 > 0x7FFFFFFFFFFFFFFELL)
          {
            unint64_t v25 = 510 - v23;
            v10 -= 8 * (v25 >> 9);
            uint64_t v15 = *(void *)v10 + 8 * (~(_WORD)v25 & 0x1FF);
          }
          else
          {
            unint64_t v24 = v23 + 1;
            v10 += 8 * (v24 >> 9);
            uint64_t v15 = *(void *)v10 + 8 * (v24 & 0x1FF);
          }
        }
        a6 = (char *)v27[1];
        a7 = (char *)v27[2];
        a5 = (char *)v15;
        BOOL v20 = v11 <= v17;
        v11 -= v17;
        if (v20) {
          return a6;
        }
      }
      uint64_t v21 = -1;
LABEL_19:
      uint64_t v22 = v21 + ((uint64_t)(v19 - (void)v13) >> 3);
      if (v22 < 1) {
        unint64_t v19 = *(void *)&v10[-8 * ((unint64_t)(511 - v22) >> 9)] + 8 * (~(511 - (_WORD)v22) & 0x1FF);
      }
      else {
        unint64_t v19 = *(void *)&v10[((unint64_t)v22 >> 6) & 0x3FFFFFFFFFFFFF8] + 8 * (v22 & 0x1FF);
      }
      goto LABEL_22;
    }
  }
  return a6;
}

uint64_t std::string::basic_string[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    unint64_t v6 = operator new(v4 + 1);
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

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26463DB80, MEMORY[0x263F8C068]);
}

void sub_222A694D8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  CFStringRef result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

char *std::vector<unsigned short>::__insert_with_size[abi:ne180100]<unsigned short *,unsigned short *>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 1)
  {
    unint64_t v13 = *(void **)a1;
    if (a5 + ((uint64_t)(v12 - *(void *)a1) >> 1) < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = (__dst - (uint64_t)v13) >> 1;
    unint64_t v15 = v10 - (void)v13;
    if (v15 <= a5 + ((uint64_t)(v12 - *(void *)a1) >> 1)) {
      unint64_t v16 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 1);
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
    uint64_t v37 = v9;
    if (v17) {
      uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v9, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v28 = &v18[2 * v14];
    std::string __p = v18;
    int v34 = v28;
    uint64_t v36 = &v18[2 * v17];
    uint64_t v29 = 2 * a5;
    uint64_t v30 = &v28[2 * a5];
    do
    {
      __int16 v31 = *(_WORD *)v7;
      v7 += 2;
      *(_WORD *)uint64_t v28 = v31;
      v28 += 2;
      v29 -= 2;
    }
    while (v29);
    uint64_t v35 = v30;
    uint64_t v5 = std::vector<unsigned short>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 1) & 0xFFFFFFFFFFFFFFFELL;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 1;
  if (v20 >= a5)
  {
    uint64_t v21 = &__src[2 * a5];
    unint64_t v23 = *(char **)(v9 - 8);
LABEL_18:
    unint64_t v24 = &v5[2 * a5];
    unint64_t v25 = &v23[-2 * a5];
    int v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      int v26 = v23;
      do
      {
        __int16 v27 = *(_WORD *)v25;
        v25 += 2;
        *(_WORD *)int v26 = v27;
        v26 += 2;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-2 * ((v23 - v24) >> 1)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  uint64_t v21 = &__src[2 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[2 * v20], a4 - v21);
  }
  unint64_t v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_18;
  }
  return v5;
}

void sub_222A696F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned short>::__insert_with_size[abi:ne180100]<unsigned short const*,unsigned short const*>(uint64_t a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  uint64_t v5 = (char *)__dst;
  if (a5 < 1) {
    return v5;
  }
  uint64_t v7 = __src;
  uint64_t v11 = *(void *)(a1 + 16);
  uint64_t v9 = a1 + 16;
  uint64_t v10 = v11;
  unint64_t v12 = *(void *)(v9 - 8);
  if (a5 > (uint64_t)(v11 - v12) >> 1)
  {
    unint64_t v13 = *(void **)a1;
    if (a5 + ((uint64_t)(v12 - *(void *)a1) >> 1) < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = (__dst - (uint64_t)v13) >> 1;
    unint64_t v15 = v10 - (void)v13;
    if (v15 <= a5 + ((uint64_t)(v12 - *(void *)a1) >> 1)) {
      unint64_t v16 = a5 + ((uint64_t)(v12 - *(void *)a1) >> 1);
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
    uint64_t v37 = v9;
    if (v17) {
      uint64_t v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v9, v17);
    }
    else {
      uint64_t v18 = 0;
    }
    uint64_t v28 = &v18[2 * v14];
    std::string __p = v18;
    int v34 = v28;
    uint64_t v36 = &v18[2 * v17];
    uint64_t v29 = 2 * a5;
    uint64_t v30 = &v28[2 * a5];
    do
    {
      __int16 v31 = *(_WORD *)v7;
      v7 += 2;
      *(_WORD *)uint64_t v28 = v31;
      v28 += 2;
      v29 -= 2;
    }
    while (v29);
    uint64_t v35 = v30;
    uint64_t v5 = std::vector<unsigned short>::__swap_out_circular_buffer((void **)a1, (uint64_t)&__p, v5);
    if (v35 != v34) {
      v35 += (v34 - v35 + 1) & 0xFFFFFFFFFFFFFFFELL;
    }
    if (__p) {
      operator delete(__p);
    }
    return v5;
  }
  uint64_t v19 = v12 - __dst;
  uint64_t v20 = (uint64_t)(v12 - __dst) >> 1;
  if (v20 >= a5)
  {
    uint64_t v21 = &__src[2 * a5];
    unint64_t v23 = *(char **)(v9 - 8);
LABEL_18:
    unint64_t v24 = &v5[2 * a5];
    unint64_t v25 = &v23[-2 * a5];
    int v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      int v26 = v23;
      do
      {
        __int16 v27 = *(_WORD *)v25;
        v25 += 2;
        *(_WORD *)int v26 = v27;
        v26 += 2;
      }
      while ((unint64_t)v25 < v12);
    }
    *(void *)(a1 + 8) = v26;
    if (v23 != v24) {
      memmove(&v23[-2 * ((v23 - v24) >> 1)], v5, v23 - v24);
    }
    if (v21 != v7) {
      memmove(v5, v7, v21 - v7);
    }
    return v5;
  }
  uint64_t v21 = &__src[2 * v20];
  int64_t v22 = a4 - v21;
  if (a4 != v21) {
    memmove(*(void **)(v9 - 8), &__src[2 * v20], a4 - v21);
  }
  unint64_t v23 = (char *)(v12 + v22);
  *(void *)(a1 + 8) = v12 + v22;
  if (v19 >= 1) {
    goto LABEL_18;
  }
  return v5;
}

void sub_222A698F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<unsigned short>::__append(char **a1, unint64_t a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 1)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 2 * a2);
      v7 += 2 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    uint64_t v10 = a2 + (v9 >> 1);
    if (v10 < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 1;
    unint64_t v12 = v5 - v8;
    if (v12 > v10) {
      uint64_t v10 = v12;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v10;
    }
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      uint64_t v14 = 0;
    }
    unint64_t v15 = &v14[2 * v11];
    unint64_t v16 = &v14[2 * v13];
    bzero(v15, 2 * a2);
    uint64_t v17 = &v15[2 * a2];
    while (v7 != v8)
    {
      __int16 v18 = *((_WORD *)v7 - 1);
      v7 -= 2;
      *((_WORD *)v15 - 1) = v18;
      v15 -= 2;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

void std::__split_buffer<unsigned short>::push_back(void *a1, _WORD *a2)
{
  uint64_t v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    uint64_t v5 = (char *)a1[1];
    uint64_t v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1) {
        unint64_t v16 = 1;
      }
      else {
        unint64_t v16 = (unint64_t)&v4[-*a1];
      }
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>(a1[4], v16);
      uint64_t v19 = &v17[2 * (v16 >> 2)];
      uint64_t v20 = (__int16 *)a1[1];
      uint64_t v4 = v19;
      uint64_t v21 = a1[2] - (void)v20;
      if (v21)
      {
        uint64_t v4 = &v19[v21 & 0xFFFFFFFFFFFFFFFELL];
        uint64_t v22 = 2 * (v21 >> 1);
        unint64_t v23 = &v17[2 * (v16 >> 2)];
        do
        {
          __int16 v24 = *v20++;
          *(_WORD *)unint64_t v23 = v24;
          v23 += 2;
          v22 -= 2;
        }
        while (v22);
      }
      unint64_t v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[2 * v18];
      if (v25)
      {
        operator delete(v25);
        uint64_t v4 = (char *)a1[2];
      }
    }
    else
    {
      uint64_t v7 = v6 >> 1;
      BOOL v8 = v6 >> 1 < -1;
      uint64_t v9 = (v6 >> 1) + 2;
      if (v8) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = v7 + 1;
      }
      uint64_t v11 = -(v10 >> 1);
      unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFELL;
      uint64_t v13 = &v5[-v12];
      int64_t v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-v12], v5, v4 - v5);
        uint64_t v4 = (char *)a1[1];
      }
      unint64_t v15 = &v4[2 * v11];
      uint64_t v4 = &v13[v14];
      a1[1] = v15;
    }
  }
  *(_WORD *)uint64_t v4 = *a2;
  a1[2] = v4 + 2;
}

void *std::vector<unsigned char>::vector(void *a1, size_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<unsigned char>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    uint64_t v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_222A69BA8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

unint64_t SLPronouncerEng::URLBoundary(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = 0x100E0E0B0FuLL >> (8 * a2);
  if (a2 >= 5) {
    LOBYTE(v2) = 15;
  }
  return v2 & 0x1F;
}

void SLPronouncerEng::MakePlural(SLPronouncerEng *this, SLToken *a2)
{
  uint64_t v3 = (__int16 *)*((void *)a2 + 7);
  uint64_t v5 = (__int16 *)*((void *)a2 + 8);
  uint64_t v4 = (void **)((char *)a2 + 56);
  uint64_t v6 = v5 - 1;
  *((void *)a2 + 8) = v5 - 1;
  uint64_t v7 = (char *)(v5 - 1) - (char *)v3;
  uint64_t v8 = v7 >> 1;
  if ((unint64_t)v7 > 3)
  {
    switch(*(v5 - 2))
    {
      case 'S':
      case 'X':
      case 'Z':
        goto LABEL_18;
      case 'T':
      case 'U':
      case 'V':
      case 'W':
        goto LABEL_38;
      case 'Y':
        *(v5 - 2) = 73;
        goto LABEL_18;
      default:
        if (*(v5 - 2) != 72 || ((unsigned __int16)v3[v8 - 2] | 0x10) != 0x53) {
          goto LABEL_38;
        }
LABEL_18:
        unint64_t v20 = *((void *)a2 + 9);
        if ((unint64_t)v6 < v20)
        {
          __int16 v10 = 69;
          goto LABEL_20;
        }
        if (v7 <= -3) {
          goto LABEL_164;
        }
        unint64_t v21 = v20 - (void)v3;
        if (v21 <= v8 + 1) {
          unint64_t v22 = v8 + 1;
        }
        else {
          unint64_t v22 = v21;
        }
        if (v21 >= 0x7FFFFFFFFFFFFFFELL) {
          uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          uint64_t v23 = v22;
        }
        if (v23)
        {
          __int16 v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v23);
          uint64_t v3 = (__int16 *)*((void *)a2 + 7);
          uint64_t v6 = (__int16 *)*((void *)a2 + 8);
        }
        else
        {
          __int16 v24 = 0;
        }
        unint64_t v25 = &v24[2 * v8];
        uint64_t v18 = &v24[2 * v23];
        *(_WORD *)unint64_t v25 = 69;
        uint64_t v5 = (__int16 *)(v25 + 2);
        while (v6 != v3)
        {
          __int16 v26 = *--v6;
          *((_WORD *)v25 - 1) = v26;
          v25 -= 2;
        }
        *((void *)a2 + 7) = v25;
        break;
    }
    goto LABEL_35;
  }
  unint64_t v9 = *((void *)a2 + 9);
  if ((unint64_t)v6 >= v9)
  {
    unint64_t v11 = v9 - (void)v3;
    if (v11 <= v8 + 1) {
      unint64_t v12 = v8 + 1;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v11 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v13 = v12;
    }
    int64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v13);
    uint64_t v3 = (__int16 *)*((void *)a2 + 7);
    unint64_t v15 = (__int16 *)*((void *)a2 + 8);
    unint64_t v16 = &v14[2 * v8];
    uint64_t v18 = &v14[2 * v17];
    *(_WORD *)unint64_t v16 = 39;
    uint64_t v5 = (__int16 *)(v16 + 2);
    while (v15 != v3)
    {
      __int16 v19 = *--v15;
      *((_WORD *)v16 - 1) = v19;
      v16 -= 2;
    }
    *((void *)a2 + 7) = v16;
LABEL_35:
    *((void *)a2 + 8) = v5;
    *((void *)a2 + 9) = v18;
    if (v3) {
      operator delete(v3);
    }
    goto LABEL_37;
  }
  __int16 v10 = 39;
LABEL_20:
  *uint64_t v6 = v10;
LABEL_37:
  *((void *)a2 + 8) = v5;
  uint64_t v6 = v5;
LABEL_38:
  __int16 v27 = (char *)*((void *)a2 + 9);
  if (v6 >= (__int16 *)v27)
  {
    uint64_t v29 = (__int16 *)*v4;
    uint64_t v30 = (char *)v6 - (unsigned char *)*v4;
    if (v30 <= -3) {
      goto LABEL_164;
    }
    uint64_t v31 = v30 >> 1;
    unint64_t v32 = v27 - (char *)v29;
    if (v32 <= (v30 >> 1) + 1) {
      unint64_t v33 = v31 + 1;
    }
    else {
      unint64_t v33 = v32;
    }
    if (v32 >= 0x7FFFFFFFFFFFFFFELL) {
      uint64_t v34 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      uint64_t v34 = v33;
    }
    if (v34)
    {
      uint64_t v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v34);
      uint64_t v29 = (__int16 *)*((void *)a2 + 7);
      uint64_t v6 = (__int16 *)*((void *)a2 + 8);
    }
    else
    {
      uint64_t v35 = 0;
    }
    uint64_t v36 = &v35[2 * v31];
    __int16 v27 = &v35[2 * v34];
    *(_WORD *)uint64_t v36 = 83;
    uint64_t v28 = v36 + 2;
    while (v6 != v29)
    {
      __int16 v37 = *--v6;
      *((_WORD *)v36 - 1) = v37;
      v36 -= 2;
    }
    *((void *)a2 + 7) = v36;
    *((void *)a2 + 8) = v28;
    *((void *)a2 + 9) = v27;
    if (v29)
    {
      operator delete(v29);
      __int16 v27 = (char *)*((void *)a2 + 9);
    }
  }
  else
  {
    *uint64_t v6 = 83;
    uint64_t v28 = (char *)(v6 + 1);
  }
  *((void *)a2 + 8) = v28;
  if (v28 < v27)
  {
    *(_WORD *)uint64_t v28 = 0;
    uint64_t v38 = v28 + 2;
    goto LABEL_72;
  }
  uint64_t v39 = (char *)*v4;
  uint64_t v40 = v28 - (unsigned char *)*v4;
  if (v40 <= -3) {
LABEL_164:
  }
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  uint64_t v41 = v40 >> 1;
  unint64_t v42 = v27 - v39;
  if (v42 <= (v40 >> 1) + 1) {
    unint64_t v43 = v41 + 1;
  }
  else {
    unint64_t v43 = v42;
  }
  if (v42 >= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v44 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    uint64_t v44 = v43;
  }
  if (v44)
  {
    unint64_t v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v44);
    uint64_t v39 = (char *)*((void *)a2 + 7);
    uint64_t v28 = (char *)*((void *)a2 + 8);
  }
  else
  {
    unint64_t v45 = 0;
  }
  int v46 = &v45[2 * v41];
  char v47 = &v45[2 * v44];
  *(_WORD *)int v46 = 0;
  uint64_t v38 = v46 + 2;
  while (v28 != v39)
  {
    __int16 v48 = *((_WORD *)v28 - 1);
    v28 -= 2;
    *((_WORD *)v46 - 1) = v48;
    v46 -= 2;
  }
  *((void *)a2 + 7) = v46;
  *((void *)a2 + 8) = v38;
  *((void *)a2 + 9) = v47;
  if (v39) {
    operator delete(v39);
  }
LABEL_72:
  *((void *)a2 + 8) = v38;
  uint64_t v49 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v49)
  {
    unint64_t v50 = 0;
    while (1)
    {
      uint64_t v51 = *(void *)(v49 + 8 * v50);
      uint64_t v52 = (void *)(v51 + 32);
      uint64_t v53 = *(char **)(v51 + 40);
      int v54 = SLPhonEng::sFlags[*(v53 - 1)];
      if ((v54 & 0x20000) != 0 || (v54 & 0x8002000) == 0x8002000) {
        break;
      }
      unint64_t v55 = *(void *)(v51 + 48);
      if ((SLPhonEng::sFlags[*(v53 - 1)] & 6) != 2)
      {
        if ((unint64_t)v53 >= v55)
        {
          char v59 = (char *)*v52;
          int v60 = &v53[-*v52];
          unint64_t v61 = (unint64_t)(v60 + 1);
          if ((uint64_t)(v60 + 1) < 0) {
            goto LABEL_163;
          }
          unint64_t v62 = v55 - (void)v59;
          if (2 * v62 > v61) {
            unint64_t v61 = 2 * v62;
          }
          if (v62 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v63 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v63 = v61;
          }
          if (v63) {
            uint64_t v64 = operator new(v63);
          }
          else {
            uint64_t v64 = 0;
          }
          long long v96 = &v60[(void)v64];
          uint64_t v97 = (char *)v64 + v63;
          v60[(void)v64] = 43;
          uint64_t v90 = (uint64_t)&v60[(void)v64 + 1];
          if (v53 == v59) {
            goto LABEL_159;
          }
          v100 = &v53[~(unint64_t)v59];
          do
          {
            char v101 = *--v53;
            (v100--)[(void)v64] = v101;
          }
          while (v53 != v59);
LABEL_157:
          uint64_t v53 = *(char **)(v51 + 32);
          *(void *)(v51 + 32) = v64;
          *(void *)(v51 + 40) = v90;
          *(void *)(v51 + 48) = v97;
          if (!v53) {
            goto LABEL_161;
          }
          goto LABEL_160;
        }
        goto LABEL_133;
      }
      if ((unint64_t)v53 >= v55)
      {
        uint64_t v71 = (char *)*v52;
        uint64_t v72 = &v53[-*v52];
        unint64_t v73 = (unint64_t)(v72 + 1);
        if ((uint64_t)(v72 + 1) < 0) {
          goto LABEL_163;
        }
        unint64_t v74 = v55 - (void)v71;
        if (2 * v74 > v73) {
          unint64_t v73 = 2 * v74;
        }
        if (v74 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v75 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v75 = v73;
        }
        if (v75) {
          uint64_t v64 = operator new(v75);
        }
        else {
          uint64_t v64 = 0;
        }
        long long v96 = &v72[(void)v64];
        uint64_t v97 = (char *)v64 + v75;
        v72[(void)v64] = 42;
        uint64_t v90 = (uint64_t)&v72[(void)v64 + 1];
        if (v53 == v71) {
          goto LABEL_159;
        }
        std::string v102 = &v53[~(unint64_t)v71];
        do
        {
          char v103 = *--v53;
          (v102--)[(void)v64] = v103;
        }
        while (v53 != v71);
        goto LABEL_157;
      }
      char v56 = 42;
LABEL_134:
      *uint64_t v53 = v56;
      uint64_t v90 = (uint64_t)(v53 + 1);
LABEL_161:
      *(void *)(v51 + 40) = v90;
      *(_DWORD *)uint64_t v51 = 1;
      ++v50;
      uint64_t v49 = *((void *)a2 + 10);
      if (v50 >= (*((void *)a2 + 11) - v49) >> 3) {
        return;
      }
    }
    unint64_t v57 = *(void *)(v51 + 48);
    if ((unint64_t)v53 < v57)
    {
      *uint64_t v53 = 60;
      uint64_t v58 = v53 + 1;
      goto LABEL_114;
    }
    unint64_t v65 = (char *)*v52;
    uint64_t v66 = &v53[-*v52];
    unint64_t v67 = (unint64_t)(v66 + 1);
    if ((uint64_t)(v66 + 1) < 0) {
      goto LABEL_163;
    }
    unint64_t v68 = v57 - (void)v65;
    if (2 * v68 > v67) {
      unint64_t v67 = 2 * v68;
    }
    if (v68 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v69 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v69 = v67;
    }
    if (v69) {
      unint64_t v70 = operator new(v69);
    }
    else {
      unint64_t v70 = 0;
    }
    int64_t v76 = (char *)v70 + v69;
    v66[(void)v70] = 60;
    uint64_t v58 = &v66[(void)v70 + 1];
    if (v53 == v65)
    {
      *(void *)(v51 + 32) = &v66[(void)v70];
      *(void *)(v51 + 40) = v58;
      *(void *)(v51 + 48) = v76;
    }
    else
    {
      uint64_t v77 = &v53[~(unint64_t)v65];
      do
      {
        char v78 = *--v53;
        (v77--)[(void)v70] = v78;
      }
      while (v53 != v65);
      uint64_t v53 = *(char **)(v51 + 32);
      *(void *)(v51 + 32) = v70;
      *(void *)(v51 + 40) = v58;
      *(void *)(v51 + 48) = v76;
      if (!v53)
      {
LABEL_114:
        *(void *)(v51 + 40) = v58;
        unint64_t v79 = *(void *)(v51 + 48);
        if ((unint64_t)v58 < v79)
        {
          *uint64_t v58 = 25;
          uint64_t v53 = v58 + 1;
          goto LABEL_132;
        }
        unint64_t v80 = (char *)*v52;
        char v81 = &v58[-*v52];
        unint64_t v82 = (unint64_t)(v81 + 1);
        if ((uint64_t)(v81 + 1) < 0) {
          goto LABEL_163;
        }
        unint64_t v83 = v79 - (void)v80;
        if (2 * v83 > v82) {
          unint64_t v82 = 2 * v83;
        }
        if (v83 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v84 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v84 = v82;
        }
        if (v84) {
          unint64_t v85 = operator new(v84);
        }
        else {
          unint64_t v85 = 0;
        }
        uint64_t v86 = (char *)v85 + v84;
        v81[(void)v85] = 25;
        uint64_t v53 = &v81[(void)v85 + 1];
        if (v58 == v80)
        {
          *(void *)(v51 + 32) = &v81[(void)v85];
          *(void *)(v51 + 40) = v53;
          *(void *)(v51 + 48) = v86;
        }
        else
        {
          uint64_t v87 = &v58[~(unint64_t)v80];
          do
          {
            char v88 = *--v58;
            (v87--)[(void)v85] = v88;
          }
          while (v58 != v80);
          uint64_t v58 = *(char **)(v51 + 32);
          *(void *)(v51 + 32) = v85;
          *(void *)(v51 + 40) = v53;
          *(void *)(v51 + 48) = v86;
          if (!v58)
          {
LABEL_132:
            *(void *)(v51 + 40) = v53;
            unint64_t v89 = *(void *)(v51 + 48);
            if ((unint64_t)v53 >= v89)
            {
              std::vector<std::string> v91 = (char *)*v52;
              v92 = &v53[-*v52];
              unint64_t v93 = (unint64_t)(v92 + 1);
              if ((uint64_t)(v92 + 1) < 0) {
LABEL_163:
              }
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              unint64_t v94 = v89 - (void)v91;
              if (2 * v94 > v93) {
                unint64_t v93 = 2 * v94;
              }
              if (v94 >= 0x3FFFFFFFFFFFFFFFLL) {
                size_t v95 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                size_t v95 = v93;
              }
              if (v95) {
                uint64_t v64 = operator new(v95);
              }
              else {
                uint64_t v64 = 0;
              }
              long long v96 = &v92[(void)v64];
              uint64_t v97 = (char *)v64 + v95;
              v92[(void)v64] = 43;
              uint64_t v90 = (uint64_t)&v92[(void)v64 + 1];
              if (v53 != v91)
              {
                v98 = &v53[~(unint64_t)v91];
                do
                {
                  char v99 = *--v53;
                  (v98--)[(void)v64] = v99;
                }
                while (v53 != v91);
                goto LABEL_157;
              }
LABEL_159:
              *(void *)(v51 + 32) = v96;
              *(void *)(v51 + 40) = v90;
              *(void *)(v51 + 48) = v97;
LABEL_160:
              operator delete(v53);
              goto LABEL_161;
            }
LABEL_133:
            char v56 = 43;
            goto LABEL_134;
          }
        }
        operator delete(v58);
        goto LABEL_132;
      }
    }
    operator delete(v53);
    goto LABEL_114;
  }
}

void SLPronouncerEng::MakePossessive(SLPronouncerEng *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) != v2)
  {
    unint64_t v4 = 0;
    while (1)
    {
      uint64_t v5 = *(void *)(v2 + 8 * v4);
      uint64_t v6 = (void *)(v5 + 32);
      uint64_t v7 = *(char **)(v5 + 40);
      int v8 = SLPhonEng::sFlags[*(v7 - 1)];
      if ((v8 & 0x20000) != 0 || (v8 & 0x8002000) == 0x8002000) {
        break;
      }
      unint64_t v9 = *(void *)(v5 + 48);
      if ((SLPhonEng::sFlags[*(v7 - 1)] & 6) != 2)
      {
        if ((unint64_t)v7 >= v9)
        {
          uint64_t v13 = (char *)*v6;
          int64_t v14 = &v7[-*v6];
          unint64_t v15 = (unint64_t)(v14 + 1);
          if ((uint64_t)(v14 + 1) < 0) {
            goto LABEL_94;
          }
          unint64_t v16 = v9 - (void)v13;
          if (2 * v16 > v15) {
            unint64_t v15 = 2 * v16;
          }
          if (v16 >= 0x3FFFFFFFFFFFFFFFLL) {
            size_t v17 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            size_t v17 = v15;
          }
          if (v17) {
            uint64_t v18 = operator new(v17);
          }
          else {
            uint64_t v18 = 0;
          }
          unint64_t v50 = &v14[(void)v18];
          uint64_t v51 = (char *)v18 + v17;
          v14[(void)v18] = 43;
          uint64_t v44 = (uint64_t)&v14[(void)v18 + 1];
          if (v7 == v13) {
            goto LABEL_88;
          }
          int v54 = &v7[~(unint64_t)v13];
          do
          {
            char v55 = *--v7;
            (v54--)[(void)v18] = v55;
          }
          while (v7 != v13);
LABEL_86:
          uint64_t v7 = *(char **)(v5 + 32);
          *(void *)(v5 + 32) = v18;
          *(void *)(v5 + 40) = v44;
          *(void *)(v5 + 48) = v51;
          if (!v7) {
            goto LABEL_90;
          }
          goto LABEL_89;
        }
        goto LABEL_62;
      }
      if ((unint64_t)v7 >= v9)
      {
        unint64_t v25 = (char *)*v6;
        __int16 v26 = &v7[-*v6];
        unint64_t v27 = (unint64_t)(v26 + 1);
        if ((uint64_t)(v26 + 1) < 0) {
          goto LABEL_94;
        }
        unint64_t v28 = v9 - (void)v25;
        if (2 * v28 > v27) {
          unint64_t v27 = 2 * v28;
        }
        if (v28 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v29 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v29 = v27;
        }
        if (v29) {
          uint64_t v18 = operator new(v29);
        }
        else {
          uint64_t v18 = 0;
        }
        unint64_t v50 = &v26[(void)v18];
        uint64_t v51 = (char *)v18 + v29;
        v26[(void)v18] = 42;
        uint64_t v44 = (uint64_t)&v26[(void)v18 + 1];
        if (v7 == v25) {
          goto LABEL_88;
        }
        char v56 = &v7[~(unint64_t)v25];
        do
        {
          char v57 = *--v7;
          (v56--)[(void)v18] = v57;
        }
        while (v7 != v25);
        goto LABEL_86;
      }
      char v10 = 42;
LABEL_63:
      *uint64_t v7 = v10;
      uint64_t v44 = (uint64_t)(v7 + 1);
LABEL_90:
      unsigned int v60 = *(unsigned __int16 *)(v5 + 4);
      uint64_t v59 = v5 + 4;
      uint64_t v58 = v60;
      *(void *)(v59 + 36) = v44;
      if (v60 <= 6)
      {
        uint64_t v61 = v58 + 1;
        *(_WORD *)uint64_t v59 = v61;
        *(_WORD *)(v59 + 2 * v61) = 84;
      }
      ++v4;
      uint64_t v2 = *((void *)a2 + 10);
      if (v4 >= (*((void *)a2 + 11) - v2) >> 3) {
        return;
      }
    }
    unint64_t v11 = *(void *)(v5 + 48);
    if ((unint64_t)v7 < v11)
    {
      *uint64_t v7 = 60;
      unint64_t v12 = v7 + 1;
      goto LABEL_43;
    }
    __int16 v19 = (char *)*v6;
    unint64_t v20 = &v7[-*v6];
    unint64_t v21 = (unint64_t)(v20 + 1);
    if ((uint64_t)(v20 + 1) < 0) {
      goto LABEL_94;
    }
    unint64_t v22 = v11 - (void)v19;
    if (2 * v22 > v21) {
      unint64_t v21 = 2 * v22;
    }
    if (v22 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v23 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v23 = v21;
    }
    if (v23) {
      __int16 v24 = operator new(v23);
    }
    else {
      __int16 v24 = 0;
    }
    uint64_t v30 = (char *)v24 + v23;
    v20[(void)v24] = 60;
    unint64_t v12 = &v20[(void)v24 + 1];
    if (v7 == v19)
    {
      *(void *)(v5 + 32) = &v20[(void)v24];
      *(void *)(v5 + 40) = v12;
      *(void *)(v5 + 48) = v30;
    }
    else
    {
      uint64_t v31 = &v7[~(unint64_t)v19];
      do
      {
        char v32 = *--v7;
        (v31--)[(void)v24] = v32;
      }
      while (v7 != v19);
      uint64_t v7 = *(char **)(v5 + 32);
      *(void *)(v5 + 32) = v24;
      *(void *)(v5 + 40) = v12;
      *(void *)(v5 + 48) = v30;
      if (!v7)
      {
LABEL_43:
        *(void *)(v5 + 40) = v12;
        unint64_t v33 = *(void *)(v5 + 48);
        if ((unint64_t)v12 < v33)
        {
          *unint64_t v12 = 25;
          uint64_t v7 = v12 + 1;
          goto LABEL_61;
        }
        uint64_t v34 = (char *)*v6;
        uint64_t v35 = &v12[-*v6];
        unint64_t v36 = (unint64_t)(v35 + 1);
        if ((uint64_t)(v35 + 1) < 0) {
          goto LABEL_94;
        }
        unint64_t v37 = v33 - (void)v34;
        if (2 * v37 > v36) {
          unint64_t v36 = 2 * v37;
        }
        if (v37 >= 0x3FFFFFFFFFFFFFFFLL) {
          size_t v38 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else {
          size_t v38 = v36;
        }
        if (v38) {
          uint64_t v39 = operator new(v38);
        }
        else {
          uint64_t v39 = 0;
        }
        uint64_t v40 = (char *)v39 + v38;
        v35[(void)v39] = 25;
        uint64_t v7 = &v35[(void)v39 + 1];
        if (v12 == v34)
        {
          *(void *)(v5 + 32) = &v35[(void)v39];
          *(void *)(v5 + 40) = v7;
          *(void *)(v5 + 48) = v40;
        }
        else
        {
          uint64_t v41 = &v12[~(unint64_t)v34];
          do
          {
            char v42 = *--v12;
            (v41--)[(void)v39] = v42;
          }
          while (v12 != v34);
          unint64_t v12 = *(char **)(v5 + 32);
          *(void *)(v5 + 32) = v39;
          *(void *)(v5 + 40) = v7;
          *(void *)(v5 + 48) = v40;
          if (!v12)
          {
LABEL_61:
            *(void *)(v5 + 40) = v7;
            unint64_t v43 = *(void *)(v5 + 48);
            if ((unint64_t)v7 >= v43)
            {
              unint64_t v45 = (char *)*v6;
              int v46 = &v7[-*v6];
              unint64_t v47 = (unint64_t)(v46 + 1);
              if ((uint64_t)(v46 + 1) < 0) {
LABEL_94:
              }
                std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
              unint64_t v48 = v43 - (void)v45;
              if (2 * v48 > v47) {
                unint64_t v47 = 2 * v48;
              }
              if (v48 >= 0x3FFFFFFFFFFFFFFFLL) {
                size_t v49 = 0x7FFFFFFFFFFFFFFFLL;
              }
              else {
                size_t v49 = v47;
              }
              if (v49) {
                uint64_t v18 = operator new(v49);
              }
              else {
                uint64_t v18 = 0;
              }
              unint64_t v50 = &v46[(void)v18];
              uint64_t v51 = (char *)v18 + v49;
              v46[(void)v18] = 43;
              uint64_t v44 = (uint64_t)&v46[(void)v18 + 1];
              if (v7 != v45)
              {
                uint64_t v52 = &v7[~(unint64_t)v45];
                do
                {
                  char v53 = *--v7;
                  (v52--)[(void)v18] = v53;
                }
                while (v7 != v45);
                goto LABEL_86;
              }
LABEL_88:
              *(void *)(v5 + 32) = v50;
              *(void *)(v5 + 40) = v44;
              *(void *)(v5 + 48) = v51;
LABEL_89:
              operator delete(v7);
              goto LABEL_90;
            }
LABEL_62:
            char v10 = 43;
            goto LABEL_63;
          }
        }
        operator delete(v12);
        goto LABEL_61;
      }
    }
    operator delete(v7);
    goto LABEL_43;
  }
}

uint64_t SLPronouncerEng::Month(SLPronouncerEng *this, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) > 0xB) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(SLPronouncerEng *, uint64_t))(*(void *)this + 216))(this, a2 + 354);
  }
}

uint64_t SLPronouncerEng::MakePluralUnit(SLPronouncerEng *this, SLToken *a2, char **a3)
{
  v35[0] = 0;
  SLToken::SelectHomographs(a2, 1, (const SLWordTagSet *)v35);
  v35[0] = 0;
  if ((SLToken::SelectHomographs((SLToken *)a3, 64, (const SLWordTagSet *)v35) & 1) == 0)
  {
    v35[0] = 0;
    SLToken::SelectHomographs((SLToken *)a3, 1, (const SLWordTagSet *)v35);
  }
  uint64_t v5 = *((void *)a2 + 10);
  uint64_t v6 = (char **)((char *)a2 + 80);
  if (*((void *)a2 + 11) != v5)
  {
    unint64_t v7 = 0;
    do
    {
      int v8 = *(_DWORD **)(v5 + 8 * v7);
      *int v8 = 1;
      unint64_t v9 = (SLWordTagSet *)(v8 + 1);
      if (!SLWordTagSet::find(v9, 86))
      {
        uint64_t v10 = *(unsigned __int16 *)v9;
        if (v10 <= 6)
        {
          uint64_t v11 = v10 + 1;
          *(_WORD *)unint64_t v9 = v11;
          *((_WORD *)v9 + v11) = 86;
        }
      }
      ++v7;
      uint64_t v5 = *((void *)a2 + 10);
    }
    while (v7 < (*((void *)a2 + 11) - v5) >> 3);
  }
  uint64_t v12 = (uint64_t)a3[11];
  if ((char *)v12 != a3[10])
  {
    do
    {
      uint64_t v13 = *(_DWORD **)(v12 - 8);
      _DWORD *v13 = 64;
      int64_t v14 = v13 + 1;
      if (!SLWordTagSet::find((SLWordTagSet *)(v13 + 1), 86))
      {
        uint64_t v15 = (unsigned __int16)*v14;
        if (v15 <= 6)
        {
          uint64_t v16 = v15 + 1;
          _WORD *v14 = v16;
          v14[v16] = 86;
        }
      }
      uint64_t v18 = (void *)*((void *)a2 + 11);
      unint64_t v17 = *((void *)a2 + 12);
      if ((unint64_t)v18 >= v17)
      {
        uint64_t v20 = ((char *)v18 - *v6) >> 3;
        if ((unint64_t)(v20 + 1) >> 61) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v21 = v17 - (void)*v6;
        uint64_t v22 = v21 >> 2;
        if (v21 >> 2 <= (unint64_t)(v20 + 1)) {
          uint64_t v22 = v20 + 1;
        }
        if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v22;
        }
        if (v23) {
          __int16 v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)a2 + 96, v23);
        }
        else {
          __int16 v24 = 0;
        }
        unint64_t v25 = &v24[8 * v20];
        *(void *)unint64_t v25 = v13;
        __int16 v19 = v25 + 8;
        unint64_t v27 = (char *)*((void *)a2 + 10);
        __int16 v26 = (char *)*((void *)a2 + 11);
        if (v26 != v27)
        {
          do
          {
            uint64_t v28 = *((void *)v26 - 1);
            v26 -= 8;
            *((void *)v25 - 1) = v28;
            v25 -= 8;
          }
          while (v26 != v27);
          __int16 v26 = *v6;
        }
        *((void *)a2 + 10) = v25;
        *((void *)a2 + 11) = v19;
        *((void *)a2 + 12) = &v24[8 * v23];
        if (v26) {
          operator delete(v26);
        }
      }
      else
      {
        *uint64_t v18 = v13;
        __int16 v19 = v18 + 1;
      }
      *((void *)a2 + 11) = v19;
      size_t v29 = a3[10];
      uint64_t v12 = (uint64_t)(a3[11] - 8);
      a3[11] = (char *)v12;
    }
    while ((char *)v12 != v29);
  }
  uint64_t v30 = (const void *)*((void *)a2 + 7);
  uint64_t v32 = *((void *)a2 + 8);
  uint64_t v31 = (char *)a2 + 56;
  unint64_t v33 = a3[7];
  if (memcmp(v30, v33, v32 - (void)v30))
  {
    *(_WORD *)(v32 - 2) = 124;
    std::vector<unsigned short>::__insert_with_size[abi:ne180100]<std::__wrap_iter<unsigned short *>,std::__wrap_iter<unsigned short *>>((uint64_t)v31, v32, v33, a3[8], (a3[8] - v33) >> 1);
  }
  SLToken::~SLToken((SLToken *)a3);
  return MEMORY[0x223CA4030]();
}

void SLCreatePronouncerEng(const SLDictLookup *a1)
{
}

void SLPronouncerEng::~SLPronouncerEng(SLPronouncerEng *this)
{
  SLPronouncer::~SLPronouncer(this);
  JUMPOUT(0x223CA4030);
}

uint64_t SLPronouncerEng::NumericBoundary(SLPronouncerEng *this, int a2)
{
  if (a2) {
    return 14;
  }
  else {
    return 15;
  }
}

uint64_t SLPronouncerEng::Symbol(SLPronouncerEng *this, char *__s1)
{
  return SLPronouncerImpl::SymbolLookup((uint64_t)this, (uint64_t)&SLPronouncerEng::sSymbolIndex, 0x7BEuLL, __s1);
}

char **SLPronouncerEng::SymbolByKey(SLPronouncerEng *this, unint64_t a2)
{
  if (a2 > 0x82A) {
    return 0;
  }
  if ((&SLPronouncerEng::sSymbols)[2 * a2]) {
    return &(&SLPronouncerEng::sSymbols)[2 * a2];
  }
  return 0;
}

uint64_t SLPronouncerEng::SymbolCount(SLPronouncerEng *this)
{
  return 2091;
}

uint64_t SLPronouncerEng::TimeBoundary(SLPronouncerEng *this, int a2)
{
  if (a2) {
    return 15;
  }
  else {
    return 13;
  }
}

void SLChar::PushUTF8(std::string *this, unsigned int a2)
{
  unsigned int v2 = a2;
  if (a2 > 0x7F)
  {
    if (a2 > 0x7FF)
    {
      std::string::push_back(this, (a2 >> 12) | 0xE0);
      std::string::push_back(this, (v2 >> 6) & 0x3F | 0x80);
    }
    else
    {
      std::string::push_back(this, (a2 >> 6) | 0xC0);
    }
    LOBYTE(v2) = v2 & 0x3F | 0x80;
  }
  std::string::push_back(this, v2);
}

void SLChar::PushUTF8(std::string *this, unsigned int a2, unsigned int a3)
{
  if ((unsigned __int16)((unsigned __int16)(a2 + 9216) >> 10) < 0x3Fu
    || (unsigned __int16)((unsigned __int16)(a3 + 0x2000) >> 10) <= 0x3Eu)
  {
    SLChar::PushUTF8(this, a2);
    SLChar::PushUTF8(this, a3);
  }
  else
  {
    unsigned int v5 = (((a2 << 10) | 0x10000) - 56623104) | (a3 - 56320);
    std::string::push_back(this, (v5 >> 18) | 0xF0);
    std::string::push_back(this, (v5 >> 12) & 0x3F | 0x80);
    std::string::push_back(this, (v5 >> 6) & 0x3F | 0x80);
    std::string::push_back(this, a3 & 0x3F | 0x80);
  }
}

void SLCreatePostLexerEng(SLLexer *a1, SLDictLookup *a2, SLPronouncer *a3)
{
}

void sub_222A6ACDC(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F3C40ACABD4A7);
  _Unwind_Resume(a1);
}

void SLPostLexerEng::SLPostLexerEng(SLPostLexerEng *this, SLLexer *a2, SLDictLookup *a3, SLPronouncer *a4)
{
}

void sub_222A6ADA0(_Unwind_Exception *a1)
{
  SLPostLexerImpl::~SLPostLexerImpl(v1);
  _Unwind_Resume(a1);
}

void SLPostLexerEng::~SLPostLexerEng(SLPostLexerEng *this)
{
  *(void *)this = &unk_26D52C718;
  *((void *)this + 12) = &unk_26D52C800;
  uint64_t v2 = *((void *)this + 25);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 26);
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
  }
  SLPostLexerImpl::~SLPostLexerImpl(this);
}

{
  uint64_t vars8;

  SLPostLexerEng::~SLPostLexerEng(this);
  JUMPOUT(0x223CA4030);
}

void non-virtual thunk to'SLPostLexerEng::~SLPostLexerEng(SLPostLexerEng *this)
{
}

{
  uint64_t vars8;

  SLPostLexerEng::~SLPostLexerEng((SLPostLexerEng *)((char *)this - 96));
  JUMPOUT(0x223CA4030);
}

BOOL SLPostLexerEng::SingleLetterWordAtEnd(SLPostLexerEng *this, int a2)
{
  return a2 == 73;
}

uint64_t SLPostLexerEng::SingleLetterWordAsPrefix(SLPostLexerEng *this, unsigned int a2, int a3)
{
  if ((unsigned __int16)(SLChar::sToUpper[a2 & 0x3F | (SLChar::sUniMap[(unint64_t)a2 >> 6] << 6)] + a2) == 65) {
    return a3 ^ 1u;
  }
  else {
    return 0;
  }
}

BOOL SLPostLexerEng::SingleLetterWordAsInfix(SLPostLexerEng *this, unsigned int a2)
{
  return (unsigned __int16)(SLChar::sToUpper[a2 & 0x3F | (SLChar::sUniMap[(unint64_t)a2 >> 6] << 6)] + a2) == 65;
}

void SLPostLexerEng::HandlePunct(SLPostLexerEng *this, SLToken *a2)
{
  unsigned int v3 = **((unsigned __int16 **)a2 + 7);
  if (v3 > 0x3E)
  {
    if (**((unsigned __int16 **)a2 + 7) <= 0x200Fu)
    {
      if (v3 != 63)
      {
        if (v3 != 124) {
          goto LABEL_55;
        }
        goto LABEL_35;
      }
      char v4 = 7;
    }
    else
    {
      if (v3 - 8208 < 4)
      {
LABEL_10:
        int v6 = *((_DWORD *)a2 + 4) & 0x401;
        if (v6 != 1025)
        {
          if (v6) {
            char v7 = 2;
          }
          else {
            char v7 = 1;
          }
          int v8 = SLLexerBuffer::operator[]((void *)this + 12, 0);
          if (v8) {
            *((unsigned char *)v8 + 1) = v7;
          }
LABEL_16:
          SLToken::~SLToken(a2);
          JUMPOUT(0x223CA4030);
        }
        goto LABEL_35;
      }
      if (v3 == 8212)
      {
LABEL_35:
        char v4 = 5;
        goto LABEL_36;
      }
      if (v3 != 8230) {
        goto LABEL_55;
      }
LABEL_29:
      char v4 = 4;
    }
LABEL_36:
    unint64_t v10 = *((void *)a2 + 9);
    uint64_t v11 = (char *)*((void *)a2 + 7);
    uint64_t v12 = (char *)*((void *)a2 + 8);
    *((_WORD *)v11 + 1) = 32;
    if ((unint64_t)v12 >= v10)
    {
      uint64_t v14 = v12 - v11;
      if (v12 - v11 <= -3) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v15 = v14 >> 1;
      unint64_t v16 = v10 - (void)v11;
      if (v16 <= (v14 >> 1) + 1) {
        unint64_t v17 = v15 + 1;
      }
      else {
        unint64_t v17 = v16;
      }
      if (v16 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v18 = v17;
      }
      if (v18)
      {
        __int16 v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v18);
        uint64_t v11 = (char *)*((void *)a2 + 7);
        uint64_t v12 = (char *)*((void *)a2 + 8);
      }
      else
      {
        __int16 v19 = 0;
      }
      uint64_t v20 = &v19[2 * v15];
      uint64_t v21 = &v19[2 * v18];
      *(_WORD *)uint64_t v20 = 0;
      uint64_t v13 = v20 + 2;
      while (v12 != v11)
      {
        __int16 v22 = *((_WORD *)v12 - 1);
        v12 -= 2;
        *((_WORD *)v20 - 1) = v22;
        v20 -= 2;
      }
      *((void *)a2 + 7) = v20;
      *((void *)a2 + 8) = v13;
      *((void *)a2 + 9) = v21;
      if (v11) {
        operator delete(v11);
      }
    }
    else
    {
      *(_WORD *)uint64_t v12 = 0;
      uint64_t v13 = v12 + 2;
    }
    *((void *)a2 + 8) = v13;
    *((unsigned char *)a2 + 1) = v4;
    operator new();
  }
  if (**((unsigned __int16 **)a2 + 7) > 0x39u)
  {
    if (v3 - 58 >= 2) {
      goto LABEL_55;
    }
    goto LABEL_35;
  }
  char v4 = 6;
  switch(**((_WORD **)a2 + 7))
  {
    case ',':
      unsigned int v5 = SLLexerBuffer::operator[]((void *)this + 12, 0);
      if (v5 && *(unsigned char *)v5 == 1 && (*((unsigned char *)a2 + 16) & 1) == 0) {
        *((_DWORD *)v5 + 4) |= 0x80u;
      }
      goto LABEL_29;
    case '-':
      goto LABEL_10;
    case '.':
      goto LABEL_36;
    case '/':
      if ((~*((_DWORD *)a2 + 4) & 0x401) == 0)
      {
        unint64_t v9 = SLLexerBuffer::operator[]((void *)this + 12, 0);
        if (v9)
        {
          if (*(unsigned char *)v9 != 13) {
            goto LABEL_35;
          }
        }
      }
      goto LABEL_16;
    default:
      if (v3 == 9)
      {
        *((unsigned char *)this + 242) = 1;
        goto LABEL_35;
      }
      if (v3 == 33)
      {
        char v4 = 8;
        goto LABEL_36;
      }
LABEL_55:
      SLPostLexerImpl::HandlePunct(this, a2);
      return;
  }
}

void sub_222A6B500(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x1070C40CEE27CEALL);
  _Unwind_Resume(a1);
}

char *SLPostLexerEng::AppendMorph(SLPostLexerEng *this, SLToken *a2, char *a3, char *a4)
{
  if ((unsigned __int16)(SLChar::sToUpper[*(_WORD *)a3 & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)a3 >> 6] << 6)]
                        + *(_WORD *)a3) == 69)
  {
    unint64_t v4 = *(unsigned __int16 *)(*((void *)a2 + 8) - 4);
    a3 += 2 * ((unsigned __int16)(SLChar::sToUpper[v4 & 0x3F | (SLChar::sUniMap[v4 >> 6] << 6)] + v4) == 69);
  }
  return SLPostLexerImpl::AppendMorph(this, a2, a3, a4);
}

uint64_t SLPostLexerEng::PeriodIsEndOfSentence(uint64_t *a1, unsigned __int16 *a2, uint64_t a3, SLToken *this, uint64_t a5)
{
  int v10 = *((char *)a2 + 23);
  if (v10 < 0)
  {
    if (*((void *)a2 + 1) != 3) {
      goto LABEL_10;
    }
    uint64_t v11 = *(const std::string::value_type **)a2;
  }
  else
  {
    uint64_t v11 = (const std::string::value_type *)a2;
    if (v10 != 3) {
      goto LABEL_10;
    }
  }
  int v12 = *(unsigned __int16 *)v11;
  int v13 = *((unsigned __int8 *)v11 + 2);
  if (v12 == 20302 && v13 == 46)
  {
    if (a5)
    {
      if (*(unsigned char *)a5 == 1 && (*(unsigned char *)(a5 + 17) & 0x10) == 0)
      {
        SLDissecter::DissectNumber(a1[23], a5, 0, ((uint64_t)(*(void *)(a5 + 64) - *(void *)(a5 + 56)) >> 1) - 1, (uint64_t)&__p);
        if (!v29 && !v30 && !__p.__r_.__value_.__l.__size_) {
          return 0;
        }
      }
    }
    *((_DWORD *)this + 4) &= ~0x40u;
    return 1;
  }
LABEL_10:
  if (!SLToken::HasTag(this, 1036))
  {
LABEL_15:
    char v15 = 0;
    if (a5) {
      goto LABEL_16;
    }
    return 1;
  }
  if (*(unsigned char *)(a3 + 5) != 1)
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 67960833;
    if ((SLToken::SelectHomographs(this, 0x7FFFFFFF, (const SLWordTagSet *)&__p) & 1) == 0)
    {
      char v15 = 0;
      *((_DWORD *)this + 4) &= ~0x40u;
      if (!a5) {
        return 1;
      }
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  char v15 = 1;
  if (!a5) {
    return 1;
  }
LABEL_16:
  if (*(unsigned char *)a5) {
    return 0;
  }
  unint64_t v16 = *(_WORD **)(a5 + 56);
  if ((SLChar::sCharClass[*v16 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v16 >> 6] << 6)] & 0x9F) == 0x81) {
    return 0;
  }
  int v19 = *((char *)a2 + 23);
  if (v19 < 0)
  {
    if (*((void *)a2 + 1) != 3)
    {
      if (v15) {
        return 0;
      }
      uint64_t v21 = a1[24];
      goto LABEL_47;
    }
    uint64_t v20 = *(unsigned __int16 **)a2;
  }
  else
  {
    uint64_t v20 = a2;
    if (v19 != 3)
    {
      if ((v15 & 1) == 0)
      {
        uint64_t v21 = a1[24];
        __int16 v22 = (const std::string::value_type *)a2;
        goto LABEL_48;
      }
      return 0;
    }
  }
  int v23 = *v20;
  int v24 = *((unsigned __int8 *)v20 + 2);
  if (v23 == 21334 && v24 == 46) {
    char v15 = 1;
  }
  if (v15) {
    return 0;
  }
  uint64_t v21 = a1[24];
  __int16 v22 = (const std::string::value_type *)a2;
  if (v19 < 0) {
LABEL_47:
  }
    __int16 v22 = *(const std::string::value_type **)a2;
LABEL_48:
  SLPostLexerImpl::Transcribe((SLPostLexerImpl *)a1, (SLToken *)a5, 2, 0, ((uint64_t)(*(void *)(a5 + 64) - (void)v16) >> 1) - 1, &__p);
  char v26 = (*(uint64_t (**)(uint64_t, const std::string::value_type *))(*(void *)v21 + 64))(v21, v22);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v26) {
    return 0;
  }
  if (*((char *)a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else {
    std::string v27 = *(std::string *)a2;
  }
  uint64_t IsEndOfSentence = SLPostLexerImpl::PeriodIsEndOfSentence();
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  return IsEndOfSentence;
}

void sub_222A6B89C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

SLToken *SLPostLexerEng::StartsCurrencyRange(void *a1, uint64_t a2)
{
  unint64_t v4 = a1 + 12;
  CFStringRef result = (SLToken *)SLLexerBuffer::operator[](a1 + 12, 0);
  if (result)
  {
    if (*(unsigned char *)result) {
      return 0;
    }
    SLPostLexerImpl::Transcribe((SLPostLexerImpl *)a1, result, 2, 0, ((uint64_t)(*((void *)result + 8) - *((void *)result + 7)) >> 1) - 1, &v16);
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
    {
      if (v16.__r_.__value_.__l.__size_ != 2)
      {
        operator delete(v16.__r_.__value_.__l.__data_);
        return 0;
      }
      int v6 = *(unsigned __int16 *)v16.__r_.__value_.__l.__data_;
      operator delete(v16.__r_.__value_.__l.__data_);
      if (v6 != 20308) {
        return 0;
      }
    }
    else if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) != 2 || LOWORD(v16.__r_.__value_.__l.__data_) != 20308)
    {
      return 0;
    }
    char v7 = (SLToken *)SLLexerBuffer::operator[](v4, 1uLL);
    int v8 = SLLexerBuffer::operator[](v4, 2uLL);
    if (!v7) {
      return 0;
    }
    uint64_t v9 = (uint64_t)v8;
    if (!v8
      || SLPostLexerImpl::FindUnit((SLPostLexerImpl *)a1, v7, 0, ((uint64_t)(*((void *)v7 + 8) - *((void *)v7 + 7)) >> 1) - 1, 36) != a2)
    {
      return 0;
    }
    if ((*(unsigned char *)(v9 + 17) & 0x10) != 0)
    {
      SLDissecter::DissectUnit(a1[23], v9, (uint64_t)&v16);
      unint64_t v14 = v17;
      unint64_t v12 = ((uint64_t)(*(void *)(v9 + 64) - *(void *)(v9 + 56)) >> 1) - 1;
      if (v16.__r_.__value_.__s.__data_[0]) {
        int v15 = 42;
      }
      else {
        int v15 = 43;
      }
      int v13 = (SLPostLexerImpl *)a1;
      uint64_t v11 = (SLToken *)v9;
    }
    else
    {
      int v10 = (SLToken *)SLLexerBuffer::operator[](v4, 3uLL);
      if (!v10) {
        return 0;
      }
      uint64_t v11 = v10;
      unint64_t v12 = ((uint64_t)(*((void *)v10 + 8) - *((void *)v10 + 7)) >> 1) - 1;
      int v13 = (SLPostLexerImpl *)a1;
      unint64_t v14 = 0;
      int v15 = 42;
    }
    return (SLToken *)(SLPostLexerImpl::FindUnit(v13, v11, v14, v12, v15) != 0);
  }
  return result;
}

BOOL SLPostLexerEng::EmphasizeAgglomeratedWord(SLPostLexerEng *this, SLToken *a2)
{
  BOOL result = SLPostLexerImpl::EmphasizeAgglomeratedWord(this, a2);
  if (result)
  {
    return SLToken::HasPOS(a2, 67);
  }
  return result;
}

void *SLPostLexerEng::IsCompassDirection(SLPostLexerEng *this, SLToken *a2)
{
  uint64_t v2 = (unsigned __int16 *)*((void *)a2 + 7);
  uint64_t v3 = (uint64_t)(*((void *)a2 + 8) - (void)v2) >> 1;
  switch(v3)
  {
    case 4:
      BOOL result = memchr("NSWE", *v2, 5uLL);
      if (!result) {
        return result;
      }
      int v5 = v2[1];
      if (v5 != 83 && v5 != 78) {
        return 0;
      }
      int v6 = v2[2];
      break;
    case 3:
      int v7 = *v2;
      if (v7 != 83 && v7 != 78) {
        return 0;
      }
      int v6 = v2[1];
      break;
    case 2:
      return (void *)(memchr("NSWE", *v2, 5uLL) != 0);
    default:
      return 0;
  }
  return (void *)(v6 == 87 || v6 == 69);
}

uint64_t (***SLPostLexerEng::IsHouseNumber(SLPostLexerEng *this, SLToken *a2))(void)
{
  unint64_t v3 = 0;
  unint64_t v4 = (void *)((char *)this + 96);
  while (1)
  {
    BOOL result = SLLexerBuffer::operator[](v4, v3);
    if (!result) {
      return result;
    }
    uint64_t v6 = (uint64_t)result;
    int v7 = SLLexerBuffer::operator[](v4, v3 + 1);
    if (*(unsigned char *)v6 == 1)
    {
      unint64_t v9 = v3;
      goto LABEL_21;
    }
    if (*(unsigned char *)v6) {
      return 0;
    }
    BOOL v8 = 0;
    if (*(unsigned char *)(v6 + 16)) {
      goto LABEL_13;
    }
    unint64_t v9 = v3;
    if (!v7) {
      goto LABEL_14;
    }
    if (*(unsigned char *)v7 != 13)
    {
      BOOL v8 = 0;
LABEL_13:
      unint64_t v9 = v3;
      goto LABEL_14;
    }
    int v10 = *(unsigned __int16 *)v7[7];
    BOOL v8 = v10 == 46;
    if (v10 == 46) {
      unint64_t v9 = v3 + 1;
    }
    else {
      unint64_t v9 = v3;
    }
LABEL_14:
    SLPostLexerImpl::Classify(this, (SLToken *)v6);
    uint64_t v11 = *(unsigned __int8 *)(v6 + 5);
    if (((uint64_t)(*(void *)(v6 + 64) - *(void *)(v6 + 56)) >> 1) - 1 != v11) {
      goto LABEL_17;
    }
    if (((*(uint64_t (**)(SLPostLexerEng *, uint64_t))(*(void *)this + 192))(this, v6) & 1) == 0)
    {
      LODWORD(v11) = *(unsigned __int8 *)(v6 + 5);
LABEL_17:
      if (v11 == 1)
      {
        SLPostLexerImpl::Transcribe(this, (SLToken *)v6, 2, 0, ((uint64_t)(*(void *)(v6 + 64) - *(void *)(v6 + 56)) >> 1) - 1, &v12);
        if (v8) {
          std::string::push_back(&v12, 46);
        }
        operator new();
      }
      return 0;
    }
LABEL_21:
    unint64_t v3 = v9 + 1;
    if (v9 + 1 >= 7) {
      return 0;
    }
  }
}

void sub_222A6BF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void SLPostLexerEng::PredictAltNum(SLPostLexerEng *this, SLToken *a2, SLToken *a3)
{
  if (*(unsigned char *)a3 == 1 && SLToken::HasTag(a2, 1044))
  {
    int v5 = *((_DWORD *)a3 + 4);
    if ((v5 & 0x1000) != 0)
    {
      SLToken::SetType(a3, 11);
    }
    else if (*((void *)a3 + 8) - *((void *)a3 + 7) == 8)
    {
      *((_DWORD *)a3 + 4) = v5 | 0x400;
      if (!*((unsigned char *)a3 + 1)) {
        *((unsigned char *)a3 + 1) = 2;
      }
    }
  }
  else if (SLToken::HasTag(a2, 1058))
  {
    *((_DWORD *)a3 + 4) |= 0x1000000u;
  }
}

void SLPostLexerEng::PredictSingleLetter(SLPostLexerEng *this, SLToken *a2, SLToken *a3)
{
  if (SLToken::HasTag(a2, 1050))
  {
    SLToken::SetType(a3, 11);
  }
}

void SLPostLexerEng::CreateIPAHomograph(SLPostLexerEng *this, const unsigned __int8 *a2)
{
}

void sub_222A6C45C(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x1070C40CEE27CEALL);
  _Unwind_Resume(a1);
}

uint64_t SLPostLexerEng::FindElapsed(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  unint64_t v5 = *((unsigned __int8 *)a2 + 23);
  int v6 = (char)v5;
  if ((v5 & 0x80u) != 0) {
    unint64_t v5 = a2[1];
  }
  if (v5 < 2)
  {
    uint64_t v8 = 0;
  }
  else
  {
    if (v6 >= 0) {
      int v7 = a2;
    }
    else {
      int v7 = (uint64_t *)*a2;
    }
    if (*((unsigned char *)v7 + v5 - 1) == 83) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = 0;
    }
  }
  uint64_t v9 = *a3;
  int v10 = (&sElapsedSym)[2 * *a3];
  if (!v10) {
    return 0;
  }
  size_t v11 = v8 + v5;
  std::string v12 = &(&sElapsedSym)[2 * v9 + 2];
  for (uint64_t i = v9 + 1; ; ++i)
  {
    unint64_t v14 = *((char *)a2 + 23) >= 0 ? a2 : (uint64_t *)*a2;
    if (!memcmp(v14, v10, v11) && !v10[v11]) {
      break;
    }
    *a3 = i;
    int v15 = *v12;
    v12 += 2;
    int v10 = v15;
    if (!v15) {
      return 0;
    }
  }
  return 1;
}

BOOL SLPostLexerEng::ElapsedSequence(SLPostLexerEng *this, uint64_t a2, uint64_t a3)
{
  if ((&sElapsedSym)[2 * a3 + 1] == (&sElapsedSym)[2 * a2 + 1] + 1) {
    return 1;
  }
  BOOL v4 = (a2 & 0xFFFFFFFFFFFFFFFELL) == 2 && (a3 & 0xFFFFFFFFFFFFFFFELL) == 6;
  if ((unint64_t)(a2 - 15) <= 0xFFFFFFFFFFFFFFF2) {
    return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
  }
  else {
    return v4;
  }
}

void SLPostLexerEng::ElapsedSymbol(uint64_t a1, uint64_t *a2, uint64_t a3, char a4, void *a5)
{
  unint64_t v5 = *((unsigned __int8 *)a2 + 23);
  int v6 = (char)v5;
  if ((v5 & 0x80u) != 0) {
    unint64_t v5 = a2[1];
  }
  if ((a4 & 1) != 0 || v5 >= 2 && (v6 >= 0 ? (int v7 = a2) : (int v7 = (uint64_t *)*a2), *((unsigned char *)v7 + v5 - 1) == 83)) {
    uint64_t v8 = &sElapsedNamePlural;
  }
  else {
    uint64_t v8 = &sElapsedNameSingular;
  }
  *a5 = v8[(void)(&sElapsedSym)[2 * a3 + 1]];
  a5[1] = 0x4100000001;
}

uint64_t SLPostLexerEng::HandleUnknownChar(SLPostLexerEng *this, SLToken *a2, SLTokenList *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  SLToken::SetType(a2, 0);
  uint64_t result = SLPostLexerImpl::HandleTokenInDictionary(this, a2);
  if ((result & 1) == 0)
  {
    UErrorCode pErrorCode = U_ZERO_ERROR;
    int v7 = (unsigned __int16 *)*((void *)a2 + 7);
    UChar32 v8 = *v7;
    if (*((void *)a2 + 8) - (void)v7 != 4) {
      UChar32 v8 = v7[1] + (v8 << 10) - 56613888;
    }
    if (v8 >= 128)
    {
      int v9 = u_isgraph(v8);
      BOOL v10 = v8 >> 4 == 4064 || (v8 & 0xFFFFFFFE) == 65532;
      if (!v10 && v9 != 0)
      {
        if ((int32_t v12 = u_charName(v8, U_CHAR_NAME_ALIAS, v16, 128, &pErrorCode), pErrorCode <= U_ZERO_ERROR) && v12
          || (UErrorCode pErrorCode = U_ZERO_ERROR,
              int32_t v12 = u_charName(v8, U_EXTENDED_CHAR_NAME, v16, 128, &pErrorCode),
              pErrorCode <= U_ZERO_ERROR)
          && v12)
        {
          if (v16[0] != 60)
          {
            __int16 v15 = 8232;
            strcpy(&v16[v12], ")");
            v13[0] = &v15;
            v13[1] = 0x4100000001;
            (*(void (**)(void, void *, SLTokenList *, void, void))(**((void **)this + 22) + 232))(*((void *)this + 22), v13, a3, *((void *)a2 + 4), *((void *)a2 + 5));
          }
        }
      }
    }
    SLToken::~SLToken(a2);
    return MEMORY[0x223CA4030]();
  }
  return result;
}

void SLPhonemeParser::Create(SLPhonemeParser *this, const __CFLocale *a2)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFEqual(Value, @"en"))
  {
    SLCreatePhonemeParserEng();
  }
  SLPhonemeParser::Create();
}

BOOL SLPhonemeParser::IsWordMarker(SLPhonemeParser *this, int a2)
{
  return a2 == 2;
}

uint64_t SLPhonemeParser::DefaultWordMarker(SLPhonemeParser *this)
{
  return 2;
}

uint64_t SLPhonemeParser::FindTag(SLPhonemeParser *this, const char *a2)
{
  for (unsigned __int16 i = 64; ; ++i)
  {
    unsigned int v4 = i;
    unint64_t v5 = SLTag::Name((SLTag *)i);
    if (!strcmp(a2, v5)) {
      break;
    }
    if (v4 >= 0x99) {
      return 0;
    }
  }
  return i;
}

uint64_t SLPhonemeParserEng::IsPhoneme(SLPhonemeParserEng *this, unsigned __int16 *a2, unsigned __int8 *a3)
{
  unint64_t v5 = (SLPhonEng *)WordPhoneme(*a2);
  int v6 = WordPhoneme(a2[1]);
  int v7 = SLPhonEng::Find(v5, 0);
  *a3 = v7;
  if (v7 != 255) {
    return 1;
  }
  if (!v6) {
    return 0;
  }
  int v9 = SLPhonEng::Find(v5, v6);
  *a3 = v9;
  if (v9 == 255) {
    return 0;
  }
  return 2;
}

uint64_t WordPhoneme(unsigned int a1)
{
  if (a1 > 0x7F
    || (*(_DWORD *)(MEMORY[0x263EF8318] + 4 * a1 + 60) & 0x100) == 0
    && (a1 - 37 > 0x3A || ((1 << (a1 - 37)) & 0x48000000B803441) == 0)
    && a1 != 126)
  {
    LOBYTE(a1) = 0;
  }
  return (char)a1;
}

BOOL SLPhonemeParserEng::IsTunePhoneme(SLPhonemeParserEng *this, unsigned __int16 *a2, unsigned __int8 *a3)
{
  unsigned int v4 = *a2;
  if (v4 > 0x7F || (v4 <= 0x3F ? (BOOL v5 = ((1 << v4) & 0x8400500200000000) == 0) : (BOOL v5 = 1), v5)) {
    LOBYTE(v4) = 0;
  }
  int v6 = SLPhonEng::Find((SLPhonEng *)(char)v4, 0);
  *a3 = v6;
  return v6 != 255;
}

BOOL SLPhonemeParserEng::IsWordMarker(SLPhonemeParserEng *this, int a2)
{
  return (a2 - 74) < 2 || a2 == 2;
}

uint64_t SLPhonemeParserEng::DefaultWordMarker(SLPhonemeParserEng *this)
{
  return 75;
}

uint64_t SLPhonemeParserEng::PhoneticPOS(SLPhonemeParserEng *this)
{
  return 16451;
}

uint64_t SLPhonemeParserEng::FindPOS(SLPhonemeParserEng *this, const char *__s1)
{
  uint64_t v3 = 0;
  while (strcmp(__s1, SLPOSEng::sName[v3]))
  {
    if (++v3 == 32)
    {
      LOBYTE(v3) = -1;
      return v3;
    }
  }
  return v3;
}

uint64_t SLPhonemeParserEng::FindTag(SLPhonemeParserEng *this, const char *a2)
{
  int Tag = SLPhonemeParser::FindTag(this, a2);
  unsigned __int16 i = Tag;
  if (!Tag)
  {
    for (unsigned __int16 i = 1024; ; ++i)
    {
      unsigned int v5 = i;
      int v6 = SLTag::Name((SLTag *)i);
      if (!strcmp(a2, v6)) {
        break;
      }
      if (v5 >= 0x423) {
        return 0;
      }
    }
  }
  return i;
}

void SLCreatePhonemeParserEng(void)
{
}

void SLPhonemeParserEng::~SLPhonemeParserEng(SLPhonemeParserEng *this)
{
  SLPhonemeParser::~SLPhonemeParser(this);
  JUMPOUT(0x223CA4030);
}

void SLTuplesEng::SLTuplesEng(SLTuplesEng *this, SLLexer *a2)
{
  SLTuplesImpl::SLTuplesImpl(this, a2, @"TuplesEng");
  *uint64_t v2 = &unk_26D52C910;
  v2[1] = &unk_26D52C990;
}

void SLCreateTuplesEng(SLLexer *a1)
{
}

void sub_222A6CC64(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F3C40EB326097);
  _Unwind_Resume(a1);
}

uint64_t (***SLTuplesEng::HandleGlobalFlags(SLTuplesEng *this, unint64_t *a2, char a3))(void)
{
  uint64_t result = SLLexerBuffer::operator[]((void *)this + 1, *a2 - 1);
  if ((a3 & 4) != 0) {
    ToBIToken();
  }
  if ((a3 & 8) != 0) {
    ToBIToken();
  }
  return result;
}

void ToBIToken()
{
}

void sub_222A6CDC4(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10F0C4034644DEDLL);
  _Unwind_Resume(a1);
}

void SLTuplesEng::HandleElementFlags(SLTuplesEng *this, unint64_t *a2, unint64_t *a3, SLToken *a4, char a5)
{
  if ((a5 & 8) != 0) {
    ToBIToken();
  }
}

BOOL SLTuplesEng::HandleAgglomerates(SLTuplesEng *this, uint64_t a2)
{
  if (a2 != 2) {
    return 0;
  }
  uint64_t v2 = (void *)((char *)this + 8);
  uint64_t v3 = (SLToken *)SLLexerBuffer::operator[]((void *)this + 1, 0);
  unsigned int v4 = (SLToken *)SLLexerBuffer::operator[](v2, 1uLL);
  BOOL result = SLToken::HasPOS(v3, 2);
  if (result)
  {
    BOOL result = SLToken::HasPOS(v4, 128);
    if (result)
    {
      *((unsigned char *)v3 + 6) = 60;
      *((unsigned char *)v3 + 20) = 0;
      *((unsigned char *)v4 + 6) = 62;
      *((unsigned char *)v4 + 20) = 0;
      BOOL result = 1;
      *((unsigned char *)v4 + 2) = 2;
    }
  }
  return result;
}

void SLTuplesEng::~SLTuplesEng(SLTuplesEng *this)
{
  SLTuplesImpl::~SLTuplesImpl(this);
  JUMPOUT(0x223CA4030);
}

void SLTuplesEng::ParseGlobalFlags(SLTuplesEng *this, unint64_t a2, unsigned int *a3, unsigned __int8 *a4)
{
  *a3 = a2 & 0xF;
  *a4 = SLTuplesEng::sTuplePOS[(a2 >> 4) & 7];
}

void SLTuplesEng::ParseElementFlags(SLTuplesEng *this, char a2, uint64_t a3, unsigned int *a4, unsigned int *a5)
{
  unint64_t v5 = a3 >> (7 * a2 + 7);
  *a4 = v5;
  *a5 = SLTuplesEng::sForcePOS[(v5 >> 4) & 7];
  *a4 &= 0xFu;
}

void non-virtual thunk to'SLTuplesEng::~SLTuplesEng(SLTuplesEng *this)
{
}

{
  uint64_t vars8;

  SLTuplesImpl::~SLTuplesImpl((SLTuplesEng *)((char *)this - 8));
  JUMPOUT(0x223CA4030);
}

void SLStemTracker::Create(SLStemTracker *this, const __CFLocale *a2, SLDictLookup *a3, unint64_t a4, SLLexer *a5)
{
}

void sub_222A6D044(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x10A1C40F325FC3DLL);
  _Unwind_Resume(a1);
}

void SLStemTrackerImpl::SLStemTrackerImpl(SLStemTrackerImpl *this, const __CFLocale *a2, SLDictLookup *a3, unint64_t a4, SLLexer *a5)
{
  *(void *)this = &unk_26D52CA58;
  SLDictionary::SLDictionary((SLStemTrackerImpl *)((char *)this + 8));
  *(void *)this = &unk_26D52C9C8;
  *((void *)this + 1) = &unk_26D52CA30;
  std::vector<SLStemTrackerImpl::Stem>::vector((void *)this + 5, a4);
  *((void *)this + 8) = (char *)this + 64;
  *((void *)this + 9) = (char *)this + 64;
  *((void *)this + 10) = 0;
  SLDictionary::SLDictionary((SLStemTrackerImpl *)((char *)this + 88));
  *((void *)this + 11) = &unk_26D52A980;
  *((void *)this + 14) = 0;
  *((void *)this + 15) = 0;
  *((void *)this + 16) = a3;
  *((void *)this + 27) = a5;
  *((unsigned char *)this + 224) = 0;
  uint64_t v10 = *((void *)this + 5);
  uint64_t v11 = *((void *)this + 6) - v10;
  if (v11)
  {
    unint64_t v12 = v11 / 80;
    if (v12 <= 1) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = v12;
    }
    do
    {
      *(void *)(v10 + 8) = 0;
      unint64_t v14 = operator new(0x18uLL);
      v14[1] = (char *)this + 64;
      v14[2] = v10;
      uint64_t v15 = *((void *)this + 8);
      void *v14 = v15;
      *(void *)(v15 + 8) = v14;
      *((void *)this + 8) = v14;
      ++*((void *)this + 10);
      v10 += 80;
      --v13;
    }
    while (v13);
  }
  SLMorphRules::Create(a2, (const __CFLocale *)1);
}

void sub_222A6D1F0(_Unwind_Exception *a1)
{
  std::__list_imp<SLToken *>::clear(v4);
  int v6 = *v3;
  if (*v3)
  {
    *((void *)v1 + 6) = v6;
    operator delete(v6);
  }
  SLDictionary::~SLDictionary(v2);
  SLLexer::~SLLexer(v1);
  _Unwind_Resume(a1);
}

void SLStemTrackerImpl::~SLStemTrackerImpl(SLStemTrackerImpl *this)
{
  *(void *)this = &unk_26D52C9C8;
  uint64_t v2 = (SLStemTrackerImpl *)((char *)this + 8);
  *((void *)this + 1) = &unk_26D52CA30;
  uint64_t v3 = (SLStemTrackerImpl *)((char *)this + 88);
  SLEncyclopedia::Remove((uint64_t)this + 88, (SLStemTrackerImpl *)((char *)this + 8));
  uint64_t v4 = *((void *)this + 27);
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 56))(v4);
  }
  SLEncyclopedia::~SLEncyclopedia(v3);
  std::__list_imp<SLToken *>::clear((void *)this + 8);
  unint64_t v5 = (void *)*((void *)this + 5);
  if (v5)
  {
    *((void *)this + 6) = v5;
    operator delete(v5);
  }
  SLDictionary::~SLDictionary(v2);
  SLLexer::~SLLexer(this);
}

{
  uint64_t vars8;

  SLStemTrackerImpl::~SLStemTrackerImpl(this);
  JUMPOUT(0x223CA4030);
}

void non-virtual thunk to'SLStemTrackerImpl::~SLStemTrackerImpl(SLStemTrackerImpl *this)
{
}

{
  uint64_t vars8;

  SLStemTrackerImpl::~SLStemTrackerImpl((SLStemTrackerImpl *)((char *)this - 8));
  JUMPOUT(0x223CA4030);
}

uint64_t SLStemTrackerImpl::SeenRecently(SLStemTrackerImpl *this, const char *a2, size_t a3, int a4)
{
  SLWordBuilder::SLWordBuilder((SLWordBuilder *)v10);
  if (*((unsigned char *)this + 224)) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "Word %.*s ", a3, a2);
  }
  if (SLEncyclopedia::Lookup((SLStemTrackerImpl *)((char *)this + 88), a2, a3, (SLWordBuilder *)v10, (SLStemTrackerImpl *)((char *)this + 88)))SLStemTrackerImpl::Seen(this, (const char *)this + 152, *((void *)this + 18), a4); {
  else
  }
    SLStemTrackerImpl::Seen(this, a2, a3, a4);
  uint64_t v8 = *((unsigned __int8 *)this + 32);
  SLWordBuilder::~SLWordBuilder((SLWordBuilder *)v10);
  return v8;
}

void sub_222A6D468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  SLWordBuilder::~SLWordBuilder((SLWordBuilder *)va);
  _Unwind_Resume(a1);
}

uint64_t SLStemTrackerImpl::Seen(SLStemTrackerImpl *this, const char *__src, size_t __n, int a4)
{
  uint64_t v8 = (FILE **)MEMORY[0x263EF8348];
  if (*((unsigned char *)this + 224))
  {
    int v9 = "";
    if (a4) {
      int v9 = "[AllCaps] ";
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "-> Stem %.*s %s", __n, __src, v9);
  }
  uint64_t v10 = (SLStemTrackerImpl **)((char *)this + 64);
  uint64_t v11 = (SLStemTrackerImpl *)*((void *)this + 9);
  unint64_t v12 = (SLStemTrackerImpl *)((char *)this + 64);
  if (v11 != (SLStemTrackerImpl *)((char *)this + 64))
  {
    uint64_t v13 = 1;
    unint64_t v12 = (SLStemTrackerImpl *)*((void *)this + 9);
    while (1)
    {
      unint64_t v14 = (unsigned __int8 *)*((void *)v12 + 2);
      uint64_t v15 = *((void *)v14 + 1);
      if (!v15) {
        break;
      }
      if (v15 == __n && *v14 == a4)
      {
        uint64_t result = memcmp(__src, v14 + 16, __n);
        if (!result)
        {
          *((unsigned char *)this + 32) = 1;
          if (*((unsigned char *)this + 224))
          {
            uint64_t result = fprintf(*v8, "was last seen %lu stems ago\n", v13);
            uint64_t v11 = (SLStemTrackerImpl *)*((void *)this + 9);
          }
          if (v12 != v11) {
            goto LABEL_21;
          }
          return result;
        }
      }
      ++v13;
      unint64_t v12 = (SLStemTrackerImpl *)*((void *)v12 + 1);
      if (v12 == (SLStemTrackerImpl *)v10)
      {
        unint64_t v12 = (SLStemTrackerImpl *)((char *)this + 64);
        break;
      }
    }
  }
  if (*((unsigned char *)this + 224)) {
    fwrite("is new\n", 7uLL, 1uLL, *v8);
  }
  if (v12 == (SLStemTrackerImpl *)v10) {
    unint64_t v12 = *v10;
  }
  *((unsigned char *)this + 32) = 0;
  uint64_t v18 = *((void *)v12 + 2);
  *(unsigned char *)uint64_t v18 = a4;
  *(void *)(v18 + 8) = __n;
  memcpy((void *)(v18 + 16), __src, __n);
LABEL_21:
  uint64_t v19 = *((void *)v12 + 2);
  uint64_t v20 = *(void *)v12;
  *(void *)(v20 + 8) = *((void *)v12 + 1);
  **((void **)v12 + 1) = v20;
  --*((void *)this + 10);
  operator delete(v12);
  uint64_t result = (uint64_t)operator new(0x18uLL);
  uint64_t v21 = (void *)*((void *)this + 9);
  uint64_t v22 = *((void *)this + 10);
  *(void *)uint64_t result = v10;
  *(void *)(result + 8) = v21;
  *(void *)(result + 16) = v19;
  *uint64_t v21 = result;
  *((void *)this + 9) = result;
  *((void *)this + 10) = v22 + 1;
  return result;
}

uint64_t SLStemTrackerImpl::Reset(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 40);
  uint64_t v2 = *(void *)(this + 48) - v1;
  if (v2)
  {
    unint64_t v3 = v2 / 80;
    if (v3 <= 1) {
      unint64_t v3 = 1;
    }
    uint64_t v4 = (void *)(v1 + 8);
    do
    {
      *uint64_t v4 = 0;
      v4 += 10;
      --v3;
    }
    while (v3);
  }
  return this;
}

uint64_t SLStemTrackerImpl::Lookup(SLStemTrackerImpl *this, const char *a2, size_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  uint64_t v8 = (***(uint64_t (****)(void, const char *, size_t, SLWordBuilder *, void))(*((void *)this + 16)
                                                                                            + 24))(*(void *)(*((void *)this + 16) + 24), a2, a3, a4, 0);
  if (v8)
  {
    *((void *)this + 18) = a3;
    memcpy((char *)this + 152, a2, a3);
  }
  return v8;
}

uint64_t non-virtual thunk to'SLStemTrackerImpl::Lookup(SLStemTrackerImpl *this, const char *a2, size_t a3, SLWordBuilder *a4, SLDictionary *a5)
{
  uint64_t v8 = (***(uint64_t (****)(void, const char *, size_t, SLWordBuilder *, void))(*((void *)this + 15)
                                                                                            + 24))(*(void *)(*((void *)this + 15) + 24), a2, a3, a4, 0);
  if (v8)
  {
    *((void *)this + 17) = a3;
    memcpy((char *)this + 144, a2, a3);
  }
  return v8;
}

void *SLStemTrackerImpl::NextToken(SLStemTrackerImpl *this)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)(***((uint64_t (****)(void))this + 27))(*((void *)this + 27));
  unint64_t v3 = v2;
  if (v2)
  {
    if (*(unsigned char *)v2 == 6)
    {
      (*(void (**)(SLStemTrackerImpl *))(*(void *)this + 72))(this);
    }
    else if (!*(unsigned char *)v2)
    {
      CFStringRef Text = SLTokenGetText(v2);
      CStringPtr = CFStringGetCStringPtr(Text, 0x8000100u);
      if (!CStringPtr)
      {
        CStringPtr = buffer;
        if (!CFStringGetCString(Text, buffer, 64, 0x8000100u)) {
          CStringPtr = "";
        }
      }
      size_t v6 = strlen(CStringPtr);
      if (v6)
      {
        if (*((unsigned char *)v3 + 2) == 1)
        {
          (*(void (**)(SLStemTrackerImpl *, const char *, size_t, void))(*(void *)this + 64))(this, CStringPtr, v6, (*((_DWORD *)v3 + 4) >> 4) & 1);
        }
        else if (!*((unsigned char *)v3 + 2) {
               && (*(unsigned int (**)(SLStemTrackerImpl *, const char *, size_t, void))(*(void *)this + 64))(this, CStringPtr, v6, (*((_DWORD *)v3 + 4) >> 4) & 1))
        }
        {
          *((unsigned char *)v3 + 2) = 2;
        }
      }
    }
  }
  return v3;
}

uint64_t SLStemTrackerImpl::LexerBehavior(SLStemTrackerImpl *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 27) + 8))();
}

uint64_t SLStemTrackerImpl::SetLexerBehavior(SLStemTrackerImpl *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 27) + 16))();
}

uint64_t SLStemTrackerImpl::SetDelim(SLStemTrackerImpl *this, const unsigned __int16 *a2)
{
  return (*(uint64_t (**)(void, const unsigned __int16 *))(**((void **)this + 27) + 24))(*((void *)this + 27), a2);
}

uint64_t SLStemTrackerImpl::Delim(SLStemTrackerImpl *this)
{
  return (*(uint64_t (**)(void))(**((void **)this + 27) + 32))();
}

uint64_t SLStemTrackerImpl::SetErrorHandler(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 216) + 40))();
}

void *std::vector<SLStemTrackerImpl::Stem>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<SLStemTrackerImpl::Stem>::__vallocate[abi:ne180100](a1, a2);
    uint64_t v4 = (char *)a1[1];
    size_t v5 = 80 * ((80 * a2 - 80) / 0x50) + 80;
    bzero(v4, v5);
    a1[1] = &v4[v5];
  }
  return a1;
}

void sub_222A6DA6C(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<SLStemTrackerImpl::Stem>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLStemTrackerImpl::Stem>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[80 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SLStemTrackerImpl::Stem>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(80 * a2);
}

void SLCFArrayBuilder::~SLCFArrayBuilder(SLCFArrayBuilder *this)
{
  uint64_t v2 = (CFTypeRef *)*((void *)this + 1);
  if (v2 != *(CFTypeRef **)this)
  {
    unint64_t v3 = 0;
    uint64_t v2 = *(CFTypeRef **)this;
    do
    {
      CFRelease(v2[v3++]);
      uint64_t v2 = *(CFTypeRef **)this;
    }
    while (v3 < (uint64_t)(*((void *)this + 1) - *(void *)this) >> 3);
  }
  if (v2)
  {
    *((void *)this + 1) = v2;
    operator delete(v2);
  }
}

CFArrayRef SLCFArrayBuilder::CreateArray(const void ***this)
{
  return CFArrayCreate(0, *this, this[1] - *this, MEMORY[0x263EFFF70]);
}

void SLCFDictionaryBuilder::push_back(SLCFDictionaryBuilder *this, const void *a2, const void *a3)
{
  unint64_t v8 = *((void *)this + 5);
  size_t v6 = (char *)this + 40;
  unint64_t v7 = v8;
  uint64_t v9 = (void *)*((void *)v6 - 1);
  if ((unint64_t)v9 >= v8)
  {
    uint64_t v11 = (void **)(v6 - 16);
    uint64_t v12 = *((void *)v6 - 2);
    uint64_t v13 = ((uint64_t)v9 - v12) >> 3;
    if ((unint64_t)(v13 + 1) >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v14 = v7 - v12;
    uint64_t v15 = v14 >> 2;
    if (v14 >> 2 <= (unint64_t)(v13 + 1)) {
      uint64_t v15 = v13 + 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16) {
      uint64_t v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)v6, v16);
    }
    else {
      uint64_t v17 = 0;
    }
    uint64_t v18 = &v17[8 * v13];
    uint64_t v19 = &v17[8 * v16];
    *(void *)uint64_t v18 = a2;
    uint64_t v10 = v18 + 8;
    uint64_t v21 = (char *)*((void *)this + 3);
    uint64_t v20 = (char *)*((void *)this + 4);
    if (v20 != v21)
    {
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v18 - 1) = v22;
        v18 -= 8;
      }
      while (v20 != v21);
      uint64_t v20 = (char *)*v11;
    }
    *((void *)this + 3) = v18;
    *((void *)this + 4) = v10;
    *((void *)this + 5) = v19;
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    *uint64_t v9 = a2;
    uint64_t v10 = v9 + 1;
  }
  unint64_t v23 = *((void *)this + 2);
  *((void *)this + 4) = v10;
  int v24 = (void *)*((void *)this + 1);
  if ((unint64_t)v24 >= v23)
  {
    uint64_t v26 = ((uint64_t)v24 - *(void *)this) >> 3;
    if ((unint64_t)(v26 + 1) >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v27 = v23 - *(void *)this;
    uint64_t v28 = v27 >> 2;
    if (v27 >> 2 <= (unint64_t)(v26 + 1)) {
      uint64_t v28 = v26 + 1;
    }
    if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v29 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v29 = v28;
    }
    if (v29) {
      uint64_t v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)this + 16, v29);
    }
    else {
      uint64_t v30 = 0;
    }
    uint64_t v31 = &v30[8 * v26];
    uint64_t v32 = &v30[8 * v29];
    *(void *)uint64_t v31 = a3;
    unint64_t v25 = v31 + 8;
    uint64_t v34 = *(char **)this;
    unint64_t v33 = (char *)*((void *)this + 1);
    if (v33 != *(char **)this)
    {
      do
      {
        uint64_t v35 = *((void *)v33 - 1);
        v33 -= 8;
        *((void *)v31 - 1) = v35;
        v31 -= 8;
      }
      while (v33 != v34);
      unint64_t v33 = *(char **)this;
    }
    *(void *)this = v31;
    *((void *)this + 1) = v25;
    *((void *)this + 2) = v32;
    if (v33) {
      operator delete(v33);
    }
  }
  else
  {
    void *v24 = a3;
    unint64_t v25 = v24 + 1;
  }
  *((void *)this + 1) = v25;
}

CFDictionaryRef SLCFDictionaryBuilder::CreateDictionary(const void ***this)
{
  return CFDictionaryCreate(0, this[3], *this, this[1] - *this, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
}

void SLDissecter::SLDissecter(SLDissecter *this, SLPronouncer *a2)
{
  *(_WORD *)this = **(char **)(*(uint64_t (**)(SLPronouncer *, uint64_t))(*(void *)a2 + 216))(a2, 207);
  *((_WORD *)this + 1) = **(char **)(*(uint64_t (**)(SLPronouncer *, uint64_t))(*(void *)a2 + 216))(a2, 208);
  *((unsigned char *)this + 4) = (*(uint64_t (**)(SLPronouncer *))(*(void *)a2 + 200))(a2);
}

void SLDissecter::Create(SLDissecter *this, SLPronouncer *a2)
{
}

void sub_222A6DE7C(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0x1000C405D080610);
  _Unwind_Resume(a1);
}

uint64_t SLDissecter::DissectNumber(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_OWORD *)(a5 + 32) = 0u;
  *(_OWORD *)(a5 + 48) = 0u;
  uint64_t v5 = a3 + a4;
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  *(void *)(a5 + 8) = a3;
  if (a4 >= 1)
  {
    uint64_t v6 = 0;
    int v7 = 0;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)(a2 + 56);
    int v10 = *(unsigned __int16 *)result;
    uint64_t v11 = a3;
    while (1)
    {
      unint64_t v12 = *(unsigned __int16 *)(v9 + 2 * v11);
      if (v12 == v10)
      {
        *(unsigned char *)a5 = 1;
      }
      else
      {
        if ((v12 & 0xFFFFFFDF) == 0x45 || v12 == *(unsigned __int16 *)(result + 2)) {
          goto LABEL_20;
        }
        if (SLChar::sCharClass[v12 & 0x3F | (SLChar::sUniMap[v12 >> 6] << 6)] == 2)
        {
          if (v8)
          {
            if (v8 > 0xF423F) {
              goto LABEL_17;
            }
LABEL_16:
            uint64_t v6 = v12 + 10 * v8 - 48;
            *(void *)(a5 + 56) = v6;
            unint64_t v8 = v6;
            goto LABEL_17;
          }
          if (v12 != 48 || v7 == 255) {
            goto LABEL_16;
          }
          unint64_t v8 = 0;
          *(unsigned char *)(a5 + 4) = ++v7;
        }
      }
LABEL_17:
      if (++v11 >= v5) {
        goto LABEL_20;
      }
    }
  }
  uint64_t v6 = 0;
  LODWORD(v12) = 0;
  uint64_t v11 = a3;
LABEL_20:
  *(void *)(a5 + 16) = v11 - a3;
  if (v12 == *(unsigned __int16 *)(result + 2))
  {
    uint64_t v14 = v11 + 1;
    *(void *)(a5 + 24) = v11 + 1;
    if (v11 + 1 >= v5)
    {
      unint64_t v15 = 0;
      ++v11;
    }
    else
    {
      unint64_t v15 = 0;
      uint64_t v16 = *(void *)(a2 + 56);
      ++v11;
      while (1)
      {
        uint64_t v17 = *(unsigned __int16 *)(v16 + 2 * v11);
        uint64_t result = v17 & 0xFFFFFFDF;
        if (result == 69) {
          break;
        }
        if (v17 != 48) {
          *(unsigned char *)(a5 + 3) = 1;
        }
        uint64_t result = v17 + 10 * v15 - 48;
        if (v15 < 0x989680) {
          unint64_t v15 = v17 + 10 * v15 - 48;
        }
        if (v5 == ++v11)
        {
          uint64_t v11 = a3 + a4;
          break;
        }
      }
      LODWORD(v12) = v17;
    }
    *(void *)(a5 + 32) = v11 - v14;
    *(unsigned char *)(a5 + 1) = v15 == 1;
  }
  else
  {
    unint64_t v15 = 0;
  }
  if ((v12 & 0xFFFFFFDF) == 0x45)
  {
    uint64_t v18 = v11 + 1;
    uint64_t v19 = v5 - v18;
    *(void *)(a5 + 40) = v18;
    *(void *)(a5 + 48) = v19;
  }
  else
  {
    uint64_t v19 = 0;
  }
  BOOL v20 = v19 == 0;
  if (v15) {
    BOOL v20 = 0;
  }
  BOOL v21 = v6 == 1 && v20;
  *(unsigned char *)(a5 + 2) = v21;
  return result;
}

void SLDissecter::DissectUnit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 64) - v4;
  unint64_t v6 = (v5 & 0xFFFFFFFFFFFFFFFELL) + v4 - 4;
  do
  {
    int v7 = (unsigned __int16)SLChar::sCharClass[*(_WORD *)(v6 + 2 * v3) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v6 + 2 * v3) >> 6] << 6)];
    --v3;
    if (v7) {
      BOOL v8 = (v7 & 0x1F) == 1;
    }
    else {
      BOOL v8 = 1;
    }
  }
  while (v8);
  uint64_t v9 = (v5 >> 1) + v3;
  *(void *)(a3 + 24) = v9;
  *(void *)(a3 + 32) = ~v3;
  uint64_t v10 = v9 - 1;
  *(unsigned char *)a3 = v7 == 6;
  if (v7 != 6) {
    uint64_t v10 = v9;
  }
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = v10;
}

void SLDissecter::DissectRoman(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(a2 + 56);
  uint64_t v5 = *(void *)(a2 + 64) - v4;
  unint64_t v6 = (v5 & 0xFFFFFFFFFFFFFFFELL) + v4 - 4;
  do
  {
    int v7 = SLChar::sCharClass[*(_WORD *)(v6 + 2 * v3) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v6 + 2 * v3) >> 6] << 6)] & 0x9F;
    --v3;
  }
  while (v7 == 129);
  uint64_t v8 = (v5 >> 1) + v3;
  a3[3] = v8;
  a3[4] = ~v3;
  a3[1] = 0;
  a3[2] = v8;
}

uint64_t SLDissecter::EvaluateRoman(SLDissecter *this, SLToken *a2, CFRange a3)
{
  if (a3.length < 1)
  {
    return 0;
  }
  else
  {
    unsigned __int16 v3 = 0;
    CFIndex v4 = a3.location + a3.length;
    unsigned __int16 v5 = 10000;
    do
    {
      unsigned int v6 = 0;
      unint64_t v7 = *(unsigned __int16 *)(*((void *)a2 + 7) + 2 * a3.location);
      int v8 = (unsigned __int16)(SLChar::sToUpper[v7 & 0x3F | (SLChar::sUniMap[v7 >> 6] << 6)] + v7);
      switch(v8)
      {
        case 'C':
          unsigned int v6 = 100;
          break;
        case 'D':
          unsigned int v6 = 500;
          break;
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'J':
        case 'K':
          break;
        case 'I':
          unsigned int v6 = 1;
          break;
        case 'L':
          unsigned int v6 = 50;
          break;
        case 'M':
          unsigned int v6 = 1000;
          break;
        default:
          if (v8 == 86)
          {
            unsigned int v6 = 5;
          }
          else if (v8 == 88)
          {
            unsigned int v6 = 10;
          }
          break;
      }
      if (v6 > v5) {
        __int16 v9 = -2 * v5;
      }
      else {
        __int16 v9 = 0;
      }
      v3 += v6 + v9;
      ++a3.location;
      unsigned __int16 v5 = v6;
    }
    while (a3.location < v4);
  }
  return v3;
}

uint64_t SLDissecter::DissectTime(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 80) = 0;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  unsigned __int16 v3 = *(unsigned __int16 **)(a2 + 56);
  unint64_t v4 = *v3;
  if (SLChar::sCharClass[v4 & 0x3F | (SLChar::sUniMap[v4 >> 6] << 6)] == 2)
  {
    uint64_t v5 = 0;
    int v6 = 0;
    unint64_t v7 = *(unsigned __int16 **)(a2 + 56);
    do
    {
      int v9 = v7[1];
      ++v7;
      int v8 = v9;
      int v6 = v4 + 10 * v6 - 48;
      *(unsigned char *)a3 = v6;
      *(void *)(a3 + 16) = ++v5;
      LODWORD(v4) = v9;
    }
    while (SLChar::sCharClass[v9 & 0x3F | (SLChar::sUniMap[(unsigned __int16)v9 >> 6] << 6)] == 2);
    LODWORD(v4) = v8;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = *(unsigned __int16 **)(a2 + 56);
  }
  if (v4 == 58 || v4 == 46)
  {
    LODWORD(v4) = v7[3];
    *(void *)(a3 + 24) = v5 + 1;
    *(void *)(a3 + 32) = 2;
    unint64_t v10 = v7[2];
    int v11 = (unsigned __int16)SLChar::sCharClass[v10 & 0x3F | (SLChar::sUniMap[v10 >> 6] << 6)];
    char v12 = *((unsigned char *)v7 + 2);
    char v13 = v10 + 10 * v12 - 16;
    char v14 = v12 - 48;
    if (v11 != 2) {
      char v13 = v14;
    }
    *(unsigned char *)(a3 + 1) = v13;
    if (v4 == 58)
    {
      *(void *)(a3 + 40) = v5 + 4;
      *(void *)(a3 + 48) = 2;
      int v15 = v7[6];
      v7 += 6;
      LODWORD(v4) = v15;
      unint64_t v16 = *(v7 - 1);
      int v17 = (unsigned __int16)SLChar::sCharClass[v16 & 0x3F | (SLChar::sUniMap[v16 >> 6] << 6)];
      char v18 = *((unsigned char *)v7 - 4);
      char v19 = v16 + 10 * v18 - 16;
      if (v17 != 2) {
        char v19 = v18 - 48;
      }
      *(unsigned char *)(a3 + 2) = v19;
    }
    else
    {
      v7 += 3;
    }
  }
  if (v4 == *(unsigned __int16 *)(result + 2))
  {
    *(void *)(a3 + 56) = v7 - v3 + 1;
    unint64_t v4 = v7[1];
    if (SLChar::sCharClass[v4 & 0x3F | (SLChar::sUniMap[v4 >> 6] << 6)] == 2)
    {
      BOOL v20 = v7 + 2;
      uint64_t v21 = 1;
      do
      {
        *(void *)(a3 + 64) = v21;
        unsigned int v22 = *v20++;
        LODWORD(v4) = v22;
        ++v21;
      }
      while (SLChar::sCharClass[v22 & 0x3F | (SLChar::sUniMap[(unint64_t)v22 >> 6] << 6)] == 2);
      unint64_t v7 = v20 - 1;
    }
    else
    {
      ++v7;
    }
  }
  char v23 = 65;
  if ((int)v4 > 96)
  {
    if (v4 != 97)
    {
      if (v4 != 112) {
        goto LABEL_24;
      }
LABEL_27:
      char v23 = 80;
    }
  }
  else if (v4 != 65)
  {
    if (v4 != 80)
    {
LABEL_24:
      *(unsigned char *)(a3 + 3) = 32;
      return result;
    }
    goto LABEL_27;
  }
  *(unsigned char *)(a3 + 3) = v23;
  *(void *)(a3 + 72) = v7 - v3;
  *(void *)(a3 + 80) = 2;
  return result;
}

uint64_t SLDissecter::DissectDate(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(a2 + 56);
  uint64_t v5 = (unsigned __int16 *)(v4 + 2);
  do
  {
    uint64_t v6 = v3;
    unint64_t v7 = v5;
    int v8 = (unsigned __int16)SLChar::sCharClass[*(_WORD *)(v4 + 2 * v3) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v4 + 2 * v3) >> 6] << 6)];
    ++v3;
    ++v5;
  }
  while (v8 == 2);
  uint64_t v9 = -1;
  do
  {
    unsigned int v10 = *v7++;
    ++v9;
  }
  while (SLChar::sCharClass[v10 & 0x3F | (SLChar::sUniMap[(unint64_t)v10 >> 6] << 6)] == 2);
  uint64_t v11 = v3 + v9 + 1;
  uint64_t v12 = -1;
  uint64_t v13 = v11;
  do
  {
    unsigned int v14 = *v7++;
    ++v12;
  }
  while (SLChar::sCharClass[v14 & 0x3F | (SLChar::sUniMap[(unint64_t)v14 >> 6] << 6)] == 2);
  if ((*(unsigned char *)(a2 + 17) & 4) != 0)
  {
    if (*(unsigned char *)(result + 4))
    {
      uint64_t v13 = v3;
      uint64_t v16 = v9;
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v13 = 0;
      uint64_t v16 = v6;
      uint64_t v6 = v9;
    }
    *(void *)(a3 + 40) = v13;
    *(void *)(a3 + 48) = v16;
    *(void *)(a3 + 24) = v3;
    *(void *)(a3 + 32) = v6;
    int v15 = (uint64_t *)(a3 + 16);
    uint64_t v6 = v12;
    *(void *)(a3 + 8) = v11;
  }
  else
  {
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = v6;
    *(void *)(a3 + 24) = v3;
    *(void *)(a3 + 32) = v9;
    int v15 = (uint64_t *)(a3 + 48);
    *(void *)(a3 + 40) = v11;
    uint64_t v11 = 0;
  }
  *int v15 = v12;
  int v17 = (char *)(v4 + 2 * v11);
  if (v6 == 4)
  {
    LOWORD(v18) = 1000 * (*v17 - 48)
                + 100 * (v17[2] - 48)
                + 10 * (v17[4] - 48)
                + (v17[6] - 48);
    BOOL v19 = (unsigned __int16)(v18 - 1000) < 0x7D0u;
  }
  else
  {
    unint64_t v18 = *((unsigned __int16 *)v17 + 1);
    int v20 = (unsigned __int16)SLChar::sCharClass[v18 & 0x3F | (SLChar::sUniMap[v18 >> 6] << 6)];
    char v21 = *v17;
    LOBYTE(v18) = v18 + 10 * v21 - 16;
    char v22 = v21 - 48;
    if (v20 != 2) {
      LOBYTE(v18) = v22;
    }
    LOWORD(v18) = v18;
    BOOL v19 = 1;
  }
  *(_WORD *)(a3 + 2) = v18;
  *(unsigned char *)a3 = v19;
  char v23 = (_WORD *)(v4 + 2 * v3);
  unint64_t v24 = (unsigned __int16)v23[1];
  int v25 = (unsigned __int16)SLChar::sCharClass[v24 & 0x3F | (SLChar::sUniMap[v24 >> 6] << 6)];
  LOWORD(v23) = *v23;
  char v26 = v24 + 10 * (_BYTE)v23 - 16;
  char v27 = (_BYTE)v23 - 48;
  if (v25 == 2) {
    char v27 = v26;
  }
  *(unsigned char *)(a3 + 4) = v27;
  uint64_t v28 = (_WORD *)(v4 + 2 * v13);
  unint64_t v29 = (unsigned __int16)v28[1];
  LOWORD(v28) = *v28;
  char v30 = v29 + 10 * (_BYTE)v28 - 16;
  char v31 = (_BYTE)v28 - 48;
  if (SLChar::sCharClass[v29 & 0x3F | (SLChar::sUniMap[v29 >> 6] << 6)] == 2) {
    char v32 = v30;
  }
  else {
    char v32 = v31;
  }
  *(unsigned char *)(a3 + 5) = v32;
  return result;
}

uint64_t SLDissecter::DissectGeoLoc(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 112) = 0;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  *(_OWORD *)a3 = 0u;
  uint64_t v3 = *(unsigned __int16 **)(a2 + 56);
  unsigned int v4 = *v3;
  int v5 = *(_DWORD *)(a2 + 16);
  uint64_t v6 = 0;
  if ((v5 & 0x400) != 0)
  {
LABEL_20:
    if ((v5 & 0x600) == 0x400)
    {
LABEL_21:
      uint64_t v12 = 0;
      *(void *)(a3 + 72) = v6;
      while (SLChar::sCharClass[v4 & 0x3F | (SLChar::sUniMap[(unint64_t)v4 >> 6] << 6)] == 2
           || v4 == *(unsigned __int16 *)(result + 2))
      {
        if (v12) {
          BOOL v13 = 0;
        }
        else {
          BOOL v13 = v4 == 49;
        }
        char v14 = v13;
        *(unsigned char *)(a3 + 2) = v14;
        unsigned int v4 = v3[v6 + 1 + v12++];
      }
      *(void *)(a3 + 80) = v12;
      uint64_t v15 = v6 + v12;
      if (v4)
      {
        uint64_t v16 = 0;
        uint64_t v17 = 0;
        do
        {
          int v18 = (unsigned __int16)SLChar::sCharClass[v4 & 0x3F | (SLChar::sUniMap[(unint64_t)v4 >> 6] << 6)];
          if (v18 != 5)
          {
            if (v18 == 2) {
              goto LABEL_40;
            }
            if (!v17)
            {
              *(void *)(a3 + 88) = v15;
              uint64_t v17 = v15;
            }
            *(void *)(a3 + 96) = ++v16;
          }
          uint64_t v19 = v15 + 1;
          unsigned int v4 = v3[++v15];
        }
        while (v4);
        uint64_t v15 = v19;
      }
LABEL_40:
      if (SLChar::sCharClass[v4 & 0x3F | (SLChar::sUniMap[(unint64_t)v4 >> 6] << 6)] == 2)
      {
        uint64_t v20 = 0;
        char v21 = &v3[v15];
        uint64_t v22 = 1;
        do
        {
          if (!v20)
          {
            uint64_t v20 = v15 + v22 - 1;
            *(void *)(a3 + 104) = v20;
          }
          *(void *)(a3 + 112) = v22;
          int v23 = (unsigned __int16)SLChar::sCharClass[v21[v22] & 0x3F | (SLChar::sUniMap[(unint64_t)v21[v22] >> 6] << 6)];
          ++v22;
        }
        while (v23 == 2);
      }
    }
    else
    {
      uint64_t v24 = 0;
      *(void *)(a3 + 40) = v6;
      while (SLChar::sCharClass[v4 & 0x3F | (SLChar::sUniMap[(unint64_t)v4 >> 6] << 6)] == 2
           || v4 == *(unsigned __int16 *)(result + 2))
      {
        if (v24) {
          BOOL v25 = 0;
        }
        else {
          BOOL v25 = v4 == 49;
        }
        char v26 = v25;
        *(unsigned char *)(a3 + 1) = v26;
        unsigned int v4 = v3[v6 + 1 + v24++];
      }
      *(void *)(a3 + 48) = v24;
      if (v4)
      {
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        v6 += v24;
        do
        {
          int v29 = (unsigned __int16)SLChar::sCharClass[v4 & 0x3F | (SLChar::sUniMap[(unint64_t)v4 >> 6] << 6)];
          if (v29 != 5)
          {
            if (v29 == 2) {
              goto LABEL_21;
            }
            if (!v28)
            {
              *(void *)(a3 + 56) = v6;
              uint64_t v28 = v6;
            }
            *(void *)(a3 + 64) = ++v27;
          }
          unsigned int v4 = v3[++v6];
        }
        while (v4);
      }
    }
  }
  else
  {
    while (SLChar::sCharClass[v4 & 0x3F | (SLChar::sUniMap[(unint64_t)v4 >> 6] << 6)] == 2
         || v4 == *(unsigned __int16 *)(result + 2))
    {
      if (v6) {
        BOOL v7 = 0;
      }
      else {
        BOOL v7 = v4 == 49;
      }
      char v8 = v7;
      *(unsigned char *)a3 = v8;
      unsigned int v4 = v3[++v6];
    }
    *(void *)(a3 + 16) = v6;
    if (v4)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      do
      {
        int v11 = (unsigned __int16)SLChar::sCharClass[v4 & 0x3F | (SLChar::sUniMap[(unint64_t)v4 >> 6] << 6)];
        if (v11 != 5)
        {
          if (v11 == 2) {
            goto LABEL_20;
          }
          if (!v10)
          {
            *(void *)(a3 + 24) = v6;
            uint64_t v10 = v6;
          }
          *(void *)(a3 + 32) = ++v9;
        }
        unsigned int v4 = v3[++v6];
      }
      while (v4);
    }
  }
  return result;
}

void SLDissecter::DissectDottedNumber(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = 0;
  *(unsigned char *)a3 = 0;
  uint64_t v26 = a3 + 24;
  uint64_t v27 = a2;
  uint64_t v28 = (void **)(a3 + 8);
  uint64_t v5 = *(void *)(a2 + 56);
  do
  {
    uint64_t v6 = v4 + 1;
    unint64_t v7 = *(unsigned __int16 *)(v5 + 2 * (v4 + 1));
    if (SLChar::sCharClass[v7 & 0x3F | (SLChar::sUniMap[v7 >> 6] << 6)] == 2)
    {
      unsigned int v8 = 0;
      uint64_t v9 = v5 + 4;
      uint64_t v10 = v4;
      do
      {
        unsigned int v8 = v7 + 10 * v8 - 48;
        unint64_t v7 = *(unsigned __int16 *)(v9 + 2 * v10++);
      }
      while (SLChar::sCharClass[v7 & 0x3F | (SLChar::sUniMap[v7 >> 6] << 6)] == 2);
      uint64_t v6 = v10 + 1;
    }
    else
    {
      unsigned int v8 = 0;
      uint64_t v10 = v4;
    }
    uint64_t v11 = v6 - v4;
    BOOL v13 = *(char **)(a3 + 16);
    unint64_t v12 = *(void *)(a3 + 24);
    if ((unint64_t)v13 >= v12)
    {
      uint64_t v15 = (char *)*v28;
      uint64_t v16 = (v13 - (unsigned char *)*v28) >> 4;
      unint64_t v17 = v16 + 1;
      if ((unint64_t)(v16 + 1) >> 60) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v18 = v12 - (void)v15;
      if (v18 >> 3 > v17) {
        unint64_t v17 = v18 >> 3;
      }
      if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v19 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v19 = v17;
      }
      if (v19)
      {
        uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CFRange>>(v26, v19);
        uint64_t v15 = *(char **)(a3 + 8);
        BOOL v13 = *(char **)(a3 + 16);
      }
      else
      {
        uint64_t v20 = 0;
      }
      char v21 = &v20[16 * v16];
      *(void *)char v21 = v4;
      *((void *)v21 + 1) = v11;
      uint64_t v22 = v21;
      if (v13 != v15)
      {
        do
        {
          *((_OWORD *)v22 - 1) = *((_OWORD *)v13 - 1);
          v22 -= 16;
          v13 -= 16;
        }
        while (v13 != v15);
        uint64_t v15 = (char *)*v28;
      }
      char v14 = v21 + 16;
      *(void *)(a3 + 8) = v22;
      *(void *)(a3 + 16) = v21 + 16;
      *(void *)(a3 + 24) = &v20[16 * v19];
      if (v15) {
        operator delete(v15);
      }
      a2 = v27;
    }
    else
    {
      *(void *)BOOL v13 = v4;
      *((void *)v13 + 1) = v11;
      char v14 = v13 + 16;
    }
    *(void *)(a3 + 16) = v14;
    if (*(unsigned char *)a3) {
      BOOL v23 = 0;
    }
    else {
      BOOL v23 = v11 <= 3;
    }
    char v25 = !v23 || v8 > 0xFF;
    *(unsigned char *)a3 = v25;
    uint64_t v4 = v10 + 2;
    uint64_t v5 = *(void *)(a2 + 56);
  }
  while (*(_WORD *)(v5 + 2 * v6));
}

uint64_t SLDissecter::DissectNumericBullet(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *(void *)(a2 + 56);
  do
  {
    int v5 = (unsigned __int16)SLChar::sCharClass[*(_WORD *)(v4 + 2 * v3) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v4 + 2 * v3) >> 6] << 6)];
    ++v3;
  }
  while (v5 == 5);
  uint64_t v6 = v3 - 1;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = v3 - 1;
  if (v5 == 2)
  {
    *(void *)(a3 + 24) = 0;
    *(void *)(a3 + 32) = 0;
  }
  else
  {
    *(void *)(a3 + 24) = v6;
    *(void *)(a3 + 32) = 1;
    do
    {
      int v7 = (unsigned __int16)SLChar::sCharClass[*(_WORD *)(v4 + 2 * v3) & 0x3F | (SLChar::sUniMap[(unint64_t)*(unsigned __int16 *)(v4 + 2 * v3) >> 6] << 6)];
      ++v3;
    }
    while (v7 == 5);
    uint64_t v6 = v3 - 1;
  }
  *(void *)(a3 + 40) = v6;
  *(unsigned char *)a3 = 0;
  for (uint64_t i = v6; ; ++i)
  {
    unint64_t v9 = *(unsigned __int16 *)(v4 + 2 * i);
    if (SLChar::sCharClass[v9 & 0x3F | (SLChar::sUniMap[v9 >> 6] << 6)] == 2) {
      continue;
    }
    if (v9 != *(unsigned __int16 *)(result + 2)) {
      break;
    }
    unint64_t v10 = *(unsigned __int16 *)(v4 + 2 * (i + 1));
    if (SLChar::sCharClass[v10 & 0x3F | (SLChar::sUniMap[v10 >> 6] << 6)] != 2) {
      break;
    }
    *(unsigned char *)a3 = 1;
    ++i;
  }
  *(void *)(a3 + 48) = i - v6;
  uint64_t v11 = (unsigned __int16 *)(v4 + 2 * i);
  uint64_t v12 = i - 1;
  do
  {
    unsigned int v14 = *v11++;
    unsigned int v13 = v14;
    ++v12;
  }
  while (SLChar::sCharClass[v14 & 0x3F | (SLChar::sUniMap[(unint64_t)v14 >> 6] << 6)] == 5);
  uint64_t v15 = (void *)(a3 + 56);
  if (v13)
  {
    uint64_t v16 = 0;
    *uint64_t v15 = v12;
    do
    {
      int v17 = *v11++;
      ++v16;
    }
    while (v17);
    *(void *)(a3 + 64) = v16;
  }
  else
  {
    *uint64_t v15 = 0;
    *(void *)(a3 + 64) = 0;
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<CFRange>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

void SLAgglomerate::Create(SLAgglomerate *this, const __CFLocale *a2, SLDictionary *a3)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(this, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFEqual(Value, @"en"))
  {
    SLCreateAgglomerateEng(a2);
  }
  SLAgglomerate::Create();
}

void SLAgglomerate::SLAgglomerate(SLAgglomerate *this, SLDictionary *a2)
{
  *(void *)this = &unk_26D52CB08;
  *((void *)this + 1) = a2;
}

{
  *(void *)this = &unk_26D52CB08;
  *((void *)this + 1) = a2;
}

void SLAgglomerate::~SLAgglomerate(SLAgglomerate *this)
{
}

uint64_t SLAgglomerate::Lookup(SLAgglomerate *this, const char *a2, unint64_t a3, unint64_t a4, BOOL a5, SLTokenList *a6)
{
  if (a4 < 2) {
    return 0;
  }
  unint64_t v12 = 3;
  do
  {
    uint64_t result = SLAgglomerate::LookupWords(this, a2, a3, v12 - 1, a5, a6);
    if (result) {
      break;
    }
  }
  while (v12++ <= a4);
  return result;
}

uint64_t SLAgglomerate::LookupWords(SLAgglomerate *this, const char *a2, unint64_t a3, uint64_t a4, BOOL a5, SLTokenList *a6)
{
  if (a3 >= 4 && 32 * a4 >= a3) {
    operator new();
  }
  return 0;
}

void sub_222A6F26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  (*(void (**)(uint64_t))(*(void *)v8 + 16))(v8);
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)va);
  SLTokenBuilder::~SLTokenBuilder((SLTokenBuilder *)va1);
  _Unwind_Resume(a1);
}

uint64_t SLAgglomerate::VetWord(SLAgglomerate *this, SLToken *a2)
{
  return 1;
}

uint64_t SLAgglomerate::VetLastWord(SLAgglomerate *this, SLToken *a2)
{
  return 1;
}

void SLCreateAgglomerateEng(SLDictionary *a1)
{
}

void sub_222A6F39C(_Unwind_Exception *a1)
{
  MEMORY[0x223CA4030](v1, 0xA1C40BD48D6D6);
  _Unwind_Resume(a1);
}

BOOL SLAgglomerateEng::VetWord(SLAgglomerateEng *this, SLToken *a2)
{
  uint64_t v2 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) == v2) {
    return 1;
  }
  unint64_t v4 = 0;
  do
  {
    BOOL v5 = SLWordTagSet::find((SLWordTagSet *)(*(void *)(v2 + 8 * v4) + 4), 68);
    if (v5) {
      break;
    }
    ++v4;
    uint64_t v2 = *((void *)a2 + 10);
  }
  while (v4 < (*((void *)a2 + 11) - v2) >> 3);
  return !v5;
}

uint64_t SLAgglomerateEng::VetLastWord(SLAgglomerateEng *this, SLToken *a2)
{
  if ((unint64_t)(((uint64_t)(*((void *)a2 + 8) - *((void *)a2 + 7)) >> 1) - 1) < 3) {
    return 0;
  }
  uint64_t v4 = *((void *)a2 + 10);
  if (*((void *)a2 + 11) == v4)
  {
    BOOL v11 = 0;
    int v10 = 1;
  }
  else
  {
    unint64_t v5 = 0;
    int v6 = 0;
    while (1)
    {
      int v7 = *(int **)(v4 + 8 * v5);
      int v9 = *v7;
      uint64_t v8 = (SLWordTagSet *)(v7 + 1);
      v6 |= v9;
      if (SLWordTagSet::find(v8, 64) && SLWordTagSet::find(v8, 66)) {
        break;
      }
      if (SLWordTagSet::find(v8, 68)) {
        break;
      }
      ++v5;
      uint64_t v4 = *((void *)a2 + 10);
      if (v5 >= (*((void *)a2 + 11) - v4) >> 3)
      {
        int v10 = 1;
        goto LABEL_12;
      }
    }
    int v10 = 0;
LABEL_12:
    BOOL v11 = (v6 & 0x953FF) != 0;
  }
  return v10 & v11;
}

void SLAgglomerateEng::~SLAgglomerateEng(SLAgglomerateEng *this)
{
  SLAgglomerate::~SLAgglomerate(this);
  JUMPOUT(0x223CA4030);
}

void SLPhonTranslator::Create()
{
}

float SLPhonTranslatorImpl::Match(SLPhonTranslatorImpl *this, uint64_t a2, const void *a3, uint64_t a4, const void *a5, unint64_t *a6, unint64_t *a7)
{
  memset(__p, 0, 24);
  memset(v38, 0, 24);
  uint64_t v14 = std::__allocate_at_least[abi:ne180100]<std::allocator<SLPhonTranslatorImpl::Hypothesis>>((uint64_t)&__p[2], 1uLL);
  uint64_t v16 = &v14[6 * v15];
  void *v14 = a2;
  v14[1] = a3;
  v14[2] = a4;
  v14[3] = a5;
  v14[4] = 1065353216;
  v14[5] = 0;
  uint64_t v17 = v14 + 6;
  uint64_t v18 = (char *)__p[1];
  if (__p[1])
  {
    uint64_t v19 = v14;
    do
    {
      long long v20 = *((_OWORD *)v18 - 3);
      long long v21 = *((_OWORD *)v18 - 1);
      uint64_t v14 = v19 - 6;
      *((_OWORD *)v19 - 2) = *((_OWORD *)v18 - 2);
      *((_OWORD *)v19 - 1) = v21;
      *((_OWORD *)v19 - 3) = v20;
      v18 -= 48;
      v19 -= 6;
    }
    while (v18);
  }
  __p[0] = v14;
  __p[2] = v16;
  __p[1] = v17;
  while (1)
  {
    int matched = SLPhonTranslatorImpl::MatchIteration(this, (uint64_t *)__p, (uint64_t)v38);
    BOOL v23 = v38[0];
    if (!matched) {
      break;
    }
    uint64_t v24 = __p[2];
    long long v25 = *(_OWORD *)&v38[1];
    long long v26 = *(_OWORD *)__p;
    __p[0] = v38[0];
    *(_OWORD *)size_t v38 = v26;
    *(_OWORD *)&__p[1] = v25;
    v38[2] = v24;
  }
  uint64_t v27 = v38[1];
  if (v38[1] == v38[0])
  {
    int v29 = __p[0];
    char v30 = __p[1];
    *a6 = a2 - *(void *)__p[0];
    unint64_t v31 = a4 - v29[2];
    *a7 = v31;
    unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((v30 - (unsigned char *)v29) >> 4);
    if (v32 >= 2)
    {
      unint64_t v33 = v32 - 1;
      uint64_t v34 = v29 + 8;
      do
      {
        unint64_t v35 = a2 - *(v34 - 2);
        unint64_t v36 = a4 - *v34;
        if (v36 > v31 || v36 == v31 && v35 > *a6)
        {
          *a6 = v35;
          *a7 = v36;
          unint64_t v31 = v36;
        }
        v34 += 6;
        --v33;
      }
      while (v33);
    }
    float v28 = 0.0;
    if (!v27) {
      goto LABEL_18;
    }
  }
  else
  {
    float v28 = *((float *)v38[0] + 8);
  }
  v38[1] = v23;
  operator delete(v23);
  int v29 = __p[0];
  if (__p[0])
  {
LABEL_18:
    __p[1] = v29;
    operator delete(v29);
  }
  return v28;
}

void sub_222A6F794(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLPhonTranslatorImpl::MatchIteration(void *a1, uint64_t *a2, uint64_t a3)
{
  *(void *)(a3 + 8) = *(void *)a3;
  uint64_t v3 = *a2;
  if (a2[1] == *a2)
  {
    char v5 = 0;
  }
  else
  {
    char v5 = 0;
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = v3 + 48 * v6;
      if (*(void *)v7 | *(void *)(v7 + 16))
      {
        if (*(void *)v7) {
          unint64_t v8 = **(unsigned __int8 **)(v3 + 48 * v6 + 8);
        }
        else {
          unint64_t v8 = 255;
        }
        if (a1[2] > v8)
        {
          uint64_t v9 = a1[3];
          unint64_t v10 = v8 + 1;
          if (*(__int16 *)(v9 + 2 * v8) < *(__int16 *)(v9 + 2 * (v8 + 1)))
          {
            uint64_t v11 = *(__int16 *)(v9 + 2 * v8);
            uint64_t v12 = 16 * v11;
            uint64_t v13 = (16 * v11) | 4;
            do
            {
              uint64_t v14 = 0;
              long long v15 = *(_OWORD *)(v7 + 16);
              long long v30 = *(_OWORD *)v7;
              long long v31 = v15;
              long long v32 = *(_OWORD *)(v7 + 32);
              uint64_t v16 = a1[1];
              uint64_t v17 = v30;
              uint64_t v18 = *((void *)&v30 + 1) + 4;
              uint64_t v19 = *((void *)&v30 + 1) + v30;
              while (1)
              {
                int v20 = *(unsigned __int8 *)(v16 + v12 + v14);
                if (v20 == 255) {
                  break;
                }
                if (!v17) {
                  goto LABEL_25;
                }
                if (*(unsigned __int8 *)(*((void *)&v30 + 1) + v14) != v20)
                {
                  uint64_t v19 = *((void *)&v30 + 1) + v14 + 1;
LABEL_25:
                  BOOL v26 = 0;
                  *(void *)&long long v30 = v17;
                  *((void *)&v30 + 1) = v19;
                  goto LABEL_32;
                }
                --v17;
                if (++v14 == 4)
                {
                  uint64_t v17 = v30 - 4;
                  goto LABEL_18;
                }
              }
              uint64_t v18 = *((void *)&v30 + 1) + v14;
LABEL_18:
              uint64_t v21 = 0;
              uint64_t v22 = *((void *)&v31 + 1) + 4;
              *(void *)&long long v30 = v17;
              *((void *)&v30 + 1) = v18;
              uint64_t v23 = *((void *)&v31 + 1) + v31;
              uint64_t v24 = v31;
              while (1)
              {
                int v25 = *(unsigned __int8 *)(v16 + v13 + v21);
                if (v25 == 255) {
                  break;
                }
                if ((void)v31 == v21) {
                  goto LABEL_31;
                }
                if (*(unsigned __int8 *)(*((void *)&v31 + 1) + v21) != v25)
                {
                  uint64_t v23 = *((void *)&v31 + 1) + v21 + 1;
LABEL_31:
                  BOOL v26 = 0;
                  *(void *)&long long v31 = v24;
                  *((void *)&v31 + 1) = v23;
                  goto LABEL_32;
                }
                --v24;
                if (++v21 == 4)
                {
                  uint64_t v24 = v31 - 4;
                  goto LABEL_27;
                }
              }
              uint64_t v22 = *((void *)&v31 + 1) + v21;
LABEL_27:
              *(void *)&long long v31 = v24;
              *((void *)&v31 + 1) = v22;
              *(float *)&long long v32 = *(float *)(v16 + 16 * v11 + 8) * *(float *)&v32;
              if (*(float *)&v32 <= 0.0)
              {
                BOOL v26 = 0;
              }
              else
              {
                PushMatchHypothesis((void **)a3, &v30);
                BOOL v26 = (v17 | v24) != 0;
              }
LABEL_32:
              v5 |= v26;
              ++v11;
              v12 += 16;
              v13 += 16;
            }
            while (v11 < *(__int16 *)(a1[3] + 2 * v10));
          }
        }
      }
      else
      {
        PushMatchHypothesis((void **)a3, (long long *)(v3 + 48 * v6));
      }
      ++v6;
      uint64_t v3 = *a2;
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 4));
  }
  return v5 & 1;
}

float SLPhonTranslatorImpl::Match(SLPhonTranslatorImpl *this, SLToken *a2, CFIndex a3, CFIndex a4, unint64_t *a5, float *a6, unint64_t *a7, unint64_t *a8)
{
  memset(v66, 0, 24);
  memset(v65, 0, 24);
  uint64_t v13 = SLTokenCountHomographs((uint64_t)a2);
  bzero(a6, 4 * v13);
  std::string __p = 0;
  size_t v63 = 0;
  uint64_t v64 = 0;
  if (v13)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      uint64_t Homograph = SLTokenGetHomograph((uint64_t)a2, i);
      CFDataRef Phonemes = SLHomographGetPhonemes(Homograph);
      CFIndex Length = CFDataGetLength(Phonemes);
      BytePtr = CFDataGetBytePtr(Phonemes);
      uint64_t v19 = v63;
      if (v63 >= v64)
      {
        uint64_t v21 = (char *)__p;
        uint64_t v22 = (v63 - (char *)__p) >> 3;
        unint64_t v23 = v22 + 1;
        if ((unint64_t)(v22 + 1) >> 61) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v24 = v64 - (char *)__p;
        if ((v64 - (char *)__p) >> 2 > v23) {
          unint64_t v23 = v24 >> 2;
        }
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v25 = v23;
        }
        if (v25)
        {
          BOOL v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>((uint64_t)&v64, v25);
          uint64_t v21 = (char *)__p;
          uint64_t v19 = v63;
        }
        else
        {
          BOOL v26 = 0;
        }
        uint64_t v27 = (CFIndex *)&v26[8 * v22];
        CFIndex *v27 = Length;
        int v20 = (char *)(v27 + 1);
        while (v19 != v21)
        {
          CFIndex v28 = *((void *)v19 - 1);
          v19 -= 8;
          *--uint64_t v27 = v28;
        }
        std::string __p = v27;
        uint64_t v64 = &v26[8 * v25];
        if (v21) {
          operator delete(v21);
        }
      }
      else
      {
        *(void *)size_t v63 = Length;
        int v20 = v63 + 8;
      }
      size_t v63 = v20;
      int v29 = v66[1];
      if (v66[1] >= v66[2])
      {
        unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * (((char *)v66[1] - (char *)v66[0]) >> 4);
        unint64_t v32 = v31 + 1;
        if (v31 + 1 > 0x555555555555555) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v66[2] - (char *)v66[0]) >> 4) > v32) {
          unint64_t v32 = 0x5555555555555556 * (((char *)v66[2] - (char *)v66[0]) >> 4);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v66[2] - (char *)v66[0]) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
          unint64_t v33 = 0x555555555555555;
        }
        else {
          unint64_t v33 = v32;
        }
        if (v33) {
          uint64_t v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLPhonTranslatorImpl::Hypothesis>>((uint64_t)&v66[2], v33);
        }
        else {
          uint64_t v34 = 0;
        }
        unint64_t v35 = (CFIndex *)&v34[48 * v31];
        CFIndex *v35 = Length;
        v35[1] = (CFIndex)BytePtr;
        v35[2] = a3;
        v35[3] = a4;
        void v35[4] = 1065353216;
        v35[5] = i;
        unint64_t v37 = (char *)v66[0];
        unint64_t v36 = (char *)v66[1];
        size_t v38 = v35;
        if (v66[1] != v66[0])
        {
          do
          {
            long long v39 = *((_OWORD *)v36 - 3);
            long long v40 = *((_OWORD *)v36 - 1);
            *((_OWORD *)v38 - 2) = *((_OWORD *)v36 - 2);
            *((_OWORD *)v38 - 1) = v40;
            *((_OWORD *)v38 - 3) = v39;
            v38 -= 6;
            v36 -= 48;
          }
          while (v36 != v37);
          unint64_t v36 = v37;
        }
        long long v30 = v35 + 6;
        v66[0] = v38;
        v66[1] = v35 + 6;
        v66[2] = &v34[48 * v33];
        if (v36) {
          operator delete(v36);
        }
      }
      else
      {
        *(void *)v66[1] = Length;
        v29[1] = BytePtr;
        v29[2] = a3;
        v29[3] = a4;
        long long v30 = v29 + 6;
        v29[4] = 1065353216;
        v29[5] = i;
      }
      v66[1] = v30;
    }
  }
  while (1)
  {
    int matched = SLPhonTranslatorImpl::MatchIteration(this, (uint64_t *)v66, (uint64_t)v65);
    unint64_t v45 = v65[0];
    if (!matched) {
      break;
    }
    uint64_t v41 = v66[2];
    long long v42 = *(_OWORD *)&v65[1];
    long long v43 = *(_OWORD *)v66;
    v66[0] = v65[0];
    *(_OWORD *)unint64_t v65 = v43;
    *(_OWORD *)&v66[1] = v42;
    v65[2] = v41;
  }
  if (v65[1] == v65[0])
  {
    uint64_t v52 = v66[0];
    uint64_t v51 = v66[1];
    *a7 = __p[*((void *)v66[0] + 5)] - *(void *)v66[0];
    *a8 = a3 - v52[2];
    *a5 = v52[5];
    unint64_t v53 = 0xAAAAAAAAAAAAAAABLL * ((v51 - (unsigned char *)v52) >> 4);
    float v48 = 0.0;
    if (v53 >= 2)
    {
      unint64_t v54 = v53 - 1;
      char v55 = v52 + 11;
      do
      {
        unint64_t v56 = __p[*v55] - *(v55 - 5);
        unint64_t v57 = a3 - *(v55 - 3);
        if (v57 > *a8 || v57 == *a8 && v56 > *a7)
        {
          *a7 = v56;
          *a8 = v57;
          *a5 = *v55;
        }
        v55 += 6;
        --v54;
      }
      while (v54);
    }
  }
  else
  {
    unint64_t v46 = ((char *)v65[1] - (char *)v65[0]) / 48;
    if (v46 <= 1) {
      unint64_t v46 = 1;
    }
    unint64_t v47 = (char *)v65[0] + 32;
    float v48 = -1000000.0;
    do
    {
      unint64_t v49 = *((void *)v47 + 1);
      a6[v49] = *(float *)v47;
      float v50 = *(float *)v47;
      if (*(float *)v47 > v48)
      {
        *a5 = v49;
        float v48 = v50;
      }
      v47 += 48;
      --v46;
    }
    while (v46);
  }
  if (__p)
  {
    operator delete(__p);
    unint64_t v45 = v65[0];
  }
  if (v45)
  {
    v65[1] = v45;
    operator delete(v45);
  }
  if (v66[0])
  {
    v66[1] = v66[0];
    operator delete(v66[0]);
  }
  return v48;
}

void sub_222A6FE5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void SLPhonTranslatorImpl::Map(SLPhonTranslatorImpl *this, unint64_t a2, const void *a3, unint64_t a4, void *a5)
{
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v8 = 0;
  long long v5 = 0uLL;
  uint64_t v6 = 0;
  operator new[]();
}

void sub_222A70084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t SLPhonTranslatorImpl::MapIteration(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a3 + 8) = *(void *)a3;
  uint64_t v4 = *a2;
  if (a2[1] == *a2)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    uint64_t v5 = a4;
    uint64_t v6 = a2;
    uint64_t v7 = a1;
    int v8 = 0;
    unint64_t v9 = 0;
    do
    {
      unint64_t v10 = (long long *)(v4 + 48 * v9);
      v45[0] = 1;
      if (*(void *)v10)
      {
        unint64_t v11 = **(unsigned __int8 **)(v4 + 48 * v9 + 8);
        if (v7[2] > v11)
        {
          uint64_t v12 = v7[3];
          unint64_t v13 = v11 + 1;
          uint64_t v35 = v4;
          if (*(__int16 *)(v12 + 2 * v11) >= *(__int16 *)(v12 + 2 * (v11 + 1)))
          {
            LOBYTE(v17) = 1;
          }
          else
          {
            uint64_t v14 = *(__int16 *)(v12 + 2 * v11);
            uint64_t v15 = 16 * v14;
            uint64_t v16 = (16 * v14) | 4;
            int v17 = 1;
            unint64_t v38 = v13;
            do
            {
              uint64_t v18 = 0;
              long long v19 = v10[1];
              long long v42 = *v10;
              long long v43 = v19;
              long long v44 = v10[2];
              uint64_t v20 = v7[1];
              uint64_t v21 = v42;
              uint64_t v22 = *((void *)&v42 + 1) + 4;
              uint64_t v23 = *((void *)&v42 + 1) + v42;
              while (1)
              {
                int v24 = *(unsigned __int8 *)(v20 + v15 + v18);
                if (v24 == 255) {
                  break;
                }
                if (!v21) {
                  goto LABEL_19;
                }
                if (*(unsigned __int8 *)(*((void *)&v42 + 1) + v18) != v24)
                {
                  uint64_t v23 = *((void *)&v42 + 1) + v18 + 1;
LABEL_19:
                  BOOL v26 = 0;
                  *(void *)&long long v42 = v21;
                  *((void *)&v42 + 1) = v23;
                  goto LABEL_29;
                }
                --v21;
                if (++v18 == 4)
                {
                  uint64_t v21 = v42 - 4;
                  goto LABEL_14;
                }
              }
              uint64_t v22 = *((void *)&v42 + 1) + v18;
LABEL_14:
              *(void *)&long long v42 = v21;
              *((void *)&v42 + 1) = v22;
              *(float *)&long long v44 = *(float *)&v44 * (float)(*(float *)(v20 + 16 * v14 + 8) * 0.999);
              if (*(float *)&v44 <= 0.0)
              {
                BOOL v26 = 0;
              }
              else
              {
                if (!v17) {
                  operator new[]();
                }
                long long v25 = v43;
                for (uint64_t i = 0; i != 4; ++i)
                {
                  int v28 = *(unsigned __int8 *)(v20 + v16 + i);
                  if (v28 == 255) {
                    break;
                  }
                  *(unsigned char *)(*((void *)&v25 + 1) + v25 + i) = v28;
                }
                *(void *)&long long v43 = v25 + i;
                LOBYTE(v40[0]) = 1;
                uint64_t v5 = a4;
                PushMapHypothesis((void **)a3, &v42, a4, v40);
                if (LOBYTE(v40[0])) {
                  BOOL v29 = *((void *)&v25 + 1) == 0;
                }
                else {
                  BOOL v29 = 1;
                }
                if (!v29) {
                  MEMORY[0x223CA4010](*((void *)&v25 + 1), 0x1000C8077774924);
                }
                int v17 = 0;
                BOOL v26 = v21 != 0;
                uint64_t v7 = a1;
                uint64_t v12 = a1[3];
                unint64_t v13 = v38;
              }
LABEL_29:
              v8 |= v26;
              ++v14;
              v15 += 16;
              v16 += 16;
            }
            while (v14 < *(__int16 *)(v12 + 2 * v13));
          }
          v45[0] = v17;
          uint64_t v6 = a2;
          uint64_t v4 = v35;
        }
        long long v30 = v10[2];
        v40[1] = v10[1];
        long long v41 = v30;
        v40[0] = *v10;
        uint64_t v31 = --*(void *)&v40[0];
        ++*((void *)&v40[0] + 1);
        *(float *)&long long v41 = *(float *)&v30 * 0.5;
        PushMapHypothesis((void **)a3, v40, v5, v45);
        v8 |= v31 != 0;
      }
      else
      {
        PushMapHypothesis((void **)a3, (long long *)(v4 + 48 * v9), v5, v45);
      }
      if (v45[0])
      {
        uint64_t v32 = *(void *)(v4 + 48 * v9 + 24);
        if (v32) {
          MEMORY[0x223CA4010](v32, 0x1000C8077774924);
        }
      }
      ++v9;
      uint64_t v4 = *v6;
    }
    while (v9 < 0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 4));
  }
  return v8 & 1;
}

void PushMatchHypothesis(void **a1, long long *a2)
{
  uint64_t v5 = (char *)*a1;
  uint64_t v4 = a1[1];
  unint64_t v6 = ((char *)v4 - (unsigned char *)*a1) / 48;
  if (v4 == *a1)
  {
LABEL_10:
    uint64_t v9 = (uint64_t)(a1 + 2);
    unint64_t v10 = (unint64_t)a1[2];
    if ((unint64_t)v4 >= v10)
    {
      if (v6 + 1 > 0x555555555555555) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - (void)v5) >> 4);
      uint64_t v15 = 2 * v14;
      if (2 * v14 <= v6 + 1) {
        uint64_t v15 = v6 + 1;
      }
      if (v14 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v16 = 0x555555555555555;
      }
      else {
        unint64_t v16 = v15;
      }
      if (v16) {
        int v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLPhonTranslatorImpl::Hypothesis>>(v9, v16);
      }
      else {
        int v17 = 0;
      }
      uint64_t v18 = &v17[48 * v6];
      long long v19 = &v17[48 * v16];
      long long v20 = *a2;
      long long v21 = a2[2];
      *((_OWORD *)v18 + 1) = a2[1];
      *((_OWORD *)v18 + 2) = v21;
      *(_OWORD *)uint64_t v18 = v20;
      unint64_t v13 = v18 + 48;
      uint64_t v23 = (char *)*a1;
      uint64_t v22 = (char *)a1[1];
      if (v22 != *a1)
      {
        do
        {
          long long v24 = *((_OWORD *)v22 - 3);
          long long v25 = *((_OWORD *)v22 - 1);
          *((_OWORD *)v18 - 2) = *((_OWORD *)v22 - 2);
          *((_OWORD *)v18 - 1) = v25;
          *((_OWORD *)v18 - 3) = v24;
          v18 -= 48;
          v22 -= 48;
        }
        while (v22 != v23);
        uint64_t v22 = (char *)*a1;
      }
      *a1 = v18;
      a1[1] = v13;
      a1[2] = v19;
      if (v22) {
        operator delete(v22);
      }
    }
    else
    {
      long long v11 = *a2;
      long long v12 = a2[2];
      v4[1] = a2[1];
      v4[2] = v12;
      *uint64_t v4 = v11;
      unint64_t v13 = v4 + 3;
    }
    a1[1] = v13;
  }
  else
  {
    if (v6 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = ((char *)v4 - (unsigned char *)*a1) / 48;
    }
    int v8 = v5 + 32;
    while (*((void *)v8 - 4) != *(void *)a2
         || *((void *)v8 - 2) != *((void *)a2 + 2)
         || *((void *)v8 + 1) != *((void *)a2 + 5))
    {
      v8 += 48;
      if (!--v7) {
        goto LABEL_10;
      }
    }
    float v26 = *(float *)v8;
    if (*(float *)v8 < *((float *)a2 + 8)) {
      float v26 = *((float *)a2 + 8);
    }
    *(float *)int v8 = v26;
  }
}

void PushMapHypothesis(void **a1, long long *a2, uint64_t a3, unsigned char *a4)
{
  int v8 = (char *)*a1;
  uint64_t v7 = a1[1];
  unint64_t v9 = ((char *)v7 - (unsigned char *)*a1) / 48;
  if (v7 == *a1)
  {
LABEL_8:
    if (!*a4) {
      operator new[]();
    }
    uint64_t v12 = (uint64_t)(a1 + 2);
    unint64_t v13 = (unint64_t)a1[2];
    if ((unint64_t)v7 >= v13)
    {
      if (v9 + 1 > 0x555555555555555) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13 - (void)v8) >> 4);
      uint64_t v18 = 2 * v17;
      if (2 * v17 <= v9 + 1) {
        uint64_t v18 = v9 + 1;
      }
      if (v17 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v19 = 0x555555555555555;
      }
      else {
        unint64_t v19 = v18;
      }
      if (v19) {
        long long v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLPhonTranslatorImpl::Hypothesis>>(v12, v19);
      }
      else {
        long long v20 = 0;
      }
      long long v21 = &v20[48 * v9];
      uint64_t v22 = &v20[48 * v19];
      long long v23 = *a2;
      long long v24 = a2[2];
      *((_OWORD *)v21 + 1) = a2[1];
      *((_OWORD *)v21 + 2) = v24;
      *(_OWORD *)long long v21 = v23;
      unint64_t v16 = v21 + 48;
      float v26 = (char *)*a1;
      long long v25 = (char *)a1[1];
      if (v25 != *a1)
      {
        do
        {
          long long v27 = *((_OWORD *)v25 - 3);
          long long v28 = *((_OWORD *)v25 - 1);
          *((_OWORD *)v21 - 2) = *((_OWORD *)v25 - 2);
          *((_OWORD *)v21 - 1) = v28;
          *((_OWORD *)v21 - 3) = v27;
          v21 -= 48;
          v25 -= 48;
        }
        while (v25 != v26);
        long long v25 = (char *)*a1;
      }
      *a1 = v21;
      a1[1] = v16;
      a1[2] = v22;
      if (v25) {
        operator delete(v25);
      }
    }
    else
    {
      long long v14 = *a2;
      long long v15 = a2[2];
      v7[1] = a2[1];
      v7[2] = v15;
      *uint64_t v7 = v14;
      unint64_t v16 = v7 + 3;
    }
    a1[1] = v16;
    *a4 = 0;
  }
  else
  {
    if (v9 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = ((char *)v7 - (unsigned char *)*a1) / 48;
    }
    long long v11 = v8 + 32;
    while (*((void *)v11 - 4) != *(void *)a2)
    {
      v11 += 12;
      if (!--v10) {
        goto LABEL_8;
      }
    }
    if (*(float *)v11 < *((float *)a2 + 8))
    {
      *((void *)v11 - 2) = *((void *)a2 + 2);
      memcpy(*((void **)v11 - 1), *((const void **)a2 + 3), *((void *)a2 + 2));
      _DWORD *v11 = *((_DWORD *)a2 + 8);
    }
  }
}

void SLPhonTranslatorImpl::~SLPhonTranslatorImpl(SLPhonTranslatorImpl *this)
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SLPhonTranslatorImpl::Hypothesis>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a2);
}

#error "222A708F4: too big function (funcsize=0)"

uint64_t SLLexerImpl::NextLiteralToken(SLLexerImpl *this)
{
  uint64_t v2 = (unsigned __int16 *)*((void *)this + 3);
LABEL_2:
  *((void *)this + 8) = v2;
  if ((uint64_t)(*((void *)this + 5) - (void)v2) <= 21)
  {
    SLLexerInstance::Refill(this);
    uint64_t v2 = (unsigned __int16 *)*((void *)this + 3);
  }
  unsigned __int16 v3 = SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2;
  if (v3 > 0x2049u)
  {
    if (HIBYTE(v3) <= 0x24u)
    {
      unsigned int v8 = v3 >> 2;
      if (v8 > 0x8C6)
      {
        if (v8 > 0x8FC)
        {
          if (v3 > 0x23FAu)
          {
            if (v3 != 9410) {
              goto LABEL_108;
            }
          }
          else if ((unsigned __int16)(v3 >> 3) < 0x47Fu)
          {
            goto LABEL_108;
          }
        }
        else if (v3 != 9000 && v3 < 0x23E9u)
        {
          goto LABEL_108;
        }
      }
      else if (v3 > 0x2199u)
      {
        if (v3 < 0x21A9u || (unsigned __int16)(v3 - 8619) < 0x16Fu) {
          goto LABEL_108;
        }
      }
      else if (v3 != 8505 && v8 < 0x865)
      {
        goto LABEL_108;
      }
      goto LABEL_107;
    }
    if (HIBYTE(v3) <= 0x32u)
    {
      if (v3 > 0x26F9u)
      {
        if (v3 > 0x270Du)
        {
          if (v3 == 10084) {
            goto LABEL_102;
          }
          goto LABEL_107;
        }
        unsigned int v9 = 9994;
      }
      else
      {
        if (v3 == 9757)
        {
LABEL_86:
          long long v25 = v2 + 1;
          unint64_t v26 = v2[1];
          *((void *)this + 3) = v2 + 1;
          *((void *)this + 6) = v2 + 1;
          if ((unsigned __int16)(SLChar::sLexFold[v26 & 0x3F | (SLChar::sUniMap[v26 >> 6] << 6)] + v26) != 55356)
          {
LABEL_114:
            unint64_t v33 = this;
LABEL_115:
            SLLexerInstance::CreateToken((uint64_t)v33);
          }
          unsigned int v28 = v2[2];
          v2 += 2;
          unint64_t v27 = v28;
LABEL_88:
          *((void *)this + 3) = v2;
          if ((unsigned __int16)(v27 + 8197 + SLChar::sLexFold[v27 & 0x3F | (SLChar::sUniMap[v27 >> 6] << 6)]) >= 5u)
          {
LABEL_89:
            *((void *)this + 3) = v25;
            goto LABEL_114;
          }
LABEL_107:
          long long v30 = v2 + 1;
          goto LABEL_113;
        }
        unsigned int v9 = 9977;
      }
      if (v9 > v3) {
        goto LABEL_107;
      }
      goto LABEL_86;
    }
    if (v3 > 0xD83Du)
    {
      if ((unsigned __int16)(v3 >> 9) > 0x6Eu)
      {
        if (((unsigned __int16)(v3 + 0x2000) >> 8) >= 0x19u) {
          goto LABEL_108;
        }
        goto LABEL_107;
      }
      if ((unsigned __int16)(v3 >> 10) >= 0x37u)
      {
        unsigned int v35 = v2[1];
        uint64_t v34 = v2 + 1;
        *((void *)this + 3) = v34;
        long long v20 = v34;
        if ((unsigned __int16)(SLChar::sLexFold[v35 & 0x3F | (SLChar::sUniMap[(unint64_t)v35 >> 6] << 6)] + v35) >> 10 != 55) {
          goto LABEL_109;
        }
        goto LABEL_112;
      }
    }
    else
    {
      if ((unsigned __int16)(v3 >> 11) < 0x1Bu) {
        goto LABEL_108;
      }
      if (v3 >= 0xD83Cu)
      {
        unint64_t v16 = v2[1];
        *((void *)this + 3) = v2 + 1;
        unsigned __int16 v17 = SLChar::sLexFold[v16 & 0x3F | (SLChar::sUniMap[v16 >> 6] << 6)] + v16;
        if (v3 == 55356)
        {
          if (v17 <= 0xDF85u)
          {
            if (v17 <= 0xDDE5u)
            {
              if ((unsigned __int16)(v17 >> 10) <= 0x36u) {
                goto LABEL_109;
              }
              goto LABEL_96;
            }
            if ((unsigned __int16)(v17 >> 9) < 0x6Fu)
            {
              long long v25 = v2 + 2;
              unint64_t v38 = v2[2];
              *((void *)this + 3) = v2 + 2;
              *((void *)this + 6) = v2 + 2;
              if ((unsigned __int16)(SLChar::sLexFold[v38 & 0x3F | (SLChar::sUniMap[v38 >> 6] << 6)] + v38) != 55356) {
                goto LABEL_114;
              }
              unsigned int v40 = v2[3];
              long long v39 = v2 + 3;
              *((void *)this + 3) = v39;
              long long v20 = v39;
              if ((unsigned __int16)(v40
                                    + 8730
                                    + SLChar::sLexFold[v40 & 0x3F | (SLChar::sUniMap[(unint64_t)v40 >> 6] << 6)]) < 0x1Au)
                goto LABEL_112;
              goto LABEL_89;
            }
            unsigned int v42 = 57221;
LABEL_150:
            if (v42 <= v17) {
              goto LABEL_190;
            }
LABEL_96:
            long long v30 = v2 + 2;
LABEL_113:
            *((void *)this + 3) = v30;
            goto LABEL_114;
          }
          if (v17 <= 0xDFC9u)
          {
            if ((unsigned __int16)(v17 + 8253) >= 2u) {
              goto LABEL_96;
            }
            goto LABEL_190;
          }
          if (v17 < 0xDFCCu) {
            goto LABEL_190;
          }
LABEL_140:
          if ((unsigned __int16)(SLChar::sLexFold[v16 & 0x3F | (SLChar::sUniMap[v16 >> 6] << 6)] + v16) >= 0xE000u) {
            goto LABEL_109;
          }
          goto LABEL_96;
        }
        if (v17 <= 0xDC87u)
        {
          if (v17 <= 0xDC69u)
          {
            if (v17 <= 0xDC45u)
            {
              if (v17 <= 0xDC40u)
              {
                if ((unsigned __int16)(v17 >> 10) < 0x37u) {
                  goto LABEL_109;
                }
                goto LABEL_96;
              }
              if (v17 == 56385)
              {
                long long v25 = v2 + 2;
                unint64_t v43 = v2[2];
                *((void *)this + 3) = v2 + 2;
                *((void *)this + 6) = v2 + 2;
                if ((unsigned __int16)(SLChar::sLexFold[v43 & 0x3F | (SLChar::sUniMap[v43 >> 6] << 6)] + v43) != 8205) {
                  goto LABEL_114;
                }
                unint64_t v44 = v2[3];
                *((void *)this + 3) = v2 + 3;
                if ((unsigned __int16)(SLChar::sLexFold[v44 & 0x3F | (SLChar::sUniMap[v44 >> 6] << 6)] + v44) != 55357) {
                  goto LABEL_89;
                }
                unsigned int v46 = v2[4];
                unint64_t v45 = v2 + 4;
                *((void *)this + 3) = v45;
                unsigned __int16 v47 = SLChar::sLexFold[v46 & 0x3F | (SLChar::sUniMap[(unint64_t)v46 >> 6] << 6)] + v46;
                int v48 = 56808;
LABEL_160:
                BOOL v49 = v48 == v47;
                goto LABEL_161;
              }
              unsigned int v41 = 56388;
LABEL_189:
              if (v41 <= v17) {
                goto LABEL_96;
              }
              goto LABEL_190;
            }
            if (v17 <= 0xDC65u)
            {
              unsigned int v41 = 56401;
              goto LABEL_189;
            }
            float v50 = v2;
            if (v17 < 0xDC68u) {
              goto LABEL_191;
            }
            unsigned int v51 = v2[2];
            long long v25 = v2 + 2;
            *((void *)this + 3) = v2 + 2;
            *((void *)this + 6) = v2 + 2;
            unsigned __int16 v52 = SLChar::sLexFold[v51 & 0x3F | (SLChar::sUniMap[(unint64_t)v51 >> 6] << 6)] + v51;
            if (v17 == 56424)
            {
              int v53 = v52;
              if (v52 == 8205)
              {
                unint64_t v54 = v2[3];
                *((void *)this + 3) = v2 + 3;
                int v55 = (unsigned __int16)(SLChar::sLexFold[v54 & 0x3F | (SLChar::sUniMap[v54 >> 6] << 6)] + v54);
                if (v55 != 10084)
                {
                  if (v55 != 55357) {
                    goto LABEL_89;
                  }
                  unint64_t v56 = v2[4];
                  *((void *)this + 3) = v2 + 4;
                  unsigned __int16 v57 = v56 + 9110 + SLChar::sLexFold[v56 & 0x3F | (SLChar::sUniMap[v56 >> 6] << 6)];
                  if (v57 != 65534 && v57 != 0xFFFF) {
                    goto LABEL_89;
                  }
                  goto LABEL_199;
                }
                goto LABEL_206;
              }
            }
            else
            {
              int v53 = v52;
              if (v52 == 8205)
              {
                unint64_t v66 = v2[3];
                *((void *)this + 3) = v2 + 3;
                int v67 = (unsigned __int16)(SLChar::sLexFold[v66 & 0x3F | (SLChar::sUniMap[v66 >> 6] << 6)] + v66);
                if (v67 != 10084)
                {
                  if (v67 != 55357) {
                    goto LABEL_89;
                  }
                  unint64_t v68 = v2[4];
                  *((void *)this + 3) = v2 + 4;
                  if ((unsigned __int16)(SLChar::sLexFold[v68 & 0x3F | (SLChar::sUniMap[v68 >> 6] << 6)] + v68) != 56425) {
                    goto LABEL_89;
                  }
LABEL_199:
                  unint64_t v69 = v2[5];
                  *((void *)this + 3) = v2 + 5;
                  if ((unsigned __int16)(SLChar::sLexFold[v69 & 0x3F | (SLChar::sUniMap[v69 >> 6] << 6)] + v69) != 8205) {
                    goto LABEL_89;
                  }
                  unint64_t v70 = v2[6];
                  *((void *)this + 3) = v2 + 6;
                  if ((unsigned __int16)(SLChar::sLexFold[v70 & 0x3F | (SLChar::sUniMap[v70 >> 6] << 6)] + v70) != 55357) {
                    goto LABEL_89;
                  }
                  unint64_t v71 = v2[7];
                  *((void *)this + 3) = v2 + 7;
                  unsigned __int16 v72 = SLChar::sLexFold[v71 & 0x3F | (SLChar::sUniMap[v71 >> 6] << 6)] + v71;
                  if (v72 < 0xDC66u) {
                    goto LABEL_89;
                  }
                  if (v72 == 56422)
                  {
                    long long v25 = v2 + 8;
                    unint64_t v73 = v2[8];
                    *((void *)this + 3) = v2 + 8;
                    *((void *)this + 6) = v2 + 8;
                    if ((unsigned __int16)(SLChar::sLexFold[v73 & 0x3F | (SLChar::sUniMap[v73 >> 6] << 6)] + v73) != 8205) {
                      goto LABEL_114;
                    }
                    unint64_t v74 = v2[9];
                    *((void *)this + 3) = v2 + 9;
                    if ((unsigned __int16)(SLChar::sLexFold[v74 & 0x3F | (SLChar::sUniMap[v74 >> 6] << 6)] + v74) != 55357) {
                      goto LABEL_89;
                    }
                    unsigned int v75 = v2[10];
                    unint64_t v45 = v2 + 10;
                    *((void *)this + 3) = v45;
                    unsigned __int16 v47 = SLChar::sLexFold[v75 & 0x3F | (SLChar::sUniMap[(unint64_t)v75 >> 6] << 6)] + v75;
                    int v48 = 56422;
                    goto LABEL_160;
                  }
                  if (v72 >= 0xDC68u) {
                    goto LABEL_89;
                  }
                  long long v25 = v2 + 8;
                  unint64_t v86 = v2[8];
                  *((void *)this + 3) = v2 + 8;
                  *((void *)this + 6) = v2 + 8;
                  if ((unsigned __int16)(SLChar::sLexFold[v86 & 0x3F | (SLChar::sUniMap[v86 >> 6] << 6)] + v86) != 8205) {
                    goto LABEL_114;
                  }
                  unint64_t v87 = v2[9];
                  *((void *)this + 3) = v2 + 9;
                  if ((unsigned __int16)(SLChar::sLexFold[v87 & 0x3F | (SLChar::sUniMap[v87 >> 6] << 6)] + v87) != 55357) {
                    goto LABEL_89;
                  }
                  unsigned int v88 = v2[10];
                  unint64_t v45 = v2 + 10;
                  *((void *)this + 3) = v45;
                  unsigned int v84 = (SLChar::sLexFold[v88 & 0x3F | (SLChar::sUniMap[(unint64_t)v88 >> 6] << 6)] + (_WORD)v88) & 0xFFFE;
                  int v85 = 28211;
LABEL_219:
                  BOOL v49 = v85 == v84 >> 1;
LABEL_161:
                  long long v20 = v45;
                  if (v49) {
                    goto LABEL_112;
                  }
                  goto LABEL_89;
                }
LABEL_206:
                unint64_t v76 = v2[4];
                *((void *)this + 3) = v2 + 4;
                if ((unsigned __int16)(SLChar::sLexFold[v76 & 0x3F | (SLChar::sUniMap[v76 >> 6] << 6)] + v76) != 65039) {
                  goto LABEL_89;
                }
                unint64_t v77 = v2[5];
                *((void *)this + 3) = v2 + 5;
                if ((unsigned __int16)(SLChar::sLexFold[v77 & 0x3F | (SLChar::sUniMap[v77 >> 6] << 6)] + v77) != 8205) {
                  goto LABEL_89;
                }
                unint64_t v78 = v2[6];
                *((void *)this + 3) = v2 + 6;
                if ((unsigned __int16)(SLChar::sLexFold[v78 & 0x3F | (SLChar::sUniMap[v78 >> 6] << 6)] + v78) != 55357) {
                  goto LABEL_89;
                }
                long long v20 = v2 + 7;
                unint64_t v79 = v2[7];
                *((void *)this + 3) = v2 + 7;
                unsigned __int16 v80 = SLChar::sLexFold[v79 & 0x3F | (SLChar::sUniMap[v79 >> 6] << 6)] + v79;
                if (v80 < 0xDC68u) {
                  goto LABEL_89;
                }
                if (v80 < 0xDC6Au) {
                  goto LABEL_112;
                }
                if (v80 != 56459) {
                  goto LABEL_89;
                }
                unint64_t v81 = v2[8];
                *((void *)this + 3) = v2 + 8;
                if ((unsigned __int16)(SLChar::sLexFold[v81 & 0x3F | (SLChar::sUniMap[v81 >> 6] << 6)] + v81) != 8205) {
                  goto LABEL_89;
                }
                unint64_t v82 = v2[9];
                *((void *)this + 3) = v2 + 9;
                if ((unsigned __int16)(SLChar::sLexFold[v82 & 0x3F | (SLChar::sUniMap[v82 >> 6] << 6)] + v82) != 55357) {
                  goto LABEL_89;
                }
                unsigned int v83 = v2[10];
                unint64_t v45 = v2 + 10;
                *((void *)this + 3) = v45;
                unsigned int v84 = (SLChar::sLexFold[v83 & 0x3F | (SLChar::sUniMap[(unint64_t)v83 >> 6] << 6)] + (_WORD)v83) & 0xFFFE;
                int v85 = 28212;
                goto LABEL_219;
              }
            }
            if (v53 != 55356) {
              goto LABEL_114;
            }
LABEL_192:
            unsigned int v65 = v2[3];
            v2 += 3;
            unint64_t v27 = v65;
            goto LABEL_88;
          }
          if (v17 > 0xDC7Bu)
          {
            if (v17 > 0xDC80u)
            {
              if (v17 != 56452) {
                goto LABEL_190;
              }
              goto LABEL_96;
            }
            unsigned int v41 = 56445;
            goto LABEL_189;
          }
          BOOL v36 = v17 == 56430;
          if (v17 > 0xDC6Eu)
          {
            if (v17 == 56431) {
              goto LABEL_96;
            }
            unsigned int v41 = 56441;
            goto LABEL_189;
          }
LABEL_166:
          if (v36) {
            goto LABEL_190;
          }
          goto LABEL_96;
        }
        if (v17 > 0xDE47u)
        {
          if (v17 > 0xDEB3u)
          {
            if ((unsigned __int16)(v17 >> 6) > 0x37Au)
            {
              if (v17 == 57024)
              {
                long long v25 = v2 + 2;
                unint64_t v58 = v2[2];
                *((void *)this + 3) = v2 + 2;
                *((void *)this + 6) = v2 + 2;
                if ((unsigned __int16)(SLChar::sLexFold[v58 & 0x3F | (SLChar::sUniMap[v58 >> 6] << 6)] + v58) != 55356) {
                  goto LABEL_114;
                }
                unint64_t v59 = v2[3];
                *((void *)this + 3) = v2 + 3;
                if ((unsigned __int16)(v59 + SLChar::sLexFold[v59 & 0x3F | (SLChar::sUniMap[v59 >> 6] << 6)] + 0x2000) >= 0xFFFBu)
                {
                  unint64_t v60 = v2[4];
                  *((void *)this + 3) = v2 + 4;
                  if ((unsigned __int16)(SLChar::sLexFold[v60 & 0x3F | (SLChar::sUniMap[v60 >> 6] << 6)] + v60) == 55358)
                  {
                    unint64_t v61 = v2[5];
                    *((void *)this + 3) = v2 + 5;
                    if ((unsigned __int16)(SLChar::sLexFold[v61 & 0x3F | (SLChar::sUniMap[v61 >> 6] << 6)] + v61) == 56600)
                    {
                      unint64_t v62 = v2[6];
                      *((void *)this + 3) = v2 + 6;
                      if ((unsigned __int16)(SLChar::sLexFold[v62 & 0x3F | (SLChar::sUniMap[v62 >> 6] << 6)] + v62) == 55356)
                      {
                        unsigned int v63 = v2[7];
                        v2 += 7;
                        *((void *)this + 3) = v2;
                        if ((unsigned __int16)(v63
                                              + SLChar::sLexFold[v63 & 0x3F | (SLChar::sUniMap[(unint64_t)v63 >> 6] << 6)]
                                              + 0x2000) >= 0xFFFBu)
                          goto LABEL_107;
                      }
                    }
                  }
                }
                goto LABEL_89;
              }
              goto LABEL_140;
            }
            unsigned int v41 = 57015;
            goto LABEL_189;
          }
          if ((unsigned __int16)(v17 >> 4) <= 0xDE4u)
          {
            unsigned int v42 = 56907;
            goto LABEL_150;
          }
          int v37 = 56995;
        }
        else
        {
          if ((unsigned __int16)(v17 >> 4) > 0xDD8u)
          {
            if (v17 > 0xDD94u)
            {
              if (v17 >= 0xDD97u)
              {
                unsigned int v42 = 56901;
                goto LABEL_150;
              }
LABEL_190:
              float v50 = v2;
LABEL_191:
              unsigned int v64 = v50[2];
              long long v25 = v50 + 2;
              *((void *)this + 3) = v25;
              *((void *)this + 6) = v25;
              if ((unsigned __int16)(SLChar::sLexFold[v64 & 0x3F | (SLChar::sUniMap[(unint64_t)v64 >> 6] << 6)]
                                    + v64) != 55356)
                goto LABEL_114;
              goto LABEL_192;
            }
            unsigned int v41 = 56721;
            goto LABEL_189;
          }
          BOOL v36 = v17 == 56490;
          if (v17 <= 0xDCAAu) {
            goto LABEL_166;
          }
          int v37 = 56693;
        }
        BOOL v36 = v37 == v17;
        goto LABEL_166;
      }
    }
    unint64_t v29 = v2[1];
    *((void *)this + 3) = v2 + 1;
    if ((unsigned __int16)(SLChar::sLexFold[v29 & 0x3F | (SLChar::sUniMap[v29 >> 6] << 6)] + v29) >> 10 != 55) {
      goto LABEL_109;
    }
    goto LABEL_96;
  }
  unsigned int v4 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
  if (v4 > 0x7A)
  {
    if (v4 <= 0xDF)
    {
      unsigned int v6 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
      if (v6 > 0xB0)
      {
        int v18 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
        if (v6 > 0xC0)
        {
          if (v18 != 198) {
            goto LABEL_108;
          }
        }
        else if (v18 != 192)
        {
          goto LABEL_108;
        }
      }
      else
      {
        if (v6 == 160) {
          goto LABEL_19;
        }
        if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) < 0xB0u) {
          goto LABEL_108;
        }
      }
      goto LABEL_100;
    }
    if (v3 <= 0x202Eu)
    {
      unsigned int v19 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
      if (v19 >= 0xE1 && v19 != 230) {
        goto LABEL_108;
      }
      goto LABEL_100;
    }
    if ((unsigned __int16)(v3 >> 2) <= 0x80Eu)
    {
      if ((unsigned __int16)(v3 >> 4) >= 0x203u) {
        goto LABEL_108;
      }
LABEL_19:
      *((void *)this + 3) = ++v2;
      while (1)
      {
        unsigned int v7 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
        if (v7 > 0x20)
        {
          if (v7 > 0xA0)
          {
            if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)]
                                  + *v2) != 8239)
              goto LABEL_2;
          }
          else if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] {
                                     + *v2) != 160)
          }
          {
            goto LABEL_2;
          }
        }
        else if (v7 != 9 && v7 != 32)
        {
          goto LABEL_2;
        }
        *((void *)this + 3) = ++v2;
        if (*((unsigned __int16 **)this + 5) == v2)
        {
          SLLexerInstance::Refill(this);
          uint64_t v2 = (unsigned __int16 *)*((void *)this + 3);
        }
      }
    }
    if (v3 != 8252 && v3 < 0x2049u) {
      goto LABEL_108;
    }
LABEL_102:
    unsigned int v32 = v2[1];
    uint64_t v31 = v2 + 1;
    *((void *)this + 3) = v31;
    long long v20 = v31;
    if ((unsigned __int16)(SLChar::sLexFold[v32 & 0x3F | (SLChar::sUniMap[(unint64_t)v32 >> 6] << 6)] + v32) != 65039) {
      goto LABEL_114;
    }
    goto LABEL_112;
  }
  if (v4 > 0x22)
  {
    unsigned int v10 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
    if (v10 <= 0x2F)
    {
      if (v10 >= 0x24
        && (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) != 42)
      {
        goto LABEL_108;
      }
      uint64_t v12 = v2 + 1;
      unint64_t v11 = v2[1];
      *((void *)this + 3) = v2 + 1;
      *((void *)this + 6) = v2 + 1;
      int v13 = (unsigned __int16)(SLChar::sLexFold[v11 & 0x3F | (SLChar::sUniMap[v11 >> 6] << 6)] + v11);
      if (v13 != 8419)
      {
        if (v13 != 65039) {
          goto LABEL_109;
        }
LABEL_73:
        unsigned int v24 = v2[2];
        long long v23 = v2 + 2;
        *((void *)this + 3) = v23;
        long long v20 = v23;
        if ((unsigned __int16)(SLChar::sLexFold[v24 & 0x3F | (SLChar::sUniMap[(unint64_t)v24 >> 6] << 6)] + v24) != 8419)
        {
          *((void *)this + 3) = v12;
LABEL_109:
          unint64_t v33 = this;
          goto LABEL_115;
        }
        goto LABEL_112;
      }
      long long v20 = v2 + 1;
LABEL_112:
      long long v30 = v20 + 1;
      goto LABEL_113;
    }
    if (v10 <= 0x40)
    {
      if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) >= 0x3Au) {
        goto LABEL_108;
      }
      long long v20 = v2 + 1;
      unint64_t v21 = v2[1];
      *((void *)this + 3) = v2 + 1;
      *((void *)this + 6) = v2 + 1;
      unsigned __int16 v22 = SLChar::sLexFold[v21 & 0x3F | (SLChar::sUniMap[v21 >> 6] << 6)] + v21;
      if (v22 == 8419) {
        goto LABEL_112;
      }
      uint64_t v12 = v2 + 1;
      if (v22 == 65039) {
        goto LABEL_73;
      }
      while (1)
      {
        if (v22 > 0xB0u)
        {
          if (v22 > 0xC6u)
          {
            BOOL v90 = v22 == 224;
            if (v22 > 0xE0u) {
              BOOL v90 = v22 == 230;
            }
          }
          else
          {
            if (v22 == 192) {
              goto LABEL_220;
            }
            BOOL v90 = v22 == 198;
          }
          if (!v90) {
            goto LABEL_109;
          }
        }
        else if (v22 > 0x5Au)
        {
          if (v22 < 0x61u || (unsigned __int16)(v22 - 123) < 0x35u) {
            goto LABEL_109;
          }
        }
        else if (v22 < 0x30u || (unsigned __int16)(v22 - 58) < 7u)
        {
          goto LABEL_109;
        }
LABEL_220:
        *((void *)this + 3) = ++v20;
        if (*((unsigned __int16 **)this + 5) == v20)
        {
          SLLexerInstance::Refill(this);
          long long v20 = (unsigned __int16 *)*((void *)this + 3);
        }
LABEL_222:
        unsigned __int16 v22 = SLChar::sLexFold[*v20 & 0x3F | (SLChar::sUniMap[(unint64_t)*v20 >> 6] << 6)] + *v20;
      }
    }
    if ((unsigned __int16)(v3 - 91) < 6u) {
      goto LABEL_108;
    }
LABEL_100:
    long long v20 = v2 + 1;
    *((void *)this + 3) = v2 + 1;
    goto LABEL_222;
  }
  unsigned int v5 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
  if (v5 > 0xF)
  {
    if (v5 != 32)
    {
      if (v5 == 16)
      {
        *((void *)this + 3) = v2 + 1;
        int v14 = *((_DWORD *)this + 23);
        *((_DWORD *)this + 24) = v14;
        *((_DWORD *)this + 25) = v14;
        *((_DWORD *)this + 23) = 1;
        *((void *)this + 13) = *((void *)this + 10);
        return 0;
      }
      goto LABEL_108;
    }
    goto LABEL_19;
  }
  if (v5 == 9) {
    goto LABEL_19;
  }
  if (SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2)
  {
LABEL_108:
    *((void *)this + 3) = v2 + 1;
    goto LABEL_109;
  }
  *((_DWORD *)this + 23) &= ~0x10u;
  *((void *)this + 3) = v2;
  return 0;
}

uint64_t SLLexerImpl::ScanFixed(unsigned __int16 **this, unsigned int *a2, unsigned int *a3, int a4)
{
  SLLexerImpl::SkipSpaces((SLLexerInstance *)this);
  int v5 = 0;
  int v6 = 0;
  char v7 = 0;
  char v8 = 0;
  unsigned int v9 = this[3];
  char v10 = 16;
  int v21 = 1;
  int v11 = 1;
LABEL_2:
  char v12 = v8;
  while (1)
  {
    while (1)
    {
      if (this[5] == v9)
      {
        SLLexerInstance::Refill((SLLexerInstance *)this);
        unsigned int v9 = this[3];
      }
      unint64_t v13 = *v9;
      unsigned int v14 = (unsigned __int16)(SLChar::sLexFold[v13 & 0x3F | (SLChar::sUniMap[v13 >> 6] << 6)] + v13);
      if (v14 > 0x2C) {
        break;
      }
      if (v14 > 0xA)
      {
        if (v14 != 43) {
          goto LABEL_29;
        }
      }
      else if (v14 != 10)
      {
        goto LABEL_29;
      }
LABEL_18:
      this[3] = ++v9;
      if (v7) {
        return 0;
      }
      if (a4)
      {
        char v7 = 0;
        BOOL v17 = v13 == 45;
        int v18 = v21;
        if (v17) {
          int v18 = -1;
        }
        int v21 = v18;
        if (a3)
        {
          char v7 = 0;
          *(unsigned char *)a3 = 114;
        }
      }
      else
      {
        char v7 = 0;
        uint64_t result = 0;
        if (v13 == 45) {
          return result;
        }
      }
    }
    if (v14 <= 0x2E)
    {
      if (v14 == 46)
      {
        this[3] = ++v9;
        char v8 = 1;
        if ((v12 & 1) == 0) {
          goto LABEL_2;
        }
        return 0;
      }
      goto LABEL_18;
    }
    if (v14 == 47 || v14 >= 0x3A) {
      break;
    }
    this[3] = ++v9;
    int v15 = v13 - 48;
    if (v12)
    {
      int v6 = v15 + 10 * v6;
      --v10;
      char v7 = 1;
      v11 *= 5;
    }
    else
    {
      int v5 = v15 + 10 * v5;
      char v7 = 1;
    }
  }
LABEL_29:
  this[3] = v9 + 1;
  if (v7)
  {
    this[3] = v9;
    *a2 = ((v6 << v10) / v11 + (v5 << 16)) * v21;
    return 1;
  }
  return 0;
}

uint64_t SLLexerImpl::ScanWhole(unsigned __int16 **this, unsigned int *a2, int a3)
{
  SLLexerImpl::SkipSpaces((SLLexerInstance *)this);
  LOBYTE(result) = 0;
  unsigned int v7 = 0;
  while ((result & 1) != 0)
  {
    char v8 = this[3];
    if (this[5] == v8)
    {
      SLLexerInstance::Refill((SLLexerInstance *)this);
      char v8 = this[3];
    }
    unint64_t v9 = *v8;
    if ((unsigned __int16)(v9 + SLChar::sLexFold[v9 & 0x3F | (SLChar::sUniMap[v9 >> 6] << 6)] - 58) < 0xFFF6u)
    {
LABEL_152:
      this[3] = v8;
      goto LABEL_153;
    }
    char v10 = 0;
    this[3] = v8 + 1;
    int v11 = v9 + 10 * v7;
LABEL_139:
    unsigned int v7 = v11 - 48;
    LOBYTE(result) = 1;
LABEL_140:
    if (v10)
    {
      char v8 = this[3];
      while (1)
      {
        if (this[5] == v8)
        {
          SLLexerInstance::Refill((SLLexerInstance *)this);
          char v8 = this[3];
        }
        unint64_t v80 = *v8;
        unsigned __int16 v81 = SLChar::sLexFold[v80 & 0x3F | (SLChar::sUniMap[v80 >> 6] << 6)] + v80;
        if (v81 > 0x40u)
        {
          if (v81 >= 0x47u)
          {
            if ((unsigned __int16)(v81 - 97) > 5u) {
              goto LABEL_152;
            }
            int v82 = -87;
          }
          else
          {
            int v82 = -55;
          }
        }
        else
        {
          if ((unsigned __int16)(v81 - 58) < 0xFFF6u) {
            goto LABEL_152;
          }
          int v82 = -48;
        }
        this[3] = ++v8;
        unsigned int v7 = v82 + 16 * v7 + v80;
      }
    }
  }
  char v12 = this[3];
  unint64_t v13 = v12;
  if ((char *)this[5] - (char *)v12 <= 11)
  {
    SLLexerInstance::Refill((SLLexerInstance *)this);
    unint64_t v13 = this[3];
  }
  switch(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)] + *v13)
  {
    case '""':
      unsigned int v14 = v13 + 1;
      unint64_t v15 = v13[1];
      this[3] = v13 + 1;
      this[6] = v13 + 1;
      unsigned __int16 v16 = SLChar::sLexFold[v15 & 0x3F | (SLChar::sUniMap[v15 >> 6] << 6)] + v15;
      if (v16 > 0x21u)
      {
        if (v16 == 34)
        {
          int v37 = v13 + 2;
          unint64_t v36 = v13[2];
          this[3] = v13 + 2;
          this[6] = v13 + 2;
          unsigned __int16 v38 = SLChar::sLexFold[v36 & 0x3F | (SLChar::sUniMap[v36 >> 6] << 6)] + v36;
          if (v38 <= 0x21u)
          {
            if (v38 < 0x20u)
            {
              unsigned int v14 = v13 + 2;
              goto LABEL_156;
            }
            int v39 = v38;
            unsigned int v35 = 2;
            unsigned int v14 = v13 + 2;
LABEL_60:
            if (v39 == 32) {
              goto LABEL_97;
            }
LABEL_93:
            unint64_t v55 = v13[3];
            this[3] = v13 + 3;
            unsigned __int16 v56 = SLChar::sLexFold[v55 & 0x3F | (SLChar::sUniMap[v55 >> 6] << 6)] + v55;
            if (v56 <= 0x21u)
            {
              if (v56 < 0x20u) {
                goto LABEL_39;
              }
              if ((unsigned __int16)(SLChar::sLexFold[v55 & 0x3F | (SLChar::sUniMap[v55 >> 6] << 6)] + v55) == 32) {
                goto LABEL_124;
              }
              goto LABEL_120;
            }
            if (v56 != 34)
            {
              if ((unsigned __int16)(SLChar::sLexFold[v55 & 0x3F | (SLChar::sUniMap[v55 >> 6] << 6)] + v55) >= 0x7Fu)
              {
LABEL_124:
                unsigned int v72 = v13[4];
                unint64_t v59 = v13 + 4;
                this[3] = v59;
                unsigned int v73 = (unsigned __int16)(SLChar::sLexFold[v72 & 0x3F | (SLChar::sUniMap[(unint64_t)v72 >> 6] << 6)]
                                       + v72);
                if (v73 >= 0x20)
                {
                  if (v73 == 34) {
                    goto LABEL_168;
                  }
LABEL_126:
                  unint64_t v74 = v59[1];
                  this[3] = v59 + 1;
                  if ((unsigned __int16)(SLChar::sLexFold[v74 & 0x3F | (SLChar::sUniMap[v74 >> 6] << 6)] + v74) == 34) {
                    goto LABEL_169;
                  }
                  goto LABEL_136;
                }
LABEL_39:
                this[3] = v14;
LABEL_137:
                if (v35)
                {
                  if (v35 == 2) {
                    goto LABEL_156;
                  }
                  return 0;
                }
LABEL_138:
                char v10 = 0;
                int v11 = *(v14 - 1);
                goto LABEL_139;
              }
LABEL_120:
              unsigned int v70 = v13[4];
              unint64_t v59 = v13 + 4;
              this[3] = v59;
              this[6] = v59;
              unsigned int v71 = (unsigned __int16)(SLChar::sLexFold[v70 & 0x3F | (SLChar::sUniMap[(unint64_t)v70 >> 6] << 6)]
                                     + v70);
              if (v71 < 0x20) {
                goto LABEL_163;
              }
              if (v71 == 34)
              {
LABEL_168:
                unsigned int v14 = v59 + 1;
                unint64_t v88 = v59[1];
                this[3] = v59 + 1;
                if ((unsigned __int16)(SLChar::sLexFold[v88 & 0x3F | (SLChar::sUniMap[v88 >> 6] << 6)] + v88) == 34)
                {
LABEL_169:
                  unsigned int v14 = v59 + 2;
                  this[3] = v59 + 2;
                }
LABEL_156:
                unsigned int v83 = v12 + 1;
                unint64_t v84 = (unint64_t)(v14 - 1);
                if ((unint64_t)(v12 + 1) < v84)
                {
                  unsigned int v7 = 0;
                  do
                  {
                    int v85 = *v83++;
                    unsigned int v7 = v85 + (v7 << 8);
                  }
                  while ((unint64_t)v83 < v84);
                  goto LABEL_153;
                }
                goto LABEL_179;
              }
              unsigned int v35 = 3;
              goto LABEL_123;
            }
LABEL_101:
            unint64_t v60 = v37[2];
            unint64_t v59 = v37 + 2;
            this[3] = v37 + 2;
            this[6] = v37 + 2;
            goto LABEL_102;
          }
          if (v38 != 34)
          {
            unsigned int v49 = v38;
            unsigned int v35 = 2;
            unsigned int v14 = v13 + 2;
LABEL_92:
            if (v49 >= 0x7F) {
              goto LABEL_97;
            }
            goto LABEL_93;
          }
LABEL_73:
          unsigned int v14 = v13 + 3;
          unint64_t v51 = v13[3];
          this[3] = v13 + 3;
          this[6] = v13 + 3;
          unsigned __int16 v52 = SLChar::sLexFold[v51 & 0x3F | (SLChar::sUniMap[v51 >> 6] << 6)] + v51;
          if (v52 > 0x21u)
          {
            if (v52 == 34) {
              goto LABEL_101;
            }
            if (v52 <= 0x7Eu) {
              goto LABEL_120;
            }
          }
          else
          {
            if (v52 < 0x20u) {
              goto LABEL_156;
            }
            if (v52 != 32) {
              goto LABEL_120;
            }
          }
LABEL_86:
          unsigned int v35 = 2;
          goto LABEL_124;
        }
        if (v16 >= 0x7Fu) {
          goto LABEL_14;
        }
      }
      else
      {
        if (v16 < 0x20u) {
          return 0;
        }
        if (v16 == 32)
        {
LABEL_14:
          unint64_t v17 = v13[2];
          this[3] = v13 + 2;
          unsigned int v18 = (unsigned __int16)(SLChar::sLexFold[v17 & 0x3F | (SLChar::sUniMap[v17 >> 6] << 6)] + v17);
          if (v18 >= 0x20)
          {
            if (v18 == 34)
            {
              unsigned int v14 = v13 + 3;
              unint64_t v19 = v13[3];
              this[3] = v13 + 3;
              this[6] = v13 + 3;
              unsigned int v20 = (unsigned __int16)(SLChar::sLexFold[v19 & 0x3F | (SLChar::sUniMap[v19 >> 6] << 6)] + v19);
              if (v20 < 0x20) {
                goto LABEL_156;
              }
              if (v20 == 34) {
                goto LABEL_99;
              }
              goto LABEL_86;
            }
            unsigned int v35 = 1;
LABEL_97:
            unint64_t v57 = v13[3];
            this[3] = v13 + 3;
            unsigned int v58 = (unsigned __int16)(SLChar::sLexFold[v57 & 0x3F | (SLChar::sUniMap[v57 >> 6] << 6)] + v57);
            if (v58 < 0x20) {
              goto LABEL_39;
            }
            if (v58 == 34)
            {
LABEL_99:
              unsigned int v61 = v13[4];
              unint64_t v59 = v13 + 4;
              unint64_t v60 = v61;
              this[3] = v59;
              this[6] = v59;
LABEL_102:
              unsigned int v62 = (unsigned __int16)(SLChar::sLexFold[v60 & 0x3F | (SLChar::sUniMap[v60 >> 6] << 6)] + v60);
              if (v62 < 0x20)
              {
                unsigned int v14 = v59;
                goto LABEL_156;
              }
              if (v62 == 34) {
                goto LABEL_168;
              }
              unsigned int v35 = 2;
LABEL_123:
              unsigned int v14 = v59;
              goto LABEL_126;
            }
            goto LABEL_124;
          }
LABEL_38:
          unsigned int v35 = 1;
          goto LABEL_39;
        }
      }
      int v37 = v13 + 2;
      unint64_t v45 = v13[2];
      this[3] = v13 + 2;
      unsigned __int16 v46 = SLChar::sLexFold[v45 & 0x3F | (SLChar::sUniMap[v45 >> 6] << 6)] + v45;
      if (v46 <= 0x21u)
      {
        if (v46 < 0x20u) {
          goto LABEL_38;
        }
        int v39 = v46;
        unsigned int v35 = 1;
        goto LABEL_60;
      }
      if (v46 != 34)
      {
        unsigned int v49 = v46;
        unsigned int v35 = 1;
        goto LABEL_92;
      }
      goto LABEL_73;
    case '$':
      unsigned int v21 = v13[1];
      this[3] = v13 + 1;
      unsigned __int16 v22 = SLChar::sLexFold[v21 & 0x3F | (SLChar::sUniMap[(unint64_t)v21 >> 6] << 6)] + v21;
      if (v22 > 0x40u)
      {
        uint64_t result = 0;
        if (v22 >= 0x47u && (unsigned __int16)(v22 - 97) >= 6u) {
          return result;
        }
      }
      else
      {
        uint64_t result = 0;
        if ((unsigned __int16)(v22 - 48) >= 0xAu) {
          return result;
        }
      }
      goto LABEL_48;
    case '\'':
      unsigned int v14 = v13 + 1;
      unint64_t v23 = v13[1];
      this[3] = v13 + 1;
      this[6] = v13 + 1;
      unsigned __int16 v24 = SLChar::sLexFold[v23 & 0x3F | (SLChar::sUniMap[v23 >> 6] << 6)] + v23;
      if (v24 <= 0x26u)
      {
        if (v24 < 0x20u) {
          return 0;
        }
        if (v24 == 32) {
          goto LABEL_25;
        }
        goto LABEL_63;
      }
      if (v24 == 39)
      {
        unsigned int v42 = v13 + 2;
        unint64_t v41 = v13[2];
        this[3] = v13 + 2;
        this[6] = v13 + 2;
        unsigned __int16 v43 = SLChar::sLexFold[v41 & 0x3F | (SLChar::sUniMap[v41 >> 6] << 6)] + v41;
        if (v43 <= 0x26u)
        {
          if (v43 < 0x20u) {
            goto LABEL_175;
          }
          int v44 = v43;
          unsigned int v35 = 4;
          unsigned int v14 = v13 + 2;
          goto LABEL_66;
        }
        if (v43 != 39)
        {
          unsigned int v50 = v43;
          unsigned int v35 = 4;
          unsigned int v14 = v13 + 2;
LABEL_106:
          if (v50 >= 0x7F) {
            goto LABEL_111;
          }
LABEL_107:
          unint64_t v63 = v13[3];
          this[3] = v13 + 3;
          unsigned __int16 v64 = SLChar::sLexFold[v63 & 0x3F | (SLChar::sUniMap[v63 >> 6] << 6)] + v63;
          if (v64 <= 0x26u)
          {
            if (v64 < 0x20u) {
              goto LABEL_136;
            }
            if ((unsigned __int16)(SLChar::sLexFold[v63 & 0x3F | (SLChar::sUniMap[v63 >> 6] << 6)] + v63) == 32) {
              goto LABEL_133;
            }
            goto LABEL_129;
          }
          if (v64 != 39)
          {
            if ((unsigned __int16)(SLChar::sLexFold[v63 & 0x3F | (SLChar::sUniMap[v63 >> 6] << 6)] + v63) >= 0x7Fu) {
              goto LABEL_133;
            }
LABEL_129:
            unsigned int v75 = v13[4];
            unint64_t v59 = v13 + 4;
            this[3] = v59;
            this[6] = v59;
            unsigned int v76 = (unsigned __int16)(SLChar::sLexFold[v75 & 0x3F | (SLChar::sUniMap[(unint64_t)v75 >> 6] << 6)]
                                   + v75);
            if (v76 < 0x20) {
              goto LABEL_163;
            }
            if (v76 == 39)
            {
LABEL_170:
              unsigned int v42 = v59 + 1;
              unint64_t v89 = v59[1];
              this[3] = v59 + 1;
              if ((unsigned __int16)(SLChar::sLexFold[v89 & 0x3F | (SLChar::sUniMap[v89 >> 6] << 6)] + v89) == 39)
              {
LABEL_171:
                unsigned int v42 = v59 + 2;
                this[3] = v59 + 2;
              }
LABEL_175:
              BOOL v90 = v12 + 1;
              if (v12 + 1 < v42 - 1)
              {
                unsigned int v7 = 0;
                do
                {
                  int v91 = *v90++;
                  unsigned int v7 = v91 + (v7 << 8);
                }
                while (v90 < v42 - 1);
                goto LABEL_153;
              }
LABEL_179:
              unsigned int v7 = 0;
              goto LABEL_153;
            }
            unsigned int v35 = 3;
            goto LABEL_132;
          }
LABEL_115:
          unint64_t v67 = v42[2];
          unint64_t v59 = v42 + 2;
          this[3] = v42 + 2;
          this[6] = v42 + 2;
          goto LABEL_116;
        }
LABEL_78:
        unsigned int v14 = v13 + 3;
        unint64_t v53 = v13[3];
        this[3] = v13 + 3;
        this[6] = v13 + 3;
        unsigned __int16 v54 = SLChar::sLexFold[v53 & 0x3F | (SLChar::sUniMap[v53 >> 6] << 6)] + v53;
        if (v54 > 0x26u)
        {
          if (v54 == 39) {
            goto LABEL_115;
          }
          if (v54 <= 0x7Eu) {
            goto LABEL_129;
          }
        }
        else
        {
          if (v54 < 0x20u)
          {
LABEL_174:
            unsigned int v42 = v14;
            goto LABEL_175;
          }
          if (v54 != 32) {
            goto LABEL_129;
          }
        }
LABEL_89:
        unsigned int v35 = 4;
        goto LABEL_133;
      }
      if (v24 < 0x7Fu)
      {
LABEL_63:
        unsigned int v42 = v13 + 2;
        unint64_t v47 = v13[2];
        this[3] = v13 + 2;
        unsigned __int16 v48 = SLChar::sLexFold[v47 & 0x3F | (SLChar::sUniMap[v47 >> 6] << 6)] + v47;
        if (v48 <= 0x26u)
        {
          if (v48 < 0x20u) {
            goto LABEL_38;
          }
          int v44 = v48;
          unsigned int v35 = 1;
LABEL_66:
          if (v44 == 32) {
            goto LABEL_111;
          }
          goto LABEL_107;
        }
        if (v48 != 39)
        {
          unsigned int v50 = v48;
          unsigned int v35 = 1;
          goto LABEL_106;
        }
        goto LABEL_78;
      }
LABEL_25:
      unint64_t v25 = v13[2];
      this[3] = v13 + 2;
      unsigned int v26 = (unsigned __int16)(SLChar::sLexFold[v25 & 0x3F | (SLChar::sUniMap[v25 >> 6] << 6)] + v25);
      if (v26 < 0x20) {
        goto LABEL_38;
      }
      if (v26 == 39)
      {
        unsigned int v14 = v13 + 3;
        unint64_t v27 = v13[3];
        this[3] = v13 + 3;
        this[6] = v13 + 3;
        unsigned int v28 = (unsigned __int16)(SLChar::sLexFold[v27 & 0x3F | (SLChar::sUniMap[v27 >> 6] << 6)] + v27);
        if (v28 < 0x20) {
          goto LABEL_174;
        }
        if (v28 == 39)
        {
LABEL_113:
          unsigned int v68 = v13[4];
          unint64_t v59 = v13 + 4;
          unint64_t v67 = v68;
          this[3] = v59;
          this[6] = v59;
LABEL_116:
          unsigned int v69 = (unsigned __int16)(SLChar::sLexFold[v67 & 0x3F | (SLChar::sUniMap[v67 >> 6] << 6)] + v67);
          if (v69 < 0x20)
          {
            unsigned int v42 = v59;
            goto LABEL_175;
          }
          if (v69 == 39) {
            goto LABEL_170;
          }
          unsigned int v35 = 4;
LABEL_132:
          unsigned int v14 = v59;
          goto LABEL_135;
        }
        goto LABEL_89;
      }
      unsigned int v35 = 1;
LABEL_111:
      unint64_t v65 = v13[3];
      this[3] = v13 + 3;
      unsigned int v66 = (unsigned __int16)(SLChar::sLexFold[v65 & 0x3F | (SLChar::sUniMap[v65 >> 6] << 6)] + v65);
      if (v66 < 0x20) {
        goto LABEL_136;
      }
      if (v66 == 39) {
        goto LABEL_113;
      }
LABEL_133:
      unsigned int v77 = v13[4];
      unint64_t v59 = v13 + 4;
      this[3] = v59;
      unsigned int v78 = (unsigned __int16)(SLChar::sLexFold[v77 & 0x3F | (SLChar::sUniMap[(unint64_t)v77 >> 6] << 6)] + v77);
      if (v78 < 0x20) {
        goto LABEL_136;
      }
      if (v78 == 39) {
        goto LABEL_170;
      }
LABEL_135:
      unint64_t v79 = v59[1];
      this[3] = v59 + 1;
      if ((unsigned __int16)(SLChar::sLexFold[v79 & 0x3F | (SLChar::sUniMap[v79 >> 6] << 6)] + v79) == 39) {
        goto LABEL_171;
      }
LABEL_136:
      this[3] = v14;
      if (v35 <= 2) {
        goto LABEL_137;
      }
      unint64_t v59 = v14;
      unsigned int v42 = v14;
      if (v35 != 3) {
        goto LABEL_175;
      }
LABEL_163:
      if (!a3) {
        return 0;
      }
      unsigned int v7 = 0;
      unint64_t v86 = v59 - 4;
      do
      {
        int v87 = *v86++;
        unsigned int v7 = v87 + (v7 << 8);
      }
      while (v86 < v59);
LABEL_153:
      *a2 = v7;
      return 1;
    case '+':
      LOBYTE(result) = 0;
      char v10 = 0;
      this[3] = v13 + 1;
      goto LABEL_140;
    case '0':
      unsigned int v14 = v13 + 1;
      unint64_t v29 = v13[1];
      this[3] = v13 + 1;
      this[6] = v13 + 1;
      if ((((unsigned __int16)SLChar::sLexFold[v29 & 0x3F | (SLChar::sUniMap[v29 >> 6] << 6)] + v29) & 0xFFDF) != 0x58) {
        goto LABEL_138;
      }
      unsigned int v30 = v13[2];
      this[3] = v13 + 2;
      unsigned __int16 v31 = SLChar::sLexFold[v30 & 0x3F | (SLChar::sUniMap[(unint64_t)v30 >> 6] << 6)] + v30;
      if (v31 > 0x40u)
      {
        char v10 = 1;
        if (v31 >= 0x47u)
        {
          LOBYTE(result) = 0;
          if ((unsigned __int16)(v31 - 103) >= 0xFFFAu) {
            goto LABEL_140;
          }
LABEL_55:
          unsigned int v35 = 0;
          goto LABEL_39;
        }
        LOBYTE(result) = 0;
      }
      else
      {
        if ((unsigned __int16)(v31 - 58) < 0xFFF6u) {
          goto LABEL_55;
        }
        LOBYTE(result) = 0;
LABEL_48:
        char v10 = 1;
      }
      goto LABEL_140;
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
      unsigned int v14 = v13 + 1;
      this[3] = v13 + 1;
      goto LABEL_138;
    default:
      unsigned int v14 = v13 + 1;
      unint64_t v32 = v13[1];
      this[3] = v13 + 1;
      this[6] = v13 + 1;
      if ((unsigned __int16)(v32 + SLChar::sLexFold[v32 & 0x3F | (SLChar::sUniMap[v32 >> 6] << 6)] - 127) < 0xFFA2u) {
        return 0;
      }
      unint64_t v33 = v13[2];
      this[3] = v13 + 2;
      if ((unsigned __int16)(v33 + SLChar::sLexFold[v33 & 0x3F | (SLChar::sUniMap[v33 >> 6] << 6)] - 33) >= 0x5Eu) {
        goto LABEL_38;
      }
      unint64_t v34 = v13[3];
      this[3] = v13 + 3;
      if ((unsigned __int16)(v34 + SLChar::sLexFold[v34 & 0x3F | (SLChar::sUniMap[v34 >> 6] << 6)] - 127) < 0xFFA2u) {
        goto LABEL_38;
      }
      unint64_t v59 = v13 + 4;
      this[3] = v59;
      goto LABEL_163;
  }
}

uint64_t SLLexerImpl::SimpleCommand(unsigned __int16 **this, unsigned int a2, unsigned int a3)
{
  unsigned int v5 = 0;
  unsigned int v6 = a2;
  if (a3 < 2)
  {
    if (!SLLexerImpl::ScanWhole(this, &v5, a3 == 1)) {
      return 0;
    }
LABEL_5:
    SLLexerInstance::CreateCommandToken((SLLexerInstance *)this);
  }
  if (SLLexerImpl::ScanFixed(this, &v5, &v6, a3 == 2)) {
    goto LABEL_5;
  }
  return 0;
}

uint64_t SLLexerImpl::ToBICommand(SLLexerImpl *this)
{
  unsigned int v3 = 0;
  SLLexerImpl::SkipSpaces(this);
  if ((unsigned __int16)(**((_WORD **)this + 3)
                        + SLChar::sLexFold[**((_WORD **)this + 3) & 0x3F | (SLChar::sUniMap[(unint64_t)**((unsigned __int16 **)this + 3) >> 6] << 6)]
                        - 48) > 9u
    || SLLexerImpl::ScanFixed((unsigned __int16 **)this, &v3, 0, 0))
  {
    SLLexerInstance::CreateCommandToken(this);
  }
  return 0;
}

uint64_t SLLexerImpl::NextCommandToken(SLLexerImpl *this)
{
  *((void *)this + 9) = &SLLexerInstance::sNoDelim;
  uint64_t v2 = (unsigned __int16 **)((char *)this + 24);
  uint64_t v3 = 1;
  while (1)
  {
LABEL_2:
    unsigned int v4 = (unsigned __int16 *)*((void *)this + 3);
    if ((uint64_t)(*((void *)this + 5) - (void)v4) <= 3)
    {
      SLLexerInstance::Refill(this);
      unsigned int v4 = (unsigned __int16 *)*((void *)this + 3);
    }
    unint64_t v5 = *v4;
    unint64_t v6 = v5 >> 6;
    int v7 = v5 & 0x3F;
    if (*((unsigned __int16 *)this + 42) == (unsigned __int16)(SLChar::sLexFold[v7 | (SLChar::sUniMap[v5 >> 6] << 6)]
                                                              + v5))
    {
      if (!*((_WORD *)this + 43)) {
        goto LABEL_832;
      }
      if (v4[1] == *((unsigned __int16 *)this + 43))
      {
        uint64_t v3 = 2;
LABEL_832:
        v4 += v3;
        goto LABEL_833;
      }
    }
    *((void *)this + 8) = v4;
    if ((uint64_t)(*((void *)this + 5) - (void)v4) <= 9)
    {
      SLLexerInstance::Refill(this);
      unsigned int v4 = (unsigned __int16 *)*((void *)this + 3);
      unint64_t v5 = *v4;
      unint64_t v6 = v5 >> 6;
      int v7 = v5 & 0x3F;
    }
    unsigned __int16 v8 = SLChar::sLexFold[v7 | (SLChar::sUniMap[v6] << 6)] + v5;
    if (v8 > 0x57u) {
      break;
    }
    if (v8 > 0x45u)
    {
      if (v8 <= 0x50u)
      {
        if (v8 <= 0x4Du)
        {
          if (v8 != 73) {
            goto LABEL_134;
          }
          goto LABEL_33;
        }
        if (v8 != 78)
        {
          if (v8 < 0x50u) {
            goto LABEL_134;
          }
LABEL_143:
          unint64_t v65 = v4[1];
          *((void *)this + 3) = v4 + 1;
          *((void *)this + 6) = v4 + 1;
          unsigned __int16 v66 = SLChar::sLexFold[v65 & 0x3F | (SLChar::sUniMap[v65 >> 6] << 6)] + v65;
          if (v66 > 0x4Du)
          {
            if (v66 <= 0x62u)
            {
              if (v66 != 98) {
                goto LABEL_727;
              }
              goto LABEL_194;
            }
            if (v66 != 109) {
              goto LABEL_727;
            }
LABEL_225:
            unint64_t v106 = v4[2];
            *uint64_t v2 = v4 + 2;
            if ((((unsigned __int16)SLChar::sLexFold[v106 & 0x3F | (SLChar::sUniMap[v106 >> 6] << 6)] + v106) & 0xFFDF) != 0x4F) {
              goto LABEL_726;
            }
            unint64_t v107 = v4[3];
            *uint64_t v2 = v4 + 3;
            if ((((unsigned __int16)SLChar::sLexFold[v107 & 0x3F | (SLChar::sUniMap[v107 >> 6] << 6)] + v107) & 0xFFDF) != 0x44) {
              goto LABEL_726;
            }
            unsigned int v109 = v4[4];
            v108 = v4 + 4;
            *uint64_t v2 = v108;
            unsigned __int16 v110 = SLChar::sLexFold[v109 & 0x3F | (SLChar::sUniMap[(unint64_t)v109 >> 6] << 6)] + v109;
            if (v110 > 0x20u)
            {
              if (v110 > 0xA0u)
              {
                if (v110 != 8239) {
                  goto LABEL_726;
                }
              }
              else if (v110 != 160)
              {
                goto LABEL_726;
              }
            }
            else if (v110 != 9 && v110 != 32)
            {
              goto LABEL_726;
            }
            do
            {
              while (1)
              {
                *((void *)this + 3) = ++v108;
                if (*((unsigned __int16 **)this + 5) == v108)
                {
                  SLLexerInstance::Refill(this);
                  v108 = (unsigned __int16 *)*((void *)this + 3);
                }
                unsigned int v134 = (unsigned __int16)(SLChar::sLexFold[*v108 & 0x3F | (SLChar::sUniMap[(unint64_t)*v108 >> 6] << 6)]
                                        + *v108);
                if (v134 <= 0x20) {
                  break;
                }
                if (v134 > 0xA0)
                {
                  if ((unsigned __int16)(SLChar::sLexFold[*v108 & 0x3F | (SLChar::sUniMap[(unint64_t)*v108 >> 6] << 6)]
                                        + *v108) != 8239)
                    goto LABEL_413;
                }
                else if ((unsigned __int16)(SLChar::sLexFold[*v108 & 0x3F | (SLChar::sUniMap[(unint64_t)*v108 >> 6] << 6)] {
                                           + *v108) != 160)
                }
                {
                  goto LABEL_413;
                }
              }
            }
            while (v134 == 9 || v134 == 32);
LABEL_413:
            v112 = (unsigned __int16 **)this;
            unsigned int v113 = 1886220132;
          }
          else
          {
            if (v66 != 66)
            {
              if (v66 < 0x4Du) {
                goto LABEL_727;
              }
              goto LABEL_225;
            }
LABEL_194:
            unint64_t v88 = v4[2];
            *uint64_t v2 = v4 + 2;
            if ((((unsigned __int16)SLChar::sLexFold[v88 & 0x3F | (SLChar::sUniMap[v88 >> 6] << 6)] + v88) & 0xFFDF) != 0x41) {
              goto LABEL_726;
            }
            unint64_t v89 = v4[3];
            *uint64_t v2 = v4 + 3;
            if ((((unsigned __int16)SLChar::sLexFold[v89 & 0x3F | (SLChar::sUniMap[v89 >> 6] << 6)] + v89) & 0xFFDF) != 0x53) {
              goto LABEL_726;
            }
            unsigned int v91 = v4[4];
            BOOL v90 = v4 + 4;
            *uint64_t v2 = v90;
            unsigned __int16 v92 = SLChar::sLexFold[v91 & 0x3F | (SLChar::sUniMap[(unint64_t)v91 >> 6] << 6)] + v91;
            if (v92 > 0x20u)
            {
              if (v92 > 0xA0u)
              {
                if (v92 != 8239) {
                  goto LABEL_726;
                }
              }
              else if (v92 != 160)
              {
                goto LABEL_726;
              }
            }
            else if (v92 != 9 && v92 != 32)
            {
              goto LABEL_726;
            }
            do
            {
              while (1)
              {
                *((void *)this + 3) = ++v90;
                if (*((unsigned __int16 **)this + 5) == v90)
                {
                  SLLexerInstance::Refill(this);
                  BOOL v90 = (unsigned __int16 *)*((void *)this + 3);
                }
                unsigned int v125 = (unsigned __int16)(SLChar::sLexFold[*v90 & 0x3F | (SLChar::sUniMap[(unint64_t)*v90 >> 6] << 6)]
                                        + *v90);
                if (v125 <= 0x20) {
                  break;
                }
                if (v125 > 0xA0)
                {
                  if ((unsigned __int16)(SLChar::sLexFold[*v90 & 0x3F | (SLChar::sUniMap[(unint64_t)*v90 >> 6] << 6)]
                                        + *v90) != 8239)
                    goto LABEL_354;
                }
                else if ((unsigned __int16)(SLChar::sLexFold[*v90 & 0x3F | (SLChar::sUniMap[(unint64_t)*v90 >> 6] << 6)] {
                                           + *v90) != 160)
                }
                {
                  goto LABEL_354;
                }
              }
            }
            while (v125 == 9 || v125 == 32);
LABEL_354:
            v112 = (unsigned __int16 **)this;
            unsigned int v113 = 1885495667;
          }
LABEL_414:
          unsigned int v132 = 2;
LABEL_415:
          uint64_t v135 = SLLexerImpl::SimpleCommand(v112, v113, v132);
          if (!v135) {
            goto LABEL_727;
          }
          goto LABEL_838;
        }
LABEL_87:
        unint64_t v33 = v4[1];
        *((void *)this + 3) = v4 + 1;
        *((void *)this + 6) = v4 + 1;
        if ((((unsigned __int16)SLChar::sLexFold[v33 & 0x3F | (SLChar::sUniMap[v33 >> 6] << 6)] + v33) & 0xFFDF) != 0x4D) {
          goto LABEL_727;
        }
        unint64_t v34 = v4[2];
        *uint64_t v2 = v4 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v34 & 0x3F | (SLChar::sUniMap[v34 >> 6] << 6)] + v34) & 0xFFDF) != 0x42) {
          goto LABEL_726;
        }
        unint64_t v35 = v4[3];
        *uint64_t v2 = v4 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v35 & 0x3F | (SLChar::sUniMap[v35 >> 6] << 6)] + v35) & 0xFFDF) != 0x52) {
          goto LABEL_726;
        }
        unsigned int v37 = v4[4];
        unint64_t v36 = v4 + 4;
        *uint64_t v2 = v36;
        unsigned __int16 v38 = SLChar::sLexFold[v37 & 0x3F | (SLChar::sUniMap[(unint64_t)v37 >> 6] << 6)] + v37;
        if (v38 <= 0x20u)
        {
          if (v38 == 9) {
            goto LABEL_730;
          }
          BOOL v39 = v38 == 32;
          goto LABEL_739;
        }
        if (v38 <= 0xA0u)
        {
          BOOL v39 = v38 == 160;
LABEL_739:
          while (2)
          {
            if (!v39) {
              goto LABEL_726;
            }
            while (1)
            {
LABEL_730:
              *((void *)this + 3) = ++v36;
              if ((uint64_t)(*((void *)this + 5) - (void)v36) <= 7)
              {
                SLLexerInstance::Refill(this);
                unint64_t v36 = (unsigned __int16 *)*((void *)this + 3);
              }
              unsigned __int16 v38 = SLChar::sLexFold[*v36 & 0x3F | (SLChar::sUniMap[(unint64_t)*v36 >> 6] << 6)] + *v36;
              unsigned int v251 = v38;
              if (v38 > 0x4Eu) {
                break;
              }
              unsigned int v252 = (unsigned __int16)(SLChar::sLexFold[*v36 & 0x3F | (SLChar::sUniMap[(unint64_t)*v36 >> 6] << 6)]
                                      + *v36);
              if (v251 > 0x20)
              {
                if (v252 != 76)
                {
                  if (v252 < 0x4E) {
                    goto LABEL_726;
                  }
                  goto LABEL_750;
                }
                goto LABEL_745;
              }
              if (v252 != 9)
              {
                BOOL v39 = v252 == 32;
                goto LABEL_739;
              }
            }
            if (v38 <= 0x6Eu)
            {
              unsigned int v253 = (unsigned __int16)(SLChar::sLexFold[*v36 & 0x3F | (SLChar::sUniMap[(unint64_t)*v36 >> 6] << 6)]
                                      + *v36);
              if (v253 != 108)
              {
                if (v253 < 0x6E) {
                  goto LABEL_726;
                }
LABEL_750:
                unint64_t v257 = v36[1];
                *uint64_t v2 = v36 + 1;
                if ((((unsigned __int16)SLChar::sLexFold[v257 & 0x3F | (SLChar::sUniMap[v257 >> 6] << 6)] + v257) & 0xFFDF) != 0x4F) {
                  goto LABEL_726;
                }
                unint64_t v258 = v36[2];
                *uint64_t v2 = v36 + 2;
                if ((((unsigned __int16)SLChar::sLexFold[v258 & 0x3F | (SLChar::sUniMap[v258 >> 6] << 6)] + v258) & 0xFFDF) != 0x52) {
                  goto LABEL_726;
                }
                unint64_t v259 = v36[3];
                *uint64_t v2 = v36 + 3;
                if ((((unsigned __int16)SLChar::sLexFold[v259 & 0x3F | (SLChar::sUniMap[v259 >> 6] << 6)] + v259) & 0xFFDF) != 0x4D) {
                  goto LABEL_726;
                }
                *((void *)this + 3) = v36 + 4;
                unsigned int v203 = *((_DWORD *)this + 24) & 0xFFFFFFDF;
                goto LABEL_728;
              }
LABEL_745:
              unint64_t v254 = v36[1];
              *uint64_t v2 = v36 + 1;
              if ((((unsigned __int16)SLChar::sLexFold[v254 & 0x3F | (SLChar::sUniMap[v254 >> 6] << 6)] + v254) & 0xFFDF) != 0x54) {
                goto LABEL_726;
              }
              unint64_t v255 = v36[2];
              *uint64_t v2 = v36 + 2;
              if ((((unsigned __int16)SLChar::sLexFold[v255 & 0x3F | (SLChar::sUniMap[v255 >> 6] << 6)] + v255) & 0xFFDF) != 0x52) {
                goto LABEL_726;
              }
              unint64_t v256 = v36[3];
              *uint64_t v2 = v36 + 3;
              if ((((unsigned __int16)SLChar::sLexFold[v256 & 0x3F | (SLChar::sUniMap[v256 >> 6] << 6)] + v256) & 0xFFDF) != 0x4C) {
                goto LABEL_726;
              }
              *((void *)this + 3) = v36 + 4;
              unsigned int v203 = *((_DWORD *)this + 24) | 0x20;
              goto LABEL_728;
            }
            BOOL v39 = (unsigned __int16)(SLChar::sLexFold[*v36 & 0x3F | (SLChar::sUniMap[(unint64_t)*v36 >> 6] << 6)]
                                   + *v36) == 160;
            if ((unsigned __int16)(SLChar::sLexFold[*v36 & 0x3F | (SLChar::sUniMap[(unint64_t)*v36 >> 6] << 6)]
                                  + *v36) <= 0xA0u)
              continue;
            break;
          }
        }
        BOOL v39 = v38 == 8239;
        goto LABEL_739;
      }
      if (v8 <= 0x53u)
      {
        BOOL v9 = v8 == 82;
        if (v8 < 0x52u) {
          goto LABEL_134;
        }
LABEL_41:
        if (!v9)
        {
          unsigned int v42 = v4[1];
          *((void *)this + 3) = v4 + 1;
          *((void *)this + 6) = v4 + 1;
          unsigned __int16 v43 = SLChar::sLexFold[v42 & 0x3F | (SLChar::sUniMap[(unint64_t)v42 >> 6] << 6)] + v42;
          if (v43 <= 0x59u)
          {
            if (v43 != 76)
            {
              if (v43 < 0x59u) {
                goto LABEL_727;
              }
              goto LABEL_218;
            }
LABEL_172:
            unint64_t v72 = v4[2];
            *uint64_t v2 = v4 + 2;
            if ((((unsigned __int16)SLChar::sLexFold[v72 & 0x3F | (SLChar::sUniMap[v72 >> 6] << 6)] + v72) & 0xFFDF) != 0x4E) {
              goto LABEL_726;
            }
            unint64_t v73 = v4[3];
            *uint64_t v2 = v4 + 3;
            if ((((unsigned __int16)SLChar::sLexFold[v73 & 0x3F | (SLChar::sUniMap[v73 >> 6] << 6)] + v73) & 0xFFDF) != 0x43) {
              goto LABEL_726;
            }
            unsigned int v75 = v4[4];
            unint64_t v74 = v4 + 4;
            *uint64_t v2 = v74;
            unsigned __int16 v76 = SLChar::sLexFold[v75 & 0x3F | (SLChar::sUniMap[(unint64_t)v75 >> 6] << 6)] + v75;
            if (v76 > 0x20u)
            {
              if (v76 > 0xA0u)
              {
                if (v76 != 8239) {
                  goto LABEL_726;
                }
              }
              else if (v76 != 160)
              {
                goto LABEL_726;
              }
            }
            else if (v76 != 9 && v76 != 32)
            {
              goto LABEL_726;
            }
            do
            {
              while (1)
              {
                *((void *)this + 3) = ++v74;
                if (*((unsigned __int16 **)this + 5) == v74)
                {
                  SLLexerInstance::Refill(this);
                  unint64_t v74 = (unsigned __int16 *)*((void *)this + 3);
                }
                unsigned int v124 = (unsigned __int16)(SLChar::sLexFold[*v74 & 0x3F | (SLChar::sUniMap[(unint64_t)*v74 >> 6] << 6)]
                                        + *v74);
                if (v124 <= 0x20) {
                  break;
                }
                if (v124 > 0xA0)
                {
                  if ((unsigned __int16)(SLChar::sLexFold[*v74 & 0x3F | (SLChar::sUniMap[(unint64_t)*v74 >> 6] << 6)]
                                        + *v74) != 8239)
                    goto LABEL_342;
                }
                else if ((unsigned __int16)(SLChar::sLexFold[*v74 & 0x3F | (SLChar::sUniMap[(unint64_t)*v74 >> 6] << 6)] {
                                           + *v74) != 160)
                }
                {
                  goto LABEL_342;
                }
              }
            }
            while (v124 == 9 || v124 == 32);
LABEL_342:
            v112 = (unsigned __int16 **)this;
            unsigned int v113 = 1936485987;
LABEL_388:
            unsigned int v132 = 0;
            goto LABEL_415;
          }
          if (v43 <= 0x6Cu)
          {
            if (v43 != 108) {
              goto LABEL_727;
            }
            goto LABEL_172;
          }
          if (v43 != 121) {
            goto LABEL_727;
          }
LABEL_218:
          unint64_t v101 = v4[2];
          *uint64_t v2 = v4 + 2;
          if ((((unsigned __int16)SLChar::sLexFold[v101 & 0x3F | (SLChar::sUniMap[v101 >> 6] << 6)] + v101) & 0xFFDF) != 0x4E) {
            goto LABEL_726;
          }
          unint64_t v102 = v4[3];
          *uint64_t v2 = v4 + 3;
          if ((((unsigned __int16)SLChar::sLexFold[v102 & 0x3F | (SLChar::sUniMap[v102 >> 6] << 6)] + v102) & 0xFFDF) != 0x43) {
            goto LABEL_726;
          }
          unsigned int v104 = v4[4];
          char v103 = v4 + 4;
          *uint64_t v2 = v103;
          unsigned __int16 v105 = SLChar::sLexFold[v104 & 0x3F | (SLChar::sUniMap[(unint64_t)v104 >> 6] << 6)] + v104;
          if (v105 > 0x20u)
          {
            if (v105 > 0xA0u)
            {
              if (v105 != 8239) {
                goto LABEL_726;
              }
            }
            else if (v105 != 160)
            {
              goto LABEL_726;
            }
          }
          else if (v105 != 9 && v105 != 32)
          {
            goto LABEL_726;
          }
          do
          {
            while (1)
            {
              *((void *)this + 3) = ++v103;
              if (*((unsigned __int16 **)this + 5) == v103)
              {
                SLLexerInstance::Refill(this);
                char v103 = (unsigned __int16 *)*((void *)this + 3);
              }
              unsigned int v133 = (unsigned __int16)(SLChar::sLexFold[*v103 & 0x3F | (SLChar::sUniMap[(unint64_t)*v103 >> 6] << 6)]
                                      + *v103);
              if (v133 <= 0x20) {
                break;
              }
              if (v133 > 0xA0)
              {
                if ((unsigned __int16)(SLChar::sLexFold[*v103 & 0x3F | (SLChar::sUniMap[(unint64_t)*v103 >> 6] << 6)]
                                      + *v103) != 8239)
                  goto LABEL_400;
              }
              else if ((unsigned __int16)(SLChar::sLexFold[*v103 & 0x3F | (SLChar::sUniMap[(unint64_t)*v103 >> 6] << 6)] {
                                         + *v103) != 160)
              }
              {
                goto LABEL_400;
              }
            }
          }
          while (v133 == 9 || v133 == 32);
LABEL_400:
          unsigned int v113 = 1937337955;
          v112 = (unsigned __int16 **)this;
LABEL_401:
          unsigned int v132 = 1;
          goto LABEL_415;
        }
        unsigned int v17 = v4[1];
        *((void *)this + 3) = v4 + 1;
        *((void *)this + 6) = v4 + 1;
        unsigned __int16 v18 = SLChar::sLexFold[v17 & 0x3F | (SLChar::sUniMap[(unint64_t)v17 >> 6] << 6)] + v17;
        if (v18 > 0x53u)
        {
          if (v18 > 0x61u)
          {
            if (v18 != 115) {
              goto LABEL_727;
            }
            goto LABEL_211;
          }
          if (v18 != 97) {
            goto LABEL_727;
          }
        }
        else if (v18 != 65)
        {
          if (v18 < 0x53u) {
            goto LABEL_727;
          }
LABEL_211:
          unint64_t v96 = v4[2];
          *uint64_t v2 = v4 + 2;
          if ((((unsigned __int16)SLChar::sLexFold[v96 & 0x3F | (SLChar::sUniMap[v96 >> 6] << 6)] + v96) & 0xFFDF) != 0x45) {
            goto LABEL_726;
          }
          unint64_t v97 = v4[3];
          *uint64_t v2 = v4 + 3;
          if ((((unsigned __int16)SLChar::sLexFold[v97 & 0x3F | (SLChar::sUniMap[v97 >> 6] << 6)] + v97) & 0xFFDF) != 0x54) {
            goto LABEL_726;
          }
          unsigned int v99 = v4[4];
          v98 = v4 + 4;
          *uint64_t v2 = v98;
          unsigned __int16 v100 = SLChar::sLexFold[v99 & 0x3F | (SLChar::sUniMap[(unint64_t)v99 >> 6] << 6)] + v99;
          if (v100 > 0x20u)
          {
            if (v100 > 0xA0u)
            {
              if (v100 != 8239) {
                goto LABEL_726;
              }
            }
            else if (v100 != 160)
            {
              goto LABEL_726;
            }
          }
          else if (v100 != 9 && v100 != 32)
          {
            goto LABEL_726;
          }
          do
          {
            while (1)
            {
              *((void *)this + 3) = ++v98;
              if (*((unsigned __int16 **)this + 5) == v98)
              {
                SLLexerInstance::Refill(this);
                v98 = (unsigned __int16 *)*((void *)this + 3);
              }
              unsigned int v131 = (unsigned __int16)(SLChar::sLexFold[*v98 & 0x3F | (SLChar::sUniMap[(unint64_t)*v98 >> 6] << 6)]
                                      + *v98);
              if (v131 <= 0x20) {
                break;
              }
              if (v131 > 0xA0)
              {
                if ((unsigned __int16)(SLChar::sLexFold[*v98 & 0x3F | (SLChar::sUniMap[(unint64_t)*v98 >> 6] << 6)]
                                      + *v98) != 8239)
                  goto LABEL_387;
              }
              else if ((unsigned __int16)(SLChar::sLexFold[*v98 & 0x3F | (SLChar::sUniMap[(unint64_t)*v98 >> 6] << 6)] {
                                         + *v98) != 160)
              }
              {
                goto LABEL_387;
              }
            }
          }
          while (v131 == 9 || v131 == 32);
LABEL_387:
          v112 = (unsigned __int16 **)this;
          unsigned int v113 = 1920165236;
          goto LABEL_388;
        }
        unint64_t v67 = v4[2];
        *uint64_t v2 = v4 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v67 & 0x3F | (SLChar::sUniMap[v67 >> 6] << 6)] + v67) & 0xFFDF) != 0x54) {
          goto LABEL_726;
        }
        unint64_t v68 = v4[3];
        *uint64_t v2 = v4 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v68 & 0x3F | (SLChar::sUniMap[v68 >> 6] << 6)] + v68) & 0xFFDF) != 0x45) {
          goto LABEL_726;
        }
        unsigned int v70 = v4[4];
        unsigned int v69 = v4 + 4;
        *uint64_t v2 = v69;
        unsigned __int16 v71 = SLChar::sLexFold[v70 & 0x3F | (SLChar::sUniMap[(unint64_t)v70 >> 6] << 6)] + v70;
        if (v71 > 0x20u)
        {
          if (v71 > 0xA0u)
          {
            if (v71 != 8239) {
              goto LABEL_726;
            }
          }
          else if (v71 != 160)
          {
            goto LABEL_726;
          }
        }
        else if (v71 != 9 && v71 != 32)
        {
          goto LABEL_726;
        }
        do
        {
          while (1)
          {
            *((void *)this + 3) = ++v69;
            if (*((unsigned __int16 **)this + 5) == v69)
            {
              SLLexerInstance::Refill(this);
              unsigned int v69 = (unsigned __int16 *)*((void *)this + 3);
            }
            unsigned int v123 = (unsigned __int16)(SLChar::sLexFold[*v69 & 0x3F | (SLChar::sUniMap[(unint64_t)*v69 >> 6] << 6)]
                                    + *v69);
            if (v123 <= 0x20) {
              break;
            }
            if (v123 > 0xA0)
            {
              if ((unsigned __int16)(SLChar::sLexFold[*v69 & 0x3F | (SLChar::sUniMap[(unint64_t)*v69 >> 6] << 6)]
                                    + *v69) != 8239)
                goto LABEL_330;
            }
            else if ((unsigned __int16)(SLChar::sLexFold[*v69 & 0x3F | (SLChar::sUniMap[(unint64_t)*v69 >> 6] << 6)] {
                                       + *v69) != 160)
            }
            {
              goto LABEL_330;
            }
          }
        }
        while (v123 == 9 || v123 == 32);
LABEL_330:
        v112 = (unsigned __int16 **)this;
        unsigned int v113 = 1918989413;
        goto LABEL_414;
      }
      if (v8 != 86) {
        goto LABEL_134;
      }
LABEL_94:
      unint64_t v40 = v4[1];
      *((void *)this + 3) = v4 + 1;
      *((void *)this + 6) = v4 + 1;
      unsigned __int16 v41 = SLChar::sLexFold[v40 & 0x3F | (SLChar::sUniMap[v40 >> 6] << 6)] + v40;
      if (v41 > 0x4Fu)
      {
        if (v41 > 0x65u)
        {
          if (v41 != 111) {
            goto LABEL_727;
          }
          goto LABEL_186;
        }
        if (v41 != 101) {
          goto LABEL_727;
        }
      }
      else if (v41 != 69)
      {
        if (v41 < 0x4Fu) {
          goto LABEL_727;
        }
LABEL_186:
        unint64_t v83 = v4[2];
        *uint64_t v2 = v4 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v83 & 0x3F | (SLChar::sUniMap[v83 >> 6] << 6)] + v83) & 0xFFDF) != 0x4C) {
          goto LABEL_726;
        }
        unint64_t v84 = v4[3];
        *uint64_t v2 = v4 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v84 & 0x3F | (SLChar::sUniMap[v84 >> 6] << 6)] + v84) & 0xFFDF) != 0x4D) {
          goto LABEL_726;
        }
        unsigned int v86 = v4[4];
        int v85 = v4 + 4;
        *uint64_t v2 = v85;
        unsigned __int16 v87 = SLChar::sLexFold[v86 & 0x3F | (SLChar::sUniMap[(unint64_t)v86 >> 6] << 6)] + v86;
        if (v87 > 0x20u)
        {
          if (v87 > 0xA0u)
          {
            if (v87 != 8239) {
              goto LABEL_726;
            }
          }
          else if (v87 != 160)
          {
            goto LABEL_726;
          }
        }
        else if (v87 != 9 && v87 != 32)
        {
          goto LABEL_726;
        }
        do
        {
          while (1)
          {
            *((void *)this + 3) = ++v85;
            if (*((unsigned __int16 **)this + 5) == v85)
            {
              SLLexerInstance::Refill(this);
              int v85 = (unsigned __int16 *)*((void *)this + 3);
            }
            unsigned int v120 = (unsigned __int16)(SLChar::sLexFold[*v85 & 0x3F | (SLChar::sUniMap[(unint64_t)*v85 >> 6] << 6)]
                                    + *v85);
            if (v120 <= 0x20) {
              break;
            }
            if (v120 > 0xA0)
            {
              if ((unsigned __int16)(SLChar::sLexFold[*v85 & 0x3F | (SLChar::sUniMap[(unint64_t)*v85 >> 6] << 6)]
                                    + *v85) != 8239)
                goto LABEL_309;
            }
            else if ((unsigned __int16)(SLChar::sLexFold[*v85 & 0x3F | (SLChar::sUniMap[(unint64_t)*v85 >> 6] << 6)] {
                                       + *v85) != 160)
            }
            {
              goto LABEL_309;
            }
          }
        }
        while (v120 == 9 || v120 == 32);
LABEL_309:
        v112 = (unsigned __int16 **)this;
        unsigned int v113 = 1987013741;
        goto LABEL_414;
      }
      unint64_t v60 = v4[2];
      *uint64_t v2 = v4 + 2;
      if ((((unsigned __int16)SLChar::sLexFold[v60 & 0x3F | (SLChar::sUniMap[v60 >> 6] << 6)] + v60) & 0xFFDF) != 0x52) {
        goto LABEL_726;
      }
      unint64_t v61 = v4[3];
      *uint64_t v2 = v4 + 3;
      if ((((unsigned __int16)SLChar::sLexFold[v61 & 0x3F | (SLChar::sUniMap[v61 >> 6] << 6)] + v61) & 0xFFDF) != 0x53) {
        goto LABEL_726;
      }
      unsigned int v63 = v4[4];
      unsigned int v62 = v4 + 4;
      *uint64_t v2 = v62;
      unsigned __int16 v64 = SLChar::sLexFold[v63 & 0x3F | (SLChar::sUniMap[(unint64_t)v63 >> 6] << 6)] + v63;
      if (v64 > 0x20u)
      {
        if (v64 > 0xA0u)
        {
          if (v64 != 8239) {
            goto LABEL_726;
          }
        }
        else if (v64 != 160)
        {
          goto LABEL_726;
        }
      }
      else if (v64 != 9 && v64 != 32)
      {
        goto LABEL_726;
      }
      do
      {
        while (1)
        {
          *((void *)this + 3) = ++v62;
          if (*((unsigned __int16 **)this + 5) == v62)
          {
            SLLexerInstance::Refill(this);
            unsigned int v62 = (unsigned __int16 *)*((void *)this + 3);
          }
          unsigned int v111 = (unsigned __int16)(SLChar::sLexFold[*v62 & 0x3F | (SLChar::sUniMap[(unint64_t)*v62 >> 6] << 6)]
                                  + *v62);
          if (v111 <= 0x20) {
            break;
          }
          if (v111 > 0xA0)
          {
            if ((unsigned __int16)(SLChar::sLexFold[*v62 & 0x3F | (SLChar::sUniMap[(unint64_t)*v62 >> 6] << 6)]
                                  + *v62) != 8239)
              goto LABEL_268;
          }
          else if ((unsigned __int16)(SLChar::sLexFold[*v62 & 0x3F | (SLChar::sUniMap[(unint64_t)*v62 >> 6] << 6)] {
                                     + *v62) != 160)
          }
          {
            goto LABEL_268;
          }
        }
      }
      while (v111 == 9 || v111 == 32);
LABEL_268:
      v112 = (unsigned __int16 **)this;
      unsigned int v113 = 1986359923;
      goto LABEL_401;
    }
    if (v8 <= 0xDu)
    {
      if (v8 > 8u)
      {
        if ((unsigned __int16)(v8 - 11) < 2u) {
          goto LABEL_134;
        }
        goto LABEL_105;
      }
      if (!v8)
      {
LABEL_833:
        *((void *)this + 3) = v4;
        unsigned int v287 = *((_DWORD *)this + 24);
        int v288 = *((_DWORD *)this + 25);
        *((_DWORD *)this + 23) = v287;
        if ((v288 ^ v287) >= 0x10) {
          SLLexerImpl::CreateBehaviorToken(this);
        }
        uint64_t v289 = 0;
        uint64_t v290 = *((void *)this + 13);
        *((void *)this + 9) = (char *)this + 80;
        *((void *)this + 10) = v290;
        *((void *)this + 8) = v4;
        SLLexerInstance::Refill(this);
        return v289;
      }
LABEL_134:
      *uint64_t v2 = v4 + 1;
      goto LABEL_727;
    }
    if (v8 <= 0x42u)
    {
      if (v8 != 32) {
        goto LABEL_134;
      }
LABEL_105:
      int v44 = v4 + 1;
      *uint64_t v2 = v4 + 1;
      while (1)
      {
        unsigned int v45 = (unsigned __int16)(SLChar::sLexFold[*v44 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v44 >> 6] << 6)]
                               + *v44);
        if (v45 > 0x1F)
        {
          if (v45 > 0xA0)
          {
            if ((unsigned __int16)(SLChar::sLexFold[*v44 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v44 >> 6] << 6)]
                                  + *v44) != 8239)
              goto LABEL_2;
          }
          else
          {
            unsigned int v47 = (unsigned __int16)(SLChar::sLexFold[*v44 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v44 >> 6] << 6)]
                                   + *v44);
            if (v47 >= 0x21 && v47 != 160) {
              goto LABEL_2;
            }
          }
        }
        else
        {
          unsigned int v46 = (unsigned __int16)(SLChar::sLexFold[*v44 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v44 >> 6] << 6)]
                                 + *v44);
          if (v45 <= 0xA)
          {
            if (v46 < 9) {
              goto LABEL_2;
            }
          }
          else if (v46 != 13)
          {
            goto LABEL_2;
          }
        }
        *((void *)this + 3) = ++v44;
        if (*((_WORD **)this + 5) == v44)
        {
          SLLexerInstance::Refill(this);
          int v44 = (_WORD *)*((void *)this + 3);
        }
      }
    }
    if (v8 != 67)
    {
      if (v8 >= 0x45u) {
        goto LABEL_120;
      }
      goto LABEL_69;
    }
LABEL_82:
    unint64_t v31 = v4[1];
    *((void *)this + 3) = v4 + 1;
    *((void *)this + 6) = v4 + 1;
    unsigned int v32 = (unsigned __int16)(SLChar::sLexFold[v31 & 0x3F | (SLChar::sUniMap[v31 >> 6] << 6)] + v31);
    if (v32 > 0x54)
    {
      if (v32 <= 0x6C)
      {
        if (v32 != 104) {
          goto LABEL_727;
        }
LABEL_128:
        unint64_t v54 = v4[2];
        *uint64_t v2 = v4 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v54 & 0x3F | (SLChar::sUniMap[v54 >> 6] << 6)] + v54) & 0xFFDF) != 0x41) {
          goto LABEL_726;
        }
        unint64_t v55 = v4[3];
        *uint64_t v2 = v4 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v55 & 0x3F | (SLChar::sUniMap[v55 >> 6] << 6)] + v55) & 0xFFDF) != 0x52) {
          goto LABEL_726;
        }
        unsigned int v57 = v4[4];
        unsigned __int16 v56 = v4 + 4;
        *uint64_t v2 = v56;
        unsigned __int16 v58 = SLChar::sLexFold[v57 & 0x3F | (SLChar::sUniMap[(unint64_t)v57 >> 6] << 6)] + v57;
        if (v58 > 0x20u)
        {
          if (v58 > 0xA0u) {
LABEL_762:
          }
            BOOL v59 = v58 == 8239;
          else {
            BOOL v59 = v58 == 160;
          }
        }
        else
        {
          if (v58 == 9) {
            goto LABEL_754;
          }
          BOOL v59 = v58 == 32;
        }
LABEL_763:
        while (2)
        {
          if (!v59) {
            goto LABEL_726;
          }
          while (1)
          {
LABEL_754:
            *((void *)this + 3) = ++v56;
            if ((uint64_t)(*((void *)this + 5) - (void)v56) <= 7)
            {
              SLLexerInstance::Refill(this);
              unsigned __int16 v56 = (unsigned __int16 *)*((void *)this + 3);
            }
            unsigned __int16 v58 = SLChar::sLexFold[*v56 & 0x3F | (SLChar::sUniMap[(unint64_t)*v56 >> 6] << 6)] + *v56;
            unsigned int v260 = v58;
            if (v58 > 0x4Eu) {
              break;
            }
            unsigned int v261 = (unsigned __int16)(SLChar::sLexFold[*v56 & 0x3F | (SLChar::sUniMap[(unint64_t)*v56 >> 6] << 6)]
                                    + *v56);
            if (v260 > 0x20)
            {
              if (v261 != 76)
              {
                if (v261 < 0x4E) {
                  goto LABEL_726;
                }
LABEL_774:
                unint64_t v266 = v56[1];
                *uint64_t v2 = v56 + 1;
                if ((((unsigned __int16)SLChar::sLexFold[v266 & 0x3F | (SLChar::sUniMap[v266 >> 6] << 6)] + v266) & 0xFFDF) == 0x4F)
                {
                  unint64_t v267 = v56[2];
                  *uint64_t v2 = v56 + 2;
                  if ((((unsigned __int16)SLChar::sLexFold[v267 & 0x3F | (SLChar::sUniMap[v267 >> 6] << 6)]
                       + v267) & 0xFFDF) == 0x52)
                  {
                    unint64_t v268 = v56[3];
                    *uint64_t v2 = v56 + 3;
                    if ((((unsigned __int16)SLChar::sLexFold[v268 & 0x3F | (SLChar::sUniMap[v268 >> 6] << 6)]
                         + v268) & 0xFFDF) == 0x4D)
                    {
                      *((void *)this + 3) = v56 + 4;
                      unsigned int v203 = *((_DWORD *)this + 24) & 0xFFFFFFEF;
                      goto LABEL_728;
                    }
                  }
                }
LABEL_726:
                *((void *)this + 3) = *((void *)this + 6);
LABEL_727:
                SLLexerImpl::Error(this);
                SLLexerImpl::SkipToNextCommand(this, 1);
                goto LABEL_2;
              }
LABEL_769:
              unint64_t v263 = v56[1];
              *uint64_t v2 = v56 + 1;
              if ((((unsigned __int16)SLChar::sLexFold[v263 & 0x3F | (SLChar::sUniMap[v263 >> 6] << 6)] + v263) & 0xFFDF) == 0x54)
              {
                unint64_t v264 = v56[2];
                *uint64_t v2 = v56 + 2;
                if ((((unsigned __int16)SLChar::sLexFold[v264 & 0x3F | (SLChar::sUniMap[v264 >> 6] << 6)] + v264) & 0xFFDF) == 0x52)
                {
                  unint64_t v265 = v56[3];
                  *uint64_t v2 = v56 + 3;
                  if ((((unsigned __int16)SLChar::sLexFold[v265 & 0x3F | (SLChar::sUniMap[v265 >> 6] << 6)]
                       + v265) & 0xFFDF) == 0x4C)
                  {
                    *((void *)this + 3) = v56 + 4;
                    unsigned int v203 = *((_DWORD *)this + 24) | 0x10;
                    goto LABEL_728;
                  }
                }
              }
              goto LABEL_726;
            }
            if (v261 != 9)
            {
              BOOL v59 = v261 == 32;
              goto LABEL_763;
            }
          }
          if (v58 > 0x6Eu)
          {
            BOOL v59 = (unsigned __int16)(SLChar::sLexFold[*v56 & 0x3F | (SLChar::sUniMap[(unint64_t)*v56 >> 6] << 6)]
                                   + *v56) == 160;
            if ((unsigned __int16)(SLChar::sLexFold[*v56 & 0x3F | (SLChar::sUniMap[(unint64_t)*v56 >> 6] << 6)]
                                  + *v56) <= 0xA0u)
              continue;
            goto LABEL_762;
          }
          break;
        }
        unsigned int v262 = (unsigned __int16)(SLChar::sLexFold[*v56 & 0x3F | (SLChar::sUniMap[(unint64_t)*v56 >> 6] << 6)]
                                + *v56);
        if (v262 != 108)
        {
          if (v262 < 0x6E) {
            goto LABEL_726;
          }
          goto LABEL_774;
        }
        goto LABEL_769;
      }
      if (v32 != 109)
      {
        if (v32 != 116) {
          goto LABEL_727;
        }
        goto LABEL_180;
      }
    }
    else
    {
      if (v32 <= 0x4C)
      {
        if (v32 != 72) {
          goto LABEL_727;
        }
        goto LABEL_128;
      }
      if (v32 != 77)
      {
        if (v32 <= 0x53) {
          goto LABEL_727;
        }
LABEL_180:
        unint64_t v77 = v4[2];
        *uint64_t v2 = v4 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v77 & 0x3F | (SLChar::sUniMap[v77 >> 6] << 6)] + v77) & 0xFFDF) != 0x58) {
          goto LABEL_726;
        }
        unint64_t v78 = v4[3];
        *uint64_t v2 = v4 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v78 & 0x3F | (SLChar::sUniMap[v78 >> 6] << 6)] + v78) & 0xFFDF) != 0x54) {
          goto LABEL_726;
        }
        unsigned int v80 = v4[4];
        unint64_t v79 = v4 + 4;
        *uint64_t v2 = v79;
        unsigned __int16 v81 = SLChar::sLexFold[v80 & 0x3F | (SLChar::sUniMap[(unint64_t)v80 >> 6] << 6)] + v80;
        if (v81 > 0x20u)
        {
          if (v81 > 0xA0u) {
LABEL_789:
          }
            BOOL v82 = v81 == 8239;
          else {
            BOOL v82 = v81 == 160;
          }
        }
        else
        {
          if (v81 == 9) {
            goto LABEL_778;
          }
          BOOL v82 = v81 == 32;
        }
        while (1)
        {
          if (!v82) {
            goto LABEL_726;
          }
          while (1)
          {
LABEL_778:
            *((void *)this + 3) = ++v79;
            if ((uint64_t)(*((void *)this + 5) - (void)v79) <= 7)
            {
              SLLexerInstance::Refill(this);
              unint64_t v79 = (unsigned __int16 *)*((void *)this + 3);
            }
            unsigned __int16 v81 = SLChar::sLexFold[*v79 & 0x3F | (SLChar::sUniMap[(unint64_t)*v79 >> 6] << 6)] + *v79;
            if (v81 <= 0x57u) {
              break;
            }
            if (v81 <= 0x76u)
            {
              unsigned int v270 = (unsigned __int16)(SLChar::sLexFold[*v79 & 0x3F | (SLChar::sUniMap[(unint64_t)*v79 >> 6] << 6)]
                                      + *v79);
              if (v270 <= 0x6E)
              {
                if (v270 != 110) {
                  goto LABEL_726;
                }
                goto LABEL_797;
              }
              if (v270 != 116) {
                goto LABEL_726;
              }
LABEL_804:
              unint64_t v275 = v79[1];
              *uint64_t v2 = v79 + 1;
              unsigned __int16 v276 = SLChar::sLexFold[v275 & 0x3F | (SLChar::sUniMap[v275 >> 6] << 6)] + v275;
              if (v276 > 0x53u)
              {
                if (v276 <= 0x65u)
                {
                  if (v276 != 101) {
                    goto LABEL_726;
                  }
                  goto LABEL_820;
                }
                if (v276 != 115) {
                  goto LABEL_726;
                }
LABEL_828:
                unint64_t v285 = v79[2];
                *uint64_t v2 = v79 + 2;
                if ((((unsigned __int16)SLChar::sLexFold[v285 & 0x3F | (SLChar::sUniMap[v285 >> 6] << 6)] + v285) & 0xFFDF) != 0x4B) {
                  goto LABEL_726;
                }
                unint64_t v286 = v79[3];
                *uint64_t v2 = v79 + 3;
                if ((((unsigned __int16)SLChar::sLexFold[v286 & 0x3F | (SLChar::sUniMap[v286 >> 6] << 6)] + v286) & 0xFFDF) != 0x50) {
                  goto LABEL_726;
                }
                *((void *)this + 3) = v79 + 4;
                v292 = this;
              }
              else
              {
                if (v276 != 69)
                {
                  if (v276 < 0x53u) {
                    goto LABEL_726;
                  }
                  goto LABEL_828;
                }
LABEL_820:
                unint64_t v281 = v79[2];
                *uint64_t v2 = v79 + 2;
                if ((((unsigned __int16)SLChar::sLexFold[v281 & 0x3F | (SLChar::sUniMap[v281 >> 6] << 6)] + v281) & 0xFFDF) != 0x58) {
                  goto LABEL_726;
                }
                unint64_t v282 = v79[3];
                *uint64_t v2 = v79 + 3;
                if ((((unsigned __int16)SLChar::sLexFold[v282 & 0x3F | (SLChar::sUniMap[v282 >> 6] << 6)] + v282) & 0xFFDF) != 0x54) {
                  goto LABEL_726;
                }
                *((void *)this + 3) = v79 + 4;
                v292 = this;
              }
LABEL_837:
              SLLexerInstance::CreateCommandToken(v292);
            }
            if ((unsigned __int16)(SLChar::sLexFold[*v79 & 0x3F | (SLChar::sUniMap[(unint64_t)*v79 >> 6] << 6)]
                                  + *v79) > 0xA0u)
              goto LABEL_789;
            if ((unsigned __int16)(SLChar::sLexFold[*v79 & 0x3F | (SLChar::sUniMap[(unint64_t)*v79 >> 6] << 6)]
                                  + *v79) < 0x78u)
              goto LABEL_809;
            if ((unsigned __int16)(SLChar::sLexFold[*v79 & 0x3F | (SLChar::sUniMap[(unint64_t)*v79 >> 6] << 6)]
                                  + *v79) < 0xA0u)
              goto LABEL_726;
          }
          if (v81 > 0x4Du) {
            break;
          }
          unsigned int v269 = (unsigned __int16)(SLChar::sLexFold[*v79 & 0x3F | (SLChar::sUniMap[(unint64_t)*v79 >> 6] << 6)]
                                  + *v79);
          BOOL v82 = v269 == 9;
          if (v269 > 9) {
            BOOL v82 = v269 == 32;
          }
        }
        unsigned int v271 = (unsigned __int16)(SLChar::sLexFold[*v79 & 0x3F | (SLChar::sUniMap[(unint64_t)*v79 >> 6] << 6)]
                                + *v79);
        if (v271 <= 0x53)
        {
          if (v271 >= 0x4F) {
            goto LABEL_726;
          }
LABEL_797:
          unint64_t v272 = v79[1];
          *uint64_t v2 = v79 + 1;
          if ((((unsigned __int16)SLChar::sLexFold[v272 & 0x3F | (SLChar::sUniMap[v272 >> 6] << 6)] + v272) & 0xFFDF) != 0x4F) {
            goto LABEL_726;
          }
          unint64_t v273 = v79[2];
          *uint64_t v2 = v79 + 2;
          if ((((unsigned __int16)SLChar::sLexFold[v273 & 0x3F | (SLChar::sUniMap[v273 >> 6] << 6)] + v273) & 0xFFDF) != 0x52) {
            goto LABEL_726;
          }
          unint64_t v274 = v79[3];
          *uint64_t v2 = v79 + 3;
          if ((((unsigned __int16)SLChar::sLexFold[v274 & 0x3F | (SLChar::sUniMap[v274 >> 6] << 6)] + v274) & 0xFFDF) != 0x4D) {
            goto LABEL_726;
          }
          *((void *)this + 3) = v79 + 4;
          v292 = this;
          goto LABEL_837;
        }
        if (v271 == 84) {
          goto LABEL_804;
        }
        if ((unsigned __int16)(SLChar::sLexFold[*v79 & 0x3F | (SLChar::sUniMap[(unint64_t)*v79 >> 6] << 6)]
                              + *v79) < 0x57u)
          goto LABEL_726;
LABEL_809:
        unint64_t v277 = v79[1];
        *uint64_t v2 = v79 + 1;
        unsigned __int16 v278 = SLChar::sLexFold[v277 & 0x3F | (SLChar::sUniMap[v277 >> 6] << 6)] + v277;
        if (v278 > 0x53u)
        {
          if (v278 > 0x6Fu)
          {
            if (v278 != 115) {
              goto LABEL_726;
            }
            goto LABEL_824;
          }
          if (v278 != 111) {
            goto LABEL_726;
          }
        }
        else if (v278 != 79)
        {
          if (v278 < 0x53u) {
            goto LABEL_726;
          }
LABEL_824:
          unint64_t v283 = v79[2];
          *uint64_t v2 = v79 + 2;
          if ((((unsigned __int16)SLChar::sLexFold[v283 & 0x3F | (SLChar::sUniMap[v283 >> 6] << 6)] + v283) & 0xFFDF) != 0x4B) {
            goto LABEL_726;
          }
          unint64_t v284 = v79[3];
          *uint64_t v2 = v79 + 3;
          if ((((unsigned __int16)SLChar::sLexFold[v284 & 0x3F | (SLChar::sUniMap[v284 >> 6] << 6)] + v284) & 0xFFDF) != 0x50) {
            goto LABEL_726;
          }
          *((void *)this + 3) = v79 + 4;
          v292 = this;
          goto LABEL_837;
        }
        unint64_t v279 = v79[2];
        *uint64_t v2 = v79 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v279 & 0x3F | (SLChar::sUniMap[v279 >> 6] << 6)] + v279) & 0xFFDF) != 0x52) {
          goto LABEL_726;
        }
        unint64_t v280 = v79[3];
        *uint64_t v2 = v79 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v280 & 0x3F | (SLChar::sUniMap[v280 >> 6] << 6)] + v280) & 0xFFDF) != 0x44) {
          goto LABEL_726;
        }
        *((void *)this + 3) = v79 + 4;
        v292 = this;
        goto LABEL_837;
      }
    }
    unint64_t v93 = v4[2];
    *uint64_t v2 = v4 + 2;
    if ((((unsigned __int16)SLChar::sLexFold[v93 & 0x3F | (SLChar::sUniMap[v93 >> 6] << 6)] + v93) & 0xFFDF) != 0x4E) {
      goto LABEL_726;
    }
    unint64_t v94 = v4[3];
    *uint64_t v2 = v4 + 3;
    if ((((unsigned __int16)SLChar::sLexFold[v94 & 0x3F | (SLChar::sUniMap[v94 >> 6] << 6)] + v94) & 0xFFDF) != 0x54) {
      goto LABEL_726;
    }
    for (uint64_t i = v4 + 4; ; ++i)
    {
      *((void *)this + 3) = i;
      *((void *)this + 8) = i;
      if ((uint64_t)(*((void *)this + 5) - i) <= 3)
      {
        SLLexerInstance::Refill(this);
        uint64_t i = (unsigned __int16 *)*((void *)this + 3);
      }
      if (!(SLChar::sLexFold[*i & 0x3F | (SLChar::sUniMap[(unint64_t)*i >> 6] << 6)] + *i)
        || *((unsigned __int16 *)this + 42) == (unsigned __int16)(SLChar::sLexFold[*i & 0x3F | (SLChar::sUniMap[(unint64_t)*i >> 6] << 6)]
                                                                + *i)
        && (!*((_WORD *)this + 43) || i[1] == *((unsigned __int16 *)this + 43)))
      {
        break;
      }
    }
  }
  if (v8 > 0x70u)
  {
    if (v8 > 0x77u)
    {
      if (v8 > 0xA0u)
      {
        if (v8 != 8239) {
          goto LABEL_134;
        }
        goto LABEL_105;
      }
      if (v8 < 0x79u) {
        goto LABEL_49;
      }
      if (v8 >= 0xA0u) {
        goto LABEL_105;
      }
      goto LABEL_134;
    }
    if (v8 <= 0x73u)
    {
      BOOL v9 = v8 == 114;
      if (v8 < 0x72u) {
        goto LABEL_134;
      }
      goto LABEL_41;
    }
    if (v8 != 118) {
      goto LABEL_134;
    }
    goto LABEL_94;
  }
  if (v8 > 0x65u)
  {
    if (v8 > 0x6Du)
    {
      if (v8 != 110)
      {
        if (v8 < 0x70u) {
          goto LABEL_134;
        }
        goto LABEL_143;
      }
      goto LABEL_87;
    }
    if (v8 != 105) {
      goto LABEL_134;
    }
LABEL_33:
    unint64_t v10 = v4[1];
    *((void *)this + 3) = v4 + 1;
    *((void *)this + 6) = v4 + 1;
    if ((((unsigned __int16)SLChar::sLexFold[v10 & 0x3F | (SLChar::sUniMap[v10 >> 6] << 6)] + v10) & 0xFFDF) != 0x4E) {
      goto LABEL_727;
    }
    unint64_t v11 = v4[2];
    *uint64_t v2 = v4 + 2;
    if ((((unsigned __int16)SLChar::sLexFold[v11 & 0x3F | (SLChar::sUniMap[v11 >> 6] << 6)] + v11) & 0xFFDF) != 0x50) {
      goto LABEL_726;
    }
    unint64_t v12 = v4[3];
    *uint64_t v2 = v4 + 3;
    if ((((unsigned __int16)SLChar::sLexFold[v12 & 0x3F | (SLChar::sUniMap[v12 >> 6] << 6)] + v12) & 0xFFDF) != 0x54) {
      goto LABEL_726;
    }
    unsigned int v14 = v4[4];
    unint64_t v13 = v4 + 4;
    *uint64_t v2 = v13;
    unsigned __int16 v15 = SLChar::sLexFold[v14 & 0x3F | (SLChar::sUniMap[(unint64_t)v14 >> 6] << 6)] + v14;
    if (v15 > 0x20u)
    {
      if (v15 > 0xA0u) {
        goto LABEL_694;
      }
      BOOL v16 = v15 == 160;
    }
    else
    {
      if (v15 == 9) {
        goto LABEL_686;
      }
      BOOL v16 = v15 == 32;
    }
LABEL_695:
    while (2)
    {
      if (!v16) {
        goto LABEL_726;
      }
      while (1)
      {
LABEL_686:
        *((void *)this + 3) = ++v13;
        if ((uint64_t)(*((void *)this + 5) - (void)v13) <= 7)
        {
          SLLexerInstance::Refill(this);
          unint64_t v13 = (unsigned __int16 *)*((void *)this + 3);
        }
        unsigned __int16 v15 = SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)] + *v13;
        if (v15 > 0x54u) {
          break;
        }
        if (v15 > 0x20u)
        {
          BOOL v238 = (unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)]
                                  + *v13) == 80;
          if ((unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)]
                                + *v13) > 0x50u)
          {
            if ((unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)]
                                  + *v13) < 0x53u)
              goto LABEL_726;
            if ((unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)]
                                  + *v13) != 83)
              goto LABEL_700;
LABEL_713:
            unint64_t v244 = v13[1];
            *uint64_t v2 = v13 + 1;
            if ((((unsigned __int16)SLChar::sLexFold[v244 & 0x3F | (SLChar::sUniMap[v244 >> 6] << 6)] + v244) & 0xFFDF) != 0x4F) {
              goto LABEL_726;
            }
            unint64_t v245 = v13[2];
            *uint64_t v2 = v13 + 2;
            if ((((unsigned __int16)SLChar::sLexFold[v245 & 0x3F | (SLChar::sUniMap[v245 >> 6] << 6)] + v245) & 0xFFDF) != 0x4E) {
              goto LABEL_726;
            }
            unint64_t v246 = v13[3];
            *uint64_t v2 = v13 + 3;
            if ((((unsigned __int16)SLChar::sLexFold[v246 & 0x3F | (SLChar::sUniMap[v246 >> 6] << 6)] + v246) & 0xFFDF) != 0x47) {
              goto LABEL_726;
            }
            *((void *)this + 3) = v13 + 4;
            unsigned int v203 = *((_DWORD *)this + 24) & 0xFFFFFFF0 | 4;
LABEL_728:
            *((_DWORD *)this + 24) = v203;
LABEL_729:
            SLLexerImpl::SkipToNextCommand(this, 0);
            goto LABEL_2;
          }
LABEL_705:
          if (!v238) {
            goto LABEL_726;
          }
          unint64_t v241 = v13[1];
          *uint64_t v2 = v13 + 1;
          if ((((unsigned __int16)SLChar::sLexFold[v241 & 0x3F | (SLChar::sUniMap[v241 >> 6] << 6)] + v241) & 0xFFDF) != 0x48) {
            goto LABEL_726;
          }
          unint64_t v242 = v13[2];
          *uint64_t v2 = v13 + 2;
          if ((((unsigned __int16)SLChar::sLexFold[v242 & 0x3F | (SLChar::sUniMap[v242 >> 6] << 6)] + v242) & 0xFFDF) != 0x4F) {
            goto LABEL_726;
          }
          unint64_t v243 = v13[3];
          *uint64_t v2 = v13 + 3;
          if ((((unsigned __int16)SLChar::sLexFold[v243 & 0x3F | (SLChar::sUniMap[v243 >> 6] << 6)] + v243) & 0xFFDF) != 0x4E) {
            goto LABEL_726;
          }
          *((void *)this + 3) = v13 + 4;
          unsigned int v203 = *((_DWORD *)this + 24) & 0xFFFFFFF0 | 2;
          goto LABEL_728;
        }
        int v237 = (unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)]
                                + *v13);
        if (v237 != 9)
        {
          BOOL v16 = v237 == 32;
          goto LABEL_695;
        }
      }
      if (v15 > 0x74u)
      {
        BOOL v16 = (unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)]
                               + *v13) == 160;
        if ((unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)]
                              + *v13) <= 0xA0u)
          continue;
LABEL_694:
        BOOL v16 = v15 == 8239;
        continue;
      }
      break;
    }
    BOOL v238 = (unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)] + *v13) == 112;
    if ((unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)] + *v13) <= 0x70u) {
      goto LABEL_705;
    }
    if ((unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)] + *v13) < 0x73u) {
      goto LABEL_726;
    }
    if ((unsigned __int16)(SLChar::sLexFold[*v13 & 0x3F | (SLChar::sUniMap[(unint64_t)*v13 >> 6] << 6)] + *v13) == 115) {
      goto LABEL_713;
    }
LABEL_700:
    unint64_t v239 = v13[1];
    *uint64_t v2 = v13 + 1;
    unsigned __int16 v240 = SLChar::sLexFold[v239 & 0x3F | (SLChar::sUniMap[v239 >> 6] << 6)] + v239;
    if (v240 > 0x55u)
    {
      if (v240 > 0x65u)
      {
        if (v240 != 117) {
          goto LABEL_726;
        }
LABEL_723:
        unint64_t v249 = v13[2];
        *uint64_t v2 = v13 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v249 & 0x3F | (SLChar::sUniMap[v249 >> 6] << 6)] + v249) & 0xFFDF) != 0x4E) {
          goto LABEL_726;
        }
        unint64_t v250 = v13[3];
        *uint64_t v2 = v13 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v250 & 0x3F | (SLChar::sUniMap[v250 >> 6] << 6)] + v250) & 0xFFDF) != 0x45) {
          goto LABEL_726;
        }
        *((void *)this + 3) = v13 + 4;
        unsigned int v203 = *((_DWORD *)this + 24) & 0xFFFFFFF0 | 3;
        goto LABEL_728;
      }
      if (v240 != 101) {
        goto LABEL_726;
      }
    }
    else if (v240 != 69)
    {
      if (v240 < 0x55u) {
        goto LABEL_726;
      }
      goto LABEL_723;
    }
    unint64_t v247 = v13[2];
    *uint64_t v2 = v13 + 2;
    if ((((unsigned __int16)SLChar::sLexFold[v247 & 0x3F | (SLChar::sUniMap[v247 >> 6] << 6)] + v247) & 0xFFDF) != 0x58) {
      goto LABEL_726;
    }
    unint64_t v248 = v13[3];
    *uint64_t v2 = v13 + 3;
    if ((((unsigned __int16)SLChar::sLexFold[v248 & 0x3F | (SLChar::sUniMap[v248 >> 6] << 6)] + v248) & 0xFFDF) != 0x54) {
      goto LABEL_726;
    }
    *((void *)this + 3) = v13 + 4;
    unsigned int v203 = *((_DWORD *)this + 24) & 0xFFFFFFF0;
    goto LABEL_728;
  }
  if (v8 > 0x62u)
  {
    if (v8 != 99)
    {
      if (v8 >= 0x65u)
      {
LABEL_120:
        unint64_t v48 = v4[1];
        *((void *)this + 3) = v4 + 1;
        *((void *)this + 6) = v4 + 1;
        if ((((unsigned __int16)SLChar::sLexFold[v48 & 0x3F | (SLChar::sUniMap[v48 >> 6] << 6)] + v48) & 0xFFDF) != 0x4D) {
          goto LABEL_727;
        }
        unint64_t v49 = v4[2];
        *uint64_t v2 = v4 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v49 & 0x3F | (SLChar::sUniMap[v49 >> 6] << 6)] + v49) & 0xFFDF) != 0x50) {
          goto LABEL_726;
        }
        unint64_t v50 = v4[3];
        *uint64_t v2 = v4 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v50 & 0x3F | (SLChar::sUniMap[v50 >> 6] << 6)] + v50) & 0xFFDF) != 0x48) {
          goto LABEL_726;
        }
        unsigned int v52 = v4[4];
        unint64_t v51 = v4 + 4;
        *uint64_t v2 = v51;
        unsigned __int16 v53 = SLChar::sLexFold[v52 & 0x3F | (SLChar::sUniMap[(unint64_t)v52 >> 6] << 6)] + v52;
        if (v53 == 43 || v53 == 45) {
          goto LABEL_726;
        }
        while (1)
        {
          if (v53 > 0x2Bu)
          {
            if (v53 <= 0x9Fu)
            {
              if (v53 != 45) {
                goto LABEL_726;
              }
              *((void *)this + 3) = v51 + 1;
              *((unsigned char *)this + 88) = 4;
              goto LABEL_729;
            }
            if (v53 != 160 && v53 != 8239) {
              goto LABEL_726;
            }
          }
          else if (v53 > 0x1Fu)
          {
            if (v53 != 32)
            {
              if (v53 < 0x2Bu) {
                goto LABEL_726;
              }
              *((void *)this + 3) = v51 + 1;
              *((unsigned char *)this + 88) = 1;
              goto LABEL_729;
            }
          }
          else if (v53 != 9)
          {
            goto LABEL_726;
          }
          *((void *)this + 3) = ++v51;
          if (*((unsigned __int16 **)this + 5) == v51)
          {
            SLLexerInstance::Refill(this);
            unint64_t v51 = (unsigned __int16 *)*((void *)this + 3);
          }
          unsigned __int16 v53 = SLChar::sLexFold[*v51 & 0x3F | (SLChar::sUniMap[(unint64_t)*v51 >> 6] << 6)] + *v51;
        }
      }
LABEL_69:
      unint64_t v25 = v4[1];
      *((void *)this + 3) = v4 + 1;
      *((void *)this + 6) = v4 + 1;
      if ((((unsigned __int16)SLChar::sLexFold[v25 & 0x3F | (SLChar::sUniMap[v25 >> 6] << 6)] + v25) & 0xFFDF) != 0x4C) {
        goto LABEL_727;
      }
      unint64_t v26 = v4[2];
      *uint64_t v2 = v4 + 2;
      if ((((unsigned __int16)SLChar::sLexFold[v26 & 0x3F | (SLChar::sUniMap[v26 >> 6] << 6)] + v26) & 0xFFDF) != 0x49) {
        goto LABEL_726;
      }
      unint64_t v27 = v4[3];
      *uint64_t v2 = v4 + 3;
      if ((((unsigned __int16)SLChar::sLexFold[v27 & 0x3F | (SLChar::sUniMap[v27 >> 6] << 6)] + v27) & 0xFFDF) != 0x4D) {
        goto LABEL_726;
      }
      unsigned int v29 = v4[4];
      unsigned int v28 = v4 + 4;
      *uint64_t v2 = v28;
      unsigned __int16 v30 = SLChar::sLexFold[v29 & 0x3F | (SLChar::sUniMap[(unint64_t)v29 >> 6] << 6)] + v29;
      if (v30 > 0x20u)
      {
        if (v30 > 0xA0u)
        {
          if (v30 != 8239) {
            goto LABEL_726;
          }
        }
        else if (v30 != 160)
        {
          goto LABEL_726;
        }
      }
      else if (v30 != 9 && v30 != 32)
      {
        goto LABEL_726;
      }
      do
      {
        while (1)
        {
          while (1)
          {
            *((void *)this + 3) = ++v28;
            if ((uint64_t)(*((void *)this + 5) - (void)v28) <= 5)
            {
              SLLexerInstance::Refill(this);
              unsigned int v28 = (unsigned __int16 *)*((void *)this + 3);
            }
            unsigned int v114 = (unsigned __int16)(SLChar::sLexFold[*v28 & 0x3F | (SLChar::sUniMap[(unint64_t)*v28 >> 6] << 6)]
                                    + *v28);
            if (v114 > 0x3A) {
              break;
            }
            int v115 = (unsigned __int16)(SLChar::sLexFold[*v28 & 0x3F | (SLChar::sUniMap[(unint64_t)*v28 >> 6] << 6)]
                                    + *v28);
            if (v114 > 9)
            {
              if (v115 != 32) {
                goto LABEL_294;
              }
            }
            else if (v115 != 9)
            {
              goto LABEL_294;
            }
          }
          if (v114 <= 0xA0) {
            break;
          }
          if ((unsigned __int16)(SLChar::sLexFold[*v28 & 0x3F | (SLChar::sUniMap[(unint64_t)*v28 >> 6] << 6)]
                                + *v28) != 8239)
            goto LABEL_294;
        }
        unsigned int v116 = (unsigned __int16)(SLChar::sLexFold[*v28 & 0x3F | (SLChar::sUniMap[(unint64_t)*v28 >> 6] << 6)]
                                + *v28);
        if (v116 < 0x3C) {
          goto LABEL_726;
        }
      }
      while (v116 > 0x9F);
LABEL_294:
      v117 = v28 + 1;
      unint64_t v118 = v28[1];
      *uint64_t v2 = v28 + 1;
      unsigned __int16 v119 = SLChar::sLexFold[v118 & 0x3F | (SLChar::sUniMap[v118 >> 6] << 6)] + v118;
      if (v119 > 0x3Au)
      {
        if (v119 > 0xA0u)
        {
          if (v119 == 8239) {
            goto LABEL_437;
          }
        }
        else
        {
          if (v119 < 0x3Cu) {
            goto LABEL_726;
          }
          if (v119 >= 0xA0u) {
            goto LABEL_437;
          }
        }
      }
      else if (v119 > 9u)
      {
        if (v119 == 32) {
          goto LABEL_437;
        }
      }
      else if (v119 == 9)
      {
        goto LABEL_437;
      }
      unsigned int v136 = v28[2];
      v117 = v28 + 2;
      *uint64_t v2 = v28 + 2;
      unsigned __int16 v137 = SLChar::sLexFold[v136 & 0x3F | (SLChar::sUniMap[(unint64_t)v136 >> 6] << 6)] + v136;
      if (v137 > 0x20u)
      {
        if (v137 > 0xA0u)
        {
          if (v137 != 8239) {
            goto LABEL_726;
          }
        }
        else if (v137 != 160)
        {
          goto LABEL_726;
        }
      }
      else if (v137 != 9 && v137 != 32)
      {
        goto LABEL_726;
      }
      do
      {
        while (1)
        {
          while (1)
          {
LABEL_437:
            *((void *)this + 3) = ++v117;
            if ((uint64_t)(*((void *)this + 5) - (void)v117) <= 3)
            {
              SLLexerInstance::Refill(this);
              v117 = (unsigned __int16 *)*((void *)this + 3);
            }
            unsigned int v144 = (unsigned __int16)(SLChar::sLexFold[*v117 & 0x3F | (SLChar::sUniMap[(unint64_t)*v117 >> 6] << 6)]
                                    + *v117);
            if (v144 > 0x3A) {
              break;
            }
            int v145 = (unsigned __int16)(SLChar::sLexFold[*v117 & 0x3F | (SLChar::sUniMap[(unint64_t)*v117 >> 6] << 6)]
                                    + *v117);
            if (v144 > 9)
            {
              if (v145 != 32) {
                goto LABEL_450;
              }
            }
            else if (v145 != 9)
            {
              goto LABEL_450;
            }
          }
          if (v144 <= 0xA0) {
            break;
          }
          if ((unsigned __int16)(SLChar::sLexFold[*v117 & 0x3F | (SLChar::sUniMap[(unint64_t)*v117 >> 6] << 6)]
                                + *v117) != 8239)
            goto LABEL_450;
        }
        unsigned int v146 = (unsigned __int16)(SLChar::sLexFold[*v117 & 0x3F | (SLChar::sUniMap[(unint64_t)*v117 >> 6] << 6)]
                                + *v117);
        if (v146 < 0x3C) {
          goto LABEL_726;
        }
      }
      while (v146 >= 0xA0);
LABEL_450:
      v147 = v117 + 1;
      unint64_t v148 = v117[1];
      *uint64_t v2 = v117 + 1;
      unsigned __int16 v149 = SLChar::sLexFold[v148 & 0x3F | (SLChar::sUniMap[v148 >> 6] << 6)] + v148;
      if (v149 > 0x3Au)
      {
        if (v149 <= 0xA0u)
        {
          if (v149 < 0x3Cu || v149 == 160) {
            goto LABEL_462;
          }
          goto LABEL_461;
        }
        if (v149 != 8239) {
          goto LABEL_461;
        }
      }
      else
      {
        if (v149 > 9u)
        {
          if (v149 == 32) {
            goto LABEL_462;
          }
        }
        else if (v149 == 9)
        {
          goto LABEL_462;
        }
LABEL_461:
        v147 = v117 + 2;
        *uint64_t v2 = v117 + 2;
      }
LABEL_462:
      unsigned int v295 = 0;
      v150 = SLLexerImpl::SpaceDelimitedToken(this, (unsigned __int16 *)(*((void *)this + 8) + 10), v147, &v295);
      unsigned __int16 v151 = 0;
      *((void *)this + 8) = v150;
      *((_WORD *)this + 52) = *v150;
      uint64_t v152 = v295;
      if (v295 >= 2) {
        unsigned __int16 v151 = v150[1];
      }
      *((_WORD *)this + 53) = v151;
      v153 = SLLexerImpl::SpaceDelimitedToken(this, &v150[v152 + 1], *((unsigned __int16 **)this + 3), &v295);
      *((void *)this + 8) = v153;
      *((_WORD *)this + 54) = *v153;
      if (v295 < 2) {
        unsigned __int16 v154 = 0;
      }
      else {
        unsigned __int16 v154 = v153[1];
      }
      *((_WORD *)this + 55) = v154;
      goto LABEL_729;
    }
    goto LABEL_82;
  }
  if (v8 >= 0x59u) {
    goto LABEL_134;
  }
LABEL_49:
  unint64_t v19 = v4[1];
  *((void *)this + 3) = v4 + 1;
  *((void *)this + 6) = v4 + 1;
  if ((((unsigned __int16)SLChar::sLexFold[v19 & 0x3F | (SLChar::sUniMap[v19 >> 6] << 6)] + v19) & 0xFFDF) != 0x54) {
    goto LABEL_727;
  }
  unint64_t v20 = v4[2];
  *uint64_t v2 = v4 + 2;
  if ((((unsigned __int16)SLChar::sLexFold[v20 & 0x3F | (SLChar::sUniMap[v20 >> 6] << 6)] + v20) & 0xFFDF) != 0x4E) {
    goto LABEL_726;
  }
  unint64_t v21 = v4[3];
  *uint64_t v2 = v4 + 3;
  if ((((unsigned __int16)SLChar::sLexFold[v21 & 0x3F | (SLChar::sUniMap[v21 >> 6] << 6)] + v21) & 0xFFDF) != 0x44) {
    goto LABEL_726;
  }
  unsigned int v23 = v4[4];
  unsigned __int16 v22 = v4 + 4;
  *uint64_t v2 = v22;
  unsigned __int16 v24 = SLChar::sLexFold[v23 & 0x3F | (SLChar::sUniMap[(unint64_t)v23 >> 6] << 6)] + v23;
  if ((v24 & 0xFFDF) == 0x4D) {
    goto LABEL_726;
  }
  while (2)
  {
    if (v24 <= 0x4Du)
    {
      if (v24 > 0x1Fu)
      {
        if (v24 != 32)
        {
          if (v24 < 0x4Du) {
            goto LABEL_726;
          }
          goto LABEL_315;
        }
      }
      else if (v24 != 9)
      {
        goto LABEL_726;
      }
      goto LABEL_62;
    }
    if (v24 > 0x9Fu)
    {
      if (v24 != 160 && v24 != 8239) {
        goto LABEL_726;
      }
LABEL_62:
      *((void *)this + 3) = ++v22;
      if ((uint64_t)(*((void *)this + 5) - (void)v22) <= 9)
      {
        SLLexerInstance::Refill(this);
        unsigned __int16 v22 = (unsigned __int16 *)*((void *)this + 3);
      }
      unsigned __int16 v24 = SLChar::sLexFold[*v22 & 0x3F | (SLChar::sUniMap[(unint64_t)*v22 >> 6] << 6)] + *v22;
      continue;
    }
    break;
  }
  if (v24 != 109) {
    goto LABEL_726;
  }
LABEL_315:
  unint64_t v121 = v22[1];
  *uint64_t v2 = v22 + 1;
  unsigned __int16 v122 = SLChar::sLexFold[v121 & 0x3F | (SLChar::sUniMap[v121 >> 6] << 6)] + v121;
  if (v122 > 0x54u)
  {
    if (v122 > 0x65u)
    {
      if (v122 != 116) {
        goto LABEL_726;
      }
LABEL_428:
      unsigned int v139 = v22[2];
      v138 = v22 + 2;
      *uint64_t v2 = v138;
      if ((((unsigned __int16)SLChar::sLexFold[v139 & 0x3F | (SLChar::sUniMap[(unint64_t)v139 >> 6] << 6)] + v139) & 0xFFDF) != 0x4C) {
        goto LABEL_726;
      }
      goto LABEL_429;
    }
    if (v122 != 101) {
      goto LABEL_726;
    }
  }
  else if (v122 != 69)
  {
    if (v122 < 0x54u) {
      goto LABEL_726;
    }
    goto LABEL_428;
  }
  unint64_t v126 = v22[2];
  *uint64_t v2 = v22 + 2;
  if ((((unsigned __int16)SLChar::sLexFold[v126 & 0x3F | (SLChar::sUniMap[v126 >> 6] << 6)] + v126) & 0xFFDF) != 0x4F) {
    goto LABEL_726;
  }
  unint64_t v127 = v22[3];
  *uint64_t v2 = v22 + 3;
  if ((((unsigned __int16)SLChar::sLexFold[v127 & 0x3F | (SLChar::sUniMap[v127 >> 6] << 6)] + v127) & 0xFFDF) != 0x57) {
    goto LABEL_726;
  }
  unsigned int v129 = v22[4];
  v128 = v22 + 4;
  *uint64_t v2 = v128;
  unsigned __int16 v130 = SLChar::sLexFold[v129 & 0x3F | (SLChar::sUniMap[(unint64_t)v129 >> 6] << 6)] + v129;
  if (v130 >= 0x41u && (v130 < 0x5Bu || (unsigned __int16)(v130 - 97) < 0x1Au)) {
    goto LABEL_726;
  }
  while (2)
  {
    if (v130 <= 0x5Au)
    {
      if (v130 > 0x1Fu)
      {
        if (v130 != 32)
        {
          if (v130 < 0x41u) {
            goto LABEL_726;
          }
          goto LABEL_489;
        }
      }
      else if (v130 != 9)
      {
        goto LABEL_726;
      }
      goto LABEL_371;
    }
    if (v130 > 0x9Fu)
    {
      if (v130 != 160 && v130 != 8239) {
        goto LABEL_726;
      }
LABEL_371:
      *((void *)this + 3) = ++v128;
      if ((uint64_t)(*((void *)this + 5) - (void)v128) <= 7)
      {
        SLLexerInstance::Refill(this);
        v128 = (unsigned __int16 *)*((void *)this + 3);
      }
      unsigned __int16 v130 = SLChar::sLexFold[*v128 & 0x3F | (SLChar::sUniMap[(unint64_t)*v128 >> 6] << 6)] + *v128;
      continue;
    }
    break;
  }
  if ((unsigned __int16)(v130 - 123) < 0xFFE6u) {
    goto LABEL_726;
  }
LABEL_489:
  unint64_t v158 = v128[1];
  *uint64_t v2 = v128 + 1;
  unsigned __int16 v159 = SLChar::sLexFold[v158 & 0x3F | (SLChar::sUniMap[v158 >> 6] << 6)] + v158;
  if (v159 < 0x41u || v159 >= 0x5Bu && (unsigned __int16)(v159 - 123) < 0xFFE6u) {
    goto LABEL_726;
  }
  unint64_t v160 = v128[2];
  *uint64_t v2 = v128 + 2;
  unsigned __int16 v161 = SLChar::sLexFold[v160 & 0x3F | (SLChar::sUniMap[v160 >> 6] << 6)] + v160;
  if (v161 < 0x41u || v161 >= 0x5Bu && (unsigned __int16)(v161 - 123) < 0xFFE6u) {
    goto LABEL_726;
  }
  unint64_t v162 = v128[3];
  *uint64_t v2 = v128 + 3;
  unsigned __int16 v163 = SLChar::sLexFold[v162 & 0x3F | (SLChar::sUniMap[v162 >> 6] << 6)] + v162;
  if (v163 < 0x41u || v163 >= 0x5Bu && (unsigned __int16)(v163 - 123) < 0xFFE6u) {
    goto LABEL_726;
  }
  uint64_t v164 = 0;
  int v165 = 0;
  *uint64_t v2 = v128 + 4;
  do
    int v165 = v128[v164++] + (v165 << 8);
  while (v164 != 4);
  unsigned int v293 = 0;
  unsigned int v294 = 0;
  if (SLLexerImpl::ScanFixed((unsigned __int16 **)this, &v294, 0, 0)
    && SLLexerImpl::ScanWhole((unsigned __int16 **)this, &v293, 0))
  {
    int v166 = v165 | 0x20202020;
    if ((v165 | 0x20202020) != 0x666F7263 && v166 != 1870030194 && v166 != 1986360431)
    {
      *uint64_t v2 = v128;
      goto LABEL_727;
    }
    v292 = this;
    goto LABEL_837;
  }
  v138 = *v2;
LABEL_429:
  unint64_t v140 = v138[1];
  *uint64_t v2 = v138 + 1;
  if ((((unsigned __int16)SLChar::sLexFold[v140 & 0x3F | (SLChar::sUniMap[v140 >> 6] << 6)] + v140) & 0xFFDF) != 0x4B) {
    goto LABEL_726;
  }
  unsigned int v142 = v138[2];
  v141 = v138 + 2;
  *uint64_t v2 = v141;
  unsigned __int16 v143 = SLChar::sLexFold[v142 & 0x3F | (SLChar::sUniMap[(unint64_t)v142 >> 6] << 6)] + v142;
  if (v143 > 0x20u)
  {
    if (v143 > 0xA0u)
    {
      if (v143 != 8239) {
        goto LABEL_726;
      }
    }
    else if (v143 != 160)
    {
      goto LABEL_726;
    }
  }
  else if (v143 != 9 && v143 != 32)
  {
    goto LABEL_726;
  }
  while (1)
  {
LABEL_474:
    *((void *)this + 3) = ++v141;
    if ((uint64_t)(*((void *)this + 5) - (void)v141) <= 9)
    {
      SLLexerInstance::Refill(this);
      v141 = (unsigned __int16 *)*((void *)this + 3);
    }
    unsigned int v155 = (unsigned __int16)(SLChar::sLexFold[*v141 & 0x3F | (SLChar::sUniMap[(unint64_t)*v141 >> 6] << 6)]
                            + *v141);
    if (v155 <= 0x54) {
      break;
    }
    if (v155 <= 0x73)
    {
      unsigned int v168 = (unsigned __int16)(SLChar::sLexFold[*v141 & 0x3F | (SLChar::sUniMap[(unint64_t)*v141 >> 6] << 6)]
                              + *v141);
      if (v168 <= 0x61)
      {
        if (v168 != 97) {
          goto LABEL_726;
        }
        goto LABEL_511;
      }
      if (v168 != 114) {
        goto LABEL_726;
      }
LABEL_525:
      unint64_t v177 = v141[1];
      *uint64_t v2 = v141 + 1;
      if ((((unsigned __int16)SLChar::sLexFold[v177 & 0x3F | (SLChar::sUniMap[v177 >> 6] << 6)] + v177) & 0xFFDF) != 0x4F) {
        goto LABEL_726;
      }
      unint64_t v178 = v141[2];
      *uint64_t v2 = v141 + 2;
      if ((((unsigned __int16)SLChar::sLexFold[v178 & 0x3F | (SLChar::sUniMap[v178 >> 6] << 6)] + v178) & 0xFFDF) != 0x4D) {
        goto LABEL_726;
      }
      unint64_t v179 = v141[3];
      *uint64_t v2 = v141 + 3;
      if ((((unsigned __int16)SLChar::sLexFold[v179 & 0x3F | (SLChar::sUniMap[v179 >> 6] << 6)] + v179) & 0xFFDF) != 0x4E) {
        goto LABEL_726;
      }
      unsigned int v181 = v141[4];
      v180 = v141 + 4;
      *uint64_t v2 = v180;
      unsigned __int16 v182 = SLChar::sLexFold[v181 & 0x3F | (SLChar::sUniMap[(unint64_t)v181 >> 6] << 6)] + v181;
      if (v182 > 0x20u)
      {
        if (v182 > 0xA0u)
        {
          if (v182 != 8239) {
            goto LABEL_726;
          }
        }
        else if (v182 != 160)
        {
          goto LABEL_726;
        }
      }
      else if (v182 != 9 && v182 != 32)
      {
        goto LABEL_726;
      }
      while (1)
      {
        *((void *)this + 3) = ++v180;
        if ((uint64_t)(*((void *)this + 5) - (void)v180) <= 7)
        {
          SLLexerInstance::Refill(this);
          v180 = (unsigned __int16 *)*((void *)this + 3);
        }
        unsigned int v196 = (unsigned __int16)(SLChar::sLexFold[*v180 & 0x3F | (SLChar::sUniMap[(unint64_t)*v180 >> 6] << 6)]
                                + *v180);
        if (v196 > 0x53) {
          break;
        }
        unsigned int v197 = (unsigned __int16)(SLChar::sLexFold[*v180 & 0x3F | (SLChar::sUniMap[(unint64_t)*v180 >> 6] << 6)]
                                + *v180);
        if (v196 > 0x20)
        {
          if (v197 == 78) {
            goto LABEL_604;
          }
          if (v197 < 0x53) {
            goto LABEL_726;
          }
          goto LABEL_637;
        }
        if (v197 != 9)
        {
          BOOL v198 = v197 == 32;
LABEL_588:
          if (!v198) {
            goto LABEL_726;
          }
          continue;
        }
      }
      if (v196 <= 0x73)
      {
        unsigned int v204 = (unsigned __int16)(SLChar::sLexFold[*v180 & 0x3F | (SLChar::sUniMap[(unint64_t)*v180 >> 6] << 6)]
                                + *v180);
        if (v204 == 110)
        {
LABEL_604:
          unint64_t v205 = v180[1];
          *uint64_t v2 = v180 + 1;
          if ((((unsigned __int16)SLChar::sLexFold[v205 & 0x3F | (SLChar::sUniMap[v205 >> 6] << 6)] + v205) & 0xFFDF) != 0x4F) {
            goto LABEL_726;
          }
          unint64_t v206 = v180[2];
          *uint64_t v2 = v180 + 2;
          if ((((unsigned __int16)SLChar::sLexFold[v206 & 0x3F | (SLChar::sUniMap[v206 >> 6] << 6)] + v206) & 0xFFDF) != 0x52) {
            goto LABEL_726;
          }
          unint64_t v207 = v180[3];
          *uint64_t v2 = v180 + 3;
          if ((((unsigned __int16)SLChar::sLexFold[v207 & 0x3F | (SLChar::sUniMap[v207 >> 6] << 6)] + v207) & 0xFFDF) != 0x4D) {
            goto LABEL_726;
          }
          *((void *)this + 3) = v180 + 4;
          unsigned int v203 = *((_DWORD *)this + 24) & 0xFFFFFF7F;
          goto LABEL_728;
        }
        if (v204 < 0x73) {
          goto LABEL_726;
        }
LABEL_637:
        unint64_t v218 = v180[1];
        *uint64_t v2 = v180 + 1;
        if ((((unsigned __int16)SLChar::sLexFold[v218 & 0x3F | (SLChar::sUniMap[v218 >> 6] << 6)] + v218) & 0xFFDF) != 0x50) {
          goto LABEL_726;
        }
        unint64_t v219 = v180[2];
        *uint64_t v2 = v180 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v219 & 0x3F | (SLChar::sUniMap[v219 >> 6] << 6)] + v219) & 0xFFDF) != 0x4C) {
          goto LABEL_726;
        }
        unint64_t v220 = v180[3];
        *uint64_t v2 = v180 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v220 & 0x3F | (SLChar::sUniMap[v220 >> 6] << 6)] + v220) & 0xFFDF) != 0x4C) {
          goto LABEL_726;
        }
        *((void *)this + 3) = v180 + 4;
        unsigned int v203 = *((_DWORD *)this + 24) | 0x80;
        goto LABEL_728;
      }
      BOOL v198 = (unsigned __int16)(SLChar::sLexFold[*v180 & 0x3F | (SLChar::sUniMap[(unint64_t)*v180 >> 6] << 6)]
                              + *v180) == 160;
      if ((unsigned __int16)(SLChar::sLexFold[*v180 & 0x3F | (SLChar::sUniMap[(unint64_t)*v180 >> 6] << 6)]
                            + *v180) > 0xA0u)
        BOOL v198 = (unsigned __int16)(SLChar::sLexFold[*v180 & 0x3F | (SLChar::sUniMap[(unint64_t)*v180 >> 6] << 6)]
                                + *v180) == 8239;
      goto LABEL_588;
    }
    if ((unsigned __int16)(SLChar::sLexFold[*v141 & 0x3F | (SLChar::sUniMap[(unint64_t)*v141 >> 6] << 6)] + *v141) > 0xA0u)
    {
      BOOL v157 = (unsigned __int16)(SLChar::sLexFold[*v141 & 0x3F | (SLChar::sUniMap[(unint64_t)*v141 >> 6] << 6)]
                              + *v141) == 8239;
      goto LABEL_486;
    }
    if ((unsigned __int16)(SLChar::sLexFold[*v141 & 0x3F | (SLChar::sUniMap[(unint64_t)*v141 >> 6] << 6)] + *v141) < 0x75u) {
      goto LABEL_520;
    }
    if ((unsigned __int16)(SLChar::sLexFold[*v141 & 0x3F | (SLChar::sUniMap[(unint64_t)*v141 >> 6] << 6)] + *v141) < 0xA0u) {
      goto LABEL_726;
    }
  }
  if (v155 <= 0x40)
  {
    unsigned int v156 = (unsigned __int16)(SLChar::sLexFold[*v141 & 0x3F | (SLChar::sUniMap[(unint64_t)*v141 >> 6] << 6)]
                            + *v141);
    BOOL v157 = v156 == 9;
    if (v156 > 9) {
      BOOL v157 = v156 == 32;
    }
LABEL_486:
    if (!v157) {
      goto LABEL_726;
    }
    goto LABEL_474;
  }
  unsigned int v167 = (unsigned __int16)(SLChar::sLexFold[*v141 & 0x3F | (SLChar::sUniMap[(unint64_t)*v141 >> 6] << 6)] + *v141);
  if (v167 <= 0x51)
  {
    if (v167 >= 0x42) {
      goto LABEL_726;
    }
LABEL_511:
    unint64_t v169 = v141[1];
    *uint64_t v2 = v141 + 1;
    if ((((unsigned __int16)SLChar::sLexFold[v169 & 0x3F | (SLChar::sUniMap[v169 >> 6] << 6)] + v169) & 0xFFDF) != 0x42) {
      goto LABEL_726;
    }
    unint64_t v170 = v141[2];
    *uint64_t v2 = v141 + 2;
    if ((((unsigned __int16)SLChar::sLexFold[v170 & 0x3F | (SLChar::sUniMap[v170 >> 6] << 6)] + v170) & 0xFFDF) != 0x42) {
      goto LABEL_726;
    }
    unint64_t v171 = v141[3];
    *uint64_t v2 = v141 + 3;
    if ((((unsigned __int16)SLChar::sLexFold[v171 & 0x3F | (SLChar::sUniMap[v171 >> 6] << 6)] + v171) & 0xFFDF) != 0x52) {
      goto LABEL_726;
    }
    unsigned int v173 = v141[4];
    v172 = v141 + 4;
    *uint64_t v2 = v172;
    unsigned __int16 v174 = SLChar::sLexFold[v173 & 0x3F | (SLChar::sUniMap[(unint64_t)v173 >> 6] << 6)] + v173;
    if (v174 > 0x20u)
    {
      if (v174 > 0xA0u)
      {
        if (v174 != 8239) {
          goto LABEL_726;
        }
      }
      else if (v174 != 160)
      {
        goto LABEL_726;
      }
    }
    else if (v174 != 9 && v174 != 32)
    {
      goto LABEL_726;
    }
    while (1)
    {
      *((void *)this + 3) = ++v172;
      if ((uint64_t)(*((void *)this + 5) - (void)v172) <= 7)
      {
        SLLexerInstance::Refill(this);
        v172 = (unsigned __int16 *)*((void *)this + 3);
      }
      unsigned int v193 = (unsigned __int16)(SLChar::sLexFold[*v172 & 0x3F | (SLChar::sUniMap[(unint64_t)*v172 >> 6] << 6)]
                              + *v172);
      if (v193 > 0x53) {
        break;
      }
      unsigned int v194 = (unsigned __int16)(SLChar::sLexFold[*v172 & 0x3F | (SLChar::sUniMap[(unint64_t)*v172 >> 6] << 6)]
                              + *v172);
      if (v193 > 0x20)
      {
        if (v194 == 78) {
          goto LABEL_596;
        }
        if (v194 < 0x53) {
          goto LABEL_726;
        }
        goto LABEL_632;
      }
      if (v194 != 9)
      {
        BOOL v195 = v194 == 32;
LABEL_576:
        if (!v195) {
          goto LABEL_726;
        }
        continue;
      }
    }
    if (v193 <= 0x73)
    {
      unsigned int v199 = (unsigned __int16)(SLChar::sLexFold[*v172 & 0x3F | (SLChar::sUniMap[(unint64_t)*v172 >> 6] << 6)]
                              + *v172);
      if (v199 == 110)
      {
LABEL_596:
        unint64_t v200 = v172[1];
        *uint64_t v2 = v172 + 1;
        if ((((unsigned __int16)SLChar::sLexFold[v200 & 0x3F | (SLChar::sUniMap[v200 >> 6] << 6)] + v200) & 0xFFDF) != 0x4F) {
          goto LABEL_726;
        }
        unint64_t v201 = v172[2];
        *uint64_t v2 = v172 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v201 & 0x3F | (SLChar::sUniMap[v201 >> 6] << 6)] + v201) & 0xFFDF) != 0x52) {
          goto LABEL_726;
        }
        unint64_t v202 = v172[3];
        *uint64_t v2 = v172 + 3;
        if ((((unsigned __int16)SLChar::sLexFold[v202 & 0x3F | (SLChar::sUniMap[v202 >> 6] << 6)] + v202) & 0xFFDF) != 0x4D) {
          goto LABEL_726;
        }
        *((void *)this + 3) = v172 + 4;
        unsigned int v203 = *((_DWORD *)this + 24) & 0xFFFFFEFF;
        goto LABEL_728;
      }
      if (v199 < 0x73) {
        goto LABEL_726;
      }
LABEL_632:
      unint64_t v215 = v172[1];
      *uint64_t v2 = v172 + 1;
      if ((((unsigned __int16)SLChar::sLexFold[v215 & 0x3F | (SLChar::sUniMap[v215 >> 6] << 6)] + v215) & 0xFFDF) != 0x50) {
        goto LABEL_726;
      }
      unint64_t v216 = v172[2];
      *uint64_t v2 = v172 + 2;
      if ((((unsigned __int16)SLChar::sLexFold[v216 & 0x3F | (SLChar::sUniMap[v216 >> 6] << 6)] + v216) & 0xFFDF) != 0x4C) {
        goto LABEL_726;
      }
      unint64_t v217 = v172[3];
      *uint64_t v2 = v172 + 3;
      if ((((unsigned __int16)SLChar::sLexFold[v217 & 0x3F | (SLChar::sUniMap[v217 >> 6] << 6)] + v217) & 0xFFDF) != 0x4C) {
        goto LABEL_726;
      }
      *((void *)this + 3) = v172 + 4;
      unsigned int v203 = *((_DWORD *)this + 24) | 0x100;
      goto LABEL_728;
    }
    BOOL v195 = (unsigned __int16)(SLChar::sLexFold[*v172 & 0x3F | (SLChar::sUniMap[(unint64_t)*v172 >> 6] << 6)]
                            + *v172) == 160;
    if ((unsigned __int16)(SLChar::sLexFold[*v172 & 0x3F | (SLChar::sUniMap[(unint64_t)*v172 >> 6] << 6)] + *v172) > 0xA0u) {
      BOOL v195 = (unsigned __int16)(SLChar::sLexFold[*v172 & 0x3F | (SLChar::sUniMap[(unint64_t)*v172 >> 6] << 6)]
    }
                              + *v172) == 8239;
    goto LABEL_576;
  }
  if (v167 == 82) {
    goto LABEL_525;
  }
  if ((unsigned __int16)(SLChar::sLexFold[*v141 & 0x3F | (SLChar::sUniMap[(unint64_t)*v141 >> 6] << 6)] + *v141) < 0x54u) {
    goto LABEL_726;
  }
LABEL_520:
  unint64_t v175 = v141[1];
  *uint64_t v2 = v141 + 1;
  unsigned __int16 v176 = SLChar::sLexFold[v175 & 0x3F | (SLChar::sUniMap[v175 >> 6] << 6)] + v175;
  if (v176 > 0x4Fu)
  {
    if (v176 > 0x69u)
    {
      if (v176 != 111) {
        goto LABEL_726;
      }
      goto LABEL_550;
    }
    if (v176 != 105) {
      goto LABEL_726;
    }
LABEL_534:
    unint64_t v183 = v141[2];
    *uint64_t v2 = v141 + 2;
    if ((((unsigned __int16)SLChar::sLexFold[v183 & 0x3F | (SLChar::sUniMap[v183 >> 6] << 6)] + v183) & 0xFFDF) != 0x4D) {
      goto LABEL_726;
    }
    unint64_t v184 = v141[3];
    *uint64_t v2 = v141 + 3;
    if ((((unsigned __int16)SLChar::sLexFold[v184 & 0x3F | (SLChar::sUniMap[v184 >> 6] << 6)] + v184) & 0xFFDF) != 0x45) {
      goto LABEL_726;
    }
    unsigned int v186 = v141[4];
    v185 = v141 + 4;
    *uint64_t v2 = v185;
    unsigned __int16 v187 = SLChar::sLexFold[v186 & 0x3F | (SLChar::sUniMap[(unint64_t)v186 >> 6] << 6)] + v186;
    if ((v187 & 0xFFDF) == 0x4E) {
      goto LABEL_726;
    }
    while (1)
    {
      if (v187 > 0x4Eu)
      {
        if (v187 <= 0x9Fu)
        {
          if (v187 != 110) {
            goto LABEL_726;
          }
LABEL_627:
          unint64_t v213 = v185[1];
          *uint64_t v2 = v185 + 1;
          unsigned __int16 v214 = SLChar::sLexFold[v213 & 0x3F | (SLChar::sUniMap[v213 >> 6] << 6)] + v213;
          if (v214 > 0x4Fu)
          {
            if (v214 > 0x6Du)
            {
              if (v214 != 111) {
                goto LABEL_726;
              }
LABEL_653:
              unint64_t v225 = v185[2];
              *uint64_t v2 = v185 + 2;
              if ((((unsigned __int16)SLChar::sLexFold[v225 & 0x3F | (SLChar::sUniMap[v225 >> 6] << 6)] + v225) & 0xFFDF) != 0x52) {
                goto LABEL_726;
              }
              unint64_t v226 = v185[3];
              *uint64_t v2 = v185 + 3;
              if ((((unsigned __int16)SLChar::sLexFold[v226 & 0x3F | (SLChar::sUniMap[v226 >> 6] << 6)] + v226) & 0xFFDF) != 0x4D) {
                goto LABEL_726;
              }
              *((void *)this + 3) = v185 + 4;
              unsigned int v203 = *((_DWORD *)this + 24) & 0xFFFFFFBF;
              goto LABEL_728;
            }
            if (v214 != 109) {
              goto LABEL_726;
            }
          }
          else if (v214 != 77)
          {
            if (v214 < 0x4Fu) {
              goto LABEL_726;
            }
            goto LABEL_653;
          }
          unint64_t v221 = v185[2];
          *uint64_t v2 = v185 + 2;
          if ((((unsigned __int16)SLChar::sLexFold[v221 & 0x3F | (SLChar::sUniMap[v221 >> 6] << 6)] + v221) & 0xFFDF) != 0x42) {
            goto LABEL_726;
          }
          unint64_t v222 = v185[3];
          *uint64_t v2 = v185 + 3;
          if ((((unsigned __int16)SLChar::sLexFold[v222 & 0x3F | (SLChar::sUniMap[v222 >> 6] << 6)] + v222) & 0xFFDF) != 0x52) {
            goto LABEL_726;
          }
          *((void *)this + 3) = v185 + 4;
          unsigned int v203 = *((_DWORD *)this + 24) | 0x40;
          goto LABEL_728;
        }
        if (v187 != 160 && v187 != 8239) {
          goto LABEL_726;
        }
      }
      else if (v187 > 0x1Fu)
      {
        if (v187 != 32)
        {
          if (v187 < 0x4Eu) {
            goto LABEL_726;
          }
          goto LABEL_627;
        }
      }
      else if (v187 != 9)
      {
        goto LABEL_726;
      }
      *((void *)this + 3) = ++v185;
      if ((uint64_t)(*((void *)this + 5) - (void)v185) <= 7)
      {
        SLLexerInstance::Refill(this);
        v185 = (unsigned __int16 *)*((void *)this + 3);
      }
      unsigned __int16 v187 = SLChar::sLexFold[*v185 & 0x3F | (SLChar::sUniMap[(unint64_t)*v185 >> 6] << 6)] + *v185;
    }
  }
  if (v176 == 73) {
    goto LABEL_534;
  }
  if (v176 < 0x4Fu) {
    goto LABEL_726;
  }
LABEL_550:
  unint64_t v188 = v141[2];
  *uint64_t v2 = v141 + 2;
  if ((((unsigned __int16)SLChar::sLexFold[v188 & 0x3F | (SLChar::sUniMap[v188 >> 6] << 6)] + v188) & 0xFFDF) != 0x42) {
    goto LABEL_726;
  }
  unint64_t v189 = v141[3];
  *uint64_t v2 = v141 + 3;
  if ((((unsigned __int16)SLChar::sLexFold[v189 & 0x3F | (SLChar::sUniMap[v189 >> 6] << 6)] + v189) & 0xFFDF) != 0x49) {
    goto LABEL_726;
  }
  unsigned int v191 = v141[4];
  v190 = v141 + 4;
  *uint64_t v2 = v190;
  unsigned __int16 v192 = SLChar::sLexFold[v191 & 0x3F | (SLChar::sUniMap[(unint64_t)v191 >> 6] << 6)] + v191;
  if (v192 > 0x20u)
  {
    if (v192 > 0xA0u)
    {
      if (v192 != 8239) {
        goto LABEL_726;
      }
    }
    else if (v192 != 160)
    {
      goto LABEL_726;
    }
  }
  else if (v192 != 9 && v192 != 32)
  {
    goto LABEL_726;
  }
  while (2)
  {
    while (2)
    {
      *((void *)this + 3) = ++v190;
      if ((uint64_t)(*((void *)this + 5) - (void)v190) <= 7)
      {
        SLLexerInstance::Refill(this);
        v190 = (unsigned __int16 *)*((void *)this + 3);
      }
      unsigned int v208 = (unsigned __int16)(SLChar::sLexFold[*v190 & 0x3F | (SLChar::sUniMap[(unint64_t)*v190 >> 6] << 6)]
                              + *v190);
      if (v208 <= 0x4B)
      {
        unsigned int v209 = (unsigned __int16)(SLChar::sLexFold[*v190 & 0x3F | (SLChar::sUniMap[(unint64_t)*v190 >> 6] << 6)]
                                + *v190);
        if (v208 <= 0x20)
        {
          if (v209 == 9) {
            continue;
          }
          BOOL v210 = v209 == 32;
          goto LABEL_618;
        }
        if (v209 <= 0x2D)
        {
          if (v209 != 45) {
            goto LABEL_726;
          }
          *((void *)this + 3) = v190 + 1;
          v211 = this;
          goto LABEL_684;
        }
        if (v209 != 72) {
          goto LABEL_726;
        }
LABEL_649:
        unint64_t v223 = v190[1];
        *uint64_t v2 = v190 + 1;
        unsigned __int16 v224 = SLChar::sLexFold[v223 & 0x3F | (SLChar::sUniMap[v223 >> 6] << 6)] + v223;
        if (v224 > 0x2Au)
        {
          if (v224 == 43)
          {
            unint64_t v231 = v190[2];
            *uint64_t v2 = v190 + 2;
            unsigned __int16 v232 = SLChar::sLexFold[v231 & 0x3F | (SLChar::sUniMap[v231 >> 6] << 6)] + v231;
            if (v232 > 0x4Bu)
            {
              if ((v232 & 0xFFDF) != 0x4C) {
                goto LABEL_726;
              }
              unint64_t v236 = v190[3];
              *uint64_t v2 = v190 + 3;
              if ((unsigned __int16)(SLChar::sLexFold[v236 & 0x3F | (SLChar::sUniMap[v236 >> 6] << 6)] + v236) != 42) {
                goto LABEL_726;
              }
              *((void *)this + 3) = v190 + 4;
              v211 = this;
            }
            else
            {
              if (v232 != 33) {
                goto LABEL_726;
              }
              unint64_t v233 = v190[3];
              *uint64_t v2 = v190 + 3;
              if ((((unsigned __int16)SLChar::sLexFold[v233 & 0x3F | (SLChar::sUniMap[v233 >> 6] << 6)] + v233) & 0xFFDF) != 0x48) {
                goto LABEL_726;
              }
              *((void *)this + 3) = v190 + 4;
              v211 = this;
            }
          }
          else
          {
            if (v224 != 45) {
              goto LABEL_726;
            }
            *((void *)this + 3) = v190 + 2;
            v211 = this;
          }
        }
        else if (v224 == 37)
        {
          *((void *)this + 3) = v190 + 2;
          v211 = this;
        }
        else
        {
          if (v224 < 0x2Au) {
            goto LABEL_726;
          }
          *((void *)this + 3) = v190 + 2;
          v211 = this;
        }
        goto LABEL_684;
      }
      break;
    }
    if (v208 > 0x6C)
    {
      BOOL v210 = (unsigned __int16)(SLChar::sLexFold[*v190 & 0x3F | (SLChar::sUniMap[(unint64_t)*v190 >> 6] << 6)]
                              + *v190) == 160;
      if ((unsigned __int16)(SLChar::sLexFold[*v190 & 0x3F | (SLChar::sUniMap[(unint64_t)*v190 >> 6] << 6)]
                            + *v190) > 0xA0u)
        BOOL v210 = (unsigned __int16)(SLChar::sLexFold[*v190 & 0x3F | (SLChar::sUniMap[(unint64_t)*v190 >> 6] << 6)]
                                + *v190) == 8239;
LABEL_618:
      if (!v210) {
        goto LABEL_726;
      }
      continue;
    }
    break;
  }
  unsigned int v212 = (unsigned __int16)(SLChar::sLexFold[*v190 & 0x3F | (SLChar::sUniMap[(unint64_t)*v190 >> 6] << 6)] + *v190);
  if (v212 > 0x67)
  {
    if (v212 != 104)
    {
      if ((unsigned __int16)(SLChar::sLexFold[*v190 & 0x3F | (SLChar::sUniMap[(unint64_t)*v190 >> 6] << 6)]
                            + *v190) < 0x6Cu)
        goto LABEL_726;
      goto LABEL_657;
    }
    goto LABEL_649;
  }
  if (v212 >= 0x4D) {
    goto LABEL_726;
  }
LABEL_657:
  unint64_t v227 = v190[1];
  *uint64_t v2 = v190 + 1;
  unsigned __int16 v228 = SLChar::sLexFold[v227 & 0x3F | (SLChar::sUniMap[v227 >> 6] << 6)] + v227;
  if (v228 > 0x2Au)
  {
    if (v228 == 43)
    {
      unint64_t v234 = v190[2];
      *uint64_t v2 = v190 + 2;
      if ((((unsigned __int16)SLChar::sLexFold[v234 & 0x3F | (SLChar::sUniMap[v234 >> 6] << 6)] + v234) & 0xFFDF) != 0x48) {
        goto LABEL_726;
      }
      unint64_t v235 = v190[3];
      *uint64_t v2 = v190 + 3;
      if ((unsigned __int16)(SLChar::sLexFold[v235 & 0x3F | (SLChar::sUniMap[v235 >> 6] << 6)] + v235) != 42) {
        goto LABEL_726;
      }
      *((void *)this + 3) = v190 + 4;
      v211 = this;
    }
    else
    {
      if (v228 != 45) {
        goto LABEL_726;
      }
      *((void *)this + 3) = v190 + 2;
      v211 = this;
    }
  }
  else
  {
    if (v228 == 37)
    {
      *((void *)this + 3) = v190 + 2;
      v211 = this;
      goto LABEL_684;
    }
    if (v228 < 0x2Au) {
      goto LABEL_726;
    }
    unint64_t v229 = v190[2];
    *((void *)this + 3) = v190 + 2;
    *((void *)this + 6) = v190 + 2;
    if ((unsigned __int16)(SLChar::sLexFold[v229 & 0x3F | (SLChar::sUniMap[v229 >> 6] << 6)] + v229) == 43)
    {
      unint64_t v230 = v190[3];
      *uint64_t v2 = v190 + 3;
      if ((((unsigned __int16)SLChar::sLexFold[v230 & 0x3F | (SLChar::sUniMap[v230 >> 6] << 6)] + v230) & 0xFFDF) == 0x48)
      {
        *((void *)this + 3) = v190 + 4;
        v211 = this;
        goto LABEL_684;
      }
      *uint64_t v2 = v190 + 2;
    }
    v211 = this;
  }
LABEL_684:
  uint64_t v135 = SLLexerImpl::ToBICommand(v211);
  if (!v135) {
    goto LABEL_727;
  }
LABEL_838:
  uint64_t v289 = v135;
  SLLexerImpl::SkipToNextCommand(this, 0);
  *((void *)this + 9) = (char *)this + 80;
  return v289;
}

uint64_t SLLexerImpl::SkipToNextCommand(SLLexerImpl *this, char a2)
{
  for (uint64_t i = (unsigned __int16 *)*((void *)this + 3); ; *((void *)this + 3) = i)
  {
    if ((uint64_t)(*((void *)this + 5) - i) <= 3)
    {
      SLLexerInstance::Refill(this);
      uint64_t i = (unsigned __int16 *)*((void *)this + 3);
    }
    if (*((unsigned __int16 *)this + 42) == (unsigned __int16)(SLChar::sLexFold[*i & 0x3F | (SLChar::sUniMap[(unint64_t)*i >> 6] << 6)]
                                                              + *i)
      && (!*((_WORD *)this + 43) || i[1] == *((unsigned __int16 *)this + 43)))
    {
      return 0;
    }
    unsigned int v5 = (unsigned __int16)(SLChar::sLexFold[*i & 0x3F | (SLChar::sUniMap[(unint64_t)*i >> 6] << 6)] + *i);
    if (v5 <= 0x3A)
    {
      if (v5 == 9 || v5 == 32) {
        goto LABEL_20;
      }
      if (!(SLChar::sLexFold[*i & 0x3F | (SLChar::sUniMap[(unint64_t)*i >> 6] << 6)] + *i)) {
        return 0;
      }
      goto LABEL_17;
    }
    if (v5 != 160 && v5 != 8239) {
      break;
    }
LABEL_20:
    ++i;
  }
  if (v5 != 59)
  {
LABEL_17:
    if ((a2 & 1) == 0)
    {
      SLLexerImpl::Error(this);
      uint64_t i = (unsigned __int16 *)*((void *)this + 3);
    }
    a2 = 1;
    goto LABEL_20;
  }
  *((void *)this + 3) = i + 1;
  return 1;
}

uint64_t SLLexerImpl::NextPhonemeToken(SLLexerImpl *this)
{
  for (*((void *)this + 8) = *((void *)this + 3); ; *((void *)this + 8) = v9)
  {
    uint64_t v2 = (unsigned __int16 *)*((void *)this + 3);
    if ((uint64_t)(*((void *)this + 5) - (void)v2) <= 5)
    {
      SLLexerInstance::Refill(this);
      uint64_t v2 = (unsigned __int16 *)*((void *)this + 3);
    }
    unsigned __int16 v3 = SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2;
    if (v3 > 0x5Bu)
    {
      if (v3 > 0xB3u)
      {
        if ((unsigned __int16)(v3 >> 4) > 0x202u)
        {
          if (v3 > 0x2034u)
          {
            BOOL v11 = v3 < 0x2037u;
            unsigned int v12 = (unsigned __int16)(v3 - 8249);
            if (!v11 && v12 >= 2) {
              goto LABEL_68;
            }
          }
          else if (v3 < 0x2032u || v3 == 8244)
          {
            goto LABEL_68;
          }
          goto LABEL_126;
        }
        if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) <= 0xBBu)
        {
          if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) >= 0xB5u
            && (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) != 187)
          {
            goto LABEL_68;
          }
          goto LABEL_126;
        }
        if ((unsigned __int16)(v3 >> 3) < 0x403u) {
          goto LABEL_68;
        }
        if ((unsigned __int16)(v3 >> 5) < 0x101u) {
          goto LABEL_126;
        }
        if (v3 < 0x202Fu) {
          goto LABEL_68;
        }
      }
      else
      {
        unsigned int v5 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
        if (v5 <= 0x7B)
        {
          if (v5 <= 0x5F)
          {
            if (v5 == 93) {
              goto LABEL_132;
            }
LABEL_68:
            *((void *)this + 3) = v2 + 1;
            int v14 = (*(uint64_t (**)(void))(**((void **)this + 16) + 16))(*((void *)this + 16));
            if (v14 != 1)
            {
              if (v14 != 2)
              {
                if (v14)
                {
                  BOOL v9 = (_WORD *)*((void *)this + 3);
                  goto LABEL_104;
                }
                SLLexerImpl::Error(this);
                return 0;
              }
              *((void *)this + 3) += 2;
            }
            operator new();
          }
          if (v5 != 96)
          {
            if (v5 < 0x7B) {
              goto LABEL_68;
            }
            goto LABEL_131;
          }
LABEL_126:
          *((void *)this + 3) = v2 + 1;
          unint64_t v19 = this;
LABEL_127:
          SLLexerInstance::CreateToken((uint64_t)v19);
        }
        if (v5 <= 0x9F)
        {
          if (v5 != 125) {
            goto LABEL_68;
          }
LABEL_132:
          *((void *)this + 3) = v2 + 1;
          unint64_t v19 = this;
          goto LABEL_127;
        }
        if (v5 != 160)
        {
          if (v5 != 171) {
            goto LABEL_68;
          }
          goto LABEL_126;
        }
      }
LABEL_58:
      BOOL v9 = v2 + 1;
      *((void *)this + 3) = v2 + 1;
      while (1)
      {
        unsigned int v18 = (unsigned __int16)(SLChar::sLexFold[*v9 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v9 >> 6] << 6)]
                               + *v9);
        if (v18 > 0x20)
        {
          if (v18 > 0xA0)
          {
            if ((unsigned __int16)(SLChar::sLexFold[*v9 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v9 >> 6] << 6)]
                                  + *v9) != 8239)
              goto LABEL_106;
          }
          else if ((unsigned __int16)(SLChar::sLexFold[*v9 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v9 >> 6] << 6)] {
                                     + *v9) != 160)
          }
          {
            goto LABEL_106;
          }
        }
        else if (v18 != 9 && v18 != 32)
        {
          goto LABEL_106;
        }
LABEL_104:
        *((void *)this + 3) = ++v9;
        if (*((_WORD **)this + 5) == v9)
        {
          SLLexerInstance::Refill(this);
          BOOL v9 = (_WORD *)*((void *)this + 3);
        }
      }
    }
    if (v3 > 0x26u)
    {
      unsigned int v6 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
      if (v6 > 0x2D)
      {
        if (v6 > 0x3B)
        {
          if (v6 != 63)
          {
            if (v6 < 0x5B) {
              goto LABEL_68;
            }
LABEL_131:
            *((void *)this + 3) = v2 + 1;
            unint64_t v19 = this;
            goto LABEL_127;
          }
        }
        else if (v6 >= 0x2F && v6 != 59)
        {
          goto LABEL_68;
        }
      }
      else
      {
        if (v6 <= 0x29)
        {
          if (v6 >= 0x28)
          {
            if (v6 != 40) {
              goto LABEL_132;
            }
            goto LABEL_131;
          }
          goto LABEL_126;
        }
        if (v6 != 44) {
          goto LABEL_68;
        }
      }
      goto LABEL_123;
    }
    unsigned int v4 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
    if (v4 > 0xD) {
      break;
    }
    if (v4 <= 9)
    {
      if (!(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2))
      {
        *((_DWORD *)this + 23) &= 0xFFFFFFF0;
        *((void *)this + 3) = v2;
        return 0;
      }
      if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) < 9u) {
        goto LABEL_68;
      }
      goto LABEL_58;
    }
    unsigned int v7 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2);
    if (v7 == 10)
    {
      unsigned int v8 = v2[1];
      BOOL v9 = v2 + 1;
      *((void *)this + 3) = v2 + 1;
      *((void *)this + 6) = v2 + 1;
      unsigned __int16 v10 = SLChar::sLexFold[v8 & 0x3F | (SLChar::sUniMap[(unint64_t)v8 >> 6] << 6)] + v8;
      if (v10 > 0x1Fu)
      {
        if (v10 > 0xA0u)
        {
          BOOL v17 = v10 == 8239;
          unsigned __int16 v10 = 8239;
          if (v17) {
            goto LABEL_110;
          }
        }
        else if (v10 < 0x21u || v10 == 160)
        {
LABEL_110:
          while (v10 <= 0x1Fu)
          {
            if (v10 > 0xAu)
            {
              if (v10 == 13)
              {
                do
                {
                  while (1)
                  {
                    while (1)
                    {
LABEL_136:
                      *((void *)this + 3) = ++v9;
                      if (*((_WORD **)this + 5) == v9)
                      {
                        SLLexerInstance::Refill(this);
                        BOOL v9 = (_WORD *)*((void *)this + 3);
                      }
LABEL_138:
                      unsigned int v22 = (unsigned __int16)(SLChar::sLexFold[*v9 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v9 >> 6] << 6)]
                                             + *v9);
                      if (v22 > 0x1F) {
                        break;
                      }
                      unsigned int v23 = (unsigned __int16)(SLChar::sLexFold[*v9 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v9 >> 6] << 6)]
                                             + *v9);
                      if (v22 > 0xA)
                      {
                        if (v23 != 13) {
                          goto LABEL_134;
                        }
                      }
                      else if (v23 < 9)
                      {
                        goto LABEL_134;
                      }
                    }
                    if (v22 <= 0xA0) {
                      break;
                    }
                    if ((unsigned __int16)(SLChar::sLexFold[*v9 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v9 >> 6] << 6)]
                                          + *v9) != 8239)
                      goto LABEL_134;
                  }
                  unsigned int v24 = (unsigned __int16)(SLChar::sLexFold[*v9 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v9 >> 6] << 6)]
                                         + *v9);
                }
                while (v24 < 0x21 || v24 == 160);
LABEL_134:
                unint64_t v19 = this;
                goto LABEL_127;
              }
              goto LABEL_122;
            }
            if (v10 < 9u) {
              goto LABEL_122;
            }
            if (v10 != 9) {
              goto LABEL_136;
            }
LABEL_107:
            *((void *)this + 3) = ++v9;
            if (*((_WORD **)this + 5) == v9)
            {
              SLLexerInstance::Refill(this);
              BOOL v9 = (_WORD *)*((void *)this + 3);
            }
            unsigned __int16 v10 = SLChar::sLexFold[*v9 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v9 >> 6] << 6)]
                + *v9;
          }
          if (v10 > 0xA0u)
          {
            if (v10 == 8239) {
              goto LABEL_107;
            }
          }
          else if (v10 < 0x21u || v10 == 160)
          {
            goto LABEL_107;
          }
LABEL_122:
          BOOL v9 = (_WORD *)*((void *)this + 6);
          *((void *)this + 3) = v9;
        }
      }
      else if (v10 > 0xAu)
      {
        if (v10 == 13) {
          goto LABEL_110;
        }
      }
      else if (v10 > 8u)
      {
        goto LABEL_110;
      }
    }
    else
    {
      if (v7 < 0xD) {
        goto LABEL_68;
      }
      BOOL v9 = v2 + 1;
      unint64_t v15 = v2[1];
      *((void *)this + 3) = v2 + 1;
      *((void *)this + 6) = v2 + 1;
      unsigned __int16 v16 = SLChar::sLexFold[v15 & 0x3F | (SLChar::sUniMap[v15 >> 6] << 6)] + v15;
      if (v16 > 0x1Fu)
      {
        if (v16 > 0xA0u)
        {
          if (v16 == 8239) {
            goto LABEL_107;
          }
        }
        else if (v16 < 0x21u || v16 == 160)
        {
          goto LABEL_107;
        }
      }
      else if (v16 > 0xAu)
      {
        if (v16 == 13) {
          goto LABEL_136;
        }
      }
      else if (v16 >= 9u)
      {
        if (v16 != 9)
        {
          BOOL v9 = v2 + 2;
          *((void *)this + 3) = v2 + 2;
          goto LABEL_138;
        }
        goto LABEL_107;
      }
    }
LABEL_106:
    ;
  }
  if (v4 > 0x1F)
  {
    if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) == 32) {
      goto LABEL_58;
    }
    if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) >= 0x22u)
    {
      if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) != 34) {
        goto LABEL_68;
      }
      goto LABEL_126;
    }
LABEL_123:
    *((void *)this + 3) = v2 + 1;
    unint64_t v19 = this;
    goto LABEL_127;
  }
  if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)*v2 >> 6] << 6)] + *v2) != 16) {
    goto LABEL_68;
  }
  *((void *)this + 3) = v2 + 1;
  int v21 = *((_DWORD *)this + 23);
  *((_DWORD *)this + 24) = v21;
  *((_DWORD *)this + 25) = v21;
  *((_DWORD *)this + 23) = 1;
  *((void *)this + 13) = *((void *)this + 10);
  return 0;
}

void std::vector<SLHomograph *>::push_back[abi:ne180100](void **a1, void *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unsigned int v7 = *(void **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((char *)v7 - (unsigned char *)*a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v5 - (void)*a1;
    uint64_t v11 = v10 >> 2;
    if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
      uint64_t v11 = v9 + 1;
    }
    if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v11;
    }
    if (v12) {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLHomograph *>>(v4, v12);
    }
    else {
      unint64_t v13 = 0;
    }
    int v14 = &v13[8 * v9];
    unint64_t v15 = &v13[8 * v12];
    *(void *)int v14 = *a2;
    unsigned int v8 = v14 + 8;
    BOOL v17 = (char *)*a1;
    unsigned __int16 v16 = (char *)a1[1];
    if (v16 != *a1)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }
      while (v16 != v17);
      unsigned __int16 v16 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v8;
    a1[2] = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    *unsigned int v7 = *a2;
    unsigned int v8 = v7 + 1;
  }
  a1[1] = v8;
}

void std::vector<unsigned char>::push_back[abi:ne180100](unint64_t *a1, unsigned char *a2)
{
  unint64_t v5 = (unsigned char *)a1[1];
  unint64_t v4 = a1[2];
  if ((unint64_t)v5 >= v4)
  {
    unint64_t v7 = *a1;
    unsigned int v8 = &v5[-*a1];
    unint64_t v9 = (unint64_t)(v8 + 1);
    if ((uint64_t)(v8 + 1) < 0) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = v4 - v7;
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v11 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v11 = v9;
    }
    if (v11) {
      unint64_t v12 = (unint64_t)operator new(v11);
    }
    else {
      unint64_t v12 = 0;
    }
    unint64_t v13 = (char *)(v12 + v11);
    v8[v12] = *a2;
    uint64_t v6 = (uint64_t)&v8[v12 + 1];
    if (v5 == (unsigned char *)v7)
    {
      v12 += (unint64_t)v8;
    }
    else
    {
      int v14 = &v5[~v7];
      do
      {
        char v15 = *--v5;
        (v14--)[v12] = v15;
      }
      while (v5 != (unsigned char *)v7);
      unint64_t v5 = (unsigned char *)*a1;
    }
    *a1 = v12;
    a1[1] = v6;
    a1[2] = (unint64_t)v13;
    if (v5) {
      operator delete(v5);
    }
  }
  else
  {
    *unint64_t v5 = *a2;
    uint64_t v6 = (uint64_t)(v5 + 1);
  }
  a1[1] = v6;
}

SLLexerInstance *SLLexerImpl::SkipSpaces(SLLexerInstance *this)
{
  uint64_t v1 = this;
  uint64_t v2 = (_WORD *)*((void *)this + 3);
LABEL_2:
  if ((uint64_t)(*((void *)v1 + 5) - (void)v2) <= 3)
  {
    this = (SLLexerInstance *)SLLexerInstance::Refill(v1);
    uint64_t v2 = (_WORD *)*((void *)v1 + 3);
  }
  unsigned int v3 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                        + *v2);
  if (v3 <= 0x1F)
  {
    unsigned int v4 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                          + *v2);
    if (v3 > 0xA)
    {
      if (v4 != 13) {
        goto LABEL_29;
      }
    }
    else if (v4 < 9)
    {
      goto LABEL_29;
    }
LABEL_15:
    *((void *)v1 + 3) = ++v2;
    while (1)
    {
      unsigned int v6 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                            + *v2);
      if (v6 > 0x1F)
      {
        if (v6 > 0xA0)
        {
          if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                + *v2) != 8239)
            goto LABEL_2;
        }
        else
        {
          unsigned int v8 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                + *v2);
          if (v8 >= 0x21 && v8 != 160) {
            goto LABEL_2;
          }
        }
      }
      else
      {
        unsigned int v7 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                              + *v2);
        if (v6 <= 0xA)
        {
          if (v7 < 9) {
            goto LABEL_2;
          }
        }
        else if (v7 != 13)
        {
          goto LABEL_2;
        }
      }
      *((void *)v1 + 3) = ++v2;
      if (*((_WORD **)v1 + 5) == v2)
      {
        this = (SLLexerInstance *)SLLexerInstance::Refill(v1);
        uint64_t v2 = (_WORD *)*((void *)v1 + 3);
      }
    }
  }
  if (v3 > 0xA0)
  {
    if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                          + *v2) == 8239)
      goto LABEL_15;
  }
  else
  {
    unsigned int v5 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                          + *v2);
    if (v5 < 0x21 || v5 == 160) {
      goto LABEL_15;
    }
  }
LABEL_29:
  *((void *)v1 + 3) = v2;
  return this;
}

BOOL SLLexerImpl::SkipToNextAttr(SLLexerImpl *this, char a2)
{
  while (1)
  {
    char v3 = a2;
LABEL_2:
    unsigned int v4 = (_WORD *)*((void *)this + 3);
    if ((uint64_t)(*((void *)this + 5) - (void)v4) <= 3)
    {
      SLLexerInstance::Refill(this);
      unsigned int v4 = (_WORD *)*((void *)this + 3);
    }
    unsigned __int16 v5 = SLChar::sLexFold[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v4 >> 6] << 6)] + *v4;
    if (v5 <= 0x20u) {
      break;
    }
    if (v5 <= 0x7Du)
    {
      if ((unsigned __int16)(SLChar::sLexFold[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v4 >> 6] << 6)]
                            + *v4) == 59)
      {
        ++v4;
        goto LABEL_40;
      }
      if ((unsigned __int16)(SLChar::sLexFold[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v4 >> 6] << 6)]
                            + *v4) >= 0x7Du)
        goto LABEL_40;
    }
    else
    {
      BOOL v6 = (unsigned __int16)(SLChar::sLexFold[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v4 >> 6] << 6)]
                            + *v4) == 160;
      if ((unsigned __int16)(SLChar::sLexFold[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v4 >> 6] << 6)]
                            + *v4) > 0xA0u)
        BOOL v6 = v5 == 8239;
      if (v6) {
        goto LABEL_19;
      }
    }
LABEL_35:
    *((void *)this + 3) = v4 + 1;
    a2 = 1;
    if ((v3 & 1) == 0)
    {
      SLLexerImpl::Error(this);
      a2 = 1;
    }
  }
  if (v5 <= 0xCu)
  {
    if (!(SLChar::sLexFold[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v4 >> 6] << 6)] + *v4)) {
      goto LABEL_37;
    }
    if ((unsigned __int16)(v5 - 11) >= 0xFFFEu)
    {
LABEL_19:
      unsigned int v8 = v4 + 1;
      *((void *)this + 3) = v8;
      while (1)
      {
        unsigned int v9 = (unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                              + *v8);
        if (v9 > 0x1F)
        {
          if (v9 > 0xA0)
          {
            if ((unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                                  + *v8) != 8239)
              goto LABEL_2;
          }
          else
          {
            unsigned int v11 = (unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                                   + *v8);
            if (v11 >= 0x21 && v11 != 160) {
              goto LABEL_2;
            }
          }
        }
        else
        {
          unsigned int v10 = (unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                                 + *v8);
          if (v9 <= 0xA)
          {
            if (v10 < 9) {
              goto LABEL_2;
            }
          }
          else if (v10 != 13)
          {
            goto LABEL_2;
          }
        }
        *((void *)this + 3) = ++v8;
        if (*((_WORD **)this + 5) == v8)
        {
          SLLexerInstance::Refill(this);
          unsigned int v8 = (_WORD *)*((void *)this + 3);
        }
      }
    }
    goto LABEL_35;
  }
  unsigned int v7 = (unsigned __int16)(SLChar::sLexFold[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v4 >> 6] << 6)]
                        + *v4);
  if (v7 <= 0xF)
  {
    if (v7 < 0xE) {
      goto LABEL_19;
    }
    goto LABEL_35;
  }
  if (v7 != 16)
  {
    if ((unsigned __int16)(SLChar::sLexFold[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v4 >> 6] << 6)]
                          + *v4) >= 0x20u)
      goto LABEL_19;
    goto LABEL_35;
  }
LABEL_37:
  unint64_t v12 = v4 + 1;
  *((void *)this + 3) = v12;
  if ((v3 & 1) == 0)
  {
    SLLexerImpl::Error(this);
    unint64_t v12 = (_WORD *)*((void *)this + 3);
  }
  unsigned int v4 = v12 - 1;
LABEL_40:
  BOOL result = v5 > 0x20u;
  *((void *)this + 3) = v4;
  return result;
}

BOOL SLLexerImpl::AttrError(SLLexerImpl *this)
{
  SLLexerImpl::Error(this);
  return SLLexerImpl::SkipToNextAttr(this, 1);
}

float SLLexerImpl::ScanFloat(unsigned __int16 **this)
{
  SLLexerImpl::SkipSpaces((SLLexerInstance *)this);
  uint64_t v2 = this[3];
  float v3 = 0.0;
  float v4 = 0.0;
  while (1)
  {
    while (1)
    {
      if (this[5] == v2)
      {
        SLLexerInstance::Refill((SLLexerInstance *)this);
        uint64_t v2 = this[3];
      }
      unint64_t v5 = *v2;
      if ((unsigned __int16)(SLChar::sLexFold[v5 & 0x3F | (SLChar::sUniMap[v5 >> 6] << 6)] + v5) != 46) {
        break;
      }
      this[3] = ++v2;
      float v3 = 1.0;
    }
    if ((unsigned __int16)(SLChar::sLexFold[v5 & 0x3F | (SLChar::sUniMap[v5 >> 6] << 6)] + v5 - 48) >= 0xAu) {
      break;
    }
    this[3] = ++v2;
    float v6 = (float)((int)v5 - 48);
    if (v3 > 0.0)
    {
      float v3 = v3 * 0.1;
      float v4 = v4 + (float)(v6 * v3);
    }
    else
    {
      float v4 = v6 + (float)(v4 * 10.0);
    }
  }
  this[3] = v2;
  SLLexerImpl::SkipSpaces((SLLexerInstance *)this);
  return v4;
}

SLLexerInstance *SLLexerImpl::ScanWord(SLLexerImpl *this, SLToken *a2)
{
  SLLexerImpl::SkipSpaces(this);
  float v4 = (_WORD *)*((void *)this + 3);
  int v5 = (unsigned __int16)(SLChar::sLexFold[*v4 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v4 >> 6] << 6)]
                        + *v4);
  if (v5 == 39 || v5 == 34) {
    *((void *)this + 3) = ++v4;
  }
  else {
    int v5 = 32;
  }
  float v6 = (void **)((char *)a2 + 56);
  while (1)
  {
    if ((uint64_t)(*((void *)this + 5) - (void)v4) <= 1)
    {
      SLLexerInstance::Refill(this);
      float v4 = (_WORD *)*((void *)this + 3);
    }
    unsigned int v7 = v4 + 1;
    unint64_t v8 = (unsigned __int16)*v4;
    *((void *)this + 3) = v4 + 1;
    __int16 v9 = SLChar::sLexFold[v8 & 0x3F | (SLChar::sUniMap[v8 >> 6] << 6)] + v8;
    unsigned __int16 v10 = v9 == 9 ? 32 : v9;
    if (v5 == v10) {
      break;
    }
    if (v10 <= 0x24u)
    {
      if (v10) {
        BOOL v14 = v10 == 16;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14)
      {
LABEL_53:
        *((void *)this + 3) = v4;
        break;
      }
    }
    else if (v10 == 37)
    {
      if ((uint64_t)(*((void *)this + 5) - (void)v7) <= 7)
      {
        SLLexerInstance::Refill(this);
        unsigned int v7 = (_WORD *)*((void *)this + 3);
      }
      uint64_t v11 = 0;
      unsigned __int16 v10 = 0;
      do
      {
        unsigned __int16 v12 = SLChar::sLexFold[v7[v11] & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)v7[v11] >> 6] << 6)]
            + v7[v11];
        if (v12 < 0x30u) {
          break;
        }
        if (v12 >= 0x3Au)
        {
          if ((unsigned __int16)(SLChar::sLexFold[v7[v11] & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)v7[v11] >> 6] << 6)]
                                + v7[v11]) < 0x61u)
          {
            if ((unsigned __int16)(v12 - 65) > 5u) {
              break;
            }
            __int16 v13 = -55;
          }
          else
          {
            if ((unsigned __int16)(SLChar::sLexFold[v7[v11] & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)v7[v11] >> 6] << 6)]
                                  + v7[v11]) >= 0x67u)
              break;
            __int16 v13 = -87;
          }
        }
        else
        {
          __int16 v13 = -48;
        }
        unsigned __int16 v10 = v13 + 16 * v10 + v12;
        *((void *)this + 3) = &v7[++v11];
      }
      while ((v11 * 2) != 8);
    }
    else if (v10 == 125 || v10 == 59)
    {
      goto LABEL_53;
    }
    unsigned __int16 v16 = (unsigned __int16 *)*((void *)a2 + 8);
    unint64_t v15 = *((void *)a2 + 9);
    if ((unint64_t)v16 >= v15)
    {
      uint64_t v18 = (unsigned __int16 *)*v6;
      uint64_t v19 = (char *)v16 - (unsigned char *)*v6;
      if (v19 <= -3) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v20 = v19 >> 1;
      unint64_t v21 = v15 - (void)v18;
      if (v21 <= (v19 >> 1) + 1) {
        unint64_t v22 = v20 + 1;
      }
      else {
        unint64_t v22 = v21;
      }
      if (v21 >= 0x7FFFFFFFFFFFFFFELL) {
        uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v23 = v22;
      }
      if (v23)
      {
        unsigned int v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)a2 + 72, v23);
        uint64_t v18 = (unsigned __int16 *)*((void *)a2 + 7);
        unsigned __int16 v16 = (unsigned __int16 *)*((void *)a2 + 8);
      }
      else
      {
        unsigned int v24 = 0;
      }
      unint64_t v25 = (unsigned __int16 *)&v24[2 * v20];
      unsigned __int16 *v25 = v10;
      BOOL v17 = v25 + 1;
      while (v16 != v18)
      {
        unsigned __int16 v26 = *--v16;
        *--unint64_t v25 = v26;
      }
      *((void *)a2 + 7) = v25;
      *((void *)a2 + 8) = v17;
      *((void *)a2 + 9) = &v24[2 * v23];
      if (v18) {
        operator delete(v18);
      }
    }
    else
    {
      *unsigned __int16 v16 = v10;
      BOOL v17 = v16 + 1;
    }
    *((void *)a2 + 8) = v17;
    float v4 = (_WORD *)*((void *)this + 3);
  }
  return SLLexerImpl::SkipSpaces(this);
}

SLLexerInstance *SLLexerImpl::ScanIdent(SLLexerImpl *this, char *a2, uint64_t a3)
{
  SLLexerImpl::SkipSpaces(this);
  float v6 = (_WORD *)*((void *)this + 3);
  int v7 = (unsigned __int16)(SLChar::sLexFold[*v6 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v6 >> 6] << 6)]
                        + *v6);
  if (v7 == 39 || v7 == 34) {
    *((void *)this + 3) = ++v6;
  }
  else {
    int v7 = 32;
  }
  while (1)
  {
    if ((uint64_t)(*((void *)this + 5) - (void)v6) <= 1)
    {
      SLLexerInstance::Refill(this);
      float v6 = (_WORD *)*((void *)this + 3);
    }
    unint64_t v8 = (unsigned __int16)*v6;
    *((void *)this + 3) = v6 + 1;
    unsigned __int16 v9 = SLChar::sLexFold[v8 & 0x3F | (SLChar::sUniMap[v8 >> 6] << 6)] + v8;
    if (v9 == 9) {
      unsigned __int16 v9 = 32;
    }
    if (v7 == v9) {
      break;
    }
    if (v9 > 0x100u || (v9 <= 0x3Bu ? (BOOL v10 = ((1 << v9) & 0x800000000010001) == 0) : (BOOL v10 = 1), !v10 || v9 == 125))
    {
      *((void *)this + 3) = v6;
      break;
    }
    if (!a3) {
      break;
    }
    --a3;
    *a2++ = v9;
    float v6 = (_WORD *)*((void *)this + 3);
  }
  *a2 = 0;
  return SLLexerImpl::SkipSpaces(this);
}

uint64_t SLLexerImpl::NextTuneToken(SLLexerImpl *this)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v33 = 0;
  char v32 = 0;
  uint64_t v2 = (_WORD *)*((void *)this + 3);
  *((void *)this + 8) = v2;
  BOOL Attr = 1;
  while (1)
  {
    while (1)
    {
      if ((uint64_t)(*((void *)this + 5) - (void)v2) <= 3) {
        SLLexerInstance::Refill(this);
      }
      if (!*((unsigned char *)this + 120)) {
        break;
      }
      if (*((unsigned char *)this + 120) == 86)
      {
        SLLexerImpl::ScanFloat((unsigned __int16 **)this);
        SLLexerInstance::CreateCommandToken(this);
      }
      while (1)
      {
LABEL_10:
        unint64_t v8 = (_WORD *)*((void *)this + 3);
        if ((uint64_t)(*((void *)this + 5) - (void)v8) <= 3)
        {
          SLLexerInstance::Refill(this);
          unint64_t v8 = (_WORD *)*((void *)this + 3);
        }
        unsigned __int16 v9 = SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)] + *v8;
        if (v9 <= 0x55u) {
          break;
        }
        if (v9 > 0x72u)
        {
          unsigned int v13 = (unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                                 + *v8);
          if (v13 > 0x7D)
          {
            if (v13 > 0xA0)
            {
              if (v9 != 8239) {
                goto LABEL_75;
              }
LABEL_53:
              unsigned __int16 v16 = v8 + 1;
              *((void *)this + 3) = v16;
LABEL_54:
              unsigned int v17 = (unsigned __int16)(SLChar::sLexFold[*v16 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v16 >> 6] << 6)]
                                     + *v16);
              if (v17 > 0x20)
              {
                int v19 = (unsigned __int16)(SLChar::sLexFold[*v16 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v16 >> 6] << 6)]
                                       + *v16);
                if (v17 > 0x9F)
                {
                  if (v19 != 160 && v19 != 8239) {
                    continue;
                  }
                }
                else if (v19 != 59)
                {
                  continue;
                }
              }
              else if (v17 <= 0xC)
              {
                if ((unsigned __int16)(SLChar::sLexFold[*v16 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v16 >> 6] << 6)]
                                      + *v16
                                      - 9) >= 2u)
                  continue;
              }
              else
              {
                unsigned int v18 = (unsigned __int16)(SLChar::sLexFold[*v16 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v16 >> 6] << 6)]
                                       + *v16);
                if (v18 == 13)
                {
                  *((void *)this + 3) = ++v16;
                  if (*((_WORD **)this + 5) != v16) {
                    goto LABEL_54;
                  }
LABEL_71:
                  SLLexerInstance::Refill(this);
                  unsigned __int16 v16 = (_WORD *)*((void *)this + 3);
                  goto LABEL_54;
                }
                if (v18 < 0x20) {
                  continue;
                }
              }
              *((void *)this + 3) = ++v16;
              if (*((_WORD **)this + 5) != v16) {
                goto LABEL_54;
              }
              goto LABEL_71;
            }
            if ((unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                                  + *v8) == 160)
              goto LABEL_53;
          }
          else
          {
            unsigned int v14 = (unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                                   + *v8);
            if (v13 > 0x76)
            {
              if (v14 > 0x7C)
              {
                unsigned __int16 v26 = v8 + 1;
                goto LABEL_105;
              }
            }
            else if (v14 == 118)
            {
LABEL_29:
              *((void *)this + 3) = v8 + 1;
              *((unsigned char *)this + 120) = 86;
              SLLexerImpl::ScanFloat((unsigned __int16 **)this);
              SLLexerInstance::CreateCommandToken(this);
            }
          }
        }
        else
        {
          unsigned int v11 = (unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                                 + *v8);
          if (v11 > 0x65)
          {
            if (v11 > 0x6F)
            {
              if (v11 != 112 && v11 >= 0x72)
              {
LABEL_76:
                *((void *)this + 3) = v8 + 1;
                SLLexerImpl::ScanFloat((unsigned __int16 **)this);
                SLLexerInstance::CreateCommandToken(this);
              }
            }
            else if (v11 < 0x67)
            {
              goto LABEL_72;
            }
          }
          else if (v11 <= 0x56)
          {
            goto LABEL_29;
          }
        }
LABEL_75:
        *((void *)this + 3) = v8 + 1;
        SLLexerImpl::Error(this);
        BOOL Attr = SLLexerImpl::SkipToNextAttr(this, 1);
      }
      if (v9 > 0x3Au)
      {
        unsigned int v12 = (unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                               + *v8);
        if (v12 > 0x46)
        {
          if (v12 == 82) {
            goto LABEL_76;
          }
        }
        else if (v12 > 0x43)
        {
          if (v12 > 0x45)
          {
LABEL_72:
            *((void *)this + 3) = v8 + 1;
            SLLexerInstance::CreateCommandToken(this);
          }
        }
        else if (v12 <= 0x3B)
        {
          goto LABEL_53;
        }
        goto LABEL_75;
      }
      unsigned int v10 = (unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                             + *v8);
      if (v10 <= 0xD)
      {
        if (v10 > 8)
        {
          if ((unsigned __int16)(v9 - 11) >= 2u) {
            goto LABEL_53;
          }
        }
        else if (!(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)] {
                  + *v8))
        }
        {
          goto LABEL_79;
        }
        goto LABEL_75;
      }
      int v15 = (unsigned __int16)(SLChar::sLexFold[*v8 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v8 >> 6] << 6)]
                             + *v8);
      if (v10 > 0x10)
      {
        if (v15 == 32) {
          goto LABEL_53;
        }
        goto LABEL_75;
      }
      if (v15 != 16) {
        goto LABEL_75;
      }
LABEL_79:
      unint64_t v22 = v8 + 1;
      *((void *)this + 3) = v22;
      if (Attr)
      {
        SLLexerImpl::Error(this);
        unint64_t v22 = (_WORD *)*((void *)this + 3);
      }
      unsigned __int16 v26 = v22 - 1;
LABEL_105:
      *((void *)this + 3) = v26;
      *((unsigned char *)this + 120) = 0;
      SLLexerImpl::SkipSpaces(this);
      uint64_t v2 = (_WORD *)*((void *)this + 3);
    }
    float v4 = (unsigned __int16 *)*((void *)this + 3);
    unint64_t v5 = *v4;
    unint64_t v6 = v5 >> 6;
    int v7 = v5 & 0x3F;
    if ((unsigned __int16)(SLChar::sLexFold[v7 | (SLChar::sUniMap[v5 >> 6] << 6)] + v5) == 123)
    {
      *((void *)this + 3) = v4 + 1;
      *((unsigned char *)this + 120) = 32;
      goto LABEL_10;
    }
    if ((uint64_t)(*((void *)this + 5) - (void)v4) > 3)
    {
      unint64_t v21 = (unsigned __int16 *)*((void *)this + 3);
    }
    else
    {
      SLLexerInstance::Refill(this);
      unint64_t v21 = (unsigned __int16 *)*((void *)this + 3);
      unint64_t v5 = *v21;
      unint64_t v6 = v5 >> 6;
      int v7 = v5 & 0x3F;
    }
    unsigned __int16 v23 = SLChar::sLexFold[v7 | (SLChar::sUniMap[v6] << 6)] + v5;
    if (v23 > 0x10u)
    {
      if (v23 > 0x9Fu)
      {
        if (v23 == 160 || v23 == 8239)
        {
LABEL_99:
          uint64_t v2 = v21 + 1;
          *((void *)this + 3) = v21 + 1;
          goto LABEL_109;
        }
      }
      else if (v23 == 32)
      {
        goto LABEL_99;
      }
    }
    else if (v23 > 0xAu)
    {
      if (v23 == 13) {
        goto LABEL_99;
      }
      if (v23 >= 0x10u)
      {
        *((void *)this + 3) = v21 + 1;
        int v31 = *((_DWORD *)this + 23);
        *((_DWORD *)this + 24) = v31;
        *((_DWORD *)this + 25) = v31;
        *((_DWORD *)this + 23) = 1;
        *((void *)this + 13) = *((void *)this + 10);
        return 0;
      }
    }
    else
    {
      if (!v23)
      {
        *((_DWORD *)this + 23) &= 0xFFFFFFF0;
        *((void *)this + 3) = v21;
        return 0;
      }
      if (v23 >= 9u) {
        goto LABEL_99;
      }
    }
    *((void *)this + 3) = v21 + 1;
    int v25 = (*(uint64_t (**)(void))(**((void **)this + 16) + 16))(*((void *)this + 16));
    if (!v25) {
      break;
    }
    if (v25 == 1) {
      goto LABEL_104;
    }
    if (v25 == 2)
    {
      *((void *)this + 3) += 2;
LABEL_104:
      operator new();
    }
    uint64_t v2 = (_WORD *)*((void *)this + 3);
    do
    {
LABEL_119:
      *((void *)this + 3) = ++v2;
      if (*((_WORD **)this + 5) != v2) {
        goto LABEL_109;
      }
LABEL_120:
      SLLexerInstance::Refill(this);
      uint64_t v2 = (_WORD *)*((void *)this + 3);
LABEL_109:
      while (1)
      {
        unsigned int v27 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                               + *v2);
        if (v27 > 0x1F) {
          break;
        }
        unsigned int v28 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                               + *v2);
        if (v27 <= 0xA)
        {
          if (v28 < 9) {
            goto LABEL_117;
          }
          goto LABEL_119;
        }
        if (v28 != 13) {
          goto LABEL_117;
        }
        *((void *)this + 3) = ++v2;
        if (*((_WORD **)this + 5) == v2) {
          goto LABEL_120;
        }
      }
      if (v27 > 0xA0)
      {
        if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                              + *v2) != 8239)
          break;
        goto LABEL_119;
      }
      unsigned int v29 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                             + *v2);
    }
    while (v29 < 0x21 || v29 == 160);
LABEL_117:
    *((void *)this + 8) = v2;
  }
  if ((*(unsigned int (**)(void, uint64_t, char *))(**((void **)this + 16) + 24))(*((void *)this + 16), *((void *)this + 3) - 2, &v32))
  {
    operator new();
  }
  SLLexerImpl::Error(this);
  return 0;
}

void sub_222AAB80C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,void *__p,uint64_t a23)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<SLPhonTune>::push_back[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = a1[1];
  if (v3 >= a1[2])
  {
    uint64_t result = std::vector<SLPhonTune>::__push_back_slow_path<SLPhonTune>(a1, a2);
  }
  else
  {
    *(_DWORD *)unint64_t v3 = *(_DWORD *)a2;
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(void *)(v3 + 8) = 0;
    *(_OWORD *)(v3 + 8) = *(_OWORD *)(a2 + 8);
    *(void *)(v3 + 24) = *(void *)(a2 + 24);
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(void *)(a2 + 24) = 0;
    uint64_t result = v3 + 32;
  }
  a1[1] = result;
  return result;
}

uint64_t std::vector<SLPhonTune>::__push_back_slow_path<SLPhonTune>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 5;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
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
  v15[4] = a1 + 2;
  unsigned int v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<SLPhonTune>>(v7, v9);
  unsigned int v11 = &v10[32 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v15[3] = &v10[32 * v12];
  *(_DWORD *)unsigned int v11 = *(_DWORD *)a2;
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 1) = 0;
  *(_OWORD *)(v11 + 8) = *(_OWORD *)(a2 + 8);
  *((void *)v11 + 3) = *(void *)(a2 + 24);
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 8) = 0;
  v15[2] = v11 + 32;
  std::vector<SLPhonTune>::__swap_out_circular_buffer(a1, v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<SLPhonTune>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_222AAB9EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<SLPhonTune>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<SLPhonTune>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<SLPhonTune>,std::reverse_iterator<SLPhonTune*>,std::reverse_iterator<SLPhonTune*>,std::reverse_iterator<SLPhonTune*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<SLPhonTune>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<SLPhonTune>,std::reverse_iterator<SLPhonTune*>,std::reverse_iterator<SLPhonTune*>,std::reverse_iterator<SLPhonTune*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      int v8 = *(_DWORD *)(a3 - 32);
      a3 -= 32;
      *(_DWORD *)(v7 - 32) = v8;
      *(void *)(v7 - 16) = 0;
      *(void *)(v7 - 8) = 0;
      *(void *)(v7 - 24) = 0;
      *(_OWORD *)(v7 - 24) = *(_OWORD *)(a3 + 8);
      *(void *)(v7 - 8) = *(void *)(a3 + 24);
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)(a3 + 24) = 0;
      uint64_t v7 = *((void *)&v14 + 1) - 32;
      *((void *)&v14 + 1) -= 32;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SLPhonTune>,std::reverse_iterator<SLPhonTune*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<SLPhonTune>,std::reverse_iterator<SLPhonTune*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<SLPhonTune>,std::reverse_iterator<SLPhonTune*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<SLPhonTune>,std::reverse_iterator<SLPhonTune*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    uint64_t v3 = *(void **)(v1 + 8);
    if (v3)
    {
      *(void *)(v1 + 16) = v3;
      operator delete(v3);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<SLPhonTune>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<SLPhonTune>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    *(void *)(a1 + 16) = v2 - 32;
    uint64_t v5 = *(void **)(v2 - 24);
    if (v5)
    {
      *(void *)(v2 - 16) = v5;
      operator delete(v5);
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
}

uint64_t SLLexerImpl::ScanInt(unsigned __int16 **this)
{
  SLLexerImpl::SkipSpaces((SLLexerInstance *)this);
  uint64_t v2 = 0;
  uint64_t v3 = this[3];
  while (1)
  {
    if (this[5] == v3)
    {
      SLLexerInstance::Refill((SLLexerInstance *)this);
      uint64_t v3 = this[3];
    }
    unint64_t v4 = *v3;
    if ((unsigned __int16)(v4 + SLChar::sLexFold[v4 & 0x3F | (SLChar::sUniMap[v4 >> 6] << 6)] - 58) < 0xFFF6u) {
      break;
    }
    this[3] = ++v3;
    uint64_t v2 = (v4 + 10 * v2 - 48);
  }
  this[3] = v3;
  return v2;
}

uint64_t SLLexerImpl::NextSongToken(SLLexerImpl *this)
{
  uint64_t v2 = (_WORD *)*((void *)this + 3);
  *((void *)this + 8) = v2;
LABEL_2:
  if ((uint64_t)(*((void *)this + 5) - (void)v2) <= 3) {
    SLLexerInstance::Refill(this);
  }
  if (!*((unsigned char *)this + 120))
  {
    uint64_t v3 = (unsigned __int16 *)*((void *)this + 3);
    unint64_t v4 = *v3;
    unint64_t v5 = v4 >> 6;
    int v6 = v4 & 0x3F;
    if ((unsigned __int16)(SLChar::sLexFold[v6 | (SLChar::sUniMap[v4 >> 6] << 6)] + v4) == 123)
    {
      *((void *)this + 3) = v3 + 1;
      *((unsigned char *)this + 120) = 32;
      goto LABEL_7;
    }
    if ((uint64_t)(*((void *)this + 5) - (void)v3) <= 3)
    {
      SLLexerInstance::Refill(this);
      uint64_t v3 = (unsigned __int16 *)*((void *)this + 3);
      unint64_t v4 = *v3;
      unint64_t v5 = v4 >> 6;
      int v6 = v4 & 0x3F;
    }
    unsigned __int16 v26 = SLChar::sLexFold[v6 | (SLChar::sUniMap[v5] << 6)] + v4;
    if (v26 > 0xA0u)
    {
      if (v26 > 0x2BDu)
      {
        if ((unsigned __int16)(v26 >> 2) <= 0x806u)
        {
          if ((unsigned __int16)(v26 >> 3) > 0x402u)
          {
            if (v26 == 8218) {
              goto LABEL_166;
            }
          }
          else if (v26 != 756)
          {
            goto LABEL_166;
          }
        }
        else
        {
          if (v26 <= 0x2031u)
          {
            if (v26 != 8239) {
              goto LABEL_166;
            }
            goto LABEL_97;
          }
          if (v26 != 8242 && v26 != 8245) {
            goto LABEL_166;
          }
        }
        goto LABEL_149;
      }
      if (v26 > 0xC6u)
      {
        if (v26 > 0xE5u)
        {
          if (v26 != 230)
          {
            if (v26 >= 0x2BBu) {
              goto LABEL_149;
            }
LABEL_166:
            *((void *)this + 3) = v3 + 1;
LABEL_167:
            SLLexerImpl::Error(this);
            return 0;
          }
        }
        else if (v26 != 224)
        {
          goto LABEL_166;
        }
      }
      else if (v26 > 0xBFu)
      {
        if (v26 != 192 && v26 < 0xC6u) {
          goto LABEL_166;
        }
      }
      else if (v26 != 176)
      {
        goto LABEL_166;
      }
    }
    else
    {
      if (v26 <= 0x2Bu)
      {
        if (v26 <= 0xFu)
        {
          if (v26 <= 0xAu)
          {
            if (v26)
            {
              if (v26 < 9u) {
                goto LABEL_166;
              }
              goto LABEL_97;
            }
            *((_DWORD *)this + 23) &= 0xFFFFFFF0;
            *((void *)this + 3) = v3;
            return 0;
          }
          if (v26 != 13) {
            goto LABEL_166;
          }
          goto LABEL_97;
        }
        if (v26 <= 0x21u)
        {
          if (v26 < 0x11u)
          {
            *((void *)this + 3) = v3 + 1;
            int v38 = *((_DWORD *)this + 23);
            *((_DWORD *)this + 24) = v38;
            *((_DWORD *)this + 25) = v38;
            *((_DWORD *)this + 23) = 1;
            *((void *)this + 13) = *((void *)this + 10);
            return 0;
          }
          if (v26 < 0x20u) {
            goto LABEL_166;
          }
LABEL_97:
          uint64_t v2 = v3 + 1;
          *((void *)this + 3) = v2;
          while (1)
          {
            unsigned int v27 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                   + *v2);
            if (v27 > 0x2D)
            {
              if (v27 > 0x3F)
              {
                BOOL v30 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                       + *v2) == 160;
                if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                      + *v2) > 0xA0u)
                  BOOL v30 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                         + *v2) == 8239;
LABEL_114:
                if (!v30) {
                  goto LABEL_64;
                }
                goto LABEL_116;
              }
              unsigned int v28 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                     + *v2);
              if (v28 > 0x3A)
              {
                if (v28 != 59
                  && (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                      + *v2) < 0x3Fu)
                {
                  goto LABEL_64;
                }
              }
              else if (v28 >= 0x2F)
              {
                goto LABEL_64;
              }
            }
            else
            {
              if (v27 > 0xD)
              {
                unsigned int v29 = (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                       + *v2);
                if (v29 <= 0x21)
                {
                  if (v29 < 0x20) {
                    goto LABEL_64;
                  }
                  goto LABEL_116;
                }
                BOOL v30 = v29 == 44;
                goto LABEL_114;
              }
              if ((unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                    + *v2) < 9u
                || (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                    + *v2) >= 0xBu
                && (unsigned __int16)(SLChar::sLexFold[*v2 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v2 >> 6] << 6)]
                                    + *v2) < 0xDu)
              {
                goto LABEL_64;
              }
            }
LABEL_116:
            *((void *)this + 3) = ++v2;
            if (*((_WORD **)this + 5) == v2)
            {
              SLLexerInstance::Refill(this);
              uint64_t v2 = (_WORD *)*((void *)this + 3);
            }
          }
        }
        if (v26 != 39) {
          goto LABEL_166;
        }
LABEL_149:
        unsigned int v36 = v3[1];
        unint64_t v35 = v3 + 1;
        *((void *)this + 3) = v35;
        unsigned __int16 v37 = SLChar::sLexFold[v36 & 0x3F | (SLChar::sUniMap[(unint64_t)v36 >> 6] << 6)] + v36;
        if (v37 > 0xBFu)
        {
          if (v37 > 0xDFu)
          {
            if (v37 == 224 || v37 == 230)
            {
              while (1)
              {
                while (1)
                {
LABEL_182:
                  *((void *)this + 3) = ++v35;
                  if (*((_WORD **)this + 5) == v35)
                  {
                    SLLexerInstance::Refill(this);
                    unint64_t v35 = (_WORD *)*((void *)this + 3);
                  }
LABEL_170:
                  unsigned __int16 v39 = SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                      + *v35;
                  if (v39 > 0xE0u) {
                    break;
                  }
                  if (v39 > 0xAFu)
                  {
                    unsigned int v44 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                           + *v35);
                    if (v44 > 0xC0)
                    {
                      if (v44 != 198
                        && (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                            + *v35) < 0xE0u)
                      {
                        goto LABEL_244;
                      }
                    }
                    else if (v44 >= 0xB1 {
                           && (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                    }
                                               + *v35) != 192)
                    {
                      goto LABEL_244;
                    }
                  }
                  else
                  {
                    unsigned int v40 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                           + *v35);
                    if (v40 <= 0x40)
                    {
LABEL_198:
                      if (v40 == 39) {
                        goto LABEL_199;
                      }
                      goto LABEL_244;
                    }
                    unsigned int v41 = (unsigned __int16)(v39 - 97);
                    if (v40 >= 0x5B && v41 >= 0x1A) {
                      goto LABEL_244;
                    }
                  }
                }
                if ((unsigned __int16)(v39 >> 3) > 0x402u) {
                  break;
                }
                unsigned int v43 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                       + *v35);
                if (v43 > 0x2BA)
                {
LABEL_242:
                  if (v43 < 0x2BE || v39 == 756) {
                    goto LABEL_199;
                  }
                  goto LABEL_244;
                }
                if (v43 != 230) {
                  goto LABEL_244;
                }
              }
              if (v39 <= 0x2031u) {
                goto LABEL_192;
              }
              int v45 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                     + *v35);
              if (v45 == 8245 || v45 == 8242)
              {
                while (1)
                {
LABEL_199:
                  *((void *)this + 3) = ++v35;
                  if (*((_WORD **)this + 5) == v35)
                  {
                    SLLexerInstance::Refill(this);
                    unint64_t v35 = (_WORD *)*((void *)this + 3);
                  }
                  unsigned int v46 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                         + *v35);
                  if (v46 <= 0xBF)
                  {
                    if (v46 > 0x60)
                    {
                      unsigned int v48 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                             + *v35);
                      if (v48 < 0x7B || v48 == 176) {
                        goto LABEL_214;
                      }
                    }
                    else if ((unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)] {
                                               + *v35
                    }
                                               - 65) < 0x1Au)
                    {
                      goto LABEL_214;
                    }
                    goto LABEL_244;
                  }
                  unsigned int v47 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                         + *v35);
                  if (v46 <= 0xDF) {
                    break;
                  }
                  if (v47 != 230 && v47 != 224) {
                    goto LABEL_244;
                  }
                  while (1)
                  {
                    while (1)
                    {
LABEL_214:
                      *((void *)this + 3) = ++v35;
                      if (*((_WORD **)this + 5) == v35)
                      {
                        SLLexerInstance::Refill(this);
                        unint64_t v35 = (_WORD *)*((void *)this + 3);
                      }
                      unsigned __int16 v39 = SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                          + *v35;
                      if (v39 > 0xE0u) {
                        break;
                      }
                      if (v39 > 0xAFu)
                      {
                        unsigned int v51 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                               + *v35);
                        if (v51 > 0xC0)
                        {
                          if (v51 != 198
                            && (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                                + *v35) < 0xE0u)
                          {
                            goto LABEL_244;
                          }
                        }
                        else if (v51 >= 0xB1 {
                               && (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                        }
                                                   + *v35) != 192)
                        {
                          goto LABEL_244;
                        }
                      }
                      else
                      {
                        unsigned int v40 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                               + *v35);
                        if (v40 <= 0x40) {
                          goto LABEL_198;
                        }
                        unsigned int v49 = (unsigned __int16)(v39 - 97);
                        if (v40 >= 0x5B && v49 >= 0x1A) {
                          goto LABEL_244;
                        }
                      }
                    }
                    if ((unsigned __int16)(v39 >> 3) > 0x402u) {
                      break;
                    }
                    unsigned int v43 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                           + *v35);
                    if (v43 > 0x2BA) {
                      goto LABEL_242;
                    }
                    if (v43 != 230) {
                      goto LABEL_244;
                    }
                  }
                  if (v39 <= 0x2031u)
                  {
LABEL_192:
                    if (v39 == 8218 || (unsigned __int16)(v39 >> 2) >= 0x807u) {
                      goto LABEL_244;
                    }
                  }
                  else
                  {
                    int v52 = (unsigned __int16)(SLChar::sLexFold[*v35 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v35 >> 6] << 6)]
                                           + *v35);
                    if (v52 != 8242 && v52 != 8245) {
                      goto LABEL_244;
                    }
                  }
                }
                if (v47 < 0xC1 || v47 == 198) {
                  goto LABEL_214;
                }
              }
LABEL_244:
              SLLexerInstance::CreateToken((uint64_t)this);
            }
          }
          else if (v37 < 0xC1u || v37 == 198)
          {
            goto LABEL_182;
          }
        }
        else if (v37 > 0x60u)
        {
          if (v37 < 0x7Bu || v37 == 176) {
            goto LABEL_182;
          }
        }
        else if ((unsigned __int16)(v37 - 65) < 0x1Au)
        {
          goto LABEL_182;
        }
        goto LABEL_167;
      }
      if (v26 <= 0x3Eu)
      {
        if (v26 > 0x2Eu)
        {
          if (v26 != 59) {
            goto LABEL_166;
          }
        }
        else if (v26 == 45)
        {
          goto LABEL_166;
        }
        goto LABEL_97;
      }
      if (v26 > 0x5Au)
      {
        if (v26 < 0x61u) {
          goto LABEL_166;
        }
        if (v26 >= 0x7Bu)
        {
          if (v26 >= 0xA0u) {
            goto LABEL_97;
          }
          goto LABEL_166;
        }
      }
      else
      {
        if (v26 < 0x40u) {
          goto LABEL_97;
        }
        if (v26 == 64) {
          goto LABEL_166;
        }
      }
    }
    unint64_t v35 = v3 + 1;
    *((void *)this + 3) = v35;
    goto LABEL_170;
  }
  while (1)
  {
LABEL_7:
    uint64_t v7 = (unsigned __int16 *)*((void *)this + 3);
    if ((uint64_t)(*((void *)this + 5) - (void)v7) <= 9)
    {
      SLLexerInstance::Refill(this);
      uint64_t v7 = (unsigned __int16 *)*((void *)this + 3);
    }
    unsigned int v8 = (unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7);
    if (v8 <= 0x52)
    {
      if (v8 > 0x1F)
      {
        unsigned int v10 = (unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7);
        if (v10 > 0x39)
        {
          if (v10 == 59)
          {
LABEL_28:
            unsigned int v11 = v7 + 1;
            *((void *)this + 3) = v11;
            while (1)
            {
              unsigned int v12 = (unsigned __int16)(SLChar::sLexFold[*v11 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v11 >> 6] << 6)]
                                     + *v11);
              if (v12 > 0x20)
              {
                int v14 = (unsigned __int16)(SLChar::sLexFold[*v11 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v11 >> 6] << 6)]
                                       + *v11);
                if (v12 > 0x9F)
                {
                  if (v14 != 160 && v14 != 8239) {
                    goto LABEL_7;
                  }
                }
                else if (v14 != 59)
                {
                  goto LABEL_7;
                }
              }
              else if (v12 <= 0xC)
              {
                if ((unsigned __int16)(SLChar::sLexFold[*v11 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v11 >> 6] << 6)]
                                      + *v11
                                      - 9) >= 2u)
                  goto LABEL_7;
              }
              else
              {
                unsigned int v13 = (unsigned __int16)(SLChar::sLexFold[*v11 & 0x3F | (SLChar::sUniMap[(unint64_t)(unsigned __int16)*v11 >> 6] << 6)]
                                       + *v11);
                if (v13 != 13 && v13 < 0x20) {
                  goto LABEL_7;
                }
              }
              *((void *)this + 3) = ++v11;
              if (*((_WORD **)this + 5) == v11)
              {
                SLLexerInstance::Refill(this);
                unsigned int v11 = (_WORD *)*((void *)this + 3);
              }
            }
          }
        }
        else
        {
          if (v10 < 0x21) {
            goto LABEL_28;
          }
          if ((unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7) >= 0x30u)
          {
            *((void *)this + 3) = v7 + 1;
            operator new();
          }
        }
      }
      else
      {
        unsigned int v9 = (unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7);
        if (v9 > 0xA)
        {
          if (v9 == 13) {
            goto LABEL_28;
          }
        }
        else if (v9 >= 9)
        {
          goto LABEL_28;
        }
      }
LABEL_49:
      *((void *)this + 3) = v7 + 1;
      goto LABEL_50;
    }
    if (v8 > 0x7C)
    {
      if ((unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7) > 0xA0u)
      {
        if ((unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7) == 8239) {
          goto LABEL_28;
        }
      }
      else
      {
        if ((unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7) < 0x7Eu)
        {
          *((void *)this + 3) = v7 + 1;
          *((unsigned char *)this + 120) = 0;
          SLLexerImpl::SkipSpaces(this);
          uint64_t v2 = (_WORD *)*((void *)this + 3);
LABEL_64:
          *((void *)this + 8) = v2;
          goto LABEL_2;
        }
        if ((unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7) >= 0xA0u) {
          goto LABEL_28;
        }
      }
      goto LABEL_49;
    }
    unsigned int v16 = (unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7);
    if (v16 > 0x72)
    {
      if (v16 == 115)
      {
LABEL_52:
        unsigned int v17 = v7 + 1;
        unint64_t v18 = v7[1];
        *((void *)this + 3) = v7 + 1;
        *((void *)this + 6) = v7 + 1;
        if ((((unsigned __int16)SLChar::sLexFold[v18 & 0x3F | (SLChar::sUniMap[v18 >> 6] << 6)] + v18) & 0xFFDF) != 0x57) {
          goto LABEL_50;
        }
        unint64_t v19 = v7[2];
        *((void *)this + 3) = v7 + 2;
        if ((((unsigned __int16)SLChar::sLexFold[v19 & 0x3F | (SLChar::sUniMap[v19 >> 6] << 6)] + v19) & 0xFFDF) == 0x49)
        {
          unint64_t v20 = v7[3];
          *((void *)this + 3) = v7 + 3;
          if ((((unsigned __int16)SLChar::sLexFold[v20 & 0x3F | (SLChar::sUniMap[v20 >> 6] << 6)] + v20) & 0xFFDF) == 0x4E)
          {
            unint64_t v21 = v7[4];
            *((void *)this + 3) = v7 + 4;
            if ((((unsigned __int16)SLChar::sLexFold[v21 & 0x3F | (SLChar::sUniMap[v21 >> 6] << 6)] + v21) & 0xFFDF) == 0x47)
            {
              *((void *)this + 3) = v7 + 5;
              int v31 = (unsigned __int16 **)this;
              unsigned int v32 = 1937206887;
              goto LABEL_134;
            }
          }
        }
        goto LABEL_62;
      }
      if ((unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7) >= 0x75u) {
        goto LABEL_49;
      }
    }
    else
    {
      if (v16 < 0x54) {
        goto LABEL_52;
      }
      if ((unsigned __int16)(SLChar::sLexFold[*v7 & 0x3F | (SLChar::sUniMap[(unint64_t)*v7 >> 6] << 6)] + *v7) != 84) {
        goto LABEL_49;
      }
    }
    unsigned int v17 = v7 + 1;
    unint64_t v22 = v7[1];
    *((void *)this + 3) = v7 + 1;
    *((void *)this + 6) = v7 + 1;
    if ((((unsigned __int16)SLChar::sLexFold[v22 & 0x3F | (SLChar::sUniMap[v22 >> 6] << 6)] + v22) & 0xFFDF) != 0x52) {
      goto LABEL_50;
    }
    unint64_t v23 = v7[2];
    *((void *)this + 3) = v7 + 2;
    if ((((unsigned __int16)SLChar::sLexFold[v23 & 0x3F | (SLChar::sUniMap[v23 >> 6] << 6)] + v23) & 0xFFDF) == 0x41)
    {
      unint64_t v24 = v7[3];
      *((void *)this + 3) = v7 + 3;
      if ((((unsigned __int16)SLChar::sLexFold[v24 & 0x3F | (SLChar::sUniMap[v24 >> 6] << 6)] + v24) & 0xFFDF) == 0x4E)
      {
        unint64_t v25 = v7[4];
        *((void *)this + 3) = v7 + 4;
        if ((((unsigned __int16)SLChar::sLexFold[v25 & 0x3F | (SLChar::sUniMap[v25 >> 6] << 6)] + v25) & 0xFFDF) == 0x53) {
          break;
        }
      }
    }
LABEL_62:
    *((void *)this + 3) = v17;
LABEL_50:
    SLLexerImpl::AttrError(this);
  }
  *((void *)this + 3) = v7 + 5;
  int v31 = (unsigned __int16 **)this;
  unsigned int v32 = 1953657712;
LABEL_134:
  return SLLexerImpl::SimpleCommand(v31, v32, 3u);
}

void SLCartDict::Create()
{
}

void SLMorphRules::Create()
{
}

void SLMorphRules::CreateFlat()
{
}

void SLPronouncer::Create()
{
}

void SLTuples::Create()
{
}

void SLToken::ExcludeHomographs()
{
}

void SLElementNames::Create()
{
}

void SLCFStringTextSource::Refill()
{
  __assert_rtn("Refill", "SLLexer.cp", 71, "keep >= 0");
}

void SLDictLookup::Create()
{
}

void SLDictLookup::CreatePhonemeSymbols()
{
}

uint64_t SLDictLookup::Lookup(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
}

void SLPhonemeParser::Create()
{
}

void SLAgglomerate::Create()
{
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x270EE42F0](allocator, values, numValues, callBacks);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCharacters(CFMutableStringRef theString, const UniChar *chars, CFIndex numChars)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE5100](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithPascalString(CFAllocatorRef alloc, ConstStr255Param pStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE5120](alloc, pStr, *(void *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE51B8](string, buffer, maxBufLen);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeOfFileSystemRepresentation(CFStringRef string)
{
  return MEMORY[0x270EE51E8](string);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x270EE5328](anURL, pathStyle);
}

uint64_t CPGetDeviceRegionCode()
{
  return MEMORY[0x270F0CD50]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::append(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984B0](this, __n, __c);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string::iterator std::string::insert(std::string *this, std::string::const_iterator __pos, std::string::value_type __c)
{
  return (std::string::iterator)MEMORY[0x270F984D8](this, __pos.__i_, __c);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, std::string::size_type __n, std::string::value_type __c)
{
  return (std::string *)MEMORY[0x270F984F0](this, __pos, __n, __c);
}

std::string *__cdecl std::string::replace(std::string *this, std::string::size_type __pos, std::string::size_type __n1, const std::string::value_type *__s, std::string::size_type __n2)
{
  return (std::string *)MEMORY[0x270F98508](this, __pos, __n1, __s, __n2);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x270F98548](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

void operator new()
{
  while (1)
    ;
}

__darwin_ct_rune_t ___toupper_l(__darwin_ct_rune_t a1, locale_t a2)
{
  return MEMORY[0x270ED7D80](*(void *)&a1, a2);
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

int __maskrune_l(__darwin_ct_rune_t a1, unint64_t a2, locale_t a3)
{
  return MEMORY[0x270ED7E30](*(void *)&a1, a2, a3);
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int freelocale(locale_t a1)
{
  return MEMORY[0x270ED9A58](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

locale_t newlocale(int a1, const char *a2, locale_t a3)
{
  return (locale_t)MEMORY[0x270EDA708](*(void *)&a1, a2, a3);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x270F9B4E0](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x270F9B558](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x270F9B568](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B570](a1, *(void *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x270F9B5A0](a1, *(void *)&iCol);
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

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x270EDB5A8](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncasecmp_l(const char *a1, const char *a2, size_t a3, locale_t a4)
{
  return MEMORY[0x270EDB628](a1, a2, a3, a4);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB668](__s1, __s2);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

int32_t u_charName(UChar32 code, UCharNameChoice nameChoice, char *buffer, int32_t bufferLength, UErrorCode *pErrorCode)
{
  return MEMORY[0x270F994E0](*(void *)&code, *(void *)&nameChoice, buffer, *(void *)&bufferLength, pErrorCode);
}

UBool u_isgraph(UChar32 c)
{
  return MEMORY[0x270F99550](*(void *)&c);
}