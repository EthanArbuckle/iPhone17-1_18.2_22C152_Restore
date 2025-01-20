void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_234533B2C(_Unwind_Exception *a1)
{
  v6 = v4;

  _Unwind_Resume(a1);
}

void sub_234533CC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_234533EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose((const void *)(v26 - 112), 8);
  _Block_object_dispose((const void *)(v26 - 80), 8);

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_2345341E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234534450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_2345346FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_2345347EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234534A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);

  _Unwind_Resume(a1);
}

void sub_234534C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234534CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234534F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<void *>::reset(const void **a1, const void *a2)
{
  v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void __clang_call_terminate(void *a1)
{
}

void *std::vector<float>::vector(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_2345350B8(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_264BEE848, MEMORY[0x263F8C060]);
}

void sub_2345351B0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_234535364(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_234535454(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234535508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23453571C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_2345359FC(_Unwind_Exception *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);

  nlp::CFScopedPtr<void *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void sub_234535BCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345371AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

void sub_234537500(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Block_object_dispose((const void *)(v34 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_234537F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_23453835C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234538584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
  nlp::CFScopedPtr<__CFData const*>::reset(&a9, 0);
  _Unwind_Resume(a1);
}

void sub_234538744(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25)
{
  _Block_object_dispose(&a18, 8);
  if (__p)
  {
    a25 = (uint64_t)__p;
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(__n128 *a1, __n128 *a2)
{
  a1[3].n128_u64[0] = 0;
  a1[3].n128_u64[1] = 0;
  a1[4].n128_u64[0] = 0;
  __n128 result = a2[3];
  a1[3] = result;
  a1[4].n128_u64[0] = a2[4].n128_u64[0];
  a2[3].n128_u64[0] = 0;
  a2[3].n128_u64[1] = 0;
  a2[4].n128_u64[0] = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
}

void std::vector<unsigned int>::reserve(std::vector<unsigned int> *this, std::vector<unsigned int>::size_type __n)
{
  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (char *)this->__end_ - (char *)this->__begin_;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)p_end_cap, __n);
    v7 = (unsigned int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v9 = (unsigned int *)&v6[4 * v8];
    std::vector<unsigned int>::pointer begin = this->__begin_;
    end = this->__end_;
    uint64_t v12 = v7;
    if (end != this->__begin_)
    {
      uint64_t v12 = v7;
      do
      {
        unsigned int v13 = *--end;
        *--uint64_t v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
    {
      operator delete(begin);
    }
  }
}

void sub_234538C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose((const void *)(v24 - 80), 8);

  _Unwind_Resume(a1);
}

void sub_234538E6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345390E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, const void *a13)
{
  __cxa_free_exception(v16);
  applesauce::CF::ArrayRef::~ArrayRef(&a13);

  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void sub_234539348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23453941C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2345397E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__51(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__52(uint64_t a1)
{
}

void sub_234539998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234539AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_234539BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_234539E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void ___ZL16tokenIDForStringPK10_LXLexiconPK10__CFString_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  int64_t v5 = (__CFString *)LXEntryCopyString();
  uint64_t TokenID = LXEntryGetTokenID();
  if (a3 && CFEqual(*(CFStringRef *)(a1 + 48), v5))
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = TokenID;
    *a3 = 1;
    if (!v5) {
      return;
    }
    goto LABEL_8;
  }
  v7 = [(__CFString *)v5 decomposedStringWithCanonicalMapping];
  uint64_t v8 = [*(id *)(a1 + 48) decomposedStringWithCanonicalMapping];
  uint64_t v9 = [v7 length];
  if (v9 == [v8 length])
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v11 = [NSNumber numberWithUnsignedInt:TokenID];
    [v10 addObject:v11];
  }
  if (v5) {
LABEL_8:
  }
    CFRelease(v5);
}

void sub_234539FEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);

  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFString const*>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

applesauce::CF::ArrayRef *applesauce::CF::ArrayRef::ArrayRef(applesauce::CF::ArrayRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFArrayGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x237DBF0E0](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_23453A0F0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<_LXLexicon const*>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void nlp::CFScopedPtr<__CFData const*>::reset(const void **a1, const void *a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void applesauce::CF::convert_to<std::vector<float>,0>(const void *a1@<X0>, uint64_t a2@<X8>)
{
  if (!a1 || (CFTypeID TypeID = CFArrayGetTypeID(), TypeID != CFGetTypeID(a1)))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  applesauce::CF::details::CFArray_get_value_to<std::vector<float>>((const __CFArray *)a1, a2);
}

void sub_23453A204()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_23453A224(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
}

void applesauce::CF::details::CFArray_get_value_to<std::vector<float>>(const __CFArray *a1@<X0>, uint64_t a2@<X8>)
{
  int Count = CFArrayGetCount(a1);
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 16) = 0;
  *(void *)a2 = 0;
  std::vector<float>::reserve((void **)a2, Count);
  if (Count >= 1)
  {
    for (CFIndex i = 0; i != Count; ++i)
    {
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, i);
      float v7 = applesauce::CF::convert_to<float,0>(ValueAtIndex);
      float v8 = v7;
      v10 = *(float **)(a2 + 8);
      unint64_t v9 = *(void *)(a2 + 16);
      if ((unint64_t)v10 >= v9)
      {
        uint64_t v12 = *(float **)a2;
        uint64_t v13 = ((uint64_t)v10 - *(void *)a2) >> 2;
        unint64_t v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 62) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v15 = v9 - (void)v12;
        if (v15 >> 1 > v14) {
          unint64_t v14 = v15 >> 1;
        }
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2 + 16, v16);
          uint64_t v12 = *(float **)a2;
          v10 = *(float **)(a2 + 8);
        }
        else
        {
          v17 = 0;
        }
        v18 = (float *)&v17[4 * v13];
        float *v18 = v8;
        v11 = v18 + 1;
        while (v10 != v12)
        {
          int v19 = *((_DWORD *)v10-- - 1);
          *((_DWORD *)v18-- - 1) = v19;
        }
        *(void *)a2 = v18;
        *(void *)(a2 + 8) = v11;
        *(void *)(a2 + 16) = &v17[4 * v16];
        if (v12) {
          operator delete(v12);
        }
      }
      else
      {
        float *v10 = v7;
        v11 = v10 + 1;
      }
      *(void *)(a2 + 8) = v11;
    }
  }
}

void sub_23453A38C(_Unwind_Exception *exception_object)
{
  CFTypeID v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<float>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      std::vector<float>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v3, a2);
    float v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    unint64_t v9 = &v6[4 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
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

float applesauce::CF::convert_to<float,0>(const __CFNumber *a1)
{
  uint64_t v1 = applesauce::CF::convert_as<float,0>(a1);
  if ((v1 & 0xFF00000000) == 0)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  return *(float *)&v1;
}

void sub_23453A498()
{
  __cxa_throw(v0, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
}

void sub_23453A4B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t applesauce::CF::convert_as<float,0>(const __CFNumber *a1)
{
  if (a1)
  {
    CFTypeID TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(a1)) {
      return applesauce::CF::details::number_convert_as<float>(a1);
    }
  }
  return applesauce::CF::details::treat_as_BOOL_for_convert_as<float>(a1);
}

uint64_t applesauce::CF::details::treat_as_BOOL_for_convert_as<float>(const __CFBoolean *a1)
{
  if (a1 && (CFTypeID TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    uint64_t v3 = COERCE_UNSIGNED_INT((float)CFBooleanGetValue(a1));
    uint64_t v4 = 0x100000000;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v3 = 0;
  }
  return v3 | v4;
}

uint64_t applesauce::CF::details::number_convert_as<float>(const __CFNumber *a1)
{
  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberSInt16Type;
      goto LABEL_12;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberSInt32Type;
      goto LABEL_15;
    case kCFNumberSInt64Type:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberSInt64Type;
      goto LABEL_23;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloat32Type;
      goto LABEL_19;
    case kCFNumberFloat64Type:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberFloat64Type;
      goto LABEL_25;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      CFNumberRef v2 = a1;
      CFNumberType v3 = kCFNumberCharType;
LABEL_10:
      int Value = CFNumberGetValue(v2, v3, &valuePtr);
      int v18 = SLOBYTE(valuePtr);
      goto LABEL_13;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      CFNumberRef v7 = a1;
      CFNumberType v8 = kCFNumberShortType;
LABEL_12:
      int Value = CFNumberGetValue(v7, v8, &valuePtr);
      int v18 = SLOWORD(valuePtr);
LABEL_13:
      float v19 = (float)v18;
      goto LABEL_26;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v9 = a1;
      CFNumberType v10 = kCFNumberIntType;
LABEL_15:
      int Value = CFNumberGetValue(v9, v10, &valuePtr);
      float v19 = (float)SLODWORD(valuePtr);
      goto LABEL_26;
    case kCFNumberLongType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberLongType;
      goto LABEL_23;
    case kCFNumberLongLongType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberLongLongType;
      goto LABEL_23;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      CFNumberRef v13 = a1;
      CFNumberType v14 = kCFNumberFloatType;
LABEL_19:
      int Value = CFNumberGetValue(v13, v14, &valuePtr);
      uint64_t v20 = LODWORD(valuePtr);
      goto LABEL_27;
    case kCFNumberDoubleType:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberDoubleType;
      goto LABEL_25;
    case kCFNumberCFIndexType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberCFIndexType;
      goto LABEL_23;
    case kCFNumberNSIntegerType:
      double valuePtr = 0.0;
      CFNumberRef v11 = a1;
      CFNumberType v12 = kCFNumberNSIntegerType;
LABEL_23:
      int Value = CFNumberGetValue(v11, v12, &valuePtr);
      float v19 = (float)*(uint64_t *)&valuePtr;
      goto LABEL_26;
    case kCFNumberCGFloatType:
      double valuePtr = 0.0;
      CFNumberRef v15 = a1;
      CFNumberType v16 = kCFNumberCGFloatType;
LABEL_25:
      int Value = CFNumberGetValue(v15, v16, &valuePtr);
      float v19 = valuePtr;
LABEL_26:
      uint64_t v20 = LODWORD(v19);
LABEL_27:
      uint64_t v6 = v20 | 0x100000000;
      if (!Value) {
        uint64_t v6 = 0;
      }
      int v4 = v6 & 0xFFFFFF00;
      uint64_t v5 = v6 & 0x100000000;
      break;
    default:
      int v4 = 0;
      uint64_t v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

id trainMLPModelForDES(void *a1, void *a2, void *a3, void *a4)
{
  v122[1] = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  CFNumberRef v9 = [v7 attachments];
  CFNumberType v10 = +[NLPLearnerUtils getAttachmentURLByName:@"nlmodel" attachments:v9 error:a4];

  if (!v10)
  {
    CFNumberType v16 = 0;
    goto LABEL_83;
  }
  CFNumberRef v11 = [v7 recipeUserInfo];
  CFNumberType v12 = [v11 objectForKey:@"iCloudAggServiceKey"];

  if (!v12)
  {
    if ([v7 pluginShouldAddNoiseAndEncryptResult])
    {
      v17 = [v7 recipeUserInfo];
      int v18 = [v17 objectForKey:@"noEncryption"];

      if (!v18)
      {
        if (a4)
        {
          CFNumberType v14 = (void *)MEMORY[0x263F087E8];
          CFNumberRef v15 = &unk_26E74D760;
          goto LABEL_39;
        }
LABEL_40:
        CFNumberType v16 = 0;
        goto LABEL_82;
      }
    }
    CFNumberRef v13 = 0;
LABEL_10:
    float v19 = (void *)MEMORY[0x263EFF960];
    uint64_t v20 = [v7 recipeUserInfo];
    v21 = [v20 objectForKey:@"locales"];
    v22 = [v19 localeWithLocaleIdentifier:v21];

    if (!v22)
    {
      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:1 userInfo:&unk_26E74D788];
        CFNumberType v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CFNumberType v16 = 0;
      }
      goto LABEL_81;
    }
    v113 = a3;
    v120 = v22;
    v23 = [v7 recipeUserInfo];
    uint64_t v24 = [v23 objectForKey:@"task"];
    int64_t v25 = +[NLPLearnerTaskWrapper taskFromRecipe:v24];

    uint64_t v26 = +[NLPLearnerTextData dataForPFL:v25 andLocale:v22];
    v27 = (void *)v26;
    switch(v25)
    {
      case 1:
        v119 = v12;
        v28 = (void *)v26;
        v29 = [v7 attachments];
        v30 = @"emojiClasses.plist";
        break;
      case 3:
        v119 = v12;
        v116 = v13;
        [v7 attachments];
        v117 = v10;
        id v33 = v8;
        v31 = uint64_t v34 = v27;
        v32 = [v31 firstObject];
        v35 = [v32 URLByDeletingLastPathComponent];
        v36 = [v35 path];
        v28 = v34;
        v37 = v34;
        id v8 = v33;
        CFNumberType v10 = v117;
        [v37 addResource:v36];

        goto LABEL_21;
      case 2:
        v119 = v12;
        v28 = (void *)v26;
        v29 = [v7 attachments];
        v30 = @"montrealidmap.dat";
        break;
      default:
        if (a4)
        {
          [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:6 userInfo:&unk_26E74D7B0];
          CFNumberType v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          CFNumberType v16 = 0;
        }
        goto LABEL_80;
    }
    v31 = +[NLPLearnerUtils getAttachmentURLByName:v30 attachments:v29 error:a4];

    if (!v31)
    {
      CFNumberType v16 = 0;
      v27 = v28;
      CFNumberType v12 = v119;
LABEL_80:

LABEL_81:
      goto LABEL_82;
    }
    v116 = v13;
    v32 = [v31 path];
    [v28 addResource:v32];
LABEL_21:

    v38 = [v7 recipeUserInfo];
    v39 = [v38 objectForKey:@"maxSeqLength"];
    int v40 = [v39 intValue];

    BOOL v41 = v40 < 1;
    v27 = v28;
    if (!v41)
    {
      v42 = [v7 recipeUserInfo];
      v43 = [v42 objectForKey:@"maxSeqLength"];
      objc_msgSend(v28, "setMaxSequenceLength:", (int)objc_msgSend(v43, "intValue"));
    }
    v44 = [v8 coreDuetEvents];
    [v28 loadFromCoreDuet:v44 limitSamplesTo:0];

    v45 = [v7 recipeUserInfo];
    uint64_t v46 = [v45 objectForKey:@"numberOfEpochs"];
    v47 = (void *)v46;
    v48 = &unk_26E74D708;
    if (v46) {
      v48 = (void *)v46;
    }
    id v118 = v48;

    v49 = [v7 recipeUserInfo];
    v111 = [v49 objectForKey:@"noSDP"];

    v50 = [QuickTypePFLTrainerMLP alloc];
    v51 = +[NLPLearnerTaskWrapper privacyIdentifierForTask:v25];
    v52 = [(QuickTypePFLTrainerMLP *)v50 initWithSeedModelPath:v10 andPrivacyIdentifier:v51];

    v53 = [v7 recipeUserInfo];
    v54 = [v53 objectForKey:@"batchSize"];

    CFNumberType v12 = v119;
    if (v54) {
      -[QuickTypePFLTrainerMLP setBatchSize:](v52, "setBatchSize:", [v54 unsignedIntegerValue]);
    }
    v115 = v54;
    v55 = [v7 recipeUserInfo];
    uint64_t v56 = [v55 objectForKey:@"minTrainingSamples"];
    v57 = (void *)v56;
    v58 = &unk_26E74D720;
    if (v56) {
      v58 = (void *)v56;
    }
    id v59 = v58;

    unint64_t v60 = [v27 numSamples];
    id v114 = v59;
    if (v60 < (int)[v59 intValue]
      || (unint64_t v61 = [v27 numSamples], v61 < -[QuickTypePFLTrainerMLP batchSize](v52, "batchSize")))
    {
      CFNumberRef v13 = v116;
      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:2 userInfo:&unk_26E74D7D8];
        CFNumberType v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CFNumberType v16 = 0;
      }
      v22 = v120;
      v62 = v114;
      goto LABEL_79;
    }
    v63 = [v7 recipeUserInfo];
    uint64_t v64 = [v63 objectForKey:@"learningRate"];

    if (v64) {
      [(QuickTypePFLTrainerMLP *)v52 setLearningRate:v64];
    }
    v110 = (void *)v64;
    v65 = [v7 recipeUserInfo];
    v66 = [v65 objectForKey:@"gradientClipMin"];
    [(QuickTypePFLTrainerMLP *)v52 setGradientClipMin:v66];

    v67 = [v7 recipeUserInfo];
    v68 = [v67 objectForKey:@"gradientClipMax"];
    [(QuickTypePFLTrainerMLP *)v52 setGradientClipMax:v68];

    v69 = [v7 recipeUserInfo];
    uint64_t v70 = [v69 objectForKey:@"maxNorm"];

    if (v70) {
      [(QuickTypePFLTrainerMLP *)v52 setClippingNorm:v70];
    }
    v109 = (void *)v70;
    v71 = [v7 recipeUserInfo];
    v72 = [v71 objectForKey:@"normBinCount"];

    if (v72) {
      uint64_t v73 = -[QuickTypePFLTrainerMLP setNormBinCount:](v52, "setNormBinCount:", [v72 unsignedIntegerValue]);
    }
    v108 = v72;
    v74 = (void *)MEMORY[0x237DBF310](v73);
    BOOL v75 = -[QuickTypePFLTrainerMLP trainOn:forNEpochs:](v52, "trainOn:forNEpochs:", v27, [v118 unsignedIntegerValue]);
    if (!v75)
    {
      if (a4)
      {
        [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:4 userInfo:&unk_26E74D800];
        CFNumberType v16 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        CFNumberType v16 = 0;
      }
      CFNumberRef v13 = v116;
      v22 = v120;
      v62 = v114;
LABEL_78:

LABEL_79:
      goto LABEL_80;
    }
    id v76 = v8;
    v77 = v27;
    v78 = [v7 recipeUserInfo];
    uint64_t v79 = [v78 objectForKey:@"storeUpdatedModel"];
    if (v79)
    {
      v80 = (void *)v79;
      BOOL v81 = +[NLPLearnerUtils isInternalInstall];

      if (!v81)
      {
LABEL_54:
        v85 = (void *)MEMORY[0x237DBF310]();
        v86 = [(QuickTypePFLTrainerMLP *)v52 getWeightUpdatesAddNoise:v111 == 0 encryptionKey:v116 recipe:v7];
        v112 = v86;
        if (v86)
        {
          void *v113 = [v86 weightUpdates];
          v121 = @"NumberOfTrainingSamples";
          v27 = v77;
          v87 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v77, "numSamples"));
          v122[0] = v87;
          v88 = [NSDictionary dictionaryWithObjects:v122 forKeys:&v121 count:1];
          CFNumberType v16 = (void *)[v88 mutableCopy];

          uint64_t v89 = [(QuickTypePFLTrainerMLP *)v52 initialLoss];
          if (v89)
          {
            v90 = (void *)v89;
            v91 = [(QuickTypePFLTrainerMLP *)v52 initialLoss];
            [v91 floatValue];
            float v93 = fabsf(v92);

            if (v93 != INFINITY)
            {
              v94 = [(QuickTypePFLTrainerMLP *)v52 initialLoss];
              [v16 setObject:v94 forKeyedSubscript:@"InitialLoss"];
            }
          }
          uint64_t v95 = [(QuickTypePFLTrainerMLP *)v52 trainingLoss];
          id v8 = v76;
          v62 = v114;
          if (v95)
          {
            v96 = (void *)v95;
            v97 = [(QuickTypePFLTrainerMLP *)v52 trainingLoss];
            [v97 floatValue];
            float v99 = fabsf(v98);

            if (v99 != INFINITY)
            {
              v100 = [(QuickTypePFLTrainerMLP *)v52 trainingLoss];
              [v16 setObject:v100 forKeyedSubscript:@"TrainingLoss"];
            }
          }
          v101 = [v112 privacyDiagnosticReport];

          CFNumberType v12 = v119;
          if (v101)
          {
            v102 = [v112 privacyDiagnosticReport];
            [v16 setObject:v102 forKeyedSubscript:@"localPrivacyParameters"];
          }
          v103 = [v112 weightUpdatesDiagnosticReport];

          CFNumberRef v13 = v116;
          if (v103)
          {
            v104 = [v112 weightUpdatesDiagnosticReport];
            [v16 setObject:v104 forKeyedSubscript:@"$local_only.QuickTypeModelUpdate"];
          }
          if (+[NLPLearnerUtils isInternalInstall])
          {
            v105 = [v112 l2Norm];
            [v16 setObject:v105 forKeyedSubscript:@"L2Norm"];

            v106 = [v112 maxNorm];
            [v16 setObject:v106 forKeyedSubscript:@"MaxNorm"];
          }
          v22 = v120;
        }
        else
        {
          v27 = v77;
          if (a4)
          {
            [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:5 userInfo:&unk_26E74D828];
            CFNumberType v16 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            CFNumberType v16 = 0;
          }
          CFNumberRef v13 = v116;
          id v8 = v76;
          CFNumberType v12 = v119;
          v22 = v120;
          v62 = v114;
        }

        goto LABEL_78;
      }
      v82 = NSURL;
      v78 = [v7 recipeUserInfo];
      v83 = [v78 objectForKey:@"storeUpdatedModel"];
      v84 = [v82 URLWithString:v83];
      [(QuickTypePFLTrainerMLP *)v52 writeModelToURL:v84];
    }
    goto LABEL_54;
  }
  CFNumberRef v13 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v12 options:1];
  if (v13) {
    goto LABEL_10;
  }
  if (!a4) {
    goto LABEL_40;
  }
  CFNumberType v14 = (void *)MEMORY[0x263F087E8];
  CFNumberRef v15 = &unk_26E74D738;
LABEL_39:
  [v14 errorWithDomain:@"com.apple.QuickTypeDESPlugin" code:5 userInfo:v15];
  CFNumberType v16 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_82:

LABEL_83:
  return v16;
}

void sub_23453B644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void sub_23453B8A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23453BA28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_23453BF9C(_Unwind_Exception *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va1, a14);
  va_start(va, a14);
  CFNumberType v16 = va_arg(va1, const void *);
  nlp::CFScopedPtr<MLPModelTrainer *>::reset((const void **)va, 0);
  nlp::CFScopedPtr<void *>::reset((const void **)va1, 0);

  _Unwind_Resume(a1);
}

void sub_23453C848(_Unwind_Exception *a1, void *a2, void *a3, void *a4, void *a5, uint64_t a6, ...)
{
  va_start(va2, a6);
  va_start(va1, a6);
  va_start(va, a6);
  CFNumberRef v9 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFNumberRef v11 = va_arg(va2, const void *);

  nlp::CFScopedPtr<__CFData *>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFData const*>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<void *>::reset((const void **)va2, 0);

  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFData *>::reset(const void **a1, const void *a2)
{
  int v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void sub_23453CAE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFArray const*>::reset(const void **a1, const void *a2)
{
  int v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void nlp::CFScopedPtr<MLPModelTrainer *>::reset(const void **a1, const void *a2)
{
  int v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_23453DA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id supportedMetrics()
{
  if (supportedMetrics_onceToken != -1) {
    dispatch_once(&supportedMetrics_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)supportedMetrics_supportedMetrics;
  return v0;
}

void sub_23453F278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4nlp::CFScopedPtr<__CFArray const*>::reset(&a9, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4nlp::CFScopedPtr<__CFArray const*>::reset(&a9, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void __supportedMetrics_block_invoke()
{
  v0 = (void *)supportedMetrics_supportedMetrics;
  supportedMetrics_supportedMetrics = (uint64_t)&unk_26E74D878;
}

void __overrideWordErrorCountForMetrics_block_invoke()
{
  v0 = (void *)overrideWordErrorCountForMetrics_overrideWordErrorCountForMetrics;
  overrideWordErrorCountForMetrics_overrideWordErrorCountForMetrics = (uint64_t)&unk_26E74D890;
}

void __reporterKeysToKeep_block_invoke()
{
  v4[5] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F7EC28];
  v4[0] = *MEMORY[0x263F7EC20];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F7EC38];
  v4[2] = *MEMORY[0x263F7EC30];
  v4[3] = v1;
  v4[4] = *MEMORY[0x263F7EC40];
  uint64_t v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:5];
  CFNumberType v3 = (void *)reporterKeysToKeep_keysForCASchema;
  reporterKeysToKeep_keysForCASchema = v2;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x270F18C60]();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x270EE4348]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E8](allocator, capacity, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x270EE4C50](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

uint64_t CoreLMCopyConditionalProbabilities()
{
  return MEMORY[0x270F1A7E0]();
}

uint64_t CoreLMCopyPredictions()
{
  return MEMORY[0x270F1A7E8]();
}

uint64_t CoreLMCopyTokenIdsForText()
{
  return MEMORY[0x270F1A7F0]();
}

uint64_t CoreLMCreate()
{
  return MEMORY[0x270F1A7F8]();
}

uint64_t CoreLMGetSpecialTokenId()
{
  return MEMORY[0x270F1A800]();
}

uint64_t CoreLMReset()
{
  return MEMORY[0x270F1A808]();
}

uint64_t CoreLMUpdateWithContext()
{
  return MEMORY[0x270F1A810]();
}

uint64_t INTypedInteractionWithInteraction()
{
  return MEMORY[0x270EF52C8]();
}

uint64_t LMCreateMontrealIDsFromLMTokenIDSequence()
{
  return MEMORY[0x270F46A98]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x270F46AE0]();
}

uint64_t LMLanguageModelCreatePredictionEnumerator()
{
  return MEMORY[0x270F46AE8]();
}

uint64_t LMPredictionEnumeratorAdvance()
{
  return MEMORY[0x270F46C10]();
}

uint64_t LMPredictionEnumeratorGetPrediction()
{
  return MEMORY[0x270F46C18]();
}

uint64_t LMPredictionEnumeratorRelease()
{
  return MEMORY[0x270F46C20]();
}

uint64_t LMStreamTokenizerCreate()
{
  return MEMORY[0x270F46C28]();
}

uint64_t LMStreamTokenizerPushBytes()
{
  return MEMORY[0x270F46C30]();
}

uint64_t LMStreamTokenizerRelease()
{
  return MEMORY[0x270F46C38]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x270F46EF0]();
}

uint64_t LXEntryGetTokenID()
{
  return MEMORY[0x270F46F08]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x270F46F50]();
}

uint64_t LXLexiconEnumerateEntriesForString()
{
  return MEMORY[0x270F46F70]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MLPModelTrainerCreateWithModel()
{
  return MEMORY[0x270F4C448]();
}

uint64_t MLPModelTrainerEvaluateModel()
{
  return MEMORY[0x270F4C450]();
}

uint64_t MLPModelTrainerTrainModel()
{
  return MEMORY[0x270F4C458]();
}

uint64_t MRLNeuralNetworkCopyEvaluationResults()
{
  return MEMORY[0x270F4C468]();
}

uint64_t MRLNeuralNetworkCreate()
{
  return MEMORY[0x270F4C470]();
}

uint64_t MRLNeuralNetworkGetOutput()
{
  return MEMORY[0x270F4C478]();
}

uint64_t MRLNeuralNetworkGetOutputDimension()
{
  return MEMORY[0x270F4C480]();
}

uint64_t MRLNeuralNetworkPredict()
{
  return MEMORY[0x270F4C488]();
}

uint64_t MRLNeuralNetworkSetInput()
{
  return MEMORY[0x270F4C490]();
}

uint64_t NLModelContainerCopySplitContainerData()
{
  return MEMORY[0x270F1A828]();
}

uint64_t NLModelContainerCreateWithContentsOfURL()
{
  return MEMORY[0x270F1A830]();
}

uint64_t NLModelContainerWriteToURL()
{
  return MEMORY[0x270F1A838]();
}

uint64_t NLStringEmbeddingCreateWithOptions()
{
  return MEMORY[0x270F1A840]();
}

uint64_t NLStringEmbeddingFillWordVectors()
{
  return MEMORY[0x270F1A848]();
}

uint64_t NLStringEmbeddingGetDimension()
{
  return MEMORY[0x270F1A850]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
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

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

long double exp(long double __x)
{
  MEMORY[0x270ED9858](__x);
  return result;
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

float logf(float a1)
{
  MEMORY[0x270EDA0F8](a1);
  return result;
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}