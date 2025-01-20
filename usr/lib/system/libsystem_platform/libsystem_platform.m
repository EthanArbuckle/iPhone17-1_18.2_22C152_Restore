void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  int v1;
  unsigned int v2;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v2 = atomic_exchange_explicit((atomic_uint *volatile)lock, 0, memory_order_release);
  if (v2 != v1) {
    _os_unfair_lock_unlock_slow((uint64_t)lock, v1, v2);
  }
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  int v1 = 0;
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v1, v2, memory_order_acquire, memory_order_acquire);
  if (v1) {
    _os_unfair_lock_lock_slow((atomic_uint *)lock, 0, 0, v2);
  }
}

unint64_t _platform_strcmp_VARIANT_Base(int8x16_t *a1, int8x16_t *a2)
{
  while ((a1 & 0xF) != 0)
  {
    unsigned int v3 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    uint64_t v2 = v3;
    unsigned int v4 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    uint64_t v5 = v2 - v4;
    if (v2 != v4 || v2 == 0) {
      return v5;
    }
  }
  if ((a2 & 0xF) != 0)
  {
    uint64_t v8 = -(uint64_t)a2 & 0xFF0;
    if (!v8) {
      goto LABEL_12;
    }
LABEL_10:
    while (1)
    {
      int8x16_t v9 = *a1++;
      int8x16_t v10 = v9;
      int8x16_t v11 = *a2++;
      int8x16_t v13 = vceqq_s8(v10, v11);
      uint8x16_t v12 = (uint8x16_t)vandq_s8(v10, v13);
      v13.i8[0] = vminvq_u8(v12);
      if (!v13.i32[0]) {
        break;
      }
      v8 -= 16;
      if (!v8)
      {
LABEL_12:
        while (1)
        {
          unsigned int v15 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          uint64_t v14 = v15;
          unsigned int v16 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          uint64_t v5 = v14 - v16;
          if (v14 != v16 || v14 == 0) {
            return v5;
          }
          if ((a1 & 0xF) == 0)
          {
            uint64_t v8 = 4080;
            goto LABEL_10;
          }
        }
      }
    }
  }
  else
  {
    do
    {
      int8x16_t v18 = *a1++;
      int8x16_t v19 = v18;
      int8x16_t v20 = *a2++;
      int8x16_t v13 = vceqq_s8(v19, v20);
      uint8x16_t v12 = (uint8x16_t)vandq_s8(v19, v13);
      v13.i8[0] = vminvq_u8(v12);
    }
    while (v13.i32[0]);
  }
  uint8x16_t v21 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v12, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_20D751540);
  v21.i8[0] = vminvq_u8(v21);
  return a1[-1].u8[v21.u32[0]] - (unint64_t)a2[-1].u8[v21.u32[0]];
}

unint64_t _platform_memcmp(unint64_t *a1, unint64_t *a2, unint64_t a3)
{
  BOOL v3 = a3 >= 0x10;
  unint64_t v4 = a3 - 16;
  if (!v3)
  {
    BOOL v3 = __CFADD__(v4, 8);
    unint64_t v17 = v4 + 8;
    if (v3)
    {
      unint64_t v19 = *a1++;
      unint64_t v18 = v19;
      unint64_t v21 = *a2++;
      unint64_t v20 = v21;
      unint64_t v22 = v18 - v21;
      if (v18 != v21) {
        goto LABEL_18;
      }
      v17 -= 8;
    }
    BOOL v3 = __CFADD__(v17, 4);
    unint64_t v23 = v17 + 4;
    if (!v3)
    {
      v23 += 4;
      unint64_t v22 = 0;
      goto LABEL_20;
    }
    unsigned int v24 = *(_DWORD *)a1;
    a1 = (unint64_t *)((char *)a1 + 4);
    unint64_t v18 = v24;
    unsigned int v25 = *(_DWORD *)a2;
    a2 = (unint64_t *)((char *)a2 + 4);
    unint64_t v20 = v25;
    unint64_t v22 = v18 - v25;
    if (v18 == v25)
    {
      do
      {
LABEL_20:
        BOOL v3 = v23-- != 0;
        if (!v3) {
          break;
        }
        unsigned int v28 = *(unsigned __int8 *)a1;
        a1 = (unint64_t *)((char *)a1 + 1);
        uint64_t v27 = v28;
        unsigned int v29 = *(unsigned __int8 *)a2;
        a2 = (unint64_t *)((char *)a2 + 1);
        unint64_t v22 = v27 - v29;
      }
      while (v27 == v29);
      return v22;
    }
LABEL_18:
    unint64_t v26 = __clz(bswap64(v22)) & 0xFFFFFFFFFFFFFFF8;
    return (v18 >> v26) - (unint64_t)(v20 >> v26);
  }
  if (v4)
  {
    uint64_t v5 = (unint64_t *)((char *)a1 + v4);
    v6 = (unint64_t *)((char *)a2 + v4);
    while (1)
    {
      int8x16_t v7 = *(int8x16_t *)a1;
      a1 += 2;
      int8x16_t v8 = v7;
      int8x16_t v9 = *(int8x16_t *)a2;
      a2 += 2;
      int8x16_t v10 = vceqq_s8(v8, v9);
      v8.i8[0] = vminvq_u8((uint8x16_t)v10);
      if (!v8.i32[0]) {
        break;
      }
      BOOL v11 = v4 > 0x10;
      v4 -= 16;
      if (!v11)
      {
        a1 = v5;
        a2 = v6;
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    int8x16_t v12 = *(int8x16_t *)a1;
    a1 += 2;
    int8x16_t v13 = v12;
    int8x16_t v14 = *(int8x16_t *)a2;
    a2 += 2;
    int8x16_t v10 = vceqq_s8(v13, v14);
    v13.i8[0] = vminvq_u8((uint8x16_t)v10);
    if (v13.i32[0]) {
      return 0;
    }
  }
  uint8x16_t v16 = (uint8x16_t)vorrq_s8(v10, (int8x16_t)xmmword_20D751640);
  v16.i8[0] = vminvq_u8(v16);
  return *((unsigned __int8 *)a1 + v16.u32[0] - 16) - (unint64_t)*((unsigned __int8 *)a2 + v16.u32[0] - 16);
}

atomic_uint *os_unfair_lock_lock_with_options(atomic_uint *result, int a2)
{
  int v2 = 0;
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v2, v3, memory_order_acquire, memory_order_acquire);
  if (v2) {
    return (atomic_uint *)_os_unfair_lock_lock_slow(result, a2, 0, v3);
  }
  return result;
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  uint32_t os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) != v1) {
    os_unfair_lock_assert_owner_cold_1(os_unfair_lock_opaque);
  }
}

uint64_t _simple_vsprintf(unsigned char *a1, unsigned __int8 *a2, int *a3)
{
  return 0;
}

uint64_t _simple_asl_log(int a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(MEMORY[0x263EF8C48] + 336) != -1) {
    _os_alloc_once((atomic_ullong *)(MEMORY[0x263EF8C48] + 336), 32, (uint64_t)_simple_asl_init_context);
  }
  unsigned __int8 v6 = os_log_simple_type_from_asl(a1);

  return _os_log_simple_shim(v6, a2, a3);
}

uint64_t os_log_simple_type_from_asl(int a1)
{
  unsigned int v1 = a1 & ~(a1 >> 31);
  if (v1 >= 7) {
    unsigned int v1 = 7;
  }
  return os_log_simple_type_from_asl__level2ostype[v1];
}

uint64_t _os_semaphore_dispose(semaphore_t semaphore)
{
  uint64_t result = semaphore_destroy(*MEMORY[0x263EF8C60], semaphore);
  if (result) {
    _os_semaphore_dispose_cold_1(result);
  }
  return result;
}

uint64_t _os_once_gate_broadcast(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = a2 | 1;
  if (result != a3) {
    _os_once_gate_unowned_abort(result);
  }
  if (a2)
  {
    uint64_t v4 = a2;
    qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_267704BC8 = a2;
    __break(1u);
LABEL_9:
    qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_267704BC8 = v4;
    __break(1u);
  }
  else
  {
    while (1)
    {
      uint64_t result = __ulock_wake();
      if ((result & 0x80000000) == 0) {
        break;
      }
      if (result != -4)
      {
        uint64_t v4 = -(int)result;
        if (v4 != 2) {
          goto LABEL_9;
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t _os_once_gate_wait(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t), unsigned int a4)
{
  atomic_ullong v4 = *(void *)result;
  if (*(void *)result != -1)
  {
    int8x16_t v8 = (atomic_ullong *)result;
    unint64_t v9 = a4;
    while ((v4 & 3) != 1)
    {
      if (v4)
      {
        if ((v4 & 0xFFFFFFFFFFFFFFFELL) == v4
          || (atomic_ullong v10 = v4,
              atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v10, v4 & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed), v10 == v4))
        {
          if ((v4 | 1) == a4) {
            _os_once_gate_recursive_abort(a4);
          }
          uint64_t result = __ulock_wait();
          if ((result & 0x80000000) != 0 && result != -4 && -(int)result != 14)
          {
            if (-(int)result == 105) {
              _os_once_gate_corruption_abort(v4);
            }
            qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
            qword_267704BC8 = -(int)result;
            __break(1u);
            return result;
          }
          atomic_ullong v4 = *v8;
        }
        else
        {
          atomic_ullong v4 = v10;
        }
      }
      else
      {
        atomic_ullong v11 = 0;
        atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v11, v9, memory_order_relaxed, memory_order_relaxed);
        if (!v11)
        {
          __dmb(9u);
          return _os_once_callout(v8, a2, a3, a4);
        }
        atomic_ullong v4 = v11;
      }
      if (v4 == -1) {
        return result;
      }
    }
    __dmb(9u);
    if ((unint64_t)(4 * MEMORY[0xFFFFFC180] - v4 - 15) <= 0xFFFFFFFFFFFFFFEFLL) {
      *int8x16_t v8 = -1;
    }
  }
  return result;
}

uint64_t _os_semaphore_create()
{
  kern_return_t v0;
  semaphore_t semaphore;

  v0 = semaphore_create(*MEMORY[0x263EF8C60], &semaphore, 0, 0);
  if (v0)
  {
    if (v0 == -301) {
      _os_semaphore_create_cold_2();
    }
    _os_semaphore_create_cold_1(v0);
  }
  return semaphore;
}

uint64_t __platform_sigaction(int a1)
{
  if ((a1 - 32) >= 0xFFFFFFE1 && a1 != 17 && a1 != 9) {
    return __sigaction();
  }
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

BOOL os_unfair_recursive_lock_tryunlock4objc(atomic_uint *a1)
{
  int v1 = *a1 | 1;
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  if (v1 == v2)
  {
    atomic_uint v3 = a1[1];
    if (v3)
    {
      if ((*a1 | 1) != v1) {
        _os_unfair_lock_unowned_abort(*a1 | 1);
      }
      a1[1] = v3 - 1;
    }
    else
    {
      unsigned int v4 = atomic_exchange_explicit(a1, 0, memory_order_release);
      if (v4 != v1) {
        _os_unfair_lock_unlock_slow((uint64_t)a1, v1, v4);
      }
    }
  }
  return v1 == v2;
}

uint64_t _os_unfair_lock_unlock_slow(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t result = a3 | 1;
  if (result != a2) {
    _os_unfair_lock_unowned_abort(result);
  }
  if (a3)
  {
    uint64_t v4 = a3;
    qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_267704BC8 = a3;
    __break(1u);
LABEL_9:
    qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_267704BC8 = v4;
    __break(1u);
  }
  else
  {
    while (1)
    {
      uint64_t result = __ulock_wake();
      if ((result & 0x80000000) == 0) {
        break;
      }
      if (result != -4)
      {
        uint64_t v4 = -(int)result;
        if (v4 != 2) {
          goto LABEL_9;
        }
        return result;
      }
    }
  }
  return result;
}

uint64_t _os_unfair_lock_lock_slow(atomic_uint *a1, int a2, uint64_t a3, unsigned int a4)
{
  if ((a2 & 0xFCFAFFFF) != 0)
  {
    qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Invalid options";
    qword_267704BC8 = a2 & 0xFEFFFFFF;
    __break(1u);
LABEL_30:
    _os_unfair_lock_recursive_abort(v4);
  }
  unsigned int v4 = a4;
  int v7 = 0;
  do
  {
    while (1)
    {
      while (1)
      {
        do
        {
          unsigned int v8 = *a1;
          if (!*a1)
          {
            atomic_compare_exchange_strong_explicit(a1, &v8, v4 & ~v7, memory_order_acquire, memory_order_acquire);
            if (!v8) {
              return 1;
            }
          }
          int v9 = v8 | 1;
          BOOL v10 = (a2 & 0x1000000) != 0 && v9 == -1;
          int v11 = !v10;
          if (v9 == v4 && v11 != 0) {
            goto LABEL_30;
          }
          if (v8 == (v8 & 0xFFFFFFFE)) {
            break;
          }
          unsigned int v13 = v8;
          atomic_compare_exchange_strong_explicit(a1, &v13, v8 & 0xFFFFFFFE, memory_order_relaxed, memory_order_relaxed);
          BOOL v10 = v13 == v8;
          v8 &= ~1u;
        }
        while (!v10);
        uint64_t result = __ulock_wait2();
        if ((result & 0x80000000) != 0) {
          break;
        }
        if (result) {
          int v7 = 1;
        }
      }
      uint64_t v15 = -(int)result;
      if ((int)v15 > 13) {
        break;
      }
      if (v15 != 4) {
        goto LABEL_34;
      }
    }
  }
  while (v15 == 14);
  uint64_t result = 0;
  if (v15 != 60)
  {
    if (v15 == 105) {
      _os_unfair_lock_corruption_abort(v8);
    }
LABEL_34:
    qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait2 failure";
    qword_267704BC8 = v15;
    __break(1u);
  }
  return result;
}

mach_vm_address_t *_simple_asl_msg_new()
{
  v0 = (mach_vm_address_t *)_simple_salloc();
  int v7 = v0;
  if (v0 && _simple_sprintf(v0, "         0", v1, v2, v3, v4, v5, v6, v9))
  {
    _simple_sfree(v7);
    return 0;
  }
  return v7;
}

mach_vm_address_t *_os_log_simple(uint64_t a1, char *a2, char *a3, uint64_t a4, unsigned __int8 a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, int a9)
{
  uint64_t result = (mach_vm_address_t *)_simple_salloc();
  if (result)
  {
    unint64_t v18 = result;
    _simple_vesprintf(result, 0, a7, &a9);
    uint64_t v19 = _simple_string((unsigned char **)v18);
    __os_log_simple_offset(a1, a2, a3, a4, v9, a5, a6, v19);
    return _simple_sfree(v18);
  }
  return result;
}

mach_vm_address_t *_simple_sfree(mach_vm_address_t *address)
{
  if (address)
  {
    mach_vm_address_t v1 = (mach_vm_address_t)address;
    uint64_t v2 = (mach_vm_size_t *)MEMORY[0x263EF8C78];
    uint64_t v3 = (vm_map_t *)MEMORY[0x263EF8C60];
    if (((*MEMORY[0x263EF8C78] - 1) & *address) != 0)
    {
      mach_vm_size_t v4 = address[2] - (void)address + 1;
    }
    else
    {
      mach_vm_deallocate(*MEMORY[0x263EF8C60], *address, address[2] - *address + 1);
      mach_vm_size_t v4 = *v2;
    }
    vm_map_t v5 = *v3;
    return (mach_vm_address_t *)mach_vm_deallocate(v5, v1, v4);
  }
  return address;
}

vm_address_t _simple_salloc()
{
  v0 = (void *)MEMORY[0x263EF8C78];
  if (vm_allocate(*MEMORY[0x263EF8C60], &address, *MEMORY[0x263EF8C78], 1)) {
    return 0;
  }
  vm_address_t v2 = address + 40;
  *(void *)vm_address_t address = address + 40;
  vm_address_t result = address;
  vm_address_t v3 = address + *v0 - 1;
  *(void *)(address + 8) = v2;
  *(void *)(result + 16) = v3;
  *(void *)(result + 32) = _enlarge;
  return result;
}

uint64_t _simple_string(unsigned char **a1)
{
  *a1[1] = 0;
  return (uint64_t)*a1;
}

uint64_t _simple_vesprintf(unsigned char *a1, uint64_t (*a2)(uint64_t), unsigned __int8 *a3, int *a4)
{
  return 0;
}

uint64_t _simple_sprintf(unsigned char *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return 0;
}

uint64_t _os_log_simple_parse(unsigned __int16 *a1, unint64_t a2, uint64_t a3)
{
  if (a2 < 0x68) {
    return 94;
  }
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if (v5 + v6 + 104 > a2) {
    return 7;
  }
  unsigned int v7 = *((unsigned __int8 *)a1 + 4);
  if (v7 > 0x10 || ((1 << v7) & 0x10007) == 0) {
    return 22;
  }
  *(unsigned char *)a3 = v7;
  if (v6)
  {
    uint64_t v10 = (uint64_t)a1 + v5 + 104;
    if (*(unsigned char *)(v10 + (v6 - 1))) {
      return 22;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  *(void *)(a3 + 8) = v10;
  if (v5)
  {
    if (!*((unsigned char *)a1 + (v5 - 1) + 104))
    {
      uint64_t v11 = *((void *)a1 + 1);
      *(void *)(a3 + 16) = a1 + 52;
      *(void *)(a3 + 24) = v11;
      if (v11)
      {
        if (v11 <= mach_continuous_time())
        {
          uint64_t v12 = *((void *)a1 + 2);
          *(void *)(a3 + 32) = v12;
          *(void *)(a3 + 40) = *((void *)a1 + 3);
          *(void *)(a3 + 48) = *((void *)a1 + 4);
          *(void *)(a3 + 56) = *((void *)a1 + 5);
          if (v12)
          {
            *(void *)(a3 + 64) = *((void *)a1 + 6);
            _platform_memmove((char *)(a3 + 72), (char *)a1 + 56, 0x10uLL);
            _platform_memmove((char *)(a3 + 88), (char *)a1 + 72, 0x10uLL);
            _platform_memmove((char *)(a3 + 104), (char *)a1 + 88, 0x10uLL);
            return 0;
          }
        }
      }
    }
  }
  return 22;
}

uint64_t __libplatform_init(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  __pfz_setup(a3);
  _simple_asl_init(a2, a4);

  return MEMORY[0x270EDD490](&_platform_string_functions);
}

uint64_t _simple_getenv(uint64_t *a1, uint64_t a2)
{
  unint64_t v4 = _platform_strlen(a2);
  if (!a1) {
    return 0;
  }
  unint64_t v5 = v4;
  uint64_t result = *a1;
  if (!*a1) {
    return result;
  }
  while (1)
  {
    if (_platform_strlen(result) >= v5)
    {
      uint64_t v7 = *a1;
      if (v5)
      {
        unint64_t v8 = v5;
        uint64_t v9 = (unsigned __int8 *)*a1;
        uint64_t v10 = (unsigned __int8 *)a2;
        while (*v9 == *v10)
        {
          ++v10;
          ++v9;
          if (!--v8) {
            goto LABEL_8;
          }
        }
        goto LABEL_9;
      }
LABEL_8:
      if (*(unsigned char *)(v7 + v5) == 61) {
        return v5 + v7 + 1;
      }
    }
LABEL_9:
    uint64_t v11 = a1[1];
    ++a1;
    uint64_t result = v11;
    if (!v11) {
      return result;
    }
  }
}

unsigned char *__simple_bprintf(unsigned char *result, uint64_t (*a2)(uint64_t), unsigned __int8 *a3, int *a4)
{
  if (!*a3) {
    return result;
  }
  unint64_t v4 = a3;
  uint64_t v6 = (uint64_t)result;
  do
  {
    uint64_t result = _platform_strchr((uint64_t)v4, 0x25u);
    if (!result)
    {
      while (1)
      {
        char v95 = *v4;
        if (!*v4) {
          break;
        }
        if (a2 && (uint64_t result = (unsigned char *)a2(*v4)) != 0)
        {
          char v90 = *result;
          if (*result)
          {
            v91 = result + 1;
            do
            {
              v92 = *(unsigned char **)(v6 + 8);
              if ((unint64_t)v92 >= *(void *)(v6 + 16))
              {
                uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                v92 = *(unsigned char **)(v6 + 8);
              }
              *(void *)(v6 + 8) = v92 + 1;
              unsigned char *v92 = v90;
              int v93 = *v91++;
              char v90 = v93;
            }
            while (v93);
          }
        }
        else
        {
          v94 = *(unsigned char **)(v6 + 8);
          if ((unint64_t)v94 >= *(void *)(v6 + 16))
          {
            uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
            v94 = *(unsigned char **)(v6 + 8);
          }
          *(void *)(v6 + 8) = v94 + 1;
          unsigned char *v94 = v95;
        }
        ++v4;
      }
      return result;
    }
    uint64_t v12 = result;
    uint64_t v13 = result - v4;
    if (result - v4 >= 1)
    {
      do
      {
        unsigned int v15 = *v4++;
        uint64_t v14 = v15;
        if (a2 && (uint64_t result = (unsigned char *)a2(v14)) != 0)
        {
          char v16 = *result;
          if (*result)
          {
            unint64_t v17 = result + 1;
            do
            {
              unint64_t v18 = *(unsigned char **)(v6 + 8);
              if ((unint64_t)v18 >= *(void *)(v6 + 16))
              {
                uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                unint64_t v18 = *(unsigned char **)(v6 + 8);
              }
              *(void *)(v6 + 8) = v18 + 1;
              *unint64_t v18 = v16;
              int v19 = *v17++;
              char v16 = v19;
            }
            while (v19);
          }
        }
        else
        {
          unint64_t v20 = *(unsigned char **)(v6 + 8);
          if ((unint64_t)v20 >= *(void *)(v6 + 16))
          {
            uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
            unint64_t v20 = *(unsigned char **)(v6 + 8);
          }
          *(void *)(v6 + 8) = v20 + 1;
          *unint64_t v20 = v14;
        }
        BOOL v21 = v13-- <= 1;
      }
      while (!v21);
    }
    unint64_t v22 = v12 + 1;
    if (v12[1] == 37)
    {
      if (a2 && (uint64_t result = (unsigned char *)a2(37)) != 0)
      {
        char v23 = *result;
        if (*result)
        {
          unsigned int v24 = result + 1;
          do
          {
            unsigned int v25 = *(unsigned char **)(v6 + 8);
            if ((unint64_t)v25 >= *(void *)(v6 + 16))
            {
              uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
              unsigned int v25 = *(unsigned char **)(v6 + 8);
            }
            *(void *)(v6 + 8) = v25 + 1;
            *unsigned int v25 = v23;
            int v26 = *v24++;
            char v23 = v26;
          }
          while (v26);
        }
      }
      else
      {
        v40 = *(unsigned char **)(v6 + 8);
        if ((unint64_t)v40 >= *(void *)(v6 + 16))
        {
          uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
          v40 = *(unsigned char **)(v6 + 8);
        }
        *(void *)(v6 + 8) = v40 + 1;
        unsigned char *v40 = 37;
      }
      unint64_t v4 = v12 + 2;
      continue;
    }
    uint64_t result = (unsigned char *)_platform_strncmp_0((uint64_t)(v12 + 1), (uint64_t)".*s", 3, v7, v8, v9, v10, v11);
    if (!result)
    {
LABEL_44:
      v41 = a4;
      int v42 = *a4;
      a4 += 4;
      if (v42 >= 1)
      {
        v43 = (unsigned __int8 *)*((void *)v41 + 1);
        do
        {
          unsigned int v45 = *v43++;
          uint64_t v44 = v45;
          if (a2 && (uint64_t result = (unsigned char *)a2(v44)) != 0)
          {
            char v46 = *result;
            if (*result)
            {
              v47 = result + 1;
              do
              {
                v48 = *(unsigned char **)(v6 + 8);
                if ((unint64_t)v48 >= *(void *)(v6 + 16))
                {
                  uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                  v48 = *(unsigned char **)(v6 + 8);
                }
                *(void *)(v6 + 8) = v48 + 1;
                unsigned char *v48 = v46;
                int v49 = *v47++;
                char v46 = v49;
              }
              while (v49);
            }
          }
          else
          {
            v50 = *(unsigned char **)(v6 + 8);
            if ((unint64_t)v50 >= *(void *)(v6 + 16))
            {
              uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
              v50 = *(unsigned char **)(v6 + 8);
            }
            *(void *)(v6 + 8) = v50 + 1;
            unsigned char *v50 = v44;
          }
          BOOL v21 = v42-- <= 1;
        }
        while (!v21);
      }
      v22 += 2;
      goto LABEL_148;
    }
    int v32 = 0;
    int v33 = 0;
    int v34 = 0;
    while (1)
    {
      int v35 = (char)*v22;
      int v36 = *v22;
      if (v35 > 98)
      {
        switch(*v22)
        {
          case 'c':
            if (v34 >= 2)
            {
              if (v33) {
                uint64_t v52 = 48;
              }
              else {
                uint64_t v52 = 32;
              }
              do
              {
                if (a2 && (uint64_t result = (unsigned char *)a2(v52)) != 0)
                {
                  char v53 = *result;
                  if (*result)
                  {
                    v54 = result + 1;
                    do
                    {
                      v55 = *(unsigned char **)(v6 + 8);
                      if ((unint64_t)v55 >= *(void *)(v6 + 16))
                      {
                        uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                        v55 = *(unsigned char **)(v6 + 8);
                      }
                      *(void *)(v6 + 8) = v55 + 1;
                      unsigned char *v55 = v53;
                      int v56 = *v54++;
                      char v53 = v56;
                    }
                    while (v56);
                  }
                }
                else
                {
                  v57 = *(unsigned char **)(v6 + 8);
                  if ((unint64_t)v57 >= *(void *)(v6 + 16))
                  {
                    uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                    v57 = *(unsigned char **)(v6 + 8);
                  }
                  *(void *)(v6 + 8) = v57 + 1;
                  unsigned char *v57 = v52;
                }
                BOOL v21 = v34-- <= 2;
              }
              while (!v21);
            }
            v58 = a4;
            a4 += 2;
            int v59 = *v58;
            if (a2 && (uint64_t result = (unsigned char *)a2(*v58)) != 0)
            {
              char v60 = *result;
              if (*result)
              {
                v61 = result + 1;
                do
                {
                  v62 = *(unsigned char **)(v6 + 8);
                  if ((unint64_t)v62 >= *(void *)(v6 + 16))
                  {
                    uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                    v62 = *(unsigned char **)(v6 + 8);
                  }
                  *(void *)(v6 + 8) = v62 + 1;
                  unsigned char *v62 = v60;
                  int v63 = *v61++;
                  char v60 = v63;
                }
                while (v63);
              }
            }
            else
            {
              v88 = *(unsigned char **)(v6 + 8);
              if ((unint64_t)v88 >= *(void *)(v6 + 16))
              {
                uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                v88 = *(unsigned char **)(v6 + 8);
              }
              *(void *)(v6 + 8) = v88 + 1;
              unsigned char *v88 = v59;
            }
            break;
          case 'd':
          case 'i':
            a4 += 2;
            uint64_t result = dec((std::ios_base *)v6);
            break;
          case 'l':
            ++v32;
            ++v22;
            goto LABEL_32;
          case 'o':
            a4 += 2;
            uint64_t result = oct((std::ios_base *)v6);
            break;
          case 'p':
            a4 += 2;
            v51 = (std::ios_base *)v6;
            goto LABEL_90;
          case 's':
            v64 = (const char **)a4;
            a4 += 2;
            v65 = *v64;
            if (v65) {
              v66 = v65;
            }
            else {
              v66 = "(null)";
            }
            uint64_t result = (unsigned char *)_platform_strlen((uint64_t)v66);
            int v67 = v34 - result;
            if (v34 - (int)result >= 1)
            {
              if (v33) {
                uint64_t v68 = 48;
              }
              else {
                uint64_t v68 = 32;
              }
              do
              {
                if (a2 && (uint64_t result = (unsigned char *)a2(v68)) != 0)
                {
                  char v69 = *result;
                  if (*result)
                  {
                    v70 = result + 1;
                    do
                    {
                      v71 = *(unsigned char **)(v6 + 8);
                      if ((unint64_t)v71 >= *(void *)(v6 + 16))
                      {
                        uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                        v71 = *(unsigned char **)(v6 + 8);
                      }
                      *(void *)(v6 + 8) = v71 + 1;
                      unsigned char *v71 = v69;
                      int v72 = *v70++;
                      char v69 = v72;
                    }
                    while (v72);
                  }
                }
                else
                {
                  v73 = *(unsigned char **)(v6 + 8);
                  if ((unint64_t)v73 >= *(void *)(v6 + 16))
                  {
                    uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                    v73 = *(unsigned char **)(v6 + 8);
                  }
                  *(void *)(v6 + 8) = v73 + 1;
                  unsigned char *v73 = v68;
                }
                BOOL v21 = v67-- <= 1;
              }
              while (!v21);
            }
            while (1)
            {
              char v79 = *v66;
              if (!*v66) {
                break;
              }
              if (a2 && (uint64_t result = (unsigned char *)a2(*(unsigned __int8 *)v66)) != 0)
              {
                char v74 = *result;
                if (*result)
                {
                  v75 = result + 1;
                  do
                  {
                    v76 = *(unsigned char **)(v6 + 8);
                    if ((unint64_t)v76 >= *(void *)(v6 + 16))
                    {
                      uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                      v76 = *(unsigned char **)(v6 + 8);
                    }
                    *(void *)(v6 + 8) = v76 + 1;
                    unsigned char *v76 = v74;
                    int v77 = *v75++;
                    char v74 = v77;
                  }
                  while (v77);
                }
              }
              else
              {
                v78 = *(char **)(v6 + 8);
                if ((unint64_t)v78 >= *(void *)(v6 + 16))
                {
                  uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                  v78 = *(char **)(v6 + 8);
                }
                *(void *)(v6 + 8) = v78 + 1;
                char *v78 = v79;
              }
              ++v66;
            }
            break;
          case 'u':
            v80 = (unint64_t *)a4;
            a4 += 2;
            if (v32) {
              unint64_t v81 = *v80;
            }
            else {
              unint64_t v81 = *(unsigned int *)v80;
            }
            uint64_t result = udec(v6, a2, v81, v34, v33);
            break;
          case 'x':
            goto LABEL_62;
          case 'y':
            v82 = (unint64_t *)a4;
            a4 += 2;
            if (v32) {
              unint64_t v83 = *v82;
            }
            else {
              unint64_t v83 = *(unsigned int *)v82;
            }
            uint64_t result = ydec(v6, a2, v83, v34, v33);
            break;
          default:
            goto LABEL_130;
        }
        goto LABEL_148;
      }
      if ((v35 - 49) >= 9) {
        break;
      }
LABEL_35:
      if ((v36 - 48) <= 9)
      {
        do
        {
          int v37 = 10 * v34 + v36;
          int v38 = *++v22;
          LOBYTE(v36) = v38;
          int v34 = v37 - 48;
        }
        while ((v38 - 48) < 0xA);
      }
LABEL_32:
      uint64_t result = (unsigned char *)_platform_strncmp_0((uint64_t)v22, (uint64_t)".*s", 3, v27, v28, v29, v30, v31);
      if (!result) {
        goto LABEL_44;
      }
    }
    if (v35 == 48)
    {
      ++v33;
      int v39 = *++v22;
      int v36 = v39;
      goto LABEL_35;
    }
    if (v35 == 88)
    {
LABEL_62:
      a4 += 2;
      v51 = (std::ios_base *)v6;
LABEL_90:
      uint64_t result = hex(v51);
    }
    else
    {
LABEL_130:
      if (a2 && (uint64_t result = (unsigned char *)a2(*v22)) != 0)
      {
        char v84 = *result;
        if (*result)
        {
          v85 = result + 1;
          do
          {
            v86 = *(unsigned char **)(v6 + 8);
            if ((unint64_t)v86 >= *(void *)(v6 + 16))
            {
              uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
              v86 = *(unsigned char **)(v6 + 8);
            }
            *(void *)(v6 + 8) = v86 + 1;
            unsigned char *v86 = v84;
            int v87 = *v85++;
            char v84 = v87;
          }
          while (v87);
        }
      }
      else
      {
        v89 = *(unsigned char **)(v6 + 8);
        if ((unint64_t)v89 >= *(void *)(v6 + 16))
        {
          uint64_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
          v89 = *(unsigned char **)(v6 + 8);
        }
        *(void *)(v6 + 8) = v89 + 1;
        unsigned char *v89 = v36;
      }
    }
LABEL_148:
    unint64_t v4 = v22 + 1;
  }
  while (*v4);
  return result;
}

unsigned __int8 *_platform_strchr(uint64_t a1, unsigned __int8 a2)
{
  int8x16_t v2 = vdupq_n_s8(a2);
  uint64_t v3 = a1 & 0xF;
  unint64_t v4 = a1 & 0xFFFFFFFFFFFFFFF0;
  int8x16_t v5 = *(int8x16_t *)&algn_20D752B90[-v3];
  for (uint8x16_t i = (uint8x16_t)vorrq_s8(vbicq_s8(*(int8x16_t *)v4, vceqq_s8(*(int8x16_t *)v4, v2)), v5);
        ;
        uint8x16_t i = (uint8x16_t)vbicq_s8(v7, v5))
  {
    v5.i8[0] = vminvq_u8(i);
    if (!v5.i32[0]) {
      break;
    }
    int8x16_t v7 = *(int8x16_t *)(v4 + 16);
    v4 += 16;
    int8x16_t v5 = vceqq_s8(v7, v2);
  }
  uint8x16_t v8 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v5, v5)), (int8x16_t)xmmword_20D752B80);
  v8.i8[0] = vminvq_u8(v8);
  uint64_t result = (unsigned __int8 *)(v4 + v8.u32[0]);
  if (a2 != (unint64_t)*result) {
    return 0;
  }
  return result;
}

unsigned char *_platform_strstr(unsigned char *a1, unsigned char *a2)
{
  int8x16_t v2 = a1;
  uint64_t v3 = (uint64_t)(a2 + 1);
  int v4 = *a2;
  if (!*a2) {
    return a1;
  }
  unint64_t v10 = _platform_strlen((uint64_t)(a2 + 1));
  while (1)
  {
    int v11 = *v2;
    if (!*v2) {
      break;
    }
    uint64_t v12 = v2++;
    if (v11 == v4 && !_platform_strncmp_0((uint64_t)v2, v3, v10, v5, v6, v7, v8, v9)) {
      return v12;
    }
  }
  return 0;
}

unint64_t _platform_strncmp_VARIANT_Base(int8x16_t *a1, int8x16_t *a2, unint64_t a3)
{
  uint64_t v3 = 0;
  if (!a3) {
    return v3;
  }
  while ((a1 & 0xF) != 0)
  {
    unsigned int v5 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    uint64_t v4 = v5;
    unsigned int v6 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    uint64_t v3 = v4 - v6;
    if (v4 == v6 && v4 != 0)
    {
      if (--a3) {
        continue;
      }
    }
    return v3;
  }
  if ((a2 & 0xF) == 0) {
    goto LABEL_30;
  }
  unint64_t v9 = -(uint64_t)a2 & 0xFF0;
  if (!v9) {
    goto LABEL_16;
  }
LABEL_11:
  if (a3 > v9)
  {
    unint64_t v10 = a3 - v9;
    while (1)
    {
      int8x16_t v11 = *a1++;
      int8x16_t v12 = v11;
      int8x16_t v13 = *a2++;
      int8x16_t v15 = vceqq_s8(v12, v13);
      uint8x16_t v14 = (uint8x16_t)vandq_s8(v12, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0]) {
        break;
      }
      v9 -= 16;
      if (!v9)
      {
        a3 = v10;
LABEL_16:
        while (1)
        {
          unsigned int v17 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          uint64_t v16 = v17;
          unsigned int v18 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          uint64_t v3 = v16 - v18;
          if (v16 != v18 || v16 == 0) {
            return v3;
          }
          if (!--a3) {
            return v3;
          }
          if ((a1 & 0xF) == 0)
          {
            unint64_t v9 = 4080;
            goto LABEL_11;
          }
        }
      }
    }
  }
  else
  {
LABEL_30:
    while (1)
    {
      int8x16_t v20 = *a1++;
      int8x16_t v21 = v20;
      int8x16_t v22 = *a2++;
      int8x16_t v15 = vceqq_s8(v21, v22);
      uint8x16_t v14 = (uint8x16_t)vandq_s8(v21, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0]) {
        break;
      }
      BOOL v23 = a3 > 0x10;
      a3 -= 16;
      if (!v23) {
        return 0;
      }
    }
  }
  uint8x16_t v24 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v14, (uint8x16_t)veorq_s8(v15, v15)), (int8x16_t)xmmword_20D752CA0);
  v24.i8[0] = vminvq_u8(v24);
  if (v24.u32[0] >= a3) {
    return 0;
  }
  else {
    return a1[-1].u8[v24.u32[0]] - (unint64_t)a2[-1].u8[v24.u32[0]];
  }
}

unint64_t _platform_strlcat(uint64_t a1, char *a2, uint64_t a3)
{
  unint64_t v6 = _platform_strlen((uint64_t)a2);
  unint64_t v7 = _platform_strnlen(a1, a3);
  unint64_t v8 = a3 - v7;
  if (a3 == v7)
  {
    unint64_t v9 = a3;
  }
  else
  {
    unint64_t v9 = v7;
    unint64_t v10 = (char *)(a1 + v7);
    if (v6 >= v8)
    {
      _platform_memmove(v10, a2, v8 - 1);
      *(unsigned char *)(a3 + a1 - 1) = 0;
    }
    else
    {
      _platform_memmove(v10, a2, v6 + 1);
    }
  }
  return v9 + v6;
}

char *_platform_strncpy(char *a1, char *a2, unint64_t a3)
{
  unint64_t v6 = _platform_strnlen((uint64_t)a2, a3);
  unint64_t v7 = a3 - v6;
  if (a3 <= v6)
  {
    _platform_memmove(a1, a2, a3);
  }
  else
  {
    unint64_t v8 = v6;
    _platform_memmove(a1, a2, v6);
    _platform_memset((int64x2_t *)&a1[v8], 0, v7);
  }
  return a1;
}

int8x16_t *_platform_bzero(int8x16_t *result, unint64_t a2, int8x16_t a3)
{
  int8x16_t v3 = veorq_s8(a3, a3);
  if (a2 < 0x40) {
    JUMPOUT(0x20D752FF4);
  }
  if (a2 < 0x8000) {
    JUMPOUT(0x20D752FACLL);
  }
  *uint64_t result = v3;
  result[1] = v3;
  result[2] = v3;
  result[3] = v3;
  unint64_t v4 = (unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0;
  unint64_t v5 = (unint64_t)result[-4].u64 + a2 - v4;
  if ((unint64_t)result->u64 + a2 > v4 + 64)
  {
    do
    {
      __asm { DC              ZVA, X3 }
      v4 += 64;
      BOOL v10 = v5 > 0x40;
      v5 -= 64;
    }
    while (v10);
  }
  int8x16_t v11 = (int8x16_t *)(v4 + v5);
  *int8x16_t v11 = v3;
  v11[1] = v3;
  v11[2] = v3;
  v11[3] = v3;
  return result;
}

int64x2_t *_platform_memset(int64x2_t *result, unsigned __int8 a2, unint64_t a3)
{
  unint64_t v3 = 0x101010101010101 * a2;
  int64x2_t v4 = vdupq_n_s64(v3);
  unint64_t v5 = (unint64_t *)result;
  if (a3 < 0x40)
  {
    while (1)
    {
      BOOL v15 = a3 >= 8;
      a3 -= 8;
      if (!v15) {
        break;
      }
      *v5++ = v3;
    }
    for (unint64_t i = a3 + 8; i; --i)
    {
      *(unsigned char *)unint64_t v5 = v3;
      unint64_t v5 = (unint64_t *)((char *)v5 + 1);
    }
  }
  else if (a3 < 0x8000)
  {
    *uint64_t result = v4;
    result[1] = v4;
    result[2] = v4;
    result[3] = v4;
    int8x16_t v11 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
    unint64_t v12 = (unint64_t)result->u64 + a3;
    BOOL v8 = v12 > (unint64_t)(v11 + 4);
    for (unint64_t j = v12 - (void)(v11 + 4); v8; j -= 64)
    {
      *int8x16_t v11 = v4;
      v11[1] = v4;
      v11[2] = v4;
      v11[3] = v4;
      v11 += 4;
      BOOL v8 = j > 0x40;
    }
    uint8x16_t v14 = (int64x2_t *)((char *)v11 + j);
    *uint8x16_t v14 = v4;
    v14[1] = v4;
    v14[2] = v4;
    v14[3] = v4;
  }
  else
  {
    if (!v3) {
      JUMPOUT(0x20D752F00);
    }
    *uint64_t result = v4;
    result[1] = v4;
    result[2] = v4;
    result[3] = v4;
    unint64_t v6 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
    unint64_t v7 = (unint64_t)result->u64 + a3;
    BOOL v8 = v7 > (unint64_t)(v6 + 4);
    for (unint64_t k = v7 - (void)(v6 + 4); v8; k -= 64)
    {
      _OWORD *v6 = v4;
      v6[1] = v4;
      v6[2] = v4;
      v6[3] = v4;
      v6 += 4;
      BOOL v8 = k > 0x40;
    }
    BOOL v10 = (int64x2_t *)((char *)v6 + k);
    *BOOL v10 = v4;
    v10[1] = v4;
    v10[2] = v4;
    v10[3] = v4;
  }
  return result;
}

unint64_t _platform_strnlen(uint64_t a1, uint64_t a2)
{
  if (a2 < 0) {
    return _platform_strlen(a1);
  }
  if (!a2) {
    return 0;
  }
  unint64_t v3 = a1 & 0xFFFFFFFFFFFFFFF0;
  int64x2_t v4 = (int8x16_t *)&algn_20D753030[-(a1 & 0xF)];
  int8x16_t v5 = *v4;
  uint8x16_t v6 = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0), *v4);
  unint64_t v7 = a2 + (a1 & 0xF);
  while (1)
  {
    v5.i8[0] = vminvq_u8(v6);
    if (!v5.i32[0]) {
      break;
    }
    BOOL v9 = v7 > 0x10;
    v7 -= 16;
    if (!v9) {
      return v3 - a1 + v7 + 16;
    }
    uint8x16_t v8 = *(uint8x16_t *)(v3 + 16);
    v3 += 16;
    uint8x16_t v6 = v8;
  }
  uint8x16_t v10 = (uint8x16_t)veorq_s8(v5, v5);
  v10.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v6, v10), (int8x16_t)xmmword_20D753020));
  unint64_t v11 = v3 - a1;
  if (v7 >= v10.u32[0]) {
    unint64_t v7 = v10.u32[0];
  }
  return v11 + v7;
}

unint64_t _platform_strlen(uint64_t a1)
{
  unint64_t v1 = a1 & 0xFFFFFFFFFFFFFFF0;
  int8x16_t v2 = (int8x16_t *)&algn_20D753030[-(a1 & 0xF)];
  int8x16_t v3 = *v2;
  for (uint8x16_t i = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0), *v2); ; uint8x16_t i = v5)
  {
    v3.i8[0] = vminvq_u8(i);
    if (!v3.i32[0]) {
      break;
    }
    uint8x16_t v5 = *(uint8x16_t *)(v1 + 16);
    v1 += 16;
  }
  uint8x16_t v6 = (uint8x16_t)veorq_s8(v3, v3);
  v6.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, v6), (int8x16_t)xmmword_20D753020));
  return v1 - a1 + v6.u32[0];
}

unint64_t _platform_strlcpy(char *a1, char *a2, unint64_t a3)
{
  unint64_t v6 = _platform_strlen((uint64_t)a2);
  unint64_t v7 = v6;
  if (v6 >= a3)
  {
    if (a3)
    {
      unint64_t v8 = a3 - 1;
      _platform_memmove(a1, a2, v8);
      a1[v8] = 0;
    }
  }
  else
  {
    _platform_memmove(a1, a2, v6 + 1);
  }
  return v7;
}

char *_platform_strcpy(char *a1, char *a2)
{
  unint64_t v4 = _platform_strlen((uint64_t)a2);
  _platform_memmove(a1, a2, v4 + 1);
  return a1;
}

char *_platform_memmove(char *result, char *a2, unint64_t a3)
{
  if (result - a2 < a3)
  {
    if (result != a2)
    {
      int v34 = &result[a3];
      int v35 = &a2[a3];
      if (a3 < 0x40)
      {
        while (1)
        {
          BOOL v31 = a3 >= 8;
          a3 -= 8;
          if (!v31) {
            break;
          }
          uint64_t v50 = *((void *)v35 - 1);
          v35 -= 8;
          *((void *)v34 - 1) = v50;
          v34 -= 8;
        }
        for (unint64_t i = a3 + 8; i; --i)
        {
          char v52 = *--v35;
          *--int v34 = v52;
        }
      }
      else
      {
        if (a3 < 0x4000)
        {
          long long v47 = *((_OWORD *)v35 - 2);
          long long v48 = *((_OWORD *)v35 - 1);
          unint64_t v38 = (unint64_t)(v34 - 1) & 0xFFFFFFFFFFFFFFE0;
          uint64_t v49 = v35 - &v34[-v38];
          long long v40 = *(_OWORD *)(v49 - 32);
          long long v41 = *(_OWORD *)(v49 - 16);
          *((_OWORD *)v34 - 2) = v47;
          *((_OWORD *)v34 - 1) = v48;
          uint64_t v42 = v49 - 32;
          unint64_t v43 = v38 - (void)result - 64;
          if (v38 - (unint64_t)result > 0x40)
          {
            do
            {
              *(_OWORD *)(v38 - 32) = v40;
              *(_OWORD *)(v38 - 16) = v41;
              v38 -= 32;
              long long v40 = *(_OWORD *)(v42 - 32);
              long long v41 = *(_OWORD *)(v42 - 16);
              v42 -= 32;
              BOOL v12 = v43 > 0x20;
              v43 -= 32;
            }
            while (v12);
          }
        }
        else
        {
          long long v36 = *((_OWORD *)v35 - 2);
          long long v37 = *((_OWORD *)v35 - 1);
          unint64_t v38 = (unint64_t)(v34 - 1) & 0xFFFFFFFFFFFFFFE0;
          uint64_t v39 = v35 - &v34[-v38];
          long long v40 = *(_OWORD *)(v39 - 32);
          long long v41 = *(_OWORD *)(v39 - 16);
          *((_OWORD *)v34 - 2) = v36;
          *((_OWORD *)v34 - 1) = v37;
          uint64_t v42 = v39 - 32;
          unint64_t v43 = v38 - (void)result - 64;
          if (v38 - (unint64_t)result > 0x40)
          {
            do
            {
              *(_OWORD *)(v38 - 32) = v40;
              *(_OWORD *)(v38 - 16) = v41;
              v38 -= 32;
              long long v40 = *(_OWORD *)(v42 - 32);
              long long v41 = *(_OWORD *)(v42 - 16);
              v42 -= 32;
              BOOL v12 = v43 > 0x20;
              v43 -= 32;
            }
            while (v12);
          }
        }
        uint64_t v44 = v42 - v43;
        long long v45 = *(_OWORD *)(v44 - 32);
        long long v46 = *(_OWORD *)(v44 - 16);
        *(_OWORD *)(v38 - 32) = v40;
        *(_OWORD *)(v38 - 16) = v41;
        *(_OWORD *)uint64_t result = v45;
        *((_OWORD *)result + 1) = v46;
      }
    }
  }
  else
  {
    int8x16_t v3 = result;
    if (a3 < 0x40)
    {
      while (1)
      {
        BOOL v31 = a3 >= 8;
        a3 -= 8;
        if (!v31) {
          break;
        }
        uint64_t v30 = *(void *)a2;
        a2 += 8;
        *v3++ = v30;
      }
      for (unint64_t j = a3 + 8; j; --j)
      {
        char v33 = *a2++;
        *(unsigned char *)int8x16_t v3 = v33;
        int8x16_t v3 = (void *)((char *)v3 + 1);
      }
    }
    else
    {
      if (a2 - result < a3)
      {
        if (a3 < 0x4000)
        {
          unint64_t v4 = (char *)((unint64_t)(result + 32) & 0xFFFFFFFFFFFFFFE0);
          long long v22 = *(_OWORD *)a2;
          long long v23 = *((_OWORD *)a2 + 1);
          uint8x16_t v24 = (long long *)&a2[v4 - result];
          long long v8 = *v24;
          long long v9 = v24[1];
          uint8x16_t v10 = v24 + 2;
          unint64_t v25 = a3 - (v4 - result);
          *(_OWORD *)uint64_t result = v22;
          *((_OWORD *)result + 1) = v23;
          BOOL v12 = v25 > 0x40;
          for (unint64_t k = v25 - 64; v12; k -= 32)
          {
            *(_OWORD *)unint64_t v4 = v8;
            *((_OWORD *)v4 + 1) = v9;
            v4 += 32;
            long long v8 = *v10;
            long long v9 = v10[1];
            v10 += 2;
            BOOL v12 = k > 0x20;
          }
        }
        else
        {
          unint64_t v4 = (char *)((unint64_t)(result + 32) & 0xFFFFFFFFFFFFFFE0);
          long long v18 = *(_OWORD *)a2;
          long long v19 = *((_OWORD *)a2 + 1);
          int8x16_t v20 = (long long *)&a2[v4 - result];
          long long v8 = *v20;
          long long v9 = v20[1];
          uint8x16_t v10 = v20 + 2;
          unint64_t v21 = a3 - (v4 - result);
          *(_OWORD *)uint64_t result = v18;
          *((_OWORD *)result + 1) = v19;
          BOOL v12 = v21 > 0x40;
          for (unint64_t k = v21 - 64; v12; k -= 32)
          {
            *(_OWORD *)unint64_t v4 = v8;
            *((_OWORD *)v4 + 1) = v9;
            v4 += 32;
            long long v8 = *v10;
            long long v9 = v10[1];
            v10 += 2;
            BOOL v12 = k > 0x20;
          }
        }
      }
      else if (a3 < 0x4000)
      {
        unint64_t v4 = (char *)((unint64_t)(result + 32) & 0xFFFFFFFFFFFFFFE0);
        long long v14 = *(_OWORD *)a2;
        long long v15 = *((_OWORD *)a2 + 1);
        uint64_t v16 = (long long *)&a2[v4 - result];
        long long v8 = *v16;
        long long v9 = v16[1];
        uint8x16_t v10 = v16 + 2;
        unint64_t v17 = a3 - (v4 - result);
        *(_OWORD *)uint64_t result = v14;
        *((_OWORD *)result + 1) = v15;
        BOOL v12 = v17 > 0x40;
        for (unint64_t k = v17 - 64; v12; k -= 32)
        {
          *(_OWORD *)unint64_t v4 = v8;
          *((_OWORD *)v4 + 1) = v9;
          v4 += 32;
          long long v8 = *v10;
          long long v9 = v10[1];
          v10 += 2;
          BOOL v12 = k > 0x20;
        }
      }
      else
      {
        unint64_t v4 = (char *)((unint64_t)(result + 32) & 0xFFFFFFFFFFFFFFE0);
        long long v5 = *(_OWORD *)a2;
        long long v6 = *((_OWORD *)a2 + 1);
        unint64_t v7 = (long long *)&a2[v4 - result];
        long long v8 = *v7;
        long long v9 = v7[1];
        uint8x16_t v10 = v7 + 2;
        unint64_t v11 = a3 - (v4 - result);
        *(_OWORD *)uint64_t result = v5;
        *((_OWORD *)result + 1) = v6;
        BOOL v12 = v11 > 0x40;
        for (unint64_t k = v11 - 64; v12; k -= 32)
        {
          *(_OWORD *)unint64_t v4 = v8;
          *((_OWORD *)v4 + 1) = v9;
          v4 += 32;
          long long v8 = *v10;
          long long v9 = v10[1];
          v10 += 2;
          BOOL v12 = k > 0x20;
        }
      }
      int v26 = (long long *)((char *)v10 + k);
      long long v27 = *v26;
      long long v28 = v26[1];
      *(_OWORD *)unint64_t v4 = v8;
      *((_OWORD *)v4 + 1) = v9;
      uint64_t v29 = &v4[k];
      *((_OWORD *)v29 + 2) = v27;
      *((_OWORD *)v29 + 3) = v28;
    }
  }
  return result;
}

uint64_t _simple_asl_init(uint64_t *a1, uint64_t a2)
{
  if (*(void *)(MEMORY[0x263EF8C48] + 336) == -1) {
    atomic_ullong v4 = *(void *)(MEMORY[0x263EF8C48] + 344);
  }
  else {
    atomic_ullong v4 = _os_alloc_once((atomic_ullong *)(MEMORY[0x263EF8C48] + 336), 32, (uint64_t)_simple_asl_init_context);
  }
  uint64_t result = _simple_getenv(a1, (uint64_t)"ASL_DISABLE");
  if (!result || (uint64_t result = _platform_strcmp_0(result, (uint64_t)"1", v6, v7, v8, v9, v10, v11), result))
  {
    *(unsigned char *)atomic_ullong v4 = 1;
    if (a2)
    {
      BOOL v12 = *(void **)(a2 + 32);
      if (v12) {
        *(void *)(v4 + 8) = *v12;
      }
    }
  }
  return result;
}

uint64_t __os_log_simple_offset(uint64_t a1, char *a2, char *a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8)
{
  uint64_t v23 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v18 = 0u;
  v17[0] = a6;
  v17[1] = a7;
  v17[2] = a8;
  v17[3] = mach_continuous_time();
  pid_t v13 = getpid();
  *(void *)&long long v18 = v13;
  if (proc_pidinfo(v13, 17, 0, buffer, 56) == 56)
  {
    *((void *)&v18 + 1) = v25;
    *(void *)&long long v19 = v26;
    _platform_memmove((char *)&v21 + 8, buffer, 0x10uLL);
  }
  *((void *)&v19 + 1) = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  if (a1)
  {
    if (*(int *)(a1 + 24) >= 0) {
      uint64_t v14 = a1;
    }
    else {
      uint64_t v14 = a4;
    }
    *(void *)&long long v20 = a5 - v14;
    long long v15 = a2;
  }
  else
  {
    long long v15 = (char *)&v21 + 8;
  }
  _platform_memmove((char *)&v20 + 8, v15, 0x10uLL);
  _platform_memmove((char *)&v22 + 8, a3, 0x10uLL);
  return _os_log_simple_send((uint64_t)v17);
}

uint64_t _os_log_simple_send(uint64_t a1)
{
  if ((_simple_asl_get_fd() & 0x80000000) != 0) {
    return 9;
  }
  if ((MEMORY[0xFFFFFC105] & 4) != 0) {
    return 0;
  }
  unint64_t v2 = _platform_strlen(*(void *)(a1 + 16)) + 1;
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3) {
    unint64_t v4 = _platform_strlen(v3) + 1;
  }
  else {
    unint64_t v4 = 0;
  }
  unint64_t v6 = v4 + v2 + 104;
  BOOL v7 = __CFADD__(v4, v2 + 104);
  uint64_t result = 84;
  if (v2 < 0xFFFFFFFFFFFFFF98 && !v7)
  {
    if (v6 <= 0x800)
    {
      _platform_memmove(v9, (char *)(a1 + 72), 0x10uLL);
      _platform_memmove(v10, (char *)(a1 + 88), 0x10uLL);
      _platform_memmove(v11, (char *)(a1 + 104), 0x10uLL);
      _platform_strlcpy(v12, *(char **)(a1 + 16), v2);
      if (v4) {
        _platform_strlcpy(&v12[v2], *(char **)(a1 + 8), v4);
      }
      unint64_t v8 = __sendto();
      if ((v8 & 0x8000000000000000) != 0)
      {
        return *__error();
      }
      else if (v8 >= v6)
      {
        return 0;
      }
      else
      {
        return 40;
      }
    }
    else
    {
      return 7;
    }
  }
  return result;
}

uint64_t _simple_asl_get_fd()
{
  if (*(void *)(MEMORY[0x263EF8C48] + 336) == -1) {
    atomic_ullong v0 = *(void *)(MEMORY[0x263EF8C48] + 344);
  }
  else {
    atomic_ullong v0 = _os_alloc_once((atomic_ullong *)(MEMORY[0x263EF8C48] + 336), 32, (uint64_t)_simple_asl_init_context);
  }
  if (!*(unsigned char *)v0) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)(v0 + 24) != -1) {
    _os_once((atomic_ullong *)(v0 + 24), 0, (uint64_t (*)(uint64_t))_simple_asl_connect_once);
  }
  return *(unsigned int *)(v0 + 16);
}

atomic_ullong _os_alloc_once(atomic_ullong *a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  _os_once(a1, (uint64_t)v5, _os_alloc);
  return a1[1];
}

atomic_ullong *_os_once(atomic_ullong *result, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  unint64_t explicit = atomic_load_explicit(result, memory_order_acquire);
  if ((explicit & 3) == 1)
  {
    if (4 * MEMORY[0xFFFFFC180] - explicit - 15 <= 0xFFFFFFFFFFFFFFEFLL) {
      *uint64_t result = -1;
    }
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    atomic_compare_exchange_strong_explicit(result, (unint64_t *)&v4, v5, memory_order_acquire, memory_order_acquire);
    if (v4) {
      return (atomic_ullong *)_os_once_gate_wait((uint64_t)result, a2, a3, v5);
    }
    else {
      return (atomic_ullong *)_os_once_callout(result, a2, a3, v5);
    }
  }
  return result;
}

uint64_t _os_once_callout(atomic_ullong *a1, uint64_t a2, uint64_t (*a3)(uint64_t), int a4)
{
  uint64_t result = a3(a2);
  unsigned int v7 = atomic_exchange_explicit(a1, (4 * MEMORY[0xFFFFFC180]) | 1, memory_order_release);
  if (v7 != a4)
  {
    return _os_once_gate_broadcast((uint64_t)a1, v7, a4);
  }
  return result;
}

uint64_t _os_alloc(uint64_t a1)
{
  unint64_t v1 = (void *)MEMORY[0x263EF8C78];
  unint64_t v2 = (*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0;
  if (v2 - 1 >= 2 * *MEMORY[0x263EF8C78] - 16) {
    _os_alloc_cold_1((*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0);
  }
  uint64_t v4 = (atomic_ullong *)_os_alloc_heap;
  if (_os_alloc_heap
    && (add_unint64_t explicit = atomic_fetch_add_explicit((atomic_ullong *volatile)_os_alloc_heap, v2, memory_order_relaxed),
        add_explicit + v2 <= 2 * *v1 - 16))
  {
    uint64_t result = (uint64_t)v4 + add_explicit + 16;
  }
  else
  {
    uint64_t result = _os_alloc_slow(v4, v2);
  }
  *(void *)(*(void *)a1 + 8) = result;
  unsigned int v7 = *(uint64_t (**)(void))(a1 + 16);
  if (v7)
  {
    return v7();
  }
  return result;
}

uint64_t _os_alloc_slow(atomic_ullong *a1, unint64_t a2)
{
  uint64_t v4 = (mach_vm_address_t *)MEMORY[0x263EF8C78];
  uint64_t v5 = (vm_map_t *)MEMORY[0x263EF8C60];
  mach_vm_address_t v6 = *MEMORY[0x263EF8C78];
  while (1)
  {
    mach_vm_address_t address = v6;
    uint64_t result = mach_vm_map(*v5, &address, 2 * v6, 0, 1224736769, 0, 0, 0, 3, 7, 1u);
    if (result) {
      break;
    }
    mach_vm_address_t v8 = address;
    uint64_t v9 = a1;
    atomic_compare_exchange_strong_explicit(&_os_alloc_heap, (unint64_t *)&v9, address, memory_order_relaxed, memory_order_relaxed);
    if (v9 == a1)
    {
      *(void *)(v8 + 8) = a1;
      a1 = (atomic_ullong *)v8;
LABEL_6:
      add_unint64_t explicit = atomic_fetch_add_explicit(a1, a2, memory_order_relaxed);
      mach_vm_address_t v6 = *v4;
      if (add_explicit + a2 <= 2 * *v4 - 16) {
        return (uint64_t)a1 + add_explicit + 16;
      }
    }
    else
    {
      mach_vm_deallocate(*v5, v8, 2 * *v4);
      a1 = (atomic_ullong *)_os_alloc_heap;
      if (_os_alloc_heap) {
        goto LABEL_6;
      }
      mach_vm_address_t v6 = *v4;
    }
  }
  qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: Failed to allocate in os_alloc_once";
  qword_267704BC8 = (int)result;
  __break(1u);
  return result;
}

unsigned char *__pfz_setup(uint64_t *a1)
{
  uint64_t result = (unsigned char *)_simple_getenv(a1, (uint64_t)"pfz");
  if (result)
  {
    if (*result == 48 && result[1] == 120 && (char v2 = result[2]) != 0)
    {
      uint64_t v3 = 0;
      uint64_t v4 = result + 3;
      do
      {
        int v5 = v2;
        if ((v2 - 48) >= 0xAu)
        {
          int v6 = -87;
          if ((v5 - 97) >= 6u)
          {
            if ((v5 - 65) > 5u) {
              goto LABEL_13;
            }
            int v6 = -55;
          }
        }
        else
        {
          int v6 = -48;
        }
        uint64_t v3 = (v6 + v5) + 16 * v3;
        int v7 = *v4++;
        char v2 = v7;
      }
      while (v7);
    }
    else
    {
LABEL_13:
      uint64_t v3 = 0;
    }
    mach_vm_address_t v8 = (int8x16_t *)(result - 4);
    unint64_t v9 = _platform_strlen((uint64_t)result);
    uint64_t result = _platform_bzero(v8, v9 + 4, v10);
    if (v3) {
      commpage_pfz_base = v3;
    }
  }
  return result;
}

uint64_t _simple_asl_init_context(uint64_t result)
{
  *(void *)(result + 8) = "unknown";
  *(_DWORD *)(result + 16) = -1;
  return result;
}

void _simple_asl_connect_once()
{
  if (*(void *)(MEMORY[0x263EF8C48] + 336) == -1) {
    atomic_ullong v0 = *(void *)(MEMORY[0x263EF8C48] + 344);
  }
  else {
    atomic_ullong v0 = _os_alloc_once((atomic_ullong *)(MEMORY[0x263EF8C48] + 336), 32, (uint64_t)_simple_asl_init_context);
  }
  if (*(_DWORD *)(v0 + 16) == -1) {
    *(_DWORD *)(v0 + 16) = _simple_asl_connect();
  }
}

uint64_t _simple_asl_connect()
{
  uint64_t v0 = socket(1, 2, 0);
  uint64_t v1 = v0;
  if (v0 != -1)
  {
    fcntl(v0, 2, 1);
    v5.sa_family = 1;
    unint64_t v2 = _platform_strlen((uint64_t)"/var/run/syslog");
    if (v2 + 1 < 0x68) {
      unint64_t v3 = v2 + 1;
    }
    else {
      unint64_t v3 = 104;
    }
    _platform_memmove(v5.sa_data, "/var/run/syslog", v3);
    if (connect(v1, &v5, 0x6Au) == -1)
    {
      close(v1);
      return 0xFFFFFFFFLL;
    }
  }
  return v1;
}

std::ios_base *__cdecl dec(std::ios_base *__str)
{
  sockaddr v5 = v1;
  int v7 = (v2 >> 63) + v3;
  unint64_t v8 = (unint64_t)v2 >> 63;
  char v39 = 0;
  if (v2)
  {
    unint64_t v9 = &v39;
    if (v2 >= 0) {
      unint64_t v10 = v2;
    }
    else {
      unint64_t v10 = -v2;
    }
    do
    {
      *--unint64_t v9 = (v10 % 0xA) | 0x30;
      BOOL v11 = v10 >= 0xA;
      v10 /= 0xAuLL;
    }
    while (v11);
    BOOL v12 = v4 != 0;
    if (v2 < 0 && v4)
    {
      if (v1 && (pid_t v13 = (unsigned char *)v1(45)) != 0)
      {
        LODWORD(v8) = *v13;
        if (*v13)
        {
          uint64_t v14 = v13 + 1;
          do
          {
            long long v15 = *(unsigned char **)&__str->__fmtflags_;
            if ((unint64_t)v15 >= __str->__precision_)
            {
              (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
              long long v15 = *(unsigned char **)&__str->__fmtflags_;
            }
            *(void *)&__str->__fmtflags_ = v15 + 1;
            *long long v15 = v8;
            int v16 = *v14++;
            LODWORD(v8) = v16;
          }
          while (v16);
        }
      }
      else
      {
        unint64_t v17 = *(unsigned char **)&__str->__fmtflags_;
        if ((unint64_t)v17 >= __str->__precision_)
        {
          (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
          unint64_t v17 = *(unsigned char **)&__str->__fmtflags_;
        }
        LODWORD(v8) = 0;
        *(void *)&__str->__fmtflags_ = v17 + 1;
        *unint64_t v17 = 45;
      }
      BOOL v12 = 1;
    }
  }
  else
  {
    unint64_t v9 = &v38;
    char v38 = 48;
    BOOL v12 = v4 != 0;
  }
  uint64_t result = (std::ios_base *)_platform_strlen((uint64_t)v9);
  uint64_t v19 = v7 - (void)result;
  if (v19 >= 1)
  {
    if (v12) {
      uint64_t v20 = 48;
    }
    else {
      uint64_t v20 = 32;
    }
    do
    {
      if (v5 && (uint64_t result = (std::ios_base *)v5(v20)) != 0)
      {
        char v21 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          long long v22 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            uint64_t v23 = *(unsigned char **)&__str->__fmtflags_;
            if ((unint64_t)v23 >= __str->__precision_)
            {
              uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              uint64_t v23 = *(unsigned char **)&__str->__fmtflags_;
            }
            *(void *)&__str->__fmtflags_ = v23 + 1;
            *uint64_t v23 = v21;
            int v24 = *v22++;
            char v21 = v24;
          }
          while (v24);
        }
      }
      else
      {
        uint64_t v25 = *(unsigned char **)&__str->__fmtflags_;
        if ((unint64_t)v25 >= __str->__precision_)
        {
          uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          uint64_t v25 = *(unsigned char **)&__str->__fmtflags_;
        }
        *(void *)&__str->__fmtflags_ = v25 + 1;
        *uint64_t v25 = v20;
      }
    }
    while (v19-- > 1);
  }
  if (v8)
  {
    if (v5 && (uint64_t result = (std::ios_base *)v5(45)) != 0)
    {
      char v27 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        long long v28 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          uint64_t v29 = *(unsigned char **)&__str->__fmtflags_;
          if ((unint64_t)v29 >= __str->__precision_)
          {
            uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            uint64_t v29 = *(unsigned char **)&__str->__fmtflags_;
          }
          *(void *)&__str->__fmtflags_ = v29 + 1;
          *uint64_t v29 = v27;
          int v30 = *v28++;
          char v27 = v30;
        }
        while (v30);
      }
    }
    else
    {
      BOOL v31 = *(unsigned char **)&__str->__fmtflags_;
      if ((unint64_t)v31 >= __str->__precision_)
      {
        uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        BOOL v31 = *(unsigned char **)&__str->__fmtflags_;
      }
      *(void *)&__str->__fmtflags_ = v31 + 1;
      *BOOL v31 = 45;
    }
  }
  while (1)
  {
    char v37 = *v9;
    if (!*v9) {
      break;
    }
    if (v5 && (uint64_t result = (std::ios_base *)v5(*v9)) != 0)
    {
      char v32 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        char v33 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          int v34 = *(unsigned char **)&__str->__fmtflags_;
          if ((unint64_t)v34 >= __str->__precision_)
          {
            uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            int v34 = *(unsigned char **)&__str->__fmtflags_;
          }
          *(void *)&__str->__fmtflags_ = v34 + 1;
          *int v34 = v32;
          int v35 = *v33++;
          char v32 = v35;
        }
        while (v35);
      }
    }
    else
    {
      long long v36 = *(char **)&__str->__fmtflags_;
      if ((unint64_t)v36 >= __str->__precision_)
      {
        uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        long long v36 = *(char **)&__str->__fmtflags_;
      }
      *(void *)&__str->__fmtflags_ = v36 + 1;
      *long long v36 = v37;
    }
    ++v9;
  }
  return result;
}

std::ios_base *__cdecl hex(std::ios_base *__str)
{
  int v7 = v4;
  int v8 = v3;
  unint64_t v9 = v1;
  BOOL v11 = "0123456789ABCDEF";
  if (!v5) {
    BOOL v11 = "0123456789abcdef";
  }
  char v48 = 0;
  if (v2)
  {
    BOOL v12 = &v48;
    do
    {
      *--BOOL v12 = v11[v2 & 0xF];
      BOOL v13 = v2 >= 0x10;
      v2 >>= 4;
    }
    while (v13);
    if (!v6) {
      goto LABEL_23;
    }
  }
  else
  {
    BOOL v12 = &v47;
    char v47 = 48;
    if (!v6)
    {
LABEL_23:
      char v23 = 1;
      goto LABEL_25;
    }
  }
  int v8 = v3 - 2;
  if (v4)
  {
    uint64_t v14 = (char *)&_0x;
    unsigned __int8 v15 = 48;
    do
    {
      if (v9 && (int v16 = (unsigned char *)v9(v15)) != 0)
      {
        char v17 = *v16;
        if (*v16)
        {
          long long v18 = v16 + 1;
          do
          {
            uint64_t v19 = *(unsigned char **)&__str->__fmtflags_;
            if ((unint64_t)v19 >= __str->__precision_)
            {
              (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
              uint64_t v19 = *(unsigned char **)&__str->__fmtflags_;
            }
            *(void *)&__str->__fmtflags_ = v19 + 1;
            *uint64_t v19 = v17;
            int v20 = *v18++;
            char v17 = v20;
          }
          while (v20);
        }
      }
      else
      {
        char v21 = *(unsigned __int8 **)&__str->__fmtflags_;
        if ((unint64_t)v21 >= __str->__precision_)
        {
          (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
          char v21 = *(unsigned __int8 **)&__str->__fmtflags_;
        }
        *(void *)&__str->__fmtflags_ = v21 + 1;
        *char v21 = v15;
      }
      unsigned __int8 v22 = *++v14;
      unsigned __int8 v15 = v22;
    }
    while (v14 != (char *)&unk_20D75764A);
    goto LABEL_23;
  }
  char v23 = 0;
LABEL_25:
  uint64_t result = (std::ios_base *)_platform_strlen((uint64_t)v12);
  int v25 = v8 - result;
  if (v25 >= 1)
  {
    if (v7) {
      uint64_t v26 = 48;
    }
    else {
      uint64_t v26 = 32;
    }
    do
    {
      if (v9 && (uint64_t result = (std::ios_base *)v9(v26)) != 0)
      {
        char v27 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          long long v28 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            uint64_t v29 = *(unsigned char **)&__str->__fmtflags_;
            if ((unint64_t)v29 >= __str->__precision_)
            {
              uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              uint64_t v29 = *(unsigned char **)&__str->__fmtflags_;
            }
            *(void *)&__str->__fmtflags_ = v29 + 1;
            *uint64_t v29 = v27;
            int v30 = *v28++;
            char v27 = v30;
          }
          while (v30);
        }
      }
      else
      {
        BOOL v31 = *(unsigned char **)&__str->__fmtflags_;
        if ((unint64_t)v31 >= __str->__precision_)
        {
          uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          BOOL v31 = *(unsigned char **)&__str->__fmtflags_;
        }
        *(void *)&__str->__fmtflags_ = v31 + 1;
        *BOOL v31 = v26;
      }
    }
    while (v25-- > 1);
  }
  if ((v23 & 1) == 0)
  {
    char v33 = (char *)&_0x;
    unsigned __int8 v34 = 48;
    do
    {
      if (v9 && (uint64_t result = (std::ios_base *)v9(v34)) != 0)
      {
        char v35 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          long long v36 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            char v37 = *(unsigned char **)&__str->__fmtflags_;
            if ((unint64_t)v37 >= __str->__precision_)
            {
              uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              char v37 = *(unsigned char **)&__str->__fmtflags_;
            }
            *(void *)&__str->__fmtflags_ = v37 + 1;
            *char v37 = v35;
            int v38 = *v36++;
            char v35 = v38;
          }
          while (v38);
        }
      }
      else
      {
        char v39 = *(unsigned __int8 **)&__str->__fmtflags_;
        if ((unint64_t)v39 >= __str->__precision_)
        {
          uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          char v39 = *(unsigned __int8 **)&__str->__fmtflags_;
        }
        *(void *)&__str->__fmtflags_ = v39 + 1;
        *char v39 = v34;
      }
      unsigned __int8 v40 = *++v33;
      unsigned __int8 v34 = v40;
    }
    while (v33 != (char *)&unk_20D75764A);
  }
  while (1)
  {
    char v46 = *v12;
    if (!*v12) {
      break;
    }
    if (v9 && (uint64_t result = (std::ios_base *)v9(*v12)) != 0)
    {
      char v41 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        uint64_t v42 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          unint64_t v43 = *(unsigned char **)&__str->__fmtflags_;
          if ((unint64_t)v43 >= __str->__precision_)
          {
            uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            unint64_t v43 = *(unsigned char **)&__str->__fmtflags_;
          }
          *(void *)&__str->__fmtflags_ = v43 + 1;
          unsigned char *v43 = v41;
          int v44 = *v42++;
          char v41 = v44;
        }
        while (v44);
      }
    }
    else
    {
      long long v45 = *(char **)&__str->__fmtflags_;
      if ((unint64_t)v45 >= __str->__precision_)
      {
        uint64_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        long long v45 = *(char **)&__str->__fmtflags_;
      }
      *(void *)&__str->__fmtflags_ = v45 + 1;
      *long long v45 = v46;
    }
    ++v12;
  }
  return result;
}

atomic_uint *os_unfair_recursive_lock_lock_with_options(atomic_uint *result, int a2)
{
  int v3 = 0;
  unsigned int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v3, v2, memory_order_acquire, memory_order_acquire);
  if (v3)
  {
    if ((v3 | 1) == v2) {
      ++result[1];
    }
    else {
      return (atomic_uint *)_os_unfair_lock_lock_slow(result, a2, 0, v2);
    }
  }
  return result;
}

uint64_t os_unfair_recursive_lock_trylock(atomic_uint *a1)
{
  int v2 = 0;
  unsigned int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v2, v1, memory_order_acquire, memory_order_acquire);
  if (!v2) {
    return 1;
  }
  if ((v2 | 1) == v1)
  {
    ++a1[1];
    return 1;
  }
  return 0;
}

atomic_uint *os_unfair_recursive_lock_unlock(atomic_uint *result)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_uint v2 = result[1];
  if (v2)
  {
    if ((*result | 1) != v1) {
      _os_unfair_lock_unowned_abort(*result | 1);
    }
    result[1] = v2 - 1;
  }
  else
  {
    unsigned int v3 = atomic_exchange_explicit(result, 0, memory_order_release);
    if (v3 != v1)
    {
      return (atomic_uint *)_os_unfair_lock_unlock_slow((uint64_t)result, v1, v3);
    }
  }
  return result;
}

void _os_unfair_lock_unowned_abort(unsigned int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_unfair_lock not owned by current thread";
  qword_267704BC8 = a1;
  __break(1u);
}

int ffs(int a1)
{
  return 32 - __clz(a1 & -a1);
}

int ffsll(uint64_t a1)
{
  return 64 - __clz(a1 & -a1);
}

int fls(int a1)
{
  return 32 - __clz(a1);
}

int flsll(uint64_t a1)
{
  return 64 - __clz(a1);
}

unint64_t _platform_memchr(uint64_t a1, unsigned int a2, uint64_t a3)
{
  if (!a3) {
    return 0;
  }
  if (a3 < 0)
  {
    int8x16_t v13 = vdupq_n_s8(a2);
    uint64_t v14 = a1 & 0xF;
    unint64_t v15 = a1 & 0xFFFFFFFFFFFFFFF0;
    int8x16_t v16 = *(int8x16_t *)&algn_20D754570[-v14];
    for (uint8x16_t i = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v15, v13), v16); ; uint8x16_t i = (uint8x16_t)vsubq_s8(v18, v13))
    {
      v16.i8[0] = vminvq_u8(i);
      if (!v16.i32[0]) {
        break;
      }
      int8x16_t v18 = *(int8x16_t *)(v15 + 16);
      v15 += 16;
    }
    uint8x16_t v19 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_20D754560);
    v19.i8[0] = vminvq_u8(v19);
    return v15 + v19.u32[0];
  }
  else
  {
    int8x16_t v3 = vdupq_n_s8(a2);
    uint64_t v4 = a1 & 0xF;
    unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFF0;
    int8x16_t v6 = *(int8x16_t *)&algn_20D754570[-v4];
    uint8x16_t v7 = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v5, v3), v6);
    unint64_t v8 = a3 + v4;
    while (1)
    {
      v6.i8[0] = vminvq_u8(v7);
      if (!v6.i32[0]) {
        break;
      }
      BOOL v10 = v8 > 0x10;
      v8 -= 16;
      if (!v10) {
        return 0;
      }
      int8x16_t v9 = *(int8x16_t *)(v5 + 16);
      v5 += 16;
      uint8x16_t v7 = (uint8x16_t)vsubq_s8(v9, v3);
    }
    uint8x16_t v12 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v7, (uint8x16_t)veorq_s8(v3, v3)), (int8x16_t)xmmword_20D754560);
    v12.i8[0] = vminvq_u8(v12);
    unint64_t result = v5 + v12.u32[0];
    if (v12.u32[0] >= v8) {
      return 0;
    }
  }
  return result;
}

int64_t OSAtomicAdd64(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add_explicit(__theValue, __theAmount, memory_order_relaxed) + __theAmount;
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  uint32_t os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) == v1) {
    os_unfair_lock_assert_not_owner_cold_1(os_unfair_lock_opaque);
  }
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  if ((__list & 0xF) != 0) {
    return (void *)_OSAtomicDequeue_misalign((unint64_t *)__list, a2);
  }
  unint64_t explicit = (char *)atomic_load_explicit((atomic_ullong *volatile)__list, memory_order_acquire);
  if (explicit)
  {
    do
    {
      _X4 = *(void *)&explicit[a2];
      _X7 = __list->opaque2;
      __asm { CASPA           X6, X7, X4, X5, [X0] }
      BOOL v10 = _X6 == explicit;
      if (_X6 != explicit) {
        unint64_t explicit = _X6;
      }
    }
    while (!v10 && explicit);
  }
  return explicit;
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
  _X4 = __new;
  if ((__list & 0xF) != 0)
  {
    _OSAtomicEnqueue_misalign((unint64_t *)__list, (unint64_t)__new, a3);
  }
  else
  {
    opaque1 = __list->opaque1;
    uint64_t opaque2 = __list->opaque2;
    do
    {
      *(void *)((char *)__new + a3) = opaque1;
      _X9 = opaque2;
      __asm { CASPL           X8, X9, X4, X5, [X0] }
      _ZF = _X8 == opaque1;
      opaque1 = _X8;
    }
    while (!_ZF);
  }
}

void _platform_memset_pattern4(uint64_t a1, const float *a2, unint64_t a3)
{
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000) {
      JUMPOUT(0x20D7547B4);
    }
    JUMPOUT(0x20D754830);
  }
  JUMPOUT(0x20D7548B0);
}

void _platform_memset_pattern8(uint64_t a1, const double *a2, unint64_t a3)
{
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000) {
      JUMPOUT(0x20D7547B4);
    }
    JUMPOUT(0x20D754830);
  }
  JUMPOUT(0x20D7548B0);
}

int8x16_t *_platform_memset_pattern16(int8x16_t *result, int8x16_t *a2, unint64_t a3)
{
  int8x16_t v3 = *a2;
  if (a3 < 0x40)
  {
    while (1)
    {
      BOOL v14 = a3 >= 0x10;
      a3 -= 16;
      if (!v14) {
        break;
      }
      *result++ = v3;
    }
    unint64_t v15 = a3 + 16;
    if (v15)
    {
      unint64_t v17 = v3.u64[1];
      unint64_t v16 = v3.i64[0];
      do
      {
        result->i8[0] = v16;
        unint64_t result = (int8x16_t *)((char *)result + 1);
        unint64_t v16 = (v16 >> 8) | (v17 << 56);
        v17 >>= 8;
        --v15;
      }
      while (v15);
    }
  }
  else
  {
    if (a3 < 0x8000)
    {
      *unint64_t result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      uint64_t v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
      unint64_t v12 = (unint64_t)result->u64 + a3;
      BOOL v6 = v12 > (unint64_t)(v4 + 4);
      unint64_t v7 = v12 - (void)(v4 + 4);
      uint64_t v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        int8x16_t v13 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_20D754900 + v8));
        do
        {
          *uint64_t v4 = v13;
          v4[1] = v13;
          v4[2] = v13;
          v4[3] = v13;
          v4 += 4;
          BOOL v6 = v7 > 0x40;
          v7 -= 64;
        }
        while (v6);
      }
    }
    else
    {
      *unint64_t result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      uint64_t v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
      unint64_t v5 = (unint64_t)result->u64 + a3;
      BOOL v6 = v5 > (unint64_t)(v4 + 4);
      unint64_t v7 = v5 - (void)(v4 + 4);
      uint64_t v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        int8x16_t v9 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_20D754900 + v8));
        do
        {
          *uint64_t v4 = v9;
          v4[1] = v9;
          v4[2] = v9;
          v4[3] = v9;
          v4 += 4;
          BOOL v6 = v7 > 0x40;
          v7 -= 64;
        }
        while (v6);
      }
    }
    int8x16_t v10 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_20D754900 + (((_BYTE)v8 + (_BYTE)v7) & 0xF)));
    BOOL v11 = (int8x16_t *)((char *)v4 + v7);
    *BOOL v11 = v10;
    v11[1] = v10;
    v11[2] = v10;
    v11[3] = v10;
  }
  return result;
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

atomic_uint *os_unfair_lock_unlock_no_tsd(atomic_uint *result, int a2)
{
  unsigned int v2 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v2 != a2) {
    return (atomic_uint *)_os_unfair_lock_unlock_slow((uint64_t)result, a2, v2);
  }
  return result;
}

atomic_uint *os_unfair_lock_lock_no_tsd(atomic_uint *result, int a2, unsigned int a3)
{
  int v3 = 0;
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v3, a3, memory_order_acquire, memory_order_acquire);
  if (v3) {
    return (atomic_uint *)_os_unfair_lock_lock_slow(result, a2, 0, a3);
  }
  return result;
}

int _setjmp(jmp_buf a1)
{
  uint64_t v21 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 56);
  *(void *)a1 = v1;
  *((void *)a1 + 1) = v2;
  *((void *)a1 + 2) = v3;
  *((void *)a1 + 3) = v4;
  *((void *)a1 + 4) = v5;
  *((void *)a1 + 5) = v6;
  *((void *)a1 + 6) = v7;
  *((void *)a1 + 7) = v8;
  *((void *)a1 + 8) = v9;
  *((void *)a1 + 9) = v10;
  *((void *)a1 + 10) = v11 ^ v21;
  *((void *)a1 + 11) = v12 ^ v21;
  *((void *)a1 + 12) = (unint64_t)&v23 ^ v21;
  *((void *)a1 + 14) = v13;
  *((void *)a1 + 15) = v14;
  *((void *)a1 + 16) = v15;
  *((void *)a1 + 17) = v16;
  *((void *)a1 + 18) = v17;
  *((void *)a1 + 19) = v18;
  *((void *)a1 + 20) = v19;
  *((void *)a1 + 21) = v20;
  return 0;
}

void _longjmp(jmp_buf a1, int a2)
{
}

int sigsetjmp(sigjmp_buf a1, int a2)
{
  a1[46] = a2;
  if (a2) {
    return setjmp(a1);
  }
  else {
    return _setjmp(a1);
  }
}

int setjmp(jmp_buf a1)
{
  *(void *)a1 = v1;
  *((void *)a1 + 1) = v2;
  sigprocmask(1, 0, (sigset_t *)a1 + 44);
  return _setjmp(a1);
}

void siglongjmp(sigjmp_buf a1, int a2)
{
  if (!a1[46]) {
    _longjmp(a1, a2);
  }
  longjmp(a1, a2);
}

void longjmp(jmp_buf a1, int a2)
{
  *(void *)uint64_t v4 = *((void *)a1 + 22);
  sigprocmask(3, v4, 0);
  _sigunaltstack();
  _longjmp(a1, a2);
}

void OSMemoryBarrier(void)
{
}

int32_t OSAtomicIncrement32(int32_t *__theValue)
{
  return atomic_fetch_add_explicit(__theValue, 1u, memory_order_relaxed) + 1;
}

void spin_unlock(OSSpinLock *__lock)
{
}

unint64_t (*_platform_strncmp())(int8x16_t *a1, int8x16_t *a2, unint64_t a3)
{
  return _platform_strncmp_VARIANT_Base;
}

unint64_t (*_platform_strcmp())(int8x16_t *a1, int8x16_t *a2)
{
  return _platform_strcmp_VARIANT_Base;
}

void sys_icache_invalidate(void *start, size_t len)
{
  if (len)
  {
    unint64_t v2 = (unint64_t)start & 0xFFFFFFFFFFFFFFC0;
    size_t v3 = ~((len + (start & 0x3F) - 1) >> 6);
    __dsb(0xBu);
    uint64_t v4 = 20;
    uint64_t v5 = 0;
    do
    {
      __asm { IC              IVAU, X9 }
      v2 += 64;
      if (!--v4)
      {
        if (v5)
        {
LABEL_5:
          __dsb(0xBu);
          uint64_t v4 = 20;
        }
        else
        {
          uint64_t v10 = &cpus_that_need_dsb_for_ic_ivau;
          while (1)
          {
            unsigned int v11 = *v10++;
            uint64_t v5 = v11;
            if (!v11) {
              break;
            }
            if (v5 == MEMORY[0xFFFFFC080]) {
              goto LABEL_5;
            }
          }
          uint64_t v4 = 0;
          uint64_t v5 = 1;
        }
      }
      ++v3;
    }
    while (v3);
    __dsb(0xBu);
    __isb(0xFu);
  }
}

void sys_dcache_flush(void *start, size_t len)
{
}

uint64_t _os_log_simple_shim(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  return __os_log_simple_offset(0, UUID_NULL, UUID_NULL, 0, 0, a1, a2, a3);
}

void spin_lock(OSSpinLock *__lock)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit(__lock, (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  if (v1) {
    _OSSpinLockLockSlow((unsigned int *)__lock);
  }
}

uint64_t _simple_sappend(uint64_t a1, unsigned char *a2)
{
  char v2 = *a2;
  if (*a2)
  {
    uint64_t v4 = a2 + 1;
    do
    {
      uint64_t v5 = *(unsigned char **)(a1 + 8);
      if ((unint64_t)v5 >= *(void *)(a1 + 16))
      {
        (*(void (**)(uint64_t))(a1 + 32))(a1);
        uint64_t v5 = *(unsigned char **)(a1 + 8);
      }
      *(void *)(a1 + 8) = v5 + 1;
      *uint64_t v5 = v2;
      int v6 = *v4++;
      char v2 = v6;
    }
    while (v6);
  }
  return 0;
}

void _sigtramp(void (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __in_sigtramp = a3;
  a1(a3, a4, a5);
  __in_sigtramp = 0;
  __sigreturn();
  __break(1u);
}

void _os_unfair_lock_recursive_abort(unsigned int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_unfair_lock";
  qword_267704BC8 = a1;
  __break(1u);
}

uint64_t _os_log_simple_parse_type(unsigned char *a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 4);
  if (v2 > 0x10 || ((1 << v2) & 0x10007) == 0) {
    return 22;
  }
  uint64_t result = 0;
  *a1 = v2;
  return result;
}

uint64_t _os_log_simple_parse_subsystem(uint64_t a1, unsigned __int16 *a2)
{
  if (!a2[1])
  {
    uint64_t v2 = 0;
    goto LABEL_5;
  }
  uint64_t v2 = (uint64_t)a2 + *a2 + 104;
  if (!*(unsigned char *)(v2 + a2[1] - 1))
  {
LABEL_5:
    uint64_t v3 = 0;
    *(void *)(a1 + 8) = v2;
    return v3;
  }
  return 22;
}

uint64_t _os_log_simple_parse_message(uint64_t a1, _WORD *a2)
{
  if (!*a2 || *((unsigned char *)a2 + (unsigned __int16)*a2 + 103)) {
    return 22;
  }
  uint64_t result = 0;
  *(void *)(a1 + 16) = a2 + 52;
  return result;
}

uint64_t _os_log_simple_parse_timestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  *(void *)(a1 + 24) = v2;
  uint64_t v3 = 22;
  if (v2)
  {
    if (v2 <= mach_continuous_time()) {
      return 0;
    }
    else {
      return 22;
    }
  }
  return v3;
}

uint64_t _os_log_simple_parse_identifiers(void *a1, void *a2)
{
  uint64_t v2 = a2[2];
  a1[4] = v2;
  a1[5] = a2[3];
  a1[6] = a2[4];
  a1[7] = a2[5];
  if (v2) {
    return 0;
  }
  else {
    return 22;
  }
}

void _os_log_simple_reinit_4launchd()
{
  if (*(void *)(MEMORY[0x263EF8C48] + 336) == -1) {
    atomic_ullong v0 = *(void *)(MEMORY[0x263EF8C48] + 344);
  }
  else {
    atomic_ullong v0 = _os_alloc_once((atomic_ullong *)(MEMORY[0x263EF8C48] + 336), 32, (uint64_t)_simple_asl_init_context);
  }
  if (*(unsigned char *)v0)
  {
    int v1 = *(_DWORD *)(v0 + 16);
    if (v1 != -1) {
      _os_log_simple_reinit_4launchd_cold_1(v1);
    }
    *(_DWORD *)(v0 + 16) = _simple_asl_connect();
  }
}

unsigned char *_simple_asl_msg_set(unsigned char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v10 = result;
      uint64_t result = (unsigned char *)_simple_sprintf(result, " [", a3, a4, a5, a6, a7, a8, v43);
      if (!result)
      {
        uint64_t result = (unsigned char *)_simple_esprintf(v10, (uint64_t (*)(uint64_t))_simple_asl_escape_key, "%s", v11, v12, v13, v14, v15, a2);
        if (!result)
        {
          if (a3)
          {
            uint64_t result = (unsigned char *)_simple_esprintf(v10, (uint64_t (*)(uint64_t))_simple_asl_escape_val, " %s", v16, v17, v18, v19, v20, a3);
            if (result) {
              return result;
            }
            if (!_platform_strcmp_0(a2, (uint64_t)"Message", v21, v22, v23, v24, v25, v26))
            {
              uint64_t v27 = _simple_string((unsigned char **)v10);
              unint64_t v28 = _platform_strlen(v27);
              if (!_platform_strcmp_0(v27 + v28 - 2, (uint64_t)"\\n", v29, v30, v31, v32, v33, v34))
              {
                uint64_t v41 = v28 + v27 - 4;
                do
                {
                  *(unsigned char *)(v41 + 2) = 0;
                  int v42 = _platform_strcmp_0(v41, (uint64_t)"\\n", v35, v36, v37, v38, v39, v40);
                  v41 -= 2;
                }
                while (!v42);
              }
              _simple_sresize((uint64_t *)v10);
            }
          }
          return (unsigned char *)_simple_sappend((uint64_t)v10, "]");
        }
      }
    }
  }
  return result;
}

const char *_simple_asl_escape_key(int a1)
{
  if (a1 <= 90)
  {
    if (a1 == 10) {
      return "\\n";
    }
    if (a1 == 32) {
      return "\\s";
    }
  }
  else
  {
    switch(a1)
    {
      case ']':
        return "\\]";
      case '\\':
        return "\\\\"";
      case '[':
        return "\\[";
    }
  }
  return 0;
}

const char *_simple_asl_escape_val(int a1)
{
  if (a1 > 91)
  {
    if (a1 != 92)
    {
      if (a1 == 93) {
        return "\\]";
      }
      return 0;
    }
    return "\\\\"";
  }
  else
  {
    if (a1 != 10)
    {
      if (a1 == 91) {
        return "\\[";
      }
      return 0;
    }
    return "\\n";
  }
}

uint64_t _simple_asl_send(unsigned char *a1)
{
  uint64_t result = _simple_asl_get_fd();
  if ((result & 0x80000000) == 0)
  {
    __gettimeofday();
    uint64_t result = _simple_sprintf(a1, " [PID ", v3, v4, v5, v6, v7, v8, v56);
    if (!result)
    {
      pid_t v9 = getpid();
      uint64_t result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%u", v10, v11, v12, v13, v14, v9);
      if (!result)
      {
        uint64_t result = _simple_sprintf(a1, "] [UID ", v15, v16, v17, v18, v19, v20, v57);
        if (!result)
        {
          uid_t v21 = getuid();
          uint64_t result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%u", v22, v23, v24, v25, v26, v21);
          if (!result)
          {
            uint64_t result = _simple_sprintf(a1, "] [GID ", v27, v28, v29, v30, v31, v32, v58);
            if (!result)
            {
              gid_t v33 = getgid();
              uint64_t result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%u", v34, v35, v36, v37, v38, v33);
              if (!result)
              {
                uint64_t result = _simple_sprintf(a1, "] [Time ", v39, v40, v41, v42, v43, v44, v59);
                if (!result)
                {
                  uint64_t result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%lu", v45, v46, v47, v48, v49, v60);
                  if (!result)
                  {
                    uint64_t result = _simple_sappend((uint64_t)a1, "] [TimeNanoSec ");
                    if (!result)
                    {
                      uint64_t result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%d", v50, v51, v52, v53, v54, 1000 * v61);
                      if (!result)
                      {
                        uint64_t result = _simple_sappend((uint64_t)a1, "]\n");
                        if (!result)
                        {
                          uint64_t v55 = _simple_string((unsigned char **)a1);
                          _platform_strlen(v55);
                          return __sendto();
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _simple_asl_log_prog(int a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5 = os_log_simple_type_from_asl(a1);

  return _os_log_simple_shim(v5, a2, a3);
}

ssize_t _simple_vdprintf(int a1, unsigned __int8 *a2, int *a3)
{
  int v6 = a1;
  v5[0] = v4;
  v5[1] = v4;
  v5[2] = v5;
  uint64_t v7 = _flush_reset;
  __simple_bprintf(v5, 0, a2, a3);
  return _flush((ssize_t)v5);
}

ssize_t _flush_reset(void *a1)
{
  ssize_t result = _flush((ssize_t)a1);
  a1[1] = *a1;
  return result;
}

ssize_t _flush(ssize_t result)
{
  int v1 = *(char **)result;
  int64_t v2 = *(void *)(result + 8) - *(void *)result;
  if (v2 >= 1)
  {
    ssize_t v3 = result;
    while (1)
    {
      while (1)
      {
        ssize_t result = write(*(_DWORD *)(v3 + 24), v1, v2);
        if (result < 0) {
          break;
        }
        BOOL v4 = v2 <= result;
        v2 -= result;
        v1 += v2;
        if (v4) {
          return result;
        }
      }
      if (*__error() != 4)
      {
        ssize_t result = (ssize_t)__error();
        if (*(_DWORD *)result != 35) {
          break;
        }
      }
    }
  }
  return result;
}

ssize_t _simple_dprintf(int a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return _simple_vdprintf(a1, a2, &a9);
}

char *_enlarge(uint64_t a1)
{
  kern_return_t v8;
  vm_address_t v9;
  char *v10;
  vm_address_t v11;
  vm_address_t v12;
  vm_address_t address;

  int64_t v2 = (vm_address_t *)(a1 + 16);
  mach_vm_address_t address = *(void *)(a1 + 16) + 1;
  ssize_t v3 = (vm_map_t *)MEMORY[0x263EF8C60];
  BOOL v4 = (vm_address_t *)MEMORY[0x263EF8C78];
  ssize_t result = (char *)vm_allocate(*MEMORY[0x263EF8C60], &address, *MEMORY[0x263EF8C78], 0);
  if (result)
  {
    unint64_t v6 = *(void *)(a1 + 16) - *(void *)a1 + 1;
    vm_size_t v7 = (v6 + *v4) & -(uint64_t)*v4;
    uint64_t v8 = vm_allocate(*v3, &address, v7, 1);
    if (v8) {
      _enlarge_cold_1(v8);
    }
    pid_t v9 = address - *(void *)a1;
    ssize_t result = _platform_memmove((char *)address, *(char **)a1, v6);
    uint64_t v10 = *(char **)a1;
    uint64_t v11 = *v4;
    if (((*v4 - 1) & *(void *)a1) != 0)
    {
      v6 &= -(uint64_t)v11;
      uint64_t v10 = (char *)((unint64_t)&v10[v11] & -(uint64_t)v11);
      *(void *)a1 = v10;
      uint64_t v12 = v7 + address - 1;
    }
    else
    {
      uint64_t v12 = *v2 + v11 + v9;
    }
    *int64_t v2 = v12;
    if (v6) {
      ssize_t result = (char *)mach_vm_deallocate(*v3, (mach_vm_address_t)v10, v6);
    }
    *(void *)a1 = address;
    int64_t v2 = (vm_address_t *)(a1 + 8);
  }
  else
  {
    pid_t v9 = *v4;
  }
  *v2 += v9;
  return result;
}

uint64_t _simple_esprintf(unsigned char *a1, uint64_t (*a2)(uint64_t), unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return 0;
}

unint64_t _simple_sresize(uint64_t *a1)
{
  uint64_t v2 = *a1;
  unint64_t result = _platform_strlen(*a1);
  a1[1] = v2 + result;
  return result;
}

uint64_t _simple_esappend(uint64_t a1, uint64_t (*a2)(void), unsigned __int8 *a3)
{
  unsigned __int8 v3 = *a3;
  if (*a3)
  {
    BOOL v4 = a3;
    do
    {
      if (a2 && (vm_size_t v7 = (unsigned char *)a2(v3)) != 0)
      {
        char v8 = *v7;
        if (*v7)
        {
          pid_t v9 = v7 + 1;
          do
          {
            uint64_t v10 = *(unsigned char **)(a1 + 8);
            if ((unint64_t)v10 >= *(void *)(a1 + 16))
            {
              (*(void (**)(uint64_t))(a1 + 32))(a1);
              uint64_t v10 = *(unsigned char **)(a1 + 8);
            }
            *(void *)(a1 + 8) = v10 + 1;
            *uint64_t v10 = v8;
            int v11 = *v9++;
            char v8 = v11;
          }
          while (v11);
        }
      }
      else
      {
        uint64_t v12 = *(unsigned __int8 **)(a1 + 8);
        if ((unint64_t)v12 >= *(void *)(a1 + 16))
        {
          (*(void (**)(uint64_t))(a1 + 32))(a1);
          uint64_t v12 = *(unsigned __int8 **)(a1 + 8);
        }
        *(void *)(a1 + 8) = v12 + 1;
        *uint64_t v12 = v3;
      }
      int v13 = *++v4;
      unsigned __int8 v3 = v13;
    }
    while (v13);
  }
  return 0;
}

ssize_t _simple_put(ssize_t result, int a2)
{
  *(_DWORD *)(result + 24) = a2;
  return _flush(result);
}

ssize_t _simple_putline(ssize_t a1, int a2)
{
  *(_DWORD *)(a1 + 24) = a2;
  unsigned __int8 v3 = *(unsigned char **)(a1 + 8);
  *(void *)(a1 + 8) = v3 + 1;
  *unsigned __int8 v3 = 10;
  ssize_t result = _flush(a1);
  --*(void *)(a1 + 8);
  return result;
}

std::ios_base *__cdecl oct(std::ios_base *__str)
{
  int v5 = v4;
  unint64_t v6 = v1;
  char v27 = 0;
  if (v2)
  {
    char v8 = &v27;
    do
    {
      *--char v8 = v2 & 7 | 0x30;
      BOOL v9 = v2 >= 8;
      v2 >>= 3;
    }
    while (v9);
  }
  else
  {
    char v8 = &v26;
    char v26 = 48;
  }
  uint64_t v10 = v3;
  ssize_t result = (std::ios_base *)_platform_strlen((uint64_t)v8);
  uint64_t v12 = v10 - (void)result;
  if (v12 >= 1)
  {
    if (v5) {
      uint64_t v13 = 48;
    }
    else {
      uint64_t v13 = 32;
    }
    do
    {
      if (v6 && (ssize_t result = (std::ios_base *)v6(v13)) != 0)
      {
        char v14 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          uint64_t v15 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            uint64_t v16 = *(unsigned char **)&__str->__fmtflags_;
            if ((unint64_t)v16 >= __str->__precision_)
            {
              ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              uint64_t v16 = *(unsigned char **)&__str->__fmtflags_;
            }
            *(void *)&__str->__fmtflags_ = v16 + 1;
            *uint64_t v16 = v14;
            int v17 = *v15++;
            char v14 = v17;
          }
          while (v17);
        }
      }
      else
      {
        uint64_t v18 = *(unsigned char **)&__str->__fmtflags_;
        if ((unint64_t)v18 >= __str->__precision_)
        {
          ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          uint64_t v18 = *(unsigned char **)&__str->__fmtflags_;
        }
        *(void *)&__str->__fmtflags_ = v18 + 1;
        *uint64_t v18 = v13;
      }
    }
    while (v12-- > 1);
  }
  while (1)
  {
    char v25 = *v8;
    if (!*v8) {
      break;
    }
    if (v6 && (ssize_t result = (std::ios_base *)v6(*v8)) != 0)
    {
      char v20 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        uid_t v21 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          uint64_t v22 = *(unsigned char **)&__str->__fmtflags_;
          if ((unint64_t)v22 >= __str->__precision_)
          {
            ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            uint64_t v22 = *(unsigned char **)&__str->__fmtflags_;
          }
          *(void *)&__str->__fmtflags_ = v22 + 1;
          *uint64_t v22 = v20;
          int v23 = *v21++;
          char v20 = v23;
        }
        while (v23);
      }
    }
    else
    {
      uint64_t v24 = *(char **)&__str->__fmtflags_;
      if ((unint64_t)v24 >= __str->__precision_)
      {
        ssize_t result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        uint64_t v24 = *(char **)&__str->__fmtflags_;
      }
      *(void *)&__str->__fmtflags_ = v24 + 1;
      *uint64_t v24 = v25;
    }
    ++v8;
  }
  return result;
}

unsigned char *udec(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t a3, int a4, int a5)
{
  char v27 = 0;
  if (a3)
  {
    char v8 = &v27;
    do
    {
      *--char v8 = (a3 % 0xA) | 0x30;
      BOOL v9 = a3 >= 0xA;
      a3 /= 0xAuLL;
    }
    while (v9);
  }
  else
  {
    char v8 = &v26;
    char v26 = 48;
  }
  uint64_t v10 = a4;
  ssize_t result = (unsigned char *)_platform_strlen((uint64_t)v8);
  uint64_t v12 = v10 - (void)result;
  if (v12 >= 1)
  {
    if (a5) {
      uint64_t v13 = 48;
    }
    else {
      uint64_t v13 = 32;
    }
    do
    {
      if (a2 && (ssize_t result = (unsigned char *)a2(v13)) != 0)
      {
        char v14 = *result;
        if (*result)
        {
          uint64_t v15 = result + 1;
          do
          {
            uint64_t v16 = *(unsigned char **)(a1 + 8);
            if ((unint64_t)v16 >= *(void *)(a1 + 16))
            {
              ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
              uint64_t v16 = *(unsigned char **)(a1 + 8);
            }
            *(void *)(a1 + 8) = v16 + 1;
            *uint64_t v16 = v14;
            int v17 = *v15++;
            char v14 = v17;
          }
          while (v17);
        }
      }
      else
      {
        uint64_t v18 = *(unsigned char **)(a1 + 8);
        if ((unint64_t)v18 >= *(void *)(a1 + 16))
        {
          ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
          uint64_t v18 = *(unsigned char **)(a1 + 8);
        }
        *(void *)(a1 + 8) = v18 + 1;
        *uint64_t v18 = v13;
      }
    }
    while (v12-- > 1);
  }
  while (1)
  {
    char v25 = *v8;
    if (!*v8) {
      break;
    }
    if (a2 && (ssize_t result = (unsigned char *)a2(*v8)) != 0)
    {
      char v20 = *result;
      if (*result)
      {
        uid_t v21 = result + 1;
        do
        {
          uint64_t v22 = *(unsigned char **)(a1 + 8);
          if ((unint64_t)v22 >= *(void *)(a1 + 16))
          {
            ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
            uint64_t v22 = *(unsigned char **)(a1 + 8);
          }
          *(void *)(a1 + 8) = v22 + 1;
          *uint64_t v22 = v20;
          int v23 = *v21++;
          char v20 = v23;
        }
        while (v23);
      }
    }
    else
    {
      uint64_t v24 = *(char **)(a1 + 8);
      if ((unint64_t)v24 >= *(void *)(a1 + 16))
      {
        ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
        uint64_t v24 = *(char **)(a1 + 8);
      }
      *(void *)(a1 + 8) = v24 + 1;
      *uint64_t v24 = v25;
    }
    ++v8;
  }
  return result;
}

unsigned char *ydec(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t a3, int a4, int a5)
{
  if (a3 < 0xA00000)
  {
    if (a3 >> 11 < 5)
    {
      ssize_t result = udec(a1, a2, a3, a4, a5);
      if (a2 && (ssize_t result = (unsigned char *)a2(98)) != 0)
      {
        char v24 = *result;
        if (*result)
        {
          char v25 = result + 1;
          do
          {
            char v26 = *(unsigned char **)(a1 + 8);
            if ((unint64_t)v26 >= *(void *)(a1 + 16))
            {
              ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
              char v26 = *(unsigned char **)(a1 + 8);
            }
            *(void *)(a1 + 8) = v26 + 1;
            *char v26 = v24;
            int v27 = *v25++;
            char v24 = v27;
          }
          while (v27);
        }
      }
      else
      {
        uint64_t v28 = *(unsigned char **)(a1 + 8);
        if ((unint64_t)v28 >= *(void *)(a1 + 16))
        {
          ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
          uint64_t v28 = *(unsigned char **)(a1 + 8);
        }
        *(void *)(a1 + 8) = v28 + 1;
        *uint64_t v28 = 98;
      }
    }
    else
    {
      ssize_t result = udec(a1, a2, (a3 + 512) >> 10, a4, a5);
      uint64_t v16 = "KB";
      unsigned __int8 v17 = 75;
      do
      {
        if (a2 && (ssize_t result = (unsigned char *)a2(v17)) != 0)
        {
          char v18 = *result;
          if (*result)
          {
            uint64_t v19 = result + 1;
            do
            {
              char v20 = *(unsigned char **)(a1 + 8);
              if ((unint64_t)v20 >= *(void *)(a1 + 16))
              {
                ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
                char v20 = *(unsigned char **)(a1 + 8);
              }
              *(void *)(a1 + 8) = v20 + 1;
              *char v20 = v18;
              int v21 = *v19++;
              char v18 = v21;
            }
            while (v21);
          }
        }
        else
        {
          uint64_t v22 = *(unsigned __int8 **)(a1 + 8);
          if ((unint64_t)v22 >= *(void *)(a1 + 16))
          {
            ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
            uint64_t v22 = *(unsigned __int8 **)(a1 + 8);
          }
          *(void *)(a1 + 8) = v22 + 1;
          *uint64_t v22 = v17;
        }
        unsigned __int8 v23 = *++v16;
        unsigned __int8 v17 = v23;
      }
      while (v16 != "");
    }
  }
  else
  {
    ssize_t result = udec(a1, a2, (a3 + 0x80000) >> 20, a4, a5);
    char v8 = "MB";
    unsigned __int8 v9 = 77;
    do
    {
      if (a2 && (ssize_t result = (unsigned char *)a2(v9)) != 0)
      {
        char v10 = *result;
        if (*result)
        {
          int v11 = result + 1;
          do
          {
            uint64_t v12 = *(unsigned char **)(a1 + 8);
            if ((unint64_t)v12 >= *(void *)(a1 + 16))
            {
              ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
              uint64_t v12 = *(unsigned char **)(a1 + 8);
            }
            *(void *)(a1 + 8) = v12 + 1;
            *uint64_t v12 = v10;
            int v13 = *v11++;
            char v10 = v13;
          }
          while (v13);
        }
      }
      else
      {
        char v14 = *(unsigned __int8 **)(a1 + 8);
        if ((unint64_t)v14 >= *(void *)(a1 + 16))
        {
          ssize_t result = (unsigned char *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
          char v14 = *(unsigned __int8 **)(a1 + 8);
        }
        *(void *)(a1 + 8) = v14 + 1;
        *char v14 = v9;
      }
      unsigned __int8 v15 = *++v8;
      unsigned __int8 v9 = v15;
    }
    while (v8 != "");
  }
  return result;
}

int sys_cache_control(int function, void *start, size_t len)
{
  if (function == 2)
  {
    sys_dcache_flush(start, len);
    return 0;
  }
  if (function == 1)
  {
    sys_icache_invalidate(start, len);
    return 0;
  }
  return 45;
}

uint64_t os_lock_lock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
}

uint64_t os_lock_trylock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
}

uint64_t os_lock_unlock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(void *)a1 + 24))(a1);
}

unsigned int *_OSSpinLockLockSlow(unsigned int *result)
{
  for (int i = 100; ; --i)
  {
    while (1)
    {
      signed int v2 = __ldxr(result);
      if (v2) {
        break;
      }
      __clrex();
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v2, 1u, memory_order_acquire, memory_order_acquire);
      if (!v2) {
        return result;
      }
    }
    if (v2 != 1)
    {
      __clrex();
      _os_lock_corruption_abort((uint64_t)result, v2);
    }
    if (!i) {
      break;
    }
    __wfe();
  }
  __clrex();

  return (unsigned int *)_OSSpinLockLockYield((atomic_uint *)result);
}

unint64_t _OSSpinLockLockYield(atomic_uint *a1)
{
  unint64_t result = mach_timebase_info(&info);
  if (result)
  {
    unint64_t v3 = -1;
  }
  else
  {
    unint64_t v4 = 1000000 * (unint64_t)info.denom / info.numer;
    unint64_t result = mach_absolute_time();
    unint64_t v3 = result + v4;
  }
  uint64_t v5 = 1;
  uint64_t v6 = 1;
  while (1)
  {
    atomic_uint v7 = *a1;
    if (!*a1)
    {
      atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v7, 1u, memory_order_acquire, memory_order_acquire);
      if (!v7) {
        break;
      }
    }
    if (v7 != 1) {
      _os_lock_corruption_abort(result, v7);
    }
    unint64_t result = MEMORY[0x21055D0E0](0, v6, v5);
    if (v6 == 2)
    {
      uint64_t v5 = (v5 + 1);
    }
    else
    {
      unint64_t result = mach_absolute_time();
      if (result < v3) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 2;
      }
    }
  }
  return result;
}

BOOL OSSpinLockTry(OSSpinLock *__lock)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit(__lock, (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

BOOL spin_lock_try(atomic_uint *a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

unsigned int *_os_lock_spin_lock(uint64_t a1)
{
  int v1 = 0;
  unint64_t result = (unsigned int *)(a1 + 8);
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  if (v1) {
    return _OSSpinLockLockSlow(result);
  }
  return result;
}

BOOL _os_lock_spin_trylock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

uint64_t _os_lock_spin_unlock(uint64_t result)
{
  return result;
}

void _os_lock_handoff_lock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    _os_lock_handoff_lock_slow(a1);
  }
}

BOOL _os_lock_handoff_trylock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

uint64_t _os_lock_handoff_unlock(uint64_t result)
{
  return result;
}

void _os_lock_handoff_lock_slow(uint64_t a1)
{
  char v2 = 0;
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v4 = 100;
  int v5 = 1;
LABEL_2:
  int v6 = 1 - v4;
  while (1)
  {
    int v7 = v6;
    int v8 = *(_DWORD *)(a1 + 8);
    if (!v8)
    {
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v8, v3, memory_order_acquire, memory_order_acquire);
      if (!v8) {
        break;
      }
    }
    if (v8 == v3) {
      _os_lock_recursive_abort(v3);
    }
    ++v6;
    if (v7 == 1)
    {
      MEMORY[0x21055D0E0]();
LABEL_8:
      ++v5;
      int v4 = -v7;
      char v2 = 1;
      goto LABEL_2;
    }
    MEMORY[0x21055D0E0]();
    if (v2) {
      goto LABEL_8;
    }
  }
}

uint64_t os_unfair_lock_trylock_with_options(atomic_uint *a1, int a2, uint64_t a3)
{
  int v3 = 0;
  unsigned int v4 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v3, v4, memory_order_acquire, memory_order_acquire);
  if (v3) {
    return _os_unfair_lock_trylock_with_options_slow(a1, a2, a3, v4);
  }
  else {
    return 1;
  }
}

uint64_t _os_unfair_lock_trylock_with_options_slow(atomic_uint *a1, int a2, uint64_t a3, unsigned int a4)
{
  if ((a2 & 0x2000000) == 0)
  {
    if (a3)
    {
      mach_timebase_info(&info);
      unint64_t v8 = info.denom * a3 / info.numer;
      uint64_t v9 = mach_absolute_time();
      return _os_unfair_lock_lock_slow(a1, a2 | 0x2000000u, v9 + v8, a4);
    }
    return 0;
  }
  if (mach_absolute_time() > a3) {
    return 0;
  }

  return _os_unfair_lock_lock_slow(a1, a2, a3, a4);
}

atomic_uint *os_unfair_lock_lock_with_flags(atomic_uint *result, int a2)
{
  int v2 = 0;
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v2, v3, memory_order_acquire, memory_order_acquire);
  if (v2) {
    return (atomic_uint *)_os_unfair_lock_lock_slow(result, a2, 0, v3);
  }
  return result;
}

BOOL os_unfair_recursive_lock_owned(_DWORD *a1)
{
  int v1 = *a1 | 1;
  return v1 == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
}

_DWORD *os_unfair_recursive_lock_unlock_forked_child(_DWORD *result)
{
  if (!*result) {
    os_unfair_recursive_lock_unlock_forked_child_cold_1();
  }
  int v1 = result[1];
  if (v1)
  {
    int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    result[1] = v1 - 1;
  }
  else
  {
    int v2 = 0;
  }
  *unint64_t result = v2;
  return result;
}

atomic_uint *_os_lock_unfair_lock(uint64_t a1)
{
  int v1 = 0;
  unint64_t result = (atomic_uint *)(a1 + 8);
  unsigned int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, v3, memory_order_acquire, memory_order_acquire);
  if (v1) {
    return (atomic_uint *)_os_unfair_lock_lock_slow(result, 0, 0, v3);
  }
  return result;
}

BOOL _os_lock_unfair_trylock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

atomic_uint *_os_lock_unfair_unlock(uint64_t a1)
{
  unint64_t result = (atomic_uint *)(a1 + 8);
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v3 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v3 != v2) {
    return (atomic_uint *)_os_unfair_lock_unlock_slow((uint64_t)result, v2, v3);
  }
  return result;
}

uint64_t _os_nospin_lock_lock(uint64_t result)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    return _os_nospin_lock_lock_slow(result);
  }
  return result;
}

uint64_t _os_nospin_lock_lock_slow(uint64_t result)
{
  int v1 = (atomic_uint *)result;
  int v2 = 0;
  int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v4 = 1;
  while (1)
  {
    atomic_uint v5 = *v1;
    if (!*v1)
    {
      atomic_compare_exchange_strong_explicit(v1, (unsigned int *)&v5, v3 & ~v2, memory_order_acquire, memory_order_acquire);
      if (!v5) {
        break;
      }
    }
    unsigned int v6 = v5 & 0xFFFFFFFE;
    if (v5 != (v5 & 0xFFFFFFFE) && v6 != 0)
    {
      atomic_uint v8 = v5;
      atomic_compare_exchange_strong_explicit(v1, (unsigned int *)&v8, v6, memory_order_relaxed, memory_order_relaxed);
      if (v8 != v5) {
        continue;
      }
    }
    unint64_t result = __ulock_wait();
    if ((result & 0x80000000) != 0)
    {
      int v9 = -(int)result;
      if (result != -4 && v9 != 14)
      {
        if (v9 != 60)
        {
          qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
          qword_267704BC8 = -(int)result;
          __break(1u);
          return result;
        }
        ++v4;
      }
    }
    else if (result)
    {
      int v2 = 1;
    }
  }
  return result;
}

BOOL _os_nospin_lock_trylock(atomic_uint *a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

void _os_nospin_lock_unlock(atomic_uint *a1)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v2 = atomic_exchange_explicit(a1, 0, memory_order_release);
  if (v2 != v1) {
    _os_nospin_lock_unlock_slow((uint64_t)a1, v2);
  }
}

void _os_nospin_lock_unlock_slow(uint64_t a1, unsigned int a2)
{
  if ((a2 | 1) == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24))
  {
    if (a2)
    {
      uint64_t v3 = a2;
      qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
      qword_267704BC8 = a2;
      __break(1u);
LABEL_8:
      qword_267704B98 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
      qword_267704BC8 = v3;
      __break(1u);
    }
    else
    {
      while (1)
      {
        int v2 = __ulock_wake();
        if ((v2 & 0x80000000) == 0) {
          break;
        }
        if (v2 != -4)
        {
          uint64_t v3 = -v2;
          if (v3 != 2) {
            goto LABEL_8;
          }
          return;
        }
      }
    }
  }
}

atomic_uint *_os_lock_nospin_lock(uint64_t a1)
{
  int v1 = 0;
  unint64_t result = (atomic_uint *)(a1 + 8);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    return (atomic_uint *)_os_nospin_lock_lock_slow((uint64_t)result);
  }
  return result;
}

BOOL _os_lock_nospin_trylock(uint64_t a1)
{
  int v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

void _os_lock_nospin_unlock(uint64_t a1)
{
  int v1 = (atomic_uint *)(a1 + 8);
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v3 = atomic_exchange_explicit(v1, 0, memory_order_release);
  if (v3 != v2) {
    _os_nospin_lock_unlock_slow((uint64_t)v1, v3);
  }
}

atomic_ullong *__os_once_reset(atomic_ullong *result)
{
  int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v2 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v1 != v2) {
    return (atomic_ullong *)_os_once_gate_broadcast((uint64_t)result, v2, v1);
  }
  return result;
}

uint64_t os_sync_wait_on_address_with_deadline(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    int v6 = 22;
    if (a6 && a5 == 32)
    {
      uint64_t result = __ulock_wait2();
      if ((result & 0x80000000) == 0) {
        return result;
      }
      int v6 = -(int)result;
    }
  }
  else
  {
    int v6 = 22;
  }
  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address_with_timeout(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    int v6 = 22;
    if (a6 && a5 == 32)
    {
      uint64_t result = __ulock_wait2();
      if ((result & 0x80000000) == 0) {
        return result;
      }
      int v6 = -(int)result;
    }
  }
  else
  {
    int v6 = 22;
  }
  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    uint64_t result = __ulock_wait2();
    if ((result & 0x80000000) == 0) {
      return result;
    }
    int v5 = -(int)result;
  }
  else
  {
    int v5 = 22;
  }
  *__error() = v5;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_any(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    uint64_t result = __ulock_wake();
    if ((result & 0x80000000) == 0) {
      return result;
    }
    int v4 = -(int)result;
  }
  else
  {
    int v4 = 22;
  }
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_all(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    uint64_t result = __ulock_wake();
    if ((result & 0x80000000) == 0) {
      return result;
    }
    int v4 = -(int)result;
  }
  else
  {
    int v4 = 22;
  }
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

uint64_t _os_semaphore_signal()
{
  uint64_t result = MEMORY[0x21055D0A0]();
  if (result) {
    _os_semaphore_signal_cold_1(result);
  }
  return result;
}

uint64_t _os_semaphore_wait(uint64_t a1)
{
  while (1)
  {
    uint64_t result = MEMORY[0x21055D0B0](a1);
    if (!result) {
      break;
    }
    if (result != 14) {
      _os_semaphore_wait_cold_1(result);
    }
  }
  return result;
}

int32_t OSAtomicAdd32(int32_t __theAmount, int32_t *__theValue)
{
  return atomic_fetch_add_explicit(__theValue, __theAmount, memory_order_relaxed) + __theAmount;
}

int32_t OSAtomicAdd32Barrier(int32_t __theAmount, int32_t *__theValue)
{
  return atomic_fetch_add(__theValue, __theAmount) + __theAmount;
}

int32_t OSAtomicIncrement32Barrier(int32_t *__theValue)
{
  return atomic_fetch_add(__theValue, 1u) + 1;
}

int32_t OSAtomicDecrement32(int32_t *__theValue)
{
  return atomic_fetch_add_explicit(__theValue, 0xFFFFFFFF, memory_order_relaxed) - 1;
}

int32_t OSAtomicDecrement32Barrier(int32_t *__theValue)
{
  return atomic_fetch_add(__theValue, 0xFFFFFFFF) - 1;
}

int64_t OSAtomicAdd64Barrier(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add(__theValue, __theAmount) + __theAmount;
}

int64_t OSAtomicIncrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add_explicit(__theValue, 1uLL, memory_order_relaxed) + 1;
}

int64_t OSAtomicIncrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add(__theValue, 1uLL) + 1;
}

int64_t OSAtomicDecrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add_explicit(__theValue, 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed) - 1;
}

int64_t OSAtomicDecrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  return atomic_fetch_add(__theValue, 0xFFFFFFFFFFFFFFFFLL) - 1;
}

int32_t OSAtomicAnd32(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_and_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed) & __theMask;
}

int32_t OSAtomicAnd32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_and((atomic_uint *volatile)__theValue, __theMask) & __theMask;
}

int32_t OSAtomicAnd32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_and_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed);
}

int32_t OSAtomicAnd32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_and((atomic_uint *volatile)__theValue, __theMask);
}

int32_t OSAtomicOr32(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_or_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed) | __theMask;
}

int32_t OSAtomicOr32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_or((atomic_uint *volatile)__theValue, __theMask) | __theMask;
}

int32_t OSAtomicOr32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_or_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed);
}

int32_t OSAtomicOr32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_or((atomic_uint *volatile)__theValue, __theMask);
}

int32_t OSAtomicXor32(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_xor_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed) ^ __theMask;
}

int32_t OSAtomicXor32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_xor((atomic_uint *volatile)__theValue, __theMask) ^ __theMask;
}

int32_t OSAtomicXor32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_xor_explicit((atomic_uint *volatile)__theValue, __theMask, memory_order_relaxed);
}

int32_t OSAtomicXor32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  return atomic_fetch_xor((atomic_uint *volatile)__theValue, __theMask);
}

BOOL OSAtomicCompareAndSwap32(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  int32_t v3 = __oldValue;
  atomic_compare_exchange_strong_explicit(__theValue, (unsigned int *)&v3, __newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwap32Barrier(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  int32_t v3 = __oldValue;
  atomic_compare_exchange_strong(__theValue, (unsigned int *)&v3, __newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapPtr(void *__oldValue, void *__newValue, void **__theValue)
{
  int32_t v3 = __oldValue;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)__theValue, (unint64_t *)&v3, (unint64_t)__newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapPtrBarrier(void *__oldValue, void *__newValue, void **__theValue)
{
  int32_t v3 = __oldValue;
  atomic_compare_exchange_strong((atomic_ullong *volatile)__theValue, (unint64_t *)&v3, (unint64_t)__newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapInt(int __oldValue, int __newValue, int *__theValue)
{
  int v3 = __oldValue;
  atomic_compare_exchange_strong_explicit(__theValue, (unsigned int *)&v3, __newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapIntBarrier(int __oldValue, int __newValue, int *__theValue)
{
  int v3 = __oldValue;
  atomic_compare_exchange_strong(__theValue, (unsigned int *)&v3, __newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapLong(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  uint64_t v3 = __oldValue;
  atomic_compare_exchange_strong_explicit(__theValue, (unint64_t *)&v3, __newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwapLongBarrier(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  uint64_t v3 = __oldValue;
  atomic_compare_exchange_strong(__theValue, (unint64_t *)&v3, __newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwap64(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  int64_t v3 = __oldValue;
  atomic_compare_exchange_strong_explicit(__theValue, (unint64_t *)&v3, __newValue, memory_order_relaxed, memory_order_relaxed);
  return v3 == __oldValue;
}

BOOL OSAtomicCompareAndSwap64Barrier(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  int64_t v3 = __oldValue;
  atomic_compare_exchange_strong(__theValue, (unint64_t *)&v3, __newValue);
  return v3 == __oldValue;
}

BOOL OSAtomicTestAndSet(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  if ((__theAddress & 3) == 0) {
    unint64_t v2 = (unint64_t)__theAddress;
  }
  return (atomic_fetch_or_explicit((atomic_uint *volatile)(v2 + (((__n + 8 * (__theAddress & 3)) >> 3) & 0x1FFFFFFC)), 0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18), memory_order_relaxed) & (0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) != 0;
}

BOOL OSAtomicTestAndSetBarrier(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  if ((__theAddress & 3) == 0) {
    unint64_t v2 = (unint64_t)__theAddress;
  }
  return (atomic_fetch_or((atomic_uint *volatile)(v2 + (((__n + 8 * (__theAddress & 3)) >> 3) & 0x1FFFFFFC)), 0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18)) & (0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) != 0;
}

BOOL OSAtomicTestAndClear(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  if ((__theAddress & 3) == 0) {
    unint64_t v2 = (unint64_t)__theAddress;
  }
  return (atomic_fetch_and_explicit((atomic_uint *volatile)(v2 + (((__n + 8 * (__theAddress & 3)) >> 3) & 0x1FFFFFFC)), ~(0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18)), memory_order_relaxed) & (0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) != 0;
}

BOOL OSAtomicTestAndClearBarrier(uint32_t __n, void *__theAddress)
{
  unint64_t v2 = (unint64_t)__theAddress & 0xFFFFFFFFFFFFFFFCLL;
  if ((__theAddress & 3) == 0) {
    unint64_t v2 = (unint64_t)__theAddress;
  }
  return (atomic_fetch_and((atomic_uint *volatile)(v2 + (((__n + 8 * (__theAddress & 3)) >> 3) & 0x1FFFFFFC)), ~(0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) & (0x80u >> (__n & 7) << ((__n + 8 * (__theAddress & 3)) & 0x18))) != 0;
}

unint64_t *_OSAtomicEnqueue_misalign(unint64_t *result, unint64_t a2, uint64_t a3)
{
  unint64_t v3 = *result;
  do
  {
    do
    {
      *(void *)(a2 + a3) = v3;
      unint64_t v4 = __ldxr(result);
      BOOL v5 = v3 == v4;
      unint64_t v3 = v4;
    }
    while (!v5);
    unint64_t v3 = v4;
  }
  while (__stlxr(a2, result));
  return result;
}

unint64_t _OSAtomicDequeue_misalign(unint64_t *a1, uint64_t a2)
{
  while (1)
  {
    unint64_t result = __ldaxr(a1);
    if (!result) {
      break;
    }
    if (!__stxr(*(void *)(result + a2), a1)) {
      return result;
    }
  }
  __clrex();
  return result;
}

uint64_t _sigunaltstack()
{
  return __sigreturn();
}

char *_platform_memccpy(char *a1, char *a2, unsigned int a3, unint64_t a4)
{
  if (!a4) {
    return 0;
  }
  unint64_t v7 = _platform_memchr((uint64_t)a2, a3, a4);
  if (v7)
  {
    unint64_t v8 = v7 - (void)a2 + 1;
    _platform_memmove(a1, a2, v8);
    return &a1[v8];
  }
  else
  {
    _platform_memmove(a1, a2, a4);
    return 0;
  }
}

uint64_t sub_20D756BF0()
{
  return 0;
}

BOOL _platform_memcmp_zero_aligned8(int8x16_t *a1, unint64_t a2)
{
  if (a2 < 0x40)
  {
    if (a2)
    {
      uint64_t v12 = 0;
      do
      {
        uint64_t v13 = a1->i64[0];
        a1 = (int8x16_t *)((char *)a1 + 8);
        v12 |= v13;
        BOOL v9 = a2 > 8;
        a2 -= 8;
      }
      while (v9);
      return v12 != 0;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    unint64_t v2 = a1;
    unint64_t v3 = (int8x16_t *)((unint64_t)&a1[4] & 0xFFFFFFFFFFFFFFC0);
    int8x16_t v4 = *v2;
    int8x16_t v5 = v2[1];
    int8x16_t v6 = v2[2];
    int8x16_t v7 = v2[3];
    unint64_t v8 = a2 - ((char *)v3 - (char *)v2);
    BOOL v9 = v8 > 0x40;
    for (unint64_t i = v8 - 64; v9; i -= 64)
    {
      int8x16_t v4 = vorrq_s8(v4, *v3);
      int8x16_t v5 = vorrq_s8(v5, v3[1]);
      int8x16_t v6 = vorrq_s8(v6, v3[2]);
      int8x16_t v7 = vorrq_s8(v7, v3[3]);
      v3 += 4;
      BOOL v9 = i > 0x40;
    }
    return vmaxvq_u8((uint8x16_t)vorrq_s8(vorrq_s8(vorrq_s8(v4, *(int8x16_t *)((char *)v3 + i)), vorrq_s8(v5, *(int8x16_t *)((char *)&v3[1] + i))), vorrq_s8(vorrq_s8(v6, *(int8x16_t *)((char *)&v3[2] + i)), vorrq_s8(v7, *(int8x16_t *)((char *)&v3[3] + i))))) != 0;
  }
}

uint64_t swapcontext()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t getcontext()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t setcontext()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

unint64_t timingsafe_enable_if_supported()
{
  uint64_t v0 = MEMORY[0xFFFFFC010];
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    unint64_t v1 = (_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) >> 24) & 1;
    __asm { MSR             DIT, #1 }
    if ((v0 & 0x200000000000) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    __dsb(0xFu);
    __isb(0xFu);
    return v1;
  }
  unint64_t v1 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  sb();
  return v1;
}

uint64_t timingsafe_restore_if_supported(uint64_t result)
{
  if ((result & 1) == 0 && (MEMORY[0xFFFFFC010] & 0x200000000000000) != 0) {
    __asm { MSR             DIT, #0 }
  }
  return result;
}

void sb()
{
  __asm { SB }
}

void _os_log_simple_reinit_4launchd_cold_1(int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: asl fd already initialized";
  qword_267704BC8 = a1;
  __break(1u);
}

void _enlarge_cold_1(int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Failed to allocate memory for buffer";
  qword_267704BC8 = a1;
  __break(1u);
}

void _os_lock_corruption_abort(uint64_t a1, uint64_t a2)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_lock is corrupt";
  qword_267704BC8 = a2;
  __break(1u);
}

void _os_unfair_lock_corruption_abort(unsigned int a1)
{
  if (a1 - 512 <= 0x3FE00)
  {
    qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt, or owner thread exited without unlocking";
    qword_267704BC8 = a1;
    __break(1u);
  }
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt";
  qword_267704BC8 = a1;
  __break(1u);
}

void _os_once_gate_recursive_abort(unsigned int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_once_t";
  qword_267704BC8 = a1;
  __break(1u);
}

void _os_once_gate_unowned_abort(unsigned int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_once_t not owned by current thread";
  qword_267704BC8 = a1;
  __break(1u);
}

void _os_once_gate_corruption_abort(unsigned int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_once_t is corrupt";
  qword_267704BC8 = a1;
  __break(1u);
}

void _os_lock_recursive_abort(unsigned int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_lock";
  qword_267704BC8 = a1;
  __break(1u);
}

void os_unfair_lock_assert_owner_cold_1(unsigned int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly not owned by current thread";
  qword_267704BC8 = a1;
  __break(1u);
}

void os_unfair_lock_assert_not_owner_cold_1(unsigned int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly owned by current thread";
  qword_267704BC8 = a1;
  __break(1u);
}

void os_unfair_recursive_lock_unlock_forked_child_cold_1()
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Lock was not held";
  __break(1u);
}

void _os_alloc_cold_1(uint64_t a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Requested allocation size is invalid";
  qword_267704BC8 = a1;
  __break(1u);
}

void _os_semaphore_create_cold_1(int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Creating semaphore failed, possible port leak";
  qword_267704BC8 = a1;
  __break(1u);
}

void _os_semaphore_create_cold_2()
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Allocating semaphore failed with MIG_REPLY_MISMATCH";
  qword_267704BC8 = -301;
  __break(1u);
}

void _os_semaphore_dispose_cold_1(int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Destroying semaphore failed";
  qword_267704BC8 = a1;
  __break(1u);
}

void _os_semaphore_signal_cold_1(int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Signaling semaphore failed";
  qword_267704BC8 = a1;
  __break(1u);
}

void _os_semaphore_wait_cold_1(int a1)
{
  qword_267704B98 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Waiting on semaphore failed";
  qword_267704BC8 = a1;
  __break(1u);
  _platform_strcmp_0();
}

uint64_t _platform_strcmp_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _platform_strcmp_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _platform_strncmp_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _platform_strncmp_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

int *__error(void)
{
  return (int *)MEMORY[0x270EDD478]();
}

uint64_t __gettimeofday()
{
  return MEMORY[0x270EDD480]();
}

uint64_t __sendto()
{
  return MEMORY[0x270EDD528]();
}

uint64_t __sigaction()
{
  return MEMORY[0x270EDD530]();
}

uint64_t __sigreturn()
{
  return MEMORY[0x270EDD538]();
}

uint64_t __ulock_wait()
{
  return MEMORY[0x270EDD558]();
}

uint64_t __ulock_wait2()
{
  return MEMORY[0x270EDD560]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x270EDD568]();
}

int close(int a1)
{
  return MEMORY[0x270EDD5C8](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270EDD5D8](*(void *)&a1, a2, *(void *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270EDD620](*(void *)&a1, *(void *)&a2);
}

gid_t getgid(void)
{
  return MEMORY[0x270EDD6D8]();
}

pid_t getpid(void)
{
  return MEMORY[0x270EDD6F0]();
}

uid_t getuid(void)
{
  return MEMORY[0x270EDD708]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDD768]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x270EDD778]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDD838](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x270EDD850](*(void *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x270EDD858](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x270EDD940](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x270EDD990](*(void *)&task, semaphore, *(void *)&policy, *(void *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x270EDD998](*(void *)&task, *(void *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x270EDD9A0](*(void *)&semaphore);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x270EDD9A8](*(void *)&semaphore);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x270EDD9C8](*(void *)&a1, a2, a3);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDD9D0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return MEMORY[0x270EDDA50](*(void *)&thread_name, *(void *)&option, *(void *)&option_time);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x270EDDA68](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x270EDDA70](*(void *)&target_task, address, size);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDDA90](*(void *)&__fd, __buf, __nbyte);
}

uint64_t sub_20D757524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _platform_strcmp_ptr = (uint64_t (*)())_platform_strcmp();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_platform_strcmp_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_20D757588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _platform_strncmp_ptr = (uint64_t (*)())_platform_strncmp();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_platform_strncmp_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}