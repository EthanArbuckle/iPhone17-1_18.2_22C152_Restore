void __destroy_helper_block_e8_72c47_ZTSNSt3__110shared_ptrIN3pci9transport4taskEEE(uint64_t a1)
{
  std::__shared_weak_count *v1;

  v1 = *(std::__shared_weak_count **)(a1 + 80);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void __Block_byref_object_dispose__39(uint64_t a1)
{
  v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

__n128 __Block_byref_object_copy__38(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a2 + 40) = 0;
  *(void *)(a2 + 48) = 0;
  return result;
}

uint64_t __copy_helper_block_e8_72c47_ZTSNSt3__110shared_ptrIN3pci9transport4taskEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 80);
  *(void *)(result + 72) = *(void *)(a2 + 72);
  *(void *)(result + 80) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

uint64_t ___ZN3pci9transport2th9readAsyncEv_block_invoke_28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
}

uint64_t ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
}

void __destroy_helper_block_e8_32c46_ZTSN8dispatch5blockIU13block_pointerFviPvjEEE(uint64_t a1)
{
  v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void *__copy_helper_block_e8_32c46_ZTSN8dispatch5blockIU13block_pointerFviPvjEEE(uint64_t a1, uint64_t a2)
{
  __n128 result = *(void **)(a2 + 32);
  if (result) {
    __n128 result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

NSObject *TelephonyBasebandPCITransportWrite(uint64_t a1, const unsigned __int8 *a2, int a3, _DWORD *a4, uint64_t a5, int a6, NSObject *a7)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportWrite();
  }
  if (a3 && a2 && a4)
  {
    *a4 = 0;
    pci::system::info::get(&v19);
    pci::system::info::getTH((os_unfair_lock_s *)v19, *(void *)(a1 + 80), buf);
    if (*((void *)&v19 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v19 + 1));
    }
    if (*(void *)buf)
    {
      if (*(unsigned char *)(*(void *)buf + 74)) {
        pci::transport::th::writeAsync(*(pci::transport::th **)buf, a2, a3, a7);
      }
      pci::transport::th::write(*(pci::transport::th **)buf, a2, a3, a7, a6);
    }
    v14 = (pci::log *)_TelephonyUtilDebugPrintError();
    v15 = pci::log::get(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(v19) = 134217984;
      *(void *)((char *)&v19 + 4) = a1;
      _os_log_impl(&dword_21861F000, v15, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&v19, 0xCu);
    }
    if (a7)
    {
      ((void (*)(const unsigned __int8 *))a7)(a2);
      a7 = 0;
    }
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  else
  {
    v12 = (pci::log *)_TelephonyUtilDebugPrintError();
    v13 = pci::log::get(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21861F000, v13, OS_LOG_TYPE_INFO, "invalid parameters", buf, 2u);
    }
    if (a7)
    {
      ((void (*)(const unsigned __int8 *))a7)(a2);
      return 0;
    }
  }
  return a7;
}

void sub_218620A04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

void pci::system::info::getTH(os_unfair_lock_s *this@<X0>, unint64_t a2@<X1>, void *a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  v6 = this + 4;
  os_unfair_lock_lock(this + 4);
  v9 = *(void **)&this[10]._os_unfair_lock_opaque;
  v8 = this + 10;
  v7 = v9;
  if (v9)
  {
    v10 = v8;
    do
    {
      unint64_t v11 = v7[4];
      BOOL v12 = v11 >= a2;
      if (v11 >= a2) {
        v13 = v7;
      }
      else {
        v13 = v7 + 1;
      }
      if (v12) {
        v10 = (os_unfair_lock_s *)v7;
      }
      v7 = (void *)*v13;
    }
    while (*v13);
    if (v10 != v8 && *(void *)&v10[8]._os_unfair_lock_opaque <= a2)
    {
      uint64_t v15 = *(void *)&v10[10]._os_unfair_lock_opaque;
      uint64_t v14 = *(void *)&v10[12]._os_unfair_lock_opaque;
      if (v14) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 8), 1uLL, memory_order_relaxed);
      }
      *a3 = v15;
      a3[1] = v14;
    }
  }

  os_unfair_lock_unlock(v6);
}

void pci::system::info::get(void *a1@<X8>)
{
  {
    pci::system::info::get(void)::sInstance = 0uLL;
  }
  if (pci::system::info::get(void)::sOnce != -1) {
    dispatch_once(&pci::system::info::get(void)::sOnce, &__block_literal_global);
  }
  uint64_t v3 = *((void *)&pci::system::info::get(void)::sInstance + 1);
  *a1 = pci::system::info::get(void)::sInstance;
  a1[1] = v3;
  if (v3) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v3 + 8), 1uLL, memory_order_relaxed);
  }
}

void pci::transport::th::writeAsync(pci::transport::th *this, const unsigned __int8 *a2, int a3, NSObject *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = *((_DWORD *)this + 10);
    int buf = 136316674;
    buf_4 = "th";
    __int16 v17 = 2048;
    v18 = this;
    __int16 v19 = 1024;
    int v20 = v12;
    __int16 v21 = 2080;
    v22 = "writeAsync";
    __int16 v23 = 2048;
    v24 = a2;
    __int16 v25 = 1024;
    int v26 = a3;
    __int16 v27 = 2048;
    v28 = a4;
    _os_log_debug_impl(&dword_21861F000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", (uint8_t *)&buf, 0x40u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_23;
  aBlock[4] = this;
  v10 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v10) {
    unint64_t v11 = _Block_copy(v10);
  }
  else {
    unint64_t v11 = 0;
  }
  v13 = v11;
  pci::transport::th::writeInternal((uint64_t)this, (uint64_t)a2, a3, a4, &v13);
}

void sub_218620D80(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void pci::transport::th::writeInternal(uint64_t a1, uint64_t a2, int a3, NSObject *a4, const void **a5)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  unint64_t v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v22 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)__int16 v23 = 136316674;
    *(void *)v24 = "th";
    *(_WORD *)&v24[8] = 2048;
    *(void *)&v24[10] = a1;
    *(_WORD *)&v24[18] = 1024;
    int v25 = v22;
    __int16 v26 = 2080;
    *(void *)__int16 v27 = "writeInternal";
    *(_WORD *)&v27[8] = 2048;
    *(void *)&v27[10] = a2;
    LOWORD(object[0]) = 1024;
    *(_DWORD *)((char *)object + 2) = a3;
    HIWORD(object[0]) = 2048;
    object[1] = a4;
    _os_log_debug_impl(&dword_21861F000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", v23, 0x40u);
    if (!a2) {
      goto LABEL_5;
    }
  }
  else if (!a2)
  {
    goto LABEL_5;
  }
  int v12 = (pci::log *)_TelephonyUtilDebugPrintBinaryVerbose();
  v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::writeInternal();
  }
LABEL_5:
  *(_OWORD *)&v27[2] = 0u;
  *(_OWORD *)object = 0u;
  if (*a5) {
    uint64_t v14 = _Block_copy(*a5);
  }
  else {
    uint64_t v14 = 0;
  }
  *(_DWORD *)__int16 v23 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)v24 = 3;
  *(void *)&v24[4] = a4;
  *(void *)&v24[12] = a2;
  int v25 = a3;
  if (v14) {
    uint64_t v15 = _Block_copy(v14);
  }
  else {
    uint64_t v15 = 0;
  }
  v16 = *(const void **)&v27[2];
  *(void *)&v27[2] = v15;
  if (v16) {
    _Block_release(v16);
  }
  v18 = *(const os_unfair_lock **)a1;
  uint64_t v17 = *(void *)(a1 + 8);
  if (v17) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v17 + 8), 1uLL, memory_order_relaxed);
  }
  __int16 v19 = (std::__shared_weak_count *)object[0];
  *(void *)&v27[10] = v18;
  object[0] = (dispatch_object_t)v17;
  if (v19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v19);
  }
  int v20 = *(NSObject **)(a1 + 16);
  if (v20) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  __int16 v21 = object[1];
  object[1] = v20;
  if (v21) {
    dispatch_release(v21);
  }
  if (v14) {
    _Block_release(v14);
  }
  pci::transport::task::create();
}

void sub_218621130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  _Unwind_Resume(a1);
}

void pci::transport::bind::~bind(pci::transport::bind *this)
{
  uint64_t v2 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bind::~bind();
  }
  uint64_t v4 = *((void *)this + 3);
  if (v4)
  {
    uint64_t v5 = *((unsigned int *)this + 16);
    if (v5 == -536870911) {
      __assert_rtn("~bind", "PCITransportTask.cpp", 47, "fStatus != kIOReturnInvalid");
    }
    (*(void (**)(uint64_t, uint64_t, void, void, void))(v4 + 16))(v4, v5, *((void *)this + 1), *((unsigned int *)this + 4), *((unsigned int *)this + 17));
    v6 = (const void *)*((void *)this + 3);
    *((void *)this + 3) = 0;
    if (v6) {
      _Block_release(v6);
    }
  }
  std::list<std::shared_ptr<pci::transport::task>>::remove(*((void *)this + 7), (void *)this + 5);
  dispatch_group_leave(*((dispatch_group_t *)this + 4));
  v7 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  v8 = *((void *)this + 4);
  if (v8) {
    dispatch_release(v8);
  }
  v9 = (const void *)*((void *)this + 3);
  if (v9) {
    _Block_release(v9);
  }
}

uint64_t std::list<std::shared_ptr<pci::transport::task>>::remove(uint64_t a1, void *a2)
{
  v11[0] = (uint64_t)v11;
  v11[1] = (uint64_t)v11;
  uint64_t v12 = 0;
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 == (void *)a1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    do
    {
      v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        std::list<void const*>::splice((uint64_t)v11, v11, a1, v2, v6);
        if (!v8) {
          v6 = (void *)v6[1];
        }
      }
      uint64_t v2 = v6;
    }
    while (v6 != (void *)a1);
    uint64_t v9 = v12;
  }
  std::__list_imp<std::shared_ptr<pci::transport::task>>::clear(v11);
  return v9;
}

void sub_218621394(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__list_imp<std::shared_ptr<pci::transport::task>>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

void std::__list_imp<std::shared_ptr<pci::transport::task>>::clear(uint64_t *a1)
{
  if (a1[2])
  {
    uint64_t v2 = *a1;
    uint64_t v3 = (uint64_t *)a1[1];
    uint64_t v4 = *v3;
    *(void *)(v4 + 8) = *(void *)(*a1 + 8);
    **(void **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        uint64_t v5 = (uint64_t *)v3[1];
        v6 = (std::__shared_weak_count *)v3[3];
        if (v6) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v6);
        }
        operator delete(v3);
        uint64_t v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void pci::transport::bh::ioCompletion(pci::transport::bh *this, void *a2, uint64_t a3, void *a4)
{
  if (!this) {
    pci::transport::bh::ioCompletion();
  }
  (*((void (**)(pci::transport::bh *, void *, uint64_t, void))this + 2))(this, a2, a3, 0);

  _Block_release(this);
}

void ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke(uint64_t a1, int a2, unsigned int a3, int a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 56);
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v8 + 16));
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v9 + 24)) {
    ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke_cold_1();
  }
  *(unsigned char *)(v9 + 24) = 1;
  v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  unint64_t v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v17 = *(_DWORD *)(v8 + 28);
    uint64_t v18 = *(void *)(a1 + 64);
    *(_DWORD *)int buf = 136316930;
    int v20 = "bh";
    __int16 v21 = 2048;
    uint64_t v22 = v8;
    __int16 v23 = 1024;
    int v24 = v17;
    __int16 v25 = 2080;
    __int16 v26 = "generateCallback_block_invoke";
    __int16 v27 = 2080;
    uint64_t v28 = v18;
    __int16 v29 = 1024;
    int v30 = a2;
    __int16 v31 = 1024;
    unsigned int v32 = a3;
    __int16 v33 = 1024;
    int v34 = a4;
    _os_log_debug_impl(&dword_21861F000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s complete 0x%x, size %u, cookie %u", buf, 0x42u);
  }
  if (*(unsigned char *)(a1 + 88)) {
    BOOL v12 = a2 == -536870168;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12) {
    a2 = 0;
  }
  if (a2)
  {
    v13 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v14 = pci::log::get(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = *(_DWORD *)(v8 + 28);
      uint64_t v16 = *(void *)(a1 + 64);
      *(_DWORD *)int buf = 136316930;
      int v20 = "bh";
      __int16 v21 = 2048;
      uint64_t v22 = v8;
      __int16 v23 = 1024;
      int v24 = v15;
      __int16 v25 = 2080;
      __int16 v26 = "generateCallback_block_invoke";
      __int16 v27 = 2080;
      uint64_t v28 = v16;
      __int16 v29 = 1024;
      int v30 = a2;
      __int16 v31 = 1024;
      unsigned int v32 = a3;
      __int16 v33 = 1024;
      int v34 = a4;
      _os_log_impl(&dword_21861F000, v14, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: %s failed, complete 0x%x, size %u, cookie %u", buf, 0x42u);
    }
  }
  std::list<void const*>::remove(v8 + 64, (void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
  pci::transport::task::complete(*(pci::transport::task **)(a1 + 72), a2, a3, a4);
}

void pci::transport::task::complete(pci::transport::task *this, int a2, unsigned int a3, int a4)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  os_unfair_lock_lock(*((os_unfair_lock_t *)this + 4));
  getTypeString(*((_DWORD *)this + 5));
  uint64_t v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v16 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    *(_DWORD *)int buf = 136316418;
    __int16 v31 = "task";
    __int16 v32 = 2048;
    __int16 v33 = this;
    __int16 v34 = 1024;
    int v35 = v16;
    __int16 v36 = 2080;
    v37 = "complete";
    __int16 v38 = 2080;
    v39 = TypeString;
    __int16 v40 = 1024;
    int v41 = a2;
    _os_log_debug_impl(&dword_21861F000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: status 0x%x", buf, 0x36u);
  }
  uint64_t v10 = *((void *)this + 9);
  if (v10) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = a2 == 0;
  }
  if (v11) {
    int v12 = -536870166;
  }
  else {
    int v12 = a2;
  }
  unsigned int v13 = *((_DWORD *)this + 5);
  if (v13 >= 2)
  {
    if (v13 == 3)
    {
      uint64_t v14 = (void *)((char *)this + 56);
      (*((void (**)(void))this + 3))(*((void *)this + 7));
LABEL_21:
      void *v14 = 0;
      goto LABEL_22;
    }
    if (v13 != 2) {
      pci::transport::task::complete();
    }
    if (!v12)
    {
      int v15 = *(void **)(v10 + 8);
      if (!v15 || !*((unsigned char *)this + 48))
      {
        *(void *)(v10 + 8) = *((void *)this + 7);
        goto LABEL_20;
      }
      if (*((_DWORD *)this + 16) < a3) {
        pci::transport::task::complete();
      }
      memcpy(v15, *((const void **)this + 7), a3);
    }
    (*((void (**)(void))this + 3))(*((void *)this + 7));
LABEL_20:
    uint64_t v14 = (void *)((char *)this + 56);
    goto LABEL_21;
  }
LABEL_22:
  uint64_t v18 = *((void *)this + 9);
  if (v18)
  {
    int v19 = *((unsigned __int8 *)this + 48);
    int v20 = *((_DWORD *)this + 5);
    *(_DWORD *)(v18 + 16) = a3;
    *(_DWORD *)(v18 + 64) = v12;
    *(_DWORD *)(v18 + 68) = a4;
    if (!v19 && (v12 || v20 == 3))
    {
      *(void *)(v18 + 8) = 0;
      *(_DWORD *)(v18 + 16) = 0;
    }
    pci::transport::bind::~bind((pci::transport::bind *)v18);
    MEMORY[0x21D46F100](v21, 0x10A0C40F1E767F4, v22, v23, v24, v25);
    *((void *)this + 9) = 0;
  }
  else
  {
    getTypeString(*((_DWORD *)this + 5));
    __int16 v26 = (pci::log *)_TelephonyUtilDebugPrint();
    __int16 v27 = pci::log::get(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      int v28 = *((_DWORD *)this + 4);
      __int16 v29 = getTypeString(*((_DWORD *)this + 5));
      *(_DWORD *)int buf = 136316418;
      __int16 v31 = "task";
      __int16 v32 = 2048;
      __int16 v33 = this;
      __int16 v34 = 1024;
      int v35 = v28;
      __int16 v36 = 2080;
      v37 = "complete";
      __int16 v38 = 2080;
      v39 = v29;
      __int16 v40 = 1024;
      int v41 = a2;
      _os_log_debug_impl(&dword_21861F000, v27, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: poisoned completion, status 0x%x", buf, 0x36u);
    }
  }
  os_unfair_lock_unlock(*((os_unfair_lock_t *)this + 4));
}

uint64_t std::list<void const*>::remove(uint64_t a1, void *a2)
{
  v11[0] = (uint64_t)v11;
  v11[1] = (uint64_t)v11;
  uint64_t v12 = 0;
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2 == (void *)a1)
  {
    uint64_t v9 = 0;
  }
  else
  {
    do
    {
      v6 = (void *)v2[1];
      uint64_t v5 = v2[2];
      if (v5 == *a2)
      {
        if (v6 == (void *)a1)
        {
          BOOL v8 = 1;
LABEL_8:
          v6 = (void *)a1;
        }
        else
        {
          while (1)
          {
            uint64_t v7 = v6[2];
            BOOL v8 = v7 == v5;
            if (v7 != v5) {
              break;
            }
            v6 = (void *)v6[1];
            if (v6 == (void *)a1) {
              goto LABEL_8;
            }
          }
        }
        std::list<void const*>::splice((uint64_t)v11, v11, a1, v2, v6);
        if (!v8) {
          v6 = (void *)v6[1];
        }
      }
      uint64_t v2 = v6;
    }
    while (v6 != (void *)a1);
    uint64_t v9 = v12;
  }
  std::__list_imp<void const*>::clear(v11);
  return v9;
}

void sub_218621AC0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__list_imp<void const*>::clear((uint64_t *)va);
  _Unwind_Resume(a1);
}

uint64_t std::list<void const*>::splice(uint64_t result, uint64_t *a2, uint64_t a3, void *a4, void *a5)
{
  if (a4 != a5)
  {
    uint64_t v5 = (void *)*a5;
    if (result != a3)
    {
      uint64_t v6 = 1;
      if (v5 != a4)
      {
        uint64_t v7 = a4;
        do
        {
          uint64_t v7 = (void *)v7[1];
          ++v6;
        }
        while (v7 != v5);
      }
      *(void *)(a3 + 16) -= v6;
      *(void *)(result + 16) += v6;
    }
    uint64_t v8 = *a4;
    *(void *)(v8 + 8) = v5[1];
    *(void *)v5[1] = v8;
    uint64_t v9 = *a2;
    *(void *)(v9 + 8) = a4;
    *a4 = v9;
    *a2 = (uint64_t)v5;
    v5[1] = a2;
  }
  return result;
}

void *std::__list_imp<void const*>::clear(void *result)
{
  if (result[2])
  {
    v1 = result;
    __n128 result = (void *)result[1];
    uint64_t v2 = *v1;
    uint64_t v3 = *result;
    *(void *)(v3 + 8) = *(void *)(*v1 + 8);
    **(void **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        uint64_t v4 = (void *)result[1];
        operator delete(result);
        __n128 result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void pci::transport::task::init(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 32));
  uint64_t v4 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    pci::transport::task::init();
  }
  if (*(void *)(a2 + 56)) {
    dispatch_retain(*(dispatch_object_t *)(a2 + 56));
  }
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, (void *)a1);
  operator new();
}

void sub_218621F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  pci::transport::bind::parameters::~parameters((pci::transport::bind::parameters *)va);
  _Unwind_Resume(a1);
}

void *std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(void *a1, void *a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a2[1];
  *a1 = *a2;
  if (!v3)
  {
    a1[1] = 0;
LABEL_5:
    std::__throw_bad_weak_ptr[abi:ne180100]();
  }
  uint64_t v4 = std::__shared_weak_count::lock(v3);
  a1[1] = v4;
  if (!v4) {
    goto LABEL_5;
  }
  return a1;
}

uint64_t pci::transport::bind::bind(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  uint64_t v6 = *(NSObject **)(a2 + 24);
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 40) = *(void *)(a2 + 32);
  *(void *)(a1 + 48) = v7;
  if (v7) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
  }
  *(void *)(a1 + 56) = a3;
  *(void *)(a1 + 64) = -536870911;
  uint64_t v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bind::bind((_DWORD *)a1, v9);
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  std::list<std::shared_ptr<pci::transport::task>>::push_back(*(uint64_t **)(a1 + 56), (void *)(a1 + 40));
  return a1;
}

void sub_21862209C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = (std::__shared_weak_count *)v1[6];
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = v1[4];
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = (const void *)v1[3];
  if (v5) {
    _Block_release(v5);
  }
  _Unwind_Resume(exception_object);
}

void *std::list<std::shared_ptr<pci::transport::task>>::push_back(uint64_t *a1, void *a2)
{
  __n128 result = operator new(0x20uLL);
  uint64_t v5 = a2[1];
  result[2] = *a2;
  result[3] = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v6 = *a1;
  *__n128 result = *a1;
  result[1] = a1;
  *(void *)(v6 + 8) = result;
  *a1 = (uint64_t)result;
  ++a1[2];
  return result;
}

void pci::transport::bind::setCompletion(uint64_t a1, void **a2)
{
  uint64_t v3 = *a2;
  if (*a2) {
    uint64_t v3 = _Block_copy(v3);
  }
  uint64_t v4 = *(const void **)(a1 + 24);
  *(void *)(a1 + 24) = v3;
  if (v4) {
    _Block_release(v4);
  }
}

void pci::transport::th::readInternal(uint64_t a1, uint64_t a2, int a3, NSObject *a4, const void **a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  BOOL v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)uint64_t v21 = 136316674;
    *(void *)uint64_t v22 = "th";
    *(_WORD *)&v22[8] = 2048;
    *(void *)&v22[10] = a1;
    *(_WORD *)&v22[18] = 1024;
    int v23 = v20;
    __int16 v24 = 2080;
    *(void *)uint64_t v25 = "readInternal";
    *(_WORD *)&v25[8] = 2048;
    *(void *)&v25[10] = a2;
    LOWORD(object[0]) = 1024;
    *(_DWORD *)((char *)object + 2) = a3;
    HIWORD(object[0]) = 2048;
    object[1] = a4;
    _os_log_debug_impl(&dword_21861F000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", v21, 0x40u);
  }
  *(_OWORD *)&v25[2] = 0u;
  *(_OWORD *)object = 0u;
  if (*a5) {
    uint64_t v12 = _Block_copy(*a5);
  }
  else {
    uint64_t v12 = 0;
  }
  *(_DWORD *)uint64_t v21 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)uint64_t v22 = 2;
  *(void *)&v22[4] = a4;
  *(void *)&v22[12] = a2;
  int v23 = a3;
  if (v12) {
    unsigned int v13 = _Block_copy(v12);
  }
  else {
    unsigned int v13 = 0;
  }
  uint64_t v14 = *(const void **)&v25[2];
  *(void *)&v25[2] = v13;
  if (v14) {
    _Block_release(v14);
  }
  int v16 = *(const os_unfair_lock **)a1;
  uint64_t v15 = *(void *)(a1 + 8);
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  int v17 = (std::__shared_weak_count *)object[0];
  *(void *)&v25[10] = v16;
  object[0] = (dispatch_object_t)v15;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  uint64_t v18 = *(NSObject **)(a1 + 16);
  if (v18) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  int v19 = object[1];
  object[1] = v18;
  if (v19) {
    dispatch_release(v19);
  }
  if (v12) {
    _Block_release(v12);
  }
  pci::transport::task::create();
}

void sub_218622494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  _Unwind_Resume(a1);
}

void std::__shared_weak_count::__release_shared[abi:ne180100](std::__shared_weak_count *a1)
{
  if (!atomic_fetch_add(&a1->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))a1->__on_zero_shared)(a1);
    std::__shared_weak_count::__release_weak(a1);
  }
}

pci::transport::task *std::__shared_ptr_pointer<pci::transport::task *,std::shared_ptr<pci::transport::task>::__shared_ptr_default_delete<pci::transport::task,pci::transport::task>,std::allocator<pci::transport::task>>::__on_zero_shared(uint64_t a1)
{
  __n128 result = *(pci::transport::task **)(a1 + 24);
  if (result)
  {
    pci::transport::task::~task(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

void pci::transport::task::~task(pci::transport::task *this)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  getTypeString(*((_DWORD *)this + 5));
  uint64_t v2 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v6 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    *(_DWORD *)int buf = 136316162;
    uint64_t v9 = "task";
    __int16 v10 = 2048;
    BOOL v11 = this;
    __int16 v12 = 1024;
    int v13 = v6;
    __int16 v14 = 2080;
    uint64_t v15 = "~task";
    __int16 v16 = 2080;
    int v17 = TypeString;
    _os_log_debug_impl(&dword_21861F000, v3, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: ", buf, 0x30u);
  }
  if (*((void *)this + 9)) {
    __assert_rtn("~task", "PCITransportTask.cpp", 170, "!fBind");
  }
  uint64_t v4 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

void sub_21862271C(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  __clang_call_terminate(a1);
}

char *getTypeString(unsigned int a1)
{
  if (a1 >= 4) {
    getTypeString();
  }
  return (&off_26432DBE0)[a1];
}

void pci::transport::task::create()
{
}

void sub_2186227F0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<pci::transport::task>::shared_ptr[abi:ne180100]<pci::transport::task,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_2186228AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::transport::task>::reset[abi:ne180100]((pci::transport::task **)va, 0);
  _Unwind_Resume(a1);
}

void std::shared_ptr<pci::system::info>::__enable_weak_this[abi:ne180100]<pci::system::info,pci::system::info,void>(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = (std::__shared_weak_count *)a2[1];
    if (!v4 || v4->__shared_owners_ == -1)
    {
      uint64_t v5 = *(std::__shared_weak_count **)(a1 + 8);
      if (v5)
      {
        atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
        atomic_fetch_add_explicit(&v5->__shared_weak_owners_, 1uLL, memory_order_relaxed);
        uint64_t v4 = (std::__shared_weak_count *)a2[1];
      }
      *a2 = a3;
      a2[1] = v5;
      if (v4) {
        std::__shared_weak_count::__release_weak(v4);
      }
      if (v5)
      {
        std::__shared_weak_count::__release_shared[abi:ne180100](v5);
      }
    }
  }
}

pci::transport::task *pci::transport::task::task(pci::transport::task *this, const pci::transport::task::parameters *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = *(_DWORD *)a2;
  unsigned int v3 = *((_DWORD *)a2 + 1);
  *((_DWORD *)this + 5) = v3;
  uint64_t v4 = *((void *)a2 + 1);
  *((void *)this + 3) = v4;
  *((void *)this + 4) = *((void *)a2 + 5);
  uint64_t v5 = *((void *)a2 + 6);
  *((void *)this + 5) = v5;
  if (v5)
  {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
    uint64_t v4 = *((void *)a2 + 1);
    unsigned int v3 = *((_DWORD *)this + 5);
  }
  *((unsigned char *)this + 48) = v4 == 0;
  *((void *)this + 7) = 0;
  *((_DWORD *)this + 16) = *((_DWORD *)a2 + 6);
  *((void *)this + 9) = 0;
  getTypeString(v3);
  int v6 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    *(_DWORD *)int buf = 136316162;
    __int16 v12 = "task";
    __int16 v13 = 2048;
    __int16 v14 = this;
    __int16 v15 = 1024;
    int v16 = v9;
    __int16 v17 = 2080;
    uint64_t v18 = "task";
    __int16 v19 = 2080;
    int v20 = TypeString;
    _os_log_debug_impl(&dword_21861F000, v7, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: ", buf, 0x30u);
  }
  return this;
}

void sub_218622AB8(_Unwind_Exception *exception_object)
{
  unsigned int v3 = *(std::__shared_weak_count **)(v1 + 40);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  uint64_t v4 = *(std::__shared_weak_count **)(v1 + 8);
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  _Unwind_Resume(exception_object);
}

void ___ZN3pci9transport2th9readAsyncEv_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 40);
  int v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  __int16 v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v22 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)int buf = 136316674;
    int v30 = "th";
    __int16 v31 = 2048;
    uint64_t v32 = v8;
    __int16 v33 = 1024;
    int v34 = v22;
    __int16 v35 = 2080;
    __int16 v36 = "readAsync_block_invoke";
    __int16 v37 = 1024;
    int v38 = a2;
    __int16 v39 = 2048;
    uint64_t v40 = a3;
    __int16 v41 = 1024;
    int v42 = a4;
    _os_log_debug_impl(&dword_21861F000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
    if (!a3) {
      goto LABEL_5;
    }
  }
  else if (!a3)
  {
    goto LABEL_5;
  }
  BOOL v11 = (pci::log *)_TelephonyUtilDebugPrintBinaryVerbose();
  __int16 v12 = pci::log::get(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::writeInternal();
  }
LABEL_5:
  __int16 v13 = *(const void **)(v8 + 88);
  if (v13) {
    __int16 v14 = _Block_copy(v13);
  }
  else {
    __int16 v14 = 0;
  }
  __int16 v15 = *(NSObject **)(v8 + 48);
  if (v15) {
    dispatch_retain(*(dispatch_object_t *)(v8 + 48));
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN3pci9transport2th9readAsyncEv_block_invoke_28;
  block[3] = &__block_descriptor_tmp_31;
  if (v14) {
    int v16 = _Block_copy(v14);
  }
  else {
    int v16 = 0;
  }
  aBlock = v16;
  uint64_t v26 = a3;
  int v27 = a2;
  int v28 = a4;
  dispatch_async(v15, block);
  if (!a2 && !*(unsigned char *)(v8 + 152))
  {
    int v19 = *(_DWORD *)(v8 + 80);
    int v20 = *(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (v20) {
      uint64_t v21 = _Block_copy(v20);
    }
    else {
      uint64_t v21 = 0;
    }
    int v23 = v21;
    pci::transport::th::readInternal(v8, 0, v19, 0, &v23);
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v18 = *(const void **)(v17 + 40);
  *(void *)(v17 + 40) = 0;
  if (v18) {
    _Block_release(v18);
  }
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v15) {
    dispatch_release(v15);
  }
  if (v14) {
    _Block_release(v14);
  }
}

void sub_218622DB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *aBlock)
{
  if (a2) {
    __clang_call_terminate(exception_object);
  }
  _Unwind_Resume(exception_object);
}

uint64_t pci::log::get(pci::log *this)
{
  if (pci::log::get(void)::once != -1) {
    dispatch_once(&pci::log::get(void)::once, &__block_literal_global_0);
  }
  return pci::log::get(void)::logger;
}

void ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  int v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v14 = *(_DWORD *)(v7 + 40);
    *(_DWORD *)int buf = 136316674;
    uint64_t v21 = "th";
    __int16 v22 = 2048;
    uint64_t v23 = v7;
    __int16 v24 = 1024;
    int v25 = v14;
    __int16 v26 = 2080;
    int v27 = "writeAsync_block_invoke";
    __int16 v28 = 1024;
    int v29 = a2;
    __int16 v30 = 2048;
    uint64_t v31 = a3;
    __int16 v32 = 1024;
    int v33 = a4;
    _os_log_debug_impl(&dword_21861F000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
  }
  __int16 v10 = *(const void **)(v7 + 96);
  if (v10)
  {
    BOOL v11 = _Block_copy(v10);
    __int16 v12 = *(NSObject **)(v7 + 48);
    if (v12) {
      dispatch_retain(v12);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN3pci9transport2th10writeAsyncEPKhjPFvPvE_block_invoke_21;
    block[3] = &__block_descriptor_tmp_22;
    if (v11) {
      __int16 v13 = _Block_copy(v11);
    }
    else {
      __int16 v13 = 0;
    }
    aBlock = v13;
    uint64_t v17 = a3;
    int v18 = a2;
    int v19 = a4;
    dispatch_async(v12, block);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v12) {
      dispatch_release(v12);
    }
    if (v11) {
      _Block_release(v11);
    }
  }
}

void sub_218623060(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

void pci::transport::bh::write(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(std::__shared_weak_count **)(a2 + 8);
  v15[0] = *(void *)a2;
  v15[1] = (uint64_t)v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pci::transport::bh::generateCallback(a1, v15, (uint64_t)"write", 0, &aBlock);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  uint64_t Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  uint64_t v8 = aBlock;
  int v9 = _Block_copy(aBlock);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(pci::transport::bh *, void *, uint64_t, void *), void *))(*(void *)v5 + 72))(v5, Data, Size, pci::transport::bh::ioCompletion, v9);
  if (v10)
  {
    BOOL v11 = (pci::log *)_TelephonyUtilDebugPrintError();
    __int16 v12 = pci::log::get(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)int buf = 136316162;
      *(void *)&uint8_t buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v18) = v13;
      WORD2(v18) = 2080;
      *(void *)((char *)&v18 + 6) = "write";
      HIWORD(v18) = 1024;
      int v19 = v10;
      _os_log_impl(&dword_21861F000, v12, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: write failed 0x%x", buf, 0x2Cu);
    }
    int v14 = *(NSObject **)(a1 + 16);
    *(void *)int buf = MEMORY[0x263EF8330];
    *(void *)&uint8_t buf[8] = 0x40000000;
    *(void *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(void *)&long long v18 = &unk_26432D6F8;
    *((void *)&v18 + 1) = v8;
    int v20 = 0;
    int v21 = 0;
    int v19 = v10;
    dispatch_async(v14, buf);
    _Block_release(v8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v8) {
    _Block_release(v8);
  }
}

void sub_2186232D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::read(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(std::__shared_weak_count **)(a2 + 8);
  v16[0] = *(void *)a2;
  v16[1] = (uint64_t)v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pci::transport::bh::generateCallback(a1, v16, (uint64_t)"read", a3, &aBlock);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  uint64_t Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  int v9 = aBlock;
  int v10 = _Block_copy(aBlock);
  int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void (*)(pci::transport::bh *, void *, uint64_t, void *), void *))(*(void *)v6 + 88))(v6, Data, Size, pci::transport::bh::ioCompletion, v10);
  if (v11)
  {
    __int16 v12 = (pci::log *)_TelephonyUtilDebugPrintError();
    int v13 = pci::log::get(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)int buf = 136316162;
      *(void *)&uint8_t buf[4] = "bh";
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v19) = v14;
      WORD2(v19) = 2080;
      *(void *)((char *)&v19 + 6) = "read";
      HIWORD(v19) = 1024;
      int v20 = v11;
      _os_log_impl(&dword_21861F000, v13, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: read failed 0x%x", buf, 0x2Cu);
    }
    __int16 v15 = *(NSObject **)(a1 + 16);
    *(void *)int buf = MEMORY[0x263EF8330];
    *(void *)&uint8_t buf[8] = 0x40000000;
    *(void *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(void *)&long long v19 = &unk_26432D6F8;
    *((void *)&v19 + 1) = v9;
    int v21 = 0;
    int v22 = 0;
    int v20 = v11;
    dispatch_async(v15, buf);
    _Block_release(v9);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v9) {
    _Block_release(v9);
  }
}

void sub_218623570(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t pci::transport::task::getSize(pci::transport::task *this)
{
  return *((unsigned int *)this + 16);
}

uint64_t pci::transport::task::getData(pci::transport::task *this)
{
  return *((void *)this + 7);
}

void pci::transport::bh::generateCallback(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, void *a5@<X8>)
{
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3802000000;
  v28[3] = __Block_byref_object_copy__38;
  v28[4] = __Block_byref_object_dispose__39;
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(&v29, (void *)a1);
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2000000000;
  char v27 = 0;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2000000000;
  uint64_t v25 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1174405120;
  aBlock[2] = ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke;
  aBlock[3] = &unk_26C9BAB38;
  aBlock[4] = v28;
  void aBlock[5] = v26;
  char v21 = a4;
  aBlock[6] = &v22;
  aBlock[7] = a1;
  uint64_t v11 = *a2;
  int v10 = (std::__shared_weak_count *)a2[1];
  aBlock[8] = a3;
  aBlock[9] = v11;
  int v20 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  __int16 v12 = _Block_copy(aBlock);
  *a5 = v12;
  v23[3] = (uint64_t)v12;
  int v13 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  int v14 = v23;
  __int16 v15 = operator new(0x18uLL);
  uint64_t v16 = v14[3];
  uint64_t v18 = *(void *)(a1 + 64);
  uint64_t v17 = (void *)(a1 + 64);
  v15[1] = v17;
  uint64_t v15[2] = v16;
  void *v15 = v18;
  *(void *)(v18 + 8) = v15;
  *uint64_t v17 = v15;
  ++v17[2];
  os_unfair_lock_unlock(v13);
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
}

void sub_218623798(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  if (v27) {
    _Block_release(v27);
  }
  pci::transport::bh::generateCallback(v26, &a22, &a26, (void *)(v28 - 120));
  _Unwind_Resume(a1);
}

uint64_t abpKernel::readAsync(abpKernel *this, void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x270F92188]((char *)this + 8, a2, a3, a4, a5);
}

uint64_t abpKernel::writeAsync(abpKernel *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x270F92100]((char *)this + 8, a2, a3, a4, a5);
}

void ___ZN3pci6system4info3getEv_block_invoke()
{
}

void sub_218623858(_Unwind_Exception *a1)
{
  MEMORY[0x21D46F100](v1, 0x1020C40399D3DCFLL);
  _Unwind_Resume(a1);
}

pci::system::info *pci::system::info::info(pci::system::info *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
  dispatch_workloop_t v2 = dispatch_workloop_create("com.apple.WirelessIPC.baseband.pci_workloop");
  *((void *)this + 11) = 0;
  *((void *)this + 10) = (char *)this + 88;
  *((void *)this + 3) = v2;
  *((void *)this + 5) = 0;
  *((void *)this + 4) = (char *)this + 40;
  *((void *)this + 8) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = (char *)this + 64;
  *((void *)this + 9) = 0;
  *((void *)this + 12) = 0;
  unsigned int v3 = (pci::log *)_TelephonyUtilDebugPrint();
  uint64_t v4 = pci::log::get(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    pci::system::info::info(v4);
  }
  return this;
}

void sub_218623950(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy(v3, *(void **)(v1 + 88));
  std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(v4, *(void **)(v1 + 64));
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(v2, *(void **)(v1 + 40));
  uint64_t v6 = *(NSObject **)(v1 + 24);
  if (v6) {
    dispatch_release(v6);
  }
  uint64_t v7 = *(std::__shared_weak_count **)(v1 + 8);
  if (v7) {
    std::__shared_weak_count::__release_weak(v7);
  }
  _Unwind_Resume(a1);
}

void pci::system::info::~info(pci::system::info *this)
{
  uint64_t v2 = (pci::log *)_TelephonyUtilDebugPrint();
  uint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    pci::system::info::info(v3);
  }
  std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy((uint64_t)this + 80, *((void **)this + 11));
  std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy((uint64_t)this + 56, *((void **)this + 8));
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy((uint64_t)this + 32, *((void **)this + 5));
  uint64_t v4 = *((void *)this + 3);
  if (v4) {
    dispatch_release(v4);
  }
  uint64_t v5 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v5) {
    std::__shared_weak_count::__release_weak(v5);
  }
}

void __clang_call_terminate(void *a1)
{
}

void pci::system::info::lock(os_unfair_lock_s *this)
{
}

void pci::system::info::unlock(os_unfair_lock_s *this)
{
}

uint64_t pci::system::info::insertTH(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  uint64_t v5 = ++pci::system::info::insertTH(std::shared_ptr<pci::transport::th>)::unique;
  uint64_t v7 = *a2;
  uint64_t v6 = (std::__shared_weak_count *)a2[1];
  *(void *)&long long v9 = pci::system::info::insertTH(std::shared_ptr<pci::transport::th>)::unique;
  *((void *)&v9 + 1) = v7;
  int v10 = v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__emplace_multi<std::pair<void const*,std::shared_ptr<pci::transport::th>>>((uint64_t **)(a1 + 32), &v9);
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  os_unfair_lock_unlock(v4);
  return v5;
}

void sub_218623B00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t pci::system::info::eraseTH(pci::system::info *this, unint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)((char *)this + 16);
  os_unfair_lock_lock((os_unfair_lock_t)this + 4);
  uint64_t v5 = (void *)*((void *)this + 5);
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = (uint64_t *)((char *)this + 40);
  do
  {
    unint64_t v7 = v5[4];
    BOOL v8 = v7 >= a2;
    if (v7 >= a2) {
      long long v9 = v5;
    }
    else {
      long long v9 = v5 + 1;
    }
    if (v8) {
      uint64_t v6 = v5;
    }
    uint64_t v5 = (void *)*v9;
  }
  while (*v9);
  if (v6 == (uint64_t *)((char *)this + 40) || v6[4] > a2) {
LABEL_12:
  }
    pci::system::info::eraseTH();
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::erase((uint64_t **)this + 4, v6);
  os_unfair_lock_unlock(v4);
  return 1;
}

uint64_t pci::system::info::insertBH(uint64_t a1, int a2, uint64_t **a3, unsigned int a4)
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  int v58 = a2;
  BOOL v8 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  long long v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  int v10 = pci::log::get(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  int v12 = a2;
  if (v11)
  {
    *(_DWORD *)v66 = 136316162;
    *(void *)&v66[4] = "system";
    *(_WORD *)&v66[12] = 2048;
    *(void *)&v66[14] = a1;
    *(_WORD *)&v66[22] = 1024;
    LODWORD(v67) = a2;
    WORD2(v67) = 2080;
    *(void *)((char *)&v67 + 6) = "insertBH";
    HIWORD(v67) = 1024;
    LODWORD(v68) = a2;
    _os_log_debug_impl(&dword_21861F000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %u", v66, 0x2Cu);
    int v12 = v58;
  }
  uint64_t v13 = *(void *)(a1 + 64);
  if (!v13) {
    goto LABEL_13;
  }
  uint64_t v14 = a1 + 64;
  do
  {
    int v15 = *(_DWORD *)(v13 + 32);
    BOOL v16 = v15 < v12;
    if (v15 >= v12) {
      uint64_t v17 = (uint64_t *)v13;
    }
    else {
      uint64_t v17 = (uint64_t *)(v13 + 8);
    }
    if (!v16) {
      uint64_t v14 = v13;
    }
    uint64_t v13 = *v17;
  }
  while (*v17);
  if (v14 != a1 + 64 && v12 >= *(_DWORD *)(v14 + 32))
  {
    char v27 = (uint64_t *)(a1 + 88);
    uint64_t v26 = *(void *)(a1 + 88);
    if (!v26) {
      goto LABEL_31;
    }
    uint64_t v28 = a1 + 88;
    do
    {
      int v29 = *(_DWORD *)(v26 + 32);
      BOOL v30 = v29 < v12;
      if (v29 >= v12) {
        uint64_t v31 = (uint64_t *)v26;
      }
      else {
        uint64_t v31 = (uint64_t *)(v26 + 8);
      }
      if (!v30) {
        uint64_t v28 = v26;
      }
      uint64_t v26 = *v31;
    }
    while (*v31);
    if ((uint64_t *)v28 != v27 && v12 >= *(_DWORD *)(v28 + 32))
    {
      v48 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
      v49 = pci::log::get(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v66 = 136316162;
        *(void *)&v66[4] = "system";
        *(_WORD *)&v66[12] = 2048;
        *(void *)&v66[14] = a1;
        *(_WORD *)&v66[22] = 1024;
        LODWORD(v67) = a2;
        WORD2(v67) = 2080;
        *(void *)((char *)&v67 + 6) = "insertBH";
        HIWORD(v67) = 1024;
        LODWORD(v68) = v58;
        _os_log_debug_impl(&dword_21861F000, v49, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: already pending for interface %d", v66, 0x2Cu);
      }
      os_unfair_lock_unlock(v8);
      return 0;
    }
    else
    {
LABEL_31:
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2000000000;
      char v57 = 1;
      *(void *)v66 = 0;
      *(void *)&v66[8] = v66;
      *(void *)&v66[16] = 0x3002000000;
      *(void *)&long long v67 = __Block_byref_object_copy_;
      *((void *)&v67 + 1) = __Block_byref_object_dispose_;
      dispatch_object_t v68 = dispatch_semaphore_create(0);
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1174405120;
      aBlock[2] = ___ZN3pci6system4info8insertBHEiNSt3__18weak_ptrINS_9transport2bhEEEj_block_invoke;
      aBlock[3] = &unk_26C9BA4B8;
      aBlock[4] = &v54;
      int v52 = a2;
      int v53 = v58;
      int v33 = *a3;
      __int16 v32 = (std::__shared_weak_count *)a3[1];
      aBlock[6] = a1;
      aBlock[7] = v33;
      v51 = v32;
      if (v32) {
        atomic_fetch_add_explicit(&v32->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      }
      void aBlock[5] = v66;
      uint64_t v34 = _Block_copy(aBlock);
      __int16 v35 = (void (**)(void, void))v34;
      if (v34) {
        __int16 v36 = (uint64_t *)_Block_copy(v34);
      }
      else {
        __int16 v36 = 0;
      }
      *(void *)int buf = &v58;
      __int16 v37 = std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(a1 + 80), &v58, (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
      int v38 = v37[5];
      v37[5] = v36;
      if (v38) {
        _Block_release(v38);
      }
      os_unfair_lock_unlock(v8);
      uint64_t v39 = *(void *)&v66[8];
      if (a4 == -1) {
        dispatch_time_t v40 = -1;
      }
      else {
        dispatch_time_t v40 = dispatch_time(0, 1000000 * a4);
      }
      if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v39 + 40), v40))
      {
        __int16 v41 = (pci::log *)_TelephonyUtilDebugPrintError();
        int v42 = pci::log::get(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 136315906;
          *(void *)&uint8_t buf[4] = "system";
          __int16 v60 = 2048;
          uint64_t v61 = a1;
          __int16 v62 = 1024;
          int v63 = a2;
          __int16 v64 = 2080;
          v65 = "insertBH";
          _os_log_impl(&dword_21861F000, v42, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: Semaphore wait timed out!\n", buf, 0x26u);
        }
        os_unfair_lock_lock(v8);
        if (v35)
        {
          uint64_t v43 = *v27;
          if (*v27)
          {
            uint64_t v44 = a1 + 88;
            do
            {
              int v45 = *(_DWORD *)(v43 + 32);
              BOOL v46 = v45 < v58;
              if (v45 >= v58) {
                v47 = (uint64_t *)v43;
              }
              else {
                v47 = (uint64_t *)(v43 + 8);
              }
              if (!v46) {
                uint64_t v44 = v43;
              }
              uint64_t v43 = *v47;
            }
            while (*v47);
            if ((uint64_t *)v44 != v27 && v58 >= *(_DWORD *)(v44 + 32))
            {
              v35[2](v35, 0);
              std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer((uint64_t **)(a1 + 80), (uint64_t *)v44);
              std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>(v44 + 32);
              operator delete((void *)v44);
            }
          }
        }
        os_unfair_lock_unlock(v8);
        dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)&v66[8] + 40), 0xFFFFFFFFFFFFFFFFLL);
      }
      BOOL v24 = *((unsigned char *)v55 + 24) != 0;
      if (v51) {
        std::__shared_weak_count::__release_weak(v51);
      }
      _Block_object_dispose(v66, 8);
      if (v68) {
        dispatch_release(v68);
      }
      if (v35) {
        _Block_release(v35);
      }
      _Block_object_dispose(&v54, 8);
    }
  }
  else
  {
LABEL_13:
    uint64_t v18 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
    long long v19 = pci::log::get(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v66 = 136316162;
      *(void *)&v66[4] = "system";
      *(_WORD *)&v66[12] = 2048;
      *(void *)&v66[14] = a1;
      *(_WORD *)&v66[22] = 1024;
      LODWORD(v67) = a2;
      WORD2(v67) = 2080;
      *(void *)((char *)&v67 + 6) = "insertBH";
      HIWORD(v67) = 1024;
      LODWORD(v68) = v58;
      _os_log_debug_impl(&dword_21861F000, v19, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: add interface %d", v66, 0x2Cu);
    }
    *(void *)v66 = &v58;
    int v20 = std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(a1 + 56), &v58, (uint64_t)&std::piecewise_construct, (_DWORD **)v66);
    uint64_t v22 = *a3;
    char v21 = a3[1];
    if (v21) {
      atomic_fetch_add_explicit(v21 + 2, 1uLL, memory_order_relaxed);
    }
    uint64_t v23 = (std::__shared_weak_count *)v20[6];
    v20[5] = v22;
    v20[6] = v21;
    if (v23) {
      std::__shared_weak_count::__release_weak(v23);
    }
    os_unfair_lock_unlock(v8);
    return 1;
  }
  return v24;
}

void sub_21862420C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,std::__shared_weak_count *a22,uint64_t a23,char a24)
{
  if (a22) {
    std::__shared_weak_count::__release_weak(a22);
  }
  _Block_object_dispose((const void *)(v25 - 160), 8);
  char v27 = *(NSObject **)(v25 - 120);
  if (v27) {
    dispatch_release(v27);
  }
  if (v24) {
    _Block_release(v24);
  }
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

intptr_t ___ZN3pci6system4info8insertBHEiNSt3__18weak_ptrINS_9transport2bhEEEj_block_invoke(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v6 = pci::log::get(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = *(_DWORD *)(a1 + 72);
    *(_DWORD *)int buf = 136316162;
    *(void *)&uint8_t buf[4] = "system";
    __int16 v14 = 2048;
    uint64_t v15 = v4;
    __int16 v16 = 1024;
    int v17 = v12;
    __int16 v18 = 2080;
    long long v19 = "insertBH_block_invoke";
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_debug_impl(&dword_21861F000, v6, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: completion %u", buf, 0x2Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 2os_unfair_lock_unlock(this + 4) = a2;
  if (a2)
  {
    *(void *)int buf = a1 + 76;
    unint64_t v7 = std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t **)(v4 + 56), (int *)(a1 + 76), (uint64_t)&std::piecewise_construct, (_DWORD **)buf);
    long long v9 = *(uint64_t **)(a1 + 56);
    BOOL v8 = *(uint64_t **)(a1 + 64);
    if (v8) {
      atomic_fetch_add_explicit(v8 + 2, 1uLL, memory_order_relaxed);
    }
    int v10 = (std::__shared_weak_count *)v7[6];
    v7[5] = v9;
    v7[6] = v8;
    if (v10) {
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t __copy_helper_block_e8_56c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 64);
  *(void *)(result + 56) = *(void *)(a2 + 56);
  *(void *)(result + 6os_unfair_lock_unlock(this + 4) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_56c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 64);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

uint64_t pci::system::info::removeBH(pci::system::info *this, int a2)
{
  uint64_t v4 = (os_unfair_lock_s *)((char *)this + 16);
  os_unfair_lock_lock((os_unfair_lock_t)this + 4);
  uint64_t v5 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v6 = pci::log::get(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    pci::system::info::removeBH((uint64_t)this, a2, v6);
  }
  uint64_t v7 = *((void *)this + 8);
  if (!v7) {
    goto LABEL_13;
  }
  BOOL v8 = (uint64_t *)((char *)this + 64);
  do
  {
    int v9 = *(_DWORD *)(v7 + 32);
    BOOL v10 = v9 < a2;
    if (v9 >= a2) {
      BOOL v11 = (uint64_t *)v7;
    }
    else {
      BOOL v11 = (uint64_t *)(v7 + 8);
    }
    if (!v10) {
      BOOL v8 = (uint64_t *)v7;
    }
    uint64_t v7 = *v11;
  }
  while (*v11);
  if (v8 == (uint64_t *)((char *)this + 64) || *((_DWORD *)v8 + 8) > a2) {
LABEL_13:
  }
    pci::system::info::removeBH();
  std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::erase((uint64_t **)this + 7, v8);
  int v17 = (char *)*((void *)this + 11);
  __int16 v16 = (uint64_t **)((char *)this + 88);
  uint64_t v15 = v17;
  if (v17)
  {
    __int16 v18 = v16;
    do
    {
      int v19 = *((_DWORD *)v15 + 8);
      BOOL v20 = v19 < a2;
      if (v19 >= a2) {
        int v21 = (char **)v15;
      }
      else {
        int v21 = (char **)(v15 + 8);
      }
      if (!v20) {
        __int16 v18 = (uint64_t **)v15;
      }
      uint64_t v15 = *v21;
    }
    while (*v21);
    if (v18 != v16 && *((_DWORD *)v18 + 8) <= a2)
    {
      ((void (*)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))v18[5][2])(v18[5], 1, v12, v13, v14);
      std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(v16 - 1, (uint64_t *)v18);
      std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>((uint64_t)(v18 + 4));
      operator delete(v18);
    }
  }
  os_unfair_lock_unlock(v4);
  return 1;
}

void std::shared_ptr<pci::system::info>::shared_ptr[abi:ne180100]<pci::system::info,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_218624668(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::system::info>::reset[abi:ne180100]((pci::system::info **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::system::info *,std::shared_ptr<pci::system::info>::__shared_ptr_default_delete<pci::system::info,pci::system::info>,std::allocator<pci::system::info>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D46F100);
}

pci::system::info *std::__shared_ptr_pointer<pci::system::info *,std::shared_ptr<pci::system::info>::__shared_ptr_default_delete<pci::system::info,pci::system::info>,std::allocator<pci::system::info>>::__on_zero_shared(uint64_t a1)
{
  __n128 result = *(pci::system::info **)(a1 + 24);
  if (result)
  {
    pci::system::info::~info(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::system::info *,std::shared_ptr<pci::system::info>::__shared_ptr_default_delete<pci::system::info,pci::system::info>,std::allocator<pci::system::info>>::__get_deleter(uint64_t a1, uint64_t a2)
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

pci::system::info *std::unique_ptr<pci::system::info>::reset[abi:ne180100](pci::system::info **a1, pci::system::info *a2)
{
  __n128 result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::system::info::~info(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

void std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::destroy(a1, a2[1]);
    uint64_t v4 = (std::__shared_weak_count *)a2[6];
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v4);
    }
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::destroy(a1, a2[1]);
    uint64_t v4 = (std::__shared_weak_count *)a2[6];
    if (v4) {
      std::__shared_weak_count::__release_weak(v4);
    }
    operator delete(a2);
  }
}

void std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 8);
  if (v1) {
    _Block_release(v1);
  }
}

_OWORD *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__emplace_multi<std::pair<void const*,std::shared_ptr<pci::transport::th>>>(uint64_t **a1, long long *a2)
{
  uint64_t v4 = operator new(0x38uLL);
  long long v5 = *a2;
  uint64_t v6 = *((void *)a2 + 2);
  *((void *)a2 + 1) = 0;
  *((void *)a2 + 2) = 0;
  uint64_t v7 = a1 + 1;
  BOOL v8 = a1[1];
  v4[2] = v5;
  *((void *)v4 + 6) = v6;
  if (v8)
  {
    do
    {
      while (1)
      {
        uint64_t v7 = (uint64_t **)v8;
        if ((unint64_t)v5 >= v8[4]) {
          break;
        }
        BOOL v8 = (uint64_t *)*v8;
        int v9 = v7;
        if (!*v7) {
          goto LABEL_8;
        }
      }
      BOOL v8 = (uint64_t *)v8[1];
    }
    while (v8);
    int v9 = v7 + 1;
  }
  else
  {
    int v9 = a1 + 1;
  }
LABEL_8:
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v7, v9, (uint64_t *)v4);
  return v4;
}

uint64_t *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  long long v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  __n128 result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 2os_unfair_lock_unlock(this + 4) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), long long v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            int v9 = (uint64_t **)a2[2];
          }
          else
          {
            int v9 = (uint64_t **)v2[1];
            BOOL v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            uint64_t *v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 2os_unfair_lock_unlock(this + 4) = 1;
          *((unsigned char *)v3 + 2os_unfair_lock_unlock(this + 4) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), long long v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 2os_unfair_lock_unlock(this + 4) = 1;
        *((unsigned char *)v3 + 2os_unfair_lock_unlock(this + 4) = 0;
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
      *((unsigned char *)v2 + 2os_unfair_lock_unlock(this + 4) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 2os_unfair_lock_unlock(this + 4) = v3 == result;
      *long long v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::erase(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(a1, a2);
  uint64_t v4 = (std::__shared_weak_count *)a2[6];
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  operator delete(a2);
  return v3;
}

uint64_t *std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  int v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  int v6 = (uint64_t **)v3[2];
  uint64_t v7 = *v6;
  if (*v6 == v3)
  {
    uint64_t *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      uint64_t v7 = 0;
      __n128 result = (uint64_t *)v2;
    }
    else
    {
      uint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 2os_unfair_lock_unlock(this + 4) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      __n128 result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 2os_unfair_lock_unlock(this + 4) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 1;
      *(unsigned char *)(v12 + 2os_unfair_lock_unlock(this + 4) = 0;
      uint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        __n128 result = v7;
      }
      uint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      __int16 v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 2os_unfair_lock_unlock(this + 4) = 1;
        *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 0;
        uint64_t v22 = v15[1];
        uint64_t *v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        uint64_t v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        __int16 v16 = v7;
      }
      else
      {
        uint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 2os_unfair_lock_unlock(this + 4) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 2os_unfair_lock_unlock(this + 4) = 1;
      *((unsigned char *)v16 + 2os_unfair_lock_unlock(this + 4) = 1;
      BOOL v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      uint64_t *v24 = v23;
      goto LABEL_72;
    }
    __int16 v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 0;
    int v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      int v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 2os_unfair_lock_unlock(this + 4) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    uint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 1;
    *(unsigned char *)(v12 + 2os_unfair_lock_unlock(this + 4) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      __n128 result = v7;
    }
    uint64_t v7 = *(uint64_t **)v12;
  }
  int v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  BOOL v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 0;
    int v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    BOOL v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 2os_unfair_lock_unlock(this + 4) = 1;
    *((unsigned char *)v7 + 2os_unfair_lock_unlock(this + 4) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *BOOL v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    int v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 2os_unfair_lock_unlock(this + 4) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 2os_unfair_lock_unlock(this + 4) = 1;
  *((unsigned char *)v19 + 2os_unfair_lock_unlock(this + 4) = 1;
  BOOL v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t **std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        int v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = operator new(0x38uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0;
    *((void *)v11 + 6) = 0;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t **std::__tree<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::__map_value_compare<int,std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,std::less<int>,true>,std::allocator<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  int v8 = a1 + 1;
  uint64_t v9 = a1 + 1;
  if (v6)
  {
    int v10 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11) {
          break;
        }
        int v6 = *v9;
        int v8 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }
      if (v11 >= v10) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        int v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v12 = operator new(0x30uLL);
    v14[1] = v7;
    v12[8] = **a4;
    *((void *)v12 + 5) = 0;
    char v15 = 1;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v14, 0);
    return (uint64_t **)v12;
  }
  return v9;
}

void std::unique_ptr<std::__tree_node<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<int,dispatch::block<void({block_pointer})(BOOL)>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<int const,dispatch::block<void({block_pointer})(BOOL)>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

uint64_t *std::__tree<std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::__map_value_compare<int,std::__value_type<int,std::weak_ptr<pci::transport::bh>>,std::less<int>,true>,std::allocator<std::__value_type<int,std::weak_ptr<pci::transport::bh>>>>::erase(uint64_t **a1, uint64_t *a2)
{
  uint64_t v3 = std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer(a1, a2);
  uint64_t v4 = (std::__shared_weak_count *)a2[6];
  if (v4) {
    std::__shared_weak_count::__release_weak(v4);
  }
  operator delete(a2);
  return v3;
}

double TelephonyBasebandPCITransportInitParameters(uint64_t a1)
{
  if (a1) {
    return pci::transport::th::initParams(a1);
  }
  return result;
}

uint64_t TelephonyBasebandPCITransportCreate(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    *(void *)(a1 + 80) = 0;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 6os_unfair_lock_unlock(this + 4) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    if (pci::transport::th::validateParams(a2)) {
      pci::transport::th::create();
    }
  }
  else
  {
    uint64_t v2 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v3 = pci::log::get(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_21861F000, v3, OS_LOG_TYPE_INFO, "no tu transport object", buf, 2u);
    }
  }
  return 0;
}

void sub_218625448(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  __int16 v16 = *(std::__shared_weak_count **)(v14 - 24);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  _Unwind_Resume(exception_object);
}

BOOL TelephonyBasebandPCITransportFree(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportFree();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v6);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  uint64_t v2 = v6;
  if (v6)
  {
    pci::system::info::get(&buf);
    pci::system::info::eraseTH((pci::system::info *)buf, *(void *)(a1 + 80));
    if (*((void *)&buf + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
    }
  }
  else
  {
    uint64_t v3 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v4 = pci::log::get(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
      _os_log_impl(&dword_21861F000, v4, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v2 != 0;
}

void sub_2186255BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

NSObject *TelephonyBasebandPCITransportRead(uint64_t a1, const unsigned __int8 *a2, unsigned int a3, _DWORD *a4, uint64_t a5, int a6, NSObject *a7)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  unsigned int v23 = a3;
  if (!a1) {
    TelephonyBasebandPCITransportRead();
  }
  if (a3 && a2 && a4)
  {
    *a4 = 0;
    pci::system::info::get(&v24);
    pci::system::info::getTH((os_unfair_lock_s *)v24, *(void *)(a1 + 80), buf);
    if (*((void *)&v24 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v24 + 1));
    }
    if (*(void *)buf)
    {
      if (!*(unsigned char *)(*(void *)buf + 74)) {
        pci::transport::th::read(*(pci::transport::th **)buf, a2, &v23, a7, a6);
      }
      int v11 = (pci::log *)_TelephonyUtilDebugPrintError();
      uint64_t v12 = pci::log::get(v11);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
        goto LABEL_18;
      }
      LOWORD(v2os_unfair_lock_unlock(this + 4) = 0;
      uint64_t v13 = "client cannot issue read for async transport";
      uint64_t v14 = v12;
      uint32_t v15 = 2;
    }
    else
    {
      uint64_t v18 = (pci::log *)_TelephonyUtilDebugPrintError();
      int v19 = pci::log::get(v18);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_18:
        if (a7)
        {
          ((void (*)(const unsigned __int8 *))a7)(a2);
          a7 = 0;
        }
        if (v22) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v22);
        }
        return a7;
      }
      LODWORD(v2os_unfair_lock_unlock(this + 4) = 134217984;
      *(void *)((char *)&v24 + os_unfair_lock_unlock(this + 4) = a1;
      uint64_t v13 = "transport %p is not valid";
      uint64_t v14 = v19;
      uint32_t v15 = 12;
    }
    _os_log_impl(&dword_21861F000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v24, v15);
    goto LABEL_18;
  }
  __int16 v16 = (pci::log *)_TelephonyUtilDebugPrintError();
  int v17 = pci::log::get(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_21861F000, v17, OS_LOG_TYPE_INFO, "invalid parameters", buf, 2u);
  }
  if (a7)
  {
    ((void (*)(const unsigned __int8 *))a7)(a2);
    return 0;
  }
  return a7;
}

void sub_21862584C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

NSObject *TelephonyBasebandPCITransportSendImage(uint64_t a1, const unsigned __int8 *a2, int a3, _DWORD *a4, int a5, _DWORD *a6, NSObject *a7)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  unsigned int v19 = 0;
  if (!a1) {
    TelephonyBasebandPCITransportSendImage();
  }
  if (a3 && a2 && a4 && a6)
  {
    *a4 = 0;
    *a6 = 0;
    pci::system::info::get(&v20);
    pci::system::info::getTH((os_unfair_lock_s *)v20, *(void *)(a1 + 80), buf);
    if (*((void *)&v20 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v20 + 1));
    }
    if (*(void *)buf)
    {
      if (*(unsigned char *)(*(void *)buf + 74)) {
        pci::transport::th::sendImageAsync(*(pci::transport::th **)buf, a2, a3, a7);
      }
      pci::transport::th::sendImage(*(pci::transport::th **)buf, a2, a3, &v19, a7, a5);
    }
    uint64_t v14 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint32_t v15 = pci::log::get(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(v20) = 134217984;
      *(void *)((char *)&v20 + os_unfair_lock_unlock(this + 4) = a1;
      _os_log_impl(&dword_21861F000, v15, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&v20, 0xCu);
    }
    if (a7)
    {
      ((void (*)(const unsigned __int8 *))a7)(a2);
      a7 = 0;
    }
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  else
  {
    uint64_t v12 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v13 = pci::log::get(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21861F000, v13, OS_LOG_TYPE_INFO, "invalid parameters", buf, 2u);
    }
    if (a7)
    {
      ((void (*)(const unsigned __int8 *))a7)(a2);
      return 0;
    }
  }
  return a7;
}

void sub_218625AA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TelephonyBasebandPCITransportReadRegister(uint64_t a1, int a2, const unsigned __int8 *a3, unsigned int a4, _DWORD *a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unsigned int v15 = a4;
  if (!a1) {
    TelephonyBasebandPCITransportReadRegister();
  }
  if (a4 && a3 && a5)
  {
    *a5 = 0;
    pci::system::info::get(&v16);
    pci::system::info::getTH((os_unfair_lock_s *)v16, *(void *)(a1 + 80), buf);
    if (*((void *)&v16 + 1)) {
      std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&v16 + 1));
    }
    if (*(void *)buf) {
      pci::transport::th::readRegister(*(pci::transport::th **)buf, a2, a3, &v15, -1);
    }
    int v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    int v11 = pci::log::get(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(v16) = 134217984;
      *(void *)((char *)&v16 + os_unfair_lock_unlock(this + 4) = a1;
      _os_log_impl(&dword_21861F000, v11, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&v16, 0xCu);
    }
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v14);
    }
  }
  else
  {
    int v8 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v9 = pci::log::get(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21861F000, v9, OS_LOG_TYPE_INFO, "invalid parameters", buf, 2u);
    }
  }
  return 0;
}

void sub_218625C98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TelephonyBasebandPCITransportUnblockRead(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportUnblockRead();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v6);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  if (v6)
  {
    uint64_t v2 = pci::transport::th::unblockRead((os_unfair_lock_t *)v6);
  }
  else
  {
    uint64_t v3 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v4 = pci::log::get(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
      _os_log_impl(&dword_21861F000, v4, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v2 = 0;
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v2;
}

void sub_218625DE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

BOOL TelephonyBasebandPCITransportFlushRead(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportFlushRead();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v6);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  if (v6)
  {
    BOOL v2 = pci::transport::th::flushRead(v6);
  }
  else
  {
    uint64_t v3 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v4 = pci::log::get(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
      _os_log_impl(&dword_21861F000, v4, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    BOOL v2 = 0;
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v2;
}

void sub_218625F28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

BOOL TelephonyBasebandPCITransportIsValid(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportIsValid();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v6);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  uint64_t v2 = v6;
  if (!v6)
  {
    uint64_t v3 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v4 = pci::log::get(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
      _os_log_impl(&dword_21861F000, v4, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
  }
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  return v2 != 0;
}

void sub_21862606C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TelephonyBasebandPCITransportTimesync(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportTimesync_cold_1();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v11);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  if (v11) {
    pci::transport::th::timesyncAsync(v11, a2, a3, a4);
  }
  int v8 = (pci::log *)_TelephonyUtilDebugPrintError();
  uint64_t v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
    _os_log_impl(&dword_21861F000, v9, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
  }
  if (v12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v12);
  }
  return 0;
}

void sub_2186261D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

BOOL TelephonyBasebandPCITransportRegisterTimeEvent(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportRegisterTimeEvent_cold_1();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v10);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  if (v10)
  {
    BOOL v6 = pci::transport::th::registerTimeEvent(v10, a2, a3);
  }
  else
  {
    uint64_t v7 = (pci::log *)_TelephonyUtilDebugPrintError();
    int v8 = pci::log::get(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
      _os_log_impl(&dword_21861F000, v8, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    BOOL v6 = 0;
  }
  if (v11) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v11);
  }
  return v6;
}

void sub_218626334(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

BOOL TelephonyBasebandPCITransportDeregisterTimeEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportDeregisterTimeEvent_cold_1();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v8);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  if (v8)
  {
    BOOL v4 = pci::transport::th::deregisterTimeEvent(v8, a2);
  }
  else
  {
    int v5 = (pci::log *)_TelephonyUtilDebugPrintError();
    BOOL v6 = pci::log::get(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
      _os_log_impl(&dword_21861F000, v6, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
    }
    BOOL v4 = 0;
  }
  if (v9) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v9);
  }
  return v4;
}

void sub_218626484(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TelephonyBasebandPCITransportMapRegion(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportMapRegion_cold_1();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v13);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  if (v13) {
    pci::transport::th::mapRegionAsync(v13, a2, a3, a4, 0, 0, a5);
  }
  uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintError();
  uint64_t v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
    _os_log_impl(&dword_21861F000, v11, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
  }
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  return 0;
}

void sub_218626604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TelephonyBasebandPCITransportMapRegionwithClientData(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportMapRegionwithClientData_cold_1();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v17);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  if (v17) {
    pci::transport::th::mapRegionAsync(v17, a2, a3, a4, a5, a6, a7);
  }
  uint64_t v14 = (pci::log *)_TelephonyUtilDebugPrintError();
  unsigned int v15 = pci::log::get(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
    _os_log_impl(&dword_21861F000, v15, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
  }
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  return 0;
}

void sub_218626794(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

uint64_t TelephonyBasebandPCITransportUnmapRegion(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (!a1) {
    TelephonyBasebandPCITransportUnmapRegion_cold_1();
  }
  pci::system::info::get(&buf);
  pci::system::info::getTH((os_unfair_lock_s *)buf, *(void *)(a1 + 80), &v9);
  if (*((void *)&buf + 1)) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*((std::__shared_weak_count **)&buf + 1));
  }
  if (v9) {
    pci::transport::th::unmapRegionAsync(v9, a2, a3);
  }
  BOOL v6 = (pci::log *)_TelephonyUtilDebugPrintError();
  uint64_t v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(void *)((char *)&buf + os_unfair_lock_unlock(this + 4) = a1;
    _os_log_impl(&dword_21861F000, v7, OS_LOG_TYPE_INFO, "transport %p is not valid", (uint8_t *)&buf, 0xCu);
  }
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  return 0;
}

void sub_2186268F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12, uint64_t a13, uint64_t a14)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

os_log_t ___ZN3pci3log3getEv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.telephony.ipc", "PCI");
  pci::log::get(void)::logger = (uint64_t)result;
  return result;
}

BOOL pci::transport::kernel::isServicePresent(pci::transport::kernel *this, const char *a2)
{
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceMatching((const char *)this);
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  io_service_t v5 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v5 != 0;
}

uint64_t pci::transport::kernel::probeVariant(pci::transport::kernel *this)
{
  if (pci::transport::kernel::probeVariant(void)::sOnce != -1) {
    dispatch_once(&pci::transport::kernel::probeVariant(void)::sOnce, &__block_literal_global_1);
  }
  return pci::transport::kernel::probeVariant(void)::ret;
}

void ___ZN3pci9transport6kernel12probeVariantEv_block_invoke()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v8[0] = xmmword_26432D3B0;
  v8[1] = *(_OWORD *)&off_26432D3C0;
  std::map<char const*,pci::transport::kernel::variant>::map[abi:ne180100]((uint64_t)&v6, (unint64_t *)v8, 2);
  uint64_t v1 = v6;
  if (v6 == v7)
  {
LABEL_9:
    int v5 = 0;
  }
  else
  {
    while (!pci::transport::kernel::isServicePresent((pci::transport::kernel *)v1[4], v0))
    {
      mach_port_t v2 = v1[1];
      if (v2)
      {
        do
        {
          CFDictionaryRef v3 = (void **)v2;
          mach_port_t v2 = (void *)*v2;
        }
        while (v2);
      }
      else
      {
        do
        {
          CFDictionaryRef v3 = (void **)v1[2];
          BOOL v4 = *v3 == v1;
          uint64_t v1 = v3;
        }
        while (!v4);
      }
      uint64_t v1 = v3;
      if (v3 == v7) {
        goto LABEL_9;
      }
    }
    int v5 = *((_DWORD *)v1 + 10);
  }
  pci::transport::kernel::probeVariant(void)::ret = v5;
  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v6, v7[0]);
}

void sub_218626AD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11)
{
}

unint64_t pci::transport::kernel::errorAsUnsigned(unint64_t a1)
{
  return HIDWORD(a1);
}

const char *pci::transport::kernel::errorAsString(int a1)
{
  if (a1 == 2) {
    return (const char *)getACIPCErrorTypeString();
  }
  if (a1 == 1) {
    return (const char *)getABPErrorTypeString();
  }
  return "unrecognized error code";
}

uint64_t pci::transport::kernel::getTimesyncBufferSize(pci::transport::kernel *this, int a2)
{
  unsigned int v3 = (*(uint64_t (**)(pci::transport::kernel *))(*(void *)this + 176))(this);
  if (v3 <= 0x18) {
    int v4 = 24;
  }
  else {
    int v4 = v3;
  }
  return (v4 * a2);
}

uint64_t pci::transport::kernel::marshalTimesyncResults(pci::transport::kernel *this, char *a2, unsigned int a3)
{
  unsigned int v6 = (*(uint64_t (**)(pci::transport::kernel *))(*(void *)this + 176))(this);
  uint64_t v7 = a3 / v6;
  if (v6 <= a3)
  {
    unsigned int v8 = v6;
    int v9 = 0;
    if (v7 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v7;
    }
    do
    {
      int v11 = v7 + ~v9;
      (*(void (**)(long long *__return_ptr, pci::transport::kernel *, char *))(*(void *)this + 184))(&v14, this, &a2[v11 * v8]);
      uint64_t v12 = &a2[24 * v11];
      *(_OWORD *)uint64_t v12 = v14;
      *((void *)v12 + 2) = v15;
      ++v9;
      --v10;
    }
    while (v10);
  }
  return v7;
}

uint64_t abpKernel::pciTransportInterfaceToABP(int a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  {
    int v7 = a1;
    a1 = v7;
    if (v8)
    {
      memcpy(__dst, &unk_26432D3D0, sizeof(__dst));
      std::map<PCITransportInterface,char const*>::map[abi:ne180100]((uint64_t)&v10, __dst, 18);
      int v9 = (void *)v11;
      abpKernel::pciTransportInterfaceToABP(PCITransportInterface)::sMap = (uint64_t)v10;
      qword_26AB338A0 = v11;
      qword_26AB338A8 = v12;
      if (v12)
      {
        *(void *)(v11 + 16) = &qword_26AB338A0;
        uint64_t v10 = &v11;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        int v9 = 0;
      }
      else
      {
        abpKernel::pciTransportInterfaceToABP(PCITransportInterface)::sMap = (uint64_t)&qword_26AB338A0;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v10, v9);
      a1 = v7;
    }
  }
  uint64_t v1 = qword_26AB338A0;
  if (!qword_26AB338A0) {
    return 0;
  }
  mach_port_t v2 = &qword_26AB338A0;
  do
  {
    int v3 = *(_DWORD *)(v1 + 32);
    BOOL v4 = v3 < a1;
    if (v3 >= a1) {
      int v5 = (uint64_t *)v1;
    }
    else {
      int v5 = (uint64_t *)(v1 + 8);
    }
    if (!v4) {
      mach_port_t v2 = (uint64_t *)v1;
    }
    uint64_t v1 = *v5;
  }
  while (*v5);
  if (v2 != &qword_26AB338A0 && *((_DWORD *)v2 + 8) <= a1) {
    return v2[5];
  }
  else {
    return 0;
  }
}

void sub_218626DD4(_Unwind_Exception *a1)
{
}

unint64_t abpKernel::pciTransportRegisterToABP(int a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  {
    int v8 = a1;
    a1 = v8;
    if (v9)
    {
      v14[0] = xmmword_21863BFB8;
      v14[1] = unk_21863BFC8;
      void v14[2] = xmmword_21863BFD8;
      std::map<PCITransportRegister,unsigned int>::map[abi:ne180100]((uint64_t)&v11, (int *)v14, 6);
      uint64_t v10 = (void *)v12;
      abpKernel::pciTransportRegisterToABP(PCITransportRegister)::sMap = (uint64_t)v11;
      qword_26AB33888 = v12;
      qword_26AB33890 = v13;
      if (v13)
      {
        *(void *)(v12 + 16) = &qword_26AB33888;
        uint64_t v11 = &v12;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        uint64_t v10 = 0;
      }
      else
      {
        abpKernel::pciTransportRegisterToABP(PCITransportRegister)::sMap = (uint64_t)&qword_26AB33888;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v11, v10);
      a1 = v8;
    }
  }
  unint64_t v1 = qword_26AB33888;
  if (qword_26AB33888)
  {
    mach_port_t v2 = &qword_26AB33888;
    do
    {
      int v3 = *(_DWORD *)(v1 + 28);
      BOOL v4 = v3 < a1;
      if (v3 >= a1) {
        int v5 = (unint64_t *)v1;
      }
      else {
        int v5 = (unint64_t *)(v1 + 8);
      }
      if (!v4) {
        mach_port_t v2 = (uint64_t *)v1;
      }
      unint64_t v1 = *v5;
    }
    while (*v5);
    if (v2 == &qword_26AB33888 || *((_DWORD *)v2 + 7) > a1)
    {
      uint64_t v6 = 0;
      unint64_t v1 = 0;
    }
    else
    {
      unint64_t v1 = (unint64_t)*((unsigned int *)v2 + 8) << 32;
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v1 | v6;
}

void sub_218626F68(_Unwind_Exception *a1)
{
}

void *abpKernel::wrapNotificationBlock@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  if (a1)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN9abpKernel21wrapNotificationBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEjiE_block_invoke;
    aBlock[3] = &unk_26432D4F8;
    aBlock[4] = a1;
    os_log_t result = _Block_copy(aBlock);
  }
  else
  {
    os_log_t result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t ___ZN9abpKernel21wrapNotificationBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEjiE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t abpKernel::start(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!abpKernel::pciTransportInterfaceToABP(a2)) {
    return 0;
  }
  abpKernel::wrapNotificationBlock(a6, &v10);
  int v7 = v10;
  uint64_t v8 = IOABPClass::start();
  if (v7) {
    _Block_release(v7);
  }
  return v8;
}

{
  const void *v7;
  uint64_t v8;
  const void *v10;

  if (!abpKernel::pciTransportInterfaceToABP(a2)) {
    return 0;
  }
  abpKernel::wrapNotificationBlock(a6, &v10);
  int v7 = v10;
  uint64_t v8 = IOABPClass::start();
  if (v7) {
    _Block_release(v7);
  }
  return v8;
}

void sub_2186270CC(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_218627190(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t abpKernel::readRegister(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = abpKernel::pciTransportRegisterToABP(a2);
  if (!(_BYTE)v7) {
    return 3758097090;
  }

  return MEMORY[0x270F92108](a1 + 8, HIDWORD(v7), a3, a4);
}

uint64_t abpKernel::abortChannelAsync(uint64_t a1, int a2)
{
  if ((a2 - 3) <= 0xFFFFFFFD) {
    abpKernel::abortChannelAsync();
  }
  BOOL v3 = a2 != 1;
  uint64_t v4 = a1 + 8;
  return MEMORY[0x270F92130](v4, v3);
}

uint64_t abpKernel::startChannelAsync(uint64_t a1, int a2)
{
  if ((a2 - 3) <= 0xFFFFFFFD) {
    abpKernel::startChannelAsync();
  }
  BOOL v3 = a2 != 1;
  uint64_t v4 = a1 + 8;
  return MEMORY[0x270F92140](v4, v3);
}

uint64_t abpKernel::PCITransportTimeDomainToABP(uint64_t a1, int a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  {
    int v9 = a2;
    a2 = v9;
    if (v10)
    {
      int v15 = 1;
      char v16 = 1;
      int v17 = 2;
      char v18 = 2;
      std::map<PCITransportTimeDomain,unsigned char>::map[abi:ne180100]((uint64_t)&v12, &v15, 2);
      uint64_t v11 = (void *)v13;
      abpKernel::PCITransportTimeDomainToABP(PCITransportTimeDomain)::sMap = (uint64_t)v12;
      qword_267BD6838 = v13;
      qword_267BD6840 = v14;
      if (v14)
      {
        *(void *)(v13 + 16) = &qword_267BD6838;
        uint64_t v12 = &v13;
        uint64_t v13 = 0;
        uint64_t v14 = 0;
        uint64_t v11 = 0;
      }
      else
      {
        abpKernel::PCITransportTimeDomainToABP(PCITransportTimeDomain)::sMap = (uint64_t)&qword_267BD6838;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v12, v11);
      a2 = v9;
    }
  }
  uint64_t v2 = qword_267BD6838;
  if (qword_267BD6838)
  {
    BOOL v3 = &qword_267BD6838;
    do
    {
      int v4 = *(_DWORD *)(v2 + 28);
      BOOL v5 = v4 < a2;
      if (v4 >= a2) {
        uint64_t v6 = (uint64_t *)v2;
      }
      else {
        uint64_t v6 = (uint64_t *)(v2 + 8);
      }
      if (!v5) {
        BOOL v3 = (uint64_t *)v2;
      }
      uint64_t v2 = *v6;
    }
    while (*v6);
    if (v3 == &qword_267BD6838 || *((_DWORD *)v3 + 7) > a2)
    {
      int v7 = 0;
      LODWORD(v2) = 0;
    }
    else
    {
      LODWORD(v2) = *((unsigned __int8 *)v3 + 32);
      int v7 = 1;
    }
  }
  else
  {
    int v7 = 0;
  }
  return v7 | (v2 << 8);
}

void sub_218627404(_Unwind_Exception *a1)
{
}

uint64_t abpKernel::timesyncAsync(uint64_t a1, int a2, int a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = 3758097090;
  uint64_t v8 = (32 * a3);
  if (v8 > a5) {
    return 3758097115;
  }
  __int16 v13 = abpKernel::PCITransportTimeDomainToABP(a1, a2);
  if (!(_BYTE)v13) {
    return v7;
  }

  return MEMORY[0x270F92110](a1 + 8, HIBYTE(v13), a4, v8, a6, a7);
}

uint64_t abpKernel::registerTimeEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!abpKernel::PCITransportTimeDomainToABP(a1, a2)) {
    return 3758097090;
  }

  return MEMORY[0x270F92138](a1 + 8, a2, a3, a4);
}

uint64_t abpKernel::deregisterTimeEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!abpKernel::PCITransportTimeDomainToABP(a1, a2)) {
    return 3758097090;
  }

  return MEMORY[0x270F92148](a1 + 8, a2, a3, a4);
}

void abpKernel::marshalTimesyncMeasurement(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3 = a1[1];
  int v4 = *((_DWORD *)a1 + 4) - v3;
  *(_DWORD *)a2 = *(_DWORD *)a1;
  *(_DWORD *)(a2 + os_unfair_lock_unlock(this + 4) = v4;
  uint64_t v5 = a1[3];
  *(void *)(a2 + 8) = v3;
  *(void *)(a2 + 16) = v5;
}

uint64_t abpKernel::mapRegionAsync(uint64_t a1, unsigned __int16 a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MEMORY[0x270F92118](a1 + 8, a2, a3, a4, a7, a8);
}

uint64_t abpKernel::unmapRegionAsync(uint64_t a1, unsigned __int16 a2)
{
  return MEMORY[0x270F92128](a1 + 8, a2);
}

void *abpKernelControl::wrapControlEventBlock@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  if (a1)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN16abpKernelControl21wrapControlEventBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEPvS7_E_block_invoke;
    aBlock[3] = &unk_26432D520;
    aBlock[4] = a1;
    os_log_t result = _Block_copy(aBlock);
  }
  else
  {
    os_log_t result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t ___ZN16abpKernelControl21wrapControlEventBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEPvS7_E_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t abpKernelControl::registerEventNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  abpKernelControl::wrapControlEventBlock(a3, &v6);
  uint64_t v3 = v6;
  uint64_t v4 = IOABPControlClass::registerEventNotification();
  if (v3) {
    _Block_release(v3);
  }
  return v4;
}

{
  const void *v3;
  uint64_t v4;
  const void *v6;

  abpKernelControl::wrapControlEventBlock(a3, &v6);
  uint64_t v3 = v6;
  uint64_t v4 = IOABPControlClass::registerEventNotification();
  if (v3) {
    _Block_release(v3);
  }
  return v4;
}

void sub_218627704(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_21862778C(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void acipcKernel::acipcKernel(acipcKernel *this)
{
  *(void *)this = &unk_26C9BA5B0;
  *(_OWORD *)((char *)this + 2os_unfair_lock_unlock(this + 4) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *(_OWORD *)((char *)this + 10os_unfair_lock_unlock(this + 4) = 0u;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *(_OWORD *)((char *)this + 152) = 0u;
  *(_OWORD *)((char *)this + 168) = 0u;
  *(_OWORD *)((char *)this + 18os_unfair_lock_unlock(this + 4) = 0u;
  *(_OWORD *)((char *)this + 8) = 0u;
  IOACIPCClass::IOACIPCClass((acipcKernel *)((char *)this + 8));
  *uint64_t v2 = MEMORY[0x263F8BB10] + 16;
  *((void *)this + 25) = 0;
  *((void *)this + 26) = 0;
  *((void *)this + 27) = -1;
}

uint64_t acipcKernel::pciTransportInterfaceToACIPC(int a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  {
    int v7 = a1;
    a1 = v7;
    if (v8)
    {
      v13[9] = unk_26432D5D0;
      v13[10] = xmmword_26432D5E0;
      v13[11] = unk_26432D5F0;
      v13[12] = xmmword_26432D600;
      v13[7] = unk_26432D5B0;
      v13[8] = xmmword_26432D5C0;
      v13[2] = xmmword_26432D560;
      v13[3] = unk_26432D570;
      v13[5] = unk_26432D590;
      v13[6] = xmmword_26432D5A0;
      v13[4] = xmmword_26432D580;
      v13[0] = xmmword_26432D540;
      v13[1] = unk_26432D550;
      std::map<PCITransportInterface,__CFString const*>::map[abi:ne180100]((uint64_t)&v10, (int *)v13, 13);
      int v9 = (void *)v11;
      acipcKernel::pciTransportInterfaceToACIPC(PCITransportInterface)::sMap = (uint64_t)v10;
      qword_26AB338C0 = v11;
      qword_26AB338C8 = v12;
      if (v12)
      {
        *(void *)(v11 + 16) = &qword_26AB338C0;
        int v10 = &v11;
        uint64_t v11 = 0;
        uint64_t v12 = 0;
        int v9 = 0;
      }
      else
      {
        acipcKernel::pciTransportInterfaceToACIPC(PCITransportInterface)::sMap = (uint64_t)&qword_26AB338C0;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v10, v9);
      a1 = v7;
    }
  }
  uint64_t v1 = qword_26AB338C0;
  if (!qword_26AB338C0) {
    return 0;
  }
  uint64_t v2 = &qword_26AB338C0;
  do
  {
    int v3 = *(_DWORD *)(v1 + 32);
    BOOL v4 = v3 < a1;
    if (v3 >= a1) {
      uint64_t v5 = (uint64_t *)v1;
    }
    else {
      uint64_t v5 = (uint64_t *)(v1 + 8);
    }
    if (!v4) {
      uint64_t v2 = (uint64_t *)v1;
    }
    uint64_t v1 = *v5;
  }
  while (*v5);
  if (v2 != &qword_26AB338C0 && *((_DWORD *)v2 + 8) <= a1) {
    return v2[5];
  }
  else {
    return 0;
  }
}

void sub_2186279E0(_Unwind_Exception *a1)
{
}

unint64_t acipcKernel::pciTransportRegisterToACIPC(int a1)
{
  v14[1] = *MEMORY[0x263EF8340];
  {
    int v8 = a1;
    a1 = v8;
    if (v9)
    {
      v14[0] = 5;
      std::map<PCITransportRegister,unsigned int>::map[abi:ne180100]((uint64_t)&v11, (int *)v14, 1);
      int v10 = (void *)v12;
      acipcKernel::pciTransportRegisterToACIPC(PCITransportRegister)::sMap = (uint64_t)v11;
      qword_26AB33848 = v12;
      qword_26AB33850 = v13;
      if (v13)
      {
        *(void *)(v12 + 16) = &qword_26AB33848;
        uint64_t v11 = &v12;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        int v10 = 0;
      }
      else
      {
        acipcKernel::pciTransportRegisterToACIPC(PCITransportRegister)::sMap = (uint64_t)&qword_26AB33848;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v11, v10);
      a1 = v8;
    }
  }
  unint64_t v1 = qword_26AB33848;
  if (qword_26AB33848)
  {
    uint64_t v2 = &qword_26AB33848;
    do
    {
      int v3 = *(_DWORD *)(v1 + 28);
      BOOL v4 = v3 < a1;
      if (v3 >= a1) {
        uint64_t v5 = (unint64_t *)v1;
      }
      else {
        uint64_t v5 = (unint64_t *)(v1 + 8);
      }
      if (!v4) {
        uint64_t v2 = (uint64_t *)v1;
      }
      unint64_t v1 = *v5;
    }
    while (*v5);
    if (v2 == &qword_26AB33848 || *((_DWORD *)v2 + 7) > a1)
    {
      uint64_t v6 = 0;
      unint64_t v1 = 0;
    }
    else
    {
      unint64_t v1 = (unint64_t)*((unsigned int *)v2 + 8) << 32;
      uint64_t v6 = 1;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v1 | v6;
}

void sub_218627B68(_Unwind_Exception *a1)
{
}

uint64_t acipcKernel::PCITransportTimeDomainToACIPC(int a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  {
    int v8 = a1;
    a1 = v8;
    if (v9)
    {
      v14[0] = xmmword_21863BFE8;
      v14[1] = unk_21863BFF8;
      uint64_t v15 = 0x300000005;
      std::map<PCITransportTimeDomain,unsigned char>::map[abi:ne180100]((uint64_t)&v11, (int *)v14, 5);
      int v10 = (void *)v12;
      acipcKernel::PCITransportTimeDomainToACIPC(PCITransportTimeDomain)::sMap = (uint64_t)v11;
      qword_26AB33860 = v12;
      qword_26AB33868 = v13;
      if (v13)
      {
        *(void *)(v12 + 16) = &qword_26AB33860;
        uint64_t v11 = &v12;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        int v10 = 0;
      }
      else
      {
        acipcKernel::PCITransportTimeDomainToACIPC(PCITransportTimeDomain)::sMap = (uint64_t)&qword_26AB33860;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v11, v10);
      a1 = v8;
    }
  }
  uint64_t v1 = qword_26AB33860;
  if (qword_26AB33860)
  {
    uint64_t v2 = &qword_26AB33860;
    do
    {
      int v3 = *(_DWORD *)(v1 + 28);
      BOOL v4 = v3 < a1;
      if (v3 >= a1) {
        uint64_t v5 = (uint64_t *)v1;
      }
      else {
        uint64_t v5 = (uint64_t *)(v1 + 8);
      }
      if (!v4) {
        uint64_t v2 = (uint64_t *)v1;
      }
      uint64_t v1 = *v5;
    }
    while (*v5);
    if (v2 == &qword_26AB33860 || *((_DWORD *)v2 + 7) > a1)
    {
      int v6 = 0;
      LODWORD(v1) = 0;
    }
    else
    {
      LODWORD(v1) = *((unsigned __int8 *)v2 + 32);
      int v6 = 1;
    }
  }
  else
  {
    int v6 = 0;
  }
  return v6 | (v1 << 8);
}

void sub_218627CFC(_Unwind_Exception *a1)
{
}

uint64_t acipcKernel::pciTransportMemRegionToACIPC(int a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  {
    int v8 = a1;
    a1 = v8;
    if (v9)
    {
      v14[0] = xmmword_21863C010;
      v14[1] = unk_21863C020;
      std::map<PCITransportMemRegion,unsigned short>::map[abi:ne180100]((uint64_t)&v11, (int *)v14, 4);
      int v10 = (void *)v12;
      acipcKernel::pciTransportMemRegionToACIPC(PCITransportMemRegion)::sMap = (uint64_t)v11;
      qword_267BD6858 = v12;
      qword_267BD6860 = v13;
      if (v13)
      {
        *(void *)(v12 + 16) = &qword_267BD6858;
        uint64_t v11 = &v12;
        uint64_t v12 = 0;
        uint64_t v13 = 0;
        int v10 = 0;
      }
      else
      {
        acipcKernel::pciTransportMemRegionToACIPC(PCITransportMemRegion)::sMap = (uint64_t)&qword_267BD6858;
      }
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v11, v10);
      a1 = v8;
    }
  }
  uint64_t v1 = qword_267BD6858;
  if (qword_267BD6858)
  {
    uint64_t v2 = &qword_267BD6858;
    do
    {
      int v3 = *(_DWORD *)(v1 + 28);
      BOOL v4 = v3 < a1;
      if (v3 >= a1) {
        uint64_t v5 = (uint64_t *)v1;
      }
      else {
        uint64_t v5 = (uint64_t *)(v1 + 8);
      }
      if (!v4) {
        uint64_t v2 = (uint64_t *)v1;
      }
      uint64_t v1 = *v5;
    }
    while (*v5);
    if (v2 == &qword_267BD6858 || *((_DWORD *)v2 + 7) > a1)
    {
      int v6 = 0;
      LODWORD(v1) = 0;
    }
    else
    {
      LODWORD(v1) = *((unsigned __int16 *)v2 + 16) << 16;
      int v6 = 1;
    }
  }
  else
  {
    int v6 = 0;
  }
  return v1 | v6;
}

void sub_218627E88(_Unwind_Exception *a1)
{
}

const void **acipcKernel::getMatchingDictionary@<X0>(int a1@<W1>, void *a2@<X8>)
{
  os_log_t result = (const void **)acipcKernel::pciTransportInterfaceToACIPC(a1);
  if (result)
  {
    BOOL v4 = result;
    uint64_t v5 = IOServiceMatching("IOAppleConvergedIPCInterface");
    CFMutableDictionaryRef theDict = v5;
    if (v5) {
      int v6 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
    }
    else {
      int v6 = 0;
    }
    if (v6)
    {
      CFDictionarySetValue(v5, @"ACIPCInterfaceProtocol", v4);
      CFDictionarySetValue(theDict, @"ACIPCInterfaceProviderDevice", @"cellular");
      ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(a2, (CFTypeRef *)&theDict);
    }
    else
    {
      *a2 = 0;
    }
    return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&theDict);
  }
  else
  {
    *a2 = 0;
  }
  return result;
}

void sub_218627F50(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get(uint64_t a1)
{
  return *(void *)a1;
}

void *acipcKernel::wrapNotificationBlock@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  if (a1)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN11acipcKernel21wrapNotificationBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEjiE_block_invoke;
    aBlock[3] = &unk_26432D618;
    aBlock[4] = a1;
    os_log_t result = _Block_copy(aBlock);
  }
  else
  {
    os_log_t result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t ___ZN11acipcKernel21wrapNotificationBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEjiE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t acipcKernel::start(uint64_t a1, int a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  acipcKernel::getMatchingDictionary(a2, &v14);
  if (v14) {
    int v9 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    int v9 = 0;
  }
  if (v9)
  {
    CFTypeRef v13 = a3;
    ctu::cf::CFSharedRef<__CFRunLoop>::operator=((const void **)(a1 + 200), &v13);
    acipcKernel::wrapNotificationBlock(a6, &v13);
    CFTypeRef v10 = v13;
    uint64_t v11 = IOACIPCClass::start();
    if (v10) {
      _Block_release(v10);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v14);
  return v11;
}

void sub_2186280EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  if (v10) {
    _Block_release(v10);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a10);
  _Unwind_Resume(a1);
}

const void **ctu::cf::CFSharedRef<__CFRunLoop>::operator=(const void **a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2) {
    CFRetain(*a2);
  }
  BOOL v4 = *a1;
  *a1 = v3;
  int v6 = v4;
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef(&v6);
  return a1;
}

uint64_t ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t acipcKernel::start(uint64_t a1, int a2, NSObject *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  acipcKernel::getMatchingDictionary(a2, &v15);
  if (v15) {
    int v9 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    int v9 = 0;
  }
  if (v9)
  {
    if (a3) {
      dispatch_retain(a3);
    }
    CFTypeRef v10 = *(NSObject **)(a1 + 208);
    *(void *)(a1 + 208) = a3;
    if (v10) {
      dispatch_release(v10);
    }
    acipcKernel::wrapNotificationBlock(a6, &v14);
    uint64_t v11 = v14;
    uint64_t v12 = IOACIPCClass::start();
    if (v11) {
      _Block_release(v11);
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&v15);
  return v12;
}

void sub_21862825C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10)
{
  if (v10) {
    _Block_release(v10);
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(&a10);
  _Unwind_Resume(a1);
}

const void **acipcKernel::findRings(acipcKernel *this)
{
  *((void *)this + 27) = -1;
  CFArrayRef TransferRingInfo = (const __CFArray *)IOACIPCClass::getTransferRingInfo((acipcKernel *)((char *)this + 8));
  CFArrayRef theArray = TransferRingInfo;
  if (TransferRingInfo) {
    CFTypeRef v3 = ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get;
  }
  else {
    CFTypeRef v3 = 0;
  }
  if (v3)
  {
    CFIndex Count = CFArrayGetCount(TransferRingInfo);
    if (Count >= 1)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        if (*((_DWORD *)this + 54) != -1 && *((_DWORD *)this + 55) != -1) {
          break;
        }
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, i);
        CFDictionaryRef v7 = ValueAtIndex;
        if (!ValueAtIndex) {
          break;
        }
        CFTypeID v8 = CFGetTypeID(ValueAtIndex);
        if (v8 != CFDictionaryGetTypeID()) {
          break;
        }
        int v19 = 0;
        Value = (int *)CFDictionaryGetValue(v7, @"AppleConvergedIPCRingIndex");
        CFTypeRef v10 = Value;
        if (!Value) {
          break;
        }
        CFTypeID v11 = CFGetTypeID(Value);
        if (v11 != CFNumberGetTypeID()) {
          break;
        }
        if ((ctu::cf::assign((ctu::cf *)&v19, v10, v12) & 1) == 0) {
          break;
        }
        int v18 = 0;
        CFTypeRef v13 = (int *)CFDictionaryGetValue(v7, @"AppleConvergedIPCRingDirection");
        uint64_t v14 = v13;
        if (!v13) {
          break;
        }
        CFTypeID v15 = CFGetTypeID(v13);
        if (v15 != CFNumberGetTypeID() || (ctu::cf::assign((ctu::cf *)&v18, v14, v16) & 1) == 0) {
          break;
        }
        if (v18 == 1)
        {
          if (*((_DWORD *)this + 55) == -1) {
            *((_DWORD *)this + 55) = v19;
          }
        }
        else if (v18 == 2 && *((_DWORD *)this + 54) == -1)
        {
          *((_DWORD *)this + 5os_unfair_lock_unlock(this + 4) = v19;
        }
      }
    }
  }
  return ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)&theArray);
}

void sub_21862842C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

double acipcKernel::clearRings(acipcKernel *this)
{
  double result = NAN;
  *((void *)this + 27) = -1;
  return result;
}

uint64_t ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::get(uint64_t a1)
{
  return *(void *)a1;
}

double acipcKernel::open(acipcKernel *this)
{
  acipcKernel::findRings(this);
  if (IOACIPCClass::open((acipcKernel *)((char *)this + 8)))
  {
    double result = NAN;
    *((void *)this + 27) = -1;
  }
  return result;
}

uint64_t acipcKernel::close(acipcKernel *this)
{
  *((void *)this + 27) = -1;
  return MEMORY[0x270F92308]((char *)this + 8);
}

uint64_t acipcKernel::write(acipcKernel *this, const void *a2)
{
  if (*((_DWORD *)this + 55) == -1) {
    return 3758097101;
  }
  else {
    return IOACIPCClass::io();
  }
}

uint64_t acipcKernel::writeAsync(acipcKernel *this, const void *a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  if (*((_DWORD *)this + 55) == -1) {
    return 3758097101;
  }
  else {
    return MEMORY[0x270F92328]((char *)this + 8);
  }
}

uint64_t acipcKernel::read(acipcKernel *this, void *a2, unsigned int *a3)
{
  if (*((_DWORD *)this + 54) == -1) {
    return 3758097101;
  }
  else {
    return IOACIPCClass::io();
  }
}

uint64_t acipcKernel::readAsync(acipcKernel *this, void *a2, unsigned int a3, void (*a4)(void *, int, void *), void *a5)
{
  if (*((_DWORD *)this + 54) == -1) {
    return 3758097101;
  }
  else {
    return MEMORY[0x270F92328]((char *)this + 8);
  }
}

uint64_t acipcKernel::readRegister(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = acipcKernel::pciTransportRegisterToACIPC(a2);
  if (!(_BYTE)v7) {
    return 3758097090;
  }

  return MEMORY[0x270F922A8](a1 + 8, HIDWORD(v7), a3, a4);
}

uint64_t acipcKernel::abortChannelAsync(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(NSObject **)(a1 + 208);
  if (!v5
    && !(*(void *)(a1 + 200)
       ? ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get
       : 0))
  {
    return 3758097101;
  }
  uint64_t v7 = 220;
  if (a2 == 1) {
    uint64_t v7 = 216;
  }
  if (*(_DWORD *)(a1 + v7) == -1)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 0x40000000;
    v12[2] = ___ZN11acipcKernel17abortChannelAsyncE21PCITransportDirectionPFvPviES1__block_invoke;
    v12[3] = &__block_descriptor_tmp_88;
    v12[4] = a3;
    v12[5] = a4;
    if (v5)
    {
      if (*(void *)(a1 + 200)) {
        CFTypeID v8 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
      }
      else {
        CFTypeID v8 = 0;
      }
      if (v8) {
        acipcKernel::abortChannelAsync();
      }
      dispatch_async(v5, v12);
    }
    int v9 = *(__CFRunLoop **)(a1 + 200);
    if (v9) {
      CFTypeRef v10 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
    }
    else {
      CFTypeRef v10 = 0;
    }
    if (v10)
    {
      if (*(void *)(a1 + 208)) {
        acipcKernel::abortChannelAsync();
      }
      CFRunLoopPerformBlock(v9, (CFTypeRef)*MEMORY[0x263EFFE88], v12);
      CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 200));
    }
    return 0;
  }
  else
  {
    return MEMORY[0x270F922D0](a1 + 8);
  }
}

uint64_t ___ZN11acipcKernel17abortChannelAsyncE21PCITransportDirectionPFvPviES1__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), 0);
}

uint64_t ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t acipcKernel::startChannelAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(NSObject **)(a1 + 208);
  if (!v5
    && !(*(void *)(a1 + 200)
       ? ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get
       : 0))
  {
    return 3758097101;
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 0x40000000;
  uint64_t v11[2] = ___ZN11acipcKernel17startChannelAsyncE21PCITransportDirectionPFvPviES1__block_invoke;
  v11[3] = &__block_descriptor_tmp_91;
  v11[4] = a3;
  v11[5] = a4;
  if (v5)
  {
    if (*(void *)(a1 + 200)) {
      uint64_t v7 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
    }
    else {
      uint64_t v7 = 0;
    }
    if (v7) {
      acipcKernel::startChannelAsync();
    }
    dispatch_async(v5, v11);
  }
  CFTypeID v8 = *(__CFRunLoop **)(a1 + 200);
  if (v8) {
    int v9 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
  }
  else {
    int v9 = 0;
  }
  if (v9)
  {
    if (*(void *)(a1 + 208)) {
      acipcKernel::startChannelAsync();
    }
    CFRunLoopPerformBlock(v8, (CFTypeRef)*MEMORY[0x263EFFE88], v11);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 200));
  }
  return 0;
}

uint64_t ___ZN11acipcKernel17startChannelAsyncE21PCITransportDirectionPFvPviES1__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), 0);
}

uint64_t acipcKernel::timesyncAsync(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __int16 v13 = acipcKernel::PCITransportTimeDomainToACIPC(a2);
  if (!(_BYTE)v13) {
    return 3758097090;
  }

  return MEMORY[0x270F92440](a1 + 8, HIBYTE(v13), a3, a4, a5, a6, a7);
}

uint64_t acipcKernel::registerTimeEvent(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  __int16 v7 = acipcKernel::PCITransportTimeDomainToACIPC(a2);
  if (!(_BYTE)v7) {
    return 3758097090;
  }

  return MEMORY[0x270F92448](a1 + 8, HIBYTE(v7), a3, a4);
}

uint64_t acipcKernel::deregisterTimeEvent(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  __int16 v7 = acipcKernel::PCITransportTimeDomainToACIPC(a2);
  if (!(_BYTE)v7) {
    return 3758097090;
  }

  return MEMORY[0x270F92450](a1 + 8, HIBYTE(v7), a3, a4);
}

__n128 acipcKernel::marshalTimesyncMeasurement@<Q0>(char *a1@<X1>, uint64_t a2@<X8>)
{
  *(void *)a2 = *(void *)a1;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

uint64_t acipcKernel::mapRegionAsync(uint64_t a1, int a2, const void *a3, uint64_t a4, const void *a5, unsigned int a6, void (*a7)(void *, int), void *a8)
{
  unsigned int v15 = acipcKernel::pciTransportMemRegionToACIPC(a2);
  if ((_BYTE)v15) {
    return IOACIPCClass::mapMemoryAsync((IOACIPCClass *)(a1 + 8), HIWORD(v15), a3, a4, 0, 0, a5, a6, a7, a8);
  }
  else {
    return 3758097090;
  }
}

uint64_t acipcKernel::unmapRegionAsync(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  unsigned int v7 = acipcKernel::pciTransportMemRegionToACIPC(a2);
  if (!(_BYTE)v7) {
    return 3758097090;
  }

  return MEMORY[0x270F922C0](a1 + 8, HIWORD(v7), a3, a4);
}

void *acipcKernelControl::wrapControlEventBlock@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  if (a1)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN18acipcKernelControl21wrapControlEventBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEPvS7_E_block_invoke;
    aBlock[3] = &unk_26432D680;
    aBlock[4] = a1;
    __n128 result = _Block_copy(aBlock);
  }
  else
  {
    __n128 result = 0;
  }
  *a2 = result;
  return result;
}

uint64_t ___ZN18acipcKernelControl21wrapControlEventBlockEU13block_pointerFvNSt3__14pairIN3pci9transport6kernel7variantEjEEPvS7_E_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

const void **acipcKernelControl::getMatchingDictionary@<X0>(void *a1@<X8>)
{
  CFMutableDictionaryRef v3 = IOServiceMatching("IOAppleConvergedIPCControl");
  CFMutableDictionaryRef v6 = v3;
  if (v3) {
    BOOL v4 = ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::get;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4)
  {
    CFDictionarySetValue(v3, @"ACIPCControlVariant", @"cellular");
    ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(a1, (CFTypeRef *)&v6);
  }
  else
  {
    *a1 = 0;
  }
  return ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)&v6);
}

void sub_218628C90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t acipcKernelControl::start(acipcKernelControl *this)
{
  acipcKernelControl::getMatchingDictionary(&v5);
  if (v5) {
    uint64_t v2 = ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::get;
  }
  else {
    uint64_t v2 = 0;
  }
  if (v2) {
    uint64_t v3 = IOACIPCControlClass::start((acipcKernelControl *)((char *)this + 8), v5);
  }
  else {
    uint64_t v3 = 0;
  }
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)&v5);
  return v3;
}

void sub_218628D14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef((const void **)va);
  _Unwind_Resume(a1);
}

uint64_t acipcKernelControl::registerEventNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  acipcKernelControl::wrapControlEventBlock(a3, &v6);
  uint64_t v3 = v6;
  uint64_t v4 = IOACIPCControlClass::registerEventNotification();
  if (v3) {
    _Block_release(v3);
  }
  return v4;
}

{
  const void *v3;
  uint64_t v4;
  const void *v6;

  acipcKernelControl::wrapControlEventBlock(a3, &v6);
  uint64_t v3 = v6;
  uint64_t v4 = IOACIPCControlClass::registerEventNotification();
  if (v3) {
    _Block_release(v3);
  }
  return v4;
}

void sub_218628D94(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_218628E1C(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void pci::transport::kernel::create(void *a1@<X8>)
{
  if (pci::transport::kernel::probeVariant(void)::sOnce != -1) {
    dispatch_once(&pci::transport::kernel::probeVariant(void)::sOnce, &__block_literal_global_1);
  }
  if (pci::transport::kernel::probeVariant(void)::ret)
  {
    if (pci::transport::kernel::probeVariant(void)::ret == 2) {
      operator new();
    }
    operator new();
  }
  *a1 = 0;
}

void sub_218628F98(_Unwind_Exception *a1)
{
  MEMORY[0x21D46F100](v1, 0x10F1C40BDC3455ELL);
  _Unwind_Resume(a1);
}

void pci::transport::kernelControl::create(void *a1@<X8>)
{
  if (pci::transport::kernel::probeVariant(void)::sOnce != -1) {
    dispatch_once(&pci::transport::kernel::probeVariant(void)::sOnce, &__block_literal_global_1);
  }
  if (pci::transport::kernel::probeVariant(void)::ret == 2) {
    operator new();
  }
  if (pci::transport::kernel::probeVariant(void)::ret == 1) {
    operator new();
  }
  *a1 = 0;
}

void sub_218629104(_Unwind_Exception *a1)
{
  MEMORY[0x21D46F100](v1, 0x10A1C40FA50A9EBLL);
  _Unwind_Resume(a1);
}

void pci::transport::kernelTrace::create(void *a1@<X8>)
{
  if (pci::transport::kernel::probeVariant(void)::sOnce != -1) {
    dispatch_once(&pci::transport::kernel::probeVariant(void)::sOnce, &__block_literal_global_1);
  }
  if (pci::transport::kernel::probeVariant(void)::ret == 2) {
    operator new();
  }
  if (pci::transport::kernel::probeVariant(void)::ret == 1) {
    operator new();
  }
  *a1 = 0;
}

void sub_21862924C(_Unwind_Exception *a1)
{
  MEMORY[0x21D46F100](v1, 0x10E1C40FAAEA384);
  _Unwind_Resume(a1);
}

void abpKernel::~abpKernel(abpKernel *this)
{
  *(void *)this = &unk_26C9BA680;
  MEMORY[0x21D46EA30]((char *)this + 8);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C9BA680;
  MEMORY[0x21D46EA30]((char *)this + 8);

  JUMPOUT(0x21D46F100);
}

uint64_t abpKernel::getVariant(abpKernel *this)
{
  return 1;
}

uint64_t abpKernel::stop(abpKernel *this, dispatch_group_s *a2)
{
  return MEMORY[0x270F92160]((char *)this + 8, a2);
}

uint64_t abpKernel::open(abpKernel *this)
{
  return MEMORY[0x270F92150]((char *)this + 8);
}

uint64_t abpKernel::close(abpKernel *this)
{
  return MEMORY[0x270F92168]((char *)this + 8);
}

uint64_t abpKernel::write(abpKernel *this, const void *a2)
{
  return MEMORY[0x270F92180]((char *)this + 8, a2);
}

uint64_t abpKernel::read(abpKernel *this, void *a2, unsigned int *a3)
{
  return MEMORY[0x270F92158]((char *)this + 8, a2, a3);
}

uint64_t abpKernel::sendImage(abpKernel *this, const void *a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x270F92190]((char *)this + 8, a2, a3, a4);
}

uint64_t abpKernel::sendImageAsync(abpKernel *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  return MEMORY[0x270F92120]((char *)this + 8, a2, a3, a4, a5);
}

uint64_t abpKernel::getTimesyncMeasurementSize(abpKernel *this)
{
  return 32;
}

void abpKernelControl::~abpKernelControl(abpKernelControl *this)
{
  *(void *)this = &unk_26C9BA778;
  MEMORY[0x21D46ED30]((char *)this + 8);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C9BA778;
  MEMORY[0x21D46ED30]((char *)this + 8);

  JUMPOUT(0x21D46F100);
}

uint64_t abpKernelControl::getVariant(abpKernelControl *this)
{
  return 1;
}

uint64_t abpKernelControl::start(abpKernelControl *this)
{
  return MEMORY[0x270F92278]((char *)this + 8);
}

uint64_t abpKernelControl::stop(abpKernelControl *this)
{
  return MEMORY[0x270F92268]((char *)this + 8);
}

uint64_t abpKernelControl::open(abpKernelControl *this, __CFRunLoop *a2)
{
  return MEMORY[0x270F92258]((char *)this + 8, a2);
}

uint64_t abpKernelControl::open(abpKernelControl *this, dispatch_queue_s *a2)
{
  return MEMORY[0x270F92260]((char *)this + 8, a2);
}

uint64_t abpKernelControl::close(abpKernelControl *this)
{
  return MEMORY[0x270F92270]((char *)this + 8);
}

uint64_t abpKernelControl::readLogsAsync(abpKernelControl *this, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void *, int, void *), void *a6)
{
  return MEMORY[0x270F92228]((char *)this + 8, a2, a3, a4, a5, a6);
}

uint64_t abpKernelControl::deregisterEventNotification(abpKernelControl *this, dispatch_group_s *a2)
{
  return MEMORY[0x270F92250]((char *)this + 8, a2);
}

uint64_t abpKernelControl::getLogInternalBufferSize(abpKernelControl *this, unsigned int *a2)
{
  return MEMORY[0x270F92238]((char *)this + 8, a2);
}

uint64_t abpKernelControl::loggerTune(abpKernelControl *this, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  return MEMORY[0x270F92220]((char *)this + 8, a2, a3, a4, a5);
}

uint64_t abpKernelControl::getLastKnownBootStage(abpKernelControl *this, unsigned int *a2)
{
  return MEMORY[0x270F92230]((char *)this + 8, a2);
}

void acipcKernel::~acipcKernel(acipcKernel *this)
{
  acipcKernel::~acipcKernel(this);

  JUMPOUT(0x21D46F100);
}

{
  NSObject *v2;

  *(void *)this = &unk_26C9BA5B0;
  uint64_t v2 = *((void *)this + 26);
  if (v2) {
    dispatch_release(v2);
  }
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef((const void **)this + 25);
  MEMORY[0x21D46EB60]((char *)this + 8);
}

uint64_t acipcKernel::getVariant(acipcKernel *this)
{
  return 2;
}

uint64_t acipcKernel::stop(acipcKernel *this, dispatch_group_s *a2)
{
  return MEMORY[0x270F922F8]((char *)this + 8, a2);
}

uint64_t acipcKernel::sendImage(acipcKernel *this, const void *a2, uint64_t a3, unsigned int *a4)
{
  return MEMORY[0x270F92330]((char *)this + 8, a2, a3, a4, 0);
}

uint64_t acipcKernel::sendImageAsync(acipcKernel *this, const void *a2, uint64_t a3, void (*a4)(void *, int, void *, void *), void *a5)
{
  return MEMORY[0x270F922B8]((char *)this + 8, a2, a3, a4, a5, 0);
}

uint64_t acipcKernel::getTimesyncMeasurementSize(acipcKernel *this)
{
  return 24;
}

void acipcKernelControl::~acipcKernelControl(acipcKernelControl *this)
{
  *(void *)this = &unk_26C9BA840;
  MEMORY[0x21D46EF00]((char *)this + 8);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C9BA840;
  MEMORY[0x21D46EF00]((char *)this + 8);

  JUMPOUT(0x21D46F100);
}

uint64_t acipcKernelControl::getVariant(acipcKernelControl *this)
{
  return 2;
}

uint64_t acipcKernelControl::stop(acipcKernelControl *this)
{
  return MEMORY[0x270F92410]((char *)this + 8);
}

uint64_t acipcKernelControl::open(acipcKernelControl *this, __CFRunLoop *a2)
{
  return MEMORY[0x270F92400]((char *)this + 8, a2);
}

uint64_t acipcKernelControl::open(acipcKernelControl *this, dispatch_queue_s *a2)
{
  return MEMORY[0x270F92408]((char *)this + 8, a2);
}

uint64_t acipcKernelControl::close(acipcKernelControl *this)
{
  return MEMORY[0x270F92418]((char *)this + 8);
}

uint64_t acipcKernelControl::readLogsAsync(acipcKernelControl *this, void *a2, uint64_t a3, uint64_t a4, void (*a5)(void *, int, void *), void *a6)
{
  return MEMORY[0x270F923C8]((char *)this + 8, a2, a3, a4, a5, a6);
}

uint64_t acipcKernelControl::deregisterEventNotification(acipcKernelControl *this, dispatch_group_s *a2)
{
  return MEMORY[0x270F923F0]((char *)this + 8, a2);
}

uint64_t acipcKernelControl::getLogInternalBufferSize(acipcKernelControl *this, unsigned int *a2)
{
  return MEMORY[0x270F923D8]((char *)this + 8, a2);
}

uint64_t acipcKernelControl::loggerTune(acipcKernelControl *this, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  return MEMORY[0x270F923C0]((char *)this + 8, a2, a3, a4, a5);
}

uint64_t acipcKernelControl::getLastKnownBootStage(acipcKernelControl *this, unsigned int *a2)
{
  return MEMORY[0x270F923D0]((char *)this + 8, a2);
}

const void **ctu::SharedRef<__CFDictionary,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFArray const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFArray const>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

const void **ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef(const void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

uint64_t std::map<char const*,pci::transport::kernel::variant>::map[abi:ne180100](uint64_t a1, unint64_t *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (void *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::__emplace_hint_unique_key_args<char const*,std::pair<char const* const,pci::transport::kernel::variant> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 2;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_21862975C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::__emplace_hint_unique_key_args<char const*,std::pair<char const* const,pci::transport::kernel::variant> const&>(uint64_t **a1, void *a2, unint64_t *a3, _OWORD *a4)
{
  uint64_t v6 = (void **)std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::__find_equal<char const*>(a1, a2, &v11, &v10, a3);
  unsigned int v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    CFTypeID v8 = (uint64_t **)v6;
    unsigned int v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

void *std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::__find_equal<char const*>(void *a1, void *a2, void *a3, void *a4, unint64_t *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, unint64_t v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      int v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        int v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      __int16 v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        __int16 v13 = v10;
      }
      while (v14);
    }
    unint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    CFNumberRef v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v17 = v16;
          unint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          CFNumberRef v16 = (void *)*v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        CFNumberRef v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      int v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    CFNumberRef v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      CFNumberRef v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    int v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      int v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    uint64_t v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = v20;
          unint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = (void *)*v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t std::map<PCITransportInterface,char const*>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,char const*> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 4;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_218629A94(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,char const*> const&>(uint64_t **a1, uint64_t *a2, int *a3, _OWORD *a4)
{
  uint64_t v6 = std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__find_equal<PCITransportInterface>(a1, a2, &v11, &v10, a3);
  unint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    unint64_t v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__find_equal<PCITransportInterface>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, int v7 = *((_DWORD *)a2 + 8), *a5 < v7))
  {
    uint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      int v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        int v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      __int16 v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        __int16 v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 8) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 32);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      int v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    CFNumberRef v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      CFNumberRef v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    int v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      int v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 8))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 32);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t std::map<PCITransportRegister,unsigned int>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>((uint64_t **)a1, v4, a2, (uint64_t *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_218629D44(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t *a4)
{
  uint64_t v6 = std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__find_equal<PCITransportRegister>(a1, a2, &v11, &v10, a3);
  int v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    int v7 = (uint64_t *)operator new(0x28uLL);
    *(uint64_t *)((char *)v7 + 28) = *a4;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v11, v8, v7);
  }
  return v7;
}

uint64_t *std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__find_equal<PCITransportRegister>(void *a1, uint64_t *a2, uint64_t **a3, uint64_t *a4, int *a5)
{
  uint64_t v5 = a1 + 1;
  if (a1 + 1 == a2 || (v6 = *a5, int v7 = *((_DWORD *)a2 + 7), *a5 < v7))
  {
    uint64_t v8 = (uint64_t *)*a2;
    if ((uint64_t *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      int v9 = (uint64_t *)*a2;
      do
      {
        uint64_t v10 = v9;
        int v9 = (uint64_t *)v9[1];
      }
      while (v9);
    }
    else
    {
      __int16 v13 = a2;
      do
      {
        uint64_t v10 = (uint64_t *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        __int16 v13 = v10;
      }
      while (v14);
    }
    int v15 = *a5;
    if (*((_DWORD *)v10 + 7) < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int v17 = (uint64_t *)v16;
          int v18 = *(_DWORD *)(v16 + 28);
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = *v17;
          uint64_t v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        uint64_t v5 = v17 + 1;
        uint64_t v16 = v17[1];
      }
      while (v16);
    }
    else
    {
      int v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = (uint64_t)a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    CFNumberRef v12 = (uint64_t *)a2[1];
    do
    {
      a4 = v12;
      CFNumberRef v12 = (uint64_t *)*v12;
    }
    while (v12);
  }
  else
  {
    int v19 = a2;
    do
    {
      a4 = (uint64_t *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      int v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= *((_DWORD *)a4 + 7))
  {
    uint64_t v20 = *v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v21 = (uint64_t *)v20;
          int v22 = *(_DWORD *)(v20 + 28);
          if (v6 >= v22) {
            break;
          }
          uint64_t v20 = *v21;
          uint64_t v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        uint64_t v5 = v21 + 1;
        uint64_t v20 = v21[1];
      }
      while (v20);
    }
    else
    {
      uint64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

uint64_t std::map<PCITransportTimeDomain,unsigned char>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>((uint64_t **)a1, v4, a2, (uint64_t *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_218629FF4(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::map<PCITransportInterface,__CFString const*>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 16 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__emplace_hint_unique_key_args<PCITransportInterface,std::pair<PCITransportInterface const,char const*> const&>((uint64_t **)a1, v4, a2, a2);
      a2 += 4;
      v6 -= 16;
    }
    while (v6);
  }
  return a1;
}

void sub_21862A074(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t std::map<PCITransportMemRegion,unsigned short>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>((uint64_t **)a1, v4, a2, (uint64_t *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_21862A0F4(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

void *ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

void *ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<__CFDictionary,void>(void *a1, CFTypeRef *a2)
{
  CFTypeRef v3 = *a2;
  if (*a2)
  {
    CFTypeID v4 = CFGetTypeID(*a2);
    if (v4 == CFDictionaryGetTypeID()) {
      uint64_t v5 = v3;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return ctu::SharedRef<__CFDictionary const,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFDictionary const>::SharedRef(a1, v5);
}

void abpKernelTrace::~abpKernelTrace(abpKernelTrace *this)
{
  *(void *)this = &unk_26C9BA8E0;
  MEMORY[0x21D46EC50]((char *)this + 8);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C9BA8E0;
  MEMORY[0x21D46EC50]((char *)this + 8);

  JUMPOUT(0x21D46F100);
}

uint64_t abpKernelTrace::start(abpKernelTrace *this, __CFRunLoop *a2)
{
  return MEMORY[0x270F921F0]((char *)this + 8, a2);
}

uint64_t abpKernelTrace::start(abpKernelTrace *this, dispatch_queue_s *a2)
{
  return MEMORY[0x270F921F8]((char *)this + 8, a2);
}

uint64_t abpKernelTrace::stop(abpKernelTrace *this)
{
  return MEMORY[0x270F921E8]((char *)this + 8);
}

uint64_t abpKernelTrace::getPipeCount(abpKernelTrace *this)
{
  return MEMORY[0x270F921B0]((char *)this + 8);
}

uint64_t abpKernelTrace::getPipeCodeAndName(abpKernelTrace *this, uint64_t a2, unsigned int *a3, char *a4)
{
  return MEMORY[0x270F921D8]((char *)this + 8, a2, a3, a4);
}

uint64_t abpKernelTrace::openPipe(abpKernelTrace *this)
{
  return MEMORY[0x270F92200]((char *)this + 8);
}

uint64_t abpKernelTrace::closePipe(abpKernelTrace *this)
{
  return MEMORY[0x270F92208]((char *)this + 8);
}

uint64_t abpKernelTrace::readAsync(abpKernelTrace *this, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  return MEMORY[0x270F921C0]((char *)this + 8, a2, a3, a4, a5, a6, a7);
}

uint64_t abpKernelTrace::flushBuffers(abpKernelTrace *this, uint64_t a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x270F921D0]((char *)this + 8, a2, a3, a4, a5);
}

uint64_t abpKernelTrace::dumpRegistry(abpKernelTrace *this)
{
  return MEMORY[0x270F921A8]((char *)this + 8);
}

uint64_t abpKernelTrace::getTraceCodeCount(abpKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOABPTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getTraceCodeSize(abpKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOABPTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getMinBufferSize(abpKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOABPTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getMaxBufferSize(abpKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOABPTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getSnapshotBufferSize(abpKernelTrace *this, unsigned int *a2)
{
  return MEMORY[0x270F921E0]((char *)this + 8, a2);
}

uint64_t abpKernelTrace::getMaxBuffersInFlight(abpKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOABPTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t abpKernelTrace::getTraceCode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v18 = 0;
  int v19 = 0;
  uint64_t v20 = 0;
  memset(__str, 0, sizeof(__str));
  long long v16 = 0u;
  uint64_t TraceCode = IOABPTraceClass::getTraceCode();
  if (TraceCode)
  {
    *(_DWORD *)(a3 + 48) = v17;
    std::string::operator=((std::string *)a3, (const std::string *)__str);
    std::string::operator=((std::string *)(a3 + 24), (const std::string *)&__str[24]);
    uint64_t v5 = v18;
    for (CFIndex i = v19; v5 != i; v5 += 2)
    {
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)v5, *((void *)v5 + 1));
      }
      else
      {
        long long v7 = *v5;
        v13.__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
        *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v7;
      }
      int v14 = *((_DWORD *)v5 + 6);
      memset(&__p, 0, sizeof(__p));
      std::string::operator=(&__p, &v13);
      int v12 = v14;
      unint64_t v8 = *(void *)(a3 + 64);
      if (v8 >= *(void *)(a3 + 72))
      {
        uint64_t v9 = std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__push_back_slow_path<pci::transport::kernelTrace::traceCodeAttachment const&>((uint64_t *)(a3 + 56), (long long *)&__p);
      }
      else
      {
        std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__construct_one_at_end[abi:ne180100]<pci::transport::kernelTrace::traceCodeAttachment const&>(a3 + 56, (long long *)&__p);
        uint64_t v9 = v8 + 32;
      }
      *(void *)(a3 + 6os_unfair_lock_unlock(this + 4) = v9;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v13.__r_.__value_.__l.__data_);
      }
    }
  }
  v13.__r_.__value_.__r.__words[0] = (std::string::size_type)&v18;
  std::vector<IOABPTraceCodeAttachment const>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (SHIBYTE(v16) < 0) {
    operator delete(*(void **)&__str[24]);
  }
  if ((__str[23] & 0x80000000) != 0) {
    operator delete(*(void **)__str);
  }
  return TraceCode;
}

void sub_21862A5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23)
{
}

void IOABPTraceCodeDict::~IOABPTraceCodeDict(void **this)
{
  uint64_t v2 = this + 7;
  std::vector<IOABPTraceCodeAttachment const>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 47) < 0) {
    operator delete(this[3]);
  }
  if (*((char *)this + 23) < 0) {
    operator delete(*this);
  }
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26432D2E8, MEMORY[0x263F8C060]);
}

void sub_21862A6C4(_Unwind_Exception *a1)
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

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  uint64_t v5 = this;
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
    uint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }

  memmove(v5, __s, __sz + 1);
}

void std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__construct_one_at_end[abi:ne180100]<pci::transport::kernelTrace::traceCodeAttachment const&>(uint64_t a1, long long *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v5 = *a2;
    *(void *)(v4 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v4 = v5;
  }
  *(_DWORD *)(v4 + 2os_unfair_lock_unlock(this + 4) = *((_DWORD *)a2 + 6);
  *(void *)(a1 + 8) = v4 + 32;
}

void sub_21862A814(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__push_back_slow_path<pci::transport::kernelTrace::traceCodeAttachment const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 5;
  unint64_t v5 = v4 + 1;
  if ((unint64_t)(v4 + 1) >> 59) {
    std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 4 > v5) {
    unint64_t v5 = v8 >> 4;
  }
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFE0) {
    unint64_t v9 = 0x7FFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v9 = v5;
  }
  int v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = std::__allocate_at_least[abi:ne180100]<std::allocator<pci::transport::kernelTrace::traceCodeAttachment>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (std::string *)&v10[8 * v4];
  v15[0] = v10;
  v15[1] = v11;
  long long v16 = v11;
  int v17 = (char *)&v10[8 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    uint64_t v11 = v16;
  }
  else
  {
    long long v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v10[8 * v4 + 6] = *((_DWORD *)a2 + 6);
  long long v16 = (std::string *)((char *)v11 + 32);
  std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__swap_out_circular_buffer(a1, v15);
  uint64_t v13 = a1[1];
  std::__split_buffer<pci::transport::kernelTrace::traceCodeAttachment>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_21862A918(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<pci::transport::kernelTrace::traceCodeAttachment>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<pci::transport::kernelTrace::traceCodeAttachment>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
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

void std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__throw_length_error[abi:ne180100]()
{
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<pci::transport::kernelTrace::traceCodeAttachment>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<pci::transport::kernelTrace::traceCodeAttachment>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
      *(void *)(a3 - 2os_unfair_lock_unlock(this + 4) = 0;
      *(void *)(a3 - 16) = 0;
      *(void *)(a3 - 32) = 0;
      *(_DWORD *)(v8 - 8) = *(_DWORD *)(a3 - 8);
      v8 -= 32;
      v7 -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    *((void *)&v15 + 1) = v8;
    uint64_t v10 = v15;
  }
  char v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<pci::transport::kernelTrace::traceCodeAttachment>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<pci::transport::kernelTrace::traceCodeAttachment>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<pci::transport::kernelTrace::traceCodeAttachment>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<pci::transport::kernelTrace::traceCodeAttachment>,std::reverse_iterator<pci::transport::kernelTrace::traceCodeAttachment*>>::operator()[abi:ne180100](uint64_t a1)
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

uint64_t std::__split_buffer<pci::transport::kernelTrace::traceCodeAttachment>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<pci::transport::kernelTrace::traceCodeAttachment>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
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

void std::vector<IOABPTraceCodeAttachment const>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<IOABPTraceCodeAttachment const>::__clear[abi:ne180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<IOABPTraceCodeAttachment const>::__clear[abi:ne180100](uint64_t *a1)
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

void acipcKernelTrace::~acipcKernelTrace(acipcKernelTrace *this)
{
  *(void *)this = &unk_26C9BA9B0;
  MEMORY[0x21D46EE20]((char *)this + 8);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C9BA9B0;
  MEMORY[0x21D46EE20]((char *)this + 8);

  JUMPOUT(0x21D46F100);
}

uint64_t acipcKernelTrace::start(acipcKernelTrace *this, __CFRunLoop *a2)
{
  return MEMORY[0x270F92390]((char *)this + 8, a2);
}

uint64_t acipcKernelTrace::start(acipcKernelTrace *this, dispatch_queue_s *a2)
{
  return MEMORY[0x270F92398]((char *)this + 8, a2);
}

uint64_t acipcKernelTrace::stop(acipcKernelTrace *this)
{
  return MEMORY[0x270F92388]((char *)this + 8);
}

uint64_t acipcKernelTrace::getPipeCount(acipcKernelTrace *this)
{
  return MEMORY[0x270F92350]((char *)this + 8);
}

uint64_t acipcKernelTrace::getPipeCodeAndName(acipcKernelTrace *this, uint64_t a2, unsigned int *a3, char *a4)
{
  return MEMORY[0x270F92378]((char *)this + 8, a2, a3, a4);
}

uint64_t acipcKernelTrace::openPipe(acipcKernelTrace *this)
{
  return MEMORY[0x270F923A0]((char *)this + 8);
}

uint64_t acipcKernelTrace::closePipe(acipcKernelTrace *this)
{
  return MEMORY[0x270F923A8]((char *)this + 8);
}

uint64_t acipcKernelTrace::readAsync(acipcKernelTrace *this, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void (*a6)(void *, int, void *), void *a7)
{
  return MEMORY[0x270F92360]((char *)this + 8, a2, a3, a4, a5, a6, a7);
}

uint64_t acipcKernelTrace::flushBuffers(acipcKernelTrace *this, uint64_t a2, uint64_t a3, void (*a4)(void *, int, void *), void *a5)
{
  return MEMORY[0x270F92370]((char *)this + 8, a2, a3, a4, a5);
}

uint64_t acipcKernelTrace::dumpRegistry(acipcKernelTrace *this)
{
  return MEMORY[0x270F92348]((char *)this + 8);
}

uint64_t acipcKernelTrace::getTraceCodeCount(acipcKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOACIPCTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getTraceCodeSize(acipcKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOACIPCTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getMinBufferSize(acipcKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOACIPCTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getMaxBufferSize(acipcKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOACIPCTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getSnapshotBufferSize(acipcKernelTrace *this, unsigned int *a2)
{
  return MEMORY[0x270F92380]((char *)this + 8, a2);
}

uint64_t acipcKernelTrace::getMaxBuffersInFlight(acipcKernelTrace *this, unsigned int *a2)
{
  if (!a2) {
    return 0;
  }
  uint64_t result = IOACIPCTraceClass::getRegistryInfo();
  if (result)
  {
    *a2 = v4;
    return 1;
  }
  return result;
}

uint64_t acipcKernelTrace::getTraceCode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v18 = 0;
  int v19 = 0;
  uint64_t v20 = 0;
  memset(__str, 0, sizeof(__str));
  long long v16 = 0u;
  uint64_t TraceCode = IOACIPCTraceClass::getTraceCode();
  if (TraceCode)
  {
    *(_DWORD *)(a3 + 48) = v17;
    std::string::operator=((std::string *)a3, (const std::string *)__str);
    std::string::operator=((std::string *)(a3 + 24), (const std::string *)&__str[24]);
    uint64_t v5 = v18;
    for (uint64_t i = v19; v5 != i; v5 += 2)
    {
      if (*((char *)v5 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v13, *(const std::string::value_type **)v5, *((void *)v5 + 1));
      }
      else
      {
        long long v7 = *v5;
        v13.__r_.__value_.__r.__words[2] = *((void *)v5 + 2);
        *(_OWORD *)&v13.__r_.__value_.__l.__data_ = v7;
      }
      int v14 = *((_DWORD *)v5 + 6);
      memset(&__p, 0, sizeof(__p));
      std::string::operator=(&__p, &v13);
      int v12 = v14;
      unint64_t v8 = *(void *)(a3 + 64);
      if (v8 >= *(void *)(a3 + 72))
      {
        uint64_t v9 = std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__push_back_slow_path<pci::transport::kernelTrace::traceCodeAttachment const&>((uint64_t *)(a3 + 56), (long long *)&__p);
      }
      else
      {
        std::vector<pci::transport::kernelTrace::traceCodeAttachment>::__construct_one_at_end[abi:ne180100]<pci::transport::kernelTrace::traceCodeAttachment const&>(a3 + 56, (long long *)&__p);
        uint64_t v9 = v8 + 32;
      }
      *(void *)(a3 + 6os_unfair_lock_unlock(this + 4) = v9;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v13.__r_.__value_.__l.__data_);
      }
    }
  }
  v13.__r_.__value_.__r.__words[0] = (std::string::size_type)&v18;
  std::vector<IOABPTraceCodeAttachment const>::__destroy_vector::operator()[abi:ne180100]((void ***)&v13);
  if (SHIBYTE(v16) < 0) {
    operator delete(*(void **)&__str[24]);
  }
  if ((__str[23] & 0x80000000) != 0) {
    operator delete(*(void **)__str);
  }
  return TraceCode;
}

void sub_21862B078(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,uint64_t a22,void *a23)
{
}

void pci::transport::bh::create()
{
}

void sub_21862B154(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

BOOL pci::transport::bh::init(uint64_t a1, uint64_t a2)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2000000000;
  int v61 = *(_DWORD *)(a2 + 8);
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x2000000000;
  char v57 = 1;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3002000000;
  v51 = __Block_byref_object_copy__13;
  int v52 = __Block_byref_object_dispose__14;
  int v53 = 0;
  unsigned int v4 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bh::init();
  }
  uint64_t v6 = *(void *)(a1 + 112);
  int v7 = *(_DWORD *)(a1 + 28);
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, (void *)a1);
  BOOL v46 = *(uint64_t **)buf;
  v47 = *(std::__shared_weak_count **)&buf[8];
  if (*(void *)&buf[8]) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
  }
  char inserted = pci::system::info::insertBH(v6, v7, &v46, *(_DWORD *)(a2 + 4));
  if (v47) {
    std::__shared_weak_count::__release_weak(v47);
  }
  if (*(void *)&buf[8]) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
  }
  if ((inserted & 1) == 0)
  {
    uint64_t v31 = (pci::log *)_TelephonyUtilDebugPrintError();
    __int16 v32 = pci::log::get(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      int v33 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = "bh";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = a1;
      __int16 v63 = 1024;
      int v64 = v33;
      __int16 v65 = 2080;
      v66 = "init";
      uint64_t v34 = "%s::%p::%d::%s: failed to insert in system";
LABEL_69:
      _os_log_impl(&dword_21861F000, v32, OS_LOG_TYPE_INFO, v34, buf, 0x26u);
    }
LABEL_70:
    BOOL v30 = 0;
    goto LABEL_71;
  }
  *(unsigned char *)(a1 + 32) = 1;
  pci::transport::kernel::create(buf);
  uint64_t v9 = *(void *)buf;
  *(void *)long long buf = 0;
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v9;
  if (v10)
  {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
    uint64_t v11 = *(void *)buf;
    *(void *)long long buf = 0;
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8))(v11);
    }
    uint64_t v9 = *(void *)(a1 + 40);
  }
  if (!v9)
  {
    __int16 v35 = (pci::log *)_TelephonyUtilDebugPrintError();
    __int16 v32 = pci::log::get(v35);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      int v36 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136315906;
      *(void *)&uint8_t buf[4] = "bh";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = a1;
      __int16 v63 = 1024;
      int v64 = v36;
      __int16 v65 = 2080;
      v66 = "init";
      uint64_t v34 = "%s::%p::%d::%s: failed to create kernel instance";
      goto LABEL_69;
    }
    goto LABEL_70;
  }
  do
  {
    std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, (void *)a1);
    uint64_t v13 = *(void *)buf;
    int v12 = *(std::__shared_weak_count **)&buf[8];
    if (*(void *)&buf[8])
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*(void *)&buf[8] + 16), 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v12);
    }
    int v14 = dispatch_semaphore_create(0);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1174405120;
    aBlock[2] = ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke;
    aBlock[3] = &unk_26C9BAA68;
    aBlock[4] = &v54;
    void aBlock[5] = &v58;
    aBlock[6] = a1;
    dispatch_object_t object = v14;
    if (v14) {
      dispatch_retain(v14);
    }
    long long v15 = _Block_copy(aBlock);
    long long v16 = (const void *)v49[5];
    v49[5] = (uint64_t)v15;
    if (v16) {
      _Block_release(v16);
    }
    v42[0] = MEMORY[0x263EF8330];
    v42[1] = 1174405120;
    v42[2] = ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_21;
    v42[3] = &unk_26C9BAAA0;
    v42[5] = a1;
    v42[6] = v13;
    uint64_t v43 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    v42[4] = &v48;
    v40[0] = MEMORY[0x263EF8330];
    v40[1] = 1174405120;
    v40[2] = ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25;
    v40[3] = &__block_descriptor_tmp_29_0;
    v40[4] = a1;
    v40[5] = v13;
    __int16 v41 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 1174405120;
    v38[2] = ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_30;
    v38[3] = &__block_descriptor_tmp_35;
    v38[4] = a1;
    v38[5] = v13;
    uint64_t v39 = v12;
    if (v12) {
      atomic_fetch_add_explicit(&v12->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    }
    if (((*(uint64_t (**)(void, void, void, void *, void *, void *))(**(void **)(a1 + 40) + 32))(*(void *)(a1 + 40), *(unsigned int *)(a1 + 28), *(void *)(a1 + 16), v42, v40, v38) & 1) == 0)
    {
      int v17 = (pci::log *)_TelephonyUtilDebugPrintError();
      int v18 = pci::log::get(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int v19 = *(_DWORD *)(a1 + 28);
        *(_DWORD *)long long buf = 136315906;
        *(void *)&uint8_t buf[4] = "bh";
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = a1;
        __int16 v63 = 1024;
        int v64 = v19;
        __int16 v65 = 2080;
        v66 = "init";
        _os_log_impl(&dword_21861F000, v18, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to start", buf, 0x26u);
      }
      uint64_t v20 = v49[5];
      if (v20)
      {
        (*(void (**)(uint64_t, void, void, void))(v20 + 16))(v20, 0, 0, 0);
        uint64_t v21 = (const void *)v49[5];
        v49[5] = 0;
        if (v21) {
          _Block_release(v21);
        }
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    unsigned int v22 = *(_DWORD *)(a2 + 4);
    if (v22 == -1) {
      dispatch_time_t v23 = -1;
    }
    else {
      dispatch_time_t v23 = dispatch_time(0, 1000000 * v22);
    }
    if (dispatch_semaphore_wait(v14, v23))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
      uint64_t v24 = v49[5];
      if (v24)
      {
        (*(void (**)(uint64_t, void, uint64_t, void))(v24 + 16))(v24, 0, 1, 0);
        uint64_t v25 = (const void *)v49[5];
        v49[5] = 0;
        if (v25) {
          _Block_release(v25);
        }
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (*((unsigned char *)v55 + 24) || (int v27 = *((_DWORD *)v59 + 6)) == 0)
    {
      char v26 = 0;
    }
    else
    {
      *((_DWORD *)v59 + 6) = v27 - 1;
      uint64_t v28 = dispatch_group_create();
      (*(void (**)(void, NSObject *))(**(void **)(a1 + 40) + 40))(*(void *)(a1 + 40), v28);
      dispatch_group_wait(v28, 0xFFFFFFFFFFFFFFFFLL);
      unsigned int v29 = *(_DWORD *)(a2 + 4) / (*(_DWORD *)(a2 + 8) + 1);
      if (v29 >= 0x3E8) {
        unsigned int v29 = 1000;
      }
      usleep(1000 * v29);
      if (v28) {
        dispatch_release(v28);
      }
      char v26 = 1;
    }
    if (v39) {
      std::__shared_weak_count::__release_weak(v39);
    }
    if (v41) {
      std::__shared_weak_count::__release_weak(v41);
    }
    if (v43) {
      std::__shared_weak_count::__release_weak(v43);
    }
    if (object) {
      dispatch_release(object);
    }
    if (v14) {
      dispatch_release(v14);
    }
    if (v12) {
      std::__shared_weak_count::__release_weak(v12);
    }
  }
  while ((v26 & 1) != 0);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (*((unsigned char *)v55 + 24)) {
    *(unsigned char *)(a1 + 33) = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  BOOL v30 = *((unsigned char *)v55 + 24) != 0;
LABEL_71:
  _Block_object_dispose(&v48, 8);
  if (v53) {
    _Block_release(v53);
  }
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);
  return v30;
}

void sub_21862B9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,std::__shared_weak_count *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,std::__shared_weak_count *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,std::__shared_weak_count *a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,dispatch_object_t object,uint64_t a47,std::__shared_weak_count *a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,void *aBlock)
{
  _Block_object_dispose(&a49, 8);
  if (aBlock) {
    _Block_release(aBlock);
  }
  _Block_object_dispose((const void *)(v54 - 224), 8);
  _Block_object_dispose((const void *)(v54 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t pci::transport::bh::bh(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  std::string::basic_string[abi:ne180100]<0>(v11, "com.apple.WirelessIPC.baseband.pci_bh");
  std::string::basic_string[abi:ne180100]<0>(__p, "_");
  unsigned int v4 = (const char *)v13;
  pci::transport::bh::generateString((uint64_t)v11, (uint64_t)__p, v13);
  if (v14 < 0) {
    unsigned int v4 = (const char *)v13[0];
  }
  uint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)*(_DWORD *)(a2 + 24), 0);
  *(void *)(a1 + 16) = dispatch_queue_create_with_target_V2(v4, v5, *(dispatch_queue_t *)(a2 + 16));
  if (v14 < 0) {
    operator delete(v13[0]);
  }
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  *(_DWORD *)(a1 + 28) = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 2os_unfair_lock_unlock(this + 4) = 0;
  *(_WORD *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 6os_unfair_lock_unlock(this + 4) = a1 + 64;
  *(void *)(a1 + 72) = a1 + 64;
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = a1 + 96;
  *(void *)(a1 + 10os_unfair_lock_unlock(this + 4) = 0;
  pci::system::info::get((void *)(a1 + 112));
  uint64_t v6 = (pci::log *)_TelephonyUtilDebugPrint();
  int v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bh::bh();
  }
  return a1;
}

void sub_21862BCA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, void *a20,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  BOOL v30 = *(std::__shared_weak_count **)(v25 + 120);
  if (v30) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v30);
  }
  std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(v27, *(void **)(v25 + 96));
  std::__list_imp<void const*>::clear(v26);
  uint64_t v31 = *(std::__shared_weak_count **)(v25 + 56);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
  uint64_t v32 = *v28;
  uint64_t *v28 = 0;
  if (v32) {
    (*(void (**)(uint64_t))(*(void *)v32 + 8))(v32);
  }
  int v33 = *(NSObject **)(v25 + 16);
  if (v33) {
    dispatch_release(v33);
  }
  uint64_t v34 = *(std::__shared_weak_count **)(v25 + 8);
  if (v34) {
    std::__shared_weak_count::__release_weak(v34);
  }
  _Unwind_Resume(a1);
}

uint64_t pci::transport::bh::generateString@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v14);
  int v6 = *(char *)(a1 + 23);
  if (v6 >= 0) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = *(void *)a1;
  }
  if (v6 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 8);
  }
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v14, v7, v8);
  int v10 = *(char *)(a2 + 23);
  if (v10 >= 0) {
    uint64_t v11 = a2;
  }
  else {
    uint64_t v11 = *(void *)a2;
  }
  if (v10 >= 0) {
    uint64_t v12 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v12 = *(void *)(a2 + 8);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v15, a3);
  uint64_t v14 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v15[-1] + *(void *)(v14 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v15[0] = MEMORY[0x263F8C318] + 16;
  if (v16 < 0) {
    operator delete((void *)v15[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D46F0D0](&v17);
}

void sub_21862BEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void pci::transport::bh::~bh(pci::transport::bh *this)
{
  uint64_t v2 = (pci::log *)_TelephonyUtilDebugPrint();
  uint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bh::~bh();
  }
  if (*((void *)this + 10)) {
    __assert_rtn("~bh", "PCITransportBH.cpp", 58, "fCBL.empty()");
  }
  uint64_t v4 = *((void *)this + 6);
  if (v4)
  {
    uint64_t v22 = 0;
    dispatch_time_t v23 = &v22;
    uint64_t v24 = 0x3802000000;
    uint64_t v25 = __Block_byref_object_copy__0;
    char v26 = __Block_byref_object_dispose__0;
    uint64_t v27 = v4;
    v28[0] = *((void **)this + 7);
    *((void *)this + 6) = 0;
    *((void *)this + 7) = 0;
    uint64_t v5 = *((void *)this + 2);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN3pci9transport2bhD2Ev_block_invoke;
    block[3] = &unk_26432D6A8;
    void block[4] = &v22;
    dispatch_async(v5, block);
    _Block_object_dispose(&v22, 8);
    if (v28[0]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v28[0]);
    }
  }
  uint64_t v6 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
  }
  uint64_t v7 = (void *)*((void *)this + 13);
  if (v7)
  {
    uint64_t v22 = 0;
    dispatch_time_t v23 = &v22;
    uint64_t v24 = 0x4002000000;
    uint64_t v25 = __Block_byref_object_copy__7;
    uint64_t v8 = (void *)*((void *)this + 12);
    uint64_t v9 = *((void *)this + 11);
    char v26 = __Block_byref_object_dispose__8;
    uint64_t v27 = v9;
    v28[0] = v8;
    v28[1] = v7;
    _OWORD v8[2] = v28;
    *((void *)this + 11) = (char *)this + 96;
    *((void *)this + 12) = 0;
    *((void *)this + 13) = 0;
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy((uint64_t)this + 88, 0);
    *((void *)this + 11) = (char *)this + 96;
    *((void *)this + 12) = 0;
    *((void *)this + 13) = 0;
    int v10 = *((void *)this + 2);
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 0x40000000;
    v21[2] = ___ZN3pci9transport2bhD2Ev_block_invoke_9;
    v21[3] = &unk_26432D6D0;
    uint8_t v21[4] = &v22;
    dispatch_async(v10, v21);
    _Block_object_dispose(&v22, 8);
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy((uint64_t)&v27, v28[0]);
  }
  if (*((unsigned char *)this + 32))
  {
    uint64_t v11 = (pci::log *)_TelephonyUtilDebugPrint();
    uint64_t v12 = pci::log::get(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      pci::transport::bh::~bh();
    }
    pci::system::info::removeBH(*((pci::system::info **)this + 14), *((_DWORD *)this + 7));
    *((unsigned char *)this + 32) = 0;
  }
  uint64_t v13 = (std::__shared_weak_count *)*((void *)this + 15);
  *((void *)this + 1os_unfair_lock_unlock(this + 4) = 0;
  *((void *)this + 15) = 0;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  uint64_t v14 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  long long v15 = pci::log::get(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    pci::transport::bh::~bh();
  }
  char v16 = (std::__shared_weak_count *)*((void *)this + 15);
  if (v16) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v16);
  }
  std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy((uint64_t)this + 88, *((void **)this + 12));
  std::__list_imp<void const*>::clear((void *)this + 8);
  uint64_t v17 = (std::__shared_weak_count *)*((void *)this + 7);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  uint64_t v18 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8))(v18);
  }
  int v19 = *((void *)this + 2);
  if (v19) {
    dispatch_release(v19);
  }
  uint64_t v20 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v20) {
    std::__shared_weak_count::__release_weak(v20);
  }
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN3pci9transport2bhD2Ev_block_invoke(uint64_t a1)
{
}

uint64_t *__Block_byref_object_copy__7(uint64_t a1, uint64_t a2)
{
  return std::map<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::map[abi:ne180100]((uint64_t *)(a1 + 40), a2 + 40);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

intptr_t ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 48);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(v8 + 24));
  uint64_t v9 = (pci::log *)_TelephonyUtilDebugPrint();
  int v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(v8 + 28);
    *(_DWORD *)long long buf = 136316674;
    uint64_t v22 = "bh";
    __int16 v23 = 2048;
    uint64_t v24 = v8;
    __int16 v25 = 1024;
    int v26 = v20;
    __int16 v27 = 2080;
    uint64_t v28 = "init_block_invoke";
    __int16 v29 = 1024;
    int v30 = a2;
    __int16 v31 = 1024;
    int v32 = a3;
    __int16 v33 = 1024;
    int v34 = a4;
    _os_log_debug_impl(&dword_21861F000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: in addComp added %u, started %u, service 0x%x", buf, 0x38u);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 2os_unfair_lock_unlock(this + 4) = a2 & a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_12;
  }
  int v11 = (*(uint64_t (**)(void, uint64_t))(**(void **)(v8 + 40) + 48))(*(void *)(v8 + 40), a4);
  if (!v11) {
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  int v12 = v11;
  if (v11 != -536870203)
  {
    char v16 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v17 = pci::log::get(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = *(_DWORD *)(v8 + 28);
      *(_DWORD *)long long buf = 136316162;
      uint64_t v22 = "bh";
      __int16 v23 = 2048;
      uint64_t v24 = v8;
      __int16 v25 = 1024;
      int v26 = v18;
      __int16 v27 = 2080;
      uint64_t v28 = "init_block_invoke";
      __int16 v29 = 1024;
      int v30 = v12;
      _os_log_impl(&dword_21861F000, v17, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to open 0x%x", buf, 0x2Cu);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 2os_unfair_lock_unlock(this + 4) = 0;
LABEL_12:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 2os_unfair_lock_unlock(this + 4) = 0;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  uint64_t v13 = (pci::log *)_TelephonyUtilDebugPrintError();
  uint64_t v14 = pci::log::get(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = *(_DWORD *)(v8 + 28);
    *(_DWORD *)long long buf = 136316162;
    uint64_t v22 = "bh";
    __int16 v23 = 2048;
    uint64_t v24 = v8;
    __int16 v25 = 1024;
    int v26 = v15;
    __int16 v27 = 2080;
    uint64_t v28 = "init_block_invoke";
    __int16 v29 = 1024;
    int v30 = -536870203;
    _os_log_impl(&dword_21861F000, v14, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to open 0x%x", buf, 0x2Cu);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 2os_unfair_lock_unlock(this + 4) = 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void __copy_helper_block_e8_56c25_ZTSN8dispatch9semaphoreE(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 56);
  *(void *)(a1 + 56) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __destroy_helper_block_e8_56c25_ZTSN8dispatch9semaphoreE(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 56);
  if (v1) {
    dispatch_release(v1);
  }
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_21(void *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[7];
  if (v3)
  {
    uint64_t v5 = (os_unfair_lock_s *)a1[5];
    uint64_t v6 = std::__shared_weak_count::lock(v3);
    if (v6)
    {
      uint64_t v7 = v6;
      if (a1[6])
      {
        os_unfair_lock_lock(v5 + 6);
        uint64_t v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
        uint64_t v9 = pci::log::get(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_21_cold_1();
        }
        uint64_t v10 = *(void *)(*(void *)(a1[4] + 8) + 40);
        if (v10)
        {
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 16))(v10, 1, 1, a2);
          uint64_t v11 = *(void *)(a1[4] + 8);
          int v12 = *(const void **)(v11 + 40);
          *(void *)(v11 + 40) = 0;
          if (v12) {
            _Block_release(v12);
          }
        }
        os_unfair_lock_unlock(v5 + 6);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v7);
    }
  }
}

void sub_21862C7EC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_48c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 56);
  *(void *)(result + 48) = *(void *)(a2 + 48);
  *(void *)(result + 56) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_48c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 56);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25(void *a1)
{
  uint64_t v2 = (std::__shared_weak_count *)a1[6];
  if (v2)
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = std::__shared_weak_count::lock(v2);
    if (v4)
    {
      uint64_t v5 = v4;
      if (a1[5])
      {
        uint64_t v6 = (os_unfair_lock_s *)(v3 + 24);
        os_unfair_lock_lock((os_unfair_lock_t)(v3 + 24));
        uint64_t v7 = (pci::log *)_TelephonyUtilDebugPrint();
        uint64_t v8 = pci::log::get(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25_cold_2();
        }
        uint64_t v9 = (void *)(v3 + 48);
        if (*(void *)(v3 + 48))
        {
          if (!*(unsigned char *)(v3 + 33)) {
            __assert_rtn("init_block_invoke", "PCITransportBH.cpp", 227, "fActive");
          }
          uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
          uint64_t v11 = pci::log::get(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
            ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25_cold_1();
          }
          uint64_t v13 = *(pci::transport::task **)(v3 + 48);
          int v12 = *(std::__shared_weak_count **)(v3 + 56);
          void *v9 = 0;
          v9[1] = 0;
          os_unfair_lock_unlock(v6);
          if (v13) {
            pci::transport::task::complete(v13, 0, 0, 0);
          }
          if (v12) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v12);
          }
        }
        else
        {
          os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 24));
        }
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v5);
    }
  }
}

void sub_21862C9C4(_Unwind_Exception *a1)
{
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c42_ZTSNSt3__18weak_ptrIN3pci9transport2bhEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_30(void *a1, unint64_t a2, int a3, int a4)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    uint64_t v9 = (os_unfair_lock_s *)a1[4];
    uint64_t v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      uint64_t v11 = v10;
      if (a1[5])
      {
        os_unfair_lock_lock(v9 + 6);
        pci::transport::kernel::errorAsString(a2);
        pci::transport::kernel::errorAsUnsigned(a2);
        int v12 = (pci::log *)_TelephonyUtilDebugPrintError();
        uint64_t v13 = pci::log::get(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint32_t os_unfair_lock_opaque = v9[7]._os_unfair_lock_opaque;
          *(_DWORD *)long long buf = 136316930;
          char v16 = "bh";
          __int16 v17 = 2048;
          int v18 = v9;
          __int16 v19 = 1024;
          uint32_t v20 = os_unfair_lock_opaque;
          __int16 v21 = 2080;
          uint64_t v22 = "init_block_invoke";
          __int16 v23 = 2080;
          uint64_t v24 = pci::transport::kernel::errorAsString(a2);
          __int16 v25 = 1024;
          int v26 = pci::transport::kernel::errorAsUnsigned(a2);
          __int16 v27 = 1024;
          int v28 = a3;
          __int16 v29 = 1024;
          int v30 = a4;
          _os_log_impl(&dword_21861F000, v13, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: %s (%u): param 0x%x: status 0x%x", buf, 0x42u);
        }
        os_unfair_lock_unlock(v9 + 6);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
}

void sub_21862CBD8(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void pci::transport::bh::setNotify(uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  if (*(void *)(a1 + 48)) {
    pci::transport::bh::setNotify();
  }
  uint64_t v6 = *a2;
  uint64_t v5 = a2[1];
  if (v5) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v5 + 8), 1uLL, memory_order_relaxed);
  }
  uint64_t v7 = *(std::__shared_weak_count **)(a1 + 56);
  *(void *)(a1 + 48) = v6;
  *(void *)(a1 + 56) = v5;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }

  os_unfair_lock_unlock(v4);
}

void pci::transport::bh::invokeCallbackAsync(uint64_t a1, uint64_t a2, int a3, int a4, int a5)
{
  uint64_t v5 = *(NSObject **)(a1 + 16);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
  block[3] = &unk_26432D6F8;
  void block[4] = a2;
  int v7 = a3;
  int v8 = a4;
  int v9 = a5;
  dispatch_async(v5, block);
}

uint64_t ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48));
}

void pci::transport::bh::open(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  v19[0] = *a2;
  v19[1] = (uint64_t)v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pci::transport::bh::generateCallback(a1, v19, (uint64_t)"open pipe", 0, &aBlock);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  unsigned int v6 = *(_DWORD *)(a1 + 28);
  BOOL v7 = v6 > 0x11;
  int v8 = (1 << v6) & 0x20041;
  if (v7 || v8 == 0)
  {
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v10 = aBlock;
    uint64_t v13 = _Block_copy(aBlock);
    unsigned int v14 = (*(uint64_t (**)(uint64_t, uint64_t, void (*)(pci::transport::bh *, void *), void *))(*(void *)v12 + 128))(v12, a3, pci::transport::bh::cmdCompletion, v13);
    if (v14)
    {
      int v15 = (pci::log *)_TelephonyUtilDebugPrintError();
      char v16 = pci::log::get(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = *(_DWORD *)(a1 + 28);
        *(_DWORD *)block = 136316162;
        *(void *)&void block[4] = "bh";
        *(_WORD *)&block[12] = 2048;
        *(void *)&block[14] = a1;
        *(_WORD *)&block[22] = 1024;
        LODWORD(v22) = v17;
        WORD2(v22) = 2080;
        *(void *)((char *)&v22 + 6) = "open";
        HIWORD(v22) = 1024;
        LODWORD(v23) = v14;
        _os_log_impl(&dword_21861F000, v16, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: open pipe failed 0x%x", block, 0x2Cu);
      }
      int v18 = *(NSObject **)(a1 + 16);
      *(void *)block = MEMORY[0x263EF8330];
      *(void *)&block[8] = 0x40000000;
      *(void *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
      *(void *)&long long v22 = &unk_26432D6F8;
      *((void *)&v22 + 1) = v10;
      int v24 = 0;
      uint64_t v23 = v14;
      dispatch_async(v18, block);
      _Block_release(v10);
    }
  }
  else
  {
    uint64_t v10 = aBlock;
    uint64_t v11 = *(NSObject **)(a1 + 16);
    *(void *)block = MEMORY[0x263EF8330];
    *(void *)&block[8] = 0x40000000;
    *(void *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(void *)&long long v22 = &unk_26432D6F8;
    *((void *)&v22 + 1) = aBlock;
    uint64_t v23 = 0;
    int v24 = 0;
    dispatch_async(v11, block);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v10) {
    _Block_release(v10);
  }
}

void sub_21862CFC0(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void pci::transport::bh::cmdCompletion(pci::transport::bh *this, void *a2)
{
  if (!this) {
    pci::transport::bh::cmdCompletion();
  }
  (*((void (**)(pci::transport::bh *, void *, void, void))this + 2))(this, a2, 0, 0);

  _Block_release(this);
}

void pci::transport::bh::close(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  v16[0] = *a2;
  v16[1] = (uint64_t)v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pci::transport::bh::generateCallback(a1, v16, (uint64_t)"close pipe", 0, &aBlock);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  int v6 = *(_DWORD *)(a1 + 28);
  if (v6 != 6 && v6)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v7 = aBlock;
    uint64_t v10 = _Block_copy(aBlock);
    unsigned int v11 = (*(uint64_t (**)(uint64_t, uint64_t, void (*)(pci::transport::bh *, void *), void *))(*(void *)v9 + 120))(v9, a3, pci::transport::bh::cmdCompletion, v10);
    if (v11)
    {
      uint64_t v12 = (pci::log *)_TelephonyUtilDebugPrintError();
      uint64_t v13 = pci::log::get(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v14 = *(_DWORD *)(a1 + 28);
        *(_DWORD *)block = 136316162;
        *(void *)&void block[4] = "bh";
        *(_WORD *)&block[12] = 2048;
        *(void *)&block[14] = a1;
        *(_WORD *)&block[22] = 1024;
        LODWORD(v19) = v14;
        WORD2(v19) = 2080;
        *(void *)((char *)&v19 + 6) = "close";
        HIWORD(v19) = 1024;
        LODWORD(v20) = v11;
        _os_log_impl(&dword_21861F000, v13, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: close pipe failed 0x%x", block, 0x2Cu);
      }
      int v15 = *(NSObject **)(a1 + 16);
      *(void *)block = MEMORY[0x263EF8330];
      *(void *)&block[8] = 0x40000000;
      *(void *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
      *(void *)&long long v19 = &unk_26432D6F8;
      *((void *)&v19 + 1) = v7;
      int v21 = 0;
      uint64_t v20 = v11;
      dispatch_async(v15, block);
      _Block_release(v7);
    }
  }
  else
  {
    BOOL v7 = aBlock;
    int v8 = *(NSObject **)(a1 + 16);
    *(void *)block = MEMORY[0x263EF8330];
    *(void *)&block[8] = 0x40000000;
    *(void *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(void *)&long long v19 = &unk_26432D6F8;
    *((void *)&v19 + 1) = aBlock;
    uint64_t v20 = 0;
    int v21 = 0;
    dispatch_async(v8, block);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v7) {
    _Block_release(v7);
  }
}

void sub_21862D2FC(_Unwind_Exception *exception_object)
{
  if (v1) {
    _Block_release(v1);
  }
  _Unwind_Resume(exception_object);
}

void pci::transport::bh::sendImage(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(std::__shared_weak_count **)(a2 + 8);
  v15[0] = *(void *)a2;
  v15[1] = (uint64_t)v4;
  if (v4) {
    atomic_fetch_add_explicit(&v4->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pci::transport::bh::generateCallback(a1, v15, (uint64_t)"send image", 0, &aBlock);
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v4);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  uint64_t Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  int v8 = aBlock;
  uint64_t v9 = _Block_copy(aBlock);
  int v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, void *))(*(void *)v5 + 104))(v5, Data, Size, pci::transport::bh::imageCompletion, v9);
  if (v10)
  {
    unsigned int v11 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v12 = pci::log::get(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136316162;
      *(void *)&uint8_t buf[4] = "bh";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&unsigned char buf[22] = 1024;
      LODWORD(v18) = v13;
      WORD2(v18) = 2080;
      *(void *)((char *)&v18 + 6) = "sendImage";
      HIWORD(v18) = 1024;
      int v19 = v10;
      _os_log_impl(&dword_21861F000, v12, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: send image failed 0x%x", buf, 0x2Cu);
    }
    int v14 = *(NSObject **)(a1 + 16);
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&uint8_t buf[8] = 0x40000000;
    *(void *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(void *)&long long v18 = &unk_26432D6F8;
    *((void *)&v18 + 1) = v8;
    int v20 = 0;
    int v21 = 0;
    int v19 = v10;
    dispatch_async(v14, buf);
    _Block_release(v8);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v8) {
    _Block_release(v8);
  }
}

void sub_21862D598(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::imageCompletion(void (**this)(pci::transport::bh *, void *, uint64_t, void *, void *), void *a2, uint64_t a3, void *a4, void *a5)
{
  if (!this) {
    pci::transport::bh::imageCompletion();
  }
  this[2]((pci::transport::bh *)this, a2, a3, a4, a5);

  _Block_release(this);
}

void pci::transport::bh::readRegister(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v6 = *(std::__shared_weak_count **)(a2 + 8);
  v16[0] = *(void *)a2;
  v16[1] = (uint64_t)v6;
  if (v6) {
    atomic_fetch_add_explicit(&v6->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pci::transport::bh::generateCallback(a1, v16, (uint64_t)"read register", 0, &v17);
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v6);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  int Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(*(void *)v7 + 112))(v7, a3, Data, &Size);
  int v10 = (pci::log *)_TelephonyUtilDebugPrintError();
  unsigned int v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = *(_DWORD *)(a1 + 28);
    *(_DWORD *)long long buf = 136316162;
    *(void *)&uint8_t buf[4] = "bh";
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = a1;
    *(_WORD *)&unsigned char buf[22] = 1024;
    LODWORD(v19) = v12;
    WORD2(v19) = 2080;
    *(void *)((char *)&v19 + 6) = "readRegister";
    HIWORD(v19) = 1024;
    int v20 = v9;
    _os_log_impl(&dword_21861F000, v11, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: read register 0x%x", buf, 0x2Cu);
  }
  int v13 = v17;
  int v14 = *(NSObject **)(a1 + 16);
  *(void *)long long buf = MEMORY[0x263EF8330];
  *(void *)&uint8_t buf[8] = 0x40000000;
  *(void *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
  *(void *)&long long v19 = &unk_26432D6F8;
  *((void *)&v19 + 1) = v17;
  int v20 = v9;
  int v21 = Size;
  int v22 = 0;
  dispatch_async(v14, buf);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v13) {
    _Block_release(v13);
  }
}

void sub_21862D85C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *aBlock)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t pci::transport::bh::getTimesyncBufferLength(pci::transport::bh *this, int a2)
{
  uint64_t v4 = (os_unfair_lock_s *)((char *)this + 24);
  os_unfair_lock_lock((os_unfair_lock_t)this + 6);
  TimesyncBufferint Size = pci::transport::kernel::getTimesyncBufferSize(*((pci::transport::kernel **)this + 5), a2);
  os_unfair_lock_unlock(v4);
  return TimesyncBufferSize;
}

uint64_t pci::transport::bh::marshalTimesyncResults(pci::transport::bh *this, char *a2, unsigned int a3)
{
  int v6 = (os_unfair_lock_s *)((char *)this + 24);
  os_unfair_lock_lock((os_unfair_lock_t)this + 6);
  uint64_t v7 = pci::transport::kernel::marshalTimesyncResults(*((pci::transport::kernel **)this + 5), a2, a3);
  os_unfair_lock_unlock(v6);
  return v7;
}

void pci::transport::bh::timesync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  int v8 = *(std::__shared_weak_count **)(a2 + 8);
  v19[0] = *(void *)a2;
  v19[1] = (uint64_t)v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pci::transport::bh::generateCallback(a1, v19, (uint64_t)"time sync", 0, &aBlock);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t Data = pci::transport::task::getData(*(pci::transport::task **)a2);
  uint64_t Size = pci::transport::task::getSize(*(pci::transport::task **)a2);
  int v12 = aBlock;
  int v13 = _Block_copy(aBlock);
  int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(pci::transport::bh *, void *, uint64_t, void *), void *))(*(void *)v9 + 136))(v9, a3, a4, Data, Size, pci::transport::bh::ioCompletion, v13);
  if (v14)
  {
    int v15 = (pci::log *)_TelephonyUtilDebugPrintError();
    char v16 = pci::log::get(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136316162;
      *(void *)&uint8_t buf[4] = "bh";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&unsigned char buf[22] = 1024;
      LODWORD(v22) = v17;
      WORD2(v22) = 2080;
      *(void *)((char *)&v22 + 6) = "timesync";
      HIWORD(v22) = 1024;
      int v23 = v14;
      _os_log_impl(&dword_21861F000, v16, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: time sync failed 0x%x", buf, 0x2Cu);
    }
    long long v18 = *(NSObject **)(a1 + 16);
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&uint8_t buf[8] = 0x40000000;
    *(void *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(void *)&long long v22 = &unk_26432D6F8;
    *((void *)&v22 + 1) = v12;
    int v24 = 0;
    int v25 = 0;
    int v23 = v14;
    dispatch_async(v18, buf);
    _Block_release(v12);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v12) {
    _Block_release(v12);
  }
}

void sub_21862DBBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t pci::transport::bh::registerTimeEvent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v22 = a2;
  int v6 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v7 = *(void *)(a1 + 96);
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = a1 + 96;
  do
  {
    int v9 = *(_DWORD *)(v7 + 32);
    BOOL v10 = v9 < (int)a2;
    if (v9 >= (int)a2) {
      unsigned int v11 = (uint64_t *)v7;
    }
    else {
      unsigned int v11 = (uint64_t *)(v7 + 8);
    }
    if (!v10) {
      uint64_t v8 = v7;
    }
    uint64_t v7 = *v11;
  }
  while (*v11);
  if (v8 != a1 + 96 && *(_DWORD *)(v8 + 32) <= (int)a2)
  {
    char v16 = (pci::log *)_TelephonyUtilDebugPrintError();
    int v17 = pci::log::get(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136316162;
      *(void *)int v24 = "bh";
      *(_WORD *)&v24[8] = 2048;
      *(void *)&v24[10] = a1;
      __int16 v25 = 1024;
      int v26 = v18;
      __int16 v27 = 2080;
      int v28 = "registerTimeEvent";
      __int16 v29 = 1024;
      int v30 = a2;
      _os_log_impl(&dword_21861F000, v17, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: time event already registered for domain %u", buf, 0x2Cu);
    }
    os_unfair_lock_unlock(v6);
    return 3758097090;
  }
  else
  {
LABEL_11:
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN3pci9transport2bh17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke;
    aBlock[3] = &unk_26432D720;
    int v21 = a2;
    aBlock[4] = a3;
    int v12 = _Block_copy(aBlock);
    int v13 = v12;
    *(_DWORD *)long long buf = a2;
    if (v12) {
      int v14 = _Block_copy(v12);
    }
    else {
      int v14 = 0;
    }
    *(void *)&v24[4] = v14;
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__emplace_unique_key_args<PCITransportTimeDomain,std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>((uint64_t **)(a1 + 88), (int *)buf, (uint64_t)buf);
    if (*(void *)&v24[4]) {
      _Block_release(*(const void **)&v24[4]);
    }
    uint64_t v15 = (*(uint64_t (**)(void, uint64_t, void, const void *))(**(void **)(a1 + 40) + 144))(*(void *)(a1 + 40), a2, pci::transport::bh::eventNotification, v13);
    if (v15) {
      std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__erase_unique<PCITransportTimeDomain>(a1 + 88, &v22);
    }
    os_unfair_lock_unlock(v6);
    if (v13) {
      _Block_release(v13);
    }
  }
  return v15;
}

void sub_21862DE88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZN3pci9transport2bh17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke(uint64_t a1, int a2, void *a3, unsigned int a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a2)
  {
    int v6 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v7 = pci::log::get(v6);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v8 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)long long buf = 67109376;
    int v17 = v8;
    LOWORD(v18) = 1024;
    *(_DWORD *)((char *)&v18 + 2) = a2;
    int v9 = "got time event for domain %u with status 0x%08x";
    BOOL v10 = v7;
LABEL_7:
    _os_log_impl(&dword_21861F000, v10, OS_LOG_TYPE_INFO, v9, buf, 0xEu);
    return;
  }
  if (a4 <= 3)
  {
    int v12 = (pci::log *)_TelephonyUtilDebugPrintError();
    int v13 = pci::log::get(v12);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v14 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)long long buf = 67109376;
    int v17 = v14;
    LOWORD(v18) = 1024;
    *(_DWORD *)((char *)&v18 + 2) = a4;
    int v9 = "got time event for domain %u with only %u args";
    BOOL v10 = v13;
    goto LABEL_7;
  }
  buf[0] = *(_DWORD *)(a1 + 40);
  uint64_t v15 = a3[1];
  buf[1] = *a3;
  *(_WORD *)&buf[2] = 0;
  int v17 = v15;
  uint64_t v18 = a3[3] | (a3[2] << 32);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::~pair(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 8);
  if (v2) {
    _Block_release(v2);
  }
  return a1;
}

void pci::transport::bh::eventNotification(pci::transport::bh *this, void *a2, uint64_t a3, void **a4)
{
  if (!this) {
    pci::transport::bh::eventNotification();
  }
  _Block_copy(this);
  (*((void (**)(pci::transport::bh *, void *, uint64_t, void **))this + 2))(this, a2, a3, a4);

  _Block_release(this);
}

uint64_t pci::transport::bh::deregisterTimeEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v5 = *(void *)(a1 + 96);
  if (!v5) {
    goto LABEL_11;
  }
  uint64_t v6 = a1 + 96;
  do
  {
    int v7 = *(_DWORD *)(v5 + 32);
    BOOL v8 = v7 < (int)a2;
    if (v7 >= (int)a2) {
      int v9 = (uint64_t *)v5;
    }
    else {
      int v9 = (uint64_t *)(v5 + 8);
    }
    if (!v8) {
      uint64_t v6 = v5;
    }
    uint64_t v5 = *v9;
  }
  while (*v9);
  if (v6 != a1 + 96 && *(_DWORD *)(v6 + 32) <= (int)a2)
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x3002000000;
    v30[3] = __Block_byref_object_copy__66;
    int v14 = *(void **)(v6 + 40);
    v30[4] = __Block_byref_object_dispose__67;
    uint64_t v31 = v14;
    *(void *)(v6 + 40) = 0;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer((uint64_t **)(a1 + 88), (uint64_t *)v6);
    std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>(v6 + 32);
    operator delete((void *)v6);
    *(void *)long long buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3802000000;
    *(void *)&long long v33 = __Block_byref_object_copy__68;
    *((void *)&v33 + 1) = __Block_byref_object_dispose__69;
    std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(&v34, (void *)a1);
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2000000000;
    char v29 = 0;
    uint64_t v24 = 0;
    __int16 v25 = &v24;
    uint64_t v26 = 0x2000000000;
    uint64_t v27 = 0;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 0x40000000;
    aBlock[2] = ___ZN3pci9transport2bh19deregisterTimeEventE22PCITransportTimeDomain_block_invoke;
    aBlock[3] = &unk_26432D748;
    void aBlock[7] = &v24;
    void aBlock[8] = a1;
    aBlock[4] = buf;
    void aBlock[5] = v30;
    aBlock[6] = v28;
    uint64_t v15 = _Block_copy(aBlock);
    v25[3] = (uint64_t)v15;
    char v16 = operator new(0x18uLL);
    uint64_t v17 = *(void *)(a1 + 64);
    v16[1] = a1 + 64;
    uint64_t v16[2] = v15;
    void *v16 = v17;
    *(void *)(v17 + 8) = v16;
    *(void *)(a1 + 6os_unfair_lock_unlock(this + 4) = v16;
    ++*(void *)(a1 + 80);
    int v18 = (*(uint64_t (**)(void, uint64_t, void (*)(pci::transport::bh *, void *), uint64_t))(**(void **)(a1 + 40) + 152))(*(void *)(a1 + 40), a2, pci::transport::bh::cmdCompletion, v25[3]);
    if (v18)
    {
      uint64_t v19 = (pci::log *)_TelephonyUtilDebugPrintError();
      int v20 = pci::log::get(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = *(_DWORD *)(a1 + 28);
        *(_DWORD *)block = 136316418;
        *(void *)&void block[4] = "bh";
        *(_WORD *)&block[12] = 2048;
        *(void *)&block[14] = a1;
        *(_WORD *)&block[22] = 1024;
        LODWORD(v37) = v21;
        WORD2(v37) = 2080;
        *(void *)((char *)&v37 + 6) = "deregisterTimeEvent";
        HIWORD(v37) = 1024;
        int v38 = a2;
        LOWORD(v39) = 1024;
        *(_DWORD *)((char *)&v39 + 2) = v18;
        _os_log_impl(&dword_21861F000, v20, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: deregister time event for domain %u failed 0x%x", block, 0x32u);
      }
      int v22 = *(NSObject **)(a1 + 16);
      *(void *)block = MEMORY[0x263EF8330];
      *(void *)&block[8] = 0x40000000;
      *(void *)&block[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
      *(void *)&long long v37 = &unk_26432D6F8;
      *((void *)&v37 + 1) = v15;
      uint64_t v39 = 0;
      int v38 = v18;
      dispatch_async(v22, block);
      _Block_release(v15);
    }
    os_unfair_lock_unlock(v4);
    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(v28, 8);
    _Block_object_dispose(buf, 8);
    if (v35) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v35);
    }
    _Block_object_dispose(v30, 8);
    if (v31) {
      _Block_release(v31);
    }
    return 0;
  }
  else
  {
LABEL_11:
    BOOL v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    unsigned int v11 = pci::log::get(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136316162;
      *(void *)&uint8_t buf[4] = "bh";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&unsigned char buf[22] = 1024;
      LODWORD(v33) = v12;
      WORD2(v33) = 2080;
      *(void *)((char *)&v33 + 6) = "deregisterTimeEvent";
      HIWORD(v33) = 1024;
      LODWORD(v3os_unfair_lock_unlock(this + 4) = a2;
      _os_log_impl(&dword_21861F000, v11, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: time event not registered for domain %u", buf, 0x2Cu);
    }
    os_unfair_lock_unlock(v4);
    return 3758097090;
  }
}

void sub_21862E5C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,void *aBlock)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

uint64_t __Block_byref_object_copy__66(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__67(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t __Block_byref_object_copy__68(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 8), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __Block_byref_object_dispose__69(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

void ___ZN3pci9transport2bh19deregisterTimeEventE22PCITransportTimeDomain_block_invoke(void *a1)
{
  uint64_t v2 = a1[8];
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 16));
  uint64_t v3 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v3 + 24)) {
    ___ZN3pci9transport2bh19deregisterTimeEventE22PCITransportTimeDomain_block_invoke_cold_1();
  }
  *(unsigned char *)(v3 + 2os_unfair_lock_unlock(this + 4) = 1;
  uint64_t v4 = *(void *)(a1[5] + 8);
  uint64_t v5 = *(const void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
  if (v5) {
    _Block_release(v5);
  }
  std::list<void const*>::remove(v2 + 64, (void *)(*(void *)(a1[7] + 8) + 24));
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 24));
}

void pci::transport::bh::mapRegion(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  uint64_t v28 = *(unsigned int *)(a1 + 28);
  int v14 = (pci::log *)_TelephonyUtilDebugPrintError();
  uint64_t v15 = pci::log::get(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = *(_DWORD *)(a1 + 28);
    *(_DWORD *)long long buf = 136316674;
    *(void *)&uint8_t buf[4] = "bh";
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = a1;
    *(_WORD *)&unsigned char buf[22] = 1024;
    LODWORD(v36) = v16;
    WORD2(v36) = 2080;
    *(void *)((char *)&v36 + 6) = "mapRegion";
    HIWORD(v36) = 1024;
    int v37 = a3;
    *(_WORD *)int v38 = 2048;
    *(void *)&v38[2] = a4;
    __int16 v39 = 1024;
    int v40 = a5;
    _os_log_impl(&dword_21861F000, v15, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: region %u, buffer %p, length %u", buf, 0x3Cu);
  }
  uint64_t v17 = *a2;
  int v18 = (std::__shared_weak_count *)a2[1];
  uint64_t v32 = v17;
  long long v33 = v18;
  if (v18) {
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pci::transport::bh::generateCallback(a1, &v32, (uint64_t)"map region", 0, &aBlock);
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v19 = *(void *)(a1 + 40);
  int v20 = aBlock;
  int v21 = _Block_copy(aBlock);
  int v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void (*)(pci::transport::bh *, void *), void *, const char *, const char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, std::__shared_weak_count *))(*(void *)v19 + 160))(v19, a3, a4, a5, a6, a7, pci::transport::bh::cmdCompletion, v21, "bh", "mapRegion", a1, v28, a3, a4, a5, v32, v33);
  if (v22)
  {
    int v23 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v24 = pci::log::get(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136316162;
      *(void *)&uint8_t buf[4] = "bh";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&unsigned char buf[22] = 1024;
      LODWORD(v36) = v25;
      WORD2(v36) = 2080;
      *(void *)((char *)&v36 + 6) = "mapRegion";
      HIWORD(v36) = 1024;
      int v37 = v22;
      _os_log_impl(&dword_21861F000, v24, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: map region failed 0x%x", buf, 0x2Cu);
    }
    uint64_t v26 = *(NSObject **)(a1 + 16);
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&uint8_t buf[8] = 0x40000000;
    *(void *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(void *)&long long v36 = &unk_26432D6F8;
    *((void *)&v36 + 1) = v20;
    *(_DWORD *)int v38 = 0;
    *(_DWORD *)&v38[4] = 0;
    int v37 = v22;
    dispatch_async(v26, buf);
    _Block_release(v20);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v20) {
    _Block_release(v20);
  }
}

void sub_21862EA6C(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void pci::transport::bh::unmapRegion(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = (std::__shared_weak_count *)a2[1];
  v14[0] = *a2;
  v14[1] = (uint64_t)v5;
  if (v5) {
    atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  pci::transport::bh::generateCallback(a1, v14, (uint64_t)"unmap region", 0, &aBlock);
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = aBlock;
  BOOL v8 = _Block_copy(aBlock);
  int v9 = (*(uint64_t (**)(uint64_t, uint64_t, void (*)(pci::transport::bh *, void *), void *))(*(void *)v6 + 168))(v6, a3, pci::transport::bh::cmdCompletion, v8);
  if (v9)
  {
    BOOL v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    unsigned int v11 = pci::log::get(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = *(_DWORD *)(a1 + 28);
      *(_DWORD *)long long buf = 136316162;
      *(void *)&uint8_t buf[4] = "bh";
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = a1;
      *(_WORD *)&unsigned char buf[22] = 1024;
      LODWORD(v17) = v12;
      WORD2(v17) = 2080;
      *(void *)((char *)&v17 + 6) = "unmapRegion";
      HIWORD(v17) = 1024;
      int v18 = v9;
      _os_log_impl(&dword_21861F000, v11, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: unmap region failed 0x%x", buf, 0x2Cu);
    }
    int v13 = *(NSObject **)(a1 + 16);
    *(void *)long long buf = MEMORY[0x263EF8330];
    *(void *)&uint8_t buf[8] = 0x40000000;
    *(void *)&buf[16] = ___ZN3pci9transport2bh19invokeCallbackAsyncEU13block_pointerFvijjEijj_block_invoke;
    *(void *)&long long v17 = &unk_26432D6F8;
    *((void *)&v17 + 1) = v7;
    int v19 = 0;
    int v20 = 0;
    int v18 = v9;
    dispatch_async(v13, buf);
    _Block_release(v7);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
  if (v7) {
    _Block_release(v7);
  }
}

void sub_21862ECEC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
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

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  size_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
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
  *(_DWORD *)(a1 + 10os_unfair_lock_unlock(this + 4) = 16;
  return a1;
}

void sub_21862EF58(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x21D46F0D0](v1);
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
  MEMORY[0x21D46F0D0](a1 + 112);
  return a1;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(void *a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x21D46EFD0](v13, a1);
  if (v13[0])
  {
    uint64_t v6 = (uint64_t)a1 + *(void *)(*a1 - 24);
    uint64_t v7 = *(void *)(v6 + 40);
    int v8 = *(_DWORD *)(v6 + 8);
    int v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24)));
      BOOL v10 = std::locale::use_facet(&v14, MEMORY[0x263F8C108]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 14os_unfair_lock_unlock(this + 4) = v9;
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
  MEMORY[0x21D46EFE0](v13);
  return a1;
}

void sub_21862F1C0(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  MEMORY[0x21D46EFE0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(void *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x21862F1A0);
}

void sub_21862F214(_Unwind_Exception *a1)
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
      int v13 = v18 >= 0 ? __p : (void **)__p[0];
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
      *(void *)(a5 + 2os_unfair_lock_unlock(this + 4) = 0;
    }
    else {
      return 0;
    }
  }
  return v6;
}

void sub_21862F394(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
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

uint64_t std::stringbuf::str[abi:ne180100]<std::allocator<char>>@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t result = std::stringbuf::view[abi:ne180100](a1);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = (const void *)result;
  size_t v6 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    int v9 = operator new(v7 + 1);
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

void std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_21862F5CC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::transport::bh>::reset[abi:ne180100]((pci::transport::bh **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::transport::bh *,std::shared_ptr<pci::transport::bh>::__shared_ptr_default_delete<pci::transport::bh,pci::transport::bh>,std::allocator<pci::transport::bh>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D46F100);
}

pci::transport::bh *std::__shared_ptr_pointer<pci::transport::bh *,std::shared_ptr<pci::transport::bh>::__shared_ptr_default_delete<pci::transport::bh,pci::transport::bh>,std::allocator<pci::transport::bh>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(pci::transport::bh **)(a1 + 24);
  if (result)
  {
    pci::transport::bh::~bh(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::transport::bh *,std::shared_ptr<pci::transport::bh>::__shared_ptr_default_delete<pci::transport::bh,pci::transport::bh>,std::allocator<pci::transport::bh>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::transport::bh *std::unique_ptr<pci::transport::bh>::reset[abi:ne180100](pci::transport::bh **a1, pci::transport::bh *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::transport::bh::~bh(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

void std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>(uint64_t a1)
{
  int v1 = *(const void **)(a1 + 8);
  if (v1) {
    _Block_release(v1);
  }
}

uint64_t *std::map<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *> *,long>>>(a1, *(int **)a2, (int *)(a2 + 8));
  return a1;
}

void sub_21862F7BC(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *> *,long>>>(uint64_t *result, int *a2, int *a3)
{
  if (a2 != a3)
  {
    unint64_t v4 = a2;
    size_t v5 = (uint64_t **)result;
    size_t v6 = result + 1;
    do
    {
      uint64_t result = std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__emplace_hint_unique_key_args<PCITransportTimeDomain,std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>> const&>(v5, v6, v4 + 8, (uint64_t)(v4 + 8));
      uint64_t v7 = (int *)*((void *)v4 + 1);
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = *(int **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (int *)*((void *)v4 + 2);
          BOOL v9 = *(void *)v8 == (void)v4;
          unint64_t v4 = v8;
        }
        while (!v9);
      }
      unint64_t v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__emplace_hint_unique_key_args<PCITransportTimeDomain,std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>> const&>(uint64_t **a1, uint64_t *a2, int *a3, uint64_t a4)
{
  size_t v6 = std::__tree<std::__value_type<PCITransportInterface,char const*>,std::__map_value_compare<PCITransportInterface,std::__value_type<PCITransportInterface,char const*>,std::less<PCITransportInterface>,true>,std::allocator<std::__value_type<PCITransportInterface,char const*>>>::__find_equal<PCITransportInterface>(a1, a2, &v13, &v12, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = (uint64_t *)operator new(0x30uLL);
    v10[1] = a1 + 1;
    std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::pair[abi:ne180100]((uint64_t)(v7 + 4), a4);
    char v11 = 1;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v13, v8, v7);
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

uint64_t std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>::pair[abi:ne180100](uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  unint64_t v3 = *(void **)(a2 + 8);
  if (v3) {
    unint64_t v3 = _Block_copy(v3);
  }
  *(void *)(a1 + 8) = v3;
  return a1;
}

void std::unique_ptr<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::__throw_bad_weak_ptr[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = MEMORY[0x263F8C2D8] + 16;
  __cxa_throw(exception, MEMORY[0x263F8C198], MEMORY[0x263F8C0A0]);
}

uint64_t **std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__emplace_unique_key_args<PCITransportTimeDomain,std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>(uint64_t **a1, int *a2, uint64_t a3)
{
  size_t v6 = a1 + 1;
  size_t v5 = a1[1];
  uint64_t v7 = a1 + 1;
  uint64_t v8 = a1 + 1;
  if (v5)
  {
    int v9 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        int v10 = *((_DWORD *)v5 + 8);
        if (v9 >= v10) {
          break;
        }
        size_t v5 = *v8;
        uint64_t v7 = v8;
        if (!*v8) {
          goto LABEL_9;
        }
      }
      if (v10 >= v9) {
        break;
      }
      size_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v7 = v8 + 1;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    char v11 = operator new(0x30uLL);
    v13[1] = v6;
    v11[8] = *(_DWORD *)a3;
    *((void *)v11 + 5) = *(void *)(a3 + 8);
    *(void *)(a3 + 8) = 0;
    char v14 = 1;
    std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__insert_node_at(a1, (uint64_t)v8, v7, (uint64_t *)v11);
    v13[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,void *>>>>::reset[abi:ne180100]((uint64_t)v13, 0);
    return (uint64_t **)v11;
  }
  return v8;
}

uint64_t std::__tree<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::__map_value_compare<PCITransportTimeDomain,std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,std::less<PCITransportTimeDomain>,true>,std::allocator<std::__value_type<PCITransportTimeDomain,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>>>::__erase_unique<PCITransportTimeDomain>(uint64_t a1, int *a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2) {
    return 0;
  }
  int v3 = *a2;
  uint64_t v4 = a1 + 8;
  do
  {
    int v5 = *(_DWORD *)(v2 + 32);
    BOOL v6 = v5 < v3;
    if (v5 >= v3) {
      uint64_t v7 = (uint64_t *)v2;
    }
    else {
      uint64_t v7 = (uint64_t *)(v2 + 8);
    }
    if (!v6) {
      uint64_t v4 = v2;
    }
    uint64_t v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32)) {
    return 0;
  }
  std::__tree<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::__map_value_compare<void const*,std::__value_type<void const*,std::shared_ptr<pci::transport::th>>,std::less<void const*>,true>,std::allocator<std::__value_type<void const*,std::shared_ptr<pci::transport::th>>>>::__remove_node_pointer((uint64_t **)a1, (uint64_t *)v4);
  std::__destroy_at[abi:ne180100]<std::pair<PCITransportTimeDomain const,dispatch::block<void({block_pointer})(int,void **,unsigned int)>>,0>(v4 + 32);
  operator delete((void *)v4);
  return 1;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x26u);
}

void OUTLINED_FUNCTION_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void pci::event::Listener::create()
{
}

void sub_21862FC98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, std::__shared_weak_count *a12)
{
  if (a12) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a12);
  }
  _Unwind_Resume(exception_object);
}

BOOL pci::event::Listener::init(pci::event::Listener *this)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  if (!*((void *)this + 2) || !*((void *)this + 3))
  {
    int v16 = (pci::log *)_TelephonyUtilDebugPrintError();
    long long v17 = pci::log::get(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)long long buf = 0;
    char v18 = "bad argument";
LABEL_33:
    _os_log_impl(&dword_21861F000, v17, OS_LOG_TYPE_INFO, v18, buf, 2u);
    return 0;
  }
  uint64_t v2 = *((void *)this + 4);
  if (!v2)
  {
    int v20 = (pci::log *)_TelephonyUtilDebugPrintError();
    long long v17 = pci::log::get(v20);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)long long buf = 0;
    char v18 = "failed to open control driver";
    goto LABEL_33;
  }
  if (!(*(unsigned int (**)(uint64_t))(*(void *)v2 + 24))(v2))
  {
    uint64_t v21 = (pci::log *)_TelephonyUtilDebugPrintError();
    long long v17 = pci::log::get(v21);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)long long buf = 0;
    char v18 = "IOABPControlClass::start() returned failure";
    goto LABEL_33;
  }
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, this);
  uint64_t v4 = *(void *)buf;
  int v3 = v28;
  if (v28)
  {
    atomic_fetch_add_explicit(&v28->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 1174405120;
  v25[2] = ___ZN3pci5event8Listener4initEv_block_invoke;
  v25[3] = &__block_descriptor_tmp_4;
  v25[4] = this;
  v25[5] = v4;
  uint64_t v26 = v3;
  if (v3) {
    atomic_fetch_add_explicit(&v3->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int v5 = (*(uint64_t (**)(void, void, void *))(**((void **)this + 4) + 72))(*((void *)this + 4), *((void *)this + 3), v25);
  if (v5)
  {
    BOOL v6 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v7 = pci::log::get(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_21861F000, v7, OS_LOG_TYPE_INFO, "IOABPControlClass::registerEventCallback() returned %#x", buf, 8u);
    }
    (*(void (**)(void))(**((void **)this + 4) + 32))(*((void *)this + 4));
  }
  if (v26) {
    std::__shared_weak_count::__release_weak(v26);
  }
  if (v3) {
    std::__shared_weak_count::__release_weak(v3);
  }
  if (v5) {
    return 0;
  }
  uint64_t v8 = (std::mutex *)((char *)this + 40);
  BOOL v9 = pci::event::PDPListener::start((std::mutex *)((char *)this + 40));
  if (!v9)
  {
    if (pci::transport::kernel::probeVariant((pci::transport::kernel *)v9) == 2
      && (int)TelephonyRadiosGetRadio() > 13)
    {
      return 1;
    }
    int v22 = (pci::log *)_TelephonyUtilDebugPrintError();
    long long v17 = pci::log::get(v22);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    *(_WORD *)long long buf = 0;
    char v18 = "PDPListener::start() returned failure";
    goto LABEL_33;
  }
  std::shared_ptr<pci::transport::bh>::shared_ptr[abi:ne180100]<pci::transport::bh,void>(buf, this);
  uint64_t v11 = *(void *)buf;
  int v10 = v28;
  if (v28)
  {
    atomic_fetch_add_explicit(&v28->__shared_weak_owners_, 1uLL, memory_order_relaxed);
    std::__shared_weak_count::__release_shared[abi:ne180100](v10);
  }
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 1174405120;
  v23[2] = ___ZN3pci5event8Listener4initEv_block_invoke_22;
  v23[3] = &__block_descriptor_tmp_26;
  uint8_t v23[4] = this;
  v23[5] = v11;
  uint64_t v24 = v10;
  if (v10) {
    atomic_fetch_add_explicit(&v10->__shared_weak_owners_, 1uLL, memory_order_relaxed);
  }
  int v12 = pci::event::PDPListener::registerEventNotification((uint64_t)this + 40, *((void *)this + 3), v23);
  BOOL v13 = v12 == 0;
  if (v12)
  {
    char v14 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v15 = pci::log::get(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v12;
      _os_log_impl(&dword_21861F000, v15, OS_LOG_TYPE_INFO, "PDPListener::registerEventCallback() returned %#x", buf, 8u);
    }
    pci::event::PDPListener::stop(v8);
  }
  if (v24) {
    std::__shared_weak_count::__release_weak(v24);
  }
  if (v10) {
    std::__shared_weak_count::__release_weak(v10);
  }
  return v13;
}

void sub_218630198(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, std::__shared_weak_count *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  if (a17) {
    std::__shared_weak_count::__release_weak(a17);
  }
  if (v24) {
    std::__shared_weak_count::__release_weak(v24);
  }
  _Unwind_Resume(exception_object);
}

void pci::event::Listener::~Listener(pci::event::Listener *this)
{
  uint64_t v2 = *((void *)this + 4);
  if (!v2)
  {
    BOOL v9 = (pci::log *)_TelephonyUtilDebugPrintError();
    BOOL v6 = pci::log::get(v9);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      goto LABEL_11;
    }
    *(_WORD *)uint64_t v15 = 0;
    uint64_t v7 = "invalid control driver";
    uint64_t v8 = v15;
    goto LABEL_10;
  }
  (*(void (**)(uint64_t, void))(*(void *)v2 + 88))(v2, 0);
  if (((*(uint64_t (**)(void))(**((void **)this + 4) + 32))(*((void *)this + 4)) & 1) == 0)
  {
    int v3 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v4 = pci::log::get(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_21861F000, v4, OS_LOG_TYPE_INFO, "IOABPControlClass::stop() returned failure", buf, 2u);
    }
  }
  pci::event::PDPListener::deregisterEventNotification((std::mutex *)((char *)this + 40));
  if ((pci::event::PDPListener::stop((std::mutex *)((char *)this + 40)) & 1) == 0)
  {
    int v5 = (pci::log *)_TelephonyUtilDebugPrintError();
    BOOL v6 = pci::log::get(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = 0;
      uint64_t v7 = "PDPListener::stop() returned failure";
      uint64_t v8 = (uint8_t *)&v13;
LABEL_10:
      _os_log_impl(&dword_21861F000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
    }
  }
LABEL_11:
  pci::event::PDPListener::~PDPListener((pci::event::Listener *)((char *)this + 40));
  uint64_t v10 = *((void *)this + 4);
  *((void *)this + os_unfair_lock_unlock(this + 4) = 0;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8))(v10);
  }
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef((const void **)this + 3);
  uint64_t v11 = (const void *)*((void *)this + 2);
  if (v11) {
    _Block_release(v11);
  }
  int v12 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v12) {
    std::__shared_weak_count::__release_weak(v12);
  }
}

void *pci::event::Listener::Listener(void *a1, void **a2, CFTypeRef cf)
{
  *a1 = 0;
  a1[1] = 0;
  int v5 = *a2;
  if (*a2) {
    int v5 = _Block_copy(v5);
  }
  a1[2] = v5;
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::SharedRef(a1 + 3, cf);
  pci::transport::kernelControl::create(a1 + 4);
  pci::event::PDPListener::PDPListener((pci::event::PDPListener *)(a1 + 5));
  return a1;
}

void sub_218630454(_Unwind_Exception *a1)
{
  uint64_t v4 = v3;
  uint64_t v6 = *v4;
  *uint64_t v4 = 0;
  if (v6) {
    pci::event::Listener::Listener(v6);
  }
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef(v2);
  uint64_t v7 = *(const void **)(v1 + 16);
  if (v7) {
    _Block_release(v7);
  }
  uint64_t v8 = *(std::__shared_weak_count **)(v1 + 8);
  if (v8) {
    std::__shared_weak_count::__release_weak(v8);
  }
  _Unwind_Resume(a1);
}

uint64_t pci::event::Listener::notify(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  pci::transport::kernel::errorAsString(a2);
  pci::transport::kernel::errorAsUnsigned(a2);
  uint64_t v8 = (pci::log *)_TelephonyUtilDebugPrint();
  BOOL v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315906;
    v55 = pci::transport::kernel::errorAsString(a2);
    __int16 v56 = 1024;
    int v57 = pci::transport::kernel::errorAsUnsigned(a2);
    __int16 v58 = 2048;
    uint64_t v59 = a3;
    __int16 v60 = 2048;
    uint64_t v61 = a4;
    _os_log_debug_impl(&dword_21861F000, v9, OS_LOG_TYPE_DEBUG, "%s (%u), arg1 %p, arg2 %p", buf, 0x26u);
  }
  ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)buf);
  switch(a2)
  {
    case 0:
      MEMORY[0x21D46EF50](buf, "pci error (unsupported variant: unknown): ");
      uint64_t v12 = ctu::operator<<();
      goto LABEL_14;
    case 2:
      if (HIDWORD(a2) <= 0x37)
      {
        if (((1 << SBYTE4(a2)) & 0xFE076BFFE07FFFLL) != 0)
        {
          uint64_t v10 = MEMORY[0x21D46EF50](buf, "pci error: ");
          uint64_t ACIPCErrorTypeString = getACIPCErrorTypeString();
          goto LABEL_12;
        }
        if (HIDWORD(a2) == 39)
        {
          if (a3 < 3)
          {
            uint64_t v36 = MEMORY[0x21D46EF50](buf, "pci error: ");
            uint64_t v37 = getACIPCErrorTypeString();
            uint64_t v38 = MEMORY[0x21D46EF50](v36, v37);
            uint64_t v39 = MEMORY[0x21D46EF50](v38, ": ");
            uint64_t ACIPCLinkStateString = getACIPCLinkStateString();
            MEMORY[0x21D46EF50](v39, ACIPCLinkStateString);
            goto LABEL_31;
          }
          if (a3 != 3)
          {
            if (a3 != 4) {
              __assert_rtn("notify", "PCIEvent.cpp", 214, "false");
            }
            goto LABEL_34;
          }
          uint64_t v49 = MEMORY[0x21D46EF50](buf, "pci error: ");
          uint64_t v50 = getACIPCErrorTypeString();
          uint64_t v51 = MEMORY[0x21D46EF50](v49, v50);
          uint64_t v52 = MEMORY[0x21D46EF50](v51, ": ");
          uint64_t v53 = getACIPCLinkStateString();
          MEMORY[0x21D46EF50](v52, v53);
LABEL_40:
          uint64_t v15 = 0;
          uint64_t v16 = 1000;
          goto LABEL_16;
        }
        if (HIDWORD(a2) == 43)
        {
          uint64_t v25 = MEMORY[0x21D46EF50](buf, "pci error: ");
          uint64_t v26 = getACIPCErrorTypeString();
          uint64_t v27 = MEMORY[0x21D46EF50](v25, v26);
          uint64_t v23 = MEMORY[0x21D46EF50](v27, ": ");
          uint64_t ACIPCAERErrorTypeString = getACIPCAERErrorTypeString();
          goto LABEL_23;
        }
      }
      uint64_t v34 = MEMORY[0x21D46EF50](buf, "pci error: ");
      uint64_t ABPErrorTypeString = getACIPCErrorTypeString();
      goto LABEL_30;
    case 1:
      if (HIDWORD(a2) > 0x31)
      {
LABEL_26:
        uint64_t v34 = MEMORY[0x21D46EF50](buf, "pci error: ");
        uint64_t ABPErrorTypeString = getABPErrorTypeString();
LABEL_30:
        uint64_t v41 = MEMORY[0x21D46EF50](v34, ABPErrorTypeString);
        MEMORY[0x21D46EF50](v41, ": (");
        uint64_t v42 = ctu::operator<<();
        MEMORY[0x21D46EF50](v42, ", ");
        uint64_t v43 = ctu::operator<<();
        MEMORY[0x21D46EF50](v43, ")");
        goto LABEL_31;
      }
      if (((1 << SBYTE4(a2)) & 0x3E77BFFE07FFFLL) != 0)
      {
        uint64_t v10 = MEMORY[0x21D46EF50](buf, "pci error: ");
        uint64_t ACIPCErrorTypeString = getABPErrorTypeString();
LABEL_12:
        uint64_t v12 = MEMORY[0x21D46EF50](v10, ACIPCErrorTypeString);
LABEL_14:
        MEMORY[0x21D46EF50](v12, ": (");
        uint64_t v13 = ctu::operator<<();
        MEMORY[0x21D46EF50](v13, ", ");
        uint64_t v14 = ctu::operator<<();
        MEMORY[0x21D46EF50](v14, ")");
        break;
      }
      if (HIDWORD(a2) != 39)
      {
        if (HIDWORD(a2) == 43)
        {
          uint64_t v20 = MEMORY[0x21D46EF50](buf, "pci error: ");
          uint64_t v21 = getABPErrorTypeString();
          uint64_t v22 = MEMORY[0x21D46EF50](v20, v21);
          uint64_t v23 = MEMORY[0x21D46EF50](v22, ": ");
          uint64_t ACIPCAERErrorTypeString = getABPAERErrorTypeString();
LABEL_23:
          uint64_t v28 = MEMORY[0x21D46EF50](v23, ACIPCAERErrorTypeString);
          MEMORY[0x21D46EF50](v28, ": ");
          ctu::operator<<();
          break;
        }
        goto LABEL_26;
      }
      if (a3 < 3)
      {
        uint64_t v29 = MEMORY[0x21D46EF50](buf, "pci error: ");
        uint64_t v30 = getABPErrorTypeString();
        uint64_t v31 = MEMORY[0x21D46EF50](v29, v30);
        uint64_t v32 = MEMORY[0x21D46EF50](v31, ": ");
        uint64_t ABPLinkStateString = getABPLinkStateString();
        MEMORY[0x21D46EF50](v32, ABPLinkStateString);
LABEL_31:
        uint64_t v16 = 0;
        uint64_t v15 = 1;
        goto LABEL_16;
      }
      if (a3 != 3)
      {
        if (a3 != 4) {
          __assert_rtn("notify", "PCIEvent.cpp", 114, "false");
        }
LABEL_34:
        MEMORY[0x21D46EF50](buf, "AP-triggered baseband reset");
        break;
      }
      uint64_t v44 = MEMORY[0x21D46EF50](buf, "pci error: ");
      uint64_t v45 = getABPErrorTypeString();
      uint64_t v46 = MEMORY[0x21D46EF50](v44, v45);
      uint64_t v47 = MEMORY[0x21D46EF50](v46, ": ");
      uint64_t v48 = getABPLinkStateString();
      MEMORY[0x21D46EF50](v47, v48);
      goto LABEL_40;
  }
  uint64_t v15 = 0;
  uint64_t v16 = 0;
LABEL_16:
  uint64_t v17 = MEMORY[0x21D46EF10](buf);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 16) + 16))(*(void *)(a1 + 16), v15, v17, v16, v18);
  return MEMORY[0x21D46EF30](buf);
}

void sub_218630A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  MEMORY[0x21D46EF30](va);
  _Unwind_Resume(a1);
}

uint64_t pci::event::Listener::notifyPDP(uint64_t a1, unint64_t a2, uint64_t a3)
{
  pci::event::getPDPMessageTypeString(a2);
  pci::event::getPDPMessageTypeValue(a2);
  uint64_t v6 = (pci::log *)_TelephonyUtilDebugPrint();
  uint64_t v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    pci::event::Listener::notifyPDP(a2, a3, v7);
  }
  ctu::LogMessageBuffer::LogMessageBuffer((ctu::LogMessageBuffer *)v13);
  uint64_t v8 = MEMORY[0x21D46EF50](v13, "pdp error: ");
  PDPMessageTypeString = pci::event::getPDPMessageTypeString(a2);
  uint64_t v10 = MEMORY[0x21D46EF50](v8, PDPMessageTypeString);
  MEMORY[0x21D46EF50](v10, ": ");
  ctu::operator<<();
  uint64_t v11 = MEMORY[0x21D46EF10](v13);
  (*(void (**)(void, void, uint64_t, void))(*(void *)(a1 + 16) + 16))(*(void *)(a1 + 16), 0, v11, 0);
  return MEMORY[0x21D46EF30](v13);
}

void ___ZN3pci5event8Listener4initEv_block_invoke(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  int v5 = (std::__shared_weak_count *)a1[6];
  if (v5)
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = std::__shared_weak_count::lock(v5);
    if (v10)
    {
      uint64_t v11 = v10;
      if (a1[5]) {
        pci::event::Listener::notify(v9, a2, a3, a4);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
  }
}

void sub_218630C1C(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t __copy_helper_block_e8_40c44_ZTSNSt3__18weak_ptrIN3pci5event8ListenerEEE(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 48);
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(result + 48) = v2;
  if (v2) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v2 + 16), 1uLL, memory_order_relaxed);
  }
  return result;
}

void __destroy_helper_block_e8_40c44_ZTSNSt3__18weak_ptrIN3pci5event8ListenerEEE(uint64_t a1)
{
  uint64_t v1 = *(std::__shared_weak_count **)(a1 + 48);
  if (v1) {
    std::__shared_weak_count::__release_weak(v1);
  }
}

void ___ZN3pci5event8Listener4initEv_block_invoke_22(void *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v4 = (std::__shared_weak_count *)a1[6];
  if (v4)
  {
    uint64_t v7 = a1[4];
    uint64_t v8 = std::__shared_weak_count::lock(v4);
    if (v8)
    {
      uint64_t v9 = v8;
      if (a1[5]) {
        pci::event::Listener::notifyPDP(v7, a2, a3);
      }
      std::__shared_weak_count::__release_shared[abi:ne180100](v9);
    }
  }
}

void sub_218630CEC(_Unwind_Exception *a1)
{
  std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

void std::shared_ptr<pci::event::Listener>::shared_ptr[abi:ne180100]<pci::event::Listener,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_218630D84(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::event::Listener>::reset[abi:ne180100]((pci::event::Listener **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::event::Listener *,std::shared_ptr<pci::event::Listener>::__shared_ptr_default_delete<pci::event::Listener,pci::event::Listener>,std::allocator<pci::event::Listener>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D46F100);
}

pci::event::Listener *std::__shared_ptr_pointer<pci::event::Listener *,std::shared_ptr<pci::event::Listener>::__shared_ptr_default_delete<pci::event::Listener,pci::event::Listener>,std::allocator<pci::event::Listener>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(pci::event::Listener **)(a1 + 24);
  if (result)
  {
    pci::event::Listener::~Listener(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::event::Listener *,std::shared_ptr<pci::event::Listener>::__shared_ptr_default_delete<pci::event::Listener,pci::event::Listener>,std::allocator<pci::event::Listener>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::event::Listener *std::unique_ptr<pci::event::Listener>::reset[abi:ne180100](pci::event::Listener **a1, pci::event::Listener *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::event::Listener::~Listener(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

void *ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::SharedRef(void *a1, CFTypeRef cf)
{
  *a1 = cf;
  if (cf) {
    CFRetain(cf);
  }
  return a1;
}

const char *getABPPDPMessageTypeString(int a1)
{
  uint64_t v2 = 0;
  uint64_t result = "invalid";
  while (abpPDPMessageTypeStrings[v2] != a1)
  {
    v2 += 4;
    if (v2 == 52) {
      return result;
    }
  }
  return *(const char **)&abpPDPMessageTypeStrings[v2 + 2];
}

const char *getACIPCPDPMessageTypeString(int a1)
{
  uint64_t v2 = 0;
  uint64_t result = "invalid";
  while (acipcPDPMessageTypeStrings[v2] != a1)
  {
    v2 += 4;
    if (v2 == 52) {
      return result;
    }
  }
  return *(const char **)&acipcPDPMessageTypeStrings[v2 + 2];
}

unint64_t pci::event::getPDPMessageTypeValue(unint64_t a1)
{
  return HIDWORD(a1);
}

const char *pci::event::getPDPMessageTypeString(unint64_t a1)
{
  unint64_t v1 = HIDWORD(a1);
  if (a1 == 1)
  {
    uint64_t v2 = 0;
    int v3 = abpPDPMessageTypeStrings;
    uint64_t result = "invalid";
    while (abpPDPMessageTypeStrings[v2] != v1)
    {
      v2 += 4;
      if (v2 == 52) {
        return result;
      }
    }
  }
  else
  {
    if (a1 != 2) {
      return "unrecognized error code";
    }
    uint64_t v2 = 0;
    int v3 = acipcPDPMessageTypeStrings;
    uint64_t result = "invalid";
    while (acipcPDPMessageTypeStrings[v2] != v1)
    {
      v2 += 4;
      if (v2 == 52) {
        return result;
      }
    }
  }
  return *(const char **)&v3[v2 + 2];
}

double pci::event::PDPListener::PDPListener(pci::event::PDPListener *this)
{
  *(void *)this = 850045863;
  *((void *)this + 13) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 2os_unfair_lock_unlock(this + 4) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 52) = 0u;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 9) = 0;
  *((_DWORD *)this + 2os_unfair_lock_unlock(this + 4) = 0;
  return result;
}

{
  double result;

  *(void *)this = 850045863;
  *((void *)this + 13) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 2os_unfair_lock_unlock(this + 4) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *(_OWORD *)((char *)this + 52) = 0u;
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 9) = 0;
  *((_DWORD *)this + 2os_unfair_lock_unlock(this + 4) = 0;
  return result;
}

void pci::event::PDPListener::~PDPListener(pci::event::PDPListener *this)
{
  pci::event::PDPListener::stop((std::mutex *)this);
  uint64_t v2 = (const void *)*((void *)this + 13);
  if (v2) {
    _Block_release(v2);
  }
  ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::~SharedRef((const void **)this + 9);

  std::mutex::~mutex((std::mutex *)this);
}

uint64_t pci::event::PDPListener::stop(std::mutex *this)
{
  std::mutex::lock(this);
  pci::event::PDPListener::deregisterEventNotification_nl((pci::event::PDPListener *)this);
  io_object_t sig = this[1].__m_.__sig;
  if (sig)
  {
    IOObjectRelease(sig);
    LODWORD(this[1].__m_.__sig) = 0;
  }
  std::mutex::unlock(this);
  return 1;
}

void sub_218631104(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

BOOL pci::event::PDPListener::start(std::mutex *this)
{
  std::mutex::lock(this);
  if (LODWORD(this[1].__m_.__sig))
  {
    BOOL v3 = 1;
    goto LABEL_17;
  }
  int v4 = pci::transport::kernel::probeVariant(v2);
  if (v4 == 1)
  {
    int v5 = "AppleBasebandPCIPDPManagerBase";
  }
  else
  {
    if (v4 != 2)
    {
      uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintError();
      uint64_t v11 = pci::log::get(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_21861F000, v11, OS_LOG_TYPE_INFO, "unknown PCI variant", v17, 2u);
      }
      goto LABEL_14;
    }
    int v5 = "AppleConvergedIPCPDPManager";
  }
  CFDictionaryRef v6 = IOServiceMatching(v5);
  if (v6)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(*MEMORY[0x263F0EC88], v6);
    BOOL v3 = MatchingService != 0;
    if (!MatchingService)
    {
      uint64_t v8 = (pci::log *)_TelephonyUtilDebugPrintError();
      uint64_t v9 = pci::log::get(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_21861F000, v9, OS_LOG_TYPE_INFO, "could not get matching service", buf, 2u);
      }
    }
    LODWORD(this[1].__m_.__sig) = MatchingService;
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v12 = (pci::log *)_TelephonyUtilDebugPrintError();
  uint64_t v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_21861F000, v13, OS_LOG_TYPE_INFO, "could not create matching dictionary", v16, 2u);
  }
  BOOL v3 = 0;
LABEL_17:
  std::mutex::unlock(this);
  return v3;
}

void sub_2186312E0(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void pci::event::PDPListener::deregisterEventNotification_nl(pci::event::PDPListener *this)
{
  if (*((void *)this + 9)) {
    unint64_t v1 = ctu::SharedRef<__CFRunLoop,ctu::cf::cfretain_functor,ctu::cf::cfrelease_functor,__CFRunLoop>::get;
  }
  else {
    unint64_t v1 = 0;
  }
  if (v1)
  {
    pci::event::PDPListener::clearEventNotificationPort((CFRunLoopRef *)this);
    if (CFRunLoopGetCurrent() == *((CFRunLoopRef *)this + 9))
    {
      IOObjectRelease(*((_DWORD *)this + 24));
      *((_DWORD *)this + 2os_unfair_lock_unlock(this + 4) = 0;
    }
    else
    {
      BOOL v3 = dispatch_group_create();
      int v4 = v3;
      if (v3)
      {
        dispatch_retain(v3);
        dispatch_group_enter(v4);
      }
      int v5 = (__CFRunLoop *)*((void *)this + 9);
      CFDictionaryRef v6 = (const void *)*MEMORY[0x263EFFE88];
      v7[0] = MEMORY[0x263EF8330];
      v7[1] = 1174405120;
      v7[2] = ___ZN3pci5event11PDPListener30deregisterEventNotification_nlEv_block_invoke;
      v7[3] = &__block_descriptor_tmp_5;
      v7[4] = this;
      dispatch_group_t group = v4;
      if (v4)
      {
        dispatch_retain(v4);
        dispatch_group_enter(group);
      }
      CFRunLoopPerformBlock(v5, v6, v7);
      CFRunLoopWakeUp(*((CFRunLoopRef *)this + 9));
      if (group)
      {
        dispatch_group_leave(group);
        if (group) {
          dispatch_release(group);
        }
      }
      if (v4)
      {
        dispatch_group_leave(v4);
        dispatch_release(v4);
      }
      std::mutex::unlock((std::mutex *)this);
      dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
      std::mutex::lock((std::mutex *)this);
      if (v4) {
        dispatch_release(v4);
      }
    }
  }
}

void sub_21863146C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, dispatch_group_t group)
{
  if (v14) {
    dispatch_release(v14);
  }
  _Unwind_Resume(exception_object);
}

void pci::event::PDPListener::setEventNotificationPort(pci::event::PDPListener *this)
{
  if (!*((void *)this + 10))
  {
    uint64_t v2 = IONotificationPortCreate(*MEMORY[0x263F0EC88]);
    *((void *)this + 10) = v2;
    if (!v2) {
      pci::event::PDPListener::setEventNotificationPort();
    }
    RunLoopSource = IONotificationPortGetRunLoopSource(v2);
    *((void *)this + 11) = RunLoopSource;
    int v4 = (__CFRunLoop *)*((void *)this + 9);
    CFStringRef v5 = (const __CFString *)*MEMORY[0x263EFFE88];
    CFRunLoopAddSource(v4, RunLoopSource, v5);
  }
}

void pci::event::PDPListener::clearEventNotificationPort(CFRunLoopRef *this)
{
  unint64_t v1 = this + 10;
  if (this[10])
  {
    CFRunLoopRemoveSource(this[9], this[11], (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    IONotificationPortDestroy(this[10]);
    void *v1 = 0;
    v1[1] = 0;
  }
}

uint64_t pci::event::PDPListener::registerEventNotification(uint64_t a1, uint64_t a2, const void *a3)
{
  kern_return_t v16;
  pci::log *v17;
  NSObject *v18;
  pci::log *v19;
  uint8_t buf[8];
  uint64_t v21;

  uint64_t v21 = *MEMORY[0x263EF8340];
  std::mutex::lock((std::mutex *)a1);
  if (*(_DWORD *)(a1 + 64))
  {
    if (*(void *)(a1 + 104))
    {
      CFDictionaryRef v6 = (pci::log *)_TelephonyUtilDebugPrintError();
      uint64_t v7 = pci::log::get(v6);
      uint64_t v8 = 3758097093;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        uint64_t v9 = "a notification block is already registered. deregister it before registering a new block";
LABEL_7:
        uint64_t v11 = v7;
        uint32_t v12 = 2;
LABEL_8:
        _os_log_impl(&dword_21861F000, v11, OS_LOG_TYPE_INFO, v9, buf, v12);
      }
    }
    else
    {
      if (!a3)
      {
        int v19 = (pci::log *)_TelephonyUtilDebugPrintError();
        uint64_t v7 = pci::log::get(v19);
        uint64_t v8 = 3758097090;
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
          goto LABEL_9;
        }
        *(_WORD *)long long buf = 0;
        uint64_t v9 = "block must be provided";
        goto LABEL_7;
      }
      uint64_t v14 = _Block_copy(a3);
      uint64_t v15 = *(const void **)(a1 + 104);
      *(void *)(a1 + 10os_unfair_lock_unlock(this + 4) = v14;
      if (v15) {
        _Block_release(v15);
      }
      *(void *)long long buf = a2;
      ctu::cf::CFSharedRef<__CFRunLoop>::operator=((const void **)(a1 + 72), (CFTypeRef *)buf);
      pci::event::PDPListener::setEventNotificationPort((pci::event::PDPListener *)a1);
      uint64_t v16 = IOServiceAddInterestNotification(*(IONotificationPortRef *)(a1 + 80), *(_DWORD *)(a1 + 64), "IOGeneralInterest", (IOServiceInterestCallback)pci::event::PDPListener::generalInterestCallback, (void *)a1, (io_object_t *)(a1 + 96));
      if (!v16)
      {
        uint64_t v8 = 0;
        goto LABEL_9;
      }
      uint64_t v17 = (pci::log *)_TelephonyUtilDebugPrintError();
      uint64_t v18 = pci::log::get(v17);
      uint64_t v8 = 3758097084;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v16;
        uint64_t v9 = "could not add interest notification on service: %#x";
        uint64_t v11 = v18;
        uint32_t v12 = 8;
        goto LABEL_8;
      }
    }
  }
  else
  {
    uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v7 = pci::log::get(v10);
    uint64_t v8 = 3758097136;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      uint64_t v9 = "service is NULL - must successfully start() first";
      goto LABEL_7;
    }
  }
LABEL_9:
  std::mutex::unlock((std::mutex *)a1);
  return v8;
}

void sub_218631808(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void *pci::event::PDPListener::generalInterestCallback(pci::event::PDPListener *this, void *a2, int a3, void *a4, void *a5)
{
  return pci::event::PDPListener::generalInterestFunction(this, a3, a4);
}

void *pci::event::PDPListener::generalInterestFunction(void *this, int a2, void *a3)
{
  if (this[13])
  {
    BOOL v3 = this;
    for (uint64_t i = 0; i != 52; i += 4)
    {
      if (abpPDPMessageTypeStrings[i] == a2) {
        goto LABEL_10;
      }
    }
    if (a2 == -469794735)
    {
LABEL_10:
      pci::transport::kernel::probeVariant((pci::transport::kernel *)this);
      uint64_t v8 = *(uint64_t (**)(void))(v3[13] + 16);
      return (void *)v8();
    }
    unint64_t v5 = -1;
    CFDictionaryRef v6 = &dword_26432D848;
    while (v5 != 11)
    {
      int v7 = *v6;
      v6 += 4;
      ++v5;
      if (v7 == a2)
      {
        if (v5 > 0xB) {
          return this;
        }
        goto LABEL_10;
      }
    }
  }
  return this;
}

BOOL pci::event::PDPListener::shouldNotify(pci::event::PDPListener *this, int a2)
{
  for (uint64_t i = 0; i != 52; i += 4)
  {
    if (abpPDPMessageTypeStrings[i] == a2) {
      return 1;
    }
  }
  if (a2 == -469794735) {
    return 1;
  }
  unint64_t v4 = 0;
  unint64_t v5 = &dword_26432D848;
  do
  {
    unint64_t v6 = v4;
    if (v4 == 12) {
      break;
    }
    int v7 = *v5;
    v5 += 4;
    ++v4;
  }
  while (v7 != a2);
  return v6 < 0xC;
}

void pci::event::PDPListener::deregisterEventNotification(std::mutex *this)
{
  std::mutex::lock(this);
  pci::event::PDPListener::deregisterEventNotification_nl((pci::event::PDPListener *)this);

  std::mutex::unlock(this);
}

void sub_2186319D4(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void ___ZN3pci5event11PDPListener30deregisterEventNotification_nlEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  std::mutex::lock((std::mutex *)v1);
  IOObjectRelease(*(_DWORD *)(v1 + 96));
  *(_DWORD *)(v1 + 96) = 0;

  std::mutex::unlock((std::mutex *)v1);
}

void sub_218631A30(_Unwind_Exception *a1)
{
  std::mutex::unlock(v1);
  _Unwind_Resume(a1);
}

void __copy_helper_block_e8_40c30_ZTSN8dispatch13group_sessionE(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3)
  {
    dispatch_retain(v3);
    unint64_t v4 = *(NSObject **)(a1 + 40);
    if (v4)
    {
      dispatch_group_enter(v4);
    }
  }
}

void __destroy_helper_block_e8_40c30_ZTSN8dispatch13group_sessionE(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 40);
  if (v2)
  {
    dispatch_group_leave(v2);
    BOOL v3 = *(NSObject **)(a1 + 40);
    if (v3)
    {
      dispatch_release(v3);
    }
  }
}

void pci::transport::th::create()
{
}

void sub_218631B80(_Unwind_Exception *exception_object)
{
  BOOL v3 = *(std::__shared_weak_count **)(v1 + 8);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  _Unwind_Resume(exception_object);
}

void pci::transport::th::init(pci::transport::th *this)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v11[0] = 0;
  v11[1] = v11;
  uint64_t v11[2] = 0x2000000000;
  char v12 = 1;
  dispatch_group_create();
  uint64_t v2 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  BOOL v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::init();
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (!*((void *)this + 6))
  {
    std::string::basic_string[abi:ne180100]<0>(v13, "com.apple.WirelessIPC.baseband.pci_client");
    std::string::basic_string[abi:ne180100]<0>(__p, "_");
    unint64_t v4 = buf;
    pci::transport::th::generateString((uint64_t)v13, (uint64_t)__p, buf);
    if (v16 < 0) {
      unint64_t v4 = *(uint8_t **)buf;
    }
    unint64_t v5 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)*((_DWORD *)this + 30), 0);
    dispatch_queue_t v6 = dispatch_queue_create_with_target_V2((const char *)v4, v5, *((dispatch_queue_t *)this + 14));
    int v7 = *((void *)this + 6);
    *((void *)this + 6) = v6;
    if (v7) {
      dispatch_release(v7);
    }
    if (v16 < 0) {
      operator delete(*(void **)buf);
    }
    if (SHIBYTE(v9) < 0) {
      operator delete(*(void **)__p);
    }
    if (v14 < 0) {
      operator delete(*(void **)v13);
    }
  }
  *(_DWORD *)std::string __p = *((_DWORD *)this + 10);
  *(void *)&__p[4] = *((void *)this + 8);
  uint64_t v9 = *((void *)this + 14);
  int v10 = *((_DWORD *)this + 30);
  pci::transport::bh::create();
}

void sub_218632338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,dispatch_object_t object,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39)
{
  if (object) {
    dispatch_release(object);
  }
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)(v42 - 160));
  if (v39)
  {
    dispatch_release(v39);
    if (!v41)
    {
LABEL_5:
      if (!v40) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if (!v41)
  {
    goto LABEL_5;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v41);
  if (!v40)
  {
LABEL_7:
    _Block_object_dispose(&a30, 8);
    _Unwind_Resume(a1);
  }
LABEL_6:
  std::__shared_weak_count::__release_shared[abi:ne180100](v40);
  goto LABEL_7;
}

uint64_t pci::transport::th::th(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = operator new(0x20uLL);
  v4[1] = 0;
  v4[2] = 0;
  *unint64_t v4 = &unk_26C9BAE88;
  *(void *)(a1 + 8) = v4;
  *((_DWORD *)v4 + 6) = 0;
  *(void *)a1 = v4 + 3;
  dispatch_group_t v5 = dispatch_group_create();
  *(void *)(a1 + 2os_unfair_lock_unlock(this + 4) = 0;
  *(void *)(a1 + 32) = 0;
  *(_DWORD *)(a1 + 40) = *(_DWORD *)a2;
  *(void *)(a1 + 16) = v5;
  dispatch_queue_t v6 = *(NSObject **)(a2 + 8);
  *(void *)(a1 + 48) = v6;
  if (v6) {
    dispatch_retain(v6);
  }
  int v7 = *(void **)(a2 + 16);
  if (v7) {
    int v7 = _Block_copy(v7);
  }
  *(void *)(a1 + 56) = v7;
  *(void *)(a1 + 6os_unfair_lock_unlock(this + 4) = *(void *)(a2 + 24);
  char v8 = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a1 + 72) = v8 & 1;
  *(unsigned char *)(a1 + 73) = (v8 & 2) != 0;
  *(unsigned char *)(a1 + 7os_unfair_lock_unlock(this + 4) = (v8 & 4) != 0;
  *(void *)(a1 + 76) = *(void *)(a2 + 36);
  uint64_t v9 = *(void **)(a2 + 48);
  if (v9) {
    uint64_t v9 = _Block_copy(v9);
  }
  *(void *)(a1 + 88) = v9;
  int v10 = *(void **)(a2 + 56);
  if (v10) {
    int v10 = _Block_copy(v10);
  }
  *(void *)(a1 + 96) = v10;
  uint64_t v11 = *(void **)(a2 + 64);
  if (v11) {
    uint64_t v11 = _Block_copy(v11);
  }
  *(void *)(a1 + 10os_unfair_lock_unlock(this + 4) = v11;
  char v12 = *(NSObject **)(a2 + 72);
  if (v12)
  {
    *(void *)(a1 + 112) = v12;
    dispatch_retain(v12);
  }
  else
  {
    pci::system::info::get(&v17);
    uint64_t v13 = *(NSObject **)(v17 + 24);
    *(void *)(a1 + 112) = v13;
    if (v13) {
      dispatch_retain(v13);
    }
    if (v18) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v18);
    }
  }
  *(_DWORD *)(a1 + 120) = *(_DWORD *)(a2 + 80);
  *(void *)(a1 + 128) = a1 + 128;
  *(void *)(a1 + 136) = a1 + 128;
  *(void *)(a1 + 14os_unfair_lock_unlock(this + 4) = 0;
  *(unsigned char *)(a1 + 152) = 0;
  char v14 = (pci::log *)_TelephonyUtilDebugPrint();
  uint64_t v15 = pci::log::get(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::th();
  }
  return a1;
}

void sub_218632620(_Unwind_Exception *a1)
{
  dispatch_queue_t v6 = (const void *)v1[13];
  if (v6) {
    _Block_release(v6);
  }
  int v7 = (const void *)v1[12];
  if (v7) {
    _Block_release(v7);
  }
  char v8 = (const void *)v1[11];
  if (v8) {
    _Block_release(v8);
  }
  uint64_t v9 = (const void *)v1[7];
  if (v9) {
    _Block_release(v9);
  }
  pci::transport::th::th(v4, v2, v3, (uint64_t)v1);
  _Unwind_Resume(a1);
}

void pci::transport::th::~th(pci::transport::th *this)
{
  uint64_t v2 = (int *)((char *)this + 40);
  BOOL v3 = (pci::log *)_TelephonyUtilDebugPrint();
  unint64_t v4 = pci::log::get(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::~th();
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  *((unsigned char *)this + 152) = 1;
  if (*((void *)this + 3))
  {
    *(_OWORD *)aBlock = 0u;
    *(_OWORD *)dispatch_object_t object = 0u;
    dispatch_group_t v5 = _Block_copy(&__block_literal_global_2);
    dispatch_queue_t v6 = v5;
    int v33 = *v2;
    uint64_t v34 = 0;
    uint64_t v36 = 0;
    uint64_t v35 = 0;
    if (v5) {
      int v7 = _Block_copy(v5);
    }
    else {
      int v7 = 0;
    }
    char v8 = aBlock[0];
    aBlock[0] = v7;
    if (v8) {
      _Block_release(v8);
    }
    os_unfair_lock_t v10 = *(os_unfair_lock_t *)this;
    uint64_t v9 = *((void *)this + 1);
    if (v9) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v9 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v11 = (std::__shared_weak_count *)object[0];
    aBlock[1] = v10;
    object[0] = (dispatch_object_t)v9;
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    char v12 = *((void *)this + 2);
    if (v12) {
      dispatch_retain(*((dispatch_object_t *)this + 2));
    }
    uint64_t v13 = object[1];
    object[1] = v12;
    if (v13) {
      dispatch_release(v13);
    }
    if (v6) {
      _Block_release(v6);
    }
    LODWORD(v32) = *v2;
    PciTransportToDirectionMap = getPciTransportToDirectionMap();
    if ((*(_DWORD *)std::map<PCITransportInterface,PCITransportDirection>::at((uint64_t)PciTransportToDirectionMap, (int *)&v32) & 0xFFFFFFFD) == 1)pci::transport::task::create(); {
    LODWORD(v32) = *v2;
    }
    uint64_t v15 = getPciTransportToDirectionMap();
    if ((*(_DWORD *)std::map<PCITransportInterface,PCITransportDirection>::at((uint64_t)v15, (int *)&v32) & 0xFFFFFFFE) == 2) {
      pci::transport::task::create();
    }
    char v16 = (pci::transport::th *)*((void *)this + 17);
    if (v16 != (pci::transport::th *)((char *)this + 128))
    {
      do
      {
        uint64_t v18 = (pci::transport::th *)*((void *)v16 + 1);
        uint64_t v17 = (pci::transport::task *)*((void *)v16 + 2);
        int v19 = (std::__shared_weak_count *)*((void *)v16 + 3);
        if (v19) {
          atomic_fetch_add_explicit(&v19->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (!*((unsigned char *)this + 73) || pci::transport::task::getType(v17) == 1) {
          pci::transport::task::poison(v17, -536870165);
        }
        if (v19) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v19);
        }
        char v16 = v18;
      }
      while (v18 != (pci::transport::th *)((char *)this + 128));
    }
    uint64_t v20 = (std::__shared_weak_count *)*((void *)this + 4);
    *((void *)this + 3) = 0;
    *((void *)this + os_unfair_lock_unlock(this + 4) = 0;
    if (v20) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v20);
    }
    if (object[1]) {
      dispatch_release(object[1]);
    }
    if (object[0]) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)object[0]);
    }
    if (aBlock[0]) {
      _Block_release(aBlock[0]);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  dispatch_group_wait(*((dispatch_group_t *)this + 2), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v21 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v22 = pci::log::get(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::~th();
  }
  std::__list_imp<std::shared_ptr<pci::transport::task>>::clear((uint64_t *)this + 16);
  uint64_t v23 = *((void *)this + 14);
  if (v23) {
    dispatch_release(v23);
  }
  uint64_t v24 = (const void *)*((void *)this + 13);
  if (v24) {
    _Block_release(v24);
  }
  uint64_t v25 = (const void *)*((void *)this + 12);
  if (v25) {
    _Block_release(v25);
  }
  uint64_t v26 = (const void *)*((void *)this + 11);
  if (v26) {
    _Block_release(v26);
  }
  uint64_t v27 = (const void *)*((void *)this + 7);
  if (v27) {
    _Block_release(v27);
  }
  uint64_t v28 = *((void *)this + 6);
  if (v28) {
    dispatch_release(v28);
  }
  uint64_t v29 = (std::__shared_weak_count *)*((void *)this + 4);
  if (v29) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v29);
  }
  uint64_t v30 = *((void *)this + 2);
  if (v30) {
    dispatch_release(v30);
  }
  uint64_t v31 = (std::__shared_weak_count *)*((void *)this + 1);
  if (v31) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v31);
  }
}

void pci::transport::th::lock(os_unfair_lock_t *this)
{
}

void pci::transport::task::parameters::~parameters(pci::transport::task::parameters *this)
{
  uint64_t v2 = *((void *)this + 7);
  if (v2) {
    dispatch_release(v2);
  }
  BOOL v3 = (std::__shared_weak_count *)*((void *)this + 6);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  unint64_t v4 = (const void *)*((void *)this + 4);
  if (v4) {
    _Block_release(v4);
  }
}

void pci::transport::th::unlock(os_unfair_lock_t *this)
{
}

uint64_t pci::transport::th::generateString@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, void *a3@<X8>)
{
  std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v14);
  int v6 = *(char *)(a1 + 23);
  if (v6 >= 0) {
    uint64_t v7 = a1;
  }
  else {
    uint64_t v7 = *(void *)a1;
  }
  if (v6 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 8);
  }
  uint64_t v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v14, v7, v8);
  int v10 = *(char *)(a2 + 23);
  if (v10 >= 0) {
    uint64_t v11 = a2;
  }
  else {
    uint64_t v11 = *(void *)a2;
  }
  if (v10 >= 0) {
    uint64_t v12 = *(unsigned __int8 *)(a2 + 23);
  }
  else {
    uint64_t v12 = *(void *)(a2 + 8);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, v11, v12);
  std::ostream::operator<<();
  std::stringbuf::str[abi:ne180100]<std::allocator<char>>((uint64_t)v15, a3);
  uint64_t v14 = *MEMORY[0x263F8C2C8];
  *(void *)((char *)&v15[-1] + *(void *)(v14 - 24)) = *(void *)(MEMORY[0x263F8C2C8] + 24);
  v15[0] = MEMORY[0x263F8C318] + 16;
  if (v16 < 0) {
    operator delete((void *)v15[8]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  return MEMORY[0x21D46F0D0](&v17);
}

void sub_218632C88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void ___ZN3pci9transport2th4initEv_block_invoke(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(a1 + 40);
  uint64_t v4 = *(void *)(v3 + 8);
  if (a2) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = *(unsigned char *)(v4 + 24) == 0;
  }
  char v6 = !v5;
  *(unsigned char *)(v4 + 2os_unfair_lock_unlock(this + 4) = v6;
  dispatch_group_leave(v2);
}

void __copy_helper_block_e8_40c21_ZTSN8dispatch5groupE(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __destroy_helper_block_e8_40c21_ZTSN8dispatch5groupE(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

void pci::transport::th::notify(pci::transport::th *this)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v2 = (int *)((char *)this + 40);
  uint64_t v3 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v4 = pci::log::get(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::notify();
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  *(_OWORD *)uint64_t v17 = 0u;
  *(_OWORD *)dispatch_object_t object = 0u;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th6notifyEv_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_15;
  aBlock[4] = this;
  BOOL v5 = _Block_copy(aBlock);
  char v6 = v5;
  int v12 = *v2;
  int v13 = 1;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  int v16 = 0;
  if (v5) {
    uint64_t v7 = _Block_copy(v5);
  }
  else {
    uint64_t v7 = 0;
  }
  v17[0] = v7;
  os_unfair_lock_t v9 = *(os_unfair_lock_t *)this;
  uint64_t v8 = *((void *)this + 1);
  if (v8) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
  }
  v17[1] = v9;
  object[0] = (dispatch_object_t)v8;
  int v10 = *((void *)this + 2);
  if (v10) {
    dispatch_retain(*((dispatch_object_t *)this + 2));
  }
  object[1] = v10;
  if (v6) {
    _Block_release(v6);
  }
  pci::transport::task::create();
}

void sub_218632F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, std::__shared_weak_count *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  if (a10) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a10);
  }
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  _Unwind_Resume(a1);
}

void pci::transport::th::readAsync(os_unfair_lock_t *this)
{
  uint64_t v2 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::readAsync();
  }
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x3002000000;
  uint64_t v14 = __Block_byref_object_copy__26;
  uint64_t v15 = __Block_byref_object_dispose__27;
  uint64_t v16 = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th9readAsyncEv_block_invoke;
  aBlock[3] = &unk_26432D9C0;
  aBlock[4] = &v11;
  void aBlock[5] = this;
  uint64_t v4 = _Block_copy(aBlock);
  BOOL v5 = (const void *)v12[5];
  v12[5] = (uint64_t)v4;
  if (v5) {
    _Block_release(v5);
  }
  os_unfair_lock_lock(*this);
  int v6 = *((_DWORD *)this + 20);
  uint64_t v7 = (const void *)v12[5];
  if (v7) {
    uint64_t v8 = _Block_copy(v7);
  }
  else {
    uint64_t v8 = 0;
  }
  os_unfair_lock_t v9 = v8;
  pci::transport::th::readInternal((uint64_t)this, 0, v6, 0, &v9);
}

void sub_2186331B8(_Unwind_Exception *a1)
{
  if (v1) {
    _Block_release(v1);
  }
  _Block_object_dispose((const void *)(v2 - 80), 8);
  uint64_t v4 = *(const void **)(v2 - 40);
  if (v4) {
    _Block_release(v4);
  }
  _Unwind_Resume(a1);
}

double pci::transport::th::initParams(uint64_t a1)
{
  *(void *)(a1 + 80) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 6os_unfair_lock_unlock(this + 4) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)(a1 + 80) = 21;
  return result;
}

BOOL pci::transport::th::validateParams(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (!a1)
  {
    os_unfair_lock_t v9 = (pci::log *)_TelephonyUtilDebugPrintError();
    int v10 = pci::log::get(v9);
    BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    *(_WORD *)long long buf = 0;
    int v6 = "no params";
    goto LABEL_11;
  }
  if (*(int *)a1 >= 34)
  {
    uint64_t v2 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v3 = pci::log::get(v2);
    BOOL result = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (!result) {
      return result;
    }
    int v5 = *(_DWORD *)a1;
    *(_DWORD *)long long buf = 67109120;
    int v13 = v5;
    int v6 = "invalid interface number %d";
    uint64_t v7 = v3;
    uint32_t v8 = 8;
    goto LABEL_12;
  }
  if (*(void *)(a1 + 16)) {
    return 1;
  }
  uint64_t v11 = (pci::log *)_TelephonyUtilDebugPrintError();
  int v10 = pci::log::get(v11);
  BOOL result = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (result)
  {
    *(_WORD *)long long buf = 0;
    int v6 = "status block is required";
LABEL_11:
    uint64_t v7 = v10;
    uint32_t v8 = 2;
LABEL_12:
    _os_log_impl(&dword_21861F000, v7, OS_LOG_TYPE_INFO, v6, buf, v8);
    return 0;
  }
  return result;
}

void ___ZN3pci9transport2th6notifyEv_block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  if (!a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(const void **)(v6 + 56);
    if (v7) {
      uint32_t v8 = _Block_copy(v7);
    }
    else {
      uint32_t v8 = 0;
    }
    os_unfair_lock_t v9 = *(NSObject **)(v6 + 48);
    if (v9) {
      dispatch_retain(v9);
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 1174405120;
    uint64_t v11[2] = ___ZN3pci9transport2th6notifyEv_block_invoke_2;
    void v11[3] = &__block_descriptor_tmp_14;
    if (v8) {
      int v10 = _Block_copy(v8);
    }
    else {
      int v10 = 0;
    }
    aBlock = v10;
    int v13 = a5;
    dispatch_async(v9, v11);
    if (aBlock) {
      _Block_release(aBlock);
    }
    if (v9) {
      dispatch_release(v9);
    }
    if (v8) {
      _Block_release(v8);
    }
  }
}

uint64_t ___ZN3pci9transport2th6notifyEv_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40), 0, 0);
}

void *__copy_helper_block_e8_32c67_ZTSN8dispatch5blockIU13block_pointerFv18PCITransportStatusPvS2_EEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c67_ZTSN8dispatch5blockIU13block_pointerFv18PCITransportStatusPvS2_EEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void pci::transport::th::write(pci::transport::th *this, const unsigned __int8 *a2, int a3, NSObject *a4, int a5)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  v19[0] = 0;
  v19[1] = v19;
  uint64_t v19[2] = 0x2000000000;
  char v20 = 1;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3002000000;
  v18[3] = __Block_byref_object_copy__1;
  v18[4] = __Block_byref_object_dispose__1;
  v18[5] = dispatch_semaphore_create(0);
  int v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v14 = *((_DWORD *)this + 10);
    int buf = 136316930;
    buf_4 = "th";
    __int16 v23 = 2048;
    uint64_t v24 = this;
    __int16 v25 = 1024;
    int v26 = v14;
    __int16 v27 = 2080;
    uint64_t v28 = "write";
    __int16 v29 = 2048;
    uint64_t v30 = a2;
    __int16 v31 = 1024;
    int v32 = a3;
    __int16 v33 = 2048;
    uint64_t v34 = a4;
    __int16 v35 = 1024;
    int v36 = a5;
    _os_log_debug_impl(&dword_21861F000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, length %u, dDtor %p, timeout %u", (uint8_t *)&buf, 0x46u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th5writeEPKhjPFvPvEj_block_invoke;
  aBlock[3] = &unk_26432D950;
  void aBlock[6] = this;
  void aBlock[7] = a2;
  void aBlock[8] = a4;
  int v17 = a3;
  aBlock[4] = v19;
  void aBlock[5] = v18;
  int v12 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v12) {
    int v13 = _Block_copy(v12);
  }
  else {
    int v13 = 0;
  }
  uint64_t v15 = v13;
  pci::transport::th::writeInternal((uint64_t)this, (uint64_t)a2, a3, a4, &v15);
}

void sub_21863385C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,dispatch_object_t object)
{
  if (v35) {
    _Block_release(v35);
  }
  _Block_object_dispose(&a29, 8);
  if (object) {
    dispatch_release(object);
  }
  if (v34) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v34);
  }
  _Block_object_dispose((const void *)(v36 - 192), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

intptr_t ___ZN3pci9transport2th5writeEPKhjPFvPvEj_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 48);
  os_unfair_lock_t v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  int v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v19 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)int buf = 136316674;
    uint64_t v21 = "th";
    __int16 v22 = 2048;
    uint64_t v23 = v8;
    __int16 v24 = 1024;
    int v25 = v19;
    __int16 v26 = 2080;
    __int16 v27 = "write_block_invoke";
    __int16 v28 = 1024;
    int v29 = a2;
    __int16 v30 = 2048;
    uint64_t v31 = a3;
    __int16 v32 = 1024;
    int v33 = a4;
    _os_log_debug_impl(&dword_21861F000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
  if (a2) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = *(unsigned char *)(v11 + 24) == 0;
  }
  char v13 = !v12;
  *(unsigned char *)(v11 + 2os_unfair_lock_unlock(this + 4) = v13;
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
  char v15 = *(unsigned char *)(v14 + 24);
  if (v15)
  {
    if (*(void *)(a1 + 56) == a3 && !*(void *)(a1 + 64))
    {
      char v15 = 1;
    }
    else if (a3)
    {
      char v15 = 0;
    }
    else
    {
      char v15 = *(void *)(a1 + 64) != 0;
    }
  }
  *(unsigned char *)(v14 + 2os_unfair_lock_unlock(this + 4) = v15;
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  char v17 = *(unsigned char *)(v16 + 24);
  if (v17)
  {
    if (*(_DWORD *)(a1 + 72) == a4 && !*(void *)(a1 + 64))
    {
      char v17 = 1;
    }
    else if (a4)
    {
      char v17 = 0;
    }
    else
    {
      char v17 = *(void *)(a1 + 64) != 0;
    }
  }
  *(unsigned char *)(v16 + 2os_unfair_lock_unlock(this + 4) = v17;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void pci::transport::th::read(pci::transport::th *this, const unsigned __int8 *a2, unsigned int *a3, NSObject *a4, int a5)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2000000000;
  char v21 = 1;
  v19[0] = 0;
  v19[1] = v19;
  uint64_t v19[2] = 0x3002000000;
  void v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  v19[5] = dispatch_semaphore_create(0);
  int v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v15 = *((_DWORD *)this + 10);
    int v16 = *a3;
    int buf = 136316930;
    buf_4 = "th";
    __int16 v24 = 2048;
    int v25 = this;
    __int16 v26 = 1024;
    int v27 = v15;
    __int16 v28 = 2080;
    int v29 = "read";
    __int16 v30 = 2048;
    uint64_t v31 = a2;
    __int16 v32 = 1024;
    int v33 = v16;
    __int16 v34 = 2048;
    __int16 v35 = a4;
    __int16 v36 = 1024;
    int v37 = a5;
    _os_log_debug_impl(&dword_21861F000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, length %u, dDtor %p, timeout %u", (uint8_t *)&buf, 0x46u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th4readEPKhRjPFvPvEj_block_invoke;
  aBlock[3] = &unk_26432D998;
  void aBlock[6] = this;
  void aBlock[7] = a2;
  void aBlock[8] = a3;
  aBlock[4] = v20;
  void aBlock[5] = v19;
  BOOL v12 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  int v13 = *a3;
  if (v12) {
    uint64_t v14 = _Block_copy(v12);
  }
  else {
    uint64_t v14 = 0;
  }
  char v17 = v14;
  pci::transport::th::readInternal((uint64_t)this, (uint64_t)a2, v13, a4, &v17);
}

void sub_218633E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,dispatch_object_t object,char a33)
{
  if (v34) {
    _Block_release(v34);
  }
  _Block_object_dispose(&a27, 8);
  if (object) {
    dispatch_release(object);
  }
  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th4readEPKhRjPFvPvEj_block_invoke(void *a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  uint64_t v8 = a1[6];
  os_unfair_lock_t v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  int v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v22 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)int buf = 136316674;
    __int16 v24 = "th";
    __int16 v25 = 2048;
    uint64_t v26 = v8;
    __int16 v27 = 1024;
    int v28 = v22;
    __int16 v29 = 2080;
    __int16 v30 = "read_block_invoke";
    __int16 v31 = 1024;
    int v32 = a2;
    __int16 v33 = 2048;
    uint64_t v34 = a3;
    __int16 v35 = 1024;
    unsigned int v36 = a4;
    _os_log_debug_impl(&dword_21861F000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
    if (!a3) {
      goto LABEL_5;
    }
  }
  else if (!a3)
  {
    goto LABEL_5;
  }
  uint64_t v11 = (pci::log *)_TelephonyUtilDebugPrintBinaryVerbose();
  BOOL v12 = pci::log::get(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::writeInternal();
  }
LABEL_5:
  uint64_t v13 = *(void *)(a1[4] + 8);
  if (a2) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = *(unsigned char *)(v13 + 24) == 0;
  }
  char v15 = !v14;
  *(unsigned char *)(v13 + 2os_unfair_lock_unlock(this + 4) = v15;
  uint64_t v16 = *(void *)(a1[4] + 8);
  char v17 = *(unsigned char *)(v16 + 24);
  if (v17) {
    char v17 = a1[7] == a3;
  }
  *(unsigned char *)(v16 + 2os_unfair_lock_unlock(this + 4) = v17;
  uint64_t v18 = *(void *)(a1[4] + 8);
  char v19 = *(unsigned char *)(v18 + 24);
  char v20 = (unsigned int *)a1[8];
  if (v19) {
    char v19 = *v20 >= a4;
  }
  *(unsigned char *)(v18 + 2os_unfair_lock_unlock(this + 4) = v19;
  *char v20 = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[5] + 8) + 40));
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 40);
  if (v1) {
    _Block_release(v1);
  }
}

void pci::transport::th::sendImage(pci::transport::th *this, const unsigned __int8 *a2, int a3, unsigned int *a4, NSObject *a5, int a6)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2000000000;
  char v23 = 1;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3002000000;
  v21[3] = __Block_byref_object_copy__1;
  uint8_t v21[4] = __Block_byref_object_dispose__1;
  void v21[5] = dispatch_semaphore_create(0);
  BOOL v12 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v16 = *((_DWORD *)this + 10);
    int v17 = *a4;
    int buf = 136317186;
    buf_4 = "th";
    __int16 v26 = 2048;
    __int16 v27 = this;
    __int16 v28 = 1024;
    int v29 = v16;
    __int16 v30 = 2080;
    __int16 v31 = "sendImage";
    __int16 v32 = 2048;
    __int16 v33 = a2;
    __int16 v34 = 1024;
    int v35 = a3;
    __int16 v36 = 1024;
    int v37 = v17;
    __int16 v38 = 2048;
    uint64_t v39 = a5;
    __int16 v40 = 1024;
    int v41 = a6;
    _os_log_debug_impl(&dword_21861F000, v13, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, length %u, cookie %u, dDtor %p, timeout %u", (uint8_t *)&buf, 0x4Cu);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th9sendImageEPKhjRjPFvPvEj_block_invoke;
  aBlock[3] = &unk_26432D9E8;
  void aBlock[6] = this;
  void aBlock[7] = a2;
  int v20 = a3;
  void aBlock[8] = a5;
  void aBlock[9] = a4;
  aBlock[4] = v22;
  void aBlock[5] = v21;
  BOOL v14 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v14) {
    char v15 = _Block_copy(v14);
  }
  else {
    char v15 = 0;
  }
  uint64_t v18 = v15;
  pci::transport::th::sendImageInternal((uint64_t)this, (uint64_t)a2, a3, a5, &v18);
}

void sub_21863448C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,dispatch_object_t object)
{
  if (v37) {
    _Block_release(v37);
  }
  _Block_object_dispose(&a31, 8);
  if (object) {
    dispatch_release(object);
  }
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  _Block_object_dispose((const void *)(v38 - 208), 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th9sendImageEPKhjRjPFvPvEj_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  BOOL v12 = pci::log::get(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    int v21 = *(_DWORD *)(v10 + 40);
    *(_DWORD *)int buf = 136316930;
    char v23 = "th";
    __int16 v24 = 2048;
    uint64_t v25 = v10;
    __int16 v26 = 1024;
    int v27 = v21;
    __int16 v28 = 2080;
    int v29 = "sendImage_block_invoke";
    __int16 v30 = 1024;
    int v31 = a2;
    __int16 v32 = 2048;
    uint64_t v33 = a3;
    __int16 v34 = 1024;
    int v35 = a4;
    __int16 v36 = 1024;
    int v37 = a5;
    _os_log_debug_impl(&dword_21861F000, v12, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u, code %u", buf, 0x42u);
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
  if (a2) {
    BOOL v14 = 1;
  }
  else {
    BOOL v14 = *(unsigned char *)(v13 + 24) == 0;
  }
  char v15 = !v14;
  *(unsigned char *)(v13 + 2os_unfair_lock_unlock(this + 4) = v15;
  uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
  char v17 = *(unsigned char *)(v16 + 24);
  if (v17)
  {
    if (*(void *)(a1 + 56) == a3 && !*(void *)(a1 + 64))
    {
      char v17 = 1;
    }
    else if (a3)
    {
      char v17 = 0;
    }
    else
    {
      char v17 = *(void *)(a1 + 64) != 0;
    }
  }
  *(unsigned char *)(v16 + 2os_unfair_lock_unlock(this + 4) = v17;
  uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 8);
  char v19 = *(unsigned char *)(v18 + 24);
  if (v19)
  {
    if (*(_DWORD *)(a1 + 80) == a4 && !*(void *)(a1 + 64))
    {
      char v19 = 1;
    }
    else if (a4)
    {
      char v19 = 0;
    }
    else
    {
      char v19 = *(void *)(a1 + 64) != 0;
    }
  }
  *(unsigned char *)(v18 + 2os_unfair_lock_unlock(this + 4) = v19;
  **(_DWORD **)(a1 + 72) = a5;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void pci::transport::th::sendImageInternal(uint64_t a1, uint64_t a2, int a3, NSObject *a4, const void **a5)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)int v21 = 136316674;
    *(void *)int v22 = "th";
    *(_WORD *)&v22[8] = 2048;
    *(void *)&v22[10] = a1;
    *(_WORD *)&v22[18] = 1024;
    int v23 = v20;
    __int16 v24 = 2080;
    *(void *)uint64_t v25 = "sendImageInternal";
    *(_WORD *)&v25[8] = 2048;
    *(void *)&v25[10] = a2;
    LOWORD(object[0]) = 1024;
    *(_DWORD *)((char *)object + 2) = a3;
    HIWORD(object[0]) = 2048;
    object[1] = a4;
    _os_log_debug_impl(&dword_21861F000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", v21, 0x40u);
  }
  *(_OWORD *)&v25[2] = 0u;
  *(_OWORD *)dispatch_object_t object = 0u;
  if (*a5) {
    BOOL v12 = _Block_copy(*a5);
  }
  else {
    BOOL v12 = 0;
  }
  *(_DWORD *)int v21 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)int v22 = 3;
  *(void *)&v22[4] = a4;
  *(void *)&v22[12] = a2;
  int v23 = a3;
  if (v12) {
    uint64_t v13 = _Block_copy(v12);
  }
  else {
    uint64_t v13 = 0;
  }
  BOOL v14 = *(const void **)&v25[2];
  *(void *)&v25[2] = v13;
  if (v14) {
    _Block_release(v14);
  }
  uint64_t v16 = *(const os_unfair_lock **)a1;
  uint64_t v15 = *(void *)(a1 + 8);
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  char v17 = (std::__shared_weak_count *)object[0];
  *(void *)&v25[10] = v16;
  object[0] = (dispatch_object_t)v15;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  uint64_t v18 = *(NSObject **)(a1 + 16);
  if (v18) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  char v19 = object[1];
  object[1] = v18;
  if (v19) {
    dispatch_release(v19);
  }
  if (v12) {
    _Block_release(v12);
  }
  pci::transport::task::create();
}

void sub_218634A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  _Unwind_Resume(a1);
}

void pci::transport::th::sendImageAsync(pci::transport::th *this, const unsigned __int8 *a2, int a3, NSObject *a4)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  os_unfair_lock_t v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = *((_DWORD *)this + 10);
    int buf = 136316674;
    buf_4 = "th";
    __int16 v17 = 2048;
    uint64_t v18 = this;
    __int16 v19 = 1024;
    int v20 = v12;
    __int16 v21 = 2080;
    int v22 = "sendImageAsync";
    __int16 v23 = 2048;
    __int16 v24 = a2;
    __int16 v25 = 1024;
    int v26 = a3;
    __int16 v27 = 2048;
    __int16 v28 = a4;
    _os_log_debug_impl(&dword_21861F000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: buffer %p, size %u, dDtor %p", (uint8_t *)&buf, 0x40u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke;
  aBlock[3] = &__block_descriptor_tmp_39;
  aBlock[4] = this;
  uint64_t v10 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  if (v10) {
    uint64_t v11 = _Block_copy(v10);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v13 = v11;
  pci::transport::th::sendImageInternal((uint64_t)this, (uint64_t)a2, a3, a4, &v13);
}

void sub_218634CBC(_Unwind_Exception *exception_object, int a2)
{
  if (!a2) {
    _Unwind_Resume(exception_object);
  }
  __clang_call_terminate(exception_object);
}

void ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v16 = *(_DWORD *)(v9 + 40);
    *(_DWORD *)int buf = 136316930;
    __int16 v24 = "th";
    __int16 v25 = 2048;
    uint64_t v26 = v9;
    __int16 v27 = 1024;
    int v28 = v16;
    __int16 v29 = 2080;
    __int16 v30 = "sendImageAsync_block_invoke";
    __int16 v31 = 1024;
    int v32 = a2;
    __int16 v33 = 2048;
    uint64_t v34 = a3;
    __int16 v35 = 1024;
    int v36 = a4;
    __int16 v37 = 1024;
    int v38 = a5;
    _os_log_debug_impl(&dword_21861F000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u, code %u", buf, 0x42u);
  }
  int v12 = *(const void **)(v9 + 104);
  if (v12) {
    uint64_t v13 = _Block_copy(v12);
  }
  else {
    uint64_t v13 = 0;
  }
  BOOL v14 = *(NSObject **)(v9 + 48);
  if (v14) {
    dispatch_retain(v14);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 1174405120;
  block[2] = ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke_37;
  block[3] = &__block_descriptor_tmp_38;
  if (v13) {
    uint64_t v15 = _Block_copy(v13);
  }
  else {
    uint64_t v15 = 0;
  }
  aBlock = v15;
  uint64_t v19 = a3;
  int v20 = a2;
  int v21 = a4;
  int v22 = a5;
  dispatch_async(v14, block);
  if (aBlock) {
    _Block_release(aBlock);
  }
  if (v14) {
    dispatch_release(v14);
  }
  if (v13) {
    _Block_release(v13);
  }
}

void sub_218634F14(_Unwind_Exception *a1, int a2)
{
  if (a2) {
    __clang_call_terminate(a1);
  }
  _Unwind_Resume(a1);
}

uint64_t ___ZN3pci9transport2th14sendImageAsyncEPKhjPFvPvE_block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 48), *(void *)(a1 + 40), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56));
}

void *__copy_helper_block_e8_32c47_ZTSN8dispatch5blockIU13block_pointerFviPvjjEEE(uint64_t a1, uint64_t a2)
{
  BOOL result = *(void **)(a2 + 32);
  if (result) {
    BOOL result = _Block_copy(result);
  }
  *(void *)(a1 + 32) = result;
  return result;
}

void __destroy_helper_block_e8_32c47_ZTSN8dispatch5blockIU13block_pointerFviPvjjEEE(uint64_t a1)
{
  uint64_t v1 = *(const void **)(a1 + 32);
  if (v1) {
    _Block_release(v1);
  }
}

void pci::transport::th::readRegister(pci::transport::th *this, int a2, const unsigned __int8 *a3, unsigned int *a4, int a5)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2000000000;
  char v21 = 1;
  v19[0] = 0;
  v19[1] = v19;
  uint64_t v19[2] = 0x3002000000;
  void v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  v19[5] = dispatch_semaphore_create(0);
  uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v15 = *((_DWORD *)this + 10);
    int v16 = *a4;
    int buf = 136316930;
    buf_4 = "th";
    __int16 v24 = 2048;
    __int16 v25 = this;
    __int16 v26 = 1024;
    int v27 = v15;
    __int16 v28 = 2080;
    __int16 v29 = "readRegister";
    __int16 v30 = 1024;
    int v31 = a2;
    __int16 v32 = 2048;
    __int16 v33 = a3;
    __int16 v34 = 1024;
    int v35 = v16;
    __int16 v36 = 1024;
    int v37 = a5;
    _os_log_debug_impl(&dword_21861F000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: reg %u, buffer %p, length %u, timeout %u", (uint8_t *)&buf, 0x42u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th12readRegisterEjPKhRjj_block_invoke;
  aBlock[3] = &unk_26432DA30;
  void aBlock[6] = this;
  void aBlock[7] = a3;
  void aBlock[8] = a4;
  aBlock[4] = v20;
  void aBlock[5] = v19;
  int v12 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  int v13 = *a4;
  if (v12) {
    BOOL v14 = _Block_copy(v12);
  }
  else {
    BOOL v14 = 0;
  }
  __int16 v17 = v14;
  pci::transport::th::readRegisterInternal((uint64_t)this, a2, (uint64_t)a3, v13, &v17);
}

void sub_2186352F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,dispatch_object_t object,char a33)
{
  if (v34) {
    _Block_release(v34);
  }
  _Block_object_dispose(&a27, 8);
  if (object) {
    dispatch_release(object);
  }
  if (v33) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v33);
  }
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

intptr_t ___ZN3pci9transport2th12readRegisterEjPKhRjj_block_invoke(void *a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  uint64_t v8 = a1[6];
  uint64_t v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)int buf = 136316674;
    int v22 = "th";
    __int16 v23 = 2048;
    uint64_t v24 = v8;
    __int16 v25 = 1024;
    int v26 = v20;
    __int16 v27 = 2080;
    __int16 v28 = "readRegister_block_invoke";
    __int16 v29 = 1024;
    int v30 = a2;
    __int16 v31 = 2048;
    uint64_t v32 = a3;
    __int16 v33 = 1024;
    unsigned int v34 = a4;
    _os_log_debug_impl(&dword_21861F000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
  }
  uint64_t v11 = *(void *)(a1[4] + 8);
  if (a2) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = *(unsigned char *)(v11 + 24) == 0;
  }
  char v13 = !v12;
  *(unsigned char *)(v11 + 2os_unfair_lock_unlock(this + 4) = v13;
  uint64_t v14 = *(void *)(a1[4] + 8);
  char v15 = *(unsigned char *)(v14 + 24);
  if (v15) {
    char v15 = a1[7] == a3;
  }
  *(unsigned char *)(v14 + 2os_unfair_lock_unlock(this + 4) = v15;
  uint64_t v16 = *(void *)(a1[4] + 8);
  char v17 = *(unsigned char *)(v16 + 24);
  uint64_t v18 = (unsigned int *)a1[8];
  if (v17) {
    char v17 = *v18 >= a4;
  }
  *(unsigned char *)(v16 + 2os_unfair_lock_unlock(this + 4) = v17;
  unsigned int *v18 = a4;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[5] + 8) + 40));
}

void pci::transport::th::readRegisterInternal(uint64_t a1, int a2, uint64_t a3, int a4, const void **a5)
{
  *(void *)&v25[21] = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)a1);
  uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v11 = pci::log::get(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)char v21 = 136316674;
    *(void *)int v22 = "th";
    *(_WORD *)&v22[8] = 2048;
    *(void *)&v22[10] = a1;
    *(_WORD *)&v22[18] = 1024;
    int v23 = v20;
    __int16 v24 = 2080;
    *(void *)__int16 v25 = "readRegisterInternal";
    v25[4] = 1024;
    *(_DWORD *)&v25[5] = a2;
    v25[7] = 2048;
    *(void *)&v25[8] = a3;
    v25[12] = 1024;
    *(_DWORD *)&v25[13] = a4;
    _os_log_debug_impl(&dword_21861F000, v11, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: reg %u, buffer %p, size %u", v21, 0x3Cu);
  }
  memset(&v25[1], 0, 32);
  if (*a5) {
    BOOL v12 = _Block_copy(*a5);
  }
  else {
    BOOL v12 = 0;
  }
  *(_DWORD *)char v21 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)int v22 = 2;
  *(void *)&v22[4] = 0;
  *(void *)&v22[12] = a3;
  int v23 = a4;
  if (v12) {
    char v13 = _Block_copy(v12);
  }
  else {
    char v13 = 0;
  }
  uint64_t v14 = *(const void **)&v25[1];
  *(void *)&v25[1] = v13;
  if (v14) {
    _Block_release(v14);
  }
  uint64_t v16 = *(const os_unfair_lock **)a1;
  uint64_t v15 = *(void *)(a1 + 8);
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  char v17 = *(std::__shared_weak_count **)&v25[9];
  *(void *)&v25[5] = v16;
  *(void *)&v25[9] = v15;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  uint64_t v19 = *(NSObject **)&v25[13];
  *(void *)&v25[13] = v18;
  if (v19) {
    dispatch_release(v19);
  }
  if (v12) {
    _Block_release(v12);
  }
  pci::transport::task::create();
}

void sub_218635854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)va);
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  _Unwind_Resume(a1);
}

void pci::transport::th::timesyncAsync(uint64_t a1, int a2, int a3, uint64_t a4)
{
  *(void *)&v26[21] = *MEMORY[0x263EF8340];
  uint64_t v8 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v9 = pci::log::get(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v20 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)int v22 = 136316674;
    *(void *)int v23 = "th";
    *(_WORD *)&v23[8] = 2048;
    *(void *)&v23[10] = a1;
    *(_WORD *)&v23[18] = 1024;
    int v24 = v20;
    __int16 v25 = 2080;
    *(void *)int v26 = "timesyncAsync";
    v26[4] = 1024;
    *(_DWORD *)&v26[5] = a2;
    v26[7] = 1024;
    *(_DWORD *)&v26[8] = a3;
    v26[10] = 2048;
    *(void *)&v26[11] = a4;
    _os_log_debug_impl(&dword_21861F000, v9, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: domain %u, count %u, cb %p", v22, 0x3Cu);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th13timesyncAsyncE22PCITransportTimeDomainjU13block_pointerFvijP31PCITransportTimesyncMeasurementE_block_invoke;
  aBlock[3] = &unk_26432DA80;
  aBlock[4] = a4;
  void aBlock[5] = a1;
  uint64_t v10 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  memset(&v26[1], 0, 32);
  int TimesyncBufferLength = pci::transport::bh::getTimesyncBufferLength(*(pci::transport::bh **)(a1 + 24), a3);
  if (v10) {
    BOOL v12 = _Block_copy(v10);
  }
  else {
    BOOL v12 = 0;
  }
  *(_DWORD *)int v22 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)int v23 = 2;
  *(void *)&uint8_t v23[4] = 0;
  *(void *)&v23[12] = 0;
  int v24 = TimesyncBufferLength;
  if (v12) {
    char v13 = _Block_copy(v12);
  }
  else {
    char v13 = 0;
  }
  uint64_t v14 = *(const void **)&v26[1];
  *(void *)&v26[1] = v13;
  if (v14) {
    _Block_release(v14);
  }
  os_unfair_lock_t v16 = *(os_unfair_lock_t *)a1;
  uint64_t v15 = *(void *)(a1 + 8);
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  char v17 = *(std::__shared_weak_count **)&v26[9];
  *(void *)&v26[5] = v16;
  *(void *)&v26[9] = v15;
  if (v17) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v17);
  }
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  uint64_t v19 = *(NSObject **)&v26[13];
  *(void *)&v26[13] = v18;
  if (v19) {
    dispatch_release(v19);
  }
  if (v12) {
    _Block_release(v12);
  }
  pci::transport::task::create();
}

void sub_218635C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, std::__shared_weak_count *a20)
{
  if (a20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a20);
  }
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)(v21 - 160));
  if (v20) {
    _Block_release(v20);
  }
  _Unwind_Resume(a1);
}

void ___ZN3pci9transport2th13timesyncAsyncE22PCITransportTimeDomainjU13block_pointerFvijP31PCITransportTimesyncMeasurementE_block_invoke(uint64_t a1, int a2, char *a3, unsigned int a4)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v14 = *(_DWORD *)(v8 + 40);
    *(_DWORD *)int buf = 136316674;
    uint64_t v19 = "th";
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    __int16 v22 = 1024;
    int v23 = v14;
    __int16 v24 = 2080;
    __int16 v25 = "timesyncAsync_block_invoke";
    __int16 v26 = 1024;
    int v27 = a2;
    __int16 v28 = 2048;
    __int16 v29 = a3;
    __int16 v30 = 1024;
    unsigned int v31 = a4;
    _os_log_debug_impl(&dword_21861F000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
  }
  int v11 = 0;
  if (!a2 && a3) {
    int v11 = pci::transport::bh::marshalTimesyncResults(*(pci::transport::bh **)(v8 + 24), a3, a4);
  }
  BOOL v12 = *(NSObject **)(v8 + 48);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN3pci9transport2th13timesyncAsyncE22PCITransportTimeDomainjU13block_pointerFvijP31PCITransportTimesyncMeasurementE_block_invoke_46;
  block[3] = &unk_26432DA58;
  uint64_t v13 = *(void *)(a1 + 32);
  int v16 = a2;
  int v17 = v11;
  void block[4] = v13;
  void block[5] = a3;
  dispatch_async(v12, block);
}

void ___ZN3pci9transport2th13timesyncAsyncE22PCITransportTimeDomainjU13block_pointerFvijP31PCITransportTimesyncMeasurementE_block_invoke_46(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(uint64_t, void, void, void))(v2 + 16))(v2, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(void *)(a1 + 40));
  }
  if (!*(_DWORD *)(a1 + 48))
  {
    uint64_t v3 = *(void **)(a1 + 40);
    if (v3)
    {
      free(v3);
    }
  }
}

BOOL pci::transport::th::registerTimeEvent(uint64_t a1, uint64_t a2, NSObject *a3)
{
  v28[2] = *(dispatch_object_t *)MEMORY[0x263EF8340];
  uint64_t v6 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v14 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)__int16 v26 = 136316418;
    *(void *)&v26[4] = "th";
    *(_WORD *)&v26[12] = 2048;
    *(void *)&v26[14] = a1;
    *(_WORD *)&v26[22] = 1024;
    LODWORD(v27) = v14;
    WORD2(v27) = 2080;
    *(void *)((char *)&v27 + 6) = "registerTimeEvent";
    HIWORD(v27) = 1024;
    LODWORD(v28[0]) = a2;
    WORD2(v28[0]) = 2048;
    *(dispatch_object_t *)((char *)v28 + 6) = a3;
    _os_log_debug_impl(&dword_21861F000, v7, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: domain %u, cb %p", v26, 0x36u);
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  *(void *)__int16 v26 = 0;
  *(void *)&v26[8] = v26;
  *(void *)&v26[16] = 0x3002000000;
  *(void *)&long long v27 = __Block_byref_object_copy__51;
  uint64_t v8 = *(NSObject **)(a1 + 48);
  *((void *)&v27 + 1) = __Block_byref_object_dispose__52;
  v28[0] = v8;
  if (v8) {
    dispatch_retain(v8);
  }
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 0x40000000;
  uint8_t v15[2] = ___ZN3pci9transport2th17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke;
  v15[3] = &unk_26432DAD0;
  v15[4] = a3;
  v15[5] = v26;
  int v9 = pci::transport::bh::registerTimeEvent(*(void *)(a1 + 24), a2, (uint64_t)v15);
  if (v9)
  {
    uint64_t v10 = (pci::log *)_TelephonyUtilDebugPrintError();
    int v11 = pci::log::get(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)int buf = 136316162;
      int v17 = "th";
      __int16 v18 = 2048;
      uint64_t v19 = a1;
      __int16 v20 = 1024;
      int v21 = v12;
      __int16 v22 = 2080;
      int v23 = "registerTimeEvent";
      __int16 v24 = 1024;
      int v25 = v9;
      _os_log_impl(&dword_21861F000, v11, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to register time event 0x%08x", buf, 0x2Cu);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)a1);
  _Block_object_dispose(v26, 8);
  if (v28[0]) {
    dispatch_release(v28[0]);
  }
  return v9 == 0;
}

void sub_218636198(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  uint64_t v3 = *(NSObject **)(v1 - 88);
  if (v3) {
    dispatch_release(v3);
  }
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__51(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __Block_byref_object_dispose__52(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

void ___ZN3pci9transport2th17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke(uint64_t a1, long long *a2)
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3802000000;
  v4[3] = __Block_byref_object_copy__53;
  v4[4] = __Block_byref_object_dispose__54;
  long long v5 = *a2;
  uint64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 0x40000000;
  block[2] = ___ZN3pci9transport2th17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke_55;
  block[3] = &unk_26432DAA8;
  void block[4] = *(void *)(a1 + 32);
  void block[5] = v4;
  dispatch_async(v2, block);
  _Block_object_dispose(v4, 8);
}

__n128 __Block_byref_object_copy__53(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

uint64_t ___ZN3pci9transport2th17registerTimeEventE22PCITransportTimeDomainU13block_pointerFvP21PCITransportTimeEventE_block_invoke_55(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 8) + 40);
}

BOOL pci::transport::th::deregisterTimeEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v4 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  long long v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v11 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)int buf = 136316162;
    uint64_t v13 = "th";
    __int16 v14 = 2048;
    uint64_t v15 = a1;
    __int16 v16 = 1024;
    int v17 = v11;
    __int16 v18 = 2080;
    uint64_t v19 = "deregisterTimeEvent";
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_debug_impl(&dword_21861F000, v5, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: domain %u", buf, 0x2Cu);
  }
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  int v6 = pci::transport::bh::deregisterTimeEvent(*(void *)(a1 + 24), a2);
  if (v6)
  {
    uint64_t v7 = (pci::log *)_TelephonyUtilDebugPrintError();
    uint64_t v8 = pci::log::get(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)int buf = 136316162;
      uint64_t v13 = "th";
      __int16 v14 = 2048;
      uint64_t v15 = a1;
      __int16 v16 = 1024;
      int v17 = v9;
      __int16 v18 = 2080;
      uint64_t v19 = "deregisterTimeEvent";
      __int16 v20 = 1024;
      int v21 = v6;
      _os_log_impl(&dword_21861F000, v8, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: failed to deregister time event 0x%08x", buf, 0x2Cu);
    }
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)a1);
  return v6 == 0;
}

void pci::transport::th::mapRegionAsync(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  int v12 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v13 = pci::log::get(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v23 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)__int16 v26 = 136316930;
    long long v27 = "th";
    LOWORD(v28) = 2048;
    *(void *)((char *)&v28 + 2) = a1;
    WORD5(v28) = 1024;
    HIDWORD(v28) = v23;
    __int16 v29 = 2080;
    *(void *)__int16 v30 = "mapRegionAsync";
    *(_WORD *)&v30[8] = 1024;
    *(_DWORD *)&v30[10] = a2;
    *(_WORD *)&v30[14] = 2048;
    *(void *)&v30[16] = a3;
    *(_WORD *)&v30[24] = 1024;
    *(_DWORD *)&v30[26] = a4;
    *(_WORD *)&v30[30] = 2048;
    *(void *)&v30[32] = a7;
    _os_log_debug_impl(&dword_21861F000, v13, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: region %u, buffer %p, length %u, cb %p", v26, 0x46u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th14mapRegionAsyncE21PCITransportMemRegionPvjS3_jU13block_pointerFviE_block_invoke;
  aBlock[3] = &unk_26432DB20;
  int v25 = a2;
  aBlock[4] = a7;
  void aBlock[5] = a1;
  __int16 v14 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  memset(&v30[2], 0, 32);
  if (v14) {
    uint64_t v15 = _Block_copy(v14);
  }
  else {
    uint64_t v15 = 0;
  }
  *(_DWORD *)__int16 v26 = *(_DWORD *)(a1 + 40);
  long long v27 = 0;
  long long v28 = 0uLL;
  if (v15) {
    __int16 v16 = _Block_copy(v15);
  }
  else {
    __int16 v16 = 0;
  }
  int v17 = *(const void **)&v30[2];
  *(void *)&v30[2] = v16;
  if (v17) {
    _Block_release(v17);
  }
  os_unfair_lock_t v19 = *(os_unfair_lock_t *)a1;
  uint64_t v18 = *(void *)(a1 + 8);
  if (v18) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v18 + 8), 1uLL, memory_order_relaxed);
  }
  __int16 v20 = *(std::__shared_weak_count **)&v30[18];
  *(void *)&v30[10] = v19;
  *(void *)&v30[18] = v18;
  if (v20) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v20);
  }
  uint64_t v21 = *(void *)(a1 + 16);
  if (v21) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  uint64_t v22 = *(NSObject **)&v30[26];
  *(void *)&v30[26] = v21;
  if (v22) {
    dispatch_release(v22);
  }
  if (v15) {
    _Block_release(v15);
  }
  pci::transport::task::create();
}

void sub_21863687C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,std::__shared_weak_count *a21)
{
  if (a21) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a21);
  }
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)(v22 - 176));
  if (v21) {
    _Block_release(v21);
  }
  _Unwind_Resume(a1);
}

void ___ZN3pci9transport2th14mapRegionAsyncE21PCITransportMemRegionPvjS3_jU13block_pointerFviE_block_invoke(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v8 = *(void *)(a1 + 40);
  int v9 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v10 = pci::log::get(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v13 = *(_DWORD *)(v8 + 40);
    int v14 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)int buf = 136316930;
    uint64_t v18 = "th";
    __int16 v19 = 2048;
    uint64_t v20 = v8;
    __int16 v21 = 1024;
    int v22 = v13;
    __int16 v23 = 2080;
    __int16 v24 = "mapRegionAsync_block_invoke";
    __int16 v25 = 1024;
    int v26 = a2;
    __int16 v27 = 1024;
    int v28 = v14;
    __int16 v29 = 2048;
    uint64_t v30 = a3;
    __int16 v31 = 1024;
    int v32 = a4;
    _os_log_debug_impl(&dword_21861F000, v10, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, region %u, buff %p, size %u", buf, 0x42u);
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11)
  {
    int v12 = *(NSObject **)(v8 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN3pci9transport2th14mapRegionAsyncE21PCITransportMemRegionPvjS3_jU13block_pointerFviE_block_invoke_64;
    block[3] = &unk_26432DAF8;
    void block[4] = v11;
    int v16 = a2;
    dispatch_async(v12, block);
  }
}

uint64_t ___ZN3pci9transport2th14mapRegionAsyncE21PCITransportMemRegionPvjS3_jU13block_pointerFviE_block_invoke_64(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void pci::transport::th::unmapRegionAsync(uint64_t a1, int a2, uint64_t a3)
{
  *(void *)&v24[21] = *MEMORY[0x263EF8340];
  int v6 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  uint64_t v7 = pci::log::get(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v17 = *(_DWORD *)(a1 + 40);
    *(_DWORD *)uint64_t v20 = 136316418;
    __int16 v21 = "th";
    LOWORD(v22) = 2048;
    *(void *)((char *)&v22 + 2) = a1;
    WORD5(v22) = 1024;
    HIDWORD(v22) = v17;
    __int16 v23 = 2080;
    *(void *)__int16 v24 = "unmapRegionAsync";
    v24[4] = 1024;
    *(_DWORD *)&v24[5] = a2;
    v24[7] = 2048;
    *(void *)&v24[8] = a3;
    _os_log_debug_impl(&dword_21861F000, v7, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: region %u, cb %p", v20, 0x36u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th16unmapRegionAsyncE21PCITransportMemRegionU13block_pointerFviE_block_invoke;
  aBlock[3] = &unk_26432DB70;
  int v19 = a2;
  aBlock[4] = a3;
  void aBlock[5] = a1;
  uint64_t v8 = _Block_copy(aBlock);
  os_unfair_lock_lock(*(os_unfair_lock_t *)a1);
  memset(&v24[1], 0, 32);
  if (v8) {
    int v9 = _Block_copy(v8);
  }
  else {
    int v9 = 0;
  }
  *(_DWORD *)uint64_t v20 = *(_DWORD *)(a1 + 40);
  __int16 v21 = 0;
  long long v22 = 0uLL;
  if (v9) {
    uint64_t v10 = _Block_copy(v9);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(const void **)&v24[1];
  *(void *)&v24[1] = v10;
  if (v11) {
    _Block_release(v11);
  }
  os_unfair_lock_t v13 = *(os_unfair_lock_t *)a1;
  uint64_t v12 = *(void *)(a1 + 8);
  if (v12) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v12 + 8), 1uLL, memory_order_relaxed);
  }
  int v14 = *(std::__shared_weak_count **)&v24[9];
  *(void *)&v24[5] = v13;
  *(void *)&v24[9] = v12;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15) {
    dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  }
  int v16 = *(NSObject **)&v24[13];
  *(void *)&v24[13] = v15;
  if (v16) {
    dispatch_release(v16);
  }
  if (v9) {
    _Block_release(v9);
  }
  pci::transport::task::create();
}

void sub_218636E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, std::__shared_weak_count *a19)
{
  if (a19) {
    std::__shared_weak_count::__release_shared[abi:ne180100](a19);
  }
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)(v20 - 144));
  if (v19) {
    _Block_release(v19);
  }
  _Unwind_Resume(a1);
}

void ___ZN3pci9transport2th16unmapRegionAsyncE21PCITransportMemRegionU13block_pointerFviE_block_invoke(uint64_t a1, int a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  long long v5 = (pci::log *)_TelephonyUtilDebugPrintVerbose();
  int v6 = pci::log::get(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v9 = *(_DWORD *)(v4 + 40);
    int v10 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)int buf = 136316418;
    int v14 = "th";
    __int16 v15 = 2048;
    uint64_t v16 = v4;
    __int16 v17 = 1024;
    int v18 = v9;
    __int16 v19 = 2080;
    uint64_t v20 = "unmapRegionAsync_block_invoke";
    __int16 v21 = 1024;
    int v22 = a2;
    __int16 v23 = 1024;
    int v24 = v10;
    _os_log_debug_impl(&dword_21861F000, v6, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: status 0x%x, region %u", buf, 0x32u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(v4 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN3pci9transport2th16unmapRegionAsyncE21PCITransportMemRegionU13block_pointerFviE_block_invoke_70;
    block[3] = &unk_26432DB48;
    void block[4] = v7;
    int v12 = a2;
    dispatch_async(v8, block);
  }
}

uint64_t ___ZN3pci9transport2th16unmapRegionAsyncE21PCITransportMemRegionU13block_pointerFviE_block_invoke_70(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t pci::transport::th::unblockRead(os_unfair_lock_t *this)
{
  uint64_t v2 = (pci::log *)_TelephonyUtilDebugPrint();
  uint64_t v3 = pci::log::get(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::unblockRead();
  }
  if (!*((unsigned char *)this + 74))
  {
    os_unfair_lock_lock(*this);
    uint64_t v4 = (pci::transport::th *)this[17];
    if (v4 != (pci::transport::th *)(this + 16))
    {
      do
      {
        int v6 = (pci::transport::th *)*((void *)v4 + 1);
        long long v5 = (pci::transport::task *)*((void *)v4 + 2);
        uint64_t v7 = (std::__shared_weak_count *)*((void *)v4 + 3);
        if (v7) {
          atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
        }
        if (pci::transport::task::getType(v5) == 2) {
          pci::transport::task::poison(v5, -536870165);
        }
        if (v7) {
          std::__shared_weak_count::__release_shared[abi:ne180100](v7);
        }
        uint64_t v4 = v6;
      }
      while (v6 != (pci::transport::th *)(this + 16));
    }
    os_unfair_lock_unlock(*this);
  }
  return 1;
}

void sub_218637160(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  _Unwind_Resume(exception_object);
}

BOOL pci::transport::th::flushRead(pci::transport::th *this)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  uint64_t v2 = (_DWORD *)((char *)this + 40);
  uint64_t v3 = (pci::log *)_TelephonyUtilDebugPrint();
  uint64_t v4 = pci::log::get(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    pci::transport::th::flushRead();
  }
  uint64_t v39 = 0;
  __int16 v40 = &v39;
  uint64_t v41 = 0x2000000000;
  int v42 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3002000000;
  v37[3] = __Block_byref_object_copy__1;
  v37[4] = __Block_byref_object_dispose__1;
  dispatch_object_t v38 = dispatch_semaphore_create(0);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = ___ZN3pci9transport2th9flushReadEv_block_invoke;
  aBlock[3] = &unk_26432DB98;
  void aBlock[5] = v37;
  void aBlock[6] = this;
  aBlock[4] = &v39;
  long long v5 = _Block_copy(aBlock);
  clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  if (!*((_DWORD *)v40 + 6))
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)this);
    if (v5) {
      int v6 = _Block_copy(v5);
    }
    else {
      int v6 = 0;
    }
    uint64_t v35 = v6;
    pci::transport::th::readInternal((uint64_t)this, 0, 0x2000, 0, &v35);
  }
  uint64_t v31 = 0;
  int v32 = &v31;
  uint64_t v33 = 0x2000000000;
  char v34 = 1;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x3002000000;
  int v28 = __Block_byref_object_copy__75;
  __int16 v29 = __Block_byref_object_dispose__76;
  dispatch_object_t v30 = dispatch_group_create();
  os_unfair_lock_lock(*(os_unfair_lock_t *)this);
  *(_OWORD *)__int16 v23 = 0u;
  *(_OWORD *)dispatch_object_t object = 0u;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 0x40000000;
  v20[2] = ___ZN3pci9transport2th9flushReadEv_block_invoke_77;
  void v20[3] = &unk_26432DBC0;
  uint8_t v20[4] = &v31;
  v20[5] = &v25;
  uint64_t v7 = _Block_copy(v20);
  uint64_t v8 = v7;
  v21[0] = *v2;
  *(_OWORD *)&v21[1] = 0uLL;
  uint64_t v22 = 0;
  if (v7) {
    int v9 = _Block_copy(v7);
  }
  else {
    int v9 = 0;
  }
  int v10 = v23[0];
  v23[0] = v9;
  if (v10) {
    _Block_release(v10);
  }
  os_unfair_lock_t v12 = *(os_unfair_lock_t *)this;
  uint64_t v11 = *((void *)this + 1);
  if (v11) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
  }
  os_unfair_lock_t v13 = (std::__shared_weak_count *)object[0];
  v23[1] = v12;
  object[0] = (dispatch_object_t)v11;
  if (v13) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v13);
  }
  int v14 = *((void *)this + 2);
  if (v14) {
    dispatch_retain(*((dispatch_object_t *)this + 2));
  }
  __int16 v15 = object[1];
  object[1] = v14;
  if (v15) {
    dispatch_release(v15);
  }
  if (v8) {
    _Block_release(v8);
  }
  if (*((unsigned char *)v32 + 24))
  {
    dispatch_group_enter((dispatch_group_t)v26[5]);
    pci::transport::task::create();
  }
  os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
  uint64_t v16 = v26[5];
  dispatch_time_t v17 = dispatch_time(0, 2000000000);
  if (dispatch_group_wait(v16, v17))
  {
    os_unfair_lock_lock(*(os_unfair_lock_t *)this);
    os_unfair_lock_unlock(*(os_unfair_lock_t *)this);
    dispatch_group_wait((dispatch_group_t)v26[5], 0xFFFFFFFFFFFFFFFFLL);
  }
  if (*((unsigned char *)v32 + 24))
  {
    if (*((unsigned char *)this + 74) && *((_DWORD *)this + 19)) {
      pci::transport::th::readAsync((os_unfair_lock_t *)this);
    }
    int v18 = 1;
  }
  else
  {
    int v18 = 0;
  }
  if (object[1]) {
    dispatch_release(object[1]);
  }
  if (object[0]) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)object[0]);
  }
  if (v23[0]) {
    _Block_release(v23[0]);
  }
  _Block_object_dispose(&v25, 8);
  if (v30) {
    dispatch_release(v30);
  }
  _Block_object_dispose(&v31, 8);
  if (v5) {
    _Block_release(v5);
  }
  _Block_object_dispose(v37, 8);
  if (v38) {
    dispatch_release(v38);
  }
  _Block_object_dispose(&v39, 8);
  return v18 != 0;
}

void sub_2186378E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,dispatch_object_t object,char a37)
{
  pci::transport::task::parameters::~parameters((pci::transport::task::parameters *)&a23);
  _Block_object_dispose(&a31, 8);
  if (object)
  {
    dispatch_release(object);
    if (!v39)
    {
LABEL_3:
      if (!v38)
      {
LABEL_5:
        _Block_object_dispose(&a37, 8);
        if (v37) {
          _Block_release(v37);
        }
        pci::transport::th::flushRead((const void *)(v41 - 256), (dispatch_object_t *)(v40 + 40));
        _Block_object_dispose((const void *)(v41 - 208), 8);
        _Unwind_Resume(a1);
      }
LABEL_4:
      std::__shared_weak_count::__release_shared[abi:ne180100](v38);
      goto LABEL_5;
    }
  }
  else if (!v39)
  {
    goto LABEL_3;
  }
  std::__shared_weak_count::__release_shared[abi:ne180100](v39);
  if (!v38) {
    goto LABEL_5;
  }
  goto LABEL_4;
}

intptr_t ___ZN3pci9transport2th9flushReadEv_block_invoke(void *a1, int a2, void *a3, int a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v5 = a1[6];
  *(_DWORD *)(*(void *)(a1[4] + 8) + 2os_unfair_lock_unlock(this + 4) = a2;
  if (a2 != -536870165)
  {
    if (!a2) {
      goto LABEL_6;
    }
    int v9 = (pci::log *)_TelephonyUtilDebugPrintError();
    int v10 = pci::log::get(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = *(_DWORD *)(v5 + 40);
      *(_DWORD *)int buf = 136316674;
      int v14 = "th";
      __int16 v15 = 2048;
      uint64_t v16 = v5;
      __int16 v17 = 1024;
      int v18 = v11;
      __int16 v19 = 2080;
      uint64_t v20 = "flushRead_block_invoke";
      __int16 v21 = 1024;
      int v22 = a2;
      __int16 v23 = 2048;
      int v24 = a3;
      __int16 v25 = 1024;
      int v26 = a4;
      _os_log_impl(&dword_21861F000, v10, OS_LOG_TYPE_INFO, "%s::%p::%d::%s: status 0x%x, buff %p, size %u", buf, 0x3Cu);
    }
    if (!a2) {
LABEL_6:
    }
      free(a3);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1[5] + 8) + 40));
}

void __Block_byref_object_copy__75(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(NSObject **)(a2 + 40);
  *(void *)(a1 + 40) = v3;
  if (v3) {
    dispatch_retain(v3);
  }
}

void __Block_byref_object_dispose__76(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 40);
  if (v1) {
    dispatch_release(v1);
  }
}

void ___ZN3pci9transport2th9flushReadEv_block_invoke_77(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (a2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(v2 + 24) == 0;
  }
  char v4 = !v3;
  *(unsigned char *)(v2 + 2os_unfair_lock_unlock(this + 4) = v4;
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t *getPciTransportToDirectionMap(void)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  {
    memcpy(__dst, &unk_21863C348, sizeof(__dst));
    std::map<PCITransportInterface,PCITransportDirection>::map[abi:ne180100]((uint64_t)&v2, __dst, 34);
    uint64_t v1 = v3;
    getPciTransportToDirectionMap(void)::sMap = (uint64_t)v2;
    qword_26AB338F0 = v3;
    qword_26AB338F8 = v4;
    if (v4)
    {
      v3[2] = &qword_26AB338F0;
      uint64_t v2 = &v3;
      BOOL v3 = 0;
      uint64_t v4 = 0;
      uint64_t v1 = 0;
    }
    else
    {
      getPciTransportToDirectionMap(void)::sMap = (uint64_t)&qword_26AB338F0;
    }
    std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy((uint64_t)&v2, v1);
  }
  return &getPciTransportToDirectionMap(void)::sMap;
}

void sub_218637CF0(_Unwind_Exception *a1)
{
}

uint64_t *std::map<PCITransportInterface,PCITransportDirection>::at(uint64_t a1, int *a2)
{
  uint64_t v2 = *(uint64_t **)(a1 + 8);
  if (!v2) {
LABEL_8:
  }
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  int v3 = *a2;
  while (1)
  {
    while (1)
    {
      int v4 = *((_DWORD *)v2 + 7);
      if (v3 >= v4) {
        break;
      }
      uint64_t v2 = (uint64_t *)*v2;
      if (!v2) {
        goto LABEL_8;
      }
    }
    if (v4 >= v3) {
      return v2 + 4;
    }
    uint64_t v2 = (uint64_t *)v2[1];
    if (!v2) {
      goto LABEL_8;
    }
  }
}

uint64_t std::map<PCITransportInterface,PCITransportDirection>::map[abi:ne180100](uint64_t a1, int *a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  int v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 8 * a3;
    do
    {
      std::__tree<std::__value_type<PCITransportRegister,unsigned int>,std::__map_value_compare<PCITransportRegister,std::__value_type<PCITransportRegister,unsigned int>,std::less<PCITransportRegister>,true>,std::allocator<std::__value_type<PCITransportRegister,unsigned int>>>::__emplace_hint_unique_key_args<PCITransportRegister,std::pair<PCITransportRegister const,unsigned int> const&>((uint64_t **)a1, v4, a2, (uint64_t *)a2);
      a2 += 2;
      v6 -= 8;
    }
    while (v6);
  }
  return a1;
}

void sub_218637DC8(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<char const*,pci::transport::kernel::variant>,std::__map_value_compare<char const*,std::__value_type<char const*,pci::transport::kernel::variant>,std::less<char const*>,true>,std::allocator<std::__value_type<char const*,pci::transport::kernel::variant>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26432D2F0, MEMORY[0x263F8C068]);
}

void sub_218637E28(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  __n128 result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C390] + 16);
  return result;
}

void std::shared_ptr<pci::transport::th>::shared_ptr[abi:ne180100]<pci::transport::th,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_218637EE4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<pci::transport::th>::reset[abi:ne180100]((pci::transport::th **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<pci::transport::th *,std::shared_ptr<pci::transport::th>::__shared_ptr_default_delete<pci::transport::th,pci::transport::th>,std::allocator<pci::transport::th>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D46F100);
}

pci::transport::th *std::__shared_ptr_pointer<pci::transport::th *,std::shared_ptr<pci::transport::th>::__shared_ptr_default_delete<pci::transport::th,pci::transport::th>,std::allocator<pci::transport::th>>::__on_zero_shared(uint64_t a1)
{
  __n128 result = *(pci::transport::th **)(a1 + 24);
  if (result)
  {
    pci::transport::th::~th(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<pci::transport::th *,std::shared_ptr<pci::transport::th>::__shared_ptr_default_delete<pci::transport::th,pci::transport::th>,std::allocator<pci::transport::th>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::transport::th *std::unique_ptr<pci::transport::th>::reset[abi:ne180100](pci::transport::th **a1, pci::transport::th *a2)
{
  __n128 result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::transport::th::~th(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

void std::__shared_ptr_emplace<os_unfair_lock_s>::~__shared_ptr_emplace(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9BAE88;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void std::__shared_ptr_emplace<os_unfair_lock_s>::~__shared_ptr_emplace(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)&unk_26C9BAE88;
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D46F100);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

uint64_t pci::transport::bind::setCIO(uint64_t this, void *a2)
{
  *(void *)(this + 8) = a2;
  return this;
}

uint64_t pci::transport::bind::setStatus(uint64_t result, int a2, int a3, int a4, char a5, int a6)
{
  *(_DWORD *)(result + 16) = a3;
  *(_DWORD *)(result + 6os_unfair_lock_unlock(this + 4) = a2;
  *(_DWORD *)(result + 68) = a4;
  if ((a5 & 1) == 0 && (a2 || a6 == 3))
  {
    *(void *)(result + 8) = 0;
    *(_DWORD *)(result + 16) = 0;
  }
  return result;
}

uint64_t pci::transport::bind::getCIO(pci::transport::bind *this)
{
  return *((void *)this + 1);
}

uint64_t pci::transport::bind::getSize(pci::transport::bind *this)
{
  return *((unsigned int *)this + 4);
}

void pci::transport::bind::parameters::~parameters(pci::transport::bind::parameters *this)
{
  uint64_t v2 = (std::__shared_weak_count *)*((void *)this + 5);
  if (v2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v2);
  }
  int v3 = *((void *)this + 3);
  if (v3) {
    dispatch_release(v3);
  }
}

uint64_t pci::transport::task::poison(pci::transport::task *this, int a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  os_unfair_lock_assert_owner(*((const os_unfair_lock **)this + 4));
  getTypeString(*((_DWORD *)this + 5));
  uint64_t v4 = (pci::log *)_TelephonyUtilDebugPrint();
  uint64_t v5 = pci::log::get(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v14 = *((_DWORD *)this + 4);
    TypeString = getTypeString(*((_DWORD *)this + 5));
    *(_DWORD *)int buf = 136316418;
    __int16 v17 = "task";
    __int16 v18 = 2048;
    __int16 v19 = this;
    __int16 v20 = 1024;
    int v21 = v14;
    __int16 v22 = 2080;
    __int16 v23 = "poison";
    __int16 v24 = 2080;
    __int16 v25 = TypeString;
    __int16 v26 = 1024;
    int v27 = a2;
    _os_log_debug_impl(&dword_21861F000, v5, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %s: status 0x%x", buf, 0x36u);
  }
  uint64_t result = *((void *)this + 9);
  if (result)
  {
    int v7 = *((unsigned __int8 *)this + 48);
    int v8 = *((_DWORD *)this + 5);
    *(_DWORD *)(result + 16) = 0;
    *(_DWORD *)(result + 6os_unfair_lock_unlock(this + 4) = a2;
    *(_DWORD *)(result + 68) = -1;
    if (!v7 && (a2 || v8 == 3)) {
      *(void *)(result + 8) = 0;
    }
    pci::transport::bind::~bind((pci::transport::bind *)result);
    uint64_t result = MEMORY[0x21D46F100](v9, 0x10A0C40F1E767F4, v10, v11, v12, v13);
    *((void *)this + 9) = 0;
  }
  return result;
}

uint64_t pci::transport::task::getType(pci::transport::task *this)
{
  return *((unsigned int *)this + 5);
}

void std::__shared_ptr_pointer<pci::transport::task *,std::shared_ptr<pci::transport::task>::__shared_ptr_default_delete<pci::transport::task,pci::transport::task>,std::allocator<pci::transport::task>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);

  JUMPOUT(0x21D46F100);
}

uint64_t std::__shared_ptr_pointer<pci::transport::task *,std::shared_ptr<pci::transport::task>::__shared_ptr_default_delete<pci::transport::task,pci::transport::task>,std::allocator<pci::transport::task>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

pci::transport::task *std::unique_ptr<pci::transport::task>::reset[abi:ne180100](pci::transport::task **a1, pci::transport::task *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    pci::transport::task::~task(result);
    JUMPOUT(0x21D46F100);
  }
  return result;
}

void pci::system::info::info(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_21861F000, log, OS_LOG_TYPE_DEBUG, "", v1, 2u);
}

void pci::system::info::eraseTH()
{
  __assert_rtn("eraseTH", "PCISystem.cpp", 96, "it != mth.end()");
}

void pci::system::info::removeBH()
{
  __assert_rtn("removeBH", "PCISystem.cpp", 213, "it != mbh.end()");
}

void pci::system::info::removeBH(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = 136316162;
  uint64_t v4 = "system";
  __int16 v5 = 2048;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = a2;
  __int16 v9 = 2080;
  uint64_t v10 = "removeBH";
  __int16 v11 = 1024;
  int v12 = a2;
  _os_log_debug_impl(&dword_21861F000, log, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: %u", (uint8_t *)&v3, 0x2Cu);
}

void TelephonyBasebandPCITransportFree()
{
}

void TelephonyBasebandPCITransportWrite()
{
}

void TelephonyBasebandPCITransportRead()
{
}

void TelephonyBasebandPCITransportSendImage()
{
}

void TelephonyBasebandPCITransportReadRegister()
{
}

void TelephonyBasebandPCITransportUnblockRead()
{
}

void TelephonyBasebandPCITransportFlushRead()
{
}

void TelephonyBasebandPCITransportIsValid()
{
}

void TelephonyBasebandPCITransportTimesync_cold_1()
{
}

void TelephonyBasebandPCITransportRegisterTimeEvent_cold_1()
{
}

void TelephonyBasebandPCITransportDeregisterTimeEvent_cold_1()
{
}

void TelephonyBasebandPCITransportMapRegion_cold_1()
{
}

void TelephonyBasebandPCITransportMapRegionwithClientData_cold_1()
{
}

void TelephonyBasebandPCITransportUnmapRegion_cold_1()
{
}

void abpKernel::abortChannelAsync()
{
  __assert_rtn("abortChannelAsync", "PCITransportKernel.cpp", 306, "dir == kPCITransportDirectionIn || dir == kPCITransportDirectionOut");
}

void abpKernel::startChannelAsync()
{
  __assert_rtn("startChannelAsync", "PCITransportKernel.cpp", 313, "dir == kPCITransportDirectionIn || dir == kPCITransportDirectionOut");
}

void acipcKernel::abortChannelAsync()
{
}

{
  __assert_rtn("abortChannelAsync", "PCITransportKernel.cpp", 916, "!fRunLoopRef");
}

void acipcKernel::startChannelAsync()
{
}

{
  __assert_rtn("startChannelAsync", "PCITransportKernel.cpp", 945, "!fRunLoopRef");
}

void pci::transport::bh::init()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "init";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
}

void pci::transport::bh::bh()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  LODWORD(vos_unfair_lock_unlock(this + 4) = 136315906;
  *(void *)((char *)&v4 + os_unfair_lock_unlock(this + 4) = "bh";
  WORD6(vos_unfair_lock_unlock(this + 4) = 2048;
  HIWORD(vos_unfair_lock_unlock(this + 4) = v0;
  LODWORD(v5) = v1;
  WORD2(v5) = 2080;
  *(void *)((char *)&v5 + 6) = "bh";
  OUTLINED_FUNCTION_1(&dword_21861F000, v2, v3, "%s::%p::%d::%s: ", (const char *)v4, *((const void **)&v4 + 1), v0 >> 16, (const char *)v5);
}

void pci::transport::bh::~bh()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "~bh";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: --done", v2, v3, v4, *(const char **)v5);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  unsigned char v5[14];

  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "~bh";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: fRegistered\n", v2, v3, v4, *(const char **)v5);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  unsigned char v5[14];

  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "~bh";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_21_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "init_block_invoke";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: interface added", v2, v3, v4, *(const char **)v5);
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25_cold_1()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "init_block_invoke";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: notify interface removed", v2, v3, v4, *(const char **)v5);
}

void ___ZN3pci9transport2bh4initERKNS1_10parametersE_block_invoke_25_cold_2()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "init_block_invoke";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: interface removed", v2, v3, v4, *(const char **)v5);
}

void pci::transport::bh::setNotify()
{
}

void pci::transport::bh::generateCallback(std::__shared_weak_count **a1, void *a2, const void *a3, void *a4)
{
  __int16 v7 = *a1;
  if (v7) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v7);
  }
  _Block_object_dispose(a2, 8);
  _Block_object_dispose(a3, 8);
  _Block_object_dispose(a4, 8);
  int v8 = (std::__shared_weak_count *)a4[6];
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
}

void ___ZN3pci9transport2bh16generateCallbackENSt3__110shared_ptrINS0_4taskEEEPKcb_block_invoke_cold_1()
{
}

void pci::transport::bh::cmdCompletion()
{
}

void pci::transport::bh::ioCompletion()
{
}

void pci::transport::bh::imageCompletion()
{
}

void pci::transport::bh::eventNotification()
{
}

void ___ZN3pci9transport2bh19deregisterTimeEventE22PCITransportTimeDomain_block_invoke_cold_1()
{
}

uint64_t pci::event::Listener::Listener(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

void pci::event::Listener::notifyPDP(unint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v6 = 136315650;
  PDPMessageTypeString = pci::event::getPDPMessageTypeString(a1);
  __int16 v8 = 1024;
  int PDPMessageTypeValue = pci::event::getPDPMessageTypeValue(a1);
  __int16 v10 = 2048;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_21861F000, a3, OS_LOG_TYPE_DEBUG, "%s (%#x), arg %p", (uint8_t *)&v6, 0x1Cu);
}

void pci::event::PDPListener::setEventNotificationPort()
{
}

void pci::transport::th::init()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "init";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
}

void pci::transport::th::th()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  LODWORD(vos_unfair_lock_unlock(this + 4) = 136315906;
  *(void *)((char *)&v4 + os_unfair_lock_unlock(this + 4) = "th";
  WORD6(vos_unfair_lock_unlock(this + 4) = 2048;
  HIWORD(vos_unfair_lock_unlock(this + 4) = v0;
  LODWORD(v5) = v1;
  WORD2(v5) = 2080;
  *(void *)((char *)&v5 + 6) = "th";
  OUTLINED_FUNCTION_1(&dword_21861F000, v2, v3, "%s::%p::%d::%s: ", (const char *)v4, *((const void **)&v4 + 1), v0 >> 16, (const char *)v5);
}

void pci::transport::th::th(NSObject **a1, std::__shared_weak_count **a2, dispatch_object_t *a3, uint64_t a4)
{
  __int16 v7 = *a1;
  if (v7) {
    dispatch_release(v7);
  }
  __int16 v8 = *(std::__shared_weak_count **)(a4 + 32);
  if (v8) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
  }
  if (*a3) {
    dispatch_release(*a3);
  }
  if (*a2) {
    std::__shared_weak_count::__release_shared[abi:ne180100](*a2);
  }
}

void pci::transport::th::~th()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "~th";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: --done", v2, v3, v4, *(const char **)v5);
}

{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const void *v3;
  int v4;
  unsigned char v5[14];

  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "~th";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
}

void pci::transport::th::notify()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "notify";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
}

void pci::transport::th::readAsync()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "readAsync";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
}

void pci::transport::th::writeInternal()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_21861F000, v0, v1, "%.*P");
}

void pci::transport::th::unblockRead()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "unblockRead";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
}

void pci::transport::th::flushRead(const void *a1, dispatch_object_t *a2)
{
  if (*a2) {
    dispatch_release(*a2);
  }
}

void pci::transport::th::flushRead()
{
  OUTLINED_FUNCTION_2(*MEMORY[0x263EF8340]);
  int v2 = 136315906;
  OUTLINED_FUNCTION_0();
  *(void *)&v5[6] = "flushRead";
  OUTLINED_FUNCTION_1(&dword_21861F000, v0, v1, "%s::%p::%d::%s: ", v2, v3, v4, *(const char **)v5);
}

void pci::transport::bind::bind(_DWORD *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  int v3 = 136315906;
  int v4 = "bind";
  __int16 v5 = 2048;
  int v6 = a1;
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 2080;
  __int16 v10 = "bind";
  _os_log_debug_impl(&dword_21861F000, a2, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: ", (uint8_t *)&v3, 0x26u);
}

void pci::transport::bind::~bind()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_0();
  int v2 = "~bind";
  _os_log_debug_impl(&dword_21861F000, v0, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: ", (uint8_t *)v1, 0x26u);
}

void pci::transport::task::init()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v1[0] = 136315906;
  OUTLINED_FUNCTION_0();
  int v2 = "init";
  _os_log_debug_impl(&dword_21861F000, v0, OS_LOG_TYPE_DEBUG, "%s::%p::%d::%s: ", (uint8_t *)v1, 0x26u);
}

void getTypeString()
{
}

void pci::transport::task::complete()
{
}

{
  __assert_rtn("complete", "PCITransportTask.cpp", 291, "size <= fSize");
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x270EE4948]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t TelephonyRadiosGetRadio()
{
  return MEMORY[0x270F97160]();
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

uint64_t _TelephonyUtilDebugPrint()
{
  return MEMORY[0x270F97240]();
}

uint64_t _TelephonyUtilDebugPrintBinaryVerbose()
{
  return MEMORY[0x270F97248]();
}

uint64_t _TelephonyUtilDebugPrintError()
{
  return MEMORY[0x270F97250]();
}

uint64_t _TelephonyUtilDebugPrintVerbose()
{
  return MEMORY[0x270F97258]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t getABPErrorTypeString()
{
  return MEMORY[0x270F920E8]();
}

uint64_t getABPLinkStateString()
{
  return MEMORY[0x270F920F0]();
}

uint64_t getACIPCErrorTypeString()
{
  return MEMORY[0x270F92290]();
}

uint64_t getACIPCLinkStateString()
{
  return MEMORY[0x270F92298]();
}

uint64_t getABPAERErrorTypeString()
{
  return MEMORY[0x270F920F8]();
}

uint64_t getACIPCAERErrorTypeString()
{
  return MEMORY[0x270F922A0]();
}

uint64_t IOABPClass::start()
{
  return MEMORY[0x270F92170]();
}

{
  return MEMORY[0x270F92178]();
}

void IOABPClass::IOABPClass(IOABPClass *this)
{
}

void IOABPClass::~IOABPClass(IOABPClass *this)
{
}

uint64_t IOACIPCClass::mapMemoryAsync(IOACIPCClass *this, uint64_t a2, const void *a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8, void (*a9)(void *, int), void *a10)
{
  return MEMORY[0x270F922B0](this, a2, a3, a4, a5, a6, a7);
}

uint64_t IOACIPCClass::getTransferRingInfo(IOACIPCClass *this)
{
  return MEMORY[0x270F922C8](this);
}

uint64_t IOACIPCClass::io()
{
  return MEMORY[0x270F922E0]();
}

uint64_t IOACIPCClass::open(IOACIPCClass *this)
{
  return MEMORY[0x270F922F0](this);
}

uint64_t IOACIPCClass::start()
{
  return MEMORY[0x270F92310]();
}

{
  return MEMORY[0x270F92318]();
}

void IOACIPCClass::IOACIPCClass(IOACIPCClass *this)
{
}

void IOACIPCBBClass::~IOACIPCBBClass(IOACIPCBBClass *this)
{
}

uint64_t IOABPTraceClass::getTraceCode()
{
  return MEMORY[0x270F921B8]();
}

uint64_t IOABPTraceClass::getRegistryInfo()
{
  return MEMORY[0x270F921C8]();
}

void IOABPTraceClass::IOABPTraceClass(IOABPTraceClass *this)
{
}

void IOABPTraceClass::~IOABPTraceClass(IOABPTraceClass *this)
{
}

uint64_t IOABPControlClass::registerEventNotification()
{
  return MEMORY[0x270F92240]();
}

{
  return MEMORY[0x270F92248]();
}

void IOABPControlClass::IOABPControlClass(IOABPControlClass *this)
{
}

void IOABPControlClass::~IOABPControlClass(IOABPControlClass *this)
{
}

uint64_t IOACIPCTraceClass::getTraceCode()
{
  return MEMORY[0x270F92358]();
}

uint64_t IOACIPCTraceClass::getRegistryInfo()
{
  return MEMORY[0x270F92368]();
}

void IOACIPCTraceClass::IOACIPCTraceClass(IOACIPCTraceClass *this)
{
}

void IOACIPCTraceClass::~IOACIPCTraceClass(IOACIPCTraceClass *this)
{
}

uint64_t IOACIPCControlClass::registerEventNotification()
{
  return MEMORY[0x270F923E0]();
}

{
  return MEMORY[0x270F923E8]();
}

uint64_t IOACIPCControlClass::start(IOACIPCControlClass *this, const __CFDictionary *a2)
{
  return MEMORY[0x270F92420](this, a2);
}

void IOACIPCControlClass::IOACIPCControlClass(IOACIPCControlClass *this)
{
}

void IOACIPCControlClass::~IOACIPCControlClass(IOACIPCControlClass *this)
{
}

uint64_t ctu::LogMessageBuffer::takeString(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x270F973E8](this);
}

uint64_t ctu::LogMessageBuffer::LogMessageBuffer(ctu::LogMessageBuffer *this)
{
  return MEMORY[0x270F97410](this);
}

void ctu::LogMessageBuffer::~LogMessageBuffer(ctu::LogMessageBuffer *this)
{
}

uint64_t ctu::cf::assign(ctu::cf *this, int *a2, const __CFNumber *a3)
{
  return MEMORY[0x270F97580](this, a2, a3);
}

uint64_t ctu::operator<<()
{
  return MEMORY[0x270F977A8]();
}

{
  return MEMORY[0x270F977B0]();
}

{
  return MEMORY[0x270F977C8]();
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

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
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
  return MEMORY[0x270F987A8]();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x270ED8EF8](*(void *)&__clock_id);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
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

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x270ED95C8](label);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
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