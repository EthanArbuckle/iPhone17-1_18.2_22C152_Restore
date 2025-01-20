void sub_255F31F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
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

void sub_255F3243C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_255F343A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_255F3503C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_255F351F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_1(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_2(uint64_t result, char a2, uint64_t a3, float a4)
{
  if (a2) {
    uint64_t v4 = v5;
  }
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

void sub_255F39614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_255F3ADE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_255F3AEC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_255F3B0D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_255F3B400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26,char a27)
{
  _Block_object_dispose(&a21, 8);

  _Block_object_dispose(&a27, 8);
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table(v27 - 144);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void sub_255F3B534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, void **a4)
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
      if (v7 >= v8) {
        unint64_t v4 = v7 % v8;
      }
    }
    else
    {
      unint64_t v4 = (v8 - 1) & v7;
    }
    uint64_t v10 = *(void ***)(*(void *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (void *)*i)
      {
        unint64_t v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7) {
            return i;
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
      }
    }
  }
  uint64_t v13 = (void *)(a1 + 16);
  i = operator new(0x20uLL);
  void *i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
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
    std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__rehash<true>(a1, v19);
    unint64_t v8 = *(void *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
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
  v21 = *(void **)(*(void *)a1 + 8 * v4);
  if (v21)
  {
    void *i = *v21;
LABEL_38:
    void *v21 = i;
    goto LABEL_39;
  }
  void *i = *v13;
  *uint64_t v13 = i;
  *(void *)(v20 + 8 * v4) = v13;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
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
    v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_255F3B7D4(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__rehash<true>(uint64_t a1, size_t __n)
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
      std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
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
      uint64_t v11 = (void *)*v7;
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
            *uint64_t v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            uint64_t v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          uint64_t v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    uint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,void *>>>::operator()[abi:ne180100](uint64_t a1, id *a2)
{
  if (*(unsigned char *)(a1 + 8))
  {
  }
  else if (!a2)
  {
    return;
  }
  operator delete(a2);
}

uint64_t std::unordered_map<long,_HDMHDomainCount * {__strong}>::unordered_map(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__rehash<true>(a1, *(void *)(a2 + 8));
  for (i = *(void **)(a2 + 16); i; i = (void *)*i)
    std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::pair<long const,_HDMHDomainCount * {__strong}> const&>(a1, i + 2, i + 2);
  return a1;
}

void sub_255F3BB28(_Unwind_Exception *a1)
{
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void *std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__emplace_unique_key_args<long,std::pair<long const,_HDMHDomainCount * {__strong}> const&>(uint64_t a1, unint64_t *a2, void *a3)
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
      if (v6 >= v7) {
        unint64_t v3 = v6 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
    uint8x8_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      for (i = *v9; i; i = (void *)*i)
      {
        unint64_t v11 = i[1];
        if (v11 == v6)
        {
          if (i[2] == v6) {
            return i;
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
  unint64_t v12 = (void *)(a1 + 16);
  i = operator new(0x20uLL);
  void *i = 0;
  i[1] = v6;
  uint64_t v13 = (void *)a3[1];
  i[2] = *a3;
  i[3] = v13;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    BOOL v16 = 1;
    if (v7 >= 3) {
      BOOL v16 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v7);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__rehash<true>(a1, v19);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
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
  uint64_t v20 = *(void *)a1;
  v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    void *i = *v21;
LABEL_38:
    void *v21 = i;
    goto LABEL_39;
  }
  void *i = *v12;
  *unint64_t v12 = i;
  *(void *)(v20 + 8 * v3) = v12;
  if (*i)
  {
    unint64_t v22 = *(void *)(*i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7) {
        v22 %= v7;
      }
    }
    else
    {
      v22 &= v7 - 1;
    }
    v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void sub_255F3BD74(_Unwind_Exception *a1)
{
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,void *>>>::operator()[abi:ne180100](v2, v1);
  _Unwind_Resume(a1);
}

uint64_t std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::__unordered_map_hasher<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::hash<long>,std::equal_to<long>,true>,std::__unordered_map_equal<long,std::__hash_value_type<long,_HDMHDomainCount * {__strong}>,std::equal_to<long>,std::hash<long>,true>,std::allocator<std::__hash_value_type<long,_HDMHDomainCount * {__strong}>>>::__deallocate_node(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      unint64_t v3 = (id *)*v2;

      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void sub_255F3CEE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_255F3FBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_255F40FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_255F412D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_255F414A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

void sub_255F41924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

void sub_255F41D58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_255F4218C()
{
  uint64_t v1 = sub_255F49800();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388]();
  int8x8_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F07740], v1);
  unint64_t v5 = v0;
  sub_255F49810();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_unknownObjectWeakInit();
  *(void *)&v5[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState] = 0;
  unint64_t v6 = &v5[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime];
  *(void *)unint64_t v6 = 0;
  v6[8] = 1;
  *(void *)&v5[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex] = 0;

  unint64_t v7 = (objc_class *)type metadata accessor for MentalHealthDemoDataGenerator();
  v9.receiver = v5;
  v9.super_class = v7;
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_255F42320(uint64_t a1, void *a2)
{
  swift_unknownObjectWeakAssign();
  id v5 = *(id *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState);
  *(void *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState) = a2;
  id v4 = a2;
}

void sub_255F424C0(double a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
}

unint64_t sub_255F425F4()
{
  uint64_t v1 = sub_255F497F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  id v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t result = MEMORY[0x270FA5388](v3);
  uint8x8_t v8 = (char *)&v24 - v7;
  unint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex);
  if (v9 > 3)
  {
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v10 = (double *)((char *)&unk_2704ADD08 + 24 * v9);
  double v12 = v10[5];
  double v11 = v10[6];
  unint64_t result = sub_255F46DCC(0x20000000000001uLL);
  if (result == 0x20000000000000)
  {
    if (v12 < 1.0) {
      return 0;
    }
  }
  else if ((double)result * 1.11022302e-16 + 0.0 > v12)
  {
    return 0;
  }
  double v14 = v11 * 3600.0;
  if (v14 < 0.0) {
    goto LABEL_20;
  }
  if ((~*(void *)&v14 & 0x7FF0000000000000) == 0)
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_255F46DCC(0x20000000000001uLL);
  sub_255F497B0();
  sub_255F497A0();
  sub_255F46DCC(0x20000000000001uLL);
  uint64_t v15 = sub_255F49970();
  uint64_t v16 = v15;
  uint64_t v17 = *(void *)(v15 + 16);
  if (!v17)
  {
    uint64_t v18 = 0;
LABEL_13:
    swift_bridgeObjectRelease();
    unint64_t v19 = sub_255F42ADC();
    char v21 = v20;
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v8, v1);
    if (v17)
    {
      sub_255F45260(0, &qword_269F41ED8, (uint64_t (*)(uint64_t))type metadata accessor for Label, MEMORY[0x263F8E0F8]);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_255F4B4E0;
      *(void *)(v22 + 32) = v18;
      if (v21)
      {
LABEL_17:
        sub_255F453D4();
        sub_255F429B4(MEMORY[0x263F8EE78]);
        uint64_t v13 = sub_255F49920();
        (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v1);
        return v13;
      }
    }
    else if (v21)
    {
      goto LABEL_17;
    }
    sub_255F45260(0, &qword_269F41ED0, (uint64_t (*)(uint64_t))type metadata accessor for __HKStateOfMindDomain, MEMORY[0x263F8E0F8]);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_255F4B4E0;
    *(void *)(v23 + 32) = v19;
    goto LABEL_17;
  }
  unint64_t result = sub_255F44724(*(void *)(v15 + 16));
  if ((result & 0x8000000000000000) != 0) {
    goto LABEL_22;
  }
  if (result < *(void *)(v16 + 16))
  {
    uint64_t v18 = *(void *)(v16 + 8 * result + 32);
    goto LABEL_13;
  }
LABEL_23:
  __break(1u);
  return result;
}

unint64_t sub_255F429B4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_255F4543C();
  uint64_t v2 = sub_255F49A60();
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
    sub_255F454A8(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_255F44104(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    double v11 = (uint64_t *)(v3[6] + 16 * result);
    *double v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_255F45578(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_255F42ADC()
{
  swift_getObjectType();
  uint64_t v0 = sub_255F49890();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_255F447B0();
  if (v4 >= 1)
  {
    int64_t v6 = v4;
    unint64_t result = sub_255F46DCC(v4);
    uint64_t v8 = 0;
    int64_t v9 = 0;
    uint64_t v10 = v5 + 64;
    uint64_t v11 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v12 = -1;
    if (v11 < 64) {
      uint64_t v12 = ~(-1 << v11);
    }
    unint64_t v13 = v12 & *(void *)(v5 + 64);
    uint64_t v14 = result + 1;
    int64_t v15 = (unint64_t)(v11 + 63) >> 6;
    while (1)
    {
      if (v13)
      {
        unint64_t v16 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        unint64_t v17 = v16 | (v9 << 6);
      }
      else
      {
        int64_t v18 = v9 + 1;
        if (__OFADD__(v9, 1)) {
          goto LABEL_31;
        }
        if (v18 >= v15)
        {
LABEL_25:
          sub_255F49870();
          swift_bridgeObjectRetain();
          uint64_t v24 = sub_255F49880();
          os_log_type_t v25 = sub_255F49940();
          int v26 = v25;
          if (os_log_type_enabled(v24, v25))
          {
            uint64_t v27 = swift_slowAlloc();
            uint64_t v35 = v1;
            uint64_t v28 = v27;
            uint64_t v34 = swift_slowAlloc();
            uint64_t v37 = v34;
            *(_DWORD *)uint64_t v28 = 136446722;
            uint64_t v29 = sub_255F49B00();
            uint64_t v36 = sub_255F46734(v29, v30, &v37);
            int v33 = v26;
            sub_255F499A0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v28 + 12) = 2048;
            uint64_t v36 = v14;
            sub_255F499A0();
            *(_WORD *)(v28 + 22) = 2048;
            swift_bridgeObjectRelease();
            uint64_t v36 = v6;
            sub_255F499A0();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_255F2E000, v24, (os_log_type_t)v33, "[%{public}s] Random weight out of bounds. Weight: %ld total: %ld", (uint8_t *)v28, 0x20u);
            uint64_t v31 = v34;
            swift_arrayDestroy();
            MEMORY[0x25A29DD30](v31, -1, -1);
            MEMORY[0x25A29DD30](v28, -1, -1);

            (*(void (**)(char *, uint64_t))(v35 + 8))(v3, v0);
            return 0;
          }

          swift_bridgeObjectRelease_n();
          (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
          return 0;
        }
        unint64_t v19 = *(void *)(v10 + 8 * v18);
        ++v9;
        if (!v19)
        {
          int64_t v9 = v18 + 1;
          if (v18 + 1 >= v15) {
            goto LABEL_25;
          }
          unint64_t v19 = *(void *)(v10 + 8 * v9);
          if (!v19)
          {
            int64_t v9 = v18 + 2;
            if (v18 + 2 >= v15) {
              goto LABEL_25;
            }
            unint64_t v19 = *(void *)(v10 + 8 * v9);
            if (!v19)
            {
              int64_t v20 = v18 + 3;
              if (v20 >= v15) {
                goto LABEL_25;
              }
              unint64_t v19 = *(void *)(v10 + 8 * v20);
              if (!v19)
              {
                while (1)
                {
                  int64_t v9 = v20 + 1;
                  if (__OFADD__(v20, 1)) {
                    goto LABEL_32;
                  }
                  if (v9 >= v15) {
                    goto LABEL_25;
                  }
                  unint64_t v19 = *(void *)(v10 + 8 * v9);
                  ++v20;
                  if (v19) {
                    goto LABEL_20;
                  }
                }
              }
              int64_t v9 = v20;
            }
          }
        }
LABEL_20:
        unint64_t v13 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v9 << 6);
      }
      uint64_t v21 = *(void *)(*(void *)(v5 + 56) + 8 * v17);
      BOOL v22 = __OFADD__(v8, v21);
      v8 += v21;
      if (v22)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        return result;
      }
      if (v8 >= v14)
      {
        uint64_t v23 = *(void *)(*(void *)(v5 + 48) + 8 * v17);
        swift_release();
        return v23;
      }
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_255F42EAC(uint64_t a1, double a2)
{
  uint64_t v3 = v2;
  uint64_t v52 = a1;
  uint64_t v5 = sub_255F49780();
  uint64_t v49 = *(void *)(v5 - 8);
  uint64_t v50 = v5;
  MEMORY[0x270FA5388](v5);
  v48 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_255F49850();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255F45260(0, (unint64_t *)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  uint64_t v12 = MEMORY[0x270FA5388](v11 - 8);
  v46 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  int64_t v15 = (char *)v40 - v14;
  uint64_t v16 = sub_255F497F0();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  v43 = (char *)v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v18);
  v47 = (char *)v40 - v20;
  *(void *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex) = 0;
  uint64_t v21 = v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_calendar;
  BOOL v22 = *(void (**)(char *))(v8 + 104);
  unsigned int v44 = *MEMORY[0x263F07870];
  v22(v10);
  uint64_t v45 = v21;
  sub_255F49840();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v51 = v17;
  uint64_t v23 = v17;
  uint64_t v24 = v16;
  os_log_type_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48);
  if (v25((uint64_t)v15, 1, v16) == 1)
  {
    sub_255F452C4((uint64_t)v15, (uint64_t)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_255F45260);
    sub_255F43AB0(a2);
  }
  else
  {
    uint64_t v42 = v3;
    int v26 = v47;
    v40[0] = *(void *)(v51 + 32);
    v40[1] = v51 + 32;
    ((void (*)(char *, char *, uint64_t))v40[0])(v47, v15, v24);
    sub_255F45260(0, &qword_269F41EB0, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
    uint64_t v27 = *(void *)(v8 + 72);
    uint64_t v28 = *(unsigned __int8 *)(v8 + 80);
    v41 = v25;
    uint64_t v29 = (v28 + 32) & ~v28;
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_255F4B4F0;
    uint64_t v31 = v30 + v29;
    ((void (*)(uint64_t, void, uint64_t))v22)(v31, v44, v7);
    ((void (*)(uint64_t, void, uint64_t))v22)(v31 + v27, *MEMORY[0x263F078A8], v7);
    ((void (*)(uint64_t, void, uint64_t))v22)(v31 + 2 * v27, *MEMORY[0x263F078A0], v7);
    sub_255F46FC0(v30);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v32 = v48;
    sub_255F49820();
    swift_bridgeObjectRelease();
    sub_255F49770();
    uint64_t v33 = (uint64_t)v46;
    sub_255F49830();
    if (v41(v33, 1, v24) == 1)
    {
      sub_255F452C4(v33, (uint64_t)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_255F45260);
      double v34 = sub_255F43AB0(a2);
      (*(void (**)(char *, uint64_t, double))(v49 + 8))(v32, v50, v34);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v26, v24);
    }
    else
    {
      uint64_t v35 = v43;
      ((void (*)(char *, uint64_t, uint64_t))v40[0])(v43, v33, v24);
      sub_255F497C0();
      double v37 = v36;
      v38 = *(void (**)(char *, uint64_t))(v51 + 8);
      v38(v35, v24);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v32, v50);
      v38(v26, v24);
      uint64_t v39 = v42 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime;
      *(double *)uint64_t v39 = v37 * 0.0000115740741 + a2;
      *(unsigned char *)(v39 + 8) = 0;
    }
  }
}

void sub_255F434FC(uint64_t a1, double a2)
{
  sub_255F45260(0, (unint64_t *)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v53 - v6;
  uint64_t v8 = sub_255F497F0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_255F49780();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = MEMORY[0x270FA5388](v12);
  uint64_t v16 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v18 = (char *)&v53 - v17;
  uint64_t v19 = *(void *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex);
  uint64_t v20 = v19 + 1;
  if (__OFADD__(v19, 1))
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v20 <= 3)
  {
    if ((v20 & 0x8000000000000000) == 0)
    {
      uint64_t v55 = OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex;
      v56 = v11;
      uint64_t v54 = v19 + 1;
      uint64_t v21 = qword_2704ADD88[3 * v20 + 4];
      uint64_t v57 = v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_calendar;
      uint64_t v58 = v21;
      sub_255F45260(0, &qword_269F41EB0, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
      uint64_t v64 = a1;
      uint64_t v22 = sub_255F49850();
      uint64_t v59 = v2;
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)(v22 - 8);
      uint64_t v25 = v24;
      uint64_t v62 = v12;
      v63 = v7;
      uint64_t v26 = *(void *)(v24 + 72);
      uint64_t v27 = *(unsigned __int8 *)(v24 + 80);
      v60 = v16;
      uint64_t v61 = v9;
      uint64_t v28 = (v27 + 32) & ~v27;
      uint64_t v29 = 2 * v26;
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_255F4B4F0;
      uint64_t v31 = v30 + v28;
      uint64_t v32 = v18;
      uint64_t v33 = v8;
      uint64_t v34 = v13;
      uint64_t v35 = *(void (**)(uint64_t, void, uint64_t))(v25 + 104);
      v35(v31, *MEMORY[0x263F07870], v23);
      uint64_t v36 = v31 + v26;
      uint64_t v37 = v62;
      v35(v36, *MEMORY[0x263F078A8], v23);
      uint64_t v38 = v31 + v29;
      uint64_t v39 = v61;
      v35(v38, *MEMORY[0x263F078A0], v23);
      uint64_t v40 = v34;
      uint64_t v41 = v33;
      uint64_t v42 = v32;
      sub_255F46FC0(v30);
      swift_setDeallocating();
      v43 = v60;
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_255F49820();
      uint64_t v44 = (uint64_t)v63;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v43, v42, v37);
      sub_255F49770();
      sub_255F49830();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v44, 1, v41) == 1)
      {
        sub_255F452C4(v44, (uint64_t)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_255F45260);
        double v45 = sub_255F43AB0(a2);
        v46 = *(void (**)(char *, uint64_t, double))(v40 + 8);
        v46(v43, v37, v45);
        ((void (*)(char *, uint64_t))v46)(v42, v37);
      }
      else
      {
        v47 = v56;
        (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v56, v44, v41);
        sub_255F497C0();
        double v49 = v48;
        (*(void (**)(char *, uint64_t))(v39 + 8))(v47, v41);
        uint64_t v50 = *(void (**)(char *, uint64_t))(v40 + 8);
        v50(v43, v37);
        v50(v42, v37);
        uint64_t v51 = v59;
        uint64_t v52 = v59 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime;
        *(double *)uint64_t v52 = v49 * 0.0000115740741 + a2;
        *(unsigned char *)(v52 + 8) = 0;
        *(void *)(v51 + v55) = v54;
      }
      return;
    }
LABEL_11:
    __break(1u);
    return;
  }
  sub_255F42EAC(a1, a2);
}

double sub_255F43AB0(double a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_255F49890();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255F49870();
  uint64_t v8 = sub_255F49880();
  os_log_type_t v9 = sub_255F49940();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v20 = v2;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v22 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v13 = sub_255F49B00();
    uint64_t v21 = sub_255F46734(v13, v14, &v22);
    sub_255F499A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_255F2E000, v8, v9, "[%{public}s] Calendar math failed! Resetting to tomorrow", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A29DD30](v12, -1, -1);
    uint64_t v15 = v11;
    uint64_t v2 = v20;
    MEMORY[0x25A29DD30](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  HDDemoData_timeFromDateComponents();
  double result = v16 + a1;
  uint64_t v18 = v2 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime;
  *(double *)uint64_t v18 = result;
  *(unsigned char *)(v18 + 8) = 0;
  return result;
}

uint64_t static MentalHealthDemoDataGenerator.supportsSecureCoding.getter()
{
  return 1;
}

void sub_255F43CE0(void *a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime + 8)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = sub_255F49910();
  }
  uint64_t v4 = (void *)sub_255F498C0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);
  swift_unknownObjectRelease();

  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex);
  id v6 = (id)sub_255F498C0();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v5, v6);
}

id MentalHealthDemoDataGenerator.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_255F44D84(a1);

  return v4;
}

id MentalHealthDemoDataGenerator.init(coder:)(void *a1)
{
  id v2 = sub_255F44D84(a1);

  return v2;
}

id MentalHealthDemoDataGenerator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MentalHealthDemoDataGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_255F43FB0()
{
  return sub_255F49AF0();
}

uint64_t sub_255F43FF8()
{
  return sub_255F49AE0();
}

uint64_t sub_255F44024()
{
  return sub_255F49AF0();
}

BOOL sub_255F44068(void *a1, void *a2)
{
  return *a1 == *a2;
}

void *sub_255F4407C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_255F4408C(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_255F44098(uint64_t a1)
{
  sub_255F49AD0();
  sub_255F49AE0();
  uint64_t v2 = sub_255F49AF0();
  return sub_255F44430(a1, v2);
}

unint64_t sub_255F44104(uint64_t a1, uint64_t a2)
{
  sub_255F49AD0();
  sub_255F498D0();
  uint64_t v4 = sub_255F49AF0();
  return sub_255F444CC(a1, a2, v4);
}

uint64_t sub_255F4417C(uint64_t a1, char a2)
{
  id v3 = v2;
  uint64_t v5 = *v2;
  sub_255F4534C();
  uint64_t result = sub_255F49A50();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    char v33 = a2;
    int64_t v8 = 0;
    os_log_type_t v9 = (void *)(v5 + 64);
    uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
    if (v10 < 64) {
      uint64_t v11 = ~(-1 << v10);
    }
    else {
      uint64_t v11 = -1;
    }
    unint64_t v12 = v11 & *(void *)(v5 + 64);
    int64_t v13 = (unint64_t)(v10 + 63) >> 6;
    uint64_t v14 = result + 64;
    while (1)
    {
      if (v12)
      {
        unint64_t v17 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1)) {
          goto LABEL_38;
        }
        if (v8 >= v13)
        {
LABEL_29:
          if ((v33 & 1) == 0)
          {
            uint64_t result = swift_release();
            id v3 = v2;
            goto LABEL_36;
          }
          uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
          if (v32 >= 64) {
            bzero((void *)(v5 + 64), ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          }
          else {
            void *v9 = -1 << v32;
          }
          id v3 = v2;
          *(void *)(v5 + 16) = 0;
          break;
        }
        unint64_t v20 = v9[v8];
        if (!v20)
        {
          int64_t v21 = v8 + 1;
          if (v8 + 1 >= v13) {
            goto LABEL_29;
          }
          unint64_t v20 = v9[v21];
          if (!v20)
          {
            while (1)
            {
              int64_t v8 = v21 + 1;
              if (__OFADD__(v21, 1)) {
                break;
              }
              if (v8 >= v13) {
                goto LABEL_29;
              }
              unint64_t v20 = v9[v8];
              ++v21;
              if (v20) {
                goto LABEL_19;
              }
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v8;
        }
LABEL_19:
        unint64_t v12 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      uint64_t v22 = 8 * v18;
      uint64_t v23 = *(void *)(*(void *)(v5 + 48) + v22);
      uint64_t v24 = *(void *)(*(void *)(v5 + 56) + v22);
      sub_255F49AD0();
      sub_255F49AE0();
      uint64_t result = sub_255F49AF0();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v14 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v14 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v14 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      uint64_t v16 = 8 * v15;
      *(void *)(*(void *)(v7 + 48) + v16) = v23;
      *(void *)(*(void *)(v7 + 56) + v16) = v24;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_36:
  *id v3 = v7;
  return result;
}

unint64_t sub_255F44430(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_255F444CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_255F49A90() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        int64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_255F49A90() & 1) == 0);
    }
  }
  return v6;
}

void *sub_255F445B0()
{
  uint64_t v1 = v0;
  sub_255F4534C();
  uint64_t v2 = *v0;
  uint64_t v3 = sub_255F49A40();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    unint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  unint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    unint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    if (!v19) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = *(void *)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 56) + v16) = v17;
  }
  int64_t v20 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

unint64_t sub_255F44724(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    unint64_t v3 = 0;
    MEMORY[0x25A29DD40](&v3, 8);
    unint64_t result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      unint64_t v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          unint64_t v3 = 0;
          MEMORY[0x25A29DD40](&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_255F447B0()
{
  uint64_t v0 = sub_255F49980();
  uint64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    unint64_t v2 = (uint64_t *)(v0 + 32);
    uint64_t v3 = MEMORY[0x263F8EE80];
    while (1)
    {
      uint64_t v5 = *v2++;
      uint64_t v4 = v5;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v8 = sub_255F44098(v5);
      uint64_t v9 = *(void *)(v3 + 16);
      BOOL v10 = (v7 & 1) == 0;
      uint64_t v11 = v9 + v10;
      if (__OFADD__(v9, v10))
      {
LABEL_44:
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        goto LABEL_47;
      }
      char v12 = v7;
      if (*(void *)(v3 + 24) >= v11)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          sub_255F445B0();
        }
      }
      else
      {
        sub_255F4417C(v11, isUniquelyReferenced_nonNull_native);
        unint64_t v13 = sub_255F44098(v4);
        if ((v12 & 1) != (v14 & 1)) {
          goto LABEL_48;
        }
        unint64_t v8 = v13;
      }
      if ((unint64_t)(v4 - 1) > 9)
      {
        uint64_t v15 = 3;
        if (v12)
        {
LABEL_3:
          *(void *)(*(void *)(v3 + 56) + 8 * v8) = v15;
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v15 = qword_255F4B6F0[v4 - 1];
        if (v12) {
          goto LABEL_3;
        }
      }
      *(void *)(v3 + 8 * (v8 >> 6) + 64) |= 1 << v8;
      uint64_t v16 = 8 * v8;
      *(void *)(*(void *)(v3 + 48) + v16) = v4;
      *(void *)(*(void *)(v3 + 56) + v16) = v15;
      uint64_t v17 = *(void *)(v3 + 16);
      BOOL v18 = __OFADD__(v17, 1);
      uint64_t v19 = v17 + 1;
      if (v18) {
        goto LABEL_46;
      }
      *(void *)(v3 + 16) = v19;
LABEL_4:
      swift_bridgeObjectRelease();
      if (!--v1) {
        goto LABEL_18;
      }
    }
  }
  uint64_t v3 = MEMORY[0x263F8EE80];
LABEL_18:
  swift_bridgeObjectRelease();
  int64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = v3 + 64;
  uint64_t v23 = 1 << *(unsigned char *)(v3 + 32);
  uint64_t v24 = -1;
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  unint64_t v25 = v24 & *(void *)(v3 + 64);
  int64_t v26 = (unint64_t)(v23 + 63) >> 6;
  while (v25)
  {
    unint64_t v27 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    unint64_t v28 = v27 | (v20 << 6);
LABEL_22:
    uint64_t v29 = *(void *)(*(void *)(v3 + 56) + 8 * v28);
    BOOL v18 = __OFADD__(v21, v29);
    v21 += v29;
    if (v18)
    {
      __break(1u);
      goto LABEL_44;
    }
  }
  int64_t v30 = v20 + 1;
  if (__OFADD__(v20, 1)) {
    goto LABEL_45;
  }
  if (v30 >= v26) {
    return v3;
  }
  unint64_t v31 = *(void *)(v22 + 8 * v30);
  ++v20;
  if (v31) {
    goto LABEL_41;
  }
  int64_t v20 = v30 + 1;
  if (v30 + 1 >= v26) {
    return v3;
  }
  unint64_t v31 = *(void *)(v22 + 8 * v20);
  if (v31) {
    goto LABEL_41;
  }
  int64_t v20 = v30 + 2;
  if (v30 + 2 >= v26) {
    return v3;
  }
  unint64_t v31 = *(void *)(v22 + 8 * v20);
  if (v31) {
    goto LABEL_41;
  }
  int64_t v20 = v30 + 3;
  if (v30 + 3 >= v26) {
    return v3;
  }
  unint64_t v31 = *(void *)(v22 + 8 * v20);
  if (v31) {
    goto LABEL_41;
  }
  int64_t v20 = v30 + 4;
  if (v30 + 4 >= v26) {
    return v3;
  }
  unint64_t v31 = *(void *)(v22 + 8 * v20);
  if (v31)
  {
LABEL_41:
    unint64_t v25 = (v31 - 1) & v31;
    unint64_t v28 = __clz(__rbit64(v31)) + (v20 << 6);
    goto LABEL_22;
  }
  int64_t v32 = v30 + 5;
  if (v32 >= v26) {
    return v3;
  }
  unint64_t v31 = *(void *)(v22 + 8 * v32);
  if (v31)
  {
    int64_t v20 = v32;
    goto LABEL_41;
  }
  while (1)
  {
    int64_t v20 = v32 + 1;
    if (__OFADD__(v32, 1)) {
      break;
    }
    if (v20 >= v26) {
      return v3;
    }
    unint64_t v31 = *(void *)(v22 + 8 * v20);
    ++v32;
    if (v31) {
      goto LABEL_41;
    }
  }
LABEL_47:
  __break(1u);
LABEL_48:
  type metadata accessor for __HKStateOfMindDomain(0);
  uint64_t result = sub_255F49AB0();
  __break(1u);
  return result;
}

void sub_255F44A7C(uint64_t a1, void *a2, double a3)
{
  uint64_t v4 = v3;
  sub_255F45260(0, (unint64_t *)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  BOOL v10 = (char *)&v24 - v9;
  uint64_t v11 = sub_255F497F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v24 - v16;
  if (*(unsigned char *)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime + 8))
  {
    sub_255F42EAC(a1, a3);
    return;
  }
  if (*(double *)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime) > a3) {
    return;
  }
  BOOL v18 = *(void **)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState);
  if (!v18)
  {
    __break(1u);
    goto LABEL_14;
  }
  id v19 = objc_msgSend(v18, sel_firstSampleDate);
  if (!v19)
  {
LABEL_14:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_15;
  }
  int64_t v20 = v19;
  sub_255F497E0();

  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v15, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
LABEL_15:
    __break(1u);
    return;
  }
  sub_255F497D0();
  uint64_t v21 = *(void (**)(char *, uint64_t))(v12 + 8);
  v21(v10, v11);
  unint64_t v22 = sub_255F425F4();
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    objc_msgSend(a2, sel_addObjectFromPhone_, v22);
  }
  sub_255F434FC(a1, a3);
  v21(v17, v11);
}

id sub_255F44D84(void *a1)
{
  uint64_t v3 = sub_255F49800();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F07740], v3);
  char v7 = v1;
  sub_255F49810();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_unknownObjectWeakInit();
  *(void *)&v7[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_generatorState] = 0;
  uint64_t v8 = &v7[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_nextStateOfMindSampleTime];
  *(void *)uint64_t v8 = 0;
  v8[8] = 1;
  uint64_t v9 = OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex;
  *(void *)&v7[OBJC_IVAR____TtC18MentalHealthDaemon29MentalHealthDemoDataGenerator_currentInjectionIndex] = 0;
  BOOL v10 = (void *)sub_255F498C0();
  id v11 = objc_msgSend(a1, sel_decodeObjectForKey_, v10);

  if (v11)
  {
    sub_255F499C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v21, 0, sizeof(v21));
  }
  sub_255F45588((uint64_t)v21, (uint64_t)v22);
  if (v23)
  {
    int v12 = swift_dynamicCast();
    uint64_t v13 = v19[1];
    if (!v12) {
      uint64_t v13 = 0;
    }
    char v14 = v12 ^ 1;
  }
  else
  {
    sub_255F452C4((uint64_t)v22, (uint64_t)&qword_269F41EF0, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_255F45664);
    uint64_t v13 = 0;
    char v14 = 1;
  }
  *(void *)uint64_t v8 = v13;
  v8[8] = v14;
  uint64_t v15 = (void *)sub_255F498C0();
  id v16 = objc_msgSend(a1, sel_decodeIntegerForKey_, v15);

  *(void *)&v7[v9] = v16;
  uint64_t v17 = (objc_class *)type metadata accessor for MentalHealthDemoDataGenerator();
  v20.receiver = v7;
  v20.super_class = v17;
  return objc_msgSendSuper2(&v20, sel_init);
}

uint64_t type metadata accessor for MentalHealthDemoDataGenerator()
{
  uint64_t result = qword_269F41E98;
  if (!qword_269F41E98) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_255F45098()
{
  return type metadata accessor for MentalHealthDemoDataGenerator();
}

uint64_t sub_255F450A0()
{
  uint64_t result = sub_255F49860();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MentalHealthDemoDataGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MentalHealthDemoDataGenerator);
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.setDemoDataGenerationContextWith(_:generatorState:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.generateFirstRunObjects(forDemoPerson:firstDate:objectCollection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.generateObjects(forDemoPerson:fromTime:toTime:currentDate:objectCollection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of MentalHealthDemoDataGenerator.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 304))();
}

void sub_255F45260(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_255F452C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

void type metadata accessor for __HKStateOfMindDomain(uint64_t a1)
{
}

void sub_255F4534C()
{
  if (!qword_269F41EB8)
  {
    type metadata accessor for __HKStateOfMindDomain(255);
    sub_255F456E4(&qword_269F41EC0);
    unint64_t v0 = sub_255F49A70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F41EB8);
    }
  }
}

unint64_t sub_255F453D4()
{
  unint64_t result = qword_269F41EC8;
  if (!qword_269F41EC8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_269F41EC8);
  }
  return result;
}

void type metadata accessor for Label(uint64_t a1)
{
}

void sub_255F4543C()
{
  if (!qword_269F41EE0)
  {
    unint64_t v0 = sub_255F49A70();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F41EE0);
    }
  }
}

uint64_t sub_255F454A8(uint64_t a1, uint64_t a2)
{
  sub_255F4550C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_255F4550C()
{
  if (!qword_269F41EE8)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_269F41EE8);
    }
  }
}

_OWORD *sub_255F45578(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_255F45588(uint64_t a1, uint64_t a2)
{
  sub_255F45664(0, &qword_269F41EF0, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for Answer(uint64_t a1)
{
}

void _s3__C6AnswerOMa_0(uint64_t a1)
{
}

void sub_255F45664(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_255F456B0()
{
  return sub_255F456E4(&qword_269F41F18);
}

uint64_t sub_255F456E4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for __HKStateOfMindDomain(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_255F45728()
{
  uint64_t v1 = sub_255F49800();
  uint64_t v2 = *(void *)(v1 - 8);
  MEMORY[0x270FA5388](v1);
  uint64_t v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *MEMORY[0x263F07740], v1);
  unint64_t v5 = v0;
  sub_255F49810();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  swift_unknownObjectWeakInit();
  *(void *)&v5[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState] = 0;
  uint64_t v6 = &v5[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime];
  *(void *)uint64_t v6 = 0;
  v6[8] = 1;

  uint64_t v7 = (objc_class *)type metadata accessor for MentalHealthAssessmentsDemoDataGenerator();
  v9.receiver = v5;
  v9.super_class = v7;
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_255F458B0(uint64_t a1, void *a2)
{
  swift_unknownObjectWeakAssign();
  id v5 = *(id *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState);
  *(void *)(v2 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState) = a2;
  id v4 = a2;
}

void sub_255F45984()
{
}

void sub_255F45A9C(double a1, double a2, uint64_t a3, uint64_t a4, void *a5)
{
}

void sub_255F45BD0(uint64_t a1, double a2)
{
  uint64_t v4 = sub_255F49780();
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v50 = v4;
  MEMORY[0x270FA5388](v4);
  double v48 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_255F49850();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  objc_super v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255F48708(0, (unint64_t *)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  uint64_t v11 = MEMORY[0x270FA5388](v10 - 8);
  v46 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  char v14 = (char *)v41 - v13;
  uint64_t v15 = sub_255F497F0();
  uint64_t v52 = *(void *)(v15 - 8);
  uint64_t v53 = v15;
  uint64_t v16 = MEMORY[0x270FA5388](v15);
  uint64_t v44 = (char *)v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v16);
  v47 = (char *)v41 - v18;
  unint64_t v19 = sub_255F44724(0x15uLL);
  uint64_t v20 = OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_calendar;
  uint64_t v21 = *MEMORY[0x263F07870];
  unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  v22(v9, v21, v6);
  if (__OFSUB__(70, v19))
  {
    __break(1u);
  }
  else
  {
    uint64_t v43 = a1;
    uint64_t v45 = v51 + v20;
    sub_255F49840();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    uint64_t v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48);
    if (v23((uint64_t)v14, 1, v53) == 1)
    {
      sub_255F4865C((uint64_t)v14, (uint64_t)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_255F48708);
      sub_255F46224(a2);
    }
    else
    {
      uint64_t v24 = v47;
      v41[0] = *(void *)(v52 + 32);
      v41[1] = v52 + 32;
      ((void (*)(char *, char *, uint64_t))v41[0])(v47, v14, v53);
      sub_255F48708(0, &qword_269F41EB0, MEMORY[0x263F07908], MEMORY[0x263F8E0F8]);
      uint64_t v25 = *(void *)(v7 + 72);
      uint64_t v26 = *(unsigned __int8 *)(v7 + 80);
      uint64_t v42 = v23;
      uint64_t v27 = (v26 + 32) & ~v26;
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_255F4B4F0;
      uint64_t v29 = v28 + v27;
      v22((char *)v29, v21, v6);
      v22((char *)(v29 + v25), *MEMORY[0x263F078A8], v6);
      uint64_t v30 = v29 + 2 * v25;
      unint64_t v31 = v24;
      v22((char *)v30, *MEMORY[0x263F078A0], v6);
      sub_255F46FC0(v28);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      int64_t v32 = v48;
      sub_255F49820();
      swift_bridgeObjectRelease();
      sub_255F49770();
      uint64_t v33 = (uint64_t)v46;
      sub_255F49830();
      if (v42(v33, 1, v53) == 1)
      {
        sub_255F4865C(v33, (uint64_t)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_255F48708);
        double v34 = sub_255F46224(a2);
        (*(void (**)(char *, uint64_t, double))(v49 + 8))(v32, v50, v34);
        (*(void (**)(char *, uint64_t))(v52 + 8))(v24, v53);
      }
      else
      {
        uint64_t v35 = v44;
        uint64_t v36 = v53;
        ((void (*)(char *, uint64_t, uint64_t))v41[0])(v44, v33, v53);
        sub_255F497C0();
        double v38 = v37;
        uint64_t v39 = *(void (**)(char *, uint64_t))(v52 + 8);
        v39(v35, v36);
        (*(void (**)(char *, uint64_t))(v49 + 8))(v32, v50);
        v39(v31, v36);
        uint64_t v40 = v51 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime;
        *(double *)uint64_t v40 = v38 * 0.0000115740741 + a2;
        *(unsigned char *)(v40 + 8) = 0;
      }
    }
  }
}

double sub_255F46224(double a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_255F49890();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_255F49870();
  uint64_t v8 = sub_255F49880();
  os_log_type_t v9 = sub_255F49940();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v19 = v2;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v21 = v12;
    *(_DWORD *)uint64_t v11 = 136446210;
    uint64_t v13 = sub_255F49B00();
    uint64_t v20 = sub_255F46734(v13, v14, &v21);
    sub_255F499A0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_255F2E000, v8, v9, "[%{public}s] Calendar math failed! Resetting to 60 days from now", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x25A29DD30](v12, -1, -1);
    uint64_t v15 = v11;
    uint64_t v2 = v19;
    MEMORY[0x25A29DD30](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  double result = a1 + 60.0;
  uint64_t v17 = v2 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime;
  *(double *)uint64_t v17 = a1 + 60.0;
  *(unsigned char *)(v17 + 8) = 0;
  return result;
}

uint64_t static MentalHealthAssessmentsDemoDataGenerator.supportsSecureCoding.getter()
{
  return 1;
}

void sub_255F4644C(void *a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime + 8)) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = sub_255F49910();
  }
  id v4 = (id)sub_255F498C0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);
  swift_unknownObjectRelease();
}

id MentalHealthAssessmentsDemoDataGenerator.__allocating_init(coder:)(void *a1)
{
  id v3 = objc_allocWithZone(v1);
  id v4 = sub_255F48074(a1);

  return v4;
}

id MentalHealthAssessmentsDemoDataGenerator.init(coder:)(void *a1)
{
  id v2 = sub_255F48074(a1);

  return v2;
}

id MentalHealthAssessmentsDemoDataGenerator.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MentalHealthAssessmentsDemoDataGenerator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_255F46734(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_255F46808(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_255F48538((uint64_t)v12, *a3);
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
      sub_255F48538((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_255F46808(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_255F499B0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_255F469C4(a5, a6);
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
  uint64_t v8 = sub_255F49A00();
  if (!v8)
  {
    sub_255F49A10();
    __break(1u);
LABEL_17:
    uint64_t result = sub_255F49A80();
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

uint64_t sub_255F469C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_255F46A5C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_255F46C5C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_255F46C5C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_255F46A5C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_255F46BD4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_255F499F0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_255F49A10();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_255F498E0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_255F49A80();
    __break(1u);
LABEL_14:
    uint64_t result = sub_255F49A10();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_255F46BD4(uint64_t a1, uint64_t a2)
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
  sub_255F486BC(0, &qword_269F42058, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_255F46C5C(char a1, int64_t a2, char a3, char *a4)
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
    sub_255F486BC(0, &qword_269F42058, MEMORY[0x263F8E778], MEMORY[0x263F8E0F8]);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_255F49A80();
  __break(1u);
  return result;
}

uint64_t sub_255F46DD0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_255F46E48(a1, a2, a3, *v3, &qword_269F420B0, (uint64_t (*)(uint64_t))_s3__C6AnswerOMa_0);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_255F46E0C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_255F46E48(a1, a2, a3, *v3, &qword_269F420B8, (uint64_t (*)(uint64_t))type metadata accessor for Answer);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_255F46E48(char a1, int64_t a2, char a3, char *a4, unint64_t *a5, uint64_t (*a6)(uint64_t))
{
  if (a3)
  {
    unint64_t v8 = *((void *)a4 + 3);
    int64_t v9 = v8 >> 1;
    if ((uint64_t)(v8 >> 1) < a2)
    {
      if (v9 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v9 = v8 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v8 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v9 = a2;
      }
    }
  }
  else
  {
    int64_t v9 = a2;
  }
  uint64_t v10 = *((void *)a4 + 2);
  if (v9 <= v10) {
    uint64_t v11 = *((void *)a4 + 2);
  }
  else {
    uint64_t v11 = v9;
  }
  if (v11)
  {
    sub_255F48708(0, a5, a6, MEMORY[0x263F8E0F8]);
    uint64_t v12 = (char *)swift_allocObject();
    int64_t v13 = _swift_stdlib_malloc_size(v12);
    uint64_t v14 = v13 - 32;
    if (v13 < 32) {
      uint64_t v14 = v13 - 25;
    }
    *((void *)v12 + 2) = v10;
    *((void *)v12 + 3) = 2 * (v14 >> 3);
  }
  else
  {
    uint64_t v12 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v15 = v12 + 32;
  uint64_t v16 = a4 + 32;
  if (a1)
  {
    if (v12 != a4 || v15 >= &v16[8 * v10]) {
      memmove(v15, v16, 8 * v10);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v16 >= &v15[8 * v10] || v15 >= &v16[8 * v10])
  {
    memcpy(v15, v16, 8 * v10);
LABEL_30:
    swift_release();
    return (uint64_t)v12;
  }
LABEL_32:
  uint64_t result = sub_255F49A80();
  __break(1u);
  return result;
}

uint64_t sub_255F46FC0(uint64_t a1)
{
  uint64_t v2 = sub_255F49850();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  double v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_255F48598();
    uint64_t v9 = sub_255F499D0();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    uint64_t v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    unint64_t v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_255F48618(&qword_269F42078);
      uint64_t v16 = sub_255F498A0();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_255F48618((unint64_t *)&unk_269F42080);
          char v23 = sub_255F498B0();
          uint64_t v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        uint64_t v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return v9;
      }
    }
  }
  return MEMORY[0x263F8EE88];
}

void sub_255F472AC()
{
  uint64_t v1 = v0;
  v49[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_255F49890();
  uint64_t v47 = *(void *)(v3 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v42 - v7;
  uint64_t v9 = MEMORY[0x25A29DDA0](v1 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_profile);
  if (v9)
  {
    id v10 = (id)v9;
    sub_255F49870();
    uint64_t v11 = sub_255F49880();
    os_log_type_t v12 = sub_255F49930();
    BOOL v13 = os_log_type_enabled(v11, v12);
    uint64_t v45 = ObjectType;
    id v46 = v10;
    if (v13)
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      v49[0] = v15;
      *(_DWORD *)uint64_t v14 = 136446210;
      uint64_t v44 = v6;
      uint64_t v16 = sub_255F49B00();
      uint64_t v48 = sub_255F46734(v16, v17, (uint64_t *)v49);
      uint64_t v18 = v47;
      unint64_t v6 = v44;
      sub_255F499A0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_255F2E000, v11, v12, "[%{public}s] Hello!", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x25A29DD30](v15, -1, -1);
      unint64_t v19 = v14;
      id v10 = v46;
      MEMORY[0x25A29DD30](v19, -1, -1);

      uint64_t v20 = v18;
    }
    else
    {

      uint64_t v20 = v47;
    }
    uint64_t v21 = *(void (**)(char *, uint64_t))(v20 + 8);
    v21(v8, v3);
    id v22 = objc_msgSend(self, sel_hdmh_mentalHealthSyncedDefaultsDomainWithProfile_, v10);
    sub_255F4876C(0, (unint64_t *)&unk_269F420C0);
    char v23 = (void *)sub_255F49990();
    uint64_t v24 = *MEMORY[0x263F55000];
    v49[0] = 0;
    unsigned int v25 = objc_msgSend(v22, sel_setNumber_forKey_error_, v23, v24, v49);

    if (v25)
    {
      id v26 = v49[0];
    }
    else
    {
      id v27 = v49[0];
      BOOL v28 = (void *)sub_255F49790();

      swift_willThrow();
      sub_255F49870();
      id v29 = v28;
      id v30 = v28;
      unint64_t v31 = sub_255F49880();
      os_log_type_t v32 = sub_255F49930();
      if (os_log_type_enabled(v31, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        uint64_t v44 = (char *)v3;
        uint64_t v34 = v33;
        uint64_t v43 = (void *)swift_slowAlloc();
        v49[0] = v43;
        *(_DWORD *)uint64_t v34 = 136446466;
        uint64_t v35 = sub_255F49B00();
        uint64_t v48 = sub_255F46734(v35, v36, (uint64_t *)v49);
        sub_255F499A0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v34 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v37 = sub_255F49AC0();
        uint64_t v48 = sub_255F46734(v37, v38, (uint64_t *)v49);
        sub_255F499A0();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_255F2E000, v31, v32, "[%{public}s] Couldn't set the age confirmation for mental health assessments with error: %s", (uint8_t *)v34, 0x16u);
        uint64_t v39 = v43;
        swift_arrayDestroy();
        MEMORY[0x25A29DD30](v39, -1, -1);
        MEMORY[0x25A29DD30](v34, -1, -1);

        uint64_t v40 = v6;
        uint64_t v41 = (uint64_t)v44;
      }
      else
      {

        uint64_t v40 = v6;
        uint64_t v41 = v3;
      }
      v21(v40, v41);
    }
  }
}

uint64_t sub_255F477C0()
{
  uint64_t v0 = sub_255F497F0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = MEMORY[0x270FA5388](v0);
  unint64_t v36 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  unint64_t v6 = (char *)&v34 - v5;
  MEMORY[0x270FA5388](v4);
  uint64_t v8 = (char *)&v34 - v7;
  sub_255F44724(0x20000000000001uLL);
  sub_255F497B0();
  sub_255F497A0();
  uint64_t v35 = v1;
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(v1 + 16);
  uint64_t v37 = v0;
  v9(v6, v8, v0);
  uint64_t v39 = MEMORY[0x263F8EE78];
  uint64_t result = sub_255F46E0C(0, 7, 0);
  unint64_t v11 = qword_2704ADE18;
  if (qword_2704ADE18)
  {
    os_log_type_t v12 = &unk_2704ADE08;
    uint64_t v13 = v39;
    uint64_t v14 = 1;
    while (1)
    {
      unint64_t v38 = 0;
      uint64_t result = MEMORY[0x25A29DD40](&v38, 8);
      unint64_t v15 = (v38 * (unsigned __int128)v11) >> 64;
      if (v11 > v38 * v11)
      {
        unint64_t v16 = -(uint64_t)v11 % v11;
        if (v16 > v38 * v11)
        {
          do
          {
            unint64_t v38 = 0;
            uint64_t result = MEMORY[0x25A29DD40](&v38, 8);
          }
          while (v16 > v38 * v11);
          unint64_t v15 = (v38 * (unsigned __int128)v11) >> 64;
        }
      }
      if (v15 >= v11)
      {
        __break(1u);
        goto LABEL_27;
      }
      uint64_t v17 = v12[v15 + 4];
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v39 = v13;
      unint64_t v19 = *(void *)(v13 + 16);
      unint64_t v18 = *(void *)(v13 + 24);
      if (v19 >= v18 >> 1)
      {
        uint64_t result = sub_255F46E0C(v18 > 1, v19 + 1, 1);
        uint64_t v13 = v39;
      }
      *(void *)(v13 + 16) = v19 + 1;
      *(void *)(v13 + 8 * v19 + 32) = v17;
      if (v14 == 7) {
        break;
      }
      ++v14;
      unint64_t v11 = qword_2704ADE50;
      os_log_type_t v12 = &unk_2704ADE40;
      if (!qword_2704ADE50) {
        goto LABEL_27;
      }
    }
    sub_255F4876C(0, &qword_269F42098);
    uint64_t v20 = MEMORY[0x263F8EE78];
    sub_255F429B4(MEMORY[0x263F8EE78]);
    uint64_t v21 = sub_255F49950();
    v9(v36, v8, v37);
    uint64_t v39 = v20;
    uint64_t result = sub_255F46DD0(0, 9, 0);
    unint64_t v22 = qword_2704ADE88;
    if (!qword_2704ADE88) {
      goto LABEL_29;
    }
    char v23 = &unk_2704ADE78;
    uint64_t v24 = v39;
    uint64_t v25 = 1;
    while (1)
    {
      unint64_t v38 = 0;
      uint64_t result = MEMORY[0x25A29DD40](&v38, 8);
      unint64_t v26 = (v38 * (unsigned __int128)v22) >> 64;
      if (v22 > v38 * v22)
      {
        unint64_t v27 = -(uint64_t)v22 % v22;
        if (v27 > v38 * v22)
        {
          do
          {
            unint64_t v38 = 0;
            uint64_t result = MEMORY[0x25A29DD40](&v38, 8);
          }
          while (v27 > v38 * v22);
          unint64_t v26 = (v38 * (unsigned __int128)v22) >> 64;
        }
      }
      if (v26 >= v22) {
        break;
      }
      uint64_t v28 = v23[v26 + 4];
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v39 = v24;
      unint64_t v30 = *(void *)(v24 + 16);
      unint64_t v29 = *(void *)(v24 + 24);
      if (v30 >= v29 >> 1)
      {
        uint64_t result = sub_255F46DD0(v29 > 1, v30 + 1, 1);
        uint64_t v24 = v39;
      }
      *(void *)(v24 + 16) = v30 + 1;
      *(void *)(v24 + 8 * v30 + 32) = v28;
      if (v25 == 9)
      {
        sub_255F4876C(0, &qword_269F420A0);
        sub_255F429B4(MEMORY[0x263F8EE78]);
        uint64_t v31 = sub_255F49960();
        sub_255F486BC(0, &qword_269F420A8, MEMORY[0x263F8EE50] + 8, MEMORY[0x263F8E0F8]);
        uint64_t v32 = swift_allocObject();
        *(_OWORD *)(v32 + 16) = xmmword_255F4B740;
        *(void *)(v32 + 32) = v31;
        *(void *)(v32 + 40) = v21;
        uint64_t v39 = v32;
        sub_255F49900();
        uint64_t v33 = v39;
        (*(void (**)(char *, uint64_t))(v35 + 8))(v8, v37);
        return v33;
      }
      ++v25;
      unint64_t v22 = qword_2704ADEC0;
      char v23 = &unk_2704ADEB0;
      if (!qword_2704ADEC0) {
        goto LABEL_29;
      }
    }
  }
  else
  {
LABEL_27:
    __break(1u);
  }
  __break(1u);
LABEL_29:
  __break(1u);
  return result;
}

void sub_255F47C84(uint64_t a1, void *a2, double a3)
{
  uint64_t v4 = v3;
  sub_255F48708(0, (unint64_t *)&unk_269F42060, MEMORY[0x263F07490], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v25 - v9;
  uint64_t v11 = sub_255F497F0();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  unint64_t v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v25 - v16;
  if ((*(unsigned char *)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime + 8) & 1) == 0)
  {
    if (*(double *)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime) > a3) {
      return;
    }
    unint64_t v18 = *(void **)(v4 + OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState);
    if (v18)
    {
      id v19 = objc_msgSend(v18, sel_firstSampleDate);
      if (v19)
      {
        uint64_t v20 = v19;
        sub_255F497E0();

        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v10, v15, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
        {
          sub_255F497D0();
          uint64_t v21 = *(void (**)(char *, uint64_t))(v12 + 8);
          v21(v10, v11);
          unint64_t v22 = sub_255F477C0();
          if (v22 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v24 = sub_255F49A30();
            swift_bridgeObjectRelease();
            if (v24)
            {
              sub_255F4876C(0, &qword_269F42090);
              swift_bridgeObjectRetain();
              sub_255F49A20();
              swift_bridgeObjectRelease();
              goto LABEL_12;
            }
          }
          else if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            swift_bridgeObjectRetain();
            sub_255F49AA0();
            sub_255F4876C(0, &qword_269F42090);
LABEL_12:
            swift_bridgeObjectRelease();
            sub_255F4876C(0, &qword_269F42090);
            char v23 = (void *)sub_255F498F0();
            swift_bridgeObjectRelease();
            objc_msgSend(a2, sel_addObjectsFromPhone_, v23);

LABEL_16:
            sub_255F45BD0(a1, a3);
            v21(v17, v11);
            return;
          }
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
LABEL_20:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_20;
  }
  sub_255F45BD0(a1, a3);
}

id sub_255F48074(void *a1)
{
  uint64_t v3 = sub_255F49800();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  unint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, *MEMORY[0x263F07740], v3);
  uint64_t v7 = v1;
  sub_255F49810();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_unknownObjectWeakInit();
  *(void *)&v7[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_generatorState] = 0;
  uint64_t v8 = &v7[OBJC_IVAR____TtC18MentalHealthDaemon40MentalHealthAssessmentsDemoDataGenerator_nextSampleTime];
  *(void *)uint64_t v8 = 0;
  v8[8] = 1;
  uint64_t v9 = (void *)sub_255F498C0();
  id v10 = objc_msgSend(a1, sel_decodeObjectForKey_, v9);

  if (v10)
  {
    sub_255F499C0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v18, 0, sizeof(v18));
  }
  sub_255F45588((uint64_t)v18, (uint64_t)v19);
  if (v20)
  {
    int v11 = swift_dynamicCast();
    uint64_t v12 = v16[1];
    if (!v11) {
      uint64_t v12 = 0;
    }
    char v13 = v11 ^ 1;
  }
  else
  {
    sub_255F4865C((uint64_t)v19, (uint64_t)&qword_269F41EF0, MEMORY[0x263F8EE58] + 8, MEMORY[0x263F8D8F0], (uint64_t (*)(void))sub_255F486BC);
    uint64_t v12 = 0;
    char v13 = 1;
  }
  *(void *)uint64_t v8 = v12;
  v8[8] = v13;

  uint64_t v14 = (objc_class *)type metadata accessor for MentalHealthAssessmentsDemoDataGenerator();
  v17.receiver = v7;
  v17.super_class = v14;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for MentalHealthAssessmentsDemoDataGenerator()
{
  uint64_t result = qword_269F42048;
  if (!qword_269F42048) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_255F48338()
{
  return type metadata accessor for MentalHealthAssessmentsDemoDataGenerator();
}

uint64_t sub_255F48340()
{
  uint64_t result = sub_255F49860();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for MentalHealthAssessmentsDemoDataGenerator(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for MentalHealthAssessmentsDemoDataGenerator);
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.setDemoDataGenerationContextWith(_:generatorState:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.generateFirstRunObjects(forDemoPerson:firstDate:objectCollection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.generateObjects(forDemoPerson:fromTime:toTime:currentDate:objectCollection:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.encode(with:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of MentalHealthAssessmentsDemoDataGenerator.__allocating_init(coder:)()
{
  return (*(uint64_t (**)(void))(v0 + 248))();
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

uint64_t sub_255F48538(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_255F48598()
{
  if (!qword_269F42070)
  {
    sub_255F49850();
    sub_255F48618(&qword_269F42078);
    unint64_t v0 = sub_255F499E0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_269F42070);
    }
  }
}

uint64_t sub_255F48618(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_255F49850();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_255F4865C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v6 = a5(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  return a1;
}

void sub_255F486BC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

void sub_255F48708(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

uint64_t sub_255F4876C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_255F49770()
{
  return MEMORY[0x270EEE7C8]();
}

uint64_t sub_255F49780()
{
  return MEMORY[0x270EEE8E8]();
}

uint64_t sub_255F49790()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_255F497A0()
{
  return MEMORY[0x270EF02B0]();
}

uint64_t sub_255F497B0()
{
  return MEMORY[0x270EF02C8]();
}

uint64_t sub_255F497C0()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_255F497D0()
{
  return MEMORY[0x270EF0898]();
}

uint64_t sub_255F497E0()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_255F497F0()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_255F49800()
{
  return MEMORY[0x270EF10C8]();
}

uint64_t sub_255F49810()
{
  return MEMORY[0x270EF10D8]();
}

uint64_t sub_255F49820()
{
  return MEMORY[0x270EF1258]();
}

uint64_t sub_255F49830()
{
  return MEMORY[0x270EF1368]();
}

uint64_t sub_255F49840()
{
  return MEMORY[0x270EF1388]();
}

uint64_t sub_255F49850()
{
  return MEMORY[0x270EF1428]();
}

uint64_t sub_255F49860()
{
  return MEMORY[0x270EF1440]();
}

uint64_t sub_255F49870()
{
  return MEMORY[0x270F350F8]();
}

uint64_t sub_255F49880()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_255F49890()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_255F498A0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_255F498B0()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_255F498C0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_255F498D0()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_255F498E0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_255F498F0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_255F49900()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_255F49910()
{
  return MEMORY[0x270EF1C18]();
}

uint64_t sub_255F49920()
{
  return MEMORY[0x270EF33C8]();
}

uint64_t sub_255F49930()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_255F49940()
{
  return MEMORY[0x270FA2E70]();
}

uint64_t sub_255F49950()
{
  return MEMORY[0x270EF3430]();
}

uint64_t sub_255F49960()
{
  return MEMORY[0x270EF3498]();
}

uint64_t sub_255F49970()
{
  return MEMORY[0x270EF34C8]();
}

uint64_t sub_255F49980()
{
  return MEMORY[0x270EF34D0]();
}

uint64_t sub_255F49990()
{
  return MEMORY[0x270EF2198]();
}

uint64_t sub_255F499A0()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_255F499B0()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_255F499C0()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_255F499D0()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_255F499E0()
{
  return MEMORY[0x270F9E978]();
}

uint64_t sub_255F499F0()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_255F49A00()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_255F49A10()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_255F49A20()
{
  return MEMORY[0x270F9F000]();
}

uint64_t sub_255F49A30()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_255F49A40()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_255F49A50()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_255F49A60()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_255F49A70()
{
  return MEMORY[0x270F9F0B8]();
}

uint64_t sub_255F49A80()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_255F49A90()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_255F49AA0()
{
  return MEMORY[0x270F9F918]();
}

uint64_t sub_255F49AB0()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_255F49AC0()
{
  return MEMORY[0x270EF2680]();
}

uint64_t sub_255F49AD0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_255F49AE0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_255F49AF0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_255F49B00()
{
  return MEMORY[0x270FA0128]();
}

uint64_t HDActivityCacheEntityPredicateForCachesInDateComponentsRange()
{
  return MEMORY[0x270F31960]();
}

uint64_t HDDemoData_timeFromDateComponents()
{
  return MEMORY[0x270F319C0]();
}

uint64_t HDEntityCategoryForKeyValueCategory()
{
  return MEMORY[0x270F319C8]();
}

uint64_t HDSampleEntityPredicateForDateInterval()
{
  return MEMORY[0x270F31A08]();
}

uint64_t HDSampleEntityPredicateForEndDate()
{
  return MEMORY[0x270F31A10]();
}

uint64_t HDSampleEntityPredicateForStartDate()
{
  return MEMORY[0x270F31A18]();
}

uint64_t HKAnalyticsPropertyValueForBiologicalSex()
{
  return MEMORY[0x270EF35F8]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
}

uint64_t HKSensitiveLogItem()
{
  return MEMORY[0x270EF3808]();
}

uint64_t HKStateOfMindDomainIsKnown()
{
  return MEMORY[0x270EF3828]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _HKInitializeLogging()
{
  return MEMORY[0x270EF3970]();
}

uint64_t _HKLogDroppedError()
{
  return MEMORY[0x270EF3978]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x270EDA750](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
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

void objc_enumerationMutation(id obj)
{
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

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x270FA0228]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x270FA02D0]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x270FA0348]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x270FA0428]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x270FA0570]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x270FA05D0]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x270FA0628]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}