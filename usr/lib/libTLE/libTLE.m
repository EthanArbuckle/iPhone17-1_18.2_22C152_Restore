void TLE::orArrayOpDeserializer(const der_vm_context *a1@<X1>, _DWORD *a2@<X2>, uint64_t a3@<X8>)
{
  const char *v4;
  void **v5;
  void **v6;
  unint64_t v7;
  uint64_t v8;
  void **v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *exception;
  long long v14;
  void *v15[2];
  uint64_t v16;

  v16 = 0;
  v14 = 0u;
  *(_OWORD *)v15 = 0u;
  TLE::opArrayOpDeserializer(a1, a2, (uint64_t)&v14);
  if (v14)
  {
    *(_OWORD *)a3 = v14;
    *(void **)(a3 + 16) = v15[0];
    *(void *)(a3 + 24) = 0;
    v5 = (void **)v15[1];
    if (!v15[1]) {
      return;
    }
    goto LABEL_10;
  }
  if (v16 != 1) {
    operator new();
  }
  v6 = (void **)v15[1];
  if (!v15[1]) {
    goto LABEL_22;
  }
  v7 = 8 * v16;
  if ((char *)v15[1] + v7 < v15[1] || HIDWORD(v7)) {
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v4);
  }
  if ((v7 & 0xFFFFFFF8) == 0) {
LABEL_22:
  }
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v4);
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset((void **)(a3 + 24), *v6);
  v5 = (void **)v15[1];
  if (v15[1])
  {
LABEL_10:
    if (v16)
    {
      v8 = 8 * v16;
      v9 = v5;
      do
      {
        v10 = *v9;
        if (*v9)
        {
          v11 = v10[1];
          if (v11 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          v12 = v11 - 1;
          v10[1] = v12;
          if (!v12) {
            (*(void (**)(void *))(*v10 + 8))(v10);
          }
        }
        *v9++ = 0;
        v8 -= 8;
      }
      while (v8);
    }
    free(v5);
  }
}

void sub_228C60390(_Unwind_Exception *a1)
{
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v1 + 24);
  _Unwind_Resume(a1);
}

void TLE::opArrayOpDeserializer(const der_vm_context *a1@<X1>, _DWORD *a2@<X2>, uint64_t a3@<X8>)
{
  if (*a2)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 6;
    v4 = "factless operator disallowed for active fact";
    uint64_t v5 = 44;
LABEL_11:
    *(void *)(a3 + 8) = v4;
    *(void *)(a3 + 16) = v5;
    return;
  }
  long long v7 = *(_OWORD *)&a1->lookup.index_count;
  long long v31 = *(_OWORD *)&a1->runtime;
  long long v32 = v7;
  long long v33 = *(_OWORD *)&a1->sorted;
  der_end = a1->var0.ccstate.der_end;
  if (der_vm_CEType_from_context() != 2)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 3;
    v4 = "Got an unexpected type (not a sequence) when trying to read the array of matches.";
    uint64_t v5 = 81;
    goto LABEL_11;
  }
  unint64_t v8 = count_ce_elements(a1);
  if (!v8)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 4;
    v4 = "The array of dependent operations is empty.";
    uint64_t v5 = 43;
    goto LABEL_11;
  }
  unint64_t v9 = v8;
  uint64_t v30 = 0;
  if (HIDWORD(v8))
  {
    v10 = 0;
    LODWORD(v9) = 0;
  }
  else
  {
    v10 = malloc_type_malloc(8 * v8, 0x61F7200BuLL);
    bzero(v10, 8 * v9);
  }
  v29 = v10;
  LODWORD(v30) = v9;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x4002000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2000000000;
  v20[3] = 0;
  der_vm_iterate_b();
  v11 = v22 + 5;
  if (*((_DWORD *)v22 + 10))
  {
    *(_DWORD *)(a3 + 32) = 0;
    *(void *)(a3 + 24) = 0;
    long long v12 = *(_OWORD *)v11;
    *(void *)(a3 + 16) = v11[2];
    *(_OWORD *)a3 = v12;
  }
  else
  {
    *(_DWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::operator=(a3 + 24, (uint64_t)&v29);
  }
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v21, 8);
  v13 = v29;
  if (v29)
  {
    if (v30)
    {
      uint64_t v14 = 8 * v30;
      v15 = (void **)v29;
      do
      {
        v16 = *v15;
        if (*v15)
        {
          uint64_t v17 = v16[1];
          if (v17 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          uint64_t v18 = v17 - 1;
          v16[1] = v18;
          if (!v18) {
            (*(void (**)(void *))(*v16 + 8))(v16);
          }
        }
        *v15++ = 0;
        v14 -= 8;
      }
      while (v14);
    }
    free(v13);
  }
}

void sub_228C606A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v12 - 144);
  _Unwind_Resume(a1);
}

void os_detail::panic_trapping_policy::trap(os_detail::panic_trapping_policy *this, const char *a2)
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = this;
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void __clang_call_terminate(void *a1)
{
}

void **libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset(void **a1, void *a2)
{
  v3 = *a1;
  *a1 = a2;
  if (a2)
  {
    uint64_t v4 = a2[1];
    if (v4 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      unint64_t v9 = "Attempted resurection of an object";
      goto LABEL_11;
    }
    a2[1] = v4 + 1;
  }
  if (!v3) {
    return a1;
  }
  uint64_t v5 = v3[1];
  if (v5 <= 0)
  {
    exception = __cxa_allocate_exception(8uLL);
    unint64_t v9 = "Over-release of an object";
LABEL_11:
    void *exception = v9;
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  uint64_t v6 = v5 - 1;
  v3[1] = v6;
  if (!v6) {
    (*(void (**)(void *))(*v3 + 8))(v3);
  }
  return a1;
}

uint64_t libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(uint64_t a1)
{
  v2 = *(void ***)a1;
  if (*(void *)a1)
  {
    uint64_t v3 = *(unsigned int *)(a1 + 8);
    if (v3)
    {
      uint64_t v4 = 8 * v3;
      uint64_t v5 = *(void ***)a1;
      do
      {
        uint64_t v6 = *v5;
        if (*v5)
        {
          uint64_t v7 = v6[1];
          if (v7 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          uint64_t v8 = v7 - 1;
          v6[1] = v8;
          if (!v8) {
            (*(void (**)(void *))(*v6 + 8))(v6);
          }
        }
        *v5++ = 0;
        v4 -= 8;
      }
      while (v4);
    }
    free(v2);
  }
  return a1;
}

uint64_t count_ce_elements(const der_vm_context *a1)
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2000000000;
  uint64_t v6 = 0;
  der_vm_iterate_b();
  uint64_t v1 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_228C60964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void *___ZN3TLE21opArrayOpDeserializerERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE_block_invoke(uint64_t a1, const der_vm_context *a2)
{
  long long v37 = 0u;
  long long v38 = 0u;
  TLE::opTupleDeserializer(*(void *)(a1 + 48), a2 + 1, *(_DWORD **)(a1 + 56), (uint64_t)&v37);
  if (v37)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_OWORD *)(v4 + 40) = v37;
    __n128 result = (void *)*((void *)&v38 + 1);
    *(void *)(v4 + 56) = v38;
    if (result)
    {
      uint64_t v6 = result[1];
      if (v6 <= 0)
      {
        exception = __cxa_allocate_exception(8uLL);
        void *exception = "Over-release of an object";
        __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
      }
      uint64_t v7 = v6 - 1;
      result[1] = v7;
      if (!v7) {
        (*(void (**)(void *))(*result + 8))(result);
      }
      return 0;
    }
    return result;
  }
  uint64_t v8 = *(unint64_t **)(a1 + 64);
  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  unint64_t v10 = *v8;
  if (*v8)
  {
    unint64_t v11 = v10 + 8 * *((unsigned int *)v8 + 2);
    BOOL v12 = v11 >= v10;
    unint64_t v13 = v11 - v10;
    if (!v12 || HIDWORD(v13)) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v3);
    }
  }
  else
  {
    LODWORD(v13) = 0;
  }
  if (v9 >= 0) {
    unint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else {
    unint64_t v14 = -v9;
  }
  unint64_t v15 = ((unint64_t)v9 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
  if (v9 >= 0) {
    uint64_t v16 = 8 * v14;
  }
  else {
    uint64_t v16 = -8 * v14;
  }
  if (v14 >> 61) {
    BOOL v17 = 1;
  }
  else {
    BOOL v17 = 8 * v14 > v15;
  }
  if (v17)
  {
    uint64_t v18 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would trigger an overflow";
    goto LABEL_48;
  }
  if (v16 != (int)v16)
  {
    uint64_t v18 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current pos"
          "ition would overflow.";
    goto LABEL_48;
  }
  uint64_t v18 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
  if ((v16 & 0x80000000) != 0
    || (int)v16 + 8 > v13
    || ((v19 = (int)v16, v20 = (uint64_t)(int)v16 >> 63, uint64_t v21 = (void **)(v10 + v19), !__CFADD__(v10, v19))
      ? (uint64_t v22 = v20)
      : (uint64_t v22 = v20 + 1),
        (uint64_t v23 = v22 << 63 >> 63,
         uint64_t v18 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.",
         v23 ^ v22)
     || v23 < 0))
  {
LABEL_48:
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v18, v3);
  }
  v24 = (void *)*((void *)&v38 + 1);
  v25 = *v21;
  if (*v21)
  {
    uint64_t v26 = v25[1];
    if (v26 <= 0)
    {
      v36 = __cxa_allocate_exception(8uLL);
      void *v36 = "Over-release of an object";
      __cxa_throw(v36, MEMORY[0x263F8C1D8], 0);
    }
    uint64_t v27 = v26 - 1;
    v25[1] = v27;
    if (!v27) {
      (*(void (**)(void *))(*v25 + 8))(v25);
    }
  }
  *uint64_t v21 = v24;
  *((void *)&v38 + 1) = 0;
  uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v29 = *(void *)(v28 + 24);
  uint64_t v30 = v29 + 1;
  uint64_t v31 = v29 == -1;
  BOOL v33 = v31 << 63 >> 63 != v31 || v31 << 63 >> 63 == -1;
  if (v33)
  {
    uint64_t v34 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)(v34 + 40) = 10;
    *(void *)(v34 + 48) = "Array contains too many elements";
    *(void *)(v34 + 56) = 32;
  }
  else
  {
    *(void *)(v28 + 24) = v30;
  }
  return (void *)!v33;
}

void sub_228C60C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::operator=(uint64_t a1, uint64_t a2)
{
  if (a2 != a1)
  {
    uint64_t v3 = *(void ***)a1;
    uint64_t v4 = *(unsigned int *)(a1 + 8);
    *(void *)a1 = *(void *)a2;
    *(_DWORD *)(a1 + 8) = *(_DWORD *)(a2 + 8);
    *(void *)a2 = 0;
    *(_DWORD *)(a2 + 8) = 0;
    if (v3)
    {
      if (v4)
      {
        uint64_t v5 = 8 * v4;
        uint64_t v6 = v3;
        do
        {
          uint64_t v7 = *v6;
          if (*v6)
          {
            uint64_t v8 = v7[1];
            if (v8 <= 0)
            {
              exception = __cxa_allocate_exception(8uLL);
              void *exception = "Over-release of an object";
              __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
            }
            uint64_t v9 = v8 - 1;
            v7[1] = v9;
            if (!v9) {
              (*(void (**)(void *))(*v7 + 8))(v7);
            }
          }
          *v6++ = 0;
          v5 -= 8;
        }
        while (v5);
      }
      free(v3);
    }
  }
  return a1;
}

void TLE::opTupleDeserializer(uint64_t a1@<X0>, const der_vm_context *a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  if (*a3)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    uint64_t v5 = "factless operator disallowed for active fact";
    uint64_t v6 = 44;
  }
  else
  {
    long long v10 = *(_OWORD *)&a2->lookup.index_count;
    long long v16 = *(_OWORD *)&a2->runtime;
    long long v17 = v10;
    long long v18 = *(_OWORD *)&a2->sorted;
    der_end = a2->var0.ccstate.der_end;
    if (der_vm_CEType_from_context() == 2)
    {
      if (count_ce_elements(a2) == 2)
      {
        uint64_t v15 = 0;
        long long v13 = 0u;
        long long v14 = 0u;
        TLE::keyForContext(&v13);
        if (v13)
        {
          *(_OWORD *)a4 = v13;
          *(void *)(a4 + 16) = v14;
          *(void *)(a4 + 24) = 0;
          return;
        }
        uint64_t v12 = 0;
        memset(v11, 0, sizeof(v11));
        der_vm_execute_nocopy();
        if (der_vm_CEType_from_context() == 1)
        {
          if (!CEBuffer_cmp())
          {
            TLE::andDeserializer(a1, (uint64_t)v11, a3, a4);
            return;
          }
          if (!CEBuffer_cmp())
          {
            TLE::orDeserializer(a1, (uint64_t)v11, a3, a4);
            return;
          }
          if (!CEBuffer_cmp())
          {
            TLE::optionalOpDeserializer(a1, (uint64_t)v11, a4);
            return;
          }
        }
        else
        {
          if (der_vm_CEType_from_context() != 2)
          {
            *(_OWORD *)a4 = 0u;
            *(_OWORD *)(a4 + 16) = 0u;
            *(_DWORD *)a4 = 3;
            uint64_t v5 = "Unexpected type in Array tuple";
            uint64_t v6 = 30;
            goto LABEL_9;
          }
          if (!CEBuffer_cmp())
          {
            TLE::andArrayOpDeserializer(a4);
            return;
          }
          if (!CEBuffer_cmp())
          {
            TLE::orArrayOpDeserializer(a1, v11, a3);
            return;
          }
        }
        *(_OWORD *)a4 = 0u;
        *(_OWORD *)(a4 + 16) = 0u;
        *(_DWORD *)a4 = 9;
        uint64_t v5 = "Unexpected operator in Array tuple";
        uint64_t v6 = 34;
      }
      else
      {
        *(_OWORD *)a4 = 0u;
        *(_OWORD *)(a4 + 16) = 0u;
        *(_DWORD *)a4 = 6;
        uint64_t v5 = "Incorrect number of elements in operator Array tuple";
        uint64_t v6 = 52;
      }
    }
    else
    {
      *(_OWORD *)a4 = 0u;
      *(_OWORD *)(a4 + 16) = 0u;
      *(_DWORD *)a4 = 6;
      uint64_t v5 = "Non array element found in operator Array";
      uint64_t v6 = 41;
    }
  }
LABEL_9:
  *(void *)(a4 + 8) = v5;
  *(void *)(a4 + 16) = v6;
}

uint64_t TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple(uint64_t a1)
{
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
    }
    uint64_t v4 = v3 - 1;
    v2[1] = v4;
    if (!v4) {
      (*(void (**)(void *))(*v2 + 8))(v2);
    }
  }
  *(void *)(a1 + 24) = 0;
  return a1;
}

double TLE::keyForContext@<D0>(void *a1@<X8>)
{
  der_vm_execute_nocopy();
  if (der_vm_CEType_from_context() == 4)
  {
    uint64_t v4 = der_vm_string_from_context();
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
    a1[3] = v4;
    a1[4] = v6;
  }
  else
  {
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    a1[4] = 0;
    *(_DWORD *)a1 = 3;
    a1[1] = "Expected operator string in Array tuple";
    a1[2] = 39;
  }
  return result;
}

void TLE::andDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  if (*a3)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    *(void *)(a4 + 8) = "$and operator disallowed for active fact";
    *(void *)(a4 + 16) = 40;
    return;
  }
  uint64_t v19 = 0;
  long long v17 = 0u;
  *(_OWORD *)long long v18 = 0u;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v16.runtime = *(_OWORD *)a2;
  *(_OWORD *)&v16.lookup.index_count = v5;
  *(_OWORD *)&v16.sorted = *(_OWORD *)(a2 + 32);
  v16.var0.ccstate.der_end = *(char **)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(a1, &v16, (uint64_t)&v17);
  if (v17)
  {
    *(_OWORD *)a4 = v17;
    *(void **)(a4 + 16) = v18[0];
    *(void *)(a4 + 24) = 0;
    uint64_t v7 = (void **)v18[1];
    if (!v18[1]) {
      return;
    }
    goto LABEL_12;
  }
  if (v19 != 1) {
    operator new();
  }
  uint64_t v8 = (void **)v18[1];
  if (!v18[1]) {
    goto LABEL_24;
  }
  unint64_t v9 = 8 * v19;
  if ((char *)v18[1] + v9 < v18[1] || HIDWORD(v9)) {
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v6);
  }
  if ((v9 & 0xFFFFFFF8) == 0) {
LABEL_24:
  }
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v6);
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset((void **)(a4 + 24), *v8);
  uint64_t v7 = (void **)v18[1];
  if (v18[1])
  {
LABEL_12:
    if (v19)
    {
      uint64_t v10 = 8 * v19;
      unint64_t v11 = v7;
      do
      {
        uint64_t v12 = *v11;
        if (*v11)
        {
          uint64_t v13 = v12[1];
          if (v13 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          uint64_t v14 = v13 - 1;
          v12[1] = v14;
          if (!v14) {
            (*(void (**)(void *))(*v12 + 8))(v12);
          }
        }
        *v11++ = 0;
        v10 -= 8;
      }
      while (v10);
    }
    free(v7);
  }
}

void sub_228C613CC(_Unwind_Exception *a1)
{
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v1 + 24);
  _Unwind_Resume(a1);
}

void TLE::orDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  if (*a3)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    *(void *)(a4 + 8) = "$or operator disallowed for active fact";
    *(void *)(a4 + 16) = 39;
    return;
  }
  uint64_t v19 = 0;
  long long v17 = 0u;
  *(_OWORD *)long long v18 = 0u;
  long long v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v16.runtime = *(_OWORD *)a2;
  *(_OWORD *)&v16.lookup.index_count = v5;
  *(_OWORD *)&v16.sorted = *(_OWORD *)(a2 + 32);
  v16.var0.ccstate.der_end = *(char **)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(a1, &v16, (uint64_t)&v17);
  if (v17)
  {
    *(_OWORD *)a4 = v17;
    *(void **)(a4 + 16) = v18[0];
    *(void *)(a4 + 24) = 0;
    uint64_t v7 = (void **)v18[1];
    if (!v18[1]) {
      return;
    }
    goto LABEL_12;
  }
  if (v19 != 1) {
    operator new();
  }
  uint64_t v8 = (void **)v18[1];
  if (!v18[1]) {
    goto LABEL_24;
  }
  unint64_t v9 = 8 * v19;
  if ((char *)v18[1] + v9 < v18[1] || HIDWORD(v9)) {
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v6);
  }
  if ((v9 & 0xFFFFFFF8) == 0) {
LABEL_24:
  }
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v6);
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset((void **)(a4 + 24), *v8);
  uint64_t v7 = (void **)v18[1];
  if (v18[1])
  {
LABEL_12:
    if (v19)
    {
      uint64_t v10 = 8 * v19;
      unint64_t v11 = v7;
      do
      {
        uint64_t v12 = *v11;
        if (*v11)
        {
          uint64_t v13 = v12[1];
          if (v13 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          uint64_t v14 = v13 - 1;
          v12[1] = v14;
          if (!v14) {
            (*(void (**)(void *))(*v12 + 8))(v12);
          }
        }
        *v11++ = 0;
        v10 -= 8;
      }
      while (v10);
    }
    free(v7);
  }
}

void sub_228C61608(_Unwind_Exception *a1)
{
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v1 + 24);
  _Unwind_Resume(a1);
}

void TLE::optionalOpDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v17 = 0;
  long long v15 = 0u;
  *(_OWORD *)der_vm_context v16 = 0u;
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v14.runtime = *(_OWORD *)a2;
  *(_OWORD *)&v14.lookup.index_count = v4;
  *(_OWORD *)&v14.sorted = *(_OWORD *)(a2 + 32);
  v14.var0.ccstate.der_end = *(char **)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(a1, &v14, (uint64_t)&v15);
  if (v15)
  {
    *(_OWORD *)a3 = v15;
    *(void **)(a3 + 16) = v16[0];
    *(void *)(a3 + 24) = 0;
    uint64_t v6 = (void **)v16[1];
    if (!v16[1]) {
      return;
    }
    goto LABEL_11;
  }
  if (v17 == 1)
  {
    if (v16[1])
    {
      unint64_t v7 = 8 * v17;
      if ((char *)v16[1] + v7 < v16[1] || HIDWORD(v7)) {
        os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v5);
      }
      if ((v7 & 0xFFFFFFF8) != 0) {
        operator new();
      }
    }
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v5);
  }
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_DWORD *)a3 = 6;
  *(void *)(a3 + 8) = "$optional only supports a single dependent operation";
  *(void *)(a3 + 16) = 52;
  uint64_t v6 = (void **)v16[1];
  if (v16[1])
  {
LABEL_11:
    if (v17)
    {
      uint64_t v8 = 8 * v17;
      unint64_t v9 = v6;
      do
      {
        uint64_t v10 = *v9;
        if (*v9)
        {
          uint64_t v11 = v10[1];
          if (v11 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          uint64_t v12 = v11 - 1;
          v10[1] = v12;
          if (!v12) {
            (*(void (**)(void *))(*v10 + 8))(v10);
          }
        }
        *v9++ = 0;
        v8 -= 8;
      }
      while (v8);
    }
    free(v6);
  }
}

void sub_228C6183C(_Unwind_Exception *a1)
{
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v1);
  _Unwind_Resume(a1);
}

void TLE::andArrayOpDeserializer(uint64_t a1@<X8>)
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  *(_OWORD *)uint64_t v13 = 0u;
  TLE::opArrayOpDeserializer(&v12);
  if (v12)
  {
    *(_OWORD *)a1 = v12;
    *(void **)(a1 + 16) = v13[0];
    *(void *)(a1 + 24) = 0;
    uint64_t v3 = (void **)v13[1];
    if (!v13[1]) {
      return;
    }
    goto LABEL_10;
  }
  if (v14 != 1) {
    operator new();
  }
  long long v4 = (void **)v13[1];
  if (!v13[1]) {
    goto LABEL_22;
  }
  unint64_t v5 = 8 * v14;
  if ((char *)v13[1] + v5 < v13[1] || HIDWORD(v5)) {
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v2);
  }
  if ((v5 & 0xFFFFFFF8) == 0) {
LABEL_22:
  }
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v2);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset((void **)(a1 + 24), *v4);
  uint64_t v3 = (void **)v13[1];
  if (v13[1])
  {
LABEL_10:
    if (v14)
    {
      uint64_t v6 = 8 * v14;
      unint64_t v7 = v3;
      do
      {
        uint64_t v8 = *v7;
        if (*v7)
        {
          uint64_t v9 = v8[1];
          if (v9 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          uint64_t v10 = v9 - 1;
          v8[1] = v10;
          if (!v10) {
            (*(void (**)(void *))(*v8 + 8))(v8);
          }
        }
        *v7++ = 0;
        v6 -= 8;
      }
      while (v6);
    }
    free(v3);
  }
}

void sub_228C61A20(_Unwind_Exception *a1)
{
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v1 + 24);
  _Unwind_Resume(a1);
}

void TLE::Executor::getDependentOpsFromDictionary(uint64_t a1@<X0>, const der_vm_context *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = *(void *)(a1 + 8);
  *(void *)(a1 + 8) = v5 + 1;
  if ((unint64_t)(v5 + 1) >= 6)
  {
    *(void *)(a1 + 8) = v5;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 8;
    uint64_t v6 = "Constraint is too deeply nested. Failing to avoid recursion overflow";
    uint64_t v7 = 68;
LABEL_11:
    *(void *)(a3 + 8) = v6;
    *(void *)(a3 + 16) = v7;
    return;
  }
  long long v9 = *(_OWORD *)&a2->lookup.index_count;
  long long v34 = *(_OWORD *)&a2->runtime;
  long long v35 = v9;
  long long v36 = *(_OWORD *)&a2->sorted;
  der_end = a2->var0.ccstate.der_end;
  if (der_vm_CEType_from_context() != 1)
  {
    --*(void *)(a1 + 8);
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 3;
    uint64_t v6 = "Got an unexpected type (not a dictionary) when trying to generate dependent operations for evaluation.";
    uint64_t v7 = 102;
    goto LABEL_11;
  }
  unint64_t v10 = count_ce_elements(a2);
  if (!v10)
  {
    --*(void *)(a1 + 8);
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)(a3 + 32) = 0;
    *(_DWORD *)a3 = 4;
    uint64_t v6 = "The dictionary of dependent operations is empty.";
    uint64_t v7 = 48;
    goto LABEL_11;
  }
  unint64_t v11 = v10;
  uint64_t v33 = 0;
  if (HIDWORD(v10))
  {
    long long v12 = 0;
    LODWORD(v11) = 0;
  }
  else
  {
    long long v12 = malloc_type_malloc(8 * v10, 0x61F7200BuLL);
    bzero(v12, 8 * v11);
  }
  long long v32 = v12;
  LODWORD(v33) = v11;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x4002000000;
  uint64_t v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2000000000;
  v23[3] = 0;
  der_vm_iterate_b();
  uint64_t v13 = v25 + 5;
  int v14 = *((_DWORD *)v25 + 10);
  --*(void *)(a1 + 8);
  *(_DWORD *)(a3 + 32) = 0;
  if (v14)
  {
    *(void *)(a3 + 24) = 0;
    long long v15 = *(_OWORD *)v13;
    *(void *)(a3 + 16) = v13[2];
    *(_OWORD *)a3 = v15;
  }
  else
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::operator=(a3 + 24, (uint64_t)&v32);
  }
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v24, 8);
  der_vm_context v16 = v32;
  if (v32)
  {
    if (v33)
    {
      uint64_t v17 = 8 * v33;
      long long v18 = (void **)v32;
      do
      {
        uint64_t v19 = *v18;
        if (*v18)
        {
          uint64_t v20 = v19[1];
          if (v20 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          uint64_t v21 = v20 - 1;
          v19[1] = v21;
          if (!v21) {
            (*(void (**)(void *))(*v19 + 8))(v19);
          }
        }
        *v18++ = 0;
        v17 -= 8;
      }
      while (v17);
    }
    free(v16);
  }
}

void sub_228C61D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v14 - 160);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3TLE8Executor29getDependentOpsFromDictionaryE14der_vm_contextRKNS_14FactDefinitionEbmPK8CEBuffer_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v116 = *MEMORY[0x263EF8340];
  v105 = *(void **)(a1 + 48);
  memset(v114, 0, 40);
  uint64_t v3 = (long long *)(a2 + 56);
  TLE::keyForContext(v114);
  if (LODWORD(v114[0]))
  {
    uint64_t result = 0;
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_OWORD *)(v5 + 40) = v114[0];
    *(void *)(v5 + 56) = *(void *)&v114[1];
    return result;
  }
  uint64_t v113 = 0;
  memset(v112, 0, sizeof(v112));
  long long v6 = v3[1];
  long long v108 = *v3;
  long long v109 = v6;
  long long v110 = v3[2];
  uint64_t v111 = *((void *)v3 + 6);
  der_vm_execute_nocopy();
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8)
  {
    long long v9 = (unsigned char *)*((void *)&v114[1] + 1);
    uint64_t v10 = *(void *)(a1 + 64) + 8;
    while (1)
    {
      uint64_t result = CEBuffer_cmp();
      if (!result) {
        break;
      }
      v10 += 16;
      if (!--v8) {
        goto LABEL_9;
      }
    }
    uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)(v27 + 40) = 6;
    uint64_t v28 = "Unexpected key for parsing context";
    uint64_t v29 = 34;
    goto LABEL_48;
  }
  long long v9 = (unsigned char *)*((void *)&v114[1] + 1);
LABEL_9:
  if (*v9 != 36)
  {
    if (!*(unsigned char *)(a1 + 88))
    {
      uint64_t result = 0;
      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)(v27 + 40) = 6;
      uint64_t v28 = "Fact not allowed in context";
      uint64_t v29 = 27;
LABEL_48:
      *(void *)(v27 + 48) = v28;
      *(void *)(v27 + 56) = v29;
      return result;
    }
    if (((*(uint64_t (**)(void, unsigned char *, void))(*(void *)*v105 + 32))(*v105, v9, *(void *)&v114[2]) & 1) == 0)
    {
      *(_OWORD *)((char *)v115 + 4) = *(_OWORD *)((char *)&v114[1] + 8);
      operator new();
    }
    uint64_t v106 = 0;
    long long v107 = 0uLL;
    (*(void (**)(uint64_t *__return_ptr))(*(void *)*v105 + 16))(&v106);
    int v24 = der_vm_CEType_from_context();
    if (v24 == 1)
    {
      memset(v115, 0, sizeof(v115));
      TLE::factOpDeserializer((uint64_t)v105, (uint64_t)v112, (uint64_t)&v106, (uint64_t)v115);
      if (LODWORD(v115[0]))
      {
        uint64_t v26 = *(void *)(*(void *)(a1 + 32) + 8);
        *(_OWORD *)(v26 + 40) = v115[0];
        *(void *)(v26 + 56) = *(void *)&v115[1];
        TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple((uint64_t)v115);
        return 0;
      }
      v75 = *(unint64_t **)(a1 + 80);
      uint64_t v76 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      unint64_t v77 = *v75;
      if (*v75)
      {
        unint64_t v78 = v77 + 8 * *((unsigned int *)v75 + 2);
        BOOL v38 = v78 >= v77;
        unint64_t v79 = v78 - v77;
        if (!v38 || HIDWORD(v79)) {
          os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v25);
        }
      }
      else
      {
        LODWORD(v79) = 0;
      }
      if (v76 >= 0) {
        unint64_t v80 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      else {
        unint64_t v80 = -v76;
      }
      unint64_t v81 = ((unint64_t)v76 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
      if (v76 >= 0) {
        uint64_t v82 = 8 * v80;
      }
      else {
        uint64_t v82 = -8 * v80;
      }
      if (v80 >> 61) {
        BOOL v83 = 1;
      }
      else {
        BOOL v83 = 8 * v80 > v81;
      }
      if (v83)
      {
        v84 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would "
              "trigger an overflow";
      }
      else if (v82 == (int)v82)
      {
        v84 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
        if ((v82 & 0x80000000) == 0 && (int)v82 + 8 <= v79)
        {
          uint64_t v85 = (int)v82;
          uint64_t v86 = (uint64_t)(int)v82 >> 63;
          BOOL v38 = __CFADD__(v77, v85);
          v87 = (void **)(v77 + v85);
          if (v38) {
            ++v86;
          }
          uint64_t v88 = v86 << 63 >> 63;
          v84 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
          if (v88 == v86 && (v88 & 0x8000000000000000) == 0)
          {
            libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::operator=(v87, (void *)&v115[1] + 1);
            TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple((uint64_t)v115);
LABEL_157:
            uint64_t v63 = *(void *)(*(void *)(a1 + 40) + 8);
            uint64_t v64 = *(void *)(v63 + 24);
LABEL_158:
            uint64_t v98 = v64 + 1;
            uint64_t v99 = v64 == -1;
            BOOL v101 = v99 << 63 >> 63 != v99 || v99 << 63 >> 63 == -1;
            if (v101)
            {
              uint64_t v102 = *(void *)(*(void *)(a1 + 32) + 8);
              *(_DWORD *)(v102 + 40) = 10;
              *(void *)(v102 + 48) = "Too many elements in dictionary";
              *(void *)(v102 + 56) = 31;
            }
            else
            {
              *(void *)(v63 + 24) = v98;
            }
            return !v101;
          }
        }
      }
      else
      {
        v84 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current"
              " position would overflow.";
      }
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v84, v25);
    }
    if (v24 == v106)
    {
      uint64_t v40 = TLE::opForContext(v24);
      if (v40)
      {
        *(_OWORD *)(v40 + 16) = v107;
        *(void *)&v115[0] = v40;
        v42 = *(unint64_t **)(a1 + 80);
        uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        unint64_t v44 = *v42;
        if (*v42)
        {
          unint64_t v45 = v44 + 8 * *((unsigned int *)v42 + 2);
          BOOL v38 = v45 >= v44;
          unint64_t v46 = v45 - v44;
          if (!v38 || HIDWORD(v46)) {
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v41);
          }
        }
        else
        {
          LODWORD(v46) = 0;
        }
        if (v43 >= 0) {
          unint64_t v89 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        }
        else {
          unint64_t v89 = -v43;
        }
        unint64_t v90 = ((unint64_t)v43 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
        if (v43 >= 0) {
          uint64_t v91 = 8 * v89;
        }
        else {
          uint64_t v91 = -8 * v89;
        }
        if (v89 >> 61) {
          BOOL v92 = 1;
        }
        else {
          BOOL v92 = 8 * v89 > v90;
        }
        if (v92)
        {
          v93 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) woul"
                "d trigger an overflow";
        }
        else if (v91 == (int)v91)
        {
          v93 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
          if ((v91 & 0x80000000) == 0 && (int)v91 + 8 <= v46)
          {
            uint64_t v94 = (int)v91;
            uint64_t v95 = (uint64_t)(int)v91 >> 63;
            BOOL v38 = __CFADD__(v44, v94);
            v96 = (void **)(v44 + v94);
            if (v38) {
              ++v95;
            }
            uint64_t v97 = v95 << 63 >> 63;
            v93 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
            if (v97 == v95 && (v97 & 0x8000000000000000) == 0)
            {
              libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::operator=(v96, v115);
              libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::~intrusive_shared_ptr((void **)v115);
              goto LABEL_157;
            }
          }
        }
        else
        {
          v93 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the curre"
                "nt position would overflow.";
        }
        os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v93, v41);
      }
      uint64_t v47 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)(v47 + 40) = 3;
      v48 = "Unexpected type of an fact declaration.";
      uint64_t v49 = 39;
    }
    else
    {
      uint64_t v47 = *(void *)(*(void *)(a1 + 32) + 8);
      *(_DWORD *)(v47 + 40) = 3;
      v48 = "Unexpected type of an operation declaration.";
      uint64_t v49 = 44;
    }
    *(void *)(v47 + 48) = v48;
    *(void *)(v47 + 56) = v49;
    return 0;
  }
  unint64_t v11 = TLE::operations;
  long long v12 = &TLE::operations[3 * dword_2682A3CB0];
  if (v12 < TLE::operations || (24 * (unint64_t)dword_2682A3CB0) >> 32) {
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v7);
  }
  unint64_t v14 = (unint64_t)((unint64_t)v12 - (unsigned __int128)(unint64_t)TLE::operations) >> 64;
  unint64_t v13 = 24 * dword_2682A3CB0;
  if (v13 >= 0xFFFFFFFF80000000) {
    LOBYTE(v14) = v14 + 1;
  }
  if (v14 & 1 | ((v13 + 0x80000000) >> 32)) {
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The offset of the pointer inside its valid memory range can't be represented using int32_t", v7);
  }
  long long v15 = (char *)TLE::operations + (int)v13;
  if (__CFADD__(TLE::operations, (int)v13)) {
    uint64_t v16 = ((uint64_t)(int)v13 >> 63) + 1;
  }
  else {
    uint64_t v16 = (uint64_t)(int)v13 >> 63;
  }
  uint64_t v17 = v16 << 63 >> 63;
  uint64_t v18 = v17 ^ v16;
  if (v17 < 0 || v18 != 0) {
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", v7);
  }
  for (uint64_t i = (24 * dword_2682A3CB0); ; i += 0x1800000000)
  {
    uint64_t v21 = (char *)v11 + (i >> 32);
    if (__CFADD__(v11, i >> 32)) {
      uint64_t v22 = (i >> 63) + 1;
    }
    else {
      uint64_t v22 = i >> 63;
    }
    uint64_t v23 = v22 << 63 >> 63;
    if (v23 != v22 || v23 < 0) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", v7);
    }
    if (v21 == v15) {
      goto LABEL_87;
    }
    if (i < 0 || HIDWORD(i) + 24 > i) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v7);
    }
    if (!CEBuffer_cmp()) {
      break;
    }
    if ((unint64_t)((i >> 32) - 2147483624) < 0xFFFFFFFF00000000) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current position would overflow.", v7);
    }
  }
  memset(v115, 0, sizeof(v115));
  (*((void (**)(_OWORD *__return_ptr, void *, _OWORD *, void))v21 + 2))(v115, v105, v112, *(void *)(a1 + 72));
  if (!LODWORD(v115[0]))
  {
    long long v34 = *(unint64_t **)(a1 + 80);
    uint64_t v35 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    unint64_t v36 = *v34;
    if (*v34)
    {
      unint64_t v37 = v36 + 8 * *((unsigned int *)v34 + 2);
      BOOL v38 = v37 >= v36;
      unint64_t v39 = v37 - v36;
      if (!v38 || HIDWORD(v39)) {
        os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v7);
      }
    }
    else
    {
      LODWORD(v39) = 0;
    }
    if (v35 >= 0) {
      unint64_t v50 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    else {
      unint64_t v50 = -v35;
    }
    unint64_t v51 = ((unint64_t)v35 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
    if (v35 >= 0) {
      uint64_t v52 = 8 * v50;
    }
    else {
      uint64_t v52 = -8 * v50;
    }
    if (v50 >> 61) {
      BOOL v53 = 1;
    }
    else {
      BOOL v53 = 8 * v50 > v51;
    }
    if (v53)
    {
      v54 = "bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would tr"
            "igger an overflow";
    }
    else if (v52 == (int)v52)
    {
      v54 = "bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally";
      if ((v52 & 0x80000000) == 0 && (int)v52 + 8 <= v39)
      {
        v55 = (void **)(v36 + (int)v52);
        uint64_t v56 = __CFADD__(v36, (int)v52) ? ((uint64_t)(int)v52 >> 63) + 1 : (uint64_t)(int)v52 >> 63;
        uint64_t v57 = v56 << 63 >> 63;
        v54 = "This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.";
        if (v57 == v56 && (v57 & 0x8000000000000000) == 0)
        {
          v58 = (void *)*((void *)&v115[1] + 1);
          v59 = *v55;
          if (*v55)
          {
            uint64_t v60 = v59[1];
            if (v60 <= 0)
            {
              exception = __cxa_allocate_exception(8uLL);
              void *exception = "Over-release of an object";
              __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
            }
            uint64_t v61 = v60 - 1;
            v59[1] = v61;
            if (!v61) {
              (*(void (**)(void *))(*v59 + 8))(v59);
            }
          }
          *v55 = v58;
LABEL_87:
          v62 = *(unint64_t **)(a1 + 80);
          uint64_t v63 = *(void *)(*(void *)(a1 + 40) + 8);
          uint64_t v64 = *(void *)(v63 + 24);
          unint64_t v65 = *v62;
          if (*v62)
          {
            unint64_t v66 = v65 + 8 * *((unsigned int *)v62 + 2);
            BOOL v38 = v66 >= v65;
            unint64_t v67 = v66 - v65;
            if (!v38 || HIDWORD(v67)) {
              os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v7);
            }
          }
          else
          {
            LODWORD(v67) = 0;
          }
          if (v64 >= 0) {
            unint64_t v68 = *(void *)(v63 + 24);
          }
          else {
            unint64_t v68 = -v64;
          }
          if (v64 >= 0) {
            uint64_t v69 = 8 * v68;
          }
          else {
            uint64_t v69 = -8 * v68;
          }
          if (v68 >> 61) {
            BOOL v70 = 1;
          }
          else {
            BOOL v70 = 8 * v68 > ((unint64_t)v64 >> 63) + 0x7FFFFFFFFFFFFFFFLL;
          }
          if (v70) {
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Calculating the number of bytes to add to the offset (n * sizeof(T)) would trigger an overflow", v7);
          }
          if (v69 != (int)v69) {
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current position would overflow.", v7);
          }
          if ((v69 & 0x80000000) != 0 || (int)v69 + 8 > v67) {
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v7);
          }
          uint64_t v71 = (int)v69;
          uint64_t v72 = (uint64_t)(int)v69 >> 63;
          BOOL v38 = __CFADD__(v65, v71);
          v73 = (void *)(v65 + v71);
          if (v38) {
            ++v72;
          }
          uint64_t v74 = v72 << 63 >> 63;
          if (v74 != v72 || v74 < 0) {
            os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", v7);
          }
          if (!*v73)
          {
            *(_OWORD *)((char *)v115 + 4) = *(_OWORD *)((char *)&v114[1] + 8);
            operator new();
          }
          goto LABEL_158;
        }
      }
    }
    else
    {
      v54 = "bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current p"
            "osition would overflow.";
    }
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)v54, v7);
  }
  uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 8);
  *(_OWORD *)(v30 + 40) = v115[0];
  uint64_t v31 = (void *)*((void *)&v115[1] + 1);
  *(void *)(v30 + 56) = *(void *)&v115[1];
  if (v31)
  {
    uint64_t v32 = v31[1];
    if (v32 <= 0)
    {
      v103 = __cxa_allocate_exception(8uLL);
      void *v103 = "Over-release of an object";
      __cxa_throw(v103, MEMORY[0x263F8C1D8], 0);
    }
    uint64_t v33 = v32 - 1;
    v31[1] = v33;
    if (!v33) {
      (*(void (**)(void *))(*v31 + 8))(v31);
    }
  }
  return 0;
}

void sub_228C62AA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void **libkern::intrusive_shared_ptr<TLE::ConstErrorOperation,TLE::RefCountPolicy>::~intrusive_shared_ptr(void **a1)
{
  v2 = *a1;
  if (v2)
  {
    uint64_t v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
    }
    uint64_t v4 = v3 - 1;
    v2[1] = v4;
    if (!v4) {
      (*(void (**)(void *))(*v2 + 8))(v2);
    }
  }
  *a1 = 0;
  return a1;
}

void TLE::factOpDeserializer(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  *(_OWORD *)uint64_t v19 = 0u;
  long long v5 = *(_OWORD *)(a2 + 16);
  v16[0] = *(_OWORD *)a2;
  v16[1] = v5;
  v16[2] = *(_OWORD *)(a2 + 32);
  uint64_t v17 = *(void *)(a2 + 48);
  TLE::Executor::getDependentOpsFromDictionary(&v18, a1, v16, a3, 0, 0, 0);
  if (v18)
  {
    *(_OWORD *)a4 = v18;
    *(void **)(a4 + 16) = v19[0];
    *(void *)(a4 + 24) = 0;
    uint64_t v7 = (void **)v19[1];
    if (!v19[1]) {
      return;
    }
    goto LABEL_12;
  }
  if (v20 != 1)
  {
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_DWORD *)a4 = 6;
    *(void *)(a4 + 8) = "There should only be one operation to match a fact";
    *(void *)(a4 + 16) = 50;
    uint64_t v7 = (void **)v19[1];
    if (!v19[1]) {
      return;
    }
    goto LABEL_12;
  }
  uint64_t v8 = (void **)v19[1];
  if (!v19[1]) {
    goto LABEL_23;
  }
  unint64_t v9 = 8 * v20;
  if ((char *)v19[1] + v9 < v19[1] || HIDWORD(v9)) {
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v6);
  }
  if ((v9 & 0xFFFFFFF8) == 0) {
LABEL_23:
  }
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v6);
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset((void **)(a4 + 24), *v8);
  uint64_t v7 = (void **)v19[1];
  if (v19[1])
  {
LABEL_12:
    if (v20)
    {
      uint64_t v10 = 8 * v20;
      unint64_t v11 = v7;
      do
      {
        long long v12 = *v11;
        if (*v11)
        {
          uint64_t v13 = v12[1];
          if (v13 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          uint64_t v14 = v13 - 1;
          v12[1] = v14;
          if (!v14) {
            (*(void (**)(void *))(*v12 + 8))(v12);
          }
        }
        *v11++ = 0;
        v10 -= 8;
      }
      while (v10);
    }
    free(v7);
  }
}

void sub_228C62D90(_Unwind_Exception *a1)
{
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v1);
  _Unwind_Resume(a1);
}

void **libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::operator=(void **a1, void *a2)
{
  uint64_t v4 = (void *)*a2;
  long long v5 = *a1;
  if (v5)
  {
    uint64_t v6 = v5[1];
    if (v6 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
    }
    uint64_t v7 = v6 - 1;
    v5[1] = v7;
    if (!v7) {
      (*(void (**)(void *))(*v5 + 8))(v5);
    }
  }
  *a1 = v4;
  *a2 = 0;
  return a1;
}

uint64_t TLE::opForContext(int a1)
{
  switch(a1)
  {
    case 3:
      operator new();
    case 4:
      operator new();
    case 5:
      operator new();
    case 6:
      operator new();
    default:
      return 0;
  }
}

void sub_228C6305C(_Unwind_Exception *a1)
{
  MEMORY[0x22A6A8D40](v1, 0x10D1C40478F9E52);
  _Unwind_Resume(a1);
}

void **libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::~intrusive_shared_ptr(void **a1)
{
  v2 = *a1;
  if (v2)
  {
    uint64_t v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
    }
    uint64_t v4 = v3 - 1;
    v2[1] = v4;
    if (!v4) {
      (*(void (**)(void *))(*v2 + 8))(v2);
    }
  }
  *a1 = 0;
  return a1;
}

uint64_t TLE::Operation::shouldIgnore(TLE::Operation *this)
{
  return 0;
}

void *_ZN3TLE12BinaryDataOpI8CEBufferXtlNS_3__8EEEE7ExecuteERNS_12EncyclopediaE@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t result = (*(void *(**)(_OWORD *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(v5, a2, *(void *)(a1 + 16), *(void *)(a1 + 24));
  if (LODWORD(v5[0]) == 6)
  {
    uint64_t result = (void *)CEBuffer_cmp();
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = result == 0;
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Invalid fact type for this operation (expected data)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 52;
  }
  return result;
}

void _ZN3TLE12BinaryDataOpI8CEBufferXtlNS_3__8EEEED0Ev(void *a1)
{
  *a1 = &unk_26DD32DC8;
  if (!a1[1])
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void TLE::RefCounted::~RefCounted(TLE::RefCounted *this)
{
  *(void *)this = &unk_26DD32DC8;
  if (!*((void *)this + 1))
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

{
  void *exception;

  *(void *)this = &unk_26DD32DC8;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
}

void *_ZN3TLE12BinaryDataOpI8CEBufferXtlNS_3__8EEEED1Ev(void *result)
{
  *uint64_t result = &unk_26DD32DC8;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  return result;
}

void *_ZN3TLE11BinaryStrOpI8CEBufferXtlNS_3__7EEEE7ExecuteERNS_12EncyclopediaE@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t result = (*(void *(**)(_OWORD *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(v5, a2, *(void *)(a1 + 16), *(void *)(a1 + 24));
  if (LODWORD(v5[0]) == 4)
  {
    uint64_t result = (void *)CEBuffer_cmp();
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = result == 0;
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Invalid fact type for this operation (expected a string)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 56;
  }
  return result;
}

void _ZN3TLE11BinaryStrOpI8CEBufferXtlNS_3__7EEEED0Ev(void *a1)
{
  *a1 = &unk_26DD32DC8;
  if (!a1[1])
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void *_ZN3TLE11BinaryStrOpI8CEBufferXtlNS_3__7EEEED1Ev(void *result)
{
  *uint64_t result = &unk_26DD32DC8;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__6EEEE7ExecuteERNS_12EncyclopediaE@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t result = (*(void *(**)(long long *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if (v8 == 3 || v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) == a1[4];
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = v7;
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66;
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__6EEEED0Ev(void *a1)
{
  *a1 = &unk_26DD32DC8;
  if (!a1[1])
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__6EEEED1Ev(void *result)
{
  *uint64_t result = &unk_26DD32DC8;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  return result;
}

void *_ZN3TLE11BinaryIntOpIbXtlNS_3__5EEEE7ExecuteERNS_12EncyclopediaE@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v11 = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t result = (*(void *(**)(long long *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(&v9, a2, *(void *)(a1 + 16), *(void *)(a1 + 24));
  if (v9 == 3 || v9 == 5)
  {
    BOOL v7 = *((void *)&v10 + 1) == 0;
    BOOL v8 = *(unsigned char *)(a1 + 32) != 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = v7 ^ v8;
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66;
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIbXtlNS_3__5EEEED0Ev(void *a1)
{
  *a1 = &unk_26DD32DC8;
  if (!a1[1])
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void *_ZN3TLE11BinaryIntOpIbXtlNS_3__5EEEED1Ev(void *result)
{
  *uint64_t result = &unk_26DD32DC8;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  return result;
}

__n128 TLE::ConstErrorOperation::Execute@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  a2[1].n128_u8[8] = 0;
  __n128 result = a1[2];
  *a2 = result;
  a2[1].n128_u64[0] = a1[3].n128_u64[0];
  return result;
}

void TLE::ConstErrorOperation::~ConstErrorOperation(TLE::ConstErrorOperation *this)
{
  *(void *)this = &unk_26DD32DC8;
  if (!*((void *)this + 1))
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

{
  void *exception;

  *(void *)this = &unk_26DD32DC8;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
}

uint64_t ___ZL17count_ce_elementsRK14der_vm_context_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void *)(v1 + 24);
  BOOL v3 = __CFADD__(v2, 1);
  uint64_t v4 = v2 + 1;
  uint64_t v5 = v3;
  BOOL v6 = v5 << 63 >> 63 != v5 || v5 << 63 >> 63 == -1;
  int v7 = v6;
  if (!v6) {
    *(void *)(v1 + 24) = v4;
  }
  return v7 ^ 1u;
}

void TLE::queryOpDeserializer(_DWORD *a1@<X2>, uint64_t a2@<X8>)
{
  if (*a1 == 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = &v3;
    uint64_t v5 = 0x2000000000;
    char v6 = 1;
    der_vm_iterate_b();
    if (*((unsigned char *)v4 + 24)) {
      operator new();
    }
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_DWORD *)a2 = 6;
    *(void *)(a2 + 8) = "$query deserialization failed since it has an invalid query definition";
    *(void *)(a2 + 16) = 70;
    _Block_object_dispose(&v3, 8);
  }
  else
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_DWORD *)a2 = 3;
    *(void *)(a2 + 8) = "Got an unexpected type (not a dictionary) when trying to generate a query operation.";
    *(void *)(a2 + 16) = 84;
  }
}

void sub_228C63B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3TLE19queryOpDeserializerERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 116) == 2 && count_ce_elements((const der_vm_context *)(a2 + 56)) == 2) {
    return 1;
  }
  uint64_t result = 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__4EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(_DWORD *a1@<X2>, uint64_t a2@<X8>)
{
  if (*a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    der_vm_integer_from_context();
    operator new();
  }
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)a2 = 3;
  *(void *)(a2 + 8) = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
  *(void *)(a2 + 16) = 85;
  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__4EEEE7ExecuteERNS_12EncyclopediaE@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  double result = (*(void *(**)(long long *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if (v8 == 3 || v8 == 5)
  {
    BOOL v7 = (a1[4] & ~*((void *)&v9 + 1)) == 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = v7;
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66;
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__4EEEED0Ev(void *a1)
{
  *a1 = &unk_26DD32DC8;
  if (!a1[1])
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__4EEEED1Ev(void *result)
{
  *double result = &unk_26DD32DC8;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  return result;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__3EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(_DWORD *a1@<X2>, uint64_t a2@<X8>)
{
  if (*a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    der_vm_integer_from_context();
    operator new();
  }
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)a2 = 3;
  *(void *)(a2 + 8) = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
  *(void *)(a2 + 16) = 85;
  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__3EEEE7ExecuteERNS_12EncyclopediaE@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  double result = (*(void *(**)(long long *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if (v8 == 3 || v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) >= a1[4];
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = v7;
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66;
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__3EEEED0Ev(void *a1)
{
  *a1 = &unk_26DD32DC8;
  if (!a1[1])
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__3EEEED1Ev(void *result)
{
  *double result = &unk_26DD32DC8;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  return result;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__2EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(_DWORD *a1@<X2>, uint64_t a2@<X8>)
{
  if (*a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    der_vm_integer_from_context();
    operator new();
  }
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)a2 = 3;
  *(void *)(a2 + 8) = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
  *(void *)(a2 + 16) = 85;
  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__2EEEE7ExecuteERNS_12EncyclopediaE@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  double result = (*(void *(**)(long long *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if (v8 == 3 || v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) > a1[4];
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = v7;
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66;
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__2EEEED0Ev(void *a1)
{
  *a1 = &unk_26DD32DC8;
  if (!a1[1])
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__2EEEED1Ev(void *result)
{
  *double result = &unk_26DD32DC8;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  return result;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__1EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(_DWORD *a1@<X2>, uint64_t a2@<X8>)
{
  if (*a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    der_vm_integer_from_context();
    operator new();
  }
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)a2 = 3;
  *(void *)(a2 + 8) = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
  *(void *)(a2 + 16) = 85;
  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__1EEEE7ExecuteERNS_12EncyclopediaE@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  double result = (*(void *(**)(long long *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if (v8 == 3 || v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) <= a1[4];
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = v7;
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66;
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__1EEEED0Ev(void *a1)
{
  *a1 = &unk_26DD32DC8;
  if (!a1[1])
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__1EEEED1Ev(void *result)
{
  *double result = &unk_26DD32DC8;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  return result;
}

double _ZN3TLE17intOpDeserializerINS_11BinaryIntOpIxXtlNS_3__0EEEEEEENS_5TupleINS_5ErrorEN7libkern20intrusive_shared_ptrINS_9OperationENS_14RefCountPolicyEEEEERNS_8ExecutorER14der_vm_contextRKNS_14FactDefinitionE@<D0>(_DWORD *a1@<X2>, uint64_t a2@<X8>)
{
  if (*a1 == 3 && der_vm_CEType_from_context() == 3)
  {
    der_vm_integer_from_context();
    operator new();
  }
  double result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_DWORD *)a2 = 3;
  *(void *)(a2 + 8) = "Got an unexpected type (not an integer) when trying to generate an integer operation.";
  *(void *)(a2 + 16) = 85;
  return result;
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__0EEEE7ExecuteERNS_12EncyclopediaE@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  double result = (*(void *(**)(long long *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(&v8, a2, a1[2], a1[3]);
  if (v8 == 3 || v8 == 5)
  {
    BOOL v7 = *((void *)&v9 + 1) < a1[4];
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = v7;
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Invalid fact type for this operation (expected an integer or BOOL)";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 66;
  }
  return result;
}

void _ZN3TLE11BinaryIntOpIxXtlNS_3__0EEEED0Ev(void *a1)
{
  *a1 = &unk_26DD32DC8;
  if (!a1[1])
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

void *_ZN3TLE11BinaryIntOpIxXtlNS_3__0EEEED1Ev(void *result)
{
  *double result = &unk_26DD32DC8;
  if (result[1])
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
  return result;
}

void TLE::inDeserializer(_DWORD *a1@<X2>, uint64_t a2@<X8>)
{
  if (*a1 > 6u || ((1 << *a1) & 0x58) == 0)
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_DWORD *)a2 = 3;
    uint64_t v4 = "Got an unexpected type (not an integer, string or data) when trying to generate an In operation.";
    uint64_t v5 = 96;
  }
  else
  {
    if (der_vm_CEType_from_context() == 2) {
      operator new();
    }
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_DWORD *)a2 = 3;
    uint64_t v4 = "Got an unexpected type (not a sequence) when trying to read the array of matches.";
    uint64_t v5 = 81;
  }
  *(void *)(a2 + 8) = v4;
  *(void *)(a2 + 16) = v5;
}

BOOL TLE::getLowestCompatibleVersionFor(uint64_t a1)
{
  return a1 == 1;
}

uint64_t TLE::LWCR::LWCR(uint64_t this)
{
  *(unsigned char *)(this + 80) = 0;
  *(unsigned char *)(this + 57) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = 0;
  return this;
}

{
  *(unsigned char *)(this + 80) = 0;
  *(unsigned char *)(this + 57) = 0;
  *(void *)(this + 8) = 0;
  *(void *)(this + 16) = 0;
  *(void *)this = 0;
  return this;
}

char *TLE::LWCR::requirements(TLE::LWCR *this)
{
  uint64_t v1 = (char *)this + 24;
  if (der_vm_context_is_valid()) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t TLE::LWCR::version(TLE::LWCR *this)
{
  return *(void *)this;
}

uint64_t TLE::LWCR::compatVersion(TLE::LWCR *this)
{
  return *((void *)this + 1);
}

uint64_t TLE::LWCR::constraintCategory(TLE::LWCR *this)
{
  return *((void *)this + 2);
}

uint64_t TLE::LWCR::loadFromCE@<X0>(TLE::LWCR *this@<X0>, CEQueryContext *a2@<X1>, uint64_t a3@<X8>)
{
  runtime = a2->der_context.runtime;
  uint64_t result = der_vm_select_int_for_key();
  if (!result || (uint64_t result = der_vm_select_int_for_key(), (result & 1) == 0))
  {
    long long v9 = (uint64_t (*)(CERuntime *, const char *, ...))*((void *)runtime + 3);
    if (v9) {
      uint64_t result = v9(runtime, "[%s]: %s\n", "loadFromCE", "LWCR: invalid version / compatible version fields");
    }
    *(_DWORD *)a3 = 7;
    BOOL v7 = "LWCRs are not encoded correctly";
    uint64_t v8 = 31;
    goto LABEL_8;
  }
  if (*((uint64_t *)this + 1) >= 2)
  {
    *(_DWORD *)a3 = 6;
    BOOL v7 = "This LWCR is not compatible with this runtime";
    uint64_t v8 = 45;
LABEL_8:
    *(void *)(a3 + 8) = v7;
    *(void *)(a3 + 16) = v8;
    return result;
  }
  uint64_t v10 = (void *)((char *)this + 16);
  uint64_t result = der_vm_select_int_for_key();
  if (result && (*v10 & 0x8000000000000000) != 0)
  {
    *(_DWORD *)a3 = 7;
    BOOL v7 = "LWCRs constraint category cannot be less that zero";
    uint64_t v8 = 50;
    goto LABEL_8;
  }
  der_vm_execute_nocopy();
  if (der_vm_context_is_valid())
  {
    uint64_t result = der_vm_CEType_from_context();
    if (result != 1)
    {
      *(_DWORD *)a3 = 7;
      BOOL v7 = "LWCRs 'requirements' field is not a dictionary";
      uint64_t v8 = 46;
      goto LABEL_8;
    }
  }
  if (!*v10)
  {
    uint64_t result = der_vm_context_is_valid();
    if ((result & 1) == 0)
    {
      *(_DWORD *)a3 = 7;
      BOOL v7 = "LWCRs do not specify a constraint category or explicit requirements";
      uint64_t v8 = 67;
      goto LABEL_8;
    }
  }
  uint64_t result = der_vm_context_is_valid();
  if (result)
  {
    uint64_t result = CEConjureContextFromDER();
    *(_OWORD *)((char *)this + 24) = v11;
    *(_OWORD *)((char *)this + 40) = v12;
    *(_OWORD *)((char *)this + 56) = v13;
    *(_OWORD *)((char *)this + 72) = v14;
  }
  *(_DWORD *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  return result;
}

void TLE::Executor::getOperationsFromCE(TLE::Executor *this@<X0>, CEQueryContext *a2@<X1>, uint64_t a3@<X8>)
{
  if (!a2)
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_DWORD *)a3 = 2;
    *(void *)(a3 + 8) = "Null query context";
    *(void *)(a3 + 16) = 18;
    return;
  }
  long long v4 = *(_OWORD *)&a2->der_context.lookup.index_count;
  *(_OWORD *)&v15.runtime = *(_OWORD *)&a2->der_context.runtime;
  *(_OWORD *)&v15.lookup.index_count = v4;
  *(_OWORD *)&v15.sorted = *(_OWORD *)&a2->der_context.sorted;
  v15.var0.ccstate.der_end = a2->der_context.var0.ccstate.der_end;
  uint64_t v18 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  TLE::Executor::getDependentOpsFromDictionary((uint64_t)this, &v15, (uint64_t)&v16);
  if (v16)
  {
    *(_OWORD *)a3 = v16;
    *(void *)(a3 + 16) = v17;
    *(void *)(a3 + 24) = 0;
    char v6 = (void **)*((void *)&v17 + 1);
    if (!*((void *)&v17 + 1)) {
      return;
    }
    goto LABEL_12;
  }
  if (v18 != 1) {
    operator new();
  }
  BOOL v7 = (void **)*((void *)&v17 + 1);
  if (!*((void *)&v17 + 1)) {
    goto LABEL_24;
  }
  unint64_t v8 = 8 * v18;
  if (*((void *)&v17 + 1) + v8 < *((void *)&v17 + 1) || HIDWORD(v8)) {
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", v5);
  }
  if ((v8 & 0xFFFFFFF8) == 0) {
LABEL_24:
  }
    os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", v5);
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>::reset((void **)(a3 + 24), *v7);
  char v6 = (void **)*((void *)&v17 + 1);
  if (*((void *)&v17 + 1))
  {
LABEL_12:
    if (v18)
    {
      uint64_t v9 = 8 * v18;
      uint64_t v10 = v6;
      do
      {
        long long v11 = *v10;
        if (*v10)
        {
          uint64_t v12 = v11[1];
          if (v12 <= 0)
          {
            exception = __cxa_allocate_exception(8uLL);
            void *exception = "Over-release of an object";
            __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
          }
          uint64_t v13 = v12 - 1;
          v11[1] = v13;
          if (!v13) {
            (*(void (**)(void *))(*v11 + 8))(v11);
          }
        }
        *v10++ = 0;
        v9 -= 8;
      }
      while (v9);
    }
    free(v6);
  }
}

void sub_228C64FE8(_Unwind_Exception *a1)
{
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation(v1 + 24);
  _Unwind_Resume(a1);
}

BOOL TLE::matchRestrictList(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 0;
  }
  uint64_t v3 = a2 - 1;
  uint64_t v4 = a3 + 8;
  do
  {
    int v5 = CEBuffer_cmp();
    BOOL result = v5 == 0;
    if (v5) {
      BOOL v7 = v3 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    --v3;
    v4 += 16;
  }
  while (!v7);
  return result;
}

void *TLE::AndOperation::Execute@<X0>(void *result@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = result[4];
  if (v4)
  {
    unint64_t v5 = v4 + 8 * *((unsigned int *)result + 10);
    if (v5 < v4 || (8 * (unint64_t)*((unsigned int *)result + 10)) >> 32) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", a2);
    }
    uint64_t v7 = (v5 - (unsigned __int128)v4) >> 64;
    uint64_t v6 = 8 * *((unsigned int *)result + 10);
    if ((v7 & 1) != (unint64_t)(int)v6 >> 63 || v6 != (int)v6) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The offset of the pointer inside its valid memory range can't be represented using int32_t", a2);
    }
    uint64_t v9 = (8 * *((_DWORD *)result + 10));
  }
  else
  {
    uint64_t v9 = 0;
    LODWORD(v6) = 0;
  }
  uint64_t v10 = (int)v6;
  uint64_t v11 = (uint64_t)(int)v6 >> 63;
  uint64_t v12 = v4 + v10;
  if (__CFADD__(v4, v10)) {
    uint64_t v13 = v11 + 1;
  }
  else {
    uint64_t v13 = v11;
  }
  BOOL v15 = v13 << 63 >> 63 != v13 || v13 << 63 >> 63 == -1;
  while (1)
  {
    unint64_t v16 = v4 + (v9 >> 32);
    if (__CFADD__(v4, v9 >> 32)) {
      uint64_t v17 = (v9 >> 63) + 1;
    }
    else {
      uint64_t v17 = v9 >> 63;
    }
    uint64_t v18 = v17 << 63 >> 63;
    if (v18 != v17 || v18 < 0 || v15) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", a2);
    }
    if (v16 == v12)
    {
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(unsigned char *)(a3 + 24) = 1;
      return result;
    }
    if (v9 < 0 || HIDWORD(v9) + 8 > v9) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", a2);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL result = (*(void *(**)(long long *__return_ptr))(**(void **)v16 + 16))(&v19);
    if (v19)
    {
      *(unsigned char *)(a3 + 24) = 0;
      *(_OWORD *)a3 = v19;
      *(void *)(a3 + 16) = v20;
      return result;
    }
    if (!BYTE8(v20)) {
      break;
    }
    if ((unint64_t)((v9 >> 32) - 2147483640) < 0xFFFFFFFF00000000) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current position would overflow.", a2);
    }
    v9 += 0x800000000;
  }
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 24) = 0;
  *(void *)(a3 + 16) = 0;
  return result;
}

void TLE::AndOperation::~AndOperation(TLE::AndOperation *this)
{
  *(void *)this = &unk_26DD32E78;
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation((uint64_t)this + 32);
  *(void *)this = &unk_26DD32DC8;
  if (!*((void *)this + 1))
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

{
  void *exception;

  *(void *)this = &unk_26DD32E78;
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation((uint64_t)this + 32);
  *(void *)this = &unk_26DD32DC8;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
}

uint64_t TLE::OrOperation::Execute@<X0>(uint64_t result@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v4 = *(void *)(result + 32);
  if (v4)
  {
    unint64_t v5 = v4 + 8 * *(unsigned int *)(result + 40);
    if (v5 < v4 || (8 * (unint64_t)*(unsigned int *)(result + 40)) >> 32) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The range of valid memory is too large to be represented by this type, or [begin, end) is not a well-formed range", a2);
    }
    uint64_t v7 = (v5 - (unsigned __int128)v4) >> 64;
    uint64_t v6 = 8 * *(unsigned int *)(result + 40);
    if ((v7 & 1) != (unint64_t)(int)v6 >> 63 || v6 != (int)v6) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"The offset of the pointer inside its valid memory range can't be represented using int32_t", a2);
    }
    uint64_t v9 = (8 * *(_DWORD *)(result + 40));
  }
  else
  {
    uint64_t v9 = 0;
    LODWORD(v6) = 0;
  }
  uint64_t v10 = (int)v6;
  uint64_t v11 = (uint64_t)(int)v6 >> 63;
  uint64_t v12 = v4 + v10;
  if (__CFADD__(v4, v10)) {
    uint64_t v13 = v11 + 1;
  }
  else {
    uint64_t v13 = v11;
  }
  BOOL v15 = v13 << 63 >> 63 != v13 || v13 << 63 >> 63 == -1;
  while (1)
  {
    unint64_t v16 = v4 + (v9 >> 32);
    if (__CFADD__(v4, v9 >> 32)) {
      uint64_t v17 = (v9 >> 63) + 1;
    }
    else {
      uint64_t v17 = v9 >> 63;
    }
    uint64_t v18 = v17 << 63 >> 63;
    if (v18 != v17 || v18 < 0 || v15) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"This bounded_ptr is pointing to memory outside of what can be represented by a native pointer.", a2);
    }
    if (v16 == v12)
    {
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(unsigned char *)(a3 + 24) = 0;
      *(void *)(a3 + 16) = 0;
      return result;
    }
    if (v9 < 0 || HIDWORD(v9) + 8 > v9) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator*: Dereferencing this pointer would access memory outside of the bounds set originally", a2);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL result = (uint64_t)(*(void *(**)(long long *__return_ptr))(**(void **)v16 + 16))(&v19);
    if (v19)
    {
      *(unsigned char *)(a3 + 24) = 0;
      *(_OWORD *)a3 = v19;
      *(void *)(a3 + 16) = v20;
      return result;
    }
    BOOL result = (*(uint64_t (**)(void))(**(void **)v16 + 24))();
    if ((result & 1) == 0)
    {
      if (BYTE8(v20)) {
        break;
      }
    }
    if ((unint64_t)((v9 >> 32) - 2147483640) < 0xFFFFFFFF00000000) {
      os_detail::panic_trapping_policy::trap((os_detail::panic_trapping_policy *)"bounded_ptr<T>::operator+=(n): Adding the specified number of bytes to the offset representing the current position would overflow.", a2);
    }
    v9 += 0x800000000;
  }
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(void *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 24) = 1;
  return result;
}

void TLE::OrOperation::~OrOperation(TLE::OrOperation *this)
{
  *(void *)this = &unk_26DD32E48;
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation((uint64_t)this + 32);
  *(void *)this = &unk_26DD32DC8;
  if (!*((void *)this + 1))
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

{
  void *exception;

  *(void *)this = &unk_26DD32E48;
  libkern::safe_allocation<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>,os_detail::IOKit_typed_allocator<libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>,os_detail::panic_trapping_policy>::~safe_allocation((uint64_t)this + 32);
  *(void *)this = &unk_26DD32DC8;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
}

void TLE::InOperation::Execute(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v7 = 0;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  (*(void (**)(_OWORD *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(v5, a2, *(void *)(a1 + 16), *(void *)(a1 + 24));
  if (LODWORD(v5[0]) == 3 || LODWORD(v5[0]) == 4 || LODWORD(v5[0]) == 6)
  {
    der_vm_iterate_b();
    unint64_t v4 = v8;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
    *(void *)a3 = 0;
    *(unsigned char *)(a3 + 24) = *((unsigned char *)v4 + 24);
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "In Operation expected the Fact to be an integer, string or data";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 63;
  }
  _Block_object_dispose(&v7, 8);
}

void sub_228C65914(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN3TLE11InOperation7ExecuteERNS_12EncyclopediaE_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 116) != 3) {
    return 1;
  }
  uint64_t v3 = der_vm_integer_from_context();
  uint64_t result = 1;
  if (v3 == *(void *)(a1 + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

uint64_t ___ZN3TLE11InOperation7ExecuteERNS_12EncyclopediaE_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 116) != 4) {
    return 1;
  }
  der_vm_string_from_context();
  int v3 = CEBuffer_cmp();
  uint64_t result = 1;
  if (!v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

uint64_t ___ZN3TLE11InOperation7ExecuteERNS_12EncyclopediaE_block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 116) != 6) {
    return 1;
  }
  der_vm_data_from_context();
  int v3 = CEBuffer_cmp();
  uint64_t result = 1;
  if (!v3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  return result;
}

void TLE::InOperation::~InOperation(TLE::InOperation *this)
{
  *(void *)this = &unk_26DD32DC8;
  if (!*((void *)this + 1))
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

{
  void *exception;

  *(void *)this = &unk_26DD32DC8;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
}

void TLE::QueryOperation::Execute(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  long long v23 = 0u;
  long long v24 = 0u;
  (*(void (**)(long long *__return_ptr, uint64_t, void, void))(*(void *)a2 + 24))(&v23, a2, *(void *)(a1 + 16), *(void *)(a1 + 24));
  if (v23 == 1)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x6002000000;
    v18[3] = __Block_byref_object_copy__33;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v18[4] = __Block_byref_object_dispose__34;
    uint64_t v22 = 0;
    long long v5 = *(_OWORD *)(*((void *)&v24 + 1) + 16);
    long long v4 = *(_OWORD *)(*((void *)&v24 + 1) + 32);
    uint64_t v6 = *(void *)(*((void *)&v24 + 1) + 48);
    long long v19 = **((_OWORD **)&v24 + 1);
    uint64_t v22 = v6;
    long long v21 = v4;
    long long v20 = v5;
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x4002000000;
    uint64_t v13 = __Block_byref_object_copy__5;
    long long v14 = __Block_byref_object_dispose__6;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    uint64_t v17 = 0;
    uint64_t v7 = der_vm_iterate_b();
    unint64_t v8 = v11 + 5;
    if (*((_DWORD *)v11 + 10))
    {
      *(unsigned char *)(a3 + 24) = 0;
      *(_OWORD *)a3 = *(_OWORD *)v8;
      *(void *)(a3 + 16) = v8[2];
    }
    else if (v7 == *MEMORY[0x263F8BAF0])
    {
      char is_valid = der_vm_context_is_valid();
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(unsigned char *)(a3 + 24) = is_valid;
    }
    else
    {
      *(unsigned char *)(a3 + 24) = 0;
      *(void *)a3 = 0;
      *(void *)(a3 + 8) = "Attempted to execute a non-iterable query";
      *(_DWORD *)a3 = 6;
      *(void *)(a3 + 16) = 41;
    }
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(v18, 8);
  }
  else
  {
    *(unsigned char *)(a3 + 24) = 0;
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = "Query Operation expected the Fact to be a CoreEntitlements dictionary";
    *(_DWORD *)a3 = 3;
    *(void *)(a3 + 16) = 69;
  }
}

void sub_228C65E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

__n128 __Block_byref_object_copy__33(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  long long v3 = *(_OWORD *)(a2 + 56);
  long long v4 = *(_OWORD *)(a2 + 72);
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

__n128 __Block_byref_object_copy__5(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t ___ZN3TLE14QueryOperation7ExecuteERNS_12EncyclopediaE_block_invoke(uint64_t a1)
{
  der_vm_execute_nocopy();
  der_vm_execute_nocopy();
  unint64_t v2 = der_vm_integer_from_context() & 0xBFFFFFFFFFFFFFFFLL;
  **(void **)(a1 + 48) = v2;
  if (v2 > 0xB) {
    goto LABEL_12;
  }
  if (((1 << v2) & 0x35A) == 0)
  {
    if (((1 << v2) & 0xC80) != 0)
    {
      *(void *)(*(void *)(a1 + 48) + 8) = der_vm_integer_from_context();
      goto LABEL_8;
    }
    if (v2 == 5)
    {
      *(void *)(*(void *)(a1 + 48) + 8) = der_vm_BOOL_from_context();
      goto LABEL_8;
    }
LABEL_12:
    uint64_t result = 0;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    *(_DWORD *)(v8 + 40) = 1;
    *(void *)(v8 + 48) = "Attempted to execute unknown CoreEntitlements operation";
    *(void *)(v8 + 56) = 55;
    return result;
  }
  uint64_t v3 = der_vm_string_from_context();
  uint64_t v4 = *(void *)(a1 + 48);
  *(void *)(v4 + 8) = v3;
  *(void *)(v4 + 16) = v5;
  **(void **)(a1 + 48) |= 0x4000000000000000uLL;
LABEL_8:
  if (der_vm_context_is_valid())
  {
    der_vm_execute_nocopy();
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    *(_OWORD *)(v6 + 40) = v9;
    *(_OWORD *)(v6 + 56) = v10;
    *(_OWORD *)(v6 + 72) = v11;
    *(void *)(v6 + 88) = v12;
  }
  return 1;
}

void TLE::QueryOperation::~QueryOperation(TLE::QueryOperation *this)
{
  *(void *)this = &unk_26DD32DC8;
  if (!*((void *)this + 1))
  {
    JUMPOUT(0x22A6A8D40);
  }
  exception = __cxa_allocate_exception(8uLL);
  void *exception = "RefCounted object destroyed, but is not fully released";
  __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
}

{
  void *exception;

  *(void *)this = &unk_26DD32DC8;
  if (*((void *)this + 1))
  {
    exception = __cxa_allocate_exception(8uLL);
    void *exception = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
  }
}

uint64_t TLE::OptionalOperation::shouldIgnore(TLE::OptionalOperation *this)
{
  return *((unsigned __int8 *)this + 40);
}

double TLE::OptionalOperation::Execute@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  long long v7 = 0u;
  long long v8 = 0u;
  (*(void (**)(long long *__return_ptr))(**(void **)(a1 + 32) + 16))(&v7);
  if (v7)
  {
    if (v7 != 5 && v7 != 1)
    {
      *(unsigned char *)(a2 + 24) = 0;
      double result = *(double *)&v7;
      *(_OWORD *)a2 = v7;
      *(void *)(a2 + 16) = v8;
      return result;
    }
    char v6 = 1;
    *(unsigned char *)(a1 + 40) = 1;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    *(void *)a2 = 0;
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
    char v6 = BYTE8(v8);
  }
  *(unsigned char *)(a2 + 24) = v6;
  return result;
}

void TLE::OptionalOperation::~OptionalOperation(TLE::OptionalOperation *this)
{
  TLE::OptionalOperation::~OptionalOperation(this);

  JUMPOUT(0x22A6A8D40);
}

{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *exception;

  *(void *)this = &unk_26DD32ED8;
  unint64_t v2 = (void *)*((void *)this + 4);
  if (v2)
  {
    uint64_t v3 = v2[1];
    if (v3 <= 0)
    {
      exception = __cxa_allocate_exception(8uLL);
      void *exception = "Over-release of an object";
      __cxa_throw(exception, MEMORY[0x263F8C1D8], 0);
    }
    uint64_t v4 = v3 - 1;
    v2[1] = v4;
    if (!v4) {
      (*(void (**)(void *))(*v2 + 8))(v2);
    }
  }
  *((void *)this + 4) = 0;
  *(void *)this = &unk_26DD32DC8;
  if (*((void *)this + 1))
  {
    uint64_t v5 = __cxa_allocate_exception(8uLL);
    *uint64_t v5 = "RefCounted object destroyed, but is not fully released";
    __cxa_throw(v5, MEMORY[0x263F8C1D8], 0);
  }
}

void sub_228C66564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LWCR;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_228C667FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228C66AD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228C66BD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228C66C40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  long long v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)LWCRFact;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_228C66CF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228C66DEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228C66E94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228C66F18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228C67254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id a30)
{
  TLE::Tuple<TLE::Error,libkern::intrusive_shared_ptr<TLE::Operation,TLE::RefCountPolicy>>::~Tuple((uint64_t)&a9);
  TLE::CallbackEncyclopedia::~CallbackEncyclopedia((id *)(v32 - 160));

  _Unwind_Resume(a1);
}

void sub_228C6734C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228C67408(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_228C6748C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void TLE::CallbackEncyclopedia::~CallbackEncyclopedia(id *this)
{
}

{
  uint64_t vars8;

  JUMPOUT(0x22A6A8D40);
}

uint64_t TLE::CallbackEncyclopedia::hasFactFor(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 24) + 16))();
}

uint64_t TLE::CallbackEncyclopedia::resolveFact(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 16) + 16))();
}

uint64_t TLE::CallbackEncyclopedia::getFact(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

uint64_t CEBuffer_cmp()
{
  return MEMORY[0x270F91890]();
}

uint64_t CEConjureContextFromDER()
{
  return MEMORY[0x270F91898]();
}

uint64_t CEManagedContextFromCFData()
{
  return MEMORY[0x270F918B0]();
}

uint64_t CEManagedContextFromCFDataWithOptions()
{
  return MEMORY[0x270F918B8]();
}

uint64_t CEQueryContextToCFDictionary()
{
  return MEMORY[0x270F918C0]();
}

uint64_t CEReleaseManagedContext()
{
  return MEMORY[0x270F918C8]();
}

uint64_t CESerializeCFDictionary()
{
  return MEMORY[0x270F918D0]();
}

uint64_t CESerializeCFDictionaryWithOptions()
{
  return MEMORY[0x270F918D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
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

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void bzero(void *a1, size_t a2)
{
}

uint64_t der_vm_CEType_from_context()
{
  return MEMORY[0x270F918E8]();
}

uint64_t der_vm_BOOL_from_context()
{
  return MEMORY[0x270F918F0]();
}

uint64_t der_vm_context_is_valid()
{
  return MEMORY[0x270F918F8]();
}

uint64_t der_vm_data_from_context()
{
  return MEMORY[0x270F91900]();
}

uint64_t der_vm_execute_nocopy()
{
  return MEMORY[0x270F91910]();
}

uint64_t der_vm_integer_from_context()
{
  return MEMORY[0x270F91918]();
}

uint64_t der_vm_iterate_b()
{
  return MEMORY[0x270F91928]();
}

uint64_t der_vm_select_int_for_key()
{
  return MEMORY[0x270F91930]();
}

uint64_t der_vm_string_from_context()
{
  return MEMORY[0x270F91938]();
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}