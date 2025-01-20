uint64_t _TTSSystemFocusedPid()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v0 = (void *)getAXSpringBoardServerClass_softClass;
  v10 = getAXSpringBoardServerClass_softClass;
  if (!getAXSpringBoardServerClass_softClass)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __getAXSpringBoardServerClass_block_invoke;
    v6[3] = &unk_2645B3618;
    v6[4] = &v7;
    __getAXSpringBoardServerClass_block_invoke((uint64_t)v6);
    v0 = (void *)v8[3];
  }
  v1 = v0;
  _Block_object_dispose(&v7, 8);
  v2 = [v1 server];
  v3 = [v2 focusedAppPID];
  v4 = [v3 intValue];

  return v4;
}

void sub_22149D8D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSpringBoardServerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __AccessibilityUtilitiesLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2645B3638;
    uint64_t v6 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
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
    Class result = objc_getClass("AXSpringBoardServer");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    __getAXSpringBoardServerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getAXSpringBoardServerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __AccessibilityUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  AccessibilityUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_22149DC24(_Unwind_Exception *a1)
{
  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_22149DE2C(_Unwind_Exception *a1)
{
  v4 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v4;
    operator delete(v4);
  }
  _Unwind_Resume(a1);
}

void sub_22149E414(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a2)
  {

    __cxa_begin_catch(exception_object);
    v32 = AXTTSLogCommon();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[TTSSiriSynthWrapper initWithVoicePath:language:censorPlainText:delegate:feResourcePath:](v32);
    }

    v33 = (TTSSynthesizer *)[v28 synthesizer];
    if (v33)
    {
      TTSSynthesizer::~TTSSynthesizer(v33);
      MEMORY[0x223C81C40]();
    }
    [v28 setSynthesizer:0];
    __cxa_end_catch();
    JUMPOUT(0x22149E3BCLL);
  }
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
}

void sub_22149E618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)TTSSiriSynthWrapper;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22149E6D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  _Unwind_Resume(a1);
}

void sub_22149E78C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22149E9EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,char *a22,uint64_t a23,uint64_t a24,char a25)
{
  *(void *)(v26 - 96) = &a22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v26 - 96));
  a22 = &a25;
  std::vector<TTSSynthesizer::SpeakingStyle>::__destroy_vector::operator()[abi:ne180100]((void ***)&a22);
  _Unwind_Resume(a1);
}

void sub_22149EAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22149EC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_22149ED90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_22149EE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22149EF50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22149F188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, const std::logic_error a9, char a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22)
{
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](&a22);
  if (a2 == 1)
  {
    exception_ptr = __cxa_get_exception_ptr(a1);
    MEMORY[0x223C81BC0](&a9, exception_ptr);
    __cxa_begin_catch(a1);
    v28 = AXTTSLogCommon();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      __40__TTSSiriSynthWrapper_synthesizeString___block_invoke_cold_1(&a9, v28);
    }

    [*(id *)(v23 + 32) setSynthesizing:0];
    v29 = [*(id *)(v23 + 32) delegate];
    [v29 siriDidEndSynthesis:*(void *)(v23 + 32) successfully:0];

    MEMORY[0x223C81BE0](&a9);
    __cxa_end_catch();
    JUMPOUT(0x22149F114);
  }
  std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100]((void *)(v24 - 72));
  *(void *)(v24 - 72) = &a10;
  std::vector<TTSSynthesizer::Marker>::__destroy_vector::operator()[abi:ne180100]((void ***)(v24 - 72));
  if (__p)
  {
    a14 = (uint64_t)__p;
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }

  _Unwind_Resume(a1);
}

void sub_22149F378(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22149F43C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_22149F768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  _Unwind_Resume(a1);
}

void sub_22149F9C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22149FB18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_2645B35C8, MEMORY[0x263F8C060]);
}

void sub_22149FD68(_Unwind_Exception *a1)
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

void *std::allocator<float>::allocate_at_least[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
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

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  size_t v5 = this;
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
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    size_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void *std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    std::string::size_type v6 = result;
    uint64_t result = std::vector<float>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22149FFE8(_Unwind_Exception *exception_object)
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
  uint64_t result = (char *)std::allocator<float>::allocate_at_least[abi:ne180100]((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    v3 = **a1;
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

void std::vector<TTSSynthesizer::SpeakingStyle>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    size_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 72;
        std::__destroy_at[abi:ne180100]<TTSSynthesizer::SpeakingStyle,0>(v4);
      }
      while ((void *)v4 != v2);
      size_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<TTSSynthesizer::SpeakingStyle,0>(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    v3 = *(void **)a1;
    operator delete(v3);
  }
}

void std::vector<TTSSynthesizer::Marker>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100]((uint64_t *)v2);
    v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 56)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  a1[1] = v2;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      std::string::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    uint64_t v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    uint64_t v7 = this;
    if (__n > 0x16)
    {
      std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      unint64_t v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0) {
    this->__r_.__value_.__l.__size_ = __n;
  }
  else {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  }
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

uint64_t _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEED1Ev(uint64_t a1)
{
  return a1;
}

void _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEED0Ev(uint64_t a1)
{
  JUMPOUT(0x223C81C40);
}

void *_ZNKSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE7__cloneEv(uint64_t a1)
{
  uint64_t v2 = operator new(0x28uLL);
  void *v2 = &unk_26D386E38;
  v2[1] = *(id *)(a1 + 8);
  *((_OWORD *)v2 + 1) = *(_OWORD *)(a1 + 16);
  v2[4] = *(void *)(a1 + 32);
  return v2;
}

__n128 _ZNKSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE7__cloneEPNS0_6__baseIS7_EE(uint64_t a1, __n128 *a2)
{
  a2->n128_u64[0] = (unint64_t)&unk_26D386E38;
  a2->n128_u64[1] = (unint64_t)*(id *)(a1 + 8);
  unint64_t v4 = *(void *)(a1 + 32);
  __n128 result = *(__n128 *)(a1 + 16);
  a2[1] = result;
  a2[2].n128_u64[0] = v4;
  return result;
}

void _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE7destroyEv(uint64_t a1)
{
}

void _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE18destroy_deallocateEv(id *a1)
{
  operator delete(a1);
}

uint64_t _ZNSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEEclEOS6_(uint64_t a1, _DWORD *a2, __n128 a3)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  switch(*a2)
  {
    case 0:
      size_t v5 = [*(id *)(a1 + 8) delegate];
      [v5 siriDidStartSynthesis:*(void *)(a1 + 8)];
      goto LABEL_12;
    case 1:
      uint64_t v24 = (id *)(a1 + 8);
      [*(id *)(a1 + 8) setSynthesizing:0];
      size_t v5 = [*v24 delegate];
      [v5 siriDidEndSynthesis:*v24 successfully:1];
LABEL_12:

      return 0;
    case 4:
      unint64_t v6 = *(uint64_t **)(a1 + 16);
      uint64_t v7 = *v6;
      uint64_t v8 = v6[1];
      if (v7 == v8) {
        return 0;
      }
      unint64_t v9 = v8 - v7;
      v77[0] = 1;
      v77[2] = 1;
      v77[3] = v8 - v7;
      uint64_t v78 = v7;
      id v10 = objc_alloc(MEMORY[0x263EF93A8]);
      v11 = [*(id *)(a1 + 8) engineFormat];
      v12 = (void *)[v10 initWithPCMFormat:v11 bufferListNoCopy:v77 deallocator:&__block_literal_global_222];

      id v13 = objc_alloc(MEMORY[0x263EF93A8]);
      v14 = [*(id *)(a1 + 8) outputFormat];
      v15 = (void *)[v13 initWithPCMFormat:v14 frameCapacity:v9 >> 1];

      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      char v80 = 0;
      v16 = [*(id *)(a1 + 8) bufferConverter];
      v75 = buf;
      id v76 = 0;
      __p = (void *)MEMORY[0x263EF8330];
      unint64_t v72 = 3221225472;
      v73[0] = ___ZZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_ENK3__0clEN14TTSSynthesizer15CallbackMessageE_block_invoke_2;
      v73[1] = &unk_2645B3750;
      id v17 = v12;
      id v74 = v17;
      [v16 convertToBuffer:v15 error:&v76 withInputFromBlock:&__p];
      id v18 = v76;

      v19 = [*(id *)(a1 + 8) delegate];
      [v19 siri:*(void *)(a1 + 8) didGenerateBuffer:v15];

      v20 = *(void ***)(a1 + 16);
      v22 = (char *)*v20;
      v21 = (char *)v20[1];
      if (((v21 - *v20) & 1) == 0) {
        goto LABEL_9;
      }
      uint64_t v23 = v21 - 1;
      if (v22 != v21 - 1)
      {
        if (v21 != v23) {
          memmove(*v20, v23, 1uLL);
        }
        ++v22;
LABEL_9:
        v20[1] = v22;
      }

      _Block_object_dispose(buf, 8);
      return 0;
    case 5:
      __p = 0;
      unint64_t v72 = 0;
      v73[0] = 0;
      v25 = *(uint64_t **)(a1 + 24);
      uint64_t v26 = *v25;
      uint64_t v27 = v25[1];
      if (*v25 == v27) {
        goto LABEL_92;
      }
      uint64_t v28 = MEMORY[0x263EF8318];
      unint64_t v29 = 0x263F08000uLL;
      a3.n128_u64[0] = 138412546;
      __n128 v70 = a3;
      break;
    default:
      return 0;
  }
  do
  {
    if (*(_DWORD *)v26 == 1)
    {
      int v33 = *(char *)(v26 + 55);
      if (v33 >= 0) {
        v34 = (unsigned __int8 *)(v26 + 32);
      }
      else {
        v34 = *(unsigned __int8 **)(v26 + 32);
      }
      if (v33 >= 0) {
        uint64_t v35 = *(unsigned __int8 *)(v26 + 55);
      }
      else {
        uint64_t v35 = *(void *)(v26 + 40);
      }
      if (v35 < 1)
      {
        unsigned int v39 = 0;
LABEL_31:
        char v40 = 1;
        goto LABEL_72;
      }
      v36 = &v34[v35];
      v37 = v34 + 1;
      if (v35 != 1)
      {
        unsigned int v38 = *v34;
        if (v38 != 48)
        {
LABEL_35:
          if (v38 != 36)
          {
            if ((v38 & 0x80) == 0 && (*(_DWORD *)(v28 + 4 * v38 + 60) & 0x400) != 0)
            {
              unsigned int v39 = 0;
              while (1)
              {
                unsigned int v54 = (char)*v34;
                if ((v54 & 0x80000000) != 0 || (*(_DWORD *)(v28 + 4 * v54 + 60) & 0x400) == 0) {
                  goto LABEL_70;
                }
                unsigned int v39 = v54 + 10 * v39 - 48;
                ++v34;
                char v40 = 1;
                if (v34 >= v36) {
                  goto LABEL_71;
                }
              }
            }
            if (v38 == 39 || v38 == 34)
            {
              if ((unint64_t)v35 < 2)
              {
LABEL_58:
                unsigned int v39 = 0;
                goto LABEL_70;
              }
              unsigned int v39 = 0;
              v46 = v34 + 2;
              while (1)
              {
                int v47 = *(v46 - 1);
                if (v38 == v47) {
                  break;
                }
                unsigned int v39 = v47 | (v39 << 8);
                char v40 = 1;
                if (v46 < v36)
                {
                  ++v46;
                  if (!HIBYTE(v39)) {
                    continue;
                  }
                }
                goto LABEL_71;
              }
            }
            else
            {
              unsigned int v39 = (v38 << 24) | (v34[1] << 16) | (v34[2] << 8) | v34[3];
            }
LABEL_70:
            char v40 = 1;
LABEL_71:
            unint64_t v29 = 0x263F08000;
            goto LABEL_72;
          }
LABEL_36:
          if (v37 < v36)
          {
            unsigned int v39 = 0;
            int64_t v41 = &v34[v35] - v37;
            unint64_t v29 = 0x263F08000;
            do
            {
              unsigned int v42 = (char)*v37;
              if ((v42 & 0x80000000) != 0) {
                break;
              }
              int v43 = *(_DWORD *)(v28 + 4 * v42 + 60);
              if ((v43 & 0x10000) == 0) {
                break;
              }
              int v44 = (v43 & 0x1000) != 0 ? -87 : -55;
              int v45 = (v43 & 0x400) != 0 ? -48 : v44;
              unsigned int v39 = v42 + 16 * v39 + v45;
              ++v37;
              --v41;
            }
            while (v41);
            goto LABEL_31;
          }
          goto LABEL_58;
        }
        if (__toupper((char)*v37) == 88)
        {
          v37 = v34 + 2;
          goto LABEL_36;
        }
      }
      unsigned int v38 = *v34;
      goto LABEL_35;
    }
    if (*(_DWORD *)v26) {
      goto LABEL_89;
    }
    uint64_t v30 = *(void *)(v26 + 16);
    if (!v30) {
      goto LABEL_60;
    }
    unint64_t v31 = *(void *)(v26 + 8) + v30;
    uint64_t v32 = *(void *)(a1 + 32);
    if (*(char *)(v32 + 23) < 0)
    {
      if (v31 > *(void *)(v32 + 8)) {
        goto LABEL_60;
      }
LABEL_63:
      uint64_t v49 = objc_msgSend(MEMORY[0x263F7EEF0], "utf16RangeFromUTF8Range:chars:size:", *(_OWORD *)&v70);
      uint64_t v51 = v50;
      v52 = [*(id *)(a1 + 8) processedSpeechString];
      unsigned int v39 = objc_msgSend(v52, "translateRangeInTransformedString:", v49, v51);
      __int16 v3 = v53;

      char v40 = 0;
LABEL_72:
      uint64_t v55 = *(void *)(v26 + 24);
      unint64_t v56 = v72;
      if (v72 >= v73[0])
      {
        v58 = __p;
        uint64_t v59 = (uint64_t)(v72 - (void)__p) >> 4;
        unint64_t v60 = v59 + 1;
        if ((unint64_t)(v59 + 1) >> 60) {
          std::vector<float>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v61 = v73[0] - (void)__p;
        if ((uint64_t)(v73[0] - (void)__p) >> 3 > v60) {
          unint64_t v60 = v61 >> 3;
        }
        if ((unint64_t)v61 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v62 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v62 = v60;
        }
        if (v62)
        {
          v63 = (char *)std::allocator<SiriTTSMarker>::allocate_at_least[abi:ne180100]((uint64_t)v73, v62);
          v58 = __p;
          unint64_t v56 = v72;
          unint64_t v29 = 0x263F08000;
        }
        else
        {
          v63 = 0;
        }
        v64 = &v63[16 * v59];
        char *v64 = v40;
        v64[1] = 0;
        *((_WORD *)v64 + 1) = v3;
        *((_DWORD *)v64 + 1) = v39;
        *((void *)v64 + 1) = v55;
        v65 = v64;
        if ((void *)v56 != v58)
        {
          do
          {
            *((_OWORD *)v65 - 1) = *(_OWORD *)(v56 - 16);
            v65 -= 16;
            v56 -= 16;
          }
          while ((void *)v56 != v58);
          v58 = __p;
        }
        unint64_t v57 = (unint64_t)(v64 + 16);
        __p = v65;
        unint64_t v72 = (unint64_t)(v64 + 16);
        v73[0] = &v63[16 * v62];
        if (v58) {
          operator delete(v58);
        }
      }
      else
      {
        *(unsigned char *)unint64_t v72 = v40;
        *(unsigned char *)(v56 + 1) = 0;
        *(_WORD *)(v56 + 2) = v3;
        *(_DWORD *)(v56 + 4) = v39;
        unint64_t v57 = v56 + 16;
        *(void *)(v56 + 8) = v55;
      }
      unint64_t v72 = v57;
      goto LABEL_89;
    }
    if (v31 <= *(unsigned __int8 *)(v32 + 23)) {
      goto LABEL_63;
    }
LABEL_60:
    v48 = AXTTSLogCommon();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v66 = [*(id *)(v29 + 2584) numberWithUnsignedLong:*(void *)(v26 + 8)];
      v67 = [*(id *)(v29 + 2584) numberWithUnsignedLong:*(void *)(v26 + 16)];
      *(_DWORD *)buf = v70.n128_u32[0];
      *(void *)&buf[4] = v66;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v67;
      _os_log_error_impl(&dword_22149B000, v48, OS_LOG_TYPE_ERROR, "Siri returned invalid word marker [%@,%@], skipping.", buf, 0x16u);

      unint64_t v29 = 0x263F08000;
    }

LABEL_89:
    v26 += 56;
  }
  while (v26 != v27);
  if (__p != (void *)v72)
  {
    v68 = [*(id *)(a1 + 8) delegate];
    objc_msgSend(v68, "siri:didGenerateMarkers:count:", *(void *)(a1 + 8));
  }
LABEL_92:
  std::vector<TTSSynthesizer::Marker>::__clear[abi:ne180100](*(uint64_t **)(a1 + 24));
  if (__p)
  {
    unint64_t v72 = (unint64_t)__p;
    operator delete(__p);
  }
  return 0;
}

void sub_2214A0C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t _ZNKSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE6targetERKSt9type_info(uint64_t a1, uint64_t a2)
{
  if (std::type_info::operator==[abi:ne180100](a2, (uint64_t)&_ZTIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0)) {
    return a1 + 8;
  }
  else {
    return 0;
  }
}

void *_ZNKSt3__110__function6__funcIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0NS_9allocatorIS2_EEFiN14TTSSynthesizer15CallbackMessageEEE11target_typeEv()
{
  return &_ZTIZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_E3__0;
}

id ___ZZZ40__TTSSiriSynthWrapper_synthesizeString__EUb_ENK3__0clEN14TTSSynthesizer15CallbackMessageE_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v3 + 24))
  {
    id v4 = 0;
    *a3 = 1;
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 1;
    *a3 = 0;
    id v4 = *(id *)(a1 + 32);
  }
  return v4;
}

void *std::allocator<SiriTTSMarker>::allocate_at_least[abi:ne180100](uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a2);
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::~__value_func[abi:ne180100](void *a1)
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

uint64_t std::__function::__value_func<int ()(TTSSynthesizer::CallbackMessage)>::__value_func[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

Swift::UInt32 __swiftcall String.osType()()
{
  v22[1] = *MEMORY[0x263EF8340];
  uint64_t v0 = sub_2214AE008();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22[0] = 0;
  sub_2214ADFF8();
  uint64_t v4 = sub_2214ADFE8();
  unint64_t v6 = v5;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (v6 >> 60 != 15)
  {
    unint64_t v7 = v6 >> 62;
    switch(v6 >> 62)
    {
      case 1uLL:
        LODWORD(v8) = HIDWORD(v4) - v4;
        if (__OFSUB__(HIDWORD(v4), v4)) {
          goto LABEL_18;
        }
        uint64_t v8 = (int)v8;
LABEL_7:
        if (v8 != 4) {
          goto LABEL_15;
        }
        if (v7)
        {
          if (v7 == 1)
          {
            if (v4 >> 32 < (int)v4) {
              goto LABEL_20;
            }
            sub_2214A1454(v4, v6);
            sub_2214A1454(v4, v6);
            sub_2214A13AC((int)v4, v4 >> 32, v6 & 0x3FFFFFFFFFFFFFFFLL, v4, v6, v22);
          }
          else
          {
            uint64_t v12 = *(void *)(v4 + 16);
            uint64_t v13 = *(void *)(v4 + 24);
            sub_2214A1454(v4, v6);
            sub_2214A1454(v4, v6);
            swift_retain();
            swift_retain();
            sub_2214A13AC(v12, v13, v6 & 0x3FFFFFFFFFFFFFFFLL, v4, v6, v22);
            swift_release();
            swift_release();
          }
          sub_2214A12AC(v4, v6);
LABEL_15:
          sub_2214A12AC(v4, v6);
        }
        else
        {
          uint64_t v16 = v4;
          __int16 v17 = v6;
          char v18 = BYTE2(v6);
          char v19 = BYTE3(v6);
          char v20 = BYTE4(v6);
          char v21 = BYTE5(v6);
          sub_2214A1318((unsigned __int8 *)&v16, v4, v6, v22);
          sub_2214A12AC(v4, v6);
          sub_2214A12AC(v4, v6);
          sub_2214A12C0(v4, v6);
        }
        break;
      case 2uLL:
        uint64_t v10 = *(void *)(v4 + 16);
        uint64_t v9 = *(void *)(v4 + 24);
        BOOL v11 = __OFSUB__(v9, v10);
        uint64_t v8 = v9 - v10;
        if (!v11) {
          goto LABEL_7;
        }
        goto LABEL_19;
      case 3uLL:
        goto LABEL_15;
      default:
        uint64_t v8 = BYTE6(v6);
        goto LABEL_7;
    }
  }
  Swift::UInt32 result = v22[0];
  if (HIDWORD(v22[0]))
  {
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
  }
  return result;
}

uint64_t sub_2214A12AC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2214A12C0(a1, a2);
  }
  return a1;
}

uint64_t sub_2214A12C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

unsigned __int8 *sub_2214A1318(unsigned __int8 *result, uint64_t a2, unint64_t a3, unint64_t *a4)
{
  if (!result) {
    goto LABEL_16;
  }
  switch(a3 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a2) - a2;
      if (__OFSUB__(HIDWORD(a2), a2)) {
        goto LABEL_14;
      }
      uint64_t v4 = (int)v4;
LABEL_7:
      if (v4 < 0)
      {
        __break(1u);
LABEL_14:
        __break(1u);
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
        JUMPOUT(0x2214A139CLL);
      }
LABEL_8:
      if (v4)
      {
        unint64_t v8 = *a4;
        do
        {
          unsigned int v9 = *result++;
          unint64_t v8 = v9 | (v8 << 8);
          --v4;
        }
        while (v4);
        *a4 = v8;
      }
      return result;
    case 2uLL:
      uint64_t v6 = *(void *)(a2 + 16);
      uint64_t v5 = *(void *)(a2 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_7;
      }
      goto LABEL_15;
    case 3uLL:
      return result;
    default:
      uint64_t v4 = BYTE6(a3);
      goto LABEL_8;
  }
}

uint64_t sub_2214A13AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  uint64_t result = sub_2214ADB88();
  uint64_t v12 = (unsigned __int8 *)result;
  if (result)
  {
    uint64_t result = sub_2214ADBA8();
    if (__OFSUB__(a1, result)) {
      goto LABEL_7;
    }
    v12 += a1 - result;
  }
  if (!__OFSUB__(a2, a1))
  {
    sub_2214ADB98();
    sub_2214A1318(v12, a4, a5, a6);
    return sub_2214A12C0(a4, a5);
  }
  __break(1u);
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_2214A1454(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2214A1468(a1, a2);
  }
  return a1;
}

uint64_t sub_2214A1468(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_2214A14C0()
{
  uint64_t v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F516E0);
  __swift_allocate_value_buffer(v0, qword_267F51BA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_267F51BA8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F518B8);
  return sub_2214ADDB8();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2214A15C0()
{
  uint64_t result = *MEMORY[0x263F21258];
  if (*MEMORY[0x263F21258])
  {
    uint64_t result = sub_2214AE098();
    qword_26AAE9530 = result;
    qword_26AAE9538 = v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2214A15FC()
{
  uint64_t v0 = sub_2214ADDE8();
  __swift_allocate_value_buffer(v0, qword_26AAE9558);
  __swift_project_value_buffer(v0, (uint64_t)qword_26AAE9558);
  if (qword_26AAE9548 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  return sub_2214ADDD8();
}

uint64_t sub_2214A16C0()
{
  return 1;
}

uint64_t sub_2214A16C8()
{
  return sub_2214AE468();
}

uint64_t sub_2214A170C()
{
  return sub_2214AE458();
}

uint64_t sub_2214A1734()
{
  return sub_2214AE468();
}

void *sub_2214A1774@<X0>(void *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_2214A1788(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t type metadata accessor for TTSSiriSynthAudioUnit()
{
  uint64_t result = qword_26AAE9590;
  if (!qword_26AAE9590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

__n128 sub_2214A17DC@<Q0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v3 = a1 + qword_26AAE9700;
  swift_beginAccess();
  __n128 result = *(__n128 *)v3;
  long long v5 = *(_OWORD *)(v3 + 16);
  *a2 = *(_OWORD *)v3;
  a2[1] = v5;
  return result;
}

uint64_t sub_2214A182C()
{
  uint64_t v1 = v0 + qword_26AAE9700;
  swift_beginAccess();
  return *(void *)v1;
}

__n128 sub_2214A1878(uint64_t a1, uint64_t a2, __n128 *a3)
{
  uint64_t v3 = (__n128 *)(a1 + qword_26AAE9700);
  __n128 v5 = a3[1];
  __n128 v6 = *a3;
  swift_beginAccess();
  __n128 result = v5;
  __n128 *v3 = v6;
  v3[1] = v5;
  return result;
}

uint64_t sub_2214A18D4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  int v5 = a4;
  int v6 = a3;
  int v7 = a2;
  int v8 = a1;
  unint64_t v9 = HIDWORD(a1);
  unint64_t v10 = HIDWORD(a2);
  unint64_t v11 = HIDWORD(a3);
  unint64_t v12 = HIDWORD(a4);
  uint64_t v13 = (_DWORD *)(v4 + qword_26AAE9700);
  uint64_t result = swift_beginAccess();
  *uint64_t v13 = v8;
  v13[1] = v9;
  v13[2] = v7;
  v13[3] = v10;
  v13[4] = v6;
  v13[5] = v11;
  v13[6] = v5;
  v13[7] = v12;
  return result;
}

uint64_t sub_2214A1968@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit
                                + (*MEMORY[0x263F8EED0] & **a1)
                                + 288))();
  *(void *)a2 = result;
  *(_DWORD *)(a2 + 8) = v4;
  *(_DWORD *)(a2 + 12) = v5;
  *(_DWORD *)(a2 + 16) = v6;
  *(_DWORD *)(a2 + 20) = v7;
  *(_DWORD *)(a2 + 24) = v8;
  *(_DWORD *)(a2 + 28) = v9;
  return result;
}

uint64_t sub_2214A1A00(void *a1, void **a2)
{
  return (*(uint64_t (**)(void, void, void, void))(class metadata base offset for TTSSiriSynthAudioUnit
                                                                   + (*MEMORY[0x263F8EED0] & **a2)
                                                                   + 296))(*a1, a1[1], a1[2], a1[3]);
}

uint64_t (*sub_2214A1A84())()
{
  return j__swift_endAccess;
}

id sub_2214A1AE4()
{
  uint64_t v1 = qword_26AAE96C8;
  uint64_t v2 = *(void **)(v0 + qword_26AAE96C8);
  if (v2)
  {
    id v3 = *(id *)(v0 + qword_26AAE96C8);
  }
  else
  {
    id v4 = objc_msgSend(objc_allocWithZone((Class)sub_2214ADED8()), sel_init);
    int v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id TTSSiriSynthAudioUnit.__allocating_init(componentDescription:options:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  v11[1] = *(id *)MEMORY[0x263EF8340];
  v11[0] = 0;
  v9[0] = a1;
  v9[1] = a2;
  int v10 = a3;
  id v5 = objc_msgSend(objc_allocWithZone(v4), sel_initWithComponentDescription_options_error_, v9, a4, v11);
  if (v5)
  {
    id v6 = v11[0];
  }
  else
  {
    id v7 = v11[0];
    sub_2214ADBD8();

    swift_willThrow();
  }
  return v5;
}

char *TTSSiriSynthAudioUnit.init(componentDescription:options:)(unint64_t a1, unint64_t a2, int a3, unsigned int a4)
{
  unsigned int v72 = a4;
  int v71 = a3;
  unint64_t v70 = a2;
  unint64_t v69 = a1;
  uint64_t v102 = *MEMORY[0x263EF8340];
  uint64_t v92 = sub_2214AE1F8();
  uint64_t v96 = *(void *)(v92 - 8);
  MEMORY[0x270FA5388]();
  v91 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_2214AE1E8();
  MEMORY[0x270FA5388]();
  v90 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2214ADF28();
  MEMORY[0x270FA5388]();
  v95 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = &v4[qword_26AAE9580];
  uint64_t v89 = sub_2214AD348(0, &qword_26AAE94D8);
  v93 = (objc_class *)type metadata accessor for TTSSiriSynthAudioUnit();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  int v10 = self;
  unint64_t v11 = v4;
  id v12 = objc_msgSend(v10, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2214ADBB8();

  id v13 = objc_msgSend(v10, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2214ADBB8();

  uint64_t v14 = MEMORY[0x263F8EE78];
  sub_2214AE1D8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v98 = 0;
  uint64_t v101 = 0;
  long long v99 = 0u;
  long long v100 = 0u;
  sub_2214ADCD8();
  uint64_t v15 = &v11[qword_26AAE9700];
  *(_OWORD *)uint64_t v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  uint64_t v82 = qword_26AAE96C8;
  *(void *)&v11[qword_26AAE96C8] = 0;
  uint64_t v16 = qword_26AAE96E0;
  uint64_t v84 = sub_2214AD348(0, (unint64_t *)&unk_26AAE9480);
  sub_2214ADF08();
  *(void *)&long long v99 = v14;
  unint64_t v88 = sub_2214A2894();
  uint64_t v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAE9440);
  uint64_t v89 = sub_2214AB304(&qword_26AAE9448, &qword_26AAE9440);
  uint64_t v86 = v6;
  sub_2214AE2C8();
  unsigned int v85 = *MEMORY[0x263F8F130];
  __int16 v17 = *(void (**)(char *))(v96 + 104);
  v96 += 104;
  char v19 = v91;
  uint64_t v18 = v92;
  v17(v91);
  uint64_t v20 = sub_2214AE218();
  uint64_t v83 = v16;
  *(void *)&v11[v16] = v20;
  uint64_t v81 = qword_26AAE96D8;
  *(void *)&v11[qword_26AAE96D8] = 0;
  *(void *)&v11[qword_26AAE95C0] = 0x40E7700000000000;
  *(_DWORD *)&v11[qword_26AAE95D8] = 1;
  *(_DWORD *)&v11[qword_26AAE96B0] = 1;
  *(_DWORD *)&v11[qword_26AAE95A8] = 1024;
  uint64_t v73 = qword_26AAE9660;
  *(void *)&v11[qword_26AAE9660] = 0;
  uint64_t v74 = qword_26AAE95E8;
  *(void *)&v11[qword_26AAE95E8] = 0;
  uint64_t v75 = qword_26AAE9650;
  *(void *)&v11[qword_26AAE9650] = 0;
  uint64_t v76 = qword_26AAE96E8;
  *(void *)&v11[qword_26AAE96E8] = 0;
  uint64_t v78 = qword_26AAE9630;
  uint64_t v21 = MEMORY[0x263F8EE78];
  *(void *)&v11[qword_26AAE9630] = MEMORY[0x263F8EE78];
  uint64_t v80 = qword_26AAE9618;
  *(void *)&v11[qword_26AAE9618] = 0;
  *(void *)&v11[qword_26AAE96C0] = 0;
  uint64_t v79 = qword_26AAE95F8;
  *(void *)&v11[qword_26AAE95F8] = v21;
  uint64_t v22 = v21;
  *(void *)&v11[qword_26AAE95E0] = 0;
  uint64_t v23 = qword_26AAE9648;
  id v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08740]), sel_init);
  uint64_t v77 = v23;
  id v68 = v24;
  *(void *)&v11[v23] = v24;
  uint64_t v25 = qword_26AAE95D0;
  sub_2214ADF18();
  *(void *)&long long v99 = v22;
  sub_2214AE2C8();
  ((void (*)(char *, void, uint64_t))v17)(v19, v85, v18);
  uint64_t v26 = sub_2214AE218();
  uint64_t v96 = v25;
  *(void *)&v11[v25] = v26;
  uint64_t v27 = qword_26AAE95B8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AAE94B0);
  uint64_t v28 = swift_allocObject();
  *(_DWORD *)(v28 + 16) = 0;
  *(void *)&v11[v27] = v28;
  unint64_t v29 = &v11[qword_26AAE9680];
  *(void *)unint64_t v29 = 0;
  *((void *)v29 + 1) = 0;
  uint64_t v30 = &v11[qword_26AAE96A8];
  *(void *)uint64_t v30 = 0;
  *((void *)v30 + 1) = 0;
  unint64_t v31 = &v11[qword_26AAE9620];
  *(void *)unint64_t v31 = 0;
  *((void *)v31 + 1) = 0;
  v31[16] = 1;
  uint64_t v32 = &v11[qword_26AAE9698];
  *(void *)uint64_t v32 = 0;
  v32[8] = 1;
  v11[qword_26AAE9670] = 0;
  int v33 = &v11[qword_26AAE9608];
  uint64_t v34 = sub_2214ADC98();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v33, 1, 1, v34);
  v11[qword_26AAE95A0] = 1;
  v11[qword_26AAE9578] = 2;
  *(void *)&v11[qword_26AAE9690] = 0;
  *(void *)&v11[qword_26AAE9638] = MEMORY[0x263F8EE78];
  id v35 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9390]), sel_initStandardFormatWithSampleRate_channels_, 1, 48000.0);
  if (!v35)
  {

    *(void *)&long long v99 = sub_2214AD348(0, &qword_267F516E8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F516F0);
    uint64_t v59 = sub_2214AE018();
    uint64_t v61 = v60;
    sub_2214A2934();
    swift_allocError();
    *(void *)uint64_t v62 = v59;
    *(void *)(v62 + 8) = v61;
    *(unsigned char *)(v62 + 16) = 1;
    swift_willThrow();
LABEL_7:
    uint64_t v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAE9420);
    (*(void (**)(char *, uint64_t))(*(void *)(v64 - 8) + 8))(v94, v64);

    swift_release();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2214AD4E8((uint64_t)v33, (uint64_t *)&unk_26AAE9428);
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    return v33;
  }
  v36 = v35;
  id v37 = objc_allocWithZone(MEMORY[0x263F28DA8]);
  *(void *)&long long v99 = 0;
  id v38 = objc_msgSend(v37, sel_initWithFormat_error_, v36, &v99);
  unsigned int v39 = (void *)v99;
  if (!v38)
  {
    id v63 = (id)v99;
    sub_2214ADBD8();

    swift_willThrow();
    goto LABEL_7;
  }
  char v40 = v38;
  unsigned int v41 = v69;
  unint64_t v42 = HIDWORD(v69);
  unsigned int v43 = v70;
  unint64_t v44 = HIDWORD(v70);
  *(void *)&v11[qword_26AAE96F0] = v38;
  id v45 = v39;
  objc_msgSend(v40, sel_setMaximumChannelCount_, 1);
  id v46 = v68;
  int v47 = (void *)sub_2214ADFC8();
  objc_msgSend(v46, sel_setName_, v47);

  v97.receiver = v11;
  v97.super_class = v93;
  id v98 = 0;
  *(void *)&long long v99 = __PAIR64__(v42, v41);
  *((void *)&v99 + 1) = __PAIR64__(v44, v43);
  LODWORD(v100) = v71;
  id v48 = objc_msgSendSuper2(&v97, sel_initWithComponentDescription_options_error_, &v99, v72, &v98);
  if (v48)
  {
    uint64_t v49 = v48;
    id v50 = v98;
    uint64_t v51 = v49;
    objc_msgSend(v51, sel_setMaximumFramesToRender_, 1024);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AAE94C0);
    uint64_t v52 = swift_allocObject();
    *(_OWORD *)(v52 + 16) = xmmword_2214AF2A0;
    __int16 v53 = *(void **)&v51[qword_26AAE96F0];
    *(void *)(v52 + 32) = v53;
    *(void *)&long long v99 = v52;
    sub_2214AE158();
    id v54 = objc_allocWithZone(MEMORY[0x263F28DB0]);
    sub_2214AD348(0, &qword_26AAE9468);
    int v33 = v51;
    id v55 = v53;
    unint64_t v56 = (void *)sub_2214AE138();
    swift_bridgeObjectRelease();
    id v57 = objc_msgSend(v54, sel_initWithAudioUnit_busType_busses_, v33, 2, v56);

    v58 = *(void **)&v33[qword_26AAE9660];
    *(void *)&v33[qword_26AAE9660] = v57;
  }
  else
  {
    id v66 = v98;
    int v33 = (char *)sub_2214ADBD8();

    swift_willThrow();
  }
  return v33;
}

unint64_t sub_2214A2894()
{
  unint64_t result = qword_26AAE9478;
  if (!qword_26AAE9478)
  {
    sub_2214AE1E8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAE9478);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_2214A2934()
{
  unint64_t result = qword_267F516F8;
  if (!qword_267F516F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F516F8);
  }
  return result;
}

char *sub_2214A2988(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return TTSSiriSynthAudioUnit.init(componentDescription:options:)(*(void *)a3, *(void *)(a3 + 8), *(_DWORD *)(a3 + 16), a4);
}

uint64_t sub_2214A2A08()
{
  uint64_t v1 = qword_26AAE96D8;
  if (*(void *)(v0 + qword_26AAE96D8))
  {
    uint64_t v2 = *(void *)(v0 + qword_26AAE96D8);
  }
  else
  {
    uint64_t v3 = v0;
    sub_2214ADE68();
    swift_allocObject();
    uint64_t v2 = sub_2214ADE58();
    *(void *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_2214A2A84(void *a1)
{
  id v1 = a1;
  sub_2214A2AF8();

  sub_2214AD348(0, (unint64_t *)&unk_26AAE9490);
  uint64_t v2 = (void *)sub_2214AE138();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_2214A2AF8()
{
  uint64_t v0 = sub_2214ADE18();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v0);
  uint64_t v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (TTSVBHasDeviceBeenUnlockedSinceBoot())
  {
    sub_2214A8604();
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)(v4 + 16);
    if (v6)
    {
      uint64_t v41 = MEMORY[0x263F8EE78];
      sub_2214AE378();
      uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
      uint64_t v7 = v1 + 16;
      id v35 = v8;
      unint64_t v9 = (*(unsigned __int8 *)(v7 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 64);
      uint64_t v30 = v5;
      uint64_t v10 = v5 + v9;
      uint64_t v34 = *(void *)(v7 + 56);
      uint64_t v33 = *MEMORY[0x263F7EF20];
      uint64_t v32 = (void (**)(char *, uint64_t))(v7 - 8);
      long long v40 = xmmword_2214AF2B0;
      uint64_t v31 = MEMORY[0x263F8EE58] + 8;
      uint64_t v37 = v7;
      uint64_t v36 = v0;
      do
      {
        uint64_t v38 = v6;
        uint64_t v39 = v10;
        v35(v3, v10, v0);
        swift_getKeyPath();
        sub_2214ADE08();
        swift_release();
        swift_getKeyPath();
        sub_2214ADE08();
        swift_release();
        unint64_t v11 = v3;
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F51890);
        *(_OWORD *)(swift_allocObject() + 16) = v40;
        swift_getKeyPath();
        sub_2214ADE08();
        swift_release();
        *(_OWORD *)(swift_allocObject() + 16) = v40;
        swift_getKeyPath();
        sub_2214ADE08();
        swift_release();
        id v12 = objc_allocWithZone(MEMORY[0x263EF9488]);
        id v13 = (void *)sub_2214ADFC8();
        swift_bridgeObjectRelease();
        uint64_t v14 = (void *)sub_2214ADFC8();
        swift_bridgeObjectRelease();
        uint64_t v15 = MEMORY[0x263F8D310];
        uint64_t v16 = (void *)sub_2214AE138();
        swift_bridgeObjectRelease();
        __int16 v17 = (void *)sub_2214AE138();
        swift_bridgeObjectRelease();
        uint64_t v18 = v12;
        uint64_t v0 = v36;
        id v19 = objc_msgSend(v18, sel_initWithName_identifier_primaryLanguages_supportedLanguages_, v13, v14, v16, v17, v30, v31);

        uint64_t v20 = v38;
        uint64_t v3 = v11;

        objc_msgSend(v19, sel_setIsPersonalVoice_, 1);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F518A0);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = v40;
        uint64_t v43 = sub_2214ADFD8();
        uint64_t v44 = v22;
        sub_2214AE2F8();
        *(void *)(inited + 96) = v15;
        strcpy((char *)(inited + 72), "Personal Voice");
        *(unsigned char *)(inited + 87) = -18;
        sub_2214A3194(inited);
        uint64_t v23 = (void *)sub_2214ADFA8();
        swift_bridgeObjectRelease();
        objc_msgSend(v19, sel_setExtraAttributes_, v23);

        (*v32)(v11, v0);
        sub_2214AE358();
        sub_2214AE388();
        sub_2214AE398();
        sub_2214AE368();
        uint64_t v10 = v39 + v34;
        uint64_t v6 = v20 - 1;
      }
      while (v6);
    }
    goto LABEL_5;
  }
  id v24 = objc_msgSend(self, sel_allSynthesisProviderVoices);
  sub_2214AD348(0, (unint64_t *)&unk_26AAE9490);
  unint64_t v25 = sub_2214AE148();

  uint64_t v42 = MEMORY[0x263F8EE78];
  if (!(v25 >> 62))
  {
    uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v26) {
      goto LABEL_8;
    }
LABEL_5:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = sub_2214AE3B8();
  swift_bridgeObjectRelease();
  if (!v26) {
    goto LABEL_5;
  }
LABEL_8:
  if (v26 >= 1)
  {
    for (uint64_t i = 0; i != v26; ++i)
    {
      if ((v25 & 0xC000000000000001) != 0) {
        id v28 = (id)MEMORY[0x223C81920](i, v25);
      }
      else {
        id v28 = *(id *)(v25 + 8 * i + 32);
      }
      unint64_t v29 = v28;
      if (objc_msgSend(v28, sel_isPersonalVoice))
      {
        sub_2214AE358();
        sub_2214AE388();
        sub_2214AE398();
        sub_2214AE368();
      }
      else
      {
      }
    }
    goto LABEL_5;
  }
  __break(1u);
}

uint64_t sub_2214A30D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2214ADEA8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2214A30FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2214ADE78();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2214A3128@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_2214ADE88();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2214A3154()
{
  return sub_2214ADE98();
}

unint64_t sub_2214A3194(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F518A8);
  uint64_t v2 = sub_2214AE3C8();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2214AD678(v6, (uint64_t)v15, &qword_267F518B0);
    unint64_t result = sub_2214AB104((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_2214AD544(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_2214A32D8()
{
  sub_2214AD348(0, &qword_26AAE94A0);
  uint64_t v0 = (void *)sub_2214AE248();
  return v0;
}

id sub_2214A3328()
{
  sub_2214AD348(0, &qword_26AAE94A0);
  uint64_t v0 = (void *)sub_2214AE248();
  return v0;
}

id sub_2214A3378(uint64_t a1)
{
  id result = *(id *)(a1 + qword_26AAE9660);
  if (result) {
    return result;
  }
  __break(1u);
  return result;
}

void sub_2214A3390(uint64_t a1, uint8_t *a2)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAE9420);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  char v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2214A9124(a1, a2);
  if (!v9) {
    return;
  }
  BOOL v10 = (_AXSSpeechSynthesisOptions() & 1) == 0;
  id v11 = objc_allocWithZone((Class)TTSSiriSynthWrapper);
  uint64_t v12 = v2;
  BOOL v13 = (void *)sub_2214ADFC8();
  swift_bridgeObjectRelease();
  uint64_t v14 = (void *)sub_2214ADFC8();
  id v15 = objc_msgSend(v11, sel_initWithVoicePath_language_censorPlainText_delegate_feResourcePath_, v13, v14, v10, v12, 0);

  uint64_t v16 = qword_26AAE95E8;
  long long v17 = *(void **)&v12[qword_26AAE95E8];
  *(void *)&v12[qword_26AAE95E8] = v15;

  uint64_t v18 = *(void **)&v12[v16];
  if (!v18)
  {
LABEL_25:
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, &v12[qword_26AAE9580], v5);
    sub_2214ADCC8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    sub_2214ADD18();
    swift_release();
    return;
  }
  id v83 = v18;
  id v19 = objc_msgSend(v83, sel_neuralStyles);
  sub_2214AD348(0, &qword_267F51708);
  unint64_t v20 = sub_2214AE148();

  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_2214AE3B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v21 = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v21)
  {

    goto LABEL_25;
  }
  id v22 = objc_msgSend(v83, sel_neuralStyles);
  unint64_t v23 = sub_2214AE148();

  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_2214AE3B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v24)
  {
    unint64_t v25 = &v12[qword_26AAE9580];
    uint64_t v26 = v6 + 16;
    uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v27(v8, &v12[qword_26AAE9580], v5);
    sub_2214ADCC8();
    uint64_t v30 = *(void (**)(char *, uint64_t))(v6 + 8);
    uint64_t v29 = v6 + 8;
    id v28 = v30;
    v30(v8, v5);
    sub_2214ADD18();
    swift_release();
    v27(v8, v25, v5);
    uint64_t v80 = sub_2214ADCC8();
    v30(v8, v5);
    v27(v8, v25, v5);
    sub_2214ADCC8();
    v30(v8, v5);
    uint64_t v31 = (void *)sub_2214ADCF8();
    swift_release();
    id v32 = objc_msgSend(v31, sel_identifier);

    uint64_t v82 = (uint64_t)v32;
    if (!v32)
    {
      sub_2214ADFD8();
      uint64_t v82 = sub_2214ADFC8();
      swift_bridgeObjectRelease();
    }
    v27(v8, v25, v5);
    sub_2214ADCC8();
    v28(v8, v5);
    uint64_t v33 = (void *)sub_2214ADCF8();
    swift_release();
    id v34 = objc_msgSend(v33, sel_displayName);

    uint64_t v81 = (uint64_t)v34;
    if (!v34)
    {
      sub_2214ADFD8();
      uint64_t v81 = sub_2214ADFC8();
      swift_bridgeObjectRelease();
    }
    v27(v8, v25, v5);
    sub_2214ADCC8();
    v28(v8, v5);
    id v35 = (void *)sub_2214ADCF8();
    swift_release();
    id v78 = objc_msgSend(v35, sel_address);

    v27(v8, v25, v5);
    sub_2214ADCC8();
    v28(v8, v5);
    uint64_t v36 = (void *)sub_2214ADCF8();
    swift_release();
    objc_msgSend(v36, sel_minValue);
    int v38 = v37;

    v27(v8, v25, v5);
    sub_2214ADCC8();
    v28(v8, v5);
    uint64_t v39 = (void *)sub_2214ADCF8();
    swift_release();
    objc_msgSend(v39, sel_maxValue);
    int v41 = v40;

    v27(v8, v25, v5);
    sub_2214ADCC8();
    v28(v8, v5);
    uint64_t v42 = (void *)sub_2214ADCF8();
    swift_release();
    unsigned int v77 = objc_msgSend(v42, sel_unit);

    uint64_t v43 = v28;
    uint64_t v44 = v27;
    v27(v8, v25, v5);
    sub_2214ADCC8();
    uint64_t v79 = v43;
    v43(v8, v5);
    id v45 = (void *)sub_2214ADCF8();
    swift_release();
    id v76 = objc_msgSend(v45, sel_unitName);

    id v46 = objc_msgSend(v83, sel_neuralStyles);
    unint64_t v47 = sub_2214AE148();

    if (v47 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_2214AE3B8();
      swift_bridgeObjectRelease();
      if (v48) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v48 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v48)
      {
LABEL_15:
        uint64_t v71 = v26;
        unsigned int v72 = v25;
        uint64_t v73 = v8;
        uint64_t v74 = v29;
        uint64_t v75 = v5;
        uint64_t v84 = MEMORY[0x263F8EE78];
        sub_2214AAF78(0, v48 & ~(v48 >> 63), 0);
        if (v48 < 0)
        {
          __break(1u);
          return;
        }
        uint64_t v49 = 0;
        uint64_t v50 = v84;
        do
        {
          if ((v47 & 0xC000000000000001) != 0) {
            id v51 = (id)MEMORY[0x223C81920](v49, v47);
          }
          else {
            id v51 = *(id *)(v47 + 8 * v49 + 32);
          }
          uint64_t v52 = v51;
          id v53 = objc_msgSend(v51, sel_name);
          uint64_t v54 = sub_2214ADFD8();
          uint64_t v56 = v55;

          uint64_t v84 = v50;
          unint64_t v58 = *(void *)(v50 + 16);
          unint64_t v57 = *(void *)(v50 + 24);
          if (v58 >= v57 >> 1)
          {
            sub_2214AAF78(v57 > 1, v58 + 1, 1);
            uint64_t v50 = v84;
          }
          ++v49;
          *(void *)(v50 + 16) = v58 + 1;
          uint64_t v59 = v50 + 16 * v58;
          *(void *)(v59 + 32) = v54;
          *(void *)(v59 + 40) = v56;
        }
        while (v48 != v49);
        uint64_t v27 = v44;
        swift_bridgeObjectRelease();
        uint64_t v5 = v75;
        unint64_t v25 = v72;
        char v8 = v73;
        goto LABEL_33;
      }
    }
    swift_bridgeObjectRelease();
LABEL_33:
    uint64_t v61 = self;
    uint64_t v62 = (void *)sub_2214AE138();
    swift_bridgeObjectRelease();
    v27(v8, v25, v5);
    sub_2214ADCC8();
    v79(v8, v5);
    id v63 = (void *)sub_2214ADCF8();
    swift_release();
    id v64 = objc_msgSend(v63, sel_dependentParameters);

    id v66 = (void *)v81;
    v65 = (void *)v82;
    LODWORD(v67) = v38;
    LODWORD(v68) = v41;
    unint64_t v69 = v76;
    id v70 = objc_msgSend(v61, sel_createParameterWithIdentifier_name_address_min_max_unit_unitName_flags_valueStrings_dependentParameters_, v82, v81, v78, v77, v76, 0, v67, v68, v62, v64);

    sub_2214ADD08();
    swift_release();

    return;
  }
  id v60 = v83;
}

uint64_t sub_2214A3D20(void *a1)
{
  uint64_t v2 = sub_2214ADFD8();
  uint64_t v4 = v3;
  id v5 = a1;
  sub_2214A3390(v2, v4);

  return swift_bridgeObjectRelease();
}

BOOL sub_2214A3D88()
{
  uint64_t v1 = qword_26AAE9578;
  int v2 = *((unsigned __int8 *)v0 + qword_26AAE9578);
  if (v2 != 2) {
    return v2 & 1;
  }
  (*(void (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x263F8EED0] & *v0) + 288))();
  uint64_t v3 = (void *)xpc_copy_entitlement_for_token();
  if (v3)
  {
    BOOL value = xpc_BOOL_get_value(v3);
    swift_unknownObjectRelease();
  }
  else
  {
    BOOL value = 0;
  }
  *((unsigned char *)v0 + v1) = value;
  return value;
}

void sub_2214A3EA8(void *a1)
{
  int v2 = v1;
  v256 = a1;
  uint64_t v249 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAE9420);
  uint64_t v3 = *(void *)(v249 - 8);
  MEMORY[0x270FA5388](v249);
  id v5 = (char *)&v232 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AAE9428);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v232 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v250 = sub_2214ADDA8();
  uint64_t v243 = *(void *)(v250 - 8);
  MEMORY[0x270FA5388](v250);
  v252 = (char *)&v232 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v242 = sub_2214ADC18();
  uint64_t v241 = *(void *)(v242 - 8);
  MEMORY[0x270FA5388](v242);
  id v11 = (char *)&v232 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F51710);
  MEMORY[0x270FA5388](v12 - 8);
  v240 = (char *)&v232 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v254 = sub_2214ADD28();
  uint64_t v14 = *(void *)(v254 - 8);
  MEMORY[0x270FA5388](v254);
  v253 = (uint64_t *)((char *)&v232 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_26AAE9570 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_2214ADDE8();
  uint64_t v17 = __swift_project_value_buffer(v16, (uint64_t)qword_26AAE9558);
  uint64_t v18 = sub_2214ADDC8();
  os_log_type_t v19 = sub_2214AE198();
  BOOL v20 = os_log_type_enabled(v18, v19);
  uint64_t v238 = v3;
  v237 = v5;
  v248 = v8;
  v239 = v11;
  if (v20)
  {
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(void *)atoken.val = v22;
    *(_DWORD *)uint64_t v21 = 136315138;
    v262 = (void *)sub_2214AA8A4(0xD00000000000001BLL, 0x80000002214AFF70, (uint64_t *)&atoken);
    sub_2214AE288();
    _os_log_impl(&dword_22149B000, v18, v19, "Did get %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C82360](v22, -1, -1);
    MEMORY[0x223C82360](v21, -1, -1);
  }

  uint64_t v244 = sub_2214ADD58();
  unint64_t v23 = (void *)sub_2214ADD48();
  uint64_t v24 = *MEMORY[0x263F7ED78];
  unint64_t v25 = *(void (**)(uint64_t *, void, uint64_t))(v14 + 104);
  uint64_t v27 = v253;
  uint64_t v26 = v254;
  uint64_t v247 = v14 + 104;
  v246 = v25;
  v25(v253, v24, v254);
  id v28 = v256;
  id v29 = objc_msgSend(v256, sel_jobIdentifier);
  sub_2214ADFD8();

  sub_2214ADD38();
  swift_bridgeObjectRelease();
  uint64_t v31 = *(void (**)(uint64_t *, uint64_t))(v14 + 8);
  uint64_t v30 = v14 + 8;
  v245 = v31;
  v31(v27, v26);
  v255 = (unsigned char *)qword_26AAE95A0;
  *((unsigned char *)v2 + qword_26AAE95A0) = 1;
  id v32 = objc_msgSend(v28, sel_voice);
  LODWORD(v29) = objc_msgSend(v32, sel_isPersonalVoice);

  if (v29)
  {
    id v33 = sub_2214A1AE4();
    char v34 = sub_2214ADEC8();

    if ((v34 & 1) == 0)
    {
      id v35 = sub_2214ADDC8();
      os_log_type_t v36 = sub_2214AE1B8();
      if (os_log_type_enabled(v35, v36))
      {
        int v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)int v37 = 0;
        _os_log_impl(&dword_22149B000, v35, v36, "Personal voices cannot be used on devices without a passcode. No speech will be generated", v37, 2u);
        MEMORY[0x223C82360](v37, -1, -1);
      }

      v255[(void)v2] = 0;
    }
    id v38 = sub_2214A1AE4();
    char v39 = sub_2214ADEB8();

    if (v39)
    {
      int v40 = sub_2214ADDC8();
      os_log_type_t v41 = sub_2214AE1B8();
      if (os_log_type_enabled(v40, v41))
      {
        uint64_t v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v42 = 0;
        _os_log_impl(&dword_22149B000, v40, v41, "Personal voices cannot be used on devices that are locked. No speech will be generated", v42, 2u);
        MEMORY[0x223C82360](v42, -1, -1);
      }

      v255[(void)v2] = 0;
    }
    uint64_t v43 = v2;
    uint64_t v44 = sub_2214ADDC8();
    os_log_type_t v45 = sub_2214AE1A8();
    if (os_log_type_enabled(v44, v45))
    {
      id v46 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v46 = 67109120;
      LOBYTE(atoken.val[0]) = sub_2214A3D88();
      atoken.val[0] = LOBYTE(atoken.val[0]);
      sub_2214AE288();

      _os_log_impl(&dword_22149B000, v44, v45, "Has PV entitlement %{BOOL}d", v46, 8u);
      MEMORY[0x223C82360](v46, -1, -1);
    }
    else
    {

      uint64_t v44 = v43;
    }

    id v47 = objc_msgSend(self, sel_sharedInstance);
    unsigned __int8 v48 = objc_msgSend(v47, sel_allowAppUsage);

    if ((v48 & 1) == 0 && !sub_2214A3D88())
    {
      uint64_t v49 = sub_2214ADDC8();
      os_log_type_t v50 = sub_2214AE1B8();
      if (os_log_type_enabled(v49, v50))
      {
        id v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v51 = 0;
        _os_log_impl(&dword_22149B000, v49, v50, "This personal voice does not allow app usage. No speech will be generated", v51, 2u);
        MEMORY[0x223C82360](v51, -1, -1);
      }

      v255[(void)v2] = 0;
    }
    if (!sub_2214A3D88())
    {
      int v52 = _TTSSystemFocusedPid();
      *(void *)atoken.val = (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit
                                                   + (*MEMORY[0x263F8EED0] & (uint64_t)v43->isa)
                                                   + 288))();
      atoken.val[2] = v53;
      atoken.val[3] = v54;
      atoken.val[4] = v55;
      atoken.val[5] = v56;
      atoken.val[6] = v57;
      atoken.val[7] = v58;
      if (v52 != audit_token_to_pid(&atoken))
      {
        uint64_t v59 = sub_2214ADDC8();
        os_log_type_t v60 = sub_2214AE1B8();
        if (os_log_type_enabled(v59, v60))
        {
          uint64_t v61 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v61 = 0;
          _os_log_impl(&dword_22149B000, v59, v60, "Personal voices can only be used while app is foreground", v61, 2u);
          MEMORY[0x223C82360](v61, -1, -1);
        }

        v255[(void)v2] = 0;
      }
    }
    uint64_t v62 = v43;
    uint64_t v236 = v17;
    id v63 = sub_2214ADDC8();
    os_log_type_t v64 = sub_2214AE198();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = swift_slowAlloc();
      uint64_t v251 = v30;
      id v66 = (uint8_t *)v65;
      id v28 = (void *)swift_slowAlloc();
      v262 = v28;
      *(_DWORD *)id v66 = 136315138;
      *(void *)atoken.val = (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit
                                                   + (*MEMORY[0x263F8EED0] & (uint64_t)v62->isa)
                                                   + 288))();
      atoken.val[2] = v67;
      atoken.val[3] = v68;
      atoken.val[4] = v69;
      atoken.val[5] = v70;
      atoken.val[6] = v71;
      atoken.val[7] = v72;
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F51728);
      uint64_t v73 = sub_2214AE018();
      *(void *)atoken.val = sub_2214AA8A4(v73, v74, (uint64_t *)&v262);
      sub_2214AE288();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22149B000, v63, v64, "Speech request is for personal voice. Will check if host is TCC-approved. token=%s", v66, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x223C82360](v28, -1, -1);
      uint64_t v75 = v66;
      uint64_t v30 = v251;
      MEMORY[0x223C82360](v75, -1, -1);
    }
    else
    {
    }
    if (!*MEMORY[0x263F7C670])
    {
LABEL_106:
      __break(1u);
      goto LABEL_107;
    }
    id v76 = *(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit
                              + (*MEMORY[0x263F8EED0] & (uint64_t)v62->isa)
                              + 288);
    id v77 = (id)*MEMORY[0x263F7C670];
    *(void *)atoken.val = v76();
    atoken.val[2] = v78;
    atoken.val[3] = v79;
    atoken.val[4] = v80;
    atoken.val[5] = v81;
    atoken.val[6] = v82;
    atoken.val[7] = v83;
    int v84 = TCCAccessCheckAuditToken();

    unsigned int v85 = sub_2214ADDC8();
    if (v84)
    {
      os_log_type_t v86 = sub_2214AE198();
      if (os_log_type_enabled(v85, v86))
      {
        uint64_t v87 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v87 = 0;
        _os_log_impl(&dword_22149B000, v85, v86, "Host is TCC-approved for personal voice speech", v87, 2u);
        MEMORY[0x223C82360](v87, -1, -1);
      }
    }
    else
    {
      int v88 = sub_2214AE1B8();
      if (os_log_type_enabled(v85, (os_log_type_t)v88))
      {
        uint64_t v89 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v89 = 0;
        _os_log_impl(&dword_22149B000, v85, (os_log_type_t)v88, "Caller does not have kTCCServiceVoiceBanking access to personal voices. No speech will be generated", v89, 2u);
        MEMORY[0x223C82360](v89, -1, -1);
      }

      v255[(void)v2] = 0;
    }
  }
  v90 = *(void **)((char *)v2 + qword_26AAE9650);
  id v91 = v256;
  *(void *)((char *)v2 + qword_26AAE9650) = v256;
  v256 = v91;

  *(void *)((char *)v2 + qword_26AAE95E0) = 0;
  uint64_t v92 = (char *)v2 + qword_26AAE9630;
  swift_beginAccess();
  *uint64_t v92 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  v93 = *(NSObject **)((char *)v2 + qword_26AAE95D0);
  uint64_t v94 = swift_allocObject();
  *(void *)(v94 + 16) = v2;
  uint64_t v95 = swift_allocObject();
  *(void *)(v95 + 16) = sub_2214AB25C;
  *(void *)(v95 + 24) = v94;
  v260 = sub_2214AB270;
  uint64_t v261 = v95;
  *(void *)atoken.val = MEMORY[0x263EF8330];
  *(void *)&atoken.val[2] = 1107296256;
  *(void *)&atoken.val[4] = sub_2214A5F2C;
  *(void *)&atoken.val[6] = &block_descriptor;
  uint64_t v96 = _Block_copy(&atoken);
  objc_super v97 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v93, v96);
  _Block_release(v96);
  LOBYTE(v96) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v96)
  {
    __break(1u);
    goto LABEL_102;
  }
  *(void *)&v97[qword_26AAE96C0] = 0;
  id v98 = *(void **)&v97[qword_26AAE9618];
  *(void *)&v97[qword_26AAE9618] = 0;

  if ((v255[(void)v2] & 1) == 0)
  {
    v107 = sub_2214ADDC8();
    os_log_type_t v108 = sub_2214AE1B8();
    if (os_log_type_enabled(v107, v108))
    {
      v109 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v109 = 0;
      _os_log_impl(&dword_22149B000, v107, v108, "Voice not allowed to render speech! Will not set up synthesizer. Bailing now", v109, 2u);
      MEMORY[0x223C82360](v109, -1, -1);
    }
LABEL_85:
    swift_release();
    goto LABEL_86;
  }
  v255 = v97;
  uint64_t v235 = qword_26AAE95E8;
  uint64_t v99 = *(void *)&v97[qword_26AAE95E8];
  unint64_t v100 = 0x2645B3000uLL;
  uint64_t v236 = v94;
  if (v99)
  {
    uint64_t v101 = *(void **)&v255[qword_26AAE96E8];
    id v102 = v101;
    id v103 = objc_msgSend(v256, sel_voice);
    v104 = v103;
    if (v101)
    {
      if (v103)
      {
        sub_2214AD348(0, (unint64_t *)&unk_26AAE9490);
        id v105 = v102;
        char v106 = sub_2214AE258();

        if (v106) {
          goto LABEL_73;
        }
        goto LABEL_51;
      }
      v104 = v102;
    }
    else if (!v103)
    {
LABEL_73:
      id v167 = v256;
      id v168 = objc_msgSend(v256, sel_ssmlRepresentation);
      sub_2214ADFD8();

      v169 = v252;
      sub_2214ADD98();
      uint64_t v170 = sub_2214ADD88();
      v171 = v255;
      v172 = (uint64_t *)&v255[qword_26AAE9680];
      uint64_t v241 = v170;
      uint64_t *v172 = v170;
      v172[1] = v173;
      uint64_t v242 = v173;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      id v174 = objc_msgSend(v167, sel_ssmlRepresentation);
      uint64_t v175 = sub_2214ADFD8();
      uint64_t v177 = v176;

      id v28 = &v171[qword_26AAE96A8];
      void *v28 = v175;
      v28[1] = v177;
      swift_bridgeObjectRelease();
      uint64_t v178 = v28[1];
      if (!v178)
      {
LABEL_88:
        v195 = (void *)sub_2214ADD48();
        id v196 = v256;
        id v197 = objc_msgSend(v256, sel_ssmlRepresentation);
        uint64_t v198 = sub_2214ADFD8();
        uint64_t v200 = v199;

        v202 = v253;
        uint64_t v201 = v254;
        uint64_t *v253 = v198;
        v202[1] = v200;
        uint64_t v203 = v242;
        v202[2] = v241;
        v202[3] = v203;
        v246(v202, *MEMORY[0x263F7ED88], v201);
        swift_bridgeObjectRetain();
        id v204 = objc_msgSend(v196, sel_jobIdentifier);
        sub_2214ADFD8();

        sub_2214ADD38();
        swift_bridgeObjectRelease();
        v245(v202, v201);
        v205 = v255;
        v206 = &v255[qword_26AAE9698];
        *(void *)v206 = 0;
        v206[8] = 1;
        v207 = &v205[qword_26AAE9620];
        *(void *)v207 = 0;
        *((void *)v207 + 1) = 0;
        v207[16] = 1;
        v208 = *(void **)&v205[v235];
        if (v208)
        {
          id v209 = objc_msgSend(v208, sel_ruleSetRunner);
          uint64_t v210 = swift_allocObject();
          *(void *)(v210 + 16) = v196;
          v260 = sub_2214AB39C;
          uint64_t v261 = v210;
          *(void *)atoken.val = MEMORY[0x263EF8330];
          *(void *)&atoken.val[2] = 1107296256;
          *(void *)&atoken.val[4] = sub_2214A6464;
          *(void *)&atoken.val[6] = &block_descriptor_9;
          v211 = _Block_copy(&atoken);
          id v212 = v196;
          swift_release();
          objc_msgSend(v209, sel_setMatchLogger_, v211);
          _Block_release(v211);
        }
        uint64_t v213 = (uint64_t)v248;
        sub_2214ADC88();
        uint64_t v214 = sub_2214ADC98();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v214 - 8) + 56))(v213, 0, 1, v214);
        v215 = v255;
        v216 = &v255[qword_26AAE9608];
        swift_beginAccess();
        sub_2214AB3A4(v213, (uint64_t)v216);
        swift_endAccess();
        v217 = *(void **)&v215[v235];
        uint64_t v218 = v250;
        uint64_t v219 = v249;
        if (!v217)
        {
          (*(void (**)(char *, uint64_t))(v243 + 8))(v169, v250);
          swift_release();
          swift_bridgeObjectRelease();
          return;
        }
        v220 = &v215[qword_26AAE9580];
        uint64_t v221 = v238;
        v222 = *(void (**)(char *, unsigned char *, uint64_t))(v238 + 16);
        v223 = v237;
        v222(v237, v220, v249);
        id v224 = v217;
        sub_2214ADCB8();
        v225 = *(void (**)(char *, uint64_t))(v221 + 8);
        v225(v223, v219);
        if (*(uint64_t *)atoken.val <= 0)
        {
          id v230 = 0;
          v228 = v252;
          v229 = v255;
          goto LABEL_100;
        }
        id v226 = objc_msgSend(v224, sel_neuralStyles);
        sub_2214AD348(0, &qword_267F51708);
        uint64_t v227 = sub_2214AE148();

        v222(v223, v220, v219);
        sub_2214ADCB8();
        v225(v223, v219);
        if ((v227 & 0xC000000000000001) != 0)
        {
          id v230 = (id)MEMORY[0x223C81920](*(void *)atoken.val, v227);
          v228 = v252;
          v229 = v255;
          goto LABEL_96;
        }
        v228 = v252;
        v229 = v255;
        if ((*(void *)atoken.val & 0x8000000000000000) != 0)
        {
          __break(1u);
        }
        else if (*(void *)atoken.val < *(void *)((v227 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v230 = *(id *)(v227 + 8 * *(void *)atoken.val + 32);
LABEL_96:
          swift_bridgeObjectRelease();
          uint64_t v218 = v250;
LABEL_100:
          objc_msgSend(v224, sel_setCurrentNeuralStyle_, v230);

          v231 = (void *)sub_2214ADFC8();
          swift_bridgeObjectRelease();
          objc_msgSend(v224, sel_synthesizeString_, v231);

          (*(void (**)(char *, uint64_t))(v243 + 8))(v228, v218);
          v229[qword_26AAE9670] = 1;
          swift_release();
          return;
        }
        __break(1u);
        goto LABEL_106;
      }
      *(void *)atoken.val = *v28;
      *(void *)&atoken.val[2] = v178;
      uint64_t v179 = qword_267F51980;
      swift_bridgeObjectRetain();
      if (v179 == -1)
      {
LABEL_75:
        uint64_t v180 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F516E0);
        __swift_project_value_buffer(v180, (uint64_t)qword_267F51BA8);
        sub_2214AB2B0();
        sub_2214AB304(&qword_267F51720, &qword_267F516E0);
        uint64_t v181 = sub_2214ADFB8();
        swift_bridgeObjectRelease();
        v240 = (char *)v181;
        uint64_t v182 = *(void *)(v181 + 16);
        if (v182)
        {
          v183 = (unint64_t *)(v240 + 40);
          uint64_t v251 = v30;
          do
          {
            if (v28[1])
            {
              unint64_t v189 = *(v183 - 1);
              unint64_t v190 = *v183;
              sub_2214AE108();
              unint64_t v186 = *v28;
              unint64_t v191 = v28[1];
              if (v191)
              {
                *(void *)atoken.val = 0;
                *(void *)&atoken.val[2] = 0xE000000000000000;
                uint64_t v257 = 32;
                unint64_t v258 = 0xE100000000000000;
                sub_2214AB348();
                swift_bridgeObjectRetain();
                uint64_t v184 = sub_2214AE2B8();
                unint64_t v186 = sub_2214A5F54(v189, v190, v184, v185, v186, v191);
                uint64_t v188 = v187;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v188 = 0;
              }
              void *v28 = v186;
              v28[1] = v188;
              swift_bridgeObjectRelease();
            }
            v183 += 2;
            --v182;
          }
          while (v182);
        }
        swift_bridgeObjectRelease();
        v169 = v252;
        goto LABEL_88;
      }
LABEL_102:
      swift_once();
      goto LABEL_75;
    }
  }
LABEL_51:
  id v110 = v256;
  id v111 = objc_msgSend(v256, sel_voice);
  id v112 = v110;
  v113 = *(void **)&v255[qword_26AAE96E8];
  *(void *)&v255[qword_26AAE96E8] = v111;

  id v114 = objc_msgSend(v110, sel_voice);
  id v115 = objc_msgSend(v114, sel_identifier);

  uint64_t v116 = sub_2214ADFD8();
  v118 = v117;

  sub_2214A9124(v116, v118);
  uint64_t v234 = v119;
  unint64_t v121 = v120;
  swift_bridgeObjectRelease();
  if (!v121)
  {
    id v140 = v112;
    v107 = sub_2214ADDC8();
    os_log_type_t v141 = sub_2214AE1B8();
    if (!os_log_type_enabled(v107, v141))
    {
      swift_release();

      return;
    }
    v142 = (uint8_t *)swift_slowAlloc();
    uint64_t v143 = swift_slowAlloc();
    *(void *)atoken.val = v143;
    *(_DWORD *)v142 = 136315138;
    id v144 = [v140 (SEL)0x2645B336CLL];
    id v145 = objc_msgSend(v144, sel_identifier);

    uint64_t v146 = sub_2214ADFD8();
    unint64_t v148 = v147;

    uint64_t v257 = sub_2214AA8A4(v146, v148, (uint64_t *)&atoken);
    sub_2214AE288();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22149B000, v107, v141, "Voice %s not found or unavailable for use", v142, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C82360](v143, -1, -1);
    MEMORY[0x223C82360](v142, -1, -1);
    goto LABEL_85;
  }
  id v122 = objc_msgSend(self, sel_sharedInstance);
  id v123 = objc_msgSend(v112, sel_voice);
  id v124 = objc_msgSend(v123, sel_identifier);

  if (!v124)
  {
    sub_2214ADFD8();
    id v124 = (id)sub_2214ADFC8();
    swift_bridgeObjectRelease();
  }
  id v125 = objc_msgSend(v122, sel_resourceWithVoiceId_, v124);

  id v233 = v125;
  if (!v125)
  {
    uint64_t v139 = 0;
    goto LABEL_66;
  }
  id v126 = v125;
  id v127 = objc_msgSend(v126, sel_primaryLanguage);
  if (!v127)
  {
    sub_2214ADFD8();
    id v127 = (id)sub_2214ADFC8();
    swift_bridgeObjectRelease();
  }
  v128 = self;
  id v129 = objc_msgSend(v126, sel_speechVoice);
  id v130 = objc_msgSend(v129, sel_voiceType);

  id v131 = objc_msgSend(v128, sel_effectiveResourceForLanguageCode_andVoiceType_, v127, v130);
  if (!v131)
  {

    uint64_t v139 = 0;
    unint64_t v100 = 0x2645B3000uLL;
    goto LABEL_66;
  }
  id v132 = objc_msgSend(v131, sel_searchPathURL);

  if (!v132)
  {
LABEL_107:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v241 + 56))(v240, 1, 1, v242);
    goto LABEL_108;
  }
  v133 = v239;
  sub_2214ADBE8();

  uint64_t v134 = v241;
  v135 = v240;
  v136 = v133;
  uint64_t v137 = v242;
  (*(void (**)(char *, char *, uint64_t))(v241 + 32))(v240, v136, v242);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v134 + 56))(v135, 0, 1, v137);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v134 + 48))(v135, 1, v137) != 1)
  {
    sub_2214ADBF8();
    uint64_t v139 = v138;

    (*(void (**)(char *, uint64_t))(v134 + 8))(v135, v137);
    unint64_t v100 = 0x2645B3000;
    id v112 = v256;
LABEL_66:
    id v149 = [v112 *(SEL *)(v100 + 3272)];
    id v150 = objc_msgSend(v149, sel_primaryLanguages);

    uint64_t v151 = sub_2214AE148();
    uint64_t v152 = v30;
    if (*(void *)(v151 + 16)) {
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    char v153 = _AXSSpeechSynthesisOptions();
    v154 = v255;
    swift_bridgeObjectRetain();
    v155 = (void *)sub_2214ADFC8();
    swift_bridgeObjectRelease();
    v156 = (void *)sub_2214ADFC8();
    swift_bridgeObjectRelease();
    if (v139)
    {
      v157 = (void *)sub_2214ADFC8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v157 = 0;
    }
    id v158 = objc_msgSend(objc_allocWithZone((Class)TTSSiriSynthWrapper), sel_initWithVoicePath_language_censorPlainText_delegate_feResourcePath_, v155, v156, (v153 & 1) == 0, v154, v157);

    v159 = v255;
    uint64_t v160 = v235;
    v161 = *(void **)&v255[v235];
    *(void *)&v255[v235] = v158;

    if (*(void *)&v159[v160])
    {
      swift_bridgeObjectRelease();
      id v162 = objc_msgSend(v256, sel_voice);
      id v163 = objc_msgSend(v162, sel_identifier);

      uint64_t v164 = sub_2214ADFD8();
      uint64_t v166 = v165;

      (*(void (**)(uint64_t, uint64_t))(class metadata base offset for TTSSiriSynthAudioUnit
                                               + (*MEMORY[0x263F8EED0] & *v154)
                                               + 928))(v164, v166);
      swift_bridgeObjectRelease();

      uint64_t v30 = v152;
      goto LABEL_73;
    }
    swift_bridgeObjectRetain();
    v107 = sub_2214ADDC8();
    os_log_type_t v192 = sub_2214AE1B8();
    if (!os_log_type_enabled(v107, v192))
    {
      swift_release();

      swift_bridgeObjectRelease_n();
      return;
    }
    v193 = (uint8_t *)swift_slowAlloc();
    uint64_t v194 = swift_slowAlloc();
    *(void *)atoken.val = v194;
    *(_DWORD *)v193 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v257 = sub_2214AA8A4(v234, v121, (uint64_t *)&atoken);
    sub_2214AE288();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22149B000, v107, v192, "SiriTTSSynthesizer failed to initialize with voice path %s", v193, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C82360](v194, -1, -1);
    MEMORY[0x223C82360](v193, -1, -1);
    swift_release();

LABEL_86:
    return;
  }
LABEL_108:
  __break(1u);
}

uint64_t sub_2214A5F2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2214A5F54(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  swift_bridgeObjectRetain();
  sub_2214AE278();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if ((v13 & 0x1000000000000000) != 0) {
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  sub_2214AE278();
  uint64_t v15 = v14;
  uint64_t result = swift_bridgeObjectRelease();
  if ((v15 & 0x1000000000000000) != 0) {
    goto LABEL_25;
  }
  uint64_t v17 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0) {
    LOBYTE(v17) = 1;
  }
  uint64_t v18 = 4 << v17;
  unint64_t v19 = a1;
  if ((a1 & 0xC) == 4 << v17)
  {
    uint64_t result = sub_2214AADAC(a1, a5, a6);
    unint64_t v19 = result;
  }
  uint64_t v40 = a3;
  unint64_t v20 = a2;
  unint64_t v21 = a5 & 0x800000000000000;
  if ((a6 & 0x1000000000000000) != 0)
  {
    uint64_t v23 = a6 & 0x2000000000000000;
    uint64_t v25 = a5 & 0xFFFFFFFFFFFFLL;
    unint64_t v24 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) != 0) {
      unint64_t v32 = HIBYTE(a6) & 0xF;
    }
    else {
      unint64_t v32 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (v32 < v19 >> 16) {
      goto LABEL_43;
    }
    uint64_t result = sub_2214AE0C8();
    uint64_t v22 = result;
    if (v21) {
      uint64_t v26 = 7;
    }
    else {
      uint64_t v26 = 11;
    }
  }
  else
  {
    uint64_t v22 = v19 >> 16;
    uint64_t v23 = a6 & 0x2000000000000000;
    unint64_t v24 = HIBYTE(a6) & 0xF;
    uint64_t v25 = a5 & 0xFFFFFFFFFFFFLL;
    uint64_t v26 = 7;
  }
  if (!v23) {
    unint64_t v24 = v25;
  }
  uint64_t v27 = 4 << (v21 >> 59);
  unint64_t v28 = v26 | (v24 << 16);
  a2 = v20;
  if ((a6 & 0x1000000000000000) == 0) {
    uint64_t v27 = 8;
  }
  unint64_t v29 = v20;
  if ((v20 & 0xC) == v27)
  {
    unint64_t v33 = v20;
    uint64_t v34 = v22;
    uint64_t result = sub_2214AADAC(v33, a5, a6);
    uint64_t v22 = v34;
    unint64_t v29 = result;
  }
  if ((v26 & 0xC) == v18)
  {
    unint64_t v35 = v26 | (v24 << 16);
    uint64_t v36 = v22;
    uint64_t result = sub_2214AADAC(v35, a5, a6);
    uint64_t v22 = v36;
    unint64_t v28 = result;
    if ((a6 & 0x1000000000000000) == 0)
    {
LABEL_17:
      uint64_t v30 = (v28 >> 16) - (v29 >> 16);
      if ((a4 & 0x1000000000000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
    goto LABEL_17;
  }
  if (v24 < v29 >> 16)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v24 >= v28 >> 16)
  {
    uint64_t v37 = v22;
    uint64_t v38 = sub_2214AE0C8();
    uint64_t v22 = v37;
    uint64_t v30 = v38;
    if ((a4 & 0x1000000000000000) == 0)
    {
LABEL_18:
      if ((a4 & 0x2000000000000000) != 0)
      {
        uint64_t result = HIBYTE(a4) & 0xF;
        uint64_t v31 = v22 + result;
        if (!__OFADD__(v22, result)) {
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t result = v40 & 0xFFFFFFFFFFFFLL;
        uint64_t v31 = v22 + (v40 & 0xFFFFFFFFFFFFLL);
        if (!__OFADD__(v22, v40 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_23;
        }
      }
      goto LABEL_39;
    }
LABEL_37:
    uint64_t v39 = v22;
    uint64_t result = sub_2214AE0A8();
    uint64_t v31 = v39 + result;
    if (!__OFADD__(v39, result))
    {
LABEL_23:
      uint64_t result = v31 + v30;
      if (!__OFADD__(v31, v30))
      {
        MEMORY[0x223C81630](result);
LABEL_25:
        sub_2214AE118();
        sub_2214AD384();
        sub_2214AE078();
        swift_bridgeObjectRelease();
        sub_2214AE078();
        sub_2214AA748(a2, a5, a6);
        sub_2214AE078();
        swift_bridgeObjectRelease();
        return 0;
      }
      goto LABEL_40;
    }
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_2214A629C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8)
{
  uint64_t v26 = a4;
  id v27 = a8;
  uint64_t v24 = a5;
  uint64_t v25 = a3;
  uint64_t v12 = sub_2214ADD28();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (uint64_t *)((char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_2214ADD58();
  uint64_t v16 = (void *)sub_2214ADD48();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v17 = objc_msgSend(a7, sel_identifier);
  uint64_t v18 = sub_2214ADFD8();
  uint64_t v20 = v19;

  void *v15 = a1;
  v15[1] = a2;
  _OWORD v15[2] = v24;
  v15[3] = a6;
  uint64_t v21 = v26;
  v15[4] = v25;
  v15[5] = v21;
  v15[6] = v18;
  v15[7] = v20;
  (*(void (**)(void *, void, uint64_t))(v13 + 104))(v15, *MEMORY[0x263F7ED68], v12);
  id v22 = objc_msgSend(v27, sel_jobIdentifier);
  sub_2214ADFD8();

  sub_2214ADD38();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_2214A6464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))(a1 + 32);
  uint64_t v10 = sub_2214ADFD8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_2214ADFD8();
  uint64_t v15 = v14;
  swift_retain();
  id v16 = a6;
  v9(v10, v12, a3, a4, v13, v15, v16);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_2214A6540(void *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = a3;
  id v5 = a1;
  sub_2214A3EA8(v4);
}

id sub_2214A65A8()
{
  uint64_t v0 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3[4] = sub_2214ACE14;
  v3[5] = v0;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 1107296256;
  v3[2] = sub_2214A6674;
  v3[3] = &block_descriptor_54;
  uint64_t v1 = _Block_copy(v3);
  swift_release();
  return v1;
}

uint64_t sub_2214A6674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *aBlock)
{
  uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t))(a1 + 32);
  uint64_t v15 = _Block_copy(aBlock);
  if (v15)
  {
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v15;
    uint64_t v15 = sub_2214ACE5C;
  }
  else
  {
    uint64_t v16 = 0;
  }
  swift_retain();
  uint64_t v17 = v14(a2, a3, a4, a5, a6, a7, v15, v16);
  sub_2214AD774((uint64_t)v15);
  swift_release();
  return v17;
}

uint64_t sub_2214A6760(_DWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_2214ADF68();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  uint64_t v11 = (uint64_t)v136 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v13 = (char *)v136 - v12;
  swift_beginAccess();
  uint64_t v14 = MEMORY[0x223C823B0](a4 + 16);
  if (!v14) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v15 = (unsigned char *)v14;
  sub_2214ADF78();
  uint64_t v16 = (void (*)(uint64_t *, void))sub_2214ADF88();
  *(_DWORD *)(v17 + 4) = 0;
  v16(&aBlock, 0);
  uint64_t v18 = (void (*)(uint64_t *, void))sub_2214ADF88();
  _DWORD *v19 = 1;
  v18(&aBlock, 0);
  uint64_t v146 = v13;
  uint64_t v21 = (void (*)(uint64_t *, void))sub_2214ADF98();
  if (!v20)
  {
    v21(&aBlock, 0);
    if (qword_26AAE9570 != -1) {
      goto LABEL_80;
    }
    goto LABEL_19;
  }
  id v22 = v20;
  v21(&aBlock, 0);
  bzero(v22, 4 * a2);
  if ((v15[qword_26AAE95A0] & 1) == 0)
  {
    if (qword_26AAE9570 != -1) {
      goto LABEL_82;
    }
    goto LABEL_23;
  }
  sub_2214ADF78();
  uint64_t v23 = (void (*)(uint64_t *, void))sub_2214ADF98();
  uint64_t v25 = v24;
  v23(&aBlock, 0);
  unint64_t v28 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v27 = v8 + 8;
  uint64_t v26 = v28;
  v28((char *)v11, v7);
  if (!v25)
  {
    unsigned int v53 = v26;
    unsigned int v54 = v146;
    if (qword_26AAE9570 != -1) {
      swift_once();
    }
    uint64_t v55 = sub_2214ADDE8();
    __swift_project_value_buffer(v55, (uint64_t)qword_26AAE9558);
    unsigned int v56 = sub_2214ADDC8();
    os_log_type_t v57 = sub_2214AE1B8();
    if (os_log_type_enabled(v56, v57))
    {
      unsigned int v58 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unsigned int v58 = 0;
      _os_log_impl(&dword_22149B000, v56, v57, "could not get audio buffer to fill", v58, 2u);
      uint64_t v59 = v58;
      unsigned int v54 = v146;
      MEMORY[0x223C82360](v59, -1, -1);
    }

    v53(v54, v7);
    return 0xFFFFFFFFLL;
  }
  uint64_t v142 = v27;
  unsigned int v161 = 0;
  uint64_t v145 = v7;
  os_log_type_t v141 = v26;
  if (a2)
  {
    uint64_t v29 = qword_26AAE9618;
    uint64_t v8 = qword_26AAE96C0;
    uint64_t v7 = 0x2645B3000uLL;
    do
    {
      unint64_t v32 = *(void **)&v15[v29];
      if (v32)
      {
        id v33 = v32;
        uint64_t v34 = *(objc_msgSend(v33, sel_mutableAudioBufferList) + 2);
        if (!v34)
        {
          if (qword_26AAE9570 != -1) {
            swift_once();
          }
          uint64_t v110 = sub_2214ADDE8();
          __swift_project_value_buffer(v110, (uint64_t)qword_26AAE9558);
          id v111 = sub_2214ADDC8();
          os_log_type_t v112 = sub_2214AE1B8();
          BOOL v113 = os_log_type_enabled(v111, v112);
          uint64_t v114 = v145;
          if (v113)
          {
            id v115 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v115 = 0;
            _os_log_impl(&dword_22149B000, v111, v112, "Failed to get source buffer to fill from", v115, 2u);
            MEMORY[0x223C82360](v115, -1, -1);
          }

          v141(v146, v114);
          return 0xFFFFFFFFLL;
        }
        uint64_t v11 = *(void *)&v15[v8];
        if (v11 >= objc_msgSend(v33, sel_frameLength))
        {
          *(void *)&v15[v8] = 0;
          uint64_t v30 = *(void **)&v15[v29];
          *(void *)&v15[v29] = 0;

          LODWORD(v31) = v161;
        }
        else
        {
          *(_DWORD *)(v25 + 4 * v161) = *(_DWORD *)(v34 + 4 * *(void *)&v15[v8]);

          LODWORD(v31) = v161 + 1;
          if (v161 == -1)
          {
            __break(1u);
LABEL_79:
            __break(1u);
LABEL_80:
            swift_once();
LABEL_19:
            uint64_t v41 = sub_2214ADDE8();
            __swift_project_value_buffer(v41, (uint64_t)qword_26AAE9558);
            uint64_t v42 = sub_2214ADDC8();
            os_log_type_t v43 = sub_2214AE1B8();
            if (os_log_type_enabled(v42, v43))
            {
              uint64_t v44 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v44 = 0;
              _os_log_impl(&dword_22149B000, v42, v43, "could not get audio buffer to zero", v44, 2u);
              MEMORY[0x223C82360](v44, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v8 + 8))(v146, v7);
            return 0xFFFFFFFFLL;
          }
          ++v161;
          uint64_t v35 = *(void *)&v15[v8];
          BOOL v36 = __OFADD__(v35, 1);
          uint64_t v37 = v35 + 1;
          if (v36) {
            goto LABEL_79;
          }
          *(void *)&v15[v8] = v37;
        }
      }
      else
      {
        id v38 = sub_2214A8180();
        uint64_t v39 = *(void **)&v15[v29];
        *(void *)&v15[v29] = v38;

        *(void *)&v15[v8] = 0;
        uint64_t v31 = v161;
        if (!*(void *)&v15[v29])
        {
          *a1 = 128;
          *(_DWORD *)(v25 + 4 * v31) = 0;
          BOOL v40 = __CFADD__(v31, 1);
          LODWORD(v31) = v31 + 1;
          if (v40)
          {
            __break(1u);
LABEL_82:
            swift_once();
LABEL_23:
            uint64_t v45 = sub_2214ADDE8();
            __swift_project_value_buffer(v45, (uint64_t)qword_26AAE9558);
            id v46 = sub_2214ADDC8();
            os_log_type_t v47 = sub_2214AE1C8();
            BOOL v48 = os_log_type_enabled(v46, v47);
            uint64_t v49 = v146;
            if (v48)
            {
              os_log_type_t v50 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)os_log_type_t v50 = 0;
              _os_log_impl(&dword_22149B000, v46, v47, "In render block but not allowed to render. Returning immediately with action complete", v50, 2u);
              MEMORY[0x223C82360](v50, -1, -1);
            }

            *a1 = 128;
            (*(void (**)(char *, uint64_t))(v8 + 8))(v49, v7);
            return 0xFFFFFFFFLL;
          }
          unsigned int v161 = v31;
        }
      }
    }
    while (v31 < a2);
    uint64_t v159 = 0;
    uint64_t v160 = MEMORY[0x263F8EE78];
    if (v31 >> 30)
    {
LABEL_103:
      uint64_t result = sub_2214AE3A8();
      __break(1u);
      return result;
    }
    int v60 = 4 * v31;
    uint64_t v7 = v145;
  }
  else
  {
    int v60 = 0;
    uint64_t v159 = 0;
    uint64_t v160 = MEMORY[0x263F8EE78];
  }
  p_uint64_t aBlock = &aBlock;
  uint64_t v62 = (void (*)(uint64_t *, void))sub_2214ADF88();
  *(_DWORD *)(v63 + 4) = v60;
  v62(&aBlock, 0);
  os_log_type_t v64 = *(NSObject **)&v15[qword_26AAE95D0];
  uint64_t v65 = (void *)swift_allocObject();
  v65[2] = v15;
  v65[3] = &v161;
  v65[4] = &v160;
  v65[5] = &v159;
  uint64_t v66 = swift_allocObject();
  *(void *)(v66 + 16) = sub_2214AD130;
  *(void *)(v66 + 24) = v65;
  v157 = sub_2214AD99C;
  uint64_t v158 = v66;
  uint64_t aBlock = MEMORY[0x263EF8330];
  unint64_t v154 = 1107296256;
  v155 = sub_2214A5F2C;
  v156 = &block_descriptor_80;
  unsigned int v67 = _Block_copy(&aBlock);
  id v144 = v15;
  swift_retain();
  swift_release();
  dispatch_sync(v64, v67);
  _Block_release(v67);
  LOBYTE(v64) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if (v64)
  {
    __break(1u);
    goto LABEL_84;
  }
  uint64_t v138 = v65;
  unint64_t v68 = MEMORY[0x263F8EE78];
  unint64_t v152 = MEMORY[0x263F8EE78];
  uint64_t v69 = v160;
  uint64_t v70 = *(void *)(v160 + 16);
  if (!v70)
  {
LABEL_59:
    p_uint64_t aBlock = (uint64_t *)(v68 >> 62);
    uint64_t v11 = v68;
    if (!(v68 >> 62))
    {
      uint64_t v99 = v144;
      if (!*(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_85;
      }
      goto LABEL_61;
    }
LABEL_84:
    swift_bridgeObjectRetain();
    uint64_t v116 = sub_2214AE3B8();
    swift_bridgeObjectRelease();
    uint64_t v99 = v144;
    if (!v116) {
      goto LABEL_85;
    }
LABEL_61:
    uint64_t v95 = *(char **)&v99[qword_26AAE9650];
    if (v95)
    {
      uint64_t aBlock = 10;
      unint64_t v154 = 0xE100000000000000;
      uint64_t v143 = v95;
      if (p_aBlock) {
        goto LABEL_87;
      }
      uint64_t v100 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v101 = v95;
      swift_bridgeObjectRetain();
      uint64_t v102 = v11;
      if (!v100) {
        goto LABEL_88;
      }
      goto LABEL_64;
    }
LABEL_85:
    swift_bridgeObjectRelease();
    goto LABEL_97;
  }
  unsigned int v71 = (uint64_t *)&v144[qword_26AAE96A8];
  unsigned int v72 = &v144[qword_26AAE9680];
  uint64_t v139 = &v144[qword_26AAE9698];
  uint64_t v143 = &v144[qword_26AAE9620];
  uint64_t v137 = qword_26AAE95E0;
  swift_bridgeObjectRetain();
  v136[1] = v69;
  uint64_t v73 = v69 + 36;
  id v140 = v72;
  while (1)
  {
    if (*(unsigned char *)(v73 - 4)) {
      goto LABEL_40;
    }
    unint64_t v74 = v71[1];
    if (!v74 || !*((void *)v72 + 1)) {
      goto LABEL_40;
    }
    uint64_t v75 = *v71;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2214AE188();
    if ((v76 & 1) == 0) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = v145;
LABEL_40:
    v73 += 16;
    if (!--v70)
    {
      swift_bridgeObjectRelease();
      unint64_t v68 = v152;
      goto LABEL_59;
    }
  }
  uint64_t v77 = sub_2214AE118();
  uint64_t v79 = v78;
  uint64_t v81 = v80;
  uint64_t v83 = v82;
  swift_bridgeObjectRelease();
  MEMORY[0x223C81620](v77, v79, v81, v83);
  uint64_t v11 = v84;
  swift_bridgeObjectRelease();
  unsigned int v85 = (void *)sub_2214ADFC8();
  swift_bridgeObjectRelease();
  id v86 = objc_msgSend(v85, sel_xmlEscaped);

  uint64_t v87 = sub_2214ADFD8();
  uint64_t v89 = v88;

  v90 = v139;
  sub_2214A7AC4(v87, v89, *(void *)v139, v139[8], v75, v74);
  if (v91)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v7 = v145;
    unsigned int v72 = v140;
    goto LABEL_40;
  }
  sub_2214AE058();
  *(void *)v90 = sub_2214AE068();
  v90[8] = 0;
  uint64_t aBlock = v75;
  unint64_t v154 = v74;
  sub_2214AB348();
  uint64_t v92 = sub_2214AE048();
  swift_bridgeObjectRelease();
  if ((v89 & 0x1000000000000000) != 0) {
    uint64_t v93 = sub_2214AE0D8();
  }
  else {
    uint64_t v93 = sub_2214AE0E8();
  }
  uint64_t v94 = v93;
  uint64_t v7 = v145;
  unsigned int v72 = v140;
  swift_bridgeObjectRelease();
  if ((v143[16] & 1) == 0 && *(void *)v143 == v92 && *((void *)v143 + 1) == v94) {
    goto LABEL_40;
  }
  uint64_t v96 = v143;
  *(void *)uint64_t v143 = v92;
  *((void *)v96 + 1) = v94;
  v96[16] = 0;
  uint64_t v97 = *(void *)&v144[v137];
  if ((unint64_t)(v97 - 0x2000000000000000) >> 62 == 3)
  {
    id v98 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EF9480]), sel_initWithMarkerType_forTextRange_atByteSampleOffset_, 1, v92, v94, 4 * v97);
    MEMORY[0x223C81720]();
    if (*(void *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v152 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_2214AE168();
    }
    sub_2214AE178();
    sub_2214AE158();

    goto LABEL_40;
  }
  __break(1u);
LABEL_87:
  v117 = v95;
  swift_bridgeObjectRetain();
  uint64_t v100 = sub_2214AE3B8();
  uint64_t v102 = v11;
  if (v100)
  {
LABEL_64:
    if (v100 >= 1)
    {
      uint64_t v103 = 0;
      unint64_t v104 = v102 & 0xC000000000000001;
      do
      {
        if (v104) {
          id v105 = (id)MEMORY[0x223C81920](v103);
        }
        else {
          id v105 = *(id *)(v102 + 8 * v103 + 32);
        }
        char v106 = v105;
        ++v103;
        uint64_t v149 = 0;
        unint64_t v150 = 0xE000000000000000;
        sub_2214AE308();
        swift_bridgeObjectRelease();
        uint64_t v149 = 0x2064726F57202020;
        unint64_t v150 = 0xE800000000000000;
        v162.location = (NSUInteger)objc_msgSend(v106, sel_textRange);
        v107 = NSStringFromRange(v162);
        sub_2214ADFD8();

        sub_2214AE088();
        swift_bridgeObjectRelease();
        sub_2214AE088();
        id v108 = objc_msgSend(v106, sel_byteSampleOffset);
        if ((uint64_t)v108 >= 0) {
          uint64_t v109 = (uint64_t)v108;
        }
        else {
          uint64_t v109 = (uint64_t)v108 + 1;
        }
        uint64_t v148 = v109 >> 1;
        sub_2214AE3E8();
        sub_2214AE088();
        swift_bridgeObjectRelease();
        sub_2214AE088();
        sub_2214AE088();

        swift_bridgeObjectRelease();
        uint64_t v102 = v11;
      }
      while (v100 != v103);
      goto LABEL_88;
    }
    __break(1u);
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
LABEL_88:
  swift_bridgeObjectRelease();
  if (qword_26AAE9570 != -1) {
    goto LABEL_100;
  }
  while (1)
  {
    uint64_t v118 = sub_2214ADDE8();
    __swift_project_value_buffer(v118, (uint64_t)qword_26AAE9558);
    uint64_t v119 = aBlock;
    unint64_t v120 = v154;
    unint64_t v121 = v144;
    swift_bridgeObjectRetain();
    id v122 = sub_2214ADDC8();
    os_log_type_t v123 = sub_2214AE1A8();
    if (os_log_type_enabled(v122, v123))
    {
      uint64_t v124 = swift_slowAlloc();
      uint64_t v125 = swift_slowAlloc();
      uint64_t v151 = v125;
      *(_DWORD *)uint64_t v124 = 134218754;
      uint64_t v126 = qword_26AAE95E0;
      uint64_t v127 = *(void *)&v121[qword_26AAE95E0];

      uint64_t v149 = v127;
      sub_2214AE288();

      *(_WORD *)(v124 + 12) = 2048;
      uint64_t v128 = *(void *)&v121[v126];
      swift_beginAccess();
      uint64_t v129 = v161;

      if (__OFADD__(v128, v129)) {
        goto LABEL_102;
      }
      uint64_t v148 = v128 + v129;
      sub_2214AE288();

      *(_WORD *)(v124 + 22) = 2048;
      swift_beginAccess();
      uint64_t v147 = v159;
      sub_2214AE288();
      *(_WORD *)(v124 + 32) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v147 = sub_2214AA8A4(v119, v120, &v151);
      sub_2214AE288();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_22149B000, v122, v123, "Markers for [%ld..<%ld] (%ld remaining): \n%s", (uint8_t *)v124, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x223C82360](v125, -1, -1);
      MEMORY[0x223C82360](v124, -1, -1);
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v7 = v145;
    id v130 = objc_msgSend(v121, sel_speechSynthesisOutputMetadataBlock);
    if (v130)
    {
      id v131 = (void (**)(void, void, void))v130;
      _Block_copy(v130);
      sub_2214AD348(0, &qword_267F51878);
      id v132 = (void *)sub_2214AE138();
      v133 = v143;
      ((void (**)(void, void *, char *))v131)[2](v131, v132, v143);

      _Block_release(v131);
      _Block_release(v131);
      swift_bridgeObjectRelease();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
    uint64_t v99 = v144;
LABEL_97:
    swift_beginAccess();
    uint64_t v134 = *(void *)&v99[qword_26AAE95E0];
    v135 = v146;
    if (!__OFADD__(v134, v161)) {
      break;
    }
    __break(1u);
LABEL_100:
    swift_once();
  }
  *(void *)&v99[qword_26AAE95E0] = v134 + v161;
  uint64_t v51 = sub_2214ADEE8();

  v141(v135, v7);
  swift_release();
  swift_bridgeObjectRelease();
  return v51;
}

uint64_t sub_2214A797C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(void *)(a1 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
  if (v4 <= v5) {
    int64_t v14 = v4 + v2;
  }
  else {
    int64_t v14 = v4;
  }
  uint64_t v3 = sub_2214AA794(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(void *)(a1 + 16))
  {
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_5:
  uint64_t v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = &v3[2 * v8 + 4];
  if (a1 + 32 < (unint64_t)&v9[2 * v2] && (unint64_t)v9 < a1 + 32 + 16 * v2) {
    goto LABEL_24;
  }
  memcpy(v9, (const void *)(a1 + 32), 16 * v2);
  if (!v2)
  {
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v11 = v3[2];
  BOOL v12 = __OFADD__(v11, v2);
  uint64_t v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_2214AE3D8();
  __break(1u);
  return result;
}

uint64_t sub_2214A7AC4(uint64_t a1, uint64_t a2, unint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F51730);
  MEMORY[0x270FA5388](v12 - 8);
  int64_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    uint64_t v30 = a5;
    unint64_t v31 = a6;
    uint64_t v28 = a1;
    uint64_t v29 = a2;
    uint64_t v22 = sub_2214ADCA8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v14, 1, 1, v22);
    sub_2214AB348();
  }
  else
  {
    uint64_t v15 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v15 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (a3 >> 14 >= 4 * v15) {
      return 0;
    }
    uint64_t v30 = a5;
    unint64_t v31 = a6;
    uint64_t v28 = a1;
    uint64_t v29 = a2;
    uint64_t v16 = sub_2214ADCA8();
    uint64_t v17 = *(void *)(v16 - 8);
    uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    uint64_t v26 = v17 + 56;
    uint64_t v27 = v18;
    v18(v14, 1, 1, v16);
    sub_2214AB348();
    uint64_t v19 = sub_2214AE2A8();
    char v21 = v20;
    sub_2214AD4E8((uint64_t)v14, &qword_267F51730);
    if ((v21 & 1) == 0) {
      return v19;
    }
    uint64_t v30 = a5;
    unint64_t v31 = a6;
    uint64_t v28 = a1;
    uint64_t v29 = a2;
    v27(v14, 1, 1, v16);
  }
  uint64_t v19 = sub_2214AE2A8();
  char v24 = v23;
  sub_2214AD4E8((uint64_t)v14, &qword_267F51730);
  if (v24) {
    return 0;
  }
  return v19;
}

uint64_t sub_2214A7D5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2214ADD28();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  int64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2214ADD58();
  uint64_t v6 = (void *)sub_2214ADD48();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F7ED70], v2);
  uint64_t v7 = *(void **)&v1[qword_26AAE9650];
  if (v7)
  {
    id v8 = objc_msgSend(v7, sel_jobIdentifier);
    sub_2214ADFD8();
  }
  sub_2214ADD38();
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(*(id *)&v1[qword_26AAE95E8], sel_stopSynthesis);
  uint64_t v9 = (os_unfair_lock_s *)(*(void *)&v1[qword_26AAE95B8] + 16);
  os_unfair_lock_lock(v9);
  uint64_t v10 = &v1[qword_26AAE9630];
  swift_beginAccess();
  *(void *)uint64_t v10 = MEMORY[0x263F8EE78];
  swift_bridgeObjectRelease();
  uint64_t v11 = qword_26AAE9618;
  uint64_t v12 = *(void **)&v1[qword_26AAE9618];
  *(void *)&v1[qword_26AAE9618] = 0;

  uint64_t v13 = *(NSObject **)&v1[qword_26AAE95D0];
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v1;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_2214AB25C;
  *(void *)(v15 + 24) = v14;
  aBlock[4] = sub_2214AD99C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2214A5F2C;
  aBlock[3] = &block_descriptor_22;
  uint64_t v16 = _Block_copy(aBlock);
  uint64_t v17 = v1;
  swift_retain();
  swift_release();
  dispatch_sync(v13, v16);
  _Block_release(v16);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if (v13)
  {
    __break(1u);
  }
  else
  {
    *(void *)&v17[qword_26AAE96C0] = 0;
    uint64_t v19 = *(void **)&v1[v11];
    *(void *)&v1[v11] = 0;

    objc_msgSend(*(id *)&v17[qword_26AAE9648], sel_broadcast);
    os_unfair_lock_unlock(v9);
    return swift_release();
  }
  return result;
}

void sub_2214A80A4(void *a1)
{
  id v1 = a1;
  sub_2214A7D5C();
}

void sub_2214A80EC()
{
  *(unsigned char *)(v0 + qword_26AAE9670) = 0;
}

uint64_t sub_2214A80FC(uint64_t result)
{
  *(unsigned char *)(result + qword_26AAE9670) = 0;
  return result;
}

void sub_2214A810C(uint64_t a1, char a2)
{
}

void sub_2214A8114(void *a1, uint64_t a2, void *a3, char a4)
{
  id v6 = a3;
  id v7 = a1;
  sub_2214ABBAC(a4);
}

id sub_2214A8180()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2214ADC98();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v4);
  id v8 = &v23[-v7];
  uint64_t v9 = (os_unfair_lock_s *)(*(void *)(v0 + qword_26AAE95B8) + 16);
  os_unfair_lock_lock(v9);
  uint64_t v10 = (void *)(v0 + qword_26AAE9630);
  swift_beginAccess();
  if (!(*v10 >> 62))
  {
    if (*(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_3;
    }
LABEL_14:
    id v11 = 0;
LABEL_15:
    os_unfair_lock_unlock(v9);
    uint64_t v14 = *(void **)(v1 + qword_26AAE95E8);
    if (v14)
    {
      unsigned int v15 = objc_msgSend(v14, sel_synthesizing);
      if (!v11)
      {
        if (v15)
        {
          id v16 = objc_msgSend(*(id *)(v1 + qword_26AAE9648), sel_wait);
          return (id)sub_2214A8180(v16);
        }
LABEL_20:
        if (*(unsigned char *)(v1 + qword_26AAE9670) != 1) {
          return 0;
        }
        uint64_t v17 = *(void **)(v1 + qword_26AAE9648);
        sub_2214ADC58();
        sub_2214ADC68();
        uint64_t v18 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
        v18(v6, v2);
        uint64_t v19 = (void *)sub_2214ADC48();
        v18(v8, v2);
        objc_msgSend(v17, sel_waitUntilDate_, v19);

        return (id)sub_2214A8180(v16);
      }
    }
    else if (!v11)
    {
      goto LABEL_20;
    }
    return v11;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_2214AE3B8();
  swift_bridgeObjectRelease();
  if (!v13) {
    goto LABEL_14;
  }
LABEL_3:
  swift_beginAccess();
  id v11 = (id)*v10;
  if (!(*v10 >> 62))
  {
    if (*(void *)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_5;
    }
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_2214AE3B8();
  swift_bridgeObjectRelease();
  if (!v20) {
    goto LABEL_26;
  }
LABEL_5:
  id v11 = (id)*v10;
  if (!(*v10 >> 62))
  {
    if (*(void *)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_7;
    }
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2214AE3B8();
  swift_bridgeObjectRelease();
  if (!v21) {
    goto LABEL_28;
  }
LABEL_7:
  if (((unint64_t)v11 & 0xC000000000000001) != 0)
  {
LABEL_29:
    id result = (id)MEMORY[0x223C81920](0, v11);
    goto LABEL_10;
  }
  if (!*(void *)(((unint64_t)v11 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_2214AE3B8();
    id result = (id)swift_bridgeObjectRelease();
    if (v22) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
  id result = *((id *)v11 + 4);
LABEL_10:
  id v11 = result;
  if (*v10 >> 62) {
    goto LABEL_31;
  }
  if (*(void *)((*v10 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_12:
    sub_2214AB4B0(0, 1);
    swift_endAccess();
    goto LABEL_15;
  }
LABEL_32:
  __break(1u);
  return result;
}

void sub_2214A8504(uint64_t a1, void *a2)
{
}

void sub_2214A850C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  sub_2214ABCE4(v7);
}

uint64_t sub_2214A8584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2214AC0F0(a2, a3);
}

void sub_2214A8590(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8 = a3;
  id v9 = a1;
  sub_2214AC0F0(a4, a5);
}

void sub_2214A8604()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_2214ADF48();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  id v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v8 = (char *)&v34 - v7;
  if ((TTSVBHasDeviceBeenUnlockedSinceBoot() & 1) == 0)
  {
    if (qword_26AAE9570 != -1) {
      swift_once();
    }
    uint64_t v16 = sub_2214ADDE8();
    __swift_project_value_buffer(v16, (uint64_t)qword_26AAE9558);
    uint64_t v17 = sub_2214ADDC8();
    os_log_type_t v18 = sub_2214AE1C8();
    if (!os_log_type_enabled(v17, v18)) {
      goto LABEL_16;
    }
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    uint64_t v20 = "Device has not been unlocked yet. Will not fetch personal voices";
    goto LABEL_15;
  }
  uint64_t v9 = qword_26AAE9690;
  if (*(uint64_t *)&v0[qword_26AAE9690] >= 5)
  {
    if (qword_26AAE9570 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_2214ADDE8();
    __swift_project_value_buffer(v21, (uint64_t)qword_26AAE9558);
    uint64_t v17 = sub_2214ADDC8();
    os_log_type_t v18 = sub_2214AE1B8();
    if (!os_log_type_enabled(v17, v18)) {
      goto LABEL_16;
    }
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    uint64_t v20 = "Asking for personal voices too many times without any any responses. Will not continue asking to avoid leaking ports";
LABEL_15:
    _os_log_impl(&dword_22149B000, v17, v18, v20, v19, 2u);
    MEMORY[0x223C82360](v19, -1, -1);
LABEL_16:

    return;
  }
  dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
  if (qword_26AAE9570 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_2214ADDE8();
  uint64_t v11 = __swift_project_value_buffer(v10, (uint64_t)qword_26AAE9558);
  uint64_t v12 = v1;
  uint64_t v34 = v11;
  uint64_t v13 = sub_2214ADDC8();
  os_log_type_t v14 = sub_2214AE1C8();
  if (os_log_type_enabled(v13, v14))
  {
    unsigned int v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unsigned int v15 = 134217984;
    uint64_t v36 = *(void *)&v1[v9];
    sub_2214AE288();

    _os_log_impl(&dword_22149B000, v13, v14, "Will fetch personal voices from service. FetchCount=%ld", v15, 0xCu);
    MEMORY[0x223C82360](v15, -1, -1);
  }
  else
  {
  }
  uint64_t v22 = *(void *)&v1[v9];
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(void *)&v1[v9] = v24;
    sub_2214A2A08();
    uint64_t v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v26 = swift_allocObject();
    dispatch_semaphore_t v27 = v35;
    *(void *)(v26 + 16) = v25;
    *(void *)(v26 + 24) = v27;
    swift_retain();
    uint64_t v28 = v27;
    sub_2214ADE48();
    swift_release();
    swift_release();
    swift_release();
    sub_2214ADF38();
    MEMORY[0x223C81550](v6, 5.0);
    uint64_t v29 = *(void (**)(char *, uint64_t))(v3 + 8);
    v29(v6, v2);
    sub_2214AE228();
    v29(v8, v2);
    uint64_t v30 = sub_2214ADEF8();
    if (v30)
    {
      unint64_t v31 = sub_2214ADDC8();
      os_log_type_t v32 = sub_2214AE1B8();
      if (os_log_type_enabled(v31, v32))
      {
        id v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v33 = 0;
        _os_log_impl(&dword_22149B000, v31, v32, "Timeout occurred fetching personal voices", v33, 2u);
        MEMORY[0x223C82360](v33, -1, -1);
      }
    }
    else
    {
      MEMORY[0x270FA5388](v30);
      *(&v34 - 2) = (uint64_t)v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_26AAE9438);
      sub_2214AE208();
    }
  }
}

uint64_t sub_2214A8B50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_2214ADE38();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  uint64_t v10 = ((char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)v37 - v11;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAE94D0);
  MEMORY[0x270FA5388](v13);
  unsigned int v15 = (void *)((char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  uint64_t result = MEMORY[0x223C823B0](a2 + 16);
  if (result)
  {
    uint64_t v17 = (char *)result;
    sub_2214AD678(a1, (uint64_t)v15, &qword_26AAE94D0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v39 = a3;
      (*(void (**)(char *, uint64_t *, uint64_t))(v7 + 32))(v12, v15, v6);
      if (qword_26AAE9570 != -1) {
        goto LABEL_18;
      }
      while (1)
      {
        uint64_t v18 = sub_2214ADDE8();
        __swift_project_value_buffer(v18, (uint64_t)qword_26AAE9558);
        (*(void (**)(NSObject *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
        uint64_t v19 = sub_2214ADDC8();
        os_log_type_t v20 = sub_2214AE1B8();
        if (os_log_type_enabled(v19, v20))
        {
          uint64_t v21 = (uint8_t *)swift_slowAlloc();
          uint64_t v38 = swift_slowAlloc();
          aBlock[0] = v38;
          *(_DWORD *)uint64_t v21 = 136315138;
          v37[1] = v21 + 4;
          uint64_t v22 = sub_2214ADE28();
          uint64_t v40 = sub_2214AA8A4(v22, v23, aBlock);
          sub_2214AE288();
          swift_bridgeObjectRelease();
          uint64_t v24 = *(void (**)(NSObject *, uint64_t))(v7 + 8);
          v7 += 8;
          v24(v10, v6);
          _os_log_impl(&dword_22149B000, v19, v20, "Fetching personal voices failed: %s", v21, 0xCu);
          uint64_t v10 = v38;
          swift_arrayDestroy();
          MEMORY[0x223C82360](v10, -1, -1);
          MEMORY[0x223C82360](v21, -1, -1);

          v24(v12, v6);
        }
        else
        {

          uint64_t v30 = *(void (**)(NSObject *, uint64_t))(v7 + 8);
          v7 += 8;
          v30(v10, v6);
          v30(v12, v6);
        }
        uint64_t v6 = 0;
        uint64_t v12 = 0;
LABEL_14:
        uint64_t v34 = *(void *)&v17[qword_26AAE9690];
        BOOL v35 = __OFSUB__(v34, 1);
        uint64_t v36 = v34 - 1;
        if (!v35) {
          break;
        }
        __break(1u);
LABEL_18:
        swift_once();
      }
      *(void *)&v17[qword_26AAE9690] = v36;
      sub_2214AE238();

      return sub_2214AD774(v6);
    }
    else
    {
      uint64_t v25 = *v15;
      if (qword_26AAE9570 != -1) {
        swift_once();
      }
      uint64_t v26 = sub_2214ADDE8();
      __swift_project_value_buffer(v26, (uint64_t)qword_26AAE9558);
      swift_bridgeObjectRetain();
      dispatch_semaphore_t v27 = sub_2214ADDC8();
      os_log_type_t v28 = sub_2214AE1C8();
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 134217984;
        aBlock[0] = *(void *)(v25 + 16);
        sub_2214AE288();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22149B000, v27, v28, "Did fetch (%ld) personal voices from service", v29, 0xCu);
        MEMORY[0x223C82360](v29, -1, -1);
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      uint64_t v10 = *(NSObject **)&v17[qword_26AAE96E0];
      uint64_t v12 = (char *)swift_allocObject();
      *((void *)v12 + 2) = v17;
      *((void *)v12 + 3) = v25;
      uint64_t v31 = swift_allocObject();
      uint64_t v6 = (uint64_t)sub_2214AD71C;
      *(void *)(v31 + 16) = sub_2214AD71C;
      *(void *)(v31 + 24) = v12;
      aBlock[4] = (uint64_t)sub_2214AD99C;
      aBlock[5] = v31;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_2214A5F2C;
      aBlock[3] = (uint64_t)&block_descriptor_98;
      os_log_type_t v32 = _Block_copy(aBlock);
      id v33 = v17;
      swift_retain();
      swift_release();
      dispatch_sync(v10, v32);
      _Block_release(v32);
      LOBYTE(v32) = swift_isEscapingClosureAtFileLocation();
      uint64_t result = swift_release();
      if ((v32 & 1) == 0) {
        goto LABEL_14;
      }
      __break(1u);
    }
  }
  return result;
}

void sub_2214A9124(uint64_t a1, uint8_t *a2)
{
  uint64_t v86 = a1;
  uint64_t v3 = sub_2214ADDE8();
  uint64_t v75 = *(void *)(v3 - 8);
  uint64_t v76 = v3;
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  unint64_t v74 = (char *)&v74 - v7;
  uint64_t v8 = sub_2214ADC18();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_267F51898);
  MEMORY[0x270FA5388](v12 - 8);
  uint64_t v83 = (char *)&v74 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_2214ADE18();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v74 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  uint64_t v82 = (char *)&v74 - v19;
  sub_2214A8604();
  uint64_t v21 = *(void *)(v20 + 16);
  uint64_t v84 = v20;
  if (v21)
  {
    uint64_t v78 = v11;
    uint64_t v79 = v9;
    uint64_t v80 = v8;
    uint64_t v81 = v6;
    unsigned int v85 = a2;
    uint64_t v77 = v15;
    uint64_t v22 = v15 + 16;
    unint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    uint64_t v24 = v20 + ((*(unsigned __int8 *)(v22 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 64));
    uint64_t v25 = *(void *)(v22 + 56);
    swift_bridgeObjectRetain();
    while (1)
    {
      v23(v18, v24, v14);
      swift_getKeyPath();
      sub_2214ADE08();
      swift_release();
      if (v88[0] == v86 && v88[1] == (void)v85)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_14;
      }
      char v27 = sub_2214AE3F8();
      swift_bridgeObjectRelease();
      if (v27) {
        break;
      }
      (*(void (**)(char *, uint64_t))(v22 - 8))(v18, v14);
      v24 += v25;
      if (!--v21)
      {
        swift_bridgeObjectRelease();
        uint64_t v28 = 1;
        uint64_t v8 = v80;
        uint64_t v6 = v81;
        uint64_t v11 = v78;
        uint64_t v9 = v79;
        uint64_t v15 = v77;
        goto LABEL_11;
      }
    }
    swift_bridgeObjectRelease();
LABEL_14:
    uint64_t v15 = v77;
    uint64_t v29 = (uint64_t)v83;
    (*(void (**)(char *, char *, uint64_t))(v77 + 32))(v83, v18, v14);
    uint64_t v28 = 0;
    uint64_t v8 = v80;
    uint64_t v6 = v81;
    uint64_t v11 = v78;
    uint64_t v9 = v79;
  }
  else
  {
    uint64_t v28 = 1;
LABEL_11:
    uint64_t v29 = (uint64_t)v83;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v29, v28, 1, v14);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v29, 1, v14) != 1)
  {
    unsigned int v54 = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v82, v29, v14);
    sub_2214ADDF8();
    sub_2214ADC08();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v54, v14);
    return;
  }
  sub_2214AD4E8(v29, &qword_267F51898);
  uint64_t v30 = self;
  id v31 = objc_msgSend(v30, sel_sharedInstance);
  os_log_type_t v32 = (void *)sub_2214ADFC8();
  id v33 = objc_msgSend(v31, sel_resourceWithVoiceId_, v32);

  if (v33)
  {
    if (objc_msgSend(v33, sel_type) == (id)3
      && objc_msgSend(v33, sel_subtype) == (id)7
      && objc_msgSend(v33, sel_footprint) == (id)3)
    {
      id v34 = objc_msgSend(v33, sel_name);
      if (v34)
      {
        BOOL v35 = v34;
        id v36 = objc_msgSend(v33, sel_primaryLanguage);
        if (!v36)
        {
          sub_2214ADFD8();
          id v36 = (id)sub_2214ADFC8();
          swift_bridgeObjectRelease();
        }
        id v37 = objc_msgSend(self, sel_voiceIdentifierForType_footprint_language_name_, 7, 4, v36, v35);

        if (v37)
        {
          id v38 = objc_msgSend(v30, sel_sharedInstance);
          id v39 = objc_msgSend(v38, sel_resourceWithVoiceId_, v37);

          if (v39)
          {
            if (objc_msgSend(v39, sel_isInstalled))
            {
              if (qword_26AAE9570 != -1) {
                swift_once();
              }
              uint64_t v40 = v76;
              uint64_t v41 = __swift_project_value_buffer(v76, (uint64_t)qword_26AAE9558);
              uint64_t v42 = v74;
              uint64_t v43 = v75;
              (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v74, v41, v40);
              id v44 = v39;
              uint64_t v45 = sub_2214ADDC8();
              id v46 = (id)sub_2214AE1A8();
              if (!os_log_type_enabled(v45, (os_log_type_t)v46))
              {

                (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v40);
                goto LABEL_38;
              }
              os_log_type_t v47 = (uint8_t *)swift_slowAlloc();
              uint64_t v48 = swift_slowAlloc();
              v88[0] = v48;
              *(_DWORD *)os_log_type_t v47 = 136315138;
              id v49 = objc_msgSend(v44, sel_voiceId);
              if (v49)
              {
                os_log_type_t v50 = v49;
                uint64_t v51 = sub_2214ADFD8();
                unint64_t v53 = v52;

                uint64_t v87 = sub_2214AA8A4(v51, v53, v88);
                sub_2214AE288();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_22149B000, v45, (os_log_type_t)v46, "Found upgraded siri voice %s", v47, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x223C82360](v48, -1, -1);
                MEMORY[0x223C82360](v47, -1, -1);

                (*(void (**)(char *, uint64_t))(v75 + 8))(v74, v76);
LABEL_38:
                id v67 = objc_msgSend(v44, sel_contentPath);
                if (v67)
                {
                  unint64_t v68 = v67;
                  sub_2214ADFD8();

                  return;
                }

LABEL_46:
                return;
              }
              goto LABEL_49;
            }
            uint64_t v81 = v6;
            if (qword_26AAE9570 != -1) {
              swift_once();
            }
            uint64_t v55 = v76;
            uint64_t v56 = __swift_project_value_buffer(v76, (uint64_t)qword_26AAE9558);
            uint64_t v57 = v75;
            unsigned int v58 = v81;
            (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v81, v56, v55);
            id v46 = v39;
            uint64_t v59 = sub_2214ADDC8();
            id v44 = (id)sub_2214AE1A8();
            unint64_t v60 = 0x2645B3000uLL;
            if (os_log_type_enabled(v59, (os_log_type_t)v44))
            {
              uint64_t v61 = (uint8_t *)swift_slowAlloc();
              uint64_t v86 = swift_slowAlloc();
              v88[0] = v86;
              *(_DWORD *)uint64_t v61 = 136315138;
              id v62 = objc_msgSend(v46, sel_voiceId);
              if (!v62)
              {
LABEL_50:

                __break(1u);
                return;
              }
              uint64_t v63 = v62;
              unsigned int v85 = v61 + 4;
              uint64_t v64 = sub_2214ADFD8();
              unint64_t v66 = v65;

              uint64_t v87 = sub_2214AA8A4(v64, v66, v88);
              sub_2214AE288();

              swift_bridgeObjectRelease();
              _os_log_impl(&dword_22149B000, v59, (os_log_type_t)v44, "Downloading upgraded siri voice %s", v61, 0xCu);
              id v44 = (id)v86;
              swift_arrayDestroy();
              MEMORY[0x223C82360](v44, -1, -1);
              MEMORY[0x223C82360](v61, -1, -1);

              (*(void (**)(char *, uint64_t))(v75 + 8))(v81, v76);
              unint64_t v60 = 0x2645B3000;
            }
            else
            {

              (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v55);
            }
            id v69 = objc_msgSend(v30, sel_sharedInstance);
            id v70 = [v46 *(SEL *)(v60 + 3568)];
            if (!v70)
            {
              __break(1u);
LABEL_49:

              __break(1u);
              goto LABEL_50;
            }
            unsigned int v71 = v70;
            objc_msgSend(v69, sel_downloadResourceWithVoiceId_, v70);
          }
        }
      }
    }
    id v72 = objc_msgSend(v33, sel_contentPath);
    if (v72)
    {
      uint64_t v73 = v72;
      sub_2214ADFD8();

      return;
    }
    goto LABEL_46;
  }
}

void sub_2214A9BD0()
{
  uint64_t v1 = v0;
  id v2 = objc_msgSend(self, sel_sharedInstance);
  uint64_t v3 = (void *)sub_2214ADFC8();
  id v4 = objc_msgSend(v2, sel_resourceWithVoiceId_, v3);

  if (v4)
  {
    sub_2214ADD78();
    unint64_t v5 = sub_2214ADD68();
    unint64_t v6 = v5;
    if (v5 >> 62) {
      goto LABEL_14;
    }
    uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; uint64_t v7 = sub_2214AE3B8())
    {
      uint64_t v8 = qword_26AAE95E8;
      uint64_t v9 = 4;
      uint64_t v10 = 0;
      if ((v6 & 0xC000000000000001) != 0)
      {
LABEL_5:
        id v11 = (id)MEMORY[0x223C81920](v10, v6);
        goto LABEL_7;
      }
      while (1)
      {
        id v11 = *(id *)(v6 + 8 * v9);
LABEL_7:
        uint64_t v12 = v11;
        BOOL v13 = __OFADD__(v10, 1);
        uint64_t v14 = v10 + 1;
        if (v13) {
          break;
        }
        uint64_t v15 = *(void **)&v1[v8];
        if (v15) {
          objc_msgSend(v15, sel_loadRuleset_, v12);
        }

        if (v14 == v7) {
          goto LABEL_15;
        }
        uint64_t v10 = ++v9 - 4;
        if ((v6 & 0xC000000000000001) != 0) {
          goto LABEL_5;
        }
      }
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    id v16 = objc_msgSend(v4, sel_primaryLanguage);
    if (!v16)
    {
      sub_2214ADFD8();
      id v16 = (id)sub_2214ADFC8();
      swift_bridgeObjectRelease();
    }
    uint64_t v17 = self;
    id v18 = objc_msgSend(v4, sel_speechVoice);
    id v19 = objc_msgSend(v18, sel_voiceType);

    id v20 = objc_msgSend(v17, sel_effectiveResourceForLanguageCode_andVoiceType_, v16, v19);
    if (v20)
    {
      uint64_t v21 = swift_allocObject();
      *(void *)(v21 + 16) = v1;
      aBlock[4] = sub_2214AC25C;
      aBlock[5] = v21;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2214AA048;
      aBlock[3] = &block_descriptor_28;
      uint64_t v22 = _Block_copy(aBlock);
      unint64_t v23 = v1;
      swift_release();
      objc_msgSend(v17, sel_enumerateLoadableResourcesInAsset_usingBlock_, v20, v22);
      _Block_release(v22);
    }
    else
    {
      if (qword_26AAE9570 != -1) {
        swift_once();
      }
      uint64_t v24 = sub_2214ADDE8();
      __swift_project_value_buffer(v24, (uint64_t)qword_26AAE9558);
      id v30 = v4;
      uint64_t v25 = sub_2214ADDC8();
      os_log_type_t v26 = sub_2214AE198();
      if (os_log_type_enabled(v25, v26))
      {
        char v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v28 = (void *)swift_slowAlloc();
        *(_DWORD *)char v27 = 138412290;
        aBlock[0] = v30;
        id v29 = v30;
        sub_2214AE288();
        void *v28 = v4;

        _os_log_impl(&dword_22149B000, v25, v26, "Could not find voice resource for resource %@", v27, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_267F51738);
        swift_arrayDestroy();
        MEMORY[0x223C82360](v28, -1, -1);
        MEMORY[0x223C82360](v27, -1, -1);
      }
      else
      {
      }
    }
  }
}

uint64_t sub_2214AA048(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  uint64_t v19 = sub_2214ADC18();
  uint64_t v6 = *(void *)(v19 - 8);
  MEMORY[0x270FA5388](v19);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v18 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t (*)(), uint64_t, char *))(a1 + 32);
  uint64_t v9 = sub_2214ADFD8();
  uint64_t v11 = v10;
  uint64_t v12 = sub_2214ADFD8();
  uint64_t v14 = v13;
  uint64_t v15 = _Block_copy(a4);
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  sub_2214ADBE8();
  swift_retain();
  v18(v9, v11, v12, v14, sub_2214ACE80, v16, v8);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v19);
}

uint64_t sub_2214AA1F0(uint64_t a1)
{
  id v1 = (id)(*(uint64_t (**)(void))(a1 + 16))();
  uint64_t v2 = sub_2214ADC38();

  return v2;
}

void static TTSSiriSynthAudioUnit.registerAudioUnit()()
{
  if ((TTSIsBaseSystem() & 1) == 0)
  {
    Swift::UInt32 v0 = String.osType()();
    id v1 = self;
    type metadata accessor for TTSSiriSynthAudioUnit();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v3 = (void *)sub_2214ADFC8();
    v4[0] = 1635087216;
    v4[1] = v0;
    uint64_t v5 = 1634758764;
    int v6 = 0;
    objc_msgSend(v1, sel_registerSubclass_asComponentDescription_name_version_, ObjCClassFromMetadata, v4, v3, 0);
  }
}

void sub_2214AA308()
{
  if ((TTSIsBaseSystem() & 1) == 0)
  {
    Swift::UInt32 v0 = String.osType()();
    id v1 = self;
    type metadata accessor for TTSSiriSynthAudioUnit();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v3 = (void *)sub_2214ADFC8();
    v4[0] = 1635087216;
    v4[1] = v0;
    uint64_t v5 = 1634758764;
    int v6 = 0;
    objc_msgSend(v1, sel_registerSubclass_asComponentDescription_name_version_, ObjCClassFromMetadata, v4, v3, 0);
  }
}

uint64_t sub_2214AA3CC()
{
  uint64_t v1 = v0 + qword_26AAE9580;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAE9420);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2214AD4E8(v0 + qword_26AAE9608, (uint64_t *)&unk_26AAE9428);
  return swift_bridgeObjectRelease();
}

id TTSSiriSynthAudioUnit.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSSiriSynthAudioUnit();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2214AA5A4(uint64_t a1)
{
  uint64_t v2 = a1 + qword_26AAE9580;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AAE9420);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_release();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2214AD4E8(a1 + qword_26AAE9608, (uint64_t *)&unk_26AAE9428);
  return swift_bridgeObjectRelease();
}

unint64_t sub_2214AA748(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_2214AE118();
  }
  __break(1u);
  return result;
}

void *sub_2214AA794(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_267F51870);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2214AB7CC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2214AA8A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2214AA978(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2214AD428((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_2214AD428((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2214AA978(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_2214AE298();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_2214AAB34(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_2214AE348();
  if (!v8)
  {
    sub_2214AE3A8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_2214AE3D8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_2214AAB34(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2214AABCC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2214AAE28(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2214AAE28(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2214AABCC(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_2214AAD44(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_2214AE318();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_2214AE3A8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_2214AE0A8();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_2214AE3D8();
    __break(1u);
LABEL_14:
    uint64_t result = sub_2214AE3A8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_2214AAD44(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_267F51888);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  _DWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2214AADAC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_2214AE0F8();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x223C816B0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_2214AAE28(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F51888);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_2214AE3D8();
  __break(1u);
  return result;
}

uint64_t sub_2214AAF78(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2214AAF98(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_2214AAF98(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_267F51890);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_2214AE3D8();
  __break(1u);
  return result;
}

unint64_t sub_2214AB104(uint64_t a1)
{
  uint64_t v2 = sub_2214AE2D8();
  return sub_2214AB148(a1, v2);
}

unint64_t sub_2214AB148(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v6 = ~v3;
    do
    {
      sub_2214AD554(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      char v7 = MEMORY[0x223C818E0](v9, a1);
      sub_2214AD5B0((uint64_t)v9);
      if (v7) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v6;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void *sub_2214AB210(void *a1)
{
  return sub_2214AA794(0, a1[2], 0, a1);
}

uint64_t sub_2214AB224()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214AB260()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2214AB270()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_2214AB2B0()
{
  unint64_t result = qword_267F51718;
  if (!qword_267F51718)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F51718);
  }
  return result;
}

uint64_t sub_2214AB304(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2214AB348()
{
  unint64_t result = qword_26AAE94E8;
  if (!qword_26AAE94E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_26AAE94E8);
  }
  return result;
}

uint64_t sub_2214AB39C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  return sub_2214A629C(a1, a2, a3, a4, a5, a6, a7, *(void **)(v7 + 16));
}

uint64_t sub_2214AB3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AAE9428);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2214AB40C()
{
  swift_unknownObjectWeakDestroy();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214AB444()
{
  uint64_t v1 = (void *)(*(void *)(v0 + 16) + qword_26AAE95F8);
  swift_beginAccess();
  void *v1 = MEMORY[0x263F8EE78];
  return swift_bridgeObjectRelease();
}

uint64_t sub_2214AB4A0()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2214AB4B0(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_2214AE3B8();
  swift_bridgeObjectRelease();
  if (v21 < v2) {
    goto LABEL_33;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_2214AE3B8();
    swift_bridgeObjectRelease();
    uint64_t v8 = v7 + v5;
    if (!__OFADD__(v7, v5)) {
      goto LABEL_8;
    }
LABEL_38:
    __break(1u);
LABEL_39:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_2214AE3B8();
    swift_bridgeObjectRelease();
    unint64_t v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62) {
    goto LABEL_36;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_38;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v3 = v9;
  uint64_t v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      goto LABEL_18;
    }
    uint64_t v7 = 1;
  }
  if (v9 >> 62) {
    goto LABEL_39;
  }
  uint64_t v12 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8) {
    uint64_t v12 = v8;
  }
  swift_bridgeObjectRetain();
  unint64_t *v3 = MEMORY[0x223C81930](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  uint64_t v13 = v11 + 32;
  uint64_t v14 = (char *)(v11 + 32 + 8 * v4);
  sub_2214AD348(0, &qword_267F51868);
  swift_arrayDestroy();
  if (v5)
  {
    if (*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_2214AE3B8();
      swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2))
      {
LABEL_21:
        if (v16 < 0)
        {
LABEL_46:
          uint64_t result = sub_2214AE3D8();
          __break(1u);
          return result;
        }
        uint64_t v17 = (char *)(v13 + 8 * v2);
        if (v4 != v2 || v14 >= &v17[8 * v16]) {
          memmove(v14, v17, 8 * v16);
        }
        if (!(*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_27:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_28;
          }
          goto LABEL_45;
        }
LABEL_43:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_2214AE3B8();
        swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_27;
        }
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2)) {
        goto LABEL_21;
      }
    }
    __break(1u);
    goto LABEL_43;
  }
LABEL_28:
  return sub_2214AE158();
}

char *sub_2214AB7CC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + 16 * a1 + 32);
    size_t v6 = 16 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)sub_2214AE3D8();
  __break(1u);
  return result;
}

void *sub_2214AB8B8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 1;
  uint64_t v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = *(void **)v4;
  int64_t v8 = *(void *)(*(void *)v4 + 16);
  int64_t v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t result = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (!result || v9 > v7[3] >> 1) {
    goto LABEL_8;
  }
  if (v5 == a3)
  {
    while (v6 > 0)
    {
      __break(1u);
LABEL_8:
      if (v8 <= v9) {
        int64_t v13 = v8 + v6;
      }
      else {
        int64_t v13 = v8;
      }
      uint64_t result = sub_2214AA794(result, v13, 1, v7);
      uint64_t v7 = result;
      if (v5 != a3) {
        goto LABEL_12;
      }
    }
    goto LABEL_22;
  }
LABEL_12:
  uint64_t v14 = v7[2];
  if ((v7[3] >> 1) - v14 < v6) {
    goto LABEL_25;
  }
  if (v6 < 0) {
    goto LABEL_27;
  }
  uint64_t v15 = (char *)&v7[2 * v14 + 4];
  uint64_t v16 = (char *)(a2 + 16 * a3);
  if (v16 < &v15[16 * v6] && v15 < &v16[16 * v6]) {
    goto LABEL_27;
  }
  uint64_t result = memcpy(v15, v16, 16 * v6);
  if (!v6)
  {
LABEL_22:
    *(void *)uint64_t v4 = v7;
    return result;
  }
  uint64_t v18 = v7[2];
  BOOL v19 = __OFADD__(v18, v6);
  uint64_t v20 = v18 + v6;
  if (!v19)
  {
    v7[2] = v20;
    goto LABEL_22;
  }
LABEL_26:
  __break(1u);
LABEL_27:
  uint64_t result = (void *)sub_2214AE3D8();
  __break(1u);
  return result;
}

char *sub_2214ABA50(uint64_t a1, int64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v4 = *v2;
  int64_t v5 = *((void *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  int64_t v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t result = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (result && v9 <= *((void *)v4 + 3) >> 1)
  {
    if (!v8) {
      goto LABEL_21;
    }
  }
  else
  {
    if (v5 <= v9) {
      int64_t v11 = v5 + v8;
    }
    else {
      int64_t v11 = v5;
    }
    uint64_t result = (char *)sub_2214AA794(result, v11, 1, v4);
    uint64_t v4 = result;
    if (!v8) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)v4 + 2);
  BOOL v13 = __OFSUB__(v12, a2);
  uint64_t v14 = v12 - a2;
  if (v13) {
    goto LABEL_27;
  }
  if ((v14 & 0x8000000000000000) == 0)
  {
    uint64_t result = &v4[16 * a1 + 32];
    uint64_t v15 = &v4[16 * a2 + 32];
    if (a1 != a2 || result >= &v15[16 * v14]) {
      uint64_t result = (char *)memmove(result, v15, 16 * v14);
    }
    uint64_t v16 = *((void *)v4 + 2);
    BOOL v13 = __OFADD__(v16, v8);
    uint64_t v17 = v16 + v8;
    if (!v13)
    {
      *((void *)v4 + 2) = v17;
LABEL_21:
      void *v2 = v4;
      return result;
    }
    goto LABEL_28;
  }
LABEL_29:
  uint64_t result = (char *)sub_2214AE3D8();
  __break(1u);
  return result;
}

void sub_2214ABBAC(char a1)
{
  uint64_t v2 = v1;
  *(unsigned char *)(v2 + qword_26AAE9670) = 0;
  objc_msgSend(*(id *)(v2 + qword_26AAE9648), sel_broadcast);
  if ((a1 & 1) == 0)
  {
    if (qword_26AAE9570 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_2214ADDE8();
    __swift_project_value_buffer(v4, (uint64_t)qword_26AAE9558);
    int64_t v5 = sub_2214ADDC8();
    os_log_type_t v6 = sub_2214AE1B8();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_22149B000, v5, v6, "SiriSSE encountered error during synthesis. Resetting engine.", v7, 2u);
      MEMORY[0x223C82360](v7, -1, -1);
    }

    uint64_t v8 = *(void **)(v2 + qword_26AAE95E8);
    *(void *)(v2 + qword_26AAE95E8) = 0;
  }
}

void sub_2214ABCE4(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AAE9428);
  uint64_t v5 = MEMORY[0x270FA5388](v4 - 8);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  int64_t v9 = (char *)&v28 - v8;
  uint64_t v10 = sub_2214ADC98();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x270FA5388](v10);
  uint64_t v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v28 - v15;
  uint64_t v17 = v2 + qword_26AAE9608;
  swift_beginAccess();
  sub_2214AD678(v17, (uint64_t)v9, (uint64_t *)&unk_26AAE9428);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_2214AD4E8((uint64_t)v9, (uint64_t *)&unk_26AAE9428);
  }
  else
  {
    id v29 = a1;
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v9, v10);
    sub_2214ADC88();
    sub_2214ADC78();
    uint64_t v19 = v18;
    uint64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
    v20(v14, v10);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v7, 1, 1, v10);
    swift_beginAccess();
    sub_2214AB3A4((uint64_t)v7, v17);
    swift_endAccess();
    if (qword_26AAE9570 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_2214ADDE8();
    __swift_project_value_buffer(v21, (uint64_t)qword_26AAE9558);
    uint64_t v22 = sub_2214ADDC8();
    os_log_type_t v23 = sub_2214AE1A8();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 134217984;
      uint64_t v30 = v19;
      sub_2214AE288();
      _os_log_impl(&dword_22149B000, v22, v23, "SiriAUSP first buffer latency %fs", v24, 0xCu);
      MEMORY[0x223C82360](v24, -1, -1);
    }

    v20(v16, v10);
    a1 = v29;
  }
  *(unsigned char *)(v2 + qword_26AAE9670) = 0;
  uint64_t v25 = (os_unfair_lock_s *)(*(void *)(v2 + qword_26AAE95B8) + 16);
  os_unfair_lock_lock(v25);
  os_log_type_t v26 = (void *)(v2 + qword_26AAE9630);
  swift_beginAccess();
  id v27 = a1;
  MEMORY[0x223C81720]();
  if (*(void *)((*v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_2214AE168();
  }
  sub_2214AE178();
  sub_2214AE158();
  swift_endAccess();
  objc_msgSend(*(id *)(v2 + qword_26AAE9648), sel_broadcast);
  os_unfair_lock_unlock(v25);
}

uint64_t sub_2214AC0F0(uint64_t a1, uint64_t a2)
{
  v2[qword_26AAE9670] = 0;
  uint64_t v5 = *(NSObject **)&v2[qword_26AAE95D0];
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = a2;
  v6[3] = a1;
  v6[4] = v2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_2214ACEC0;
  *(void *)(v7 + 24) = v6;
  v12[4] = sub_2214AD99C;
  v12[5] = v7;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_2214A5F2C;
  uint64_t v12[3] = &block_descriptor_70;
  uint64_t v8 = _Block_copy(v12);
  int64_t v9 = v2;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v8);
  _Block_release(v8);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
  return result;
}

uint64_t sub_2214AC25C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v9 = *(void *)(v5 + 16);
  id v10 = objc_msgSend(objc_allocWithZone((Class)TTSSiriVoiceResource), sel_init);
  if (a3 != 0xD000000000000022 || a4 != 0x80000002214B0610)
  {
    id v19 = v10;
    if ((sub_2214AE3F8() & 1) == 0)
    {
      if (a3 == 0xD000000000000020 && a4 == 0x80000002214B0640 || (sub_2214AE3F8() & 1) != 0)
      {
        uint64_t v11 = 1;
      }
      else if (a3 == 0xD00000000000001FLL && a4 == 0x80000002214B0670)
      {
        uint64_t v11 = 2;
      }
      else if (sub_2214AE3F8())
      {
        uint64_t v11 = 2;
      }
      else
      {
        uint64_t v11 = 0;
      }
      objc_msgSend(v19, sel_setType_, v11);
      uint64_t v12 = (void *)sub_2214ADFC8();
      objc_msgSend(v19, sel_setResourceName_, v12);

      uint64_t v13 = a5();
      unint64_t v15 = v14;
      uint64_t v16 = (void *)sub_2214ADC28();
      sub_2214A12C0(v13, v15);
      objc_msgSend(v19, sel_setResourceData_, v16);

      id v17 = *(id *)(v9 + qword_26AAE95E8);
      objc_msgSend(v17, sel_loadVoiceResource_, v19);
    }
  }
  return MEMORY[0x270F9A790]();
}

unint64_t sub_2214AC474()
{
  unint64_t result = qword_267F51740;
  if (!qword_267F51740)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F51740);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriParameter(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for SiriParameter(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x2214AC5BCLL);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_2214AC5E4()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriParameter()
{
  return &type metadata for SiriParameter;
}

void sub_2214AC600()
{
  sub_2214AC9F4();
  if (v0 <= 0x3F)
  {
    sub_2214ACA54();
    if (v1 <= 0x3F) {
      swift_initClassMetadata2();
    }
  }
}

uint64_t method lookup function for TTSSiriSynthAudioUnit(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for TTSSiriSynthAudioUnit);
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit._hostAuditToken.getter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x263F8EED0] & *v0) + 288))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit._hostAuditToken.setter()
{
  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x263F8EED0] & *v0) + 296))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit._hostAuditToken.modify()
{
  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x263F8EED0] & *v0) + 304))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit.siriDidStartSynthesis(_:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x263F8EED0] & *v0) + 816))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit.siriDidEndSynthesis(_:successfully:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x263F8EED0] & *v0) + 824))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit.siri(_:didGenerate:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x263F8EED0] & *v0) + 840))();
}

uint64_t dispatch thunk of TTSSiriSynthAudioUnit.siri(_:didGenerateMarkers:count:)()
{
  return (*(uint64_t (**)(void))(class metadata base offset for TTSSiriSynthAudioUnit + (*MEMORY[0x263F8EED0] & *v0) + 848))();
}

void sub_2214AC9F4()
{
  if (!qword_26AAE94E0)
  {
    unint64_t v0 = sub_2214ADCE8();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AAE94E0);
    }
  }
}

void sub_2214ACA54()
{
  if (!qword_26AAE9528)
  {
    sub_2214ADC98();
    unint64_t v0 = sub_2214AE268();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_26AAE9528);
    }
  }
}

uint64_t sub_2214ACAAC()
{
  return type metadata accessor for TTSSiriSynthAudioUnit();
}

uint64_t sub_2214ACAB8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for TTSSiriSynthAudioUnit.Error(uint64_t a1)
{
  return sub_2214ACAD8(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_2214ACAD8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s25TextToSpeechBundleSupport21TTSSiriSynthAudioUnitC5ErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2214ACAB8(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for TTSSiriSynthAudioUnit.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_2214ACAB8(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_2214ACAD8(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TTSSiriSynthAudioUnit.Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_2214ACAD8(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSSiriSynthAudioUnit.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSSiriSynthAudioUnit.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_2214ACC74(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2214ACC7C(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TTSSiriSynthAudioUnit.Error()
{
  return &type metadata for TTSSiriSynthAudioUnit.Error;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
}

uint64_t sub_2214ACCB8(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t sub_2214ACD0C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

void type metadata accessor for SiriTTSMarker(uint64_t a1)
{
}

uint64_t sub_2214ACD60(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_2214ACDA0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2214ACDC0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

uint64_t sub_2214ACE14(_DWORD *a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  return sub_2214A6760(a1, a3, a5, v5);
}

uint64_t sub_2214ACE24()
{
  _Block_release(*(const void **)(v0 + 16));
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_2214ACE5C()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_2214ACE80()
{
  return sub_2214AA1F0(*(void *)(v0 + 16));
}

uint64_t sub_2214ACE88()
{
  return MEMORY[0x270FA0238](v0, 40, 7);
}

void sub_2214ACEC0()
{
  uint64_t v1 = v0[2];
  if (v1 < 0)
  {
LABEL_29:
    __break(1u);
  }
  else
  {
    if (v1)
    {
      uint64_t v2 = v0[3];
      uint64_t v22 = v0[4] + qword_26AAE95F8;
      swift_beginAccess();
      uint64_t v3 = 0;
      BOOL v4 = (void *)MEMORY[0x263F8EE78];
      uint64_t v21 = v1;
      while (1)
      {
        uint64_t v6 = v2 + 16 * v3;
        if ((*(unsigned char *)v6 & 1) == 0)
        {
          char v7 = *(unsigned char *)(v6 + 1);
          int v8 = *(unsigned __int16 *)(v6 + 2);
          int v9 = *(_DWORD *)(v6 + 4);
          uint64_t v10 = *(void *)(v6 + 8);
          uint64_t v11 = *(void *)v22;
          uint64_t v12 = *(void *)(*(void *)v22 + 16);
          if (v12)
          {
            unint64_t v13 = 0;
            unint64_t v14 = 0;
            while (1)
            {
              BOOL v15 = *(unsigned char *)(v11 + v13 + 32) != 1 && v9 == *(_DWORD *)(v11 + v13 + 36);
              if (v15 && v8 == *(unsigned __int16 *)(v11 + v13 + 34)) {
                break;
              }
              ++v14;
              v13 += 16;
              if (v12 == v14) {
                goto LABEL_18;
              }
            }
            swift_beginAccess();
            id v19 = *(void **)v22;
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(void *)uint64_t v22 = v19;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              id v19 = sub_2214AB210(v19);
              *(void *)uint64_t v22 = v19;
            }
            if (v14 >= v19[2])
            {
              __break(1u);
              goto LABEL_29;
            }
            v19[v13 / 8 + 5] = v10;
            swift_endAccess();
          }
          else
          {
LABEL_18:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              BOOL v4 = sub_2214AA794(0, v4[2] + 1, 1, v4);
            }
            unint64_t v18 = v4[2];
            unint64_t v17 = v4[3];
            if (v18 >= v17 >> 1) {
              BOOL v4 = sub_2214AA794((void *)(v17 > 1), v18 + 1, 1, v4);
            }
            _DWORD v4[2] = v18 + 1;
            uint64_t v5 = &v4[2 * v18];
            *((unsigned char *)v5 + 32) = 0;
            *((unsigned char *)v5 + 33) = v7;
            *((_WORD *)v5 + 17) = v8;
            *((_DWORD *)v5 + 9) = v9;
            v5[5] = v10;
          }
          uint64_t v1 = v21;
        }
        if (++v3 == v1) {
          goto LABEL_27;
        }
      }
    }
    BOOL v4 = (void *)MEMORY[0x263F8EE78];
LABEL_27:
    swift_beginAccess();
    sub_2214A797C((uint64_t)v4);
    swift_endAccess();
  }
}

uint64_t sub_2214AD0E4()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2214AD0F8()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

void sub_2214AD130()
{
  uint64_t v1 = (char *)v0[2];
  uint64_t v2 = (unsigned int *)v0[3];
  uint64_t v3 = (void *)v0[5];
  BOOL v4 = &v1[qword_26AAE95F8];
  swift_beginAccess();
  uint64_t v5 = *(void **)v4;
  uint64_t v6 = v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)BOOL v4 = v5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
    goto LABEL_14;
  }
  for (int64_t i = v5[2]; i; int64_t i = v5[2])
  {
    int v9 = v5 + 4;
    uint64_t v10 = qword_26AAE95E0;
    uint64_t v11 = v6;
    int64_t v12 = 0;
    while (1)
    {
      uint64_t v17 = *(void *)&v6[v10];
      uint64_t v18 = *v2;
      uint64_t v19 = v17 + v18;
      if (__OFADD__(v17, v18)) {
        break;
      }
      uint64_t v20 = &v9[2 * v12];
      uint64_t v21 = v20[1];
      if (v21 >= v19)
      {
        if (v12 >= i - 1)
        {
LABEL_12:

          goto LABEL_16;
        }
        uint64_t v22 = (uint64_t)&v5[2 * i-- + 2];
        while (*(void *)(v22 + 8) >= v19)
        {
          --i;
          v22 -= 16;
          if (v12 >= i) {
            goto LABEL_12;
          }
        }
        char v13 = *(unsigned char *)v20;
        unint64_t v14 = &v9[2 * v12];
        char v15 = *((unsigned char *)v14 + 1);
        __int16 v16 = *((_WORD *)v14 + 1);
        LODWORD(v14) = *((_DWORD *)v14 + 1);
        *(_OWORD *)uint64_t v20 = *(_OWORD *)v22;
        *(unsigned char *)uint64_t v22 = v13;
        *(unsigned char *)(v22 + 1) = v15;
        *(_WORD *)(v22 + 2) = v16;
        *(_DWORD *)(v22 + 4) = v14;
        *(void *)(v22 + 8) = v21;
      }
      if (++v12 >= i) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_14:
    uint64_t v5 = sub_2214AB210(v5);
    *(void *)BOOL v4 = v5;
  }
  int64_t v12 = 0;
LABEL_16:
  *(void *)BOOL v4 = v5;
  swift_endAccess();

  os_log_type_t v23 = *(void **)v4;
  if (*(void *)(*(void *)v4 + 16) < (unint64_t)v12)
  {
    __break(1u);
  }
  else
  {
    uint64_t v24 = swift_bridgeObjectRetain();
    sub_2214AB8B8(v24, (uint64_t)(v23 + 4), 0, (2 * v12) | 1);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    if (!v12)
    {
LABEL_20:
      swift_endAccess();
      void *v3 = *(void *)(*(void *)v4 + 16);
      return;
    }
    if (*(void *)(*(void *)v4 + 16) >= (unint64_t)v12)
    {
      sub_2214ABA50(0, v12);
      goto LABEL_20;
    }
  }
  __break(1u);
}

uint64_t sub_2214AD338()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2214AD348(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_2214AD384()
{
  unint64_t result = qword_267F51880;
  if (!qword_267F51880)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F51880);
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2214AD428(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_2214AD4E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_2214AD544(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2214AD554(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2214AD5B0(uint64_t a1)
{
  return a1;
}

uint64_t sub_2214AD604()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2214AD644(uint64_t a1)
{
  return sub_2214A8B50(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2214AD64C@<X0>(void *a1@<X8>)
{
  *a1 = *(void *)(*(void *)(v1 + 16) + qword_26AAE9638);
  return swift_bridgeObjectRetain();
}

uint64_t sub_2214AD678(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2214AD6DC()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2214AD71C()
{
  *(void *)(*(void *)(v0 + 16) + qword_26AAE9638) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2214AD764()
{
  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_2214AD774(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_2214AD798(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2214AD7B8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 24) = v3;
  return result;
}

void type metadata accessor for AudioBufferList(uint64_t a1)
{
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_2214AD80C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 64)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2214AD82C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 64) = v3;
  return result;
}

void type metadata accessor for AudioTimeStamp(uint64_t a1)
{
}

void type metadata accessor for AudioUnitRenderActionFlags(uint64_t a1)
{
}

void type metadata accessor for AudioTimeStampFlags(uint64_t a1)
{
}

__n128 __swift_memcpy24_4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for SMPTETime(uint64_t a1)
{
}

uint64_t sub_2214AD8CC(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2214AD8EC(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for AudioBuffer(uint64_t a1)
{
}

void type metadata accessor for SMPTETimeFlags(uint64_t a1)
{
}

void type metadata accessor for SMPTETimeType(uint64_t a1)
{
}

void sub_2214AD950(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void __getAXSpringBoardServerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  -[TTSSiriSynthWrapper initWithVoicePath:language:censorPlainText:delegate:feResourcePath:](v0);
}

uint64_t sub_2214ADB88()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_2214ADB98()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_2214ADBA8()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_2214ADBB8()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_2214ADBC8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_2214ADBD8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_2214ADBE8()
{
  return MEMORY[0x270EEFE20]();
}

uint64_t sub_2214ADBF8()
{
  return MEMORY[0x270EEFE68]();
}

uint64_t sub_2214ADC08()
{
  return MEMORY[0x270EEFE80]();
}

uint64_t sub_2214ADC18()
{
  return MEMORY[0x270EEFF68]();
}

uint64_t sub_2214ADC28()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_2214ADC38()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_2214ADC48()
{
  return MEMORY[0x270EF0998]();
}

uint64_t sub_2214ADC58()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_2214ADC68()
{
  return MEMORY[0x270EF0BD8]();
}

uint64_t sub_2214ADC78()
{
  return MEMORY[0x270EF0BE8]();
}

uint64_t sub_2214ADC88()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_2214ADC98()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_2214ADCA8()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_2214ADCB8()
{
  return MEMORY[0x270F7D3D8]();
}

uint64_t sub_2214ADCC8()
{
  return MEMORY[0x270F7D3E0]();
}

uint64_t sub_2214ADCD8()
{
  return MEMORY[0x270F7D3E8]();
}

uint64_t sub_2214ADCE8()
{
  return MEMORY[0x270F7D3F0]();
}

uint64_t sub_2214ADCF8()
{
  return MEMORY[0x270F7D438]();
}

uint64_t sub_2214ADD08()
{
  return MEMORY[0x270F7D440]();
}

uint64_t sub_2214ADD18()
{
  return MEMORY[0x270F7D448]();
}

uint64_t sub_2214ADD28()
{
  return MEMORY[0x270F7D4B0]();
}

uint64_t sub_2214ADD38()
{
  return MEMORY[0x270F7D608]();
}

uint64_t sub_2214ADD48()
{
  return MEMORY[0x270F7D610]();
}

uint64_t sub_2214ADD58()
{
  return MEMORY[0x270F7D618]();
}

uint64_t sub_2214ADD68()
{
  return MEMORY[0x270F7D640]();
}

uint64_t sub_2214ADD78()
{
  return MEMORY[0x270F7D648]();
}

uint64_t sub_2214ADD88()
{
  return MEMORY[0x270F7D6D8]();
}

uint64_t sub_2214ADD98()
{
  return MEMORY[0x270F7D6E0]();
}

uint64_t sub_2214ADDA8()
{
  return MEMORY[0x270F7D6E8]();
}

uint64_t sub_2214ADDB8()
{
  return MEMORY[0x270FA2A68]();
}

uint64_t sub_2214ADDC8()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_2214ADDD8()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_2214ADDE8()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_2214ADDF8()
{
  return MEMORY[0x270F7D818]();
}

uint64_t sub_2214ADE08()
{
  return MEMORY[0x270F7D820]();
}

uint64_t sub_2214ADE18()
{
  return MEMORY[0x270F7D828]();
}

uint64_t sub_2214ADE28()
{
  return MEMORY[0x270F7D858]();
}

uint64_t sub_2214ADE38()
{
  return MEMORY[0x270F7D8B8]();
}

uint64_t sub_2214ADE48()
{
  return MEMORY[0x270F7D8E8]();
}

uint64_t sub_2214ADE58()
{
  return MEMORY[0x270F7D908]();
}

uint64_t sub_2214ADE68()
{
  return MEMORY[0x270F7D918]();
}

uint64_t sub_2214ADE78()
{
  return MEMORY[0x270F7D9D8]();
}

uint64_t sub_2214ADE88()
{
  return MEMORY[0x270F7DA00]();
}

uint64_t sub_2214ADE98()
{
  return MEMORY[0x270F7DA08]();
}

uint64_t sub_2214ADEA8()
{
  return MEMORY[0x270F7DA20]();
}

uint64_t sub_2214ADEB8()
{
  return MEMORY[0x270F7DBC8]();
}

uint64_t sub_2214ADEC8()
{
  return MEMORY[0x270F7DBD8]();
}

uint64_t sub_2214ADED8()
{
  return MEMORY[0x270F7DC10]();
}

uint64_t sub_2214ADEE8()
{
  return MEMORY[0x270FA08E0]();
}

uint64_t sub_2214ADEF8()
{
  return MEMORY[0x270FA0988]();
}

uint64_t sub_2214ADF08()
{
  return MEMORY[0x270FA0A00]();
}

uint64_t sub_2214ADF18()
{
  return MEMORY[0x270FA0A10]();
}

uint64_t sub_2214ADF28()
{
  return MEMORY[0x270FA0A48]();
}

uint64_t sub_2214ADF38()
{
  return MEMORY[0x270FA0AC0]();
}

uint64_t sub_2214ADF48()
{
  return MEMORY[0x270FA0B00]();
}

uint64_t sub_2214ADF58()
{
  return MEMORY[0x270FA0BC8]();
}

uint64_t sub_2214ADF68()
{
  return MEMORY[0x270FA0680]();
}

uint64_t sub_2214ADF78()
{
  return MEMORY[0x270FA0688]();
}

uint64_t sub_2214ADF88()
{
  return MEMORY[0x270FA0690]();
}

uint64_t sub_2214ADF98()
{
  return MEMORY[0x270FA0698]();
}

uint64_t sub_2214ADFA8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_2214ADFB8()
{
  return MEMORY[0x270FA2B68]();
}

uint64_t sub_2214ADFC8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_2214ADFD8()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2214ADFE8()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_2214ADFF8()
{
  return MEMORY[0x270EF1A60]();
}

uint64_t sub_2214AE008()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_2214AE018()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_2214AE028()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_2214AE038()
{
  return MEMORY[0x270F9D668]();
}

uint64_t sub_2214AE048()
{
  return MEMORY[0x270F9D720]();
}

uint64_t sub_2214AE058()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_2214AE068()
{
  return MEMORY[0x270F9D760]();
}

uint64_t sub_2214AE078()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_2214AE088()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2214AE098()
{
  return MEMORY[0x270F9D7C0]();
}

uint64_t sub_2214AE0A8()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_2214AE0B8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_2214AE0C8()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_2214AE0D8()
{
  return MEMORY[0x270F9D830]();
}

uint64_t sub_2214AE0E8()
{
  return MEMORY[0x270F9D840]();
}

uint64_t sub_2214AE0F8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_2214AE108()
{
  return MEMORY[0x270F9D868]();
}

uint64_t sub_2214AE118()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_2214AE128()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_2214AE138()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_2214AE148()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_2214AE158()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_2214AE168()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_2214AE178()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_2214AE188()
{
  return MEMORY[0x270EF1D50]();
}

uint64_t sub_2214AE198()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_2214AE1A8()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2214AE1B8()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_2214AE1C8()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_2214AE1D8()
{
  return MEMORY[0x270F7D738]();
}

uint64_t sub_2214AE1E8()
{
  return MEMORY[0x270FA0C50]();
}

uint64_t sub_2214AE1F8()
{
  return MEMORY[0x270FA0D50]();
}

uint64_t sub_2214AE208()
{
  return MEMORY[0x270FA0D88]();
}

uint64_t sub_2214AE218()
{
  return MEMORY[0x270FA0DB8]();
}

uint64_t sub_2214AE228()
{
  return MEMORY[0x270FA0F00]();
}

uint64_t sub_2214AE238()
{
  return MEMORY[0x270FA0F28]();
}

uint64_t sub_2214AE248()
{
  return MEMORY[0x270EF2180]();
}

uint64_t sub_2214AE258()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_2214AE268()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_2214AE278()
{
  return MEMORY[0x270F9E510]();
}

uint64_t sub_2214AE288()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_2214AE298()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_2214AE2A8()
{
  return MEMORY[0x270EF2560]();
}

uint64_t sub_2214AE2B8()
{
  return MEMORY[0x270EF25A0]();
}

uint64_t sub_2214AE2C8()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_2214AE2D8()
{
  return MEMORY[0x270F9E8C0]();
}

uint64_t sub_2214AE2E8()
{
  return MEMORY[0x270F9E8C8]();
}

uint64_t sub_2214AE2F8()
{
  return MEMORY[0x270F9E8E8]();
}

uint64_t sub_2214AE308()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_2214AE318()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_2214AE328()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_2214AE338()
{
  return MEMORY[0x270F9EA48]();
}

uint64_t sub_2214AE348()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_2214AE358()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_2214AE368()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_2214AE378()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_2214AE388()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_2214AE398()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_2214AE3A8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_2214AE3B8()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_2214AE3C8()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_2214AE3D8()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_2214AE3E8()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_2214AE3F8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_2214AE408()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_2214AE418()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_2214AE428()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_2214AE438()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_2214AE448()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_2214AE458()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_2214AE468()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AXTTSLogCommon()
{
  return MEMORY[0x270F09568]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x270F795A8]();
}

uint64_t TTSIsBaseSystem()
{
  return MEMORY[0x270F7D748]();
}

uint64_t TTSVBHasDeviceBeenUnlockedSinceBoot()
{
  return MEMORY[0x270F7DD68]();
}

uint64_t _AXSSpeechSynthesisOptions()
{
  return MEMORY[0x270F90B00]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t TTSSynthesizer::initialize()
{
  return MEMORY[0x270F71E80]();
}

uint64_t TTSSynthesizer::stop_synthesis(TTSSynthesizer *this)
{
  return MEMORY[0x270F71EA0](this);
}

uint64_t TTSSynthesizer::unload_resource()
{
  return MEMORY[0x270F71EB8]();
}

uint64_t TTSSynthesizer::set_neural_style()
{
  return MEMORY[0x270F71EC8]();
}

uint64_t TTSSynthesizer::load_voice_resource()
{
  return MEMORY[0x270F71ED0]();
}

uint64_t TTSSynthesizer::set_censor_plaintext(TTSSynthesizer *this)
{
  return MEMORY[0x270F71EF8](this);
}

uint64_t TTSSynthesizer::available_neural_styles(TTSSynthesizer *this)
{
  return MEMORY[0x270F71F10](this);
}

uint64_t TTSSynthesizer::synthesize_text_with_markers_async()
{
  return MEMORY[0x270F71F18]();
}

void TTSSynthesizer::TTSSynthesizer(TTSSynthesizer *this)
{
}

void TTSSynthesizer::~TTSSynthesizer(TTSSynthesizer *this)
{
}

const char *__cdecl std::logic_error::what(const std::logic_error *this)
{
  return (const char *)MEMORY[0x270F981F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const std::logic_error *a2)
{
  return (std::logic_error *)MEMORY[0x270F98328](this, a2);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

void std::logic_error::~logic_error(std::logic_error *this)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::terminate(void)
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

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x270F98F00](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F08](*(void *)&a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x270F98178](atoken);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x270FA03B8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x270FA0400]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x270FA0458]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x270FA0498]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x270FA04C0]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x270FA05E8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x270FA05F0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x270FA05F8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}