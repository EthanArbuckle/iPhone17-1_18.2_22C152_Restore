void zhtok::WordBreaker::WordBreaker(zhtok::WordBreaker *this, const __CFLocale *a2)
{
  CFStringRef v2;
  CFStringRef v3;

  *(void *)this = 0;
  *((_DWORD *)this + 2) = 0;
  *((_OWORD *)this + 1) = xmmword_2160F0650;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  v2 = (const __CFString *)MEMORY[0x2166C8950](a2);
  zhtok::UTF8StringFromCFString(v2, v3);
}

void sub_2160EA6F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9) {
    MEMORY[0x2166C8C60](a9, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

uint64_t zhtok::WordBreaker::close(zhtok::WordBreaker *this)
{
  uint64_t result = *(void *)this;
  if (result)
  {
    uint64_t result = ubrk_close();
    *(void *)this = 0;
  }
  return result;
}

void zhtok::WordBreaker::~WordBreaker(zhtok::WordBreaker *this)
{
  if (*(void *)this)
  {
    ubrk_close();
    *(void *)this = 0;
  }
  utext_close((UText *)((char *)this + 16));
}

void __clang_call_terminate(void *a1)
{
}

uint64_t zhtok::WordBreaker::set(zhtok::WordBreaker *this, const unsigned __int16 *a2, int64_t a3)
{
  if (*(void *)this)
  {
    *((_OWORD *)this + 1) = xmmword_2160F0650;
    *((_OWORD *)this + 2) = 0u;
    v4 = (UText *)((char *)this + 16);
    *((_OWORD *)this + 3) = 0u;
    *((_OWORD *)this + 4) = 0u;
    *((_OWORD *)this + 5) = 0u;
    *((_OWORD *)this + 6) = 0u;
    *((_OWORD *)this + 7) = 0u;
    *((_OWORD *)this + 8) = 0u;
    *((_OWORD *)this + 9) = 0u;
    UErrorCode status = U_ZERO_ERROR;
    utext_openUChars((UText *)((char *)this + 16), a2, a3, &status);
    if (status < U_ILLEGAL_ARGUMENT_ERROR)
    {
      ubrk_setUText();
      UErrorCode v5 = status;
      utext_close(v4);
      if (v5 <= U_ZERO_ERROR)
      {
        *((_DWORD *)this + 2) = ubrk_first();
        return 1;
      }
    }
    else
    {
      utext_close(v4);
    }
  }
  return 0;
}

__CFString *createPathRelativeToPlatformRoot(const char *a1)
{
  Mutable = CFStringCreateMutable(0, 1024);
  CFStringRef v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x263EFFB08], "/", 0x8000100u);
  CFStringAppend(Mutable, v3);
  if (a1) {
    CFStringAppendCString(Mutable, a1, 0x8000100u);
  }
  CFRelease(v3);
  return Mutable;
}

CFComparisonResult languageForLocale(const __CFLocale *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  CFStringRef v3 = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x263EFFCF8]);
  if (CFStringCompare(Value, @"zh", 0) || !v3) {
    return 0xFFFFFFFFLL;
  }
  CFComparisonResult result = CFStringCompare(v3, @"Hans", 0);
  if (result)
  {
    if (CFEqual(v3, @"Hant")) {
      return 1;
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

__CFString *languageModelBundleNameForLocale(const __CFLocale *a1)
{
  if (a1
    && (CFStringRef Value = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x263EFFCF0]),
        CFEqual(Value, @"zh")))
  {
    return @"Chinese.lm";
  }
  else
  {
    return &stru_26C6B2C18;
  }
}

CFLocaleRef createLocaleForLanguage(int a1)
{
  v1 = "";
  if (a1 == 1) {
    v1 = "zh-Hant";
  }
  if (a1) {
    v2 = v1;
  }
  else {
    v2 = "zh-Hans";
  }
  CFStringRef v3 = CFStringCreateWithCString(0, v2, 0x8000100u);
  CFLocaleRef v4 = CFLocaleCreate(0, v3);
  CFRelease(v3);
  return v4;
}

void zhtok::UTF8StringFromCFString(const __CFString *this, const __CFString *a2)
{
  CFIndex Length = CFStringGetLength(this);
  CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  operator new[]();
}

void sub_2160EAAEC(_Unwind_Exception *a1)
{
  void *v1 = 0;
  MEMORY[0x2166C8C60](v2, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void zhtok::charactersFromCFStringInRange(zhtok *this, const __CFString *a2, CFRange a3)
{
}

void sub_2160EAB8C(_Unwind_Exception *a1)
{
  void *v1 = 0;
  MEMORY[0x2166C8C60](v2, 0x1000C80BDFB0063);
  _Unwind_Resume(a1);
}

uint64_t zhtok::LatticeWord::clearHypotheses(zhtok::LatticeWord *this)
{
  uint64_t result = *((void *)this + 1);
  if (result) {
    return zhtok::HypothesisSet::clear(result);
  }
  return result;
}

CFStringRef zhtok::LatticeWord::createDescription(zhtok::Word **this)
{
  return zhtok::Word::createDescription(*this);
}

uint64_t zhtok::LatticeWord::initializeBeginSentinelHypothesis(uint64_t a1, uint64_t a2)
{
  return zhtok::HypothesisSet::initializeBeginSentinelHypothesis(*(void *)(a1 + 8), a2);
}

void zhtok::LatticeWord::connectPreviousWord(zhtok::LatticeWord *this, const zhtok::HypothesisSet **a2, const zhtok::ConnectionContext *a3)
{
  *((unsigned char *)this + 16) = 1;
  zhtok::HypothesisSet::connectPreviousHypotheses(*((zhtok::HypothesisSet **)this + 1), *(const zhtok::Word **)this, a2[1], *a2, a3);
}

uint64_t ChineseTokenizerCreate(const __CFLocale *a1)
{
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(a1, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  if (CFEqual(Value, @"zh")) {
    operator new();
  }
  return 0;
}

void sub_2160EACAC(_Unwind_Exception *a1)
{
  MEMORY[0x2166C8C80](v1, 0x10E1C40EADB54B6);
  _Unwind_Resume(a1);
}

uint64_t ChineseTokenizerRelease(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

void ChineseTokenizerSetString(zhtok::WordLatticeController **this, __CFString *a2, CFRange a3)
{
  if (this) {
    zhtok::ChineseLMTokenizer::setString(this, a2, a3);
  }
}

zhtok::ChineseLMTokenizer *ChineseTokenizerAdvanceToNextToken(zhtok::ChineseLMTokenizer *this)
{
  if (this) {
    return (zhtok::ChineseLMTokenizer *)zhtok::ChineseLMTokenizer::advanceToNextToken(this);
  }
  return this;
}

zhtok::ChineseLMTokenizer *ChineseTokenizerGetCurrentTokenRange(zhtok::ChineseLMTokenizer *result)
{
  if (result) {
    return (zhtok::ChineseLMTokenizer *)zhtok::ChineseLMTokenizer::getCurrentTokenRange(result);
  }
  return result;
}

zhtok::ChineseLMTokenizer *ChineseTokenizerGoToTokenAtIndex(zhtok::ChineseLMTokenizer *this, uint64_t a2)
{
  if (this) {
    return (zhtok::ChineseLMTokenizer *)zhtok::ChineseLMTokenizer::goToTokenAtIndex(this, a2);
  }
  return this;
}

uint64_t ChineseTokenizerSetDynamicLexicon(zhtok::ChineseLMTokenizer *a1, CFArrayRef theArray)
{
  uint64_t v2 = 0;
  if (a1 && theArray)
  {
    if (CFArrayGetCount(theArray))
    {
      uint64_t v5 = zhtok::ChineseLMTokenizer::mutableWordLatticeController(a1);
      zhtok::DynamicLexiconBuilder::DynamicLexiconBuilder(v8);
      uint64_t v7 = 0;
      uint64_t v2 = zhtok::DynamicLexiconBuilder::build((uint64_t)v8, *(_DWORD *)(v5 + 8), theArray, (uint64_t)&v7);
      if (v2) {
        zhtok::WordLatticeController::setDynamicLexicon(v5, v7);
      }
      zhtok::DynamicLexiconBuilder::~DynamicLexiconBuilder((zhtok::DynamicLexiconBuilder *)v8);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

void sub_2160EADD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  zhtok::DynamicLexiconBuilder::~DynamicLexiconBuilder((zhtok::DynamicLexiconBuilder *)va);
  _Unwind_Resume(a1);
}

uint64_t ChineseTokenizerSetCustomWordCheckBlock(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1) {
    return zhtok::ChineseLMTokenizer::setCustomWordCheckBlock(a1, a2, a3);
  }
  return a1;
}

uint64_t reportAssertionFailure(const char *a1, int a2, const char *a3, const char *a4)
{
  uint64_t v7 = (FILE **)MEMORY[0x263EF8348];
  if (a4) {
    fprintf((FILE *)*MEMORY[0x263EF8348], "ASSERTION FAILED: %s\n", a4);
  }
  else {
    fwrite("SHOULD NEVER BE REACHED\n", 0x18uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  }
  return fprintf(*v7, "%s(%d) : %s\n", a1, a2, a3);
}

void reportBacktrace()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  *(_OWORD *)v8 = 0u;
  memset(v9, 0, sizeof(v9));
  int v0 = backtrace(v8, 33);
  uint64_t v1 = (v0 - 2);
  uint64_t v2 = backtrace_symbols((void *const *)v9, v1);
  if (v2)
  {
    CFStringRef v3 = v2;
    if (v0 >= 3)
    {
      uint64_t v4 = 0;
      uint64_t v5 = (FILE **)MEMORY[0x263EF8348];
      do
      {
        uint64_t v6 = v4 + 1;
        uint64_t v7 = *v5;
        if (v3[v4]) {
          fprintf(v7, "%-3d %p %s\n");
        }
        else {
          fprintf(v7, "%-3d %p\n");
        }
        uint64_t v4 = v6;
      }
      while (v1 != v6);
    }
    free(v3);
  }
}

void zhtok::ChineseLMTokenizer::ChineseLMTokenizer(zhtok::ChineseLMTokenizer *this, const __CFLocale *a2)
{
  *(void *)this = &unk_26C6B2B48;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 4) = -1;
  operator new();
}

void sub_2160EB034(_Unwind_Exception *a1)
{
  MEMORY[0x2166C8C80](v1, 0x10E1C40A58F4CECLL);
  _Unwind_Resume(a1);
}

void zhtok::ChineseLMTokenizer::~ChineseLMTokenizer(zhtok::ChineseLMTokenizer *this)
{
  *(void *)this = &unk_26C6B2B48;
  uint64_t v2 = (const void *)*((void *)this + 1);
  if (v2) {
    CFRelease(v2);
  }
  CFStringRef v3 = (void *)*((void *)this + 6);
  if (v3)
  {
    *((void *)this + 7) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8))(v4);
  }
}

{
  uint64_t vars8;

  zhtok::ChineseLMTokenizer::~ChineseLMTokenizer(this);

  JUMPOUT(0x2166C8C80);
}

BOOL zhtok::ChineseLMTokenizer::isAvailable(zhtok::ChineseLMTokenizer *this)
{
  uint64_t v1 = *((void *)this + 5);
  return *(void *)(v1 + 16) && *(void *)(*(void *)(v1 + 24) + 8) != 0;
}

void zhtok::ChineseLMTokenizer::reset(zhtok::WordLatticeController **this)
{
  zhtok::WordLatticeController::reset(this[5]);
  this[4] = (zhtok::WordLatticeController *)-1;
  uint64_t v2 = this[1];
  if (v2)
  {
    CFRelease(v2);
    this[1] = 0;
  }
  this[2] = 0;
  this[3] = 0;
  this[7] = this[6];
}

BOOL zhtok::ChineseLMTokenizer::isValid(zhtok::ChineseLMTokenizer *this, CFStringRef theString, CFRange a3)
{
  BOOL result = 0;
  if (theString)
  {
    CFIndex length = a3.length;
    if (a3.length)
    {
      CFIndex location = a3.location;
      CFIndex v6 = CFStringGetLength(theString);
      return location >= 0 && location + length <= v6;
    }
  }
  return result;
}

void zhtok::ChineseLMTokenizer::setString(zhtok::WordLatticeController **this, __CFString *a2, CFRange a3)
{
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  zhtok::ChineseLMTokenizer::reset(this);
  if (a2)
  {
    if (length)
    {
      CFIndex v7 = CFStringGetLength(a2);
      if ((location & 0x8000000000000000) == 0 && location + length <= v7)
      {
        this[1] = (zhtok::WordLatticeController *)CFStringCreateCopy(0, a2);
        this[2] = (zhtok::WordLatticeController *)location;
        this[3] = (zhtok::WordLatticeController *)length;
        v8 = this[5];
        *((void *)v8 + 14) = length;
        std::vector<zhtok::internal::FixedSizedArray<void *>>::reserve((void **)v8 + 8, length);
        std::vector<zhtok::internal::FixedSizedArray<void *>>::reserve(*((void ***)v8 + 6), length);
        v9.CFIndex location = length;
        zhtok::charactersFromCFStringInRange((zhtok *)a2, (const __CFString *)location, v9);
      }
    }
  }
}

void sub_2160EB364(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    MEMORY[0x2166C8C60](a10, 0x1000C80BDFB0063);
  }
  _Unwind_Resume(exception_object);
}

BOOL zhtok::ChineseLMTokenizer::advanceToNextToken(zhtok::ChineseLMTokenizer *this)
{
  unint64_t v1 = (uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 4;
  unint64_t v2 = *((void *)this + 4) + 1;
  if (v2 < v1) {
    *((void *)this + 4) = v2;
  }
  return v2 < v1;
}

uint64_t zhtok::ChineseLMTokenizer::getCurrentTokenRange(zhtok::ChineseLMTokenizer *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (v1 == -1) {
    return -1;
  }
  else {
    return *(void *)(*((void *)this + 6) + 16 * v1);
  }
}

BOOL zhtok::ChineseLMTokenizer::goToTokenAtIndex(zhtok::ChineseLMTokenizer *this, uint64_t a2)
{
  if (a2 < 0) {
    return 0;
  }
  if (*((void *)this + 3) <= a2) {
    return 0;
  }
  uint64_t v3 = *((void *)this + 6);
  uint64_t v2 = *((void *)this + 7);
  uint64_t v4 = v2 - v3;
  if (v2 == v3)
  {
    return 0;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = v4 >> 4;
    if (v6 <= 1) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = v6;
    }
    v8 = (void *)(v3 + 8);
    BOOL v9 = 1;
    while (1)
    {
      uint64_t v10 = *(v8 - 1) - *((void *)this + 2);
      if (v10 <= a2 && *v8 + v10 > a2) {
        break;
      }
      v8 += 2;
      BOOL v9 = ++v5 < v6;
      if (v7 == v5) {
        return 0;
      }
    }
    *((void *)this + 4) = v5;
  }
  return v9;
}

uint64_t zhtok::ChineseLMTokenizer::mutableWordLatticeController(zhtok::ChineseLMTokenizer *this)
{
  return *((void *)this + 5);
}

uint64_t zhtok::ChineseLMTokenizer::setCustomWordCheckBlock(uint64_t a1, uint64_t a2, void *a3)
{
  return zhtok::WordLatticeController::setCustomWordCheckBlock(*(void *)(a1 + 40), a2, a3);
}

void std::vector<zhtok::internal::FixedSizedArray<void *>>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0x2E8BA2E8BA2E8BA3 * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x2E8BA2E8BA2E8BBLL) {
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 88;
    unint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>(v3, a2);
    uint64_t v7 = &v6[88 * v5];
    BOOL v9 = &v6[88 * v8];
    uint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 88);
        *(_OWORD *)(v12 - 72) = *(_OWORD *)(v10 - 72);
        *(_OWORD *)(v12 - 88) = v13;
        long long v14 = *(_OWORD *)(v10 - 56);
        long long v15 = *(_OWORD *)(v10 - 40);
        long long v16 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v16;
        *(_OWORD *)(v12 - 40) = v15;
        *(_OWORD *)(v12 - 56) = v14;
        v12 -= 88;
        v10 -= 88;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264266300, MEMORY[0x263F8C060]);
}

void sub_2160EB5FC(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x2E8BA2E8BA2E8BBLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(88 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

CFStringRef zhtok::Word::createDescription(zhtok::Word *this)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"[%ld, %ld](%d)", *((void *)this + 1), *((void *)this + 2), *((unsigned int *)this + 1));
}

void zhtok::Word::summary(zhtok::Word *this, const __CFString *a2)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)&v6);
  CFStringRef v4 = CFStringCreateWithSubstring(0, a2, *(CFRange *)((char *)this + 8));
  zhtok::UTF8StringFromCFString(v4, v5);
}

void sub_2160EB958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  if (a6) {
    MEMORY[0x2166C8C60](a6, 0x1000C8077774924);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C328] + 104;
  *(void *)(a1 + 128) = MEMORY[0x263F8C328] + 104;
  uint64_t v3 = a1 + 16;
  uint64_t v4 = MEMORY[0x263F8C328] + 64;
  *(void *)(a1 + 16) = MEMORY[0x263F8C328] + 64;
  CFStringRef v5 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v6 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v7 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *(void *)a1 = v7;
  *(void *)(a1 + *(void *)(v7 - 24)) = v6;
  *(void *)(a1 + 8) = 0;
  uint64_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  uint64_t v9 = MEMORY[0x263F8C328] + 24;
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  uint64_t v10 = v5[5];
  uint64_t v11 = v5[4];
  *(void *)(a1 + 16) = v11;
  *(void *)(v3 + *(void *)(v11 - 24)) = v10;
  uint64_t v12 = v5[1];
  *(void *)a1 = v12;
  *(void *)(a1 + *(void *)(v12 - 24)) = v5[6];
  *(void *)a1 = v9;
  *(void *)(a1 + 128) = v2;
  *(void *)(a1 + 16) = v4;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_2160EBC78(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x2166C8C40](v1);
  _Unwind_Resume(a1);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream(uint64_t a1)
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
  MEMORY[0x2166C8C40](a1 + 128);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2166C8BA0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      uint64_t v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v11 = a2 + a3;
    }
    else {
      uint64_t v11 = a2;
    }
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9)) {
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x2166C8BB0](v13);
  return a1;
}

void sub_2160EBF14(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x2166C8BB0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2160EBEF4);
}

void sub_2160EBF68(_Unwind_Exception *a1)
{
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6 = a1;
  if (a1)
  {
    uint64_t v11 = *(void *)(a5 + 24);
    if (v11 <= a4 - a2) {
      int64_t v12 = 0;
    }
    else {
      int64_t v12 = v11 - (a4 - a2);
    }
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96))(a1) != a3 - a2) {
      return 0;
    }
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      long long v13 = v18 >= 0 ? __p : (void **)__p[0];
      uint64_t v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(void *)v6 + 96))(v6, v13, v12);
      if (v18 < 0) {
        operator delete(__p[0]);
      }
      if (v14 != v12) {
        return 0;
      }
    }
    uint64_t v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v6 + 96))(v6, a3, v15) == v15) {
      *(void *)(a5 + 24) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_2160EC0E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::string::basic_string[abi:ne180100](void *__b, size_t __len, int __c)
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
    uint64_t v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((unsigned char *)__b + 23) = __len;
    uint64_t v6 = __b;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memset(v6, __c, __len);
LABEL_9:
  *((unsigned char *)v6 + __len) = 0;
  return __b;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

uint64_t zhtok::HypothesisSet::initializeBeginSentinelHypothesis(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 80))
  {
    *(void *)(a1 + 80) = 0;
    *(void *)(a1 + 88) = 0;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  uint64_t v4 = *(void *)(a1 + 80);
  *(void *)(a1 + 80) = v4 + 1;
  *(void *)(a1 + 8 * v4) = result;
  return result;
}

uint64_t zhtok::HypothesisSet::clear(uint64_t this)
{
  *(void *)(this + 80) = 0;
  *(void *)(this + 88) = 0;
  return this;
}

double zhtok::HypothesisSet::bestBacktraceCost(zhtok::HypothesisSet *this)
{
  uint64_t v1 = *((void *)this + 11);
  if (v1) {
    return *(double *)(v1 + 16);
  }
  else {
    return 1.79769313e308;
  }
}

double zhtok::HypothesisSet::costOfNewHypothesis(zhtok::HypothesisSet *this, const zhtok::Hypothesis *a2, const zhtok::Word *a3, void **a4)
{
  if (((_BYTE)a4[1] & 1) != 0 && *((_DWORD *)a3 + 1) == 2) {
    return *((double *)a2 + 2);
  }
  if (*(_DWORD *)a3 == 3)
  {
    double v5 = *((double *)a2 + 2);
    double v6 = 0.5;
  }
  else
  {
    if (*(_DWORD *)a3 == 4) {
      double v5 = *((double *)a2 + 2) + (double)*((uint64_t *)a3 + 2) * -7.0;
    }
    else {
      double v5 = zhtok::Hypothesis::costOfExtendingToWord(a2, *((_DWORD *)a3 + 1), *a4) + *((double *)a2 + 2);
    }
    double v6 = 0.0;
  }
  return v5 + v6;
}

void zhtok::HypothesisSet::connectPreviousHypotheses(zhtok::HypothesisSet *this, const zhtok::Word *a2, const zhtok::HypothesisSet *a3, const zhtok::Word *a4, const zhtok::ConnectionContext *a5)
{
  uint64_t v5 = *((void *)a3 + 10);
  if (v5)
  {
    int v9 = this;
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    double v12 = 1.79769313e308;
    double v13 = 1.79769313e308;
    while (1)
    {
      uint64_t v14 = (double *)*((void *)a3 + v11);
      double v15 = v14[2];
      if (v11)
      {
        if (v15 > v13 || v15 > v12)
        {
          if (!v10) {
            return;
          }
LABEL_17:
          unint64_t v18 = *((void *)v9 + 10);
          if (!v18)
          {
            v33 = (zhtok::LatticeSessionData *)(*(uint64_t (**)(double))(*((void *)a5 + 2) + 16))(v13);
            uint64_t v34 = *((void *)v9 + 10);
            *((void *)v9 + v34) = v33;
            *((void *)v9 + 10) = v34 + 1;
            *((void *)v9 + 11) = v10;
            goto LABEL_44;
          }
          if (*(double *)(*(void *)v9 + 16) + 1.0 < v13
            || v18 >= 0xA && v13 >= *(double *)(*((void *)v9 + v18 - 1) + 16))
          {
            v33 = (zhtok::LatticeSessionData *)v10;
            goto LABEL_44;
          }
          v19 = (double *)(*(uint64_t (**)(double))(*((void *)a5 + 2) + 16))(v13);
          unint64_t v20 = *((void *)v9 + 10);
          if (!v20)
          {
            char v23 = 0;
            goto LABEL_57;
          }
          unint64_t v21 = 0;
          char v22 = 0;
          char v23 = 0;
          v24 = (void *)((char *)v9 + 8);
          uint64_t v25 = -1;
          while (2)
          {
            v26 = (double *)*((void *)v9 + v21);
            uint64_t v27 = *(void *)v26;
            uint64_t v28 = *(void *)v19;
            if (v22)
            {
              if (!(v23 & 1 | (v27 != v28)))
              {
                zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v26);
                uint64_t v35 = *((void *)v9 + 10);
                uint64_t v36 = v35 - 1;
                if (v21 < v35 - 1)
                {
                  uint64_t v37 = v35 + v25;
                  do
                  {
                    *(v24 - 1) = *v24;
                    ++v24;
                    --v37;
                  }
                  while (v37);
                }
                *((void *)v9 + 10) = v36;
                return;
              }
LABEL_39:
              char v22 = 1;
LABEL_40:
              ++v21;
              unint64_t v20 = *((void *)v9 + 10);
              ++v24;
              --v25;
              if (v21 >= v20)
              {
                if (v22) {
                  return;
                }
LABEL_56:
                if (v20 > 0xA) {
                  return;
                }
LABEL_57:
                if (v20 != 10 && (v23 & 1) == 0)
                {
                  zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v19);
                  uint64_t v38 = *((void *)v9 + 10);
                  *((void *)v9 + 10) = v38 + 1;
                  *((void *)v9 + v38) = v19;
                  return;
                }
                v33 = (zhtok::LatticeSessionData *)v19;
LABEL_44:
                zhtok::LatticeSessionData::logStatistics(v33);
                return;
              }
              continue;
            }
            break;
          }
          double v29 = v26[2];
          double v30 = v19[2];
          if (v27 == v28)
          {
            if (v29 <= v30)
            {
              char v23 = 1;
              goto LABEL_56;
            }
            zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v26);
            *((void *)v9 + v21) = v19;
            char v23 = 1;
          }
          else
          {
            if (v29 <= v30)
            {
              char v22 = 0;
              goto LABEL_40;
            }
            if (v20 == 10)
            {
              zhtok::LatticeSessionData::logStatistics(*((zhtok::LatticeSessionData **)v9 + 9));
              unint64_t v20 = *((void *)v9 + 10) - 1;
            }
            int64_t v31 = v20 - 1;
            unint64_t v32 = v20;
            while (v31 >= (uint64_t)v21)
            {
              *((void *)v9 + v32) = *((void *)v9 + v32 - 1);
              int64_t v31 = v32 - 2;
              --v32;
            }
            *((void *)v9 + v21) = v19;
            *((void *)v9 + 10) = v20 + 1;
          }
          zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v19);
          if (!v21) {
            *((void *)v9 + 11) = v10;
          }
          goto LABEL_39;
        }
      }
      else
      {
        double v12 = v15 + 2.0;
      }
      double v17 = zhtok::HypothesisSet::costOfNewHypothesis(this, *((const zhtok::Hypothesis **)a3 + v11), a2, (void **)a5);
      if (v10 && v13 <= v17)
      {
        this = (zhtok::HypothesisSet *)zhtok::LatticeSessionData::logStatistics((zhtok::LatticeSessionData *)v14);
      }
      else
      {
        double v13 = v17;
        uint64_t v10 = v14;
      }
      if (v5 == ++v11) {
        goto LABEL_17;
      }
    }
  }
}

uint64_t zhtok::ConnectionContext::ConnectionContext(uint64_t a1, uint64_t a2, int a3, void *aBlock)
{
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 8) = a3;
  *(void *)(a1 + 16) = _Block_copy(aBlock);
  return a1;
}

void zhtok::ConnectionContext::~ConnectionContext(const void **this)
{
}

{
  _Block_release(this[2]);
}

void *zhtok::DynamicLexiconBuilder::DynamicLexiconBuilder(void *this)
{
  *this = &unk_26C6B2B68;
  this[1] = 0;
  return this;
}

void zhtok::DynamicLexiconBuilder::~DynamicLexiconBuilder(zhtok::DynamicLexiconBuilder *this)
{
  *(void *)this = &unk_26C6B2B68;
  uint64_t v1 = (const void *)*((void *)this + 1);
  if (v1) {
    CFRelease(v1);
  }
}

{
  uint64_t vars8;

  zhtok::DynamicLexiconBuilder::~DynamicLexiconBuilder(this);

  JUMPOUT(0x2166C8C80);
}

uint64_t zhtok::DynamicLexiconBuilder::build(uint64_t a1, int a2, CFArrayRef theArray, uint64_t a4)
{
  if (!theArray) {
    return 0;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  uint64_t result = 0;
  if (a4)
  {
    if (Count)
    {
      uint64_t result = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
      *(void *)(a1 + 8) = result;
      if (result)
      {
        uint64_t result = zhtok::DynamicLexiconBuilder::registerLanguage(a1, a2);
        if (result)
        {
          uint64_t result = zhtok::DynamicLexiconBuilder::filterAndRegisterWords((CFMutableDictionaryRef *)a1, theArray);
          if (result) {
            operator new();
          }
        }
      }
    }
  }
  return result;
}

void sub_2160EC8B8(_Unwind_Exception *a1)
{
  MEMORY[0x2166C8C80](v1, 0x81C40D6874129);
  _Unwind_Resume(a1);
}

uint64_t zhtok::DynamicLexiconBuilder::registerLanguage(uint64_t a1, int a2)
{
  BOOL v2 = a2 == -1 || *(void *)(a1 + 8) == 0;
  uint64_t v3 = !v2;
  if (!v2)
  {
    CFLocaleRef LocaleForLanguage = createLocaleForLanguage(a2);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), (const void *)*MEMORY[0x263F512A8], LocaleForLanguage);
    CFRelease(LocaleForLanguage);
  }
  return v3;
}

BOOL zhtok::DynamicLexiconBuilder::filterAndRegisterWords(CFMutableDictionaryRef *this, CFArrayRef theArray)
{
  BOOL result = 0;
  if (theArray && this[1])
  {
    CFIndex Count = CFArrayGetCount(theArray);
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], Count, MEMORY[0x263EFFF70]);
    BOOL result = zhtok::DynamicLexiconBuilder::filter(Mutable, Mutable, theArray);
    if (result)
    {
      CFDictionarySetValue(this[1], (const void *)*MEMORY[0x263F51270], theArray);
      CFRelease(Mutable);
      return 1;
    }
  }
  return result;
}

BOOL zhtok::DynamicLexiconBuilder::filter(zhtok::DynamicLexiconBuilder *this, __CFArray *a2, CFArrayRef theArray)
{
  BOOL v3 = 0;
  if (a2 && theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count < 1)
    {
      return 1;
    }
    else
    {
      CFIndex v7 = Count;
      for (CFIndex i = 0; i != v7; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
        CFTypeID v10 = CFGetTypeID(ValueAtIndex);
        BOOL v11 = v10 == CFStringGetTypeID();
        BOOL v3 = v11;
        if (!v11) {
          break;
        }
        if (CFStringGetLength(ValueAtIndex) >= 3) {
          CFArrayAppendValue(a2, ValueAtIndex);
        }
      }
    }
  }
  return v3;
}

void zhtok::WordLatticeController::WordLatticeController(uint64_t a1, const __CFLocale *a2)
{
  *(void *)a1 = &unk_26C6B2B88;
  *(_DWORD *)(a1 + 8) = languageForLocale(a2);
  uint64_t v4 = languageModelBundleNameForLocale(a2);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512A8], a2);
  double v6 = (const void *)*MEMORY[0x263EFFB38];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51248], (const void *)*MEMORY[0x263EFFB38]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512D8], v6);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51258], v4);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512C0], (const void *)*MEMORY[0x263EFFB40]);
  uint64_t v7 = LMLanguageModelCreate();
  CFRelease(Mutable);
  *(void *)(a1 + 16) = v7;
  operator new();
}

void sub_2160ECD3C(_Unwind_Exception *a1)
{
  MEMORY[0x2166C8C80](v2, 0x1080C40BEC857D6);
  std::unique_ptr<zhtok::WordBreaker>::reset[abi:ne180100]((zhtok::WordBreaker **)(v1 + 176), 0);
  uint64_t v5 = *(void **)(v1 + 88);
  if (v5)
  {
    *(void *)(v1 + 96) = v5;
    operator delete(v5);
  }
  double v6 = (uint64_t *)(v1 + 48);
  uint64_t v7 = *(void **)(v1 + 64);
  if (v7)
  {
    *(void *)(v1 + 72) = v7;
    operator delete(v7);
  }
  std::unique_ptr<zhtok::ConnectionContext>::reset[abi:ne180100](v3, 0);
  uint64_t v8 = *v6;
  *double v6 = 0;
  if (v8) {
    std::default_delete<zhtok::Lattice>::operator()[abi:ne180100](v1 + 48, v8);
  }
  std::unique_ptr<zhtok::LatticeSessionData>::reset[abi:ne180100]((zhtok::LatticeSessionData **)(v1 + 40), 0);
  uint64_t v9 = *(void *)(v1 + 32);
  *(void *)(v1 + 32) = 0;
  if (v9) {
    (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
  }
  uint64_t v10 = *(void *)(v1 + 24);
  *(void *)(v1 + 24) = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  _Unwind_Resume(a1);
}

const void **std::unique_ptr<zhtok::ConnectionContext>::reset[abi:ne180100](const void ***a1, const void **a2)
{
  BOOL result = *a1;
  *a1 = a2;
  if (result)
  {
    zhtok::ConnectionContext::~ConnectionContext(result);
    JUMPOUT(0x2166C8C80);
  }
  return result;
}

char *___ZN5zhtok21WordLatticeControllerC2EPK10__CFLocale23ChineseTokenizerOptions_block_invoke(uint64_t a1, const zhtok::Word *a2, const zhtok::Hypothesis *a3, double a4)
{
  return zhtok::LatticeSessionData::makeHypothesis(*(char ***)(*(void *)(a1 + 32) + 40), a2, a4, a3);
}

void zhtok::WordLatticeController::~WordLatticeController(zhtok::WordLatticeController *this)
{
  *(void *)this = &unk_26C6B2B88;
  if (*((void *)this + 2)) {
    LMLanguageModelRelease();
  }
  uint64_t v2 = (const void *)*((void *)this + 23);
  if (v2) {
    _Block_release(v2);
  }
  std::unique_ptr<zhtok::WordBreaker>::reset[abi:ne180100]((zhtok::WordBreaker **)this + 22, 0);
  BOOL v3 = (void *)*((void *)this + 11);
  if (v3)
  {
    *((void *)this + 12) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 8);
  if (v4)
  {
    *((void *)this + 9) = v4;
    operator delete(v4);
  }
  std::unique_ptr<zhtok::ConnectionContext>::reset[abi:ne180100]((const void ***)this + 7, 0);
  uint64_t v5 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v5) {
    std::default_delete<zhtok::Lattice>::operator()[abi:ne180100]((uint64_t)this + 48, v5);
  }
  std::unique_ptr<zhtok::LatticeSessionData>::reset[abi:ne180100]((zhtok::LatticeSessionData **)this + 5, 0);
  uint64_t v6 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
}

{
  uint64_t vars8;

  zhtok::WordLatticeController::~WordLatticeController(this);

  JUMPOUT(0x2166C8C80);
}

double zhtok::WordLatticeController::reset(zhtok::WordLatticeController *this)
{
  uint64_t v2 = (zhtok::Lattice *)*((void *)this + 6);
  uint64_t v4 = *(void *)v2;
  uint64_t v3 = *((void *)v2 + 1);
  zhtok::Lattice::clear(v2);
  if (v3 != v4)
  {
    zhtok::LatticeSessionData::reset(*((zhtok::LatticeSessionData **)this + 5));
    *((void *)this + 9) = *((void *)this + 8);
    zhtok::TokenizerLexicon::reset(*((zhtok::TokenizerLexicon **)this + 3));
    *((unsigned char *)this + 152) = 0;
  }
  uint64_t v5 = (char *)*((void *)this + 8);
  uint64_t v6 = (char *)*((void *)this + 9);
  if (v6 == v5)
  {
    unint64_t v7 = *((void *)this + 10);
    if ((unint64_t)v6 >= v7)
    {
      uint64_t v9 = (v6 - v5) / 88;
      unint64_t v10 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v7 - (void)v5) >> 3);
      if (2 * v10 <= v9 + 1) {
        uint64_t v11 = v9 + 1;
      }
      else {
        uint64_t v11 = 2 * v10;
      }
      if (v10 >= 0x1745D1745D1745DLL) {
        unint64_t v12 = 0x2E8BA2E8BA2E8BALL;
      }
      else {
        unint64_t v12 = v11;
      }
      double v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>((uint64_t)this + 80, v12);
      uint64_t v14 = &v13[88 * v9];
      long long v16 = &v13[88 * v15];
      *(void *)uint64_t v14 = 0;
      uint64_t v8 = v14 + 88;
      unint64_t v18 = (char *)*((void *)this + 8);
      double v17 = (char *)*((void *)this + 9);
      if (v17 != v18)
      {
        do
        {
          long long v19 = *(_OWORD *)(v17 - 88);
          *(_OWORD *)(v14 - 72) = *(_OWORD *)(v17 - 72);
          *(_OWORD *)(v14 - 88) = v19;
          long long v20 = *(_OWORD *)(v17 - 56);
          long long v21 = *(_OWORD *)(v17 - 40);
          long long v22 = *(_OWORD *)(v17 - 24);
          *((void *)v14 - 1) = *((void *)v17 - 1);
          *(_OWORD *)(v14 - 24) = v22;
          *(_OWORD *)(v14 - 40) = v21;
          *(_OWORD *)(v14 - 56) = v20;
          v14 -= 88;
          v17 -= 88;
        }
        while (v17 != v18);
        double v17 = (char *)*((void *)this + 8);
      }
      *((void *)this + 8) = v14;
      *((void *)this + 9) = v8;
      *((void *)this + 10) = v16;
      if (v17) {
        operator delete(v17);
      }
    }
    else
    {
      *(void *)uint64_t v6 = 0;
      uint64_t v8 = v6 + 88;
    }
    *((void *)this + 9) = v8;
    char v23 = (uint64_t *)*((void *)this + 8);
    uint64_t v24 = *v23;
    if ((unint64_t)*v23 <= 9)
    {
      uint64_t v25 = *(void *)(*((void *)this + 3) + 16);
      *char v23 = v24 + 1;
      v23[v24 + 1] = v25;
    }
  }
  double result = NAN;
  *(_OWORD *)((char *)this + 120) = xmmword_2160F06A0;
  *(_OWORD *)((char *)this + 136) = xmmword_2160F06A0;
  return result;
}

void zhtok::Lattice::clear(zhtok::Lattice *this)
{
  uint64_t v2 = *(void **)this;
  *((void *)this + 1) = *(void *)this;
  unint64_t v5 = *((void *)this + 2);
  uint64_t v3 = (char *)this + 16;
  unint64_t v4 = v5;
  if ((unint64_t)v2 >= v5)
  {
    unint64_t v7 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v4 - (void)v2) >> 3);
    uint64_t v8 = 2 * v7;
    if (2 * v7 <= 1) {
      uint64_t v8 = 1;
    }
    if (v7 >= 0x1745D1745D1745DLL) {
      unint64_t v9 = 0x2E8BA2E8BA2E8BALL;
    }
    else {
      unint64_t v9 = v8;
    }
    unint64_t v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>((uint64_t)v3, v9);
    unint64_t v12 = &v10[11 * v11];
    *unint64_t v10 = 0;
    uint64_t v6 = v10 + 11;
    uint64_t v14 = *(char **)this;
    double v13 = (char *)*((void *)this + 1);
    if (v13 != *(char **)this)
    {
      do
      {
        long long v15 = *(_OWORD *)(v13 - 88);
        *(_OWORD *)(v10 - 9) = *(_OWORD *)(v13 - 72);
        *(_OWORD *)(v10 - 11) = v15;
        long long v16 = *(_OWORD *)(v13 - 56);
        long long v17 = *(_OWORD *)(v13 - 40);
        long long v18 = *(_OWORD *)(v13 - 24);
        *(v10 - 1) = *((void *)v13 - 1);
        *(_OWORD *)(v10 - 3) = v18;
        *(_OWORD *)(v10 - 5) = v17;
        *(_OWORD *)(v10 - 7) = v16;
        v10 -= 11;
        v13 -= 88;
      }
      while (v13 != v14);
      double v13 = *(char **)this;
    }
    *(void *)this = v10;
    *((void *)this + 1) = v6;
    *((void *)this + 2) = v12;
    if (v13) {
      operator delete(v13);
    }
  }
  else
  {
    void *v2 = 0;
    uint64_t v6 = v2 + 11;
  }
  *((void *)this + 1) = v6;
  uint64_t v19 = *((void *)this + 3);
  if (v19)
  {
    long long v20 = *(void **)this;
    if (!**(void **)this)
    {
      *long long v20 = 1;
      v20[1] = v19;
    }
  }
}

__n128 zhtok::WordLatticeController::getBestSegmentation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = *(__n128 **)a2;
  *(void *)(a2 + 8) = *(void *)a2;
  unint64_t v5 = *(uint64_t **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 16) + 8);
  if (v5[10])
  {
    uint64_t v6 = *v5;
    if (v6)
    {
      unint64_t v9 = (void *)(v6 + 24);
      unint64_t v10 = (void *)(a2 + 16);
      do
      {
        uint64_t v11 = *v9;
        unint64_t v12 = *(void *)(*v9 + 16);
        if (v12 && *(_DWORD *)v11 != 0x10000 && *(_DWORD *)v11 != 0x20000)
        {
          unint64_t v13 = *(void *)(v11 + 8) + a4;
          if ((unint64_t)v4 >= *v10)
          {
            uint64_t v14 = *(__n128 **)a2;
            uint64_t v15 = ((uint64_t)v4 - *(void *)a2) >> 4;
            unint64_t v16 = v15 + 1;
            if ((unint64_t)(v15 + 1) >> 60) {
              std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v17 = *v10 - (void)v14;
            if (v17 >> 3 > v16) {
              unint64_t v16 = v17 >> 3;
            }
            if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v18 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v18 = v16;
            }
            if (v18)
            {
              uint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CFRange>>((uint64_t)v10, v18);
              uint64_t v14 = *(__n128 **)a2;
              unint64_t v4 = *(__n128 **)(a2 + 8);
            }
            else
            {
              uint64_t v19 = 0;
            }
            long long v21 = (__n128 *)&v19[16 * v15];
            v21->n128_u64[0] = v13;
            v21->n128_u64[1] = v12;
            long long v22 = v21;
            if (v4 != v14)
            {
              do
              {
                __n128 result = v4[-1];
                v22[-1] = result;
                --v22;
                --v4;
              }
              while (v4 != v14);
              uint64_t v14 = *(__n128 **)a2;
            }
            unint64_t v4 = v21 + 1;
            *(void *)a2 = v22;
            *(void *)(a2 + 8) = v21 + 1;
            *(void *)(a2 + 16) = &v19[16 * v18];
            if (v14) {
              operator delete(v14);
            }
          }
          else
          {
            v4->n128_u64[0] = v13;
            v4->n128_u64[1] = v12;
            ++v4;
          }
          *(void *)(a2 + 8) = v4;
        }
        unint64_t v9 = (void *)v9[1];
      }
      while (v9);
      char v23 = *(__n128 **)a2;
      uint64_t v24 = v4 - 1;
      if (*(__n128 **)a2 != v4 && v24 > v23)
      {
        unint64_t n128_u64 = (unint64_t)v23[1].n128_u64;
        do
        {
          __n128 result = *(__n128 *)(n128_u64 - 16);
          *(__n128 *)(n128_u64 - 16) = *v24;
          *v24-- = result;
          BOOL v27 = n128_u64 >= (unint64_t)v24;
          n128_u64 += 16;
        }
        while (!v27);
      }
    }
  }
  return result;
}

void zhtok::WordLatticeController::connectEOS(zhtok::WordLatticeController *this)
{
  zhtok::LatticeWord::clearHypotheses(*(zhtok::LatticeWord **)(*(void *)(*((void *)this + 5) + 8) + 16));
  uint64_t v3 = *(void *)(*((void *)this + 6) + 8) - **((void **)this + 6);
  if (v3)
  {
    unint64_t v4 = *(zhtok::LatticeWord **)(*(void *)(*((void *)this + 5) + 8) + 16);
    zhtok::WordLatticeController::connectToWordsEndingAtIndex(this, v4, 0x2E8BA2E8BA2E8BA3 * (v3 >> 3) - 1, v2);
  }
}

uint64_t zhtok::WordLatticeController::setDynamicLexicon(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    if (result != a2)
    {
      *(void *)(a1 + 32) = 0;
      (*(void (**)(uint64_t))(*(void *)result + 8))(result);
      uint64_t result = *(void *)(a1 + 32);
      *(void *)(a1 + 32) = a2;
      if (result)
      {
        unint64_t v5 = *(uint64_t (**)(void))(*(void *)result + 8);
        return v5();
      }
    }
  }
  else
  {
    *(void *)(a1 + 32) = a2;
  }
  return result;
}

void zhtok::WordLatticeController::updateLattice(zhtok::Lattice **this, zhtok::LatticeWord *a2)
{
  unint64_t v4 = *(void *)(*(void *)a2 + 8);
  zhtok::Lattice::insert(this[6], *(void *)(*(void *)a2 + 16) + v4, a2);

  zhtok::WordLatticeController::connectToWordsEndingAtIndex((zhtok::WordLatticeController *)this, a2, v4, v5);
}

void zhtok::Lattice::insert(zhtok::Lattice *this, unint64_t a2, zhtok::LatticeWord *a3)
{
  uint64_t v5 = *(void *)this;
  uint64_t v6 = (void *)*((void *)this + 1);
  unint64_t v7 = 0x2E8BA2E8BA2E8BA3 * (((uint64_t)v6 - *(void *)this) >> 3);
  if (v7 <= a2)
  {
    unint64_t v9 = (void *)((char *)this + 16);
    do
    {
      if ((unint64_t)v6 >= *v9)
      {
        if (v7 + 1 > 0x2E8BA2E8BA2E8BALL) {
          std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v10 = 0x2E8BA2E8BA2E8BA3 * ((*v9 - v5) >> 3);
        uint64_t v11 = 2 * v10;
        if (2 * v10 <= v7 + 1) {
          uint64_t v11 = v7 + 1;
        }
        if (v10 >= 0x1745D1745D1745DLL) {
          unint64_t v12 = 0x2E8BA2E8BA2E8BALL;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12) {
          unint64_t v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>((uint64_t)v9, v12);
        }
        else {
          unint64_t v13 = 0;
        }
        uint64_t v14 = &v13[88 * v7];
        *(void *)uint64_t v14 = 0;
        uint64_t v6 = v14 + 88;
        unint64_t v16 = *(char **)this;
        uint64_t v15 = (char *)*((void *)this + 1);
        if (v15 != *(char **)this)
        {
          do
          {
            long long v17 = *(_OWORD *)(v15 - 88);
            *(_OWORD *)(v14 - 72) = *(_OWORD *)(v15 - 72);
            *(_OWORD *)(v14 - 88) = v17;
            long long v18 = *(_OWORD *)(v15 - 56);
            long long v19 = *(_OWORD *)(v15 - 40);
            long long v20 = *(_OWORD *)(v15 - 24);
            *((void *)v14 - 1) = *((void *)v15 - 1);
            *(_OWORD *)(v14 - 24) = v20;
            *(_OWORD *)(v14 - 40) = v19;
            *(_OWORD *)(v14 - 56) = v18;
            v14 -= 88;
            v15 -= 88;
          }
          while (v15 != v16);
          uint64_t v15 = *(char **)this;
        }
        *(void *)this = v14;
        *((void *)this + 1) = v6;
        *((void *)this + 2) = &v13[88 * v12];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        *uint64_t v6 = 0;
        *(_OWORD *)(v6 + 1) = v23;
        *(_OWORD *)(v6 + 9) = v27;
        *(_OWORD *)(v6 + 7) = v26;
        *(_OWORD *)(v6 + 5) = v25;
        *(_OWORD *)(v6 + 3) = v24;
        v6 += 11;
      }
      *((void *)this + 1) = v6;
      uint64_t v5 = *(void *)this;
      unint64_t v7 = 0x2E8BA2E8BA2E8BA3 * (((uint64_t)v6 - *(void *)this) >> 3);
    }
    while (v7 <= a2);
  }
  long long v21 = (uint64_t *)(v5 + 88 * a2);
  uint64_t v22 = *v21;
  if ((unint64_t)*v21 <= 9)
  {
    *long long v21 = v22 + 1;
    *(void *)(v5 + 88 * a2 + 8 * v22 + 8) = a3;
  }
}

void zhtok::WordLatticeController::connectToWordsEndingAtIndex(zhtok::WordLatticeController *this, zhtok::LatticeWord *a2, unint64_t a3, const zhtok::ConnectionContext *a4)
{
  uint64_t v4 = **((void **)this + 6);
  if (0x2E8BA2E8BA2E8BA3 * ((*(void *)(*((void *)this + 6) + 8) - v4) >> 3) > a3)
  {
    uint64_t v6 = (unint64_t *)(v4 + 88 * a3);
    unint64_t v7 = *v6;
    if (*v6)
    {
      unint64_t v10 = 0;
      uint64_t v11 = v4 + 88 * a3 + 8;
      double v12 = 1.79769313e308;
      do
      {
        if (*v6 <= v10)
        {
          uint64_t v13 = 0;
          if (!v10) {
            goto LABEL_12;
          }
        }
        else
        {
          uint64_t v13 = *(void *)(v11 + 8 * v10);
          if (!v10) {
            goto LABEL_12;
          }
        }
        uint64_t v14 = *(void **)(v13 + 8);
        if (v14[10]) {
          double v15 = *(double *)(*v14 + 16);
        }
        else {
          double v15 = 1.79769313e308;
        }
        if (v15 <= v12)
        {
LABEL_12:
          if (!*(unsigned char *)(v13 + 16)) {
            zhtok::WordLatticeController::connectToWordsEndingAtIndex(this, (zhtok::LatticeWord *)v13, a3 - *(void *)(*(void *)v13 + 16));
          }
          zhtok::WordLatticeController::connectToPreviousWord(this, (const zhtok::LatticeWord *)v13, a2, a4);
          unint64_t v16 = (void *)*((void *)a2 + 1);
          uint64_t v17 = v16[10];
          if (!v10 || (!v17 ? (double v18 = 1.79769313e308) : (double v18 = *(double *)(*v16 + 16)), v12 > v18))
          {
            if (v17) {
              double v12 = *(double *)(*v16 + 16);
            }
            else {
              double v12 = 1.79769313e308;
            }
          }
        }
        ++v10;
      }
      while (v7 != v10);
    }
  }
}

void zhtok::WordLatticeController::connectToPreviousWord(zhtok::WordLatticeController *this, const zhtok::LatticeWord *a2, zhtok::LatticeWord *a3, const zhtok::ConnectionContext *a4)
{
  uint64_t v4 = (void *)*((void *)a2 + 1);
  if (v4[10] && *v4)
  {
    zhtok::LatticeSessionData::logStatistics(*(zhtok::LatticeSessionData **)a2);
    uint64_t v8 = (const zhtok::ConnectionContext *)*((void *)this + 7);
    zhtok::LatticeWord::connectPreviousWord(a3, (const zhtok::HypothesisSet **)a2, v8);
  }
}

void zhtok::WordLatticeController::addWord(zhtok::WordLatticeController *this, void *a2, uint64_t a3)
{
  int WordID = zhtok::TokenizerLexicon::getWordID(*((zhtok::TokenizerLexicon **)this + 3), a2);
  if (WordID)
  {
    int v7 = WordID;
    TraversedCFIndex Length = zhtok::TokenizerLexicon::getTraversedLength(*((zhtok::TokenizerLexicon **)this + 3), a2);
    LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 2, v7, a3 - TraversedLength, TraversedLength);
    zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
  }
}

void zhtok::WordLatticeController::addUNKWord(char ***this, CFRange a2)
{
  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(this[5], 2, 0, a2.location, a2.length);

  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
}

void zhtok::WordLatticeController::addSpace(char ***this, CFRange a2)
{
  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(this[5], 0x10000, 0, a2.location, a2.length);

  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
}

void zhtok::WordLatticeController::addNewline(char ***this, CFRange a2)
{
  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(this[5], 0x20000, 0, a2.location, a2.length);

  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
}

void zhtok::WordLatticeController::addNonChineseWord(zhtok::WordLatticeController *this, const unsigned __int16 *a2, CFRange a3)
{
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  if (*((void *)this + 18))
  {
LABEL_2:
    int WordID = 0;
    goto LABEL_15;
  }
  if (a3.location < (unint64_t)(a3.location + a3.length))
  {
    uint64_t v8 = &a2[a3.location];
    uint64_t v9 = MEMORY[0x263EF8318];
    for (CFIndex i = a3.length; i; --i)
    {
      unsigned int v12 = *v8++;
      uint64_t v11 = v12;
      if (v12 > 0xFF) {
        goto LABEL_8;
      }
      if ((*(_DWORD *)(v9 + 4 * v11 + 60) & 0x400) != 0)
      {
        int WordID = 501;
        goto LABEL_15;
      }
      if (v11 <= 0x7F) {
        int v13 = *(_DWORD *)(v9 + 4 * v11 + 60) & 0x100;
      }
      else {
LABEL_8:
      }
        int v13 = __maskrune(v11, 0x100uLL);
      if (!v13) {
        goto LABEL_2;
      }
    }
  }
  uint64_t v14 = (void *)zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(*((zhtok::TokenizerLexicon **)this + 3), *(void **)(*((void *)this + 3) + 16), &a2[location], length);
  if (!zhtok::TokenizerLexicon::cursorHasEntry(*((zhtok::TokenizerLexicon **)this + 3), v14)
    || (int WordID = zhtok::TokenizerLexicon::getWordID(*((zhtok::TokenizerLexicon **)this + 3), v14)) == 0)
  {
    int WordID = 502;
  }
LABEL_15:
  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 2, WordID, location, length);

  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
}

uint64_t zhtok::WordLatticeController::addDynamicWord(zhtok::WordLatticeController *this, void *a2, const unsigned __int16 *a3, const CFRange *a4)
{
  uint64_t HasEntry = zhtok::TokenizerLexicon::cursorHasEntry(*((zhtok::TokenizerLexicon **)this + 4), a2);
  if (HasEntry)
  {
    int WordID = zhtok::TokenizerLexicon::getWordID(*((zhtok::TokenizerLexicon **)this + 4), a2);
    LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 3, WordID, a4->location, a4->length);
    zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
  }
  return HasEntry;
}

uint64_t zhtok::WordLatticeController::updateNonChineseTokenRange(zhtok::WordLatticeController *this, const unsigned __int16 *a2, CFRange a3, int a4, int a5)
{
  CFIndex length = a3.length;
  CFIndex location = a3.location;
  uint64_t result = a2[a3.location];
  *((void *)this + 16) = 0;
  *((void *)this + 18) = 0;
  CFIndex v9 = *((void *)this + 15);
  if (a4)
  {
    if (v9 == -1)
    {
      *((void *)this + 15) = a3.location;
      CFIndex v9 = a3.location;
    }
    if (v9 != -1 && a5 != 0)
    {
      uint64_t v11 = a3.location - v9;
      if (a3.location == v9) {
        uint64_t v11 = 1;
      }
      *((void *)this + 16) = v11;
    }
    if (*((unsigned char *)this + 152))
    {
      if ((a5 & 1) == 0) {
        *((void *)this + 16) = a3.location + a3.length - v9;
      }
    }
LABEL_24:
    uint64_t v14 = *((void *)this + 17);
    if (v14 == -1) {
      return result;
    }
    CFIndex v13 = location - v14;
    goto LABEL_26;
  }
  if (v9 != -1) {
    *((void *)this + 16) = a3.location - v9;
  }
  if (a3.length == 2) {
    uint64_t result = a2[a3.location + 1] + (result << 10) - 56613888;
  }
  if (result >> 1 != 4102)
  {
    uint64_t result = LMLanguageModelIsAppleColorEmojiCharacter();
    if (!result) {
      goto LABEL_24;
    }
  }
  CFIndex v12 = *((void *)this + 17);
  if (v12 == -1)
  {
    *((void *)this + 17) = location;
    CFIndex v12 = location;
  }
  if (*((unsigned char *)this + 152))
  {
    CFIndex v13 = location + length - v12;
LABEL_26:
    *((void *)this + 18) = v13;
  }
  return result;
}

uint64_t zhtok::WordLatticeController::addLatinWords(zhtok::WordLatticeController *this, const unsigned __int16 *a2, CFRange a3, int a4)
{
  uint64_t v4 = *((void *)this + 16);
  if (v4 < 1) {
    return 0;
  }
  uint64_t v6 = *((void *)this + 8);
  if (*((void *)this + 9) == v6) {
    return 0;
  }
  uint64_t v7 = *((void *)this + 15);
  if (v7 == -1)
  {
    uint64_t result = 0;
    *((void *)this + 16) = 0;
  }
  else
  {
    uint64_t v9 = v7 + v4;
    unint64_t v10 = (uint64_t *)(v6 + 88 * (v7 + v4));
    uint64_t v11 = *v10;
    if ((unint64_t)*v10 <= 9)
    {
      uint64_t v12 = *(void *)(*((void *)this + 3) + 16);
      *unint64_t v10 = v11 + 1;
      *(void *)(v6 + 88 * v9 + 8 * v11 + 8) = v12;
    }
    if (a4 && v7 == a3.location)
    {
      LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 0x10000, 0, a3.location, a3.length);
      zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
    }
    else
    {
      zhtok::WordLatticeController::addNonChineseWord(this, a2, *(CFRange *)((char *)this + 120));
    }
    uint64_t v15 = zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(*((zhtok::TokenizerLexicon **)this + 3), *(void **)(*((void *)this + 3) + 16), &a2[*((void *)this + 15)], *((void *)this + 16));
    if (v15)
    {
      uint64_t v16 = *((void *)this + 8);
      uint64_t v17 = (uint64_t *)(v16 + 88 * v9);
      uint64_t v18 = *v17;
      if ((unint64_t)*v17 <= 9)
      {
        *uint64_t v17 = v18 + 1;
        *(void *)(v16 + 88 * v9 + 8 * v18 + 8) = v15;
      }
    }
    *((void *)this + 15) = -1;
    return 1;
  }
  return result;
}

uint64_t zhtok::WordLatticeController::addEmojiWords(zhtok::WordLatticeController *this, const unsigned __int16 *a2)
{
  if (*((uint64_t *)this + 18) < 1 || *((void *)this + 9) == *((void *)this + 8)) {
    return 0;
  }
  if (*((void *)this + 17) == -1)
  {
    uint64_t result = 0;
    *((void *)this + 18) = 0;
  }
  else
  {
    if ((zhtok::WordLatticeController::breakEmojiWords(this, a2) & 1) == 0) {
      zhtok::WordLatticeController::addNonChineseWord(this, a2, *(CFRange *)((char *)this + 136));
    }
    *((void *)this + 17) = -1;
    return 1;
  }
  return result;
}

uint64_t zhtok::WordLatticeController::breakEmojiWords(zhtok::WordLatticeController *this, const unsigned __int16 *a2)
{
  int64_t v2 = *((void *)this + 18);
  if (v2 < 2) {
    return 0;
  }
  uint64_t result = *((void *)this + 22);
  if (result)
  {
    uint64_t result = zhtok::WordBreaker::set((zhtok::WordBreaker *)result, &a2[*((void *)this + 17)], v2);
    if (result)
    {
      uint64_t v6 = *((void *)this + 22);
      int v7 = *(_DWORD *)(v6 + 8);
      if (v7 != -1)
      {
        int v8 = *(_DWORD *)(v6 + 8);
        do
        {
          if (v7 > v8)
          {
            v9.CFIndex location = *((void *)this + 17) + v8;
            v9.CFIndex length = v7 - v8;
            zhtok::WordLatticeController::addNonChineseWord(this, a2, v9);
            uint64_t v6 = *((void *)this + 22);
            int v8 = v7;
          }
          int v7 = ubrk_next();
          *(_DWORD *)(v6 + 8) = v7;
          uint64_t v6 = *((void *)this + 22);
        }
        while (*(_DWORD *)(v6 + 8) != -1);
      }
      return 1;
    }
  }
  return result;
}

BOOL zhtok::WordLatticeController::addCustomWordIfFound(zhtok::WordLatticeController *this, const unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3 = *((void *)this + 24);
  uint64_t v4 = (a3 - v3) & ~((a3 - v3) >> 63);
  if (v4 >= a3) {
    return 0;
  }
  uint64_t v7 = *((void *)this + 23);
  int v8 = &a2[v4];
  if (a3 >= v3) {
    uint64_t v9 = v3;
  }
  else {
    uint64_t v9 = a3;
  }
  if (((*(uint64_t (**)(uint64_t, const unsigned __int16 *, uint64_t))(v7 + 16))(v7, &a2[v4], v9) & 1) == 0)
  {
    uint64_t v11 = -v4;
    uint64_t v12 = v8 + 1;
    while (a3 + v11 != 1)
    {
      --v11;
      ++v12;
      if ((*(unsigned int (**)(void))(*((void *)this + 23) + 16))())
      {
        uint64_t v4 = -v11;
        BOOL v10 = -v11 < a3;
        uint64_t v9 = a3 + v11;
        goto LABEL_11;
      }
    }
    return 0;
  }
  BOOL v10 = 1;
LABEL_11:
  LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 4, 0, v4, v9);
  zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
  return v10;
}

void zhtok::WordLatticeController::addComposedCharacteracterInRange(zhtok::WordLatticeController *this, const unsigned __int16 *a2, CFRange a3)
{
  CFIndex length = a3.length;
  unint64_t v4 = a3.location + a3.length;
  if (*((void *)this + 14) == a3.location + a3.length) {
    *((unsigned char *)this + 152) = 1;
  }
  uint64_t location = a3.location;
  v41 = (unsigned __int16 *)&a2[a3.location];
  *(_DWORD *)theChar = *v41;
  uint64_t v5 = *((void *)this + 8);
  uint64_t v6 = (void *)*((void *)this + 9);
  uint64_t v7 = (void **)((char *)this + 64);
  unint64_t v8 = 0x2E8BA2E8BA2E8BA3 * (((uint64_t)v6 - v5) >> 3);
  if (v8 <= v4)
  {
    uint64_t v9 = (void *)((char *)this + 80);
    do
    {
      if ((unint64_t)v6 >= *v9)
      {
        if (v8 + 1 > 0x2E8BA2E8BA2E8BALL) {
          std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v10 = 0x2E8BA2E8BA2E8BA3 * ((*v9 - v5) >> 3);
        uint64_t v11 = 2 * v10;
        if (2 * v10 <= v8 + 1) {
          uint64_t v11 = v8 + 1;
        }
        if (v10 >= 0x1745D1745D1745DLL) {
          unint64_t v12 = 0x2E8BA2E8BA2E8BALL;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12) {
          CFIndex v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::internal::FixedSizedArray<void *>>>((uint64_t)this + 80, v12);
        }
        else {
          CFIndex v13 = 0;
        }
        uint64_t v14 = &v13[88 * v8];
        *(void *)uint64_t v14 = 0;
        uint64_t v6 = v14 + 88;
        uint64_t v16 = (char *)*((void *)this + 8);
        uint64_t v15 = (char *)*((void *)this + 9);
        if (v15 != v16)
        {
          do
          {
            long long v17 = *(_OWORD *)(v15 - 88);
            *(_OWORD *)(v14 - 72) = *(_OWORD *)(v15 - 72);
            *(_OWORD *)(v14 - 88) = v17;
            long long v18 = *(_OWORD *)(v15 - 56);
            long long v19 = *(_OWORD *)(v15 - 40);
            long long v20 = *(_OWORD *)(v15 - 24);
            *((void *)v14 - 1) = *((void *)v15 - 1);
            *(_OWORD *)(v14 - 24) = v20;
            *(_OWORD *)(v14 - 40) = v19;
            *(_OWORD *)(v14 - 56) = v18;
            v14 -= 88;
            v15 -= 88;
          }
          while (v15 != v16);
          uint64_t v15 = (char *)*v7;
        }
        *((void *)this + 8) = v14;
        *((void *)this + 9) = v6;
        *((void *)this + 10) = &v13[88 * v12];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        *uint64_t v6 = 0;
        *(_OWORD *)(v6 + 1) = v46;
        *(_OWORD *)(v6 + 9) = v50;
        *(_OWORD *)(v6 + 7) = v49;
        *(_OWORD *)(v6 + 5) = v48;
        *(_OWORD *)(v6 + 3) = v47;
        v6 += 11;
      }
      *((void *)this + 9) = v6;
      uint64_t v5 = *((void *)this + 8);
      unint64_t v8 = 0x2E8BA2E8BA2E8BA3 * (((uint64_t)v6 - v5) >> 3);
    }
    while (v8 <= v4);
  }
  uint64_t v21 = location;
  if (*((void *)this + 23) && zhtok::WordLatticeController::addCustomWordIfFound(this, a2, v4)) {
    return;
  }
  CFCharacterSetRef v22 = (const __CFCharacterSet *)*((void *)this + 20);
  if (v22 && CFCharacterSetIsCharacterMember(v22, theChar[0]))
  {
    int v23 = 0x20000;
LABEL_60:
    LatticeWord = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), v23, 0, v21, length);
    zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)LatticeWord);
    return;
  }
  BOOL v25 = length == 1 && (*(_DWORD *)theChar - 1) < 0xFF;
  CFCharacterSetRef v26 = (const __CFCharacterSet *)*((void *)this + 21);
  if (v26) {
    BOOL v27 = CFCharacterSetIsCharacterMember(v26, theChar[0]) != 0;
  }
  else {
    BOOL v27 = 0;
  }
  v52.uint64_t location = location;
  v52.CFIndex length = length;
  zhtok::WordLatticeController::updateNonChineseTokenRange(this, a2, v52, v25, v27);
  v53.uint64_t location = location;
  v53.CFIndex length = length;
  char v28 = zhtok::WordLatticeController::addLatinWords(this, a2, v53, v27);
  uint64_t v29 = *((void *)this + 8);
  unint64_t v30 = 0x2E8BA2E8BA2E8BA3 * ((*((void *)this + 9) - v29) >> 3) - 1;
  if (v25)
  {
    BOOL v31 = v30 < 2 || *(void *)(v29 + 8 * ((*((void *)this + 9) - v29) >> 3) - 176) == 0;
    unint64_t v32 = v41;
    if (zhtok::WordLatticeController::addEmojiWords(this, a2)) {
      goto LABEL_44;
    }
  }
  else
  {
    unint64_t v32 = v41;
    if (zhtok::WordLatticeController::addEmojiWords(this, a2)) {
      goto LABEL_45;
    }
    BOOL v31 = 0;
  }
  if (*((void *)this + 17) != -1) {
    return;
  }
LABEL_44:
  if (v31) {
    return;
  }
LABEL_45:
  v33 = (unint64_t *)((char *)*v7 + 88 * location);
  unint64_t v34 = *v33;
  if (*v33)
  {
    unint64_t v35 = 0;
    uint64_t v36 = (uint64_t)*v7 + 88 * location + 8;
    do
    {
      if (*v33 <= v35) {
        uint64_t v37 = 0;
      }
      else {
        uint64_t v37 = *(void **)(v36 + 8 * v35);
      }
      zhtok::WordLatticeController::addWord((zhtok::TokenizerLexicon **)this, v37, v32, length, v30);
      ++v35;
    }
    while (v34 != v35);
  }
  uint64_t v21 = location;
  if (location < 1) {
    char v38 = 1;
  }
  else {
    char v38 = v28;
  }
  if ((v38 & 1) == 0) {
    zhtok::WordLatticeController::addWord((zhtok::TokenizerLexicon **)this, *(void **)(*((void *)this + 3) + 16), v32, length, v30);
  }
  if (v27)
  {
    v39 = zhtok::LatticeSessionData::makeLatticeWord(*((char ***)this + 5), 0x10000, 0, location, length);
    zhtok::WordLatticeController::updateLattice((zhtok::Lattice **)this, (zhtok::LatticeWord *)v39);
  }
  if (0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*(void *)(*((void *)this + 6) + 8) - **((void **)this + 6)) >> 3) < (unint64_t)(0x2E8BA2E8BA2E8BA3 * ((uint64_t)(*((void *)this + 9) - *((void *)this + 8)) >> 3)))
  {
    int v23 = 2;
    goto LABEL_60;
  }
}

void zhtok::WordLatticeController::addWord(zhtok::TokenizerLexicon **this, void *a2, const unsigned __int16 *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = (void *)zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(this[3], a2, a3, a4);
  if (v7)
  {
    unint64_t v8 = this[8];
    uint64_t v9 = (uint64_t *)((char *)v8 + 88 * a5);
    uint64_t v10 = *v9;
    if ((unint64_t)*v9 <= 9)
    {
      *uint64_t v9 = v10 + 1;
      *((void *)v8 + 11 * a5 + v10 + 1) = v7;
      zhtok::WordLatticeController::addWord((zhtok::WordLatticeController *)this, v7, a5);
    }
  }
}

uint64_t zhtok::WordLatticeController::rewriteLatticeWithDynamicWords(zhtok::WordLatticeController *this, const unsigned __int16 *a2)
{
  if (!a2) {
    return 0;
  }
  if (!*((void *)this + 14) || !*((void *)this + 4)) {
    return 0;
  }
  unint64_t v4 = 0;
  do
  {
    uint64_t v5 = *(void **)(*((void *)this + 4) + 16);
    for (CFIndex i = 3; i != 8; ++i)
    {
      if (v4 + i - 1 >= *((void *)this + 14)) {
        break;
      }
      v10.uint64_t location = v4;
      v10.CFIndex length = i;
      uint64_t v7 = (void *)zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(*((zhtok::TokenizerLexicon **)this + 4), v5, &a2[v4], i);
      if (!v7) {
        break;
      }
      zhtok::WordLatticeController::addDynamicWord(this, v7, v8, &v10);
    }
    ++v4;
  }
  while (v4 < *((void *)this + 14));
  return 1;
}

uint64_t zhtok::WordLatticeController::setCustomWordCheckBlock(uint64_t a1, uint64_t a2, void *aBlock)
{
  *(void *)(a1 + 192) = a2;
  uint64_t v5 = *(const void **)(a1 + 184);
  if (v5)
  {
    _Block_release(v5);
    *(void *)(a1 + 184) = 0;
  }
  if (aBlock) {
    *(void *)(a1 + 184) = _Block_copy(aBlock);
  }
  return 1;
}

zhtok::LatticeSessionData *std::unique_ptr<zhtok::LatticeSessionData>::reset[abi:ne180100](zhtok::LatticeSessionData **a1, zhtok::LatticeSessionData *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    zhtok::LatticeSessionData::~LatticeSessionData(result);
    JUMPOUT(0x2166C8C80);
  }
  return result;
}

void std::default_delete<zhtok::Lattice>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    int64_t v2 = *(void **)a2;
    if (*(void *)a2)
    {
      *(void *)(a2 + 8) = v2;
      operator delete(v2);
    }
    JUMPOUT(0x2166C8C80);
  }
}

zhtok::WordBreaker *std::unique_ptr<zhtok::WordBreaker>::reset[abi:ne180100](zhtok::WordBreaker **a1, zhtok::WordBreaker *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    zhtok::WordBreaker::~WordBreaker(result);
    JUMPOUT(0x2166C8C80);
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

void *zhtok::TokenizerLexicon::TokenizerLexicon(void *this)
{
  this[1] = 0;
  this[2] = 0;
  *this = &unk_26C6B2B28;
  return this;
}

void *zhtok::TokenizerLexicon::TokenizerLexicon(void *a1, int a2)
{
  *a1 = &unk_26C6B2B28;
  if (a2 == -1)
  {
    a1[1] = 0;
    a1[2] = 0;
  }
  else
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFLocaleRef LocaleForLanguage = createLocaleForLanguage(a2);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512A8], LocaleForLanguage);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512C0], (const void *)*MEMORY[0x263EFFB40]);
    uint64_t v6 = LMLexiconCreate();
    CFRelease(LocaleForLanguage);
    CFRelease(Mutable);
    a1[1] = v6;
    a1[2] = 0;
    if (v6) {
      a1[2] = LMLexiconGetRootCursor();
    }
  }
  return a1;
}

void zhtok::TokenizerLexicon::~TokenizerLexicon(zhtok::TokenizerLexicon *this)
{
  *(void *)this = &unk_26C6B2B28;
  if (*((void *)this + 1)) {
    LMLexiconRelease();
  }
}

{
  uint64_t vars8;

  zhtok::TokenizerLexicon::~TokenizerLexicon(this);

  JUMPOUT(0x2166C8C80);
}

uint64_t zhtok::TokenizerLexicon::reset(zhtok::TokenizerLexicon *this)
{
  uint64_t result = *((void *)this + 1);
  if (result)
  {
    LMLexiconResetCursors();
    uint64_t result = LMLexiconGetRootCursor();
    *((void *)this + 2) = result;
  }
  return result;
}

uint64_t zhtok::TokenizerLexicon::getTraversedLength(zhtok::TokenizerLexicon *this, void *a2)
{
  return MEMORY[0x270F46BE8](*((void *)this + 1), a2);
}

uint64_t zhtok::TokenizerLexicon::cursorHasEntry(zhtok::TokenizerLexicon *this, void *a2)
{
  return MEMORY[0x270F46BE0](*((void *)this + 1), a2);
}

uint64_t zhtok::TokenizerLexicon::getWordID(zhtok::TokenizerLexicon *this, void *a2)
{
  return MEMORY[0x270F46BC8](*((void *)this + 1), a2);
}

uint64_t zhtok::TokenizerLexicon::cursorByAdvancingWithCharacters(zhtok::TokenizerLexicon *this, void *a2, const unsigned __int16 *a3, uint64_t a4)
{
  return MEMORY[0x270F46BF0](*((void *)this + 1), a2, a3, a4, 0);
}

uint64_t zhtok::TokenizerLexicon::setLexicon(zhtok::TokenizerLexicon *this, void *a2)
{
  if (*((void *)this + 1))
  {
    LMLexiconResetCursors();
    LMLexiconRelease();
  }
  *((void *)this + 1) = a2;
  uint64_t result = LMLexiconGetRootCursor();
  *((void *)this + 2) = result;
  return result;
}

void zhtok::LatticeSessionData::Sentinel::createBOS(zhtok::LatticeSessionData::Sentinel *this)
{
}

void zhtok::LatticeSessionData::Sentinel::createEOS(zhtok::LatticeSessionData::Sentinel *this)
{
}

void zhtok::LatticeSessionData::LatticeSessionData(zhtok::LatticeSessionData *this)
{
}

void sub_2160EEDB0(_Unwind_Exception *a1)
{
  uint64_t v7 = v4;
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(v7);
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(v6);
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(v5);
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(v3);
  uint64_t v9 = *v2;
  void *v2 = 0;
  if (v9) {
    std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100]((uint64_t)v2, v9);
  }
  CFRange v10 = *v1;
  const void *v1 = 0;
  if (v10) {
    std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100]((uint64_t)v1, v10);
  }
  _Unwind_Resume(a1);
}

uint64_t zhtok::LatticeSessionData::resetSentinels(zhtok::LatticeSessionData *this)
{
  zhtok::LatticeWord::clearHypotheses(*(zhtok::LatticeWord **)(*(void *)this + 16));
  zhtok::LatticeWord::clearHypotheses(*(zhtok::LatticeWord **)(*((void *)this + 1) + 16));
  uint64_t v2 = *(void *)(*(void *)this + 16);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 0x40000000;
  v4[2] = ___ZN5zhtok18LatticeSessionData14resetSentinelsEv_block_invoke;
  v4[3] = &__block_descriptor_tmp_0;
  v4[4] = this;
  return zhtok::LatticeWord::initializeBeginSentinelHypothesis(v2, (uint64_t)v4);
}

void zhtok::LatticeSessionData::~LatticeSessionData(uint64_t **this)
{
  zhtok::LatticeSessionData::reset((zhtok::LatticeSessionData *)this);
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool((uint64_t)(this + 23));
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool((uint64_t)(this + 16));
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool((uint64_t)(this + 9));
  zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool((uint64_t)(this + 2));
  uint64_t v2 = this[1];
  this[1] = 0;
  if (v2) {
    std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100]((uint64_t)(this + 1), v2);
  }
  uint64_t v3 = *this;
  *this = 0;
  if (v3) {
    std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100]((uint64_t)this, v3);
  }
}

uint64_t zhtok::LatticeSessionData::reset(zhtok::LatticeSessionData *this)
{
  uint64_t Logger = zhtok::Logger::getLogger(this);
  zhtok::Logger::log(Logger, 8u, "===RESET===\n");
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)this + 16);
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)this + 72);
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)this + 128);
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)this + 184);

  return zhtok::LatticeSessionData::resetSentinels(this);
}

void zhtok::ObjectPool<zhtok::Hypothesis>::reset(uint64_t a1)
{
  uint64_t v3 = *(void ***)a1;
  unint64_t v2 = *(void *)(a1 + 8);
  if (*(void *)a1 < v2)
  {
    do
    {
      if (*v3)
      {
        free(*v3);
        unint64_t v2 = *(void *)(a1 + 8);
      }
      ++v3;
    }
    while ((unint64_t)v3 < v2);
    uint64_t v3 = *(void ***)a1;
  }
  *(void *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 48) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
}

char *___ZN5zhtok18LatticeSessionData14resetSentinelsEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(char ***)(a1 + 32);
  uint64_t v2 = **((void **)*v1 + 2);
  uint64_t v3 = zhtok::ObjectPool<zhtok::Hypothesis>::alloc(v1 + 2);
  zhtok::Hypothesis::init(v3, v2, 0, 0.0);
  return v3;
}

char *zhtok::LatticeSessionData::makeHypothesis(char **this, const zhtok::Word *a2, double a3, const zhtok::Hypothesis *a4)
{
  uint64_t v7 = zhtok::ObjectPool<zhtok::Hypothesis>::alloc(this + 2);
  zhtok::Hypothesis::init(v7, (uint64_t)a2, (uint64_t)a4, a3);
  return v7;
}

double zhtok::LatticeSessionData::makeHypothesisSet(char **this)
{
  uint64_t v1 = zhtok::ObjectPool<zhtok::HypothesisSet>::alloc(this + 23);
  double result = 0.0;
  *(_OWORD *)uint64_t v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 3) = 0u;
  *((_OWORD *)v1 + 4) = 0u;
  *((_OWORD *)v1 + 5) = 0u;
  return result;
}

char *zhtok::ObjectPool<zhtok::HypothesisSet>::alloc(char **a1)
{
  uint64_t v2 = a1[3];
  if (v2)
  {
    uint64_t v4 = a1[4];
    uint64_t v3 = a1[5];
    size_t v5 = v4 - v2;
    if ((char *)(0xAAAAAAAAAAAAAAABLL * ((v4 - v2) >> 5)) != v3) {
      goto LABEL_22;
    }
  }
  else
  {
    size_t v5 = 96 * (void)a1[5];
  }
  uint64_t v4 = (char *)malloc_type_malloc(v5, 0x1060040C2C571E4uLL);
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v6 - (void)*a1;
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
      CFIndex v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>((uint64_t)(a1 + 2), v12);
    }
    else {
      CFIndex v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = v4;
    unint64_t v8 = v14 + 8;
    long long v17 = *a1;
    uint64_t v16 = a1[1];
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
      uint64_t v16 = *a1;
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
    *(void *)uint64_t v7 = v4;
    unint64_t v8 = v7 + 8;
  }
  a1[1] = v8;
  a1[3] = v4;
LABEL_22:
  ++*((_DWORD *)a1 + 12);
  a1[4] = v4 + 96;
  return v4;
}

char *zhtok::ObjectPool<zhtok::Hypothesis>::alloc(char **a1)
{
  uint64_t v2 = a1[3];
  if (v2)
  {
    uint64_t v4 = a1[4];
    uint64_t v3 = a1[5];
    size_t v5 = v4 - v2;
    if ((char *)(0xCCCCCCCCCCCCCCCDLL * ((v4 - v2) >> 3)) != v3) {
      goto LABEL_22;
    }
  }
  else
  {
    size_t v5 = 40 * (void)a1[5];
  }
  uint64_t v4 = (char *)malloc_type_malloc(v5, 0x10600404FD43036uLL);
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v6 - (void)*a1;
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
      CFIndex v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>((uint64_t)(a1 + 2), v12);
    }
    else {
      CFIndex v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = v4;
    unint64_t v8 = v14 + 8;
    long long v17 = *a1;
    uint64_t v16 = a1[1];
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
      uint64_t v16 = *a1;
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
    *(void *)uint64_t v7 = v4;
    unint64_t v8 = v7 + 8;
  }
  a1[1] = v8;
  a1[3] = v4;
LABEL_22:
  ++*((_DWORD *)a1 + 12);
  a1[4] = v4 + 40;
  return v4;
}

char *zhtok::LatticeSessionData::makeWord(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  double result = zhtok::ObjectPool<zhtok::Word>::alloc((char **)(a1 + 72));
  *(_DWORD *)double result = a2;
  *((_DWORD *)result + 1) = a3;
  *((void *)result + 1) = a4;
  *((void *)result + 2) = a5;
  return result;
}

char *zhtok::ObjectPool<zhtok::Word>::alloc(char **a1)
{
  uint64_t v2 = a1[3];
  if (v2)
  {
    uint64_t v4 = a1[4];
    uint64_t v3 = a1[5];
    size_t v5 = v4 - v2;
    if ((char *)(0xAAAAAAAAAAAAAAABLL * ((v4 - v2) >> 3)) != v3) {
      goto LABEL_22;
    }
  }
  else
  {
    size_t v5 = 24 * (void)a1[5];
  }
  uint64_t v4 = (char *)malloc_type_malloc(v5, 0x1000040504FFAC1uLL);
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v6 - (void)*a1;
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
      CFIndex v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>((uint64_t)(a1 + 2), v12);
    }
    else {
      CFIndex v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = v4;
    unint64_t v8 = v14 + 8;
    long long v17 = *a1;
    uint64_t v16 = a1[1];
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
      uint64_t v16 = *a1;
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
    *(void *)uint64_t v7 = v4;
    unint64_t v8 = v7 + 8;
  }
  a1[1] = v8;
  a1[3] = v4;
LABEL_22:
  ++*((_DWORD *)a1 + 12);
  a1[4] = v4 + 24;
  return v4;
}

char *zhtok::LatticeSessionData::makeLatticeWord(char **a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = zhtok::ObjectPool<zhtok::LatticeWord>::alloc(a1 + 16);
  uint64_t v11 = zhtok::ObjectPool<zhtok::Word>::alloc(a1 + 9);
  *(_DWORD *)uint64_t v11 = a2;
  *((_DWORD *)v11 + 1) = a3;
  *((void *)v11 + 1) = a4;
  *((void *)v11 + 2) = a5;
  unint64_t v12 = zhtok::ObjectPool<zhtok::HypothesisSet>::alloc(a1 + 23);
  *(_OWORD *)unint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((_OWORD *)v12 + 2) = 0u;
  *((_OWORD *)v12 + 3) = 0u;
  *((_OWORD *)v12 + 4) = 0u;
  *((_OWORD *)v12 + 5) = 0u;
  *(void *)uint64_t v10 = v11;
  *((void *)v10 + 1) = v12;
  v10[16] = 0;
  return v10;
}

char *zhtok::ObjectPool<zhtok::LatticeWord>::alloc(char **a1)
{
  uint64_t v2 = a1[3];
  if (v2)
  {
    uint64_t v4 = a1[4];
    uint64_t v3 = a1[5];
    size_t v5 = v4 - v2;
    if ((char *)(0xAAAAAAAAAAAAAAABLL * ((v4 - v2) >> 3)) != v3) {
      goto LABEL_22;
    }
  }
  else
  {
    size_t v5 = 24 * (void)a1[5];
  }
  uint64_t v4 = (char *)malloc_type_malloc(v5, 0x1020040A95220FAuLL);
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t v7 = a1[1];
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = (v7 - *a1) >> 3;
    if ((unint64_t)(v9 + 1) >> 61) {
      std::vector<zhtok::internal::FixedSizedArray<void *>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v10 = v6 - (void)*a1;
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
      CFIndex v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>((uint64_t)(a1 + 2), v12);
    }
    else {
      CFIndex v13 = 0;
    }
    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = v4;
    unint64_t v8 = v14 + 8;
    long long v17 = *a1;
    uint64_t v16 = a1[1];
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
      uint64_t v16 = *a1;
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
    *(void *)uint64_t v7 = v4;
    unint64_t v8 = v7 + 8;
  }
  a1[1] = v8;
  a1[3] = v4;
LABEL_22:
  ++*((_DWORD *)a1 + 12);
  a1[4] = v4 + 24;
  return v4;
}

void *zhtok::ObjectPool<zhtok::Hypothesis>::ObjectPool(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[5] = a2;
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)a1);
  return a1;
}

void sub_2160EF6E8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *zhtok::ObjectPool<zhtok::Word>::ObjectPool(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[5] = a2;
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)a1);
  return a1;
}

void sub_2160EF738(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *zhtok::ObjectPool<zhtok::LatticeWord>::ObjectPool(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[5] = a2;
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)a1);
  return a1;
}

void sub_2160EF788(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *zhtok::ObjectPool<zhtok::HypothesisSet>::ObjectPool(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  a1[5] = a2;
  zhtok::ObjectPool<zhtok::Hypothesis>::reset((uint64_t)a1);
  return a1;
}

void sub_2160EF7D8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::default_delete<zhtok::LatticeSessionData::Sentinel>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v3 = a2[2];
    a2[2] = 0;
    if (v3) {
      MEMORY[0x2166C8C80](v3, 0x1020C40A95220FALL);
    }
    uint64_t v4 = a2[1];
    a2[1] = 0;
    if (v4) {
      MEMORY[0x2166C8C80](v4, 0x1060C40C2C571E4);
    }
    uint64_t v5 = *a2;
    *a2 = 0;
    if (v5) {
      MEMORY[0x2166C8C80](v5, 0x1000C40504FFAC1);
    }
    JUMPOUT(0x2166C8C80);
  }
}

uint64_t zhtok::ObjectPool<zhtok::Hypothesis>::~ObjectPool(uint64_t a1)
{
  uint64_t v2 = *(void ***)a1;
  if (*(void *)a1 < *(void *)(a1 + 8))
  {
    do
    {
      uint64_t v3 = *v2++;
      free(v3);
    }
    while ((unint64_t)v2 < *(void *)(a1 + 8));
    uint64_t v2 = *(void ***)a1;
  }
  if (v2)
  {
    *(void *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<zhtok::HypothesisSet *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

void zhtok::HypothesisLogger::printString(const __CFString *this, const __CFString *a2)
{
}

void sub_2160EF998(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    MEMORY[0x2166C8C60](a10, 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

unsigned char *zhtok::Hypothesis::init(unsigned char *__dst, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v5 = __dst;
  *((double *)__dst + 2) = a4;
  if (a3)
  {
    unsigned int v8 = *(unsigned __int8 *)(a3 + 8);
    uint64_t v6 = a3 + 8;
    uint64_t v7 = v8;
    *((void *)__dst + 3) = a2;
    *((void *)__dst + 4) = v6 + 16;
    if (v8 > 1uLL)
    {
      __dst = memcpy(__dst, (const void *)(v6 - 4 * (v7 - 1)), 4 * (v7 - 1));
      char v9 = 2;
    }
    else
    {
      __dst = memcpy(__dst, (const void *)(v6 - 4 * v7), 4 * v7);
      char v9 = v7 + 1;
    }
    v5[8] = v9;
    *((_DWORD *)v5 + 1) = *(_DWORD *)(a2 + 4);
  }
  else
  {
    *((void *)__dst + 3) = a2;
    *((void *)__dst + 4) = 0;
    *((_DWORD *)__dst + 1) = 1;
    __dst[8] = 1;
  }
  return __dst;
}

double zhtok::Hypothesis::costOfExtendingToWord(zhtok::Hypothesis *this, unsigned int a2, void *a3)
{
  LMLanguageModelConditionalProbability();
  return -v3;
}

CFStringRef zhtok::Hypothesis::createDescription(zhtok::Hypothesis *this)
{
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t)v9);
  std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)",", 1);
  std::ostream::operator<<();
  uint64_t v2 = *((void *)this + 2);
  std::stringbuf::str();
  if (v8 >= 0) {
    p_p = &__p;
  }
  else {
    p_p = __p;
  }
  CFStringRef v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, @"%p, cost = %f, history = %s", this, v2, p_p);
  if (v8 < 0) {
    operator delete(__p);
  }
  v9[0] = *MEMORY[0x263F8C2B8];
  uint64_t v5 = *(void *)(MEMORY[0x263F8C2B8] + 72);
  *(void *)((char *)v9 + *(void *)(v9[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8] + 64);
  v10[0] = v5;
  v10[1] = MEMORY[0x263F8C318] + 16;
  if (v11 < 0) {
    operator delete((void *)v10[9]);
  }
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2166C8C40](&v12);
  return v4;
}

void sub_2160EFC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream((uint64_t)&a19);
  _Unwind_Resume(a1);
}

void *zhtok::InstantLogPrinter::InstantLogPrinter(void *this, __sFILE *a2)
{
  *this = a2;
  return this;
}

uint64_t zhtok::InstantLogPrinter::print(FILE **this, const char *a2, va_list a3)
{
  return vfprintf(*this, a2, a3);
}

uint64_t zhtok::Logger::getLogger(zhtok::Logger *this)
{
  {
    operator new();
  }
  return zhtok::Logger::getLogger(void)::singleton;
}

void sub_2160EFD38(_Unwind_Exception *a1)
{
  MEMORY[0x2166C8C80](v1, 0x1020C40A15A3301);
  _Unwind_Resume(a1);
}

zhtok::Logger *zhtok::Logger::Logger(zhtok::Logger *this)
{
  *((void *)this + 1) = 0;
  uint64_t v2 = (uint64_t *)((char *)this + 8);
  *(unsigned char *)this = 0;
  uint64_t v3 = *MEMORY[0x263EF8348];
  *((void *)this + 2) = 0;
  *((void *)this + 3) = v3;
  CFStringRef v4 = getenv("DEBUG_PRINT_WORD");
  if (v4 && *v4 == 49)
  {
    uint64_t v5 = 2;
    uint64_t *v2 = 2;
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = getenv("DEBUG_PRINT_HYPOTHESES");
  if (v6 && *v6 == 49)
  {
    v5 |= 4uLL;
    uint64_t *v2 = v5;
  }
  uint64_t v7 = getenv("DEBUG_PRINT_BEST_BACKTRACE");
  if (v7 && *v7 == 49)
  {
    uint64_t *v2 = v5 | 0x10;
    goto LABEL_12;
  }
  if (v5)
  {
LABEL_12:
    *(unsigned char *)this = 1;
    operator new();
  }
  return this;
}

void sub_2160EFE80(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void *)(v1 + 16);
  *(void *)(v1 + 16) = 0;
  if (v3) {
    MEMORY[0x2166C8C80](v3, 0x20C4093837F09);
  }
  _Unwind_Resume(exception_object);
}

BOOL zhtok::Logger::isLoggingTypeEnabled(uint64_t a1, unsigned int a2)
{
  return *(unsigned char *)a1 && (*(void *)(a1 + 8) & a2) != 0;
}

uint64_t zhtok::Logger::isLoggingTypeEnabledForDebug()
{
  return 0;
}

BOOL zhtok::Logger::areLoggingTypesEnabled(zhtok::Logger *this, uint64_t a2, int a3)
{
  if (a3)
  {
    if (*(unsigned char *)this) {
      return (*((void *)this + 1) & a2) != 0;
    }
  }
  else if (*(unsigned char *)this)
  {
    return (a2 & ~*((void *)this + 1)) == 0;
  }
  return 0;
}

uint64_t zhtok::Logger::log(uint64_t result, unsigned int a2, char *a3, ...)
{
  va_start(va, a3);
  if (*(unsigned char *)result)
  {
    if ((*(void *)(result + 8) & a2) != 0) {
      return vfprintf(**(FILE ***)(result + 16), a3, va);
    }
  }
  return result;
}

uint64_t zhtok::Logger::log(uint64_t this, uint64_t a2, const char *a3, ...)
{
  va_start(va, a3);
  if (*(unsigned char *)this)
  {
    if ((*(void *)(this + 8) & a2) != 0) {
      return vfprintf(**(FILE ***)(this + 16), a3, va);
    }
  }
  return this;
}

uint64_t zhtok::Logger::flush(uint64_t this)
{
  uint64_t v1 = *(FILE ***)(this + 16);
  if (v1) {
    return fflush(*v1);
  }
  return this;
}

void zhtok::Logger::logErrorMessage(zhtok::Logger *this, const char *a2, ...)
{
  va_start(va, a2);
  uint64_t v4 = *MEMORY[0x263EF8340];
  vsprintf(cStr, a2, va);
  CFStringRef v2 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFLog();
  CFRelease(v2);
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

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
}

uint64_t CFLog()
{
  return MEMORY[0x270EE4AD8]();
}

void CFRelease(CFTypeRef cf)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
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

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

uint64_t LMLanguageModelConditionalProbability()
{
  return MEMORY[0x270F46AC8]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x270F46AE0]();
}

uint64_t LMLanguageModelIsAppleColorEmojiCharacter()
{
  return MEMORY[0x270F46B60]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x270F46B78]();
}

uint64_t LMLexiconCreate()
{
  return MEMORY[0x270F46BC0]();
}

uint64_t LMLexiconGetRootCursor()
{
  return MEMORY[0x270F46BF8]();
}

uint64_t LMLexiconRelease()
{
  return MEMORY[0x270F46C00]();
}

uint64_t LMLexiconResetCursors()
{
  return MEMORY[0x270F46C08]();
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

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987B0]();
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

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
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

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x270ED8730](a1, *(void *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

uint64_t ubrk_setUText()
{
  return MEMORY[0x270F99670]();
}

UText *__cdecl utext_close(UText *ut)
{
  return (UText *)MEMORY[0x270F999C8](ut);
}

UText *__cdecl utext_openUChars(UText *ut, const UChar *s, int64_t length, UErrorCode *status)
{
  return (UText *)MEMORY[0x270F999F0](ut, s, length, status);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA70](a1, a2, a3);
}