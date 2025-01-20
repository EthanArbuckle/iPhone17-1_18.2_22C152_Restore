BOOL CFStringsAreEqual(const __CFString *a1, const __CFString *a2)
{
  return CFEqual(a1, a2);
}

CFStringRef createCFStringFromString(uint64_t a1)
{
  v1 = (const UInt8 *)a1;
  if ((*(char *)(a1 + 23) & 0x80000000) == 0)
  {
    CFIndex v2 = *(unsigned __int8 *)(a1 + 23);
    if (!*(unsigned char *)(a1 + 23)) {
      return &stru_270C36558;
    }
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, v2, 0x8000100u, 0);
  }
  CFIndex v2 = *(void *)(a1 + 8);
  if (v2)
  {
    v1 = *(const UInt8 **)a1;
    return CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x263EFFB08], v1, v2, 0x8000100u, 0);
  }
  return &stru_270C36558;
}

void *getUTF8StringFromCFString@<X0>(const __CFString *a1@<X0>, void *a2@<X8>)
{
  if (a1)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    operator new[]();
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, "");
}

void sub_26031B720(_Unwind_Exception *a1)
{
  MEMORY[0x26120D610](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void getFileSystemRepresentationFromCFURL(const __CFURL *a1)
{
}

void sub_26031B7D0(_Unwind_Exception *a1)
{
  MEMORY[0x26120D610](v1, 0x1000C8077774924);
  _Unwind_Resume(a1);
}

void splitWithChar(uint64_t *a1, unsigned __int8 a2, uint64_t a3)
{
  std::string::basic_string[abi:ne180100]<0>(&v40, "");
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v7 = *((unsigned __int8 *)a1 + 23);
    if (*((char *)a1 + 23) < 0) {
      break;
    }
    unint64_t v8 = *((unsigned __int8 *)a1 + 23);
    if (i >= v7) {
      goto LABEL_46;
    }
LABEL_6:
    if (v8 <= i) {
      goto LABEL_65;
    }
    if ((v7 & 0x80u) == 0) {
      v9 = a1;
    }
    else {
      v9 = (uint64_t *)*a1;
    }
    int v10 = *((unsigned __int8 *)v9 + i);
    if (v10 == a2)
    {
      if (i)
      {
        if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
          std::string::__init_copy_ctor_external(&__p, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
        }
        else {
          std::string __p = v40;
        }
        unint64_t v12 = *(void *)(a3 + 8);
        unint64_t v18 = *(void *)(a3 + 16);
        if (v12 < v18)
        {
LABEL_29:
          long long v19 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *(void *)(v12 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
          *(_OWORD *)unint64_t v12 = v19;
          *(void *)(a3 + 8) = v12 + 24;
LABEL_41:
          if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0)
          {
            v40.__r_.__value_.__l.__size_ = 0;
            v26 = (std::string *)v40.__r_.__value_.__r.__words[0];
          }
          else
          {
            *((unsigned char *)&v40.__r_.__value_.__s + 23) = 0;
            v26 = &v40;
          }
          v26->__r_.__value_.__s.__data_[0] = 0;
          continue;
        }
        unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - *(void *)a3) >> 3);
        unint64_t v20 = v13 + 1;
        if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v21 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v18 - *(void *)a3) >> 3);
        if (2 * v21 > v20) {
          unint64_t v20 = 2 * v21;
        }
        if (v21 >= 0x555555555555555) {
          unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v16 = v20;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a3 + 16);
        if (!v16)
        {
          v17 = 0;
          goto LABEL_39;
        }
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(&__p, "");
        unint64_t v12 = *(void *)(a3 + 8);
        unint64_t v11 = *(void *)(a3 + 16);
        if (v12 < v11) {
          goto LABEL_29;
        }
        unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - *(void *)a3) >> 3);
        unint64_t v14 = v13 + 1;
        if (v13 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<std::string>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - *(void *)a3) >> 3);
        if (2 * v15 > v14) {
          unint64_t v14 = 2 * v15;
        }
        if (v15 >= 0x555555555555555) {
          unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v16 = v14;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a3 + 16);
        if (!v16)
        {
          v17 = 0;
LABEL_39:
          v22 = v17 + v13;
          __v.__first_ = v17;
          __v.__begin_ = v22;
          __v.__end_cap_.__value_ = &v17[v16];
          long long v23 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v22->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
          memset(&__p, 0, sizeof(__p));
          __v.__end_ = v22 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a3, &__v);
          uint64_t v24 = *(void *)(a3 + 8);
          std::__split_buffer<std::string>::~__split_buffer(&__v);
          int v25 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
          *(void *)(a3 + 8) = v24;
          if (v25 < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
          goto LABEL_41;
        }
      }
      v17 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a3 + 16, v16);
      goto LABEL_39;
    }
    if ((v7 & 0x80u) != 0) {
      unint64_t v7 = a1[1];
    }
    if (v7 <= i) {
LABEL_65:
    }
      std::string::__throw_out_of_range[abi:ne180100]();
    std::string::push_back(&v40, v10);
  }
  unint64_t v8 = a1[1];
  if (v8 > i) {
    goto LABEL_6;
  }
LABEL_46:
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&__p, v40.__r_.__value_.__l.__data_, v40.__r_.__value_.__l.__size_);
  }
  else {
    std::string __p = v40;
  }
  unint64_t v28 = *(void *)(a3 + 8);
  unint64_t v27 = *(void *)(a3 + 16);
  if (v28 >= v27)
  {
    unint64_t v30 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v28 - *(void *)a3) >> 3);
    unint64_t v31 = v30 + 1;
    if (v30 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v32 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v27 - *(void *)a3) >> 3);
    if (2 * v32 > v31) {
      unint64_t v31 = 2 * v32;
    }
    if (v32 >= 0x555555555555555) {
      unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v33 = v31;
    }
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a3 + 16);
    if (v33) {
      v34 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a3 + 16, v33);
    }
    else {
      v34 = 0;
    }
    v35 = v34 + v30;
    __v.__first_ = v34;
    __v.__begin_ = v35;
    __v.__end_cap_.__value_ = &v34[v33];
    long long v36 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    v35->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
    *(_OWORD *)&v35->__r_.__value_.__l.__data_ = v36;
    memset(&__p, 0, sizeof(__p));
    __v.__end_ = v35 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a3, &__v);
    uint64_t v37 = *(void *)(a3 + 8);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
    int v38 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    *(void *)(a3 + 8) = v37;
    if (v38 < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    long long v29 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(void *)(v28 + 16) = *((void *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)unint64_t v28 = v29;
    *(void *)(a3 + 8) = v28 + 24;
  }
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v40.__r_.__value_.__l.__data_);
  }
}

void sub_26031BC0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,std::__split_buffer<std::string> *a22)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

CFStringRef TLCreateStringWithValidatedFormat(CFStringRef validFormatSpecifiers, CFStringRef format, ...)
{
  va_start(va, format);
  errorPtr[0] = 0;
  va_copy((va_list)&errorPtr[1], va);
  CFStringRef StringWithValidatedFormatAndArguments = CFStringCreateStringWithValidatedFormatAndArguments((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, validFormatSpecifiers, format, va, errorPtr);
  if (errorPtr[0])
  {
    CFStringRef v4 = CFErrorCopyDescription(errorPtr[0]);
    v5 = _nlpDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      TLCreateStringWithValidatedFormat((uint64_t)format, (uint64_t)v4, v5);
    }
    CFRelease(errorPtr[0]);
    if (v4) {
      CFRelease(v4);
    }
  }
  return StringWithValidatedFormatAndArguments;
}

void sub_26031BD30(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
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
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    v6 = a1;
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265552378, MEMORY[0x263F8C060]);
}

void sub_26031BE60(_Unwind_Exception *a1)
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

void __clang_call_terminate(void *a1)
{
}

void std::string::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_265552380, MEMORY[0x263F8C068]);
}

void sub_26031BF50(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::vector<std::string>::__throw_length_error[abi:ne180100]()
{
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
      size_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        size_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
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

void nlp::CFScopedPtr<__CFString const*>::reset(const void **a1, const void *a2)
{
  size_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void sub_26031C4CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_26031C580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_26031C690(_Unwind_Exception *a1)
{
  MEMORY[0x26120D630](v5, 0x1060C409BD8606FLL);

  _Unwind_Resume(a1);
}

void sub_26031C890(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_26031CBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *__p, uint64_t a5, int a6, __int16 a7, char a8, char a9, uint64_t a10, void *a11, uint64_t *__pa, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,std::__split_buffer<std::string> *a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  __pa = &a26;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);
  __pa = (uint64_t *)&a23;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__pa);

  _Unwind_Resume(a1);
}

void std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100](void ***a1)
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
        v4 -= 80;
        std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v4);
      }
      while ((void *)v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
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

TLCompositeTransliterator *std::unique_ptr<TLCompositeTransliterator>::reset[abi:ne180100](TLCompositeTransliterator **a1, TLCompositeTransliterator *a2)
{
  result = *a1;
  *a1 = a2;
  if (result)
  {
    TLCompositeTransliterator::~TLCompositeTransliterator(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

void TLDevanagariOrthographyChecker::TLDevanagariOrthographyChecker(TLDevanagariOrthographyChecker *this, const __CFString *a2)
{
  *(void *)this = &unk_270C36108;
  *((void *)this + 1) = @"‍";
  *((void *)this + 2) = @"़";
  *((void *)this + 3) = @"्";
  *((void *)this + 4) = @"ः";
  *((void *)this + 5) = @"ं";
  *((void *)this + 6) = @"ँ";
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, *((CFStringRef *)this + 2));
  CFStringAppend(Mutable, *((CFStringRef *)this + 3));
  CFStringAppend(Mutable, *((CFStringRef *)this + 4));
  CFStringAppend(Mutable, *((CFStringRef *)this + 5));
  CFStringAppend(Mutable, *((CFStringRef *)this + 6));
  CFStringAppend(Mutable, @"ा");
  CFStringAppend(Mutable, @"ि");
  CFStringAppend(Mutable, @"ी");
  CFStringAppend(Mutable, @"ु");
  CFStringAppend(Mutable, @"ू");
  CFStringAppend(Mutable, @"ृ");
  CFStringAppend(Mutable, @"ॄ");
  CFStringAppend(Mutable, @"ॅ");
  CFStringAppend(Mutable, @"े");
  CFStringAppend(Mutable, @"ै");
  CFStringAppend(Mutable, @"ॉ");
  CFStringAppend(Mutable, @"ो");
  CFStringAppend(Mutable, @"ौ");
  *((void *)this + 7) = CFCharacterSetCreateWithCharactersInString(0, Mutable);
  CFRelease(Mutable);
  CFMutableStringRef v5 = CFStringCreateMutable(0, 0);
  CFStringAppend(v5, @"ऋ");
  CFStringAppend(v5, @"क");
  CFStringAppend(v5, @"ख");
  CFStringAppend(v5, @"ग");
  CFStringAppend(v5, @"घ");
  CFStringAppend(v5, @"ङ");
  CFStringAppend(v5, @"च");
  CFStringAppend(v5, @"छ");
  CFStringAppend(v5, @"ज");
  CFStringAppend(v5, @"झ");
  CFStringAppend(v5, @"ञ");
  CFStringAppend(v5, @"ट");
  CFStringAppend(v5, @"ठ");
  CFStringAppend(v5, @"ड");
  CFStringAppend(v5, @"ढ");
  CFStringAppend(v5, @"ण");
  CFStringAppend(v5, @"त");
  CFStringAppend(v5, @"थ");
  CFStringAppend(v5, @"द");
  CFStringAppend(v5, @"ध");
  CFStringAppend(v5, @"न");
  CFStringAppend(v5, @"प");
  CFStringAppend(v5, @"फ");
  CFStringAppend(v5, @"ब");
  CFStringAppend(v5, @"भ");
  CFStringAppend(v5, @"म");
  CFStringAppend(v5, @"य");
  CFStringAppend(v5, @"र");
  CFStringAppend(v5, @"ल");
  CFStringAppend(v5, @"व");
  CFStringAppend(v5, @"श");
  CFStringAppend(v5, @"ष");
  CFStringAppend(v5, @"स");
  CFStringAppend(v5, @"ह");
  CFStringAppend(v5, @"क़");
  CFStringAppend(v5, @"ख़");
  CFStringAppend(v5, @"ग़");
  CFStringAppend(v5, @"ज़");
  CFStringAppend(v5, @"ड़");
  CFStringAppend(v5, @"ढ़");
  CFStringAppend(v5, @"फ़");
  CFStringAppend(v5, @"ॹ");
  CFStringAppend(v5, @"ॐ");
  if (CFEqual(a2, @"mr"))
  {
    CFStringAppend(v5, @"ऱ");
    CFStringAppend(v5, @"ळ");
  }
  *((void *)this + 8) = CFCharacterSetCreateWithCharactersInString(0, v5);
  CFRelease(v5);
  CFMutableStringRef v6 = CFStringCreateMutable(0, 0);
  CFStringAppend(v6, @"ङ");
  CFStringAppend(v6, @"ञ");
  CFStringAppend(v6, @"ण");
  CFStringAppend(v6, @"न");
  CFStringAppend(v6, @"म");
  *((void *)this + 9) = CFCharacterSetCreateWithCharactersInString(0, v6);
  CFRelease(v6);
  CFMutableStringRef v7 = CFStringCreateMutable(0, 0);
  CFStringAppend(v7, @"क");
  CFStringAppend(v7, @"ख");
  CFStringAppend(v7, @"ग");
  CFStringAppend(v7, @"घ");
  CFStringAppend(v7, @"ङ");
  *((void *)this + 10) = CFCharacterSetCreateWithCharactersInString(0, v7);
  CFRelease(v7);
  CFMutableStringRef v8 = CFStringCreateMutable(0, 0);
  CFStringAppend(v8, @"च");
  CFStringAppend(v8, @"छ");
  CFStringAppend(v8, @"ज");
  CFStringAppend(v8, @"झ");
  CFStringAppend(v8, @"ञ");
  *((void *)this + 11) = CFCharacterSetCreateWithCharactersInString(0, v8);
  CFRelease(v8);
  CFMutableStringRef v9 = CFStringCreateMutable(0, 0);
  CFStringAppend(v9, @"ट");
  CFStringAppend(v9, @"ठ");
  CFStringAppend(v9, @"ड");
  CFStringAppend(v9, @"ढ");
  CFStringAppend(v9, @"ण");
  *((void *)this + 12) = CFCharacterSetCreateWithCharactersInString(0, v9);
  CFRelease(v9);
  CFMutableStringRef v10 = CFStringCreateMutable(0, 0);
  CFStringAppend(v10, @"ट");
  CFStringAppend(v10, @"ठ");
  CFStringAppend(v10, @"ड");
  CFStringAppend(v10, @"ढ");
  CFStringAppend(v10, @"ण");
  CFStringAppend(v10, @"य");
  CFStringAppend(v10, @"व");
  CFStringAppend(v10, @"श");
  CFStringAppend(v10, @"ष");
  CFStringAppend(v10, @"स");
  CFStringAppend(v10, @"ह");
  *((void *)this + 13) = CFCharacterSetCreateWithCharactersInString(0, v10);
  CFRelease(v10);
  CFMutableStringRef v11 = CFStringCreateMutable(0, 0);
  CFStringAppend(v11, @"क़");
  CFStringAppend(v11, @"ख़");
  CFStringAppend(v11, @"ग़");
  CFStringAppend(v11, @"ज़");
  CFStringAppend(v11, @"ड़");
  CFStringAppend(v11, @"ढ़");
  CFStringAppend(v11, @"फ़");
  CFStringAppend(v11, @"ॹ");
  *((void *)this + 14) = CFCharacterSetCreateWithCharactersInString(0, v11);
  CFRelease(v11);
  CFMutableStringRef v12 = CFStringCreateMutable(0, 0);
  CFStringAppend(v12, @"अ");
  CFStringAppend(v12, @"आ");
  CFStringAppend(v12, @"इ");
  CFStringAppend(v12, @"ई");
  CFStringAppend(v12, @"उ");
  CFStringAppend(v12, @"ऊ");
  CFStringAppend(v12, @"ऋ");
  CFStringAppend(v12, @"ऍ");
  CFStringAppend(v12, @"ए");
  CFStringAppend(v12, @"ऐ");
  CFStringAppend(v12, @"ऑ");
  CFStringAppend(v12, @"ओ");
  CFStringAppend(v12, @"औ");
  *((void *)this + 15) = CFCharacterSetCreateWithCharactersInString(0, v12);
  CFRelease(v12);
  CFMutableStringRef v13 = CFStringCreateMutable(0, 0);
  CFStringAppend(v13, @"०");
  CFStringAppend(v13, @"१");
  CFStringAppend(v13, @"२");
  CFStringAppend(v13, @"३");
  CFStringAppend(v13, @"४");
  CFStringAppend(v13, @"५");
  CFStringAppend(v13, @"६");
  CFStringAppend(v13, @"७");
  CFStringAppend(v13, @"८");
  CFStringAppend(v13, @"९");
  CFStringAppend(v13, @"‍");
  CFCharacterSetRef v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  CFRelease(v13);
  MutableCopy = CFCharacterSetCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], *((CFCharacterSetRef *)this + 15));
  CFCharacterSetUnion(MutableCopy, *((CFCharacterSetRef *)this + 8));
  CFCharacterSetUnion(MutableCopy, *((CFCharacterSetRef *)this + 7));
  CFCharacterSetUnion(MutableCopy, v14);
  CFRelease(v14);
  *((void *)this + 16) = CFCharacterSetCreateInvertedSet(0, MutableCopy);
  CFRelease(MutableCopy);
}

void TLDevanagariOrthographyChecker::~TLDevanagariOrthographyChecker(CFTypeRef *this)
{
  *this = &unk_270C36108;
  CFRelease(this[7]);
  CFRelease(this[8]);
  CFRelease(this[9]);
  CFRelease(this[10]);
  CFRelease(this[11]);
  CFRelease(this[12]);
  CFRelease(this[13]);
  CFRelease(this[14]);
  CFRelease(this[15]);
  CFRelease(this[16]);
}

{
  uint64_t vars8;

  TLDevanagariOrthographyChecker::~TLDevanagariOrthographyChecker(this);
  JUMPOUT(0x26120D630);
}

BOOL TLDevanagariOrthographyChecker::isVowelSign(TLDevanagariOrthographyChecker *this, const __CFString *a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, @"ऽ");
  CFStringAppend(Mutable, @"ा");
  CFStringAppend(Mutable, @"ि");
  CFStringAppend(Mutable, @"ी");
  CFStringAppend(Mutable, @"ु");
  CFStringAppend(Mutable, @"ू");
  CFStringAppend(Mutable, @"ृ");
  CFStringAppend(Mutable, @"ॄ");
  CFStringAppend(Mutable, @"ॅ");
  CFStringAppend(Mutable, @"े");
  CFStringAppend(Mutable, @"ै");
  CFStringAppend(Mutable, @"ॉ");
  CFStringAppend(Mutable, @"ो");
  CFStringAppend(Mutable, @"ौ");
  CFCharacterSetRef v4 = CFCharacterSetCreateWithCharactersInString(0, Mutable);
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v4);
  CFRelease(Mutable);
  CFRelease(v4);
  v8.length = CFStringGetLength(a2);
  v8.location = 0;
  BOOL v6 = CFStringFindCharacterFromSet(a2, InvertedSet, v8, 0, 0) == 0;
  CFRelease(InvertedSet);
  return v6;
}

BOOL TLDevanagariOrthographyChecker::canCandrabinduFollowVowelSign(TLDevanagariOrthographyChecker *this, CFStringRef theString1)
{
  return CFEqual(theString1, @"ा")
      || CFEqual(theString1, @"ु")
      || CFEqual(theString1, @"ू");
}

BOOL TLDevanagariOrthographyChecker::canNuktaFollowLetter(TLDevanagariOrthographyChecker *this, const __CFString *a2)
{
  CFCharacterSetRef v3 = CFCharacterSetCreateWithCharactersInString(0, @"कखगजडढफ");
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v3);
  CFRelease(@"कखगजडढफ");
  CFRelease(v3);
  v7.length = CFStringGetLength(a2);
  v7.location = 0;
  BOOL v5 = CFStringFindCharacterFromSet(a2, InvertedSet, v7, 0, 0) == 0;
  CFRelease(InvertedSet);
  return v5;
}

BOOL TLDevanagariOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  if (CFEqual(theString1, this[2])) {
    return 1;
  }
  CFCharacterSetRef v4 = (const __CFCharacterSet *)this[8];
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLDevanagariOrthographyChecker::canViramaPrecedeLetter(TLDevanagariOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v4 = (const __CFCharacterSet *)*((void *)this + 8);
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFEqual(theString, *((CFStringRef *)this + 1));
}

BOOL TLDevanagariOrthographyChecker::canZWJFollowSequence(TLDevanagariOrthographyChecker *this, CFStringRef theString)
{
  return CFStringHasSuffix(theString, @"र्") != 0;
}

CFMutableStringRef TLDevanagariOrthographyChecker::stringByCorrectingIllegalVowelLetters(TLDevanagariOrthographyChecker *this, const __CFString *a2)
{
  v14[0] = 0;
  v14[1] = 0;
  CFMutableStringRef v12 = @"अा";
  CFMutableStringRef v13 = (uint64_t *)v14;
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"आ";
  CFMutableStringRef v12 = @"अो";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"ओ";
  CFMutableStringRef v12 = @"अाे";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"ओ";
  CFMutableStringRef v12 = @"आे";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"ओ";
  CFMutableStringRef v12 = @"अौ";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"औ";
  CFMutableStringRef v12 = @"अाै";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"औ";
  CFMutableStringRef v12 = @"आै";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"औ";
  CFMutableStringRef v12 = @"एॅ";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"ऍ";
  CFMutableStringRef v12 = @"अॉ";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"ऑ";
  CFMutableStringRef v12 = @"अाॅ";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"ऑ";
  CFMutableStringRef v12 = @"आॅ";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"ऑ";
  CFMutableStringRef v12 = @"अॅ";
  long long v15 = &v12;
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(&v13, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v15)[5] = @"ॲ";
  CFIndex Length = CFStringGetLength(a2);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, Length, a2);
  BOOL v5 = v13;
  if (v13 != (uint64_t *)v14)
  {
    do
    {
      CFStringRef v6 = (const __CFString *)v5[5];
      CFRange v7 = CFStringFind(MutableCopy, (CFStringRef)v5[4], 0);
      if (v7.length >= 1) {
        CFStringReplace(MutableCopy, v7, v6);
      }
      CFRange v8 = (uint64_t *)v5[1];
      if (v8)
      {
        do
        {
          CFMutableStringRef v9 = v8;
          CFRange v8 = (uint64_t *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          CFMutableStringRef v9 = (uint64_t *)v5[2];
          BOOL v10 = *v9 == (void)v5;
          BOOL v5 = v9;
        }
        while (!v10);
      }
      BOOL v5 = v9;
    }
    while (v9 != (uint64_t *)v14);
  }
  std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::destroy((uint64_t)&v13, v14[0]);
  return MutableCopy;
}

void sub_26031E094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

BOOL TLDevanagariOrthographyChecker::checkSpelling(TLDevanagariOrthographyChecker *this, CFStringRef theString, __CFString **a3, const __CFString **a4)
{
  uint64_t v81 = *MEMORY[0x263EF8340];
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v82.CFIndex location = 0;
  v82.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v82, 0, &result))
  {
    CFIndex v9 = 0;
    CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (!result.location) {
        goto LABEL_51;
      }
      if (location != 0x7FFFFFFFFFFFFFFFLL && result.location == v9 + location)
      {
        v83.CFIndex location = location;
        v83.length = v9;
        CFStringRef v11 = CFStringCreateWithSubstring(0, theString, v83);
        CFStringRef v12 = CFStringCreateWithSubstring(0, theString, result);
        if ((CFStringCompare(v11, *((CFStringRef *)this + 2), 0)
           || CFEqual(v12, *((CFStringRef *)this + 2)))
          && (CFStringCompare(v12, *((CFStringRef *)this + 5), 0)
           || !TLDevanagariOrthographyChecker::isVowelSign(0, v11))
          && (CFStringCompare(v12, *((CFStringRef *)this + 6), 0)
           || !TLDevanagariOrthographyChecker::canCandrabinduFollowVowelSign(0, v11))
          && (CFStringCompare(v12, *((CFStringRef *)this + 4), 0)
           || !TLDevanagariOrthographyChecker::isVowelSign(0, v11)))
        {
          if (v11) {
            CFRelease(v11);
          }
          if (v12) {
            CFRelease(v12);
          }
LABEL_51:
          BOOL v24 = 0;
          CFStringRef v25 = @"illegal diacritic placement";
          goto LABEL_131;
        }
        if (v11) {
          CFRelease(v11);
        }
        if (v12) {
          CFRelease(v12);
        }
      }
      CFIndex location = result.location;
      CFIndex v9 = result.length;
      v84.CFIndex location = result.length + result.location;
      v84.length = Length - (result.length + result.location);
    }
    while (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v84, 0, &result));
  }
  CFRange result = (CFRange)xmmword_260333360;
  CFStringRef v13 = (const __CFString *)*((void *)this + 2);
  CFStringRef v14 = theString;
  v15.CFIndex location = 0;
  v15.length = Length;
  while (CFStringFindWithOptions(v14, v13, v15, 0, &result))
  {
    if (!result.location) {
      goto LABEL_46;
    }
    v85.CFIndex location = result.location - 1;
    v85.length = 1;
    unint64_t v16 = (__CFString *)CFStringCreateWithSubstring(0, theString, v85);
    if (!TLDevanagariOrthographyChecker::canNuktaFollowLetter((TLDevanagariOrthographyChecker *)v16, v16))
    {
      if (v16) {
        CFRelease(v16);
      }
LABEL_46:
      BOOL v24 = 0;
      CFStringRef v25 = @"illegal nukta placement";
      goto LABEL_131;
    }
    if (v16) {
      CFRelease(v16);
    }
    v15.CFIndex location = result.length + result.location;
    v15.length = Length - (result.length + result.location);
    CFStringRef v13 = (const __CFString *)*((void *)this + 2);
    CFStringRef v14 = theString;
  }
  CFRange result = (CFRange)xmmword_260333360;
  CFStringRef v17 = (const __CFString *)*((void *)this + 3);
  CFStringRef v18 = theString;
  v19.CFIndex location = 0;
  v19.length = Length;
  while (CFStringFindWithOptions(v18, v17, v19, 0, &result))
  {
    if (!result.location) {
      goto LABEL_56;
    }
    v86.CFIndex location = result.location - 1;
    v86.length = 1;
    CFStringRef v20 = CFStringCreateWithSubstring(0, theString, v86);
    if (result.location + 1 >= Length)
    {
      CFStringRef v21 = 0;
      if (!TLDevanagariOrthographyChecker::canViramaFollowLetter((CFStringRef *)this, v20))
      {
LABEL_52:
        if (v20) {
          CFRelease(v20);
        }
        if (v21) {
          CFRelease(v21);
        }
LABEL_56:
        BOOL v24 = 0;
        CFStringRef v25 = @"illegal virama placement";
        goto LABEL_131;
      }
LABEL_37:
      char v22 = 1;
      if (!v20) {
        goto LABEL_39;
      }
LABEL_38:
      CFRelease(v20);
      goto LABEL_39;
    }
    v87.length = 1;
    v87.CFIndex location = result.location + 1;
    CFStringRef v21 = CFStringCreateWithSubstring(0, theString, v87);
    if (!TLDevanagariOrthographyChecker::canViramaFollowLetter((CFStringRef *)this, v20)) {
      goto LABEL_52;
    }
    if (!v21) {
      goto LABEL_37;
    }
    if (!TLDevanagariOrthographyChecker::canViramaPrecedeLetter(this, v21)) {
      goto LABEL_52;
    }
    char v22 = 0;
    if (v20) {
      goto LABEL_38;
    }
LABEL_39:
    if ((v22 & 1) == 0) {
      CFRelease(v21);
    }
    v19.CFIndex location = result.length + result.location;
    v19.length = Length - (result.length + result.location);
    CFStringRef v17 = (const __CFString *)*((void *)this + 3);
    CFStringRef v18 = theString;
  }
  if (a3) {
    CFArrayRef Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  }
  else {
    CFArrayRef Mutable = 0;
  }
  CFIndex v26 = CFStringGetLength(theString);
  v88.CFIndex location = 0;
  v88.length = v26;
  v72 = (const __CFString **)a3;
  theArray = Mutable;
  CFStringRef v25 = 0;
  if (!CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 9), v88, 0, &range))
  {
    if (!Mutable) {
      goto LABEL_110;
    }
    char v27 = 1;
LABEL_100:
    if (CFArrayGetCount(Mutable) >= 1)
    {
      char v70 = v27;
      CFStringRef v71 = v25;
      theStringa = CFStringCreateMutableCopy(0, 0, theString);
      CFIndex Count = CFArrayGetCount(Mutable);
      if (Count >= 1)
      {
        unint64_t v40 = Count + 1;
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Mutable, v40 - 2);
          CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"range.location");
          CFNumberRef v43 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"range.length");
          CFRange result = (CFRange)xmmword_260333350;
          CFNumberGetValue(Value, kCFNumberCFIndexType, &result);
          CFNumberGetValue(v43, kCFNumberCFIndexType, &result.length);
          CFStringRef v44 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"replacement");
          v45.CFIndex location = result.location;
          if (result.location != -1)
          {
            v45.length = result.length;
            if (result.length >= 1)
            {
              if (v44) {
                CFStringReplace(theStringa, v45, v44);
              }
            }
          }
          --v40;
          CFArrayRef Mutable = theArray;
        }
        while (v40 > 1);
      }
      *a3 = theStringa;
      CFStringRef v25 = v71;
      char v27 = v70;
    }
    CFRelease(Mutable);
    if (v27) {
      goto LABEL_110;
    }
LABEL_130:
    BOOL v24 = 0;
    goto LABEL_131;
  }
  char v27 = 1;
  while (2)
  {
    if (range.location + 2 >= v26 || CFStringGetCharacterAtIndex(theString, range.location + 1) != 2381) {
      goto LABEL_93;
    }
    int CharacterAtIndex = CFStringGetCharacterAtIndex(theString, range.location);
    UniChar v29 = CFStringGetCharacterAtIndex(theString, range.location + 2);
    if (CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 14), v29)) {
      BOOL v30 = 1;
    }
    else {
      BOOL v30 = range.location + 3 < v26 && CFStringGetCharacterAtIndex(theString, range.location + 3) == 2364;
    }
    if (CharacterAtIndex > 2338)
    {
      if (CharacterAtIndex != 2339)
      {
        if (CharacterAtIndex == 2344
          && (CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 10), v29)
           || CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 11), v29)
           || CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 12), v29))
          && (range.location < 1 || CFStringGetCharacterAtIndex(theString, range.location) != 2381))
        {
          if (Mutable)
          {
            CFRange result = (CFRange)xmmword_265552400;
            v80 = @"replacement";
            CFIndex valuePtr = range.location;
            uint64_t v76 = 2;
            CFNumberRef v32 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
            CFNumberRef v33 = CFNumberCreate(0, kCFNumberCFIndexType, &v76);
            values[0] = v32;
            values[1] = v33;
            values[2] = @"ं";
            CFStringRef v34 = v25;
            v35 = a4;
            CFDictionaryRef v36 = CFDictionaryCreate(0, (const void **)&result, (const void **)values, 3, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
            CFRelease(v32);
            CFRelease(v33);
            CFArrayAppendValue(theArray, v36);
            CFDictionaryRef v37 = v36;
            a4 = v35;
            CFStringRef v25 = v34;
            CFArrayRef Mutable = theArray;
            CFRelease(v37);
          }
          goto LABEL_89;
        }
        goto LABEL_79;
      }
      if (v30) {
        goto LABEL_89;
      }
      CFCharacterSetRef v31 = (const __CFCharacterSet *)*((void *)this + 13);
LABEL_85:
      if (((CFCharacterSetIsCharacterMember(v31, v29) != 0) & v27) == 0) {
        goto LABEL_89;
      }
LABEL_86:
      char v27 = 1;
      goto LABEL_93;
    }
    if (CharacterAtIndex == 2329)
    {
      if (v30) {
        goto LABEL_89;
      }
      CFCharacterSetRef v31 = (const __CFCharacterSet *)*((void *)this + 10);
      goto LABEL_85;
    }
    if (CharacterAtIndex != 2334)
    {
LABEL_79:
      if ((v27 & 1) == 0) {
        goto LABEL_89;
      }
      goto LABEL_86;
    }
    if (!v30)
    {
      CFCharacterSetRef v31 = (const __CFCharacterSet *)*((void *)this + 11);
      goto LABEL_85;
    }
LABEL_89:
    if (!v25)
    {
      v89.CFIndex location = range.location;
      v89.length = 3;
      CFStringRef v38 = CFStringCreateWithSubstring(0, theString, v89);
      CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"invalid nasal combination '%@'", v38);
      CFRelease(v38);
    }
    if (!Mutable) {
      goto LABEL_130;
    }
    char v27 = 0;
LABEL_93:
    if (v26 > range.location + 1)
    {
      v90.CFIndex location = range.location + 1;
      v90.length = v26 - (range.location + 1);
      if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 9), v90, 0, &range)) {
        continue;
      }
    }
    break;
  }
  if (Mutable) {
    goto LABEL_100;
  }
  if ((v27 & 1) == 0) {
    goto LABEL_130;
  }
LABEL_110:
  CFCharacterSetRef Copy = CFCharacterSetCreateCopy(0, *((CFCharacterSetRef *)this + 15));
  CFCharacterSetRef v47 = CFCharacterSetCreateCopy(0, *((CFCharacterSetRef *)this + 7));
  CFCharacterSetRef v48 = CFCharacterSetCreateWithCharactersInString(0, @"ँं");
  CFIndex v49 = CFStringGetLength(theString);
  v91.CFIndex location = 0;
  v91.length = v49;
  if (CFStringFindCharacterFromSet(theString, Copy, v91, 0, &result))
  {
    CFStringRef v50 = v25;
    v51 = a4;
    while (1)
    {
      if (result.location + 1 < v49)
      {
        UniChar v52 = CFStringGetCharacterAtIndex(theString, result.location + 1);
        if (CFCharacterSetIsCharacterMember(v47, v52))
        {
          IsCharacterMember = (TLDevanagariOrthographyChecker *)CFCharacterSetIsCharacterMember(v48, v52);
          if (!IsCharacterMember) {
            break;
          }
        }
      }
      v92.CFIndex location = result.length + result.location;
      v92.length = v49 - (result.length + result.location);
      if (!CFStringFindCharacterFromSet(theString, Copy, v92, 0, &result))
      {
        int v54 = 1;
        a4 = v51;
        CFStringRef v25 = v50;
        goto LABEL_121;
      }
    }
    int v54 = 0;
    if (v72) {
      *v72 = TLDevanagariOrthographyChecker::stringByCorrectingIllegalVowelLetters(IsCharacterMember, theString);
    }
    a4 = v51;
    CFStringRef v25 = @"illegal diacritic after vowel letter";
  }
  else
  {
    int v54 = 1;
  }
LABEL_121:
  CFRelease(Copy);
  CFRelease(v47);
  CFRelease(v48);
  if (!v54) {
    goto LABEL_130;
  }
  v55 = (__CFString *)v25;
  CFIndex v56 = CFStringGetLength(theString);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, v56, theString);
  CFRange v58 = CFStringFind(MutableCopy, @"‌", 0);
  if (v58.length >= 1) {
    CFStringReplace(MutableCopy, v58, &stru_270C36558);
  }
  CFComparisonResult v59 = CFStringCompare(MutableCopy, theString, 0);
  CFComparisonResult v60 = v59;
  if (v72 && v59) {
    *v72 = MutableCopy;
  }
  if (!MutableCopy)
  {
    if (v59 == kCFCompareEqualTo) {
      goto LABEL_139;
    }
LABEL_129:
    BOOL v24 = 0;
    CFStringRef v25 = @"invalid: ZWNJ present";
    goto LABEL_131;
  }
  CFRelease(MutableCopy);
  if (v60) {
    goto LABEL_129;
  }
LABEL_139:
  CFStringRef v62 = (const __CFString *)*((void *)this + 1);
  v93.length = CFStringGetLength(theString);
  v93.CFIndex location = 0;
  if (!CFStringFindWithOptions(theString, v62, v93, 0, &result))
  {
LABEL_146:
    CFStringRef v25 = v55;
    v95.length = CFStringGetLength(theString);
    v95.CFIndex location = 0;
    int CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 16), v95, 0, &result);
    BOOL v24 = CharacterFromSet == 0;
    if (CharacterFromSet)
    {
      CFStringRef v66 = CFStringCreateWithSubstring(0, theString, result);
      CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"invalid letter '%@'", v66);
      CFRelease(v66);
    }
    goto LABEL_131;
  }
  if (!result.location)
  {
    if (!v72)
    {
      BOOL v24 = 0;
      CFStringRef v25 = @"invalid sequence with ZWJ";
      goto LABEL_131;
    }
    v55 = @"invalid sequence with ZWJ";
LABEL_150:
    CFIndex v67 = CFStringGetLength(theString);
    CFMutableStringRef v68 = CFStringCreateMutableCopy(0, v67, theString);
    CFRange v69 = CFStringFind(v68, (CFStringRef)*((void *)this + 1), 0);
    if (v69.length >= 1) {
      CFStringReplace(v68, v69, &stru_270C36558);
    }
    BOOL v24 = 0;
    *v72 = v68;
    goto LABEL_153;
  }
  v94.length = result.location - 1;
  v94.CFIndex location = 0;
  CFStringRef v63 = CFStringCreateWithSubstring(0, theString, v94);
  int HasSuffix = CFStringHasSuffix(v63, @"र्");
  if (!HasSuffix) {
    v55 = @"invalid sequence with ZWJ";
  }
  CFRelease(v63);
  if (v72 && !HasSuffix) {
    goto LABEL_150;
  }
  if (HasSuffix) {
    goto LABEL_146;
  }
  BOOL v24 = 0;
LABEL_153:
  CFStringRef v25 = v55;
LABEL_131:
  if (!a4 || v24)
  {
    if (!a4 && v25) {
      CFRelease(v25);
    }
  }
  else
  {
    *a4 = v25;
  }
  return v24;
}

void std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t *std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__emplace_unique_key_args<__CFString const*,std::piecewise_construct_t const&,std::tuple<__CFString const*&&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  CFRange v7 = a1 + 1;
  CFStringRef v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        CFIndex v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        CFStringRef v6 = *v9;
        CFRange v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      CFStringRef v6 = v9[1];
      if (!v6)
      {
        CFRange v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    CFIndex v9 = a1 + 1;
LABEL_10:
    CFStringRef v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  BOOL v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  CFRange result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      CFCharacterSetRef v3 = (uint64_t *)v2[2];
      CFCharacterSetRef v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            CFIndex v9 = (uint64_t **)a2[2];
          }
          else
          {
            CFIndex v9 = (uint64_t **)v2[1];
            unint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              CFCharacterSetRef v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            uint64_t *v9 = v2;
            v2[2] = (uint64_t)v9;
            CFCharacterSetRef v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          uint64_t *v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), BOOL v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            CFCharacterSetRef v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          CFCharacterSetRef v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      unsigned char *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void TLLanguageModelStr::TLLanguageModelStr(TLLanguageModelStr *this)
{
  *(void *)this = &unk_270C36158;
  operator new();
}

BOOL TLLanguageModelStr::load(TLLanguageModelStr *this, std::string *a2)
{
  std::string::operator=((std::string *)this + 1, a2);
  v22[0] = 0;
  v22[1] = 0;
  CFStringRef v21 = (uint64_t *)v22;
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x263F51170]);
  v18[0] = __p;
  CFCharacterSetRef v4 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>((uint64_t)v4 + 56, (std::string *)((char *)v4 + 56), a2);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  std::string::size_type size = HIBYTE(a2[1].__r_.__value_.__r.__words[2]);
  if ((size & 0x80u) != 0) {
    std::string::size_type size = a2[1].__r_.__value_.__l.__size_;
  }
  if (size)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x263F51188]);
    v18[0] = __p;
    int v6 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>((uint64_t)v6 + 56, (std::string *)((char *)v6 + 56), a2 + 1);
  }
  else
  {
    char v20 = 1;
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x263F51178]);
    v18[0] = __p;
    uint64_t v7 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
    std::variant<BOOL,std::string>::operator=[abi:ne180100]<BOOL,0,BOOL,0ul,0>((uint64_t)v7 + 56, &v20);
  }
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x263F51198]);
  v18[0] = __p;
  int v8 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v8 + 56, (std::string *)((char *)v8 + 56), MEMORY[0x263F51160]);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)*MEMORY[0x263F51190]);
  v18[0] = __p;
  CFIndex v9 = std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v21, __p, (uint64_t)&std::piecewise_construct, v18);
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>((uint64_t)v9 + 56, (std::string *)((char *)v9 + 56), MEMORY[0x263F51160]);
  if (v16 < 0) {
    operator delete(__p[0]);
  }
  LOBYTE(__p[0]) = 0;
  char v17 = 0;
  language_modeling::v1::LanguageModel::init();
  std::__optional_destruct_base<LM::TrialParameters,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)__p);
  int v10 = (int)v18[0];
  if (!LODWORD(v18[0]))
  {
    language_modeling::v1::LanguageModel::makeDefaultSession((uint64_t *)__p, *((language_modeling::v1::LanguageModel **)this + 1));
    uint64_t v11 = (language_modeling::v1::LanguageModelSession *)__p[0];
    __p[0] = 0;
    std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100]((language_modeling::v1::LanguageModelSession **)this + 2, v11);
    uint64_t v12 = (language_modeling::v1::LanguageModelSession *)__p[0];
    __p[0] = 0;
    if (v12)
    {
      language_modeling::v1::LanguageModelSession::~LanguageModelSession(v12);
      MEMORY[0x26120D630](v13);
    }
    language_modeling::v1::LanguageModel::wireMemory(*((language_modeling::v1::LanguageModel **)this + 1));
  }
  if (v19 < 0) {
    operator delete(v18[1]);
  }
  std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy((uint64_t)&v21, v22[0]);
  return v10 == 0;
}

void sub_26031F228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(v14 - 64, *(void **)(v14 - 56));
  _Unwind_Resume(a1);
}

uint64_t std::variant<BOOL,std::string>::operator=[abi:ne180100]<BOOL,0,BOOL,0ul,0>(uint64_t a1, unsigned char *a2)
{
  if (*(_DWORD *)(a1 + 24)) {
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<0ul,BOOL>(a1, a2);
  }
  else {
    *(unsigned char *)a1 = *a2;
  }
  return a1;
}

void TLLanguageModelStr::~TLLanguageModelStr(TLLanguageModelStr *this)
{
  *(void *)this = &unk_270C36158;
  uint64_t v2 = (language_modeling::v1::LanguageModelSession **)((char *)this + 16);
  if (*((void *)this + 2)) {
    language_modeling::v1::LanguageModel::unwireMemory(*((language_modeling::v1::LanguageModel **)this + 1));
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
  std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100](v2, 0);
  std::unique_ptr<language_modeling::v1::LanguageModel>::reset[abi:ne180100]((language_modeling::v1::LanguageModel **)this + 1, 0);
}

{
  uint64_t vars8;

  TLLanguageModelStr::~TLLanguageModelStr(this);
  JUMPOUT(0x26120D630);
}

double TLLanguageModelStr::logProbability(uint64_t a1, uint64_t a2, long long **a3)
{
  uint64_t v5 = *(unsigned __int8 *)(a1 + 47);
  int v6 = (char)v5;
  if ((v5 & 0x80u) != 0) {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  if (v5 != 2 || (v6 >= 0 ? (uint64_t v7 = (_WORD *)(a1 + 24)) : (uint64_t v7 = *(_WORD **)(a1 + 24)), *v7 != 29301))
  {
    if (!language_modeling::v1::LanguageModelSession::supportsFragmentsBasedConditionalProbability(*(language_modeling::v1::LanguageModelSession **)(a1 + 16))) {
      return -15.6535598;
    }
  }
  if (!language_modeling::v1::LanguageModelSession::canReasonAbout()) {
    return -15.6535598;
  }
  language_modeling::v1::LinguisticContext::LinguisticContext((language_modeling::v1::LinguisticContext *)v15);
  CFIndex v9 = *a3;
  int v8 = a3[1];
  while (v9 != v8)
  {
    if (*((char *)v9 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v16, *(const std::string::value_type **)v9, *((void *)v9 + 1));
    }
    else
    {
      long long v10 = *v9;
      v16.__r_.__value_.__r.__words[2] = *((void *)v9 + 2);
      *(_OWORD *)&v16.__r_.__value_.__l.__data_ = v10;
    }
    int v17 = 0;
    MEMORY[0x26120D3C0](v15, &v16);
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
    CFIndex v9 = (long long *)((char *)v9 + 24);
  }
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v16, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string v16 = *(std::string *)a2;
  }
  int v17 = 0;
  language_modeling::v1::LanguageModelSession::detailedConditionalProbability();
  language_modeling::v1::Probability::probability();
  double v11 = v12;
  language_modeling::v1::Probability::~Probability((language_modeling::v1::Probability *)&v14);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)v15);
  return v11;
}

void sub_26031F4F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__optional_destruct_base<LM::TrialParameters,false>::~__optional_destruct_base[abi:ne180100](uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1 + 24, *(void **)(a1 + 32));
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
  }
  return a1;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

language_modeling::v1::LanguageModel *std::unique_ptr<language_modeling::v1::LanguageModel>::reset[abi:ne180100](language_modeling::v1::LanguageModel **a1, language_modeling::v1::LanguageModel *a2)
{
  CFRange result = *a1;
  *a1 = a2;
  if (result)
  {
    language_modeling::v1::LanguageModel::~LanguageModel(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

language_modeling::v1::LanguageModelSession *std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100](language_modeling::v1::LanguageModelSession **a1, language_modeling::v1::LanguageModelSession *a2)
{
  CFRange result = *a1;
  *a1 = a2;
  if (result)
  {
    language_modeling::v1::LanguageModelSession::~LanguageModelSession(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

void std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v2 = *(void **)a1;
    operator delete(v2);
  }
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 24);
  if (v2 != -1) {
    ((void (*)(char *, uint64_t))off_270C36198[v2])(&v4, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSF_1EJbSD_EEEEEEDcSH_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0) {
    operator delete(*(void **)a2);
  }
}

_OWORD *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void **a2, uint64_t a3, _OWORD **a4)
{
  int v6 = (void **)std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    int v8 = (uint64_t **)v6;
    uint64_t v7 = operator new(0x58uLL);
    v12[1] = a1 + 1;
    CFIndex v9 = *a4;
    uint64_t v10 = *((void *)*a4 + 2);
    v7[2] = **a4;
    *((void *)v7 + 6) = v10;
    void *v9 = 0;
    v9[1] = 0;
    v9[2] = 0;
    *((unsigned char *)v7 + 56) = 0;
    *((_DWORD *)v7 + 20) = 0;
    char v13 = 1;
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

void *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>(uint64_t a1, void *a2, void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  char v4 = *(void **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        uint64_t v7 = v4;
        int v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)v4 + 4) & 0x80) == 0) {
          break;
        }
        char v4 = (void *)*v7;
        uint64_t v5 = v7;
        if (!*v7) {
          goto LABEL_9;
        }
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0) {
        break;
      }
      uint64_t v5 = v7 + 1;
      char v4 = (void *)v7[1];
    }
    while (v4);
  }
  else
  {
    uint64_t v7 = (void *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void **a2)
{
  size_t v2 = *((unsigned __int8 *)a1 + 23);
  size_t v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (void *)*a1;
    size_t v2 = v3;
  }
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    uint64_t v5 = a2;
  }
  else {
    uint64_t v5 = *a2;
  }
  if (v4 >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  if (a4 >= a2) {
    size_t v7 = a2;
  }
  else {
    size_t v7 = a4;
  }
  int v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0) {
      return 1;
    }
  }
  else
  {
    if (a2 == a4) {
      return 0;
    }
    if (a2 >= a4) {
      return 1;
    }
  }
  return 255;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>(uint64_t a1, std::string *this, std::string *__str)
{
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    std::string::operator=(this, __str);
  }
  else
  {
    v3[0] = a1;
    v3[1] = (uint64_t)__str;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>(std::__variant_detail::__alt<1ul,std::string> &,std::string const&)::{unnamed type#1}::operator()[abi:ne180100](v3);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string const&>(std::__variant_detail::__alt<1ul,std::string> &,std::string const&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v1 = a1[1];
  if (*(char *)(v1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v1, *(void *)(v1 + 8));
  }
  else
  {
    long long v3 = *(_OWORD *)v1;
    __p.__r_.__value_.__r.__words[2] = *(void *)(v1 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v3;
  }
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v2, (long long *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_26031FA7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))off_270C36198[v4])(&v7, a1);
  }
  *(_DWORD *)(a1 + 24) = -1;
  long long v5 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v5;
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  *(void *)a2 = 0;
  *(_DWORD *)(a1 + 24) = 1;
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<0ul,BOOL>(uint64_t a1, unsigned char *a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 24);
  if (v4 != -1) {
    ((void (*)(char *, uint64_t))off_270C36198[v4])(&v6, a1);
  }
  *(unsigned char *)a1 = *a2;
  *(_DWORD *)(a1 + 24) = 0;
  return a1;
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(uint64_t a1, std::string *this, const std::string::value_type **a3)
{
  if (*(_DWORD *)(a1 + 24) == 1)
  {
    uint64_t v4 = *a3;
    std::string::__assign_external(this, v4);
  }
  else
  {
    v5[0] = a1;
    v5[1] = a3;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100]((uint64_t)v5);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)a1;
  std::string::basic_string[abi:ne180100]<0>(__p, **(char ***)(a1 + 8));
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v1, (long long *)__p);
  if (v3 < 0) {
    operator delete(__p[0]);
  }
}

void sub_26031FC28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
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
    char v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    char v7 = this;
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

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

void *TL::SharedCFType::Wrapper::Wrapper(void *this, const void *a2)
{
  *this = a2;
  return this;
}

void TL::SharedCFType::Wrapper::~Wrapper(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

uint64_t TL::SharedCFType::Wrapper::get(TL::SharedCFType::Wrapper *this)
{
  return *(void *)this;
}

void TL::SharedCFType::SharedCFType(TL::SharedCFType *this, const void *a2)
{
}

void *TL::SharedCFType::SharedCFType(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  language_modeling::v1::LanguageModelSession *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t TL::SharedCFType::get(TL::SharedCFType *this)
{
  return **(void **)this;
}

void std::shared_ptr<TL::SharedCFType::Wrapper>::shared_ptr[abi:ne180100]<TL::SharedCFType::Wrapper,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_26031FF5C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<TL::SharedCFType::Wrapper>::reset[abi:ne180100]((const void ***)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<TL::SharedCFType::Wrapper *,std::shared_ptr<TL::SharedCFType::Wrapper>::__shared_ptr_default_delete<TL::SharedCFType::Wrapper,TL::SharedCFType::Wrapper>,std::allocator<TL::SharedCFType::Wrapper>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x26120D630);
}

const void **std::__shared_ptr_pointer<TL::SharedCFType::Wrapper *,std::shared_ptr<TL::SharedCFType::Wrapper>::__shared_ptr_default_delete<TL::SharedCFType::Wrapper,TL::SharedCFType::Wrapper>,std::allocator<TL::SharedCFType::Wrapper>>::__on_zero_shared(uint64_t a1)
{
  CFRange result = *(const void ***)(a1 + 24);
  if (result)
  {
    TL::SharedCFType::Wrapper::~Wrapper(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<TL::SharedCFType::Wrapper *,std::shared_ptr<TL::SharedCFType::Wrapper>::__shared_ptr_default_delete<TL::SharedCFType::Wrapper,TL::SharedCFType::Wrapper>,std::allocator<TL::SharedCFType::Wrapper>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
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

const void **std::unique_ptr<TL::SharedCFType::Wrapper>::reset[abi:ne180100](const void ***a1, const void **a2)
{
  CFRange result = *a1;
  *a1 = a2;
  if (result)
  {
    TL::SharedCFType::Wrapper::~Wrapper(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

void TLCompositeTransliteratorException::TLCompositeTransliteratorException(TLCompositeTransliteratorException *this, const __CFLocale *a2, const __CFURL *a3)
{
  *(void *)this = 0;
  ExceptionList = (TL::StringMap *)TLCompositeTransliteratorException::loadExceptionList(this, a2, a3);
  std::unique_ptr<TL::StringMap>::reset[abi:ne180100]((TL::StringMap **)this, ExceptionList);
}

void sub_260320114(_Unwind_Exception *a1)
{
  std::unique_ptr<TL::StringMap>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

TL::StringMap *std::unique_ptr<TL::StringMap>::reset[abi:ne180100](TL::StringMap **a1, TL::StringMap *a2)
{
  CFRange result = *a1;
  *a1 = a2;
  if (result)
  {
    TL::StringMap::~StringMap(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

uint64_t TLCompositeTransliteratorException::loadExceptionList(TLCompositeTransliteratorException *this, CFLocaleRef locale, const __CFURL *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3812000000;
  CFStringRef v25 = __Block_byref_object_copy_;
  CFIndex v26 = __Block_byref_object_dispose_;
  char v27 = &unk_260336F5D;
  CFTypeRef cf = 0;
  if (a3)
  {
    CFStringRef Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
    int v8 = Mutable;
    v14[0] = Mutable;
    if (Mutable)
    {
      CFStringAppend(Mutable, Value);
      CFStringAppend(v8, @"_exceptions.dat");
      buf[0] = CFURLCreateCopyAppendingPathComponent(v6, a3, v8, 0);
      getFileSystemRepresentationFromCFURL(buf[0]);
    }
  }
  else
  {
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    CFStringRef v18 = ___ZN34TLCompositeTransliteratorException17loadExceptionListEPK10__CFLocalePK7__CFURL_block_invoke;
    char v19 = &unk_265552420;
    char v20 = &v22;
    LDEnumerateAssetDataItems();
  }
  CFStringRef v9 = (const __CFString *)v23[6];
  if (v9)
  {
    getUTF8StringFromCFString(v9, &__p);
    TL::StringMap::createWithFile();
  }
  CFTypeRef v10 = CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  double v11 = _nlpDefaultLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    std::string::basic_string[abi:ne180100]<0>(v14, "");
    applesauce::CF::convert_or<std::string>((CFTypeID)v10, (uint64_t)v14, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      CFURLRef p_p = (const __CFURL *)&__p;
    }
    else {
      CFURLRef p_p = (const __CFURL *)__p.__r_.__value_.__r.__words[0];
    }
    LODWORD(buf[0]) = 136315138;
    *(const __CFURL **)((char *)buf + 4) = p_p;
    _os_log_error_impl(&dword_26031A000, v11, OS_LOG_TYPE_ERROR, "Failed to locate exception list for: %s", (uint8_t *)buf, 0xCu);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v15 < 0) {
      operator delete(v14[0]);
    }
  }

  _Block_object_dispose(&v22, 8);
  if (cf) {
    CFRelease(cf);
  }
  return 0;
}

void sub_26032054C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,char a23)
{
  CFStringRef v25 = v23;

  if (a22 < 0) {
    operator delete(__p);
  }
  _Block_object_dispose(&a23, 8);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v24 + 48), 0);
  _Unwind_Resume(a1);
}

void sub_260320620()
{
}

void TLCompositeTransliteratorException::~TLCompositeTransliteratorException(TL::StringMap **this)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void ___ZN34TLCompositeTransliteratorException17loadExceptionListEPK10__CFLocalePK7__CFURL_block_invoke(uint64_t a1, CFURLRef url, uint64_t a3, uint64_t a4, uint64_t a5, unsigned char *a6)
{
  CFStringRef PathComponent = CFURLCopyLastPathComponent(url);
  if (PathComponent)
  {
    CFStringRef v10 = PathComponent;
    if (CFStringsAreEqual(PathComponent, @"exceptions.dat"))
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      CFStringRef v12 = CFURLCopyPath(url);
      nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v11 + 48), v12);
      *a6 = 1;
    }
    CFRelease(v10);
  }
}

void sub_260320700(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_or<std::string>(CFTypeID a1@<X0>, uint64_t a2@<X1>, std::string *a3@<X8>)
{
  applesauce::CF::convert_as<std::string,0>(a1, (uint64_t)__p);
  if (v7)
  {
    if (SHIBYTE(v6) < 0)
    {
      std::string::__init_copy_ctor_external(a3, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
      if (v7)
      {
        if (SHIBYTE(v6) < 0) {
          operator delete(__p[0]);
        }
      }
    }
    else
    {
      *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
      a3->__r_.__value_.__r.__words[2] = v6;
    }
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    a3->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(void *)a2 = 0;
  }
}

void TLCompositeTransliteratorException::exceptionCandidatesForInput(uint64_t **a1@<X0>, uint64_t a2@<X1>, int64x2_t *a3@<X8>)
{
  TLOSSignPostexceptionCandidatesForInput::TLOSSignPostexceptionCandidatesForInput((TLOSSignPostexceptionCandidatesForInput *)&v18);
  a3->i64[0] = 0;
  a3->i64[1] = 0;
  a3[1].i64[0] = 0;
  if (*a1)
  {
    uint64_t v6 = *(unsigned __int8 *)(a2 + 23);
    if ((v6 & 0x80u) != 0) {
      uint64_t v6 = *(void *)(a2 + 8);
    }
    if (v6)
    {
      TL::StringMap::get(*a1, (void **)a2, &__p);
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      char v8 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      if (size)
      {
        uint64_t v14 = 0;
        uint64_t v15 = 0;
        uint64_t v16 = 0;
        splitWithChar((uint64_t *)&__p, 0x2Cu, (uint64_t)&v14);
        uint64_t v9 = v14;
        uint64_t v10 = v15;
        if (v14 != v15)
        {
          unint64_t v11 = a3->u64[1];
          do
          {
            uint64_t v13 = 0;
            uint64_t v19 = 1;
            unsigned __int8 v12 = 0;
            if (v11 >= a3[1].i64[0])
            {
              unint64_t v11 = std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,std::string const&,float,float,TLTransliteratorCandidateType,BOOL>(a3, a2, v9, (float *)&v13 + 1, (float *)&v13, &v19, &v12);
            }
            else
            {
              TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v11, a2, v9, 1, 0, 0.0, 0.0);
              v11 += 80;
              a3->i64[1] = v11;
            }
            a3->i64[1] = v11;
            v9 += 24;
          }
          while (v9 != v10);
        }
        uint64_t v19 = (uint64_t)&v14;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v19);
        char v8 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      if (v8 < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
  }
  TLOSSignPostexceptionCandidatesForInput::~TLOSSignPostexceptionCandidatesForInput(&v18);
}

void sub_260320914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, os_signpost_id_t a20)
{
  *(void *)(v20 - 56) = &a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v20 - 56));
  if (a19 < 0) {
    operator delete(__p);
  }
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  TLOSSignPostexceptionCandidatesForInput::~TLOSSignPostexceptionCandidatesForInput(&a20);
  _Unwind_Resume(a1);
}

void TLOSSignPostexceptionCandidatesForInput::TLOSSignPostexceptionCandidatesForInput(TLOSSignPostexceptionCandidatesForInput *this)
{
  uint64_t v2 = _nlpSignpostLog();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, this);

  *(void *)this = v3;
  size_t v4 = _nlpSignpostLog();
  long long v5 = v4;
  os_signpost_id_t v6 = *(void *)this;
  if ((unint64_t)(*(void *)this - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)char v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_26031A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "exceptionCandidatesForInput", (const char *)&unk_2603359EA, v7, 2u);
  }
}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,std::string const&,float,float,TLTransliteratorCandidateType,BOOL>(int64x2_t *a1, uint64_t a2, uint64_t a3, float *a4, float *a5, void *a6, unsigned __int8 *a7)
{
  uint64_t v8 = a1->i64[0];
  unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  unint64_t v10 = v9 + 1;
  if (v9 + 1 > 0x333333333333333) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t i64 = (uint64_t)a1[1].i64;
  unint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v8) >> 4);
  if (2 * v18 > v10) {
    unint64_t v10 = 2 * v18;
  }
  if (v18 >= 0x199999999999999) {
    unint64_t v19 = 0x333333333333333;
  }
  else {
    unint64_t v19 = v10;
  }
  v35 = a1 + 1;
  if (v19) {
    uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v19);
  }
  else {
    uint64_t v20 = 0;
  }
  CFNumberRef v32 = v20;
  v33.i64[0] = (uint64_t)&v20[80 * v9];
  v33.i64[1] = v33.i64[0];
  CFStringRef v34 = &v20[80 * v19];
  TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v33.i64[0], a2, a3, *a6, *a7, *a4, *a5);
  uint64_t v22 = a1->i64[0];
  unint64_t v21 = a1->u64[1];
  uint64_t v23 = v33.i64[0];
  uint64_t v24 = v33.i64[0];
  if (v21 == a1->i64[0])
  {
    int64x2_t v28 = vdupq_n_s64(v21);
  }
  else
  {
    do
    {
      long long v25 = *(_OWORD *)(v21 - 80);
      *(void *)(v24 - 64) = *(void *)(v21 - 64);
      *(_OWORD *)(v24 - 8std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = v25;
      *(void *)(v21 - 72) = 0;
      *(void *)(v21 - 64) = 0;
      *(void *)(v21 - 8std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = 0;
      long long v26 = *(_OWORD *)(v21 - 56);
      *(void *)(v24 - 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = *(void *)(v21 - 40);
      *(_OWORD *)(v24 - 56) = v26;
      *(void *)(v21 - 48) = 0;
      *(void *)(v21 - 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = 0;
      *(void *)(v21 - 56) = 0;
      long long v27 = *(_OWORD *)(v21 - 32);
      *(_OWORD *)(v24 - 23) = *(_OWORD *)(v21 - 23);
      *(_OWORD *)(v24 - 32) = v27;
      v24 -= 80;
      v21 -= 80;
    }
    while (v21 != v22);
    int64x2_t v28 = *a1;
  }
  uint64_t v29 = v23 + 80;
  a1->i64[0] = v24;
  a1->i64[1] = v23 + 80;
  int64x2_t v33 = v28;
  uint64_t v30 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v34;
  CFStringRef v34 = v30;
  CFNumberRef v32 = (char *)v28.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v32);
  return v29;
}

void sub_260320BC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(80 * a2);
}

uint64_t std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 80;
    std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(i - 80);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void TLOSSignPostexceptionCandidatesForInput::~TLOSSignPostexceptionCandidatesForInput(os_signpost_id_t *this)
{
  uint64_t v2 = _nlpSignpostLog();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *this;
  if (*this - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)long long v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_26031A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "exceptionCandidatesForInput", (const char *)&unk_2603359EA, v5, 2u);
  }
}

void nlp::CFScopedPtr<__CFString *>::reset(const void **a1, const void *a2)
{
  os_signpost_id_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void nlp::CFScopedPtr<__CFURL const*>::reset(const void **a1, const void *a2)
{
  os_signpost_id_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

CFTypeID applesauce::CF::convert_as<std::string,0>@<X0>(CFTypeID result@<X0>, uint64_t a2@<X8>)
{
  if (result
    && (CFStringRef v3 = (const __CFString *)result, TypeID = CFStringGetTypeID(), result = CFGetTypeID(v3), TypeID == result))
  {
    CFRange result = (CFTypeID)applesauce::CF::details::CFString_get_value<false>(v3, (uint64_t)&v5);
    *(_OWORD *)a2 = v5;
    *(void *)(a2 + 16) = v6;
    *(unsigned char *)(a2 + 24) = 1;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 24) = 0;
  }
  return result;
}

void *applesauce::CF::details::CFString_get_value<false>@<X0>(const __CFString *a1@<X0>, uint64_t a2@<X8>)
{
  CStringPtr = (char *)CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr) {
    return std::string::basic_string[abi:ne180100]<0>((void *)a2, CStringPtr);
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex maxBufLen = 0;
  v9.CFIndex location = 0;
  v9.length = Length;
  CFStringGetBytes(a1, v9, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
  std::string::basic_string[abi:ne180100]((void *)a2, maxBufLen, 0);
  if (*(char *)(a2 + 23) >= 0) {
    char v7 = (UInt8 *)a2;
  }
  else {
    char v7 = *(UInt8 **)a2;
  }
  v10.CFIndex location = 0;
  v10.length = Length;
  return (void *)CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, v7, maxBufLen, &maxBufLen);
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

__CFString *TLTransliterationCandidateTypeAsString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown type: %ld", a1);
    uint64_t v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v1 = off_265552440[a1];
  }
  return v1;
}

void sub_26032118C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  applesauce::CF::StringRef::~StringRef((const void **)va);
  _Unwind_Resume(a1);
}

void applesauce::CF::StringRef::~StringRef(const void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    CFRelease(v1);
  }
}

void sub_2603212E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_2603213CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_260321560(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_26032175C(_Unwind_Exception *a1)
{
  uint64_t v2 = v1;

  _Unwind_Resume(a1);
}

void TLBengaliOrthographyChecker::TLBengaliOrthographyChecker(TLBengaliOrthographyChecker *this)
{
  *(void *)this = &unk_270C36230;
  *((void *)this + 1) = @"‍";
  *((void *)this + 2) = @"়";
  *((void *)this + 3) = @"্";
  *((void *)this + 4) = @"ঃ";
  *((void *)this + 5) = @"ং";
  *((void *)this + 6) = @"ঁ";
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, *((CFStringRef *)this + 2));
  CFStringAppend(Mutable, *((CFStringRef *)this + 3));
  CFStringAppend(Mutable, *((CFStringRef *)this + 4));
  CFStringAppend(Mutable, *((CFStringRef *)this + 5));
  CFStringAppend(Mutable, *((CFStringRef *)this + 6));
  CFStringAppend(Mutable, @"া");
  CFStringAppend(Mutable, @"ি");
  CFStringAppend(Mutable, @"ী");
  CFStringAppend(Mutable, @"ু");
  CFStringAppend(Mutable, @"ূ");
  CFStringAppend(Mutable, @"ৃ");
  CFStringAppend(Mutable, @"ে");
  CFStringAppend(Mutable, @"ৈ");
  CFStringAppend(Mutable, @"ো");
  CFStringAppend(Mutable, @"ৌ");
  *((void *)this + 7) = CFCharacterSetCreateWithCharactersInString(0, Mutable);
  CFRelease(Mutable);
  CFMutableStringRef v3 = CFStringCreateMutable(0, 0);
  CFStringAppend(v3, @"ক");
  CFStringAppend(v3, @"খ");
  CFStringAppend(v3, @"গ");
  CFStringAppend(v3, @"ঘ");
  CFStringAppend(v3, @"ঙ");
  CFStringAppend(v3, @"চ");
  CFStringAppend(v3, @"ছ");
  CFStringAppend(v3, @"জ");
  CFStringAppend(v3, @"ঝ");
  CFStringAppend(v3, @"ঞ");
  CFStringAppend(v3, @"ট");
  CFStringAppend(v3, @"ঠ");
  CFStringAppend(v3, @"ড");
  CFStringAppend(v3, @"ঢ");
  CFStringAppend(v3, @"ণ");
  CFStringAppend(v3, @"ত");
  CFStringAppend(v3, @"থ");
  CFStringAppend(v3, @"দ");
  CFStringAppend(v3, @"ধ");
  CFStringAppend(v3, @"ন");
  CFStringAppend(v3, @"প");
  CFStringAppend(v3, @"ফ");
  CFStringAppend(v3, @"ব");
  CFStringAppend(v3, @"ভ");
  CFStringAppend(v3, @"ম");
  CFStringAppend(v3, @"য");
  CFStringAppend(v3, @"র");
  CFStringAppend(v3, @"ল");
  CFStringAppend(v3, @"শ");
  CFStringAppend(v3, @"ষ");
  CFStringAppend(v3, @"স");
  CFStringAppend(v3, @"হ");
  CFStringAppend(v3, @"ৎ");
  CFStringAppend(v3, @"ড়");
  CFStringAppend(v3, @"ঢ়");
  CFStringAppend(v3, @"য়");
  *((void *)this + 8) = CFCharacterSetCreateWithCharactersInString(0, v3);
  CFRelease(v3);
  CFMutableStringRef v4 = CFStringCreateMutable(0, 0);
  CFStringAppend(v4, @"অ");
  CFStringAppend(v4, @"আ");
  CFStringAppend(v4, @"ই");
  CFStringAppend(v4, @"ঈ");
  CFStringAppend(v4, @"উ");
  CFStringAppend(v4, @"ঊ");
  CFStringAppend(v4, @"ঋ");
  CFStringAppend(v4, @"এ");
  CFStringAppend(v4, @"ঐ");
  CFStringAppend(v4, @"ও");
  CFStringAppend(v4, @"ঔ");
  *((void *)this + 9) = CFCharacterSetCreateWithCharactersInString(0, v4);
  CFRelease(v4);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], *((CFCharacterSetRef *)this + 9));
  CFCharacterSetUnion(MutableCopy, *((CFCharacterSetRef *)this + 8));
  CFCharacterSetUnion(MutableCopy, *((CFCharacterSetRef *)this + 7));
  *((void *)this + 1std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = CFCharacterSetCreateInvertedSet(0, MutableCopy);
  CFRelease(MutableCopy);
}

void TLBengaliOrthographyChecker::~TLBengaliOrthographyChecker(CFTypeRef *this)
{
  *this = &unk_270C36230;
  CFRelease(this[7]);
  CFRelease(this[8]);
  CFRelease(this[9]);
  CFRelease(this[10]);
}

{
  uint64_t vars8;

  TLBengaliOrthographyChecker::~TLBengaliOrthographyChecker(this);
  JUMPOUT(0x26120D630);
}

BOOL TLBengaliOrthographyChecker::isVowelSign(TLBengaliOrthographyChecker *this, const __CFString *a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFStringAppend(Mutable, @"া");
  CFStringAppend(Mutable, @"ি");
  CFStringAppend(Mutable, @"ী");
  CFStringAppend(Mutable, @"ু");
  CFStringAppend(Mutable, @"ূ");
  CFStringAppend(Mutable, @"ৃ");
  CFStringAppend(Mutable, @"ে");
  CFStringAppend(Mutable, @"ৈ");
  CFStringAppend(Mutable, @"ো");
  CFStringAppend(Mutable, @"ৌ");
  CFCharacterSetRef v4 = CFCharacterSetCreateWithCharactersInString(0, Mutable);
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v4);
  CFRelease(Mutable);
  CFRelease(v4);
  v8.length = CFStringGetLength(a2);
  v8.CFIndex location = 0;
  BOOL v6 = CFStringFindCharacterFromSet(a2, InvertedSet, v8, 0, 0) == 0;
  CFRelease(InvertedSet);
  return v6;
}

BOOL TLBengaliOrthographyChecker::canNuktaFollowLetter(TLBengaliOrthographyChecker *this, const __CFString *a2)
{
  CFCharacterSetRef v3 = CFCharacterSetCreateWithCharactersInString(0, @"ডঢয");
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v3);
  CFRelease(@"ডঢয");
  CFRelease(v3);
  v7.length = CFStringGetLength(a2);
  v7.CFIndex location = 0;
  BOOL v5 = CFStringFindCharacterFromSet(a2, InvertedSet, v7, 0, 0) == 0;
  CFRelease(InvertedSet);
  return v5;
}

BOOL TLBengaliOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  if (CFEqual(theString1, @"অ")
    || CFEqual(theString1, @"এ")
    || CFEqual(theString1, this[2]))
  {
    return 1;
  }
  CFCharacterSetRef v4 = (const __CFCharacterSet *)this[8];
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLBengaliOrthographyChecker::checkSpelling(TLBengaliOrthographyChecker *this, CFStringRef theString, const __CFString **a3, const __CFString **a4)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v34.CFIndex location = 0;
  v34.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v34, 0, &result))
  {
    CFIndex v8 = 0;
    CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (!result.location) {
        goto LABEL_59;
      }
      if (location != 0x7FFFFFFFFFFFFFFFLL && result.location == v8 + location)
      {
        v35.CFIndex location = location;
        v35.length = v8;
        CFStringRef v10 = CFStringCreateWithSubstring(0, theString, v35);
        CFStringRef v11 = CFStringCreateWithSubstring(0, theString, result);
        if ((CFStringCompare(v10, *((CFStringRef *)this + 2), 0)
           || CFEqual(v11, *((CFStringRef *)this + 2)))
          && (CFStringCompare(v11, *((CFStringRef *)this + 5), 0)
           || !TLBengaliOrthographyChecker::isVowelSign(0, v10))
          && (CFStringCompare(v11, *((CFStringRef *)this + 6), 0)
           || !TLBengaliOrthographyChecker::isVowelSign(0, v10))
          && (CFStringCompare(v11, *((CFStringRef *)this + 4), 0)
           || !TLBengaliOrthographyChecker::isVowelSign(0, v10)))
        {
          if (v10) {
            CFRelease(v10);
          }
          if (v11) {
            CFRelease(v11);
          }
LABEL_59:
          BOOL v29 = 0;
          CFStringRef v31 = @"illegal diacritic placement";
          if (!a4) {
            goto LABEL_72;
          }
          goto LABEL_70;
        }
        if (v10) {
          CFRelease(v10);
        }
        if (v11) {
          CFRelease(v11);
        }
      }
      CFIndex location = result.location;
      CFIndex v8 = result.length;
      v36.CFIndex location = result.length + result.location;
      v36.length = Length - (result.length + result.location);
    }
    while (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v36, 0, &result));
  }
  CFRange result = (CFRange)xmmword_260333360;
  CFStringRef v12 = (const __CFString *)*((void *)this + 2);
  CFStringRef v13 = theString;
  v14.CFIndex location = 0;
  v14.length = Length;
  while (CFStringFindWithOptions(v13, v12, v14, 0, &result))
  {
    if (!result.location) {
      goto LABEL_53;
    }
    v37.CFIndex location = result.location - 1;
    v37.length = 1;
    uint64_t v15 = (__CFString *)CFStringCreateWithSubstring(0, theString, v37);
    if (!TLBengaliOrthographyChecker::canNuktaFollowLetter((TLBengaliOrthographyChecker *)v15, v15))
    {
      if (v15) {
        CFRelease(v15);
      }
LABEL_53:
      BOOL v29 = 0;
      CFStringRef v31 = @"illegal nukta placement";
      if (!a4) {
        goto LABEL_72;
      }
LABEL_70:
      if (v29) {
        goto LABEL_72;
      }
      *a4 = v31;
      return v29;
    }
    if (v15) {
      CFRelease(v15);
    }
    v14.CFIndex location = result.length + result.location;
    v14.length = Length - (result.length + result.location);
    CFStringRef v12 = (const __CFString *)*((void *)this + 2);
    CFStringRef v13 = theString;
  }
  CFRange result = (CFRange)xmmword_260333360;
  CFStringRef v16 = (const __CFString *)*((void *)this + 3);
  CFStringRef v17 = theString;
  v18.CFIndex location = 0;
  v18.length = Length;
  while (1)
  {
    if (!CFStringFindWithOptions(v17, v16, v18, 0, &result))
    {
      CFCharacterSetRef v22 = CFCharacterSetCreateWithCharactersInString(0, @"ঁং্");
      CFIndex v23 = CFStringGetLength(theString);
      CFCharacterSetRef v24 = (const __CFCharacterSet *)*((void *)this + 9);
      CFStringRef v25 = theString;
      v26.CFIndex location = 0;
      v26.length = v23;
      while (1)
      {
        if (!CFStringFindCharacterFromSet(v25, v24, v26, 0, &result))
        {
          CFRelease(v22);
          v40.length = CFStringGetLength(theString);
          v40.CFIndex location = 0;
          int CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v40, 0, &result);
          BOOL v29 = CharacterFromSet == 0;
          if (CharacterFromSet)
          {
            CFStringRef v30 = CFStringCreateWithSubstring(0, theString, result);
            CFStringRef v31 = CFStringCreateWithFormat(0, 0, @"invalid letter '%@'", v30);
            CFRelease(v30);
            if (a4) {
              goto LABEL_70;
            }
          }
          else
          {
            CFStringRef v31 = 0;
            if (a4) {
              goto LABEL_70;
            }
          }
          goto LABEL_72;
        }
        if (result.location + 1 < v23)
        {
          UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
          if (CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 7), CharacterAtIndex))
          {
            if (!CFCharacterSetIsCharacterMember(v22, CharacterAtIndex)) {
              break;
            }
          }
        }
        v26.CFIndex location = result.length + result.location;
        CFCharacterSetRef v24 = (const __CFCharacterSet *)*((void *)this + 9);
        v26.length = v23 - (result.length + result.location);
        CFStringRef v25 = theString;
      }
      CFRelease(v22);
      BOOL v29 = 0;
      CFStringRef v31 = @"illegal diacritic after vowel letter";
      if (!a4) {
        goto LABEL_72;
      }
      goto LABEL_70;
    }
    if (!result.location) {
      break;
    }
    v38.CFIndex location = result.location - 1;
    v38.length = 1;
    CFStringRef v19 = CFStringCreateWithSubstring(0, theString, v38);
    if (result.location + 1 >= Length)
    {
      CFStringRef v20 = 0;
      if (!TLBengaliOrthographyChecker::canViramaFollowLetter((CFStringRef *)this, v19))
      {
LABEL_61:
        if (v19) {
          CFRelease(v19);
        }
        if (v20) {
          CFRelease(v20);
        }
        break;
      }
LABEL_37:
      char v21 = 1;
      if (!v19) {
        goto LABEL_39;
      }
LABEL_38:
      CFRelease(v19);
      goto LABEL_39;
    }
    v39.length = 1;
    v39.CFIndex location = result.location + 1;
    CFStringRef v20 = CFStringCreateWithSubstring(0, theString, v39);
    if (!TLBengaliOrthographyChecker::canViramaFollowLetter((CFStringRef *)this, v19)) {
      goto LABEL_61;
    }
    if (!v20) {
      goto LABEL_37;
    }
    if (!TLDevanagariOrthographyChecker::canViramaPrecedeLetter(this, v20)) {
      goto LABEL_61;
    }
    char v21 = 0;
    if (v19) {
      goto LABEL_38;
    }
LABEL_39:
    if ((v21 & 1) == 0) {
      CFRelease(v20);
    }
    v18.CFIndex location = result.length + result.location;
    v18.length = Length - (result.length + result.location);
    CFStringRef v16 = (const __CFString *)*((void *)this + 3);
    CFStringRef v17 = theString;
  }
  BOOL v29 = 0;
  CFStringRef v31 = @"illegal virama placement";
  if (a4) {
    goto LABEL_70;
  }
LABEL_72:
  if (!a4 && v31) {
    CFRelease(v31);
  }
  return v29;
}

void TL::StringMap::StringMap(TL::StringMap *this)
{
  *(void *)this = 0;
  operator new();
}

void TL::StringMap::StringMap()
{
}

void sub_260322A30(_Unwind_Exception *a1)
{
  MEMORY[0x26120D630](v1, 0x70C40A8FA3B04);
  _Unwind_Resume(a1);
}

void TL::StringMap::createWithFile()
{
}

void sub_260322AA0(_Unwind_Exception *a1, int a2)
{
  uint64_t v4 = v2;
  MEMORY[0x26120D630](v4, 0x80C40803F642BLL);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    __cxa_end_catch();
    JUMPOUT(0x260322A90);
  }
  _Unwind_Resume(a1);
}

void TL::StringMap::~StringMap(TL::StringMap *this)
{
  uint64_t v2 = *((void *)this + 1);
  if (v2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(*((void *)this + 1), *(void **)(v2 + 8));
    MEMORY[0x26120D630](v2, 0x1020C4062D53EE8);
  }
  if (*(void *)this)
  {
    StringMapFile::~StringMapFile(*(StringMapFile **)this);
    MEMORY[0x26120D630]();
  }
}

uint64_t **TL::StringMap::add(uint64_t a1, long long *a2, const std::string *a3)
{
  CFRange result = *(uint64_t ***)(a1 + 8);
  if (result)
  {
    BOOL v6 = a2;
    BOOL v5 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(result, (void **)a2, (uint64_t)&std::piecewise_construct, &v6);
    return (uint64_t **)std::string::operator=((std::string *)(v5 + 7), a3);
  }
  return result;
}

void TL::StringMap::get(uint64_t *a1@<X0>, void **a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v4 = a1[1];
  if (v4) {
    StringMapBuilder::get(v4, a2, a3);
  }
  else {
    StringMapFile::get(*a1, a3);
  }
}

void StringMapBuilder::get(uint64_t a1@<X0>, void **a2@<X1>, std::string *a3@<X8>)
{
  BOOL v5 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(a1, a2);
  if ((void **)(a1 + 8) == v5)
  {
    std::string::basic_string[abi:ne180100]<0>(a3, "");
  }
  else if (*((char *)v5 + 79) < 0)
  {
    CFRange v7 = (const std::string::value_type *)v5[7];
    std::string::size_type v8 = (std::string::size_type)v5[8];
    std::string::__init_copy_ctor_external(a3, v7, v8);
  }
  else
  {
    long long v6 = *(_OWORD *)(v5 + 7);
    a3->__r_.__value_.__r.__words[2] = (std::string::size_type)v5[9];
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v6;
  }
}

void *StringMapFile::get@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  if (CFBurstTrieFindUTF8String()) {
    uint64_t v4 = *(char **)(a1 + 8);
  }
  else {
    uint64_t v4 = "";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v4);
}

void *TL::StringMap::write(uint64_t a1, uint64_t a2)
{
  CFRange result = *(void **)(a1 + 8);
  if (result) {
    return (void *)StringMapBuilder::write(result, a2);
  }
  return result;
}

uint64_t StringMapBuilder::write(void *a1, uint64_t a2)
{
  CFBurstTrieCreate();
  v24[0] = 0;
  v24[1] = 0;
  CFIndex v23 = v24;
  uint64_t v4 = operator new(1uLL);
  *uint64_t v4 = 0;
  char v21 = v4 + 1;
  CFCharacterSetRef v22 = v4 + 1;
  std::string __p = v4;
  CFRange v7 = (void *)*a1;
  BOOL v5 = a1 + 1;
  long long v6 = v7;
  if (v7 != v5)
  {
    do
    {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>((uint64_t)&v23, (void **)v6 + 4);
      CFBurstTrieAddUTF8String();
      if (*((char *)v6 + 79) < 0)
      {
        std::string::size_type v8 = (char *)v6[7];
        uint64_t v9 = v6[8];
      }
      else
      {
        std::string::size_type v8 = (char *)(v6 + 7);
        uint64_t v9 = *((unsigned __int8 *)v6 + 79);
      }
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<char const*,char const*,std::back_insert_iterator<std::vector<unsigned char>>>((uint64_t)&__buf, v8, &v8[v9 + 1], (unint64_t *)&__p);
      CFStringRef v10 = (void *)v6[1];
      if (v10)
      {
        do
        {
          CFStringRef v11 = v10;
          CFStringRef v10 = (void *)*v10;
        }
        while (v10);
      }
      else
      {
        do
        {
          CFStringRef v11 = (void *)v6[2];
          BOOL v12 = *v11 == (void)v6;
          long long v6 = v11;
        }
        while (!v12);
      }
      long long v6 = v11;
    }
    while (v11 != v5);
  }
  uint64_t __buf = 0x1F710C3D2;
  if (*(char *)(a2 + 23) >= 0) {
    CFStringRef v13 = (const char *)a2;
  }
  else {
    CFStringRef v13 = *(const char **)a2;
  }
  CFRange v14 = fopen(v13, "wb");
  int v15 = fileno(v14);
  write(v15, &__buf, 0x18uLL);
  int v16 = lseek(v15, 0, 1);
  CFBurstTrieSerializeWithFileDescriptor();
  int v19 = lseek(v15, 0, 1) - v16;
  write(v15, __p, v21 - (unsigned char *)__p);
  pwrite(v15, &__buf, 0x18uLL, 0);
  CFBurstTrieRelease();
  fclose(v14);
  if (__p)
  {
    char v21 = __p;
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy((uint64_t)&v23, v24[0]);
  return 1;
}

void sub_260322EF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, char a16, char *a17)
{
  if (__p) {
    operator delete(__p);
  }
  std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy((uint64_t)&a16, a17);
  _Unwind_Resume(a1);
}

uint64_t *StringMapFile::StringMapFile(uint64_t *a1, char *a2)
{
  *a1 = 0;
  CFCharacterSetRef v3 = a1 + 2;
  if (a2[23] >= 0) {
    uint64_t v4 = a2;
  }
  else {
    uint64_t v4 = *(char **)a2;
  }
  TL::ReadOnlyFile<char>::open(v4, (uint64_t)"r", 1, v3);
  BOOL v5 = *(_DWORD **)a1[2];
  if (*v5 != -149896238)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v9, "string map file is invalid");
    TL::ResourceCreationException::ResourceCreationException(exception, &v9);
  }
  if (v5[1] != 1)
  {
    std::string::size_type v8 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v9, "string map file version is not supported");
    TL::ResourceCreationException::ResourceCreationException(v8, &v9);
  }
  a1[1] = (uint64_t)v5 + v5[2] + 24;
  *a1 = CFBurstTrieCreateFromMapBytes();
  return a1;
}

void sub_26032307C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0)
    {
LABEL_6:
      int v19 = *(std::__shared_weak_count **)(v15 + 24);
      if (v19) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v19);
      }
      _Unwind_Resume(a1);
    }
  }
  else if (!v17)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v16);
  goto LABEL_6;
}

void TL::ReadOnlyFile<char>::open(char *__s@<X0>, uint64_t a2@<X1>, char a3@<W2>, void *a4@<X8>)
{
  uint64_t v13 = 0;
  CFRange v14 = &v13;
  uint64_t v15 = 0x4002000000;
  int v16 = __Block_byref_object_copy__0;
  int v17 = __Block_byref_object_dispose__0;
  CFRange v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  std::string::basic_string[abi:ne180100]<0>(__p, __s);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 0x40000000;
  v9[2] = ___ZN2TL12ReadOnlyFileIcE4openEPKcS3_b_block_invoke;
  v9[3] = &unk_265552468;
  v9[5] = __s;
  v9[6] = a2;
  char v10 = a3;
  v9[4] = &v13;
  nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getResource((uint64_t)__p, (uint64_t)v9, a4);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  if ((*((char *)v14 + 63) & 0x80000000) == 0)
  {
    if (!*((unsigned char *)v14 + 63)) {
      goto LABEL_5;
    }
LABEL_9:
    exception = __cxa_allocate_exception(0x20uLL);
    TL::ResourceCreationException::ResourceCreationException(exception, (long long *)(v14 + 5));
  }
  if (v14[6]) {
    goto LABEL_9;
  }
LABEL_5:
  _Block_object_dispose(&v13, 8);
  if (SHIBYTE(v20) < 0) {
    operator delete(v18);
  }
}

void sub_260323244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  CFRange v36 = *(std::__shared_weak_count **)(v34 + 8);
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  _Block_object_dispose(&a24, 8);
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = result;
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
}

void nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getResource(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v9 = 0;
  char v10 = &v9;
  uint64_t v11 = 0x3802000000;
  char v12 = __Block_byref_object_copy__4;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v13 = __Block_byref_object_dispose__5;
  Queue = nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 0x40000000;
  v8[2] = ___ZN3nlp24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN2TL12ReadOnlyFileIcEEE11getResourceERKS7_U13block_pointerFPSA_vE_block_invoke;
  v8[3] = &unk_265552490;
  v8[5] = &v9;
  v8[6] = a1;
  v8[4] = a2;
  dispatch_sync(Queue, v8);
  uint64_t v7 = v10[6];
  *a3 = v10[5];
  a3[1] = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  _Block_object_dispose(&v9, 8);
  if (v15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  }
}

void ___ZN2TL12ReadOnlyFileIcE4openEPKcS3_b_block_invoke()
{
}

void sub_260323434(_Unwind_Exception *a1, int a2)
{
  uint64_t v5 = v3;
  MEMORY[0x26120D630](v5, 0x1012C403EBA5055);
  if (a2 == 1)
  {
    uint64_t v7 = __cxa_begin_catch(a1);
    std::string::size_type v8 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(void *)v7 + 16))(v7);
    std::string::__assign_external((std::string *)(*(void *)(*(void *)(v2 + 32) + 8) + 40), v8);
    __cxa_end_catch();
    JUMPOUT(0x260323420);
  }
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = result;
  *(void *)(a2 + 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

uint64_t nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue()
{
  {
    nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue(void)::attributes = (uint64_t)dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  }
  unint64_t v0 = 0x26A86B000uLL;
  {
    unint64_t v0 = 0x26A86B000;
    if (v2)
    {
      nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue(void)::queue = (uint64_t)dispatch_queue_create("com.apple.NLPUtils.SingletonResourceManager", (dispatch_queue_attr_t)nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getQueue(void)::attributes);
      unint64_t v0 = 0x26A86B000;
    }
  }
  return *(void *)(v0 + 1808);
}

void ___ZN3nlp24SingletonResourceManagerINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEEN2TL12ReadOnlyFileIcEEE11getResourceERKS7_U13block_pointerFPSA_vE_block_invoke(uint64_t a1)
{
  Cache = nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getCache();
  uint64_t v3 = std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::find<std::string>(Cache, *(unsigned __int8 **)(a1 + 48));
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = (std::__shared_weak_count *)*((void *)v3 + 6);
    if (v5 && (uint64_t v5 = std::__shared_weak_count::lock(v5)) != 0) {
      uint64_t v6 = *((void *)v4 + 5);
    }
    else {
      uint64_t v6 = 0;
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    std::string::size_type v8 = *(std::__shared_weak_count **)(v7 + 48);
    *(void *)(v7 + 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = v6;
    *(void *)(v7 + 48) = v5;
    if (v8) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
    }
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v11 = *(void *)(v9 + 40);
  uint64_t v10 = v9 + 40;
  if (!v11)
  {
    uint64_t v12 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    std::shared_ptr<TL::ReadOnlyFile<char>>::reset[abi:ne180100]<TL::ReadOnlyFile<char>,void>(v10, v12);
  }
}

void sub_2603236AC(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
  _Unwind_Resume(exception_object);
}

long long *nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getCache()
{
  {
    nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getCache(void)::cache = 0u;
    *(_OWORD *)algn_26A86B730 = 0u;
    dword_26A86B740 = 1065353216;
  }
  return &nlp::SingletonResourceManager<std::string,TL::ReadOnlyFile<char>>::getCache(void)::cache;
}

void std::shared_ptr<TL::ReadOnlyFile<char>>::reset[abi:ne180100]<TL::ReadOnlyFile<char>,void>(uint64_t a1, uint64_t a2)
{
  std::shared_ptr<TL::ReadOnlyFile<char>>::shared_ptr[abi:ne180100]<TL::ReadOnlyFile<char>,void>(&v2, a2);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::find<std::string>(void *a1, unsigned __int8 *a2)
{
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }
  else
  {
    unint64_t v9 = (*(void *)&v5 - 1) & v4;
  }
  uint64_t v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0;
  }
  uint64_t v11 = *v10;
  if (*v10)
  {
    uint64_t v12 = (uint64_t)(a1 + 4);
    do
    {
      unint64_t v13 = *((void *)v11 + 1);
      if (v13 == v6)
      {
        if (std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2)) {
          return v11;
        }
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }
        else
        {
          v13 &= *(void *)&v5 - 1;
        }
        if (v13 != v9) {
          return 0;
        }
      }
      uint64_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      CFCharacterSetRef v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = a3;
  uint64_t v4 = a2[23];
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = a2[23];
  }
  else {
    uint64_t v5 = *((void *)a2 + 1);
  }
  uint64_t v6 = a3[23];
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *((void *)a3 + 1);
  }
  if (v5 != v6) {
    return 0;
  }
  if (v7 < 0) {
    uint64_t v3 = *(unsigned __int8 **)a3;
  }
  if ((v4 & 0x80) != 0) {
    return memcmp(*(const void **)a2, v3, *((void *)a2 + 1)) == 0;
  }
  if (!a2[23]) {
    return 1;
  }
  uint64_t v8 = v4 - 1;
  do
  {
    int v10 = *a2++;
    int v9 = v10;
    int v12 = *v3++;
    int v11 = v12;
    BOOL v14 = v8-- != 0;
    uint64_t result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::shared_ptr<TL::ReadOnlyFile<char>>::shared_ptr[abi:ne180100]<TL::ReadOnlyFile<char>,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_260323E3C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<TL::ReadOnlyFile<char>>::reset[abi:ne180100]((uint64_t *)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<TL::ReadOnlyFile<char> *,std::shared_ptr<TL::ReadOnlyFile<char>>::__shared_ptr_default_delete<TL::ReadOnlyFile<char>,TL::ReadOnlyFile<char>>,std::allocator<TL::ReadOnlyFile<char>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x26120D630);
}

uint64_t std::__shared_ptr_pointer<TL::ReadOnlyFile<char> *,std::shared_ptr<TL::ReadOnlyFile<char>>::__shared_ptr_default_delete<TL::ReadOnlyFile<char>,TL::ReadOnlyFile<char>>,std::allocator<TL::ReadOnlyFile<char>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result)
  {
    TL::ReadOnlyFile<char>::~ReadOnlyFile(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<TL::ReadOnlyFile<char> *,std::shared_ptr<TL::ReadOnlyFile<char>>::__shared_ptr_default_delete<TL::ReadOnlyFile<char>,TL::ReadOnlyFile<char>>,std::allocator<TL::ReadOnlyFile<char>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

uint64_t TL::ReadOnlyFile<char>::~ReadOnlyFile(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (*(void *)a1)
  {
    if (*(unsigned char *)(a1 + 68))
    {
      munmap(*(void **)a1, *(void *)(a1 + 8));
    }
    else
    {
      if (*(_DWORD *)(a1 + 64) != 2) {
        goto LABEL_10;
      }
      uint64_t v3 = (const char *)(a1 + 16);
      if (*(char *)(a1 + 39) < 0) {
        uint64_t v3 = *(const char **)v3;
      }
      int v4 = open(v3, 2);
      int v5 = v4;
      uint64_t v2 = *(void **)a1;
      if ((v4 & 0x80000000) == 0)
      {
        write(v4, *(const void **)a1, *(void *)(a1 + 8));
        close(v5);
        uint64_t v2 = *(void **)a1;
      }
      if (v2) {
LABEL_10:
      }
        MEMORY[0x26120D610](v2, 0x1000C8077774924);
    }
  }
  if (*(char *)(a1 + 63) < 0) {
    operator delete(*(void **)(a1 + 40));
  }
  if (*(char *)(a1 + 39) < 0) {
    operator delete(*(void **)(a1 + 16));
  }
  return a1;
}

uint64_t std::unique_ptr<TL::ReadOnlyFile<char>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    TL::ReadOnlyFile<char>::~ReadOnlyFile(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  uint64_t v8 = (void *)(a1 + 24);
  unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v10 = v9;
  unint64_t v11 = *(void *)(a1 + 8);
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    unint64_t v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v4 = v9;
      if (v9 >= v11) {
        unint64_t v4 = v9 % v11;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v9;
    }
    BOOL v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v14)
    {
      for (uint64_t i = *v14; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v16 = *((void *)i + 1);
        if (v16 == v10)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11) {
              v16 %= v11;
            }
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  float v17 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    BOOL v19 = 1;
    if (v11 >= 3) {
      BOOL v19 = (v11 & (v11 - 1)) != 0;
    }
    unint64_t v20 = v19 | (2 * v11);
    unint64_t v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21) {
      size_t v22 = v21;
    }
    else {
      size_t v22 = v20;
    }
    std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__rehash<true>(a1, v22);
    unint64_t v11 = *(void *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11) {
        unint64_t v4 = v10 % v11;
      }
      else {
        unint64_t v4 = v10;
      }
    }
    else
    {
      unint64_t v4 = (v11 - 1) & v10;
    }
  }
  uint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *uint64_t v23 = v26[0];
  }
  else
  {
    *(void *)v26[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v26[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v26[0])
    {
      unint64_t v24 = *(void *)(*(void *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11) {
          v24 %= v11;
        }
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v24) = v26[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_2603242C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint64_t v8 = operator new(0x38uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *uint64_t v8 = 0;
  v8[1] = a2;
  unint64_t v9 = (std::string *)(v8 + 2);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    v8[4] = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_260324360(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:ne180100]();
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
      long long v11 = (void *)*v7;
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
            *uint64_t v7 = *v11;
            *long long v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            long long v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          long long v11 = (void *)*v11;
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

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::weak_ptr<TL::ReadOnlyFile<char>>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::weak_ptr<TL::ReadOnlyFile<char>>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::weak_ptr<TL::ReadOnlyFile<char>>>,0>(uint64_t a1)
{
  uint64_t v2 = *(std::__shared_weak_count **)(a1 + 32);
  if (v2) {
    std::__shared_weak_count::__release_weak(v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v3 = *(void **)a1;
    operator delete(v3);
  }
}

uint64_t TL::ReadOnlyFile<char>::ReadOnlyFile(uint64_t a1, char *a2, char *a3, int a4)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 16), a2);
  std::string::basic_string[abi:ne180100]<0>((void *)(a1 + 40), a3);
  *(_DWORD *)(a1 + 64) = 0;
  *(unsigned char *)(a1 + 68) = a4;
  if (!strcmp(a3, "r"))
  {
    *(_DWORD *)(a1 + 64) = 0;
    int v8 = open(a2, 0);
  }
  else
  {
    if (strcmp(a3, "r+"))
    {
LABEL_15:
      exception = __cxa_allocate_exception(0x20uLL);
      TL::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
LABEL_16:
    }
    *(_DWORD *)(a1 + 64) = 514;
    int v8 = open(a2, 514, 384);
  }
  int v9 = v8;
  if (v8 < 0) {
    goto LABEL_15;
  }
  if (fstat(v8, &v16) < 0)
  {
    close(v9);
    exception = __cxa_allocate_exception(0x20uLL);
    TL::ReadOnlyFileCreationException::ReadOnlyFileCreationException(exception);
    goto LABEL_16;
  }
  st_std::string::size_type size = v16.st_size;
  *(void *)(a1 + 8) = v16.st_size;
  uint64_t v17 = 0;
  int v18 = st_size;
  fcntl(v9, 44, &v17);
  size_t v11 = *(void *)(a1 + 8);
  if (!a4) {
    operator new[]();
  }
  if (v11)
  {
    unint64_t v12 = mmap(0, v11, *(_DWORD *)(a1 + 64) & 2 | 1u, 1, v9, 0);
    if (v12 == (void *)-1)
    {
      close(v9);
      uint64_t v15 = __cxa_allocate_exception(0x20uLL);
      TL::ReadOnlyFileCreationException::ReadOnlyFileCreationException(v15);
    }
    *(void *)a1 = v12;
  }
  close(v9);
  return a1;
}

void sub_2603248CC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v4);
  if (*(char *)(v2 + 63) < 0) {
    operator delete(*v3);
  }
  if (*(char *)(v2 + 39) < 0) {
    operator delete(*v1);
  }
  _Unwind_Resume(a1);
}

void *TL::ReadOnlyFileCreationException::ReadOnlyFileCreationException(void *a1)
{
  std::operator+<char>();
  TL::ResourceCreationException::ResourceCreationException(a1, &__p);
  if (v4 < 0) {
    operator delete((void *)__p);
  }
  *a1 = &unk_270C36318;
  return a1;
}

void sub_2603249BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *TL::ResourceCreationException::ResourceCreationException(void *a1, long long *a2)
{
  *a1 = &unk_270C36340;
  uint64_t v3 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

void sub_260324A40(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

void TL::ReadOnlyFileCreationException::~ReadOnlyFileCreationException(std::exception *this)
{
  TL::ResourceCreationException::~ResourceCreationException(this);
  JUMPOUT(0x26120D630);
}

uint64_t TL::ResourceCreationException::what(TL::ResourceCreationException *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

void TL::ResourceCreationException::~ResourceCreationException(std::exception *this)
{
  TL::ResourceCreationException::~ResourceCreationException(this);
  JUMPOUT(0x26120D630);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_270C36340;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

void StringMapFile::~StringMapFile(StringMapFile *this)
{
  if (*(void *)this) {
    CFBurstTrieRelease();
  }
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

uint64_t *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t **a1, void **a2, uint64_t a3, long long **a4)
{
  uint64_t v6 = (uint64_t **)std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v11, a2);
  uint64_t v7 = *v6;
  if (!*v6)
  {
    int v8 = v6;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<std::__value_type<__CFString const*,__CFString const*>,std::__map_value_compare<__CFString const*,std::__value_type<__CFString const*,__CFString const*>,std::less<__CFString const*>,true>,std::allocator<std::__value_type<__CFString const*,__CFString const*>>>::__insert_node_at(a1, v11, v8, v10[0]);
    uint64_t v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, long long **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = operator new(0x50uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t v7 = (std::string *)(v6 + 4);
  int v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)v8, *((void *)v8 + 1));
  }
  else
  {
    long long v9 = *v8;
    v6[6] = *((void *)v8 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v9;
  }
  v6[7] = 0;
  v6[8] = 0;
  v6[9] = 0;
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_260324D20(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void **std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(uint64_t a1, void **a2)
{
  uint64_t v2 = (void **)(a1 + 8);
  uint64_t v3 = *(void **)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = (void **)(a1 + 8);
  do
  {
    char v6 = std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v3 + 4, a2);
    if (v6 >= 0) {
      uint64_t v7 = v3;
    }
    else {
      uint64_t v7 = v3 + 1;
    }
    if (v6 >= 0) {
      uint64_t v5 = (void **)v3;
    }
    uint64_t v3 = (void *)*v7;
  }
  while (*v7);
  if (v5 == v2
    || (std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a2, v5 + 4) & 0x80) != 0)
  {
    return v2;
  }
  return v5;
}

char *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<char const*,char const*,std::back_insert_iterator<std::vector<unsigned char>>>(uint64_t a1, char *a2, char *a3, unint64_t *a4)
{
  long long v4 = a2;
  long long v9 = a4;
  if (a2 == a3) {
    return a2;
  }
  uint64_t v5 = a3;
  do
  {
    char v6 = *v4++;
    char v8 = v6;
    std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100](&v9, &v8);
  }
  while (v4 != v5);
  return v5;
}

unint64_t **std::back_insert_iterator<std::vector<unsigned char>>::operator=[abi:ne180100](unint64_t **a1, unsigned char *a2)
{
  long long v4 = *a1;
  char v6 = (unsigned char *)(*a1)[1];
  unint64_t v5 = (*a1)[2];
  if ((unint64_t)v6 >= v5)
  {
    unint64_t v8 = *v4;
    long long v9 = &v6[-*v4];
    unint64_t v10 = (unint64_t)(v9 + 1);
    if ((uint64_t)(v9 + 1) < 0) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v11 = v5 - v8;
    if (2 * v11 > v10) {
      unint64_t v10 = 2 * v11;
    }
    if (v11 >= 0x3FFFFFFFFFFFFFFFLL) {
      size_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else {
      size_t v12 = v10;
    }
    if (v12) {
      unint64_t v13 = (unint64_t)operator new(v12);
    }
    else {
      unint64_t v13 = 0;
    }
    BOOL v14 = (char *)(v13 + v12);
    v9[v13] = *a2;
    uint64_t v7 = (uint64_t)&v9[v13 + 1];
    if (v6 == (unsigned char *)v8)
    {
      v13 += (unint64_t)v9;
    }
    else
    {
      uint64_t v15 = &v6[~v8];
      do
      {
        char v16 = *--v6;
        (v15--)[v13] = v16;
      }
      while (v6 != (unsigned char *)v8);
      char v6 = (unsigned char *)*v4;
    }
    *long long v4 = v13;
    v4[1] = v7;
    v4[2] = (unint64_t)v14;
    if (v6) {
      operator delete(v6);
    }
  }
  else
  {
    unsigned char *v6 = *a2;
    uint64_t v7 = (uint64_t)(v6 + 1);
  }
  v4[1] = v7;
  return a1;
}

void std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(uint64_t a1, char *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(a1, *(void *)a2);
    std::__tree<std::__value_type<std::string,unsigned int>,std::__map_value_compare<std::string,std::__value_type<std::string,unsigned int>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,unsigned int>>>::destroy(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }
}

void TLCompositeTransliteratorSeq2Seq::TLCompositeTransliteratorSeq2Seq(TLCompositeTransliteratorSeq2Seq *this, const __CFLocale *a2, const __CFURL *a3)
{
  *((void *)this + 1) = 0;
  char v6 = (const void **)((char *)this + 8);
  *(void *)this = 0;
  *((void *)this + 2) = 0;
  CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFLocaleRef v8 = CFLocaleCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"en_US");
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)this, v8);
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(a2, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(v7, 0, Value);
  CFStringRef v11 = MutableCopy;
  if (MutableCopy)
  {
    CFStringAppend(MutableCopy, @"_IN");
    CFLocaleRef v12 = CFLocaleCreate(v7, v11);
    nlp::CFScopedPtr<__CFLocale const*>::reset(v6, v12);
  }
  uint64_t v13 = TLCompositeTransliteratorSeq2Seq::loadSeq2SeqModel((TLCompositeTransliteratorSeq2Seq *)MutableCopy, a2, a3);
  BOOL v14 = (void *)*((void *)this + 2);
  *((void *)this + 2) = v13;

  if (v11) {
    CFRelease(v11);
  }
}

void sub_2603250E4(_Unwind_Exception *a1)
{
  nlp::CFScopedPtr<__CFLocale const*>::reset(v2, 0);
  nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)v1, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFLocale const*>::reset(const void **a1, const void *a2)
{
  long long v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

id TLCompositeTransliteratorSeq2Seq::loadSeq2SeqModel(TLCompositeTransliteratorSeq2Seq *this, CFLocaleRef locale, const __CFURL *a3)
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFCF0];
  CFStringRef Value = (const __CFString *)CFLocaleGetValue(locale, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x3812000000;
  uint64_t v35 = __Block_byref_object_copy__1;
  uint64_t v36 = __Block_byref_object_dispose__1;
  uint64_t v37 = &unk_260336F5D;
  CFTypeRef cf = 0;
  if (a3)
  {
    v24.__r_.__value_.__r.__words[0] = 0;
    if (CFStringsAreEqual(Value, @"ur"))
    {
      CFURLRef v7 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], a3, @"ur_EMT_package", 1u);
      v24.__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
    }
    else
    {
      BundleWithIdentifier = CFBundleGetBundleWithIdentifier(@"com.apple.TransliterationTests");
      CFURLRef v9 = CFBundleCopyResourceURL(BundleWithIdentifier, @"mul.translit", 0, 0);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
      CFURLRef v7 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], v9, @"mul_EMT_package", 1u);
      v24.__r_.__value_.__r.__words[0] = (std::string::size_type)v7;
      if (v9) {
        CFRelease(v9);
      }
    }
    getFileSystemRepresentationFromCFURL(v7);
  }
  uint64_t v25 = MEMORY[0x263EF8330];
  uint64_t v26 = 3221225472;
  uint64_t v27 = ___ZN32TLCompositeTransliteratorSeq2Seq16loadSeq2SeqModelEPK10__CFLocalePK7__CFURL_block_invoke;
  uint64_t v28 = &unk_2655524E0;
  uint64_t v29 = &v32;
  CFStringRef v30 = Value;
  LDEnumerateAssetDataItems();
  CFStringRef v10 = (const __CFString *)v33[6];
  if (v10)
  {
    getUTF8StringFromCFString(v10, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      CFURLRef p_p = &__p;
    }
    else {
      CFURLRef p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    CFLocaleRef v12 = [NSString stringWithUTF8String:p_p];
    uint64_t v13 = (void *)[objc_alloc(NSURL) initWithString:v12];
    if (v13)
    {
      id v14 = objc_alloc(MEMORY[0x263F3B3E0]);
      unint64_t v39 = v13;
      uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
      char v16 = (void *)[v14 initWithModelURLs:v15 task:@"siri" skipNonFinalToCatchup:0];

      uint64_t v17 = dispatch_queue_create("callbackQueue", 0);
      [v16 setCallbackQueue:v17];
    }
    else
    {
      CFTypeRef v20 = CFLocaleGetValue(locale, v5);
      uint64_t v17 = _nlpDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        std::string::basic_string[abi:ne180100]<0>(buf, "");
        applesauce::CF::convert_or<std::string>((CFTypeID)v20, (uint64_t)buf, &v24);
        if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v23 = &v24;
        }
        else {
          uint64_t v23 = (std::string *)v24.__r_.__value_.__r.__words[0];
        }
        *(_DWORD *)v42 = 136315138;
        CFNumberRef v43 = v23;
        _os_log_error_impl(&dword_26031A000, v17, OS_LOG_TYPE_ERROR, "Failed to load Seq2Seq EMT package for: %s", v42, 0xCu);
        if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v24.__r_.__value_.__l.__data_);
        }
        if (v41 < 0) {
          operator delete(*(void **)buf);
        }
      }
      char v16 = 0;
    }

    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    CFTypeRef v18 = CFLocaleGetValue(locale, v5);
    BOOL v19 = _nlpDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(&v24, "");
      applesauce::CF::convert_or<std::string>((CFTypeID)v18, (uint64_t)&v24, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        size_t v22 = &__p;
      }
      else {
        size_t v22 = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = v22;
      _os_log_error_impl(&dword_26031A000, v19, OS_LOG_TYPE_ERROR, "Failed to load Seq2Seq EMT package for: %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24.__r_.__value_.__l.__data_);
      }
    }

    char v16 = 0;
  }
  _Block_object_dispose(&v32, 8);
  if (cf) {
    CFRelease(cf);
  }
  return v16;
}

void sub_26032562C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void ___ZN32TLCompositeTransliteratorSeq2Seq16loadSeq2SeqModelEPK10__CFLocalePK7__CFURL_block_invoke(uint64_t a1, CFURLRef url, uint64_t a3, uint64_t a4, const __CFString *a5, unsigned char *a6)
{
  CFStringRef PathComponent = CFURLCopyLastPathComponent(url);
  if (PathComponent)
  {
    CFStringRef v11 = PathComponent;
    if (CFStringsAreEqual(PathComponent, @"EMT_package")
      && (CFStringsAreEqual(*(const __CFString **)(a1 + 40), @"ur")
       && CFStringsAreEqual(a5, @"Transliteration")
       || CFStringsAreEqual(a5, @"MultilingualTransliteration")))
    {
      uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
      CFStringRef v13 = CFURLCopyPath(url);
      nlp::CFScopedPtr<__CFString const*>::reset((const void **)(v12 + 48), v13);
      *a6 = 1;
    }
    CFRelease(v11);
  }
}

void sub_260325844(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void TLCompositeTransliteratorSeq2Seq::seq2SeqCandidatesForInput(uint64_t *a1@<X0>, uint64_t a2@<X1>, int64x2_t *a3@<X8>)
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  TLOSSignPostseq2SeqCandidatesForInput::TLOSSignPostseq2SeqCandidatesForInput((TLOSSignPostseq2SeqCandidatesForInput *)&v58);
  a3->i64[0] = 0;
  a3->i64[1] = 0;
  a3[1].i64[0] = 0;
  if (a1[2])
  {
    if (*(char *)(a2 + 23) < 0)
    {
      if (!*(void *)(a2 + 8)) {
        goto LABEL_27;
      }
      uint64_t v6 = *(void *)a2;
    }
    else
    {
      uint64_t v6 = a2;
      if (!*(unsigned char *)(a2 + 23)) {
        goto LABEL_27;
      }
    }
    uint64_t v37 = [NSString stringWithUTF8String:v6];
    uint64_t v36 = [MEMORY[0x263F089D8] string];
    uint64_t v7 = [v37 length];
    v56[0] = MEMORY[0x263EF8330];
    v56[1] = 3221225472;
    v56[2] = ___ZNK32TLCompositeTransliteratorSeq2Seq25seq2SeqCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke;
    v56[3] = &unk_265552508;
    CFLocaleRef v8 = v36;
    v57 = v8;
    objc_msgSend(v37, "enumerateSubstringsInRange:options:usingBlock:", 0, v7, 2, v56);
    CFStringTrimWhitespace(v8);
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    uint64_t v50 = 0;
    v51 = &v50;
    uint64_t v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__42;
    int v54 = __Block_byref_object_dispose__43;
    id v55 = 0;
    uint64_t v10 = *a1;
    CFStringRef v13 = a1 + 1;
    uint64_t v12 = a1[1];
    CFStringRef v11 = (void *)v13[1];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = ___ZNK32TLCompositeTransliteratorSeq2Seq25seq2SeqCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke_44;
    v47[3] = &unk_265552530;
    CFIndex v49 = &v50;
    id v14 = v9;
    CFCharacterSetRef v48 = v14;
    uint64_t v34 = v8;
    uint64_t v35 = v14;
    [v11 translateString:v8 from:v10 to:v12 completion:v47];
    dispatch_time_t v15 = dispatch_time(0, 60000000);
    if (dispatch_semaphore_wait(v14, v15))
    {
      char v16 = _nlpDefaultLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        TLCompositeTransliteratorSeq2Seq::seq2SeqCandidatesForInput((char *)(a2 + 23), (void *)a2, v16);
      }
    }
    for (unint64_t i = 0; ; ++i)
    {
      unint64_t v18 = [(id)v51[5] count];
      unint64_t v19 = 5;
      if (v18 < 5) {
        unint64_t v19 = v18;
      }
      if (i >= v19) {
        break;
      }
      CFTypeRef v20 = [MEMORY[0x263EFF980] array];
      unint64_t v21 = [(id)v51[5] objectAtIndexedSubscript:i];
      size_t v22 = [v21 tokens];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v23 = v22;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v59 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v24; ++j)
          {
            if (*(void *)v44 != v25) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = [*(id *)(*((void *)&v43 + 1) + 8 * j) text];
            [v20 addObject:v27];
          }
          uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v59 count:16];
        }
        while (v24);
      }

      id v28 = [v20 componentsJoinedByString:&stru_270C36558];
      uint64_t v29 = (char *)[v28 UTF8String];
      unint64_t v41 = 0xFFF0000000000000;
      v42 = v29;
      CFStringRef v30 = [(id)v51[5] objectAtIndexedSubscript:i];
      [v30 score];
      uint64_t v40 = v31;
      uint64_t v39 = 2;
      unsigned __int8 v38 = 0;
      unint64_t v32 = a3->u64[1];
      if (v32 >= a3[1].i64[0])
      {
        uint64_t v33 = std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL>(a3, a2, &v42, (double *)&v41, (double *)&v40, &v39, &v38);
      }
      else
      {
        std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL,TLCompositeTransliteratorCandidate*>(a3->i64[1], a2, &v42, (double *)&v41, (double *)&v40, &v39, &v38);
        uint64_t v33 = v32 + 80;
        a3->i64[1] = v32 + 80;
      }
      a3->i64[1] = v33;
    }
    _Block_object_dispose(&v50, 8);
  }
LABEL_27:
  TLOSSignPostseq2SeqCandidatesForInput::~TLOSSignPostseq2SeqCandidatesForInput(&v58);
}

void sub_260325CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void **a34)
{
  _Block_object_dispose(&a34, 8);
  *(void *)(v35 + 48) = v34;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100](&a34);
  TLOSSignPostseq2SeqCandidatesForInput::~TLOSSignPostseq2SeqCandidatesForInput((os_signpost_id_t *)(v36 - 256));
  _Unwind_Resume(a1);
}

void ___ZNK32TLCompositeTransliteratorSeq2Seq25seq2SeqCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "appendString:");
  [*(id *)(a1 + 32) appendString:@" "];
}

void sub_260325E4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__42(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = 0;
  return result;
}

void __Block_byref_object_dispose__43(uint64_t a1)
{
}

void ___ZNK32TLCompositeTransliteratorSeq2Seq25seq2SeqCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke_44(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = [v6 copy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  CFStringRef v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_260325EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void TLOSSignPostseq2SeqCandidatesForInput::TLOSSignPostseq2SeqCandidatesForInput(TLOSSignPostseq2SeqCandidatesForInput *this)
{
  uint64_t v2 = _nlpSignpostLog();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, this);

  *(void *)this = v3;
  uint64_t v4 = _nlpSignpostLog();
  CFStringRef v5 = v4;
  os_signpost_id_t v6 = *(void *)this;
  if ((unint64_t)(*(void *)this - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_26031A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "seq2SeqCandidatesForInput", (const char *)&unk_2603359EA, v7, 2u);
  }
}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL>(int64x2_t *a1, uint64_t a2, char **a3, double *a4, double *a5, void *a6, unsigned __int8 *a7)
{
  uint64_t v8 = a1->i64[0];
  unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  unint64_t v10 = v9 + 1;
  if (v9 + 1 > 0x333333333333333) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t i64 = (uint64_t)a1[1].i64;
  unint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v8) >> 4);
  if (2 * v18 > v10) {
    unint64_t v10 = 2 * v18;
  }
  if (v18 >= 0x199999999999999) {
    unint64_t v19 = 0x333333333333333;
  }
  else {
    unint64_t v19 = v10;
  }
  uint64_t v35 = a1 + 1;
  if (v19) {
    CFTypeRef v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v19);
  }
  else {
    CFTypeRef v20 = 0;
  }
  unint64_t v32 = v20;
  v33.i64[0] = (uint64_t)&v20[80 * v9];
  v33.i64[1] = v33.i64[0];
  uint64_t v34 = &v20[80 * v19];
  std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL,TLCompositeTransliteratorCandidate*>(v33.i64[0], a2, a3, a4, a5, a6, a7);
  uint64_t v22 = a1->i64[0];
  unint64_t v21 = a1->u64[1];
  uint64_t v23 = v33.i64[0];
  uint64_t v24 = v33.i64[0];
  if (v21 == a1->i64[0])
  {
    int64x2_t v28 = vdupq_n_s64(v21);
  }
  else
  {
    do
    {
      long long v25 = *(_OWORD *)(v21 - 80);
      *(void *)(v24 - 64) = *(void *)(v21 - 64);
      *(_OWORD *)(v24 - 8std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = v25;
      *(void *)(v21 - 72) = 0;
      *(void *)(v21 - 64) = 0;
      *(void *)(v21 - 8std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = 0;
      long long v26 = *(_OWORD *)(v21 - 56);
      *(void *)(v24 - 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = *(void *)(v21 - 40);
      *(_OWORD *)(v24 - 56) = v26;
      *(void *)(v21 - 48) = 0;
      *(void *)(v21 - 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = 0;
      *(void *)(v21 - 56) = 0;
      long long v27 = *(_OWORD *)(v21 - 32);
      *(_OWORD *)(v24 - 23) = *(_OWORD *)(v21 - 23);
      *(_OWORD *)(v24 - 32) = v27;
      v24 -= 80;
      v21 -= 80;
    }
    while (v21 != v22);
    int64x2_t v28 = *a1;
  }
  uint64_t v29 = v23 + 80;
  a1->i64[0] = v24;
  a1->i64[1] = v23 + 80;
  int64x2_t v33 = v28;
  CFStringRef v30 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v34;
  uint64_t v34 = v30;
  unint64_t v32 = (char *)v28.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v32);
  return v29;
}

void sub_260326144(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,std::string const&,char const*,double,double,TLTransliteratorCandidateType,BOOL,TLCompositeTransliteratorCandidate*>(uint64_t a1, uint64_t a2, char **a3, double *a4, double *a5, void *a6, unsigned __int8 *a7)
{
  std::string::basic_string[abi:ne180100]<0>(__p, *a3);
  TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(a1, a2, __p, *a6, *a7, *a4, *a5);
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  return a1;
}

void sub_2603261E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void TLOSSignPostseq2SeqCandidatesForInput::~TLOSSignPostseq2SeqCandidatesForInput(os_signpost_id_t *this)
{
  uint64_t v2 = _nlpSignpostLog();
  os_signpost_id_t v3 = v2;
  os_signpost_id_t v4 = *this;
  if (*this - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)CFStringRef v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_26031A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "seq2SeqCandidatesForInput", (const char *)&unk_2603359EA, v5, 2u);
  }
}

void TLTamilOrthographyChecker::TLTamilOrthographyChecker(TLTamilOrthographyChecker *this)
{
  *(_OWORD *)((char *)this + 4std::unique_ptr<TL::StringMap>::reset[abi:ne180100](this, 0) = 0u;
  uint64_t v2 = (const void **)((char *)this + 40);
  os_signpost_id_t v3 = (const void **)((char *)this + 48);
  *(_OWORD *)((char *)this + 56) = 0u;
  os_signpost_id_t v4 = (const void **)((char *)this + 56);
  *(void *)this = &unk_270C36368;
  *((void *)this + 1) = @"‍";
  *((void *)this + 3) = @"ஃ";
  *((void *)this + 4) = @"்";
  *((void *)this + 2) = @"ஂ";
  uint64_t v22 = (const void **)((char *)this + 64);
  *((void *)this + 9) = 0;
  CFStringRef v5 = (const void **)((char *)this + 72);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  uint64_t v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"அ");
    CFStringAppend(v7, @"ஆ");
    CFStringAppend(v7, @"இ");
    CFStringAppend(v7, @"ஈ");
    CFStringAppend(v7, @"உ");
    CFStringAppend(v7, @"ஊ");
    CFStringAppend(v7, @"எ");
    CFStringAppend(v7, @"ஏ");
    CFStringAppend(v7, @"ஐ");
    CFStringAppend(v7, @"ஒ");
    CFStringAppend(v7, @"ஓ");
    CFStringAppend(v7, @"ஔ");
  }
  CFCharacterSetRef v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  unint64_t v9 = CFStringCreateMutable(0, 0);
  unint64_t v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, @"ா");
    CFStringAppend(v10, @"ி");
    CFStringAppend(v10, @"ீ");
    CFStringAppend(v10, @"ு");
    CFStringAppend(v10, @"ூ");
    CFStringAppend(v10, @"ெ");
    CFStringAppend(v10, @"ே");
    CFStringAppend(v10, @"ை");
    CFStringAppend(v10, @"ொ");
    CFStringAppend(v10, @"ோ");
    CFStringAppend(v10, @"ௌ");
  }
  CFCharacterSetRef v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v11);
  uint64_t v12 = CFStringCreateMutable(0, 0);
  CFStringRef v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, v10);
  }
  CFCharacterSetRef v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v14);
  char v15 = CFStringCreateMutable(0, 0);
  char v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, @"க");
    CFStringAppend(v16, @"ங");
    CFStringAppend(v16, @"ச");
    CFStringAppend(v16, @"ஜ");
    CFStringAppend(v16, @"ஞ");
    CFStringAppend(v16, @"ட");
    CFStringAppend(v16, @"ண");
    CFStringAppend(v16, @"த");
    CFStringAppend(v16, @"ந");
    CFStringAppend(v16, @"ன");
    CFStringAppend(v16, @"ப");
    CFStringAppend(v16, @"ம");
    CFStringAppend(v16, @"ய");
    CFStringAppend(v16, @"ர");
    CFStringAppend(v16, @"ற");
    CFStringAppend(v16, @"ல");
    CFStringAppend(v16, @"ள");
    CFStringAppend(v16, @"ழ");
    CFStringAppend(v16, @"வ");
    CFStringAppend(v16, @"ஶ");
    CFStringAppend(v16, @"ஷ");
    CFStringAppend(v16, @"ஸ");
    CFStringAppend(v16, @"ஹ");
    CFStringAppend(v16, @"ௐ");
  }
  CFCharacterSetRef v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  unint64_t v18 = CFStringCreateMutable(0, 0);
  unint64_t v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  CFCharacterSetRef v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_2603267F8(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  unint64_t v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFCharacterSetRef v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  CFStringRef v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  char v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<__CFCharacterSet const*>::reset(const void **a1, const void *a2)
{
  os_signpost_id_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void TLTamilOrthographyChecker::~TLTamilOrthographyChecker(const void **this)
{
  *this = &unk_270C36368;
  uint64_t v2 = this + 5;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 8, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 7, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 6, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  uint64_t vars8;

  TLTamilOrthographyChecker::~TLTamilOrthographyChecker(this);
  JUMPOUT(0x26120D630);
}

BOOL TLTamilOrthographyChecker::isVowelSign(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v3 = (const __CFCharacterSet *)*((void *)this + 6);
  v5.length = CFStringGetLength(theString);
  v5.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, v3, v5, 0, 0) != 0;
}

BOOL TLTamilOrthographyChecker::canViramaFollowLetter(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v2 = (const __CFCharacterSet *)*((void *)this + 8);
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v2, CharacterAtIndex) != 0;
}

BOOL TLTamilOrthographyChecker::canViramaPrecedeLetter(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v4 = (const __CFCharacterSet *)*((void *)this + 8);
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFEqual(theString, *((CFStringRef *)this + 1))
      || CFEqual(theString, *((CFStringRef *)this + 3));
}

BOOL TLTamilOrthographyChecker::isInvalidConsecutiveDiacritics(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v17.CFIndex location = 0;
  v17.length = Length;
  if (!CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v17, 0, &result))
  {
    char v6 = 1;
    return (v6 & 1) == 0;
  }
  CFIndex v5 = 0;
  char v6 = 1;
  CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
  while (result.location)
  {
    if (location == 0x7FFFFFFFFFFFFFFFLL || result.location != v5 + location) {
      goto LABEL_24;
    }
    v18.CFIndex location = location;
    v18.length = v5;
    CFStringRef v8 = CFStringCreateWithSubstring(0, theString, v18);
    CFStringRef v9 = CFStringCreateWithSubstring(0, theString, result);
    if (CFEqual(v9, *((CFStringRef *)this + 2))
      && (CFCharacterSetRef v13 = (const __CFCharacterSet *)*((void *)this + 6),
          v20.length = CFStringGetLength(v8),
          v20.CFIndex location = 0,
          CFStringFindCharacterFromSet(v8, v13, v20, 0, 0))
      || CFEqual(v9, *((CFStringRef *)this + 3))
      && CFEqual(v8, *((CFStringRef *)this + 4))
      || CFEqual(v9, *((CFStringRef *)this + 3))
      && (CFCharacterSetRef v14 = (const __CFCharacterSet *)*((void *)this + 6),
          v21.length = CFStringGetLength(v8),
          v21.CFIndex location = 0,
          CFStringFindCharacterFromSet(v8, v14, v21, 0, 0)))
    {
      char v10 = 1;
      if (!v9) {
        goto LABEL_21;
      }
LABEL_20:
      CFRelease(v9);
      goto LABEL_21;
    }
    char v10 = 0;
    char v6 = 0;
    if (v9) {
      goto LABEL_20;
    }
LABEL_21:
    if (v8) {
      CFRelease(v8);
    }
    if ((v10 & 1) == 0) {
      return (v6 & 1) == 0;
    }
LABEL_24:
    CFIndex location = result.location;
    CFIndex v5 = result.length;
    v22.CFIndex location = result.length + result.location;
    v22.length = Length - (result.length + result.location);
    if (!CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 7), v22, 0, &result)) {
      return (v6 & 1) == 0;
    }
  }
  v19.length = result.length;
  v19.CFIndex location = 0;
  CFStringRef v11 = CFStringCreateWithSubstring(0, theString, v19);
  CFComparisonResult v12 = CFStringCompare(v11, *((CFStringRef *)this + 3), 0);
  if (v11) {
    CFRelease(v11);
  }
  if (v12 == kCFCompareEqualTo) {
    goto LABEL_24;
  }
  char v6 = 0;
  return (v6 & 1) == 0;
}

void sub_260326D1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLTamilOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(TLTamilOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v13.CFIndex location = 0;
  v13.length = Length;
  char v5 = 1;
  if (CFStringFindWithOptions(theString, *((CFStringRef *)this + 4), v13, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        char v5 = 0;
        return (v5 & 1) == 0;
      }
      v14.CFIndex location = result.location - 1;
      v14.length = 1;
      CFStringRef v6 = CFStringCreateWithSubstring(0, theString, v14);
      CFStringRef v7 = 0;
      if (result.location + 1 < Length)
      {
        v15.length = 1;
        v15.CFIndex location = result.location + 1;
        CFStringRef v7 = CFStringCreateWithSubstring(0, theString, v15);
      }
      CFCharacterSetRef v8 = (const __CFCharacterSet *)*((void *)this + 8);
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(v6, 0);
      if (!CFCharacterSetIsCharacterMember(v8, CharacterAtIndex)) {
        break;
      }
      if (v7)
      {
        BOOL canViramaPrecedeLetter = TLTamilOrthographyChecker::canViramaPrecedeLetter(this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      BOOL canViramaPrecedeLetter = 1;
      if (v6) {
        goto LABEL_11;
      }
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v16.CFIndex location = result.length + result.location;
        v16.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, *((CFStringRef *)this + 4), v16, 0, &result)) {
          continue;
        }
      }
      return (v5 & 1) == 0;
    }
    BOOL canViramaPrecedeLetter = 0;
    char v5 = 0;
    if (v7) {
LABEL_9:
    }
      CFRelease(v7);
    if (!v6) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_260326EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

BOOL TLTamilOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFCharacterSetRef v5 = CFCharacterSetCreateWithCharactersInString(0, @"ஂஃ");
  v6.CFIndex location = 0;
  CFCharacterSetRef v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    int CharacterFromSet = CFStringFindCharacterFromSet(theString, this[5], v6, 0, &result);
    if (!CharacterFromSet) {
      break;
    }
    if (result.location + 1 < Length)
    {
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[7], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex)) {
          break;
        }
      }
    }
    v6.CFIndex location = result.length + result.location;
  }
  if (v5) {
    CFRelease(v5);
  }
  return CharacterFromSet != 0;
}

void sub_260326FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLTamilOrthographyChecker::isInvalidTamilLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  v5.length = CFStringGetLength(theString);
  v5.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, this[9], v5, 0, 0) != 0;
}

BOOL TLTamilOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  if (TLTamilOrthographyChecker::isInvalidConsecutiveDiacritics((TLTamilOrthographyChecker *)this, a2)
    || TLTamilOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((TLTamilOrthographyChecker *)this, a2)
    || TLTamilOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.CFIndex location = 0;
  return CFStringFindCharacterFromSet(a2, this[9], v7, 0, 0) == 0;
}

void *operator<<(void *a1, uint64_t a2)
{
  CFCharacterSetRef v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)"Latin string: ", 14);
  int v5 = *(char *)(a2 + 23);
  if (v5 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *(void *)a2;
  }
  if (v5 >= 0) {
    uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v7 = *(void *)(a2 + 8);
  }
  CFCharacterSetRef v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, v6, v7);
  CFStringRef v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)", Transliterated string: ", 25);
  int v10 = *(char *)(a2 + 47);
  if (v10 >= 0) {
    uint64_t v11 = a2 + 24;
  }
  else {
    uint64_t v11 = *(void *)(a2 + 24);
  }
  if (v10 >= 0) {
    uint64_t v12 = *(unsigned __int8 *)(a2 + 47);
  }
  else {
    uint64_t v12 = *(void *)(a2 + 32);
  }
  CFRange v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)", LM score: ", 12);
  CFRange v14 = (void *)std::ostream::operator<<();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)", Seq2Seq score: ", 17);
  CFRange v15 = (void *)std::ostream::operator<<();
  CFRange v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)", Type: ", 8);
  TLTransliterationCandidateTypeAsString(*(void *)(a2 + 64));
  id v17 = objc_claimAutoreleasedReturnValue();
  CFRange v18 = (const char *)[v17 UTF8String];
  size_t v19 = strlen(v18);
  CFRange v20 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v16, (uint64_t)v18, v19);
  CFRange v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v20, (uint64_t)", Is extension candidate: ", 26);
  if (*(unsigned char *)(a2 + 72)) {
    CFRange v22 = "true";
  }
  else {
    CFRange v22 = "false";
  }
  std::string::basic_string[abi:ne180100]<0>(__p, v22);
  if ((v27 & 0x80u) == 0) {
    uint64_t v23 = __p;
  }
  else {
    uint64_t v23 = (void **)__p[0];
  }
  if ((v27 & 0x80u) == 0) {
    uint64_t v24 = v27;
  }
  else {
    uint64_t v24 = (uint64_t)__p[1];
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)v23, v24);
  if ((char)v27 < 0) {
    operator delete(__p[0]);
  }

  return a1;
}

void sub_260327240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(std::string *this, long long *a2, long long *a3, std::string::size_type a4, std::string::value_type a5, double a6, double a7)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v13 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v13;
  }
  CFRange v14 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v14, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v15 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = v15;
  }
  *(double *)&this[2].__r_.__value_.__l.__data_ = a6;
  *(double *)&this[2].__r_.__value_.__l.__size_ = a7;
  this[2].__r_.__value_.__r.__words[2] = a4;
  this[3].__r_.__value_.__s.__data_[0] = a5;
}

void sub_260327314(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

double TLCompositeTransliteratorCandidate::getTotalScore(TLCompositeTransliteratorCandidate *this, double a2)
{
  return *((double *)this + 7) + a2 * *((double *)this + 6);
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x26120D500](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      int v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
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
  MEMORY[0x26120D510](v13);
  return a1;
}

void sub_26032747C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x26120D510](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x26032745CLL);
}

void sub_2603274D0(_Unwind_Exception *a1)
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

void sub_260327650(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void TLCompositeTransliteratorLexicon::TLCompositeTransliteratorLexicon(TLCompositeTransliteratorLexicon *this, const __CFLocale *a2)
{
  *(void *)this = 0;
  DirectLatinToNativesMap = (const void *)TLCompositeTransliteratorLexicon::loadDirectLatinToNativesMap(this, a2);
  nlp::CFScopedPtr<_LXTransliteration const*>::reset((const void **)this, DirectLatinToNativesMap);
}

void sub_2603276A4(_Unwind_Exception *a1)
{
  nlp::CFScopedPtr<_LXTransliteration const*>::reset(v1, 0);
  _Unwind_Resume(a1);
}

void nlp::CFScopedPtr<_LXTransliteration const*>::reset(const void **a1, const void *a2)
{
  CFCharacterSetRef v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

uint64_t TLCompositeTransliteratorLexicon::loadDirectLatinToNativesMap(TLCompositeTransliteratorLexicon *this, const __CFLocale *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  CFMutableStringRef Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  int64_t v12 = Mutable;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x263F51318], a2);
  uint64_t v4 = LXTransliterationCreate();
  if (!v4)
  {
    CFTypeRef Value = CFLocaleGetValue(a2, (CFLocaleKey)*MEMORY[0x263EFFCF0]);
    uint64_t v6 = _nlpDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      std::string::basic_string[abi:ne180100]<0>(v9, "");
      applesauce::CF::convert_or<std::string>((CFTypeID)Value, (uint64_t)v9, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        CFURLRef p_p = &__p;
      }
      else {
        CFURLRef p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = p_p;
      _os_log_error_impl(&dword_26031A000, v6, OS_LOG_TYPE_ERROR, "Failed to load direct Latin to Native new lexicon for: %s", buf, 0xCu);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v10 < 0) {
        operator delete(v9[0]);
      }
    }
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  return v4;
}

void sub_26032787C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);

  nlp::CFScopedPtr<__CFDictionary *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

void TLCompositeTransliteratorLexicon::~TLCompositeTransliteratorLexicon(const void **this)
{
}

void TLCompositeTransliteratorLexicon::lexiconCandidatesForInput(void *a1@<X0>, uint64_t a2@<X1>, int64x2_t *a3@<X8>)
{
  TLOSSignPostlexiconCandidatesForInput::TLOSSignPostlexiconCandidatesForInput((TLOSSignPostlexiconCandidatesForInput *)&v25);
  a3->i64[0] = 0;
  a3->i64[1] = 0;
  a3[1].i64[0] = 0;
  if (*a1)
  {
    int v6 = *(char *)(a2 + 23);
    CFIndex v7 = v6 >= 0 ? *(unsigned __int8 *)(a2 + 23) : *(void *)(a2 + 8);
    if (v7)
    {
      uint64_t v18 = 0;
      size_t v19 = &v18;
      uint64_t v20 = 0x4812000000;
      CFRange v21 = __Block_byref_object_copy__2;
      CFRange v22 = __Block_byref_object_dispose__2;
      uint64_t v23 = &unk_260336F5D;
      memset(v24, 0, sizeof(v24));
      if (v6 >= 0) {
        int v8 = (const UInt8 *)a2;
      }
      else {
        int v8 = *(const UInt8 **)a2;
      }
      if (v8)
      {
        CFStringRef v9 = CFStringCreateWithBytes(0, v8, v7, 0x8000100u, 0);
        CFStringRef v26 = v9;
        if (!v9)
        {
          exception = __cxa_allocate_exception(0x10uLL);
          MEMORY[0x26120D480](exception, "Could not construct");
          __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
        }
      }
      else
      {
        CFStringRef v9 = 0;
        CFStringRef v26 = 0;
      }
      *(void *)&v17[1] = MEMORY[0x263EF8330];
      *(void *)&v17[2] = 3221225472;
      *(void *)&v17[3] = ___ZNK32TLCompositeTransliteratorLexicon25lexiconCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke;
      *(void *)&v17[4] = &unk_265552558;
      *(void *)&v17[5] = &v18;
      LXTransliterationEnumerateForTransliterated();
      uint64_t v10 = v19[6];
      uint64_t v11 = v19[7];
      if (v10 != v11)
      {
        unint64_t v12 = a3->u64[1];
        do
        {
          v17[0] = -INFINITY;
          int v16 = 0;
          uint64_t v15 = 0;
          unsigned __int8 v14 = 0;
          if (v12 >= a3[1].i64[0])
          {
            unint64_t v12 = std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,std::string&,double,float,TLTransliteratorCandidateType,BOOL>(a3, a2, v10, v17, (float *)&v16, &v15, &v14);
          }
          else
          {
            TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v12, a2, v10, 0, 0, -INFINITY, 0.0);
            v12 += 80;
            a3->i64[1] = v12;
          }
          a3->i64[1] = v12;
          v10 += 24;
        }
        while (v10 != v11);
        CFStringRef v9 = v26;
      }
      if (v9) {
        CFRelease(v9);
      }
      _Block_object_dispose(&v18, 8);
      CFStringRef v26 = (const __CFString *)v24;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v26);
    }
  }
  TLOSSignPostlexiconCandidatesForInput::~TLOSSignPostlexiconCandidatesForInput(&v25);
}

void sub_260327B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  *(void *)(v10 + 8nlp::CFScopedPtr<_LXTransliteration const*>::reset(this, 0) = v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v12 - 72));
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  TLOSSignPostlexiconCandidatesForInput::~TLOSSignPostlexiconCandidatesForInput((os_signpost_id_t *)(v12 - 80));
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__2(__n128 *a1, __n128 *a2)
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

void __Block_byref_object_dispose__2(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 48);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
}

void ___ZNK32TLCompositeTransliteratorLexicon25lexiconCandidatesForInputERKNSt3__112basic_stringIcNS0_11char_traitsIcEENS0_9allocatorIcEEEE_block_invoke(uint64_t a1)
{
  CFStringRef v2 = (const __CFString *)LXTransliterationEntryCopyNativeString();
  CFStringRef v19 = v2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  getUTF8StringFromCFString(v2, __p);
  unint64_t v4 = *(void *)(v3 + 64);
  unint64_t v5 = *(void *)(v3 + 56);
  if (v5 < v4)
  {
    long long v6 = *(_OWORD *)__p;
    *(void *)(v5 + 16) = v18;
    *(_OWORD *)unint64_t v5 = v6;
    *(void *)(v3 + 56) = v5 + 24;
    if (!v2) {
      return;
    }
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)(v3 + 48);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v5 - v7) >> 3);
  unint64_t v9 = v8 + 1;
  if (v8 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v4 - v7) >> 3);
  if (2 * v10 > v9) {
    unint64_t v9 = 2 * v10;
  }
  if (v10 >= 0x555555555555555) {
    unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v11 = v9;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v3 + 64);
  if (v11) {
    uint64_t v12 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v3 + 64, v11);
  }
  else {
    uint64_t v12 = 0;
  }
  long long v13 = v12 + v8;
  __v.__first_ = v12;
  __v.__begin_ = v13;
  __v.__end_cap_.__value_ = &v12[v11];
  long long v14 = *(_OWORD *)__p;
  v13->__r_.__value_.__r.__words[2] = v18;
  *(_OWORD *)&v13->__r_.__value_.__l.__data_ = v14;
  __p[1] = 0;
  std::string::size_type v18 = 0;
  __p[0] = 0;
  __v.__end_ = v13 + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)(v3 + 48), &__v);
  uint64_t v15 = *(void *)(v3 + 56);
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  int v16 = SHIBYTE(v18);
  *(void *)(v3 + 56) = v15;
  if ((v16 & 0x80000000) == 0)
  {
    if (!v2) {
      return;
    }
    goto LABEL_15;
  }
  operator delete(__p[0]);
  if (v2) {
LABEL_15:
  }
    CFRelease(v2);
}

void sub_260327D84(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, char a8, std::__split_buffer<std::string> *a9, void *__pa, uint64_t a11, int a12, __int16 a13, char a14, char a15, const void *a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__pa);
  }
  nlp::CFScopedPtr<__CFString const*>::reset(&a16, 0);
  _Unwind_Resume(a1);
}

uint64_t TLCompositeTransliteratorLexicon::isMemberOfTheNativeLexicon(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  CFStringRef CFStringFromString = createCFStringFromString(a2);
  return MEMORY[0x270F46FB8](v2, CFStringFromString);
}

void TLOSSignPostlexiconCandidatesForInput::TLOSSignPostlexiconCandidatesForInput(TLOSSignPostlexiconCandidatesForInput *this)
{
  uint64_t v2 = _nlpSignpostLog();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, this);

  *(void *)this = v3;
  unint64_t v4 = _nlpSignpostLog();
  unint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)this;
  if ((unint64_t)(*(void *)this - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_26031A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "lexiconCandidatesForInput", (const char *)&unk_2603359EA, v7, 2u);
  }
}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string const&,std::string&,double,float,TLTransliteratorCandidateType,BOOL>(int64x2_t *a1, uint64_t a2, uint64_t a3, double *a4, float *a5, void *a6, unsigned __int8 *a7)
{
  uint64_t v8 = a1->i64[0];
  unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  unint64_t v10 = v9 + 1;
  if (v9 + 1 > 0x333333333333333) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t i64 = (uint64_t)a1[1].i64;
  unint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v8) >> 4);
  if (2 * v18 > v10) {
    unint64_t v10 = 2 * v18;
  }
  if (v18 >= 0x199999999999999) {
    unint64_t v19 = 0x333333333333333;
  }
  else {
    unint64_t v19 = v10;
  }
  uint64_t v35 = a1 + 1;
  if (v19) {
    uint64_t v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v19);
  }
  else {
    uint64_t v20 = 0;
  }
  unint64_t v32 = v20;
  v33.i64[0] = (uint64_t)&v20[80 * v9];
  v33.i64[1] = v33.i64[0];
  uint64_t v34 = &v20[80 * v19];
  TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v33.i64[0], a2, a3, *a6, *a7, *a4, *a5);
  uint64_t v22 = a1->i64[0];
  unint64_t v21 = a1->u64[1];
  uint64_t v23 = v33.i64[0];
  uint64_t v24 = v33.i64[0];
  if (v21 == a1->i64[0])
  {
    int64x2_t v28 = vdupq_n_s64(v21);
  }
  else
  {
    do
    {
      long long v25 = *(_OWORD *)(v21 - 80);
      *(void *)(v24 - 64) = *(void *)(v21 - 64);
      *(_OWORD *)(v24 - 8nlp::CFScopedPtr<_LXTransliteration const*>::reset(this, 0) = v25;
      *(void *)(v21 - 72) = 0;
      *(void *)(v21 - 64) = 0;
      *(void *)(v21 - 8nlp::CFScopedPtr<_LXTransliteration const*>::reset(this, 0) = 0;
      long long v26 = *(_OWORD *)(v21 - 56);
      *(void *)(v24 - 4nlp::CFScopedPtr<_LXTransliteration const*>::reset(this, 0) = *(void *)(v21 - 40);
      *(_OWORD *)(v24 - 56) = v26;
      *(void *)(v21 - 48) = 0;
      *(void *)(v21 - 4nlp::CFScopedPtr<_LXTransliteration const*>::reset(this, 0) = 0;
      *(void *)(v21 - 56) = 0;
      long long v27 = *(_OWORD *)(v21 - 32);
      *(_OWORD *)(v24 - 23) = *(_OWORD *)(v21 - 23);
      *(_OWORD *)(v24 - 32) = v27;
      v24 -= 80;
      v21 -= 80;
    }
    while (v21 != v22);
    int64x2_t v28 = *a1;
  }
  uint64_t v29 = v23 + 80;
  a1->i64[0] = v24;
  a1->i64[1] = v23 + 80;
  int64x2_t v33 = v28;
  CFStringRef v30 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v34;
  uint64_t v34 = v30;
  unint64_t v32 = (char *)v28.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v32);
  return v29;
}

void sub_260328060(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void TLOSSignPostlexiconCandidatesForInput::~TLOSSignPostlexiconCandidatesForInput(os_signpost_id_t *this)
{
  uint64_t v2 = _nlpSignpostLog();
  os_signpost_id_t v3 = v2;
  os_signpost_id_t v4 = *this;
  if (*this - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_26031A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "lexiconCandidatesForInput", (const char *)&unk_2603359EA, v5, 2u);
  }
}

void nlp::CFScopedPtr<__CFDictionary *>::reset(const void **a1, const void *a2)
{
  os_signpost_id_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void TLGurmukhiOrthographyChecker::TLGurmukhiOrthographyChecker(TLGurmukhiOrthographyChecker *this)
{
  *((_OWORD *)this + 3) = 0u;
  uint64_t v2 = (const void **)((char *)this + 48);
  os_signpost_id_t v3 = (const void **)((char *)this + 56);
  *((_OWORD *)this + 4) = 0u;
  os_signpost_id_t v4 = (const void **)((char *)this + 64);
  *(void *)this = &unk_270C363A8;
  *((void *)this + 1) = @"਼";
  *((void *)this + 2) = @"੍";
  *((void *)this + 3) = @"ਂ";
  *((void *)this + 4) = @"ੰ";
  *((void *)this + 5) = @"ੱ";
  uint64_t v22 = (const void **)((char *)this + 72);
  *((void *)this + 1nlp::CFScopedPtr<_LXTransliteration const*>::reset(this, 0) = 0;
  unint64_t v5 = (const void **)((char *)this + 80);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  uint64_t v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"ਅ");
    CFStringAppend(v7, @"ਆ");
    CFStringAppend(v7, @"ਇ");
    CFStringAppend(v7, @"ਈ");
    CFStringAppend(v7, @"ਉ");
    CFStringAppend(v7, @"ਊ");
    CFStringAppend(v7, @"ਏ");
    CFStringAppend(v7, @"ਐ");
    CFStringAppend(v7, @"ਓ");
    CFStringAppend(v7, @"ਔ");
  }
  CFCharacterSetRef v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  unint64_t v9 = CFStringCreateMutable(0, 0);
  unint64_t v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, @"ਾ");
    CFStringAppend(v10, @"ਿ");
    CFStringAppend(v10, @"ੀ");
    CFStringAppend(v10, @"ੁ");
    CFStringAppend(v10, @"ੂ");
    CFStringAppend(v10, @"ੇ");
    CFStringAppend(v10, @"ੈ");
    CFStringAppend(v10, @"ੋ");
    CFStringAppend(v10, @"ੌ");
  }
  CFCharacterSetRef v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v11);
  uint64_t v12 = CFStringCreateMutable(0, 0);
  long long v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 1));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 5));
    CFStringAppend(v13, v10);
  }
  CFCharacterSetRef v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v14);
  uint64_t v15 = CFStringCreateMutable(0, 0);
  int v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, @"ਕ");
    CFStringAppend(v16, @"ਖ");
    CFStringAppend(v16, @"ਗ");
    CFStringAppend(v16, @"ਘ");
    CFStringAppend(v16, @"ਙ");
    CFStringAppend(v16, @"ਚ");
    CFStringAppend(v16, @"ਛ");
    CFStringAppend(v16, @"ਜ");
    CFStringAppend(v16, @"ਝ");
    CFStringAppend(v16, @"ਞ");
    CFStringAppend(v16, @"ਟ");
    CFStringAppend(v16, @"ਠ");
    CFStringAppend(v16, @"ਡ");
    CFStringAppend(v16, @"ਢ");
    CFStringAppend(v16, @"ਣ");
    CFStringAppend(v16, @"ਤ");
    CFStringAppend(v16, @"ਥ");
    CFStringAppend(v16, @"ਦ");
    CFStringAppend(v16, @"ਧ");
    CFStringAppend(v16, @"ਨ");
    CFStringAppend(v16, @"ਪ");
    CFStringAppend(v16, @"ਫ");
    CFStringAppend(v16, @"ਬ");
    CFStringAppend(v16, @"ਭ");
    CFStringAppend(v16, @"ਮ");
    CFStringAppend(v16, @"ਯ");
    CFStringAppend(v16, @"ਰ");
    CFStringAppend(v16, @"ਲ");
    CFStringAppend(v16, @"ਵ");
    CFStringAppend(v16, @"ਸ");
    CFStringAppend(v16, @"ਹ");
    CFStringAppend(v16, @"ੜ");
  }
  CFCharacterSetRef v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  unint64_t v18 = CFStringCreateMutable(0, 0);
  unint64_t v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  CFCharacterSetRef v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_260328704(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  uint64_t v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  unint64_t v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFCharacterSetRef v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  long long v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  uint64_t v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLGurmukhiOrthographyChecker::~TLGurmukhiOrthographyChecker(const void **this)
{
  *this = &unk_270C363A8;
  uint64_t v2 = this + 6;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 8, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 7, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  uint64_t vars8;

  TLGurmukhiOrthographyChecker::~TLGurmukhiOrthographyChecker(this);
  JUMPOUT(0x26120D630);
}

BOOL TLGurmukhiOrthographyChecker::isVowelSign(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v3 = (const __CFCharacterSet *)*((void *)this + 7);
  v5.length = CFStringGetLength(theString);
  v5.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, v3, v5, 0, 0) != 0;
}

BOOL TLGurmukhiOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  if (CFEqual(theString1, this[1])) {
    return 1;
  }
  CFCharacterSetRef v4 = (const __CFCharacterSet *)this[9];
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLGurmukhiOrthographyChecker::canViramaPrecedeLetter(TLGurmukhiOrthographyChecker *this, const __CFString *a2)
{
  CFCharacterSetRef v3 = CFCharacterSetCreateWithCharactersInString(0, @"ਰਹਵ");
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
  int IsCharacterMember = CFCharacterSetIsCharacterMember(v3, CharacterAtIndex);
  if (v3) {
    CFRelease(v3);
  }
  return IsCharacterMember != 0;
}

void sub_2603289C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::canTippiFollowCharacter(TLGurmukhiOrthographyChecker *this, const __CFString *a2)
{
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFCharacterSetRef v4 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"ਾ");
    CFStringAppend(v4, @"ੀ");
    CFStringAppend(v4, @"ੇ");
    CFStringAppend(v4, @"ੈ");
    CFStringAppend(v4, @"ੋ");
    CFStringAppend(v4, @"ੌ");
    CFStringAppend(v4, @"ਆ");
    CFStringAppend(v4, @"ਉ");
    CFStringAppend(v4, @"ਊ");
    CFStringAppend(v4, @"ਈ");
    CFStringAppend(v4, @"ਏ");
    CFStringAppend(v4, @"ਐ");
    CFStringAppend(v4, @"ਓ");
    CFStringAppend(v4, @"ਔ");
  }
  CFCharacterSetRef v5 = CFCharacterSetCreateWithCharactersInString(0, v4);
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
  int IsCharacterMember = CFCharacterSetIsCharacterMember(v5, CharacterAtIndex);
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
  return IsCharacterMember == 0;
}

void sub_260328B58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::canAddakPrecedeLetter(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v2 = (const __CFCharacterSet *)*((void *)this + 9);
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v2, CharacterAtIndex) != 0;
}

BOOL TLGurmukhiOrthographyChecker::canNuktaFollowLetter(TLGurmukhiOrthographyChecker *this, const __CFString *a2)
{
  CFCharacterSetRef v3 = CFCharacterSetCreateWithCharactersInString(0, @"ਲਸਖਗਜਫਕ");
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a2, 0);
  int IsCharacterMember = CFCharacterSetIsCharacterMember(v3, CharacterAtIndex);
  if (v3) {
    CFRelease(v3);
  }
  return IsCharacterMember != 0;
}

void sub_260328C3C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::isInvalidConsecutiveDiacritics(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v16.CFIndex location = 0;
  v16.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 8), v16, 0, &result))
  {
    CFIndex v5 = 0;
    char v6 = 1;
    v7.CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      CFIndex location = result.location;
      if (!result.location)
      {
        char v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location) {
        break;
      }
LABEL_23:
      CFIndex v5 = result.length;
      v18.CFIndex location = result.length + location;
      v18.length = Length - (result.length + location);
      int CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 8), v18, 0, &result);
      v7.CFIndex location = location;
      if (!CharacterFromSet) {
        return (v6 & 1) == 0;
      }
    }
    v7.length = v5;
    CFStringRef v9 = CFStringCreateWithSubstring(0, theString, v7);
    CFStringRef v10 = CFStringCreateWithSubstring(0, theString, result);
    if ((CFStringCompare(v9, *((CFStringRef *)this + 1), 0)
       || CFEqual(v10, *((CFStringRef *)this + 1)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 5), 0)
       || (CFCharacterSetRef v12 = (const __CFCharacterSet *)*((void *)this + 7),
           v17.length = CFStringGetLength(v9),
           v17.CFIndex location = 0,
           !CFStringFindCharacterFromSet(v9, v12, v17, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 3), 0)
       || TLGurmukhiOrthographyChecker::canTippiFollowCharacter(0, v9))
      && (CFStringCompare(v10, *((CFStringRef *)this + 4), 0)
       || !TLGurmukhiOrthographyChecker::canTippiFollowCharacter(0, v9)))
    {
      char v6 = 0;
      int v11 = 0;
      if (!v10) {
        goto LABEL_19;
      }
    }
    else
    {
      int v11 = 1;
      if (!v10)
      {
LABEL_19:
        if (v9) {
          CFRelease(v9);
        }
        if (!v11) {
          return (v6 & 1) == 0;
        }
        CFIndex location = result.location;
        goto LABEL_23;
      }
    }
    CFRelease(v10);
    goto LABEL_19;
  }
  char v6 = 1;
  return (v6 & 1) == 0;
}

void sub_260328E60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v12.CFIndex location = 0;
  v12.length = Length;
  char v5 = 1;
  if (CFStringFindWithOptions(theString, this[2], v12, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        char v5 = 0;
        return (v5 & 1) == 0;
      }
      v13.CFIndex location = result.location - 1;
      v13.length = 1;
      CFStringRef v6 = CFStringCreateWithSubstring(0, theString, v13);
      CFStringRef v7 = 0;
      if (result.location + 1 < Length)
      {
        v14.length = 1;
        v14.CFIndex location = result.location + 1;
        CFStringRef v7 = CFStringCreateWithSubstring(0, theString, v14);
      }
      BOOL canViramaFollowLetter = TLGurmukhiOrthographyChecker::canViramaFollowLetter(this, v6);
      if (!canViramaFollowLetter) {
        break;
      }
      if (v7)
      {
        BOOL canViramaPrecedeLetter = TLGurmukhiOrthographyChecker::canViramaPrecedeLetter((TLGurmukhiOrthographyChecker *)canViramaFollowLetter, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      BOOL canViramaPrecedeLetter = 1;
      if (v6) {
        goto LABEL_11;
      }
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v15.CFIndex location = result.length + result.location;
        v15.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, this[2], v15, 0, &result)) {
          continue;
        }
      }
      return (v5 & 1) == 0;
    }
    BOOL canViramaPrecedeLetter = 0;
    char v5 = 0;
    if (v7) {
LABEL_9:
    }
      CFRelease(v7);
    if (!v6) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_260328FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

BOOL TLGurmukhiOrthographyChecker::isInvalidDiacriticAfterVowelLetter(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFCharacterSetRef v5 = CFCharacterSetCreateWithCharactersInString(0, @"ਂੰੱ");
  v6.CFIndex location = 0;
  CFCharacterSetRef v17 = v5;
  char v7 = 1;
  while (1)
  {
    v6.length = Length - v6.location;
    if (!CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 6), v6, 0, &result)) {
      break;
    }
    CFIndex location = result.location;
    if (result.location + 1 >= Length) {
      goto LABEL_18;
    }
    UniChar theChar = 0;
    UniChar theChar = CFStringGetCharacterAtIndex(theString, result.location + 1);
    if (CFCharacterSetIsCharacterMember(*((CFCharacterSetRef *)this + 8), theChar)
      && !CFCharacterSetIsCharacterMember(v5, theChar))
    {
      char v7 = 0;
      break;
    }
    CFStringRef v9 = CFStringCreateWithCharacters(0, &theChar, 1);
    CFStringRef v14 = v9;
    UniChar chars = 0;
    UniChar chars = CFStringGetCharacterAtIndex(theString, result.location);
    CFStringRef v10 = CFStringCreateWithCharacters(0, &chars, 1);
    if (CFEqual(v9, *((CFStringRef *)this + 4))
      && !TLGurmukhiOrthographyChecker::canTippiFollowCharacter(0, v10)
      || CFEqual(v9, *((CFStringRef *)this + 3))
      && TLGurmukhiOrthographyChecker::canTippiFollowCharacter(0, v10))
    {
      char v7 = 0;
      int v11 = 0;
      if (!v10) {
        goto LABEL_14;
      }
LABEL_13:
      CFRelease(v10);
      goto LABEL_14;
    }
    int v11 = 1;
    if (v10) {
      goto LABEL_13;
    }
LABEL_14:
    if (v9) {
      CFRelease(v9);
    }
    if (!v11) {
      break;
    }
    CFIndex location = result.location;
LABEL_18:
    v6.CFIndex location = result.length + location;
  }
  if (v5) {
    CFRelease(v5);
  }
  return (v7 & 1) == 0;
}

void sub_2603291CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va1, a4);
  va_start(va, a4);
  CFCharacterSetRef v5 = va_arg(va1, const void *);
  uint64_t v7 = va_arg(va1, void);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v9 = va_arg(va1, void);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va1, 0);
  _Unwind_Resume(a1);
}

uint64_t TLGurmukhiOrthographyChecker::isInvalidAddakFollowingConsonant(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v12.CFIndex location = 0;
  v12.length = Length;
  uint64_t v5 = CFStringFindWithOptions(theString, this[5], v12, 0, &result);
  if (v5)
  {
    while (result.location && result.location != Length - 1)
    {
      CFStringRef v7 = 0;
      if (result.location + 1 < Length)
      {
        v13.length = 1;
        v13.CFIndex location = result.location + 1;
        CFStringRef v7 = CFStringCreateWithSubstring(0, theString, v13);
      }
      CFCharacterSetRef v8 = (const __CFCharacterSet *)this[9];
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(v7, 0);
      int IsCharacterMember = CFCharacterSetIsCharacterMember(v8, CharacterAtIndex);
      if (v7) {
        CFRelease(v7);
      }
      if (!IsCharacterMember) {
        break;
      }
      v14.CFIndex location = result.length + result.location;
      v14.length = Length - (result.length + result.location);
      uint64_t v5 = CFStringFindWithOptions(theString, this[5], v14, 0, &result);
      if (!v5) {
        return v5;
      }
    }
    return 1;
  }
  return v5;
}

void sub_260329330(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t TLGurmukhiOrthographyChecker::isInvalidNuktaAfterConsonant(TLGurmukhiOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  CFStringRef v5 = (const __CFString *)*((void *)this + 1);
  CFStringRef v6 = theString;
  v7.CFIndex location = 0;
  v7.length = Length;
  while (1)
  {
    uint64_t v8 = CFStringFindWithOptions(v6, v5, v7, 0, &result);
    if (!v8) {
      break;
    }
    if (!result.location) {
      return 1;
    }
    v12.CFIndex location = result.location - 1;
    v12.length = 1;
    uint64_t v9 = (TLGurmukhiOrthographyChecker *)CFStringCreateWithSubstring(0, theString, v12);
    BOOL canNuktaFollowLetter = TLGurmukhiOrthographyChecker::canNuktaFollowLetter(v9, (const __CFString *)v9);
    if (v9) {
      CFRelease(v9);
    }
    if (!canNuktaFollowLetter) {
      return 1;
    }
    v7.CFIndex location = result.length + result.location;
    v7.length = Length - (result.length + result.location);
    CFStringRef v5 = (const __CFString *)*((void *)this + 1);
    CFStringRef v6 = theString;
  }
  return v8;
}

void sub_260329424(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGurmukhiOrthographyChecker::isInvalidGurmukhiLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  v5.length = CFStringGetLength(theString);
  v5.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, this[10], v5, 0, 0) != 0;
}

BOOL TLGurmukhiOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  if (TLGurmukhiOrthographyChecker::isInvalidConsecutiveDiacritics((TLGurmukhiOrthographyChecker *)this, a2)
    || TLGurmukhiOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((CFStringRef *)this, a2)
    || TLGurmukhiOrthographyChecker::isInvalidDiacriticAfterVowelLetter((TLGurmukhiOrthographyChecker *)this, a2)
    || (TLGurmukhiOrthographyChecker::isInvalidAddakFollowingConsonant((CFStringRef *)this, a2) & 1) != 0
    || (TLGurmukhiOrthographyChecker::isInvalidNuktaAfterConsonant((TLGurmukhiOrthographyChecker *)this, a2) & 1) != 0)
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.CFIndex location = 0;
  return CFStringFindCharacterFromSet(a2, this[10], v7, 0, 0) == 0;
}

void TLTeluguOrthographyChecker::TLTeluguOrthographyChecker(TLTeluguOrthographyChecker *this)
{
  *((_OWORD *)this + 4) = 0u;
  CFCharacterSetRef v2 = (const void **)((char *)this + 64);
  CFCharacterSetRef v3 = (const void **)((char *)this + 72);
  *((_OWORD *)this + 5) = 0u;
  CFCharacterSetRef v4 = (const void **)((char *)this + 80);
  *(void *)this = &unk_270C363E8;
  *((void *)this + 1) = @"‍";
  *((void *)this + 6) = @"఼";
  *((void *)this + 7) = @"్";
  *((void *)this + 4) = @"ం";
  *((void *)this + 5) = @"ః";
  *((void *)this + 2) = @"ఀ";
  *((void *)this + 3) = @"ఁ";
  uint64_t v22 = (const void **)((char *)this + 88);
  *((void *)this + 12) = 0;
  CFRange v5 = (const void **)((char *)this + 96);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFRange v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"అ");
    CFStringAppend(v7, @"ఆ");
    CFStringAppend(v7, @"ఇ");
    CFStringAppend(v7, @"ఈ");
    CFStringAppend(v7, @"ఉ");
    CFStringAppend(v7, @"ఊ");
    CFStringAppend(v7, @"ఋ");
    CFStringAppend(v7, @"ఌ");
    CFStringAppend(v7, @"ఎ");
    CFStringAppend(v7, @"ఏ");
    CFStringAppend(v7, @"ఐ");
    CFStringAppend(v7, @"ఒ");
    CFStringAppend(v7, @"ఓ");
    CFStringAppend(v7, @"ఔ");
  }
  CFCharacterSetRef v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  uint64_t v9 = CFStringCreateMutable(0, 0);
  CFStringRef v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, @"ా");
    CFStringAppend(v10, @"ి");
    CFStringAppend(v10, @"ీ");
    CFStringAppend(v10, @"ు");
    CFStringAppend(v10, @"ూ");
    CFStringAppend(v10, @"ృ");
    CFStringAppend(v10, @"ౄ");
    CFStringAppend(v10, @"ె");
    CFStringAppend(v10, @"ే");
    CFStringAppend(v10, @"ై");
    CFStringAppend(v10, @"ొ");
    CFStringAppend(v10, @"ో");
    CFStringAppend(v10, @"ౌ");
  }
  CFCharacterSetRef v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v11);
  CFRange v12 = CFStringCreateMutable(0, 0);
  CFRange v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 6));
    CFStringAppend(v13, *((CFStringRef *)this + 7));
    CFStringAppend(v13, *((CFStringRef *)this + 5));
    CFStringAppend(v13, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, v10);
  }
  CFCharacterSetRef v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v14);
  CFRange v15 = CFStringCreateMutable(0, 0);
  CFRange v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, @"క");
    CFStringAppend(v16, @"ఖ");
    CFStringAppend(v16, @"గ");
    CFStringAppend(v16, @"ఘ");
    CFStringAppend(v16, @"ఙ");
    CFStringAppend(v16, @"చ");
    CFStringAppend(v16, @"ఛ");
    CFStringAppend(v16, @"జ");
    CFStringAppend(v16, @"ఝ");
    CFStringAppend(v16, @"ఞ");
    CFStringAppend(v16, @"ట");
    CFStringAppend(v16, @"ఠ");
    CFStringAppend(v16, @"డ");
    CFStringAppend(v16, @"ఢ");
    CFStringAppend(v16, @"ణ");
    CFStringAppend(v16, @"త");
    CFStringAppend(v16, @"థ");
    CFStringAppend(v16, @"ద");
    CFStringAppend(v16, @"ధ");
    CFStringAppend(v16, @"న");
    CFStringAppend(v16, @"ప");
    CFStringAppend(v16, @"ఫ");
    CFStringAppend(v16, @"బ");
    CFStringAppend(v16, @"భ");
    CFStringAppend(v16, @"మ");
    CFStringAppend(v16, @"య");
    CFStringAppend(v16, @"ర");
    CFStringAppend(v16, @"ఱ");
    CFStringAppend(v16, @"ల");
    CFStringAppend(v16, @"ళ");
    CFStringAppend(v16, @"ఴ");
    CFStringAppend(v16, @"వ");
    CFStringAppend(v16, @"శ");
    CFStringAppend(v16, @"ష");
    CFStringAppend(v16, @"స");
    CFStringAppend(v16, @"హ");
    CFStringAppend(v16, @"ౝ");
  }
  CFCharacterSetRef v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  CFRange v18 = CFStringCreateMutable(0, 0);
  unint64_t v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  CFCharacterSetRef v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_260329BDC(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  CFRange v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  uint64_t v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFCharacterSetRef v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  CFRange v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  CFRange v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLTeluguOrthographyChecker::~TLTeluguOrthographyChecker(const void **this)
{
  *this = &unk_270C363E8;
  CFCharacterSetRef v2 = this + 8;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 12, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 11, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  uint64_t vars8;

  TLTeluguOrthographyChecker::~TLTeluguOrthographyChecker(this);
  JUMPOUT(0x26120D630);
}

BOOL TLTeluguOrthographyChecker::isVowelSign(TLTeluguOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v3 = (const __CFCharacterSet *)*((void *)this + 9);
  v5.length = CFStringGetLength(theString);
  v5.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, v3, v5, 0, 0) != 0;
}

BOOL TLTeluguOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  if (CFEqual(theString1, this[6])) {
    return 1;
  }
  CFCharacterSetRef v4 = (const __CFCharacterSet *)this[11];
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLTeluguOrthographyChecker::canViramaPrecedeLetter(TLTeluguOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v4 = (const __CFCharacterSet *)*((void *)this + 11);
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFEqual(theString, *((CFStringRef *)this + 1));
}

BOOL TLTeluguOrthographyChecker::isInvalidConsecutiveDiacritics(TLTeluguOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v18.CFIndex location = 0;
  v18.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v18, 0, &result))
  {
    CFIndex v5 = 0;
    char v6 = 1;
    v7.CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      CFIndex location = result.location;
      if (!result.location)
      {
        char v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location) {
        break;
      }
LABEL_25:
      CFIndex v5 = result.length;
      v22.CFIndex location = result.length + location;
      v22.length = Length - (result.length + location);
      int CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v22, 0, &result);
      v7.CFIndex location = location;
      if (!CharacterFromSet) {
        return (v6 & 1) == 0;
      }
    }
    v7.length = v5;
    CFStringRef v9 = CFStringCreateWithSubstring(0, theString, v7);
    CFStringRef v10 = CFStringCreateWithSubstring(0, theString, result);
    if (CFEqual(v9, *((CFStringRef *)this + 6))
      && CFStringCompare(v10, *((CFStringRef *)this + 6), 0))
    {
      goto LABEL_19;
    }
    if (CFEqual(v10, *((CFStringRef *)this + 4)))
    {
      CFCharacterSetRef v12 = (const __CFCharacterSet *)*((void *)this + 9);
      v19.length = CFStringGetLength(v9);
      v19.CFIndex location = 0;
      if (CFStringFindCharacterFromSet(v9, v12, v19, 0, 0)) {
        goto LABEL_19;
      }
    }
    if ((CFStringCompare(v10, *((CFStringRef *)this + 3), 0)
       || (CFCharacterSetRef v13 = (const __CFCharacterSet *)*((void *)this + 9),
           v20.length = CFStringGetLength(v9),
           v20.CFIndex location = 0,
           !CFStringFindCharacterFromSet(v9, v13, v20, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 5), 0)
       || (CFCharacterSetRef v14 = (const __CFCharacterSet *)*((void *)this + 9),
           v21.length = CFStringGetLength(v9),
           v21.CFIndex location = 0,
           !CFStringFindCharacterFromSet(v9, v14, v21, 0, 0))))
    {
      char v6 = 0;
      int v11 = 0;
      if (!v10) {
        goto LABEL_21;
      }
    }
    else
    {
LABEL_19:
      int v11 = 1;
      if (!v10)
      {
LABEL_21:
        if (v9) {
          CFRelease(v9);
        }
        if (!v11) {
          return (v6 & 1) == 0;
        }
        CFIndex location = result.location;
        goto LABEL_25;
      }
    }
    CFRelease(v10);
    goto LABEL_21;
  }
  char v6 = 1;
  return (v6 & 1) == 0;
}

void sub_26032A0E4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLTeluguOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v11.CFIndex location = 0;
  v11.length = Length;
  char v5 = 1;
  if (CFStringFindWithOptions(theString, this[7], v11, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        char v5 = 0;
        return (v5 & 1) == 0;
      }
      v12.CFIndex location = result.location - 1;
      v12.length = 1;
      CFStringRef v6 = CFStringCreateWithSubstring(0, theString, v12);
      CFStringRef v7 = 0;
      if (result.location + 1 < Length)
      {
        v13.length = 1;
        v13.CFIndex location = result.location + 1;
        CFStringRef v7 = CFStringCreateWithSubstring(0, theString, v13);
      }
      if (!TLTeluguOrthographyChecker::canViramaFollowLetter(this, v6)) {
        break;
      }
      if (v7)
      {
        BOOL canViramaPrecedeLetter = TLTeluguOrthographyChecker::canViramaPrecedeLetter((TLTeluguOrthographyChecker *)this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      BOOL canViramaPrecedeLetter = 1;
      if (v6) {
        goto LABEL_11;
      }
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v14.CFIndex location = result.length + result.location;
        v14.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, this[7], v14, 0, &result)) {
          continue;
        }
      }
      return (v5 & 1) == 0;
    }
    BOOL canViramaPrecedeLetter = 0;
    char v5 = 0;
    if (v7) {
LABEL_9:
    }
      CFRelease(v7);
    if (!v6) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_26032A27C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

BOOL TLTeluguOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFCharacterSetRef v5 = CFCharacterSetCreateWithCharactersInString(0, @"ఁం");
  v6.CFIndex location = 0;
  CFCharacterSetRef v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    int CharacterFromSet = CFStringFindCharacterFromSet(theString, this[8], v6, 0, &result);
    if (!CharacterFromSet) {
      break;
    }
    if (result.location + 1 < Length)
    {
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[10], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex)) {
          break;
        }
      }
    }
    v6.CFIndex location = result.length + result.location;
  }
  if (v5) {
    CFRelease(v5);
  }
  return CharacterFromSet != 0;
}

void sub_26032A384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLTeluguOrthographyChecker::isInvalidTeluguLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  v5.length = CFStringGetLength(theString);
  v5.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, this[12], v5, 0, 0) != 0;
}

BOOL TLTeluguOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  if (TLTeluguOrthographyChecker::isInvalidConsecutiveDiacritics((TLTeluguOrthographyChecker *)this, a2)
    || TLTeluguOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((CFStringRef *)this, a2)
    || TLTeluguOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.CFIndex location = 0;
  return CFStringFindCharacterFromSet(a2, this[12], v7, 0, 0) == 0;
}

void TLGujaratiOrthographyChecker::TLGujaratiOrthographyChecker(TLGujaratiOrthographyChecker *this)
{
  *(_OWORD *)((char *)this + 56) = 0u;
  CFCharacterSetRef v2 = (const void **)((char *)this + 56);
  *(_OWORD *)((char *)this + 72) = 0u;
  CFCharacterSetRef v3 = (const void **)((char *)this + 72);
  *(void *)this = &unk_270C36428;
  *((void *)this + 1) = @"‍";
  *((void *)this + 2) = @"઼";
  *((void *)this + 3) = @"્";
  *((void *)this + 4) = @"ઃ";
  *((void *)this + 5) = @"ં";
  CFCharacterSetRef v4 = (const void **)((char *)this + 64);
  *((void *)this + 6) = @"ઁ";
  CFRange v5 = (const void **)((char *)this + 80);
  *((void *)this + 11) = 0;
  CFRange v6 = (const void **)((char *)this + 88);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFCharacterSetRef v8 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"ા");
    CFStringAppend(v8, @"િ");
    CFStringAppend(v8, @"ી");
    CFStringAppend(v8, @"ુ");
    CFStringAppend(v8, @"ૂ");
    CFStringAppend(v8, @"ૃ");
    CFStringAppend(v8, @"ૄ");
    CFStringAppend(v8, @"ૅ");
    CFStringAppend(v8, @"ે");
    CFStringAppend(v8, @"ૈ");
    CFStringAppend(v8, @"ૉ");
    CFStringAppend(v8, @"ો");
    CFStringAppend(v8, @"ૌ");
  }
  CFCharacterSetRef v9 = CFCharacterSetCreateWithCharactersInString(0, v8);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v9);
  CFStringRef v10 = CFStringCreateMutable(0, 0);
  CFCharacterSetRef v11 = v10;
  if (v10)
  {
    CFStringAppend(v10, *((CFStringRef *)this + 2));
    CFStringAppend(v11, *((CFStringRef *)this + 3));
    CFStringAppend(v11, *((CFStringRef *)this + 4));
    CFStringAppend(v11, *((CFStringRef *)this + 5));
    CFStringAppend(v11, *((CFStringRef *)this + 6));
    CFStringAppend(v11, v8);
  }
  CFCharacterSetRef v12 = CFCharacterSetCreateWithCharactersInString(0, v11);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v12);
  CFRange v13 = CFStringCreateMutable(0, 0);
  CFRange v14 = v13;
  if (v13)
  {
    CFStringAppend(v13, @"ક");
    CFStringAppend(v14, @"ખ");
    CFStringAppend(v14, @"ગ");
    CFStringAppend(v14, @"ઘ");
    CFStringAppend(v14, @"ઙ");
    CFStringAppend(v14, @"ચ");
    CFStringAppend(v14, @"છ");
    CFStringAppend(v14, @"જ");
    CFStringAppend(v14, @"ઝ");
    CFStringAppend(v14, @"ઞ");
    CFStringAppend(v14, @"ટ");
    CFStringAppend(v14, @"ઠ");
    CFStringAppend(v14, @"ડ");
    CFStringAppend(v14, @"ઢ");
    CFStringAppend(v14, @"ણ");
    CFStringAppend(v14, @"ત");
    CFStringAppend(v14, @"થ");
    CFStringAppend(v14, @"દ");
    CFStringAppend(v14, @"ધ");
    CFStringAppend(v14, @"ન");
    CFStringAppend(v14, @"પ");
    CFStringAppend(v14, @"ફ");
    CFStringAppend(v14, @"બ");
    CFStringAppend(v14, @"ભ");
    CFStringAppend(v14, @"મ");
    CFStringAppend(v14, @"ય");
    CFStringAppend(v14, @"ર");
    CFStringAppend(v14, @"લ");
    CFStringAppend(v14, @"ળ");
    CFStringAppend(v14, @"વ");
    CFStringAppend(v14, @"શ");
    CFStringAppend(v14, @"ષ");
    CFStringAppend(v14, @"સ");
    CFStringAppend(v14, @"હ");
    CFStringAppend(v14, @"ૐ");
  }
  CFCharacterSetRef v15 = CFCharacterSetCreateWithCharactersInString(0, v14);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, v15);
  CFRange v16 = CFStringCreateMutable(0, 0);
  CFCharacterSetRef v17 = v16;
  if (v16)
  {
    CFStringAppend(v16, @"અ");
    CFStringAppend(v17, @"આ");
    CFStringAppend(v17, @"ઇ");
    CFStringAppend(v17, @"ઈ");
    CFStringAppend(v17, @"ઉ");
    CFStringAppend(v17, @"ઊ");
    CFStringAppend(v17, @"ઋ");
    CFStringAppend(v17, @"ઌ");
    CFStringAppend(v17, @"ઍ");
    CFStringAppend(v17, @"એ");
    CFStringAppend(v17, @"ઐ");
    CFStringAppend(v17, @"ઑ");
    CFStringAppend(v17, @"ઓ");
    CFStringAppend(v17, @"ઔ");
  }
  CFCharacterSetRef v18 = CFCharacterSetCreateWithCharactersInString(0, v17);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v18);
  CFRange v19 = CFStringCreateMutable(0, 0);
  CFRange v20 = v19;
  if (v19)
  {
    CFStringAppend(v19, v11);
    CFStringAppend(v20, v17);
    CFStringAppend(v20, v14);
  }
  CFCharacterSetRef v21 = CFCharacterSetCreateWithCharactersInString(0, v20);
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v21);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v6, InvertedSet);
  if (v21) {
    CFRelease(v21);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (v17) {
    CFRelease(v17);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v8) {
    CFRelease(v8);
  }
}

void sub_26032AAEC(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  CFRange v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFCharacterSetRef v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFCharacterSetRef v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  CFRange v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  CFCharacterSetRef v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLGujaratiOrthographyChecker::~TLGujaratiOrthographyChecker(const void **this)
{
  *this = &unk_270C36428;
  CFCharacterSetRef v2 = this + 7;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 11, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 8, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  uint64_t vars8;

  TLGujaratiOrthographyChecker::~TLGujaratiOrthographyChecker(this);
  JUMPOUT(0x26120D630);
}

BOOL TLGujaratiOrthographyChecker::isVowelSign(TLGujaratiOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v3 = (const __CFCharacterSet *)*((void *)this + 8);
  v5.length = CFStringGetLength(theString);
  v5.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, v3, v5, 0, 0) != 0;
}

BOOL TLGujaratiOrthographyChecker::canViramaFollowLetter(CFStringRef *this, CFStringRef theString1)
{
  if (CFEqual(theString1, this[2])) {
    return 1;
  }
  CFCharacterSetRef v4 = (const __CFCharacterSet *)this[10];
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString1, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex) != 0;
}

BOOL TLGujaratiOrthographyChecker::canViramaPrecedeLetter(TLGujaratiOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v4 = (const __CFCharacterSet *)*((void *)this + 10);
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFEqual(theString, *((CFStringRef *)this + 1));
}

BOOL TLGujaratiOrthographyChecker::isInvalidConsecutiveDiacritics(TLGujaratiOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v18.CFIndex location = 0;
  v18.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 9), v18, 0, &result))
  {
    CFIndex v5 = 0;
    char v6 = 1;
    v7.CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      CFIndex location = result.location;
      if (!result.location)
      {
        char v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location) {
        break;
      }
LABEL_25:
      CFIndex v5 = result.length;
      v22.CFIndex location = result.length + location;
      v22.length = Length - (result.length + location);
      int CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 9), v22, 0, &result);
      v7.CFIndex location = location;
      if (!CharacterFromSet) {
        return (v6 & 1) == 0;
      }
    }
    v7.length = v5;
    CFStringRef v9 = CFStringCreateWithSubstring(0, theString, v7);
    CFStringRef v10 = CFStringCreateWithSubstring(0, theString, result);
    if (CFEqual(v9, *((CFStringRef *)this + 2))
      && CFStringCompare(v10, *((CFStringRef *)this + 2), 0))
    {
      goto LABEL_19;
    }
    if (CFEqual(v10, *((CFStringRef *)this + 5)))
    {
      CFCharacterSetRef v12 = (const __CFCharacterSet *)*((void *)this + 8);
      v19.length = CFStringGetLength(v9);
      v19.CFIndex location = 0;
      if (CFStringFindCharacterFromSet(v9, v12, v19, 0, 0)) {
        goto LABEL_19;
      }
    }
    if ((CFStringCompare(v10, *((CFStringRef *)this + 6), 0)
       || (CFCharacterSetRef v13 = (const __CFCharacterSet *)*((void *)this + 8),
           v20.length = CFStringGetLength(v9),
           v20.CFIndex location = 0,
           !CFStringFindCharacterFromSet(v9, v13, v20, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 4), 0)
       || (CFCharacterSetRef v14 = (const __CFCharacterSet *)*((void *)this + 8),
           v21.length = CFStringGetLength(v9),
           v21.CFIndex location = 0,
           !CFStringFindCharacterFromSet(v9, v14, v21, 0, 0))))
    {
      char v6 = 0;
      int v11 = 0;
      if (!v10) {
        goto LABEL_21;
      }
    }
    else
    {
LABEL_19:
      int v11 = 1;
      if (!v10)
      {
LABEL_21:
        if (v9) {
          CFRelease(v9);
        }
        if (!v11) {
          return (v6 & 1) == 0;
        }
        CFIndex location = result.location;
        goto LABEL_25;
      }
    }
    CFRelease(v10);
    goto LABEL_21;
  }
  char v6 = 1;
  return (v6 & 1) == 0;
}

void sub_26032AFF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGujaratiOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v11.CFIndex location = 0;
  v11.length = Length;
  char v5 = 1;
  if (CFStringFindWithOptions(theString, this[3], v11, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        char v5 = 0;
        return (v5 & 1) == 0;
      }
      v12.CFIndex location = result.location - 1;
      v12.length = 1;
      CFStringRef v6 = CFStringCreateWithSubstring(0, theString, v12);
      CFStringRef v7 = 0;
      if (result.location + 1 < Length)
      {
        v13.length = 1;
        v13.CFIndex location = result.location + 1;
        CFStringRef v7 = CFStringCreateWithSubstring(0, theString, v13);
      }
      if (!TLGujaratiOrthographyChecker::canViramaFollowLetter(this, v6)) {
        break;
      }
      if (v7)
      {
        BOOL canViramaPrecedeLetter = TLGujaratiOrthographyChecker::canViramaPrecedeLetter((TLGujaratiOrthographyChecker *)this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      BOOL canViramaPrecedeLetter = 1;
      if (v6) {
        goto LABEL_11;
      }
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v14.CFIndex location = result.length + result.location;
        v14.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, this[3], v14, 0, &result)) {
          continue;
        }
      }
      return (v5 & 1) == 0;
    }
    BOOL canViramaPrecedeLetter = 0;
    char v5 = 0;
    if (v7) {
LABEL_9:
    }
      CFRelease(v7);
    if (!v6) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_26032B18C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

BOOL TLGujaratiOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFCharacterSetRef v5 = CFCharacterSetCreateWithCharactersInString(0, @"ઁં");
  v6.CFIndex location = 0;
  CFCharacterSetRef v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    int CharacterFromSet = CFStringFindCharacterFromSet(theString, this[7], v6, 0, &result);
    if (!CharacterFromSet) {
      break;
    }
    if (result.location + 1 < Length)
    {
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[9], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex)) {
          break;
        }
      }
    }
    v6.CFIndex location = result.length + result.location;
  }
  if (v5) {
    CFRelease(v5);
  }
  return CharacterFromSet != 0;
}

void sub_26032B294(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLGujaratiOrthographyChecker::isInvalidGujaratiLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  v5.length = CFStringGetLength(theString);
  v5.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, this[11], v5, 0, 0) != 0;
}

BOOL TLGujaratiOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  if (TLGujaratiOrthographyChecker::isInvalidConsecutiveDiacritics((TLGujaratiOrthographyChecker *)this, a2)
    || TLGujaratiOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((CFStringRef *)this, a2)
    || TLGujaratiOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.CFIndex location = 0;
  return CFStringFindCharacterFromSet(a2, this[11], v7, 0, 0) == 0;
}

void TLUrduOrthographyChecker::TLUrduOrthographyChecker(TLUrduOrthographyChecker *this)
{
  *(void *)this = &unk_270C36468;
  *((void *)this + 1) = 0;
  uint64_t v1 = (const void **)((char *)this + 8);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFCharacterSetRef v3 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"ء");
    CFStringAppend(v3, @"آ");
    CFStringAppend(v3, @"ؤ");
    CFStringAppend(v3, @"ئ");
    CFStringAppend(v3, @"ا");
    CFStringAppend(v3, @"ب");
    CFStringAppend(v3, @"ت");
    CFStringAppend(v3, @"ث");
    CFStringAppend(v3, @"ج");
    CFStringAppend(v3, @"ح");
    CFStringAppend(v3, @"خ");
    CFStringAppend(v3, @"د");
    CFStringAppend(v3, @"ذ");
    CFStringAppend(v3, @"ر");
    CFStringAppend(v3, @"ز");
    CFStringAppend(v3, @"س");
    CFStringAppend(v3, @"ش");
    CFStringAppend(v3, @"ص");
    CFStringAppend(v3, @"ض");
    CFStringAppend(v3, @"ط");
    CFStringAppend(v3, @"ظ");
    CFStringAppend(v3, @"ع");
    CFStringAppend(v3, @"غ");
    CFStringAppend(v3, @"ـ");
    CFStringAppend(v3, @"ف");
    CFStringAppend(v3, @"ق");
    CFStringAppend(v3, @"ل");
    CFStringAppend(v3, @"م");
    CFStringAppend(v3, @"ن");
    CFStringAppend(v3, @"و");
    CFStringAppend(v3, @"ً");
    CFStringAppend(v3, @"ٌ");
    CFStringAppend(v3, @"ٍ");
    CFStringAppend(v3, @"َ");
    CFStringAppend(v3, @"ُ");
    CFStringAppend(v3, @"ِ");
    CFStringAppend(v3, @"ّ");
    CFStringAppend(v3, @"ْ");
    CFStringAppend(v3, @"ٖ");
    CFStringAppend(v3, @"ٗ");
    CFStringAppend(v3, @"٘");
    CFStringAppend(v3, @"ٰ");
    CFStringAppend(v3, @"ٹ");
    CFStringAppend(v3, @"پ");
    CFStringAppend(v3, @"چ");
    CFStringAppend(v3, @"ڈ");
    CFStringAppend(v3, @"ڑ");
    CFStringAppend(v3, @"ژ");
    CFStringAppend(v3, @"ک");
    CFStringAppend(v3, @"گ");
    CFStringAppend(v3, @"ں");
    CFStringAppend(v3, @"ھ");
    CFStringAppend(v3, @"ہ");
    CFStringAppend(v3, @"ۂ");
    CFStringAppend(v3, @"ۃ");
    CFStringAppend(v3, @"ی");
    CFStringAppend(v3, @"ے");
    CFStringAppend(v3, @"ۓ");
    CFStringAppend(v3, @"ࣿ");
  }
  CFCharacterSetRef v4 = CFCharacterSetCreateWithCharactersInString(0, v3);
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v1, InvertedSet);
  if (v4) {
    CFRelease(v4);
  }
  if (v3) {
    CFRelease(v3);
  }
}

void sub_26032B7EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(&a9, 0);
  nlp::CFScopedPtr<__CFString *>::reset(&a10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v10, 0);
  _Unwind_Resume(a1);
}

void TLUrduOrthographyChecker::~TLUrduOrthographyChecker(const void **this)
{
  *this = &unk_270C36468;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 1, 0);
}

{
  *this = &unk_270C36468;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 1, 0);
}

{
  uint64_t vars8;

  *this = &unk_270C36468;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 1, 0);
  JUMPOUT(0x26120D630);
}

BOOL TLUrduOrthographyChecker::allValidUrduLetters(CFCharacterSetRef *this, CFStringRef theString)
{
  v5.length = CFStringGetLength(theString);
  v5.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, this[1], v5, 0, 0) == 0;
}

BOOL TLUrduOrthographyChecker::checkSpelling(CFCharacterSetRef *this, CFStringRef theString, const __CFString **a3, const __CFString **a4)
{
  v7.length = CFStringGetLength(theString);
  v7.CFIndex location = 0;
  return CFStringFindCharacterFromSet(theString, this[1], v7, 0, 0) == 0;
}

const char *_nlpLoggingSubsystem()
{
  return "com.apple.Transliteration";
}

uint64_t _nlpDefaultLog()
{
  if (_nlpDefaultLog::token != -1) {
    dispatch_once(&_nlpDefaultLog::token, &__block_literal_global);
  }
  return _nlpDefaultLog::log;
}

os_log_t ___nlpDefaultLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Transliteration", "TransliterationDefaultLog");
  _nlpDefaultLog::log = (uint64_t)result;
  return result;
}

uint64_t _nlpSignpostLog()
{
  if (_nlpSignpostLog::token != -1) {
    dispatch_once(&_nlpSignpostLog::token, &__block_literal_global_3);
  }
  return _nlpSignpostLog::log;
}

os_log_t ___nlpSignpostLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.Transliteration", "TransliterationSignposts");
  _nlpSignpostLog::log = (uint64_t)result;
  return result;
}

void TLMalayalamOrthographyChecker::TLMalayalamOrthographyChecker(TLMalayalamOrthographyChecker *this)
{
  *((_OWORD *)this + 3) = 0u;
  CFCharacterSetRef v2 = (const void **)((char *)this + 48);
  CFCharacterSetRef v3 = (const void **)((char *)this + 56);
  *((_OWORD *)this + 4) = 0u;
  CFCharacterSetRef v4 = (const void **)((char *)this + 64);
  *(void *)this = &unk_270C364E8;
  *((void *)this + 1) = @"‍";
  *((void *)this + 4) = @"ഃ";
  *((void *)this + 5) = @"്";
  *((void *)this + 2) = @"ഁ";
  *((void *)this + 3) = @"ം";
  CFRange v22 = (const void **)((char *)this + 72);
  *((void *)this + 1nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
  CFRange v5 = (const void **)((char *)this + 80);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFRange v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"അ");
    CFStringAppend(v7, @"ആ");
    CFStringAppend(v7, @"ഇ");
    CFStringAppend(v7, @"ഈ");
    CFStringAppend(v7, @"ഉ");
    CFStringAppend(v7, @"ഊ");
    CFStringAppend(v7, @"ഋ");
    CFStringAppend(v7, @"ഌ");
    CFStringAppend(v7, @"എ");
    CFStringAppend(v7, @"ഏ");
    CFStringAppend(v7, @"ഐ");
    CFStringAppend(v7, @"ഒ");
    CFStringAppend(v7, @"ഓ");
    CFStringAppend(v7, @"ഔ");
  }
  CFCharacterSetRef v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  CFStringRef v9 = CFStringCreateMutable(0, 0);
  CFStringRef v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, @"ാ");
    CFStringAppend(v10, @"ി");
    CFStringAppend(v10, @"ീ");
    CFStringAppend(v10, @"ു");
    CFStringAppend(v10, @"ൂ");
    CFStringAppend(v10, @"ൃ");
    CFStringAppend(v10, @"ൄ");
    CFStringAppend(v10, @"െ");
    CFStringAppend(v10, @"േ");
    CFStringAppend(v10, @"ൈ");
    CFStringAppend(v10, @"ൊ");
    CFStringAppend(v10, @"ോ");
    CFStringAppend(v10, @"ൌ");
    CFStringAppend(v10, @"ൗ");
  }
  CFCharacterSetRef v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v11);
  CFRange v12 = CFStringCreateMutable(0, 0);
  CFRange v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 5));
    CFStringAppend(v13, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, v10);
  }
  CFCharacterSetRef v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v14);
  CFCharacterSetRef v15 = CFStringCreateMutable(0, 0);
  CFRange v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, @"ക");
    CFStringAppend(v16, @"ഖ");
    CFStringAppend(v16, @"ഗ");
    CFStringAppend(v16, @"ഘ");
    CFStringAppend(v16, @"ങ");
    CFStringAppend(v16, @"ച");
    CFStringAppend(v16, @"ഛ");
    CFStringAppend(v16, @"ജ");
    CFStringAppend(v16, @"ഝ");
    CFStringAppend(v16, @"ഞ");
    CFStringAppend(v16, @"ട");
    CFStringAppend(v16, @"ഠ");
    CFStringAppend(v16, @"ഡ");
    CFStringAppend(v16, @"ഢ");
    CFStringAppend(v16, @"ണ");
    CFStringAppend(v16, @"ത");
    CFStringAppend(v16, @"ഥ");
    CFStringAppend(v16, @"ദ");
    CFStringAppend(v16, @"ധ");
    CFStringAppend(v16, @"ന");
    CFStringAppend(v16, @"ഩ");
    CFStringAppend(v16, @"പ");
    CFStringAppend(v16, @"ഫ");
    CFStringAppend(v16, @"ബ");
    CFStringAppend(v16, @"ഭ");
    CFStringAppend(v16, @"മ");
    CFStringAppend(v16, @"യ");
    CFStringAppend(v16, @"ര");
    CFStringAppend(v16, @"റ");
    CFStringAppend(v16, @"ല");
    CFStringAppend(v16, @"ള");
    CFStringAppend(v16, @"ഴ");
    CFStringAppend(v16, @"വ");
    CFStringAppend(v16, @"ശ");
    CFStringAppend(v16, @"ഷ");
    CFStringAppend(v16, @"സ");
    CFStringAppend(v16, @"ഹ");
    CFStringAppend(v16, @"ഺ");
    CFStringAppend(v16, @"ൺ");
    CFStringAppend(v16, @"ൻ");
    CFStringAppend(v16, @"ർ");
    CFStringAppend(v16, @"ൽ");
    CFStringAppend(v16, @"ൾ");
    CFStringAppend(v16, @"ൿ");
  }
  CFCharacterSetRef v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  CFRange v18 = CFStringCreateMutable(0, 0);
  CFRange v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  CFCharacterSetRef v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_26032C1C4(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  CFRange v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFStringRef v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFCharacterSetRef v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  CFRange v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  CFCharacterSetRef v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLMalayalamOrthographyChecker::~TLMalayalamOrthographyChecker(const void **this)
{
  *this = &unk_270C364E8;
  CFCharacterSetRef v2 = this + 6;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 8, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 7, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  uint64_t vars8;

  TLMalayalamOrthographyChecker::~TLMalayalamOrthographyChecker(this);
  JUMPOUT(0x26120D630);
}

BOOL TLMalayalamOrthographyChecker::canViramaPrecedeLetter(TLMalayalamOrthographyChecker *this, CFStringRef theString)
{
  CFCharacterSetRef v4 = (const __CFCharacterSet *)*((void *)this + 9);
  UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, 0);
  return CFCharacterSetIsCharacterMember(v4, CharacterAtIndex)
      || CFEqual(theString, *((CFStringRef *)this + 1));
}

BOOL TLMalayalamOrthographyChecker::isInvalidConsecutiveDiacritics(TLMalayalamOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v18.CFIndex location = 0;
  v18.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 8), v18, 0, &result))
  {
    CFIndex v5 = 0;
    char v6 = 1;
    v7.CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      CFIndex location = result.location;
      if (!result.location)
      {
        char v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location) {
        break;
      }
LABEL_22:
      CFIndex v5 = result.length;
      v22.CFIndex location = result.length + location;
      v22.length = Length - (result.length + location);
      int CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 8), v22, 0, &result);
      v7.CFIndex location = location;
      if (!CharacterFromSet) {
        return (v6 & 1) == 0;
      }
    }
    v7.length = v5;
    CFStringRef v9 = CFStringCreateWithSubstring(0, theString, v7);
    CFStringRef v10 = CFStringCreateWithSubstring(0, theString, result);
    if (CFEqual(v10, *((CFStringRef *)this + 3)))
    {
      CFCharacterSetRef v12 = (const __CFCharacterSet *)*((void *)this + 7);
      v19.length = CFStringGetLength(v9);
      v19.CFIndex location = 0;
      if (CFStringFindCharacterFromSet(v9, v12, v19, 0, 0)) {
        goto LABEL_16;
      }
    }
    if ((CFStringCompare(v10, *((CFStringRef *)this + 2), 0)
       || (CFCharacterSetRef v13 = (const __CFCharacterSet *)*((void *)this + 7),
           v20.length = CFStringGetLength(v9),
           v20.CFIndex location = 0,
           !CFStringFindCharacterFromSet(v9, v13, v20, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 4), 0)
       || (CFCharacterSetRef v14 = (const __CFCharacterSet *)*((void *)this + 7),
           v21.length = CFStringGetLength(v9),
           v21.CFIndex location = 0,
           !CFStringFindCharacterFromSet(v9, v14, v21, 0, 0))))
    {
      char v6 = 0;
      int v11 = 0;
      if (!v10) {
        goto LABEL_18;
      }
    }
    else
    {
LABEL_16:
      int v11 = 1;
      if (!v10)
      {
LABEL_18:
        if (v9) {
          CFRelease(v9);
        }
        if (!v11) {
          return (v6 & 1) == 0;
        }
        CFIndex location = result.location;
        goto LABEL_22;
      }
    }
    CFRelease(v10);
    goto LABEL_18;
  }
  char v6 = 1;
  return (v6 & 1) == 0;
}

void sub_26032C5E8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLMalayalamOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(TLMalayalamOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v13.CFIndex location = 0;
  v13.length = Length;
  char v5 = 1;
  if (CFStringFindWithOptions(theString, *((CFStringRef *)this + 5), v13, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        char v5 = 0;
        return (v5 & 1) == 0;
      }
      v14.CFIndex location = result.location - 1;
      v14.length = 1;
      CFStringRef v6 = CFStringCreateWithSubstring(0, theString, v14);
      CFStringRef v7 = 0;
      if (result.location + 1 < Length)
      {
        v15.length = 1;
        v15.CFIndex location = result.location + 1;
        CFStringRef v7 = CFStringCreateWithSubstring(0, theString, v15);
      }
      CFCharacterSetRef v8 = (const __CFCharacterSet *)*((void *)this + 9);
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(v6, 0);
      if (!CFCharacterSetIsCharacterMember(v8, CharacterAtIndex)) {
        break;
      }
      if (v7)
      {
        BOOL canViramaPrecedeLetter = TLMalayalamOrthographyChecker::canViramaPrecedeLetter(this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      BOOL canViramaPrecedeLetter = 1;
      if (v6) {
        goto LABEL_11;
      }
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v16.CFIndex location = result.length + result.location;
        v16.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, *((CFStringRef *)this + 5), v16, 0, &result)) {
          continue;
        }
      }
      return (v5 & 1) == 0;
    }
    BOOL canViramaPrecedeLetter = 0;
    char v5 = 0;
    if (v7) {
LABEL_9:
    }
      CFRelease(v7);
    if (!v6) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_26032C790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

BOOL TLMalayalamOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFCharacterSetRef v5 = CFCharacterSetCreateWithCharactersInString(0, @"ഁം");
  v6.CFIndex location = 0;
  CFCharacterSetRef v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    int CharacterFromSet = CFStringFindCharacterFromSet(theString, this[6], v6, 0, &result);
    if (!CharacterFromSet) {
      break;
    }
    if (result.location + 1 < Length)
    {
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[8], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex)) {
          break;
        }
      }
    }
    v6.CFIndex location = result.length + result.location;
  }
  if (v5) {
    CFRelease(v5);
  }
  return CharacterFromSet != 0;
}

void sub_26032C898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLMalayalamOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  if (TLMalayalamOrthographyChecker::isInvalidConsecutiveDiacritics((TLMalayalamOrthographyChecker *)this, a2)
    || TLMalayalamOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((TLMalayalamOrthographyChecker *)this, a2)|| TLMalayalamOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.CFIndex location = 0;
  return CFStringFindCharacterFromSet(a2, this[10], v7, 0, 0) == 0;
}

void TLKannadaOrthographyChecker::TLKannadaOrthographyChecker(TLKannadaOrthographyChecker *this)
{
  *((_OWORD *)this + 4) = 0u;
  CFCharacterSetRef v2 = (const void **)((char *)this + 64);
  CFCharacterSetRef v3 = (const void **)((char *)this + 72);
  *((_OWORD *)this + 5) = 0u;
  CFCharacterSetRef v4 = (const void **)((char *)this + 80);
  *(void *)this = &unk_270C36528;
  *((void *)this + 1) = @"‍";
  *((void *)this + 6) = @"಼";
  *((void *)this + 7) = @"್";
  *((void *)this + 4) = @"ಂ";
  *((void *)this + 5) = @"ಃ";
  *((void *)this + 2) = @"ಀ";
  *((void *)this + 3) = @"ಁ";
  CFRange v22 = (const void **)((char *)this + 88);
  *((void *)this + 12) = 0;
  CFCharacterSetRef v5 = (const void **)((char *)this + 96);
  CFMutableStringRef Mutable = CFStringCreateMutable(0, 0);
  CFRange v7 = Mutable;
  if (Mutable)
  {
    CFStringAppend(Mutable, @"ಅ");
    CFStringAppend(v7, @"ಆ");
    CFStringAppend(v7, @"ಇ");
    CFStringAppend(v7, @"ಈ");
    CFStringAppend(v7, @"ಉ");
    CFStringAppend(v7, @"ಊ");
    CFStringAppend(v7, @"ಋ");
    CFStringAppend(v7, @"ಌ");
    CFStringAppend(v7, @"ಎ");
    CFStringAppend(v7, @"ಏ");
    CFStringAppend(v7, @"ಐ");
    CFStringAppend(v7, @"ಒ");
    CFStringAppend(v7, @"ಓ");
    CFStringAppend(v7, @"ಔ");
  }
  CFCharacterSetRef v8 = CFCharacterSetCreateWithCharactersInString(0, v7);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, v8);
  CFStringRef v9 = CFStringCreateMutable(0, 0);
  CFStringRef v10 = v9;
  if (v9)
  {
    CFStringAppend(v9, @"ಾ");
    CFStringAppend(v10, @"ಿ");
    CFStringAppend(v10, @"ೀ");
    CFStringAppend(v10, @"ು");
    CFStringAppend(v10, @"ೂ");
    CFStringAppend(v10, @"ೃ");
    CFStringAppend(v10, @"ೄ");
    CFStringAppend(v10, @"ೆ");
    CFStringAppend(v10, @"ೇ");
    CFStringAppend(v10, @"ೈ");
    CFStringAppend(v10, @"ೊ");
    CFStringAppend(v10, @"ೋ");
    CFStringAppend(v10, @"ೌ");
  }
  CFCharacterSetRef v11 = CFCharacterSetCreateWithCharactersInString(0, v10);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, v11);
  CFCharacterSetRef v12 = CFStringCreateMutable(0, 0);
  CFRange v13 = v12;
  if (v12)
  {
    CFStringAppend(v12, *((CFStringRef *)this + 6));
    CFStringAppend(v13, *((CFStringRef *)this + 7));
    CFStringAppend(v13, *((CFStringRef *)this + 5));
    CFStringAppend(v13, *((CFStringRef *)this + 4));
    CFStringAppend(v13, *((CFStringRef *)this + 3));
    CFStringAppend(v13, *((CFStringRef *)this + 2));
    CFStringAppend(v13, v10);
  }
  CFCharacterSetRef v14 = CFCharacterSetCreateWithCharactersInString(0, v13);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, v14);
  CFRange v15 = CFStringCreateMutable(0, 0);
  CFRange v16 = v15;
  if (v15)
  {
    CFStringAppend(v15, @"ಕ");
    CFStringAppend(v16, @"ಖ");
    CFStringAppend(v16, @"ಗ");
    CFStringAppend(v16, @"ಘ");
    CFStringAppend(v16, @"ಙ");
    CFStringAppend(v16, @"ಚ");
    CFStringAppend(v16, @"ಛ");
    CFStringAppend(v16, @"ಜ");
    CFStringAppend(v16, @"ಝ");
    CFStringAppend(v16, @"ಞ");
    CFStringAppend(v16, @"ಟ");
    CFStringAppend(v16, @"ಠ");
    CFStringAppend(v16, @"ಡ");
    CFStringAppend(v16, @"ಢ");
    CFStringAppend(v16, @"ಣ");
    CFStringAppend(v16, @"ತ");
    CFStringAppend(v16, @"ಥ");
    CFStringAppend(v16, @"ದ");
    CFStringAppend(v16, @"ಧ");
    CFStringAppend(v16, @"ನ");
    CFStringAppend(v16, @"ಪ");
    CFStringAppend(v16, @"ಫ");
    CFStringAppend(v16, @"ಬ");
    CFStringAppend(v16, @"ಭ");
    CFStringAppend(v16, @"ಮ");
    CFStringAppend(v16, @"ಯ");
    CFStringAppend(v16, @"ರ");
    CFStringAppend(v16, @"ಱ");
    CFStringAppend(v16, @"ಲ");
    CFStringAppend(v16, @"ಳ");
    CFStringAppend(v16, @"ವ");
    CFStringAppend(v16, @"ಶ");
    CFStringAppend(v16, @"ಷ");
    CFStringAppend(v16, @"ಸ");
    CFStringAppend(v16, @"ಹ");
    CFStringAppend(v16, @"ೝ");
  }
  CFCharacterSetRef v17 = CFCharacterSetCreateWithCharactersInString(0, v16);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v22, v17);
  CFRange v18 = CFStringCreateMutable(0, 0);
  CFRange v19 = v18;
  if (v18)
  {
    CFStringAppend(v18, v13);
    CFStringAppend(v19, v7);
    CFStringAppend(v19, v16);
  }
  CFCharacterSetRef v20 = CFCharacterSetCreateWithCharactersInString(0, v19);
  CFCharacterSetRef InvertedSet = CFCharacterSetCreateInvertedSet(0, v20);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, InvertedSet);
  if (v20) {
    CFRelease(v20);
  }
  if (v19) {
    CFRelease(v19);
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v13) {
    CFRelease(v13);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v7) {
    CFRelease(v7);
  }
}

void sub_26032CFD4(_Unwind_Exception *a1, const void **a2, const void **a3, ...)
{
  va_start(va5, a3);
  va_start(va4, a3);
  va_start(va3, a3);
  va_start(va2, a3);
  va_start(va1, a3);
  va_start(va, a3);
  CFRange v7 = va_arg(va1, const void *);
  va_copy(va2, va1);
  CFStringRef v9 = va_arg(va2, const void *);
  va_copy(va3, va2);
  CFCharacterSetRef v11 = va_arg(va3, const void *);
  va_copy(va4, va3);
  CFRange v13 = va_arg(va4, const void *);
  va_copy(va5, va4);
  CFRange v15 = va_arg(va5, const void *);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va1, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va2, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va3, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va4, 0);
  nlp::CFScopedPtr<__CFString *>::reset((const void **)va5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v5, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a3, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v4, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(a2, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v3, 0);
  _Unwind_Resume(a1);
}

void TLKannadaOrthographyChecker::~TLKannadaOrthographyChecker(const void **this)
{
  *this = &unk_270C36528;
  CFCharacterSetRef v2 = this + 8;
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 12, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 11, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 10, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(this + 9, 0);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset(v2, 0);
}

{
  uint64_t vars8;

  TLKannadaOrthographyChecker::~TLKannadaOrthographyChecker(this);
  JUMPOUT(0x26120D630);
}

BOOL TLKannadaOrthographyChecker::isInvalidConsecutiveDiacritics(TLKannadaOrthographyChecker *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v18.CFIndex location = 0;
  v18.length = Length;
  if (CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v18, 0, &result))
  {
    CFIndex v5 = 0;
    char v6 = 1;
    v7.CFIndex location = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      CFIndex location = result.location;
      if (!result.location)
      {
        char v6 = 0;
        return (v6 & 1) == 0;
      }
      if (v7.location != 0x7FFFFFFFFFFFFFFFLL && result.location == v5 + v7.location) {
        break;
      }
LABEL_25:
      CFIndex v5 = result.length;
      v22.CFIndex location = result.length + location;
      v22.length = Length - (result.length + location);
      int CharacterFromSet = CFStringFindCharacterFromSet(theString, *((CFCharacterSetRef *)this + 10), v22, 0, &result);
      v7.CFIndex location = location;
      if (!CharacterFromSet) {
        return (v6 & 1) == 0;
      }
    }
    v7.length = v5;
    CFStringRef v9 = CFStringCreateWithSubstring(0, theString, v7);
    CFStringRef v10 = CFStringCreateWithSubstring(0, theString, result);
    if (CFEqual(v9, *((CFStringRef *)this + 6))
      && CFStringCompare(v10, *((CFStringRef *)this + 6), 0))
    {
      goto LABEL_19;
    }
    if (CFEqual(v10, *((CFStringRef *)this + 4)))
    {
      CFCharacterSetRef v12 = (const __CFCharacterSet *)*((void *)this + 9);
      v19.length = CFStringGetLength(v9);
      v19.CFIndex location = 0;
      if (CFStringFindCharacterFromSet(v9, v12, v19, 0, 0)) {
        goto LABEL_19;
      }
    }
    if ((CFStringCompare(v10, *((CFStringRef *)this + 3), 0)
       || (CFCharacterSetRef v13 = (const __CFCharacterSet *)*((void *)this + 9),
           v20.length = CFStringGetLength(v9),
           v20.CFIndex location = 0,
           !CFStringFindCharacterFromSet(v9, v13, v20, 0, 0)))
      && (CFStringCompare(v10, *((CFStringRef *)this + 5), 0)
       || (CFCharacterSetRef v14 = (const __CFCharacterSet *)*((void *)this + 9),
           v21.length = CFStringGetLength(v9),
           v21.CFIndex location = 0,
           !CFStringFindCharacterFromSet(v9, v14, v21, 0, 0))))
    {
      char v6 = 0;
      int v11 = 0;
      if (!v10) {
        goto LABEL_21;
      }
    }
    else
    {
LABEL_19:
      int v11 = 1;
      if (!v10)
      {
LABEL_21:
        if (v9) {
          CFRelease(v9);
        }
        if (!v11) {
          return (v6 & 1) == 0;
        }
        CFIndex location = result.location;
        goto LABEL_25;
      }
    }
    CFRelease(v10);
    goto LABEL_21;
  }
  char v6 = 1;
  return (v6 & 1) == 0;
}

void sub_26032D3BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLKannadaOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing(CFStringRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFRange result = (CFRange)xmmword_260333360;
  v11.CFIndex location = 0;
  v11.length = Length;
  char v5 = 1;
  if (CFStringFindWithOptions(theString, this[7], v11, 0, &result))
  {
    while (1)
    {
      if (!result.location)
      {
        char v5 = 0;
        return (v5 & 1) == 0;
      }
      v12.CFIndex location = result.location - 1;
      v12.length = 1;
      CFStringRef v6 = CFStringCreateWithSubstring(0, theString, v12);
      CFStringRef v7 = 0;
      if (result.location + 1 < Length)
      {
        v13.length = 1;
        v13.CFIndex location = result.location + 1;
        CFStringRef v7 = CFStringCreateWithSubstring(0, theString, v13);
      }
      if (!TLTeluguOrthographyChecker::canViramaFollowLetter(this, v6)) {
        break;
      }
      if (v7)
      {
        BOOL canViramaPrecedeLetter = TLTeluguOrthographyChecker::canViramaPrecedeLetter((TLTeluguOrthographyChecker *)this, v7);
        v5 &= canViramaPrecedeLetter;
        goto LABEL_9;
      }
      BOOL canViramaPrecedeLetter = 1;
      if (v6) {
        goto LABEL_11;
      }
LABEL_12:
      if (canViramaPrecedeLetter)
      {
        v14.CFIndex location = result.length + result.location;
        v14.length = Length - (result.length + result.location);
        if (CFStringFindWithOptions(theString, this[7], v14, 0, &result)) {
          continue;
        }
      }
      return (v5 & 1) == 0;
    }
    BOOL canViramaPrecedeLetter = 0;
    char v5 = 0;
    if (v7) {
LABEL_9:
    }
      CFRelease(v7);
    if (!v6) {
      goto LABEL_12;
    }
LABEL_11:
    CFRelease(v6);
    goto LABEL_12;
  }
  return (v5 & 1) == 0;
}

void sub_26032D554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9, const void *a10)
{
}

BOOL TLKannadaOrthographyChecker::isInvalidDiacriticAfterVowelLetter(CFCharacterSetRef *this, CFStringRef theString)
{
  CFIndex Length = CFStringGetLength(theString);
  CFCharacterSetRef v5 = CFCharacterSetCreateWithCharactersInString(0, @"ಁಂ");
  v6.CFIndex location = 0;
  CFCharacterSetRef v11 = v5;
  while (1)
  {
    v6.length = Length - v6.location;
    int CharacterFromSet = CFStringFindCharacterFromSet(theString, this[8], v6, 0, &result);
    if (!CharacterFromSet) {
      break;
    }
    if (result.location + 1 < Length)
    {
      UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(theString, result.location + 1);
      if (CFCharacterSetIsCharacterMember(this[10], CharacterAtIndex))
      {
        if (!CFCharacterSetIsCharacterMember(v5, CharacterAtIndex)) {
          break;
        }
      }
    }
    v6.CFIndex location = result.length + result.location;
  }
  if (v5) {
    CFRelease(v5);
  }
  return CharacterFromSet != 0;
}

void sub_26032D65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  nlp::CFScopedPtr<__CFCharacterSet const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

BOOL TLKannadaOrthographyChecker::checkSpelling(CFCharacterSetRef *this, const __CFString *a2, const __CFString **a3, const __CFString **a4)
{
  if (TLKannadaOrthographyChecker::isInvalidConsecutiveDiacritics((TLKannadaOrthographyChecker *)this, a2)
    || TLKannadaOrthographyChecker::isInvalidViramaFollowingConsonantOrNothing((CFStringRef *)this, a2)
    || TLKannadaOrthographyChecker::isInvalidDiacriticAfterVowelLetter(this, a2))
  {
    return 0;
  }
  v7.length = CFStringGetLength(a2);
  v7.CFIndex location = 0;
  return CFStringFindCharacterFromSet(a2, this[12], v7, 0, 0) == 0;
}

void TLLanguageModel::create(TLLanguageModel *this, const TLLanguageModelCreateOptions *a2)
{
}

void sub_26032D784(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(*(void *)v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void TLCompositeTransliterator::TLCompositeTransliterator(TLCompositeTransliterator *this, const __CFLocale *a2, const __CFURL *a3, BOOL a4, int a5)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  if (a5) {
    operator new();
  }
  operator new();
}

void sub_26032DEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void **a10)
{
  MEMORY[0x26120D630](v14, 0xE1C404007A923);
  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(a10, 0);
  uint64_t v16 = *v13;
  *CFRange v13 = 0;
  if (v16) {
    (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
  }
  uint64_t v17 = v10[3];
  v10[3] = 0;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 16))(v17);
  }
  std::unique_ptr<TLCompositeTransliteratorLexicon>::reset[abi:ne180100](v12, 0);
  std::unique_ptr<TLCompositeTransliteratorException>::reset[abi:ne180100](v11, 0);
  uint64_t v18 = *v10;
  *CFStringRef v10 = 0;
  if (v18) {
    std::default_delete<TLCompositeTransliteratorSeq2Seq>::operator()[abi:ne180100]((uint64_t)v10, v18);
  }
  _Unwind_Resume(a1);
}

TL::StringMap **std::unique_ptr<TLCompositeTransliteratorException>::reset[abi:ne180100](TL::StringMap ***a1, TL::StringMap **a2)
{
  CFRange result = *a1;
  *a1 = a2;
  if (result)
  {
    TLCompositeTransliteratorException::~TLCompositeTransliteratorException(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

const void **std::unique_ptr<TLCompositeTransliteratorLexicon>::reset[abi:ne180100](const void ***a1, const void **a2)
{
  CFRange result = *a1;
  *a1 = a2;
  if (result)
  {
    TLCompositeTransliteratorLexicon::~TLCompositeTransliteratorLexicon(result);
    JUMPOUT(0x26120D630);
  }
  return result;
}

void TLLanguageModelCreateOptions::~TLLanguageModelCreateOptions(void **this)
{
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void TLCompositeTransliterator::~TLCompositeTransliterator(TLCompositeTransliterator *this)
{
  nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset((const void **)this + 6, 0);
  uint64_t v2 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = *((void *)this + 3);
  *((void *)this + 3) = 0;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 16))(v3);
  }
  std::unique_ptr<TLCompositeTransliteratorLexicon>::reset[abi:ne180100]((const void ***)this + 2, 0);
  std::unique_ptr<TLCompositeTransliteratorException>::reset[abi:ne180100]((TL::StringMap ***)this + 1, 0);
  uint64_t v4 = *(void *)this;
  *(void *)this = 0;
  if (v4) {
    std::default_delete<TLCompositeTransliteratorSeq2Seq>::operator()[abi:ne180100]((uint64_t)this, v4);
  }
}

uint64_t TLCompositeTransliterator::isTransliteratedWordInLexiconForCandidate(TLCompositeTransliterator *this, const TLCompositeTransliteratorCandidate *a2)
{
  if (*((char *)a2 + 47) < 0) {
    std::string::__init_copy_ctor_external(&__p, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else {
    std::string __p = *(std::string *)((unsigned char *)a2 + 1);
  }
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  if (!size)
  {
    uint64_t isMemberOfTheNativeLexicon = 0;
    if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0) {
      return isMemberOfTheNativeLexicon;
    }
    goto LABEL_8;
  }
  uint64_t isMemberOfTheNativeLexicon = TLCompositeTransliteratorLexicon::isMemberOfTheNativeLexicon(*((uint64_t **)this + 2), (uint64_t)&__p);
  if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0) {
LABEL_8:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
  return isMemberOfTheNativeLexicon;
}

void sub_26032E340(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t TLCompositeTransliterator::updateCandidatesWithEmojiCandidates(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 48)) {
    return 0;
  }
  uint64_t v3 = (long long *)*a2;
  if (*a2 == a2[1]) {
    return 0;
  }
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  unint64_t v37 = 0;
  if (*((char *)v3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v34, *(const std::string::value_type **)v3, *((void *)v3 + 1));
    uint64_t v3 = (long long *)*a2;
  }
  else
  {
    long long v4 = *v3;
    v34.__r_.__value_.__r.__words[2] = *((void *)v3 + 2);
    *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v4;
  }
  if (*((char *)v3 + 47) < 0) {
    std::string::__init_copy_ctor_external(&v33, *((const std::string::value_type **)v3 + 3), *((void *)v3 + 4));
  }
  else {
    std::string v33 = *(std::string *)((unsigned char *)v3 + 1);
  }
  CFTypeRef CFStringFromString = createCFStringFromString((uint64_t)&v33);
  EmojiTokensForCFStringRef String = (const void *)CEMEmojiLocaleDataCreateEmojiTokensForString();
  CFTypeRef cf = EmojiTokensForString;
  if (EmojiTokensForString)
  {
    for (CFIndex i = 0; i < CFArrayGetCount((CFArrayRef)EmojiTokensForString); ++i)
    {
      CFArrayGetValueAtIndex((CFArrayRef)EmojiTokensForString, i);
      CFStringRef String = (const __CFString *)CEMEmojiTokenGetString();
      getUTF8StringFromCFString(String, __p);
      CFStringRef v9 = v36;
      if ((unint64_t)v36 >= v37)
      {
        CFCharacterSetRef v11 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v35, (long long *)__p);
      }
      else
      {
        if (SHIBYTE(v30) < 0)
        {
          std::string::__init_copy_ctor_external(v36, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          long long v10 = *(_OWORD *)__p;
          v36->__r_.__value_.__r.__words[2] = v30;
          *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
        }
        CFCharacterSetRef v11 = v9 + 1;
      }
      uint64_t v36 = v11;
      if (SHIBYTE(v30) < 0) {
        operator delete(__p[0]);
      }
    }
    __p[0] = 0;
    __p[1] = 0;
    std::string::size_type v30 = 0;
    uint64_t v12 = (uint64_t)v35;
    CFRange v13 = v36;
    if (v35 == (const void **)v36)
    {
      uint64_t v14 = 0;
      uint64_t v24 = 0;
    }
    else
    {
      uint64_t v14 = 0;
      do
      {
        BOOL v15 = 0;
        BOOL v28 = 0;
        uint64_t v16 = *(unsigned __int8 *)(v12 + 23);
        if ((v16 & 0x80u) == 0) {
          uint64_t v17 = (const void *)*(unsigned __int8 *)(v12 + 23);
        }
        else {
          uint64_t v17 = *(const void **)(v12 + 8);
        }
        uint64_t v18 = (const void *)*((unsigned __int8 *)v35 + 23);
        int v19 = (char)v18;
        if ((char)v18 < 0) {
          uint64_t v18 = v35[1];
        }
        if (v17 == v18)
        {
          if (v19 >= 0) {
            CFRange v20 = (unsigned __int8 *)v35;
          }
          else {
            CFRange v20 = (unsigned __int8 *)*v35;
          }
          if ((v16 & 0x80) != 0)
          {
            BOOL v15 = memcmp(*(const void **)v12, v20, *(void *)(v12 + 8)) == 0;
          }
          else if (*(unsigned char *)(v12 + 23))
          {
            uint64_t v21 = 0;
            uint64_t v22 = v16 - 1;
            do
            {
              BOOL v15 = *(unsigned __int8 *)(v12 + v21) == v20[v21];
              BOOL v23 = *(unsigned __int8 *)(v12 + v21) != v20[v21] || v22 == v21;
              ++v21;
            }
            while (!v23);
          }
          else
          {
            BOOL v15 = 1;
          }
        }
        BOOL v28 = !v15;
        unsigned __int8 v38 = 0;
        uint64_t v26 = 3;
        double v27 = 0.0;
        if ((unint64_t)v14 >= v30)
        {
          uint64_t v14 = (char *)std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string &,std::string &,double,double,TLTransliteratorCandidateType,BOOL &>((int64x2_t *)__p, (uint64_t)&v34, v12, (double *)&v38, &v27, &v26, (unsigned __int8 *)&v28);
        }
        else
        {
          TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v14, &v34, v12, 3, !v15, 0.0, 0.0);
          v14 += 80;
        }
        __p[1] = v14;
        v12 += 24;
      }
      while ((std::string *)v12 != v13);
      uint64_t v24 = (std::string *)__p[0];
    }
    std::vector<TLCompositeTransliteratorCandidate>::__insert_with_size[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate*>,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>((uint64_t)a2, (long long *)(*a2 + 80), v24, (uint64_t)v14, 0xCCCCCCCCCCCCCCCDLL * ((v14 - (char *)v24) >> 4));
    unint64_t v5 = 0xAAAAAAAAAAAAAAABLL * (((char *)v36 - (char *)v35) >> 3);
    unsigned __int8 v38 = __p;
    std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100](&v38);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if (CFStringFromString) {
    CFRelease(CFStringFromString);
  }
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
  v34.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v34);
  return v5;
}

void sub_26032E6AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  std::string __p = (void *)(v35 - 80);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void TLCompositeTransliterator::performOrthographyCheck(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = *(void *)a2;
    while (v3 != *(void *)(a2 + 8))
    {
      CFStringRef CFStringFromString = createCFStringFromString(v3 + 24);
      if ((*(uint64_t (**)(void, CFStringRef, void, void))(**(void **)(a1 + 40) + 16))(*(void *)(a1 + 40), CFStringFromString, 0, 0))
      {
        v3 += 80;
        if (!CFStringFromString) {
          continue;
        }
      }
      else
      {
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((uint64_t)&v9, (long long *)(v3 + 80), *(long long **)(a2 + 8), v3);
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)(a2 + 8);
        if (v8 != v6)
        {
          do
          {
            v8 -= 80;
            std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v8);
          }
          while (v8 != v7);
        }
        *(void *)(a2 + 8) = v7;
        if (!CFStringFromString) {
          continue;
        }
      }
      CFRelease(CFStringFromString);
    }
  }
}

void sub_26032E874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, const void *a9)
{
}

void TLCompositeTransliterator::assignLanguageModelScoreToCandidates(uint64_t a1, uint64_t **a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    long long v4 = a2[1];
    if (*a2 != v4)
    {
      uint64_t v7 = (uint64_t)(*a2 + 3);
      do
      {
        *(double *)(v7 + 24) = (***(double (****)(void, uint64_t, uint64_t))(a1 + 24))(*(void *)(a1 + 24), v7, a3);
        uint64_t v8 = v7 + 56;
        v7 += 80;
      }
      while ((uint64_t *)v8 != v4);
      long long v10 = *a2;
      char v9 = (long long *)a2[1];
      uint64_t v14 = a1;
      if ((char *)v9 - (char *)v10 < 1)
      {
        CFCharacterSetRef v11 = 0;
        uint64_t v13 = 0;
      }
      else
      {
        CFCharacterSetRef v11 = std::get_temporary_buffer[abi:ne180100]<TLCompositeTransliteratorCandidate>(0xCCCCCCCCCCCCCCCDLL * (((char *)v9 - (char *)v10) >> 4));
        uint64_t v13 = v12;
      }
      std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(v10, v9, &v14, 0xCCCCCCCCCCCCCCCDLL * (((char *)v9 - (char *)v10) >> 4), (uint64_t)v11, v13);
      if (v11) {
        operator delete(v11);
      }
    }
  }
}

void sub_26032E994(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void TLCompositeTransliterator::getTransliterationCandidates(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  TLOSSignPostgetTransliterationCandidates::TLOSSignPostgetTransliterationCandidates((TLOSSignPostgetTransliterationCandidates *)&v46);
  int v9 = *(char *)(a3 + 23);
  if (v9 >= 0) {
    long long v10 = (char *)a3;
  }
  else {
    long long v10 = *(char **)a3;
  }
  if (v9 >= 0) {
    uint64_t v11 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    uint64_t v11 = *(void *)(a3 + 8);
  }
  if (v11)
  {
    uint64_t v12 = &v10[v11];
    uint64_t v13 = MEMORY[0x263EF8318];
    while (1)
    {
      unsigned int v14 = *v10;
      if (!((v14 & 0x80000000) != 0 ? __maskrune(v14, 0x100uLL) : *(_DWORD *)(v13 + 4 * v14 + 60) & 0x100)) {
        break;
      }
      ++v10;
      if (!--v11)
      {
        long long v10 = v12;
        break;
      }
    }
    LOBYTE(v9) = *(unsigned char *)(a3 + 23);
  }
  if ((v9 & 0x80) != 0)
  {
    uint64_t v16 = *(const std::string::value_type **)a3;
    std::string::size_type v17 = *(void *)(a3 + 8);
    if (v10 == (char *)(*(void *)a3 + v17))
    {
      *(void *)a5 = 0;
      *(void *)(a5 + 8) = 0;
      *(void *)(a5 + 16) = 0;
      std::string::__init_copy_ctor_external(&v45, v16, v17);
      goto LABEL_22;
    }
LABEL_20:
    *(void *)a5 = 0;
    *(void *)(a5 + 8) = 0;
    *(void *)(a5 + 16) = 0;
    goto LABEL_79;
  }
  if (v10 != (char *)(a3 + v9)) {
    goto LABEL_20;
  }
  *(void *)a5 = 0;
  *(void *)(a5 + 8) = 0;
  *(void *)(a5 + 16) = 0;
  std::string v45 = *(std::string *)a3;
LABEL_22:
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v18 = (std::string *)((char *)&v45 + HIBYTE(v45.__r_.__value_.__r.__words[2]));
  }
  else {
    uint64_t v18 = (std::string *)(v45.__r_.__value_.__r.__words[0] + v45.__r_.__value_.__l.__size_);
  }
  if ((v45.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    int v19 = &v45;
  }
  else {
    int v19 = (std::string *)v45.__r_.__value_.__r.__words[0];
  }
  while (v19 != v18)
  {
    v19->__r_.__value_.__s.__data_[0] = __tolower(v19->__r_.__value_.__s.__data_[0]);
    int v19 = (std::string *)((char *)v19 + 1);
  }
  int64x2_t v43 = 0uLL;
  uint64_t v44 = 0;
  if (*(void *)a1)
  {
    TLCompositeTransliteratorSeq2Seq::seq2SeqCandidatesForInput(*(uint64_t **)a1, (uint64_t)&v45, &v48);
    std::vector<TLCompositeTransliteratorCandidate>::__vdeallocate((void **)&v43);
    int64x2_t v43 = v48;
    uint64_t v44 = v49;
    uint64_t v49 = 0;
    int64x2_t v48 = 0uLL;
    v47.__locale_ = (std::locale::__imp *)&v48;
    std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
  }
  TLCompositeTransliteratorException::exceptionCandidatesForInput(*(uint64_t ***)(a1 + 8), a3, &v42);
  uint64_t v21 = (std::string *)v42.i64[1];
  CFRange v20 = (std::string *)v42.i64[0];
  if (v42.i64[0] == v42.i64[1])
  {
    TLCompositeTransliteratorException::exceptionCandidatesForInput(*(uint64_t ***)(a1 + 8), (uint64_t)&v45, &v48);
    std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>((uint64_t)&v42, (std::string *)v48.i64[0], (std::string *)v48.i64[1], 0xCCCCCCCCCCCCCCCDLL * ((v48.i64[1] - v48.i64[0]) >> 4));
    v47.__locale_ = (std::locale::__imp *)&v48;
    std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
    uint64_t v21 = (std::string *)v42.i64[1];
    CFRange v20 = (std::string *)v42.i64[0];
  }
  if (v20 == v21)
  {
    TLCompositeTransliteratorLexicon::lexiconCandidatesForInput(*(void **)(a1 + 16), (uint64_t)&v45, &v48);
    if (v48.i64[1] == v48.i64[0])
    {
      if (&v43 != (int64x2_t *)a5) {
        std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(a5, (std::string *)v43.i64[0], (std::string *)v43.i64[1], 0xCCCCCCCCCCCCCCCDLL * ((v43.i64[1] - v43.i64[0]) >> 4));
      }
    }
    else
    {
      if (&v48 != (int64x2_t *)a5) {
        std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(a5, (std::string *)v48.i64[0], (std::string *)v48.i64[1], 0xCCCCCCCCCCCCCCCDLL * ((v48.i64[1] - v48.i64[0]) >> 4));
      }
      uint64_t v26 = (long long *)v43.i64[1];
      for (CFIndex i = (long long *)v43.i64[0]; i != v26; i += 5)
      {
        if ((candidateSurfaceFormPresentInVector((uint64_t)i, (uint64_t *)a5) & 1) == 0)
        {
          unint64_t v28 = *(void *)(a5 + 8);
          if (v28 >= *(void *)(a5 + 16))
          {
            uint64_t v29 = std::vector<TLCompositeTransliteratorCandidate>::__push_back_slow_path<TLCompositeTransliteratorCandidate const&>((int64x2_t *)a5, i);
          }
          else
          {
            std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate const&,TLCompositeTransliteratorCandidate*>(*(std::string **)(a5 + 8), i);
            uint64_t v29 = v28 + 80;
            *(void *)(a5 + 8) = v28 + 80;
          }
          *(void *)(a5 + 8) = v29;
        }
      }
    }
    TLCompositeTransliterator::assignLanguageModelScoreToCandidates(a1, (uint64_t **)a5, a2);
    v47.__locale_ = (std::locale::__imp *)&v48;
    std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
  }
  else
  {
    if (&v42 != (int64x2_t *)a5) {
      std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(a5, v20, v21, 0xCCCCCCCCCCCCCCCDLL * (((char *)v21 - (char *)v20) >> 4));
    }
    if (v43.i64[0] != v43.i64[1])
    {
      TLCompositeTransliterator::assignLanguageModelScoreToCandidates(a1, (uint64_t **)&v43, a2);
      uint64_t v22 = (long long *)v43.i64[1];
      for (uint64_t j = (long long *)v43.i64[0]; j != v22; j += 5)
      {
        if ((candidateSurfaceFormPresentInVector((uint64_t)j, (uint64_t *)a5) & 1) == 0)
        {
          unint64_t v24 = *(void *)(a5 + 8);
          if (v24 >= *(void *)(a5 + 16))
          {
            uint64_t v25 = std::vector<TLCompositeTransliteratorCandidate>::__push_back_slow_path<TLCompositeTransliteratorCandidate const&>((int64x2_t *)a5, j);
          }
          else
          {
            std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate const&,TLCompositeTransliteratorCandidate*>(*(std::string **)(a5 + 8), j);
            uint64_t v25 = v24 + 80;
            *(void *)(a5 + 8) = v24 + 80;
          }
          *(void *)(a5 + 8) = v25;
        }
      }
    }
  }
  TLCompositeTransliterator::performOrthographyCheck(a1, a5);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v48);
  uint64_t v31 = *(void *)a5;
  uint64_t v30 = *(void *)(a5 + 8);
  if (*(void *)a5 != v30)
  {
    unint64_t v32 = (std::locale::id *)MEMORY[0x263F8C108];
    do
    {
      std::string v33 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v48, (uint64_t)"<", 1);
      std::string v34 = operator<<(v33, v31);
      uint64_t v35 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)">", 1);
      std::ios_base::getloc((const std::ios_base *)((char *)v35 + *(void *)(*v35 - 24)));
      uint64_t v36 = std::locale::use_facet(&v47, v32);
      ((void (*)(const std::locale::facet *, uint64_t))v36->__vftable[2].~facet_0)(v36, 10);
      std::locale::~locale(&v47);
      std::ostream::put();
      std::ostream::flush();
      v31 += 80;
    }
    while (v31 != v30);
  }
  unint64_t v37 = _nlpDefaultLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)&v48.i64[1], &v47);
    TLCompositeTransliterator::getTransliterationCandidates((int)&v53, (char *)&v47, buf, v37);
  }

  v48.i64[0] = *MEMORY[0x263F8C2C8];
  *(uint64_t *)((char *)v48.i64 + *(void *)(v48.i64[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v48.i64[1] = MEMORY[0x263F8C318] + 16;
  if (v51 < 0) {
    operator delete(__p);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x26120D5D0](&v52);
  unint64_t v38 = *(unsigned __int8 *)(a3 + 23);
  if ((v38 & 0x80u) != 0) {
    unint64_t v38 = *(void *)(a3 + 8);
  }
  if (v38 < 2) {
    unint64_t updated = 0;
  }
  else {
    unint64_t updated = TLCompositeTransliterator::updateCandidatesWithEmojiCandidates(a1, (void *)a5);
  }
  if (updated + 5 >= updated + a4) {
    unint64_t v40 = updated + a4;
  }
  else {
    unint64_t v40 = updated + 5;
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a5 + 8) - *(void *)a5) >> 4) > v40) {
    std::vector<TLCompositeTransliteratorCandidate>::resize(a5, v40);
  }
  v48.i64[0] = (uint64_t)&v42;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  v48.i64[0] = (uint64_t)&v43;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v45.__r_.__value_.__l.__data_);
  }
LABEL_79:
  TLOSSignPostgetTransliterationCandidates::~TLOSSignPostgetTransliterationCandidates(&v46);
}

void sub_26032F004(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,os_signpost_id_t a24,std::locale a25,uint64_t a26,uint64_t a27,char a28)
{
  *(void *)(v28 - 136) = &a10;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)(v28 - 136));
  a10 = &a13;
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  if (a22 < 0) {
    operator delete(__p);
  }
  std::vector<TLCompositeTransliteratorCandidate>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  TLOSSignPostgetTransliterationCandidates::~TLOSSignPostgetTransliterationCandidates(&a24);
  _Unwind_Resume(a1);
}

uint64_t candidateSurfaceFormPresentInVector(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 == v3) {
    return 0;
  }
  uint64_t v6 = *(unsigned __int8 **)(a1 + 24);
  long long v4 = (unsigned __int8 *)(a1 + 24);
  unint64_t v5 = v6;
  int v7 = (char)v4[23];
  if (v7 >= 0) {
    uint64_t v8 = v4[23];
  }
  else {
    uint64_t v8 = *((void *)v4 + 1);
  }
  if (v7 >= 0) {
    int v9 = v4;
  }
  else {
    int v9 = v5;
  }
  while (1)
  {
    uint64_t v10 = *(unsigned __int8 *)(v2 + 47);
    if ((v10 & 0x80u) == 0) {
      uint64_t v11 = *(unsigned __int8 *)(v2 + 47);
    }
    else {
      uint64_t v11 = *(void *)(v2 + 32);
    }
    if (v11 != v8) {
      goto LABEL_19;
    }
    if ((v10 & 0x80) != 0) {
      break;
    }
    if (!*(unsigned char *)(v2 + 47)) {
      return 1;
    }
    uint64_t v12 = 0;
    while (*(unsigned __int8 *)(v2 + v12 + 24) == v9[v12])
    {
      if (v10 == ++v12) {
        return 1;
      }
    }
LABEL_19:
    v2 += 80;
    if (v2 == v3) {
      return 0;
    }
  }
  if (memcmp(*(const void **)(v2 + 24), v9, *(void *)(v2 + 32))) {
    goto LABEL_19;
  }
  return 1;
}

void std::vector<TLCompositeTransliteratorCandidate>::resize(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((v3 - *(void *)a1) >> 4);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    std::vector<TLCompositeTransliteratorCandidate>::__append((char **)a1, v6);
  }
  else if (!v5)
  {
    uint64_t v7 = *(void *)a1 + 80 * a2;
    while (v3 != v7)
    {
      v3 -= 80;
      std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v3);
    }
    *(void *)(a1 + 8) = v7;
  }
}

applesauce::CF::StringRef *applesauce::CF::StringRef::StringRef(applesauce::CF::StringRef *this, CFTypeRef cf)
{
  *(void *)this = cf;
  if (cf)
  {
    CFTypeID v3 = CFGetTypeID(cf);
    if (v3 != CFStringGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x26120D480](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x263F8C1F0], MEMORY[0x263F8C070]);
    }
  }
  return this;
}

void sub_26032F2DC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v2);
  if (*v1) {
    CFRelease(*v1);
  }
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(a2 + 48) = 0;
  *(void *)(result + 48) = v2;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void ___ZL30loadLMSpecificModulatingFactorPK10__CFLocalePK7__CFURL_block_invoke(uint64_t a1, CFURLRef url, uint64_t a3, uint64_t a4, const __CFString *a5, unsigned char *a6)
{
  CFStringRef PathComponent = CFURLCopyLastPathComponent(url);
  if (PathComponent)
  {
    CFStringRef v11 = PathComponent;
    if (CFStringHasSuffix(PathComponent, @".lm"))
    {
      if (CFStringsAreEqual(a5, @"LanguageModel"))
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
        CFURLRef v13 = CFURLCreateCopyAppendingPathComponent((CFAllocatorRef)*MEMORY[0x263EFFB08], url, @"Info.plist", 0);
        nlp::CFScopedPtr<__CFURL const*>::reset((const void **)(v12 + 48), v13);
        *a6 = 1;
      }
    }
    CFRelease(v11);
  }
}

void sub_26032F3EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  nlp::CFScopedPtr<__CFString const*>::reset((const void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
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
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_26032F514(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__emplace_back_slow_path<std::string &,std::string &,double,double,TLTransliteratorCandidateType,BOOL &>(int64x2_t *a1, uint64_t a2, uint64_t a3, double *a4, double *a5, void *a6, unsigned __int8 *a7)
{
  uint64_t v8 = a1->i64[0];
  unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  unint64_t v10 = v9 + 1;
  if (v9 + 1 > 0x333333333333333) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t i64 = (uint64_t)a1[1].i64;
  unint64_t v18 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v8) >> 4);
  if (2 * v18 > v10) {
    unint64_t v10 = 2 * v18;
  }
  if (v18 >= 0x199999999999999) {
    unint64_t v19 = 0x333333333333333;
  }
  else {
    unint64_t v19 = v10;
  }
  uint64_t v35 = a1 + 1;
  if (v19) {
    CFRange v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v19);
  }
  else {
    CFRange v20 = 0;
  }
  unint64_t v32 = v20;
  v33.i64[0] = (uint64_t)&v20[80 * v9];
  v33.i64[1] = v33.i64[0];
  std::string v34 = &v20[80 * v19];
  TLCompositeTransliteratorCandidate::TLCompositeTransliteratorCandidate(v33.i64[0], a2, a3, *a6, *a7, *a4, *a5);
  uint64_t v22 = a1->i64[0];
  unint64_t v21 = a1->u64[1];
  uint64_t v23 = v33.i64[0];
  uint64_t v24 = v33.i64[0];
  if (v21 == a1->i64[0])
  {
    int64x2_t v28 = vdupq_n_s64(v21);
  }
  else
  {
    do
    {
      long long v25 = *(_OWORD *)(v21 - 80);
      *(void *)(v24 - 64) = *(void *)(v21 - 64);
      *(_OWORD *)(v24 - 8nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = v25;
      *(void *)(v21 - 72) = 0;
      *(void *)(v21 - 64) = 0;
      *(void *)(v21 - 8nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
      long long v26 = *(_OWORD *)(v21 - 56);
      *(void *)(v24 - 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)(v21 - 40);
      *(_OWORD *)(v24 - 56) = v26;
      *(void *)(v21 - 48) = 0;
      *(void *)(v21 - 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
      *(void *)(v21 - 56) = 0;
      long long v27 = *(_OWORD *)(v21 - 32);
      *(_OWORD *)(v24 - 23) = *(_OWORD *)(v21 - 23);
      *(_OWORD *)(v24 - 32) = v27;
      v24 -= 80;
      v21 -= 80;
    }
    while (v21 != v22);
    int64x2_t v28 = *a1;
  }
  uint64_t v29 = v23 + 80;
  a1->i64[0] = v24;
  a1->i64[1] = v23 + 80;
  int64x2_t v33 = v28;
  uint64_t v30 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v34;
  std::string v34 = v30;
  unint64_t v32 = (char *)v28.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v32);
  return v29;
}

void sub_26032F6C8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

long long *std::vector<TLCompositeTransliteratorCandidate>::__insert_with_size[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate*>,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(uint64_t a1, long long *a2, std::string *a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5 = a2;
  if (a5 >= 1)
  {
    uint64_t v7 = a3;
    uint64_t v11 = *(void *)(a1 + 16);
    uint64_t v9 = a1 + 16;
    uint64_t v10 = v11;
    unint64_t v12 = *(void *)(v9 - 8);
    if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v11 - v12) >> 4)) >= a5)
    {
      uint64_t v20 = v12 - (void)a2;
      if ((uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v12 - (void)a2) >> 4)) >= a5)
      {
        unint64_t v21 = (std::string *)((char *)a3 + 80 * a5);
      }
      else
      {
        unint64_t v21 = (std::string *)((char *)a3 + 16 * ((uint64_t)(v12 - (void)a2) >> 4));
        *(void *)(a1 + 8) = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(v9, (uint64_t)v21, a4, *(void *)(v9 - 8));
        if (v20 < 1) {
          return v5;
        }
      }
      std::vector<TLCompositeTransliteratorCandidate>::__move_range(a1, (uint64_t)v5, v12, (uint64_t)&v5[5 * a5]);
      std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((int)v27, v7, v21, (std::string *)v5);
    }
    else
    {
      uint64_t v13 = *(long long **)a1;
      unint64_t v14 = a5 - 0x3333333333333333 * ((uint64_t)(v12 - *(void *)a1) >> 4);
      if (v14 > 0x333333333333333) {
        std::vector<std::string>::__throw_length_error[abi:ne180100]();
      }
      unint64_t v15 = 0xCCCCCCCCCCCCCCCDLL * (a2 - v13);
      unint64_t v16 = 0xCCCCCCCCCCCCCCCDLL * ((v10 - (uint64_t)v13) >> 4);
      uint64_t v17 = 2 * v16;
      if (2 * v16 <= v14) {
        uint64_t v17 = v14;
      }
      if (v16 >= 0x199999999999999) {
        unint64_t v18 = 0x333333333333333;
      }
      else {
        unint64_t v18 = v17;
      }
      uint64_t v30 = v9;
      if (v18) {
        unint64_t v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(v9, v18);
      }
      else {
        unint64_t v19 = 0;
      }
      uint64_t v22 = (std::string *)&v19[80 * v15];
      v27[0] = v19;
      v27[1] = v22;
      int64x2_t v28 = v22;
      uint64_t v29 = &v19[80 * v18];
      uint64_t v23 = 5 * a5;
      uint64_t v24 = (std::string *)((char *)v22 + 80 * a5);
      uint64_t v25 = 16 * v23;
      do
      {
        std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate&,TLCompositeTransliteratorCandidate*>(v22, (long long *)v7);
        uint64_t v22 = (std::string *)((char *)v22 + 80);
        uint64_t v7 = (std::string *)((char *)v7 + 80);
        v25 -= 80;
      }
      while (v25);
      int64x2_t v28 = v24;
      unint64_t v5 = std::vector<TLCompositeTransliteratorCandidate>::__swap_out_circular_buffer((long long **)a1, v27, v5);
      std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)v27);
    }
  }
  return v5;
}

void sub_26032F8A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12)
{
  *(void *)(v12 + 8) = v13;
  _Unwind_Resume(exception_object);
}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__move_range(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      *(void *)(v8 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)(v9 + 40);
      *(_OWORD *)(v8 + 24) = v11;
      *(void *)(v9 + 32) = 0;
      *(void *)(v9 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
      *(void *)(v9 + 24) = 0;
      long long v12 = *(_OWORD *)(v9 + 48);
      *(_OWORD *)(v8 + 57) = *(_OWORD *)(v9 + 57);
      *(_OWORD *)(v8 + 48) = v12;
      v8 += 80;
      v9 += 80;
    }
    while (v9 < a3);
  }
  *(void *)(a1 + 8) = v8;
  return std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((uint64_t)&v14, a2, v7, v6);
}

long long *std::vector<TLCompositeTransliteratorCandidate>::__swap_out_circular_buffer(long long **a1, void *a2, long long *a3)
{
  CFRange result = (long long *)a2[1];
  unint64_t v5 = *a1;
  uint64_t v6 = result;
  if (*a1 != a3)
  {
    unint64_t v7 = a3;
    uint64_t v8 = a2[1];
    do
    {
      uint64_t v6 = (long long *)(v8 - 80);
      long long v9 = *(v7 - 5);
      *(void *)(v8 - 64) = *((void *)v7 - 8);
      *(_OWORD *)(v8 - 8nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = v9;
      *((void *)v7 - 9) = 0;
      *((void *)v7 - 8) = 0;
      *((void *)v7 - 1nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
      long long v10 = *(long long *)((char *)v7 - 56);
      *(void *)(v8 - 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v7 - 5);
      *(_OWORD *)(v8 - 56) = v10;
      *((void *)v7 - 6) = 0;
      *((void *)v7 - 5) = 0;
      *((void *)v7 - 7) = 0;
      long long v11 = *(v7 - 2);
      *(_OWORD *)(v8 - 23) = *(long long *)((char *)v7 - 23);
      *(_OWORD *)(v8 - 32) = v11;
      v7 -= 5;
      v8 -= 80;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  long long v12 = a1[1];
  uint64_t v13 = a2[2];
  if (v12 != a3)
  {
    do
    {
      long long v14 = *a3;
      *(void *)(v13 + 16) = *((void *)a3 + 2);
      *(_OWORD *)uint64_t v13 = v14;
      *((void *)a3 + 1) = 0;
      *((void *)a3 + 2) = 0;
      *(void *)a3 = 0;
      long long v15 = *(long long *)((char *)a3 + 24);
      *(void *)(v13 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)a3 + 5);
      *(_OWORD *)(v13 + 24) = v15;
      *((void *)a3 + 4) = 0;
      *((void *)a3 + 5) = 0;
      *((void *)a3 + 3) = 0;
      long long v16 = a3[3];
      *(_OWORD *)(v13 + 57) = *(long long *)((char *)a3 + 57);
      *(_OWORD *)(v13 + 48) = v16;
      v13 += 80;
      a3 += 5;
    }
    while (a3 != v12);
    uint64_t v6 = (long long *)a2[1];
  }
  a2[2] = v13;
  uint64_t v17 = *a1;
  *a1 = v6;
  a2[1] = v17;
  unint64_t v18 = a1[1];
  a1[1] = (long long *)a2[2];
  a2[2] = v18;
  unint64_t v19 = a1[2];
  a1[2] = (long long *)a2[3];
  a2[3] = v19;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 != a3)
  {
    uint64_t v7 = 0;
    do
    {
      std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate&,TLCompositeTransliteratorCandidate*>((std::string *)(a4 + v7), (long long *)(a2 + v7));
      v7 += 80;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_26032FAE8(_Unwind_Exception *exception_object)
{
  if (v2)
  {
    uint64_t v4 = v1 - 80;
    do
    {
      std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v4 + v2);
      v2 -= 80;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate&,TLCompositeTransliteratorCandidate*>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  unint64_t v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  long long v7 = a2[3];
  *(_OWORD *)((char *)&this[2].__r_.__value_.__r.__words[1] + 1) = *(long long *)((char *)a2 + 57);
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = v7;
  return this;
}

void sub_26032FB98(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a4 + v7;
      long long v9 = (void **)(a4 + v7 - 80);
      if (*(char *)(a4 + v7 - 57) < 0) {
        operator delete(*v9);
      }
      long long v10 = (long long *)(a3 + v7 - 80);
      long long v11 = *v10;
      *(void *)(a4 + v7 - 64) = *(void *)(a3 + v7 - 64);
      *(_OWORD *)long long v9 = v11;
      *(unsigned char *)(a3 + v7 - 57) = 0;
      *(unsigned char *)long long v10 = 0;
      long long v12 = (void **)(v8 - 56);
      if (*(char *)(v8 - 33) < 0) {
        operator delete(*v12);
      }
      uint64_t v13 = a3 + v7;
      long long v14 = *(_OWORD *)(a3 + v7 - 56);
      *(void *)(v8 - 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)(a3 + v7 - 40);
      *(_OWORD *)long long v12 = v14;
      *(unsigned char *)(v13 - 33) = 0;
      *(unsigned char *)(v13 - 56) = 0;
      uint64_t v15 = a4 + v7;
      long long v16 = *(_OWORD *)(a3 + v7 - 32);
      *(_OWORD *)(v15 - 23) = *(_OWORD *)(a3 + v7 - 23);
      *(_OWORD *)(v15 - 32) = v16;
      v7 -= 80;
    }
    while (a3 + v7 != a2);
  }
  return a3;
}

std::string *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>(int a1, std::string *__str, std::string *a3, std::string *this)
{
  unint64_t v5 = __str;
  if (__str == a3) {
    return __str;
  }
  long long v6 = a3;
  do
  {
    std::string::operator=(this, v5);
    std::string::operator=(this + 1, v5 + 1);
    long long v7 = *(_OWORD *)((char *)&v5[2].__r_.__value_.__r.__words[1] + 1);
    *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = *(_OWORD *)&v5[2].__r_.__value_.__l.__data_;
    *(_OWORD *)((char *)&this[2].__r_.__value_.__r.__words[1] + 1) = v7;
    this = (std::string *)((char *)this + 80);
    unint64_t v5 = (std::string *)((char *)v5 + 80);
  }
  while (v5 != v6);
  return v6;
}

long long *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  unint64_t v5 = a2;
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
      *((unsigned char *)v5 + 23) = 0;
      *(unsigned char *)unint64_t v5 = 0;
      uint64_t v8 = (void **)(a4 + 24);
      if (*(char *)(a4 + 47) < 0) {
        operator delete(*v8);
      }
      long long v9 = *(long long *)((char *)v5 + 24);
      *(void *)(a4 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v5 + 5);
      *(_OWORD *)uint64_t v8 = v9;
      *((unsigned char *)v5 + 47) = 0;
      *((unsigned char *)v5 + 24) = 0;
      long long v10 = v5[3];
      *(_OWORD *)(a4 + 57) = *(long long *)((char *)v5 + 57);
      *(_OWORD *)(a4 + 48) = v10;
      a4 += 80;
      v5 += 5;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

void TLOSSignPostgetTransliterationCandidates::TLOSSignPostgetTransliterationCandidates(TLOSSignPostgetTransliterationCandidates *this)
{
  uint64_t v2 = _nlpSignpostLog();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, this);

  *(void *)this = v3;
  long long v4 = _nlpSignpostLog();
  unint64_t v5 = v4;
  os_signpost_id_t v6 = *(void *)this;
  if ((unint64_t)(*(void *)this - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)long long v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_26031A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "getTransliterationCandidates", (const char *)&unk_2603359EA, v7, 2u);
  }
}

void std::vector<TLCompositeTransliteratorCandidate>::__vdeallocate(void **a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v3 = (uint64_t)a1[1];
    long long v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 80;
        std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v3);
      }
      while ((void *)v3 != v1);
      long long v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<TLCompositeTransliteratorCandidate>::__assign_with_size[abi:ne180100]<TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(uint64_t a1, std::string *__str, std::string *a3, unint64_t a4)
{
  uint64_t v8 = a1 + 16;
  long long v9 = *(std::string **)a1;
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4) < a4)
  {
    std::vector<TLCompositeTransliteratorCandidate>::__vdeallocate((void **)a1);
    if (a4 > 0x333333333333333) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0x999999999999999ALL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4);
    if (v10 <= a4) {
      unint64_t v10 = a4;
    }
    if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 16) - *(void *)a1) >> 4) >= 0x199999999999999) {
      unint64_t v11 = 0x333333333333333;
    }
    else {
      unint64_t v11 = v10;
    }
    std::vector<TLCompositeTransliteratorCandidate>::__vallocate[abi:ne180100]((void *)a1, v11);
    uint64_t v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(v8, (uint64_t)__str, (uint64_t)a3, *(void *)(a1 + 8));
    goto LABEL_11;
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4) < a4)
  {
    uint64_t v13 = (std::string *)((char *)__str + 16 * ((uint64_t)(*(void *)(a1 + 8) - (void)v9) >> 4));
    std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((int)&v17, __str, v13, v9);
    uint64_t v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*,TLCompositeTransliteratorCandidate*>(v8, (uint64_t)v13, (uint64_t)a3, *(void *)(a1 + 8));
LABEL_11:
    *(void *)(a1 + 8) = v12;
    return;
  }
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((int)&v18, __str, a3, v9);
  uint64_t v15 = v14;
  uint64_t v16 = *(void *)(a1 + 8);
  if (v16 != v14)
  {
    do
    {
      v16 -= 80;
      std::__destroy_at[abi:ne180100]<TLCompositeTransliteratorCandidate,0>(v16);
    }
    while (v16 != v15);
  }
  *(void *)(a1 + 8) = v15;
}

void sub_260330054(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_26033005C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

char *std::vector<TLCompositeTransliteratorCandidate>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  CFRange result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[80 * v4];
  return result;
}

uint64_t std::vector<TLCompositeTransliteratorCandidate>::__push_back_slow_path<TLCompositeTransliteratorCandidate const&>(int64x2_t *a1, long long *a2)
{
  uint64_t v3 = a1->i64[0];
  unint64_t v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1->i64[1] - a1->i64[0]) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x333333333333333) {
    std::vector<std::string>::__throw_length_error[abi:ne180100]();
  }
  uint64_t i64 = (uint64_t)a1[1].i64;
  unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1].i64[0] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x199999999999999) {
    unint64_t v9 = 0x333333333333333;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v25 = a1 + 1;
  if (v9) {
    unint64_t v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(i64, v9);
  }
  else {
    unint64_t v10 = 0;
  }
  uint64_t v22 = v10;
  v23.i64[0] = (uint64_t)&v10[80 * v4];
  v23.i64[1] = v23.i64[0];
  uint64_t v24 = &v10[80 * v9];
  std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate const&,TLCompositeTransliteratorCandidate*>((std::string *)v23.i64[0], a2);
  uint64_t v12 = a1->i64[0];
  unint64_t v11 = a1->u64[1];
  uint64_t v13 = v23.i64[0];
  uint64_t v14 = v23.i64[0];
  if (v11 == a1->i64[0])
  {
    int64x2_t v18 = vdupq_n_s64(v11);
  }
  else
  {
    do
    {
      long long v15 = *(_OWORD *)(v11 - 80);
      *(void *)(v14 - 64) = *(void *)(v11 - 64);
      *(_OWORD *)(v14 - 8nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = v15;
      *(void *)(v11 - 72) = 0;
      *(void *)(v11 - 64) = 0;
      *(void *)(v11 - 8nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
      long long v16 = *(_OWORD *)(v11 - 56);
      *(void *)(v14 - 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)(v11 - 40);
      *(_OWORD *)(v14 - 56) = v16;
      *(void *)(v11 - 48) = 0;
      *(void *)(v11 - 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
      *(void *)(v11 - 56) = 0;
      long long v17 = *(_OWORD *)(v11 - 32);
      *(_OWORD *)(v14 - 23) = *(_OWORD *)(v11 - 23);
      *(_OWORD *)(v14 - 32) = v17;
      v14 -= 80;
      v11 -= 80;
    }
    while (v11 != v12);
    int64x2_t v18 = *a1;
  }
  uint64_t v19 = v13 + 80;
  a1->i64[0] = v14;
  a1->i64[1] = v13 + 80;
  int64x2_t v23 = v18;
  uint64_t v20 = (char *)a1[1].i64[0];
  a1[1].i64[0] = (uint64_t)v24;
  uint64_t v24 = v20;
  uint64_t v22 = (char *)v18.i64[0];
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v22);
  return v19;
}

void sub_260330220(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

std::string *std::construct_at[abi:ne180100]<TLCompositeTransliteratorCandidate,TLCompositeTransliteratorCandidate const&,TLCompositeTransliteratorCandidate*>(std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  unint64_t v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  long long v7 = a2[3];
  *(_OWORD *)((char *)&this[2].__r_.__value_.__r.__words[1] + 1) = *(long long *)((char *)a2 + 57);
  *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = v7;
  return this;
}

void sub_2603302C0(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  unint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_26033044C(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x26120D5D0](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x26120D5D0](a1 + 112);
  return a1;
}

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  unint64_t v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v9 = operator new(v7 + 1);
    a2[1] = v6;
    a2[2] = v8 | 0x8000000000000000;
    *a2 = v9;
    a2 = v9;
  }
  else
  {
    *((unsigned char *)a2 + 23) = v4;
    if (!v4) {
      goto LABEL_9;
    }
  }
  uint64_t result = (uint64_t)memmove(a2, v5, v6);
LABEL_9:
  *((unsigned char *)a2 + v6) = 0;
  return result;
}

uint64_t std::stringbuf::view[abi:ne180100](uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 96);
  if ((v1 & 0x10) != 0)
  {
    unint64_t v3 = *(void *)(a1 + 48);
    if (*(void *)(a1 + 88) < v3) {
      *(void *)(a1 + 88) = v3;
    }
    return *(void *)(a1 + 40);
  }
  else if ((v1 & 8) != 0)
  {
    return *(void *)(a1 + 16);
  }
  else
  {
    return 0;
  }
}

void std::vector<TLCompositeTransliteratorCandidate>::__append(char **a1, unint64_t a2)
{
  size_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (0xCCCCCCCCCCCCCCCDLL * ((v6 - v7) >> 4) >= a2)
  {
    if (a2)
    {
      size_t v13 = 80 * ((80 * a2 - 80) / 0x50) + 80;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = 0xCCCCCCCCCCCCCCCDLL * ((v7 - *a1) >> 4);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x333333333333333) {
      std::vector<std::string>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * ((v5 - *a1) >> 4);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x199999999999999) {
      unint64_t v11 = 0x333333333333333;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v28 = v4;
    if (v11) {
      uint64_t v12 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<TLCompositeTransliteratorCandidate>>(v4, v11);
    }
    else {
      uint64_t v12 = 0;
    }
    uint64_t v14 = &v12[80 * v8];
    long long v15 = &v12[80 * v11];
    size_t v16 = 80 * ((80 * a2 - 80) / 0x50) + 80;
    bzero(v14, v16);
    long long v17 = &v14[v16];
    uint64_t v19 = *a1;
    unint64_t v18 = (unint64_t)a1[1];
    if ((char *)v18 == *a1)
    {
      int64x2_t v23 = vdupq_n_s64(v18);
    }
    else
    {
      do
      {
        long long v20 = *(_OWORD *)(v18 - 80);
        *((void *)v14 - 8) = *(void *)(v18 - 64);
        *((_OWORD *)v14 - 5) = v20;
        *(void *)(v18 - 72) = 0;
        *(void *)(v18 - 64) = 0;
        *(void *)(v18 - 8nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
        long long v21 = *(_OWORD *)(v18 - 56);
        *((void *)v14 - 5) = *(void *)(v18 - 40);
        *(_OWORD *)(v14 - 56) = v21;
        *(void *)(v18 - 48) = 0;
        *(void *)(v18 - 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
        *(void *)(v18 - 56) = 0;
        long long v22 = *(_OWORD *)(v18 - 32);
        *(_OWORD *)(v14 - 23) = *(_OWORD *)(v18 - 23);
        *((_OWORD *)v14 - 2) = v22;
        v14 -= 80;
        v18 -= 80;
      }
      while ((char *)v18 != v19);
      int64x2_t v23 = *(int64x2_t *)a1;
    }
    *a1 = v14;
    a1[1] = v17;
    int64x2_t v26 = v23;
    uint64_t v24 = a1[2];
    a1[2] = v15;
    long long v27 = v24;
    uint64_t v25 = v23.i64[0];
    std::__split_buffer<TLCompositeTransliteratorCandidate>::~__split_buffer((uint64_t)&v25);
  }
}

void TLOSSignPostgetTransliterationCandidates::~TLOSSignPostgetTransliterationCandidates(os_signpost_id_t *this)
{
  uint64_t v2 = _nlpSignpostLog();
  unint64_t v3 = v2;
  os_signpost_id_t v4 = *this;
  if (*this - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_26031A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "getTransliterationCandidates", (const char *)&unk_2603359EA, v5, 2u);
  }
}

void nlp::CFScopedPtr<__EmojiLocaleDataWrapper const*>::reset(const void **a1, const void *a2)
{
  os_signpost_id_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void std::default_delete<TLCompositeTransliteratorSeq2Seq>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  if (a2)
  {

    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)(a2 + 8), 0);
    nlp::CFScopedPtr<__CFLocale const*>::reset((const void **)a2, 0);
    JUMPOUT(0x26120D630);
  }
}

void nlp::CFScopedPtr<__CFArray const*>::reset(const void **a1, const void *a2)
{
  os_signpost_id_t v4 = *a1;
  if (v4) {
    CFRelease(v4);
  }
  *a1 = a2;
}

void *std::get_temporary_buffer[abi:ne180100]<TLCompositeTransliteratorCandidate>(uint64_t a1)
{
  if (a1 < 1) {
    return 0;
  }
  if (a1 >= 0x199999999999999) {
    unint64_t v1 = 0x199999999999999;
  }
  else {
    unint64_t v1 = a1;
  }
  uint64_t v2 = (const std::nothrow_t *)MEMORY[0x263F8C180];
  while (1)
  {
    uint64_t result = operator new(80 * v1, v2);
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

void std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(uint64_t *a1, long long *a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  v74 = a2;
  v75 = a1;
  if (a4 >= 2)
  {
    if (a4 == 2)
    {
      v74 = a2 - 5;
      uint64_t v9 = *a3;
      double TotalScore = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)(a2 - 5), *(double *)(*a3 + 32));
      if (TotalScore > TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)a1, *(double *)(v9 + 32)))std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(&v75, &v74); {
    }
      }
    else if ((uint64_t)a4 <= 0)
    {
      if (a1 != (uint64_t *)a2)
      {
        long long v17 = (TLCompositeTransliteratorCandidate *)(a1 + 10);
        if (a1 + 10 != (uint64_t *)a2)
        {
          uint64_t v18 = 0;
          uint64_t v19 = a1;
          do
          {
            long long v20 = v17;
            uint64_t v21 = *a3;
            double v22 = TLCompositeTransliteratorCandidate::getTotalScore(v17, *(double *)(*a3 + 32));
            if (v22 > TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v19, *(double *)(v21 + 32)))
            {
              long long v23 = *(_OWORD *)v20;
              uint64_t v77 = *((void *)v20 + 2);
              *(_OWORD *)std::string __p = v23;
              *((void *)v20 + 1) = 0;
              *((void *)v20 + 2) = 0;
              *(void *)long long v20 = 0;
              long long v78 = *(_OWORD *)(v19 + 13);
              uint64_t v79 = v19[15];
              v19[14] = 0;
              v19[15] = 0;
              v19[13] = 0;
              v80[0] = *((_OWORD *)v19 + 8);
              *(_OWORD *)((char *)v80 + 9) = *(_OWORD *)((char *)v19 + 137);
              uint64_t v24 = v18;
              while (1)
              {
                uint64_t v25 = (char *)a1 + v24;
                int64x2_t v26 = (void **)((char *)a1 + v24 + 80);
                if (*((char *)a1 + v24 + 103) < 0) {
                  operator delete(*v26);
                }
                *(_OWORD *)int64x2_t v26 = *(_OWORD *)v25;
                *(uint64_t *)((char *)a1 + v24 + 96) = *((void *)v25 + 2);
                v25[23] = 0;
                *uint64_t v25 = 0;
                long long v27 = v25 + 104;
                if (v25[127] < 0) {
                  operator delete(*(void **)v27);
                }
                uint64_t v28 = (char *)a1 + v24;
                long long v29 = *(_OWORD *)((char *)a1 + v24 + 24);
                *((void *)v27 + 2) = *(uint64_t *)((char *)a1 + v24 + 40);
                *(_OWORD *)long long v27 = v29;
                v28[47] = 0;
                v28[24] = 0;
                *((_OWORD *)v28 + 8) = *(_OWORD *)((char *)a1 + v24 + 48);
                *(_OWORD *)(v28 + 137) = *(_OWORD *)((char *)a1 + v24 + 57);
                if (!v24) {
                  break;
                }
                uint64_t v30 = *a3;
                double v31 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)__p, *(double *)(*a3 + 32));
                v24 -= 80;
                if (v31 <= TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)(v28 - 80), *(double *)(v30 + 32)))
                {
                  uint64_t v32 = (uint64_t)a1 + v24 + 80;
                  goto LABEL_23;
                }
              }
              uint64_t v32 = (uint64_t)a1;
LABEL_23:
              if (*(char *)(v32 + 23) < 0) {
                operator delete(*(void **)v32);
              }
              char v33 = 0;
              std::string v34 = (void **)(v28 + 24);
              long long v35 = *(_OWORD *)__p;
              *(void *)(v32 + 16) = v77;
              *(_OWORD *)uint64_t v32 = v35;
              HIBYTE(v77) = 0;
              LOBYTE(__p[0]) = 0;
              if (*(char *)(v32 + 47) < 0)
              {
                operator delete(*v34);
                char v33 = HIBYTE(v77);
              }
              long long v36 = v78;
              *((void *)v28 + 5) = v79;
              *(_OWORD *)std::string v34 = v36;
              HIBYTE(v79) = 0;
              LOBYTE(v78) = 0;
              long long v37 = v80[0];
              *(_OWORD *)(v28 + 57) = *(_OWORD *)((char *)v80 + 9);
              *((_OWORD *)v28 + 3) = v37;
              if (v33 < 0) {
                operator delete(__p[0]);
              }
            }
            long long v17 = (TLCompositeTransliteratorCandidate *)((char *)v20 + 80);
            v18 += 80;
            uint64_t v19 = (uint64_t *)v20;
          }
          while ((long long *)((char *)v20 + 80) != a2);
        }
      }
    }
    else
    {
      uint64_t v14 = a4 >> 1;
      long long v15 = (long long *)&a1[10 * (a4 >> 1)];
      if ((uint64_t)a4 <= a6)
      {
        std::__stable_sort_move<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>((long long *)a1, (long long *)&a1[10 * (a4 >> 1)], a3, a4 >> 1, a5);
        uint64_t v38 = a5 + 80 * v14;
        std::__stable_sort_move<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>((long long *)&a1[10 * (a4 >> 1)], a2, a3, a4 - v14, v38);
        __p[0] = (void *)a4;
        unint64_t v39 = a5 + 80 * a4;
        unint64_t v40 = a1 + 6;
        uint64_t v41 = v38;
        uint64_t v42 = a5;
        while (v41 != v39)
        {
          uint64_t v43 = *a3;
          double v44 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v41, *(double *)(*a3 + 32));
          double v45 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v42, *(double *)(v43 + 32));
          os_signpost_id_t v46 = (void **)(v40 - 3);
          int v47 = *((char *)v40 - 25);
          if (v44 <= v45)
          {
            if (v47 < 0) {
              operator delete(*v46);
            }
            long long v52 = *(_OWORD *)v42;
            *((void *)v40 - 4) = *(void *)(v42 + 16);
            *(_OWORD *)os_signpost_id_t v46 = v52;
            *(unsigned char *)(v42 + 23) = 0;
            *(unsigned char *)uint64_t v42 = 0;
            char v53 = (void **)v40 - 3;
            if (*((char *)v40 - 1) < 0) {
              operator delete(*v53);
            }
            long long v54 = *(_OWORD *)(v42 + 24);
            *((void *)v40 - 1) = *(void *)(v42 + 40);
            *(_OWORD *)char v53 = v54;
            *(unsigned char *)(v42 + 47) = 0;
            *(unsigned char *)(v42 + 24) = 0;
            long long v55 = *(_OWORD *)(v42 + 48);
            *(_OWORD *)((char *)v40 + 9) = *(_OWORD *)(v42 + 57);
            *unint64_t v40 = v55;
            v42 += 80;
          }
          else
          {
            if (v47 < 0) {
              operator delete(*v46);
            }
            long long v48 = *(_OWORD *)v41;
            *((void *)v40 - 4) = *(void *)(v41 + 16);
            *(_OWORD *)os_signpost_id_t v46 = v48;
            *(unsigned char *)(v41 + 23) = 0;
            *(unsigned char *)uint64_t v41 = 0;
            uint64_t v49 = (void **)v40 - 3;
            if (*((char *)v40 - 1) < 0) {
              operator delete(*v49);
            }
            long long v50 = *(_OWORD *)(v41 + 24);
            *((void *)v40 - 1) = *(void *)(v41 + 40);
            *(_OWORD *)uint64_t v49 = v50;
            *(unsigned char *)(v41 + 47) = 0;
            *(unsigned char *)(v41 + 24) = 0;
            long long v51 = *(_OWORD *)(v41 + 48);
            *(_OWORD *)((char *)v40 + 9) = *(_OWORD *)(v41 + 57);
            *unint64_t v40 = v51;
            v41 += 80;
          }
          v40 += 5;
          if (v42 == v38)
          {
            if (v41 != v39)
            {
              uint64_t v56 = 0;
              do
              {
                v57 = &v40[v56];
                os_signpost_id_t v58 = (void **)&v40[v56 - 3];
                if (*((char *)&v40[v56 - 1] - 9) < 0) {
                  operator delete(*v58);
                }
                uint64_t v59 = v41 + v56 * 16;
                long long v60 = *(_OWORD *)(v41 + v56 * 16);
                *(void *)&v40[v56 - 2] = *(void *)(v41 + v56 * 16 + 16);
                *(_OWORD *)os_signpost_id_t v58 = v60;
                *(unsigned char *)(v59 + 23) = 0;
                *(unsigned char *)uint64_t v59 = 0;
                v61 = (void **)v57 - 3;
                if (*((char *)v57 - 1) < 0) {
                  operator delete(*v61);
                }
                long long v62 = *(_OWORD *)(v59 + 24);
                *((void *)v57 - 1) = *(void *)(v59 + 40);
                *(_OWORD *)v61 = v62;
                *(unsigned char *)(v59 + 47) = 0;
                *(unsigned char *)(v59 + 24) = 0;
                CFStringRef v63 = &v40[v56];
                long long v64 = *(_OWORD *)(v59 + 48);
                *(_OWORD *)((char *)v63 + 9) = *(_OWORD *)(v59 + 57);
                *CFStringRef v63 = v64;
                v56 += 5;
              }
              while (v59 + 80 != v39);
            }
            goto LABEL_60;
          }
        }
        if (v42 != v38)
        {
          uint64_t v65 = 0;
          do
          {
            CFStringRef v66 = &v40[v65];
            CFIndex v67 = (void **)&v40[v65 - 3];
            if (*((char *)&v40[v65 - 1] - 9) < 0) {
              operator delete(*v67);
            }
            uint64_t v68 = v42 + v65 * 16;
            long long v69 = *(_OWORD *)(v42 + v65 * 16);
            *(void *)&v40[v65 - 2] = *(void *)(v42 + v65 * 16 + 16);
            *(_OWORD *)CFIndex v67 = v69;
            *(unsigned char *)(v68 + 23) = 0;
            *(unsigned char *)uint64_t v68 = 0;
            char v70 = (void **)v66 - 3;
            if (*((char *)v66 - 1) < 0) {
              operator delete(*v70);
            }
            long long v71 = *(_OWORD *)(v68 + 24);
            *((void *)v66 - 1) = *(void *)(v68 + 40);
            *(_OWORD *)char v70 = v71;
            *(unsigned char *)(v68 + 47) = 0;
            *(unsigned char *)(v68 + 24) = 0;
            v72 = &v40[v65];
            long long v73 = *(_OWORD *)(v68 + 48);
            *(_OWORD *)((char *)v72 + 9) = *(_OWORD *)(v68 + 57);
            _OWORD *v72 = v73;
            v65 += 5;
          }
          while (v68 + 80 != v38);
        }
LABEL_60:
        if (a5) {
          std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>((unint64_t *)__p, a5);
        }
      }
      else
      {
        std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(a1, &a1[10 * (a4 >> 1)], a3, a4 >> 1, a5, a6);
        uint64_t v16 = a4 - v14;
        std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(v15, a2, a3, v16, a5, a6);
        std::__inplace_merge<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(a1, v15, (uint64_t *)a2, a3, v14, v16, a5, a6);
      }
    }
  }
}

void sub_260330FE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, unint64_t a11)
{
  if (v11) {
    std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(&a11, v11);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(uint64_t **a1, long long **a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = *a2;
  uint64_t v4 = **a1;
  *(void *)uint64_t v16 = (*a1)[1];
  *(void *)&v16[7] = *(uint64_t *)((char *)*a1 + 15);
  char v5 = *((unsigned char *)*a1 + 23);
  v2[1] = 0;
  v2[2] = 0;
  *uint64_t v2 = 0;
  uint64_t v7 = (void **)(v2 + 3);
  uint64_t v6 = v2[3];
  *(void *)long long v15 = v2[4];
  *(void *)&v15[7] = *(uint64_t *)((char *)v2 + 39);
  char v8 = *((unsigned char *)v2 + 47);
  v2[4] = 0;
  v2[5] = 0;
  v2[3] = 0;
  uint64_t v9 = v2 + 6;
  *(_OWORD *)&v14[9] = *(_OWORD *)((char *)v2 + 57);
  *(_OWORD *)uint64_t v14 = *((_OWORD *)v2 + 3);
  long long v10 = *v3;
  v2[2] = *((void *)v3 + 2);
  *(_OWORD *)uint64_t v2 = v10;
  *((unsigned char *)v3 + 23) = 0;
  *(unsigned char *)unint64_t v3 = 0;
  if (*((char *)v2 + 47) < 0) {
    operator delete(*v7);
  }
  long long v11 = *(long long *)((char *)v3 + 24);
  v7[2] = (void *)*((void *)v3 + 5);
  *(_OWORD *)uint64_t v7 = v11;
  *((unsigned char *)v3 + 47) = 0;
  *((unsigned char *)v3 + 24) = 0;
  long long v12 = v3[3];
  *(_OWORD *)((char *)v9 + 9) = *(long long *)((char *)v3 + 57);
  _OWORD *v9 = v12;
  if (*((char *)v3 + 23) < 0) {
    operator delete(*(void **)v3);
  }
  *(void *)unint64_t v3 = v4;
  *((void *)v3 + 1) = *(void *)v16;
  *(void *)((char *)v3 + 15) = *(void *)&v16[7];
  *((unsigned char *)v3 + 23) = v5;
  if (*((char *)v3 + 47) < 0) {
    operator delete(*((void **)v3 + 3));
  }
  *((void *)v3 + 3) = v6;
  *((void *)v3 + 4) = *(void *)v15;
  *(void *)((char *)v3 + 39) = *(void *)&v15[7];
  *((unsigned char *)v3 + 47) = v8;
  v3[3] = *(_OWORD *)v14;
  __n128 result = *(__n128 *)&v14[9];
  *(long long *)((char *)v3 + 57) = *(_OWORD *)&v14[9];
  return result;
}

void std::__stable_sort_move<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(long long *a1, long long *a2, uint64_t *a3, unint64_t a4, uint64_t a5)
{
  if (a4)
  {
    char v8 = a2;
    uint64_t v9 = (TLCompositeTransliteratorCandidate *)a1;
    if (a4 == 2)
    {
      size_t v13 = a2 - 5;
      uint64_t v14 = *a3;
      double TotalScore = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)(a2 - 5), *(double *)(*a3 + 32));
      double v16 = TLCompositeTransliteratorCandidate::getTotalScore(v9, *(double *)(v14 + 32));
      long long v17 = (_OWORD *)(a5 + 24);
      uint64_t v18 = (_OWORD *)(a5 + 48);
      uint64_t v19 = (_OWORD *)(a5 + 80);
      long long v20 = (_OWORD *)(a5 + 104);
      if (TotalScore <= v16)
      {
        long long v77 = *(_OWORD *)v9;
        *(void *)(a5 + 16) = *((void *)v9 + 2);
        *(_OWORD *)a5 = v77;
        *((void *)v9 + 1) = 0;
        *((void *)v9 + 2) = 0;
        *(void *)uint64_t v9 = 0;
        long long v78 = *(_OWORD *)((char *)v9 + 24);
        *(void *)(a5 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v9 + 5);
        _OWORD *v17 = v78;
        *((void *)v9 + 4) = 0;
        *((void *)v9 + 5) = 0;
        *((void *)v9 + 3) = 0;
        long long v79 = *((_OWORD *)v9 + 3);
        *(_OWORD *)(a5 + 57) = *(_OWORD *)((char *)v9 + 57);
        *uint64_t v18 = v79;
        long long v80 = *v13;
        *(void *)(a5 + 96) = *((void *)v8 - 8);
        *uint64_t v19 = v80;
        *((void *)v8 - 9) = 0;
        *((void *)v8 - 8) = 0;
        *(void *)size_t v13 = 0;
        long long v81 = *(long long *)((char *)v8 - 56);
        *(void *)(a5 + 12nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v8 - 5);
        *long long v20 = v81;
        *((void *)v8 - 6) = 0;
        *((void *)v8 - 5) = 0;
        *((void *)v8 - 7) = 0;
        int64x2_t v26 = v8 - 2;
      }
      else
      {
        long long v21 = *v13;
        *(void *)(a5 + 16) = *((void *)v8 - 8);
        *(_OWORD *)a5 = v21;
        *((void *)v8 - 9) = 0;
        *((void *)v8 - 8) = 0;
        *(void *)size_t v13 = 0;
        long long v22 = *(long long *)((char *)v8 - 56);
        *(void *)(a5 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v8 - 5);
        _OWORD *v17 = v22;
        *((void *)v8 - 6) = 0;
        *((void *)v8 - 5) = 0;
        *((void *)v8 - 7) = 0;
        long long v23 = *(v8 - 2);
        *(_OWORD *)(a5 + 57) = *(long long *)((char *)v8 - 23);
        *uint64_t v18 = v23;
        long long v24 = *(_OWORD *)v9;
        *(void *)(a5 + 96) = *((void *)v9 + 2);
        *uint64_t v19 = v24;
        *((void *)v9 + 1) = 0;
        *((void *)v9 + 2) = 0;
        *(void *)uint64_t v9 = 0;
        long long v25 = *(_OWORD *)((char *)v9 + 24);
        *(void *)(a5 + 12nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v9 + 5);
        *long long v20 = v25;
        *((void *)v9 + 4) = 0;
        *((void *)v9 + 5) = 0;
        *((void *)v9 + 3) = 0;
        int64x2_t v26 = (long long *)((char *)v9 + 48);
      }
      long long v82 = *v26;
      *(_OWORD *)(a5 + 137) = *(long long *)((char *)v26 + 9);
      *(_OWORD *)(a5 + 128) = v82;
    }
    else if (a4 == 1)
    {
      long long v10 = *a1;
      *(void *)(a5 + 16) = *((void *)a1 + 2);
      *(_OWORD *)a5 = v10;
      *((void *)a1 + 1) = 0;
      *((void *)a1 + 2) = 0;
      *(void *)a1 = 0;
      long long v11 = *(long long *)((char *)a1 + 24);
      *(void *)(a5 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)a1 + 5);
      *(_OWORD *)(a5 + 24) = v11;
      *((void *)a1 + 4) = 0;
      *((void *)a1 + 5) = 0;
      *((void *)a1 + 3) = 0;
      long long v12 = a1[3];
      *(_OWORD *)(a5 + 57) = *(long long *)((char *)a1 + 57);
      *(_OWORD *)(a5 + 48) = v12;
    }
    else if ((uint64_t)a4 > 8)
    {
      v57 = (TLCompositeTransliteratorCandidate *)&a1[5 * (a4 >> 1)];
      std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(a1, v57, a3, a4 >> 1, a5, a4 >> 1);
      std::__stable_sort<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>((char *)v9 + 80 * (a4 >> 1), v8, a3, a4 - (a4 >> 1), a5 + 80 * (a4 >> 1), a4 - (a4 >> 1));
      uint64_t v91 = 0;
      uint64_t v58 = a5;
      uint64_t v59 = (long long *)((char *)v9 + 80 * (a4 >> 1));
      while (v59 != v8)
      {
        uint64_t v60 = *a3;
        double v61 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v59, *(double *)(*a3 + 32));
        double v62 = TLCompositeTransliteratorCandidate::getTotalScore(v9, *(double *)(v60 + 32));
        CFStringRef v63 = (_OWORD *)(v58 + 24);
        long long v64 = (_OWORD *)(v58 + 48);
        if (v61 <= v62)
        {
          long long v68 = *(_OWORD *)v9;
          *(void *)(v58 + 16) = *((void *)v9 + 2);
          *(_OWORD *)uint64_t v58 = v68;
          *((void *)v9 + 1) = 0;
          *((void *)v9 + 2) = 0;
          *(void *)uint64_t v9 = 0;
          long long v69 = *(_OWORD *)((char *)v9 + 24);
          *(void *)(v58 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v9 + 5);
          *CFStringRef v63 = v69;
          *((void *)v9 + 4) = 0;
          *((void *)v9 + 5) = 0;
          *((void *)v9 + 3) = 0;
          long long v70 = *((_OWORD *)v9 + 3);
          *(_OWORD *)(v58 + 57) = *(_OWORD *)((char *)v9 + 57);
          *long long v64 = v70;
          uint64_t v9 = (TLCompositeTransliteratorCandidate *)((char *)v9 + 80);
        }
        else
        {
          long long v65 = *v59;
          *(void *)(v58 + 16) = *((void *)v59 + 2);
          *(_OWORD *)uint64_t v58 = v65;
          *((void *)v59 + 1) = 0;
          *((void *)v59 + 2) = 0;
          *(void *)uint64_t v59 = 0;
          long long v66 = *(long long *)((char *)v59 + 24);
          *(void *)(v58 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v59 + 5);
          *CFStringRef v63 = v66;
          *((void *)v59 + 4) = 0;
          *((void *)v59 + 5) = 0;
          *((void *)v59 + 3) = 0;
          long long v67 = v59[3];
          *(_OWORD *)(v58 + 57) = *(long long *)((char *)v59 + 57);
          *long long v64 = v67;
          v59 += 5;
        }
        ++v91;
        v58 += 80;
        if (v9 == v57)
        {
          if (v59 != v8)
          {
            uint64_t v71 = 0;
            do
            {
              v72 = &v59[v71];
              uint64_t v73 = v58 + v71 * 16;
              long long v74 = v59[v71];
              *(void *)(v73 + 16) = *(void *)&v59[v71 + 1];
              *(_OWORD *)uint64_t v73 = v74;
              *((void *)v72 + 1) = 0;
              *((void *)v72 + 2) = 0;
              *(void *)v72 = 0;
              long long v75 = *(long long *)((char *)&v59[v71 + 1] + 8);
              *(void *)(v73 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)&v59[v71 + 2] + 1);
              *(_OWORD *)(v73 + 24) = v75;
              *((void *)v72 + 4) = 0;
              *((void *)v72 + 5) = 0;
              *((void *)v72 + 3) = 0;
              long long v76 = v59[v71 + 3];
              *(_OWORD *)(v73 + 57) = *(long long *)((char *)&v59[v71 + 3] + 9);
              *(_OWORD *)(v73 + 48) = v76;
              v71 += 5;
            }
            while (v72 + 5 != v8);
          }
          return;
        }
      }
      if (v9 != v57)
      {
        uint64_t v83 = 0;
        do
        {
          uint64_t v84 = v58 + v83;
          CFRange v85 = (void *)((char *)v9 + v83);
          long long v86 = *(_OWORD *)((char *)v9 + v83);
          *(void *)(v84 + 16) = *(void *)((char *)v9 + v83 + 16);
          *(_OWORD *)uint64_t v84 = v86;
          v85[1] = 0;
          v85[2] = 0;
          *CFRange v85 = 0;
          long long v87 = *(_OWORD *)((char *)v9 + v83 + 24);
          *(void *)(v84 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)((char *)v9 + v83 + 40);
          *(_OWORD *)(v84 + 24) = v87;
          v85[4] = 0;
          v85[5] = 0;
          v85[3] = 0;
          long long v88 = *(_OWORD *)((char *)v9 + v83 + 48);
          *(_OWORD *)(v84 + 57) = *(_OWORD *)((char *)v9 + v83 + 57);
          *(_OWORD *)(v84 + 48) = v88;
          v83 += 80;
        }
        while (v85 + 10 != (void *)v57);
      }
    }
    else if (a1 != a2)
    {
      long long v27 = *a1;
      *(void *)(a5 + 16) = *((void *)a1 + 2);
      *(_OWORD *)a5 = v27;
      *((void *)a1 + 1) = 0;
      *((void *)a1 + 2) = 0;
      *(void *)a1 = 0;
      long long v28 = *(long long *)((char *)a1 + 24);
      *(void *)(a5 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)a1 + 5);
      *(_OWORD *)(a5 + 24) = v28;
      *((void *)a1 + 4) = 0;
      *((void *)a1 + 5) = 0;
      *((void *)a1 + 3) = 0;
      long long v29 = a1[3];
      *(_OWORD *)(a5 + 57) = *(long long *)((char *)a1 + 57);
      *(_OWORD *)(a5 + 48) = v29;
      uint64_t v90 = 1;
      uint64_t v30 = (TLCompositeTransliteratorCandidate *)(a1 + 5);
      if (a1 + 5 != a2)
      {
        uint64_t v31 = 0;
        uint64_t v32 = (_OWORD *)a5;
        do
        {
          char v33 = v30;
          uint64_t v34 = *a3;
          double v35 = TLCompositeTransliteratorCandidate::getTotalScore(v30, *(double *)(*a3 + 32));
          double v36 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v32, *(double *)(v34 + 32));
          long long v37 = v32 + 5;
          uint64_t v38 = (_OWORD *)((char *)v32 + 104);
          unint64_t v39 = v32 + 8;
          if (v35 <= v36)
          {
            long long v50 = *(_OWORD *)v33;
            *((void *)v32 + 12) = *((void *)v33 + 2);
            *long long v37 = v50;
            *((void *)v33 + 1) = 0;
            *((void *)v33 + 2) = 0;
            *(void *)char v33 = 0;
            long long v51 = *(_OWORD *)((char *)v9 + 104);
            *((void *)v32 + 15) = *((void *)v9 + 15);
            *uint64_t v38 = v51;
            *((void *)v9 + 14) = 0;
            *((void *)v9 + 15) = 0;
            *((void *)v9 + 13) = 0;
            long long v52 = *((_OWORD *)v9 + 8);
            *(_OWORD *)((char *)v32 + 137) = *(_OWORD *)((char *)v9 + 137);
            *unint64_t v39 = v52;
            ++v90;
          }
          else
          {
            *long long v37 = *v32;
            *((void *)v32 + 12) = *((void *)v32 + 2);
            *(void *)uint64_t v32 = 0;
            *((void *)v32 + 1) = 0;
            long long v40 = *(_OWORD *)((char *)v32 + 24);
            *((void *)v32 + 2) = 0;
            *((void *)v32 + 3) = 0;
            *uint64_t v38 = v40;
            *((void *)v32 + 15) = *((void *)v32 + 5);
            *((void *)v32 + 4) = 0;
            *((void *)v32 + 5) = 0;
            *(_OWORD *)((char *)v32 + 137) = *(_OWORD *)((char *)v32 + 57);
            *unint64_t v39 = v32[3];
            uint64_t v41 = a5;
            ++v90;
            if (v32 != (_OWORD *)a5)
            {
              uint64_t v42 = v31;
              while (1)
              {
                uint64_t v43 = *a3;
                double v44 = TLCompositeTransliteratorCandidate::getTotalScore(v33, *(double *)(*a3 + 32));
                uint64_t v45 = a5 + v42;
                os_signpost_id_t v46 = (TLCompositeTransliteratorCandidate *)(a5 + v42 - 80);
                if (v44 <= TLCompositeTransliteratorCandidate::getTotalScore(v46, *(double *)(v43 + 32))) {
                  break;
                }
                uint64_t v47 = a5 + v42;
                if (*(char *)(a5 + v42 + 23) < 0) {
                  operator delete(*(void **)v45);
                }
                *(_OWORD *)uint64_t v45 = *(_OWORD *)v46;
                *(void *)(v45 + 16) = *(void *)(a5 + v42 - 64);
                *(unsigned char *)(v47 - 57) = 0;
                *(unsigned char *)os_signpost_id_t v46 = 0;
                long long v48 = (void **)(v47 + 24);
                if (*(char *)(v47 + 47) < 0) {
                  operator delete(*v48);
                }
                uint64_t v49 = a5 + v42;
                *(_OWORD *)long long v48 = *(_OWORD *)(a5 + v42 - 56);
                *(void *)(v47 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)(a5 + v42 - 40);
                *(unsigned char *)(v49 - 33) = 0;
                *(unsigned char *)(v49 - 56) = 0;
                *(_OWORD *)(v49 + 48) = *(_OWORD *)(a5 + v42 - 32);
                *(_OWORD *)(v49 + 57) = *(_OWORD *)(a5 + v42 - 23);
                v42 -= 80;
                if (!v42)
                {
                  uint64_t v41 = a5;
                  goto LABEL_23;
                }
              }
              uint64_t v41 = a5 + v42;
LABEL_23:
              char v8 = a2;
            }
            if (*(char *)(v41 + 23) < 0) {
              operator delete(*(void **)v41);
            }
            long long v53 = *(_OWORD *)v33;
            *(void *)(v41 + 16) = *((void *)v33 + 2);
            *(_OWORD *)uint64_t v41 = v53;
            *((unsigned char *)v9 + 103) = 0;
            *(unsigned char *)char v33 = 0;
            long long v54 = (void **)(v41 + 24);
            if (*(char *)(v41 + 47) < 0) {
              operator delete(*v54);
            }
            long long v55 = *(_OWORD *)((char *)v9 + 104);
            *(void *)(v41 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v9 + 15);
            *(_OWORD *)long long v54 = v55;
            *((unsigned char *)v9 + 127) = 0;
            *((unsigned char *)v9 + 104) = 0;
            long long v56 = *((_OWORD *)v9 + 8);
            *(_OWORD *)(v41 + 57) = *(_OWORD *)((char *)v9 + 137);
            *(_OWORD *)(v41 + 48) = v56;
          }
          uint64_t v30 = (TLCompositeTransliteratorCandidate *)((char *)v33 + 80);
          v31 += 80;
          uint64_t v32 = v37;
          uint64_t v9 = v33;
        }
        while ((long long *)((char *)v33 + 80) != v8);
      }
    }
  }
}

void sub_2603317FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, unint64_t a10)
{
  if (v10) {
    std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(&a10, v10);
  }
  _Unwind_Resume(exception_object);
}

void std::__inplace_merge<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(uint64_t *a1, long long *a2, uint64_t *a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v98 = a2;
  v99 = a1;
  if (!a6) {
    return;
  }
  uint64_t v8 = a8;
  uint64_t v9 = a7;
  long long v12 = (uint64_t *)a2;
  uint64_t v13 = (uint64_t)a1;
  uint64_t v14 = v98;
  long long v15 = (TLCompositeTransliteratorCandidate *)a2;
  while (a6 > v8 && a5 > v8)
  {
    if (!a5) {
      goto LABEL_45;
    }
    uint64_t v97 = a6;
    double v16 = v12;
    uint64_t v17 = 0;
    uint64_t v18 = -a5;
    while (1)
    {
      uint64_t v19 = v13;
      v13 += v17;
      uint64_t v20 = *a4;
      double TotalScore = TLCompositeTransliteratorCandidate::getTotalScore(v15, *(double *)(*a4 + 32));
      if (TotalScore > TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v13, *(double *)(v20 + 32)))break; {
      v17 += 80;
      }
      BOOL v22 = __CFADD__(v18++, 1);
      uint64_t v13 = v19;
      if (v22) {
        goto LABEL_45;
      }
    }
    v99 = (uint64_t *)v13;
    uint64_t v23 = -v18;
    uint64_t v24 = v97;
    if (-v18 >= v97)
    {
      if (v18 == -1)
      {
        v98 = v14;
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(&v99, &v98);
        return;
      }
      if (v18 > 0) {
        uint64_t v23 = 1 - v18;
      }
      uint64_t v30 = v23 >> 1;
      CFRange v93 = (TLCompositeTransliteratorCandidate *)(v19 + 80 * (v23 >> 1) + v17);
      uint64_t v14 = (long long *)a3;
      if (a3 != (uint64_t *)v15)
      {
        uint64_t v91 = v23 >> 1;
        uint64_t v14 = (long long *)v15;
        uint64_t v32 = *a4;
        unint64_t v33 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a3 - (char *)v15) >> 4);
        do
        {
          uint64_t v34 = (TLCompositeTransliteratorCandidate *)&v14[5 * (v33 >> 1)];
          double v35 = TLCompositeTransliteratorCandidate::getTotalScore(v34, *(double *)(v32 + 32));
          double v36 = TLCompositeTransliteratorCandidate::getTotalScore(v93, *(double *)(v32 + 32));
          if (v35 <= v36) {
            v33 >>= 1;
          }
          else {
            v33 += ~(v33 >> 1);
          }
          if (v35 > v36) {
            uint64_t v14 = (long long *)((char *)v34 + 80);
          }
        }
        while (v33);
        uint64_t v24 = v97;
        uint64_t v30 = v91;
      }
      unint64_t v31 = 0xCCCCCCCCCCCCCCCDLL * (((char *)v14 - (char *)v15) >> 4);
      long long v12 = (uint64_t *)v93;
    }
    else
    {
      if (v97 >= 0) {
        uint64_t v25 = v97;
      }
      else {
        uint64_t v25 = v97 + 1;
      }
      uint64_t v92 = v25 >> 1;
      uint64_t v14 = (long long *)&v16[10 * (v25 >> 1)];
      uint64_t v26 = (uint64_t)v16 - v19 - v17;
      if (v26)
      {
        uint64_t v90 = v15;
        unint64_t v27 = 0xCCCCCCCCCCCCCCCDLL * (v26 >> 4);
        double v16 = (uint64_t *)v13;
        do
        {
          uint64_t v28 = *a4;
          double v29 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v14, *(double *)(*a4 + 32));
          if (v29 > TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)&v16[10 * (v27 >> 1)], *(double *)(v28 + 32)))
          {
            v27 >>= 1;
          }
          else
          {
            v16 += 10 * (v27 >> 1) + 10;
            v27 += ~(v27 >> 1);
          }
        }
        while (v27);
        uint64_t v24 = v97;
        long long v15 = v90;
      }
      uint64_t v30 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v16 - v19 - v17) >> 4);
      long long v12 = v16;
      unint64_t v31 = v92;
    }
    if (v12 == (uint64_t *)v15)
    {
      uint64_t v38 = (uint64_t *)v14;
    }
    else if (v15 == (TLCompositeTransliteratorCandidate *)v14)
    {
      uint64_t v38 = v12;
    }
    else
    {
      long long v37 = std::__rotate_forward[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<TLCompositeTransliteratorCandidate *>>(v12, (long long *)v15, v14);
      uint64_t v24 = v97;
      uint64_t v38 = v37;
    }
    a5 = -(v30 + v18);
    unint64_t v39 = v24 - v31;
    if ((uint64_t)(v30 + v31) >= (uint64_t)(v24 - (v30 + v31) - v18))
    {
      uint64_t v9 = a7;
      uint64_t v41 = a5;
      a5 = v30;
      uint64_t v8 = a8;
      std::__inplace_merge<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(v38, v14, a3, a4, v41, v24 - v31, a7, a8);
      uint64_t v14 = (long long *)v12;
      unint64_t v39 = v31;
      a3 = v38;
    }
    else
    {
      uint64_t v40 = v30;
      uint64_t v8 = a8;
      uint64_t v9 = a7;
      std::__inplace_merge<std::_ClassicAlgPolicy,TLCompositeTransliterator::assignLanguageModelScoreToCandidates(std::vector<TLCompositeTransliteratorCandidate> &,std::vector<std::string> const&)::$_1 &,std::__wrap_iter<TLCompositeTransliteratorCandidate*>>(v13, v12, v38, a4, v40, v31, a7, a8);
      v99 = v38;
      uint64_t v13 = (uint64_t)v38;
      long long v12 = (uint64_t *)v14;
    }
    long long v15 = (TLCompositeTransliteratorCandidate *)v14;
    a6 = v39;
    if (!v39)
    {
LABEL_45:
      v98 = v14;
      return;
    }
  }
  v98 = v14;
  if (a5 <= a6)
  {
    if ((TLCompositeTransliteratorCandidate *)v13 != v15)
    {
      long long v68 = v15;
      long long v69 = a4;
      uint64_t v70 = 0;
      unint64_t v71 = 0;
      do
      {
        uint64_t v72 = v9 + v70;
        uint64_t v73 = (void *)(v13 + v70);
        long long v74 = *(_OWORD *)(v13 + v70);
        *(void *)(v72 + 16) = *(void *)(v13 + v70 + 16);
        *(_OWORD *)uint64_t v72 = v74;
        v73[1] = 0;
        v73[2] = 0;
        *uint64_t v73 = 0;
        long long v75 = *(_OWORD *)(v13 + v70 + 24);
        *(void *)(v72 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)(v13 + v70 + 40);
        *(_OWORD *)(v72 + 24) = v75;
        v73[4] = 0;
        v73[5] = 0;
        v73[3] = 0;
        long long v76 = *(_OWORD *)(v13 + v70 + 48);
        *(_OWORD *)(v72 + 57) = *(_OWORD *)(v13 + v70 + 57);
        *(_OWORD *)(v72 + 48) = v76;
        ++v71;
        v70 += 80;
      }
      while (v73 + 10 != (void *)v68);
      uint64_t v52 = v9;
      unint64_t v100 = v71;
      if (v70)
      {
        long long v77 = (long long *)(v9 + v70);
        while (v68 != (TLCompositeTransliteratorCandidate *)a3)
        {
          uint64_t v78 = *v69;
          double v79 = TLCompositeTransliteratorCandidate::getTotalScore(v68, *(double *)(*v69 + 32));
          double v80 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)v9, *(double *)(v78 + 32));
          int v81 = *(char *)(v13 + 23);
          if (v79 <= v80)
          {
            if (v81 < 0) {
              operator delete(*(void **)v13);
            }
            long long v86 = *(_OWORD *)v9;
            *(void *)(v13 + 16) = *(void *)(v9 + 16);
            *(_OWORD *)uint64_t v13 = v86;
            *(unsigned char *)(v9 + 23) = 0;
            *(unsigned char *)uint64_t v9 = 0;
            long long v87 = (void **)(v13 + 24);
            if (*(char *)(v13 + 47) < 0) {
              operator delete(*v87);
            }
            long long v88 = *(_OWORD *)(v9 + 24);
            *(void *)(v13 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)(v9 + 40);
            *(_OWORD *)long long v87 = v88;
            *(unsigned char *)(v9 + 47) = 0;
            *(unsigned char *)(v9 + 24) = 0;
            long long v89 = *(_OWORD *)(v9 + 48);
            *(_OWORD *)(v13 + 57) = *(_OWORD *)(v9 + 57);
            *(_OWORD *)(v13 + 48) = v89;
            v9 += 80;
          }
          else
          {
            if (v81 < 0) {
              operator delete(*(void **)v13);
            }
            long long v82 = *(_OWORD *)v68;
            *(void *)(v13 + 16) = *((void *)v68 + 2);
            *(_OWORD *)uint64_t v13 = v82;
            *((unsigned char *)v68 + 23) = 0;
            *(unsigned char *)long long v68 = 0;
            uint64_t v83 = (void **)(v13 + 24);
            if (*(char *)(v13 + 47) < 0) {
              operator delete(*v83);
            }
            long long v84 = *(_OWORD *)((char *)v68 + 24);
            *(void *)(v13 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *((void *)v68 + 5);
            *(_OWORD *)uint64_t v83 = v84;
            *((unsigned char *)v68 + 47) = 0;
            *((unsigned char *)v68 + 24) = 0;
            long long v85 = *((_OWORD *)v68 + 3);
            *(_OWORD *)(v13 + 57) = *(_OWORD *)((char *)v68 + 57);
            *(_OWORD *)(v13 + 48) = v85;
            long long v68 = (TLCompositeTransliteratorCandidate *)((char *)v68 + 80);
          }
          v13 += 80;
          if (v77 == (long long *)v9) {
            goto LABEL_90;
          }
        }
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *,TLCompositeTransliteratorCandidate *>((uint64_t)&v101, (long long *)v9, v77, v13);
      }
      goto LABEL_90;
    }
  }
  else
  {
    uint64_t v42 = (uint64_t)a3;
    if (v15 != (TLCompositeTransliteratorCandidate *)a3)
    {
      uint64_t v43 = v15;
      double v44 = a4;
      uint64_t v45 = 0;
      unint64_t v46 = 0;
      do
      {
        uint64_t v47 = v9 + v45;
        long long v48 = (void *)((char *)v43 + v45);
        long long v49 = *(_OWORD *)((char *)v43 + v45);
        *(void *)(v47 + 16) = *(void *)((char *)v43 + v45 + 16);
        *(_OWORD *)uint64_t v47 = v49;
        v48[1] = 0;
        v48[2] = 0;
        *long long v48 = 0;
        long long v50 = *(_OWORD *)((char *)v43 + v45 + 24);
        *(void *)(v47 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)((char *)v43 + v45 + 40);
        *(_OWORD *)(v47 + 24) = v50;
        v48[4] = 0;
        v48[5] = 0;
        v48[3] = 0;
        long long v51 = *(_OWORD *)((char *)v43 + v45 + 48);
        *(_OWORD *)(v47 + 57) = *(_OWORD *)((char *)v43 + v45 + 57);
        *(_OWORD *)(v47 + 48) = v51;
        ++v46;
        v45 += 80;
      }
      while (v48 + 10 != a3);
      uint64_t v52 = v9;
      unint64_t v100 = v46;
      if (v45)
      {
        uint64_t v53 = v9 + v45;
        long long v54 = a3 - 10;
        while (v43 != (TLCompositeTransliteratorCandidate *)v13)
        {
          uint64_t v55 = v42;
          uint64_t v56 = *v44;
          double v57 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)(v53 - 80), *(double *)(*v44 + 32));
          double v58 = TLCompositeTransliteratorCandidate::getTotalScore((TLCompositeTransliteratorCandidate *)((char *)v43 - 80), *(double *)(v56 + 32));
          int v59 = *((char *)v54 + 23);
          if (v57 <= v58)
          {
            if (v59 < 0) {
              operator delete((void *)*v54);
            }
            long long v64 = *(_OWORD *)(v53 - 80);
            v54[2] = *(void *)(v53 - 64);
            *(_OWORD *)long long v54 = v64;
            *(unsigned char *)(v53 - 57) = 0;
            *(unsigned char *)(v53 - 8nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
            long long v65 = (void **)(v54 + 3);
            if (*((char *)v54 + 47) < 0) {
              operator delete(*v65);
            }
            long long v66 = *(_OWORD *)(v53 - 56);
            v54[5] = *(void *)(v53 - 40);
            *(_OWORD *)long long v65 = v66;
            uint64_t v63 = v53;
            v53 -= 80;
          }
          else
          {
            if (v59 < 0) {
              operator delete((void *)*v54);
            }
            long long v60 = *((_OWORD *)v43 - 5);
            v54[2] = *((void *)v43 - 8);
            *(_OWORD *)long long v54 = v60;
            *((unsigned char *)v43 - 57) = 0;
            *((unsigned char *)v43 - 8nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
            double v61 = (void **)(v54 + 3);
            if (*((char *)v54 + 47) < 0) {
              operator delete(*v61);
            }
            long long v62 = *(_OWORD *)((char *)v43 - 56);
            v54[5] = *((void *)v43 - 5);
            *(_OWORD *)double v61 = v62;
            uint64_t v63 = (uint64_t)v43;
            uint64_t v43 = (TLCompositeTransliteratorCandidate *)((char *)v43 - 80);
          }
          *(unsigned char *)(v63 - 33) = 0;
          *(unsigned char *)(v63 - 56) = 0;
          long long v67 = *(_OWORD *)(v63 - 32);
          *(_OWORD *)((char *)v54 + 57) = *(_OWORD *)(v63 - 23);
          *((_OWORD *)v54 + 3) = v67;
          uint64_t v42 = v55 - 80;
          v54 -= 10;
          if (v53 == v52) {
            goto LABEL_90;
          }
        }
        std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__unconstrained_reverse_iterator<TLCompositeTransliteratorCandidate *>,std::__unconstrained_reverse_iterator<TLCompositeTransliteratorCandidate *>,std::__unconstrained_reverse_iterator<std::__wrap_iter<TLCompositeTransliteratorCandidate *>>>((uint64_t)&v101, v53, v52, v42);
      }
      goto LABEL_90;
    }
  }
  uint64_t v52 = v9;
  unint64_t v100 = 0;
LABEL_90:
  if (v52) {
    std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(&v100, v52);
  }
}

void sub_260331F18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unint64_t a19)
{
  if (v19) {
    std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(&a19, v19);
  }
  _Unwind_Resume(exception_object);
}

void std::__destruct_n::__process[abi:ne180100]<TLCompositeTransliteratorCandidate>(unint64_t *a1, uint64_t a2)
{
  if (*a1)
  {
    unint64_t v3 = 0;
    uint64_t v4 = (char *)(a2 + 23);
    do
    {
      if (v4[24] < 0) {
        operator delete(*(void **)(v4 + 1));
      }
      if (*v4 < 0) {
        operator delete(*(void **)(v4 - 23));
      }
      v4 += 80;
      ++v3;
    }
    while (v3 < *a1);
  }
}

uint64_t std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__unconstrained_reverse_iterator<TLCompositeTransliteratorCandidate *>,std::__unconstrained_reverse_iterator<TLCompositeTransliteratorCandidate *>,std::__unconstrained_reverse_iterator<std::__wrap_iter<TLCompositeTransliteratorCandidate *>>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    uint64_t v7 = a4 - 80;
    do
    {
      if (*(char *)(v7 + 23) < 0) {
        operator delete(*(void **)v7);
      }
      uint64_t v8 = v5 - 80;
      long long v9 = *(_OWORD *)(v5 - 80);
      *(void *)(v7 + 16) = *(void *)(v5 - 64);
      *(_OWORD *)uint64_t v7 = v9;
      *(unsigned char *)(v5 - 57) = 0;
      *(unsigned char *)(v5 - 8nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = 0;
      uint64_t v10 = (void **)(v7 + 24);
      if (*(char *)(v7 + 47) < 0) {
        operator delete(*v10);
      }
      long long v11 = *(_OWORD *)(v5 - 56);
      *(void *)(v7 + 4nlp::CFScopedPtr<__CFString const*>::reset(&a9, 0) = *(void *)(v5 - 40);
      *(_OWORD *)uint64_t v10 = v11;
      *(unsigned char *)(v5 - 33) = 0;
      *(unsigned char *)(v5 - 56) = 0;
      long long v12 = *(_OWORD *)(v5 - 32);
      *(_OWORD *)(v7 + 57) = *(_OWORD *)(v5 - 23);
      *(_OWORD *)(v7 + 48) = v12;
      v4 -= 80;
      v7 -= 80;
      v5 -= 80;
    }
    while (v8 != a3);
    return a3;
  }
  return v5;
}

uint64_t *std::__rotate_forward[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<TLCompositeTransliteratorCandidate *>>(uint64_t *a1, long long *a2, long long *a3)
{
  uint64_t v4 = a2;
  uint64_t v10 = a2;
  long long v11 = a1;
  while (1)
  {
    std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(&v11, &v10);
    uint64_t v5 = v11 + 10;
    uint64_t v6 = v10 + 5;
    uint64_t v10 = v6;
    v11 += 10;
    if (v6 == a3) {
      break;
    }
    if (v5 == (uint64_t *)v4) {
      uint64_t v4 = v6;
    }
  }
  if (v5 != (uint64_t *)v4)
  {
    do
    {
      uint64_t v10 = v4;
      while (1)
      {
        std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<std::__wrap_iter<TLCompositeTransliteratorCandidate *> &,std::__wrap_iter<TLCompositeTransliteratorCandidate *> &>(&v11, &v10);
        uint64_t v7 = v11 + 10;
        uint64_t v8 = v10 + 5;
        uint64_t v10 = v8;
        v11 += 10;
        if (v8 == a3) {
          break;
        }
        if (v7 == (uint64_t *)v4) {
          uint64_t v4 = v8;
        }
      }
    }
    while (v7 != (uint64_t *)v4);
  }
  return v5;
}

void TLCreateStringWithValidatedFormat(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_26031A000, log, OS_LOG_TYPE_ERROR, "Failed to create string with format %@:%@", (uint8_t *)&v3, 0x16u);
}

void TLCompositeTransliteratorSeq2Seq::seq2SeqCandidatesForInput(char *a1, void *a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (*a1 >= 0) {
    int v3 = a2;
  }
  else {
    int v3 = (void *)*a2;
  }
  int v4 = 136315138;
  __int16 v5 = v3;
  _os_log_error_impl(&dword_26031A000, log, OS_LOG_TYPE_ERROR, "Failed to get seq2seq candidates for string: %s, translateString timedout", (uint8_t *)&v4, 0xCu);
}

void TLCompositeTransliterator::getTransliterationCandidates(int a1, char *a2, uint8_t *buf, os_log_t log)
{
  if (a2[23] >= 0) {
    __int16 v5 = a2;
  }
  else {
    __int16 v5 = *(char **)a2;
  }
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "Candidates";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = v5;
  _os_log_debug_impl(&dword_26031A000, log, OS_LOG_TYPE_DEBUG, "%s:\n %s", buf, 0x16u);
  if (a2[23] < 0) {
    operator delete(*(void **)a2);
  }
}

uint64_t CEMEmojiLocaleDataCreateEmojiTokensForString()
{
  return MEMORY[0x270F18BF0]();
}

uint64_t CEMEmojiTokenGetString()
{
  return MEMORY[0x270F18C38]();
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

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x270EE4590](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x270EE45C8](bundleID);
}

uint64_t CFBurstTrieAddUTF8String()
{
  return MEMORY[0x270EE4630]();
}

uint64_t CFBurstTrieCreate()
{
  return MEMORY[0x270EE4648]();
}

uint64_t CFBurstTrieCreateFromMapBytes()
{
  return MEMORY[0x270EE4660]();
}

uint64_t CFBurstTrieFindUTF8String()
{
  return MEMORY[0x270EE4680]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x270EE4690]();
}

uint64_t CFBurstTrieSerializeWithFileDescriptor()
{
  return MEMORY[0x270EE46A0]();
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4720](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateInvertedSet(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4728](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x270EE4738](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4748](alloc, theString);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFStringRef CFErrorCopyDescription(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x270EE49A0](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFTypeRef CFLocaleGetValue(CFLocaleRef locale, CFLocaleKey key)
{
  return (CFTypeRef)MEMORY[0x270EE4AD0](locale, key);
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

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateStringWithValidatedFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef validFormatSpecifiers, CFStringRef format, va_list arguments, CFErrorRef *errorPtr)
{
  return (CFStringRef)MEMORY[0x270EE50C8](alloc, formatOptions, validFormatSpecifiers, format, arguments, errorPtr);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x270EE50F8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x270EE5110](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3 = MEMORY[0x270EE5148](theString, stringToFind, compareOptions);
  result.length = v4;
  result.CFIndex location = v3;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5160](theString, stringToFind, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x270EE5170](theString, range.location, range.length, *(void *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
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

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x270EE5230](theString, suffix);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x270EE5338](url);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x270EE5348](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x270EE5390](allocator, url, pathComponent, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x270EE5430](url, resolveAgainstBase, buffer, maxBufLen);
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x270F474B0]();
}

uint64_t LXTransliterationCreate()
{
  return MEMORY[0x270F46FA0]();
}

uint64_t LXTransliterationEntryCopyNativeString()
{
  return MEMORY[0x270F46FA8]();
}

uint64_t LXTransliterationEnumerateForTransliterated()
{
  return MEMORY[0x270F46FB0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void language_modeling::v1::Probability::~Probability(language_modeling::v1::Probability *this)
{
}

uint64_t language_modeling::v1::LanguageModel::wireMemory(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x270F46C70](this);
}

uint64_t language_modeling::v1::LanguageModel::unwireMemory(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x270F46C78](this);
}

uint64_t language_modeling::v1::LanguageModel::init()
{
  return MEMORY[0x270F46C90]();
}

uint64_t language_modeling::v1::LanguageModel::LanguageModel(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x270F46C98](this);
}

void language_modeling::v1::LanguageModel::~LanguageModel(language_modeling::v1::LanguageModel *this)
{
}

uint64_t language_modeling::v1::LinguisticContext::push_back()
{
  return MEMORY[0x270F46CA8]();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x270F46CC0](this);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
}

uint64_t language_modeling::v1::LanguageModelSession::supportsFragmentsBasedConditionalProbability(language_modeling::v1::LanguageModelSession *this)
{
  return MEMORY[0x270F46CE0](this);
}

void language_modeling::v1::LanguageModelSession::~LanguageModelSession(language_modeling::v1::LanguageModelSession *this)
{
}

uint64_t language_modeling::v1::Probability::probability()
{
  return MEMORY[0x270F46D00]();
}

uint64_t language_modeling::v1::LanguageModel::makeDefaultSession(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x270F46D20](this);
}

uint64_t language_modeling::v1::LanguageModelSession::canReasonAbout()
{
  return MEMORY[0x270F46D38]();
}

uint64_t language_modeling::v1::LanguageModelSession::detailedConditionalProbability()
{
  return MEMORY[0x270F46D40]();
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

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x270F983B0](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98790]();
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

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
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

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x270ED7F00](*(void *)&a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x270ED98C8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fileno(FILE *a1)
{
  return MEMORY[0x270ED9978](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x270EDA118](*(void *)&a1, a2, *(void *)&a3);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x270EDB0A0](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}