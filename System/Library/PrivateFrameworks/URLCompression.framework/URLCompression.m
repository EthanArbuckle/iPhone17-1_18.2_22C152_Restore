void UC::appClipCodeVersion0Bytes(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *__p;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v3 = a2;
  v6 = vcvtpd_u64_f64((double)(unint64_t)(a2 + 1) * 0.125);
  v13 = 0;
  if (v6 <= 0x10) {
    v6 = 16;
  }
  v10 = 0;
  v11 = 0;
  __p = 0;
  v12 = 0;
  v7 = 8 * v6 - (a2 + 1);
  if (v7)
  {
    if (v7 <= 1) {
      v8 = 1;
    }
    else {
      v8 = 8 * v6 - (a2 + 1);
    }
    do
    {
      UC::UCBitVector::append((UC::UCBitVector *)&__p, 0);
      --v8;
    }
    while (v8);
  }
  UC::UCBitVector::append((UC::UCBitVector *)&__p, 1);
  for (; v3; --v3)
    UC::UCBitVector::append((UC::UCBitVector *)&__p, *a1++ != 48);
  UC::UCBitVector::getBytesCopy((UC::UCBitVector *)&__p, a3);
  if (__p)
  {
    v10 = __p;
    operator delete(__p);
  }
}

void sub_22E873644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void UC::appClipCodeVersion1Bytes(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v10 = 0;
  v7 = 0;
  uint64_t v8 = 0;
  __p = 0;
  char v9 = 0;
  if (a2)
  {
    uint64_t v4 = a2;
    do
    {
      UC::UCBitVector::append((UC::UCBitVector *)&__p, *a1++ != 48);
      --v4;
    }
    while (v4);
  }
  UC::UCBitVector::getBytesCopy((UC::UCBitVector *)&__p, a3);
  if (__p)
  {
    v7 = __p;
    operator delete(__p);
  }
}

void sub_22E8736F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void UC::bitVectorFromAppClipCodeEncodingData(UC *this@<X0>, const unsigned __int8 *a2@<X1>, void *a3@<X8>)
{
  v6 = operator new(0x28uLL);
  v6[4] = 0;
  v6[1] = 0;
  v6[2] = 0;
  void *v6 = 0;
  *((unsigned char *)v6 + 24) = 0;
  *a3 = v6;
  if (a2)
  {
    v7 = (UC::UCBitVector *)v6;
    uint64_t v8 = 0;
    do
    {
      unsigned int v9 = v8[(void)this];
      uint64_t v10 = 8;
      do
        UC::UCBitVector::append(v7, (v9 >> --v10) & 1);
      while (v10);
      ++v8;
    }
    while (v8 != a2);
  }
}

void sub_22E8737A8(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)v1, v2);
  _Unwind_Resume(a1);
}

BOOL UC::readUntilBeginMarkerFound(UC *this, UC::UCBitStream *a2)
{
  do
    BOOL hasMore = UC::UCBitStream::hasMore(this);
  while (hasMore && UC::UCBitStream::readNextBit(this) != 1);
  return hasMore;
}

void std::default_delete<UC::UCBitVector>::operator()[abi:ne180100](int a1, void **__p)
{
  if (__p)
  {
    v3 = *__p;
    if (*__p)
    {
      __p[1] = v3;
      operator delete(v3);
    }
    operator delete(__p);
  }
}

std::string *UC::UCURLComponents::UCURLComponents(std::string *this, long long *a2, long long *a3, long long *a4, long long *a5, long long *a6, long long *a7, std::string::size_type a8, long long *a9, long long *a10)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v17 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v17;
  }
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v18 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v18;
  }
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 2, *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v19 = *a4;
    this[2].__r_.__value_.__r.__words[2] = *((void *)a4 + 2);
    *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = v19;
  }
  if (*((char *)a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 3, *(const std::string::value_type **)a5, *((void *)a5 + 1));
  }
  else
  {
    long long v20 = *a5;
    this[3].__r_.__value_.__r.__words[2] = *((void *)a5 + 2);
    *(_OWORD *)&this[3].__r_.__value_.__l.__data_ = v20;
  }
  if (*((char *)a6 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 4, *(const std::string::value_type **)a6, *((void *)a6 + 1));
  }
  else
  {
    long long v21 = *a6;
    this[4].__r_.__value_.__r.__words[2] = *((void *)a6 + 2);
    *(_OWORD *)&this[4].__r_.__value_.__l.__data_ = v21;
  }
  if (*((char *)a7 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 5, *(const std::string::value_type **)a7, *((void *)a7 + 1));
  }
  else
  {
    long long v22 = *a7;
    this[5].__r_.__value_.__r.__words[2] = *((void *)a7 + 2);
    *(_OWORD *)&this[5].__r_.__value_.__l.__data_ = v22;
  }
  this[6].__r_.__value_.__r.__words[0] = a8;
  if (*((char *)a9 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)((char *)this + 152), *(const std::string::value_type **)a9, *((void *)a9 + 1));
  }
  else
  {
    long long v23 = *a9;
    this[7].__r_.__value_.__r.__words[0] = *((void *)a9 + 2);
    *(_OWORD *)&this[6].__r_.__value_.__r.__words[1] = v23;
  }
  v24 = (std::string *)((char *)this + 176);
  if (*((char *)a10 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v24, *(const std::string::value_type **)a10, *((void *)a10 + 1));
  }
  else
  {
    long long v25 = *a10;
    this[8].__r_.__value_.__r.__words[0] = *((void *)a10 + 2);
    *(_OWORD *)&v24->__r_.__value_.__l.__data_ = v25;
  }
  return this;
}

{
  return UC::UCURLComponents::UCURLComponents(this, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

void sub_22E873DF8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 175) < 0) {
    operator delete(*v6);
  }
  if (*(char *)(v1 + 143) < 0) {
    operator delete(*v7);
  }
  if (*(char *)(v1 + 119) < 0) {
    operator delete(*v5);
  }
  if (*(char *)(v1 + 95) < 0) {
    operator delete(*v4);
  }
  if (*(char *)(v1 + 71) < 0) {
    operator delete(*v3);
  }
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  v5 = this;
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
    v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_22E873FB0(_Unwind_Exception *a1)
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

void UC::UCBitVector::append(UC::UCBitVector *this, int a2)
{
  uint64_t v2 = *((void *)this + 4);
  char v3 = *((unsigned char *)this + 24) | (a2 << (~(_BYTE)v2 & 7));
  *((unsigned char *)this + 24) = v3;
  *((void *)this + 4) = ++v2;
  if ((v2 & 7) == 0)
  {
    std::string::size_type v6 = (unsigned char *)*((void *)this + 1);
    unint64_t v5 = *((void *)this + 2);
    if ((unint64_t)v6 >= v5)
    {
      unint64_t v8 = *(void *)this;
      unsigned int v9 = &v6[-*(void *)this];
      unint64_t v10 = (unint64_t)(v9 + 1);
      if ((uint64_t)(v9 + 1) < 0) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
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
        v13 = operator new(v12);
      }
      else {
        v13 = 0;
      }
      v14 = &v13[v12];
      v9[(void)v13] = v3;
      uint64_t v7 = (uint64_t)&v9[(void)v13 + 1];
      if (v6 == (unsigned char *)v8)
      {
        v13 = &v9[(void)v13];
      }
      else
      {
        v15 = &v6[~v8];
        do
        {
          char v16 = *--v6;
          (v15--)[(void)v13] = v16;
        }
        while (v6 != (unsigned char *)v8);
        std::string::size_type v6 = *(unsigned char **)this;
      }
      *(void *)this = v13;
      *((void *)this + 1) = v7;
      *((void *)this + 2) = v14;
      if (v6) {
        operator delete(v6);
      }
    }
    else
    {
      unsigned char *v6 = v3;
      uint64_t v7 = (uint64_t)(v6 + 1);
    }
    *((void *)this + 1) = v7;
    *((unsigned char *)this + 24) = 0;
  }
}

void UC::UCBitVector::getBytesCopy(UC::UCBitVector *this@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v4 = *((void *)this + 4) & 7;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(a2, *(const void **)this, *((void *)this + 1), *((void *)this + 1) - *(void *)this);
  if (v4)
  {
    std::string::size_type v6 = (unsigned char *)a2[1];
    unint64_t v5 = a2[2];
    if ((unint64_t)v6 >= v5)
    {
      unint64_t v8 = *a2;
      unsigned int v9 = &v6[-*a2];
      unint64_t v10 = (unint64_t)(v9 + 1);
      if ((uint64_t)(v9 + 1) < 0) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
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
      v14 = (char *)(v13 + v12);
      v9[v13] = *((unsigned char *)this + 24);
      uint64_t v7 = (uint64_t)&v9[v13 + 1];
      if (v6 == (unsigned char *)v8)
      {
        v13 += (unint64_t)v9;
      }
      else
      {
        v15 = &v6[~v8];
        do
        {
          char v16 = *--v6;
          (v15--)[v13] = v16;
        }
        while (v6 != (unsigned char *)v8);
        std::string::size_type v6 = (unsigned char *)*a2;
      }
      *a2 = v13;
      a2[1] = v7;
      a2[2] = (unint64_t)v14;
      if (v6) {
        operator delete(v6);
      }
    }
    else
    {
      unsigned char *v6 = *((unsigned char *)this + 24);
      uint64_t v7 = (uint64_t)(v6 + 1);
    }
    a2[1] = v7;
  }
}

void sub_22E874234(_Unwind_Exception *exception_object)
{
  char v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

UC::UCBitStream *UC::UCBitStream::UCBitStream(UC::UCBitStream *this, const UC::UCBitVector *a2)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(this, *(const void **)a2, *((void *)a2 + 1), *((void *)a2 + 1) - *(void *)a2);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  *((void *)this + 5) = 0;
  return this;
}

BOOL UC::UCBitStream::hasMore(UC::UCBitStream *this)
{
  return *((void *)this + 5) < *((void *)this + 4);
}

uint64_t UC::UCBitStream::readNextBit(UC::UCBitStream *this)
{
  unint64_t v1 = *((void *)this + 5);
  if (v1 >= *((void *)this + 4))
  {
    exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
    std::out_of_range::out_of_range[abi:ne180100](exception, "Out of bounds access when reading next bit from bit stream");
  }
  if (v1 >= 8 * (*((void *)this + 1) - *(void *)this)) {
    uint64_t v2 = (unsigned __int8 *)this + 24;
  }
  else {
    uint64_t v2 = (unsigned __int8 *)(*(void *)this + (v1 >> 3));
  }
  uint64_t v3 = (*v2 >> (~(_BYTE)v1 & 7)) & 1;
  *((void *)this + 5) = v1 + 1;
  return v3;
}

void sub_22E874344(_Unwind_Exception *a1)
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

void *std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(void *result, const void *a2, uint64_t a3, size_t __sz)
{
  if (__sz)
  {
    std::string::size_type v6 = result;
    result = std::vector<unsigned char>::__vallocate[abi:ne180100](result, __sz);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_22E8743EC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<unsigned char>::__vallocate[abi:ne180100](void *a1, size_t __sz)
{
  if ((__sz & 0x8000000000000000) != 0) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void *UC::SUE::SegmentedURLEncoderImpl::SegmentedURLEncoderImpl(void *result, void *a2)
{
  uint64_t v2 = a2[1];
  char *result = *a2;
  result[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  result[2] = 0;
  return result;
}

void UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols(std::string::value_type *a1@<X1>, uint64_t a2@<X2>, uint64_t *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a2)
  {
    uint64_t v3 = a2;
    do
    {
      std::string::value_type v6 = *a1;
      memset(&v10, 0, sizeof(v10));
      std::string::push_back(&v10, v6);
      unint64_t v7 = a3[1];
      if (v7 >= a3[2])
      {
        uint64_t v9 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (long long *)&v10);
      }
      else
      {
        if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a3[1], v10.__r_.__value_.__l.__data_, v10.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v8 = *(_OWORD *)&v10.__r_.__value_.__l.__data_;
          *(void *)(v7 + 16) = *((void *)&v10.__r_.__value_.__l + 2);
          *(_OWORD *)unint64_t v7 = v8;
        }
        uint64_t v9 = v7 + 24;
        a3[1] = v7 + 24;
      }
      a3[1] = v9;
      if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v10.__r_.__value_.__l.__data_);
      }
      ++a1;
      --v3;
    }
    while (v3);
  }
}

void sub_22E874548(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  v15[1] = v16;
  if (a15 < 0) {
    operator delete(__p);
  }
  __p = v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_encodeHost(std::string *this@<X1>, UC::SUE::UCSegmentedURLCoderProvider **a2@<X0>, int a3@<W2>, int *a4@<X8>)
{
  unint64_t v5 = this;
  *(void *)&long long v62 = *MEMORY[0x263EF8340];
  memset(&v58, 0, sizeof(v58));
  *(_DWORD *)((char *)v57 + 3) = 0;
  v57[0] = 0;
  std::string::size_type v8 = std::string::rfind(this, 46, 0xFFFFFFFFFFFFFFFFLL);
  if (v8 == -1)
  {
    unsigned int v12 = 0;
    std::string v10 = 0;
    std::string::operator=(&v58, v5);
    std::string::size_type size = 0;
  }
  else
  {
    std::string::size_type v9 = v8;
    std::string::basic_string(&v56, v5, v8, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v54);
    std::string::size_type size = v56.__r_.__value_.__l.__size_;
    std::string v10 = (std::string::value_type *)v56.__r_.__value_.__r.__words[0];
    v57[0] = v56.__r_.__value_.__r.__words[2];
    *(_DWORD *)((char *)v57 + 3) = *(_DWORD *)((char *)&v56.__r_.__value_.__r.__words[2] + 3);
    unsigned int v12 = HIBYTE(v56.__r_.__value_.__r.__words[2]);
    std::string::basic_string(&v56, v5, 0, v9, (std::allocator<char> *)v54);
    if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v58.__r_.__value_.__l.__data_);
    }
    std::string v58 = v56;
  }
  if (a3)
  {
    std::string::push_back(v5, 124);
    std::string::push_back(&v58, 124);
  }
  if (SHIBYTE(v5->__r_.__value_.__r.__words[2]) < 0)
  {
    v14 = v5;
    unint64_t v5 = (std::string *)v5->__r_.__value_.__r.__words[0];
    uint64_t v13 = v14->__r_.__value_.__l.__size_;
  }
  else
  {
    uint64_t v13 = HIBYTE(v5->__r_.__value_.__r.__words[2]);
  }
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v5, v13, (uint64_t *)&v56);
  v54[0] = 0;
  v54[1] = 0;
  v55 = 0;
  UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(*a2, &v51);
  (*(void (**)(void **__return_ptr))(*(void *)v51 + 40))(v53);
  *(_OWORD *)v54 = *(_OWORD *)v53;
  v55 = v53[2];
  HIBYTE(v53[2]) = 0;
  LOBYTE(v53[0]) = 0;
  if ((void)v52) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v52);
  }
  memset(v53, 0, sizeof(v53));
  v51 = 0;
  long long v52 = 0uLL;
  if ((v12 & 0x80u) == 0) {
    std::string::size_type v15 = v12;
  }
  else {
    std::string::size_type v15 = size;
  }
  if (!v15)
  {
    long long v18 = 0;
    unsigned int v19 = 0;
    long long v20 = 0;
    unsigned int v21 = 0;
    goto LABEL_62;
  }
  if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v16 = &v58;
  }
  else {
    uint64_t v16 = (std::string *)v58.__r_.__value_.__r.__words[0];
  }
  if ((v58.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v17 = HIBYTE(v58.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v17 = v58.__r_.__value_.__l.__size_;
  }
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v16, v17, v50);
  UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(*a2, &v44);
  ((void (*)(void **__return_ptr))v44->__vftable[1].~__shared_weak_count)(&__p);
  if (v45) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v45);
  }
  if ((v12 & 0x80) != 0)
  {
    std::string::__init_copy_ctor_external(&v61, v10, size);
  }
  else
  {
    v61.__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
    v61.__r_.__value_.__l.__size_ = size;
    LODWORD(v61.__r_.__value_.__r.__words[2]) = v57[0];
    *(_DWORD *)((char *)&v61.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v57 + 3);
    *((unsigned char *)&v61.__r_.__value_.__s + 23) = v12;
  }
  v44 = 0;
  v45 = 0;
  v46 = 0;
  v59 = &v44;
  LOBYTE(v60) = 0;
  v44 = (std::__shared_weak_count *)operator new(0x18uLL);
  v45 = v44;
  v46 = (std::string *)&v44[1];
  v45 = (std::__shared_weak_count *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v46, (long long *)&v61, &v62, (std::string *)v44);
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v61.__r_.__value_.__l.__data_);
  }
  UC::SUE::UCSegmentedURLCoderProvider::getTLDCoder((uint64_t)*a2, &v61);
  int v22 = (*(uint64_t (**)(std::string::size_type, std::__shared_weak_count **))(*(void *)v61.__r_.__value_.__l.__data_
                                                                                       + 16))(v61.__r_.__value_.__r.__words[0], &v44);
  if (v61.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v61.__r_.__value_.__l.__size_);
  }
  if (v22)
  {
    UC::SUE::UCSegmentedURLCoderProvider::getTLDCoder((uint64_t)*a2, &v59);
    ((void (*)(std::string *__return_ptr))(*v59)[1].__shared_weak_owners_)(&v61);
    if ((v49 & 0x80u) == 0) {
      p_p = (const std::string::value_type *)&__p;
    }
    else {
      p_p = (const std::string::value_type *)__p;
    }
    if ((v49 & 0x80u) == 0) {
      std::string::size_type v24 = v49;
    }
    else {
      std::string::size_type v24 = v48;
    }
    long long v25 = std::string::append(&v61, p_p, v24);
    v26 = (void *)v25->__r_.__value_.__r.__words[0];
    v53[1] = (void *)v25->__r_.__value_.__l.__size_;
    *(void **)((char *)&v53[1] + 7) = *(void **)((char *)&v25->__r_.__value_.__r.__words[1] + 7);
    unsigned int v21 = HIBYTE(v25->__r_.__value_.__r.__words[2]);
    v25->__r_.__value_.__l.__size_ = 0;
    v25->__r_.__value_.__r.__words[2] = 0;
    v25->__r_.__value_.__r.__words[0] = 0;
    v53[0] = v26;
    HIBYTE(v53[2]) = v21;
    if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v61.__r_.__value_.__l.__data_);
    }
    if (v60) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v60);
    }
  }
  else
  {
    UC::SUE::UCSegmentedURLCoderProvider::getTLDFixedLengthCoder(*a2, &v61);
    unsigned int v21 = (*(uint64_t (**)(std::string::size_type, std::__shared_weak_count **))(*(void *)v61.__r_.__value_.__l.__data_
                                                                                         + 16))(v61.__r_.__value_.__r.__words[0], &v44);
    if (v61.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v61.__r_.__value_.__l.__size_);
    }
    if (v21)
    {
      UC::SUE::UCSegmentedURLCoderProvider::getTLDFixedLengthCoder(*a2, &v59);
      ((void (*)(std::string *__return_ptr))(*v59)[1].__shared_weak_owners_)(&v61);
      if ((v49 & 0x80u) == 0) {
        v27 = (const std::string::value_type *)&__p;
      }
      else {
        v27 = (const std::string::value_type *)__p;
      }
      if ((v49 & 0x80u) == 0) {
        std::string::size_type v28 = v49;
      }
      else {
        std::string::size_type v28 = v48;
      }
      v29 = std::string::append(&v61, v27, v28);
      long long v18 = (void *)v29->__r_.__value_.__r.__words[0];
      *(void *)&long long v52 = v29->__r_.__value_.__l.__size_;
      *(void *)((char *)&v52 + 7) = *(std::string::size_type *)((char *)&v29->__r_.__value_.__r.__words[1] + 7);
      unsigned int v19 = HIBYTE(v29->__r_.__value_.__r.__words[2]);
      v29->__r_.__value_.__l.__size_ = 0;
      v29->__r_.__value_.__r.__words[2] = 0;
      v29->__r_.__value_.__r.__words[0] = 0;
      v51 = v18;
      HIBYTE(v52) = v19;
      if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v61.__r_.__value_.__l.__data_);
      }
      if (v60) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v60);
      }
      unsigned int v21 = 0;
      goto LABEL_59;
    }
  }
  long long v18 = 0;
  unsigned int v19 = 0;
LABEL_59:
  v61.__r_.__value_.__r.__words[0] = (std::string::size_type)&v44;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v61);
  if ((char)v49 < 0) {
    operator delete(__p);
  }
  __p = v50;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  long long v20 = v53[1];
  std::string::size_type v15 = v52;
LABEL_62:
  int v30 = SHIBYTE(v55);
  v31 = v54[1];
  if (SHIBYTE(v55) >= 0) {
    v32 = (void *)HIBYTE(v55);
  }
  else {
    v32 = v54[1];
  }
  unint64_t v33 = v21;
  if ((v21 & 0x80u) != 0) {
    unint64_t v33 = (unint64_t)v20;
  }
  if ((v19 & 0x80u) == 0) {
    unint64_t v34 = v19;
  }
  else {
    unint64_t v34 = v15;
  }
  BOOL v35 = v33 != 0 && v33 < (unint64_t)v32;
  v36 = v54;
  if (v33 != 0 && v33 < (unint64_t)v32)
  {
    v36 = v53;
    v32 = (void *)v33;
    int v37 = 0;
  }
  else
  {
    int v37 = 2;
  }
  if (v35) {
    char v38 = v21;
  }
  else {
    char v38 = HIBYTE(v55);
  }
  BOOL v39 = v34 != 0 && v34 < (unint64_t)v32;
  v40 = &v51;
  if (v39) {
    int v37 = 1;
  }
  else {
    v40 = v36;
  }
  *a4 = v37;
  v41 = (std::string *)(a4 + 2);
  if (v39) {
    char v42 = v19;
  }
  else {
    char v42 = v38;
  }
  if (v42 < 0)
  {
    if (!v35) {
      long long v20 = v31;
    }
    if (v39) {
      std::string::size_type v43 = v15;
    }
    else {
      std::string::size_type v43 = (std::string::size_type)v20;
    }
    std::string::__init_copy_ctor_external(v41, (const std::string::value_type *)*v40, v43);
  }
  else
  {
    *(_OWORD *)&v41->__r_.__value_.__l.__data_ = *(_OWORD *)v40;
    v41->__r_.__value_.__r.__words[2] = (std::string::size_type)v40[2];
  }
  if ((v19 & 0x80) == 0)
  {
    if ((v21 & 0x80) == 0) {
      goto LABEL_92;
    }
LABEL_99:
    operator delete(v53[0]);
    if ((v30 & 0x80000000) == 0) {
      goto LABEL_93;
    }
    goto LABEL_100;
  }
  operator delete(v18);
  if ((v21 & 0x80) != 0) {
    goto LABEL_99;
  }
LABEL_92:
  if ((v30 & 0x80000000) == 0) {
    goto LABEL_93;
  }
LABEL_100:
  operator delete(v54[0]);
LABEL_93:
  v54[0] = &v56;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v54);
  if ((v12 & 0x80) != 0) {
    operator delete(v10);
  }
  if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v58.__r_.__value_.__l.__data_);
  }
}

void sub_22E874BC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, char *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,char *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,char a38)
{
  if (*(char *)(v40 - 89) < 0) {
    operator delete(*(void **)(v40 - 112));
  }
  char v42 = *(std::__shared_weak_count **)(v40 - 120);
  if (v42) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v42);
  }
  *(void *)(v40 - 112) = &a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v40 - 112));
  if (a18 < 0) {
    operator delete(__p);
  }
  __p = &a19;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (a36 < 0) {
    operator delete(a31);
  }
  a31 = &a38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a31);
  if (v39 < 0) {
    operator delete(v38);
  }
  if (*(char *)(v40 - 137) < 0) {
    operator delete(*(void **)(v40 - 160));
  }
  _Unwind_Resume(a1);
}

void UC::Exception::CoderError::~CoderError(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26E242A70;
  if (SHIBYTE(this[10].__vftable) < 0) {
    operator delete(this[8].__vftable);
  }
  if (SHIBYTE(this[7].__vftable) < 0) {
    operator delete(this[5].__vftable);
  }
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

{
  void *v2;
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26E242A70;
  if (SHIBYTE(this[10].__vftable) < 0) {
    operator delete(this[8].__vftable);
  }
  if (SHIBYTE(this[7].__vftable) < 0) {
    operator delete(this[5].__vftable);
  }
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  operator delete(v2);
}

void __clang_call_terminate(void *a1)
{
}

void UC::SUE::SegmentedURLEncoderImpl::clearCaches(UC::SUE::UCSegmentedURLCoderProvider **this)
{
}

void UC::SUE::SegmentedURLEncoderImpl::encodeURL(UC::SUE::SegmentedURLEncoderImpl *this@<X0>, const UC::UCURLComponents *a2@<X1>, std::string *a3@<X8>)
{
  if (!*((void *)this + 2))
  {
    std::string::value_type v6 = operator new(8uLL);
    void *v6 = &unk_26E242B30;
    *((void *)this + 2) = v6;
  }
  unint64_t v7 = (char *)a2 + 24;
  int v8 = *((char *)a2 + 47);
  if (v8 < 0)
  {
    if (*((void *)a2 + 4) != 5)
    {
LABEL_275:
      exception = __cxa_allocate_exception(0x58uLL);
      UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 1, "", 0, "Only encoding of the scheme https is supported", 46);
      goto LABEL_279;
    }
    unint64_t v7 = *(char **)v7;
  }
  else if (v8 != 5)
  {
    goto LABEL_275;
  }
  int v9 = *(_DWORD *)v7;
  int v10 = v7[4];
  if (v9 != 1886680168 || v10 != 115) {
    goto LABEL_275;
  }
  if (*((void *)a2 + 18))
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 2, "", 0, "Encoding of URLs with port is not supported", 43);
    goto LABEL_279;
  }
  uint64_t v12 = *((unsigned __int8 *)a2 + 175);
  if ((v12 & 0x80u) != 0) {
    uint64_t v12 = *((void *)a2 + 20);
  }
  if (v12)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 3, "", 0, "Encoding of URLs with user is not supported", 43);
    goto LABEL_279;
  }
  uint64_t v13 = *((unsigned __int8 *)a2 + 199);
  if ((v13 & 0x80u) != 0) {
    uint64_t v13 = *((void *)a2 + 23);
  }
  if (v13)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 4, "", 0, "Encoding of URLs with password is not supported", 47);
LABEL_279:
  }
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  a3[1].__r_.__value_.__r.__words[2] = 0;
  if (*((char *)a2 + 71) < 0) {
    std::string::__init_copy_ctor_external(&__str, *((const std::string::value_type **)a2 + 6), *((void *)a2 + 7));
  }
  else {
    std::string __str = *(std::string *)((unsigned char *)a2 + 2);
  }
  std::string::size_type size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __str.__r_.__value_.__l.__size_;
  }
  if (!size)
  {
    v100 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v100, "UCSegmentedURLCoderErrorDomain", 0x1EuLL, 5, "", 0, "The URL must have a host component", 0x22uLL);
  }
  memset(&v123, 0, sizeof(v123));
  if (*((char *)a2 + 95) >= 0) {
    uint64_t v15 = *((unsigned __int8 *)a2 + 95);
  }
  else {
    uint64_t v15 = *((void *)a2 + 10);
  }
  if (*((char *)a2 + 119) >= 0) {
    uint64_t v16 = *((unsigned __int8 *)a2 + 119);
  }
  else {
    uint64_t v16 = *((void *)a2 + 13);
  }
  if (*((char *)a2 + 143) >= 0) {
    uint64_t v17 = *((unsigned __int8 *)a2 + 143);
  }
  else {
    uint64_t v17 = *((void *)a2 + 16);
  }
  std::string::basic_string[abi:ne180100]<0>(&v120, "appclip.");
  std::string::size_type v18 = v122;
  if ((v122 & 0x80u) == 0) {
    unsigned int v19 = (char *)&v120;
  }
  else {
    unsigned int v19 = v120;
  }
  if ((v122 & 0x80u) == 0) {
    std::string::size_type v20 = v122;
  }
  else {
    std::string::size_type v20 = v121;
  }
  if (v20)
  {
    unsigned int v21 = (unsigned __int8 *)&v19[v20];
    p_str = &__str;
    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    while (*v19 == p_str->__r_.__value_.__s.__data_[0])
    {
      ++v19;
      p_str = (std::string *)((char *)p_str + 1);
      if (!--v20)
      {
        unsigned int v19 = (char *)v21;
        break;
      }
    }
  }
  if ((v122 & 0x80) != 0)
  {
    if (v19 == &v120[v121])
    {
      std::string::size_type v18 = v121;
LABEL_62:
      std::string::basic_string((std::string *)&__x, &__str, v18, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v108);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__str.__r_.__value_.__l.__data_);
      }
      *(_OWORD *)&__str.__r_.__value_.__l.__data_ = *(_OWORD *)&__x.__first_;
      __str.__r_.__value_.__r.__words[2] = (std::string::size_type)__x.__end_;
      std::string::basic_string[abi:ne180100]<0>(&v117, "1");
      std::vector<std::string>::pointer end = v123.__end_;
      if (v123.__end_ >= v123.__end_cap_.__value_)
      {
        unint64_t v31 = 0xAAAAAAAAAAAAAAABLL * (((char *)v123.__end_ - (char *)v123.__begin_) >> 3);
        unint64_t v32 = v31 + 1;
        if (v31 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v123.__end_cap_.__value_ - (char *)v123.__begin_) >> 3) > v32) {
          unint64_t v32 = 0x5555555555555556 * (((char *)v123.__end_cap_.__value_ - (char *)v123.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v123.__end_cap_.__value_ - (char *)v123.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v33 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v33 = v32;
        }
        __x.__end_cap_.__value_ = (std::allocator<std::string> *)&v123.__end_cap_;
        if (v33) {
          unint64_t v34 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v123.__end_cap_, v33);
        }
        else {
          unint64_t v34 = 0;
        }
        char v39 = v34 + v31;
        __x.__first_ = v34;
        __x.__begin_ = v39;
        __x.__end_cap_.__value_ = &v34[v33];
        long long v40 = v117;
        v39->__r_.__value_.__r.__words[2] = v118;
        *(_OWORD *)&v39->__r_.__value_.__l.__data_ = v40;
        std::string::size_type v118 = 0;
        long long v117 = 0uLL;
        __x.__end_ = v39 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v123, &__x);
        v41 = v123.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__x);
        v123.__end_ = v41;
        if (SHIBYTE(v118) < 0) {
          operator delete((void *)v117);
        }
      }
      else
      {
        long long v30 = v117;
        v123.__end_->__r_.__value_.__r.__words[2] = v118;
        *(_OWORD *)&end->__r_.__value_.__l.__data_ = v30;
        v123.__end_ = end + 1;
      }
      int v38 = 1;
      goto LABEL_82;
    }
  }
  else if (v19 == (char *)&v120 + v122)
  {
    goto LABEL_62;
  }
  std::string::basic_string[abi:ne180100]<0>(&v117, "0");
  std::vector<std::string>::pointer v23 = v123.__end_;
  if (v123.__end_ >= v123.__end_cap_.__value_)
  {
    unint64_t v25 = 0xAAAAAAAAAAAAAAABLL * (((char *)v123.__end_ - (char *)v123.__begin_) >> 3);
    unint64_t v26 = v25 + 1;
    if (v25 + 1 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    if (0x5555555555555556 * (((char *)v123.__end_cap_.__value_ - (char *)v123.__begin_) >> 3) > v26) {
      unint64_t v26 = 0x5555555555555556 * (((char *)v123.__end_cap_.__value_ - (char *)v123.__begin_) >> 3);
    }
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v123.__end_cap_.__value_ - (char *)v123.__begin_) >> 3) >= 0x555555555555555) {
      unint64_t v27 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v27 = v26;
    }
    __x.__end_cap_.__value_ = (std::allocator<std::string> *)&v123.__end_cap_;
    if (v27) {
      std::string::size_type v28 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v123.__end_cap_, v27);
    }
    else {
      std::string::size_type v28 = 0;
    }
    BOOL v35 = v28 + v25;
    __x.__first_ = v28;
    __x.__begin_ = v35;
    __x.__end_cap_.__value_ = &v28[v27];
    long long v36 = v117;
    v35->__r_.__value_.__r.__words[2] = v118;
    *(_OWORD *)&v35->__r_.__value_.__l.__data_ = v36;
    std::string::size_type v118 = 0;
    long long v117 = 0uLL;
    __x.__end_ = v35 + 1;
    std::vector<std::string>::__swap_out_circular_buffer(&v123, &__x);
    int v37 = v123.__end_;
    std::__split_buffer<std::string>::~__split_buffer(&__x);
    v123.__end_ = v37;
    if (SHIBYTE(v118) < 0) {
      operator delete((void *)v117);
    }
  }
  else
  {
    long long v24 = v117;
    v123.__end_->__r_.__value_.__r.__words[2] = v118;
    *(_OWORD *)&v23->__r_.__value_.__l.__data_ = v24;
    v123.__end_ = v23 + 1;
  }
  int v38 = 0;
LABEL_82:
  UC::SUE::UCSegmentedURLEncodingResult::setSpecialSubdomainType((uint64_t)a3, v38);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v116, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
  }
  else {
    std::string v116 = __str;
  }
  uint64_t v42 = v16 + v15;
  uint64_t v43 = -v17;
  UC::SUE::SegmentedURLEncoderImpl::_encodeHost(&v116, (UC::SUE::UCSegmentedURLCoderProvider **)this, v16 + v15 != -v17, (int *)&v117);
  if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v116.__r_.__value_.__l.__data_);
  }
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForHostFormatType(v117, &__x);
  if ((v119 & 0x80u) == 0) {
    v44 = (char *)&v117 + 8;
  }
  else {
    v44 = (const std::string::value_type *)*((void *)&v117 + 1);
  }
  if ((v119 & 0x80u) == 0) {
    std::string::size_type v45 = v119;
  }
  else {
    std::string::size_type v45 = v118;
  }
  v46 = std::string::append((std::string *)&__x, v44, v45);
  long long v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
  std::string::size_type v115 = v46->__r_.__value_.__r.__words[2];
  long long v114 = v47;
  v46->__r_.__value_.__l.__size_ = 0;
  v46->__r_.__value_.__r.__words[2] = 0;
  v46->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__x.__end_) < 0) {
    operator delete(__x.__first_);
  }
  std::vector<std::string>::pointer v48 = v123.__end_;
  if (v123.__end_ >= v123.__end_cap_.__value_)
  {
    v50 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v123, &v114);
  }
  else
  {
    if (SHIBYTE(v115) < 0)
    {
      std::string::__init_copy_ctor_external(v123.__end_, (const std::string::value_type *)v114, *((std::string::size_type *)&v114 + 1));
    }
    else
    {
      long long v49 = v114;
      v123.__end_->__r_.__value_.__r.__words[2] = v115;
      *(_OWORD *)&v48->__r_.__value_.__l.__data_ = v49;
    }
    v50 = v48 + 1;
  }
  v123.__end_ = v50;
  int v51 = v117;
  long long v52 = (std::string *)operator new(0x20uLL);
  UC::SUE::UCSegmentedURLEncodingResult::HostResult::HostResult(v52, (long long *)((char *)&v117 + 8), v42 != v43, v51);
  v112 = v52;
  v113 = 0;
  UC::SUE::UCSegmentedURLEncodingResult::setHostEncodingResult((uint64_t)a3, (uint64_t *)&v112);
  v53 = (void **)v112;
  v112 = 0;
  if (v53) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&v112, v53);
  }
  memset(&__p, 0, sizeof(__p));
  memset(&v110, 0, sizeof(v110));
  uint64_t v54 = *((unsigned __int8 *)a2 + 143);
  if ((v54 & 0x80u) != 0) {
    uint64_t v54 = *((void *)a2 + 16);
  }
  if (!v54)
  {
    UC::SUE::SegmentedURLEncoderImpl::_tryEncodingSegmentedPathAndQuery((UC::SUE::UCSegmentedURLCoderProvider **)this, (uint64_t *)a2 + 9, (uint64_t *)a2 + 12, &__x);
    int value_low = LOBYTE(__x.__end_cap_.__value_);
    if (LOBYTE(__x.__end_cap_.__value_))
    {
      if (SHIBYTE(__x.__end_) < 0)
      {
        std::string::__init_copy_ctor_external(&v108, (const std::string::value_type *)__x.__first_, (std::string::size_type)__x.__begin_);
      }
      else
      {
        *(_OWORD *)&v108.__r_.__value_.__l.__data_ = *(_OWORD *)&__x.__first_;
        v108.__r_.__value_.__r.__words[2] = (std::string::size_type)__x.__end_;
      }
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&v108, "");
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::string __p = v108;
    UC::SUE::SegmentedURLEncoderImpl::_tryEncodingWithPathWordBookAndAutoQueryTemplateFormat((UC::SUE::UCSegmentedURLCoderProvider **)this, (uint64_t)a2 + 72, (uint64_t)a2 + 96, &v108);
    if (v109)
    {
      if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v107, v108.__r_.__value_.__l.__data_, v108.__r_.__value_.__l.__size_);
      }
      else {
        std::string v107 = v108;
      }
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(&v107, "");
    }
    if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v110.__r_.__value_.__l.__data_);
    }
    std::string v110 = v107;
    if (v109 && SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v108.__r_.__value_.__l.__data_);
    }
    if (value_low && SHIBYTE(__x.__end_) < 0) {
      operator delete(__x.__first_);
    }
  }
  if (*((char *)a2 + 95) < 0) {
    std::string::__init_copy_ctor_external(&v108, *((const std::string::value_type **)a2 + 9), *((void *)a2 + 10));
  }
  else {
    std::string v108 = *(std::string *)((unsigned char *)a2 + 3);
  }
  uint64_t v56 = *((unsigned __int8 *)a2 + 119);
  if ((v56 & 0x80u) != 0) {
    uint64_t v56 = *((void *)a2 + 13);
  }
  if (v56)
  {
    std::operator+<char>();
    v57 = SHIBYTE(__x.__end_) >= 0
        ? (const std::string::value_type *)&__x
        : (const std::string::value_type *)__x.__first_;
    std::__split_buffer<std::string>::pointer v58 = SHIBYTE(__x.__end_) >= 0 ? (std::__split_buffer<std::string>::pointer)HIBYTE(__x.__end_) : __x.__begin_;
    std::string::append(&v108, v57, (std::string::size_type)v58);
    if (SHIBYTE(__x.__end_) < 0) {
      operator delete(__x.__first_);
    }
  }
  uint64_t v59 = *((unsigned __int8 *)a2 + 143);
  if ((v59 & 0x80u) != 0) {
    uint64_t v59 = *((void *)a2 + 16);
  }
  if (v59)
  {
    std::operator+<char>();
    v60 = SHIBYTE(__x.__end_) >= 0
        ? (const std::string::value_type *)&__x
        : (const std::string::value_type *)__x.__first_;
    std::__split_buffer<std::string>::pointer v61 = SHIBYTE(__x.__end_) >= 0 ? (std::__split_buffer<std::string>::pointer)HIBYTE(__x.__end_) : __x.__begin_;
    std::string::append(&v108, v60, (std::string::size_type)v61);
    if (SHIBYTE(__x.__end_) < 0) {
      operator delete(__x.__first_);
    }
  }
  char end_high = HIBYTE(v108.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v63 = v108.__r_.__value_.__l.__size_;
    if (!v108.__r_.__value_.__l.__size_)
    {
      memset(&v107, 0, sizeof(v107));
      goto LABEL_183;
    }
    v64 = (std::string *)v108.__r_.__value_.__r.__words[0];
  }
  else
  {
    if (!*((unsigned char *)&v108.__r_.__value_.__s + 23))
    {
      memset(&v107, 0, sizeof(v107));
      goto LABEL_167;
    }
    std::string::size_type v63 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
    v64 = &v108;
  }
  if (v64->__r_.__value_.__s.__data_[0] == 47)
  {
    if (v63 == 1) {
      goto LABEL_161;
    }
    v65 = (std::string *)v108.__r_.__value_.__r.__words[0];
    if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v65 = &v108;
    }
    if (v65->__r_.__value_.__s.__data_[1] != 35)
    {
LABEL_161:
      std::string::basic_string((std::string *)&__x, &v108, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v107);
      if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v108.__r_.__value_.__l.__data_);
      }
      v108.__r_.__value_.__r.__words[2] = (std::string::size_type)__x.__end_;
      *(_OWORD *)&v108.__r_.__value_.__l.__data_ = *(_OWORD *)&__x.__first_;
      char end_high = HIBYTE(__x.__end_);
    }
  }
  memset(&v107, 0, sizeof(v107));
  if (end_high < 0)
  {
LABEL_183:
    if (!v108.__r_.__value_.__l.__size_) {
      goto LABEL_184;
    }
    goto LABEL_168;
  }
LABEL_167:
  if (!end_high)
  {
LABEL_184:
    std::string::size_type v68 = 0;
    goto LABEL_185;
  }
LABEL_168:
  if (std::string::find(&v108, 124, 0) != -1)
  {
    v101 = __cxa_allocate_exception(0x58uLL);
    std::string::basic_string[abi:ne180100]<0>(&__x, "|");
    if (SHIBYTE(__x.__end_) >= 0) {
      p_x = &__x;
    }
    else {
      p_x = __x.__first_;
    }
    if (SHIBYTE(__x.__end_) >= 0) {
      size_t begin = HIBYTE(__x.__end_);
    }
    else {
      size_t begin = (size_t)__x.__begin_;
    }
    UC::Exception::CoderError::CoderError(v101, "UCSegmentedURLCoderErrorDomain", 0x1EuLL, 6, p_x, begin, "Encountered an unsupported symbol while encoding URL's path or query", 0x44uLL);
  }
  if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    v66 = &v108;
  }
  else {
    v66 = (std::string *)v108.__r_.__value_.__r.__words[0];
  }
  if ((v108.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v67 = HIBYTE(v108.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v67 = v108.__r_.__value_.__l.__size_;
  }
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v66, v67, (uint64_t *)&__x);
  UC::SUE::UCSegmentedURLCoderProvider::getCombinedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)this, &v104);
  (*(void (**)(std::string *__return_ptr))(*(void *)v104 + 40))(&v106);
  if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v107.__r_.__value_.__l.__data_);
  }
  std::string v107 = v106;
  *((unsigned char *)&v106.__r_.__value_.__s + 23) = 0;
  v106.__r_.__value_.__s.__data_[0] = 0;
  if (v105) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v105);
  }
  v106.__r_.__value_.__r.__words[0] = (std::string::size_type)&__x;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v106);
  if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v68 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v68 = v107.__r_.__value_.__l.__size_;
  }
LABEL_185:
  std::string::basic_string[abi:ne180100]<0>(&__x, "0");
  if (SHIBYTE(__x.__end_) < 0)
  {
    std::__split_buffer<std::string>::pointer v69 = __x.__begin_;
    operator delete(__x.__first_);
  }
  else
  {
    std::__split_buffer<std::string>::pointer v69 = (std::__split_buffer<std::string>::pointer)HIBYTE(__x.__end_);
  }
  unint64_t v70 = (unint64_t)v69 + v68;
  if ((unint64_t)v69 + v68 >= 0xFFFFFFFF) {
    uint64_t v71 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v71 = (uint64_t)v69 + v68;
  }
  if (v68) {
    unint64_t v72 = v71;
  }
  else {
    unint64_t v72 = 0xFFFFFFFFLL;
  }
  BOOL v73 = v70 < 0xFFFFFFFF && v68 != 0;
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v74 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v74 = __p.__r_.__value_.__l.__size_;
  }
  std::string::basic_string[abi:ne180100]<0>(&__x, "1");
  if (SHIBYTE(__x.__end_) < 0)
  {
    std::__split_buffer<std::string>::pointer v75 = __x.__begin_;
    operator delete(__x.__first_);
    if (!v74) {
      goto LABEL_206;
    }
  }
  else
  {
    std::__split_buffer<std::string>::pointer v75 = (std::__split_buffer<std::string>::pointer)HIBYTE(__x.__end_);
    if (!v74) {
      goto LABEL_206;
    }
  }
  v76 = (char *)v75 + v74;
  if ((unint64_t)v75 + v74 < v72)
  {
    int v77 = 0;
    char v78 = 1;
    unint64_t v72 = (unint64_t)v76;
    BOOL v73 = 1;
    goto LABEL_207;
  }
LABEL_206:
  char v78 = 0;
  int v77 = 1;
LABEL_207:
  std::string::size_type v79 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
  if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type v79 = v110.__r_.__value_.__l.__size_;
  }
  if (v79) {
    BOOL v80 = v79 >= v72;
  }
  else {
    BOOL v80 = 1;
  }
  int v81 = !v80;
  if (!v80) {
    BOOL v73 = 1;
  }
  v82 = v123.__begin_;
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForTemplateType(v81, &__x);
  v83.__i_ = v82;
  std::vector<std::string>::insert(&v123, v83, (std::vector<std::string>::value_type *)&__x);
  if (SHIBYTE(__x.__end_) < 0) {
    operator delete(__x.__first_);
  }
  UC::SUE::UCSegmentedURLEncodingResult::setTemplateType((uint64_t)a3, v81);
  UC::SUE::UCSegmentedURLEncodingResult::setHasPathOrQuery((uint64_t)a3, v73);
  if (v73)
  {
    if (v81)
    {
      std::vector<std::string>::pointer v84 = v123.__end_;
      if (v123.__end_ < v123.__end_cap_.__value_)
      {
        if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external(v123.__end_, v110.__r_.__value_.__l.__data_, v110.__r_.__value_.__l.__size_);
LABEL_247:
          v97 = v84 + 1;
LABEL_251:
          v123.__end_ = v97;
          goto LABEL_252;
        }
        long long v85 = *(_OWORD *)&v110.__r_.__value_.__l.__data_;
        std::string::size_type v86 = v110.__r_.__value_.__r.__words[2];
LABEL_246:
        v84->__r_.__value_.__r.__words[2] = v86;
        *(_OWORD *)&v84->__r_.__value_.__l.__data_ = v85;
        goto LABEL_247;
      }
      p_p = &v110;
    }
    else
    {
      UC::SUE::UCSegmentedURLEncodingResult::setNonTemplatePathAndQueryEncodeType((uint64_t)a3, v77);
      UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForNonTemplatePathAndQueryEncodeType(v77, &v106);
      std::vector<std::string>::pointer v87 = v123.__end_;
      if (v123.__end_ >= v123.__end_cap_.__value_)
      {
        unint64_t v90 = 0xAAAAAAAAAAAAAAABLL * (((char *)v123.__end_ - (char *)v123.__begin_) >> 3);
        unint64_t v91 = v90 + 1;
        if (v90 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v123.__end_cap_.__value_ - (char *)v123.__begin_) >> 3) > v91) {
          unint64_t v91 = 0x5555555555555556 * (((char *)v123.__end_cap_.__value_ - (char *)v123.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v123.__end_cap_.__value_ - (char *)v123.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v92 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v92 = v91;
        }
        __x.__end_cap_.__value_ = (std::allocator<std::string> *)&v123.__end_cap_;
        if (v92) {
          v93 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v123.__end_cap_, v92);
        }
        else {
          v93 = 0;
        }
        v94 = v93 + v90;
        __x.__first_ = v93;
        __x.__begin_ = v94;
        __x.__end_cap_.__value_ = &v93[v92];
        long long v95 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
        v94->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v94->__r_.__value_.__l.__data_ = v95;
        memset(&v106, 0, sizeof(v106));
        __x.__end_ = v94 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v123, &__x);
        v96 = v123.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__x);
        v123.__end_ = v96;
        if (SHIBYTE(v106.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v106.__r_.__value_.__l.__data_);
        }
      }
      else
      {
        long long v88 = *(_OWORD *)&v106.__r_.__value_.__l.__data_;
        v123.__end_->__r_.__value_.__r.__words[2] = v106.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v87->__r_.__value_.__l.__data_ = v88;
        v123.__end_ = v87 + 1;
      }
      std::vector<std::string>::pointer v84 = v123.__end_;
      if (v78)
      {
        if (v123.__end_ < v123.__end_cap_.__value_)
        {
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(v123.__end_, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            goto LABEL_247;
          }
          long long v85 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          std::string::size_type v86 = __p.__r_.__value_.__r.__words[2];
          goto LABEL_246;
        }
        p_p = &__p;
      }
      else
      {
        if (v123.__end_ < v123.__end_cap_.__value_)
        {
          if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external(v123.__end_, v107.__r_.__value_.__l.__data_, v107.__r_.__value_.__l.__size_);
            goto LABEL_247;
          }
          long long v85 = *(_OWORD *)&v107.__r_.__value_.__l.__data_;
          std::string::size_type v86 = v107.__r_.__value_.__r.__words[2];
          goto LABEL_246;
        }
        p_p = &v107;
      }
    }
    v97 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v123, (long long *)p_p);
    goto LABEL_251;
  }
LABEL_252:
  UC::JoinString((std::string *)&v123, (std::string *)&__x);
  UC::SUE::UCSegmentedURLEncodingResult::setEncodingBits(a3, (const std::string *)&__x);
  if (SHIBYTE(__x.__end_) < 0) {
    operator delete(__x.__first_);
  }
  if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v107.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v108.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v108.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v110.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v98 = (void **)v113;
  v113 = 0;
  if (v98) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&v113, v98);
  }
  if (SHIBYTE(v115) < 0) {
    operator delete((void *)v114);
  }
  if ((char)v119 < 0) {
    operator delete(*((void **)&v117 + 1));
  }
  if ((char)v122 < 0) {
    operator delete(v120);
  }
  __x.__first_ = (std::__split_buffer<std::string>::pointer)&v123;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__x);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
}

void sub_22E875DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,void **a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  *(void *)(v52 - 160) = v51;
  if (a20 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a34 < 0) {
    operator delete(a29);
  }
  if (a41 < 0) {
    operator delete(a36);
  }
  uint64_t v54 = a44;
  a44 = 0;
  if (v54) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a44, v54);
  }
  if (a50 < 0) {
    operator delete(a45);
  }
  if (*(char *)(v52 - 193) < 0) {
    operator delete(*(void **)(v52 - 216));
  }
  if (*(char *)(v52 - 169) < 0) {
    operator delete(*(void **)(v52 - 192));
  }
  *(void *)(v52 - 224) = v52 - 168;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v52 - 224));
  if (*(char *)(v52 - 121) < 0) {
    operator delete(*(void **)(v52 - 144));
  }
  UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v50);
  _Unwind_Resume(a1);
}

void sub_22E875E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,void *a39,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,uint64_t a46,void **a47,void *a48,uint64_t a49,int a50,__int16 a51,char a52,char a53)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)(v54 - 120));
  if (a17 < 0) {
    operator delete(__p);
  }
  if (a23 < 0) {
    operator delete(a18);
  }
  if (a30 < 0) {
    operator delete(a25);
  }
  if (a37 < 0) {
    operator delete(a32);
  }
  if (a44 < 0) {
    operator delete(a39);
  }
  uint64_t v56 = a47;
  a47 = 0;
  if (v56) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a47, v56);
  }
  if (a53 < 0) {
    operator delete(a48);
  }
  if (*(char *)(v54 - 193) < 0) {
    operator delete(*(void **)(v54 - 216));
  }
  if (*(char *)(v54 - 169) < 0) {
    operator delete(*(void **)(v54 - 192));
  }
  *(void *)(v54 - 224) = v54 - 168;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v54 - 224));
  if (*(char *)(v54 - 121) < 0) {
    operator delete(*(void **)(v54 - 144));
  }
  UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v53);
  _Unwind_Resume(a1);
}

void sub_22E875E44(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,char a25)
{
  if (a25 && a24 < 0) {
    operator delete(__p);
  }
  if (v25)
  {
    if (*(char *)(v26 - 97) < 0) {
      JUMPOUT(0x22E8760F8);
    }
  }
  JUMPOUT(0x22E8760FCLL);
}

void sub_22E875E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,void **a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  if (*(char *)(v53 - 97) < 0)
  {
    operator delete(*(void **)(v53 - 120));
    if ((v52 & 1) == 0)
    {
LABEL_6:
      if (a20 < 0) {
        operator delete(a15);
      }
      if (a27 < 0) {
        operator delete(a22);
      }
      if (a34 < 0) {
        operator delete(a29);
      }
      if (a41 < 0) {
        operator delete(a36);
      }
      v55 = a44;
      a44 = 0;
      if (v55) {
        std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a44, v55);
      }
      if (a50 < 0) {
        operator delete(a45);
      }
      if (*(char *)(v53 - 193) < 0) {
        operator delete(*(void **)(v53 - 216));
      }
      if (*(char *)(v53 - 169) < 0) {
        operator delete(*(void **)(v53 - 192));
      }
      *(void *)(v53 - 224) = v53 - 168;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v53 - 224));
      if (*(char *)(v53 - 121) < 0) {
        operator delete(*(void **)(v53 - 144));
      }
      UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v50);
      _Unwind_Resume(a1);
    }
  }
  else if (!v52)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v51);
  goto LABEL_6;
}

void sub_22E875ED0()
{
}

void sub_22E875EE8()
{
}

void sub_22E875EF4()
{
}

void sub_22E875EFC()
{
  __cxa_free_exception(v0);
  JUMPOUT(0x22E876170);
}

void sub_22E875F2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, std::__shared_weak_count *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,void **a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  if (a11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a11);
  }
  if (a2 == 1)
  {
    uint64_t v54 = __cxa_begin_catch(a1);
    exception = __cxa_allocate_exception(0x58uLL);
    uint64_t v56 = exception;
    if (*((char *)v54 + 55) < 0)
    {
      v57 = (const void *)v54[4];
      size_t v58 = v54[5];
    }
    else
    {
      v57 = v54 + 4;
      size_t v58 = *((unsigned __int8 *)v54 + 55);
    }
    UC::Exception::CoderError::CoderError(exception, "UCSegmentedURLCoderErrorDomain", 0x1EuLL, 6, v57, v58, "Encountered an unsupported symbol while encoding URL's path or query", 0x44uLL);
  }
  a12 = v51 - 120;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a12);
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a34 < 0) {
    operator delete(a29);
  }
  if (a41 < 0) {
    operator delete(a36);
  }
  uint64_t v59 = a44;
  a44 = 0;
  if (v59) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a44, v59);
  }
  if (a50 < 0) {
    operator delete(a45);
  }
  if (*(char *)(v51 - 193) < 0) {
    operator delete(*(void **)(v51 - 216));
  }
  if (*(char *)(v51 - 169) < 0) {
    operator delete(*(void **)(v51 - 192));
  }
  *(void *)(v51 - 224) = v51 - 168;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v51 - 224));
  if (*(char *)(v51 - 121) < 0) {
    operator delete(*(void **)(v51 - 144));
  }
  UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v50);
  _Unwind_Resume(a1);
}

void sub_22E875FCC()
{
}

void sub_22E876000()
{
  if (*(char *)(v0 - 97) < 0) {
    JUMPOUT(0x22E8760E8);
  }
  JUMPOUT(0x22E8760ECLL);
}

void sub_22E87601C()
{
}

void sub_22E876028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,void *a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50)
{
  if (*(char *)(v51 - 97) < 0) {
    JUMPOUT(0x22E876040);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a34 < 0) {
    operator delete(a29);
  }
  if (a41 < 0) {
    operator delete(a36);
  }
  uint64_t v53 = a44;
  a44 = 0;
  if (v53) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&a44, v53);
  }
  if (a50 < 0) {
    operator delete(a45);
  }
  if (*(char *)(v51 - 193) < 0) {
    operator delete(*(void **)(v51 - 216));
  }
  if (*(char *)(v51 - 169) < 0) {
    operator delete(*(void **)(v51 - 192));
  }
  *(void *)(v51 - 224) = v51 - 168;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v51 - 224);
  if (*(char *)(v51 - 121) < 0) {
    operator delete(*(void **)(v51 - 144));
  }
  UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(v50);
  _Unwind_Resume(a1);
}

void sub_22E876054(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void **__p)
{
  unint64_t v31 = __p;
  std::string __p = 0;
  if (v31) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&__p, v31);
  }
  JUMPOUT(0x22E87611CLL);
}

void sub_22E876070()
{
  operator delete(v0);
  JUMPOUT(0x22E876130);
}

void sub_22E876080()
{
}

void sub_22E876088()
{
  if (*(char *)(v0 - 97) < 0) {
    JUMPOUT(0x22E87613CLL);
  }
  JUMPOUT(0x22E876140);
}

void sub_22E87609C()
{
}

void sub_22E8760A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,int a39,__int16 a40,char a41,char a42)
{
  if (a42 < 0) {
    JUMPOUT(0x22E87614CLL);
  }
  JUMPOUT(0x22E876150);
}

void sub_22E8760B8()
{
}

void sub_22E8760C0()
{
}

void sub_22E8760C8()
{
  __cxa_free_exception(v0);
  JUMPOUT(0x22E876188);
}

void *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForHostFormatType@<X0>(unsigned int a1@<W1>, void *a2@<X8>)
{
  if (a1 >= 3)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown host format type", 24);
  }
  uint64_t v2 = off_2649E0D08[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void sub_22E876220(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_tryEncodingSegmentedPathAndQuery(UC::SUE::UCSegmentedURLCoderProvider **a1@<X0>, uint64_t *a2@<X1>, uint64_t *a3@<X2>, unsigned char *a4@<X8>)
{
  if (*((char *)a3 + 23) < 0)
  {
    uint64_t v7 = a3[1];
    if (!v7) {
      goto LABEL_10;
    }
  }
  else
  {
    if (!*((unsigned char *)a3 + 23)) {
      goto LABEL_10;
    }
    uint64_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  if (*((char *)a3 + 23) >= 0) {
    int v8 = a3;
  }
  else {
    int v8 = (uint64_t *)*a3;
  }
  if (*((unsigned char *)v8 + v7 - 1) == 38)
  {
    *a4 = 0;
    a4[24] = 0;
    return;
  }
LABEL_10:
  uint64_t v9 = *((unsigned __int8 *)a2 + 23);
  if (*((char *)a2 + 23) < 0)
  {
    uint64_t v10 = a2[1];
    if (!v10)
    {
      BOOL v12 = 0;
      uint64_t v100 = 0;
      uint64_t v101 = 0;
      uint64_t v102 = 0;
LABEL_21:
      uint64_t v13 = a2;
      a2 = (uint64_t *)*a2;
      uint64_t v9 = v13[1];
      goto LABEL_22;
    }
  }
  else
  {
    if (!*((unsigned char *)a2 + 23))
    {
      BOOL v12 = 0;
      uint64_t v100 = 0;
      uint64_t v101 = 0;
      uint64_t v102 = 0;
      goto LABEL_22;
    }
    uint64_t v10 = *((unsigned __int8 *)a2 + 23);
  }
  if ((v9 & 0x80u) == 0) {
    unint64_t v11 = a2;
  }
  else {
    unint64_t v11 = (uint64_t *)*a2;
  }
  BOOL v12 = *((unsigned __int8 *)v11 + v10 - 1) == 47;
  uint64_t v100 = 0;
  uint64_t v101 = 0;
  uint64_t v102 = 0;
  if ((v9 & 0x80) != 0) {
    goto LABEL_21;
  }
LABEL_22:
  UC::SplitString((unsigned __int8 *)a2, v9, 0x2Fu, &v100);
  memset(&v99, 0, sizeof(v99));
  UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v14, &v100, (uint64_t *)&v99);
  if (v99.__end_ == v99.__begin_ && v12)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "/");
    std::vector<std::string>::pointer end = v99.__end_;
    if (v99.__end_ >= v99.__end_cap_.__value_)
    {
      unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (((char *)v99.__end_ - (char *)v99.__begin_) >> 3);
      unint64_t v19 = v18 + 1;
      if (v18 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v99.__end_cap_.__value_ - (char *)v99.__begin_) >> 3) > v19) {
        unint64_t v19 = 0x5555555555555556 * (((char *)v99.__end_cap_.__value_ - (char *)v99.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v99.__end_cap_.__value_ - (char *)v99.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v20 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v20 = v19;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v99.__end_cap_;
      if (v20) {
        unsigned int v21 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v99.__end_cap_, v20);
      }
      else {
        unsigned int v21 = 0;
      }
      int v22 = v21 + v18;
      __v.__first_ = v21;
      __v.__begin_ = v22;
      __v.__end_cap_.__value_ = &v21[v20];
      long long v23 = *(_OWORD *)__p;
      v22->__r_.__value_.__r.__words[2] = v98;
      *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
      __p[1] = 0;
      std::string::size_type v98 = 0;
      __p[0] = 0;
      __v.__end_ = v22 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v99, &__v);
      long long v24 = v99.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v99.__end_ = v24;
      if (SHIBYTE(v98) < 0) {
        operator delete(__p[0]);
      }
    }
    else
    {
      long long v17 = *(_OWORD *)__p;
      v99.__end_->__r_.__value_.__r.__words[2] = v98;
      *(_OWORD *)&end->__r_.__value_.__l.__data_ = v17;
      v99.__end_ = end + 1;
    }
  }
  uint64_t v25 = v100;
  for (uint64_t i = v101; i != v25; i -= 24)
  {
    if (*(char *)(i - 1) < 0) {
      operator delete(*(void **)(i - 24));
    }
  }
  uint64_t v101 = v25;
  int v27 = *((char *)a3 + 23);
  if (v27 >= 0) {
    std::string::size_type v28 = (unsigned __int8 *)a3;
  }
  else {
    std::string::size_type v28 = (unsigned __int8 *)*a3;
  }
  if (v27 >= 0) {
    uint64_t v29 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    uint64_t v29 = a3[1];
  }
  UC::SplitString(v28, v29, 0x26u, &v100);
  __p[0] = 0;
  __p[1] = 0;
  std::string::size_type v98 = 0;
  UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v30, &v100, (uint64_t *)__p);
  memset(&v96, 0, sizeof(v96));
  unint64_t v31 = __p[0];
  unint64_t v32 = __p[1];
  std::vector<std::string>::pointer begin = v99.__begin_;
  if ((std::vector<std::string>::pointer)((char *)v99.__end_ - (char *)v99.__begin_) == (std::vector<std::string>::pointer)24)
  {
    int v34 = SHIBYTE(v99.__begin_->__r_.__value_.__r.__words[2]);
    if (v34 < 0)
    {
      if (v99.__begin_->__r_.__value_.__l.__size_ != 1) {
        goto LABEL_59;
      }
      std::vector<std::string>::pointer begin = (std::vector<std::string>::pointer)v99.__begin_->__r_.__value_.__l.__data_;
    }
    else if (v34 != 1)
    {
      goto LABEL_59;
    }
    if (begin->__r_.__value_.__s.__data_[0] != 47 || __p[1] == __p[0]) {
      goto LABEL_60;
    }
    goto LABEL_139;
  }
LABEL_59:
  if (v99.__end_ != v99.__begin_)
  {
LABEL_60:
    uint64_t v35 = 0;
    unint64_t v36 = v99.__end_ - v99.__begin_;
    unint64_t v37 = v36 - 1;
    v89 = a4;
    if (v36 <= 1) {
      int64_t v38 = 1;
    }
    else {
      int64_t v38 = v99.__end_ - v99.__begin_;
    }
    while (1)
    {
      BOOL v40 = v32 != v31 || v37 != 0;
      v41 = &v99.__begin_[v35];
      if (SHIBYTE(v99.__begin_[v35].__r_.__value_.__r.__words[2]) < 0)
      {
        uint64_t v43 = (std::string *)v41->__r_.__value_.__r.__words[0];
        uint64_t size = v41->__r_.__value_.__l.__size_;
      }
      else
      {
        uint64_t size = HIBYTE(v99.__begin_[v35].__r_.__value_.__r.__words[2]);
        uint64_t v43 = &v99.__begin_[v35];
      }
      UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v43, size, (uint64_t *)v94);
      if ((UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedPathComponentOrQueryValue(a1, (uint64_t)v94) & 1) == 0)
      {
        unsigned char *v89 = 0;
        v89[24] = 0;
        __v.__first_ = (std::__split_buffer<std::string>::pointer)v94;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
        goto LABEL_171;
      }
      v44 = &v99.__begin_[v35];
      if (SHIBYTE(v99.__begin_[v35].__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external(&v93, v44->__r_.__value_.__l.__data_, v44->__r_.__value_.__l.__size_);
      }
      else
      {
        long long v45 = *(_OWORD *)&v44->__r_.__value_.__l.__data_;
        v93.__r_.__value_.__r.__words[2] = v44->__r_.__value_.__r.__words[2];
        *(_OWORD *)&v93.__r_.__value_.__l.__data_ = v45;
      }
      if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::size_type v47 = v93.__r_.__value_.__l.__size_;
        if (v93.__r_.__value_.__l.__size_ != 1)
        {
          if (v37) {
            BOOL v52 = 0;
          }
          else {
            BOOL v52 = v12;
          }
          if (v52) {
            goto LABEL_109;
          }
          goto LABEL_99;
        }
        v46 = (std::string *)v93.__r_.__value_.__r.__words[0];
      }
      else
      {
        if (HIBYTE(v93.__r_.__value_.__r.__words[2]) != 1)
        {
          if (v37) {
            BOOL v50 = 0;
          }
          else {
            BOOL v50 = v12;
          }
          if (v50)
          {
LABEL_94:
            std::string::size_type v47 = HIBYTE(v93.__r_.__value_.__r.__words[2]);
            goto LABEL_109;
          }
          goto LABEL_99;
        }
        v46 = &v93;
      }
      if (v46->__r_.__value_.__s.__data_[0] != 47)
      {
        if (v37) {
          BOOL v51 = 0;
        }
        else {
          BOOL v51 = v12;
        }
        if (v51)
        {
          if ((*((unsigned char *)&v93.__r_.__value_.__s + 23) & 0x80) == 0) {
            goto LABEL_94;
          }
          std::string::size_type v47 = v93.__r_.__value_.__l.__size_;
LABEL_109:
          size_t v58 = &v93;
          if ((v93.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
            size_t v58 = (std::string *)v93.__r_.__value_.__r.__words[0];
          }
          char v53 = v58->__r_.__value_.__s.__data_[v47 - 1] != 47;
LABEL_112:
          std::string::basic_string[abi:ne180100]<0>(&v92, "0");
          UC::SUE::SegmentedURLEncoderImpl::_encodeURLPathComponent((uint64_t)a1, (uint64_t)&v99.__begin_[v35], v53, v40, (uint64_t)v90);
          if ((v91 & 0x80u) == 0) {
            uint64_t v59 = v90;
          }
          else {
            uint64_t v59 = (void **)v90[0];
          }
          if ((v91 & 0x80u) == 0) {
            std::string::size_type v60 = v91;
          }
          else {
            std::string::size_type v60 = (std::string::size_type)v90[1];
          }
          std::__split_buffer<std::string>::pointer v61 = std::string::append(&v92, (const std::string::value_type *)v59, v60);
          long long v62 = *(_OWORD *)&v61->__r_.__value_.__l.__data_;
          __v.__end_ = (std::__split_buffer<std::string>::pointer)v61->__r_.__value_.__r.__words[2];
          *(_OWORD *)&__v.__first_ = v62;
          v61->__r_.__value_.__l.__size_ = 0;
          v61->__r_.__value_.__r.__words[2] = 0;
          v61->__r_.__value_.__r.__words[0] = 0;
          if ((char)v91 < 0) {
            operator delete(v90[0]);
          }
          if (SHIBYTE(v92.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v92.__r_.__value_.__l.__data_);
          }
          std::vector<std::string>::pointer v63 = v96.__end_;
          if (v96.__end_ >= v96.__end_cap_.__value_)
          {
            v65 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v96, (long long *)&__v);
          }
          else
          {
            if (SHIBYTE(__v.__end_) < 0)
            {
              std::string::__init_copy_ctor_external(v96.__end_, (const std::string::value_type *)__v.__first_, (std::string::size_type)__v.__begin_);
            }
            else
            {
              long long v64 = *(_OWORD *)&__v.__first_;
              v96.__end_->__r_.__value_.__r.__words[2] = (std::string::size_type)__v.__end_;
              *(_OWORD *)&v63->__r_.__value_.__l.__data_ = v64;
            }
            v65 = v63 + 1;
          }
          v96.__end_ = v65;
          if ((SHIBYTE(__v.__end_) & 0x80000000) == 0) {
            goto LABEL_131;
          }
          std::__split_buffer<std::string>::pointer first = __v.__first_;
LABEL_130:
          operator delete(first);
          goto LABEL_131;
        }
LABEL_99:
        char v53 = 0;
        goto LABEL_112;
      }
      std::string::basic_string[abi:ne180100]<0>(&v92, "10");
      std::vector<std::string>::pointer v48 = v96.__end_;
      if (v96.__end_ >= v96.__end_cap_.__value_)
      {
        unint64_t v54 = 0xAAAAAAAAAAAAAAABLL * (((char *)v96.__end_ - (char *)v96.__begin_) >> 3);
        unint64_t v55 = v54 + 1;
        if (v54 + 1 > 0xAAAAAAAAAAAAAAALL) {
          std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
        }
        if (0x5555555555555556 * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3) > v55) {
          unint64_t v55 = 0x5555555555555556 * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3) >= 0x555555555555555) {
          unint64_t v56 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v56 = v55;
        }
        __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v96.__end_cap_;
        if (v56) {
          v57 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v96.__end_cap_, v56);
        }
        else {
          v57 = 0;
        }
        std::string::size_type v67 = v57 + v54;
        __v.__first_ = v57;
        __v.__begin_ = v67;
        __v.__end_cap_.__value_ = &v57[v56];
        long long v68 = *(_OWORD *)&v92.__r_.__value_.__l.__data_;
        v67->__r_.__value_.__r.__words[2] = v92.__r_.__value_.__r.__words[2];
        *(_OWORD *)&v67->__r_.__value_.__l.__data_ = v68;
        memset(&v92, 0, sizeof(v92));
        __v.__end_ = v67 + 1;
        std::vector<std::string>::__swap_out_circular_buffer(&v96, &__v);
        std::__split_buffer<std::string>::pointer v69 = v96.__end_;
        std::__split_buffer<std::string>::~__split_buffer(&__v);
        v96.__end_ = v69;
        if ((SHIBYTE(v92.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_131;
        }
        std::__split_buffer<std::string>::pointer first = (std::__split_buffer<std::string>::pointer)v92.__r_.__value_.__r.__words[0];
        goto LABEL_130;
      }
      long long v49 = *(_OWORD *)&v92.__r_.__value_.__l.__data_;
      v96.__end_->__r_.__value_.__r.__words[2] = v92.__r_.__value_.__r.__words[2];
      *(_OWORD *)&v48->__r_.__value_.__l.__data_ = v49;
      v96.__end_ = v48 + 1;
LABEL_131:
      if (SHIBYTE(v93.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v93.__r_.__value_.__l.__data_);
      }
      __v.__first_ = (std::__split_buffer<std::string>::pointer)v94;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
      --v37;
      ++v35;
      if (!--v38)
      {
        unint64_t v31 = __p[0];
        unint64_t v32 = __p[1];
        a4 = v89;
        break;
      }
    }
  }
LABEL_139:
  int64_t v70 = v32 - v31;
  if (v32 == v31)
  {
LABEL_169:
    UC::JoinString((std::string *)&v96, (std::string *)&__v);
    *(_OWORD *)a4 = *(_OWORD *)&__v.__first_;
    *((void *)a4 + 2) = __v.__end_;
    a4[24] = 1;
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v94, "11");
    std::vector<std::string>::pointer v71 = v96.__end_;
    if (v96.__end_ >= v96.__end_cap_.__value_)
    {
      unint64_t v73 = 0xAAAAAAAAAAAAAAABLL * (((char *)v96.__end_ - (char *)v96.__begin_) >> 3);
      unint64_t v74 = v73 + 1;
      if (v73 + 1 > 0xAAAAAAAAAAAAAAALL) {
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      }
      if (0x5555555555555556 * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3) > v74) {
        unint64_t v74 = 0x5555555555555556 * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v96.__end_cap_.__value_ - (char *)v96.__begin_) >> 3) >= 0x555555555555555) {
        unint64_t v75 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v75 = v74;
      }
      __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v96.__end_cap_;
      if (v75) {
        v76 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v96.__end_cap_, v75);
      }
      else {
        v76 = 0;
      }
      int v77 = v76 + v73;
      __v.__first_ = v76;
      __v.__begin_ = v77;
      __v.__end_cap_.__value_ = &v76[v75];
      long long v78 = *(_OWORD *)v94;
      v77->__r_.__value_.__r.__words[2] = v95;
      *(_OWORD *)&v77->__r_.__value_.__l.__data_ = v78;
      v94[1] = 0;
      std::string::size_type v95 = 0;
      v94[0] = 0;
      __v.__end_ = v77 + 1;
      std::vector<std::string>::__swap_out_circular_buffer(&v96, &__v);
      std::string::size_type v79 = v96.__end_;
      std::__split_buffer<std::string>::~__split_buffer(&__v);
      v96.__end_ = v79;
      if (SHIBYTE(v95) < 0) {
        operator delete(v94[0]);
      }
    }
    else
    {
      long long v72 = *(_OWORD *)v94;
      v96.__end_->__r_.__value_.__r.__words[2] = v95;
      *(_OWORD *)&v71->__r_.__value_.__l.__data_ = v72;
      v96.__end_ = v71 + 1;
    }
    uint64_t v80 = 0;
    uint64_t v81 = v70 / 24;
    BOOL v82 = v70 / 24 != 0;
    uint64_t v83 = v70 / 24 - 1;
    if (v83 != 0 && v82) {
      uint64_t v84 = v81;
    }
    else {
      uint64_t v84 = 1;
    }
    while ((UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedQureyParameter(a1, (std::string *)((char *)__p[0] + v80)) & 1) != 0)
    {
      BOOL v82 = v83-- != 0;
      int v85 = v82;
      UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedQueryComponent((std::string *)((char *)__p[0] + v80), a1, v85, (uint64_t)&__v);
      std::vector<std::string>::pointer v86 = v96.__end_;
      if (v96.__end_ >= v96.__end_cap_.__value_)
      {
        long long v88 = (std::string *)std::vector<std::string>::__push_back_slow_path<std::string const&>((uint64_t *)&v96, (long long *)&__v);
      }
      else
      {
        if (SHIBYTE(__v.__end_) < 0)
        {
          std::string::__init_copy_ctor_external(v96.__end_, (const std::string::value_type *)__v.__first_, (std::string::size_type)__v.__begin_);
        }
        else
        {
          long long v87 = *(_OWORD *)&__v.__first_;
          v96.__end_->__r_.__value_.__r.__words[2] = (std::string::size_type)__v.__end_;
          *(_OWORD *)&v86->__r_.__value_.__l.__data_ = v87;
        }
        long long v88 = v86 + 1;
      }
      v96.__end_ = v88;
      if (SHIBYTE(__v.__end_) < 0) {
        operator delete(__v.__first_);
      }
      v80 += 24;
      if (!--v84) {
        goto LABEL_169;
      }
    }
    *a4 = 0;
    a4[24] = 0;
  }
LABEL_171:
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v96;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)__p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v99;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v100;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

void sub_22E876B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,void ***__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,void **a35,uint64_t a36,uint64_t a37,uint64_t *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)(v44 - 128));
  if (a34 < 0) {
    operator delete(__p);
  }
  std::string __p = &a35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  a35 = (void **)&a38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a35);
  a38 = &a44;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a38);
  a44 = v44 - 152;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a44);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_tryEncodingWithPathWordBookAndAutoQueryTemplateFormat(UC::SUE::UCSegmentedURLCoderProvider **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  if (UC::SUE::SegmentedURLEncoderImpl::_pathAndQueryMatchPathWordBookAndAutoQueryTemplateFormat(a1, (uint64_t *)a2, (uint64_t *)a3))
  {
    memset(v47, 0, sizeof(v47));
    int v8 = *(char *)(a2 + 23);
    if (v8 >= 0) {
      uint64_t v9 = (unsigned __int8 *)a2;
    }
    else {
      uint64_t v9 = *(unsigned __int8 **)a2;
    }
    if (v8 >= 0) {
      uint64_t v10 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v10 = *(void *)(a2 + 8);
    }
    UC::SplitString(v9, v10, 0x2Fu, v47);
    uint64_t v44 = 0;
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v11, v47, (uint64_t *)&v44);
    memset(v43, 0, sizeof(v43));
    int v12 = *(char *)(a3 + 23);
    if (v12 >= 0) {
      uint64_t v13 = (unsigned __int8 *)a3;
    }
    else {
      uint64_t v13 = *(unsigned __int8 **)a3;
    }
    if (v12 >= 0) {
      uint64_t v14 = *(unsigned __int8 *)(a3 + 23);
    }
    else {
      uint64_t v14 = *(void *)(a3 + 8);
    }
    UC::SplitString(v13, v14, 0x26u, (uint64_t *)v43);
    BOOL v40 = 0;
    v41 = 0;
    uint64_t v42 = 0;
    UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v15, v43, (uint64_t *)&v40);
    memset(&v39, 0, sizeof(v39));
    if (v45 - (void)v44 == 24)
    {
      std::string::basic_string[abi:ne180100]<0>(&v37, "0");
      UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*a1, &v33);
      (*(void (**)(void **__return_ptr))(*(void *)v33 + 32))(v35);
      if ((v36 & 0x80u) == 0) {
        uint64_t v16 = v35;
      }
      else {
        uint64_t v16 = (void **)v35[0];
      }
      if ((v36 & 0x80u) == 0) {
        std::string::size_type v17 = v36;
      }
      else {
        std::string::size_type v17 = (std::string::size_type)v35[1];
      }
      unint64_t v18 = std::string::append(&v37, (const std::string::value_type *)v16, v17);
      long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
      __p.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v19;
      v18->__r_.__value_.__l.__size_ = 0;
      v18->__r_.__value_.__r.__words[2] = 0;
      v18->__r_.__value_.__r.__words[0] = 0;
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        p_p = &__p;
      }
      else {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      }
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
      }
      std::string::append(&v39, (const std::string::value_type *)p_p, size);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if ((char)v36 < 0) {
        operator delete(v35[0]);
      }
      if (v34) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v34);
      }
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v37.__r_.__value_.__l.__data_);
      }
    }
    if (v41 == v40) {
      goto LABEL_61;
    }
    std::string::basic_string[abi:ne180100]<0>(&__p, "1");
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      int v22 = &__p;
    }
    else {
      int v22 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v23 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v23 = __p.__r_.__value_.__l.__size_;
    }
    std::string::append(&v39, (const std::string::value_type *)v22, v23);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v41 == v40)
    {
LABEL_61:
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(a4, v39.__r_.__value_.__l.__data_, v39.__r_.__value_.__l.__size_);
      }
      else {
        *a4 = v39;
      }
      char v32 = 1;
    }
    else
    {
      uint64_t v24 = 0;
      unint64_t v25 = ((char *)v41 - (char *)v40) / 24;
      unint64_t v26 = v25 - 1;
      if (v25 <= 1) {
        uint64_t v27 = 1;
      }
      else {
        uint64_t v27 = ((char *)v41 - (char *)v40) / 24;
      }
      while ((UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedQureyParameter(a1, (std::string *)&v40[v24]) & 1) != 0)
      {
        BOOL v29 = v26-- != 0;
        UC::SUE::SegmentedURLEncoderImpl::_encodePathWordBookAndAutoQueryTemplateQueryComponent((std::string *)&v40[v24], (uint64_t)a1, v29, &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v30 = &__p;
        }
        else {
          uint64_t v30 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type v31 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type v31 = __p.__r_.__value_.__l.__size_;
        }
        std::string::append(&v39, (const std::string::value_type *)v30, v31);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        v24 += 3;
        if (!--v27) {
          goto LABEL_61;
        }
      }
      char v32 = 0;
      a4->__r_.__value_.__s.__data_[0] = 0;
    }
    a4[1].__r_.__value_.__s.__data_[0] = v32;
    if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v39.__r_.__value_.__l.__data_);
    }
    v39.__r_.__value_.__r.__words[0] = (std::string::size_type)&v40;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v39);
    BOOL v40 = (void **)v43;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v40);
    v43[0] = (void **)&v44;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v43);
    uint64_t v44 = (void **)v47;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v44);
  }
  else
  {
    a4->__r_.__value_.__s.__data_[0] = 0;
    a4[1].__r_.__value_.__s.__data_[0] = 0;
  }
}

void sub_22E877010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t **__p,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t *a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  std::string __p = &a35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  a35 = &a38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a35);
  a38 = v38 - 112;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a38);
  *(void *)(v38 - 112) = v38 - 88;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v38 - 112));
  _Unwind_Resume(a1);
}

void *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForNonTemplatePathAndQueryEncodeType@<X0>(int a1@<W1>, void *a2@<X8>)
{
  if (a1 == 1)
  {
    uint64_t v2 = "0";
  }
  else
  {
    if (a1)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown non-template path and query encode type type", 52);
    }
    uint64_t v2 = "1";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void sub_22E8771AC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::vector<std::string>::iterator std::vector<std::string>::insert(std::vector<std::string> *this, std::vector<std::string>::const_iterator __position, std::vector<std::string>::value_type *__x)
{
  uint64_t i = (std::string *)__position.__i_;
  std::vector<std::string>::pointer end = this->__end_;
  value = this->__end_cap_.__value_;
  p_end_cap = (std::allocator<std::string> *)&this->__end_cap_;
  int v8 = value;
  if (end >= value)
  {
    std::vector<std::string>::pointer begin = this->__begin_;
    unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3) + 1;
    if (v12 > 0xAAAAAAAAAAAAAAALL) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)__position.__i_ - (char *)begin) >> 3);
    unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)begin) >> 3);
    unint64_t v15 = 2 * v14;
    if (2 * v14 <= v12) {
      unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)end - (char *)this->__begin_) >> 3) + 1;
    }
    if (v14 >= 0x555555555555555) {
      unint64_t v16 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v16 = v15;
    }
    __v.__end_cap_.__value_ = p_end_cap;
    if (v16) {
      std::string::size_type v17 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)p_end_cap, v16);
    }
    else {
      std::string::size_type v17 = 0;
    }
    __v.__first_ = v17;
    __v.__begin_ = v17 + v13;
    __v.__end_ = __v.__begin_;
    __v.__end_cap_.__value_ = &v17[v16];
    std::__split_buffer<std::string>::push_back(&__v, __x);
    uint64_t i = std::vector<std::string>::__swap_out_circular_buffer(this, &__v, i);
    std::__split_buffer<std::string>::~__split_buffer(&__v);
  }
  else if (__position.__i_ == end)
  {
    long long v18 = *(_OWORD *)&__x->__r_.__value_.__l.__data_;
    __position.__i_->__r_.__value_.__r.__words[2] = __x->__r_.__value_.__r.__words[2];
    *(_OWORD *)&__position.__i_->__r_.__value_.__l.__data_ = v18;
    __x->__r_.__value_.__l.__size_ = 0;
    __x->__r_.__value_.__r.__words[2] = 0;
    __x->__r_.__value_.__r.__words[0] = 0;
    this->__end_ = (std::vector<std::string>::pointer)&__position.__i_[1];
  }
  else
  {
    std::vector<std::string>::__move_range(this, (std::vector<std::string>::pointer)__position.__i_, end, (std::vector<std::string>::pointer)&__position.__i_[1]);
    if (SHIBYTE(i->__r_.__value_.__r.__words[2]) < 0) {
      operator delete(i->__r_.__value_.__l.__data_);
    }
    long long v10 = *(_OWORD *)&__x->__r_.__value_.__l.__data_;
    i->__r_.__value_.__r.__words[2] = __x->__r_.__value_.__r.__words[2];
    *(_OWORD *)&i->__r_.__value_.__l.__data_ = v10;
    *((unsigned char *)&__x->__r_.__value_.__s + 23) = 0;
    __x->__r_.__value_.__s.__data_[0] = 0;
  }
  return (std::vector<std::string>::iterator)i;
}

void sub_22E877334(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForTemplateType@<X0>(int a1@<W1>, void *a2@<X8>)
{
  if (a1)
  {
    if (a1 != 1)
    {
      exception = __cxa_allocate_exception(0x40uLL);
      UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown template type", 21);
    }
    uint64_t v2 = "1";
  }
  else
  {
    uint64_t v2 = "0";
  }
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void sub_22E8773E4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLEncodingResult::~UCSegmentedURLEncodingResult(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  uint64_t v4 = (void **)*((void *)this + 5);
  uint64_t v2 = (void *)((char *)this + 40);
  uint64_t v3 = v4;
  *uint64_t v2 = 0;
  if (v4) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)v2, v3);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

uint64_t UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedPathComponentOrQueryValue(UC::SUE::UCSegmentedURLCoderProvider **a1, uint64_t a2)
{
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*a1, &v8);
  if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v8 + 16))(v8, a2))
  {
    uint64_t v4 = 1;
  }
  else
  {
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(*a1, &v6);
    uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v6 + 16))(v6, a2);
    if (v7) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v4;
}

void sub_22E877504(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedQureyParameter(UC::SUE::UCSegmentedURLCoderProvider **a1, std::string *this)
{
  std::string::size_type v4 = std::string::find(this, 61, 0);
  if (v4 == -1) {
    return 0;
  }
  std::string::size_type v5 = v4;
  std::string::basic_string(&v17, this, 0, v4, (std::allocator<char> *)&v16);
  std::string::basic_string(&v16, this, v5 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v15);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v6 = &v17;
  }
  else {
    uint64_t v6 = (std::string *)v17.__r_.__value_.__r.__words[0];
  }
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v6, size, v15);
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*a1, &v13);
  char v8 = (*v13)[2]((void **)v13, v15);
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (v8)
  {
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v9 = &v16;
    }
    else {
      uint64_t v9 = (std::string *)v16.__r_.__value_.__r.__words[0];
    }
    if ((v16.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v10 = HIBYTE(v16.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v10 = v16.__r_.__value_.__l.__size_;
    }
    UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols((std::string::value_type *)v9, v10, (uint64_t *)&v13);
    uint64_t canEncodeSegmentedPathComponentOrQueryValue = UC::SUE::SegmentedURLEncoderImpl::_canEncodeSegmentedPathComponentOrQueryValue(a1, (uint64_t)&v13);
    long long v18 = (void ***)&v13;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  }
  else
  {
    uint64_t canEncodeSegmentedPathComponentOrQueryValue = 0;
  }
  unint64_t v13 = (uint64_t (***)(void **, uint64_t *))v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  return canEncodeSegmentedPathComponentOrQueryValue;
}

void sub_22E8776AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char *a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  *(void *)(v22 - 40) = v21;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v22 - 40));
  a10 = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a10);
  if (a21 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v22 - 41) < 0) {
    operator delete(*(void **)(v22 - 64));
  }
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(uint64_t a1@<X0>, int a2@<W1>, const void **a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  if (a5) {
    unint64_t v13 = "|";
  }
  else {
    unint64_t v13 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(v48, v13);
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, v48, (uint64_t)v46);
  if ((v47 & 0x80u) == 0) {
    unint64_t v14 = (std::string::value_type *)v46;
  }
  else {
    unint64_t v14 = (std::string::value_type *)v46[0];
  }
  if ((v47 & 0x80u) == 0) {
    uint64_t v15 = v47;
  }
  else {
    uint64_t v15 = (uint64_t)v46[1];
  }
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols(v14, v15, v45);
  long long __p = 0uLL;
  uint64_t v44 = 0;
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v41);
  int v16 = (*(uint64_t (**)(void, uint64_t *))(*(void *)v41 + 16))(v41, v45);
  if (*((void *)&v41 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v41 + 1));
  }
  if (v16)
  {
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, v38);
    std::string v17 = v38[0];
    if (*(char *)(a4 + 23) < 0) {
      std::string::__init_copy_ctor_external(&v40, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
    }
    else {
      std::string v40 = *(std::string *)a4;
    }
    (*(void (**)(long long *__return_ptr, void *, uint64_t *, std::string *))(*(void *)v17 + 56))(&v41, v17, v45, &v40);
    if (SHIBYTE(v44) < 0) {
      operator delete((void *)__p);
    }
    long long __p = v41;
    uint64_t v44 = v42;
    HIBYTE(v42) = 0;
    LOBYTE(v41) = 0;
    if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v40.__r_.__value_.__l.__data_);
    }
    if (v38[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38[1]);
    }
  }
  long long v41 = 0uLL;
  uint64_t v42 = 0;
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, v38);
  int v18 = (*(uint64_t (**)(void *, uint64_t *))(*(void *)v38[0] + 16))(v38[0], v45);
  if (v38[1]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v38[1]);
  }
  if (v18)
  {
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, v36);
    (*(void (**)(void **__return_ptr))(*(void *)v36[0] + 40))(v38);
    if (SHIBYTE(v42) < 0) {
      operator delete((void *)v41);
    }
    long long v41 = *(_OWORD *)v38;
    uint64_t v42 = v39;
    HIBYTE(v39) = 0;
    LOBYTE(v38[0]) = 0;
    if (v36[1]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v36[1]);
    }
  }
  v38[0] = 0;
  v38[1] = 0;
  uint64_t v39 = 0;
  if ((*(unsigned int (**)(void, const void **))(**(void **)(a1 + 16) + 24))(*(void *)(a1 + 16), a3))
  {
    (*(void (**)(void **__return_ptr))(**(void **)(a1 + 16) + 32))(v36);
    if (SHIBYTE(v39) < 0) {
      operator delete(v38[0]);
    }
    *(_OWORD *)uint64_t v38 = *(_OWORD *)v36;
    uint64_t v39 = v37;
  }
  v36[0] = 0;
  v36[1] = 0;
  uint64_t v37 = 0;
  if (a2)
  {
    UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v34);
    int v19 = (*(uint64_t (**)(void, const void **))(*(void *)v34 + 24))(v34, a3);
    if (*((void *)&v34 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v34 + 1));
    }
    if (v19)
    {
      UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v32);
      (*(void (**)(long long *__return_ptr))(*(void *)v32 + 32))(&v34);
      if (SHIBYTE(v37) < 0) {
        operator delete(v36[0]);
      }
      *(_OWORD *)unsigned __int8 v36 = v34;
      uint64_t v37 = v35;
      HIBYTE(v35) = 0;
      LOBYTE(v34) = 0;
      if (v33) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v33);
      }
    }
    LODWORD(v20) = 0;
  }
  else
  {
    LODWORD(v20) = 1;
  }
  int v21 = HIBYTE(v39);
  if (v39 < 0) {
    int v21 = (int)v38[1];
  }
  if (v21 < 1 || (unint64_t v22 = (v21 - a6), v21 - a6 < 0))
  {
    unsigned int v24 = 0;
    p_p = &__p;
    unint64_t v22 = 0xFFFFFFFFLL;
    if (!a2) {
      goto LABEL_56;
    }
  }
  else
  {
    p_p = (long long *)v38;
    unsigned int v24 = 1;
    if ((a2 & 1) == 0)
    {
      LODWORD(v20) = 1;
      goto LABEL_56;
    }
    LODWORD(v20) = 0;
  }
  int v25 = HIBYTE(v37);
  if (v37 < 0) {
    int v25 = (int)v36[1];
  }
  if (v25 >= 1 && v25 < v22)
  {
    LODWORD(v20) = 0;
    p_p = (long long *)v36;
    unsigned int v24 = 3;
    unint64_t v22 = v25;
  }
LABEL_56:
  int v26 = HIBYTE(v44);
  if (v44 < 0) {
    int v26 = DWORD2(__p);
  }
  if (v26 >= 1 && v26 < v22)
  {
    unsigned int v24 = 0;
    LODWORD(v20) = a2 ^ 1;
    p_p = &__p;
    unint64_t v22 = v26;
  }
  unsigned int v27 = HIBYTE(v42);
  if (v42 < 0) {
    unsigned int v27 = DWORD2(v41);
  }
  BOOL v28 = (int)v27 > 0;
  BOOL v29 = v22 > v27;
  if (v28 && v29) {
    uint64_t v20 = a2 ^ 1u;
  }
  else {
    uint64_t v20 = v20;
  }
  if (v28 && v29) {
    uint64_t v30 = &v41;
  }
  else {
    uint64_t v30 = p_p;
  }
  uint64_t v31 = 2;
  if (!v28 || !v29) {
    uint64_t v31 = v24;
  }
  UC::SUE::SegmentedURLEncoderImpl::SegmentedPathOrQueryValueEncodingResult::SegmentedPathOrQueryValueEncodingResult(a7, v31 | (v20 << 32), v30);
  if (SHIBYTE(v37) < 0) {
    operator delete(v36[0]);
  }
  if (SHIBYTE(v39) < 0) {
    operator delete(v38[0]);
  }
  if (SHIBYTE(v42) < 0) {
    operator delete((void *)v41);
  }
  if (SHIBYTE(v44) < 0) {
    operator delete((void *)__p);
  }
  *(void *)&long long __p = v45;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if ((char)v47 < 0) {
    operator delete(v46[0]);
  }
  if (v49 < 0) {
    operator delete((void *)v48[0]);
  }
}

void sub_22E877C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,void *a22,std::__shared_weak_count *a23,int a24,__int16 a25,char a26,char a27,uint64_t a28,void *a29,uint64_t a30,int a31,__int16 a32,char a33,char a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,void *__p,uint64_t a44,int a45,__int16 a46,char a47,char a48)
{
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }
  if (a48 < 0) {
    operator delete(__p);
  }
  long long __p = (void *)(v48 - 152);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (*(char *)(v48 - 105) < 0) {
    operator delete(*(void **)(v48 - 128));
  }
  if (*(char *)(v48 - 81) < 0) {
    operator delete(*(void **)(v48 - 104));
  }
  _Unwind_Resume(a1);
}

void sub_22E877DA8()
{
}

void sub_22E877DB0()
{
}

uint64_t std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>@<X0>(const void **a1@<X0>, const void **a2@<X1>, uint64_t a3@<X8>)
{
  if (*((char *)a1 + 23) >= 0) {
    size_t v5 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v5 = (size_t)a1[1];
  }
  if (*((char *)a2 + 23) >= 0) {
    size_t v6 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v6 = (size_t)a2[1];
  }
  uint64_t result = std::string::basic_string[abi:ne180100](a3, v6 + v5);
  if (*(char *)(result + 23) >= 0) {
    char v8 = (char *)result;
  }
  else {
    char v8 = *(char **)result;
  }
  if (v5)
  {
    if (*((char *)a1 + 23) >= 0) {
      uint64_t v9 = a1;
    }
    else {
      uint64_t v9 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v8, v9, v5);
  }
  std::string::size_type v10 = &v8[v5];
  if (v6)
  {
    if (*((char *)a2 + 23) >= 0) {
      uint64_t v11 = a2;
    }
    else {
      uint64_t v11 = *a2;
    }
    uint64_t result = (uint64_t)memmove(v10, v11, v6);
  }
  v10[v6] = 0;
  return result;
}

void UC::SUE::SegmentedURLEncoderImpl::_encodeURLPathComponent(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, int a4@<W3>, uint64_t a5@<X8>)
{
  v61[2] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(unsigned __int8 *)(a2 + 23);
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *(void *)(a2 + 8);
  }
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Cannot encode empty path", 24);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(a1, 1, (const void **)a2, (uint64_t)&__p, a4, 0, (uint64_t)&v57);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (HIDWORD(v57)) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForPathComponentEncodingType(v57, &__p);
  if (v59 >= 0) {
    uint64_t v11 = (const std::string::value_type *)&v58;
  }
  else {
    uint64_t v11 = (const std::string::value_type *)v58;
  }
  if (v59 >= 0) {
    std::string::size_type v12 = HIBYTE(v59);
  }
  else {
    std::string::size_type v12 = *((void *)&v58 + 1);
  }
  unint64_t v13 = std::string::append(&__p, v11, v12);
  unint64_t v14 = (void *)v13->__r_.__value_.__r.__words[0];
  v61[0] = v13->__r_.__value_.__l.__size_;
  *(void *)((char *)v61 + 7) = *(std::string::size_type *)((char *)&v13->__r_.__value_.__r.__words[1] + 7);
  int v15 = SHIBYTE(v13->__r_.__value_.__r.__words[2]);
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
    if (a3) {
      goto LABEL_15;
    }
LABEL_70:
    uint64_t v42 = v61[0];
    *(void *)a5 = v14;
    *(void *)(a5 + 8) = v42;
    *(void *)(a5 + 15) = *(void *)((char *)v61 + 7);
    *(unsigned char *)(a5 + 23) = v15;
    goto LABEL_76;
  }
  operator delete(__p.__r_.__value_.__l.__data_);
  if ((a3 & 1) == 0) {
    goto LABEL_70;
  }
LABEL_15:
  uint64_t v45 = v14;
  int v46 = v15;
  std::string::basic_string[abi:ne180100]<0>(v52, "");
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(a1, 1, (const void **)a2, (uint64_t)v52, 1, 0, (uint64_t)&__p);
  std::string::size_type v57 = __p.__r_.__value_.__r.__words[0];
  if (SHIBYTE(v59) < 0) {
    operator delete((void *)v58);
  }
  long long v58 = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
  uint64_t v59 = v55;
  HIBYTE(v55) = 0;
  __p.__r_.__value_.__s.__data_[8] = 0;
  char v60 = v56;
  if (SHIBYTE(v53) < 0) {
    operator delete(v52[0]);
  }
  if (HIDWORD(v57)) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForPathComponentEncodingType(v57, &__p);
  if (v59 >= 0) {
    int v16 = (const std::string::value_type *)&v58;
  }
  else {
    int v16 = (const std::string::value_type *)v58;
  }
  if (v59 >= 0) {
    std::string::size_type v17 = HIBYTE(v59);
  }
  else {
    std::string::size_type v17 = *((void *)&v58 + 1);
  }
  int v18 = std::string::append(&__p, v16, v17);
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  int64_t v53 = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)BOOL v52 = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "10");
  if (v53 >= 0) {
    uint64_t v20 = v52;
  }
  else {
    uint64_t v20 = (void **)v52[0];
  }
  if (v53 >= 0) {
    std::string::size_type v21 = HIBYTE(v53);
  }
  else {
    std::string::size_type v21 = (std::string::size_type)v52[1];
  }
  unint64_t v22 = std::string::insert(&__p, 0, (const std::string::value_type *)v20, v21);
  std::string::size_type size = v22->__r_.__value_.__l.__size_;
  uint64_t v44 = (void *)v22->__r_.__value_.__r.__words[0];
  v51[0] = v22->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v51 + 3) = *(_DWORD *)((char *)&v22->__r_.__value_.__r.__words[2] + 3);
  std::string::size_type v24 = HIBYTE(v22->__r_.__value_.__r.__words[2]);
  int v25 = (char)v24;
  v22->__r_.__value_.__r.__words[0] = 0;
  v22->__r_.__value_.__l.__size_ = 0;
  v22->__r_.__value_.__r.__words[2] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (*(char *)(a2 + 23) >= 0) {
    size_t v26 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    size_t v26 = *(void *)(a2 + 8);
  }
  unsigned int v27 = v49;
  std::string::basic_string[abi:ne180100]((uint64_t)v49, v26 + 1);
  if (v50 < 0) {
    unsigned int v27 = (void **)v49[0];
  }
  if (v26)
  {
    if (*(char *)(a2 + 23) >= 0) {
      BOOL v28 = (const void *)a2;
    }
    else {
      BOOL v28 = *(const void **)a2;
    }
    memmove(v27, v28, v26);
  }
  *(_WORD *)((char *)v27 + v26) = 47;
  std::string::basic_string[abi:ne180100]<0>(v47, "");
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(a1, 1, (const void **)v49, (uint64_t)v47, a4, 0, (uint64_t)&__p);
  std::string::size_type v57 = __p.__r_.__value_.__r.__words[0];
  if (SHIBYTE(v59) < 0) {
    operator delete((void *)v58);
  }
  long long v58 = *(_OWORD *)&__p.__r_.__value_.__r.__words[1];
  uint64_t v59 = v55;
  HIBYTE(v55) = 0;
  __p.__r_.__value_.__s.__data_[8] = 0;
  char v60 = v56;
  if (v48 < 0) {
    operator delete(v47[0]);
  }
  if (HIDWORD(v57)) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForPathComponentEncodingType(v57, &__p);
  if (v59 >= 0) {
    BOOL v29 = (const std::string::value_type *)&v58;
  }
  else {
    BOOL v29 = (const std::string::value_type *)v58;
  }
  if (v59 >= 0) {
    std::string::size_type v30 = HIBYTE(v59);
  }
  else {
    std::string::size_type v30 = *((void *)&v58 + 1);
  }
  uint64_t v31 = std::string::append(&__p, v29, v30);
  uint64_t v32 = (void *)v31->__r_.__value_.__r.__words[0];
  std::string::size_type v33 = v31->__r_.__value_.__l.__size_;
  LODWORD(v47[0]) = v31->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v47 + 3) = *(_DWORD *)((char *)&v31->__r_.__value_.__r.__words[2] + 3);
  std::string::size_type v34 = HIBYTE(v31->__r_.__value_.__r.__words[2]);
  char v35 = HIBYTE(v31->__r_.__value_.__r.__words[2]);
  v31->__r_.__value_.__r.__words[0] = 0;
  v31->__r_.__value_.__l.__size_ = 0;
  v31->__r_.__value_.__r.__words[2] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if ((v24 & 0x80u) == 0) {
    std::string::size_type v36 = v24;
  }
  else {
    std::string::size_type v36 = size;
  }
  if ((v34 & 0x80u) == 0) {
    std::string::size_type v37 = v34;
  }
  else {
    std::string::size_type v37 = v33;
  }
  uint64_t v38 = (_DWORD *)(a5 + 16);
  if (v36 >= v37)
  {
    *(void *)a5 = v32;
    *(void *)(a5 + 8) = v33;
    int v41 = v46;
    *uint64_t v38 = v47[0];
    *(_DWORD *)(a5 + 19) = *(_DWORD *)((char *)v47 + 3);
    *(unsigned char *)(a5 + 23) = v35;
    std::string v40 = v44;
    uint64_t v39 = v45;
  }
  else
  {
    *(void *)a5 = v44;
    *(void *)(a5 + 8) = size;
    *uint64_t v38 = v51[0];
    *(_DWORD *)(a5 + 19) = *(_DWORD *)((char *)v51 + 3);
    *(unsigned char *)(a5 + 23) = v24;
    uint64_t v39 = v45;
    if ((char)v34 < 0) {
      operator delete(v32);
    }
    int v25 = 0;
    std::string v40 = 0;
    int v41 = v46;
  }
  if (v50 < 0)
  {
    operator delete(v49[0]);
    if ((v25 & 0x80000000) == 0) {
      goto LABEL_74;
    }
  }
  else if ((v25 & 0x80000000) == 0)
  {
    goto LABEL_74;
  }
  operator delete(v40);
LABEL_74:
  if (SHIBYTE(v53) < 0)
  {
    operator delete(v52[0]);
    if ((v41 & 0x80000000) == 0) {
      goto LABEL_76;
    }
  }
  else if ((v41 & 0x80000000) == 0)
  {
    goto LABEL_76;
  }
  operator delete(v39);
LABEL_76:
  if (SHIBYTE(v59) < 0) {
    operator delete((void *)v58);
  }
}

void sub_22E8783A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, int a11, int a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,uint64_t a25,void *a26,uint64_t a27,int a28,__int16 a29,char a30,char a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,void *a41,uint64_t a42,int a43,__int16 a44,char a45,char a46)
{
  if (a37 < 0) {
    operator delete(__p);
  }
  if (a24 < 0) {
    operator delete(a19);
  }
  if (v46 < 0) {
    operator delete(a9);
  }
  if (a31 < 0) {
    operator delete(a26);
  }
  if (a12 < 0) {
    operator delete(a10);
  }
  if (a46 < 0) {
    operator delete(a41);
  }
  _Unwind_Resume(exception_object);
}

void UC::Exception::InternalCoderError::~InternalCoderError(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26E242AC8;
  if (SHIBYTE(this[7].__vftable) < 0) {
    operator delete(this[5].__vftable);
  }
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

{
  void *v2;
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26E242AC8;
  if (SHIBYTE(this[7].__vftable) < 0) {
    operator delete(this[5].__vftable);
  }
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  operator delete(v2);
}

void *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForPathComponentEncodingType@<X0>(unsigned int a1@<W1>, void *a2@<X8>)
{
  if (a1 >= 4)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown path component type", 27);
  }
  uint64_t v2 = off_2649E0CE8[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void sub_22E8785C4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedQueryComponent(std::string *this@<X1>, UC::SUE::UCSegmentedURLCoderProvider **a2@<X0>, int a3@<W2>, uint64_t a4@<X8>)
{
  std::string::size_type v8 = std::string::find(this, 61, 0);
  std::string::basic_string(&v61, this, 0, v8, (std::allocator<char> *)&v41);
  std::string::basic_string(&v60, this, v8 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v41);
  if (a3) {
    uint64_t v9 = "|";
  }
  else {
    uint64_t v9 = "";
  }
  std::string::basic_string[abi:ne180100]<0>(v58, v9);
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)&v61.__r_.__value_.__l.__data_, v58, (uint64_t)v56);
  std::string::basic_string[abi:ne180100]<0>(&v41, "|");
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v10 = &v61;
  }
  else {
    std::string::size_type v10 = (std::string *)v61.__r_.__value_.__r.__words[0];
  }
  if ((v61.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v61.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v61.__r_.__value_.__l.__size_;
  }
  std::string::size_type v12 = std::string::insert(&v41, 0, (const std::string::value_type *)v10, size);
  long long v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  int64_t v55 = v12->__r_.__value_.__r.__words[2];
  long long v54 = v13;
  v12->__r_.__value_.__l.__size_ = 0;
  v12->__r_.__value_.__r.__words[2] = 0;
  v12->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v41.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v41.__r_.__value_.__l.__data_);
  }
  if ((v57 & 0x80u) == 0) {
    unint64_t v14 = (std::string::value_type *)v56;
  }
  else {
    unint64_t v14 = (std::string::value_type *)v56[0];
  }
  if ((v57 & 0x80u) == 0) {
    uint64_t v15 = v57;
  }
  else {
    uint64_t v15 = (uint64_t)v56[1];
  }
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols(v14, v15, (uint64_t *)&v53);
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*a2, &v41);
  std::string::size_type v16 = v41.__r_.__value_.__r.__words[0];
  std::string::basic_string[abi:ne180100]<0>(__p, "?");
  (*(void (**)(void **__return_ptr, std::string::size_type, std::vector<std::string> *, void **))(*(void *)v16 + 56))(&v50, v16, &v53, __p);
  if (v49 < 0) {
    operator delete(__p[0]);
  }
  if (v41.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v41.__r_.__value_.__l.__size_);
  }
  if (v55 >= 0) {
    std::string::size_type v17 = (std::string::value_type *)&v54;
  }
  else {
    std::string::size_type v17 = (std::string::value_type *)v54;
  }
  if (v55 >= 0) {
    uint64_t v18 = HIBYTE(v55);
  }
  else {
    uint64_t v18 = *((void *)&v54 + 1);
  }
  UC::SUE::SegmentedURLEncoderImpl::_tokenizeStringWithSingleCharacterSymbols(v17, v18, (uint64_t *)&v41);
  std::vector<std::string>::__vdeallocate(&v53);
  std::vector<std::string> v53 = (std::vector<std::string>)v41;
  memset(&v41, 0, sizeof(v41));
  uint64_t v45 = &v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*a2, &v41);
  std::string::size_type v19 = v41.__r_.__value_.__r.__words[0];
  std::string::basic_string[abi:ne180100]<0>(v43, "?");
  (*(void (**)(void **__return_ptr, std::string::size_type, std::vector<std::string> *, void **))(*(void *)v19 + 56))(&v45, v19, &v53, v43);
  if (v44 < 0) {
    operator delete(v43[0]);
  }
  if (v41.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v41.__r_.__value_.__l.__size_);
  }
  int v20 = v47;
  int v21 = v46;
  int v22 = v52;
  int v23 = v51;
  std::string::basic_string[abi:ne180100]<0>(&v40, "=");
  if ((v20 & 0x80u) == 0) {
    int v24 = v20;
  }
  else {
    int v24 = v21;
  }
  if ((v22 & 0x80u) == 0) {
    int v25 = v22;
  }
  else {
    int v25 = v23;
  }
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent((uint64_t)a2, 0, (const void **)&v60.__r_.__value_.__l.__data_, (uint64_t)&v40, a3, v24 - v25, (uint64_t)&v41);
  if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v40.__r_.__value_.__l.__data_);
  }
  *(void *)a4 = 0;
  *(void *)(a4 + 8) = 0;
  *(void *)(a4 + 16) = 0;
  if (HIDWORD(v41.__r_.__value_.__r.__words[0]) != 1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  if (LODWORD(v41.__r_.__value_.__l.__data_) == 1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v39, "01");
    if ((v42 & 0x80u) == 0) {
      size_t v26 = &v41.__r_.__value_.__s.__data_[8];
    }
    else {
      size_t v26 = (const std::string::value_type *)v41.__r_.__value_.__l.__size_;
    }
    if ((v42 & 0x80u) == 0) {
      std::string::size_type v27 = v42;
    }
    else {
      std::string::size_type v27 = v41.__r_.__value_.__r.__words[2];
    }
    BOOL v28 = std::string::append(&v39, v26, v27);
    long long v29 = *(_OWORD *)&v28->__r_.__value_.__l.__data_;
    v40.__r_.__value_.__r.__words[2] = v28->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v29;
    v28->__r_.__value_.__l.__size_ = 0;
    v28->__r_.__value_.__r.__words[2] = 0;
    v28->__r_.__value_.__r.__words[0] = 0;
    if ((v52 & 0x80u) == 0) {
      std::string::size_type v30 = (const std::string::value_type *)&v50;
    }
    else {
      std::string::size_type v30 = (const std::string::value_type *)v50;
    }
    if ((v52 & 0x80u) == 0) {
      std::string::size_type v31 = v52;
    }
    else {
      std::string::size_type v31 = v51;
    }
  }
  else
  {
    UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForQueryComponentEncodingType(v41.__r_.__value_.__l.__data_, &v39);
    if ((v47 & 0x80u) == 0) {
      uint64_t v32 = (const std::string::value_type *)&v45;
    }
    else {
      uint64_t v32 = (const std::string::value_type *)v45;
    }
    if ((v47 & 0x80u) == 0) {
      std::string::size_type v33 = v47;
    }
    else {
      std::string::size_type v33 = v46;
    }
    std::string::size_type v34 = std::string::append(&v39, v32, v33);
    long long v35 = *(_OWORD *)&v34->__r_.__value_.__l.__data_;
    v40.__r_.__value_.__r.__words[2] = v34->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v40.__r_.__value_.__l.__data_ = v35;
    v34->__r_.__value_.__l.__size_ = 0;
    v34->__r_.__value_.__r.__words[2] = 0;
    v34->__r_.__value_.__r.__words[0] = 0;
    if ((v42 & 0x80u) == 0) {
      std::string::size_type v30 = &v41.__r_.__value_.__s.__data_[8];
    }
    else {
      std::string::size_type v30 = (const std::string::value_type *)v41.__r_.__value_.__l.__size_;
    }
    if ((v42 & 0x80u) == 0) {
      std::string::size_type v31 = v42;
    }
    else {
      std::string::size_type v31 = v41.__r_.__value_.__r.__words[2];
    }
  }
  std::string::size_type v36 = std::string::append(&v40, v30, v31);
  std::string::size_type v37 = v36->__r_.__value_.__l.__size_;
  *(void *)a4 = v36->__r_.__value_.__r.__words[0];
  *(void *)(a4 + 8) = v37;
  *(void *)(a4 + 15) = *(std::string::size_type *)((char *)&v36->__r_.__value_.__r.__words[1] + 7);
  LOBYTE(v37) = *((unsigned char *)&v36->__r_.__value_.__s + 23);
  v36->__r_.__value_.__l.__size_ = 0;
  v36->__r_.__value_.__r.__words[2] = 0;
  v36->__r_.__value_.__r.__words[0] = 0;
  int v38 = SHIBYTE(v40.__r_.__value_.__r.__words[2]);
  *(unsigned char *)(a4 + 23) = v37;
  if (v38 < 0) {
    operator delete(v40.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v39.__r_.__value_.__l.__data_);
  }
  if ((char)v42 < 0) {
    operator delete((void *)v41.__r_.__value_.__l.__size_);
  }
  if ((char)v47 < 0) {
    operator delete(v45);
  }
  if ((char)v52 < 0) {
    operator delete(v50);
  }
  v41.__r_.__value_.__r.__words[0] = (std::string::size_type)&v53;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v41);
  if (SHIBYTE(v55) < 0) {
    operator delete((void *)v54);
  }
  if ((char)v57 < 0) {
    operator delete(v56[0]);
  }
  if (v59 < 0) {
    operator delete((void *)v58[0]);
  }
  if (SHIBYTE(v60.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v60.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v61.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v61.__r_.__value_.__l.__data_);
  }
}

void sub_22E878A98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,char *a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,int a34,__int16 a35,char a36,char a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,int a49,__int16 a50,char a51,char a52,char a53)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (a43 < 0) {
    operator delete(a38);
  }
  if (a52 < 0) {
    operator delete(a47);
  }
  a23 = &a53;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  if (*(char *)(v53 - 169) < 0) {
    operator delete(*(void **)(v53 - 192));
  }
  if (*(char *)(v53 - 137) < 0) {
    operator delete(*(void **)(v53 - 160));
  }
  if (*(char *)(v53 - 113) < 0) {
    operator delete(*(void **)(v53 - 136));
  }
  if (*(char *)(v53 - 89) < 0) {
    operator delete(*(void **)(v53 - 112));
  }
  if (*(char *)(v53 - 65) < 0) {
    operator delete(*(void **)(v53 - 88));
  }
  _Unwind_Resume(a1);
}

void sub_22E878BC8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, std::__shared_weak_count *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *__p,uint64_t a30,int a31,__int16 a32,char a33,char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  if (a18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a18);
  }
  JUMPOUT(0x22E878B60);
}

void sub_22E878BF4()
{
}

void sub_22E878BFC()
{
}

void sub_22E878C04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    JUMPOUT(0x22E878B7CLL);
  }
  JUMPOUT(0x22E878B80);
}

void sub_22E878C18()
{
}

void sub_22E878C20()
{
}

void sub_22E878C28()
{
}

void sub_22E878C30()
{
}

void *UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForQueryComponentEncodingType@<X0>(unsigned int a1@<W1>, void *a2@<X8>)
{
  if (a1 >= 3)
  {
    exception = __cxa_allocate_exception(0x40uLL);
    UC::Exception::InternalCoderError::InternalCoderError(exception, "UCSegmentedURLCoderErrorDomain", 30, 0, "Unknown query component type", 28);
  }
  uint64_t v2 = off_2649E0D20[a1];
  return std::string::basic_string[abi:ne180100]<0>(a2, v2);
}

void sub_22E878CC8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v3 = a2[1] - *a2;
  if (v3)
  {
    uint64_t v6 = 0;
    unint64_t v7 = v3 / 24;
    if (v7 <= 1) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = v7;
    }
    do
    {
      uint64_t v9 = (long long *)(*a2 + v6);
      if (*((char *)v9 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__s, *(const std::string::value_type **)v9, *((void *)v9 + 1));
      }
      else
      {
        long long v10 = *v9;
        __s.__r_.__value_.__r.__words[2] = *((void *)v9 + 2);
        *(_OWORD *)&__s.__r_.__value_.__l.__data_ = v10;
      }
      std::string::size_type size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      char v12 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = __s.__r_.__value_.__l.__size_;
      }
      if (size)
      {
        unint64_t v13 = a3[1];
        if (v13 >= a3[2])
        {
          uint64_t v15 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (long long *)&__s);
        }
        else
        {
          if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)a3[1], __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
          }
          else
          {
            long long v14 = *(_OWORD *)&__s.__r_.__value_.__l.__data_;
            *(void *)(v13 + 16) = *((void *)&__s.__r_.__value_.__l + 2);
            *(_OWORD *)unint64_t v13 = v14;
          }
          uint64_t v15 = v13 + 24;
          a3[1] = v13 + 24;
        }
        a3[1] = v15;
        char v12 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      }
      if (v12 < 0) {
        operator delete(__s.__r_.__value_.__l.__data_);
      }
      v6 += 24;
      --v8;
    }
    while (v8);
  }
}

void sub_22E878DF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  *(void *)(v14 + 8) = v15;
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UC::SUE::SegmentedURLEncoderImpl::_pathAndQueryMatchPathWordBookAndAutoQueryTemplateFormat(UC::SUE::UCSegmentedURLCoderProvider **a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3 = a3;
  uint64_t v5 = *((unsigned __int8 *)a2 + 23);
  uint64_t v6 = a2[1];
  if ((v5 & 0x80u) == 0) {
    unint64_t v7 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    unint64_t v7 = a2[1];
  }
  if (v7 >= 2)
  {
    uint64_t v8 = (v5 & 0x80u) == 0 ? (uint64_t)a2 : *a2;
    if (*(unsigned char *)(v7 + v8 - 1) == 47) {
      return 0;
    }
  }
  if ((v5 & 0x80) != 0)
  {
    if (v6 != 1)
    {
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      goto LABEL_22;
    }
    uint64_t v9 = (unsigned char *)*a2;
    goto LABEL_14;
  }
  uint64_t v9 = a2;
  if (v5 == 1)
  {
LABEL_14:
    if (*v9 != 47) {
      goto LABEL_18;
    }
    uint64_t v10 = *((unsigned __int8 *)a3 + 23);
    if ((v10 & 0x80u) != 0) {
      uint64_t v10 = a3[1];
    }
    if (v10)
    {
LABEL_18:
      uint64_t v44 = 0;
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      if ((v5 & 0x80) == 0) {
        goto LABEL_23;
      }
LABEL_22:
      a2 = (uint64_t *)*a2;
      uint64_t v5 = v6;
      goto LABEL_23;
    }
    return 0;
  }
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
LABEL_23:
  UC::SplitString((unsigned __int8 *)a2, v5, 0x2Fu, &v44);
  std::string v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v12, &v44, (uint64_t *)&v41);
  if (0xAAAAAAAAAAAAAAABLL * ((v42 - (uint64_t)v41) >> 3) > 1) {
    goto LABEL_24;
  }
  if (v42 - (void)v41 == 24)
  {
    UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*a1, &v38);
    char v14 = ((uint64_t (*)(void ***, void **))(*v38)[3])(v38, v41);
    if (v39) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v39);
    }
    if ((v14 & 1) == 0) {
      goto LABEL_24;
    }
  }
  uint64_t v15 = *((unsigned __int8 *)v3 + 23);
  if ((*((char *)v3 + 23) & 0x80000000) == 0)
  {
    if (*((unsigned char *)v3 + 23))
    {
      uint64_t v16 = *((unsigned __int8 *)v3 + 23);
      goto LABEL_35;
    }
LABEL_38:
    uint64_t v11 = 1;
    goto LABEL_25;
  }
  uint64_t v16 = v3[1];
  if (!v16) {
    goto LABEL_38;
  }
LABEL_35:
  uint64_t v17 = v16 - 1;
  if ((v15 & 0x80) != 0)
  {
    uint64_t v18 = (uint64_t *)*v3;
    if (*(unsigned char *)(*v3 + v17) != 38)
    {
      int v38 = 0;
      std::string v39 = 0;
      uint64_t v15 = v3[1];
      uint64_t v3 = v18;
      goto LABEL_41;
    }
LABEL_24:
    uint64_t v11 = 0;
    goto LABEL_25;
  }
  if (*((unsigned char *)v3 + v17) == 38) {
    goto LABEL_24;
  }
  int v38 = 0;
  std::string v39 = 0;
LABEL_41:
  uint64_t v40 = 0;
  UC::SplitString((unsigned __int8 *)v3, v15, 0x26u, (uint64_t *)&v38);
  long long v35 = 0;
  std::string::size_type v36 = 0;
  uint64_t v37 = 0;
  UC::SUE::SegmentedURLEncoderImpl::_filterByComponentsToKeep(v19, &v38, (uint64_t *)&v35);
  int v20 = v35;
  int v21 = (const std::string *)v36;
  if (v35 == (const std::string *)v36)
  {
LABEL_85:
    uint64_t v11 = 1;
    goto LABEL_87;
  }
  uint64_t v22 = 0;
  while (1)
  {
    std::string::size_type v23 = std::string::find(v20, 61, 0);
    if (v23 == -1) {
      break;
    }
    std::string::size_type v24 = v23;
    std::string::basic_string(&__str, v20, 0, v23, (std::allocator<char> *)&v33);
    std::string::basic_string(&v33, v20, v24 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&__p);
    if ((*((unsigned char *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
    {
      if (!__str.__r_.__value_.__l.__size_) {
        goto LABEL_70;
      }
      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (!*((unsigned char *)&__str.__r_.__value_.__s + 23)) {
        goto LABEL_70;
      }
      p_str = &__str;
    }
    if (p_str->__r_.__value_.__s.__data_[0] != 112) {
      goto LABEL_70;
    }
    if (!v22)
    {
      if ((*((unsigned char *)&__str.__r_.__value_.__s + 23) & 0x80) != 0)
      {
        if (__str.__r_.__value_.__l.__size_ == 1)
        {
          BOOL v28 = (std::string *)__str.__r_.__value_.__r.__words[0];
          goto LABEL_67;
        }
      }
      else if (HIBYTE(__str.__r_.__value_.__r.__words[2]) == 1)
      {
        BOOL v28 = &__str;
LABEL_67:
        if (v28->__r_.__value_.__s.__data_[0] == 112)
        {
          int v30 = 3;
          uint64_t v22 = 1;
          goto LABEL_71;
        }
      }
      uint64_t v22 = 0;
LABEL_70:
      int v30 = 1;
      goto LABEL_71;
    }
    std::string::basic_string(&__p, &__str, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v47);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
      if (!__p.__r_.__value_.__l.__size_)
      {
        int v30 = 1;
LABEL_84:
        operator delete(__p.__r_.__value_.__l.__data_);
        goto LABEL_71;
      }
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    else
    {
      std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
        goto LABEL_70;
      }
      p_p = &__p;
    }
    if ((UC::IsAllDigits((unsigned __int8 *)p_p, size) & 1) == 0) {
      goto LABEL_63;
    }
    long long v29 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      long long v29 = &__p;
    }
    if (v29->__r_.__value_.__s.__data_[0] == 48)
    {
LABEL_63:
      int v30 = 1;
      if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0) {
        goto LABEL_71;
      }
      goto LABEL_84;
    }
    int v31 = std::stoi(&__p, 0, 10);
    int v30 = v22 != v31;
    if (v22 == v31) {
      ++v22;
    }
    if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0) {
      goto LABEL_84;
    }
LABEL_71:
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v33.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__str.__r_.__value_.__l.__data_);
    }
    if (v30 != 3 && v30) {
      break;
    }
    if (++v20 == v21) {
      goto LABEL_85;
    }
  }
  uint64_t v11 = 0;
LABEL_87:
  __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
  long long v35 = (const std::string *)&v38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
LABEL_25:
  int v38 = &v41;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v38);
  std::string v41 = (void **)&v44;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v41);
  return v11;
}

void sub_22E87923C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t **a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31)
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
  a21 = &a27;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  a27 = &a30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a27);
  a30 = v31 - 104;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a30);
  *(void *)(v31 - 104) = v31 - 80;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)(v31 - 104));
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLEncoderImpl::_encodePathWordBookAndAutoQueryTemplateQueryComponent(std::string *this@<X1>, uint64_t a2@<X0>, int a3@<W2>, std::string *a4@<X8>)
{
  std::string::size_type v8 = std::string::find(this, 61, 0);
  std::string::basic_string(&v16, this, v8 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v13);
  std::string::basic_string[abi:ne180100]<0>(&__p, "=");
  UC::SUE::SegmentedURLEncoderImpl::_encodeSegmentedPathOrQueryValueComponent(a2, 0, (const void **)&v16.__r_.__value_.__l.__data_, (uint64_t)&__p, a3, 0, (uint64_t)v13);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v13[1] != 1) {
    std::__throw_bad_variant_access[abi:ne180100]();
  }
  UC::SUE::SegmentedURLEncoderImpl::_encodingBitsForQueryComponentEncodingType(v13[0], &__p);
  if ((v15 & 0x80u) == 0) {
    uint64_t v9 = v14;
  }
  else {
    uint64_t v9 = (void **)v14[0];
  }
  if ((v15 & 0x80u) == 0) {
    std::string::size_type v10 = v15;
  }
  else {
    std::string::size_type v10 = (std::string::size_type)v14[1];
  }
  uint64_t v11 = std::string::append(&__p, (const std::string::value_type *)v9, v10);
  *a4 = *v11;
  v11->__r_.__value_.__l.__size_ = 0;
  v11->__r_.__value_.__r.__words[2] = 0;
  v11->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if ((char)v15 < 0) {
    operator delete(v14[0]);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v16.__r_.__value_.__l.__data_);
  }
}

void sub_22E87943C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a22 < 0) {
    operator delete(a17);
  }
  if (*(char *)(v22 - 33) < 0) {
    operator delete(*(void **)(v22 - 56));
  }
  _Unwind_Resume(exception_object);
}

void *UC::SUE::SegmentedURLDecoderImpl::SegmentedURLDecoderImpl(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  a1[2] = 0;
  std::string::size_type v4 = operator new(8uLL);
  *std::string::size_type v4 = &unk_26E242B30;
  a1[2] = v4;
  return a1;
}

void sub_22E879504(_Unwind_Exception *exception_object)
{
  *(void *)(v1 + 16) = 0;
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UC::SUE::SegmentedURLDecoderImpl::_decodeHostFormatType(UC::SUE::SegmentedURLDecoderImpl *this, UC::UCBitStream *a2)
{
  uint64_t result = UC::UCBitStream::readNextBit(a2);
  if (result)
  {
    if (UC::UCBitStream::readNextBit(a2)) {
      return 2;
    }
    else {
      return 1;
    }
  }
  return result;
}

uint64_t UC::SUE::SegmentedURLDecoderImpl::_decodeQueryComponentEncodingType(UC::SUE::SegmentedURLDecoderImpl *this, UC::UCBitStream *a2)
{
  int NextBit = UC::UCBitStream::readNextBit(a2);
  int v4 = UC::UCBitStream::readNextBit(a2);
  if (!NextBit) {
    return v4 != 0;
  }
  if (v4)
  {
    exception = __cxa_allocate_exception(0x38uLL);
    UC::Exception::InvalidDecodingInstruction::InvalidDecodingInstruction(exception, "11", 2, "Encountered an invalid instruction (11) for query component decoding.", 69);
  }
  return 2;
}

void sub_22E8795F8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::Exception::InvalidDecodingInstruction::~InvalidDecodingInstruction(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26E242B08;
  if (SHIBYTE(this[6].__vftable) < 0) {
    operator delete(this[4].__vftable);
  }
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

{
  void *v2;
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26E242B08;
  if (SHIBYTE(this[6].__vftable) < 0) {
    operator delete(this[4].__vftable);
  }
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  operator delete(v2);
}

void UC::SUE::SegmentedURLDecoderImpl::decodeURL(UC::SUE::UCSegmentedURLCoderProvider **this@<X0>, UC::UCBitStream *a2@<X1>, std::string *a3@<X8>)
{
  if (UC::UCBitStream::hasMore(a2))
  {
    int NextBit = UC::UCBitStream::readNextBit(a2);
    unint64_t v7 = (UC::SUE::SegmentedURLDecoderImpl *)UC::UCBitStream::readNextBit(a2);
    int v8 = (int)v7;
    int v9 = UC::SUE::SegmentedURLDecoderImpl::_decodeHostFormatType(v7, a2);
    std::string::basic_string[abi:ne180100]<0>(a3, "https://");
    memset(&v35, 0, sizeof(v35));
    if (v8) {
      std::string::append(&v35, "appclip.");
    }
    if (v9 == 2)
    {
      UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(*this, &v29);
      std::string::size_type v10 = v29;
      std::string::basic_string[abi:ne180100]<0>(v23, "|");
      (*(void (**)(void **__return_ptr, void *, UC::UCBitStream *, void **))(*(void *)v10 + 48))(&__p, v10, a2, v23);
      if ((v34 & 0x80u) == 0) {
        p_p = (const std::string::value_type *)&__p;
      }
      else {
        p_p = (const std::string::value_type *)__p;
      }
      if ((v34 & 0x80u) == 0) {
        std::string::size_type v12 = v34;
      }
      else {
        std::string::size_type v12 = (std::string::size_type)v33;
      }
      std::string::append(&v35, p_p, v12);
      if ((char)v34 < 0) {
        operator delete(__p);
      }
      if (v24 < 0) {
        operator delete(v23[0]);
      }
      if (v30) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v30);
      }
      goto LABEL_46;
    }
    if (v9 == 1)
    {
      UC::SUE::UCSegmentedURLCoderProvider::getTLDFixedLengthCoder(*this, &__p);
    }
    else
    {
      if (v9)
      {
LABEL_46:
        if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          uint64_t v19 = &v35;
        }
        else {
          uint64_t v19 = (std::string *)v35.__r_.__value_.__r.__words[0];
        }
        if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string::size_type size = HIBYTE(v35.__r_.__value_.__r.__words[2]);
        }
        else {
          std::string::size_type size = v35.__r_.__value_.__l.__size_;
        }
        std::string::append(a3, (const std::string::value_type *)v19, size);
        if (UC::UCBitStream::hasMore(a2))
        {
          if (NextBit)
          {
            UC::SUE::SegmentedURLDecoderImpl::_decodeRestOfURLWithPathWordBookAndAutoQueryTemplateFormat((uint64_t *)&__p, (UC::SUE::SegmentedURLDecoderImpl *)this, a2);
            if ((v34 & 0x80u) == 0) {
              int v21 = (const std::string::value_type *)&__p;
            }
            else {
              int v21 = (const std::string::value_type *)__p;
            }
            if ((v34 & 0x80u) == 0) {
              std::string::size_type v22 = v34;
            }
            else {
              std::string::size_type v22 = (std::string::size_type)v33;
            }
          }
          else
          {
            UC::SUE::SegmentedURLDecoderImpl::_decodeRestOfURLWithNonTemplateFormat((UC::SUE::SegmentedURLDecoderImpl *)this, a2, (uint64_t)&__p);
            if ((v34 & 0x80u) == 0) {
              int v21 = (const std::string::value_type *)&__p;
            }
            else {
              int v21 = (const std::string::value_type *)__p;
            }
            if ((v34 & 0x80u) == 0) {
              std::string::size_type v22 = v34;
            }
            else {
              std::string::size_type v22 = (std::string::size_type)v33;
            }
          }
          std::string::append(a3, v21, v22);
          if ((char)v34 < 0) {
            operator delete(__p);
          }
        }
        if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v35.__r_.__value_.__l.__data_);
        }
        return;
      }
      UC::SUE::UCSegmentedURLCoderProvider::getTLDCoder((uint64_t)*this, &__p);
    }
    unint64_t v13 = __p;
    if (v33) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v33);
    }
    (*(void (**)(void **__return_ptr, void *, UC::UCBitStream *))(*(void *)v13 + 56))(&__p, v13, a2);
    UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(*this, &v27);
    uint64_t v14 = v27;
    std::string::basic_string[abi:ne180100]<0>(v25, "|");
    (*(void (**)(void **__return_ptr, uint64_t, UC::UCBitStream *, void **))(*(void *)v14 + 48))(&v29, v14, a2, v25);
    if ((v31 & 0x80u) == 0) {
      unsigned __int8 v15 = (const std::string::value_type *)&v29;
    }
    else {
      unsigned __int8 v15 = (const std::string::value_type *)v29;
    }
    if ((v31 & 0x80u) == 0) {
      std::string::size_type v16 = v31;
    }
    else {
      std::string::size_type v16 = (std::string::size_type)v30;
    }
    std::string::append(&v35, v15, v16);
    if ((char)v31 < 0) {
      operator delete(v29);
    }
    if (v26 < 0) {
      operator delete(v25[0]);
    }
    if (v28) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v28);
    }
    if ((v34 & 0x80u) == 0) {
      uint64_t v17 = (const std::string::value_type *)&__p;
    }
    else {
      uint64_t v17 = (const std::string::value_type *)__p;
    }
    if ((v34 & 0x80u) == 0) {
      std::string::size_type v18 = v34;
    }
    else {
      std::string::size_type v18 = (std::string::size_type)v33;
    }
    std::string::append(&v35, v17, v18);
    if ((char)v34 < 0) {
      operator delete(__p);
    }
    goto LABEL_46;
  }
  std::string::basic_string[abi:ne180100]<0>(a3, "");
}

void sub_22E8799FC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  if (a35 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v36 - 49) < 0) {
    operator delete(*(void **)(v36 - 72));
  }
  if (*(char *)(v35 + 23) < 0) {
    operator delete(*(void **)v35);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UC::SUE::SegmentedURLDecoderImpl::_decodeRestOfURLWithPathWordBookAndAutoQueryTemplateFormat(UC::SUE::SegmentedURLDecoderImpl *this, UC::UCBitStream *a2)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v17);
  if (UC::UCBitStream::readNextBit(a2))
  {
    LOBYTE(__p) = 47;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
LABEL_15:
    LOBYTE(__p) = 63;
    unint64_t v7 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
    UC::SUE::SegmentedURLDecoderImpl::_decodeQueryStringComponentsForPathWordBookAndAutoQueryTemplate((uint64_t *)&__p, this, a2);
    if ((v16 & 0x80u) == 0) {
      p_p = &__p;
    }
    else {
      p_p = __p;
    }
    if ((v16 & 0x80u) == 0) {
      uint64_t v9 = v16;
    }
    else {
      uint64_t v9 = v15;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v7, (uint64_t)p_p, v9);
    if ((char)v16 < 0) {
      operator delete(__p);
    }
    std::ostream::flush();
    goto LABEL_24;
  }
  LOBYTE(__p) = 47;
  int v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&__p, 1);
  UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)this, &v12);
  (*(void (**)(void **__return_ptr))(*(void *)v12 + 56))(&__p);
  if ((v16 & 0x80u) == 0) {
    uint64_t v5 = &__p;
  }
  else {
    uint64_t v5 = __p;
  }
  if ((v16 & 0x80u) == 0) {
    uint64_t v6 = v16;
  }
  else {
    uint64_t v6 = v15;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, (uint64_t)v5, v6);
  if ((char)v16 < 0) {
    operator delete(__p);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  if (UC::UCBitStream::hasMore(a2))
  {
    if (!UC::UCBitStream::readNextBit(a2))
    {
      exception = __cxa_allocate_exception(0x38uLL);
      UC::Exception::InvalidDecodingInstruction::InvalidDecodingInstruction((uint64_t)exception, "Encountered path indicator", 0x1AuLL, "Decoder encountered invalid instruction while decoding template query", 0x45uLL);
    }
    goto LABEL_15;
  }
LABEL_24:
  std::stringbuf::str();
  v17[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v17 + *(void *)(v17[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v17[1] = MEMORY[0x263F8C318] + 16;
  if (v18 < 0) {
    operator delete((void *)v17[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x230FA7120](&v19);
}

void sub_22E879DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17)
{
  __cxa_free_exception(v17);
  std::ostringstream::~ostringstream((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeRestOfURLWithNonTemplateFormat(UC::SUE::SegmentedURLDecoderImpl *this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  if (UC::UCBitStream::readNextBit(a2))
  {
    UC::SUE::SegmentedURLDecoderImpl::_decodeSegmentedPathAndQuery(this, a2, a3);
  }
  else
  {
    UC::SUE::SegmentedURLDecoderImpl::_decodeCombinedPathAndQuery((UC::SUE::UCSegmentedURLCoderProvider **)this, a2, a3);
  }
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeCombinedPathAndQuery(UC::SUE::UCSegmentedURLCoderProvider **this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  UC::SUE::UCSegmentedURLCoderProvider::getCombinedPathAndQueryCoder(*this, &v9);
  uint64_t v5 = v9;
  std::string::basic_string[abi:ne180100]<0>(__p, "|");
  (*(void (**)(void **__return_ptr, uint64_t, UC::UCBitStream *, void **))(*(void *)v5 + 48))(v11, v5, a2, __p);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  if (SHIBYTE(v12) < 0)
  {
    if (!v11[1]) {
      goto LABEL_13;
    }
    int v6 = *(unsigned __int8 *)v11[0];
  }
  else
  {
    if (!HIBYTE(v12)) {
      goto LABEL_13;
    }
    int v6 = LOBYTE(v11[0]);
  }
  if (v6 == 47 || v6 == 35)
  {
    *(_OWORD *)a3 = *(_OWORD *)v11;
    *(void *)(a3 + 16) = v12;
    return;
  }
LABEL_13:
  std::operator+<char>();
  if (SHIBYTE(v12) < 0) {
    operator delete(v11[0]);
  }
}

void sub_22E879FAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeSegmentedPathAndQuery(UC::SUE::SegmentedURLDecoderImpl *this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  unsigned int v6 = UC::SUE::SegmentedURLDecoderImpl::_decodeHostFormatType(this, a2);
  while (v6 <= 1)
  {
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v23 = 0;
    if (v6)
    {
      MEMORY[0x230FA6F20](__p, "/");
    }
    else
    {
      std::string::basic_string[abi:ne180100]<0>(v18, "");
      UC::SUE::SegmentedURLDecoderImpl::_decodePathValueDecodeEncodingType((uint64_t)this, a2, (uint64_t)v18);
      if (SHIBYTE(v23) < 0) {
        operator delete(__p[0]);
      }
      *(_OWORD *)std::string __p = *(_OWORD *)v20;
      uint64_t v23 = v21;
      HIBYTE(v21) = 0;
      LOBYTE(v20[0]) = 0;
      if (v19 < 0) {
        operator delete(v18[0]);
      }
    }
    if (SHIBYTE(v23) < 0)
    {
      if (__p[1] != (void *)1) {
        goto LABEL_22;
      }
      unint64_t v7 = (void **)__p[0];
    }
    else
    {
      if (HIBYTE(v23) != 1) {
        goto LABEL_22;
      }
      unint64_t v7 = __p;
    }
    if (*(unsigned char *)v7 != 47)
    {
LABEL_22:
      std::operator+<char>();
      if (v21 >= 0) {
        std::string::size_type v10 = v20;
      }
      else {
        std::string::size_type v10 = (void **)v20[0];
      }
      if (v21 >= 0) {
        std::string::size_type v11 = HIBYTE(v21);
      }
      else {
        std::string::size_type v11 = (std::string::size_type)v20[1];
      }
      std::string::append((std::string *)a3, (const std::string::value_type *)v10, v11);
      if (SHIBYTE(v21) < 0) {
        operator delete(v20[0]);
      }
      goto LABEL_30;
    }
    if (v23 >= 0) {
      char v8 = __p;
    }
    else {
      char v8 = (void **)__p[0];
    }
    if (v23 >= 0) {
      std::string::size_type v9 = HIBYTE(v23);
    }
    else {
      std::string::size_type v9 = (std::string::size_type)__p[1];
    }
    std::string::append((std::string *)a3, (const std::string::value_type *)v8, v9);
LABEL_30:
    BOOL hasMore = UC::UCBitStream::hasMore(a2);
    BOOL v13 = hasMore;
    if (hasMore) {
      unsigned int v6 = UC::SUE::SegmentedURLDecoderImpl::_decodeHostFormatType((UC::SUE::SegmentedURLDecoderImpl *)hasMore, a2);
    }
    if (SHIBYTE(v23) < 0)
    {
      operator delete(__p[0]);
      if (!v13) {
        break;
      }
    }
    else if (!v13)
    {
      break;
    }
  }
  if (v6 == 2)
  {
    uint64_t v14 = 0;
    while (UC::UCBitStream::hasMore(a2))
    {
      UC::SUE::SegmentedURLDecoderImpl::_decodeSegmentedQueryStringComponent(this, a2, (uint64_t)__p);
      if (v14)
      {
        std::operator+<char>();
        if (v21 >= 0) {
          uint64_t v15 = v20;
        }
        else {
          uint64_t v15 = (void **)v20[0];
        }
        if (v21 >= 0) {
          std::string::size_type v16 = HIBYTE(v21);
        }
        else {
          std::string::size_type v16 = (std::string::size_type)v20[1];
        }
      }
      else
      {
        uint64_t v17 = *(unsigned __int8 *)(a3 + 23);
        if ((v17 & 0x80u) != 0) {
          uint64_t v17 = *(void *)(a3 + 8);
        }
        if (v17)
        {
          std::operator+<char>();
          if (v21 >= 0) {
            uint64_t v15 = v20;
          }
          else {
            uint64_t v15 = (void **)v20[0];
          }
          if (v21 >= 0) {
            std::string::size_type v16 = HIBYTE(v21);
          }
          else {
            std::string::size_type v16 = (std::string::size_type)v20[1];
          }
        }
        else
        {
          std::operator+<char>();
          if (v21 >= 0) {
            uint64_t v15 = v20;
          }
          else {
            uint64_t v15 = (void **)v20[0];
          }
          if (v21 >= 0) {
            std::string::size_type v16 = HIBYTE(v21);
          }
          else {
            std::string::size_type v16 = (std::string::size_type)v20[1];
          }
        }
      }
      std::string::append((std::string *)a3, (const std::string::value_type *)v15, v16);
      if (SHIBYTE(v21) < 0) {
        operator delete(v20[0]);
      }
      if (SHIBYTE(v23) < 0) {
        operator delete(__p[0]);
      }
      --v14;
    }
  }
}

void sub_22E87A2D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (*(char *)(v26 + 23) < 0) {
    operator delete(*(void **)v26);
  }
  _Unwind_Resume(exception_object);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeSegmentedQueryStringComponent(UC::SUE::SegmentedURLDecoderImpl *this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  int ComponentEncodingType = UC::SUE::SegmentedURLDecoderImpl::_decodeQueryComponentEncodingType(this, a2);
  if (ComponentEncodingType == 1)
  {
    std::string::basic_string[abi:ne180100]<0>(&v30, "=");
    UC::SUE::SegmentedURLDecoderImpl::_decodeQueryValueWithEncodingType((uint64_t)this, (uint64_t)a2, 1, (uint64_t)&v30);
    if ((char)v32 < 0) {
      operator delete(v30);
    }
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)this, &v25);
    std::string::size_type v7 = v25.__r_.__value_.__r.__words[0];
    std::string::basic_string[abi:ne180100]<0>(v28, "?");
    std::string::basic_string[abi:ne180100]<0>(__p, "|");
    (*(void (**)(void **__return_ptr, std::string::size_type, UC::UCBitStream *, void **, void **))(*(void *)v7 + 64))(&v30, v7, a2, v28, __p);
    if (v27 < 0) {
      operator delete(__p[0]);
    }
    if (v29 < 0) {
      operator delete(v28[0]);
    }
    if (v25.__r_.__value_.__l.__size_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v25.__r_.__value_.__l.__size_);
    }
    if ((v32 & 0x80u) == 0) {
      size_t v8 = v32;
    }
    else {
      size_t v8 = (size_t)v31;
    }
    std::string::size_type v9 = &v25;
    std::string::basic_string[abi:ne180100]((uint64_t)&v25, v8 + 1);
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type v9 = (std::string *)v25.__r_.__value_.__r.__words[0];
    }
    if (v8)
    {
      if ((v32 & 0x80u) == 0) {
        std::string::size_type v10 = &v30;
      }
      else {
        std::string::size_type v10 = (void **)v30;
      }
      memmove(v9, v10, v8);
    }
    *(_WORD *)((char *)&v9->__r_.__value_.__l.__data_ + v8) = 61;
    if ((v35 & 0x80u) == 0) {
      std::string::size_type v11 = (const std::string::value_type *)&v33;
    }
    else {
      std::string::size_type v11 = v33;
    }
    if ((v35 & 0x80u) == 0) {
      std::string::size_type v12 = v35;
    }
    else {
      std::string::size_type v12 = v34;
    }
    BOOL v13 = std::string::append(&v25, v11, v12);
  }
  else
  {
    int v14 = ComponentEncodingType;
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)this, &v30);
    uint64_t v15 = v30;
    std::string::basic_string[abi:ne180100]<0>(v23, "?");
    std::string::basic_string[abi:ne180100]<0>(v21, "|");
    (*(void (**)(std::string::value_type **__return_ptr, void *, UC::UCBitStream *, void **, void **))(*(void *)v15 + 64))(&v33, v15, a2, v23, v21);
    if (v22 < 0) {
      operator delete(v21[0]);
    }
    if (v24 < 0) {
      operator delete(v23[0]);
    }
    if (v31) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v31);
    }
    std::string::basic_string[abi:ne180100]<0>(&v25, "=");
    UC::SUE::SegmentedURLDecoderImpl::_decodeQueryValueWithEncodingType((uint64_t)this, (uint64_t)a2, v14, (uint64_t)&v25);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
    if ((v35 & 0x80u) == 0) {
      size_t v16 = v35;
    }
    else {
      size_t v16 = v34;
    }
    uint64_t v17 = &v25;
    std::string::basic_string[abi:ne180100]((uint64_t)&v25, v16 + 1);
    if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      uint64_t v17 = (std::string *)v25.__r_.__value_.__r.__words[0];
    }
    if (v16)
    {
      if ((v35 & 0x80u) == 0) {
        char v18 = (void **)&v33;
      }
      else {
        char v18 = (void **)v33;
      }
      memmove(v17, v18, v16);
    }
    *(_WORD *)((char *)&v17->__r_.__value_.__l.__data_ + v16) = 61;
    if ((v32 & 0x80u) == 0) {
      char v19 = (const std::string::value_type *)&v30;
    }
    else {
      char v19 = (const std::string::value_type *)v30;
    }
    if ((v32 & 0x80u) == 0) {
      std::string::size_type v20 = v32;
    }
    else {
      std::string::size_type v20 = (std::string::size_type)v31;
    }
    BOOL v13 = std::string::append(&v25, v19, v20);
  }
  *(_OWORD *)a3 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  *(void *)(a3 + 16) = *((void *)&v13->__r_.__value_.__l + 2);
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  if ((char)v32 < 0) {
    operator delete(v30);
  }
  if ((char)v35 < 0) {
    operator delete(v33);
  }
}

void sub_22E87A6A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *__p,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,void *a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v38 - 81) < 0) {
    operator delete(*(void **)(v38 - 104));
  }
  if (*(char *)(v38 - 57) < 0) {
    operator delete(*(void **)(v38 - 80));
  }
  _Unwind_Resume(exception_object);
}

void sub_22E87A798()
{
  if (*(char *)(v0 - 81) < 0) {
    JUMPOUT(0x22E87A78CLL);
  }
  JUMPOUT(0x22E87A790);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodeQueryValueWithEncodingType(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == 2)
  {
    UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v17);
    uint64_t v6 = v17;
    std::string::basic_string[abi:ne180100]<0>(v10, "|");
    (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v6 + 48))(v6, a2, v10);
    if ((v11 & 0x80000000) == 0) {
      goto LABEL_15;
    }
    std::string::size_type v7 = (void *)v10[0];
    goto LABEL_14;
  }
  if (a3 == 1)
  {
    uint64_t v5 = *(void *)(a1 + 16);
    std::string::basic_string[abi:ne180100]<0>(__p, "|");
    (*(void (**)(uint64_t, uint64_t, void **))(*(void *)v5 + 48))(v5, a2, __p);
    if (v13 < 0) {
      operator delete(__p[0]);
    }
    return;
  }
  UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v17);
  uint64_t v9 = v17;
  if (*(char *)(a4 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v16, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else {
    std::string v16 = *(std::string *)a4;
  }
  std::string::basic_string[abi:ne180100]<0>(v14, "|");
  (*(void (**)(uint64_t, uint64_t, std::string *, void **))(*(void *)v9 + 64))(v9, a2, &v16, v14);
  if (v15 < 0) {
    operator delete(v14[0]);
  }
  if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::size_type v7 = (void *)v16.__r_.__value_.__r.__words[0];
LABEL_14:
    operator delete(v7);
  }
LABEL_15:
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
}

void sub_22E87A960(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  unsigned __int8 v32 = *(std::__shared_weak_count **)(v30 - 40);
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  _Unwind_Resume(exception_object);
}

void sub_22E87A9C0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x22E87A9B8);
}

void UC::SUE::SegmentedURLDecoderImpl::_decodePathValueDecodeEncodingType(uint64_t a1, UC::UCBitStream *this, uint64_t a3)
{
  int NextBit = UC::UCBitStream::readNextBit(this);
  int v7 = UC::UCBitStream::readNextBit(this);
  if (v7) {
    int v8 = 3;
  }
  else {
    int v8 = 2;
  }
  if (NextBit) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = v7 != 0;
  }
  UC::SUE::SegmentedURLDecoderImpl::_decodePathValueWithEncodingType(a1, (uint64_t)this, v9, a3);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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

void sub_22E87ABD0(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x230FA7120](v1);
  _Unwind_Resume(a1);
}

uint64_t UC::SUE::SegmentedURLDecoderImpl::_decodeQueryStringComponentsForPathWordBookAndAutoQueryTemplate(UC::SUE::SegmentedURLDecoderImpl *this, UC::UCBitStream *a2)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  uint64_t v4 = 0;
  while (UC::UCBitStream::hasMore(a2))
  {
    if (v4) {
      std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"&", 1);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"p", 1);
    if (v4) {
      std::ostream::operator<<();
    }
    uint64_t v5 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)"=", 1);
    uint64_t v6 = (UC::SUE::SegmentedURLDecoderImpl *)std::string::basic_string[abi:ne180100]<0>(v11, "=");
    int ComponentEncodingType = UC::SUE::SegmentedURLDecoderImpl::_decodeQueryComponentEncodingType(v6, a2);
    UC::SUE::SegmentedURLDecoderImpl::_decodeQueryValueWithEncodingType((uint64_t)this, (uint64_t)a2, ComponentEncodingType, (uint64_t)v11);
    if ((v14 & 0x80u) == 0) {
      int v8 = __p;
    }
    else {
      int v8 = (void **)__p[0];
    }
    if ((v14 & 0x80u) == 0) {
      uint64_t v9 = v14;
    }
    else {
      uint64_t v9 = (uint64_t)__p[1];
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)v8, v9);
    if ((char)v14 < 0) {
      operator delete(__p[0]);
    }
    if (v12 < 0) {
      operator delete(v11[0]);
    }
    ++v4;
  }
  std::ostream::flush();
  std::stringbuf::str();
  v15[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v15 + *(void *)(v15[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v15[1] = MEMORY[0x263F8C318] + 16;
  if (v16 < 0) {
    operator delete((void *)v15[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x230FA7120](&v17);
}

void sub_22E87AE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
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
  MEMORY[0x230FA7120](a1 + 112);
  return a1;
}

void UC::SUE::SegmentedURLDecoderImpl::_decodePathValueWithEncodingType(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  switch(a3)
  {
    case 1:
      uint64_t v7 = *(void *)(a1 + 16);
      std::string::basic_string[abi:ne180100]<0>(__p, "|");
      (*(void (**)(uint64_t, uint64_t, void **))(*(void *)v7 + 48))(v7, a2, __p);
      if (v13 < 0) {
        operator delete(__p[0]);
      }
      return;
    case 2:
      UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v17);
      uint64_t v8 = v17;
      std::string::basic_string[abi:ne180100]<0>(v10, "|");
      (*(void (**)(uint64_t, uint64_t, void *))(*(void *)v8 + 48))(v8, a2, v10);
      if ((v11 & 0x80000000) == 0) {
        goto LABEL_15;
      }
      uint64_t v9 = (void *)v10[0];
      goto LABEL_14;
    case 3:
      UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v17);
      (*(void (**)(uint64_t, uint64_t))(*(void *)v17 + 56))(v17, a2);
      goto LABEL_15;
    default:
      UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(*(UC::SUE::UCSegmentedURLCoderProvider **)a1, &v17);
      uint64_t v6 = v17;
      if (*(char *)(a4 + 23) < 0) {
        std::string::__init_copy_ctor_external(&v16, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
      }
      else {
        std::string v16 = *(std::string *)a4;
      }
      std::string::basic_string[abi:ne180100]<0>(v14, "|");
      (*(void (**)(uint64_t, uint64_t, std::string *, void **))(*(void *)v6 + 64))(v6, a2, &v16, v14);
      if (v15 < 0) {
        operator delete(v14[0]);
      }
      if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
      {
        uint64_t v9 = (void *)v16.__r_.__value_.__r.__words[0];
LABEL_14:
        operator delete(v9);
      }
LABEL_15:
      if (v18) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      }
      return;
  }
}

void sub_22E87B184(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, void *__p, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  unsigned __int8 v32 = *(std::__shared_weak_count **)(v30 - 40);
  if (v32) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v32);
  }
  _Unwind_Resume(exception_object);
}

void sub_22E87B1E8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x22E87B1E0);
}

void *UC::Exception::CoderError::CoderError(void *a1, void *__src, size_t __len, int a4, const void *a5, size_t a6, const void *a7, size_t a8)
{
  *a1 = &unk_26E242A70;
  if (__len > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v15 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v15 = __len | 7;
    }
    size_t v16 = v15 + 1;
    unsigned __int8 v14 = operator new(v15 + 1);
    a1[2] = __len;
    a1[3] = v16 | 0x8000000000000000;
    a1[1] = v14;
    goto LABEL_8;
  }
  *((unsigned char *)a1 + 31) = __len;
  unsigned __int8 v14 = a1 + 1;
  if (__len) {
LABEL_8:
  }
    memmove(v14, __src, __len);
  *((unsigned char *)v14 + __len) = 0;
  *((_DWORD *)a1 + 8) = a4;
  if (a6 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a6 >= 0x17)
  {
    uint64_t v18 = (a6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a6 | 7) != 0x17) {
      uint64_t v18 = a6 | 7;
    }
    uint64_t v19 = v18 + 1;
    uint64_t v17 = operator new(v18 + 1);
    a1[6] = a6;
    a1[7] = v19 | 0x8000000000000000;
    a1[5] = v17;
    goto LABEL_16;
  }
  *((unsigned char *)a1 + 63) = a6;
  uint64_t v17 = a1 + 5;
  if (a6) {
LABEL_16:
  }
    memmove(v17, a5, a6);
  *((unsigned char *)v17 + a6) = 0;
  std::string::size_type v20 = a1 + 8;
  if (a8 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a8 >= 0x17)
  {
    uint64_t v21 = (a8 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a8 | 7) != 0x17) {
      uint64_t v21 = a8 | 7;
    }
    uint64_t v22 = v21 + 1;
    std::string::size_type v20 = operator new(v21 + 1);
    a1[9] = a8;
    a1[10] = v22 | 0x8000000000000000;
    a1[8] = v20;
  }
  else
  {
    *((unsigned char *)a1 + 87) = a8;
    if (!a8) {
      goto LABEL_25;
    }
  }
  memmove(v20, a7, a8);
LABEL_25:
  *((unsigned char *)v20 + a8) = 0;
  return a1;
}

void sub_22E87B3F4(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 63) < 0) {
    operator delete(*v3);
  }
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  std::exception::~exception((std::exception *)v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::CoderError::what(UC::Exception::CoderError *this)
{
  uint64_t result = (uint64_t)this + 64;
  if (*((char *)this + 87) < 0) {
    return *(void *)result;
  }
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t UC::SUE::SegmentedURLEncoderImpl::SegmentedPathOrQueryValueEncodingResult::SegmentedPathOrQueryValueEncodingResult(uint64_t a1, unint64_t a2, long long *a3)
{
  *(void *)a1 = a2;
  uint64_t v4 = (std::string *)(a1 + 8);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)a3, *((void *)a3 + 1));
    LODWORD(v5) = *(_DWORD *)(a1 + 4);
  }
  else
  {
    unint64_t v5 = HIDWORD(a2);
    long long v6 = *a3;
    v4->__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v6;
  }
  *(unsigned char *)(a1 + 32) = v5 == 0;
  return a1;
}

uint64_t UC::Exception::InternalCoderError::InternalCoderError(uint64_t a1, void *__src, size_t __len, int a4, void *a5, size_t a6)
{
  *(void *)a1 = &unk_26E242AC8;
  if (__len > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v13 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v13 = __len | 7;
    }
    size_t v14 = v13 + 1;
    char v12 = operator new(v13 + 1);
    *(void *)(a1 + 16) = __len;
    *(void *)(a1 + 24) = v14 | 0x8000000000000000;
    *(void *)(a1 + 8) = v12;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 31) = __len;
  char v12 = (void *)(a1 + 8);
  if (__len) {
LABEL_8:
  }
    memmove(v12, __src, __len);
  *((unsigned char *)v12 + __len) = 0;
  *(_DWORD *)(a1 + 32) = a4;
  size_t v15 = (void *)(a1 + 40);
  if (a6 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a6 >= 0x17)
  {
    uint64_t v16 = (a6 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a6 | 7) != 0x17) {
      uint64_t v16 = a6 | 7;
    }
    uint64_t v17 = v16 + 1;
    size_t v15 = operator new(v16 + 1);
    *(void *)(a1 + 48) = a6;
    *(void *)(a1 + 56) = v17 | 0x8000000000000000;
    *(void *)(a1 + 40) = v15;
  }
  else
  {
    *(unsigned char *)(a1 + 63) = a6;
    if (!a6) {
      goto LABEL_17;
    }
  }
  memmove(v15, a5, a6);
LABEL_17:
  *((unsigned char *)v15 + a6) = 0;
  return a1;
}

void sub_22E87B6D0(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  std::exception::~exception((std::exception *)v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InternalCoderError::what(UC::Exception::InternalCoderError *this)
{
  uint64_t result = (uint64_t)this + 40;
  if (*((char *)this + 63) < 0) {
    return *(void *)result;
  }
  return result;
}

void std::__throw_bad_variant_access[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C3A8] + 16;
}

uint64_t UC::Exception::InvalidDecodingInstruction::InvalidDecodingInstruction(uint64_t a1, void *__src, size_t __len, void *a4, size_t a5)
{
  *(void *)a1 = &unk_26E242B08;
  if (__len > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v11 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v11 = __len | 7;
    }
    size_t v12 = v11 + 1;
    std::string::size_type v10 = operator new(v11 + 1);
    *(void *)(a1 + 16) = __len;
    *(void *)(a1 + 24) = v12 | 0x8000000000000000;
    *(void *)(a1 + 8) = v10;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 31) = __len;
  std::string::size_type v10 = (void *)(a1 + 8);
  if (__len) {
LABEL_8:
  }
    memmove(v10, __src, __len);
  *((unsigned char *)v10 + __len) = 0;
  size_t v13 = (void *)(a1 + 32);
  if (a5 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a5 >= 0x17)
  {
    uint64_t v14 = (a5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a5 | 7) != 0x17) {
      uint64_t v14 = a5 | 7;
    }
    uint64_t v15 = v14 + 1;
    size_t v13 = operator new(v14 + 1);
    *(void *)(a1 + 40) = a5;
    *(void *)(a1 + 48) = v15 | 0x8000000000000000;
    *(void *)(a1 + 32) = v13;
  }
  else
  {
    *(unsigned char *)(a1 + 55) = a5;
    if (!a5) {
      goto LABEL_17;
    }
  }
  memmove(v13, a4, a5);
LABEL_17:
  *((unsigned char *)v13 + a5) = 0;
  return a1;
}

void sub_22E87B938(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  std::exception::~exception((std::exception *)v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidDecodingInstruction::what(UC::Exception::InvalidDecodingInstruction *this)
{
  uint64_t result = (uint64_t)this + 32;
  if (*((char *)this + 55) < 0) {
    return *(void *)result;
  }
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
    long long v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    long long v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
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

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
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

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
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
    std::string::size_type v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  }
  else {
    std::string::size_type v10 = 0;
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

void sub_22E87BCD0(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  std::vector<std::string>::pointer begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  std::__split_buffer<std::string>::pointer end = this->__end_;
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
      unint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        unint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  unint64_t v4 = this;
  size_t v11 = this;
  long long v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    long long v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        unint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      long long v6 = (long long *)((char *)v6 + 24);
      long long v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_22E87C000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

void std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100](int a1, void **__p)
{
  if (__p)
  {
    if (*((char *)__p + 23) < 0) {
      operator delete(*__p);
    }
    operator delete(__p);
  }
}

void std::vector<std::string>::__move_range(std::vector<std::string> *this, std::vector<std::string>::pointer __from_s, std::vector<std::string>::pointer __from_e, std::vector<std::string>::pointer __to)
{
  std::vector<std::string>::pointer end = this->__end_;
  long long v7 = (char *)__from_s + (char *)end - (char *)__to;
  std::vector<std::string>::pointer v8 = end;
  if (v7 < (char *)__from_e)
  {
    unint64_t v9 = (unint64_t)v7;
    std::vector<std::string>::pointer v8 = this->__end_;
    do
    {
      long long v10 = *(_OWORD *)v9;
      v8->__r_.__value_.__r.__words[2] = *(void *)(v9 + 16);
      *(_OWORD *)&v8->__r_.__value_.__l.__data_ = v10;
      ++v8;
      *(void *)(v9 + 8) = 0;
      *(void *)(v9 + 16) = 0;
      *(void *)unint64_t v9 = 0;
      v9 += 24;
    }
    while (v9 < (unint64_t)__from_e);
  }
  this->__end_ = v8;
  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>((uint64_t)&v11, (uint64_t)__from_s, (uint64_t)v7, (uint64_t)end);
}

void std::__split_buffer<std::string>::push_back(std::__split_buffer<std::string> *this, std::__split_buffer<std::string>::value_type *__x)
{
  std::__split_buffer<std::string>::pointer end = this->__end_;
  if (end == this->__end_cap_.__value_)
  {
    std::vector<std::string>::pointer begin = (long long *)this->__begin_;
    if ((std::__split_buffer<std::string>::pointer)begin <= this->__first_)
    {
      if (end == this->__first_) {
        unint64_t v10 = 1;
      }
      else {
        unint64_t v10 = 0x5555555555555556 * (((char *)end - (char *)this->__first_) >> 3);
      }
      unint64_t v11 = v10 >> 2;
      value = this->__end_cap_.__value_;
      v26.__end_cap_.__value_ = this->__end_cap_.__value_;
      char v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)value, v10);
      long long v15 = &v13[v11];
      std::__split_buffer<std::string>::pointer v16 = this->__begin_;
      int64_t v17 = (char *)this->__end_ - (char *)v16;
      if (v17)
      {
        uint64_t v18 = v17 / 24;
        uint64_t v19 = &v15[v18];
        uint64_t v20 = 24 * v18;
        uint64_t v21 = &v13[v11];
        do
        {
          long long v22 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
          v21->__r_.__value_.__r.__words[2] = v16->__r_.__value_.__r.__words[2];
          *(_OWORD *)&v21->__r_.__value_.__l.__data_ = v22;
          ++v21;
          v16->__r_.__value_.__l.__size_ = 0;
          v16->__r_.__value_.__r.__words[2] = 0;
          v16->__r_.__value_.__r.__words[0] = 0;
          ++v16;
          v20 -= 24;
        }
        while (v20);
        int64x2_t v23 = *(int64x2_t *)&this->__begin_;
      }
      else
      {
        int64x2_t v23 = vdupq_n_s64((unint64_t)v16);
        uint64_t v19 = &v13[v11];
      }
      v26.__first_ = this->__first_;
      this->__first_ = v13;
      this->__begin_ = v15;
      *(int64x2_t *)&v26.__begin_ = v23;
      char v24 = this->__end_cap_.__value_;
      this->__end_ = v19;
      this->__end_cap_.__value_ = &v13[v14];
      v26.__end_cap_.__value_ = v24;
      std::__split_buffer<std::string>::~__split_buffer(&v26);
      std::__split_buffer<std::string>::pointer end = this->__end_;
    }
    else
    {
      int64_t v6 = 0xAAAAAAAAAAAAAAABLL * (((char *)begin - (char *)this->__first_) >> 3);
      if (v6 >= -1) {
        uint64_t v7 = v6 + 1;
      }
      else {
        uint64_t v7 = v6 + 2;
      }
      uint64_t v8 = -3 * (v7 >> 1);
      std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>((uint64_t)&v26, begin, (long long *)end, (uint64_t)begin - 24 * (v7 >> 1));
      std::__split_buffer<std::string>::pointer end = v9;
      this->__begin_ = (std::__split_buffer<std::string>::pointer)((char *)this->__begin_ + 8 * v8);
      this->__end_ = v9;
    }
  }
  long long v25 = *(_OWORD *)&__x->__r_.__value_.__l.__data_;
  end->__r_.__value_.__r.__words[2] = __x->__r_.__value_.__r.__words[2];
  *(_OWORD *)&end->__r_.__value_.__l.__data_ = v25;
  __x->__r_.__value_.__l.__size_ = 0;
  __x->__r_.__value_.__r.__words[2] = 0;
  __x->__r_.__value_.__r.__words[0] = 0;
  ++this->__end_;
}

std::vector<std::string>::pointer std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v, std::vector<std::string>::pointer __p)
{
  std::vector<std::string>::pointer begin = __v->__begin_;
  p_end_cap = &this->__end_cap_;
  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)__p, (uint64_t)__p, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)begin, (uint64_t)begin);
  __v->__begin_ = v8;
  __v->__end_ = (std::__split_buffer<std::string>::pointer)std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)p_end_cap, (long long *)__p, (long long *)this->__end_, (uint64_t)__v->__end_);
  unint64_t v9 = this->__begin_;
  this->__begin_ = __v->__begin_;
  __v->__begin_ = v9;
  std::__split_buffer<std::string>::pointer end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return begin;
}

uint64_t std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 != a2)
  {
    uint64_t v6 = a3;
    do
    {
      uint64_t v7 = a4 - 24;
      if (*(char *)(a4 - 1) < 0) {
        operator delete(*(void **)v7);
      }
      long long v8 = *(_OWORD *)(v6 - 24);
      *(void *)(v7 + 16) = *(void *)(v6 - 8);
      *(_OWORD *)uint64_t v7 = v8;
      *(unsigned char *)(v6 - 1) = 0;
      *(unsigned char *)(v6 - 24) = 0;
      a4 = v7;
      v6 -= 24;
    }
    while (v6 != a2);
  }
  return a3;
}

long long *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
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
      a4 += 24;
      *((unsigned char *)v5 + 23) = 0;
      *(unsigned char *)unint64_t v5 = 0;
      unint64_t v5 = (long long *)((char *)v5 + 24);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  uint64_t v10 = a4;
  uint64_t v9 = a4;
  v7[0] = a1;
  v7[1] = &v9;
  v7[2] = &v10;
  if (a2 != a3)
  {
    do
    {
      long long v5 = *a2;
      *(void *)(v4 + 16) = *((void *)a2 + 2);
      *(_OWORD *)uint64_t v4 = v5;
      v4 += 24;
      *((void *)a2 + 1) = 0;
      *((void *)a2 + 2) = 0;
      *(void *)a2 = 0;
      a2 = (long long *)((char *)a2 + 24);
    }
    while (a2 != a3);
    uint64_t v10 = v4;
  }
  char v8 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v7);
  return v4;
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
    uint64_t v6 = operator new(v4 + 1);
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

void std::vector<std::string>::__vdeallocate(std::vector<std::string> *this)
{
  if (this->__begin_)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this);
    operator delete(this->__begin_);
    this->__begin_ = 0;
    this->__end_ = 0;
    this->__end_cap_.__value_ = 0;
  }
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x230FA7030](v13, a1);
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
  MEMORY[0x230FA7040](v13);
  return a1;
}

void sub_22E87C6F8(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x230FA7040](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x22E87C6D8);
}

void sub_22E87C74C(_Unwind_Exception *a1)
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
      char v13 = v18 >= 0 ? __p : (void **)__p[0];
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

void sub_22E87C8CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

uint64_t UC::UCLEB128Coder::canEncode(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 == v3) {
    return 1;
  }
  do
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, v2);
    v2 += 24;
    if (result) {
      BOOL v6 = v2 == v3;
    }
    else {
      BOOL v6 = 1;
    }
  }
  while (!v6);
  return result;
}

uint64_t UC::UCLEB128Coder::canEncode(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    unint64_t v3 = *(void *)(a2 + 8);
    if (v3)
    {
      uint64_t v4 = *(unsigned __int8 **)a2;
      goto LABEL_6;
    }
    return 0;
  }
  unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  if (!*(unsigned char *)(a2 + 23)) {
    return 0;
  }
  uint64_t v4 = (unsigned __int8 *)a2;
LABEL_6:
  uint64_t result = UC::IsAllDigits(v4, v3);
  if (!result) {
    return result;
  }
  if (v3 < 2) {
    return 1;
  }
  uint64_t result = 0;
  if (*(char *)(a2 + 23) >= 0) {
    BOOL v6 = (unsigned __int8 *)a2;
  }
  else {
    BOOL v6 = *(unsigned __int8 **)a2;
  }
  if (v3 > 0x14 || *v6 == 48) {
    return result;
  }
  if (v3 != 20) {
    return 1;
  }
  uint64_t v7 = 0;
  do
  {
    int v8 = (char)v6[v7];
    int v9 = UC::UCLEB128Coder::canEncode(std::string const&)::maxNumber[v7];
    uint64_t result = v8 <= v9;
  }
  while (v8 <= v9 && v7++ != 19);
  return result;
}

uint64_t UC::UCLEB128Coder::encode(uint64_t a1, const std::string *a2)
{
  if (((*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1) & 1) == 0)
  {
    exception = __cxa_allocate_exception(0x20uLL);
    std::operator+<char>();
    if (v19 >= 0) {
      uint64_t v11 = v18;
    }
    else {
      uint64_t v11 = (uint64_t *)v18[0];
    }
    if (v19 >= 0) {
      size_t v12 = HIBYTE(v19);
    }
    else {
      size_t v12 = v18[1];
    }
    UC::Exception::InvalidEncodingInput::InvalidEncodingInput((uint64_t)exception, v11, v12);
  }
  unint64_t v23 = 0;
  std::istringstream::basic_istringstream[abi:ne180100](v18, a2, 8);
  MEMORY[0x230FA7010](v18, &v23);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
  unint64_t v3 = v23;
  do
  {
    unint64_t v23 = v3 >> 7;
    if (v3 > 0x7F) {
      LOBYTE(__p[0]) = 49;
    }
    else {
      LOBYTE(__p[0]) = 48;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)__p, 1);
    uint64_t v4 = 0;
    char v14 = 7;
    strcpy((char *)__p, "0000000");
    uint64_t v5 = 6;
    do
    {
      if (((v3 & 0x7F) >> v4))
      {
        if (v14 >= 0) {
          BOOL v6 = __p;
        }
        else {
          BOOL v6 = (void **)__p[0];
        }
        *((unsigned char *)v6 + v5) = 49;
      }
      ++v4;
      --v5;
    }
    while (v4 != 7);
    if (v14 >= 0) {
      uint64_t v7 = __p;
    }
    else {
      uint64_t v7 = (void **)__p[0];
    }
    if (v14 >= 0) {
      uint64_t v8 = v14;
    }
    else {
      uint64_t v8 = (uint64_t)__p[1];
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)v7, v8);
    if (v14 < 0) {
      operator delete(__p[0]);
    }
    unint64_t v3 = v23;
  }
  while (v23);
  std::ostream::flush();
  std::stringbuf::str();
  v15[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v15 + *(void *)(v15[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v15[1] = MEMORY[0x263F8C318] + 16;
  if (v16 < 0) {
    operator delete((void *)v15[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x230FA7120](&v17);
  v18[0] = *MEMORY[0x263F8C2C0];
  *(uint64_t *)((char *)v18 + *(void *)(v18[0] - 24)) = *(void *)(MEMORY[0x263F8C2C0] + 24);
  uint64_t v19 = MEMORY[0x263F8C318] + 16;
  if (v21 < 0) {
    operator delete(v20);
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  return MEMORY[0x230FA7120](&v22);
}

void sub_22E87CE74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,void *__p,uint64_t a50,int a51,__int16 a52,char a53,char a54)
{
  if (a54 < 0)
  {
    operator delete(__p);
    if ((v55 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v55)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v54);
  goto LABEL_6;
}

void UC::Exception::InvalidEncodingInput::~InvalidEncodingInput(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26E242B78;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

{
  void *v2;
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26E242B78;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  operator delete(v2);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26E242B78;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

uint64_t *std::istringstream::basic_istringstream[abi:ne180100](uint64_t *a1, const std::string *a2, int a3)
{
  uint64_t v6 = MEMORY[0x263F8C338] + 64;
  a1[15] = MEMORY[0x263F8C338] + 64;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = *(void *)(MEMORY[0x263F8C2C0] + 16);
  uint64_t v9 = *(void *)(MEMORY[0x263F8C2C0] + 8);
  *a1 = v9;
  *(uint64_t *)((char *)a1 + *(void *)(v9 - 24)) = v8;
  a1[1] = 0;
  uint64_t v10 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v10, a1 + 2);
  uint64_t v11 = MEMORY[0x263F8C338] + 24;
  v10[1].__vftable = 0;
  v10[1].__fmtflags_ = -1;
  *a1 = v11;
  a1[15] = v6;
  std::stringbuf::basic_stringbuf[abi:ne180100](v7, a2, a3 | 8);
  return a1;
}

void sub_22E87D0A8(_Unwind_Exception *a1)
{
  std::istream::~istream();
  MEMORY[0x230FA7120](v1);
  _Unwind_Resume(a1);
}

uint64_t std::istringstream::~istringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C0];
  uint64_t v3 = *MEMORY[0x263F8C2C0];
  *(void *)a1 = *MEMORY[0x263F8C2C0];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 16) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 103) < 0) {
    operator delete(*(void **)(a1 + 80));
  }
  std::streambuf::~streambuf();
  std::istream::~istream();
  MEMORY[0x230FA7120](a1 + 120);
  return a1;
}

void UC::UCLEB128Coder::encode(uint64_t a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 32))(__p, a1, v3);
      if ((v10 & 0x80u) == 0) {
        uint64_t v7 = __p;
      }
      else {
        uint64_t v7 = (void **)__p[0];
      }
      if ((v10 & 0x80u) == 0) {
        std::string::size_type v8 = v10;
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(a3, (const std::string::value_type *)v7, v8);
      if ((char)v10 < 0) {
        operator delete(__p[0]);
      }
      v3 += 24;
    }
    while (v3 != v4);
  }
}

void sub_22E87D294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UC::UCLEB128Coder::decode(int a1, UC::UCBitStream *this)
{
  int v3 = 0;
  uint64_t v4 = 0;
  do
  {
    int NextBit = UC::UCBitStream::readNextBit(this);
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    do
      unint64_t v7 = (int)UC::UCBitStream::readNextBit(this) | (2 * v7);
    while (v6++ < 6);
    v4 |= v7 << (7 * v3++);
  }
  while (NextBit);
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v10);
  std::ostream::operator<<();
  std::stringbuf::str();
  v10[0] = *MEMORY[0x263F8C2C8];
  *(void *)((char *)v10 + *(void *)(v10[0] - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v10[1] = MEMORY[0x263F8C318] + 16;
  if (v11 < 0) {
    operator delete((void *)v10[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x230FA7120](&v12);
}

void sub_22E87D464(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::ostringstream::~ostringstream((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidEncodingInput::InvalidEncodingInput(uint64_t a1, void *__src, size_t __len)
{
  *(void *)a1 = &unk_26E242B78;
  uint64_t v4 = (void *)(a1 + 8);
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
    uint64_t v4 = operator new(v7 + 1);
    *(void *)(a1 + 16) = __len;
    *(void *)(a1 + 24) = v8 | 0x8000000000000000;
    *(void *)(a1 + 8) = v4;
  }
  else
  {
    *(unsigned char *)(a1 + 31) = __len;
    if (!__len) {
      goto LABEL_9;
    }
  }
  memmove(v4, __src, __len);
LABEL_9:
  *((unsigned char *)v4 + __len) = 0;
  return a1;
}

void sub_22E87D54C(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidEncodingInput::what(UC::Exception::InvalidEncodingInput *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t std::stringbuf::basic_stringbuf[abi:ne180100](uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf();
  *(void *)uint64_t v6 = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  std::stringbuf::__init_buf_ptrs[abi:ne180100](a1);
  return a1;
}

void sub_22E87D65C(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 87) < 0) {
    operator delete(*v2);
  }
  std::streambuf::~streambuf();
  _Unwind_Resume(a1);
}

void std::stringbuf::__init_buf_ptrs[abi:ne180100](uint64_t a1)
{
  *(void *)(a1 + 88) = 0;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(unsigned char *)(a1 + 87);
  if (v3 < 0)
  {
    uint64_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }
  else
  {
    uint64_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }
  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }
  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 88) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 48) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(unsigned char *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        uint64_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 48) = v4;
      }
      if (v5) {
        *(void *)(a1 + 48) = (char *)v4 + v5;
      }
    }
  }
}

uint64_t UC::UCHuffmanTreeNode::UCHuffmanTreeNode(uint64_t a1, long long *a2, int a3)
{
  unint64_t v5 = (std::string *)(a1 + 16);
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v6 = *a2;
    v5->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  *(_DWORD *)(a1 + 40) = a3;
  return a1;
}

void sub_22E87D7F0(_Unwind_Exception *a1)
{
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v1 + 1, 0);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t UC::UCHuffmanTreeNode::UCHuffmanTreeNode(uint64_t a1, uint64_t *a2, uint64_t *a3, int a4, long long *a5)
{
  uint64_t v7 = *a2;
  *a2 = 0;
  *(void *)a1 = v7;
  uint64_t v8 = *a3;
  *a3 = 0;
  *(void *)(a1 + 8) = v8;
  uint64_t v9 = (std::string *)(a1 + 16);
  if (*((char *)a5 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a5, *((void *)a5 + 1));
  }
  else
  {
    long long v10 = *a5;
    v9->__r_.__value_.__r.__words[2] = *((void *)a5 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  *(_DWORD *)(a1 + 40) = a4;
  return a1;
}

void sub_22E87D88C(_Unwind_Exception *a1)
{
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v2, 0);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void *UC::UCHuffmanCoder::UCHuffmanCoder(void *a1, void **a2)
{
  *a1 = &unk_26E242BA0;
  a1[1] = 0;
  a1[2] = 0;
  char v3 = a1 + 2;
  uint64_t v4 = *a2;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  std::string v33 = &v34;
  UC::UCMultiContextSymbolFrequencyTrie::getOrderedSymbols(v4, &v28);
  uint64_t v5 = *v28;
  uint64_t v6 = v28[1];
  while (v5 != v6)
  {
    int FrequencyForSymbol = UC::UCSymbolFrequencyTable::getFrequencyForSymbol((uint64_t)v4, v5);
    uint64_t v8 = operator new(0x30uLL);
    if (*(char *)(v5 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v35, *(const std::string::value_type **)v5, *(void *)(v5 + 8));
    }
    else
    {
      long long v9 = *(_OWORD *)v5;
      v35.__r_.__value_.__r.__words[2] = *(void *)(v5 + 16);
      *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v9;
    }
    UC::UCHuffmanTreeNode::UCHuffmanTreeNode((uint64_t)v8, (long long *)&v35, FrequencyForSymbol);
    char v27 = v8;
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v35.__r_.__value_.__l.__data_);
    }
    long long v10 = (uint64_t *)operator new(8uLL);
    uint64_t v11 = (uint64_t)v27;
    std::__split_buffer<std::string> v26 = v10;
    char v27 = 0;
    v35.__r_.__value_.__r.__words[0] = 0;
    *long long v10 = v11;
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v35, 0);
    std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::push((uint64_t *)&v30, (uint64_t *)&v26);
    uint64_t v12 = v26;
    if (v26)
    {
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v26, 0);
      operator delete(v12);
    }
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v27, 0);
    v5 += 24;
  }
  char v13 = v30;
  if ((unint64_t)(v31 - (void)v30) >= 9)
  {
    do
    {
      char v14 = (uint64_t *)*v13;
      uint64_t v15 = *v14;
      uint64_t *v14 = 0;
      char v27 = (_DWORD *)v15;
      std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop((uint64_t)&v30);
      char v16 = **v30;
      **uint64_t v30 = 0;
      std::__split_buffer<std::string> v26 = v16;
      std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop((uint64_t)&v30);
      LODWORD(v35.__r_.__value_.__l.__data_) = *((_DWORD *)v26 + 10) + v27[10];
      std::make_unique[abi:ne180100]<UC::UCHuffmanTreeNode,std::unique_ptr<UC::UCHuffmanTreeNode>,std::unique_ptr<UC::UCHuffmanTreeNode>,unsigned int,char const(&)[1]>((uint64_t *)&v27, (uint64_t *)&v26, &v35, "", &v25);
      uint64_t v17 = (uint64_t *)operator new(8uLL);
      uint64_t v18 = v25;
      char v24 = v17;
      uint64_t v25 = 0;
      v35.__r_.__value_.__r.__words[0] = 0;
      *uint64_t v17 = v18;
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v35, 0);
      std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::push((uint64_t *)&v30, (uint64_t *)&v24);
      uint64_t v19 = v24;
      if (v24)
      {
        std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v24, 0);
        operator delete(v19);
      }
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&v25, 0);
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v26, 0);
      std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)&v27, 0);
      char v13 = v30;
    }
    while ((unint64_t)(v31 - (void)v30) > 8);
  }
  uint64_t v20 = (uint64_t *)*v13;
  uint64_t v21 = *v20;
  *uint64_t v20 = 0;
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  v35.__r_.__value_.__r.__words[0] = (std::string::size_type)&v30;
  std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v35);
  uint64_t v23 = 0;
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v3, v21);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&v23, 0);
  return a1;
}

void sub_22E87DB50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, int a19, __int16 a20,char a21,char a22,char *a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31,int a32,__int16 a33,char a34,char a35)
{
  a23 = &a25;
  std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a23);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v35, 0);
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v36, 0);
  _Unwind_Resume(a1);
}

void UC::UCHuffmanCoder::_initilizeSymbolToCodeMap(uint64_t **this)
{
  uint64_t v1 = (uint64_t *)(this + 1);
  if (!this[1])
  {
    char v3 = operator new(0x28uLL);
    _OWORD *v3 = 0u;
    v3[1] = 0u;
    *((_DWORD *)v3 + 8) = 1065353216;
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    _generateSymbolToCodeMapHelper((uint64_t)v3, &__p, this[2]);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v1, (uint64_t)v3);
  }
}

void sub_22E87DCC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  uint64_t v17 = (void *)std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(v15);
  operator delete(v17);
  _Unwind_Resume(a1);
}

void _generateSymbolToCodeMapHelper(uint64_t a1, std::string *a2, uint64_t *a3)
{
  uint64_t v4 = a2;
  uint64_t v6 = *a3;
  if (*a3)
  {
    std::string::push_back(a2, 48);
    if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0) {
      std::string::__init_copy_ctor_external(&v13, v4->__r_.__value_.__l.__data_, v4->__r_.__value_.__l.__size_);
    }
    else {
      std::string v13 = *v4;
    }
    _generateSymbolToCodeMapHelper(a1, &v13, v6);
    if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v13.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
    {
      long long v9 = (std::string *)v4->__r_.__value_.__r.__words[0];
      uint64_t v8 = v4->__r_.__value_.__l.__size_ - 1;
      v4->__r_.__value_.__l.__size_ = v8;
    }
    else
    {
      uint64_t v8 = HIBYTE(v4->__r_.__value_.__r.__words[2]) - 1;
      *((unsigned char *)&v4->__r_.__value_.__s + 23) = v8 & 0x7F;
      long long v9 = v4;
    }
    v9->__r_.__value_.__s.__data_[v8] = 0;
    uint64_t v7 = a3[1];
    if (v7) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v7 = a3[1];
    if (v7)
    {
LABEL_14:
      std::string::push_back(v4, 49);
      if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&__p, v4->__r_.__value_.__l.__data_, v4->__r_.__value_.__l.__size_);
      }
      else {
        std::string __p = *v4;
      }
      _generateSymbolToCodeMapHelper(a1, &__p, v7);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v4->__r_.__value_.__r.__words[2]) < 0)
      {
        uint64_t v10 = v4->__r_.__value_.__l.__size_ - 1;
        v4->__r_.__value_.__l.__size_ = v10;
        uint64_t v4 = (std::string *)v4->__r_.__value_.__r.__words[0];
      }
      else
      {
        uint64_t v10 = HIBYTE(v4->__r_.__value_.__r.__words[2]) - 1;
        *((unsigned char *)&v4->__r_.__value_.__s + 23) = v10 & 0x7F;
      }
      v4->__r_.__value_.__s.__data_[v10] = 0;
      return;
    }
    if (*((char *)a3 + 39) < 0) {
      std::string::__init_copy_ctor_external(&v14, (const std::string::value_type *)a3[2], a3[3]);
    }
    else {
      std::string v14 = *(std::string *)(a3 + 2);
    }
    uint64_t v15 = &v14;
    uint64_t v11 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, (unsigned __int8 *)&v14, (uint64_t)&std::piecewise_construct, (long long **)&v15);
    std::string::operator=((std::string *)(v11 + 40), v4);
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v14.__r_.__value_.__l.__data_);
    }
  }
}

void sub_22E87DEBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void UC::UCHuffmanCoder::encode(uint64_t **a1@<X0>, unsigned __int8 *a2@<X1>, std::string *a3@<X8>)
{
  UC::UCHuffmanCoder::_initilizeSymbolToCodeMap(a1);
  uint64_t v6 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(a1[1], a2);
  if (!v6)
  {
    exception = __cxa_allocate_exception(0x38uLL);
    uint64_t v11 = exception;
    int v12 = (char)a2[23];
    if (v12 >= 0) {
      std::string v13 = a2;
    }
    else {
      std::string v13 = *(unsigned __int8 **)a2;
    }
    if (v12 >= 0) {
      uint64_t v14 = a2[23];
    }
    else {
      uint64_t v14 = *((void *)a2 + 1);
    }
    UC::Exception::UnsupportedEncodingSymbol::UnsupportedEncodingSymbol(exception, v13, v14, "Huffman coder encountered an unsupported symbol", 47);
  }
  if ((char)v6[63] < 0)
  {
    uint64_t v8 = (const std::string::value_type *)*((void *)v6 + 5);
    std::string::size_type v9 = *((void *)v6 + 6);
    std::string::__init_copy_ctor_external(a3, v8, v9);
  }
  else
  {
    long long v7 = *(_OWORD *)(v6 + 40);
    a3->__r_.__value_.__r.__words[2] = *((void *)v6 + 7);
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v7;
  }
}

void sub_22E87DFDC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::Exception::UnsupportedEncodingSymbol::~UnsupportedEncodingSymbol(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26E242C08;
  if (SHIBYTE(this[6].__vftable) < 0) {
    operator delete(this[4].__vftable);
  }
  this->__vftable = (std::exception_vtbl *)&unk_26E242B78;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

{
  void *v2;
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26E242C08;
  if (SHIBYTE(this[6].__vftable) < 0) {
    operator delete(this[4].__vftable);
  }
  this->__vftable = (std::exception_vtbl *)&unk_26E242B78;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  operator delete(v2);
}

void UC::UCHuffmanCoder::encode(uint64_t a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 32))(__p, a1, v3);
      if ((v10 & 0x80u) == 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      if ((v10 & 0x80u) == 0) {
        std::string::size_type v8 = v10;
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(a3, (const std::string::value_type *)v7, v8);
      if ((char)v10 < 0) {
        operator delete(__p[0]);
      }
      v3 += 24;
    }
    while (v3 != v4);
  }
}

void sub_22E87E140(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void UC::UCHuffmanCoder::decode(UC::UCBitStream *this@<X1>, uint64_t a2@<X0>, unsigned __int8 *a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  while (UC::UCBitStream::hasMore(this))
  {
    (*(void (**)(void **__return_ptr, uint64_t, UC::UCBitStream *))(*(void *)a2 + 56))(&__s1, a2, this);
    uint64_t v8 = v20;
    int v9 = (char)v20;
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v10 = v20;
    }
    else {
      std::string::size_type v10 = __n;
    }
    uint64_t v11 = a3[23];
    int v12 = (char)v11;
    if ((v11 & 0x80u) != 0) {
      uint64_t v11 = *((void *)a3 + 1);
    }
    if (v10 == v11)
    {
      if (v12 >= 0) {
        std::string v13 = a3;
      }
      else {
        std::string v13 = *(unsigned __int8 **)a3;
      }
      if ((char)v20 < 0)
      {
        char v16 = __s1;
        if (!memcmp(__s1, v13, __n))
        {
          operator delete(v16);
          return;
        }
      }
      else
      {
        if (!v20) {
          return;
        }
        p_s1 = &__s1;
        while (*(unsigned __int8 *)p_s1 == *v13)
        {
          p_s1 = (void **)((char *)p_s1 + 1);
          ++v13;
          if (!--v8)
          {
            char v15 = 0;
            if ((v20 & 0x80) == 0) {
              goto LABEL_24;
            }
            goto LABEL_26;
          }
        }
      }
    }
    if (v9 >= 0) {
      uint64_t v17 = (const std::string::value_type *)&__s1;
    }
    else {
      uint64_t v17 = (const std::string::value_type *)__s1;
    }
    std::string::append(a4, v17, v10);
    char v15 = 1;
    if ((v20 & 0x80) != 0)
    {
LABEL_26:
      operator delete(__s1);
      if ((v15 & 1) == 0) {
        return;
      }
    }
    else
    {
LABEL_24:
      if ((v15 & 1) == 0) {
        return;
      }
    }
  }
}

void sub_22E87E2D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UC::UCHuffmanCoder::canEncode(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 == v3) {
    return 1;
  }
  do
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, v2);
    v2 += 24;
    if (result) {
      BOOL v6 = v2 == v3;
    }
    else {
      BOOL v6 = 1;
    }
  }
  while (!v6);
  return result;
}

BOOL UC::UCHuffmanCoder::canEncode(uint64_t **a1, unsigned __int8 *a2)
{
  return std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(a1[1], a2) != 0;
}

void UC::UCHuffmanCoder::decodeNextSymbol(UC::UCHuffmanCoder *this@<X0>, UC::UCBitStream *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v5 = (void *)*((void *)this + 2);
  if (!UC::UCBitStream::hasMore(a2))
  {
LABEL_7:
    exception = __cxa_allocate_exception(0x38uLL);
    UC::Exception::InvalidDecodingSymbolInstruction::InvalidDecodingSymbolInstruction(exception, "", 0, "Huffman decoder encountered an invalid symbol instruction. The encoding bit stream is invalid", 93);
  }
  while (1)
  {
    int NextBit = UC::UCBitStream::readNextBit(a2);
    long long v7 = v5 + 1;
    if (!NextBit) {
      long long v7 = v5;
    }
    uint64_t v5 = (void *)*v7;
    if (!*(void *)*v7 && !v5[1]) {
      break;
    }
    if (!UC::UCBitStream::hasMore(a2)) {
      goto LABEL_7;
    }
  }
  if (*((char *)v5 + 39) < 0)
  {
    std::string::size_type v10 = (const std::string::value_type *)v5[2];
    std::string::size_type v11 = v5[3];
    std::string::__init_copy_ctor_external(a3, v10, v11);
  }
  else
  {
    long long v9 = *((_OWORD *)v5 + 1);
    a3->__r_.__value_.__r.__words[2] = v5[4];
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v9;
  }
}

void sub_22E87E4B8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void UC::Exception::InvalidDecodingSymbolInstruction::~InvalidDecodingSymbolInstruction(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26E242C30;
  if (SHIBYTE(this[6].__vftable) < 0) {
    operator delete(this[4].__vftable);
  }
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

{
  void *v2;
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26E242C30;
  if (SHIBYTE(this[6].__vftable) < 0) {
    operator delete(this[4].__vftable);
  }
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  operator delete(v2);
}

void UC::UCHuffmanCoder::~UCHuffmanCoder(UC::UCHuffmanCoder *this)
{
  *(void *)this = &unk_26E242BA0;
  uint64_t v1 = (uint64_t *)((char *)this + 8);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)this + 2, 0);
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v1, 0);
}

{
  uint64_t *v2;
  uint64_t vars8;

  *(void *)this = &unk_26E242BA0;
  uint64_t v2 = (uint64_t *)((char *)this + 8);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100]((uint64_t *)this + 2, 0);
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v2, 0);
  operator delete(this);
}

void std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::push(uint64_t *a1, uint64_t *a2)
{
  unint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  long long v7 = *(void **)(v4 - 8);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = ((uint64_t)v7 - *a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v5 - *a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v26 = v4;
    if (v13) {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<UCHuffmanNodeWrapper>>>(v4, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    uint64_t v15 = &v14[8 * v10];
    char v16 = &v14[8 * v13];
    uint64_t v25 = v16;
    uint64_t v17 = *a2;
    *a2 = 0;
    *(void *)uint64_t v15 = v17;
    uint64_t v9 = (uint64_t)(v15 + 8);
    v24.i64[1] = (uint64_t)(v15 + 8);
    uint64_t v19 = (void *)*a1;
    uint64_t v18 = (void *)a1[1];
    if (v18 == (void *)*a1)
    {
      int64x2_t v21 = vdupq_n_s64((unint64_t)v18);
    }
    else
    {
      do
      {
        uint64_t v20 = *--v18;
        *uint64_t v18 = 0;
        *((void *)v15 - 1) = v20;
        v15 -= 8;
      }
      while (v18 != v19);
      int64x2_t v21 = *(int64x2_t *)a1;
      uint64_t v9 = v24.i64[1];
      char v16 = v25;
    }
    *a1 = (uint64_t)v15;
    a1[1] = v9;
    int64x2_t v24 = v21;
    uint64_t v22 = a1[2];
    a1[2] = (uint64_t)v16;
    uint64_t v25 = (char *)v22;
    uint64_t v23 = v21.i64[0];
    std::__split_buffer<std::unique_ptr<UCHuffmanNodeWrapper>>::~__split_buffer((uint64_t)&v23);
  }
  else
  {
    uint64_t v8 = *a2;
    *a2 = 0;
    void *v7 = v8;
    uint64_t v9 = (uint64_t)(v7 + 1);
  }
  a1[1] = v9;
  std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0 &,std::__wrap_iter<std::unique_ptr<UCHuffmanNodeWrapper> *>>(*a1, v9, (v9 - *a1) >> 3);
}

void std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop(uint64_t a1)
{
  uint64_t v2 = *(uint64_t ***)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v4 = v3 - *(void *)a1;
  if (v4 >= 9)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v4 >> 3;
    char v16 = *v2;
    *uint64_t v2 = 0;
    int64_t v7 = (unint64_t)((v4 >> 3) - 2) >> 1;
    uint64_t v8 = v2;
    do
    {
      uint64_t v9 = &v8[v5 + 1];
      uint64_t v10 = (2 * v5) | 1;
      uint64_t v11 = 2 * v5 + 2;
      if (v11 < v6
        && createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0::operator()((uint64_t ***)&v8[v5 + 1], (uint64_t ***)&v8[v5 + 2]))
      {
        ++v9;
        uint64_t v10 = v11;
      }
      uint64_t v12 = *v9;
      *uint64_t v9 = 0;
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v8, v12);
      uint64_t v8 = v9;
      uint64_t v5 = v10;
    }
    while (v10 <= v7);
    unint64_t v13 = (uint64_t **)(v3 - 8);
    if (v9 == (uint64_t **)(v3 - 8))
    {
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v9, v16);
    }
    else
    {
      uint64_t v14 = *v13;
      unsigned __int8 *v13 = 0;
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v9, v14);
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100]((uint64_t **)(v3 - 8), v16);
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0 &,std::__wrap_iter<std::unique_ptr<UCHuffmanNodeWrapper> *>>((uint64_t)v2, (uint64_t)(v9 + 1), v9 + 1 - v2);
    }
  }
  uint64_t v15 = (uint64_t **)(*(void *)(a1 + 8) - 8);
  std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v15, 0);
  *(void *)(a1 + 8) = v15;
}

void sub_22E87E874(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t *a10)
{
  if (a10) {
    std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop(a10);
  }
  _Unwind_Resume(exception_object);
}

void std::make_unique[abi:ne180100]<UC::UCHuffmanTreeNode,std::unique_ptr<UC::UCHuffmanTreeNode>,std::unique_ptr<UC::UCHuffmanTreeNode>,unsigned int,char const(&)[1]>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _DWORD *a3@<X2>, char *a4@<X3>, void *a5@<X8>)
{
  uint64_t v10 = operator new(0x30uLL);
  uint64_t v11 = *a1;
  *a1 = 0;
  uint64_t v12 = *a2;
  *a2 = 0;
  uint64_t v15 = v12;
  uint64_t v16 = v11;
  LODWORD(a3) = *a3;
  std::string::basic_string[abi:ne180100]<0>(__p, a4);
  UC::UCHuffmanTreeNode::UCHuffmanTreeNode((uint64_t)v10, &v16, &v15, (int)a3, (long long *)__p);
  *a5 = v10;
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&v15, 0);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&v16, 0);
}

void sub_22E87E94C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&a16, 0);
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](&a17, 0);
  operator delete(v17);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<UCHuffmanNodeWrapper>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(8 * a2);
}

uint64_t std::__split_buffer<std::unique_ptr<UCHuffmanNodeWrapper>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 8;
    std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100]((uint64_t **)(i - 8), 0);
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0 &,std::__wrap_iter<std::unique_ptr<UCHuffmanNodeWrapper> *>>(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 - 2;
  if (a3 >= 2)
  {
    unint64_t v5 = v3 >> 1;
    uint64_t v6 = (uint64_t ***)(a1 + 8 * (v3 >> 1));
    int64_t v7 = (uint64_t **)(a2 - 8);
    if (createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0::operator()(v6, (uint64_t ***)(a2 - 8)))
    {
      uint64_t v8 = *v7;
      void *v7 = 0;
      uint64_t v11 = (uint64_t **)v8;
      do
      {
        uint64_t v9 = (uint64_t **)v6;
        uint64_t v10 = *v6;
        unsigned __int8 *v6 = 0;
        std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v7, (uint64_t *)v10);
        if (!v5) {
          break;
        }
        unint64_t v5 = (v5 - 1) >> 1;
        uint64_t v6 = (uint64_t ***)(a1 + 8 * v5);
        int64_t v7 = v9;
      }
      while (createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0::operator()(v6, &v11));
      std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](v9, v8);
    }
  }
}

void sub_22E87EAC8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100]((uint64_t **)va, 0);
  _Unwind_Resume(a1);
}

BOOL createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0::operator()(uint64_t ***a1, uint64_t ***a2)
{
  uint64_t v2 = **a1;
  unsigned int v3 = *((_DWORD *)v2 + 10);
  uint64_t v4 = **a2;
  unsigned int v5 = *((_DWORD *)v4 + 10);
  if (v3 == v5)
  {
    do
    {
      do
      {
        int64_t v7 = v2;
        uint64_t v2 = (uint64_t *)*v2;
      }
      while (v2);
    }
    while (v7[1]);
    if (*((char *)v7 + 39) < 0)
    {
      std::string::__init_copy_ctor_external(&v22, (const std::string::value_type *)v7[2], v7[3]);
      uint64_t v4 = **a2;
    }
    else
    {
      std::string v22 = *(std::string *)(v7 + 2);
    }
    do
    {
      do
      {
        uint64_t v9 = v4;
        uint64_t v4 = (uint64_t *)*v4;
      }
      while (v4);
    }
    while (v9[1]);
    if (*((char *)v9 + 39) < 0) {
      std::string::__init_copy_ctor_external(&v21, (const std::string::value_type *)v9[2], v9[3]);
    }
    else {
      std::string v21 = *(std::string *)(v9 + 2);
    }
    int v10 = SHIBYTE(v21.__r_.__value_.__r.__words[2]);
    uint64_t v11 = (void *)v21.__r_.__value_.__r.__words[0];
    char v12 = HIBYTE(v22.__r_.__value_.__r.__words[2]);
    if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v22.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v22.__r_.__value_.__l.__size_;
    }
    if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      char v14 = &v22;
    }
    else {
      char v14 = (std::string *)v22.__r_.__value_.__r.__words[0];
    }
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type v15 = HIBYTE(v21.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type v15 = v21.__r_.__value_.__l.__size_;
    }
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v16 = &v21;
    }
    else {
      uint64_t v16 = (std::string *)v21.__r_.__value_.__r.__words[0];
    }
    if (v15 >= size) {
      size_t v17 = size;
    }
    else {
      size_t v17 = v15;
    }
    int v18 = memcmp(v14, v16, v17);
    if (size < v15) {
      int v19 = -1;
    }
    else {
      int v19 = v15 < size;
    }
    if (v18) {
      int v19 = v18;
    }
    BOOL v8 = v19 > 0;
    if (v10 < 0)
    {
      operator delete(v11);
      if ((*((unsigned char *)&v22.__r_.__value_.__s + 23) & 0x80) == 0) {
        return v8;
      }
    }
    else if ((v12 & 0x80) == 0)
    {
      return v8;
    }
    operator delete(v22.__r_.__value_.__l.__data_);
    return v8;
  }
  return v3 > v5;
}

void sub_22E87EC50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v2, 0);
    operator delete(v2);
  }
}

void std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (uint64_t **)**a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t **)v1[1];
    unsigned int v5 = **a1;
    if (v4 != v2)
    {
      do
        std::unique_ptr<UCHuffmanNodeWrapper>::reset[abi:ne180100](--v4, 0);
      while (v4 != v2);
      unsigned int v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  BOOL v8 = (void *)(a1 + 24);
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
    char v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
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
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
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
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v22);
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
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_22E87EFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  BOOL v8 = operator new(0x40uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *BOOL v8 = 0;
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
  v8[7] = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_22E87F070(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
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
      size_t v22 = a2 + 4;
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

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
      int v11 = (void *)*v7;
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
            *int v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            int v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          int v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    int v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
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

uint64_t UC::Exception::UnsupportedEncodingSymbol::UnsupportedEncodingSymbol(uint64_t a1, const void *a2, size_t a3, void *__src, size_t __len)
{
  unint64_t v8 = (void *)UC::Exception::InvalidEncodingInput::InvalidEncodingInput(a1, __src, __len);
  *unint64_t v8 = &unk_26E242C08;
  uint8x8_t v9 = v8 + 4;
  if (a3 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a3 >= 0x17)
  {
    uint64_t v10 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v10 = a3 | 7;
    }
    uint64_t v11 = v10 + 1;
    uint8x8_t v9 = operator new(v10 + 1);
    *(void *)(a1 + 40) = a3;
    *(void *)(a1 + 48) = v11 | 0x8000000000000000;
    *(void *)(a1 + 32) = v9;
  }
  else
  {
    *(unsigned char *)(a1 + 55) = a3;
    if (!a3) {
      goto LABEL_9;
    }
  }
  memmove(v9, a2, a3);
LABEL_9:
  *((unsigned char *)v9 + a3) = 0;
  return a1;
}

void sub_22E87F9B0(_Unwind_Exception *a1)
{
  UC::Exception::InvalidEncodingInput::~InvalidEncodingInput(v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidDecodingSymbolInstruction::InvalidDecodingSymbolInstruction(uint64_t a1, void *__src, size_t __len, void *a4, size_t a5)
{
  *(void *)a1 = &unk_26E242C30;
  if (__len > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (__len >= 0x17)
  {
    size_t v11 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17) {
      size_t v11 = __len | 7;
    }
    size_t v12 = v11 + 1;
    uint64_t v10 = operator new(v11 + 1);
    *(void *)(a1 + 16) = __len;
    *(void *)(a1 + 24) = v12 | 0x8000000000000000;
    *(void *)(a1 + 8) = v10;
    goto LABEL_8;
  }
  *(unsigned char *)(a1 + 31) = __len;
  uint64_t v10 = (void *)(a1 + 8);
  if (__len) {
LABEL_8:
  }
    memmove(v10, __src, __len);
  *((unsigned char *)v10 + __len) = 0;
  unint64_t v13 = (void *)(a1 + 32);
  if (a5 > 0x7FFFFFFFFFFFFFF7) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  if (a5 >= 0x17)
  {
    uint64_t v14 = (a5 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a5 | 7) != 0x17) {
      uint64_t v14 = a5 | 7;
    }
    uint64_t v15 = v14 + 1;
    unint64_t v13 = operator new(v14 + 1);
    *(void *)(a1 + 40) = a5;
    *(void *)(a1 + 48) = v15 | 0x8000000000000000;
    *(void *)(a1 + 32) = v13;
  }
  else
  {
    *(unsigned char *)(a1 + 55) = a5;
    if (!a5) {
      goto LABEL_17;
    }
  }
  memmove(v13, a4, a5);
LABEL_17:
  *((unsigned char *)v13 + a5) = 0;
  return a1;
}

void sub_22E87FC10(_Unwind_Exception *a1)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  std::exception::~exception((std::exception *)v1);
  _Unwind_Resume(a1);
}

uint64_t UC::Exception::InvalidDecodingSymbolInstruction::what(UC::Exception::InvalidDecodingSymbolInstruction *this)
{
  uint64_t result = (uint64_t)this + 32;
  if (*((char *)this + 55) < 0) {
    return *(void *)result;
  }
  return result;
}

void std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    if (*(char *)(v2 + 39) < 0) {
      operator delete(*(void **)(v2 + 16));
    }
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v2 + 8, 0);
    std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](v2, 0);
    operator delete((void *)v2);
  }
}

void std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    int8x8_t v4 = (void *)std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(v3);
    operator delete(v4);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(void *a1, unsigned __int8 *a2)
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
  size_t v11 = *v10;
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
      size_t v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

std::string *UC::SUE::UCSegmentedURLCoderProvider::UCSegmentedURLCoderProvider(std::string *this, long long *a2, long long *a3, long long *a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
  }
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this + 1, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v8 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((void *)a3 + 2);
    *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = v8;
  }
  unint64_t v9 = this + 2;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v10 = *a4;
    this[2].__r_.__value_.__r.__words[2] = *((void *)a4 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v10;
  }
  *(_OWORD *)&this[7].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[6].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&this[5].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[5].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[4].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&this[3].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[3].__r_.__value_.__l.__data_ = 0u;
  return this;
}

void sub_22E87FFD4(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 47) < 0) {
    operator delete(*v2);
  }
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void UC::SUE::UCSegmentedURLCoderProvider::clearCaches(UC::SUE::UCSegmentedURLCoderProvider *this)
{
  uint64_t v2 = (UC::UCMultiContextHuffmanCoder *)*((void *)this + 13);
  if (v2) {
    UC::UCMultiContextHuffmanCoder::clearCaches(v2);
  }
  uint64_t v3 = (UC::UCMultiContextHuffmanCoder *)*((void *)this + 17);
  if (v3) {
    UC::UCMultiContextHuffmanCoder::clearCaches(v3);
  }
  unint64_t v4 = (UC::UCMultiContextHuffmanCoder *)*((void *)this + 15);
  if (v4)
  {
    UC::UCMultiContextHuffmanCoder::clearCaches(v4);
  }
}

uint64_t UC::SUE::UCSegmentedURLCoderProvider::getTLDCoder@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = this;
  uint64_t v68 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(this + 72);
  if (v4)
  {
    uint64_t v5 = *(void *)(this + 80);
    *a2 = v4;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v18, ".com");
    LOWORD(v19) = -2;
    std::string::basic_string[abi:ne180100]<0>(&v20, ".org");
    __int16 v22 = 9974;
    std::string::basic_string[abi:ne180100]<0>(&v23, ".net");
    __int16 v25 = 5990;
    std::string::basic_string[abi:ne180100]<0>(v26, ".de");
    LOWORD(v27) = 4451;
    std::string::basic_string[abi:ne180100]<0>(&v28, ".ru");
    __int16 v30 = 4077;
    std::string::basic_string[abi:ne180100]<0>(&v31, ".cn");
    __int16 v33 = 3255;
    std::string::basic_string[abi:ne180100]<0>(v34, ".uk");
    LOWORD(v35) = 3206;
    std::string::basic_string[abi:ne180100]<0>(&v36, ".jp");
    __int16 v38 = 2274;
    std::string::basic_string[abi:ne180100]<0>(&v39, ".it");
    __int16 v41 = 1580;
    std::string::basic_string[abi:ne180100]<0>(v42, ".fr");
    LOWORD(v43) = 1437;
    std::string::basic_string[abi:ne180100]<0>(&v44, ".nl");
    __int16 v46 = 1432;
    std::string::basic_string[abi:ne180100]<0>(&v47, ".au");
    __int16 v49 = 1299;
    std::string::basic_string[abi:ne180100]<0>(v50, ".br");
    LOWORD(v51) = 1197;
    std::string::basic_string[abi:ne180100]<0>(&v52, ".ca");
    __int16 v54 = 1154;
    std::string::basic_string[abi:ne180100]<0>(&v55, ".info");
    __int16 v57 = 1097;
    std::string::basic_string[abi:ne180100]<0>(&v58, ".in");
    __int16 v59 = 981;
    std::string::basic_string[abi:ne180100]<0>(v60, ".edu");
    __int16 v61 = 961;
    std::string::basic_string[abi:ne180100]<0>(v62, ".us");
    __int16 v63 = 865;
    std::string::basic_string[abi:ne180100]<0>(v64, ".pl");
    __int16 v65 = 850;
    std::string::basic_string[abi:ne180100]<0>(v66, ".ga");
    __int16 v67 = 838;
    std::unordered_map<std::string,unsigned short>::unordered_map((uint64_t)v15, (unsigned __int8 *)&v18, 20);
    uint64_t v6 = 640;
    do
    {
      if (*((char *)&v17 + v6 + 7) < 0) {
        operator delete(*(void **)&v15[v6 + 32]);
      }
      v6 -= 32;
    }
    while (v6);
    std::string::basic_string[abi:ne180100]<0>(&v18, ".com");
    std::string::basic_string[abi:ne180100]<0>(&v19, ".org");
    std::string::basic_string[abi:ne180100]<0>(&v21, ".net");
    std::string::basic_string[abi:ne180100]<0>(&v24, ".de");
    std::string::basic_string[abi:ne180100]<0>(v26, ".ru");
    std::string::basic_string[abi:ne180100]<0>(&v27, ".cn");
    std::string::basic_string[abi:ne180100]<0>(&v29, ".uk");
    std::string::basic_string[abi:ne180100]<0>(&v32, ".jp");
    std::string::basic_string[abi:ne180100]<0>(v34, ".it");
    std::string::basic_string[abi:ne180100]<0>(&v35, ".fr");
    std::string::basic_string[abi:ne180100]<0>(&v37, ".nl");
    std::string::basic_string[abi:ne180100]<0>(&v40, ".au");
    std::string::basic_string[abi:ne180100]<0>(v42, ".br");
    std::string::basic_string[abi:ne180100]<0>(&v43, ".ca");
    std::string::basic_string[abi:ne180100]<0>(&v45, ".info");
    std::string::basic_string[abi:ne180100]<0>(&v48, ".in");
    std::string::basic_string[abi:ne180100]<0>(v50, ".edu");
    std::string::basic_string[abi:ne180100]<0>(&v51, ".us");
    std::string::basic_string[abi:ne180100]<0>(&v53, ".pl");
    std::string::basic_string[abi:ne180100]<0>(&v56, ".ga");
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    uint64_t v14 = 0;
    unint64_t v16 = &v12;
    LOBYTE(v17) = 0;
    uint64_t v12 = (std::string *)operator new(0x1E0uLL);
    unint64_t v13 = v12;
    uint64_t v14 = (long long *)&v12[20];
    unint64_t v13 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v14, &v18, &v58, v12);
    uint64_t v7 = 60;
    do
    {
      if (*((char *)&v18 + v7 * 8 - 1) < 0) {
        operator delete((&v16)[v7]);
      }
      v7 -= 3;
    }
    while (v7 * 8);
    std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,unsigned short>,std::allocator<std::unordered_map<std::string,unsigned short>>,std::unordered_map<std::string,unsigned short>&,void>((uint64_t)v15, &v18);
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((long long **)&v12, &v11);
    std::allocate_shared[abi:ne180100]<UC::UCSymbolFrequencyTable,std::allocator<UC::UCSymbolFrequencyTable>,std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>,void>((uint64_t *)&v18, &v11, &v16);
    if (*((void *)&v11 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v11 + 1));
    }
    std::allocate_shared[abi:ne180100]<UC::UCHuffmanCoder,std::allocator<UC::UCHuffmanCoder>,std::shared_ptr<UC::UCSymbolFrequencyTable> &,void>((uint64_t *)&v16, &v11);
    unint64_t v8 = *((void *)&v11 + 1);
    unint64_t v9 = v11;
    long long v11 = 0uLL;
    long long v10 = *(std::__shared_weak_count **)(v2 + 80);
    *(_OWORD *)(v2 + 72) = __PAIR128__(v8, v9);
    if (v10)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      if (*((void *)&v11 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v11 + 1));
      }
      unint64_t v8 = *(void *)(v2 + 80);
    }
    *a2 = *(void *)(v2 + 72);
    a2[1] = v8;
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    if (v17) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
    if (*((void *)&v18 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
    }
    *(void *)&long long v18 = &v12;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
    return std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)v15);
  }
  return this;
}

void sub_22E880658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20,uint64_t a21,void **a22,std::__shared_weak_count *a23)
{
  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }
  if (a23) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a23);
  }
  a22 = (void **)&a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a22);
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table((uint64_t)&a14);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getTLDFixedLengthCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, void *a2@<X8>)
{
  *((void *)&v129 + 1) = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 11);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 12);
    *a2 = v4;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v15, ".co");
    std::string::basic_string[abi:ne180100]<0>(v16, ".es");
    std::string::basic_string[abi:ne180100]<0>(v17, ".ch");
    std::string::basic_string[abi:ne180100]<0>(v18, ".eu");
    std::string::basic_string[abi:ne180100]<0>(v19, ".io");
    std::string::basic_string[abi:ne180100]<0>(v20, ".vn");
    std::string::basic_string[abi:ne180100]<0>(v21, ".be");
    std::string::basic_string[abi:ne180100]<0>(v22, ".at");
    std::string::basic_string[abi:ne180100]<0>(v23, ".ua");
    std::string::basic_string[abi:ne180100]<0>(v24, ".cz");
    std::string::basic_string[abi:ne180100]<0>(v25, ".gov");
    std::string::basic_string[abi:ne180100]<0>(v26, ".tv");
    std::string::basic_string[abi:ne180100]<0>(v27, ".gr");
    std::string::basic_string[abi:ne180100]<0>(v28, ".cf");
    std::string::basic_string[abi:ne180100]<0>(v29, ".kr");
    std::string::basic_string[abi:ne180100]<0>(v30, ".tw");
    std::string::basic_string[abi:ne180100]<0>(v31, ".me");
    std::string::basic_string[abi:ne180100]<0>(v32, ".biz");
    std::string::basic_string[abi:ne180100]<0>(v33, ".site");
    std::string::basic_string[abi:ne180100]<0>(v34, ".se");
    std::string::basic_string[abi:ne180100]<0>(v35, ".tr");
    std::string::basic_string[abi:ne180100]<0>(v36, ".id");
    std::string::basic_string[abi:ne180100]<0>(v37, ".mx");
    std::string::basic_string[abi:ne180100]<0>(v38, ".wang");
    std::string::basic_string[abi:ne180100]<0>(v39, ".hu");
    std::string::basic_string[abi:ne180100]<0>(v40, ".nz");
    std::string::basic_string[abi:ne180100]<0>(v41, ".ro");
    std::string::basic_string[abi:ne180100]<0>(v42, ".cc");
    std::string::basic_string[abi:ne180100]<0>(v43, ".top");
    std::string::basic_string[abi:ne180100]<0>(v44, ".club");
    std::string::basic_string[abi:ne180100]<0>(v45, ".dk");
    std::string::basic_string[abi:ne180100]<0>(v46, ".ie");
    std::string::basic_string[abi:ne180100]<0>(v47, ".za");
    std::string::basic_string[abi:ne180100]<0>(v48, ".ar");
    std::string::basic_string[abi:ne180100]<0>(v49, ".no");
    std::string::basic_string[abi:ne180100]<0>(v50, ".online");
    std::string::basic_string[abi:ne180100]<0>(v51, ".cl");
    std::string::basic_string[abi:ne180100]<0>(v52, ".tk");
    std::string::basic_string[abi:ne180100]<0>(v53, ".fi");
    std::string::basic_string[abi:ne180100]<0>(v54, ".my");
    std::string::basic_string[abi:ne180100]<0>(v55, ".hk");
    std::string::basic_string[abi:ne180100]<0>(v56, ".sk");
    std::string::basic_string[abi:ne180100]<0>(v57, ".il");
    std::string::basic_string[abi:ne180100]<0>(v58, ".pt");
    std::string::basic_string[abi:ne180100]<0>(v59, ".th");
    std::string::basic_string[abi:ne180100]<0>(v60, ".nu");
    std::string::basic_string[abi:ne180100]<0>(v61, ".sg");
    std::string::basic_string[abi:ne180100]<0>(v62, ".kz");
    std::string::basic_string[abi:ne180100]<0>(v63, ".by");
    std::string::basic_string[abi:ne180100]<0>(v64, ".pk");
    std::string::basic_string[abi:ne180100]<0>(v65, ".su");
    std::string::basic_string[abi:ne180100]<0>(v66, ".to");
    std::string::basic_string[abi:ne180100]<0>(v67, ".ph");
    std::string::basic_string[abi:ne180100]<0>(v68, ".live");
    std::string::basic_string[abi:ne180100]<0>(v69, ".ae");
    std::string::basic_string[abi:ne180100]<0>(v70, ".space");
    std::string::basic_string[abi:ne180100]<0>(v71, ".mobi");
    std::string::basic_string[abi:ne180100]<0>(v72, ".ai");
    std::string::basic_string[abi:ne180100]<0>(v73, ".app");
    std::string::basic_string[abi:ne180100]<0>(v74, ".is");
    std::string::basic_string[abi:ne180100]<0>(v75, ".news");
    std::string::basic_string[abi:ne180100]<0>(v76, ".name");
    std::string::basic_string[abi:ne180100]<0>(v77, ".tech");
    std::string::basic_string[abi:ne180100]<0>(v78, ".vip");
    std::string::basic_string[abi:ne180100]<0>(v79, ".fun");
    std::string::basic_string[abi:ne180100]<0>(v80, ".network");
    std::string::basic_string[abi:ne180100]<0>(v81, ".cloud");
    std::string::basic_string[abi:ne180100]<0>(v82, ".lu");
    std::string::basic_string[abi:ne180100]<0>(v83, ".am");
    std::string::basic_string[abi:ne180100]<0>(v84, ".website");
    std::string::basic_string[abi:ne180100]<0>(v85, ".jobs");
    std::string::basic_string[abi:ne180100]<0>(v86, ".life");
    std::string::basic_string[abi:ne180100]<0>(v87, ".win");
    std::string::basic_string[abi:ne180100]<0>(v88, ".ly");
    std::string::basic_string[abi:ne180100]<0>(v89, ".do");
    std::string::basic_string[abi:ne180100]<0>(v90, ".tn");
    std::string::basic_string[abi:ne180100]<0>(v91, ".md");
    std::string::basic_string[abi:ne180100]<0>(v92, ".shop");
    std::string::basic_string[abi:ne180100]<0>(v93, ".store");
    std::string::basic_string[abi:ne180100]<0>(v94, ".media");
    std::string::basic_string[abi:ne180100]<0>(v95, ".world");
    std::string::basic_string[abi:ne180100]<0>(v96, ".travel");
    std::string::basic_string[abi:ne180100]<0>(v97, ".work");
    std::string::basic_string[abi:ne180100]<0>(v98, ".int");
    std::string::basic_string[abi:ne180100]<0>(v99, ".qa");
    std::string::basic_string[abi:ne180100]<0>(v100, ".global");
    std::string::basic_string[abi:ne180100]<0>(v101, ".company");
    std::string::basic_string[abi:ne180100]<0>(v102, ".host");
    std::string::basic_string[abi:ne180100]<0>(v103, ".wiki");
    std::string::basic_string[abi:ne180100]<0>(v104, ".stream");
    std::string::basic_string[abi:ne180100]<0>(v105, ".gt");
    std::string::basic_string[abi:ne180100]<0>(v106, ".py");
    std::string::basic_string[abi:ne180100]<0>(v107, ".video");
    std::string::basic_string[abi:ne180100]<0>(v108, ".bid");
    std::string::basic_string[abi:ne180100]<0>(v109, ".cm");
    std::string::basic_string[abi:ne180100]<0>(v110, ".mo");
    std::string::basic_string[abi:ne180100]<0>(v111, ".tel");
    std::string::basic_string[abi:ne180100]<0>(v112, ".digital");
    std::string::basic_string[abi:ne180100]<0>(v113, ".center");
    std::string::basic_string[abi:ne180100]<0>(v114, ".plus");
    std::string::basic_string[abi:ne180100]<0>(v115, ".ltd");
    std::string::basic_string[abi:ne180100]<0>(v116, ".services");
    std::string::basic_string[abi:ne180100]<0>(v117, ".so");
    std::string::basic_string[abi:ne180100]<0>(v118, ".tt");
    std::string::basic_string[abi:ne180100]<0>(v119, ".support");
    std::string::basic_string[abi:ne180100]<0>(v120, ".pub");
    std::string::basic_string[abi:ne180100]<0>(v121, ".help");
    std::string::basic_string[abi:ne180100]<0>(v122, ".gl");
    std::string::basic_string[abi:ne180100]<0>(v123, ".museum");
    std::string::basic_string[abi:ne180100]<0>(v124, ".pm");
    std::string::basic_string[abi:ne180100]<0>(v125, ".business");
    std::string::basic_string[abi:ne180100]<0>(v126, ".bike");
    std::string::basic_string[abi:ne180100]<0>(v127, ".loan");
    std::string::basic_string[abi:ne180100]<0>(v128, ".estate");
    long long v11 = 0;
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    *(void *)&long long v14 = &v11;
    BYTE8(v14) = 0;
    long long v11 = (std::string *)operator new(0xAB0uLL);
    uint64_t v12 = v11;
    unint64_t v13 = (long long *)&v11[114];
    uint64_t v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v13, &v15, &v129, v11);
    uint64_t v6 = 342;
    do
    {
      if (*((char *)&v16[v6 - 1] - 1) < 0) {
        operator delete(*(void **)((char *)&v14 + v6 * 8));
      }
      v6 -= 3;
    }
    while (v6 * 8);
    int v10 = 8;
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((long long **)&v11, &v14);
    std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>((char *)&v10, &v14, &v15);
    long long v7 = v15;
    long long v15 = 0uLL;
    unint64_t v8 = (std::__shared_weak_count *)*((void *)this + 12);
    *(_OWORD *)((char *)this + 88) = v7;
    if (v8)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      if (*((void *)&v15 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
      }
    }
    if (*((void *)&v14 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
    }
    uint64_t v9 = *((void *)this + 12);
    *a2 = *((void *)this + 11);
    a2[1] = v9;
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    *(void *)&long long v15 = &v11;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  }
}

void sub_22E881300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, void **a17)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  a17 = (void **)&a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a17);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getHostCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, void *a2@<X8>)
{
  *(void *)&long long v57 = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 13);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 14);
    *a2 = v4;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v18, "-");
    std::string::basic_string[abi:ne180100]<0>(v19, ".");
    std::string::basic_string[abi:ne180100]<0>(v20, "0");
    std::string::basic_string[abi:ne180100]<0>(v21, "1");
    std::string::basic_string[abi:ne180100]<0>(v22, "2");
    std::string::basic_string[abi:ne180100]<0>(v23, "3");
    std::string::basic_string[abi:ne180100]<0>(v24, "4");
    std::string::basic_string[abi:ne180100]<0>(v25, "5");
    std::string::basic_string[abi:ne180100]<0>(v26, "6");
    std::string::basic_string[abi:ne180100]<0>(v27, "7");
    std::string::basic_string[abi:ne180100]<0>(v28, "8");
    std::string::basic_string[abi:ne180100]<0>(v29, "9");
    std::string::basic_string[abi:ne180100]<0>(v30, "a");
    std::string::basic_string[abi:ne180100]<0>(v31, "b");
    std::string::basic_string[abi:ne180100]<0>(v32, "c");
    std::string::basic_string[abi:ne180100]<0>(v33, "d");
    std::string::basic_string[abi:ne180100]<0>(v34, "e");
    std::string::basic_string[abi:ne180100]<0>(v35, "f");
    std::string::basic_string[abi:ne180100]<0>(v36, "g");
    std::string::basic_string[abi:ne180100]<0>(v37, "h");
    std::string::basic_string[abi:ne180100]<0>(v38, "i");
    std::string::basic_string[abi:ne180100]<0>(v39, "j");
    std::string::basic_string[abi:ne180100]<0>(v40, "k");
    std::string::basic_string[abi:ne180100]<0>(v41, "l");
    std::string::basic_string[abi:ne180100]<0>(v42, "m");
    std::string::basic_string[abi:ne180100]<0>(v43, "n");
    std::string::basic_string[abi:ne180100]<0>(v44, "o");
    std::string::basic_string[abi:ne180100]<0>(v45, "p");
    std::string::basic_string[abi:ne180100]<0>(v46, "q");
    std::string::basic_string[abi:ne180100]<0>(v47, "r");
    std::string::basic_string[abi:ne180100]<0>(v48, "s");
    std::string::basic_string[abi:ne180100]<0>(v49, "t");
    std::string::basic_string[abi:ne180100]<0>(v50, "u");
    std::string::basic_string[abi:ne180100]<0>(v51, "v");
    std::string::basic_string[abi:ne180100]<0>(v52, "w");
    std::string::basic_string[abi:ne180100]<0>(v53, "x");
    std::string::basic_string[abi:ne180100]<0>(v54, "y");
    std::string::basic_string[abi:ne180100]<0>(v55, "z");
    std::string::basic_string[abi:ne180100]<0>(v56, "|");
    long long v14 = 0;
    long long v15 = 0;
    unint64_t v16 = 0;
    *(void *)&long long v17 = &v14;
    BYTE8(v17) = 0;
    long long v14 = (std::string *)operator new(0x3A8uLL);
    long long v15 = v14;
    unint64_t v16 = v14 + 39;
    long long v15 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v16, &v18, &v57, v14);
    uint64_t v6 = 117;
    do
    {
      if (*((char *)&v19[v6 - 1] - 1) < 0) {
        operator delete(*(void **)((char *)&v17 + v6 * 8 + 8));
      }
      v6 -= 3;
    }
    while (v6 * 8);
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((long long **)&v14, &v18);
    LODWORD(v17) = 2;
    std::make_unique[abi:ne180100]<UC::UCMultiContextHuffmanSymbolFrequencyReader,int,std::shared_ptr<std::vector<std::string>> &,std::string const&>((int *)&v17, (uint64_t *)&v18, (uint64_t)this, &__p);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::readData((std::string *)__p);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::getContextSymbolFrequency((uint64_t)__p, &v12);
    int v11 = 2;
    std::allocate_shared[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::allocator<UC::UCMultiContextHuffmanCoder>,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,void>(&v12, &v11, &v17);
    long long v7 = v17;
    long long v17 = 0uLL;
    unint64_t v8 = (std::__shared_weak_count *)*((void *)this + 14);
    *(_OWORD *)((char *)this + 104) = v7;
    if (v8)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      if (*((void *)&v17 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
      }
    }
    if (*((void *)&v12 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
    }
    uint64_t v9 = *((void *)this + 14);
    *a2 = *((void *)this + 13);
    a2[1] = v9;
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    int v10 = (char *)__p;
    std::string __p = 0;
    if (v10) {
      std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((int)&__p, v10);
    }
    if (*((void *)&v18 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
    }
    *(void *)&long long v18 = &v14;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  }
}

void sub_22E8818BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, char *__p, char a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21,std::__shared_weak_count *a22)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  uint64_t v23 = __p;
  std::string __p = 0;
  if (v23) {
    std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((int)&__p, v23);
  }
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  a21 = &a14;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  _Unwind_Resume(a1);
}

void std::make_unique[abi:ne180100]<UC::UCMultiContextHuffmanSymbolFrequencyReader,int,std::shared_ptr<std::vector<std::string>> &,std::string const&>(int *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  unint64_t v8 = operator new(0x40uLL);
  uint64_t v9 = *a1;
  int v10 = (std::__shared_weak_count *)a2[1];
  uint64_t v12 = *a2;
  unint64_t v13 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  UC::UCMultiContextHuffmanSymbolFrequencyReader::UCMultiContextHuffmanSymbolFrequencyReader(v8, v9, &v12, &__p);
  *a4 = v8;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
}

void sub_22E881A58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17)
{
  if (a17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a17);
  }
  operator delete(v17);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getCombinedPathAndQueryCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, void *a2@<X8>)
{
  *(void *)&long long v93 = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 15);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 16);
    *a2 = v4;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v18, "#");
    std::string::basic_string[abi:ne180100]<0>(v19, "%");
    std::string::basic_string[abi:ne180100]<0>(v20, "&");
    std::string::basic_string[abi:ne180100]<0>(v21, "+");
    std::string::basic_string[abi:ne180100]<0>(v22, ",");
    std::string::basic_string[abi:ne180100]<0>(v23, "-");
    std::string::basic_string[abi:ne180100]<0>(v24, ".");
    std::string::basic_string[abi:ne180100]<0>(v25, "/");
    std::string::basic_string[abi:ne180100]<0>(v26, "0");
    std::string::basic_string[abi:ne180100]<0>(v27, "1");
    std::string::basic_string[abi:ne180100]<0>(v28, "2");
    std::string::basic_string[abi:ne180100]<0>(v29, "3");
    std::string::basic_string[abi:ne180100]<0>(v30, "4");
    std::string::basic_string[abi:ne180100]<0>(v31, "5");
    std::string::basic_string[abi:ne180100]<0>(v32, "6");
    std::string::basic_string[abi:ne180100]<0>(v33, "7");
    std::string::basic_string[abi:ne180100]<0>(v34, "8");
    std::string::basic_string[abi:ne180100]<0>(v35, "9");
    std::string::basic_string[abi:ne180100]<0>(v36, ":");
    std::string::basic_string[abi:ne180100]<0>(v37, ";");
    std::string::basic_string[abi:ne180100]<0>(v38, "=");
    std::string::basic_string[abi:ne180100]<0>(v39, "?");
    std::string::basic_string[abi:ne180100]<0>(v40, "A");
    std::string::basic_string[abi:ne180100]<0>(v41, "B");
    std::string::basic_string[abi:ne180100]<0>(v42, "C");
    std::string::basic_string[abi:ne180100]<0>(v43, "D");
    std::string::basic_string[abi:ne180100]<0>(v44, "E");
    std::string::basic_string[abi:ne180100]<0>(v45, "F");
    std::string::basic_string[abi:ne180100]<0>(v46, "G");
    std::string::basic_string[abi:ne180100]<0>(v47, "H");
    std::string::basic_string[abi:ne180100]<0>(v48, "I");
    std::string::basic_string[abi:ne180100]<0>(v49, "J");
    std::string::basic_string[abi:ne180100]<0>(v50, "K");
    std::string::basic_string[abi:ne180100]<0>(v51, "L");
    std::string::basic_string[abi:ne180100]<0>(v52, "M");
    std::string::basic_string[abi:ne180100]<0>(v53, "N");
    std::string::basic_string[abi:ne180100]<0>(v54, "O");
    std::string::basic_string[abi:ne180100]<0>(v55, "P");
    std::string::basic_string[abi:ne180100]<0>(v56, "Q");
    std::string::basic_string[abi:ne180100]<0>(v57, "R");
    std::string::basic_string[abi:ne180100]<0>(v58, "S");
    std::string::basic_string[abi:ne180100]<0>(v59, "T");
    std::string::basic_string[abi:ne180100]<0>(v60, "U");
    std::string::basic_string[abi:ne180100]<0>(v61, "V");
    std::string::basic_string[abi:ne180100]<0>(v62, "W");
    std::string::basic_string[abi:ne180100]<0>(v63, "X");
    std::string::basic_string[abi:ne180100]<0>(v64, "Y");
    std::string::basic_string[abi:ne180100]<0>(v65, "Z");
    std::string::basic_string[abi:ne180100]<0>(v66, "_");
    std::string::basic_string[abi:ne180100]<0>(v67, "a");
    std::string::basic_string[abi:ne180100]<0>(v68, "b");
    std::string::basic_string[abi:ne180100]<0>(v69, "c");
    std::string::basic_string[abi:ne180100]<0>(v70, "d");
    std::string::basic_string[abi:ne180100]<0>(v71, "e");
    std::string::basic_string[abi:ne180100]<0>(v72, "f");
    std::string::basic_string[abi:ne180100]<0>(v73, "g");
    std::string::basic_string[abi:ne180100]<0>(v74, "h");
    std::string::basic_string[abi:ne180100]<0>(v75, "i");
    std::string::basic_string[abi:ne180100]<0>(v76, "j");
    std::string::basic_string[abi:ne180100]<0>(v77, "k");
    std::string::basic_string[abi:ne180100]<0>(v78, "l");
    std::string::basic_string[abi:ne180100]<0>(v79, "m");
    std::string::basic_string[abi:ne180100]<0>(v80, "n");
    std::string::basic_string[abi:ne180100]<0>(v81, "o");
    std::string::basic_string[abi:ne180100]<0>(v82, "p");
    std::string::basic_string[abi:ne180100]<0>(v83, "q");
    std::string::basic_string[abi:ne180100]<0>(v84, "r");
    std::string::basic_string[abi:ne180100]<0>(v85, "s");
    std::string::basic_string[abi:ne180100]<0>(v86, "t");
    std::string::basic_string[abi:ne180100]<0>(v87, "u");
    std::string::basic_string[abi:ne180100]<0>(v88, "v");
    std::string::basic_string[abi:ne180100]<0>(v89, "w");
    std::string::basic_string[abi:ne180100]<0>(v90, "x");
    std::string::basic_string[abi:ne180100]<0>(v91, "y");
    std::string::basic_string[abi:ne180100]<0>(v92, "z");
    long long v14 = 0;
    long long v15 = 0;
    unint64_t v16 = 0;
    *(void *)&long long v17 = &v14;
    BYTE8(v17) = 0;
    long long v14 = (std::string *)operator new(0x708uLL);
    long long v15 = v14;
    unint64_t v16 = v14 + 75;
    long long v15 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v16, &v18, &v93, v14);
    uint64_t v6 = 225;
    do
    {
      if (*((char *)&v19[v6 - 1] - 1) < 0) {
        operator delete(*(void **)((char *)&v17 + v6 * 8 + 8));
      }
      v6 -= 3;
    }
    while (v6 * 8);
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((long long **)&v14, &v18);
    LODWORD(v17) = 2;
    std::make_unique[abi:ne180100]<UC::UCMultiContextHuffmanSymbolFrequencyReader,int,std::shared_ptr<std::vector<std::string>> &,std::string const&>((int *)&v17, (uint64_t *)&v18, (uint64_t)this + 24, &__p);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::readData((std::string *)__p);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::getContextSymbolFrequency((uint64_t)__p, &v12);
    int v11 = 2;
    std::allocate_shared[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::allocator<UC::UCMultiContextHuffmanCoder>,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,void>(&v12, &v11, &v17);
    long long v7 = v17;
    long long v17 = 0uLL;
    unint64_t v8 = (std::__shared_weak_count *)*((void *)this + 16);
    *(_OWORD *)((char *)this + 120) = v7;
    if (v8)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      if (*((void *)&v17 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
      }
    }
    if (*((void *)&v12 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
    }
    uint64_t v9 = *((void *)this + 16);
    *a2 = *((void *)this + 15);
    a2[1] = v9;
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    int v10 = (char *)__p;
    std::string __p = 0;
    if (v10) {
      std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((int)&__p, v10);
    }
    if (*((void *)&v18 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
    }
    *(void *)&long long v18 = &v14;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  }
}

void sub_22E8822C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, char *__p, char a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21,std::__shared_weak_count *a22)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  uint64_t v23 = __p;
  std::string __p = 0;
  if (v23) {
    std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((int)&__p, v23);
  }
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  a21 = &a14;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQueryCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, void *a2@<X8>)
{
  *(void *)&long long v89 = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 17);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 18);
    *a2 = v4;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v18, "&");
    std::string::basic_string[abi:ne180100]<0>(v19, "+");
    std::string::basic_string[abi:ne180100]<0>(v20, "-");
    std::string::basic_string[abi:ne180100]<0>(v21, ".");
    std::string::basic_string[abi:ne180100]<0>(v22, "/");
    std::string::basic_string[abi:ne180100]<0>(v23, "0");
    std::string::basic_string[abi:ne180100]<0>(v24, "1");
    std::string::basic_string[abi:ne180100]<0>(v25, "2");
    std::string::basic_string[abi:ne180100]<0>(v26, "3");
    std::string::basic_string[abi:ne180100]<0>(v27, "4");
    std::string::basic_string[abi:ne180100]<0>(v28, "5");
    std::string::basic_string[abi:ne180100]<0>(v29, "6");
    std::string::basic_string[abi:ne180100]<0>(v30, "7");
    std::string::basic_string[abi:ne180100]<0>(v31, "8");
    std::string::basic_string[abi:ne180100]<0>(v32, "9");
    std::string::basic_string[abi:ne180100]<0>(v33, "=");
    std::string::basic_string[abi:ne180100]<0>(v34, "?");
    std::string::basic_string[abi:ne180100]<0>(v35, "A");
    std::string::basic_string[abi:ne180100]<0>(v36, "B");
    std::string::basic_string[abi:ne180100]<0>(v37, "C");
    std::string::basic_string[abi:ne180100]<0>(v38, "D");
    std::string::basic_string[abi:ne180100]<0>(v39, "E");
    std::string::basic_string[abi:ne180100]<0>(v40, "F");
    std::string::basic_string[abi:ne180100]<0>(v41, "G");
    std::string::basic_string[abi:ne180100]<0>(v42, "H");
    std::string::basic_string[abi:ne180100]<0>(v43, "I");
    std::string::basic_string[abi:ne180100]<0>(v44, "J");
    std::string::basic_string[abi:ne180100]<0>(v45, "K");
    std::string::basic_string[abi:ne180100]<0>(v46, "L");
    std::string::basic_string[abi:ne180100]<0>(v47, "M");
    std::string::basic_string[abi:ne180100]<0>(v48, "N");
    std::string::basic_string[abi:ne180100]<0>(v49, "O");
    std::string::basic_string[abi:ne180100]<0>(v50, "P");
    std::string::basic_string[abi:ne180100]<0>(v51, "Q");
    std::string::basic_string[abi:ne180100]<0>(v52, "R");
    std::string::basic_string[abi:ne180100]<0>(v53, "S");
    std::string::basic_string[abi:ne180100]<0>(v54, "T");
    std::string::basic_string[abi:ne180100]<0>(v55, "U");
    std::string::basic_string[abi:ne180100]<0>(v56, "V");
    std::string::basic_string[abi:ne180100]<0>(v57, "W");
    std::string::basic_string[abi:ne180100]<0>(v58, "X");
    std::string::basic_string[abi:ne180100]<0>(v59, "Y");
    std::string::basic_string[abi:ne180100]<0>(v60, "Z");
    std::string::basic_string[abi:ne180100]<0>(v61, "_");
    std::string::basic_string[abi:ne180100]<0>(v62, "a");
    std::string::basic_string[abi:ne180100]<0>(v63, "b");
    std::string::basic_string[abi:ne180100]<0>(v64, "c");
    std::string::basic_string[abi:ne180100]<0>(v65, "d");
    std::string::basic_string[abi:ne180100]<0>(v66, "e");
    std::string::basic_string[abi:ne180100]<0>(v67, "f");
    std::string::basic_string[abi:ne180100]<0>(v68, "g");
    std::string::basic_string[abi:ne180100]<0>(v69, "h");
    std::string::basic_string[abi:ne180100]<0>(v70, "i");
    std::string::basic_string[abi:ne180100]<0>(v71, "j");
    std::string::basic_string[abi:ne180100]<0>(v72, "k");
    std::string::basic_string[abi:ne180100]<0>(v73, "l");
    std::string::basic_string[abi:ne180100]<0>(v74, "m");
    std::string::basic_string[abi:ne180100]<0>(v75, "n");
    std::string::basic_string[abi:ne180100]<0>(v76, "o");
    std::string::basic_string[abi:ne180100]<0>(v77, "p");
    std::string::basic_string[abi:ne180100]<0>(v78, "q");
    std::string::basic_string[abi:ne180100]<0>(v79, "r");
    std::string::basic_string[abi:ne180100]<0>(v80, "s");
    std::string::basic_string[abi:ne180100]<0>(v81, "t");
    std::string::basic_string[abi:ne180100]<0>(v82, "u");
    std::string::basic_string[abi:ne180100]<0>(v83, "v");
    std::string::basic_string[abi:ne180100]<0>(v84, "w");
    std::string::basic_string[abi:ne180100]<0>(v85, "x");
    std::string::basic_string[abi:ne180100]<0>(v86, "y");
    std::string::basic_string[abi:ne180100]<0>(v87, "z");
    std::string::basic_string[abi:ne180100]<0>(v88, "|");
    long long v14 = 0;
    long long v15 = 0;
    unint64_t v16 = 0;
    *(void *)&long long v17 = &v14;
    BYTE8(v17) = 0;
    long long v14 = (std::string *)operator new(0x6A8uLL);
    long long v15 = v14;
    unint64_t v16 = v14 + 71;
    long long v15 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v16, &v18, &v89, v14);
    uint64_t v6 = 213;
    do
    {
      if (*((char *)&v19[v6 - 1] - 1) < 0) {
        operator delete(*(void **)((char *)&v17 + v6 * 8 + 8));
      }
      v6 -= 3;
    }
    while (v6 * 8);
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((long long **)&v14, &v18);
    LODWORD(v17) = 2;
    std::make_unique[abi:ne180100]<UC::UCMultiContextHuffmanSymbolFrequencyReader,int,std::shared_ptr<std::vector<std::string>> &,std::string const&>((int *)&v17, (uint64_t *)&v18, (uint64_t)this + 48, &__p);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::readData((std::string *)__p);
    UC::UCMultiContextHuffmanSymbolFrequencyReader::getContextSymbolFrequency((uint64_t)__p, &v12);
    int v11 = 2;
    std::allocate_shared[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::allocator<UC::UCMultiContextHuffmanCoder>,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,void>(&v12, &v11, &v17);
    long long v7 = v17;
    long long v17 = 0uLL;
    unint64_t v8 = (std::__shared_weak_count *)*((void *)this + 18);
    *(_OWORD *)((char *)this + 136) = v7;
    if (v8)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      if (*((void *)&v17 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v17 + 1));
      }
    }
    if (*((void *)&v12 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v12 + 1));
    }
    uint64_t v9 = *((void *)this + 18);
    *a2 = *((void *)this + 17);
    a2[1] = v9;
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    int v10 = (char *)__p;
    std::string __p = 0;
    if (v10) {
      std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((int)&__p, v10);
    }
    if (*((void *)&v18 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v18 + 1));
    }
    *(void *)&long long v18 = &v14;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v18);
  }
}

void sub_22E882B74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, char *__p, char a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char *a21,std::__shared_weak_count *a22)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  uint64_t v23 = __p;
  std::string __p = 0;
  if (v23) {
    std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100]((int)&__p, v23);
  }
  if (a22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a22);
  }
  a21 = &a14;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a21);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getKnownWordFixedLengthCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, void *a2@<X8>)
{
  *((void *)&v171 + 1) = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 19);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 20);
    *a2 = v4;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v15, "about");
    std::string::basic_string[abi:ne180100]<0>(v16, "access");
    std::string::basic_string[abi:ne180100]<0>(v17, "account");
    std::string::basic_string[abi:ne180100]<0>(v18, "add");
    std::string::basic_string[abi:ne180100]<0>(v19, "app");
    std::string::basic_string[abi:ne180100]<0>(v20, "archives");
    std::string::basic_string[abi:ne180100]<0>(v21, "article");
    std::string::basic_string[abi:ne180100]<0>(v22, "attraction");
    std::string::basic_string[abi:ne180100]<0>(v23, "author");
    std::string::basic_string[abi:ne180100]<0>(v24, "bag");
    std::string::basic_string[abi:ne180100]<0>(v25, "biz");
    std::string::basic_string[abi:ne180100]<0>(v26, "book");
    std::string::basic_string[abi:ne180100]<0>(v27, "brand");
    std::string::basic_string[abi:ne180100]<0>(v28, "brands");
    std::string::basic_string[abi:ne180100]<0>(v29, "browse");
    std::string::basic_string[abi:ne180100]<0>(v30, "buy");
    std::string::basic_string[abi:ne180100]<0>(v31, "cancel");
    std::string::basic_string[abi:ne180100]<0>(v32, "cart");
    std::string::basic_string[abi:ne180100]<0>(v33, "cat");
    std::string::basic_string[abi:ne180100]<0>(v34, "catalog");
    std::string::basic_string[abi:ne180100]<0>(v35, "category");
    std::string::basic_string[abi:ne180100]<0>(v36, "categories");
    std::string::basic_string[abi:ne180100]<0>(v37, "channel");
    std::string::basic_string[abi:ne180100]<0>(v38, "charts");
    std::string::basic_string[abi:ne180100]<0>(v39, "checkin");
    std::string::basic_string[abi:ne180100]<0>(v40, "checkout");
    std::string::basic_string[abi:ne180100]<0>(v41, "collection");
    std::string::basic_string[abi:ne180100]<0>(v42, "collections");
    std::string::basic_string[abi:ne180100]<0>(v43, "company");
    std::string::basic_string[abi:ne180100]<0>(v44, "compare");
    std::string::basic_string[abi:ne180100]<0>(v45, "connect");
    std::string::basic_string[abi:ne180100]<0>(v46, "contact");
    std::string::basic_string[abi:ne180100]<0>(v47, "content");
    std::string::basic_string[abi:ne180100]<0>(v48, "contents");
    std::string::basic_string[abi:ne180100]<0>(v49, "cost");
    std::string::basic_string[abi:ne180100]<0>(v50, "coupons");
    std::string::basic_string[abi:ne180100]<0>(v51, "create");
    std::string::basic_string[abi:ne180100]<0>(v52, "data");
    std::string::basic_string[abi:ne180100]<0>(v53, "demo");
    std::string::basic_string[abi:ne180100]<0>(v54, "destinations");
    std::string::basic_string[abi:ne180100]<0>(v55, "detail");
    std::string::basic_string[abi:ne180100]<0>(v56, "discover");
    std::string::basic_string[abi:ne180100]<0>(v57, "download");
    std::string::basic_string[abi:ne180100]<0>(v58, "entry");
    std::string::basic_string[abi:ne180100]<0>(v59, "event");
    std::string::basic_string[abi:ne180100]<0>(v60, "events");
    std::string::basic_string[abi:ne180100]<0>(v61, "explore");
    std::string::basic_string[abi:ne180100]<0>(v62, "faq");
    std::string::basic_string[abi:ne180100]<0>(v63, "fetch");
    std::string::basic_string[abi:ne180100]<0>(v64, "finance");
    std::string::basic_string[abi:ne180100]<0>(v65, "find");
    std::string::basic_string[abi:ne180100]<0>(v66, "food");
    std::string::basic_string[abi:ne180100]<0>(v67, "fund");
    std::string::basic_string[abi:ne180100]<0>(v68, "game");
    std::string::basic_string[abi:ne180100]<0>(v69, "gift");
    std::string::basic_string[abi:ne180100]<0>(v70, "goods");
    std::string::basic_string[abi:ne180100]<0>(v71, "guide");
    std::string::basic_string[abi:ne180100]<0>(v72, "health");
    std::string::basic_string[abi:ne180100]<0>(v73, "help");
    std::string::basic_string[abi:ne180100]<0>(v74, "home");
    std::string::basic_string[abi:ne180100]<0>(v75, "hotel");
    std::string::basic_string[abi:ne180100]<0>(v76, "hotels");
    std::string::basic_string[abi:ne180100]<0>(v77, "id");
    std::string::basic_string[abi:ne180100]<0>(v78, "index");
    std::string::basic_string[abi:ne180100]<0>(v79, "info");
    std::string::basic_string[abi:ne180100]<0>(v80, "item");
    std::string::basic_string[abi:ne180100]<0>(v81, "item_id");
    std::string::basic_string[abi:ne180100]<0>(v82, "join");
    std::string::basic_string[abi:ne180100]<0>(v83, "lifestyle");
    std::string::basic_string[abi:ne180100]<0>(v84, "list");
    std::string::basic_string[abi:ne180100]<0>(v85, "listen");
    std::string::basic_string[abi:ne180100]<0>(v86, "live");
    std::string::basic_string[abi:ne180100]<0>(v87, "local");
    std::string::basic_string[abi:ne180100]<0>(v88, "location");
    std::string::basic_string[abi:ne180100]<0>(v89, "locations");
    std::string::basic_string[abi:ne180100]<0>(v90, "locator");
    std::string::basic_string[abi:ne180100]<0>(v91, "login");
    std::string::basic_string[abi:ne180100]<0>(v92, "manage");
    std::string::basic_string[abi:ne180100]<0>(v93, "menu");
    std::string::basic_string[abi:ne180100]<0>(v94, "more");
    std::string::basic_string[abi:ne180100]<0>(v95, "music");
    std::string::basic_string[abi:ne180100]<0>(v96, "name");
    std::string::basic_string[abi:ne180100]<0>(v97, "news");
    std::string::basic_string[abi:ne180100]<0>(v98, "note");
    std::string::basic_string[abi:ne180100]<0>(v99, "open");
    std::string::basic_string[abi:ne180100]<0>(v100, "order");
    std::string::basic_string[abi:ne180100]<0>(v101, "overview");
    std::string::basic_string[abi:ne180100]<0>(v102, "park");
    std::string::basic_string[abi:ne180100]<0>(v103, "part");
    std::string::basic_string[abi:ne180100]<0>(v104, "pay");
    std::string::basic_string[abi:ne180100]<0>(v105, "payment");
    std::string::basic_string[abi:ne180100]<0>(v106, "payments");
    std::string::basic_string[abi:ne180100]<0>(v107, "play");
    std::string::basic_string[abi:ne180100]<0>(v108, "post");
    std::string::basic_string[abi:ne180100]<0>(v109, "posts");
    std::string::basic_string[abi:ne180100]<0>(v110, "preview");
    std::string::basic_string[abi:ne180100]<0>(v111, "product");
    std::string::basic_string[abi:ne180100]<0>(v112, "product_id");
    std::string::basic_string[abi:ne180100]<0>(v113, "products");
    std::string::basic_string[abi:ne180100]<0>(v114, "profile");
    std::string::basic_string[abi:ne180100]<0>(v115, "promotion");
    std::string::basic_string[abi:ne180100]<0>(v116, "purchase");
    std::string::basic_string[abi:ne180100]<0>(v117, "rate");
    std::string::basic_string[abi:ne180100]<0>(v118, "recipe");
    std::string::basic_string[abi:ne180100]<0>(v119, "recipes");
    std::string::basic_string[abi:ne180100]<0>(v120, "reservation");
    std::string::basic_string[abi:ne180100]<0>(v121, "reservations");
    std::string::basic_string[abi:ne180100]<0>(v122, "reserve");
    std::string::basic_string[abi:ne180100]<0>(v123, "retail");
    std::string::basic_string[abi:ne180100]<0>(v124, "review");
    std::string::basic_string[abi:ne180100]<0>(v125, "rewards");
    std::string::basic_string[abi:ne180100]<0>(v126, "sale");
    std::string::basic_string[abi:ne180100]<0>(v127, "scan");
    std::string::basic_string[abi:ne180100]<0>(v128, "schedule");
    std::string::basic_string[abi:ne180100]<0>(v129, "search");
    std::string::basic_string[abi:ne180100]<0>(v130, "sell");
    std::string::basic_string[abi:ne180100]<0>(v131, "send");
    std::string::basic_string[abi:ne180100]<0>(v132, "service");
    std::string::basic_string[abi:ne180100]<0>(v133, "share");
    std::string::basic_string[abi:ne180100]<0>(v134, "shop");
    std::string::basic_string[abi:ne180100]<0>(v135, "show");
    std::string::basic_string[abi:ne180100]<0>(v136, "showtime");
    std::string::basic_string[abi:ne180100]<0>(v137, "site");
    std::string::basic_string[abi:ne180100]<0>(v138, "song");
    std::string::basic_string[abi:ne180100]<0>(v139, "special");
    std::string::basic_string[abi:ne180100]<0>(v140, "stations");
    std::string::basic_string[abi:ne180100]<0>(v141, "status");
    std::string::basic_string[abi:ne180100]<0>(v142, "store");
    std::string::basic_string[abi:ne180100]<0>(v143, "store-locator");
    std::string::basic_string[abi:ne180100]<0>(v144, "stores");
    std::string::basic_string[abi:ne180100]<0>(v145, "stories");
    std::string::basic_string[abi:ne180100]<0>(v146, "story");
    std::string::basic_string[abi:ne180100]<0>(v147, "tag");
    std::string::basic_string[abi:ne180100]<0>(v148, "tags");
    std::string::basic_string[abi:ne180100]<0>(v149, "terms");
    std::string::basic_string[abi:ne180100]<0>(v150, "tickets");
    std::string::basic_string[abi:ne180100]<0>(v151, "tips");
    std::string::basic_string[abi:ne180100]<0>(v152, "title");
    std::string::basic_string[abi:ne180100]<0>(v153, "today");
    std::string::basic_string[abi:ne180100]<0>(v154, "top");
    std::string::basic_string[abi:ne180100]<0>(v155, "topic");
    std::string::basic_string[abi:ne180100]<0>(v156, "tours");
    std::string::basic_string[abi:ne180100]<0>(v157, "track");
    std::string::basic_string[abi:ne180100]<0>(v158, "transaction");
    std::string::basic_string[abi:ne180100]<0>(v159, "travel");
    std::string::basic_string[abi:ne180100]<0>(v160, "try");
    std::string::basic_string[abi:ne180100]<0>(v161, "update");
    std::string::basic_string[abi:ne180100]<0>(v162, "upload");
    std::string::basic_string[abi:ne180100]<0>(v163, "use");
    std::string::basic_string[abi:ne180100]<0>(v164, "user");
    std::string::basic_string[abi:ne180100]<0>(v165, "vehicles");
    std::string::basic_string[abi:ne180100]<0>(v166, "video");
    std::string::basic_string[abi:ne180100]<0>(v167, "view");
    std::string::basic_string[abi:ne180100]<0>(v168, "visit");
    std::string::basic_string[abi:ne180100]<0>(v169, "watch");
    std::string::basic_string[abi:ne180100]<0>(v170, "wiki");
    int v11 = 0;
    long long v12 = 0;
    unint64_t v13 = 0;
    *(void *)&long long v14 = &v11;
    BYTE8(v14) = 0;
    int v11 = (std::string *)operator new(0xEA0uLL);
    long long v12 = v11;
    unint64_t v13 = (long long *)&v11[156];
    long long v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v13, &v15, &v171, v11);
    uint64_t v6 = 468;
    do
    {
      if (*((char *)&v16[v6 - 1] - 1) < 0) {
        operator delete(*(void **)((char *)&v14 + v6 * 8));
      }
      v6 -= 3;
    }
    while (v6 * 8);
    int v10 = 8;
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((long long **)&v11, &v14);
    std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>((char *)&v10, &v14, &v15);
    long long v7 = v15;
    long long v15 = 0uLL;
    unint64_t v8 = (std::__shared_weak_count *)*((void *)this + 20);
    *(_OWORD *)((char *)this + 152) = v7;
    if (v8)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      if (*((void *)&v15 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
      }
    }
    if (*((void *)&v14 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
    }
    uint64_t v9 = *((void *)this + 20);
    *a2 = *((void *)this + 19);
    a2[1] = v9;
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    *(void *)&long long v15 = &v11;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  }
}

void sub_22E883B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, void **a17)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  a17 = (void **)&a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a17);
  _Unwind_Resume(a1);
}

void UC::SUE::UCSegmentedURLCoderProvider::getSegmentedPathAndQuery6BitAlphabetCoder(UC::SUE::UCSegmentedURLCoderProvider *this@<X0>, void *a2@<X8>)
{
  *((void *)&v79 + 1) = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 21);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 22);
    *a2 = v4;
    a2[1] = v5;
    if (v5) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(&v15, ".");
    std::string::basic_string[abi:ne180100]<0>(v16, "0");
    std::string::basic_string[abi:ne180100]<0>(v17, "1");
    std::string::basic_string[abi:ne180100]<0>(v18, "2");
    std::string::basic_string[abi:ne180100]<0>(v19, "3");
    std::string::basic_string[abi:ne180100]<0>(v20, "4");
    std::string::basic_string[abi:ne180100]<0>(v21, "5");
    std::string::basic_string[abi:ne180100]<0>(v22, "6");
    std::string::basic_string[abi:ne180100]<0>(v23, "7");
    std::string::basic_string[abi:ne180100]<0>(v24, "8");
    std::string::basic_string[abi:ne180100]<0>(v25, "9");
    std::string::basic_string[abi:ne180100]<0>(v26, "A");
    std::string::basic_string[abi:ne180100]<0>(v27, "B");
    std::string::basic_string[abi:ne180100]<0>(v28, "C");
    std::string::basic_string[abi:ne180100]<0>(v29, "D");
    std::string::basic_string[abi:ne180100]<0>(v30, "E");
    std::string::basic_string[abi:ne180100]<0>(v31, "F");
    std::string::basic_string[abi:ne180100]<0>(v32, "G");
    std::string::basic_string[abi:ne180100]<0>(v33, "H");
    std::string::basic_string[abi:ne180100]<0>(v34, "I");
    std::string::basic_string[abi:ne180100]<0>(v35, "J");
    std::string::basic_string[abi:ne180100]<0>(v36, "K");
    std::string::basic_string[abi:ne180100]<0>(v37, "L");
    std::string::basic_string[abi:ne180100]<0>(v38, "M");
    std::string::basic_string[abi:ne180100]<0>(v39, "N");
    std::string::basic_string[abi:ne180100]<0>(v40, "O");
    std::string::basic_string[abi:ne180100]<0>(v41, "P");
    std::string::basic_string[abi:ne180100]<0>(v42, "Q");
    std::string::basic_string[abi:ne180100]<0>(v43, "R");
    std::string::basic_string[abi:ne180100]<0>(v44, "S");
    std::string::basic_string[abi:ne180100]<0>(v45, "T");
    std::string::basic_string[abi:ne180100]<0>(v46, "U");
    std::string::basic_string[abi:ne180100]<0>(v47, "V");
    std::string::basic_string[abi:ne180100]<0>(v48, "W");
    std::string::basic_string[abi:ne180100]<0>(v49, "X");
    std::string::basic_string[abi:ne180100]<0>(v50, "Y");
    std::string::basic_string[abi:ne180100]<0>(v51, "Z");
    std::string::basic_string[abi:ne180100]<0>(v52, "a");
    std::string::basic_string[abi:ne180100]<0>(v53, "b");
    std::string::basic_string[abi:ne180100]<0>(v54, "c");
    std::string::basic_string[abi:ne180100]<0>(v55, "d");
    std::string::basic_string[abi:ne180100]<0>(v56, "e");
    std::string::basic_string[abi:ne180100]<0>(v57, "f");
    std::string::basic_string[abi:ne180100]<0>(v58, "g");
    std::string::basic_string[abi:ne180100]<0>(v59, "h");
    std::string::basic_string[abi:ne180100]<0>(v60, "i");
    std::string::basic_string[abi:ne180100]<0>(v61, "j");
    std::string::basic_string[abi:ne180100]<0>(v62, "k");
    std::string::basic_string[abi:ne180100]<0>(v63, "l");
    std::string::basic_string[abi:ne180100]<0>(v64, "m");
    std::string::basic_string[abi:ne180100]<0>(v65, "n");
    std::string::basic_string[abi:ne180100]<0>(v66, "o");
    std::string::basic_string[abi:ne180100]<0>(v67, "p");
    std::string::basic_string[abi:ne180100]<0>(v68, "q");
    std::string::basic_string[abi:ne180100]<0>(v69, "r");
    std::string::basic_string[abi:ne180100]<0>(v70, "s");
    std::string::basic_string[abi:ne180100]<0>(v71, "t");
    std::string::basic_string[abi:ne180100]<0>(v72, "u");
    std::string::basic_string[abi:ne180100]<0>(v73, "v");
    std::string::basic_string[abi:ne180100]<0>(v74, "w");
    std::string::basic_string[abi:ne180100]<0>(v75, "x");
    std::string::basic_string[abi:ne180100]<0>(v76, "y");
    std::string::basic_string[abi:ne180100]<0>(v77, "z");
    std::string::basic_string[abi:ne180100]<0>(v78, "|");
    int v11 = 0;
    long long v12 = 0;
    unint64_t v13 = 0;
    *(void *)&long long v14 = &v11;
    BYTE8(v14) = 0;
    int v11 = (std::string *)operator new(0x600uLL);
    long long v12 = v11;
    unint64_t v13 = (long long *)&v11[64];
    long long v12 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v13, &v15, &v79, v11);
    uint64_t v6 = 192;
    do
    {
      if (*((char *)&v16[v6 - 1] - 1) < 0) {
        operator delete(*(void **)((char *)&v14 + v6 * 8));
      }
      v6 -= 3;
    }
    while (v6 * 8);
    int v10 = 6;
    std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>((long long **)&v11, &v14);
    std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>((char *)&v10, &v14, &v15);
    long long v7 = v15;
    long long v15 = 0uLL;
    unint64_t v8 = (std::__shared_weak_count *)*((void *)this + 22);
    *(_OWORD *)((char *)this + 168) = v7;
    if (v8)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](v8);
      if (*((void *)&v15 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v15 + 1));
      }
    }
    if (*((void *)&v14 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v14 + 1));
    }
    uint64_t v9 = *((void *)this + 22);
    *a2 = *((void *)this + 21);
    a2[1] = v9;
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    *(void *)&long long v15 = &v11;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v15);
  }
}

void sub_22E8842B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, std::__shared_weak_count *a15, uint64_t a16, void **a17)
{
  if (a15) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a15);
  }
  a17 = (void **)&a11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a17);
  _Unwind_Resume(a1);
}

uint64_t std::unordered_map<std::string,unsigned short>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    uint64_t v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,unsigned short> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_22E8843B4(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,unsigned short> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  long long v7 = (void *)(a1 + 24);
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v9 = v8;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    unint64_t v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v3 = v8;
      if (v8 >= v10) {
        unint64_t v3 = v8 % v10;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v8;
    }
    unint64_t v13 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v3);
    if (v13)
    {
      for (uint64_t i = *v13; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v15 = *((void *)i + 1);
        if (v15 == v9)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10) {
              v15 %= v10;
            }
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node_hash<std::pair<std::string const,unsigned short> const&>(a1, v9, a3, (uint64_t)v25);
  float v16 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    BOOL v18 = 1;
    if (v10 >= 3) {
      BOOL v18 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v19 = v18 | (2 * v10);
    unint64_t v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20) {
      size_t v21 = v20;
    }
    else {
      size_t v21 = v19;
    }
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v21);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        unint64_t v3 = v9 % v10;
      }
      else {
        unint64_t v3 = v9;
      }
    }
    else
    {
      unint64_t v3 = (v10 - 1) & v9;
    }
  }
  __int16 v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)v25[0] = *v22;
    *__int16 v22 = v25[0];
  }
  else
  {
    *(void *)v25[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v25[0];
    *(void *)(*(void *)a1 + 8 * v3) = a1 + 16;
    if (*(void *)v25[0])
    {
      unint64_t v23 = *(void *)(*(void *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10) {
          v23 %= v10;
        }
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v23) = v25[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_22E884624(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__construct_node_hash<std::pair<std::string const,unsigned short> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  unint64_t v8 = (char *)operator new(0x30uLL);
  *(void *)(a4 + 8) = v7;
  *(void *)a4 = v8;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)unint64_t v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v8 + 4) = *(void *)(a3 + 16);
  }
  *((_WORD *)v8 + 20) = *(_WORD *)(a3 + 24);
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_22E8846D8(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

char *std::vector<std::string>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

void *std::allocate_shared[abi:ne180100]<std::unordered_map<std::string,unsigned short>,std::allocator<std::unordered_map<std::string,unsigned short>>,std::unordered_map<std::string,unsigned short>&,void>@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x40uLL);
  uint64_t result = std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::__shared_ptr_emplace[abi:ne180100]<std::unordered_map<std::string,unsigned short>&,std::allocator<std::unordered_map<std::string,unsigned short>>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_22E884878(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::__shared_ptr_emplace[abi:ne180100]<std::unordered_map<std::string,unsigned short>&,std::allocator<std::unordered_map<std::string,unsigned short>>,0>(void *a1, uint64_t a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E242C58;
  std::unordered_map<std::string,unsigned short>::unordered_map((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_22E8848D4(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242C58;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242C58;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<std::unordered_map<std::string,unsigned short>>::__on_zero_shared(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(a1 + 24);
}

uint64_t std::unordered_map<std::string,unsigned short>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (uint64_t i = *(unsigned __int8 **)(a2 + 16); i; uint64_t i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,unsigned short> const&>(a1, i + 16, (uint64_t)(i + 16));
  return a1;
}

void sub_22E8849B8(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string>&,void>@<X0>(long long **a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = (char *)operator new(0x30uLL);
  uint64_t result = std::__shared_ptr_emplace<std::vector<std::string>>::__shared_ptr_emplace[abi:ne180100]<std::vector<std::string>&,std::allocator<std::vector<std::string>>,0>((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_22E884A18(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<std::vector<std::string>>::__shared_ptr_emplace[abi:ne180100]<std::vector<std::string>&,std::allocator<std::vector<std::string>>,0>(uint64_t a1, long long **a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_26E242C90;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 24) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 24), *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  return a1;
}

void sub_22E884A9C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<std::vector<std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242C90;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::vector<std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242C90;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<std::vector<std::string>>::__on_zero_shared(uint64_t a1)
{
  uint64_t v1 = (void **)(a1 + 24);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v1);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_22E884BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  uint64_t v4 = this;
  uint8x8_t v11 = this;
  unint64_t v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        uint64_t v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      uint64_t v6 = (long long *)((char *)v6 + 24);
      unint64_t v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_22E884C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *std::allocate_shared[abi:ne180100]<UC::UCSymbolFrequencyTable,std::allocator<UC::UCSymbolFrequencyTable>,std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>,void>@<X0>(uint64_t *a1@<X1>, long long *a2@<X2>, void *a3@<X8>)
{
  uint64_t v6 = operator new(0x40uLL);
  uint64_t result = std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCSymbolFrequencyTable>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_22E884CDC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCSymbolFrequencyTable>,0>(void *a1, uint64_t *a2, long long *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E242CC8;
  std::allocator<UC::UCSymbolFrequencyTable>::construct[abi:ne180100]<UC::UCSymbolFrequencyTable,std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>>((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_22E884D50(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242CC8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242CC8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__on_zero_shared(uint64_t a1)
{
  std::allocator<UC::UCSymbolFrequencyTable>::destroy[abi:ne180100]((uint64_t)&v1, a1 + 24);
}

void std::allocator<UC::UCSymbolFrequencyTable>::construct[abi:ne180100]<UC::UCSymbolFrequencyTable,std::shared_ptr<std::unordered_map<std::string,unsigned short>> &,std::shared_ptr<std::vector<std::string>>>(uint64_t a1, void *a2, uint64_t *a3, long long *a4)
{
  uint64_t v4 = (std::__shared_weak_count *)a3[1];
  uint64_t v6 = *a3;
  long long v7 = v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  long long v5 = *a4;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  UC::UCSymbolFrequencyTable::UCSymbolFrequencyTable(a2, &v6, &v5);
  if (*((void *)&v5 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v5 + 1));
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
}

void sub_22E884E64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

void std::allocator<UC::UCSymbolFrequencyTable>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(std::__shared_weak_count **)(a2 + 24);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(a2 + 8);
  if (v4)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
}

void *std::allocate_shared[abi:ne180100]<UC::UCHuffmanCoder,std::allocator<UC::UCHuffmanCoder>,std::shared_ptr<UC::UCSymbolFrequencyTable> &,void>@<X0>(uint64_t *a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x30uLL);
  uint64_t result = std::__shared_ptr_emplace<UC::UCHuffmanCoder>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<UC::UCSymbolFrequencyTable> &,std::allocator<UC::UCHuffmanCoder>,0>(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_22E884F20(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<UC::UCHuffmanCoder>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<UC::UCSymbolFrequencyTable> &,std::allocator<UC::UCHuffmanCoder>,0>(void *a1, uint64_t *a2)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E242D00;
  std::allocator<UC::UCHuffmanCoder>::construct[abi:ne180100]<UC::UCHuffmanCoder,std::shared_ptr<UC::UCSymbolFrequencyTable> &>((uint64_t)&v4, (uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_22E884F90(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCHuffmanCoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242D00;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCHuffmanCoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242D00;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<UC::UCHuffmanCoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::allocator<UC::UCHuffmanCoder>::construct[abi:ne180100]<UC::UCHuffmanCoder,std::shared_ptr<UC::UCSymbolFrequencyTable> &>(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = (std::__shared_weak_count *)a3[1];
  uint64_t v4 = *a3;
  long long v5 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  UC::UCHuffmanCoder::UCHuffmanCoder(a2, &v4);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

void sub_22E885084(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void *std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>@<X0>(char *a1@<X1>, long long *a2@<X2>, void *a3@<X8>)
{
  uint64_t v6 = operator new(0x40uLL);
  uint64_t result = std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::__shared_ptr_emplace[abi:ne180100]<int,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCFixedLengthCoder>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_22E8850EC(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::__shared_ptr_emplace[abi:ne180100]<int,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCFixedLengthCoder>,0>(void *a1, char *a2, long long *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E242D38;
  std::allocator<UC::UCFixedLengthCoder>::construct[abi:ne180100]<UC::UCFixedLengthCoder,int,std::shared_ptr<std::vector<std::string>>>((uint64_t)&v5, (uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_22E885160(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242D38;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242D38;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<UC::UCFixedLengthCoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::allocator<UC::UCFixedLengthCoder>::construct[abi:ne180100]<UC::UCFixedLengthCoder,int,std::shared_ptr<std::vector<std::string>>>(uint64_t a1, uint64_t a2, char *a3, long long *a4)
{
  char v5 = *a3;
  long long v6 = *a4;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  UC::UCFixedLengthCoder::UCFixedLengthCoder(a2, v5, &v6);
  if (*((void *)&v6 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
  }
}

void sub_22E88524C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

void std::default_delete<UC::UCMultiContextHuffmanSymbolFrequencyReader>::operator()[abi:ne180100](int a1, char *__p)
{
  if (__p)
  {
    uint64_t v3 = (std::__shared_weak_count *)*((void *)__p + 7);
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    if (__p[47] < 0) {
      operator delete(*((void **)__p + 3));
    }
    uint64_t v4 = (std::__shared_weak_count *)*((void *)__p + 2);
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    operator delete(__p);
  }
}

void *std::allocate_shared[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::allocator<UC::UCMultiContextHuffmanCoder>,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,void>@<X0>(long long *a1@<X1>, int *a2@<X2>, void *a3@<X8>)
{
  long long v6 = operator new(0x68uLL);
  uint64_t result = std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,std::allocator<UC::UCMultiContextHuffmanCoder>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_22E885318(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int,std::allocator<UC::UCMultiContextHuffmanCoder>,0>(void *a1, long long *a2, int *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E242D70;
  std::allocator<UC::UCMultiContextHuffmanCoder>::construct[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int>((uint64_t)&v5, (uint64_t)(a1 + 3), a2, a3);
  return a1;
}

void sub_22E88538C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242D70;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242D70;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<UC::UCMultiContextHuffmanCoder>::__on_zero_shared(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 24))();
}

void std::allocator<UC::UCMultiContextHuffmanCoder>::construct[abi:ne180100]<UC::UCMultiContextHuffmanCoder,std::shared_ptr<UC::UCMultiContextSymbolFrequencyTrie>,int>(uint64_t a1, uint64_t a2, long long *a3, int *a4)
{
  long long v4 = *a3;
  *(void *)a3 = 0;
  *((void *)a3 + 1) = 0;
  UC::UCMultiContextHuffmanCoder::UCMultiContextHuffmanCoder(a2, &v4, *a4);
  if (*((void *)&v4 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v4 + 1));
  }
}

void sub_22E885478(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t **UC::UCMultiContextSymbolFrequencyTrie::UCMultiContextSymbolFrequencyTrie(uint64_t **a1, uint64_t **a2, uint64_t **a3, uint64_t *a4)
{
  *a1 = *a2;
  char v5 = a2[1];
  a1[1] = v5;
  if (v5) {
    atomic_fetch_add_explicit(v5 + 1, 1uLL, memory_order_relaxed);
  }
  unsigned int v6 = (*((_DWORD *)*a2 + 2) - *(_DWORD *)*a2) >> 3;
  long long v7 = *a3;
  *a3 = 0;
  a1[4] = 0;
  unint64_t v8 = (uint64_t *)(a1 + 4);
  *((unsigned char *)a1 + 16) = -85 * v6;
  a1[3] = v7;
  a1[6] = 0;
  a1[7] = 0;
  a1[5] = a4;
  uint64_t v9 = operator new(0x28uLL);
  *uint64_t v9 = 0u;
  v9[1] = 0u;
  *((_DWORD *)v9 + 8) = 1065353216;
  std::unique_ptr<std::unordered_map<std::string,unsigned char>>::reset[abi:ne180100]((uint64_t *)a1 + 4, (uint64_t)v9);
  uint64_t v10 = (*a1)[1];
  if (-85 * ((v10 - **a1) >> 3))
  {
    unint64_t v11 = 0;
    unint64_t v12 = (-85 * ((v10 - **a1) >> 3));
    do
    {
      uint64_t v13 = **a1;
      if (0xAAAAAAAAAAAAAAABLL * (((*a1)[1] - v13) >> 3) <= v11) {
        std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
      }
      uint64_t v14 = *v8;
      *(void *)&long long v20 = v13 + 24 * v11;
      std::__hash_table<std::__hash_value_type<std::string,unsigned char>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned char>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned char>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned char>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v14, (unsigned __int8 *)v20, (uint64_t)&std::piecewise_construct, (long long **)&v20)[40] = v11++;
    }
    while (v11 < v12);
  }
  uint64_t v19 = 0;
  int v18 = 0;
  std::allocate_shared[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie::Node,std::allocator<UC::UCMultiContextSymbolFrequencyTrie::Node>,UC::UCMultiContextSymbolFrequencyTrie&,int,int,int,void>((const UC::UCMultiContextSymbolFrequencyTrie *)a1, (char *)&v19 + 4, (char *)&v19, &v18, &v20);
  long long v15 = v20;
  long long v20 = 0uLL;
  float v16 = (std::__shared_weak_count *)a1[7];
  *((_OWORD *)a1 + 3) = v15;
  if (v16)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
    if (*((void *)&v20 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v20 + 1));
    }
  }
  return a1;
}

void sub_22E885628(_Unwind_Exception *a1)
{
  long long v4 = (std::__shared_weak_count *)v1[7];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  std::unique_ptr<std::unordered_map<std::string,unsigned char>>::reset[abi:ne180100](v2, 0);
  char v5 = (void *)v1[3];
  v1[3] = 0;
  if (v5) {
    operator delete[](v5);
  }
  unsigned int v6 = (std::__shared_weak_count *)v1[1];
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  _Unwind_Resume(a1);
}

void *UC::UCMultiContextSymbolFrequencyTrie::getOrderedSymbols@<X0>(void *this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = this[1];
  *a2 = *this;
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

UC::UCMultiContextSymbolFrequencyTrie::Node *UC::UCMultiContextSymbolFrequencyTrie::Node::childNodeForSymbol(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*(void *)(*(void *)a1 + 40) == a1[8]) {
    return 0;
  }
  long long v4 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(*(void **)(*(void *)a1 + 32), a2);
  if (!v4) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  char v21 = v4[40];
  char v5 = std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::find<unsigned char>(*((void **)a1 + 2), (unsigned __int8 *)&v21);
  if (v5) {
    return (UC::UCMultiContextSymbolFrequencyTrie::Node *)v5[3];
  }
  unsigned int v6 = a1[8];
  long long v7 = *(unsigned __int8 **)a1;
  if (a1[8])
  {
    int v8 = *((_DWORD *)a1 + 3);
    unsigned int v9 = v7[16];
    int v10 = a1[9];
    unsigned int v11 = v7[40];
    if (v6 >= v11)
    {
      int v12 = 0;
    }
    else
    {
      int v12 = 0;
      int v13 = a1[8];
      do
        v12 += pow((double)v9, (double)v13++);
      while (v11 > v13);
    }
    int v14 = v8 + v9 - v10 + v12 * v10;
  }
  else
  {
    int v14 = 1;
  }
  char v15 = v21;
  int v16 = v14 + v21;
  char v17 = v6 + 1;
  uint64_t v2 = (UC::UCMultiContextSymbolFrequencyTrie::Node *)operator new(0x18uLL);
  UC::UCMultiContextSymbolFrequencyTrie::Node::Node(v2, (const UC::UCMultiContextSymbolFrequencyTrie *)v7, v17, v15, v16);
  uint64_t v18 = *((void *)a1 + 2);
  __int16 v22 = (unsigned __int8 *)&v21;
  uint64_t v19 = (void **)std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>(v18, (unsigned __int8 *)&v21, (uint64_t)&std::piecewise_construct, &v22);
  std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100](v19 + 3, v2);
  return v2;
}

void sub_22E88580C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100]((void **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t UC::UCMultiContextSymbolFrequencyTrie::getRootNode(UC::UCMultiContextSymbolFrequencyTrie *this)
{
  return *((void *)this + 6);
}

void UC::UCMultiContextSymbolFrequencyTrie::clearCaches(UC::UCMultiContextSymbolFrequencyTrie *this)
{
}

UC::UCMultiContextSymbolFrequencyTrie::Node *UC::UCMultiContextSymbolFrequencyTrie::Node::Node(UC::UCMultiContextSymbolFrequencyTrie::Node *this, const UC::UCMultiContextSymbolFrequencyTrie *a2, char a3, char a4, int a5)
{
  *(void *)this = a2;
  *((unsigned char *)this + 8) = a3;
  *((unsigned char *)this + 9) = a4;
  *((_DWORD *)this + 3) = a5;
  *((void *)this + 2) = 0;
  unsigned int v6 = (uint64_t *)((char *)this + 16);
  long long v7 = operator new(0x28uLL);
  _OWORD *v7 = 0u;
  v7[1] = 0u;
  *((_DWORD *)v7 + 8) = 1065353216;
  std::unique_ptr<std::unordered_map<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>::reset[abi:ne180100](v6, (uint64_t)v7);
  return this;
}

void sub_22E8858A8(_Unwind_Exception *a1)
{
  std::unique_ptr<std::unordered_map<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

uint64_t UC::UCMultiContextSymbolFrequencyTrie::Node::getFrequencyForSymbol(_DWORD *a1, unsigned __int8 *a2)
{
  uint64_t v2 = *(void *)a1;
  int v3 = a1[3];
  long long v4 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(*(void **)(*(void *)a1 + 32), a2);
  if (!v4) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  return _byteswap_ushort(*(_WORD *)(*(void *)(v2 + 24)
                                   + 2 * (v4[40] + v3 * *(unsigned __int8 *)(v2 + 16))));
}

void std::unique_ptr<std::unordered_map<std::string,unsigned char>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    long long v4 = (void *)std::__hash_table<std::__hash_value_type<std::string,unsigned short>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned short>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned short>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned short>>>::~__hash_table(v3);
    operator delete(v4);
  }
}

void std::vector<std::string>::__throw_out_of_range[abi:ne180100]()
{
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
}

void sub_22E8859C4(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned char>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned char>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned char>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned char>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  int v8 = (void *)(a1 + 24);
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
    int v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
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
  std::__hash_table<std::__hash_value_type<std::string,unsigned char>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned char>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned char>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned char>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
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
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v22);
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
  unint64_t v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *unint64_t v23 = v26[0];
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
  ++*v8;
  return i;
}

void sub_22E885C4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  }
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned char>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned char>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned char>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned char>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  int v8 = (char *)operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *(void *)int v8 = 0;
  *((void *)v8 + 1) = a2;
  unint64_t v9 = (std::string *)(v8 + 16);
  unint64_t v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((void *)v10 + 1));
  }
  else
  {
    long long v11 = *v10;
    *((void *)v8 + 4) = *((void *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[40] = 0;
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_22E885D00(_Unwind_Exception *a1)
{
  void *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,unsigned short>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void *std::allocate_shared[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie::Node,std::allocator<UC::UCMultiContextSymbolFrequencyTrie::Node>,UC::UCMultiContextSymbolFrequencyTrie&,int,int,int,void>@<X0>(const UC::UCMultiContextSymbolFrequencyTrie *a1@<X1>, char *a2@<X2>, char *a3@<X3>, int *a4@<X4>, void *a5@<X8>)
{
  unint64_t v10 = operator new(0x30uLL);
  uint64_t result = std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::__shared_ptr_emplace[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie&,int,int,int,std::allocator<UC::UCMultiContextSymbolFrequencyTrie::Node>,0>(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  return result;
}

void sub_22E885D84(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::__shared_ptr_emplace[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie&,int,int,int,std::allocator<UC::UCMultiContextSymbolFrequencyTrie::Node>,0>(void *a1, const UC::UCMultiContextSymbolFrequencyTrie *a2, char *a3, char *a4, int *a5)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E242DA8;
  UC::UCMultiContextSymbolFrequencyTrie::Node::Node((UC::UCMultiContextSymbolFrequencyTrie::Node *)(a1 + 3), a2, *a3, *a4, *a5);
  return a1;
}

void sub_22E885DEC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242DA8;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242DA8;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie::Node>::__on_zero_shared(uint64_t a1)
{
}

void std::unique_ptr<std::unordered_map<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    unint64_t v4 = (void *)std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::~__hash_table(v3);
    operator delete(v4);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__deallocate_node(uint64_t a1, void **a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void **)*v2;
      std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100](v2 + 3, 0);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

uint64_t **std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::find<unsigned char>(void *a1, unsigned __int8 *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (v2.i32[0] - 1) & v3;
  }
  unsigned int v6 = *(uint64_t ****)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t **)*result)
  {
    unint64_t v8 = (unint64_t)result[1];
    if (v8 == v3)
    {
      if (*((unsigned __int8 *)result + 16) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100](void **a1, void *a2)
{
  int8x8_t v2 = (char *)*a1;
  *a1 = a2;
  if (v2)
  {
    std::unique_ptr<std::unordered_map<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>::reset[abi:ne180100](v2 + 16, 0);
    operator delete(v2);
  }
}

void *std::__hash_table<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::__unordered_map_hasher<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::hash<unsigned char>,std::equal_to<unsigned char>,true>,std::__unordered_map_equal<unsigned char,std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,std::equal_to<unsigned char>,std::hash<unsigned char>,true>,std::allocator<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>>>::__emplace_unique_key_args<unsigned char,std::piecewise_construct_t const&,std::tuple<unsigned char const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned char **a4)
{
  unint64_t v7 = *a2;
  unint64_t v8 = *(void *)(a1 + 8);
  if (v8)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v4 = *a2;
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    unint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      long long v11 = *v10;
      if (*v10)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v12 == v7)
          {
            if (*((unsigned __int8 *)v11 + 16) == v7) {
              return v11;
            }
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8) {
                v12 %= v8;
              }
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4) {
              break;
            }
          }
          long long v11 = (void *)*v11;
        }
        while (v11);
      }
    }
  }
  unint64_t v13 = (void *)(a1 + 16);
  long long v11 = operator new(0x20uLL);
  *long long v11 = 0;
  v11[1] = v7;
  *((unsigned char *)v11 + 16) = **a4;
  v11[3] = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v8 || (float)(v15 * (float)v8) < v14)
  {
    BOOL v16 = 1;
    if (v8 >= 3) {
      BOOL v16 = (v8 & (v8 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v8);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7) {
        unint64_t v4 = v7 % v8;
      }
      else {
        unint64_t v4 = v7;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
  }
  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    *long long v11 = *v21;
LABEL_38:
    *unint64_t v21 = v11;
    goto LABEL_39;
  }
  *long long v11 = *v13;
  void *v13 = v11;
  *(void *)(v20 + 8 * v4) = v13;
  if (*v11)
  {
    unint64_t v22 = *(void *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v22 >= v8) {
        v22 %= v8;
      }
    }
    else
    {
      v22 &= v8 - 1;
    }
    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v11;
}

void sub_22E8862D0(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned char,std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8)) {
    std::unique_ptr<UC::UCMultiContextSymbolFrequencyTrie::Node>::reset[abi:ne180100](__p + 3, 0);
  }
  if (__p)
  {
    operator delete(__p);
  }
}

void sub_22E88640C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E886530(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_22E886604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

void sub_22E886778(_Unwind_Exception *a1)
{
  operator delete(v1);

  _Unwind_Resume(a1);
}

void sub_22E8867D8()
{
}

void sub_22E886980()
{
  __cxa_end_catch();
  JUMPOUT(0x22E8867C8);
}

void sub_22E88699C()
{
}

void sub_22E8869A8()
{
}

id nsStringFromString(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = (id)[NSString stringWithUTF8String:a1];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

void sub_22E886AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E886D00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }

  _Unwind_Resume(a1);
}

void sub_22E886E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E886F64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E887294(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E887584(_Unwind_Exception *a1)
{
  unint64_t v4 = *(std::__shared_weak_count **)(v2 + 8);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }

  _Unwind_Resume(a1);
}

void sub_22E8875A4(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void **__p, uint64_t a10, int a11, __int16 a12, char a13, unsigned __int8 a14)
{
  unint64_t v21 = *(std::__shared_weak_count **)(v18 - 176);
  if (v21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v21);
  }
  operator delete(v17);
  unint64_t v22 = *(std::__shared_weak_count **)(v18 - 120);
  if (v22) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v22);
  }
  if (a2 == 1)
  {
    unint64_t v23 = __cxa_begin_catch(a1);
    if (v15)
    {
      unint64_t v24 = v23;
      std::string::basic_string[abi:ne180100]<0>(&__p, "Encountered an internal error while initializing the URL encoder. ");
      __int16 v25 = (const std::string::value_type *)(*(uint64_t (**)(void *))(*(void *)v24 + 16))(v24);
      std::string::append((std::string *)&__p, v25);
      if ((a14 & 0x80u) == 0) {
        p_p = (void **)&__p;
      }
      else {
        p_p = __p;
      }
      if ((a14 & 0x80u) == 0) {
        uint64_t v27 = a14;
      }
      else {
        uint64_t v27 = a10;
      }
      id v28 = nsStringFromString((uint64_t)p_p, v27);
      void *v15 = (id)[v16 _errorWithCoderErrorCode:-1 codingErrorSymbol:0 message:v28];

      if ((char)a14 < 0) {
        operator delete(__p);
      }
    }
    void *v14 = 0;
    v14[1] = 0;
    __cxa_end_catch();
    JUMPOUT(0x22E88755CLL);
  }
  JUMPOUT(0x22E887594);
}

void sub_22E887958(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  __cxa_end_catch();
  JUMPOUT(0x22E887594);
}

void UC::UCURLComponents::~UCURLComponents(void **this)
{
  if (*((char *)this + 199) < 0) {
    operator delete(this[22]);
  }
  if (*((char *)this + 175) < 0) {
    operator delete(this[19]);
  }
  if (*((char *)this + 143) < 0) {
    operator delete(this[15]);
  }
  if (*((char *)this + 119) < 0) {
    operator delete(this[12]);
  }
  if (*((char *)this + 95) < 0) {
    operator delete(this[9]);
  }
  if (*((char *)this + 71) < 0) {
    operator delete(this[6]);
  }
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void *std::allocate_shared[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,std::string &,std::string &,std::string &,void>@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, void *a4@<X8>)
{
  unint64_t v8 = operator new(0xD0uLL);
  uint64_t result = std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::string &,std::string &,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,0>(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_22E887B10(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::__shared_ptr_emplace[abi:ne180100]<std::string &,std::string &,std::string &,std::allocator<UC::SUE::UCSegmentedURLCoderProvider>,0>(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E242DE0;
  std::allocator<UC::SUE::UCSegmentedURLCoderProvider>::construct[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::string &,std::string &,std::string &>((uint64_t)&v6, (uint64_t)(a1 + 3), a2, a3, a4);
  return a1;
}

void sub_22E887B88(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242DE0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242DE0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLCoderProvider>::__on_zero_shared(uint64_t a1)
{
}

void std::allocator<UC::SUE::UCSegmentedURLCoderProvider>::construct[abi:ne180100]<UC::SUE::UCSegmentedURLCoderProvider,std::string &,std::string &,std::string &>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v10 = *(std::string *)a3;
  }
  if (*(char *)(a4 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a4, *(void *)(a4 + 8));
  }
  else {
    std::string v9 = *(std::string *)a4;
  }
  if (*(char *)(a5 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a5, *(void *)(a5 + 8));
  }
  else {
    std::string __p = *(std::string *)a5;
  }
  UC::SUE::UCSegmentedURLCoderProvider::UCSegmentedURLCoderProvider(a2, &v10, &v9, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v10.__r_.__value_.__l.__data_);
  }
}

void sub_22E887D00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

void UC::SUE::UCSegmentedURLCoderProvider::~UCSegmentedURLCoderProvider(UC::SUE::UCSegmentedURLCoderProvider *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 22);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  id v3 = (std::__shared_weak_count *)*((void *)this + 20);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  unint64_t v4 = (std::__shared_weak_count *)*((void *)this + 18);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  unint64_t v5 = (std::__shared_weak_count *)*((void *)this + 16);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  char v6 = (std::__shared_weak_count *)*((void *)this + 14);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  unint64_t v7 = (std::__shared_weak_count *)*((void *)this + 12);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  unint64_t v8 = (std::__shared_weak_count *)*((void *)this + 10);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (*((char *)this + 71) < 0) {
    operator delete(*((void **)this + 6));
  }
  if (*((char *)this + 47) < 0) {
    operator delete(*((void **)this + 3));
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*(void **)this);
  }
}

void std::default_delete<UC::SUE::SegmentedURLEncoderImpl>::operator()[abi:ne180100](int a1, void *__p)
{
  if (__p)
  {
    uint64_t v3 = __p[2];
    __p[2] = 0;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8))(v3);
    }
    unint64_t v4 = (std::__shared_weak_count *)__p[1];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    operator delete(__p);
  }
}

void std::default_delete<UC::SUE::PrefixedURLEncoderImpl>::operator()[abi:ne180100](int a1, void *__p)
{
  if (__p)
  {
    uint64_t v3 = (std::__shared_weak_count *)__p[3];
    if (v3) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v3);
    }
    unint64_t v4 = (std::__shared_weak_count *)__p[1];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    operator delete(__p);
  }
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLEncodingResult>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242E18;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLEncodingResult>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E242E18;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<UC::SUE::UCSegmentedURLEncodingResult>::__on_zero_shared(uint64_t a1)
{
  std::allocator<UC::SUE::UCSegmentedURLEncodingResult>::destroy[abi:ne180100]((uint64_t)&v1, a1 + 24);
}

void std::allocator<UC::SUE::UCSegmentedURLEncodingResult>::destroy[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(a2 + 40);
  unint64_t v4 = *(void ***)(a2 + 40);
  void *v3 = 0;
  if (v4) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)v3, v4);
  }
  if (*(char *)(a2 + 23) < 0)
  {
    unint64_t v5 = *(void **)a2;
    operator delete(v5);
  }
}

void UCURLComponentsFromNSURL(NSURL *a1@<X0>, std::string *a2@<X8>)
{
  uint64_t v3 = a1;
  id v4 = (id)[MEMORY[0x263F08BA0] componentsWithURL:v3 resolvingAgainstBaseURL:0];
  memset(&v35, 0, sizeof(v35));
  unint64_t v5 = [(NSURL *)v3 absoluteString];
  uint64_t v6 = [(NSString *)v5 length];

  if (v6)
  {
    unint64_t v7 = [(NSURL *)v3 absoluteString];
    std::string::append(&v35, [(NSString *)v7 UTF8String]);
  }
  memset(&v34, 0, sizeof(v34));
  id v8 = (id)[v4 scheme];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    id v10 = (id) [v4 scheme];
    std::string::append(&v34, (const std::string::value_type *)[v10 UTF8String]);
  }
  memset(&v33, 0, sizeof(v33));
  id v11 = (id)[v4 percentEncodedHost];
  if ([v11 length]) {
    std::string::append(&v33, (const std::string::value_type *)[v11 UTF8String]);
  }
  memset(&v32, 0, sizeof(v32));
  id v12 = (id)[v4 percentEncodedPath];
  if ([v12 length]) {
    std::string::append(&v32, (const std::string::value_type *)[v12 UTF8String]);
  }
  memset(&v31, 0, sizeof(v31));
  id v13 = (id)[v4 percentEncodedQuery];
  if ([v13 length]) {
    std::string::append(&v31, (const std::string::value_type *)[v13 UTF8String]);
  }
  memset(&v30, 0, sizeof(v30));
  id v14 = (id)[v4 percentEncodedFragment];
  if ([v14 length]) {
    std::string::append(&v30, (const std::string::value_type *)[v14 UTF8String]);
  }
  id v15 = (id)[v4 port];

  if (v15)
  {
    id v16 = (id)[v4 port];
    std::string::size_type v17 = [v16 unsignedLongLongValue];
  }
  else
  {
    std::string::size_type v17 = 0;
  }
  memset(&v29, 0, sizeof(v29));
  id v18 = (id)[v4 percentEncodedUser];
  if ([v18 length]) {
    std::string::append(&v29, (const std::string::value_type *)[v18 UTF8String]);
  }
  memset(&v28, 0, sizeof(v28));
  id v19 = (id)[v4 percentEncodedPassword];
  if ([v19 length]) {
    std::string::append(&v28, (const std::string::value_type *)[v19 UTF8String]);
  }
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v27, v35.__r_.__value_.__l.__data_, v35.__r_.__value_.__l.__size_);
  }
  else {
    std::string v27 = v35;
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v26, v34.__r_.__value_.__l.__data_, v34.__r_.__value_.__l.__size_);
  }
  else {
    std::string v26 = v34;
  }
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v25, v33.__r_.__value_.__l.__data_, v33.__r_.__value_.__l.__size_);
  }
  else {
    std::string v25 = v33;
  }
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v24, v32.__r_.__value_.__l.__data_, v32.__r_.__value_.__l.__size_);
  }
  else {
    std::string v24 = v32;
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v23, v31.__r_.__value_.__l.__data_, v31.__r_.__value_.__l.__size_);
  }
  else {
    std::string v23 = v31;
  }
  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v22, v30.__r_.__value_.__l.__data_, v30.__r_.__value_.__l.__size_);
  }
  else {
    std::string v22 = v30;
  }
  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v21, v29.__r_.__value_.__l.__data_, v29.__r_.__value_.__l.__size_);
  }
  else {
    std::string v21 = v29;
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    std::string::__init_copy_ctor_external(&v20, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  }
  else {
    std::string v20 = v28;
  }
  UC::UCURLComponents::UCURLComponents(a2, (long long *)&v27, (long long *)&v26, (long long *)&v25, (long long *)&v24, (long long *)&v23, (long long *)&v22, v17, (long long *)&v21, (long long *)&v20);
  if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v20.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v21.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v22.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v23.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v27.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v29.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v30.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }

  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v33.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
}

void sub_22E88854C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,void *a24,uint64_t a25,int a26,__int16 a27,char a28,char a29,uint64_t a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36,uint64_t a37,void *a38,uint64_t a39,int a40,__int16 a41,char a42,char a43,uint64_t a44,void *a45,uint64_t a46,int a47,__int16 a48,char a49,char a50,uint64_t a51,void *a52,uint64_t a53,int a54,__int16 a55,char a56,char a57,uint64_t a58,void *a59,uint64_t a60,int a61,__int16 a62,char a63)
{
  if (a22 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (a36 < 0) {
    operator delete(a31);
  }
  if (a43 < 0) {
    operator delete(a38);
  }
  if (a50 < 0) {
    operator delete(a45);
  }
  if (a57 < 0) {
    operator delete(a52);
  }
  if (a64 < 0) {
    operator delete(a59);
  }

  if (a71 < 0) {
    operator delete(a66);
  }

  if (a73 < 0) {
    operator delete(a72);
  }

  if (*(char *)(v80 - 217) < 0) {
    operator delete(*(void **)(v80 - 240));
  }

  if (*(char *)(v80 - 193) < 0) {
    operator delete(*(void **)(v80 - 216));
  }

  if (*(char *)(v80 - 169) < 0) {
    operator delete(*(void **)(v80 - 192));
  }

  if (*(char *)(v80 - 145) < 0) {
    operator delete(*(void **)(v80 - 168));
  }
  if (*(char *)(v80 - 121) < 0) {
    operator delete(*(void **)(v80 - 144));
  }
  if (*(char *)(v80 - 97) < 0) {
    operator delete(*(void **)(v80 - 120));
  }

  _Unwind_Resume(a1);
}

std::string *UC::UCMultiContextHuffmanSymbolFrequencyReader::UCMultiContextHuffmanSymbolFrequencyReader(std::string *a1, std::string::size_type a2, std::string::size_type *a3, long long *a4)
{
  std::string::size_type v6 = *a3;
  std::string::size_type v5 = a3[1];
  a1->__r_.__value_.__r.__words[0] = a2;
  a1->__r_.__value_.__l.__size_ = v6;
  a1->__r_.__value_.__r.__words[2] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  unint64_t v7 = a1 + 1;
  if (*((char *)a4 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a4, *((void *)a4 + 1));
  }
  else
  {
    long long v8 = *a4;
    a1[1].__r_.__value_.__r.__words[2] = *((void *)a4 + 2);
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = v8;
  }
  a1[2].__r_.__value_.__r.__words[0] = 0;
  a1[2].__r_.__value_.__l.__size_ = 0;
  return a1;
}

void sub_22E8887F0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 16);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UC::UCMultiContextHuffmanSymbolFrequencyReader::readData(std::string *this)
{
  v11[19] = *MEMORY[0x263EF8340];
  std::fstream::basic_fstream(&v10, this + 1, 0xEu);
  if (*(&v10.__sb_.__st_._mbstateL + 9))
  {
    std::istream::tellg();
    std::istream::seekg();
    uint64_t v2 = operator new[](v9);
    bzero(v2, v9);
    std::string __p = v2;
    std::istream::read();
    if (!std::filebuf::close()) {
      std::ios_base::clear((std::ios_base *)((char *)&v10 + *((void *)v10.__sb_.__extbuf_ - 3)), *(_DWORD *)&v10.__sb_.__extbuf_min_[*((void *)v10.__sb_.__extbuf_ - 3) + 8] | 4);
    }
    std::allocate_shared[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie,std::allocator<UC::UCMultiContextSymbolFrequencyTrie>,std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&,void>((uint64_t *)&this->__r_.__value_.__l.__size_, &__p, this, &v8);
    long long v3 = v8;
    long long v8 = 0uLL;
    std::string::size_type size = (std::__shared_weak_count *)this[2].__r_.__value_.__l.__size_;
    *(_OWORD *)&this[2].__r_.__value_.__l.__data_ = v3;
    if (size)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](size);
      if (*((void *)&v8 + 1)) {
        std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
      }
    }
    std::string::size_type v5 = __p;
    std::string __p = 0;
    if (v5) {
      operator delete[](v5);
    }
  }
  MEMORY[0x230FA6FB0](v10.__sb_.__extbuf_min_);
  std::iostream::~basic_iostream();
  return MEMORY[0x230FA7120](v11);
}

void sub_22E8889D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void (__cdecl **a29)(std::fstream *__hidden this))
{
  if (__p) {
    operator delete[](__p);
  }
  std::fstream::~fstream(&a29);
  _Unwind_Resume(a1);
}

std::fstream *__cdecl std::fstream::basic_fstream(std::fstream *this, const std::string *__s, std::ios_base::openmode __mode)
{
  this->__sb_.__extbufnext_ = 0;
  extbuf_min = this->__sb_.__extbuf_min_;
  this->__sb_.__extbuf_ = (char *)&unk_26E242F98;
  *(&this[1].__sb_.__st_._mbstateL + 2) = (uint64_t)&unk_26E242FC0;
  std::ios_base::init((std::ios_base *)(&this[1].__sb_.__st_._mbstateL + 2), this->__sb_.__extbuf_min_);
  *(&this[1].__sb_.__st_last_._mbstateL + 3) = 0;
  *((_DWORD *)&this[1].__sb_.__st_last_._mbstateL + 8) = -1;
  MEMORY[0x230FA6FA0](extbuf_min);
  if (!std::filebuf::open()) {
    std::ios_base::clear((std::ios_base *)((char *)this + *((void *)this->__sb_.__extbuf_ - 3)), *(_DWORD *)&this->__sb_.__extbuf_min_[*((void *)this->__sb_.__extbuf_ - 3) + 8] | 4);
  }
  return this;
}

void sub_22E888B68(_Unwind_Exception *a1)
{
  std::iostream::~basic_iostream();
  MEMORY[0x230FA7120](v1);
  _Unwind_Resume(a1);
}

void (__cdecl ***std::fstream::~fstream(void (__cdecl ***a1)(std::fstream *__hidden this)))(std::fstream *__hidden this)
{
  uint64_t v2 = a1 + 54;
  MEMORY[0x230FA6FB0](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x230FA7120](v2);
  return a1;
}

uint64_t UC::UCMultiContextHuffmanSymbolFrequencyReader::getContextSymbolFrequency@<X0>(uint64_t this@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *(void *)(this + 56);
  *a2 = *(void *)(this + 48);
  a2[1] = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return this;
}

void non-virtual thunk to'std::fstream::~fstream(void (__cdecl ***a1)(std::fstream *__hidden this))
{
  MEMORY[0x230FA6FB0](a1 + 1);
  std::iostream::~basic_iostream();
  JUMPOUT(0x230FA7120);
}

{
  void (__cdecl ***v1)(std::fstream *__hidden);
  void *v2;
  uint64_t vars8;

  uint64_t v1 = a1 - 2;
  uint64_t v2 = a1 + 52;
  MEMORY[0x230FA6FB0](a1 + 1);
  std::iostream::~basic_iostream();
  MEMORY[0x230FA7120](v2);
  operator delete(v1);
}

void virtual thunk to'std::fstream::~fstream(void *a1)
{
  uint64_t v1 = (void (__cdecl ***)(std::fstream *__hidden))((char *)a1 + *(void *)(*a1 - 24));
  MEMORY[0x230FA6FB0](v1 + 3);
  std::iostream::~basic_iostream();
  JUMPOUT(0x230FA7120);
}

{
  void (__cdecl ***v1)(std::fstream *__hidden);
  uint64_t vars8;

  uint64_t v1 = (void (__cdecl ***)(std::fstream *__hidden))((char *)a1 + *(void *)(*a1 - 24));
  MEMORY[0x230FA6FB0](v1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x230FA7120](v1 + 54);
  operator delete(v1);
}

void std::fstream::~fstream(void (__cdecl ***a1)(std::fstream *__hidden this))
{
  uint64_t v2 = a1 + 54;
  MEMORY[0x230FA6FB0](a1 + 3);
  std::iostream::~basic_iostream();
  MEMORY[0x230FA7120](v2);
  operator delete(a1);
}

void *std::allocate_shared[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie,std::allocator<UC::UCMultiContextSymbolFrequencyTrie>,std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&,void>@<X0>(uint64_t *a1@<X1>, void **a2@<X2>, void *a3@<X3>, void *a4@<X8>)
{
  long long v8 = operator new(0x58uLL);
  uint64_t result = std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&,std::allocator<UC::UCMultiContextSymbolFrequencyTrie>,0>(v8, a1, a2, a3);
  *a4 = v8 + 3;
  a4[1] = v8;
  return result;
}

void sub_22E889054(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::__shared_ptr_emplace[abi:ne180100]<std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&,std::allocator<UC::UCMultiContextSymbolFrequencyTrie>,0>(void *a1, uint64_t *a2, void **a3, void *a4)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E243030;
  std::allocator<UC::UCMultiContextSymbolFrequencyTrie>::construct[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie,std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&>((uint64_t)&v6, (uint64_t)(a1 + 3), a2, a3, a4);
  return a1;
}

void sub_22E8890CC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E243030;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E243030;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void std::__shared_ptr_emplace<UC::UCMultiContextSymbolFrequencyTrie>::__on_zero_shared(uint64_t a1)
{
  std::allocator<UC::UCMultiContextSymbolFrequencyTrie>::destroy[abi:ne180100]((uint64_t)&v1, (void *)(a1 + 24));
}

void std::allocator<UC::UCMultiContextSymbolFrequencyTrie>::construct[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie,std::shared_ptr<std::vector<std::string>> &,std::unique_ptr<unsigned char []>,unsigned long const&>(uint64_t a1, uint64_t a2, uint64_t *a3, void **a4, void *a5)
{
  std::string::size_type v5 = (std::__shared_weak_count *)a3[1];
  uint64_t v9 = *a3;
  std::fstream v10 = v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  char v6 = *a4;
  *a4 = 0;
  std::string __p = v6;
  UC::UCMultiContextSymbolFrequencyTrie::UCMultiContextSymbolFrequencyTrie(a2, &v9, &__p, *a5);
  unint64_t v7 = __p;
  std::string __p = 0;
  if (v7) {
    operator delete[](v7);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
}

void sub_22E8891E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, std::__shared_weak_count *a12)
{
  if (__p) {
    operator delete[](__p);
  }
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

void std::allocator<UC::UCMultiContextSymbolFrequencyTrie>::destroy[abi:ne180100](uint64_t a1, void *a2)
{
  long long v3 = (std::__shared_weak_count *)a2[7];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  std::unique_ptr<std::unordered_map<std::string,unsigned char>>::reset[abi:ne180100](a2 + 4, 0);
  id v4 = (void *)a2[3];
  a2[3] = 0;
  if (v4) {
    operator delete[](v4);
  }
  std::string::size_type v5 = (std::__shared_weak_count *)a2[1];
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
}

double UC::UCMultiContextHuffmanCoder::UCMultiContextHuffmanCoder(uint64_t a1, void *a2, uint64_t a3)
{
  *(void *)a1 = &unk_26E243068;
  *(void *)(a1 + 8) = a3;
  uint64_t v3 = a2[1];
  *(void *)(a1 + 16) = *a2;
  *(void *)(a1 + 24) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  double result = 0.0;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_DWORD *)(a1 + 64) = 1065353216;
  *(void *)(a1 + 72) = 0;
  return result;
}

uint64_t UC::UCMultiContextHuffmanCoder::encode(uint64_t a1, uint64_t a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v4 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a1, (std::string::size_type)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 32))(v4, a2);
}

void sub_22E889360(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(uint64_t a1, std::string::size_type a2)
{
  uint64_t v4 = *(unsigned __int8 *)(a2 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *(void *)(a2 + 8);
  }
  if (v4)
  {
    std::string::size_type v5 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>((void *)(a1 + 32), (unsigned __int8 *)a2);
    if (v5) {
      return *((void *)v5 + 5);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 72);
    if (result) {
      return result;
    }
  }
  uint64_t RootNode = UC::UCMultiContextSymbolFrequencyTrie::getRootNode(*(UC::UCMultiContextSymbolFrequencyTrie **)(a1 + 16));
  uint64_t v26 = RootNode;
  uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
  int v9 = (char)v8;
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a2 + 8);
  }
  if (v8)
  {
    std::fstream v10 = (unsigned __int8 *)RootNode;
    if (v9 >= 0) {
      id v11 = (std::string::value_type *)a2;
    }
    else {
      id v11 = *(std::string::value_type **)a2;
    }
    do
    {
      memset(&v25, 0, sizeof(v25));
      std::string::push_back(&v25, *v11);
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v24, v25.__r_.__value_.__l.__data_, v25.__r_.__value_.__l.__size_);
      }
      else {
        std::string v24 = v25;
      }
      std::fstream v10 = (unsigned __int8 *)UC::UCMultiContextSymbolFrequencyTrie::Node::childNodeForSymbol(v10, (unsigned __int8 *)&v24);
      uint64_t v26 = (uint64_t)v10;
      if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v24.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v25.__r_.__value_.__l.__data_);
      }
      ++v11;
      uint64_t v12 = *(unsigned __int8 *)(a2 + 23);
      if ((v12 & 0x80u) == 0) {
        id v13 = (std::string::value_type *)a2;
      }
      else {
        id v13 = *(std::string::value_type **)a2;
      }
      if ((v12 & 0x80u) != 0) {
        uint64_t v12 = *(void *)(a2 + 8);
      }
    }
    while (v11 != &v13[v12]);
  }
  UC::UCMultiContextSymbolFrequencyTrie::getOrderedSymbols(*(void **)(a1 + 16), &v22);
  std::allocate_shared[abi:ne180100]<UC::UCSymbolFrequencyTable,std::allocator<UC::UCSymbolFrequencyTable>,UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>,void>(&v26, &v22, &v23);
  id v14 = operator new(0x18uLL);
  *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v23;
  long long v23 = 0uLL;
  UC::UCHuffmanCoder::UCHuffmanCoder(v14, &v25);
  if (v25.__r_.__value_.__l.__size_) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v25.__r_.__value_.__l.__size_);
  }
  if (*((void *)&v23 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v23 + 1));
  }
  if (*((void *)&v22 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v22 + 1));
  }
  uint64_t v15 = *(unsigned __int8 *)(a2 + 23);
  if ((v15 & 0x80u) != 0) {
    uint64_t v15 = *(void *)(a2 + 8);
  }
  if (v15)
  {
    uint64_t v16 = a1 + 32;
    v25.__r_.__value_.__r.__words[0] = a2;
    std::string::size_type v17 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v16, (unsigned __int8 *)a2, (uint64_t)&std::piecewise_construct, (long long **)&v25);
    uint64_t v18 = *((void *)v17 + 5);
    *((void *)v17 + 5) = v14;
    if (v18) {
      (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
    }
    v25.__r_.__value_.__r.__words[0] = a2;
    id v19 = std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v16, (unsigned __int8 *)a2, (uint64_t)&std::piecewise_construct, (long long **)&v25)+ 40;
  }
  else
  {
    uint64_t v21 = *(void *)(a1 + 72);
    id v19 = (unsigned __int8 *)(a1 + 72);
    uint64_t v20 = v21;
    *(void *)id v19 = v14;
    if (v21) {
      (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
    }
  }
  return *(void *)v19;
}

void sub_22E8895E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  (*(void (**)(uint64_t))(*(void *)v25 + 8))(v25);
  _Unwind_Resume(a1);
}

void UC::UCMultiContextHuffmanCoder::encode(uint64_t a1, uint64_t a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  (*(void (**)(uint64_t, uint64_t, void **))(*(void *)a1 + 56))(a1, a2, __p);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
}

void sub_22E889714(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void UC::UCMultiContextHuffmanCoder::encodeWithStartContext(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  if ((int)(-1431655765 * ((uint64_t)(a2[1] - *a2) >> 3)) >= 1)
  {
    unint64_t v8 = 0;
    uint64_t v9 = -1431655765 * ((uint64_t)(a2[1] - *a2) >> 3);
    do
    {
      if (*(void *)(a1 + 8) <= v8)
      {
        std::string::basic_string[abi:ne180100]<0>(&v22, "");
      }
      else if (*(char *)(a3 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v22, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
      }
      else
      {
        std::string v22 = *(std::string *)a3;
      }
      int v10 = *(_DWORD *)(a1 + 8);
      unint64_t v11 = (v8 - v10) & ~(((int)v8 - v10) >> 31);
      if (v8 > v11)
      {
        uint64_t v12 = 24 * ((v8 - v10) & ~(((int)v8 - v10) >> 31));
        do
        {
          uint64_t v13 = *a2 + v12;
          int v14 = *(char *)(v13 + 23);
          if (v14 >= 0) {
            uint64_t v15 = (const std::string::value_type *)(*a2 + v12);
          }
          else {
            uint64_t v15 = *(const std::string::value_type **)v13;
          }
          if (v14 >= 0) {
            std::string::size_type v16 = *(unsigned __int8 *)(v13 + 23);
          }
          else {
            std::string::size_type v16 = *(void *)(v13 + 8);
          }
          std::string::append(&v22, v15, v16);
          ++v11;
          v12 += 24;
        }
        while (v11 < v8);
      }
      uint64_t v17 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a1, (std::string::size_type)&v22);
      (*(void (**)(void **__return_ptr))(*(void *)v17 + 32))(__p);
      if ((v21 & 0x80u) == 0) {
        uint64_t v18 = __p;
      }
      else {
        uint64_t v18 = (void **)__p[0];
      }
      if ((v21 & 0x80u) == 0) {
        std::string::size_type v19 = v21;
      }
      else {
        std::string::size_type v19 = (std::string::size_type)__p[1];
      }
      std::string::append(a4, (const std::string::value_type *)v18, v19);
      if ((char)v21 < 0) {
        operator delete(__p[0]);
      }
      if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v22.__r_.__value_.__l.__data_);
      }
      ++v8;
    }
    while (v8 != v9);
  }
}

void sub_22E8898E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (*(char *)(v21 + 23) < 0) {
    operator delete(*(void **)v21);
  }
  _Unwind_Resume(exception_object);
}

void UC::UCMultiContextHuffmanCoder::decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::string::basic_string[abi:ne180100]<0>(v7, "");
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string __p = *(std::string *)a3;
  }
  (*(void (**)(uint64_t, uint64_t, void **, std::string *))(*(void *)a1 + 64))(a1, a2, v7, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
}

void sub_22E889A04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void UC::UCMultiContextHuffmanCoder::decodeWithStartContext(UC::UCBitStream *this@<X1>, uint64_t a2@<X0>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, std::string *a5@<X8>)
{
  signed int v10 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  unint64_t v40 = 0;
  while (UC::UCBitStream::hasMore(this))
  {
    if (*(void *)(a2 + 8) <= (unint64_t)v10)
    {
      std::string::basic_string[abi:ne180100]<0>(&v37, "");
    }
    else if (*(char *)(a3 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v37, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
    }
    else
    {
      std::string v37 = *(std::string *)a3;
    }
    unsigned int v11 = (v10 - *(_DWORD *)(a2 + 8)) & ~((v10 - *(_DWORD *)(a2 + 8)) >> 31);
    if (v11 < v10)
    {
      unint64_t v12 = v10 - (unint64_t)v11;
      uint64_t v13 = 24 * v11;
      do
      {
        int v14 = *(char *)(v38 + v13 + 23);
        if (v14 >= 0) {
          uint64_t v15 = (const std::string::value_type *)(v38 + v13);
        }
        else {
          uint64_t v15 = *(const std::string::value_type **)(v38 + v13);
        }
        if (v14 >= 0) {
          std::string::size_type v16 = *(unsigned __int8 *)(v38 + v13 + 23);
        }
        else {
          std::string::size_type v16 = *(void *)(v38 + v13 + 8);
        }
        std::string::append(&v37, v15, v16);
        v13 += 24;
        --v12;
      }
      while (v12);
    }
    uint64_t v17 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a2, (std::string::size_type)&v37);
    (*(void (**)(size_t *__return_ptr))(*(void *)v17 + 56))(__n);
    uint64_t v18 = HIBYTE(v36);
    std::string::size_type v19 = __n[1];
    if (v36 >= 0) {
      size_t v20 = HIBYTE(v36);
    }
    else {
      size_t v20 = __n[1];
    }
    uint64_t v21 = a4[23];
    int v22 = (char)v21;
    if ((v21 & 0x80u) != 0) {
      uint64_t v21 = *((void *)a4 + 1);
    }
    if (v20 == v21)
    {
      if (v22 >= 0) {
        long long v23 = a4;
      }
      else {
        long long v23 = *(unsigned __int8 **)a4;
      }
      if (SHIBYTE(v36) < 0)
      {
        std::string v28 = (const std::string::value_type *)__n[0];
        if (!memcmp((const void *)__n[0], v23, __n[1]))
        {
          char v25 = 0;
LABEL_46:
          operator delete((void *)__n[0]);
          goto LABEL_47;
        }
        uint64_t v26 = v39;
        if ((unint64_t)v39 >= v40)
        {
LABEL_38:
          uint64_t v29 = std::vector<std::string>::__push_back_slow_path<std::string const&>(&v38, (long long *)__n);
          goto LABEL_43;
        }
        goto LABEL_41;
      }
      if (!HIBYTE(v36))
      {
        char v25 = 0;
        goto LABEL_47;
      }
      std::string v24 = __n;
      while (*(unsigned __int8 *)v24 == *v23)
      {
        std::string v24 = (size_t *)((char *)v24 + 1);
        ++v23;
        if (!--v18)
        {
          char v25 = 0;
          if ((v36 & 0x8000000000000000) == 0) {
            goto LABEL_47;
          }
          goto LABEL_46;
        }
      }
    }
    uint64_t v26 = v39;
    if ((unint64_t)v39 >= v40) {
      goto LABEL_38;
    }
    if (SHIBYTE(v36) < 0)
    {
      std::string v28 = (const std::string::value_type *)__n[0];
LABEL_41:
      std::string::__init_copy_ctor_external(v26, v28, v19);
      goto LABEL_42;
    }
    long long v27 = *(_OWORD *)__n;
    v39->__r_.__value_.__r.__words[2] = v36;
    *(_OWORD *)&v26->__r_.__value_.__l.__data_ = v27;
LABEL_42:
    uint64_t v29 = (uint64_t)&v26[1];
LABEL_43:
    uint64_t v39 = (std::string *)v29;
    ++v10;
    char v25 = 1;
    if (v36 < 0) {
      goto LABEL_46;
    }
LABEL_47:
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v37.__r_.__value_.__l.__data_);
      if ((v25 & 1) == 0) {
        break;
      }
    }
    else if ((v25 & 1) == 0)
    {
      break;
    }
  }
  a5->__r_.__value_.__r.__words[0] = 0;
  a5->__r_.__value_.__l.__size_ = 0;
  a5->__r_.__value_.__r.__words[2] = 0;
  uint64_t v30 = v38;
  for (uint64_t i = v39; (std::string *)v30 != i; v30 += 24)
  {
    if (*(char *)(v30 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(&v37, *(const std::string::value_type **)v30, *(void *)(v30 + 8));
    }
    else
    {
      long long v32 = *(_OWORD *)v30;
      v37.__r_.__value_.__r.__words[2] = *(void *)(v30 + 16);
      *(_OWORD *)&v37.__r_.__value_.__l.__data_ = v32;
    }
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string v33 = &v37;
    }
    else {
      std::string v33 = (std::string *)v37.__r_.__value_.__r.__words[0];
    }
    if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v37.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v37.__r_.__value_.__l.__size_;
    }
    std::string::append(a5, (const std::string::value_type *)v33, size);
    if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v37.__r_.__value_.__l.__data_);
    }
  }
  v37.__r_.__value_.__r.__words[0] = (std::string::size_type)&v38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
}

void sub_22E889D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,uint64_t a23)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  a16 = &a22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&a16);
  _Unwind_Resume(a1);
}

uint64_t UC::UCMultiContextHuffmanCoder::canEncode(uint64_t a1, uint64_t a2)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v4 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a1, (std::string::size_type)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 16))(v4, a2);
}

{
  uint64_t v4;
  void *__p[2];
  char v7;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v4 = UC::UCMultiContextHuffmanCoder::_huffmanCoderForContext(a1, (std::string::size_type)__p);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v4 + 24))(v4, a2);
}

void sub_22E889E54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_22E889EF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void UC::UCMultiContextHuffmanCoder::clearCaches(UC::UCMultiContextHuffmanCoder *this)
{
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::clear((uint64_t)this + 32);
  uint64_t v2 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  uint64_t v3 = (UC::UCMultiContextSymbolFrequencyTrie *)*((void *)this + 2);
  UC::UCMultiContextSymbolFrequencyTrie::clearCaches(v3);
}

void UC::UCMultiContextHuffmanCoder::~UCMultiContextHuffmanCoder(UC::UCMultiContextHuffmanCoder *this)
{
  *(void *)this = &unk_26E243068;
  uint64_t v2 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::~__hash_table((uint64_t)this + 32);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
}

{
  uint64_t v2;
  std::__shared_weak_count *v3;
  uint64_t vars8;

  *(void *)this = &unk_26E243068;
  uint64_t v2 = *((void *)this + 9);
  *((void *)this + 9) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::~__hash_table((uint64_t)this + 32);
  uint64_t v3 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  operator delete(this);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__deallocate_node(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (void *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<UC::UCHuffmanCoder>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<UC::UCHuffmanCoder>>,0>(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = 0;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8))(v2);
  }
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v3 = *(void **)a1;
    operator delete(v3);
  }
}

void *std::allocate_shared[abi:ne180100]<UC::UCSymbolFrequencyTable,std::allocator<UC::UCSymbolFrequencyTable>,UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>,void>@<X0>(uint64_t *a1@<X1>, long long *a2@<X2>, void *a3@<X8>)
{
  char v6 = operator new(0x40uLL);
  uint64_t result = std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__shared_ptr_emplace[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCSymbolFrequencyTable>,0>(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_22E88A1E0(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void *std::__shared_ptr_emplace<UC::UCSymbolFrequencyTable>::__shared_ptr_emplace[abi:ne180100]<UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>,std::allocator<UC::UCSymbolFrequencyTable>,0>(void *a1, uint64_t *a2, long long *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = &unk_26E242CC8;
  std::allocator<UC::UCSymbolFrequencyTable>::construct[abi:ne180100]<UC::UCSymbolFrequencyTable,UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>>((uint64_t)&v5, a1 + 3, a2, a3);
  return a1;
}

void sub_22E88A254(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::allocator<UC::UCSymbolFrequencyTable>::construct[abi:ne180100]<UC::UCSymbolFrequencyTable,UC::UCMultiContextSymbolFrequencyTrie::Node *&,std::shared_ptr<std::vector<std::string>>>(uint64_t a1, void *a2, uint64_t *a3, long long *a4)
{
  uint64_t v5 = *a3;
  long long v6 = *a4;
  *(void *)a4 = 0;
  *((void *)a4 + 1) = 0;
  UC::UCSymbolFrequencyTable::UCSymbolFrequencyTable(a2, v5, &v6);
  if (*((void *)&v6 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v6 + 1));
  }
}

void sub_22E88A2B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::__shared_weak_count *a10)
{
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, long long **a4)
{
  char v8 = (void *)(a1 + 24);
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
    int v14 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
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
  std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
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
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v22);
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
  long long v23 = *(void **)(*(void *)a1 + 8 * v4);
  if (v23)
  {
    *(void *)v26[0] = *v23;
    *long long v23 = v26[0];
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
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_22E88A550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, long long **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  char v8 = operator new(0x30uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(unsigned char *)(a4 + 16) = 0;
  *char v8 = 0;
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
  *(unsigned char *)(a4 + 16) = 1;
}

void sub_22E88A5F0(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::unique_ptr<UC::UCHuffmanCoder>>,0>((uint64_t)v2 + 16);
    }
    operator delete(v2);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<UC::UCHuffmanCoder>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

void *UC::UCSymbolFrequencyTable::UCSymbolFrequencyTable(void *result, void *a2, void *a3)
{
  uint64_t v3 = a3[1];
  void *result = *a3;
  result[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v4 = a2[1];
  result[2] = *a2;
  result[3] = v4;
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void *UC::UCSymbolFrequencyTable::UCSymbolFrequencyTable(void *result, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[1];
  void *result = *a3;
  result[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  result[2] = 0;
  result[3] = 0;
  result[4] = a2;
  return result;
}

uint64_t UC::UCSymbolFrequencyTable::getFrequencyForSymbol(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 16);
  if (v3)
  {
    uint64_t v4 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(v3, (unsigned __int8 *)a2);
    if (!v4) {
      std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
    }
    return *((unsigned __int16 *)v4 + 20);
  }
  else
  {
    long long v6 = *(_DWORD **)(a1 + 32);
    if (*(char *)(a2 + 23) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    }
    else {
      std::string __p = *(std::string *)a2;
    }
    uint64_t FrequencyForSymbol = UC::UCMultiContextSymbolFrequencyTrie::Node::getFrequencyForSymbol(v6, (unsigned __int8 *)&__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  return FrequencyForSymbol;
}

void sub_22E88A7B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *UC::SUE::UCSegmentedURLEncodingResult::HostResult::HostResult(std::string *this, long long *a2, std::string::value_type a3, int a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v7 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v7;
  }
  this[1].__r_.__value_.__s.__data_[0] = a3;
  HIDWORD(this[1].__r_.__value_.__r.__words[0]) = a4;
  return this;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::HostResult::getFormatType(UC::SUE::UCSegmentedURLEncodingResult::HostResult *this)
{
  return *((unsigned int *)this + 7);
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::getHostEncodingResult(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  return *((void *)this + 5);
}

void UC::SUE::UCSegmentedURLEncodingResult::setHostEncodingResult(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a2 = 0;
  uint64_t v5 = *(void ***)(a1 + 40);
  uint64_t v3 = (void *)(a1 + 40);
  uint64_t v4 = v5;
  void *v3 = v2;
  if (v5) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)v3, v4);
  }
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::setTemplateType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 24) = a2;
  return result;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::getTemplateType(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  return *((unsigned int *)this + 6);
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::setSpecialSubdomainType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 28) = a2;
  return result;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::setNonTemplatePathAndQueryEncodeType(uint64_t result, int a2)
{
  *(_DWORD *)(result + 32) = a2;
  return result;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::getNonTemplatePathAndQueryEncodeType(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  return *((unsigned int *)this + 8);
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::setHasPathOrQuery(uint64_t this, char a2)
{
  *(unsigned char *)(this + 48) = a2;
  return this;
}

uint64_t UC::SUE::UCSegmentedURLEncodingResult::getHasPathOrQuery(UC::SUE::UCSegmentedURLEncodingResult *this)
{
  return *((unsigned __int8 *)this + 48);
}

void sub_22E88A990(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E88AA78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E88AB48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E88AC58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22E88AF50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void **a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  int64_t v36 = a12;
  a12 = 0;
  if (v36) {
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&a12, v36);
  }
  std::string v37 = a18;
  a18 = 0;
  if (v37) {
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&a18, v37);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (v31) {
      void *v31 = (id)[v32 _errorWithCoderErrorCode:1002 message:@"Decoding of the data failed. The data is malformed"];
    }
    __cxa_end_catch();
    JUMPOUT(0x22E88AF18);
  }

  _Unwind_Resume(a1);
}

void sub_22E88B454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void **__p, void **a17)
{
  operator delete(v20);
  long long v23 = __p;
  std::string __p = 0;
  if (v23) {
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&__p, v23);
  }
  unint64_t v24 = a17;
  a17 = 0;
  if (v24) {
    std::default_delete<UC::UCBitVector>::operator()[abi:ne180100]((int)&a17, v24);
  }
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    if (v18) {
      *float v18 = (id)[v19 _errorWithCoderErrorCode:1002 message:@"Decoding of the data failed. The data is malformed"];
    }
    __cxa_end_catch();
    JUMPOUT(0x22E88B3E4);
  }

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

UC::SUE::PrefixedURLDecoderImpl *UC::SUE::PrefixedURLDecoderImpl::PrefixedURLDecoderImpl(UC::SUE::PrefixedURLDecoderImpl *this, uint64_t a2)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  createHexDecimalCoder(&v8);
  long long v4 = v8;
  long long v8 = 0uLL;
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 1);
  *(_OWORD *)this = v4;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    if (*((void *)&v8 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
    }
  }
  createAllowedPrefixes(a2, &v8);
  long long v6 = (std::__shared_weak_count *)*((void *)this + 3);
  *((_OWORD *)this + 1) = v8;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return this;
}

void sub_22E88B6B0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 24);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  long long v4 = *(std::__shared_weak_count **)(v1 + 8);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(exception_object);
}

void createHexDecimalCoder(void *a1@<X8>)
{
  *(void *)&long long v24 = *MEMORY[0x263EF8340];
  std::string::basic_string[abi:ne180100]<0>(&v8, "0");
  std::string::basic_string[abi:ne180100]<0>(v9, "1");
  std::string::basic_string[abi:ne180100]<0>(v10, "2");
  std::string::basic_string[abi:ne180100]<0>(v11, "3");
  std::string::basic_string[abi:ne180100]<0>(v12, "4");
  std::string::basic_string[abi:ne180100]<0>(v13, "5");
  std::string::basic_string[abi:ne180100]<0>(v14, "6");
  std::string::basic_string[abi:ne180100]<0>(v15, "7");
  std::string::basic_string[abi:ne180100]<0>(v16, "8");
  std::string::basic_string[abi:ne180100]<0>(v17, "9");
  std::string::basic_string[abi:ne180100]<0>(v18, "a");
  std::string::basic_string[abi:ne180100]<0>(v19, "b");
  std::string::basic_string[abi:ne180100]<0>(v20, "c");
  std::string::basic_string[abi:ne180100]<0>(v21, "d");
  std::string::basic_string[abi:ne180100]<0>(v22, "e");
  std::string::basic_string[abi:ne180100]<0>(v23, "f");
  uint64_t v3 = 0;
  long long v4 = 0;
  uint64_t v5 = 0;
  long long v6 = &v3;
  char v7 = 0;
  uint64_t v3 = (std::string *)operator new(0x180uLL);
  long long v4 = v3;
  uint64_t v5 = (long long *)&v3[16];
  long long v4 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v5, &v8, &v24, v3);
  uint64_t v2 = 48;
  do
  {
    if (*((char *)&v9[v2 - 1] - 1) < 0) {
      operator delete((&v6)[v2]);
    }
    v2 -= 3;
  }
  while (v2 * 8);
  LODWORD(v6) = 4;
  std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string> const&,void>((long long **)&v3, &v8);
  std::allocate_shared[abi:ne180100]<UC::UCFixedLengthCoder,std::allocator<UC::UCFixedLengthCoder>,int,std::shared_ptr<std::vector<std::string>>,void>((char *)&v6, &v8, a1);
  if (*((void *)&v8 + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
  }
  *(void *)&long long v8 = &v3;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v8);
}

void sub_22E88B93C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void **a16, std::__shared_weak_count *a17)
{
  if (a17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a17);
  }
  a16 = (void **)&a10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a16);
  _Unwind_Resume(a1);
}

void createAllowedPrefixes(uint64_t a1@<X0>, void *a2@<X8>)
{
  long long v4 = (char *)operator new(0x40uLL);
  *((void *)v4 + 1) = 0;
  *((void *)v4 + 2) = 0;
  *(void *)long long v4 = &unk_26E2430C0;
  *(_OWORD *)(v4 + 24) = 0u;
  uint64_t v5 = (uint64_t)(v4 + 24);
  *(_OWORD *)(v4 + 40) = 0u;
  *((_DWORD *)v4 + 14) = 1065353216;
  *a2 = v4 + 24;
  a2[1] = v4;
  switch(a1)
  {
    case 3:
      int v6 = 0;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://appclip.apple.com/rx?p=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      break;
    case 2:
      int v6 = 0;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://appclip.apple.com/pair?p=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      break;
    case 1:
      int v6 = 0;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://appclip.apple.com/rx?p=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
      int v6 = 1;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://apple.com/shop/mnf?s=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
      int v6 = 2;
      std::string::basic_string[abi:ne180100]<0>(__p, "https://wallet.apple.com/remoteRequest/?t=");
      std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(v5, &v6, (uint64_t)&v6);
      break;
    default:
      return;
  }
  if (v8 < 0) {
    operator delete(__p[0]);
  }
}

void sub_22E88BB78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v15);
  _Unwind_Resume(a1);
}

void UC::SUE::PrefixedURLDecoderImpl::decodeURL(UC::SUE::PrefixedURLDecoderImpl *this@<X0>, UC::UCBitStream *a2@<X1>, uint64_t a3@<X8>)
{
  int v6 = 0;
  int v7 = 10;
  do
  {
    int v6 = UC::UCBitStream::readNextBit(a2) & 1 | (2 * v6);
    --v7;
  }
  while (v7);
  int v17 = v6;
  char v8 = std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::find<int>(*((void **)this + 2), &v17);
  if (!v8)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 7, "", 0, "Unsupported header format in encoded data", 41);
  }
  uint64_t v9 = v8;
  int v10 = 6;
  do
  {
    UC::UCBitStream::readNextBit(a2);
    --v10;
  }
  while (v10);
  long long v11 = *(void **)this;
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  (*(void (**)(void **__return_ptr, void *, UC::UCBitStream *, void **))(*v11 + 48))(v15, v11, a2, __p);
  if (v14 < 0) {
    operator delete(__p[0]);
  }
  std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)v9 + 3, (const void **)v15, a3);
  if (v16 < 0) {
    operator delete(v15[0]);
  }
}

void sub_22E88BD24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  __cxa_free_exception(v21);
  _Unwind_Resume(a1);
}

UC::SUE::PrefixedURLEncoderImpl *UC::SUE::PrefixedURLEncoderImpl::PrefixedURLEncoderImpl(UC::SUE::PrefixedURLEncoderImpl *this, uint64_t a2)
{
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  createHexDecimalCoder(&v8);
  long long v4 = v8;
  long long v8 = 0uLL;
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 1);
  *(_OWORD *)this = v4;
  if (v5)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    if (*((void *)&v8 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v8 + 1));
    }
  }
  createAllowedPrefixes(a2, &v8);
  int v6 = (std::__shared_weak_count *)*((void *)this + 3);
  *((_OWORD *)this + 1) = v8;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  return this;
}

void sub_22E88BDEC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 24);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  long long v4 = *(std::__shared_weak_count **)(v1 + 8);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  _Unwind_Resume(exception_object);
}

void UC::SUE::PrefixedURLEncoderImpl::encodeURL(UC::SUE::PrefixedURLEncoderImpl *this@<X0>, const UC::UCURLComponents *a2@<X1>, std::string *a3@<X8>)
{
  int v6 = (char *)a2 + 24;
  int v7 = *((char *)a2 + 47);
  if (v7 < 0)
  {
    if (*((void *)a2 + 4) != 5)
    {
LABEL_113:
      exception = __cxa_allocate_exception(0x58uLL);
      UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 1, "", 0, "Only encoding of the scheme https is supported", 46);
      goto LABEL_118;
    }
    int v6 = *(char **)v6;
  }
  else if (v7 != 5)
  {
    goto LABEL_113;
  }
  int v8 = *(_DWORD *)v6;
  int v9 = v6[4];
  if (v8 != 1886680168 || v9 != 115) {
    goto LABEL_113;
  }
  if (*((void *)a2 + 18))
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 2, "", 0, "Encoding of URLs with port is not supported", 43);
    goto LABEL_118;
  }
  uint64_t v11 = *((unsigned __int8 *)a2 + 175);
  if ((v11 & 0x80u) != 0) {
    uint64_t v11 = *((void *)a2 + 20);
  }
  if (v11)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 3, "", 0, "Encoding of URLs with user is not supported", 43);
    goto LABEL_118;
  }
  uint64_t v12 = *((unsigned __int8 *)a2 + 199);
  if ((v12 & 0x80u) != 0) {
    uint64_t v12 = *((void *)a2 + 23);
  }
  if (v12)
  {
    exception = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(exception, "UCPrefixedURLCoderErrorDomain", 29, 4, "", 0, "Encoding of URLs with password is not supported", 47);
LABEL_118:
  }
  long long v57 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  std::string v60 = 0;
  if (*((char *)a2 + 71) < 0) {
    std::string::__init_copy_ctor_external(&v56, *((const std::string::value_type **)a2 + 6), *((void *)a2 + 7));
  }
  else {
    std::string v56 = *(std::string *)((unsigned char *)a2 + 2);
  }
  tokenizeString((uint64_t)a2 + 96, 61, v55);
  std::string::size_type size = HIBYTE(v56.__r_.__value_.__r.__words[2]);
  if ((v56.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v56.__r_.__value_.__l.__size_;
  }
  if (!size)
  {
    uint64_t v51 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v51, "UCPrefixedURLCoderErrorDomain", 0x1DuLL, 5, "", 0, "The URL must have a host component", 0x22uLL);
    goto LABEL_122;
  }
  uint64_t v14 = *((unsigned __int8 *)a2 + 143);
  if ((v14 & 0x80u) != 0) {
    uint64_t v14 = *((void *)a2 + 16);
  }
  if (v14)
  {
    uint64_t v51 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v51, "UCPrefixedURLCoderErrorDomain", 0x1DuLL, 8, "", 0, "Prefixed URL must not have fragment", 0x23uLL);
    goto LABEL_122;
  }
  if (v55[1] - v55[0] != 48)
  {
    uint64_t v51 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v51, "UCPrefixedURLCoderErrorDomain", 0x1DuLL, 8, "", 0, "Prefixed URL must have exactly one query parameter", 0x32uLL);
LABEL_122:
  }
  std::operator+<char>();
  int v15 = *((char *)a2 + 95);
  if (v15 >= 0) {
    char v16 = (char *)a2 + 72;
  }
  else {
    char v16 = (const std::string::value_type *)*((void *)a2 + 9);
  }
  if (v15 >= 0) {
    std::string::size_type v17 = *((unsigned __int8 *)a2 + 95);
  }
  else {
    std::string::size_type v17 = *((void *)a2 + 10);
  }
  float v18 = std::string::append(&v52, v16, v17);
  long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  v53.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v53.__r_.__value_.__l.__data_ = v19;
  v18->__r_.__value_.__l.__size_ = 0;
  v18->__r_.__value_.__r.__words[2] = 0;
  v18->__r_.__value_.__r.__words[0] = 0;
  unint64_t v20 = std::string::append(&v53, "?");
  long long v21 = *(_OWORD *)&v20->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v20->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v21;
  v20->__r_.__value_.__l.__size_ = 0;
  v20->__r_.__value_.__r.__words[2] = 0;
  v20->__r_.__value_.__r.__words[0] = 0;
  int v22 = *(char *)(v55[0] + 23);
  if (v22 >= 0) {
    long long v23 = (const std::string::value_type *)v55[0];
  }
  else {
    long long v23 = *(const std::string::value_type **)v55[0];
  }
  if (v22 >= 0) {
    std::string::size_type v24 = *(unsigned __int8 *)(v55[0] + 23);
  }
  else {
    std::string::size_type v24 = *(void *)(v55[0] + 8);
  }
  char v25 = std::string::append(&__str, v23, v24);
  long long v26 = *(_OWORD *)&v25->__r_.__value_.__l.__data_;
  v62.__r_.__value_.__r.__words[2] = v25->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v62.__r_.__value_.__l.__data_ = v26;
  v25->__r_.__value_.__l.__size_ = 0;
  v25->__r_.__value_.__r.__words[2] = 0;
  v25->__r_.__value_.__r.__words[0] = 0;
  long long v27 = std::string::append(&v62, "=");
  std::string __p = *v27;
  v27->__r_.__value_.__l.__size_ = 0;
  v27->__r_.__value_.__r.__words[2] = 0;
  v27->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v62.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v53.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  std::string v28 = *(uint64_t **)(*((void *)this + 2) + 16);
  if (!v28)
  {
LABEL_114:
    char v50 = __cxa_allocate_exception(0x58uLL);
    UC::Exception::CoderError::CoderError(v50, "UCPrefixedURLCoderErrorDomain", 0x1DuLL, 8, "", 0, "Encoding of URL with unsupported URL prefix", 0x2BuLL);
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v29 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v29 = __p.__r_.__value_.__l.__size_;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  unsigned int v31 = -1;
  do
  {
    uint64_t v32 = *((unsigned __int8 *)v28 + 47);
    if ((v32 & 0x80u) == 0) {
      uint64_t v33 = *((unsigned __int8 *)v28 + 47);
    }
    else {
      uint64_t v33 = v28[4];
    }
    if (v33 == v29)
    {
      std::string v34 = (const void **)(v28 + 3);
      if ((v32 & 0x80) != 0)
      {
        if (memcmp(*v34, p_p, v28[4])) {
          goto LABEL_68;
        }
LABEL_67:
        unsigned int v31 = *((_DWORD *)v28 + 4);
        goto LABEL_68;
      }
      if (!*((unsigned char *)v28 + 47)) {
        goto LABEL_67;
      }
      std::string v35 = p_p;
      while (*(unsigned __int8 *)v34 == v35->__r_.__value_.__s.__data_[0])
      {
        std::string v34 = (const void **)((char *)v34 + 1);
        std::string v35 = (std::string *)((char *)v35 + 1);
        if (!--v32) {
          goto LABEL_67;
        }
      }
    }
LABEL_68:
    std::string v28 = (uint64_t *)*v28;
  }
  while (v28);
  if (v31 == -1) {
    goto LABEL_114;
  }
  unsigned int v36 = 0;
  memset(&v53, 0, sizeof(v53));
  do
  {
    if (v31) {
      std::string v37 = "1";
    }
    else {
      std::string v37 = "0";
    }
    uint64_t v38 = (const void **)std::string::basic_string[abi:ne180100]<0>(&v62, v37);
    std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v38, (const void **)&v53.__r_.__value_.__l.__data_, (uint64_t)&__str);
    if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v53.__r_.__value_.__l.__data_);
    }
    std::string v53 = __str;
    if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v62.__r_.__value_.__l.__data_);
    }
    v31 >>= 1;
  }
  while (v36++ < 9);
  uint64_t v40 = *(void *)this;
  tokenizeString(v55[0] + 24, 0, (uint64_t *)&__str);
  (*(void (**)(std::string *__return_ptr, uint64_t, std::string *))(*(void *)v40 + 40))(&v62, v40, &__str);
  v52.__r_.__value_.__r.__words[0] = (std::string::size_type)&__str;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  a3[1].__r_.__value_.__r.__words[2] = 0;
  if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v41 = HIBYTE(v53.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v41 = v53.__r_.__value_.__l.__size_;
  }
  uint64_t v42 = &v52;
  std::string::basic_string[abi:ne180100]((uint64_t)&v52, v41 + 6);
  if ((v52.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    uint64_t v42 = (std::string *)v52.__r_.__value_.__r.__words[0];
  }
  if (v41)
  {
    if ((v53.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      uint64_t v43 = &v53;
    }
    else {
      uint64_t v43 = (std::string *)v53.__r_.__value_.__r.__words[0];
    }
    memmove(v42, v43, v41);
  }
  memset((char *)v42 + v41, 48, 6);
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v44 = &v62;
  }
  else {
    uint64_t v44 = (std::string *)v62.__r_.__value_.__r.__words[0];
  }
  if ((v62.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type v45 = HIBYTE(v62.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type v45 = v62.__r_.__value_.__l.__size_;
  }
  __int16 v46 = std::string::append(&v52, (const std::string::value_type *)v44, v45);
  long long v47 = *(_OWORD *)&v46->__r_.__value_.__l.__data_;
  __str.__r_.__value_.__r.__words[2] = v46->__r_.__value_.__r.__words[2];
  *(_OWORD *)&__str.__r_.__value_.__l.__data_ = v47;
  v46->__r_.__value_.__l.__size_ = 0;
  v46->__r_.__value_.__r.__words[2] = 0;
  v46->__r_.__value_.__r.__words[0] = 0;
  UC::SUE::UCSegmentedURLEncodingResult::setEncodingBits(a3, &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__str.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v52.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v52.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v62.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v62.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v53.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  v62.__r_.__value_.__r.__words[0] = (std::string::size_type)v55;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v62);
  if (SHIBYTE(v56.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v56.__r_.__value_.__l.__data_);
  }
  uint64_t v48 = (void **)v60;
  std::string v60 = 0;
  if (v48) {
    std::default_delete<UC::SUE::UCSegmentedURLEncodingResult::HostResult>::operator()[abi:ne180100]((int)&v60, v48);
  }
  if (SHIBYTE(v59) < 0) {
    operator delete(v57);
  }
}

void sub_22E88C5A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29,uint64_t a30,uint64_t a31,void *__p,uint64_t a33,int a34,__int16 a35,char a36,char a37,char a38)
{
}

void tokenizeString(uint64_t a1@<X0>, int a2@<W1>, uint64_t *a3@<X8>)
{
  unsigned __int8 v3 = a2;
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  if (a2)
  {
    std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]((uint64_t *)&v19, (const std::string *)a1, 24);
    __p[0] = 0;
    __p[1] = 0;
    uint64_t v18 = 0;
    while (1)
    {
      uint64_t v5 = std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&v19, (uint64_t)__p, v3);
      if ((*((unsigned char *)v5 + *(void *)(*v5 - 24) + 32) & 5) != 0) {
        break;
      }
      unint64_t v6 = a3[1];
      if (v6 >= a3[2])
      {
        uint64_t v8 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (long long *)__p);
      }
      else
      {
        if (SHIBYTE(v18) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a3[1], (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          long long v7 = *(_OWORD *)__p;
          *(void *)(v6 + 16) = v18;
          *(_OWORD *)unint64_t v6 = v7;
        }
        uint64_t v8 = v6 + 24;
        a3[1] = v6 + 24;
      }
      a3[1] = v8;
    }
    if (SHIBYTE(v18) < 0) {
      operator delete(__p[0]);
    }
    v19.__r_.__value_.__r.__words[0] = *MEMORY[0x263F8C2B8];
    std::string::size_type v9 = *(void *)(MEMORY[0x263F8C2B8] + 72);
    *(std::string::size_type *)((char *)v19.__r_.__value_.__r.__words
                              + *(void *)(v19.__r_.__value_.__r.__words[0] - 24)) = *(void *)(MEMORY[0x263F8C2B8]
                                                                                                + 64);
    v19.__r_.__value_.__r.__words[2] = v9;
    uint64_t v20 = MEMORY[0x263F8C318] + 16;
    if (v22 < 0) {
      operator delete(v21);
    }
    std::streambuf::~streambuf();
    std::iostream::~basic_iostream();
    MEMORY[0x230FA7120](&v23);
  }
  else
  {
    int v10 = *(char *)(a1 + 23);
    if (v10 >= 0) {
      uint64_t v11 = (std::string::value_type *)a1;
    }
    else {
      uint64_t v11 = *(std::string::value_type **)a1;
    }
    if (v10 >= 0) {
      uint64_t v12 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      uint64_t v12 = *(void *)(a1 + 8);
    }
    for (; v12; --v12)
    {
      std::string::value_type v13 = *v11;
      memset(&v19, 0, sizeof(v19));
      std::string::push_back(&v19, v13);
      unint64_t v14 = a3[1];
      if (v14 >= a3[2])
      {
        uint64_t v16 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a3, (long long *)&v19);
      }
      else
      {
        if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a3[1], v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v15 = *(_OWORD *)&v19.__r_.__value_.__l.__data_;
          *(void *)(v14 + 16) = *((void *)&v19.__r_.__value_.__l + 2);
          *(_OWORD *)unint64_t v14 = v15;
        }
        uint64_t v16 = v14 + 24;
        a3[1] = v14 + 24;
      }
      a3[1] = v16;
      if (SHIBYTE(v19.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v19.__r_.__value_.__l.__data_);
      }
      ++v11;
    }
  }
}

void sub_22E88C9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
}

uint64_t std::allocate_shared[abi:ne180100]<std::vector<std::string>,std::allocator<std::vector<std::string>>,std::vector<std::string> const&,void>@<X0>(long long **a1@<X1>, void *a2@<X8>)
{
  long long v4 = (char *)operator new(0x30uLL);
  uint64_t result = std::__shared_ptr_emplace<std::vector<std::string>>::__shared_ptr_emplace[abi:ne180100]<std::vector<std::string> const&,std::allocator<std::vector<std::string>>,0>((uint64_t)v4, a1);
  *a2 = v4 + 24;
  a2[1] = v4;
  return result;
}

void sub_22E88CA8C(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t std::__shared_ptr_emplace<std::vector<std::string>>::__shared_ptr_emplace[abi:ne180100]<std::vector<std::string> const&,std::allocator<std::vector<std::string>>,0>(uint64_t a1, long long **a2)
{
  *(_OWORD *)(a1 + 8) = 0u;
  *(void *)a1 = &unk_26E242C90;
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 24) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)(a1 + 24), *a2, a2[1], 0xAAAAAAAAAAAAAAABLL * (((char *)a2[1] - (char *)*a2) >> 3));
  return a1;
}

void sub_22E88CB10(_Unwind_Exception *a1)
{
  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_emplace<std::unordered_map<int,std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E2430C0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<std::unordered_map<int,std::string>>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26E2430C0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t std::__shared_ptr_emplace<std::unordered_map<int,std::string>>::__on_zero_shared(uint64_t a1)
{
  return std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::~__hash_table(a1 + 24);
}

uint64_t std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    uint64_t v2 = __p;
    do
    {
      unsigned __int8 v3 = (void **)*v2;
      if (*((char *)v2 + 47) < 0) {
        operator delete(v2[3]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

char *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::__emplace_unique_key_args<int,std::pair<int const,std::string>>(uint64_t a1, int *a2, uint64_t a3)
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
    std::string::size_type v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      int v10 = (char *)*v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = *((void *)v10 + 1);
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == v6) {
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
          int v10 = *(char **)v10;
        }
        while (v10);
      }
    }
  }
  uint64_t v12 = (void *)(a1 + 16);
  int v10 = (char *)operator new(0x30uLL);
  *(void *)int v10 = 0;
  *((void *)v10 + 1) = v6;
  *((_DWORD *)v10 + 4) = *(_DWORD *)a3;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)(a3 + 8);
  *((void *)v10 + 5) = *(void *)(a3 + 24);
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v7 || (float)(v14 * (float)v7) < v13)
  {
    BOOL v15 = 1;
    if (v7 >= 3) {
      BOOL v15 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v7);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v18);
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
  uint64_t v19 = *(void *)a1;
  uint64_t v20 = *(void **)(*(void *)a1 + 8 * v3);
  if (v20)
  {
    *(void *)int v10 = *v20;
LABEL_38:
    *uint64_t v20 = v10;
    goto LABEL_39;
  }
  *(void *)int v10 = *v12;
  *uint64_t v12 = v10;
  *(void *)(v19 + 8 * v3) = v12;
  if (*(void *)v10)
  {
    unint64_t v21 = *(void *)(*(void *)v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v21 >= v7) {
        v21 %= v7;
      }
    }
    else
    {
      v21 &= v7 - 1;
    }
    uint64_t v20 = (void *)(*(void *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return v10;
}

void sub_22E88CE60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](v11, v10);
  _Unwind_Resume(a1);
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<int,std::string>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    if (*((char *)__p + 47) < 0) {
      operator delete(__p[3]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t *std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100](uint64_t *a1, const std::string *a2, int a3)
{
  uint64_t v6 = MEMORY[0x263F8C328] + 104;
  a1[16] = MEMORY[0x263F8C328] + 104;
  unint64_t v7 = a1 + 2;
  uint64_t v8 = MEMORY[0x263F8C328] + 64;
  a1[2] = MEMORY[0x263F8C328] + 64;
  uint64_t v9 = (uint64_t)(a1 + 3);
  int v10 = (void *)MEMORY[0x263F8C2B8];
  uint64_t v11 = *(void *)(MEMORY[0x263F8C2B8] + 24);
  uint64_t v12 = *(void *)(MEMORY[0x263F8C2B8] + 16);
  *a1 = v12;
  *(uint64_t *)((char *)a1 + *(void *)(v12 - 24)) = v11;
  a1[1] = 0;
  float v13 = (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24));
  std::ios_base::init(v13, a1 + 3);
  uint64_t v14 = MEMORY[0x263F8C328] + 24;
  v13[1].__vftable = 0;
  v13[1].__fmtflags_ = -1;
  uint64_t v15 = v10[5];
  uint64_t v16 = v10[4];
  a1[2] = v16;
  *(void *)((char *)v7 + *(void *)(v16 - 24)) = v15;
  uint64_t v17 = v10[1];
  *a1 = v17;
  *(uint64_t *)((char *)a1 + *(void *)(v17 - 24)) = v10[6];
  *a1 = v14;
  a1[16] = v6;
  a1[2] = v8;
  std::stringbuf::basic_stringbuf[abi:ne180100](v9, a2, a3);
  return a1;
}

void sub_22E88D178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void *std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, uint64_t a2, unsigned __int8 a3)
{
  MEMORY[0x230FA6FF0](&v11, a1, 1);
  if (!v11) {
    return a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    **(unsigned char **)a2 = 0;
    *(void *)(a2 + 8) = 0;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 23) = 0;
  }
  uint64_t v6 = 0;
  while (1)
  {
    unint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24) + 40);
    uint64_t v8 = (unsigned char *)v7[3];
    if (v8 != (unsigned char *)v7[4])
    {
      void v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }
    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80))(v7);
    if (v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    std::string::push_back((std::string *)a2, (std::string::value_type)v7);
    --v6;
    if (*(char *)(a2 + 23) < 0 && *(void *)(a2 + 8) == 0x7FFFFFFFFFFFFFF7)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }
  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear((std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24) + 32) | v9);
  return a1;
}

void sub_22E88D300(void *a1)
{
  __cxa_begin_catch(a1);
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24) + 32) |= 1u;
  if ((*((unsigned char *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x22E88D2C0);
  }
  __cxa_rethrow();
}

void sub_22E88D37C(_Unwind_Exception *a1)
{
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
  MEMORY[0x230FA7120](a1 + 128);
  return a1;
}

uint64_t *std::__hash_table<std::__hash_value_type<int,std::string>,std::__unordered_map_hasher<int,std::__hash_value_type<int,std::string>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,std::string>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,std::string>>>::find<int>(void *a1, int *a2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    unint64_t v5 = *a2;
    if (*(void *)&v2 <= v3) {
      unint64_t v5 = v3 % *(void *)&v2;
    }
  }
  else
  {
    unint64_t v5 = (*(void *)&v2 - 1) & v3;
  }
  uint64_t v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6) {
    return 0;
  }
  for (uint64_t result = *v6; result; uint64_t result = (uint64_t *)*result)
  {
    unint64_t v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == v3) {
        return result;
      }
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(void *)&v2) {
          v8 %= *(void *)&v2;
        }
      }
      else
      {
        v8 &= *(void *)&v2 - 1;
      }
      if (v8 != v5) {
        return 0;
      }
    }
  }
  return result;
}

void UC::SplitString(unsigned __int8 *a1, uint64_t a2, unsigned __int8 a3, uint64_t *a4)
{
  memset(&v15, 0, sizeof(v15));
  if (!a2) {
    goto LABEL_23;
  }
  uint64_t v6 = a2;
  do
  {
    int v8 = *a1;
    if (v8 == a3)
    {
      unint64_t v9 = a4[1];
      if (v9 >= a4[2])
      {
        uint64_t v11 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a4, (long long *)&v15);
      }
      else
      {
        if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)a4[1], v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
        }
        else
        {
          long long v10 = *(_OWORD *)&v15.__r_.__value_.__l.__data_;
          *(void *)(v9 + 16) = *((void *)&v15.__r_.__value_.__l + 2);
          *(_OWORD *)unint64_t v9 = v10;
        }
        uint64_t v11 = v9 + 24;
        a4[1] = v9 + 24;
      }
      a4[1] = v11;
      MEMORY[0x230FA6F20](&v15, "");
    }
    else
    {
      std::string::push_back(&v15, v8);
    }
    ++a1;
    --v6;
  }
  while (v6);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
  {
    if (!v15.__r_.__value_.__l.__size_) {
      goto LABEL_23;
    }
    unint64_t v12 = a4[1];
    if (v12 < a4[2])
    {
      std::string::__init_copy_ctor_external((std::string *)a4[1], v15.__r_.__value_.__l.__data_, v15.__r_.__value_.__l.__size_);
      goto LABEL_20;
    }
LABEL_21:
    uint64_t v14 = std::vector<std::string>::__push_back_slow_path<std::string const&>(a4, (long long *)&v15);
    goto LABEL_22;
  }
  if (!*((unsigned char *)&v15.__r_.__value_.__s + 23)) {
    goto LABEL_23;
  }
  unint64_t v12 = a4[1];
  if (v12 >= a4[2]) {
    goto LABEL_21;
  }
  long long v13 = *(_OWORD *)&v15.__r_.__value_.__l.__data_;
  *(void *)(v12 + 16) = *((void *)&v15.__r_.__value_.__l + 2);
  *(_OWORD *)unint64_t v12 = v13;
LABEL_20:
  uint64_t v14 = v12 + 24;
  a4[1] = v12 + 24;
LABEL_22:
  a4[1] = v14;
LABEL_23:
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }
}

void sub_22E88DBF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)(v15 + 8) = v16;
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

std::string *UC::JoinString@<X0>(std::string *result@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  std::string::size_type v2 = result->__r_.__value_.__r.__words[0];
  std::string::size_type size = result->__r_.__value_.__l.__size_;
  if (result->__r_.__value_.__r.__words[0] != size)
  {
    do
    {
      int v5 = *(char *)(v2 + 23);
      if (v5 >= 0) {
        uint64_t v6 = (const std::string::value_type *)v2;
      }
      else {
        uint64_t v6 = *(const std::string::value_type **)v2;
      }
      if (v5 >= 0) {
        std::string::size_type v7 = *(unsigned __int8 *)(v2 + 23);
      }
      else {
        std::string::size_type v7 = *(void *)(v2 + 8);
      }
      uint64_t result = std::string::append(a2, v6, v7);
      v2 += 24;
    }
    while (v2 != size);
  }
  return result;
}

void sub_22E88DC94(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t UC::IsAllDigits(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 1;
  }
  uint64_t v2 = a2 - 1;
  do
  {
    int v3 = *a1++;
    BOOL v4 = (v3 - 48) < 0xA;
  }
  while ((v3 - 48) <= 9 && v2-- != 0);
  return v4;
}

uint64_t UC::UCFixedLengthCoder::UCFixedLengthCoder(uint64_t result, char a2, void *a3)
{
  *(void *)uint64_t result = &unk_26E243138;
  *(unsigned char *)(result + 8) = a2;
  uint64_t v3 = a3[1];
  *(void *)(result + 16) = *a3;
  *(void *)(result + 24) = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(result + 32) = 0;
  return result;
}

void UC::UCFixedLengthCoder::_initializeForEncoding(UC::UCFixedLengthCoder *this)
{
  uint64_t v1 = (uint64_t *)((char *)this + 32);
  if (!*((void *)this + 4))
  {
    uint64_t v3 = operator new(0x28uLL);
    _OWORD *v3 = 0u;
    v3[1] = 0u;
    *((_DWORD *)v3 + 8) = 1065353216;
    std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100](v1, (uint64_t)v3);
    if (-1431655765
       * ((uint64_t)(*(void *)(*((void *)this + 2) + 8) - **((void **)this + 2)) >> 3))
    {
      unint64_t v4 = 0;
      uint64_t v5 = -1431655765
         * ((uint64_t)(*(void *)(*((void *)this + 2) + 8) - **((void **)this + 2)) >> 3);
      do
      {
        uint64_t v6 = (uint64_t *)*((void *)this + 2);
        uint64_t v7 = *v6;
        if (0xAAAAAAAAAAAAAAABLL * ((v6[1] - *v6) >> 3) <= v4) {
          std::vector<std::string>::__throw_out_of_range[abi:ne180100]();
        }
        uint64_t v8 = *((void *)this + 4);
        unsigned int v9 = *((unsigned __int8 *)this + 8);
        __p[1] = 0;
        uint64_t v14 = 0;
        __p[0] = 0;
        if (v9)
        {
          unsigned int v10 = 0;
          unint64_t v11 = v4;
          do
          {
            if (v11) {
              unint64_t v12 = "1";
            }
            else {
              unint64_t v12 = "0";
            }
            std::string::basic_string[abi:ne180100]<0>(v17, v12);
            std::operator+[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>((const void **)v17, (const void **)__p, (uint64_t)&v15);
            if (SHIBYTE(v14) < 0) {
              operator delete(__p[0]);
            }
            *(_OWORD *)std::string __p = v15;
            uint64_t v14 = v16;
            if (v18 < 0) {
              operator delete(v17[0]);
            }
            v11 >>= 1;
            ++v10;
          }
          while (v10 < v9);
        }
        std::unordered_map<std::string,std::string>::insert_or_assign[abi:ne180100]<std::string>(v8, (unsigned __int8 *)(v7 + 24 * v4), (__n128 *)__p);
        if (SHIBYTE(v14) < 0) {
          operator delete(__p[0]);
        }
        ++v4;
      }
      while (v4 != v5);
    }
  }
}

void sub_22E88DEAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unsigned __int8 *std::unordered_map<std::string,std::string>::insert_or_assign[abi:ne180100]<std::string>(uint64_t a1, unsigned __int8 *a2, __n128 *a3)
{
  unint64_t v4 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string>(a1, a2, (uint64_t)a2, a3);
  uint64_t v5 = v4;
  if (!v6)
  {
    uint64_t v7 = (void **)(v4 + 40);
    if ((char)v4[63] < 0) {
      operator delete(*v7);
    }
    __n128 v8 = *a3;
    *((void *)v5 + 7) = a3[1].n128_u64[0];
    *(__n128 *)uint64_t v7 = v8;
    a3[1].n128_u8[7] = 0;
    a3->n128_u8[0] = 0;
  }
  return v5;
}

void UC::UCFixedLengthCoder::encode(UC::UCFixedLengthCoder *a1@<X0>, unsigned __int8 *a2@<X1>, std::string *a3@<X8>)
{
  UC::UCFixedLengthCoder::_initializeForEncoding(a1);
  char v6 = std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(*((void **)a1 + 4), a2);
  if (!v6) {
    std::__throw_out_of_range[abi:ne180100]("unordered_map::at: key not found");
  }
  if ((char)v6[63] < 0)
  {
    __n128 v8 = (const std::string::value_type *)*((void *)v6 + 5);
    std::string::size_type v9 = *((void *)v6 + 6);
    std::string::__init_copy_ctor_external(a3, v8, v9);
  }
  else
  {
    long long v7 = *(_OWORD *)(v6 + 40);
    a3->__r_.__value_.__r.__words[2] = *((void *)v6 + 7);
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v7;
  }
}

void UC::UCFixedLengthCoder::encode(uint64_t a1@<X0>, uint64_t *a2@<X1>, std::string *a3@<X8>)
{
  a3->__r_.__value_.__r.__words[0] = 0;
  a3->__r_.__value_.__l.__size_ = 0;
  a3->__r_.__value_.__r.__words[2] = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  if (*a2 != v4)
  {
    do
    {
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 32))(__p, a1, v3);
      if ((v10 & 0x80u) == 0) {
        long long v7 = __p;
      }
      else {
        long long v7 = (void **)__p[0];
      }
      if ((v10 & 0x80u) == 0) {
        std::string::size_type v8 = v10;
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(a3, (const std::string::value_type *)v7, v8);
      if ((char)v10 < 0) {
        operator delete(__p[0]);
      }
      v3 += 24;
    }
    while (v3 != v4);
  }
}

void sub_22E88E0AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void UC::UCFixedLengthCoder::decode(UC::UCBitStream *this@<X1>, uint64_t a2@<X0>, unsigned __int8 *a3@<X2>, std::string *a4@<X8>)
{
  a4->__r_.__value_.__r.__words[0] = 0;
  a4->__r_.__value_.__l.__size_ = 0;
  a4->__r_.__value_.__r.__words[2] = 0;
  while (UC::UCBitStream::hasMore(this))
  {
    (*(void (**)(void **__return_ptr, uint64_t, UC::UCBitStream *))(*(void *)a2 + 56))(&__s1, a2, this);
    uint64_t v8 = v20;
    int v9 = (char)v20;
    if ((v20 & 0x80u) == 0) {
      std::string::size_type v10 = v20;
    }
    else {
      std::string::size_type v10 = __n;
    }
    uint64_t v11 = a3[23];
    int v12 = (char)v11;
    if ((v11 & 0x80u) != 0) {
      uint64_t v11 = *((void *)a3 + 1);
    }
    if (v10 == v11)
    {
      if (v12 >= 0) {
        long long v13 = a3;
      }
      else {
        long long v13 = *(unsigned __int8 **)a3;
      }
      if ((char)v20 < 0)
      {
        uint64_t v16 = __s1;
        if (!memcmp(__s1, v13, __n))
        {
          operator delete(v16);
          return;
        }
      }
      else
      {
        if (!v20) {
          return;
        }
        p_s1 = &__s1;
        while (*(unsigned __int8 *)p_s1 == *v13)
        {
          p_s1 = (void **)((char *)p_s1 + 1);
          ++v13;
          if (!--v8)
          {
            char v15 = 0;
            if ((v20 & 0x80) == 0) {
              goto LABEL_24;
            }
            goto LABEL_26;
          }
        }
      }
    }
    if (v9 >= 0) {
      uint64_t v17 = (const std::string::value_type *)&__s1;
    }
    else {
      uint64_t v17 = (const std::string::value_type *)__s1;
    }
    std::string::append(a4, v17, v10);
    char v15 = 1;
    if ((v20 & 0x80) != 0)
    {
LABEL_26:
      operator delete(__s1);
      if ((v15 & 1) == 0) {
        return;
      }
    }
    else
    {
LABEL_24:
      if ((v15 & 1) == 0) {
        return;
      }
    }
  }
}

void sub_22E88E23C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (*(char *)(v15 + 23) < 0) {
    operator delete(*(void **)v15);
  }
  _Unwind_Resume(exception_object);
}

void UC::UCFixedLengthCoder::decodeNextSymbol(UC::UCFixedLengthCoder *this@<X0>, UC::UCBitStream *a2@<X1>, std::string *a3@<X8>)
{
  if (*((unsigned char *)this + 8))
  {
    int v6 = 0;
    LODWORD(v7) = 0;
    while (UC::UCBitStream::hasMore(a2))
    {
      unint64_t v7 = UC::UCBitStream::readNextBit(a2) | (2 * v7);
      if (++v6 >= *((unsigned __int8 *)this + 8)) {
        goto LABEL_7;
      }
    }
    goto LABEL_13;
  }
  unint64_t v7 = 0;
LABEL_7:
  uint64_t v8 = **((void **)this + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((*(void *)(*((void *)this + 2) + 8) - v8) >> 3) <= v7)
  {
LABEL_13:
    exception = __cxa_allocate_exception(0x38uLL);
    UC::Exception::InvalidDecodingSymbolInstruction::InvalidDecodingSymbolInstruction(exception, "", 0, "Decoder encountered an invalid symbol instruction. The encoding bit stream is invalid", 85);
  }
  int v9 = (long long *)(v8 + 24 * v7);
  if (*((char *)v9 + 23) < 0)
  {
    uint64_t v11 = *(const std::string::value_type **)v9;
    std::string::size_type v12 = *((void *)v9 + 1);
    std::string::__init_copy_ctor_external(a3, v11, v12);
  }
  else
  {
    long long v10 = *v9;
    a3->__r_.__value_.__r.__words[2] = *((void *)v9 + 2);
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v10;
  }
}

void sub_22E88E3D0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t UC::UCFixedLengthCoder::canEncode(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2[1];
  if (*a2 == v3) {
    return 1;
  }
  do
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24))(a1, v2);
    v2 += 24;
    if (result) {
      BOOL v6 = v2 == v3;
    }
    else {
      BOOL v6 = 1;
    }
  }
  while (!v6);
  return result;
}

BOOL UC::UCFixedLengthCoder::canEncode(UC::UCFixedLengthCoder *a1, unsigned __int8 *a2)
{
  return std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::find<std::string>(*((void **)a1 + 4), a2) != 0;
}

void UC::UCFixedLengthCoder::~UCFixedLengthCoder(UC::UCFixedLengthCoder *this)
{
  *(void *)this = &unk_26E243138;
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100]((uint64_t *)this + 4, 0);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
}

{
  std::__shared_weak_count *v2;
  uint64_t vars8;

  *(void *)this = &unk_26E243138;
  std::unique_ptr<std::unordered_map<std::string,std::string>>::reset[abi:ne180100]((uint64_t *)this + 4, 0);
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 3);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  operator delete(this);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::string const&,std::string>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __n128 *a4)
{
  int v9 = (void *)(a1 + 24);
  unint64_t v10 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  unint64_t v11 = v10;
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      unint64_t v4 = v10;
      if (v10 >= v12) {
        unint64_t v4 = v10 % v12;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v10;
    }
    uint64_t v15 = *(unsigned __int8 ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(unsigned __int8 **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2)) {
            return i;
          }
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12) {
              v17 %= v12;
            }
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4) {
            break;
          }
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string>(a1, v11, a3, a4, (uint64_t)v27);
  float v18 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    BOOL v20 = 1;
    if (v12 >= 3) {
      BOOL v20 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v21 = v20 | (2 * v12);
    unint64_t v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22) {
      size_t v23 = v22;
    }
    else {
      size_t v23 = v21;
    }
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__rehash<true>(a1, v23);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        unint64_t v4 = v11 % v12;
      }
      else {
        unint64_t v4 = v11;
      }
    }
    else
    {
      unint64_t v4 = (v12 - 1) & v11;
    }
  }
  std::string::size_type v24 = *(void **)(*(void *)a1 + 8 * v4);
  if (v24)
  {
    *(void *)v27[0] = *v24;
    void *v24 = v27[0];
  }
  else
  {
    *(void *)v27[0] = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = v27[0];
    *(void *)(*(void *)a1 + 8 * v4) = a1 + 16;
    if (*(void *)v27[0])
    {
      unint64_t v25 = *(void *)(*(void *)v27[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12) {
          v25 %= v12;
        }
      }
      else
      {
        v25 &= v12 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v25) = v27[0];
    }
  }
  uint64_t i = (unsigned __int8 *)v27[0];
  v27[0] = 0;
  ++*v9;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v27, 0);
  return i;
}

void sub_22E88E7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

__n128 std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::__construct_node_hash<std::string const&,std::string>@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __n128 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9 = a1 + 16;
  unint64_t v10 = (char *)operator new(0x40uLL);
  *(void *)a5 = v10;
  *(void *)(a5 + 8) = v9;
  *(unsigned char *)(a5 + 16) = 0;
  *(void *)unint64_t v10 = 0;
  *((void *)v10 + 1) = a2;
  unint64_t v11 = (std::string *)(v10 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((void *)v10 + 4) = *(void *)(a3 + 16);
  }
  __n128 result = *a4;
  *(__n128 *)(v10 + 40) = *a4;
  *((void *)v10 + 7) = a4[1].n128_u64[0];
  a4->n128_u64[1] = 0;
  a4[1].n128_u64[0] = 0;
  a4->n128_u64[0] = 0;
  *(unsigned char *)(a5 + 16) = 1;
  return result;
}

void sub_22E88E87C(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void std::priority_queue<std::unique_ptr<UCHuffmanNodeWrapper>,std::vector<std::unique_ptr<UCHuffmanNodeWrapper>>,createHuffmanTree(UC::UCSymbolFrequencyTable const&)::$_0>::pop(uint64_t *a1)
{
  std::unique_ptr<UC::UCHuffmanTreeNode>::reset[abi:ne180100](a1, 0);
  operator delete(a1);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::find(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98238](this, __c, __pos);
}

std::string::size_type std::string::rfind(const std::string *this, std::string::value_type __c, std::string::size_type __pos)
{
  return MEMORY[0x270F98240](this, __c, __pos);
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
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

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x270F98640]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::read()
{
  return MEMORY[0x270F98678]();
}

uint64_t std::istream::seekg()
{
  return MEMORY[0x270F98690]();
}

uint64_t std::istream::tellg()
{
  return MEMORY[0x270F98698]();
}

uint64_t std::istream::sentry::sentry()
{
  return MEMORY[0x270F986B0]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F98728]();
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
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987E0]();
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

int std::stoi(const std::string *__str, size_t *__idx, int __base)
{
  return MEMORY[0x270F98B78](__str, __idx, *(void *)&__base);
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

void operator delete[](void *__p)
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new[](size_t __sz)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
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

void __cxa_rethrow(void)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x270EDACF8](__x, __y);
  return result;
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}