float skit::entity_token_wgt(skit *this, float a2)
{
  return (float)((float)(a2 * 4.0) + -1.0) / (float)(a2 + (float)(a2 * a2));
}

float skit::entity_token_wgt(skit *this)
{
  if (this > 0x10) {
    return (float)((float)((float)this * 4.0) + -1.0)
  }
         / (float)((float)this + (float)((float)this * (float)this));
  else {
}
  }

void *skit::FieldSpanMatcherV3::FieldSpanMatcherV3(void *a1, uint64_t a2, long long **a3, char a4)
{
  char v6 = a4;
  std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(a1, a2, a3, &v6);
  return a1;
}

{
  char v6;

  char v6 = a4;
  std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(a1, a2, a3, &v6);
  return a1;
}

void std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(void *a1, uint64_t a2, long long **a3, char *a4)
{
  v8 = (char *)operator new(0x5E8uLL);
  *((void *)v8 + 1) = 0;
  *((void *)v8 + 2) = 0;
  *(void *)v8 = &unk_1F2A132A8;
  if (*(char *)(a2 + 23) < 0) {
    std::basic_string<char16_t>::__init_copy_ctor_external(&v45, *(const std::basic_string<char16_t>::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::basic_string<char16_t> v45 = *(std::basic_string<char16_t> *)a2;
  }
  long long v9 = 0uLL;
  memset(v44, 0, 24);
  v10 = *a3;
  v11 = a3[1];
  v46 = v44;
  char v47 = 0;
  uint64_t v12 = (char *)v11 - (char *)v10;
  if (v11 != v10)
  {
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (v12 >> 4);
    if (v13 >= 0x555555555555556) {
      std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
    }
    *(void *)&v44[0] = std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v13);
    *((void *)&v44[0] + 1) = *(void *)&v44[0];
    *(void *)&v44[1] = *(void *)&v44[0] + 48 * v14;
    uint64_t v50 = *(void *)&v44[0];
    uint64_t v51 = *(void *)&v44[0];
    v48[0] = (void **)&v44[1];
    v48[1] = (void **)&v50;
    v48[2] = (void **)&v51;
    char v49 = 0;
    uint64_t v15 = *(void *)&v44[0];
    do
    {
      if (*((char *)v10 + 23) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)v15, *(const std::basic_string<char16_t>::value_type **)v10, *((void *)v10 + 1));
        uint64_t v17 = v51;
      }
      else
      {
        long long v16 = *v10;
        *(void *)(v15 + 16) = *((void *)v10 + 2);
        *(_OWORD *)uint64_t v15 = v16;
        uint64_t v17 = v15;
      }
      long long v18 = *(long long *)((char *)v10 + 24);
      *(void *)(v15 + 40) = *((void *)v10 + 5);
      *(_OWORD *)(v15 + 24) = v18;
      v10 += 3;
      uint64_t v15 = v17 + 48;
      uint64_t v51 = v17 + 48;
    }
    while (v10 != v11);
    char v49 = 1;
    std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<skit::Token>,skit::Token*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v48);
    *((void *)&v44[0] + 1) = v15;
    long long v9 = v44[0];
    uint64_t v12 = *(void *)&v44[1];
  }
  char v19 = *a4;
  *(_OWORD *)(v8 + 24) = v9;
  *((void *)v8 + 12) = v8 + 112;
  *((void *)v8 + 5) = v12;
  memset(v44, 0, 24);
  *((std::basic_string<char16_t> *)v8 + 2) = v45;
  memset(&v45, 0, sizeof(v45));
  *((void *)v8 + 9) = 0;
  *((_OWORD *)v8 + 5) = 0u;
  *((void *)v8 + 13) = 0x8000000000;
  *((_WORD *)v8 + 312) = 0;
  v8[626] = v19;
  v8[632] = 0;
  *((void *)v8 + 80) = v8 + 656;
  *((void *)v8 + 81) = 0x800000000;
  *(_OWORD *)(v8 + 664) = 0u;
  *((void *)v8 + 85) = v8 + 696;
  *((void *)v8 + 86) = 0x200000000;
  *((void *)v8 + 97) = v8 + 792;
  *((void *)v8 + 98) = 0x400000000;
  *((void *)v8 + 151) = v8 + 1224;
  uint64_t v20 = v9;
  *((void *)v8 + 152) = 0x400000000;
  uint64_t v21 = *((void *)&v9 + 1);
  if ((void)v9 == *((void *)&v9 + 1))
  {
    LOBYTE(v28) = 0;
LABEL_22:
    LODWORD(v28) = v28;
    goto LABEL_24;
  }
  v22 = (_DWORD *)(v9 + 24);
  std::basic_string<char16_t>::reserve((std::basic_string<char16_t> *)v8 + 3, (*(_DWORD *)(*((void *)&v9 + 1) - 20) - *(_DWORD *)(v9 + 24)));
  v23 = (std::basic_string<char16_t> *)(v8 + 72);
  do
  {
    v24 = std::basic_string<char16_t>::append(v23, (*(_DWORD *)(v20 + 24) - *v22), 32);
    int v25 = *(char *)(v20 + 23);
    if (v25 >= 0) {
      v26 = (const std::basic_string<char16_t>::value_type *)v20;
    }
    else {
      v26 = *(const std::basic_string<char16_t>::value_type **)v20;
    }
    if (v25 >= 0) {
      std::basic_string<char16_t>::size_type v27 = *(unsigned __int8 *)(v20 + 23);
    }
    else {
      std::basic_string<char16_t>::size_type v27 = *(void *)(v20 + 8);
    }
    v23 = std::basic_string<char16_t>::append(v24, v26, v27);
    v22 = (_DWORD *)(v20 + 28);
    v20 += 48;
  }
  while (v20 != v21);
  LODWORD(v28) = v8[95];
  if ((v28 & 0x80000000) == 0) {
    goto LABEL_22;
  }
  uint64_t v28 = *((void *)v8 + 10);
LABEL_24:
  if (*((_DWORD *)v8 + 27) < (v28 + 1)) {
    skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::_reserve_more((uint64_t)(v8 + 96), v28 + 1);
  }
  v43 = a1;
  uint64_t v29 = *((void *)v8 + 3);
  uint64_t v30 = *((void *)v8 + 4);
  if (v29 == v30)
  {
    LOWORD(v48[0]) = 0;
  }
  else
  {
    __int16 v31 = 0;
    int v32 = 0;
    *((_WORD *)v8 + 312) = *(_DWORD *)(v29 + 24);
    LOWORD(v48[0]) = 0;
    do
    {
      if (*(char *)(v29 + 23) < 0) {
        uint64_t v33 = *(void *)(v29 + 8);
      }
      else {
        LODWORD(v33) = *(unsigned __int8 *)(v29 + 23);
      }
      unsigned int v34 = *(_DWORD *)(v29 + 24) - v32;
      unsigned int v35 = v34 + v33;
      if (v31) {
        BOOL v36 = v35 > v34;
      }
      else {
        BOOL v36 = 0;
      }
      int v37 = v36;
      if (v36) {
        unsigned int v38 = v34 + 1;
      }
      else {
        unsigned int v38 = v34;
      }
      for (unsigned int i = v38; i; --i)
        skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::emplace_back<unsigned short &,unsigned short &>((size_t)(v8 + 96), v48, (__int16 *)v48);
      if (v38 < v35)
      {
        unsigned int v40 = *((_DWORD *)v8 + 26);
        int v41 = v33 - v37;
        do
        {
          if (v40 == *((_DWORD *)v8 + 27))
          {
            skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::_reserve_more((uint64_t)(v8 + 96), v40 + (v40 >> 1) + 1);
            unsigned int v40 = *((_DWORD *)v8 + 26);
          }
          v42 = (_WORD *)(*((void *)v8 + 12) + 4 * v40);
          _WORD *v42 = v31;
          v42[1] = v31 + 1;
          *((_DWORD *)v8 + 26) = ++v40;
          --v41;
        }
        while (v41);
      }
      LOWORD(v48[0]) = ++v31;
      int v32 = *(_DWORD *)(v29 + 28);
      v29 += 48;
    }
    while (v29 != v30);
  }
  skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::emplace_back<unsigned short &,unsigned short &>((size_t)(v8 + 96), v48, (__int16 *)v48);
  v48[0] = (void **)v44;
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100](v48);
  void *v43 = v8 + 24;
  v43[1] = v8;
}

void sub_1D2EDB64C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, char *a13, void **a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25,uint64_t a26,char *a27)
{
  skit::SmallVector<skit::AliasSpanMatch,4u,true>::~SmallVector((uint64_t)(v28 + 139));
  skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::~SmallVector((uint64_t)(v28 + 85));
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)(v28 + 73));
  uint64_t v30 = *(std::__shared_weak_count **)(v27 + 672);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  __int16 v31 = *(void **)(v27 + 640);
  if (v31 != a10) {
    free(v31);
  }
  if (*v28 != a11) {
    free(*v28);
  }
  if (*(char *)(v27 + 95) < 0) {
    operator delete(*a14);
  }
  if (*(char *)(v27 + 71) < 0) {
    operator delete(*(v28 - 6));
  }
  a27 = a13;
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  a27 = &a15;
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  std::__shared_weak_count::~__shared_weak_count((std::__shared_weak_count *)v27);
  operator delete(v32);
  _Unwind_Resume(a1);
}

void std::basic_string<char16_t>::__init_copy_ctor_external(std::basic_string<char16_t> *this, const std::basic_string<char16_t>::value_type *__s, std::basic_string<char16_t>::size_type __sz)
{
  v5 = this;
  if (__sz > 0xA)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    }
    std::basic_string<char16_t>::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((__sz | 3) != 0xB) {
      std::basic_string<char16_t>::size_type v6 = __sz | 3;
    }
    v7 = (std::basic_string<char16_t> *)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v8 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v7;
    v5 = v7;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, 2 * __sz + 2);
}

void std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 25) < 0) {
          operator delete(*(v4 - 6));
        }
        v4 -= 6;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<skit::Token>,skit::Token*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24))
  {
    uint64_t v3 = **(void **)(a1 + 16);
    uint64_t v4 = **(void **)(a1 + 8);
    while (v3 != v4)
    {
      if (*(char *)(v3 - 25) < 0) {
        operator delete(*(void **)(v3 - 48));
      }
      v3 -= 48;
    }
  }
  return a1;
}

void __clang_call_terminate(void *a1)
{
}

void std::vector<skit::Token>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(unint64_t a1)
{
  if (a1 >= 0x555555555555556) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(48 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E696E178, MEMORY[0x1E4FBA1C8]);
}

void sub_1D2EDB9C8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void std::basic_string<char16_t>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(uint64_t a1)
{
  if (a1 < 0) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(2 * a1);
}

void std::__shared_ptr_emplace<skit::internal::FieldSpanMatcherImpl>::__on_zero_shared(uint64_t a1)
{
  skit::SmallVector<skit::AliasSpanMatch,4u,true>::~SmallVector(a1 + 1208);
  skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::~SmallVector(a1 + 776);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector(a1 + 680);
  v2 = *(std::__shared_weak_count **)(a1 + 672);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  uint64_t v3 = *(void **)(a1 + 640);
  if (v3 != (void *)(a1 + 656)) {
    free(v3);
  }
  uint64_t v4 = *(void **)(a1 + 96);
  if (v4 != (void *)(a1 + 112)) {
    free(v4);
  }
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  v5 = (void **)(a1 + 24);
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100](&v5);
}

uint64_t skit::SmallVector<skit::AliasSpanMatch,4u,true>::~SmallVector(uint64_t a1)
{
  if (*(void *)a1 != a1 + 16) {
    free(*(void **)a1);
  }
  return a1;
}

uint64_t skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::~SmallVector(uint64_t a1)
{
  v2 = *(void **)a1;
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = 104 * v3;
    do
    {
      v2 = (void *)(skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl((uint64_t)v2)
                  + 104);
      v4 -= 104;
    }
    while (v4);
    v2 = *(void **)a1;
  }
  if (v2 != (void *)(a1 + 16)) {
    free(v2);
  }
  return a1;
}

uint64_t skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector(uint64_t a1)
{
  if (*(void *)a1 != a1 + 16) {
    free(*(void **)a1);
  }
  return a1;
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void skit::SmallVector<skit::AliasMatch,2u,true>::_destroy(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    uint64_t v3 = 40 * a2;
    do
    {
      if (*(char *)(a1 + 23) < 0) {
        operator delete(*(void **)a1);
      }
      a1 += 40;
      v3 -= 40;
    }
    while (v3);
  }
}

uint64_t skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl(uint64_t a1)
{
  v2 = *(void **)(a1 + 72);
  if (v2 != (void *)(a1 + 88)) {
    free(v2);
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void skit::SmallVector<skit::AliasSpanMatch,4u,true>::_destroy(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    uint64_t v3 = 72 * a2;
    do
    {
      if (*(char *)(a1 + 23) < 0) {
        operator delete(*(void **)a1);
      }
      a1 += 72;
      v3 -= 72;
    }
    while (v3);
  }
}

void std::__shared_ptr_emplace<skit::internal::FieldSpanMatcherImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2A132A8;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1D942C720);
}

void std::__shared_ptr_emplace<skit::internal::FieldSpanMatcherImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2A132A8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

BOOL skit::FieldSpanMatcherV3::is_initialized(skit::FieldSpanMatcherV3 *this)
{
  return *(void *)this != 0;
}

uint64_t skit::FieldSpanMatcherV3::query_token_stream_begin(skit::FieldSpanMatcherV3 *this)
{
  if (*(void *)this) {
    return **(void **)this;
  }
  else {
    return 0;
  }
}

{
  if (*(void *)this) {
    return **(void **)this;
  }
  else {
    return 0;
  }
}

uint64_t skit::FieldSpanMatcherV3::query_token_stream_end(skit::FieldSpanMatcherV3 *this)
{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 8);
  }
  else {
    return 0;
  }
}

{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 8);
  }
  else {
    return 0;
  }
}

uint64_t skit::FieldSpanMatcherV3::alias_span_matcher(uint64_t *a1, uint64_t a2, char a3, uint64_t a4)
{
  v8[10] = *MEMORY[0x1E4F143B8];
  v7[0] = (uint64_t)v8;
  v7[1] = 0x200000000;
  long long v6 = *(_OWORD *)a2;
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  uint64_t v4 = skit::FieldSpanMatcherV3::alias_span_matcher(a1, &v6, a3, a4, v7, 0);
  if (*((void *)&v6 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)v7);
  return v4;
}

void sub_1D2EDBF00(_Unwind_Exception *a1, uint64_t a2, std::__shared_weak_count *a3, uint64_t a4, ...)
{
  va_start(va, a4);
  if (a3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a3);
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t skit::FieldSpanMatcherV3::alias_span_matcher(uint64_t *a1, long long *a2, char a3, uint64_t a4, uint64_t *a5, int a6)
{
  uint64_t v6 = *a1;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  long long v9 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  uint64_t v7 = skit::internal::FieldSpanMatcherImpl::alias_span_matcher(v6, &v9, a3, a4, a5, a6);
  if (*((void *)&v9 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v9 + 1));
  }
  return v7;
}

void sub_1D2EDBF7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void skit::FieldSpanMatcherV3::alias_filters(uint64_t **a1, char a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  if (v3) {
    skit::internal::FieldSpanMatcherImpl::alias_filters(v3, a2, a3);
  }
}

void skit::FieldSpanMatcherV3::clear_alias_span_matcher(skit::internal::FieldSpanMatcherImpl **this)
{
  v1 = *this;
  if (v1) {
    skit::internal::FieldSpanMatcherImpl::clear_alias_span_matcher(v1);
  }
}

uint64_t skit::FieldSpanMatcherV3::query_alias_matches_begin(skit::FieldSpanMatcherV3 *this)
{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 752);
  }
  else {
    return 0;
  }
}

uint64_t skit::FieldSpanMatcherV3::query_alias_matches_end(skit::FieldSpanMatcherV3 *this)
{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 752) + 104 * *(unsigned int *)(*(void *)this + 760);
  }
  else {
    return 0;
  }
}

uint64_t skit::FieldSpanMatcherV3::match(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  v6[10] = *MEMORY[0x1E4F143B8];
  v5[0] = (uint64_t)v6;
  v5[1] = 0x200000000;
  uint64_t v3 = *a1;
  if (v3) {
    skit::internal::FieldSpanMatcherImpl::match(v3, a2, a3, v5, 0);
  }
  return skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)v5);
}

void sub_1D2EDC07C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t skit::FieldSpanMatcherV3::match(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, int a5)
{
  uint64_t result = *a1;
  if (result) {
    return skit::internal::FieldSpanMatcherImpl::match(result, a2, a3, a4, a5);
  }
  return result;
}

uint64_t skit::FieldSpanMatcherV3::merge_field(void *a1, uint64_t a2, int32x4_t *a3, char a4)
{
  if (*a1)
  {
    if ((a4 & 1) == 0) {
      *(int32x4_t *)a2 = vaddq_s32(*(int32x4_t *)a2, a3[2]);
    }
    if (a3[3].i32[2])
    {
      unsigned int v4 = *(_DWORD *)(a2 + 24);
      if (v4 == *(_DWORD *)(a2 + 28)) {
        skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_reserve_more((char **)(a2 + 16), v4 + (v4 >> 1) + 1);
      }
      skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::MergedFieldMatchImpl();
    }
  }
  return 0;
}

void skit::FieldSpanMatcherV3::finalize(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1 && *(_DWORD *)(a2 + 44))
  {
    uint64_t v4 = *(void *)v2;
    uint64_t v5 = *(void *)(v2 + 8);
    if (*(void *)v2 == v5)
    {
      int v6 = 0;
    }
    else
    {
      int v6 = 0;
      do
      {
        int v6 = *(_DWORD *)(v4 + 28) + v6 - *(_DWORD *)(v4 + 24);
        v4 += 48;
      }
      while (v4 != v5);
    }
    if (*(_DWORD *)(a2 + 56))
    {
      uint64_t v12 = a2 + 48;
      uint64_t v7 = *(_DWORD **)(a2 + 48);
      do
      {
        unsigned int v8 = v7[1] - *v7;
        if (v8 < 0x34) {
          int v9 = 4;
        }
        else {
          int v9 = 5;
        }
        if (v8 < 0x18) {
          int v9 = 3;
        }
        if (v8 < 0xB) {
          int v9 = 2;
        }
        if (v8 < 5) {
          int v9 = 1;
        }
        if (v8 >= 3) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = 0;
        }
        skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV3>(v2, (uint64_t)v7, *(_DWORD *)(a2 + 44), v6);
        BOOL v11 = v8 <= 2 && *(unsigned char *)(v2 + 602) == 0;
        if (v11 && v7[1] - *v7 > v8 && v7[2] > v10) {
          skit::SmallVector<skit::SpanMatchV3,4u,true>::erase(v12, (uint64_t)v7);
        }
        else {
          v7 += 16;
        }
      }
      while (v7 != (_DWORD *)(*(void *)(a2 + 48) + ((unint64_t)*(unsigned int *)(a2 + 56) << 6)));
    }
  }
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int *v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  void **v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v4 = *(void *)v2;
    uint64_t v5 = *(void *)(v2 + 8);
    if (*(void *)v2 == v5)
    {
      int v6 = 0;
    }
    else
    {
      int v6 = 0;
      do
      {
        int v6 = *(_DWORD *)(v4 + 28) + v6 - *(_DWORD *)(v4 + 24);
        v4 += 48;
      }
      while (v4 != v5);
    }
    uint64_t v7 = *(_DWORD *)(a2 + 24);
    if (v7)
    {
      unsigned int v8 = *(void *)(a2 + 16);
      do
      {
        int v9 = *(unsigned int *)(v8 + 8);
        if (v9)
        {
          unsigned int v10 = 0;
          BOOL v11 = 112 * v9;
          uint64_t v12 = (int *)(*(void *)v8 + 44);
          do
          {
            unint64_t v13 = *v12;
            v12 += 28;
            v10 += v13;
            v11 -= 112;
          }
          while (v11);
        }
        else
        {
          unsigned int v10 = 0;
        }
        if (*(_DWORD *)(a2 + 12) <= v10) {
          uint64_t v14 = v10;
        }
        else {
          uint64_t v14 = *(_DWORD *)(a2 + 12);
        }
        if (v14)
        {
          uint64_t v15 = *(_DWORD *)(v8 + 492) - *(_DWORD *)(v8 + 488);
          if (v15 < 0x34) {
            long long v16 = 4;
          }
          else {
            long long v16 = 5;
          }
          if (v15 < 0x18) {
            long long v16 = 3;
          }
          if (v15 < 0xB) {
            long long v16 = 2;
          }
          if (v15 < 5) {
            long long v16 = 1;
          }
          if (v15 >= 3) {
            uint64_t v17 = v16;
          }
          else {
            uint64_t v17 = 0;
          }
          skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV3>(v2, v8 + 488, v14, v6);
          if (*(unsigned char *)(v2 + 602)
            || *(_DWORD *)(v8 + 492) - *(_DWORD *)(v8 + 488) <= v15
            || *(_DWORD *)(v8 + 496) <= v17)
          {
            char v19 = *(unsigned int *)(v8 + 8);
            if (v19)
            {
              uint64_t v20 = 112 * v19;
              uint64_t v21 = *(void *)v8 + 48;
              do
              {
                if (*(_DWORD *)(v21 - 16)) {
                  skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV3>(v2, v21, *(_DWORD *)(v21 - 4), v6);
                }
                v21 += 112;
                v20 -= 112;
              }
              while (v20);
            }
            v8 += 552;
            uint64_t v7 = *(_DWORD *)(a2 + 24);
          }
          else
          {
            long long v18 = (void **)(*(void *)(a2 + 16) + 552 * *(unsigned int *)(a2 + 24));
            std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,0>((void **)(v8 + 552), v18, v8);
            skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>((uint64_t)(v18 - 69));
            uint64_t v7 = *(_DWORD *)(a2 + 24) - 1;
            *(_DWORD *)(a2 + 24) = v7;
          }
        }
        else
        {
          *(_DWORD *)(v8 + 500) = 0;
          v8 += 552;
        }
      }
      while (v8 != *(void *)(a2 + 16) + 552 * v7);
    }
  }
}

uint64_t skit::internal::AliasImpl::span_match_alias(uint64_t a1, uint64_t a2, uint64_t *a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  v65[2] = *MEMORY[0x1E4F143B8];
  uint64_t v55 = a4;
  uint64_t v10 = *a3 + 48 * a4;
  if (*(char *)(v10 + 23) < 0)
  {
    uint64_t v10 = *(void *)v10;
    uint64_t v11 = *(void *)(*a3 + 48 * a4 + 8);
  }
  else
  {
    uint64_t v11 = *(unsigned __int8 *)(v10 + 23);
  }
  uint64_t v57 = 2 * v11;
  marisa::Agent::set_query((marisa::Agent *)a6, (const char *)v10);
  if (a5 <= a4 + 1) {
    unsigned int v12 = a4 + 1;
  }
  else {
    unsigned int v12 = a5;
  }
  unsigned int v56 = v12;
LABEL_8:
  while (1)
  {
    uint64_t result = marisa::Trie::predictive_search((marisa::Trie *)(a1 + 56), (marisa::Agent *)a6);
    if (!result) {
      return result;
    }
    uint64_t v14 = *(unsigned int *)(a6 + 32);
    if (v14) {
      continue;
    }
    uint64_t v15 = *(void *)(a6 + 24);
    long long v16 = (char *)(v15 + v57);
    uint64_t v17 = *a3;
    uint64_t v18 = v15 + v14;
    unsigned int v19 = a4;
    while (1)
    {
      uint64_t v20 = v19 + 1;
      if (v20 >= a5) {
        break;
      }
      if (!*(_WORD *)v16) {
        goto LABEL_26;
      }
      uint64_t v21 = (_DWORD *)(v17 + 48 * v20);
      unsigned int v22 = v21[6] - *(_DWORD *)(v17 + 48 * v19 + 28);
      if (v22)
      {
        uint64_t v23 = 2 * v22;
        v24 = v16;
        while (*(_WORD *)v24 && *(_WORD *)v24 == 32)
        {
          v24 += 2;
          v23 -= 2;
          if (!v23) {
            goto LABEL_18;
          }
        }
        goto LABEL_8;
      }
LABEL_18:
      int v25 = &v16[2 * v22];
      if (*((char *)v21 + 23) < 0)
      {
        size_t v26 = 2 * *((void *)v21 + 1);
        if (v18 - (uint64_t)v25 < v26 + 6) {
          goto LABEL_8;
        }
        uint64_t v21 = *(_DWORD **)v21;
      }
      else
      {
        size_t v26 = 2 * *((unsigned __int8 *)v21 + 23);
        if (v18 - (uint64_t)v25 < v26 + 6) {
          goto LABEL_8;
        }
      }
      int v27 = memcmp(v25, v21, v26);
      long long v16 = &v25[v26];
      unsigned int v19 = v20;
      if (v27) {
        goto LABEL_8;
      }
    }
    uint64_t v20 = v56;
    if (*(_WORD *)v16) {
      continue;
    }
LABEL_26:
    uint64_t v28 = *(unsigned int *)(a2 + 8);
    uint64_t v29 = v16 + 4;
    unint64_t v30 = v15 + v14;
    if ((unint64_t)(v16 + 4) < v30)
    {
      __int16 v31 = *((_WORD *)v16 + 1);
      uint64_t v32 = v55 | (v20 << 32);
      do
      {
        marisa::Agent::set_query((marisa::Agent *)a7);
        marisa::Trie::reverse_lookup((marisa::Trie *)(a1 + 48), (marisa::Agent *)a7);
        std::basic_string<char16_t>::basic_string[abi:ne180100](&__p, *(void **)(a7 + 24), (unint64_t)*(unsigned int *)(a7 + 32) >> 1);
        uint64_t v33 = __p;
        v64[0] = v63;
        *(void *)((char *)v64 + 7) = *(void *)((char *)&v63 + 7);
        char v34 = HIBYTE(v63);
        __p = 0;
        long long v63 = 0uLL;
        unsigned int v35 = *(_DWORD *)(a2 + 8);
        if (v35 == *(_DWORD *)(a2 + 12))
        {
          skit::SmallVector<skit::AliasMatch,2u,true>::_reserve_more((long long **)a2, v35 + (v35 >> 1) + 1);
          unsigned int v35 = *(_DWORD *)(a2 + 8);
        }
        uint64_t v36 = *(void *)a2 + 40 * v35;
        v65[0] = v64[0];
        *(void *)((char *)v65 + 7) = *(void *)((char *)v64 + 7);
        v64[0] = 0;
        *(void *)((char *)v64 + 7) = 0;
        uint64_t v37 = v65[0];
        *(void *)uint64_t v36 = v33;
        *(void *)(v36 + 8) = v37;
        *(void *)(v36 + 15) = *(void *)((char *)v65 + 7);
        *(unsigned char *)(v36 + 23) = v34;
        *(void *)(v36 + 24) = v32;
        *(_WORD *)(v36 + 32) = v31;
        ++*(_DWORD *)(a2 + 8);
        if (SHIBYTE(v63) < 0) {
          operator delete(__p);
        }
        ++v29;
      }
      while ((unint64_t)v29 < v30);
    }
    if (v28)
    {
      uint64_t v38 = 0;
      v39 = (unsigned int *)(*(void *)a2 + 28);
      while (1)
      {
        unsigned int v40 = *v39;
        v39 += 10;
        if (v40 > a4) {
          break;
        }
        if (v28 == ++v38) {
          goto LABEL_8;
        }
      }
      uint64_t v41 = v38;
      while (1)
      {
        while (1)
        {
          LODWORD(v42) = *(_DWORD *)(a2 + 8);
          if (v28 < v42) {
            break;
          }
LABEL_58:
          if (++v41 >= (unint64_t)v28) {
            goto LABEL_8;
          }
        }
        unint64_t v43 = v28;
        while (1)
        {
          while (1)
          {
            v44 = *(long long **)a2;
            uint64_t v45 = *(void *)a2 + 40 * v43;
            if (*(unsigned __int16 *)(*(void *)a2 + 40 * v41 + 32) != *(unsigned __int16 *)(v45 + 32)) {
              goto LABEL_57;
            }
            v46 = (char *)v44 + 40 * v41;
            char v47 = (char *)v44 + 40 * v43;
            unsigned int v48 = *((_DWORD *)v46 + 6);
            unsigned int v49 = *((_DWORD *)v46 + 7);
            unsigned int v51 = *((_DWORD *)v47 + 6);
            unsigned int v50 = *((_DWORD *)v47 + 7);
            if (v48 == v51 && v49 == v50) {
              goto LABEL_57;
            }
            if (v51 < v48 || v50 > v49) {
              break;
            }
            skit::SmallVector<skit::AliasMatch,2u,true>::erase(a2, v45);
            unint64_t v42 = *(unsigned int *)(a2 + 8);
            if (v43 >= v42) {
              goto LABEL_58;
            }
          }
          if (v48 >= v51 && v49 <= v50) {
            break;
          }
LABEL_57:
          if (++v43 >= v42) {
            goto LABEL_58;
          }
        }
        skit::SmallVector<skit::AliasMatch,2u,true>::erase(a2, (uint64_t)v44 + 40 * v41);
        uint64_t v28 = (v28 - 1);
        if (v41 == v28) {
          goto LABEL_8;
        }
      }
    }
  }
}

void sub_1D2EDCA60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (v24 < 0) {
    operator delete(v25);
  }
  if (a24 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *std::basic_string<char16_t>::basic_string[abi:ne180100](void *__dst, void *__src, unint64_t a3)
{
  if (a3 >= 0xB)
  {
    uint64_t v7 = (a3 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a3 | 3) != 0xB) {
      uint64_t v7 = a3 | 3;
    }
    int v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v7 + 1);
    __dst[1] = a3;
    __dst[2] = v8 | 0x8000000000000000;
    *__dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = a3;
    int v6 = __dst;
    if (!a3) {
      goto LABEL_8;
    }
  }
  memmove(v6, __src, 2 * a3);
LABEL_8:
  *((_WORD *)v6 + a3) = 0;
  return __dst;
}

uint64_t skit::SmallVector<skit::AliasMatch,2u,true>::erase(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1 + 40 * *(unsigned int *)(a1 + 8);
  for (uint64_t i = a2 + 40; i != v4; i += 40)
  {
    int v6 = (void **)(i - 40);
    if (*(char *)(i - 17) < 0) {
      operator delete(*v6);
    }
    *(_OWORD *)int v6 = *(_OWORD *)i;
    uint64_t v7 = *(void *)(i + 24);
    *(void *)(i - 24) = *(void *)(i + 16);
    *(unsigned char *)(i + 23) = 0;
    *(_WORD *)uint64_t i = 0;
    *(void *)(i - 16) = v7;
    *(_WORD *)(i - 8) = *(_WORD *)(i + 32);
  }
  if (*(char *)(v4 - 17) < 0) {
    operator delete(*(void **)(v4 - 40));
  }
  --*(_DWORD *)(a1 + 8);
  return a2;
}

size_t skit::SmallVector<skit::AliasMatch,2u,true>::_reserve_more(long long **a1, unsigned int a2)
{
  uint64_t v3 = (long long *)malloc_type_malloc(40 * a2, 0x10120408116F198uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v14 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v14, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  uint64_t v4 = v3;
  uint64_t v5 = *a1;
  uint64_t v6 = *((unsigned int *)a1 + 2);
  if (v6)
  {
    uint64_t v7 = v3;
    uint64_t v8 = *a1;
    do
    {
      long long v9 = *v8;
      *((void *)v7 + 2) = *((void *)v8 + 2);
      long long *v7 = v9;
      *((void *)v8 + 1) = 0;
      *((void *)v8 + 2) = 0;
      *(void *)uint64_t v8 = 0;
      uint64_t v10 = *((void *)v8 + 3);
      *((_WORD *)v7 + 16) = *((_WORD *)v8 + 16);
      *((void *)v7 + 3) = v10;
      uint64_t v8 = (long long *)((char *)v8 + 40);
      uint64_t v7 = (long long *)((char *)v7 + 40);
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

size_t skit::SmallVector<std::tuple<std::basic_string<char16_t>,skit::GroupId>,2u,true>::_reserve_more(long long **a1, unsigned int a2)
{
  uint64_t v3 = (long long *)malloc_type_malloc(32 * a2, 0x1012040F4512C97uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unint64_t v13 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v13, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  uint64_t v4 = v3;
  uint64_t v5 = *a1;
  uint64_t v6 = *((unsigned int *)a1 + 2);
  if (v6)
  {
    uint64_t v7 = v3;
    uint64_t v8 = *a1;
    do
    {
      long long v9 = *v8;
      *((void *)v7 + 2) = *((void *)v8 + 2);
      long long *v7 = v9;
      *((void *)v8 + 1) = 0;
      *((void *)v8 + 2) = 0;
      *(void *)uint64_t v8 = 0;
      *((_WORD *)v7 + 12) = *((_WORD *)v8 + 12);
      v8 += 2;
      v7 += 2;
    }
    while (v8 != &v5[2 * v6]);
    uint64_t v10 = 32 * v6;
    do
    {
      if (*((char *)v5 + 23) < 0) {
        operator delete(*(void **)v5);
      }
      v5 += 2;
      v10 -= 32;
    }
    while (v10);
    uint64_t v5 = *a1;
  }
  if (v5 != (long long *)(a1 + 2)) {
    free(v5);
  }
  *a1 = v4;
  size_t result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result >> 5;
  return result;
}

uint64_t skit::internal::BlobFile::flush_internal_cache(skit::internal::BlobFile *this)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = (const void *)*((void *)this + 6);
  if (!v1) {
    return 0;
  }
  size_t v3 = *((void *)this + 7);
  if (!v3) {
    return 0;
  }
  ssize_t v4 = write(*((_DWORD *)this + 6), v1, v3);
  if (v4 == *((void *)this + 7))
  {
    uint64_t result = 0;
    *((void *)this + 7) = 0;
  }
  else
  {
    ssize_t v10 = v4;
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v6 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = this;
      if (*((char *)this + 23) < 0) {
        uint64_t v7 = *(skit::internal::BlobFile **)this;
      }
      uint64_t v8 = *((void *)this + 7);
      int v9 = *__error();
      *(_DWORD *)buf = 136446978;
      unsigned int v12 = v7;
      __int16 v13 = 2048;
      ssize_t v14 = v10;
      __int16 v15 = 2048;
      uint64_t v16 = v8;
      __int16 v17 = 1024;
      int v18 = v9;
      _os_log_error_impl(&dword_1D2EDA000, v6, OS_LOG_TYPE_ERROR, "BlobFile::write_internal_cache : blob write failed @ %{public}s : %li < %lu : %{darwin.errno}d", buf, 0x26u);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t skit::internal::BlobFile::open(skit::internal::BlobFile *this, int a2, int a3, unsigned int a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (*((_DWORD *)this + 6) != -1) {
    return 0;
  }
  ssize_t v4 = this;
  if (*((char *)this + 23) < 0)
  {
    if (!*((void *)this + 1))
    {
LABEL_13:
      if (skit::internal::get_logging_context(void)::once != -1) {
      uint64_t v7 = skit::internal::get_logging_context(void)::logger;
      }
      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
        return 0xFFFFFFFFLL;
      }
      LOWORD(v20.st_dev) = 0;
      uint64_t v8 = "BlobFile::open : file path not set";
      int v9 = v7;
      uint32_t v10 = 2;
LABEL_28:
      _os_log_error_impl(&dword_1D2EDA000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v20, v10);
      return 0xFFFFFFFFLL;
    }
    this = *(skit::internal::BlobFile **)this;
  }
  else if (!*((unsigned char *)this + 23))
  {
    goto LABEL_13;
  }
  int v5 = open_dprotected_np((const char *)this, a2, a3, 0, a4);
  *((_DWORD *)v4 + 6) = v5;
  if (v5 < 0)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v11 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      return 0xFFFFFFFFLL;
    }
    if (*((char *)v4 + 23) < 0) {
      ssize_t v4 = *(skit::internal::BlobFile **)v4;
    }
    int v13 = *__error();
    v20.st_dev = 136446466;
    *(void *)&v20.st_mode = v4;
    WORD2(v20.st_ino) = 1024;
    *(_DWORD *)((char *)&v20.st_ino + 6) = v13;
    uint64_t v8 = "BlobFile::open : open blob file failed @ %{public}s : %{darwin.errno}d";
    int v9 = v11;
    uint32_t v10 = 18;
    goto LABEL_28;
  }
  memset(&v20, 0, sizeof(v20));
  if (fstat(v5, &v20))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    unsigned int v12 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      ssize_t v14 = v4;
      if (*((char *)v4 + 23) < 0) {
        ssize_t v14 = *(skit::internal::BlobFile **)v4;
      }
      int v15 = *__error();
      *(_DWORD *)buf = 136446466;
      __int16 v17 = v14;
      __int16 v18 = 1024;
      int v19 = v15;
      _os_log_error_impl(&dword_1D2EDA000, v12, OS_LOG_TYPE_ERROR, "BlobFile::open : stat blob file failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
    }
    close(*((_DWORD *)v4 + 6));
    uint64_t result = 0xFFFFFFFFLL;
    *((_DWORD *)v4 + 6) = -1;
  }
  else
  {
    if (*((void *)v4 + 8)) {
      operator new[]();
    }
    uint64_t result = 0;
    *((void *)v4 + 4) = v20.st_size;
  }
  return result;
}

uint64_t skit::internal::BlobFile::close(skit::internal::BlobFile *this)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((*((_DWORD *)this + 6) & 0x80000000) != 0) {
    return 0;
  }
  uint64_t v2 = skit::internal::BlobFile::flush_internal_cache(this);
  if (close(*((_DWORD *)this + 6)))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    int v5 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = this;
      if (*((char *)this + 23) < 0) {
        uint64_t v6 = *(skit::internal::BlobFile **)this;
      }
      int v7 = *__error();
      int v8 = 136446466;
      int v9 = v6;
      __int16 v10 = 1024;
      int v11 = v7;
      _os_log_error_impl(&dword_1D2EDA000, v5, OS_LOG_TYPE_ERROR, "BlobFile::close : blob file close failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v8, 0x12u);
    }
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  uint64_t v3 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v3) {
    MEMORY[0x1D942C700](v3, 0x1000C8077774924);
  }
  *((_DWORD *)this + 6) = -1;
  *((void *)this + 4) = 0;
  if (*((char *)this + 23) < 0)
  {
    **(unsigned char **)this = 0;
    *((void *)this + 1) = 0;
  }
  else
  {
    *(unsigned char *)this = 0;
    *((unsigned char *)this + 23) = 0;
  }
  return v2;
}

uint64_t skit::internal::BlobFile::clear(skit::internal::BlobFile *this, std::error_code *a2)
{
  uint64_t result = *((unsigned int *)this + 6);
  if ((result & 0x80000000) == 0)
  {
    uint64_t result = close(result);
    *((_DWORD *)this + 6) = -1;
    *((void *)this + 4) = 0;
  }
  if (*((char *)this + 23) < 0)
  {
    if (!*((void *)this + 1)) {
      return result;
    }
    uint64_t result = *(void *)this;
  }
  else
  {
    uint64_t result = (uint64_t)this;
    if (!*((unsigned char *)this + 23)) {
      return result;
    }
  }
  uint64_t result = remove((const std::__fs::filesystem::path *)result, a2);
  if (*((char *)this + 23) < 0)
  {
    **(unsigned char **)this = 0;
    *((void *)this + 1) = 0;
  }
  else
  {
    *(unsigned char *)this = 0;
    *((unsigned char *)this + 23) = 0;
  }
  return result;
}

void skit::internal::BlobFile::append(skit::internal::BlobFile *this, const iovec *a2, iovec *a3, unsigned int a4)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = -1;
  if (a3)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = a4;
    do
    {
      if (!a3[v7].iov_base)
      {
        if (skit::internal::get_logging_context(void)::once != -1) {
        uint64_t v35 = skit::internal::get_logging_context(void)::logger;
        }
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          int v24 = "BlobFile::append : invalid iov_base pointer";
          goto LABEL_35;
        }
        return;
      }
      __int16 v10 = &a3[v7];
      size_t iov_len = a3[v7].iov_len;
      if (!iov_len)
      {
        if (skit::internal::get_logging_context(void)::once != -1) {
        uint64_t v38 = skit::internal::get_logging_context(void)::logger;
        }
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          size_t v39 = v10->iov_len;
          *(_DWORD *)buf = 134217984;
          uint64_t v45 = (const iovec *)v39;
          int v24 = "BlobFile::append : invalid iov_len : %lu";
          uint64_t v36 = v38;
          uint32_t v37 = 12;
          goto LABEL_40;
        }
        return;
      }
      v8 += iov_len;
      ++v7;
    }
    while (a4 != v7);
    if ((unint64_t)a2[2].iov_base + v8 > a2[2].iov_len) {
      return;
    }
    iov_base = (char *)a2[3].iov_base;
    if (iov_base)
    {
      size_t v13 = a2[3].iov_len;
      if ((void *)(v13 + v8) < a2[4].iov_base)
      {
        ssize_t v14 = &iov_base[v13];
        p_size_t iov_len = &a3->iov_len;
        do
        {
          memcpy(v14, (const void *)*(p_iov_len - 1), *p_iov_len);
          size_t v16 = *p_iov_len;
          p_iov_len += 2;
          v14 += v16;
          --v9;
        }
        while (v9);
        size_t v17 = a2[3].iov_len + v8;
LABEL_28:
        a2[3].size_t iov_len = v17;
LABEL_29:
        char v34 = (char *)a2[2].iov_base;
        *(void *)this = v34;
        *((void *)this + 1) = v8;
        *((_DWORD *)this + 4) = 0;
        a2[2].iov_base = &v34[v8];
        return;
      }
      if (v13) {
        int v25 = a4 + 1;
      }
      else {
        int v25 = a4;
      }
      MEMORY[0x1F4188790]();
      int v27 = (iovec *)&buf[-16 * v26];
      bzero(v27, v28);
      if (v13)
      {
        v27->iov_base = iov_base;
        v27->size_t iov_len = v13;
      }
      uint64_t v29 = &a3->iov_len;
      unint64_t v30 = &v27[v13 != 0].iov_len;
      do
      {
        size_t v31 = *(v29 - 1);
        size_t v32 = *v29;
        v29 += 2;
        *(v30 - 1) = v31;
        *unint64_t v30 = v32;
        v30 += 2;
        --v9;
      }
      while (v9);
      ssize_t v33 = writev(a2[1].iov_len, v27, v25);
      if (v33 == a2[3].iov_len + v8)
      {
        size_t v17 = 0;
        goto LABEL_28;
      }
      ssize_t v40 = v33;
      if (skit::internal::get_logging_context(void)::once != -1) {
      uint64_t v20 = skit::internal::get_logging_context(void)::logger;
      }
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v41 = a2;
        if (SHIBYTE(a2[1].iov_base) < 0) {
          uint64_t v41 = (const iovec *)a2->iov_base;
        }
        size_t v42 = a2[3].iov_len;
        int v43 = *__error();
        *(_DWORD *)buf = 136446978;
        uint64_t v45 = v41;
        __int16 v46 = 2048;
        ssize_t v47 = v40;
        __int16 v48 = 2048;
        size_t v49 = v42;
        __int16 v50 = 1024;
        int v51 = v43;
        int v24 = "BlobFile::append : blob write failed @ %{public}s : %li < %lu : %{darwin.errno}d";
LABEL_51:
        uint64_t v36 = v20;
        uint32_t v37 = 38;
        goto LABEL_40;
      }
    }
    else
    {
      ssize_t v18 = writev(a2[1].iov_len, a3, a4);
      if (v18 == v8) {
        goto LABEL_29;
      }
      ssize_t v19 = v18;
      if (skit::internal::get_logging_context(void)::once != -1) {
      uint64_t v20 = skit::internal::get_logging_context(void)::logger;
      }
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = a2;
        if (SHIBYTE(a2[1].iov_base) < 0) {
          uint64_t v21 = (const iovec *)a2->iov_base;
        }
        size_t v22 = a2[3].iov_len;
        int v23 = *__error();
        *(_DWORD *)buf = 136446978;
        uint64_t v45 = v21;
        __int16 v46 = 2048;
        ssize_t v47 = v19;
        __int16 v48 = 2048;
        size_t v49 = v22;
        __int16 v50 = 1024;
        int v51 = v23;
        int v24 = "BlobFile::append : blob write failed @ %{public}s : %li < %lu : %{darwin.errno}d";
        goto LABEL_51;
      }
    }
  }
  else
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v35 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      int v24 = "BlobFile::append : invalid iov pointer";
LABEL_35:
      uint64_t v36 = v35;
      uint32_t v37 = 2;
LABEL_40:
      _os_log_error_impl(&dword_1D2EDA000, v36, OS_LOG_TYPE_ERROR, v24, buf, v37);
    }
  }
}

uint64_t skit::internal::BlobFile::flush(skit::internal::BlobFile *this, char a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((*((_DWORD *)this + 6) & 0x80000000) != 0)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v7 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      return 0xFFFFFFFFLL;
    }
    v18[0] = 0;
    uint64_t v8 = "BlobFile::flush : file is not open";
    uint64_t v9 = (uint8_t *)v18;
    __int16 v10 = v7;
    uint32_t v11 = 2;
LABEL_19:
    _os_log_error_impl(&dword_1D2EDA000, v10, OS_LOG_TYPE_ERROR, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
  if (skit::internal::BlobFile::flush_internal_cache(this)) {
    return 0xFFFFFFFFLL;
  }
  int v5 = *((_DWORD *)this + 6);
  if (a2) {
    int v6 = fcntl(v5, 51);
  }
  else {
    int v6 = fsync(v5);
  }
  if (v6 < 0)
  {
    int v12 = *__error();
    if (fcntl(*((_DWORD *)this + 6), 50, v18) == -1) {
      LOBYTE(v18[0]) = 0;
    }
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v13 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      return 0xFFFFFFFFLL;
    }
    *(_DWORD *)buf = 136446466;
    int v15 = v18;
    __int16 v16 = 1024;
    int v17 = v12;
    uint64_t v8 = "BlobFile::flush : file sync failed @ %{public}s : %{darwin.errno}d";
    uint64_t v9 = buf;
    __int16 v10 = v13;
    uint32_t v11 = 18;
    goto LABEL_19;
  }
  return 0;
}

void skit::internal::BlobFile::resize(skit::internal::BlobFile *this, off_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!skit::internal::BlobFile::flush_internal_cache(this))
  {
    if (ftruncate(*((_DWORD *)this + 6), a2))
    {
      int v4 = *__error();
      if (fcntl(*((_DWORD *)this + 6), 50, v10) == -1) {
        v10[0] = 0;
      }
      if (skit::internal::get_logging_context(void)::once != -1) {
      int v5 = skit::internal::get_logging_context(void)::logger;
      }
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v7 = v10;
        __int16 v8 = 1024;
        int v9 = v4;
        _os_log_error_impl(&dword_1D2EDA000, v5, OS_LOG_TYPE_ERROR, "BlobFile::resize : file truncate failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
      }
    }
    else
    {
      *((void *)this + 4) = a2;
    }
  }
}

float skit::SpanMatchV3::score(skit::SpanMatchV3 *this)
{
  return *((float *)this + 3);
}

uint64_t skit::SpanMatchV3::score(uint64_t this, float a2)
{
  *(float *)(this + 12) = a2;
  return this;
}

uint64_t skit::SpanMatchV3::token_cnt(skit::SpanMatchV3 *this)
{
  return *((unsigned int *)this + 4);
}

uint64_t skit::SpanMatchV3::token_cnt(uint64_t this, int a2)
{
  *(_DWORD *)(this + 16) = a2;
  return this;
}

uint64_t skit::SpanMatchV3::stop_word_cnt(skit::SpanMatchV3 *this)
{
  return *((unsigned int *)this + 5);
}

uint64_t skit::SpanMatchV3::stop_word_cnt(uint64_t this, int a2)
{
  *(_DWORD *)(this + 20) = a2;
  return this;
}

uint64_t skit::SpanMatchV3::alias_token_cnt(skit::SpanMatchV3 *this)
{
  return *((unsigned int *)this + 6);
}

uint64_t skit::SpanMatchV3::alias_token_cnt(uint64_t this, int a2)
{
  *(_DWORD *)(this + 24) = a2;
  return this;
}

uint64_t skit::SpanMatchV3::alias_ids(skit::SpanMatchV3 *this)
{
  return (uint64_t)this + 32;
}

size_t skit::SpanMatchV3::append_alias_id(size_t result, unsigned __int16 a2, int a3)
{
  size_t v3 = result;
  *(_DWORD *)(result + 24) += a3;
  int v5 = *(unsigned __int16 **)(result + 32);
  uint64_t v6 = *(unsigned int *)(result + 40);
  uint64_t v7 = &v5[v6];
  if (v6)
  {
    uint64_t v8 = 2 * v6;
    while (1)
    {
      unsigned int v9 = *v5;
      if (v9 == a2) {
        break;
      }
      if (v9 > a2) {
        goto LABEL_7;
      }
      ++v5;
      v8 -= 2;
      if (!v8)
      {
        int v5 = v7;
        goto LABEL_7;
      }
    }
  }
  else
  {
LABEL_7:
    unsigned int v10 = v6 + 1;
    if ((v6 + 1) <= *(_DWORD *)(result + 44))
    {
      if (v7 != v5)
      {
        uint64_t v20 = v7;
        do
        {
          unsigned __int16 v21 = *--v20;
          unsigned __int16 *v7 = v21;
          uint64_t v7 = v20;
        }
        while (v20 != v5);
        uint64_t v7 = v5;
      }
    }
    else
    {
      unsigned int v11 = v10 + (v6 >> 1);
      if (v11 <= v10) {
        unsigned int v12 = v10;
      }
      else {
        unsigned int v12 = v11;
      }
      uint64_t v13 = (unsigned __int16 *)skit::SmallVector<skit::GroupId,4u,true>::allocate(v12);
      ssize_t v14 = *(unsigned __int16 **)(v3 + 32);
      int v15 = v5;
      uint64_t v7 = v13;
      if (v14 != v5)
      {
        uint64_t v7 = v13;
        do
        {
          unsigned __int16 v16 = *v14++;
          *v7++ = v16;
        }
        while (v14 != v5);
        int v15 = *(unsigned __int16 **)(v3 + 32);
      }
      int v17 = &v15[*(unsigned int *)(v3 + 40)];
      if (v17 != v5)
      {
        ssize_t v18 = v7 + 1;
        do
        {
          __int16 v19 = *v5++;
          *v18++ = v19;
        }
        while (v5 != v17);
        int v15 = *(unsigned __int16 **)(v3 + 32);
      }
      if (v15 != (unsigned __int16 *)(v3 + 48)) {
        free(v15);
      }
      *(void *)(v3 + 32) = v13;
      uint64_t result = malloc_size(v13);
      *(_DWORD *)(v3 + 44) = result >> 1;
    }
    *(_DWORD *)(v3 + 40) = v10;
    unsigned __int16 *v7 = a2;
  }
  return result;
}

void *skit::SmallVector<skit::GroupId,4u,true>::allocate(unsigned int a1)
{
  uint64_t result = malloc_type_malloc(2 * a1, 0x1000040BDFB0063uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    size_t v3 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v3, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  return result;
}

void *skit::SpanMatchV3::span(void *result, void *a2)
{
  void *result = *a2;
  return result;
}

uint64_t skit::SpanMatchV3::edit_dist(skit::SpanMatchV3 *this)
{
  return *((unsigned int *)this + 2);
}

uint64_t skit::SpanMatchV3::edit_dist(uint64_t this, int a2)
{
  *(_DWORD *)(this + 8) = a2;
  return this;
}

BOOL skit::SpanMatchV3::is_subspan_of(skit::SpanMatchV3 *this, unsigned int a2, unsigned int a3)
{
  return *(_DWORD *)this >= a2 && *((_DWORD *)this + 1) <= a3;
}

BOOL skit::SpanMatchV3::is_subspan_of(skit::SpanMatchV3 *this, const skit::SpanMatchV3 *a2)
{
  return *(_DWORD *)this >= *(_DWORD *)a2 && *((_DWORD *)this + 1) <= *((_DWORD *)a2 + 1);
}

size_t skit::SpanMatchV3::merge(size_t this, int32x2_t *a2)
{
  LODWORD(v2) = *(_DWORD *)this;
  LODWORD(v3) = *(_DWORD *)(this + 4);
  unsigned int v4 = a2->u32[1];
  if (a2->i32[0] >= *(_DWORD *)this) {
    uint64_t v2 = v2;
  }
  else {
    uint64_t v2 = a2->u32[0];
  }
  if (v3 <= v4) {
    uint64_t v3 = v4;
  }
  else {
    uint64_t v3 = v3;
  }
  *(void *)this = v2 | (v3 << 32);
  *(_DWORD *)(this + 8) += a2[1].i32[0];
  *(float *)(this + 12) = *(float *)&a2[1].i32[1] + *(float *)(this + 12);
  *(int32x2_t *)(this + 16) = vadd_s32(*(int32x2_t *)(this + 16), a2[2]);
  *(_DWORD *)(this + 24) += a2[3].i32[0];
  uint64_t v5 = a2[5].u32[0];
  if (v5)
  {
    size_t v6 = this;
    if (*(_DWORD *)(this + 40))
    {
      uint64_t v7 = (unsigned __int16 *)a2[4];
      uint64_t v8 = 2 * v5;
      do
      {
        unsigned __int16 v9 = *v7++;
        this = skit::SpanMatchV3::append_alias_id(v6, v9, 0);
        v8 -= 2;
      }
      while (v8);
    }
    else if ((int32x2_t *)this != a2)
    {
      unsigned int v10 = (__int16 *)a2[4];
      if (*(_DWORD *)(this + 44) >= v5)
      {
        unsigned __int16 v16 = *(_WORD **)(this + 32);
        uint64_t v17 = 2 * v5;
        do
        {
          __int16 v18 = *v10++;
          *v16++ = v18;
          v17 -= 2;
        }
        while (v17);
      }
      else
      {
        if (v5 <= 1) {
          unsigned int v11 = 1;
        }
        else {
          unsigned int v11 = a2[5].u32[0];
        }
        unsigned int v12 = (char *)skit::SmallVector<skit::GroupId,4u,true>::allocate(v11);
        uint64_t v13 = v12;
        for (uint64_t i = 0; i != v5; ++i)
          *(_WORD *)&v12[i * 2] = v10[i];
        int v15 = *(void **)(v6 + 32);
        if (v15 != (void *)(v6 + 48)) {
          free(v15);
        }
        *(void *)(v6 + 32) = v13;
        this = malloc_size(v13);
        *(_DWORD *)(v6 + 44) = this >> 1;
      }
      *(_DWORD *)(v6 + 40) = v5;
    }
  }
  return this;
}

double skit::SpanMatchV3::operator skit::SpanMatchV2@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int v2 = *(_DWORD *)(a1 + 8);
  int v3 = *(_DWORD *)(a1 + 12);
  *(void *)a2 = *(void *)a1;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = v3;
  double result = *(double *)(a1 + 16);
  *(double *)(a2 + 16) = result;
  *(void *)(a2 + 24) = *(unsigned int *)(a1 + 24);
  return result;
}

BOOL skit::operator<(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a1 + 12);
  float v3 = *(float *)(a2 + 12);
  if (v2 < v3) {
    return 1;
  }
  if (v2 > v3) {
    return 0;
  }
  unsigned int v4 = *(_DWORD *)(a1 + 24);
  unsigned int v5 = *(_DWORD *)(a2 + 24);
  if (v4 > v5) {
    return 1;
  }
  if (v4 < v5) {
    return 0;
  }
  unsigned int v6 = *(_DWORD *)(a1 + 8);
  unsigned int v7 = *(_DWORD *)(a2 + 8);
  if (v6 > v7) {
    return 1;
  }
  return v6 >= v7 && *(_DWORD *)(a1 + 20) > *(_DWORD *)(a2 + 20);
}

void *skit::operator<<(void *a1, uint64_t a2)
{
  unsigned int v4 = (void *)std::ostream::operator<<();
  char v17 = 58;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)&v17, 1);
  unsigned int v5 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)" (", 2);
  unsigned int v6 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)") score=", 8);
  unsigned int v7 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)" token_cnt=", 11);
  uint64_t v8 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)" stop_word_cnt=", 15);
  unsigned __int16 v9 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" alias_token_cnt=", 17);
  unsigned int v10 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)" group_ids={ ", 13);
  uint64_t v11 = *(unsigned int *)(a2 + 40);
  if (v11)
  {
    uint64_t v12 = *(void *)(a2 + 32);
    uint64_t v13 = 2 * v11;
    do
    {
      v12 += 2;
      ssize_t v14 = (void *)std::ostream::operator<<();
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)", ", 2);
      v13 -= 2;
    }
    while (v13);
  }
  char v16 = 125;
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)&v16, 1);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1D942C590](v23, a1);
  if (v23[0])
  {
    unsigned int v6 = (char *)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      unsigned int v10 = std::locale::use_facet(&__b, MEMORY[0x1E4FBA258]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }
    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0 : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }
    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8) {
        std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000;
        __b.__locale_ = p_b;
      }
      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }
      memset(p_b, v9, v16);
      *((unsigned char *)p_b + v16) = 0;
      uint64_t v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }
    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0;
    }
    else
    {
LABEL_29:
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | 5);
    }
  }
  MEMORY[0x1D942C5A0](v23);
  return a1;
}

void sub_1D2EDE4F8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x1D942C5A0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1D2EDE4CCLL);
}

void sub_1D2EDE564(_Unwind_Exception *a1)
{
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unsigned int v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    int v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unsigned int v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

std::__fs::filesystem::path *std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>(std::__fs::filesystem::path *this, unint64_t *a2)
{
  if (a2[1] && *(_WORD *)*a2 == 47)
  {
    if (SHIBYTE(this->__pn_.__r_.__value_.__r.__words[2]) < 0)
    {
      *this->__pn_.__r_.__value_.__l.__data_ = 0;
      this->__pn_.__r_.__value_.__l.__size_ = 0;
    }
    else
    {
      this->__pn_.__r_.__value_.__s.__data_[0] = 0;
      *((unsigned char *)&this->__pn_.__r_.__value_.__s + 23) = 0;
    }
  }
  else if (std::__fs::filesystem::path::__filename(this).__size_)
  {
    std::string::push_back(&this->__pn_, 47);
  }
  std::__fs::filesystem::_PathCVT<char16_t>::__append_range[abi:ne180100](&this->__pn_, *a2, *a2 + 2 * a2[1]);
  return this;
}

uint64_t std::__fs::filesystem::_PathCVT<char16_t>::__append_range[abi:ne180100](std::string *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v9[0] = MEMORY[0x1E4FBA478] + 16;
  v9[1] = 0;
  if (a2 < a3)
  {
    unint64_t v4 = a2;
    do
    {
      unint64_t v10 = v4;
      if ((*(unsigned int (**)(void *, unsigned char *, unint64_t, unint64_t, unint64_t *, unsigned char *, unsigned char *, unint64_t *))(v9[0] + 24))(v9, v13, v4, a3, &v10, v12, v13, &v11) == 2|| v10 == v4)
      {
        std::__throw_runtime_error("locale not supported");
        __break(1u);
      }
      unint64_t v4 = v10;
      if ((unint64_t)v12 < v11)
      {
        std::string::size_type v7 = v12;
        do
          std::string::push_back(a1, *v7++);
        while ((unint64_t)v7 < v11);
        unint64_t v4 = v10;
      }
    }
    while (v4 < a3);
  }
  return MEMORY[0x1D942C5F0](v9);
}

void sub_1D2EDE7F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  MEMORY[0x1D942C5F0](va);
  _Unwind_Resume(a1);
}

std::string *std::string::append[abi:ne180100]<char const*,0>(std::string *this, std::string *a2, std::string *a3)
{
  unint64_t v4 = a2;
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  unint64_t v7 = (char *)a3 - (char *)a2;
  if ((v6 & 0x80000000) != 0)
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = this->__r_.__value_.__l.__size_;
    unint64_t v11 = this->__r_.__value_.__r.__words[2];
    std::string::size_type v9 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    unint64_t v10 = (std::string *)this->__r_.__value_.__r.__words[0];
    unint64_t v6 = HIBYTE(v11);
  }
  else
  {
    if (a3 == a2) {
      return this;
    }
    std::string::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
    std::string::size_type v9 = 22;
    unint64_t v10 = this;
  }
  if (v10 > v4 || (std::string *)((char *)&v10->__r_.__value_.__l.__data_ + size + 1) <= v4)
  {
    if (v9 - size < v7)
    {
      std::string::__grow_by(this, v9, size - v9 + v7, size, size, 0, 0);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v6) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    uint64_t v13 = this;
    if ((v6 & 0x80) != 0) {
      uint64_t v13 = (std::string *)this->__r_.__value_.__r.__words[0];
    }
    uint64_t v14 = (char *)v13 + size;
    do
    {
      std::string::value_type v15 = v4->__r_.__value_.__s.__data_[0];
      unint64_t v4 = (std::string *)((char *)v4 + 1);
      *v14++ = v15;
    }
    while (v4 != a3);
    *uint64_t v14 = 0;
    std::string::size_type v16 = v7 + size;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v16;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v16 & 0x7F;
    }
  }
  else
  {
    if (v7 >= 0x7FFFFFFFFFFFFFF8) {
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    }
    if (v7 > 0x16)
    {
      uint64_t v17 = (v7 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v7 | 7) != 0x17) {
        uint64_t v17 = v7 | 7;
      }
      uint64_t v18 = v17 + 1;
      p_p = (std::string::value_type *)operator new(v17 + 1);
      std::string::size_type v24 = v7;
      int64_t v25 = v18 | 0x8000000000000000;
      __p = p_p;
    }
    else
    {
      HIBYTE(v25) = v7;
      p_p = (std::string::value_type *)&__p;
    }
    do
    {
      std::string::value_type v19 = v4->__r_.__value_.__s.__data_[0];
      unint64_t v4 = (std::string *)((char *)v4 + 1);
      *p_p++ = v19;
    }
    while (v4 != a3);
    std::string::value_type *p_p = 0;
    if (v25 >= 0) {
      uint64_t v20 = (const std::string::value_type *)&__p;
    }
    else {
      uint64_t v20 = (const std::string::value_type *)__p;
    }
    if (v25 >= 0) {
      std::string::size_type v21 = HIBYTE(v25);
    }
    else {
      std::string::size_type v21 = v24;
    }
    std::string::append(this, v20, v21);
    if (SHIBYTE(v25) < 0) {
      operator delete(__p);
    }
  }
  return this;
}

void sub_1D2EDE9B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(std::string *this, std::string *a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  float v3 = (std::string *)((char *)a2 - 1);
  do
  {
    int v4 = v3->__r_.__value_.__s.__data_[1];
    float v3 = (std::string *)((char *)v3 + 1);
  }
  while (v4);
  std::string::append[abi:ne180100]<char const*,0>(this, a2, v3);
  return this;
}

void sub_1D2EDEA0C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  float v2 = (void **)**a1;
  if (v2)
  {
    int v4 = (void **)v1[1];
    unsigned int v5 = **a1;
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
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

double std::__fs::filesystem::path::extension[abi:ne180100](uint64_t a1, std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__extension(this);
  if (v3.__size_ >= 0x7FFFFFFFFFFFFFF8) {
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  }
  if (v3.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v5 = (v3.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v5 = v3.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v6 = v5 + 1;
    p_dst = (long long *)operator new(v5 + 1);
    *((void *)&__dst + 1) = v3.__size_;
    unint64_t v9 = v6 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    HIBYTE(v9) = v3.__size_;
    p_dst = &__dst;
    if (!v3.__size_) {
      goto LABEL_9;
    }
  }
  memmove(p_dst, v3.__data_, v3.__size_);
LABEL_9:
  *((unsigned char *)p_dst + v3.__size_) = 0;
  double result = *(double *)&__dst;
  *(_OWORD *)a1 = __dst;
  *(void *)(a1 + 16) = v9;
  return result;
}

void **std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>> *,0>(void **result, void **a2, uint64_t a3)
{
  if (result != a2)
  {
    uint64_t v5 = (uint64_t)result;
    do
    {
      std::basic_string_view<_CharT, _Traits>::size_type v6 = *(void **)a3;
      uint64_t v7 = *(unsigned int *)(a3 + 8);
      if (v7)
      {
        uint64_t v8 = 112 * v7;
        do
        {
          std::basic_string_view<_CharT, _Traits>::size_type v6 = (void *)(skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl((uint64_t)v6)
                      + 112);
          v8 -= 112;
        }
        while (v8);
        std::basic_string_view<_CharT, _Traits>::size_type v6 = *(void **)a3;
      }
      if (v6 != (void *)(a3 + 16)) {
        free(v6);
      }
      skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::move(a3, v5);
      unint64_t v9 = (void **)(a3 + 464);
      if (*(char *)(a3 + 487) < 0) {
        operator delete(*v9);
      }
      long long v10 = *(_OWORD *)(v5 + 464);
      *(void *)(a3 + 480) = *(void *)(v5 + 480);
      *(_OWORD *)unint64_t v9 = v10;
      *(unsigned char *)(v5 + 487) = 0;
      *(_WORD *)(v5 + 464) = 0;
      long long v11 = *(_OWORD *)(v5 + 488);
      *(_OWORD *)(a3 + 500) = *(_OWORD *)(v5 + 500);
      *(_OWORD *)(a3 + 488) = v11;
      double result = skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a3 + 520), v5 + 520);
      *(_DWORD *)(a3 + 544) = *(_DWORD *)(v5 + 544);
      v5 += 552;
      a3 += 552;
    }
    while ((void **)v5 != a2);
  }
  return result;
}

uint64_t skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>(uint64_t a1)
{
  float v2 = *(void **)(a1 + 520);
  if (v2 != (void *)(a1 + 536)) {
    free(v2);
  }
  if (*(char *)(a1 + 487) < 0) {
    operator delete(*(void **)(a1 + 464));
  }

  return skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::~SmallVector(a1);
}

size_t skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_reserve_more(char **a1, unsigned int a2)
{
  std::__fs::filesystem::path::__string_view v3 = (char *)malloc_type_malloc(552 * a2, 0x1032040BBF17678uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v14 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v14, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  int v4 = v3;
  uint64_t v5 = *a1;
  unsigned int v6 = *((_DWORD *)a1 + 2);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v3;
    uint64_t v8 = (uint64_t)*a1;
    do
    {
      skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::move(v7, v8);
      long long v9 = *(_OWORD *)(v8 + 464);
      *(void *)(v7 + 480) = *(void *)(v8 + 480);
      *(_OWORD *)(v7 + 464) = v9;
      *(void *)(v8 + 464) = 0;
      *(void *)(v8 + 472) = 0;
      *(void *)(v8 + 480) = 0;
      long long v10 = *(_OWORD *)(v8 + 488);
      *(_OWORD *)(v7 + 500) = *(_OWORD *)(v8 + 500);
      *(_OWORD *)(v7 + 488) = v10;
      skit::SmallVector<skit::GroupId,4u,true>::move(v7 + 520, v8 + 520);
      *(_DWORD *)(v7 + 544) = *(_DWORD *)(v8 + 544);
      v8 += 552;
      v7 += 552;
    }
    while ((char *)v8 != &v5[552 * v6]);
    uint64_t v11 = 552 * v6;
    do
    {
      skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>((uint64_t)v5);
      v5 += 552;
      v11 -= 552;
    }
    while (v11);
    uint64_t v5 = *a1;
  }
  if (v5 != (char *)(a1 + 2)) {
    free(v5);
  }
  *a1 = v4;
  size_t result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x228;
  return result;
}

uint64_t skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl(uint64_t a1)
{
  float v2 = *(void **)(a1 + 80);
  if (v2 != (void *)(a1 + 96)) {
    free(v2);
  }
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

skit::SpanMatchV3 *skit::SpanMatchV3::SpanMatchV3(skit::SpanMatchV3 *this, const skit::SpanMatchV3 *a2)
{
  long long v4 = *(_OWORD *)a2;
  *(_OWORD *)((char *)this + 12) = *(_OWORD *)((char *)a2 + 12);
  *(_OWORD *)this = v4;
  uint64_t v5 = (__int16 *)*((void *)a2 + 4);
  uint64_t v6 = *((unsigned int *)a2 + 10);
  if (v6 < 5)
  {
    long long v9 = (_WORD *)((char *)this + 48);
    *((void *)this + 4) = (char *)this + 48;
    *((_DWORD *)this + 10) = v6;
    *((_DWORD *)this + 11) = 4;
    if (!v6) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v7 = skit::SmallVector<skit::GroupId,4u,true>::allocate(*((_DWORD *)a2 + 10));
    *((void *)this + 4) = v7;
    size_t v8 = malloc_size(v7);
    long long v9 = (_WORD *)*((void *)this + 4);
    *((_DWORD *)this + 10) = v6;
    *((_DWORD *)this + 11) = v8 >> 1;
  }
  uint64_t v10 = 2 * v6;
  do
  {
    __int16 v11 = *v5++;
    *v9++ = v11;
    v10 -= 2;
  }
  while (v10);
LABEL_6:
  *((_DWORD *)this + 14) = *((_DWORD *)a2 + 14);
  return this;
}

uint64_t skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::~SmallVector(uint64_t a1)
{
  float v2 = *(void **)a1;
  uint64_t v3 = *(unsigned int *)(a1 + 8);
  if (v3)
  {
    uint64_t v4 = 112 * v3;
    do
    {
      float v2 = (void *)(skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl((uint64_t)v2)
                  + 112);
      v4 -= 112;
    }
    while (v4);
    float v2 = *(void **)a1;
  }
  if (v2 != (void *)(a1 + 16)) {
    free(v2);
  }
  return a1;
}

void *skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::allocate(unsigned int a1)
{
  size_t result = malloc_type_malloc(112 * a1, 0x1032040567AB6A7uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v3 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v3, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  return result;
}

skit::SpanMatchV3 *std::uninitialized_copy[abi:ne180100]<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>> const*,skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>*>(skit::SpanMatchV3 *result, skit::SpanMatchV3 *a2, uint64_t a3)
{
  if (result != a2)
  {
    uint64_t v5 = result;
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = (char *)v5 + v6;
      *(_WORD *)(a3 + v6) = *(_WORD *)((char *)v5 + v6);
      size_t v8 = (std::basic_string<char16_t> *)(a3 + v6 + 8);
      long long v9 = (const std::basic_string<char16_t>::value_type **)((char *)v5 + v6 + 8);
      if (*((char *)v5 + v6 + 31) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external(v8, *v9, *((void *)v7 + 2));
      }
      else
      {
        long long v10 = *(_OWORD *)v9;
        *(void *)(a3 + v6 + 24) = *(void *)((char *)v5 + v6 + 24);
        *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
      }
      *(_OWORD *)(a3 + v6 + 32) = *((_OWORD *)v7 + 2);
      size_t result = skit::SpanMatchV3::SpanMatchV3((skit::SpanMatchV3 *)(a3 + v6 + 48), (skit::SpanMatchV3 *)((char *)v5 + v6 + 48));
      v6 += 112;
    }
    while (v7 + 112 != (char *)a2);
  }
  return result;
}

uint64_t skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::move(uint64_t result, uint64_t a2)
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
        skit::SmallVector<skit::GroupId,4u,true>::move(v5 + 80, v9 + 80);
        *(_DWORD *)(v5 + 104) = *(_DWORD *)(v9 + 104);
        v9 += 112;
        v5 += 112;
      }
      while (v9 != v8);
      uint64_t v12 = 112 * v6;
      do
      {
        size_t result = skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl(v7);
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
  *uint64_t v4 = 4;
  *(_DWORD *)(v3 + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

uint64_t skit::SmallVector<skit::GroupId,4u,true>::move(uint64_t result, uint64_t a2)
{
  if (*(void *)a2 == a2 + 16)
  {
    uint64_t v3 = (_WORD *)(result + 16);
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
    float v2 = (_DWORD *)(result + 12);
  }
  else
  {
    *(void *)size_t result = *(void *)a2;
    float v2 = (_DWORD *)(a2 + 12);
    *(_DWORD *)(result + 12) = *(_DWORD *)(a2 + 12);
    *(void *)a2 = a2 + 16;
  }
  _DWORD *v2 = 4;
  *(_DWORD *)(result + 8) = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a2 + 8) = 0;
  return result;
}

void **skit::SmallVector<skit::GroupId,4u,true>::operator=(void **a1, uint64_t a2)
{
  uint64_t v5 = a1 + 2;
  uint64_t v4 = *a1;
  if (v4 != v5) {
    free(v4);
  }
  skit::SmallVector<skit::GroupId,4u,true>::move((uint64_t)a1, a2);
  return a1;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E696E180, MEMORY[0x1E4FBA1D0]);
}

void sub_1D2EDF2B4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void std::basic_string<char16_t>::push_back(std::basic_string<char16_t> *this, std::basic_string<char16_t>::value_type __c)
{
  uint64_t v4 = this;
  if ((SHIBYTE(this->__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (*((unsigned char *)&this->__r_.__value_.__s + 23) != 10)
    {
      std::basic_string<char16_t>::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      *((unsigned char *)&this->__r_.__value_.__s + 23) = (*((unsigned char *)&this->__r_.__value_.__s + 23) + 1) & 0x7F;
      goto LABEL_8;
    }
    std::basic_string<char16_t>::size_type v5 = 10;
    goto LABEL_5;
  }
  std::basic_string<char16_t>::size_type size = this->__r_.__value_.__l.__size_;
  std::basic_string<char16_t>::size_type v5 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (size == v5)
  {
LABEL_5:
    std::basic_string<char16_t>::__grow_by(this, v5, 1uLL, v5, v5, v2, v3);
    std::basic_string<char16_t>::size_type size = v5;
  }
  v4->__r_.__value_.__l.__size_ = size + 1;
  uint64_t v4 = (std::basic_string<char16_t> *)v4->__r_.__value_.__r.__words[0];
LABEL_8:
  *(_DWORD *)((char *)&v4->__r_.__value_.__l.__data_ + 2 * size) = 32;
}

std::basic_string<char16_t> *__cdecl std::basic_string<char16_t>::append(std::basic_string<char16_t> *this, const std::basic_string<char16_t>::value_type *__s, std::basic_string<char16_t>::size_type __n)
{
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    std::basic_string<char16_t>::size_type size = this->__r_.__value_.__l.__size_;
    std::basic_string<char16_t>::size_type v6 = (this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL) - 1;
  }
  else
  {
    std::basic_string<char16_t>::size_type v6 = 10;
    std::basic_string<char16_t>::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
  }
  if (v6 - size >= __n)
  {
    if (__n)
    {
      uint64_t v8 = this;
      if ((*((unsigned char *)&this->__r_.__value_.__s + 23) & 0x80) != 0) {
        uint64_t v8 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
      }
      memmove((char *)v8 + 2 * size, __s, 2 * __n);
      std::basic_string<char16_t>::size_type v9 = size + __n;
      if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
        this->__r_.__value_.__l.__size_ = v9;
      }
      else {
        *((unsigned char *)&this->__r_.__value_.__s + 23) = v9 & 0x7F;
      }
      v8->__r_.__value_.__s.__data_[v9] = 0;
    }
  }
  else
  {
    std::basic_string<char16_t>::__grow_by_and_replace(this, v6, __n - v6 + size, size, size, 0, __n, __s);
  }
  return this;
}

void std::basic_string<char16_t>::__grow_by_and_replace(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __old_cap, std::basic_string<char16_t>::size_type __delta_cap, std::basic_string<char16_t>::size_type __old_sz, std::basic_string<char16_t>::size_type __n_copy, std::basic_string<char16_t>::size_type __n_del, std::basic_string<char16_t>::size_type __n_add, const std::basic_string<char16_t>::value_type *__p_new_stuff)
{
  if (0x7FFFFFFFFFFFFFF6 - __old_cap < __delta_cap) {
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  }
  std::string::value_type v15 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    std::string::value_type v15 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
  }
  std::basic_string<char16_t>::size_type v16 = __delta_cap + __old_cap;
  if (__delta_cap + __old_cap <= 2 * __old_cap) {
    std::basic_string<char16_t>::size_type v16 = 2 * __old_cap;
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
  if (__old_cap > 0x3FFFFFFFFFFFFFF2) {
    uint64_t v19 = 0x7FFFFFFFFFFFFFF7;
  }
  else {
    uint64_t v19 = v18;
  }
  uint64_t v20 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v19);
  std::basic_string<char16_t>::size_type v21 = (std::basic_string<char16_t>::size_type)v20;
  uint64_t v23 = v22;
  if (__n_copy) {
    memmove(v20, v15, 2 * __n_copy);
  }
  if (__n_add) {
    memmove((void *)(v21 + 2 * __n_copy), __p_new_stuff, 2 * __n_add);
  }
  std::basic_string<char16_t>::size_type v24 = __old_sz - (__n_del + __n_copy);
  if (v24) {
    memmove((void *)(v21 + 2 * __n_copy + 2 * __n_add), (char *)v15 + 2 * __n_copy + 2 * __n_del, 2 * v24);
  }
  if (__old_cap != 10) {
    operator delete(v15);
  }
  std::basic_string<char16_t>::size_type v25 = __n_add + __n_copy + v24;
  this->__r_.__value_.__r.__words[0] = v21;
  this->__r_.__value_.__l.__size_ = v25;
  this->__r_.__value_.__r.__words[2] = v23 | 0x8000000000000000;
  *(_WORD *)(v21 + 2 * v25) = 0;
}

void std::basic_string<char16_t>::__grow_by(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __old_cap, std::basic_string<char16_t>::size_type __delta_cap, std::basic_string<char16_t>::size_type __old_sz, std::basic_string<char16_t>::size_type __n_copy, std::basic_string<char16_t>::size_type __n_del, std::basic_string<char16_t>::size_type __n_add)
{
  if (0x7FFFFFFFFFFFFFF7 - __old_cap < __delta_cap) {
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  }
  long long v11 = this;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
    long long v11 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
  }
  std::basic_string<char16_t>::size_type v12 = __delta_cap + __old_cap;
  if (__delta_cap + __old_cap <= 2 * __old_cap) {
    std::basic_string<char16_t>::size_type v12 = 2 * __old_cap;
  }
  uint64_t v13 = (v12 & 0xFFFFFFFFFFFFFFFCLL) + 4;
  if ((v12 | 3) != 0xB) {
    uint64_t v13 = v12 | 3;
  }
  if (v12 >= 0xB) {
    uint64_t v14 = v13 + 1;
  }
  else {
    uint64_t v14 = 11;
  }
  if (__old_cap <= 0x3FFFFFFFFFFFFFF2) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0x7FFFFFFFFFFFFFF7;
  }
  std::basic_string<char16_t>::size_type v16 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v15);
  std::basic_string<char16_t>::size_type v17 = (std::basic_string<char16_t>::size_type)v16;
  uint64_t v19 = v18;
  if (__n_copy) {
    memmove(v16, v11, 2 * __n_copy);
  }
  if (__old_sz != __n_copy) {
    memmove((void *)(v17 + 2 * __n_copy), (char *)v11 + 2 * __n_copy, 2 * (__old_sz - __n_copy));
  }
  if (__old_cap != 10) {
    operator delete(v11);
  }
  this->__r_.__value_.__r.__words[0] = v17;
  this->__r_.__value_.__r.__words[2] = v19 | 0x8000000000000000;
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  size_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D8] + 16);
  return result;
}

size_t skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_reserve_more(char **a1, unsigned int a2)
{
  std::basic_string<char16_t>::size_type v3 = (char *)malloc_type_malloc(392 * a2, 0x10320407C6195B8uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v14 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v14, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  uint64_t v4 = v3;
  std::basic_string<char16_t>::size_type v5 = *a1;
  unsigned int v6 = *((_DWORD *)a1 + 2);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v3;
    uint64_t v8 = *a1;
    do
    {
      skit::SmallVector<skit::FieldMatchV2,4u,true>::move(v7, (uint64_t *)v8);
      long long v9 = *((_OWORD *)v8 + 21);
      *(void *)(v7 + 352) = *((void *)v8 + 44);
      *(_OWORD *)(v7 + 336) = v9;
      *((void *)v8 + 42) = 0;
      *((void *)v8 + 43) = 0;
      *((void *)v8 + 44) = 0;
      long long v10 = *(_OWORD *)(v8 + 376);
      *(_OWORD *)(v7 + 360) = *(_OWORD *)(v8 + 360);
      *(_OWORD *)(v7 + 376) = v10;
      v8 += 392;
      v7 += 392;
    }
    while (v8 != &v5[392 * v6]);
    uint64_t v11 = 392 * v6;
    do
    {
      skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>((uint64_t)v5);
      v5 += 392;
      v11 -= 392;
    }
    while (v11);
    std::basic_string<char16_t>::size_type v5 = *a1;
  }
  if (v5 != (char *)(a1 + 2)) {
    free(v5);
  }
  *a1 = v4;
  size_t result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x188;
  return result;
}

uint64_t skit::SmallVector<skit::FieldMatchV2,4u,true>::~SmallVector(uint64_t a1)
{
  if (*(void *)a1 != a1 + 16) {
    free(*(void **)a1);
  }
  return a1;
}

void skit::SmallVector<skit::FieldMatchV2,4u,true>::_destroy(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    uint64_t v2 = 80 * a2;
    std::basic_string<char16_t>::size_type v3 = (char *)(a1 + 31);
    do
    {
      if (*v3 < 0) {
        operator delete(*(void **)(v3 - 23));
      }
      v3 += 80;
      v2 -= 80;
    }
    while (v2);
  }
}

__n128 std::uninitialized_copy[abi:ne180100]<skit::FieldMatchV2 const*,skit::FieldMatchV2*>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = a1 + v6;
      *(_WORD *)(a3 + v6) = *(_WORD *)(a1 + v6);
      uint64_t v8 = (std::basic_string<char16_t> *)(a3 + v6 + 8);
      long long v9 = (const std::basic_string<char16_t>::value_type **)(a1 + v6 + 8);
      if (*(char *)(a1 + v6 + 31) < 0)
      {
        std::basic_string<char16_t>::__init_copy_ctor_external(v8, *v9, *(void *)(v7 + 16));
      }
      else
      {
        long long v10 = *(_OWORD *)v9;
        *(void *)(a3 + v6 + 24) = *(void *)(a1 + v6 + 24);
        *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
      }
      uint64_t v11 = a3 + v6;
      __n128 result = *(__n128 *)(v7 + 32);
      long long v13 = *(_OWORD *)(v7 + 64);
      *(_OWORD *)(v11 + 48) = *(_OWORD *)(v7 + 48);
      *(_OWORD *)(v11 + 64) = v13;
      *(__n128 *)(v11 + 32) = result;
      v6 += 80;
    }
    while (v7 + 80 != a2);
  }
  return result;
}

uint64_t skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>(uint64_t a1)
{
  if (*(char *)(a1 + 359) < 0) {
    operator delete(*(void **)(a1 + 336));
  }

  return skit::SmallVector<skit::FieldMatchV2,4u,true>::~SmallVector(a1);
}

void skit::SmallVector<skit::FieldMatchV2,4u,true>::move(uint64_t a1, uint64_t *a2)
{
  if ((uint64_t *)*a2 == a2 + 2)
  {
    uint64_t v5 = a1 + 16;
    *(void *)a1 = a1 + 16;
    uint64_t v6 = *((unsigned int *)a2 + 2);
    if (v6)
    {
      uint64_t v7 = *a2;
      uint64_t v8 = *a2 + 80 * v6;
      uint64_t v9 = *a2;
      do
      {
        *(_WORD *)uint64_t v5 = *(_WORD *)v9;
        long long v10 = *(_OWORD *)(v9 + 8);
        *(void *)(v5 + 24) = *(void *)(v9 + 24);
        *(_OWORD *)(v5 + 8) = v10;
        *(void *)(v9 + 16) = 0;
        *(void *)(v9 + 24) = 0;
        *(void *)(v9 + 8) = 0;
        long long v11 = *(_OWORD *)(v9 + 32);
        long long v12 = *(_OWORD *)(v9 + 64);
        *(_OWORD *)(v5 + 48) = *(_OWORD *)(v9 + 48);
        *(_OWORD *)(v5 + 64) = v12;
        *(_OWORD *)(v5 + 32) = v11;
        v9 += 80;
        v5 += 80;
      }
      while (v9 != v8);
      long long v13 = (char *)(v7 + 31);
      uint64_t v14 = 80 * v6;
      do
      {
        if (*v13 < 0) {
          operator delete(*(void **)(v13 - 23));
        }
        v13 += 80;
        v14 -= 80;
      }
      while (v14);
    }
    uint64_t v4 = (_DWORD *)(a1 + 12);
  }
  else
  {
    *(void *)a1 = *a2;
    uint64_t v4 = (_DWORD *)a2 + 3;
    *(_DWORD *)(a1 + 12) = *((_DWORD *)a2 + 3);
    *a2 = (uint64_t)(a2 + 2);
  }
  *uint64_t v4 = 4;
  *(_DWORD *)(a1 + 8) = *((_DWORD *)a2 + 2);
  *((_DWORD *)a2 + 2) = 0;
}

__n128 std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,0>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 != a2)
  {
    uint64_t v5 = a1;
    do
    {
      skit::SmallVector<skit::FieldMatchV2,4u,true>::_destroy(*(void *)a3, *(_DWORD *)(a3 + 8));
      if (a3 + 16 != *(void *)a3) {
        free(*(void **)a3);
      }
      skit::SmallVector<skit::FieldMatchV2,4u,true>::move(a3, (uint64_t *)v5);
      uint64_t v6 = (void **)(a3 + 336);
      if (*(char *)(a3 + 359) < 0) {
        operator delete(*v6);
      }
      long long v7 = *(_OWORD *)(v5 + 336);
      *(void *)(a3 + 352) = *(void *)(v5 + 352);
      *(_OWORD *)uint64_t v6 = v7;
      *(unsigned char *)(v5 + 359) = 0;
      *(_WORD *)(v5 + 336) = 0;
      __n128 result = *(__n128 *)(v5 + 360);
      long long v9 = *(_OWORD *)(v5 + 376);
      *(__n128 *)(a3 + 360) = result;
      *(_OWORD *)(a3 + 376) = v9;
      a3 += 392;
      v5 += 392;
    }
    while (v5 != a2);
  }
  return result;
}

float skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV2>(uint64_t a1, float *a2, int a3, int a4)
{
  if (!*(unsigned char *)(a1 + 602))
  {
    uint64_t v4 = *(unsigned int *)a2;
    unsigned int v5 = *(_DWORD *)(a1 + 80);
    if ((int)v4 + 1 < v5)
    {
      uint64_t v6 = *((unsigned int *)a2 + 1);
      if (v6 < v5)
      {
        unsigned int v7 = *((_DWORD *)a2 + 2);
        unsigned int v8 = v6 - v4;
        uint64_t v9 = *(void *)(a1 + 72);
        uint64_t v10 = *(unsigned int *)(*(void *)a1 + 48 * *(unsigned __int16 *)(v9 + 4 * v4) + 24);
        uint64_t v11 = *(unsigned int *)(*(void *)a1 + 48 * (*(unsigned __int16 *)(v9 + 4 * v6 + 2) - 1) + 28);
        unsigned int v12 = v7;
        BOOL v13 = (int)v11 - (int)v10 >= v8;
        int v14 = v11 - v10 - v8;
        if (v14 != 0 && v13)
        {
          unsigned int v12 = v14 + v7;
          *((_DWORD *)a2 + 2) = v14 + v7;
        }
        *(void *)a2 = v10 | (v11 << 32);
        a2[3] = a2[3] + (float)(v12 - v7);
      }
    }
  }
  float result = a2[3] / (float)(a4 + a3);
  a2[3] = result;
  return result;
}

float skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV3>(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (!*(unsigned char *)(a1 + 602))
  {
    unsigned int v7 = *(_DWORD *)(a1 + 80);
    if (*(_DWORD *)a2 + 1 < v7)
    {
      unsigned int v8 = *(_DWORD *)(a2 + 4);
      if (v8 < v7)
      {
        int v9 = *(_DWORD *)(a2 + 8);
        skit::internal::FieldSpanMatcherImpl::align_to_token_boundaries<skit::SpanMatchV3>(*(void *)a1, *(void *)(a1 + 72), (unsigned int *)a2, v8 - *(_DWORD *)a2);
        *(float *)(a2 + 12) = *(float *)(a2 + 12) + (float)(*(_DWORD *)(a2 + 8) - v9);
      }
    }
  }
  float result = *(float *)(a2 + 12) / (float)(a4 + a3);
  *(float *)(a2 + 12) = result;
  return result;
}

uint64_t skit::SmallVector<skit::SpanMatchV3,4u,true>::erase(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)a1 + ((unint64_t)*(unsigned int *)(a1 + 8) << 6);
  if (a2 + 64 != v4)
  {
    uint64_t v5 = a2 + 96;
    do
    {
      *(_OWORD *)(v5 - 96) = *(_OWORD *)(v5 - 32);
      *(_OWORD *)(v5 - 84) = *(_OWORD *)(v5 - 20);
      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v5 - 64), v5);
      *(_DWORD *)(v5 - 40) = *(_DWORD *)(v5 + 24);
      uint64_t v6 = v5 + 32;
      v5 += 64;
    }
    while (v6 != v4);
  }
  unsigned int v7 = *(void **)(v4 - 32);
  if (v7 != (void *)(v4 - 16)) {
    free(v7);
  }
  --*(_DWORD *)(a1 + 8);
  return a2;
}

uint64_t skit::internal::FieldSpanMatcherImpl::align_to_token_boundaries<skit::SpanMatchV3>(uint64_t result, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  uint64_t v4 = *(unsigned int *)(result + 48 * *(unsigned __int16 *)(a2 + 4 * *a3) + 24);
  uint64_t v5 = *(unsigned int *)(result + 48 * (*(unsigned __int16 *)(a2 + 4 * a3[1] + 2) - 1) + 28);
  if ((int)v5 - (int)v4 > a4) {
    a3[2] += v5 - v4 - a4;
  }
  *(void *)a3 = v4 | (v5 << 32);
  return result;
}

BOOL skit::internal::AliasFilter::select_by_group_id(unsigned __int8 *a1, unsigned __int8 a2, unsigned __int8 a3)
{
  if (a2 && *a1 && *a1 != a2) {
    return 0;
  }
  uint64_t v4 = *((unsigned int *)a1 + 4);
  if (!v4) {
    return 1;
  }
  uint64_t v5 = (unsigned __int8 *)*((void *)a1 + 1);
  uint64_t v6 = v4 - 1;
  do
  {
    int v7 = *v5++;
    BOOL result = v7 == a3;
  }
  while (v7 != a3 && v6-- != 0);
  return result;
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(uint64_t a1, unsigned int *a2, uint64_t a3, char a4)
{
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  while (2)
  {
    k = (unsigned int *)a1;
    while (1)
    {
      while (1)
      {
        a1 = (uint64_t)k;
        uint64_t v11 = (char *)a2 - (char *)k;
        unint64_t v12 = ((char *)a2 - (char *)k) >> 6;
        if (v5 || !v4)
        {
          switch(v12)
          {
            case 0uLL:
            case 1uLL:
              return;
            case 2uLL:
              unsigned int v62 = *(a2 - 16);
              if (v62 < *(_DWORD *)a1
                || v62 <= *(_DWORD *)a1
                && ((unsigned int v153 = *(a2 - 15), v154 = *(_DWORD *)(a1 + 4), v153 > v154)
                 || v153 >= v154 && *(a2 - 10) < *(_DWORD *)(a1 + 24)))
              {
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(a1, (uint64_t)(a2 - 16));
              }
              break;
            case 3uLL:
              _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), a2 - 16);
              break;
            case 4uLL:
              _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), (unsigned int *)(a1 + 128), a2 - 16);
              break;
            case 5uLL:
              _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), (unsigned int *)(a1 + 128), (unsigned int *)(a1 + 192), a2 - 16);
              break;
            default:
              JUMPOUT(0);
          }
          return;
        }
        if (v11 <= 1535)
        {
          if (a4)
          {
            if ((unsigned int *)a1 != a2)
            {
              uint64_t v63 = a1 + 64;
              if ((unsigned int *)(a1 + 64) != a2)
              {
                uint64_t v64 = 0;
                uint64_t v65 = a1;
                do
                {
                  v66 = (unsigned int *)v65;
                  uint64_t v65 = v63;
                  unsigned int v67 = v66[16];
                  if (v67 < *v66
                    || v67 <= *v66
                    && ((unsigned int v68 = *(_DWORD *)(v65 + 4), v69 = v66[1], v68 > v69)
                     || v68 >= v69 && *(_DWORD *)(v65 + 24) < v66[6]))
                  {
                    long long v70 = *(_OWORD *)v65;
                    *(_OWORD *)&v179[12] = *(_OWORD *)(v65 + 12);
                    *(_OWORD *)v179 = v70;
                    if (*(void *)(v65 + 32) == v65 + 48)
                    {
                      v180 = &v183;
                      uint64_t v72 = *(unsigned int *)(v65 + 40);
                      v71 = &v182;
                      if (v72)
                      {
                        v73 = *(__int16 **)(v65 + 32);
                        uint64_t v74 = 2 * v72;
                        v75 = &v183;
                        do
                        {
                          __int16 v76 = *v73++;
                          *(_WORD *)v75 = v76;
                          v75 = (uint64_t *)((char *)v75 + 2);
                          v74 -= 2;
                        }
                        while (v74);
                        v71 = &v182;
                      }
                    }
                    else
                    {
                      v180 = *(void **)(v65 + 32);
                      v71 = (int *)(v65 + 44);
                      int v182 = *(_DWORD *)(v65 + 44);
                      *(void *)(v65 + 32) = v65 + 48;
                    }
                    uint64_t v77 = a1;
                    int *v71 = 4;
                    int v181 = *(_DWORD *)(v65 + 40);
                    *(_DWORD *)(v65 + 40) = 0;
                    unsigned int v184 = *(_DWORD *)(v65 + 56);
                    for (uint64_t i = v64; ; i -= 64)
                    {
                      uint64_t v79 = v77 + i;
                      *(_OWORD *)(v79 + 64) = *(_OWORD *)(v77 + i);
                      *(_OWORD *)(v79 + 76) = *(_OWORD *)(v77 + i + 12);
                      v80 = (void **)(v77 + i + 32);
                      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v77 + i + 96), (uint64_t)v80);
                      *(_DWORD *)(v79 + 120) = *(_DWORD *)(v79 + 56);
                      if (!i)
                      {
                        uint64_t v83 = v77;
                        goto LABEL_157;
                      }
                      unsigned int v81 = *(_DWORD *)(v79 - 64);
                      if (*(_DWORD *)v179 >= v81)
                      {
                        if (*(_DWORD *)v179 > v81) {
                          break;
                        }
                        unsigned int v82 = *(_DWORD *)(v77 + i - 60);
                        if (*(_DWORD *)&v179[4] <= v82
                          && (*(_DWORD *)&v179[4] < v82 || *(_DWORD *)&v179[24] >= *(_DWORD *)(v77 + i - 40)))
                        {
                          break;
                        }
                      }
                    }
                    uint64_t v83 = v77 + i;
                    v80 = (void **)(v83 + 32);
LABEL_157:
                    long long v84 = *(_OWORD *)v179;
                    *(_OWORD *)(v83 + 12) = *(_OWORD *)&v179[12];
                    *(_OWORD *)uint64_t v83 = v84;
                    skit::SmallVector<skit::GroupId,4u,true>::operator=(v80, (uint64_t)&v180);
                    *(_DWORD *)(v83 + 56) = v184;
                    if (v180 != &v183) {
                      free(v180);
                    }
                    a1 = v77;
                  }
                  uint64_t v63 = v65 + 64;
                  v64 += 64;
                }
                while ((unsigned int *)(v65 + 64) != a2);
              }
            }
          }
          else if ((unsigned int *)a1 != a2)
          {
            for (uint64_t j = a1 + 64; (unsigned int *)(a1 + 64) != a2; uint64_t j = a1 + 64)
            {
              uint64_t v156 = a1;
              a1 = j;
              unsigned int v157 = *(_DWORD *)(v156 + 64);
              if (v157 >= *(_DWORD *)v156)
              {
                if (v157 > *(_DWORD *)v156) {
                  continue;
                }
                unsigned int v158 = *(_DWORD *)(a1 + 4);
                unsigned int v159 = *(_DWORD *)(v156 + 4);
                if (v158 <= v159 && (v158 < v159 || *(_DWORD *)(a1 + 24) >= *(_DWORD *)(v156 + 24))) {
                  continue;
                }
              }
              long long v160 = *(_OWORD *)a1;
              *(_OWORD *)&v179[12] = *(_OWORD *)(a1 + 12);
              *(_OWORD *)v179 = v160;
              if (*(void *)(a1 + 32) == a1 + 48)
              {
                v180 = &v183;
                uint64_t v162 = *(unsigned int *)(a1 + 40);
                v161 = &v182;
                if (v162)
                {
                  v163 = *(__int16 **)(a1 + 32);
                  uint64_t v164 = 2 * v162;
                  v165 = &v183;
                  do
                  {
                    __int16 v166 = *v163++;
                    *(_WORD *)v165 = v166;
                    v165 = (uint64_t *)((char *)v165 + 2);
                    v164 -= 2;
                  }
                  while (v164);
                  v161 = &v182;
                }
              }
              else
              {
                v180 = *(void **)(a1 + 32);
                v161 = (int *)(a1 + 44);
                int v182 = *(_DWORD *)(a1 + 44);
                *(void *)(a1 + 32) = a1 + 48;
              }
              int *v161 = 4;
              int v181 = *(_DWORD *)(a1 + 40);
              *(_DWORD *)(a1 + 40) = 0;
              unsigned int v184 = *(_DWORD *)(a1 + 56);
              do
              {
                do
                {
                  uint64_t v167 = v156;
                  *(_OWORD *)(v156 + 64) = *(_OWORD *)v156;
                  *(_OWORD *)(v156 + 76) = *(_OWORD *)(v156 + 12);
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v156 + 96), v156 + 32);
                  unsigned int v168 = *(_DWORD *)(v156 - 64);
                  v156 -= 64;
                  *(_DWORD *)(v156 + 184) = *(_DWORD *)(v156 + 120);
                  BOOL v169 = *(_DWORD *)v179 > v168;
                }
                while (*(_DWORD *)v179 < v168);
                if (v169) {
                  break;
                }
                unsigned int v170 = *(_DWORD *)(v167 - 60);
              }
              while (*(_DWORD *)&v179[4] > v170
                   || *(_DWORD *)&v179[4] >= v170 && *(_DWORD *)&v179[24] < *(_DWORD *)(v167 - 40));
              long long v171 = *(_OWORD *)v179;
              *(_OWORD *)(v167 + 12) = *(_OWORD *)&v179[12];
              *(_OWORD *)uint64_t v167 = v171;
              skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v167 + 32), (uint64_t)&v180);
              *(_DWORD *)(v167 + 56) = v184;
              if (v180 != &v183) {
                free(v180);
              }
            }
          }
          return;
        }
        if (!a3)
        {
          if ((unsigned int *)a1 != a2)
          {
            int64_t v85 = (v12 - 2) >> 1;
            int64_t v86 = v85;
            do
            {
              int64_t v87 = v86;
              if (v85 >= v86)
              {
                uint64_t v88 = (2 * v86) | 1;
                uint64_t v89 = a1 + (v88 << 6);
                if (2 * v87 + 2 < (uint64_t)v12)
                {
                  unsigned int v90 = *(_DWORD *)(v89 + 64);
                  if (*(_DWORD *)v89 < v90
                    || *(_DWORD *)v89 <= v90
                    && ((unsigned int v114 = *(_DWORD *)(v89 + 4), v115 = *(_DWORD *)(v89 + 68), v114 > v115)
                     || v114 >= v115 && *(_DWORD *)(a1 + (v88 << 6) + 24) < *(_DWORD *)(v89 + 88)))
                  {
                    v89 += 64;
                    uint64_t v88 = 2 * v87 + 2;
                  }
                }
                uint64_t v91 = a1 + (v87 << 6);
                if (*(_DWORD *)v89 >= *(_DWORD *)v91)
                {
                  if (*(_DWORD *)v89 > *(_DWORD *)v91
                    || (unsigned int v97 = *(_DWORD *)(v89 + 4), v98 = *(_DWORD *)(v91 + 4), v97 <= v98)
                    && (v97 < v98 || *(_DWORD *)(v89 + 24) >= *(_DWORD *)(a1 + (v87 << 6) + 24)))
                  {
                    long long v92 = *(_OWORD *)v91;
                    *(_OWORD *)&v179[12] = *(_OWORD *)(v91 + 12);
                    *(_OWORD *)v179 = v92;
                    uint64_t v93 = a1 + (v87 << 6);
                    v94 = (_WORD **)(v93 + 32);
                    if (*(void *)(v93 + 32) == v93 + 48)
                    {
                      v180 = &v183;
                      uint64_t v99 = *(unsigned int *)(v93 + 40);
                      v95 = &v182;
                      if (v99)
                      {
                        v100 = *v94;
                        uint64_t v101 = 2 * v99;
                        v102 = &v183;
                        do
                        {
                          __int16 v103 = *v100++;
                          *(_WORD *)v102 = v103;
                          v102 = (uint64_t *)((char *)v102 + 2);
                          v101 -= 2;
                        }
                        while (v101);
                        v95 = &v182;
                      }
                    }
                    else
                    {
                      v180 = *(void **)(v93 + 32);
                      int v96 = *(_DWORD *)(v93 + 44);
                      v95 = (int *)(v93 + 44);
                      int v182 = v96;
                      *v94 = v94 + 2;
                    }
                    int *v95 = 4;
                    uint64_t v104 = a1 + (v87 << 6);
                    int v181 = *(_DWORD *)(v104 + 40);
                    *(_DWORD *)(v104 + 40) = 0;
                    unsigned int v184 = *(_DWORD *)(v104 + 56);
                    while (1)
                    {
                      uint64_t v105 = v89;
                      long long v106 = *(_OWORD *)v89;
                      *(_OWORD *)(v91 + 12) = *(_OWORD *)(v89 + 12);
                      *(_OWORD *)uint64_t v91 = v106;
                      v107 = (void **)(v89 + 32);
                      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v91 + 32), v89 + 32);
                      *(_DWORD *)(v91 + 56) = *(_DWORD *)(v105 + 56);
                      if (v85 < v88) {
                        break;
                      }
                      uint64_t v108 = (2 * v88) | 1;
                      uint64_t v89 = a1 + (v108 << 6);
                      if (2 * v88 + 2 < (uint64_t)v12)
                      {
                        unsigned int v109 = *(_DWORD *)(v89 + 64);
                        if (*(_DWORD *)v89 < v109
                          || *(_DWORD *)v89 <= v109
                          && ((unsigned int v110 = *(_DWORD *)(v89 + 4), v111 = *(_DWORD *)(v89 + 68), v110 > v111)
                           || v110 >= v111 && *(_DWORD *)(a1 + (v108 << 6) + 24) < *(_DWORD *)(v89 + 88)))
                        {
                          v89 += 64;
                          uint64_t v108 = 2 * v88 + 2;
                        }
                      }
                      if (*(_DWORD *)v89 < *(_DWORD *)v179) {
                        break;
                      }
                      uint64_t v91 = v105;
                      uint64_t v88 = v108;
                      if (*(_DWORD *)v89 <= *(_DWORD *)v179)
                      {
                        unsigned int v112 = *(_DWORD *)(v89 + 4);
                        if (v112 > *(_DWORD *)&v179[4]) {
                          break;
                        }
                        uint64_t v91 = v105;
                        uint64_t v88 = v108;
                        if (v112 >= *(_DWORD *)&v179[4])
                        {
                          uint64_t v91 = v105;
                          uint64_t v88 = v108;
                          if (*(_DWORD *)(v89 + 24) < *(_DWORD *)&v179[24]) {
                            break;
                          }
                        }
                      }
                    }
                    long long v113 = *(_OWORD *)v179;
                    *(_OWORD *)(v105 + 12) = *(_OWORD *)&v179[12];
                    *(_OWORD *)uint64_t v105 = v113;
                    skit::SmallVector<skit::GroupId,4u,true>::operator=(v107, (uint64_t)&v180);
                    *(_DWORD *)(v105 + 56) = v184;
                    if (v180 != &v183) {
                      free(v180);
                    }
                  }
                }
              }
              int64_t v86 = v87 - 1;
            }
            while (v87);
            uint64_t v116 = (unint64_t)v11 >> 6;
            uint64_t v117 = a1 + 48;
            v172 = (int *)(a1 + 44);
            do
            {
              *(_OWORD *)&v173[12] = *(_OWORD *)(a1 + 12);
              *(_OWORD *)v173 = *(_OWORD *)a1;
              if (*(void *)(a1 + 32) == v117)
              {
                v174 = &v177;
                uint64_t v119 = *(unsigned int *)(a1 + 40);
                v118 = &v176;
                if (v119)
                {
                  v120 = *(__int16 **)(a1 + 32);
                  uint64_t v121 = 2 * v119;
                  v122 = &v177;
                  do
                  {
                    __int16 v123 = *v120++;
                    *(_WORD *)v122 = v123;
                    v122 = (uint64_t *)((char *)v122 + 2);
                    v121 -= 2;
                  }
                  while (v121);
                  v118 = &v176;
                }
              }
              else
              {
                v174 = *(void **)(a1 + 32);
                int v176 = *(_DWORD *)(a1 + 44);
                *(void *)(a1 + 32) = v117;
                v118 = v172;
              }
              uint64_t v124 = 0;
              int *v118 = 4;
              int v175 = *(_DWORD *)(a1 + 40);
              *(_DWORD *)(a1 + 40) = 0;
              unsigned int v178 = *(_DWORD *)(a1 + 56);
              uint64_t v125 = a1;
              do
              {
                uint64_t v126 = a1;
                uint64_t v127 = v124 + 1;
                a1 += (v124 + 1) << 6;
                uint64_t v128 = 2 * v124;
                uint64_t v124 = (2 * v124) | 1;
                uint64_t v129 = v128 + 2;
                if (v129 < v116)
                {
                  unsigned int v130 = *(_DWORD *)(a1 + 64);
                  if (*(_DWORD *)a1 < v130
                    || *(_DWORD *)a1 <= v130
                    && ((unsigned int v132 = *(_DWORD *)(a1 + 4), v133 = *(_DWORD *)(a1 + 68), v132 > v133)
                     || v132 >= v133 && *(_DWORD *)(v126 + (v127 << 6) + 24) < *(_DWORD *)(a1 + 88)))
                  {
                    a1 += 64;
                    uint64_t v124 = v129;
                  }
                }
                long long v131 = *(_OWORD *)a1;
                *(_OWORD *)(v126 + 12) = *(_OWORD *)(a1 + 12);
                *(_OWORD *)uint64_t v126 = v131;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v126 + 32), a1 + 32);
                *(_DWORD *)(v126 + 56) = *(_DWORD *)(a1 + 56);
              }
              while (v124 <= (uint64_t)((unint64_t)(v116 - 2) >> 1));
              v134 = a2 - 16;
              if ((unsigned int *)a1 == a2 - 16)
              {
                *(_OWORD *)(a1 + 12) = *(_OWORD *)&v173[12];
                *(_OWORD *)a1 = *(_OWORD *)v173;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)&v174);
                *(_DWORD *)(a1 + 56) = v178;
              }
              else
              {
                long long v135 = *(_OWORD *)v134;
                *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 - 13);
                *(_OWORD *)a1 = v135;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(a2 - 8));
                *(_DWORD *)(a1 + 56) = *(a2 - 2);
                *(_OWORD *)(a2 - 13) = *(_OWORD *)&v173[12];
                *(_OWORD *)v134 = *(_OWORD *)v173;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)a2 - 4, (uint64_t)&v174);
                *(a2 - 2) = v178;
                uint64_t v136 = a1 - v125 + 64;
                if (v136 >= 65)
                {
                  unint64_t v137 = (((unint64_t)v136 >> 6) - 2) >> 1;
                  uint64_t v138 = v125 + (v137 << 6);
                  if (*(_DWORD *)v138 < *(_DWORD *)a1
                    || *(_DWORD *)v138 <= *(_DWORD *)a1
                    && ((unsigned int v139 = *(_DWORD *)(v138 + 4), v140 = *(_DWORD *)(a1 + 4), v139 > v140)
                     || v139 >= v140 && *(_DWORD *)(v125 + (v137 << 6) + 24) < *(_DWORD *)(a1 + 24)))
                  {
                    long long v141 = *(_OWORD *)a1;
                    *(_OWORD *)&v179[12] = *(_OWORD *)(a1 + 12);
                    *(_OWORD *)v179 = v141;
                    if (*(void *)(a1 + 32) == a1 + 48)
                    {
                      v180 = &v183;
                      uint64_t v143 = *(unsigned int *)(a1 + 40);
                      v142 = &v182;
                      if (v143)
                      {
                        v144 = *(__int16 **)(a1 + 32);
                        uint64_t v145 = 2 * v143;
                        v146 = &v183;
                        do
                        {
                          __int16 v147 = *v144++;
                          *(_WORD *)v146 = v147;
                          v146 = (uint64_t *)((char *)v146 + 2);
                          v145 -= 2;
                        }
                        while (v145);
                        v142 = &v182;
                      }
                    }
                    else
                    {
                      v180 = *(void **)(a1 + 32);
                      v142 = (int *)(a1 + 44);
                      int v182 = *(_DWORD *)(a1 + 44);
                      *(void *)(a1 + 32) = a1 + 48;
                    }
                    int *v142 = 4;
                    int v181 = *(_DWORD *)(a1 + 40);
                    *(_DWORD *)(a1 + 40) = 0;
                    unsigned int v184 = *(_DWORD *)(a1 + 56);
                    while (1)
                    {
                      uint64_t v148 = v138;
                      long long v149 = *(_OWORD *)v138;
                      *(_OWORD *)(a1 + 12) = *(_OWORD *)(v138 + 12);
                      *(_OWORD *)a1 = v149;
                      v150 = (void **)(v138 + 32);
                      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), v138 + 32);
                      *(_DWORD *)(a1 + 56) = *(_DWORD *)(v148 + 56);
                      if (!v137) {
                        break;
                      }
                      unint64_t v137 = (v137 - 1) >> 1;
                      uint64_t v138 = v125 + (v137 << 6);
                      a1 = v148;
                      if (*(_DWORD *)v138 >= *(_DWORD *)v179)
                      {
                        if (*(_DWORD *)v138 > *(_DWORD *)v179) {
                          break;
                        }
                        unsigned int v151 = *(_DWORD *)(v138 + 4);
                        a1 = v148;
                        if (v151 <= *(_DWORD *)&v179[4])
                        {
                          if (v151 < *(_DWORD *)&v179[4]) {
                            break;
                          }
                          a1 = v148;
                          if (*(_DWORD *)(v125 + (v137 << 6) + 24) >= *(_DWORD *)&v179[24]) {
                            break;
                          }
                        }
                      }
                    }
                    long long v152 = *(_OWORD *)v179;
                    *(_OWORD *)(v148 + 12) = *(_OWORD *)&v179[12];
                    *(_OWORD *)uint64_t v148 = v152;
                    skit::SmallVector<skit::GroupId,4u,true>::operator=(v150, (uint64_t)&v180);
                    *(_DWORD *)(v148 + 56) = v184;
                    if (v180 != &v183) {
                      free(v180);
                    }
                  }
                }
              }
              if (v174 != &v177) {
                free(v174);
              }
              a2 = v134;
              BOOL v33 = v116-- <= 2;
              a1 = v125;
            }
            while (!v33);
          }
          return;
        }
        unint64_t v13 = v12 >> 1;
        int v14 = (unsigned int *)(a1 + (v12 >> 1 << 6));
        if ((unint64_t)v11 > 0x2000)
        {
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + (v12 >> 1 << 6)), a2 - 16);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + 64), v14 - 16, a2 - 32);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + 128), (unsigned int *)(a1 + 64 + (v13 << 6)), a2 - 48);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(v14 - 16, v14, (unsigned int *)(a1 + 64 + (v13 << 6)));
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(a1, (uint64_t)v14);
        }
        else
        {
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + (v12 >> 1 << 6)), (unsigned int *)a1, a2 - 16);
        }
        --a3;
        if (a4) {
          break;
        }
        unsigned int v15 = *(_DWORD *)(a1 - 64);
        if (v15 < *(_DWORD *)a1) {
          break;
        }
        if (v15 <= *(_DWORD *)a1)
        {
          unsigned int v16 = *(_DWORD *)(a1 - 60);
          unsigned int v17 = *(_DWORD *)(a1 + 4);
          if (v16 > v17 || v16 >= v17 && *(_DWORD *)(a1 - 40) < *(_DWORD *)(a1 + 24)) {
            break;
          }
        }
        long long v39 = *(_OWORD *)a1;
        *(_OWORD *)&v179[12] = *(_OWORD *)(a1 + 12);
        *(_OWORD *)v179 = v39;
        if (*(void *)(a1 + 32) == a1 + 48)
        {
          v180 = &v183;
          uint64_t v41 = *(unsigned int *)(a1 + 40);
          ssize_t v40 = &v182;
          if (v41)
          {
            size_t v42 = *(__int16 **)(a1 + 32);
            uint64_t v43 = 2 * v41;
            v44 = &v183;
            do
            {
              __int16 v45 = *v42++;
              *(_WORD *)v44 = v45;
              v44 = (uint64_t *)((char *)v44 + 2);
              v43 -= 2;
            }
            while (v43);
            ssize_t v40 = &v182;
          }
        }
        else
        {
          v180 = *(void **)(a1 + 32);
          ssize_t v40 = (int *)(a1 + 44);
          int v182 = *(_DWORD *)(a1 + 44);
          *(void *)(a1 + 32) = a1 + 48;
        }
        *ssize_t v40 = 4;
        int v181 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)(a1 + 40) = 0;
        unsigned int v184 = *(_DWORD *)(a1 + 56);
        unsigned int v46 = *(a2 - 16);
        if (*(_DWORD *)v179 < v46)
        {
          unsigned int v47 = *(_DWORD *)&v179[4];
LABEL_77:
          unsigned int v48 = *(_DWORD *)&v179[24];
          goto LABEL_78;
        }
        unsigned int v47 = *(_DWORD *)&v179[4];
        if (*(_DWORD *)v179 > v46) {
          goto LABEL_86;
        }
        unsigned int v61 = *(a2 - 15);
        if (*(_DWORD *)&v179[4] > v61) {
          goto LABEL_77;
        }
        if (*(_DWORD *)&v179[4] < v61)
        {
LABEL_86:
          unsigned int v48 = *(_DWORD *)&v179[24];
LABEL_87:
          for (k = (unsigned int *)(a1 + 64); k < a2; k += 16)
          {
            if (*(_DWORD *)v179 < *k) {
              break;
            }
            if (*(_DWORD *)v179 <= *k)
            {
              unsigned int v50 = k[1];
              if (*(_DWORD *)&v179[4] > v50 || *(_DWORD *)&v179[4] >= v50 && v48 < k[6]) {
                break;
              }
            }
          }
          goto LABEL_95;
        }
        unsigned int v48 = *(_DWORD *)&v179[24];
        if (*(_DWORD *)&v179[24] >= *(a2 - 10)) {
          goto LABEL_87;
        }
LABEL_78:
        for (k = (unsigned int *)(a1 + 64); *(_DWORD *)v179 >= *k; k += 16)
        {
          if (*(_DWORD *)v179 <= *k)
          {
            unsigned int v49 = k[1];
            if (v47 > v49 || v47 >= v49 && v48 < k[6]) {
              break;
            }
          }
        }
LABEL_95:
        unint64_t m = (unint64_t)a2;
        if (k < a2)
        {
          for (unint64_t m = (unint64_t)(a2 - 16); ; m -= 64)
          {
            if (*(_DWORD *)v179 >= v46)
            {
              if (*(_DWORD *)v179 > v46) {
                break;
              }
              unsigned int v52 = *(_DWORD *)(m + 4);
              if (v47 <= v52 && (v47 < v52 || v48 >= *(_DWORD *)(m + 24))) {
                break;
              }
            }
            unsigned int v53 = *(_DWORD *)(m - 64);
            unsigned int v46 = v53;
          }
        }
        while ((unint64_t)k < m)
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)k, m);
          for (k += 16; *(_DWORD *)v179 >= *k; k += 16)
          {
            if (*(_DWORD *)v179 <= *k)
            {
              unsigned int v54 = k[1];
              if (*(_DWORD *)&v179[4] > v54 || *(_DWORD *)&v179[4] >= v54 && *(_DWORD *)&v179[24] < k[6]) {
                break;
              }
            }
          }
          do
          {
            do
            {
              unsigned int v55 = *(_DWORD *)(m - 64);
              m -= 64;
              BOOL v56 = *(_DWORD *)v179 > v55;
            }
            while (*(_DWORD *)v179 < v55);
            if (v56) {
              break;
            }
            unsigned int v57 = *(_DWORD *)(m + 4);
          }
          while (*(_DWORD *)&v179[4] > v57 || *(_DWORD *)&v179[4] >= v57 && *(_DWORD *)&v179[24] < *(_DWORD *)(m + 24));
        }
        v58 = k - 16;
        if (k - 16 != (unsigned int *)a1)
        {
          long long v59 = *(_OWORD *)v58;
          *(_OWORD *)(a1 + 12) = *(_OWORD *)(k - 13);
          *(_OWORD *)a1 = v59;
          skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(k - 8));
          *(_DWORD *)(a1 + 56) = *(k - 2);
        }
        long long v60 = *(_OWORD *)v179;
        *(_OWORD *)(k - 13) = *(_OWORD *)&v179[12];
        *(_OWORD *)v58 = v60;
        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)k - 4, (uint64_t)&v180);
        *(k - 2) = v184;
        BOOL v4 = v180 >= &v183;
        BOOL v5 = v180 == &v183;
        if (v180 != &v183) {
          free(v180);
        }
LABEL_68:
        a4 = 0;
      }
      long long v18 = *(_OWORD *)a1;
      *(_OWORD *)&v179[12] = *(_OWORD *)(a1 + 12);
      *(_OWORD *)v179 = v18;
      if (*(void *)(a1 + 32) == a1 + 48)
      {
        v180 = &v183;
        uint64_t v20 = *(unsigned int *)(a1 + 40);
        uint64_t v19 = &v182;
        if (v20)
        {
          std::basic_string<char16_t>::size_type v21 = *(__int16 **)(a1 + 32);
          uint64_t v22 = 2 * v20;
          uint64_t v23 = &v183;
          do
          {
            __int16 v24 = *v21++;
            *(_WORD *)uint64_t v23 = v24;
            uint64_t v23 = (uint64_t *)((char *)v23 + 2);
            v22 -= 2;
          }
          while (v22);
          uint64_t v19 = &v182;
        }
      }
      else
      {
        v180 = *(void **)(a1 + 32);
        uint64_t v19 = (int *)(a1 + 44);
        int v182 = *(_DWORD *)(a1 + 44);
        *(void *)(a1 + 32) = a1 + 48;
      }
      *uint64_t v19 = 4;
      int v181 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(a1 + 40) = 0;
      unsigned int v184 = *(_DWORD *)(a1 + 56);
      for (n = (unsigned int *)(a1 + 64); ; n += 16)
      {
        if (*n >= *(_DWORD *)v179)
        {
          if (*n > *(_DWORD *)v179) {
            break;
          }
          unsigned int v26 = n[1];
          if (v26 <= *(_DWORD *)&v179[4] && (v26 < *(_DWORD *)&v179[4] || n[6] >= *(_DWORD *)&v179[24])) {
            break;
          }
        }
      }
      iuint64_t i = a2 - 16;
      if (n - 16 == (unsigned int *)a1)
      {
        for (iuint64_t i = a2 - 16; n < ii + 16; ii -= 16)
        {
          if (*ii < *(_DWORD *)v179) {
            goto LABEL_45;
          }
          if (*ii <= *(_DWORD *)v179)
          {
            unsigned int v29 = ii[1];
            if (v29 > *(_DWORD *)&v179[4] || v29 >= *(_DWORD *)&v179[4] && ii[6] < *(_DWORD *)&v179[24]) {
              goto LABEL_45;
            }
          }
        }
        ii += 16;
      }
      else
      {
        while (*ii >= *(_DWORD *)v179)
        {
          if (*ii <= *(_DWORD *)v179)
          {
            unsigned int v28 = ii[1];
            if (v28 > *(_DWORD *)&v179[4] || v28 >= *(_DWORD *)&v179[4] && ii[6] < *(_DWORD *)&v179[24]) {
              break;
            }
          }
          ii -= 16;
        }
      }
LABEL_45:
      k = n;
      if (n < ii)
      {
        k = n;
        unint64_t v30 = (unint64_t)ii;
        do
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)k, v30);
          for (k += 16; ; k += 16)
          {
            if (*k >= *(_DWORD *)v179)
            {
              if (*k > *(_DWORD *)v179) {
                break;
              }
              unsigned int v31 = k[1];
              if (v31 <= *(_DWORD *)&v179[4] && (v31 < *(_DWORD *)&v179[4] || k[6] >= *(_DWORD *)&v179[24])) {
                break;
              }
            }
          }
          while (1)
          {
            unsigned int v32 = *(_DWORD *)(v30 - 64);
            v30 -= 64;
            BOOL v33 = v32 > *(_DWORD *)v179;
            if (v32 < *(_DWORD *)v179) {
              break;
            }
            if (!v33)
            {
              unsigned int v34 = *(_DWORD *)(v30 + 4);
              if (v34 > *(_DWORD *)&v179[4]
                || v34 >= *(_DWORD *)&v179[4] && *(_DWORD *)(v30 + 24) < *(_DWORD *)&v179[24])
              {
                break;
              }
            }
          }
        }
        while ((unint64_t)k < v30);
      }
      uint64_t v35 = k - 16;
      if (k - 16 != (unsigned int *)a1)
      {
        long long v36 = *(_OWORD *)v35;
        *(_OWORD *)(a1 + 12) = *(_OWORD *)(k - 13);
        *(_OWORD *)a1 = v36;
        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(k - 8));
        *(_DWORD *)(a1 + 56) = *(k - 2);
      }
      long long v37 = *(_OWORD *)v179;
      *(_OWORD *)(k - 13) = *(_OWORD *)&v179[12];
      *(_OWORD *)uint64_t v35 = v37;
      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)k - 4, (uint64_t)&v180);
      *(k - 2) = v184;
      if (v180 != &v183) {
        free(v180);
      }
      if (n < ii)
      {
LABEL_67:
        _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(a1, k - 16, a3, a4 & 1);
        goto LABEL_68;
      }
      BOOL matched = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_((unsigned int *)a1, k - 16);
      if (_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_(k, a2))
      {
        break;
      }
      if (!matched) {
        goto LABEL_67;
      }
    }
    a2 = k - 16;
    if (!matched) {
      continue;
    }
    break;
  }
}

BOOL skit::internal::anonymous namespace'::is_possessive_token(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if ((HIDWORD(a3) - a3) < 3) {
    return 0;
  }
  uint64_t v3 = a1 + 2 * HIDWORD(a3);
  return *(_DWORD *)(v3 - 4) == 7536679 || *(_DWORD *)(v3 - 4) == 7544857;
}

void skit::internal::anonymous namespace'::merge_token_spans(uint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int v5 = *(_DWORD *)(a3 + 8);
  if (a4)
  {
    unsigned int v6 = a4;
    unsigned int v9 = 0;
    do
    {
      if (v6 >= v5)
      {
LABEL_20:
        ++v9;
      }
      else
      {
        char v10 = 0;
        uint64_t v11 = (int32x2_t *)(*(void *)a3 + ((unint64_t)v9 << 6));
        uint64_t v12 = v6;
LABEL_5:
        char v25 = v10;
        uint64_t v13 = v12 << 6;
        do
        {
          uint64_t v14 = *(void *)a3;
          unsigned int v15 = (int *)(*(void *)a3 + v13);
          if (v15[4] <= 1)
          {
            unint64_t v16 = v11->u32[1];
            int v17 = *v15;
            if (*v15 >= v16)
            {
              if (v17 == v16) {
                goto LABEL_16;
              }
              unint64_t v18 = a2 - v16;
              if (a2 < v16) {
                std::__throw_out_of_range[abi:ne180100]("string_view::substr");
              }
              unint64_t v19 = (v17 - v16);
              uint64_t v20 = a1 + 2 * v16;
              if (v18 < v19) {
                unint64_t v19 = v18;
              }
              v26[0] = v20;
              v26[1] = v19;
              if (!skit::is_significant(v26))
              {
                unsigned int v15 = (int *)(v14 + v13);
LABEL_16:
                skit::SpanMatchV3::merge((size_t)v15, v11);
                ++v12;
                char v10 = 1;
                if (v5 != v12) {
                  goto LABEL_5;
                }
                goto LABEL_19;
              }
            }
          }
          ++v12;
          v13 += 64;
        }
        while (v5 != v12);
        if ((v25 & 1) == 0) {
          goto LABEL_20;
        }
LABEL_19:
        skit::SmallVector<skit::SpanMatchV3,4u,true>::erase(a3, *(void *)a3 + ((unint64_t)v9 << 6));
        --v6;
        --v5;
      }
    }
    while (v9 < v6);
    unsigned int v5 = *(_DWORD *)(a3 + 8);
  }
  uint64_t v21 = *(void *)a3;
  uint64_t v22 = (unsigned int *)(*(void *)a3 + ((unint64_t)v5 << 6));
  unint64_t v23 = 126 - 2 * __clz(v5);
  if (v5) {
    uint64_t v24 = v23;
  }
  else {
    uint64_t v24 = 0;
  }

  _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(v21, v22, v24, 1);
}

char **skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector(char **a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *((unsigned int *)a1 + 2);
  if (v3)
  {
    uint64_t v4 = v3 << 6;
    unsigned int v5 = v2 + 48;
    do
    {
      unsigned int v6 = (char *)*((void *)v5 - 2);
      if (v5 != v6) {
        free(v6);
      }
      v5 += 64;
      v4 -= 64;
    }
    while (v4);
    uint64_t v2 = *a1;
  }
  if (v2 != (char *)(a1 + 2)) {
    free(v2);
  }
  return a1;
}

size_t skit::SmallVector<skit::SpanMatchV3,4u,true>::_reserve_more(char **a1, unsigned int a2)
{
  uint64_t v3 = (char *)malloc_type_malloc((unint64_t)a2 << 6, 0x10200408C599F99uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unsigned int v15 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v15, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  uint64_t v4 = v3;
  unsigned int v5 = *a1;
  uint64_t v6 = *((unsigned int *)a1 + 2);
  if (v6)
  {
    int v7 = v3;
    unsigned int v8 = *a1;
    do
    {
      long long v9 = *(_OWORD *)v8;
      *(_OWORD *)(v7 + 12) = *(_OWORD *)(v8 + 12);
      *(_OWORD *)int v7 = v9;
      skit::SmallVector<skit::GroupId,4u,true>::move((uint64_t)(v7 + 32), (uint64_t)(v8 + 32));
      *((_DWORD *)v7 + 14) = *((_DWORD *)v8 + 14);
      v8 += 64;
      v7 += 64;
    }
    while (v8 != &v5[64 * v6]);
    uint64_t v10 = v6 << 6;
    uint64_t v11 = v5 + 48;
    do
    {
      uint64_t v12 = (char *)*((void *)v11 - 2);
      if (v11 != v12) {
        free(v12);
      }
      v11 += 64;
      v10 -= 64;
    }
    while (v10);
    unsigned int v5 = *a1;
  }
  if (v5 != (char *)(a1 + 2)) {
    free(v5);
  }
  *a1 = v4;
  size_t result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result >> 6;
  return result;
}

void _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(uint64_t a1, unsigned int *a2, uint64_t a3, char a4)
{
  uint64_t v185 = *MEMORY[0x1E4F143B8];
  while (2)
  {
    k = (unsigned int *)a1;
    while (1)
    {
      while (1)
      {
        a1 = (uint64_t)k;
        uint64_t v11 = (char *)a2 - (char *)k;
        unint64_t v12 = ((char *)a2 - (char *)k) >> 6;
        if (v5 || !v4)
        {
          switch(v12)
          {
            case 0uLL:
            case 1uLL:
              return;
            case 2uLL:
              unsigned int v62 = *(a2 - 16);
              if (v62 < *(_DWORD *)a1
                || v62 <= *(_DWORD *)a1
                && ((unsigned int v153 = *(a2 - 15), v154 = *(_DWORD *)(a1 + 4), v153 > v154)
                 || v153 >= v154 && *(a2 - 10) < *(_DWORD *)(a1 + 24)))
              {
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(a1, (uint64_t)(a2 - 16));
              }
              break;
            case 3uLL:
              _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), a2 - 16);
              break;
            case 4uLL:
              _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), (unsigned int *)(a1 + 128), a2 - 16);
              break;
            case 5uLL:
              _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + 64), (unsigned int *)(a1 + 128), (unsigned int *)(a1 + 192), a2 - 16);
              break;
            default:
              JUMPOUT(0);
          }
          return;
        }
        if (v11 <= 1535)
        {
          if (a4)
          {
            if ((unsigned int *)a1 != a2)
            {
              uint64_t v63 = a1 + 64;
              if ((unsigned int *)(a1 + 64) != a2)
              {
                uint64_t v64 = 0;
                uint64_t v65 = a1;
                do
                {
                  v66 = (unsigned int *)v65;
                  uint64_t v65 = v63;
                  unsigned int v67 = v66[16];
                  if (v67 < *v66
                    || v67 <= *v66
                    && ((unsigned int v68 = *(_DWORD *)(v65 + 4), v69 = v66[1], v68 > v69)
                     || v68 >= v69 && *(_DWORD *)(v65 + 24) < v66[6]))
                  {
                    long long v70 = *(_OWORD *)v65;
                    *(_OWORD *)&v179[12] = *(_OWORD *)(v65 + 12);
                    *(_OWORD *)v179 = v70;
                    if (*(void *)(v65 + 32) == v65 + 48)
                    {
                      v180 = &v183;
                      uint64_t v72 = *(unsigned int *)(v65 + 40);
                      v71 = &v182;
                      if (v72)
                      {
                        v73 = *(__int16 **)(v65 + 32);
                        uint64_t v74 = 2 * v72;
                        v75 = &v183;
                        do
                        {
                          __int16 v76 = *v73++;
                          *(_WORD *)v75 = v76;
                          v75 = (uint64_t *)((char *)v75 + 2);
                          v74 -= 2;
                        }
                        while (v74);
                        v71 = &v182;
                      }
                    }
                    else
                    {
                      v180 = *(void **)(v65 + 32);
                      v71 = (int *)(v65 + 44);
                      int v182 = *(_DWORD *)(v65 + 44);
                      *(void *)(v65 + 32) = v65 + 48;
                    }
                    uint64_t v77 = a1;
                    int *v71 = 4;
                    int v181 = *(_DWORD *)(v65 + 40);
                    *(_DWORD *)(v65 + 40) = 0;
                    unsigned int v184 = *(_DWORD *)(v65 + 56);
                    for (uint64_t i = v64; ; i -= 64)
                    {
                      uint64_t v79 = v77 + i;
                      *(_OWORD *)(v79 + 64) = *(_OWORD *)(v77 + i);
                      *(_OWORD *)(v79 + 76) = *(_OWORD *)(v77 + i + 12);
                      v80 = (void **)(v77 + i + 32);
                      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v77 + i + 96), (uint64_t)v80);
                      *(_DWORD *)(v79 + 120) = *(_DWORD *)(v79 + 56);
                      if (!i)
                      {
                        uint64_t v83 = v77;
                        goto LABEL_157;
                      }
                      unsigned int v81 = *(_DWORD *)(v79 - 64);
                      if (*(_DWORD *)v179 >= v81)
                      {
                        if (*(_DWORD *)v179 > v81) {
                          break;
                        }
                        unsigned int v82 = *(_DWORD *)(v77 + i - 60);
                        if (*(_DWORD *)&v179[4] <= v82
                          && (*(_DWORD *)&v179[4] < v82 || *(_DWORD *)&v179[24] >= *(_DWORD *)(v77 + i - 40)))
                        {
                          break;
                        }
                      }
                    }
                    uint64_t v83 = v77 + i;
                    v80 = (void **)(v83 + 32);
LABEL_157:
                    long long v84 = *(_OWORD *)v179;
                    *(_OWORD *)(v83 + 12) = *(_OWORD *)&v179[12];
                    *(_OWORD *)uint64_t v83 = v84;
                    skit::SmallVector<skit::GroupId,4u,true>::operator=(v80, (uint64_t)&v180);
                    *(_DWORD *)(v83 + 56) = v184;
                    if (v180 != &v183) {
                      free(v180);
                    }
                    a1 = v77;
                  }
                  uint64_t v63 = v65 + 64;
                  v64 += 64;
                }
                while ((unsigned int *)(v65 + 64) != a2);
              }
            }
          }
          else if ((unsigned int *)a1 != a2)
          {
            for (uint64_t j = a1 + 64; (unsigned int *)(a1 + 64) != a2; uint64_t j = a1 + 64)
            {
              uint64_t v156 = a1;
              a1 = j;
              unsigned int v157 = *(_DWORD *)(v156 + 64);
              if (v157 >= *(_DWORD *)v156)
              {
                if (v157 > *(_DWORD *)v156) {
                  continue;
                }
                unsigned int v158 = *(_DWORD *)(a1 + 4);
                unsigned int v159 = *(_DWORD *)(v156 + 4);
                if (v158 <= v159 && (v158 < v159 || *(_DWORD *)(a1 + 24) >= *(_DWORD *)(v156 + 24))) {
                  continue;
                }
              }
              long long v160 = *(_OWORD *)a1;
              *(_OWORD *)&v179[12] = *(_OWORD *)(a1 + 12);
              *(_OWORD *)v179 = v160;
              if (*(void *)(a1 + 32) == a1 + 48)
              {
                v180 = &v183;
                uint64_t v162 = *(unsigned int *)(a1 + 40);
                v161 = &v182;
                if (v162)
                {
                  v163 = *(__int16 **)(a1 + 32);
                  uint64_t v164 = 2 * v162;
                  v165 = &v183;
                  do
                  {
                    __int16 v166 = *v163++;
                    *(_WORD *)v165 = v166;
                    v165 = (uint64_t *)((char *)v165 + 2);
                    v164 -= 2;
                  }
                  while (v164);
                  v161 = &v182;
                }
              }
              else
              {
                v180 = *(void **)(a1 + 32);
                v161 = (int *)(a1 + 44);
                int v182 = *(_DWORD *)(a1 + 44);
                *(void *)(a1 + 32) = a1 + 48;
              }
              int *v161 = 4;
              int v181 = *(_DWORD *)(a1 + 40);
              *(_DWORD *)(a1 + 40) = 0;
              unsigned int v184 = *(_DWORD *)(a1 + 56);
              do
              {
                do
                {
                  uint64_t v167 = v156;
                  *(_OWORD *)(v156 + 64) = *(_OWORD *)v156;
                  *(_OWORD *)(v156 + 76) = *(_OWORD *)(v156 + 12);
                  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v156 + 96), v156 + 32);
                  unsigned int v168 = *(_DWORD *)(v156 - 64);
                  v156 -= 64;
                  *(_DWORD *)(v156 + 184) = *(_DWORD *)(v156 + 120);
                  BOOL v169 = *(_DWORD *)v179 > v168;
                }
                while (*(_DWORD *)v179 < v168);
                if (v169) {
                  break;
                }
                unsigned int v170 = *(_DWORD *)(v167 - 60);
              }
              while (*(_DWORD *)&v179[4] > v170
                   || *(_DWORD *)&v179[4] >= v170 && *(_DWORD *)&v179[24] < *(_DWORD *)(v167 - 40));
              long long v171 = *(_OWORD *)v179;
              *(_OWORD *)(v167 + 12) = *(_OWORD *)&v179[12];
              *(_OWORD *)uint64_t v167 = v171;
              skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v167 + 32), (uint64_t)&v180);
              *(_DWORD *)(v167 + 56) = v184;
              if (v180 != &v183) {
                free(v180);
              }
            }
          }
          return;
        }
        if (!a3)
        {
          if ((unsigned int *)a1 != a2)
          {
            int64_t v85 = (v12 - 2) >> 1;
            int64_t v86 = v85;
            do
            {
              int64_t v87 = v86;
              if (v85 >= v86)
              {
                uint64_t v88 = (2 * v86) | 1;
                uint64_t v89 = a1 + (v88 << 6);
                if (2 * v87 + 2 < (uint64_t)v12)
                {
                  unsigned int v90 = *(_DWORD *)(v89 + 64);
                  if (*(_DWORD *)v89 < v90
                    || *(_DWORD *)v89 <= v90
                    && ((unsigned int v114 = *(_DWORD *)(v89 + 4), v115 = *(_DWORD *)(v89 + 68), v114 > v115)
                     || v114 >= v115 && *(_DWORD *)(a1 + (v88 << 6) + 24) < *(_DWORD *)(v89 + 88)))
                  {
                    v89 += 64;
                    uint64_t v88 = 2 * v87 + 2;
                  }
                }
                uint64_t v91 = a1 + (v87 << 6);
                if (*(_DWORD *)v89 >= *(_DWORD *)v91)
                {
                  if (*(_DWORD *)v89 > *(_DWORD *)v91
                    || (unsigned int v97 = *(_DWORD *)(v89 + 4), v98 = *(_DWORD *)(v91 + 4), v97 <= v98)
                    && (v97 < v98 || *(_DWORD *)(v89 + 24) >= *(_DWORD *)(a1 + (v87 << 6) + 24)))
                  {
                    long long v92 = *(_OWORD *)v91;
                    *(_OWORD *)&v179[12] = *(_OWORD *)(v91 + 12);
                    *(_OWORD *)v179 = v92;
                    uint64_t v93 = a1 + (v87 << 6);
                    v94 = (_WORD **)(v93 + 32);
                    if (*(void *)(v93 + 32) == v93 + 48)
                    {
                      v180 = &v183;
                      uint64_t v99 = *(unsigned int *)(v93 + 40);
                      v95 = &v182;
                      if (v99)
                      {
                        v100 = *v94;
                        uint64_t v101 = 2 * v99;
                        v102 = &v183;
                        do
                        {
                          __int16 v103 = *v100++;
                          *(_WORD *)v102 = v103;
                          v102 = (uint64_t *)((char *)v102 + 2);
                          v101 -= 2;
                        }
                        while (v101);
                        v95 = &v182;
                      }
                    }
                    else
                    {
                      v180 = *(void **)(v93 + 32);
                      int v96 = *(_DWORD *)(v93 + 44);
                      v95 = (int *)(v93 + 44);
                      int v182 = v96;
                      *v94 = v94 + 2;
                    }
                    int *v95 = 4;
                    uint64_t v104 = a1 + (v87 << 6);
                    int v181 = *(_DWORD *)(v104 + 40);
                    *(_DWORD *)(v104 + 40) = 0;
                    unsigned int v184 = *(_DWORD *)(v104 + 56);
                    while (1)
                    {
                      uint64_t v105 = v89;
                      long long v106 = *(_OWORD *)v89;
                      *(_OWORD *)(v91 + 12) = *(_OWORD *)(v89 + 12);
                      *(_OWORD *)uint64_t v91 = v106;
                      v107 = (void **)(v89 + 32);
                      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v91 + 32), v89 + 32);
                      *(_DWORD *)(v91 + 56) = *(_DWORD *)(v105 + 56);
                      if (v85 < v88) {
                        break;
                      }
                      uint64_t v108 = (2 * v88) | 1;
                      uint64_t v89 = a1 + (v108 << 6);
                      if (2 * v88 + 2 < (uint64_t)v12)
                      {
                        unsigned int v109 = *(_DWORD *)(v89 + 64);
                        if (*(_DWORD *)v89 < v109
                          || *(_DWORD *)v89 <= v109
                          && ((unsigned int v110 = *(_DWORD *)(v89 + 4), v111 = *(_DWORD *)(v89 + 68), v110 > v111)
                           || v110 >= v111 && *(_DWORD *)(a1 + (v108 << 6) + 24) < *(_DWORD *)(v89 + 88)))
                        {
                          v89 += 64;
                          uint64_t v108 = 2 * v88 + 2;
                        }
                      }
                      if (*(_DWORD *)v89 < *(_DWORD *)v179) {
                        break;
                      }
                      uint64_t v91 = v105;
                      uint64_t v88 = v108;
                      if (*(_DWORD *)v89 <= *(_DWORD *)v179)
                      {
                        unsigned int v112 = *(_DWORD *)(v89 + 4);
                        if (v112 > *(_DWORD *)&v179[4]) {
                          break;
                        }
                        uint64_t v91 = v105;
                        uint64_t v88 = v108;
                        if (v112 >= *(_DWORD *)&v179[4])
                        {
                          uint64_t v91 = v105;
                          uint64_t v88 = v108;
                          if (*(_DWORD *)(v89 + 24) < *(_DWORD *)&v179[24]) {
                            break;
                          }
                        }
                      }
                    }
                    long long v113 = *(_OWORD *)v179;
                    *(_OWORD *)(v105 + 12) = *(_OWORD *)&v179[12];
                    *(_OWORD *)uint64_t v105 = v113;
                    skit::SmallVector<skit::GroupId,4u,true>::operator=(v107, (uint64_t)&v180);
                    *(_DWORD *)(v105 + 56) = v184;
                    if (v180 != &v183) {
                      free(v180);
                    }
                  }
                }
              }
              int64_t v86 = v87 - 1;
            }
            while (v87);
            uint64_t v116 = (unint64_t)v11 >> 6;
            uint64_t v117 = a1 + 48;
            v172 = (int *)(a1 + 44);
            do
            {
              *(_OWORD *)&v173[12] = *(_OWORD *)(a1 + 12);
              *(_OWORD *)v173 = *(_OWORD *)a1;
              if (*(void *)(a1 + 32) == v117)
              {
                v174 = &v177;
                uint64_t v119 = *(unsigned int *)(a1 + 40);
                v118 = &v176;
                if (v119)
                {
                  v120 = *(__int16 **)(a1 + 32);
                  uint64_t v121 = 2 * v119;
                  v122 = &v177;
                  do
                  {
                    __int16 v123 = *v120++;
                    *(_WORD *)v122 = v123;
                    v122 = (uint64_t *)((char *)v122 + 2);
                    v121 -= 2;
                  }
                  while (v121);
                  v118 = &v176;
                }
              }
              else
              {
                v174 = *(void **)(a1 + 32);
                int v176 = *(_DWORD *)(a1 + 44);
                *(void *)(a1 + 32) = v117;
                v118 = v172;
              }
              uint64_t v124 = 0;
              int *v118 = 4;
              int v175 = *(_DWORD *)(a1 + 40);
              *(_DWORD *)(a1 + 40) = 0;
              unsigned int v178 = *(_DWORD *)(a1 + 56);
              uint64_t v125 = a1;
              do
              {
                uint64_t v126 = a1;
                uint64_t v127 = v124 + 1;
                a1 += (v124 + 1) << 6;
                uint64_t v128 = 2 * v124;
                uint64_t v124 = (2 * v124) | 1;
                uint64_t v129 = v128 + 2;
                if (v129 < v116)
                {
                  unsigned int v130 = *(_DWORD *)(a1 + 64);
                  if (*(_DWORD *)a1 < v130
                    || *(_DWORD *)a1 <= v130
                    && ((unsigned int v132 = *(_DWORD *)(a1 + 4), v133 = *(_DWORD *)(a1 + 68), v132 > v133)
                     || v132 >= v133 && *(_DWORD *)(v126 + (v127 << 6) + 24) < *(_DWORD *)(a1 + 88)))
                  {
                    a1 += 64;
                    uint64_t v124 = v129;
                  }
                }
                long long v131 = *(_OWORD *)a1;
                *(_OWORD *)(v126 + 12) = *(_OWORD *)(a1 + 12);
                *(_OWORD *)uint64_t v126 = v131;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(v126 + 32), a1 + 32);
                *(_DWORD *)(v126 + 56) = *(_DWORD *)(a1 + 56);
              }
              while (v124 <= (uint64_t)((unint64_t)(v116 - 2) >> 1));
              v134 = a2 - 16;
              if ((unsigned int *)a1 == a2 - 16)
              {
                *(_OWORD *)(a1 + 12) = *(_OWORD *)&v173[12];
                *(_OWORD *)a1 = *(_OWORD *)v173;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)&v174);
                *(_DWORD *)(a1 + 56) = v178;
              }
              else
              {
                long long v135 = *(_OWORD *)v134;
                *(_OWORD *)(a1 + 12) = *(_OWORD *)(a2 - 13);
                *(_OWORD *)a1 = v135;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(a2 - 8));
                *(_DWORD *)(a1 + 56) = *(a2 - 2);
                *(_OWORD *)(a2 - 13) = *(_OWORD *)&v173[12];
                *(_OWORD *)v134 = *(_OWORD *)v173;
                skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)a2 - 4, (uint64_t)&v174);
                *(a2 - 2) = v178;
                uint64_t v136 = a1 - v125 + 64;
                if (v136 >= 65)
                {
                  unint64_t v137 = (((unint64_t)v136 >> 6) - 2) >> 1;
                  uint64_t v138 = v125 + (v137 << 6);
                  if (*(_DWORD *)v138 < *(_DWORD *)a1
                    || *(_DWORD *)v138 <= *(_DWORD *)a1
                    && ((unsigned int v139 = *(_DWORD *)(v138 + 4), v140 = *(_DWORD *)(a1 + 4), v139 > v140)
                     || v139 >= v140 && *(_DWORD *)(v125 + (v137 << 6) + 24) < *(_DWORD *)(a1 + 24)))
                  {
                    long long v141 = *(_OWORD *)a1;
                    *(_OWORD *)&v179[12] = *(_OWORD *)(a1 + 12);
                    *(_OWORD *)v179 = v141;
                    if (*(void *)(a1 + 32) == a1 + 48)
                    {
                      v180 = &v183;
                      uint64_t v143 = *(unsigned int *)(a1 + 40);
                      v142 = &v182;
                      if (v143)
                      {
                        v144 = *(__int16 **)(a1 + 32);
                        uint64_t v145 = 2 * v143;
                        v146 = &v183;
                        do
                        {
                          __int16 v147 = *v144++;
                          *(_WORD *)v146 = v147;
                          v146 = (uint64_t *)((char *)v146 + 2);
                          v145 -= 2;
                        }
                        while (v145);
                        v142 = &v182;
                      }
                    }
                    else
                    {
                      v180 = *(void **)(a1 + 32);
                      v142 = (int *)(a1 + 44);
                      int v182 = *(_DWORD *)(a1 + 44);
                      *(void *)(a1 + 32) = a1 + 48;
                    }
                    int *v142 = 4;
                    int v181 = *(_DWORD *)(a1 + 40);
                    *(_DWORD *)(a1 + 40) = 0;
                    unsigned int v184 = *(_DWORD *)(a1 + 56);
                    while (1)
                    {
                      uint64_t v148 = v138;
                      long long v149 = *(_OWORD *)v138;
                      *(_OWORD *)(a1 + 12) = *(_OWORD *)(v138 + 12);
                      *(_OWORD *)a1 = v149;
                      v150 = (void **)(v138 + 32);
                      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), v138 + 32);
                      *(_DWORD *)(a1 + 56) = *(_DWORD *)(v148 + 56);
                      if (!v137) {
                        break;
                      }
                      unint64_t v137 = (v137 - 1) >> 1;
                      uint64_t v138 = v125 + (v137 << 6);
                      a1 = v148;
                      if (*(_DWORD *)v138 >= *(_DWORD *)v179)
                      {
                        if (*(_DWORD *)v138 > *(_DWORD *)v179) {
                          break;
                        }
                        unsigned int v151 = *(_DWORD *)(v138 + 4);
                        a1 = v148;
                        if (v151 <= *(_DWORD *)&v179[4])
                        {
                          if (v151 < *(_DWORD *)&v179[4]) {
                            break;
                          }
                          a1 = v148;
                          if (*(_DWORD *)(v125 + (v137 << 6) + 24) >= *(_DWORD *)&v179[24]) {
                            break;
                          }
                        }
                      }
                    }
                    long long v152 = *(_OWORD *)v179;
                    *(_OWORD *)(v148 + 12) = *(_OWORD *)&v179[12];
                    *(_OWORD *)uint64_t v148 = v152;
                    skit::SmallVector<skit::GroupId,4u,true>::operator=(v150, (uint64_t)&v180);
                    *(_DWORD *)(v148 + 56) = v184;
                    if (v180 != &v183) {
                      free(v180);
                    }
                  }
                }
              }
              if (v174 != &v177) {
                free(v174);
              }
              a2 = v134;
              BOOL v33 = v116-- <= 2;
              a1 = v125;
            }
            while (!v33);
          }
          return;
        }
        unint64_t v13 = v12 >> 1;
        uint64_t v14 = (unsigned int *)(a1 + (v12 >> 1 << 6));
        if ((unint64_t)v11 > 0x2000)
        {
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)a1, (unsigned int *)(a1 + (v12 >> 1 << 6)), a2 - 16);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + 64), v14 - 16, a2 - 32);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + 128), (unsigned int *)(a1 + 64 + (v13 << 6)), a2 - 48);
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(v14 - 16, v14, (unsigned int *)(a1 + 64 + (v13 << 6)));
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(a1, (uint64_t)v14);
        }
        else
        {
          _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_((unsigned int *)(a1 + (v12 >> 1 << 6)), (unsigned int *)a1, a2 - 16);
        }
        --a3;
        if (a4) {
          break;
        }
        unsigned int v15 = *(_DWORD *)(a1 - 64);
        if (v15 < *(_DWORD *)a1) {
          break;
        }
        if (v15 <= *(_DWORD *)a1)
        {
          unsigned int v16 = *(_DWORD *)(a1 - 60);
          unsigned int v17 = *(_DWORD *)(a1 + 4);
          if (v16 > v17 || v16 >= v17 && *(_DWORD *)(a1 - 40) < *(_DWORD *)(a1 + 24)) {
            break;
          }
        }
        long long v39 = *(_OWORD *)a1;
        *(_OWORD *)&v179[12] = *(_OWORD *)(a1 + 12);
        *(_OWORD *)v179 = v39;
        if (*(void *)(a1 + 32) == a1 + 48)
        {
          v180 = &v183;
          uint64_t v41 = *(unsigned int *)(a1 + 40);
          ssize_t v40 = &v182;
          if (v41)
          {
            size_t v42 = *(__int16 **)(a1 + 32);
            uint64_t v43 = 2 * v41;
            v44 = &v183;
            do
            {
              __int16 v45 = *v42++;
              *(_WORD *)v44 = v45;
              v44 = (uint64_t *)((char *)v44 + 2);
              v43 -= 2;
            }
            while (v43);
            ssize_t v40 = &v182;
          }
        }
        else
        {
          v180 = *(void **)(a1 + 32);
          ssize_t v40 = (int *)(a1 + 44);
          int v182 = *(_DWORD *)(a1 + 44);
          *(void *)(a1 + 32) = a1 + 48;
        }
        *ssize_t v40 = 4;
        int v181 = *(_DWORD *)(a1 + 40);
        *(_DWORD *)(a1 + 40) = 0;
        unsigned int v184 = *(_DWORD *)(a1 + 56);
        unsigned int v46 = *(a2 - 16);
        if (*(_DWORD *)v179 < v46)
        {
          unsigned int v47 = *(_DWORD *)&v179[4];
LABEL_77:
          unsigned int v48 = *(_DWORD *)&v179[24];
          goto LABEL_78;
        }
        unsigned int v47 = *(_DWORD *)&v179[4];
        if (*(_DWORD *)v179 > v46) {
          goto LABEL_86;
        }
        unsigned int v61 = *(a2 - 15);
        if (*(_DWORD *)&v179[4] > v61) {
          goto LABEL_77;
        }
        if (*(_DWORD *)&v179[4] < v61)
        {
LABEL_86:
          unsigned int v48 = *(_DWORD *)&v179[24];
LABEL_87:
          for (k = (unsigned int *)(a1 + 64); k < a2; k += 16)
          {
            if (*(_DWORD *)v179 < *k) {
              break;
            }
            if (*(_DWORD *)v179 <= *k)
            {
              unsigned int v50 = k[1];
              if (*(_DWORD *)&v179[4] > v50 || *(_DWORD *)&v179[4] >= v50 && v48 < k[6]) {
                break;
              }
            }
          }
          goto LABEL_95;
        }
        unsigned int v48 = *(_DWORD *)&v179[24];
        if (*(_DWORD *)&v179[24] >= *(a2 - 10)) {
          goto LABEL_87;
        }
LABEL_78:
        for (k = (unsigned int *)(a1 + 64); *(_DWORD *)v179 >= *k; k += 16)
        {
          if (*(_DWORD *)v179 <= *k)
          {
            unsigned int v49 = k[1];
            if (v47 > v49 || v47 >= v49 && v48 < k[6]) {
              break;
            }
          }
        }
LABEL_95:
        unint64_t m = (unint64_t)a2;
        if (k < a2)
        {
          for (unint64_t m = (unint64_t)(a2 - 16); ; m -= 64)
          {
            if (*(_DWORD *)v179 >= v46)
            {
              if (*(_DWORD *)v179 > v46) {
                break;
              }
              unsigned int v52 = *(_DWORD *)(m + 4);
              if (v47 <= v52 && (v47 < v52 || v48 >= *(_DWORD *)(m + 24))) {
                break;
              }
            }
            unsigned int v53 = *(_DWORD *)(m - 64);
            unsigned int v46 = v53;
          }
        }
        while ((unint64_t)k < m)
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)k, m);
          for (k += 16; *(_DWORD *)v179 >= *k; k += 16)
          {
            if (*(_DWORD *)v179 <= *k)
            {
              unsigned int v54 = k[1];
              if (*(_DWORD *)&v179[4] > v54 || *(_DWORD *)&v179[4] >= v54 && *(_DWORD *)&v179[24] < k[6]) {
                break;
              }
            }
          }
          do
          {
            do
            {
              unsigned int v55 = *(_DWORD *)(m - 64);
              m -= 64;
              BOOL v56 = *(_DWORD *)v179 > v55;
            }
            while (*(_DWORD *)v179 < v55);
            if (v56) {
              break;
            }
            unsigned int v57 = *(_DWORD *)(m + 4);
          }
          while (*(_DWORD *)&v179[4] > v57 || *(_DWORD *)&v179[4] >= v57 && *(_DWORD *)&v179[24] < *(_DWORD *)(m + 24));
        }
        v58 = k - 16;
        if (k - 16 != (unsigned int *)a1)
        {
          long long v59 = *(_OWORD *)v58;
          *(_OWORD *)(a1 + 12) = *(_OWORD *)(k - 13);
          *(_OWORD *)a1 = v59;
          skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(k - 8));
          *(_DWORD *)(a1 + 56) = *(k - 2);
        }
        long long v60 = *(_OWORD *)v179;
        *(_OWORD *)(k - 13) = *(_OWORD *)&v179[12];
        *(_OWORD *)v58 = v60;
        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)k - 4, (uint64_t)&v180);
        *(k - 2) = v184;
        BOOL v4 = v180 >= &v183;
        BOOL v5 = v180 == &v183;
        if (v180 != &v183) {
          free(v180);
        }
LABEL_68:
        a4 = 0;
      }
      long long v18 = *(_OWORD *)a1;
      *(_OWORD *)&v179[12] = *(_OWORD *)(a1 + 12);
      *(_OWORD *)v179 = v18;
      if (*(void *)(a1 + 32) == a1 + 48)
      {
        v180 = &v183;
        uint64_t v20 = *(unsigned int *)(a1 + 40);
        unint64_t v19 = &v182;
        if (v20)
        {
          uint64_t v21 = *(__int16 **)(a1 + 32);
          uint64_t v22 = 2 * v20;
          unint64_t v23 = &v183;
          do
          {
            __int16 v24 = *v21++;
            *(_WORD *)unint64_t v23 = v24;
            unint64_t v23 = (uint64_t *)((char *)v23 + 2);
            v22 -= 2;
          }
          while (v22);
          unint64_t v19 = &v182;
        }
      }
      else
      {
        v180 = *(void **)(a1 + 32);
        unint64_t v19 = (int *)(a1 + 44);
        int v182 = *(_DWORD *)(a1 + 44);
        *(void *)(a1 + 32) = a1 + 48;
      }
      *unint64_t v19 = 4;
      int v181 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(a1 + 40) = 0;
      unsigned int v184 = *(_DWORD *)(a1 + 56);
      for (n = (unsigned int *)(a1 + 64); ; n += 16)
      {
        if (*n >= *(_DWORD *)v179)
        {
          if (*n > *(_DWORD *)v179) {
            break;
          }
          unsigned int v26 = n[1];
          if (v26 <= *(_DWORD *)&v179[4] && (v26 < *(_DWORD *)&v179[4] || n[6] >= *(_DWORD *)&v179[24])) {
            break;
          }
        }
      }
      iuint64_t i = a2 - 16;
      if (n - 16 == (unsigned int *)a1)
      {
        for (iuint64_t i = a2 - 16; n < ii + 16; ii -= 16)
        {
          if (*ii < *(_DWORD *)v179) {
            goto LABEL_45;
          }
          if (*ii <= *(_DWORD *)v179)
          {
            unsigned int v29 = ii[1];
            if (v29 > *(_DWORD *)&v179[4] || v29 >= *(_DWORD *)&v179[4] && ii[6] < *(_DWORD *)&v179[24]) {
              goto LABEL_45;
            }
          }
        }
        ii += 16;
      }
      else
      {
        while (*ii >= *(_DWORD *)v179)
        {
          if (*ii <= *(_DWORD *)v179)
          {
            unsigned int v28 = ii[1];
            if (v28 > *(_DWORD *)&v179[4] || v28 >= *(_DWORD *)&v179[4] && ii[6] < *(_DWORD *)&v179[24]) {
              break;
            }
          }
          ii -= 16;
        }
      }
LABEL_45:
      k = n;
      if (n < ii)
      {
        k = n;
        unint64_t v30 = (unint64_t)ii;
        do
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)k, v30);
          for (k += 16; ; k += 16)
          {
            if (*k >= *(_DWORD *)v179)
            {
              if (*k > *(_DWORD *)v179) {
                break;
              }
              unsigned int v31 = k[1];
              if (v31 <= *(_DWORD *)&v179[4] && (v31 < *(_DWORD *)&v179[4] || k[6] >= *(_DWORD *)&v179[24])) {
                break;
              }
            }
          }
          while (1)
          {
            unsigned int v32 = *(_DWORD *)(v30 - 64);
            v30 -= 64;
            BOOL v33 = v32 > *(_DWORD *)v179;
            if (v32 < *(_DWORD *)v179) {
              break;
            }
            if (!v33)
            {
              unsigned int v34 = *(_DWORD *)(v30 + 4);
              if (v34 > *(_DWORD *)&v179[4]
                || v34 >= *(_DWORD *)&v179[4] && *(_DWORD *)(v30 + 24) < *(_DWORD *)&v179[24])
              {
                break;
              }
            }
          }
        }
        while ((unint64_t)k < v30);
      }
      uint64_t v35 = k - 16;
      if (k - 16 != (unsigned int *)a1)
      {
        long long v36 = *(_OWORD *)v35;
        *(_OWORD *)(a1 + 12) = *(_OWORD *)(k - 13);
        *(_OWORD *)a1 = v36;
        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a1 + 32), (uint64_t)(k - 8));
        *(_DWORD *)(a1 + 56) = *(k - 2);
      }
      long long v37 = *(_OWORD *)v179;
      *(_OWORD *)(k - 13) = *(_OWORD *)&v179[12];
      *(_OWORD *)uint64_t v35 = v37;
      skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)k - 4, (uint64_t)&v180);
      *(k - 2) = v184;
      if (v180 != &v183) {
        free(v180);
      }
      if (n < ii)
      {
LABEL_67:
        _ZNSt3__111__introsortINS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Lb0EEEvT1_SM_SG_NS_15iterator_traitsISM_E15difference_typeEb(a1, k - 16, a3, a4 & 1);
        goto LABEL_68;
      }
      BOOL matched = _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_((unsigned int *)a1, k - 16);
      if (_ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_(k, a2))
      {
        break;
      }
      if (!matched) {
        goto LABEL_67;
      }
    }
    a2 = k - 16;
    if (!matched) {
      continue;
    }
    break;
  }
}

void std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)a1;
  *(_OWORD *)&v14[12] = *(_OWORD *)(a1 + 12);
  uint64_t v6 = *(__int16 **)(a1 + 32);
  BOOL v4 = (void **)(a1 + 32);
  BOOL v5 = v6;
  if (v6 == (__int16 *)(a1 + 48))
  {
    long long v9 = &v18;
    unsigned int v15 = &v18;
    uint64_t v8 = *(unsigned int *)(a1 + 40);
    if (v8)
    {
      uint64_t v10 = 2 * v8;
      do
      {
        __int16 v11 = *v5++;
        *(_WORD *)long long v9 = v11;
        long long v9 = (uint64_t *)((char *)v9 + 2);
        v10 -= 2;
      }
      while (v10);
    }
    int v7 = &v17;
  }
  else
  {
    unsigned int v15 = v5;
    int v7 = (int *)(a1 + 44);
    int v17 = *(_DWORD *)(a1 + 44);
    *(void *)(a1 + 32) = a1 + 48;
    LODWORD(v8) = *(_DWORD *)(a1 + 40);
  }
  int *v7 = 4;
  *(_DWORD *)(a1 + 40) = 0;
  int v12 = *(_DWORD *)(a1 + 56);
  int v16 = v8;
  int v19 = v12;
  long long v13 = *(_OWORD *)(a2 + 12);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 12) = v13;
  skit::SmallVector<skit::GroupId,4u,true>::operator=(v4, a2 + 32);
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a2 + 56);
  *(_OWORD *)a2 = *(_OWORD *)v14;
  *(_OWORD *)(a2 + 12) = *(_OWORD *)&v14[12];
  skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)(a2 + 32), (uint64_t)&v15);
  *(_DWORD *)(a2 + 56) = v19;
  if (v15 != &v18) {
    free(v15);
  }
}

void _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(unsigned int *a1, unsigned int *a2, unsigned int *a3)
{
  BOOL v5 = a1;
  unsigned int v6 = *a2;
  if (*a2 < *a1) {
    goto LABEL_4;
  }
  if (v6 > *a1) {
    goto LABEL_6;
  }
  unsigned int v7 = a2[1];
  unsigned int v8 = a1[1];
  if (v7 > v8)
  {
LABEL_4:
    BOOL v9 = 1;
    goto LABEL_7;
  }
  if (v7 >= v8) {
    BOOL v9 = a2[6] < a1[6];
  }
  else {
LABEL_6:
  }
    BOOL v9 = 0;
LABEL_7:
  if (*a3 < v6) {
    goto LABEL_10;
  }
  if (*a3 > v6)
  {
LABEL_13:
    BOOL v12 = 0;
    if (!v9) {
      goto LABEL_24;
    }
    goto LABEL_14;
  }
  unsigned int v10 = a3[1];
  unsigned int v11 = a2[1];
  if (v10 <= v11)
  {
    if (v10 >= v11)
    {
      BOOL v12 = a3[6] < a2[6];
      if (!v9) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_10:
  BOOL v12 = 1;
  if (!v9)
  {
LABEL_24:
    if (!v12) {
      return;
    }
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a2, (uint64_t)a3);
    if (*a2 >= *v5)
    {
      if (*a2 > *v5) {
        return;
      }
      unsigned int v16 = a2[1];
      unsigned int v17 = v5[1];
      if (v16 <= v17 && (v16 < v17 || a2[6] >= v5[6])) {
        return;
      }
    }
    a1 = v5;
    uint64_t v15 = (uint64_t)a2;
    goto LABEL_31;
  }
LABEL_14:
  if (!v12)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, (uint64_t)a2);
    if (*a3 >= *a2)
    {
      if (*a3 > *a2) {
        return;
      }
      unsigned int v13 = a3[1];
      unsigned int v14 = a2[1];
      if (v13 <= v14 && (v13 < v14 || a3[6] >= a2[6])) {
        return;
      }
    }
    a1 = a2;
  }
  uint64_t v15 = (uint64_t)a3;
LABEL_31:

  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, v15);
}

void _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4)
{
  _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a2, a3);
  if (*a4 < *a3 || *a4 <= *a3 && ((v8 = a4[1], unsigned int v9 = a3[1], v8 > v9) || v8 >= v9 && a4[6] < a3[6]))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a3, (uint64_t)a4);
    if (*a3 < *a2 || *a3 <= *a2 && ((unsigned int v10 = a3[1], v11 = a2[1], v10 > v11) || v10 >= v11 && a3[6] < a2[6]))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a2, (uint64_t)a3);
      if (*a2 < *a1 || *a2 <= *a1 && ((unsigned int v12 = a2[1], v13 = a1[1], v12 > v13) || v12 >= v13 && a2[6] < a1[6]))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, (uint64_t)a2);
      }
    }
  }
}

void _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_(unsigned int *a1, unsigned int *a2, unsigned int *a3, unsigned int *a4, unsigned int *a5)
{
  _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_(a1, a2, a3, a4);
  if (*a5 < *a4 || *a5 <= *a4 && ((unsigned int v16 = a5[1], v17 = a4[1], v16 > v17) || v16 >= v17 && a5[6] < a4[6]))
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a4, (uint64_t)a5);
    if (*a4 < *a3 || *a4 <= *a3 && ((unsigned int v10 = a4[1], v11 = a3[1], v10 > v11) || v10 >= v11 && a4[6] < a3[6]))
    {
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a3, (uint64_t)a4);
      if (*a3 < *a2 || *a3 <= *a2 && ((unsigned int v12 = a3[1], v13 = a2[1], v12 > v13) || v12 >= v13 && a3[6] < a2[6]))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a2, (uint64_t)a3);
        if (*a2 < *a1 || *a2 <= *a1 && ((unsigned int v14 = a2[1], v15 = a1[1], v14 > v15) || v14 >= v15 && a2[6] < a1[6]))
        {
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, (uint64_t)a2);
        }
      }
    }
  }
}

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_(unsigned int *a1, unsigned int *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 6;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = (uint64_t)(a2 - 16);
      unsigned int v7 = *(a2 - 16);
      if (v7 < *a1 || v7 <= *a1 && ((unsigned int v28 = *(a2 - 15), v29 = a1[1], v28 > v29) || v28 >= v29 && *(a2 - 10) < a1[6]))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, v6);
        return 1;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a1 + 16, a2 - 16);
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_(a1, a1 + 16, a1 + 32, a2 - 16);
      return 1;
    case 5:
      _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_(a1, a1 + 16, a1 + 32, a1 + 48, a2 - 16);
      return 1;
    default:
      unsigned int v8 = a1 + 32;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a1 + 16, a1 + 32);
      unsigned int v9 = a1 + 48;
      if (a1 + 48 == a2) {
        return 1;
      }
      uint64_t v10 = 0;
      int v11 = 0;
      break;
  }
  while (1)
  {
    if (*v9 < *v8 || *v9 <= *v8 && ((unsigned int v15 = v9[1], v16 = v8[1], v15 > v16) || v15 >= v16 && v9[6] < v8[6]))
    {
      *(_OWORD *)unint64_t v30 = *(_OWORD *)v9;
      *(_OWORD *)&v30[12] = *(_OWORD *)(v9 + 3);
      unsigned int v12 = (unsigned int *)*((void *)v9 + 4);
      if (v12 == v9 + 12)
      {
        unsigned int v31 = &v34;
        uint64_t v14 = v9[10];
        if (v14)
        {
          uint64_t v17 = 2 * v14;
          uint64_t v18 = &v34;
          do
          {
            __int16 v19 = *(_WORD *)v12;
            unsigned int v12 = (unsigned int *)((char *)v12 + 2);
            *(_WORD *)uint64_t v18 = v19;
            uint64_t v18 = (uint64_t *)((char *)v18 + 2);
            v17 -= 2;
          }
          while (v17);
        }
        unsigned int v13 = &v33;
      }
      else
      {
        unsigned int v31 = (void *)*((void *)v9 + 4);
        unsigned int v13 = v9 + 11;
        unsigned int v33 = v9[11];
        *((void *)v9 + 4) = v9 + 12;
        LODWORD(v14) = v9[10];
      }
      *unsigned int v13 = 4;
      v9[10] = 0;
      unsigned int v20 = v9[14];
      int v32 = v14;
      unsigned int v35 = v20;
      for (uint64_t i = v10; ; i -= 64)
      {
        uint64_t v22 = (char *)a1 + i;
        *((_OWORD *)v22 + 12) = *(_OWORD *)((char *)a1 + i + 128);
        *(_OWORD *)(v22 + 204) = *(_OWORD *)((char *)a1 + i + 140);
        unint64_t v23 = (void **)((char *)a1 + i + 160);
        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)((char *)a1 + i + 224), (uint64_t)v23);
        *((_DWORD *)v22 + 62) = *((_DWORD *)v22 + 46);
        if (i == -128)
        {
          uint64_t v26 = (uint64_t)a1;
          goto LABEL_28;
        }
        unsigned int v24 = *((_DWORD *)v22 + 16);
        if (*(_DWORD *)v30 >= v24)
        {
          if (*(_DWORD *)v30 > v24) {
            break;
          }
          unsigned int v25 = *(unsigned int *)((char *)a1 + i + 68);
          if (*(_DWORD *)&v30[4] <= v25
            && (*(_DWORD *)&v30[4] < v25 || *(_DWORD *)&v30[24] >= *(unsigned int *)((char *)a1 + i + 88)))
          {
            break;
          }
        }
      }
      int v27 = (char *)a1 + i;
      uint64_t v26 = (uint64_t)a1 + i + 128;
      unint64_t v23 = (void **)(v27 + 160);
LABEL_28:
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v30;
      *(_OWORD *)(v26 + 12) = *(_OWORD *)&v30[12];
      skit::SmallVector<skit::GroupId,4u,true>::operator=(v23, (uint64_t)&v31);
      *(_DWORD *)(v26 + 56) = v35;
      if (v31 != &v34) {
        free(v31);
      }
      if (++v11 == 8) {
        return v9 + 16 == a2;
      }
    }
    unsigned int v8 = v9;
    v10 += 64;
    v9 += 16;
    if (v9 == a2) {
      return 1;
    }
  }
}

BOOL _ZNSt3__127__insertion_sort_incompleteB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_118merge_prefix_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEbT1_SM_SG_(unsigned int *a1, unsigned int *a2)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 6;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = (uint64_t)(a2 - 16);
      unsigned int v7 = *(a2 - 16);
      if (v7 < *a1 || v7 <= *a1 && ((unsigned int v28 = *(a2 - 15), v29 = a1[1], v28 > v29) || v28 >= v29 && *(a2 - 10) < a1[6]))
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::SpanMatchV3 *&,skit::SpanMatchV3 *&>((uint64_t)a1, v6);
        return 1;
      }
      return result;
    case 3:
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a1 + 16, a2 - 16);
      return 1;
    case 4:
      _ZNSt3__17__sort4B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEvT1_SM_SM_SM_SG_(a1, a1 + 16, a1 + 32, a2 - 16);
      return 1;
    case 5:
      _ZNSt3__124__sort5_maybe_branchlessB8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_Li0EEEvT1_SM_SM_SM_SM_SG_(a1, a1 + 16, a1 + 32, a1 + 48, a2 - 16);
      return 1;
    default:
      unsigned int v8 = a1 + 32;
      _ZNSt3__17__sort3B8ne180100INS_17_ClassicAlgPolicyERZN4skit8internal12_GLOBAL__N_117merge_token_spansENS_17basic_string_viewIDsNS_11char_traitsIDsEEEERNS2_11SmallVectorINS2_11SpanMatchV3ELj8ELb1EEEjEUlRKT_RKT0_E_PSA_EEjT1_SM_SM_SG_(a1, a1 + 16, a1 + 32);
      unsigned int v9 = a1 + 48;
      if (a1 + 48 == a2) {
        return 1;
      }
      uint64_t v10 = 0;
      int v11 = 0;
      break;
  }
  while (1)
  {
    if (*v9 < *v8 || *v9 <= *v8 && ((unsigned int v15 = v9[1], v16 = v8[1], v15 > v16) || v15 >= v16 && v9[6] < v8[6]))
    {
      *(_OWORD *)unint64_t v30 = *(_OWORD *)v9;
      *(_OWORD *)&v30[12] = *(_OWORD *)(v9 + 3);
      unsigned int v12 = (unsigned int *)*((void *)v9 + 4);
      if (v12 == v9 + 12)
      {
        unsigned int v31 = &v34;
        uint64_t v14 = v9[10];
        if (v14)
        {
          uint64_t v17 = 2 * v14;
          uint64_t v18 = &v34;
          do
          {
            __int16 v19 = *(_WORD *)v12;
            unsigned int v12 = (unsigned int *)((char *)v12 + 2);
            *(_WORD *)uint64_t v18 = v19;
            uint64_t v18 = (uint64_t *)((char *)v18 + 2);
            v17 -= 2;
          }
          while (v17);
        }
        unsigned int v13 = &v33;
      }
      else
      {
        unsigned int v31 = (void *)*((void *)v9 + 4);
        unsigned int v13 = v9 + 11;
        unsigned int v33 = v9[11];
        *((void *)v9 + 4) = v9 + 12;
        LODWORD(v14) = v9[10];
      }
      *unsigned int v13 = 4;
      v9[10] = 0;
      unsigned int v20 = v9[14];
      int v32 = v14;
      unsigned int v35 = v20;
      for (uint64_t i = v10; ; i -= 64)
      {
        uint64_t v22 = (char *)a1 + i;
        *((_OWORD *)v22 + 12) = *(_OWORD *)((char *)a1 + i + 128);
        *(_OWORD *)(v22 + 204) = *(_OWORD *)((char *)a1 + i + 140);
        unint64_t v23 = (void **)((char *)a1 + i + 160);
        skit::SmallVector<skit::GroupId,4u,true>::operator=((void **)((char *)a1 + i + 224), (uint64_t)v23);
        *((_DWORD *)v22 + 62) = *((_DWORD *)v22 + 46);
        if (i == -128)
        {
          uint64_t v26 = (uint64_t)a1;
          goto LABEL_28;
        }
        unsigned int v24 = *((_DWORD *)v22 + 16);
        if (*(_DWORD *)v30 >= v24)
        {
          if (*(_DWORD *)v30 > v24) {
            break;
          }
          unsigned int v25 = *(unsigned int *)((char *)a1 + i + 68);
          if (*(_DWORD *)&v30[4] <= v25
            && (*(_DWORD *)&v30[4] < v25 || *(_DWORD *)&v30[24] >= *(unsigned int *)((char *)a1 + i + 88)))
          {
            break;
          }
        }
      }
      int v27 = (char *)a1 + i;
      uint64_t v26 = (uint64_t)a1 + i + 128;
      unint64_t v23 = (void **)(v27 + 160);
LABEL_28:
      *(_OWORD *)uint64_t v26 = *(_OWORD *)v30;
      *(_OWORD *)(v26 + 12) = *(_OWORD *)&v30[12];
      skit::SmallVector<skit::GroupId,4u,true>::operator=(v23, (uint64_t)&v31);
      *(_DWORD *)(v26 + 56) = v35;
      if (v31 != &v34) {
        free(v31);
      }
      if (++v11 == 8) {
        return v9 + 16 == a2;
      }
    }
    unsigned int v8 = v9;
    v10 += 64;
    v9 += 16;
    if (v9 == a2) {
      return 1;
    }
  }
}

void std::basic_string<char16_t>::reserve(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __requested_capacity)
{
  if (__requested_capacity >= 0x7FFFFFFFFFFFFFF8) {
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  }
  LODWORD(v3) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v3 & 0x80000000) == 0)
  {
    if (__requested_capacity <= 0xA) {
      return;
    }
    std::basic_string<char16_t>::size_type v4 = HIBYTE(this->__r_.__value_.__r.__words[2]);
    if (v4 <= __requested_capacity) {
      std::basic_string<char16_t>::size_type v5 = __requested_capacity;
    }
    else {
      std::basic_string<char16_t>::size_type v5 = HIBYTE(this->__r_.__value_.__r.__words[2]);
    }
    if ((v5 | 3) != 0xB)
    {
      uint64_t v11 = (v5 | 3) + 1;
      goto LABEL_24;
    }
    unint64_t v6 = (v5 & 0xFFFFFFFFFFFFFFFCLL) + 4;
LABEL_20:
    uint64_t v11 = v6 + 1;
    if (v6 < 0xB)
    {
      unsigned int v12 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
      int v13 = 1;
      uint64_t v14 = this;
      if ((v3 & 0x80) != 0) {
        goto LABEL_28;
      }
      goto LABEL_26;
    }
LABEL_24:
    uint64_t v14 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v11);
    uint64_t v11 = v15;
    LODWORD(v3) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
    if ((v3 & 0x80000000) != 0)
    {
      LOBYTE(v13) = 0;
      unsigned int v12 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
LABEL_28:
      std::basic_string<char16_t>::size_type size = this->__r_.__value_.__l.__size_;
      int v17 = 1;
LABEL_29:
      BOOL v18 = __CFADD__(size, 1);
      std::basic_string<char16_t>::size_type v19 = size + 1;
      if (v18)
      {
        if (v17) {
          goto LABEL_35;
        }
      }
      else
      {
        memmove(v14, v12, 2 * v19);
        if (v17)
        {
LABEL_35:
          operator delete(v12);
          if ((v13 & 1) == 0) {
            goto LABEL_36;
          }
          goto LABEL_33;
        }
      }
      if ((v13 & 1) == 0)
      {
LABEL_36:
        this->__r_.__value_.__l.__size_ = v4;
        this->__r_.__value_.__r.__words[2] = v11 | 0x8000000000000000;
        this->__r_.__value_.__r.__words[0] = (std::basic_string<char16_t>::size_type)v14;
        return;
      }
LABEL_33:
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v4 & 0x7F;
      return;
    }
    int v13 = 0;
    unsigned int v12 = this;
LABEL_26:
    std::basic_string<char16_t>::size_type size = v3;
    int v17 = v13;
    goto LABEL_29;
  }
  unint64_t v7 = this->__r_.__value_.__r.__words[2];
  std::basic_string<char16_t>::size_type v8 = (v7 & 0x7FFFFFFFFFFFFFFFLL) - 1;
  if (v8 < __requested_capacity)
  {
    std::basic_string<char16_t>::size_type v4 = this->__r_.__value_.__l.__size_;
    if (v4 <= __requested_capacity) {
      std::basic_string<char16_t>::size_type v9 = __requested_capacity;
    }
    else {
      std::basic_string<char16_t>::size_type v9 = this->__r_.__value_.__l.__size_;
    }
    uint64_t v10 = (v9 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((v9 | 3) != 0xB) {
      uint64_t v10 = v9 | 3;
    }
    unint64_t v6 = v9 >= 0xB ? v10 : 10;
    if (v6 != v8)
    {
      unint64_t v3 = HIBYTE(v7);
      goto LABEL_20;
    }
  }
}

void sub_1D2EE3140(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
}

std::basic_string<char16_t> *__cdecl std::basic_string<char16_t>::append(std::basic_string<char16_t> *this, std::basic_string<char16_t>::size_type __n, std::basic_string<char16_t>::value_type __c)
{
  if (__n)
  {
    LODWORD(v8) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
    if ((v8 & 0x80000000) != 0)
    {
      std::basic_string<char16_t>::size_type size = this->__r_.__value_.__l.__size_;
      unint64_t v11 = this->__r_.__value_.__r.__words[2];
      std::basic_string<char16_t>::size_type v10 = (v11 & 0x7FFFFFFFFFFFFFFFLL) - 1;
      unint64_t v8 = HIBYTE(v11);
    }
    else
    {
      std::basic_string<char16_t>::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      std::basic_string<char16_t>::size_type v10 = 10;
    }
    if (v10 - size < __n)
    {
      std::basic_string<char16_t>::__grow_by(this, v10, __n - v10 + size, size, size, v3, v4);
      this->__r_.__value_.__l.__size_ = size;
      LOBYTE(v8) = *((unsigned char *)&this->__r_.__value_.__s + 23);
    }
    unsigned int v12 = this;
    if ((v8 & 0x80) != 0) {
      unsigned int v12 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
    }
    int v13 = (std::basic_string<char16_t>::value_type *)((char *)v12 + 2 * size);
    std::basic_string<char16_t>::size_type v14 = __n;
    do
    {
      *v13++ = __c;
      --v14;
    }
    while (v14);
    std::basic_string<char16_t>::size_type v15 = size + __n;
    if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0) {
      this->__r_.__value_.__l.__size_ = v15;
    }
    else {
      *((unsigned char *)&this->__r_.__value_.__s + 23) = v15 & 0x7F;
    }
    v12->__r_.__value_.__s.__data_[v15] = 0;
  }
  return this;
}

size_t skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::_reserve_more(uint64_t a1, unsigned int a2)
{
  std::basic_string<char16_t>::size_type v3 = malloc_type_malloc(4 * a2, 0x100004052888210uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unsigned int v12 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v12, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  std::basic_string<char16_t>::size_type v4 = v3;
  std::basic_string<char16_t>::size_type v5 = *(int **)a1;
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  if (v6)
  {
    uint64_t v7 = 4 * v6;
    unint64_t v8 = v4;
    do
    {
      int v9 = *v5++;
      *v8++ = v9;
      v7 -= 4;
    }
    while (v7);
    std::basic_string<char16_t>::size_type v5 = *(int **)a1;
  }
  if (v5 != (int *)(a1 + 16)) {
    free(v5);
  }
  *(void *)a1 = v4;
  size_t result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result >> 2;
  return result;
}

size_t skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::emplace_back<unsigned short &,unsigned short &>(size_t result, _WORD *a2, __int16 *a3)
{
  size_t v5 = result;
  unsigned int v6 = *(_DWORD *)(result + 8);
  if (v6 == *(_DWORD *)(result + 12))
  {
    size_t result = skit::SmallVector<skit::internal::FieldSpanMatcherImpl::MapToken,128u,true>::_reserve_more(result, v6 + (v6 >> 1) + 1);
    unsigned int v6 = *(_DWORD *)(v5 + 8);
  }
  uint64_t v7 = (_WORD *)(*(void *)v5 + 4 * v6);
  __int16 v8 = *a3;
  _WORD *v7 = *a2;
  v7[1] = v8;
  *(_DWORD *)(v5 + 8) = v6 + 1;
  return result;
}

void skit::internal::FieldSpanMatcherImpl::combine_alias_matches(uint64_t a1, uint64_t a2, uint64_t *a3, int a4, uint64_t a5, uint64_t *a6)
{
  if (!a4) {
    skit::Alias::match((uint64_t *)(a1 + 640), a5, a3);
  }
  unsigned int v9 = *(_DWORD *)(a5 + 8);
  unsigned int v10 = *((_DWORD *)a6 + 2) + v9;
  if (v10)
  {
    if (*(_DWORD *)(a2 + 12) < v10)
    {
      skit::SmallVector<skit::AliasMatch const*,8u,false>::_reserve_more(a2, v10);
      unsigned int v9 = *(_DWORD *)(a5 + 8);
    }
    if (v9)
    {
      uint64_t v11 = *(void *)a5;
      uint64_t v12 = v9;
      unsigned int v13 = *(_DWORD *)(a2 + 8);
      uint64_t v14 = 40 * v12;
      do
      {
        if (v13 == *(_DWORD *)(a2 + 12))
        {
          skit::SmallVector<skit::AliasMatch const*,8u,false>::_reserve_more(a2, v13 + (v13 >> 1) + 1);
          unsigned int v13 = *(_DWORD *)(a2 + 8);
        }
        *(void *)(*(void *)a2 + 8 * v13++) = v11;
        *(_DWORD *)(a2 + 8) = v13;
        v11 += 40;
        v14 -= 40;
      }
      while (v14);
    }
    uint64_t v15 = *((unsigned int *)a6 + 2);
    unsigned int v16 = *(_DWORD *)(a2 + 8);
    if (v15)
    {
      uint64_t v17 = *a6;
      uint64_t v18 = 40 * v15;
      do
      {
        if (v16 == *(_DWORD *)(a2 + 12))
        {
          skit::SmallVector<skit::AliasMatch const*,8u,false>::_reserve_more(a2, v16 + (v16 >> 1) + 1);
          unsigned int v16 = *(_DWORD *)(a2 + 8);
        }
        *(void *)(*(void *)a2 + 8 * v16++) = v17;
        *(_DWORD *)(a2 + 8) = v16;
        v17 += 40;
        v18 -= 40;
      }
      while (v18);
    }
    unint64_t v19 = *(void *)a2;
    unsigned int v20 = (uint64_t *)(*(void *)a2 + 8 * v16);
    unint64_t v21 = 126 - 2 * __clz(v16);
    if (v16) {
      uint64_t v22 = v21;
    }
    else {
      uint64_t v22 = 0;
    }
  }
}

size_t skit::SmallVector<skit::AliasMatch const*,8u,false>::_reserve_more(uint64_t a1, unsigned int a2)
{
  std::basic_string<char16_t>::size_type v3 = malloc_type_malloc(8 * a2, 0x6004044C4A2DFuLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v12 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v12, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  std::basic_string<char16_t>::size_type v4 = v3;
  size_t v5 = *(uint64_t **)a1;
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  if (v6)
  {
    uint64_t v7 = 8 * v6;
    __int16 v8 = v4;
    do
    {
      uint64_t v9 = *v5++;
      *v8++ = v9;
      v7 -= 8;
    }
    while (v7);
    size_t v5 = *(uint64_t **)a1;
  }
  if (v5 != (uint64_t *)(a1 + 16)) {
    free(v5);
  }
  *(void *)a1 = v4;
  size_t result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result >> 3;
  return result;
}

unint64_t std::__introsort<std::_ClassicAlgPolicy,skit::internal::anonymous namespace'::AliasMatchLess &,skit::AliasMatch const**,false>(unint64_t result, uint64_t *a2, uint64_t a3, char a4)
{
  uint64_t v9 = (uint64_t *)result;
LABEL_2:
  unsigned int v10 = a2 - 1;
  uint64_t j = v9;
  while (1)
  {
    uint64_t v9 = j;
    uint64_t v12 = (char *)a2 - (char *)j;
    unint64_t v13 = a2 - j;
    if (v5 || !v4)
    {
      switch(v13)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          uint64_t v54 = *v10;
          uint64_t v55 = *j;
          unsigned int v56 = *(_DWORD *)(*v10 + 24);
          unsigned int v57 = *(_DWORD *)(*j + 24);
          if (v56 < v57 || v56 <= v57 && *(_DWORD *)(v54 + 28) > *(_DWORD *)(v55 + 28))
          {
            *uint64_t j = v54;
            uint64_t *v10 = v55;
          }
          break;
        case 3uLL:
          break;
        case 4uLL:
          break;
        case 5uLL:
          v58 = j + 1;
          long long v59 = j + 2;
          long long v60 = j + 3;
          uint64_t v61 = *v10;
          uint64_t v62 = j[3];
          unsigned int v63 = *(_DWORD *)(*v10 + 24);
          unsigned int v64 = *(_DWORD *)(v62 + 24);
          if (v63 < v64 || v63 <= v64 && *(_DWORD *)(v61 + 28) > *(_DWORD *)(v62 + 28))
          {
            *long long v60 = v61;
            uint64_t *v10 = v62;
            uint64_t v65 = *v60;
            uint64_t v66 = *v59;
            unsigned int v67 = *(_DWORD *)(*v60 + 24);
            unsigned int v68 = *(_DWORD *)(*v59 + 24);
            if (v67 < v68 || v67 <= v68 && *(_DWORD *)(v65 + 28) > *(_DWORD *)(v66 + 28))
            {
              *long long v59 = v65;
              *long long v60 = v66;
              uint64_t v69 = *v58;
              unsigned int v70 = *(_DWORD *)(*v58 + 24);
              if (v67 < v70 || v67 <= v70 && *(_DWORD *)(v65 + 28) > *(_DWORD *)(v69 + 28))
              {
                j[1] = v65;
                j[2] = v69;
                uint64_t v71 = *j;
                unsigned int v72 = *(_DWORD *)(*j + 24);
                if (v67 < v72 || v67 <= v72 && *(_DWORD *)(v65 + 28) > *(_DWORD *)(v71 + 28))
                {
                  *uint64_t j = v65;
                  j[1] = v71;
                }
              }
            }
          }
          break;
        default:
          JUMPOUT(0);
      }
      return result;
    }
    if (v12 <= 191)
    {
      v73 = j + 1;
      BOOL v75 = j == a2 || v73 == a2;
      if (a4)
      {
        if (!v75)
        {
          uint64_t v76 = 0;
          uint64_t v77 = j;
          do
          {
            v78 = v77;
            uint64_t v77 = v73;
            uint64_t v80 = *v78;
            uint64_t v79 = v78[1];
            unsigned int v81 = *(_DWORD *)(v79 + 24);
            unsigned int v82 = *(_DWORD *)(*v78 + 24);
            if (v81 < v82 || v81 <= v82 && *(_DWORD *)(v79 + 28) > *(_DWORD *)(v80 + 28))
            {
              v78[1] = v80;
              uint64_t v83 = j;
              if (v78 != j)
              {
                uint64_t v84 = v76;
                while (1)
                {
                  uint64_t v85 = *(uint64_t *)((char *)j + v84 - 8);
                  unsigned int v86 = *(_DWORD *)(v85 + 24);
                  if (v81 >= v86)
                  {
                    if (v81 > v86)
                    {
                      uint64_t v83 = (uint64_t *)((char *)j + v84);
                      goto LABEL_126;
                    }
                    if (*(_DWORD *)(v79 + 28) <= *(_DWORD *)(v85 + 28)) {
                      break;
                    }
                  }
                  --v78;
                  *(uint64_t *)((char *)j + v84) = v85;
                  v84 -= 8;
                  if (!v84)
                  {
                    uint64_t v83 = j;
                    goto LABEL_126;
                  }
                }
                uint64_t v83 = v78;
              }
LABEL_126:
              *uint64_t v83 = v79;
            }
            v73 = v77 + 1;
            v76 += 8;
          }
          while (v77 + 1 != a2);
        }
      }
      else if (!v75)
      {
        do
        {
          uint64_t v125 = v9;
          uint64_t v9 = v73;
          uint64_t v127 = *v125;
          uint64_t v126 = v125[1];
          unsigned int v128 = *(_DWORD *)(v126 + 24);
          unsigned int v129 = *(_DWORD *)(*v125 + 24);
          if (v128 < v129 || v128 <= v129 && *(_DWORD *)(v126 + 28) > *(_DWORD *)(v127 + 28))
          {
            do
            {
              do
              {
                unsigned int v130 = v125;
                uint64_t v131 = *--v125;
                v125[2] = v127;
                uint64_t v127 = v131;
                unsigned int v132 = *(_DWORD *)(v131 + 24);
              }
              while (v128 < v132);
            }
            while (v128 <= v132 && *(_DWORD *)(v126 + 28) > *(_DWORD *)(v127 + 28));
            *unsigned int v130 = v126;
          }
          v73 = v9 + 1;
        }
        while (v9 + 1 != a2);
      }
      return result;
    }
    if (!a3) {
      break;
    }
    unint64_t v14 = v13 >> 1;
    uint64_t v15 = &j[v13 >> 1];
    if ((unint64_t)v12 >= 0x401)
    {
      uint64_t v16 = *v9;
      *uint64_t v9 = *v15;
      *uint64_t v15 = v16;
    }
    else
    {
    }
    --a3;
    uint64_t v17 = *v9;
    if (a4)
    {
      unsigned int v18 = *(_DWORD *)(v17 + 24);
LABEL_15:
      for (uint64_t i = v9 + 1; ; ++i)
      {
        uint64_t v22 = *i;
        unsigned int v23 = *(_DWORD *)(*i + 24);
        if (v23 >= v18 && (v23 > v18 || *(_DWORD *)(v22 + 28) <= *(_DWORD *)(v17 + 28))) {
          break;
        }
      }
      unsigned int v24 = i - 1;
      if (i - 1 == v9)
      {
        int v27 = a2;
        if (i < a2)
        {
          uint64_t v29 = *v10;
          unsigned int v30 = *(_DWORD *)(*v10 + 24);
          int v27 = a2 - 1;
          if (v30 >= v18)
          {
            int v27 = a2 - 1;
            do
            {
              if (v30 <= v18)
              {
                if (i >= v27 || *(_DWORD *)(v29 + 28) > *(_DWORD *)(v17 + 28)) {
                  break;
                }
              }
              else if (i >= v27)
              {
                break;
              }
              uint64_t v31 = *--v27;
              uint64_t v29 = v31;
              unsigned int v30 = *(_DWORD *)(v31 + 24);
            }
            while (v30 >= v18);
          }
        }
      }
      else
      {
        uint64_t v25 = *v10;
        unsigned int v26 = *(_DWORD *)(*v10 + 24);
        int v27 = a2 - 1;
        if (v26 >= v18)
        {
          int v27 = a2 - 1;
          do
          {
            if (v26 <= v18 && *(_DWORD *)(v25 + 28) > *(_DWORD *)(v17 + 28)) {
              break;
            }
            uint64_t v28 = *--v27;
            uint64_t v25 = v28;
            unsigned int v26 = *(_DWORD *)(v28 + 24);
          }
          while (v26 >= v18);
        }
      }
      if (i < v27)
      {
        uint64_t v32 = *v27;
        unint64_t v33 = (unint64_t)i;
        uint64_t v34 = v27;
        do
        {
          *(void *)unint64_t v33 = v32;
          v33 += 8;
          *uint64_t v34 = v22;
          while (1)
          {
            uint64_t v22 = *(void *)v33;
            unsigned int v35 = *(_DWORD *)(*(void *)v33 + 24);
            if (v35 >= v18 && (v35 > v18 || *(_DWORD *)(v22 + 28) <= *(_DWORD *)(v17 + 28))) {
              break;
            }
            v33 += 8;
          }
          unsigned int v24 = (uint64_t *)(v33 - 8);
          do
          {
            uint64_t v36 = *--v34;
            uint64_t v32 = v36;
            unsigned int v37 = *(_DWORD *)(v36 + 24);
          }
          while (v37 >= v18 && (v37 > v18 || *(_DWORD *)(v32 + 28) <= *(_DWORD *)(v17 + 28)));
        }
        while (v33 < (unint64_t)v34);
      }
      if (v24 != v9) {
        *uint64_t v9 = *v24;
      }
      uint64_t *v24 = v17;
      if (i < v27) {
        goto LABEL_53;
      }
      uint64_t j = v24 + 1;
      if (result)
      {
        a2 = v24;
        if (v38) {
          return result;
        }
        goto LABEL_2;
      }
      if (!v38)
      {
LABEL_53:
        a4 = 0;
        uint64_t j = v24 + 1;
      }
    }
    else
    {
      uint64_t v19 = *(v9 - 1);
      unsigned int v20 = *(_DWORD *)(v19 + 24);
      unsigned int v18 = *(_DWORD *)(v17 + 24);
      if (v20 < v18 || v20 <= v18 && *(_DWORD *)(v19 + 28) > *(_DWORD *)(v17 + 28)) {
        goto LABEL_15;
      }
      uint64_t v39 = *v10;
      unsigned int v40 = *(_DWORD *)(*v10 + 24);
      if (v18 >= v40 && (v18 > v40 || *(_DWORD *)(v17 + 28) <= *(_DWORD *)(v39 + 28)))
      {
        for (uint64_t j = v9 + 1; j < a2; ++j)
        {
          unsigned int v53 = *(_DWORD *)(*j + 24);
          if (v18 < v53 || v18 <= v53 && *(_DWORD *)(v17 + 28) > *(_DWORD *)(*j + 28)) {
            break;
          }
        }
      }
      else
      {
        uint64_t j = v9;
        do
        {
          uint64_t v42 = j[1];
          ++j;
          uint64_t v41 = v42;
          unsigned int v43 = *(_DWORD *)(v42 + 24);
        }
        while (v18 >= v43 && (v18 > v43 || *(_DWORD *)(v17 + 28) <= *(_DWORD *)(v41 + 28)));
      }
      v44 = a2;
      if (j < a2)
      {
        v44 = a2 - 1;
        while (v18 < v40 || v18 <= v40 && *(_DWORD *)(v17 + 28) > *(_DWORD *)(v39 + 28))
        {
          uint64_t v45 = *--v44;
          uint64_t v39 = v45;
          unsigned int v40 = *(_DWORD *)(v45 + 24);
        }
      }
      if (j < v44)
      {
        uint64_t v46 = *j;
        uint64_t v47 = *v44;
        do
        {
          *uint64_t j = v47;
          uint64_t *v44 = v46;
          do
          {
            uint64_t v48 = j[1];
            ++j;
            uint64_t v46 = v48;
            unsigned int v49 = *(_DWORD *)(v48 + 24);
          }
          while (v18 >= v49 && (v18 > v49 || *(_DWORD *)(v17 + 28) <= *(_DWORD *)(v46 + 28)));
          do
          {
            do
            {
              uint64_t v50 = *--v44;
              uint64_t v47 = v50;
              unsigned int v51 = *(_DWORD *)(v50 + 24);
            }
            while (v18 < v51);
          }
          while (v18 <= v51 && *(_DWORD *)(v17 + 28) > *(_DWORD *)(v47 + 28));
        }
        while (j < v44);
      }
      unsigned int v52 = j - 1;
      BOOL v4 = j - 1 >= v9;
      BOOL v5 = j - 1 == v9;
      if (j - 1 != v9) {
        *uint64_t v9 = *v52;
      }
      a4 = 0;
      *unsigned int v52 = v17;
    }
  }
  if (j != a2)
  {
    int64_t v87 = (v13 - 2) >> 1;
    int64_t v88 = v87;
    do
    {
      int64_t v89 = v88;
      if (v87 >= v88)
      {
        uint64_t v90 = (2 * v88) | 1;
        uint64_t v91 = &j[v90];
        if (2 * v89 + 2 < (uint64_t)v13)
        {
          uint64_t v92 = v91[1];
          size_t result = *(unsigned int *)(*v91 + 24);
          unsigned int v93 = *(_DWORD *)(v92 + 24);
          if (result < v93
            || result <= v93 && *(_DWORD *)(*v91 + 28) > *(_DWORD *)(v92 + 28))
          {
            ++v91;
            uint64_t v90 = 2 * v89 + 2;
          }
        }
        uint64_t v94 = *v91;
        uint64_t v95 = j[v89];
        unsigned int v96 = *(_DWORD *)(*v91 + 24);
        unsigned int v97 = *(_DWORD *)(v95 + 24);
        if (v96 >= v97)
        {
          if (v96 > v97 || (size_t result = *(unsigned int *)(v95 + 28), *(_DWORD *)(v94 + 28) <= result))
          {
            j[v89] = v94;
            if (v87 >= v90)
            {
              while (1)
              {
                uint64_t v99 = 2 * v90;
                uint64_t v90 = (2 * v90) | 1;
                unsigned int v98 = &j[v90];
                uint64_t v100 = v99 + 2;
                if (v100 < (uint64_t)v13)
                {
                  uint64_t v101 = v98[1];
                  unsigned int v102 = *(_DWORD *)(*v98 + 24);
                  unsigned int v103 = *(_DWORD *)(v101 + 24);
                  if (v102 < v103 || v102 <= v103 && *(_DWORD *)(*v98 + 28) > *(_DWORD *)(v101 + 28))
                  {
                    ++v98;
                    uint64_t v90 = v100;
                  }
                }
                uint64_t v104 = *v98;
                size_t result = *(unsigned int *)(*v98 + 24);
                if (result < v97) {
                  break;
                }
                if (result <= v97)
                {
                  size_t result = *(unsigned int *)(v104 + 28);
                  if (result > *(_DWORD *)(v95 + 28)) {
                    break;
                  }
                }
                *uint64_t v91 = v104;
                uint64_t v91 = v98;
                if (v87 < v90) {
                  goto LABEL_142;
                }
              }
            }
            unsigned int v98 = v91;
LABEL_142:
            *unsigned int v98 = v95;
          }
        }
      }
      int64_t v88 = v89 - 1;
    }
    while (v89);
    uint64_t v105 = (unint64_t)v12 >> 3;
    while (2)
    {
      uint64_t v106 = 0;
      uint64_t v107 = *j;
      uint64_t v108 = j;
      do
      {
        unsigned int v109 = v108;
        v108 += v106 + 1;
        uint64_t v110 = 2 * v106;
        uint64_t v106 = (2 * v106) | 1;
        uint64_t v111 = v110 + 2;
        if (v111 < v105)
        {
          uint64_t v112 = v108[1];
          size_t result = *(unsigned int *)(*v108 + 24);
          unsigned int v113 = *(_DWORD *)(v112 + 24);
          if (result < v113
            || result <= v113 && *(_DWORD *)(*v108 + 28) > *(_DWORD *)(v112 + 28))
          {
            ++v108;
            uint64_t v106 = v111;
          }
        }
        *unsigned int v109 = *v108;
      }
      while (v106 <= (uint64_t)((unint64_t)(v105 - 2) >> 1));
      if (v108 == --a2)
      {
LABEL_173:
        *uint64_t v108 = v107;
      }
      else
      {
        *uint64_t v108 = *a2;
        *a2 = v107;
        uint64_t v114 = (char *)v108 - (char *)j + 8;
        if (v114 >= 9)
        {
          unint64_t v115 = ((unint64_t)v114 >> 3) - 2;
          unint64_t v116 = v115 >> 1;
          uint64_t v117 = &j[v115 >> 1];
          uint64_t v118 = *v117;
          uint64_t v107 = *v108;
          unsigned int v119 = *(_DWORD *)(*v117 + 24);
          unsigned int v120 = *(_DWORD *)(*v108 + 24);
          if (v119 < v120 || v119 <= v120 && *(_DWORD *)(v118 + 28) > *(_DWORD *)(v107 + 28))
          {
            *uint64_t v108 = v118;
            if (v115 >= 2)
            {
              while (1)
              {
                unint64_t v121 = v116 - 1;
                unint64_t v116 = (v116 - 1) >> 1;
                uint64_t v108 = &j[v116];
                uint64_t v122 = *v108;
                unsigned int v123 = *(_DWORD *)(*v108 + 24);
                if (v123 >= v120 && (v123 > v120 || *(_DWORD *)(v122 + 28) <= *(_DWORD *)(v107 + 28))) {
                  break;
                }
                *uint64_t v117 = v122;
                uint64_t v117 = &j[v116];
                if (v121 <= 1) {
                  goto LABEL_173;
                }
              }
            }
            uint64_t v108 = v117;
            goto LABEL_173;
          }
        }
      }
      if (v105-- <= 2) {
        return result;
      }
      continue;
    }
  }
  return result;
}

uint64_t *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::internal::anonymous namespace'::AliasMatchLess &,skit::AliasMatch const**>(uint64_t *result, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *result;
  unsigned int v5 = *(_DWORD *)(*a2 + 24);
  unsigned int v6 = *(_DWORD *)(*result + 24);
  if (v5 >= v6 && (v5 > v6 || *(_DWORD *)(v3 + 28) <= *(_DWORD *)(v4 + 28)))
  {
    uint64_t v9 = *a3;
    unsigned int v10 = *(_DWORD *)(*a3 + 24);
    if (v10 < v5 || v10 <= v5 && *(_DWORD *)(v9 + 28) > *(_DWORD *)(v3 + 28))
    {
      *a2 = v9;
      *a3 = v3;
      uint64_t v11 = *a2;
      uint64_t v12 = *result;
      unsigned int v13 = *(_DWORD *)(*a2 + 24);
      unsigned int v14 = *(_DWORD *)(*result + 24);
      if (v13 < v14 || v13 <= v14 && *(_DWORD *)(v11 + 28) > *(_DWORD *)(v12 + 28))
      {
        std::logic_error *result = v11;
        *a2 = v12;
      }
    }
  }
  else
  {
    uint64_t v7 = *a3;
    unsigned int v8 = *(_DWORD *)(*a3 + 24);
    if (v8 < v5 || v8 <= v5 && *(_DWORD *)(v7 + 28) > *(_DWORD *)(v3 + 28))
    {
      std::logic_error *result = v7;
LABEL_17:
      *a3 = v4;
      return result;
    }
    std::logic_error *result = v3;
    *a2 = v4;
    uint64_t v15 = *a3;
    unsigned int v16 = *(_DWORD *)(*a3 + 24);
    if (v16 < v6 || v16 <= v6 && *(_DWORD *)(v15 + 28) > *(_DWORD *)(v4 + 28))
    {
      *a2 = v15;
      goto LABEL_17;
    }
  }
  return result;
}

uint64_t *std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::internal::anonymous namespace'::AliasMatchLess &,skit::AliasMatch const**>(uint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v9 = *a4;
  uint64_t v10 = *a3;
  unsigned int v11 = *(_DWORD *)(*a4 + 24);
  unsigned int v12 = *(_DWORD *)(*a3 + 24);
  if (v11 < v12 || v11 <= v12 && *(_DWORD *)(v9 + 28) > *(_DWORD *)(v10 + 28))
  {
    *a3 = v9;
    *a4 = v10;
    uint64_t v13 = *a3;
    uint64_t v14 = *a2;
    unsigned int v15 = *(_DWORD *)(*a3 + 24);
    unsigned int v16 = *(_DWORD *)(*a2 + 24);
    if (v15 < v16 || v15 <= v16 && *(_DWORD *)(v13 + 28) > *(_DWORD *)(v14 + 28))
    {
      *a2 = v13;
      *a3 = v14;
      uint64_t v17 = *a2;
      uint64_t v18 = *a1;
      unsigned int v19 = *(_DWORD *)(*a2 + 24);
      unsigned int v20 = *(_DWORD *)(*a1 + 24);
      if (v19 < v20 || v19 <= v20 && *(_DWORD *)(v17 + 28) > *(_DWORD *)(v18 + 28))
      {
        *a1 = v17;
        *a2 = v18;
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,skit::internal::anonymous namespace'::AliasMatchLess &,skit::AliasMatch const**>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = a2 - a1;
  BOOL result = 1;
  switch(v4)
  {
    case 0:
    case 1:
      return result;
    case 2:
      uint64_t v6 = *(a2 - 1);
      uint64_t v7 = *a1;
      unsigned int v8 = *(_DWORD *)(v6 + 24);
      unsigned int v9 = *(_DWORD *)(*a1 + 24);
      if (v8 < v9 || v8 <= v9 && *(_DWORD *)(v6 + 28) > *(_DWORD *)(v7 + 28))
      {
        *a1 = v6;
        *(a2 - 1) = v7;
      }
      return result;
    case 3:
      return 1;
    case 4:
      return 1;
    case 5:
      uint64_t v22 = a1 + 1;
      unsigned int v23 = a1 + 2;
      unsigned int v24 = a1 + 3;
      uint64_t v25 = *(a2 - 1);
      uint64_t v26 = a1[3];
      unsigned int v27 = *(_DWORD *)(v25 + 24);
      unsigned int v28 = *(_DWORD *)(v26 + 24);
      if (v27 < v28 || v27 <= v28 && *(_DWORD *)(v25 + 28) > *(_DWORD *)(v26 + 28))
      {
        uint64_t *v24 = v25;
        *(a2 - 1) = v26;
        uint64_t v29 = *v24;
        uint64_t v30 = *v23;
        unsigned int v31 = *(_DWORD *)(*v24 + 24);
        unsigned int v32 = *(_DWORD *)(*v23 + 24);
        if (v31 < v32 || v31 <= v32 && *(_DWORD *)(v29 + 28) > *(_DWORD *)(v30 + 28))
        {
          uint64_t *v23 = v29;
          uint64_t *v24 = v30;
          uint64_t v33 = *v22;
          unsigned int v34 = *(_DWORD *)(*v22 + 24);
          if (v31 < v34 || v31 <= v34 && *(_DWORD *)(v29 + 28) > *(_DWORD *)(v33 + 28))
          {
            a1[1] = v29;
            a1[2] = v33;
            uint64_t v35 = *a1;
            unsigned int v36 = *(_DWORD *)(*a1 + 24);
            if (v31 < v36 || v31 <= v36 && *(_DWORD *)(v29 + 28) > *(_DWORD *)(v35 + 28))
            {
              *a1 = v29;
              a1[1] = v35;
            }
          }
        }
      }
      return 1;
    default:
      uint64_t v10 = a1 + 2;
      unsigned int v11 = a1 + 3;
      if (a1 + 3 == a2) {
        return 1;
      }
      uint64_t v12 = 0;
      int v13 = 0;
      break;
  }
  while (1)
  {
    uint64_t v14 = *v11;
    uint64_t v15 = *v10;
    unsigned int v16 = *(_DWORD *)(*v11 + 24);
    unsigned int v17 = *(_DWORD *)(*v10 + 24);
    if (v16 < v17 || v16 <= v17 && *(_DWORD *)(v14 + 28) > *(_DWORD *)(v15 + 28))
    {
      uint64_t *v11 = v15;
      uint64_t v18 = a1;
      if (v10 != a1)
      {
        uint64_t v19 = v12;
        while (1)
        {
          uint64_t v20 = *(uint64_t *)((char *)a1 + v19 + 8);
          unsigned int v21 = *(_DWORD *)(v20 + 24);
          if (v16 >= v21)
          {
            if (v16 > v21)
            {
              uint64_t v18 = v10;
              goto LABEL_18;
            }
            if (*(_DWORD *)(v14 + 28) <= *(_DWORD *)(v20 + 28)) {
              break;
            }
          }
          --v10;
          *(uint64_t *)((char *)a1 + v19 + 16) = v20;
          v19 -= 8;
          if (v19 == -16)
          {
            uint64_t v18 = a1;
            goto LABEL_18;
          }
        }
        uint64_t v18 = (uint64_t *)((char *)a1 + v19 + 16);
      }
LABEL_18:
      *uint64_t v18 = v14;
      if (++v13 == 8) {
        return v11 + 1 == a2;
      }
    }
    uint64_t v10 = v11;
    v12 += 8;
    if (++v11 == a2) {
      return 1;
    }
  }
}

uint64_t skit::internal::FieldSpanMatcherImpl::alias_span_matcher(uint64_t a1, void *a2, char a3, uint64_t a4, uint64_t *a5, int a6)
{
  v31[8] = *MEMORY[0x1E4F143B8];
  if (*a2 && *(unsigned char *)(*a2 + 64))
  {
    long long v11 = *(_OWORD *)a2;
    *a2 = 0;
    a2[1] = 0;
    uint64_t v12 = *(std::__shared_weak_count **)(a1 + 648);
    *(_OWORD *)(a1 + 640) = v11;
    if (v12) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    skit::SmallVector<skit::AliasMatch,2u,true>::_destroy(*(void *)(a1 + 656), *(_DWORD *)(a1 + 664));
    *(_DWORD *)(a1 + 664) = 0;
    uint64_t v29 = v31;
    uint64_t v30 = 0x800000000;
    *(void *)buf = &v28;
    uint64_t v27 = 0x200000000;
    skit::internal::FieldSpanMatcherImpl::combine_alias_matches(a1, (uint64_t)&v29, (uint64_t *)a1, a6, (uint64_t)buf, a5);
    int v13 = (uint64_t *)(a1 + 656);
    unsigned int v14 = v30;
    if (*(_DWORD *)(a1 + 668) < v30)
    {
      skit::SmallVector<skit::AliasMatch,2u,true>::_reserve_more((long long **)(a1 + 656), v30);
      unsigned int v14 = v30;
    }
    if (v14)
    {
      uint64_t v15 = (long long **)v29;
      unsigned int v16 = *(_DWORD *)(a1 + 664);
      uint64_t v17 = 8 * v14;
      do
      {
        uint64_t v18 = *v15;
        if (v16 == *(_DWORD *)(a1 + 668))
        {
          skit::SmallVector<skit::AliasMatch,2u,true>::_reserve_more((long long **)(a1 + 656), v16 + (v16 >> 1) + 1);
          unsigned int v16 = *(_DWORD *)(a1 + 664);
        }
        uint64_t v19 = *v13;
        uint64_t v20 = (std::basic_string<char16_t> *)(*v13 + 40 * v16);
        if (*((char *)v18 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(v20, *(const std::basic_string<char16_t>::value_type **)v18, *((void *)v18 + 1));
        }
        else
        {
          long long v21 = *v18;
          v20->__r_.__value_.__r.__words[2] = *((void *)v18 + 2);
          *(_OWORD *)&v20->__r_.__value_.__l.__data_ = v21;
        }
        uint64_t v22 = v19 + 40 * v16;
        uint64_t v23 = *((void *)v18 + 3);
        *(_WORD *)(v22 + 32) = *((_WORD *)v18 + 16);
        *(void *)(v22 + 24) = v23;
        unsigned int v16 = *(_DWORD *)(a1 + 664) + 1;
        *(_DWORD *)(a1 + 664) = v16;
        ++v15;
        v17 -= 8;
      }
      while (v17);
    }
    skit::internal::FieldSpanMatcherImpl::alias_filters((uint64_t *)a1, a3, a4);
    skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)buf);
    if (v29 != v31) {
      free(v29);
    }
    return 0;
  }
  else
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v25 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D2EDA000, v25, OS_LOG_TYPE_ERROR, "FieldSpanMatcherImpl::alias_span_matcher : Alias span matcher is not initialized", buf, 2u);
    }
    return 0xFFFFFFFFLL;
  }
}

void sub_1D2EE46B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (a23 != a10) {
    free(a23);
  }
  _Unwind_Resume(a1);
}

void skit::internal::FieldSpanMatcherImpl::alias_filters(uint64_t *a1, char a2, uint64_t a3)
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  *((unsigned char *)a1 + 608) = a2;
  if (a1 + 77 != (uint64_t *)a3)
  {
    uint64_t v4 = *(char **)a3;
    uint64_t v5 = *(unsigned int *)(a3 + 8);
    if (*((_DWORD *)a1 + 157) >= v5)
    {
      if (v5)
      {
        uint64_t v12 = (unsigned char *)a1[77];
        uint64_t v13 = *(unsigned int *)(a3 + 8);
        do
        {
          char v14 = *v4++;
          *v12++ = v14;
          --v13;
        }
        while (v13);
      }
    }
    else
    {
      int v6 = *((_DWORD *)a1 + 156) + (*((_DWORD *)a1 + 156) >> 1);
      if (v6 + 1 > v5) {
        size_t v7 = (v6 + 1);
      }
      else {
        size_t v7 = v5;
      }
      unsigned int v8 = malloc_type_malloc(v7, 0x100004077774924uLL);
      if (!v8)
      {
        exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
        uint64_t v54 = std::bad_alloc::bad_alloc(exception);
        __cxa_throw(v54, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
      }
      unsigned int v9 = v8;
      uint64_t v10 = 0;
      do
      {
        *((unsigned char *)v8 + v10) = v4[v10];
        ++v10;
      }
      while (v5 != v10);
      long long v11 = (uint64_t *)a1[77];
      if (v11 != a1 + 79) {
        free(v11);
      }
      a1[77] = (uint64_t)v9;
      *((_DWORD *)a1 + 157) = malloc_size(v9);
    }
    *((_DWORD *)a1 + 156) = v5;
  }
  unsigned int v15 = *((_DWORD *)a1 + 190);
  if (v15)
  {
    uint64_t v16 = a1[94];
    uint64_t v17 = 104 * v15;
    do
    {
      uint64_t v16 = skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl(v16) + 104;
      v17 -= 104;
    }
    while (v17);
  }
  unsigned int v56 = (char **)(a1 + 94);
  *((_DWORD *)a1 + 190) = 0;
  unsigned int v18 = *((_DWORD *)a1 + 166);
  if (*((_DWORD *)a1 + 191) < v18) {
    skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::_reserve_more(v56, v18);
  }
  skit::SmallVector<skit::AliasSpanMatch,4u,true>::_destroy(a1[148], *((_DWORD *)a1 + 298));
  *((_DWORD *)a1 + 298) = 0;
  unsigned int v19 = *((_DWORD *)a1 + 166);
  uint64_t v55 = (long long **)(a1 + 148);
  if (*((_DWORD *)a1 + 299) < v19)
  {
    skit::SmallVector<skit::AliasSpanMatch,4u,true>::_reserve_more((long long **)a1 + 148, v19);
    unsigned int v19 = *((_DWORD *)a1 + 166);
  }
  if (v19)
  {
    uint64_t v20 = (long long *)a1[82];
    long long v21 = (long long *)((char *)v20 + 40 * v19);
    do
    {
      if (skit::internal::AliasFilter::select_by_group_id((unsigned __int8 *)a1 + 608, *((unsigned char *)v20 + 32), *((unsigned char *)v20 + 33)))
      {
        uint64_t v23 = (void *)v20 + 3;
        uint64_t v22 = *((unsigned int *)v20 + 6);
        uint64_t v24 = *a1;
        uint64_t v25 = *((unsigned int *)v20 + 7);
        *(_DWORD *)long long v60 = *(_DWORD *)(*a1 + 48 * v22 + 24);
        *(_DWORD *)&v60[4] = *(_DWORD *)(*a1 + 48 * (v25 - 1) + 28);
        *(_DWORD *)&v60[8] = 0;
        *(void *)&v60[16] = 0;
        *(_DWORD *)&v60[24] = 0;
        uint64_t v61 = &v63;
        uint64_t v62 = 0x400000000;
        int v64 = 0;
        if (v22 >= v25)
        {
          int v27 = 0;
          int v26 = 0;
          float v30 = 0.0;
        }
        else
        {
          int v26 = 0;
          int v27 = 0;
          uint64_t v28 = v25 - v22;
          uint64_t v29 = v24 + 48 * v22 + 40;
          float v30 = 0.0;
          unsigned int v31 = (unsigned __int16 *)v29;
          do
          {
            unsigned int v32 = *v31;
            v31 += 24;
            int v33 = v27 + ((v32 >> 2) & 1);
            if ((v32 & 2) != 0)
            {
              int v27 = v33;
              ++v26;
            }
            float v30 = v30
                + (float)(*(float *)(v29 - 8) * (float)(*(_DWORD *)(v29 - 12) - *(_DWORD *)(v29 - 16)));
            uint64_t v29 = (uint64_t)v31;
            --v28;
          }
          while (v28);
        }
        *(float *)&v60[12] = v30 * 0.85;
        *(_DWORD *)&v60[16] = v26;
        skit::SpanMatchV3::append_alias_id((size_t)v60, *((_WORD *)v20 + 16), v26);
        *(_DWORD *)&v60[20] = v27;
        unsigned int v34 = *((_DWORD *)a1 + 298);
        if (v34 == *((_DWORD *)a1 + 299))
        {
          skit::SmallVector<skit::AliasSpanMatch,4u,true>::_reserve_more(v55, v34 + (v34 >> 1) + 1);
          unsigned int v34 = *((_DWORD *)a1 + 298);
        }
        uint64_t v35 = *v55;
        if (*((char *)v20 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)v65, *(const std::basic_string<char16_t>::value_type **)v20, *((void *)v20 + 1));
        }
        else
        {
          *(_OWORD *)uint64_t v65 = *v20;
          *(void *)&v65[16] = *((void *)v20 + 2);
        }
        *(void *)&v65[24] = *v23;
        uint64_t v36 = *(void *)&v65[24];
        LOWORD(v66) = *((_WORD *)v20 + 16);
        __int16 v37 = (__int16)v66;
        uint64_t v38 = *(void *)v60;
        int v39 = *(_DWORD *)&v60[8];
        int v40 = *(_DWORD *)&v60[12];
        uint64_t v41 = *(void *)&v60[16];
        unsigned int v42 = *(_DWORD *)&v60[24];
        unsigned int v43 = (char *)v35 + 72 * v34;
        *(_OWORD *)unsigned int v43 = *(_OWORD *)v65;
        *((void *)v43 + 2) = *(void *)&v65[16];
        *((void *)v43 + 3) = v36;
        *((_WORD *)v43 + 16) = v37;
        *((void *)v43 + 5) = v38;
        *((_DWORD *)v43 + 12) = v39;
        *((_DWORD *)v43 + 13) = v40;
        *((void *)v43 + 7) = v41;
        *((void *)v43 + 8) = v42;
        ++*((_DWORD *)a1 + 298);
        unsigned int v44 = *((_DWORD *)a1 + 190);
        if (v44 == *((_DWORD *)a1 + 191)) {
          skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::_reserve_more(v56, v44 + (v44 >> 1) + 1);
        }
        if (*((char *)v20 + 23) < 0)
        {
          std::basic_string<char16_t>::__init_copy_ctor_external(&v57, *(const std::basic_string<char16_t>::value_type **)v20, *((void *)v20 + 1));
        }
        else
        {
          long long v45 = *v20;
          v57.__r_.__value_.__r.__words[2] = *((void *)v20 + 2);
          *(_OWORD *)&v57.__r_.__value_.__l.__data_ = v45;
        }
        uint64_t v46 = *v23;
        __int16 v59 = *((_WORD *)v20 + 16);
        uint64_t v58 = v46;
        *(_OWORD *)uint64_t v65 = *(_OWORD *)v60;
        *(_OWORD *)&v65[12] = *(_OWORD *)&v60[12];
        if (v61 == &v63)
        {
          uint64_t v66 = v69;
          int v47 = v62;
          if (v62)
          {
            uint64_t v49 = 2 * v62;
            uint64_t v50 = v69;
            unsigned int v51 = (__int16 *)&v63;
            do
            {
              __int16 v52 = *v51++;
              *v50++ = v52;
              v49 -= 2;
            }
            while (v49);
          }
          uint64_t v48 = &v68;
        }
        else
        {
          uint64_t v66 = v61;
          int v47 = v62;
          int v68 = HIDWORD(v62);
          uint64_t v61 = &v63;
          uint64_t v48 = (int *)&v62 + 1;
        }
        *uint64_t v48 = 4;
        LODWORD(v62) = 0;
        int v67 = v47;
        v69[2] = v64;
        skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::AliasSpanMatchImpl();
      }
      uint64_t v20 = (long long *)((char *)v20 + 40);
    }
    while (v20 != v21);
  }
}

void sub_1D2EE4BEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36)
{
  if (a36 != v36) {
    free(a36);
  }
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a28 != v37) {
    free(a28);
  }
  _Unwind_Resume(exception_object);
}

size_t skit::SmallVector<skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>,4u,true>::_reserve_more(char **a1, unsigned int a2)
{
  uint64_t v3 = (char *)malloc_type_malloc(104 * a2, 0x1032040E39E8272uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unsigned int v15 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v15, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  uint64_t v4 = v3;
  uint64_t v5 = *a1;
  unsigned int v6 = *((_DWORD *)a1 + 2);
  if (v6)
  {
    size_t v7 = v3;
    unsigned int v8 = *a1;
    do
    {
      long long v9 = *(_OWORD *)v8;
      *((void *)v7 + 2) = *((void *)v8 + 2);
      *(_OWORD *)size_t v7 = v9;
      *((void *)v8 + 1) = 0;
      *((void *)v8 + 2) = 0;
      *(void *)unsigned int v8 = 0;
      uint64_t v10 = *((void *)v8 + 3);
      *((_WORD *)v7 + 16) = *((_WORD *)v8 + 16);
      *((void *)v7 + 3) = v10;
      long long v11 = *(_OWORD *)(v8 + 40);
      *(_OWORD *)(v7 + 52) = *(_OWORD *)(v8 + 52);
      *(_OWORD *)(v7 + 40) = v11;
      skit::SmallVector<skit::GroupId,4u,true>::move((uint64_t)(v7 + 72), (uint64_t)(v8 + 72));
      *((_DWORD *)v7 + 24) = *((_DWORD *)v8 + 24);
      v8 += 104;
      v7 += 104;
    }
    while (v8 != &v5[104 * v6]);
    uint64_t v12 = 104 * v6;
    do
    {
      skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl((uint64_t)v5);
      v5 += 104;
      v12 -= 104;
    }
    while (v12);
    uint64_t v5 = *a1;
  }
  if (v5 != (char *)(a1 + 2)) {
    free(v5);
  }
  *a1 = v4;
  size_t result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x68;
  return result;
}

size_t skit::SmallVector<skit::AliasSpanMatch,4u,true>::_reserve_more(long long **a1, unsigned int a2)
{
  uint64_t v3 = (char *)malloc_type_malloc(72 * a2, 0x101204049D86D5EuLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unsigned int v15 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v15, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  uint64_t v4 = (long long *)v3;
  uint64_t v5 = *a1;
  uint64_t v6 = *((unsigned int *)a1 + 2);
  if (v6)
  {
    size_t v7 = v3;
    unsigned int v8 = *a1;
    do
    {
      long long v9 = *v8;
      *((void *)v7 + 2) = *((void *)v8 + 2);
      *(_OWORD *)size_t v7 = v9;
      *((void *)v8 + 1) = 0;
      *((void *)v8 + 2) = 0;
      *(void *)unsigned int v8 = 0;
      uint64_t v10 = *((void *)v8 + 3);
      *((_WORD *)v7 + 16) = *((_WORD *)v8 + 16);
      *((void *)v7 + 3) = v10;
      long long v11 = *(long long *)((char *)v8 + 40);
      *(_OWORD *)(v7 + 56) = *(long long *)((char *)v8 + 56);
      *(_OWORD *)(v7 + 40) = v11;
      unsigned int v8 = (long long *)((char *)v8 + 72);
      v7 += 72;
    }
    while (v8 != (long long *)((char *)v5 + 72 * v6));
    uint64_t v12 = 72 * v6;
    do
    {
      if (*((char *)v5 + 23) < 0) {
        operator delete(*(void **)v5);
      }
      uint64_t v5 = (long long *)((char *)v5 + 72);
      v12 -= 72;
    }
    while (v12);
    uint64_t v5 = *a1;
  }
  if (v5 != (long long *)(a1 + 2)) {
    free(v5);
  }
  *a1 = v4;
  size_t result = malloc_size(v4);
  *((_DWORD *)a1 + 3) = result / 0x48;
  return result;
}

void skit::internal::FieldSpanMatcherImpl::clear_alias_span_matcher(skit::internal::FieldSpanMatcherImpl *this)
{
  *((unsigned char *)this + 608) = 0;
  *((_DWORD *)this + 156) = 0;
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 81);
  *((_OWORD *)this + 40) = 0u;
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::_destroy(*((void *)this + 82), *((_DWORD *)this + 166));
  *((_DWORD *)this + 166) = 0;
  unsigned int v3 = *((_DWORD *)this + 190);
  if (v3)
  {
    uint64_t v4 = *((void *)this + 94);
    uint64_t v5 = 104 * v3;
    do
    {
      uint64_t v4 = skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::~AliasSpanMatchImpl(v4) + 104;
      v5 -= 104;
    }
    while (v5);
  }
  *((_DWORD *)this + 190) = 0;
  skit::SmallVector<skit::AliasSpanMatch,4u,true>::_destroy(*((void *)this + 148), *((_DWORD *)this + 298));
  *((_DWORD *)this + 298) = 0;
}

uint64_t skit::internal::FieldSpanMatcherImpl::match(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t *a4, int a5)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*a3 != a3[1])
  {
    v7[0] = &v8;
    v7[1] = (void *)0x800000000;
    v5[0] = &v6;
    v5[1] = 0x200000000;
    if (*(_DWORD *)(result + 760)) {
      skit::internal::FieldSpanMatcherImpl::combine_alias_matches(result, (uint64_t)v7, a3, a5, (uint64_t)v5, a4);
    }
    skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::clear();
  }
  return result;
}

void sub_1D2EE6320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,void *a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector((char **)&STACK[0x210]);
  skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector((char **)&STACK[0x420]);
  if (a65 != a9) {
    free(a65);
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)&a43);
  if (a55 != a10) {
    free(a55);
  }
  _Unwind_Resume(a1);
}

size_t skit::SmallVector<float,16u,false>::_reserve_more(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = malloc_type_malloc(4 * a2, 0x100004052888210uLL);
  if (!v3)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v13 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v13, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(int **)a1;
  uint64_t v6 = *(unsigned int *)(a1 + 8);
  if (v6)
  {
    uint64_t v7 = 4 * v6;
    uint64_t v8 = v4;
    uint64_t v9 = *(int **)a1;
    do
    {
      int v10 = *v9++;
      *v8++ = v10;
      v7 -= 4;
    }
    while (v7);
  }
  if (v5 != (int *)(a1 + 16)) {
    free(v5);
  }
  *(void *)a1 = v4;
  size_t result = malloc_size(v4);
  *(_DWORD *)(a1 + 12) = result >> 2;
  return result;
}

uint64_t skit::internal::murmur_32_scramble(skit::internal *this)
{
  return 461845907 * ((380141568 * this) | ((-862048943 * this) >> 17));
}

uint64_t skit::internal::murmur3_32(skit::internal *this, unint64_t a2, int a3)
{
  if (a2 >= 4)
  {
    unint64_t v3 = a2 >> 2;
    uint64_t v4 = this;
    do
    {
      int v5 = *(_DWORD *)v4;
      uint64_t v4 = (skit::internal *)((char *)v4 + 4);
      HIDWORD(v6) = (461845907 * ((380141568 * v5) | ((-862048943 * v5) >> 17))) ^ a3;
      LODWORD(v6) = HIDWORD(v6);
      a3 = 5 * (v6 >> 19) - 430675100;
      --v3;
    }
    while (v3);
    this = (skit::internal *)((char *)this + (a2 & 0xFFFFFFFFFFFFFFFCLL));
  }
  int v7 = 0;
  unint64_t v8 = a2 & 3;
  if ((a2 & 3) != 0)
  {
    do
      int v7 = *((unsigned __int8 *)this + --v8) | (v7 << 8);
    while (v8);
  }
  unsigned int v9 = a3 ^ a2 ^ (461845907 * ((380141568 * v7) | ((-862048943 * v7) >> 17)));
  unsigned int v10 = -1028477387 * ((-2048144789 * (v9 ^ HIWORD(v9))) ^ ((-2048144789 * (v9 ^ HIWORD(v9))) >> 13));
  return v10 ^ HIWORD(v10);
}

void *skit::internal::IndexDiskImplV2::to_posting_list(void *result, uint64_t a2)
{
  if (a2
    && (v2 = *(unsigned __int16 *)(a2 + 4), unsigned int v3 = *(_DWORD *)a2 - 2 * v2 - 8, v3 >= 0x10)
    && (uint64_t v4 = a2 + 6,
        uint64_t v5 = a2 + 6 + 2 * v2,
        uint64_t v6 = *(unsigned int *)(v5 + 10),
        (8 * v6) + (unint64_t)(6 * *(_DWORD *)(v5 + 14)) + 16 == v3))
  {
    uint64_t v7 = v5 + 2;
    uint64_t v8 = v5 + 18;
    uint64_t v9 = v8 + 8 * v6;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    uint64_t v4 = 0;
    uint64_t v2 = 0;
  }
  uint64_t *result = v4;
  result[1] = v2;
  result[2] = v7;
  result[3] = v8;
  result[4] = v9;
  return result;
}

uint64_t skit::internal::IndexDiskImplV2::open(skit::internal::IndexDiskImplV2 *this)
{
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  if (!skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::open((uint64_t)this))
  {
    unsigned int v3 = (const std::string::value_type **)((char *)this + 168);
    if (*((char *)this + 191) < 0)
    {
      std::string::size_type v4 = *((void *)this + 22);
      if (!v4) {
        goto LABEL_68;
      }
      std::string::__init_copy_ctor_external((std::string *)&v124, *v3, v4);
    }
    else
    {
      if (!*((unsigned char *)this + 191)) {
        goto LABEL_68;
      }
      *(_OWORD *)&v124.st_dev = *(_OWORD *)v3;
      *(void *)&v124.st_uid = *((void *)this + 23);
    }
    std::string::append[abi:ne180100]<char const*,0>((std::string *)&v124, (std::string *)".ms", (std::string *)"");
    if (SHIBYTE(v124.st_gid) < 0)
    {
      std::string::__init_copy_ctor_external(&v117, *(const std::string::value_type **)&v124.st_dev, v124.st_ino);
      if (SHIBYTE(v124.st_gid) < 0) {
        operator delete(*(void **)&v124.st_dev);
      }
    }
    else
    {
      *(_OWORD *)&v117.__r_.__value_.__l.__data_ = *(_OWORD *)&v124.st_dev;
      v117.__r_.__value_.__r.__words[2] = *(void *)&v124.st_uid;
    }
    if (*((char *)this + 191) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v124, *((const std::string::value_type **)this + 21), *((void *)this + 22));
    }
    else
    {
      *(_OWORD *)&v124.st_dev = *(_OWORD *)v3;
      *(void *)&v124.st_uid = *((void *)this + 23);
    }
    std::string::append[abi:ne180100]<char const*,0>((std::string *)&v124, (std::string *)".ids", (std::string *)"");
    if (SHIBYTE(v124.st_gid) < 0)
    {
      std::string::__init_copy_ctor_external(&v116, *(const std::string::value_type **)&v124.st_dev, v124.st_ino);
      if (SHIBYTE(v124.st_gid) < 0) {
        operator delete(*(void **)&v124.st_dev);
      }
    }
    else
    {
      *(_OWORD *)&v116.__r_.__value_.__l.__data_ = *(_OWORD *)&v124.st_dev;
      v116.__r_.__value_.__r.__words[2] = *(void *)&v124.st_uid;
    }
    uint64_t v5 = (void *)((char *)this + 192);
    if ((v117.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v6 = &v117;
    }
    else {
      uint64_t v6 = (std::string *)v117.__r_.__value_.__r.__words[0];
    }
    if (skit::internal::MmapFile::open((size_t *)this + 24, (const char *)v6, 2, -1, 0, 0x1A0u, 3, 1025, 5, 0xFFFFFFFFFFFFFFFFLL, 0))goto LABEL_23; {
    unint64_t v11 = *((void *)this + 25);
    }
    if (v11 > 0x2F)
    {
      uint64_t v12 = (_DWORD *)*v5;
      if (*(_DWORD *)*v5 != 621942338)
      {
        if (skit::internal::get_logging_context(void)::once != -1) {
        uint64_t v59 = skit::internal::get_logging_context(void)::logger;
        }
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        LOWORD(v124.st_dev) = 0;
        uint64_t v58 = "MetaStoreHeader::validate_ms : meta store cookie is not magic";
        long long v60 = v59;
        uint32_t v61 = 2;
        goto LABEL_153;
      }
      uint64_t v13 = v12[3];
      if (*((void *)v12 + 5) - *((void *)v12 + 4) != v13)
      {
        if (skit::internal::get_logging_context(void)::once != -1) {
        uint64_t v62 = skit::internal::get_logging_context(void)::logger;
        }
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        int v63 = v12[3];
        __darwin_ino64_t v64 = *((void *)v12 + 4);
        uint64_t v65 = *((void *)v12 + 5);
        v124.st_dev = 67109632;
        *(_DWORD *)&v124.st_mode = v63;
        LOWORD(v124.st_ino) = 2048;
        *(__darwin_ino64_t *)((char *)&v124.st_ino + 2) = v64;
        HIWORD(v124.st_uid) = 2048;
        *(void *)&v124.st_gid = v65;
        uint64_t v58 = "MetaStoreHeader::validate : meta store delete count is greater than records count : %u != [%lli,%lli)";
        long long v60 = v62;
        uint32_t v61 = 28;
        goto LABEL_153;
      }
      if (v12[4] > v13)
      {
        if (skit::internal::get_logging_context(void)::once != -1) {
        uint64_t v66 = skit::internal::get_logging_context(void)::logger;
        }
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        int v68 = v12[3];
        int v67 = v12[4];
        v124.st_dev = 67109376;
        *(_DWORD *)&v124.st_mode = v67;
        LOWORD(v124.st_ino) = 1024;
        *(_DWORD *)((char *)&v124.st_ino + 2) = v68;
        uint64_t v58 = "MetaStoreHeader::validate : meta store delete count is greater than records count : %u > %u";
      }
      else
      {
        unsigned int v14 = v12[7];
        if (v14 <= v13)
        {
          if (v13) {
            uint64_t v15 = 10 * v13 + 48;
          }
          else {
            uint64_t v15 = 0;
          }
          if (v11 == v15)
          {
            *((void *)this + 26) = v12 + 12;
            if (!v14) {
              goto LABEL_59;
            }
            uint64_t v16 = (const char **)((char *)this + 240);
            uint64_t v17 = (char *)this + 240;
            if (*((char *)this + 263) < 0) {
              uint64_t v17 = *v16;
            }
            if (access(v17, 0))
            {
              if (*__error() == 2)
              {
                uint64_t v18 = ((*((void *)this + 35) - 16) / 0x150uLL);
                BOOL v19 = (*((void *)this + 35) - 16) / 0x150uLL != 0;
                *((_DWORD *)this + 66) = 4;
                *((_WORD *)this + 134) = 416;
                if (v18) {
                  size_t v20 = 352;
                }
                else {
                  size_t v20 = 16;
                }
                if (*((char *)this + 263) >= 0) {
                  long long v21 = (char *)this + 240;
                }
                else {
                  long long v21 = (const char *)*((void *)this + 30);
                }
                int v22 = open_dprotected_np(v21, 514, 4, 0, 416);
                int v23 = v22;
                if (v22 < 0)
                {
                  if (skit::internal::get_logging_context(void)::once != -1) {
                  uint64_t v79 = skit::internal::get_logging_context(void)::logger;
                  }
                  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                  {
                    int v80 = *((char *)this + 263);
                    unsigned int v81 = (char *)*((void *)this + 30);
                    unsigned int v82 = __error();
                    if (v80 >= 0) {
                      uint64_t v83 = (char *)this + 240;
                    }
                    else {
                      uint64_t v83 = v81;
                    }
                    int v84 = *v82;
                    *(_DWORD *)buf = 136446466;
                    *(void *)&uint8_t buf[4] = v83;
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = v84;
                    _os_log_error_impl(&dword_1D2EDA000, v79, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_file : file open failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
                  }
                }
                else
                {
                  if (ftruncate(v22, v20))
                  {
                    if (skit::internal::get_logging_context(void)::once != -1) {
                    uint64_t v85 = skit::internal::get_logging_context(void)::logger;
                    }
                    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                    {
                      int v99 = *((char *)this + 263);
                      uint64_t v100 = (char *)*((void *)this + 30);
                      uint64_t v101 = __error();
                      if (v99 >= 0) {
                        unsigned int v102 = (char *)this + 240;
                      }
                      else {
                        unsigned int v102 = v100;
                      }
                      int v103 = *v101;
                      *(_DWORD *)buf = 136446466;
                      *(void *)&uint8_t buf[4] = v102;
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = v103;
                      _os_log_error_impl(&dword_1D2EDA000, v85, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_file : file resize failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
                    }
                    close(v23);
                  }
                  else
                  {
                    mmap = skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::create_mmap((uint64_t)this + 216, v23, v20);
                    uint64_t v26 = (uint64_t)mmap;
                    if (mmap)
                    {
                      _DWORD *mmap = (unint64_t)(mmap + 4) >> 12;
                      mmap[1] = v19;
                      *((void *)mmap + 1) = 0xF00000000;
                      unsigned int v27 = 16 * (v18 != 0);
                      memset(mmap + 4, 128, v27);
                      *(unsigned char *)(v26 + 16 + v27 - 1) = -1;
                      *(void *)buf = 0;
                      *(void *)&uint8_t buf[8] = v20;
                      *(void *)&v124.st_dev = v26;
                      v124.st_ino = v20;
                      v124.st_uid = 0;
                      std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)buf, 0);
                      *(void *)&v124.st_dev = 0;
                      std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)this + 224, v26);
                      *((void *)this + 29) = v20;
                      uint64_t v28 = *((void *)this + 28);
                      std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)&v124, 0);
                      if (!v28) {
                        goto LABEL_23;
                      }
LABEL_57:
                      uint64_t v12 = (_DWORD *)*((void *)this + 24);
                      unsigned int v29 = *(_DWORD *)(*((void *)this + 28) + 8);
                      if (v12[3] < v29 || v12[7] < v29)
                      {
LABEL_23:
                        uint64_t v7 = (void *)*((void *)this + 36);
                        if (v7) {
                          munmap(v7, *((void *)this + 37));
                        }
                        *((void *)this + 36) = 0;
                        *((void *)this + 37) = 0;
                        std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)this + 224, 0);
                        uint64_t v8 = (void *)*((void *)this + 24);
                        if (v8) {
                          munmap(v8, *((void *)this + 25));
                        }
                        char v9 = 0;
                        void *v5 = 0;
                        v5[1] = 0;
                        goto LABEL_28;
                      }
LABEL_59:
                      if (v12[6])
                      {
                        float v30 = (v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                            ? &v116
                            : (std::string *)v116.__r_.__value_.__r.__words[0];
                        if ((skit::internal::MmapFile::open((size_t *)this + 36, (const char *)v30, 2, -1, 0, 0x1A0u, 3, 1025, 5, 0xFFFFFFFFFFFFFFFFLL, 0) & 0x80000000) != 0|| *((void *)this + 36)&& *((void *)this + 37) != *(_DWORD *)(*((void *)this + 24) + 24))
                        {
                          goto LABEL_23;
                        }
                      }
                      char v9 = 1;
LABEL_28:
                      if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0) {
                        operator delete(v116.__r_.__value_.__l.__data_);
                      }
                      if (SHIBYTE(v117.__r_.__value_.__r.__words[2]) < 0)
                      {
                        operator delete(v117.__r_.__value_.__l.__data_);
                        if (v9) {
                          return 0;
                        }
                      }
                      else if (v9)
                      {
                        return 0;
                      }
LABEL_68:
                      uint64_t v2 = "meta store";
                      goto LABEL_69;
                    }
                  }
                  if (*((char *)this + 263) >= 0) {
                    unsigned int v86 = (const std::__fs::filesystem::path *)((char *)this + 240);
                  }
                  else {
                    unsigned int v86 = (const std::__fs::filesystem::path *)*((void *)this + 30);
                  }
                  remove(v86, v25);
                }
                *(void *)buf = 0;
                *(void *)&uint8_t buf[8] = 0;
                *(_OWORD *)&v124.st_dev = 0uLL;
                v124.st_uid = -1;
                std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)buf, 0);
                uint64_t v55 = &v124;
                goto LABEL_116;
              }
              if (skit::internal::get_logging_context(void)::once != -1) {
              uint64_t v77 = skit::internal::get_logging_context(void)::logger;
              }
              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
                goto LABEL_23;
              }
              if (*((char *)this + 263) < 0) {
                uint64_t v16 = (const char **)*v16;
              }
              int v78 = *__error();
              v124.st_dev = 136446466;
              *(void *)&v124.st_mode = v16;
              WORD2(v124.st_ino) = 1024;
              *(_DWORD *)((char *)&v124.st_ino + 6) = v78;
              uint64_t v58 = "FlatSetDisk::open : stat failed @ %{public}s : %{darwin.errno}d";
              long long v60 = v77;
              uint32_t v61 = 18;
LABEL_153:
              _os_log_error_impl(&dword_1D2EDA000, v60, OS_LOG_TYPE_ERROR, v58, (uint8_t *)&v124, v61);
              goto LABEL_23;
            }
            if (*((char *)this + 263) >= 0) {
              unsigned int v32 = (char *)this + 240;
            }
            else {
              unsigned int v32 = (const char *)*((void *)this + 30);
            }
            int v33 = open_dprotected_np(v32, 2, -1, 0);
            int v34 = v33;
            if (v33 < 0)
            {
              if (skit::internal::get_logging_context(void)::once != -1) {
              int64_t v87 = skit::internal::get_logging_context(void)::logger;
              }
              if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
              {
                int v104 = *((char *)this + 263);
                uint64_t v105 = (char *)*((void *)this + 30);
                uint64_t v106 = __error();
                if (v104 >= 0) {
                  uint64_t v107 = (char *)this + 240;
                }
                else {
                  uint64_t v107 = v105;
                }
                int v108 = *v106;
                v124.st_dev = 136446466;
                *(void *)&v124.st_mode = v107;
                WORD2(v124.st_ino) = 1024;
                *(_DWORD *)((char *)&v124.st_ino + 6) = v108;
                _os_log_error_impl(&dword_1D2EDA000, v87, OS_LOG_TYPE_ERROR, "FlatSetDisk::open_existing_file : file open failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v124, 0x12u);
              }
              *(_OWORD *)&v124.st_dev = 0uLL;
              uint64_t v118 = 0;
              st_std::basic_string<char16_t>::size_type size = 0;
              int v120 = -1;
              int64_t v88 = &v124;
            }
            else
            {
              memset(&v124, 0, sizeof(v124));
              if (fstat(v33, &v124))
              {
                if (skit::internal::get_logging_context(void)::once != -1) {
                int64_t v89 = skit::internal::get_logging_context(void)::logger;
                }
                if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                {
                  int v109 = *((char *)this + 263);
                  uint64_t v110 = (char *)*((void *)this + 30);
                  uint64_t v111 = __error();
                  if (v109 >= 0) {
                    uint64_t v112 = (char *)this + 240;
                  }
                  else {
                    uint64_t v112 = v110;
                  }
                  int v113 = *v111;
                  *(_DWORD *)buf = 136446466;
                  *(void *)&uint8_t buf[4] = v112;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v113;
                  _os_log_error_impl(&dword_1D2EDA000, v89, OS_LOG_TYPE_ERROR, "FlatSetDisk::open_existing_file : fstat failed @ %{public}s : %{darwin.errno}d", buf, 0x12u);
                }
                close(v34);
              }
              else
              {
                *((_DWORD *)this + 66) = fcntl(v34, 63);
                *((_WORD *)this + 134) = v124.st_mode & 0x1FF;
                uint64_t v35 = skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::create_mmap((uint64_t)this + 216, v34, v124.st_size);
                uint64_t v36 = v35;
                if (v35)
                {
                  if (v124.st_size <= 351)
                  {
                    if (skit::internal::get_logging_context(void)::once != -1) {
                    uint64_t v90 = skit::internal::get_logging_context(void)::logger;
                    }
                    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                    {
                      if (*((char *)this + 263) >= 0) {
                        uint64_t v91 = (char *)this + 240;
                      }
                      else {
                        uint64_t v91 = (char *)*((void *)this + 30);
                      }
                      *(_DWORD *)buf = 136446722;
                      *(void *)&uint8_t buf[4] = v91;
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v124.st_size;
                      __int16 v122 = 2048;
                      uint64_t v123 = 352;
                      _os_log_error_impl(&dword_1D2EDA000, v90, OS_LOG_TYPE_ERROR, "FlatSetDisk::open_existing_file : file size is too small @ %{public}s : %lli < %lli", buf, 0x20u);
                    }
                  }
                  else
                  {
                    if (v124.st_size == 336 * v35[1] + 16)
                    {
                      *(void *)buf = 0;
                      *(void *)&uint8_t buf[8] = v124.st_size;
                      uint64_t v118 = v35;
                      st_std::basic_string<char16_t>::size_type size = v124.st_size;
                      int v120 = 0;
                      std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)buf, 0);
                      if ((v36[3] - 16) <= 0xFFFFFFF0)
                      {
                        if (skit::internal::get_logging_context(void)::once != -1) {
                        uint64_t v93 = skit::internal::get_logging_context(void)::logger;
                        }
                        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114; {
                        int v94 = v36[3];
                        }
                        *(void *)&v124.st_dev = 0xF04000200;
                        LOWORD(v124.st_ino) = 1024;
                        *(_DWORD *)((char *)&v124.st_ino + 2) = v94;
                        unsigned int v51 = "FlatSetImpl::verify : invalid max load : [1,%u] %u";
                      }
                      else
                      {
                        unsigned int v37 = v36[2];
                        int v38 = 16 * v36[1];
                        unsigned int v39 = v38 - 1;
                        if (v37 < v38 - 1)
                        {
                          if (*((unsigned __int8 *)v36 + v39 + 16) != 255)
                          {
                            if (skit::internal::get_logging_context(void)::once != -1) {
                            uint64_t v96 = skit::internal::get_logging_context(void)::logger;
                            }
                            if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114; {
                            v124.st_dev = 67109120;
                            }
                            *(_DWORD *)&v124.st_mode = v39;
                            unsigned int v51 = "FlatSetImpl::verify : sentinel marker not found : %u";
                            __int16 v52 = v96;
                            uint32_t v53 = 8;
                            goto LABEL_112;
                          }
                          unsigned int v40 = 0;
                          int v41 = 0;
                          int v42 = 0;
                          int v43 = 0;
                          uint64_t v44 = -15 - (v38 - 16);
LABEL_86:
                          uint64_t v45 = 0;
                          int v46 = 16;
                          int v47 = -1;
                          while (1)
                          {
                            int v48 = *((char *)&v36[v40 / 4 + 4] + v45);
                            if (v48 == -128)
                            {
                              ++v41;
                              if ((int)v45 < v46) {
                                int v46 = v45;
                              }
                              goto LABEL_100;
                            }
                            if (v48 == -2) {
                              break;
                            }
                            int v49 = v40 + v45;
                            if (v48 != -1)
                            {
                              if (v48 < 0)
                              {
                                if (skit::internal::get_logging_context(void)::once != -1) {
                                uint64_t v50 = skit::internal::get_logging_context(void)::logger;
                                }
                                if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114; {
                                v124.st_dev = 67109376;
                                }
                                *(_DWORD *)&v124.st_mode = v49;
                                LOWORD(v124.st_ino) = 1024;
                                *(_DWORD *)((char *)&v124.st_ino + 2) = v39;
                                unsigned int v51 = "FlatSetImpl::verify : invalid ctrl marker : %u of %u";
LABEL_110:
                                __int16 v52 = v50;
                                goto LABEL_111;
                              }
                              ++v43;
                              goto LABEL_98;
                            }
                            if (v44 + v40 + v45)
                            {
                              if (skit::internal::get_logging_context(void)::once != -1) {
                              uint64_t v50 = skit::internal::get_logging_context(void)::logger;
                              }
                              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114; {
                              v124.st_dev = 67109376;
                              }
                              *(_DWORD *)&v124.st_mode = v49;
                              LOWORD(v124.st_ino) = 1024;
                              *(_DWORD *)((char *)&v124.st_ino + 2) = v39;
                              unsigned int v51 = "FlatSetImpl::verify : bad sentinel marker found : %u of %u";
                              goto LABEL_110;
                            }
LABEL_100:
                            if (++v45 == 16)
                            {
                              if (v47 < v46)
                              {
                                v40 += 16;
                                if (v40 < v39) {
                                  goto LABEL_86;
                                }
                                if (v43 == v37)
                                {
                                  if (v42 + v37 + v41 == v39)
                                  {
                                    uint64_t v118 = 0;
                                    std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)this + 224, (uint64_t)v36);
                                    *((void *)this + 29) = st_size;
                                    std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)&v118, 0);
                                    goto LABEL_57;
                                  }
                                  int v97 = v36[2];
                                  if (skit::internal::get_logging_context(void)::once != -1) {
                                  uint64_t v93 = skit::internal::get_logging_context(void)::logger;
                                  }
                                  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                                  {
LABEL_217:
                                    int v98 = v36[2];
                                    v124.st_dev = 67109376;
                                    *(_DWORD *)&v124.st_mode = v97;
                                    LOWORD(v124.st_ino) = 1024;
                                    *(_DWORD *)((char *)&v124.st_ino + 2) = v98;
                                    unsigned int v51 = "FlatSetImpl::verify : invalid header entry count : %u != %u";
                                    goto LABEL_209;
                                  }
                                }
                                else
                                {
                                  int v97 = v43;
                                  if (skit::internal::get_logging_context(void)::once != -1) {
                                  uint64_t v93 = skit::internal::get_logging_context(void)::logger;
                                  }
                                  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                                  {
                                    goto LABEL_217;
                                  }
                                }
LABEL_114:
                                uint64_t v54 = skit::internal::get_logging_context(void)::logger;
                                if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                                {
                                  if (*((char *)this + 263) < 0) {
                                    uint64_t v16 = (const char **)*v16;
                                  }
                                  v124.st_dev = 136446210;
                                  *(void *)&v124.st_mode = v16;
                                  _os_log_error_impl(&dword_1D2EDA000, v54, OS_LOG_TYPE_ERROR, "FlatSetDisk::open : verification failed for @ %{public}s", (uint8_t *)&v124, 0xCu);
                                }
LABEL_115:
                                uint64_t v55 = (stat *)&v118;
LABEL_116:
                                std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)v55, 0);
                                goto LABEL_23;
                              }
                              int v74 = v47;
                              uid_t v75 = v46;
                              if (skit::internal::get_logging_context(void)::once != -1) {
                              uint64_t v76 = skit::internal::get_logging_context(void)::logger;
                              }
                              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114; {
                              v124.st_dev = 67109632;
                              }
                              *(_DWORD *)&v124.st_mode = v40;
                              LOWORD(v124.st_ino) = 1024;
                              *(_DWORD *)((char *)&v124.st_ino + 2) = v74;
                              HIWORD(v124.st_ino) = 1024;
                              v124.st_uid = v75;
                              unsigned int v51 = "FlatSetImpl::verify : invalid empty slot found in bucket %u : %u >= %u";
                              __int16 v52 = v76;
                              uint32_t v53 = 20;
LABEL_112:
                              _os_log_error_impl(&dword_1D2EDA000, v52, OS_LOG_TYPE_ERROR, v51, (uint8_t *)&v124, v53);
                              if (skit::internal::get_logging_context(void)::once != -1) {
                              goto LABEL_114;
                              }
                            }
                          }
                          ++v42;
LABEL_98:
                          if (v47 <= (int)v45) {
                            int v47 = v45;
                          }
                          goto LABEL_100;
                        }
                        if (skit::internal::get_logging_context(void)::once != -1) {
                        uint64_t v93 = skit::internal::get_logging_context(void)::logger;
                        }
                        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_114; {
                        int v95 = v36[2];
                        }
                        v124.st_dev = 67109376;
                        *(_DWORD *)&v124.st_mode = v95;
                        LOWORD(v124.st_ino) = 1024;
                        *(_DWORD *)((char *)&v124.st_ino + 2) = v39;
                        unsigned int v51 = "FlatSetImpl::verify : entry count is greater than available slots : %u > %u";
                      }
LABEL_209:
                      __int16 v52 = v93;
LABEL_111:
                      uint32_t v53 = 14;
                      goto LABEL_112;
                    }
                    if (skit::internal::get_logging_context(void)::once != -1) {
                    uint64_t v92 = skit::internal::get_logging_context(void)::logger;
                    }
                    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                    {
                      if (*((char *)this + 263) >= 0) {
                        uint64_t v114 = (char *)this + 240;
                      }
                      else {
                        uint64_t v114 = (char *)*((void *)this + 30);
                      }
                      uint64_t v115 = (336 * v36[1] + 16);
                      *(_DWORD *)buf = 136446722;
                      *(void *)&uint8_t buf[4] = v114;
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v124.st_size;
                      __int16 v122 = 2048;
                      uint64_t v123 = v115;
                      _os_log_error_impl(&dword_1D2EDA000, v92, OS_LOG_TYPE_ERROR, "FlatSetDisk::open_existing_file : file size does not match expected file size @ %{public}s : %lli != %lu", buf, 0x20u);
                    }
                    munmap(v36, v124.st_size);
                  }
                }
              }
              *(void *)buf = 0;
              *(void *)&uint8_t buf[8] = 0;
              uint64_t v118 = 0;
              st_std::basic_string<char16_t>::size_type size = 0;
              int v120 = -1;
              int64_t v88 = (stat *)buf;
            }
            std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)v88, 0);
            goto LABEL_115;
          }
          if (skit::internal::get_logging_context(void)::once != -1) {
          uint64_t v56 = skit::internal::get_logging_context(void)::logger;
          }
          if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
            goto LABEL_23;
          }
          uint64_t v71 = *((void *)this + 25);
          unsigned int v72 = *(_DWORD *)(*((void *)this + 24) + 12);
          if (v72) {
            uint64_t v73 = 10 * v72 + 48;
          }
          else {
            uint64_t v73 = 0;
          }
          v124.st_dev = 134218240;
          *(void *)&v124.st_mode = v71;
          WORD2(v124.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v124.st_ino + 6) = v73;
          uint64_t v58 = "DiskMetaStore::open : meta store file size does not match the expected size : %lu != %lu";
LABEL_152:
          long long v60 = v56;
          uint32_t v61 = 22;
          goto LABEL_153;
        }
        if (skit::internal::get_logging_context(void)::once != -1) {
        uint64_t v66 = skit::internal::get_logging_context(void)::logger;
        }
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
          goto LABEL_23;
        }
        int v69 = v12[7];
        int v70 = v12[3];
        v124.st_dev = 67109376;
        *(_DWORD *)&v124.st_mode = v69;
        LOWORD(v124.st_ino) = 1024;
        *(_DWORD *)((char *)&v124.st_ino + 2) = v70;
        uint64_t v58 = "MetaStoreHeader::validate : meta store xid count is greater than records count : %u > %u";
      }
      long long v60 = v66;
      uint32_t v61 = 14;
      goto LABEL_153;
    }
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v56 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    uint64_t v57 = *((void *)this + 25);
    v124.st_dev = 134218240;
    *(void *)&v124.st_mode = v57;
    WORD2(v124.st_ino) = 2048;
    *(__darwin_ino64_t *)((char *)&v124.st_ino + 6) = 48;
    uint64_t v58 = "DiskMetaStore::open : meta store file is too small : %lu < %lu";
    goto LABEL_152;
  }
  uint64_t v2 = "term index";
LABEL_69:
  if (skit::internal::get_logging_context(void)::once != -1) {
  unsigned int v31 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    v124.st_dev = 136446210;
    *(void *)&v124.st_mode = v2;
    _os_log_error_impl(&dword_1D2EDA000, v31, OS_LOG_TYPE_ERROR, "IndexDiskImplV2::open : opening %{public}s failed", (uint8_t *)&v124, 0xCu);
  }
  return 0xFFFFFFFFLL;
}

void sub_1D2EE7AAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  if (a25 < 0) {
    operator delete(a20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::open(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1 + 24;
  if (!*(void *)(a1 + 24))
  {
    if (*(char *)(a1 + 23) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)&v39, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    }
    else
    {
      *(_OWORD *)&v39.st_dev = *(_OWORD *)a1;
      *(void *)&v39.st_uid = *(void *)(a1 + 16);
    }
    std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>((std::string *)&__replacement, (std::string *)".dat");
    unsigned int v3 = std::__fs::filesystem::path::replace_extension((std::__fs::filesystem::path *)&v39, (const std::__fs::filesystem::path *)&__replacement);
    if (SHIBYTE(v3->__pn_.__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&pn, v3->__pn_.__r_.__value_.__l.__data_, v3->__pn_.__r_.__value_.__l.__size_);
    }
    else {
      std::string pn = v3->__pn_;
    }
    std::string::size_type v4 = (std::__fs::filesystem::path *)(a1 + 40);
    if (*(_DWORD *)(a1 + 64) == -1)
    {
      if (*(char *)(a1 + 63) < 0) {
        operator delete(v4->__pn_.__r_.__value_.__l.__data_);
      }
      *(_OWORD *)&v4->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&pn.__r_.__value_.__l.__data_;
      *(void *)(a1 + 56) = *((void *)&pn.__r_.__value_.__l + 2);
      *((unsigned char *)&pn.__r_.__value_.__s + 23) = 0;
      pn.__r_.__value_.__s.__data_[0] = 0;
    }
    else if (SHIBYTE(pn.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(pn.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__replacement.st_gid) < 0) {
      operator delete(*(void **)&__replacement.st_dev);
    }
    if (SHIBYTE(v39.st_gid) < 0) {
      operator delete(*(void **)&v39.st_dev);
    }
    memset(&v39, 0, sizeof(v39));
    memset(&__replacement, 0, sizeof(__replacement));
    uint64_t v5 = (const char *)a1;
    if (*(char *)(a1 + 23) < 0) {
      uint64_t v5 = *(const char **)a1;
    }
    int v6 = access(v5, 0);
    uint64_t v7 = (const char *)(a1 + 40);
    if (*(char *)(a1 + 63) < 0) {
      uint64_t v7 = (const char *)v4->__pn_.__r_.__value_.__r.__words[0];
    }
    int v8 = stat(v7, &__replacement);
    int v9 = v8;
    if (v8) {
      BOOL v10 = v6 == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      if (skit::internal::get_logging_context(void)::once != -1) {
      int v34 = skit::internal::get_logging_context(void)::logger;
      }
      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
        return 0xFFFFFFFFLL;
      }
      *(_WORD *)buf = 0;
      uint64_t v35 = "KvStore::open : data file is missing";
    }
    else
    {
      if (v8) {
        goto LABEL_29;
      }
      if (v6)
      {
        if (skit::internal::get_logging_context(void)::once != -1) {
        int v34 = skit::internal::get_logging_context(void)::logger;
        }
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
          return 0xFFFFFFFFLL;
        }
        *(_WORD *)buf = 0;
        uint64_t v35 = "KvStore::open : table file is missing";
      }
      else if ((__replacement.st_mode & 0x124) != 0)
      {
        if ((__replacement.st_mode & 0x92) != 0)
        {
          if ((__replacement.st_mode & 0x8000) != 0)
          {
LABEL_29:
            unint64_t v11 = (const char *)a1;
            if (*(char *)(a1 + 23) < 0) {
              unint64_t v11 = *(const char **)a1;
            }
            int v12 = open_dprotected_np(v11, 514, *(_DWORD *)(a1 + 156), 0, *(unsigned __int16 *)(a1 + 160));
            int v13 = v12;
            if (v12 == -1)
            {
              if (skit::internal::get_logging_context(void)::once != -1) {
              int v22 = skit::internal::get_logging_context(void)::logger;
              }
              if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
              {
                int v23 = *__error();
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)int v42 = v23;
                _os_log_error_impl(&dword_1D2EDA000, v22, OS_LOG_TYPE_ERROR, "KvStore::open : table file open failed : %{darwin.errno}d", buf, 8u);
              }
              goto LABEL_52;
            }
            if (fstat(v12, &v39) == -1)
            {
              if (skit::internal::get_logging_context(void)::once != -1) {
              uint64_t v24 = skit::internal::get_logging_context(void)::logger;
              }
              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
                goto LABEL_151;
              }
              *(_WORD *)buf = 0;
              uint64_t v25 = "KvStore::open : failed to get table file stats";
            }
            else if ((v39.st_mode & 0x124) != 0)
            {
              if ((v39.st_mode & 0x92) != 0)
              {
                if ((v39.st_mode & 0x8000) != 0)
                {
                  if (!v6 && v39.st_size <= 39)
                  {
                    if (skit::internal::get_logging_context(void)::once != -1) {
                    uint64_t v26 = skit::internal::get_logging_context(void)::logger;
                    }
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151; {
                    *(_DWORD *)buf = 134217984;
                    }
                    *(void *)int v42 = v39.st_size;
                    uint64_t v25 = "KvStore::open : table file is too small, %lli";
                    unsigned int v27 = v26;
                    uint32_t v28 = 12;
                    goto LABEL_150;
                  }
                  if (v6) {
                    st_std::basic_string<char16_t>::size_type size = 552;
                  }
                  else {
                    st_std::basic_string<char16_t>::size_type size = v39.st_size;
                  }
                  *(void *)(a1 + 32) = st_size;
                  uint64_t v15 = mmap(0, st_size, 3, *(_DWORD *)(a1 + 136) | 1u, v13, 0);
                  *(void *)(a1 + 24) = v15;
                  if (v15 == (void *)-1)
                  {
                    if (skit::internal::get_logging_context(void)::once != -1) {
                    uint64_t v29 = skit::internal::get_logging_context(void)::logger;
                    }
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151; {
                    int v30 = *__error();
                    }
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int v42 = v30;
                    uint64_t v25 = "KvStore::open : mmap of table file failed : %{darwin.errno}d";
                    goto LABEL_115;
                  }
                  if (madvise(v15, *(void *)(a1 + 32), *(_DWORD *)(a1 + 140)))
                  {
                    if (skit::internal::get_logging_context(void)::once != -1) {
                    uint64_t v29 = skit::internal::get_logging_context(void)::logger;
                    }
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151; {
                    int v31 = *__error();
                    }
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int v42 = v31;
                    uint64_t v25 = "KvStore::open : madvise for table file failed : %{darwin.errno}d";
                    goto LABEL_115;
                  }
                  if (v6)
                  {
                    if (!ftruncate(v13, *(void *)(a1 + 32)))
                    {
                      skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::KvTableImpl(*(void *)(a1 + 24), 1);
                      *(unsigned char *)(a1 + 162) = 1;
LABEL_49:
                      if (!close(v13))
                      {
                        if (skit::internal::BlobFile::open((skit::internal::BlobFile *)(a1 + 40), 514, *(_DWORD *)(a1 + 156), *(unsigned __int16 *)(a1 + 160))|| skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file(a1))
                        {
                          goto LABEL_52;
                        }
                        if (v6) {
                          skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::calculate_checksums(a1);
                        }
                        return 0;
                      }
                      if (skit::internal::get_logging_context(void)::once != -1) {
                      uint64_t v29 = skit::internal::get_logging_context(void)::logger;
                      }
                      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
                      {
LABEL_151:
                        close(v13);
LABEL_52:
                        if ((unint64_t)(*(void *)v1 + 1) >= 2) {
                          munmap(*(void **)v1, *(void *)(a1 + 32));
                        }
                        *(void *)uint64_t v1 = 0;
                        *(void *)(v1 + 8) = 0;
                        skit::internal::BlobFile::close((skit::internal::BlobFile *)(a1 + 40));
                        uint64_t v18 = *(void **)(a1 + 112);
                        if ((unint64_t)v18 + 1 >= 2) {
                          munmap(v18, *(void *)(a1 + 120));
                        }
                        *(void *)(a1 + 112) = 0;
                        *(void *)(a1 + 120) = 0;
                        if (v6)
                        {
                          BOOL v19 = (const std::__fs::filesystem::path *)a1;
                          if (*(char *)(a1 + 23) < 0) {
                            BOOL v19 = *(const std::__fs::filesystem::path **)a1;
                          }
                          remove(v19, v17);
                        }
                        if (v9)
                        {
                          if (*(char *)(a1 + 63) < 0) {
                            std::string::size_type v4 = (std::__fs::filesystem::path *)v4->__pn_.__r_.__value_.__r.__words[0];
                          }
                          remove(v4, v17);
                        }
                        return 0xFFFFFFFFLL;
                      }
                      int v32 = *__error();
                      *(_DWORD *)buf = 67109120;
                      *(_DWORD *)int v42 = v32;
                      uint64_t v25 = "KvStore::open : table file close failed : %{darwin.errno}d";
                      goto LABEL_115;
                    }
                    if (skit::internal::get_logging_context(void)::once != -1) {
                    uint64_t v29 = skit::internal::get_logging_context(void)::logger;
                    }
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151; {
                    int v33 = *__error();
                    }
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)int v42 = v33;
                    uint64_t v25 = "KvStore::open : ftruncate on table file failed : %{darwin.errno}d";
LABEL_115:
                    unsigned int v27 = v29;
                    uint32_t v28 = 8;
LABEL_150:
                    _os_log_error_impl(&dword_1D2EDA000, v27, OS_LOG_TYPE_ERROR, v25, buf, v28);
                    goto LABEL_151;
                  }
                  uint64_t v16 = *(_DWORD **)v1;
                  if (**(_DWORD **)v1 == 410583828)
                  {
                    if ((((unint64_t)v16[4] << 9) | 0x28) != v39.st_size)
                    {
                      if (skit::internal::get_logging_context(void)::once != -1) {
                      uint64_t v36 = skit::internal::get_logging_context(void)::logger;
                      }
                      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151; {
                      uint64_t v37 = *(unsigned int *)(*(void *)v1 + 16);
                      }
                      *(_DWORD *)buf = 67109632;
                      *(_DWORD *)int v42 = v37;
                      *(_WORD *)&v42[4] = 2048;
                      *(void *)&v42[6] = (v37 << 9) | 0x28;
                      __int16 v43 = 2048;
                      off_t v44 = v39.st_size;
                      uint64_t v25 = "KvStore::open : table file validation failed, bucket count does not match file size : bucket"
                            "_cnt=%u, expected_size=%lu, actual_size=%lli";
                      unsigned int v27 = v36;
                      uint32_t v28 = 28;
                      goto LABEL_150;
                    }
                    if (__replacement.st_size == v16[6]) {
                      goto LABEL_49;
                    }
                    if (skit::internal::get_logging_context(void)::once != -1) {
                    uint64_t v24 = skit::internal::get_logging_context(void)::logger;
                    }
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151; {
                    *(_WORD *)buf = 0;
                    }
                    uint64_t v25 = "KvStore::open : table file validation failed, data file size mismatch";
                  }
                  else
                  {
                    if (skit::internal::get_logging_context(void)::once != -1) {
                    uint64_t v24 = skit::internal::get_logging_context(void)::logger;
                    }
                    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151; {
                    *(_WORD *)buf = 0;
                    }
                    uint64_t v25 = "KvStore::open : table file validation failed, magic cookie not found";
                  }
                }
                else
                {
                  if (skit::internal::get_logging_context(void)::once != -1) {
                  uint64_t v24 = skit::internal::get_logging_context(void)::logger;
                  }
                  if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151; {
                  *(_WORD *)buf = 0;
                  }
                  uint64_t v25 = "KvStore::open : table file is not a regular file";
                }
              }
              else
              {
                if (skit::internal::get_logging_context(void)::once != -1) {
                uint64_t v24 = skit::internal::get_logging_context(void)::logger;
                }
                if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))goto LABEL_151; {
                *(_WORD *)buf = 0;
                }
                uint64_t v25 = "KvStore::open : table file does not have write permission";
              }
            }
            else
            {
              if (skit::internal::get_logging_context(void)::once != -1) {
              uint64_t v24 = skit::internal::get_logging_context(void)::logger;
              }
              if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
                goto LABEL_151;
              }
              *(_WORD *)buf = 0;
              uint64_t v25 = "KvStore::open : table file does not have read permission";
            }
            unsigned int v27 = v24;
            uint32_t v28 = 2;
            goto LABEL_150;
          }
          if (skit::internal::get_logging_context(void)::once != -1) {
          int v34 = skit::internal::get_logging_context(void)::logger;
          }
          if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
            return 0xFFFFFFFFLL;
          }
          *(_WORD *)buf = 0;
          uint64_t v35 = "KvStore::open : data file is not a regular file";
        }
        else
        {
          if (skit::internal::get_logging_context(void)::once != -1) {
          int v34 = skit::internal::get_logging_context(void)::logger;
          }
          if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
            return 0xFFFFFFFFLL;
          }
          *(_WORD *)buf = 0;
          uint64_t v35 = "KvStore::open : data file does not have write permission";
        }
      }
      else
      {
        if (skit::internal::get_logging_context(void)::once != -1) {
        int v34 = skit::internal::get_logging_context(void)::logger;
        }
        if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
          return 0xFFFFFFFFLL;
        }
        *(_WORD *)buf = 0;
        uint64_t v35 = "KvStore::open : data file does not have read permission";
      }
    }
    _os_log_error_impl(&dword_1D2EDA000, v34, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    return 0xFFFFFFFFLL;
  }
  if (skit::internal::get_logging_context(void)::once != -1) {
  long long v21 = skit::internal::get_logging_context(void)::logger;
  }
  uint64_t result = os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO);
  if (result)
  {
    LOWORD(v39.st_dev) = 0;
    _os_log_impl(&dword_1D2EDA000, v21, OS_LOG_TYPE_INFO, "KvStore::open : already open", (uint8_t *)&v39, 2u);
    return 0;
  }
  return result;
}

void sub_1D2EE87E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37)
{
  if (a37 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::KvTableImpl(uint64_t a1, int a2)
{
  *(_OWORD *)a1 = xmmword_1D2F00760;
  *(_DWORD *)(a1 + 16) = a2;
  *(_DWORD *)(a1 + 20) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_DWORD *)(a1 + 28) = 1064514355;
  *(void *)(a1 + 32) = time(0);
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  if (v3)
  {
    std::string::size_type v4 = (unsigned int *)(a1 + 40);
    do
    {
      atomic_store(0xFFFFFFFF, v4);
      v4 += 128;
      --v3;
    }
    while (v3);
  }
  return a1;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 72);
  if (*(void *)(a1 + 120) == v1 || v1 == 0) {
    return 0;
  }
  if (skit::internal::BlobFile::flush_internal_cache((skit::internal::BlobFile *)(a1 + 40))) {
    return 0xFFFFFFFFLL;
  }
  int v6 = mmap(0, *(void *)(a1 + 72), 1, *(_DWORD *)(a1 + 136) | 1u, *(_DWORD *)(a1 + 64), 0);
  uint64_t v7 = v6;
  if (v6 == (void *)-1)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    BOOL v10 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v11 = *__error();
    int v14 = 67109120;
    int v15 = v11;
    int v12 = "KvStore::mmap_data_file : mmap of data file failed %{darwin.errno}d";
    goto LABEL_24;
  }
  if (madvise(v6, *(void *)(a1 + 72), *(_DWORD *)(a1 + 140) | 1))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    BOOL v10 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    int v13 = *__error();
    int v14 = 67109120;
    int v15 = v13;
    int v12 = "KvStore::mmap_data_file : madvise for data file failed %{darwin.errno}d";
LABEL_24:
    _os_log_error_impl(&dword_1D2EDA000, v10, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v14, 8u);
LABEL_21:
    if ((unint64_t)v7 + 1 >= 2) {
      munmap(v7, *(void *)(a1 + 72));
    }
    return 0xFFFFFFFFLL;
  }
  int v8 = *(void **)(a1 + 112);
  if (v8) {
    munmap(v8, *(void *)(a1 + 120));
  }
  uint64_t result = 0;
  uint64_t v9 = *(void *)(a1 + 72);
  *(void *)(a1 + 112) = v7;
  *(void *)(a1 + 120) = v9;
  return result;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::calculate_checksums(uint64_t result)
{
  if (*(unsigned char *)(result + 162))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 24);
    if (v2)
    {
      unint64_t v3 = *(void *)(result + 32);
      BOOL v4 = v3 >= 0xC;
      unint64_t v5 = v3 - 12;
      if (v4)
      {
        if (v5)
        {
          int v6 = (char *)(v2 + 12);
          unsigned int v7 = -1;
          do
          {
            char v8 = *v6++;
            unsigned int v7 = crc32_tab[(v8 ^ v7)] ^ (v7 >> 8);
            --v5;
          }
          while (v5);
          int v9 = ~v7;
        }
        else
        {
          int v9 = -1;
        }
        uint64_t result = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file(result);
        if (!result)
        {
          BOOL v10 = *(char **)(v1 + 112);
          if (v10)
          {
            uint64_t v11 = *(void *)(v1 + 120);
            if (v11)
            {
              unsigned int v12 = -1;
              do
              {
                char v13 = *v10++;
                unsigned int v12 = crc32_tab[(v13 ^ v12)] ^ (v12 >> 8);
                --v11;
              }
              while (v11);
              LODWORD(v10) = ~v12;
            }
            else
            {
              LODWORD(v10) = -1;
            }
          }
          uint64_t v14 = *(void *)(v1 + 24);
          *(_DWORD *)(v14 + 4) = v9;
          *(_DWORD *)(v14 + 8) = v10;
          *(unsigned char *)(v1 + 162) = 0;
        }
      }
    }
  }
  return result;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close(void *a1)
{
  unint64_t v3 = a1 + 3;
  uint64_t v2 = (void *)a1[3];
  if (v2 && a1[9])
  {
    skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::calculate_checksums((uint64_t)a1);
    uint64_t v2 = (void *)a1[3];
  }
  if ((unint64_t)v2 + 1 >= 2) {
    int v4 = munmap(v2, a1[4]);
  }
  else {
    int v4 = 0;
  }
  *unint64_t v3 = 0;
  v3[1] = 0;
  int v5 = skit::internal::BlobFile::close((skit::internal::BlobFile *)(a1 + 5)) | v4;
  int v6 = (void *)a1[14];
  if ((unint64_t)v6 + 1 >= 2) {
    v5 |= munmap(v6, a1[15]);
  }
  if (v5) {
    uint64_t result = 0xFFFFFFFFLL;
  }
  else {
    uint64_t result = 0;
  }
  a1[14] = 0;
  a1[15] = 0;
  return result;
}

void *skit::internal::Term::Term(void *a1, __int16 a2, void *__src, uint64_t a4)
{
  unsigned int v7 = a1 + 2;
  *a1 = a1 + 2;
  a1[1] = 0x1800000000;
  size_t v8 = 2 * a4;
  unsigned int v9 = 2 * a4 + 2;
  if (v9 >= 0x19)
  {
    skit::SmallVector<std::byte,24u,false>::_reserve_more((uint64_t)a1, (2 * a4 + 2));
    unsigned int v7 = (_WORD *)*a1;
  }
  *((_DWORD *)a1 + 2) = v9;
  _WORD *v7 = a2;
  memcpy((void *)(*a1 + 2), __src, v8);
  return a1;
}

void sub_1D2EE8CA8(_Unwind_Exception *exception_object)
{
  if (*v1 != v2) {
    free(*v1);
  }
  _Unwind_Resume(exception_object);
}

unint64_t std::__string_view_hash<char16_t>::operator()[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  unint64_t v2 = 2 * a2;
  if ((unint64_t)(2 * a2) > 0x20)
  {
    if (v2 <= 0x40)
    {
      int v6 = (char *)a1 + v2;
      uint64_t v7 = *(uint64_t *)((char *)a1 + v2 - 16);
      uint64_t v8 = *(uint64_t *)((char *)a1 + v2 - 8);
      uint64_t v9 = *a1 - 0x3C5A37A36834CED9 * (v7 + v2);
      uint64_t v11 = a1[2];
      uint64_t v10 = a1[3];
      uint64_t v12 = __ROR8__(v9 + v10, 52);
      uint64_t v13 = __ROR8__(v9, 37);
      uint64_t v14 = v9 + a1[1];
      uint64_t v15 = __ROR8__(v14, 7);
      uint64_t v16 = v14 + v11;
      uint64_t v17 = v15 + v13;
      uint64_t v18 = *((void *)v6 - 4) + v11;
      uint64_t v19 = v8 + v10;
      uint64_t v20 = __ROR8__(v19 + v18, 52);
      uint64_t v21 = v17 + v12;
      uint64_t v22 = __ROR8__(v18, 37);
      uint64_t v23 = *((void *)v6 - 3) + v18;
      uint64_t v24 = __ROR8__(v23, 7);
      uint64_t v25 = v21 + __ROR8__(v16, 31);
      uint64_t v26 = v23 + v7;
      uint64_t v27 = v26 + v19;
      uint64_t v28 = v16 + v10 + v22 + v24 + v20 + __ROR8__(v26, 31);
      unint64_t v29 = 0x9AE16A3B2F90404FLL;
      unint64_t v30 = v25
          - 0x3C5A37A36834CED9
          * ((0xC3A5C85C97CB3127 * (v27 + v25) - 0x651E95C4D06FBFB1 * v28) ^ ((0xC3A5C85C97CB3127 * (v27 + v25)
                                                                                 - 0x651E95C4D06FBFB1 * v28) >> 47));
      return (v30 ^ (v30 >> 47)) * v29;
    }
    unint64_t v5 = 0x9DDFEA08EB382D69;
    uint64_t v37 = *(uint64_t *)((char *)a1 + v2 - 48);
    uint64_t v38 = *(uint64_t *)((char *)a1 + v2 - 40);
    uint64_t v39 = *(uint64_t *)((char *)a1 + v2 - 24);
    uint64_t v41 = *(uint64_t *)((char *)a1 + v2 - 64);
    uint64_t v40 = *(uint64_t *)((char *)a1 + v2 - 56);
    uint64_t v42 = *(uint64_t *)((char *)a1 + v2 - 16);
    uint64_t v43 = *(uint64_t *)((char *)a1 + v2 - 8);
    unint64_t v44 = v40 + v42;
    unint64_t v45 = 0x9DDFEA08EB382D69
        * (v39 ^ ((0x9DDFEA08EB382D69 * (v39 ^ (v37 + v2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v39 ^ (v37 + v2))));
    unint64_t v46 = 0x9DDFEA08EB382D69 * (v45 ^ (v45 >> 47));
    unint64_t v47 = v41 + v2 + v40 + v37;
    uint64_t v48 = v47 + v38;
    unint64_t v49 = __ROR8__(v47, 44) + v41 + v2 + __ROR8__(v38 + v41 + v2 - 0x622015F714C7D297 * (v45 ^ (v45 >> 47)), 21);
    uint64_t v50 = v40 + v42 + *(uint64_t *)((char *)a1 + v2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v51 = v50 + v39 + v42;
    uint64_t v52 = __ROR8__(v51, 44);
    uint64_t v53 = v51 + v43;
    uint64_t v54 = v52 + v50 + __ROR8__(v50 + v38 + v43, 21);
    uint64_t v56 = *a1;
    uint64_t v55 = a1 + 4;
    unint64_t v57 = v56 - 0x4B6D499041670D8DLL * v38;
    uint64_t v58 = -(uint64_t)((v2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v59 = *(v55 - 3);
      uint64_t v60 = v57 + v48 + v44 + v59;
      uint64_t v61 = v55[2];
      uint64_t v62 = v55[3];
      uint64_t v63 = v55[1];
      unint64_t v44 = v63 + v48 - 0x4B6D499041670D8DLL * __ROR8__(v44 + v49 + v61, 42);
      uint64_t v64 = v46 + v53;
      uint64_t v65 = *(v55 - 2);
      uint64_t v66 = *(v55 - 1);
      uint64_t v67 = *(v55 - 4) - 0x4B6D499041670D8DLL * v49;
      uint64_t v68 = v67 + v53 + v66;
      uint64_t v69 = v67 + v59 + v65;
      uint64_t v48 = v69 + v66;
      uint64_t v70 = __ROR8__(v69, 44) + v67;
      unint64_t v71 = (0xB492B66FBE98F273 * __ROR8__(v60, 37)) ^ v54;
      unint64_t v57 = 0xB492B66FBE98F273 * __ROR8__(v64, 33);
      unint64_t v49 = v70 + __ROR8__(v68 + v71, 21);
      unint64_t v72 = v57 + v54 + *v55;
      uint64_t v53 = v72 + v63 + v61 + v62;
      uint64_t v54 = __ROR8__(v72 + v63 + v61, 44) + v72 + __ROR8__(v44 + v65 + v72 + v62, 21);
      v55 += 8;
      unint64_t v46 = v71;
      v58 += 64;
    }
    while (v58);
    unint64_t v73 = 0x9DDFEA08EB382D69
        * (v53 ^ ((0x9DDFEA08EB382D69 * (v53 ^ v48)) >> 47) ^ (0x9DDFEA08EB382D69 * (v53 ^ v48)));
    uint64_t v74 = v71 - 0x4B6D499041670D8DLL * (v44 ^ (v44 >> 47)) - 0x622015F714C7D297 * (v73 ^ (v73 >> 47));
    unint64_t v75 = v57
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v54 ^ ((0x9DDFEA08EB382D69 * (v54 ^ v49)) >> 47) ^ (0x9DDFEA08EB382D69 * (v54 ^ v49)))) ^ ((0x9DDFEA08EB382D69 * (v54 ^ ((0x9DDFEA08EB382D69 * (v54 ^ v49)) >> 47) ^ (0x9DDFEA08EB382D69 * (v54 ^ v49)))) >> 47));
    unint64_t v76 = 0x9DDFEA08EB382D69
        * (v75 ^ ((0x9DDFEA08EB382D69 * (v75 ^ v74)) >> 47) ^ (0x9DDFEA08EB382D69 * (v75 ^ v74)));
    goto LABEL_13;
  }
  if (v2 > 0x10)
  {
    uint64_t v31 = a1[1];
    unint64_t v32 = 0xB492B66FBE98F273 * *a1;
    uint64_t v33 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + v2 - 8), 30) + __ROR8__(v32 - v31, 43);
    unint64_t v34 = v32 + v2 + __ROR8__(v31 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + v2 - 8);
    uint64_t v35 = v34 ^ (v33 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + v2 - 16));
    unint64_t v29 = 0x9DDFEA08EB382D69;
    unint64_t v36 = v34 ^ ((0x9DDFEA08EB382D69 * v35) >> 47) ^ (0x9DDFEA08EB382D69 * v35);
LABEL_8:
    unint64_t v30 = 0x9DDFEA08EB382D69 * v36;
    return (v30 ^ (v30 >> 47)) * v29;
  }
  if (v2 < 9)
  {
    if (v2 >= 4)
    {
      uint64_t v78 = *(unsigned int *)((char *)a1 + v2 - 4);
      unint64_t v79 = (v2 + (8 * *(_DWORD *)a1)) ^ v78;
      unint64_t v29 = 0x9DDFEA08EB382D69;
      unint64_t v36 = v78 ^ ((0x9DDFEA08EB382D69 * v79) >> 47) ^ (0x9DDFEA08EB382D69 * v79);
      goto LABEL_8;
    }
    unint64_t v5 = 0x9AE16A3B2F90404FLL;
    if (a1 == (uint64_t *)((char *)a1 + 2 * a2)) {
      return v5;
    }
    unint64_t v76 = (0xC949D7C7509E6557 * (v2 + 4 * *((unsigned __int8 *)a1 + v2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (v2 >> 1)) << 8)));
LABEL_13:
    v5 *= v76 ^ (v76 >> 47);
    return v5;
  }
  uint64_t v3 = *(uint64_t *)((char *)a1 + v2 - 8);
  uint64_t v4 = __ROR8__(v3 + v2, v2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *a1)))) >> 47))) ^ v3;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,void *>>>>::reset[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(void *)a1 = 0;
  if (v1)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<skit::internal::Term const,skit::internal::PostingListMemImplV2>,0>((uint64_t)v1 + 16);
    }
    operator delete(v1);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<skit::internal::Term const,skit::internal::PostingListMemImplV2>,0>(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 104);
  if (v2)
  {
    *(void *)(a1 + 112) = v2;
    operator delete(v2);
  }
  uint64_t v3 = *(void **)(a1 + 80);
  if (v3)
  {
    *(void *)(a1 + 88) = v3;
    operator delete(v3);
  }
  uint64_t v4 = *(void **)a1;
  if (*(void *)a1 != a1 + 16)
  {
    free(v4);
  }
}

void *skit::SmallVector<std::byte,24u,false>::allocate(size_t size)
{
  uint64_t result = malloc_type_malloc(size, 0x100004077774924uLL);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    uint64_t v3 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v3, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
  }
  return result;
}

size_t skit::SmallVector<std::byte,24u,false>::_reserve_more(uint64_t a1, size_t size)
{
  uint64_t v3 = skit::SmallVector<std::byte,24u,false>::allocate(size);
  uint64_t v4 = *(char **)a1;
  uint64_t v5 = *(unsigned int *)(a1 + 8);
  if (v5)
  {
    int v6 = v3;
    do
    {
      char v7 = *v4++;
      *v6++ = v7;
      --v5;
    }
    while (v5);
    uint64_t v4 = *(char **)a1;
  }
  if (v4 != (char *)(a1 + 16)) {
    free(v4);
  }
  *(void *)a1 = v3;
  size_t result = malloc_size(v3);
  *(_DWORD *)(a1 + 12) = result;
  return result;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvStore(uint64_t a1, long long *a2, uint64_t a3, uint64_t a4)
{
  long long v5 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v5;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_DWORD *)(a1 + 64) = -1;
  *(_OWORD *)(a1 + 72) = xmmword_1D2F00770;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 136) = a3;
  *(void *)(a1 + 144) = a4;
  *(void *)(a1 + 152) = 0xFFFFFFFF00000000;
  *(_WORD *)(a1 + 160) = 416;
  *(unsigned char *)(a1 + 162) = 0;
  std::string::append[abi:ne180100]<char const*,0>((std::string *)a1, (std::string *)".tbl", (std::string *)"");
  unint64_t v6 = *(void *)(a1 + 144);
  if (v6 >= 0xA00000) {
    unint64_t v6 = 10485760;
  }
  *(void *)(a1 + 144) = v6;
  *(_DWORD *)(a1 + 152) = (v6 + 0x1FFFFFFFFD8) >> 9;
  return a1;
}

void sub_1D2EE9348(_Unwind_Exception *a1)
{
  skit::internal::BlobFile::~BlobFile((skit::internal::BlobFile *)(v1 + 40));
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(a1);
}

void skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::set_dp_class(uint64_t a1, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if ((a2 - 8) <= 0xFFFFFFF6)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v4 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
    {
      v5[0] = 67109120;
      v5[1] = a2;
      _os_log_fault_impl(&dword_1D2EDA000, v4, OS_LOG_TYPE_FAULT, "KvStore : invalid protection class %d", (uint8_t *)v5, 8u);
    }
  }
  *(_DWORD *)(a1 + 156) = a2;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::rehash(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (*(_DWORD *)(v2 + 20) >= (float)(*(float *)(v2 + 28) * (float)a2)) {
    return 0;
  }
  unsigned int v4 = *(_DWORD *)(v2 + 16);
  unsigned int v5 = *(_DWORD *)(a1 + 152);
  if (v4 >= v5) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v6 = (a2 + 63) >> 6;
  if (v5 >= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v27 = *(std::string *)a1;
  }
  std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(&__replacement.__pn_, (std::string *)".tmp");
  std::__fs::filesystem::path::replace_extension((std::__fs::filesystem::path *)&v27, &__replacement);
  if (SHIBYTE(__replacement.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__replacement.__pn_.__r_.__value_.__l.__data_);
  }
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v9 = &v27;
  }
  else {
    uint64_t v9 = (std::string *)v27.__r_.__value_.__r.__words[0];
  }
  int v10 = open_dprotected_np((const char *)v9, 1538, *(_DWORD *)(a1 + 156), 0, *(unsigned __int16 *)(a1 + 160));
  int v11 = v10;
  size_t v12 = (v7 << 9) | 0x28;
  if (v10 == -1)
  {
    uint64_t v14 = 0;
LABEL_32:
    close(v11);
    goto LABEL_33;
  }
  if (ftruncate(v10, (v7 << 9) | 0x28))
  {
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v15 = mmap(0, (v7 << 9) | 0x28, 3, *(_DWORD *)(a1 + 136) | 1u, v11, 0);
    uint64_t v14 = (uint64_t)v15;
    if (v15 != (void *)-1 && !madvise(v15, (v7 << 9) | 0x28, 1))
    {
      skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::KvTableImpl(v14, v7);
      uint64_t v16 = *(void *)(a1 + 24);
      if (*(_DWORD *)(v16 + 16))
      {
        unint64_t v17 = 0;
        uint64_t v18 = *(void *)(a1 + 24);
        do
        {
          for (uint64_t i = 0; i != 256; i += 4)
          {
            unsigned int v20 = *(_DWORD *)(v18 + i + 40);
            if (v20 != -2)
            {
              if (v20 == -1) {
                break;
              }
              __dmb(9u);
              int v28 = *(_DWORD *)(v18 + i + 296);
              unsigned int v29 = v20;
              __replacement.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&v29;
              __replacement.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)&v28;
              skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::foreach_bucket<skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::insert_offset(int,unsigned int)::{lambda(skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvBucket &)#1}>(v14, v20, (unsigned int **)&__replacement);
            }
          }
          ++v17;
          v18 += 512;
        }
        while (v17 < *(unsigned int *)(v16 + 16));
        uint64_t v16 = *(void *)(a1 + 24);
      }
      *(_DWORD *)(v14 + 12) = *(_DWORD *)(v16 + 12);
      *(void *)(v14 + 20) = *(void *)(v16 + 20);
      if (!close(v11))
      {
        munmap(*(void **)(a1 + 24), *(void *)(a1 + 32));
        if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v24 = (const std::__fs::filesystem::path *)&v27;
        }
        else {
          uint64_t v24 = (const std::__fs::filesystem::path *)v27.__r_.__value_.__r.__words[0];
        }
        uint64_t v25 = (const std::__fs::filesystem::path *)a1;
        if (*(char *)(a1 + 23) < 0) {
          uint64_t v25 = *(const std::__fs::filesystem::path **)a1;
        }
        rename(v24, v25, v23);
        uint64_t v8 = 0;
        *(void *)(a1 + 24) = v14;
        *(void *)(a1 + 32) = v12;
        *(unsigned char *)(a1 + 162) = 1;
        goto LABEL_39;
      }
    }
  }
  if (v11) {
    goto LABEL_32;
  }
LABEL_33:
  if ((unint64_t)(v14 + 1) >= 2) {
    munmap((void *)v14, v12);
  }
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v21 = (const std::__fs::filesystem::path *)&v27;
  }
  else {
    uint64_t v21 = (const std::__fs::filesystem::path *)v27.__r_.__value_.__r.__words[0];
  }
  remove(v21, v13);
  uint64_t v8 = 0xFFFFFFFFLL;
LABEL_39:
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  return v8;
}

void sub_1D2EE972C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::put(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v7 = *(_DWORD *)(v3 + 16) << 6;
  if (!v7 || (float)(*(float *)(v3 + 28) * (float)v7) < (float)(*(_DWORD *)(v3 + 20) + 1))
  {
    if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::rehash(a1, (v7 + (v7 >> 1)) | 1))return 0xFFFFFFFFLL; {
  }
    }
  uint64_t v8 = *(void *)(a2 + 8);
  size_t v9 = (2 * v8 + 8);
  ((void (*)(void))MEMORY[0x1F4188790])();
  int v10 = &v20[-((v9 + 15) & 0x1FFFFFFF0)];
  bzero(v10, v9);
  size_t v12 = *(skit::internal **)a2;
  v10[2] = v8;
  int v13 = 6;
  for (uint64_t i = 8; i != 56; i += 16)
    v13 += *(_DWORD *)((char *)a3 + i);
  *(_DWORD *)int v10 = 2 * v8 + v13 + 2;
  if (v8) {
    int v11 = memmove(v10 + 3, v12, 2 * v8);
  }
  v10[v8 + 3] = 0;
  if (*(void *)(a1 + 72) + (unint64_t)*(unsigned int *)v10 > *(void *)(a1 + 80)) {
    return 0xFFFFFFFFLL;
  }
  MEMORY[0x1F4188790](v11, v12);
  *(void *)&v20[-64] = v10;
  *(void *)&v20[-56] = v9;
  long long v16 = a3[1];
  *(_OWORD *)&v20[-48] = *a3;
  *(_OWORD *)&v20[-32] = v16;
  *(_OWORD *)&v20[-16] = a3[2];
  skit::internal::BlobFile::append((skit::internal::BlobFile *)v20, (const iovec *)(a1 + 40), (iovec *)&v20[-64], 4u);
  if (v22) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v17 = *(void *)(a1 + 24);
  int v18 = skit::internal::murmur3_32(*(skit::internal **)a2, 2 * *(void *)(a2 + 8), *(_DWORD *)(v17 + 12));
  uint64_t v19 = v21;
  if ((skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::insert_value(v17, v18 & 0x7FFFFFFF, v21) & 1) == 0)
  {
    skit::internal::BlobFile::resize((skit::internal::BlobFile *)(a1 + 40), *(void *)(a1 + 72) - v19);
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  *(unsigned char *)(a1 + 162) = 1;
  return result;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::flush(uint64_t a1, char a2)
{
  uint64_t v3 = a1;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 24)
    && (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::calculate_checksums(a1),
        msync(*(void **)(v3 + 24), *(void *)(v3 + 32), 1)))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    unsigned int v5 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(v3 + 23) < 0) {
        uint64_t v3 = *(void *)v3;
      }
      int v6 = *__error();
      int v7 = 136446466;
      uint64_t v8 = v3;
      __int16 v9 = 1024;
      int v10 = v6;
      _os_log_error_impl(&dword_1D2EDA000, v5, OS_LOG_TYPE_ERROR, "BlobFile::resize : msync for kv table file failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v7, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  else if (skit::internal::BlobFile::flush((skit::internal::BlobFile *)(v3 + 40), a2))
  {
    return 0xFFFFFFFFLL;
  }
  else
  {
    return 0;
  }
}

void skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::clear(uint64_t a1)
{
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close((void *)a1);
  uint64_t v3 = (const std::__fs::filesystem::path *)a1;
  if (*(char *)(a1 + 23) < 0) {
    uint64_t v3 = *(const std::__fs::filesystem::path **)a1;
  }
  remove(v3, v2);
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v7, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v7 = *(std::string *)a1;
  }
  std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(&__replacement.__pn_, (std::string *)".dat");
  unsigned int v4 = std::__fs::filesystem::path::replace_extension((std::__fs::filesystem::path *)&v7, &__replacement);
  if ((v4->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    unsigned int v4 = (std::__fs::filesystem::path *)v4->__pn_.__r_.__value_.__r.__words[0];
  }
  remove(v4, v5);
  if (SHIBYTE(__replacement.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__replacement.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v7.__r_.__value_.__l.__data_);
  }
}

void sub_1D2EE9B64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void **std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](void ***a1)
{
  uint64_t result = *a1;
  *a1 = 0;
  if (result)
  {
    skit::internal::IndexDiskImplV2::~IndexDiskImplV2(result);
    JUMPOUT(0x1D942C720);
  }
  return result;
}

void skit::internal::IndexDiskImplV2::~IndexDiskImplV2(void **this)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close(this))
  {
    uint64_t v2 = "term index";
  }
  else
  {
    if (!skit::internal::DiskMetaStore::close((skit::internal::DiskMetaStore *)(this + 21))) {
      goto LABEL_9;
    }
    uint64_t v2 = "meta store";
  }
  if (skit::internal::get_logging_context(void)::once != -1) {
  uint64_t v3 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446210;
    unsigned int v5 = v2;
    _os_log_error_impl(&dword_1D2EDA000, v3, OS_LOG_TYPE_ERROR, "IndexDiskImplV2::close : %{public}s failed", (uint8_t *)&v4, 0xCu);
  }
LABEL_9:
  skit::internal::DiskMetaStore::close((skit::internal::DiskMetaStore *)(this + 21));
  skit::internal::MmapFile::~MmapFile((skit::internal::MmapFile *)(this + 36));
  if (*((char *)this + 263) < 0) {
    operator delete(this[30]);
  }
  std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)(this + 28), 0);
  skit::internal::MmapFile::~MmapFile((skit::internal::MmapFile *)(this + 24));
  if (*((char *)this + 191) < 0) {
    operator delete(this[21]);
  }

  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore((uint64_t)this);
}

void sub_1D2EE9D8C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void skit::internal::MmapFile::~MmapFile(skit::internal::MmapFile *this)
{
  uint64_t v2 = *(void **)this;
  if (v2) {
    munmap(v2, *((void *)this + 1));
  }
  *(void *)this = 0;
  *((void *)this + 1) = 0;
}

void *std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void **)a1;
  *(void *)a1 = a2;
  if (result) {
    return (void *)munmap(result, *(void *)(a1 + 8));
  }
  return result;
}

void skit::internal::BlobFile::~BlobFile(skit::internal::BlobFile *this)
{
  skit::internal::BlobFile::close(this);
  uint64_t v2 = *((void *)this + 6);
  *((void *)this + 6) = 0;
  if (v2) {
    MEMORY[0x1D942C700](v2, 0x1000C8077774924);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::insert_value(uint64_t a1, unsigned int a2, int a3)
{
  int v5 = *(_DWORD *)(a1 + 24);
  unsigned int v11 = a2;
  int v10 = v5;
  v9[0] = &v11;
  v9[1] = (unsigned int *)&v10;
  int v6 = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::foreach_bucket<skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::insert_offset(int,unsigned int)::{lambda(skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvBucket &)#1}>(a1, a2, v9);
  if ((v6 & 1) == 0)
  {
    int v7 = *(_DWORD *)(a1 + 24) + a3;
    ++*(_DWORD *)(a1 + 20);
    *(_DWORD *)(a1 + 24) = v7;
  }
  return v6 ^ 1u;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::foreach_bucket<skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::insert_offset(int,unsigned int)::{lambda(skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvBucket &)#1}>(uint64_t a1, unsigned int a2, unsigned int **a3)
{
  if (!*(_DWORD *)(a1 + 16)) {
    return 1;
  }
  unint64_t v3 = a2 - a2 / *(_DWORD *)(a1 + 16) * (unint64_t)*(unsigned int *)(a1 + 16);
  unint64_t v4 = v3;
  while (1)
  {
    int v5 = (unsigned int *)(a1 + (v4 << 9) + 40);
    unsigned int v6 = **a3;
    int v7 = *a3[1];
    unsigned int v8 = atomic_load(v5);
    if ((v8 & 0x80000000) != 0) {
      break;
    }
    uint64_t v9 = 0;
    while (v9 != 63)
    {
      uint64_t v10 = v9 + 1;
      unsigned int v11 = atomic_load((unsigned int *)(a1 + 44 + (v4 << 9) + 4 * v9++));
      if ((v11 & 0x80000000) != 0)
      {
        BOOL v12 = (unint64_t)(v10 - 1) < 0x3F;
        goto LABEL_9;
      }
    }
LABEL_13:
    unint64_t v4 = (v4 + 1) % *(unsigned int *)(a1 + 16);
    if (v4 == v3) {
      return 1;
    }
  }
  uint64_t v10 = 0;
  BOOL v12 = 1;
LABEL_9:
  unsigned int v13 = atomic_load(&v5[v10]);
  if (v10 <= 0x3E && v13 == -1) {
    v5[(v10 + 1)] = -1;
  }
  *(_DWORD *)(a1 + (v4 << 9) + 4 * v10 + 296) = v7;
  __dmb(0xBu);
  v5[v10] = v6;
  if (!v12) {
    goto LABEL_13;
  }
  return 0;
}

void skit::internal::IndexWriterImpl::abort_txn(skit::internal::IndexWriterImpl *this)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (*((unsigned char *)this + 528))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v2 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
    {
      unint64_t v3 = (void *)((char *)this + 16);
      if (*((char *)this + 39) < 0) {
        unint64_t v3 = (void *)*v3;
      }
      v4[0] = 68289282;
      v4[1] = 16;
      __int16 v5 = 2098;
      unsigned int v6 = this;
      __int16 v7 = 2082;
      unsigned int v8 = v3;
      _os_log_impl(&dword_1D2EDA000, v2, OS_LOG_TYPE_INFO, "IndexWriterImpl::abort_txn : aborting transaction %{public,uuid_t}.16P @ %{public}s", (uint8_t *)v4, 0x1Cu);
    }
    skit::internal::MultiIndexV2::clear((skit::internal::IndexWriterImpl *)((char *)this + 208));
    skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::clear((uint64_t)this + 40);
    *((_WORD *)this + 264) = 0;
  }
}

uint64_t skit::internal::get_logging_context(skit::internal *this)
{
  if (skit::internal::get_logging_context(void)::once != -1) {
  return skit::internal::get_logging_context(void)::logger;
  }
}

os_log_t skit::internal::anonymous namespace'::initialize_logging_context(skit::internal::_anonymous_namespace_ *this, void *a2)
{
  os_log_t result = os_log_create("com.apple.skit", "SKIT");
  *(void *)this = result;
  return result;
}

uint64_t skit::internal::remove_all(const std::__fs::filesystem::path *this, const char *a2)
{
  if (!this) {
    return 0xFFFFFFFFLL;
  }
  if (result == 20)
  {
    return remove(this, v4);
  }
  return result;
}

uint64_t skit::internal::anonymous namespace'::remove_cb(skit::internal::_anonymous_namespace_ *this, const char *a2, const stat *a3, int a4, FTW *a5)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((*((_WORD *)a2 + 2) & 0x92) != 0)
  {
    switch((int)a3)
    {
      case 0:
      case 5:
      case 6:
        if (unlink((const char *)this)) {
          goto LABEL_14;
        }
        break;
      case 1:
        if (skit::internal::get_logging_context(void)::once != -1) {
        unsigned int v6 = skit::internal::get_logging_context(void)::logger;
        }
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
        {
          int v14 = 136446210;
          uint64_t v15 = this;
          _os_log_fault_impl(&dword_1D2EDA000, v6, OS_LOG_TYPE_FAULT, "remove_all : visiting directory in pre-order traversal : %{public}s", (uint8_t *)&v14, 0xCu);
        }
        break;
      case 2:
        if (skit::internal::get_logging_context(void)::once != -1) {
        uint64_t v7 = skit::internal::get_logging_context(void)::logger;
        }
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136446210;
          uint64_t v15 = this;
          unsigned int v8 = "remove_all : directory cannot be read, skipping removal : %{public}s";
          goto LABEL_24;
        }
        break;
      case 3:
        if (rmdir((const char *)this))
        {
LABEL_14:
          if (*__error() != 2)
          {
            if (skit::internal::get_logging_context(void)::once != -1) {
            uint64_t v9 = skit::internal::get_logging_context(void)::logger;
            }
            if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
            {
              int v10 = *__error();
              int v14 = 136446466;
              uint64_t v15 = this;
              __int16 v16 = 1024;
              int v17 = v10;
              unsigned int v8 = "remove_all : directory cannot be read, skipping removal : %{public}s : %{darwin.errno}d";
              unsigned int v11 = v9;
              uint32_t v12 = 18;
              goto LABEL_25;
            }
          }
        }
        break;
      case 4:
        if (skit::internal::get_logging_context(void)::once != -1) {
        uint64_t v7 = skit::internal::get_logging_context(void)::logger;
        }
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          int v14 = 136446210;
          uint64_t v15 = this;
          unsigned int v8 = "remove_all : directory cannot be read, skipping removal : %{public}s";
          goto LABEL_24;
        }
        break;
      default:
        return 0;
    }
  }
  else
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v7 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315138;
      uint64_t v15 = this;
      unsigned int v8 = "remove_all : file does not have write permission : %s";
LABEL_24:
      unsigned int v11 = v7;
      uint32_t v12 = 12;
LABEL_25:
      _os_log_error_impl(&dword_1D2EDA000, v11, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v14, v12);
    }
  }
  return 0;
}

uint64_t skit::internal::MmapFile::open(skit::internal::MmapFile *this, int a2, int a3, int a4, int a5, size_t a6, off_t a7)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unsigned int v11 = mmap(0, a6, a3, a4, a2, a7);
  uint32_t v12 = v11;
  if (v11 == (void *)-1)
  {
    int v13 = 4;
    int v14 = "mmap";
  }
  else
  {
    uint64_t result = madvise(v11, a6, a5);
    if (!result)
    {
      *(void *)this = v12;
      *((void *)this + 1) = a6;
      return result;
    }
    int v13 = 7;
    int v14 = "madvise";
  }
  int v15 = *__error();
  if (fcntl(a2, 50, v26) == -1) {
    v26[0] = 0;
  }
  if (skit::internal::get_logging_context(void)::once != -1) {
  __int16 v16 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 68158466;
    int v19 = v13;
    __int16 v20 = 2082;
    uint64_t v21 = v14;
    __int16 v22 = 2082;
    uint64_t v23 = v26;
    __int16 v24 = 1024;
    int v25 = v15;
    _os_log_error_impl(&dword_1D2EDA000, v16, OS_LOG_TYPE_ERROR, "MmapFile::open : %{public}.*s failed @ %{public}s : %{darwin.errno}d", buf, 0x22u);
  }
  if (v12 != (void *)-1) {
    munmap(v12, a6);
  }
  return 0xFFFFFFFFLL;
}

uint64_t skit::internal::MmapFile::open(size_t *this, const char *a2, int a3, int a4, int a5, unsigned int a6, int a7, int a8, int a9, size_t a10, unint64_t a11)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  memset(&v24, 0, sizeof(v24));
  if (!a2)
  {
    int v16 = -1;
    int v20 = 10;
    uint64_t v21 = "path check";
    goto LABEL_18;
  }
  int v15 = open_dprotected_np(a2, a3, a4, a5, a6);
  int v16 = v15;
  if (v15 < 0)
  {
    int v20 = 4;
    uint64_t v21 = "open";
    goto LABEL_18;
  }
  if (fstat(v15, &v24))
  {
    int v20 = 5;
    uint64_t v21 = "fstat";
    goto LABEL_18;
  }
  size_t v17 = v24.st_size - a11;
  if (v24.st_size < a11) {
    size_t v17 = 0;
  }
  if (a10 == -1) {
    size_t v18 = v17;
  }
  else {
    size_t v18 = a10;
  }
  if (skit::internal::MmapFile::open((skit::internal::MmapFile *)this, v16, a7, a8, a9, v18, a11))
  {
LABEL_10:
    close(v16);
    return 0xFFFFFFFFLL;
  }
  uint64_t result = close(v16);
  if (result)
  {
    int v20 = 5;
    uint64_t v21 = "close";
LABEL_18:
    if (skit::internal::get_logging_context(void)::once != -1) {
    __int16 v22 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      int v23 = *__error();
      *(_DWORD *)buf = 68158466;
      int v26 = v20;
      __int16 v27 = 2082;
      int v28 = v21;
      __int16 v29 = 2082;
      unint64_t v30 = a2;
      __int16 v31 = 1024;
      int v32 = v23;
      _os_log_error_impl(&dword_1D2EDA000, v22, OS_LOG_TYPE_ERROR, "MmapFile::open : %{public}.*s failed @ %{public}s : %{darwin.errno}d", buf, 0x22u);
    }
    if (*this) {
      munmap((void *)*this, this[1]);
    }
    *this = 0;
    this[1] = 0;
    if (v16 == -1) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_10;
  }
  return result;
}

uint64_t skit::internal::MmapFile::create(size_t *this, const char *a2, size_t a3, off_t a4, int a5, int a6, int a7, unsigned int a8, int a9, int a10, int a11)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!a2)
  {
    int v16 = -1;
    int v18 = 10;
    int v19 = "path check";
    goto LABEL_13;
  }
  int v15 = open_dprotected_np(a2, a5, a6, a7, a8);
  int v16 = v15;
  if (v15 < 0)
  {
    int v18 = 4;
    int v19 = "open";
    goto LABEL_13;
  }
  if (ftruncate(v15, a4 + a3))
  {
    int v18 = 9;
    int v19 = "ftruncate";
    goto LABEL_13;
  }
  if (skit::internal::MmapFile::open((skit::internal::MmapFile *)this, v16, a9, a10, a11, a3, a4))
  {
LABEL_5:
    close(v16);
    return 0xFFFFFFFFLL;
  }
  uint64_t result = close(v16);
  if (result)
  {
    int v18 = 5;
    int v19 = "close";
LABEL_13:
    if (skit::internal::get_logging_context(void)::once != -1) {
    int v20 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      int v21 = *__error();
      *(_DWORD *)buf = 68158466;
      int v23 = v18;
      __int16 v24 = 2082;
      int v25 = v19;
      __int16 v26 = 2082;
      __int16 v27 = a2;
      __int16 v28 = 1024;
      int v29 = v21;
      _os_log_error_impl(&dword_1D2EDA000, v20, OS_LOG_TYPE_ERROR, "MmapFile::create : %{public}.*s failed @ %{public}s : %{darwin.errno}d", buf, 0x22u);
    }
    if (*this) {
      munmap((void *)*this, this[1]);
    }
    *this = 0;
    this[1] = 0;
    if (v16 == -1) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_5;
  }
  return result;
}

uint64_t skit::internal::StringRegistry::lookup(void *a1, unsigned int a2, unsigned __int16 **a3)
{
  uint64_t v3 = a1[3];
  if (!*(_DWORD *)(v3 + 16)) {
    return 0;
  }
  uint64_t v4 = 0;
  uint64_t v5 = a2;
  unint64_t v6 = a2 - a2 / *(_DWORD *)(v3 + 16) * (unint64_t)*(unsigned int *)(v3 + 16);
  unint64_t v7 = v6;
  do
  {
    unint64_t v8 = 0;
    BOOL v9 = 1;
    while (1)
    {
      uint64_t v10 = *(unsigned int *)(v3 + (v7 << 9) + 40 + 4 * v8);
      if (v10 == -1)
      {
LABEL_15:
        uint64_t v13 = v4;
        if (v9) {
          return v13;
        }
        goto LABEL_18;
      }
      if (v10 == v5)
      {
        __dmb(9u);
        uint64_t v11 = *(unsigned int *)(v3 + (v7 << 9) + 4 * v8 + 296);
        unint64_t v12 = a1[15];
        if (v11 + 6 <= v12)
        {
          uint64_t v13 = a1[14] + v11;
          if (v12 >= (*(_DWORD *)v13 + v11))
          {
            int v14 = (unsigned __int16 *)*(unsigned __int16 *)(v13 + 4);
            if (a3[1] == v14) {
              break;
            }
          }
        }
      }
LABEL_14:
      BOOL v9 = v8++ < 0x3F;
      if (v8 == 64) {
        goto LABEL_15;
      }
    }
    if (*(_WORD *)(v13 + 4))
    {
      int v15 = (unsigned __int16 *)(v13 + 6);
      int v16 = *a3;
      while (*v16 == *v15)
      {
        ++v15;
        ++v16;
        int v14 = (unsigned __int16 *)((char *)v14 - 1);
        if (!v14) {
          goto LABEL_17;
        }
      }
      goto LABEL_14;
    }
LABEL_17:
    if (v9) {
      return v13;
    }
LABEL_18:
    unint64_t v7 = (v7 + 1) % *(unsigned int *)(v3 + 16);
    uint64_t v4 = v13;
  }
  while (v7 != v6);
  return v13;
}

BOOL skit::internal::StringRegistry::erase_internal(skit::internal::StringRegistry *this, unsigned int a2)
{
  uint64_t v2 = *((void *)this + 3);
  if (*(_DWORD *)(v2 + 16))
  {
    int v3 = 0;
    uint64_t v4 = a2;
    unint64_t v5 = a2 - a2 / *(_DWORD *)(v2 + 16) * (unint64_t)*(unsigned int *)(v2 + 16);
    unint64_t v6 = v5;
    while (2)
    {
      unint64_t v7 = 0;
      uint64_t v8 = v2 + (v6 << 9);
      BOOL v9 = 1;
      while (1)
      {
        uint64_t v10 = *(unsigned int *)(v8 + 4 * v7 + 40);
        if (v10 == -1)
        {
LABEL_9:
          if (v9) {
            return v3 != 0;
          }
          goto LABEL_10;
        }
        if (v10 == v4)
        {
          __dmb(9u);
          uint64_t v11 = *(unsigned int *)(v8 + 4 * v7 + 296);
          unint64_t v12 = *((void *)this + 15);
          if (v11 + 6 <= v12 && v12 >= (*(_DWORD *)(*((void *)this + 14) + v11) + v11)) {
            break;
          }
        }
        BOOL v9 = v7++ < 0x3F;
        if (v7 == 64) {
          goto LABEL_9;
        }
      }
      *(_DWORD *)(v2 + (v6 << 9) + 4 * v7 + 40) = -2;
      --*(_DWORD *)(*((void *)this + 3) + 20);
      int v3 = 1;
      *((unsigned char *)this + 162) = 1;
      if (v9) {
        return v3 != 0;
      }
LABEL_10:
      unint64_t v6 = (v6 + 1) % *(unsigned int *)(v2 + 16);
      if (v6 != v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    int v3 = 0;
  }
  return v3 != 0;
}

unint64_t skit::internal::StringRegistry::put_str(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  v22[2] = *(unsigned __int16 **)MEMORY[0x1E4F143B8];
  v22[0] = a2;
  v22[1] = a3;
  if (*(void *)(a1 + 24)
    && !skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file(a1))
  {
    int v8 = 2 * a3;
    for (unsigned int i = skit::internal::murmur3_32((skit::internal *)a2, 2 * (void)a3, *(_DWORD *)(*(void *)(a1 + 24) + 12)) & 0x7FFFFFFF; ; ++i)
    {
      uint64_t v9 = skit::internal::StringRegistry::lookup((void *)a1, i, v22);
      if (v9)
      {
        unint64_t v6 = 0;
        return v6 & 0xFFFFFFFF00000000 | i;
      }
      if (!(_BYTE)v10) {
        break;
      }
    }
    if ((v11 = *(void *)(a1 + 24), (unsigned int v12 = *(_DWORD *)(v11 + 16) << 6) != 0)
      && (float)(*(float *)(v11 + 28) * (float)v12) >= (float)(*(_DWORD *)(v11 + 20) + 1)
      || (uint64_t v9 = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::rehash(a1, (v12 + (v12 >> 1)) | 1), !v9))
    {
      MEMORY[0x1F4188790](v9, v10);
      int v14 = (unsigned int *)&v19[-v13];
      bzero(&v19[-v13], (v8 + 8) & 0xFFFFFFFE);
      *((_WORD *)v14 + 2) = (_WORD)a3;
      *int v14 = v8 + 8;
      if (a3) {
        int v15 = memmove((char *)v14 + 6, a2, 2 * (void)a3);
      }
      *((_WORD *)v14 + (void)a3 + 3) = 0;
      if (*(void *)(a1 + 72) + (unint64_t)*v14 <= *(void *)(a1 + 80))
      {
        MEMORY[0x1F4188790](v15, v16);
        *(void *)&v19[-16] = v14;
        *(void *)&v19[-8] = (v8 + 8) & 0xFFFFFFFE;
        skit::internal::BlobFile::append((skit::internal::BlobFile *)v19, (const iovec *)(a1 + 40), (iovec *)&v19[-16], 1u);
        if (!v21)
        {
          uint64_t v17 = v20;
          if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvTableImpl::insert_value(*(void *)(a1 + 24), i, v20))
          {
            unint64_t v6 = 0;
            *(unsigned char *)(a1 + 162) = 1;
            return v6 & 0xFFFFFFFF00000000 | i;
          }
          skit::internal::BlobFile::resize((skit::internal::BlobFile *)(a1 + 40), *(void *)(a1 + 72) - v17);
        }
      }
    }
  }
  unint64_t v6 = 0xFFFFFFFF00000000;
  unsigned int i = -1;
  return v6 & 0xFFFFFFFF00000000 | i;
}

uint64_t skit::internal::StringRegistry::get_str(skit::internal::StringRegistry *this, unsigned int a2)
{
  if (!*((void *)this + 3)) {
    return 0;
  }
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file((uint64_t)this)) {
    return 0;
  }
  uint64_t v5 = *((void *)this + 3);
  if (!*(_DWORD *)(v5 + 16)) {
    return 0;
  }
  uint64_t result = 0;
  unint64_t v6 = a2 - a2 / *(_DWORD *)(v5 + 16) * (unint64_t)*(unsigned int *)(v5 + 16);
  unint64_t v7 = v6;
  while (2)
  {
    unint64_t v8 = 0;
    uint64_t v9 = v5 + (v7 << 9);
    BOOL v10 = 1;
    while (1)
    {
      uint64_t v11 = *(unsigned int *)(v9 + 4 * v8 + 40);
      if (v11 == -1)
      {
LABEL_13:
        if (v10) {
          return result;
        }
        goto LABEL_14;
      }
      if (v11 == a2)
      {
        __dmb(9u);
        uint64_t v12 = *(unsigned int *)(v9 + 4 * v8 + 296);
        unint64_t v13 = *((void *)this + 15);
        if (v12 + 6 <= v13)
        {
          uint64_t v14 = *((void *)this + 14);
          if (v13 >= (*(_DWORD *)(v14 + v12) + v12)) {
            break;
          }
        }
      }
      BOOL v10 = v8++ < 0x3F;
      if (v8 == 64) {
        goto LABEL_13;
      }
    }
    uint64_t result = v14 + v12 + 6;
    if (v10) {
      return result;
    }
LABEL_14:
    unint64_t v7 = (v7 + 1) % *(unsigned int *)(v5 + 16);
    if (v7 != v6) {
      continue;
    }
    return result;
  }
}

BOOL skit::internal::StringRegistry::is_registered(void *a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  v10[0] = a2;
  v10[1] = a3;
  if (!a1[3]
    || skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file((uint64_t)a1))
  {
    return 0;
  }
  for (unsigned int i = skit::internal::murmur3_32((skit::internal *)a2, 2 * (void)a3, *(_DWORD *)(a1[3] + 12)) & 0x7FFFFFFF;
        ;
        ++i)
  {
    uint64_t v8 = skit::internal::StringRegistry::lookup(a1, i, v10);
    BOOL result = v8 != 0;
    if (v8) {
      break;
    }
    if (!v7) {
      return 0;
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<skit::internal::CompressedMetaRecord>>(unint64_t a1)
{
  if (a1 >= 0x199999999999999ALL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(10 * a1);
}

void std::vector<skit::internal::CompressedMetaRecord>::resize(uint64_t a1, unint64_t a2)
{
  int v3 = *(_WORD **)a1;
  uint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = 0xCCCCCCCCCCCCCCCDLL * ((v4 - *(void *)a1) >> 1);
  unint64_t v6 = a2 - v5;
  if (a2 <= v5)
  {
    if (a2 >= v5) {
      return;
    }
    int v21 = &v3[5 * a2];
    goto LABEL_19;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  if (0xCCCCCCCCCCCCCCCDLL * ((v7 - v4) >> 1) >= v6)
  {
    size_t v22 = 10 * ((10 * v6 - 10) / 0xA) + 10;
    bzero(*(void **)(a1 + 8), v22);
    int v21 = (_WORD *)(v4 + v22);
LABEL_19:
    *(void *)(a1 + 8) = v21;
    return;
  }
  if (a2 > 0x1999999999999999) {
    std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - (uint64_t)v3) >> 1);
  uint64_t v9 = 2 * v8;
  if (2 * v8 <= a2) {
    uint64_t v9 = a2;
  }
  if (v8 >= 0xCCCCCCCCCCCCCCCLL) {
    unint64_t v10 = 0x1999999999999999;
  }
  else {
    unint64_t v10 = v9;
  }
  uint64_t v11 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::internal::CompressedMetaRecord>>(v10);
  uint64_t v12 = &v11[10 * v5];
  uint64_t v14 = &v11[10 * v13];
  size_t v15 = 10 * ((10 * v6 - 10) / 0xA) + 10;
  bzero(v12, v15);
  uint64_t v16 = &v12[v15];
  int v18 = *(_WORD **)a1;
  uint64_t v17 = *(_WORD **)(a1 + 8);
  if (v17 != *(_WORD **)a1)
  {
    do
    {
      uint64_t v19 = *(void *)(v17 - 5);
      v17 -= 5;
      __int16 v20 = v17[4];
      *(void *)(v12 - 10) = v19;
      v12 -= 10;
      *((_WORD *)v12 + 4) = v20;
    }
    while (v17 != v18);
    uint64_t v17 = *(_WORD **)a1;
  }
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v16;
  *(void *)(a1 + 16) = v14;
  if (v17)
  {
    operator delete(v17);
  }
}

uint64_t skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::rehash(uint64_t a1, unsigned int a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(_DWORD *)(*(void *)(a1 + 16) + 4) > a2) {
    return 0;
  }
  uint64_t v5 = *(void *)(a1 + 8);
  if (((v5 - 16) / 0x150uLL) < a2)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v19 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      int v20 = *(_DWORD *)(*(void *)(a1 + 16) + 4);
      *(_DWORD *)buf = 67109376;
      unsigned int v25 = a2;
      __int16 v26 = 1024;
      int v27 = v20;
      _os_log_error_impl(&dword_1D2EDA000, v19, OS_LOG_TYPE_ERROR, "FlatSet::rehash : bucket count too large, %u > %u", buf, 0xEu);
    }
    return 0xFFFFFFFFLL;
  }
  skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>(&v22, v5, a2);
  unint64_t v6 = v22;
  if (!v22) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a1 + 16);
  LODWORD(v8) = -1;
  do
    uint64_t v8 = (v8 + 1);
  while (*(char *)(v7 + v8 + 16) < -1);
  unsigned int v9 = 16 * *(_DWORD *)(v7 + 4);
  uint64_t v10 = v9 - 1;
  if (v8 == v10)
  {
    *(void *)(a1 + 16) = v22;
  }
  else
  {
    uint64_t v11 = v7 + 16 + v10;
    uint64_t v12 = v7 + 16 + v8;
    uint64_t v13 = (skit::internal *)(v7 + 16 + v9 + 20 * v8);
    do
    {
      unsigned int v14 = skit::internal::murmur3_32(v13, 0x10uLL, 0);
      skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>::emplace<false,skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::rehash::{lambda(std::pair<skit::Uuid,unsigned int> const&)#1},std::pair<skit::Uuid,unsigned int>>((uint64_t)buf, v6, v14, v13, (long long *)v13);
      if (v28 <= 0)
      {
        if (skit::internal::get_logging_context(void)::once != -1) {
        int v18 = skit::internal::get_logging_context(void)::logger;
        }
        if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)int v21 = 0;
          _os_log_error_impl(&dword_1D2EDA000, v18, OS_LOG_TYPE_ERROR, "FlatSet::rehash : failed to insert item into new hash table", v21, 2u);
        }
        size_t v22 = 0;
        if (v6) {
          v23(v6);
        }
        return 0xFFFFFFFFLL;
      }
      uint64_t v15 = v12;
      do
        int v16 = *(char *)++v15;
      while (v16 < -1);
      uint64_t v13 = (skit::internal *)((char *)v13 + 20 * (v15 - v12));
      uint64_t v12 = v15;
    }
    while (v15 != v11);
    uint64_t v17 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v6;
    if (!v17) {
      goto LABEL_16;
    }
  }
  (*(void (**)(void))(a1 + 24))();
LABEL_16:
  uint64_t result = 0;
  *(void *)(a1 + 24) = v23;
  size_t v22 = 0;
  return result;
}

void sub_1D2EEB54C(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void *skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>(void *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v4 = (a2 - 16) / 0x150uLL;
  if (v4 >= a3) {
    LODWORD(v4) = a3;
  }
  if (a3) {
    int v5 = v4;
  }
  else {
    int v5 = 1;
  }
  unint64_t v6 = malloc_type_aligned_alloc(0x10uLL, (336 * v5 + 16), 0xCAC9F0E5uLL);
  *unint64_t v6 = (unint64_t)(v6 + 4) >> 12;
  v6[1] = v5;
  *((void *)v6 + 1) = 0xF00000000;
  size_t v7 = (16 * v5);
  uint64_t result = memset(v6 + 4, 128, v7);
  *((unsigned char *)v6 + (v7 - 1) + 16) = -1;
  *a1 = v6;
  a1[1] = skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>const::{lambda(skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>*)#1}::__invoke;
  return result;
}

uint64_t skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>::emplace<false,skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::rehash(unsigned int)::{lambda(std::pair<skit::Uuid,unsigned int> const&)#1},std::pair<skit::Uuid,unsigned int>>(uint64_t result, _DWORD *a2, unsigned int a3, void *a4, long long *a5)
{
  unsigned int v5 = a2[1];
  int v6 = a3 & 0x7F;
  uint64_t v7 = 16 * ((*a2 ^ (a3 >> 7)) % v5);
  unint64_t v8 = 16 * v5;
  unsigned int v9 = (char *)&a2[v8 / 4 + 4];
  for (unsigned int i = v7; ; unsigned int i = ((int)v11 + 1) % v8)
  {
    uint64_t v11 = i;
    int v12 = *((unsigned __int8 *)a2 + i + 16);
    if (v12 == v6)
    {
      uint64_t v13 = &v9[20 * i];
      if (*a4 == *(void *)v13 && a4[1] == *((void *)v13 + 1))
      {
        int v19 = 0;
        goto LABEL_13;
      }
    }
    if (v12 == 128) {
      break;
    }
  }
  uint64_t v15 = (char *)a2 + v7;
  int v17 = v15[16];
  int v16 = v15 + 16;
  if (v17 >= -1)
  {
    do
    {
      uint64_t v7 = ((int)v7 + 1) % v8;
      int v16 = (char *)a2 + v7 + 16;
    }
    while ((char)*v16 > -2);
  }
  uint64_t v13 = &v9[20 * v7];
  long long v18 = *a5;
  *((_DWORD *)v13 + 4) = *((_DWORD *)a5 + 4);
  *(_OWORD *)uint64_t v13 = v18;
  *int v16 = v6;
  ++a2[2];
  int v19 = 1;
  uint64_t v11 = v7;
LABEL_13:
  *(void *)uint64_t result = (char *)a2 + v11 + 16;
  *(void *)(result + 8) = v13;
  *(_DWORD *)(result + 16) = v19;
  return result;
}

BOOL skit::internal::MemMetaStore::set_doc_wgt(uint64_t a1, skit::internal *this, float a3)
{
  int v6 = *(_DWORD **)(a1 + 88);
  unsigned int v7 = skit::internal::murmur3_32(this, 0x10uLL, 0);
  unsigned int v8 = v6[1];
  unsigned int v9 = 16 * ((*v6 ^ (v7 >> 7)) % v8);
  unint64_t v10 = 16 * v8;
  uint64_t v11 = (uint64_t)&v6[v10 / 4 + 4];
  while (1)
  {
    uint64_t v12 = v9;
    int v13 = *((unsigned __int8 *)v6 + v9 + 16);
    if (v13 == (v7 & 0x7F))
    {
      unsigned int v14 = (uint64_t *)(v11 + 20 * v12);
      uint64_t v16 = *v14;
      uint64_t v15 = v14[1];
      if (*(void *)this == v16 && *((void *)this + 1) == v15) {
        break;
      }
    }
    if (v13 == 128) {
      return 0;
    }
    unsigned int v9 = ((int)v12 + 1) % v10;
  }
  uint64_t v19 = (v10 - 1);
  BOOL result = v19 != v12;
  if (v19 != v12)
  {
    int v20 = (__int16 *)(*(void *)(a1 + 48) + 10 * *(unsigned int *)(v11 + 20 * v12 + 16));
    _H0 = *v20;
    __asm { FCVT            S0, H0 }
    if (_S0 >= 0.00000011921)
    {
      float v26 = 65504.0;
      if (a3 <= 65504.0) {
        float v26 = a3;
      }
      _S0 = 0.0;
      if (a3 >= 0.0) {
        _S0 = v26;
      }
      if (_S0 < 0.00000011921)
      {
        ++*(_DWORD *)(a1 + 16);
        _S0 = 0.0;
      }
      __asm { FCVT            H0, S0 }
      *int v20 = _H0;
    }
  }
  return result;
}

uint64_t skit::internal::MemMetaStore::write(skit::internal::MemMetaStore *this, std::__fs::filesystem::path *a2, int a3, unsigned int a4)
{
  int v6 = a2;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v51.iov_base = this;
  v51.size_t iov_len = 48;
  uint64_t v8 = *((void *)this + 7) - *((void *)this + 6);
  uint64_t v52 = *((void *)this + 6);
  uint64_t v53 = v8;
  std::string::append(&a2->__pn_, ".ms", 3uLL);
  if (SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&pn, v6->__pn_.__r_.__value_.__l.__data_, v6->__pn_.__r_.__value_.__l.__size_);
  }
  else {
    std::string pn = v6->__pn_;
  }
  iovec v43 = *(iovec *)&pn.__r_.__value_.__l.__data_;
  std::string::size_type v44 = pn.__r_.__value_.__r.__words[2];
  memset(&pn, 0, sizeof(pn));
  int v45 = -1;
  long long v46 = xmmword_1D2F00770;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  if ((skit::internal::BlobFile::open((skit::internal::BlobFile *)&v43, 1538, a3, a4) & 0x80000000) != 0) {
    goto LABEL_48;
  }
  skit::internal::BlobFile::append((skit::internal::BlobFile *)&__replacement, &v43, &v51, 2u);
  if ((__replacement.__pn_.__r_.__value_.__r.__words[2] & 0x80000000) != 0
    || (skit::internal::BlobFile::flush((skit::internal::BlobFile *)&v43, 0) & 0x80000000) != 0
    || (skit::internal::BlobFile::close((skit::internal::BlobFile *)&v43) & 0x80000000) != 0)
  {
    goto LABEL_48;
  }
  if (!*(_DWORD *)(*((void *)this + 11) + 8))
  {
LABEL_18:
    uint64_t v15 = 0;
    goto LABEL_53;
  }
  uint64_t v40 = ".xid";
  uint64_t v41 = 4;
  std::__fs::filesystem::path::path[abi:ne180100]<std::string_view,void>(&__replacement.__pn_, (uint64_t)&v40);
  std::__fs::filesystem::path::replace_extension(v6, &__replacement);
  if (SHIBYTE(__replacement.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__replacement.__pn_.__r_.__value_.__l.__data_);
  }
  if ((v6->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unint64_t v10 = (const char *)v6;
  }
  else {
    unint64_t v10 = (const char *)v6->__pn_.__r_.__value_.__r.__words[0];
  }
  int v11 = open_dprotected_np(v10, 1538, a3, 0, a4);
  int v12 = v11;
  if (v11 < 0)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v16 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    int v17 = SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]);
    std::string::size_type v18 = v6->__pn_.__r_.__value_.__r.__words[0];
    uint64_t v19 = __error();
    if (v17 >= 0) {
      std::string::size_type v20 = (std::string::size_type)v6;
    }
    else {
      std::string::size_type v20 = v18;
    }
    int v21 = *v19;
    LODWORD(__replacement.__pn_.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__replacement.__pn_.__r_.__value_.__r.__words + 4) = v20;
    WORD2(__replacement.__pn_.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__replacement.__pn_.__r_.__value_.__r.__words[1] + 6) = v21;
    size_t v22 = "FlatSet::write : file open failed @ %{public}s : %{darwin.errno}d";
    goto LABEL_47;
  }
  int v13 = (_DWORD *)*((void *)this + 11);
  size_t v14 = (336 * v13[1] + 16);
  if (write(v11, v13, v14) != v14)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v16 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    int v23 = SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]);
    std::string::size_type v24 = v6->__pn_.__r_.__value_.__r.__words[0];
    unsigned int v25 = __error();
    if (v23 >= 0) {
      std::string::size_type v26 = (std::string::size_type)v6;
    }
    else {
      std::string::size_type v26 = v24;
    }
    int v27 = *v25;
    LODWORD(__replacement.__pn_.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__replacement.__pn_.__r_.__value_.__r.__words + 4) = v26;
    WORD2(__replacement.__pn_.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__replacement.__pn_.__r_.__value_.__r.__words[1] + 6) = v27;
    size_t v22 = "FlatSet::write : failed to write table to %{public}s : %{darwin.errno}d";
    goto LABEL_47;
  }
  if (fsync(v12))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v16 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_48;
    }
    int v28 = SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]);
    std::string::size_type v29 = v6->__pn_.__r_.__value_.__r.__words[0];
    uint64_t v30 = __error();
    if (v28 >= 0) {
      std::string::size_type v31 = (std::string::size_type)v6;
    }
    else {
      std::string::size_type v31 = v29;
    }
    int v32 = *v30;
    LODWORD(__replacement.__pn_.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__replacement.__pn_.__r_.__value_.__r.__words + 4) = v31;
    WORD2(__replacement.__pn_.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__replacement.__pn_.__r_.__value_.__r.__words[1] + 6) = v32;
    size_t v22 = "FlatSet::write : failed on file flush %{public}s : %{darwin.errno}d";
    goto LABEL_47;
  }
  if (!close(v12)) {
    goto LABEL_18;
  }
  if (skit::internal::get_logging_context(void)::once != -1) {
  uint64_t v16 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    int v33 = SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]);
    std::string::size_type v34 = v6->__pn_.__r_.__value_.__r.__words[0];
    uint64_t v35 = __error();
    if (v33 >= 0) {
      std::string::size_type v36 = (std::string::size_type)v6;
    }
    else {
      std::string::size_type v36 = v34;
    }
    int v37 = *v35;
    LODWORD(__replacement.__pn_.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__replacement.__pn_.__r_.__value_.__r.__words + 4) = v36;
    WORD2(__replacement.__pn_.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__replacement.__pn_.__r_.__value_.__r.__words[1] + 6) = v37;
    size_t v22 = "FlatSet::write : failed on file close %{public}s : %{darwin.errno}d";
LABEL_47:
    _os_log_error_impl(&dword_1D2EDA000, v16, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&__replacement, 0x12u);
  }
LABEL_48:
  skit::internal::BlobFile::clear((skit::internal::BlobFile *)&v43, v9);
  uint64_t v40 = ".xid";
  uint64_t v41 = 4;
  std::__fs::filesystem::path::path[abi:ne180100]<std::string_view,void>(&__replacement.__pn_, (uint64_t)&v40);
  std::__fs::filesystem::path::replace_extension(v6, &__replacement);
  if (SHIBYTE(__replacement.__pn_.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__replacement.__pn_.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v6->__pn_.__r_.__value_.__r.__words[2]) < 0) {
    int v6 = (std::__fs::filesystem::path *)v6->__pn_.__r_.__value_.__r.__words[0];
  }
  remove(v6, v38);
  uint64_t v15 = 0xFFFFFFFFLL;
LABEL_53:
  skit::internal::BlobFile::~BlobFile((skit::internal::BlobFile *)&v43);
  return v15;
}

void sub_1D2EEBD2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  if (*(char *)(v9 - 89) < 0) {
    operator delete(*(void **)(v9 - 112));
  }
  skit::internal::BlobFile::~BlobFile((skit::internal::BlobFile *)va);
  _Unwind_Resume(a1);
}

std::string *std::__fs::filesystem::path::path[abi:ne180100]<std::string_view,void>(std::string *a1, uint64_t a2)
{
  a1->__r_.__value_.__r.__words[0] = 0;
  a1->__r_.__value_.__l.__size_ = 0;
  a1->__r_.__value_.__r.__words[2] = 0;
  std::string::append[abi:ne180100]<char const*,0>(a1, *(std::string **)a2, (std::string *)(*(void *)a2 + *(void *)(a2 + 8)));
  return a1;
}

void sub_1D2EEBDBC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

unint64_t skit::internal::DiskMetaStore::get_doc_internal(skit::internal::DiskMetaStore *this, unsigned int a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *((void *)this + 5);
  _H0 = *(_WORD *)(v2 + 10 * a2);
  __asm { FCVT            S0, H0 }
  if (_S0 >= 0.00000011921)
  {
    uint64_t v10 = v2 + 10 * a2;
    unsigned int v13 = *(_DWORD *)(v10 + 2);
    int v12 = (int *)(v10 + 2);
    unint64_t v11 = v13;
    if (v13 != -1)
    {
      unint64_t v15 = *((void *)this + 16);
      if (v15 > v11 && v15 >= (*(_DWORD *)(v2 + 10 * a2 + 6) + v11)) {
        return *((void *)this + 15) + v11;
      }
      if (skit::internal::get_logging_context(void)::once != -1) {
      int v17 = skit::internal::get_logging_context(void)::logger;
      }
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
      {
        int v18 = *v12;
        int v19 = *(_DWORD *)(v2 + 10 * a2 + 6);
        uint64_t v20 = *((void *)this + 16);
        v21[0] = 67109632;
        v21[1] = v18;
        __int16 v22 = 1024;
        int v23 = v19;
        __int16 v24 = 2048;
        uint64_t v25 = v20;
        _os_log_fault_impl(&dword_1D2EDA000, v17, OS_LOG_TYPE_FAULT, "DiskMetaStore::populate_doc : Invalid record offset/size : record=(%u, %u), doc_store_file_size=%lu", (uint8_t *)v21, 0x18u);
      }
    }
  }
  return 0;
}

void *skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::create_mmap(uint64_t a1, int a2, size_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = mmap(0, a3, 3, *(_DWORD *)(a1 + 56) | 1u, a2, 0);
  if (v6 == (void *)-1)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v9 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = (void *)(a1 + 24);
      if (*(char *)(a1 + 47) < 0) {
        uint64_t v10 = (void *)*v10;
      }
      int v11 = *__error();
      int v18 = 136446466;
      int v19 = v10;
      __int16 v20 = 1024;
      int v21 = v11;
      _os_log_error_impl(&dword_1D2EDA000, v9, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_mmap : mmap failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v18, 0x12u);
    }
  }
  else
  {
    unsigned int v7 = v6;
    if (!madvise(v6, a3, *(_DWORD *)(a1 + 60))) {
      goto LABEL_3;
    }
    if (skit::internal::get_logging_context(void)::once != -1) {
    unsigned int v13 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = (void *)(a1 + 24);
      if (*(char *)(a1 + 47) < 0) {
        uint64_t v16 = (void *)*v16;
      }
      int v17 = *__error();
      int v18 = 136446466;
      int v19 = v16;
      __int16 v20 = 1024;
      int v21 = v17;
      _os_log_error_impl(&dword_1D2EDA000, v13, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_mmap : madvise failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v18, 0x12u);
    }
    munmap(v7, a3);
  }
  unsigned int v7 = 0;
LABEL_3:
  if (close(a2))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    int v12 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      size_t v14 = (void *)(a1 + 24);
      if (*(char *)(a1 + 47) < 0) {
        size_t v14 = (void *)*v14;
      }
      int v15 = *__error();
      int v18 = 136446466;
      int v19 = v14;
      __int16 v20 = 1024;
      int v21 = v15;
      _os_log_error_impl(&dword_1D2EDA000, v12, OS_LOG_TYPE_ERROR, "FlatSetDisk::create_mmap : close failed @ %{public}s : %{darwin.errno}d", (uint8_t *)&v18, 0x12u);
    }
    munmap(v7, a3);
    return 0;
  }
  return v7;
}

uint64_t skit::internal::DiskMetaStore::close(skit::internal::DiskMetaStore *this)
{
  int v3 = (void *)((char *)this + 24);
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2) {
    int v4 = munmap(v2, *((void *)this + 4));
  }
  else {
    int v4 = 0;
  }
  *int v3 = 0;
  v3[1] = 0;
  std::unique_ptr<skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>,skit::FlatSetDisk<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::Deleter>::reset[abi:ne180100]((uint64_t)this + 56, 0);
  unsigned int v5 = (void *)*((void *)this + 15);
  if (v5) {
    LODWORD(v5) = munmap(v5, *((void *)this + 16));
  }
  *((void *)this + 15) = 0;
  *((void *)this + 16) = 0;
  uint64_t result = v5 | v4;
  *((void *)this + 5) = 0;
  return result;
}

void skit::internal::DiskMetaStore::clear(std::string::size_type *this)
{
  skit::internal::DiskMetaStore::close((skit::internal::DiskMetaStore *)this);
  if (*((char *)this + 23) < 0) {
    std::string::__init_copy_ctor_external(&v16, (const std::string::value_type *)*this, this[1]);
  }
  else {
    std::string v16 = *(std::string *)this;
  }
  std::string::append[abi:ne180100]<char const*,0>(&v16, (std::string *)".ms", (std::string *)"");
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v17, v16.__r_.__value_.__l.__data_, v16.__r_.__value_.__l.__size_);
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v17 = v16;
  }
  if (*((char *)this + 23) < 0) {
    std::string::__init_copy_ctor_external(&v15, (const std::string::value_type *)*this, this[1]);
  }
  else {
    std::string v15 = *(std::string *)this;
  }
  std::string::append[abi:ne180100]<char const*,0>(&v15, (std::string *)".xid", (std::string *)"");
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v16, v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
    if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v15.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v16 = v15;
  }
  if (*((char *)this + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)*this, this[1]);
  }
  else {
    std::string __p = *(std::string *)this;
  }
  std::string::append[abi:ne180100]<char const*,0>(&__p, (std::string *)".ids", (std::string *)"");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v15, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v15 = __p;
  }
  int v3 = SHIBYTE(v17.__r_.__value_.__r.__words[2]);
  int v4 = (void *)v17.__r_.__value_.__r.__words[0];
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v5 = (const std::__fs::filesystem::path *)&v17;
  }
  else {
    unsigned int v5 = (const std::__fs::filesystem::path *)v17.__r_.__value_.__r.__words[0];
  }
  remove(v5, v2);
  int v7 = SHIBYTE(v16.__r_.__value_.__r.__words[2]);
  uint64_t v8 = (void *)v16.__r_.__value_.__r.__words[0];
  if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v9 = (const std::__fs::filesystem::path *)&v16;
  }
  else {
    uint64_t v9 = (const std::__fs::filesystem::path *)v16.__r_.__value_.__r.__words[0];
  }
  remove(v9, v6);
  int v11 = SHIBYTE(v15.__r_.__value_.__r.__words[2]);
  int v12 = (void *)v15.__r_.__value_.__r.__words[0];
  if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    unsigned int v13 = (const std::__fs::filesystem::path *)&v15;
  }
  else {
    unsigned int v13 = (const std::__fs::filesystem::path *)v15.__r_.__value_.__r.__words[0];
  }
  remove(v13, v10);
  if (v11 < 0)
  {
    operator delete(v12);
    if ((v7 & 0x80000000) == 0)
    {
LABEL_33:
      if ((v3 & 0x80000000) == 0) {
        return;
      }
LABEL_37:
      operator delete(v4);
      return;
    }
  }
  else if ((v7 & 0x80000000) == 0)
  {
    goto LABEL_33;
  }
  operator delete(v8);
  if (v3 < 0) {
    goto LABEL_37;
  }
}

void sub_1D2EEC4CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v28 - 57) < 0) {
    operator delete(*(void **)(v28 - 80));
  }
  _Unwind_Resume(exception_object);
}

unint64_t skit::internal::DiskMetaStore::populate_doc(unint64_t this, uint64_t a2, uint64_t a3)
{
  if (*(void *)(this + 120))
  {
    uint64_t v4 = a2;
    if (a2 != a3)
    {
      unsigned int v5 = (skit::internal::DiskMetaStore *)this;
      uint64_t v6 = *(void *)(*(void *)(this + 24) + 32);
      do
      {
        uint64_t v7 = *((void *)v5 + 3);
        uint64_t v8 = *(void *)(v4 + 8);
        if (*(void *)(v7 + 32) <= v8 && *(void *)(v7 + 40) > v8)
        {
          this = skit::internal::DiskMetaStore::get_doc_internal(v5, (int)v8 - (int)v6);
          *(void *)(v4 + 24) = this;
          *(_DWORD *)(v4 + 32) = v9;
        }
        v4 += 40;
      }
      while (v4 != a3);
    }
  }
  return this;
}

uint64_t skit::internal::DiskMetaStore::set_doc_wgt(void *a1, skit::internal *this, float a3)
{
  int v3 = (_DWORD *)a1[7];
  if (!v3) {
    return 0;
  }
  unsigned int v7 = skit::internal::murmur3_32(this, 0x10uLL, 0);
  unsigned int v8 = v3[1];
  int v9 = v7 & 0x7F;
  unsigned int v10 = 16 * ((*v3 ^ (v7 >> 7)) % v8);
  unint64_t v11 = 16 * v8;
  int v12 = (char *)&v3[v11 / 4 + 4];
  while (1)
  {
    uint64_t v13 = v10;
    int v14 = *((unsigned __int8 *)v3 + v10 + 16);
    if (v14 == v9)
    {
      std::string v15 = &v12[20 * v13];
      uint64_t v16 = *(void *)v15;
      uint64_t v17 = *((void *)v15 + 1);
      if (*(void *)this == v16 && *((void *)this + 1) == v17) {
        break;
      }
    }
    if (v14 == 128) {
      return 0;
    }
    unsigned int v10 = ((int)v13 + 1) % v11;
  }
  if (v11 - 1 == v13) {
    return 0;
  }
  int v19 = (__int16 *)(a1[5] + 10 * *(unsigned int *)&v12[20 * v13 + 16]);
  _H0 = *v19;
  __asm { FCVT            S0, H0 }
  if (_S0 >= 0.00000011921)
  {
    float v25 = 65504.0;
    if (a3 <= 65504.0) {
      float v25 = a3;
    }
    _S0 = 0.0;
    if (a3 >= 0.0) {
      _S0 = v25;
    }
    if (_S0 < 0.00000011921)
    {
      uint64_t v27 = a1[3];
      ++*(_DWORD *)(v27 + 16);
      --*(_DWORD *)(v27 + 28);
      *((unsigned char *)v3 + v13 + 16) = -2;
      --v3[2];
      _S0 = 0.0;
    }
    __asm { FCVT            H0, S0 }
    *int v19 = _H0;
  }
  return 1;
}

uint64_t skit::internal::MultiIndexV2::open(const std::__fs::filesystem::path *this)
{
  uint64_t v1 = this;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  std::__fs::filesystem::__status(this, 0);
  if (__ec.__pn_.__r_.__value_.__s.__data_[0] == 255 || __ec.__pn_.__r_.__value_.__s.__data_[0] == 0)
  {
    LODWORD(__ec.__pn_.__r_.__value_.__l.__data_) = 0;
    __ec.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)std::system_category();
    if (std::__fs::filesystem::__create_directories(v1, (std::error_code *)&__ec))
    {
      uint64_t v3 = 0;
      v1[12].__pn_.__r_.__value_.__s.__data_[0] = 1;
      return v3;
    }
    return 0xFFFFFFFFLL;
  }
  LODWORD(__ec.__pn_.__r_.__value_.__l.__data_) = 0;
  __ec.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)std::system_category();
  std::__fs::filesystem::__status(v1, (std::error_code *)&__ec);
  if (v42.__r_.__value_.__s.__data_[0] != 2) {
    return 0xFFFFFFFFLL;
  }
  int v45 = 0;
  long long v46 = std::system_category();
  MEMORY[0x1D942C640](&v43, v1, &v45, 2);
  if (!v45)
  {
    std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(&v42, (std::string *)".tbl");
    long long v40 = 0uLL;
    uint64_t v41 = 0;
    uint64_t v4 = v43;
    unsigned int v5 = v44;
    if (v44)
    {
      atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v6 = v44;
      v37.__imp_.__ptr_ = v4;
      v37.__imp_.__cntrl_ = v5;
      if (v44)
      {
        atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v6);
      }
    }
    else
    {
      v37.__imp_.__ptr_ = v43;
      v37.__imp_.__cntrl_ = 0;
    }
    while (1)
    {
      if (!v37.__imp_.__ptr_)
      {
        if (v37.__imp_.__cntrl_) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v37.__imp_.__cntrl_);
        }
        v30.__data_ = (const std::string_view::value_type *)*((void *)&v40 + 1);
        std::basic_string_view<_CharT, _Traits>::size_type v31 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v40 + 1) - v40) >> 3));
        if (*((void *)&v40 + 1) == (void)v40) {
          v30.__size_ = 0;
        }
        else {
          v30.__size_ = v31;
        }
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *,false>(v40, v30, 1);
        if ((void)v40 != *((void *)&v40 + 1)) {
          operator new();
        }
        std::string::size_type size = v1[1].__pn_.__r_.__value_.__l.__size_;
        if (v1[1].__pn_.__r_.__value_.__r.__words[0] != size)
        {
          std::string::size_type v34 = (uint64_t *)(*(void *)(*(void *)(size - 8) + 192) + 32);
          uint64_t v33 = *v34;
          uint64_t v35 = v34[1] - 1;
          if (v35 > *v34) {
            uint64_t v33 = v35;
          }
          skit::internal::MetaStoreHeader::base_id((skit::internal::MetaStoreHeader *)&v1[4], v33 + 1);
        }
        uint64_t v3 = 0;
        v1[12].__pn_.__r_.__value_.__s.__data_[0] = 1;
        __ec.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&v40;
        std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)&__ec);
        if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v42.__r_.__value_.__l.__data_);
        }
        goto LABEL_78;
      }
      unsigned int v8 = (const std::__fs::filesystem::path *)std::__fs::filesystem::directory_iterator::__dereference(&v37);
      int v9 = (std::__fs::filesystem::path *)v8;
      if (((1 << v8[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x13) != 0)
      {
        std::__fs::filesystem::__status(v8, 0);
        int v10 = __ec.__pn_.__r_.__value_.__s.__data_[0];
      }
      else
      {
        int v10 = v8[3].__pn_.__r_.__value_.__s.__data_[0];
      }
      if (v10 == 1)
      {
        std::__fs::filesystem::path::extension[abi:ne180100]((uint64_t)&__ec, v9);
        if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v11.__data_ = (const std::string_view::value_type *)&v42;
        }
        else {
          v11.__data_ = (const std::string_view::value_type *)v42.__r_.__value_.__r.__words[0];
        }
        if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v11.__size_ = HIBYTE(v42.__r_.__value_.__r.__words[2]);
        }
        else {
          v11.__size_ = v42.__r_.__value_.__l.__size_;
        }
        int v12 = std::__fs::filesystem::path::__compare(&__ec, v11);
        int v13 = v12;
        if (SHIBYTE(__ec.__pn_.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(__ec.__pn_.__r_.__value_.__l.__data_);
          if (v13) {
            goto LABEL_64;
          }
        }
        else if (v12)
        {
          goto LABEL_64;
        }
        std::__fs::filesystem::path::stem[abi:ne180100]((uint64_t)__p, v9);
        unsigned __int8 v14 = v39;
        if ((char)v39 < 0)
        {
          std::string v15 = (void **)__p[0];
          if (__p[1] <= (void *)6) {
            goto LABEL_63;
          }
        }
        else
        {
          if (v39 < 7u) {
            goto LABEL_64;
          }
          std::string v15 = __p;
        }
        if (strncmp((const char *)v15, "index-", 6uLL))
        {
          if ((v14 & 0x80) == 0) {
            goto LABEL_64;
          }
LABEL_62:
          std::string v15 = (void **)__p[0];
LABEL_63:
          operator delete(v15);
          goto LABEL_64;
        }
        uint64_t v16 = (_OWORD *)*((void *)&v40 + 1);
        if (*((void *)&v40 + 1) >= (unint64_t)v41)
        {
          unint64_t v18 = v40;
          unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)&v40 + 1) - v40) >> 3);
          unint64_t v20 = v19 + 1;
          if (v19 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
          }
          if (0x5555555555555556 * ((uint64_t)&v41[-v40] >> 3) > v20) {
            unint64_t v20 = 0x5555555555555556 * ((uint64_t)&v41[-v40] >> 3);
          }
          if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v41[-v40] >> 3) >= 0x555555555555555) {
            unint64_t v21 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v21 = v20;
          }
          uint64_t v49 = &v41;
          if (v21)
          {
            if (v21 > 0xAAAAAAAAAAAAAAALL) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            uint64_t v22 = (char *)operator new(24 * v21);
          }
          else
          {
            uint64_t v22 = 0;
          }
          __int16 v24 = (std::string *)&v22[24 * v19];
          __ec.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)v22;
          __ec.__pn_.__r_.__value_.__l.__size_ = (std::string::size_type)v24;
          __ec.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)v24;
          uint64_t v48 = &v22[24 * v21];
          if (SHIBYTE(v9->__pn_.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(v24, v9->__pn_.__r_.__value_.__l.__data_, v9->__pn_.__r_.__value_.__l.__size_);
            uint64_t v16 = (_OWORD *)*((void *)&v40 + 1);
            unint64_t v18 = v40;
            uint64_t v26 = (char *)__ec.__pn_.__r_.__value_.__r.__words[2];
            __int16 v24 = (std::string *)__ec.__pn_.__r_.__value_.__l.__size_;
          }
          else
          {
            long long v25 = *(_OWORD *)&v9->__pn_.__r_.__value_.__l.__data_;
            v24->__r_.__value_.__r.__words[2] = v9->__pn_.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v24->__r_.__value_.__l.__data_ = v25;
            uint64_t v26 = &v22[24 * v19];
          }
          int v23 = v26 + 24;
          __ec.__pn_.__r_.__value_.__r.__words[2] = (std::string::size_type)(v26 + 24);
          if (v16 == (_OWORD *)v18)
          {
            int64x2_t v28 = vdupq_n_s64(v18);
          }
          else
          {
            do
            {
              long long v27 = *(_OWORD *)((char *)v16 - 24);
              v24[-1].__r_.__value_.__r.__words[2] = *((void *)v16 - 1);
              *(_OWORD *)&v24[-1].__r_.__value_.__l.__data_ = v27;
              --v24;
              *((void *)v16 - 2) = 0;
              *((void *)v16 - 1) = 0;
              *((void *)v16 - 3) = 0;
              uint64_t v16 = (_OWORD *)((char *)v16 - 24);
            }
            while (v16 != (_OWORD *)v18);
            int64x2_t v28 = (int64x2_t)v40;
            int v23 = (char *)__ec.__pn_.__r_.__value_.__r.__words[2];
          }
          *(void *)&long long v40 = v24;
          *((void *)&v40 + 1) = v23;
          *(int64x2_t *)&__ec.__pn_.__r_.__value_.__r.__words[1] = v28;
          std::string::size_type v29 = v41;
          uint64_t v41 = v48;
          uint64_t v48 = v29;
          __ec.__pn_.__r_.__value_.__r.__words[0] = v28.i64[0];
          std::__split_buffer<std::__fs::filesystem::path>::~__split_buffer((uint64_t)&__ec);
          unsigned __int8 v14 = v39;
        }
        else
        {
          if (SHIBYTE(v9->__pn_.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(*((std::string **)&v40 + 1), v9->__pn_.__r_.__value_.__l.__data_, v9->__pn_.__r_.__value_.__l.__size_);
          }
          else
          {
            long long v17 = *(_OWORD *)&v9->__pn_.__r_.__value_.__l.__data_;
            *(void *)(*((void *)&v40 + 1) + 16) = *((void *)&v9->__pn_.__r_.__value_.__l + 2);
            *uint64_t v16 = v17;
          }
          int v23 = (char *)v16 + 24;
        }
        *((void *)&v40 + 1) = v23;
        if ((v14 & 0x80) != 0) {
          goto LABEL_62;
        }
      }
LABEL_64:
      std::__fs::filesystem::directory_iterator::__increment(&v37, 0);
    }
  }
  if (skit::internal::get_logging_context(void)::once != -1) {
  std::string::size_type v36 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    if (SHIBYTE(v1->__pn_.__r_.__value_.__r.__words[2]) < 0) {
      uint64_t v1 = (const std::__fs::filesystem::path *)v1->__pn_.__r_.__value_.__r.__words[0];
    }
    LODWORD(__ec.__pn_.__r_.__value_.__l.__data_) = 136446466;
    *(std::string::size_type *)((char *)__ec.__pn_.__r_.__value_.__r.__words + 4) = (std::string::size_type)v1;
    WORD2(__ec.__pn_.__r_.__value_.__r.__words[1]) = 1024;
    *(_DWORD *)((char *)&__ec.__pn_.__r_.__value_.__r.__words[1] + 6) = v45;
    _os_log_error_impl(&dword_1D2EDA000, v36, OS_LOG_TYPE_ERROR, "MultiIndexV2::open : failed to construct directory iterator %{public}s : %{darwin.errno}d", (uint8_t *)&__ec, 0x12u);
  }
  uint64_t v3 = 0xFFFFFFFFLL;
LABEL_78:
  if (v44) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v44);
  }
  return v3;
}

void sub_1D2EECFB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,char *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38,uint64_t a39,std::__shared_weak_count *a40)
{
  operator delete(v40);
  a23 = &a30;
  std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  if (a38 < 0) {
    operator delete(__p);
  }
  if (a40) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a40);
  }
  _Unwind_Resume(a1);
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *,false>(unint64_t a1, std::__fs::filesystem::path::__string_view a2, char a3)
{
  std::basic_string_view<_CharT, _Traits>::size_type size = a2.__size_;
  data = a2.__data_;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  while (2)
  {
    int v9 = (std::__fs::filesystem::path *)(data - 24);
    std::basic_string_view<_CharT, _Traits>::size_type v97 = (std::basic_string_view<_CharT, _Traits>::size_type)(data - 48);
    int v99 = data;
    std::basic_string_view<_CharT, _Traits>::size_type v10 = (std::basic_string_view<_CharT, _Traits>::size_type)(data - 72);
    std::__fs::filesystem::path::__string_view v11 = (std::__fs::filesystem::path *)a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = (unint64_t)v11;
          uint64_t v12 = data - (const std::string_view::value_type *)v11;
          unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((data - (const std::string_view::value_type *)v11) >> 3);
          if (v4 || !v3)
          {
            switch(v13)
            {
              case 0uLL:
              case 1uLL:
                return;
              case 2uLL:
                a2.__data_ = (const std::string_view::value_type *)a1;
                if (std::__fs::filesystem::operator<[abi:ne180100](v9, a2))
                {
                  long long v41 = *(_OWORD *)a1;
                  v100.__pn_.__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
                  *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_ = v41;
                  long long v42 = *(_OWORD *)&v9->__pn_.__r_.__value_.__l.__data_;
                  *(void *)(a1 + 16) = *((void *)&v9->__pn_.__r_.__value_.__l + 2);
                  *(_OWORD *)a1 = v42;
                  long long v43 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
                  v9->__pn_.__r_.__value_.__r.__words[2] = v100.__pn_.__r_.__value_.__r.__words[2];
                  *(_OWORD *)&v9->__pn_.__r_.__value_.__l.__data_ = v43;
                }
                break;
              case 3uLL:
                v44.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)v9;
                v44.__data_ = (const std::string_view::value_type *)(a1 + 24);
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((long long *)a1, v44);
                break;
              case 4uLL:
                v110.__data_ = (const std::string_view::value_type *)(a1 + 24);
                v110.__size_ = a1 + 48;
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(a1, v110, v9);
                break;
              case 5uLL:
                v111.__data_ = (const std::string_view::value_type *)(a1 + 24);
                v111.__size_ = a1 + 48;
                std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(a1, v111, (std::__fs::filesystem::path *)(a1 + 72), v9);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v12 <= 575)
          {
            int v45 = (const std::__fs::filesystem::path *)(a1 + 24);
            BOOL v47 = (const std::string_view::value_type *)a1 == data || v45 == (const std::__fs::filesystem::path *)data;
            if (a3)
            {
              if (!v47)
              {
                uint64_t v48 = 0;
                uint64_t v49 = (const std::__fs::filesystem::path *)a1;
                do
                {
                  a2.__data_ = (const std::string_view::value_type *)v49;
                  uint64_t v49 = v45;
                  if (std::__fs::filesystem::operator<[abi:ne180100](v45, a2))
                  {
                    long long v50 = *(_OWORD *)&v49->__pn_.__r_.__value_.__l.__data_;
                    v100.__pn_.__r_.__value_.__r.__words[2] = v49->__pn_.__r_.__value_.__r.__words[2];
                    *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_ = v50;
                    v49->__pn_.__r_.__value_.__l.__size_ = 0;
                    v49->__pn_.__r_.__value_.__r.__words[2] = 0;
                    v49->__pn_.__r_.__value_.__r.__words[0] = 0;
                    uint64_t v51 = v48;
                    do
                    {
                      uint64_t v52 = a1 + v51;
                      uint64_t v53 = (void **)(a1 + v51 + 24);
                      if (*(char *)(a1 + v51 + 47) < 0) {
                        operator delete(*v53);
                      }
                      *(_OWORD *)uint64_t v53 = *(_OWORD *)v52;
                      *(void *)(a1 + v51 + 40) = *(void *)(v52 + 16);
                      *(unsigned char *)(v52 + 23) = 0;
                      *(unsigned char *)uint64_t v52 = 0;
                      if (!v51)
                      {
                        uint64_t v54 = a1;
                        goto LABEL_90;
                      }
                      v51 -= 24;
                      a2.__data_ = (const std::string_view::value_type *)(a1 + v51);
                    }
                    while ((std::__fs::filesystem::operator<[abi:ne180100](&v100, a2) & 1) != 0);
                    uint64_t v54 = a1 + v51 + 24;
                    if (*(char *)(a1 + v51 + 47) < 0) {
                      operator delete(*(void **)v54);
                    }
LABEL_90:
                    data = v99;
                    long long v55 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
                    *(void *)(v54 + 16) = *((void *)&v100.__pn_.__r_.__value_.__l + 2);
                    *(_OWORD *)uint64_t v54 = v55;
                  }
                  int v45 = v49 + 1;
                  v48 += 24;
                }
                while (&v49[1] != (const std::__fs::filesystem::path *)data);
              }
            }
            else if (!v47)
            {
              uint64_t v90 = (char *)(a1 + 47);
              do
              {
                a2.__data_ = (const std::string_view::value_type *)a1;
                a1 = (unint64_t)v45;
                if (std::__fs::filesystem::operator<[abi:ne180100](v45, a2))
                {
                  long long v91 = *(_OWORD *)a1;
                  v100.__pn_.__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
                  *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_ = v91;
                  *(void *)(a1 + 8) = 0;
                  *(void *)(a1 + 16) = 0;
                  *(void *)a1 = 0;
                  uint64_t v92 = v90;
                  do
                  {
                    uint64_t v93 = (void **)(v92 - 23);
                    if (*v92 < 0) {
                      operator delete(*v93);
                    }
                    *(_OWORD *)uint64_t v93 = *(_OWORD *)(v92 - 47);
                    *(void *)(v92 - 7) = *(void *)(v92 - 31);
                    *(v92 - 47) = 0;
                    int v94 = v92 - 47;
                    v94[23] = 0;
                    v92 -= 24;
                    a2.__data_ = v94 - 24;
                  }
                  while ((std::__fs::filesystem::operator<[abi:ne180100](&v100, a2) & 1) != 0);
                  if (v94[23] < 0) {
                    operator delete(*(void **)v94);
                  }
                  long long v95 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
                  *((void *)v94 + 2) = *((void *)&v100.__pn_.__r_.__value_.__l + 2);
                  *(_OWORD *)int v94 = v95;
                  data = v99;
                }
                int v45 = (const std::__fs::filesystem::path *)(a1 + 24);
                v90 += 24;
              }
              while ((const std::string_view::value_type *)(a1 + 24) != data);
            }
            return;
          }
          if (!size)
          {
            if ((const std::string_view::value_type *)a1 != data)
            {
              int64_t v56 = (v13 - 2) >> 1;
              int64_t v57 = v56;
              do
              {
                int64_t v58 = v57;
                if (v56 >= v57)
                {
                  uint64_t v59 = (2 * v57) | 1;
                  unint64_t v60 = a1 + 24 * v59;
                  if (2 * v57 + 2 < (uint64_t)v13)
                  {
                    a2.__data_ = (const std::string_view::value_type *)(v60 + 24);
                    if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)(a1 + 24 * v59), a2))
                    {
                      v60 += 24;
                      uint64_t v59 = 2 * v58 + 2;
                    }
                  }
                  unint64_t v61 = a1 + 24 * v58;
                  a2.__data_ = (const std::string_view::value_type *)v61;
                  if ((std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v60, a2) & 1) == 0)
                  {
                    long long v62 = *(_OWORD *)v61;
                    v100.__pn_.__r_.__value_.__r.__words[2] = *(void *)(v61 + 16);
                    *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_ = v62;
                    *(void *)(v61 + 8) = 0;
                    *(void *)(v61 + 16) = 0;
                    *(void *)unint64_t v61 = 0;
                    while (1)
                    {
                      unint64_t v63 = v60;
                      if (*(char *)(v61 + 23) < 0) {
                        operator delete(*(void **)v61);
                      }
                      long long v64 = *(_OWORD *)v60;
                      *(void *)(v61 + 16) = *(void *)(v60 + 16);
                      *(_OWORD *)unint64_t v61 = v64;
                      *(unsigned char *)(v60 + 23) = 0;
                      *(unsigned char *)unint64_t v60 = 0;
                      if (v56 < v59) {
                        break;
                      }
                      uint64_t v65 = (2 * v59) | 1;
                      unint64_t v60 = a1 + 24 * v65;
                      uint64_t v66 = 2 * v59 + 2;
                      if (v66 < (uint64_t)v13)
                      {
                        a2.__data_ = (const std::string_view::value_type *)(v60 + 24);
                        if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)(a1 + 24 * v65), a2))
                        {
                          v60 += 24;
                          uint64_t v65 = v66;
                        }
                      }
                      a2.__data_ = (const std::string_view::value_type *)&v100;
                      unint64_t v61 = v63;
                      uint64_t v59 = v65;
                      if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v60, a2))
                      {
                        if (*(char *)(v63 + 23) < 0) {
                          operator delete(*(void **)v63);
                        }
                        break;
                      }
                    }
                    long long v67 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
                    *(void *)(v63 + 16) = *((void *)&v100.__pn_.__r_.__value_.__l + 2);
                    *(_OWORD *)unint64_t v63 = v67;
                    data = v99;
                  }
                }
                int64_t v57 = v58 - 1;
              }
              while (v58);
              int64_t v68 = v12 / 0x18uLL;
              do
              {
                uint64_t v69 = data;
                uint64_t v70 = 0;
                uint64_t v96 = *(void *)a1;
                v101.__pn_.__r_.__value_.__r.__words[0] = *(void *)(a1 + 8);
                *(std::string::size_type *)((char *)v101.__pn_.__r_.__value_.__r.__words + 7) = *(void *)(a1 + 15);
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
                  if (v75 + 2 < v68)
                  {
                    a2.__data_ = (const std::string_view::value_type *)(v74 + 24);
                    if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v74, a2))
                    {
                      v74 += 24;
                      uint64_t v70 = v76;
                    }
                  }
                  if (*(char *)(v73 + 23) < 0) {
                    operator delete(*(void **)v73);
                  }
                  long long v77 = *(_OWORD *)v74;
                  *(void *)(v73 + 16) = *(void *)(v74 + 16);
                  *(_OWORD *)unint64_t v73 = v77;
                  *(unsigned char *)(v74 + 23) = 0;
                  *(unsigned char *)uint64_t v74 = 0;
                  unint64_t v73 = v74;
                }
                while (v70 <= v72);
                data = v69 - 24;
                if ((const std::string_view::value_type *)v74 == v69 - 24)
                {
                  *(void *)uint64_t v74 = v96;
                  uint64_t v88 = *(std::string::size_type *)((char *)v101.__pn_.__r_.__value_.__r.__words + 7);
                  *(void *)(v74 + 8) = v101.__pn_.__r_.__value_.__r.__words[0];
                  *(void *)(v74 + 15) = v88;
                  *(unsigned char *)(v74 + 23) = v98;
                  int64_t v81 = v68 - 1;
                }
                else
                {
                  long long v78 = *(_OWORD *)data;
                  *(void *)(v74 + 16) = *((void *)v69 - 1);
                  *(_OWORD *)uint64_t v74 = v78;
                  *((void *)v69 - 3) = v96;
                  std::string::size_type v79 = v101.__pn_.__r_.__value_.__r.__words[0];
                  *(void *)(v69 - 9) = *(std::string::size_type *)((char *)v101.__pn_.__r_.__value_.__r.__words + 7);
                  *((void *)v69 - 2) = v79;
                  *((unsigned char *)v69 - 1) = v98;
                  uint64_t v80 = v74 - a1 + 24;
                  int64_t v81 = v68 - 1;
                  if (v80 >= 25)
                  {
                    unint64_t v82 = (unint64_t)(-2 - 0x5555555555555555 * (v80 >> 3)) >> 1;
                    unint64_t v83 = a1 + 24 * v82;
                    a2.__data_ = (const std::string_view::value_type *)v74;
                    if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v83, a2))
                    {
                      long long v84 = *(_OWORD *)v74;
                      v100.__pn_.__r_.__value_.__r.__words[2] = *(void *)(v74 + 16);
                      *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_ = v84;
                      *(void *)(v74 + 8) = 0;
                      *(void *)(v74 + 16) = 0;
                      *(void *)uint64_t v74 = 0;
                      while (1)
                      {
                        uint64_t v85 = v83;
                        if (*(char *)(v74 + 23) < 0) {
                          operator delete(*(void **)v74);
                        }
                        long long v86 = *(_OWORD *)v83;
                        *(void *)(v74 + 16) = *(void *)(v83 + 16);
                        *(_OWORD *)uint64_t v74 = v86;
                        *(unsigned char *)(v83 + 23) = 0;
                        *(unsigned char *)unint64_t v83 = 0;
                        if (!v82) {
                          break;
                        }
                        unint64_t v82 = (v82 - 1) >> 1;
                        unint64_t v83 = a1 + 24 * v82;
                        a2.__data_ = (const std::string_view::value_type *)&v100;
                        uint64_t v74 = v85;
                        if ((std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)v83, a2) & 1) == 0)
                        {
                          if (*(char *)(v85 + 23) < 0) {
                            operator delete(*(void **)v85);
                          }
                          break;
                        }
                      }
                      long long v87 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
                      *(void *)(v85 + 16) = *((void *)&v100.__pn_.__r_.__value_.__l + 2);
                      *(_OWORD *)uint64_t v85 = v87;
                    }
                  }
                }
                BOOL v89 = v68 <= 2;
                int64_t v68 = v81;
              }
              while (!v89);
            }
            return;
          }
          unint64_t v14 = a1 + 24 * (v13 >> 1);
          if ((unint64_t)v12 >= 0xC01)
          {
            v104.__data_ = (const std::string_view::value_type *)(a1 + 24 * (v13 >> 1));
            v104.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)v9;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((long long *)a1, v104);
            v105.__data_ = (const std::string_view::value_type *)(a1 + 24 * (v13 >> 1) - 24);
            v105.__size_ = v97;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((long long *)(a1 + 24), v105);
            v106.__data_ = (const std::string_view::value_type *)(a1 + 24 + 24 * (v13 >> 1));
            v106.__size_ = v10;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((long long *)(a1 + 48), v106);
            v107.__data_ = (const std::string_view::value_type *)(a1 + 24 * (v13 >> 1));
            v107.__size_ = a1 + 24 + 24 * (v13 >> 1);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((long long *)(v107.__data_ - 24), v107);
            long long v15 = *(_OWORD *)a1;
            v100.__pn_.__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
            *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_ = v15;
            uint64_t v16 = *(void *)(v14 + 16);
            *(_OWORD *)a1 = *(_OWORD *)v14;
            *(void *)(a1 + 16) = v16;
            long long v17 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
            *(void *)(v14 + 16) = *((void *)&v100.__pn_.__r_.__value_.__l + 2);
            *(_OWORD *)unint64_t v14 = v17;
          }
          else
          {
            v108.__data_ = (const std::string_view::value_type *)a1;
            v108.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)v9;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((long long *)(a1 + 24 * (v13 >> 1)), v108);
          }
          --size;
          data = v99;
          if (a3) {
            break;
          }
          v18.__data_ = (const std::string_view::value_type *)a1;
          if (std::__fs::filesystem::operator<[abi:ne180100]((const std::__fs::filesystem::path *)(a1 - 24), v18)) {
            break;
          }
          long long v31 = *(_OWORD *)a1;
          v101.__pn_.__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
          *(_OWORD *)&v101.__pn_.__r_.__value_.__l.__data_ = v31;
          *(void *)(a1 + 8) = 0;
          *(void *)(a1 + 16) = 0;
          *(void *)a1 = 0;
          v18.__data_ = (const std::string_view::value_type *)v9;
          if (std::__fs::filesystem::operator<[abi:ne180100](&v101, v18))
          {
            std::__fs::filesystem::path::__string_view v11 = (std::__fs::filesystem::path *)a1;
            do
              a2.__data_ = (const std::string_view::value_type *)++v11;
            while ((std::__fs::filesystem::operator<[abi:ne180100](&v101, a2) & 1) == 0);
          }
          else
          {
            int v32 = (const std::string_view::value_type *)(a1 + 24);
            do
            {
              std::__fs::filesystem::path::__string_view v11 = (std::__fs::filesystem::path *)v32;
              if (v32 >= v99) {
                break;
              }
              a2.__data_ = v32;
              int v33 = std::__fs::filesystem::operator<[abi:ne180100](&v101, a2);
              int v32 = (const std::string_view::value_type *)&v11[1];
            }
            while (!v33);
          }
          std::string::size_type v34 = (std::string_view::value_type *)v99;
          if (v11 < (std::__fs::filesystem::path *)v99)
          {
            std::string::size_type v34 = (std::string_view::value_type *)v99;
            do
            {
              v34 -= 24;
              a2.__data_ = v34;
            }
            while ((std::__fs::filesystem::operator<[abi:ne180100](&v101, a2) & 1) != 0);
          }
          while (v11 < (std::__fs::filesystem::path *)v34)
          {
            long long v35 = *(_OWORD *)&v11->__pn_.__r_.__value_.__l.__data_;
            v100.__pn_.__r_.__value_.__r.__words[2] = v11->__pn_.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_ = v35;
            long long v36 = *(_OWORD *)v34;
            v11->__pn_.__r_.__value_.__r.__words[2] = *((void *)v34 + 2);
            *(_OWORD *)&v11->__pn_.__r_.__value_.__l.__data_ = v36;
            long long v37 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
            *((void *)v34 + 2) = *((void *)&v100.__pn_.__r_.__value_.__l + 2);
            *(_OWORD *)std::string::size_type v34 = v37;
            do
              a2.__data_ = (const std::string_view::value_type *)++v11;
            while (!std::__fs::filesystem::operator<[abi:ne180100](&v101, a2));
            do
            {
              v34 -= 24;
              a2.__data_ = v34;
            }
            while ((std::__fs::filesystem::operator<[abi:ne180100](&v101, a2) & 1) != 0);
          }
          uint64_t v38 = v11 - 1;
          BOOL v3 = (unint64_t)&v11[-1] >= a1;
          BOOL v4 = &v11[-1] == (std::__fs::filesystem::path *)a1;
          if (&v11[-1] == (std::__fs::filesystem::path *)a1)
          {
            if (SHIBYTE(v11[-1].__pn_.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(*(void **)a1);
            }
          }
          else
          {
            if (*(char *)(a1 + 23) < 0) {
              operator delete(*(void **)a1);
            }
            long long v39 = *(_OWORD *)&v38->__pn_.__r_.__value_.__l.__data_;
            *(void *)(a1 + 16) = *((void *)&v11[-1].__pn_.__r_.__value_.__l + 2);
            *(_OWORD *)a1 = v39;
            *((unsigned char *)&v11[-1].__pn_.__r_.__value_.__s + 23) = 0;
            v11[-1].__pn_.__r_.__value_.__s.__data_[0] = 0;
          }
          a3 = 0;
          long long v40 = *(_OWORD *)&v101.__pn_.__r_.__value_.__l.__data_;
          v11[-1].__pn_.__r_.__value_.__r.__words[2] = v101.__pn_.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v38->__pn_.__r_.__value_.__l.__data_ = v40;
        }
        long long v19 = *(_OWORD *)a1;
        v101.__pn_.__r_.__value_.__r.__words[2] = *(void *)(a1 + 16);
        *(_OWORD *)&v101.__pn_.__r_.__value_.__l.__data_ = v19;
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)a1 = 0;
        unint64_t v20 = (const std::__fs::filesystem::path *)a1;
        do
        {
          unint64_t v21 = v20++;
          v18.__data_ = (const std::string_view::value_type *)&v101;
        }
        while ((std::__fs::filesystem::operator<[abi:ne180100](v20, v18) & 1) != 0);
        uint64_t v22 = (const std::__fs::filesystem::path *)v99;
        if (v21 == (const std::__fs::filesystem::path *)a1)
        {
          uint64_t v22 = (const std::__fs::filesystem::path *)v99;
          do
          {
            if (v20 >= v22) {
              break;
            }
            --v22;
            v18.__data_ = (const std::string_view::value_type *)&v101;
          }
          while ((std::__fs::filesystem::operator<[abi:ne180100](v22, v18) & 1) == 0);
        }
        else
        {
          do
          {
            --v22;
            v18.__data_ = (const std::string_view::value_type *)&v101;
          }
          while (!std::__fs::filesystem::operator<[abi:ne180100](v22, v18));
        }
        std::__fs::filesystem::path::__string_view v11 = (std::__fs::filesystem::path *)v20;
        if (v20 < v22)
        {
          int v23 = (std::__fs::filesystem::path *)v22;
          do
          {
            std::__fs::filesystem::path v100 = *v11;
            long long v24 = *(_OWORD *)&v100.__pn_.__r_.__value_.__l.__data_;
            std::string::size_type v25 = v100.__pn_.__r_.__value_.__r.__words[2];
            std::string::size_type v26 = v23->__pn_.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v11->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&v23->__pn_.__r_.__value_.__l.__data_;
            v11->__pn_.__r_.__value_.__r.__words[2] = v26;
            v23->__pn_.__r_.__value_.__r.__words[2] = v25;
            *(_OWORD *)&v23->__pn_.__r_.__value_.__l.__data_ = v24;
            do
            {
              ++v11;
              v18.__data_ = (const std::string_view::value_type *)&v101;
            }
            while ((std::__fs::filesystem::operator<[abi:ne180100](v11, v18) & 1) != 0);
            do
            {
              --v23;
              v18.__data_ = (const std::string_view::value_type *)&v101;
            }
            while (!std::__fs::filesystem::operator<[abi:ne180100](v23, v18));
          }
          while (v11 < v23);
        }
        long long v27 = v11 - 1;
        if (&v11[-1] == (std::__fs::filesystem::path *)a1)
        {
          if (SHIBYTE(v11[-1].__pn_.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(*(void **)a1);
          }
        }
        else
        {
          if (*(char *)(a1 + 23) < 0) {
            operator delete(*(void **)a1);
          }
          long long v28 = *(_OWORD *)&v27->__pn_.__r_.__value_.__l.__data_;
          *(void *)(a1 + 16) = *((void *)&v11[-1].__pn_.__r_.__value_.__l + 2);
          *(_OWORD *)a1 = v28;
          *((unsigned char *)&v11[-1].__pn_.__r_.__value_.__s + 23) = 0;
          v11[-1].__pn_.__r_.__value_.__s.__data_[0] = 0;
        }
        long long v29 = *(_OWORD *)&v101.__pn_.__r_.__value_.__l.__data_;
        v11[-1].__pn_.__r_.__value_.__r.__words[2] = v101.__pn_.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v27->__pn_.__r_.__value_.__l.__data_ = v29;
        if (v20 >= v22) {
          break;
        }
LABEL_35:
        std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *,false>(a1, &v11[-1], size, a3 & 1);
        a3 = 0;
      }
      v18.__data_ = (const std::string_view::value_type *)&v11[-1];
      BOOL v30 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((std::__fs::filesystem::path *)a1, v18);
      v109.__data_ = v99;
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(v11, v109))
      {
        break;
      }
      if (!v30) {
        goto LABEL_35;
      }
    }
    data = (const std::string_view::value_type *)&v11[-1];
    if (!v30) {
      continue;
    }
    break;
  }
}

double std::__fs::filesystem::path::stem[abi:ne180100](uint64_t a1, std::__fs::filesystem::path *this)
{
  std::__fs::filesystem::path::__string_view v3 = std::__fs::filesystem::path::__stem(this);
  if (v3.__size_ >= 0x7FFFFFFFFFFFFFF8) {
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  }
  if (v3.__size_ >= 0x17)
  {
    std::basic_string_view<_CharT, _Traits>::size_type v5 = (v3.__size_ & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v3.__size_ | 7) != 0x17) {
      std::basic_string_view<_CharT, _Traits>::size_type v5 = v3.__size_ | 7;
    }
    std::basic_string_view<_CharT, _Traits>::size_type v6 = v5 + 1;
    p_dst = (long long *)operator new(v5 + 1);
    *((void *)&__dst + 1) = v3.__size_;
    unint64_t v9 = v6 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    HIBYTE(v9) = v3.__size_;
    p_dst = &__dst;
    if (!v3.__size_) {
      goto LABEL_9;
    }
  }
  memmove(p_dst, v3.__data_, v3.__size_);
LABEL_9:
  *((unsigned char *)p_dst + v3.__size_) = 0;
  double result = *(double *)&__dst;
  *(_OWORD *)a1 = __dst;
  *(void *)(a1 + 16) = v9;
  return result;
}

std::string *std::__fs::filesystem::operator/[abi:ne180100](std::string *this, uint64_t a2, std::__fs::filesystem::path *a3)
{
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    *this = *(std::string *)a2;
  }
  if (std::__fs::filesystem::path::__root_directory(a3).__size_) {
    return std::string::operator=(this, &a3->__pn_);
  }
  if (std::__fs::filesystem::path::__filename((const std::__fs::filesystem::path *)this).__size_) {
    std::string::push_back(this, 47);
  }
  int v6 = SHIBYTE(a3->__pn_.__r_.__value_.__r.__words[2]);
  if (v6 >= 0) {
    unsigned int v7 = a3;
  }
  else {
    unsigned int v7 = (std::__fs::filesystem::path *)a3->__pn_.__r_.__value_.__r.__words[0];
  }
  if (v6 >= 0) {
    std::string::size_type size = HIBYTE(a3->__pn_.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = a3->__pn_.__r_.__value_.__l.__size_;
  }
  return std::string::append(this, (const std::string::value_type *)v7, size);
}

void sub_1D2EEDD64(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

skit::internal::IndexDiskImplV2 *skit::internal::IndexDiskImplV2::IndexDiskImplV2(skit::internal::IndexDiskImplV2 *this, std::__fs::filesystem::path *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = a2->__pn_;
  }
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvStore((uint64_t)this, (long long *)&__p, skit::default_kv_store_config, unk_1EA697FF8);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  *(void *)&v12[7] = *(std::string::size_type *)((char *)&a2->__pn_.__r_.__value_.__r.__words[1] + 7);
  BOOL v4 = (const std::string::value_type *)a2->__pn_.__r_.__value_.__r.__words[0];
  *(void *)uint64_t v12 = a2->__pn_.__r_.__value_.__l.__size_;
  uint64_t v5 = *(void *)v12;
  int v6 = SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]);
  a2->__pn_.__r_.__value_.__l.__size_ = 0;
  a2->__pn_.__r_.__value_.__r.__words[2] = 0;
  a2->__pn_.__r_.__value_.__r.__words[0] = 0;
  *((void *)this + 21) = v4;
  *((void *)this + 22) = v5;
  *(void *)((char *)this + 183) = *(void *)&v12[7];
  *((unsigned char *)this + 191) = v6;
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  if (v6 < 0) {
    std::string::__init_copy_ctor_external(&v10, v4, *((void *)this + 22));
  }
  else {
    std::string v10 = *(std::string *)((unsigned char *)this + 7);
  }
  std::string::append[abi:ne180100]<char const*,0>(&v10, (std::string *)".xid", (std::string *)"");
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v11, v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
    BOOL v7 = (v10.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0;
  }
  else
  {
    BOOL v7 = 0;
    std::string v11 = v10;
  }
  *((void *)this + 28) = 0;
  *((void *)this + 29) = 0;
  *((std::string *)this + 10) = v11;
  *((_DWORD *)this + 66) = -1;
  *((_WORD *)this + 134) = 416;
  *((void *)this + 34) = 0x500000400;
  *((void *)this + 35) = 10485760;
  if (v7) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  *((void *)this + 36) = 0;
  *((void *)this + 37) = 0;
  return this;
}

void sub_1D2EEDF34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  skit::internal::MmapFile::~MmapFile(v22);
  if (*(char *)(v21 + 191) < 0) {
    operator delete(*v23);
  }
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore(v21);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<skit::internal::IndexDiskImplV2>>>(unint64_t a1)
{
  if (a1 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a1);
}

uint64_t std::__split_buffer<std::unique_ptr<skit::internal::IndexDiskImplV2>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100]((void ***)(i - 8));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void skit::internal::MetaStoreHeader::base_id(skit::internal::MetaStoreHeader *this, uint64_t a2)
{
  if (*((_DWORD *)this + 3))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v2 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_error_impl(&dword_1D2EDA000, v2, OS_LOG_TYPE_ERROR, "MetaStoreHeader::set_base_doc_id : cannot reset base doc ID to a non empty meta store", v3, 2u);
    }
  }
  else
  {
    *((void *)this + 4) = a2;
    *((void *)this + 5) = a2;
  }
}

uint64_t std::__split_buffer<std::__fs::filesystem::path>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      BOOL v4 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v4);
        BOOL v4 = *(void ***)(a1 + 16);
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

uint64_t std::__fs::filesystem::operator<[abi:ne180100](const std::__fs::filesystem::path *a1, std::__fs::filesystem::path::__string_view a2)
{
  std::basic_string_view<_CharT, _Traits>::size_type v2 = *((void *)a2.__data_ + 1);
  if (*((char *)a2.__data_ + 23) >= 0)
  {
    a2.__size_ = *((unsigned __int8 *)a2.__data_ + 23);
  }
  else
  {
    a2.__data_ = *(const std::string_view::value_type **)a2.__data_;
    a2.__size_ = v2;
  }
  return std::__fs::filesystem::path::__compare(a1, a2) >> 31;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(long long *a1, std::__fs::filesystem::path::__string_view a2)
{
  std::string::size_type size = (std::__fs::filesystem::path *)a2.__size_;
  data = (std::__fs::filesystem::path *)a2.__data_;
  uint64_t v5 = (const std::__fs::filesystem::path *)a2.__data_;
  a2.__data_ = (const std::string_view::value_type *)a1;
  char v6 = std::__fs::filesystem::operator<[abi:ne180100](v5, a2);
  v22.__data_ = (const std::string_view::value_type *)data;
  uint64_t result = std::__fs::filesystem::operator<[abi:ne180100](size, v22);
  if (v6)
  {
    if (result)
    {
      std::string::size_type v9 = *((void *)a1 + 2);
      long long v10 = *a1;
      std::string::size_type v11 = size->__pn_.__r_.__value_.__r.__words[2];
      *a1 = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
      *((void *)a1 + 2) = v11;
    }
    else
    {
      std::string::size_type v18 = *((void *)a1 + 2);
      long long v19 = *a1;
      std::string::size_type v20 = data->__pn_.__r_.__value_.__r.__words[2];
      *a1 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
      *((void *)a1 + 2) = v20;
      *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = v19;
      data->__pn_.__r_.__value_.__r.__words[2] = v18;
      v8.__data_ = (const std::string_view::value_type *)data;
      uint64_t result = std::__fs::filesystem::operator<[abi:ne180100](size, v8);
      if (!result) {
        return result;
      }
      std::string::size_type v9 = data->__pn_.__r_.__value_.__r.__words[2];
      long long v10 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
      std::string::size_type v21 = size->__pn_.__r_.__value_.__r.__words[2];
      *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
      data->__pn_.__r_.__value_.__r.__words[2] = v21;
    }
    *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = v10;
    size->__pn_.__r_.__value_.__r.__words[2] = v9;
  }
  else if (result)
  {
    std::string::size_type v12 = data->__pn_.__r_.__value_.__r.__words[2];
    long long v13 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
    std::string::size_type v14 = size->__pn_.__r_.__value_.__r.__words[2];
    *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
    data->__pn_.__r_.__value_.__r.__words[2] = v14;
    *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = v13;
    size->__pn_.__r_.__value_.__r.__words[2] = v12;
    v8.__data_ = (const std::string_view::value_type *)a1;
    uint64_t result = std::__fs::filesystem::operator<[abi:ne180100](data, v8);
    if (result)
    {
      std::string::size_type v15 = *((void *)a1 + 2);
      long long v16 = *a1;
      std::string::size_type v17 = data->__pn_.__r_.__value_.__r.__words[2];
      *a1 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
      *((void *)a1 + 2) = v17;
      *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = v16;
      data->__pn_.__r_.__value_.__r.__words[2] = v15;
    }
  }
  return result;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(uint64_t a1, std::__fs::filesystem::path::__string_view a2, std::__fs::filesystem::path *a3)
{
  std::string::size_type size = (std::__fs::filesystem::path *)a2.__size_;
  data = (std::__fs::filesystem::path *)a2.__data_;
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((long long *)a1, a2);
  v18.__data_ = (const std::string_view::value_type *)size;
  if (std::__fs::filesystem::operator<[abi:ne180100](a3, v18))
  {
    std::string::size_type v9 = size->__pn_.__r_.__value_.__r.__words[2];
    long long v10 = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
    std::string::size_type v11 = a3->__pn_.__r_.__value_.__r.__words[2];
    *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_;
    size->__pn_.__r_.__value_.__r.__words[2] = v11;
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = v10;
    a3->__pn_.__r_.__value_.__r.__words[2] = v9;
    v7.__data_ = (const std::string_view::value_type *)data;
    if (std::__fs::filesystem::operator<[abi:ne180100](size, v7))
    {
      std::string::size_type v13 = data->__pn_.__r_.__value_.__r.__words[2];
      long long v14 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
      std::string::size_type v15 = size->__pn_.__r_.__value_.__r.__words[2];
      *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
      data->__pn_.__r_.__value_.__r.__words[2] = v15;
      *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = v14;
      size->__pn_.__r_.__value_.__r.__words[2] = v13;
      v12.__data_ = (const std::string_view::value_type *)a1;
      if (std::__fs::filesystem::operator<[abi:ne180100](data, v12))
      {
        std::string::size_type v16 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        std::string::size_type v17 = data->__pn_.__r_.__value_.__r.__words[2];
        *(_OWORD *)a1 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
        *(void *)(a1 + 16) = v17;
        *(__n128 *)&data->__pn_.__r_.__value_.__l.__data_ = result;
        data->__pn_.__r_.__value_.__r.__words[2] = v16;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(uint64_t a1, std::__fs::filesystem::path::__string_view a2, std::__fs::filesystem::path *a3, std::__fs::filesystem::path *a4)
{
  std::string::size_type size = (std::__fs::filesystem::path *)a2.__size_;
  data = (std::__fs::filesystem::path *)a2.__data_;
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(a1, a2, a3);
  v24.__data_ = (const std::string_view::value_type *)a3;
  if (std::__fs::filesystem::operator<[abi:ne180100](a4, v24))
  {
    std::string::size_type v11 = a3->__pn_.__r_.__value_.__r.__words[2];
    long long v12 = *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_;
    std::string::size_type v13 = a4->__pn_.__r_.__value_.__r.__words[2];
    *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&a4->__pn_.__r_.__value_.__l.__data_;
    a3->__pn_.__r_.__value_.__r.__words[2] = v13;
    *(_OWORD *)&a4->__pn_.__r_.__value_.__l.__data_ = v12;
    a4->__pn_.__r_.__value_.__r.__words[2] = v11;
    v9.__data_ = (const std::string_view::value_type *)size;
    if (std::__fs::filesystem::operator<[abi:ne180100](a3, v9))
    {
      std::string::size_type v15 = size->__pn_.__r_.__value_.__r.__words[2];
      long long v16 = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
      std::string::size_type v17 = a3->__pn_.__r_.__value_.__r.__words[2];
      *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_;
      size->__pn_.__r_.__value_.__r.__words[2] = v17;
      *(_OWORD *)&a3->__pn_.__r_.__value_.__l.__data_ = v16;
      a3->__pn_.__r_.__value_.__r.__words[2] = v15;
      v14.__data_ = (const std::string_view::value_type *)data;
      if (std::__fs::filesystem::operator<[abi:ne180100](size, v14))
      {
        std::string::size_type v19 = data->__pn_.__r_.__value_.__r.__words[2];
        long long v20 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
        std::string::size_type v21 = size->__pn_.__r_.__value_.__r.__words[2];
        *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_;
        data->__pn_.__r_.__value_.__r.__words[2] = v21;
        *(_OWORD *)&size->__pn_.__r_.__value_.__l.__data_ = v20;
        size->__pn_.__r_.__value_.__r.__words[2] = v19;
        v18.__data_ = (const std::string_view::value_type *)a1;
        if (std::__fs::filesystem::operator<[abi:ne180100](data, v18))
        {
          std::string::size_type v22 = *(void *)(a1 + 16);
          __n128 result = *(__n128 *)a1;
          std::string::size_type v23 = data->__pn_.__r_.__value_.__r.__words[2];
          *(_OWORD *)a1 = *(_OWORD *)&data->__pn_.__r_.__value_.__l.__data_;
          *(void *)(a1 + 16) = v23;
          *(__n128 *)&data->__pn_.__r_.__value_.__l.__data_ = result;
          data->__pn_.__r_.__value_.__r.__words[2] = v22;
        }
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>(std::__fs::filesystem::path *a1, std::__fs::filesystem::path::__string_view a2)
{
  data = a2.__data_;
  uint64_t v4 = (a2.__data_ - (const std::string_view::value_type *)a1) >> 3;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      char v6 = (std::string_view::value_type *)(a2.__data_ - 24);
      std::__fs::filesystem::path::__string_view v7 = (const std::__fs::filesystem::path *)(a2.__data_ - 24);
      a2.__data_ = (const std::string_view::value_type *)a1;
      if (std::__fs::filesystem::operator<[abi:ne180100](v7, a2))
      {
        std::string::size_type v8 = a1->__pn_.__r_.__value_.__r.__words[2];
        long long v9 = *(_OWORD *)&a1->__pn_.__r_.__value_.__l.__data_;
        std::string::size_type v10 = *((void *)v6 + 2);
        *(_OWORD *)&a1->__pn_.__r_.__value_.__l.__data_ = *(_OWORD *)v6;
        a1->__pn_.__r_.__value_.__r.__words[2] = v10;
        *(_OWORD *)char v6 = v9;
        *((void *)v6 + 2) = v8;
      }
      return 1;
    case 3uLL:
      v22.__data_ = (const std::string_view::value_type *)&a1[1];
      v22.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)(data - 24);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((long long *)a1, v22);
      return 1;
    case 4uLL:
      v24.__data_ = (const std::string_view::value_type *)&a1[1];
      v24.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)&a1[2];
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((uint64_t)a1, v24, (std::__fs::filesystem::path *)data - 1);
      return 1;
    case 5uLL:
      v23.__data_ = (const std::string_view::value_type *)&a1[1];
      v23.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)&a1[2];
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((uint64_t)a1, v23, a1 + 3, (std::__fs::filesystem::path *)data - 1);
      return 1;
    default:
      std::string::size_type v11 = (const std::string_view::value_type *)&a1[2];
      v21.__data_ = (const std::string_view::value_type *)&a1[1];
      v21.__size_ = (std::basic_string_view<_CharT, _Traits>::size_type)&a1[2];
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,std::__fs::filesystem::path *>((long long *)a1, v21);
      std::string::size_type v13 = a1 + 3;
      if (&a1[3] == (std::__fs::filesystem::path *)data) {
        return 1;
      }
      uint64_t v14 = 0;
      int v15 = 0;
      break;
  }
  while (1)
  {
    v12.__data_ = v11;
    if (std::__fs::filesystem::operator<[abi:ne180100](v13, v12))
    {
      std::__fs::filesystem::path v20 = *v13;
      v13->__pn_.__r_.__value_.__l.__size_ = 0;
      v13->__pn_.__r_.__value_.__r.__words[2] = 0;
      v13->__pn_.__r_.__value_.__r.__words[0] = 0;
      uint64_t v16 = v14;
      do
      {
        std::string::size_type v17 = (char *)a1 + v16;
        std::__fs::filesystem::path::__string_view v18 = (void **)((char *)&a1[3].__pn_.__r_.__value_.__l.__data_ + v16);
        if (*((char *)&a1[3].__pn_.__r_.__value_.__r.__words[2] + v16 + 7) < 0) {
          operator delete(*v18);
        }
        *(_OWORD *)std::__fs::filesystem::path::__string_view v18 = *((_OWORD *)v17 + 3);
        *(std::string::size_type *)((char *)&a1[3].__pn_.__r_.__value_.__r.__words[2] + v16) = *((void *)v17 + 8);
        v17[71] = 0;
        v17[48] = 0;
        if (v16 == -48)
        {
          uint64_t v19 = (uint64_t)a1;
          goto LABEL_15;
        }
        v12.__data_ = (char *)&a1[1] + v16;
        v16 -= 24;
      }
      while ((std::__fs::filesystem::operator<[abi:ne180100](&v20, v12) & 1) != 0);
      uint64_t v19 = (uint64_t)&a1[3] + v16;
      if (*(char *)(v19 + 23) < 0) {
        operator delete(*(void **)v19);
      }
LABEL_15:
      *(std::__fs::filesystem::path *)uint64_t v19 = v20;
      if (++v15 == 8) {
        return &v13[1] == (const std::__fs::filesystem::path *)data;
      }
    }
    std::string::size_type v11 = (const std::string_view::value_type *)v13;
    v14 += 24;
    if (++v13 == (const std::__fs::filesystem::path *)data) {
      return 1;
    }
  }
}

uint64_t skit::internal::MultiIndexV2::close(void ****this)
{
  skit::internal::MultiIndexV2::flush((skit::internal::MultiIndexV2 *)this);
  uint64_t v3 = this[3];
  for (uint64_t i = this[4]; i != v3; std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](i))
    --i;
  this[4] = v3;
  skit::internal::IndexMemImplV2::clear((skit::internal::IndexMemImplV2 *)(this + 6));
  *((_DWORD *)this + 68) = 0;
  uint64_t result = std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::shrink_to_fit((uint64_t)(this + 3));
  *((unsigned char *)this + 288) = 0;
  return result;
}

uint64_t skit::internal::MultiIndexV2::flush(skit::internal::MultiIndexV2 *this)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (*((_DWORD *)this + 27) == *((_DWORD *)this + 28)) {
    return 0;
  }
  snprintf(__str, 0xFuLL, "index-%08x", *((_DWORD *)this + 68));
  std::__fs::filesystem::path::path[abi:ne180100]<char [15],void>(&__p, (std::string *)__str);
  std::__fs::filesystem::operator/[abi:ne180100](&v24, (uint64_t)this, (std::__fs::filesystem::path *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (skit::internal::get_logging_context(void)::once != -1) {
  uint64_t v3 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = &v24;
    if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v4 = (std::string *)v24.__r_.__value_.__r.__words[0];
    }
    LODWORD(__p.__r_.__value_.__l.__data_) = 136446210;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
    _os_log_impl(&dword_1D2EDA000, v3, OS_LOG_TYPE_INFO, "MultiIndexV2::flush : flushing index segment @ %{public}s", (uint8_t *)&__p, 0xCu);
  }
  if (*((_DWORD *)this + 56) != -1
    && (skit::internal::BlobFile::flush((skit::internal::MultiIndexV2 *)((char *)this + 200), 0)
     || skit::internal::BlobFile::close((skit::internal::MultiIndexV2 *)((char *)this + 200))))
  {
    goto LABEL_59;
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v23, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  }
  else {
    std::string v23 = v24;
  }
  int v5 = *((_DWORD *)this + 73);
  unsigned int v6 = *((unsigned __int16 *)this + 148);
  uint64_t v7 = *((void *)this + 38);
  if (skit::internal::get_logging_context(void)::once != -1) {
  std::string::size_type v8 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
  {
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1D2EDA000, v8, OS_LOG_TYPE_INFO, "IndexMemImplV2::make_disk_impl : writing index segment", (uint8_t *)&__p, 2u);
  }
  uint64_t v30 = 0;
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v29, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
  }
  else {
    std::string v29 = v23;
  }
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvStore((uint64_t)&__p, (long long *)&v29, skit::default_kv_store_config, unk_1EA697FF8);
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::set_dp_class((uint64_t)&__p, v5);
  __int16 v37 = v6 & 0x1FF;
  if (v35 == -1) {
    uint64_t v36 = v7;
  }
  if (v34) {
    float v9 = *(float *)(v34 + 28);
  }
  else {
    float v9 = *(float *)"33s?";
  }
  unint64_t v10 = *((void *)this + 9);
  if ((skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::open((uint64_t)&__p) & 0x80000000) != 0)
  {
    std::string::size_type v11 = "open term index";
    goto LABEL_50;
  }
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::rehash((uint64_t)&__p, (float)(ceilf((float)v10 / v9) + 0.5)))
  {
    std::string::size_type v11 = "KvStore resize";
LABEL_50:
    if (skit::internal::get_logging_context(void)::once != -1) {
    std::string::size_type v17 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      std::__fs::filesystem::path::__string_view v22 = &v23;
      if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::__fs::filesystem::path::__string_view v22 = (std::string *)v23.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2082;
      *(void *)&buf[14] = v22;
      _os_log_error_impl(&dword_1D2EDA000, v17, OS_LOG_TYPE_ERROR, "IndexMemImplV2::make_disk_imp : %{public}s failed @ %{public}s", buf, 0x16u);
    }
    skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::clear((uint64_t)&__p);
    char v18 = 0;
    goto LABEL_54;
  }
  std::__fs::filesystem::path::__string_view v12 = (char *)this + 64;
  std::string::size_type v11 = "writing posting lists";
  while (1)
  {
    std::__fs::filesystem::path::__string_view v12 = *(char **)v12;
    if (!v12) {
      break;
    }
    std::string::size_type v13 = *((void *)v12 + 8);
    v25.__r_.__value_.__r.__words[0] = *((void *)v12 + 7);
    v25.__r_.__value_.__l.__size_ = 16;
    v25.__r_.__value_.__r.__words[2] = v13;
    uint64_t v14 = *((void *)v12 + 9);
    uint64_t v26 = 8 * *(unsigned int *)(v25.__r_.__value_.__r.__words[0] + 8);
    uint64_t v27 = v14;
    uint64_t v28 = 6 * *(unsigned int *)(v25.__r_.__value_.__r.__words[0] + 12);
    unint64_t v15 = (unint64_t)*((unsigned int *)v12 + 6) >> 1;
    *(void *)buf = *((void *)v12 + 2);
    *(void *)&uint8_t buf[8] = v15;
    if ((skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::put((uint64_t)&__p, (uint64_t)buf, &v25) & 0x80000000) != 0)goto LABEL_50; {
  }
    }
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::flush((uint64_t)&__p, 0))
  {
    std::string::size_type v11 = "flush term index";
    goto LABEL_50;
  }
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close(&__p))
  {
    std::string::size_type v11 = "close term index";
    goto LABEL_50;
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v25, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
  }
  else {
    std::string v25 = v23;
  }
  int v16 = skit::internal::MemMetaStore::write((skit::internal::MultiIndexV2 *)((char *)this + 96), (std::__fs::filesystem::path *)&v25, v5, v6);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  if (v16)
  {
    std::string::size_type v11 = "writing meta store";
    goto LABEL_50;
  }
  char v18 = 1;
LABEL_54:
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore((uint64_t)&__p);
  if ((SHIBYTE(v23.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if ((v18 & 1) == 0) {
      goto LABEL_59;
    }
LABEL_58:
    operator new();
  }
  operator delete(v23.__r_.__value_.__l.__data_);
  if (v18) {
    goto LABEL_58;
  }
LABEL_59:
  if (skit::internal::get_logging_context(void)::once != -1) {
  uint64_t v19 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    std::__fs::filesystem::path::__string_view v21 = &v24;
    if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::__fs::filesystem::path::__string_view v21 = (std::string *)v24.__r_.__value_.__r.__words[0];
    }
    LODWORD(__p.__r_.__value_.__l.__data_) = 136446210;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = (std::string::size_type)v21;
    _os_log_error_impl(&dword_1D2EDA000, v19, OS_LOG_TYPE_ERROR, "MultiIndexV2::flush : flush failed @ %{public}s", (uint8_t *)&__p, 0xCu);
  }
  uint64_t v1 = 0xFFFFFFFFLL;
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  return v1;
}

void sub_1D2EEEE70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *a30,uint64_t a31,int a32,__int16 a33,char a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,void **a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,int a54,__int16 a55,char a56,char a57)
{
  if (a23 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  _Unwind_Resume(a1);
}

uint64_t skit::internal::IndexMemImplV2::clear(skit::internal::IndexMemImplV2 *this)
{
  uint64_t v2 = *(void *)this;
  unint64_t v3 = *((void *)this + 1);
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  v30[0] = v2;
  v30[1] = v3;
  uint64_t v5 = *((void *)this + 2);
  uint64_t v4 = *((void *)this + 3);
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  v31[0] = v5;
  v31[1] = v4;
  int v32 = *((_DWORD *)this + 8);
  *((_DWORD *)this + 8) = 1065353216;
  if (v4)
  {
    unint64_t v6 = *(void *)(v5 + 8);
    if ((v3 & (v3 - 1)) != 0)
    {
      BOOL v8 = v6 >= v3;
      unint64_t v7 = v6 % v3;
      if (!v8) {
        unint64_t v7 = v6;
      }
    }
    else
    {
      unint64_t v7 = (v3 - 1) & v6;
    }
    *(void *)(v2 + 8 * v7) = v31;
  }
  std::__hash_table<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::__unordered_map_hasher<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::hash<skit::internal::Term>,std::equal_to<skit::internal::Term>,true>,std::__unordered_map_equal<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::equal_to<skit::internal::Term>,std::hash<skit::internal::Term>,true>,std::allocator<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>>>::~__hash_table((uint64_t)v30);
  *((void *)this + 5) = 0;
  *((_DWORD *)this + 12) = 621942338;
  *(void *)((char *)this + 52) = 0;
  *(void *)((char *)this + 68) = 0;
  *(void *)((char *)this + 60) = 0;
  *((_DWORD *)this + 19) = 0;
  *((int64x2_t *)this + 5) = vdupq_n_s64(1uLL);
  float v9 = (_WORD *)*((void *)this + 12);
  *((void *)this + 13) = v9;
  int64x2_t v10 = *(int64x2_t *)((char *)this + 104);
  int64x2_t v11 = vshrq_n_s64(vsubq_s64(v10, vdupq_n_s64((unint64_t)v9)), 1uLL);
  unint64_t v12 = 0xCCCCCCCCCCCCCCCDLL * v11.i64[0];
  unint64_t v13 = v12;
  if (0xCCCCCCCCCCCCCCCDLL * v11.i64[1] > v12)
  {
    if ((_WORD *)v10.i64[0] == v9)
    {
      char v18 = 0;
      uint64_t v16 = 10 * v12;
    }
    else
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::internal::CompressedMetaRecord>>(v12);
      unint64_t v15 = (_WORD *)*((void *)this + 12);
      float v9 = (_WORD *)*((void *)this + 13);
      uint64_t v16 = (uint64_t)&v14[10 * v13];
      char v18 = &v14[10 * v17];
      if (v9 != v15)
      {
        uint64_t v19 = v16;
        do
        {
          uint64_t v20 = *(void *)(v9 - 5);
          v9 -= 5;
          __int16 v21 = v9[4];
          *(void *)(v19 - 10) = v20;
          v19 -= 10;
          *(_WORD *)(v19 + 8) = v21;
        }
        while (v9 != v15);
        float v9 = (_WORD *)*((void *)this + 12);
LABEL_15:
        *((void *)this + 12) = v19;
        *((void *)this + 13) = v16;
        *((void *)this + 14) = v18;
        if (v9) {
          operator delete(v9);
        }
        goto LABEL_17;
      }
    }
    uint64_t v19 = v16;
    goto LABEL_15;
  }
LABEL_17:
  std::__fs::filesystem::path::__string_view v22 = (unsigned int *)*((void *)this + 17);
  uint64_t v23 = v22[1];
  if (v23 < 2)
  {
    int v28 = 16 * v23;
    memset(v22 + 4, 128, 16 * v23);
    *((unsigned char *)v22 + (v28 - 1) + 16) = -1;
    v22[2] = 0;
  }
  else
  {
    std::string v25 = malloc_type_aligned_alloc(0x10uLL, 0x160uLL, 0xCAC9F0E5uLL);
    v25[2] = 0x8080808080808080;
    *(_DWORD *)std::string v25 = (unint64_t)(v25 + 2) >> 12;
    *((_DWORD *)v25 + 1) = 1;
    v25[1] = 0xF00000000;
    v25[3] = 0x8080808080808080;
    *((unsigned char *)v25 + 31) = -1;
    uint64_t v26 = *((void *)this + 17);
    uint64_t v27 = (void (*)(void))*((void *)this + 18);
    *((_WORD *)this + 60) = 0;
    *((void *)this + 16) = 0x40000000;
    *((void *)this + 17) = v25;
    *((void *)this + 18) = skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>const::{lambda(skit::internal::FlatSetImpl<std::pair<skit::Uuid,unsigned int>>*)#1}::__invoke;
    if (v26) {
      v27();
    }
  }
  return skit::internal::BlobFile::clear((skit::internal::IndexMemImplV2 *)((char *)this + 152), v24);
}

void sub_1D2EEF1B0(void *a1)
{
}

uint64_t std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::shrink_to_fit(uint64_t result)
{
  uint64_t v1 = *(void **)result;
  uint64_t v2 = *(void **)(result + 8);
  unint64_t v3 = ((uint64_t)v2 - *(void *)result) >> 3;
  if (v3 < (uint64_t)(*(void *)(result + 16) - *(void *)result) >> 3)
  {
    uint64_t v4 = (void *)result;
    v14[4] = result + 16;
    if (v2 == v1)
    {
      float v9 = 0;
      uint64_t v7 = 8 * v3;
    }
    else
    {
      uint64_t v5 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<skit::internal::IndexDiskImplV2>>>(v3);
      unint64_t v6 = (void *)*v4;
      uint64_t v1 = (void *)v4[1];
      uint64_t v7 = (uint64_t)&v5[8 * v3];
      float v9 = &v5[8 * v8];
      if (v1 != (void *)*v4)
      {
        int64x2_t v10 = &v5[8 * v3];
        do
        {
          uint64_t v11 = *--v1;
          void *v1 = 0;
          *((void *)v10 - 1) = v11;
          v10 -= 8;
        }
        while (v1 != v6);
        unint64_t v12 = (void *)*v4;
        uint64_t v1 = (void *)v4[1];
        goto LABEL_9;
      }
    }
    unint64_t v12 = v1;
    int64x2_t v10 = (char *)v7;
LABEL_9:
    *uint64_t v4 = v10;
    v4[1] = v7;
    uint64_t v13 = v4[2];
    _DWORD v4[2] = v9;
    v14[2] = v1;
    v14[3] = v13;
    v14[0] = v12;
    v14[1] = v12;
    return std::__split_buffer<std::unique_ptr<skit::internal::IndexDiskImplV2>>::~__split_buffer((uint64_t)v14);
  }
  return result;
}

void sub_1D2EEF27C(void *a1)
{
}

uint64_t std::__hash_table<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::__unordered_map_hasher<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::hash<skit::internal::Term>,std::equal_to<skit::internal::Term>,true>,std::__unordered_map_equal<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::equal_to<skit::internal::Term>,std::hash<skit::internal::Term>,true>,std::allocator<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>>>::~__hash_table(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      unint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<skit::internal::Term const,skit::internal::PostingListMemImplV2>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
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

std::string *std::__fs::filesystem::path::path[abi:ne180100]<char [15],void>(std::string *this, std::string *a2)
{
  *(_OWORD *)&this->__r_.__value_.__l.__data_ = 0uLL;
  this->__r_.__value_.__r.__words[2] = 0;
  unint64_t v3 = (std::string *)((char *)a2 - 1);
  do
  {
    int v4 = v3->__r_.__value_.__s.__data_[1];
    unint64_t v3 = (std::string *)((char *)v3 + 1);
  }
  while (v4);
  std::string::append[abi:ne180100]<char const*,0>(this, a2, v3);
  return this;
}

void sub_1D2EEF32C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t skit::internal::MultiIndexV2::clear(skit::internal::MultiIndexV2 *this)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  skit::internal::IndexMemImplV2::clear((skit::internal::MultiIndexV2 *)((char *)this + 48));
  int v4 = (void ***)*((void *)this + 3);
  for (uint64_t i = (void ***)*((void *)this + 4);
        i != v4;
        std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](i))
  {
    --i;
  }
  *((void *)this + 4) = v4;
  if (*((char *)this + 23) >= 0) {
    uint64_t v5 = (const std::__fs::filesystem::path *)this;
  }
  else {
    uint64_t v5 = *(const std::__fs::filesystem::path **)this;
  }
  if (skit::internal::remove_all(v5, v2))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v7 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = this;
      if (*((char *)this + 23) < 0) {
        uint64_t v8 = *(skit::internal::MultiIndexV2 **)this;
      }
      int v9 = *__error();
      int v10 = 136446466;
      uint64_t v11 = v8;
      __int16 v12 = 1024;
      int v13 = v9;
      _os_log_error_impl(&dword_1D2EDA000, v7, OS_LOG_TYPE_ERROR, "MultiIndexV2::clear : failed to remove transaction directory @ %{public}s : %{darwin.errno}d", (uint8_t *)&v10, 0x12u);
    }
  }
  uint64_t result = std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::shrink_to_fit((uint64_t)this + 24);
  *((_DWORD *)this + 68) = 0;
  *((unsigned char *)this + 288) = 0;
  return result;
}

uint64_t skit::internal::MultiIndexV2::get_doc_freq(void *a1, uint64_t a2)
{
  v13[6] = *MEMORY[0x1E4F143B8];
  int v4 = (void **)a1[3];
  uint64_t v5 = (void **)a1[4];
  if (v4 == v5)
  {
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = *v4;
      unint64_t v8 = (unint64_t)*(unsigned int *)(a2 + 8) >> 1;
      v11[0] = *(void *)a2;
      v11[1] = v8;
      uint64_t v9 = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::get(v7, (uint64_t)v11);
      skit::internal::IndexDiskImplV2::to_posting_list(v12, v9);
      if (v13[2]) {
        v6 += *(unsigned int *)(v13[0] + 12);
      }
      ++v4;
    }
    while (v4 != v5);
  }
  skit::internal::IndexMemImplV2::get((uint64_t)v12, a1 + 6, a2);
  if (v13[5]) {
    v6 += *(unsigned int *)(v13[3] + 12);
  }
  if (v12[0] != v13) {
    free(v12[0]);
  }
  return v6;
}

uint64_t skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::get(void *a1, uint64_t a2)
{
  if (!a1[3]) {
    return 0;
  }
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file((uint64_t)a1)) {
    return 0;
  }
  uint64_t v4 = a1[3];
  int v5 = skit::internal::murmur3_32(*(skit::internal **)a2, 2 * *(void *)(a2 + 8), *(_DWORD *)(v4 + 12));
  unsigned int v6 = *(_DWORD *)(v4 + 16);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = 0;
  int v8 = v5 & 0x7FFFFFFF;
  unsigned int v9 = (v5 & 0x7FFFFFFFu) % v6;
  unsigned int v10 = v9;
  do
  {
    unint64_t v11 = 0;
    BOOL v12 = 1;
    do
    {
      int v13 = *(_DWORD *)(v4 + ((unint64_t)v10 << 9) + 40 + 4 * v11);
      if (v13 == -1) {
        break;
      }
      if (v13 == v8)
      {
        __dmb(9u);
        uint64_t v14 = *(unsigned int *)(v4 + ((unint64_t)v10 << 9) + 4 * v11 + 296);
        unint64_t v15 = a1[15];
        if (v14 + 6 <= v15)
        {
          uint64_t result = a1[14] + v14;
          if (v15 >= (*(_DWORD *)result + v14))
          {
            uint64_t v17 = *(unsigned __int16 *)(result + 4);
            if (*(void *)(a2 + 8) == v17)
            {
              if (!*(_WORD *)(result + 4)) {
                goto LABEL_18;
              }
              char v18 = (unsigned __int16 *)(result + 6);
              uint64_t v19 = *(skit::internal **)a2;
              while (*(unsigned __int16 *)v19 == *v18)
              {
                ++v18;
                uint64_t v19 = (skit::internal *)((char *)v19 + 2);
                if (!--v17) {
                  goto LABEL_18;
                }
              }
            }
          }
        }
      }
      BOOL v12 = v11++ < 0x3F;
    }
    while (v11 != 64);
    uint64_t result = v7;
LABEL_18:
    if (v12) {
      break;
    }
    unsigned int v10 = (v10 + 1) % *(_DWORD *)(v4 + 16);
    uint64_t v7 = result;
  }
  while (v10 != v9);
  return result;
}

__n128 skit::internal::IndexMemImplV2::get(uint64_t a1, void *a2, uint64_t a3)
{
  v33[3] = *MEMORY[0x1E4F143B8];
  int v5 = *(uint64_t **)a3;
  size_t v6 = *(unsigned int *)(a3 + 8);
  unint64_t v7 = std::__string_view_hash<char16_t>::operator()[abi:ne180100](*(uint64_t **)a3, v6 >> 1);
  int8x8_t v8 = (int8x8_t)a2[1];
  if (!*(void *)&v8) {
    goto LABEL_18;
  }
  unint64_t v9 = v7;
  uint8x8_t v10 = (uint8x8_t)vcnt_s8(v8);
  v10.i16[0] = vaddlv_u8(v10);
  unint64_t v11 = v10.u32[0];
  if (v10.u32[0] > 1uLL)
  {
    unint64_t v12 = v7;
    if (v7 >= *(void *)&v8) {
      unint64_t v12 = v7 % *(void *)&v8;
    }
  }
  else
  {
    unint64_t v12 = (*(void *)&v8 - 1) & v7;
  }
  int v13 = *(uint64_t ***)(*a2 + 8 * v12);
  if (!v13 || (uint64_t v14 = *v13) == 0)
  {
LABEL_18:
    __n128 v29 = 0uLL;
    uint64_t v30 = 0;
LABEL_19:
    LODWORD(v6) = 0;
    *(void *)a1 = a1 + 16;
    goto LABEL_20;
  }
  while (1)
  {
    unint64_t v15 = v14[1];
    if (v9 == v15) {
      break;
    }
    if (v11 > 1)
    {
      if (v15 >= *(void *)&v8) {
        v15 %= *(void *)&v8;
      }
    }
    else
    {
      v15 &= *(void *)&v8 - 1;
    }
    if (v15 != v12) {
      goto LABEL_18;
    }
LABEL_17:
    uint64_t v14 = (uint64_t *)*v14;
    if (!v14) {
      goto LABEL_18;
    }
  }
  if (*((_DWORD *)v14 + 6) != v6) {
    goto LABEL_17;
  }
  uint64_t v16 = (char *)v14[2];
  if (memcmp(v16, v5, v6)) {
    goto LABEL_17;
  }
  uint64_t v19 = (char *)v33;
  long long v31 = v33;
  uint64_t v32 = 0x1800000000;
  if (&v31 == (void **)(v14 + 2))
  {
    __n128 v29 = *(__n128 *)(v14 + 7);
    uint64_t v30 = v14[9];
    goto LABEL_19;
  }
  if (v6 < 0x19)
  {
    if (v6)
    {
      size_t v23 = v6;
      std::string v24 = v33;
      do
      {
        char v25 = *v16++;
        *v24++ = v25;
        --v23;
      }
      while (v23);
    }
  }
  else
  {
    uint64_t v20 = skit::SmallVector<std::byte,24u,false>::allocate(v6);
    __int16 v21 = v20;
    for (uint64_t i = 0; i != v6; ++i)
      *((unsigned char *)v20 + i) = v16[i];
    if (v31 != v33) {
      free(v31);
    }
    long long v31 = v21;
    HIDWORD(v32) = malloc_size(v21);
  }
  LODWORD(v32) = v6;
  __n128 v29 = *(__n128 *)(v14 + 7);
  uint64_t v30 = v14[9];
  if (v31 != v33)
  {
    uint64_t v17 = (_DWORD *)&v32 + 1;
    *(void *)a1 = v31;
    *(_DWORD *)(a1 + 12) = HIDWORD(v32);
    goto LABEL_21;
  }
  uint64_t v26 = (unsigned char *)(a1 + 16);
  *(void *)a1 = a1 + 16;
  if (v6)
  {
    size_t v27 = v6;
    do
    {
      char v28 = *v19++;
      *v26++ = v28;
      --v27;
    }
    while (v27);
  }
LABEL_20:
  uint64_t v17 = (_DWORD *)(a1 + 12);
LABEL_21:
  *uint64_t v17 = 24;
  *(_DWORD *)(a1 + 8) = v6;
  __n128 result = v29;
  *(__n128 *)(a1 + 40) = v29;
  *(void *)(a1 + 56) = v30;
  return result;
}

void sub_1D2EEF97C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  if (a13 != v13) {
    free(a13);
  }
  _Unwind_Resume(exception_object);
}

uint64_t skit::internal::MultiIndexV2::disk_index_size(skit::internal::IndexDiskImplV2 **this, skit::internal::MultiIndexV2 *a2)
{
  if (this == (skit::internal::IndexDiskImplV2 **)a2) {
    return 0;
  }
  unint64_t v3 = this;
  uint64_t v4 = 0;
  do
  {
    if (*v3) {
      v4 += skit::internal::IndexDiskImplV2::mem_size(*v3);
    }
    ++v3;
  }
  while (v3 != (skit::internal::IndexDiskImplV2 **)a2);
  return v4;
}

uint64_t skit::internal::IndexDiskImplV2::mem_size(skit::internal::IndexDiskImplV2 *this)
{
  uint64_t v1 = *((void *)this + 3);
  if (v1) {
    uint64_t v1 = (*(_DWORD *)(v1 + 24) + (*(_DWORD *)(v1 + 16) << 9) + 40);
  }
  unsigned int v2 = *(_DWORD *)(*((void *)this + 24) + 12);
  uint64_t v3 = *((void *)this + 28);
  if (v3) {
    uint64_t v3 = (336 * *(_DWORD *)(v3 + 4) + 16);
  }
  if (v2) {
    uint64_t v4 = 10 * v2 + 48;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 + v1 + v3 + *((void *)this + 37);
}

uint64_t skit::internal::MultiIndexV2::index_count_threshold(skit::internal::IndexDiskImplV2 **this, skit::internal::MultiIndexV2 *a2, unint64_t a3)
{
  if (this == (skit::internal::IndexDiskImplV2 **)a2) {
    return 0;
  }
  int v5 = this;
  uint64_t v6 = 0;
  do
  {
    if (*v5)
    {
      if (skit::internal::IndexDiskImplV2::mem_size(*v5) >= a3) {
        uint64_t v6 = v6;
      }
      else {
        uint64_t v6 = (v6 + 1);
      }
    }
    ++v5;
  }
  while (v5 != (skit::internal::IndexDiskImplV2 **)a2);
  return v6;
}

uint64_t skit::internal::MultiIndexV2::append(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, iovec *a6, int a7, int a8, float _S0)
{
  uint64_t v202 = *MEMORY[0x1E4F143B8];
  *(void *)uu = a4;
  *(void *)&uu[8] = a5;
  if (a2 == a3) {
    return 0;
  }
  float v9 = _S0;
  uint64_t v10 = a3;
  uint64_t v11 = a2;
  uint64_t v12 = a1;
  int v13 = 0;
  uint64_t v14 = (skit::internal::IndexMemImplV2 *)(a1 + 48);
  unint64_t v15 = *(unsigned int *)(a1 + 108);
  v193 = (std::string::size_type *)(a1 + 64);
  __asm { FCVT            H9, S0 }
  unsigned int v192 = *(_DWORD *)(a1 + 108);
  do
  {
    if ((*(_WORD *)(v11 + 40) & 1) == 0) {
      goto LABEL_147;
    }
    int v195 = v13;
    if (*(char *)(v11 + 23) < 0)
    {
      __int16 v21 = *(void **)v11;
      uint64_t v20 = *(void *)(v11 + 8);
    }
    else
    {
      uint64_t v20 = *(unsigned __int8 *)(v11 + 23);
      __int16 v21 = (void *)v11;
    }
    skit::internal::Term::Term(&buf, *(_WORD *)(v11 + 36), v21, v20);
    std::__fs::filesystem::path::__string_view v22 = (char *)buf.__r_.__value_.__r.__words[0];
    size_t v23 = LODWORD(buf.__r_.__value_.__r.__words[1]);
    unint64_t v24 = std::__string_view_hash<char16_t>::operator()[abi:ne180100]((uint64_t *)buf.__r_.__value_.__l.__data_, (unint64_t)LODWORD(buf.__r_.__value_.__r.__words[1]) >> 1);
    unint64_t v25 = v24;
    unint64_t v26 = *(void *)(v12 + 56);
    if (!v26) {
      goto LABEL_25;
    }
    uint8x8_t v27 = (uint8x8_t)vcnt_s8((int8x8_t)v26);
    v27.i16[0] = vaddlv_u8(v27);
    unint64_t v28 = v27.u32[0];
    if (v27.u32[0] > 1uLL)
    {
      unint64_t v15 = v24;
      if (v24 >= v26) {
        unint64_t v15 = v24 % v26;
      }
    }
    else
    {
      unint64_t v15 = (v26 - 1) & v24;
    }
    __n128 v29 = *(std::string::size_type **)(*(void *)v14 + 8 * v15);
    if (!v29 || (std::string::size_type v30 = *v29) == 0)
    {
LABEL_24:
      uint64_t v12 = a1;
LABEL_25:
      uint64_t v32 = (char *)operator new(0x90uLL);
      int v33 = v32;
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v32;
      __p.__r_.__value_.__l.__size_ = (std::string::size_type)v193;
      __p.__r_.__value_.__s.__data_[16] = 0;
      *(void *)uint64_t v32 = 0;
      *((void *)v32 + 1) = v25;
      if (v23 < 0x19)
      {
        uint64_t v36 = v32 + 32;
        *((void *)v32 + 2) = v32 + 32;
        *((_DWORD *)v32 + 6) = v23;
        *((_DWORD *)v32 + 7) = 24;
        if (!v23) {
          goto LABEL_29;
        }
      }
      else
      {
        uint64_t v34 = skit::SmallVector<std::byte,24u,false>::allocate(v23);
        *((void *)v33 + 2) = v34;
        int v35 = malloc_size(v34);
        uint64_t v36 = (unsigned char *)*((void *)v33 + 2);
        *((_DWORD *)v33 + 6) = v23;
        *((_DWORD *)v33 + 7) = v35;
      }
      do
      {
        char v37 = *v22++;
        *v36++ = v37;
        --v23;
      }
      while (v23);
LABEL_29:
      *((_OWORD *)v33 + 5) = 0u;
      uint64_t v38 = v33 + 80;
      *((void *)v38 - 3) = v38;
      *(v38 - 1) = 0u;
      v38[1] = 0u;
      v38[2] = 0u;
      v38[3] = 0u;
      __p.__r_.__value_.__s.__data_[16] = 1;
      float v39 = (float)(unint64_t)(*(void *)(v12 + 72) + 1);
      float v40 = *(float *)(v12 + 80);
      if (v26 && (float)(v40 * (float)v26) >= v39)
      {
LABEL_75:
        int64_t v56 = *(std::string::size_type **)(*(void *)v14 + 8 * v15);
        std::string::size_type v30 = __p.__r_.__value_.__r.__words[0];
        if (v56)
        {
          *(void *)__p.__r_.__value_.__l.__data_ = *v56;
          unint64_t v15 = v192;
        }
        else
        {
          *(void *)__p.__r_.__value_.__l.__data_ = *v193;
          std::string::size_type *v193 = v30;
          *(void *)(*(void *)v14 + 8 * v15) = v193;
          unint64_t v15 = v192;
          if (!*(void *)v30)
          {
LABEL_84:
            __p.__r_.__value_.__r.__words[0] = 0;
            ++*(void *)(v12 + 72);
            std::unique_ptr<std::__hash_node<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,void *>>>>::reset[abi:ne180100]((uint64_t)&__p);
            char v111 = 0;
            goto LABEL_85;
          }
          unint64_t v57 = *(void *)(*(void *)v30 + 8);
          if ((v26 & (v26 - 1)) != 0)
          {
            if (v57 >= v26) {
              v57 %= v26;
            }
          }
          else
          {
            v57 &= v26 - 1;
          }
          int64_t v56 = (std::string::size_type *)(*(void *)v14 + 8 * v57);
        }
        *int64_t v56 = v30;
        goto LABEL_84;
      }
      BOOL v41 = (v26 & (v26 - 1)) != 0;
      if (v26 < 3) {
        BOOL v41 = 1;
      }
      unint64_t v42 = v41 | (2 * v26);
      unint64_t v43 = vcvtps_u32_f32(v39 / v40);
      if (v42 <= v43) {
        int8x8_t prime = (int8x8_t)v43;
      }
      else {
        int8x8_t prime = (int8x8_t)v42;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      }
      unint64_t v26 = *(void *)(v12 + 56);
      if (*(void *)&prime > v26) {
        goto LABEL_41;
      }
      if (*(void *)&prime < v26)
      {
        unint64_t v51 = vcvtps_u32_f32((float)*(unint64_t *)(v12 + 72) / *(float *)(v12 + 80));
        if (v26 < 3 || (uint8x8_t v52 = (uint8x8_t)vcnt_s8((int8x8_t)v26), v52.i16[0] = vaddlv_u8(v52), v52.u32[0] > 1uLL))
        {
          unint64_t v51 = std::__next_prime(v51);
        }
        else
        {
          uint64_t v53 = 1 << -(char)__clz(v51 - 1);
          if (v51 >= 2) {
            unint64_t v51 = v53;
          }
        }
        if (*(void *)&prime <= v51) {
          int8x8_t prime = (int8x8_t)v51;
        }
        if (*(void *)&prime >= v26)
        {
          unint64_t v26 = *(void *)(v12 + 56);
        }
        else
        {
          if (prime)
          {
LABEL_41:
            if (*(void *)&prime >> 61) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            int v45 = operator new(8 * *(void *)&prime);
            long long v46 = *(void **)v14;
            *(void *)uint64_t v14 = v45;
            if (v46) {
              operator delete(v46);
            }
            uint64_t v47 = 0;
            *(int8x8_t *)(v12 + 56) = prime;
            do
              *(void *)(*(void *)v14 + 8 * v47++) = 0;
            while (*(void *)&prime != v47);
            uint64_t v48 = (void *)*v193;
            if (*v193)
            {
              unint64_t v49 = v48[1];
              uint8x8_t v50 = (uint8x8_t)vcnt_s8(prime);
              v50.i16[0] = vaddlv_u8(v50);
              if (v50.u32[0] > 1uLL)
              {
                if (v49 >= *(void *)&prime) {
                  v49 %= *(void *)&prime;
                }
              }
              else
              {
                v49 &= *(void *)&prime - 1;
              }
              *(void *)(*(void *)v14 + 8 * v49) = v193;
              uint64_t v54 = (void *)*v48;
              if (*v48)
              {
                do
                {
                  unint64_t v55 = v54[1];
                  if (v50.u32[0] > 1uLL)
                  {
                    if (v55 >= *(void *)&prime) {
                      v55 %= *(void *)&prime;
                    }
                  }
                  else
                  {
                    v55 &= *(void *)&prime - 1;
                  }
                  if (v55 != v49)
                  {
                    if (!*(void *)(*(void *)v14 + 8 * v55))
                    {
                      *(void *)(*(void *)v14 + 8 * v55) = v48;
                      goto LABEL_66;
                    }
                    *uint64_t v48 = *v54;
                    *uint64_t v54 = **(void **)(*(void *)v14 + 8 * v55);
                    **(void **)(*(void *)v14 + 8 * v55) = v54;
                    uint64_t v54 = v48;
                  }
                  unint64_t v55 = v49;
LABEL_66:
                  uint64_t v48 = v54;
                  uint64_t v54 = (void *)*v54;
                  unint64_t v49 = v55;
                }
                while (v54);
              }
            }
            unint64_t v26 = (unint64_t)prime;
            goto LABEL_70;
          }
          std::__fs::filesystem::path::__string_view v110 = *(void **)v14;
          *(void *)uint64_t v14 = 0;
          if (v110) {
            operator delete(v110);
          }
          unint64_t v26 = 0;
          *(void *)(v12 + 56) = 0;
        }
      }
LABEL_70:
      if ((v26 & (v26 - 1)) != 0)
      {
        if (v25 >= v26) {
          unint64_t v15 = v25 % v26;
        }
        else {
          unint64_t v15 = v25;
        }
      }
      else
      {
        unint64_t v15 = (v26 - 1) & v25;
      }
      goto LABEL_75;
    }
    while (1)
    {
      unint64_t v31 = *(void *)(v30 + 8);
      if (v31 == v25) {
        break;
      }
      if (v28 > 1)
      {
        if (v31 >= v26) {
          v31 %= v26;
        }
      }
      else
      {
        v31 &= v26 - 1;
      }
      if (v31 != v15) {
        goto LABEL_24;
      }
LABEL_23:
      std::string::size_type v30 = *(void *)v30;
      if (!v30) {
        goto LABEL_24;
      }
    }
    if (*(_DWORD *)(v30 + 24) != v23 || memcmp(*(const void **)(v30 + 16), v22, v23)) {
      goto LABEL_23;
    }
    char v111 = 1;
    uint64_t v12 = a1;
    unint64_t v15 = v192;
LABEL_85:
    _S12 = *(float *)(v11 + 32);
    if (*(_DWORD *)(v30 + 80) >= v15 && *(_DWORD *)(v30 + 92))
    {
      uint64_t v65 = 0;
    }
    else
    {
      uint64_t v59 = *(void *)(v30 + 96);
      unint64_t v60 = *(void **)(v30 + 104);
      unint64_t v61 = ((uint64_t)v60 - v59) >> 3;
      unint64_t v62 = *(void *)(v30 + 128);
      if (v61 >= (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v62 - *(void *)(v30 + 120)) >> 1) + 64) >> 6)
      {
        uint64_t v65 = 6;
        goto LABEL_103;
      }
      unint64_t v63 = *(void *)(v30 + 112);
      if ((unint64_t)v60 < v63)
      {
        *unint64_t v60 = 0;
        long long v64 = v60 + 1;
        goto LABEL_102;
      }
      uint64_t v66 = v63 - v59;
      uint64_t v67 = v66 >> 2;
      if (v66 >> 2 <= v61 + 1) {
        uint64_t v67 = v61 + 1;
      }
      if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v68 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v68 = v67;
      }
      if (v68 >> 61) {
        goto LABEL_262;
      }
      uint64_t v69 = (char *)operator new(8 * v68);
      uint64_t v70 = &v69[8 * v61];
      *(void *)uint64_t v70 = 0;
      long long v64 = v70 + 8;
      uint64_t v72 = *(char **)(v30 + 96);
      uint64_t v71 = *(char **)(v30 + 104);
      if (v71 != v72)
      {
        do
        {
          uint64_t v73 = *((void *)v71 - 1);
          v71 -= 8;
          *((void *)v70 - 1) = v73;
          v70 -= 8;
        }
        while (v71 != v72);
        uint64_t v71 = *(char **)(v30 + 96);
      }
      *(void *)(v30 + 96) = v70;
      *(void *)(v30 + 104) = v64;
      *(void *)(v30 + 112) = &v69[8 * v68];
      if (v71) {
        operator delete(v71);
      }
LABEL_102:
      *(void *)(v30 + 104) = v64;
      uint64_t v74 = *(void *)(v30 + 96);
      *(_DWORD *)(v30 + 88) = ((unint64_t)v64 - v74) >> 3;
      *(void *)(v30 + 64) = v74;
      unint64_t v62 = *(void *)(v30 + 128);
      uint64_t v65 = 14;
LABEL_103:
      unint64_t v75 = *(void *)(v30 + 136);
      if (v62 < v75)
      {
        *(_DWORD *)unint64_t v62 = v15;
        if (_S12 <= 65504.0) {
          float v76 = _S12;
        }
        else {
          float v76 = 65504.0;
        }
        if (_S12 >= -65504.0) {
          _S0 = v76;
        }
        else {
          _S0 = *(float *)"";
        }
        __asm { FCVT            H0, S0 }
        *(_WORD *)(v62 + 4) = _H0;
        std::string::size_type v79 = (char *)(v62 + 6);
        goto LABEL_129;
      }
      uint64_t v80 = *(void *)(v30 + 120);
      unint64_t v81 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v62 - v80) >> 1);
      unint64_t v82 = v81 + 1;
      if (v81 + 1 > 0x2AAAAAAAAAAAAAAALL) {
        std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v83 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v75 - v80) >> 1);
      if (2 * v83 > v82) {
        unint64_t v82 = 2 * v83;
      }
      unint64_t v84 = v83 >= 0x1555555555555555 ? 0x2AAAAAAAAAAAAAAALL : v82;
      if (v84 > 0x2AAAAAAAAAAAAAAALL) {
LABEL_262:
      }
        std::__throw_bad_array_new_length[abi:ne180100]();
      uint64_t v85 = (char *)operator new(6 * v84);
      long long v86 = &v85[6 * v81];
      *(_DWORD *)long long v86 = v15;
      if (_S12 <= 65504.0) {
        float v87 = _S12;
      }
      else {
        float v87 = 65504.0;
      }
      if (_S12 >= -65504.0) {
        _S0 = v87;
      }
      else {
        _S0 = *(float *)"";
      }
      __asm { FCVT            H0, S0 }
      *((_WORD *)v86 + 2) = _H0;
      long long v91 = *(_WORD **)(v30 + 120);
      uint64_t v90 = *(_WORD **)(v30 + 128);
      uint64_t v92 = &v85[6 * v81];
      if (v90 != v91)
      {
        do
        {
          int v93 = *(_DWORD *)(v90 - 3);
          v90 -= 3;
          __int16 v94 = v90[2];
          *(_DWORD *)(v92 - 6) = v93;
          v92 -= 6;
          *((_WORD *)v92 + 2) = v94;
        }
        while (v90 != v91);
        uint64_t v90 = *(_WORD **)(v30 + 120);
      }
      long long v95 = &v85[6 * v84];
      std::string::size_type v79 = v86 + 6;
      *(void *)(v30 + 120) = v92;
      *(void *)(v30 + 128) = v86 + 6;
      *(void *)(v30 + 136) = v95;
      if (v90) {
        operator delete(v90);
      }
LABEL_129:
      *(void *)(v30 + 128) = v79;
      uint64_t v96 = *(void *)(v30 + 120);
      *(_DWORD *)(v30 + 92) = -1431655765 * ((unint64_t)&v79[-v96] >> 1);
      *(void *)(v30 + 72) = v96;
      unsigned int v97 = *(_DWORD *)(v30 + 80);
      if (v97 <= v15) {
        unsigned int v97 = v15;
      }
      *(_DWORD *)(v30 + 80) = v97;
      _H0 = *(short float *)(v30 + 84);
      __asm
      {
        FCVT            S1, H0
        FCVT            H2, S12
      }
      if (_S12 > _S1) {
        _H0 = _H2;
      }
      *(short float *)(v30 + 84) = _H0;
      _H0 = *(short float *)(v30 + 86);
      __asm { FCVT            S1, H0 }
      if (_S1 < v9) {
        _H0 = _H9;
      }
      *(short float *)(v30 + 86) = _H0;
      uint64_t v103 = *(void *)(v30 + 104);
      unsigned int v104 = *(_DWORD *)(v103 - 8);
      if (v104 <= v15) {
        unsigned int v104 = v15;
      }
      *(_DWORD *)(v103 - 8) = v104;
      _H0 = *(short float *)(v103 - 4);
      __asm { FCVT            S1, H0 }
      if (_S12 > _S1) {
        _H0 = _H2;
      }
      *(short float *)(v103 - 4) = _H0;
      _H0 = *(short float *)(v103 - 2);
      __asm { FCVT            S1, H0 }
      if (_S1 < v9) {
        _H0 = _H9;
      }
      *(short float *)(v103 - 2) = _H0;
      uint64_t v12 = a1;
    }
    uint64_t v109 = *(void *)(v12 + 88) + v65;
    *(void *)(v12 + 88) = v109;
    if ((v111 & 1) == 0) {
      *(void *)(v12 + 88) = v109 + LODWORD(buf.__r_.__value_.__r.__words[1]) + 22;
    }
    uint64_t v10 = a3;
    if ((std::string::size_type *)buf.__r_.__value_.__l.__data_ != &buf.__r_.__value_.__r.__words[2]) {
      free(buf.__r_.__value_.__l.__data_);
    }
    int v13 = v195 + 1;
LABEL_147:
    v11 += 48;
  }
  while (v11 != v10);
  if (!v13) {
    return 0;
  }
  if (v9 <= 65504.0) {
    float v112 = v9;
  }
  else {
    float v112 = 65504.0;
  }
  if (v9 >= 0.0) {
    _S8 = v112;
  }
  else {
    _S8 = 0.0;
  }
  uint64_t v114 = (void *)(v12 + 144);
  unint64_t v116 = *(void *)(v12 + 152);
  unint64_t v115 = *(void *)(v12 + 160);
  if (v116 >= v115)
  {
    unint64_t v120 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v116 - *v114) >> 1);
    unint64_t v121 = v120 + 1;
    if (v120 + 1 > 0x1999999999999999) {
      std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v122 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v115 - *v114) >> 1);
    if (2 * v122 > v121) {
      unint64_t v121 = 2 * v122;
    }
    if (v122 >= 0xCCCCCCCCCCCCCCCLL) {
      unint64_t v123 = 0x1999999999999999;
    }
    else {
      unint64_t v123 = v121;
    }
    stat v124 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::internal::CompressedMetaRecord>>(v123);
    uint64_t v125 = &v124[10 * v120];
    uint64_t v127 = &v124[10 * v126];
    __asm { FCVT            H0, S8 }
    *(_WORD *)uint64_t v125 = _H0;
    *(void *)(v125 + 2) = 0xFFFFFFFFLL;
    uint64_t v118 = v125 + 10;
    unsigned int v130 = *(_WORD **)(a1 + 144);
    unsigned int v129 = *(_WORD **)(a1 + 152);
    if (v129 != v130)
    {
      do
      {
        uint64_t v131 = *(void *)(v129 - 5);
        v129 -= 5;
        __int16 v132 = v129[4];
        *(void *)(v125 - 10) = v131;
        v125 -= 10;
        *((_WORD *)v125 + 4) = v132;
      }
      while (v129 != v130);
      unsigned int v129 = (_WORD *)*v114;
    }
    *(void *)(a1 + 144) = v125;
    *(void *)(a1 + 152) = v118;
    *(void *)(a1 + 160) = v127;
    if (v129) {
      operator delete(v129);
    }
  }
  else
  {
    __asm { FCVT            H0, S8 }
    *(_WORD *)unint64_t v116 = _H0;
    *(void *)(v116 + 2) = 0xFFFFFFFFLL;
    uint64_t v118 = (char *)(v116 + 10);
  }
  v134 = (_DWORD *)(a1 + 112);
  int v133 = *(_DWORD *)(a1 + 112);
  *(void *)(a1 + 152) = v118;
  int v135 = *(_DWORD *)(a1 + 108) + 1;
  float v136 = *(float *)(a1 + 116);
  if (v136 < _S8) {
    float v136 = _S8;
  }
  *(float *)(a1 + 116) = v136;
  if (_S8 < 0.00000011921) {
    ++v133;
  }
  *(_DWORD *)(a1 + 108) = v135;
  _DWORD *v134 = v133;
  uint64_t v119 = *(void *)(a1 + 136);
  *(void *)(a1 + 136) = v119 + 1;
  if (v119 < 1) {
    return v119;
  }
  if (uuid_is_null(uu)) {
    goto LABEL_209;
  }
  uint64_t v137 = *(void *)(a1 + 128);
  unsigned int v138 = v119 - v137;
  if (v119 < v137 || *(void *)(a1 + 136) <= v119)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v172 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      return -1;
    }
    std::string::size_type v176 = *(void *)(a1 + 128);
    std::string::size_type v177 = *(void *)(a1 + 136);
    LODWORD(buf.__r_.__value_.__l.__data_) = 134218496;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v176;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v177;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
    uint64_t v201 = v119;
    int v175 = "MemMetaStore::set_external_id : invalid document id : [%lli, %lli], %lli";
    goto LABEL_244;
  }
  _H0 = *(_WORD *)(*v114 + 10 * v138);
  __asm { FCVT            S0, H0 }
  if (_S0 < 0.00000011921) {
    goto LABEL_203;
  }
  *(_OWORD *)&buf.__r_.__value_.__l.__data_ = *(_OWORD *)uu;
  LODWORD(buf.__r_.__value_.__r.__words[2]) = v119 - v137;
  long long v141 = *(_DWORD **)(a1 + 184);
  unsigned int v143 = v141[1];
  int v142 = v141[2];
  unsigned int v144 = v141[3];
  if (v142 + 1 > v144 * v143 - 1)
  {
    unint64_t v181 = (*(void *)(a1 + 176) - 16) / 0x150uLL;
    if (v143 != v181)
    {
      unsigned int v182 = v143 + (v143 >> 1);
      unsigned int v183 = (v142 + v144) / v144;
      if (v182 + 1 < v181) {
        unsigned int v184 = v182 + 1;
      }
      else {
        unsigned int v184 = (*(void *)(a1 + 176) - 16) / 0x150uLL;
      }
      if (v182 + 1 >= v183) {
        unsigned int v185 = v184;
      }
      else {
        unsigned int v185 = v183;
      }
      if (!skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::rehash(a1 + 168, v185))
      {
        long long v141 = *(_DWORD **)(a1 + 184);
        unsigned int v143 = v141[1];
        goto LABEL_190;
      }
      return -1;
    }
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v187 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      return -1;
    }
    LOWORD(__p.__r_.__value_.__l.__data_) = 0;
    int v175 = "FlatSetBase::ensure_capacity : required capacity exceeded the maximum";
    p_p = &__p;
    v179 = v187;
    uint32_t v180 = 2;
    goto LABEL_245;
  }
LABEL_190:
  unsigned int v145 = skit::internal::murmur3_32((skit::internal *)&buf, 0x10uLL, 0);
  int v146 = v145 & 0x7F;
  LODWORD(v147) = 16 * ((*v141 ^ (v145 >> 7)) % v143);
  unint64_t v148 = 16 * v143;
  uint64_t v149 = (uint64_t)&v141[v148 / 4 + 4];
  for (unsigned int i = v147; ; unsigned int i = (v151 + 1) % v148)
  {
    unsigned int v151 = i;
    int v152 = *((unsigned __int8 *)v141 + i + 16);
    if (v152 == v146)
    {
      uint64_t v153 = v149 + 20 * v151;
      _ZF = buf.__r_.__value_.__r.__words[0] == *(void *)v153
         && buf.__r_.__value_.__l.__size_ == *(void *)(v153 + 8);
      if (_ZF)
      {
        *(_DWORD *)(v153 + 16) = v138;
        goto LABEL_202;
      }
    }
    if (v152 == 128) {
      break;
    }
  }
  v155 = (char *)v141 + v147;
  int v157 = v155[16];
  uint64_t v156 = v155 + 16;
  if (v157 >= -1)
  {
    do
    {
      uint64_t v147 = ((int)v147 + 1) % v148;
      uint64_t v156 = (char *)v141 + v147 + 16;
    }
    while ((char)*v156 > -2);
  }
  uint64_t v158 = v149 + 20 * v147;
  *(_OWORD *)uint64_t v158 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
  *(_DWORD *)(v158 + 16) = buf.__r_.__value_.__r.__words[2];
  *uint64_t v156 = v146;
  ++v141[2];
  v134 = (_DWORD *)(a1 + 124);
LABEL_202:
  ++*v134;
LABEL_203:
  if (a8)
  {
    uint64_t v159 = *(void *)(a1 + 24);
    uint64_t v160 = *(void *)(a1 + 32);
    if (v159 != v160)
    {
      uint64_t v161 = v159 + 8;
      do
      {
        if (skit::internal::DiskMetaStore::set_doc_wgt((void *)(*(void *)(v161 - 8) + 168), (skit::internal *)uu, 0.0))break; {
        _ZF = v161 == v160;
        }
        v161 += 8;
      }
      while (!_ZF);
    }
  }
LABEL_209:
  unsigned int v162 = a7;
  v163 = a6;
  if (a6 && a7 >= 1)
  {
    if (*(_DWORD *)(a1 + 224) == -1)
    {
      snprintf(__str, 0xFuLL, "index-%08x", *(_DWORD *)(a1 + 272));
      std::__fs::filesystem::path::path[abi:ne180100]<char [15],void>(&__p, (std::string *)__str);
      std::__fs::filesystem::operator/[abi:ne180100](&buf, a1, (std::__fs::filesystem::path *)&__p);
      v163 = a6;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v196, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
      }
      else {
        std::string v196 = buf;
      }
      int v186 = skit::internal::IndexMemImplV2::open_doc_store(v14, (std::__fs::filesystem::path *)&v196, *(_DWORD *)(a1 + 292), *(unsigned __int16 *)(a1 + 296), *(void *)(a1 + 312));
      if (SHIBYTE(v196.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v196.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(buf.__r_.__value_.__l.__data_);
      }
      unsigned int v162 = a7;
      if (v186) {
        return -1;
      }
    }
    if (*(void *)(a1 + 128) <= v119 && *(void *)(a1 + 136) > v119)
    {
      skit::internal::BlobFile::append((skit::internal::BlobFile *)&buf, (const iovec *)(a1 + 200), v163, v162);
      if ((buf.__r_.__value_.__r.__words[2] & 0x80000000) == 0)
      {
        int v164 = buf.__r_.__value_.__r.__words[1];
        uint64_t v165 = *(void *)(a1 + 144) + 10 * (v119 - *(_DWORD *)(a1 + 128));
        *(_DWORD *)(v165 + 2) = buf.__r_.__value_.__l.__data_;
        *(_DWORD *)(v165 + 6) = v164;
        *(_DWORD *)(a1 + 120) += v164;
        goto LABEL_216;
      }
      return -1;
    }
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v172 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      return -1;
    }
    std::string::size_type v173 = *(void *)(a1 + 128);
    std::string::size_type v174 = *(void *)(a1 + 136);
    LODWORD(buf.__r_.__value_.__l.__data_) = 134218496;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v173;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2048;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = v174;
    HIWORD(buf.__r_.__value_.__r.__words[2]) = 2048;
    uint64_t v201 = v119;
    int v175 = "MemMetaStore::set_document : invalid document id : [%lli, %lli], %lli";
LABEL_244:
    p_p = &buf;
    v179 = v172;
    uint32_t v180 = 32;
LABEL_245:
    _os_log_error_impl(&dword_1D2EDA000, v179, OS_LOG_TYPE_ERROR, v175, (uint8_t *)p_p, v180);
    return -1;
  }
LABEL_216:
  unsigned int v166 = *(_DWORD *)(a1 + 108);
  if (v166 == *(_DWORD *)(a1 + 112))
  {
    if (v166 != -2) {
      return v119;
    }
  }
  else
  {
    uint64_t v167 = *(void *)(a1 + 184);
    if (*(_DWORD *)(v167 + 8)) {
      uint64_t v168 = (336 * *(_DWORD *)(v167 + 4) + 16);
    }
    else {
      uint64_t v168 = 0;
    }
    uint64_t v169 = 10 * v166 + 48;
    if (!v166) {
      uint64_t v169 = 0;
    }
    if ((unint64_t)(*(void *)(a1 + 88) + 14 * *(void *)(a1 + 72) + v168 + *(void *)(a1 + 232) + v169 + 40) <= *(void *)(a1 + 280)
      && v166 != -2)
    {
      return v119;
    }
  }
  if ((skit::internal::MultiIndexV2::flush((skit::internal::MultiIndexV2 *)a1) & 0x80000000) != 0) {
    return -1;
  }
  return v119;
}

void sub_1D2EF0A7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *__p,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  if (a42 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t skit::internal::IndexMemImplV2::open_doc_store(skit::internal::IndexMemImplV2 *this, std::__fs::filesystem::path *a2, int a3, unsigned int a4, uint64_t a5)
{
  buf[3] = *MEMORY[0x1E4F143B8];
  if (SHIBYTE(a2->__pn_.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, a2->__pn_.__r_.__value_.__l.__data_, a2->__pn_.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = a2->__pn_;
  }
  std::string::append(&__p, ".ids", 4uLL);
  if (*((_DWORD *)this + 44) == -1)
  {
    *((void *)this + 27) = a5;
    buf[0] = __p.__r_.__value_.__l.__size_;
    std::string::size_type v9 = __p.__r_.__value_.__r.__words[0];
    *(void *)((char *)buf + 7) = *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7);
    char v10 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    memset(&__p, 0, sizeof(__p));
    if (*((char *)this + 175) < 0) {
      operator delete(*((void **)this + 19));
    }
    uint64_t v11 = buf[0];
    *((void *)this + 19) = v9;
    *((void *)this + 20) = v11;
    *(void *)((char *)this + 167) = *(void *)((char *)buf + 7);
    *((unsigned char *)this + 175) = v10;
    uint64_t v12 = skit::internal::BlobFile::open((skit::internal::IndexMemImplV2 *)((char *)this + 152), 1538, a3, a4);
  }
  else
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v12;
}

uint64_t skit::internal::MultiIndexV2::search(void *a1, unint64_t *a2, void *a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7, int a8, float a9)
{
  v478 = a3;
  int v13 = a2;
  v462 = a1;
  uint64_t v488 = *MEMORY[0x1E4F143B8];
  float v479 = a9;
  unsigned int v467 = a6;
  unint64_t v14 = a6 + 1;
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a2[2] - *a2) >> 3) < v14)
  {
    uint64_t v15 = (uint64_t)(a2[1] - *a2) / 40;
    uint64_t v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Hit>>(v14);
    uint64_t v17 = &v16[40 * v15];
    char v18 = &v16[40 * (void)a2];
    unint64_t v19 = *v13;
    unint64_t v14 = v13[1];
    uint64_t v20 = v17;
    if (v14 != *v13)
    {
      do
      {
        long long v21 = *(_OWORD *)(v14 - 40);
        long long v22 = *(_OWORD *)(v14 - 24);
        *((void *)v20 - 1) = *(void *)(v14 - 8);
        *(_OWORD *)(v20 - 24) = v22;
        *(_OWORD *)(v20 - 40) = v21;
        v20 -= 40;
        v14 -= 40;
      }
      while (v14 != v19);
      unint64_t v14 = *v13;
    }
    *int v13 = (unint64_t)v20;
    v13[1] = (unint64_t)v17;
    v13[2] = (unint64_t)v18;
    if (v14) {
      operator delete((void *)v14);
    }
  }
  unsigned int v459 = a5;
  if (a5 == 2)
  {
    a7 = 1;
  }
  else if (a5 == 3)
  {
    a7 = -1431655765 * ((v478[1] - *v478) >> 4);
  }
  uint64_t v23 = *v478;
  uint64_t v465 = v478[1];
  uint64_t v464 = v23;
  uint64_t v24 = v465 - v23;
  size_t v25 = v24 >> 1;
  unint64_t v458 = 0xAAAAAAAAAAAAAAABLL * (v24 >> 4);
  if (v458 > 0x3F) {
    operator new[]();
  }
  size_t v26 = 0xAAAAAAAAAAAAAAACLL * (v24 >> 4);
  MEMORY[0x1F4188790](v14, a2);
  unint64_t v27 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  v474 = &v455[-v27];
  bzero(&v455[-v27], v25);
  MEMORY[0x1F4188790](v28, v29);
  std::string::size_type v30 = &v455[-v27];
  bzero(&v455[-v27], v25);
  MEMORY[0x1F4188790](v31, v32);
  v461 = &v455[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  bzero(v461, v26);
  unsigned int v466 = a7;
  int v456 = a8;
  switch(a4)
  {
    case 0:
      uint64_t v33 = v478[1] - *v478;
      if (v33)
      {
        unint64_t v34 = v33 / 48;
        if (v34 <= 1) {
          unint64_t v34 = 1;
        }
        memset_pattern16(v461, &unk_1D2F007B0, 4 * v34);
      }
      break;
    case 1:
      uint64_t v37 = *v478;
      uint64_t v36 = v478[1];
      uint64_t v38 = (uint64_t *)v462[3];
      float v39 = (uint64_t *)v462[4];
      if (v38 == v39)
      {
        uint64_t v40 = 0;
      }
      else
      {
        uint64_t v40 = 0;
        do
        {
          uint64_t v41 = *v38++;
          v40 += *(unsigned int *)(*(void *)(v41 + 192) + 12);
        }
        while (v38 != v39);
      }
      if (v36 != v37)
      {
        uint64_t v67 = 0;
        uint64_t v68 = (unsigned __int128)((v36 - v37) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
        uint64_t v69 = (v68 >> 3) + ((unint64_t)v68 >> 63);
        float v70 = (float)(v40 + (unint64_t)*((unsigned int *)v462 + 27));
        uint64_t v71 = (float *)v461;
        do
        {
          uint64_t v72 = *v478;
          uint64_t v73 = *v478 + v67;
          if (*(_WORD *)(v73 + 40))
          {
            if (*(char *)(v73 + 23) < 0)
            {
              uint64_t v76 = v72 + v67;
              unint64_t v75 = *(void **)v76;
              uint64_t v74 = *(void *)(v76 + 8);
            }
            else
            {
              uint64_t v74 = *(unsigned __int8 *)(v73 + 23);
              unint64_t v75 = (void *)(v72 + v67);
            }
            skit::internal::Term::Term(buf, *(_WORD *)(v73 + 36), v75, v74);
            uint64_t doc_freq = skit::internal::MultiIndexV2::get_doc_freq(v462, (uint64_t)buf);
            float *v71 = log10f((float)(v70 / (float)(unint64_t)doc_freq) + 1.0);
            if (*(void **)buf != v482) {
              free(*(void **)buf);
            }
          }
          else
          {
            float *v71 = 0.0;
          }
          ++v71;
          v67 += 48;
          --v69;
        }
        while (v69);
      }
      break;
    case 2:
      uint64_t v43 = *v478;
      uint64_t v42 = v478[1];
      std::__fs::filesystem::path::__string_view v44 = (uint64_t *)v462[3];
      int v45 = (uint64_t *)v462[4];
      if (v44 == v45)
      {
        uint64_t v46 = 0;
      }
      else
      {
        uint64_t v46 = 0;
        do
        {
          uint64_t v47 = *v44++;
          v46 += *(unsigned int *)(*(void *)(v47 + 192) + 12);
        }
        while (v44 != v45);
      }
      if (v42 != v43)
      {
        uint64_t v78 = 0;
        uint64_t v79 = (unsigned __int128)((v42 - v43) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
        float v80 = (float)(v46 + (unint64_t)*((unsigned int *)v462 + 27));
        uint64_t v81 = (v79 >> 3) + ((unint64_t)v79 >> 63);
        unint64_t v82 = (float *)v461;
        do
        {
          uint64_t v83 = *v478;
          uint64_t v84 = *v478 + v78;
          if (*(_WORD *)(v84 + 40))
          {
            if (*(char *)(v84 + 23) < 0)
            {
              uint64_t v87 = v83 + v78;
              long long v86 = *(void **)v87;
              uint64_t v85 = *(void *)(v87 + 8);
            }
            else
            {
              uint64_t v85 = *(unsigned __int8 *)(v84 + 23);
              long long v86 = (void *)(v83 + v78);
            }
            skit::internal::Term::Term(buf, *(_WORD *)(v84 + 36), v86, v85);
            uint64_t v88 = skit::internal::MultiIndexV2::get_doc_freq(v462, (uint64_t)buf);
            *unint64_t v82 = logf((float)((float)((float)(v80 - (float)(unint64_t)v88) + 0.5)/ (float)((float)(unint64_t)v88 + 0.5))+ 1.0);
            if (*(void **)buf != v482) {
              free(*(void **)buf);
            }
          }
          else
          {
            *unint64_t v82 = 0.0;
          }
          ++v82;
          v78 += 48;
          --v81;
        }
        while (v81);
      }
      break;
    case 3:
      uint64_t v49 = *v478;
      uint64_t v48 = v478[1];
      uint64_t v50 = (v48 - *v478) / 48;
      if (v48 == *v478)
      {
        float v55 = 0.0;
        float v52 = 0.0;
      }
      else
      {
        uint64_t v51 = 0;
        float v52 = 0.0;
        uint64_t v53 = (v48 - *v478) / 48;
        uint64_t v54 = (float *)v461;
        float v55 = 0.0;
        do
        {
          uint64_t v56 = *v478;
          uint64_t v57 = *v478 + v51;
          if (*(_WORD *)(v57 + 40))
          {
            if (*(char *)(v57 + 23) < 0)
            {
              uint64_t v60 = v56 + v51;
              uint64_t v59 = *(void **)v60;
              uint64_t v58 = *(void *)(v60 + 8);
            }
            else
            {
              uint64_t v58 = *(unsigned __int8 *)(v57 + 23);
              uint64_t v59 = (void *)(v56 + v51);
            }
            skit::internal::Term::Term(buf, *(_WORD *)(v57 + 36), v59, v58);
            float v61 = (float)(unint64_t)skit::internal::MultiIndexV2::get_doc_freq(v462, (uint64_t)buf);
            *uint64_t v54 = v61;
            if (*(void **)buf != v482) {
              free(*(void **)buf);
            }
            float v52 = v52 + 1.0;
            float v55 = v55 + v61;
          }
          else
          {
            *uint64_t v54 = 0.0;
          }
          ++v54;
          v51 += 48;
          --v53;
        }
        while (v53);
      }
      if (v48 != v49)
      {
        BOOL v89 = (float *)v461;
        do
        {
          *BOOL v89 = 1.0
               - (float)(*v89
                       * (float)((float)((float)((float)((float)(v52 * (float)(v52 * v52)) + (float)(v52 * -2.0)) + 1.0)
                                       * 0.5)
                               / (float)(v55 * (float)(v52 * (float)(v52 * v52)))));
          ++v89;
          --v50;
        }
        while (v50);
      }
      break;
    case 4:
      uint64_t v62 = v478[1] - *v478;
      if (v62)
      {
        unint64_t v63 = v62 / 48;
        if (v63 <= 1) {
          unint64_t v63 = 1;
        }
        long long v64 = (int *)(*v478 + 32);
        uint64_t v65 = v461;
        do
        {
          int v66 = *v64;
          v64 += 12;
          *v65++ = v66;
          --v63;
        }
        while (v63);
      }
      break;
    default:
      if (skit::internal::get_logging_context(void)::once != -1) {
      int v35 = skit::internal::get_logging_context(void)::logger;
      }
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)std::string buf = 0;
        _os_log_fault_impl(&dword_1D2EDA000, v35, OS_LOG_TYPE_FAULT, "MultiIndexV2::token_wgts : Unknown token weight method", buf, 2u);
      }
      break;
  }
  uint64_t v457 = 0;
  uint64_t v90 = (uint64_t **)v462[4];
  v470 = (uint64_t **)v462[3];
  v463 = v90;
  v468 = v13;
  unsigned int v91 = v467;
  if (v470 != v90)
  {
    v472 = &v486;
    v476 = v482;
    v475 = (uint64_t *)(v30 + 8);
    uint64_t v92 = v458;
    if (v458 <= 1) {
      uint64_t v92 = 1;
    }
    uint64_t v460 = v92;
    v471 = (long long *)(v30 + 24);
    v469 = (float *)(v30 + 16);
    do
    {
      if (v465 != v464)
      {
        uint64_t v93 = 0;
        unsigned int v94 = 0;
        v477 = *v470;
        long long v95 = (int *)v461;
        uint64_t v96 = v460;
        do
        {
          uint64_t v97 = *v478;
          uint64_t v98 = *v478 + v93;
          if (*(_WORD *)(v98 + 40))
          {
            if (*(char *)(v98 + 23) < 0)
            {
              uint64_t v101 = v97 + v93;
              std::__fs::filesystem::path v100 = *(void **)v101;
              uint64_t v99 = *(void *)(v101 + 8);
            }
            else
            {
              uint64_t v99 = *(unsigned __int8 *)(v98 + 23);
              std::__fs::filesystem::path v100 = (void *)(v97 + v93);
            }
            skit::internal::Term::Term(buf, *(_WORD *)(v98 + 36), v100, v99);
            v480[0] = *(void *)buf;
            v480[1] = (unint64_t)*(unsigned int *)&buf[8] >> 1;
            uint64_t v102 = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::get(v477, (uint64_t)v480);
            skit::internal::IndexDiskImplV2::to_posting_list(&v485, v102);
            if (v487)
            {
              uint64_t v103 = &v474[24 * v94];
              unsigned int v104 = v472;
              *(_OWORD *)uint64_t v103 = *(_OWORD *)v472;
              uint64_t v105 = *((void *)v104 + 2);
              *((void *)v103 + 2) = v105;
              std::__fs::filesystem::path::__string_view v106 = &v30[24 * v94];
              int v107 = *v95;
              *(void *)std::__fs::filesystem::path::__string_view v106 = v103;
              *((void *)v106 + 1) = v105;
              *((_DWORD *)v106 + 4) = v107;
              ++v94;
            }
            if (*(void **)buf != v476) {
              free(*(void **)buf);
            }
          }
          ++v95;
          v93 += 48;
          --v96;
        }
        while (v96);
        unsigned int v108 = v466;
        uint64_t v109 = v469;
        if (v94 >= v466)
        {
          uint64_t v473 = *(void *)(v477[24] + 32);
          if (v94 < 2)
          {
            if (v94 == 1)
            {
              v266 = (unsigned int *)*((void *)v30 + 1);
              if ((unint64_t)v266 < *(void *)(*(void *)v30 + 16)
                                          + 6 * (unint64_t)*(unsigned int *)(**(void **)v30 + 12))
              {
                do
                {
                  uint64_t v267 = v473 + *v266;
                  _H0 = *((_WORD *)v266 + 2);
                  __asm { FCVT            S0, H0 }
                  _H1 = *(_WORD *)(v477[26] + 10 * (v267 - *(_DWORD *)(v477[24] + 32)));
                  __asm { FCVT            S1, H1 }
                  v272 = *(void **)v30;
                  v266 = (unsigned int *)(*((void *)v30 + 1) + 6);
                  *((void *)v30 + 1) = v266;
                }
                while ((unint64_t)v266 < v272[2] + 6 * (unint64_t)*(unsigned int *)(*v272 + 12));
              }
            }
          }
          else if (v459 <= 4)
          {
            switch(v459)
            {
              case 1u:
                while (1)
                {
                  if (v94 == 1)
                  {
                    LODWORD(v166) = 0;
                  }
                  else
                  {
                    if (!v94) {
                      goto LABEL_93;
                    }
                    uint64_t v159 = -1;
                    uint64_t v160 = v471;
                    for (uint64_t i = 1; i != v94; ++i)
                    {
                      uint64_t v162 = v159;
                      v163 = v160;
                      do
                      {
                        if (**((_DWORD **)v163 + 1) >= **((_DWORD **)v163 - 2)) {
                          break;
                        }
                        long long v164 = *v163;
                        v482[0] = *((void *)v163 + 2);
                        *(_OWORD *)std::string buf = v164;
                        long long *v163 = *(long long *)((char *)v163 - 24);
                        *((_DWORD *)v163 + 4) = *((_DWORD *)v163 - 2);
                        long long v165 = *(_OWORD *)buf;
                        *((_DWORD *)v163 - 2) = v482[0];
                        *(long long *)((char *)v163 - 24) = v165;
                        v163 = (long long *)((char *)v163 - 24);
                        _CF = __CFADD__(v162++, 1);
                      }
                      while (!_CF);
                      uint64_t v160 = (long long *)((char *)v160 + 24);
                      --v159;
                    }
                    uint64_t v166 = v94 - 1;
                    uint64_t v167 = 0;
                    float v168 = 0.0;
                    uint64_t v169 = v109;
                    float v170 = 0.0;
                    while (1)
                    {
                      uint64_t v171 = **((void **)v169 - 2);
                      _H3 = *(_WORD *)(v171 + 4);
                      __asm { FCVT            S3, H3 }
                      float v168 = v168 + (float)(*v169 * _S3);
                      LOWORD(_S3) = *(_WORD *)(v171 + 6);
                      __asm { FCVT            S3, H3 }
                      if (v170 < _S3) {
                        float v170 = _S3;
                      }
                      if ((float)(v168 * v170) > v479) {
                        break;
                      }
                      ++v167;
                      v169 += 6;
                      if (v166 == v167) {
                        goto LABEL_149;
                      }
                    }
                    LODWORD(v166) = v167;
                  }
LABEL_149:
                  uint64_t v175 = 0;
                  uint64_t v176 = **(unsigned int **)&v30[24 * v166 + 8];
                  if ((v166 + 1) > 1) {
                    uint64_t v177 = (v166 + 1);
                  }
                  else {
                    uint64_t v177 = 1;
                  }
                  float v178 = 0.0;
                  v179 = v475;
                  float v180 = 0.0;
                  do
                  {
                    unint64_t v181 = (void *)*(v179 - 1);
                    unint64_t v182 = skit::internal::PostingListV2::seek_to_block(v181, *v179, v176);
                    uint64_t *v179 = v182;
                    uint64_t v183 = v181[2];
                    if (v182 < v183 + 6 * (unint64_t)*(unsigned int *)(*v181 + 12))
                    {
                      uint64_t v184 = (unsigned __int128)((uint64_t)(v182 - v183) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
                      uint64_t v185 = v181[1] + 8 * ((v184 >> 6) + ((unint64_t)v184 >> 63));
                      _H0 = *(_WORD *)(v185 + 4);
                      __asm { FCVT            S0, H0 }
                      float v178 = v178 + _S0;
                      LOWORD(_S0) = *(_WORD *)(v185 + 6);
                      __asm { FCVT            S0, H0 }
                      if (v180 < _S0) {
                        float v180 = _S0;
                      }
                    }
                    ++v175;
                    v179 += 3;
                  }
                  while (v177 != v175);
                  if (v94 <= v175)
                  {
                    int v13 = v468;
                  }
                  else
                  {
                    v189 = &v475[3 * v177];
                    int v13 = v468;
                    while (*(_DWORD *)*v189 == v176)
                    {
                      v190 = (void *)*(v189 - 1);
                      unint64_t v191 = skit::internal::PostingListV2::seek_to_block(v190, *v189, v176);
                      uint64_t *v189 = v191;
                      uint64_t v192 = v190[2];
                      if (v191 < v192 + 6 * (unint64_t)*(unsigned int *)(*v190 + 12))
                      {
                        uint64_t v193 = (unsigned __int128)((uint64_t)(v191 - v192) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
                        uint64_t v194 = v190[1] + 8 * ((v193 >> 6) + ((unint64_t)v193 >> 63));
                        _H0 = *(_WORD *)(v194 + 4);
                        __asm { FCVT            S0, H0 }
                        float v178 = v178 + _S0;
                        LOWORD(_S0) = *(_WORD *)(v194 + 6);
                        __asm { FCVT            S0, H0 }
                        if (v180 < _S0) {
                          float v180 = _S0;
                        }
                      }
                      LODWORD(v177) = v177 + 1;
                      v189 += 3;
                      if (v94 == v177)
                      {
                        LODWORD(v175) = v94;
                        goto LABEL_167;
                      }
                    }
                    LODWORD(v175) = v177;
                  }
LABEL_167:
                  unsigned int v91 = v467;
                  if ((float)(v180 * v178) <= v479)
                  {
                    unsigned int v218 = 0;
                    if (v175 <= 1) {
                      uint64_t v219 = 1;
                    }
                    else {
                      uint64_t v219 = v175;
                    }
                    v220 = v475;
                    uint64_t v221 = v219;
                    uint64_t v109 = v469;
                    do
                    {
                      v222 = (void *)*(v220 - 1);
                      uint64_t v223 = v222[2];
                      if (*v220 < v223 + 6 * (unint64_t)*(unsigned int *)(*v222 + 12)
                        && v218 <= *(_DWORD *)(v222[1] + 8 * ((*v220 - v223) / 384)))
                      {
                        unsigned int v218 = *(_DWORD *)(v222[1] + 8 * ((*v220 - v223) / 384));
                      }
                      v220 += 3;
                      --v221;
                    }
                    while (v221);
                    uint64_t v224 = 0;
                    unsigned int v225 = v218 + 1;
                    do
                    {
                      v226 = &v30[24 * v224];
                      v227 = *(void **)v226;
                      v230 = (char *)*((void *)v226 + 1);
                      v228 = v226 + 8;
                      v229 = v230;
                      uint64_t v231 = v227[2] + 6 * *(unsigned int *)(*v227 + 12) - (void)v230;
                      if (v231)
                      {
                        unint64_t v232 = 0xAAAAAAAAAAAAAAABLL * (v231 >> 1);
                        do
                        {
                          unint64_t v233 = v232 >> 1;
                          v234 = &v229[6 * (v232 >> 1)];
                          unsigned int v236 = *(_DWORD *)v234;
                          v235 = v234 + 6;
                          v232 += ~(v232 >> 1);
                          if (v236 < v225) {
                            v229 = v235;
                          }
                          else {
                            unint64_t v232 = v233;
                          }
                        }
                        while (v232);
                      }
                      void *v228 = v229;
                      ++v224;
                    }
                    while (v224 != v219);
                  }
                  else
                  {
                    uint64_t v198 = 0;
                    uint64_t v199 = v473 + v176;
                    _H0 = *(_WORD *)(v477[26] + 10 * (v473 + v176 - *(_DWORD *)(v477[24] + 32)));
                    if (v175 <= 1) {
                      uint64_t v201 = 1;
                    }
                    else {
                      uint64_t v201 = v175;
                    }
                    float v202 = 0.0;
                    do
                    {
                      v203 = &v30[24 * v198];
                      v204 = *(void **)v203;
                      unint64_t v207 = *((void *)v203 + 1);
                      v205 = (unint64_t *)(v203 + 8);
                      unint64_t v206 = v207;
                      unint64_t v208 = v204[2] + 6 * *(unsigned int *)(*v204 + 12);
                      uint64_t v209 = v208 - v207;
                      if (v208 != v207)
                      {
                        unint64_t v210 = 0xAAAAAAAAAAAAAAABLL * (v209 >> 1);
                        do
                        {
                          unint64_t v211 = v210 >> 1;
                          v212 = (unsigned int *)(v206 + 6 * (v210 >> 1));
                          unsigned int v214 = *v212;
                          v213 = (char *)v212 + 6;
                          v210 += ~(v210 >> 1);
                          if (v214 < v176) {
                            unint64_t v206 = (unint64_t)v213;
                          }
                          else {
                            unint64_t v210 = v211;
                          }
                        }
                        while (v210);
                      }
                      unint64_t *v205 = v206;
                      if (v206 < v208 && *(_DWORD *)v206 == v176)
                      {
                        _H2 = *(_WORD *)(v206 + 4);
                        __asm { FCVT            S2, H2 }
                        float v202 = v202 + (float)(*(float *)&v30[24 * v198 + 16] * _S2);
                        unint64_t *v205 = v206 + 6;
                      }
                      ++v198;
                    }
                    while (v198 != v201);
                    __asm { FCVT            S0, H0 }
                    uint64_t v109 = v469;
                  }
                  unsigned int v237 = 0;
                  do
                  {
                    unint64_t v238 = v237 + 1;
                    if (*(void *)&v30[24 * v237 + 8] >= *(void *)(*(void *)&v30[24 * v237] + 16)
                                                         + 6
                                                         * (unint64_t)*(unsigned int *)(**(void **)&v30[24 * v237]
                                                                                             + 12))
                    {
                      if (v238 < v94)
                      {
                        v239 = &v30[24 * v238];
                        unsigned int v240 = v237;
                        do
                        {
                          v241 = &v30[24 * v240];
                          long long v242 = *(_OWORD *)v239;
                          *((_DWORD *)v241 + 4) = *((_DWORD *)v239 + 4);
                          *(_OWORD *)v241 = v242;
                          ++v238;
                          ++v240;
                          v239 += 24;
                        }
                        while (v238 < v94);
                      }
                      --v94;
                    }
                    else
                    {
                      ++v237;
                    }
                  }
                  while (v237 < v94);
                }
              case 4u:
                while (2)
                {
                  if (v94 == 1) {
                    goto LABEL_216;
                  }
                  if (!v94) {
                    goto LABEL_93;
                  }
                  uint64_t v243 = -1;
                  v244 = v471;
                  for (uint64_t j = 1; j != v94; ++j)
                  {
                    uint64_t v246 = v243;
                    v247 = v244;
                    do
                    {
                      if (**((_DWORD **)v247 + 1) >= **((_DWORD **)v247 - 2)) {
                        break;
                      }
                      long long v248 = *v247;
                      v482[0] = *((void *)v247 + 2);
                      *(_OWORD *)std::string buf = v248;
                      long long *v247 = *(long long *)((char *)v247 - 24);
                      *((_DWORD *)v247 + 4) = *((_DWORD *)v247 - 2);
                      long long v249 = *(_OWORD *)buf;
                      *((_DWORD *)v247 - 2) = v482[0];
                      *(long long *)((char *)v247 - 24) = v249;
                      v247 = (long long *)((char *)v247 - 24);
                      _CF = __CFADD__(v246++, 1);
                    }
                    while (!_CF);
                    v244 = (long long *)((char *)v244 + 24);
                    --v243;
                  }
LABEL_216:
                  uint64_t v250 = 0;
                  uint64_t v251 = *(unsigned int *)*v475;
                  uint64_t v252 = v473 + v251;
                  _H0 = *(_WORD *)(v477[26] + 10 * (v473 + v251 - *(_DWORD *)(v477[24] + 32)));
                  __asm { FCVT            S0, H0 }
                  float v255 = 0.0;
                  v256 = (float *)v475;
                  do
                  {
                    v257 = *(_DWORD **)v256;
                    if (**(_DWORD **)v256 != v251) {
                      goto LABEL_220;
                    }
                    _H2 = *((_WORD *)v257 + 2);
                    __asm { FCVT            S2, H2 }
                    float v255 = v255 + (float)(v256[2] * _S2);
                    *(void *)v256 = (char *)v257 + 6;
                    v256 += 6;
                    ++v250;
                  }
                  while (v94 != v250);
                  LODWORD(v250) = v94;
LABEL_220:
                  unsigned int v260 = 0;
                  do
                  {
                    unint64_t v261 = v260 + 1;
                    if (*(void *)&v30[24 * v260 + 8] >= *(void *)(*(void *)&v30[24 * v260] + 16)
                                                         + 6
                                                         * (unint64_t)*(unsigned int *)(**(void **)&v30[24 * v260]
                                                                                             + 12))
                    {
                      if (v261 < v94)
                      {
                        v262 = &v30[24 * v261];
                        unsigned int v263 = v260;
                        do
                        {
                          v264 = &v30[24 * v263];
                          long long v265 = *(_OWORD *)v262;
                          *((_DWORD *)v264 + 4) = *((_DWORD *)v262 + 4);
                          *(_OWORD *)v264 = v265;
                          ++v261;
                          ++v263;
                          v262 += 24;
                        }
                        while (v261 < v94);
                      }
                      --v94;
                    }
                    else
                    {
                      ++v260;
                    }
                  }
                  while (v260 < v94);
                  continue;
                }
              default:
LABEL_98:
                uint64_t v110 = v94 - 1;
                if (v94 == 1) {
                  goto LABEL_106;
                }
                if (!v94) {
                  goto LABEL_93;
                }
                uint64_t v111 = -1;
                float v112 = v471;
                for (uint64_t k = 1; k != v94; ++k)
                {
                  uint64_t v114 = v111;
                  unint64_t v115 = v112;
                  do
                  {
                    if (**((_DWORD **)v115 + 1) >= **((_DWORD **)v115 - 2)) {
                      break;
                    }
                    long long v116 = *v115;
                    v482[0] = *((void *)v115 + 2);
                    *(_OWORD *)std::string buf = v116;
                    *unint64_t v115 = *(long long *)((char *)v115 - 24);
                    *((_DWORD *)v115 + 4) = *((_DWORD *)v115 - 2);
                    long long v117 = *(_OWORD *)buf;
                    *((_DWORD *)v115 - 2) = v482[0];
                    *(long long *)((char *)v115 - 24) = v117;
                    unint64_t v115 = (long long *)((char *)v115 - 24);
                    _CF = __CFADD__(v114++, 1);
                  }
                  while (!_CF);
                  float v112 = (long long *)((char *)v112 + 24);
                  --v111;
                }
LABEL_106:
                uint64_t v119 = 0;
                float v120 = 0.0;
                unint64_t v121 = v109;
                break;
            }
            while (v110 != v119)
            {
              uint64_t v122 = v119;
              uint64_t v123 = **((void **)v121 - 2);
              _H2 = *(_WORD *)(v123 + 4);
              __asm { FCVT            S2, H2 }
              float v129 = *v121;
              v121 += 6;
              float v120 = v120 + (float)(v129 * _S2);
              LOWORD(_S2) = *(_WORD *)(v123 + 6);
              __asm { FCVT            S2, H2 }
              uint64_t v119 = v122 + 1;
              if ((float)(v120 * _S2) > v479)
              {
                uint64_t v110 = v122;
                goto LABEL_111;
              }
            }
            LODWORD(v122) = v94 - 1;
LABEL_111:
            uint64_t v131 = **(unsigned int **)&v30[24 * v110 + 8];
            if (**((_DWORD **)v30 + 1) == v131)
            {
              uint64_t v132 = 0;
              uint64_t v133 = v473 + v131;
              _H0 = *(_WORD *)(v477[26] + 10 * (v473 + v131 - *(_DWORD *)(v477[24] + 32)));
              __asm { FCVT            S0, H0 }
              float v136 = 0.0;
              uint64_t v137 = (float *)v475;
              do
              {
                unsigned int v138 = *(_DWORD **)v137;
                if (**(_DWORD **)v137 != v131) {
                  goto LABEL_116;
                }
                _H2 = *((_WORD *)v138 + 2);
                __asm { FCVT            S2, H2 }
                float v136 = v136 + (float)(v137[2] * _S2);
                *(void *)uint64_t v137 = (char *)v138 + 6;
                v137 += 6;
                ++v132;
              }
              while (v94 != v132);
              LODWORD(v132) = v94;
LABEL_116:
            }
            else if (v122)
            {
              uint64_t v141 = 0;
              do
              {
                int v142 = &v30[24 * v141];
                unsigned int v143 = *(void **)v142;
                int v146 = (char *)*((void *)v142 + 1);
                unsigned int v144 = v142 + 8;
                unsigned int v145 = v146;
                uint64_t v147 = v143[2] + 6 * *(unsigned int *)(*v143 + 12) - (void)v146;
                if (v147)
                {
                  unint64_t v148 = 0xAAAAAAAAAAAAAAABLL * (v147 >> 1);
                  do
                  {
                    unint64_t v149 = v148 >> 1;
                    v150 = (unsigned int *)&v145[6 * (v148 >> 1)];
                    unsigned int v152 = *v150;
                    unsigned int v151 = (char *)v150 + 6;
                    v148 += ~(v148 >> 1);
                    if (v152 < v131) {
                      unsigned int v145 = v151;
                    }
                    else {
                      unint64_t v148 = v149;
                    }
                  }
                  while (v148);
                }
                void *v144 = v145;
                ++v141;
              }
              while (v141 != v110);
            }
            unsigned int v153 = 0;
            do
            {
              unint64_t v154 = v153 + 1;
              if (*(void *)&v30[24 * v153 + 8] >= *(void *)(*(void *)&v30[24 * v153] + 16)
                                                   + 6
                                                   * (unint64_t)*(unsigned int *)(**(void **)&v30[24 * v153]
                                                                                       + 12))
              {
                if (v154 < v94)
                {
                  v155 = &v30[24 * v154];
                  unsigned int v156 = v153;
                  do
                  {
                    int v157 = &v30[24 * v156];
                    long long v158 = *(_OWORD *)v155;
                    *((_DWORD *)v157 + 4) = *((_DWORD *)v155 + 4);
                    *(_OWORD *)int v157 = v158;
                    ++v154;
                    ++v156;
                    v155 += 24;
                  }
                  while (v154 < v94);
                }
                --v94;
              }
              else
              {
                ++v153;
              }
            }
            while (v153 < v94);
            goto LABEL_98;
          }
        }
      }
LABEL_93:
      ++v470;
    }
    while (v470 != v463);
  }
  if (v465 != v464)
  {
    uint64_t v273 = 0;
    unsigned int v274 = 0;
    v275 = v462 + 6;
    uint64_t v276 = v458 <= 1 ? 1 : v458;
    v277 = (int *)v461;
    do
    {
      uint64_t v278 = *v478;
      uint64_t v279 = *v478 + v273;
      if (*(_WORD *)(v279 + 40))
      {
        if (*(char *)(v279 + 23) < 0)
        {
          uint64_t v282 = v278 + v273;
          v281 = *(void **)v282;
          uint64_t v280 = *(void *)(v282 + 8);
        }
        else
        {
          uint64_t v280 = *(unsigned __int8 *)(v279 + 23);
          v281 = (void *)(v278 + v273);
        }
        skit::internal::Term::Term(&v485, *(_WORD *)(v279 + 36), v281, v280);
        skit::internal::IndexMemImplV2::get((uint64_t)buf, v275, (uint64_t)&v485);
        if (v484)
        {
          v283 = &v474[24 * v274];
          *(_OWORD *)v283 = v483;
          uint64_t v284 = v484;
          *((void *)v283 + 2) = v484;
          v285 = &v30[24 * v274];
          int v286 = *v277;
          *(void *)v285 = v283;
          *((void *)v285 + 1) = v284;
          *((_DWORD *)v285 + 4) = v286;
          ++v274;
        }
        if (*(void **)buf != v482) {
          free(*(void **)buf);
        }
        if (v485 != &v486) {
          free(v485);
        }
      }
      ++v277;
      v273 += 48;
      --v276;
    }
    while (v276);
    if (v274 >= v466)
    {
      v478 = (void *)v462[16];
      if (v274 < 2)
      {
        if (v274 == 1)
        {
          v337 = (unsigned int *)*((void *)v30 + 1);
          if ((unint64_t)v337 < *(void *)(*(void *)v30 + 16)
                                      + 6 * (unint64_t)*(unsigned int *)(**(void **)v30 + 12))
          {
            do
            {
              uint64_t v338 = (uint64_t)v478 + *v337;
              _H0 = *((_WORD *)v337 + 2);
              __asm { FCVT            S0, H0 }
              _H1 = *(_WORD *)(v462[18] + 10 * (v338 - *((_DWORD *)v462 + 32)));
              __asm { FCVT            S1, H1 }
              v343 = *(void **)v30;
              v337 = (unsigned int *)(*((void *)v30 + 1) + 6);
              *((void *)v30 + 1) = v337;
            }
            while ((unint64_t)v337 < v343[2] + 6 * (unint64_t)*(unsigned int *)(*v343 + 12));
          }
        }
      }
      else if (v459 <= 4)
      {
        switch(v459)
        {
          case 1u:
            v476 = v30 + 24;
            v475 = (uint64_t *)(v30 + 16);
            v477 = (uint64_t *)(v30 + 8);
            while (1)
            {
              if (v274 == 1)
              {
                LODWORD(v351) = 0;
              }
              else
              {
                if (!v274) {
                  goto LABEL_252;
                }
                uint64_t v344 = -1;
                v345 = v476;
                for (uint64_t m = 1; m != v274; ++m)
                {
                  uint64_t v347 = v344;
                  v348 = v345;
                  do
                  {
                    if (*(_DWORD *)v348[1] >= *(_DWORD *)*(v348 - 2)) {
                      break;
                    }
                    long long v349 = *(_OWORD *)v348;
                    v482[0] = v348[2];
                    *(_OWORD *)std::string buf = v349;
                    *(_OWORD *)v348 = *(_OWORD *)(v348 - 3);
                    *((_DWORD *)v348 + 4) = *((_DWORD *)v348 - 2);
                    long long v350 = *(_OWORD *)buf;
                    *((_DWORD *)v348 - 2) = v482[0];
                    *(_OWORD *)(v348 - 3) = v350;
                    v348 -= 3;
                    _CF = __CFADD__(v347++, 1);
                  }
                  while (!_CF);
                  v345 += 3;
                  --v344;
                }
                uint64_t v351 = v274 - 1;
                uint64_t v352 = 0;
                float v353 = 0.0;
                v354 = (float *)v475;
                float v355 = 0.0;
                while (1)
                {
                  uint64_t v356 = **((void **)v354 - 2);
                  _H3 = *(_WORD *)(v356 + 4);
                  __asm { FCVT            S3, H3 }
                  float v353 = v353 + (float)(*v354 * _S3);
                  LOWORD(_S3) = *(_WORD *)(v356 + 6);
                  __asm { FCVT            S3, H3 }
                  if (v355 < _S3) {
                    float v355 = _S3;
                  }
                  if ((float)(v353 * v355) > v479) {
                    break;
                  }
                  ++v352;
                  v354 += 6;
                  if (v351 == v352) {
                    goto LABEL_320;
                  }
                }
                LODWORD(v351) = v352;
              }
LABEL_320:
              uint64_t v360 = 0;
              uint64_t v361 = **(unsigned int **)&v30[24 * v351 + 8];
              if ((v351 + 1) > 1) {
                uint64_t v362 = (v351 + 1);
              }
              else {
                uint64_t v362 = 1;
              }
              float v363 = 0.0;
              v364 = v477;
              float v365 = 0.0;
              do
              {
                v366 = (void *)*(v364 - 1);
                unint64_t v367 = skit::internal::PostingListV2::seek_to_block(v366, *v364, v361);
                uint64_t *v364 = v367;
                uint64_t v368 = v366[2];
                if (v367 < v368 + 6 * (unint64_t)*(unsigned int *)(*v366 + 12))
                {
                  uint64_t v369 = (unsigned __int128)((uint64_t)(v367 - v368) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
                  uint64_t v370 = v366[1] + 8 * ((v369 >> 6) + ((unint64_t)v369 >> 63));
                  _H0 = *(_WORD *)(v370 + 4);
                  __asm { FCVT            S0, H0 }
                  float v363 = v363 + _S0;
                  LOWORD(_S0) = *(_WORD *)(v370 + 6);
                  __asm { FCVT            S0, H0 }
                  if (v365 < _S0) {
                    float v365 = _S0;
                  }
                }
                ++v360;
                v364 += 3;
              }
              while (v362 != v360);
              if (v274 <= v360)
              {
                v375 = v468;
              }
              else
              {
                v374 = &v477[3 * v362];
                v375 = v468;
                while (*(_DWORD *)*v374 == v361)
                {
                  v376 = (void *)*(v374 - 1);
                  unint64_t v377 = skit::internal::PostingListV2::seek_to_block(v376, *v374, v361);
                  uint64_t *v374 = v377;
                  uint64_t v378 = v376[2];
                  if (v377 < v378 + 6 * (unint64_t)*(unsigned int *)(*v376 + 12))
                  {
                    uint64_t v379 = (unsigned __int128)((uint64_t)(v377 - v378) * (__int128)0x2AAAAAAAAAAAAAABLL) >> 64;
                    uint64_t v380 = v376[1] + 8 * ((v379 >> 6) + ((unint64_t)v379 >> 63));
                    _H0 = *(_WORD *)(v380 + 4);
                    __asm { FCVT            S0, H0 }
                    float v363 = v363 + _S0;
                    LOWORD(_S0) = *(_WORD *)(v380 + 6);
                    __asm { FCVT            S0, H0 }
                    if (v365 < _S0) {
                      float v365 = _S0;
                    }
                  }
                  LODWORD(v362) = v362 + 1;
                  v374 += 3;
                  if (v274 == v362)
                  {
                    LODWORD(v360) = v274;
                    goto LABEL_338;
                  }
                }
                LODWORD(v360) = v362;
              }
LABEL_338:
              if ((float)(v365 * v363) <= v479)
              {
                unsigned int v405 = 0;
                if (v360 <= 1) {
                  uint64_t v406 = 1;
                }
                else {
                  uint64_t v406 = v360;
                }
                v407 = v477;
                uint64_t v408 = v406;
                do
                {
                  v409 = (void *)*(v407 - 1);
                  uint64_t v410 = v409[2];
                  if (*v407 < v410 + 6 * (unint64_t)*(unsigned int *)(*v409 + 12)
                    && v405 <= *(_DWORD *)(v409[1] + 8 * ((*v407 - v410) / 384)))
                  {
                    unsigned int v405 = *(_DWORD *)(v409[1] + 8 * ((*v407 - v410) / 384));
                  }
                  v407 += 3;
                  --v408;
                }
                while (v408);
                uint64_t v411 = 0;
                unsigned int v412 = v405 + 1;
                do
                {
                  v413 = &v30[24 * v411];
                  v414 = *(void **)v413;
                  v417 = (char *)*((void *)v413 + 1);
                  v415 = v413 + 8;
                  v416 = v417;
                  uint64_t v418 = v414[2] + 6 * *(unsigned int *)(*v414 + 12) - (void)v417;
                  if (v418)
                  {
                    unint64_t v419 = 0xAAAAAAAAAAAAAAABLL * (v418 >> 1);
                    do
                    {
                      unint64_t v420 = v419 >> 1;
                      v421 = &v416[6 * (v419 >> 1)];
                      unsigned int v423 = *(_DWORD *)v421;
                      v422 = v421 + 6;
                      v419 += ~(v419 >> 1);
                      if (v423 < v412) {
                        v416 = v422;
                      }
                      else {
                        unint64_t v419 = v420;
                      }
                    }
                    while (v419);
                  }
                  void *v415 = v416;
                  ++v411;
                }
                while (v411 != v406);
              }
              else
              {
                uint64_t v384 = 0;
                uint64_t v385 = (uint64_t)v478 + v361;
                _H0 = *(_WORD *)(v462[18] + 10 * (v478 + v361 - *((_DWORD *)v462 + 32)));
                if (v360 <= 1) {
                  uint64_t v387 = 1;
                }
                else {
                  uint64_t v387 = v360;
                }
                float v388 = 0.0;
                unsigned int v389 = v466;
                do
                {
                  v390 = &v30[24 * v384];
                  v391 = *(void **)v390;
                  unint64_t v394 = *((void *)v390 + 1);
                  v392 = (unint64_t *)(v390 + 8);
                  unint64_t v393 = v394;
                  unint64_t v395 = v391[2] + 6 * *(unsigned int *)(*v391 + 12);
                  uint64_t v396 = v395 - v394;
                  if (v395 != v394)
                  {
                    unint64_t v397 = 0xAAAAAAAAAAAAAAABLL * (v396 >> 1);
                    do
                    {
                      unint64_t v398 = v397 >> 1;
                      v399 = (unsigned int *)(v393 + 6 * (v397 >> 1));
                      unsigned int v401 = *v399;
                      v400 = (char *)v399 + 6;
                      v397 += ~(v397 >> 1);
                      if (v401 < v361) {
                        unint64_t v393 = (unint64_t)v400;
                      }
                      else {
                        unint64_t v397 = v398;
                      }
                    }
                    while (v397);
                  }
                  unint64_t *v392 = v393;
                  if (v393 < v395 && *(_DWORD *)v393 == v361)
                  {
                    _H2 = *(_WORD *)(v393 + 4);
                    __asm { FCVT            S2, H2 }
                    float v388 = v388 + (float)(*(float *)&v30[24 * v384 + 16] * _S2);
                    unint64_t *v392 = v393 + 6;
                  }
                  ++v384;
                }
                while (v384 != v387);
                __asm { FCVT            S0, H0 }
              }
              unsigned int v424 = 0;
              do
              {
                unint64_t v425 = v424 + 1;
                if (*(void *)&v30[24 * v424 + 8] >= *(void *)(*(void *)&v30[24 * v424] + 16)
                                                     + 6
                                                     * (unint64_t)*(unsigned int *)(**(void **)&v30[24 * v424]
                                                                                         + 12))
                {
                  if (v425 < v274)
                  {
                    v426 = &v30[24 * v425];
                    unsigned int v427 = v424;
                    do
                    {
                      v428 = &v30[24 * v427];
                      long long v429 = *(_OWORD *)v426;
                      *((_DWORD *)v428 + 4) = *((_DWORD *)v426 + 4);
                      *(_OWORD *)v428 = v429;
                      ++v425;
                      ++v427;
                      v426 += 24;
                    }
                    while (v425 < v274);
                  }
                  --v274;
                }
                else
                {
                  ++v424;
                }
              }
              while (v424 < v274);
            }
          case 4u:
            while (2)
            {
              if (v274 == 1) {
                goto LABEL_387;
              }
              if (!v274) {
                goto LABEL_252;
              }
              uint64_t v430 = -1;
              v431 = v30 + 24;
              for (uint64_t n = 1; n != v274; ++n)
              {
                uint64_t v433 = v430;
                v434 = v431;
                do
                {
                  if (**((_DWORD **)v434 + 1) >= **((_DWORD **)v434 - 2)) {
                    break;
                  }
                  long long v435 = *(_OWORD *)v434;
                  v482[0] = *((void *)v434 + 2);
                  *(_OWORD *)std::string buf = v435;
                  *(_OWORD *)v434 = *(_OWORD *)(v434 - 24);
                  *((_DWORD *)v434 + 4) = *((_DWORD *)v434 - 2);
                  long long v436 = *(_OWORD *)buf;
                  *((_DWORD *)v434 - 2) = v482[0];
                  *(_OWORD *)(v434 - 24) = v436;
                  v434 -= 24;
                  _CF = __CFADD__(v433++, 1);
                }
                while (!_CF);
                v431 += 24;
                --v430;
              }
LABEL_387:
              uint64_t v437 = 0;
              uint64_t v438 = **((unsigned int **)v30 + 1);
              uint64_t v439 = (uint64_t)v478 + v438;
              _H0 = *(_WORD *)(v462[18] + 10 * (v478 + v438 - *((_DWORD *)v462 + 32)));
              __asm { FCVT            S0, H0 }
              float v442 = 0.0;
              v443 = (float *)(v30 + 8);
              v444 = v468;
              unsigned int v445 = v466;
              do
              {
                v446 = *(_DWORD **)v443;
                if (**(_DWORD **)v443 != v438) {
                  goto LABEL_391;
                }
                _H2 = *((_WORD *)v446 + 2);
                __asm { FCVT            S2, H2 }
                float v442 = v442 + (float)(v443[2] * _S2);
                *(void *)v443 = (char *)v446 + 6;
                v443 += 6;
                ++v437;
              }
              while (v274 != v437);
              LODWORD(v437) = v274;
LABEL_391:
              unsigned int v449 = 0;
              do
              {
                unint64_t v450 = v449 + 1;
                if (*(void *)&v30[24 * v449 + 8] >= *(void *)(*(void *)&v30[24 * v449] + 16)
                                                     + 6
                                                     * (unint64_t)*(unsigned int *)(**(void **)&v30[24 * v449]
                                                                                         + 12))
                {
                  if (v450 < v274)
                  {
                    v451 = &v30[24 * v450];
                    unsigned int v452 = v449;
                    do
                    {
                      v453 = &v30[24 * v452];
                      long long v454 = *(_OWORD *)v451;
                      *((_DWORD *)v453 + 4) = *((_DWORD *)v451 + 4);
                      *(_OWORD *)v453 = v454;
                      ++v450;
                      ++v452;
                      v451 += 24;
                    }
                    while (v450 < v274);
                  }
                  --v274;
                }
                else
                {
                  ++v449;
                }
              }
              while (v449 < v274);
              continue;
            }
          default:
LABEL_262:
            uint64_t v292 = v274 - 1;
            if (v274 == 1) {
              goto LABEL_270;
            }
            if (!v274) {
              goto LABEL_252;
            }
            uint64_t v293 = -1;
            v294 = v30 + 24;
            for (iuint64_t i = 1; ii != v274; ++ii)
            {
              uint64_t v296 = v293;
              v297 = v294;
              do
              {
                if (**((_DWORD **)v297 + 1) >= **((_DWORD **)v297 - 2)) {
                  break;
                }
                long long v298 = *(_OWORD *)v297;
                v482[0] = *((void *)v297 + 2);
                *(_OWORD *)std::string buf = v298;
                *(_OWORD *)v297 = *(_OWORD *)(v297 - 24);
                *((_DWORD *)v297 + 4) = *((_DWORD *)v297 - 2);
                long long v299 = *(_OWORD *)buf;
                *((_DWORD *)v297 - 2) = v482[0];
                *(_OWORD *)(v297 - 24) = v299;
                v297 -= 24;
                _CF = __CFADD__(v296++, 1);
              }
              while (!_CF);
              v294 += 24;
              --v293;
            }
LABEL_270:
            uint64_t v300 = 0;
            float v301 = 0.0;
            v302 = (float *)(v30 + 16);
            break;
        }
        while (v292 != v300)
        {
          uint64_t v303 = v300;
          uint64_t v304 = **((void **)v302 - 2);
          _H2 = *(_WORD *)(v304 + 4);
          __asm { FCVT            S2, H2 }
          float v307 = *v302;
          v302 += 6;
          float v301 = v301 + (float)(v307 * _S2);
          LOWORD(_S2) = *(_WORD *)(v304 + 6);
          __asm { FCVT            S2, H2 }
          uint64_t v300 = v303 + 1;
          if ((float)(v301 * _S2) > v479)
          {
            uint64_t v292 = v303;
            goto LABEL_275;
          }
        }
        LODWORD(v303) = v274 - 1;
LABEL_275:
        uint64_t v309 = **(unsigned int **)&v30[24 * v292 + 8];
        if (**((_DWORD **)v30 + 1) == v309)
        {
          uint64_t v310 = 0;
          uint64_t v311 = (uint64_t)v478 + v309;
          _H0 = *(_WORD *)(v462[18] + 10 * (v478 + v309 - *((_DWORD *)v462 + 32)));
          __asm { FCVT            S0, H0 }
          float v314 = 0.0;
          v315 = (float *)(v30 + 8);
          do
          {
            v316 = *(_DWORD **)v315;
            if (**(_DWORD **)v315 != v309) {
              goto LABEL_280;
            }
            _H2 = *((_WORD *)v316 + 2);
            __asm { FCVT            S2, H2 }
            float v314 = v314 + (float)(v315[2] * _S2);
            *(void *)v315 = (char *)v316 + 6;
            v315 += 6;
            ++v310;
          }
          while (v274 != v310);
          LODWORD(v310) = v274;
LABEL_280:
        }
        else if (v303)
        {
          uint64_t v319 = 0;
          do
          {
            v320 = &v30[24 * v319];
            v321 = *(void **)v320;
            v324 = (char *)*((void *)v320 + 1);
            v322 = v320 + 8;
            v323 = v324;
            uint64_t v325 = v321[2] + 6 * *(unsigned int *)(*v321 + 12) - (void)v324;
            if (v325)
            {
              unint64_t v326 = 0xAAAAAAAAAAAAAAABLL * (v325 >> 1);
              do
              {
                unint64_t v327 = v326 >> 1;
                v328 = (unsigned int *)&v323[6 * (v326 >> 1)];
                unsigned int v330 = *v328;
                v329 = (char *)v328 + 6;
                v326 += ~(v326 >> 1);
                if (v330 < v309) {
                  v323 = v329;
                }
                else {
                  unint64_t v326 = v327;
                }
              }
              while (v326);
            }
            void *v322 = v323;
            ++v319;
          }
          while (v319 != v292);
        }
        unsigned int v331 = 0;
        do
        {
          unint64_t v332 = v331 + 1;
          if (*(void *)&v30[24 * v331 + 8] >= *(void *)(*(void *)&v30[24 * v331] + 16)
                                               + 6
                                               * (unint64_t)*(unsigned int *)(**(void **)&v30[24 * v331] + 12))
          {
            if (v332 < v274)
            {
              v333 = &v30[24 * v332];
              unsigned int v334 = v331;
              do
              {
                v335 = &v30[24 * v334];
                long long v336 = *(_OWORD *)v333;
                *((_DWORD *)v335 + 4) = *((_DWORD *)v333 + 4);
                *(_OWORD *)v335 = v336;
                ++v332;
                ++v334;
                v333 += 24;
              }
              while (v332 < v274);
            }
            --v274;
          }
          else
          {
            ++v331;
          }
        }
        while (v331 < v274);
        goto LABEL_262;
      }
    }
  }
LABEL_252:
  v287 = (uint64_t *)v468;
  if (v456)
  {
    v288 = (uint64_t *)v462[3];
    v289 = (uint64_t *)v462[4];
    while (v288 != v289)
    {
      uint64_t v290 = *v288++;
      skit::internal::DiskMetaStore::populate_doc(v290 + 168, *v287, v287[1]);
    }
  }
  uint64_t result = v457;
  if (v457) {
    return MEMORY[0x1D942C700](v457, 0x1000C8077774924);
  }
  return result;
}

void sub_1D2EF2E5C(_Unwind_Exception *exception_object)
{
  if (*(void *)(v1 - 432)) {
    MEMORY[0x1D942C700](*(void *)(v1 - 432), 0x1000C8077774924);
  }
  _Unwind_Resume(exception_object);
}

void *skit::internal::anonymous namespace'::push_hit(void *result, float *a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, float a7)
{
  if (a4 >= a6 && *a2 < a7)
  {
    uint64_t v12 = result;
    unint64_t v13 = result[1];
    unint64_t v14 = result[2];
    if (v13 >= v14)
    {
      unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v13 - *result) >> 3);
      unint64_t v17 = v16 + 1;
      if (v16 + 1 > 0x666666666666666) {
        std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v14 - *result) >> 3);
      if (2 * v18 > v17) {
        unint64_t v17 = 2 * v18;
      }
      if (v18 >= 0x333333333333333) {
        unint64_t v19 = 0x666666666666666;
      }
      else {
        unint64_t v19 = v17;
      }
      if (v19) {
        unint64_t v19 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Hit>>(v19);
      }
      else {
        uint64_t v20 = 0;
      }
      unint64_t v21 = v19 + 40 * v16;
      unint64_t v22 = v19 + 40 * v20;
      *(_DWORD *)unint64_t v21 = 0;
      *(void *)(v21 + 8) = a3;
      *(float *)(v21 + 16) = a7;
      *(_DWORD *)(v21 + 20) = a4;
      *(void *)(v21 + 24) = 0;
      *(void *)(v21 + 32) = 0;
      uint64_t v15 = v21 + 40;
      uint64_t v24 = (char *)*v12;
      uint64_t v23 = (char *)v12[1];
      if (v23 != (char *)*v12)
      {
        do
        {
          long long v25 = *(_OWORD *)(v23 - 40);
          long long v26 = *(_OWORD *)(v23 - 24);
          *(void *)(v21 - 8) = *((void *)v23 - 1);
          *(_OWORD *)(v21 - 24) = v26;
          *(_OWORD *)(v21 - 40) = v25;
          v21 -= 40;
          v23 -= 40;
        }
        while (v23 != v24);
        uint64_t v23 = (char *)*v12;
      }
      *uint64_t v12 = v21;
      v12[1] = v15;
      v12[2] = v22;
      if (v23) {
        operator delete(v23);
      }
    }
    else
    {
      *(_DWORD *)unint64_t v13 = 0;
      *(void *)(v13 + 8) = a3;
      *(float *)(v13 + 16) = a7;
      *(_DWORD *)(v13 + 20) = a4;
      uint64_t v15 = v13 + 40;
      *(void *)(v13 + 24) = 0;
      *(void *)(v13 + 32) = 0;
    }
    v12[1] = v15;
    uint64_t v27 = *v12;
    std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(skit::Hit const&,skit::Hit const&),std::__wrap_iter<skit::Hit*>>(v27, v15, (uint64_t (**)(__n128 *, __n128 *))&v49, 0xCCCCCCCCCCCCCCCDLL * ((v15 - v27) >> 3));
    uint64_t result = (void *)*v12;
    uint64_t v28 = v12[1];
    uint64_t v29 = v28 - *v12;
    unint64_t v30 = 0xCCCCCCCCCCCCCCCDLL * (v29 >> 3);
    if (v30 > a5)
    {
      if (v29 >= 41)
      {
        uint64_t v31 = 0;
        long long v32 = *((_OWORD *)result + 1);
        long long v49 = *(_OWORD *)result;
        long long v50 = v32;
        uint64_t v51 = result[4];
        uint64_t v33 = (float *)result;
        do
        {
          unint64_t v34 = v33;
          uint64_t v35 = v31 + 1;
          v33 += 10 * v31 + 10;
          uint64_t v36 = 2 * v31;
          uint64_t v31 = (2 * v31) | 1;
          uint64_t v37 = v36 + 2;
          if (v37 < (uint64_t)v30)
          {
            float v38 = v34[10 * v35 + 4];
            float v39 = v33[14];
            if (v38 > v39 || v38 >= v39 && *(void *)&v34[10 * v35 + 2] > *((void *)v33 + 6))
            {
              v33 += 10;
              uint64_t v31 = v37;
            }
          }
          long long v40 = *(_OWORD *)v33;
          long long v41 = *((_OWORD *)v33 + 1);
          *((void *)v34 + 4) = *((void *)v33 + 4);
          *(_OWORD *)unint64_t v34 = v40;
          *((_OWORD *)v34 + 1) = v41;
        }
        while (v31 <= (uint64_t)((v30 - 2) >> 1));
        uint64_t v42 = (float *)(v28 - 40);
        if (v33 == v42)
        {
          long long v46 = v49;
          long long v47 = v50;
          *((void *)v33 + 4) = v51;
          *(_OWORD *)uint64_t v33 = v46;
          *((_OWORD *)v33 + 1) = v47;
        }
        else
        {
          long long v43 = *(_OWORD *)v42;
          long long v44 = *((_OWORD *)v42 + 1);
          *((void *)v33 + 4) = *((void *)v42 + 4);
          *(_OWORD *)uint64_t v33 = v43;
          *((_OWORD *)v33 + 1) = v44;
          long long v45 = v50;
          *(_OWORD *)uint64_t v42 = v49;
          *((_OWORD *)v42 + 1) = v45;
          *((void *)v42 + 4) = v51;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(skit::Hit const&,skit::Hit const&),std::__wrap_iter<skit::Hit*>>((uint64_t)result, (uint64_t)(v33 + 10), (uint64_t (**)(__n128 *, __n128 *))&v48, 0xCCCCCCCCCCCCCCCDLL * (((char *)(v33 + 10) - (char *)result) >> 3));
        }
        uint64_t result = (void *)*v12;
        uint64_t v28 = v12[1];
      }
      v12[1] = v28 - 40;
      *a2 = *((float *)result + 4);
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Hit>>(unint64_t a1)
{
  if (a1 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a1);
}

__n128 std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(skit::Hit const&,skit::Hit const&),std::__wrap_iter<skit::Hit*>>(uint64_t a1, uint64_t a2, uint64_t (**a3)(__n128 *, __n128 *), uint64_t a4)
{
  unint64_t v6 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v22 = v4;
    uint64_t v23 = v5;
    unint64_t v9 = v6 >> 1;
    char v10 = (__n128 *)(a1 + 40 * (v6 >> 1));
    uint64_t v11 = (__n128 *)(a2 - 40);
    if ((*a3)(v10, a2 - 40))
    {
      __n128 v13 = *v11;
      __n128 v14 = v11[1];
      uint64_t v21 = v11[2].n128_i64[0];
      __n128 v19 = v13;
      __n128 v20 = v14;
      do
      {
        uint64_t v15 = v10;
        __n128 v16 = *v10;
        __n128 v17 = v10[1];
        v11[2].n128_u64[0] = v10[2].n128_u64[0];
        __n128 *v11 = v16;
        v11[1] = v17;
        if (!v9) {
          break;
        }
        unint64_t v9 = (v9 - 1) >> 1;
        char v10 = (__n128 *)(a1 + 40 * v9);
        uint64_t v11 = v15;
      }
      while (((*a3)(v10, &v19) & 1) != 0);
      __n128 result = v19;
      __n128 v18 = v20;
      v15[2].n128_u64[0] = v21;
      *uint64_t v15 = result;
      v15[1] = v18;
    }
  }
  return result;
}

BOOL skit::internal::anonymous namespace'::hit_score_cmp(uint64_t a1, uint64_t a2)
{
  float v2 = *(float *)(a1 + 16);
  float v3 = *(float *)(a2 + 16);
  if (v2 > v3) {
    return 1;
  }
  if (v2 < v3) {
    return 0;
  }
  return *(void *)(a1 + 8) > *(void *)(a2 + 8);
}

BOOL skit::internal::MultiIndexV2::should_merge(skit::internal::MultiIndexV2 *this, unint64_t a2)
{
  if (!*((unsigned char *)this + 288)) {
    return 0;
  }
  float v3 = (skit::internal::IndexDiskImplV2 **)*((void *)this + 3);
  uint64_t v4 = (skit::internal::MultiIndexV2 *)*((void *)this + 4);
  unsigned int v5 = skit::internal::MultiIndexV2::index_count_threshold(v3, v4, 3 * (a2 >> 2));
  if (v3 == (skit::internal::IndexDiskImplV2 **)v4)
  {
    uint64_t v9 = 0;
    unint64_t v12 = *((unsigned int *)this + 27);
    LODWORD(v10) = *((_DWORD *)this + 27);
  }
  else
  {
    uint64_t v6 = 0;
    unint64_t v7 = v3;
    do
    {
      uint64_t v8 = (uint64_t)*v7++;
      v6 += *(unsigned int *)(*(void *)(v8 + 192) + 12);
    }
    while (v7 != (skit::internal::IndexDiskImplV2 **)v4);
    uint64_t v9 = 0;
    uint64_t v10 = *((unsigned int *)this + 27);
    do
    {
      uint64_t v11 = *v3++;
      v9 += (*(_DWORD *)(*((void *)v11 + 24) + 12) - *(_DWORD *)(*((void *)v11 + 24) + 16));
    }
    while (v3 != (skit::internal::IndexDiskImplV2 **)v4);
    unint64_t v12 = v6 + v10;
  }
  return v5 > 2 || v12 >= 0x65 && 10 * (v9 + (unint64_t)(v10 - *((_DWORD *)this + 28))) < 9 * v12;
}

uint64_t skit::internal::PostingListV2::seek_to_block(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1[2];
  uint64_t v4 = (a2 - v3) / 384;
  uint64_t v5 = *(unsigned int *)(*a1 + 8);
  if (v4 == v5) {
    goto LABEL_9;
  }
  uint64_t v6 = a1[1];
  unint64_t v7 = (char *)(v6 + 8 * v5);
  uint64_t v8 = (char *)(v6 + 8 * v4);
  unint64_t v9 = (v7 - v8) >> 3;
  do
  {
    unint64_t v10 = v9 >> 1;
    uint64_t v11 = (unsigned int *)&v8[8 * (v9 >> 1)];
    unsigned int v13 = *v11;
    unint64_t v12 = (char *)(v11 + 2);
    v9 += ~(v9 >> 1);
    if (v13 < a3) {
      uint64_t v8 = v12;
    }
    else {
      unint64_t v9 = v10;
    }
  }
  while (v9);
  if (v8 == v7) {
LABEL_9:
  }
    uint64_t v14 = *(unsigned int *)(*a1 + 12);
  else {
    uint64_t v14 = 8 * (void)&v8[-v6];
  }
  return v3 + 6 * v14;
}

BOOL skit::AliasSpanMatchCompare::compare_locale(skit::AliasSpanMatchCompare *this, int a2)
{
  if (this) {
    BOOL v2 = this == a2;
  }
  else {
    BOOL v2 = 1;
  }
  return v2 || a2 == 0;
}

BOOL skit::AliasSpanMatchCompare::compare_entity_type(skit::AliasSpanMatchCompare *this, int a2)
{
  return this == a2;
}

BOOL skit::AliasSpanMatchCompare::compare_group_id(__int16 a1, __int16 a2)
{
  return (!(_BYTE)a2 || !(_BYTE)a1 || a1 == a2) && HIBYTE(a1) == HIBYTE(a2);
}

BOOL skit::AliasSpanMatchCompare::operator()(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  int v3 = a2[16];
  if (a3[16]) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  BOOL v5 = v4 || v3 == a3[16];
  if (!v5 || HIBYTE(a2[16]) != HIBYTE(a3[16])) {
    return 0;
  }
  int v6 = *((char *)a2 + 23);
  uint64_t v7 = *((void *)a2 + 1);
  if (v6 >= 0) {
    uint64_t v7 = *((unsigned __int8 *)a2 + 23);
  }
  uint64_t v8 = *((unsigned __int8 *)a3 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *((void *)a3 + 1);
  }
  if (v7 != v8) {
    return 0;
  }
  if (!v7) {
    return 1;
  }
  if (v9 >= 0) {
    unint64_t v10 = a3;
  }
  else {
    unint64_t v10 = *(unsigned __int16 **)a3;
  }
  if (v6 >= 0) {
    uint64_t v11 = a2;
  }
  else {
    uint64_t v11 = *(unsigned __int16 **)a2;
  }
  uint64_t v12 = v7 - 1;
  do
  {
    int v14 = *v11++;
    int v13 = v14;
    int v16 = *v10++;
    int v15 = v16;
    BOOL v18 = v12-- != 0;
    BOOL result = v15 == v13;
  }
  while (v15 == v13 && v18);
  return result;
}

skit::Alias *skit::Alias::Alias(skit::Alias *this, std::__fs::filesystem::path *a2, std::__fs::filesystem::path *a3)
{
  return this;
}

{
  std::allocate_shared[abi:ne180100]<skit::internal::AliasImpl,std::allocator<skit::internal::AliasImpl>,std::__fs::filesystem::path,std::__fs::filesystem::path,void>(this, (uint64_t *)a2, (uint64_t *)a3);
  return this;
}

uint64_t std::allocate_shared[abi:ne180100]<skit::internal::AliasImpl,std::allocator<skit::internal::AliasImpl>,std::__fs::filesystem::path,std::__fs::filesystem::path,void>(void *a1, uint64_t *a2, uint64_t *a3)
{
  int v6 = (char *)operator new(0x60uLL);
  *(_OWORD *)(v6 + 8) = 0u;
  *(void *)int v6 = &unk_1F2A132E0;
  uint64_t v7 = *a2;
  *(void *)&long long v13 = a2[1];
  *(void *)((char *)&v13 + 7) = *(uint64_t *)((char *)a2 + 15);
  char v8 = *((unsigned char *)a2 + 23);
  a2[2] = 0;
  *(_OWORD *)a2 = 0u;
  uint64_t v9 = *a3;
  *(void *)&long long v12 = a3[1];
  *(void *)((char *)&v12 + 7) = *(uint64_t *)((char *)a3 + 15);
  char v10 = *((unsigned char *)a3 + 23);
  *(_OWORD *)a3 = 0u;
  a3[2] = 0;
  *((void *)v6 + 3) = v7;
  *(void *)(v6 + 39) = *(void *)((char *)&v13 + 7);
  *((void *)v6 + 4) = v13;
  v6[47] = v8;
  *(void *)(v6 + 63) = *(void *)((char *)&v12 + 7);
  *((void *)v6 + 6) = v9;
  *((void *)v6 + 7) = v12;
  v6[71] = v10;
  marisa::Trie::Trie((marisa::Trie *)(v6 + 72));
  uint64_t result = marisa::Trie::Trie((marisa::Trie *)(v6 + 80));
  v6[88] = 0;
  *a1 = v6 + 24;
  a1[1] = v6;
  return result;
}

void std::__shared_ptr_emplace<skit::internal::AliasImpl>::__on_zero_shared(uint64_t a1)
{
  *(unsigned char *)(a1 + 88) = 0;
  uint64_t v2 = a1 + 72;
  marisa::Trie::clear((marisa::Trie *)(a1 + 72));
  marisa::Trie::clear((marisa::Trie *)(a1 + 80));
  MEMORY[0x1D942C330](a1 + 80);
  MEMORY[0x1D942C330](v2);
  if (*(char *)(a1 + 71) < 0) {
    operator delete(*(void **)(a1 + 48));
  }
  if (*(char *)(a1 + 47) < 0)
  {
    int v3 = *(void **)(a1 + 24);
    operator delete(v3);
  }
}

void std::__shared_ptr_emplace<skit::internal::AliasImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2A132E0;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1D942C720);
}

void std::__shared_ptr_emplace<skit::internal::AliasImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2A132E0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

uint64_t skit::Alias::init(const char **this)
{
  uint64_t v1 = *this;
  if (!*this) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *this;
  if (v1[23] < 0) {
    uint64_t v2 = *(const char **)v1;
  }
  marisa::Trie::mmap((marisa::Trie *)(v1 + 48), v2);
  int v3 = v1 + 24;
  if (v1[47] < 0) {
    int v3 = *(const char **)v3;
  }
  marisa::Trie::mmap((marisa::Trie *)(v1 + 56), v3);
  uint64_t result = 0;
  *((unsigned char *)v1 + 64) = 1;
  return result;
}

uint64_t skit::Alias::close(skit::Alias *this)
{
  uint64_t v1 = *(unsigned char **)this;
  if (!*(void *)this) {
    return 0xFFFFFFFFLL;
  }
  v1[64] = 0;
  marisa::Trie::clear((marisa::Trie *)(v1 + 48));
  marisa::Trie::clear((marisa::Trie *)(v1 + 56));
  return 0;
}

BOOL skit::Alias::is_initialized(skit::Alias *this)
{
  return *(void *)this && *(unsigned char *)(*(void *)this + 64) != 0;
}

void skit::Alias::find(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  void v31[2] = *MEMORY[0x1E4F143B8];
  BOOL v4 = (unsigned char *)*a1;
  if (*a1 && v4[64])
  {
    marisa::Agent::Agent((marisa::Agent *)v23);
    marisa::Agent::Agent((marisa::Agent *)v28);
    uint64_t v8 = 2 * a3;
    marisa::Agent::set_query((marisa::Agent *)v23, a2);
    unint64_t v21 = v8 + 6;
    uint64_t v22 = (marisa::Trie *)(v4 + 56);
    uint64_t v9 = (marisa::Trie *)(v4 + 48);
    while (marisa::Trie::predictive_search(v22, (marisa::Agent *)v23))
    {
      if (v21 > v25 || (v25 & 1) != 0) {
        break;
      }
      uint64_t v11 = v24 + v8;
      if (*(_WORD *)(v24 + v8)) {
        break;
      }
      uint64_t v12 = v8;
      unint64_t v13 = v11 + 4;
      unint64_t v14 = v24 + v25;
      if (v11 + 4 < v14)
      {
        __int16 v15 = *(_WORD *)(v11 + 2);
        do
        {
          marisa::Agent::set_query((marisa::Agent *)v28);
          marisa::Trie::reverse_lookup(v9, (marisa::Agent *)v28);
          std::basic_string<char16_t>::basic_string[abi:ne180100](&__p, __src, (unint64_t)v30 >> 1);
          int v16 = __p;
          v31[0] = v27;
          *(void *)((char *)v31 + 7) = *(void *)((char *)&v27 + 7);
          char v17 = HIBYTE(v27);
          std::string __p = 0;
          long long v27 = 0uLL;
          unsigned int v18 = *(_DWORD *)(a4 + 8);
          if (v18 == *(_DWORD *)(a4 + 12))
          {
            skit::SmallVector<std::tuple<std::basic_string<char16_t>,skit::GroupId>,2u,true>::_reserve_more((long long **)a4, v18 + (v18 >> 1) + 1);
            unsigned int v18 = *(_DWORD *)(a4 + 8);
          }
          uint64_t v19 = *(void *)a4 + 32 * v18;
          uint64_t v20 = v31[0];
          *(void *)uint64_t v19 = v16;
          *(void *)(v19 + 8) = v20;
          *(void *)(v19 + 15) = *(void *)((char *)v31 + 7);
          *(unsigned char *)(v19 + 23) = v17;
          v31[0] = 0;
          *(void *)((char *)v31 + 7) = 0;
          *(_WORD *)(v19 + 24) = v15;
          ++*(_DWORD *)(a4 + 8);
          if (SHIBYTE(v27) < 0) {
            operator delete(__p);
          }
          v13 += 2;
        }
        while (v13 < v14);
      }
      uint64_t v8 = v12;
    }
    marisa::Agent::~Agent((marisa::Agent *)v28);
    marisa::Agent::~Agent((marisa::Agent *)v23);
  }
}

void sub_1D2EF3DB0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,long long buf)
{
  if (v25 < 0) {
    operator delete(v24);
  }
  if (a23 < 0) {
    operator delete(__p);
  }
  marisa::Agent::~Agent((marisa::Agent *)&buf);
  marisa::Agent::~Agent((marisa::Agent *)&a12);
  if (a2 == 1)
  {
    uint64_t v28 = __cxa_begin_catch(a1);
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v29 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = (*(uint64_t (**)(void *))(*(void *)v28 + 16))(v28);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v30;
      _os_log_error_impl(&dword_1D2EDA000, v29, OS_LOG_TYPE_ERROR, "Alias::find : Exception thrown while searching Marisa Trie : %{public}s", (uint8_t *)&buf, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1D2EF3D74);
  }
  _Unwind_Resume(a1);
}

void skit::Alias::match(uint64_t *a1, uint64_t a2, uint64_t *a3, unsigned int a4)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  if (*a1 && *(unsigned char *)(v4 + 64))
  {
    marisa::Agent::Agent((marisa::Agent *)v9);
    marisa::Agent::Agent((marisa::Agent *)v10);
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a3[1] - *a3) >> 4);
    if (v8 > a4) {
      skit::internal::AliasImpl::span_match_alias(v4, a2, a3, a4, v8, (uint64_t)v9, (uint64_t)v10);
    }
    marisa::Agent::~Agent((marisa::Agent *)v10);
    marisa::Agent::~Agent((marisa::Agent *)v9);
  }
}

void sub_1D2EF3FC4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf)
{
  marisa::Agent::~Agent((marisa::Agent *)&buf);
  marisa::Agent::~Agent((marisa::Agent *)&a9);
  if (a2 == 1)
  {
    char v17 = __cxa_begin_catch(a1);
    if (skit::internal::get_logging_context(void)::once != -1) {
    unsigned int v18 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (*(uint64_t (**)(void *))(*(void *)v17 + 16))(v17);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_error_impl(&dword_1D2EDA000, v18, OS_LOG_TYPE_ERROR, "Alias::init : Exception thrown while loading Marisa Trie file : %{public}s", (uint8_t *)&buf, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1D2EF3F94);
  }
  _Unwind_Resume(a1);
}

void skit::Alias::match(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  if (*a1 && *(unsigned char *)(v3 + 64))
  {
    marisa::Agent::Agent((marisa::Agent *)v8);
    marisa::Agent::Agent((marisa::Agent *)v9);
    unsigned int v6 = -1431655765 * ((unint64_t)(a3[1] - *a3) >> 4);
    if (v6)
    {
      for (unsigned int i = 0; i != v6; ++i)
        skit::internal::AliasImpl::span_match_alias(v3, a2, a3, i, v6, (uint64_t)v8, (uint64_t)v9);
    }
    marisa::Agent::~Agent((marisa::Agent *)v9);
    marisa::Agent::~Agent((marisa::Agent *)v8);
  }
}

void sub_1D2EF41B4(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long buf)
{
  marisa::Agent::~Agent((marisa::Agent *)&a9);
  if (a2 == 1)
  {
    char v17 = __cxa_begin_catch(a1);
    if (skit::internal::get_logging_context(void)::once != -1) {
    unsigned int v18 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (*(uint64_t (**)(void *))(*(void *)v17 + 16))(v17);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_error_impl(&dword_1D2EDA000, v18, OS_LOG_TYPE_ERROR, "Alias::span_match_alias : Exception thrown while searching for span matches : %{public}s", (uint8_t *)&buf, 0xCu);
    }
    __cxa_end_catch();
    JUMPOUT(0x1D2EF4180);
  }
  _Unwind_Resume(a1);
}

__n128 skit::Analyzer::dedup@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v4 = *a1;
  BOOL v5 = (unsigned __int16 *)a1[1];
  unint64_t v6 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v5 - v4) >> 4));
  if (v5 == (unsigned __int16 *)v4) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  std::__introsort<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,false>(v4, v5, v7, 1);
  uint64_t v9 = *a1;
  unint64_t v8 = (unsigned __int16 **)a1[1];
  uint64_t v10 = (unsigned __int16 **)*a1;
  if ((unsigned __int16 **)*a1 == v8)
  {
LABEL_24:
    if (v10 != v8)
    {
      uint64_t v19 = v10 + 6;
      if (v10 + 6 != v8)
      {
        uint64_t v20 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 23);
        unint64_t v21 = v10[1];
LABEL_27:
        int v22 = (char)v20;
        if ((char)v20 < 0) {
          uint64_t v20 = v21;
        }
        while (1)
        {
          uint64_t v23 = (unsigned __int16 *)*((unsigned __int8 *)v19 + 23);
          int v24 = (char)v23;
          if ((char)v23 < 0) {
            uint64_t v23 = v19[1];
          }
          if (v20 != v23) {
            goto LABEL_45;
          }
          if (v20) {
            break;
          }
LABEL_41:
          *((_WORD *)v10 + 19) += *((_WORD *)v19 + 19);
          float v28 = *((float *)v10 + 8);
          if (v28 < *((float *)v19 + 8)) {
            float v28 = *((float *)v19 + 8);
          }
          *((float *)v10 + 8) = v28;
          *((_WORD *)v10 + 20) |= *((_WORD *)v19 + 20);
          v19 += 6;
          if (v19 == v8) {
            goto LABEL_68;
          }
        }
        if (v24 >= 0) {
          int v25 = (unsigned __int16 *)v19;
        }
        else {
          int v25 = *v19;
        }
        long long v26 = *v10;
        if (v22 >= 0) {
          long long v26 = (unsigned __int16 *)v10;
        }
        long long v27 = v20;
        while (*v25 == *v26)
        {
          ++v26;
          ++v25;
          long long v27 = (unsigned __int16 *)((char *)v27 - 1);
          if (!v27) {
            goto LABEL_41;
          }
        }
LABEL_45:
        if (v19 != v8)
        {
          while (1)
          {
            int v29 = *((char *)v10 + 23);
            uint64_t v20 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 23);
            unint64_t v21 = v10[1];
            if (v29 >= 0) {
              uint64_t v30 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 23);
            }
            else {
              uint64_t v30 = v10[1];
            }
            uint64_t v31 = (unsigned __int16 *)*((unsigned __int8 *)v19 + 23);
            int v32 = (char)v31;
            if ((char)v31 < 0) {
              uint64_t v31 = v19[1];
            }
            if (v30 == v31)
            {
              if (!v30)
              {
LABEL_66:
                uint64_t v35 = (void **)v10;
                if (v19 == v8)
                {
LABEL_69:
                  unint64_t v8 = (unsigned __int16 **)(v35 + 6);
                  uint64_t v9 = *a1;
                  goto LABEL_70;
                }
                goto LABEL_27;
              }
              if (v32 >= 0) {
                uint64_t v33 = (unsigned __int16 *)v19;
              }
              else {
                uint64_t v33 = *v19;
              }
              if (v29 >= 0) {
                unint64_t v34 = (unsigned __int16 *)v10;
              }
              else {
                unint64_t v34 = *v10;
              }
              while (*v33 == *v34)
              {
                ++v34;
                ++v33;
                uint64_t v30 = (unsigned __int16 *)((char *)v30 - 1);
                if (!v30) {
                  goto LABEL_66;
                }
              }
            }
            uint64_t v35 = (void **)(v10 + 6);
            if (*((char *)v10 + 71) < 0) {
              operator delete(*v35);
            }
            long long v36 = *(_OWORD *)v19;
            v10[8] = v19[2];
            *(_OWORD *)uint64_t v35 = v36;
            *((unsigned char *)v19 + 23) = 0;
            *(_WORD *)uint64_t v19 = 0;
            long long v37 = *(_OWORD *)(v19 + 3);
            v10[11] = v19[5];
            *(_OWORD *)(v10 + 9) = v37;
            v19 += 6;
            unint64_t v8 = (unsigned __int16 **)a1[1];
            v10 += 6;
            if (v19 == v8) {
              goto LABEL_69;
            }
          }
        }
      }
LABEL_68:
      uint64_t v35 = (void **)v10;
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v11 = (unsigned __int16 **)(v9 + 48);
    if ((unsigned __int16 **)(v9 + 48) != v8)
    {
      uint64_t v10 = (unsigned __int16 **)*a1;
      do
      {
        uint64_t v12 = v11;
        unint64_t v13 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 23);
        int v14 = (char)v13;
        if ((char)v13 < 0) {
          unint64_t v13 = v10[1];
        }
        __int16 v15 = (unsigned __int16 *)*((unsigned __int8 *)v10 + 71);
        int v16 = (char)v15;
        if ((char)v15 < 0) {
          __int16 v15 = v10[7];
        }
        if (v13 == v15)
        {
          if (!v13) {
            goto LABEL_24;
          }
          if (v16 >= 0) {
            char v17 = (unsigned __int16 *)v12;
          }
          else {
            char v17 = *v12;
          }
          if (v14 >= 0) {
            unsigned int v18 = (unsigned __int16 *)v10;
          }
          else {
            unsigned int v18 = *v10;
          }
          while (*v17 == *v18)
          {
            ++v18;
            ++v17;
            unint64_t v13 = (unsigned __int16 *)((char *)v13 - 1);
            if (!v13) {
              goto LABEL_24;
            }
          }
        }
        uint64_t v11 = v12 + 6;
        uint64_t v10 = v12;
      }
      while (v12 + 6 != v8);
    }
  }
LABEL_70:
  std::vector<skit::Token>::resize(a1, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v9) >> 4));
  __n128 result = *(__n128 *)a1;
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(void *)(a2 + 16) = a1[2];
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,false>(unint64_t a1, unsigned __int16 *a2, uint64_t a3, char a4)
{
  v384[2] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = &v380;
LABEL_2:
  unint64_t v377 = a2 - 24;
  uint64_t v10 = (uint64_t *)a1;
  while (1)
  {
LABEL_3:
    a1 = (unint64_t)v10;
    uint64_t v11 = (char *)a2 - (char *)v10;
    uint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v10) >> 4);
    if (v5 || !v4)
    {
      switch(v12)
      {
        case 0:
        case 1:
          return;
        case 2:
          unsigned int v176 = *(a2 - 6);
          unsigned int v177 = *(unsigned __int16 *)(a1 + 36);
          if (v176 < v177) {
            goto LABEL_288;
          }
          if (v176 > v177) {
            return;
          }
          unint64_t v335 = *(unsigned __int8 *)(a1 + 23);
          int v336 = (char)v335;
          if ((v335 & 0x80u) != 0) {
            unint64_t v335 = *(void *)(a1 + 8);
          }
          unint64_t v337 = *((unsigned __int8 *)a2 - 25);
          int v338 = (char)v337;
          if ((v337 & 0x80u) != 0) {
            unint64_t v337 = *((void *)a2 - 5);
          }
          if (v335 >= v337) {
            unint64_t v339 = v337;
          }
          else {
            unint64_t v339 = v335;
          }
          if (!v339) {
            goto LABEL_564;
          }
          if (v338 >= 0) {
            v340 = a2 - 24;
          }
          else {
            v340 = *(unsigned __int16 **)v377;
          }
          if (v336 >= 0) {
            v341 = (unsigned __int16 *)a1;
          }
          else {
            v341 = *(unsigned __int16 **)a1;
          }
          break;
        case 3:
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)a1, a1 + 48, (uint64_t)v377);
          return;
        case 4:
          std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)a1, a1 + 48, a1 + 96, (uint64_t)v377);
          return;
        case 5:
          std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,0>((unsigned __int16 *)a1, a1 + 48, a1 + 96, a1 + 144, (uint64_t)v377);
          return;
        default:
          JUMPOUT(0);
      }
      while (1)
      {
        unsigned int v342 = *v340;
        unsigned int v343 = *v341;
        if (v342 < v343) {
          break;
        }
        if (v343 < v342) {
          return;
        }
        ++v340;
        ++v341;
        if (!--v339)
        {
LABEL_564:
          if (v337 >= v335) {
            return;
          }
          break;
        }
      }
LABEL_288:
      std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a1, (uint64_t)v377);
      return;
    }
    if (v11 <= 1151) {
      break;
    }
    if (!a3)
    {
      if ((unsigned __int16 *)a1 == a2) {
        return;
      }
      v374 = a2;
      int64_t v210 = (unint64_t)(v12 - 2) >> 1;
      int64_t v211 = v210;
      while (2)
      {
        int64_t v212 = v211;
        if (v210 < v211) {
          goto LABEL_454;
        }
        uint64_t v213 = (2 * v211) | 1;
        unsigned int v214 = (unsigned __int16 *)(a1 + 48 * v213);
        if (2 * v212 + 2 < v12)
        {
          unsigned int v215 = *(unsigned __int16 *)(a1 + 48 * v213 + 36);
          unsigned int v216 = v214[42];
          if (v215 < v216) {
            goto LABEL_365;
          }
          if (v215 <= v216)
          {
            unint64_t v217 = *((unsigned __int8 *)v214 + 71);
            int v218 = (char)v217;
            if ((v217 & 0x80u) != 0) {
              unint64_t v217 = *((void *)v214 + 7);
            }
            unint64_t v219 = *((unsigned __int8 *)v214 + 23);
            int v220 = (char)v219;
            if ((v219 & 0x80u) != 0) {
              unint64_t v219 = *((void *)v214 + 1);
            }
            if (v217 >= v219) {
              unint64_t v221 = v219;
            }
            else {
              unint64_t v221 = v217;
            }
            if (v221)
            {
              if (v220 >= 0) {
                v222 = (unsigned __int16 *)(a1 + 48 * v213);
              }
              else {
                v222 = *(unsigned __int16 **)v214;
              }
              if (v218 >= 0) {
                uint64_t v223 = v214 + 24;
              }
              else {
                uint64_t v223 = (unsigned __int16 *)*((void *)v214 + 6);
              }
              while (1)
              {
                unsigned int v224 = *v222;
                unsigned int v225 = *v223;
                if (v224 < v225) {
                  break;
                }
                if (v225 < v224) {
                  goto LABEL_385;
                }
                ++v222;
                ++v223;
                if (!--v221) {
                  goto LABEL_384;
                }
              }
LABEL_365:
              v214 += 24;
              uint64_t v213 = 2 * v212 + 2;
            }
            else
            {
LABEL_384:
              if (v219 < v217) {
                goto LABEL_365;
              }
            }
          }
        }
LABEL_385:
        unsigned int v226 = v214[18];
        unsigned int v227 = *(unsigned __int16 *)(a1 + 48 * v212 + 36);
        if (v226 < v227) {
          goto LABEL_454;
        }
        v228 = (unsigned __int16 **)(a1 + 48 * v212);
        if (v226 <= v227)
        {
          v229 = (unsigned __int16 *)*((unsigned __int8 *)v228 + 23);
          int v230 = (char)v229;
          if ((char)v229 < 0) {
            v229 = v228[1];
          }
          unint64_t v231 = *((unsigned __int8 *)v214 + 23);
          int v232 = (char)v231;
          if ((v231 & 0x80u) != 0) {
            unint64_t v231 = *((void *)v214 + 1);
          }
          if ((unint64_t)v229 >= v231) {
            unint64_t v233 = (unsigned __int16 *)v231;
          }
          else {
            unint64_t v233 = v229;
          }
          if (v233)
          {
            if (v232 >= 0) {
              v234 = v214;
            }
            else {
              v234 = *(unsigned __int16 **)v214;
            }
            if (v230 >= 0) {
              v235 = (unsigned __int16 *)(a1 + 48 * v212);
            }
            else {
              v235 = *v228;
            }
            while (1)
            {
              unsigned int v236 = *v234;
              unsigned int v237 = *v235;
              if (v236 < v237) {
                goto LABEL_454;
              }
              if (v237 < v236) {
                break;
              }
              ++v234;
              ++v235;
              unint64_t v233 = (unsigned __int16 *)((char *)v233 - 1);
              if (!v233) {
                goto LABEL_404;
              }
            }
          }
          else
          {
LABEL_404:
            if (v231 < (unint64_t)v229) {
              goto LABEL_454;
            }
          }
        }
        long long v238 = *(_OWORD *)v228;
        uint64_t v379 = (uint64_t)v228[2];
        long long v378 = v238;
        v228[1] = 0;
        v228[2] = 0;
        void *v228 = 0;
        unint64_t v239 = a1 + 48 * v212;
        long long v240 = *(_OWORD *)(v239 + 24);
        uint64_t v381 = *(void *)(v239 + 40);
        long long v380 = v240;
LABEL_406:
        v241 = (unsigned __int16 **)v214;
        if (*((char *)v228 + 23) < 0) {
          operator delete(*v228);
        }
        long long v242 = *(_OWORD *)v241;
        v228[2] = v241[2];
        *(_OWORD *)v228 = v242;
        *((unsigned char *)v241 + 23) = 0;
        *(_WORD *)v241 = 0;
        long long v243 = *(_OWORD *)(v241 + 3);
        v228[5] = v241[5];
        *(_OWORD *)(v228 + 3) = v243;
        if (v210 < v213)
        {
LABEL_451:
          if (*((char *)v241 + 23) < 0) {
            operator delete(*v241);
          }
          long long v267 = v378;
          v241[2] = (unsigned __int16 *)v379;
          *(_OWORD *)v241 = v267;
          long long v268 = v380;
          v241[5] = (unsigned __int16 *)v381;
          *(_OWORD *)(v241 + 3) = v268;
LABEL_454:
          int64_t v211 = v212 - 1;
          if (v212) {
            continue;
          }
          int64_t v269 = v11 / 0x30uLL;
          v270 = (void **)v374;
          while (2)
          {
            uint64_t v271 = 0;
            v272 = *(unsigned __int16 **)a1;
            v384[0] = *(void *)(a1 + 8);
            *(void *)((char *)v384 + 7) = *(void *)(a1 + 15);
            char v273 = *(unsigned char *)(a1 + 23);
            *(void *)(a1 + 8) = 0;
            *(void *)(a1 + 16) = 0;
            *(void *)a1 = 0;
            long long v274 = *(_OWORD *)(a1 + 24);
            v383 = *(void **)(a1 + 40);
            unint64_t v275 = a1;
            long long v382 = v274;
LABEL_457:
            uint64_t v276 = v271 + 1;
            v277 = (void **)(v275 + 48 * (v271 + 1));
            uint64_t v278 = 2 * v271;
            uint64_t v271 = (2 * v271) | 1;
            int64_t v279 = v278 + 2;
            if (v279 < v269)
            {
              unsigned int v280 = *(unsigned __int16 *)(v275 + 48 * v276 + 36);
              unsigned int v281 = *((unsigned __int16 *)v277 + 42);
              if (v280 < v281) {
                goto LABEL_459;
              }
              if (v280 <= v281)
              {
                unint64_t v282 = *((unsigned __int8 *)v277 + 71);
                int v283 = (char)v282;
                if ((v282 & 0x80u) != 0) {
                  unint64_t v282 = (unint64_t)v277[7];
                }
                unint64_t v284 = *((unsigned __int8 *)v277 + 23);
                int v285 = (char)v284;
                if ((v284 & 0x80u) != 0) {
                  unint64_t v284 = (unint64_t)v277[1];
                }
                if (v282 >= v284) {
                  unint64_t v286 = v284;
                }
                else {
                  unint64_t v286 = v282;
                }
                if (v286)
                {
                  if (v285 >= 0) {
                    v287 = (unsigned __int16 *)v277;
                  }
                  else {
                    v287 = (unsigned __int16 *)*v277;
                  }
                  if (v283 >= 0) {
                    v288 = (unsigned __int16 *)(v277 + 6);
                  }
                  else {
                    v288 = (unsigned __int16 *)v277[6];
                  }
                  while (1)
                  {
                    unsigned int v289 = *v287;
                    unsigned int v290 = *v288;
                    if (v289 < v290) {
                      break;
                    }
                    if (v290 < v289) {
                      goto LABEL_479;
                    }
                    ++v287;
                    ++v288;
                    if (!--v286) {
                      goto LABEL_478;
                    }
                  }
LABEL_459:
                  v277 += 6;
                  uint64_t v271 = v279;
                }
                else
                {
LABEL_478:
                  if (v284 < v282) {
                    goto LABEL_459;
                  }
                }
              }
            }
LABEL_479:
            if (*(char *)(v275 + 23) < 0) {
              operator delete(*(void **)v275);
            }
            long long v291 = *(_OWORD *)v277;
            *(void *)(v275 + 16) = v277[2];
            *(_OWORD *)unint64_t v275 = v291;
            *((unsigned char *)v277 + 23) = 0;
            *(_WORD *)v277 = 0;
            long long v292 = *(_OWORD *)(v277 + 3);
            *(void *)(v275 + 40) = v277[5];
            *(_OWORD *)(v275 + 24) = v292;
            unint64_t v275 = (unint64_t)v277;
            if (v271 > (uint64_t)((unint64_t)(v269 - 2) >> 1))
            {
              uint64_t v293 = (long long *)(v277 + 3);
              int v294 = *((char *)v277 + 23);
              v295 = v270 - 6;
              if (v277 == v270 - 6)
              {
                if (v294 < 0) {
                  operator delete(*v277);
                }
                int *v277 = v272;
                *(void **)((char *)v277 + 15) = *(void **)((char *)v384 + 7);
                v277[1] = (void *)v384[0];
                *((unsigned char *)v277 + 23) = v273;
                long long v322 = v382;
                v277[5] = v383;
                *uint64_t v293 = v322;
                goto LABEL_522;
              }
              if (v294 < 0) {
                operator delete(*v277);
              }
              long long v296 = *(_OWORD *)v295;
              v277[2] = *(v270 - 4);
              *(_OWORD *)v277 = v296;
              *((unsigned char *)v270 - 25) = 0;
              *((_WORD *)v270 - 24) = 0;
              long long v297 = *(_OWORD *)(v270 - 3);
              v277[5] = *(v270 - 1);
              *uint64_t v293 = v297;
              if (*((char *)v270 - 25) < 0) {
                operator delete(*v295);
              }
              long long v298 = v270 - 3;
              *(v270 - 6) = v272;
              long long v299 = (void *)v384[0];
              *(void **)((char *)v270 - 33) = *(void **)((char *)v384 + 7);
              *(v270 - 5) = v299;
              *((unsigned char *)v270 - 25) = v273;
              long long v300 = v382;
              v298[2] = v383;
              *(_OWORD *)long long v298 = v300;
              uint64_t v301 = (uint64_t)v277 - a1 + 48;
              v270 -= 6;
              if (v301 >= 49)
              {
                unint64_t v302 = (v301 / 0x30uLL - 2) >> 1;
                uint64_t v303 = (unsigned __int16 **)(a1 + 48 * v302);
                unsigned int v304 = *((unsigned __int16 *)v303 + 18);
                unsigned int v305 = *((unsigned __int16 *)v277 + 18);
                if (v304 < v305) {
                  goto LABEL_489;
                }
                if (v304 <= v305)
                {
                  unint64_t v326 = *((unsigned __int8 *)v277 + 23);
                  int v327 = (char)v326;
                  if ((v326 & 0x80u) != 0) {
                    unint64_t v326 = (unint64_t)v277[1];
                  }
                  v328 = (unsigned __int16 *)*((unsigned __int8 *)v303 + 23);
                  int v329 = (char)v328;
                  if ((char)v328 < 0) {
                    v328 = v303[1];
                  }
                  if (v326 >= (unint64_t)v328) {
                    unsigned int v330 = v328;
                  }
                  else {
                    unsigned int v330 = (unsigned __int16 *)v326;
                  }
                  if (v330)
                  {
                    if (v329 >= 0) {
                      unsigned int v331 = (unsigned __int16 *)(a1 + 48 * v302);
                    }
                    else {
                      unsigned int v331 = *v303;
                    }
                    if (v327 >= 0) {
                      unint64_t v332 = (unsigned __int16 *)v277;
                    }
                    else {
                      unint64_t v332 = (unsigned __int16 *)*v277;
                    }
                    while (1)
                    {
                      unsigned int v333 = *v331;
                      unsigned int v334 = *v332;
                      if (v333 < v334) {
                        break;
                      }
                      if (v334 < v333) {
                        goto LABEL_523;
                      }
                      ++v331;
                      ++v332;
                      unsigned int v330 = (unsigned __int16 *)((char *)v330 - 1);
                      if (!v330) {
                        goto LABEL_544;
                      }
                    }
LABEL_489:
                    long long v306 = *(_OWORD *)v277;
                    uint64_t v379 = (uint64_t)v277[2];
                    long long v378 = v306;
                    v277[1] = 0;
                    v277[2] = 0;
                    int *v277 = 0;
                    uint64_t v307 = (uint64_t)v277[5];
                    long long v380 = *v293;
                    uint64_t v381 = v307;
                    unsigned int v308 = WORD6(v380);
                    if (v379 >= 0) {
                      unint64_t v309 = HIBYTE(v379);
                    }
                    else {
                      unint64_t v309 = *((void *)&v378 + 1);
                    }
                    if (v379 >= 0) {
                      uint64_t v310 = (unsigned __int16 *)&v378;
                    }
                    else {
                      uint64_t v310 = (unsigned __int16 *)v378;
                    }
                    while (1)
                    {
                      uint64_t v311 = (unsigned __int16 *)v303;
                      if (*((char *)v277 + 23) < 0) {
                        operator delete(*v277);
                      }
                      long long v312 = *(_OWORD *)v311;
                      v277[2] = (void *)*((void *)v311 + 2);
                      *(_OWORD *)v277 = v312;
                      *((unsigned char *)v311 + 23) = 0;
                      *uint64_t v311 = 0;
                      long long v313 = *(_OWORD *)(v311 + 12);
                      v277[5] = (void *)*((void *)v311 + 5);
                      *(_OWORD *)(v277 + 3) = v313;
                      if (!v302) {
                        break;
                      }
                      unint64_t v302 = (v302 - 1) >> 1;
                      uint64_t v303 = (unsigned __int16 **)(a1 + 48 * v302);
                      unsigned int v314 = *((unsigned __int16 *)v303 + 18);
                      v277 = (void **)v311;
                      if (v314 >= v308)
                      {
                        if (v314 > v308) {
                          break;
                        }
                        v315 = (unsigned __int16 *)*((unsigned __int8 *)v303 + 23);
                        int v316 = (char)v315;
                        if ((char)v315 < 0) {
                          v315 = v303[1];
                        }
                        if (v309 >= (unint64_t)v315) {
                          v317 = v315;
                        }
                        else {
                          v317 = (unsigned __int16 *)v309;
                        }
                        if (v317)
                        {
                          if (v316 >= 0) {
                            v318 = (unsigned __int16 *)(a1 + 48 * v302);
                          }
                          else {
                            v318 = *v303;
                          }
                          uint64_t v319 = v310;
                          while (1)
                          {
                            unsigned int v320 = *v318;
                            unsigned int v321 = *v319;
                            if (v320 < v321) {
                              break;
                            }
                            if (v321 < v320) {
                              goto LABEL_519;
                            }
                            ++v318;
                            ++v319;
                            v317 = (unsigned __int16 *)((char *)v317 - 1);
                            if (!v317) {
                              goto LABEL_513;
                            }
                          }
                          v277 = (void **)v311;
                        }
                        else
                        {
LABEL_513:
                          v277 = (void **)v311;
                          if ((unint64_t)v315 >= v309) {
                            break;
                          }
                        }
                      }
                    }
LABEL_519:
                    if (*((char *)v311 + 23) < 0) {
                      operator delete(*(void **)v311);
                    }
                    long long v323 = v378;
                    *((void *)v311 + 2) = v379;
                    *(_OWORD *)uint64_t v311 = v323;
                    long long v324 = v380;
                    *((void *)v311 + 5) = v381;
                    *(_OWORD *)(v311 + 12) = v324;
LABEL_522:
                    v270 = v295;
                  }
                  else
                  {
LABEL_544:
                    if ((unint64_t)v328 < v326) {
                      goto LABEL_489;
                    }
                  }
                }
              }
LABEL_523:
              if (v269-- <= 2) {
                return;
              }
              continue;
            }
            goto LABEL_457;
          }
        }
        break;
      }
      uint64_t v244 = 2 * v213;
      uint64_t v245 = (2 * v213) | 1;
      uint64_t v213 = v245;
      unsigned int v214 = (unsigned __int16 *)(a1 + 48 * v245);
      uint64_t v246 = v244 + 2;
      if (v246 < v12)
      {
        unsigned int v247 = *(unsigned __int16 *)(a1 + 48 * v245 + 36);
        unsigned int v248 = v214[42];
        if (v247 < v248) {
          goto LABEL_411;
        }
        if (v247 <= v248)
        {
          unint64_t v249 = *((unsigned __int8 *)v214 + 71);
          int v250 = (char)v249;
          if ((v249 & 0x80u) != 0) {
            unint64_t v249 = *((void *)v214 + 7);
          }
          unint64_t v251 = *((unsigned __int8 *)v214 + 23);
          int v252 = (char)v251;
          if ((v251 & 0x80u) != 0) {
            unint64_t v251 = *((void *)v214 + 1);
          }
          if (v249 >= v251) {
            unint64_t v253 = v251;
          }
          else {
            unint64_t v253 = v249;
          }
          if (v253)
          {
            if (v252 >= 0) {
              v254 = v214;
            }
            else {
              v254 = *(unsigned __int16 **)v214;
            }
            if (v250 >= 0) {
              float v255 = v214 + 24;
            }
            else {
              float v255 = (unsigned __int16 *)*((void *)v214 + 6);
            }
            while (1)
            {
              unsigned int v256 = *v254;
              unsigned int v257 = *v255;
              if (v256 < v257) {
                break;
              }
              if (v257 < v256) {
                goto LABEL_431;
              }
              ++v254;
              ++v255;
              if (!--v253) {
                goto LABEL_430;
              }
            }
LABEL_411:
            v214 += 24;
            uint64_t v213 = v246;
          }
          else
          {
LABEL_430:
            if (v251 < v249) {
              goto LABEL_411;
            }
          }
        }
      }
LABEL_431:
      unsigned int v258 = v214[18];
      if (v258 < WORD6(v380)) {
        goto LABEL_451;
      }
      v228 = v241;
      if (v258 <= WORD6(v380))
      {
        unint64_t v259 = HIBYTE(v379);
        if (v379 < 0) {
          unint64_t v259 = *((void *)&v378 + 1);
        }
        unint64_t v260 = *((unsigned __int8 *)v214 + 23);
        int v261 = (char)v260;
        if ((v260 & 0x80u) != 0) {
          unint64_t v260 = *((void *)v214 + 1);
        }
        if (v259 >= v260) {
          unint64_t v262 = v260;
        }
        else {
          unint64_t v262 = v259;
        }
        if (v262)
        {
          if (v261 >= 0) {
            unsigned int v263 = v214;
          }
          else {
            unsigned int v263 = *(unsigned __int16 **)v214;
          }
          v264 = (unsigned __int16 *)&v378;
          if (v379 < 0) {
            v264 = (unsigned __int16 *)v378;
          }
          while (1)
          {
            unsigned int v265 = *v263;
            unsigned int v266 = *v264;
            if (v265 < v266) {
              goto LABEL_451;
            }
            if (v266 < v265) {
              break;
            }
            ++v263;
            ++v264;
            if (!--v262) {
              goto LABEL_450;
            }
          }
          v228 = v241;
        }
        else
        {
LABEL_450:
          v228 = v241;
          if (v260 < v259) {
            goto LABEL_451;
          }
        }
      }
      goto LABEL_406;
    }
    unint64_t v13 = (unint64_t)v12 >> 1;
    uint64_t v14 = a1 + 48 * ((unint64_t)v12 >> 1);
    if ((unint64_t)v11 < 0x1801)
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)v14, a1, (uint64_t)v377);
    }
    else
    {
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)a1, v14, (uint64_t)v377);
      uint64_t v15 = 3 * v13;
      unint64_t v16 = a1 + 16 * v15;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)(a1 + 48), v16 - 48, (uint64_t)(a2 - 48));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)(a1 + 96), a1 + 48 + 16 * v15, (uint64_t)(a2 - 72));
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)(v16 - 48), v14, a1 + 48 + 16 * v15);
      char v17 = *(unsigned __int16 **)a1;
      uint64_t v18 = *(void *)(a1 + 8);
      *(void *)((char *)&v382 + 7) = *(void *)(a1 + 15);
      *(void *)&long long v382 = v18;
      LOBYTE(v18) = *(unsigned char *)(a1 + 23);
      *(void *)(a1 + 8) = 0;
      *(void *)(a1 + 16) = 0;
      *(void *)a1 = 0;
      uint64_t v379 = *(void *)(a1 + 40);
      long long v378 = *(_OWORD *)(a1 + 24);
      long long v19 = *(_OWORD *)v14;
      *(void *)(a1 + 16) = *(void *)(v14 + 16);
      *(_OWORD *)a1 = v19;
      *(unsigned char *)(v14 + 23) = 0;
      long long v20 = *(_OWORD *)(v16 + 24);
      *(void *)(a1 + 40) = *(void *)(v16 + 40);
      *(_OWORD *)(a1 + 24) = v20;
      *(void *)uint64_t v14 = v17;
      uint64_t v21 = *(void *)((char *)&v382 + 7);
      *(void *)(v14 + 8) = v382;
      *(void *)(v14 + 15) = v21;
      *(unsigned char *)(v14 + 23) = v18;
      long long v22 = v378;
      *(void *)(v16 + 40) = v379;
      *(_OWORD *)(v16 + 24) = v22;
    }
    --a3;
    if ((a4 & 1) == 0)
    {
      uint64_t v23 = (unsigned __int16 *)(a1 - 48);
      unsigned int v24 = *(unsigned __int16 *)(a1 - 12);
      unsigned int v25 = *(unsigned __int16 *)(a1 + 36);
      if (v24 >= v25)
      {
        if (v24 > v25) {
          goto LABEL_144;
        }
        unint64_t v26 = *(unsigned __int8 *)(a1 + 23);
        int v27 = (char)v26;
        if ((v26 & 0x80u) != 0) {
          unint64_t v26 = *(void *)(a1 + 8);
        }
        unint64_t v28 = *(unsigned __int8 *)(a1 - 25);
        int v29 = (char)v28;
        if ((v28 & 0x80u) != 0) {
          unint64_t v28 = *(void *)(a1 - 40);
        }
        if (v26 >= v28) {
          unint64_t v30 = v28;
        }
        else {
          unint64_t v30 = v26;
        }
        if (v30)
        {
          if (v29 < 0) {
            uint64_t v23 = *(unsigned __int16 **)(a1 - 48);
          }
          if (v27 >= 0) {
            uint64_t v31 = (unsigned __int16 *)a1;
          }
          else {
            uint64_t v31 = *(unsigned __int16 **)a1;
          }
          while (1)
          {
            unsigned int v32 = *v23;
            unsigned int v33 = *v31;
            if (v32 < v33) {
              break;
            }
            if (v33 < v32) {
              goto LABEL_144;
            }
            ++v23;
            ++v31;
            if (!--v30) {
              goto LABEL_29;
            }
          }
        }
        else
        {
LABEL_29:
          if (v28 >= v26)
          {
LABEL_144:
            long long v99 = *(_OWORD *)a1;
            uint64_t v379 = *(void *)(a1 + 16);
            long long v378 = v99;
            *(void *)(a1 + 8) = 0;
            *(void *)(a1 + 16) = 0;
            *(void *)a1 = 0;
            long long v100 = *(_OWORD *)(a1 + 24);
            *((void *)v9 + 2) = *(void *)(a1 + 40);
            *uint64_t v9 = v100;
            unsigned int v101 = WORD6(v380);
            unsigned int v102 = *(a2 - 6);
            if (WORD6(v380) >= v102)
            {
              if (WORD6(v380) > v102) {
                goto LABEL_186;
              }
              unint64_t v116 = *((unsigned __int8 *)a2 - 25);
              int v117 = (char)v116;
              if ((v116 & 0x80u) != 0) {
                unint64_t v116 = *((void *)a2 - 5);
              }
              unint64_t v118 = HIBYTE(v379);
              if (v379 < 0) {
                unint64_t v118 = *((void *)&v378 + 1);
              }
              if (v116 >= v118) {
                unint64_t v119 = v118;
              }
              else {
                unint64_t v119 = v116;
              }
              if (v119)
              {
                float v120 = (unsigned __int16 *)&v378;
                if (v379 < 0) {
                  float v120 = (unsigned __int16 *)v378;
                }
                if (v117 >= 0) {
                  unint64_t v121 = a2 - 24;
                }
                else {
                  unint64_t v121 = *(unsigned __int16 **)v377;
                }
                while (1)
                {
                  unsigned int v122 = *v120;
                  unsigned int v123 = *v121;
                  if (v122 < v123) {
                    break;
                  }
                  if (v123 < v122) {
                    goto LABEL_186;
                  }
                  ++v120;
                  ++v121;
                  if (!--v119) {
                    goto LABEL_185;
                  }
                }
              }
              else
              {
LABEL_185:
                if (v118 >= v116)
                {
LABEL_186:
                  uint64_t v10 = (uint64_t *)(a1 + 48);
                  if (a1 + 48 >= (unint64_t)a2) {
                    goto LABEL_211;
                  }
                  unint64_t v124 = HIBYTE(v379);
                  if (v379 < 0) {
                    unint64_t v124 = *((void *)&v378 + 1);
                  }
                  uint64_t v125 = (unsigned __int16 *)&v378;
                  if (v379 < 0) {
                    uint64_t v125 = (unsigned __int16 *)v378;
                  }
                  unint64_t v106 = a1;
                  while (1)
                  {
                    unint64_t v126 = v106;
                    unint64_t v106 = (unint64_t)v10;
                    unsigned int v127 = *(unsigned __int16 *)(v126 + 84);
                    if (WORD6(v380) < v127) {
                      goto LABEL_210;
                    }
                    if (WORD6(v380) <= v127)
                    {
                      unint64_t v128 = *(unsigned __int8 *)(v126 + 71);
                      int v129 = (char)v128;
                      unint64_t v130 = *(void *)(v126 + 56);
                      if ((v128 & 0x80u) == 0) {
                        unint64_t v130 = v128;
                      }
                      if (v130 >= v124) {
                        unint64_t v131 = v124;
                      }
                      else {
                        unint64_t v131 = v130;
                      }
                      if (v131)
                      {
                        if (v129 >= 0) {
                          uint64_t v132 = (unsigned __int16 *)v10;
                        }
                        else {
                          uint64_t v132 = (unsigned __int16 *)*v10;
                        }
                        uint64_t v133 = v125;
                        while (1)
                        {
                          unsigned int v134 = *v133;
                          unsigned int v135 = *v132;
                          if (v134 < v135) {
                            goto LABEL_210;
                          }
                          if (v135 < v134) {
                            break;
                          }
                          ++v133;
                          ++v132;
                          if (!--v131) {
                            goto LABEL_207;
                          }
                        }
                      }
                      else
                      {
LABEL_207:
                        if (v124 < v130) {
                          goto LABEL_210;
                        }
                      }
                    }
                    v10 += 6;
                    if (v106 + 48 >= (unint64_t)a2) {
                      goto LABEL_211;
                    }
                  }
                }
              }
            }
            uint64_t v10 = (uint64_t *)(a1 + 48);
            unsigned int v103 = *(unsigned __int16 *)(a1 + 84);
            if (WORD6(v380) < v103) {
              goto LABEL_211;
            }
            unint64_t v104 = HIBYTE(v379);
            if (v379 < 0) {
              unint64_t v104 = *((void *)&v378 + 1);
            }
            uint64_t v105 = (unsigned __int16 *)&v378;
            if (v379 < 0) {
              uint64_t v105 = (unsigned __int16 *)v378;
            }
            unint64_t v106 = a1;
            while (1)
            {
              unint64_t v107 = v106;
              unint64_t v106 = (unint64_t)v10;
              if (WORD6(v380) <= v103)
              {
                unint64_t v108 = *(unsigned __int8 *)(v107 + 71);
                int v109 = (char)v108;
                unint64_t v110 = *(void *)(v107 + 56);
                if ((v108 & 0x80u) != 0) {
                  unint64_t v108 = v110;
                }
                if (v108 >= v104) {
                  unint64_t v111 = v104;
                }
                else {
                  unint64_t v111 = v108;
                }
                if (v111)
                {
                  if (v109 >= 0) {
                    float v112 = (unsigned __int16 *)v10;
                  }
                  else {
                    float v112 = (unsigned __int16 *)*v10;
                  }
                  int v113 = v105;
                  while (1)
                  {
                    unsigned int v114 = *v113;
                    unsigned int v115 = *v112;
                    if (v114 < v115) {
                      break;
                    }
                    if (v115 < v114) {
                      goto LABEL_166;
                    }
                    ++v113;
                    ++v112;
                    if (!--v111) {
                      goto LABEL_165;
                    }
                  }
LABEL_210:
                  uint64_t v10 = (uint64_t *)v106;
LABEL_211:
                  float v136 = v9;
                  uint64_t v137 = (uint64_t *)a2;
                  if (v10 < (uint64_t *)a2)
                  {
                    unint64_t v138 = HIBYTE(v379);
                    if (v379 < 0) {
                      unint64_t v138 = *((void *)&v378 + 1);
                    }
                    unsigned int v139 = (unsigned __int16 *)&v378;
                    if (v379 < 0) {
                      unsigned int v139 = (unsigned __int16 *)v378;
                    }
                    for (unsigned int i = a2; ; i -= 24)
                    {
                      uint64_t v137 = (uint64_t *)(i - 24);
                      if (WORD6(v380) >= v102)
                      {
                        if (WORD6(v380) > v102) {
                          break;
                        }
                        unint64_t v141 = *((unsigned __int8 *)i - 25);
                        int v142 = (char)v141;
                        if ((v141 & 0x80u) != 0) {
                          unint64_t v141 = *((void *)i - 5);
                        }
                        if (v141 >= v138) {
                          unint64_t v143 = v138;
                        }
                        else {
                          unint64_t v143 = v141;
                        }
                        if (v143)
                        {
                          if (v142 >= 0) {
                            unsigned int v144 = i - 24;
                          }
                          else {
                            unsigned int v144 = (unsigned __int16 *)*v137;
                          }
                          unsigned int v145 = v139;
                          while (1)
                          {
                            unsigned int v146 = *v145;
                            unsigned int v147 = *v144;
                            if (v146 < v147) {
                              break;
                            }
                            if (v147 < v146) {
                              goto LABEL_234;
                            }
                            ++v145;
                            ++v144;
                            if (!--v143) {
                              goto LABEL_232;
                            }
                          }
                        }
                        else
                        {
LABEL_232:
                          if (v138 >= v141) {
                            break;
                          }
                        }
                      }
                      unsigned int v102 = *(i - 30);
                    }
                  }
LABEL_234:
                  if (v10 >= v137) {
                    goto LABEL_276;
                  }
                  if (v379 >= 0) {
                    unint64_t v148 = HIBYTE(v379);
                  }
                  else {
                    unint64_t v148 = *((void *)&v378 + 1);
                  }
                  if (v379 >= 0) {
                    unint64_t v149 = (unsigned __int16 *)&v378;
                  }
                  else {
                    unint64_t v149 = (unsigned __int16 *)v378;
                  }
                  while (2)
                  {
                    v150 = v10;
                    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(v10, (uint64_t)v137);
                    v10 += 6;
                    while (2)
                    {
                      unsigned int v151 = *((unsigned __int16 *)v150 + 42);
                      if (v101 < v151) {
                        goto LABEL_259;
                      }
                      unsigned int v152 = v150;
                      v150 = v10;
                      if (v101 > v151) {
                        goto LABEL_258;
                      }
                      unint64_t v153 = *((unsigned __int8 *)v152 + 71);
                      int v154 = (char)v153;
                      uint64_t v155 = v152[7];
                      if ((v153 & 0x80u) != 0) {
                        unint64_t v153 = v155;
                      }
                      if (v153 >= v148) {
                        unint64_t v156 = v148;
                      }
                      else {
                        unint64_t v156 = v153;
                      }
                      if (v156)
                      {
                        if (v154 >= 0) {
                          int v157 = (unsigned __int16 *)v10;
                        }
                        else {
                          int v157 = (unsigned __int16 *)*v10;
                        }
                        long long v158 = v149;
                        do
                        {
                          unsigned int v159 = *v158;
                          unsigned int v160 = *v157;
                          if (v159 < v160) {
                            goto LABEL_259;
                          }
                          if (v160 < v159) {
                            goto LABEL_258;
                          }
                          ++v158;
                          ++v157;
                        }
                        while (--v156);
                      }
                      if (v148 >= v153)
                      {
LABEL_258:
                        v10 += 6;
                        continue;
                      }
                      break;
                    }
                    while (1)
                    {
                      do
                      {
LABEL_259:
                        uint64_t v161 = v137;
                        v137 -= 6;
                        unsigned int v162 = *((unsigned __int16 *)v161 - 6);
                      }
                      while (v101 < v162);
                      if (v101 > v162) {
                        break;
                      }
                      unint64_t v163 = *((unsigned __int8 *)v161 - 25);
                      int v164 = (char)v163;
                      unint64_t v165 = *(v161 - 5);
                      if ((v163 & 0x80u) == 0) {
                        unint64_t v165 = v163;
                      }
                      if (v165 >= v148) {
                        unint64_t v166 = v148;
                      }
                      else {
                        unint64_t v166 = v165;
                      }
                      if (v166)
                      {
                        if (v164 >= 0) {
                          uint64_t v167 = (unsigned __int16 *)v137;
                        }
                        else {
                          uint64_t v167 = (unsigned __int16 *)*v137;
                        }
                        float v168 = v149;
                        while (1)
                        {
                          unsigned int v169 = *v168;
                          unsigned int v170 = *v167;
                          if (v169 < v170) {
                            break;
                          }
                          if (v170 < v169) {
                            goto LABEL_275;
                          }
                          ++v168;
                          ++v167;
                          if (!--v166) {
                            goto LABEL_274;
                          }
                        }
                      }
                      else
                      {
LABEL_274:
                        if (v148 >= v165) {
                          break;
                        }
                      }
                    }
LABEL_275:
                    if (v10 < v137) {
                      continue;
                    }
                    break;
                  }
LABEL_276:
                  uint64_t v171 = (void **)(v10 - 6);
                  BOOL v4 = (unint64_t)(v10 - 6) >= a1;
                  BOOL v5 = v10 - 6 == (uint64_t *)a1;
                  uint64_t v9 = v136;
                  if (v10 - 6 != (uint64_t *)a1)
                  {
                    if (*(char *)(a1 + 23) < 0) {
                      operator delete(*(void **)a1);
                    }
                    long long v172 = *(_OWORD *)v171;
                    *(void *)(a1 + 16) = *(v10 - 4);
                    *(_OWORD *)a1 = v172;
                    *((unsigned char *)v10 - 25) = 0;
                    *((_WORD *)v10 - 24) = 0;
                    long long v173 = *(_OWORD *)(v10 - 3);
                    *(void *)(a1 + 40) = *(v10 - 1);
                    *(_OWORD *)(a1 + 24) = v173;
                  }
                  if (*((char *)v10 - 25) < 0) {
                    operator delete(*v171);
                  }
                  a4 = 0;
                  long long v174 = v378;
                  *(v10 - 4) = v379;
                  *(_OWORD *)uint64_t v171 = v174;
                  long long v175 = *v136;
                  *(v10 - 1) = *((void *)v136 + 2);
                  *(_OWORD *)(v10 - 3) = v175;
                  goto LABEL_3;
                }
LABEL_165:
                if (v104 < v108) {
                  goto LABEL_210;
                }
              }
LABEL_166:
              v10 += 6;
              unsigned int v103 = *(unsigned __int16 *)(v106 + 84);
              if (WORD6(v380) < v103) {
                goto LABEL_211;
              }
            }
          }
        }
      }
    }
    uint64_t v376 = a3;
    long long v34 = *(_OWORD *)a1;
    uint64_t v379 = *(void *)(a1 + 16);
    long long v378 = v34;
    *(void *)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
    *(void *)a1 = 0;
    uint64_t v35 = *(void *)(a1 + 40);
    *uint64_t v9 = *(_OWORD *)(a1 + 24);
    *((void *)v9 + 2) = v35;
    unsigned int v36 = WORD6(v380);
    if (v379 >= 0) {
      unint64_t v37 = HIBYTE(v379);
    }
    else {
      unint64_t v37 = *((void *)&v378 + 1);
    }
    if (v379 >= 0) {
      float v38 = (unsigned __int16 *)&v378;
    }
    else {
      float v38 = (unsigned __int16 *)v378;
    }
    float v39 = (uint64_t *)a1;
    while (1)
    {
      do
      {
        long long v40 = v39;
        v39 += 6;
        unsigned int v41 = *((unsigned __int16 *)v40 + 42);
      }
      while (v41 < WORD6(v380));
      if (v41 > WORD6(v380)) {
        break;
      }
      unint64_t v42 = *((unsigned __int8 *)v40 + 71);
      int v43 = (char)v42;
      if ((v42 & 0x80u) != 0) {
        unint64_t v42 = v40[7];
      }
      if (v37 >= v42) {
        unint64_t v44 = v42;
      }
      else {
        unint64_t v44 = v37;
      }
      if (v44)
      {
        if (v43 >= 0) {
          long long v45 = (unsigned __int16 *)v39;
        }
        else {
          long long v45 = (unsigned __int16 *)*v39;
        }
        long long v46 = v38;
        while (1)
        {
          unsigned int v47 = *v45;
          unsigned int v48 = *v46;
          if (v47 < v48) {
            break;
          }
          if (v48 < v47) {
            goto LABEL_53;
          }
          ++v45;
          ++v46;
          if (!--v44) {
            goto LABEL_52;
          }
        }
      }
      else
      {
LABEL_52:
        if (v42 >= v37) {
          break;
        }
      }
    }
LABEL_53:
    if (v40 != (uint64_t *)a1)
    {
      unsigned int v49 = *(a2 - 6);
      long long v50 = a2 - 24;
      uint64_t v51 = a2;
      while (v49 >= WORD6(v380))
      {
        float v52 = v51;
        uint64_t v51 = v50;
        if (v49 <= WORD6(v380))
        {
          unint64_t v53 = *((unsigned __int8 *)v52 - 25);
          int v54 = (char)v53;
          unint64_t v55 = *((void *)v52 - 5);
          if ((v53 & 0x80u) != 0) {
            unint64_t v53 = v55;
          }
          if (v37 >= v53) {
            unint64_t v56 = v53;
          }
          else {
            unint64_t v56 = v37;
          }
          if (v56)
          {
            if (v54 >= 0) {
              uint64_t v57 = v50;
            }
            else {
              uint64_t v57 = *(unsigned __int16 **)v50;
            }
            uint64_t v58 = v38;
            do
            {
              unsigned int v59 = *v57;
              unsigned int v60 = *v58;
              if (v59 < v60) {
                goto LABEL_97;
              }
              if (v60 < v59) {
                goto LABEL_71;
              }
              ++v57;
              ++v58;
            }
            while (--v56);
          }
          if (v53 < v37) {
            goto LABEL_97;
          }
        }
LABEL_71:
        v50 -= 24;
        unsigned int v49 = *(v51 - 6);
      }
      goto LABEL_98;
    }
    long long v50 = a2;
    if (v39 >= (uint64_t *)a2) {
      goto LABEL_98;
    }
    unsigned int v61 = *(a2 - 6);
    long long v50 = a2 - 24;
    if (v61 < WORD6(v380)) {
      goto LABEL_98;
    }
    long long v50 = a2 - 24;
    uint64_t v62 = a2;
    while (1)
    {
      uint64_t v51 = v50;
      if (v61 > WORD6(v380))
      {
LABEL_76:
        if (v39 >= (uint64_t *)v50) {
          goto LABEL_97;
        }
        goto LABEL_95;
      }
      unint64_t v63 = *((unsigned __int8 *)v62 - 25);
      int v64 = (char)v63;
      unint64_t v65 = *((void *)v62 - 5);
      if ((v63 & 0x80u) != 0) {
        unint64_t v63 = v65;
      }
      uint64_t v66 = v37 >= v63 ? v63 : v37;
      if (v66) {
        break;
      }
LABEL_91:
      if (v63 < v37 || v39 >= (uint64_t *)v50) {
        goto LABEL_97;
      }
LABEL_95:
      v50 -= 24;
      unsigned int v61 = *(v51 - 6);
      uint64_t v62 = v51;
      if (v61 < WORD6(v380)) {
        goto LABEL_98;
      }
    }
    if (v64 >= 0) {
      uint64_t v67 = v50;
    }
    else {
      uint64_t v67 = *(unsigned __int16 **)v50;
    }
    uint64_t v68 = v38;
    while (1)
    {
      unsigned int v69 = *v67;
      unsigned int v70 = *v68;
      if (v69 < v70) {
        break;
      }
      if (v70 < v69) {
        goto LABEL_76;
      }
      ++v67;
      ++v68;
      if (!--v66) {
        goto LABEL_91;
      }
    }
LABEL_97:
    long long v50 = v51;
LABEL_98:
    uint64_t v10 = v39;
    if (v39 < (uint64_t *)v50)
    {
      uint64_t v72 = v50;
      do
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(v10, (uint64_t)v72);
        while (1)
        {
          do
          {
            uint64_t v73 = v10;
            v10 += 6;
            unsigned int v74 = *((unsigned __int16 *)v73 + 42);
          }
          while (v74 < v36);
          if (v74 > v36) {
            break;
          }
          unint64_t v75 = *((unsigned __int8 *)v73 + 71);
          int v76 = (char)v75;
          unint64_t v77 = v73[7];
          if ((v75 & 0x80u) == 0) {
            unint64_t v77 = v75;
          }
          if (v37 >= v77) {
            unint64_t v78 = v77;
          }
          else {
            unint64_t v78 = v37;
          }
          if (v78)
          {
            if (v76 >= 0) {
              uint64_t v79 = (unsigned __int16 *)v10;
            }
            else {
              uint64_t v79 = (unsigned __int16 *)*v10;
            }
            float v80 = v38;
            while (1)
            {
              unsigned int v81 = *v79;
              unsigned int v82 = *v80;
              if (v81 < v82) {
                break;
              }
              if (v82 < v81) {
                goto LABEL_117;
              }
              ++v79;
              ++v80;
              if (!--v78) {
                goto LABEL_116;
              }
            }
          }
          else
          {
LABEL_116:
            if (v77 >= v37) {
              break;
            }
          }
        }
LABEL_117:
        while (1)
        {
          uint64_t v83 = v72 - 6;
          unsigned int v84 = *((unsigned __int16 *)v72 - 6);
          if (v84 < v36) {
            break;
          }
          uint64_t v85 = v72;
          v72 -= 6;
          if (v84 <= v36)
          {
            unint64_t v86 = *((unsigned __int8 *)v85 - 25);
            int v87 = (char)v86;
            if ((v86 & 0x80u) != 0) {
              unint64_t v86 = *(v85 - 5);
            }
            if (v37 >= v86) {
              unint64_t v88 = v86;
            }
            else {
              unint64_t v88 = v37;
            }
            if (v88)
            {
              BOOL v89 = (unsigned __int16 *)*v72;
              if (v87 >= 0) {
                BOOL v89 = (unsigned __int16 *)v72;
              }
              uint64_t v90 = v38;
              while (1)
              {
                unsigned int v91 = *v89;
                unsigned int v92 = *v90;
                if (v91 < v92) {
                  break;
                }
                if (v92 < v91) {
                  goto LABEL_117;
                }
                ++v89;
                ++v90;
                if (!--v88) {
                  goto LABEL_131;
                }
              }
LABEL_132:
              uint64_t v83 = v72;
              break;
            }
LABEL_131:
            if (v86 < v37) {
              goto LABEL_132;
            }
          }
        }
        uint64_t v72 = v83;
      }
      while (v10 < v83);
    }
    uint64_t v93 = (void **)(v10 - 6);
    a3 = v376;
    uint64_t v9 = &v380;
    if (v10 - 6 != (uint64_t *)a1)
    {
      if (*(char *)(a1 + 23) < 0) {
        operator delete(*(void **)a1);
      }
      long long v94 = *(_OWORD *)v93;
      *(void *)(a1 + 16) = *(v10 - 4);
      *(_OWORD *)a1 = v94;
      *((unsigned char *)v10 - 25) = 0;
      *((_WORD *)v10 - 24) = 0;
      long long v95 = *(_OWORD *)(v10 - 3);
      *(void *)(a1 + 40) = *(v10 - 1);
      *(_OWORD *)(a1 + 24) = v95;
    }
    if (*((char *)v10 - 25) < 0) {
      operator delete(*v93);
    }
    long long v96 = v378;
    *(v10 - 4) = v379;
    *(_OWORD *)uint64_t v93 = v96;
    long long v97 = v380;
    *(v10 - 1) = v381;
    *(_OWORD *)(v10 - 3) = v97;
    if (v39 < (uint64_t *)v50)
    {
LABEL_143:
      std::__introsort<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,false>(a1, v10 - 6, v376, a4 & 1);
      a4 = 0;
    }
    else
    {
      BOOL v98 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)a1, (unsigned __int16 *)v10 - 24);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>((unsigned __int16 *)v10, a2))
      {
        a2 = (unsigned __int16 *)(v10 - 6);
        if (v98) {
          return;
        }
        goto LABEL_2;
      }
      if (!v98) {
        goto LABEL_143;
      }
    }
  }
  if (a4)
  {
    if ((unsigned __int16 *)a1 == a2) {
      return;
    }
    unint64_t v178 = a1 + 48;
    if ((unsigned __int16 *)(a1 + 48) == a2) {
      return;
    }
    v179 = (unsigned __int16 *)a1;
    while (2)
    {
      float v180 = v179;
      v179 = (unsigned __int16 *)v178;
      unsigned int v181 = v180[42];
      unsigned int v182 = v180[18];
      if (v181 >= v182)
      {
        if (v181 <= v182)
        {
          unint64_t v198 = *((unsigned __int8 *)v180 + 23);
          int v199 = (char)v198;
          if ((v198 & 0x80u) != 0) {
            unint64_t v198 = *((void *)v180 + 1);
          }
          unint64_t v200 = *((unsigned __int8 *)v180 + 71);
          int v201 = (char)v200;
          if ((v200 & 0x80u) != 0) {
            unint64_t v200 = *((void *)v180 + 7);
          }
          if (v198 >= v200) {
            unint64_t v202 = v200;
          }
          else {
            unint64_t v202 = v198;
          }
          if (v202)
          {
            if (v201 >= 0) {
              v203 = v179;
            }
            else {
              v203 = *(unsigned __int16 **)v179;
            }
            if (v199 >= 0) {
              v204 = v180;
            }
            else {
              v204 = *(unsigned __int16 **)v180;
            }
            do
            {
              unsigned int v205 = *v203;
              unsigned int v206 = *v204;
              if (v205 < v206) {
                goto LABEL_305;
              }
              if (v206 < v205) {
                goto LABEL_358;
              }
              ++v203;
              ++v204;
            }
            while (--v202);
          }
          if (v200 < v198) {
            goto LABEL_305;
          }
        }
      }
      else
      {
LABEL_305:
        uint64_t v183 = a2;
        long long v184 = *(_OWORD *)v179;
        uint64_t v379 = *((void *)v179 + 2);
        long long v378 = v184;
        *((void *)v179 + 1) = 0;
        *((void *)v179 + 2) = 0;
        *(void *)v179 = 0;
        long long v380 = *(_OWORD *)(v180 + 36);
        uint64_t v381 = *((void *)v180 + 11);
        unsigned int v185 = WORD6(v380);
        if (v379 >= 0) {
          unint64_t v186 = HIBYTE(v379);
        }
        else {
          unint64_t v186 = *((void *)&v378 + 1);
        }
        if (v379 >= 0) {
          uint64_t v187 = (unsigned __int16 *)&v378;
        }
        else {
          uint64_t v187 = (unsigned __int16 *)v378;
        }
        v188 = v179;
        while (1)
        {
          v189 = v180;
          if (*((char *)v188 + 23) < 0) {
            operator delete(*(void **)v188);
          }
          *(_OWORD *)v188 = *(_OWORD *)v189;
          *((void *)v188 + 2) = *((void *)v189 + 2);
          *((unsigned char *)v189 + 23) = 0;
          unsigned __int16 *v189 = 0;
          *(_OWORD *)(v188 + 12) = *(_OWORD *)(v189 + 12);
          *((void *)v188 + 5) = *((void *)v189 + 5);
          if (v189 == (unsigned __int16 *)a1) {
            break;
          }
          float v180 = v189 - 24;
          unsigned int v190 = *(v189 - 6);
          v188 = v189;
          if (v185 >= v190)
          {
            if (v185 > v190) {
              goto LABEL_353;
            }
            unint64_t v191 = *((unsigned __int8 *)v189 - 25);
            int v192 = (char)v191;
            if ((v191 & 0x80u) != 0) {
              unint64_t v191 = *((void *)v189 - 5);
            }
            if (v191 >= v186) {
              unint64_t v193 = v186;
            }
            else {
              unint64_t v193 = v191;
            }
            if (v193)
            {
              if (v192 >= 0) {
                uint64_t v194 = v189 - 24;
              }
              else {
                uint64_t v194 = *(unsigned __int16 **)v180;
              }
              int v195 = v187;
              while (1)
              {
                unsigned int v196 = *v195;
                unsigned int v197 = *v194;
                if (v196 < v197) {
                  break;
                }
                if (v197 < v196) {
                  goto LABEL_353;
                }
                ++v195;
                ++v194;
                if (!--v193) {
                  goto LABEL_330;
                }
              }
              v188 = v189;
            }
            else
            {
LABEL_330:
              v188 = v189;
              if (v186 >= v191)
              {
LABEL_353:
                unint64_t v207 = (unint64_t)v189;
                goto LABEL_355;
              }
            }
          }
        }
        unint64_t v207 = a1;
LABEL_355:
        if (*(char *)(v207 + 23) < 0) {
          operator delete(*(void **)v207);
        }
        long long v208 = v378;
        *(void *)(v207 + 16) = v379;
        *(_OWORD *)unint64_t v207 = v208;
        long long v209 = v380;
        *((void *)v189 + 5) = v381;
        *(_OWORD *)(v189 + 12) = v209;
        a2 = v183;
      }
LABEL_358:
      unint64_t v178 = (unint64_t)(v179 + 24);
      if (v179 + 24 == a2) {
        return;
      }
      continue;
    }
  }
  if ((unsigned __int16 *)a1 != a2)
  {
    unint64_t v344 = a1 + 48;
    if ((unsigned __int16 *)(a1 + 48) != a2)
    {
      while (2)
      {
        v345 = (unsigned __int16 *)a1;
        a1 = v344;
        unsigned int v346 = v345[42];
        unsigned int v347 = v345[18];
        if (v346 < v347) {
          goto LABEL_569;
        }
        if (v346 <= v347)
        {
          unint64_t v365 = *((unsigned __int8 *)v345 + 23);
          int v366 = (char)v365;
          if ((v365 & 0x80u) != 0) {
            unint64_t v365 = *((void *)v345 + 1);
          }
          unint64_t v367 = *((unsigned __int8 *)v345 + 71);
          int v368 = (char)v367;
          if ((v367 & 0x80u) != 0) {
            unint64_t v367 = *((void *)v345 + 7);
          }
          if (v365 >= v367) {
            unint64_t v369 = v367;
          }
          else {
            unint64_t v369 = v365;
          }
          if (v369)
          {
            if (v368 >= 0) {
              uint64_t v370 = (unsigned __int16 *)a1;
            }
            else {
              uint64_t v370 = *(unsigned __int16 **)a1;
            }
            if (v366 >= 0) {
              v371 = v345;
            }
            else {
              v371 = *(unsigned __int16 **)v345;
            }
            while (1)
            {
              unsigned int v372 = *v370;
              unsigned int v373 = *v371;
              if (v372 < v373) {
                break;
              }
              if (v373 < v372) {
                goto LABEL_618;
              }
              ++v370;
              ++v371;
              if (!--v369) {
                goto LABEL_617;
              }
            }
LABEL_569:
            v348 = a2;
            long long v349 = *(_OWORD *)a1;
            uint64_t v379 = *(void *)(a1 + 16);
            long long v378 = v349;
            *(void *)(a1 + 8) = 0;
            *(void *)(a1 + 16) = 0;
            *(void *)a1 = 0;
            long long v380 = *(_OWORD *)(v345 + 36);
            uint64_t v381 = *((void *)v345 + 11);
            unsigned int v350 = WORD6(v380);
            if (v379 >= 0) {
              unint64_t v351 = HIBYTE(v379);
            }
            else {
              unint64_t v351 = *((void *)&v378 + 1);
            }
            if (v379 >= 0) {
              uint64_t v352 = (unsigned __int16 *)&v378;
            }
            else {
              uint64_t v352 = (unsigned __int16 *)v378;
            }
            unint64_t v353 = a1;
            while (1)
            {
              do
              {
                v354 = v345;
                if (*(char *)(v353 + 23) < 0) {
                  operator delete(*(void **)v353);
                }
                *(_OWORD *)unint64_t v353 = *(_OWORD *)v354;
                *(void *)(v353 + 16) = *((void *)v354 + 2);
                *((unsigned char *)v354 + 23) = 0;
                unsigned __int16 *v354 = 0;
                *(_OWORD *)(v353 + 24) = *(_OWORD *)(v354 + 12);
                *(void *)(v353 + 40) = *((void *)v354 + 5);
                v345 = v354 - 24;
                unsigned int v355 = *(v354 - 6);
                unint64_t v353 = (unint64_t)v354;
              }
              while (v350 < v355);
              if (v350 > v355) {
                break;
              }
              unint64_t v356 = *((unsigned __int8 *)v354 - 25);
              int v357 = (char)v356;
              if ((v356 & 0x80u) != 0) {
                unint64_t v356 = *((void *)v354 - 5);
              }
              if (v356 >= v351) {
                unint64_t v358 = v351;
              }
              else {
                unint64_t v358 = v356;
              }
              if (v358)
              {
                if (v357 >= 0) {
                  v359 = v354 - 24;
                }
                else {
                  v359 = *(unsigned __int16 **)v345;
                }
                uint64_t v360 = v352;
                while (1)
                {
                  unsigned int v361 = *v360;
                  unsigned int v362 = *v359;
                  if (v361 < v362) {
                    break;
                  }
                  if (v362 < v361) {
                    goto LABEL_596;
                  }
                  ++v360;
                  ++v359;
                  if (!--v358) {
                    goto LABEL_593;
                  }
                }
                unint64_t v353 = (unint64_t)v354;
              }
              else
              {
LABEL_593:
                unint64_t v353 = (unint64_t)v354;
                if (v351 >= v356) {
                  break;
                }
              }
            }
LABEL_596:
            if (*((char *)v354 + 23) < 0) {
              operator delete(*(void **)v354);
            }
            long long v363 = v378;
            *((void *)v354 + 2) = v379;
            *(_OWORD *)v354 = v363;
            long long v364 = v380;
            *((void *)v354 + 5) = v381;
            *(_OWORD *)(v354 + 12) = v364;
            a2 = v348;
          }
          else
          {
LABEL_617:
            if (v367 < v365) {
              goto LABEL_569;
            }
          }
        }
LABEL_618:
        unint64_t v344 = a1 + 48;
        if ((unsigned __int16 *)(a1 + 48) == a2) {
          return;
        }
        continue;
      }
    }
  }
}

void std::vector<skit::Token>::resize(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  unint64_t v6 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 4);
  unint64_t v7 = a2 - v6;
  if (a2 <= v6)
  {
    if (a2 < v6)
    {
      unint64_t v15 = v4 + 48 * a2;
      while (v5 != v15)
      {
        if (*(char *)(v5 - 25) < 0) {
          operator delete(*(void **)(v5 - 48));
        }
        v5 -= 48;
      }
      a1[1] = v15;
    }
  }
  else
  {
    uint64_t v8 = a1[2];
    if (0xAAAAAAAAAAAAAAABLL * ((v8 - v5) >> 4) >= v7)
    {
      uint64_t v16 = v5 + 48 * v7;
      do
      {
        *(_OWORD *)(v5 + 16) = 0uLL;
        *(_OWORD *)(v5 + 32) = 0uLL;
        *(_OWORD *)uint64_t v5 = 0uLL;
        *(_DWORD *)(v5 + 32) = 1065353216;
        *(_DWORD *)(v5 + 38) = 196609;
        v5 += 48;
      }
      while (v5 != v16);
      a1[1] = v16;
    }
    else
    {
      if (a2 > 0x555555555555555) {
        std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
      }
      v17[4] = a1 + 2;
      unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * ((v8 - v4) >> 4);
      uint64_t v10 = 2 * v9;
      if (2 * v9 <= a2) {
        uint64_t v10 = a2;
      }
      if (v9 >= 0x2AAAAAAAAAAAAAALL) {
        unint64_t v11 = 0x555555555555555;
      }
      else {
        unint64_t v11 = v10;
      }
      uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v11);
      unint64_t v13 = &v12[48 * v6];
      v17[0] = v12;
      v17[1] = v13;
      v17[3] = &v12[48 * v14];
      do
      {
        *((_OWORD *)v13 + 1) = 0uLL;
        *((_OWORD *)v13 + 2) = 0uLL;
        *(_OWORD *)unint64_t v13 = 0uLL;
        *((_DWORD *)v13 + 8) = 1065353216;
        *(_DWORD *)(v13 + 38) = 196609;
        v13 += 48;
      }
      while (v13 != &v12[48 * a2]);
      v17[2] = &v12[48 * a2];
      std::vector<skit::Token>::__swap_out_circular_buffer(a1, v17);
      std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)v17);
    }
  }
}

uint64_t *std::vector<skit::Token>::__swap_out_circular_buffer(uint64_t *result, void *a2)
{
  uint64_t v2 = *result;
  uint64_t v3 = result[1];
  uint64_t v4 = a2[1];
  if (v3 == *result)
  {
    uint64_t v5 = a2[1];
  }
  else
  {
    do
    {
      uint64_t v5 = v4 - 48;
      long long v6 = *(_OWORD *)(v3 - 48);
      *(void *)(v4 - 32) = *(void *)(v3 - 32);
      *(_OWORD *)(v4 - 48) = v6;
      *(void *)(v3 - 40) = 0;
      *(void *)(v3 - 32) = 0;
      *(void *)(v3 - 48) = 0;
      long long v7 = *(_OWORD *)(v3 - 24);
      *(void *)(v4 - 8) = *(void *)(v3 - 8);
      *(_OWORD *)(v4 - 24) = v7;
      v4 -= 48;
      v3 -= 48;
    }
    while (v3 != v2);
  }
  a2[1] = v5;
  uint64_t v8 = *result;
  void *result = v5;
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

uint64_t std::__split_buffer<skit::Token>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void ***)(a1 + 8);
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      uint64_t v4 = v2 - 6;
      *(void *)(a1 + 16) = v2 - 6;
      if (*((char *)v2 - 25) < 0)
      {
        operator delete(*v4);
        uint64_t v4 = *(void ***)(a1 + 16);
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

__n128 std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *(void *)unint64_t v11 = a1[1];
  *(void *)&v11[7] = *(uint64_t *)((char *)a1 + 15);
  char v4 = *((unsigned char *)a1 + 23);
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 0;
  __n128 v9 = *(__n128 *)(a1 + 3);
  unint64_t v10 = a1[5];
  uint64_t v5 = *(void *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  a1[2] = v5;
  *(unsigned char *)(a2 + 23) = 0;
  *(_WORD *)a2 = 0;
  long long v6 = (__n128 *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  a1[5] = v7;
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
  *(void *)a2 = v3;
  *(void *)(a2 + 8) = *(void *)v11;
  *(void *)(a2 + 15) = *(void *)&v11[7];
  *(unsigned char *)(a2 + 23) = v4;
  __n128 result = v9;
  *long long v6 = v9;
  v6[1].n128_u64[0] = v10;
  return result;
}

void std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(unsigned __int16 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  unsigned int v6 = *(unsigned __int16 *)(a2 + 36);
  unsigned int v7 = a1[18];
  if (v6 < v7) {
    goto LABEL_2;
  }
  if (v6 <= v7)
  {
    unint64_t v9 = *((unsigned __int8 *)a1 + 23);
    int v10 = (char)v9;
    if ((v9 & 0x80u) != 0) {
      unint64_t v9 = *((void *)a1 + 1);
    }
    unint64_t v11 = *(unsigned __int8 *)(a2 + 23);
    int v12 = (char)v11;
    if ((v11 & 0x80u) != 0) {
      unint64_t v11 = *(void *)(a2 + 8);
    }
    if (v9 >= v11) {
      unint64_t v13 = v11;
    }
    else {
      unint64_t v13 = v9;
    }
    if (v13)
    {
      if (v12 >= 0) {
        uint64_t v14 = (unsigned __int16 *)a2;
      }
      else {
        uint64_t v14 = *(unsigned __int16 **)a2;
      }
      if (v10 >= 0) {
        unint64_t v15 = a1;
      }
      else {
        unint64_t v15 = *(unsigned __int16 **)a1;
      }
      do
      {
        unsigned int v16 = *v14;
        unsigned int v17 = *v15;
        if (v16 < v17) {
          goto LABEL_2;
        }
        if (v17 < v16) {
          goto LABEL_23;
        }
        ++v14;
        ++v15;
      }
      while (--v13);
    }
    if (v11 < v9)
    {
LABEL_2:
      unsigned int v8 = *(unsigned __int16 *)(a3 + 36);
      if (v8 >= v6)
      {
        if (v8 > v6) {
          goto LABEL_45;
        }
        unint64_t v22 = *(unsigned __int8 *)(a2 + 23);
        int v23 = (char)v22;
        if ((v22 & 0x80u) != 0) {
          unint64_t v22 = *(void *)(a2 + 8);
        }
        unint64_t v24 = *(unsigned __int8 *)(a3 + 23);
        int v25 = (char)v24;
        if ((v24 & 0x80u) != 0) {
          unint64_t v24 = *(void *)(a3 + 8);
        }
        if (v22 >= v24) {
          unint64_t v26 = v24;
        }
        else {
          unint64_t v26 = v22;
        }
        if (v26)
        {
          if (v25 >= 0) {
            int v27 = (unsigned __int16 *)a3;
          }
          else {
            int v27 = *(unsigned __int16 **)a3;
          }
          if (v23 >= 0) {
            unint64_t v28 = (unsigned __int16 *)a2;
          }
          else {
            unint64_t v28 = *(unsigned __int16 **)a2;
          }
          do
          {
            unsigned int v29 = *v27;
            unsigned int v30 = *v28;
            if (v29 < v30) {
              goto LABEL_47;
            }
            if (v30 < v29) {
              goto LABEL_45;
            }
            ++v27;
            ++v28;
          }
          while (--v26);
        }
        if (v24 >= v22)
        {
LABEL_45:
          std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a1, a2);
          unsigned int v31 = *(unsigned __int16 *)(a3 + 36);
          unsigned int v32 = *(unsigned __int16 *)(a2 + 36);
          if (v31 >= v32)
          {
            if (v31 > v32) {
              return;
            }
            unint64_t v51 = *(unsigned __int8 *)(a2 + 23);
            int v52 = (char)v51;
            if ((v51 & 0x80u) != 0) {
              unint64_t v51 = *(void *)(a2 + 8);
            }
            unint64_t v53 = *(unsigned __int8 *)(a3 + 23);
            int v54 = (char)v53;
            if ((v53 & 0x80u) != 0) {
              unint64_t v53 = *(void *)(a3 + 8);
            }
            if (v51 >= v53) {
              unint64_t v55 = v53;
            }
            else {
              unint64_t v55 = v51;
            }
            if (v55)
            {
              if (v54 >= 0) {
                unint64_t v56 = (unsigned __int16 *)a3;
              }
              else {
                unint64_t v56 = *(unsigned __int16 **)a3;
              }
              if (v52 >= 0) {
                uint64_t v57 = (unsigned __int16 *)a2;
              }
              else {
                uint64_t v57 = *(unsigned __int16 **)a2;
              }
              while (1)
              {
                unsigned int v58 = *v56;
                unsigned int v59 = *v57;
                if (v58 < v59) {
                  break;
                }
                if (v59 < v58) {
                  return;
                }
                ++v56;
                ++v57;
                if (!--v55) {
                  goto LABEL_109;
                }
              }
            }
            else
            {
LABEL_109:
              if (v53 >= v51) {
                return;
              }
            }
          }
          a1 = (unsigned __int16 *)a2;
        }
      }
LABEL_47:
      uint64_t v21 = a3;
      goto LABEL_48;
    }
  }
LABEL_23:
  unsigned int v18 = *(unsigned __int16 *)(a3 + 36);
  if (v18 >= v6)
  {
    if (v18 > v6) {
      return;
    }
    unint64_t v33 = *(unsigned __int8 *)(a2 + 23);
    int v34 = (char)v33;
    if ((v33 & 0x80u) != 0) {
      unint64_t v33 = *(void *)(a2 + 8);
    }
    unint64_t v35 = *(unsigned __int8 *)(a3 + 23);
    int v36 = (char)v35;
    if ((v35 & 0x80u) != 0) {
      unint64_t v35 = *(void *)(a3 + 8);
    }
    if (v33 >= v35) {
      unint64_t v37 = v35;
    }
    else {
      unint64_t v37 = v33;
    }
    if (v37)
    {
      if (v36 >= 0) {
        float v38 = (unsigned __int16 *)a3;
      }
      else {
        float v38 = *(unsigned __int16 **)a3;
      }
      if (v34 >= 0) {
        float v39 = (unsigned __int16 *)a2;
      }
      else {
        float v39 = *(unsigned __int16 **)a2;
      }
      while (1)
      {
        unsigned int v40 = *v38;
        unsigned int v41 = *v39;
        if (v40 < v41) {
          break;
        }
        if (v41 < v40) {
          return;
        }
        ++v38;
        ++v39;
        if (!--v37) {
          goto LABEL_69;
        }
      }
    }
    else
    {
LABEL_69:
      if (v35 >= v33) {
        return;
      }
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a2, a3);
  unsigned int v19 = *(unsigned __int16 *)(a2 + 36);
  unsigned int v20 = v5[18];
  if (v19 >= v20)
  {
    if (v19 > v20) {
      return;
    }
    unint64_t v42 = *((unsigned __int8 *)v5 + 23);
    int v43 = (char)v42;
    if ((v42 & 0x80u) != 0) {
      unint64_t v42 = *((void *)v5 + 1);
    }
    unint64_t v44 = *(unsigned __int8 *)(a2 + 23);
    int v45 = (char)v44;
    if ((v44 & 0x80u) != 0) {
      unint64_t v44 = *(void *)(a2 + 8);
    }
    if (v42 >= v44) {
      unint64_t v46 = v44;
    }
    else {
      unint64_t v46 = v42;
    }
    if (v46)
    {
      if (v45 >= 0) {
        unsigned int v47 = (unsigned __int16 *)a2;
      }
      else {
        unsigned int v47 = *(unsigned __int16 **)a2;
      }
      if (v43 >= 0) {
        unsigned int v48 = v5;
      }
      else {
        unsigned int v48 = *(unsigned __int16 **)v5;
      }
      while (1)
      {
        unsigned int v49 = *v47;
        unsigned int v50 = *v48;
        if (v49 < v50) {
          break;
        }
        if (v50 < v49) {
          return;
        }
        ++v47;
        ++v48;
        if (!--v46) {
          goto LABEL_89;
        }
      }
    }
    else
    {
LABEL_89:
      if (v44 >= v42) {
        return;
      }
    }
  }
  a1 = v5;
  uint64_t v21 = a2;
LABEL_48:

  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a1, v21);
}

void std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(a1, a2, a3);
  unsigned int v8 = *(unsigned __int16 *)(a4 + 36);
  unsigned int v9 = *(unsigned __int16 *)(a3 + 36);
  if (v8 >= v9)
  {
    if (v8 > v9) {
      return;
    }
    unint64_t v14 = *(unsigned __int8 *)(a3 + 23);
    int v15 = (char)v14;
    if ((v14 & 0x80u) != 0) {
      unint64_t v14 = *(void *)(a3 + 8);
    }
    unint64_t v16 = *(unsigned __int8 *)(a4 + 23);
    int v17 = (char)v16;
    if ((v16 & 0x80u) != 0) {
      unint64_t v16 = *(void *)(a4 + 8);
    }
    if (v14 >= v16) {
      unint64_t v18 = v16;
    }
    else {
      unint64_t v18 = v14;
    }
    if (v18)
    {
      if (v17 >= 0) {
        unsigned int v19 = (unsigned __int16 *)a4;
      }
      else {
        unsigned int v19 = *(unsigned __int16 **)a4;
      }
      if (v15 >= 0) {
        unsigned int v20 = (unsigned __int16 *)a3;
      }
      else {
        unsigned int v20 = *(unsigned __int16 **)a3;
      }
      while (1)
      {
        unsigned int v21 = *v19;
        unsigned int v22 = *v20;
        if (v21 < v22) {
          break;
        }
        if (v22 < v21) {
          return;
        }
        ++v19;
        ++v20;
        if (!--v18) {
          goto LABEL_25;
        }
      }
    }
    else
    {
LABEL_25:
      if (v16 >= v14) {
        return;
      }
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a3, a4);
  unsigned int v10 = *(unsigned __int16 *)(a3 + 36);
  unsigned int v11 = *(unsigned __int16 *)(a2 + 36);
  if (v10 >= v11)
  {
    if (v10 > v11) {
      return;
    }
    unint64_t v23 = *(unsigned __int8 *)(a2 + 23);
    int v24 = (char)v23;
    if ((v23 & 0x80u) != 0) {
      unint64_t v23 = *(void *)(a2 + 8);
    }
    unint64_t v25 = *(unsigned __int8 *)(a3 + 23);
    int v26 = (char)v25;
    if ((v25 & 0x80u) != 0) {
      unint64_t v25 = *(void *)(a3 + 8);
    }
    if (v23 >= v25) {
      unint64_t v27 = v25;
    }
    else {
      unint64_t v27 = v23;
    }
    if (v27)
    {
      if (v26 >= 0) {
        unint64_t v28 = (unsigned __int16 *)a3;
      }
      else {
        unint64_t v28 = *(unsigned __int16 **)a3;
      }
      if (v24 >= 0) {
        unsigned int v29 = (unsigned __int16 *)a2;
      }
      else {
        unsigned int v29 = *(unsigned __int16 **)a2;
      }
      while (1)
      {
        unsigned int v30 = *v28;
        unsigned int v31 = *v29;
        if (v30 < v31) {
          break;
        }
        if (v31 < v30) {
          return;
        }
        ++v28;
        ++v29;
        if (!--v27) {
          goto LABEL_45;
        }
      }
    }
    else
    {
LABEL_45:
      if (v25 >= v23) {
        return;
      }
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a2, a3);
  unsigned int v12 = *(unsigned __int16 *)(a2 + 36);
  unsigned int v13 = a1[18];
  if (v12 >= v13)
  {
    if (v12 > v13) {
      return;
    }
    unint64_t v32 = *((unsigned __int8 *)a1 + 23);
    int v33 = (char)v32;
    if ((v32 & 0x80u) != 0) {
      unint64_t v32 = *((void *)a1 + 1);
    }
    unint64_t v34 = *(unsigned __int8 *)(a2 + 23);
    int v35 = (char)v34;
    if ((v34 & 0x80u) != 0) {
      unint64_t v34 = *(void *)(a2 + 8);
    }
    if (v32 >= v34) {
      unint64_t v36 = v34;
    }
    else {
      unint64_t v36 = v32;
    }
    if (v36)
    {
      if (v35 >= 0) {
        unint64_t v37 = (unsigned __int16 *)a2;
      }
      else {
        unint64_t v37 = *(unsigned __int16 **)a2;
      }
      if (v33 >= 0) {
        float v38 = a1;
      }
      else {
        float v38 = *(unsigned __int16 **)a1;
      }
      while (1)
      {
        unsigned int v39 = *v37;
        unsigned int v40 = *v38;
        if (v39 < v40) {
          break;
        }
        if (v40 < v39) {
          return;
        }
        ++v37;
        ++v38;
        if (!--v36) {
          goto LABEL_65;
        }
      }
    }
    else
    {
LABEL_65:
      if (v34 >= v32) {
        return;
      }
    }
  }

  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a1, a2);
}

void std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,0>(unsigned __int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(a1, a2, a3, a4);
  unsigned int v10 = *(unsigned __int16 *)(a5 + 36);
  unsigned int v11 = *(unsigned __int16 *)(a4 + 36);
  if (v10 >= v11)
  {
    if (v10 > v11) {
      return;
    }
    unint64_t v18 = *(unsigned __int8 *)(a4 + 23);
    int v19 = (char)v18;
    if ((v18 & 0x80u) != 0) {
      unint64_t v18 = *(void *)(a4 + 8);
    }
    unint64_t v20 = *(unsigned __int8 *)(a5 + 23);
    int v21 = (char)v20;
    if ((v20 & 0x80u) != 0) {
      unint64_t v20 = *(void *)(a5 + 8);
    }
    if (v18 >= v20) {
      unint64_t v22 = v20;
    }
    else {
      unint64_t v22 = v18;
    }
    if (v22)
    {
      if (v21 >= 0) {
        unint64_t v23 = (unsigned __int16 *)a5;
      }
      else {
        unint64_t v23 = *(unsigned __int16 **)a5;
      }
      if (v19 >= 0) {
        int v24 = (unsigned __int16 *)a4;
      }
      else {
        int v24 = *(unsigned __int16 **)a4;
      }
      while (1)
      {
        unsigned int v25 = *v23;
        unsigned int v26 = *v24;
        if (v25 < v26) {
          break;
        }
        if (v26 < v25) {
          return;
        }
        ++v23;
        ++v24;
        if (!--v22) {
          goto LABEL_26;
        }
      }
    }
    else
    {
LABEL_26:
      if (v20 >= v18) {
        return;
      }
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a4, a5);
  unsigned int v12 = *(unsigned __int16 *)(a4 + 36);
  unsigned int v13 = *(unsigned __int16 *)(a3 + 36);
  if (v12 >= v13)
  {
    if (v12 > v13) {
      return;
    }
    unint64_t v27 = *(unsigned __int8 *)(a3 + 23);
    int v28 = (char)v27;
    if ((v27 & 0x80u) != 0) {
      unint64_t v27 = *(void *)(a3 + 8);
    }
    unint64_t v29 = *(unsigned __int8 *)(a4 + 23);
    int v30 = (char)v29;
    if ((v29 & 0x80u) != 0) {
      unint64_t v29 = *(void *)(a4 + 8);
    }
    if (v27 >= v29) {
      unint64_t v31 = v29;
    }
    else {
      unint64_t v31 = v27;
    }
    if (v31)
    {
      if (v30 >= 0) {
        unint64_t v32 = (unsigned __int16 *)a4;
      }
      else {
        unint64_t v32 = *(unsigned __int16 **)a4;
      }
      if (v28 >= 0) {
        int v33 = (unsigned __int16 *)a3;
      }
      else {
        int v33 = *(unsigned __int16 **)a3;
      }
      while (1)
      {
        unsigned int v34 = *v32;
        unsigned int v35 = *v33;
        if (v34 < v35) {
          break;
        }
        if (v35 < v34) {
          return;
        }
        ++v32;
        ++v33;
        if (!--v31) {
          goto LABEL_46;
        }
      }
    }
    else
    {
LABEL_46:
      if (v29 >= v27) {
        return;
      }
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a3, a4);
  unsigned int v14 = *(unsigned __int16 *)(a3 + 36);
  unsigned int v15 = *(unsigned __int16 *)(a2 + 36);
  if (v14 >= v15)
  {
    if (v14 > v15) {
      return;
    }
    unint64_t v36 = *(unsigned __int8 *)(a2 + 23);
    int v37 = (char)v36;
    if ((v36 & 0x80u) != 0) {
      unint64_t v36 = *(void *)(a2 + 8);
    }
    unint64_t v38 = *(unsigned __int8 *)(a3 + 23);
    int v39 = (char)v38;
    if ((v38 & 0x80u) != 0) {
      unint64_t v38 = *(void *)(a3 + 8);
    }
    if (v36 >= v38) {
      unint64_t v40 = v38;
    }
    else {
      unint64_t v40 = v36;
    }
    if (v40)
    {
      if (v39 >= 0) {
        unsigned int v41 = (unsigned __int16 *)a3;
      }
      else {
        unsigned int v41 = *(unsigned __int16 **)a3;
      }
      if (v37 >= 0) {
        unint64_t v42 = (unsigned __int16 *)a2;
      }
      else {
        unint64_t v42 = *(unsigned __int16 **)a2;
      }
      while (1)
      {
        unsigned int v43 = *v41;
        unsigned int v44 = *v42;
        if (v43 < v44) {
          break;
        }
        if (v44 < v43) {
          return;
        }
        ++v41;
        ++v42;
        if (!--v40) {
          goto LABEL_66;
        }
      }
    }
    else
    {
LABEL_66:
      if (v38 >= v36) {
        return;
      }
    }
  }
  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a2, a3);
  unsigned int v16 = *(unsigned __int16 *)(a2 + 36);
  unsigned int v17 = a1[18];
  if (v16 >= v17)
  {
    if (v16 > v17) {
      return;
    }
    unint64_t v45 = *((unsigned __int8 *)a1 + 23);
    int v46 = (char)v45;
    if ((v45 & 0x80u) != 0) {
      unint64_t v45 = *((void *)a1 + 1);
    }
    unint64_t v47 = *(unsigned __int8 *)(a2 + 23);
    int v48 = (char)v47;
    if ((v47 & 0x80u) != 0) {
      unint64_t v47 = *(void *)(a2 + 8);
    }
    if (v45 >= v47) {
      unint64_t v49 = v47;
    }
    else {
      unint64_t v49 = v45;
    }
    if (v49)
    {
      if (v48 >= 0) {
        unsigned int v50 = (unsigned __int16 *)a2;
      }
      else {
        unsigned int v50 = *(unsigned __int16 **)a2;
      }
      if (v46 >= 0) {
        unint64_t v51 = a1;
      }
      else {
        unint64_t v51 = *(unsigned __int16 **)a1;
      }
      while (1)
      {
        unsigned int v52 = *v50;
        unsigned int v53 = *v51;
        if (v52 < v53) {
          break;
        }
        if (v53 < v52) {
          return;
        }
        ++v50;
        ++v51;
        if (!--v49) {
          goto LABEL_86;
        }
      }
    }
    else
    {
LABEL_86:
      if (v47 >= v45) {
        return;
      }
    }
  }

  std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a1, a2);
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(unsigned __int16 *a1, unsigned __int16 *a2)
{
  uint64_t v4 = ((char *)a2 - (char *)a1) >> 4;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      unsigned int v6 = (unsigned __int16 **)(a2 - 24);
      unsigned int v7 = *(a2 - 6);
      unsigned int v8 = a1[18];
      if (v7 < v8) {
        goto LABEL_3;
      }
      if (v7 > v8) {
        return result;
      }
      unint64_t v37 = *((unsigned __int8 *)a1 + 23);
      int v38 = (char)v37;
      if ((v37 & 0x80u) != 0) {
        unint64_t v37 = *((void *)a1 + 1);
      }
      unint64_t v39 = *((unsigned __int8 *)a2 - 25);
      int v40 = (char)v39;
      if ((v39 & 0x80u) != 0) {
        unint64_t v39 = *((void *)a2 - 5);
      }
      if (v37 >= v39) {
        unint64_t v41 = v39;
      }
      else {
        unint64_t v41 = v37;
      }
      if (!v41) {
        goto LABEL_83;
      }
      if (v40 >= 0) {
        unint64_t v42 = a2 - 24;
      }
      else {
        unint64_t v42 = *v6;
      }
      if (v38 >= 0) {
        unsigned int v43 = a1;
      }
      else {
        unsigned int v43 = *(unsigned __int16 **)a1;
      }
      do
      {
        unsigned int v44 = *v42;
        unsigned int v45 = *v43;
        if (v44 < v45) {
          goto LABEL_3;
        }
        if (v45 < v44) {
          return 1;
        }
        ++v42;
        ++v43;
        --v41;
      }
      while (v41);
LABEL_83:
      if (v39 < v37)
      {
LABEL_3:
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<skit::Token *&,skit::Token *&>((uint64_t *)a1, (uint64_t)v6);
        return 1;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(a1, (uint64_t)(a1 + 24), (uint64_t)(a2 - 24));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(a1, (uint64_t)(a1 + 24), (uint64_t)(a1 + 48), (uint64_t)(a2 - 24));
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *,0>(a1, (uint64_t)(a1 + 24), (uint64_t)(a1 + 48), (uint64_t)(a1 + 72), (uint64_t)(a2 - 24));
      return 1;
    default:
      unsigned int v9 = a1 + 48;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,skit::Analyzer::dedup(skit::TokenStream)::$_0 &,skit::Token *>(a1, (uint64_t)(a1 + 24), (uint64_t)(a1 + 48));
      unsigned int v10 = a1 + 72;
      if (a1 + 72 == a2) {
        return 1;
      }
      int v11 = 0;
      break;
  }
  while (1)
  {
    unsigned int v12 = v10[18];
    unsigned int v13 = v9[18];
    if (v12 < v13) {
      break;
    }
    if (v12 <= v13)
    {
      unint64_t v25 = *((unsigned __int8 *)v9 + 23);
      int v26 = (char)v25;
      if ((v25 & 0x80u) != 0) {
        unint64_t v25 = *((void *)v9 + 1);
      }
      unint64_t v27 = *((unsigned __int8 *)v10 + 23);
      int v28 = (char)v27;
      if ((v27 & 0x80u) != 0) {
        unint64_t v27 = *((void *)v10 + 1);
      }
      if (v25 >= v27) {
        unint64_t v29 = v27;
      }
      else {
        unint64_t v29 = v25;
      }
      if (v29)
      {
        if (v28 >= 0) {
          int v30 = v10;
        }
        else {
          int v30 = *(unsigned __int16 **)v10;
        }
        if (v26 >= 0) {
          unint64_t v31 = v9;
        }
        else {
          unint64_t v31 = *(unsigned __int16 **)v9;
        }
        do
        {
          unsigned int v32 = *v30;
          unsigned int v33 = *v31;
          if (v32 < v33) {
            goto LABEL_7;
          }
          if (v33 < v32) {
            goto LABEL_58;
          }
          ++v30;
          ++v31;
        }
        while (--v29);
      }
      if (v27 < v25) {
        break;
      }
    }
LABEL_58:
    unsigned int v9 = v10;
    v10 += 24;
    if (v10 == a2) {
      return 1;
    }
  }
LABEL_7:
  long long v46 = *(_OWORD *)v10;
  uint64_t v47 = *((void *)v10 + 2);
  *((void *)v10 + 1) = 0;
  *((void *)v10 + 2) = 0;
  *(void *)unsigned int v10 = 0;
  long long v48 = *(_OWORD *)(v10 + 12);
  unsigned int v14 = v10;
  uint64_t v49 = *((void *)v10 + 5);
  while (1)
  {
    unsigned int v15 = v9;
    if (*((char *)v14 + 23) < 0) {
      operator delete(*(void **)v14);
    }
    *(_OWORD *)unsigned int v14 = *(_OWORD *)v9;
    *((void *)v14 + 2) = *((void *)v9 + 2);
    *((unsigned char *)v9 + 23) = 0;
    *unsigned int v9 = 0;
    *(_OWORD *)(v14 + 12) = *(_OWORD *)(v9 + 12);
    *((void *)v14 + 5) = *((void *)v9 + 5);
    if (v9 == a1) {
      break;
    }
    v9 -= 24;
    unsigned int v16 = *(v15 - 6);
    unsigned int v14 = v15;
    if (WORD6(v48) >= v16)
    {
      if (WORD6(v48) > v16) {
        goto LABEL_53;
      }
      unint64_t v17 = *((unsigned __int8 *)v15 - 25);
      int v18 = (char)v17;
      if ((v17 & 0x80u) != 0) {
        unint64_t v17 = *((void *)v15 - 5);
      }
      unint64_t v19 = HIBYTE(v47);
      if (v47 < 0) {
        unint64_t v19 = *((void *)&v46 + 1);
      }
      if (v17 >= v19) {
        unint64_t v20 = v19;
      }
      else {
        unint64_t v20 = v17;
      }
      if (v20)
      {
        if (v47 >= 0) {
          int v21 = (unsigned __int16 *)&v46;
        }
        else {
          int v21 = (unsigned __int16 *)v46;
        }
        if (v18 >= 0) {
          unint64_t v22 = v15 - 24;
        }
        else {
          unint64_t v22 = *(unsigned __int16 **)v9;
        }
        while (1)
        {
          unsigned int v23 = *v21;
          unsigned int v24 = *v22;
          if (v23 < v24) {
            break;
          }
          if (v24 < v23) {
            goto LABEL_53;
          }
          ++v21;
          ++v22;
          if (!--v20) {
            goto LABEL_30;
          }
        }
        unsigned int v14 = v15;
      }
      else
      {
LABEL_30:
        unsigned int v14 = v15;
        if (v19 >= v17)
        {
LABEL_53:
          unsigned int v34 = v15;
          goto LABEL_55;
        }
      }
    }
  }
  unsigned int v34 = a1;
LABEL_55:
  if (*((char *)v34 + 23) < 0) {
    operator delete(*(void **)v34);
  }
  long long v35 = v46;
  *((void *)v34 + 2) = v47;
  *(_OWORD *)unsigned int v34 = v35;
  long long v36 = v48;
  *((void *)v15 + 5) = v49;
  *(_OWORD *)(v15 + 12) = v36;
  if (++v11 != 8) {
    goto LABEL_58;
  }
  return v10 + 24 == a2;
}

void *skit::ContextV2::ContextV2(void *a1, uint64_t a2, uint64_t *a3)
{
  return a1;
}

{
  std::allocate_shared[abi:ne180100]<skit::internal::ContextImpl,std::allocator<skit::internal::ContextImpl>,std::__fs::filesystem::path const&,std::basic_string<char16_t>,void>(a1, a2, a3);
  return a1;
}

double std::allocate_shared[abi:ne180100]<skit::internal::ContextImpl,std::allocator<skit::internal::ContextImpl>,std::__fs::filesystem::path const&,std::basic_string<char16_t>,void>(void *a1, uint64_t a2, uint64_t *a3)
{
  unsigned int v6 = (char *)operator new(0x90uLL);
  unsigned int v7 = v6;
  *(_OWORD *)(v6 + 8) = 0u;
  *(void *)unsigned int v6 = &unk_1F2A13238;
  unsigned int v8 = v6 + 24;
  uint64_t v9 = *a3;
  *(void *)unsigned int v12 = a3[1];
  *(void *)&v12[7] = *(uint64_t *)((char *)a3 + 15);
  char v10 = *((unsigned char *)a3 + 23);
  a3[2] = 0;
  *(_OWORD *)a3 = 0u;
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)v6 + 1, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    _OWORD *v8 = *(_OWORD *)a2;
    *((void *)v6 + 5) = *(void *)(a2 + 16);
  }
  *((_DWORD *)v7 + 12) = 0;
  *((void *)v7 + 7) = v9;
  *((void *)v7 + 8) = *(void *)v12;
  *(void *)(v7 + 71) = *(void *)&v12[7];
  v7[79] = v10;
  *((void *)v7 + 10) = 850045863;
  double result = 0.0;
  *(_OWORD *)(v7 + 88) = 0u;
  *(_OWORD *)(v7 + 104) = 0u;
  *(_OWORD *)(v7 + 120) = 0u;
  *((void *)v7 + 17) = 0;
  *a1 = v8;
  a1[1] = v7;
  return result;
}

void sub_1D2EF704C(_Unwind_Exception *a1)
{
  if (v3 < 0) {
    operator delete(v2);
  }
  std::__shared_weak_count::~__shared_weak_count(v1);
  operator delete(v5);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<skit::internal::ContextImpl>::__on_zero_shared(uint64_t a1)
{
  std::mutex::~mutex((std::mutex *)(a1 + 80));
  if (*(char *)(a1 + 79) < 0) {
    operator delete(*(void **)(a1 + 56));
  }
  if (*(char *)(a1 + 47) < 0)
  {
    uint64_t v2 = *(void **)(a1 + 24);
    operator delete(v2);
  }
}

void std::__shared_ptr_emplace<skit::internal::ContextImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2A13238;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1D942C720);
}

void std::__shared_ptr_emplace<skit::internal::ContextImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2A13238;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void skit::ContextV2::~ContextV2(skit::ContextV2 *this)
{
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;

  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

BOOL skit::ContextV2::is_initialized(skit::ContextV2 *this)
{
  return *(void *)this != 0;
}

__n128 skit::ContextV2::index_reader@<Q0>(long long **a1@<X0>, unint64_t a2@<X1>, unint64_t a3@<X2>, void *a4@<X8>)
{
  *a4 = 0;
  a4[1] = 0;
  uint64_t v5 = *a1;
  if (*a1)
  {
    if (*((char *)v5 + 55) < 0)
    {
      unint64_t v6 = *((void *)v5 + 4);
      unint64_t v7 = *((void *)v5 + 5);
    }
    else
    {
      unint64_t v6 = (unint64_t)(v5 + 2);
      unint64_t v7 = *((unsigned __int8 *)v5 + 55);
    }
    v15[0] = v6;
    v15[1] = v7;
    v14[0] = a2;
    v14[1] = a3;
    if (*((char *)v5 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)v5, *((void *)v5 + 1));
    }
    else
    {
      long long v8 = *v5;
      v13.__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
      *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v8;
    }
    std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v13, v15);
    std::string::append(&v13, ".ctx", 4uLL);
    std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v13, v14);
    std::string::append(&v13, ".idx", 4uLL);
    std::string __p = v13;
    memset(&v13, 0, sizeof(v13));
    std::allocate_shared[abi:ne180100]<skit::internal::IndexReaderImpl,std::allocator<skit::internal::IndexReaderImpl>,std::__fs::filesystem::path,void>(&v11, (uint64_t)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v13.__r_.__value_.__l.__data_);
    }
    long long v9 = v11;
    long long v11 = 0uLL;
    *(_OWORD *)a4 = v9;
    skit::IndexReader::~IndexReader((skit::IndexReader *)&v11);
  }
  return result;
}

void sub_1D2EF72F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23)
{
  skit::IndexReader::~IndexReader(v23);
  _Unwind_Resume(a1);
}

long long **skit::ContextV2::index_writer@<X0>(long long **result@<X0>, uint64_t a2@<X1>, std::string::size_type a3@<X2>, void *a4@<X8>)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  *a4 = 0;
  uint64_t v4 = *result;
  if (*result)
  {
    if (*((char *)v4 + 55) < 0)
    {
      unint64_t v7 = *((void *)v4 + 4);
      unint64_t v8 = *((void *)v4 + 5);
    }
    else
    {
      unint64_t v7 = (unint64_t)(v4 + 2);
      unint64_t v8 = *((unsigned __int8 *)v4 + 55);
    }
    v46[0] = v7;
    v46[1] = v8;
    v45[0] = a2;
    v45[1] = a3;
    std::mutex::lock((std::mutex *)((char *)v4 + 56));
    *(void *)&long long v52 = v7;
    *((void *)&v52 + 1) = v8;
    *(void *)uuid_t out = a2;
    *(void *)&out[8] = a3;
    if (*((char *)v4 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v48, *(const std::string::value_type **)v4, *((void *)v4 + 1));
    }
    else
    {
      long long v9 = *v4;
      v48.__r_.__value_.__r.__words[2] = *((void *)v4 + 2);
      *(_OWORD *)&v48.__r_.__value_.__l.__data_ = v9;
    }
    std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v48, (unint64_t *)&v52);
    std::__fs::filesystem::_PathCVT<char16_t>::__append_range[abi:ne180100](&v48, (unint64_t)".", (unint64_t)L"");
    if (*((_DWORD *)v4 + 6)) {
      goto LABEL_9;
    }
    memset(&v50, 0, sizeof(v50));
    if (*((char *)v4 + 23) >= 0) {
      int v18 = (const char *)v4;
    }
    else {
      int v18 = *(const char **)v4;
    }
    if (stat(v18, &v50))
    {
      if (skit::internal::get_logging_context(void)::once != -1) {
      long long v35 = skit::internal::get_logging_context(void)::logger;
      }
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        int v38 = *((char *)v4 + 23);
        unint64_t v39 = *(const std::string::value_type **)v4;
        int v40 = __error();
        if (v38 >= 0) {
          unint64_t v41 = (const std::string::value_type *)v4;
        }
        else {
          unint64_t v41 = v39;
        }
        int v42 = *v40;
        *(_DWORD *)uint64_t v49 = 136446466;
        *(void *)&v49[4] = v41;
        *(_WORD *)&v49[12] = 1024;
        *(_DWORD *)&v49[14] = v42;
        _os_log_error_impl(&dword_1D2EDA000, v35, OS_LOG_TYPE_ERROR, "ContextImpl::make_path : stat failed for context parent directory @ %{public}s : %{darwin.errno}d", v49, 0x12u);
      }
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
      {
        *v48.__r_.__value_.__l.__data_ = 0;
        v48.__r_.__value_.__l.__size_ = 0;
      }
      else
      {
        v48.__r_.__value_.__s.__data_[0] = 0;
        *((unsigned char *)&v48.__r_.__value_.__s + 23) = 0;
      }
      goto LABEL_65;
    }
    if ((v50.st_mode & 0x4000) == 0)
    {
      if (skit::internal::get_logging_context(void)::once != -1) {
      uint64_t v36 = skit::internal::get_logging_context(void)::logger;
      }
      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_65;
      }
      if (*((char *)v4 + 23) >= 0) {
        unint64_t v37 = (const std::string::value_type *)v4;
      }
      else {
        unint64_t v37 = *(const std::string::value_type **)v4;
      }
      *(_DWORD *)uint64_t v49 = 136446210;
      *(void *)&v49[4] = v37;
      int v28 = "ContextImpl::make_path : parent path is not a directory %{public}s";
      unsigned int v32 = v49;
      unsigned int v33 = v36;
      uint32_t v34 = 12;
      goto LABEL_80;
    }
    *((_DWORD *)v4 + 6) = v50.st_mode & 0x1FF;
    if (skit::internal::get_logging_context(void)::once != -1) {
    unint64_t v19 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
    {
      unint64_t v20 = &v48;
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        unint64_t v20 = (std::string *)v48.__r_.__value_.__r.__words[0];
      }
      v50.st_dev = 136446210;
      *(void *)&v50.st_mode = v20;
      _os_log_impl(&dword_1D2EDA000, v19, OS_LOG_TYPE_INFO, "ContextImpl::make_path : Creating context dir %{public}s", (uint8_t *)&v50, 0xCu);
    }
    int v21 = (v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
        ? &v48
        : (std::string *)v48.__r_.__value_.__r.__words[0];
    if (!mkdir((const char *)v21, *((_WORD *)v4 + 12)) || *__error() == 17)
    {
LABEL_9:
      std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v48, (unint64_t *)out);
      std::__fs::filesystem::_PathCVT<char16_t>::__append_range[abi:ne180100](&v48, (unint64_t)L".idx", (unint64_t)L"");
      std::__fs::filesystem::__status((const std::__fs::filesystem::path *)&v48, 0);
      if (v47 == 2
        || ((*(_DWORD *)uint64_t v49 = 0,
             *(void *)&v49[8] = std::system_category(),
             directories = std::__fs::filesystem::__create_directories((const std::__fs::filesystem::path *)&v48, (std::error_code *)v49), !*(_DWORD *)v49)? (BOOL v11 = directories): (BOOL v11 = 0), v11))
      {
        if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&v43, v48.__r_.__value_.__l.__data_, v48.__r_.__value_.__l.__size_);
        }
        else {
          std::string v43 = v48;
        }
        int v12 = 0;
        int v44 = 0;
LABEL_18:
        if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v48.__r_.__value_.__l.__data_);
        }
        memset(out, 0, sizeof(out));
        uuid_generate_random(out);
        if (*((char *)v4 + 23) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&v50, *(const std::string::value_type **)v4, *((void *)v4 + 1));
        }
        else
        {
          long long v13 = *v4;
          *(void *)&v50.st_uid = *((void *)v4 + 2);
          *(_OWORD *)&v50.st_dev = v13;
        }
        std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v50, v46);
        std::string::append((std::string *)&v50, ".ctx", 4uLL);
        std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v50, v45);
        std::string::push_back((std::string *)&v50, 95);
        unsigned int v14 = (char *)operator new(0x28uLL);
        v48.__r_.__value_.__r.__words[0] = (std::string::size_type)v14;
        *(_OWORD *)&v48.__r_.__value_.__r.__words[1] = xmmword_1D2F00780;
        strcpy(v14, "00000000-0000-0000-0000-000000000000");
        uuid_unparse_lower(out, v14);
        if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          unsigned int v15 = &v48;
        }
        else {
          unsigned int v15 = (std::string *)v48.__r_.__value_.__r.__words[0];
        }
        if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v48.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v48.__r_.__value_.__l.__size_;
        }
        std::string::append((std::string *)&v50, (const std::string::value_type *)v15, size);
        if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v48.__r_.__value_.__l.__data_);
        }
        std::string::append((std::string *)&v50, ".idx.txn", 8uLL);
        if (v12)
        {
          if (skit::internal::get_logging_context(void)::once != -1) {
          unint64_t v29 = skit::internal::get_logging_context(void)::logger;
          }
          if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
          {
            memset(&v48, 0, sizeof(v48));
            skit::to_string(&v48, a2, a3);
            int v30 = (v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
                ? &v48
                : (std::string *)v48.__r_.__value_.__r.__words[0];
            *(_DWORD *)uint64_t v49 = 136446210;
            *(void *)&v49[4] = v30;
            _os_log_error_impl(&dword_1D2EDA000, v29, OS_LOG_TYPE_ERROR, "ContextImpl::index_writer : failed to create index path(s) for %{public}s index writer", v49, 0xCu);
            if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(v48.__r_.__value_.__l.__data_);
            }
          }
          if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
          {
            *v43.__r_.__value_.__l.__data_ = 0;
            v43.__r_.__value_.__l.__size_ = 0;
          }
          else
          {
            v43.__r_.__value_.__s.__data_[0] = 0;
            *((unsigned char *)&v43.__r_.__value_.__s + 23) = 0;
          }
          if (SHIBYTE(v50.st_gid) < 0)
          {
            **(unsigned char **)&v50.st_dev = 0;
            v50.st_ino = 0;
          }
          else
          {
            LOBYTE(v50.st_dev) = 0;
            HIBYTE(v50.st_gid) = 0;
          }
          long long v17 = 0uLL;
          *(_OWORD *)uuid_t out = 0u;
        }
        else
        {
          long long v17 = *(_OWORD *)out;
        }
        std::string v48 = v43;
        memset(&v43, 0, sizeof(v43));
        *(_OWORD *)uint64_t v49 = *(_OWORD *)&v50.st_dev;
        *(void *)&v49[16] = *(void *)&v50.st_uid;
        memset(&v50, 0, 24);
        long long v52 = v17;
        std::make_unique[abi:ne180100]<skit::internal::IndexWriterImpl,skit::Uuid,std::__fs::filesystem::path,std::__fs::filesystem::path>();
      }
      if (skit::internal::get_logging_context(void)::once != -1) {
      uint64_t v22 = skit::internal::get_logging_context(void)::logger;
      }
      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
LABEL_65:
        memset(&v43, 0, sizeof(v43));
        int v12 = -1;
        int v44 = -1;
        goto LABEL_18;
      }
      unint64_t v31 = &v48;
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        unint64_t v31 = (std::string *)v48.__r_.__value_.__r.__words[0];
      }
      v50.st_dev = 136446466;
      *(void *)&v50.st_mode = v31;
      WORD2(v50.st_ino) = 1024;
      *(_DWORD *)((char *)&v50.st_ino + 6) = *(_DWORD *)v49;
      int v28 = "ContextImpl::make_pth : mkdir for component failed @ %{public}s : %{darwin.errno}d";
    }
    else
    {
      if (skit::internal::get_logging_context(void)::once != -1) {
      uint64_t v22 = skit::internal::get_logging_context(void)::logger;
      }
      if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
        goto LABEL_65;
      }
      int v23 = SHIBYTE(v48.__r_.__value_.__r.__words[2]);
      std::string::size_type v24 = v48.__r_.__value_.__r.__words[0];
      unint64_t v25 = __error();
      int v26 = &v48;
      int v27 = *v25;
      if (v23 < 0) {
        int v26 = (std::string *)v24;
      }
      v50.st_dev = 136446466;
      *(void *)&v50.st_mode = v26;
      WORD2(v50.st_ino) = 1024;
      *(_DWORD *)((char *)&v50.st_ino + 6) = v27;
      int v28 = "ContextImpl::make_path : mkdir for context directory failed @ %{public}s : %{darwin.errno}d";
    }
    unsigned int v32 = (uint8_t *)&v50;
    unsigned int v33 = v22;
    uint32_t v34 = 18;
LABEL_80:
    _os_log_error_impl(&dword_1D2EDA000, v33, OS_LOG_TYPE_ERROR, v28, v32, v34);
    goto LABEL_65;
  }
  return result;
}

void sub_1D2EF7B54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43)
{
  if (a29 < 0) {
    operator delete(__p);
  }
  std::mutex::unlock(v44);
  skit::IndexWriter::~IndexWriter(v43);
  _Unwind_Resume(a1);
}

BOOL skit::ContextV2::index_exists(long long **a1, unint64_t a2, unint64_t a3)
{
  int v3 = *a1;
  if (!*a1) {
    return 0;
  }
  if (*((char *)v3 + 55) < 0)
  {
    unint64_t v4 = *((void *)v3 + 4);
    unint64_t v5 = *((void *)v3 + 5);
  }
  else
  {
    unint64_t v4 = (unint64_t)(v3 + 2);
    unint64_t v5 = *((unsigned __int8 *)v3 + 55);
  }
  v12[0] = v4;
  v12[1] = v5;
  v11[0] = a2;
  v11[1] = a3;
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v3, *((void *)v3 + 1));
  }
  else
  {
    long long v7 = *v3;
    __p.__r_.__value_.__r.__words[2] = *((void *)v3 + 2);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v7;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&__p, v12);
  std::string::append(&__p, ".ctx", 4uLL);
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&__p, v11);
  std::string::append(&__p, ".idx", 4uLL);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  int v9 = access((const char *)p_p, 0);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  return v9 == 0;
}

void sub_1D2EF7D0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t skit::ContextV2::index_rename(long long **a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = *a1;
  if (!*a1) {
    return 0xFFFFFFFFLL;
  }
  if (*((char *)v5 + 55) < 0)
  {
    unint64_t v6 = *((void *)v5 + 4);
    unint64_t v7 = *((void *)v5 + 5);
  }
  else
  {
    unint64_t v6 = (unint64_t)(v5 + 2);
    unint64_t v7 = *((unsigned __int8 *)v5 + 55);
  }
  v30[0] = v6;
  v30[1] = v7;
  v29[0] = a2;
  v29[1] = a3;
  v28[0] = a4;
  v28[1] = a5;
  if (*((char *)v5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)v5, *((void *)v5 + 1));
  }
  else
  {
    long long v9 = *v5;
    v27.__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
    *(_OWORD *)&v27.__r_.__value_.__l.__data_ = v9;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v27, v30);
  std::string::append(&v27, ".ctx", 4uLL);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v27.__r_.__value_.__l.__data_, v27.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v27;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v27, v28);
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&__p, v29);
  std::string::append(&v27, ".idx", 4uLL);
  std::string::append(&__p, ".idx", 4uLL);
  char v10 = (std::mutex *)((char *)v5 + 56);
  std::mutex::lock(v10);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = (const std::__fs::filesystem::path *)&__p;
  }
  else {
    p_p = (const std::__fs::filesystem::path *)__p.__r_.__value_.__r.__words[0];
  }
  if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    long long v13 = (const std::__fs::filesystem::path *)&v27;
  }
  else {
    long long v13 = (const std::__fs::filesystem::path *)v27.__r_.__value_.__r.__words[0];
  }
  rename(p_p, v13, v11);
  int v15 = v14;
  std::mutex::unlock(v10);
  if (v15)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    long long v17 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      int v18 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      std::string::size_type v19 = __p.__r_.__value_.__r.__words[0];
      int v20 = SHIBYTE(v27.__r_.__value_.__r.__words[2]);
      std::string::size_type v21 = v27.__r_.__value_.__r.__words[0];
      uint64_t v22 = __error();
      int v23 = &v27;
      int v24 = *v22;
      if (v20 < 0) {
        int v23 = (std::string *)v21;
      }
      *(_DWORD *)std::string buf = 136446722;
      unint64_t v25 = &__p;
      if (v18 < 0) {
        unint64_t v25 = (std::string *)v19;
      }
      unsigned int v32 = v25;
      __int16 v33 = 2082;
      uint32_t v34 = v23;
      __int16 v35 = 1024;
      int v36 = v24;
      _os_log_error_impl(&dword_1D2EDA000, v17, OS_LOG_TYPE_ERROR, "ContextImpl::rename_index : unable to rename index @  %{public}s  --->  %{public}s : %{darwin.errno}d", buf, 0x1Cu);
    }
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }
  return v8;
}

void sub_1D2EF7FB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

uint64_t skit::ContextV2::index_remove(long long **a1, uint64_t a2, std::string::size_type a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  int v3 = *a1;
  if (!*a1) {
    return 0xFFFFFFFFLL;
  }
  if (*((char *)v3 + 55) < 0)
  {
    unint64_t v6 = *((void *)v3 + 4);
    unint64_t v7 = *((void *)v3 + 5);
  }
  else
  {
    unint64_t v6 = (unint64_t)(v3 + 2);
    unint64_t v7 = *((unsigned __int8 *)v3 + 55);
  }
  v26[0] = v6;
  v26[1] = v7;
  v25[0] = a2;
  v25[1] = a3;
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)v3, *((void *)v3 + 1));
  }
  else
  {
    long long v9 = *v3;
    v24.__r_.__value_.__r.__words[2] = *((void *)v3 + 2);
    *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v9;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v24, v26);
  std::string::append(&v24, ".ctx", 4uLL);
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v24, v25);
  std::string::append(&v24, ".idx", 4uLL);
  char v10 = (std::mutex *)((char *)v3 + 56);
  std::mutex::lock(v10);
  if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v12 = (const std::__fs::filesystem::path *)&v24;
  }
  else {
    int v12 = (const std::__fs::filesystem::path *)v24.__r_.__value_.__r.__words[0];
  }
  if (skit::internal::remove_all(v12, v11) && *__error() != 2)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    int v14 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      memset(&__p, 0, sizeof(__p));
      skit::to_string(&__p, a2, a3);
      int v15 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      std::string::size_type v16 = __p.__r_.__value_.__r.__words[0];
      int v17 = SHIBYTE(v24.__r_.__value_.__r.__words[2]);
      std::string::size_type v18 = v24.__r_.__value_.__r.__words[0];
      std::string::size_type v19 = __error();
      int v20 = &v24;
      int v21 = *v19;
      if (v17 < 0) {
        int v20 = (std::string *)v18;
      }
      *(_DWORD *)std::string buf = 136446722;
      p_p = &__p;
      if (v15 < 0) {
        p_p = (std::string *)v16;
      }
      int v28 = p_p;
      __int16 v29 = 2082;
      int v30 = v20;
      __int16 v31 = 1024;
      int v32 = v21;
      _os_log_error_impl(&dword_1D2EDA000, v14, OS_LOG_TYPE_ERROR, "Context::remove_index : failed to remove index %{public}s @ %{public}s : %{darwin.errno}d", buf, 0x1Cu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    uint64_t v8 = 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v8 = 0;
  }
  std::mutex::unlock(v10);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  return v8;
}

void sub_1D2EF8254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::mutex::unlock(v21);
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(a1);
}

uint64_t skit::ContextV2::cleanup(long long **this)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *this;
  if (!*this) {
    return 0xFFFFFFFFLL;
  }
  if (*((char *)v1 + 55) < 0)
  {
    unint64_t v2 = *((void *)v1 + 4);
    unint64_t v3 = *((void *)v1 + 5);
  }
  else
  {
    unint64_t v2 = (unint64_t)(v1 + 2);
    unint64_t v3 = *((unsigned __int8 *)v1 + 55);
  }
  v35[0] = v2;
  v35[1] = v3;
  if (*((char *)v1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)v1, *((void *)v1 + 1));
  }
  else
  {
    long long v5 = *v1;
    v34.__r_.__value_.__r.__words[2] = *((void *)v1 + 2);
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v5;
  }
  std::__fs::filesystem::path::append[abi:ne180100]<std::u16string_view>((std::__fs::filesystem::path *)&v34, v35);
  std::string::append(&v34, ".ctx", 4uLL);
  unint64_t v6 = (std::mutex *)((char *)v1 + 56);
  std::mutex::lock(v6);
  v33.__val_ = 0;
  v33.__cat_ = std::system_category();
  MEMORY[0x1D942C640](&v31, &v34, &v33, 2);
  if (!v33.__val_)
  {
    std::__fs::filesystem::path::path[abi:ne180100]<char [5],void>(&__p, (std::string *)".txn");
    memset(buf, 0, sizeof(buf));
    unint64_t v7 = v31;
    uint64_t v8 = v32;
    if (v32)
    {
      atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
      long long v9 = v32;
      v29.__imp_.__ptr_ = v7;
      v29.__imp_.__cntrl_ = v8;
      if (v32)
      {
        atomic_fetch_add_explicit(&v32->__shared_owners_, 1uLL, memory_order_relaxed);
        std::__shared_weak_count::__release_shared[abi:ne180100](v9);
      }
    }
    else
    {
      v29.__imp_.__ptr_ = v31;
      v29.__imp_.__cntrl_ = 0;
    }
    uint64_t v4 = 0;
    while (1)
    {
      if (!v29.__imp_.__ptr_)
      {
        if (v29.__imp_.__cntrl_) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v29.__imp_.__cntrl_);
        }
        v36.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)buf;
        std::vector<std::__fs::filesystem::path>::__destroy_vector::operator()[abi:ne180100]((void ***)&v36);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        goto LABEL_47;
      }
      char v10 = (const std::__fs::filesystem::path *)std::__fs::filesystem::directory_iterator::__dereference(&v29);
      BOOL v11 = (std::__fs::filesystem::path *)v10;
      if (((1 << v10[3].__pn_.__r_.__value_.__s.__data_[1]) & 0x13) != 0)
      {
        std::__fs::filesystem::__status(v10, 0);
        int v12 = v36.__pn_.__r_.__value_.__s.__data_[0];
      }
      else
      {
        int v12 = v10[3].__pn_.__r_.__value_.__s.__data_[0];
      }
      if (v12 == 2)
      {
        std::__fs::filesystem::path::extension[abi:ne180100]((uint64_t)&v36, v11);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v13.__data_ = (const std::string_view::value_type *)&__p;
        }
        else {
          v13.__data_ = (const std::string_view::value_type *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          v13.__size_ = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          v13.__size_ = __p.__r_.__value_.__l.__size_;
        }
        int v14 = std::__fs::filesystem::path::__compare(&v36, v13);
        int v16 = v14;
        if (SHIBYTE(v36.__pn_.__r_.__value_.__r.__words[2]) < 0)
        {
          operator delete(v36.__pn_.__r_.__value_.__l.__data_);
          if (v16) {
            goto LABEL_35;
          }
        }
        else if (v14)
        {
          goto LABEL_35;
        }
        if ((v11->__pn_.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          int v17 = v11;
        }
        else {
          int v17 = (const std::__fs::filesystem::path *)v11->__pn_.__r_.__value_.__r.__words[0];
        }
        if (skit::internal::remove_all(v17, v15) && *__error() != 2)
        {
          if (skit::internal::get_logging_context(void)::once != -1) {
          std::string::size_type v18 = skit::internal::get_logging_context(void)::logger;
          }
          if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
          {
            int v19 = SHIBYTE(v11->__pn_.__r_.__value_.__r.__words[2]);
            std::string::size_type v28 = v11->__pn_.__r_.__value_.__r.__words[0];
            int v20 = *__error();
            std::string::size_type v21 = v28;
            if (v19 >= 0) {
              std::string::size_type v21 = (std::string::size_type)v11;
            }
            LODWORD(v36.__pn_.__r_.__value_.__l.__data_) = 136446466;
            *(std::string::size_type *)((char *)v36.__pn_.__r_.__value_.__r.__words + 4) = v21;
            WORD2(v36.__pn_.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&v36.__pn_.__r_.__value_.__r.__words[1] + 6) = v20;
            _os_log_error_impl(&dword_1D2EDA000, v18, OS_LOG_TYPE_ERROR, "ContextImpl::cleanup : failed to remove transaction directory @ %{public}s : %{darwin.errno}d", (uint8_t *)&v36, 0x12u);
          }
          uint64_t v4 = 0xFFFFFFFFLL;
        }
      }
LABEL_35:
      std::__fs::filesystem::directory_iterator::__increment(&v29, 0);
    }
  }
  if (skit::internal::get_logging_context(void)::once != -1) {
  int v23 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    int v24 = SHIBYTE(v34.__r_.__value_.__r.__words[2]);
    std::string::size_type v25 = v34.__r_.__value_.__r.__words[0];
    std::error_code::message(&__p, &v33);
    int v26 = &v34;
    if (v24 < 0) {
      int v26 = (std::string *)v25;
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      p_p = &__p;
    }
    else {
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    *(_DWORD *)std::string buf = 136446466;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = p_p;
    _os_log_error_impl(&dword_1D2EDA000, v23, OS_LOG_TYPE_ERROR, "ContextImpl::cleanup : failed to construct directory iterator %{public}s : %{public}s", buf, 0x16u);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  uint64_t v4 = 0xFFFFFFFFLL;
LABEL_47:
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  std::mutex::unlock(v6);
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
  return v4;
}

void sub_1D2EF86F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,std::__shared_weak_count *a23,uint64_t a24,uint64_t a25,void *__p,uint64_t a27,int a28,__int16 a29,char a30,char a31)
{
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }
  std::mutex::unlock(v31);
  if (a31 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

_DWORD *skit::Document::Document(_DWORD *a1, _OWORD *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)a1 = *a2;
  uint64_t v3 = *(void *)a1;
  if (!*(void *)a1)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v9 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    LOWORD(v18) = 0;
    char v10 = "initialized with an empty buffer";
    goto LABEL_16;
  }
  unsigned int v4 = a1[2];
  if (v4 <= 0x17)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v13 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v14 = a1[2];
    int v18 = 67109120;
    int v19 = v14;
    char v10 = "buffer too small, %u bytes";
    BOOL v11 = v13;
    uint32_t v12 = 8;
    goto LABEL_17;
  }
  uint64_t v5 = *(unsigned int *)(v3 + 20);
  if (v5 + 24 != v4)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v15 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v16 = *(_DWORD *)(*(void *)a1 + 20) + 24;
    int v17 = a1[2];
    int v18 = 67109376;
    int v19 = v16;
    __int16 v20 = 1024;
    int v21 = v17;
    char v10 = "buffer size mismatch, %u != %u";
    BOOL v11 = v15;
    uint32_t v12 = 14;
LABEL_17:
    _os_log_error_impl(&dword_1D2EDA000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v18, v12);
LABEL_14:
    *(void *)a1 = &skit::Document::empty_doc;
    a1[2] = 24;
    return a1;
  }
  if (v5)
  {
    unint64_t v6 = v3 + 24;
    unint64_t v7 = v3 + 24 + v5;
    while (v6 <= v7)
    {
      if (v6) {
        v6 += *(unsigned __int16 *)(v6 + 2) + 4;
      }
      if (v6 == v7) {
        return a1;
      }
    }
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v9 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    LOWORD(v18) = 0;
    char v10 = "buffer iterator bounds check failed";
LABEL_16:
    BOOL v11 = v9;
    uint32_t v12 = 2;
    goto LABEL_17;
  }
  return a1;
}

uint64_t skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::AliasSpanMatchImpl(uint64_t a1, long long *a2, size_t a3)
{
  long long v6 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v6;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  uint64_t v7 = *((void *)a2 + 3);
  *(_WORD *)(a1 + 32) = *((_WORD *)a2 + 16);
  *(void *)(a1 + 24) = v7;
  long long v8 = *(_OWORD *)a3;
  *(_OWORD *)(a1 + 52) = *(_OWORD *)(a3 + 12);
  *(_OWORD *)(a1 + 40) = v8;
  skit::SmallVector<skit::GroupId,4u,true>::move(a1 + 72, a3 + 32);
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a3 + 56);
  skit::SpanMatchV3::append_alias_id(a3, *((_WORD *)a2 + 16), *((_DWORD *)a2 + 7) - *((_DWORD *)a2 + 6));
  return a1;
}

void sub_1D2EF8B08(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)(v1 + 72);
  if (v3 != (void *)(v1 + 88)) {
    free(v3);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL skit::EmojiFilter::filter(uint64_t a1, unsigned __int16 *a2, unint64_t a3)
{
  if ((int)a3 >= 1)
  {
    int v3 = 0;
    while (1)
    {
      uint64_t v4 = v3 + 1;
      unsigned int v5 = a2[v3];
      if ((v5 & 0xFC00) != 0xD800 || v4 == a3)
      {
        ++v3;
      }
      else
      {
        int v7 = a2[v4];
        int v8 = v7 & 0xFC00;
        v3 += 2;
        int v9 = v7 + (v5 << 10) - 56613888;
        if (v8 == 56320) {
          unsigned int v5 = v9;
        }
        else {
          int v3 = v4;
        }
      }
      if (v5 - 48 <= 9) {
        break;
      }
      if (v5 >> 4 >= 0x20D)
      {
        if (a3 < 3)
        {
          if (a3 == 2 && (v5 == 8505 || v5 - 9398 <= 0x33))
          {
            if (*a2 != (unsigned __int16)v5) {
              return 0;
            }
            int v11 = a2[1] & 0xFFFE;
            int v12 = 65038;
            return v11 == v12;
          }
        }
        else
        {
          BOOL result = 0;
          if (v5 - 127344 <= 0xF && ((1 << (v5 - 112)) & 0xC003) != 0 || v5 == 8505) {
            return result;
          }
          if (v5 - 9398 < 0x34) {
            return 0;
          }
        }
        BOOL result = 1;
        if (v5 < 0x2E7F || v5 == 65039 || v5 - 126976 < 0xB00) {
          return result;
        }
      }
      if (v3 >= (int)a3) {
        return 0;
      }
    }
    if (a3 == 3 && *a2 == (unsigned __int16)v5 && (__int16)a2[1] == -497)
    {
      int v11 = a2[2];
      int v12 = 8419;
      return v11 == v12;
    }
  }
  return 0;
}

void non-virtual thunk to'skit::EmojiFilter::~EmojiFilter(skit::EmojiFilter *this)
{
}

void skit::EmojiFilter::filter(skit::EmojiFilter *this, skit::TokenStream *a2, unint64_t a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 4);
  uint64_t v4 = v3 - a3;
  if (v3 > a3)
  {
    uint64_t v7 = 48 * a3;
    do
    {
      skit::EmojiFilter::filter((uint64_t)this, (unsigned __int16 *)(*(void *)a2 + v7));
      v7 += 48;
      --v4;
    }
    while (v4);
  }
}

float skit::EmojiFilter::filter(uint64_t a1, unsigned __int16 *a2)
{
  unint64_t v2 = (float *)a2;
  unint64_t v4 = *((void *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    unint64_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(unsigned __int16 **)a2;
    unint64_t v5 = v4;
  }
  if (skit::EmojiFilter::filter(a1, a2, v5))
  {
    float result = *(float *)(a1 + 16) * v2[8];
    v2[8] = result;
    *((_WORD *)v2 + 20) = (*((_WORD *)v2 + 20) | *(_WORD *)(a1 + 20) & 4) & (~*(_WORD *)(a1 + 20) | 0xFFFE);
  }
  return result;
}

void skit::EmojiFilter::~EmojiFilter(skit::EmojiFilter *this)
{
}

void skit::FieldBundle::add(uint64_t a1, __int16 a2, uint64_t a3, unsigned int a4, int a5)
{
  if (a5) {
    operator new[]();
  }
  unint64_t v9 = *(void *)(a1 + 32);
  unint64_t v10 = *(void *)(a1 + 40);
  if (v9 >= v10)
  {
    uint64_t v13 = *(void *)(a1 + 24);
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - v13) >> 3);
    unint64_t v15 = v14 + 1;
    if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - v13) >> 3);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v15;
    }
    int v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::FieldBundle::FieldData>>(v17);
    int v19 = &v18[24 * v14];
    int v21 = &v18[24 * v20];
    if (a4 >= 0x200) {
      int v22 = 512;
    }
    else {
      int v22 = a4;
    }
    *(_WORD *)int v19 = a2;
    *((_WORD *)v19 + 1) = v22;
    *((void *)v19 + 1) = a3;
    *((_DWORD *)v19 + 4) = v22;
    int v12 = v19 + 24;
    int v24 = *(char **)(a1 + 24);
    int v23 = *(char **)(a1 + 32);
    if (v23 != v24)
    {
      do
      {
        long long v25 = *(_OWORD *)(v23 - 24);
        *((void *)v19 - 1) = *((void *)v23 - 1);
        *(_OWORD *)(v19 - 24) = v25;
        v19 -= 24;
        v23 -= 24;
      }
      while (v23 != v24);
      int v23 = *(char **)(a1 + 24);
    }
    *(void *)(a1 + 24) = v19;
    *(void *)(a1 + 32) = v12;
    *(void *)(a1 + 40) = v21;
    if (v23) {
      operator delete(v23);
    }
  }
  else
  {
    *(_WORD *)unint64_t v9 = a2;
    if (a4 >= 0x200) {
      int v11 = 512;
    }
    else {
      int v11 = a4;
    }
    *(_WORD *)(v9 + 2) = v11;
    *(void *)(v9 + 8) = a3;
    *(_DWORD *)(v9 + 16) = v11;
    int v12 = (char *)(v9 + 24);
  }
  *(void *)(a1 + 32) = v12;
  int v26 = a4 + *(_DWORD *)(a1 + 20) + 4;
  ++*(_DWORD *)(a1 + 16);
  *(_DWORD *)(a1 + 20) = v26;
}

void sub_1D2EF9004(_Unwind_Exception *a1)
{
  MEMORY[0x1D942C700](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void *std::vector<std::unique_ptr<std::byte []>>::__swap_out_circular_buffer(void *result, void *a2)
{
  unint64_t v3 = (void *)*result;
  unint64_t v2 = (void *)result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    uint64_t v5 = *--v2;
    void *v2 = 0;
    *(void *)(v4 - 8) = v5;
    v4 -= 8;
  }
  a2[1] = v4;
  long long v6 = (void *)*result;
  void *result = v4;
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

uint64_t std::__split_buffer<std::unique_ptr<std::byte []>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    uint64_t v4 = *(void *)(i - 8);
    *(void *)(i - 8) = 0;
    if (v4) {
      MEMORY[0x1D942C700](v4, 0x1000C8077774924);
    }
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<skit::FieldBundle::FieldData>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(24 * a1);
}

void skit::FieldBundle::add(skit::FieldBundle *this, unsigned __int16 a2, const skit::TokenStream *a3)
{
  uint64_t v3 = *(void *)a3;
  uint64_t v4 = 2;
  while (v3 != *((void *)a3 + 1))
  {
    uint64_t v5 = *(unsigned __int8 *)(v3 + 23);
    if ((v5 & 0x80u) != 0) {
      uint64_t v5 = *(void *)(v3 + 8);
    }
    v4 += 2 * v5 + 18;
    v3 += 48;
  }
  operator new[]();
}

void sub_1D2EF939C(_Unwind_Exception *a1)
{
  MEMORY[0x1D942C700](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void skit::FieldBundle::clear(skit::FieldBundle *this)
{
  uuid_clear((unsigned __int8 *)this);
  *((void *)this + 2) = 0;
  *((void *)this + 4) = *((void *)this + 3);
  unint64_t v2 = (void *)*((void *)this + 6);
  uint64_t v3 = (void *)*((void *)this + 7);
  while (v3 != v2)
  {
    uint64_t v5 = *--v3;
    uint64_t v4 = v5;
    *uint64_t v3 = 0;
    if (v5) {
      MEMORY[0x1D942C700](v4, 0x1000C8077774924);
    }
  }
  *((void *)this + 7) = v2;
}

void skit::FieldBundle::to_iovec(skit::FieldBundle *this@<X0>, char **a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>((2 * *((_DWORD *)this + 4)) | 1u);
  long long v6 = v4;
  *a2 = v4;
  a2[1] = v4;
  a2[2] = &v4[16 * v5];
  if (v5 < 1)
  {
    unint64_t v8 = (16 * v5) >> 3;
    if (v8 <= 1) {
      unint64_t v8 = 1;
    }
    if ((unint64_t)(16 * v5) >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v9 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v9 = v8;
    }
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>(v9);
    *(void *)unint64_t v10 = this;
    *((void *)v10 + 1) = 24;
    uint64_t v7 = v10 + 16;
    *a2 = v10;
    a2[1] = v10 + 16;
    a2[2] = &v10[16 * v11];
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    *(void *)uint64_t v4 = this;
    *((void *)v4 + 1) = 24;
    uint64_t v7 = v4 + 16;
  }
  a2[1] = v7;
  uint64_t v12 = *((void *)this + 3);
  uint64_t v13 = *((void *)this + 4);
  if (v12 != v13)
  {
    while (1)
    {
      unint64_t v14 = (unint64_t)a2[2];
      if ((unint64_t)v7 < v14)
      {
        *(void *)uint64_t v7 = v12;
        *((void *)v7 + 1) = 4;
        unint64_t v15 = v7 + 16;
        goto LABEL_28;
      }
      unint64_t v16 = *a2;
      uint64_t v17 = (v7 - *a2) >> 4;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 60) {
        goto LABEL_47;
      }
      uint64_t v19 = v14 - (void)v16;
      if (v19 >> 3 > v18) {
        unint64_t v18 = v19 >> 3;
      }
      uint64_t v20 = (char *)((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v18);
      if (v20) {
        uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>((unint64_t)v20);
      }
      else {
        uint64_t v21 = 0;
      }
      int v22 = &v20[16 * v17];
      int v23 = &v20[16 * v21];
      *(void *)int v22 = v12;
      *((void *)v22 + 1) = 4;
      unint64_t v15 = v22 + 16;
      if (v7 == v16) {
        break;
      }
      do
      {
        *((_OWORD *)v22 - 1) = *((_OWORD *)v7 - 1);
        v22 -= 16;
        v7 -= 16;
      }
      while (v7 != v16);
      uint64_t v7 = *a2;
      *a2 = v22;
      a2[1] = v15;
      a2[2] = v23;
      if (v7) {
        goto LABEL_27;
      }
LABEL_28:
      a2[1] = v15;
      uint64_t v24 = *(void *)(v12 + 8);
      uint64_t v25 = *(unsigned int *)(v12 + 16);
      unint64_t v26 = (unint64_t)a2[2];
      if ((unint64_t)v15 >= v26)
      {
        std::string v27 = *a2;
        uint64_t v28 = (v15 - *a2) >> 4;
        unint64_t v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 60) {
LABEL_47:
        }
          std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
        uint64_t v30 = v26 - (void)v27;
        if (v30 >> 3 > v29) {
          unint64_t v29 = v30 >> 3;
        }
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v31 = v29;
        }
        if (v31) {
          unint64_t v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>(v31);
        }
        else {
          uint64_t v32 = 0;
        }
        std::error_code v33 = (char *)(v31 + 16 * v28);
        unint64_t v34 = v31 + 16 * v32;
        *(void *)std::error_code v33 = v24;
        *((void *)v33 + 1) = v25;
        uint64_t v7 = v33 + 16;
        if (v15 == v27)
        {
          *a2 = v33;
          a2[1] = v7;
          a2[2] = (char *)v34;
        }
        else
        {
          do
          {
            *((_OWORD *)v33 - 1) = *((_OWORD *)v15 - 1);
            v33 -= 16;
            v15 -= 16;
          }
          while (v15 != v27);
          unint64_t v15 = *a2;
          *a2 = v33;
          a2[1] = v7;
          a2[2] = (char *)v34;
          if (!v15) {
            goto LABEL_45;
          }
        }
        operator delete(v15);
      }
      else
      {
        *(void *)unint64_t v15 = v24;
        *((void *)v15 + 1) = v25;
        uint64_t v7 = v15 + 16;
      }
LABEL_45:
      a2[1] = v7;
      v12 += 24;
      if (v12 == v13) {
        return;
      }
    }
    *a2 = v22;
    a2[1] = v15;
    a2[2] = v23;
LABEL_27:
    operator delete(v7);
    goto LABEL_28;
  }
}

void sub_1D2EF969C(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    *(void *)(v1 + 8) = v2;
    operator delete(v2);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<iovec>>(unint64_t a1)
{
  if (a1 >> 60) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(16 * a1);
}

void *skit::FieldSpanMatcherV2::FieldSpanMatcherV2(void *a1, uint64_t a2, long long **a3, char a4)
{
  char v6 = a4;
  std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(a1, a2, a3, &v6);
  return a1;
}

{
  char v6;

  char v6 = a4;
  std::allocate_shared[abi:ne180100]<skit::internal::FieldSpanMatcherImpl,std::allocator<skit::internal::FieldSpanMatcherImpl>,std::basic_string<char16_t> &,skit::TokenStream &,BOOL &,void>(a1, a2, a3, &v6);
  return a1;
}

BOOL skit::FieldSpanMatcherV2::is_initialized(skit::FieldSpanMatcherV2 *this)
{
  return *(void *)this != 0;
}

uint64_t skit::FieldSpanMatcherV2::query_token_stream_begin(skit::FieldSpanMatcherV2 *this)
{
  if (*(void *)this) {
    return **(void **)this;
  }
  else {
    return 0;
  }
}

{
  if (*(void *)this) {
    return **(void **)this;
  }
  else {
    return 0;
  }
}

uint64_t skit::FieldSpanMatcherV2::query_token_stream_end(skit::FieldSpanMatcherV2 *this)
{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 8);
  }
  else {
    return 0;
  }
}

{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 8);
  }
  else {
    return 0;
  }
}

uint64_t skit::FieldSpanMatcherV2::alias_span_matcher(uint64_t *a1, long long *a2, char a3, uint64_t a4)
{
  v9[10] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  v8[0] = (uint64_t)v9;
  v8[1] = 0x200000000;
  long long v7 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  uint64_t v5 = skit::internal::FieldSpanMatcherImpl::alias_span_matcher(v4, &v7, a3, a4, v8, 0);
  if (*((void *)&v7 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v7 + 1));
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)v8);
  return v5;
}

void sub_1D2EF9888(_Unwind_Exception *a1, uint64_t a2, std::__shared_weak_count *a3, uint64_t a4, ...)
{
  va_start(va, a4);
  if (a3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a3);
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)va);
  _Unwind_Resume(a1);
}

void skit::FieldSpanMatcherV2::alias_filters(uint64_t **a1, char a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  if (v3) {
    skit::internal::FieldSpanMatcherImpl::alias_filters(v3, a2, a3);
  }
}

void skit::FieldSpanMatcherV2::clear_alias_span_matcher(skit::internal::FieldSpanMatcherImpl **this)
{
  uint64_t v1 = *this;
  if (v1) {
    skit::internal::FieldSpanMatcherImpl::clear_alias_span_matcher(v1);
  }
}

uint64_t skit::FieldSpanMatcherV2::query_alias_matches_begin(skit::FieldSpanMatcherV2 *this)
{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 1184);
  }
  else {
    return 0;
  }
}

uint64_t skit::FieldSpanMatcherV2::query_alias_matches_end(skit::FieldSpanMatcherV2 *this)
{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 1184) + 72 * *(unsigned int *)(*(void *)this + 1192);
  }
  else {
    return 0;
  }
}

void skit::FieldSpanMatcherV2::match(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
}

{
  uint64_t v3;
  uint64_t v5[2];
  uint64_t v6;
  __int16 v7;
  void *__p[2];
  long long v9;
  uint64_t v10;
  char *v11[2];
  void v12[33];

  unsigned char v12[32] = *MEMORY[0x1E4F143B8];
  long long v7 = 0;
  *(_OWORD *)std::string __p = 0u;
  unint64_t v9 = 0u;
  unint64_t v10 = 0;
  v11[0] = (char *)v12;
  v11[1] = (char *)0x400000000;
  v5[0] = (uint64_t)&v6;
  v5[1] = 0x200000000;
  uint64_t v3 = *a1;
  if (v3)
  {
    skit::internal::FieldSpanMatcherImpl::match(v3, (uint64_t)&v7, a3, v5, 0);
  }
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)v5);
  skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector(v11);
  if (SBYTE7(v9) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1D2EF99F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va1, a2);
  va_start(va, a2);
  uint64_t v3 = va_arg(va1, void);
  uint64_t v5 = va_arg(va1, void);
  uint64_t v6 = va_arg(va1, void);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  skit::SmallVector<skit::AliasMatch,2u,true>::~SmallVector((uint64_t)va);
  skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::~FieldMatchesImpl((uint64_t)va1);
  _Unwind_Resume(a1);
}

size_t skit::anonymous namespace'::field_span_match_to_v2(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  size_t result = a1 + 8;
  if (a1 != a2)
  {
    char v5 = *(unsigned char *)(a2 + 31);
    if (*(char *)(a1 + 31) < 0)
    {
      if (v5 >= 0) {
        uint64_t v7 = (const std::basic_string<char16_t>::value_type *)(a2 + 8);
      }
      else {
        uint64_t v7 = *(const std::basic_string<char16_t>::value_type **)(a2 + 8);
      }
      if (v5 >= 0) {
        std::basic_string<char16_t>::size_type v8 = *(unsigned __int8 *)(a2 + 31);
      }
      else {
        std::basic_string<char16_t>::size_type v8 = *(void *)(a2 + 16);
      }
      size_t result = (size_t)std::basic_string<char16_t>::__assign_no_alias<false>((std::basic_string<char16_t> *)result, v7, v8);
    }
    else if ((*(unsigned char *)(a2 + 31) & 0x80) != 0)
    {
      size_t result = (size_t)std::basic_string<char16_t>::__assign_no_alias<true>((std::basic_string<char16_t> *)result, *(const std::basic_string<char16_t>::value_type **)(a2 + 8), *(void *)(a2 + 16));
    }
    else
    {
      long long v6 = *(_OWORD *)(a2 + 8);
      *(void *)(result + 16) = *(void *)(a2 + 24);
      *(_OWORD *)size_t result = v6;
    }
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 48);
  uint64_t v10 = *(unsigned int *)(a2 + 56);
  uint64_t v11 = v9 + (v10 << 6);
  if (*(_DWORD *)(a1 + 60) >= v10)
  {
    if (v10)
    {
      uint64_t v21 = *(void *)(a1 + 48);
      do
      {
        int v22 = *(_DWORD *)(v9 + 8);
        int v23 = *(_DWORD *)(v9 + 12);
        *(void *)uint64_t v21 = *(void *)v9;
        *(_DWORD *)(v21 + 8) = v22;
        *(_DWORD *)(v21 + 12) = v23;
        *(void *)(v21 + 16) = *(void *)(v9 + 16);
        unsigned int v24 = *(_DWORD *)(v9 + 24);
        v9 += 64;
        *(void *)(v21 + 24) = v24;
        v21 += 32;
      }
      while (v9 != v11);
    }
  }
  else
  {
    int v12 = *(_DWORD *)(a1 + 56) + (*(_DWORD *)(a1 + 56) >> 1);
    if (v12 + 1 > v10) {
      unsigned int v13 = v12 + 1;
    }
    else {
      unsigned int v13 = *(_DWORD *)(a2 + 56);
    }
    uint64_t v14 = malloc_type_malloc(32 * v13, 0x1000040E0EAB150uLL);
    if (!v14)
    {
      exceptiouint64_t n = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      unint64_t v26 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v26, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
    }
    uint64_t v15 = v14;
    unint64_t v16 = v14;
    do
    {
      int v17 = *(_DWORD *)(v9 + 8);
      int v18 = *(_DWORD *)(v9 + 12);
      *(void *)unint64_t v16 = *(void *)v9;
      v16[2] = v17;
      v16[3] = v18;
      *((void *)v16 + 2) = *(void *)(v9 + 16);
      unsigned int v19 = *(_DWORD *)(v9 + 24);
      v9 += 64;
      *((void *)v16 + 3) = v19;
      v16 += 8;
    }
    while (v9 != v11);
    uint64_t v20 = *(void **)(a1 + 48);
    if (v20 != (void *)(a1 + 64)) {
      free(v20);
    }
    *(void *)(a1 + 48) = v15;
    size_t result = malloc_size(v15);
    *(_DWORD *)(a1 + 60) = result >> 5;
  }
  *(_DWORD *)(a1 + 56) = v10;
  return result;
}

uint64_t skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::~FieldMatchesImpl(uint64_t a1)
{
  if (*(char *)(a1 + 31) < 0) {
    operator delete(*(void **)(a1 + 8));
  }
  return a1;
}

std::basic_string<char16_t> *std::basic_string<char16_t>::__assign_no_alias<true>(std::basic_string<char16_t> *__dst, const std::basic_string<char16_t>::value_type *__src, std::basic_string<char16_t>::size_type __n_add)
{
  BOOL v5 = __n_add > 0xA;
  std::basic_string<char16_t>::size_type v6 = __n_add - 10;
  if (v5)
  {
    std::basic_string<char16_t>::__grow_by_and_replace(__dst, 0xAuLL, v6, *((unsigned char *)&__dst->__r_.__value_.__s + 23) & 0x7F, 0, *((unsigned char *)&__dst->__r_.__value_.__s + 23) & 0x7F, __n_add, __src);
  }
  else
  {
    *((unsigned char *)&__dst->__r_.__value_.__s + 23) = __n_add;
    if (__n_add) {
      memmove(__dst, __src, 2 * __n_add);
    }
    __dst->__r_.__value_.__s.__data_[__n_add] = 0;
  }
  return __dst;
}

std::basic_string<char16_t> *std::basic_string<char16_t>::__assign_no_alias<false>(std::basic_string<char16_t> *this, const std::basic_string<char16_t>::value_type *__src, std::basic_string<char16_t>::size_type __n_add)
{
  std::basic_string<char16_t>::size_type v5 = this->__r_.__value_.__r.__words[2] & 0x7FFFFFFFFFFFFFFFLL;
  if (v5 <= __n_add)
  {
    std::basic_string<char16_t>::__grow_by_and_replace(this, v5 - 1, __n_add - v5 + 1, this->__r_.__value_.__l.__size_, 0, this->__r_.__value_.__l.__size_, __n_add, __src);
  }
  else
  {
    std::basic_string<char16_t>::size_type v6 = (void *)this->__r_.__value_.__r.__words[0];
    this->__r_.__value_.__l.__size_ = __n_add;
    if (__n_add) {
      memmove(v6, __src, 2 * __n_add);
    }
    *((_WORD *)v6 + __n_add) = 0;
  }
  return this;
}

void skit::FieldSpanMatcherV2::match(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  v11[32] = *MEMORY[0x1E4F143B8];
  __int16 v6 = 0;
  *(_OWORD *)std::string __p = 0u;
  long long v8 = 0u;
  uint64_t v9 = 0;
  v10[0] = (char *)v11;
  v10[1] = (char *)0x400000000;
  uint64_t v4 = *a1;
  if (v4)
  {
    skit::internal::FieldSpanMatcherImpl::match(v4, (uint64_t)&v6, a3, a4, 1);
  }
  skit::SmallVector<skit::SpanMatchV3,8u,true>::~SmallVector(v10);
  if (SBYTE7(v8) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1D2EF9DC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::~FieldMatchesImpl((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t skit::FieldSpanMatcherV2::merge_field(uint64_t *a1, int32x4_t *a2, uint64_t a3, char a4)
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *a1;
  if (!*a1) {
    goto LABEL_10;
  }
  if ((a4 & 1) == 0) {
    *a2 = vaddq_s32(*a2, *(int32x4_t *)(a3 + 32));
  }
  uint64_t v6 = *(unsigned int *)(a3 + 56);
  if (!v6)
  {
LABEL_10:
    LOBYTE(v9) = 0;
    return v9 & 1;
  }
  uint64_t v7 = 24;
  if (*(unsigned char *)(v4 + 602))
  {
    uint64_t v8 = v4 + 24;
  }
  else
  {
    uint64_t v7 = 48;
    uint64_t v8 = v4 + 48;
  }
  if (*(char *)(v8 + 23) < 0)
  {
    unint64_t v85 = *(void *)(v8 + 8);
    uint64_t v8 = *(void *)(v4 + v7);
  }
  else
  {
    unint64_t v85 = *(unsigned __int8 *)(v8 + 23);
  }
  uint64_t v10 = *(long long **)(a3 + 48);
  float v80 = &v10[2 * v6];
  uint64_t v11 = (_OWORD *)(a3 + 8);
  uint64_t v83 = (char **)&a2[1];
  unsigned int v79 = a2[1].u32[2];
  unsigned int v12 = v79;
  unsigned int v82 = a2;
  do
  {
    if (v12 == a2[1].i32[3])
    {
      skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_reserve_more(v83, v12 + (v12 >> 1) + 1);
      unsigned int v12 = v82[1].u32[2];
    }
    unsigned int v13 = *v83;
    LOWORD(v86) = *(_WORD *)a3;
    if (*(char *)(a3 + 31) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(&__p, *(const std::basic_string<char16_t>::value_type **)(a3 + 8), *(void *)(a3 + 16));
    }
    else
    {
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *v11;
      __p.__r_.__value_.__r.__words[2] = *(void *)(a3 + 24);
    }
    int v15 = *(_DWORD *)(a3 + 32);
    __int32 v14 = *(_DWORD *)(a3 + 36);
    int v88 = v15;
    *(void *)&v89[4] = *(void *)(a3 + 40);
    long long v16 = v10[1];
    long long v90 = *v10;
    long long v91 = v16;
    unsigned __int32 v17 = *((_DWORD *)v10 + 6);
    if (*(_DWORD *)&v89[4] < v17) {
      int v88 = v17 + v15 - *(_DWORD *)&v89[4];
    }
    uint32x2_t v18 = (uint32x2_t)vdup_lane_s32(*(int32x2_t *)&v89[4], 0);
    v18.i32[0] = v14;
    v19.i32[0] = *((_DWORD *)v10 + 5);
    v19.i32[1] = v17;
    uint64_t v20 = &v13[392 * v12];
    *(uint32x2_t *)BOOL v89 = vmax_u32(v18, v19);
    *(void *)uint64_t v20 = v20 + 16;
    *((void *)v20 + 1) = 0x400000001;
    std::uninitialized_copy[abi:ne180100]<skit::FieldMatchV2 const*,skit::FieldMatchV2*>((uint64_t)&v86, (uint64_t)&v92, (uint64_t)(v20 + 16));
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    uint64_t v21 = (std::basic_string<char16_t> *)&v13[392 * v12 + 336];
    if (*(char *)(a3 + 31) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external(v21, *(const std::basic_string<char16_t>::value_type **)(a3 + 8), *(void *)(a3 + 16));
    }
    else
    {
      long long v22 = *v11;
      *(void *)&v13[392 * v12 + 352] = *(void *)(a3 + 24);
      *(_OWORD *)&v21->__r_.__value_.__l.__data_ = v22;
    }
    int v23 = &v13[392 * v12 + 360];
    long long v24 = *v10;
    long long v25 = v10[1];
    v10 += 2;
    *(_OWORD *)int v23 = v24;
    *((_OWORD *)v23 + 1) = v25;
    a2 = v82;
    unsigned int v12 = v82[1].i32[2] + 1;
    v82[1].i32[2] = v12;
  }
  while (v10 != v80);
  unsigned int v26 = v79;
  if (v12 == v79)
  {
    LOBYTE(v9) = 0;
    std::string v27 = v82;
    if (!v79) {
      return v9 & 1;
    }
    goto LABEL_89;
  }
  int v9 = 0;
  uint64_t v28 = (uint64_t)&(*v83)[392 * v79];
  unint64_t v78 = *v83;
  uint64_t v29 = (uint64_t)&(*v83)[392 * v12];
  do
  {
    unsigned int v84 = (uint64_t *)(v29 - 392);
    if (v26)
    {
      char v30 = 0;
      unsigned int v81 = (unsigned int *)(v29 - 384);
      unint64_t v31 = v78;
      do
      {
        while (1)
        {
          unint64_t v32 = *((unsigned int *)v31 + 91);
          unsigned int v33 = *(_DWORD *)(v29 - 32);
          if (v33 < v32) {
            break;
          }
          if (v33 != v32)
          {
            std::basic_string<char16_t>::size_type v34 = v85 - v32;
            if (v85 < v32) {
              std::__throw_out_of_range[abi:ne180100]("string_view::substr");
            }
            std::basic_string<char16_t>::size_type v35 = v33 - v32;
            uint64_t v36 = v8 + 2 * v32;
            if (v34 < v35) {
              std::basic_string<char16_t>::size_type v35 = v34;
            }
            uint64_t v86 = v36;
            __p.__r_.__value_.__r.__words[0] = v35;
            if (skit::is_significant(&v86)) {
              break;
            }
          }
          unsigned int v37 = *v81;
          if (*v81)
          {
            unsigned int v38 = *((_DWORD *)v31 + 2);
            uint64_t v39 = *(void *)v31 + 80 * v38;
            uint64_t v40 = *v84;
            unsigned int v41 = v38 + v37;
            if (v38 + v37 <= *((_DWORD *)v31 + 3))
            {
              uint64_t v47 = *(void *)v31 + 80 * v38;
            }
            else
            {
              uint64_t v77 = *v84;
              unsigned int v42 = v38 + (v38 >> 1);
              if (v42 + 1 > v41) {
                unsigned int v43 = v42 + 1;
              }
              else {
                unsigned int v43 = v41;
              }
              int v44 = malloc_type_malloc(80 * v43, 0x10120409E7384ACuLL);
              if (!v44)
              {
                exceptiouint64_t n = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
                unint64_t v75 = std::bad_alloc::bad_alloc(exception);
                __cxa_throw(v75, MEMORY[0x1E4FBA360], MEMORY[0x1E4FBA2C0]);
              }
              unsigned int v45 = *(char **)v31;
              long long v46 = (char *)v39;
              uint64_t v47 = (uint64_t)v44;
              if (*(void *)v31 != v39)
              {
                uint64_t v47 = (uint64_t)v44;
                do
                {
                  *(_WORD *)uint64_t v47 = *(_WORD *)v45;
                  long long v48 = *(_OWORD *)(v45 + 8);
                  *(void *)(v47 + 24) = *((void *)v45 + 3);
                  *(_OWORD *)(v47 + 8) = v48;
                  *((void *)v45 + 2) = 0;
                  *((void *)v45 + 3) = 0;
                  *((void *)v45 + 1) = 0;
                  long long v49 = *((_OWORD *)v45 + 2);
                  long long v50 = *((_OWORD *)v45 + 4);
                  *(_OWORD *)(v47 + 48) = *((_OWORD *)v45 + 3);
                  *(_OWORD *)(v47 + 64) = v50;
                  *(_OWORD *)(v47 + 32) = v49;
                  v47 += 80;
                  v45 += 80;
                }
                while (v45 != (char *)v39);
                long long v46 = *(char **)v31;
              }
              uint64_t v51 = *((unsigned int *)v31 + 2);
              long long v52 = &v46[80 * v51];
              if (v52 != (char *)v39)
              {
                uint64_t v53 = v47 + 80 * v37;
                do
                {
                  *(_WORD *)uint64_t v53 = *(_WORD *)v39;
                  long long v54 = *(_OWORD *)(v39 + 8);
                  *(void *)(v53 + 24) = *(void *)(v39 + 24);
                  *(_OWORD *)(v53 + 8) = v54;
                  *(void *)(v39 + 16) = 0;
                  *(void *)(v39 + 24) = 0;
                  *(void *)(v39 + 8) = 0;
                  long long v55 = *(_OWORD *)(v39 + 32);
                  long long v56 = *(_OWORD *)(v39 + 64);
                  *(_OWORD *)(v53 + 48) = *(_OWORD *)(v39 + 48);
                  *(_OWORD *)(v53 + 64) = v56;
                  *(_OWORD *)(v53 + 32) = v55;
                  v39 += 80;
                  v53 += 80;
                }
                while ((char *)v39 != v52);
                long long v46 = *(char **)v31;
                uint64_t v51 = *((unsigned int *)v31 + 2);
              }
              if (v51)
              {
                int v76 = v9;
                uint64_t v57 = v46 + 31;
                uint64_t v58 = 80 * v51;
                do
                {
                  if (*v57 < 0) {
                    operator delete(*(void **)(v57 - 23));
                  }
                  v57 += 80;
                  v58 -= 80;
                }
                while (v58);
                long long v46 = *(char **)v31;
                int v9 = v76;
              }
              if (v46 != v31 + 16) {
                free(v46);
              }
              *(void *)unint64_t v31 = v44;
              *((_DWORD *)v31 + 3) = malloc_size(v44) / 0x50;
              uint64_t v40 = v77;
            }
            *((_DWORD *)v31 + 2) = v41;
            std::uninitialized_copy[abi:ne180100]<skit::FieldMatchV2 const*,skit::FieldMatchV2*>(v40, v40 + 80 * v37, v47);
          }
          if (v31[359] < 0) {
            uint64_t v59 = *((void *)v31 + 43);
          }
          else {
            uint64_t v59 = v31[359];
          }
          if (v59 && *((_DWORD *)v31 + 91) < *(_DWORD *)(v29 - 32)) {
            std::basic_string<char16_t>::push_back((std::basic_string<char16_t> *)v31 + 14, (std::basic_string<char16_t>::value_type)a2);
          }
          char v60 = *(unsigned char *)(v29 - 33);
          if (v60 >= 0) {
            unsigned int v61 = (const std::basic_string<char16_t>::value_type *)(v29 - 56);
          }
          else {
            unsigned int v61 = *(const std::basic_string<char16_t>::value_type **)(v29 - 56);
          }
          if (v60 >= 0) {
            std::basic_string<char16_t>::size_type v62 = *(unsigned __int8 *)(v29 - 33);
          }
          else {
            std::basic_string<char16_t>::size_type v62 = *(void *)(v29 - 48);
          }
          std::basic_string<char16_t>::append((std::basic_string<char16_t> *)v31 + 14, v61, v62);
          LODWORD(v63) = *((_DWORD *)v31 + 90);
          unsigned int v64 = *(_DWORD *)(v29 - 32);
          unsigned int v65 = *(_DWORD *)(v29 - 28);
          if (v64 >= v63) {
            uint64_t v63 = v63;
          }
          else {
            uint64_t v63 = v64;
          }
          LODWORD(v66) = *((_DWORD *)v31 + 91);
          if (v66 <= v65) {
            uint64_t v66 = v65;
          }
          else {
            uint64_t v66 = v66;
          }
          *((void *)v31 + 45) = v63 | (v66 << 32);
          *((_DWORD *)v31 + 92) += *(_DWORD *)(v29 - 24);
          *((float *)v31 + 93) = *(float *)(v29 - 20) + *((float *)v31 + 93);
          *((int32x2_t *)v31 + 47) = vadd_s32(*(int32x2_t *)(v31 + 376), *(int32x2_t *)(v29 - 16));
          *((_DWORD *)v31 + 96) += *(_DWORD *)(v29 - 8);
          v31 += 392;
          char v30 = 1;
          if (v31 == (char *)v28) {
            goto LABEL_86;
          }
        }
        v31 += 392;
      }
      while (v31 != (char *)v28);
      if ((v30 & 1) == 0) {
        goto LABEL_87;
      }
LABEL_86:
      uint64_t v67 = v82[1].i64[0] + 392 * v82[1].u32[2];
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,0>(v29, v67, (uint64_t)v84);
      skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>(v67 - 392);
      --v82[1].i32[2];
      int v9 = 1;
    }
LABEL_87:
    v29 -= 392;
    unsigned int v26 = v79;
  }
  while (v84 != (uint64_t *)v28);
  std::string v27 = v82;
  unsigned int v26 = v82[1].u32[2];
  if (v26)
  {
LABEL_89:
    unsigned int v68 = 0;
    do
    {
      if (v68)
      {
        uint64_t v69 = 0;
        unsigned int v70 = *v83;
        uint64_t v71 = *v83 + 364;
        while (*(_DWORD *)&(*v83)[392 * v68 + 360] < *(v71 - 1) || *(_DWORD *)&(*v83)[392 * v68 + 364] > *v71)
        {
          ++v69;
          v71 += 98;
          if (v68 == v69)
          {
            LODWORD(v69) = v68;
            goto LABEL_98;
          }
        }
        uint64_t v72 = (uint64_t)&v70[392 * v26];
        std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,0>((uint64_t)&v70[392 * v68 + 392], v72, (uint64_t)&v70[392 * v68]);
        skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>(v72 - 392);
        unsigned int v26 = v27[1].i32[2] - 1;
        v27[1].i32[2] = v26;
      }
      else
      {
        LODWORD(v69) = 0;
      }
LABEL_98:
      if (v69 == v68) {
        ++v68;
      }
    }
    while (v68 < v26);
  }
  return v9 & 1;
}

void sub_1D2EFA49C(_Unwind_Exception *a1)
{
  skit::SmallVector<skit::FieldMatchV2,4u,true>::~SmallVector(v1);
  _Unwind_Resume(a1);
}

void skit::FieldSpanMatcherV2::finalize(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1 && *(_DWORD *)(a2 + 44))
  {
    uint64_t v4 = *(void *)v2;
    uint64_t v5 = *(void *)(v2 + 8);
    if (*(void *)v2 == v5)
    {
      int v6 = 0;
    }
    else
    {
      int v6 = 0;
      do
      {
        int v6 = *(_DWORD *)(v4 + 28) + v6 - *(_DWORD *)(v4 + 24);
        v4 += 48;
      }
      while (v4 != v5);
    }
    if (*(_DWORD *)(a2 + 56))
    {
      uint64_t v7 = *(void *)(a2 + 48);
      do
      {
        unsigned int v8 = *(_DWORD *)(v7 + 4) - *(_DWORD *)v7;
        if (v8 < 0x34) {
          int v9 = 4;
        }
        else {
          int v9 = 5;
        }
        if (v8 < 0x18) {
          int v9 = 3;
        }
        if (v8 < 0xB) {
          int v9 = 2;
        }
        if (v8 < 5) {
          int v9 = 1;
        }
        if (v8 >= 3) {
          unsigned int v10 = v9;
        }
        else {
          unsigned int v10 = 0;
        }
        skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV2>(v2, (float *)v7, *(_DWORD *)(a2 + 44), v6);
        BOOL v11 = v8 <= 2 && *(unsigned char *)(v2 + 602) == 0;
        if (v11 && *(_DWORD *)(v7 + 4) - *(_DWORD *)v7 > v8 && *(_DWORD *)(v7 + 8) > v10)
        {
          uint64_t v12 = *(unsigned int *)(a2 + 56);
          uint64_t v13 = *(void *)(a2 + 48) + 32 * v12;
          if (v13 != v7 + 32)
          {
            memmove((void *)v7, (const void *)(v7 + 32), v13 - (v7 + 32));
            LODWORD(v12) = *(_DWORD *)(a2 + 56);
          }
          unsigned int v14 = v12 - 1;
          *(_DWORD *)(a2 + 56) = v14;
        }
        else
        {
          v7 += 32;
          unsigned int v14 = *(_DWORD *)(a2 + 56);
        }
      }
      while (v7 != *(void *)(a2 + 48) + 32 * v14);
    }
  }
}

{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int *v12;
  int v13;
  int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float *v21;

  uint64_t v2 = *a1;
  if (*a1)
  {
    uint64_t v4 = *(void *)v2;
    uint64_t v5 = *(void *)(v2 + 8);
    if (*(void *)v2 == v5)
    {
      int v6 = 0;
    }
    else
    {
      int v6 = 0;
      do
      {
        int v6 = *(_DWORD *)(v4 + 28) + v6 - *(_DWORD *)(v4 + 24);
        v4 += 48;
      }
      while (v4 != v5);
    }
    uint64_t v7 = *(_DWORD *)(a2 + 24);
    if (v7)
    {
      unsigned int v8 = *(void *)(a2 + 16);
      do
      {
        int v9 = *(unsigned int *)(v8 + 8);
        if (v9)
        {
          unsigned int v10 = 0;
          BOOL v11 = 80 * v9;
          uint64_t v12 = (int *)(*(void *)v8 + 44);
          do
          {
            uint64_t v13 = *v12;
            v12 += 20;
            v10 += v13;
            v11 -= 80;
          }
          while (v11);
        }
        else
        {
          unsigned int v10 = 0;
        }
        if (*(_DWORD *)(a2 + 12) <= v10) {
          unsigned int v14 = v10;
        }
        else {
          unsigned int v14 = *(_DWORD *)(a2 + 12);
        }
        if (v14)
        {
          int v15 = *(_DWORD *)(v8 + 364) - *(_DWORD *)(v8 + 360);
          if (v15 < 0x34) {
            long long v16 = 4;
          }
          else {
            long long v16 = 5;
          }
          if (v15 < 0x18) {
            long long v16 = 3;
          }
          if (v15 < 0xB) {
            long long v16 = 2;
          }
          if (v15 < 5) {
            long long v16 = 1;
          }
          if (v15 >= 3) {
            unsigned __int32 v17 = v16;
          }
          else {
            unsigned __int32 v17 = 0;
          }
          skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV2>(v2, (float *)(v8 + 360), v14, v6);
          if (*(unsigned char *)(v2 + 602)
            || *(_DWORD *)(v8 + 364) - *(_DWORD *)(v8 + 360) <= v15
            || *(_DWORD *)(v8 + 368) <= v17)
          {
            uint32x2_t v19 = *(unsigned int *)(v8 + 8);
            if (v19)
            {
              uint64_t v20 = 80 * v19;
              uint64_t v21 = (float *)(*(void *)v8 + 48);
              do
              {
                if (*((_DWORD *)v21 - 4)) {
                  skit::internal::FieldSpanMatcherImpl::final_align_and_score<skit::SpanMatchV2>(v2, v21, *((_DWORD *)v21 - 1), v6);
                }
                v21 += 20;
                v20 -= 80;
              }
              while (v20);
            }
            v8 += 392;
            uint64_t v7 = *(_DWORD *)(a2 + 24);
          }
          else
          {
            uint32x2_t v18 = *(void *)(a2 + 16) + 392 * *(unsigned int *)(a2 + 24);
            std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,skit::MergedFieldMatchV2 *,0>(v8 + 392, v18, v8);
            skit::SmallVector<skit::MergedFieldMatchV2,8u,true>::_destroy<skit::MergedFieldMatchV2,(void *)0>(v18 - 392);
            uint64_t v7 = *(_DWORD *)(a2 + 24) - 1;
            *(_DWORD *)(a2 + 24) = v7;
          }
        }
        else
        {
          *(_DWORD *)(v8 + 372) = 0;
          v8 += 392;
        }
      }
      while (v8 != *(void *)(a2 + 16) + 392 * v7);
    }
  }
}

void *skit::IndexReader::IndexReader(void *this)
{
  *this = 0;
  this[1] = 0;
  return this;
}

{
  *this = 0;
  this[1] = 0;
  return this;
}

void *skit::IndexReader::IndexReader(void *this, const skit::IndexReader *a2)
{
  uint64_t v2 = *((void *)a2 + 1);
  *this = *(void *)a2;
  this[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

{
  uint64_t v2;

  uint64_t v2 = *((void *)a2 + 1);
  *this = *(void *)a2;
  this[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

__n128 skit::IndexReader::IndexReader(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

{
  __n128 result;

  __n128 result = *a2;
  *a1 = *a2;
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  return result;
}

skit::IndexReader *skit::IndexReader::IndexReader(skit::IndexReader *this, std::__fs::filesystem::path *a2)
{
  return this;
}

{
  std::allocate_shared[abi:ne180100]<skit::internal::IndexReaderImpl,std::allocator<skit::internal::IndexReaderImpl>,std::__fs::filesystem::path,void>(this, (uint64_t)a2);
  return this;
}

void std::allocate_shared[abi:ne180100]<skit::internal::IndexReaderImpl,std::allocator<skit::internal::IndexReaderImpl>,std::__fs::filesystem::path,void>(void *a1, uint64_t a2)
{
  uint64_t v4 = (char *)operator new(0x200uLL);
  *(_OWORD *)(v4 + 8) = 0u;
  *(void *)uint64_t v4 = &unk_1F2A13270;
  uint64_t v5 = *(const std::string::value_type **)a2;
  std::string::size_type v6 = *(void *)(a2 + 8);
  *(_DWORD *)unsigned int v8 = *(_DWORD *)(a2 + 16);
  *(_DWORD *)&v8[3] = *(_DWORD *)(a2 + 19);
  int v7 = *(char *)(a2 + 23);
  *(void *)(a2 + 16) = 0;
  *(_OWORD *)a2 = 0u;
  if (v7 < 0)
  {
    std::string::__init_copy_ctor_external(&v9, v5, v6);
  }
  else
  {
    v9.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
    v9.__r_.__value_.__l.__size_ = v6;
    LODWORD(v9.__r_.__value_.__r.__words[2]) = *(_DWORD *)v8;
    *(_DWORD *)((char *)&v9.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)&v8[3];
    *((unsigned char *)&v9.__r_.__value_.__s + 23) = v7;
  }
  std::string::append[abi:ne180100]<char const*,0>(&v9, (std::string *)"/string_store", (std::string *)"");
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v10, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
  }
  else {
    std::string v10 = v9;
  }
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::KvStore((uint64_t)(v4 + 24), (long long *)&v10, skit::default_kv_store_config, unk_1EA697FF8);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  v9.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
  v9.__r_.__value_.__l.__size_ = v6;
  LODWORD(v9.__r_.__value_.__r.__words[2]) = *(_DWORD *)v8;
  *(_DWORD *)((char *)&v9.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)&v8[3];
  *((unsigned char *)&v9.__r_.__value_.__s + 23) = v7;
  skit::internal::MultiIndexV2::MultiIndexV2((skit::internal::MultiIndexV2 *)(v4 + 192), (std::__fs::filesystem::path *)&v9);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  *a1 = v4 + 24;
  a1[1] = v4;
}

void sub_1D2EFA9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  operator delete(v22);
  std::__shared_weak_count::~__shared_weak_count(v21);
  operator delete(v24);
  _Unwind_Resume(a1);
}

skit::internal::MultiIndexV2 *skit::internal::MultiIndexV2::MultiIndexV2(skit::internal::MultiIndexV2 *this, std::__fs::filesystem::path *a2)
{
  long long v3 = *(_OWORD *)&a2->__pn_.__r_.__value_.__l.__data_;
  *((void *)this + 2) = *((void *)&a2->__pn_.__r_.__value_.__l + 2);
  *(_OWORD *)this = v3;
  *(_OWORD *)&a2->__pn_.__r_.__value_.__r.__words[1] = 0uLL;
  a2->__pn_.__r_.__value_.__r.__words[0] = 0;
  *(_OWORD *)((char *)this + 24) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 20) = 1065353216;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 104) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 232) = 0u;
  *(_OWORD *)((char *)this + 248) = 0u;
  *((void *)this + 33) = 0;
  *(_OWORD *)((char *)this + 184) = 0u;
  *((_DWORD *)this + 24) = 621942338;
  *((_DWORD *)this + 31) = 0;
  *(void *)((char *)this + 108) = 0;
  *(void *)((char *)this + 100) = 0;
  *(void *)((char *)this + 116) = 0;
  *((_OWORD *)this + 9) = 0u;
  *((int64x2_t *)this + 8) = vdupq_n_s64(1uLL);
  *((void *)this + 24) = 0;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((void *)this + 22) = 0x40000000;
  skit::FlatSet<std::pair<skit::Uuid,unsigned int>,skit::internal::HashPairAdapter<skit::Hash32<skit::Uuid>>,skit::internal::CmpPairAdapter<std::equal_to<skit::Uuid>>>::allocate_pimpl<>((void *)this + 23, 0x40000000, 1u);
  *(_OWORD *)((char *)this + 216) = 0u;
  *(_OWORD *)((char *)this + 200) = 0u;
  *((_DWORD *)this + 56) = -1;
  *(_OWORD *)((char *)this + 232) = xmmword_1D2F00770;
  *((void *)this + 32) = 0;
  *((void *)this + 33) = 0;
  *((void *)this + 31) = 0;
  *((_DWORD *)this + 68) = 0;
  *((void *)this + 35) = 10485760;
  *((unsigned char *)this + 288) = 0;
  *((_DWORD *)this + 73) = 4;
  *((_WORD *)this + 148) = 416;
  *((void *)this + 38) = 0;
  *((void *)this + 39) = 0;
  return this;
}

void sub_1D2EFABA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  uint64_t v4 = v3;
  std::string::size_type v6 = *v4;
  if (*v4)
  {
    *(void *)(v2 + 152) = v6;
    operator delete(v6);
  }
  std::__hash_table<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::__unordered_map_hasher<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::hash<skit::internal::Term>,std::equal_to<skit::internal::Term>,true>,std::__unordered_map_equal<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::equal_to<skit::internal::Term>,std::hash<skit::internal::Term>,true>,std::allocator<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>>>::~__hash_table(v2 + 48);
  std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  if (*(char *)(v2 + 23) < 0) {
    operator delete(*(void **)v2);
  }
  _Unwind_Resume(a1);
}

void std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void ***)**a1;
  if (v2)
  {
    uint64_t v4 = (void ***)v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<skit::internal::IndexDiskImplV2>::reset[abi:ne180100](--v4);
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t std::__shared_ptr_emplace<skit::internal::IndexReaderImpl>::__on_zero_shared(uint64_t a1, std::error_code *a2)
{
  uint64_t v2 = a1 + 24;
  skit::internal::MultiIndexV2::~MultiIndexV2((skit::internal::MultiIndexV2 *)(a1 + 192), a2);

  return skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore(v2);
}

void skit::internal::MultiIndexV2::~MultiIndexV2(skit::internal::MultiIndexV2 *this, std::error_code *a2)
{
  long long v3 = (skit::internal::MultiIndexV2 *)((char *)this + 200);
  skit::internal::BlobFile::clear((skit::internal::MultiIndexV2 *)((char *)this + 200), a2);
  skit::internal::BlobFile::~BlobFile(v3);
  uint64_t v4 = *((void *)this + 23);
  *((void *)this + 23) = 0;
  if (v4) {
    (*((void (**)(void))this + 24))();
  }
  uint64_t v5 = (void *)*((void *)this + 18);
  if (v5)
  {
    *((void *)this + 19) = v5;
    operator delete(v5);
  }
  std::__hash_table<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::__unordered_map_hasher<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::hash<skit::internal::Term>,std::equal_to<skit::internal::Term>,true>,std::__unordered_map_equal<skit::internal::Term,std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>,std::equal_to<skit::internal::Term>,std::hash<skit::internal::Term>,true>,std::allocator<std::__hash_value_type<skit::internal::Term,skit::internal::PostingListMemImplV2>>>::~__hash_table((uint64_t)this + 48);
  std::string::size_type v6 = (void **)((char *)this + 24);
  std::vector<std::unique_ptr<skit::internal::IndexDiskImplV2>>::__destroy_vector::operator()[abi:ne180100](&v6);
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

void std::__shared_ptr_emplace<skit::internal::IndexReaderImpl>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2A13270;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x1D942C720);
}

void std::__shared_ptr_emplace<skit::internal::IndexReaderImpl>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_1F2A13270;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void skit::IndexReader::~IndexReader(skit::IndexReader *this)
{
  uint64_t v2 = *(void *)this;
  if (*(void *)this)
  {
    skit::internal::MultiIndexV2::close((void ****)(v2 + 168));
    skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close((void *)v2);
  }
  long long v3 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

void *skit::IndexReader::operator=(void *a1, uint64_t *a2)
{
  uint64_t v4 = *a2;
  uint64_t v3 = a2[1];
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v5 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v3;
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return a1;
}

uint64_t skit::IndexReader::operator=(uint64_t a1, long long *a2)
{
  long long v3 = *a2;
  *(void *)a2 = 0;
  *((void *)a2 + 1) = 0;
  uint64_t v4 = *(std::__shared_weak_count **)(a1 + 8);
  *(_OWORD *)a1 = v3;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  return a1;
}

BOOL skit::IndexReader::exists(skit::IndexReader *this)
{
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  uint64_t v2 = (const char *)(v1 + 168);
  if (*(char *)(v1 + 191) < 0) {
    uint64_t v2 = *(const char **)v2;
  }
  return access(v2, 0) == 0;
}

BOOL skit::IndexReader::is_open(skit::IndexReader *this)
{
  return *(void *)this && *(unsigned char *)(*(void *)this + 456) != 0;
}

uint64_t skit::IndexReader::open(skit::IndexReader *this)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = (const char **)(v1 + 168);
  long long v3 = (const char *)(v1 + 168);
  if (*(char *)(v1 + 191) < 0) {
    long long v3 = *v2;
  }
  if (access(v3, 0))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    std::string::size_type v6 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(v1 + 191) < 0) {
        uint64_t v2 = (const char **)*v2;
      }
      int v7 = 136446210;
      unsigned int v8 = v2;
      _os_log_error_impl(&dword_1D2EDA000, v6, OS_LOG_TYPE_ERROR, "IndexReaderImpl::open : index does not exist @ %{public}s", (uint8_t *)&v7, 0xCu);
    }
    return 0xFFFFFFFFLL;
  }
  int v4 = skit::internal::MultiIndexV2::open((const std::__fs::filesystem::path *)(v1 + 168));
  LODWORD(result) = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::open(v1);
  if ((int)result >= v4) {
    return v4;
  }
  else {
    return result;
  }
}

uint64_t skit::IndexReader::close(skit::IndexReader *this)
{
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0xFFFFFFFFLL;
  }
  skit::internal::MultiIndexV2::close((void ****)(v1 + 168));

  return skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close((void *)v1);
}

uint64_t *skit::IndexReader::populate_docs(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  if (*result)
  {
    long long v3 = *(uint64_t **)(v2 + 192);
    for (uint64_t i = *(uint64_t **)(v2 + 200);
          v3 != i;
          uint64_t result = (uint64_t *)skit::internal::DiskMetaStore::populate_doc(v6 + 168, *a2, a2[1]))
    {
      uint64_t v6 = *v3++;
    }
  }
  return result;
}

unint64_t skit::IndexReader::get_doc(uint64_t a1, skit::internal *this)
{
  if (*(void *)a1) {
    return skit::internal::MultiIndexV2::get_doc<skit::Uuid>(*(uint64_t **)(*(void *)a1 + 192), *(uint64_t **)(*(void *)a1 + 200), this);
  }
  else {
    return 0;
  }
}

unint64_t skit::internal::MultiIndexV2::get_doc<skit::Uuid>(uint64_t *a1, uint64_t *a2, skit::internal *this)
{
  if (a1 == a2) {
    return 0;
  }
  uint64_t v5 = a1;
  while (1)
  {
    uint64_t v6 = *v5;
    int v7 = *(_DWORD **)(*v5 + 224);
    if (v7)
    {
      unsigned int v8 = skit::internal::murmur3_32(this, 0x10uLL, 0);
      unsigned int v9 = v7[1];
      unsigned int v10 = 16 * ((*v7 ^ (v8 >> 7)) % v9);
      unint64_t v11 = 16 * v9;
      uint64_t v12 = (uint64_t)&v7[v11 / 4 + 4];
      while (1)
      {
        uint64_t v13 = v10;
        int v14 = *((unsigned __int8 *)v7 + v10 + 16);
        if (v14 == (v8 & 0x7F))
        {
          int v15 = (uint64_t *)(v12 + 20 * v13);
          uint64_t v17 = *v15;
          uint64_t v16 = v15[1];
          if (*(void *)this == v17 && *((void *)this + 1) == v16) {
            break;
          }
        }
        if (v14 == 128) {
          goto LABEL_13;
        }
        unsigned int v10 = ((int)v13 + 1) % v11;
      }
      if (v11 - 1 != v13) {
        break;
      }
    }
LABEL_13:
    if (++v5 == a2) {
      return 0;
    }
  }
  if (!*(void *)(v6 + 288)) {
    return 0;
  }
  return skit::internal::DiskMetaStore::get_doc_internal((skit::internal::DiskMetaStore *)(v6 + 168), *(_DWORD *)(v12 + 20 * v13 + 16));
}

unint64_t skit::IndexReader::get_doc(skit::IndexReader *this, uint64_t a2)
{
  uint64_t v3 = a2;
  if (*(void *)this) {
    return skit::internal::MultiIndexV2::get_doc<long long>(*(uint64_t **)(*(void *)this + 192), *(uint64_t **)(*(void *)this + 200), &v3);
  }
  else {
    return 0;
  }
}

unint64_t skit::internal::MultiIndexV2::get_doc<long long>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  if (a1 == a2) {
    return 0;
  }
  uint64_t v3 = *a3;
  while (1)
  {
    uint64_t v4 = *a1;
    uint64_t v5 = *(void *)(*a1 + 192);
    uint64_t v6 = *(void *)(v5 + 32);
    if (v3 >= v6 && *(void *)(v5 + 40) > v3) {
      break;
    }
    if (++a1 == a2) {
      return 0;
    }
  }
  if (!*(void *)(v4 + 288)) {
    return 0;
  }
  return skit::internal::DiskMetaStore::get_doc_internal((skit::internal::DiskMetaStore *)(v4 + 168), (int)v3 - (int)v6);
}

void skit::IndexReader::search(void *a1, unint64_t *a2, void *a3, uint64_t a4)
{
  if (*a1)
  {
    unsigned int v4 = *(_DWORD *)(a4 + 8);
    unsigned int v5 = *(_DWORD *)(a4 + 12);
    unsigned int v6 = *(_DWORD *)(a4 + 16);
    float v7 = *(float *)(a4 + 20);
    int v8 = *(unsigned __int8 *)(a4 + 24);
    unsigned int v9 = (void *)(*a1 + 168);
    int v10 = *(_DWORD *)(a4 + 4);
    skit::internal::MultiIndexV2::search(v9, a2, a3, v10, v4, v5, v6, v8, v7);
  }
  else
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    unint64_t v11 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_error_impl(&dword_1D2EDA000, v11, OS_LOG_TYPE_ERROR, "IndexReader::search : reader is not initialized", v12, 2u);
    }
  }
}

uint64_t skit::IndexReader::segment_cnt(skit::IndexReader *this)
{
  if (*(void *)this) {
    return (*(void *)(*(void *)this + 200) - *(void *)(*(void *)this + 192)) >> 3;
  }
  else {
    return 0;
  }
}

uint64_t skit::IndexReader::size_bytes(skit::IndexReader *this)
{
  if (*(void *)this) {
    return skit::internal::MultiIndexV2::disk_index_size(*(skit::internal::IndexDiskImplV2 ***)(*(void *)this + 192), *(skit::internal::MultiIndexV2 **)(*(void *)this + 200));
  }
  else {
    return 0;
  }
}

uint64_t skit::IndexReader::size(skit::IndexReader *this)
{
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  uint64_t v2 = *(uint64_t **)(v1 + 192);
  uint64_t v3 = *(uint64_t **)(v1 + 200);
  if (v2 == v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *v2++;
      v4 += *(unsigned int *)(*(void *)(v5 + 192) + 12);
    }
    while (v2 != v3);
  }
  return v4 + *(unsigned int *)(v1 + 276);
}

uint64_t skit::IndexReader::record_cnt(skit::IndexReader *this)
{
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  uint64_t v2 = *(uint64_t **)(v1 + 192);
  uint64_t v3 = *(uint64_t **)(v1 + 200);
  if (v2 == v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *v2++;
      v4 += (*(_DWORD *)(*(void *)(v5 + 192) + 12) - *(_DWORD *)(*(void *)(v5 + 192) + 16));
    }
    while (v2 != v3);
  }
  return v4 + (*(_DWORD *)(v1 + 276) - *(_DWORD *)(v1 + 280));
}

uint64_t skit::IndexReader::last_ts(skit::IndexReader *this)
{
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  uint64_t v3 = *(void *)(v1 + 192);
  uint64_t v2 = *(void *)(v1 + 200);
  if (v3 == v2) {
    return -1;
  }
  uint64_t v4 = *(void *)(*(void *)(v2 - 8) + 24);
  if (!v4) {
    return -1;
  }
  else {
    return *(void *)(v4 + 32);
  }
}

uint64_t skit::IndexReader::index_count_threshold(skit::IndexReader *this, unint64_t a2)
{
  if (*(void *)this) {
    return skit::internal::MultiIndexV2::index_count_threshold(*(skit::internal::IndexDiskImplV2 ***)(*(void *)this + 192), *(skit::internal::MultiIndexV2 **)(*(void *)this + 200), a2);
  }
  else {
    return 0;
  }
}

BOOL skit::IndexReader::should_merge(skit::IndexReader *this, unint64_t a2)
{
  return *(void *)this
      && skit::internal::MultiIndexV2::should_merge((skit::internal::MultiIndexV2 *)(*(void *)this + 168), a2);
}

skit::internal::StringRegistry *skit::IndexReader::get_registered_str(skit::internal::StringRegistry **this, unsigned int a2)
{
  uint64_t result = *this;
  if (result) {
    return (skit::internal::StringRegistry *)skit::internal::StringRegistry::get_str(result, a2);
  }
  return result;
}

void *skit::IndexReader::is_registered_str(void **a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  uint64_t result = *a1;
  if (result) {
    return (void *)skit::internal::StringRegistry::is_registered(result, a2, a3);
  }
  return result;
}

void *skit::IndexWriter::IndexWriter(void *this)
{
  *this = 0;
  return this;
}

{
  *this = 0;
  return this;
}

void *skit::IndexWriter::IndexWriter(void *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  void *result = v2;
  return result;
}

{
  uint64_t v2;

  uint64_t v2 = *a2;
  *a2 = 0;
  void *result = v2;
  return result;
}

void skit::IndexWriter::IndexWriter()
{
}

{
  std::make_unique[abi:ne180100]<skit::internal::IndexWriterImpl,skit::Uuid,std::__fs::filesystem::path,std::__fs::filesystem::path>();
}

void std::make_unique[abi:ne180100]<skit::internal::IndexWriterImpl,skit::Uuid,std::__fs::filesystem::path,std::__fs::filesystem::path>()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  operator new();
}

void sub_1D2EFB7E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 + 39) < 0) {
    operator delete(*(void **)(v21 + 16));
  }
  if (v23 < 0) {
    operator delete(v22);
  }
  MEMORY[0x1D942C720](v21, 0x10F2C40C21DFD4FLL);
  _Unwind_Resume(a1);
}

uint64_t *skit::IndexWriter::operator=(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *a2 = 0;
  std::unique_ptr<skit::internal::IndexWriterImpl>::reset[abi:ne180100](a1, v3);
  return a1;
}

uint64_t *std::unique_ptr<skit::internal::IndexWriterImpl>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  void *result = a2;
  if (v2)
  {
    skit::internal::IndexWriterImpl::abort_txn((skit::internal::IndexWriterImpl *)v2);
    skit::internal::MultiIndexV2::~MultiIndexV2((skit::internal::MultiIndexV2 *)(v2 + 208), v3);
    skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::~KvStore(v2 + 40);
    if (*(char *)(v2 + 39) < 0) {
      operator delete(*(void **)(v2 + 16));
    }
    JUMPOUT(0x1D942C720);
  }
  return result;
}

void skit::IndexWriter::~IndexWriter(skit::internal::IndexWriterImpl **this)
{
  uint64_t v2 = *this;
  if (v2) {
    skit::internal::IndexWriterImpl::abort_txn(v2);
  }
  std::unique_ptr<skit::internal::IndexWriterImpl>::reset[abi:ne180100]((uint64_t *)this, 0);
}

void *skit::IndexWriter::id(skit::IndexWriter *this)
{
  if (*(void *)this) {
    return *(void **)this;
  }
  else {
}
  }

uint64_t *skit::IndexWriter::set_mode(uint64_t *this, __int16 a2)
{
  uint64_t v2 = *this;
  if (*this)
  {
    *(_WORD *)(v2 + 504) = a2 & 0x1FF;
    *(_WORD *)(v2 + 200) = a2 & 0x1FF;
  }
  return this;
}

void skit::IndexWriter::set_dp_class(skit::IndexWriter *this, int a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)this;
  if (*(void *)this)
  {
    if ((a2 - 8) <= 0xFFFFFFF6)
    {
      if (skit::internal::get_logging_context(void)::once != -1) {
      uint64_t v4 = skit::internal::get_logging_context(void)::logger;
      }
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
      {
        v5[0] = 67109120;
        v5[1] = a2;
        _os_log_fault_impl(&dword_1D2EDA000, v4, OS_LOG_TYPE_FAULT, "MultiIndexV2 : invalid protection class %d", (uint8_t *)v5, 8u);
      }
    }
    *(_DWORD *)(v2 + 500) = a2;
    skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::set_dp_class(v2 + 40, a2);
  }
}

uint64_t skit::IndexWriter::set_term_index_write_cache(uint64_t this, uint64_t a2)
{
  if (*(void *)this) {
    *(void *)(*(void *)this + 512) = a2;
  }
  return this;
}

uint64_t skit::IndexWriter::set_doc_store_write_cache(uint64_t this, uint64_t a2)
{
  if (*(void *)this) {
    *(void *)(*(void *)this + 520) = a2;
  }
  return this;
}

BOOL skit::IndexWriter::is_active(skit::IndexWriter *this)
{
  return *(void *)this && *(unsigned char *)(*(void *)this + 528) != 0;
}

uint64_t skit::IndexWriter::start_txn(skit::IndexWriter *this)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0xFFFFFFFFLL;
  }
  if (skit::internal::get_logging_context(void)::once != -1) {
  uint64_t v2 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = (const char **)(v1 + 16);
    if (*(char *)(v1 + 39) < 0) {
      uint64_t v3 = (const char **)*v3;
    }
    int v15 = 68289282;
    int v16 = 16;
    __int16 v17 = 2098;
    uint64_t v18 = v1;
    __int16 v19 = 2082;
    uint64_t v20 = v3;
    _os_log_impl(&dword_1D2EDA000, v2, OS_LOG_TYPE_INFO, "IndexWriterImpl::start_txn : starting transaction %{public,uuid_t}.16P @ %{public}s", (uint8_t *)&v15, 0x1Cu);
  }
  if (*(unsigned char *)(v1 + 528))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v9 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT)) {
      return 0xFFFFFFFFLL;
    }
    int v15 = 68289026;
    int v16 = 16;
    __int16 v17 = 2098;
    uint64_t v18 = v1;
    int v10 = "IndexWriterImpl::start_txn : transaction %{public,uuid_t}.16P has already been started";
    unint64_t v11 = v9;
    uint32_t v12 = 18;
LABEL_30:
    _os_log_fault_impl(&dword_1D2EDA000, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v15, v12);
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = (const char **)(v1 + 16);
  uint64_t v5 = (const char *)(v1 + 16);
  if (*(char *)(v1 + 39) < 0) {
    uint64_t v5 = *v4;
  }
  uint64_t v6 = (const char **)(v1 + 208);
  float v7 = (const char *)(v1 + 208);
  if (*(char *)(v1 + 231) < 0) {
    float v7 = *v6;
  }
  if (copyfile(v5, v7, 0, 0x10E800Fu))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v13 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT)) {
      return 0xFFFFFFFFLL;
    }
    if (*(char *)(v1 + 39) < 0) {
      uint64_t v4 = (const char **)*v4;
    }
    if (*(char *)(v1 + 231) < 0) {
      uint64_t v6 = (const char **)*v6;
    }
    int v14 = *__error();
    int v15 = 68289794;
    int v16 = 16;
    __int16 v17 = 2098;
    uint64_t v18 = v1;
    __int16 v19 = 2082;
    uint64_t v20 = v4;
    __int16 v21 = 2082;
    long long v22 = v6;
    __int16 v23 = 1024;
    int v24 = v14;
    int v10 = "IndexWriterImpl::start_txn : transaction %{public,uuid_t}.16P file clone failed @ %{public}s  ->  %{public}s :"
          " %{darwin.errno}d";
    unint64_t v11 = v13;
    uint32_t v12 = 44;
    goto LABEL_30;
  }
  if (skit::internal::MultiIndexV2::open((const std::__fs::filesystem::path *)(v1 + 208))) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::open(v1 + 40);
  if (result) {
    return 0xFFFFFFFFLL;
  }
  *(unsigned char *)(v1 + 528) = 1;
  return result;
}

uint64_t skit::IndexWriter::end_txn(skit::IndexWriter *this)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0xFFFFFFFFLL;
  }
  if (!*(unsigned char *)(v1 + 528))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    __int16 v19 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_FAULT))
    {
      int v28 = 68289026;
      *(_DWORD *)uint64_t v29 = 16;
      *(_WORD *)&v29[4] = 2098;
      *(void *)&v29[6] = v1;
      _os_log_fault_impl(&dword_1D2EDA000, v19, OS_LOG_TYPE_FAULT, "IndexWriterImpl::end_txn : transaction %{public,uuid_t}.16P is not active", (uint8_t *)&v28, 0x12u);
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = (const char **)(v1 + 208);
  skit::internal::MultiIndexV2::close((void ****)(v1 + 208));
  skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::flush(v1 + 40, 1);
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::close((void *)(v1 + 40)))
  {
LABEL_45:
    skit::internal::IndexWriterImpl::abort_txn((skit::internal::IndexWriterImpl *)v1);
    return 0xFFFFFFFFLL;
  }
  if (*(unsigned char *)(v1 + 529))
  {
    uint64_t v4 = (const char *)(v1 + 208);
    if (*(char *)(v1 + 231) < 0) {
      uint64_t v4 = *v2;
    }
    uint64_t v5 = (const char **)(v1 + 16);
    uint64_t v6 = (const char *)(v1 + 16);
    if (*(char *)(v1 + 39) < 0) {
      uint64_t v6 = *v5;
    }
    if (renamex_np(v4, v6, 2u))
    {
      if (skit::internal::get_logging_context(void)::once != -1) {
      long long v22 = skit::internal::get_logging_context(void)::logger;
      }
      if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(v1 + 231) < 0) {
          uint64_t v2 = (const char **)*v2;
        }
        if (*(char *)(v1 + 39) < 0) {
          uint64_t v5 = (const char **)*v5;
        }
        int v26 = *__error();
        int v28 = 136446722;
        *(void *)uint64_t v29 = v2;
        *(_WORD *)&v29[8] = 2082;
        *(void *)&v29[10] = v5;
        *(_WORD *)&v29[18] = 1024;
        *(_DWORD *)&v29[20] = v26;
        _os_log_error_impl(&dword_1D2EDA000, v22, OS_LOG_TYPE_ERROR, "IndexWriterImpl::end_txn : failed to move transaction directory @ %{public}s ->  %{public}s : %{darwin.errno}d", (uint8_t *)&v28, 0x1Cu);
      }
      goto LABEL_45;
    }
  }
  float v7 = (const std::__fs::filesystem::path *)(v1 + 208);
  if (*(char *)(v1 + 231) < 0) {
    float v7 = (const std::__fs::filesystem::path *)*v2;
  }
  if (skit::internal::remove_all(v7, v3))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v20 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      if (*(char *)(v1 + 231) < 0) {
        uint64_t v2 = (const char **)*v2;
      }
      int v21 = *__error();
      int v28 = 136446466;
      *(void *)uint64_t v29 = v2;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = v21;
      _os_log_error_impl(&dword_1D2EDA000, v20, OS_LOG_TYPE_ERROR, "IndexWriterImpl::end_txn : failed to remove transaction directory @ %{public}s : %{darwin.errno}d", (uint8_t *)&v28, 0x12u);
    }
  }
  if (!*(unsigned char *)(v1 + 529)) {
    goto LABEL_22;
  }
  int v8 = (const char **)(v1 + 16);
  uint64_t v9 = (const char *)(v1 + 16);
  if (*(char *)(v1 + 39) < 0) {
    uint64_t v9 = *v8;
  }
  int v10 = open(v9, 0);
  if (v10 < 0)
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    __int16 v23 = skit::internal::get_logging_context(void)::logger;
    }
    if (!os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_56;
    }
    if (*(char *)(v1 + 39) < 0) {
      int v8 = (const char **)*v8;
    }
    int v24 = *__error();
    int v28 = 136315394;
    *(void *)uint64_t v29 = v8;
    *(_WORD *)&v29[8] = 1024;
    *(_DWORD *)&v29[10] = v24;
    uint64_t v25 = "IndexWriterImpl::end_txn : failed to open index directory @ %s : %{darwin.errno}d";
LABEL_65:
    _os_log_error_impl(&dword_1D2EDA000, v23, OS_LOG_TYPE_ERROR, v25, (uint8_t *)&v28, 0x12u);
LABEL_22:
    uint64_t v13 = skit::internal::get_logging_context(void)::once;
    *(_WORD *)(v1 + 528) = 0;
    if (v13 != -1) {
    goto LABEL_24;
    }
  }
  int v11 = v10;
  if (fcntl(v10, 85))
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint32_t v12 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      __int16 v17 = (const char *)(v1 + 16);
      if (*(char *)(v1 + 39) < 0) {
        __int16 v17 = *v8;
      }
      int v18 = *__error();
      int v28 = 136315394;
      *(void *)uint64_t v29 = v17;
      *(_WORD *)&v29[8] = 1024;
      *(_DWORD *)&v29[10] = v18;
      _os_log_error_impl(&dword_1D2EDA000, v12, OS_LOG_TYPE_ERROR, "IndexWriterImpl::end_txn : failed fcntl barrier @ %s : %{darwin.errno}d", (uint8_t *)&v28, 0x12u);
    }
  }
  if (!close(v11)) {
    goto LABEL_22;
  }
  if (skit::internal::get_logging_context(void)::once != -1) {
  __int16 v23 = skit::internal::get_logging_context(void)::logger;
  }
  if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
  {
    if (*(char *)(v1 + 39) < 0) {
      int v8 = (const char **)*v8;
    }
    int v27 = *__error();
    int v28 = 136315394;
    *(void *)uint64_t v29 = v8;
    *(_WORD *)&v29[8] = 1024;
    *(_DWORD *)&v29[10] = v27;
    uint64_t v25 = "IndexWriterImpl::end_txn : failed to close index directory @ %s : %{darwin.errno}d";
    goto LABEL_65;
  }
LABEL_56:
  *(_WORD *)(v1 + 528) = 0;
LABEL_24:
  int v14 = skit::internal::get_logging_context(void)::logger;
  uint64_t result = os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO);
  if (result)
  {
    int v16 = (void *)(v1 + 16);
    if (*(char *)(v1 + 39) < 0) {
      int v16 = (void *)*v16;
    }
    int v28 = 68158210;
    *(_DWORD *)uint64_t v29 = 16;
    *(_WORD *)&v29[4] = 2096;
    *(void *)&v29[6] = v1;
    *(_WORD *)&v29[14] = 2082;
    *(void *)&v29[16] = v16;
    _os_log_impl(&dword_1D2EDA000, v14, OS_LOG_TYPE_INFO, "IndexWriterImpl::end_txn : completed transaction %{uuid_t}.16P @ %{public}s", (uint8_t *)&v28, 0x1Cu);
    return 0;
  }
  return result;
}

uint64_t skit::IndexWriter::abort_txn(skit::internal::IndexWriterImpl **this)
{
  uint64_t v1 = *this;
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  skit::internal::IndexWriterImpl::abort_txn(v1);
  return 0;
}

uint64_t skit::IndexWriter::append(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, iovec *a5, int a6, float a7)
{
  uint64_t v7 = *a1;
  if (!*a1) {
    return 0;
  }
  *(unsigned char *)(v7 + 529) = 1;
  return skit::internal::MultiIndexV2::append(v7 + 208, *a2, a2[1], a3, a4, a5, a6, 1, a7);
}

uint64_t skit::IndexWriter::append(uint64_t *a1, unsigned __int8 *a2, uint64_t *a3, uint64_t a4, uint64_t a5, iovec *a6, int a7, float a8)
{
  uint64_t v8 = *a1;
  if (!*a1) {
    return 0;
  }
  int v9 = *a2;
  *(unsigned char *)(v8 + 529) = 1;
  return skit::internal::MultiIndexV2::append(v8 + 208, *a3, a3[1], a4, a5, a6, a7, v9, a8);
}

uint64_t skit::IndexWriter::clear(char **this)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *this;
  if (*this && v1[528])
  {
    v1[529] = 1;
    skit::internal::MultiIndexV2::clear((skit::internal::MultiIndexV2 *)(v1 + 208));
    if (!skit::internal::MultiIndexV2::open((const std::__fs::filesystem::path *)(v1 + 208)))
    {
      skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::clear((uint64_t)(v1 + 40));
      return 0;
    }
    if (skit::internal::get_logging_context(void)::once != -1) {
    uint64_t v3 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v1 + 16;
      if (v1[39] < 0) {
        uint64_t v4 = (void *)*v4;
      }
      v5[0] = 68289282;
      v5[1] = 16;
      __int16 v6 = 2098;
      uint64_t v7 = v1;
      __int16 v8 = 2082;
      int v9 = v4;
      _os_log_impl(&dword_1D2EDA000, v3, OS_LOG_TYPE_INFO, "IndexWriterImpl::abort_txn : clear  transaction %{public,uuid_t}.16P @ %{public}s", (uint8_t *)v5, 0x1Cu);
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t skit::IndexWriter::flush(skit::IndexWriter *this)
{
  if (*(void *)this) {
    return skit::internal::MultiIndexV2::flush((skit::internal::MultiIndexV2 *)(*(void *)this + 208));
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t skit::IndexWriter::flush_threshold(skit::IndexWriter *this)
{
  if (*(void *)this) {
    return *(void *)(*(void *)this + 488);
  }
  else {
    return 0;
  }
}

uint64_t skit::IndexWriter::flush_threshold(uint64_t this, unint64_t a2)
{
  if (*(void *)this)
  {
    unint64_t v2 = 100663296;
    if (a2 < 0x6000000) {
      unint64_t v2 = a2;
    }
    if (v2 <= 0x100000) {
      unint64_t v2 = 0x100000;
    }
    *(void *)(*(void *)this + 488) = v2;
  }
  return this;
}

uint64_t skit::IndexWriter::segment_cnt(skit::IndexWriter *this)
{
  if (*(void *)this) {
    return (*(void *)(*(void *)this + 240) - *(void *)(*(void *)this + 232)) >> 3;
  }
  else {
    return 0;
  }
}

uint64_t skit::IndexWriter::size_bytes(skit::IndexWriter *this)
{
  if (*(void *)this) {
    return skit::internal::MultiIndexV2::disk_index_size(*(skit::internal::IndexDiskImplV2 ***)(*(void *)this + 232), *(skit::internal::MultiIndexV2 **)(*(void *)this + 240));
  }
  else {
    return 0;
  }
}

uint64_t skit::IndexWriter::size(skit::IndexWriter *this)
{
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  unint64_t v2 = *(uint64_t **)(v1 + 232);
  uint64_t v3 = *(uint64_t **)(v1 + 240);
  if (v2 == v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *v2++;
      v4 += *(unsigned int *)(*(void *)(v5 + 192) + 12);
    }
    while (v2 != v3);
  }
  return v4 + *(unsigned int *)(v1 + 316);
}

uint64_t skit::IndexWriter::record_cnt(skit::IndexWriter *this)
{
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  unint64_t v2 = *(uint64_t **)(v1 + 232);
  uint64_t v3 = *(uint64_t **)(v1 + 240);
  if (v2 == v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *v2++;
      v4 += (*(_DWORD *)(*(void *)(v5 + 192) + 12) - *(_DWORD *)(*(void *)(v5 + 192) + 16));
    }
    while (v2 != v3);
  }
  return v4 + (*(_DWORD *)(v1 + 316) - *(_DWORD *)(v1 + 320));
}

uint64_t skit::IndexWriter::last_ts(skit::IndexWriter *this)
{
  uint64_t v1 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  uint64_t v3 = *(void *)(v1 + 232);
  uint64_t v2 = *(void *)(v1 + 240);
  if (v3 == v2) {
    return -1;
  }
  uint64_t v4 = *(void *)(*(void *)(v2 - 8) + 24);
  if (!v4) {
    return -1;
  }
  else {
    return *(void *)(v4 + 32);
  }
}

uint64_t skit::IndexWriter::index_count_threshold(skit::IndexWriter *this, unint64_t a2)
{
  uint64_t v2 = *(void *)this;
  if (*(void *)this && *(unsigned char *)(v2 + 528)) {
    return skit::internal::MultiIndexV2::index_count_threshold(*(skit::internal::IndexDiskImplV2 ***)(v2 + 232), *(skit::internal::MultiIndexV2 **)(v2 + 240), a2);
  }
  else {
    return 0;
  }
}

BOOL skit::IndexWriter::should_merge(skit::IndexWriter *this)
{
  uint64_t v1 = *(void *)this;
  return *(void *)this
      && *(unsigned char *)(v1 + 528)
      && skit::internal::MultiIndexV2::should_merge((skit::internal::MultiIndexV2 *)(v1 + 208), *(void *)(v1 + 488));
}

uint64_t skit::IndexWriter::merge_indexes(skit::IndexWriter *this)
{
  if (*(void *)this) {
    return 0;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

BOOL skit::IndexWriter::set_doc_wgt(uint64_t *a1, skit::internal *this, float a3)
{
  uint64_t v3 = *a1;
  if (!*a1) {
    return 0;
  }
  *(unsigned char *)(v3 + 529) = 1;
  uint64_t v6 = *(void *)(v3 + 232);
  uint64_t v7 = *(void *)(v3 + 240);
  while (v6 != v7)
  {
    if (skit::internal::DiskMetaStore::set_doc_wgt((void *)(*(void *)v6 + 168), this, a3)) {
      return 1;
    }
    v6 += 8;
  }

  return skit::internal::MemMetaStore::set_doc_wgt(v3 + 304, this, a3);
}

unint64_t skit::IndexWriter::get_doc(uint64_t a1, skit::internal *this)
{
  if (*(void *)a1) {
    return skit::internal::MultiIndexV2::get_doc<skit::Uuid>(*(uint64_t **)(*(void *)a1 + 232), *(uint64_t **)(*(void *)a1 + 240), this);
  }
  else {
    return 0;
  }
}

unint64_t skit::IndexWriter::get_doc(skit::IndexWriter *this, uint64_t a2)
{
  uint64_t v3 = a2;
  if (*(void *)this) {
    return skit::internal::MultiIndexV2::get_doc<long long>(*(uint64_t **)(*(void *)this + 232), *(uint64_t **)(*(void *)this + 240), &v3);
  }
  else {
    return 0;
  }
}

BOOL skit::IndexWriter::erase(uint64_t *a1, long long *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  if (!*a1) {
    return 0;
  }
  *(unsigned char *)(v2 + 529) = 1;
  long long v6 = *a2;
  uint64_t v3 = *(void *)(v2 + 232);
  uint64_t v4 = *(void *)(v2 + 240);
  while (1)
  {
    if (v3 == v4) {
      return skit::internal::MemMetaStore::set_doc_wgt(v2 + 304, (skit::internal *)&v6, 0.0);
    }
    if (skit::internal::DiskMetaStore::set_doc_wgt((void *)(*(void *)v3 + 168), (skit::internal *)&v6, 0.0)) {
      break;
    }
    v3 += 8;
  }
  return 1;
}

unint64_t skit::IndexWriter::register_str(uint64_t *a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  uint64_t v3 = *a1;
  if (!*a1 || !*(unsigned char *)(v3 + 528)) {
    return -1;
  }
  *(unsigned char *)(v3 + 529) = 1;
  return skit::internal::StringRegistry::put_str(v3 + 40, a2, a3);
}

uint64_t skit::IndexWriter::get_registered_str(skit::IndexWriter *this, unsigned int a2)
{
  uint64_t v2 = *(void *)this;
  if (*(void *)this && *(unsigned char *)(v2 + 528)) {
    return skit::internal::StringRegistry::get_str((skit::internal::StringRegistry *)(v2 + 40), a2);
  }
  else {
    return 0;
  }
}

BOOL skit::IndexWriter::is_registered_str(uint64_t *a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  uint64_t v3 = *a1;
  return *a1 && *(unsigned char *)(v3 + 528) && skit::internal::StringRegistry::is_registered((void *)(v3 + 40), a2, a3);
}

BOOL skit::IndexWriter::erase_registered_str(uint64_t *a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  uint64_t v3 = *a1;
  if (!*a1) {
    return 0;
  }
  if (!*(unsigned char *)(v3 + 528)) {
    return 0;
  }
  *(unsigned char *)(v3 + 529) = 1;
  v9[0] = a2;
  v9[1] = a3;
  if (!*(void *)(v3 + 64)
    || skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file(v3 + 40))
  {
    return 0;
  }
  for (unsigned int i = skit::internal::murmur3_32((skit::internal *)a2, 2 * (void)a3, *(_DWORD *)(*(void *)(v3 + 64) + 12)) & 0x7FFFFFFF;
        !skit::internal::StringRegistry::lookup((void *)(v3 + 40), i, v9);
        ++i)
  {
    if (!v8) {
      return 0;
    }
  }
  return skit::internal::StringRegistry::erase_internal((skit::internal::StringRegistry *)(v3 + 40), i);
}

BOOL skit::IndexWriter::erase_registered_str(skit::IndexWriter *this, unsigned int a2)
{
  uint64_t v2 = *(void *)this;
  if (!*(void *)this) {
    return 0;
  }
  if (!*(unsigned char *)(v2 + 528)) {
    return 0;
  }
  *(unsigned char *)(v2 + 529) = 1;
  if (!*(void *)(v2 + 64)) {
    return 0;
  }
  uint64_t v4 = (skit::internal::StringRegistry *)(v2 + 40);
  if (skit::KvStore<std::u16string_view,64u,skit::Hash32<std::u16string_view>,std::equal_to<void>>::mmap_data_file(v2 + 40)) {
    return 0;
  }

  return skit::internal::StringRegistry::erase_internal(v4, a2);
}

BOOL skit::NumberFilter::filter(uint64_t a1, _WORD *a2, unint64_t a3)
{
  unint64_t v3 = ((*a2 - 43) & 0xFFFD) == 0;
  if (a3 <= v3) {
    return 0;
  }
  unsigned int v4 = 0;
  int v5 = 0;
  unsigned int v6 = v3 + 1;
  uint64_t v7 = ((*a2 - 43) & 0xFFFD) == 0;
  do
  {
    int v8 = (unsigned __int16)a2[v7];
    if (v8 == 46) {
      ++v4;
    }
    if ((v8 - 48) < 0xA) {
      ++v5;
    }
    uint64_t v7 = v6;
  }
  while (a3 > v6++);
  return v4 <= 1 && v5 != 0 && a3 == v5 + v3 + v4;
}

void non-virtual thunk to'skit::NumberFilter::~NumberFilter(skit::NumberFilter *this)
{
}

void skit::NumberFilter::filter(skit::NumberFilter *this, skit::TokenStream *a2, unint64_t a3)
{
  unint64_t v3 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 1) - *(void *)a2) >> 4);
  uint64_t v4 = v3 - a3;
  if (v3 > a3)
  {
    uint64_t v7 = 48 * a3;
    do
    {
      skit::NumberFilter::filter((uint64_t)this, (float *)(*(void *)a2 + v7));
      v7 += 48;
      --v4;
    }
    while (v4);
  }
}

float skit::NumberFilter::filter(uint64_t a1, float *a2)
{
  uint64_t v2 = a2;
  unint64_t v4 = *((void *)a2 + 1);
  if (*((char *)a2 + 23) >= 0)
  {
    unint64_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else
  {
    a2 = *(float **)a2;
    unint64_t v5 = v4;
  }
  if (skit::NumberFilter::filter(a1, a2, v5))
  {
    float result = *(float *)(a1 + 16) * v2[8];
    v2[8] = result;
    *((_WORD *)v2 + 20) = (*((_WORD *)v2 + 20) | *(_WORD *)(a1 + 20) & 4) & (~*(_WORD *)(a1 + 20) | 0xFFFE);
  }
  return result;
}

void skit::NumberFilter::~NumberFilter(skit::NumberFilter *this)
{
}

uint64_t skit::simil(skit *this, const char *a2, const char *a3)
{
  unint64_t v5 = (const char *)strlen((const char *)this);
  uint64_t v7 = (const char *)strlen(a2);
  uint64_t result = 0;
  if (v5)
  {
    if (v7) {
      return ((int)(200 * skit::rsimil(this, v5, (uint64_t)a2, v7, 1, v6)) / ((int)v7 + (int)v5));
    }
  }
  return result;
}

uint64_t skit::rsimil(skit *this, const char *a2, uint64_t a3, const char *a4, int a5, int a6)
{
  if ((int)a2 < 1) {
    return 0;
  }
  int v6 = a5;
  int v7 = (int)a4;
  uint64_t v8 = a3;
  int v9 = this;
  uint64_t v10 = 0;
  int v11 = 0;
  uint64_t v47 = 0;
  uint64_t v12 = (int)a4;
  uint64_t v45 = a3 + 1;
  unsigned int v42 = (char *)this + 1;
  unint64_t v13 = a2;
  int v43 = (int)a2;
  do
  {
    if (v11 < v7)
    {
      uint64_t v14 = 0;
      int v15 = &v42[v10];
      do
      {
        __darwin_ct_rune_t v16 = *((char *)v9 + v10);
        if (v6)
        {
          if (*(unsigned __int8 *)(v8 + v14) == v16
            && *((unsigned __int8 *)v9 + v11 + (uint64_t)(int)v10) == *(unsigned __int8 *)(v8 + v11 + (uint64_t)(int)v14))
          {
            uint64_t v17 = 0;
            do
            {
              int v18 = v15[v17];
              int v19 = *(unsigned __int8 *)(v45 + v14 + v17++);
              unint64_t v20 = v10 + v17;
            }
            while (v17 + v14 < v12 && v20 < v13 && v18 == v19);
            int v23 = v17;
            if ((int)v17 > v11) {
              unsigned int v24 = v10;
            }
            else {
              unsigned int v24 = v47;
            }
            unsigned int v25 = HIDWORD(v47);
            if (v23 > v11) {
              unsigned int v25 = v14;
            }
            uint64_t v47 = (char *)__PAIR64__(v25, v24);
            if (v23 > v11) {
              int v11 = v20 - v10;
            }
          }
        }
        else
        {
          __darwin_ct_rune_t v26 = __tolower(v16);
          if (v26 == __tolower(*(char *)(v8 + v14)))
          {
            __darwin_ct_rune_t v27 = __tolower(*((char *)this + v11 + (uint64_t)(int)v10));
            uint64_t v8 = a3;
            if (v27 == __tolower(*(char *)(a3 + v11 + (uint64_t)(int)v14)))
            {
              uint64_t v28 = 0;
              do
              {
                __darwin_ct_rune_t v29 = __tolower(v15[v28]);
                __darwin_ct_rune_t v30 = __tolower(*(char *)(v45 + v14 + v28));
                unint64_t v31 = v10 + v28 + 1;
                if (v31 >= v13) {
                  break;
                }
              }
              while (v29 == v30 && (int)v14 + (int)v28++ + 1 < v7);
              int v33 = v31 - v10;
              if (v33 > v11) {
                unsigned int v34 = v10;
              }
              else {
                unsigned int v34 = v47;
              }
              unsigned int v35 = HIDWORD(v47);
              if (v33 > v11) {
                unsigned int v35 = v14;
              }
              uint64_t v47 = (char *)__PAIR64__(v35, v34);
              if (v33 > v11) {
                int v11 = v33;
              }
              int v6 = a5;
              uint64_t v8 = a3;
            }
          }
          int v9 = this;
        }
        ++v14;
      }
      while (v14 < v7 - v11);
    }
    ++v10;
  }
  while (v10 < v43 - v11);
  if (!v11) {
    return 0;
  }
  int v36 = 0;
  if (v47)
  {
    int v37 = HIDWORD(v47);
    if (HIDWORD(v47))
    {
      int v38 = skit::rsimil(v9, (const char *)v47, v8, (const char *)HIDWORD(v47), v6, a6);
      int v9 = this;
      int v36 = v38;
    }
  }
  else
  {
    int v37 = HIDWORD(v47);
  }
  int v40 = 0;
  uint64_t v41 = v11 + (uint64_t)(int)v47;
  if (v43 != v41 && v7 != v11 + v37) {
    int v40 = skit::rsimil((skit *)((char *)v9 + v41), (const char *)(v43 - v41), (int)v8 + v11 + v37, (const char *)(v7 - (v11 + v37)), v6, a6);
  }
  return (v36 + v11 + v40);
}

uint64_t skit::isimil(skit *this, const char *a2, const char *a3)
{
  unint64_t v5 = (const char *)strlen((const char *)this);
  int v7 = (const char *)strlen(a2);
  uint64_t result = 0;
  if (v5)
  {
    if (v7) {
      return ((int)(200 * skit::rsimil(this, v5, (uint64_t)a2, v7, 0, v6)) / ((int)v7 + (int)v5));
    }
  }
  return result;
}

uint64_t skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::max_span_match(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 48);
  if (v1 < 2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    LODWORD(v3) = 0;
    unint64_t v4 = (float *)(v2 + 76);
    for (uint64_t i = 1; i != v1; ++i)
    {
      float v6 = *v4;
      v4 += 16;
      if (v6 <= *(float *)(v2 + ((unint64_t)v3 << 6) + 12)) {
        uint64_t v3 = v3;
      }
      else {
        uint64_t v3 = i;
      }
    }
  }
  return v2 + (v3 << 6);
}

void skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::clear(uint64_t a1)
{
  *(_WORD *)a1 = 0;
  if (*(char *)(a1 + 31) < 0)
  {
    **(_WORD **)(a1 + 8) = 0;
    *(void *)(a1 + 16) = 0;
  }
  else
  {
    *(_WORD *)(a1 + 8) = 0;
    *(unsigned char *)(a1 + 31) = 0;
  }
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  uint64_t v2 = *(unsigned int *)(a1 + 56);
  if (v2)
  {
    uint64_t v3 = v2 << 6;
    uint64_t v4 = *(void *)(a1 + 48) + 48;
    do
    {
      unint64_t v5 = *(void **)(v4 - 16);
      if ((void *)v4 != v5) {
        free(v5);
      }
      v4 += 64;
      v3 -= 64;
    }
    while (v3);
  }
  *(_DWORD *)(a1 + 56) = 0;
}

uint64_t skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::FieldMatchImpl(uint64_t a1, uint64_t a2, skit::SpanMatchV3 *a3)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  float v6 = (std::basic_string<char16_t> *)(a1 + 8);
  if (*(char *)(a2 + 31) < 0)
  {
    std::basic_string<char16_t>::__init_copy_ctor_external(v6, *(const std::basic_string<char16_t>::value_type **)(a2 + 8), *(void *)(a2 + 16));
  }
  else
  {
    long long v7 = *(_OWORD *)(a2 + 8);
    v6->__r_.__value_.__r.__words[2] = *(void *)(a2 + 24);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  skit::SpanMatchV3::SpanMatchV3((skit::SpanMatchV3 *)(a1 + 48), a3);
  unsigned __int32 v8 = *((_DWORD *)a3 + 6);
  unsigned __int32 v9 = *(_DWORD *)(a2 + 40);
  BOOL v10 = v8 >= v9;
  unsigned __int32 v11 = v8 - v9;
  if (v11 != 0 && v10) {
    *(_DWORD *)(a1 + 32) += v11;
  }
  v12.i32[0] = *((_DWORD *)a3 + 5);
  v12.i32[1] = v8;
  *(uint32x2_t *)(a1 + 36) = vmax_u32(*(uint32x2_t *)(a1 + 36), v12);
  return a1;
}

void skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::MergedFieldMatchImpl()
{
  uint64_t v0 = *MEMORY[0x1E4F143B8];
  skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::FieldMatchImpl();
}

{
  while (1)
    ;
}

void sub_1D2EFD2E0(_Unwind_Exception *a1)
{
  skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::~SmallVector(v1);
  _Unwind_Resume(a1);
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::span(uint64_t a1)
{
  return a1 + 488;
}

float skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::score(uint64_t a1)
{
  return *(float *)(a1 + 500);
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::edit_dist(uint64_t a1)
{
  return *(unsigned int *)(a1 + 496);
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::max_token_cnt(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (uint64_t *)result;
  LODWORD(result) = 0;
  uint64_t v3 = *v2;
  uint64_t v4 = 112 * v1;
  unint64_t v5 = (int *)(v3 + 32);
  do
  {
    int v6 = *v5;
    v5 += 28;
    uint64_t result = (v6 + result);
    v4 -= 112;
  }
  while (v4);
  return result;
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::max_code_unit_cnt(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (uint64_t *)result;
  LODWORD(result) = 0;
  uint64_t v3 = *v2;
  uint64_t v4 = 112 * v1;
  unint64_t v5 = (int *)(v3 + 44);
  do
  {
    int v6 = *v5;
    v5 += 28;
    uint64_t result = (v6 + result);
    v4 -= 112;
  }
  while (v4);
  return result;
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::max_stop_word_cnt(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (uint64_t *)result;
  LODWORD(result) = 0;
  uint64_t v3 = *v2;
  uint64_t v4 = 112 * v1;
  unint64_t v5 = (int *)(v3 + 36);
  do
  {
    int v6 = *v5;
    v5 += 28;
    uint64_t result = (v6 + result);
    v4 -= 112;
  }
  while (v4);
  return result;
}

uint64_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::max_alias_token_cnt(uint64_t result)
{
  uint64_t v1 = *(unsigned int *)(result + 8);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = (uint64_t *)result;
  LODWORD(result) = 0;
  uint64_t v3 = *v2;
  uint64_t v4 = 112 * v1;
  unint64_t v5 = (int *)(v3 + 40);
  do
  {
    int v6 = *v5;
    v5 += 28;
    uint64_t result = (v6 + result);
    v4 -= 112;
  }
  while (v4);
  return result;
}

size_t skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::merge(char **a1, uint64_t a2)
{
  unsigned int v4 = *(_DWORD *)(a2 + 8);
  if (v4)
  {
    unsigned int v5 = *((_DWORD *)a1 + 2);
    uint64_t v6 = (uint64_t)&(*a1)[112 * v5];
    long long v7 = *(skit::SpanMatchV3 **)a2;
    unsigned __int32 v8 = (skit::SpanMatchV3 *)(*(void *)a2 + 112 * v4);
    unsigned int v9 = v5 + v4;
    if (v5 + v4 <= *((_DWORD *)a1 + 3))
    {
      uint64_t v15 = (uint64_t)&(*a1)[112 * v5];
    }
    else
    {
      unsigned int v10 = v5 + (v5 >> 1);
      if (v10 + 1 > v9) {
        unsigned int v11 = v10 + 1;
      }
      else {
        unsigned int v11 = v9;
      }
      uint32x2_t v12 = (char *)skit::SmallVector<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>,4u,true>::allocate(v11);
      uint64_t v13 = (uint64_t)*a1;
      uint64_t v14 = (char *)v6;
      uint64_t v15 = (uint64_t)v12;
      if (*a1 != (char *)v6)
      {
        uint64_t v15 = (uint64_t)v12;
        do
        {
          *(_WORD *)uint64_t v15 = *(_WORD *)v13;
          long long v16 = *(_OWORD *)(v13 + 8);
          *(void *)(v15 + 24) = *(void *)(v13 + 24);
          *(_OWORD *)(v15 + 8) = v16;
          *(void *)(v13 + 16) = 0;
          *(void *)(v13 + 24) = 0;
          *(void *)(v13 + 8) = 0;
          *(_OWORD *)(v15 + 32) = *(_OWORD *)(v13 + 32);
          long long v17 = *(_OWORD *)(v13 + 48);
          *(_OWORD *)(v15 + 60) = *(_OWORD *)(v13 + 60);
          *(_OWORD *)(v15 + 48) = v17;
          skit::SmallVector<skit::GroupId,4u,true>::move(v15 + 80, v13 + 80);
          *(_DWORD *)(v15 + 104) = *(_DWORD *)(v13 + 104);
          v15 += 112;
          v13 += 112;
        }
        while (v13 != v6);
        uint64_t v14 = *a1;
      }
      uint64_t v18 = *((unsigned int *)a1 + 2);
      int v19 = &v14[112 * v18];
      if (v19 != (char *)v6)
      {
        uint64_t v20 = v15 + 112 * v4;
        do
        {
          *(_WORD *)uint64_t v20 = *(_WORD *)v6;
          long long v21 = *(_OWORD *)(v6 + 8);
          *(void *)(v20 + 24) = *(void *)(v6 + 24);
          *(_OWORD *)(v20 + 8) = v21;
          *(void *)(v6 + 16) = 0;
          *(void *)(v6 + 24) = 0;
          *(void *)(v6 + 8) = 0;
          *(_OWORD *)(v20 + 32) = *(_OWORD *)(v6 + 32);
          long long v22 = *(_OWORD *)(v6 + 48);
          *(_OWORD *)(v20 + 60) = *(_OWORD *)(v6 + 60);
          *(_OWORD *)(v20 + 48) = v22;
          skit::SmallVector<skit::GroupId,4u,true>::move(v20 + 80, v6 + 80);
          *(_DWORD *)(v20 + 104) = *(_DWORD *)(v6 + 104);
          v6 += 112;
          v20 += 112;
        }
        while ((char *)v6 != v19);
        uint64_t v14 = *a1;
        uint64_t v18 = *((unsigned int *)a1 + 2);
      }
      if (v18)
      {
        uint64_t v23 = 112 * v18;
        do
        {
          uint64_t v14 = (char *)(skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::~FieldMatchImpl((uint64_t)v14)
                       + 112);
          v23 -= 112;
        }
        while (v23);
        uint64_t v14 = *a1;
      }
      if (v14 != (char *)(a1 + 2)) {
        free(v14);
      }
      *a1 = v12;
      *((_DWORD *)a1 + 3) = ((malloc_size(v12) >> 4) * (unsigned __int128)0x2492492492492493uLL) >> 64;
    }
    *((_DWORD *)a1 + 2) = v9;
    std::uninitialized_copy[abi:ne180100]<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>> const*,skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>*>(v7, v8, v15);
  }
  if (*((char *)a1 + 487) < 0)
  {
    if (!a1[59]) {
      goto LABEL_29;
    }
  }
  else if (!*((unsigned char *)a1 + 487))
  {
    goto LABEL_29;
  }
  if (*((_DWORD *)a1 + 123) < *(_DWORD *)(a2 + 488)) {
    std::basic_string<char16_t>::push_back((std::basic_string<char16_t> *)(a1 + 58), a2);
  }
LABEL_29:
  int v24 = *(char *)(a2 + 487);
  if (v24 >= 0) {
    unsigned int v25 = (const std::basic_string<char16_t>::value_type *)(a2 + 464);
  }
  else {
    unsigned int v25 = *(const std::basic_string<char16_t>::value_type **)(a2 + 464);
  }
  if (v24 >= 0) {
    std::basic_string<char16_t>::size_type v26 = *(unsigned __int8 *)(a2 + 487);
  }
  else {
    std::basic_string<char16_t>::size_type v26 = *(void *)(a2 + 472);
  }
  std::basic_string<char16_t>::append((std::basic_string<char16_t> *)(a1 + 58), v25, v26);

  return skit::SpanMatchV3::merge((size_t)(a1 + 61), (int32x2_t *)(a2 + 488));
}

uint64_t skit::internal::MergeStateImpl<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>>::clear(uint64_t result)
{
  uint64_t v1 = result;
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  unsigned int v2 = *(_DWORD *)(result + 24);
  if (v2)
  {
    uint64_t v3 = *(void *)(result + 16);
    uint64_t v4 = 552 * v2;
    do
    {
      uint64_t result = skit::SmallVector<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,8u,true>::_destroy<skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>,(void *)0>(v3);
      v3 += 552;
      v4 -= 552;
    }
    while (v4);
  }
  *(_DWORD *)(v1 + 24) = 0;
  return result;
}

void *skit::MphStopWordFilter::MphStopWordFilter(void *this)
{
  *this = &unk_1F2A131E8;
  this[1] = &skit::default_stop_word;
  return this;
}

{
  *this = &unk_1F2A131E8;
  this[1] = &skit::default_stop_word;
  return this;
}

float skit::MphStopWordFilter::filter(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v3 = *a2;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a2[1] - *a2) >> 4);
  if (v4 > a3)
  {
    unint64_t v5 = a3;
    uint64_t v6 = *(void *)(a1 + 8);
    uint64_t v7 = *(void *)(v6 + 24);
    do
    {
      uint64_t v8 = v3 + 48 * v5;
      int v9 = *(char *)(v8 + 23);
      if (v9 >= 0) {
        unsigned int v10 = (skit::internal *)(v3 + 48 * v5);
      }
      else {
        unsigned int v10 = *(skit::internal **)v8;
      }
      if (v9 >= 0) {
        uint64_t v11 = *(unsigned __int8 *)(v8 + 23);
      }
      else {
        uint64_t v11 = *(void *)(v8 + 8);
      }
      uint64_t v12 = v7;
      if (v11)
      {
        uint64_t v13 = *(__int16 *)(*(void *)(v6 + 8)
                         + 2
                         * (*(_DWORD *)(v6 + 16) & skit::internal::murmur3_32(v10, 2 * v11, *(_DWORD *)(v6 + 20))));
        uint64_t v12 = v7;
        if ((v13 & 0x8000000000000000) == 0)
        {
          uint64_t v14 = *(void *)v6 + 24 * (int)v13;
          uint64_t v12 = v7;
          if (*(void *)(v14 + 8) == v11)
          {
            uint64_t v15 = *(unsigned __int16 **)v14;
            while (*(unsigned __int16 *)v10 == *v15)
            {
              ++v15;
              unsigned int v10 = (skit::internal *)((char *)v10 + 2);
              if (!--v11)
              {
                uint64_t v12 = *(void *)v6 + 24 * v13;
                goto LABEL_17;
              }
            }
            uint64_t v12 = v7;
          }
        }
      }
LABEL_17:
      uint64_t v16 = v3 + 48 * v5;
      float result = *(float *)(v12 + 16) * *(float *)(v16 + 32);
      *(float *)(v16 + 32) = result;
      *(_WORD *)(v16 + 40) = (*(_WORD *)(v16 + 40) | *(_WORD *)(v12 + 20) & 4) & (*(_WORD *)(v12 + 20) | 0xFFFE);
      ++v5;
    }
    while (v5 != v4);
  }
  return result;
}

void skit::MphStopWordFilter::~MphStopWordFilter(skit::MphStopWordFilter *this)
{
}

BOOL skit::is_significant(uint64_t *a1)
{
  if (skit::is_significant(std::u16string_view const&)::once != -1) {
  uint64_t v2 = a1[1];
  }
  if (skit::is_significant(std::u16string_view const&)::significant_chars) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3) {
    return 0;
  }
  int v4 = 0;
  uint64_t v5 = *a1;
  while (1)
  {
    BOOL result = v4 < (int)v2;
    if (v4 >= (int)v2) {
      break;
    }
    uint64_t v7 = v4 + 1;
    uint64_t v8 = *(unsigned __int16 *)(v5 + 2 * v4);
    if ((v8 & 0xFC00) == 0xD800 && v7 != v2)
    {
      int v10 = *(unsigned __int16 *)(v5 + 2 * v7);
      int v11 = v10 & 0xFC00;
      int v12 = v4 + 2;
      unsigned int v13 = v10 + (v8 << 10) - 56613888;
      if (v11 == 56320) {
        uint64_t v8 = v13;
      }
      else {
        uint64_t v8 = v8;
      }
      if (v11 == 56320) {
        LODWORD(v7) = v12;
      }
    }
    int v14 = MEMORY[0x1D942CB10](skit::is_significant(std::u16string_view const&)::significant_chars, v8);
    int v4 = v7;
    if (v14) {
      return 1;
    }
  }
  return result;
}

uint64_t skit::anonymous namespace'::make_uset_significant_chars(skit::_anonymous_namespace_ *this, void *a2)
{
  uint64_t v3 = uset_openPattern();
  uint64_t result = MEMORY[0x1D942CB20]();
  *(void *)this = v3;
  return result;
}

void skit::to_string(std::string *this, uint64_t a2, std::string::size_type __requested_capacity)
{
  int v3 = __requested_capacity;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((unsigned char *)&this->__r_.__value_.__s + 23) = 0;
  }
  std::string::reserve(this, __requested_capacity);
  char v15 = 0;
  *(_DWORD *)__s = 0;
  if (v3 >= 1)
  {
    int v6 = 0;
    while (1)
    {
      uint64_t v7 = v6 + 1;
      unsigned int v8 = *(unsigned __int16 *)(a2 + 2 * v6);
      if ((v8 & 0xFC00) == 0xD800 && v7 != v3) {
        break;
      }
      if (v8 > 0x7F)
      {
        if (v8 <= 0x7FF)
        {
          __s[0] = (v8 >> 6) | 0xC0;
          uint64_t v13 = 1;
LABEL_19:
          std::string::size_type v10 = v13 + 1;
          __s[v13] = v8 & 0x3F | 0x80;
          goto LABEL_20;
        }
LABEL_17:
        __s[0] = (v8 >> 12) | 0xE0;
        uint64_t v12 = 1;
LABEL_18:
        uint64_t v13 = v12 + 1;
        *(unsigned char *)((unint64_t)__s | v12) = (v8 >> 6) & 0x3F | 0x80;
        goto LABEL_19;
      }
      __s[0] = *(_WORD *)(a2 + 2 * v6);
      std::string::size_type v10 = 1;
LABEL_20:
      std::string::append(this, __s, v10);
      int v6 = v7;
      if ((int)v7 >= v3) {
        return;
      }
    }
    int v11 = *(unsigned __int16 *)(a2 + 2 * v7);
    if ((v11 & 0xFC00) != 0xDC00) {
      goto LABEL_17;
    }
    LODWORD(v7) = v6 + 2;
    unsigned int v8 = v11 + (v8 << 10) - 56613888;
    __s[0] = (v8 >> 18) | 0xF0;
    __s[1] = (v8 >> 12) & 0x3F | 0x80;
    uint64_t v12 = 2;
    goto LABEL_18;
  }
}

void skit::to_u16string(std::basic_string<char16_t> *this, uint64_t a2, std::basic_string<char16_t>::size_type __requested_capacity)
{
  int v3 = __requested_capacity;
  if (SHIBYTE(this->__r_.__value_.__r.__words[2]) < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0;
  }
  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    *((unsigned char *)&this->__r_.__value_.__s + 23) = 0;
  }
  std::basic_string<char16_t>::reserve(this, __requested_capacity);
  __int16 v19 = 0;
  *(_DWORD *)__s = 0;
  if (v3 >= 1)
  {
    int v6 = 0;
    do
    {
      uint64_t v7 = v6;
      uint64_t v8 = v6 + 1;
      int v9 = *(char *)(a2 + v6);
      unsigned int v10 = *(unsigned __int8 *)(a2 + v6);
      if (v9 < 0)
      {
        if (v8 == v3) {
          goto LABEL_9;
        }
        if (v10 < 0xE0)
        {
          if (v10 < 0xC2) {
            goto LABEL_26;
          }
          unsigned int v14 = v10 & 0x1F;
        }
        else
        {
          if (v10 > 0xEF)
          {
            if (v10 > 0xF4
              || (unsigned int v17 = v10 - 240,
                  unint64_t v12 = *(unsigned __int8 *)(a2 + v8),
                  ((byte_1D2F01208[v12 >> 4] >> v17) & 1) == 0))
            {
LABEL_26:
              unsigned int v10 = -1;
              goto LABEL_27;
            }
            uint64_t v8 = v7 + 2;
            if (v7 + 2 == v3)
            {
LABEL_9:
              unsigned int v10 = -1;
              LODWORD(v8) = v3;
LABEL_27:
              __s[0] = (v10 >> 10) - 10304;
              __s[1] = v10 & 0x3FF | 0xDC00;
              std::basic_string<char16_t>::size_type v11 = 2;
              goto LABEL_28;
            }
            unsigned int v13 = *(unsigned __int8 *)(a2 + v8) ^ 0x80;
            if (v13 > 0x3F)
            {
              unsigned int v10 = -1;
              goto LABEL_27;
            }
            LODWORD(v12) = v12 & 0x3F | (v17 << 6);
          }
          else
          {
            unint64_t v12 = v9 & 0xF;
            if (((a00000000000000_0[v12] >> (*(unsigned char *)(a2 + v8) >> 5)) & 1) == 0) {
              goto LABEL_26;
            }
            unsigned int v13 = *(unsigned char *)(a2 + v8) & 0x3F;
          }
          LODWORD(v8) = v8 + 1;
          if (v8 == v3) {
            goto LABEL_9;
          }
          unsigned int v14 = v13 | (v12 << 6);
        }
        unsigned int v15 = *(unsigned __int8 *)(a2 + (int)v8) ^ 0x80;
        if (v15 > 0x3F) {
          goto LABEL_26;
        }
        LODWORD(v8) = v8 + 1;
        int v16 = (unsigned __int16)(v14 >> 10);
        unsigned int v10 = v15 | (v14 << 6);
        if (v16) {
          goto LABEL_27;
        }
      }
      __s[0] = v10;
      std::basic_string<char16_t>::size_type v11 = 1;
LABEL_28:
      std::basic_string<char16_t>::append(this, __s, v11);
      int v6 = v8;
    }
    while ((int)v8 < v3);
  }
}

uint64_t skit::codepoint_cnt(uint64_t a1, int a2)
{
  if (a2 < 1) {
    return 0;
  }
  uint64_t result = 0;
  LODWORD(v4) = 0;
  while (1)
  {
    uint64_t v5 = (int)v4;
    uint64_t v6 = (int)v4 + 1;
    int v7 = *(char *)(a1 + (int)v4);
    if ((v7 & 0x80000000) == 0 || v6 == a2)
    {
LABEL_19:
      LODWORD(v4) = v6;
      goto LABEL_20;
    }
    unsigned int v8 = v7;
    if (v7 < 0xE0u)
    {
      LODWORD(v4) = v6;
      if (v8 >= 0xC2) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
    if (v7 <= 0xEFu)
    {
      int v9 = a00000000000000_0[v7 & 0xF] >> (*(unsigned char *)(a1 + v6) >> 5);
      LODWORD(v4) = v6;
      if (v9) {
        goto LABEL_8;
      }
      goto LABEL_20;
    }
    if (v7 > 0xF4u) {
      goto LABEL_19;
    }
    LODWORD(v4) = v6;
    if ((byte_1D2F01208[(unint64_t)*(unsigned __int8 *)(a1 + v6) >> 4] >> (v8 + 16))) {
      break;
    }
LABEL_20:
    ++result;
    if ((int)v4 >= a2) {
      return result;
    }
  }
  uint64_t v4 = v5 + 2;
  if (v5 + 2 != a2)
  {
    LODWORD(v6) = v5 + 2;
    if (*(char *)(a1 + v4) <= -65)
    {
LABEL_8:
      LODWORD(v6) = v6 + 1;
      if (v6 == a2) {
        return ++result;
      }
LABEL_11:
      if (*(char *)(a1 + (int)v6) >= -64) {
        LODWORD(v4) = v6;
      }
      else {
        LODWORD(v4) = v6 + 1;
      }
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  return ++result;
}

{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v6;

  if (a2 < 1) {
    return 0;
  }
  uint64_t v2 = 0;
  int v3 = 0;
  do
  {
    uint64_t v4 = v3 + 1;
    if ((*(_WORD *)(a1 + 2 * v3) & 0xFC00) == 0xD800 && v4 != a2)
    {
      uint64_t v6 = v3 + 2;
      if ((*(_WORD *)(a1 + 2 * v4) & 0xFC00) == 0xDC00) {
        LODWORD(v4) = v6;
      }
    }
    ++v2;
    int v3 = v4;
  }
  while ((int)v4 < a2);
  return v2;
}

unint64_t skit::levenshtein(skit *this, const char *a2, const char *a3)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  size_t v5 = strlen((const char *)this);
  size_t v6 = strlen(a2);
  uint64_t v8 = MEMORY[0x1F4188790](v6, v7);
  std::basic_string<char16_t>::size_type v11 = (void *)((char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v5)
  {
    uint64_t v12 = 2;
    if (v9 > 2) {
      uint64_t v12 = v9;
    }
    for (uint64_t i = 1; i != v12; ++i)
      v11[i] = i;
  }
  if (v8)
  {
    uint64_t v14 = 2;
    if (v9 <= 2) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = v9;
    }
    if ((unint64_t)(v8 + 1) > 2) {
      uint64_t v14 = v8 + 1;
    }
    uint64_t v16 = v15 - 1;
    uint64_t v17 = 1;
    do
    {
      unint64_t v18 = v17;
      if (v5)
      {
        unint64_t v19 = v17 - 1;
        int v20 = a2[v17 - 1];
        long long v21 = v11 + 1;
        long long v22 = this;
        uint64_t v23 = v16;
        unint64_t v24 = v18;
        do
        {
          int v25 = *(unsigned __int8 *)v22;
          long long v22 = (skit *)((char *)v22 + 1);
          if (v25 != v20) {
            ++v19;
          }
          unint64_t v26 = *v21;
          if (*v21 + 1 >= v24 + 1) {
            ++v24;
          }
          else {
            unint64_t v24 = *v21 + 1;
          }
          if (v24 >= v19) {
            unint64_t v24 = v19;
          }
          *v21++ = v24;
          unint64_t v19 = v26;
          --v23;
        }
        while (v23);
      }
      uint64_t v17 = v18 + 1;
    }
    while (v18 + 1 != v14);
    unint64_t *v11 = v18;
  }
  return v11[v5];
}

uint64_t skit::Token::serialize(skit::Token *this, byte *a2, uint64_t a3)
{
  uint64_t v3 = *((unsigned __int8 *)this + 23);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *((void *)this + 1);
  }
  if (2 * v3 + 18 > a3) {
    return -1;
  }
  *(_WORD *)a2 = v3;
  uint64_t v7 = a2 + 2;
  int v8 = *((char *)this + 23);
  uint64_t v9 = *((void *)this + 1);
  if (v8 >= 0) {
    uint64_t v9 = *((unsigned __int8 *)this + 23);
  }
  uint64_t v10 = 2 * v9;
  std::basic_string<char16_t>::size_type v11 = this;
  if (v8 < 0) {
    std::basic_string<char16_t>::size_type v11 = *(skit::Token **)this;
  }
  memcpy(v7, v11, 2 * v9);
  uint64_t v12 = &a2[v10];
  *(_DWORD *)(v12 + 2) = *((_DWORD *)this + 6);
  *(_DWORD *)(v12 + 6) = *((_DWORD *)this + 7);
  float v13 = *((float *)this + 8);
  float v14 = 65504.0;
  if (v13 <= 65504.0) {
    float v14 = *((float *)this + 8);
  }
  if (v13 >= -65504.0) {
    _S0 = v14;
  }
  else {
    _S0 = *(float *)"";
  }
  __asm { FCVT            H0, S0 }
  *((_WORD *)v12 + 5) = _H0;
  *((_WORD *)v12 + 6) = *((_WORD *)this + 18);
  *((_WORD *)v12 + 7) = *((_WORD *)this + 19);
  *((_WORD *)v12 + 8) = *((_WORD *)this + 20);
  return v10 + 18;
}

unint64_t skit::Token::deserialize(std::basic_string<char16_t> *this, const byte *a2, uint64_t a3)
{
  if (a3 < 18) {
    return -1;
  }
  std::basic_string<char16_t>::size_type v5 = *(unsigned __int16 *)a2;
  uint64_t v6 = 2 * v5;
  unint64_t v7 = 2 * v5 + 18;
  if (v7 > a3) {
    return -1;
  }
  int v8 = std::basic_string<char16_t>::__assign_external(this, (const std::basic_string<char16_t>::value_type *)a2 + 1, v5);
  v8[1].__r_.__value_.__r.__words[0] = *(void *)&a2[v6 + 2];
  _H0 = *(_WORD *)&a2[v6 + 10];
  __asm { FCVT            S0, H0 }
  LODWORD(v8[1].__r_.__value_.__r.__words[1]) = _S0;
  v8[1].__r_.__value_.__s.__data_[6] = *(_WORD *)&a2[v6 + 12];
  v8[1].__r_.__value_.__s.__data_[7] = *(_WORD *)&a2[v6 + 14];
  v8[1].__r_.__value_.__s.__data_[8] = *(_WORD *)&a2[v6 + 16];
  return v7;
}

std::basic_string<char16_t> *__cdecl std::basic_string<char16_t>::__assign_external(std::basic_string<char16_t> *this, const std::basic_string<char16_t>::value_type *__s, std::basic_string<char16_t>::size_type __n)
{
  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    unint64_t v10 = this->__r_.__value_.__r.__words[2];
    unint64_t v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      std::basic_string<char16_t>::size_type size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    unint64_t v6 = HIBYTE(v10);
    unint64_t v7 = (std::basic_string<char16_t> *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    unint64_t v7 = this;
    if (__n > 0xA)
    {
      std::basic_string<char16_t>::size_type size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      unint64_t v9 = 10;
LABEL_6:
      std::basic_string<char16_t>::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, 2 * __n);
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

uint64_t skit::TokenStream::serialize(skit::TokenStream *this, byte *a2, uint64_t a3)
{
  uint64_t v3 = a3 - 2;
  if (a3 >= 2)
  {
    *(_WORD *)a2 = -21845 * ((*((_DWORD *)this + 2) - *(_DWORD *)this) >> 4);
    std::basic_string<char16_t>::size_type v5 = *(skit::Token **)this;
    unint64_t v6 = (skit::Token *)*((void *)this + 1);
    if (*(skit::Token **)this == v6) {
      return a3 - v3;
    }
    unint64_t v7 = a2 + 2;
    while (1)
    {
      uint64_t v8 = skit::Token::serialize(v5, v7, v3);
      if (v8 < 1) {
        break;
      }
      v3 -= v8;
      v7 += v8;
      std::basic_string<char16_t>::size_type v5 = (skit::Token *)((char *)v5 + 48);
      if (v5 == v6) {
        return a3 - v3;
      }
    }
  }
  return -1;
}

uint64_t skit::TokenStream::deserialize(skit::TokenStream *this, const byte *a2, uint64_t a3)
{
  uint64_t v3 = a3 - 2;
  if (a3 >= 2)
  {
    std::vector<skit::Token>::resize((uint64_t *)this, *(unsigned __int16 *)a2);
    unint64_t v7 = *(std::basic_string<char16_t> **)this;
    uint64_t v8 = (std::basic_string<char16_t> *)*((void *)this + 1);
    if (v7 == v8) {
      return a3 - v3;
    }
    unint64_t v9 = a2 + 2;
    while (1)
    {
      int64_t v10 = skit::Token::deserialize(v7, v9, v3);
      if (v10 < 1) {
        break;
      }
      v3 -= v10;
      v9 += v10;
      v7 += 2;
      if (v7 == v8) {
        return a3 - v3;
      }
    }
  }
  return -1;
}

void skit::MultiNGram::~MultiNGram(skit::MultiNGram *this)
{
  *(void *)this = &unk_1F2A130E8;
  uint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }

  JUMPOUT(0x1D942C720);
}

{
  uint64_t v2;

  *(void *)this = &unk_1F2A130E8;
  uint64_t v2 = *((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }
}

void skit::MultiNGram::tokenize_str(uint64_t a1, uint64_t *a2, void *__src, unint64_t a4)
{
  uint64_t v5 = a1;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = *(void (****)(void, char **, void *))(a1 + 16);
  if (v6)
  {
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    unsigned int v68 = 0;
    (**v6)(v6, &v66, __src);
  }
  else
  {
    skit::Token::Token(__p, __src, a4);
    uint64_t v66 = 0;
    uint64_t v67 = 0;
    unsigned int v68 = 0;
    __dst[0] = &v66;
    LOBYTE(__dst[1]) = 0;
    unint64_t v7 = (char *)operator new(0x30uLL);
    uint64_t v8 = v7;
    uint64_t v66 = v7;
    uint64_t v67 = v7;
    unint64_t v9 = v7 + 48;
    unsigned int v68 = v7 + 48;
    if (SHIBYTE(__p[2]) < 0)
    {
      std::basic_string<char16_t>::__init_copy_ctor_external((std::basic_string<char16_t> *)v7, (const std::basic_string<char16_t>::value_type *)__p[0], (std::basic_string<char16_t>::size_type)__p[1]);
      int v10 = SHIBYTE(__p[2]);
      *(_OWORD *)(v8 + 24) = v71;
      *((void *)v8 + 5) = v72;
      uint64_t v67 = v9;
      if (v10 < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      *(_OWORD *)unint64_t v7 = *(_OWORD *)__p;
      *((void **)v7 + 2) = __p[2];
      *(_OWORD *)(v7 + 24) = v71;
      *((void *)v7 + 5) = v72;
      uint64_t v67 = v7 + 48;
    }
  }
  std::basic_string<char16_t>::size_type v11 = (unsigned __int16 *)v66;
  char v60 = (unsigned __int16 *)v67;
  if (v66 != v67)
  {
    uint64_t v59 = (int *)(v5 + 28);
    do
    {
      if (*(unsigned char *)(v5 + 40))
      {
        strcpy(__srca, "^");
        uint64_t v12 = (char *)v11;
        if (*((char *)v11 + 23) < 0) {
          uint64_t v12 = *(char **)v11;
        }
        *(_DWORD *)&__srca[2] = *(unsigned __int16 *)v12;
        std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, __srca);
        int v65 = 1065353216;
        unint64_t v13 = a2[1];
        if (v13 >= a2[2])
        {
          uint64_t v17 = std::vector<skit::Token>::__emplace_back_slow_path<std::basic_string<char16_t>,float,float const&>(a2, (uint64_t *)__p, (float *)&v65, v59);
        }
        else
        {
          float v14 = __p[0];
          __dst[0] = __p[1];
          *(void **)((char *)__dst + 7) = *(void **)((char *)&__p[1] + 7);
          char v15 = HIBYTE(__p[2]);
          memset(__p, 0, sizeof(__p));
          int v16 = *v59;
          *(void *)unint64_t v13 = v14;
          *(void **)(v13 + 15) = *(void **)((char *)__dst + 7);
          *(void **)(v13 + 8) = __dst[0];
          *(unsigned char *)(v13 + 23) = v15;
          *(void *)(v13 + 24) = 0;
          *(_DWORD *)(v13 + 32) = v16;
          *(_DWORD *)(v13 + 36) = 0x10000;
          *(_WORD *)(v13 + 40) = 3;
          uint64_t v17 = v13 + 48;
          *(_DWORD *)(v13 + 44) = 0;
        }
        a2[1] = v17;
        if (SHIBYTE(__p[2]) < 0) {
          operator delete(__p[0]);
        }
        if (*(unsigned char *)(v5 + 40))
        {
          if (*((char *)v11 + 23) < 0)
          {
            unint64_t v19 = *(unsigned __int16 **)v11;
            uint64_t v18 = *((void *)v11 + 1);
          }
          else
          {
            uint64_t v18 = *((unsigned __int8 *)v11 + 23);
            unint64_t v19 = v11;
          }
          *(_WORD *)__srca = v19[v18 - 1];
          *(_DWORD *)&__srca[2] = 36;
          std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(__p, __srca);
          int v65 = 1065353216;
          unint64_t v20 = a2[1];
          if (v20 >= a2[2])
          {
            uint64_t v24 = std::vector<skit::Token>::__emplace_back_slow_path<std::basic_string<char16_t>,float,float const&>(a2, (uint64_t *)__p, (float *)&v65, v59);
          }
          else
          {
            long long v21 = __p[0];
            __dst[0] = __p[1];
            *(void **)((char *)__dst + 7) = *(void **)((char *)&__p[1] + 7);
            char v22 = HIBYTE(__p[2]);
            memset(__p, 0, sizeof(__p));
            int v23 = *v59;
            *(void *)unint64_t v20 = v21;
            *(void **)(v20 + 15) = *(void **)((char *)__dst + 7);
            *(void **)(v20 + 8) = __dst[0];
            *(unsigned char *)(v20 + 23) = v22;
            *(void *)(v20 + 24) = 0;
            *(_DWORD *)(v20 + 32) = v23;
            *(_DWORD *)(v20 + 36) = 0x10000;
            *(_WORD *)(v20 + 40) = 3;
            uint64_t v24 = v20 + 48;
            *(_DWORD *)(v20 + 44) = 0;
          }
          a2[1] = v24;
          if (SHIBYTE(__p[2]) < 0) {
            operator delete(__p[0]);
          }
        }
      }
      if (*((char *)v11 + 23) < 0) {
        uint64_t v25 = *((void *)v11 + 1);
      }
      else {
        LODWORD(v25) = *((unsigned __int8 *)v11 + 23);
      }
      unsigned int v26 = *(_DWORD *)(v5 + 8);
      if (*(_DWORD *)(v5 + 12) < v25) {
        LODWORD(v25) = *(_DWORD *)(v5 + 12);
      }
      int v61 = v25;
      while (v26 <= v25)
      {
        if (*((char *)v11 + 23) < 0)
        {
          uint64_t v28 = *(char **)v11;
          uint64_t v27 = *((void *)v11 + 1);
        }
        else
        {
          LODWORD(v27) = *((unsigned __int8 *)v11 + 23);
          uint64_t v28 = (char *)v11;
        }
        int v29 = v27 - v26;
        uint64_t v62 = *a2;
        uint64_t v63 = a2[1];
        float v30 = 0.0;
        unsigned int v64 = v29 + 1;
        if (v29 != -1)
        {
          unsigned int v31 = 0;
          unint64_t v32 = v28;
          float v33 = 0.0;
          do
          {
            std::basic_string<char16_t>::basic_string[abi:ne180100](__dst, v28, v26);
            unsigned int v34 = v11;
            if (*((char *)v11 + 23) < 0) {
              unsigned int v34 = *(unsigned __int16 **)v11;
            }
            int v35 = *((_DWORD *)v11 + 6);
            uint64_t v36 = v5;
            float v37 = *(float *)(v5 + 36) * (float)v26;
            float v38 = expf(v33) * v37;
            unint64_t v39 = a2[1];
            unint64_t v40 = a2[2];
            if (v39 >= v40)
            {
              unint64_t v44 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v39 - *a2) >> 4);
              unint64_t v45 = v44 + 1;
              if (v44 + 1 > 0x555555555555555) {
                std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
              }
              unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v40 - *a2) >> 4);
              if (2 * v46 > v45) {
                unint64_t v45 = 2 * v46;
              }
              if (v46 >= 0x2AAAAAAAAAAAAAALL) {
                unint64_t v47 = 0x555555555555555;
              }
              else {
                unint64_t v47 = v45;
              }
              *((void *)&v71 + 1) = a2 + 2;
              long long v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v47);
              long long v49 = &v48[48 * v44];
              __p[0] = v48;
              __p[1] = v49;
              *(void *)&long long v71 = &v48[48 * v50];
              uint64_t v51 = __dst[0];
              *(void **)&__srca[7] = *(void **)((char *)&__dst[1] + 7);
              *(void **)__srca = __dst[1];
              char v52 = HIBYTE(__dst[2]);
              memset(__dst, 0, sizeof(__dst));
              uint64_t v53 = *(void *)__srca;
              *(void *)long long v49 = v51;
              *((void *)v49 + 1) = v53;
              *(void *)(v49 + 15) = *(void *)&__srca[7];
              v49[23] = v52;
              *((void *)v49 + 3) = 0;
              *((float *)v49 + 8) = v38;
              *((_DWORD *)v49 + 9) = 0x10000;
              *((_WORD *)v49 + 20) = 3;
              *((_DWORD *)v49 + 11) = 0;
              __p[2] = v49 + 48;
              std::vector<skit::Token>::__swap_out_circular_buffer(a2, __p);
              uint64_t v43 = a2[1];
              std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)__p);
            }
            else
            {
              uint64_t v41 = __dst[0];
              __p[0] = __dst[1];
              *(void **)((char *)__p + 7) = *(void **)((char *)&__dst[1] + 7);
              char v42 = HIBYTE(__dst[2]);
              memset(__dst, 0, sizeof(__dst));
              *(void *)unint64_t v39 = v41;
              *(void **)(v39 + 8) = __p[0];
              *(void **)(v39 + 15) = *(void **)((char *)__p + 7);
              *(unsigned char *)(v39 + 23) = v42;
              *(void *)(v39 + 24) = 0;
              *(float *)(v39 + 32) = v38;
              *(_DWORD *)(v39 + 36) = 0x10000;
              *(_WORD *)(v39 + 40) = 3;
              *(_DWORD *)(v39 + 44) = 0;
              uint64_t v43 = v39 + 48;
            }
            a2[1] = v43;
            uint64_t v54 = v35 + ((unint64_t)(v32 - (char *)v34) >> 1);
            *(void *)(v43 - 24) = v54 | ((unint64_t)(v54 + v26) << 32);
            float v55 = *(float *)(a2[1] - 16);
            uint64_t v5 = v36;
            float v56 = *(float *)(v36 + 24);
            if (SHIBYTE(__dst[2]) < 0) {
              operator delete(__dst[0]);
            }
            float v30 = v30 + v55;
            float v33 = v33 - v56;
            ++v31;
            v28 += 2;
            v32 += 2;
          }
          while (v31 < v64);
        }
        if (*(unsigned char *)(v5 + 42))
        {
          uint64_t v57 = a2[1];
          for (unint64_t i = *a2 + 0xFFFFFFF000000010 * ((v63 - v62) >> 4); i != v57; i += 48)
            *(float *)(i + 32) = (float)(1.0 / v30) * *(float *)(i + 32);
        }
        ++v26;
        LODWORD(v25) = v61;
      }
      v11 += 24;
    }
    while (v11 != v60);
  }
  __p[0] = &v66;
  std::vector<skit::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
}

void sub_1D2EFEAAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  if (a33 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *skit::Token::Token(void *__dst, void *__src, unint64_t a3)
{
  if (a3 >= 0x7FFFFFFFFFFFFFF8) {
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  }
  if (a3 >= 0xB)
  {
    uint64_t v7 = (a3 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a3 | 3) != 0xB) {
      uint64_t v7 = a3 | 3;
    }
    unint64_t v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v7 + 1);
    __dst[1] = a3;
    __dst[2] = v8 | 0x8000000000000000;
    *long long __dst = v6;
  }
  else
  {
    *((unsigned char *)__dst + 23) = a3;
    unint64_t v6 = __dst;
    if (!a3) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, 2 * a3);
LABEL_9:
  *((_WORD *)v6 + a3) = 0;
  __dst[3] = 0;
  __dst[4] = 0x100003F800000;
  *((_WORD *)__dst + 20) = 3;
  *((_DWORD *)__dst + 11) = 0;
  return __dst;
}

void *std::basic_string<char16_t>::basic_string[abi:ne180100]<0>(void *__dst, char *__src)
{
  if (*(_WORD *)__src)
  {
    unint64_t v4 = 0;
    do
      uint64_t v5 = &__src[2 * v4++];
    while (*((_WORD *)v5 + 1));
    if (v4 >= 0x7FFFFFFFFFFFFFF8) {
      std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
    }
    if (v4 >= 0xB)
    {
      uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
      if ((v4 | 3) != 0xB) {
        uint64_t v7 = v4 | 3;
      }
      unint64_t v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v7 + 1);
      __dst[1] = v4;
      __dst[2] = v8 | 0x8000000000000000;
      *long long __dst = v6;
    }
    else
    {
      *((unsigned char *)__dst + 23) = v4;
      unint64_t v6 = __dst;
      if (!v4) {
        goto LABEL_9;
      }
    }
    memmove(v6, __src, 2 * v4);
    goto LABEL_14;
  }
  unint64_t v4 = 0;
  *((unsigned char *)__dst + 23) = 0;
LABEL_9:
  unint64_t v6 = __dst;
LABEL_14:
  *((_WORD *)v6 + v4) = 0;
  return __dst;
}

uint64_t std::vector<skit::Token>::__emplace_back_slow_path<std::basic_string<char16_t>,float,float const&>(uint64_t *a1, uint64_t *a2, float *a3, int *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555) {
    std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
  }
  int v10 = a1 + 2;
  if (0x5555555555555556 * ((a1[2] - *a1) >> 4) > v5) {
    unint64_t v5 = 0x5555555555555556 * ((a1[2] - *a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v11 = 0x555555555555555;
  }
  else {
    unint64_t v11 = v5;
  }
  v22[4] = v10;
  uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v11);
  unint64_t v13 = &v12[48 * v4];
  v22[0] = v12;
  v22[1] = v13;
  v22[3] = &v12[48 * v14];
  *(void *)&v23[7] = *(uint64_t *)((char *)a2 + 15);
  uint64_t v15 = *a2;
  *(void *)int v23 = a2[1];
  char v16 = *((unsigned char *)a2 + 23);
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  int v17 = (int)*a3;
  int v18 = *a4;
  uint64_t v19 = *(void *)v23;
  *(void *)unint64_t v13 = v15;
  *((void *)v13 + 1) = v19;
  *(void *)(v13 + 15) = *(void *)&v23[7];
  v13[23] = v16;
  *((void *)v13 + 3) = 0;
  *((_DWORD *)v13 + 8) = v18;
  *((_WORD *)v13 + 18) = 0;
  *((_WORD *)v13 + 19) = v17;
  *((_WORD *)v13 + 20) = 3;
  *((_DWORD *)v13 + 11) = 0;
  v22[2] = v13 + 48;
  std::vector<skit::Token>::__swap_out_circular_buffer(a1, v22);
  uint64_t v20 = a1[1];
  std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)v22);
  return v20;
}

void skit::WordDelimTokenizer::~WordDelimTokenizer(void **this)
{
  skit::WordDelimTokenizer::~WordDelimTokenizer(this);

  JUMPOUT(0x1D942C720);
}

{
  *this = &unk_1F2A13210;
  if (*((char *)this + 55) < 0) {
    operator delete(this[4]);
  }
  if (*((char *)this + 31) < 0) {
    operator delete(this[1]);
  }
}

unint64_t skit::WordDelimTokenizer::tokenize_str(unint64_t result, uint64_t *a2, unsigned __int16 *a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v4 = a4;
    unint64_t v7 = result;
    uint64_t v8 = (unsigned __int16 *)(result + 8);
    unint64_t v9 = (unsigned __int16 *)(result + 32);
    int v10 = a3;
    do
    {
      if (*(char *)(v7 + 31) < 0)
      {
        uint64_t v12 = *(unsigned __int16 **)(v7 + 8);
        uint64_t v11 = *(void *)(v7 + 16);
      }
      else
      {
        uint64_t v11 = *(unsigned __int8 *)(v7 + 31);
        uint64_t v12 = v8;
      }
      uint64_t result = std::u16string_view::find[abi:ne180100](v10, v4, v12, v11);
      if (result == -1) {
        break;
      }
      BOOL v13 = v4 >= result;
      unint64_t v14 = v4 - result;
      if (!v13) {
        goto LABEL_25;
      }
      uint64_t v15 = *(unsigned __int8 *)(v7 + 55);
      if (*(char *)(v7 + 55) < 0)
      {
        char v16 = *(unsigned __int16 **)(v7 + 32);
        uint64_t v17 = *(void *)(v7 + 40);
      }
      else
      {
        char v16 = v9;
        uint64_t v17 = *(unsigned __int8 *)(v7 + 55);
      }
      int v18 = &v10[result];
      uint64_t result = std::u16string_view::find[abi:ne180100](v18, v14, v16, v17);
      if (result == -1) {
        break;
      }
      if ((v15 & 0x80) != 0) {
        uint64_t v15 = *(void *)(v7 + 40);
      }
      unint64_t v19 = v15 + result;
      if (v14 >= v15 + result) {
        unint64_t v20 = v15 + result;
      }
      else {
        unint64_t v20 = v14;
      }
      v22[0] = v18;
      v22[1] = v20;
      unint64_t v21 = a2[1];
      if (v21 >= a2[2])
      {
        uint64_t result = std::vector<skit::Token>::__emplace_back_slow_path<std::u16string_view &>(a2, (uint64_t)v22);
      }
      else
      {
        skit::Token::Token((void *)a2[1], v18, v20);
        uint64_t result = v21 + 48;
        a2[1] = v21 + 48;
      }
      a2[1] = result;
      *(void *)(result - 24) = ((unint64_t)((char *)v18 - (char *)a3) >> 1) | ((unint64_t)(((unint64_t)((char *)v18 - (char *)a3) >> 1) + v20) << 32);
      BOOL v13 = v14 >= v19;
      unint64_t v4 = v14 - v19;
      if (!v13) {
LABEL_25:
      }
        std::__throw_out_of_range[abi:ne180100]("string_view::substr");
      int v10 = &v18[v19];
    }
    while (v4);
  }
  return result;
}

void sub_1D2EFF010(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::u16string_view::find[abi:ne180100](unsigned __int16 *a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  if (!a4) {
    return 0;
  }
  unint64_t v4 = &a1[a2];
  if (a4 <= a2)
  {
    unint64_t v5 = a1;
    do
    {
      if (a2 - a4 == -1) {
        break;
      }
      uint64_t v7 = a2 + 1;
      while (*v5 != *a3)
      {
        ++v5;
        if (a4 == --v7) {
          goto LABEL_3;
        }
      }
      uint64_t v8 = 0;
      while (a3[v8] == v5[v8])
      {
        if (a4 == ++v8) {
          goto LABEL_4;
        }
      }
      ++v5;
      a2 = v4 - v5;
    }
    while (a2 >= a4);
  }
LABEL_3:
  unint64_t v5 = v4;
LABEL_4:
  if (v5 == v4) {
    return -1;
  }
  else {
    return v5 - a1;
  }
}

uint64_t std::vector<skit::Token>::__emplace_back_slow_path<std::u16string_view &>(uint64_t *a1, uint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v3 = v2 + 1;
  if (v2 + 1 > 0x555555555555555) {
    std::vector<skit::Token>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v6 = a1 + 2;
  if (0x5555555555555556 * ((a1[2] - *a1) >> 4) > v3) {
    unint64_t v3 = 0x5555555555555556 * ((a1[2] - *a1) >> 4);
  }
  if (0xAAAAAAAAAAAAAAABLL * ((a1[2] - *a1) >> 4) >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v7 = 0x555555555555555;
  }
  else {
    unint64_t v7 = v3;
  }
  uint64_t v15 = v6;
  if (v7) {
    unint64_t v7 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<skit::Token>>(v7);
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v11 = v7;
  uint64_t v12 = (void *)(v7 + 48 * v2);
  BOOL v13 = v12;
  unint64_t v14 = v7 + 48 * v8;
  skit::Token::Token(v12, *(void **)a2, *(void *)(a2 + 8));
  BOOL v13 = v12 + 6;
  std::vector<skit::Token>::__swap_out_circular_buffer(a1, &v11);
  uint64_t v9 = a1[1];
  std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)&v11);
  return v9;
}

void sub_1D2EFF1AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<skit::Token>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *skit::MorphunTokenizer::MorphunTokenizer(void *a1)
{
  *a1 = &unk_1F2A131C0;
  a1[1] = 0;
  if (!MEMORY[0x1E4FBA7F8])
  {
    if (skit::internal::get_logging_context(void)::once != -1) {
    unint64_t v5 = skit::internal::get_logging_context(void)::logger;
    }
    if (os_log_type_enabled((os_log_t)skit::internal::get_logging_context(void)::logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_error_impl(&dword_1D2EDA000, v5, OS_LOG_TYPE_ERROR, "Skit requires libmorphun.dylib to use the MorphunTokenizer", v7, 2u);
    }
    exceptiouint64_t n = __cxa_allocate_exception(0x10uLL);
    MEMORY[0x1D942C510](exception, "Skit requires libmorphun.dylib to use the MorphunTokenizer");
    __cxa_throw(exception, MEMORY[0x1E4FBA338], MEMORY[0x1E4FBA1D8]);
  }
  uint64_t Tokenizer = morphun::TokenizerFactory::createTokenizer();
  uint64_t v3 = a1[1];
  a1[1] = Tokenizer;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
  }
  return a1;
}

void sub_1D2EFF30C(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  uint64_t v4 = *(void *)(v1 + 8);
  *(void *)(v1 + 8) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
  }
  _Unwind_Resume(a1);
}

void skit::MorphunTokenizer::~MorphunTokenizer(skit::MorphunTokenizer *this)
{
  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_1F2A131C0;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }

  JUMPOUT(0x1D942C720);
}

{
  uint64_t v2;

  uint64_t v2 = *((void *)this + 1);
  *(void *)this = &unk_1F2A131C0;
  *((void *)this + 1) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 16))(v2);
  }
}

void skit::MorphunTokenizer::tokenize_str(uint64_t a1, uint64_t *a2, void *__src, unint64_t a4)
{
  if (a4 >= 0x7FFFFFFFFFFFFFF8) {
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  }
  if (a4 >= 0xB)
  {
    uint64_t v9 = (a4 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a4 | 3) != 0xB) {
      uint64_t v9 = a4 | 3;
    }
    uint64_t v8 = (void **)std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v9 + 1);
    __dst[1] = (void *)a4;
    unint64_t v38 = v10 | 0x8000000000000000;
    __dst[0] = v8;
  }
  else
  {
    HIBYTE(v38) = a4;
    uint64_t v8 = __dst;
    if (!a4) {
      goto LABEL_9;
    }
  }
  memmove(v8, __src, 2 * a4);
LABEL_9:
  *((_WORD *)v8 + a4) = 0;
  unint64_t v11 = (void *)(*(uint64_t (**)(void, void **))(**(void **)(a1 + 8) + 24))(*(void *)(a1 + 8), __dst);
  morphun::TokenIterator::TokenIterator();
  long long v39 = v41;
  while (1)
  {
    uint64_t v12 = (morphun::Token *)v11[2];
    if (v12) {
      morphun::Token::getNext(v12);
    }
    morphun::TokenIterator::TokenIterator();
    if (!morphun::TokenIterator::operator!=()) {
      break;
    }
    BOOL v13 = (morphun::Token *)morphun::TokenIterator::operator->();
    if ((morphun::Token::isHead(v13) & 1) == 0)
    {
      unint64_t v14 = (morphun::Token *)morphun::TokenIterator::operator->();
      if ((morphun::Token::isTail(v14) & 1) == 0)
      {
        uint64_t v15 = (morphun::Token *)morphun::TokenIterator::operator->();
        uint64_t Value = morphun::Token::getValue(v15);
        int v17 = *(char *)(Value + 23);
        int v18 = v17 >= 0 ? (void *)Value : *(void **)Value;
        unint64_t v19 = v17 >= 0 ? *(unsigned __int8 *)(Value + 23) : *(void *)(Value + 8);
        unint64_t v20 = (morphun::Token *)morphun::TokenIterator::operator->();
        Cleanuint64_t Value = morphun::Token::getCleanValue(v20);
        int v22 = *(char *)(CleanValue + 23);
        int v23 = v22 >= 0 ? (void *)CleanValue : *(void **)CleanValue;
        unint64_t v24 = v22 >= 0 ? *(unsigned __int8 *)(CleanValue + 23) : *(void *)(CleanValue + 8);
        uint64_t v25 = morphun::TokenIterator::operator->();
        unsigned int v26 = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 24))(v25);
        uint64_t v27 = morphun::TokenIterator::operator->();
        uint64_t v28 = (*(uint64_t (**)(uint64_t))(*(void *)v27 + 32))(v27);
        int v29 = (morphun::Token *)morphun::TokenIterator::operator->();
        char isWhitespace = morphun::Token::isWhitespace(v29);
        unsigned int v31 = (morphun::Token *)morphun::TokenIterator::operator->();
        char isSignificant = morphun::Token::isSignificant(v31);
        *(void *)&long long v41 = v18;
        *((void *)&v41 + 1) = v19;
        v40[0] = v23;
        v40[1] = v24;
        if ((isWhitespace & 1) == 0)
        {
          char v33 = isSignificant;
          unint64_t v35 = a2[1];
          unint64_t v34 = a2[2];
          if (v24)
          {
            if (v35 < v34)
            {
              skit::Token::Token((void *)a2[1], v23, v24);
              goto LABEL_33;
            }
            uint64_t v36 = std::vector<skit::Token>::__emplace_back_slow_path<std::u16string_view &>(a2, (uint64_t)v40);
          }
          else if (v35 >= v34)
          {
            uint64_t v36 = std::vector<skit::Token>::__emplace_back_slow_path<std::u16string_view &>(a2, (uint64_t)&v41);
          }
          else
          {
            skit::Token::Token((void *)a2[1], v18, v19);
LABEL_33:
            uint64_t v36 = v35 + 48;
            a2[1] = v35 + 48;
          }
          a2[1] = v36;
          *(void *)(v36 - 24) = v26 | (unint64_t)(v28 << 32);
          if ((v33 & 1) == 0)
          {
            *(_WORD *)(v36 - 8) &= 0xFFFCu;
            *(_DWORD *)(v36 - 16) = 0;
          }
        }
      }
    }
    morphun::TokenIterator::operator++();
  }
  (*(void (**)(void *))(*v11 + 16))(v11);
  if (SHIBYTE(v38) < 0) {
    operator delete(__dst[0]);
  }
}

void sub_1D2EFF74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  (*(void (**)(uint64_t))(*(void *)v15 + 16))(v15);
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t skit::strip_bidi(const __int16 *a1, uint64_t a2, int a3)
{
  uint64_t v3 = 0;
  if (a1 && a2)
  {
    uint64_t v4 = (__int16 *)&a1[a2];
    uint64_t v5 = 2 * a2 - 2;
    unint64_t v6 = a1;
    while (1)
    {
      int16x8_t v7 = vld1q_dup_s16(v6);
      if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v7, (int16x8_t)xmmword_1D2F00790), (int8x16_t)vceqq_s16(v7, (int16x8_t)xmmword_1D2F007A0))) & 0x8000) != 0)break; {
      ++v6;
      }
      v5 -= 2;
      if (v6 == v4) {
        goto LABEL_13;
      }
    }
    if (v6 != v4 && v6 + 1 != v4)
    {
      uint64_t v8 = 1;
      uint64_t v4 = (__int16 *)v6;
      do
      {
        unsigned int v9 = (unsigned __int16)v6[v8];
        int16x8_t v10 = vdupq_n_s16(v9);
        if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v10, (int16x8_t)xmmword_1D2F00790), (int8x16_t)vceqq_s16(v10, (int16x8_t)xmmword_1D2F007A0))) & 0x8000) == 0)*v4++ = v9; {
        ++v8;
        }
        v5 -= 2;
      }
      while (v5);
LABEL_13:
      if (!a3) {
        return v4 - a1;
      }
LABEL_14:
      *uint64_t v4 = 0;
      return v4 - a1;
    }
    uint64_t v4 = (__int16 *)v6;
    if (a3) {
      goto LABEL_14;
    }
    return v4 - a1;
  }
  return v3;
}

uint64_t skit::strip_bidi(_WORD *a1, unsigned __int16 *a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = 2 * a3;
    unint64_t v6 = a1;
    do
    {
      unsigned int v7 = *a2;
      int16x8_t v8 = vdupq_n_s16(v7);
      if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v8, (int16x8_t)xmmword_1D2F00790), (int8x16_t)vceqq_s16(v8, (int16x8_t)xmmword_1D2F007A0))) & 0x8000) == 0)*v6++ = v7; {
      ++a2;
      }
      v5 -= 2;
    }
    while (v5);
    if (a4) {
      *unint64_t v6 = 0;
    }
    return v6 - a1;
  }
  return v4;
}

unint64_t skit::strip_bidi(const __int16 *a1)
{
  uint64_t v1 = (__int16 *)a1;
  uint64_t v2 = *((void *)a1 + 1);
  if (*((char *)a1 + 23) >= 0)
  {
    uint64_t v3 = *((unsigned __int8 *)a1 + 23);
  }
  else
  {
    a1 = *(const __int16 **)a1;
    uint64_t v3 = v2;
  }
  unint64_t result = skit::strip_bidi(a1, v3, 0);
  if (*((char *)v1 + 23) < 0)
  {
    unint64_t v5 = *((void *)v1 + 1);
    if (v5 >= result)
    {
      *((void *)v1 + 1) = result;
      uint64_t v1 = *(__int16 **)v1;
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v5 = *((unsigned __int8 *)v1 + 23);
    if (result <= v5)
    {
      *((unsigned char *)v1 + 23) = result & 0x7F;
LABEL_12:
      v1[result] = 0;
      return result;
    }
  }

  return (unint64_t)std::basic_string<char16_t>::append((std::basic_string<char16_t> *)v1, result - v5, 0);
}

unint64_t skit::strip_bidi@<X0>(void *__src@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8) {
    std::basic_string<char16_t>::__throw_length_error[abi:ne180100]();
  }
  if (a2 >= 0xB)
  {
    uint64_t v7 = (a2 & 0xFFFFFFFFFFFFFFFCLL) + 4;
    if ((a2 | 3) != 0xB) {
      uint64_t v7 = a2 | 3;
    }
    unint64_t v6 = std::__allocate_at_least[abi:ne180100]<std::allocator<char16_t>>(v7 + 1);
    a3[1] = a2;
    a3[2] = v8 | 0x8000000000000000;
    *a3 = v6;
  }
  else
  {
    *((unsigned char *)a3 + 23) = a2;
    unint64_t v6 = a3;
    if (!a2) {
      goto LABEL_9;
    }
  }
  memmove(v6, __src, 2 * a2);
LABEL_9:
  *((_WORD *)v6 + a2) = 0;
  return skit::strip_bidi((const __int16 *)a3);
}

void sub_1D2EFFA3C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

__CFString *skitRemoveBidiCharacters(void *a1)
{
  CFStringRef v1 = a1;
  uint64_t v2 = (__CFString *)v1;
  if (!v1) {
    goto LABEL_36;
  }
  uint64_t Length = CFStringGetLength(v1);
  if (!Length) {
    goto LABEL_31;
  }
  CharactersPtr = CFStringGetCharactersPtr(v2);
  if (!CharactersPtr)
  {
    unsigned int v9 = (UniChar *)malloc_type_malloc(2 * Length + 2, 0x1000040BDFB0063uLL);
    if (!v9) {
      goto LABEL_36;
    }
    v29.locatiouint64_t n = 0;
    v29.length = Length;
    CFStringGetCharacters(v2, v29, v9);
    int16x8_t v10 = (__int16 *)&v9[Length];
    uint64_t v11 = 2 * Length - 2;
    uint64_t v12 = (const __int16 *)v9;
    while (1)
    {
      int16x8_t v13 = vld1q_dup_s16(v12);
      if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v13, (int16x8_t)xmmword_1D2F00790), (int8x16_t)vceqq_s16(v13, (int16x8_t)xmmword_1D2F007A0))) & 0x8000) != 0)break; {
      ++v12;
      }
      v11 -= 2;
      if (v12 == v10) {
        goto LABEL_28;
      }
    }
    if (v12 == v10 || v12 + 1 == v10)
    {
      int16x8_t v10 = (__int16 *)v12;
    }
    else
    {
      uint64_t v22 = 1;
      int16x8_t v10 = (__int16 *)v12;
      do
      {
        unsigned int v23 = (unsigned __int16)v12[v22];
        int16x8_t v24 = vdupq_n_s16(v23);
        if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v24, (int16x8_t)xmmword_1D2F00790), (int8x16_t)vceqq_s16(v24, (int16x8_t)xmmword_1D2F007A0))) & 0x8000) == 0)*v10++ = v23; {
        ++v22;
        }
        v11 -= 2;
      }
      while (v11);
    }
LABEL_28:
    __int16 *v10 = 0;
    uint64_t v25 = ((char *)v10 - (char *)v9) >> 1;
    if (v25 < Length)
    {
      unint64_t v21 = (__CFString *)[[NSString alloc] initWithCharactersNoCopy:v9 length:v25 freeWhenDone:1];
LABEL_32:
      unsigned int v26 = v21;
      goto LABEL_33;
    }
    free(v9);
LABEL_31:
    unint64_t v21 = v2;
    goto LABEL_32;
  }
  if (Length < 1) {
    goto LABEL_31;
  }
  uint64_t v5 = 0;
  uint64_t v6 = 2 * Length - 2;
  while (1)
  {
    uint64_t v7 = (const __int16 *)&CharactersPtr[v5];
    int16x8_t v8 = vld1q_dup_s16(v7);
    if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v8, (int16x8_t)xmmword_1D2F00790), (int8x16_t)vceqq_s16(v8, (int16x8_t)xmmword_1D2F007A0))) & 0x8000) != 0)break; {
    ++v5;
    }
    v6 -= 2;
    if (Length == v5) {
      goto LABEL_31;
    }
  }
  unint64_t v14 = malloc_type_malloc(2 * Length, 0x1000040BDFB0063uLL);
  uint64_t v15 = v14;
  if (v14)
  {
    memcpy(v14, CharactersPtr, 2 * v5);
    char v16 = (unsigned __int16 *)(v7 + 1);
    int v17 = (const __int16 *)&CharactersPtr[Length];
    int v18 = &v15[2 * v5];
    if (v7 + 1 != v17)
    {
      do
      {
        unsigned int v19 = *v16;
        int16x8_t v20 = vdupq_n_s16(v19);
        if ((vmaxvq_u16((uint16x8_t)vorrq_s8((int8x16_t)vceqq_s16(v20, (int16x8_t)xmmword_1D2F00790), (int8x16_t)vceqq_s16(v20, (int16x8_t)xmmword_1D2F007A0))) & 0x8000) == 0)
        {
          *(_WORD *)int v18 = v19;
          v18 += 2;
        }
        ++v16;
        v6 -= 2;
      }
      while (v6);
    }
    *(_WORD *)int v18 = 0;
    unint64_t v21 = (__CFString *)[[NSString alloc] initWithCharactersNoCopy:v15 length:(v18 - v15) >> 1 freeWhenDone:1];
    goto LABEL_32;
  }
LABEL_36:
  unsigned int v26 = 0;
LABEL_33:

  return v26;
}

void sub_1D2EFFD04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1F40D8540](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>::FieldMatchImpl()
{
  while (1)
    ;
}

void skit::internal::FieldMatchesImpl<skit::SpanMatchV3>::clear()
{
  while (1)
    ;
}

void skit::internal::AliasSpanMatchImpl<skit::AliasMatch,skit::SpanMatchV3>::AliasSpanMatchImpl()
{
  while (1)
    ;
}

void skit::internal::MergedFieldMatchImpl<skit::internal::FieldMatchImpl<skit::internal::FieldMatchesImpl<skit::SpanMatchV3>>>::merge()
{
  while (1)
    ;
}

uint64_t marisa::Trie::mmap(marisa::Trie *this, const char *a2)
{
  return MEMORY[0x1F41809B8](this, a2);
}

uint64_t marisa::Trie::clear(marisa::Trie *this)
{
  return MEMORY[0x1F41809C0](this);
}

uint64_t marisa::Trie::Trie(marisa::Trie *this)
{
  return MEMORY[0x1F41809C8](this);
}

void marisa::Trie::~Trie(marisa::Trie *this)
{
}

uint64_t marisa::Agent::set_query(marisa::Agent *this, const char *a2)
{
  return MEMORY[0x1F41809D8](this, a2);
}

uint64_t marisa::Agent::set_query(marisa::Agent *this)
{
  return MEMORY[0x1F41809E0](this);
}

uint64_t marisa::Agent::Agent(marisa::Agent *this)
{
  return MEMORY[0x1F41809E8](this);
}

void marisa::Agent::~Agent(marisa::Agent *this)
{
}

uint64_t morphun::TokenIterator::TokenIterator()
{
  return MEMORY[0x1F4180E68]();
}

uint64_t morphun::TokenIterator::operator++()
{
  return MEMORY[0x1F4180E70]();
}

uint64_t morphun::TokenizerFactory::createTokenizer()
{
  return MEMORY[0x1F4180E78]();
}

uint64_t marisa::Trie::reverse_lookup(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x1F41809F8](this, a2);
}

uint64_t marisa::Trie::predictive_search(marisa::Trie *this, marisa::Agent *a2)
{
  return MEMORY[0x1F4180A00](this, a2);
}

uint64_t morphun::TokenIterator::operator!=()
{
  return MEMORY[0x1F4181058]();
}

uint64_t morphun::TokenIterator::operator->()
{
  return MEMORY[0x1F4181060]();
}

uint64_t morphun::Token::isWhitespace(morphun::Token *this)
{
  return MEMORY[0x1F41810A0](this);
}

uint64_t morphun::Token::getCleanValue(morphun::Token *this)
{
  return MEMORY[0x1F41810A8](this);
}

uint64_t morphun::Token::isSignificant(morphun::Token *this)
{
  return MEMORY[0x1F41810B0](this);
}

uint64_t morphun::Token::isHead(morphun::Token *this)
{
  return MEMORY[0x1F41810B8](this);
}

uint64_t morphun::Token::isTail(morphun::Token *this)
{
  return MEMORY[0x1F41810C0](this);
}

uint64_t morphun::Token::getNext(morphun::Token *this)
{
  return MEMORY[0x1F41810C8](this);
}

uint64_t morphun::Token::getValue(morphun::Token *this)
{
  return MEMORY[0x1F41810D0](this);
}

std::string *__cdecl std::error_code::message(std::string *__return_ptr retstr, const std::error_code *this)
{
  return (std::string *)MEMORY[0x1F417E360](retstr, this);
}

const std::__fs::filesystem::directory_entry *__cdecl std::__fs::filesystem::directory_iterator::__dereference(const std::__fs::filesystem::directory_iterator *this)
{
  return (const std::__fs::filesystem::directory_entry *)MEMORY[0x1F417E3B0](this);
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__filename(const std::__fs::filesystem::path *this)
{
  CFStringRef v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3C0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__extension(const std::__fs::filesystem::path *this)
{
  CFStringRef v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3C8](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__parent_path(const std::__fs::filesystem::path *this)
{
  CFStringRef v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3D0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__root_directory(const std::__fs::filesystem::path *this)
{
  CFStringRef v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3D8](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

std::__fs::filesystem::path::__string_view std::__fs::filesystem::path::__stem(const std::__fs::filesystem::path *this)
{
  CFStringRef v1 = (const std::string_view::value_type *)MEMORY[0x1F417E3F0](this);
  result.__size_ = v2;
  result.__data_ = v1;
  return result;
}

int std::__fs::filesystem::path::__compare(const std::__fs::filesystem::path *this, std::__fs::filesystem::path::__string_view a2)
{
  return MEMORY[0x1F417E3F8](this, a2.__data_, a2.__size_);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1F417E408](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1F417E418](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1F417E4B8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1F417E588](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
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
  return (std::string *)MEMORY[0x1F417E670](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1F417E848]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1F417E850]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1F417E890]();
}

{
  return MEMORY[0x1F417E8A0]();
}

{
  return MEMORY[0x1F417E8C0]();
}

const std::error_category *std::system_category(void)
{
  return (const std::error_category *)MEMORY[0x1F417E9E0]();
}

void std::__narrow_to_utf8<16ul>::~__narrow_to_utf8(std::__narrow_to_utf8<16> *this)
{
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__throw_runtime_error(const char *a1)
{
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::__increment(std::__fs::filesystem::directory_iterator *this, std::error_code *__ec)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x1F417EB70](this, __ec);
}

std::__fs::filesystem::directory_iterator *__cdecl std::__fs::filesystem::directory_iterator::directory_iterator(std::__fs::filesystem::directory_iterator *this, const std::__fs::filesystem::path *a2, std::error_code *a3, std::__fs::filesystem::directory_options a4)
{
  return (std::__fs::filesystem::directory_iterator *)MEMORY[0x1F417EB78](this, a2, a3, a4);
}

BOOL std::__fs::filesystem::__create_directories(const std::__fs::filesystem::path *a1, std::error_code *a2)
{
  return MEMORY[0x1F417EB80](a1, a2);
}

std::__fs::filesystem::path *__cdecl std::__fs::filesystem::path::replace_extension(std::__fs::filesystem::path *this, const std::__fs::filesystem::path *__replacement)
{
  return (std::__fs::filesystem::path *)MEMORY[0x1F417EBA0](this, __replacement);
}

std::__fs::filesystem::file_status std::__fs::filesystem::__status(const std::__fs::filesystem::path *a1, std::error_code *__ec)
{
  return (std::__fs::filesystem::file_status)MEMORY[0x1F417EBC8](a1, __ec);
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1F417EEC8](this);
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
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
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

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40C9CF8](*(void *)&a1);
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

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

float expf(float a1)
{
  MEMORY[0x1F40CBFF8](a1);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1F40CC2D8](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CC2F0](*(void *)&a1, a2);
}

float log10f(float a1)
{
  MEMORY[0x1F40CC888](a1);
  return result;
}

float logf(float a1)
{
  MEMORY[0x1F40CC8C0](a1);
  return result;
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCB08](a1, a2, *(void *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB88](alignment, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CCCE8](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40CCE78](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

int nftw(const char *a1, int (__cdecl *a2)(const char *, const stat *, int, FTW *), int a3, int a4)
{
  return MEMORY[0x1F40CD018](a1, a2, *(void *)&a3, *(void *)&a4);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1F40CDD10](__p, __ec);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1F40CDD70](a1, a2, *(void *)&a3);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1F40CDD90](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2E0](__str, __endptr, *(void *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

uint64_t uset_contains()
{
  return MEMORY[0x1F41806E0]();
}

uint64_t uset_freeze()
{
  return MEMORY[0x1F41806F0]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x1F4180720]();
}

void uuid_clear(uuid_t uu)
{
}

void uuid_generate_random(uuid_t out)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CE658](uu);
}

void uuid_unparse_lower(const uuid_t uu, uuid_string_t out)
{
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1F40CE938](*(void *)&a1, a2, *(void *)&a3);
}