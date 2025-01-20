CFIndex ThaiTokenizerSetStringWithRange(CFIndex result, CFStringRef str, CFRange range)
{
  void *v3;
  CFIndex v4;
  CFIndex location;
  const void *v7;
  CFAllocatorRef v8;
  CFStringRef v9;
  CFIndex Length;
  const void *v11;
  const void *v12;
  CFArrayRef Mutable;
  CFIndex v14;
  CFStringRef v15;
  unsigned int CharacterAtIndex;
  int v17;
  BOOL v18;
  CFIndex v19;
  unsigned int v20;
  int v21;
  BOOL v22;
  CFNumberRef v23;
  CFIndex v24;
  const void *v25;
  CFStringRef v26;
  int64_t v27;
  uint64_t v28;
  void *v29;
  CFIndex v30;
  unsigned __int16 v31;
  int v32;
  unsigned __int16 v33;
  unint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void **v42;
  void *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v75;
  uint64_t v76;
  float UnkProb;
  uint64_t v78;
  void *v79;
  __CFArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  BOOL v87;
  CFNumberRef v88;
  __CFArray *v89;
  int v90;
  CFIndex valuePtr;
  uint64_t v93;
  CFRange v94;
  CFRange v95;
  CFRange v96;

  v3 = (void *)result;
  if (str && (v4 = range.length) != 0)
  {
    location = range.location;
    v7 = *(const void **)(result + 8);
    if (v7) {
      CFRelease(v7);
    }
    v3[2] = location;
    v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    v94.location = location;
    v94.length = v4;
    v9 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], str, v94);
    v3[1] = v9;
    Length = CFStringGetLength(v9);
    v3[7] = Length;
    valuePtr = 0;
    v11 = (const void *)v3[3];
    if (v11) {
      CFRelease(v11);
    }
    v12 = (const void *)v3[4];
    if (v12) {
      CFRelease(v12);
    }
    Mutable = CFArrayCreateMutable(v8, 0, MEMORY[0x263EFFF70]);
    v3[4] = Mutable;
    if (Length >= 1)
    {
      v14 = 0;
      while (1)
      {
        v15 = (const __CFString *)v3[1];
        CharacterAtIndex = CFStringGetCharacterAtIndex(v15, v14);
        v17 = 1;
        if (CharacterAtIndex - 3648 < 0xE) {
          goto LABEL_24;
        }
        v18 = (unsigned __int16)(CharacterAtIndex - 3585) >= 0x2Eu
           && (unsigned __int16)(CharacterAtIndex - 3632) >= 0xBu;
        if (!v18) {
          goto LABEL_24;
        }
        if (CharacterAtIndex > 0x20 || ((1 << CharacterAtIndex) & 0x100003E00) == 0)
        {
          if (CharacterAtIndex == 3631)
          {
            v19 = v14 + 1;
            if (v14 + 2 < Length)
            {
              v90 = CFStringGetCharacterAtIndex(v15, v14 + 1);
              if (CFStringGetCharacterAtIndex(v15, v14 + 2) == 3631 && v90 == 3621) {
                v19 = v14 + 3;
              }
            }
            goto LABEL_31;
          }
          if (CharacterAtIndex != 160 && !isPunct(CharacterAtIndex))
          {
            v17 = 16;
LABEL_24:
            v19 = v14 + 1;
            if (v14 + 1 < Length)
            {
              while (1)
              {
                v20 = CFStringGetCharacterAtIndex(v15, v19);
                if (v20 != 46 && v17 != getChunkType(v20)) {
                  break;
                }
                if (Length == ++v19)
                {
                  v19 = Length;
                  break;
                }
              }
            }
            if (v19 >= Length) {
              v19 = Length;
            }
            goto LABEL_31;
          }
        }
        v19 = v14 + 1;
LABEL_31:
        valuePtr = v19;
        v21 = CFStringGetCharacterAtIndex((CFStringRef)v3[1], v14);
        if ((v21 - 3648) >= 0xE
          && ((v21 - 3585) >= 0x2E ? (v22 = (v21 - 3632) > 0xA) : (v22 = 0), v22))
        {
          v23 = CFNumberCreate(v8, kCFNumberCFIndexType, &valuePtr);
          CFArrayAppendValue((CFMutableArrayRef)v3[4], v23);
          CFRelease(v23);
        }
        else
        {
          v24 = valuePtr;
          v25 = (const void *)v3[11];
          if (v25) {
            CFRelease(v25);
          }
          v95.length = v24 - v14;
          v95.location = v14;
          v26 = CFStringCreateWithSubstring(v8, (CFStringRef)v3[1], v95);
          v3[11] = v26;
          v27 = CFStringGetLength(v26);
          v3[12] = v27;
          v3[14] = v14;
          v28 = (unint64_t)v27 >> 1;
          if (v27 < 100) {
            v28 = 50;
          }
          v3[9] = v28;
          v29 = malloc_type_calloc(v27, 8uLL, 0x2004093837F09uLL);
          v3[8] = v29;
          if (v29 && (uint64_t)v3[12] > 1)
          {
            v30 = 0;
            v31 = 3585;
            do
            {
              v32 = CFStringGetCharacterAtIndex((CFStringRef)v3[11], v30);
              v33 = v32;
              if ((v32 == 46
                 || v32 == 3654
                 || (unsigned __int16)(v32 - 3631) > 0xFFD1u
                 || (unsigned __int16)(v32 - 3653) >= 0xFFFBu)
                && isThaiEndingChar(v31))
              {
                if (v30 + 1 < v3[12])
                {
                  v34 = 2;
                  do
                  {
                    v35 = CFStringGetCharacterAtIndex((CFStringRef)v3[11], v34 - 1 + v30);
                    if (isThaiEndingChar(v35))
                    {
                      if ((uint64_t)(v34 - 1 + v30) >= v3[12] - 1
                        || (v36 = CFStringGetCharacterAtIndex((CFStringRef)v3[11], v30 + v34), v36 == 46)
                        || v36 == 3654
                        || (v36 - 3631) > 0xFFFFFFD1
                        || (v36 - 3653) >= 0xFFFFFFFB)
                      {
                        LODWORD(v93) = 0;
                        if ((int64_t)(v34 - 1) >= v3[12]) {
                          break;
                        }
                        if ((*(unsigned int (**)(void, void, CFIndex, unint64_t, uint64_t *))(*(void *)*v3 + 24))(*v3, v3[11], v30, v34, &v93))
                        {
                          v37 = *(void *)(v3[8] + 8 * v30);
                          if (v37)
                          {
                            v38 = *(void *)(v37 + 184);
                          }
                          else
                          {
                            v39 = malloc_type_malloc(0xC0uLL, 0x1000040DEF5506FuLL);
                            v38 = 0;
                            *(void *)(v3[8] + 8 * v30) = v39;
                            v37 = *(void *)(v3[8] + 8 * v30);
                            *(void *)(v37 + 160) = 0;
                            *(void *)(v37 + 176) = 0;
                            *(void *)(v37 + 184) = 0;
                            *(_DWORD *)(v37 + 168) = -915135488;
                            *(unsigned char *)(v37 + 172) = 0;
                            ++v3[9];
                          }
                          v40 = v37 + 16 * v38;
                          *(_DWORD *)(v40 + 8) = v93;
                          *(void *)v40 = v30 + v34;
                          *(void *)(v37 + 184) = v38 + 1;
                          if (v38 >= 9) {
                            break;
                          }
                        }
                      }
                    }
                    if ((int64_t)(v30 + v34) >= v3[12]) {
                      break;
                    }
                    v18 = v34++ >= 0x65;
                  }
                  while (!v18);
                }
              }
              else
              {
                v41 = *(void **)(v3[8] + 8 * v30);
                if (v41)
                {
                  free(v41);
                  *(void *)(v3[8] + 8 * v30) = 0;
                }
              }
              ++v30;
              v31 = v33;
            }
            while (v30 < v3[12] - 1);
          }
          v43 = (void *)v3[9];
          v42 = (void **)v3[10];
          *v42 = malloc_type_malloc(8 * (void)v43, 0x100004000313F17uLL);
          v42[1] = v43;
          v42[2] = 0;
          if ((uint64_t)v3[12] >= 1)
          {
            v44 = 0;
            do
            {
              v45 = (uint64_t *)v3[10];
              v46 = v45[2];
              if (v46 < v45[1])
              {
                v47 = *v45;
                v45[2] = v46 + 1;
                *(void *)(v47 + 8 * v46) = v44;
              }
              v48 = v3[8];
              v49 = *(void *)(v48 + 8 * v44);
              if (v49)
              {
                v50 = *(void *)(v49 + 184);
                v51 = v50 - 1;
                if (v50 <= 1) {
                  v51 = *(void *)(v49 + 176);
                }
                else {
                  *(void *)(v49 + 176) = v51;
                }
                v53 = *(void *)(v49 + 16 * v51);
                v55 = v3[12];
                if (v53 == v55)
                {
                  *(void *)(v49 + 160) = v53;
                  *(_DWORD *)(v49 + 168) = *(_DWORD *)(v49 + 16 * v51 + 8);
                  if (v50 == 1) {
                    *(unsigned char *)(v49 + 172) = 1;
                  }
                  else {
                    *(void *)(v49 + 176) = v51 - 1;
                  }
                  break;
                }
              }
              else
              {
                v52 = v3[12];
                v53 = v44;
                if (v44 < v52)
                {
                  v53 = v44;
                  while (!*(void *)(v48 + 8 * v53))
                  {
                    if (v52 == ++v53)
                    {
                      v53 = v3[12];
                      break;
                    }
                  }
                }
                *(void *)(v3[8] + 8 * v44) = malloc_type_malloc(0xC0uLL, 0x1000040DEF5506FuLL);
                v54 = *(void *)(v3[8] + 8 * v44);
                *(_OWORD *)(v54 + 176) = xmmword_23FF70B50;
                *(void *)(v54 + 160) = 0;
                *(_DWORD *)(v54 + 168) = -915135488;
                *(unsigned char *)(v54 + 172) = 0;
                *(void *)v54 = v53;
                *(float *)(*(void *)(v3[8] + 8 * v44) + 8) = getUnkProb((const __CFString *)v3[1], v3[7], v3[14] + v44, v53 - v44);
                v55 = v3[12];
              }
              v44 = v53;
            }
            while (v53 < v55);
          }
          v56 = v3[10];
          v58 = (void *)(v56 + 16);
          v57 = *(void *)(v56 + 16);
          if (v57 >= 1)
          {
            v59 = v3[8];
            do
            {
              v60 = *(void **)v56;
              v61 = *(void *)(v59 + 8 * *(void *)(*(void *)v56 + 8 * (v57 - 1)));
              if (*(unsigned char *)(v61 + 172))
              {
                *v58 = v57 - 1;
              }
              else
              {
                v62 = *(void *)(v61 + 176);
                v63 = *(void *)(v61 + 16 * v62);
                v64 = v3[12];
                if (v63 < v64 && !*(void *)(v59 + 8 * v63))
                {
                  *(void *)(v3[8] + 8 * v63) = malloc_type_malloc(0xC0uLL, 0x1000040DEF5506FuLL);
                  v67 = v3[8];
                  v68 = *(void *)(v67 + 8 * v63);
                  *(_OWORD *)(v68 + 176) = xmmword_23FF70B50;
                  *(void *)(v68 + 160) = 0;
                  *(_DWORD *)(v68 + 168) = -915135488;
                  *(unsigned char *)(v68 + 172) = 0;
                  v69 = v3[12];
                  if (v69 <= v63 + 1) {
                    v70 = v63 + 1;
                  }
                  else {
                    v70 = v3[12];
                  }
                  v71 = v67 + 8;
                  v72 = v63;
                  while (1)
                  {
                    v73 = v72 + 1;
                    if (v72 + 1 >= v69) {
                      break;
                    }
                    if (*(void *)(v71 + 8 * v72++)) {
                      goto LABEL_120;
                    }
                  }
                  v73 = v70;
LABEL_120:
                  *(void *)v68 = v73;
                  UnkProb = getUnkProb((const __CFString *)v3[1], v3[7], v3[14] + v63, v73 - v63);
                  v59 = v3[8];
                  *(float *)(*(void *)(v59 + 8 * v63) + 8) = UnkProb;
                  v56 = v3[10];
                  v78 = *(void *)(v56 + 16);
                  if (v78 < *(void *)(v56 + 8))
                  {
                    v79 = *(void **)v56;
                    *(void *)(v56 + 16) = v78 + 1;
                    v79[v78] = v63;
                  }
                  goto LABEL_95;
                }
                if (v63 == v64)
                {
                  v65 = *(float *)(v61 + 16 * v62 + 8);
                }
                else
                {
                  v66 = *(void *)(v59 + 8 * v63);
                  if (!*(unsigned char *)(v66 + 172))
                  {
                    if (v57 < *(void *)(v56 + 8))
                    {
                      *v58 = v57 + 1;
                      v60[v57] = v63;
                    }
                    v75 = *(void *)(v66 + 184);
                    v22 = v75 <= 1;
                    v76 = v75 - 1;
                    if (!v22) {
                      *(void *)(v66 + 176) = v76;
                    }
                    goto LABEL_95;
                  }
                  v65 = *(float *)(v61 + 16 * v62 + 8) + *(float *)(v66 + 168);
                }
                if (v65 > *(float *)(v61 + 168))
                {
                  *(float *)(v61 + 168) = v65;
                  *(void *)(v61 + 160) = v63;
                }
                if (v62 < 1) {
                  *(unsigned char *)(v61 + 172) = 1;
                }
                else {
                  *(void *)(v61 + 176) = v62 - 1;
                }
              }
LABEL_95:
              v58 = (void *)(v56 + 16);
              v57 = *(void *)(v56 + 16);
            }
            while (v57 >= 1);
          }
          if (*(void *)v56) {
            free(*(void **)v56);
          }
          *v58 = 0;
          v80 = CFArrayCreateMutable(v8, 0, MEMORY[0x263EFFF70]);
          v81 = v3[12];
          if (v81 >= 1)
          {
            v82 = 0;
            v93 = 0;
            while (1)
            {
              v83 = v3[8];
              v84 = *(void *)(*(void *)(v83 + 8 * v82) + 160);
              if (v84 - v82 == 1) {
                break;
              }
              v86 = v84 < 1 || v81 <= v84;
              if (!v86 && CFStringGetCharacterAtIndex((CFStringRef)v3[11], v84 - 1) == 46)
              {
                v83 = v3[8];
                v85 = *(void *)(*(void *)(v83 + 8 * v82) + 160);
                v81 = v3[12];
                goto LABEL_134;
              }
LABEL_141:
              v93 = v3[14] + v84;
              v88 = CFNumberCreate(v8, kCFNumberCFIndexType, &v93);
              CFArrayAppendValue(v80, v88);
              CFRelease(v88);
              v81 = v3[12];
              v82 = v84;
              if (v84 >= v81) {
                goto LABEL_142;
              }
            }
            v85 = *(void *)(*(void *)(v83 + 8 * v82) + 160);
LABEL_134:
            if (v85 >= v81
              || ((v84 = *(void *)(*(void *)(v83 + 8 * v85) + 160), v84 >= 1) ? (v87 = v81 <= v84) : (v87 = 1),
                  v87 || CFStringGetCharacterAtIndex((CFStringRef)v3[11], v84 - 1) != 46))
            {
              v84 = v85;
            }
            goto LABEL_141;
          }
LABEL_142:
          v89 = (__CFArray *)v3[4];
          v96.length = CFArrayGetCount(v80);
          v96.location = 0;
          CFArrayAppendArray(v89, v80, v96);
          CFRelease(v80);
          ReleaseTransitionTable((uint64_t)v3);
        }
        v14 = valuePtr;
        if (valuePtr >= Length)
        {
          Mutable = (const __CFArray *)v3[4];
          break;
        }
      }
    }
    result = CFArrayGetCount(Mutable);
    v3[5] = -1;
    v3[6] = result;
  }
  else
  {
    *(void *)(result + 56) = 0;
  }
  return result;
}

uint64_t ThaiTokenizerCreate(const __CFAllocator *a1, unsigned int a2)
{
  v4 = CFAllocatorAllocate(a1, 128, 0);
  uint64_t v5 = (uint64_t)v4;
  if (v4)
  {
    v4[5] = 0u;
    v4[6] = 0u;
    v4[3] = 0u;
    v4[4] = 0u;
    v4[1] = 0u;
    v4[2] = 0u;
    _OWORD *v4 = 0u;
    *((void *)v4 + 14) = 0;
    *((void *)v4 + 15) = a1;
    if (a2 <= 0x7D0) {
      uint64_t v6 = 2000;
    }
    else {
      uint64_t v6 = a2;
    }
    *((void *)v4 + 13) = v6;
    v7 = getenv("THAI_TOK_ROOT");
    CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    if (v7) {
      v9 = v7;
    }
    else {
      v9 = "/";
    }
    CFStringRef v10 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, 0x8000100u);
    v11 = (Utils::TrieWrapper *)CFStringCreateWithFormat(v8, 0, @"%@/System/Library/LinguisticData/th/tokenizer.dat", v10);
    if (v11) {
      Utils::TrieWrapper::loadTrie(v11, v12);
    }
    CFShow(@"Problem in setting triePath\n");
    ThaiTokenizerDestroy(v5);
    if (v10) {
      CFRelease(v10);
    }
    return 0;
  }
  return v5;
}

void sub_23FF6B8E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t ThaiTokenizerDestroy(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  if (v2)
  {
    *(void *)a1 = 0;
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  ReleaseTransitionTable(a1);
  v3 = *(const void **)(a1 + 8);
  if (v3) {
    CFRelease(v3);
  }
  v4 = *(const void **)(a1 + 24);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = *(const void **)(a1 + 32);
  if (v5) {
    CFRelease(v5);
  }
  uint64_t v6 = *(const void **)(a1 + 88);
  if (v6) {
    CFRelease(v6);
  }
  v7 = *(void **)(a1 + 80);
  if (v7) {
    free(v7);
  }
  CFAllocatorDeallocate(*(CFAllocatorRef *)(a1 + 120), (void *)a1);
  return 1;
}

double marisa::Agent::Agent(marisa::Agent *this)
{
  double result = 0.0;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *(_OWORD *)this = 0u;
  return result;
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
}

void *marisa::Agent::set_query(void *this, const char *a2, uint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x200000015;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:21: MARISA_NULL_ERROR: (ptr == NULL)"
                   " && (length != 0)";
  }
  uint64_t v3 = this[5];
  if (v3) {
    *(_DWORD *)(v3 + 108) = 0;
  }
  *this = a2;
  this[1] = a3;
  return this;
}

void *marisa::Agent::init_state(marisa::Agent *this)
{
  v1 = (uint64_t *)((char *)this + 40);
  if (*((void *)this + 5))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x100000024;
    uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:36: MARISA_STATE_ERROR: state_.get() != NULL";
    goto LABEL_8;
  }
  uint64_t v2 = operator new(0x70uLL, MEMORY[0x263F8C180]);
  if (v2)
  {
    *(_OWORD *)((char *)v2 + 2marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0u;
    *uint64_t v2 = 0u;
    v2[1] = 0u;
    v2[3] = 0u;
    v2[4] = 0u;
    *(_OWORD *)((char *)v2 + 73) = 0u;
    *((void *)v2 + 12) = 0;
    *((void *)v2 + 13) = 0;
  }
  double result = marisa::scoped_ptr<marisa::grimoire::trie::State>::reset(v1, (uint64_t)v2);
  if (!*v1)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc";
    exception[2] = 0x800000026;
    uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/agent.cc:38: MARISA_MEMORY_ERROR: state_.get() == NULL";
LABEL_8:
    exception[3] = v5;
  }
  return result;
}

void *marisa::scoped_ptr<marisa::grimoire::trie::State>::reset(uint64_t *a1, uint64_t a2)
{
  if (a2 && *a1 == a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h";
    exception[2] = 0x600000013;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h:19: MARISA_RESET_ERROR: (ptr"
                   " != NULL) && (ptr == ptr_)";
  }
  uint64_t v4 = *a1;
  *a1 = a2;
  return marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr(&v4);
}

void marisa::Exception::~Exception(std::exception *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x2455DD660);
}

uint64_t marisa::Exception::what(marisa::Exception *this)
{
  return *((void *)this + 3);
}

void *marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr(void *a1)
{
  uint64_t v2 = (void *)*a1;
  if (*a1)
  {
    uint64_t v3 = v2[6];
    if (v3) {
      MEMORY[0x2455DD630](v3, 0x1000C8077774924);
    }
    if (*v2) {
      MEMORY[0x2455DD630](*v2, 0x1000C8077774924);
    }
    MEMORY[0x2455DD660](v2, 0x1070C406A3FAA47);
  }
  return a1;
}

uint64_t marisa::grimoire::io::Mapper::Mapper(uint64_t this)
{
  *(void *)this = 0;
  *(void *)(this + 8) = -1;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = 0;
  *(_DWORD *)(this + 32) = -1;
  return this;
}

void marisa::grimoire::io::Mapper::~Mapper(marisa::grimoire::io::Mapper *this)
{
  uint64_t v2 = (void *)*((void *)this + 1);
  if (v2 != (void *)-1) {
    munmap(v2, *((void *)this + 3));
  }
  int v3 = *((_DWORD *)this + 8);
  if (v3 != -1) {
    close(v3);
  }
}

void __clang_call_terminate(void *a1)
{
}

uint64_t *marisa::grimoire::io::Mapper::swap(uint64_t *this, marisa::grimoire::io::Mapper *a2)
{
  uint64_t v2 = *this;
  *this = *(void *)a2;
  *(void *)a2 = v2;
  uint64_t v4 = this[1];
  uint64_t v3 = this[2];
  uint64_t v5 = *((void *)a2 + 2);
  this[1] = *((void *)a2 + 1);
  this[2] = v5;
  *((void *)a2 + 1) = v4;
  *((void *)a2 + 2) = v3;
  uint64_t v6 = this[3];
  this[3] = *((void *)a2 + 3);
  *((void *)a2 + 3) = v6;
  LODWORD(v6) = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = *((_DWORD *)a2 + 8);
  *((_DWORD *)a2 + 8) = v6;
  return this;
}

__n128 marisa::grimoire::io::Mapper::open(marisa::grimoire::io::Mapper *this, const void *a2, uint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x20000003FLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:63: MARISA_NULL_ERROR: "
                   "(ptr == NULL) && (size != 0)";
  }
  long long v3 = *(_OWORD *)this;
  long long v4 = *((_OWORD *)this + 1);
  *(void *)this = a2;
  *((void *)this + 1) = -1;
  *((void *)this + 2) = a3;
  *((void *)this + 3) = 0;
  v8[0] = v3;
  v8[1] = v4;
  int v5 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = -1;
  int v9 = v5;
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)v8);
  return result;
}

uint64_t marisa::grimoire::io::Mapper::seek(marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  if (!*(void *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000047;
    long long v4 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:71: MARISA_STATE_ERROR: !is_open()";
    goto LABEL_8;
  }
  if (*((void *)this + 2) < a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000048;
    long long v4 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:72: MARISA_IO_ERROR: size > avail_";
LABEL_8:
    exception[3] = v4;
  }

  return marisa::grimoire::io::Mapper::map_data(this, a2);
}

uint64_t marisa::grimoire::io::Mapper::map_data(marisa::grimoire::io::Mapper *this, unint64_t a2)
{
  uint64_t v2 = *(void *)this;
  if (!*(void *)this)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x100000063;
    CFAllocatorRef v8 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:99: MARISA_STATE_ERROR: !is_open()";
LABEL_6:
    exception[3] = v8;
  }
  unint64_t v3 = *((void *)this + 2);
  BOOL v4 = v3 >= a2;
  unint64_t v5 = v3 - a2;
  if (!v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc";
    exception[2] = 0x900000064;
    CFAllocatorRef v8 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/io/mapper.cc:100: MARISA_IO_ERROR: size > avail_";
    goto LABEL_6;
  }
  *(void *)this = v2 + a2;
  *((void *)this + 2) = v5;
  return v2;
}

marisa::grimoire::trie::LoudsTrie *marisa::grimoire::trie::LoudsTrie::LoudsTrie(marisa::grimoire::trie::LoudsTrie *this)
{
  *(_OWORD *)((char *)this + 2marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 18marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 89) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *(_OWORD *)((char *)this + 34marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0u;
  *(_OWORD *)((char *)this + 393) = 0u;
  *((_OWORD *)this + 23) = 0u;
  *((_OWORD *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 297) = 0u;
  *((_OWORD *)this + 17) = 0u;
  *((_OWORD *)this + 18) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *(_OWORD *)((char *)this + 441) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_OWORD *)this + 27) = 0u;
  *(_OWORD *)((char *)this + 553) = 0u;
  *((_OWORD *)this + 33) = 0u;
  *((_OWORD *)this + 34) = 0u;
  *(_OWORD *)((char *)this + 601) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_OWORD *)this + 37) = 0u;
  *(_OWORD *)((char *)this + 50marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0u;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_OWORD *)this + 29) = 0u;
  *(_OWORD *)((char *)this + 649) = 0u;
  *((_OWORD *)this + 39) = 0u;
  *((_OWORD *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 697) = 0u;
  *((_OWORD *)this + 42) = 0u;
  *((_OWORD *)this + 43) = 0u;
  *((void *)this + 90) = 0;
  *((_DWORD *)this + 182) = 0;
  *((void *)this + 92) = 0;
  marisa::grimoire::trie::Tail::Tail((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744));
  *((unsigned char *)this + 1048) = 0;
  *(_OWORD *)((char *)this + 1016) = 0u;
  *(_OWORD *)((char *)this + 1032) = 0u;
  *(_OWORD *)((char *)this + 1000) = 0u;
  *((_OWORD *)this + 66) = 0u;
  *((void *)this + 134) = 3;
  *((void *)this + 13marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0x100000000200;
  *((_DWORD *)this + 272) = 0x20000;
  marisa::grimoire::io::Mapper::Mapper((uint64_t)this + 1096);
  return this;
}

void sub_23FF6C124(_Unwind_Exception *a1)
{
  uint64_t v9 = *((void *)v1 + 126);
  if (v9) {
    MEMORY[0x2455DD630](v9, 0x1000C8077774924);
  }
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(v5);
  marisa::grimoire::trie::Tail::~Tail(v4);
  if (*v7) {
    MEMORY[0x2455DD630](*v7, 0x1000C8077774924);
  }
  if (*v6) {
    MEMORY[0x2455DD630](*v6, 0x1000C8077774924);
  }
  marisa::grimoire::vector::BitVector::~BitVector(v3);
  marisa::grimoire::vector::BitVector::~BitVector(v2);
  marisa::grimoire::vector::BitVector::~BitVector(v1);
  _Unwind_Resume(a1);
}

void marisa::grimoire::trie::Tail::~Tail(marisa::grimoire::trie::Tail *this)
{
  uint64_t v2 = *((void *)this + 26);
  if (v2) {
    MEMORY[0x2455DD630](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 20);
  if (v3) {
    MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 14);
  if (v4) {
    MEMORY[0x2455DD630](v4, 0x1000C8077774924);
  }
  uint64_t v5 = *((void *)this + 6);
  if (v5) {
    MEMORY[0x2455DD630](v5, 0x1000C8077774924);
  }
  if (*(void *)this) {
    MEMORY[0x2455DD630](*(void *)this, 0x1000C8077774924);
  }
}

void marisa::grimoire::vector::BitVector::~BitVector(marisa::grimoire::vector::BitVector *this)
{
  uint64_t v2 = *((void *)this + 20);
  if (v2) {
    MEMORY[0x2455DD630](v2, 0x1000C8077774924);
  }
  uint64_t v3 = *((void *)this + 14);
  if (v3) {
    MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 8);
  if (v4) {
    MEMORY[0x2455DD630](v4, 0x1000C8077774924);
  }
  if (*(void *)this) {
    MEMORY[0x2455DD630](*(void *)this, 0x1000C8077774924);
  }
}

void marisa::grimoire::trie::LoudsTrie::~LoudsTrie(marisa::grimoire::trie::LoudsTrie *this)
{
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::trie::LoudsTrie *)((char *)this + 1096));
  uint64_t v2 = *((void *)this + 126);
  if (v2) {
    MEMORY[0x2455DD630](v2, 0x1000C8077774924);
  }
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)this + 125);
  uint64_t v3 = *((void *)this + 119);
  if (v3) {
    MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  uint64_t v4 = *((void *)this + 113);
  if (v4) {
    MEMORY[0x2455DD630](v4, 0x1000C8077774924);
  }
  uint64_t v5 = *((void *)this + 107);
  if (v5) {
    MEMORY[0x2455DD630](v5, 0x1000C8077774924);
  }
  uint64_t v6 = *((void *)this + 99);
  if (v6) {
    MEMORY[0x2455DD630](v6, 0x1000C8077774924);
  }
  uint64_t v7 = *((void *)this + 93);
  if (v7) {
    MEMORY[0x2455DD630](v7, 0x1000C8077774924);
  }
  uint64_t v8 = *((void *)this + 84);
  if (v8) {
    MEMORY[0x2455DD630](v8, 0x1000C8077774924);
  }
  uint64_t v9 = *((void *)this + 78);
  if (v9) {
    MEMORY[0x2455DD630](v9, 0x1000C8077774924);
  }
  uint64_t v10 = *((void *)this + 72);
  if (v10) {
    MEMORY[0x2455DD630](v10, 0x1000C8077774924);
  }
  uint64_t v11 = *((void *)this + 66);
  if (v11) {
    MEMORY[0x2455DD630](v11, 0x1000C8077774924);
  }
  uint64_t v12 = *((void *)this + 60);
  if (v12) {
    MEMORY[0x2455DD630](v12, 0x1000C8077774924);
  }
  uint64_t v13 = *((void *)this + 52);
  if (v13) {
    MEMORY[0x2455DD630](v13, 0x1000C8077774924);
  }
  uint64_t v14 = *((void *)this + 46);
  if (v14) {
    MEMORY[0x2455DD630](v14, 0x1000C8077774924);
  }
  uint64_t v15 = *((void *)this + 40);
  if (v15) {
    MEMORY[0x2455DD630](v15, 0x1000C8077774924);
  }
  uint64_t v16 = *((void *)this + 34);
  if (v16) {
    MEMORY[0x2455DD630](v16, 0x1000C8077774924);
  }
  uint64_t v17 = *((void *)this + 26);
  if (v17) {
    MEMORY[0x2455DD630](v17, 0x1000C8077774924);
  }
  uint64_t v18 = *((void *)this + 20);
  if (v18) {
    MEMORY[0x2455DD630](v18, 0x1000C8077774924);
  }
  uint64_t v19 = *((void *)this + 14);
  if (v19) {
    MEMORY[0x2455DD630](v19, 0x1000C8077774924);
  }
  uint64_t v20 = *((void *)this + 8);
  if (v20) {
    MEMORY[0x2455DD630](v20, 0x1000C8077774924);
  }
  if (*(void *)this) {
    MEMORY[0x2455DD630](*(void *)this, 0x1000C8077774924);
  }
}

uint64_t *marisa::grimoire::trie::LoudsTrie::swap(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::trie::LoudsTrie *a2)
{
  marisa::grimoire::vector::BitVector::swap(this, a2);
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 208));
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 416));
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 78, (uint64_t *)a2 + 78);
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 84, (uint64_t *)a2 + 84);
  uint64_t v4 = *((void *)this + 90);
  *((void *)this + 90) = *((void *)a2 + 90);
  *((void *)a2 + 90) = v4;
  LODWORD(v4) = *((_DWORD *)this + 182);
  *((_DWORD *)this + 182) = *((_DWORD *)a2 + 182);
  *((_DWORD *)a2 + 182) = v4;
  uint64_t v5 = *((void *)this + 92);
  *((void *)this + 92) = *((void *)a2 + 92);
  *((void *)a2 + 92) = v5;
  marisa::grimoire::trie::Tail::swap((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 744));
  uint64_t v6 = *((void *)this + 125);
  *((void *)this + 12marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = *((void *)a2 + 125);
  *((void *)a2 + 12marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = v6;
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 126, (uint64_t *)a2 + 126);
  uint64_t v7 = *((void *)this + 132);
  *((void *)this + 132) = *((void *)a2 + 132);
  *((void *)a2 + 132) = v7;
  uint64_t v8 = *((void *)this + 133);
  *((void *)this + 133) = *((void *)a2 + 133);
  *((void *)a2 + 133) = v8;
  uint64_t v9 = *((void *)this + 134);
  *((void *)this + 134) = *((void *)a2 + 134);
  *((void *)a2 + 134) = v9;
  uint64_t v10 = *((void *)this + 135);
  *((void *)this + 13marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = *((void *)a2 + 135);
  *((void *)a2 + 13marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = v10;
  LODWORD(v9) = *((_DWORD *)this + 272);
  *((_DWORD *)this + 272) = *((_DWORD *)a2 + 272);
  *((_DWORD *)a2 + 272) = v9;

  return marisa::grimoire::io::Mapper::swap((uint64_t *)this + 137, (marisa::grimoire::trie::LoudsTrie *)((char *)a2 + 1096));
}

void marisa::grimoire::trie::LoudsTrie::map(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::io::Mapper *a2)
{
  marisa::grimoire::trie::Header::map((marisa::grimoire::trie::Header *)v4, a2);
  marisa::grimoire::trie::LoudsTrie::LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v4);
  marisa::grimoire::trie::LoudsTrie::map_((marisa::grimoire::trie::LoudsTrie *)v4, a2);
  marisa::grimoire::io::Mapper::swap(v5, a2);
  marisa::grimoire::trie::LoudsTrie::swap(this, (marisa::grimoire::trie::LoudsTrie *)v4);
  marisa::grimoire::trie::LoudsTrie::~LoudsTrie((marisa::grimoire::trie::LoudsTrie *)v4);
}

void sub_23FF6C6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

unsigned char *marisa::grimoire::trie::Header::map(marisa::grimoire::trie::Header *this, marisa::grimoire::io::Mapper *a2)
{
  __n128 result = (unsigned char *)marisa::grimoire::io::Mapper::map_data(a2, 0x10uLL);
  if (*result != 87) {
    goto LABEL_7;
  }
  uint64_t v3 = 1u;
  do
  {
    if (v3 == 16) {
      return result;
    }
    int v4 = result[v3];
    int v5 = marisa::grimoire::trie::Header::get_header(void)::buf[v3++];
  }
  while (v4 == v5);
  if ((unint64_t)(v3 - 2) <= 0xE)
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/header.h";
    exception[2] = 0xA00000015;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/header.h:21: MARISA_FORMAT_ERRO"
                   "R: !test_header(ptr)";
  }
  return result;
}

double marisa::grimoire::trie::LoudsTrie::map_(marisa::grimoire::trie::LoudsTrie *this, marisa::grimoire::io::Mapper *a2)
{
  marisa::grimoire::vector::BitVector::map(this, a2);
  marisa::grimoire::vector::BitVector::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), a2);
  marisa::grimoire::vector::BitVector::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), a2);
  marisa::grimoire::vector::Vector<unsigned char>::map((long long *)this + 39, a2);
  marisa::grimoire::vector::FlatVector::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 672), a2);
  marisa::grimoire::trie::Tail::map((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2);
  if (*((void *)this + 59) && !*((void *)this + 96))
  {
    int v4 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x263F8C180]);
    int v5 = v4;
    if (v4) {
      marisa::grimoire::trie::LoudsTrie::LoudsTrie(v4);
    }
    marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::reset((marisa::grimoire::trie::LoudsTrie **)this + 125, v5);
    uint64_t v6 = (marisa::grimoire::trie::LoudsTrie *)*((void *)this + 125);
    if (!v6)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      void *exception = &unk_26F3F25A0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc";
      exception[2] = 0x80000021ELL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/louds-trie.cc:542: MARISA_MEM"
                     "ORY_ERROR: next_trie_.get() == NULL";
    }
    marisa::grimoire::trie::LoudsTrie::map_(v6, a2);
  }
  marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::map((long long *)this + 63, a2);
  *((void *)this + 132) = *((void *)this + 129) - 1;
  *((void *)this + 133) = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  unsigned int v7 = *(_DWORD *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  uint64_t v10 = 3;
  *(void *)&double v11 = 0x100000000200;
  int v12 = 0x20000;
  marisa::grimoire::trie::Config::parse_((marisa::grimoire::trie::Config *)&v10, v7);
  *((void *)this + 134) = v10;
  double result = v11;
  *((double *)this + 13marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = v11;
  *((_DWORD *)this + 272) = v12;
  return result;
}

void sub_23FF6C95C(_Unwind_Exception *a1)
{
  MEMORY[0x2455DD650](v1, MEMORY[0x263F8C180]);
  _Unwind_Resume(a1);
}

uint64_t marisa::grimoire::trie::LoudsTrie::lookup(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  uint64_t v4 = *((void *)a2 + 5);
  *(void *)(v4 + 96) = 0;
  *(_DWORD *)(v4 + 108) = 0;
  while (1)
  {
    unint64_t v5 = *((void *)a2 + 1);
    if (v5 <= *(unsigned int *)(v4 + 100)) {
      break;
    }
    if ((marisa::grimoire::trie::LoudsTrie::find_child(this, a2) & 1) == 0) {
      return 0;
    }
  }
  unint64_t v6 = *(unsigned int *)(v4 + 96);
  if ((*(void *)(*((void *)this + 28) + ((v6 >> 3) & 0x1FFFFFF8)) >> v6))
  {
    *((void *)a2 + 3) = *(void *)a2;
    *((_DWORD *)a2 + 8) = v5;
    *((_DWORD *)a2 + 9) = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 208), v6);
    return 1;
  }
  return 0;
}

uint64_t marisa::grimoire::trie::LoudsTrie::find_child(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2)
{
  uint64_t v4 = *((void *)a2 + 5);
  unint64_t v5 = *(unsigned int *)(v4 + 96);
  uint64_t v6 = *(unsigned int *)(v4 + 100);
  unint64_t v7 = (*(unsigned __int8 *)(*(void *)a2 + v6) ^ (32 * v5) ^ v5) & *((void *)this + 132);
  uint64_t v8 = *((void *)this + 128);
  if (v5 != *(_DWORD *)(v8 + 12 * v7))
  {
    unint64_t v10 = marisa::grimoire::vector::BitVector::select0(this, v5);
    uint64_t v11 = *((void *)this + 2);
    if ((*(void *)(v11 + (((v10 + 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v10 + 1)))
    {
      unsigned int v12 = v10 - *(_DWORD *)(v4 + 96);
      *(_DWORD *)(v4 + 96) = v12;
      unint64_t v13 = v10 + 2;
      uint64_t v14 = 0xFFFFFFFFLL;
      while (1)
      {
        uint64_t v15 = v12;
        if ((*(void *)(*((void *)this + 54) + (((unint64_t)v12 >> 3) & 0x1FFFFFF8)) >> v12))
        {
          if (v14 == 0xFFFFFFFFLL)
          {
            uint64_t v14 = marisa::grimoire::vector::BitVector::rank1((marisa::grimoire::trie::LoudsTrie *)((char *)this + 416), v12);
            uint64_t v15 = *(unsigned int *)(v4 + 96);
          }
          else
          {
            ++v14;
          }
          int v17 = *(_DWORD *)(v4 + 100);
          uint64_t v18 = *((void *)this + 90);
          unint64_t v19 = (unint64_t)(v18 * v14) >> 6;
          uint64_t v20 = (v18 * v14) & 0x3F;
          unint64_t v21 = v20 + v18;
          uint64_t v22 = *((void *)this + 86);
          uint64_t v23 = *(void *)(v22 + 8 * v19) >> v20;
          if (v21 > 0x40) {
            v23 |= (2 * *(void *)(v22 + 8 * v19 + 8)) << (v20 ^ 0x3Fu);
          }
          unint64_t v24 = *(unsigned __int8 *)(*((void *)this + 80) + v15) | ((*((_DWORD *)this + 182) & v23) << 8);
          v25 = (marisa::grimoire::trie::LoudsTrie *)*((void *)this + 125);
          if (v25)
          {
            if (marisa::grimoire::trie::LoudsTrie::match_(v25, a2, v24)) {
              return 1;
            }
          }
          else if (marisa::grimoire::trie::Tail::match((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2, v24))
          {
            return 1;
          }
          if (*(_DWORD *)(v4 + 100) != v17) {
            return 0;
          }
          unsigned int v12 = *(_DWORD *)(v4 + 96);
          uint64_t v11 = *((void *)this + 2);
        }
        else
        {
          uint64_t v16 = *(unsigned int *)(v4 + 100);
          if (*(unsigned __int8 *)(*((void *)this + 80) + v12) == *(unsigned __int8 *)(*(void *)a2 + v16))
          {
            *(_DWORD *)(v4 + 100) = v16 + 1;
            return 1;
          }
        }
        *(_DWORD *)(v4 + 96) = ++v12;
        uint64_t v26 = *(void *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v13;
        ++v13;
        if ((v26 & 1) == 0) {
          return 0;
        }
      }
    }
    return 0;
  }
  unint64_t v9 = *(unsigned int *)(v8 + 12 * v7 + 8);
  if (v9 > 0xFFFFFEFF)
  {
    *(_DWORD *)(v4 + 100) = v6 + 1;
    goto LABEL_24;
  }
  v27 = (marisa::grimoire::trie::LoudsTrie *)*((void *)this + 125);
  if (v27)
  {
    if (marisa::grimoire::trie::LoudsTrie::match_(v27, a2, v9)) {
      goto LABEL_24;
    }
    return 0;
  }
  if ((marisa::grimoire::trie::Tail::match((marisa::grimoire::trie::LoudsTrie *)((char *)this + 744), a2, v9) & 1) == 0) {
    return 0;
  }
LABEL_24:
  *(_DWORD *)(v4 + 96) = *(_DWORD *)(*((void *)this + 128) + 12 * v7 + 4);
  return 1;
}

uint64_t *marisa::grimoire::vector::BitVector::swap(marisa::grimoire::vector::BitVector *this, marisa::grimoire::vector::BitVector *a2)
{
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);
  uint64_t v4 = *((void *)this + 6);
  *((void *)this + 6) = *((void *)a2 + 6);
  *((void *)a2 + 6) = v4;
  uint64_t v5 = *((void *)this + 7);
  *((void *)this + 7) = *((void *)a2 + 7);
  *((void *)a2 + 7) = v5;
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 8, (uint64_t *)a2 + 8);
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 14, (uint64_t *)a2 + 14);

  return marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this + 20, (uint64_t *)a2 + 20);
}

uint64_t *marisa::grimoire::vector::Vector<unsigned char>::swap(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *double result = *a2;
  *a2 = v2;
  uint64_t v3 = result[1];
  result[1] = a2[1];
  a2[1] = v3;
  uint64_t v4 = result[2];
  uint64_t v5 = result[3];
  uint64_t v6 = a2[3];
  result[2] = a2[2];
  result[3] = v6;
  a2[2] = v4;
  a2[3] = v5;
  uint64_t v7 = result[4];
  result[4] = a2[4];
  a2[4] = v7;
  LOBYTE(v7) = *((unsigned char *)result + 40);
  *((unsigned char *)result + 40) = *((unsigned char *)a2 + 40);
  *((unsigned char *)a2 + 40) = v7;
  return result;
}

marisa::grimoire::trie::LoudsTrie **marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::reset(marisa::grimoire::trie::LoudsTrie **a1, marisa::grimoire::trie::LoudsTrie *a2)
{
  if (a2 && *a1 == a2)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h";
    exception[2] = 0x600000013;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/include/marisa/scoped-ptr.h:19: MARISA_RESET_ERROR: (ptr"
                   " != NULL) && (ptr == ptr_)";
  }
  uint64_t v4 = *a1;
  *a1 = a2;
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v4);
}

uint64_t marisa::grimoire::vector::BitVector::map(marisa::grimoire::vector::BitVector *this, marisa::grimoire::io::Mapper *a2)
{
  memset(v4, 0, 41);
  long long v7 = 0u;
  memset(v8, 0, sizeof(v8));
  long long v9 = 0u;
  memset(v10, 0, sizeof(v10));
  v4[3] = 0u;
  long long v5 = 0u;
  memset(v6, 0, sizeof(v6));
  marisa::grimoire::vector::BitVector::map_((marisa::grimoire::vector::BitVector *)v4, a2);
  marisa::grimoire::vector::BitVector::swap(this, (marisa::grimoire::vector::BitVector *)v4);
  if ((void)v9) {
    MEMORY[0x2455DD630](v9, 0x1000C8077774924);
  }
  if ((void)v7) {
    MEMORY[0x2455DD630](v7, 0x1000C8077774924);
  }
  if ((void)v5) {
    MEMORY[0x2455DD630](v5, 0x1000C8077774924);
  }
  uint64_t result = *(void *)&v4[0];
  if (*(void *)&v4[0]) {
    return MEMORY[0x2455DD630](*(void *)&v4[0], 0x1000C8077774924);
  }
  return result;
}

void sub_23FF6CE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t marisa::grimoire::vector::Vector<unsigned char>::map(long long *a1, marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_23FF6CF44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x2455DD630](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::FlatVector::map(marisa::grimoire::vector::FlatVector *this, marisa::grimoire::io::Mapper *a2)
{
  memset(v9, 0, 41);
  uint64_t v10 = 0;
  int v11 = 0;
  uint64_t v12 = 0;
  marisa::grimoire::vector::FlatVector::map_((marisa::grimoire::vector::FlatVector *)v9, a2);
  long long v3 = *(_OWORD *)this;
  *(_OWORD *)this = v9[0];
  v9[0] = v3;
  uint64_t v4 = *((void *)this + 2);
  *((void *)this + 2) = *(void *)&v9[1];
  *(void *)&v9[1] = v4;
  long long v5 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)&v9[1] + 8);
  *(_OWORD *)((char *)&v9[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)this + 40);
  *((unsigned char *)this + 40) = BYTE8(v9[2]);
  BYTE8(v9[2]) = v4;
  uint64_t v6 = *((void *)this + 6);
  *((void *)this + 6) = v10;
  uint64_t v10 = v6;
  LODWORD(v6) = *((_DWORD *)this + 14);
  *((_DWORD *)this + 14) = v11;
  int v11 = v6;
  uint64_t v7 = *((void *)this + 8);
  *((void *)this + 8) = v12;
  uint64_t result = v3;
  uint64_t v12 = v7;
  if ((void)v3) {
    return MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_23FF6D040(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x2455DD630](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::trie::Cache>::map(long long *a1, marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_23FF6D100(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x2455DD630](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::trie::LoudsTrie::match_(marisa::grimoire::trie::LoudsTrie *this, marisa::Agent *a2, unint64_t a3)
{
  uint64_t v6 = *((void *)a2 + 5);
  uint64_t v7 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 416);
  uint64_t v8 = (marisa::grimoire::trie::LoudsTrie *)((char *)this + 744);
  while (1)
  {
    while (1)
    {
      unint64_t v9 = *((void *)this + 132) & a3;
      uint64_t v10 = *((void *)this + 128);
      if (a3 == *(_DWORD *)(v10 + 12 * v9 + 4)) {
        break;
      }
      if ((*(void *)(*((void *)this + 54) + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3))
      {
        uint64_t v13 = *((void *)this + 125);
        int v14 = *(unsigned __int8 *)(*((void *)this + 80) + a3);
        uint64_t v15 = marisa::grimoire::vector::BitVector::rank1(v7, a3);
        uint64_t v16 = *((void *)this + 90);
        unint64_t v17 = (unint64_t)(v16 * v15) >> 6;
        uint64_t v18 = (v16 * v15) & 0x3F;
        unint64_t v19 = v18 + v16;
        uint64_t v20 = *((void *)this + 86);
        unint64_t v21 = *(void *)(v20 + 8 * v17);
        if (v13)
        {
          unint64_t v22 = v21 >> v18;
          if (v19 > 0x40) {
            v22 |= (2 * *(void *)(v20 + 8 * v17 + 8)) << (v18 ^ 0x3Fu);
          }
          unint64_t v23 = v14 | ((*((_DWORD *)this + 182) & v22) << 8);
          unint64_t v24 = (marisa::grimoire::trie::LoudsTrie *)*((void *)this + 125);
          if (v24)
          {
            if ((marisa::grimoire::trie::LoudsTrie::match_(v24, a2, v23) & 1) == 0) {
              return 0;
            }
            goto LABEL_27;
          }
        }
        else
        {
          if (v19 > 0x40) {
            uint64_t v27 = ((2 * *(void *)(v20 + 8 * v17 + 8)) << (v18 ^ 0x3Fu)) | (v21 >> v18);
          }
          else {
            uint64_t v27 = v21 >> v18;
          }
          unint64_t v23 = v14 | ((*((_DWORD *)this + 182) & v27) << 8);
        }
        if ((marisa::grimoire::trie::Tail::match(v8, a2, v23) & 1) == 0) {
          return 0;
        }
      }
      else
      {
        uint64_t v26 = *(unsigned int *)(v6 + 100);
        if (*(unsigned __int8 *)(*((void *)this + 80) + a3) != *(unsigned __int8 *)(*(void *)a2 + v26)) {
          return 0;
        }
        *(_DWORD *)(v6 + 100) = v26 + 1;
      }
LABEL_27:
      if (a3 <= *((void *)this + 133)) {
        return 1;
      }
      if (*((void *)a2 + 1) <= (unint64_t)*(unsigned int *)(v6 + 100)) {
        return 0;
      }
      a3 = marisa::grimoire::vector::BitVector::select1(this, a3) + ~a3;
    }
    unint64_t v11 = *(unsigned int *)(v10 + 12 * v9 + 8);
    if (v11 <= 0xFFFFFEFF)
    {
      v25 = (marisa::grimoire::trie::LoudsTrie *)*((void *)this + 125);
      if (v25)
      {
        if ((marisa::grimoire::trie::LoudsTrie::match_(v25, a2, v11) & 1) == 0) {
          return 0;
        }
      }
      else if ((marisa::grimoire::trie::Tail::match(v8, a2, v11) & 1) == 0)
      {
        return 0;
      }
    }
    else
    {
      uint64_t v12 = *(unsigned int *)(v6 + 100);
      if (*(unsigned __int8 *)(*(void *)a2 + v12) != v11) {
        return 0;
      }
      *(_DWORD *)(v6 + 100) = v12 + 1;
    }
    a3 = *(unsigned int *)(*((void *)this + 128) + 12 * v9);
    if (!a3) {
      return 1;
    }
    if (*((void *)a2 + 1) <= (unint64_t)*(unsigned int *)(v6 + 100)) {
      return 0;
    }
  }
}

uint64_t marisa::grimoire::trie::Config::parse_(marisa::grimoire::trie::Config *this, unsigned int a2)
{
  if (a2 >= 0x100000)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x50000003BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:59: MARISA_CODE_ERROR:"
                   " (config_flags & ~MARISA_CONFIG_MASK) != 0";
  }
  if ((a2 & 0x7F) != 0) {
    *(void *)this = a2 & 0x7F;
  }
  marisa::grimoire::trie::Config::parse_cache_level((uint64_t)this, a2);
  marisa::grimoire::trie::Config::parse_tail_mode((uint64_t)this, a2);

  return marisa::grimoire::trie::Config::parse_node_order((uint64_t)this, a2);
}

uint64_t marisa::grimoire::trie::Config::parse_cache_level(uint64_t this, __int16 a2)
{
  unsigned int v2 = a2 & 0xF80;
  int v3 = 512;
  if (v2 > 0x1FF)
  {
    if (v2 == 512) {
      goto LABEL_11;
    }
    if (v2 != 1024)
    {
      int v3 = a2 & 0xF80;
      if (v2 != 2048) {
        goto LABEL_9;
      }
      goto LABEL_11;
    }
LABEL_10:
    int v3 = a2 & 0xF80;
    goto LABEL_11;
  }
  if ((a2 & 0xF80) == 0) {
    goto LABEL_11;
  }
  if (v2 == 128) {
    goto LABEL_10;
  }
  int v3 = a2 & 0xF80;
  if (v2 != 256)
  {
LABEL_9:
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
    exception[2] = 0x500000065;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:101: MARISA_CODE_ERROR"
                   ": undefined cache level";
  }
LABEL_11:
  *(_DWORD *)(this + 8) = v3;
  return this;
}

uint64_t marisa::grimoire::trie::Config::parse_tail_mode(uint64_t this, __int16 a2)
{
  int v2 = 4096;
  int v3 = a2 & 0xF000;
  if ((a2 & 0xF000) != 0 && v3 != 4096)
  {
    if (v3 != 0x2000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      void *exception = &unk_26F3F25A0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x500000079;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:121: MARISA_CODE_ERR"
                     "OR: undefined tail mode";
    }
    int v2 = 0x2000;
  }
  *(_DWORD *)(this + 12) = v2;
  return this;
}

uint64_t marisa::grimoire::trie::Config::parse_node_order(uint64_t this, int a2)
{
  int v2 = 0x20000;
  int v3 = a2 & 0xF0000;
  if ((a2 & 0xF0000) != 0 && v3 != 0x20000)
  {
    if (v3 != 0x10000)
    {
      exception = __cxa_allocate_exception(0x20uLL);
      void *exception = &unk_26F3F25A0;
      exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h";
      exception[2] = 0x50000008DLL;
      exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/config.h:141: MARISA_CODE_ERR"
                     "OR: undefined node order";
    }
    int v2 = 0x10000;
  }
  *(_DWORD *)(this + 16) = v2;
  return this;
}

uint64_t marisa::grimoire::vector::BitVector::map_(marisa::grimoire::vector::BitVector *this, marisa::grimoire::io::Mapper *a2)
{
  marisa::grimoire::vector::Vector<unsigned long long>::map((long long *)this, a2);
  *((void *)this + 6) = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  unint64_t v4 = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (*((void *)this + 6) < v4)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h";
    exception[2] = 0xA00000087;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/bit-vector.h:135: MAR"
                   "ISA_FORMAT_ERROR: temp_num_1s > size_";
  }
  *((void *)this + 7) = v4;
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map((long long *)this + 4, a2);
  marisa::grimoire::vector::Vector<unsigned int>::map((long long *)this + 7, a2);

  return marisa::grimoire::vector::Vector<unsigned int>::map((long long *)this + 10, a2);
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::map(long long *a1, marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned long long>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_23FF6D7A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x2455DD630](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map(long long *a1, marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_23FF6D860(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x2455DD630](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<unsigned int>::map(long long *a1, marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned int>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_23FF6D920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x2455DD630](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4 = *(void *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 7) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000CALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:202: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::io::Mapper::map<unsigned long long>(this, (uint64_t *)(a1 + 16), v4 >> 3);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(void *)(a1 + 24) = v4 >> 3;

  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::io::Mapper::map<unsigned long long>(marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x20000001CLL;
    uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:28: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 61)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x70000001ELL;
    uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:30: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  uint64_t result = marisa::grimoire::io::Mapper::map_data(a1, 8 * a3);
  *a2 = result;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<unsigned long long>::fix(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0x10000006BLL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:107: MARISA_"
                   "STATE_ERROR: fixed_";
  }
  *(unsigned char *)(result + 40) = 1;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<marisa::grimoire::vector::RankIndex>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4 = *(void *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  unint64_t v5 = v4 / 0xC;
  if (v4 % 0xC)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000CALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:202: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::io::Mapper::map<marisa::grimoire::vector::RankIndex>(this, (uint64_t *)(a1 + 16), v5);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(void *)(a1 + 24) = v5;

  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::io::Mapper::map<marisa::grimoire::vector::RankIndex>(marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x20000001CLL;
    uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:28: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >= 0x1555555555555556)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x70000001ELL;
    uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:30: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  uint64_t result = marisa::grimoire::io::Mapper::map_data(a1, 12 * a3);
  *a2 = result;
  return result;
}

uint64_t marisa::grimoire::vector::Vector<unsigned int>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4 = *(void *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  if ((v4 & 3) != 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h";
    exception[2] = 0xA000000CALL;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/vector.h:202: MARISA_"
                   "FORMAT_ERROR: (total_size % sizeof(T)) != 0";
  }
  marisa::grimoire::io::Mapper::map<unsigned int>(this, (uint64_t *)(a1 + 16), v4 >> 2);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(void *)(a1 + 24) = v4 >> 2;

  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

uint64_t marisa::grimoire::io::Mapper::map<unsigned int>(marisa::grimoire::io::Mapper *a1, uint64_t *a2, unint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x20000001CLL;
    uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:28: MARISA_NULL_ERROR: (ob"
         "js == NULL) && (num_objs != 0)";
    goto LABEL_7;
  }
  if (a3 >> 62)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h";
    exception[2] = 0x70000001ELL;
    uint64_t v6 = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../io/mapper.h:30: MARISA_SIZE_ERROR: num"
         "_objs > (MARISA_SIZE_MAX / sizeof(T))";
LABEL_7:
    exception[3] = v6;
  }
  uint64_t result = marisa::grimoire::io::Mapper::map_data(a1, 4 * a3);
  *a2 = result;
  return result;
}

void *marisa::grimoire::vector::FlatVector::map_(marisa::grimoire::vector::FlatVector *this, marisa::grimoire::io::Mapper *a2)
{
  marisa::grimoire::vector::Vector<unsigned long long>::map((long long *)this, a2);
  uint64_t v4 = *(unsigned int *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  if (v4 >= 0x21)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/flat-vector.h";
    exception[2] = 0xA00000086;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/grimoire/trie/../vector/flat-vector.h:134: MA"
                   "RISA_FORMAT_ERROR: temp_value_size > 32";
  }
  *((void *)this + 6) = v4;
  *((_DWORD *)this + 14) = *(_DWORD *)marisa::grimoire::io::Mapper::map_data(a2, 4uLL);
  uint64_t result = (void *)marisa::grimoire::io::Mapper::map_data(a2, 8uLL);
  *((void *)this + 8) = *result;
  return result;
}

marisa::grimoire::trie::LoudsTrie **marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(marisa::grimoire::trie::LoudsTrie **a1)
{
  int v2 = *a1;
  if (v2)
  {
    marisa::grimoire::trie::LoudsTrie::~LoudsTrie(v2);
    MEMORY[0x2455DD660]();
  }
  return a1;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

uint64_t marisa::grimoire::vector::Vector<unsigned char>::map_(uint64_t a1, marisa::grimoire::io::Mapper *this)
{
  unint64_t v4 = *(void *)marisa::grimoire::io::Mapper::map_data(this, 8uLL);
  *(void *)(a1 + 16) = marisa::grimoire::io::Mapper::map_data(this, v4);
  marisa::grimoire::io::Mapper::seek(this, -(int)v4 & 7);
  *(void *)(a1 + 24) = v4;

  return marisa::grimoire::vector::Vector<unsigned long long>::fix(a1);
}

double marisa::grimoire::trie::Tail::Tail(marisa::grimoire::trie::Tail *this)
{
  double result = 0.0;
  *(_OWORD *)((char *)this + 2marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *(_OWORD *)((char *)this + 73) = 0u;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *(_OWORD *)((char *)this + 18marisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0u;
  *((_OWORD *)this + 13) = 0u;
  *((_OWORD *)this + 14) = 0u;
  *(_OWORD *)((char *)this + 233) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 137) = 0u;
  return result;
}

uint64_t *marisa::grimoire::trie::Tail::swap(marisa::grimoire::trie::Tail *this, marisa::grimoire::trie::Tail *a2)
{
  marisa::grimoire::vector::Vector<unsigned char>::swap((uint64_t *)this, (uint64_t *)a2);

  return marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::Tail *)((char *)this + 48), (marisa::grimoire::trie::Tail *)((char *)a2 + 48));
}

uint64_t marisa::grimoire::trie::Tail::map(marisa::grimoire::trie::Tail *this, marisa::grimoire::io::Mapper *a2)
{
  memset(v8, 0, 41);
  memset(v9, 0, 41);
  long long v12 = 0u;
  memset(v13, 0, sizeof(v13));
  long long v14 = 0u;
  memset(v15, 0, sizeof(v15));
  _OWORD v9[3] = 0u;
  long long v10 = 0u;
  memset(v11, 0, sizeof(v11));
  marisa::grimoire::vector::Vector<char>::map(v8, a2);
  marisa::grimoire::vector::BitVector::map((marisa::grimoire::vector::BitVector *)v9, a2);
  long long v4 = *(_OWORD *)this;
  *(_OWORD *)this = v8[0];
  v8[0] = v4;
  uint64_t v5 = *((void *)this + 2);
  *((void *)this + 2) = *(void *)&v8[1];
  *(void *)&v8[1] = v5;
  long long v6 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(long long *)((char *)&v8[1] + 8);
  *(long long *)((char *)&v8[1] + 8) = v6;
  LOBYTE(vmarisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = *((unsigned char *)this + 40);
  *((unsigned char *)this + 40) = BYTE8(v8[2]);
  BYTE8(v8[2]) = v5;
  marisa::grimoire::vector::BitVector::swap((marisa::grimoire::trie::Tail *)((char *)this + 48), (marisa::grimoire::vector::BitVector *)v9);
  if ((void)v14) {
    MEMORY[0x2455DD630](v14, 0x1000C8077774924);
  }
  if ((void)v12) {
    MEMORY[0x2455DD630](v12, 0x1000C8077774924);
  }
  if ((void)v10) {
    MEMORY[0x2455DD630](v10, 0x1000C8077774924);
  }
  if (*(void *)&v9[0]) {
    MEMORY[0x2455DD630](*(void *)&v9[0], 0x1000C8077774924);
  }
  uint64_t result = *(void *)&v8[0];
  if (*(void *)&v8[0]) {
    return MEMORY[0x2455DD630](*(void *)&v8[0], 0x1000C8077774924);
  }
  return result;
}

void sub_23FF6E2B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t marisa::grimoire::trie::Tail::match(marisa::grimoire::trie::Tail *this, marisa::Agent *a2, unint64_t a3)
{
  uint64_t v3 = *((void *)a2 + 5);
  uint64_t v4 = *((void *)this + 2);
  if (*((void *)this + 12))
  {
    unsigned int v5 = *(_DWORD *)(v3 + 100);
    uint64_t v6 = *(void *)a2;
    unint64_t v7 = *((void *)a2 + 1);
    do
    {
      if (*(unsigned __int8 *)(v4 + a3) != *(unsigned __int8 *)(v6 + v5)) {
        break;
      }
      *(_DWORD *)(v3 + 100) = ++v5;
      if ((*(void *)(*((void *)this + 8) + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> a3)) {
        return 1;
      }
      ++a3;
    }
    while (v7 > v5);
  }
  else
  {
    unint64_t v12 = v4 + a3;
    uint64_t v8 = v4 + a3 - *(unsigned int *)(v3 + 100);
    uint64_t v9 = *(void *)a2;
    unint64_t v10 = *((void *)a2 + 1);
    int v11 = *(unsigned __int8 *)v12;
    LODWORD(v12) = *(_DWORD *)(v3 + 100);
    while (v11 == *(unsigned __int8 *)(v9 + v12))
    {
      unint64_t v12 = (v12 + 1);
      *(_DWORD *)(v3 + 100) = v12;
      int v11 = *(unsigned __int8 *)(v8 + v12);
      if (!*(unsigned char *)(v8 + v12)) {
        return 1;
      }
      if (v10 <= v12) {
        return 0;
      }
    }
  }
  return 0;
}

uint64_t marisa::grimoire::vector::Vector<char>::map(long long *a1, marisa::grimoire::io::Mapper *a2)
{
  memset(v7, 0, 41);
  marisa::grimoire::vector::Vector<unsigned char>::map_((uint64_t)v7, a2);
  long long v3 = *a1;
  *a1 = v7[0];
  v7[0] = v3;
  uint64_t v4 = *((void *)a1 + 2);
  *((void *)a1 + 2) = *(void *)&v7[1];
  *(void *)&v7[1] = v4;
  long long v5 = *(long long *)((char *)a1 + 24);
  *(long long *)((char *)a1 + 24) = *(_OWORD *)((char *)&v7[1] + 8);
  *(_OWORD *)((char *)&v7[1] + 8) = v5;
  LOBYTE(v4) = *((unsigned char *)a1 + 40);
  *((unsigned char *)a1 + 40) = BYTE8(v7[2]);
  uint64_t result = v3;
  BYTE8(v7[2]) = v4;
  if ((void)v3) {
    return MEMORY[0x2455DD630](v3, 0x1000C8077774924);
  }
  return result;
}

void sub_23FF6E400(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x2455DD630](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t marisa::grimoire::vector::BitVector::rank1(marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  unint64_t v2 = a2 >> 9;
  uint64_t v3 = *((void *)this + 10);
  uint64_t v4 = *(unsigned int *)(v3 + 12 * (a2 >> 9));
  switch((a2 >> 6) & 7)
  {
    case 1uLL:
      unint64_t v5 = *(_DWORD *)(v3 + 12 * v2 + 4) & 0x7F;
      goto LABEL_10;
    case 2uLL:
      unint64_t v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 7;
      goto LABEL_5;
    case 3uLL:
      unint64_t v6 = (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 15;
LABEL_5:
      v4 += v6;
      break;
    case 4uLL:
      v4 += (unint64_t)*(unsigned int *)(v3 + 12 * v2 + 4) >> 23;
      break;
    case 5uLL:
      unint64_t v5 = *(_DWORD *)(v3 + 12 * v2 + 8) & 0x1FF;
      goto LABEL_10;
    case 6uLL:
      unint64_t v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 9) & 0x1FF;
      goto LABEL_10;
    case 7uLL:
      unint64_t v5 = ((unint64_t)*(unsigned int *)(v3 + 12 * v2 + 8) >> 18) & 0x1FF;
LABEL_10:
      v4 += v5;
      break;
    default:
      break;
  }
  unint64_t v7 = *(void *)(*((void *)this + 2) + 8 * (a2 >> 6)) & ~(-1 << a2);
  unint64_t v8 = (((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((((v7 >> 1) & 0x5555555555555555) + (v7 & 0x5555555555555555)) & 0x3333333333333333);
  return v4 + ((0x101010101010101 * (((v8 >> 4) & 0x707070707070707) + (v8 & 0x707070707070707))) >> 56);
}

unint64_t marisa::grimoire::vector::BitVector::select0(marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 16);
  if ((a2 & 0x1FF) == 0) {
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  }
  unint64_t v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  unint64_t v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  uint64_t v5 = *((void *)this + 10);
  if (v3 + 10 >= v4)
  {
    uint64_t v7 = v5 + 12 * v3;
    unint64_t v8 = v3-- << 9;
    uint64_t v9 = (unsigned int *)(v7 + 12);
    do
    {
      unsigned int v10 = *v9;
      v9 += 3;
      ++v3;
      v8 += 512;
    }
    while (v8 - v10 <= a2);
  }
  else
  {
    do
    {
      if (((v4 + v3) >> 1 << 9) - *(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2) {
        unint64_t v4 = (v4 + v3) >> 1;
      }
      else {
        unint64_t v3 = (v4 + v3) >> 1;
      }
    }
    while (v3 + 1 < v4);
  }
  int v11 = (unsigned int *)(v5 + 12 * v3);
  unint64_t v12 = v11[1];
  uint64_t v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)(a2 - (v3 << 9) + *v11);
  uint64_t v14 = 8 * v3;
  if ((unint64_t)v13 >= 256 - (v12 >> 23))
  {
    unint64_t v15 = *(unsigned int *)(v5 + 12 * v3 + 8);
    uint64_t v16 = (v15 >> 9) & 0x1FF;
    if ((unint64_t)v13 >= 384 - v16)
    {
      uint64_t v18 = (v15 >> 18) & 0x1FF;
      if ((unint64_t)v13 >= 448 - v18)
      {
        v14 |= 7uLL;
        uint64_t v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v18 - 448);
      }
      else
      {
        v14 |= 6uLL;
        uint64_t v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v16 - 384);
      }
    }
    else if ((unint64_t)v13 >= 320 - (v15 & 0x1FF))
    {
      v14 |= 5uLL;
      uint64_t v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v15 & 0x1FF) - 320);
    }
    else
    {
      v14 |= 4uLL;
      uint64_t v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 23) - 256);
    }
  }
  else if ((unint64_t)v13 >= 128 - (unint64_t)(v12 >> 7))
  {
    uint64_t v17 = (v12 >> 15);
    if ((unint64_t)v13 >= 192 - v17)
    {
      v14 |= 3uLL;
      uint64_t v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + v17 - 192);
    }
    else
    {
      v14 |= 2uLL;
      uint64_t v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 >> 7) - 128);
    }
  }
  else if ((unint64_t)v13 >= 64 - (v12 & 0x7F))
  {
    v14 |= 1uLL;
    uint64_t v13 = (marisa::grimoire::vector::_anonymous_namespace_ *)((char *)v13 + (v12 & 0x7F) - 64);
  }
}

unint64_t marisa::grimoire::vector::anonymous namespace'::select_bit(marisa::grimoire::vector::_anonymous_namespace_ *this, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = (((a3 - ((a3 >> 1) & 0x5555555555555555)) >> 2) & 0x3333333333333333)
     + ((a3 - ((a3 >> 1) & 0x5555555555555555)) & 0x3333333333333333);
  uint64_t v4 = (v3 + (v3 >> 4)) & 0xF0F0F0F0F0F0F0FLL;
  unint64_t v5 = __clz(__rbit64(((((0x101010101010101 * v4) | 0x8080808080808080)
                      - 0x101010101010101 * (void)this
                      - 0x101010101010101) >> 7) & 0x101010101010101));
  return v5
       + a2
                                                                                      * ((void)this
                                                                                       - ((unint64_t)(0x101010101010100 * v4) >> v5))
                                                                                      + (a3 >> v5)];
}

unint64_t marisa::grimoire::vector::BitVector::select1(marisa::grimoire::vector::BitVector *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 22);
  if ((a2 & 0x1FF) == 0) {
    return *(unsigned int *)(v2 + 4 * (a2 >> 9));
  }
  unint64_t v3 = *(_DWORD *)(v2 + 4 * (a2 >> 9)) >> 9;
  unint64_t v4 = (*(_DWORD *)(v2 + 4 * (a2 >> 9) + 4) + 511) >> 9;
  uint64_t v5 = *((void *)this + 10);
  if (v3 + 10 >= v4)
  {
    uint64_t v7 = v5 + 12 * v3--;
    unint64_t v8 = (unsigned int *)(v7 + 12);
    do
    {
      unsigned int v9 = *v8;
      v8 += 3;
      ++v3;
    }
    while (v9 <= a2);
  }
  else
  {
    do
    {
      if (*(unsigned int *)(v5 + 12 * ((v4 + v3) >> 1)) > a2) {
        unint64_t v4 = (v4 + v3) >> 1;
      }
      else {
        unint64_t v3 = (v4 + v3) >> 1;
      }
    }
    while (v3 + 1 < v4);
  }
  unsigned int v10 = (unsigned int *)(v5 + 12 * v3);
  unint64_t v11 = v10[1];
  unint64_t v12 = a2 - *v10;
  uint64_t v13 = 8 * v3;
  if (v12 >= v11 >> 23)
  {
    unint64_t v23 = v11 >> 23;
    unint64_t v24 = *(unsigned int *)(v5 + 12 * v3 + 8);
    unint64_t v25 = (v24 >> 9) & 0x1FF;
    unint64_t v26 = (v24 >> 18) & 0x1FF;
    uint64_t v27 = v13 | 7;
    BOOL v28 = v12 >= v26;
    if (v12 < v26) {
      v29 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v25);
    }
    else {
      v29 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v26);
    }
    if (!v28) {
      uint64_t v27 = v13 | 6;
    }
    unint64_t v30 = v24 & 0x1FF;
    uint64_t v31 = v13 | 5;
    uint64_t v32 = v13 | 4;
    v33 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v23);
    BOOL v34 = v12 >= v30;
    if (v12 < v30) {
      unint64_t v21 = v33;
    }
    else {
      unint64_t v21 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v30);
    }
    if (v34) {
      uint64_t v32 = v31;
    }
    if (v12 < v25)
    {
      uint64_t v22 = v32;
    }
    else
    {
      unint64_t v21 = v29;
      uint64_t v22 = v27;
    }
  }
  else
  {
    unint64_t v14 = v11 >> 7;
    unint64_t v15 = (v11 >> 15);
    uint64_t v16 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - (v11 >> 7));
    if (v12 < v15)
    {
      uint64_t v17 = v13 | 2;
    }
    else
    {
      uint64_t v16 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v15);
      uint64_t v17 = v13 | 3;
    }
    unint64_t v18 = v11 & 0x7F;
    BOOL v20 = v12 >= v18;
    unint64_t v19 = (marisa::grimoire::vector::_anonymous_namespace_ *)(v12 - v18);
    if (v20) {
      v13 |= 1uLL;
    }
    else {
      unint64_t v19 = (marisa::grimoire::vector::_anonymous_namespace_ *)v12;
    }
    BOOL v20 = v12 >= v14;
    if (v12 < v14) {
      unint64_t v21 = v19;
    }
    else {
      unint64_t v21 = v16;
    }
    if (v20) {
      uint64_t v22 = v17;
    }
    else {
      uint64_t v22 = v13;
    }
  }
}

void *marisa::Trie::Trie(void *this)
{
  *this = 0;
  return this;
}

marisa::grimoire::trie::LoudsTrie **marisa::Trie::map(marisa::grimoire::trie::LoudsTrie **this, const void *a2, uint64_t a3)
{
  if (!a2 && a3)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    void *exception = &unk_26F3F25A0;
    exception[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    exception[2] = 0x200000021;
    exception[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:33: MARISA_NULL_ERROR: (ptr == NULL) && (size != 0)";
  }
  unint64_t v6 = (marisa::grimoire::trie::LoudsTrie *)operator new(0x470uLL, MEMORY[0x263F8C180]);
  if (!v6)
  {
    uint64_t v13 = 0;
    unint64_t v11 = __cxa_allocate_exception(0x20uLL);
    void *v11 = &unk_26F3F25A0;
    v11[1] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc";
    v11[2] = 0x800000024;
    v11[3] = "/Library/Caches/com.apple.xbs/Sources/Marisa/lib/marisa/trie.cc:36: MARISA_MEMORY_ERROR: temp.get() == NULL";
  }
  uint64_t v7 = v6;
  marisa::grimoire::trie::LoudsTrie::LoudsTrie(v6);
  uint64_t v13 = v7;
  marisa::grimoire::io::Mapper::Mapper((uint64_t)v12);
  marisa::grimoire::io::Mapper::open((marisa::grimoire::io::Mapper *)v12, a2, a3);
  marisa::grimoire::trie::LoudsTrie::map(v13, (marisa::grimoire::io::Mapper *)v12);
  unint64_t v8 = *this;
  *this = v13;
  uint64_t v13 = v8;
  marisa::grimoire::io::Mapper::~Mapper((marisa::grimoire::io::Mapper *)v12);
  return marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr(&v13);
}

void sub_23FF6EAC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  marisa::scoped_ptr<marisa::grimoire::trie::LoudsTrie>::~scoped_ptr((marisa::grimoire::trie::LoudsTrie **)va);
  _Unwind_Resume(a1);
}

marisa::grimoire::trie::LoudsTrie *marisa::Trie::lookup(marisa::grimoire::trie::LoudsTrie **this, marisa::Agent *a2)
{
  uint64_t result = *this;
  if (result)
  {
    if (!*((void *)a2 + 5))
    {
      marisa::Agent::init_state(a2);
      uint64_t result = *this;
    }
    return (marisa::grimoire::trie::LoudsTrie *)marisa::grimoire::trie::LoudsTrie::lookup(result, a2);
  }
  return result;
}

void Utils::TrieWrapper::loadTrie(Utils::TrieWrapper *this, const __CFString *a2)
{
}

void sub_23FF6EC74(_Unwind_Exception *a1)
{
  MEMORY[0x2455DD660](v2, 0xA1C40BD48D6D6);
  (*(void (**)(uint64_t))(*(void *)v1 + 8))(v1);
  _Unwind_Resume(a1);
}

void Utils::CFBurstTrieWrapper::~CFBurstTrieWrapper(Utils::CFBurstTrieWrapper *this)
{
  *(void *)this = &unk_26F3F2570;
  if (*((void *)this + 1)) {
    CFBurstTrieRelease();
  }
}

{
  uint64_t vars8;

  Utils::CFBurstTrieWrapper::~CFBurstTrieWrapper(this);

  JUMPOUT(0x2455DD660);
}

BOOL Utils::CFBurstTrieWrapper::isValid(Utils::CFBurstTrieWrapper *this)
{
  return *((void *)this + 1) != 0;
}

BOOL Utils::CFBurstTrieWrapper::lookup(Utils::CFBurstTrieWrapper *this, const __CFString *a2, CFRange a3, float *a4)
{
  BOOL result = CFBurstTrieContains() != 0;
  *a4 = 0.0;
  return result;
}

void Utils::MarisaTrieWrapper::MarisaTrieWrapper(Utils::MarisaTrieWrapper *this, const __CFString *a2)
{
  *(void *)this = &unk_26F3F2540;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((_DWORD *)this + 8) = -1;
  operator new();
}

void sub_23FF6F2D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, marisa::Trie **a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  if (a25 < 0) {
    operator delete(__p);
  }
  if (a19 < 0)
  {
    operator delete(a14);
    if ((v25 & 1) == 0) {
      goto LABEL_9;
    }
  }
  else if (!v25)
  {
LABEL_9:
    __cxa_begin_catch(exception_object);
    std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100](a11, 0);
    if (*(void *)a12) {
      munmap(*(void **)a12, *(void *)(v27 + 24));
    }
    int v29 = *(_DWORD *)(v27 + 32);
    if (v29) {
      close(v29);
    }
    *(void *)a12 = 0;
    *(void *)(a12 + 8) = 0;
    *(_DWORD *)(v27 + 32) = -1;
    __cxa_end_catch();
    JUMPOUT(0x23FF6F0ECLL);
  }
  __cxa_free_exception(v26);
  goto LABEL_9;
}

void sub_23FF6F400(void *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  JUMPOUT(0x23FF6F3F8);
}

marisa::Trie **std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100](marisa::Trie **result, marisa::Trie *a2)
{
  uint64_t v2 = *result;
  *BOOL result = a2;
  if (v2)
  {
    unint64_t v3 = (void *)*((void *)v2 + 1);
    if (v3)
    {
      *((void *)v2 + 2) = v3;
      operator delete(v3);
    }
    marisa::Trie::~Trie(v2);
    JUMPOUT(0x2455DD660);
  }
  return result;
}

void Utils::MarisaTrieWrapper::~MarisaTrieWrapper(Utils::MarisaTrieWrapper *this)
{
  *(void *)this = &unk_26F3F2540;
  uint64_t v2 = (void *)*((void *)this + 2);
  if (v2) {
    munmap(v2, *((void *)this + 3));
  }
  int v3 = *((_DWORD *)this + 8);
  if ((v3 & 0x80000000) == 0) {
    close(v3);
  }
  std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100]((marisa::Trie **)this + 1, 0);
  std::unique_ptr<trie::MarisaTrie<float,char>>::reset[abi:ne180100]((marisa::Trie **)this + 1, 0);
}

{
  uint64_t vars8;

  Utils::MarisaTrieWrapper::~MarisaTrieWrapper(this);

  JUMPOUT(0x2455DD660);
}

BOOL Utils::MarisaTrieWrapper::isValid(Utils::MarisaTrieWrapper *this)
{
  return *((void *)this + 1) != 0;
}

uint64_t Utils::MarisaTrieWrapper::lookup(Utils::MarisaTrieWrapper *this, const __CFString *a2, CFRange a3, float *a4)
{
  if (a3.length)
  {
    CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x263EFFB08], a2, a3);
    operator new[]();
  }
  return 0;
}

void sub_23FF6F678(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x2455DD630](v2, 0x1000C8077774924);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26509B4E0, MEMORY[0x263F8C060]);
}

void sub_23FF6F724(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  BOOL result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
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
  *((unsigned char *)v6 + vmarisa::scoped_ptr<marisa::grimoire::trie::State>::~scoped_ptr((void *)this + 5) = 0;
  return a1;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(unint64_t a1)
{
  if (a1 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a1);
}

void nlp::CFScopedPtr<__CFString const*>::reset(const void **a1, const void *a2)
{
  size_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void ReleaseTransitionTable(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 64);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 96);
    if (v3 < 1) {
      goto LABEL_8;
    }
    for (uint64_t i = 0; i < v3; ++i)
    {
      size_t v5 = *(void **)(*(void *)(a1 + 64) + 8 * i);
      if (v5)
      {
        free(v5);
        uint64_t v3 = *(void *)(a1 + 96);
      }
    }
    uint64_t v2 = *(void **)(a1 + 64);
    if (v2) {
LABEL_8:
    }
      free(v2);
    *(void *)(a1 + 64) = 0;
  }
}

CFIndex ThaiTokenizerSetString(CFIndex result, CFStringRef theString)
{
  CFIndex v2 = result;
  if (theString)
  {
    v4.length = CFStringGetLength(theString);
    v4.location = 0;
    return ThaiTokenizerSetStringWithRange(v2, theString, v4);
  }
  else
  {
    *(void *)(result + 56) = 0;
  }
  return result;
}

uint64_t ThaiTokenizerAdvanceToNextToken(uint64_t a1)
{
  if (!*(void *)(a1 + 56)) {
    return 0;
  }
  CFIndex v2 = *(void *)(a1 + 40);
  if (v2 != -1)
  {
    CFIndex v3 = *(void *)(a1 + 48);
    if (v2 < v3)
    {
      *(void *)(a1 + 40) = v2 + 1;
      if (v2 + 1 < v3)
      {
        CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v2);
        CFIndex valuePtr = 0;
        CFNumberGetValue(ValueAtIndex, kCFNumberCFIndexType, &valuePtr);
        unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 8), valuePtr);
        return getTokenType(CharacterAtIndex);
      }
    }
    return 0;
  }
  *(void *)(a1 + 40) = 0;
  unsigned int v7 = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 8), 0);

  return getTokenType(v7);
}

uint64_t getTokenType(unsigned int a1)
{
  BOOL v2 = isPunct(a1);
  uint64_t result = 3;
  if (a1 != 3631 && !v2)
  {
    if (a1 > 0x3A) {
      goto LABEL_7;
    }
    if (((1 << a1) & 0x100003E00) != 0) {
      return 5;
    }
    if (((1 << a1) & 0x400500000000000) == 0)
    {
LABEL_7:
      if (a1 == 160) {
        return 5;
      }
      if (getChunkType(a1) == 16) {
        return 9;
      }
      else {
        return 1;
      }
    }
  }
  return result;
}

uint64_t ThaiTokenizerGoToTokenAtIndex(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (!v2) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v5 = a2 - *(void *)(a1 + 16);
  if (v5 >= v2 || v5 < 0) {
    return result;
  }
  if (*(uint64_t *)(a1 + 48) < 1) {
    return 0;
  }
  CFIndex v6 = 0;
  uint64_t valuePtr = 0;
  while (1)
  {
    CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v6);
    CFNumberGetValue(ValueAtIndex, kCFNumberCFIndexType, &valuePtr);
    if (v5 < valuePtr) {
      break;
    }
    if (++v6 >= *(void *)(a1 + 48)) {
      return 0;
    }
  }
  *(void *)(a1 + 40) = v6;
  CFIndex v11 = 0;
  if (v6)
  {
    CFNumberRef v8 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v6 - 1);
    CFNumberGetValue(v8, kCFNumberCFIndexType, &v11);
    CFIndex v9 = v11;
  }
  else
  {
    CFIndex v9 = 0;
  }
  unsigned int CharacterAtIndex = CFStringGetCharacterAtIndex(*(CFStringRef *)(a1 + 8), v9);
  return getTokenType(CharacterAtIndex);
}

uint64_t ThaiTokenizerGetCurrentTokenRange(uint64_t a1)
{
  uint64_t v7 = 0;
  uint64_t valuePtr = 0;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    if (v2 >= *(void *)(a1 + 48))
    {
      return -1;
    }
    else
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), v2 - 1);
      CFNumberGetValue(ValueAtIndex, kCFNumberCFIndexType, &valuePtr);
      CFNumberRef v4 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), *(void *)(a1 + 40));
      CFNumberGetValue(v4, kCFNumberCFIndexType, &v7);
      return *(void *)(a1 + 16) + valuePtr;
    }
  }
  else
  {
    CFNumberRef v6 = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 32), 0);
    CFNumberGetValue(v6, kCFNumberCFIndexType, &v7);
    return *(void *)(a1 + 16);
  }
}

BOOL isPunct(int a1)
{
  if ((a1 - 33) < 0xB) {
    return 1;
  }
  BOOL result = 1;
  if ((a1 - 45) > 0x33 || ((1 << (a1 - 45)) & 0x8400000084005) == 0) {
    return a1 == 123 || a1 == 126;
  }
  return result;
}

uint64_t getChunkType(unsigned int a1)
{
  uint64_t v1 = 1;
  if (a1 - 3648 >= 0xE && (unsigned __int16)(a1 - 3585) >= 0x2Eu && (unsigned __int16)(a1 - 3632) >= 0xBu)
  {
    if (a1 <= 0x20 && ((1 << a1) & 0x100003E00) != 0 || a1 == 160)
    {
      return 4;
    }
    else if (a1 == 3631)
    {
      return 2;
    }
    else if (isPunct(a1))
    {
      return 8;
    }
    else
    {
      return 16;
    }
  }
  return v1;
}

BOOL isThaiEndingChar(int a1)
{
  if ((a1 - 3597) < 0xF) {
    return 1;
  }
  if ((a1 - 3585) >= 0xB)
  {
    if ((a1 - 3614) < 0xD) {
      return 1;
    }
  }
  else
  {
    uint64_t v1 = 1;
    if (((0x6FFu >> (a1 - 1)) & 1) != 0 || (unsigned __int16)(a1 - 3614) <= 0xCu) {
      return v1;
    }
  }
  uint64_t v1 = 1;
  if ((a1 - 3628) > 0x1A || ((1 << (a1 - 44)) & 0x4000013) == 0)
  {
    BOOL v3 = (a1 - 3634) < 9 || (a1 - 3653) < 0xA;
    return a1 == 46 || v3;
  }
  return v1;
}

float getUnkProb(const __CFString *a1, uint64_t a2, CFIndex idx, uint64_t a4)
{
  int CharacterAtIndex = CFStringGetCharacterAtIndex(a1, idx);
  BOOL v9 = (CharacterAtIndex - 3585) < 0x2E || (CharacterAtIndex - 3648) < 5;
  if (CharacterAtIndex == 3654) {
    BOOL v9 = 1;
  }
  char v10 = CharacterAtIndex == 46 || v9;
  float result = -12.0;
  float v12 = -9.0;
  if (a4 != 2) {
    float v12 = -12.0;
  }
  if (a4 == 1) {
    float v12 = -2.0;
  }
  if ((v10 & (a4 + idx == a2)) != 0) {
    return v12;
  }
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x270EE4290](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

uint64_t CFBurstTrieContains()
{
  return MEMORY[0x270EE4638]();
}

uint64_t CFBurstTrieCreateFromFile()
{
  return MEMORY[0x270EE4658]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x270EE4690]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

void CFShow(CFTypeRef obj)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

void std::exception::~exception(std::exception *this)
{
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

void operator delete(void *__p, const std::nothrow_t *a2)
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x270EDB568](a1, a2);
}