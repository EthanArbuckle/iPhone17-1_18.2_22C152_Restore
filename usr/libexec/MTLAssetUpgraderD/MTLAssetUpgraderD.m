void UsagePayload::UsagePayload(uint64_t a1, UsagePayload *this, int a3, int a4)
{
  std::string::size_type v6;
  uint64_t v7;
  char v8;

  *(_DWORD *)a1 = a3;
  *(_DWORD *)(a1 + 4) = a4;
  *(void *)(a1 + 1032) = 0;
  if (*((char *)this + 23) < 0)
  {
    v6 = *((void *)this + 1);
    if (v6 >= 0x401)
    {
      v8 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    v6 = *((unsigned __int8 *)this + 23);
  }
  std::string::copy((const std::string *)this, (std::string::value_type *)(a1 + 8), v6, 0);
  v7 = *((unsigned __int8 *)this + 23);
  if ((v7 & 0x80u) != 0) {
    v7 = *((void *)this + 1);
  }
  *(void *)(a1 + 1032) = v7;
  v8 = 1;
LABEL_8:
  *(unsigned char *)(a1 + 1040) = v8;
}

void *UsagePayload::UsagePayload(void *__dst, size_t __n, void *__src)
{
  __dst[129] = 0;
  *((unsigned char *)__dst + 1040) = 0;
  if (__n - 1033 >= 0xFFFFFFFFFFFFFBFFLL)
  {
    memcpy(__dst, __src, __n);
    __dst[129] = __n - 8;
    *((unsigned char *)__dst + 1040) = 1;
  }
  return __dst;
}

void UsagePayload::serialization(UsagePayload *this)
{
}

double UsagePayload::getArchiveArch@<D0>(UsagePayload *this@<X0>, uint64_t a2@<X8>)
{
  std::string::basic_string[abi:ne180100](&__dst, (char *)this + 8, *((void *)this + 129));
  *(_OWORD *)a2 = __dst;
  *(void *)(a2 + 16) = v6;
  double result = *(double *)this;
  *(void *)(a2 + 24) = *(void *)this;
  return result;
}

void **MTLArchiveUsageDB::MTLArchiveUsageDB(void **a1, uint64_t a2)
{
  return MTLVersionedDB::MTLVersionedDB(a1, a2, 4, 1, 1);
}

void MTLArchiveUsageDB::store(MTLVersionedDB *a1, UsagePayload *a2, int a3, int a4, uint64_t a5)
{
  gettimeofday(&v11, 0);
  v10[1] = v11.tv_sec - a5;
  UsagePayload::UsagePayload((uint64_t)v12, a2, a3, a4);
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)v10, a1);
  if (v10[0]) {
    operator new();
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)v10);
}

void sub_1000038E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void MTLArchiveUsageDB::prune(MTLArchiveUsageDB *this, uint64_t a2)
{
  gettimeofday(&v12, 0);
  __darwin_time_t tv_sec = v12.tv_sec;
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v11, this);
  if (v11)
  {
    uint64_t v10 = 0;
    int v5 = mdb_cursor_open(v11, *((_DWORD *)this + 2), &v10);
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = mdb_strerror(v5);
        MTLArchiveUsageDB::prune((uint64_t)v6, (uint8_t *)buf);
      }
    }
    else
    {
      int v7 = mdb_cursor_get(v10, buf, v9, 0);
      unint64_t v8 = tv_sec - a2;
      while (v7 != -30798)
      {
        if (*(void *)buf[1] < v8) {
          mdb_cursor_del(v10, 32);
        }
        int v7 = mdb_cursor_get(v10, buf, v9, 11);
      }
    }
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v11);
}

void sub_100003A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

uint64_t MTLArchiveUsageDB::getPrioritizedList@<X0>(MTLArchiveUsageDB *this@<X0>, uint64_t *a2@<X8>)
{
  long long v23 = 0u;
  long long v24 = 0u;
  int v25 = 1065353216;
  a2[1] = 0;
  a2[2] = 0;
  *a2 = 0;
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v22, this);
  if (v22)
  {
    uint64_t v21 = 0;
    int v4 = mdb_cursor_open(v22, *((_DWORD *)this + 2), &v21);
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v5 = mdb_strerror(v4);
        MTLArchiveUsageDB::prune((uint64_t)v5, (uint8_t *)__dst);
      }
    }
    else
    {
      for (int i = mdb_cursor_get(v21, v20, v19, 0); i != -30798; int i = mdb_cursor_get(v21, v20, v19, 8))
      {
        if (!MTLVersionedDB::isVersionEntry((uint64_t)this, v20[0], (char *)v20[1]))
        {
          size_t v7 = 0;
          size_t v8 = v19[0];
          size_t v28 = 0;
          char v29 = 0;
          if (v19[0] - 1033 >= 0xFFFFFFFFFFFFFBFFLL)
          {
            memcpy(__dst, (const void *)v19[1], v19[0]);
            size_t v7 = v8 - 8;
            size_t v28 = v8 - 8;
            char v29 = 1;
          }
          std::string::basic_string[abi:ne180100](&v26, &__dst[0].__r_.__value_.__r.__words[1], v7);
          std::string __p = v26;
          std::string::size_type v18 = __dst[0].__r_.__value_.__r.__words[0];
          v26.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
          v9 = std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__emplace_unique_key_args<std::tuple<std::string,unsigned int,unsigned int>,std::piecewise_construct_t const&,std::tuple<std::tuple<std::string,unsigned int,unsigned int>&&>,std::tuple<>>((uint64_t)&v23, (uint64_t)&__p, (uint64_t)&std::piecewise_construct, (long long **)&v26);
          ++v9[12];
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(__p.__r_.__value_.__l.__data_);
          }
        }
      }
      memset(&__p, 0, sizeof(__p));
      unint64_t v10 = 0;
      if ((void)v24)
      {
        uint64_t v11 = (void *)v24;
        do
        {
          ++v10;
          uint64_t v11 = (void *)*v11;
        }
        while (v11);
      }
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__init_with_size[abi:ne180100]<std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>>(&__p, (uint64_t *)v24, 0, v10);
      unint64_t v12 = 126
          - 2
          * __clz(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(__p.__r_.__value_.__l.__size_ - __p.__r_.__value_.__r.__words[0]) >> 3));
      if (__p.__r_.__value_.__l.__size_ == __p.__r_.__value_.__r.__words[0]) {
        uint64_t v13 = 0;
      }
      else {
        uint64_t v13 = v12;
      }
      std::__introsort<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,false>(__p.__r_.__value_.__r.__words[0], (void *)__p.__r_.__value_.__l.__size_, v13, 1);
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
      for (j = (long long *)__p.__r_.__value_.__r.__words[0]; j != (long long *)size; j = (long long *)((char *)j + 40))
      {
        std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl(__dst, j);
        std::vector<std::tuple<std::string,unsigned int,unsigned int>>::push_back[abi:ne180100](a2, (long long *)__dst);
        if (SHIBYTE(__dst[0].__r_.__value_.__r.__words[2]) < 0) {
          operator delete(__dst[0].__r_.__value_.__l.__data_);
        }
      }
      __dst[0].__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__destroy_vector::operator()[abi:ne180100]((void ***)__dst);
    }
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v22);
  return std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table((uint64_t)&v23);
}

void sub_100003D24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,uint64_t a36,int a37,__int16 a38,char a39,char a40)
{
}

void __clang_call_terminate(void *a1)
{
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

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
}

void sub_100003ED8(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  double result = std::logic_error::logic_error(a1, a2);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

uint64_t std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__deallocate_node(int a1, void **__p)
{
  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  v2 = *a1;
  if (*v2)
  {
    std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__clear[abi:ne180100]((uint64_t *)v2);
    v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0) {
      operator delete(*(void **)(i - 32));
    }
  }
  a1[1] = v2;
}

void *std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__emplace_unique_key_args<std::tuple<std::string,unsigned int,unsigned int>,std::piecewise_construct_t const&,std::tuple<std::tuple<std::string,unsigned int,unsigned int>&&>,std::tuple<>>(uint64_t a1, uint64_t a2, uint64_t a3, long long **a4)
{
  unint64_t v8 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)v31, a2);
  uint64_t v9 = *(unsigned int *)(a2 + 28);
  uint64_t v10 = v8 ^ (2 * *(unsigned int *)(a2 + 24));
  unint64_t v11 = v10 ^ (4 * v9);
  unint64_t v12 = *(void *)(a1 + 8);
  if (v12)
  {
    uint8x8_t v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    unint64_t v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      uint64_t v4 = v10 ^ (4 * v9);
      if (v11 >= v12) {
        uint64_t v4 = v11 % v12;
      }
    }
    else
    {
      uint64_t v4 = v11 & (v12 - 1);
    }
    v15 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v15)
    {
      for (uint64_t i = *v15; i; uint64_t i = *(void **)i)
      {
        unint64_t v17 = *((void *)i + 1);
        if (v17 == v11)
        {
          if (std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>((uint64_t)v31, (unsigned __int8 *)i + 16, (unsigned __int8 *)a2)&& *((_DWORD *)i + 10) == *(_DWORD *)(a2 + 24)&& *((_DWORD *)i + 11) == *(_DWORD *)(a2 + 28))
          {
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
  std::string::size_type v18 = (void *)(a1 + 16);
  uint64_t i = operator new(0x38uLL);
  uint64_t v32 = a1 + 16;
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v11;
  v19 = *a4;
  long long v20 = **a4;
  *((void *)i + 4) = *((void *)*a4 + 2);
  *((_OWORD *)i + 1) = v20;
  *((void *)v19 + 1) = 0;
  *((void *)v19 + 2) = 0;
  *(void *)v19 = 0;
  *((_DWORD *)i + 10) = *((_DWORD *)v19 + 6);
  *((_DWORD *)i + 11) = *((_DWORD *)v19 + 7);
  *((_DWORD *)i + 12) = 0;
  char v33 = 1;
  float v21 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v22 = *(float *)(a1 + 32);
  if (!v12 || (float)(v22 * (float)v12) < v21)
  {
    BOOL v23 = 1;
    if (v12 >= 3) {
      BOOL v23 = (v12 & (v12 - 1)) != 0;
    }
    unint64_t v24 = v23 | (2 * v12);
    unint64_t v25 = vcvtps_u32_f32(v21 / v22);
    if (v24 <= v25) {
      size_t v26 = v25;
    }
    else {
      size_t v26 = v24;
    }
    std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(a1, v26);
    unint64_t v12 = *(void *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12) {
        uint64_t v4 = v11 % v12;
      }
      else {
        uint64_t v4 = v11;
      }
    }
    else
    {
      uint64_t v4 = (v12 - 1) & v11;
    }
  }
  uint64_t v27 = *(void *)a1;
  size_t v28 = *(void **)(*(void *)a1 + 8 * v4);
  if (v28)
  {
    *(void *)uint64_t i = *v28;
LABEL_40:
    *size_t v28 = i;
    goto LABEL_41;
  }
  *(void *)uint64_t i = *v18;
  *std::string::size_type v18 = i;
  *(void *)(v27 + 8 * v4) = v18;
  if (*(void *)i)
  {
    unint64_t v29 = *(void *)(*(void *)i + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v29 >= v12) {
        v29 %= v12;
      }
    }
    else
    {
      v29 &= v12 - 1;
    }
    size_t v28 = (void *)(*(void *)a1 + 8 * v29);
    goto LABEL_40;
  }
LABEL_41:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_100004314(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](v11, v10);
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
      float v22 = a2 + 4;
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

uint64_t std::__tuple_equal<1ul>::operator()[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>>(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
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

void std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::__unordered_map_hasher<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,key_hash,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,true>,std::__unordered_map_equal<std::tuple<std::string,unsigned int,unsigned int>,std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,std::equal_to<std::tuple<std::string,unsigned int,unsigned int>>,key_hash,true>,std::allocator<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
            *uint64_t v7 = *v11;
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

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
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

std::string *std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__init_with_size[abi:ne180100]<std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>>(std::string *result, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_100004B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__vallocate[abi:ne180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(40 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::__hash_map_iterator<std::__hash_iterator<std::__hash_node<std::__hash_value_type<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>,void *> *>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>(uint64_t a1, uint64_t *a2, uint64_t *a3, std::string *this)
{
  uint64_t v4 = this;
  uint64_t v10 = this;
  int v11 = this;
  v8[0] = a1;
  v8[1] = &v10;
  v8[2] = &v11;
  char v9 = 0;
  if (a2 != a3)
  {
    uint64_t v6 = (long long *)a2;
    do
    {
      std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl(v4, v6 + 1);
      LODWORD(v4[1].__r_.__value_.__r.__words[1]) = *((_DWORD *)v6 + 12);
      uint64_t v6 = *(long long **)v6;
      uint64_t v4 = (std::string *)((char *)v11 + 40);
      int v11 = (std::string *)((char *)v11 + 40);
    }
    while (v6 != (long long *)a3);
  }
  char v9 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v8);
  return v4;
}

void sub_100004D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

std::string *std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl(std::string *this, long long *a2)
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
  LODWORD(this[1].__r_.__value_.__l.__data_) = *((_DWORD *)a2 + 6);
  HIDWORD(this[1].__r_.__value_.__r.__words[0]) = *((_DWORD *)a2 + 7);
  return this;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
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
    unint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 17) < 0) {
      operator delete(*(void **)(v1 - 40));
    }
    v1 -= 40;
  }
}

void std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 40)
  {
    if (*(char *)(i - 17) < 0) {
      operator delete(*(void **)(i - 40));
    }
  }
  a1[1] = v2;
}

void std::__introsort<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,false>(unint64_t a1, void *a2, uint64_t a3, char a4)
{
  while (2)
  {
    v111 = (long long *)(a2 - 10);
    v112 = (long long *)(a2 - 5);
    v110 = (long long *)(a2 - 15);
    unint64_t v9 = a1;
    unint64_t v118 = (unint64_t)a2;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = v9;
          uint64_t v10 = (uint64_t)a2 - v9;
          uint64_t v11 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)((uint64_t)a2 - v9) >> 3);
          if (v5 || !v4)
          {
            switch(v11)
            {
              case 0:
              case 1:
                return;
              case 2:
                if (*((_DWORD *)a2 - 2) > *(_DWORD *)(a1 + 32))
                {
                  uint64_t v135 = *(void *)(a1 + 16);
                  long long v127 = *(_OWORD *)a1;
                  long long v54 = *(_OWORD *)(a2 - 5);
                  *(void *)(a1 + 16) = *(a2 - 3);
                  *(_OWORD *)a1 = v54;
                  *(a2 - 3) = v135;
                  *(_OWORD *)(a2 - 5) = v127;
                  int v55 = *(_DWORD *)(a1 + 24);
                  *(_DWORD *)(a1 + 24) = *((_DWORD *)a2 - 4);
                  *((_DWORD *)a2 - 4) = v55;
                  int v56 = *(_DWORD *)(a1 + 28);
                  *(_DWORD *)(a1 + 28) = *((_DWORD *)a2 - 3);
                  *((_DWORD *)a2 - 3) = v56;
                  int v57 = *(_DWORD *)(a1 + 32);
                  *(_DWORD *)(a1 + 32) = *((_DWORD *)a2 - 2);
                  *((_DWORD *)a2 - 2) = v57;
                }
                break;
              case 3:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((long long *)a1, (long long *)(a1 + 40), v112);
                break;
              case 4:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(a1, a1 + 40, a1 + 80, (uint64_t)v112);
                break;
              case 5:
                std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,0>((__n128 *)a1, (__n128 *)(a1 + 40), (__n128 *)(a1 + 80), (__n128 *)(a1 + 120), (__n128 *)v112);
                break;
              default:
                JUMPOUT(0);
            }
            return;
          }
          if (v10 <= 959)
          {
            v58 = (void *)(a1 + 40);
            BOOL v60 = (void *)a1 == a2 || v58 == a2;
            if (a4)
            {
              if (!v60)
              {
                uint64_t v61 = 0;
                unint64_t v62 = a1;
                do
                {
                  v63 = v58;
                  unsigned int v64 = *(_DWORD *)(v62 + 72);
                  if (v64 > *(_DWORD *)(v62 + 32))
                  {
                    uint64_t v65 = *v58;
                    *(void *)v128 = *(void *)(v62 + 48);
                    *(void *)&v128[7] = *(void *)(v62 + 55);
                    char v66 = *(unsigned char *)(v62 + 63);
                    v58[1] = 0;
                    v58[2] = 0;
                    void *v58 = 0;
                    uint64_t v67 = *(void *)(v62 + 64);
                    uint64_t v68 = v61;
                    while (1)
                    {
                      uint64_t v69 = a1 + v68;
                      std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(a1 + v68 + 40, (__n128 *)(a1 + v68));
                      *(_DWORD *)(a1 + v68 + 72) = *(_DWORD *)(a1 + v68 + 32);
                      if (!v68) {
                        break;
                      }
                      v68 -= 40;
                      if (v64 <= *(_DWORD *)(v69 - 8))
                      {
                        uint64_t v70 = a1 + v68 + 40;
                        goto LABEL_86;
                      }
                    }
                    uint64_t v70 = a1;
LABEL_86:
                    if (*(char *)(v70 + 23) < 0) {
                      operator delete(*(void **)v70);
                    }
                    *(void *)uint64_t v70 = v65;
                    *(void *)(v70 + 8) = *(void *)v128;
                    *(void *)(v70 + 15) = *(void *)&v128[7];
                    *(unsigned char *)(v70 + 23) = v66;
                    *(void *)(v70 + 24) = v67;
                    *(_DWORD *)(v70 + 32) = v64;
                  }
                  v58 = v63 + 5;
                  v61 += 40;
                  unint64_t v62 = (unint64_t)v63;
                }
                while (v63 + 5 != (void *)v118);
              }
            }
            else if (!v60)
            {
              v101 = (unsigned int *)(a1 + 72);
              do
              {
                v102 = v58;
                unsigned int v103 = *(_DWORD *)(a1 + 72);
                if (v103 > *(_DWORD *)(a1 + 32))
                {
                  uint64_t v104 = *v58;
                  *(void *)v131 = *(void *)(a1 + 48);
                  *(void *)&v131[7] = *(void *)(a1 + 55);
                  char v105 = *(unsigned char *)(a1 + 63);
                  v58[1] = 0;
                  v58[2] = 0;
                  void *v58 = 0;
                  uint64_t v106 = *(void *)(a1 + 64);
                  v107 = v101;
                  do
                  {
                    v108 = v107;
                    std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>((uint64_t)(v107 - 8), (__n128 *)(v107 - 18));
                    unsigned int v109 = *(v107 - 10);
                    v107 -= 10;
                    unsigned int *v108 = v109;
                  }
                  while (v103 > *(v108 - 20));
                  if (*((char *)v107 - 9) < 0) {
                    operator delete(*((void **)v107 - 4));
                  }
                  *((void *)v107 - 4) = v104;
                  *(void *)((char *)v107 - 17) = *(void *)&v131[7];
                  *((void *)v107 - 3) = *(void *)v131;
                  *((unsigned char *)v107 - 9) = v105;
                  *((void *)v107 - 1) = v106;
                  unsigned int *v107 = v103;
                }
                v58 = v102 + 5;
                v101 += 10;
                a1 = (unint64_t)v102;
              }
              while (v102 + 5 != (void *)v118);
            }
            return;
          }
          if (!a3)
          {
            if ((void *)a1 != a2)
            {
              int64_t v71 = (unint64_t)(v11 - 2) >> 1;
              int64_t v72 = v71;
              do
              {
                int64_t v73 = v72;
                if (v71 >= v72)
                {
                  uint64_t v74 = (2 * v72) | 1;
                  v75 = (__n128 *)(a1 + 40 * v74);
                  if (2 * v73 + 2 < v11)
                  {
                    BOOL v76 = *(_DWORD *)(a1 + 40 * v74 + 32) > v75[4].n128_u32[2];
                    v75 = (__n128 *)((char *)v75 + 40 * v76);
                    if (v76) {
                      uint64_t v74 = 2 * v73 + 2;
                    }
                  }
                  unsigned __int32 v77 = *(_DWORD *)(a1 + 40 * v73 + 32);
                  if (v75[2].n128_u32[0] <= v77)
                  {
                    v78 = (__n128 *)(a1 + 40 * v73);
                    unint64_t v116 = v78->n128_u64[0];
                    *(void *)&v129[7] = *(unint64_t *)((char *)&v78->n128_u64[1] + 7);
                    *(void *)v129 = v78->n128_u64[1];
                    unsigned __int8 v113 = v78[1].n128_u8[7];
                    v78->n128_u64[0] = 0;
                    v78->n128_u64[1] = 0;
                    v78[1].n128_u64[0] = 0;
                    unint64_t v79 = v78[1].n128_u64[1];
                    do
                    {
                      uint64_t v80 = (uint64_t)v78;
                      v78 = v75;
                      std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(v80, v75);
                      *(_DWORD *)(v80 + 32) = v78[2].n128_u32[0];
                      if (v71 < v74) {
                        break;
                      }
                      uint64_t v81 = (2 * v74) | 1;
                      v75 = (__n128 *)(a1 + 40 * v81);
                      if (2 * v74 + 2 < v11)
                      {
                        BOOL v76 = *(_DWORD *)(a1 + 40 * v81 + 32) > v75[4].n128_u32[2];
                        v75 = (__n128 *)((char *)v75 + 40 * v76);
                        if (v76) {
                          uint64_t v81 = 2 * v74 + 2;
                        }
                      }
                      uint64_t v74 = v81;
                    }
                    while (v75[2].n128_u32[0] <= v77);
                    if (v78[1].n128_i8[7] < 0) {
                      operator delete((void *)v78->n128_u64[0]);
                    }
                    v78->n128_u64[0] = v116;
                    v78->n128_u64[1] = *(void *)v129;
                    *(unint64_t *)((char *)&v78->n128_u64[1] + 7) = *(void *)&v129[7];
                    v78[1].n128_u8[7] = v113;
                    v78[1].n128_u64[1] = v79;
                    v78[2].n128_u32[0] = v77;
                  }
                }
                int64_t v72 = v73 - 1;
              }
              while (v73);
              int64_t v82 = v10 / 0x28uLL;
              v83 = (void **)v118;
              do
              {
                uint64_t v84 = 0;
                v117 = *(void **)a1;
                v85 = v83;
                *(void *)v123 = *(void *)(a1 + 8);
                *(void *)&v123[7] = *(void *)(a1 + 15);
                char v119 = *(unsigned char *)(a1 + 23);
                *(void *)(a1 + 8) = 0;
                *(void *)(a1 + 16) = 0;
                *(void *)a1 = 0;
                int v86 = *(_DWORD *)(a1 + 24);
                int v114 = *(_DWORD *)(a1 + 28);
                uint64_t v87 = a1;
                int v88 = *(_DWORD *)(a1 + 32);
                do
                {
                  uint64_t v89 = v84 + 1;
                  uint64_t v90 = v87 + 40 * (v84 + 1);
                  uint64_t v91 = (2 * v84) | 1;
                  uint64_t v92 = 2 * v84 + 2;
                  if (v92 < v82)
                  {
                    unsigned int v93 = *(_DWORD *)(v87 + 40 * v89 + 32);
                    unsigned int v94 = *(_DWORD *)(v90 + 72);
                    v90 += 40 * (v93 > v94);
                    if (v93 > v94) {
                      uint64_t v91 = v92;
                    }
                  }
                  std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(v87, (__n128 *)v90);
                  *(_DWORD *)(v87 + 32) = *(_DWORD *)(v90 + 32);
                  uint64_t v87 = v90;
                  uint64_t v84 = v91;
                }
                while (v91 <= (uint64_t)((unint64_t)(v82 - 2) >> 1));
                v83 -= 5;
                if ((void **)v90 == v85 - 5)
                {
                  if (*(char *)(v90 + 23) < 0) {
                    operator delete(*(void **)v90);
                  }
                  *(void *)uint64_t v90 = v117;
                  *(void *)(v90 + 8) = *(void *)v123;
                  *(void *)(v90 + 15) = *(void *)&v123[7];
                  *(unsigned char *)(v90 + 23) = v119;
                  *(_DWORD *)(v90 + 24) = v86;
                  *(_DWORD *)(v90 + 28) = v114;
                  *(_DWORD *)(v90 + 32) = v88;
                }
                else
                {
                  std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(v90, (__n128 *)(v85 - 5));
                  *(_DWORD *)(v90 + 32) = *((_DWORD *)v85 - 2);
                  if (*((char *)v85 - 17) < 0) {
                    operator delete(*v83);
                  }
                  *(v85 - 5) = v117;
                  *(void **)((char *)v85 - 25) = *(void **)&v123[7];
                  *(v85 - 4) = *(void **)v123;
                  *((unsigned char *)v85 - 17) = v119;
                  *((_DWORD *)v85 - 4) = v86;
                  *((_DWORD *)v85 - 3) = v114;
                  *((_DWORD *)v85 - 2) = v88;
                  uint64_t v95 = v90 + 40 - a1;
                  if (v95 >= 41)
                  {
                    unint64_t v96 = (v95 / 0x28uLL - 2) >> 1;
                    unsigned int v97 = *(_DWORD *)(v90 + 32);
                    if (*(_DWORD *)(a1 + 40 * v96 + 32) > v97)
                    {
                      v98 = *(void **)v90;
                      *(void *)v130 = *(void *)(v90 + 8);
                      *(void *)&v130[7] = *(void *)(v90 + 15);
                      char v120 = *(unsigned char *)(v90 + 23);
                      *(void *)(v90 + 8) = 0;
                      *(void *)(v90 + 16) = 0;
                      *(void *)uint64_t v90 = 0;
                      uint64_t v99 = *(void *)(v90 + 24);
                      do
                      {
                        uint64_t v100 = v90;
                        uint64_t v90 = a1 + 40 * v96;
                        std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(v100, (__n128 *)v90);
                        *(_DWORD *)(v100 + 32) = *(_DWORD *)(v90 + 32);
                        if (!v96) {
                          break;
                        }
                        unint64_t v96 = (v96 - 1) >> 1;
                      }
                      while (*(_DWORD *)(a1 + 40 * v96 + 32) > v97);
                      if (*(char *)(v90 + 23) < 0) {
                        operator delete(*(void **)v90);
                      }
                      *(void *)uint64_t v90 = v98;
                      *(void *)(v90 + 15) = *(void *)&v130[7];
                      *(void *)(v90 + 8) = *(void *)v130;
                      *(unsigned char *)(v90 + 23) = v120;
                      *(void *)(v90 + 24) = v99;
                      *(_DWORD *)(v90 + 32) = v97;
                    }
                  }
                }
                BOOL v76 = v82-- <= 2;
              }
              while (!v76);
            }
            return;
          }
          unint64_t v12 = (unint64_t)v11 >> 1;
          unint64_t v13 = a1 + 40 * ((unint64_t)v11 >> 1);
          if ((unint64_t)v10 < 0x1401)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((long long *)v13, (long long *)a1, v112);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((long long *)a1, (long long *)v13, v112);
            uint64_t v14 = 5 * v12;
            unint64_t v15 = a1 + 8 * v14;
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((long long *)(a1 + 40), (long long *)(v15 - 40), v111);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((long long *)(a1 + 80), (long long *)(a1 + 40 + 8 * v14), v110);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((long long *)(v15 - 40), (long long *)v13, (long long *)(a1 + 40 + 8 * v14));
            uint64_t v132 = *(void *)(a1 + 16);
            long long v124 = *(_OWORD *)a1;
            uint64_t v16 = *(void *)(v13 + 16);
            *(_OWORD *)a1 = *(_OWORD *)v13;
            *(void *)(a1 + 16) = v16;
            *(void *)(v13 + 16) = v132;
            *(_OWORD *)unint64_t v13 = v124;
            uint64_t v17 = *(void *)(a1 + 24);
            *(void *)(a1 + 24) = *(void *)(v13 + 24);
            *(void *)(v13 + 24) = v17;
            LODWORD(v16) = *(_DWORD *)(a1 + 32);
            *(_DWORD *)(a1 + 32) = *(_DWORD *)(v15 + 32);
            *(_DWORD *)(v15 + 32) = v16;
          }
          --a3;
          a2 = (void *)v118;
          if (a4) {
            break;
          }
          unsigned int v18 = *(_DWORD *)(a1 + 32);
          if (*(_DWORD *)(a1 - 8) > v18) {
            goto LABEL_12;
          }
          uint64_t v38 = *(void *)a1;
          *(void *)v122 = *(void *)(a1 + 8);
          *(void *)&v122[7] = *(void *)(a1 + 15);
          char v39 = *(unsigned char *)(a1 + 23);
          *(void *)(a1 + 8) = 0;
          *(void *)(a1 + 16) = 0;
          *(void *)a1 = 0;
          if (v18 <= *(_DWORD *)(v118 - 8))
          {
            unint64_t v42 = a1 + 40;
            do
            {
              unint64_t v9 = v42;
              if (v42 >= v118) {
                break;
              }
              unsigned int v43 = *(_DWORD *)(v42 + 32);
              v42 += 40;
            }
            while (v18 <= v43);
          }
          else
          {
            unint64_t v40 = a1;
            do
            {
              unint64_t v9 = v40 + 40;
              unsigned int v41 = *(_DWORD *)(v40 + 72);
              v40 += 40;
            }
            while (v18 <= v41);
          }
          unint64_t v44 = v118;
          if (v9 < v118)
          {
            unint64_t v45 = v118;
            do
            {
              unint64_t v44 = v45 - 40;
              unsigned int v46 = *(_DWORD *)(v45 - 8);
              v45 -= 40;
            }
            while (v18 > v46);
          }
          uint64_t v47 = *(void *)(a1 + 24);
          while (v9 < v44)
          {
            uint64_t v134 = *(void *)(v9 + 16);
            long long v126 = *(_OWORD *)v9;
            long long v48 = *(_OWORD *)v44;
            *(void *)(v9 + 16) = *(void *)(v44 + 16);
            *(_OWORD *)unint64_t v9 = v48;
            *(void *)(v44 + 16) = v134;
            *(_OWORD *)unint64_t v44 = v126;
            int v49 = *(_DWORD *)(v9 + 24);
            *(_DWORD *)(v9 + 24) = *(_DWORD *)(v44 + 24);
            *(_DWORD *)(v44 + 24) = v49;
            int v50 = *(_DWORD *)(v9 + 28);
            *(_DWORD *)(v9 + 28) = *(_DWORD *)(v44 + 28);
            *(_DWORD *)(v44 + 28) = v50;
            int v51 = *(_DWORD *)(v9 + 32);
            *(_DWORD *)(v9 + 32) = *(_DWORD *)(v44 + 32);
            *(_DWORD *)(v44 + 32) = v51;
            do
            {
              unsigned int v52 = *(_DWORD *)(v9 + 72);
              v9 += 40;
            }
            while (v18 <= v52);
            do
            {
              unsigned int v53 = *(_DWORD *)(v44 - 8);
              v44 -= 40;
            }
            while (v18 > v53);
          }
          BOOL v4 = v9 - 40 >= a1;
          BOOL v5 = v9 - 40 == a1;
          if (v9 - 40 != a1)
          {
            std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(a1, (__n128 *)(v9 - 40));
            *(_DWORD *)(a1 + 32) = *(_DWORD *)(v9 - 8);
          }
          if (*(char *)(v9 - 17) < 0) {
            operator delete(*(void **)(v9 - 40));
          }
          a4 = 0;
          *(void *)(v9 - 40) = v38;
          *(void *)(v9 - 25) = *(void *)&v122[7];
          *(void *)(v9 - 32) = *(void *)v122;
          *(unsigned char *)(v9 - 17) = v39;
          *(void *)(v9 - 16) = v47;
          *(_DWORD *)(v9 - 8) = v18;
        }
        unsigned int v18 = *(_DWORD *)(a1 + 32);
LABEL_12:
        uint64_t v19 = 0;
        uint64_t v20 = *(void *)a1;
        *(void *)v121 = *(void *)(a1 + 8);
        *(void *)&v121[7] = *(void *)(a1 + 15);
        char v21 = *(unsigned char *)(a1 + 23);
        *(void *)(a1 + 8) = 0;
        *(void *)(a1 + 16) = 0;
        *(void *)a1 = 0;
        uint64_t v22 = *(void *)(a1 + 24);
        do
        {
          unsigned int v23 = *(_DWORD *)(a1 + v19 + 72);
          v19 += 40;
        }
        while (v23 > v18);
        unint64_t v24 = a1 + v19;
        unint64_t v25 = v118;
        if (v19 == 40)
        {
          unint64_t v28 = v118;
          while (v24 < v28)
          {
            unint64_t v26 = v28 - 40;
            unsigned int v29 = *(_DWORD *)(v28 - 8);
            v28 -= 40;
            if (v29 > v18) {
              goto LABEL_22;
            }
          }
          unint64_t v26 = v28;
        }
        else
        {
          do
          {
            unint64_t v26 = v25 - 40;
            unsigned int v27 = *(_DWORD *)(v25 - 8);
            v25 -= 40;
          }
          while (v27 <= v18);
        }
LABEL_22:
        unint64_t v9 = v24;
        if (v24 < v26)
        {
          unint64_t v30 = v26;
          do
          {
            uint64_t v133 = *(void *)(v9 + 16);
            long long v125 = *(_OWORD *)v9;
            long long v31 = *(_OWORD *)v30;
            *(void *)(v9 + 16) = *(void *)(v30 + 16);
            *(_OWORD *)unint64_t v9 = v31;
            *(void *)(v30 + 16) = v133;
            *(_OWORD *)unint64_t v30 = v125;
            int v32 = *(_DWORD *)(v9 + 24);
            *(_DWORD *)(v9 + 24) = *(_DWORD *)(v30 + 24);
            *(_DWORD *)(v30 + 24) = v32;
            int v33 = *(_DWORD *)(v9 + 28);
            *(_DWORD *)(v9 + 28) = *(_DWORD *)(v30 + 28);
            *(_DWORD *)(v30 + 28) = v33;
            int v34 = *(_DWORD *)(v9 + 32);
            *(_DWORD *)(v9 + 32) = *(_DWORD *)(v30 + 32);
            *(_DWORD *)(v30 + 32) = v34;
            do
            {
              unsigned int v35 = *(_DWORD *)(v9 + 72);
              v9 += 40;
            }
            while (v35 > v18);
            do
            {
              unsigned int v36 = *(_DWORD *)(v30 - 8);
              v30 -= 40;
            }
            while (v36 <= v18);
          }
          while (v9 < v30);
        }
        if (v9 - 40 != a1)
        {
          std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(a1, (__n128 *)(v9 - 40));
          *(_DWORD *)(a1 + 32) = *(_DWORD *)(v9 - 8);
        }
        if (*(char *)(v9 - 17) < 0) {
          operator delete(*(void **)(v9 - 40));
        }
        *(void *)(v9 - 40) = v20;
        *(void *)(v9 - 25) = *(void *)&v121[7];
        *(void *)(v9 - 32) = *(void *)v121;
        *(unsigned char *)(v9 - 17) = v21;
        *(void *)(v9 - 16) = v22;
        *(_DWORD *)(v9 - 8) = v18;
        if (v24 >= v26) {
          break;
        }
LABEL_35:
        std::__introsort<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,false>(a1, v9 - 40, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v37 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(a1, v9 - 40);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(v9, v118))
      {
        break;
      }
      if (!v37) {
        goto LABEL_35;
      }
    }
    a2 = (void *)(v9 - 40);
    if (!v37) {
      continue;
    }
    break;
  }
}

__n128 std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,0>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5)
{
  result.n128_u64[0] = std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4).n128_u64[0];
  if (a5[2].n128_u32[0] > a4[2].n128_u32[0])
  {
    unint64_t v11 = a4[1].n128_u64[0];
    __n128 result = *a4;
    unint64_t v12 = a5[1].n128_u64[0];
    *a4 = *a5;
    a4[1].n128_u64[0] = v12;
    *a5 = result;
    a5[1].n128_u64[0] = v11;
    LODWORD(v11) = a4[1].n128_u32[2];
    a4[1].n128_u32[2] = a5[1].n128_u32[2];
    a5[1].n128_u32[2] = v11;
    LODWORD(v11) = a4[1].n128_u32[3];
    a4[1].n128_u32[3] = a5[1].n128_u32[3];
    a5[1].n128_u32[3] = v11;
    LODWORD(v11) = a4[2].n128_u32[0];
    a4[2].n128_u32[0] = a5[2].n128_u32[0];
    a5[2].n128_u32[0] = v11;
    if (a4[2].n128_u32[0] > a3[2].n128_u32[0])
    {
      unint64_t v13 = a3[1].n128_u64[0];
      __n128 result = *a3;
      unint64_t v14 = a4[1].n128_u64[0];
      *a3 = *a4;
      a3[1].n128_u64[0] = v14;
      *a4 = result;
      a4[1].n128_u64[0] = v13;
      LODWORD(v13) = a3[1].n128_u32[2];
      a3[1].n128_u32[2] = a4[1].n128_u32[2];
      a4[1].n128_u32[2] = v13;
      LODWORD(v13) = a3[1].n128_u32[3];
      a3[1].n128_u32[3] = a4[1].n128_u32[3];
      a4[1].n128_u32[3] = v13;
      LODWORD(v13) = a3[2].n128_u32[0];
      a3[2].n128_u32[0] = a4[2].n128_u32[0];
      a4[2].n128_u32[0] = v13;
      if (a3[2].n128_u32[0] > a2[2].n128_u32[0])
      {
        unint64_t v15 = a2[1].n128_u64[0];
        __n128 result = *a2;
        unint64_t v16 = a3[1].n128_u64[0];
        *a2 = *a3;
        a2[1].n128_u64[0] = v16;
        *a3 = result;
        a3[1].n128_u64[0] = v15;
        LODWORD(v15) = a2[1].n128_u32[2];
        a2[1].n128_u32[2] = a3[1].n128_u32[2];
        a3[1].n128_u32[2] = v15;
        LODWORD(v15) = a2[1].n128_u32[3];
        a2[1].n128_u32[3] = a3[1].n128_u32[3];
        a3[1].n128_u32[3] = v15;
        LODWORD(v15) = a2[2].n128_u32[0];
        a2[2].n128_u32[0] = a3[2].n128_u32[0];
        a3[2].n128_u32[0] = v15;
        if (a2[2].n128_u32[0] > a1[2].n128_u32[0])
        {
          unint64_t v17 = a1[1].n128_u64[0];
          __n128 result = *a1;
          unint64_t v18 = a2[1].n128_u64[0];
          *a1 = *a2;
          a1[1].n128_u64[0] = v18;
          *a2 = result;
          a2[1].n128_u64[0] = v17;
          LODWORD(v17) = a1[1].n128_u32[2];
          a1[1].n128_u32[2] = a2[1].n128_u32[2];
          a2[1].n128_u32[2] = v17;
          LODWORD(v17) = a1[1].n128_u32[3];
          a1[1].n128_u32[3] = a2[1].n128_u32[3];
          a2[1].n128_u32[3] = v17;
          LODWORD(v17) = a1[2].n128_u32[0];
          a1[2].n128_u32[0] = a2[2].n128_u32[0];
          a2[2].n128_u32[0] = v17;
        }
      }
    }
  }
  return result;
}

long long *std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(long long *result, long long *a2, long long *a3)
{
  uint64_t v3 = (int *)(a2 + 2);
  unsigned int v4 = *((_DWORD *)a2 + 8);
  BOOL v5 = (int *)(result + 2);
  unsigned int v6 = *((_DWORD *)a3 + 8);
  if (v4 > *((_DWORD *)result + 8))
  {
    if (v6 <= v4)
    {
      uint64_t v18 = *((void *)result + 2);
      long long v19 = *result;
      uint64_t v20 = *((void *)a2 + 2);
      *__n128 result = *a2;
      *((void *)result + 2) = v20;
      *a2 = v19;
      *((void *)a2 + 2) = v18;
      LODWORD(v18) = *((_DWORD *)result + 6);
      *((_DWORD *)result + 6) = *((_DWORD *)a2 + 6);
      *((_DWORD *)a2 + 6) = v18;
      std::string::size_type v7 = (int *)a2 + 7;
      int v21 = *((_DWORD *)result + 7);
      *((_DWORD *)result + 7) = *((_DWORD *)a2 + 7);
      *((_DWORD *)a2 + 7) = v21;
      LODWORD(v18) = *((_DWORD *)result + 8);
      *((_DWORD *)result + 8) = *((_DWORD *)a2 + 8);
      *((_DWORD *)a2 + 8) = v18;
      if (*((_DWORD *)a3 + 8) <= v18) {
        return result;
      }
      uint64_t v22 = *((void *)a2 + 2);
      long long v23 = *a2;
      uint64_t v24 = *((void *)a3 + 2);
      *a2 = *a3;
      *((void *)a2 + 2) = v24;
      *a3 = v23;
      *((void *)a3 + 2) = v22;
      LODWORD(v22) = *((_DWORD *)a2 + 6);
      *((_DWORD *)a2 + 6) = *((_DWORD *)a3 + 6);
      *((_DWORD *)a3 + 6) = v22;
      unint64_t v11 = (int *)a3 + 7;
      BOOL v5 = (int *)(a2 + 2);
    }
    else
    {
      std::string::size_type v7 = (int *)result + 7;
      uint64_t v8 = *((void *)result + 2);
      long long v9 = *result;
      uint64_t v10 = *((void *)a3 + 2);
      *__n128 result = *a3;
      *((void *)result + 2) = v10;
      *a3 = v9;
      *((void *)a3 + 2) = v8;
      LODWORD(v8) = *((_DWORD *)result + 6);
      *((_DWORD *)result + 6) = *((_DWORD *)a3 + 6);
      *((_DWORD *)a3 + 6) = v8;
      unint64_t v11 = (int *)a3 + 7;
    }
    uint64_t v3 = (int *)(a3 + 2);
    goto LABEL_10;
  }
  if (v6 > v4)
  {
    uint64_t v12 = *((void *)a2 + 2);
    long long v13 = *a2;
    uint64_t v14 = *((void *)a3 + 2);
    *a2 = *a3;
    *((void *)a2 + 2) = v14;
    *a3 = v13;
    *((void *)a3 + 2) = v12;
    LODWORD(v12) = *((_DWORD *)a2 + 6);
    *((_DWORD *)a2 + 6) = *((_DWORD *)a3 + 6);
    *((_DWORD *)a3 + 6) = v12;
    unint64_t v11 = (int *)a2 + 7;
    LODWORD(v12) = *((_DWORD *)a2 + 7);
    *((_DWORD *)a2 + 7) = *((_DWORD *)a3 + 7);
    *((_DWORD *)a3 + 7) = v12;
    LODWORD(v12) = *((_DWORD *)a2 + 8);
    *((_DWORD *)a2 + 8) = *((_DWORD *)a3 + 8);
    *((_DWORD *)a3 + 8) = v12;
    if (*((_DWORD *)a2 + 8) > *v5)
    {
      uint64_t v15 = *((void *)result + 2);
      long long v16 = *result;
      uint64_t v17 = *((void *)a2 + 2);
      *__n128 result = *a2;
      *((void *)result + 2) = v17;
      *a2 = v16;
      *((void *)a2 + 2) = v15;
      LODWORD(v15) = *((_DWORD *)result + 6);
      *((_DWORD *)result + 6) = *((_DWORD *)a2 + 6);
      *((_DWORD *)a2 + 6) = v15;
      std::string::size_type v7 = (int *)result + 7;
LABEL_10:
      int v25 = *v7;
      *std::string::size_type v7 = *v11;
      *unint64_t v11 = v25;
      int v26 = *v5;
      *BOOL v5 = *v3;
      int *v3 = v26;
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (a2 - a1) >> 3;
  BOOL result = 1;
  switch(0xCCCCCCCCCCCCCCCDLL * v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      if (*(_DWORD *)(a2 - 8) > *(_DWORD *)(a1 + 32))
      {
        uint64_t v6 = *(void *)(a1 + 16);
        long long v7 = *(_OWORD *)a1;
        uint64_t v8 = *(void *)(a2 - 24);
        *(_OWORD *)a1 = *(_OWORD *)(a2 - 40);
        *(void *)(a1 + 16) = v8;
        *(_OWORD *)(a2 - 40) = v7;
        *(void *)(a2 - 24) = v6;
        LODWORD(v6) = *(_DWORD *)(a1 + 24);
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 - 16);
        *(_DWORD *)(a2 - 16) = v6;
        LODWORD(v6) = *(_DWORD *)(a1 + 28);
        *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 - 12);
        *(_DWORD *)(a2 - 12) = v6;
        LODWORD(v6) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 - 8);
        *(_DWORD *)(a2 - 8) = v6;
      }
      return result;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((long long *)a1, (long long *)(a1 + 40), (long long *)(a2 - 40));
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(a1, a1 + 40, a1 + 80, a2 - 40);
      return 1;
    case 5uLL:
      std::__sort5_maybe_branchless[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *,0>((__n128 *)a1, (__n128 *)(a1 + 40), (__n128 *)(a1 + 80), (__n128 *)(a1 + 120), (__n128 *)(a2 - 40));
      return 1;
    default:
      uint64_t v9 = a1 + 80;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((long long *)a1, (long long *)(a1 + 40), (long long *)(a1 + 80));
      uint64_t v10 = a1 + 120;
      if (a1 + 120 == a2) {
        return 1;
      }
      uint64_t v11 = 0;
      int v12 = 0;
      break;
  }
  while (1)
  {
    unsigned int v13 = *(_DWORD *)(v10 + 32);
    if (v13 > *(_DWORD *)(v9 + 32))
    {
      uint64_t v14 = *(void *)v10;
      *(void *)uint64_t v20 = *(void *)(v10 + 8);
      *(void *)&v20[7] = *(void *)(v10 + 15);
      char v15 = *(unsigned char *)(v10 + 23);
      *(void *)(v10 + 8) = 0;
      *(void *)(v10 + 16) = 0;
      *(void *)uint64_t v10 = 0;
      uint64_t v16 = *(void *)(v10 + 24);
      uint64_t v17 = v11;
      while (1)
      {
        uint64_t v18 = a1 + v17;
        std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(a1 + v17 + 120, (__n128 *)(a1 + v17 + 80));
        *(_DWORD *)(a1 + v17 + 152) = *(_DWORD *)(a1 + v17 + 112);
        if (v17 == -80) {
          break;
        }
        v17 -= 40;
        if (v13 <= *(_DWORD *)(v18 + 72))
        {
          uint64_t v19 = a1 + v17 + 120;
          goto LABEL_12;
        }
      }
      uint64_t v19 = a1;
LABEL_12:
      if (*(char *)(v19 + 23) < 0) {
        operator delete(*(void **)v19);
      }
      *(void *)uint64_t v19 = v14;
      *(void *)(v19 + 8) = *(void *)v20;
      *(void *)(v19 + 15) = *(void *)&v20[7];
      *(unsigned char *)(v19 + 23) = v15;
      *(void *)(v19 + 24) = v16;
      *(_DWORD *)(v19 + 32) = v13;
      if (++v12 == 8) {
        return v10 + 40 == a2;
      }
    }
    uint64_t v9 = v10;
    v11 += 40;
    v10 += 40;
    if (v10 == a2) {
      return 1;
    }
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,MTLArchiveUsageDB::getPrioritizedList(void)::$_0 &,std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int> *>((long long *)a1, (long long *)a2, (long long *)a3);
  if (*(_DWORD *)(a4 + 32) > *(_DWORD *)(a3 + 32))
  {
    uint64_t v9 = *(void *)(a3 + 16);
    __n128 result = *(__n128 *)a3;
    uint64_t v10 = *(void *)(a4 + 16);
    *(_OWORD *)a3 = *(_OWORD *)a4;
    *(void *)(a3 + 16) = v10;
    *(__n128 *)a4 = result;
    *(void *)(a4 + 16) = v9;
    LODWORD(v9) = *(_DWORD *)(a3 + 24);
    *(_DWORD *)(a3 + 24) = *(_DWORD *)(a4 + 24);
    *(_DWORD *)(a4 + 24) = v9;
    LODWORD(v9) = *(_DWORD *)(a3 + 28);
    *(_DWORD *)(a3 + 28) = *(_DWORD *)(a4 + 28);
    *(_DWORD *)(a4 + 28) = v9;
    LODWORD(v9) = *(_DWORD *)(a3 + 32);
    *(_DWORD *)(a3 + 32) = *(_DWORD *)(a4 + 32);
    *(_DWORD *)(a4 + 32) = v9;
    if (*(_DWORD *)(a3 + 32) > *(_DWORD *)(a2 + 32))
    {
      uint64_t v11 = *(void *)(a2 + 16);
      __n128 result = *(__n128 *)a2;
      uint64_t v12 = *(void *)(a3 + 16);
      *(_OWORD *)a2 = *(_OWORD *)a3;
      *(void *)(a2 + 16) = v12;
      *(__n128 *)a3 = result;
      *(void *)(a3 + 16) = v11;
      LODWORD(v11) = *(_DWORD *)(a2 + 24);
      *(_DWORD *)(a2 + 24) = *(_DWORD *)(a3 + 24);
      *(_DWORD *)(a3 + 24) = v11;
      LODWORD(v11) = *(_DWORD *)(a2 + 28);
      *(_DWORD *)(a2 + 28) = *(_DWORD *)(a3 + 28);
      *(_DWORD *)(a3 + 28) = v11;
      LODWORD(v11) = *(_DWORD *)(a2 + 32);
      *(_DWORD *)(a2 + 32) = *(_DWORD *)(a3 + 32);
      *(_DWORD *)(a3 + 32) = v11;
      if (*(_DWORD *)(a2 + 32) > *(_DWORD *)(a1 + 32))
      {
        uint64_t v13 = *(void *)(a1 + 16);
        __n128 result = *(__n128 *)a1;
        uint64_t v14 = *(void *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(void *)(a1 + 16) = v14;
        *(__n128 *)a2 = result;
        *(void *)(a2 + 16) = v13;
        LODWORD(v13) = *(_DWORD *)(a1 + 24);
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a2 + 24);
        *(_DWORD *)(a2 + 24) = v13;
        LODWORD(v13) = *(_DWORD *)(a1 + 28);
        *(_DWORD *)(a1 + 28) = *(_DWORD *)(a2 + 28);
        *(_DWORD *)(a2 + 28) = v13;
        LODWORD(v13) = *(_DWORD *)(a1 + 32);
        *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
        *(_DWORD *)(a2 + 32) = v13;
      }
    }
  }
  return result;
}

__n128 std::__memberwise_forward_assign[abi:ne180100]<std::tuple<std::string,unsigned int,unsigned int>,std::tuple<std::string,unsigned int,unsigned int>,std::string,unsigned int,unsigned int,0ul,1ul,2ul>(uint64_t a1, __n128 *a2)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  __n128 result = *a2;
  *(void *)(a1 + 16) = a2[1].n128_u64[0];
  *(__n128 *)a1 = result;
  a2[1].n128_u8[7] = 0;
  a2->n128_u8[0] = 0;
  *(_DWORD *)(a1 + 24) = a2[1].n128_u32[2];
  *(_DWORD *)(a1 + 28) = a2[1].n128_u32[3];
  return result;
}

uint64_t std::vector<std::tuple<std::string,unsigned int,unsigned int>>::push_back[abi:ne180100](uint64_t *a1, long long *a2)
{
  unint64_t v6 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(result - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t)(v7 - *a1) >> 5;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 59) {
      std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v5 - *a1;
    if (v12 >> 4 > v11) {
      unint64_t v11 = v12 >> 4;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v13 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    v17[4] = result;
    if (v13) {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>(result, v13);
    }
    else {
      uint64_t v14 = 0;
    }
    char v15 = &v14[32 * v10];
    v17[0] = v14;
    v17[1] = v15;
    v17[3] = &v14[32 * v13];
    long long v16 = *a2;
    *((void *)v15 + 2) = *((void *)a2 + 2);
    *(_OWORD *)char v15 = v16;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    *((_DWORD *)v15 + 6) = *((_DWORD *)a2 + 6);
    *((_DWORD *)v15 + 7) = *((_DWORD *)a2 + 7);
    v17[2] = v15 + 32;
    std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__swap_out_circular_buffer(a1, v17);
    uint64_t v9 = a1[1];
    uint64_t result = std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::~__split_buffer((uint64_t)v17);
  }
  else
  {
    long long v8 = *a2;
    *(void *)(v7 + 16) = *((void *)a2 + 2);
    *(_OWORD *)unint64_t v7 = v8;
    *((void *)a2 + 1) = 0;
    *((void *)a2 + 2) = 0;
    *(void *)a2 = 0;
    *(_DWORD *)(v7 + 24) = *((_DWORD *)a2 + 6);
    *(_DWORD *)(v7 + 28) = *((_DWORD *)a2 + 7);
    uint64_t v9 = v7 + 32;
    a1[1] = v7 + 32;
  }
  a1[1] = v9;
  return result;
}

void sub_100006434(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v15 = a6;
  *((void *)&v15 + 1) = a7;
  long long v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }
  else
  {
    uint64_t v8 = a7;
    do
    {
      long long v9 = *(_OWORD *)(a3 - 32);
      *(void *)(v8 - 16) = *(void *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(void *)(a3 - 24) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 32) = 0;
      *(_DWORD *)(v8 - 8) = *(_DWORD *)(a3 - 8);
      *(_DWORD *)(v8 - 4) = *(_DWORD *)(a3 - 4);
      v8 -= 32;
      v7 -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::tuple<std::string,unsigned int,unsigned int>>,std::reverse_iterator<std::tuple<std::string,unsigned int,unsigned int>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0) {
      operator delete(*(void **)v1);
    }
    v1 += 32;
  }
}

uint64_t std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<std::tuple<std::string,unsigned int,unsigned int>>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 4;
      *(void *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }
      uint64_t v2 = v5;
    }
    while (v5 != a2);
  }
}

const char *MTLAssetUpgraderD::archiveTypeToString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_100020638[a1];
  }
}

const char *MTLAssetUpgraderD::dynamicLibraryTypeToString(unsigned int a1)
{
  if (a1 > 4) {
    return "Unknown";
  }
  else {
    return off_100020660[a1];
  }
}

void MTLAssetUpgraderD::listPrioritizedAppLaunches(uint64_t a1@<X8>)
{
  uint64_t v3 = BiomeLibrary();
  uint64_t v4 = [v3 App];
  uint64_t v5 = [v4 InFocus];
  unint64_t v28 = [v5 publisher];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_2;
  v37[3] = &unk_100020570;
  id v6 = objc_alloc_init((Class)NSCountedSet);
  id v38 = v6;
  id v7 = [v28 sinkWithCompletion:&__block_literal_global receiveInput:v37];
  uint64_t v8 = [v6 allObjects];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_3;
  v35[3] = &unk_100020598;
  id v26 = v6;
  id v36 = v26;
  long long v9 = [v8 sortedArrayUsingComparator:v35];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.__first_) = 138412290;
    *(std::__split_buffer<std::string>::pointer *)((char *)&buf.__first_ + 4) = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "sorted: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v10 = v9;
  id v11 = unk_1000247A8(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(v10);
        }
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[*(id *)(*((void *)&v31 + 1) + 8 * i) UTF8String]);
        unint64_t v15 = *(void *)(a1 + 8);
        unint64_t v14 = *(void *)(a1 + 16);
        if (v15 >= v14)
        {
          unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v15 - *(void *)a1) >> 3);
          unint64_t v18 = v17 + 1;
          if (v17 + 1 > 0xAAAAAAAAAAAAAAALL) {
            std::vector<std::pair<std::tuple<std::string,unsigned int,unsigned int>,unsigned int>>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - *(void *)a1) >> 3);
          if (2 * v19 > v18) {
            unint64_t v18 = 2 * v19;
          }
          if (v19 >= 0x555555555555555) {
            unint64_t v20 = 0xAAAAAAAAAAAAAAALL;
          }
          else {
            unint64_t v20 = v18;
          }
          buf.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 16);
          if (v20) {
            int v21 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(a1 + 16, v20);
          }
          else {
            int v21 = 0;
          }
          uint64_t v22 = v21 + v17;
          buf.__first_ = v21;
          buf.__begin_ = v22;
          buf.__end_cap_.__value_ = &v21[v20];
          long long v23 = *(_OWORD *)__p;
          v22->__r_.__value_.__r.__words[2] = v30;
          *(_OWORD *)&v22->__r_.__value_.__l.__data_ = v23;
          __p[1] = 0;
          std::string::size_type v30 = 0;
          __p[0] = 0;
          buf.__end_ = v22 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &buf);
          uint64_t v24 = *(void *)(a1 + 8);
          std::__split_buffer<std::string>::~__split_buffer(&buf);
          int v25 = SHIBYTE(v30);
          *(void *)(a1 + 8) = v24;
          if (v25 < 0) {
            operator delete(__p[0]);
          }
        }
        else
        {
          long long v16 = *(_OWORD *)__p;
          *(void *)(v15 + 16) = v30;
          *(_OWORD *)unint64_t v15 = v16;
          *(void *)(a1 + 8) = v15 + 24;
        }
      }
      id v11 = unk_1000247B0(v10, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v11);
  }
}

void sub_100006AD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37)
{
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke(id a1, BPSCompletion *a2)
{
  uint64_t v2 = a2;
  if ([(BPSCompletion *)v2 state] && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = [(BPSCompletion *)v2 error];
    id v4 = [v3 description];
    ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_cold_1((uint64_t)[v4 UTF8String], (uint64_t)&v5, v4, v3);
  }
}

void sub_100006C5C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v10 = v3;
    id v4 = [v3 eventBody];
    if ([v4 starting])
    {
      uint64_t v5 = [v10 eventBody];
      id v6 = [v5 bundleID];
      unsigned __int8 v7 = [v6 hasPrefix:@"com.apple."];

      id v3 = v10;
      if (v7) {
        goto LABEL_6;
      }
      uint64_t v8 = *(void **)(a1 + 32);
      id v4 = [v10 eventBody];
      long long v9 = [v4 bundleID];
      [v8 addObject:v9];
    }
    id v3 = v10;
  }
LABEL_6:
}

void sub_100006D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) countForObject:v5];
  if (v7 >= [*(id *)(a1 + 32) countForObject:v6])
  {
    id v9 = [*(id *)(a1 + 32) countForObject:v5];
    if (v9 <= [*(id *)(a1 + 32) countForObject:v6]) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

void sub_100006E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::getArchiveType(uint64_t a1, uint64_t *a2, void *a3)
{
  id v4 = a3;
  if (*((char *)a2 + 23) >= 0) {
    id v5 = a2;
  }
  else {
    id v5 = (uint64_t *)*a2;
  }
  id v6 = +[NSString stringWithUTF8String:v5];
  id v7 = +[NSURL fileURLWithPath:v6];
  id v11 = 0;
  id v8 = +[_MTLBinaryArchive archiveTypeAtURL:v7 device:v4 error:&v11];
  id v9 = v11;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    MTLAssetUpgraderD::getArchiveType();
    if (!v9) {
      goto LABEL_8;
    }
  }
  else if (!v9)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    MTLAssetUpgraderD::getArchiveType();
  }
LABEL_8:

  return v8;
}

void sub_100006F84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::getDynamicLibraryType(uint64_t a1, uint64_t *a2, void *a3)
{
  id v4 = a3;
  if (*((char *)a2 + 23) >= 0) {
    id v5 = a2;
  }
  else {
    id v5 = (uint64_t *)*a2;
  }
  id v6 = +[NSString stringWithUTF8String:v5];
  id v7 = +[NSURL fileURLWithPath:v6];
  id v11 = 0;
  id v8 = +[_MTLDynamicLibrary dynamicLibraryTypeAtURL:v7 device:v4 error:&v11];
  id v9 = v11;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    MTLAssetUpgraderD::getDynamicLibraryType();
    if (!v9) {
      goto LABEL_8;
    }
  }
  else if (!v9)
  {
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    MTLAssetUpgraderD::getArchiveType();
  }
LABEL_8:

  return v8;
}

void sub_1000070D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MTLAssetUpgraderD::addRecompilationWork(MTLAssetUpgraderD *a1, int a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  if (a7 | a6)
  {
    MTLAssetUpgraderD::findDevice(a1, a6, a7);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v61 = obj;
    uint64_t v10 = +[NSArray arrayWithObjects:&v61 count:1];
  }
  else
  {
    id obj = MTLCreateSystemDefaultDevice();
    id v62 = obj;
    uint64_t v10 = +[NSArray arrayWithObjects:&v62 count:1];
  }
  id v11 = (void *)v10;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obja = v11;
  id v12 = [obja countByEnumeratingWithState:&v49 objects:v60 count:16];
  id v14 = v12;
  if (v12)
  {
    uint64_t v45 = *(void *)v50;
    *(void *)&long long v13 = 136315650;
    long long v40 = v13;
    do
    {
      unint64_t v15 = 0;
      do
      {
        if (*(void *)v50 != v45) {
          objc_enumerationMutation(obja);
        }
        long long v16 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v15);
        id ArchiveType = MTLAssetUpgraderD::getArchiveType((uint64_t)v12, (uint64_t *)a4, v16);
        int v18 = (int)ArchiveType;
        unsigned int DynamicLibraryType = MTLAssetUpgraderD::getDynamicLibraryType((uint64_t)ArchiveType, (uint64_t *)a4, v16);
        if (a5 == 1 && v18 == 1)
        {
          unint64_t v20 = MTLAssetUpgraderD::getCacheDirectory(3, (uint64_t *)a3);
          if (v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
          {
            int v42 = *(char *)(a3 + 23);
            uint64_t v41 = *(void *)a3;
            id v36 = [v20 fileSystemRepresentation];
            uint64_t v37 = v41;
            if (v42 >= 0) {
              uint64_t v37 = a3;
            }
            if (*(char *)(a4 + 23) >= 0) {
              uint64_t v38 = a4;
            }
            else {
              uint64_t v38 = *(void *)a4;
            }
            *(_DWORD *)std::string __p = v40;
            *(void *)&__p[4] = v37;
            *(_WORD *)&__p[12] = 2080;
            *(void *)&__p[14] = v36;
            __int16 v54 = 2080;
            uint64_t v55 = v38;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "addRecompilationWork: pruning (app = %s cache=%s archive=%s)", __p, 0x20u);
          }
        }
        BOOL v23 = v18 == 3 || DynamicLibraryType == 1 || DynamicLibraryType == 3;
        uint64_t v24 = [v16 targetDeviceArchitecture:v40];
        if (a5) {
          BOOL v25 = 0;
        }
        else {
          BOOL v25 = v23;
        }
        if (v25)
        {
          id v26 = MTLAssetUpgraderD::getCacheDirectory(0, (uint64_t *)a3);
          unsigned int v27 = [v26 URLByAppendingPathComponent:@"archiveMapping.db"];

          id v28 = v27;
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v28 fileSystemRepresentation]);
          MTLArchiveMapDB::MTLArchiveMapDB((void **)v48, (uint64_t)__p);
          if (SHIBYTE(v54) < 0) {
            operator delete(*(void **)__p);
          }
          [v24 cpuType];
          [v24 subType];
          MTLArchiveMapDB::read(v48, a4, __p);
          BOOL v29 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
          if (v29)
          {
            unsigned int v35 = __p;
            if (v54 < 0) {
              unsigned int v35 = *(unsigned char **)__p;
            }
            *(_DWORD *)std::__split_buffer<std::string> buf = 138412546;
            id v57 = v28;
            __int16 v58 = 2080;
            v59 = v35;
            _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "addRecompilationWork: remap(%@) -> '%s'", buf, 0x16u);
          }
          if (SHIBYTE(v54) < 0)
          {
            if (!*(void *)&__p[8])
            {
              operator delete(*(void **)__p);
LABEL_49:
              MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v48);

LABEL_50:
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                MTLAssetUpgraderD::addRecompilationWork(&v46, v47);
              }
              RecompilationWork::RecompilationWork((uint64_t)__p, (long long *)a3, (long long *)a4, a5, (int)[v24 cpuType], (int)[v24 subType]);
              RecompilationWork::serialize((RecompilationWork *)__p);
            }
          }
          else if (!HIBYTE(v54))
          {
            goto LABEL_49;
          }
          id v30 = MTLAssetUpgraderD::getArchiveType(v29, (uint64_t *)__p, v16);
          int v31 = (int)v30;
          unsigned int v32 = MTLAssetUpgraderD::getDynamicLibraryType((uint64_t)v30, (uint64_t *)a4, v16);
          LOBYTE(v23) = v31 == 3 || v32 == 1 || v32 == 3;
          if (SHIBYTE(v54) < 0) {
            operator delete(*(void **)__p);
          }
          MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v48);
        }
        if (v23) {
          goto LABEL_50;
        }

        unint64_t v15 = (char *)v15 + 1;
      }
      while (v14 != v15);
      id v12 = [obja countByEnumeratingWithState:&v49 objects:v60 count:16];
      id v14 = v12;
    }
    while (v12);
  }

  return 0;
}

void sub_1000075E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::findDevice(MTLAssetUpgraderD *this, int a2, int a3)
{
  id v5 = MTLCreateSystemDefaultDevice();
  id v20 = v5;
  id v6 = +[NSArray arrayWithObjects:&v20 count:1];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = [v11 targetDeviceArchitecture:v15];
        if ([v12 cpuType] == a2 && objc_msgSend(v12, "subType") == a3)
        {
          id v13 = v11;

          goto LABEL_12;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_12:

  return v13;
}

void sub_100007830(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::getCacheDirectory(int a1, uint64_t *a2)
{
  id v4 = objc_alloc_init((Class)NSFileManager);
  if (*((char *)a2 + 23) >= 0) {
    id v5 = a2;
  }
  else {
    id v5 = (uint64_t *)*a2;
  }
  id v6 = +[NSString stringWithUTF8String:v5];
  if (a1 == 2)
  {
    id v36 = 0;
    id v7 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v36];
    id v8 = v36;
    MTLAssetUpgraderD::resolveFileURL(v7, v9);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v35 = 0;
    id v7 = (MTLAssetUpgraderD *)[objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v6 allowPlaceholder:0 error:&v35];
    id v8 = v35;
    if (v8)
    {
      id v10 = 0;
    }
    else
    {
      id v33 = 0;
      id v34 = 0;
      [(MTLAssetUpgraderD *)v7 getDataContainerURL:&v34 error:&v33];
      id v11 = (MTLAssetUpgraderD *)v34;
      id v12 = v33;
      id v8 = v12;
      if (v11)
      {
        id v14 = MTLAssetUpgraderD::resolveFileURL(v11, v13);

        id v10 = [v14 URLByAppendingPathComponent:@"Library/Caches/"];
      }
      else
      {
        id v32 = v12;
        id v14 = [v4 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v32];
        id v15 = v32;

        MTLAssetUpgraderD::resolveFileURL((MTLAssetUpgraderD *)v14, v16);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v8 = v15;
      }
    }
  }

  if (v8 || !v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      [v8 userInfo];
      objc_claimAutoreleasedReturnValue();
      MTLAssetUpgraderD::getCacheDirectory();
    }
    id v20 = 0;
  }
  else
  {
    switch(a1)
    {
      case 0:
        long long v17 = [v10 URLByAppendingPathComponent:@"com.apple.metalassetupgrader"];

        long long v18 = [v17 URLByAppendingPathComponent:@"recompiled"];

        uint64_t v19 = [v18 URLByAppendingPathComponent:v6];
        goto LABEL_21;
      case 1:
        v42[0] = @"com.apple.metalassetupgrader";
        v42[1] = @"recompiled";
        v42[2] = v6;
        long long v18 = +[NSArray arrayWithObjects:v42 count:3];
        int v21 = +[NSString pathWithComponents:v18];
        uint64_t v22 = [v10 URLByAppendingPathComponent:v21];

        id v10 = (id)v22;
        goto LABEL_22;
      case 2:
        uint64_t v19 = [v10 URLByAppendingPathComponent:@"com.apple.MTLAssetUpgraderD"];
        long long v18 = v10;
LABEL_21:
        id v10 = (id)v19;
LABEL_22:

        goto LABEL_23;
      case 3:
        v41[0] = v6;
        v41[1] = @"com.apple.metal";
        id v26 = +[NSArray arrayWithObjects:v41 count:2];
        unsigned int v27 = +[NSString pathWithComponents:v26];
        id v28 = [v10 URLByAppendingPathComponent:v27];

        id v31 = 0;
        unsigned __int8 v29 = [v28 checkResourceIsReachableAndReturnError:&v31];
        id v8 = v31;
        if (v29)
        {
          id v10 = v28;
LABEL_24:
          id v30 = v8;
          unsigned __int8 v23 = [v4 createDirectoryAtURL:v10 withIntermediateDirectories:1 attributes:0 error:&v30];
          id v24 = v30;

          if (v23)
          {
            id v10 = v10;
            id v8 = v24;
            id v20 = v10;
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)std::__split_buffer<std::string> buf = 138412546;
              id v38 = v10;
              __int16 v39 = 2112;
              id v40 = v24;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Failed to create cache directory '%@': %@", buf, 0x16u);
            }
            id v20 = 0;
            id v8 = v24;
          }
        }
        else
        {
          id v20 = 0;
          id v10 = v28;
        }
        break;
      default:
LABEL_23:
        id v8 = 0;
        goto LABEL_24;
    }
  }

  return v20;
}

void sub_100007D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void RecompilationWork::serialize(RecompilationWork *this)
{
  *((void *)this + 13) = *((void *)this + 3) + *((void *)this + 4) + 40;
  if (*((void *)this + 12)) {
    operator delete[]();
  }
  operator new[]();
}

uint64_t MTLWorkQueue<RecompilationWork>::push(unsigned int *a1)
{
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v18, (MTLVersionedDB *)a1);
  if (v18)
  {
    uint64_t v17 = 0;
    int v2 = mdb_cursor_open(v18, a1[2], &v17);
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v3 = mdb_strerror(v2);
        MTLWorkQueue<RecompilationWork>::push((uint64_t)v3, (uint64_t)v20);
      }
    }
    else
    {
      for (int i = mdb_cursor_get(v17, v20, v16, 0); !i; int i = mdb_cursor_get(v17, v20, v16, 8))
      {
        if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v20[0], (char *)v20[1])) {
          operator new();
        }
      }
      int v13 = mdb_cursor_get(v17, v20, v16, 6);
      if (!v13) {
        int v13 = mdb_cursor_get(v17, v20, v16, 12);
      }
      if (v13 == -30798 || !v13) {
        operator new();
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        id v14 = mdb_strerror(v13);
        MTLWorkQueue<RecompilationWork>::push((uint64_t)v14, (uint64_t)&v19);
      }
    }
  }
  else
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      MTLWorkQueue<RecompilationWork>::push(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v18);
  return 0;
}

void sub_1000081EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::processAppEvent(MTLAssetUpgraderD *a1, uint64_t *a2, int a3)
{
  if (isValidAppName((char *)a2) && a3)
  {
    uint64_t v19 = MTLAssetUpgraderD::getAppBundleDirectory(a2);
    if (v19)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        MTLAssetUpgraderD::processAppEvent();
      }
      std::string::basic_string[abi:ne180100]<0>(__p, "");
      BOOL v4 = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)__p);
      id v18 = [v4 URLByAppendingPathComponent:@"upgraderWork.db"];

      if (SHIBYTE(v31) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v5 = v18;
      if (v18)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v18 fileSystemRepresentation]);
        MTLVersionedDB::MTLVersionedDB(v29, (uint64_t)__p, 5, 1, 0);
        if (SHIBYTE(v31) < 0) {
          operator delete(__p[0]);
        }
        id v17 = objc_alloc_init((Class)NSFileManager);
        NSURLResourceKey v37 = NSURLNameKey;
        uint64_t v6 = +[NSArray arrayWithObjects:&v37 count:1];
        uint64_t v7 = [v17 enumeratorAtURL:v19 includingPropertiesForKeys:v6 options:0 errorHandler:0];

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v25 objects:v36 count:16];
        if (v9)
        {
          char v10 = 0;
          uint64_t v11 = *(void *)v26;
          do
          {
            for (int i = 0; i != v9; int i = (char *)i + 1)
            {
              if (*(void *)v26 != v11) {
                objc_enumerationMutation(v8);
              }
              int v13 = *(void **)(*((void *)&v25 + 1) + 8 * i);
              id v24 = 0;
              [v13 getResourceValue:&v24 forKey:NSURLNameKey error:0];
              id v15 = v24;
              if ([v15 hasSuffix:@".metallib"])
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
                  MTLAssetUpgraderD::processAppEvent(buf, (uint64_t)v13, &v35);
                }
                if ([v13 getFileSystemRepresentation:__p maxLength:1024])
                {
                  std::string::basic_string[abi:ne180100]<0>(v22, (char *)__p);
                  char v16 = MTLAssetUpgraderD::addRecompilationWork(a1, (int)v29, (uint64_t)a2, (uint64_t)v22, 0, 0, 0);
                  if (v23 < 0) {
                    operator delete(v22[0]);
                  }
                  v10 |= v16;
                }
              }
            }
            id v9 = [v8 countByEnumeratingWithState:&v25 objects:v36 count:16];
          }
          while (v9);

          if (v10)
          {
            __p[0] = _NSConcreteStackBlock;
            __p[1] = (void *)3221225472;
            id v31 = ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke;
            id v32 = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
            id v33 = a1;
            xpc_activity_register("com.apple.MTLAssetUpgraderD.recompilationActivity", XPC_ACTIVITY_CHECK_IN, __p);
          }
        }
        else
        {
        }
        MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v29);
        uint64_t v5 = v18;
      }
    }
  }
}

void sub_10000864C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, int a19, __int16 a20,char a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,void *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a32);
  _Unwind_Resume(a1);
}

BOOL isValidAppName(char *a1)
{
  uint64_t v1 = a1[23];
  BOOL v2 = (v1 & 0x80u) != 0;
  if ((v1 & 0x80u) != 0) {
    uint64_t v1 = *((void *)a1 + 1);
  }
  if (v2) {
    id v3 = *(char **)a1;
  }
  else {
    id v3 = a1;
  }
  BOOL v4 = &v3[v1];
  if (v1 >= 10)
  {
    uint64_t v5 = v3;
    do
    {
      uint64_t v6 = (char *)memchr(v5, 99, v1 - 9);
      if (!v6) {
        break;
      }
      if (*(void *)v6 == 0x6C7070612E6D6F63 && *((_WORD *)v6 + 4) == 11877) {
        return v6 == v4 || v6 != v3;
      }
      uint64_t v5 = v6 + 1;
      uint64_t v1 = v4 - (unsigned char *)v5;
    }
    while (v4 - (unsigned char *)v5 > 9);
  }
  uint64_t v6 = v4;
  return v6 == v4 || v6 != v3;
}

id MTLAssetUpgraderD::getAppBundleDirectory(uint64_t *a1)
{
  id v2 = objc_alloc((Class)LSApplicationRecord);
  if (*((char *)a1 + 23) >= 0) {
    id v3 = a1;
  }
  else {
    id v3 = (uint64_t *)*a1;
  }
  BOOL v4 = +[NSString stringWithUTF8String:v3];
  id v9 = 0;
  id v5 = [v2 initWithBundleIdentifier:v4 allowPlaceholder:0 error:&v9];
  id v6 = v9;

  if (v6)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [v5 URL];
  }

  return v7;
}

void sub_100008898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::kickRecompilationActivity(MTLAssetUpgraderD *this)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = this;
  xpc_activity_register("com.apple.MTLAssetUpgraderD.recompilationActivity", XPC_ACTIVITY_CHECK_IN, handler);
}

void MTLAssetUpgraderD::setupAppHandler(NSObject **this)
{
  uint64_t v1 = *this;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = this;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", v1, handler);
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = *(MTLAssetUpgraderD **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v5 = xpc_copy_description(v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_5();
    }
    free(v5);
  }
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  uint64_t v7 = string;
  if (string)
  {
    int v8 = strcmp(string, "Application Installed");
    if (!v8 || !strcmp(v7, "Application Uninstalled"))
    {
      id v9 = xpc_dictionary_get_value(v3, "UserInfo");
      char v10 = v9;
      if (v9)
      {
        if (xpc_get_type(v9) == (xpc_type_t)&_xpc_type_dictionary)
        {
          BOOL v28 = xpc_dictionary_get_BOOL(v10, "isPlaceholder");
          unsigned __int8 v29 = xpc_dictionary_get_array(v10, "bundleIDs");
          if (!v28)
          {
            for (size_t i = 0; i < xpc_array_get_count(v29); ++i)
            {
              id v32 = (char *)xpc_array_get_string(v29, i);
              std::string::basic_string[abi:ne180100]<0>(__p, v32);
              MTLAssetUpgraderD::processAppEvent(v4, (uint64_t *)__p, v8 == 0);
              if (v34 < 0) {
                operator delete(__p[0]);
              }
            }
          }
        }
        else
        {
          BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v11) {
            ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_3(v11, v12, v13, v14, v15, v16, v17, v18);
          }
        }
      }
      else
      {
        BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v20) {
          ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_2(v20, v21, v22, v23, v24, v25, v26, v27);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_4();
    }
  }
  else
  {
    uint64_t v19 = xpc_copy_description(v3);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_1();
    }
    free(v19);
  }
}

void sub_100008BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::generateArchiveName(const char *a1@<X0>, void *a2@<X8>)
{
  id v14 = objc_alloc_init((Class)NSFileManager);
  if (a1[23] >= 0) {
    BOOL v4 = a1;
  }
  else {
    BOOL v4 = *(const char **)a1;
  }
  mkdir(v4, 0x1EDu);
  do
  {
    id v5 = +[NSUUID UUID];
    id v6 = [v5 UUIDString];

    int v7 = a1[23];
    int v8 = *(uint64_t **)a1;
    id v9 = v6;
    id v10 = [v9 UTF8String];
    if (v7 >= 0) {
      BOOL v11 = (uint64_t *)a1;
    }
    else {
      BOOL v11 = v8;
    }
    uint64_t v12 = +[NSString stringWithFormat:@"%s/%s.metallib", v11, v10];
    if ([v14 fileExistsAtPath:v12])
    {

      uint64_t v12 = 0;
    }
  }
  while (!v12);
  id v13 = v12;
  std::string::basic_string[abi:ne180100]<0>(a2, (char *)[v13 UTF8String]);
}

void sub_100008D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

id MTLAssetUpgraderD::resolveFileURL(MTLAssetUpgraderD *this, NSURL *a2)
{
  id v2 = this;
  id v3 = v2;
  if (v2
    && ([(MTLAssetUpgraderD *)v2 isFileURL] & 1) != 0
    && (BOOL v4 = realpath_DARWIN_EXTSN((const char *)[(MTLAssetUpgraderD *)v3 fileSystemRepresentation], 0)) != 0)
  {
    id v5 = +[NSString stringWithUTF8String:v4];
    id v6 = +[NSURL fileURLWithPath:v5];

    free(v4);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void sub_100008E7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::processPrune(MTLAssetUpgraderD *this)
{
  MTLAssetUpgraderD::listPrioritizedAppLaunches((uint64_t)&v11);
  uint64_t v1 = v11;
  id v2 = v12;
  if (v11 != v12)
  {
    while (1)
    {
      if (*((char *)v1 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v10, *(const std::string::value_type **)v1, *((void *)v1 + 1));
      }
      else
      {
        long long v3 = *v1;
        v10.__r_.__value_.__r.__words[2] = *((void *)v1 + 2);
        *(_OWORD *)&v10.__r_.__value_.__l.__data_ = v3;
      }
      BOOL v4 = MTLAssetUpgraderD::getCacheDirectory(3, (uint64_t *)&v10);
      id v5 = [v4 URLByAppendingPathComponent:@"archiveUsage.db"];

      if (!v5) {
        break;
      }
      id v6 = v5;
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v6 fileSystemRepresentation]);
      MTLArchiveUsageDB::MTLArchiveUsageDB(v9, (uint64_t)__p);
      if (v8 < 0) {
        operator delete(__p[0]);
      }
      MTLArchiveUsageDB::prune((MTLArchiveUsageDB *)v9, 2419200);
      MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v9);

      if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v10.__r_.__value_.__l.__data_);
      }
      uint64_t v1 = (long long *)((char *)v1 + 24);
      if (v1 == v2) {
        goto LABEL_14;
      }
    }
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v10.__r_.__value_.__l.__data_);
    }
  }
LABEL_14:
  v10.__r_.__value_.__r.__words[0] = (std::string::size_type)&v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v10);
}

void sub_100008FD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, uint64_t a17, char *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,char a24)
{
  std::string __p = &a24;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  _Unwind_Resume(a1);
}

uint64_t MTLAssetUpgraderD::getRecompilationType(void *a1, void *a2, uint64_t *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (*((char *)a3 + 23) >= 0) {
    int v7 = a3;
  }
  else {
    int v7 = (uint64_t *)*a3;
  }
  char v8 = +[NSString stringWithUTF8String:v7];
  id v9 = +[NSURL fileURLWithPath:v8];
  BOOL v11 = MTLAssetUpgraderD::resolveFileURL(v9, v10);

  if (v11)
  {
    uint64_t v24 = 0;
    if (v6)
    {
      uint64_t v12 = +[NSFileManager defaultManager];
      id v23 = 0;
      unsigned __int8 v13 = [v12 getRelationship:&v24 ofDirectoryAtURL:v6 toItemAtURL:v11 error:&v23];
      id v14 = v23;

      if (v24) {
        unsigned __int8 v15 = 0;
      }
      else {
        unsigned __int8 v15 = v13;
      }
      if (v15)
      {
        uint64_t v16 = 1;
LABEL_21:

        goto LABEL_22;
      }
      uint64_t v17 = v14;
      if (!v5) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v17 = 0;
      if (!v5)
      {
LABEL_19:
        id v14 = v17;
        goto LABEL_20;
      }
    }
    uint64_t v18 = +[NSFileManager defaultManager];
    id v22 = v17;
    unsigned __int8 v19 = [v18 getRelationship:&v24 ofDirectoryAtURL:v5 toItemAtURL:v11 error:&v22];
    id v14 = v22;

    if (v24) {
      unsigned __int8 v20 = 0;
    }
    else {
      unsigned __int8 v20 = v19;
    }
    if (v20)
    {
      uint64_t v16 = 0;
      goto LABEL_21;
    }
LABEL_20:
    uint64_t v16 = 2;
    goto LABEL_21;
  }
  uint64_t v16 = 2;
LABEL_22:

  return v16;
}

void sub_1000091DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t MTLAssetUpgraderD::getRecompilationType(uint64_t *a1, uint64_t *a2)
{
  BOOL v4 = MTLAssetUpgraderD::getAppBundleDirectory(a1);
  id v5 = MTLAssetUpgraderD::getCacheDirectory(3, a1);
  uint64_t RecompilationType = MTLAssetUpgraderD::getRecompilationType(v4, v5, a2);

  return RecompilationType;
}

void sub_1000092A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::processOSUpdate(MTLAssetUpgraderD *this)
{
  std::string::basic_string[abi:ne180100]<0>(&buf, "");
  id v23 = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)&buf);
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(buf.__r_.__value_.__l.__data_);
  }
  uint64_t v1 = [v23 URLByAppendingPathComponent:@"upgraderWork.db"];
  if (v1)
  {
    id v22 = v1;
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v1 fileSystemRepresentation]);
    MTLVersionedDB::MTLVersionedDB(v35, (uint64_t)&buf, 5, 1, 0);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(buf.__r_.__value_.__l.__data_);
    }
    MTLAssetUpgraderD::listPrioritizedAppLaunches((uint64_t)&v33);
    id v2 = v33;
    uint64_t v25 = v34;
    if (v33 != v34)
    {
      int v27 = 0;
      do
      {
        if (*((char *)v2 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)v2, *((void *)v2 + 1));
        }
        else
        {
          long long v3 = *v2;
          v32.__r_.__value_.__r.__words[2] = *((void *)v2 + 2);
          *(_OWORD *)&v32.__r_.__value_.__l.__data_ = v3;
        }
        id v5 = MTLAssetUpgraderD::getAppBundleDirectory((uint64_t *)&v32);
        id v6 = MTLAssetUpgraderD::getCacheDirectory(3, (uint64_t *)&v32);
        int v7 = [v6 URLByAppendingPathComponent:@"archiveUsage.db"];
        char v8 = v7;
        if (v5 && v7)
        {
          id v31 = 0;
          unsigned __int8 v9 = [v7 checkResourceIsReachableAndReturnError:&v31];
          id v10 = v31;
          if (v9)
          {
            id v24 = v10;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v11 = &v32;
              if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                BOOL v11 = (std::string *)v32.__r_.__value_.__r.__words[0];
              }
              LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
              *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v11;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "processOSUpdate: updating bundleID %s", (uint8_t *)&buf, 0xCu);
            }
            std::string::basic_string[abi:ne180100]<0>(&buf, (char *)[v8 fileSystemRepresentation]);
            MTLArchiveUsageDB::MTLArchiveUsageDB(v30, (uint64_t)&buf);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
              operator delete(buf.__r_.__value_.__l.__data_);
            }
            MTLArchiveUsageDB::getPrioritizedList((MTLArchiveUsageDB *)v30, v29);
            uint64_t v12 = (long long *)v29[0];
            uint64_t v13 = v29[1];
            while (v12 != (long long *)v13)
            {
              std::__tuple_impl<std::__tuple_indices<0ul,1ul,2ul>,std::string,unsigned int,unsigned int>::__tuple_impl(&buf, v12);
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                std::string::__init_copy_ctor_external(&v28, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
              }
              else {
                std::string v28 = buf;
              }
              id v14 = +[NSFileManager defaultManager];
              if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                unsigned __int8 v15 = &v28;
              }
              else {
                unsigned __int8 v15 = (std::string *)v28.__r_.__value_.__r.__words[0];
              }
              uint64_t v16 = +[NSString stringWithUTF8String:v15];
              unsigned __int8 v17 = [v14 fileExistsAtPath:v16];

              if (v17)
              {
                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v18 = &v28;
                  if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                    uint64_t v18 = (std::string *)v28.__r_.__value_.__r.__words[0];
                  }
                  *(_DWORD *)id v36 = 136315138;
                  NSURLResourceKey v37 = v18;
                  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "processOSUpdate: updating archive %s", v36, 0xCu);
                }
                int RecompilationType = MTLAssetUpgraderD::getRecompilationType(v5, v6, (uint64_t *)&v28);
                if (RecompilationType == 2)
                {
                  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
                  {
                    unsigned __int8 v20 = &v32;
                    if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                      unsigned __int8 v20 = (std::string *)v32.__r_.__value_.__r.__words[0];
                    }
                    uint64_t v21 = &v28;
                    if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                      uint64_t v21 = (std::string *)v28.__r_.__value_.__r.__words[0];
                    }
                    *(_DWORD *)id v36 = 136315394;
                    NSURLResourceKey v37 = v20;
                    __int16 v38 = 2080;
                    __int16 v39 = v21;
                    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "processOSUpdate: Invalid recompilation bundleID=%s archive=%s", v36, 0x16u);
                  }
                }
                else
                {
                  v27 |= MTLAssetUpgraderD::addRecompilationWork(this, (int)v35, (uint64_t)&v32, (uint64_t)&v28, RecompilationType, (int)v41, SHIDWORD(v41));
                }
              }
              if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v28.__r_.__value_.__l.__data_);
              }
              if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(buf.__r_.__value_.__l.__data_);
              }
              v12 += 2;
            }
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
            std::vector<std::tuple<std::string,unsigned int,unsigned int>>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
            MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v30);
            id v10 = v24;
          }
        }
        if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v32.__r_.__value_.__l.__data_);
        }
        id v2 = (long long *)((char *)v2 + 24);
      }
      while (v2 != v25);
      if (v27)
      {
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)_NSConcreteStackBlock;
        buf.__r_.__value_.__l.__size_ = 3221225472;
        buf.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke;
        uint64_t v41 = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
        int v42 = this;
        xpc_activity_register("com.apple.MTLAssetUpgraderD.recompilationActivity", XPC_ACTIVITY_CHECK_IN, &buf);
      }
    }
    buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v33;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v35);
    uint64_t v1 = v22;
  }
}

void sub_100009804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,char *__p,uint64_t a35,int a36,__int16 a37,char a38,char a39,char a40)
{
  std::string __p = &a40;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)(v40 - 192));

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::setupXPCActivityHandler(MTLAssetUpgraderD *this)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = this;
  xpc_activity_register("com.apple.MTLAssetUpgraderD.os-update", XPC_ACTIVITY_CHECK_IN, handler);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_91;
  v2[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  v2[4] = this;
  xpc_activity_register("com.apple.MTLAssetUpgraderD.prune", XPC_ACTIVITY_CHECK_IN, v2);
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke(uint64_t a1, void *a2)
{
  long long v3 = a2;
  BOOL v4 = *(MTLAssetUpgraderD **)(a1 + 32);
  BOOL v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v6) {
    ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
  if (xpc_activity_get_state(v3)) {
    MTLAssetUpgraderD::processOSUpdate(v4);
  }
}

void sub_100009ACC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_91(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4) {
    ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_91_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  state = (MTLAssetUpgraderD *)xpc_activity_get_state(v2);
  if (state) {
    MTLAssetUpgraderD::processPrune(state);
  }
}

void sub_100009B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::popCurrentWorkItem(MTLAssetUpgraderD *this)
{
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v1 = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)__p);
  id v2 = [v1 URLByAppendingPathComponent:@"upgraderWork.db"];

  if (v5 < 0)
  {
    operator delete(__p[0]);
    if (!v2) {
      goto LABEL_8;
    }
  }
  else if (!v2)
  {
    goto LABEL_8;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)[v2 fileSystemRepresentation]);
  MTLVersionedDB::MTLVersionedDB((void **)v3, (uint64_t)__p, 5, 1, 0);
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  MTLWorkQueue<RecompilationWork>::pop(v3);
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v3);
LABEL_8:
}

void sub_100009C24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a10);

  _Unwind_Resume(a1);
}

void MTLWorkQueue<RecompilationWork>::pop(unsigned int *a1)
{
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v10, (MTLVersionedDB *)a1);
  if (!v10) {
    goto LABEL_15;
  }
  uint64_t v9 = 0;
  int v2 = mdb_cursor_open(v10, a1[2], &v9);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      long long v3 = mdb_strerror(v2);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v3, (uint64_t)v12);
    }
    goto LABEL_15;
  }
  int v4 = mdb_cursor_get(v9, v12, v8, 0);
  if (!v4)
  {
    if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v12[0], (char *)v12[1]))
    {
LABEL_10:
      int v5 = mdb_cursor_del(v9, 0);
      if (v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = mdb_strerror(v5);
        MTLWorkQueue<RecompilationWork>::pop((uint64_t)v6, (uint64_t)v11);
      }
      goto LABEL_15;
    }
    int v4 = mdb_cursor_get(v9, v12, v8, 8);
  }
  if (v4 == -30798) {
    goto LABEL_15;
  }
  if (!v4) {
    goto LABEL_10;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = mdb_strerror(v4);
    MTLWorkQueue<RecompilationWork>::push((uint64_t)v7, (uint64_t)v11);
  }
LABEL_15:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v10);
}

void sub_100009DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::remapTemporary(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (*(char *)(v4 + 71) < 0) {
    std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)(v4 + 48), *(void *)(v4 + 56));
  }
  else {
    std::string v32 = *(std::string *)(v4 + 48);
  }
  uint64_t v5 = MTLAssetUpgraderD::getCacheDirectory(1, (uint64_t *)&v32);
  uint64_t v6 = (void *)v5;
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v32.__r_.__value_.__l.__data_);
    if (!v6) {
      goto LABEL_70;
    }
  }
  else if (!v5)
  {
    goto LABEL_70;
  }
  std::string::basic_string[abi:ne180100]<0>(&v32, (char *)[v6 fileSystemRepresentation]);
  MTLAssetUpgraderD::generateArchiveName((const char *)&v32, __p);
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v32.__r_.__value_.__l.__data_);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = __p;
    if (v30 < 0) {
      uint64_t v7 = (void **)__p[0];
    }
    LODWORD(v32.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)v32.__r_.__value_.__r.__words + 4) = (std::string::size_type)v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: rename bundle temporary to %s", (uint8_t *)&v32, 0xCu);
  }
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v8 = (const char *)a2;
  }
  else {
    uint64_t v8 = *(const char **)a2;
  }
  if (v30 >= 0) {
    uint64_t v9 = __p;
  }
  else {
    uint64_t v9 = (void **)__p[0];
  }
  if (renamex_np(v8, (const char *)v9, 0x10u))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      if (v30 >= 0) {
        uint64_t v10 = __p;
      }
      else {
        uint64_t v10 = (void **)__p[0];
      }
      if (*(char *)(a2 + 23) < 0) {
        a2 = *(void *)a2;
      }
      uint64_t v11 = __error();
      uint64_t v12 = strerror(*v11);
      MTLAssetUpgraderD::remapTemporary((uint64_t)v12, (uint64_t)&v32, (uint64_t)v10, a2);
    }
    id v13 = 0;
    goto LABEL_67;
  }
  uint64_t v14 = *(void *)(a1 + 8);
  if (*(char *)(v14 + 71) < 0) {
    std::string::__init_copy_ctor_external(&v32, *(const std::string::value_type **)(v14 + 48), *(void *)(v14 + 56));
  }
  else {
    std::string v32 = *(std::string *)(v14 + 48);
  }
  unsigned __int8 v15 = MTLAssetUpgraderD::getCacheDirectory(0, (uint64_t *)&v32);
  uint64_t v16 = [v15 URLByAppendingPathComponent:@"archiveMapping.db"];

  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
  {
    operator delete(v32.__r_.__value_.__l.__data_);
    if (v16)
    {
LABEL_34:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        LODWORD(v32.__r_.__value_.__l.__data_) = 138412290;
        *(std::string::size_type *)((char *)v32.__r_.__value_.__r.__words + 4) = (std::string::size_type)v16;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: storing bundle archive map %@", (uint8_t *)&v32, 0xCu);
      }
      std::string::basic_string[abi:ne180100]<0>(&v32, (char *)[v16 fileSystemRepresentation]);
      MTLArchiveMapDB::MTLArchiveMapDB((void **)v28, (uint64_t)&v32);
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v32.__r_.__value_.__l.__data_);
      }
      uint64_t v17 = *(void *)(a1 + 8);
      if (*(char *)(v17 + 95) < 0) {
        std::string::__init_copy_ctor_external(&v31, *(const std::string::value_type **)(v17 + 72), *(void *)(v17 + 80));
      }
      else {
        std::string v31 = *(std::string *)(v17 + 72);
      }
      MTLArchiveMapDB::read(v28, (uint64_t)&v31, &v32);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
      uint64_t v18 = *(void *)(a1 + 8);
      if (*(char *)(v18 + 95) < 0)
      {
        std::string::__init_copy_ctor_external(&v31, *(const std::string::value_type **)(v18 + 72), *(void *)(v18 + 80));
        uint64_t v18 = *(void *)(a1 + 8);
      }
      else
      {
        std::string v31 = *(std::string *)(v18 + 72);
      }
      MTLArchiveMapDB::store((MTLVersionedDB *)v28, (uint64_t)&v31, (uint64_t *)__p, *(_DWORD *)(v18 + 12), *(_DWORD *)(v18 + 16));
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v31.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
      {
        if (!v32.__r_.__value_.__l.__size_)
        {
          id v13 = 0;
LABEL_63:
          if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0) {
            operator delete(v32.__r_.__value_.__l.__data_);
          }
          goto LABEL_65;
        }
      }
      else if (!*((unsigned char *)&v32.__r_.__value_.__s + 23))
      {
        id v13 = 0;
LABEL_65:
        MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v28);
        goto LABEL_66;
      }
      unsigned __int8 v19 = +[NSFileManager defaultManager];
      if ((v32.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
        unsigned __int8 v20 = &v32;
      }
      else {
        unsigned __int8 v20 = (std::string *)v32.__r_.__value_.__r.__words[0];
      }
      uint64_t v21 = +[NSString stringWithUTF8String:v20];
      id v27 = 0;
      [v19 removeItemAtPath:v21 error:&v27];
      id v13 = v27;

      if (v13 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v22 = SHIBYTE(v32.__r_.__value_.__r.__words[2]);
        std::string::size_type v23 = v32.__r_.__value_.__r.__words[0];
        uint64_t v24 = [v13 userInfo];
        uint64_t v25 = (void *)v24;
        uint64_t v26 = &v32;
        if (v22 < 0) {
          uint64_t v26 = (std::string *)v23;
        }
        LODWORD(v31.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)v31.__r_.__value_.__r.__words + 4) = (std::string::size_type)v26;
        WORD2(v31.__r_.__value_.__r.__words[1]) = 2112;
        *(std::string::size_type *)((char *)&v31.__r_.__value_.__r.__words[1] + 6) = v24;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: removal of replaced binary archive '%s' failed: %@", (uint8_t *)&v31, 0x16u);
      }
      goto LABEL_63;
    }
  }
  else if (v16)
  {
    goto LABEL_34;
  }
  id v13 = 0;
LABEL_66:

LABEL_67:
  if (v30 < 0) {
    operator delete(__p[0]);
  }

LABEL_70:
}

void sub_10000A2EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  if (a30 < 0) {
    operator delete(__p);
  }
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a10);

  if (a17 < 0) {
    operator delete(a12);
  }

  _Unwind_Resume(a1);
}

BOOL MTLAssetUpgraderD::recompileSingleStep(MTLAssetUpgraderD *this)
{
  std::string::basic_string[abi:ne180100]<0>(&__p, "");
  int v2 = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)&__p.st_dev);
  long long v3 = [v2 URLByAppendingPathComponent:@"upgraderWork.db"];

  if (SHIBYTE(__p.st_gid) < 0)
  {
    operator delete(*(void **)&__p.st_dev);
    if (v3)
    {
LABEL_3:
      std::string::basic_string[abi:ne180100]<0>(&__p, (char *)[v3 fileSystemRepresentation]);
      MTLVersionedDB::MTLVersionedDB((void **)v142, (uint64_t)&__p, 5, 1, 0);
      if (SHIBYTE(__p.st_gid) < 0) {
        operator delete(*(void **)&__p.st_dev);
      }
      MTLWorkQueue<RecompilationWork>::peek(v142, &v141);
      BOOL v4 = v141 != 0;
      if (!v141) {
        goto LABEL_48;
      }
      if (*(_DWORD *)(v141 + 40) == 1)
      {
        id v5 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          if (*(char *)(v141 + 95) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v144, *(const std::string::value_type **)(v141 + 72), *(void *)(v141 + 80));
          }
          else
          {
            *(_OWORD *)v144 = *(_OWORD *)(v141 + 72);
            *(void *)&v144[16] = *(void *)(v141 + 88);
          }
          MTLAssetUpgraderD::recompileSingleStep();
        }
LABEL_44:

LABEL_45:
        MTLWorkQueue<RecompilationWork>::pop(v142);
LABEL_46:
        uint64_t v19 = v141;
        uint64_t v141 = 0;
        if (v19) {
          (*(void (**)(uint64_t))(*(void *)v19 + 8))(v19);
        }
LABEL_48:
        MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v142);
        goto LABEL_49;
      }
      MTLWorkQueue<RecompilationWork>::setState(v142);
      if (*(char *)(v141 + 71) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&__p, *(const std::string::value_type **)(v141 + 48), *(void *)(v141 + 56));
      }
      else
      {
        *(_OWORD *)&__p.st_dev = *(_OWORD *)(v141 + 48);
        *(void *)&__p.st_uid = *(void *)(v141 + 64);
      }
      BOOL valid = isValidAppName((char *)&__p);
      BOOL v7 = valid;
      if (SHIBYTE(__p.st_gid) < 0)
      {
        operator delete(*(void **)&__p.st_dev);
        if (v7)
        {
LABEL_17:
          uint64_t v8 = v141;
          if (*(char *)(v141 + 71) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)&__p, *(const std::string::value_type **)(v141 + 48), *(void *)(v141 + 56));
            uint64_t v8 = v141;
          }
          else
          {
            *(_OWORD *)&__p.st_dev = *(_OWORD *)(v141 + 48);
            *(void *)&__p.st_uid = *(void *)(v141 + 64);
          }
          if (*(char *)(v8 + 95) < 0)
          {
            std::string::__init_copy_ctor_external((std::string *)v144, *(const std::string::value_type **)(v8 + 72), *(void *)(v8 + 80));
          }
          else
          {
            *(_OWORD *)v144 = *(_OWORD *)(v8 + 72);
            *(void *)&v144[16] = *(void *)(v8 + 88);
          }
          int RecompilationType = (MTLAssetUpgraderD *)MTLAssetUpgraderD::getRecompilationType((uint64_t *)&__p.st_dev, (uint64_t *)v144);
          int v11 = (int)RecompilationType;
          int v12 = *(_DWORD *)(v141 + 8);
          if ((v144[23] & 0x80000000) != 0) {
            operator delete(*(void **)v144);
          }
          if (SHIBYTE(__p.st_gid) < 0) {
            operator delete(*(void **)&__p.st_dev);
          }
          if (v11 != v12)
          {
            id v18 = &_os_log_default;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              uint64_t v41 = v141;
              if (*(char *)(v141 + 71) < 0)
              {
                std::string::__init_copy_ctor_external((std::string *)&__p, *(const std::string::value_type **)(v141 + 48), *(void *)(v141 + 56));
                uint64_t v41 = v141;
              }
              else
              {
                *(_OWORD *)&__p.st_dev = *(_OWORD *)(v141 + 48);
                *(void *)&__p.st_uid = *(void *)(v141 + 64);
              }
              if ((__p.st_gid & 0x80000000) == 0) {
                p_p = &__p;
              }
              else {
                p_p = *(stat **)&__p.st_dev;
              }
              if (*(char *)(v41 + 95) < 0)
              {
                std::string::__init_copy_ctor_external((std::string *)v144, *(const std::string::value_type **)(v41 + 72), *(void *)(v41 + 80));
              }
              else
              {
                *(_OWORD *)v144 = *(_OWORD *)(v41 + 72);
                *(void *)&v144[16] = *(void *)(v41 + 88);
              }
              unsigned int v43 = v144;
              if (v144[23] < 0) {
                unsigned int v43 = *(unsigned char **)v144;
              }
              LODWORD(v146.__r_.__value_.__l.__data_) = 136315394;
              *(std::string::size_type *)((char *)v146.__r_.__value_.__r.__words + 4) = (std::string::size_type)p_p;
              WORD2(v146.__r_.__value_.__r.__words[1]) = 2080;
              *(std::string::size_type *)((char *)&v146.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v43;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: invalid archive for recompilation bundleID=%s archivePath=%s", (uint8_t *)&v146, 0x16u);
              if ((v144[23] & 0x80000000) != 0) {
                operator delete(*(void **)v144);
              }
              if (SHIBYTE(__p.st_gid) < 0) {
                operator delete(*(void **)&__p.st_dev);
              }
            }
            goto LABEL_44;
          }
          uint64_t v13 = MTLAssetUpgraderD::findDevice(RecompilationType, *(_DWORD *)(v141 + 12), *(_DWORD *)(v141 + 16));
          uint64_t v14 = (void *)*((void *)this + 2);
          *((void *)this + 2) = v13;

          if (!*((void *)this + 2))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              int v22 = *(_DWORD *)(v141 + 12);
              int v21 = *(_DWORD *)(v141 + 16);
              __p.st_dev = 67109376;
              *(_DWORD *)&__p.st_mode = v22;
              LOWORD(__p.st_ino) = 1024;
              *(_DWORD *)((char *)&__p.st_ino + 2) = v21;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: couldn't find device for (%08X %08X)", (uint8_t *)&__p, 0xEu);
            }
            goto LABEL_45;
          }
          uint64_t v16 = (char *)this + 8;
          uint64_t v15 = *((void *)this + 1);
          uint64_t v17 = v141;
          uint64_t v141 = 0;
          *((void *)this + 1) = v17;
          if (v15)
          {
            (*(void (**)(uint64_t))(*(void *)v15 + 8))(v15);
            uint64_t v17 = *(void *)v16;
          }
          if (*(char *)(v17 + 95) < 0) {
            std::string::__init_copy_ctor_external(&v146, *(const std::string::value_type **)(v17 + 72), *(void *)(v17 + 80));
          }
          else {
            std::string v146 = *(std::string *)(v17 + 72);
          }
          std::string::size_type v23 = objc_opt_new();
          if ((v146.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
            uint64_t v24 = &v146;
          }
          else {
            uint64_t v24 = (std::string *)v146.__r_.__value_.__r.__words[0];
          }
          uint64_t v25 = +[NSString stringWithUTF8String:v24];
          uint64_t v26 = +[NSURL fileURLWithPath:v25];
          [v23 setUrl:v26];

          [v23 setOptions:[v23 options] | 0x18];
          id v27 = [v23 url];
          LOBYTE(v26) = stat((const char *)[v27 fileSystemRepresentation], &__p) == 0;

          if ((v26 & 1) == 0)
          {
            BOOL v28 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v28)
            {
              [v23 url];
              objc_claimAutoreleasedReturnValue();
              MTLAssetUpgraderD::recompileSingleStep();
            }
            MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v28);
            id v29 = 0;
            goto LABEL_170;
          }
          std::string::basic_string[abi:ne180100]<0>(v144, "");
          char v30 = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)v144);
          if ((v144[23] & 0x80000000) != 0) {
            operator delete(*(void **)v144);
          }
          long long v124 = v30;
          id v125 = [v30 URLByAppendingPathComponent:@"temp"];
          std::string v31 = +[NSFileManager defaultManager];
          id v140 = 0;
          unsigned __int8 v32 = [v31 createDirectoryAtURL:v125 withIntermediateDirectories:1 attributes:0 error:&v140];
          id v29 = v140;

          if ((v32 & 1) == 0)
          {
            BOOL v39 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v39) {
              MTLAssetUpgraderD::recompileSingleStep();
            }
            uint64_t v40 = v125;
            MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v39);
            goto LABEL_169;
          }
          std::string::basic_string[abi:ne180100]<0>(v144, (char *)[v125 fileSystemRepresentation]);
          MTLAssetUpgraderD::generateArchiveName(v144, v138);
          if ((v144[23] & 0x80000000) != 0) {
            operator delete(*(void **)v144);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            id v33 = v138;
            if (v139 < 0) {
              id v33 = (void **)v138[0];
            }
            *(_DWORD *)v144 = 136315138;
            *(void *)&v144[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: bundle temporary location %s", v144, 0xCu);
          }
          char v34 = [v23 url];
          uint64_t v35 = *((void *)this + 2);
          id v137 = v29;
          unsigned int v36 = +[_MTLBinaryArchive archiveTypeAtURL:v34 device:v35 error:&v137];
          id v37 = v137;

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            if (v36 > 4) {
              __int16 v38 = "Unknown";
            }
            else {
              __int16 v38 = off_100020638[v36];
            }
            unint64_t v44 = [v23 url];
            *(_DWORD *)v144 = 136315394;
            *(void *)&v144[4] = v38;
            *(_WORD *)&v144[12] = 2112;
            *(void *)&v144[14] = v44;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: %s - %@", v144, 0x16u);
          }
          if (v36 != 3)
          {
            long long v48 = [v23 url];
            uint64_t v49 = *((void *)this + 2);
            id v136 = v37;
            unsigned int v50 = +[_MTLDynamicLibrary dynamicLibraryTypeAtURL:v48 device:v49 error:&v136];
            id v51 = v136;

            long long v52 = v51;
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              if (v50 > 4) {
                unsigned int v53 = "Unknown";
              }
              else {
                unsigned int v53 = off_100020660[v50];
              }
              BOOL v60 = [v23 url];
              *(_DWORD *)v144 = 136315394;
              *(void *)&v144[4] = v53;
              *(_WORD *)&v144[12] = 2112;
              *(void *)&v144[14] = v60;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: %s - %@", v144, 0x16u);
            }
            if ((v50 & 0xFFFFFFFD) != 1)
            {
              BOOL v66 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
              if (v66)
              {
                uint64_t v67 = [v23 url];
                *(_DWORD *)v144 = 138412290;
                *(void *)&v144[4] = v67;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: %@ has unexpected dylib type", v144, 0xCu);
              }
              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v66);
              goto LABEL_166;
            }

            id v61 = (void *)*((void *)this + 2);
            id v62 = [v23 url];
            id v135 = 0;
            id v123 = [v61 newDynamicLibraryWithURL:v62 error:&v135];
            id v46 = v135;

            if (v46)
            {
              BOOL v63 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v63)
              {
                unsigned int v64 = [v23 url];
                uint64_t v65 = [v46 userInfo];
                MTLAssetUpgraderD::recompileSingleStep(v64, v65, v144);
              }
              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v63);
              goto LABEL_165;
            }
            if (v139 >= 0) {
              uint64_t v68 = v138;
            }
            else {
              uint64_t v68 = (void **)v138[0];
            }
            uint64_t v69 = +[NSString stringWithUTF8String:v68];
            uint64_t v70 = +[NSURL fileURLWithPath:v69];
            id v134 = 0;
            [v123 serializeToURL:v70 error:&v134];
            id v46 = v134;

            if (v46)
            {
              BOOL v71 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v71)
              {
                [v23 url];
                objc_claimAutoreleasedReturnValue();
                MTLAssetUpgraderD::recompileSingleStep();
              }
              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v71);
              goto LABEL_165;
            }
            MTLAssetUpgraderD::remapTemporary((uint64_t)this, (uint64_t)v138);
            goto LABEL_164;
          }
          uint64_t v45 = (void *)*((void *)this + 2);
          id v133 = v37;
          id v123 = [v45 newBinaryArchiveWithDescriptor:v23 error:&v133];
          id v46 = v133;

          if (v46)
          {
            BOOL v47 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v47)
            {
              int v85 = SHIBYTE(v146.__r_.__value_.__r.__words[2]);
              std::string::size_type v86 = v146.__r_.__value_.__r.__words[0];
              uint64_t v87 = [v46 userInfo];
              int v88 = (void *)v87;
              uint64_t v89 = &v146;
              if (v85 < 0) {
                uint64_t v89 = (std::string *)v86;
              }
              *(_DWORD *)v144 = 136315394;
              *(void *)&v144[4] = v89;
              *(_WORD *)&v144[12] = 2112;
              *(void *)&v144[14] = v87;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: failed open of archive '%s': %@", v144, 0x16u);
            }
            MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v47);
LABEL_165:

            long long v52 = v46;
            goto LABEL_166;
          }
          if (v139 >= 0) {
            __int16 v54 = v138;
          }
          else {
            __int16 v54 = (void **)v138[0];
          }
          uint64_t v55 = +[NSString stringWithUTF8String:v54];
          int v56 = +[NSURL fileURLWithPath:v55];
          id v132 = 0;
          unsigned __int8 v57 = [v123 recompileToArchiveWithURL:v56 error:&v132];
          id v46 = v132;

          uint64_t v58 = *(void *)v16;
          int v59 = *(_DWORD *)(*(void *)v16 + 8);
          if (!v59)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              int64_t v72 = v138;
              if (v139 < 0) {
                int64_t v72 = (void **)v138[0];
              }
              *(_DWORD *)v144 = 136315138;
              *(void *)&v144[4] = v72;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: serialize bundle temporary %s", v144, 0xCu);
            }
            if ((v57 & 1) == 0)
            {
              BOOL v73 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
              if (v73)
              {
                int v102 = SHIBYTE(v146.__r_.__value_.__r.__words[2]);
                std::string::size_type v103 = v146.__r_.__value_.__r.__words[0];
                int v104 = v139;
                char v105 = (void **)v138[0];
                uint64_t v106 = [v46 userInfo];
                v107 = (void *)v106;
                v108 = v138;
                if (v104 < 0) {
                  v108 = v105;
                }
                *(_DWORD *)v144 = 136315650;
                unsigned int v109 = &v146;
                if (v102 < 0) {
                  unsigned int v109 = (std::string *)v103;
                }
                *(void *)&v144[4] = v109;
                *(_WORD *)&v144[12] = 2080;
                *(void *)&v144[14] = v108;
                *(_WORD *)&v144[22] = 2112;
                *(void *)&v144[24] = v106;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: recompilation failed for archive '%s' to '%s' : %@", v144, 0x20u);
              }
              MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v73);
              goto LABEL_165;
            }
            MTLAssetUpgraderD::remapTemporary((uint64_t)this, (uint64_t)v138);
            goto LABEL_164;
          }
          if (v59 != 1)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
              MTLAssetUpgraderD::recompileSingleStep((uint64_t)this + 8);
            }
            goto LABEL_164;
          }
          if (*(char *)(v58 + 95) < 0) {
            std::string::__init_copy_ctor_external(&v131, *(const std::string::value_type **)(v58 + 72), *(void *)(v58 + 80));
          }
          else {
            std::string v131 = *(std::string *)(v58 + 72);
          }
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            uint64_t v74 = v138;
            if (v139 < 0) {
              uint64_t v74 = (void **)v138[0];
            }
            *(_DWORD *)v144 = 136315138;
            *(void *)&v144[4] = v74;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: serialize cache temporary %s", v144, 0xCu);
          }
          if (v57)
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
            {
              v75 = &v131;
              if ((v131.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
                v75 = (std::string *)v131.__r_.__value_.__r.__words[0];
              }
              *(_DWORD *)v144 = 136315138;
              *(void *)&v144[4] = v75;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "recompilation: rename cache temporary to %s", v144, 0xCu);
            }
            if (v139 >= 0) {
              BOOL v76 = v138;
            }
            else {
              BOOL v76 = (void **)v138[0];
            }
            if ((v131.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
              unsigned __int32 v77 = &v131;
            }
            else {
              unsigned __int32 v77 = (std::string *)v131.__r_.__value_.__r.__words[0];
            }
            if (!renamex_np((const char *)v76, (const char *)v77, 0x10u))
            {
              v121 = objc_opt_new();
              if ((v131.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v90 = &v131;
              }
              else {
                uint64_t v90 = (std::string *)v131.__r_.__value_.__r.__words[0];
              }
              uint64_t v91 = +[NSString stringWithUTF8String:v90];
              uint64_t v92 = +[NSURL fileURLWithPath:v91];
              [v121 setUrl:v92];

              unsigned int v93 = (void *)*((void *)this + 2);
              id v130 = v46;
              id v119 = [v93 newBinaryArchiveWithDescriptor:v121 error:&v130];
              id v120 = v130;

              if (v120)
              {
                BOOL v94 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
                if (v94)
                {
                  [v120 userInfo];
                  objc_claimAutoreleasedReturnValue();
                  MTLAssetUpgraderD::recompileSingleStep();
                }
                MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v94);
                int v83 = 1;
              }
              else
              {
                unint64_t v118 = [v119 archiveFunctionIds];
                id v95 = objc_alloc_init((Class)NSMutableArray);
                long long v128 = 0u;
                long long v129 = 0u;
                long long v126 = 0u;
                long long v127 = 0u;
                id obj = v118;
                id v96 = [obj countByEnumeratingWithState:&v126 objects:v143 count:16];
                if (v96)
                {
                  uint64_t v97 = *(void *)v127;
                  do
                  {
                    for (size_t i = 0; i != v96; size_t i = (char *)i + 1)
                    {
                      if (*(void *)v127 != v97) {
                        objc_enumerationMutation(obj);
                      }
                      uint64_t v99 = (char *)[*(id *)(*((void *)&v126 + 1) + 8 * i) pointerValue:v118];
                      long long v100 = *(_OWORD *)(v99 + 40);
                      *(_OWORD *)v144 = *(_OWORD *)(v99 + 24);
                      *(_OWORD *)&v144[16] = v100;
                      v101 = +[NSData dataWithBytes:v144 length:32];
                      [v95 addObject:v101];
                    }
                    id v96 = [obj countByEnumeratingWithState:&v126 objects:v143 count:16];
                  }
                  while (v96);
                }

                int v83 = 2;
              }

              id v46 = v120;
LABEL_161:
              if (SHIBYTE(v131.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v131.__r_.__value_.__l.__data_);
              }
              if (v83 != 2) {
                goto LABEL_165;
              }
LABEL_164:

              MTLAssetUpgraderD::popCurrentWorkItem(v84);
              long long v52 = v46;
LABEL_166:
              if (v139 < 0) {
                operator delete(v138[0]);
              }
              id v29 = v52;
              uint64_t v40 = v125;
LABEL_169:

LABEL_170:
              if (SHIBYTE(v146.__r_.__value_.__r.__words[2]) < 0) {
                operator delete(v146.__r_.__value_.__l.__data_);
              }
              goto LABEL_46;
            }
            BOOL v78 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v78)
            {
              if ((v131.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                unint64_t v79 = &v131;
              }
              else {
                unint64_t v79 = (std::string *)v131.__r_.__value_.__r.__words[0];
              }
              if (v139 >= 0) {
                uint64_t v80 = v138;
              }
              else {
                uint64_t v80 = (void **)v138[0];
              }
              uint64_t v81 = __error();
              int64_t v82 = strerror(*v81);
              MTLAssetUpgraderD::remapTemporary((uint64_t)v82, (uint64_t)v144, (uint64_t)v79, (uint64_t)v80);
            }
          }
          else
          {
            BOOL v78 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
            if (v78)
            {
              int v110 = SHIBYTE(v146.__r_.__value_.__r.__words[2]);
              std::string::size_type v111 = v146.__r_.__value_.__r.__words[0];
              int v112 = v139;
              unsigned __int8 v113 = (void **)v138[0];
              uint64_t v114 = [v46 userInfo];
              v115 = (void *)v114;
              unint64_t v116 = v138;
              if (v112 < 0) {
                unint64_t v116 = v113;
              }
              *(_DWORD *)v144 = 136315650;
              v117 = &v146;
              if (v110 < 0) {
                v117 = (std::string *)v111;
              }
              *(void *)&v144[4] = v117;
              *(_WORD *)&v144[12] = 2080;
              *(void *)&v144[14] = v116;
              *(_WORD *)&v144[22] = 2112;
              *(void *)&v144[24] = v114;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: recompilation failed for archive '%s' to '%s' : %@", v144, 0x20u);
            }
          }
          MTLAssetUpgraderD::popCurrentWorkItem((MTLAssetUpgraderD *)v78);
          int v83 = 1;
          goto LABEL_161;
        }
      }
      else if (valid)
      {
        goto LABEL_17;
      }
      id v9 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        if (*(char *)(v141 + 71) < 0)
        {
          std::string::__init_copy_ctor_external((std::string *)&__p, *(const std::string::value_type **)(v141 + 48), *(void *)(v141 + 56));
        }
        else
        {
          *(_OWORD *)&__p.st_dev = *(_OWORD *)(v141 + 48);
          *(void *)&__p.st_uid = *(void *)(v141 + 64);
        }
        MTLAssetUpgraderD::recompileSingleStep();
      }
      goto LABEL_44;
    }
  }
  else if (v3)
  {
    goto LABEL_3;
  }
  BOOL v4 = 0;
LABEL_49:

  return v4;
}

void sub_10000B644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,void *__p,uint64_t a40,int a41,__int16 a42,char a43,char a44,uint64_t a45,uint64_t a46,char a47)
{
  if (a32 < 0) {
    operator delete(a27);
  }

  if (a44 < 0) {
    operator delete(__p);
  }

  if (*(char *)(v49 - 105) < 0) {
    operator delete(*(void **)(v49 - 128));
  }
  if (a46) {
    (*(void (**)(uint64_t))(*(void *)a46 + 8))(a46);
  }
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a47);

  _Unwind_Resume(a1);
}

void MTLWorkQueue<RecompilationWork>::peek(unsigned int *a1@<X0>, void *a2@<X8>)
{
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v10, (MTLVersionedDB *)a1);
  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v9 = 0;
  int v4 = mdb_cursor_open(v10, a1[2], &v9);
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v5 = mdb_strerror(v4);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v5, (uint64_t)v12);
    }
    goto LABEL_13;
  }
  int v6 = mdb_cursor_get(v9, v12, v8, 0);
  if (!v6)
  {
    if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v12[0], (char *)v12[1])) {
      goto LABEL_10;
    }
    int v6 = mdb_cursor_get(v9, v12, v8, 8);
  }
  if (v6 == -30798) {
    goto LABEL_13;
  }
  if (!v6) {
LABEL_10:
  }
    operator new();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    BOOL v7 = mdb_strerror(v6);
    MTLWorkQueue<RecompilationWork>::push((uint64_t)v7, (uint64_t)v11);
  }
LABEL_13:
  *a2 = 0;
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v10);
}

void sub_10000BB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

void MTLWorkQueue<RecompilationWork>::setState(unsigned int *a1)
{
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v8, (MTLVersionedDB *)a1);
  if (!v8) {
    goto LABEL_13;
  }
  uint64_t v7 = 0;
  int v2 = mdb_cursor_open(v8, a1[2], &v7);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      long long v3 = mdb_strerror(v2);
      MTLWorkQueue<RecompilationWork>::push((uint64_t)v3, (uint64_t)v10);
    }
    goto LABEL_13;
  }
  int v4 = mdb_cursor_get(v7, v10, v6, 0);
  if (!v4)
  {
    if (!MTLVersionedDB::isVersionEntry((uint64_t)a1, v10[0], (char *)v10[1])) {
      goto LABEL_10;
    }
    int v4 = mdb_cursor_get(v7, v10, v6, 8);
  }
  if (v4 == -30798) {
    goto LABEL_13;
  }
  if (!v4) {
LABEL_10:
  }
    operator new();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    id v5 = mdb_strerror(v4);
    MTLWorkQueue<RecompilationWork>::push((uint64_t)v5, (uint64_t)&v9);
  }
LABEL_13:
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v8);
}

void sub_10000BE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_start(va, a4);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke(uint64_t a1, void *a2)
{
  long long v3 = a2;
  int v4 = *(MTLAssetUpgraderD **)(a1 + 32);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int state = xpc_activity_get_state(v3);
    ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_3(state, buf);
  }
  if (xpc_activity_get_state(v3))
  {
    v6.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    do
    {
      if (!MTLAssetUpgraderD::recompileSingleStep(v4)) {
        goto LABEL_22;
      }
    }
    while (std::chrono::steady_clock::now().__d_.__rep_ - v6.__d_.__rep_ < 2501000000
         || !xpc_activity_should_defer(v3));
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v7) {
      ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_2(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v15 = MTLAssetUpgraderD::getCacheDirectory(2, (uint64_t *)__p);
    empty = [v15 URLByAppendingPathComponent:@"upgraderWork.db"];

    if (v27 < 0)
    {
      operator delete(__p[0]);
      if (!empty)
      {
LABEL_18:
        if (!xpc_activity_set_state(v3, 3))
        {
          BOOL v17 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v17) {
            ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
          }
        }
        goto LABEL_21;
      }
    }
    else if (!empty)
    {
      goto LABEL_18;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)[empty fileSystemRepresentation]);
    MTLVersionedDB::MTLVersionedDB((void **)v25, (uint64_t)__p, 5, 1, 0);
    if (v27 < 0) {
      operator delete(__p[0]);
    }
    MTLWorkQueue<RecompilationWork>::setState(v25);
    MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)v25);
    goto LABEL_18;
  }
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_int64(empty, XPC_ACTIVITY_DELAY, 5);
  xpc_activity_set_criteria(v3, empty);
LABEL_21:

LABEL_22:
}

void sub_10000C0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  MTLVersionedDB::~MTLVersionedDB((MTLVersionedDB *)&a10);

  _Unwind_Resume(a1);
}

void MTLAssetUpgraderD::run(id *this)
{
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v3[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MTLAssetUpgraderD startup", (uint8_t *)v3, 2u);
  }
  memset(v3, 0, 24);
  MTLAssetUpgraderD::run(v3);
}

void sub_10000C1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
}

void MTLAssetUpgraderD::~MTLAssetUpgraderD(id *this)
{
  id v2 = this[1];
  this[1] = 0;
  if (v2) {
    (*(void (**)(id))(*(void *)v2 + 8))(v2);
  }
}

uint64_t RecompilationWork::RecompilationWork(uint64_t a1, long long *a2, long long *a3, int a4, int a5, int a6)
{
  *(void *)a1 = off_1000205E8;
  *(_DWORD *)(a1 + 8) = a4;
  *(_DWORD *)(a1 + 12) = a5;
  *(_DWORD *)(a1 + 16) = a6;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 37) = 0;
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)(a1 + 48), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v9 = *a2;
    *(void *)(a1 + 64) = *((void *)a2 + 2);
    *(_OWORD *)(a1 + 48) = v9;
  }
  uint64_t v10 = (std::string *)(a1 + 72);
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v10, *(const std::string::value_type **)a3, *((void *)a3 + 1));
  }
  else
  {
    long long v11 = *a3;
    *(void *)(a1 + 88) = *((void *)a3 + 2);
    *(_OWORD *)&v10->__r_.__value_.__l.__data_ = v11;
  }
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 104) = 0;
  uint64_t v12 = *((unsigned __int8 *)a2 + 23);
  if ((v12 & 0x80u) != 0) {
    uint64_t v12 = *((void *)a2 + 1);
  }
  *(void *)(a1 + 24) = v12;
  uint64_t v13 = *((unsigned __int8 *)a3 + 23);
  if ((v13 & 0x80u) != 0) {
    uint64_t v13 = *((void *)a3 + 1);
  }
  *(void *)(a1 + 32) = v13;
  return a1;
}

void sub_10000C340(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 71) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void RecompilationWork::~RecompilationWork(RecompilationWork *this)
{
  RecompilationWork::~RecompilationWork(this);

  operator delete();
}

{
  *(void *)this = off_1000205E8;
  if (*((void *)this + 12)) {
    operator delete[]();
  }
  if (*((char *)this + 95) < 0) {
    operator delete(*((void **)this + 9));
  }
  if (*((char *)this + 71) < 0) {
    operator delete(*((void **)this + 6));
  }
}

double RecompilationWork::deserialize(uint64_t a1, void *a2)
{
  if (*a2 >= 0x28uLL)
  {
    int v4 = (long long *)a2[1];
    long long v5 = *v4;
    long long v6 = v4[1];
    *(void *)(a1 + 40) = *((void *)v4 + 4);
    *(_OWORD *)(a1 + 24) = v6;
    *(_OWORD *)(a1 + 8) = v5;
    size_t v7 = *(void *)(a1 + 24);
    if (*a2 == v7 + *(void *)(a1 + 32) + 40)
    {
      std::string::basic_string[abi:ne180100](&__dst, (void *)(a2[1] + 40), v7);
      uint64_t v8 = (void **)(a1 + 48);
      if (*(char *)(a1 + 71) < 0) {
        operator delete(*v8);
      }
      *(_OWORD *)uint64_t v8 = __dst;
      *(void *)(a1 + 64) = v12;
      std::string::basic_string[abi:ne180100](&__dst, (void *)(a2[1] + *(void *)(a1 + 24) + 40), *(void *)(a1 + 32));
      long long v9 = (void **)(a1 + 72);
      if (*(char *)(a1 + 95) < 0) {
        operator delete(*v9);
      }
      *(void *)&long long v5 = __dst;
      *(_OWORD *)long long v9 = __dst;
      *(void *)(a1 + 88) = v12;
    }
  }
  return *(double *)&v5;
}

void RecompilationWork::serialization(RecompilationWork *this)
{
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

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  id v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    long long v3 = **a1;
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

uint64_t operator==(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 8) != *(_DWORD *)(a2 + 8)
    || *(_DWORD *)(a1 + 12) != *(_DWORD *)(a2 + 12)
    || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16))
  {
    return 0;
  }
  uint64_t v4 = *(unsigned __int8 *)(a1 + 71);
  if ((v4 & 0x80u) == 0) {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 71);
  }
  else {
    uint64_t v5 = *(void *)(a1 + 56);
  }
  uint64_t v6 = *(unsigned __int8 *)(a2 + 71);
  int v7 = (char)v6;
  if ((v6 & 0x80u) != 0) {
    uint64_t v6 = *(void *)(a2 + 56);
  }
  if (v5 != v6) {
    return 0;
  }
  uint64_t v8 = (const void **)(a1 + 48);
  if (v7 >= 0) {
    uint64_t v9 = (unsigned __int8 *)(a2 + 48);
  }
  else {
    uint64_t v9 = *(unsigned __int8 **)(a2 + 48);
  }
  if ((v4 & 0x80) != 0)
  {
    if (memcmp(*v8, v9, *(void *)(a1 + 56))) {
      return 0;
    }
  }
  else if (*(unsigned char *)(a1 + 71))
  {
    while (*(unsigned __int8 *)v8 == *v9)
    {
      uint64_t v8 = (const void **)((char *)v8 + 1);
      ++v9;
      if (!--v4) {
        goto LABEL_19;
      }
    }
    return 0;
  }
LABEL_19:
  uint64_t v10 = *(unsigned __int8 *)(a1 + 95);
  if ((v10 & 0x80u) == 0) {
    uint64_t v11 = *(unsigned __int8 *)(a1 + 95);
  }
  else {
    uint64_t v11 = *(void *)(a1 + 80);
  }
  uint64_t v12 = *(unsigned __int8 *)(a2 + 95);
  int v13 = (char)v12;
  if ((v12 & 0x80u) != 0) {
    uint64_t v12 = *(void *)(a2 + 80);
  }
  if (v11 != v12) {
    return 0;
  }
  long long v14 = (const void **)(a1 + 72);
  BOOL v17 = *(unsigned __int8 **)(a2 + 72);
  uint64_t v16 = (unsigned __int8 *)(a2 + 72);
  long long v15 = v17;
  if (v13 >= 0) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = v15;
  }
  if ((v10 & 0x80) != 0) {
    return memcmp(*v14, v18, *(void *)(a1 + 80)) == 0;
  }
  if (!*(unsigned char *)(a1 + 95)) {
    return 1;
  }
  uint64_t v19 = v10 - 1;
  do
  {
    int v21 = *(unsigned __int8 *)v14;
    long long v14 = (const void **)((char *)v14 + 1);
    int v20 = v21;
    int v23 = *v18++;
    int v22 = v23;
    BOOL v25 = v19-- != 0;
    uint64_t result = v20 == v22;
  }
  while (v20 == v22 && v25);
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_3(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  *(float *)a2 = a5;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2080;
  *(void *)(a2 + 14) = a4;
  *(_WORD *)(a2 + 22) = 2080;
  *(void *)(a2 + 24) = result;
  return result;
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void FileSignature::FileSignature(FileSignature *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
}

uint64_t FileSignature::FileSignature(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v4 = (const char *)a2;
  }
  else {
    uint64_t v4 = *(const char **)a2;
  }
  if (!stat(v4, &v11))
  {
    *(_DWORD *)a1 = v11.st_dev;
    *(void *)(a1 + 8) = v11.st_ino;
  }
  uint64_t v10 = 0;
  long long v9 = xmmword_10001B83C;
  if (*(char *)(a2 + 23) >= 0) {
    uint64_t v5 = (const char *)a2;
  }
  else {
    uint64_t v5 = *(const char **)a2;
  }
  if (!getattrlist(v5, &v9, v7, 8uLL, 0x20u)) {
    *(_DWORD *)(a1 + 16) = v8;
  }
  return a1;
}

BOOL operator==(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    return 0;
  }
  return *(void *)(a1 + 8) == *(void *)(a2 + 8)
      && *(_DWORD *)(a1 + 16) == (unint64_t)*(unsigned int *)(a2 + 16);
}

{
  BOOL v2;

  if (*(unsigned char *)(a1 + 1088)) {
    uint64_t v2 = *(unsigned char *)(a2 + 1088) == 0;
  }
  else {
    uint64_t v2 = 1;
  }
  return !v2
      && *(_DWORD *)(a1 + 8) == *(_DWORD *)(a2 + 8)
      && *(void *)(a1 + 16) == *(void *)(a2 + 16)
      && *(_DWORD *)(a1 + 24) == *(_DWORD *)(a2 + 24)
      && *(_DWORD *)(a1 + 32) == *(_DWORD *)(a2 + 32)
      && *(void *)(a1 + 40) == *(void *)(a2 + 40)
      && *(_DWORD *)(a1 + 48) == *(_DWORD *)(a2 + 48);
}

BOOL operator!=(uint64_t a1, uint64_t a2)
{
  return *(_DWORD *)a1 != *(_DWORD *)a2
      || *(void *)(a1 + 8) != *(void *)(a2 + 8)
      || *(_DWORD *)(a1 + 16) != *(_DWORD *)(a2 + 16);
}

uint64_t ArchivePayload::ArchivePayload(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  *(_DWORD *)a1 = a4;
  *(_DWORD *)(a1 + 4) = a5;
  FileSignature::FileSignature(a1 + 8, a2);
  FileSignature::FileSignature(a1 + 32, a3);
  *(void *)(a1 + 1080) = 0;
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::size_type v7 = *(void *)(a3 + 8);
    if (v7 >= 0x401)
    {
      char v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    std::string::size_type v7 = *(unsigned __int8 *)(a3 + 23);
  }
  std::string::copy((const std::string *)a3, (std::string::value_type *)(a1 + 56), v7, 0);
  uint64_t v8 = *(unsigned __int8 *)(a3 + 23);
  if ((v8 & 0x80u) != 0) {
    uint64_t v8 = *(void *)(a3 + 8);
  }
  *(void *)(a1 + 1080) = v8;
  char v9 = 1;
LABEL_8:
  *(unsigned char *)(a1 + 1088) = v9;
  return a1;
}

_DWORD *ArchivePayload::ArchivePayload(_DWORD *__dst, size_t __n, void *__src)
{
  __dst[2] = 0;
  *((void *)__dst + 2) = 0;
  __dst[6] = 0;
  __dst[8] = 0;
  *((void *)__dst + 5) = 0;
  __dst[12] = 0;
  *((void *)__dst + 135) = 0;
  *((unsigned char *)__dst + 1088) = 0;
  if (__n - 1081 >= 0xFFFFFFFFFFFFFBFFLL)
  {
    memcpy(__dst, __src, __n);
    *((void *)__dst + 135) = __n - 56;
    *((unsigned char *)__dst + 1088) = 1;
  }
  return __dst;
}

void ArchivePayload::serialization(ArchivePayload *this)
{
}

void *ArchivePayload::getRecompiledArchive@<X0>(ArchivePayload *this@<X0>, void *a2@<X8>)
{
  return std::string::basic_string[abi:ne180100](a2, (char *)this + 56, *((void *)this + 135));
}

uint64_t ArchivePayload::isValid(ArchivePayload *this)
{
  return *((unsigned __int8 *)this + 1088);
}

BOOL ArchivePayload::matchesCurrent(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a1 + 1088)) {
    return 0;
  }
  std::string::basic_string[abi:ne180100](__p, (void *)(a1 + 56), *(void *)(a1 + 1080));
  ArchivePayload::ArchivePayload((uint64_t)v7, a2, (uint64_t)__p, 0, 0);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  return operator==((uint64_t)v7, a1);
}

void sub_10000CEAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void **MTLArchiveMapDB::MTLArchiveMapDB(void **a1, uint64_t a2)
{
  return MTLVersionedDB::MTLVersionedDB(a1, a2, 3, 0, 1);
}

void MTLArchiveMapDB::remove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(char *)(a3 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)a3, *(void *)(a3 + 8));
  }
  else {
    std::string v8 = *(std::string *)a3;
  }
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v9, v8.__r_.__value_.__l.__data_, v8.__r_.__value_.__l.__size_);
    if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v8.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v9 = v8;
  }
  uint64_t v7 = 0;
  int v5 = mdb_cursor_open(a2, *(_DWORD *)(a1 + 8), &v7);
  if (!v5) {
    operator new();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    char v6 = mdb_strerror(v5);
    MTLArchiveUsageDB::prune((uint64_t)v6, buf);
  }
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v9.__r_.__value_.__l.__data_);
  }
}

void sub_10000D2BC()
{
}

void MTLArchiveMapDB::read(unsigned int *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v11, (MTLVersionedDB *)a1);
  if (v11)
  {
    if (*(char *)(a2 + 23) < 0) {
      std::string::__init_copy_ctor_external(&v9, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    }
    else {
      std::string v9 = *(std::string *)a2;
    }
    if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v10, v9.__r_.__value_.__l.__data_, v9.__r_.__value_.__l.__size_);
      if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v9.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      std::string v10 = v9;
    }
    uint64_t v8 = 0;
    int v6 = mdb_cursor_open(v11, a1[2], &v8);
    if (!v6) {
      operator new();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = mdb_strerror(v6);
      MTLArchiveUsageDB::prune((uint64_t)v7, buf);
    }
    std::string::basic_string[abi:ne180100]<0>(a3, "");
    if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v10.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a3, "");
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v11);
}

void sub_10000D744(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, int a20,__int16 a21,char a22,char a23,uint64_t a24,uint64_t a25,char a26)
{
}

void MTLArchiveMapDB::store(MTLVersionedDB *a1, uint64_t a2, uint64_t *a3, int a4, int a5)
{
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v12, a1);
  if (v12)
  {
    if (*(char *)(a2 + 23) < 0) {
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
    }
    else {
      std::string __p = *(std::string *)a2;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v11, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
    }
    else
    {
      std::string v11 = __p;
    }
    ArchivePayload::ArchivePayload((uint64_t)v13, a2, (uint64_t)a3, a4, a5);
    if (v13[1088])
    {
      MTLArchiveMapDB::remove((uint64_t)a1, v12, a2);
      operator new();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      MTLArchiveMapDB::store((char *)(a2 + 23), (void *)a2, a3);
    }
    if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v11.__r_.__value_.__l.__data_);
    }
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v12);
}

void sub_10000DA54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&a22);
  _Unwind_Resume(a1);
}

BOOL MTLVersionedDB::isVersionEntry(uint64_t a1, uint64_t a2, char *__s1)
{
  if (*(unsigned char *)(a1 + 12))
  {
    if (a2 == 8) {
      return *(void *)__s1 == 0xFFFFFFFFLL;
    }
    return 0;
  }
  if (a2 != 12) {
    return 0;
  }
  return strncmp(__s1, "_DB_VERSION_", 0xCuLL) == 0;
}

void MTLVersionedDB::getOrSetVersion(MTLVersionedDB *this, int a2)
{
  int v8 = a2;
  uint64_t v6 = 4;
  uint64_t v7 = &v8;
  uint64_t v5 = 0xFFFFFFFFLL;
  std::string::basic_string[abi:ne180100]<0>(&__p, "_DB_VERSION_");
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
  {
    std::string::__init_copy_ctor_external(&v4, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  else
  {
    std::string v4 = __p;
  }
  if (*((unsigned char *)this + 12)) {
    operator new();
  }
  operator new();
}

void sub_10000DD30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void MTLVersionedDB::openDB(uint64_t *a1, uint64_t a2, int a3, unsigned char *a4, unsigned char *a5)
{
  *a4 = 1;
  *a5 = 1;
  int v9 = mdb_env_create(a1);
  if (v9)
  {
    int v10 = v9;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      MTLVersionedDB::openDB(v10);
    }
  }
  else
  {
    if (*(char *)(a2 + 23) >= 0) {
      std::string v11 = (const char *)a2;
    }
    else {
      std::string v11 = *(const char **)a2;
    }
    mkdir(v11, 0x1EDu);
    if (*(char *)(a2 + 23) >= 0) {
      uint64_t v12 = (const char *)a2;
    }
    else {
      uint64_t v12 = *(const char **)a2;
    }
    int v13 = mdb_env_open(*a1, v12, 0, 0x1A4u);
    if (!v13) {
      MTLVersionedDB::getOrSetVersion((MTLVersionedDB *)a1, a3);
    }
    int v14 = v13;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      MTLVersionedDB::openDB((char *)(a2 + 23), (void *)a2, v14);
    }
    mdb_env_close((void *)*a1);
    *a4 = 0;
  }
  *a1 = 0;
}

void **MTLVersionedDB::MTLVersionedDB(void **a1, uint64_t a2, int a3, char a4, char a5)
{
  *a1 = 0;
  *((_DWORD *)a1 + 2) = 0;
  *((unsigned char *)a1 + 12) = a4;
  *((unsigned char *)a1 + 13) = a5;
  __int16 v19 = 0;
  MTLVersionedDB::openDB((uint64_t *)a1, a2, a3, (unsigned char *)&v19 + 1, &v19);
  if (HIBYTE(v19)) {
    BOOL v8 = v19 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      MTLVersionedDB::MTLVersionedDB();
    }
    if (*a1)
    {
      MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v18, (MTLVersionedDB *)a1);
      if (v18)
      {
        mdb_drop(v18, *((_DWORD *)a1 + 2), 0);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        MTLVersionedDB::MTLVersionedDB(a2, v10, v11, v12, v13, v14, v15, v16);
      }
      MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v18);
      int v9 = *a1;
    }
    else
    {
      int v9 = 0;
    }
    mdb_env_close(v9);
    MTLVersionedDB::openDB((uint64_t *)a1, a2, a3, (unsigned char *)&v19 + 1, &v19);
    if (!HIBYTE(v19) || !(_BYTE)v19)
    {
      if (*a1) {
        mdb_env_close(*a1);
      }
      *a1 = 0;
    }
  }
  return a1;
}

void sub_10000E014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

MTLVersionedDB::Transaction *MTLVersionedDB::Transaction::Transaction(MTLVersionedDB::Transaction *this, MTLVersionedDB *a2)
{
  *(void *)this = 0;
  if (*(void *)a2)
  {
    int v4 = mdb_txn_begin(*(void *)a2, 0, 0, (uint64_t *)this);
    if (v4)
    {
      int v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        MTLVersionedDB::Transaction::Transaction(v5);
      }
LABEL_12:
      *(void *)this = 0;
      return this;
    }
    if (*((unsigned char *)a2 + 12)) {
      int v6 = 262152;
    }
    else {
      int v6 = 0x40000;
    }
    int v7 = mdb_dbi_open(*(void *)this, 0, v6 | (4 * *((unsigned __int8 *)a2 + 13)), (unsigned int *)a2 + 2);
    if (v7)
    {
      int v8 = v7;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        MTLVersionedDB::Transaction::Transaction(v8);
      }
      mdb_txn_abort(*(void *)this);
      goto LABEL_12;
    }
  }
  return this;
}

void MTLVersionedDB::Transaction::~Transaction(MTLVersionedDB::Transaction *this)
{
  uint64_t v1 = *(void *)this;
  if (v1)
  {
    int v2 = mdb_txn_commit(v1);
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        long long v3 = mdb_strerror(v2);
        MTLVersionedDB::Transaction::~Transaction((uint64_t)v3, v4);
      }
    }
  }
}

void sub_10000E198(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

void MTLVersionedDB::~MTLVersionedDB(MTLVersionedDB *this)
{
  uint64_t v2 = *(void *)this;
  if (v2)
  {
    mdb_dbi_close(v2, *((_DWORD *)this + 2));
    mdb_env_close(*(void **)this);
  }
}

void MTLVersionedDB::dumpTable(MTLVersionedDB *this)
{
  MTLVersionedDB::Transaction::Transaction((MTLVersionedDB::Transaction *)&v9, this);
  if (v9)
  {
    uint64_t v8 = 0;
    int v2 = mdb_cursor_open(v9, *((_DWORD *)this + 2), &v8);
    if (v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        long long v3 = mdb_strerror(v2);
        MTLArchiveUsageDB::prune((uint64_t)v3, buf);
      }
    }
    else
    {
      int v4 = mdb_cursor_get(v8, v7, v6, 0);
      int v5 = 0;
      while (v4 != -30798)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)std::string buf = 67110144;
          int v11 = v5;
          __int16 v12 = 2048;
          uint64_t v13 = v7[0];
          __int16 v14 = 2048;
          uint64_t v15 = v7[1];
          __int16 v16 = 2048;
          uint64_t v17 = v6[0];
          __int16 v18 = 2048;
          uint64_t v19 = v6[1];
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%d: key(%zu,%p) data(%zu,%p)", buf, 0x30u);
          ++v5;
        }
        int v4 = mdb_cursor_get(v8, v7, v6, 8);
      }
    }
  }
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)&v9);
}

void sub_10000E37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  MTLVersionedDB::Transaction::~Transaction((MTLVersionedDB::Transaction *)va);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

char *mdb_strerror(int a1)
{
  if (!a1) {
    return "Successful return: 0";
  }
  if ((a1 + 30799) > 0x14) {
    return strerror(a1);
  }
  return mdb_errstr[a1 + 30799];
}

uint64_t mdb_cmp(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 80) + 48 * a2 + 16))(a3, a4);
}

uint64_t mdb_dcmp(uint64_t a1, unsigned int a2, void *a3, uint64_t a4)
{
  int v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 80) + 48 * a2 + 24);
  if (v4 == mdb_cmp_int)
  {
    if (*a3 == 8) {
      return mdb_cmp_cint(a3, a4);
    }
    int v4 = mdb_cmp_int;
  }
  return v4((uint64_t)a3, a4);
}

uint64_t mdb_cmp_int(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = **(_DWORD **)(a1 + 8);
  unsigned int v3 = **(_DWORD **)(a2 + 8);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t mdb_cmp_cint(void *a1, uint64_t a2)
{
  unint64_t v2 = a1[1];
  uint64_t v3 = *a1 - 2;
  BOOL v4 = (unsigned __int16 *)(v2 + v3);
  BOOL v5 = (unsigned __int16 *)(*(void *)(a2 + 8) + v3);
  int v6 = v4;
  do
  {
    int v8 = *v6--;
    int v7 = v8;
    int v9 = *v5--;
    uint64_t result = (v7 - v9);
    BOOL v11 = v7 == v9 && (unint64_t)v4 > v2;
    BOOL v4 = v6;
  }
  while (v11);
  return result;
}

uint64_t mdb_env_sync0(uint64_t a1, int a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a1 + 12);
  if ((v3 & 0x20000) != 0) {
    return 13;
  }
  if (!a2 && (v3 & 0x10000) != 0) {
    return 0;
  }
  if ((v3 & 0x80000) == 0)
  {
    uint64_t result = fsync(*(_DWORD *)a1);
    if (!result) {
      return result;
    }
    return *__error();
  }
  if (((a2 == 0) & ((v3 & 0x100000u) >> 20)) != 0) {
    int v5 = 1;
  }
  else {
    int v5 = 16;
  }
  uint64_t result = msync(*(void **)(a1 + 56), *(unsigned int *)(a1 + 16) * a3, v5);
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t mdb_env_sync(uint64_t a1, int a2)
{
  return mdb_env_sync0(a1, a2, *(void *)(*(void *)(a1+ 72+ 8* ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72)+ 128) < *(void *)(*(void *)(a1 + 80) + 128))))+ 120)+ 1);
}

uint64_t mdb_txn_renew(uint64_t a1)
{
  if (!a1 || (~*(_DWORD *)(a1 + 124) & 0x20001) != 0) {
    return 22;
  }
  else {
    return mdb_txn_renew0(a1);
  }
}

uint64_t mdb_txn_renew0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  int v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) == 0)
  {
    if (v3)
    {
      uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(v3 + 128));
      if (v5) {
        return v5;
      }
      uint64_t v6 = *(void *)(v3 + 8);
      uint64_t v7 = *(void *)(v2 + 8 * (v6 & 1) + 72);
    }
    else
    {
      uint64_t v7 = *(void *)(v2
                     + 72
                     + 8
                     * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(v2 + 72) + 128) < *(void *)(*(void *)(v2 + 80) + 128))));
      uint64_t v6 = *(void *)(v7 + 128);
    }
    *(void *)(a1 + 24) = v6 + 1;
    *(void *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    *(_DWORD *)(a1 + 128) = 0x1FFFF;
    int v9 = *(void **)(v2 + 208);
    *(void *)(a1 + 72) = v9;
    void *v9 = 0;
    uint64_t v10 = *(void **)(v2 + 200);
    *(void *)(a1 + 40) = v10;
    *(void *)(a1 + 48) = 0;
    *uint64_t v10 = 0;
    *(void *)(a1 + 64) = 0;
    *(void *)(v2 + 96) = a1;
    memcpy(*(void **)(a1 + 96), *(const void **)(v2 + 152), 4 * *(unsigned int *)(v2 + 36));
    int v11 = 0;
    goto LABEL_35;
  }
  if (!v3)
  {
    int v11 = 0;
    uint64_t v7 = *(void *)(v2
                   + 72
                   + 8
                   * ((*(_DWORD *)(v2 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(v2 + 72) + 128) < *(void *)(*(void *)(v2 + 80) + 128))));
    *(void *)(a1 + 24) = *(void *)(v7 + 128);
    *(void *)(a1 + 72) = 0;
LABEL_35:
    uint64_t v24 = *(_OWORD **)(a1 + 88);
    long long v25 = *(_OWORD *)(v7 + 40);
    *uint64_t v24 = *(_OWORD *)(v7 + 24);
    v24[1] = v25;
    long long v26 = *(_OWORD *)(v7 + 56);
    long long v27 = *(_OWORD *)(v7 + 72);
    long long v28 = *(_OWORD *)(v7 + 104);
    v24[4] = *(_OWORD *)(v7 + 88);
    v24[5] = v28;
    v24[2] = v26;
    v24[3] = v27;
    *(void *)(a1 + 16) = *(void *)(v7 + 120) + 1;
    LODWORD(v24) = *(_DWORD *)(v2 + 32);
    *(_DWORD *)(a1 + 120) = v24;
    *(_DWORD *)(a1 + 124) = v4 & 0x20000;
    if (v24 >= 3)
    {
      unint64_t v29 = 2;
      uint64_t v30 = 100;
      do
      {
        int v31 = *(__int16 *)(*(void *)(v2 + 144) + 2 * v29);
        *(_WORD *)(*(void *)(a1 + 88) + v30) = *(_WORD *)(*(void *)(v2 + 144) + 2 * v29) & 0x7FFF;
        if (v31 < 0) {
          char v32 = 26;
        }
        else {
          char v32 = 0;
        }
        *(unsigned char *)(*(void *)(a1 + 112) + v29++) = v32;
        v30 += 48;
      }
      while (v29 < *(unsigned int *)(a1 + 120));
    }
    *(unsigned char *)(*(void *)(a1 + 112) + 1) = 24;
    **(unsigned char **)(a1 + 112) = 8;
    if ((*(_DWORD *)(v2 + 12) & 0x80000000) != 0)
    {
      uint64_t v5 = 4294936501;
    }
    else
    {
      if (*(void *)(v2 + 128) >= *(void *)(a1 + 16)) {
        return 0;
      }
      uint64_t v5 = 4294936511;
    }
    mdb_txn_end((unsigned int *)a1, v11 | 5);
    return v5;
  }
  if ((*(unsigned char *)(v2 + 14) & 0x20) != 0)
  {
    int v8 = *(_DWORD **)(a1 + 72);
    if (v8) {
      goto LABEL_8;
    }
  }
  else
  {
    int v8 = pthread_getspecific(*(void *)(v2 + 160));
    if (v8)
    {
LABEL_8:
      if (v8[2] != *(_DWORD *)(v2 + 40) || *(void *)v8 != -1) {
        return 4294936513;
      }
      goto LABEL_32;
    }
  }
  int v12 = *(_DWORD *)(v2 + 40);
  pthread_t v13 = pthread_self();
  uint64_t v14 = *(void *)(v2 + 64);
  if (!*(_DWORD *)(v2 + 224))
  {
    uint64_t v5 = mdb_reader_pid(v2, 8, v12);
    if (v5) {
      return v5;
    }
    *(_DWORD *)(v2 + 224) = 1;
  }
  uint64_t v15 = (pthread_mutex_t *)(v14 + 24);
  uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)(v14 + 24));
  if (!v5)
  {
    int v16 = *(_DWORD *)(v3 + 16);
    if (v16)
    {
      unsigned int v17 = 0;
      __int16 v18 = (int *)(v3 + 200);
      while (1)
      {
        int v19 = *v18;
        v18 += 16;
        if (!v19) {
          break;
        }
        if (v16 == ++v17)
        {
          unsigned int v17 = *(_DWORD *)(v3 + 16);
          break;
        }
      }
    }
    else
    {
      unsigned int v17 = 0;
    }
    if (v17 == *(_DWORD *)(v2 + 24))
    {
      pthread_mutex_unlock((pthread_mutex_t *)(v14 + 24));
      return 4294936506;
    }
    uint64_t v20 = v3 + ((unint64_t)v17 << 6);
    *(_DWORD *)(v20 + 200) = 0;
    *(void *)(v20 + 192) = -1;
    int v8 = (_DWORD *)(v20 + 192);
    *((void *)v8 + 2) = v13;
    if (v17 == v16) {
      *(_DWORD *)(v3 + 16) = ++v16;
    }
    *(_DWORD *)(v2 + 28) = v16;
    void v8[2] = v12;
    pthread_mutex_unlock(v15);
    int v21 = *(_DWORD *)(v2 + 12);
    if ((v21 & 0x200000) != 0)
    {
      int v11 = v21 & 0x200000;
      goto LABEL_33;
    }
    uint64_t v22 = pthread_setspecific(*(void *)(v2 + 160), v8);
    if (v22)
    {
      uint64_t v5 = v22;
      void v8[2] = 0;
      return v5;
    }
LABEL_32:
    int v11 = 0;
    do
LABEL_33:
      *(void *)int v8 = *(void *)(v3 + 8);
    while (*(void *)v8 != *(void *)(v3 + 8));
    uint64_t v23 = *(void *)v8;
    *(void *)(a1 + 24) = *(void *)v8;
    *(void *)(a1 + 72) = v8;
    uint64_t v7 = *(void *)(v2 + 8 * (v23 & 1) + 72);
    goto LABEL_35;
  }
  return v5;
}

uint64_t mdb_txn_begin(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  int v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & ~a3 & 0x20000) != 0) {
    return 13;
  }
  int v10 = v4 & 0x80000 | a3 & 0x70000;
  if (a2)
  {
    int v11 = *(_DWORD *)(a2 + 124);
    v10 |= v11;
    if ((v10 & 0xA0013) != 0)
    {
      if ((v11 & 0x20000) != 0) {
        return 22;
      }
      else {
        return 4294936514;
      }
    }
    int v13 = 152;
    int v14 = 57;
    uint64_t v15 = 19;
  }
  else
  {
    if ((a3 & 0x20000) == 0)
    {
      uint64_t v12 = *(void *)(a1 + 104);
      goto LABEL_28;
    }
    uint64_t v15 = 17;
    int v14 = 49;
    int v13 = 136;
  }
  size_t v16 = v13 + *(_DWORD *)(a1 + 36) * v14;
  unsigned int v17 = malloc_type_calloc(1uLL, v16, 0xC111C8FuLL);
  if (!v17) {
    return 12;
  }
  uint64_t v12 = (uint64_t)v17;
  v17[10] = *(void *)(a1 + 136);
  v17[11] = &v17[v15];
  uint64_t v18 = *(unsigned int *)(a1 + 36);
  v17[14] = (char *)v17 + v16 - v18;
  *((_DWORD *)v17 + 31) = v10;
  v17[4] = a1;
  if (a2)
  {
    v17[12] = *(void *)(a2 + 96);
    v17[13] = &v17[6 * v18 + v15];
    int v19 = malloc_type_malloc(0x200000uLL, 0x108004057E67DB5uLL);
    *(void *)(v12 + 72) = v19;
    if (v19)
    {
      uint64_t v20 = mdb_midl_alloc(0x1FFFF);
      *(void *)(v12 + 40) = v20;
      int v19 = *(void **)(v12 + 72);
      if (v20)
      {
        *(_DWORD *)(v12 + 128) = *(_DWORD *)(a2 + 128);
        void *v19 = 0;
        *(void *)(v12 + 64) = 0;
        *(_OWORD *)(v12 + 16) = *(_OWORD *)(a2 + 16);
        uint64_t v21 = *(unsigned int *)(a2 + 120);
        *(_DWORD *)(a2 + 124) |= 0x10u;
        *(void *)(a2 + 8) = v12;
        *(void *)uint64_t v12 = a2;
        *(_DWORD *)(v12 + 120) = v21;
        memcpy(*(void **)(v12 + 88), *(const void **)(a2 + 88), 48 * v21);
        if (*(_DWORD *)(v12 + 120))
        {
          unint64_t v22 = 0;
          do
          {
            *(unsigned char *)(*(void *)(v12 + 112) + v22) = *(unsigned char *)(*(void *)(a2 + 112) + v22) & 0xFB;
            ++v22;
          }
          while (v22 < *(unsigned int *)(v12 + 120));
        }
        *(_OWORD *)(v12 + 136) = *(_OWORD *)(a1 + 176);
        uint64_t v23 = *(int **)(a1 + 176);
        if (v23)
        {
          int v24 = *v23;
          long long v25 = mdb_midl_alloc(*v23);
          *(void *)(a1 + 176) = v25;
          if (!v25)
          {
            uint64_t v5 = 12;
LABEL_31:
            mdb_txn_end((unsigned int *)v12, 6);
            goto LABEL_32;
          }
          memcpy(v25, *(const void **)(v12 + 136), 8 * v24 + 8);
        }
        uint64_t v5 = mdb_cursor_shadow(a2, (void *)v12);
        if (!v5) {
          goto LABEL_29;
        }
        goto LABEL_31;
      }
    }
    free(v19);
    free((void *)v12);
    return 12;
  }
  v17[12] = *(void *)(a1 + 152);
LABEL_28:
  uint64_t v5 = mdb_txn_renew0(v12);
  if (!v5)
  {
LABEL_29:
    uint64_t v5 = 0;
    *(_DWORD *)(v12 + 124) |= v10;
    *a4 = v12;
    return v5;
  }
LABEL_32:
  if (v12 != *(void *)(a1 + 104)) {
    free((void *)v12);
  }
  return v5;
}

uint64_t mdb_cursor_shadow(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 120);
  if ((int)v2 < 1) {
    return 0;
  }
  while (1)
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 104) + 8 * (v2 - 1));
    if (v5) {
      break;
    }
LABEL_10:
    if (v2-- <= 1) {
      return 0;
    }
  }
  uint64_t v6 = (v2 - 1);
  if (v5[2]) {
    size_t v7 = 888;
  }
  else {
    size_t v7 = 392;
  }
  while (1)
  {
    int v8 = (void **)malloc_type_malloc(v7, 0xC8AE77B4uLL);
    if (!v8) {
      return 12;
    }
    int v9 = v8;
    memcpy(v8, v5, 0x188uLL);
    v5[1] = v9;
    v5[5] = a2[11] + 48 * (v2 - 1);
    v5[3] = a2;
    v5[7] = a2[14] + v6;
    uint64_t v10 = v5[2];
    if (v10)
    {
      memcpy(v9 + 49, (const void *)v5[2], 0x1F0uLL);
      *(void *)(v10 + 24) = a2;
    }
    uint64_t v11 = a2[13];
    *uint64_t v5 = *(void *)(v11 + 8 * v6);
    *(void *)(v11 + 8 * v6) = v5;
    uint64_t v5 = *v9;
    if (!*v9) {
      goto LABEL_10;
    }
  }
}

void mdb_txn_end(unsigned int *a1, int a2)
{
  uint64_t v4 = *((void *)a1 + 4);
  uint64_t v5 = a1[30];
  if ((int)v5 >= 3)
  {
    uint64_t v6 = *((void *)a1 + 14);
    unint64_t v7 = v5 + 1;
    do
    {
      uint64_t v8 = (v7 - 2);
      if ((*(unsigned char *)(v6 + v8) & 4) != 0)
      {
        if ((a2 & 0x10) != 0)
        {
          *(_WORD *)(*(void *)(v4 + 144) + 2 * v8) = *(_WORD *)(*((void *)a1 + 11) + 48 * v8 + 4) | 0x8000;
        }
        else
        {
          uint64_t v9 = *(void *)(v4 + 136);
          uint64_t v10 = *(void **)(v9 + 48 * v8 + 8);
          if (v10)
          {
            uint64_t v11 = (void *)(v9 + 48 * v8);
            *uint64_t v11 = 0;
            v11[1] = 0;
            uint64_t v12 = *(void *)(v4 + 152);
            *(_WORD *)(*(void *)(v4 + 144) + 2 * v8) = 0;
            ++*(_DWORD *)(v12 + 4 * v8);
            free(v10);
          }
        }
      }
      --v7;
    }
    while (v7 > 3);
  }
  if ((a2 & 0x10) != 0 && *(_DWORD *)(v4 + 32) < v5) {
    *(_DWORD *)(v4 + 32) = v5;
  }
  unsigned int v13 = a1[31];
  if ((v13 & 0x20000) != 0)
  {
    unint64_t v22 = (void *)*((void *)a1 + 9);
    if (v22)
    {
      *unint64_t v22 = -1;
      if ((*(unsigned char *)(v4 + 14) & 0x20) == 0)
      {
LABEL_31:
        *((void *)a1 + 9) = 0;
        goto LABEL_32;
      }
      if ((a2 & 0x200000) != 0)
      {
        *(_DWORD *)(*((void *)a1 + 9) + 8) = 0;
        goto LABEL_31;
      }
    }
LABEL_32:
    int v23 = a1[31] | 1;
    a1[30] = 0;
    a1[31] = v23;
LABEL_33:
    if ((a2 & 0x20) == 0) {
      return;
    }
    goto LABEL_39;
  }
  if (v13) {
    goto LABEL_33;
  }
  uint64_t v15 = (_OWORD *)(v4 + 176);
  uint64_t v14 = *(void *)(v4 + 176);
  if ((a2 & 0x10) == 0) {
    mdb_cursors_close((uint64_t)a1, 0);
  }
  if ((*(unsigned char *)(v4 + 14) & 8) == 0)
  {
    size_t v16 = (unsigned int *)*((void *)a1 + 9);
    unsigned int v17 = *v16;
    if (*v16)
    {
      uint64_t v18 = *((void *)a1 + 4);
      unsigned int v19 = 1;
      do
      {
        uint64_t v20 = *(void **)&v16[4 * v19 + 2];
        if ((*((_WORD *)v20 + 5) & 4) != 0 && *((_DWORD *)v20 + 3) != 1)
        {
          free(v20);
        }
        else
        {
          *uint64_t v20 = *(void *)(v18 + 192);
          *(void *)(v18 + 192) = v20;
        }
        ++v19;
      }
      while (v19 <= v17);
    }
    *(void *)size_t v16 = 0;
  }
  *((void *)a1 + 15) = &_mh_execute_header;
  uint64_t v21 = *(void *)a1;
  if (*(void *)a1)
  {
    *(void *)(v21 + 8) = 0;
    *(_DWORD *)(v21 + 124) &= ~0x10u;
    *uint64_t v15 = *(_OWORD *)(a1 + 34);
    mdb_midl_free(*((void *)a1 + 5));
    free(*((void **)a1 + 9));
  }
  else
  {
    mdb_midl_shrink((uint64_t *)a1 + 5);
    *(void *)(v4 + 200) = *((void *)a1 + 5);
    *(void *)(v4 + 96) = 0;
    *(void *)uint64_t v15 = 0;
    *(void *)(v4 + 184) = 0;
    int v24 = *(pthread_mutex_t **)(v4 + 64);
    if (v24) {
      pthread_mutex_unlock(v24 + 2);
    }
    LOBYTE(a2) = 0;
  }
  mdb_midl_free(*((void *)a1 + 8));
  mdb_midl_free(v14);
  if ((a2 & 0x20) != 0)
  {
LABEL_39:
    free(a1);
  }
}

uint64_t mdb_txn_env(uint64_t result)
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

uint64_t mdb_txn_id(uint64_t result)
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

void mdb_txn_reset(uint64_t a1)
{
  if (a1)
  {
    if ((*(unsigned char *)(a1 + 126) & 2) != 0) {
      mdb_txn_end((unsigned int *)a1, 3);
    }
  }
}

void mdb_txn_abort(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 8)) {
      mdb_txn_abort();
    }
    mdb_txn_end((unsigned int *)a1, 2097186);
  }
}

uint64_t mdb_txn_commit(uint64_t a1)
{
  if (!a1) {
    return 22;
  }
  if (*(void *)(a1 + 8))
  {
    uint64_t appended = mdb_txn_commit();
    if (appended) {
      goto LABEL_9;
    }
  }
  int v3 = 2097201;
  int v4 = *(_DWORD *)(a1 + 124);
  if ((v4 & 0x20000) != 0) {
    goto LABEL_53;
  }
  uint64_t v5 = *(void *)a1;
  if ((v4 & 3) != 0)
  {
    if (v5) {
      *(_DWORD *)(v5 + 124) |= 2u;
    }
    uint64_t appended = 4294936514;
LABEL_9:
    mdb_txn_abort(a1);
    return appended;
  }
  if (!v5)
  {
    uint64_t v20 = *(void *)(a1 + 32);
    if (*(void *)(v20 + 96) != a1)
    {
      uint64_t appended = 22;
      goto LABEL_9;
    }
    mdb_cursors_close(a1, 0);
    if (**(void **)(a1 + 72) || (*(unsigned char *)(a1 + 124) & 0xC) != 0)
    {
      if (*(_DWORD *)(a1 + 120) >= 3u)
      {
        uint64_t v62 = 0;
        memset(v61, 0, sizeof(v61));
        long long v60 = xmmword_10001B870;
        mdb_cursor_init((uint64_t)v61, a1, 1u, 0);
        unint64_t v21 = *(unsigned int *)(a1 + 120);
        if (v21 >= 3)
        {
          unint64_t v22 = 2;
          uint64_t v23 = 96;
          do
          {
            if (*(unsigned char *)(*(void *)(a1 + 112) + v22))
            {
              if (*(_DWORD *)(*(void *)(a1 + 96) + 4 * v22) != *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 152)
                                                                            + 4 * v22))
              {
                uint64_t appended = 4294936516;
                goto LABEL_9;
              }
              uint64_t v24 = *(void *)(a1 + 80);
              *((void *)&v60 + 1) = *(void *)(a1 + 88) + v23;
              uint64_t v25 = mdb_cursor_put((uint64_t)v61, (size_t *)(v24 + v23), (uint64_t)&v60, 2);
              if (v25)
              {
                uint64_t appended = v25;
                goto LABEL_9;
              }
              unint64_t v21 = *(unsigned int *)(a1 + 120);
            }
            ++v22;
            v23 += 48;
          }
          while (v22 < v21);
        }
      }
      uint64_t appended = mdb_freelist_save(a1);
      if (appended) {
        goto LABEL_9;
      }
      mdb_midl_free(*(void *)(v20 + 176));
      *(void *)(v20 + 176) = 0;
      mdb_midl_shrink((uint64_t *)(a1 + 40));
      uint64_t appended = mdb_page_flush(a1, 0);
      if (appended) {
        goto LABEL_9;
      }
      if ((*(unsigned char *)(a1 + 126) & 1) == 0)
      {
        uint64_t appended = mdb_env_sync0(v20, 0, *(void *)(a1 + 16));
        if (appended) {
          goto LABEL_9;
        }
      }
      uint64_t appended = mdb_env_write_meta(a1);
      if (appended) {
        goto LABEL_9;
      }
      int v26 = *(_DWORD *)(v20 + 12);
      if ((v26 & 0x2000000) != 0)
      {
        if ((v26 & 0x400000) == 0)
        {
          uint64_t appended = mdb_env_share_locks(v20, (int *)v61);
          if (appended) {
            goto LABEL_9;
          }
          int v26 = *(_DWORD *)(v20 + 12);
        }
        *(_DWORD *)(v20 + 12) = v26 ^ 0x2000000;
      }
      int v3 = 16;
    }
LABEL_53:
    mdb_txn_end((unsigned int *)a1, v3);
    return 0;
  }
  uint64_t appended = mdb_midl_append_list((uint64_t **)(v5 + 40), *(uint64_t **)(a1 + 40));
  if (appended) {
    goto LABEL_9;
  }
  mdb_midl_free(*(void *)(a1 + 40));
  *(void *)(v5 + 16) = *(void *)(a1 + 16);
  *(_DWORD *)(v5 + 124) = *(_DWORD *)(a1 + 124);
  mdb_cursors_close(a1, 1);
  memcpy(*(void **)(v5 + 88), *(const void **)(a1 + 88), 48 * *(unsigned int *)(a1 + 120));
  *(_DWORD *)(v5 + 120) = *(_DWORD *)(a1 + 120);
  **(unsigned char **)(v5 + 112) = **(unsigned char **)(a1 + 112);
  *(unsigned char *)(*(void *)(v5 + 112) + 1) = *(unsigned char *)(*(void *)(a1 + 112) + 1);
  if (*(_DWORD *)(a1 + 120) >= 3u)
  {
    unint64_t v6 = 2;
    do
    {
      *(unsigned char *)(*(void *)(v5 + 112) + v6) = *(unsigned char *)(*(void *)(a1 + 112) + v6) | *(unsigned char *)(*(void *)(v5 + 112)
                                                                                                 + v6) & 4;
      ++v6;
    }
    while (v6 < *(unsigned int *)(a1 + 120));
  }
  unint64_t v7 = *(unsigned int **)(v5 + 64);
  uint64_t v9 = *(unsigned int **)(v5 + 72);
  uint64_t v8 = (int **)(v5 + 64);
  uint64_t v10 = *(unsigned int **)(a1 + 72);
  if (v7)
  {
    unsigned int v11 = *v7;
    if (*v7)
    {
      *(void *)unint64_t v7 = -1;
      unsigned int v12 = *v10;
      if (*v10)
      {
        if (v12 + 1 > 2) {
          uint64_t v13 = v12 + 1;
        }
        else {
          uint64_t v13 = 2;
        }
        uint64_t v14 = 1;
        unsigned int v15 = v11;
        int v16 = v11;
        do
        {
          unint64_t v17 = 2 * *(void *)&v10[4 * v14];
          do
          {
            int v18 = v16;
            unint64_t v19 = *(void *)&v7[2 * v16--];
          }
          while (v17 > v19);
          if (v17 == v19)
          {
            *(void *)&v7[2 * v18] = 1;
            unsigned int v15 = v16;
          }
          else
          {
            ++v16;
          }
          ++v14;
        }
        while (v14 != v13);
      }
      else
      {
        unsigned int v15 = v11;
      }
      for (unsigned int i = v15 + 1; i <= v11; ++i)
      {
        uint64_t v29 = *(void *)&v7[2 * i];
        if ((v29 & 1) == 0) {
          *(void *)&v7[2 * ++v15] = v29;
        }
      }
      *(void *)unint64_t v7 = v15;
    }
  }
  uint64_t v30 = *(unint64_t **)(a1 + 64);
  if (v30 && *v30)
  {
    unint64_t v31 = 1;
    do
    {
      unint64_t v32 = v30[v31];
      if ((v32 & 1) == 0)
      {
        unint64_t v33 = v32 >> 1;
        unsigned int v34 = mdb_mid2l_search(v9, v32 >> 1);
        if (*(void *)v9 >= (unint64_t)v34)
        {
          unint64_t v35 = v34;
          if (*(void *)&v9[4 * v34] == v33)
          {
            free(*(void **)&v9[4 * v34 + 2]);
            uint64_t v36 = *(void *)v9;
            if (*(void *)v9 > v35)
            {
              unsigned int v37 = v35 + 1;
              do
              {
                *(_OWORD *)&v9[4 * v35] = *(_OWORD *)&v9[4 * v37];
                unint64_t v35 = v37;
                uint64_t v36 = *(void *)v9;
              }
              while (*(void *)v9 > (unint64_t)v37++);
            }
            *(void *)uint64_t v9 = v36 - 1;
          }
        }
      }
      unint64_t v31 = (v31 + 1);
      uint64_t v30 = *(unint64_t **)(a1 + 64);
    }
    while (*v30 >= v31);
  }
  uint64_t v39 = *(void *)v9;
  *(void *)uint64_t v9 = 0;
  if (*(void *)v5)
  {
    unsigned int v40 = *v10 + v39;
    int v41 = mdb_mid2l_search(v10, *(void *)&v9[4 * v39] + 1);
    int v42 = v41 - 1;
    if (v41 != 1 && v39 != 0)
    {
      int v44 = v39;
      do
      {
        unint64_t v45 = *(void *)&v10[4 * v42];
        int v46 = v44 + 1;
        do
          unint64_t v47 = *(void *)&v9[4 * --v46];
        while (v45 < v47);
        int v48 = v45 == v47;
        v40 -= v48;
        if (!--v42) {
          break;
        }
        int v44 = v46 - v48;
      }
      while (v44);
    }
  }
  else
  {
    unsigned int v40 = 0x1FFFF - *(_DWORD *)(a1 + 128);
  }
  uint64_t v49 = *v10;
  if (*v10)
  {
    unsigned int v50 = v40;
    do
    {
      id v51 = &v10[4 * v49];
      unint64_t v52 = *(void *)v51;
      unsigned int v53 = &v9[4 * v39];
      uint64_t v54 = *(void *)v53;
      if (*(void *)v51 >= *(void *)v53)
      {
        uint64_t v55 = v39;
      }
      else
      {
        do
        {
          *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v53;
          uint64_t v39 = (v39 - 1);
          unsigned int v53 = &v9[4 * v39];
          uint64_t v54 = *(void *)v53;
        }
        while (v52 < *(void *)v53);
        uint64_t v55 = v39;
      }
      if (v52 == v54)
      {
        LODWORD(v39) = v39 - 1;
        free(*(void **)&v9[4 * v55 + 2]);
      }
      *(_OWORD *)&v9[4 * v50--] = *(_OWORD *)v51;
      --v49;
    }
    while (v49);
  }
  *(void *)uint64_t v9 = v40;
  free(*(void **)(a1 + 72));
  *(_DWORD *)(v5 + 128) = *(_DWORD *)(a1 + 128);
  int v56 = *(uint64_t **)(a1 + 64);
  if (v56)
  {
    if (*v8)
    {
      uint64_t appended = mdb_midl_append_list((uint64_t **)(v5 + 64), v56);
      if (appended) {
        *(_DWORD *)(v5 + 124) |= 2u;
      }
      mdb_midl_free(*(void *)(a1 + 64));
      mdb_midl_sort(*v8);
    }
    else
    {
      uint64_t appended = 0;
      *uint64_t v8 = (int *)v56;
    }
  }
  else
  {
    uint64_t appended = 0;
  }
  unsigned __int8 v57 = (void *)(v5 + 48);
  do
  {
    uint64_t v58 = v57;
    uint64_t v59 = *v57;
    unsigned __int8 v57 = (void *)(*v57 + 48);
  }
  while (v59);
  void *v58 = *(void *)(a1 + 48);
  *(_DWORD *)(v5 + 56) += *(_DWORD *)(a1 + 56);
  *(void *)(v5 + 8) = 0;
  mdb_midl_free(*(void *)(a1 + 136));
  free((void *)a1);
  return appended;
}

void mdb_cursors_close(uint64_t a1, int a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 120);
  if ((int)v2 >= 1)
  {
    uint64_t v4 = *(void *)(a1 + 104);
    do
    {
      uint64_t v5 = *(void **)(v4 + 8 * (v2 - 1));
      while (v5)
      {
        unint64_t v6 = v5;
        uint64_t v5 = (void *)*v5;
        unint64_t v7 = (void *)v6[1];
        if (v7)
        {
          if (a2)
          {
            *(_OWORD *)unint64_t v6 = *(_OWORD *)v7;
            v6[3] = v7[3];
            v6[5] = v7[5];
            v6[7] = v7[7];
            uint64_t v8 = v6[2];
            if (v8) {
              *(void *)(v8 + 24) = v7[3];
            }
          }
          else
          {
            memcpy(v6, (const void *)v6[1], 0x188uLL);
            uint64_t v9 = (void *)v6[2];
            if (v9) {
              memcpy(v9, v7 + 49, 0x1F0uLL);
            }
          }
        }
        else
        {
          unint64_t v7 = v6;
        }
        free(v7);
      }
      *(void *)(v4 + 8 * (v2 - 1)) = 0;
    }
    while (v2-- > 1);
  }
}

uint64_t mdb_cursor_init(uint64_t result, uint64_t a2, unsigned int a3, uint64_t a4)
{
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(_DWORD *)(result + 32) = a3;
  *(void *)(result + 24) = a2;
  uint64_t v4 = *(void *)(a2 + 80) + 48 * a3;
  *(void *)(result + 40) = *(void *)(a2 + 88) + 48 * a3;
  *(void *)(result + 48) = v4;
  uint64_t v5 = (unsigned char *)(*(void *)(a2 + 112) + a3);
  *(void *)(result + 56) = v5;
  *(_DWORD *)(result + 64) = 0;
  *(void *)(result + 72) = 0;
  *(_WORD *)(result + 328) = 0;
  int v6 = *(_DWORD *)(a2 + 124) & 0xA0000;
  *(_DWORD *)(result + 68) = v6;
  if ((*(unsigned char *)(*(void *)(a2 + 88) + 48 * a3 + 4) & 4) != 0)
  {
    *(void *)(result + 16) = a4;
    *(void *)(a4 + 16) = 0;
    *(void *)(a4 + 24) = a2;
    *(void *)(a4 + 40) = a4 + 392;
    *(void *)(a4 + 48) = a4 + 440;
    *(_DWORD *)(a4 + 32) = a3;
    *(void *)(a4 + 56) = a4 + 488;
    *(_DWORD *)(a4 + 64) = 0;
    *(_DWORD *)(a4 + 68) = v6 | 4;
    *(void *)(a4 + 440) = 0;
    *(void *)(a4 + 448) = 0;
    uint64_t v7 = *(void *)(result + 48);
    uint64_t v5 = *(unsigned char **)(result + 56);
    uint64_t v9 = *(void *)(v7 + 24);
    uint64_t v8 = *(void *)(v7 + 32);
    *(void *)(a4 + 456) = v9;
    *(void *)(a4 + 464) = 0;
    *(void *)(a4 + 472) = v8;
  }
  else
  {
    *(void *)(result + 16) = 0;
  }
  if ((*v5 & 2) != 0) {
    return mdb_page_search(result, 0, 2);
  }
  return result;
}

uint64_t mdb_cursor_put(uint64_t a1, size_t *a2, uint64_t a3, int a4)
{
  long long v126 = 0;
  uint64_t result = 22;
  if (!a1 || !a2) {
    return result;
  }
  uint64_t v124 = 0;
  id v125 = 0;
  size_t v122 = 0;
  id v123 = 0;
  size_t v120 = 0;
  v121 = 0;
  long long v119 = 0u;
  memset(v118, 0, sizeof(v118));
  uint64_t v9 = *(void *)(a1 + 24);
  uint64_t v10 = *(void *)(v9 + 32);
  if ((a4 & 0x80000) != 0)
  {
    unsigned int v11 = *(_DWORD *)(a3 + 16);
    *(void *)(a3 + 16) = 0;
    if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) == 0) {
      return 4294936512;
    }
  }
  else
  {
    unsigned int v11 = 0;
  }
  int v12 = *(_DWORD *)(v9 + 124);
  if ((v12 & 0x20013) != 0)
  {
    if ((v12 & 0x20000) != 0) {
      return 13;
    }
    else {
      return 4294936514;
    }
  }
  if (*a2 - 512 < 0xFFFFFFFFFFFFFE01) {
    return 4294936515;
  }
  uint64_t v13 = *(void *)(a1 + 40);
  unint64_t v14 = 511;
  if ((*(_WORD *)(v13 + 4) & 4) == 0) {
    unint64_t v14 = 0xFFFFFFFFLL;
  }
  if (*(void *)a3 > v14) {
    return 4294936515;
  }
  size_t v122 = 0;
  if ((a4 & 0x40) != 0)
  {
    unsigned int v17 = *(_DWORD *)(a1 + 68);
    if ((v17 & 1) == 0) {
      return result;
    }
    LODWORD(v16) = 0;
  }
  else if (*(void *)(v13 + 40) == -1)
  {
    unsigned int v17 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v17;
    LODWORD(v16) = -30769;
  }
  else
  {
    int v117 = 0;
    long long v116 = 0uLL;
    if ((a4 & 0x20000) != 0)
    {
      v115[0] = 0;
      v115[1] = 0;
      uint64_t v16 = mdb_cursor_last(a1, v115, &v116);
      if (!v16)
      {
        if ((*(int (**)(size_t *, char **))(*(void *)(a1 + 48) + 16))(a2, v115) < 1)
        {
          uint64_t v16 = 4294936497;
        }
        else
        {
          uint64_t v18 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
          ++*(_WORD *)(v18 + 328);
          uint64_t v16 = 4294936498;
        }
      }
    }
    else
    {
      uint64_t v15 = mdb_cursor_set(a1, a2, &v116, 15, &v117);
      uint64_t v16 = v15;
      if ((a4 & 0x10) != 0 && !v15)
      {
        *(_OWORD *)a3 = v116;
        return 4294936497;
      }
    }
    if (v16 != -30798 && v16) {
      return v16;
    }
    unsigned int v17 = *(_DWORD *)(a1 + 68);
  }
  if ((v17 & 8) != 0) {
    *(_DWORD *)(a1 + 68) = v17 ^ 8;
  }
  if ((a4 & 0x8000) == 0)
  {
    unint64_t v19 = (uint64_t *)a3;
    if ((a4 & 0x80000) != 0)
    {
      uint64_t v124 = *(void *)a3 * v11;
      unint64_t v19 = &v124;
    }
    uint64_t result = mdb_page_spill(a1, a2, v19);
    if (result) {
      return result;
    }
  }
  unsigned int v20 = a4 & 0xFFFF7FFF;
  if (v16 == -30769)
  {
    *(void *)&long long v116 = 0;
    uint64_t result = mdb_page_new(a1, 2, 1, (char **)&v116);
    if (result) {
      return result;
    }
    uint64_t v21 = v116;
    uint64_t v22 = *(unsigned __int16 *)(a1 + 64);
    if (v22 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v22 + 1;
      *(_WORD *)(a1 + 66) = v22;
      *(void *)(a1 + 8 * v22 + 72) = v21;
      *(_WORD *)(a1 + 2 * v22 + 328) = 0;
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    }
    uint64_t v24 = *(void *)(a1 + 40);
    *(void *)(v24 + 40) = *(void *)v21;
    ++*(_WORD *)(v24 + 6);
    **(unsigned char **)(a1 + 56) |= 1u;
    __int16 v23 = *(_WORD *)(*(void *)(a1 + 40) + 4);
    if ((v23 & 0x14) == 0x10) {
      *(_WORD *)(v21 + 10) |= 0x20u;
    }
    *(_DWORD *)(a1 + 68) |= 1u;
LABEL_51:
    if ((v23 & 4) == 0 || *a2 + *(void *)a3 + 8 <= *(unsigned int *)(v10 + 220))
    {
      unsigned int v109 = 0;
      int v110 = 0;
      uint64_t v27 = 0;
      long long v28 = (size_t *)a3;
      goto LABEL_128;
    }
    int v112 = v16;
    int v110 = 0;
    uint64_t v25 = *(char **)(v10 + 88);
    *((_WORD *)v25 + 4) = *(void *)a3;
    *((_DWORD *)v25 + 3) = 1048592;
    size_t v120 = 16;
    __int16 v26 = 18;
    goto LABEL_111;
  }
  uint64_t result = mdb_cursor_touch(a1);
  if (result) {
    return result;
  }
  if (v16)
  {
    __int16 v23 = *(_WORD *)(*(void *)(a1 + 40) + 4);
    goto LABEL_51;
  }
  uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v30 = *(void *)(a1 + 8 * v29 + 72);
  unint64_t v31 = *(unsigned int **)(a1 + 40);
  if ((*(_WORD *)(v30 + 10) & 0x20) != 0)
  {
    uint64_t v32 = *v31;
    size_t v33 = *a2;
    if (*a2 == v32)
    {
      unsigned int v34 = (void *)(v30 + v32 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16);
      unint64_t v35 = (const void *)a2[1];
LABEL_59:
      memcpy(v34, v35, v33);
      uint64_t v36 = *(unsigned __int16 *)(a1 + 66);
      if (*(_WORD *)(a1 + 66) && !*(_WORD *)(a1 + 2 * v36 + 328))
      {
        int v37 = v36 - 1;
        *(_WORD *)(a1 + 66) = v36 - 1;
        if ((_WORD)v36 == 1)
        {
          LOWORD(v37) = 0;
          LOWORD(v36) = 1;
        }
        else
        {
          __int16 v38 = 1;
          while (!*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
          {
            *(_WORD *)(a1 + 66) = --v37;
            ++v38;
            if (!(_WORD)v37)
            {
              LOWORD(v37) = 0;
              goto LABEL_68;
            }
          }
          LOWORD(v36) = v38;
        }
LABEL_68:
        if (*(_WORD *)(a1 + 2 * (unsigned __int16)v37 + 328))
        {
          uint64_t result = mdb_update_key(a1, (uint64_t)a2);
          *(_WORD *)(a1 + 66) += v36;
          if (result) {
            return result;
          }
        }
        else
        {
          *(_WORD *)(a1 + 66) = v37 + v36;
        }
      }
      return 0;
    }
    return 4294936515;
  }
  unsigned int v114 = a4 & 0xFFFF7FFF;
  unsigned int v109 = 0;
  int v110 = 0;
  uint64_t v27 = 0;
  while (1)
  {
    uint64_t v39 = (unsigned int *)(v30 + *(unsigned __int16 *)(v30 + 2 * *(unsigned __int16 *)(a1 + 2 * v29 + 328) + 16));
    size_t v120 = *v39;
    v121 = (char *)v39 + *((unsigned __int16 *)v39 + 3) + 8;
    if ((v31[1] & 4) != 0)
    {
      unsigned int v40 = *(char **)(v10 + 88);
      id v125 = v40;
      long long v126 = v40;
      *(void *)unsigned int v40 = *(void *)v30;
      __int16 v41 = *((_WORD *)v39 + 2);
      if ((v41 & 4) != 0)
      {
        if ((v41 & 2) != 0)
        {
          unsigned int v108 = v27;
          int v113 = 0;
          unsigned int v20 = v114 | 6;
          goto LABEL_161;
        }
        uint64_t v25 = v121;
        if (v114 == 64) {
          goto LABEL_201;
        }
        if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) != 0)
        {
          unsigned int v62 = *((unsigned __int16 *)v121 + 4);
          if (v62 <= (unsigned __int16)(*((_WORD *)v121 + 7) - *((_WORD *)v121 + 6)))
          {
LABEL_201:
            unsigned int v108 = v27;
            int v113 = 0;
            *((_WORD *)v121 + 5) |= 0x10u;
            *(_WORD *)uint64_t v25 = *(_WORD *)v40;
            *((_WORD *)v25 + 1) = *((_WORD *)v40 + 1);
            *((_WORD *)v25 + 2) = *((_WORD *)v40 + 2);
            *((_WORD *)v25 + 3) = *((_WORD *)v40 + 3);
            *(void *)(*(void *)(a1 + 16) + 72) = v25;
            unsigned int v20 = v114 | 4;
            goto LABEL_161;
          }
          unsigned int v48 = 4 * v62;
        }
        else
        {
          unsigned int v48 = (*(_DWORD *)a3 + 11) & 0xFFFFFFFE;
        }
        size_t v60 = v120;
        size_t v61 = v120 + v48;
        uint64_t v124 = v61;
        __int16 v26 = *((_WORD *)v121 + 5);
        goto LABEL_109;
      }
      if (v114 != 64)
      {
        int v42 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 48) + 24);
        if (v120 == 8 && v42 == mdb_cmp_int) {
          int v42 = (uint64_t (*)(uint64_t, uint64_t))mdb_cmp_cint;
        }
        if (v42(a3, (uint64_t)&v120))
        {
          size_t v44 = v120;
          size_t v122 = v120;
          memcpy(v40 + 24, v121, v120);
          id v123 = v40 + 24;
          *((_WORD *)v40 + 5) = 82;
          *((_WORD *)v40 + 6) = 16;
          uint64_t v45 = *(void *)a3;
          uint64_t v46 = v44 + *(void *)a3 + 16;
          if ((*(unsigned char *)(*(void *)(a1 + 40) + 4) & 0x10) != 0)
          {
            __int16 v26 = 114;
            *((_WORD *)v40 + 5) = 114;
            *((_WORD *)v40 + 4) = v45;
            uint64_t v47 = 2 * v45;
          }
          else
          {
            uint64_t v47 = ((*(void *)a3 & 1) + (v44 & 1)) | 0x14;
            __int16 v26 = 82;
          }
          LOWORD(v48) = 0;
          size_t v60 = v47 + v46;
          uint64_t v124 = v60;
          *((_WORD *)v40 + 7) = v60;
          size_t v120 = v60;
          size_t v61 = v60;
          uint64_t v25 = v40;
LABEL_109:
          int v112 = 0;
          if (*((unsigned __int16 *)v39 + 3) + v61 + 8 <= *(unsigned int *)(v10 + 220))
          {
            int v65 = v114;
          }
          else
          {
            int v112 = 0;
            v26 &= ~0x40u;
            unsigned int v20 = v114;
LABEL_111:
            uint64_t v63 = *(void *)(a1 + 40);
            if ((*(_WORD *)(v63 + 4) & 0x10) != 0)
            {
              v26 |= 0x20u;
              LODWORD(v118[0]) = *((unsigned __int16 *)v25 + 4);
              WORD2(v118[0]) = 16;
              if ((*(_WORD *)(v63 + 4) & 0x20) != 0) {
                __int16 v64 = 24;
              }
              else {
                __int16 v64 = 16;
              }
              WORD2(v118[0]) = v64;
            }
            else
            {
              LODWORD(v118[0]) = 0;
              WORD2(v118[0]) = 0;
            }
            WORD3(v118[0]) = 1;
            *(_OWORD *)((char *)v118 + 8) = xmmword_10001B880;
            *((void *)&v118[1] + 1) = 0;
            *(void *)&long long v119 = (*((unsigned __int16 *)v25 + 6) - 16) >> 1;
            uint64_t v124 = 48;
            id v125 = (const char *)v118;
            uint64_t result = mdb_page_alloc(a1, 1, &v126);
            if (result) {
              return result;
            }
            size_t v60 = v120;
            unsigned int v48 = *(_DWORD *)(v10 + 16) - v120;
            int v65 = v20 | 6;
            unsigned int v40 = v126;
            *((void *)&v119 + 1) = *(void *)v126;
            unsigned int v109 = v126;
          }
          if (v40 != v25)
          {
            *((_WORD *)v40 + 5) = v26 | 0x10;
            *((_WORD *)v40 + 4) = *((_WORD *)v25 + 4);
            *((_WORD *)v40 + 6) = *((_WORD *)v25 + 6);
            unsigned __int16 v66 = *((_WORD *)v25 + 7) + v48;
            *((_WORD *)v40 + 7) = v66;
            if ((v26 & 0x20) != 0)
            {
              memcpy(v40 + 16, v25 + 16, ((*((unsigned __int16 *)v25 + 6) - 16) >> 1) * *((unsigned __int16 *)v25 + 4));
            }
            else
            {
              memcpy(&v40[v66], &v25[*((unsigned __int16 *)v25 + 7)], v60 - *((unsigned __int16 *)v25 + 7));
              memcpy(v40 + 16, v25 + 16, (*((unsigned __int16 *)v25 + 6) - 16) & 0xFFFFFFFE);
              if ((*((_WORD *)v25 + 6) & 0xFFFE) != 0x10)
              {
                unint64_t v67 = 0;
                do
                  *(_WORD *)&v40[2 * v67++ + 16] += v48;
                while (v67 < (*((unsigned __int16 *)v25 + 6) - 16) >> 1);
              }
            }
          }
          unsigned int v20 = v65 | 4;
          uint64_t v27 = 1;
          long long v28 = (size_t *)&v124;
          LODWORD(v16) = v112;
          if (!v112)
          {
            mdb_node_del((void *)a1, 0);
            long long v28 = (size_t *)&v124;
          }
          goto LABEL_128;
        }
        if ((v114 & 0x40020) != 0) {
          return 4294936497;
        }
      }
    }
    int v49 = *((unsigned __int16 *)v39 + 2);
    if (((v114 ^ v49) & 2) != 0) {
      return 4294936512;
    }
    if ((v49 & 1) == 0)
    {
      size_t v50 = *(void *)a3;
      if (*(void *)a3 == v120)
      {
        if ((v114 & 0x10000) != 0)
        {
          uint64_t result = 0;
          char v105 = v121;
LABEL_216:
          *(void *)(a3 + 8) = v105;
          return result;
        }
        if ((*(unsigned char *)(a1 + 68) & 4) != 0)
        {
          size_t v33 = *a2;
          unint64_t v35 = (const void *)a2[1];
          unsigned int v34 = v39 + 2;
          goto LABEL_59;
        }
        id v51 = v121;
        unint64_t v52 = *(const void **)(a3 + 8);
        goto LABEL_219;
      }
      goto LABEL_103;
    }
    uint64_t v53 = v27;
    v115[0] = 0;
    int v117 = 0;
    uint64_t v54 = *(void *)a3;
    unint64_t v55 = *(unsigned int *)(v10 + 16);
    unint64_t v56 = *(void *)v121;
    uint64_t result = mdb_page_get(a1, *(void *)v121, (unint64_t *)v115, &v117);
    if (result) {
      return result;
    }
    int v57 = (v54 + 15) / v55 + 1;
    uint64_t v58 = v115[0];
    uint64_t v59 = *((int *)v115[0] + 3);
    if ((int)v59 >= v57)
    {
      if ((*((_WORD *)v115[0] + 5) & 0x10) != 0) {
        break;
      }
      if (v117 || (*(unsigned char *)(v10 + 14) & 8) != 0)
      {
        uint64_t result = mdb_page_unspill(*(void *)(a1 + 24), (uint64_t)v115[0], v115);
        if (result) {
          return result;
        }
        int v117 = 0;
        uint64_t v58 = v115[0];
        if ((*((_WORD *)v115[0] + 5) & 0x10) != 0) {
          break;
        }
      }
    }
    uint64_t result = mdb_ovpage_free(a1, (uint64_t)v58);
    uint64_t v27 = v53;
    if (result) {
      return result;
    }
LABEL_103:
    mdb_node_del((void *)a1, 0);
    LODWORD(v16) = 0;
    long long v28 = (size_t *)a3;
    unsigned int v20 = v114;
LABEL_128:
    uint64_t v68 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v69 = *(_WORD **)(a1 + 8 * v68 + 72);
    unint64_t v70 = *a2;
    if ((v69[5] & 0x20) == 0)
    {
      unint64_t v71 = v70 + *v28 + 8;
      uint64_t v72 = 8 - *v28;
      if (v71 <= *(unsigned int *)(v10 + 220)) {
        uint64_t v72 = 0;
      }
      unint64_t v70 = (v71 + v72 + 3) & 0xFFFFFFFFFFFFFFFELL;
    }
    if (v70 <= (unsigned __int16)(v69[7] - v69[6]))
    {
      uint64_t result = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v68 + 328), (const void **)a2, v28, 0, v20 & 0x30006);
      if (result) {
        goto LABEL_206;
      }
      v75 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
      if (v75)
      {
        uint64_t v76 = *(unsigned __int16 *)(a1 + 66);
        uint64_t v77 = *(void *)(a1 + 8 * v76 + 72);
        int v78 = *(_DWORD *)(a1 + 68);
        do
        {
          unint64_t v79 = v75;
          if ((v78 & 4) != 0) {
            unint64_t v79 = (void *)v75[2];
          }
          if (v79 != (void *)a1
            && *((unsigned __int16 *)v79 + 32) >= *(unsigned __int16 *)(a1 + 64)
            && v79[v76 + 9] == v77)
          {
            uint64_t v80 = (char *)v79 + 2 * v76;
            unsigned int v81 = *((unsigned __int16 *)v80 + 164);
            if (v16 && v81 >= *(unsigned __int16 *)(a1 + 2 * v76 + 328))
            {
              LOWORD(v81) = v81 + 1;
              *((_WORD *)v80 + 164) = v81;
            }
            uint64_t v82 = v79[2];
            if (v82)
            {
              if ((*(unsigned char *)(v82 + 68) & 1) != 0
                && (*(unsigned __int16 *)(v77 + 12) - 16) >> 1 > (unsigned __int16)v81)
              {
                uint64_t v83 = v77 + *(unsigned __int16 *)(v77 + 2 * (unsigned __int16)v81 + 16);
                if ((*(_WORD *)(v83 + 4) & 6) == 4) {
                  *(void *)(v82 + 72) = v83 + *(unsigned __int16 *)(v83 + 6) + 8;
                }
              }
            }
          }
          v75 = (void *)*v75;
        }
        while (v75);
      }
    }
    else
    {
      if ((v20 & 6) == 4) {
        int v73 = v20 & 0x10006;
      }
      else {
        int v73 = v20 & 0x30006;
      }
      if (v16) {
        int v74 = v73;
      }
      else {
        int v74 = v73 | 0x40000;
      }
      uint64_t result = mdb_page_split(a1, (uint64_t)a2, v28, 0xFFFFFFFFFFFFFFFFLL, v74);
      if (result) {
        goto LABEL_206;
      }
    }
    if (!v27)
    {
      uint64_t result = 0;
      int v98 = v16;
      goto LABEL_192;
    }
    int v113 = v16;
    unsigned int v108 = 1;
LABEL_161:
    uint64_t v124 = 0;
    id v125 = "";
    uint64_t v111 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
         + *(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72)
                               + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
                               + 16);
    uint64_t v84 = 32832;
    if ((v20 & 0x40040) != 0x40)
    {
      mdb_xcursor_init1(a1, v111);
      if ((v20 & 0x20) != 0) {
        uint64_t v84 = 32784;
      }
      else {
        uint64_t v84 = 0x8000;
      }
    }
    if (v109) {
      *(void *)(*(void *)(a1 + 16) + 72) = v109;
    }
    int v107 = v122;
    if (v122)
    {
      LODWORD(result) = mdb_cursor_put(*(void *)(a1 + 16), &v122, &v124, v84);
      if (result) {
        goto LABEL_203;
      }
      size_t v122 = 0;
    }
    if (v109 || (*(_WORD *)(v111 + 4) & 2) == 0)
    {
      uint64_t v85 = *(void *)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
      if (v85)
      {
        uint64_t v86 = *(void *)(a1 + 16);
        uint64_t v87 = *(unsigned __int16 *)(a1 + 66);
        uint64_t v88 = *(void *)(a1 + 8 * v87 + 72);
        do
        {
          if (v85 != a1
            && *(unsigned __int16 *)(v85 + 64) >= *(unsigned __int16 *)(a1 + 64)
            && (*(unsigned char *)(v85 + 68) & 1) != 0
            && *(void *)(v85 + 8 * v87 + 72) == v88)
          {
            unsigned int v89 = *(unsigned __int16 *)(v85 + 2 * v87 + 328);
            if (v89 == *(unsigned __int16 *)(a1 + 2 * v87 + 328))
            {
              unsigned int v106 = v11;
              uint64_t v90 = v84;
              uint64_t v91 = v88;
              mdb_xcursor_init2(v85, v86, v107);
              uint64_t v88 = v91;
              uint64_t v84 = v90;
              unsigned int v11 = v106;
            }
            else if (!v113)
            {
              uint64_t v92 = *(void *)(v85 + 16);
              if (v92)
              {
                if ((*(unsigned char *)(v92 + 68) & 1) != 0 && v89 < (*(unsigned __int16 *)(v88 + 12) - 16) >> 1)
                {
                  uint64_t v93 = v88 + *(unsigned __int16 *)(v88 + 2 * *(unsigned __int16 *)(v85 + 2 * v87 + 328) + 16);
                  if ((*(_WORD *)(v93 + 4) & 6) == 4) {
                    *(void *)(v92 + 72) = v93 + *(unsigned __int16 *)(v93 + 6) + 8;
                  }
                }
              }
            }
          }
          uint64_t v85 = *(void *)v85;
        }
        while (v85);
      }
    }
    uint64_t v94 = *(void *)(a1 + 16);
    uint64_t v16 = *(void *)(v94 + 424);
    uint64_t result = mdb_cursor_put(v94, a3, &v124, v84 | (v20 >> 1) & 0x20000);
    if ((v20 & 2) != 0)
    {
      uint64_t v95 = v111 + *(unsigned __int16 *)(v111 + 6);
      long long v97 = *(_OWORD *)(*(void *)(a1 + 16) + 408);
      long long v96 = *(_OWORD *)(*(void *)(a1 + 16) + 424);
      *(_OWORD *)(v95 + 8) = *(_OWORD *)(*(void *)(a1 + 16) + 392);
      *(_OWORD *)(v95 + 24) = v97;
      *(_OWORD *)(v95 + 40) = v96;
    }
    int v98 = *(_DWORD *)(*(void *)(a1 + 16) + 424) - v16;
    LODWORD(v16) = v113;
    uint64_t v27 = v108;
LABEL_192:
    if (v98) {
      ++*(void *)(*(void *)(a1 + 40) + 32);
    }
    if (v16)
    {
      if (result)
      {
LABEL_203:
        if (result == -30799) {
          uint64_t result = 4294936517;
        }
        else {
          uint64_t result = result;
        }
LABEL_206:
        *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
        return result;
      }
      *(_DWORD *)(a1 + 68) |= 1u;
    }
    if ((v20 & 0x80000) == 0 || result) {
      return result;
    }
    uint64_t v99 = (v110 + 1);
    *(void *)(a3 + 16) = v99;
    if (v99 >= v11) {
      return 0;
    }
    ++v110;
    unsigned int v114 = v20;
    *(void *)(a3 + 8) += *(void *)a3;
    uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v30 = *(void *)(a1 + 8 * v29 + 72);
    unint64_t v31 = *(unsigned int **)(a1 + 40);
  }
  if (v117 <= 1)
  {
    int v104 = v114 & 0x10000;
    int v102 = v58;
    goto LABEL_214;
  }
  uint64_t v100 = *(unsigned int *)(v10 + 16);
  v101 = mdb_page_malloc(*(void *)(a1 + 24), v59);
  if (v101)
  {
    int v102 = v101;
    size_t v103 = v100 * v59;
    *(void *)&long long v116 = v56;
    *((void *)&v116 + 1) = v101;
    mdb_mid2l_insert(*(unsigned int **)(*(void *)(a1 + 24) + 72), (unint64_t *)&v116);
    int v104 = v114 & 0x10000;
    if ((v114 & 0x10000) == 0)
    {
      memcpy(&v102[(*(void *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], &v58[(*(void *)a3 & 0xFFFFFFFFFFFFFFF8) + 16], v103 - ((*(void *)a3 & 0xFFFFFFFFFFFFFFF8) + 16));
      size_t v103 = 16;
    }
    memcpy(v102, v58, v103);
LABEL_214:
    size_t v50 = *(void *)a3;
    *uint64_t v39 = *(void *)a3;
    char v105 = v102 + 16;
    if (v104)
    {
      uint64_t result = 0;
      goto LABEL_216;
    }
    unint64_t v52 = *(const void **)(a3 + 8);
    id v51 = v102 + 16;
LABEL_219:
    memcpy(v51, v52, v50);
    return 0;
  }
  return 12;
}

uint64_t mdb_freelist_save(uint64_t a1)
{
  uint64_t v53 = 0;
  memset(v52, 0, sizeof(v52));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(int *)(v2 + 216);
  unint64_t v51 = 0;
  mdb_cursor_init((uint64_t)v52, a1, 0, 0);
  uint64_t v4 = (uint64_t **)(v2 + 176);
  if (!*(void *)(v2 + 176)) {
    goto LABEL_95;
  }
  uint64_t result = mdb_page_search((uint64_t)v52, 0, 5);
  if (result && result != -30798) {
    return result;
  }
  if (!*v4)
  {
LABEL_95:
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 72);
      uint64_t result = mdb_midl_need((_DWORD **)(a1 + 40), *(_DWORD *)(a1 + 56));
      if (result) {
        return result;
      }
      do
      {
        uint64_t v8 = *(uint64_t **)(a1 + 40);
        uint64_t v9 = *v8 + 1;
        *uint64_t v8 = v9;
        v8[v9] = *(void *)v6;
        if ((*(unsigned char *)(a1 + 126) & 8) != 0)
        {
          if (*(void *)v7)
          {
            unint64_t v10 = 1;
            do
            {
              if (*(void *)(v7 + 16 * v10) == *(void *)v6) {
                break;
              }
              unint64_t v10 = (v10 + 1);
            }
            while (*(void *)v7 >= v10);
          }
          else
          {
            LODWORD(v10) = 1;
          }
        }
        else
        {
          LODWORD(v10) = mdb_mid2l_search((unsigned int *)v7, *(void *)v6);
          if ((*(_WORD *)(v6 + 10) & 4) != 0 && *(_DWORD *)(v6 + 12) != 1)
          {
            free((void *)v6);
          }
          else
          {
            *(void *)uint64_t v6 = *(void *)(v2 + 192);
            *(void *)(v2 + 192) = v6;
          }
        }
        *(void *)(v7 + 16 * v10 + 8) = 0;
        uint64_t v6 = *(void *)(v6 + 48);
      }
      while (v6);
      unint64_t v11 = *(void *)v7;
      if (*(void *)(v7 + 24))
      {
        unint64_t v12 = 1;
        while (v11 >= v12)
        {
          unint64_t v12 = (v12 + 1);
          unsigned int v13 = v12;
          if (!*(void *)(v7 + 16 * v12 + 8)) {
            goto LABEL_27;
          }
        }
        unsigned int v13 = v12;
      }
      else
      {
        unsigned int v13 = 1;
        unint64_t v12 = 1;
      }
LABEL_27:
      if (v11 >= v12)
      {
        LODWORD(v15) = v13;
        while (1)
        {
          do
          {
            unint64_t v15 = (v15 + 1);
            if (*(void *)(v7 + 16 * v15 + 8)) {
              BOOL v16 = 0;
            }
            else {
              BOOL v16 = v11 >= v15;
            }
          }
          while (v16);
          if (v11 < v15) {
            break;
          }
          *(_OWORD *)(v7 + 16 * v13++) = *(_OWORD *)(v7 + 16 * v15);
          unint64_t v11 = *(void *)v7;
        }
        uint64_t v14 = v13 - 1;
      }
      else
      {
        uint64_t v14 = 0;
      }
      *(void *)uint64_t v7 = v14;
      *(void *)(a1 + 48) = 0;
      *(_DWORD *)(a1 + 56) = 0;
    }
  }
  unint64_t v17 = 0;
  unint64_t v18 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = *(_DWORD *)(v2 + 12) & 0x1080000;
  int v45 = 1;
  while (1)
  {
LABEL_39:
    size_t v49 = 0;
    size_t v50 = 0;
    size_t v47 = 0;
    unsigned int v48 = 0;
    if (v17 < *(void *)(v2 + 184))
    {
      while (1)
      {
        uint64_t result = mdb_cursor_first((uint64_t)v52, &v49, 0);
        if (result) {
          return result;
        }
        unint64_t v17 = *v50;
        unint64_t v51 = *v50;
        uint64_t result = mdb_cursor_del((uint64_t)v52, 0);
        if (result) {
          return result;
        }
        if (v17 >= *(void *)(v2 + 184))
        {
          uint64_t v19 = 0;
          uint64_t v20 = 0;
          break;
        }
      }
    }
    if (v18 < **(void **)(a1 + 40))
    {
      if (v18 || (uint64_t result = mdb_page_search((uint64_t)v52, 0, 9), !result) || result == -30798)
      {
        uint64_t v22 = *(unint64_t **)(a1 + 40);
        size_t v49 = 8;
        size_t v50 = (unint64_t *)(a1 + 24);
        unint64_t v23 = *v22;
        while (1)
        {
          unint64_t v18 = v23;
          size_t v47 = 8 * v23 + 8;
          uint64_t result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
          if (result) {
            break;
          }
          uint64_t v24 = *(unint64_t **)(a1 + 40);
          unint64_t v23 = *v24;
          if (v18 >= *v24)
          {
            mdb_midl_sort(*(int **)(a1 + 40));
            memcpy(v48, v24, v47);
            goto LABEL_39;
          }
        }
      }
      return result;
    }
    uint64_t v25 = *v4;
    uint64_t v26 = v21;
    uint64_t v27 = *v4 ? *v25 : 0;
    uint64_t v28 = *(int *)(a1 + 56);
    uint64_t v29 = v27 + v28;
    if (v20 >= v27 + v28) {
      break;
    }
    unint64_t v30 = v51;
    if (v19 >= v3 && v51 >= 2)
    {
      uint64_t v19 = 0;
      unint64_t v30 = --v51;
    }
LABEL_64:
    uint64_t v32 = v20 - v19;
    uint64_t v33 = v29 - (v20 - v19);
    if (v33 > v3 && v30 >= 2) {
      uint64_t v19 = v3 + (uint64_t)(v33 / v30) / ((int)v3 + 1) * ((int)v3 + 1);
    }
    else {
      uint64_t v19 = v33 & ~(v33 >> 63);
    }
    uint64_t v21 = v26;
    size_t v49 = 8;
    size_t v50 = &v51;
    size_t v47 = 8 * v19 + 8;
    uint64_t result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 0x10000);
    if (result) {
      return result;
    }
    if (v19 > v3 && v21 == 0) {
      uint64_t v36 = v19;
    }
    else {
      uint64_t v36 = 0;
    }
    bzero(&v48[v36 & (v36 >> 63)], 8 * (v36 - (v36 & (v36 >> 63))) + 8);
    uint64_t v20 = v19 + v32;
  }
  if (v20 != v27 + v28 && v45 >= 1)
  {
    --v45;
    unint64_t v30 = v51;
    goto LABEL_64;
  }
  int v37 = *(void **)(a1 + 48);
  if (v37)
  {
    uint64_t v38 = *(unsigned int *)(a1 + 56);
    uint64_t result = mdb_midl_need((_DWORD **)(v2 + 176), (2 * v28) | 1);
    if (result) {
      return result;
    }
    uint64_t v25 = *v4;
    uint64_t v39 = (int *)&(*v4)[*(*v4 - 1) - v38];
    unsigned int v40 = 1;
    do
    {
      unsigned int v41 = v40;
      *(void *)&v39[2 * v40] = *v37;
      int v37 = (void *)v37[6];
      ++v40;
    }
    while (v37);
    *(void *)uint64_t v39 = v41;
    mdb_midl_sort(v39);
    mdb_midl_xmerge(v25, (uint64_t *)v39);
    *(void *)(a1 + 48) = 0;
    *(_DWORD *)(a1 + 56) = 0;
    uint64_t v29 = *v25;
  }
  if (!v29) {
    return 0;
  }
  size_t v49 = 0;
  size_t v50 = 0;
  size_t v47 = 0;
  unsigned int v48 = 0;
  uint64_t result = mdb_cursor_first((uint64_t)v52, &v49, &v47);
  if (!result)
  {
    int v42 = &v25[v29];
    do
    {
      unint64_t v46 = 0;
      unint64_t v46 = *v50;
      int64_t v43 = (v47 >> 3) - 1;
      size_t v50 = &v46;
      if (v43 > v29)
      {
        size_t v47 = 8 * v29 + 8;
        int64_t v43 = v29;
      }
      v42 -= v43;
      unsigned int v48 = v42;
      int64_t v44 = *v42;
      *int v42 = v43;
      uint64_t result = mdb_cursor_put((uint64_t)v52, &v49, (uint64_t)&v47, 64);
      *int v42 = v44;
      if (result) {
        break;
      }
      v29 -= v43;
      if (!v29) {
        break;
      }
      uint64_t result = mdb_cursor_next((uint64_t)v52, &v49, &v47, 8);
    }
    while (!result);
  }
  return result;
}

uint64_t mdb_page_flush(uint64_t a1, int a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(uint64_t **)(a1 + 72);
  uint64_t v5 = *v4;
  if ((*(unsigned char *)(v3 + 14) & 8) == 0)
  {
    uint64_t v39 = *(void *)(a1 + 32);
    unint64_t v6 = 0;
    off_t v7 = 0;
    uint64_t v8 = 0;
    size_t v9 = 0;
    off_t v10 = 0;
    int v11 = 0;
    unint64_t v12 = *(unsigned int *)(v3 + 16);
    int v13 = *(_DWORD *)v3;
    uint64_t v45 = (int)v5;
    int v40 = v5 + 1;
    uint64_t v14 = 1;
    int v41 = 1 - v5;
    uint64_t v42 = *v4;
    int v37 = a2;
    int v15 = a2;
    int64_t v43 = *(uint64_t **)(a1 + 72);
    while (1)
    {
      if (v15 >= (int)v5)
      {
        BOOL v19 = 0;
        int v20 = v15++;
      }
      else
      {
        uint64_t v16 = v15 + 1;
        unint64_t v17 = &v4[2 * v16];
        uint64_t v8 = v17[1];
        unsigned int v18 = *(unsigned __int16 *)(v8 + 10);
        if (v18 >= 0x4000)
        {
          uint64_t v16 = 0;
          while (1)
          {
            *(_WORD *)(v8 + 10) = v18 & 0x7FFF;
            *unint64_t v17 = 0;
            if (!(v41 + v15 + v16)) {
              break;
            }
            uint64_t v8 = v17[3];
            unsigned int v18 = *(unsigned __int16 *)(v8 + 10);
            v17 += 2;
            ++v16;
            if (v18 < 0x4000)
            {
              uint64_t v21 = v15 + v16;
              BOOL v19 = v21 < v45;
              int v20 = v15 + v16;
              LODWORD(v16) = v21 + 1;
              goto LABEL_11;
            }
          }
          BOOL v19 = v15 + v16 + 1 < v45;
          int v20 = v15 + v16 + 1;
          int v15 = v40;
        }
        else
        {
          BOOL v19 = 1;
          int v20 = v15;
LABEL_11:
          int v15 = v16;
          uint64_t v22 = *v17;
          *(_WORD *)(v8 + 10) = v18 & 0x3FEF;
          off_t v7 = v22 * v12;
          if ((v18 & 4) != 0) {
            unint64_t v6 = *(unsigned int *)(v8 + 12) * (unint64_t)v12;
          }
          else {
            unint64_t v6 = v12;
          }
        }
      }
      if (v7 != v14 || v11 == 64 || v6 + v9 >= 0x40000001)
      {
        int v44 = v20;
        if (v11)
        {
          unint64_t v23 = v12;
          while (1)
          {
            if (v11 == 1)
            {
              ssize_t v24 = pwrite(v13, __buf[0].iov_base, v9, v10);
            }
            else
            {
              while (lseek(v13, v10, 0) == -1)
              {
                uint64_t result = *__error();
                if (result != 4) {
                  return result;
                }
              }
              ssize_t v24 = writev(v13, __buf, v11);
            }
            LODWORD(v5) = v42;
            uint64_t v4 = v43;
            unint64_t v12 = v23;
            if (v24 == v9) {
              break;
            }
            if ((v24 & 0x8000000000000000) == 0) {
              return 5;
            }
            uint64_t result = *__error();
            if (result != 4) {
              return result;
            }
          }
        }
        if (!v19)
        {
          if ((*(unsigned char *)(v39 + 14) & 8) != 0)
          {
            unsigned int v27 = v37;
            a2 = v44;
          }
          else
          {
            a2 = v37;
            if ((int)v5 <= v37)
            {
              unsigned int v27 = v37;
            }
            else
            {
              unsigned int v27 = v37;
              uint64_t v32 = v4 + 2;
              int v33 = v37;
              do
              {
                uint64_t v34 = v33;
                unint64_t v35 = &v32[2 * v33];
                while (1)
                {
                  uint64_t v36 = (uint64_t *)v35[1];
                  if (!*v35) {
                    break;
                  }
                  if ((*((_WORD *)v36 + 5) & 4) != 0 && *((_DWORD *)v36 + 3) != 1)
                  {
                    free(v36);
                    LODWORD(v5) = v42;
                    uint64_t v4 = v43;
                  }
                  else
                  {
                    *uint64_t v36 = *(void *)(v39 + 192);
                    *(void *)(v39 + 192) = v36;
                  }
                  ++v34;
                  v35 += 2;
                  if (v34 >= v45)
                  {
                    a2 = v34;
                    goto LABEL_59;
                  }
                }
                int v33 = v34 + 1;
                *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)v35;
                v4[2 * v27] = *v36;
              }
              while ((int)v34 + 1 < (int)v5);
              a2 = v34 + 1;
            }
          }
LABEL_59:
          uint64_t v2 = a1;
          goto LABEL_41;
        }
        size_t v9 = 0;
        int v11 = 0;
        off_t v10 = v7;
      }
      uint64_t v26 = &__buf[v11];
      v26->iov_base = (void *)v8;
      v26->iov_len = v6;
      uint64_t v14 = v7 + v6;
      v9 += v6;
      ++v11;
    }
  }
  if ((int)v5 <= a2)
  {
    unsigned int v27 = a2;
  }
  else
  {
    unsigned int v27 = a2;
    do
    {
      uint64_t v28 = a2;
      uint64_t v29 = (uint64_t)&v4[2 * a2 + 3];
      while (1)
      {
        uint64_t v30 = *(void *)v29;
        unsigned int v31 = *(unsigned __int16 *)(*(void *)v29 + 10);
        if (v31 >= 0x4000) {
          break;
        }
        ++v28;
        *(_WORD *)(v30 + 10) = v31 & 0xFFEF;
        v29 += 16;
        if (v28 >= (int)v5)
        {
          a2 = v28;
          goto LABEL_41;
        }
      }
      a2 = v28 + 1;
      *(_WORD *)(v30 + 10) = v31 & 0x7FFF;
      *(_OWORD *)&v4[2 * ++v27] = *(_OWORD *)(v29 - 8);
    }
    while ((int)v28 + 1 < (int)v5);
  }
LABEL_41:
  uint64_t result = 0;
  *(_DWORD *)(v2 + 128) += a2 - v27;
  *uint64_t v4 = v27;
  return result;
}

uint64_t mdb_env_write_meta(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(_DWORD *)(v3 + 12) | *(_DWORD *)(a1 + 124);
  uint64_t v5 = *(void *)(v3 + 72 + 8 * (v2 & 1));
  unint64_t v6 = *(void *)(*(void *)(v3 + 72 + 8 * !(v2 & 1)) + 16);
  if (v6 <= *(void *)(v3 + 112)) {
    unint64_t v6 = *(void *)(v3 + 112);
  }
  if ((v4 & 0x80000) == 0)
  {
    uint64_t v28 = *(void *)(v5 + 128);
    uint64_t v7 = *(void *)(v5 + 120);
    unint64_t v29 = v6;
    uint64_t v8 = *(long long **)(a1 + 88);
    long long v9 = *v8;
    long long v10 = v8[2];
    long long v31 = v8[1];
    long long v32 = v10;
    long long v30 = v9;
    long long v12 = v8[4];
    long long v11 = v8[5];
    long long v33 = v8[3];
    long long v34 = v12;
    long long v35 = v11;
    uint64_t v36 = *(void *)(a1 + 16) - 1;
    uint64_t v37 = v2;
    off_t v13 = v5 - *(void *)(v3 + 56) + 16;
    int v14 = *(_DWORD *)(v3 + 8 * ((v4 & 0x50000) == 0));
    while (1)
    {
      int v15 = pwrite(v14, &v29, 0x78uLL, v13);
      if (v15 == 120) {
        goto LABEL_10;
      }
      if ((v15 & 0x80000000) == 0)
      {
        uint64_t v16 = 5;
LABEL_19:
        uint64_t v36 = v7;
        uint64_t v37 = v28;
        pwrite(*(_DWORD *)v3, &v29, 0x78uLL, v13);
        goto LABEL_20;
      }
      uint64_t v16 = *__error();
      if (v16 != 4) {
        goto LABEL_19;
      }
    }
  }
  *(void *)(v5 + 16) = v6;
  unint64_t v17 = *(long long **)(a1 + 88);
  long long v18 = *v17;
  long long v19 = v17[1];
  *(_OWORD *)(v5 + 56) = v17[2];
  *(_OWORD *)(v5 + 40) = v19;
  *(_OWORD *)(v5 + 24) = v18;
  int v20 = *(_OWORD **)(a1 + 88);
  long long v21 = v20[3];
  long long v22 = v20[4];
  *(_OWORD *)(v5 + 104) = v20[5];
  *(_OWORD *)(v5 + 88) = v22;
  *(_OWORD *)(v5 + 72) = v21;
  *(void *)(v5 + 120) = *(void *)(a1 + 16) - 1;
  *(void *)(v5 + 128) = *(void *)(a1 + 24);
  if ((v4 & 0x50000) != 0
    || ((*(_DWORD *)(v3 + 12) & 0x100000) != 0 ? (int v24 = 1) : (int v24 = 16),
        uint64_t v25 = v5 - 16,
        int v26 = (*(_DWORD *)(v3 + 20) - 1) & (v25 - *(_DWORD *)(v3 + 56)),
        !msync((void *)(v25 - v26), (v26 + *(_DWORD *)(v3 + 16)), v24)))
  {
LABEL_10:
    uint64_t v23 = *(void *)(v3 + 64);
    uint64_t v16 = 0;
    if (v23) {
      *(void *)(v23 + 8) = *(void *)(a1 + 24);
    }
    return v16;
  }
  uint64_t v16 = *__error();
LABEL_20:
  *(_DWORD *)(v3 + 12) |= 0x80000000;
  return v16;
}

uint64_t mdb_cmp_long(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = **(void **)(a1 + 8);
  unint64_t v3 = **(void **)(a2 + 8);
  BOOL v4 = v2 >= v3;
  BOOL v5 = v2 > v3;
  if (v4) {
    return v5;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t mdb_get(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  int v9 = 0;
  uint64_t result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          uint64_t v12 = 0;
          memset(v11, 0, sizeof(v11));
          memset(v10, 0, sizeof(v10));
          if ((*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
          {
            if ((*(unsigned char *)(a1 + 124) & 0x13) != 0)
            {
              return 4294936514;
            }
            else
            {
              mdb_cursor_init((uint64_t)v11, a1, a2, (uint64_t)v10);
              return mdb_cursor_set((uint64_t)v11, a3, a4, 15, &v9);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdb_cursor_set(uint64_t a1, void *a2, void *a3, int a4, int *a5)
{
  if (!*a2) {
    return 4294936515;
  }
  uint64_t v10 = *(void *)(a1 + 16);
  if (v10) {
    *(_DWORD *)(v10 + 68) &= 0xFFFFFFFC;
  }
  if ((*(unsigned char *)(a1 + 68) & 1) == 0)
  {
    *(void *)(a1 + 72) = 0;
LABEL_6:
    uint64_t result = mdb_page_search(a1, a2, 0);
    if (result) {
      return result;
    }
    uint64_t v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    goto LABEL_8;
  }
  long long v35 = 0uLL;
  uint64_t v15 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v12 = *(_WORD **)(a1 + 8 * v15 + 72);
  if ((v12[6] & 0xFFFE) == 0x10)
  {
    *(_WORD *)(a1 + 2 * v15 + 328) = 0;
    return 4294936498;
  }
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t v14 = 0;
    uint64_t v16 = **(unsigned int **)(a1 + 40);
    unint64_t v17 = v12 + 8;
  }
  else
  {
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
    uint64_t v16 = *(unsigned __int16 *)(v14 + 6);
    unint64_t v17 = (_WORD *)(v14 + 8);
  }
  *(void *)&long long v35 = v16;
  *((void *)&v35 + 1) = v17;
  int v18 = (*(uint64_t (**)(void *, long long *))(*(void *)(a1 + 48) + 16))(a2, &v35);
  if (!v18)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    goto LABEL_27;
  }
  if (v18 <= 0)
  {
    LODWORD(v22) = *(unsigned __int16 *)(a1 + 66);
    goto LABEL_41;
  }
  unsigned int v19 = (unsigned __int16)v12[6] - 16;
  unsigned int v20 = v19 >> 1;
  if (v19 < 4)
  {
LABEL_33:
    uint64_t v22 = *(unsigned __int16 *)(a1 + 66);
    if (*(_WORD *)(a1 + 66))
    {
      uint64_t v24 = 0;
      while (((*(unsigned __int16 *)(*(void *)(a1 + 328 + 8 * v24 - 256) + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 328 + 2 * v24))
      {
        if (v22 == ++v24) {
          goto LABEL_40;
        }
      }
    }
    else
    {
      LODWORD(v24) = 0;
    }
    if (v24 == v22)
    {
LABEL_40:
      *(_WORD *)(a1 + 2 * v22 + 328) = v20;
      return 4294936498;
    }
LABEL_41:
    if (!v22)
    {
      *(_WORD *)(a1 + 328) = 0;
      if (a4 != 17 || a5) {
        return 4294936498;
      }
      goto LABEL_46;
    }
    goto LABEL_6;
  }
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t v21 = (uint64_t)v12 + v35 * (v20 - 1) + 16;
  }
  else
  {
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[v20 + 7];
    *(void *)&long long v35 = *(unsigned __int16 *)(v14 + 6);
    uint64_t v21 = v14 + 8;
  }
  *((void *)&v35 + 1) = v21;
  int v23 = (*(uint64_t (**)(void *, long long *))(*(void *)(a1 + 48) + 16))(a2, &v35);
  if (!v23)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v20 - 1;
    goto LABEL_27;
  }
  if ((v23 & 0x80000000) == 0) {
    goto LABEL_33;
  }
  uint64_t v33 = *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328);
  if (v33 < ((unsigned __int16)v12[6] - 16) >> 1)
  {
    if ((v12[5] & 0x20) != 0)
    {
      uint64_t v34 = (uint64_t)v12 + v35 * v33 + 16;
    }
    else
    {
      uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[v33 + 8];
      *(void *)&long long v35 = *(unsigned __int16 *)(v14 + 6);
      uint64_t v34 = v14 + 8;
    }
    *((void *)&v35 + 1) = v34;
    if (!(*(unsigned int (**)(void *, long long *))(*(void *)(a1 + 48) + 16))(a2, &v35))
    {
LABEL_27:
      if (a5) {
        *a5 = 1;
      }
      goto LABEL_46;
    }
  }
  *(_DWORD *)(a1 + 68) &= ~2u;
LABEL_8:
  off_t v13 = mdb_node_search(a1, a2, a5);
  uint64_t v14 = (uint64_t)v13;
  if (a5 && !*a5) {
    return 4294936498;
  }
  if (!v13)
  {
    uint64_t result = mdb_cursor_sibling(a1, 1);
    if (result)
    {
      *(_DWORD *)(a1 + 68) |= 2u;
      return result;
    }
    uint64_t v12 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    uint64_t v14 = (uint64_t)v12 + (unsigned __int16)v12[8];
  }
LABEL_46:
  *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  if ((v12[5] & 0x20) != 0)
  {
    uint64_t result = 0;
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      uint64_t v30 = **(unsigned int **)(a1 + 40);
      *a2 = v30;
      a2[1] = (char *)v12
            + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
            * (unint64_t)v30
            + 16;
    }
    return result;
  }
  if ((*(_WORD *)(v14 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v14);
    if ((a4 - 15) > 2)
    {
      LODWORD(v35) = 0;
      if (a4 == 2) {
        long long v31 = &v35;
      }
      else {
        long long v31 = 0;
      }
      uint64_t result = mdb_cursor_set(*(void *)(a1 + 16), a3, 0, 17, v31);
      if (!result) {
        goto LABEL_79;
      }
      return result;
    }
    uint64_t result = mdb_cursor_first(*(void *)(a1 + 16), a3, 0);
LABEL_79:
    if ((a4 & 0xFFFFFFFE) == 0x10)
    {
      *a2 = *(unsigned __int16 *)(v14 + 6);
      a2[1] = v14 + 8;
    }
    return result;
  }
  if (!a3)
  {
    uint64_t result = 0;
    goto LABEL_79;
  }
  if ((a4 & 0xFFFFFFFE) == 2)
  {
    long long v35 = 0uLL;
    uint64_t result = mdb_node_read(a1, (unsigned int *)v14, &v35);
    if (result) {
      return result;
    }
    uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 + 48) + 24);
    if ((void)v35 == 8 && v25 == mdb_cmp_int) {
      uint64_t v25 = (uint64_t (*)(uint64_t, uint64_t))mdb_cmp_cint;
    }
    int v27 = v25((uint64_t)a3, (uint64_t)&v35);
    BOOL v29 = a4 == 2 || v27 > 0;
    if (!v27 || !v29)
    {
      uint64_t result = 0;
      *(_OWORD *)a3 = v35;
      goto LABEL_79;
    }
    return 4294936498;
  }
  uint64_t v32 = *(void *)(a1 + 16);
  if (v32) {
    *(_DWORD *)(v32 + 68) &= 0xFFFFFFFC;
  }
  uint64_t result = mdb_node_read(a1, (unsigned int *)v14, a3);
  if (!result) {
    goto LABEL_79;
  }
  return result;
}

uint64_t mdb_cursor_get(uint64_t a1, void *a2, void *a3, int a4)
{
  int v29 = 0;
  if (!a1) {
    return 22;
  }
  if ((*(unsigned char *)(*(void *)(a1 + 24) + 124) & 0x13) != 0) {
    return 4294936514;
  }
  uint64_t v7 = (uint64_t (*)(void))mdb_cursor_first;
  switch(a4)
  {
    case 0:
      uint64_t result = mdb_cursor_first(a1, a2, a3);
      break;
    case 1:
      goto LABEL_32;
    case 2:
    case 3:
      if (!a3) {
        goto LABEL_58;
      }
      if (!*(void *)(a1 + 16)) {
        goto LABEL_47;
      }
LABEL_10:
      if (!a2) {
        goto LABEL_58;
      }
      if (a4 == 17) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = &v29;
      }
      uint64_t result = mdb_cursor_set(a1, a2, a3, a4, v8);
      break;
    case 4:
      if ((*(unsigned char *)(a1 + 68) & 1) == 0) {
        goto LABEL_58;
      }
      uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
      unsigned int v11 = *(unsigned __int16 *)(v10 + 12) - 16;
      unsigned int v12 = v11 >> 1;
      if (v11 < 2 || (uint64_t v13 = *(unsigned __int16 *)(a1 + 2 * v9 + 328), v12 <= v13))
      {
        *(_WORD *)(a1 + 2 * v9 + 328) = v12;
        goto LABEL_56;
      }
      if ((*(_WORD *)(v10 + 10) & 0x20) != 0)
      {
        uint64_t result = 0;
        uint64_t v28 = **(unsigned int **)(a1 + 40);
        *a2 = v28;
        a2[1] = v10 + v28 * (unint64_t)v13 + 16;
      }
      else
      {
        uint64_t v14 = v10 + *(unsigned __int16 *)(v10 + 2 * v13 + 16);
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
        if (a3)
        {
          if ((*(_WORD *)(v14 + 4) & 4) == 0) {
            goto LABEL_39;
          }
          uint64_t result = mdb_cursor_get(*(void *)(a1 + 16), a3, 0, 4);
        }
        else
        {
LABEL_29:
          uint64_t result = 0;
        }
      }
      break;
    case 5:
      if (!a3 || (*(unsigned char *)(a1 + 68) & 1) == 0) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) == 0) {
        goto LABEL_47;
      }
      uint64_t v15 = *(void *)(a1 + 16);
      if ((*(_DWORD *)(v15 + 68) & 3) != 1) {
        goto LABEL_29;
      }
      goto LABEL_54;
    case 6:
      uint64_t result = mdb_cursor_last(a1, a2, a3);
      break;
    case 7:
      uint64_t v7 = (uint64_t (*)(void))mdb_cursor_last;
LABEL_32:
      if (!a3) {
        goto LABEL_58;
      }
      int v16 = *(_DWORD *)(a1 + 68);
      if ((v16 & 1) == 0) {
        goto LABEL_58;
      }
      uint64_t v17 = *(void *)(a1 + 16);
      if (!v17) {
        goto LABEL_47;
      }
      uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v19 = a1 + 2 * v18;
      uint64_t v20 = *(unsigned __int16 *)(v19 + 328);
      uint64_t v21 = *(void *)(a1 + 8 * v18 + 72);
      unsigned int v22 = *(unsigned __int16 *)(v21 + 12) - 16;
      if (v20 >= v22 >> 1)
      {
        *(_WORD *)(v19 + 328) = v22 >> 1;
        goto LABEL_56;
      }
      *(_DWORD *)(a1 + 68) = v16 & 0xFFFFFFFD;
      uint64_t v14 = v21 + *(unsigned __int16 *)(v21 + 2 * v20 + 16);
      if ((*(_WORD *)(v14 + 4) & 4) != 0)
      {
        if (*(unsigned char *)(v17 + 68)) {
          uint64_t result = v7();
        }
        else {
LABEL_58:
        }
          uint64_t result = 22;
      }
      else
      {
        if (a2)
        {
          *a2 = *(unsigned __int16 *)(v14 + 6);
          a2[1] = v14 + 8;
        }
LABEL_39:
        uint64_t result = mdb_node_read(a1, (unsigned int *)v14, a3);
      }
      break;
    case 8:
    case 9:
    case 11:
      uint64_t result = mdb_cursor_next(a1, a2, a3, a4);
      break;
    case 10:
      if (!a3) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) == 0) {
        goto LABEL_47;
      }
      uint64_t result = mdb_cursor_next(a1, a2, a3, 9);
      if (result) {
        break;
      }
      uint64_t v15 = *(void *)(a1 + 16);
      if ((*(unsigned char *)(v15 + 68) & 1) == 0) {
        goto LABEL_56;
      }
      goto LABEL_54;
    case 12:
    case 13:
    case 14:
      uint64_t result = mdb_cursor_prev(a1, a2, a3, a4);
      break;
    case 15:
    case 16:
    case 17:
      goto LABEL_10;
    case 18:
      if (!a3) {
        goto LABEL_58;
      }
      if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 0x10) != 0)
      {
        if ((*(unsigned char *)(a1 + 68) & 1) != 0 || (uint64_t result = mdb_cursor_last(a1, a2, a3), !result))
        {
          uint64_t v23 = *(void *)(a1 + 16);
          if (*(unsigned char *)(v23 + 68))
          {
            uint64_t result = mdb_cursor_sibling(v23, 0);
            if (!result)
            {
              uint64_t v15 = *(void *)(a1 + 16);
LABEL_54:
              uint64_t result = 0;
              uint64_t v24 = *(unsigned __int16 *)(v15 + 66);
              uint64_t v25 = v15 + 8 * v24;
              uint64_t v26 = *(void *)(v25 + 72);
              *a3 = ((*(unsigned __int16 *)(v26 + 12) - 16) >> 1) * **(_DWORD **)(v15 + 40);
              a3[1] = v26 + 16;
              *(_WORD *)(v15 + 2 * v24 + 328) = ((*(unsigned __int16 *)(*(void *)(v25 + 72) + 12)
                                                + 131056) >> 1)
                                              - 1;
            }
          }
          else
          {
LABEL_56:
            uint64_t result = 4294936498;
          }
        }
      }
      else
      {
LABEL_47:
        uint64_t result = 4294936512;
      }
      break;
    default:
      goto LABEL_58;
  }
  int v27 = *(_DWORD *)(a1 + 68);
  if ((v27 & 8) != 0) {
    *(_DWORD *)(a1 + 68) = v27 ^ 8;
  }
  return result;
}

uint64_t mdb_node_read(uint64_t a1, unsigned int *a2, void *a3)
{
  if (a2[1])
  {
    unint64_t v6 = 0;
    *a3 = *a2;
    uint64_t result = mdb_page_get(a1, *(void *)((char *)a2 + *((unsigned __int16 *)a2 + 3) + 8), &v6, 0);
    if (result) {
      return result;
    }
    uint64_t v4 = v6 + 16;
  }
  else
  {
    *a3 = *a2;
    uint64_t v4 = (uint64_t)a2 + *((unsigned __int16 *)a2 + 3) + 8;
  }
  uint64_t result = 0;
  a3[1] = v4;
  return result;
}

uint64_t mdb_cursor_next(uint64_t a1, void *a2, void *a3, int a4)
{
  int v8 = *(_DWORD *)(a1 + 68);
  if (a4 == 9 && (v8 & 8) != 0) {
    return 4294936498;
  }
  if (v8)
  {
    uint64_t v10 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v11 = *(void *)(a1 + 8 * v10 + 72);
    if ((v8 & 2) != 0)
    {
      if (((*(unsigned __int16 *)(v11 + 12) - 16) >> 1) - 1 <= *(unsigned __int16 *)(a1 + 2 * v10 + 328)) {
        return 4294936498;
      }
      *(_DWORD *)(a1 + 68) = v8 ^ 2;
    }
    if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 4) == 0) {
      goto LABEL_19;
    }
    uint64_t v12 = v11 + *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * v10 + 328) + 16);
    if ((*(_WORD *)(v12 + 4) & 4) != 0)
    {
      if ((a4 & 0xFFFFFFFE) == 8)
      {
        uint64_t result = mdb_cursor_next(*(void *)(a1 + 16), a3, 0, 8);
        if (a4 != 8 || result != -30798)
        {
          if (!a2 || result) {
            return result;
          }
          uint64_t v17 = *(unsigned __int16 *)(v12 + 6);
          unint64_t v18 = v12 + 8;
LABEL_38:
          *a2 = v17;
          a2[1] = v18;
          return result;
        }
      }
LABEL_19:
      int v13 = *(_DWORD *)(a1 + 68);
      if ((v13 & 8) != 0)
      {
        *(_DWORD *)(a1 + 68) = v13 ^ 8;
      }
      else
      {
        uint64_t v14 = a1 + 2 * *(unsigned __int16 *)(a1 + 66);
        unsigned int v15 = *(unsigned __int16 *)(v14 + 328) + 1;
        if (v15 >= (*(unsigned __int16 *)(v11 + 12) - 16) >> 1)
        {
          uint64_t result = mdb_cursor_sibling(a1, 1);
          if (result)
          {
            *(_DWORD *)(a1 + 68) |= 2u;
            return result;
          }
          uint64_t v11 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
        }
        else
        {
          *(_WORD *)(v14 + 328) = v15;
        }
      }
      if ((*(_WORD *)(v11 + 10) & 0x20) != 0)
      {
        uint64_t result = 0;
        uint64_t v17 = **(unsigned int **)(a1 + 40);
        unint64_t v18 = v11
            + *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
            * (unint64_t)v17
            + 16;
      }
      else
      {
        uint64_t v16 = v11
            + *(unsigned __int16 *)(v11
                                  + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328)
                                  + 16);
        if ((*(_WORD *)(v16 + 4) & 4) != 0)
        {
          mdb_xcursor_init1(a1, v11+ *(unsigned __int16 *)(v11 + 2 * *(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) + 16));
          uint64_t result = mdb_cursor_first(*(void *)(a1 + 16), a3, 0);
          if (result) {
            return result;
          }
        }
        else if (a3)
        {
          uint64_t result = mdb_node_read(a1, (unsigned int *)(v11+ *(unsigned __int16 *)(v11+ 2* *(unsigned __int16 *)(a1+ 2 * *(unsigned __int16 *)(a1 + 66)+ 328)+ 16)), a3);
          if (result) {
            return result;
          }
        }
        uint64_t result = 0;
        if (!a2) {
          return result;
        }
        uint64_t v17 = *(unsigned __int16 *)(v16 + 6);
        unint64_t v18 = v16 + 8;
      }
      goto LABEL_38;
    }
    *(_DWORD *)(*(void *)(a1 + 16) + 68) &= 0xFFFFFFFC;
    if (a4 != 9) {
      goto LABEL_19;
    }
    return 4294936498;
  }

  return mdb_cursor_first(a1, a2, a3);
}

uint64_t mdb_cursor_last(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  }
  int v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t result = mdb_page_search(a1, 0, 8);
    if (result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    int v7 = *(_DWORD *)(a1 + 68);
  }
  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  unsigned int v11 = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  *(_DWORD *)(a1 + 68) = v7 | 3;
  if ((*(unsigned char *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      uint64_t v13 = **(unsigned int **)(a1 + 40);
      *a2 = v13;
      unint64_t v14 = v10 + v13 * (unint64_t)(unsigned __int16)v11 + 16;
LABEL_18:
      uint64_t result = 0;
      a2[1] = v14;
      return result;
    }
    return 0;
  }
  uint64_t v12 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v11 + 16);
  if ((*(_WORD *)(v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v12);
    uint64_t result = mdb_cursor_last(*(void *)(a1 + 16), a3, 0);
    if (result) {
      return result;
    }
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v12 + 6);
      unint64_t v14 = v12 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3) {
    goto LABEL_16;
  }
  uint64_t result = mdb_node_read(a1, (unsigned int *)v12, a3);
  if (!result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t mdb_cursor_sibling(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int16 *)(a1 + 64);
  if (v2 < 2) {
    return 4294936498;
  }
  int v4 = a2;
  *(_WORD *)(a1 + 64) = v2 - 1;
  unsigned __int16 v6 = *(_WORD *)(a1 + 66) - 1;
  *(_WORD *)(a1 + 66) = v6;
  uint64_t v7 = v6;
  int v8 = (_WORD *)(a1 + 2 * v6 + 328);
  int v9 = (unsigned __int16)*v8;
  if (a2)
  {
    if (++v9 >= (*(unsigned __int16 *)(*(void *)(a1 + 8 * v7 + 72) + 12) - 16) >> 1) {
      goto LABEL_9;
    }
LABEL_8:
    *int v8 = v9;
    goto LABEL_12;
  }
  if (*v8)
  {
    LOWORD(v9) = v9 - 1;
    goto LABEL_8;
  }
LABEL_9:
  uint64_t result = mdb_cursor_sibling(a1, a2);
  uint64_t v7 = *(unsigned __int16 *)(a1 + 66);
  if (result)
  {
    *(_WORD *)(a1 + 66) = v7 + 1;
    ++*(_WORD *)(a1 + 64);
    return result;
  }
  LOWORD(v9) = *(_WORD *)(a1 + 2 * v7 + 328);
LABEL_12:
  unint64_t v13 = 0;
  uint64_t v10 = (unsigned int *)(*(void *)(a1 + 8 * v7 + 72)
                       + *(unsigned __int16 *)(*(void *)(a1 + 8 * v7 + 72) + 2 * (unsigned __int16)v9 + 16));
  uint64_t result = mdb_page_get(a1, *v10 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), &v13, 0);
  if (result)
  {
    *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
  }
  else
  {
    unint64_t v11 = v13;
    uint64_t v12 = *(unsigned __int16 *)(a1 + 64);
    if (v12 < 0x20)
    {
      *(_WORD *)(a1 + 64) = v12 + 1;
      *(_WORD *)(a1 + 66) = v12;
      *(void *)(a1 + 8 * v12 + 72) = v11;
      *(_WORD *)(a1 + 2 * v12 + 328) = 0;
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    }
    uint64_t result = 0;
    if (!v4) {
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = ((*(unsigned __int16 *)(v11 + 12)
    }
                                                                    + 131056) >> 1)
                                                                  - 1;
  }
  return result;
}

uint64_t mdb_cursor_prev(uint64_t a1, void *a2, void *a3, int a4)
{
  if (*(unsigned char *)(a1 + 68))
  {
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
  }
  else
  {
    uint64_t result = mdb_cursor_last(a1, a2, a3);
    if (result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    ++*(_WORD *)(a1 + 2 * v9 + 328);
  }
  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 4) != 0)
  {
    uint64_t v11 = *(unsigned __int16 *)(a1 + 2 * v9 + 328);
    if (v11 < (*(unsigned __int16 *)(v10 + 12) - 16) >> 1)
    {
      uint64_t v12 = v10 + *(unsigned __int16 *)(v10 + 2 * v11 + 16);
      if ((*(_WORD *)(v12 + 4) & 4) != 0)
      {
        if ((a4 & 0xFFFFFFFE) == 0xC)
        {
          uint64_t result = mdb_cursor_prev(*(void *)(a1 + 16), a3, 0, 12);
          if (a4 != 12 || result != -30798)
          {
            if (!result)
            {
              if (a2)
              {
                *a2 = *(unsigned __int16 *)(v12 + 6);
                a2[1] = v12 + 8;
              }
              uint64_t result = 0;
              *(_DWORD *)(a1 + 68) &= ~2u;
            }
            return result;
          }
          uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
        }
      }
      else
      {
        *(_DWORD *)(*(void *)(a1 + 16) + 68) &= 0xFFFFFFFC;
        if (a4 == 13) {
          return 4294936498;
        }
      }
    }
  }
  *(_DWORD *)(a1 + 68) &= 0xFFFFFFF5;
  uint64_t v13 = a1 + 2 * v9;
  __int16 v14 = *(_WORD *)(v13 + 328);
  if (v14)
  {
    unsigned int v15 = (_WORD *)(v13 + 328);
    LOWORD(v13) = v14 - 1;
    *unsigned int v15 = v14 - 1;
  }
  else
  {
    uint64_t result = mdb_cursor_sibling(a1, 0);
    if (result) {
      return result;
    }
    uint64_t v18 = *(unsigned __int16 *)(a1 + 66);
    uint64_t v10 = *(void *)(a1 + 8 * v18 + 72);
    LODWORD(v13) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
    *(_WORD *)(a1 + 2 * v18 + 328) = ((*(unsigned __int16 *)(v10 + 12) + 131056) >> 1) - 1;
  }
  __int16 v16 = *(_WORD *)(v10 + 10);
  if ((v16 & 2) == 0) {
    return 4294936500;
  }
  if ((v16 & 0x20) != 0)
  {
    uint64_t result = 0;
    uint64_t v19 = **(unsigned int **)(a1 + 40);
    *a2 = v19;
    a2[1] = v10 + (unsigned __int16)v13 * (unint64_t)v19 + 16;
    return result;
  }
  uint64_t v17 = v10 + *(unsigned __int16 *)(v10 + 2 * (unsigned __int16)v13 + 16);
  if ((*(_WORD *)(v17 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v17);
    uint64_t result = mdb_cursor_last(*(void *)(a1 + 16), a3, 0);
    if (result) {
      return result;
    }
    goto LABEL_27;
  }
  if (!a3 || (uint64_t result = mdb_node_read(a1, (unsigned int *)v17, a3), !result))
  {
LABEL_27:
    uint64_t result = 0;
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v17 + 6);
      a2[1] = v17 + 8;
    }
  }
  return result;
}

uint64_t mdb_cursor_first(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 16);
  if (v6) {
    *(_DWORD *)(v6 + 68) &= 0xFFFFFFFC;
  }
  int v7 = *(_DWORD *)(a1 + 68);
  if ((v7 & 1) != 0 && !*(_WORD *)(a1 + 66))
  {
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t result = mdb_page_search(a1, 0, 4);
    if (result) {
      return result;
    }
    uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
    int v7 = *(_DWORD *)(a1 + 68);
  }
  uint64_t v10 = *(void *)(a1 + 8 * v9 + 72);
  uint64_t v11 = v10 + 16;
  uint64_t v12 = *(unsigned __int16 *)(v10 + 16);
  *(_DWORD *)(a1 + 68) = v7 & 0xFFFFFFFC | 1;
  *(_WORD *)(a1 + 2 * v9 + 328) = 0;
  if ((*(unsigned char *)(v10 + 10) & 0x20) != 0)
  {
    if (a2)
    {
      *a2 = **(unsigned int **)(a1 + 40);
LABEL_18:
      uint64_t result = 0;
      a2[1] = v11;
      return result;
    }
    return 0;
  }
  uint64_t v13 = v10 + v12;
  if ((*(_WORD *)(v10 + v12 + 4) & 4) != 0)
  {
    mdb_xcursor_init1(a1, v10 + v12);
    uint64_t result = mdb_cursor_first(*(void *)(a1 + 16), a3, 0);
    if (result) {
      return result;
    }
LABEL_16:
    if (a2)
    {
      *a2 = *(unsigned __int16 *)(v13 + 6);
      uint64_t v11 = v13 + 8;
      goto LABEL_18;
    }
    return 0;
  }
  if (!a3) {
    goto LABEL_16;
  }
  uint64_t result = mdb_node_read(a1, (unsigned int *)(v10 + v12), a3);
  if (!result) {
    goto LABEL_16;
  }
  return result;
}

uint64_t mdb_page_spill(uint64_t a1, void *a2, void *a3)
{
  if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = *(unsigned __int16 *)(*(void *)(a1 + 40) + 6);
  if (*(_DWORD *)(a1 + 32) >= 2u) {
    v5 += *(unsigned __int16 *)(*(void *)(v4 + 88) + 54);
  }
  if (a2)
  {
    unint64_t v6 = *(unsigned int *)(*(void *)(v4 + 32) + 16);
    v5 += (*a2 + *a3 + v6 + 8) / v6;
  }
  if (*(_DWORD *)(v4 + 128) > (2 * v5)) {
    return 0;
  }
  int v8 = *(_DWORD **)(v4 + 72);
  uint64_t v9 = *(_DWORD **)(v4 + 64);
  if (v9)
  {
    int v10 = *v9;
    if (*v9)
    {
      unsigned int v11 = 0;
      if ((v10 + 1) > 2) {
        uint64_t v12 = (v10 + 1);
      }
      else {
        uint64_t v12 = 2;
      }
      uint64_t v13 = (uint64_t *)(v9 + 2);
      uint64_t v14 = v12 - 1;
      do
      {
        uint64_t v16 = *v13++;
        uint64_t v15 = v16;
        if ((v16 & 1) == 0) {
          *(void *)&v9[2 * ++v11] = v15;
        }
        --v14;
      }
      while (v14);
    }
    else
    {
      unsigned int v11 = 0;
    }
    *(void *)uint64_t v9 = v11;
  }
  else
  {
    uint64_t v17 = mdb_midl_alloc(0x1FFFF);
    *(void *)(v4 + 64) = v17;
    if (!v17) {
      return 12;
    }
  }
  uint64_t result = mdb_pages_xkeep(a1, 16, 1);
  if (!result)
  {
    uint64_t v18 = *v8;
    if (*v8)
    {
      if ((2 * v5) < 0x4000) {
        int v19 = 0x3FFF;
      }
      else {
        int v19 = 2 * v5;
      }
      do
      {
        uint64_t v20 = &v8[4 * v18];
        uint64_t v21 = v20[1];
        if ((*(_WORD *)(v21 + 10) & 0xC000) == 0)
        {
          unint64_t v22 = 2 * *v20;
          uint64_t v23 = *(void **)v4;
          if (*(void *)v4)
          {
            while (1)
            {
              uint64_t v24 = (unsigned int *)v23[8];
              if (v24)
              {
                unsigned int v25 = mdb_midl_search(v24, v22);
                uint64_t v26 = (void *)v23[8];
                if (*v26 >= (unint64_t)v25 && v26[v25] == v22) {
                  break;
                }
              }
              uint64_t v23 = (void *)*v23;
              if (!v23) {
                goto LABEL_33;
              }
            }
            *(_WORD *)(v21 + 10) |= 0x8000u;
          }
          else
          {
LABEL_33:
            uint64_t result = mdb_midl_append((unint64_t **)(v4 + 64), v22);
            if (result) {
              goto LABEL_41;
            }
            --v19;
          }
        }
        --v18;
      }
      while (v18 && v19);
    }
    mdb_midl_sort(*(int **)(v4 + 64));
    uint64_t result = mdb_page_flush(v4, v18);
    if (!result) {
      uint64_t result = mdb_pages_xkeep(a1, 32784, v18);
    }
  }
LABEL_41:
  if (result) {
    int v27 = 2;
  }
  else {
    int v27 = 8;
  }
  *(_DWORD *)(v4 + 124) |= v27;
  return result;
}

uint64_t mdb_page_new(uint64_t a1, __int16 a2, signed int a3, char **a4)
{
  int v10 = 0;
  uint64_t result = mdb_page_alloc(a1, a3, &v10);
  if (!result)
  {
    uint64_t v9 = v10;
    *((_WORD *)v10 + 5) = a2 | 0x10;
    *((_WORD *)v9 + 6) = 16;
    *((_WORD *)v9 + 7) = *(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 32) + 16);
    if (a2)
    {
      ++*(void *)(*(void *)(a1 + 40) + 8);
    }
    else if ((a2 & 2) != 0)
    {
      ++*(void *)(*(void *)(a1 + 40) + 16);
    }
    else if ((a2 & 4) != 0)
    {
      *(void *)(*(void *)(a1 + 40) + 24) += a3;
      *((_DWORD *)v9 + 3) = a3;
    }
    *a4 = v9;
  }
  return result;
}

uint64_t mdb_cursor_touch(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  if (v2 >= 2 && (**(unsigned char **)(a1 + 56) & 0x21) == 0)
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    memset(v7, 0, sizeof(v7));
    uint64_t v6 = *(void *)(a1 + 24);
    if (*(_DWORD *)(*(void *)(v6 + 96) + 4 * v2) != *(_DWORD *)(*(void *)(*(void *)(v6 + 32) + 152) + 4 * v2)) {
      return 4294936516;
    }
    mdb_cursor_init((uint64_t)v8, v6, 1u, (uint64_t)v7);
    uint64_t result = mdb_page_search((uint64_t)v8, *(void **)(a1 + 48), 1);
    if (result) {
      return result;
    }
    **(unsigned char **)(a1 + 56) |= 1u;
  }
  *(_WORD *)(a1 + 66) = 0;
  if (!*(_WORD *)(a1 + 64)) {
    return 0;
  }
  do
  {
    uint64_t result = mdb_page_touch(a1);
    unsigned int v4 = *(unsigned __int16 *)(a1 + 64);
    if (result) {
      break;
    }
    unsigned __int16 v5 = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v5;
  }
  while (v4 > v5);
  *(_WORD *)(a1 + 66) = v4 - 1;
  return result;
}

uint64_t mdb_update_key(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  unsigned int v4 = *(unsigned __int16 **)(a1 + 8 * v3 + 72);
  unsigned __int16 v5 = &v4[*(unsigned __int16 *)(a1 + 2 * v3 + 328)];
  unsigned int v8 = v5[8];
  int v7 = v5 + 8;
  uint64_t v6 = v8;
  uint64_t v9 = (unsigned __int16 *)((char *)v4 + v8);
  size_t v10 = *(void *)a2;
  int v11 = (*(void *)a2 + 1) & 0xFFFFFFFE;
  int v12 = v9[3];
  int v13 = (v12 + 1) & 0x1FFFE;
  int v14 = v11 - v13;
  if (v11 != v13)
  {
    if (v14 <= 0)
    {
      int v15 = v4[6];
    }
    else
    {
      int v15 = v4[6];
      if (v14 > (unsigned __int16)(v4[7] - v15))
      {
        size_t v17 = *(unsigned int *)v9 | ((unint64_t)v9[2] << 32);
        mdb_node_del((void *)a1, 0);
        return mdb_page_split(a1, a2, 0, v17, 0x40000);
      }
    }
    uint64_t v19 = (unsigned __int16)((v15 + 131056) >> 1);
    if ((unsigned __int16)((v15 + 131056) >> 1))
    {
      uint64_t v20 = v4 + 8;
      do
      {
        unsigned int v21 = (unsigned __int16)*v20;
        if (v21 <= v6) {
          *uint64_t v20 = v21 - v14;
        }
        ++v20;
        --v19;
      }
      while (v19);
    }
    memmove((char *)v4 + v4[7] - v14, (char *)v4 + v4[7], v6 - v4[7] + 8);
    v4[7] -= v14;
    uint64_t v9 = (unsigned __int16 *)((char *)v4 + *v7);
    int v12 = v9[3];
    size_t v10 = *(void *)a2;
  }
  if (v10 != v12) {
    v9[3] = v10;
  }
  if (v10) {
    memcpy(v9 + 4, *(const void **)(a2 + 8), v10);
  }
  return 0;
}

uint64_t mdb_page_alloc(uint64_t a1, signed int a2, char **a3)
{
  signed int v3 = a2;
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(v4 + 32);
  int v7 = (uint64_t **)(v5 + 176);
  uint64_t v6 = *(uint64_t **)(v5 + 176);
  if (v6) {
    unsigned int v8 = *(_DWORD *)v6;
  }
  else {
    unsigned int v8 = 0;
  }
  unint64_t v40 = 0;
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  uint64_t v9 = (a2 - 1);
  if (a2 == 1 && (uint64_t v10 = *(void *)(v4 + 48)) != 0)
  {
    uint64_t result = 0;
    *(void *)(v4 + 48) = *(void *)(v10 + 48);
    --*(_DWORD *)(v4 + 56);
    *a3 = (char *)v10;
  }
  else
  {
    *a3 = 0;
    if (*(_DWORD *)(v4 + 128))
    {
      unint64_t oldest = 0;
      int v13 = 0;
      int v35 = 0;
      char v14 = 1;
      int v15 = 1 - a2;
      int v33 = 60 * a2;
      while (1)
      {
        uint64_t v41 = 0;
        uint64_t v42 = 0;
        uint64_t v36 = 0;
        uint64_t v37 = 0;
        if (v8 > v9)
        {
          uint64_t v16 = v7;
          unsigned int v17 = v8;
          unsigned int v18 = v8;
          while (1)
          {
            uint64_t v19 = v6[v18];
            if (v6[v15 + v18] == v19 + v9) {
              goto LABEL_41;
            }
            if (--v18 <= v9)
            {
              signed int v3 = a2;
              BOOL v20 = v33-- < 1;
              unsigned int v8 = v17;
              if (v20) {
                goto LABEL_39;
              }
              int v7 = v16;
              break;
            }
          }
        }
        if (v14)
        {
          unint64_t v40 = *(void *)(v5 + 184);
          unint64_t oldest = *(void *)(v5 + 168);
          mdb_cursor_init(v38, v4, 0, 0);
          unint64_t v21 = v40;
          if (v40)
          {
            uint64_t v42 = (char *)&v40;
            uint64_t v41 = 8;
            int v13 = 17;
          }
          else
          {
            int v13 = 0;
          }
        }
        else
        {
          unint64_t v21 = v40;
        }
        unint64_t v22 = v21 + 1;
        unint64_t v40 = v22;
        if (oldest <= v22)
        {
          if (!v35)
          {
            unint64_t oldest = mdb_find_oldest(v4);
            *(void *)(v5 + 168) = oldest;
            unint64_t v22 = v40;
          }
          if (oldest <= v22) {
            goto LABEL_39;
          }
          int v35 = 1;
        }
        uint64_t result = mdb_cursor_get((uint64_t)v38, &v41, 0, v13);
        if (result) {
          break;
        }
        unint64_t v23 = *(void *)v42;
        unint64_t v40 = v23;
        if (oldest <= v23)
        {
          if (!v35)
          {
            unint64_t oldest = mdb_find_oldest(v4);
            *(void *)(v5 + 168) = oldest;
            unint64_t v23 = v40;
          }
          if (oldest <= v23) {
            goto LABEL_39;
          }
          int v35 = 1;
        }
        uint64_t result = mdb_node_read((uint64_t)v38, (unsigned int *)(*((void *)&v38[4] + WORD1(v38[4]) + 1)+ *(unsigned __int16 *)(*((void *)&v38[4] + WORD1(v38[4]) + 1)+ 2 * *((unsigned __int16 *)&v38[20] + WORD1(v38[4]) + 4)+ 16)), &v36);
        if (result) {
          goto LABEL_55;
        }
        uint64_t v24 = (uint64_t *)v37;
        if (v6)
        {
          uint64_t result = mdb_midl_need((_DWORD **)v7, *v37);
          if (result) {
            goto LABEL_55;
          }
          uint64_t v6 = *v7;
        }
        else
        {
          uint64_t v6 = mdb_midl_alloc(*v37);
          *int v7 = v6;
          if (!v6) {
            goto LABEL_43;
          }
        }
        *(void *)(v5 + 184) = v40;
        mdb_midl_xmerge(v6, v24);
        char v14 = 0;
        unsigned int v8 = *(_DWORD *)v6;
        int v13 = 8;
      }
      if (result != -30798) {
        goto LABEL_55;
      }
LABEL_39:
      unsigned int v17 = v8;
      uint64_t v19 = *(void *)(v4 + 16);
      if ((unint64_t)(v19 + v3) >= *(void *)(v5 + 128))
      {
        uint64_t result = 4294936504;
        goto LABEL_55;
      }
      unsigned int v18 = 0;
LABEL_41:
      if ((*(unsigned char *)(v5 + 14) & 8) != 0)
      {
        unsigned int v25 = (char *)(*(void *)(v5 + 56) + v19 * *(unsigned int *)(v5 + 16));
      }
      else
      {
        unsigned int v25 = mdb_page_malloc(v4, a2);
        if (!v25)
        {
LABEL_43:
          uint64_t result = 12;
          goto LABEL_55;
        }
      }
      if (v18)
      {
        uint64_t v26 = v17 - a2;
        *uint64_t v6 = v26;
        unsigned int v27 = v18 - a2;
        if (v18 - a2 < v26)
        {
          uint64_t v28 = v26 - v27;
          int v29 = &v6[v27 + 1];
          unsigned int v30 = v18 + 1;
          do
          {
            *v29++ = v6[v30++];
            --v28;
          }
          while (v28);
        }
      }
      else
      {
        *(void *)(v4 + 16) = v19 + a2;
      }
      *(void *)unsigned int v25 = v19;
      long long v31 = (void (*)(void, uint64_t *))mdb_mid2l_append;
      if ((*(_DWORD *)(v4 + 124) & 0x80000) == 0) {
        long long v31 = (void (*)(void, uint64_t *))mdb_mid2l_insert;
      }
      uint64_t v41 = v19;
      uint64_t v42 = v25;
      v31(*(void *)(v4 + 72), &v41);
      uint64_t result = 0;
      --*(_DWORD *)(v4 + 128);
      *a3 = v25;
    }
    else
    {
      uint64_t result = 4294936508;
LABEL_55:
      *(_DWORD *)(v4 + 124) |= 2u;
    }
  }
  return result;
}

void *mdb_node_del(void *result, int a2)
{
  uint64_t v2 = *((unsigned __int16 *)result + 33);
  signed int v3 = (_WORD *)result[v2 + 9];
  uint64_t v4 = *((unsigned __int16 *)result + v2 + 164);
  uint64_t v5 = (unsigned __int16)v3[6];
  unint64_t v6 = v5 + 131056;
  __int16 v7 = v3[5];
  if ((v7 & 0x20) != 0)
  {
    __int16 v12 = a2;
    int v13 = ~v4 + (unsigned __int16)(v6 >> 1);
    if (v13)
    {
      char v14 = (char *)v3 + (int)v4 * (uint64_t)a2 + 16;
      uint64_t result = memmove(v14, &v14[a2], v13 * a2);
      LOWORD(v5) = v3[6];
    }
    __int16 v17 = v3[7];
    int v15 = v3 + 7;
    LOWORD(v16) = v17;
    *(v15 - 1) = v5 - 2;
    __int16 v18 = v12 - 2;
  }
  else
  {
    uint64_t v8 = (unsigned __int16)v3[v4 + 8];
    uint64_t v9 = (char *)v3 + v8;
    int v10 = *(unsigned __int16 *)((char *)v3 + v8 + 6);
    int v11 = v10 + 8;
    if ((v7 & 2) != 0)
    {
      if (*((_WORD *)v9 + 2)) {
        int v11 = v10 + 16;
      }
      else {
        v11 += *(_DWORD *)v9;
      }
    }
    unsigned int v16 = (v11 + 1) & 0xFFFFFFFE;
    uint64_t v19 = (unsigned __int16)(v6 >> 1);
    if (v19)
    {
      unsigned __int16 v20 = 0;
      unint64_t v21 = v3 + 8;
      do
      {
        if (v4)
        {
          __int16 v22 = *v21;
          unint64_t v23 = &v3[v20];
          v23[8] = *v21;
          uint64_t v24 = v23 + 8;
          if (*v21 < v8) {
            *uint64_t v24 = v22 + v16;
          }
          ++v20;
        }
        ++v21;
        --v4;
        --v19;
      }
      while (v19);
    }
    uint64_t result = memmove((char *)v3 + (unsigned __int16)v3[7] + v16, (char *)v3 + (unsigned __int16)v3[7], v8 - (unsigned __int16)v3[7]);
    v3[6] -= 2;
    __int16 v18 = v3[7];
    int v15 = v3 + 7;
  }
  *int v15 = v18 + v16;
  return result;
}

uint64_t mdb_page_get(uint64_t a1, unint64_t a2, unint64_t *a3, int *a4)
{
  uint64_t v7 = *(void *)(a1 + 24);
  if ((*(unsigned char *)(a1 + 70) & 0xA) != 0)
  {
LABEL_10:
    if (*(void *)(v7 + 16) <= a2)
    {
      *(_DWORD *)(v7 + 124) |= 2u;
      return 4294936499;
    }
    int v9 = 0;
  }
  else
  {
    uint64_t v8 = 2 * a2;
    int v9 = 1;
    int v10 = *(void **)(a1 + 24);
    while (1)
    {
      int v11 = (unsigned int *)v10[8];
      __int16 v12 = (unsigned int *)v10[9];
      if (v11)
      {
        unsigned int v13 = mdb_midl_search(v11, 2 * a2);
        char v14 = (void *)v10[8];
        if (*v14 >= (unint64_t)v13 && v14[v13] == v8) {
          break;
        }
      }
      if (*(void *)v12)
      {
        unsigned int v15 = mdb_mid2l_search(v12, a2);
        if (*(void *)v12 >= (unint64_t)v15 && *(void *)&v12[4 * v15] == a2)
        {
          unint64_t v16 = *(void *)&v12[4 * v15 + 2];
          goto LABEL_13;
        }
      }
      ++v9;
      int v10 = (void *)*v10;
      if (!v10) {
        goto LABEL_10;
      }
    }
  }
  unint64_t v16 = *(void *)(*(void *)(v7 + 32) + 56) + *(unsigned int *)(*(void *)(v7 + 32) + 16) * a2;
LABEL_13:
  *a3 = v16;
  uint64_t result = 0;
  if (a4) {
    *a4 = v9;
  }
  return result;
}

uint64_t mdb_page_unspill(uint64_t a1, uint64_t a2, char **a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  unint64_t v7 = 2 * *(void *)a2;
  uint64_t v8 = (void *)a1;
  while (1)
  {
    int v9 = (unsigned int *)v8[8];
    if (v9)
    {
      unsigned int v10 = mdb_midl_search(v9, v7);
      int v11 = (void *)v8[8];
      if (*v11 >= (unint64_t)v10)
      {
        uint64_t v12 = v10;
        if (v11[v10] == v7) {
          break;
        }
      }
    }
    uint64_t v8 = (void *)*v8;
    if (!v8) {
      return 0;
    }
  }
  if (!*(_DWORD *)(a1 + 128)) {
    return 4294936508;
  }
  if ((*(_WORD *)(a2 + 10) & 4) != 0) {
    signed int v14 = *(_DWORD *)(a2 + 12);
  }
  else {
    signed int v14 = 1;
  }
  if ((*(unsigned char *)(v6 + 14) & 8) != 0)
  {
    unint64_t v16 = (char *)a2;
  }
  else
  {
    unsigned int v15 = mdb_page_malloc(a1, v14);
    if (!v15) {
      return 12;
    }
    unint64_t v16 = v15;
    int v17 = *(_DWORD *)(v6 + 16);
    if (v14 < 2) {
      mdb_page_copy(v15, (_WORD *)a2, v17);
    }
    else {
      memcpy(v15, (const void *)a2, (v17 * v14));
    }
  }
  if (v8 == (void *)a1)
  {
    __int16 v18 = *(void **)(a1 + 64);
    if (*v18 == v12) {
      *__int16 v18 = v12 - 1;
    }
    else {
      v18[v12] |= 1uLL;
    }
  }
  uint64_t v19 = mdb_mid2l_append;
  if ((*(_DWORD *)(a1 + 124) & 0x80000) == 0) {
    uint64_t v19 = mdb_mid2l_insert;
  }
  v20[0] = *(void *)v16;
  v20[1] = v16;
  ((void (*)(void, void *))v19)(*(void *)(a1 + 72), v20);
  uint64_t result = 0;
  --*(_DWORD *)(a1 + 128);
  *((_WORD *)v16 + 5) |= 0x10u;
  *a3 = v16;
  return result;
}

char *mdb_page_malloc(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  size_t v4 = *(unsigned int *)(v3 + 16);
  if (a2 == 1)
  {
    uint64_t v5 = *(char **)(v3 + 192);
    if (v5)
    {
      *(void *)(v3 + 192) = *(void *)v5;
      return v5;
    }
    size_t v7 = v4 - 16;
    uint64_t v6 = 16;
  }
  else
  {
    uint64_t v6 = v4 * (unint64_t)a2 - v4;
    size_t v7 = *(unsigned int *)(v3 + 16);
    size_t v4 = v4 * (unint64_t)a2;
  }
  uint64_t v8 = (char *)malloc_type_malloc(v4, 0x19F3F053uLL);
  uint64_t v5 = v8;
  if (v8)
  {
    if ((*(unsigned char *)(v3 + 15) & 1) == 0)
    {
      bzero(&v8[v6], v7);
      *((_WORD *)v5 + 4) = 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 124) |= 2u;
  }
  return v5;
}

uint64_t mdb_ovpage_free(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  unint64_t v4 = *(void *)a2;
  uint64_t v5 = *(unsigned int *)(a2 + 12);
  uint64_t v6 = *(void *)(v3 + 32);
  size_t v7 = (unsigned int **)(v6 + 176);
  if (!*(void *)(v6 + 176) || *(void *)v3)
  {
LABEL_3:
    uint64_t result = mdb_midl_append_range((uint64_t **)(v3 + 40), v4, v5);
    if (result) {
      return result;
    }
    goto LABEL_4;
  }
  unsigned int v10 = *(void **)(v3 + 64);
  if ((*(_WORD *)(a2 + 10) & 0x10) != 0)
  {
    unsigned int v12 = 0;
  }
  else
  {
    if (!v10) {
      goto LABEL_3;
    }
    unsigned int v11 = mdb_midl_search(*(unsigned int **)(v3 + 64), 2 * v4);
    if (*v10 < (unint64_t)v11) {
      goto LABEL_3;
    }
    unsigned int v12 = v11;
    if (v10[v11] != 2 * v4) {
      goto LABEL_3;
    }
  }
  uint64_t result = mdb_midl_need(v7, v5);
  if (!result)
  {
    if ((*(_WORD *)(a2 + 10) & 0x10) == 0)
    {
      if (*v10 == v12) {
        *unsigned int v10 = v12 - 1;
      }
      else {
        v10[v12] |= 1uLL;
      }
LABEL_23:
      unint64_t v23 = *v7;
      unsigned int v24 = **v7;
      if (v24)
      {
        while (1)
        {
          unsigned int v25 = v5 + v24;
          unint64_t v26 = *(void *)&v23[2 * v24];
          if (v26 >= v4) {
            break;
          }
          *(void *)&v23[2 * v25] = v26;
          if (!--v24)
          {
            unsigned int v25 = v5;
            break;
          }
        }
      }
      else
      {
        unsigned int v25 = v5;
      }
      if (v25 > v24)
      {
        unsigned int v27 = &v23[2 * v25];
        do
        {
          *(void *)unsigned int v27 = v4;
          v27 -= 2;
          ++v4;
          --v25;
        }
        while (v24 < v25);
      }
      *(void *)v23 += v5;
LABEL_4:
      uint64_t result = 0;
      *(void *)(*(void *)(a1 + 40) + 24) -= v5;
      return result;
    }
    unsigned int v13 = *(uint64_t **)(v3 + 72);
    uint64_t v14 = (*v13)--;
    unsigned int v15 = &v13[2 * v14];
    uint64_t v16 = v15[1];
    if (v16 == a2)
    {
LABEL_20:
      ++*(_DWORD *)(v3 + 128);
      if ((*(unsigned char *)(v6 + 14) & 8) == 0) {
        mdb_dpage_free(v6, (void *)a2);
      }
      goto LABEL_23;
    }
    uint64_t v17 = v14;
    uint64_t v18 = *v15;
    uint64_t v19 = v17 + 1;
    unsigned __int16 v20 = &v13[2 * v17 - 1];
    while ((unint64_t)--v19 >= 2)
    {
      uint64_t v21 = *(v20 - 1);
      uint64_t v22 = *v20;
      *(v20 - 1) = v18;
      *unsigned __int16 v20 = v16;
      v20 -= 2;
      uint64_t v16 = v22;
      uint64_t v18 = v21;
      if (v22 == a2) {
        goto LABEL_20;
      }
    }
    uint64_t v28 = *v13 + 1;
    *unsigned int v13 = v28;
    int v29 = &v13[2 * v28];
    *int v29 = v18;
    v29[1] = v16;
    *(_DWORD *)(v3 + 124) |= 2u;
    return 4294936517;
  }
  return result;
}

uint64_t mdb_page_split(uint64_t a1, uint64_t a2, size_t *a3, size_t a4, int a5)
{
  uint64_t v10 = *(void *)(*(void *)(a1 + 24) + 32);
  v216[0] = 0uLL;
  size_t v214 = 0;
  v215 = 0;
  uint64_t v212 = 0;
  v213 = 0;
  v210 = 0;
  v211 = 0;
  uint64_t v209 = 0;
  memset(v208, 0, sizeof(v208));
  long long v206 = 0u;
  long long v207 = 0u;
  long long v204 = 0u;
  long long v205 = 0u;
  uint64_t v11 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v12 = *(void *)(a1 + 8 * v11 + 72);
  unsigned int v13 = (void *)(a1 + 328);
  uint64_t v14 = *(unsigned __int16 *)(a1 + 328 + 2 * v11);
  int v15 = *(unsigned __int16 *)(v12 + 12);
  uint64_t result = mdb_page_new(a1, *(_WORD *)(v12 + 10), 1, &v211);
  if (result) {
    return result;
  }
  v173 = a3;
  v177 = v211;
  uint64_t v178 = a2;
  *((_WORD *)v211 + 4) = *(_WORD *)(v12 + 8);
  int v17 = *(unsigned __int16 *)(a1 + 66);
  if (*(_WORD *)(a1 + 66))
  {
    size_t v170 = a4;
    int v18 = a5;
    uint64_t v19 = v10;
    uint64_t v175 = v14;
    unsigned int v20 = 0;
    unsigned int v21 = v17 - 1;
  }
  else
  {
    uint64_t result = mdb_page_new(a1, 1, 1, &v210);
    if (result) {
      goto LABEL_177;
    }
    size_t v170 = a4;
    uint64_t v31 = *(unsigned __int16 *)(a1 + 64);
    if (*(_WORD *)(a1 + 64))
    {
      unint64_t v32 = v31 + 1;
      int v33 = (void *)(a1 + 8 * v31 + 72);
      uint64_t v34 = (_WORD *)(a1 + 2 * v31 + 328);
      int v35 = v33;
      uint64_t v36 = v34;
      do
      {
        uint64_t v37 = *--v35;
        *int v33 = v37;
        LOWORD(v37) = *--v36;
        *uint64_t v34 = v37;
        --v32;
        uint64_t v34 = v36;
        int v33 = v35;
      }
      while (v32 > 1);
    }
    uint64_t v38 = v210;
    *(void *)(a1 + 72) = v210;
    *(_WORD *)(a1 + 328) = 0;
    uint64_t v39 = *(void *)(a1 + 40);
    *(void *)(v39 + 40) = *(void *)v38;
    unsigned int v20 = *(unsigned __int16 *)(v39 + 6);
    *(_WORD *)(v39 + 6) = v20 + 1;
    uint64_t result = mdb_node_add(a1, 0, 0, 0, *(void *)v12, 0);
    if (result)
    {
      *(void *)(a1 + 72) = *(void *)(a1 + 80);
      *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
      uint64_t v40 = *(void *)(a1 + 40);
      *(void *)(v40 + 40) = *(void *)v12;
      --*(_WORD *)(v40 + 6);
      goto LABEL_177;
    }
    int v18 = a5;
    uint64_t v19 = v10;
    uint64_t v175 = v14;
    unsigned int v21 = 0;
    ++*(_WORD *)(a1 + 64);
    LOWORD(v17) = *(_WORD *)(a1 + 66) + 1;
    *(_WORD *)(a1 + 66) = v17;
  }
  mdb_cursor_copy(a1, (uint64_t)&v204);
  *(void *)&long long v205 = 0;
  uint64_t v22 = WORD1(v208[0]);
  unint64_t v23 = (size_t *)v177;
  *((void *)v208 + WORD1(v208[0]) + 1) = v177;
  unsigned int v24 = (char *)&v204 + 2 * v21;
  *((_WORD *)v24 + 164) = *(_WORD *)(a1 + 2 * v21 + 328) + 1;
  unsigned int v171 = v21;
  unsigned int v169 = v20;
  if ((v18 & 0x20000) != 0)
  {
    unsigned int v41 = v21;
    unsigned int v174 = 0;
    uint64_t v42 = 0;
    *((_WORD *)&v208[16] + v22 + 4) = 0;
    v216[0] = *(_OWORD *)v178;
    size_t v43 = *(void *)&v216[0];
    signed int v44 = v175;
    signed int v172 = v175;
    uint64_t v28 = v19;
    int v45 = v18;
    goto LABEL_71;
  }
  unsigned int v25 = v15 - 16;
  unsigned int v26 = v25 >> 1;
  unsigned int v27 = ((v25 >> 1) + 1) >> 1;
  uint64_t v28 = v19;
  unsigned int v174 = v25 >> 1;
  v165 = v24;
  if ((*((_WORD *)v177 + 5) & 0x20) == 0)
  {
    unsigned int v29 = (v26 + 1) >> 1;
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      unint64_t v53 = *(void *)v178 + *v173 + 8;
      uint64_t v54 = 8 - *v173;
      if (v53 <= *(unsigned int *)(v28 + 220)) {
        LODWORD(v54) = 0;
      }
      LODWORD(v30) = (v53 + v54 + 3) & 0xFFFFFFFE;
    }
    else if (v178)
    {
      uint64_t v30 = *(void *)v178 + 10;
    }
    else
    {
      LODWORD(v30) = 10;
    }
    int v58 = *(_DWORD *)(v28 + 16);
    uint64_t v59 = mdb_page_malloc(*(void *)(a1 + 24), 1u);
    if (v59)
    {
      uint64_t v42 = v59;
      int v60 = v58 - 16;
      int v61 = (v30 + 1) & 0xFFFFFFFE;
      *(void *)uint64_t v59 = *(void *)v12;
      *((_WORD *)v59 + 5) = *(_WORD *)(v12 + 10);
      *((_WORD *)v59 + 6) = 16;
      *((_WORD *)v59 + 7) = *(_DWORD *)(v28 + 16);
      if (v25 > 1)
      {
        int v66 = 0;
        unsigned int v62 = v25 >> 1;
        if (v174 <= 1) {
          uint64_t v67 = 1;
        }
        else {
          uint64_t v67 = v174;
        }
        uint64_t v68 = (__int16 *)(v12 + 16);
        signed int v44 = v175;
        uint64_t v69 = v175;
        unsigned int v65 = v29;
        do
        {
          if (!v69)
          {
            unint64_t v70 = &v59[2 * v66++];
            *((_WORD *)v70 + 8) = 0;
          }
          __int16 v71 = *v68++;
          uint64_t v72 = &v59[2 * v66++];
          *((_WORD *)v72 + 8) = v71;
          --v69;
          --v67;
        }
        while (v67);
        if (v60 >= 0) {
          int v73 = v58 - 16;
        }
        else {
          int v73 = v58 - 1;
        }
        BOOL v63 = v174 > v175;
        unsigned int v41 = v171;
        unint64_t v23 = (size_t *)v177;
        __int16 v64 = (size_t *)v178;
        if (v25 >= 0x40 && v61 <= v73 >> 4 && v174 > v175)
        {
          int v45 = v18;
          goto LABEL_68;
        }
      }
      else
      {
        signed int v44 = v175;
        unint64_t v23 = (size_t *)v177;
        unsigned int v62 = v25 >> 1;
        BOOL v63 = v174 > v175;
        unsigned int v41 = v171;
        __int16 v64 = (size_t *)v178;
        unsigned int v65 = v29;
      }
      if (v65 < v44 && v63)
      {
        int v74 = v65 - 1;
        int v75 = -1;
        BOOL v63 = 1;
        LODWORD(v76) = v62;
      }
      else
      {
        if (v63)
        {
          BOOL v63 = 0;
          LODWORD(v76) = 0;
          int v74 = v65 + ((*(unsigned __int16 *)(v12 + 10) >> 1) & 1) + 1;
          int v75 = 1;
          int v45 = v18;
          goto LABEL_54;
        }
        LODWORD(v76) = 0;
        int v75 = 1;
        int v74 = v62;
      }
      int v45 = v18;
      if (v76 != v74)
      {
LABEL_54:
        signed int v77 = 0;
        uint64_t v78 = v75;
        uint64_t v79 = v74 - v75;
        int v80 = -(int)v76;
        int v81 = -v74;
        uint64_t v76 = v76;
        while (1)
        {
          if (v44 == v76)
          {
            v77 += v61;
          }
          else
          {
            uint64_t v82 = v12 + *(unsigned __int16 *)&v42[2 * v76 + 16];
            int v83 = v77 + *(unsigned __int16 *)(v82 + 6) + 10;
            if ((*(_WORD *)(v12 + 10) & 2) != 0)
            {
              if (*(_WORD *)(v82 + 4)) {
                v83 += 8;
              }
              else {
                v83 += *(_DWORD *)v82;
              }
            }
            signed int v77 = (v83 + 1) & 0xFFFFFFFE;
          }
          if (v77 > v60 || v79 == v76) {
            break;
          }
          v76 += v78;
          v80 -= v78;
          if (v81 == v80) {
            goto LABEL_67;
          }
        }
        unsigned int v65 = v63 - v80;
LABEL_67:
        unint64_t v23 = (size_t *)v177;
      }
LABEL_68:
      unsigned int v24 = v165;
      if (v65 == v44)
      {
        size_t v43 = *v64;
        size_t v84 = v64[1];
        *(void *)&v216[0] = *v64;
        *((void *)&v216[0] + 1) = v84;
        signed int v172 = v44;
      }
      else
      {
        signed int v172 = v65;
        uint64_t v85 = v12 + *(unsigned __int16 *)&v42[2 * v65 + 16];
        size_t v43 = *(unsigned __int16 *)(v85 + 6);
        *(void *)&v216[0] = v43;
        *((void *)&v216[0] + 1) = v85 + 8;
      }
      goto LABEL_71;
    }
    uint64_t result = 12;
LABEL_177:
    *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    return result;
  }
  int v46 = *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v17 + 328);
  int v47 = v46 - v27;
  size_t v43 = **(unsigned int **)(a1 + 40);
  uint64_t v48 = v12 + 16 + v43 * v27;
  size_t v49 = v43 * (v26 - v27);
  *(_WORD *)(v12 + 12) -= 2 * (v26 - v27);
  *((_WORD *)v177 + 6) += 2 * (v26 - v27);
  __int16 v50 = v43 * (v26 - v27) - 2 * (v26 - v27);
  *(_WORD *)(v12 + 14) += v50;
  *((_WORD *)v177 + 7) -= v50;
  *(void *)&v216[0] = v43;
  uint64_t v51 = v48;
  if (v27 == v175) {
    uint64_t v51 = *(void *)(v178 + 8);
  }
  *((void *)&v216[0] + 1) = v51;
  uint64_t v163 = v28;
  signed int v172 = ((v25 >> 1) + 1) >> 1;
  if (v47 < 0)
  {
    unint64_t v55 = (char *)(v12 + 16 + v43 * *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)));
    memcpy(v177 + 16, (const void *)(v12 + 16 + v43 * v27), v49);
    *((void *)&v216[0] + 1) = v177 + 16;
    memmove(&v55[v43], v55, ((((v25 >> 1) + 1) >> 1) - *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)))* v43);
    unint64_t v56 = v55;
    uint64_t v28 = v163;
    memcpy(v56, *(const void **)(v178 + 8), v43);
    signed int v44 = v175;
    unint64_t v23 = (size_t *)v177;
    unsigned int v41 = v171;
    uint64_t v42 = 0;
    *(_WORD *)(v12 + 12) += 2;
    *(_WORD *)(v12 + 14) = *(_WORD *)(v12 + 14) - v43 + 2;
    int v45 = v18;
    unsigned int v24 = v165;
  }
  else
  {
    uint64_t v52 = (v47 * v43);
    if (v46 != v27)
    {
      memcpy(v177 + 16, (const void *)(v12 + 16 + v43 * v27), (v47 * v43));
      unint64_t v23 = (size_t *)v177;
    }
    int v57 = (char *)v23 + v52 + 16;
    memcpy(v57, *(const void **)(v178 + 8), v43);
    memcpy(&v57[v43], (const void *)(v48 + v52), (v49 - v52));
    unint64_t v23 = (size_t *)v177;
    uint64_t v42 = 0;
    *((_WORD *)v177 + 6) += 2;
    *((_WORD *)v177 + 7) = *((_WORD *)v177 + 7) - v43 + 2;
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v47;
    uint64_t v28 = v163;
    unsigned int v24 = v165;
    int v45 = v18;
    signed int v44 = v175;
    unsigned int v41 = v171;
  }
LABEL_71:
  uint64_t v86 = *((void *)v208 + v41 + 1);
  unsigned __int16 v87 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
  unint64_t v168 = v43 + 10;
  if (v43 + 10 <= v87)
  {
    unsigned __int16 v167 = *(_WORD *)(v86 + 14) - *(_WORD *)(v86 + 12);
    --WORD1(v208[0]);
    LODWORD(result) = mdb_node_add((uint64_t)&v204, *((unsigned __int16 *)v24 + 164), (const void **)v216, 0, *v23, 0);
    ++WORD1(v208[0]);
    size_t v99 = v170;
    uint64_t v100 = (const void **)v178;
    if (!result) {
      goto LABEL_91;
    }
    goto LABEL_82;
  }
  signed int v176 = v44;
  uint64_t v88 = v28;
  unsigned int v166 = *(unsigned __int16 *)(a1 + 64);
  --LOWORD(v208[0]);
  --WORD1(v208[0]);
  uint64_t v203 = 0;
  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  long long v197 = 0u;
  long long v198 = 0u;
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  long long v191 = 0u;
  long long v192 = 0u;
  long long v189 = 0u;
  long long v190 = 0u;
  long long v187 = 0u;
  long long v188 = 0u;
  long long v185 = 0u;
  long long v186 = 0u;
  long long v183 = 0u;
  long long v184 = 0u;
  long long v181 = 0u;
  long long v182 = 0u;
  long long v179 = 0u;
  long long v180 = 0u;
  uint64_t v89 = *(void *)(*((void *)&v205 + 1) + 104);
  uint64_t v90 = v206;
  uint64_t v91 = &v204;
  if ((BYTE4(v208[0]) & 4) != 0)
  {
    DWORD1(v183) = 1;
    *(void *)&long long v180 = &v204;
    uint64_t v91 = &v179;
  }
  *(void *)uint64_t v91 = *(void *)(v89 + 8 * v206);
  *(void *)(v89 + 8 * v90) = v91;
  uint64_t result = mdb_page_split(&v204, v216, 0, *v23, 0);
  *(void *)(v89 + 8 * v90) = *(void *)v91;
  uint64_t v28 = v88;
  if (result) {
    goto LABEL_174;
  }
  unsigned __int16 v167 = v87;
  if (*(unsigned __int16 *)(a1 + 64) <= v166) {
    unint64_t v92 = v171;
  }
  else {
    unint64_t v92 = v171 + 1;
  }
  uint64_t v93 = *((void *)v208 + v92 + 1);
  uint64_t v94 = a1 + 8 * v92;
  uint64_t v97 = *(void *)(v94 + 72);
  uint64_t v95 = (void *)(v94 + 72);
  uint64_t v96 = v97;
  unsigned int v171 = v92;
  if (v93 == v97)
  {
    signed int v44 = v176;
    size_t v99 = v170;
    uint64_t v100 = (const void **)v178;
    goto LABEL_91;
  }
  uint64_t v98 = a1 + 2 * v92;
  size_t v99 = v170;
  uint64_t v100 = (const void **)v178;
  if (*(unsigned __int16 *)(v98 + 328) < (*(unsigned __int16 *)(v96 + 12) - 16) >> 1)
  {
    signed int v44 = v176;
    goto LABEL_91;
  }
  if ((int)v92 >= 1)
  {
    unint64_t v101 = 0;
    uint64_t v102 = a1 + 328;
    do
    {
      *(void *)(v102 + 8 * v101 - 256) = *((void *)v208 + v101 + 1);
      *(_WORD *)(v102 + 2 * v101) = *((_WORD *)&v208[16] + v101 + 4);
      ++v101;
    }
    while (v101 < v92);
  }
  size_t v103 = (_WORD *)(v98 + 328);
  *uint64_t v95 = v93;
  signed int v44 = v176;
  if (*((_WORD *)&v208[16] + v92 + 4))
  {
    *size_t v103 = *((_WORD *)&v208[16] + v92 + 4) - 1;
    goto LABEL_91;
  }
  *size_t v103 = 0;
  LODWORD(result) = mdb_cursor_sibling(a1, 0);
  if (result)
  {
LABEL_82:
    if (result == -30798) {
      uint64_t result = 4294936517;
    }
    else {
      uint64_t result = result;
    }
    goto LABEL_174;
  }
LABEL_91:
  if ((v45 & 0x20000) != 0)
  {
    uint64_t v123 = *(unsigned __int16 *)(a1 + 66);
    *(void *)(a1 + 8 * v123 + 72) = v177;
    *(_WORD *)(a1 + 2 * v123 + 328) = 0;
    uint64_t result = mdb_node_add(a1, 0, v100, v173, v99, v45);
    unsigned __int16 v116 = v167;
    if (result) {
      goto LABEL_174;
    }
    unsigned int v115 = v169;
    unsigned int v122 = v171;
    if (*(_WORD *)(a1 + 66))
    {
      memcpy(v13, (char *)&v208[16] + 8, 2 * *(unsigned __int16 *)(a1 + 66));
      unsigned int v122 = v171;
    }
    goto LABEL_139;
  }
  if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
  {
    unsigned int v115 = v169;
    unsigned int v122 = v171;
    unsigned __int16 v116 = v167;
    if (v172 <= v44)
    {
      *(void *)(a1 + 72 + 8 * *(unsigned __int16 *)(a1 + 66)) = v177;
      uint64_t v124 = a1 + 2 * v171;
      unsigned __int16 v125 = *(_WORD *)(v124 + 328) + 1;
      *(_WORD *)(v124 + 328) = v125;
      uint64_t v126 = *(void *)(a1 + 72 + 8 * v171);
      if (*((void *)v208 + v171 + 1) != v126
        && (*(unsigned __int16 *)(v126 + 12) - 16) >> 1 <= v125
        && (v171 & 0x80000000) == 0)
      {
        uint64_t v127 = 0;
        do
        {
          *(void *)(a1 + 8 * v127 + 72) = *((void *)v208 + v127 + 1);
          *(_WORD *)(a1 + 2 * v127 + 328) = *((_WORD *)&v208[16] + v127 + 4);
          ++v127;
        }
        while (v171 + 1 != v127);
      }
    }
LABEL_139:
    id v134 = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (!v134)
    {
LABEL_173:
      uint64_t result = 0;
      goto LABEL_174;
    }
    unsigned int v135 = *(unsigned __int16 *)(v12 + 12) - 16;
    unsigned int v136 = v135 >> 1;
    int v137 = *(_DWORD *)(a1 + 68);
    v138 = v211;
    uint64_t v139 = 2 * v115 + 330;
    uint64_t v140 = 8 * v115 + 80;
    while (1)
    {
      uint64_t v141 = v134;
      if ((v137 & 4) != 0) {
        uint64_t v141 = (uint64_t *)v134[2];
      }
      if (v141 == (uint64_t *)a1 || (*((_DWORD *)v134 + 17) & *((_DWORD *)v141 + 17) & 1) == 0) {
        goto LABEL_172;
      }
      if (!v115) {
        break;
      }
      if (v141[9] == v12)
      {
        v142 = (_WORD *)((char *)v141 + v139);
        v143 = (uint64_t *)((char *)v141 + v140);
        uint64_t v144 = v115 + 1;
        v145 = (_WORD *)((char *)v141 + v139);
        std::string v146 = (uint64_t *)((char *)v141 + v140);
        do
        {
          __int16 v147 = *--v145;
          _WORD *v142 = v147;
          uint64_t v148 = *--v146;
          void *v143 = v148;
          v143 = v146;
          v142 = v145;
        }
        while (v144-- > 1);
        *((_WORD *)v141 + 164) = v136 <= *((unsigned __int16 *)v141 + 164);
        v141[9] = *(void *)(a1 + 72);
        ++*((_WORD *)v141 + 32);
        unsigned __int16 v150 = *((_WORD *)v141 + 33) + 1;
        *((_WORD *)v141 + 33) = v150;
        goto LABEL_152;
      }
LABEL_172:
      id v134 = (uint64_t *)*v134;
      if (!v134) {
        goto LABEL_173;
      }
    }
    unsigned __int16 v150 = *((_WORD *)v141 + 33);
LABEL_152:
    uint64_t v151 = *(unsigned __int16 *)(a1 + 66);
    if (v151 <= v150 && v141[v151 + 9] == v12)
    {
      uint64_t v154 = (uint64_t)v141 + 2 * v151;
      unsigned int v155 = *(unsigned __int16 *)(v154 + 328);
      if ((v45 & 0x40000) == 0 && v155 >= v44)
      {
        *(_WORD *)(v154 + 328) = v155 + 1;
        uint64_t v151 = *(unsigned __int16 *)(a1 + 66);
        unsigned int v155 = *((unsigned __int16 *)v141 + v151 + 164);
      }
      if (v136 <= v155)
      {
        v141[v151 + 9] = (uint64_t)v138;
        *((_WORD *)v141 + v151 + 164) = v155 - (v135 >> 1);
        if (*(_WORD *)(a1 + 66))
        {
          unint64_t v156 = 0;
          v157 = v141 + 41;
          do
          {
            *((_WORD *)v157 + v156) = *((_WORD *)&v208[16] + v156 + 4);
            v157[v156 - 32] = *((void *)v208 + v156 + 1);
            ++v156;
          }
          while (v156 < *(unsigned __int16 *)(a1 + 66));
        }
      }
    }
    else if (v168 <= v116 && (int)v122 <= v150 && v141[v122 + 9] == *(void *)(a1 + 8 * v122 + 72))
    {
      uint64_t v152 = (uint64_t)v141 + 2 * v122;
      unsigned int v153 = *(unsigned __int16 *)(v152 + 328);
      if (v153 >= *(unsigned __int16 *)(a1 + 2 * v122 + 328)) {
        *(_WORD *)(v152 + 328) = v153 + 1;
      }
    }
    if ((*(_WORD *)(v12 + 10) & 2) != 0)
    {
      uint64_t v158 = v141[2];
      if (v158)
      {
        if (*(unsigned char *)(v158 + 68))
        {
          uint64_t v159 = *(unsigned __int16 *)(a1 + 66);
          uint64_t v160 = v141[v159 + 9];
          uint64_t v161 = *((unsigned __int16 *)v141 + v159 + 164);
          if (v161 < (*(unsigned __int16 *)(v160 + 12) - 16) >> 1)
          {
            uint64_t v162 = v160 + *(unsigned __int16 *)(v160 + 2 * v161 + 16);
            if ((*(_WORD *)(v162 + 4) & 6) == 4) {
              *(void *)(v158 + 72) = v162 + *(unsigned __int16 *)(v162 + 6) + 8;
            }
          }
        }
      }
    }
    goto LABEL_172;
  }
  uint64_t v164 = v28;
  size_t v104 = 0;
  int v105 = 0;
  *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v177;
  unsigned int v106 = (size_t *)&v212;
  signed int v107 = v172;
  while (1)
  {
    if (v107 == v44)
    {
      unsigned int v108 = *(unsigned int **)(v178 + 8);
      size_t v214 = *(void *)v178;
      v215 = v108;
      if ((*(_WORD *)(v12 + 10) & 2) != 0) {
        unsigned int v106 = v173;
      }
      else {
        size_t v104 = v99;
      }
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v105;
      __int16 v109 = *(_WORD *)(v12 + 10);
      LODWORD(v110) = v45;
    }
    else
    {
      uint64_t v111 = (unsigned int *)(v12 + *(unsigned __int16 *)&v42[2 * v107 + 16]);
      v215 = v111 + 2;
      int v112 = (char *)*((unsigned __int16 *)v111 + 3);
      size_t v214 = (size_t)v112;
      __int16 v109 = *(_WORD *)(v12 + 10);
      if ((v109 & 2) != 0)
      {
        uint64_t v212 = *v111;
        v213 = &v112[(void)(v111 + 2)];
        LODWORD(v110) = *((unsigned __int16 *)v111 + 2);
        unsigned int v106 = (size_t *)&v212;
      }
      else
      {
        uint64_t v110 = *((unsigned __int16 *)v111 + 2);
        size_t v104 = *v111 | (unint64_t)(v110 << 32);
      }
    }
    if (!(v109 & 2 | v105)) {
      size_t v214 = 0;
    }
    uint64_t result = mdb_node_add(a1, (unsigned __int16)v105, (const void **)&v214, v106, v104, v110);
    if (result) {
      break;
    }
    if (v107 == v174)
    {
      signed int v107 = 0;
      int v105 = 0;
      *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) = v42;
    }
    else
    {
      ++v107;
      ++v105;
    }
    if (v107 == v172)
    {
      LODWORD(v113) = *((unsigned __int16 *)v42 + 6);
      unsigned int v114 = (v113 - 16) >> 1;
      uint64_t v28 = v164;
      unsigned int v115 = v169;
      unsigned __int16 v116 = v167;
      if ((v113 - 16) >= 2)
      {
        if (v114 <= 1) {
          uint64_t v117 = 1;
        }
        else {
          uint64_t v117 = v114;
        }
        unint64_t v118 = (__int16 *)(v42 + 16);
        long long v119 = (_WORD *)(v12 + 16);
        do
        {
          __int16 v120 = *v118++;
          *v119++ = v120;
          --v117;
        }
        while (v117);
        uint64_t v113 = *((unsigned __int16 *)v42 + 6);
      }
      *(_WORD *)(v12 + 12) = v113;
      *(_WORD *)(v12 + 14) = *((_WORD *)v42 + 7);
      memcpy((void *)(v12 + *(unsigned __int16 *)(v12 + 2 * v114 - 2 + 16)), &v42[*(unsigned __int16 *)&v42[2 * v114 + 14]], *(_DWORD *)(v164 + 16) - *((unsigned __int16 *)v42 + 7));
      if (v172 <= v44)
      {
        uint64_t v121 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 72 + 8 * v121) = v211;
        unsigned int v122 = v171;
        uint64_t v128 = a1 + 2 * v171;
        unsigned __int16 v129 = *(_WORD *)(v128 + 328) + 1;
        *(_WORD *)(v128 + 328) = v129;
        uint64_t v130 = *(void *)(a1 + 72 + 8 * v171);
        if (*((void *)v208 + v171 + 1) != v130
          && (*(unsigned __int16 *)(v130 + 12) - 16) >> 1 <= v129
          && (v171 & 0x80000000) == 0)
        {
          uint64_t v131 = 0;
          do
          {
            *(void *)(a1 + 8 * v131 + 72) = *((void *)v208 + v131 + 1);
            *(_WORD *)(a1 + 2 * v131 + 328) = *((_WORD *)&v208[16] + v131 + 4);
            ++v131;
          }
          while (v171 + 1 != v131);
        }
      }
      else
      {
        uint64_t v121 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 8 * v121 + 72) = v12;
        unsigned int v122 = v171;
      }
      if ((v45 & 0x10000) != 0)
      {
        uint64_t v132 = *(void *)(a1 + 8 * v121 + 72);
        uint64_t v133 = v132
             + *(unsigned __int16 *)(v132 + 2 * *(unsigned __int16 *)(a1 + 2 * v121 + 328) + 16);
        if ((*(_WORD *)(v133 + 4) & 1) == 0) {
          v173[1] = v133 + *(unsigned __int16 *)(v133 + 6) + 8;
        }
      }
      goto LABEL_139;
    }
  }
  uint64_t v28 = v164;
LABEL_174:
  if (v42)
  {
    *(void *)uint64_t v42 = *(void *)(v28 + 192);
    *(void *)(v28 + 192) = v42;
  }
  if (result) {
    goto LABEL_177;
  }
  return result;
}

uint64_t mdb_node_add(uint64_t a1, int a2, const void **a3, size_t *a4, size_t a5, int a6)
{
  uint64_t v8 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  int v35 = 0;
  __int16 v9 = v8[5];
  if ((v9 & 0x20) != 0)
  {
    size_t v15 = **(int **)(a1 + 40);
    int v16 = (((unsigned __int16)v8[6] - 16) >> 1) - a2;
    if (v16 >= 1) {
      memmove((char *)v8 + (int)v15 * (uint64_t)a2 + v15 + 16, (char *)v8 + (int)v15 * (uint64_t)a2 + 16, v16 * (int)v15);
    }
    memcpy((char *)v8 + (int)v15 * (uint64_t)a2 + 16, a3[1], v15);
    uint64_t result = 0;
    v8[6] += 2;
    v8[7] = v8[7] - v15 + 2;
    return result;
  }
  int v10 = a6;
  int v13 = (unsigned __int16)v8[6];
  if (a3) {
    uint64_t v14 = (uint64_t)*a3 + 8;
  }
  else {
    uint64_t v14 = 8;
  }
  uint64_t v18 = (unsigned __int16)(v8[7] - v13) - 2;
  if ((v9 & 2) == 0)
  {
    unint64_t v19 = v14;
    goto LABEL_16;
  }
  if (a6)
  {
    unint64_t v19 = v14 + 8;
LABEL_16:
    int64_t v22 = (v19 + 1) & 0xFFFFFFFFFFFFFFFELL;
    if (v22 > v18)
    {
      uint64_t v20 = *(void *)(a1 + 24);
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  unint64_t v19 = *a4 + v14;
  uint64_t v20 = *(void *)(a1 + 24);
  uint64_t v21 = *(void *)(v20 + 32);
  if (v19 <= *(unsigned int *)(v21 + 220)) {
    goto LABEL_16;
  }
  int64_t v22 = (v14 + 9) & 0xFFFFFFFFFFFFFFFELL;
  if (v22 > v18)
  {
LABEL_18:
    *(_DWORD *)(v20 + 124) |= 2u;
    return 4294936510;
  }
  uint64_t result = mdb_page_new(a1, 4, ((*a4 + 15) / *(unsigned int *)(v21 + 16)) + 1, &v35);
  if (result) {
    return result;
  }
  v10 |= 1u;
  int v13 = (unsigned __int16)v8[6];
LABEL_19:
  unsigned int v23 = (v13 - 16) >> 1;
  if (v23 > a2)
  {
    unsigned int v24 = &v8[v23 + 8];
    unsigned int v25 = &v8[v23 + 7];
    do
    {
      --v23;
      __int16 v26 = *v25--;
      *v24-- = v26;
    }
    while (v23 > a2);
    LOWORD(v13) = v8[6];
  }
  unsigned __int16 v27 = v8[7] - v22;
  v8[a2 + 8] = v27;
  v8[7] = v27;
  v8[6] = v13 + 2;
  uint64_t v28 = (char *)v8 + v27;
  if (a3) {
    unsigned __int16 v29 = *(_WORD *)a3;
  }
  else {
    unsigned __int16 v29 = 0;
  }
  *((_WORD *)v28 + 3) = v29;
  *((_WORD *)v28 + 2) = v10;
  if ((v8[5] & 2) != 0) {
    a5 = *a4;
  }
  else {
    *((_WORD *)v28 + 2) = WORD2(a5);
  }
  *(_DWORD *)uint64_t v28 = a5;
  if (a3) {
    memcpy(v28 + 8, a3[1], (size_t)*a3);
  }
  if ((v8[5] & 2) != 0)
  {
    uint64_t v30 = &v28[v29 + 8];
    if (v35)
    {
      uint64_t v31 = v35 + 16;
      *(void *)uint64_t v30 = *(void *)v35;
      if ((v10 & 0x10000) != 0)
      {
        uint64_t result = 0;
        a4[1] = (size_t)v31;
        return result;
      }
      size_t v33 = *a4;
      unint64_t v32 = (const void *)a4[1];
      uint64_t v34 = v31;
    }
    else
    {
      if (v10)
      {
        uint64_t result = 0;
        *(void *)uint64_t v30 = *(void *)a4[1];
        return result;
      }
      if ((v10 & 0x10000) != 0)
      {
        uint64_t result = 0;
        a4[1] = (size_t)v30;
        return result;
      }
      size_t v33 = *a4;
      unint64_t v32 = (const void *)a4[1];
      uint64_t v34 = &v28[v29 + 8];
    }
    memcpy(v34, v32, v33);
  }
  return 0;
}

uint64_t mdb_xcursor_init1(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  int v3 = *(_DWORD *)(v2 + 68) & 0xA0004;
  *(_DWORD *)(v2 + 68) = v3;
  if ((*(unsigned char *)(a2 + 4) & 2) != 0)
  {
    uint64_t v8 = a2 + *(unsigned __int16 *)(a2 + 6);
    long long v9 = *(_OWORD *)(v8 + 8);
    long long v10 = *(_OWORD *)(v8 + 40);
    *(_OWORD *)(v2 + 408) = *(_OWORD *)(v8 + 24);
    *(_OWORD *)(v2 + 424) = v10;
    *(_OWORD *)(v2 + 392) = v9;
    *(void *)(v2 + 72) = 0;
    *(_DWORD *)(v2 + 64) = 0;
  }
  else
  {
    uint64_t v4 = a2 + *(unsigned __int16 *)(a2 + 6);
    *(void *)(v2 + 392) = 0x1000000000000;
    __int16 v6 = *(_WORD *)(v4 + 8);
    uint64_t v5 = (_WORD *)(v4 + 8);
    *(_OWORD *)(v2 + 400) = xmmword_10001B880;
    *(void *)(v2 + 416) = 0;
    *(void *)(v2 + 424) = ((unsigned __int16)v5[6] - 16) >> 1;
    *(_WORD *)(v2 + 432) = v6;
    *(_WORD *)(v2 + 434) = v5[1];
    *(_WORD *)(v2 + 436) = v5[2];
    *(_WORD *)(v2 + 438) = v5[3];
    *(_DWORD *)(v2 + 64) = 1;
    *(_DWORD *)(v2 + 68) = v3 | 1;
    *(void *)(v2 + 72) = v5;
    *(_WORD *)(v2 + 328) = 0;
    uint64_t v7 = *(void *)(result + 40);
    if ((*(unsigned char *)(v7 + 4) & 0x10) != 0)
    {
      *(_WORD *)(v2 + 396) = 16;
      *(_DWORD *)(v2 + 392) = (unsigned __int16)v5[4];
      if ((*(unsigned char *)(v7 + 4) & 0x20) != 0) {
        *(_WORD *)(v2 + 396) = 24;
      }
    }
  }
  *(unsigned char *)(v2 + 488) = 56;
  if (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 456) == mdb_cmp_int && *(_DWORD *)(v2 + 392) == 8) {
    *(void *)(v2 + 456) = mdb_cmp_cint;
  }
  return result;
}

__n128 mdb_xcursor_init2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (a3)
  {
    int v4 = *(_DWORD *)(v3 + 68) | 1;
    *(_DWORD *)(v3 + 64) = 1;
    *(_DWORD *)(v3 + 68) = v4;
    *(_WORD *)(v3 + 328) = 0;
    *(unsigned char *)(v3 + 488) = 56;
    *(void *)(v3 + 456) = *(void *)(a2 + 456);
  }
  else if ((*(unsigned char *)(v3 + 68) & 1) == 0)
  {
    return result;
  }
  __n128 result = *(__n128 *)(a2 + 392);
  long long v6 = *(_OWORD *)(a2 + 424);
  *(_OWORD *)(v3 + 408) = *(_OWORD *)(a2 + 408);
  *(_OWORD *)(v3 + 424) = v6;
  *(__n128 *)(v3 + 392) = result;
  *(void *)(v3 + 72) = *(void *)(a2 + 72);
  return result;
}

uint64_t mdb_cursor_del(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(*(void *)(a1 + 24) + 124);
  if ((v2 & 0x20013) != 0)
  {
    if ((v2 & 0x20000) != 0) {
      return 13;
    }
    else {
      return 4294936514;
    }
  }
  if ((*(unsigned char *)(a1 + 68) & 1) == 0) {
    return 22;
  }
  if (*(unsigned __int16 *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) >= (*(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                                - 16) >> 1)
    return 4294936498;
  if ((a2 & 0x8000) != 0 || (uint64_t result = mdb_page_spill(a1, 0, 0), !result))
  {
    uint64_t result = mdb_cursor_touch(a1);
    if (!result)
    {
      uint64_t v6 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v7 = *(void *)(a1 + 8 * v6 + 72);
      __int16 v8 = *(_WORD *)(v7 + 10);
      if ((v8 & 2) == 0) {
        return 4294936500;
      }
      if ((v8 & 0x20) != 0)
      {
LABEL_42:
        return mdb_cursor_del0(a1);
      }
      uint64_t v9 = v7 + *(unsigned __int16 *)(v7 + 2 * *(unsigned __int16 *)(a1 + 2 * v6 + 328) + 16);
      int v10 = *(unsigned __int16 *)(v9 + 4);
      if ((v10 & 4) == 0)
      {
        if (((v10 ^ a2) & 2) != 0)
        {
          uint64_t result = 4294936512;
LABEL_47:
          *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
          return result;
        }
        goto LABEL_41;
      }
      if ((a2 & 0x20) != 0)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        *(void *)(*(void *)(a1 + 40) + 32) = *(void *)(*(void *)(a1 + 40) + 32)
                                                 - *(void *)(v11 + 424)
                                                 + 1;
        *(_DWORD *)(v11 + 68) &= ~1u;
        if ((v10 & 2) == 0) {
          goto LABEL_41;
        }
        goto LABEL_38;
      }
      if ((v10 & 2) == 0) {
        *(void *)(*(void *)(a1 + 16) + 72) = v9 + *(unsigned __int16 *)(v9 + 6) + 8;
      }
      uint64_t result = mdb_cursor_del(*(void *)(a1 + 16), 0x8000);
      if (!result)
      {
        uint64_t v11 = *(void *)(a1 + 16);
        if (*(void *)(v11 + 424))
        {
          if ((*(_WORD *)(v9 + 4) & 2) != 0)
          {
            uint64_t v18 = v9 + *(unsigned __int16 *)(v9 + 6);
            long long v20 = *(_OWORD *)(v11 + 408);
            long long v19 = *(_OWORD *)(v11 + 424);
            *(_OWORD *)(v18 + 8) = *(_OWORD *)(v11 + 392);
            *(_OWORD *)(v18 + 24) = v20;
            *(_OWORD *)(v18 + 40) = v19;
          }
          else
          {
            mdb_node_shrink((char *)v7, *(unsigned __int16 *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)));
            uint64_t v12 = *(unsigned __int16 *)(a1 + 66);
            uint64_t v13 = v7 + *(unsigned __int16 *)(v7 + 2 * *(unsigned __int16 *)(a1 + 328 + 2 * v12) + 16);
            *(void *)(*(void *)(a1 + 16) + 72) = v13 + *(unsigned __int16 *)(v13 + 6) + 8;
            for (unsigned int i = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
                  i;
                  unsigned int i = (uint64_t *)*i)
            {
              if (i != (uint64_t *)a1
                && *((unsigned __int16 *)i + 32) >= *(unsigned __int16 *)(a1 + 64)
                && (*((unsigned char *)i + 68) & 1) != 0
                && i[v12 + 9] == v7)
              {
                uint64_t v15 = i[2];
                if (v15)
                {
                  if (*(unsigned char *)(v15 + 68))
                  {
                    uint64_t v16 = *((unsigned __int16 *)i + v12 + 164);
                    if (v16 < (*(unsigned __int16 *)(v7 + 12) - 16) >> 1)
                    {
                      uint64_t v17 = v7 + *(unsigned __int16 *)(v7 + 2 * v16 + 16);
                      if ((*(_WORD *)(v17 + 4) & 6) == 4) {
                        *(void *)(v15 + 72) = v17 + *(unsigned __int16 *)(v17 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
          }
          uint64_t result = 0;
          --*(void *)(*(void *)(a1 + 40) + 32);
          return result;
        }
        *(_DWORD *)(v11 + 68) &= ~1u;
        LOWORD(v10) = *(_WORD *)(v9 + 4);
        if ((v10 & 2) == 0)
        {
LABEL_41:
          if (v10)
          {
            uint64_t v21 = 0;
            uint64_t result = mdb_page_get(a1, *(void *)(v9 + *(unsigned __int16 *)(v9 + 6) + 8), (unint64_t *)&v21, 0);
            if (result) {
              goto LABEL_47;
            }
            uint64_t result = mdb_ovpage_free(a1, v21);
            if (result) {
              goto LABEL_47;
            }
          }
          goto LABEL_42;
        }
LABEL_38:
        uint64_t result = mdb_drop0(v11, 0);
        if (result) {
          goto LABEL_47;
        }
        LOWORD(v10) = *(_WORD *)(v9 + 4);
        goto LABEL_41;
      }
    }
  }
  return result;
}

char *mdb_node_shrink(char *result, int a2)
{
  int v2 = result;
  uint64_t v3 = &result[2 * a2];
  int v5 = *((unsigned __int16 *)v3 + 8);
  int v4 = (unsigned __int16 *)(v3 + 16);
  uint64_t v6 = &result[v5];
  uint64_t v7 = &v6[*((unsigned __int16 *)v6 + 3)];
  __int16 v8 = v7 + 8;
  int v9 = *((unsigned __int16 *)v7 + 10);
  unsigned __int16 v10 = *((_WORD *)v7 + 11) - v9;
  __int16 v11 = *(_WORD *)v6 - v10;
  if ((*((_WORD *)v7 + 9) & 0x20) != 0)
  {
    if (v11) {
      return result;
    }
    uint64_t v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    uint64_t v13 = (unsigned __int16)(*(_WORD *)v6 - v10);
  }
  else
  {
    uint64_t v12 = (unsigned __int16)(*((_WORD *)v7 + 11) - v9);
    if ((v9 - 16) >= 2)
    {
      unint64_t v14 = ((v9 - 16) >> 1) + 1;
      uint64_t v13 = 16;
      do
      {
        *(_WORD *)((char *)&v8[(v14 - 2) + 8] + v10) = v8[(v14 - 2) + 8] - v10;
        --v14;
      }
      while (v14 > 1);
    }
    else
    {
      uint64_t v13 = 16;
    }
  }
  v8[7] = v9;
  *(void *)__int16 v8 = *(void *)result;
  *(_WORD *)uint64_t v6 = v11;
  *((_WORD *)v6 + 1) = 0;
  uint64_t result = (char *)memmove(&result[*((unsigned __int16 *)result + 7) + v12], &result[*((unsigned __int16 *)result + 7)], (char *)v8 + v13 - &result[*((unsigned __int16 *)result + 7)]);
  unsigned int v15 = *((unsigned __int16 *)v2 + 6) - 16;
  if (v15 >= 2)
  {
    unsigned int v16 = *v4;
    unint64_t v17 = (v15 >> 1) + 1;
    do
    {
      uint64_t v18 = &v2[2 * (v17 - 2)];
      unsigned int v21 = *((unsigned __int16 *)v18 + 8);
      long long v19 = v18 + 16;
      __int16 v20 = v21;
      if (v21 <= v16) {
        _WORD *v19 = v20 + v10;
      }
      --v17;
    }
    while (v17 > 1);
  }
  *((_WORD *)v2 + 7) += v10;
  return result;
}

uint64_t mdb_drop0(uint64_t a1, int a2)
{
  LODWORD(result) = mdb_page_search(a1, 0, 4);
  if (result)
  {
    if (result == -30798) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = result;
    }
    goto LABEL_61;
  }
  uint64_t v5 = *(void *)(a1 + 24);
  uint64_t v36 = 0;
  memset(v35, 0, sizeof(v35));
  memset(v34, 0, sizeof(v34));
  int v6 = *(_DWORD *)(a1 + 68);
  if (((v6 & 4) != 0 || !a2 && !*(void *)(*(void *)(a1 + 40) + 24)) && *(_WORD *)(a1 + 64))
  {
    __int16 v7 = *(_WORD *)(a1 + 64) - 1;
    *(_WORD *)(a1 + 64) = v7;
    if (v7) {
      --*(_WORD *)(a1 + 66);
    }
    else {
      *(_DWORD *)(a1 + 68) = v6 & 0xFFFFFFFE;
    }
  }
  mdb_cursor_copy(a1, (uint64_t)v34);
  if (!*(_WORD *)(a1 + 64)) {
    goto LABEL_58;
  }
  uint64_t v31 = v5;
  unint64_t v32 = (uint64_t **)(v5 + 40);
  uint64_t v8 = a1 + 330;
  while (1)
  {
    int v9 = *(_WORD **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    unsigned int v10 = (unsigned __int16)v9[6] - 16;
    unsigned int v11 = v10 >> 1;
    if ((v9[5] & 2) != 0)
    {
      if (v10 >= 2)
      {
        uint64_t v13 = 0;
        if (v11 <= 1) {
          uint64_t v12 = 1;
        }
        else {
          uint64_t v12 = v11;
        }
        do
        {
          uint64_t v14 = (uint64_t)v9 + (unsigned __int16)v9[v13 + 8];
          __int16 v15 = *(_WORD *)(v14 + 4);
          if (v15)
          {
            unint64_t v33 = 0;
            unint64_t v16 = *(void *)(v14 + *(unsigned __int16 *)(v14 + 6) + 8);
            uint64_t result = mdb_page_get(a1, v16, &v33, 0);
            if (result
              || (v17 = v33, uint64_t result = mdb_midl_append_range(v32, v16, *(_DWORD *)(v33 + 12)), result))
            {
LABEL_55:
              uint64_t v5 = v31;
              goto LABEL_60;
            }
            uint64_t v18 = *(void *)(a1 + 40);
            uint64_t v19 = *(void *)(v18 + 24) - *(unsigned int *)(v17 + 12);
            *(void *)(v18 + 24) = v19;
            if (!a2 && !v19)
            {
              uint64_t v5 = v31;
              goto LABEL_47;
            }
          }
          else if (a2)
          {
            if ((v15 & 2) != 0)
            {
              mdb_xcursor_init1(a1, v14);
              uint64_t result = mdb_drop0(*(void *)(a1 + 16), 0);
              if (result) {
                goto LABEL_55;
              }
            }
          }
          ++v13;
        }
        while (v12 != v13);
        uint64_t v5 = v31;
        if (a2) {
          goto LABEL_42;
        }
LABEL_35:
        if (!*(void *)(*(void *)(a1 + 40) + 24)) {
          goto LABEL_47;
        }
        goto LABEL_42;
      }
      LOWORD(v12) = 0;
      if (!a2) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t result = mdb_midl_need((_DWORD **)v32, v10 >> 1);
      if (result) {
        goto LABEL_60;
      }
      if (v10 >= 2)
      {
        __int16 v20 = *v32;
        uint64_t v21 = v11 <= 1 ? 1 : v11;
        LOWORD(v12) = v21;
        int64_t v22 = v9 + 8;
        do
        {
          unsigned int v23 = *v22++;
          unint64_t v24 = *(unsigned int *)((char *)v9 + v23) | ((unint64_t)*(unsigned __int16 *)((char *)v9 + v23 + 4) << 32);
          uint64_t v25 = *v20 + 1;
          *__int16 v20 = v25;
          v20[v25] = v24;
          --v21;
        }
        while (v21);
      }
      else
      {
        LOWORD(v12) = 0;
      }
    }
LABEL_42:
    if (!*(_WORD *)(a1 + 66)) {
      goto LABEL_58;
    }
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v12;
    uint64_t result = mdb_cursor_sibling(a1, 1);
    if (result != -30798)
    {
      if (result) {
        goto LABEL_59;
      }
      int v26 = *(unsigned __int16 *)(a1 + 64);
      goto LABEL_53;
    }
LABEL_47:
    __int16 v27 = *(_WORD *)(a1 + 64);
    if (!v27) {
      goto LABEL_57;
    }
    unsigned __int16 v28 = v27 - 1;
    *(_WORD *)(a1 + 64) = v27 - 1;
    if (v27 == 1) {
      break;
    }
    --*(_WORD *)(a1 + 66);
    *(_WORD *)(a1 + 328) = 0;
    int v26 = (unsigned __int16)(v27 - 1);
    if (v28 != 1)
    {
      uint64_t v29 = 0;
      uint64_t v30 = v28 - 1;
      do
      {
        *(_WORD *)(v8 + 2 * v29) = 0;
        *(void *)(v8 + 8 * v29 - 250) = *((void *)v35 + v29);
        ++v29;
      }
      while (v30 != v29);
      int v26 = 1;
    }
LABEL_53:
    if (!v26) {
      goto LABEL_58;
    }
  }
  *(_DWORD *)(a1 + 68) &= ~1u;
LABEL_57:
  *(_WORD *)(a1 + 328) = 0;
LABEL_58:
  uint64_t result = mdb_midl_append((unint64_t **)(v5 + 40), *(void *)(*(void *)(a1 + 40) + 40));
LABEL_59:
  if (result) {
LABEL_60:
  }
    *(_DWORD *)(v5 + 124) |= 2u;
LABEL_61:
  *(_DWORD *)(a1 + 68) &= ~1u;
  return result;
}

uint64_t mdb_cursor_del0(uint64_t a1)
{
  uint64_t v2 = *(unsigned int *)(a1 + 32);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  unsigned int v4 = *(unsigned __int16 *)(a1 + 2 * v3 + 328);
  uint64_t v5 = *(void *)(a1 + 8 * v3 + 72);
  mdb_node_del((void *)a1, **(_DWORD **)(a1 + 40));
  --*(void *)(*(void *)(a1 + 40) + 32);
  for (unsigned int i = *(uint64_t **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * v2); i; unsigned int i = (uint64_t *)*i)
  {
    __int16 v7 = i;
    if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
      __int16 v7 = (uint64_t *)i[2];
    }
    if (v7 != (uint64_t *)a1)
    {
      int v8 = *((_DWORD *)v7 + 17);
      if ((*((_DWORD *)i + 17) & v8 & 1) != 0
        && *((unsigned __int16 *)v7 + 32) >= *(unsigned __int16 *)(a1 + 64))
      {
        uint64_t v9 = *(unsigned __int16 *)(a1 + 66);
        if (v7[v9 + 9] == v5)
        {
          uint64_t v10 = (uint64_t)v7 + 2 * v9;
          unsigned int v11 = *(unsigned __int16 *)(v10 + 328);
          if (v11 == v4)
          {
            *((_DWORD *)v7 + 17) = v8 | 8;
            if ((*(_WORD *)(*(void *)(a1 + 40) + 4) & 4) != 0) {
              *(_DWORD *)(v7[2] + 68) &= 0xFFFFFFFC;
            }
          }
          else
          {
            if (v11 > v4) {
              *(_WORD *)(v10 + 328) = v11 - 1;
            }
            uint64_t v12 = v7[2];
            if (v12)
            {
              if (*(unsigned char *)(v12 + 68))
              {
                uint64_t v13 = *((unsigned __int16 *)v7 + *(unsigned __int16 *)(a1 + 66) + 164);
                if (v13 < (*(unsigned __int16 *)(v5 + 12) - 16) >> 1)
                {
                  uint64_t v14 = v5 + *(unsigned __int16 *)(v5 + 2 * v13 + 16);
                  if ((*(_WORD *)(v14 + 4) & 6) == 4) {
                    *(void *)(v12 + 72) = v14 + *(unsigned __int16 *)(v14 + 6) + 8;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  uint64_t result = mdb_rebalance(a1);
  if (!result)
  {
    if (!*(_WORD *)(a1 + 64))
    {
      uint64_t result = 0;
      unint64_t v16 = (_DWORD *)(a1 + 68);
      goto LABEL_22;
    }
    uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * v2);
    if (!v18)
    {
LABEL_47:
      uint64_t result = 0;
      unint64_t v16 = (_DWORD *)(a1 + 68);
      int v17 = 8;
      goto LABEL_48;
    }
    uint64_t v19 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
    unsigned int v20 = (*(unsigned __int16 *)(v19 + 12) - 16) >> 1;
    while (1)
    {
      uint64_t v21 = v18;
      if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
        uint64_t v21 = *(void *)(v18 + 16);
      }
      int64_t v22 = (unsigned char *)(v21 + 68);
      if ((*(_DWORD *)(v18 + 68) & *(_DWORD *)(v21 + 68) & 1) == 0) {
        goto LABEL_46;
      }
      if (*(unsigned __int16 *)(v21 + 64) < *(unsigned __int16 *)(a1 + 64)) {
        goto LABEL_46;
      }
      uint64_t v23 = *(unsigned __int16 *)(a1 + 66);
      if (*(void *)(v21 + 8 * v23 + 72) != v19) {
        goto LABEL_46;
      }
      unsigned int v24 = *(unsigned __int16 *)(v21 + 2 * v23 + 328);
      if (v24 < *(unsigned __int16 *)(a1 + 2 * v23 + 328)) {
        goto LABEL_46;
      }
      if (v20 <= v24)
      {
        uint64_t result = mdb_cursor_sibling(v21, 1);
        if (result == -30798)
        {
          int v28 = 2;
          goto LABEL_45;
        }
        if (result) {
          break;
        }
      }
      uint64_t v25 = *(void *)(v21 + 16);
      if (!v25 || (*v22 & 2) != 0) {
        goto LABEL_46;
      }
      uint64_t v26 = *(void *)(v21 + 8 * *(unsigned __int16 *)(v21 + 66) + 72)
          + *(unsigned __int16 *)(*(void *)(v21 + 8 * *(unsigned __int16 *)(v21 + 66) + 72)
                                + 2 * *(unsigned __int16 *)(v21 + 2 * *(unsigned __int16 *)(v21 + 66) + 328)
                                + 16);
      __int16 v27 = *(_WORD *)(v26 + 4);
      if ((v27 & 4) != 0)
      {
        if (*(unsigned char *)(v25 + 68))
        {
          if ((v27 & 2) == 0) {
            *(void *)(v25 + 72) = v26 + *(unsigned __int16 *)(v26 + 6) + 8;
          }
        }
        else
        {
          mdb_xcursor_init1(v21, v26);
          uint64_t result = mdb_cursor_first(*(void *)(v21 + 16), 0, 0);
          if (result) {
            break;
          }
        }
      }
      int64_t v22 = (unsigned char *)(*(void *)(v21 + 16) + 68);
      int v28 = 8;
LABEL_45:
      *(_DWORD *)v22 |= v28;
LABEL_46:
      uint64_t v18 = *(void *)v18;
      if (!v18) {
        goto LABEL_47;
      }
    }
  }
  unint64_t v16 = (_DWORD *)(*(void *)(a1 + 24) + 124);
LABEL_22:
  int v17 = 2;
LABEL_48:
  *v16 |= v17;
  return result;
}

uint64_t mdb_cursor_open(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t result = 22;
  if (a1 && a3 && *(_DWORD *)(a1 + 120) > a2 && (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 8) != 0)
  {
    int v7 = *(_DWORD *)(a1 + 124);
    if ((v7 & 0x13) != 0)
    {
      return 4294936514;
    }
    else if (v7 & 0x20000 | a2)
    {
      if ((*(_WORD *)(*(void *)(a1 + 88) + 48 * a2 + 4) & 4) != 0) {
        size_t v8 = 888;
      }
      else {
        size_t v8 = 392;
      }
      uint64_t v9 = malloc_type_malloc(v8, 0xBC8215E7uLL);
      if (v9)
      {
        uint64_t v10 = v9;
        mdb_cursor_init((uint64_t)v9, a1, a2, (uint64_t)(v9 + 98));
        uint64_t v11 = *(void *)(a1 + 104);
        if (v11)
        {
          *(void *)uint64_t v10 = *(void *)(v11 + 8 * a2);
          *(void *)(v11 + 8 * a2) = v10;
          v10[17] |= 0x40u;
        }
        uint64_t result = 0;
        *a3 = v10;
      }
      else
      {
        return 12;
      }
    }
  }
  return result;
}

uint64_t mdb_cursor_renew(uint64_t a1, uint64_t a2)
{
  uint64_t result = 22;
  if (a1 && a2)
  {
    uint64_t v4 = *(unsigned int *)(a2 + 32);
    if (v4 >= *(_DWORD *)(a1 + 120)
      || (*(unsigned char *)(*(void *)(a1 + 112) + v4) & 8) == 0
      || (*(unsigned char *)(a2 + 68) & 0x40) != 0
      || *(void *)(a1 + 104))
    {
      return 22;
    }
    else if ((*(unsigned char *)(a1 + 124) & 0x13) != 0)
    {
      return 4294936514;
    }
    else
    {
      mdb_cursor_init(a2, a1, v4, *(void *)(a2 + 16));
      return 0;
    }
  }
  return result;
}

uint64_t mdb_cursor_count(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = 22;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a1 + 16);
    if (!v3) {
      return 4294936512;
    }
    if ((*(unsigned char *)(*(void *)(a1 + 24) + 124) & 0x13) != 0) {
      return 4294936514;
    }
    int v4 = *(_DWORD *)(a1 + 68);
    if ((v4 & 1) == 0) {
      return 22;
    }
    if (*(_WORD *)(a1 + 64))
    {
      uint64_t v5 = *(unsigned __int16 *)(a1 + 66);
      if ((v4 & 2) == 0)
      {
        uint64_t v6 = *(void *)(a1 + 8 * v5 + 72);
        unsigned int v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
        goto LABEL_14;
      }
      unsigned int v7 = *(unsigned __int16 *)(a1 + 2 * v5 + 328);
      uint64_t v6 = *(void *)(a1 + 8 * v5 + 72);
      if (v7 < (*(unsigned __int16 *)(v6 + 12) - 16) >> 1)
      {
        *(_DWORD *)(a1 + 68) = v4 ^ 2;
LABEL_14:
        if ((*(_WORD *)(v6 + *(unsigned __int16 *)(v6 + 2 * v7 + 16) + 4) & 4) != 0)
        {
          if ((*(unsigned char *)(v3 + 68) & 1) == 0) {
            return 22;
          }
          uint64_t v8 = *(void *)(v3 + 424);
        }
        else
        {
          uint64_t v8 = 1;
        }
        uint64_t v2 = 0;
        *a2 = v8;
        return v2;
      }
    }
    return 4294936498;
  }
  return v2;
}

void mdb_cursor_close(void *a1)
{
  if (a1 && !*((void *)a1 + 1))
  {
    if ((*((unsigned char *)a1 + 68) & 0x40) != 0)
    {
      uint64_t v1 = *(void *)(*((void *)a1 + 3) + 104);
      if (v1)
      {
        uint64_t v2 = (void *)(v1 + 8 * *((unsigned int *)a1 + 8));
        do
        {
          uint64_t v3 = v2;
          uint64_t v2 = (void *)*v2;
          if (v2) {
            BOOL v4 = v2 == a1;
          }
          else {
            BOOL v4 = 1;
          }
        }
        while (!v4);
        if (v2 == a1) {
          void *v3 = *(void *)a1;
        }
      }
    }
    free(a1);
  }
}

uint64_t mdb_cursor_dbi(uint64_t a1)
{
  return *(unsigned int *)(a1 + 32);
}

uint64_t mdb_del(uint64_t a1, unsigned int a2, void *a3, long long *a4)
{
  uint64_t v4 = 22;
  if (!a1 || !a3) {
    return v4;
  }
  if (*(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  int v6 = *(_DWORD *)(a1 + 124);
  if ((v6 & 0x20013) != 0)
  {
    if ((v6 & 0x20000) != 0) {
      return 13;
    }
    else {
      return 4294936514;
    }
  }
  if ((*(_WORD *)(*(void *)(a1 + 88) + 48 * a2 + 4) & 4) == 0) {
    a4 = 0;
  }
  return mdb_del0(a1, a2, a3, a4, 0);
}

uint64_t mdb_del0(uint64_t a1, unsigned int a2, void *a3, long long *a4, int a5)
{
  memset(v17, 0, 392);
  memset(v16, 0, sizeof(v16));
  long long v15 = 0uLL;
  int v14 = 0;
  mdb_cursor_init((uint64_t)v17, a1, a2, (uint64_t)v16);
  if (a4)
  {
    long long v15 = *a4;
    uint64_t v10 = &v15;
    int v11 = 2;
  }
  else
  {
    uint64_t v10 = 0;
    a5 |= 0x20u;
    int v11 = 15;
  }
  uint64_t result = mdb_cursor_set((uint64_t)v17, a3, v10, v11, &v14);
  if (!result)
  {
    uint64_t v13 = *(void *)(a1 + 104);
    v17[0] = *(void *)(v13 + 8 * a2);
    *(void *)(v13 + 8 * a2) = v17;
    uint64_t result = mdb_cursor_del((uint64_t)v17, a5);
    *(void *)(*(void *)(a1 + 104) + 8 * a2) = v17[0];
  }
  return result;
}

uint64_t mdb_put(uint64_t a1, unsigned int a2, size_t *a3, uint64_t a4, int a5)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a3)
    {
      if (a4)
      {
        if (*(_DWORD *)(a1 + 120) > a2)
        {
          uint64_t v15 = 0;
          memset(v14, 0, sizeof(v14));
          memset(v13, 0, sizeof(v13));
          if ((a5 & 0xFFF8FFCF) == 0 && (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
          {
            int v10 = *(_DWORD *)(a1 + 124);
            if ((v10 & 0x20013) != 0)
            {
              if ((v10 & 0x20000) != 0) {
                return 13;
              }
              else {
                return 4294936514;
              }
            }
            else
            {
              uint64_t v11 = a2;
              mdb_cursor_init((uint64_t)v14, a1, a2, (uint64_t)v13);
              uint64_t v12 = *(void *)(a1 + 104);
              *(void *)&v14[0] = *(void *)(v12 + 8 * v11);
              *(void *)(v12 + 8 * v11) = v14;
              uint64_t result = mdb_cursor_put((uint64_t)v14, a3, a4, a5);
              *(void *)(*(void *)(a1 + 104) + 8 * v11) = *(void *)&v14[0];
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t mdb_dbi_open(uint64_t a1, char *__s, int a3, unsigned int *a4)
{
  if ((a3 & 0xFFFBFF81) != 0) {
    return 22;
  }
  if ((*(unsigned char *)(a1 + 124) & 0x13) != 0) {
    return 4294936514;
  }
  uint64_t v68 = 0;
  memset(v67, 0, sizeof(v67));
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  if (!__s)
  {
    *a4 = 1;
    if ((a3 & 0x7FFF) != 0)
    {
      uint64_t v17 = *(void *)(a1 + 88);
      int v18 = *(unsigned __int16 *)(v17 + 52);
      int v19 = a3 & 0x7FFF | v18;
      if (v19 != v18)
      {
        *(_WORD *)(v17 + 52) = v19;
        *(_DWORD *)(a1 + 124) |= 4u;
      }
    }
    mdb_default_cmp(a1, 1u);
    return 0;
  }
  if (!*(void *)(*(void *)(a1 + 80) + 64)) {
    mdb_default_cmp(a1, 1u);
  }
  uint64_t v69 = 0;
  unint64_t v70 = 0;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  size_t v10 = strlen(__s);
  uint64_t v11 = *(unsigned int *)(a1 + 120);
  if (v11 < 3) {
    goto LABEL_20;
  }
  unsigned int v12 = 0;
  uint64_t v13 = (const char **)(*(void *)(a1 + 80) + 104);
  for (uint64_t i = 2; i != v11; ++i)
  {
    uint64_t v15 = (uint64_t)*(v13 - 1);
    if (v15)
    {
      if (v10 == v15 && !strncmp(__s, *v13, v10))
      {
        uint64_t v4 = 0;
        *a4 = i;
        return v4;
      }
    }
    else if (!v12)
    {
      unsigned int v12 = i;
    }
    v13 += 6;
  }
  if (v12)
  {
    int v16 = 0;
  }
  else
  {
LABEL_20:
    if (v11 >= *(_DWORD *)(*(void *)(a1 + 32) + 36)) {
      return 4294936505;
    }
    unsigned int v12 = 0;
    int v16 = 1;
  }
  if ((*(_WORD *)(*(void *)(a1 + 88) + 52) & 0xC) == 0)
  {
    int v59 = 0;
    v71[0] = v10;
    v71[1] = (size_t)__s;
    mdb_cursor_init((uint64_t)&v63, a1, 1u, 0);
    uint64_t v20 = mdb_cursor_set((uint64_t)&v63, v71, &v69, 15, &v59);
    if (v20 == -30798)
    {
      if ((a3 & 0x40000) == 0) {
        return 4294936498;
      }
      if ((*(unsigned char *)(a1 + 126) & 2) != 0) {
        return 13;
      }
      uint64_t v29 = strdup(__s);
      if (v29)
      {
        int64_t v22 = v29;
        uint64_t v69 = 48;
        unint64_t v70 = &v60;
        long long v60 = 0u;
        long long v61 = 0u;
        *(void *)&long long v62 = 0;
        *((void *)&v62 + 1) = -1;
        WORD2(v60) = a3 & 0x7FFF;
        uint64_t v58 = 0;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        uint64_t v30 = *(void *)(*((void *)&v64 + 1) + 104);
        uint64_t v31 = v65;
        unint64_t v32 = &v63;
        if ((BYTE4(v67[0]) & 4) != 0)
        {
          DWORD1(v38) = 1;
          *(void *)&long long v35 = &v63;
          unint64_t v32 = &v34;
        }
        *(void *)unint64_t v32 = *(void *)(v30 + 8 * v65);
        *(void *)(v30 + 8 * v31) = v32;
        uint64_t v33 = mdb_cursor_put((uint64_t)&v63, v71, (uint64_t)&v69, 2);
        *(void *)(v30 + 8 * v31) = *(void *)v32;
        if (v33)
        {
          uint64_t v4 = v33;
          free(v22);
          return v4;
        }
        char v23 = 29;
        if (!v16)
        {
LABEL_38:
          unsigned int v24 = (size_t *)(*(void *)(a1 + 80) + 48 * v12);
          *unsigned int v24 = v10;
          v24[1] = (size_t)v22;
          v24[4] = 0;
          *(unsigned char *)(*(void *)(a1 + 112) + v12) = v23;
          uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 152);
          LODWORD(v24) = *(_DWORD *)(v25 + 4 * v12) + 1;
          *(_DWORD *)(v25 + 4 * v12) = v24;
          *(_DWORD *)(*(void *)(a1 + 96) + 4 * v12) = v24;
          uint64_t v26 = (_OWORD *)(*(void *)(a1 + 88) + 48 * v12);
          long long v27 = *v70;
          long long v28 = v70[2];
          v26[1] = v70[1];
          v26[2] = v28;
          *uint64_t v26 = v27;
          *a4 = v12;
          mdb_default_cmp(a1, v12);
          if (v16)
          {
            uint64_t v4 = 0;
            ++*(_DWORD *)(a1 + 120);
            return v4;
          }
          return 0;
        }
LABEL_37:
        unsigned int v12 = *(_DWORD *)(a1 + 120);
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v4 = v20;
      if (v20) {
        return v4;
      }
      if ((*(_WORD *)(*((void *)v67 + WORD1(v67[0]) + 1)
                     + *(unsigned __int16 *)(*((void *)v67 + WORD1(v67[0]) + 1)
                                           + 2 * *((unsigned __int16 *)&v67[16] + WORD1(v67[0]) + 4)
                                           + 16)
                     + 4) & 6) != 2)
        return 4294936512;
      uint64_t v21 = strdup(__s);
      if (v21)
      {
        int64_t v22 = v21;
        char v23 = 28;
        if (!v16) {
          goto LABEL_38;
        }
        goto LABEL_37;
      }
    }
    return 12;
  }
  if ((a3 & 0x40000) != 0) {
    return 4294936512;
  }
  else {
    return 4294936498;
  }
}

uint64_t mdb_default_cmp(uint64_t result, unsigned int a2)
{
  __int16 v2 = *(_WORD *)(*(void *)(result + 88) + 48 * a2 + 4);
  uint64_t v3 = mdb_cmp_cint;
  if ((v2 & 8) == 0) {
    uint64_t v3 = mdb_cmp_memn;
  }
  if ((v2 & 2) != 0) {
    uint64_t v3 = mdb_cmp_memnr;
  }
  uint64_t v4 = *(void *)(result + 80);
  *(void *)(v4 + 48 * a2 + 16) = v3;
  if ((v2 & 4) != 0)
  {
    if ((v2 & 0x20) != 0)
    {
      BOOL v6 = (v2 & 0x10) == 0;
      uint64_t v5 = mdb_cmp_int;
      unsigned int v7 = mdb_cmp_cint;
    }
    else
    {
      BOOL v6 = (v2 & 0x40) == 0;
      uint64_t v5 = mdb_cmp_memnr;
      unsigned int v7 = mdb_cmp_memn;
    }
    if (v6) {
      uint64_t v5 = v7;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  *(void *)(v4 + 48 * a2 + 24) = v5;
  return result;
}

void mdb_dbi_close(uint64_t a1, unsigned int a2)
{
  if (a2 >= 2 && *(_DWORD *)(a1 + 36) > a2)
  {
    uint64_t v2 = *(void *)(a1 + 136);
    uint64_t v3 = *(void **)(v2 + 48 * a2 + 8);
    if (v3)
    {
      uint64_t v4 = (void *)(v2 + 48 * a2);
      *uint64_t v4 = 0;
      v4[1] = 0;
      uint64_t v5 = *(void *)(a1 + 152);
      *(_WORD *)(*(void *)(a1 + 144) + 2 * a2) = 0;
      ++*(_DWORD *)(v5 + 4 * a2);
      free(v3);
    }
  }
}

uint64_t mdb_dbi_flags(uint64_t a1, unsigned int a2, int *a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *a3 = *(_WORD *)(*(void *)(a1 + 88) + 48 * a2 + 4) & 0x7FFF;
  return result;
}

uint64_t mdb_drop(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3 = 22;
  if (a1)
  {
    if (a3 <= 1 && *(_DWORD *)(a1 + 120) > a2)
    {
      unsigned int v12 = 0;
      if ((*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) != 0)
      {
        if ((*(unsigned char *)(a1 + 126) & 2) != 0)
        {
          return 13;
        }
        else if (*(_DWORD *)(*(void *)(a1 + 96) + 4 * a2) == *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 152) {
                                                                            + 4 * a2))
        }
        {
          uint64_t v3 = mdb_cursor_open(a1, a2, &v12);
          if (!v3)
          {
            uint64_t v7 = mdb_drop0((uint64_t)v12, *(_WORD *)(v12[5] + 4) & 4);
            uint64_t v3 = v7;
            for (uint64_t i = *(uint64_t **)(*(void *)(a1 + 104) + 8 * a2); i; uint64_t i = (uint64_t *)*i)
              *((_DWORD *)i + 17) &= 0xFFFFFFFC;
            if (v7) {
              goto LABEL_20;
            }
            if (a2 >= 2 && a3)
            {
              uint64_t v3 = mdb_del0(a1, 1u, (void *)v12[6], 0, 2);
              if (!v3)
              {
                *(unsigned char *)(*(void *)(a1 + 112) + a2) = 2;
                mdb_dbi_close(*(void *)(a1 + 32), a2);
                goto LABEL_20;
              }
              int v9 = *(_DWORD *)(a1 + 124) | 2;
            }
            else
            {
              uint64_t v3 = 0;
              *(unsigned char *)(*(void *)(a1 + 112) + a2) |= 1u;
              uint64_t v10 = *(void *)(a1 + 88) + 48 * a2;
              *(_WORD *)(v10 + 38) = 0;
              *(_OWORD *)(v10 + 22) = 0u;
              *(_OWORD *)(v10 + 6) = 0u;
              *(void *)(v10 + 40) = -1;
              int v9 = *(_DWORD *)(a1 + 124) | 4;
            }
            *(_DWORD *)(a1 + 124) = v9;
LABEL_20:
            mdb_cursor_close(v12);
          }
        }
        else
        {
          return 4294936516;
        }
      }
    }
  }
  return v3;
}

uint64_t mdb_set_compare(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 16) = a3;
  return result;
}

uint64_t mdb_set_dupsort(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 24) = a3;
  return result;
}

uint64_t mdb_set_relfunc(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 32) = a3;
  return result;
}

uint64_t mdb_set_relctx(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a1 || *(_DWORD *)(a1 + 120) <= a2 || (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 0x10) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(*(void *)(a1 + 80) + 48 * a2 + 40) = a3;
  return result;
}

uint64_t mdb_reader_pid(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = a3;
  uint64_t v10 = a3;
  long long v11 = xmmword_10001B8A0;
  WORD6(v11) = 3;
  for (int i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10); i; int i = fcntl(*(_DWORD *)(a1 + 4), a2, &v10))
  {
    uint64_t result = *__error();
    if (result != 4) {
      return result;
    }
    uint64_t v10 = v5;
    long long v11 = xmmword_10001B8A0;
    WORD6(v11) = 3;
  }
  int v9 = a2 == 7 && WORD6(v11) != 2;
  return (v9 << 31 >> 31);
}

void mdb_dpage_free(uint64_t a1, void *a2)
{
  if ((*((_WORD *)a2 + 5) & 4) != 0 && *((_DWORD *)a2 + 3) != 1)
  {
    free(a2);
  }
  else
  {
    *a2 = *(void *)(a1 + 192);
    *(void *)(a1 + 192) = a2;
  }
}

uint64_t mdb_page_search(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = *(void *)(a1 + 24);
  if ((*(unsigned char *)(v4 + 124) & 0x13) != 0) {
    return 4294936514;
  }
  if ((**(unsigned char **)(a1 + 56) & 2) == 0) {
    goto LABEL_5;
  }
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  if (*(_DWORD *)(*(void *)(v4 + 96) + 4 * *(unsigned int *)(a1 + 32)) != *(_DWORD *)(*(void *)(*(void *)(v4 + 32) + 152)
                                                                                         + 4
                                                                                         * *(unsigned int *)(a1 + 32)))
    return 4294936516;
  mdb_cursor_init(v17, v4, 1, 0);
  uint64_t result = mdb_page_search(v17, *(void *)(a1 + 48), 0);
  if (!result)
  {
    uint64_t v15 = 0;
    int v16 = 0;
    int v14 = 0;
    uint64_t v10 = mdb_node_search((uint64_t)v17, *(void **)(a1 + 48), &v14);
    if (!v14) {
      return 4294936498;
    }
    if ((*((_WORD *)v10 + 2) & 6) != 2) {
      return 4294936512;
    }
    uint64_t result = mdb_node_read((uint64_t)v17, (unsigned int *)v10, &v15);
    if (result) {
      return result;
    }
    uint64_t v11 = *(void *)(a1 + 40);
    if ((*(_WORD *)(v11 + 4) & 0x7FFF) != *((_WORD *)v16 + 2)) {
      return 4294936512;
    }
    long long v12 = *v16;
    long long v13 = v16[2];
    *(_OWORD *)(v11 + 16) = v16[1];
    *(_OWORD *)(v11 + 32) = v13;
    *(_OWORD *)uint64_t v11 = v12;
    **(unsigned char **)(a1 + 56) &= ~2u;
LABEL_5:
    unint64_t v8 = *(void *)(*(void *)(a1 + 40) + 40);
    if (v8 != -1)
    {
      int v9 = *(void **)(a1 + 72);
      if (v9 && *v9 == v8 || (uint64_t result = mdb_page_get(a1, v8, (unint64_t *)(a1 + 72), 0), !result))
      {
        *(_DWORD *)(a1 + 64) = 1;
        if ((a3 & 1) == 0 || (uint64_t result = mdb_page_touch(a1), !result))
        {
          if ((a3 & 2) != 0) {
            return 0;
          }
          else {
            return mdb_page_search_root(a1, a2, a3);
          }
        }
      }
      return result;
    }
    return 4294936498;
  }
  return result;
}

char *mdb_node_search(uint64_t a1, void *a2, int *a3)
{
  uint64_t v5 = *(unsigned __int16 **)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  unsigned int v6 = v5[6] - 16;
  unsigned int v7 = v6 >> 1;
  unsigned int v8 = v5[5];
  unsigned int v9 = ((v8 >> 1) & 1) == 0;
  int v10 = (v6 >> 1) - 1;
  uint64_t v11 = *(uint64_t (**)(void *, uint64_t))(*(void *)(a1 + 48) + 16);
  if (v11 == mdb_cmp_cint)
  {
    if (v8)
    {
      if (*(unsigned __int16 *)((char *)v5 + v5[9] + 6) == 8) {
        uint64_t v11 = (uint64_t (*)(void *, uint64_t))mdb_cmp_long;
      }
      else {
        uint64_t v11 = (uint64_t (*)(void *, uint64_t))mdb_cmp_int;
      }
      if ((v8 & 0x20) == 0) {
        goto LABEL_3;
      }
    }
    else
    {
      uint64_t v11 = mdb_cmp_cint;
      if ((v8 & 0x20) == 0) {
        goto LABEL_3;
      }
    }
  }
  else if ((v8 & 0x20) == 0)
  {
LABEL_3:
    if (v9 < v7)
    {
      int v19 = v5[6] - 16;
      long long v12 = a3;
      while (1)
      {
        LODWORD(v13) = (int)(v10 + v9) >> 1;
        int v14 = (char *)v5 + v5[v13 + 8];
        uint64_t v20 = *((unsigned __int16 *)v14 + 3);
        uint64_t v21 = (uint64_t)(v14 + 8);
        int v15 = v11(a2, (uint64_t)&v20);
        if (!v15) {
          break;
        }
        if (v15 <= 0) {
          int v10 = v13 - 1;
        }
        else {
          unsigned int v9 = v13 + 1;
        }
        if ((int)v9 > v10)
        {
          a3 = v12;
          goto LABEL_27;
        }
      }
      int v16 = 1;
      a3 = v12;
LABEL_43:
      unsigned int v6 = v19;
      if (!a3) {
        goto LABEL_36;
      }
LABEL_33:
      if (v6 <= 1) {
        int v16 = 0;
      }
      *a3 = v16;
      goto LABEL_36;
    }
    LODWORD(v13) = 0;
    int v14 = 0;
LABEL_32:
    int v16 = 1;
    if (!a3) {
      goto LABEL_36;
    }
    goto LABEL_33;
  }
  uint64_t v20 = **(unsigned int **)(a1 + 40);
  int v14 = (char *)v5 + v5[8];
  if (v9 >= v7)
  {
    LODWORD(v13) = 0;
    goto LABEL_32;
  }
  int v19 = v6;
  uint64_t v18 = a3;
  do
  {
    uint64_t v13 = ((int)(v10 + v9) >> 1);
    uint64_t v21 = (uint64_t)v5 + v20 * v13 + 16;
    int v15 = v11(a2, (uint64_t)&v20);
    if (!v15)
    {
      int v16 = 1;
      a3 = v18;
      goto LABEL_43;
    }
    if (v15 <= 0) {
      int v10 = v13 - 1;
    }
    else {
      unsigned int v9 = v13 + 1;
    }
  }
  while ((int)v9 <= v10);
  a3 = v18;
LABEL_27:
  unsigned int v6 = v19;
  if (v15 < 1 || (LODWORD(v13) = v13 + 1, (v5[5] & 0x20) != 0))
  {
    int v16 = 0;
    if (a3) {
      goto LABEL_33;
    }
  }
  else
  {
    int v16 = 0;
    int v14 = (char *)v5 + v5[v13 + 8];
    if (a3) {
      goto LABEL_33;
    }
  }
LABEL_36:
  *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v13;
  if (v13 >= v7) {
    return 0;
  }
  else {
    return v14;
  }
}

uint64_t mdb_page_touch(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  long long __dst = 0;
  uint64_t v3 = *(void *)(a1 + 24);
  __int16 v4 = *(_WORD *)(v2 + 10);
  if ((v4 & 0x10) == 0)
  {
    if ((*(unsigned char *)(v3 + 124) & 8) != 0)
    {
      uint64_t result = mdb_page_unspill(*(void *)(a1 + 24), v2, (char **)&__dst);
      if (result) {
        goto LABEL_15;
      }
      unsigned int v7 = (char *)__dst;
      if (__dst)
      {
LABEL_20:
        uint64_t v17 = *(unsigned __int16 *)(a1 + 66);
        *(void *)(a1 + 8 * v17 + 72) = v7;
        uint64_t v18 = *(uint64_t **)(*(void *)(v3 + 104) + 8 * *(unsigned int *)(a1 + 32));
        if ((*(unsigned char *)(a1 + 68) & 4) != 0)
        {
          if (v18)
          {
            unsigned int v26 = *(unsigned __int16 *)(a1 + 64);
            do
            {
              uint64_t v27 = v18[2];
              if (*(unsigned __int16 *)(v27 + 64) >= v26)
              {
                uint64_t v28 = v27 + 8 * v17;
                uint64_t v30 = *(void *)(v28 + 72);
                uint64_t v29 = (char **)(v28 + 72);
                if (v30 == v2) {
                  *uint64_t v29 = v7;
                }
              }
              uint64_t v18 = (uint64_t *)*v18;
            }
            while (v18);
          }
        }
        else if (v18)
        {
          unsigned int v19 = *(unsigned __int16 *)(a1 + 64);
          do
          {
            if (v18 != (uint64_t *)a1 && *((unsigned __int16 *)v18 + 32) >= v19)
            {
              uint64_t v20 = &v18[v17];
              uint64_t v22 = v20[9];
              uint64_t v21 = (char **)(v20 + 9);
              if (v22 == v2)
              {
                *uint64_t v21 = v7;
                if ((*((_WORD *)v7 + 5) & 2) != 0)
                {
                  uint64_t v23 = v18[2];
                  if (v23)
                  {
                    if (*(unsigned char *)(v23 + 68))
                    {
                      uint64_t v24 = *((unsigned __int16 *)v18 + v17 + 164);
                      if (v24 < (*((unsigned __int16 *)v7 + 6) - 16) >> 1)
                      {
                        uint64_t v25 = &v7[*(unsigned __int16 *)&v7[2 * v24 + 16]];
                        if ((*((_WORD *)v25 + 2) & 6) == 4) {
                          *(void *)(v23 + 72) = &v25[*((unsigned __int16 *)v25 + 3) + 8];
                        }
                      }
                    }
                  }
                }
              }
            }
            uint64_t v18 = (uint64_t *)*v18;
          }
          while (v18);
        }
        return 0;
      }
    }
    uint64_t v5 = (uint64_t **)(v3 + 40);
    uint64_t result = mdb_midl_need((_DWORD **)(v3 + 40), 1);
    if (!result)
    {
      uint64_t result = mdb_page_alloc(a1, 1, (char **)&__dst);
      if (!result)
      {
        unsigned int v7 = (char *)__dst;
        unint64_t v8 = *(void *)__dst;
        unsigned int v9 = *v5;
        uint64_t v10 = **v5 + 1;
        uint64_t *v9 = v10;
        v9[v10] = *(void *)v2;
        if (*(_WORD *)(a1 + 66))
        {
          unsigned int v11 = *(unsigned __int16 *)(a1 + 66) - 1;
          uint64_t v12 = *(void *)(a1 + 8 * v11 + 72);
          uint64_t v13 = v12 + *(unsigned __int16 *)(v12 + 2 * *(unsigned __int16 *)(a1 + 2 * v11 + 328) + 16);
          *(_DWORD *)uint64_t v13 = v8;
          *(_WORD *)(v13 + 4) = WORD2(v8);
        }
        else
        {
          *(void *)(*(void *)(a1 + 40) + 40) = v8;
        }
        goto LABEL_18;
      }
    }
LABEL_15:
    *(_DWORD *)(v3 + 124) |= 2u;
    return result;
  }
  uint64_t result = 0;
  if ((v4 & 0x40) == 0 && *(void *)v3)
  {
    int v14 = *(unsigned int **)(v3 + 72);
    unint64_t v8 = *(void *)v2;
    if (*(void *)v14)
    {
      unsigned int v15 = mdb_mid2l_search(*(unsigned int **)(v3 + 72), *(void *)v2);
      if (*(void *)v14 >= (unint64_t)v15 && *(void *)&v14[4 * v15] == v8)
      {
        if (v2 != *(void *)&v14[4 * v15 + 2])
        {
          *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
          *(_DWORD *)(v3 + 124) |= 2u;
          return 4294936517;
        }
        return 0;
      }
    }
    int v16 = mdb_page_malloc(v3, 1u);
    if (v16)
    {
      unsigned int v7 = v16;
      v31[0] = v8;
      v31[1] = (unint64_t)v16;
      mdb_mid2l_insert(v14, v31);
LABEL_18:
      mdb_page_copy(v7, (_WORD *)v2, *(_DWORD *)(*(void *)(v3 + 32) + 16));
      *(void *)unsigned int v7 = v8;
      *((_WORD *)v7 + 5) |= 0x10u;
      goto LABEL_20;
    }
    return 12;
  }
  return result;
}

uint64_t mdb_page_search_root(uint64_t a1, void *a2, char a3)
{
  unint64_t v4 = *(unsigned __int16 *)(a1 + 66);
  unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
  unint64_t v14 = v5;
  __int16 v6 = *(_WORD *)(v5 + 10);
  if (v6)
  {
    int v9 = a3 & 0xC;
    do
    {
      if (v9)
      {
        if ((a3 & 8) != 0)
        {
          unsigned int v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
          if ((*(unsigned char *)(a1 + 68) & 1) != 0
            && *(unsigned __int16 *)(a1 + 2 * (unsigned __int16)v4 + 328) == (unsigned __int16)v10)
          {
            unint64_t v4 = *(unsigned __int16 *)(a1 + 64);
            *(_WORD *)(a1 + 64) = v4 + 1;
            *(_WORD *)(a1 + 66) = v4;
            unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
            unint64_t v14 = v5;
            if (a3) {
              goto LABEL_16;
            }
            goto LABEL_18;
          }
        }
        else
        {
          LOWORD(v10) = 0;
        }
      }
      else
      {
        int v13 = 0;
        if (mdb_node_search(a1, a2, &v13)) {
          LOWORD(v10) = *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) - (v13 == 0);
        }
        else {
          unsigned int v10 = ((*(unsigned __int16 *)(v5 + 12) + 131056) >> 1) - 1;
        }
      }
      unsigned int v11 = (unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 2 * (unsigned __int16)v10 + 16));
      uint64_t result = mdb_page_get(a1, *v11 | ((unint64_t)*((unsigned __int16 *)v11 + 2) << 32), &v14, 0);
      if (result) {
        return result;
      }
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v10;
      unint64_t v4 = *(unsigned __int16 *)(a1 + 64);
      if (v4 > 0x1F)
      {
        *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
        return 4294936509;
      }
      unint64_t v5 = v14;
      *(_WORD *)(a1 + 64) = v4 + 1;
      *(_WORD *)(a1 + 66) = v4;
      *(void *)(a1 + 8 * v4 + 72) = v5;
      *(_WORD *)(a1 + 2 * v4 + 328) = 0;
      if (a3)
      {
LABEL_16:
        uint64_t result = mdb_page_touch(a1);
        if (result) {
          return result;
        }
        unint64_t v4 = *(unsigned __int16 *)(a1 + 66);
        unint64_t v5 = *(void *)(a1 + 8 * v4 + 72);
        unint64_t v14 = v5;
      }
LABEL_18:
      __int16 v6 = *(_WORD *)(v5 + 10);
    }
    while ((v6 & 1) != 0);
  }
  if ((v6 & 2) != 0)
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 68) = *(_DWORD *)(a1 + 68) & 0xFFFFFFFC | 1;
  }
  else
  {
    *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
    return 4294936500;
  }
  return result;
}

void *mdb_page_copy(char *__dst, _WORD *__src, int a3)
{
  unint64_t v4 = __src;
  unint64_t v5 = __dst;
  unsigned __int16 v6 = __src[7];
  int v7 = (unsigned __int16)__src[6];
  if (((v6 - (_WORD)v7) & 0xFFF8) == 0 || (__src[5] & 0x20) != 0)
  {
    size_t v9 = a3 - ((v6 - (_WORD)v7) & 0xFFF8u);
  }
  else
  {
    uint64_t v8 = v6 & 0xFFF8;
    memcpy(__dst, __src, (v7 + 7) & 0x1FFF8);
    long long __dst = &v5[v8];
    __src = (_WORD *)((char *)v4 + v8);
    size_t v9 = (a3 - v8);
  }

  return memcpy(__dst, __src, v9);
}

uint64_t mdb_env_reader_dest(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 8);
  uint64_t result = getpid();
  if (v2 == result) {
    *(_DWORD *)(a1 + 8) = 0;
  }
  return result;
}

uint64_t mdb_pages_xkeep(uint64_t a1, int a2, int a3)
{
  uint64_t v5 = *(void *)(a1 + 24);
  unint64_t v27 = 0;
  int v26 = 0;
  unsigned int v6 = *(_DWORD *)(v5 + 120);
  uint64_t v7 = a1;
  unsigned int v8 = v6;
  do
  {
LABEL_2:
    if (*(unsigned char *)(v7 + 68))
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *(unsigned __int16 *)(v12 + 64);
        if (*(_WORD *)(v12 + 64))
        {
          uint64_t v14 = 0;
          do
          {
            uint64_t v15 = *(void *)(v12 + 72 + 8 * v14);
            __int16 v16 = *(_WORD *)(v15 + 10);
            if ((v16 & 0xC050) == a2) {
              *(_WORD *)(v15 + 10) = v16 ^ 0x8000;
            }
            ++v14;
          }
          while (v13 != v14);
          unsigned int v17 = v14 - 1;
        }
        else
        {
          uint64_t v15 = 0;
          unsigned int v17 = -1;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        if (!v18) {
          break;
        }
        if (!v15) {
          break;
        }
        if ((*(_DWORD *)(v18 + 68) & 1) == 0) {
          break;
        }
        if ((*(_WORD *)(v15 + 10) & 2) == 0) {
          break;
        }
        __int16 v19 = *(_WORD *)(v15 + *(unsigned __int16 *)(v15 + 2 * *(unsigned __int16 *)(v12 + 2 * v17 + 328) + 16) + 4);
        uint64_t v12 = *(void *)(v12 + 16);
      }
      while ((v19 & 2) != 0);
    }
    uint64_t v7 = *(void *)v7;
    if (v7) {
      BOOL v9 = v7 == a1;
    }
    else {
      BOOL v9 = 1;
    }
  }
  while (!v9);
  uint64_t v10 = 8 * v8 - 8;
  while (v10 != -8)
  {
    uint64_t v7 = *(void *)(*(void *)(v5 + 104) + v10);
    v10 -= 8;
    --v8;
    if (v7) {
      BOOL v11 = v7 == a1;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11) {
      goto LABEL_2;
    }
  }
  uint64_t result = 0;
  if (a3 && v6)
  {
    unint64_t v21 = 0;
    uint64_t v22 = 40;
    do
    {
      if (*(unsigned char *)(*(void *)(v5 + 112) + v21))
      {
        unint64_t v23 = *(void *)(*(void *)(v5 + 88) + v22);
        if (v23 != -1)
        {
          uint64_t result = mdb_page_get(a1, v23, &v27, &v26);
          if (result) {
            return result;
          }
          __int16 v24 = *(_WORD *)(v27 + 10);
          if ((v24 & 0xC050) == a2 && v26 <= 1) {
            *(_WORD *)(v27 + 10) = v24 ^ 0x8000;
          }
        }
      }
      ++v21;
      v22 += 48;
    }
    while (v21 < *(unsigned int *)(v5 + 120));
    return 0;
  }
  return result;
}

unint64_t mdb_find_oldest(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t result = *(void *)(a1 + 24) - 1;
  uint64_t v3 = *(void *)(v1 + 64);
  if (v3)
  {
    uint64_t v4 = *(unsigned int *)(v3 + 16);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = v3 + 192;
      unint64_t v6 = v4 + 1;
      do
      {
        uint64_t v7 = v5 + ((unint64_t)(v6 - 2) << 6);
        if (*(_DWORD *)(v7 + 8))
        {
          unint64_t v8 = *(void *)v7;
          if (result >= v8) {
            unint64_t result = v8;
          }
        }
        --v6;
      }
      while (v6 > 1);
    }
  }
  return result;
}

uint64_t mdb_rebalance(uint64_t a1)
{
  uint64_t v121 = 0;
  memset(v120, 0, sizeof(v120));
  long long v118 = 0u;
  long long v119 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  int v2 = (unint64_t *)(a1 + 72);
  uint64_t v3 = *(unsigned __int16 *)(a1 + 66);
  uint64_t v4 = *(_WORD **)(a1 + 72 + 8 * v3);
  if (v4[5]) {
    unsigned int v5 = 2;
  }
  else {
    unsigned int v5 = 1;
  }
  if (v4[5]) {
    unint64_t v6 = 1;
  }
  else {
    unint64_t v6 = 250;
  }
  uint64_t v7 = *(void *)(a1 + 24);
  unint64_t v8 = (*(_DWORD *)(*(void *)(v7 + 32) + 16) - 16);
  __int16 v9 = v4[7];
  int v10 = (unsigned __int16)v4[6];
  if (1000 * (unint64_t)(v8 - (unsigned __int16)(v9 - v10)) / v8 >= v6
    && v5 <= (v10 - 16) >> 1)
  {
    return 0;
  }
  if (*(unsigned __int16 *)(a1 + 64) > 1u)
  {
    mdb_cursor_copy(a1, (uint64_t)&v116);
    int v20 = *(unsigned __int16 *)(a1 + 328 + 2 * v3);
    int v21 = *(unsigned __int16 *)(a1 + 328 + 2 * (v3 - 1));
    *(void *)&long long v117 = 0;
    uint64_t v22 = (unsigned __int16 *)&v120[16] + (v3 - 1) + 4;
    unsigned __int16 v23 = *v22;
    __int16 v24 = (void *)(a1 + 8 * (v3 - 1) + 72);
    if (v21)
    {
      unsigned __int16 v25 = v23 - 1;
      *uint64_t v22 = v25;
      int v26 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2 * v25 + 16));
      uint64_t updated = mdb_page_get(a1, *v26 | ((unint64_t)*((unsigned __int16 *)v26 + 2) << 32), (unint64_t *)v120 + WORD1(v120[0]) + 1, 0);
      if (updated) {
        return updated;
      }
      uint64_t v27 = WORD1(v120[0]);
      uint64_t v28 = *((void *)v120 + WORD1(v120[0]) + 1);
      unsigned int v29 = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = ((*(unsigned __int16 *)(v28 + 12) + 131056) >> 1) - 1;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    }
    else
    {
      unsigned __int16 v30 = v23 + 1;
      *uint64_t v22 = v30;
      uint64_t v31 = (unsigned int *)(*v24 + *(unsigned __int16 *)(*v24 + 2 * v30 + 16));
      uint64_t updated = mdb_page_get(a1, *v31 | ((unint64_t)*((unsigned __int16 *)v31 + 2) << 32), (unint64_t *)v120 + WORD1(v120[0]) + 1, 0);
      if (updated) {
        return updated;
      }
      LOWORD(v29) = 0;
      uint64_t v27 = WORD1(v120[0]);
      *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = 0;
      *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = (*(unsigned __int16 *)(*(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72) + 12)
                                                                   + 131056) >> 1;
      uint64_t v28 = *((void *)v120 + v27 + 1);
    }
    unint64_t v32 = (*(_DWORD *)(*(void *)(*(void *)(a1 + 24) + 32) + 16) - 16);
    __int16 v33 = *(_WORD *)(v28 + 14);
    int v34 = *(unsigned __int16 *)(v28 + 12);
    if (1000 * (unint64_t)(v32 - (unsigned __int16)(v33 - v34)) / v32 < v6
      || v5 >= (v34 - 16) >> 1)
    {
      if (v21)
      {
        long long v45 = &v116;
        *((_WORD *)&v120[16] + v27 + 4) = *(_WORD *)(a1 + 2 * v27 + 328) + v29 + 1;
        uint64_t v171 = 0;
        long long v170 = 0u;
        long long v169 = 0u;
        v20 += (v34 + 131056) >> 1;
        long long v168 = 0u;
        long long v167 = 0u;
        long long v166 = 0u;
        long long v165 = 0u;
        long long v164 = 0u;
        long long v163 = 0u;
        long long v162 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        long long v158 = 0u;
        long long v159 = 0u;
        long long v156 = 0u;
        long long v157 = 0u;
        long long v154 = 0u;
        long long v155 = 0u;
        long long v152 = 0u;
        long long v153 = 0u;
        long long v150 = 0u;
        long long v151 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        long long v147 = 0u;
        uint64_t v46 = *(void *)(*((void *)&v117 + 1) + 104);
        uint64_t v47 = v118;
        if ((BYTE4(v120[0]) & 4) != 0)
        {
          DWORD1(v151) = 1;
          *(void *)&long long v148 = &v116;
          long long v45 = &v147;
        }
        *(void *)long long v45 = *(void *)(v46 + 8 * v118);
        *(void *)(v46 + 8 * v47) = v45;
        uint64_t updated = mdb_page_merge(a1, (uint64_t)&v116);
        *(void *)(v46 + 8 * v47) = *(void *)v45;
        mdb_cursor_copy((uint64_t)&v116, a1);
      }
      else
      {
        uint64_t updated = mdb_page_merge((uint64_t)&v116, a1);
      }
      *(_DWORD *)(a1 + 68) &= ~2u;
      goto LABEL_119;
    }
    uint64_t updated = mdb_page_touch((uint64_t)&v116);
    if (updated) {
      goto LABEL_117;
    }
    uint64_t updated = mdb_page_touch(a1);
    if (updated) {
      goto LABEL_117;
    }
    unint64_t v174 = 0;
    uint64_t v175 = 0;
    long long v147 = 0u;
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    long long v152 = 0u;
    long long v153 = 0u;
    long long v154 = 0u;
    long long v155 = 0u;
    long long v156 = 0u;
    long long v157 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    uint64_t v171 = 0;
    uint64_t v35 = *((void *)v120 + WORD1(v120[0]) + 1);
    __int16 v36 = *(_WORD *)(v35 + 10);
    if ((v36 & 0x20) != 0)
    {
      size_t v56 = 0;
      LODWORD(v39) = 0;
      unint64_t v57 = v35
          + *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4)
          * (unint64_t)**((_DWORD **)&v118 + 1)
          + 16;
      unint64_t v174 = **((_DWORD **)&v118 + 1);
      uint64_t v175 = (unsigned int *)v57;
      size_t v172 = 0;
      uint64_t v173 = 0;
    }
    else
    {
      long long v37 = (unsigned int *)(v35
                           + *(unsigned __int16 *)(v35 + 2 * *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4) + 16));
      uint64_t v38 = *v37;
      uint64_t v39 = *((unsigned __int16 *)v37 + 2);
      if ((v36 & 1) == 0 || *((_WORD *)&v120[16] + WORD1(v120[0]) + 4))
      {
        int64_t v58 = *((unsigned __int16 *)v37 + 3);
        unint64_t v174 = v58;
        uint64_t v175 = v37 + 2;
      }
      else
      {
        __int16 v40 = v120[0];
        uint64_t updated = mdb_page_search_lowest((uint64_t)&v116);
        if (updated) {
          goto LABEL_117;
        }
        uint64_t v41 = *((void *)v120 + WORD1(v120[0]) + 1);
        if ((*(_WORD *)(v41 + 10) & 0x20) != 0)
        {
          unint64_t v43 = **((_DWORD **)&v118 + 1);
          long long v44 = (unsigned int *)(v41 + 16);
        }
        else
        {
          uint64_t v42 = v41 + *(unsigned __int16 *)(v41 + 16);
          unint64_t v43 = *(unsigned __int16 *)(v42 + 6);
          long long v44 = (unsigned int *)(v42 + 8);
        }
        unint64_t v174 = v43;
        uint64_t v175 = v44;
        LOWORD(v120[0]) = v40;
        WORD1(v120[0]) = v40 - 1;
        int64_t v58 = *((unsigned __int16 *)v37 + 3);
      }
      size_t v56 = v38 | (v39 << 32);
      size_t v172 = *v37;
      uint64_t v173 = (uint64_t)v37 + v58 + 8;
    }
    *(void *)&long long v148 = 0;
    uint64_t v59 = *(unsigned __int16 *)(a1 + 66);
    if ((*(_WORD *)(*(void *)(a1 + 8 * v59 + 72) + 10) & 1) != 0 && !*(_WORD *)(a1 + 2 * v59 + 328))
    {
      int v77 = *(unsigned __int16 *)(a1 + 64);
      long long v122 = 0uLL;
      mdb_cursor_copy(a1, (uint64_t)&v147);
      uint64_t v78 = mdb_page_search_lowest((uint64_t)&v147);
      if (v78)
      {
        uint64_t updated = v78;
        goto LABEL_117;
      }
      uint64_t v104 = *((void *)&v151 + WORD1(v151) + 1);
      if ((*(_WORD *)(v104 + 10) & 0x20) != 0)
      {
        uint64_t v106 = **((_DWORD **)&v149 + 1);
        uint64_t v107 = v104 + 16;
      }
      else
      {
        uint64_t v105 = v104 + *(unsigned __int16 *)(v104 + 16);
        uint64_t v106 = *(unsigned __int16 *)(v105 + 6);
        uint64_t v107 = v105 + 8;
      }
      *(void *)&long long v122 = v106;
      *((void *)&v122 + 1) = v107;
      LOWORD(v151) = v77;
      WORD1(v151) = v77 - 1;
      *((_WORD *)&v167 + (v77 - 1) + 4) = 0;
      uint64_t updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v122);
      if (updated)
      {
LABEL_117:
        if (v21) {
          LOWORD(v20) = v20 + 1;
        }
LABEL_119:
        *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = v20;
        return updated;
      }
      uint64_t v59 = *(unsigned __int16 *)(a1 + 66);
    }
    uint64_t updated = mdb_node_add(a1, *(unsigned __int16 *)(a1 + 2 * v59 + 328), (const void **)&v174, &v172, v56, v39);
    if (!updated)
    {
      mdb_node_del(&v116, v174);
      uint64_t v60 = *((void *)v120 + WORD1(v120[0]) + 1);
      if (v21)
      {
        long long v61 = *(long long **)(*(void *)(*((void *)&v117 + 1) + 104) + 8 * v118);
        if (v61)
        {
          uint64_t v62 = *(void *)(a1 + 8 * WORD1(v120[0]) + 72);
          char v63 = BYTE4(v120[0]);
          do
          {
            long long v64 = v61;
            if ((v63 & 4) != 0) {
              long long v64 = (long long *)*((void *)v61 + 2);
            }
            if ((*((unsigned char *)v64 + 68) & 1) != 0 && *((unsigned __int16 *)v64 + 33) >= WORD1(v120[0]))
            {
              if (v64 != (long long *)a1 && *((void *)v64 + WORD1(v120[0]) + 9) == v62)
              {
                long long v65 = (char *)v64 + 2 * WORD1(v120[0]);
                unsigned int v66 = *((unsigned __int16 *)v65 + 164);
                if (v66 >= *(unsigned __int16 *)(a1 + 2 * WORD1(v120[0]) + 328)) {
                  *((_WORD *)v65 + 164) = v66 + 1;
                }
              }
              if (v64 != &v116)
              {
                uint64_t v67 = (void *)v64 + WORD1(v120[0]);
                uint64_t v69 = v67[9];
                uint64_t v68 = v67 + 9;
                if (v69 == v60)
                {
                  unint64_t v70 = (char *)v64 + 2 * WORD1(v120[0]);
                  if (*((unsigned __int16 *)v70 + 164) == *((unsigned __int16 *)&v120[16] + WORD1(v120[0]) + 4))
                  {
                    __int16 v71 = v70 + 328;
                    uint64_t v72 = *(unsigned __int16 *)(a1 + 66);
                    *uint64_t v68 = *(void *)(a1 + 8 * v72 + 72);
                    *__int16 v71 = *(_WORD *)(a1 + 2 * v72 + 328);
                    ++*((_WORD *)v64 + WORD1(v120[0]) + 163);
                  }
                }
              }
              if ((*(_WORD *)(v60 + 10) & 2) != 0)
              {
                uint64_t v73 = *((void *)v64 + 2);
                if (v73)
                {
                  if (*(unsigned char *)(v73 + 68))
                  {
                    uint64_t v74 = *((void *)v64 + WORD1(v120[0]) + 9);
                    uint64_t v75 = *((unsigned __int16 *)v64 + WORD1(v120[0]) + 164);
                    if (v75 < (*(unsigned __int16 *)(v74 + 12) - 16) >> 1)
                    {
                      uint64_t v76 = v74 + *(unsigned __int16 *)(v74 + 2 * v75 + 16);
                      if ((*(_WORD *)(v76 + 4) & 6) == 4) {
                        *(void *)(v73 + 72) = v76 + *(unsigned __int16 *)(v76 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
            long long v61 = *(long long **)v61;
          }
          while (v61);
        }
      }
      else
      {
        uint64_t v79 = *(long long **)(*(void *)(*((void *)&v117 + 1) + 104) + 8 * v118);
        if (v79)
        {
          char v80 = BYTE4(v120[0]);
          do
          {
            int v81 = v79;
            if ((v80 & 4) != 0) {
              int v81 = (long long *)*((void *)v79 + 2);
            }
            if (v81 != &v116
              && (*((unsigned char *)v81 + 68) & 1) != 0
              && *((unsigned __int16 *)v81 + 33) >= WORD1(v120[0]))
            {
              uint64_t v82 = (void *)v81 + WORD1(v120[0]);
              uint64_t v84 = v82[9];
              int v83 = v82 + 9;
              if (v84 == v60)
              {
                uint64_t v85 = (__int16 *)v81 + WORD1(v120[0]) + 164;
                __int16 v86 = *v85;
                if (!*v85)
                {
                  uint64_t v87 = *(unsigned __int16 *)(a1 + 66);
                  *int v83 = *(void *)(a1 + 8 * v87 + 72);
                  *uint64_t v85 = *(_WORD *)(a1 + 2 * v87 + 328);
                  uint64_t v85 = (__int16 *)v81 + WORD1(v120[0]) + 163;
                  __int16 v86 = *v85;
                }
                *uint64_t v85 = v86 - 1;
                if ((*(_WORD *)(v60 + 10) & 2) != 0)
                {
                  uint64_t v88 = *((void *)v81 + 2);
                  if (v88)
                  {
                    if (*(unsigned char *)(v88 + 68))
                    {
                      uint64_t v89 = *((void *)v81 + WORD1(v120[0]) + 9);
                      uint64_t v90 = *((unsigned __int16 *)v81 + WORD1(v120[0]) + 164);
                      if (v90 < (*(unsigned __int16 *)(v89 + 12) - 16) >> 1)
                      {
                        uint64_t v91 = v89 + *(unsigned __int16 *)(v89 + 2 * v90 + 16);
                        if ((*(_WORD *)(v91 + 4) & 6) == 4) {
                          *(void *)(v88 + 72) = v91 + *(unsigned __int16 *)(v91 + 6) + 8;
                        }
                      }
                    }
                  }
                }
              }
            }
            uint64_t v79 = *(long long **)v79;
          }
          while (v79);
        }
      }
      uint64_t v92 = WORD1(v120[0]);
      uint64_t v93 = (char *)&v116 + 2 * WORD1(v120[0]);
      if (!*((_WORD *)v93 + 164))
      {
        if (*((_WORD *)v93 + 163))
        {
          uint64_t v97 = *((void *)v120 + WORD1(v120[0]) + 1);
          if ((*(_WORD *)(v97 + 10) & 0x20) != 0)
          {
            size_t v99 = (unsigned int *)(v97 + 16);
          }
          else
          {
            uint64_t v98 = v97 + *(unsigned __int16 *)(v97 + 16);
            unint64_t v174 = *(unsigned __int16 *)(v98 + 6);
            size_t v99 = (unsigned int *)(v98 + 8);
          }
          uint64_t v175 = v99;
          unsigned int v108 = &v147;
          mdb_cursor_copy((uint64_t)&v116, (uint64_t)&v147);
          LOWORD(v151) = v151 - 1;
          --WORD1(v151);
          uint64_t v146 = 0;
          long long v144 = 0u;
          long long v145 = 0u;
          long long v142 = 0u;
          long long v143 = 0u;
          long long v140 = 0u;
          long long v141 = 0u;
          long long v138 = 0u;
          long long v139 = 0u;
          long long v136 = 0u;
          long long v137 = 0u;
          long long v134 = 0u;
          long long v135 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          long long v130 = 0u;
          long long v131 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          uint64_t v109 = *(void *)(*((void *)&v148 + 1) + 104);
          uint64_t v110 = v149;
          if ((BYTE4(v151) & 4) != 0)
          {
            DWORD1(v126) = 1;
            *(void *)&long long v123 = &v147;
            unsigned int v108 = &v122;
          }
          *(void *)unsigned int v108 = *(void *)(v109 + 8 * v149);
          *(void *)(v109 + 8 * v110) = v108;
          uint64_t updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v174);
          *(void *)(v109 + 8 * v110) = *(void *)v108;
          if (updated) {
            goto LABEL_117;
          }
          uint64_t v92 = WORD1(v120[0]);
        }
        if (*(_WORD *)(*((void *)v120 + v92 + 1) + 10))
        {
          __int16 v111 = *((_WORD *)&v120[16] + v92 + 4);
          long long v122 = 0uLL;
          *((_WORD *)&v120[16] + v92 + 4) = 0;
          mdb_update_key((uint64_t)&v116, (uint64_t)&v122);
          LODWORD(v92) = WORD1(v120[0]);
          *((_WORD *)&v120[16] + WORD1(v120[0]) + 4) = v111;
        }
      }
      uint64_t v94 = *(unsigned __int16 *)(a1 + 66);
      uint64_t v95 = a1 + 2 * v94;
      if (*(_WORD *)(v95 + 328)) {
        goto LABEL_116;
      }
      if (*(_WORD *)(v95 + 326))
      {
        __int16 v100 = *(_WORD *)(*((void *)v120 + v92 + 1) + 10);
        uint64_t v101 = *(void *)(a1 + 8 * v94 + 72);
        if ((v100 & 0x20) != 0)
        {
          size_t v103 = (unsigned int *)(v101 + 16);
        }
        else
        {
          uint64_t v102 = v101 + *(unsigned __int16 *)(v101 + 16);
          unint64_t v174 = *(unsigned __int16 *)(v102 + 6);
          size_t v103 = (unsigned int *)(v102 + 8);
        }
        uint64_t v175 = v103;
        int v112 = &v147;
        mdb_cursor_copy(a1, (uint64_t)&v147);
        LOWORD(v151) = v151 - 1;
        --WORD1(v151);
        uint64_t v146 = 0;
        long long v144 = 0u;
        long long v145 = 0u;
        long long v142 = 0u;
        long long v143 = 0u;
        long long v140 = 0u;
        long long v141 = 0u;
        long long v138 = 0u;
        long long v139 = 0u;
        long long v136 = 0u;
        long long v137 = 0u;
        long long v134 = 0u;
        long long v135 = 0u;
        long long v132 = 0u;
        long long v133 = 0u;
        long long v130 = 0u;
        long long v131 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        long long v126 = 0u;
        long long v127 = 0u;
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        uint64_t v113 = *(void *)(*((void *)&v148 + 1) + 104);
        uint64_t v114 = v149;
        if ((BYTE4(v151) & 4) != 0)
        {
          DWORD1(v126) = 1;
          *(void *)&long long v123 = &v147;
          int v112 = &v122;
        }
        *(void *)int v112 = *(void *)(v113 + 8 * v149);
        *(void *)(v113 + 8 * v114) = v112;
        uint64_t updated = mdb_update_key((uint64_t)&v147, (uint64_t)&v174);
        *(void *)(v113 + 8 * v114) = *(void *)v112;
        if (updated) {
          goto LABEL_117;
        }
        uint64_t v94 = *(unsigned __int16 *)(a1 + 66);
      }
      if ((*(_WORD *)(*(void *)(a1 + 8 * v94 + 72) + 10) & 1) == 0)
      {
LABEL_116:
        uint64_t updated = 0;
      }
      else
      {
        __int16 v115 = *(_WORD *)(a1 + 328 + 2 * v94);
        long long v122 = 0uLL;
        *(_WORD *)(a1 + 328 + 2 * v94) = 0;
        mdb_update_key(a1, (uint64_t)&v122);
        uint64_t updated = 0;
        *(_WORD *)(a1 + 328 + 2 * *(unsigned __int16 *)(a1 + 66)) = v115;
      }
    }
    goto LABEL_117;
  }
  unint64_t v11 = *v2;
  __int16 v12 = *(_WORD *)(*v2 + 10);
  if ((v12 & 0x40) != 0) {
    return 0;
  }
  unsigned int v13 = *(unsigned __int16 *)(v11 + 12) - 16;
  if (v13 <= 1)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    *(void *)(v14 + 40) = -1;
    *(_WORD *)(v14 + 6) = 0;
    *(void *)(v14 + 16) = 0;
    uint64_t updated = mdb_midl_append((unint64_t **)(v7 + 40), *(void *)v11);
    if (updated) {
      return updated;
    }
    unsigned int v16 = *(_DWORD *)(a1 + 68) & 0xFFFFFFFE;
    *(_DWORD *)(a1 + 64) = 0;
    *(_DWORD *)(a1 + 68) = v16;
    unsigned int v17 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
    if (v17)
    {
      do
      {
        uint64_t v18 = v17;
        if ((*(unsigned char *)(a1 + 68) & 4) != 0) {
          uint64_t v18 = (void *)v17[2];
        }
        int v19 = *((_DWORD *)v18 + 17);
        if ((v19 & 1) != 0
          && *((unsigned __int16 *)v18 + 32) >= *(unsigned __int16 *)(a1 + 64)
          && v18[9] == v11)
        {
          *((_DWORD *)v18 + 16) = 0;
          *((_DWORD *)v18 + 17) = v19 & 0xFFFFFFFE;
        }
        uint64_t updated = 0;
        unsigned int v17 = (void *)*v17;
      }
      while (v17);
      return updated;
    }
    return 0;
  }
  uint64_t updated = 0;
  if ((v12 & 1) == 0) {
    return updated;
  }
  if ((v13 & 0xFFFFFFFE) != 2) {
    return updated;
  }
  uint64_t updated = mdb_midl_append((unint64_t **)(v7 + 40), *(void *)v11);
  if (updated) {
    return updated;
  }
  unint64_t v48 = *(unsigned int *)(v11 + *(unsigned __int16 *)(v11 + 16)) | ((unint64_t)*(unsigned __int16 *)(v11 + *(unsigned __int16 *)(v11 + 16) + 4) << 32);
  *(void *)(*(void *)(a1 + 40) + 40) = v48;
  uint64_t updated = mdb_page_get(a1, v48, v2, 0);
  if (updated) {
    return updated;
  }
  uint64_t v49 = *(void *)(a1 + 40);
  --*(_WORD *)(v49 + 6);
  --*(void *)(v49 + 8);
  *(_WORD *)(a1 + 328) = *(_WORD *)(a1 + 330);
  if (*(unsigned __int16 *)(v49 + 6) >= 2u)
  {
    uint64_t v50 = 0;
    do
    {
      *(void *)(a1 + 8 * v50 + 80) = *(void *)(a1 + 8 * v50 + 88);
      *(_WORD *)(a1 + 2 * v50 + 330) = *(_WORD *)(a1 + 2 * v50 + 332);
      unint64_t v51 = v50 + 2;
      ++v50;
    }
    while (v51 < *(unsigned __int16 *)(v49 + 6));
  }
  long long v52 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
  if (!v52) {
    return 0;
  }
  int v53 = *(_DWORD *)(a1 + 68);
  do
  {
    long long v54 = v52;
    if ((v53 & 4) != 0) {
      long long v54 = (void *)v52[2];
    }
    if (v54 != (void *)a1 && (*((unsigned char *)v54 + 68) & 1) != 0 && v54[9] == v11)
    {
      if (*(_WORD *)(v49 + 6))
      {
        unint64_t v55 = 0;
        do
        {
          v54[v55 + 9] = v54[v55 + 10];
          *((_WORD *)v54 + v55 + 164) = *((_WORD *)v54 + v55 + 165);
          uint64_t v49 = *(void *)(a1 + 40);
          ++v55;
        }
        while (v55 < *(unsigned __int16 *)(v49 + 6));
      }
      --*((_WORD *)v54 + 32);
      --*((_WORD *)v54 + 33);
    }
    uint64_t updated = 0;
    long long v52 = (void *)*v52;
  }
  while (v52);
  return updated;
}

uint64_t mdb_cursor_copy(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 24) = *(void *)(result + 24);
  *(_DWORD *)(a2 + 32) = *(_DWORD *)(result + 32);
  *(_OWORD *)(a2 + 40) = *(_OWORD *)(result + 40);
  *(_DWORD *)(a2 + 64) = *(_DWORD *)(result + 64);
  *(_DWORD *)(a2 + 68) = *(_DWORD *)(result + 68);
  if (*(_WORD *)(result + 64))
  {
    unint64_t v2 = 0;
    uint64_t v3 = result + 328;
    uint64_t v4 = a2 + 328;
    do
    {
      __int16 v5 = *(_WORD *)(v3 + 2 * v2);
      *(void *)(v4 + 8 * v2 - 256) = *(void *)(v3 + 8 * v2 - 256);
      *(_WORD *)(v4 + 2 * v2++) = v5;
    }
    while (v2 < *(unsigned __int16 *)(result + 64));
  }
  return result;
}

uint64_t mdb_page_merge(uint64_t a1, uint64_t a2)
{
  size_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v4 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t result = mdb_page_touch(a2);
  if (result) {
    return result;
  }
  unint64_t v53 = 0;
  long long v54 = 0;
  uint64_t v6 = *(void *)(a2 + 8 * *(unsigned __int16 *)(a2 + 66) + 72);
  unsigned int v7 = *(unsigned __int16 *)(v6 + 12) + 131056;
  if ((*(unsigned char *)(v4 + 10) & 0x20) == 0)
  {
    if ((*(_WORD *)(v4 + 12) & 0xFFFE) != 0x10)
    {
      unsigned __int16 v8 = 0;
      unsigned int v9 = v7 >> 1;
      do
      {
        int v10 = (unsigned int *)(v4 + *(unsigned __int16 *)(v4 + 2 * v8 + 16));
        if (!v8 && (*(_WORD *)(v4 + 10) & 1) != 0)
        {
          uint64_t v50 = 0;
          memset(v49, 0, sizeof(v49));
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          mdb_cursor_copy(a1, (uint64_t)&v45);
          *(void *)&long long v46 = 0;
          uint64_t result = mdb_page_search_lowest((uint64_t)&v45);
          if (result) {
            return result;
          }
          uint64_t v12 = *((void *)v49 + WORD1(v49[0]) + 1);
          if ((*(_WORD *)(v12 + 10) & 0x20) != 0)
          {
            unint64_t v53 = **((_DWORD **)&v47 + 1);
            uint64_t v14 = (unsigned int *)(v12 + 16);
          }
          else
          {
            uint64_t v13 = v12 + *(unsigned __int16 *)(v12 + 16);
            unint64_t v53 = *(unsigned __int16 *)(v13 + 6);
            uint64_t v14 = (unsigned int *)(v13 + 8);
          }
          long long v54 = v14;
          int64_t v11 = *((unsigned __int16 *)v10 + 3);
        }
        else
        {
          int64_t v11 = *((unsigned __int16 *)v10 + 3);
          unint64_t v53 = v11;
          long long v54 = v10 + 2;
        }
        size_t v51 = *v10;
        uint64_t v52 = (uint64_t)v10 + v11 + 8;
        uint64_t result = mdb_node_add(a2, (unsigned __int16)v9, (const void **)&v53, &v51, v51 | ((unint64_t)*((unsigned __int16 *)v10 + 2) << 32), *((unsigned __int16 *)v10 + 2));
        if (result) {
          return result;
        }
        ++v8;
        LOWORD(v9) = v9 + 1;
      }
      while ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 > v8);
    }
LABEL_21:
    --*(_WORD *)(a1 + 66);
    mdb_node_del((void *)a1, 0);
    uint64_t v17 = *(unsigned __int16 *)(a1 + 66);
    if (!*(_WORD *)(a1 + 2 * v17 + 328))
    {
      unint64_t v53 = 0;
      uint64_t result = mdb_update_key(a1, (uint64_t)&v53);
      LOWORD(v17) = *(_WORD *)(a1 + 66);
      if (result)
      {
        *(_WORD *)(a1 + 66) = v17 + 1;
        return result;
      }
    }
    unsigned __int16 v18 = v17 + 1;
    *(_WORD *)(a1 + 66) = v18;
    uint64_t v19 = *(void *)(a1 + 8 * v18 + 72);
    unint64_t v20 = *(void *)v19;
    uint64_t v21 = *(void *)(a1 + 24);
    __int16 v22 = *(_WORD *)(v19 + 10);
    if ((v22 & 0x10) != 0 && *(_DWORD *)(a1 + 32))
    {
      if (!*(void *)v21)
      {
LABEL_35:
        *(void *)(v19 + 48) = *(void *)(v21 + 48);
        *(void *)(v21 + 48) = v19;
        ++*(_DWORD *)(v21 + 56);
        __int16 v25 = v22 | 0x4000;
        *(_WORD *)(v19 + 10) = v25;
LABEL_36:
        BOOL v26 = (v25 & 2) == 0;
        uint64_t v27 = 16;
        if (v26) {
          uint64_t v27 = 8;
        }
        --*(void *)(*(void *)(a1 + 40) + v27);
        uint64_t v28 = *(void **)(*(void *)(*(void *)(a1 + 24) + 104) + 8 * *(unsigned int *)(a1 + 32));
        if (v28)
        {
          uint64_t v29 = *(unsigned __int16 *)(a1 + 66);
          int v30 = *(_DWORD *)(a1 + 68);
          uint64_t v31 = (v29 - 1);
          do
          {
            unint64_t v32 = v28;
            if ((v30 & 4) != 0) {
              unint64_t v32 = (void *)v28[2];
            }
            if (v32 != (void *)a1 && *((unsigned __int16 *)v32 + 32) >= *(unsigned __int16 *)(a1 + 64))
            {
              __int16 v33 = &v32[v29];
              uint64_t v36 = v33[9];
              uint64_t v35 = v33 + 9;
              uint64_t v34 = v36;
              if (v36 == v19)
              {
                *uint64_t v35 = v6;
                *((_WORD *)v32 + v29 + 164) += v7 >> 1;
                *((_WORD *)v32 + v31 + 164) = *(_WORD *)(a2 + 2 * v31 + 328);
                uint64_t v34 = v6;
              }
              else if (v32[v31 + 9] == *(void *)(a1 + 8 * v31 + 72))
              {
                long long v37 = (char *)v32 + 2 * v31;
                unsigned int v38 = *((unsigned __int16 *)v37 + 164);
                if (v38 > *(unsigned __int16 *)(a1 + 2 * v31 + 328)) {
                  *((_WORD *)v37 + 164) = v38 - 1;
                }
              }
              if ((*(_WORD *)(v19 + 10) & 2) != 0)
              {
                uint64_t v39 = v32[2];
                if (v39)
                {
                  if (*(unsigned char *)(v39 + 68))
                  {
                    uint64_t v40 = *((unsigned __int16 *)v32 + v29 + 164);
                    if (v40 < (*(unsigned __int16 *)(v34 + 12) - 16) >> 1)
                    {
                      uint64_t v41 = v34 + *(unsigned __int16 *)(v34 + 2 * v40 + 16);
                      if ((*(_WORD *)(v41 + 4) & 6) == 4) {
                        *(void *)(v39 + 72) = v41 + *(unsigned __int16 *)(v41 + 6) + 8;
                      }
                    }
                  }
                }
              }
            }
            uint64_t v28 = (void *)*v28;
          }
          while (v28);
        }
        __int16 v42 = *(_WORD *)(a2 + 64);
        __int16 v43 = *(_WORD *)(*(void *)(a2 + 40) + 6);
        if (v42)
        {
          *(_WORD *)(a2 + 64) = v42 - 1;
          if (v42 == 1) {
            *(_DWORD *)(a2 + 68) &= ~1u;
          }
          else {
            --*(_WORD *)(a2 + 66);
          }
        }
        uint64_t result = mdb_rebalance(a2);
        __int16 v44 = *(_WORD *)(*(void *)(a2 + 40) + 6) - v43 + v42;
        *(_WORD *)(a2 + 64) = v44;
        *(_WORD *)(a2 + 66) = v44 - 1;
        return result;
      }
      unsigned __int16 v23 = *(void **)(v21 + 72);
      if (*v23)
      {
        unsigned int v24 = mdb_mid2l_search(*(unsigned int **)(v21 + 72), *(void *)v19);
        if (*v23 >= (unint64_t)v24 && v23[2 * v24] == v20)
        {
          if (v23[2 * v24 + 1] != v19)
          {
            *(_DWORD *)(a1 + 68) &= 0xFFFFFFFC;
            *(_DWORD *)(v21 + 124) |= 2u;
            return 4294936517;
          }
          __int16 v22 = *(_WORD *)(v19 + 10);
          goto LABEL_35;
        }
      }
    }
    uint64_t result = mdb_midl_append((unint64_t **)(v21 + 40), v20);
    if (result) {
      return result;
    }
    __int16 v25 = *(_WORD *)(v19 + 10);
    goto LABEL_36;
  }
  unint64_t v53 = **(unsigned int **)(a1 + 40);
  long long v54 = (unsigned int *)(v4 + 16);
  if ((*(_WORD *)(v4 + 12) & 0xFFFE) == 0x10) {
    goto LABEL_21;
  }
  int v15 = 0;
  unsigned int v16 = v7 >> 1;
  while (1)
  {
    uint64_t result = mdb_node_add(a2, (unsigned __int16)v16, (const void **)&v53, 0, 0, 0);
    if (result) {
      return result;
    }
    long long v54 = (unsigned int *)((char *)v54 + v53);
    ++v15;
    LOWORD(v16) = v16 + 1;
    if ((*(unsigned __int16 *)(v4 + 12) - 16) >> 1 <= (unsigned __int16)v15) {
      goto LABEL_21;
    }
  }
}

uint64_t mdb_page_search_lowest(uint64_t a1)
{
  unint64_t v5 = *(void *)(a1 + 8 * *(unsigned __int16 *)(a1 + 66) + 72);
  uint64_t result = mdb_page_get(a1, *(unsigned int *)(v5 + *(unsigned __int16 *)(v5 + 16)) | ((unint64_t)*(unsigned __int16 *)(v5 + *(unsigned __int16 *)(v5 + 16) + 4) << 32), &v5, 0);
  if (!result)
  {
    *(_WORD *)(a1 + 2 * *(unsigned __int16 *)(a1 + 66) + 328) = 0;
    uint64_t v3 = *(unsigned __int16 *)(a1 + 64);
    if (v3 < 0x20)
    {
      unint64_t v4 = v5;
      *(_WORD *)(a1 + 64) = v3 + 1;
      *(_WORD *)(a1 + 66) = v3;
      *(void *)(a1 + 8 * v3 + 72) = v4;
      *(_WORD *)(a1 + 2 * v3 + 328) = 0;
      return mdb_page_search_root(a1, 0, 4);
    }
    else
    {
      *(_DWORD *)(*(void *)(a1 + 24) + 124) |= 2u;
      return 4294936509;
    }
  }
  return result;
}

uint64_t mdb_cmp_memnr(void *a1, void *a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = v2 + *a1;
  uint64_t v4 = *a1 - *a2;
  unint64_t v5 = v2 + (v4 & ~(v4 >> 63));
  if (v4 >= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = *a1 - *a2;
  }
  unsigned int v7 = (unsigned __int8 *)(*a2 + a2[1] - 1);
  while (v3 > v5)
  {
    int v9 = *(unsigned __int8 *)--v3;
    int v8 = v9;
    int v10 = *v7--;
    uint64_t result = (v8 - v10);
    if (v8 != v10) {
      return result;
    }
  }
  if (v6 < 0) {
    return -1;
  }
  else {
    return v6;
  }
}

uint64_t mdb_cmp_memn(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a1;
  uint64_t v2 = (const void *)a1[1];
  uint64_t v5 = *a2;
  uint64_t v4 = (const void *)a2[1];
  int v7 = v3 - v5;
  BOOL v6 = v3 <= v5;
  if (v3 < v5) {
    int v7 = -1;
  }
  if (v3 > v5) {
    LODWORD(v3) = v5;
  }
  if (v6) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 1;
  }
  LODWORD(result) = memcmp(v2, v4, v3);
  if (result) {
    return result;
  }
  else {
    return v8;
  }
}

uint64_t mdb_midl_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2 = *a1;
  if (!*a1) {
    return 1;
  }
  int v3 = 0;
  do
  {
    unsigned int v4 = v2 >> 1;
    uint64_t v5 = v3 + (v2 >> 1) + 1;
    unint64_t v6 = *(void *)&a1[2 * v5];
    if (v6 >= a2)
    {
      if (v6 <= a2) {
        return v5;
      }
      unsigned int v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    unsigned int v2 = v4;
  }
  while (v4);
  if (v6 <= a2) {
    return v5;
  }
  else {
    return (v5 + 1);
  }
}

void *mdb_midl_alloc(int a1)
{
  unsigned int v2 = malloc_type_malloc(8 * (a1 + 2), 0x100004000313F17uLL);
  if (!v2) {
    return 0;
  }
  v2[1] = 0;
  int v3 = v2 + 1;
  void *v2 = a1;
  return v3;
}

void mdb_midl_free(uint64_t a1)
{
  if (a1) {
    free((void *)(a1 - 8));
  }
}

void *mdb_midl_shrink(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t v4 = *(void *)(v2 - 8);
  uint64_t result = (void *)(v2 - 8);
  if (v4 >= 0x20000)
  {
    uint64_t result = malloc_type_realloc(result, 0x100008uLL, 0x100004000313F17uLL);
    if (result)
    {
      *result++ = 0x1FFFFLL;
      *a1 = (uint64_t)result;
    }
  }
  return result;
}

uint64_t mdb_midl_need(_DWORD **a1, int a2)
{
  int v3 = *a1;
  unint64_t v4 = (*v3 + a2);
  unint64_t v6 = *((void *)v3 - 1);
  uint64_t v5 = v3 - 2;
  if (v6 >= v4) {
    return 0;
  }
  uint64_t v7 = (v4 + (v4 >> 2) + 258) & 0xFFFFFF00;
  unsigned int v8 = malloc_type_realloc(v5, 8 * v7, 0x100004000313F17uLL);
  if (!v8) {
    return 12;
  }
  int v9 = v8;
  uint64_t result = 0;
  void *v9 = (v7 - 2);
  *a1 = v9 + 1;
  return result;
}

uint64_t mdb_midl_append(unint64_t **a1, unint64_t a2)
{
  int v3 = *a1;
  unint64_t v4 = **a1;
  if (v4 >= *(*a1 - 1))
  {
    if (mdb_midl_grow(a1, 0x1FFFF)) {
      return 12;
    }
    int v3 = *a1;
    unint64_t v4 = **a1;
  }
  uint64_t result = 0;
  unint64_t v7 = v4 + 1;
  unint64_t *v3 = v7;
  v3[v7] = a2;
  return result;
}

uint64_t mdb_midl_grow(void *a1, int a2)
{
  unint64_t v4 = malloc_type_realloc((void *)(*a1 - 8), 8 * (*(void *)(*a1 - 8) + a2) + 16, 0x100004000313F17uLL);
  if (!v4) {
    return 12;
  }
  uint64_t v5 = v4;
  uint64_t result = 0;
  *v5 += a2;
  *a1 = v5 + 1;
  return result;
}

uint64_t mdb_midl_append_list(uint64_t **a1, uint64_t *a2)
{
  int v3 = *a1;
  uint64_t v4 = **a1;
  uint64_t v5 = *a2;
  if (v5 + v4 >= (unint64_t)*(*a1 - 1))
  {
    if (mdb_midl_grow(a1, v5)) {
      return 12;
    }
    int v3 = *a1;
    uint64_t v4 = **a1;
    uint64_t v5 = *a2;
  }
  memcpy(&v3[v4 + 1], a2 + 1, 8 * v5);
  uint64_t result = 0;
  *v3 += *a2;
  return result;
}

uint64_t mdb_midl_append_range(uint64_t **a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = **a1;
  unint64_t v7 = v6 + a3;
  if (v7 > *(*a1 - 1))
  {
    if (mdb_midl_grow(a1, a3 | 0x1FFFF)) {
      return 12;
    }
    uint64_t v5 = *a1;
  }
  *uint64_t v5 = v7;
  if (a3)
  {
    uint64_t v10 = a3;
    int64_t v11 = &v5[v6];
    do
      v11[v10--] = a2++;
    while (v10);
  }
  return 0;
}

uint64_t *mdb_midl_xmerge(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = *result;
  uint64_t v4 = *result + *a2;
  *uint64_t result = -1;
  if (v2)
  {
    unint64_t v5 = result[v3];
    uint64_t v6 = v4;
    do
    {
      unint64_t v7 = a2[v2];
      if (v5 >= v7)
      {
        uint64_t v9 = v3;
        uint64_t v8 = v6;
      }
      else
      {
        do
        {
          uint64_t v8 = v6 - 1;
          result[v6] = v5;
          uint64_t v9 = v3 - 1;
          unint64_t v5 = result[v3 - 1];
          --v6;
          --v3;
        }
        while (v5 < v7);
      }
      uint64_t v6 = v8 - 1;
      result[v8] = v7;
      uint64_t v3 = v9;
      --v2;
    }
    while (v2);
  }
  *uint64_t result = v4;
  return result;
}

int *mdb_midl_sort(int *result)
{
  LODWORD(v1) = 0;
  int v2 = *result;
  LODWORD(v3) = 1;
LABEL_2:
  while (2)
  {
    uint64_t v4 = (int)v3 + 1;
    while (v2 - (int)v3 > 7)
    {
      int v5 = (v2 + (int)v3) >> 1;
      unint64_t v6 = *(void *)&result[2 * v5];
      *(void *)&result[2 * v5] = *(void *)&result[2 * v4];
      *(void *)&result[2 * v4] = v6;
      unint64_t v7 = *(void *)&result[2 * (int)v3];
      unint64_t v8 = *(void *)&result[2 * v2];
      if (v7 < v8)
      {
        *(void *)&result[2 * (int)v3] = v8;
        *(void *)&result[2 * v2] = v7;
        unint64_t v6 = *(void *)&result[2 * v4];
        unint64_t v8 = v7;
      }
      if (v6 < v8)
      {
        *(void *)&result[2 * v4] = v8;
        *(void *)&result[2 * v2] = v6;
        unint64_t v6 = *(void *)&result[2 * v4];
      }
      unint64_t v9 = *(void *)&result[2 * (int)v3];
      if (v9 < v6)
      {
        *(void *)&result[2 * (int)v3] = v6;
        *(void *)&result[2 * v4] = v9;
        unint64_t v6 = v9;
      }
      int v10 = v3 + 1;
      int v11 = v2;
      while (1)
      {
        uint64_t v12 = &result[2 * v10 + 2];
        do
        {
          unint64_t v14 = *(void *)v12;
          v12 += 2;
          unint64_t v13 = v14;
          ++v10;
        }
        while (v14 > v6);
        int v15 = &result[2 * v11];
        do
        {
          unint64_t v17 = *((void *)v15 - 1);
          v15 -= 2;
          unint64_t v16 = v17;
          --v11;
        }
        while (v17 < v6);
        if (v11 + 1 <= v10) {
          break;
        }
        *((void *)v12 - 1) = v16;
        *(void *)int v15 = v13;
      }
      *(void *)&result[2 * v4] = v16;
      *(void *)int v15 = v6;
      uint64_t v18 = (int)v1;
      uint64_t v1 = (int)v1 + 2;
      if (v2 - v10 + 1 < v11 - (int)v3)
      {
        v23[(int)v1] = v11 - 1;
        v23[v18 + 1] = v3;
        LODWORD(v3) = v10;
        goto LABEL_2;
      }
      v23[v1] = v2;
      v23[v18 + 1] = v10;
      int v2 = v11 - 1;
    }
    if (v2 > (int)v3)
    {
      uint64_t v3 = (int)v3;
      do
      {
        uint64_t v19 = v3++;
        unint64_t v20 = *(void *)&result[2 * v3];
        if (v19 >= 1)
        {
          while (1)
          {
            unint64_t v21 = *(void *)&result[2 * v19];
            if (v21 >= v20) {
              break;
            }
            *(void *)&result[2 * (v19 + 1)] = v21;
            BOOL v22 = __OFSUB__(v19, 1);
            LODWORD(v19) = v19 - 1;
            if (((int)v19 < 0) ^ v22 | (v19 == 0))
            {
              LODWORD(v19) = 0;
              break;
            }
          }
        }
        *(void *)&result[2 * (int)v19 + 2] = v20;
      }
      while (v3 != v2);
    }
    if (v1)
    {
      LODWORD(v3) = v23[(int)v1 - 1];
      int v2 = v23[(int)v1];
      LODWORD(v1) = v1 - 2;
      continue;
    }
    return result;
  }
}

uint64_t mdb_mid2l_search(unsigned int *a1, unint64_t a2)
{
  unsigned int v2 = *a1;
  if (!*a1) {
    return 1;
  }
  int v3 = 0;
  do
  {
    unsigned int v4 = v2 >> 1;
    uint64_t v5 = v3 + (v2 >> 1) + 1;
    unint64_t v6 = *(void *)&a1[4 * v5];
    if (v6 <= a2)
    {
      if (v6 >= a2) {
        return v5;
      }
      unsigned int v4 = v2 + ~v4;
      v3 += (v2 >> 1) + 1;
    }
    unsigned int v2 = v4;
  }
  while (v4);
  if (v6 >= a2) {
    return v5;
  }
  else {
    return (v5 + 1);
  }
}

__n128 mdb_mid2l_insert(unsigned int *a1, unint64_t *a2)
{
  unint64_t v4 = *a2;
  unsigned int v5 = mdb_mid2l_search(a1, *a2);
  if (v5)
  {
    unint64_t v7 = *(void *)a1;
    if ((*(void *)a1 < (unint64_t)v5 || *(void *)&a1[4 * v5] != v4) && v7 <= 0x1FFFE)
    {
      unsigned int v8 = v7 + 1;
      *(void *)a1 = v7 + 1;
      if (v5 < (int)v7 + 1)
      {
        unint64_t v9 = &a1[4 * v7 + 4];
        int v10 = &a1[4 * v7];
        do
        {
          long long v11 = *(_OWORD *)v10;
          v10 -= 4;
          *(_OWORD *)unint64_t v9 = v11;
          v9 -= 4;
          --v8;
        }
        while (v5 < v8);
      }
      __n128 result = *(__n128 *)a2;
      *(_OWORD *)&a1[4 * v5] = *(_OWORD *)a2;
    }
  }
  return result;
}

__n128 mdb_mid2l_append(uint64_t *a1, __n128 *a2)
{
  if ((unint64_t)*a1 <= 0x1FFFE)
  {
    uint64_t v2 = *a1 + 1;
    *a1 = v2;
    __n128 result = *a2;
    *(__n128 *)&a1[2 * v2] = *a2;
  }
  return result;
}

void MTLArchiveUsageDB::store(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)std::string buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "mdb_put error: %s", buf, 0xCu);
}

void MTLArchiveUsageDB::prune(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)std::string buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "mdb_cursor_open error: %s", buf, 0xCu);
}

void ___ZN17MTLAssetUpgraderD26listPrioritizedAppLaunchesEv_block_invoke_cold_1(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v6, "appLaunch iteration error: %s\n", v7);
}

void MTLAssetUpgraderD::getArchiveType()
{
  OUTLINED_FUNCTION_8(__stack_chk_guard);
  int v2 = 136315138;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v1, "addRecompilationWork: failed to get archive type of '%s'", (uint8_t *)&v2);
}

{
  uint8_t v0[24];

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "addRecompilationWork: %s - %s", v0, 0x16u);
}

void MTLAssetUpgraderD::getDynamicLibraryType()
{
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "addRecompilationWork: %s - %s", v0, 0x16u);
}

void MTLAssetUpgraderD::addRecompilationWork(uint8_t *buf, unsigned char *a2)
{
  *std::string buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "addRecompilationWork: queued recompilation", buf, 2u);
}

void MTLAssetUpgraderD::getCacheDirectory()
{
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "Cache directory identification failed: %@", v4);
}

void MTLWorkQueue<RecompilationWork>::push(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

{
  OUTLINED_FUNCTION_2((void *)&_mh_execute_header, &_os_log_default, a3, "skipping adding duplicate item to work queue", a5, a6, a7, a8, 0);
}

void MTLWorkQueue<RecompilationWork>::push(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_cursor_get failure: %s", v3);
}

{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_put error: %s", v3);
}

{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_cursor_open error: %s", v3);
}

void MTLAssetUpgraderD::processAppEvent(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)std::string buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "processAppEvent: metallib: %@", buf, 0xCu);
}

void MTLAssetUpgraderD::processAppEvent()
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "processAppEvent: bundleURL %@", v0, 0xCu);
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v0, "App handler event with no name: %s", v1);
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v0, "Unexpected distnoted event: %s", v1);
}

void ___ZN17MTLAssetUpgraderD15setupAppHandlerEv_block_invoke_cold_5()
{
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "App handler executed event: %s", v0, 0xCu);
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN17MTLAssetUpgraderD23setupXPCActivityHandlerEv_block_invoke_91_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MTLWorkQueue<RecompilationWork>::pop(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_cursor_del error: %s", v3);
}

void MTLAssetUpgraderD::remapTemporary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_3(a1, a2, a3, a4, 4.8152e-34);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: replacement of '%s' with '%s' failed - %s", v4, 0x20u);
}

void MTLAssetUpgraderD::recompileSingleStep()
{
  OUTLINED_FUNCTION_4();
  int v2 = *(_DWORD *)(v1 + 12);
  int v3 = *(_DWORD *)(v1 + 16);
  *(_DWORD *)uint64_t v4 = 136315650;
  *(void *)(v4 + 4) = v5;
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = v2;
  *(_WORD *)(v4 + 18) = 1024;
  *(_DWORD *)(v4 + 20) = v3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: detected crash for work item (%s, %08X %08X) - skipping", v6, 0x18u);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "recompilation: creation of target archive failed': %@", v4);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "recompilation: serialization of dynamic library %@ failed", v4);
}

{
  uint64_t v0;
  uint8_t v1[12];
  __int16 v2;
  uint64_t v3;

  OUTLINED_FUNCTION_6();
  int v2 = 2112;
  int v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: temp directory unavailable '%@': %@", v1, 0x16u);
}

{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_1(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "recompilation: not on filesystem - archive %@ ", v4);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4();
  *(_DWORD *)uint64_t v1 = 136315138;
  *(void *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v3, "recompilation: invalid app for recompilation bundleID=%s", v4);
  if (*(char *)(v0 + 23) < 0) {
    operator delete(*(void **)v0);
  }
}

void MTLAssetUpgraderD::recompileSingleStep(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)a1 + 8);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: unknown recompilation work type %d", (uint8_t *)v2, 8u);
}

void MTLAssetUpgraderD::recompileSingleStep(void *a1, void *a2, uint8_t *buf)
{
  *(_DWORD *)std::string buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "recompilation: open/rebuild of dynamic library %@ failed: %@", buf, 0x16u);
}

void MTLWorkQueue<RecompilationWork>::setState(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1(a1, a2, 4.8149e-34);
  OUTLINED_FUNCTION_0((void *)&_mh_execute_header, &_os_log_default, v2, "mdb_cursor_put error: %s", v3);
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___ZN17MTLAssetUpgraderD25kickRecompilationActivityEv_block_invoke_cold_3(int a1, uint8_t *buf)
{
  *(_DWORD *)std::string buf = 67109120;
  *((_DWORD *)buf + 1) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "com.apple.MTLAssetUpgraderD.recompilationActivity: entered state %d", buf, 8u);
}

void MTLArchiveMapDB::store(char *a1, void *a2, uint64_t *a3)
{
  if (*a1 >= 0) {
    int v3 = a2;
  }
  else {
    int v3 = (void *)*a2;
  }
  if (*((char *)a3 + 23) >= 0) {
    uint64_t v4 = a3;
  }
  else {
    uint64_t v4 = (uint64_t *)*a3;
  }
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 2080;
  unsigned int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "storeArchive('%s', '%s') invalid payload", (uint8_t *)&v5, 0x16u);
}

void MTLVersionedDB::openDB(int a1, int a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "db version mismatch: file %u, current %u", (uint8_t *)v2, 0xEu);
}

void MTLVersionedDB::openDB(char *a1, void *a2, int a3)
{
  if (*a1 >= 0) {
    __int16 v3 = a2;
  }
  else {
    __int16 v3 = (void *)*a2;
  }
  int v4 = 136315394;
  int v5 = v3;
  __int16 v6 = 2080;
  __int16 v7 = mdb_strerror(a3);
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "mdb_env_open(\"%s\") error: %s", (uint8_t *)&v4, 0x16u);
}

void MTLVersionedDB::openDB(int a1)
{
  mdb_strerror(a1);
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, &_os_log_default, v1, "mdb_env_create error: %s", v2, v3, v4, v5, 2u);
}

void MTLVersionedDB::MTLVersionedDB(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void MTLVersionedDB::MTLVersionedDB()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Database invalid - resetting", v0, 2u);
}

void MTLVersionedDB::Transaction::Transaction(int a1)
{
  mdb_strerror(a1);
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, &_os_log_default, v1, "mdb_dbi_open error: %s", v2, v3, v4, v5, 2u);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  mdb_strerror(a1);
  OUTLINED_FUNCTION_0_0((void *)&_mh_execute_header, &_os_log_default, v1, "mdb_txn_begin error: %s", v2, v3, v4, v5, 2u);
}

void MTLVersionedDB::Transaction::~Transaction(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)std::string buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "mdb_txn_commit error: %s", buf, 0xCu);
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::string::size_type std::string::copy(const std::string *this, std::string::value_type *__s, std::string::size_type __n, std::string::size_type __pos)
{
  return std::string::copy(this, __s, __n, __pos);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return std::logic_error::logic_error(this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return std::bad_array_new_length::bad_array_new_length(this);
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::chrono::steady_clock::time_point std::chrono::steady_clock::now(void)
{
  return std::chrono::steady_clock::now();
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
  return ___cxa_allocate_exception(thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return ___error();
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

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_main(void)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int fsync(int a1)
{
  return _fsync(a1);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int madvise(void *a1, size_t a2, int a3)
{
  return _madvise(a1, a2, a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_posix_memalign(memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return _memchr(__s, __c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return _msync(a1, a2, a3);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return _pthread_cond_destroy(a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return _pthread_cond_init(a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return _pthread_cond_signal(a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return _pthread_join(a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

int pthread_key_delete(pthread_key_t a1)
{
  return _pthread_key_delete(a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_destroy(a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return _pthread_mutexattr_init(a1);
}

int pthread_mutexattr_setpshared(pthread_mutexattr_t *a1, int a2)
{
  return _pthread_mutexattr_setpshared(a1, a2);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

int pthread_sigmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return _pthread_sigmask(a1, a2, a3);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return _pwrite(__fd, __buf, __nbyte, a4);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return _renamex_np(a1, a2, a3);
}

int sigwait(const sigset_t *a1, int *a2)
{
  return _sigwait(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return _writev(a1, a2, a3);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_App(void *a1, const char *a2, ...)
{
  return [a1 App];
}

id objc_msgSend_InFocus(void *a1, const char *a2, ...)
{
  return [a1 InFocus];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_archiveFunctionIds(void *a1, const char *a2, ...)
{
  return [a1 archiveFunctionIds];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_cpuType(void *a1, const char *a2, ...)
{
  return [a1 cpuType];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return [a1 publisher];
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return [a1 starting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_subType(void *a1, const char *a2, ...)
{
  return [a1 subType];
}

id objc_msgSend_targetDeviceArchitecture(void *a1, const char *a2, ...)
{
  return [a1 targetDeviceArchitecture];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

const char *mdb_version(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  if (a1) {
    *a1 = 0;
  }
  if (a2) {
    *a2 = 9;
  }
  if (a3) {
    *a3 = 70;
  }
  return "LMDB 0.9.70: (December 19, 2015)";
}

uint64_t mdb_env_share_locks(uint64_t a1, int *a2)
{
  *(void *)(*(void *)(a1 + 64) + 8) = *(void *)(*(void *)(a1
                                                                  + 72
                                                                  + 8
                                                                  * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72) + 128) < *(void *)(*(void *)(a1 + 80) + 128))))
                                                      + 128);
  uint64_t v7 = 0x100000000;
  long long v6 = xmmword_10001B880;
  do
  {
    uint64_t result = fcntl(*(_DWORD *)(a1 + 4), 8, &v6);
    if (!result) {
      break;
    }
    uint64_t result = *__error();
  }
  while (result == 4);
  if (result) {
    int v5 = -1;
  }
  else {
    int v5 = 0;
  }
  *a2 = v5;
  return result;
}

uint64_t mdb_env_create(void *a1)
{
  uint64_t v2 = malloc_type_calloc(1uLL, 0xF8uLL, 0x10B004020E85D84uLL);
  if (!v2) {
    return 12;
  }
  uint64_t v3 = v2;
  v2[6] = 126;
  *((void *)v2 + 4) = 0x200000002;
  *(void *)uint64_t v2 = -1;
  _DWORD v2[2] = -1;
  v2[10] = getpid();
  int v4 = sysconf(29);
  uint64_t result = 0;
  v3[5] = v4;
  *a1 = v3;
  return result;
}

uint64_t mdb_env_set_mapsize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  int v4 = *(void **)(a1 + 56);
  if (!v4) {
    goto LABEL_12;
  }
  if (*(void *)(a1 + 96)) {
    return 22;
  }
  uint64_t v6 = *(void *)(a1
                 + 72
                 + 8
                 * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72) + 128) < *(void *)(*(void *)(a1 + 80) + 128))));
  if (!a2) {
    unint64_t v2 = *(void *)(v6 + 16);
  }
  unint64_t v7 = *(unsigned int *)(a1 + 16) + *(unsigned int *)(a1 + 16) * *(void *)(v6 + 120);
  if (v2 <= v7) {
    unint64_t v2 = v7;
  }
  munmap(v4, *(void *)(a1 + 112));
  *(void *)(a1 + 112) = v2;
  unsigned int v8 = (*(unsigned char *)(a1 + 12) & 1) != 0 ? *(char **)(a1 + 56) : 0;
  uint64_t result = mdb_env_map(a1, v8);
  if (!result)
  {
LABEL_12:
    *(void *)(a1 + 112) = v2;
    unint64_t v9 = *(unsigned int *)(a1 + 16);
    uint64_t result = 0;
    if (v9) {
      *(void *)(a1 + 128) = v2 / v9;
    }
  }
  return result;
}

uint64_t mdb_env_map(uint64_t a1, char *a2)
{
  int v4 = *(_DWORD *)(a1 + 12);
  if ((v4 & 0x80000) != 0)
  {
    if (ftruncate(*(_DWORD *)a1, *(void *)(a1 + 112)) < 0) {
      return *__error();
    }
    int v5 = 3;
  }
  else
  {
    int v5 = 1;
  }
  uint64_t v6 = (char *)mmap(a2, *(void *)(a1 + 112), v5, 1, *(_DWORD *)a1, 0);
  *(void *)(a1 + 56) = v6;
  if (v6 == (char *)-1)
  {
    *(void *)(a1 + 56) = 0;
    return *__error();
  }
  if ((v4 & 0x800000) != 0)
  {
    madvise(v6, *(void *)(a1 + 112), 1);
    uint64_t v6 = *(char **)(a1 + 56);
  }
  if (a2 && v6 != a2) {
    return 16;
  }
  uint64_t v7 = 0;
  uint64_t v8 = (uint64_t)&v6[*(unsigned int *)(a1 + 16) + 16];
  *(void *)(a1 + 72) = v6 + 16;
  *(void *)(a1 + 80) = v8;
  return v7;
}

uint64_t mdb_env_set_maxdbs(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 56)) {
    return 22;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 36) = a2 + 2;
  return result;
}

uint64_t mdb_env_set_maxreaders(uint64_t a1, int a2)
{
  uint64_t result = 22;
  if (a2)
  {
    if (!*(void *)(a1 + 56))
    {
      uint64_t result = 0;
      *(_DWORD *)(a1 + 24) = a2;
    }
  }
  return result;
}

uint64_t mdb_env_get_maxreaders(uint64_t a1, _DWORD *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 24);
    }
  }
  return result;
}

uint64_t mdb_env_open(uint64_t a1, const char *a2, int a3, unsigned int a4)
{
  int v26 = -1;
  uint64_t v4 = 22;
  if ((a3 & 0xFC00BFFE) != 0) {
    return v4;
  }
  if (*(_DWORD *)a1 != -1) {
    return v4;
  }
  uint64_t v24 = 0;
  __int16 v25 = 0;
  int v8 = *(_DWORD *)(a1 + 12) | a3;
  uint64_t v4 = mdb_fname_init(a2, v8, (uint64_t)&v24);
  if (v4) {
    return v4;
  }
  unsigned int v9 = v8 | 0x20000000;
  if ((v8 & 0x20000) != 0)
  {
    unsigned int v9 = v8 & 0xDFF7FFFF | 0x20000000;
  }
  else
  {
    int v10 = mdb_midl_alloc(0x1FFFF);
    *(void *)(a1 + 200) = v10;
    if (!v10
      || (long long v11 = malloc_type_calloc(0x20000uLL, 0x10uLL, 0x108004057E67DB5uLL), (*(void *)(a1 + 208) = v11) == 0))
    {
      *(_DWORD *)(a1 + 12) = v9;
LABEL_35:
      uint64_t v4 = 12;
      goto LABEL_36;
    }
  }
  *(_DWORD *)(a1 + 12) = v9;
  *(void *)(a1 + 48) = strdup(a2);
  *(void *)(a1 + 136) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 0x30uLL, 0x1080040226B62D8uLL);
  *(void *)(a1 + 144) = malloc_type_calloc(*(unsigned int *)(a1 + 36), 2uLL, 0x1000040BDFB0063uLL);
  uint64_t v12 = malloc_type_calloc(*(unsigned int *)(a1 + 36), 4uLL, 0x100004052888210uLL);
  *(void *)(a1 + 152) = v12;
  uint64_t v13 = *(void *)(a1 + 136);
  if (!v13 || !*(void *)(a1 + 48)) {
    goto LABEL_35;
  }
  uint64_t v4 = 12;
  if (!*(void *)(a1 + 144) || !v12) {
    goto LABEL_36;
  }
  *(void *)(v13 + 16) = mdb_cmp_long;
  if ((v9 & 0x420000) == 0)
  {
    uint64_t v4 = mdb_env_setup_locks(a1, (int *)&v24, a4, &v26);
    if (v4) {
      goto LABEL_36;
    }
    if ((v9 & 0x2000000) != 0 && !v26)
    {
      uint64_t v4 = 35;
      goto LABEL_36;
    }
  }
  int v14 = v9 & 0x20000;
  if ((v9 & 0x20000) != 0) {
    int v15 = 0;
  }
  else {
    int v15 = 514;
  }
  uint64_t v4 = mdb_fopen((unsigned int *)a1, (int *)&v24, v15, a4, (int *)a1);
  if (v4) {
    goto LABEL_36;
  }
  if ((v9 & 0x420000) == 0x20000)
  {
    uint64_t v4 = mdb_env_setup_locks(a1, (int *)&v24, a4, &v26);
    if (v4) {
      goto LABEL_36;
    }
  }
  uint64_t v4 = mdb_env_open2(a1, v9 & 0x2000000);
  if (v4) {
    goto LABEL_36;
  }
  uint64_t v4 = mdb_fopen((unsigned int *)a1, (int *)&v24, 20971521, a4, (int *)(a1 + 8));
  if (v4) {
    goto LABEL_36;
  }
  if ((v9 & 0x2000000) != 0 || v26 < 1)
  {
    if (v14)
    {
      uint64_t v4 = 0;
      goto LABEL_37;
    }
LABEL_32:
    int v17 = *(_DWORD *)(a1 + 36);
    uint64_t v18 = malloc_type_calloc(1uLL, *(unsigned int *)(a1 + 16), 0x78DA1B97uLL);
    *(void *)(a1 + 88) = v18;
    if (v18)
    {
      uint64_t v19 = malloc_type_calloc(1uLL, 61 * v17 + 136, 0xC025CA4FuLL);
      if (v19)
      {
        uint64_t v4 = 0;
        v19[11] = v19 + 17;
        uint64_t v20 = *(unsigned int *)(a1 + 36);
        uint64_t v21 = (uint64_t)&v19[6 * v20 + 17];
        uint64_t v22 = v21 + 8 * v20;
        v19[12] = v22;
        v19[13] = v21;
        v19[14] = v22 + 4 * v20;
        v19[4] = a1;
        v19[10] = *(void *)(a1 + 136);
        *((_DWORD *)v19 + 31) = 1;
        *(void *)(a1 + 104) = v19;
        goto LABEL_37;
      }
    }
    goto LABEL_35;
  }
  uint64_t v16 = mdb_env_share_locks(a1, &v26);
  if (!(v16 | v14)) {
    goto LABEL_32;
  }
  uint64_t v4 = v16;
  if (v16) {
LABEL_36:
  }
    mdb_env_close1(a1);
LABEL_37:
  if (HIDWORD(v24)) {
    free(v25);
  }
  return v4;
}

uint64_t mdb_fname_init(const char *a1, int a2, uint64_t a3)
{
  int v5 = ~a2 & 0x404000;
  *(_DWORD *)(a3 + 4) = 0;
  int v6 = strlen(a1);
  *(_DWORD *)a3 = v6;
  if (v5)
  {
    int v8 = (char *)malloc_type_malloc(v6 + 10, 0x2E9E0525uLL);
    *(void *)(a3 + 8) = v8;
    if (v8)
    {
      *(_DWORD *)(a3 + 4) = 1;
      strcpy(v8, a1);
      return 0;
    }
    else
    {
      return 12;
    }
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a3 + 8) = a1;
  }
  return result;
}

uint64_t mdb_env_setup_locks(uint64_t a1, int *a2, unsigned __int16 a3, int *a4)
{
  int v6 = (int *)(a1 + 4);
  uint64_t v7 = mdb_fopen((unsigned int *)a1, a2, 16777734, a3, (int *)(a1 + 4));
  if (!v7)
  {
    if ((*(unsigned char *)(a1 + 14) & 0x20) == 0)
    {
      uint64_t v8 = pthread_key_create((pthread_key_t *)(a1 + 160), (void (__cdecl *)(void *))mdb_env_reader_dest);
      if (v8) {
        return v8;
      }
      *(_DWORD *)(a1 + 12) |= 0x10000000u;
    }
    uint64_t v16 = 0x300000000;
    pthread_mutexattr_t v15 = (pthread_mutexattr_t)xmmword_10001B880;
    do
    {
      if (!fcntl(*v6, 8, &v15)) {
        goto LABEL_12;
      }
      int v9 = *__error();
    }
    while (v9 == 4);
    if (v9)
    {
      WORD2(v16) = 1;
      do
      {
        if (!fcntl(*v6, 9, &v15))
        {
          LODWORD(v8) = 0;
          goto LABEL_13;
        }
        uint64_t v8 = *__error();
      }
      while (v8 == 4);
      if (!v8) {
        goto LABEL_13;
      }
      return v8;
    }
LABEL_12:
    LODWORD(v8) = 1;
LABEL_13:
    *a4 = v8;
    off_t v10 = lseek(*v6, 0, 2);
    if (v10 != -1)
    {
      int64_t v11 = ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256;
      if (v10 >= v11 || *a4 < 1)
      {
        *(_DWORD *)(a1 + 24) = ((unint64_t)(v10 + 0x3FFFFFFF00) >> 6) + 1;
        int64_t v11 = v10;
      }
      else if (ftruncate(*v6, ((unint64_t)(*(_DWORD *)(a1 + 24) - 1) << 6) + 256))
      {
        return *__error();
      }
      uint64_t v12 = (char *)mmap(0, v11, 3, 1, *v6, 0);
      if (v12 != (char *)-1)
      {
        *(void *)(a1 + 64) = v12;
        if (*a4 < 1)
        {
          if (*(_DWORD *)v12 != -1091583778) {
            return 4294936503;
          }
          if (*((_DWORD *)v12 + 1) != 774479874) {
            return 4294936502;
          }
          uint64_t v8 = *__error();
          if (v8 <= 0x23 && ((1 << v8) & 0x800002001) != 0) {
            return 0;
          }
        }
        else
        {
          v15.__sig = 0;
          *(void *)v15.__opaque = 0;
          *(_OWORD *)(v12 + 24) = 0u;
          *(_OWORD *)(v12 + 40) = 0u;
          *(_OWORD *)(v12 + 56) = 0u;
          *(_OWORD *)(v12 + 72) = 0u;
          uint64_t v13 = *(_OWORD **)(a1 + 64);
          v13[8] = 0u;
          v13[9] = 0u;
          v13[10] = 0u;
          v13[11] = 0u;
          uint64_t v8 = pthread_mutexattr_init(&v15);
          if (!v8)
          {
            uint64_t v8 = pthread_mutexattr_setpshared(&v15, 1);
            if (v8
              || (uint64_t v8 = pthread_mutex_init((pthread_mutex_t *)(*(void *)(a1 + 64) + 24), &v15), v8))
            {
              pthread_mutexattr_destroy(&v15);
            }
            else
            {
              uint64_t v8 = pthread_mutex_init((pthread_mutex_t *)(*(void *)(a1 + 64) + 128), &v15);
              pthread_mutexattr_destroy(&v15);
              if (!v8)
              {
                **(_DWORD **)(a1 + 64) = -1091583778;
                *(_DWORD *)(*(void *)(a1 + 64) + 4) = 774479874;
                *(void *)(*(void *)(a1 + 64) + 8) = 0;
                *(_DWORD *)(*(void *)(a1 + 64) + 16) = 0;
              }
            }
          }
        }
        return v8;
      }
    }
    return *__error();
  }
  uint64_t v8 = v7;
  if (v7 == 30)
  {
    if ((*(unsigned char *)(a1 + 14) & 2) == 0) {
      return 30;
    }
    return 0;
  }
  return v8;
}

uint64_t mdb_fopen(unsigned int *a1, int *a2, int a3, unsigned int a4, int *a5)
{
  if (a2[1]) {
    strcpy((char *)(*((void *)a2 + 1) + *a2), (&(&mdb_suffixes)[2 * (a3 == 16777734)])[((unint64_t)a1[3] >> 14) & 1]);
  }
  int v10 = open(*((const char **)a2 + 1), a3 & 0x1400A03, a4);
  int v11 = v10;
  if (v10 == -1)
  {
    uint64_t result = *__error();
  }
  else
  {
    if (a3 == 16779777 && a1[4] >= a1[5]) {
      fcntl(v10, 48, 1);
    }
    uint64_t result = 0;
  }
  *a5 = v11;
  return result;
}

uint64_t mdb_env_open2(uint64_t a1, int a2)
{
  int v4 = 0;
  int v5 = *(_DWORD *)(a1 + 12);
  memset(v18, 0, 136);
  unint64_t v28 = 0;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v6 = 1;
  __std::string buf = 0u;
  while (1)
  {
    char v7 = v6;
    int v8 = pread(*(_DWORD *)a1, &__buf, 0x98uLL, v4);
    if (v8 != 152) {
      break;
    }
    uint64_t result = 4294936503;
    if ((BYTE10(__buf) & 8) == 0 || v20 != -1091583778) {
      goto LABEL_20;
    }
    if (DWORD1(v20) != 1)
    {
      uint64_t result = 4294936502;
      goto LABEL_20;
    }
    if (!v4) {
      goto LABEL_9;
    }
    if (!a2)
    {
      if (v28 <= *(void *)&v18[8]) {
        goto LABEL_10;
      }
LABEL_9:
      v18[0] = v20;
      v18[4] = v24;
      v18[3] = v23;
      v18[2] = v22;
      v18[1] = v21;
      *(void *)&v18[8] = v28;
      v18[7] = v27;
      v18[6] = v26;
      v18[5] = v25;
      goto LABEL_10;
    }
    if (v28 < *(void *)&v18[8]) {
      goto LABEL_9;
    }
LABEL_10:
    char v6 = 0;
    unsigned int v10 = DWORD2(v18[1]);
    v4 += DWORD2(v18[1]);
    if ((v7 & 1) == 0) {
      goto LABEL_44;
    }
  }
  if (!(v4 | v8))
  {
    uint64_t result = 2;
    goto LABEL_20;
  }
  if ((v8 & 0x80000000) == 0)
  {
    uint64_t result = 4294936503;
    goto LABEL_20;
  }
  uint64_t result = *__error();
  if (result)
  {
LABEL_20:
    if (result != 2) {
      return result;
    }
    char v11 = 0;
    unsigned int v10 = *(_DWORD *)(a1 + 20);
    if (v10 >= 0x8000) {
      unsigned int v10 = 0x8000;
    }
    *(_DWORD *)(a1 + 16) = v10;
    memset((char *)&v18[1] + 8, 0, 112);
    *(_OWORD *)((char *)v18 + 8) = 0u;
    *(void *)&v18[0] = 0x1BEEFC0DELL;
    WORD6(v18[1]) = *(_WORD *)(a1 + 12) | 8;
    *(void *)&v18[4] = -1;
    *(void *)&v18[1] = 0x100000;
    unint64_t v12 = *(void *)(a1 + 112);
    DWORD2(v18[1]) = v10;
    v18[7] = xmmword_10001B890;
    if (!v12) {
      goto LABEL_24;
    }
  }
  else
  {
    unsigned int v10 = DWORD2(v18[1]);
LABEL_44:
    *(_DWORD *)(a1 + 16) = v10;
    unint64_t v12 = *(void *)(a1 + 112);
    char v11 = 1;
    if (!v12)
    {
LABEL_24:
      unint64_t v12 = *(void *)&v18[1];
      *(void *)(a1 + 112) = *(void *)&v18[1];
    }
  }
  unint64_t v13 = v10 * *((void *)&v18[7] + 1) + v10;
  if (v12 < v13)
  {
    *(void *)(a1 + 112) = v13;
    unint64_t v12 = v13;
  }
  *(void *)&v18[1] = v12;
  int v14 = v5 & 1;
  if (v11)
  {
LABEL_28:
    char v15 = 1;
LABEL_33:
    if (v14) {
      uint64_t v16 = (char *)*((void *)&v18[0] + 1);
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t result = mdb_env_map(a1, v16);
    if (!result)
    {
      if (v15) {
        goto LABEL_41;
      }
      if (v14) {
        *((void *)&v18[0] + 1) = *(void *)(a1 + 56);
      }
      uint64_t result = mdb_env_init_meta(a1, (uint64_t)v18);
      if (!result)
      {
LABEL_41:
        uint64_t result = 0;
        unint64_t v17 = *(unsigned int *)(a1 + 16);
        *(_DWORD *)(a1 + 216) = ((v17 - 16) >> 3) - 1;
        *(_DWORD *)(a1 + 220) = (((v17 - 16) >> 1) & 0x7FFFFFFE) - 2;
        *(void *)(a1 + 128) = *(void *)(a1 + 112) / v17;
      }
    }
  }
  else
  {
    if (v5)
    {
      char v15 = 0;
      int v14 = 1;
      goto LABEL_33;
    }
    uint64_t result = mdb_env_init_meta(a1, (uint64_t)v18);
    if (!result)
    {
      int v14 = 0;
      goto LABEL_28;
    }
  }
  return result;
}

uint64_t mdb_env_close1(uint64_t result)
{
  if ((*(unsigned char *)(result + 15) & 0x20) != 0)
  {
    uint64_t v1 = result;
    unint64_t v2 = *(void **)(result + 136);
    if (v2)
    {
      uint64_t v3 = *(unsigned int *)(v1 + 36);
      if ((int)v3 >= 3)
      {
        unint64_t v4 = v3 + 1;
        do
          free(*(void **)(*(void *)(v1 + 136) + 48 * (v4-- - 2) + 8));
        while (v4 > 3);
        unint64_t v2 = *(void **)(v1 + 136);
      }
      free(v2);
    }
    free(*(void **)(v1 + 88));
    free(*(void **)(v1 + 152));
    free(*(void **)(v1 + 144));
    free(*(void **)(v1 + 48));
    free(*(void **)(v1 + 208));
    free(*(void **)(v1 + 104));
    mdb_midl_free(*(void *)(v1 + 200));
    if ((*(unsigned char *)(v1 + 15) & 0x10) != 0) {
      pthread_key_delete(*(void *)(v1 + 160));
    }
    int v5 = *(void **)(v1 + 56);
    if (v5) {
      munmap(v5, *(void *)(v1 + 112));
    }
    int v6 = *(_DWORD *)(v1 + 8);
    if (v6 != -1) {
      close(v6);
    }
    if (*(_DWORD *)v1 != -1) {
      close(*(_DWORD *)v1);
    }
    if (*(void *)(v1 + 64))
    {
      pid_t v7 = getpid();
      uint64_t v8 = *(unsigned int *)(v1 + 28);
      if ((int)v8 >= 1)
      {
        unint64_t v9 = v8 + 1;
        do
        {
          unint64_t v10 = *(void *)(v1 + 64) + ((unint64_t)(v9 - 2) << 6);
          int v12 = *(_DWORD *)(v10 + 200);
          char v11 = (_DWORD *)(v10 + 200);
          if (v12 == v7) {
            *char v11 = 0;
          }
          --v9;
        }
        while (v9 > 1);
      }
      munmap(*(void **)(v1 + 64), ((unint64_t)(*(_DWORD *)(v1 + 24) - 1) << 6) + 256);
    }
    uint64_t result = *(unsigned int *)(v1 + 4);
    if (result != -1) {
      uint64_t result = close(result);
    }
    *(_DWORD *)(v1 + 12) &= 0xCFFFFFFF;
  }
  return result;
}

void mdb_env_close(void *a1)
{
  if (a1)
  {
    while (1)
    {
      unint64_t v2 = (void *)a1[24];
      if (!v2) {
        break;
      }
      a1[24] = *v2;
      free(v2);
    }
    mdb_env_close1((uint64_t)a1);
    free(a1);
  }
}

size_t mdb_env_copyfd2(int *a1, int a2, char a3)
{
  if (a3)
  {
    uint64_t v73 = 0;
    long long v71 = 0u;
    long long v72 = 0u;
    *(_OWORD *)uint64_t v69 = 0u;
    long long v70 = 0u;
    memset(&v68, 0, sizeof(v68));
    *(_OWORD *)unsigned int v66 = 0u;
    memset(&v67, 0, sizeof(v67));
    pthread_t v64 = 0;
    long long v65 = 0;
    size_t v5 = pthread_mutex_init(&v67, 0);
    if (v5) {
      return v5;
    }
    size_t v9 = pthread_cond_init(&v68, 0);
    if (v9)
    {
      size_t v5 = v9;
      pthread_mutex_destroy(&v67);
      return v5;
    }
    *(void *)&memptr.st_dev = 0;
    size_t v14 = malloc_type_posix_memalign((void **)&memptr, a1[5], 0x200000uLL, 0xA3EC04BCuLL);
    if (v14)
    {
      size_t v5 = v14;
      goto LABEL_59;
    }
    uint64_t v15 = *(void *)&memptr.st_dev;
    v69[0] = *(void **)&memptr.st_dev;
    bzero(*(void **)&memptr.st_dev, 0x200000uLL);
    *(void *)&long long v72 = 2;
    v69[1] = (void *)(v15 + 0x100000);
    v66[0] = a1;
    DWORD2(v72) = a2;
    size_t v5 = pthread_create(&v64, 0, (void *(__cdecl *)(void *))mdb_env_copythr, v66);
    if (v5)
    {
LABEL_59:
      free(v69[0]);
      pthread_cond_destroy(&v68);
      pthread_mutex_destroy(&v67);
      if (!v5) {
        return HIDWORD(v73);
      }
      return v5;
    }
    unint64_t v63 = 0;
    int v16 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, (uint64_t *)&v65);
    if (v16)
    {
      unint64_t v17 = v65;
      goto LABEL_57;
    }
    long long v26 = v69[0];
    bzero(v69[0], (2 * a1[4]));
    *(void *)long long v26 = 0;
    v26[5] = 8;
    *((void *)v26 + 2) = 0x1BEEFC0DELL;
    *((void *)v26 + 4) = *((void *)a1 + 14);
    uint64_t v27 = a1[4];
    *((_DWORD *)v26 + 10) = v27;
    v26[22] = *((_WORD *)a1 + 6) | 8;
    *((void *)v26 + 10) = -1;
    *((_OWORD *)v26 + 8) = xmmword_10001B890;
    *((void *)v26 + 3) = *(void *)(*((void *)a1 + 9) + 8);
    unint64_t v28 = (char *)v69[0] + v27;
    *(void *)unint64_t v28 = 1;
    *((_WORD *)v28 + 5) = 8;
    *((_OWORD *)v28 + 1) = *((_OWORD *)v26 + 1);
    long long v29 = *((_OWORD *)v26 + 2);
    long long v30 = *((_OWORD *)v26 + 3);
    long long v31 = *((_OWORD *)v26 + 4);
    *((_OWORD *)v28 + 5) = *((_OWORD *)v26 + 5);
    *((_OWORD *)v28 + 4) = v31;
    *((_OWORD *)v28 + 3) = v30;
    *((_OWORD *)v28 + 2) = v29;
    long long v32 = *((_OWORD *)v26 + 6);
    long long v33 = *((_OWORD *)v26 + 7);
    long long v34 = *((_OWORD *)v26 + 8);
    *((void *)v28 + 18) = *((void *)v26 + 18);
    *((_OWORD *)v28 + 8) = v34;
    *((_OWORD *)v28 + 7) = v33;
    *((_OWORD *)v28 + 6) = v32;
    unint64_t v17 = v65;
    uint64_t v35 = v65[11];
    unint64_t v63 = *(void *)(v35 + 88);
    if (v63 == -1)
    {
      int v42 = *(unsigned __int16 *)(v35 + 52);
      *((_WORD *)v28 + 46) = v42;
      uint64_t v38 = -1;
      if (!v42) {
        goto LABEL_54;
      }
    }
    else
    {
      uint64_t v62 = 0;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
      memset(&memptr, 0, sizeof(memptr));
      v45[0] = 0;
      v45[1] = 0;
      uint64_t v43 = 0;
      __int16 v44 = 0;
      mdb_cursor_init((uint64_t)&memptr, (uint64_t)v65, 0, 0);
      for (uint64_t i = 0; ; i += *v44)
      {
        int v16 = mdb_cursor_get((uint64_t)&memptr, v45, &v43, 8);
        if (v16) {
          break;
        }
      }
      if (v16 != -30798) {
        goto LABEL_57;
      }
      uint64_t v37 = v17[11];
      uint64_t v38 = v17[2] + ~(*(void *)(v37 + 8) + i + *(void *)(v37 + 16) + *(void *)(v37 + 24));
      *((void *)v28 + 17) = v38;
      long long v39 = *(_OWORD *)(v37 + 48);
      long long v40 = *(_OWORD *)(v37 + 64);
      uint64_t v41 = *(void *)(v37 + 80);
      *(_OWORD *)(v28 + 104) = v40;
      *(_OWORD *)(v28 + 88) = v39;
      *((void *)v28 + 15) = v41;
      *((void *)v28 + 16) = v38;
    }
    *((void *)v28 + 18) = 1;
LABEL_54:
    LODWORD(v71) = 2 * a1[4];
    v66[1] = v17;
    int v16 = mdb_env_cwalk((uint64_t)v66, &v63, 0);
    if (!v16)
    {
      if (v63 == v38)
      {
LABEL_58:
        mdb_env_cthr_toggle((uint64_t)v66, 17);
        size_t v5 = pthread_join(v64, 0);
        mdb_txn_abort((uint64_t)v17);
        goto LABEL_59;
      }
      int v16 = -30784;
    }
LABEL_57:
    HIDWORD(v73) = v16;
    goto LABEL_58;
  }
  v66[0] = 0;
  size_t v5 = mdb_txn_begin((uint64_t)a1, 0, 0x20000, (uint64_t *)v66);
  if (!v5)
  {
    if (*((void *)a1 + 8))
    {
      int v6 = v66[0];
      mdb_txn_end((unsigned int *)v66[0], 4);
      pid_t v7 = (pthread_mutex_t *)(*((void *)a1 + 8) + 128);
      size_t v5 = pthread_mutex_lock(v7);
      if (v5)
      {
LABEL_28:
        mdb_txn_abort((uint64_t)v66[0]);
        return v5;
      }
      uint64_t v8 = mdb_txn_renew0((uint64_t)v6);
      if (v8)
      {
        size_t v5 = v8;
        pthread_mutex_unlock(v7);
        goto LABEL_28;
      }
    }
    else
    {
      pid_t v7 = 0;
    }
    int v10 = a1[4];
    uint64_t v11 = (2 * v10);
    int v12 = (char *)*((void *)a1 + 7);
    if (v11)
    {
      size_t v5 = (2 * v10);
      while (1)
      {
        ssize_t v13 = write(a2, v12, v5);
        if (v13 < 0)
        {
          size_t v5 = *__error();
          goto LABEL_25;
        }
        if (!v13) {
          break;
        }
        v12 += v13;
        v5 -= v13;
        if (!v5) {
          goto LABEL_25;
        }
      }
      size_t v5 = 5;
    }
    else
    {
      size_t v5 = 0;
    }
LABEL_25:
    if (v7) {
      pthread_mutex_unlock(v7);
    }
    if (v5) {
      goto LABEL_28;
    }
    uint64_t v19 = *((void *)v66[0] + 2);
    uint64_t v20 = a1[4];
    int v21 = *a1;
    memset(&memptr, 0, sizeof(memptr));
    if (fstat(v21, &memptr))
    {
      size_t v5 = *__error();
      if (v5) {
        goto LABEL_28;
      }
      st_std::string::size_type size = 0;
    }
    else
    {
      st_std::string::size_type size = v19 * v20;
      if ((unint64_t)(v19 * v20) >= memptr.st_size) {
        st_std::string::size_type size = memptr.st_size;
      }
    }
    unint64_t v23 = st_size - v11;
    if (st_size == v11)
    {
      size_t v5 = 0;
    }
    else
    {
      while (1)
      {
        if (v23 >= 0x40000000) {
          size_t v24 = 0x40000000;
        }
        else {
          size_t v24 = v23;
        }
        ssize_t v25 = write(a2, v12, v24);
        if (v25 < 0)
        {
          size_t v5 = *__error();
          goto LABEL_28;
        }
        if (!v25) {
          break;
        }
        size_t v5 = 0;
        v12 += v25;
        v23 -= v25;
        if (!v23) {
          goto LABEL_28;
        }
      }
      size_t v5 = 5;
    }
    goto LABEL_28;
  }
  return v5;
}

size_t mdb_env_copyfd(int *a1, int a2)
{
  return mdb_env_copyfd2(a1, a2, 0);
}

size_t mdb_env_copy2(unsigned int *a1, const char *a2, char a3)
{
  uint64_t v9 = 0;
  int v10 = 0;
  int v8 = -1;
  size_t v5 = mdb_fname_init(a2, a1[3] | 0x400000, (uint64_t)&v9);
  if (!v5)
  {
    size_t v5 = mdb_fopen(a1, (int *)&v9, 16779777, 0x1B6u, &v8);
    if (HIDWORD(v9)) {
      free(v10);
    }
    if (!v5)
    {
      int v6 = v8;
      size_t v5 = mdb_env_copyfd2((int *)a1, v8, a3);
      if (close(v6) < 0 && !v5) {
        return *__error();
      }
    }
  }
  return v5;
}

size_t mdb_env_copy(unsigned int *a1, const char *a2)
{
  return mdb_env_copy2(a1, a2, 0);
}

uint64_t mdb_env_set_flags(uint64_t a1, int a2, int a3)
{
  if ((a2 & 0xFEEAFFFF) != 0) {
    return 22;
  }
  uint64_t result = 0;
  if (a3) {
    int v5 = *(_DWORD *)(a1 + 12) | a2;
  }
  else {
    int v5 = *(_DWORD *)(a1 + 12) & ~a2;
  }
  *(_DWORD *)(a1 + 12) = v5;
  return result;
}

uint64_t mdb_env_get_flags(uint64_t a1, int *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_DWORD *)(a1 + 12) & 0x3FF4001;
    }
  }
  return result;
}

uint64_t mdb_env_set_userctx(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(a1 + 232) = a2;
  return result;
}

uint64_t mdb_env_get_userctx(uint64_t result)
{
  if (result) {
    return *(void *)(result + 232);
  }
  return result;
}

uint64_t mdb_env_set_assert(uint64_t a1)
{
  if (a1) {
    return 0;
  }
  else {
    return 22;
  }
}

uint64_t mdb_env_get_path(uint64_t a1, void *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(void *)(a1 + 48);
    }
  }
  return result;
}

uint64_t mdb_env_get_fd(_DWORD *a1, _DWORD *a2)
{
  uint64_t result = 22;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *a1;
    }
  }
  return result;
}

__n128 mdb_env_stat(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v2 = *(void *)(a1
                     + 72
                     + 8
                     * ((*(_DWORD *)(a1 + 12) >> 25) & 1 ^ (*(void *)(*(void *)(a1 + 72) + 128) < *(void *)(*(void *)(a1 + 80) + 128))));
      int v3 = *(unsigned __int16 *)(v2 + 78);
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 16);
      *(_DWORD *)(a2 + 4) = v3;
      *(_OWORD *)(a2 + 8) = *(_OWORD *)(v2 + 80);
      __n128 result = *(__n128 *)(v2 + 96);
      *(__n128 *)(a2 + 24) = result;
    }
  }
  return result;
}

uint64_t mdb_env_info(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 22;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 72);
    uint64_t v5 = *(void *)(a1 + 80);
    uint64_t v3 = a1 + 72;
    int v6 = *(void **)(v3
                    + 8
                    * ((*(_DWORD *)(v3 - 60) >> 25) & 1 ^ (*(void *)(v4 + 128) < *(void *)(v5 + 128))));
    *(void *)a2 = v6[1];
    *(void *)(a2 + 16) = v6[15];
    *(void *)(a2 + 24) = v6[16];
    *(void *)(a2 + 8) = *(void *)(v3 + 40);
    *(_DWORD *)(a2 + 32) = *(_DWORD *)(v3 - 48);
    uint64_t v7 = *(void *)(v3 - 8);
    if (v7) {
      int v8 = *(_DWORD *)(v7 + 16);
    }
    else {
      int v8 = 0;
    }
    uint64_t v2 = 0;
    *(_DWORD *)(a2 + 36) = v8;
  }
  return v2;
}

__n128 mdb_stat(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (a1
    && a3
    && *(_DWORD *)(a1 + 120) > a2
    && (*(unsigned char *)(*(void *)(a1 + 112) + a2) & 8) != 0
    && (*(unsigned char *)(a1 + 124) & 0x13) == 0)
  {
    if ((*(unsigned char *)(*(void *)(a1 + 112) + a2) & 2) != 0)
    {
      uint64_t v11 = 0;
      memset(v10, 0, sizeof(v10));
      memset(v9, 0, sizeof(v9));
      mdb_cursor_init((uint64_t)v10, a1, a2, (uint64_t)v9);
    }
    uint64_t v6 = *(void *)(a1 + 88);
    *(_DWORD *)a3 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
    uint64_t v7 = v6 + 48 * a2;
    *(_DWORD *)(a3 + 4) = *(unsigned __int16 *)(v7 + 6);
    *(_OWORD *)(a3 + 8) = *(_OWORD *)(v7 + 8);
    __n128 result = *(__n128 *)(v7 + 24);
    *(__n128 *)(a3 + 24) = result;
  }
  return result;
}

uint64_t mdb_env_get_maxkeysize()
{
  return 511;
}

uint64_t mdb_reader_list(uint64_t a1, uint64_t (*a2)(const char *, uint64_t), uint64_t a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    uint64_t v6 = a2;
    if (a2)
    {
      uint64_t v7 = *(void *)(a1 + 64);
      if (v7)
      {
        uint64_t v8 = *(unsigned int *)(v7 + 16);
        if (!v8) {
          return v6("(no active readers)\n", a3);
        }
        uint64_t result = 0;
        uint64_t v9 = v7 + 208;
        int v10 = 1;
        do
        {
          if (*(_DWORD *)(v9 - 8))
          {
            if (*(void *)(v9 - 16) == -1) {
              snprintf(__str, 0x40uLL, "%10d %zx -\n");
            }
            else {
              snprintf(__str, 0x40uLL, "%10d %zx %zu\n");
            }
            if (v10)
            {
              uint64_t result = a2("    pid     thread     txnid\n", a3);
              if ((result & 0x80000000) != 0) {
                return result;
              }
            }
            uint64_t result = a2(__str, a3);
            if ((result & 0x80000000) != 0) {
              return result;
            }
            int v10 = 0;
            uint64_t v6 = a2;
          }
          v9 += 64;
          --v8;
        }
        while (v8);
        if (v10) {
          return v6("(no active readers)\n", a3);
        }
      }
      else
      {
        return a2("(no reader locks)\n", a3);
      }
    }
  }
  return result;
}

uint64_t mdb_reader_check(uint64_t a1, _DWORD *a2)
{
  if (!a1) {
    return 22;
  }
  if (a2) {
    *a2 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = *(unsigned int *)(v4 + 16);
  uint64_t v6 = (unsigned int *)malloc_type_malloc(4 * (v5 + 1), 0x100004052888210uLL);
  if (!v6) {
    return 12;
  }
  uint64_t v7 = v6;
  *uint64_t v6 = 0;
  if (v5)
  {
    uint64_t v8 = 0;
    int v9 = 0;
    int v10 = (pthread_mutex_t *)(v4 + 24);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = v11 + 192;
    uint64_t v29 = v11 + 200;
    while (1)
    {
      int v13 = *(_DWORD *)(v12 + (v8 << 6) + 8);
      if (v13 && v13 != *(_DWORD *)(a1 + 40))
      {
        uint64_t v14 = *v7;
        if (v14)
        {
          unsigned int v15 = 0;
          unsigned int v16 = *v7;
          do
          {
            while (1)
            {
              unsigned int v17 = v16 >> 1;
              unsigned int v18 = v15 + (v16 >> 1) + 1;
              int v19 = v13 - v7[v18];
              if (v19 >= 0) {
                break;
              }
              v16 >>= 1;
              if (!v17) {
                goto LABEL_17;
              }
            }
            if (!v19) {
              goto LABEL_36;
            }
            v16 += ~v17;
            unsigned int v15 = v18;
          }
          while (v16);
LABEL_17:
          unsigned int v20 = v19 <= 0 ? v18 : v18 + 1;
        }
        else
        {
          unsigned int v20 = 1;
        }
        uint64_t v21 = (v14 + 1);
        *uint64_t v7 = v21;
        if (v21 > v20)
        {
          uint64_t v22 = v21;
          do
            v7[v22--] = v7[v14--];
          while (v20 < (int)v14 + 1);
          uint64_t v21 = v14 + 1;
        }
        v7[v21] = v13;
        if (!mdb_reader_pid(a1, 7, v13))
        {
          uint64_t v23 = pthread_mutex_lock(v10);
          if (v23)
          {
            uint64_t v27 = v23;
            goto LABEL_43;
          }
          if (mdb_reader_pid(a1, 7, v13)) {
            uint64_t v24 = v5;
          }
          else {
            uint64_t v24 = v8;
          }
          if (v24 < v5)
          {
            int v25 = v5 - v24;
            long long v26 = (_DWORD *)(v29 + (v24 << 6));
            do
            {
              if (*v26 == v13)
              {
                *long long v26 = 0;
                ++v9;
              }
              v26 += 16;
              --v25;
            }
            while (v25);
          }
          pthread_mutex_unlock(v10);
        }
      }
LABEL_36:
      if (++v8 == v5) {
        goto LABEL_42;
      }
    }
  }
  int v9 = 0;
LABEL_42:
  uint64_t v27 = 0;
LABEL_43:
  free(v7);
  if (a2) {
    *a2 = v9;
  }
  return v27;
}

uint64_t mdb_env_init_meta(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(unsigned int *)(a1 + 16);
  uint64_t v5 = (char *)malloc_type_calloc(2uLL, v4, 0xB4D7345BuLL);
  if (!v5) {
    return 12;
  }
  uint64_t v6 = v5;
  *(void *)uint64_t v5 = 0;
  *((_WORD *)v5 + 5) = 8;
  *((_OWORD *)v5 + 1) = *(_OWORD *)a2;
  long long v7 = *(_OWORD *)(a2 + 16);
  long long v8 = *(_OWORD *)(a2 + 32);
  long long v9 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v5 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v5 + 4) = v9;
  *((_OWORD *)v5 + 3) = v8;
  *((_OWORD *)v5 + 2) = v7;
  long long v10 = *(_OWORD *)(a2 + 80);
  long long v11 = *(_OWORD *)(a2 + 96);
  long long v12 = *(_OWORD *)(a2 + 112);
  *((void *)v5 + 18) = *(void *)(a2 + 128);
  *((_OWORD *)v5 + 8) = v12;
  *((_OWORD *)v5 + 7) = v11;
  *((_OWORD *)v5 + 6) = v10;
  int v13 = &v5[v4];
  *(void *)int v13 = 1;
  *((_WORD *)v13 + 5) = 8;
  *((_OWORD *)v13 + 1) = *(_OWORD *)a2;
  long long v14 = *(_OWORD *)(a2 + 16);
  long long v15 = *(_OWORD *)(a2 + 32);
  long long v16 = *(_OWORD *)(a2 + 48);
  *((_OWORD *)v13 + 5) = *(_OWORD *)(a2 + 64);
  *((_OWORD *)v13 + 4) = v16;
  *((_OWORD *)v13 + 3) = v15;
  *((_OWORD *)v13 + 2) = v14;
  long long v17 = *(_OWORD *)(a2 + 80);
  long long v18 = *(_OWORD *)(a2 + 96);
  long long v19 = *(_OWORD *)(a2 + 112);
  *((void *)v13 + 18) = *(void *)(a2 + 128);
  *((_OWORD *)v13 + 8) = v19;
  *((_OWORD *)v13 + 7) = v18;
  *((_OWORD *)v13 + 6) = v17;
  size_t v20 = (2 * v4);
  while (1)
  {
    int v21 = pwrite(*(_DWORD *)a1, v6, v20, 0);
    if (v21 != -1) {
      break;
    }
    if (*__error() != 4) {
      goto LABEL_11;
    }
  }
  if (v21 < 0)
  {
LABEL_11:
    uint64_t v22 = *__error();
    goto LABEL_12;
  }
  if (v20 == v21) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = 28;
  }
LABEL_12:
  free(v6);
  return v22;
}

uint64_t mdb_env_copythr(uint64_t a1)
{
  sigset_t v18 = 4096;
  int v2 = pthread_sigmask(1, &v18, 0);
  if (v2) {
    *(_DWORD *)(a1 + 196) = v2;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  for (uint64_t i = 0; ; i ^= 1uLL)
  {
    while (1)
    {
      int v4 = *(_DWORD *)(a1 + 192);
      if (v4) {
        break;
      }
      pthread_cond_wait((pthread_cond_t *)(a1 + 80), (pthread_mutex_t *)(a1 + 16));
    }
    if (v4 == 16) {
      break;
    }
    uint64_t v5 = a1 + 4 * i;
    int v8 = *(_DWORD *)(v5 + 160);
    uint64_t v6 = (_DWORD *)(v5 + 160);
    int v7 = v8;
    uint64_t v9 = a1 + 8 * i;
    long long v10 = *(char **)(v9 + 128);
    long long v11 = v6 + 2;
    long long v12 = (const void **)(v9 + 144);
    while (1)
    {
      if (v7 >= 1)
      {
        while (1)
        {
          if (*(_DWORD *)(a1 + 196)) {
            goto LABEL_20;
          }
          unsigned int v13 = write(*(_DWORD *)(a1 + 184), v10, v7);
          if ((v13 & 0x80000000) != 0) {
            break;
          }
          if (!v13)
          {
            int v15 = 5;
LABEL_19:
            *(_DWORD *)(a1 + 196) = v15;
            goto LABEL_20;
          }
          v10 += v13;
          BOOL v14 = __OFSUB__(v7, v13);
          v7 -= v13;
          if ((v7 < 0) ^ v14 | (v7 == 0)) {
            goto LABEL_20;
          }
        }
        int v15 = *__error();
        if (!v15) {
          goto LABEL_20;
        }
        if (v15 == 32)
        {
          int v17 = 0;
          sigwait(&v18, &v17);
          int v15 = 32;
        }
        goto LABEL_19;
      }
LABEL_20:
      int v7 = *v11;
      if (!*v11) {
        break;
      }
      long long v10 = (char *)*v12;
      *long long v11 = 0;
    }
    *uint64_t v6 = 0;
    --*(_DWORD *)(a1 + 192);
    pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
  return 0;
}

uint64_t mdb_env_cwalk(uint64_t a1, unint64_t *a2, char a3)
{
  uint64_t v70 = 0;
  memset(v69, 0, sizeof(v69));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  unint64_t v4 = *a2;
  if (v4 == -1) {
    return 0;
  }
  LOWORD(v69[0]) = 1;
  *((void *)&v66 + 1) = *(void *)(a1 + 8);
  DWORD1(v69[0]) = *(_DWORD *)(*((void *)&v66 + 1) + 124) & 0xA0000;
  uint64_t v7 = mdb_page_get((uint64_t)&v65, v4, (unint64_t *)v69 + 1, 0);
  if (!v7)
  {
    uint64_t v7 = mdb_page_search_root((uint64_t)&v65, 0, 4);
    if (!v7)
    {
      int v8 = malloc_type_malloc(*(_DWORD *)(*(void *)a1 + 16) * LOWORD(v69[0]), 0xFFCC827BuLL);
      if (v8)
      {
        uint64_t v9 = v8;
        unsigned __int16 v10 = WORD1(v69[0]);
        if (WORD1(v69[0]))
        {
          unint64_t v11 = 0;
          LODWORD(v12) = *(_DWORD *)(*(void *)a1 + 16);
          unsigned int v13 = (char *)v8;
          do
          {
            mdb_page_copy(v13, *((_WORD **)v69 + v11 + 1), v12);
            *((void *)v69 + v11 + 1) = v13;
            uint64_t v12 = *(unsigned int *)(*(void *)a1 + 16);
            v13 += v12;
            ++v11;
            unsigned __int16 v10 = WORD1(v69[0]);
          }
          while (v11 < WORD1(v69[0]));
        }
        else
        {
          unsigned int v13 = (char *)v8;
        }
        if (LOWORD(v69[0]))
        {
          long long v58 = v9;
          int v15 = *(_DWORD *)(a1 + 188);
          int v59 = a3 & 4;
          while (1)
          {
            long long v16 = (_WORD *)*((void *)v69 + v10 + 1);
            pthread_t v64 = v16;
            unsigned int v17 = (unsigned __int16)v16[6] - 16;
            unsigned int v18 = v17 >> 1;
            __int16 v19 = v16[5];
            if ((v19 & 2) != 0)
            {
              if (v19 & 0x20 | v59) {
                BOOL v27 = 0;
              }
              else {
                BOOL v27 = v17 >= 2;
              }
              if (v27)
              {
                if (v18 <= 1) {
                  uint64_t v28 = 1;
                }
                else {
                  uint64_t v28 = v18;
                }
                uint64_t v29 = -v28;
                uint64_t v30 = 8;
                uint64_t v60 = -v28;
                do
                {
                  long long v31 = v64;
                  long long v32 = (char *)v64 + *((unsigned __int16 *)v64 + v30);
                  __int16 v33 = *((_WORD *)v32 + 2);
                  if (v33)
                  {
                    __src[0] = 0;
                    if (v64 != v13)
                    {
                      *((void *)v69 + WORD1(v69[0]) + 1) = v13;
                      mdb_page_copy(v13, v31, *(_DWORD *)(*(void *)a1 + 16));
                      pthread_t v64 = v13;
                      long long v32 = &v13[*(unsigned __int16 *)&v13[2 * v30]];
                    }
                    long long v40 = &v32[*((unsigned __int16 *)v32 + 3)];
                    unint64_t v41 = *((void *)v40 + 1);
                    *((void *)v40 + 1) = *(void *)(a1 + 176);
                    uint64_t v23 = mdb_page_get((uint64_t)&v65, v41, (unint64_t *)__src, 0);
                    if (v23) {
                      goto LABEL_59;
                    }
                    int v42 = *(_DWORD *)(a1 + 4 * v15 + 160);
                    if (v42 < 0x100000)
                    {
                      uint64_t v43 = v15;
                    }
                    else
                    {
                      uint64_t v23 = mdb_env_cthr_toggle(a1, 1);
                      if (v23) {
                        goto LABEL_59;
                      }
                      int v15 = *(_DWORD *)(a1 + 188);
                      uint64_t v43 = v15;
                      int v42 = *(_DWORD *)(a1 + 4 * v15 + 160);
                    }
                    uint64_t v44 = a1 + 8 * v43;
                    uint64_t v45 = a1 + 4 * v43;
                    long long v46 = (void *)(*(void *)(v44 + 128) + v42);
                    long long v47 = (unsigned int *)__src[0];
                    memcpy(v46, __src[0], *(unsigned int *)(*(void *)a1 + 16));
                    *long long v46 = *(void *)(a1 + 176);
                    *(void *)(a1 + 176) += v47[3];
                    uint64_t v48 = *(void *)a1;
                    *(_DWORD *)(v45 + 160) += *(_DWORD *)(*(void *)a1 + 16);
                    unsigned int v49 = v47[3];
                    if (v49 >= 2)
                    {
                      *(_DWORD *)(v45 + 168) = *(_DWORD *)(v48 + 16) * (v49 - 1);
                      *(void *)(v44 + 144) = (char *)v47 + *(unsigned int *)(v48 + 16);
                      uint64_t v23 = mdb_env_cthr_toggle(a1, 1);
                      if (v23) {
                        goto LABEL_59;
                      }
                      int v15 = *(_DWORD *)(a1 + 188);
                    }
                    uint64_t v29 = v60;
                  }
                  else if ((v33 & 2) != 0)
                  {
                    long long v62 = 0u;
                    long long v63 = 0u;
                    *(_OWORD *)__src = 0u;
                    if (v64 != v13)
                    {
                      *((void *)v69 + WORD1(v69[0]) + 1) = v13;
                      mdb_page_copy(v13, v31, *(_DWORD *)(*(void *)a1 + 16));
                      pthread_t v64 = v13;
                      long long v32 = &v13[*(unsigned __int16 *)&v13[2 * v30]];
                    }
                    long long v34 = &v32[*((unsigned __int16 *)v32 + 3) + 8];
                    long long v35 = *(_OWORD *)v34;
                    long long v36 = *((_OWORD *)v34 + 2);
                    long long v62 = *((_OWORD *)v34 + 1);
                    long long v63 = v36;
                    *(_OWORD *)__src = v35;
                    *(_DWORD *)(a1 + 188) = v15;
                    uint64_t v23 = mdb_env_cwalk(a1, (char *)&v63 + 8, *((_WORD *)v32 + 2) & 4);
                    if (v23) {
                      goto LABEL_59;
                    }
                    int v15 = *(_DWORD *)(a1 + 188);
                    uint64_t v37 = &v32[*((unsigned __int16 *)v32 + 3) + 8];
                    long long v39 = v62;
                    long long v38 = v63;
                    *(_OWORD *)uint64_t v37 = *(_OWORD *)__src;
                    *((_OWORD *)v37 + 1) = v39;
                    *((_OWORD *)v37 + 2) = v38;
                  }
                  ++v30;
                }
                while (v29 + v30 != 8);
              }
            }
            else
            {
              size_t v20 = (char *)&v65 + 2 * v10;
              unsigned __int16 v21 = *((_WORD *)v20 + 164) + 1;
              *((_WORD *)v20 + 164) = v21;
              if (v18 > v21)
              {
                for (uint64_t i = (char *)v16 + (unsigned __int16)v16[v21 + 8];
                      ;
                      uint64_t i = &v25[*(unsigned __int16 *)&v25[2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 4) + 16]])
                {
                  uint64_t v23 = mdb_page_get((uint64_t)&v65, *(unsigned int *)i | ((unint64_t)*((unsigned __int16 *)i + 2) << 32), (unint64_t *)&v64, 0);
                  if (v23) {
                    break;
                  }
                  unsigned __int16 v10 = WORD1(v69[0]) + 1;
                  WORD1(v69[0]) = v10;
                  __int16 v24 = ++LOWORD(v69[0]);
                  *((_WORD *)&v69[16] + v10 + 4) = 0;
                  int v25 = (char *)v64;
                  long long v26 = (char **)v69 + v10 + 1;
                  if ((*((unsigned char *)v64 + 10) & 1) == 0)
                  {
                    *long long v26 = (char *)v64;
                    goto LABEL_56;
                  }
                  mdb_page_copy(*v26, v64, *(_DWORD *)(*(void *)a1 + 16));
                }
LABEL_59:
                uint64_t v7 = v23;
                goto LABEL_60;
              }
            }
            int v50 = *(_DWORD *)(a1 + 4 * v15 + 160);
            if (v50 < 0x100000)
            {
              uint64_t v51 = v15;
            }
            else
            {
              uint64_t v23 = mdb_env_cthr_toggle(a1, 1);
              if (v23) {
                goto LABEL_59;
              }
              int v15 = *(_DWORD *)(a1 + 188);
              uint64_t v51 = v15;
              int v50 = *(_DWORD *)(a1 + 4 * v15 + 160);
            }
            uint64_t v52 = a1 + 4 * v51;
            uint64_t v53 = *(void *)(a1 + 8 * v51 + 128) + v50;
            mdb_page_copy((char *)v53, v64, *(_DWORD *)(*(void *)a1 + 16));
            uint64_t v54 = *(void *)(a1 + 176);
            *(void *)(a1 + 176) = v54 + 1;
            *(void *)uint64_t v53 = v54;
            *(_DWORD *)(v52 + 160) += *(_DWORD *)(*(void *)a1 + 16);
            __int16 v55 = WORD1(v69[0]);
            if (!WORD1(v69[0]))
            {
              uint64_t v7 = 0;
              *a2 = *(void *)v53;
              goto LABEL_60;
            }
            uint64_t v56 = *((void *)v69 + WORD1(v69[0]));
            uint64_t v57 = v56
                + *(unsigned __int16 *)(v56
                                      + 2 * *((unsigned __int16 *)&v69[16] + WORD1(v69[0]) + 3)
                                      + 16);
            *(_DWORD *)uint64_t v57 = *(void *)v53;
            *(_WORD *)(v57 + 4) = *(_DWORD *)(v53 + 4);
            if (!LOWORD(v69[0])) {
              goto LABEL_63;
            }
            if (!--LOWORD(v69[0])) {
              break;
            }
            unsigned __int16 v10 = v55 - 1;
            WORD1(v69[0]) = v10;
            __int16 v24 = 1;
LABEL_56:
            if (!v24)
            {
LABEL_63:
              uint64_t v7 = 0;
              goto LABEL_60;
            }
          }
          uint64_t v7 = 0;
          DWORD1(v69[0]) &= ~1u;
LABEL_60:
          uint64_t v9 = v58;
        }
        else
        {
          uint64_t v7 = 0;
        }
        free(v9);
      }
      else
      {
        return 12;
      }
    }
  }
  return v7;
}

uint64_t mdb_env_cthr_toggle(uint64_t a1, int a2)
{
  unint64_t v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  *(_DWORD *)(a1 + 192) += a2;
  pthread_cond_signal((pthread_cond_t *)(a1 + 80));
  while ((*(unsigned char *)(a1 + 192) & 2) != 0)
    pthread_cond_wait((pthread_cond_t *)(a1 + 80), v4);
  pthread_mutex_unlock(v4);
  int v5 = *(_DWORD *)(a1 + 188) ^ a2 & 1;
  *(_DWORD *)(a1 + 188) = v5;
  *(_DWORD *)(a1 + 4 * v5 + 160) = 0;
  return *(unsigned int *)(a1 + 196);
}