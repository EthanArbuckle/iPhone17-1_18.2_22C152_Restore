void xzm_malloc_zone_try_free_default(uint64_t a1, unint64_t a2)
{
  _xzm_free(a1, a2, 1);
}

void xzm_malloc_zone_free(uint64_t a1, unint64_t a2)
{
}

void nanov2_free(uint64_t a1, unint64_t a2)
{
}

uint64_t default_zone_free()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 48))();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4 || malloc_absolute_max_size < size) {
    return (void *)_malloc_type_malloc_outlined(size, type_id, 1);
  }
  uint64_t v6 = *(void *)malloc_zones;
  unsigned int v7 = *(_DWORD *)(*(void *)malloc_zones + 104);
  if (v7 >= 0x10) {
    return (void *)(*(uint64_t (**)(uint64_t, size_t, malloc_type_id_t))(v6 + 160))(v6, size, type_id);
  }
  if (v7 > 0xC) {
    return (void *)(*(uint64_t (**)(uint64_t, size_t))(v6 + 24))(v6, size);
  }
  else {
    return (void *)_malloc_type_malloc_outlined(size, type_id, 1);
  }
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = malloc_slowpath == 0;
  }
  if (!v6) {
    return (void *)_malloc_type_calloc_outlined(count, size, type_id);
  }
  uint64_t v7 = *(void *)malloc_zones;
  unsigned int v8 = *(_DWORD *)(*(void *)malloc_zones + 104);
  if (v8 >= 0x10) {
    return (void *)(*(uint64_t (**)(uint64_t, size_t, size_t, malloc_type_id_t))(v7 + 168))(v7, count, size, type_id);
  }
  if (v8 > 0xC) {
    return (void *)(*(uint64_t (**)(uint64_t, size_t, size_t))(v7 + 32))(v7, count, size);
  }
  else {
    return (void *)_malloc_type_calloc_outlined(count, size, type_id);
  }
}

void *__cdecl malloc_type_zone_calloc(malloc_zone_t *zone, size_t count, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4) {
    return (void *)_malloc_type_zone_calloc_outlined(zone, count, size, type_id);
  }
  if (default_zone == (_UNKNOWN *)zone) {
    zone = *(malloc_zone_t **)malloc_zones;
  }
  unsigned int version = zone->version;
  if (version >= 0x10) {
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t, size_t, malloc_type_id_t))zone[1].size)(zone, count, size, type_id);
  }
  if (version > 0xC) {
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t, size_t))zone->calloc)(zone, count, size);
  }
  else {
    return (void *)_malloc_type_zone_calloc_outlined(zone, count, size, type_id);
  }
}

size_t malloc_good_size(size_t size)
{
  if (*((void *)default_zone + 12)) {
    uint64_t v1 = *((void *)default_zone + 12);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t default_zone_good_size()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

void *__cdecl malloc_type_zone_malloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = malloc_slowpath == 0;
  }
  if (!v3 || malloc_absolute_max_size < size) {
    return (void *)_malloc_type_zone_malloc_outlined(zone, size, type_id);
  }
  if (default_zone == (_UNKNOWN *)zone) {
    zone = *(malloc_zone_t **)malloc_zones;
  }
  unsigned int version = zone->version;
  if (version >= 0x10) {
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t, malloc_type_id_t))zone[1].reserved2)(zone, size, type_id);
  }
  if (version > 0xC) {
    return (void *)((uint64_t (*)(malloc_zone_t *, size_t))zone->malloc)(zone, size);
  }
  else {
    return (void *)_malloc_type_zone_malloc_outlined(zone, size, type_id);
  }
}

unint64_t nanov2_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x100)
  {
    if (*(void *)(*(void *)(a1 + 28704) + 96)) {
      uint64_t v3 = *(void *)(*(void *)(a1 + 28704) + 96);
    }
    else {
      uint64_t v3 = 0;
    }
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else if (a2 <= 0x10)
  {
    return 16;
  }
  else
  {
    return (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
}

void *__cdecl malloc(size_t __size)
{
  return (void *)_malloc_zone_malloc((uint64_t)default_zone, __size, 1);
}

unint64_t xzm_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x8000)
  {
    if ((a2 & 0xFFFFFFFFFFFFC000) + 0x4000 <= a2 || (a2 & 0x3FFF) == 0) {
      return a2;
    }
    else {
      return (a2 & 0xFFFFFFFFFFFFC000) + 0x4000;
    }
  }
  else
  {
    uint64_t v2 = *(void *)(a1 + 232);
    if (!v2) {
      uint64_t v2 = a1;
    }
    unint64_t v3 = __clz(a2 - 1);
    unint64_t v4 = (((a2 - 1) >> (61 - v3)) & 3) - 4 * v3 + 488;
    if (a2 <= 0x80) {
      unint64_t v4 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    }
    if (!a2) {
      LOBYTE(v4) = 0;
    }
    return *(void *)(*(void *)(v2 + 352) + 8 * v4);
  }
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v3 = 0;
  }
  else {
    BOOL v3 = malloc_slowpath == 0;
  }
  BOOL v4 = v3 && malloc_absolute_max_size >= size;
  if (!v4
    || alignment < 8
    || ((uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)alignment),
         v5.i16[0] = vaddlv_u8(v5),
         *(_DWORD *)(*(void *)malloc_zones + 104) >= 0x10u)
      ? (BOOL v6 = v5.u32[0] > 1uLL)
      : (BOOL v6 = 1),
        v6 || ((alignment - 1) & size) != 0))
  {
    return (void *)_malloc_type_aligned_alloc_outlined(alignment, size, type_id);
  }
  else
  {
    result = (void *)(*(uint64_t (**)(void))(*(void *)malloc_zones + 184))();
    if (!result) {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    }
  }
  return result;
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = malloc_slowpath == 0;
  }
  BOOL v6 = v5 && malloc_absolute_max_size >= size;
  if (!v6
    || alignment < 8
    || ((uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)alignment),
         v7.i16[0] = vaddlv_u8(v7),
         *(_DWORD *)(*(void *)malloc_zones + 104) >= 0x10u)
      ? (BOOL v8 = v7.u32[0] > 1uLL)
      : (BOOL v8 = 1),
        v8))
  {
    return _malloc_type_posix_memalign_outlined(memptr, alignment, size, type_id);
  }
  else
  {
    uint64_t v9 = (*(uint64_t (**)(void))(*(void *)malloc_zones + 184))();
    if (v9)
    {
      v10 = (void *)v9;
      int result = 0;
      *memptr = v10;
    }
    else
    {
      return 12;
    }
  }
  return result;
}

void *nanov2_realloc_type(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a2)
  {
    uint8x8_t v7 = (const void *)a2;
    uint64_t v8 = *(void *)(a1 + 28704);
    unint64_t v9 = nanov2_pointer_size(a1, a2, 0);
    if (v9)
    {
      size_t v10 = v9;
      if (a3 >= 0x101)
      {
        v11 = (void *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v8 + 160))(v8, a3, a4);
        goto LABEL_26;
      }
      if (a3)
      {
        if (a3 <= 0x10) {
          unint64_t v14 = 16;
        }
        else {
          unint64_t v14 = (a3 + 15) & 0xFFFFFFFFFFFFFFF0;
        }
        if (v14 <= v9 && v14 > v9 >> 1)
        {
          if (v9 != a3)
          {
            if (v9 <= a3) {
              purgeable_ptr_in_use_enumerator_cold_1();
            }
            if ((*(unsigned char *)(a1 + 28676) & 0x20) != 0) {
              _platform_memset();
            }
          }
          return v7;
        }
        v11 = nanov2_malloc_type(a1, v14);
LABEL_26:
        v15 = v11;
        if (!v11) {
          return 0;
        }
        if (v10 >= a3) {
          size_t v16 = a3;
        }
        else {
          size_t v16 = v10;
        }
        memcpy(v11, v7, v16);
        _nanov2_free(a1, (unint64_t)v7, 0);
        return v15;
      }
      _nanov2_free(a1, (unint64_t)v7, 0);
      return nanov2_malloc(a1, 0);
    }
    else
    {
      v13 = *(uint64_t (**)(uint64_t, const void *, unint64_t, uint64_t))(v8 + 176);
      return (void *)v13(v8, v7, a3, a4);
    }
  }
  else
  {
    return nanov2_malloc_type(a1, a3);
  }
}

void _nanov2_free(uint64_t a1, unint64_t a2, int a3)
{
  if (!a2
    || (a2 & 0xFFFFFFFFE000000FLL) != 0x300000000
    || (*(void *)(a1 + 28720) <= a2 ? (BOOL v5 = *(void *)(a1 + 28728) >= a2) : (BOOL v5 = 0), !v5))
  {
LABEL_21:
    uint64_t v12 = *(void *)(a1 + 28704);
    if (a3)
    {
      v13 = *(void (**)(void))(v12 + 144);
    }
    else
    {
      v13 = *(void (**)(void))(v12 + 48);
    }
    v13();
    return;
  }
  uint64_t v6 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  uint8x8_t v7 = (atomic_uint *)((*(void *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                     + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F));
  unsigned int v8 = *v7 & 0x7FF;
  if (v8 > 0x7FD)
  {
    if (v8 - 2046 < 2) {
      goto LABEL_21;
    }
    goto LABEL_14;
  }
  if (!v8 || v8 == 2042) {
    goto LABEL_21;
  }
  if (v8 != 2044)
  {
LABEL_14:
    if (((*v7 >> 11) & 0x3FF) == slots_by_size_class[v6] - 1) {
      goto LABEL_21;
    }
  }
  unint64_t v9 = 16 * (int)v6 + 16;
  if ((a2 & 0x3FFF) != (a2 & 0x3FFF) / v9 * v9) {
    goto LABEL_21;
  }
  uint64_t v10 = *(void *)(a1 + 28696);
  if (16 * v6 == -16 || (v10 ^ *(void *)a2) == a2) {
    goto LABEL_21;
  }
  if (v9 >= 0x11 && malloc_zero_policy == 0)
  {
    bzero((void *)(a2 + 16), v9 - 16);
    uint64_t v10 = *(void *)(a1 + 28696);
  }
  uint64_t v15 = *v7;
  int v16 = slots_by_size_class[v6];
  *(void *)a2 = v10 ^ a2;
  while (1)
  {
    unsigned int v17 = v15 & 0x7FF;
    unsigned int v18 = (v15 + 2048) & 0x1FF800;
    int v19 = (v15 + 0x200000) & 0x7FE00000 | v15 & 0x80000000;
    if (v17 == 2044)
    {
      unsigned int v17 = 2043;
      goto LABEL_43;
    }
    if (v16 - 1 == v18 >> 11) {
      break;
    }
LABEL_43:
    unsigned int v21 = v18 | v19 | ((unsigned __int16)((unsigned __int16)(a2 & 0x3FFF) / (int)v9) + 1) & 0x7FF;
    *(void *)(a2 + 8) = v17;
    uint64_t v22 = v15;
    atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v22, v21, memory_order_release, memory_order_relaxed);
    if (v22 == v15) {
      goto LABEL_50;
    }
LABEL_44:
    uint64_t v15 = v22;
  }
  *(void *)(a2 + 8) = 0;
  if ((int)v15 < 0) {
    int v20 = 2043;
  }
  else {
    int v20 = 2045;
  }
  unsigned int v21 = v20 | v18 | v19;
  uint64_t v22 = v15;
  atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v22, v21, memory_order_release, memory_order_relaxed);
  if (v22 != v15) {
    goto LABEL_44;
  }
  if ((v15 & 0x80000000) != 0 || nanov2_madvise_policy)
  {
LABEL_50:
    if ((v21 & 0x80000000) == 0
      && ((1 << v6) & *(unsigned __int16 *)(a1 + 28672)) != 0
      && (double)v16 * 0.75 <= (double)((v21 >> 11) & 0x3FF))
    {
      atomic_fetch_and_explicit((atomic_ushort *volatile)(a1 + 28672), ~(unsigned __int16)(1 << v6), memory_order_relaxed);
    }
    return;
  }

  nanov2_madvise_block((const os_unfair_lock *)a1, v7, v6, 2045);
}

void *nanov2_malloc_type(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (a2 <= 0x10) {
    unint64_t v2 = 16;
  }
  if (v2 > 0x100)
  {
    uint64_t v22 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 160);
    return (void *)v22();
  }
  uint64_t v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1) {
      unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }
  unsigned int v5 = v4 & 0x3F;
  uint64_t v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  uint8x8_t v7 = *(atomic_uint **)(v6 + 0x4000);
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = *v7;
    unint64_t v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    int v11 = 16 * v3 + 16;
    while (1)
    {
      uint64_t v12 = 0;
      if ((v9 & 0x80000000) == 0)
      {
        uint64_t v14 = 0;
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 1);
      }
      int v13 = v9 & 0x7FF;
      uint64_t v14 = 0;
      if (v13 == 2044) {
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 1);
      }
      unsigned int v15 = (v9 >> 11) & 0x3FF;
      int v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15) {
          int v17 = 2043;
        }
        else {
          int v17 = 2044;
        }
        unsigned int v18 = v16 | v17 | 0x80000000;
        uint64_t v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v18, memory_order_relaxed, memory_order_relaxed);
        if (v19 == v9)
        {
          int v24 = slots_by_size_class[v3] + ~v15;
          char v25 = 1;
          goto LABEL_29;
        }
      }
      else
      {
        if (!v8) {
          unint64_t v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        }
        int v24 = v13 - 1;
        uint64_t v14 = v8 + v24 * v11;
        if (v15) {
          __int16 v20 = *(_WORD *)(v14 + 8);
        }
        else {
          __int16 v20 = 2044;
        }
        unsigned int v21 = v16 | v20 & 0x7FF | 0x80000000;
        uint64_t v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v21, memory_order_relaxed, memory_order_relaxed);
        if (v19 == v9)
        {
          if (v14) {
            goto LABEL_37;
          }
          char v25 = 0;
LABEL_29:
          if (!v8) {
            unint64_t v8 = v10;
          }
          uint64_t v14 = v8 + v24 * v11;
          if (v25)
          {
            if (!v14)
            {
LABEL_33:
              uint64_t v12 = 0;
              return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 1);
            }
          }
          else
          {
LABEL_37:
            if ((*(void *)(a1 + 28696) ^ *(void *)v14) != v14) {
              goto LABEL_33;
            }
          }
          *(void *)uint64_t v14 = 0;
          *(void *)(v14 + 8) = 0;
          return (void *)v14;
        }
      }
      uint64_t v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        uint64_t v14 = 0;
        uint64_t v12 = v7;
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 1);
      }
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
  return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 1);
}

void xzm_realloc(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int8x8_t a5)
{
  uint64_t v7 = a1;
  if (a2)
  {
    if (a3)
    {
      unint64_t v9 = a2 >> 22;
      if (a2 >> 36) {
        unint64_t v9 = 0x4000;
      }
      if (v9 >> 14) {
        goto LABEL_14;
      }
      uint64_t v10 = *(void *)(a1 + 232);
      if (!v10) {
        uint64_t v10 = a1;
      }
      uint64_t v11 = *(void *)(v10 + 408);
      if (!v11) {
        goto LABEL_14;
      }
      uint64_t v12 = *(unsigned int *)(v11 + 4 * v9);
      if (!v12) {
        goto LABEL_14;
      }
      uint64_t v13 = v12 << 14;
      unint64_t v14 = a2 - *(void *)(v13 + 48);
      if (*(_DWORD *)(v13 + 16) <= (v14 >> 14)) {
        goto LABEL_14;
      }
      unsigned int v15 = v14 >> 14;
      unint64_t v16 = v13 + 48 * v15 + 2104;
      if ((*(unsigned char *)(v13 + 48 * v15 + 2136) & 0xF) == 4)
      {
        unint64_t v28 = v16 - *(unsigned int *)(v13 + 48 * v15 + 2140);
        unsigned int v29 = *(unsigned char *)(v28 + 32) & 0xF;
        if (v29 <= 8)
        {
          int v30 = 1 << v29;
          if ((v30 & 0x1E8) != 0)
          {
            if (v28 + 48 * *(unsigned int *)(v28 + 40) <= v16) {
              goto LABEL_12;
            }
            goto LABEL_66;
          }
          if ((v30 & 6) != 0 && v16 == v28) {
LABEL_66:
          }
            unint64_t v16 = v28;
        }
      }
LABEL_12:
      unsigned int v17 = *(unsigned char *)(v16 + 32) & 0xF;
      if (v17 > 7) {
        _xzm_segment_group_segment_span_free_coalesce_cold_1(v17);
      }
      if (((1 << v17) & 0x1B) != 0 || *(unsigned __int16 *)(v16 + 34) != *(unsigned __int16 *)(v7 + 208)) {
        goto LABEL_14;
      }
      v23 = (uint64_t *)(v16 & 0xFFFFFFFFFFFFC000);
      unint64_t v24 = a2
          - *(void *)((v16 & 0xFFFFFFFFFFFFC000) + 0x30)
          - ((0xAAAAAAAAAAAAC000 * (((v16 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
      if (v17 == 5 || v17 == 2)
      {
        uint64_t v26 = *(void *)(v7 + 216) + 88 * *(unsigned __int8 *)(v16 + 33);
        if ((*(_DWORD *)(v26 + 64) * v24) >= *(_DWORD *)(v26 + 64)) {
          goto LABEL_14;
        }
        unint64_t v18 = *(void *)(v26 + 48);
      }
      else
      {
        unint64_t v18 = (unint64_t)*(unsigned int *)(v16 + 40) << 14;
        if (v24 % v18) {
          goto LABEL_14;
        }
      }
      if (v17 == 5)
      {
        if (((*(_DWORD *)v16 >> (v24 / v18)) & 1) == 0) {
          goto LABEL_45;
        }
      }
      else
      {
        if (v17 != 2 || *(void *)a2 != (*(void *)(v7 + 272) ^ a2)) {
          goto LABEL_45;
        }
        unint64_t v32 = v16;
        unint64_t v33 = v16 & 0xFFFFFFFFFFFFC000;
        int is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(v7, v16, a2);
        unint64_t v16 = v32;
        v23 = (uint64_t *)v33;
        if (!is_free_slow)
        {
          if (*(unsigned __int16 *)(v32 + 34) != *(unsigned __int16 *)(v7 + 208)) {
            xzm_realloc_cold_2(a2);
          }
LABEL_45:
          if (a3 > 0x8000 && v18 > 0x8000)
          {
            if (a3 <= 0x200000 || v18 <= 0x200000)
            {
              if (a3 <= 0x200000
                && v18 < 0x200001
                && (*(unsigned char *)(v7 + 296) & 0x80) == 0
                && (xzm_segment_group_try_realloc_large_chunk(*v23, (uint64_t)v23, v16, (a3 + 0x3FFF) >> 14) & 1) != 0)
              {
                return;
              }
            }
            else if ((*(unsigned char *)(v7 + 296) & 0x80) == 0 {
                   && (xzm_segment_group_try_realloc_huge_chunk(*v23, v7, (unint64_t)v23, v16, (a3 + 0x3FFF) >> 14) & 1) != 0)
            }
            {
              return;
            }
          }
          goto LABEL_15;
        }
      }
LABEL_14:
      unint64_t v18 = _xzm_ptr_size_outlined(v7, a2);
LABEL_15:
      if (v18 < a3 || v18 >> 1 > a3)
      {
        xzm_malloc(v7, a3, a4, 0, a5);
        __int16 v20 = v19;
        if (v19)
        {
          if (v18 >= a3) {
            size_t v21 = a3;
          }
          else {
            size_t v21 = v18;
          }
          memcpy(v19, (const void *)a2, v21);
          if (v20 != (void *)a2) {
            _xzm_free(v7, a2, 0);
          }
        }
      }
      return;
    }
    _xzm_free(a1, a2, 0);
    a1 = v7;
    unint64_t v22 = 0;
  }
  else
  {
    unint64_t v22 = a3;
  }

  xzm_malloc(a1, v22, a4, 0, a5);
}

void _xzm_xzone_malloc(uint64_t a1, unint64_t a2, unsigned int a3, char a4, int8x8_t a5)
{
  uint64_t v5 = *(void *)(a1 + 216);
  if ((a4 & 2) == 0 && !*(void *)(a1 + 232))
  {
    uint64_t v7 = (atomic_ushort *)(v5 + 88 * a3 + 32);
    uint64_t v8 = (unsigned __int16)*v7;
    while ((_WORD)v8)
    {
      uint64_t v9 = v8;
      atomic_compare_exchange_strong_explicit(v7, (unsigned __int16 *)&v9, v8 - 1, memory_order_relaxed, memory_order_relaxed);
      BOOL v10 = v9 == (unsigned __int16)v8;
      uint64_t v8 = v9;
      if (v10)
      {
        mfm_alloc(*(void *)(v5 + 88 * a3 + 48));
        return;
      }
    }
  }
  uint64_t v6 = v5 + 88 * a3;
  if (a2 > 0x1000) {
    _xzm_xzone_malloc_small(a1, v6, a4, a5);
  }
  else {
    _xzm_xzone_malloc_tiny(a1, v6, a4);
  }
}

uint64_t _xzm_xzone_malloc_tiny(uint64_t a1, uint64_t a2, char a3)
{
  int v4 = *(unsigned __int8 *)(a2 + 77);
  if (v4 == 1)
  {
    unint64_t v5 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) >> 12;
  }
  else if (v4 == 2)
  {
    LOBYTE(v5) = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = *(void *)(a1 + 224);
  unint64_t v8 = *(unsigned __int8 *)(a2 + 72) + *(unsigned __int8 *)(a1 + 210) * (unint64_t)v5;
  uint64_t v9 = (atomic_ullong *)(v7 + 32 * v8);
  unint64_t v10 = *v9;
  if ((*v9 & 1) == 0)
  {
    uint64_t v11 = (atomic_ullong *)((v10 >> 2) & 0x7FFFFFFFFFFFLL);
    if (v11)
    {
      uint64_t v12 = (v10 >> 2) & 0x7FFFFFFFC000;
      unint64_t v13 = *v11;
      if ((*v11 & 0x40000000) == 0)
      {
        int v14 = 0;
        unint64_t v15 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)v11 - v12 - 2104) >> 4)) & 0x3FFFFFFFC000)
            + *(void *)(v12 + 0x30);
        do
        {
          if (((v13 >> 22) & 0x3F) != v5 + 1) {
            break;
          }
          if ((v13 & 0x3FF800) != 0)
          {
            unint64_t v16 = (v13 + 4192256) & 0x3FF800 | v13 & 0xFFFFFFFFFFC007FFLL;
            if ((v13 & 0x7FF) > 0x3FF)
            {
              if (((v13 + 4192256) & 0x3FF800) == 0) {
                unint64_t v16 = ((int)v13 + 4192256) & 0x3FF800 | v13 & 0xFFFFFFFFFFC00000 | 0x7FD;
              }
              uint64_t v22 = *(unsigned int *)(a2 + 68);
              uint64_t v23 = *(void *)(a2 + 48);
              unint64_t v24 = v13;
              atomic_compare_exchange_strong_explicit(v11, &v24, v16, memory_order_relaxed, memory_order_relaxed);
              if (v24 == v13)
              {
                if (!v15) {
                  break;
                }
                uint64_t v6 = v15 + (v22 - ((v13 >> 11) & 0x7FF)) * v23;
LABEL_29:
                if ((*(unsigned char *)(a1 + 240) & 3) != v4)
                {
                  uint64_t v25 = v7 + 32 * v8;
                  if (v14 || (*(void *)(v25 + 16) & 0xFFFFFF00000000) != 0)
                  {
                    uint64_t v26 = (atomic_ullong *)(v25 + 16);
                    unint64_t v27 = 0x100000001;
                    if (!v14) {
                      unint64_t v27 = 1;
                    }
                    unint64_t v28 = atomic_fetch_add_explicit(v26, v27, memory_order_relaxed) + v27;
                    unint64_t v29 = HIBYTE(v28);
                    if (HIBYTE(v28) != (*(unsigned char *)(a1 + 240) & 3))
                    {
                      if ((HIDWORD(v28) & 0xFFFFFFu) > *(_DWORD *)(a1 + 4 * v29 + 244))
                      {
                        unsigned __int8 v31 = ncpuclusters;
                        BOOL v32 = HIBYTE(HIDWORD(v28)) == 0 && ncpuclusters > 1;
                        if (v32) {
                          unsigned __int8 v33 = 1;
                        }
                        else {
                          unsigned __int8 v33 = 2;
                        }
                        uint64_t v34 = *(unsigned __int8 *)(a2 + 77);
                        do
                        {
                          if (v34 >= v33) {
                            break;
                          }
                          uint64_t v35 = v34;
                          atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(a2 + 77), (unsigned __int8 *)&v35, v33, memory_order_relaxed, memory_order_relaxed);
                          BOOL v21 = v35 == v34;
                          uint64_t v34 = v35;
                        }
                        while (!v21);
                        if (!v32) {
                          unsigned __int8 v31 = logical_ncpus;
                        }
                        if (v31)
                        {
                          for (uint64_t i = 0; i != v31; ++i)
                          {
                            uint64_t v37 = *(void *)(a1 + 224)
                                + 32 * (*(unsigned __int8 *)(a2 + 72) + i * *(unsigned __int8 *)(a1 + 210));
                            unint64_t v40 = *(void *)(v37 + 16);
                            v38 = (atomic_ullong *)(v37 + 16);
                            unint64_t v39 = v40;
                            do
                            {
                              if (HIBYTE(v39) >= v33) {
                                break;
                              }
                              unint64_t v41 = v39;
                              atomic_compare_exchange_strong_explicit(v38, &v41, (unint64_t)v33 << 56, memory_order_relaxed, memory_order_relaxed);
                              BOOL v21 = v41 == v39;
                              unint64_t v39 = v41;
                            }
                            while (!v21);
                          }
                        }
                      }
                      else if (*(_DWORD *)(a1 + 256) < v28)
                      {
                        unint64_t v42 = *v26;
                        do
                        {
                          if (v42 < v28) {
                            break;
                          }
                          if (v29 < HIBYTE(v42)) {
                            break;
                          }
                          unint64_t v43 = v42;
                          atomic_compare_exchange_strong_explicit(v26, &v43, v28 & 0xFF00000000000000, memory_order_relaxed, memory_order_relaxed);
                          BOOL v21 = v43 == v42;
                          unint64_t v42 = v43;
                        }
                        while (!v21);
                      }
                    }
                  }
                }
                *(void *)uint64_t v6 = 0;
                *(void *)(v6 + 8) = 0;
                if ((a3 & 1) == 0 || *(void *)(a2 + 48) < 0x401uLL) {
                  return v6;
                }
                return _platform_memset();
              }
              int v14 = 1;
              unint64_t v13 = v24;
            }
            else
            {
              uint64_t v6 = v15 + 16 * (v13 & 0x7FF);
              uint64_t v18 = *(void *)v6;
              unint64_t v17 = *(void *)(v6 + 8);
              unint64_t v19 = v13;
              atomic_compare_exchange_strong_explicit(v11, &v19, ((int)v13 + 4192256) & 0x3FF800 | v13 & 0xFFF8003FFFC00000 | v17 & 0x7FF | (((v17 >> 11) & 0x1FFF) << 38), memory_order_relaxed, memory_order_relaxed);
              if (v19 == v13)
              {
                if ((*(void *)(a1 + 272) ^ v6) != v18
                  || v17 != (v17 & 0xFFFFFF | (((v13 >> 38) & 0x1FFF) << 24) & 0xFFFFFFE000FFFFFFLL))
                {
                  goto LABEL_43;
                }
                goto LABEL_29;
              }
              int v14 = 1;
              unint64_t v13 = v19;
            }
          }
          else
          {
            unint64_t v20 = v13;
            atomic_compare_exchange_strong_explicit(v11, &v20, v13 & 0xFFFFFFFFF03FFFFFLL, memory_order_relaxed, memory_order_relaxed);
            BOOL v21 = v20 == v13;
            unint64_t v13 = v20;
            if (v21) {
              break;
            }
          }
        }
        while ((v13 & 0x40000000) == 0);
      }
      uint64_t v6 = 0;
    }
  }
LABEL_43:
  return _xzm_xzone_malloc_tiny_outlined(a1, a2, v5, v9, v6, a3);
}

void _xzm_free(uint64_t a1, unint64_t a2, char a3)
{
  if (!a2) {
    return;
  }
  unint64_t v5 = a2 >> 22;
  if (a2 >> 36) {
    unint64_t v5 = 0x4000;
  }
  if (v5 >> 14) {
    goto LABEL_13;
  }
  uint64_t v6 = *(void *)(a1 + 232);
  if (!v6) {
    uint64_t v6 = a1;
  }
  uint64_t v7 = *(void *)(v6 + 408);
  if (!v7) {
    goto LABEL_13;
  }
  uint64_t v8 = *(unsigned int *)(v7 + 4 * v5);
  if (!v8) {
    goto LABEL_13;
  }
  uint64_t v9 = v8 << 14;
  unint64_t v10 = a2 - *(void *)(v9 + 48);
  if (*(_DWORD *)(v9 + 16) <= (v10 >> 14)) {
    goto LABEL_13;
  }
  unsigned int v11 = v10 >> 14;
  unint64_t v12 = v9 + 48 * v11 + 2104;
  if ((*(unsigned char *)(v9 + 48 * v11 + 2136) & 0xF) == 4)
  {
    unint64_t v50 = v12 - *(unsigned int *)(v9 + 48 * v11 + 2140);
    unsigned int v51 = *(unsigned char *)(v50 + 32) & 0xF;
    if (v51 <= 8)
    {
      int v52 = 1 << v51;
      if ((v52 & 0x1E8) != 0)
      {
        if (v50 + 48 * *(unsigned int *)(v50 + 40) <= v12) {
          goto LABEL_11;
        }
        goto LABEL_93;
      }
      if ((v52 & 6) != 0 && v12 == v50) {
LABEL_93:
      }
        unint64_t v12 = v50;
    }
  }
LABEL_11:
  char v13 = *(unsigned char *)(v12 + 32);
  unsigned int v14 = v13 & 0xF;
  if (v14 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v14);
  }
  if (((1 << v14) & 0x1B) != 0 || *(unsigned __int16 *)(v12 + 34) != *(unsigned __int16 *)(a1 + 208)) {
    goto LABEL_13;
  }
  unint64_t v15 = (0xAAAAAAAAAAAAC000 * (((v12 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000;
  unint64_t v16 = a2 - *(void *)((v12 & 0xFFFFFFFFFFFFC000) + 0x30) - v15;
  if (v14 == 5 || v14 == 2)
  {
    uint64_t v18 = *(void *)(a1 + 216) + 88 * *(unsigned __int8 *)(v12 + 33);
    if ((*(_DWORD *)(v18 + 64) * v16) >= *(_DWORD *)(v18 + 64)) {
      goto LABEL_13;
    }
    unint64_t v19 = *(void *)(v18 + 48);
  }
  else
  {
    unint64_t v19 = (unint64_t)*(unsigned int *)(v12 + 40) << 14;
    if (v16 % v19) {
      goto LABEL_13;
    }
    uint64_t v18 = 0;
  }
  if (v14 == 5)
  {
    if (((*(_DWORD *)v12 >> (v16 / v19)) & 1) == 0) {
      goto LABEL_32;
    }
LABEL_13:
    _xzm_free_outlined(a1, (void *)a2, a3);
    return;
  }
  if (v14 != 2 || *(void *)a2 != (*(void *)(a1 + 272) ^ a2)) {
    goto LABEL_32;
  }
  char v20 = a3;
  uint64_t v21 = v18;
  char is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v12, a2);
  a3 = v20;
  if (is_free_slow) {
    goto LABEL_13;
  }
  uint64_t v18 = v21;
  char v13 = *(unsigned char *)(v12 + 32);
LABEL_32:
  int v23 = v13 & 0xF;
  if (v23 == 5)
  {
    _xzm_xzone_free_block_to_small_chunk(a1, v18, (int8x8_t *)v12, a2);
    return;
  }
  if (v23 != 2)
  {
    _xzm_free_large_huge(a1, v12);
    return;
  }
  size_t v24 = *(void *)(v18 + 48);
  if (v24 <= 0x400)
  {
    uint64_t v25 = v18;
    bzero((void *)a2, v24);
    uint64_t v18 = v25;
  }
  unint64_t v26 = 0;
  char v27 = 0;
  uint64_t v28 = 0;
  int v29 = *(_DWORD *)(v18 + 68);
  int v30 = (char *)(a2 - *(void *)((v12 & 0xFFFFFFFFFFFFC000) + 0x30) - v15);
  *(void *)a2 = *(void *)(a1 + 272) ^ a2;
  int8x8_t v31 = *(int8x8_t *)v12;
  unint64_t v32 = ((unint64_t)&v30[(uint64_t)v30 < 0 ? 0xFuLL : 0] >> 4) & 0x7FF;
  char v33 = 1;
  unint64_t v54 = v32;
  if ((*(void *)v12 & 0x40000000) != 0) {
    goto LABEL_55;
  }
  while (1)
  {
    uint64_t v34 = *(void *)&v31 + 0x8000000000000;
    unsigned int v35 = ((unsigned __int32)v31.i32[0] >> 11) & 0x7FF;
    if (v35 + 1 == v29)
    {
      if ((v27 & 1) != 0
        || ((unsigned int v36 = ((unsigned __int32)v31.i32[0] >> 22) & 0x3F, (*(void *)v18 & 0x7FFFFFFFFFFFLL) == 0)
          ? (BOOL v37 = v36 == 0)
          : (BOOL v37 = 1),
            v37))
      {
        if (v33) {
          goto LABEL_45;
        }
        char v33 = 0;
        char v27 = 1;
      }
      else
      {
        uint64_t v41 = v18;
        uint64_t v42 = mach_absolute_time();
        uint64_t v18 = v41;
        uint64_t v28 = v42;
        unint64_t v26 = *(void *)(a1 + 224)
            + 32
            * (*(unsigned __int8 *)(v41 + 72)
             + *(unsigned __int8 *)(a1 + 210) * (unint64_t)(v36 - 1));
        if (((v42 - *(void *)(v26 + 24) >= *(void *)(a1 + 264)) & v33) != 0)
        {
          unint64_t v32 = v54;
LABEL_45:
          BOOL v38 = 0;
          unint64_t v39 = v34 & 0xFFFFFFFFF0000000 | 0x7FF;
          char v27 = 1;
          char v33 = 1;
          goto LABEL_49;
        }
        char v33 = 0;
        char v27 = 1;
        unint64_t v32 = v54;
      }
    }
    *(void *)(a2 + 8) = v31.i16[0] & 0x7FF | (((*(void *)&v31 >> 38) & 0x1FFFLL) << 11) & 0xFFFFFFE000FFFFFFLL | (*(void *)&v31 >> 51 << 24) & 0xFFFFFFE000FFFFFFLL;
    unint64_t v39 = (v31.i32[0] + 2048) & 0x3FF800 | v32 | v34 & 0xFFF8003FFFC00000 | (*(void *)&v31 >> 51 << 38);
    BOOL v38 = (v31.i32[0] & 0xFC00000) == 0 && v35 == 0;
    if (v38) {
      v39 |= 0x10000000uLL;
    }
LABEL_49:
    int8x8_t v40 = v31;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)v12, (unint64_t *)&v40, v39, memory_order_release, memory_order_relaxed);
    if (*(void *)&v40 == *(void *)&v31) {
      break;
    }
    int8x8_t v31 = v40;
    if ((v40.i32[0] & 0x40000000) != 0)
    {
      do
      {
LABEL_55:
        _xzm_walk_lock_wait((os_unfair_lock_s *)a1);
        int8x8_t v31 = *(int8x8_t *)v12;
      }
      while ((*(void *)v12 & 0x40000000) != 0);
    }
  }
  if (v28) {
    *(void *)(v26 + 24) = v28;
  }
  if ((~(_WORD)v39 & 0x7FF) != 0)
  {
    if (v38)
    {
      v45 = (os_unfair_lock_s *)a1;
      v46 = (atomic_ullong *)v18;
      goto LABEL_80;
    }
  }
  else
  {
    uint64_t v43 = *(void *)(a1 + 232);
    if (!v43) {
      uint64_t v43 = a1;
    }
    uint64_t v44 = v18;
    if ((*(unsigned char *)(v43 + 328) & 4) != 0) {
      xzm_chunk_mark_free(a1, v12);
    }
    else {
      xzm_segment_group_segment_madvise_chunk(*(void *)(v18 + 40), v12);
    }
    int8x8_t v47 = *(int8x8_t *)v12;
    do
    {
      int8x8_t v48 = v47;
      if ((v47.i32[0] & 0x10000000) != 0) {
        uint64_t v49 = 2046;
      }
      else {
        uint64_t v49 = 536872958;
      }
      atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)v12, (unint64_t *)&v47, v49 | *(void *)&v47 & 0xFFFFFFFFFFFFF800, memory_order_release, memory_order_relaxed);
    }
    while (*(void *)&v47 != *(void *)&v48);
    if ((v48.i32[0] & 0x10000000) == 0)
    {
      v46 = (atomic_ullong *)(v44 + 8);
      v45 = (os_unfair_lock_s *)a1;
LABEL_80:
      _xzm_chunk_list_push(v45, v46, v12, 0);
    }
  }
}

void _free(void *a1)
{
  if (a1)
  {
    if (malloc_slowpath) {
      BOOL v1 = 0;
    }
    else {
      BOOL v1 = malloc_logger == 0;
    }
    if (v1
      && *(_DWORD *)(*(void *)malloc_zones + 104) > 0xCu
      && (unint64_t v2 = *(void (**)(void))(*(void *)malloc_zones + 144)) != 0)
    {
      v2();
    }
    else
    {
      find_zone_and_free(a1, 0);
    }
  }
}

void nanov2_try_free_default(uint64_t a1, unint64_t a2)
{
}

uint64_t _xzm_xzone_malloc_tiny_outlined(uint64_t a1, uint64_t a2, int a3, atomic_ullong *a4, uint64_t a5, char a6)
{
  if (a5)
  {
    qword_1E93090B0 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: memory corruption of free block";
    qword_1E93090E0 = a5;
    __break(1u);
LABEL_73:
    unsigned __int8 v37 = ncpuclusters;
    BOOL v38 = BYTE3(v6) == 0 && ncpuclusters > 1;
    if (v38) {
      unsigned __int8 v39 = 1;
    }
    else {
      unsigned __int8 v39 = 2;
    }
    uint64_t v40 = *(unsigned __int8 *)(v7 + 77);
    do
    {
      if (v40 >= v39) {
        break;
      }
      uint64_t v41 = v40;
      atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)(v7 + 77), (unsigned __int8 *)&v41, v39, memory_order_relaxed, memory_order_relaxed);
      BOOL v17 = v41 == v40;
      uint64_t v40 = v41;
    }
    while (!v17);
    if (!v38) {
      unsigned __int8 v37 = logical_ncpus;
    }
    if (v37)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        uint64_t v43 = *(void *)(v8 + 224) + 32 * (*(unsigned __int8 *)(v7 + 72) + i * *(unsigned __int8 *)(v8 + 210));
        unint64_t v46 = *(void *)(v43 + 16);
        uint64_t v44 = (atomic_ullong *)(v43 + 16);
        unint64_t v45 = v46;
        do
        {
          if (HIBYTE(v45) >= v39) {
            break;
          }
          unint64_t v47 = v45;
          atomic_compare_exchange_strong_explicit(v44, &v47, (unint64_t)v39 << 56, memory_order_relaxed, memory_order_relaxed);
          BOOL v17 = v47 == v45;
          unint64_t v45 = v47;
        }
        while (!v17);
      }
    }
    goto LABEL_68;
  }
  uint64_t v7 = a2;
  uint64_t v8 = a1;
  char v10 = a6;
  int v13 = 0;
  unint64_t v50 = *(void *)(a2 + 48);
  atomic_ullong v14 = *a4;
  char v53 = 0;
  while (2)
  {
    unint64_t v15 = v14;
    while ((v15 & 1) != 0)
    {
      if ((v15 & 2) == 0)
      {
        unint64_t v16 = v15;
        atomic_compare_exchange_strong_explicit(a4, &v16, v15 | 2, memory_order_relaxed, memory_order_relaxed);
        BOOL v17 = v16 == v15;
        unint64_t v15 = v16;
        if (!v17) {
          continue;
        }
      }
      uint64_t result = __ulock_wait();
      if ((result & 0x80000000) != 0 && result != -4)
      {
        uint64_t v19 = -(int)result;
        if (v19 != 14) {
          goto LABEL_96;
        }
      }
LABEL_11:
      unint64_t v15 = *a4;
    }
    if ((v15 & 2) != 0)
    {
      _xzm_fork_lock_wait((os_unfair_lock_s *)v8);
      goto LABEL_11;
    }
    char v20 = (atomic_ullong *)((v15 >> 2) & 0x7FFFFFFFFFFFLL);
    if (!v20 || (uint64_t v21 = _xzm_xzone_malloc_from_tiny_chunk(v8, v7, a3, v20, &v53, 0)) == 0)
    {
      if (!v13) {
        int v13 = _malloc_ulock_self_owner_value();
      }
      atomic_ullong v14 = v15;
      atomic_compare_exchange_strong_explicit(a4, (unint64_t *)&v14, v15 & 0xFFFE000000000000 | (4 * v13) | 1u, memory_order_relaxed, memory_order_relaxed);
      if (v14 == v15)
      {
        uint64_t v22 = _xzm_chunk_list_pop((os_unfair_lock_s *)v8, (atomic_ullong *)v7, 0);
        if (v22)
        {
          uint64_t v23 = v22;
          while (1)
          {
            char v52 = 0;
            unint64_t v24 = _xzm_xzone_malloc_from_tiny_chunk(v8, v7, a3, (atomic_ullong *)v23, &v53, &v52);
            if (v24) {
              break;
            }
            if (v52) {
              _xzm_chunk_list_push((os_unfair_lock_s *)v8, (atomic_ullong *)(v7 + 8), v23, 0);
            }
            uint64_t v23 = _xzm_chunk_list_pop((os_unfair_lock_s *)v8, (atomic_ullong *)v7, 0);
            if (!v23) {
              goto LABEL_26;
            }
          }
LABEL_38:
          uint64_t v9 = (void *)v24;
LABEL_56:
          if ((atomic_exchange_explicit(a4, (v14 & 0xFFFE000000000000 | (4 * (v23 & 0x7FFFFFFFFFFFLL))) + 0x2000000000000, memory_order_release) & 2) == 0|| (uint64_t result = __ulock_wake(), result == -2)|| !result)
          {
            if (!v9) {
              return (uint64_t)v9;
            }
            goto LABEL_60;
          }
          uint64_t v19 = -(int)result;
          qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: ulock_wake failure";
          qword_1E93090E0 = v19;
          __break(1u);
LABEL_96:
          qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: ulock_wait failure";
          qword_1E93090E0 = v19;
          __break(1u);
LABEL_97:
          qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: asking for start of chunk with invalid kind";
          qword_1E93090E0 = v19;
          __break(1u);
          return result;
        }
LABEL_26:
        uint64_t v25 = _xzm_chunk_list_pop((os_unfair_lock_s *)v8, (atomic_ullong *)(v7 + 8), 0);
        if (v25)
        {
          uint64_t v26 = 0;
          while (1)
          {
            uint64_t v23 = v25;
            unint64_t v24 = _xzm_xzone_malloc_from_empty_tiny_chunk(v8, v7, a3, v25);
            if (v24) {
              goto LABEL_38;
            }
            *(void *)(v23 + 16) = v26;
            uint64_t v25 = _xzm_chunk_list_pop((os_unfair_lock_s *)v8, (atomic_ullong *)(v7 + 8), 0);
            uint64_t v26 = v23;
            if (!v25)
            {
              do
              {
                uint64_t v27 = *(void *)(v23 + 16);
                _xzm_chunk_list_push((os_unfair_lock_s *)v8, (atomic_ullong *)(v7 + 8), v23, 0);
                uint64_t v23 = v27;
              }
              while (v27);
              break;
            }
          }
        }
        if ((*(unsigned char *)(v7 + 78) & 1) != 0
          && (*(void *)(v8 + 232) ? (uint64_t v28 = *(void *)(v8 + 232)) : (uint64_t v28 = v8),
              (uint64_t chunk_from_isolation = _xzm_xzone_allocate_chunk_from_isolation(v28, v7)) != 0))
        {
          uint64_t v23 = chunk_from_isolation;
          uint64_t v9 = (void *)_xzm_xzone_malloc_from_empty_tiny_chunk(v8, v7, a3, chunk_from_isolation);
        }
        else
        {
          uint64_t result = _xzm_chunk_list_pop((os_unfair_lock_s *)v8, (atomic_ullong *)(v7 + 24), 0);
          if (result)
          {
            uint64_t v23 = result;
            if (v50 <= 0x400 && (*(unsigned char *)(result + 32) & 0x10) == 0)
            {
              uint64_t v19 = *(unsigned char *)(result + 32) & 0xF;
              if ((v19 - 6) < 2)
              {
                size_t v30 = (unint64_t)*(unsigned int *)(result + 40) << 14;
              }
              else if (v19 == 2)
              {
                size_t v30 = 0x4000;
              }
              else
              {
                if (v19 != 5) {
                  goto LABEL_97;
                }
                size_t v30 = 0x10000;
              }
              bzero((void *)(((0xAAAAAAAAAAAAC000 * (((unint64_t)(result & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)+ *(void *)((result & 0xFFFFFFFFFFFFC000) + 0x30)), v30);
            }
          }
          else
          {
            uint64_t v51 = 0;
            mach_vm_address_t v31 = xzm_segment_group_alloc_chunk(*(void *)(v7 + 40), 2, (unsigned __int8 *)(v7 + 79), 1u, &v51, 0, v50 < 0x401, 0);
            uint64_t v23 = v31;
            if (!v31)
            {
              uint64_t v9 = 0;
              goto LABEL_56;
            }
            *(unsigned char *)(v31 + 33) = *(unsigned char *)(v7 + 72);
            uint64_t v32 = v51;
            if (v51)
            {
              do
              {
                uint64_t v33 = *(void *)(v32 + 16);
                uint64_t v51 = *(void *)(v51 + 16);
                *(unsigned char *)(v32 + 33) = *(unsigned char *)(v7 + 72);
                *(unsigned char *)(v32 + 32) |= 0x40u;
                _xzm_chunk_list_push((os_unfair_lock_s *)v8, (atomic_ullong *)(v7 + 24), v32, 0);
                uint64_t v32 = v33;
              }
              while (v33);
            }
          }
          *(unsigned char *)(v23 + 32) &= ~0x40u;
          *(void *)uint64_t v23 = ((*(_DWORD *)(v7 + 68) << 11) + 4192256) & 0x3FF800 | 0x7FCu | ((unint64_t)(((_BYTE)a3 + 1) & 0x3F) << 22);
          *(_WORD *)(v23 + 34) = *(_WORD *)(v7 + 74);
          uint64_t v9 = (void *)(((0xAAAAAAAAAAAAC000 * (((unint64_t)(v23 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
                        + *(void *)((v23 & 0xFFFFFFFFFFFFC000) + 0x30));
        }
        _xzm_chunk_list_push((os_unfair_lock_s *)v8, (atomic_ullong *)(v7 + 16), v23, 1u);
        goto LABEL_56;
      }
      continue;
    }
    break;
  }
  uint64_t v9 = (void *)v21;
LABEL_60:
  if ((*(unsigned char *)(v8 + 240) & 3) != *(unsigned char *)(v7 + 77) && (v53 || (a4[2] & 0xFFFFFF00000000) != 0))
  {
    unint64_t v34 = 0x100000001;
    if (!v53) {
      unint64_t v34 = 1;
    }
    unint64_t v35 = atomic_fetch_add_explicit(a4 + 2, v34, memory_order_relaxed) + v34;
    unint64_t v36 = HIBYTE(v35);
    if (HIBYTE(v35) != (*(unsigned char *)(v8 + 240) & 3))
    {
      unint64_t v6 = HIDWORD(v35);
      if ((HIDWORD(v35) & 0xFFFFFFu) > *(_DWORD *)(v8 + 4 * v36 + 244)) {
        goto LABEL_73;
      }
      if (*(_DWORD *)(v8 + 256) < v35)
      {
        unint64_t v48 = a4[2];
        do
        {
          if (v48 < v35) {
            break;
          }
          if (v36 < HIBYTE(v48)) {
            break;
          }
          unint64_t v49 = v48;
          atomic_compare_exchange_strong_explicit(a4 + 2, &v49, v35 & 0xFF00000000000000, memory_order_relaxed, memory_order_relaxed);
          BOOL v17 = v49 == v48;
          unint64_t v48 = v49;
        }
        while (!v17);
      }
    }
  }
LABEL_68:
  *uint64_t v9 = 0;
  v9[1] = 0;
  if ((v10 & 1) != 0 && v50 >= 0x401) {
    bzero(v9, *(void *)(v7 + 48));
  }
  return (uint64_t)v9;
}

uint64_t _xzm_chunk_list_pop(os_unfair_lock_s *a1, atomic_ullong *a2, unsigned int a3)
{
  atomic_ullong v5 = *a2;
  uint64_t v6 = a3;
  do
  {
    while (v5 < 0)
    {
      _xzm_fork_lock_wait(a1);
      atomic_ullong v5 = *a2;
    }
    uint64_t result = v5 & 0x7FFFFFFFFFFFLL;
    if ((v5 & 0x7FFFFFFFFFFFLL) == 0) {
      break;
    }
    atomic_ullong v8 = v5;
    atomic_compare_exchange_strong_explicit(a2, (unint64_t *)&v8, (v5 + 0x800000000000) & 0x7FFF800000000000 | *(void *)((v5 & 0x7FFFFFFFFFFFLL) + 8 * v6 + 0x10) & 0x7FFFFFFFFFFFLL, memory_order_relaxed, memory_order_relaxed);
    BOOL v9 = v8 == v5;
    atomic_ullong v5 = v8;
  }
  while (!v9);
  return result;
}

uint64_t _xzm_xzone_malloc_from_tiny_chunk(uint64_t a1, uint64_t a2, int a3, atomic_ullong *a4, unsigned char *a5, unsigned char *a6)
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  atomic_ullong v8 = a4;
  uint64_t v9 = a2;
  uint64_t v10 = a1;
  unint64_t v11 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)((unsigned __int16)a4 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
      + *(void *)(((unint64_t)a4 & 0xFFFFFFFFFFFFC000) + 0x30);
  unint64_t v12 = *a4;
  int v13 = a3 + 1;
  unint64_t v14 = (unint64_t)((a3 + 1) & 0x3F) << 22;
  if ((*a4 & 0x40000000) != 0) {
    goto LABEL_21;
  }
  while (!v6)
  {
    if (((v12 >> 22) & 0x3F) != v13) {
      return 0;
    }
    unint64_t v15 = v12;
    if ((v12 & 0x3FF800) != 0) {
      goto LABEL_7;
    }
    unint64_t v26 = v12 & 0xFFFFFFFFF03FFFFFLL;
LABEL_19:
    unint64_t v22 = v12;
    atomic_compare_exchange_strong_explicit(v8, &v22, v26, memory_order_relaxed, memory_order_relaxed);
    if (v22 == v12) {
      return 0;
    }
LABEL_20:
    unint64_t v12 = v22;
    if ((v22 & 0x40000000) != 0)
    {
      do
      {
LABEL_21:
        _xzm_walk_lock_wait((os_unfair_lock_s *)v10);
        unint64_t v12 = *v8;
      }
      while ((*v8 & 0x40000000) != 0);
    }
  }
  if ((v12 & 0x3FF800) == 0)
  {
    if ((v12 & 0x7FF) == 0x7FE)
    {
      unint64_t v26 = v12 & 0xFFFFFFFFCFFFFFFFLL | 0x20000000;
      *uint64_t v6 = 1;
    }
    else
    {
      unint64_t v26 = v12 & 0xFFFFFFFFEFFFFFFFLL;
    }
    goto LABEL_19;
  }
  unint64_t v15 = v12 & 0xFFFFFFFFE03FFFFFLL | v14;
LABEL_7:
  uint64_t v16 = (v15 + 4192256) & 0x3FF800;
  unint64_t v17 = v16 | v15 & 0xFFFFFFFFFFC007FFLL;
  if ((v12 & 0x7FF) > 0x3FF)
  {
    if (v16) {
      unint64_t v23 = v17;
    }
    else {
      unint64_t v23 = v17 & 0xFFFFFFFFFFFFF800 | 0x7FD;
    }
    uint64_t v24 = *(unsigned int *)(v9 + 68);
    uint64_t v25 = *(void *)(v9 + 48);
    unint64_t v22 = v12;
    atomic_compare_exchange_strong_explicit(v8, &v22, v23, memory_order_relaxed, memory_order_relaxed);
    if (v22 == v12) {
      return v11 + (v24 - ((v12 >> 11) & 0x7FF)) * v25;
    }
    goto LABEL_14;
  }
  uint64_t result = v11 + 16 * (v12 & 0x7FF);
  uint64_t v20 = *(void *)result;
  unint64_t v19 = *(void *)(result + 8);
  unint64_t v21 = v17 & 0xFFF8003FFFFFF800 | v19 & 0x7FF | (((v19 >> 11) & 0x1FFF) << 38);
  unint64_t v22 = v12;
  atomic_compare_exchange_strong_explicit(v8, &v22, v21, memory_order_relaxed, memory_order_relaxed);
  if (v22 != v12)
  {
LABEL_14:
    *uint64_t v7 = 1;
    goto LABEL_20;
  }
  if ((*(void *)(v10 + 272) ^ result) != v20
    || v19 != (v19 & 0xFFFFFF | (((v12 >> 38) & 0x1FFF) << 24) & 0xFFFFFFE000FFFFFFLL))
  {
    _xzm_xzone_malloc_from_tiny_chunk_cold_1(result);
  }
  return result;
}

void _xzm_chunk_list_push(os_unfair_lock_s *a1, atomic_ullong *a2, uint64_t a3, unsigned int a4)
{
  atomic_ullong v6 = *a2;
  uint64_t v7 = a3 + 16;
  uint64_t v8 = a3 & 0x7FFFFFFFFFFFLL;
  uint64_t v9 = a4;
  do
  {
    while (v6 < 0)
    {
      _xzm_fork_lock_wait(a1);
      atomic_ullong v6 = *a2;
    }
    *(void *)(v7 + 8 * v9) = v6 & 0x7FFFFFFFFFFFLL;
    atomic_ullong v10 = v6;
    atomic_compare_exchange_strong_explicit(a2, (unint64_t *)&v10, (v6 + 0x800000000000) & 0x7FFF800000000000 | v8, memory_order_release, memory_order_relaxed);
    BOOL v11 = v10 == v6;
    atomic_ullong v6 = v10;
  }
  while (!v11);
}

uint64_t _malloc_ulock_self_owner_value()
{
  return *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24) >> 2;
}

BOOL mvm_madvise(void *a1, size_t a2, int a3)
{
  return madvise(a1, a2, a3) == -1;
}

void _xzm_xzone_malloc_small(uint64_t a1, uint64_t a2, char a3, int8x8_t a4)
{
  uint64_t v6 = *(unsigned __int8 *)(a2 + 77);
  if (v6 == 1)
  {
    unint64_t v7 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) >> 12;
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    LOBYTE(v7) = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
LABEL_5:
    unsigned __int8 v8 = v7;
    goto LABEL_7;
  }
  unsigned __int8 v8 = 0;
LABEL_7:
  int v9 = 0;
  uint64_t v10 = *(void *)(a1 + 224);
  unint64_t v11 = *(unsigned __int8 *)(a2 + 72) + *(unsigned __int8 *)(a1 + 210) * (unint64_t)v8;
  unint64_t v12 = (os_unfair_lock_s *)(v10 + 32 * v11);
  unsigned int v13 = *(unsigned char *)(a1 + 240) & 3;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  os_unfair_lock_t lock = v12 + 2;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v12[2], (unsigned int *)&v9, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  BOOL v15 = v9 == 0;
  if (v6 < v13)
  {
    if (v15) {
      goto LABEL_42;
    }
    int v16 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v16, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v16) {
      os_unfair_lock_lock_with_options();
    }
    unsigned int v17 = v12[5]._os_unfair_lock_opaque + 1;
    v12[5]._os_unfair_lock_opaque = v17;
    if (v17 <= *(_DWORD *)(a1 + 4 * v6 + 244))
    {
LABEL_42:
      uint64_t v32 = v10 + 32 * v11;
      unsigned int v33 = *(_DWORD *)(v32 + 16) + 1;
      *(_DWORD *)(v32 + 16) = v33;
      if (!(v33 % *(_DWORD *)(a1 + 256))) {
        v12[5]._os_unfair_lock_opaque = 0;
      }
      goto LABEL_44;
    }
    v12[5]._os_unfair_lock_opaque = 0;
    if (v6 == 2)
    {
      uint64_t v18 = &logical_ncpus;
    }
    else
    {
      if (v6 != 1)
      {
LABEL_30:
        int v28 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a2 + 24), (unsigned int *)&v28, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v28) {
          os_unfair_lock_lock_with_options();
        }
        if (*(unsigned __int8 *)(a2 + 77) == v6)
        {
          if (v6)
          {
            if (v6 != 1) {
              goto LABEL_171;
            }
            char v29 = 2;
          }
          else if (ncpuclusters > 1)
          {
            char v29 = 1;
          }
          else
          {
            char v29 = 2;
          }
          *(unsigned char *)(a2 + 77) = v29;
        }
        int v30 = *(_DWORD *)(StatusReg + 24);
        int v31 = v30;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a2 + 24), (unsigned int *)&v31, 0, memory_order_release, memory_order_relaxed);
        if (v31 != v30) {
          os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
        }
        goto LABEL_42;
      }
      uint64_t v18 = &ncpuclusters;
    }
    int v19 = *v18;
    if ((*v18 & 0xFE) != 0)
    {
      uint64_t v101 = v10;
      unsigned __int8 v102 = v8;
      int v20 = *(_DWORD *)(StatusReg + 24);
      int v21 = v20;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v21, 0, memory_order_release, memory_order_relaxed);
      if (v21 != v20) {
        os_unfair_lock_unlock(lock);
      }
      uint64_t v22 = 0;
      do
      {
        unint64_t v23 = (os_unfair_lock_s *)(*(void *)(a1 + 224)
                                 + 32 * (*(unsigned __int8 *)(a2 + 72) + v22 * *(unsigned __int8 *)(a1 + 210)));
        if (v23 != v12)
        {
          int v24 = 0;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v23[2], (unsigned int *)&v24, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
          if (v24) {
            os_unfair_lock_lock_with_options();
          }
          v23[5]._os_unfair_lock_opaque = 0;
          int v25 = *(_DWORD *)(StatusReg + 24);
          int v26 = v25;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v23[2], (unsigned int *)&v26, 0, memory_order_release, memory_order_relaxed);
          if (v26 != v25) {
            os_unfair_lock_unlock(v23 + 2);
          }
        }
        ++v22;
      }
      while (v19 != v22);
      int v27 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v27, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      uint64_t v10 = v101;
      unsigned __int8 v8 = v102;
      if (v27) {
        os_unfair_lock_lock_with_options();
      }
    }
    goto LABEL_30;
  }
  if (!v15) {
    os_unfair_lock_lock_with_options();
  }
LABEL_44:
  uint64_t v34 = *(void *)&v12->_os_unfair_lock_opaque;
  if (*(void *)&v12->_os_unfair_lock_opaque)
  {
    uint64_t v35 = *(unsigned char *)(v34 + 32) & 0xF;
    if (v35 == 2)
    {
      if ((*(void *)v34 & 0x3FF800) != 0 || (*(void *)v34 | 0xFFFFF800) >= 0xFFFFFFFE) {
        goto LABEL_103;
      }
    }
    else
    {
      if (v35 != 5) {
        goto LABEL_169;
      }
      if (*(_DWORD *)(v34 + 4) != *(_DWORD *)(a2 + 68)) {
        goto LABEL_103;
      }
    }
  }
  int v37 = 0;
  uint64_t v6 = a2 + 24;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a2 + 24), (unsigned int *)&v37, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v37) {
    os_unfair_lock_lock_with_options();
  }
  if (v34)
  {
    uint64_t v38 = a2 + 8;
    uint64_t v39 = *(void *)(a2 + 8);
    *(void *)(v34 + 16) = v39;
    if (v39) {
      *(void *)(*(void *)v38 + 24) = v34 + 16;
    }
    *(void *)uint64_t v38 = v34;
    *(void *)(v34 + 24) = v38;
    atomic_store(0, (unsigned __int8 *)(v34 + 12));
  }
  while (1)
  {
    uint64_t v34 = *(void *)a2;
    if (!*(void *)a2)
    {
      int v44 = *(_DWORD *)(StatusReg + 24);
      int v45 = v44;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v45, 0, memory_order_release, memory_order_relaxed);
      if (v45 != v44) {
        os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
      }
      if (*(unsigned char *)(a2 + 78))
      {
        uint64_t v46 = *(void *)(a1 + 232) ? *(void *)(a1 + 232) : a1;
        uint64_t chunk_from_isolation = _xzm_xzone_allocate_chunk_from_isolation(v46, a2);
        if (chunk_from_isolation)
        {
          uint64_t v34 = chunk_from_isolation;
LABEL_98:
          *(void *)&v12->_os_unfair_lock_opaque = v34;
          *(unsigned char *)(v34 + 12) = v8 + 1;
          goto LABEL_103;
        }
      }
      unint64_t v48 = (uint64_t *)(a2 + 16);
      if (*(void *)(a2 + 16))
      {
        int v49 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v49, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v49) {
          os_unfair_lock_lock_with_options();
        }
        uint64_t v34 = *v48;
        if (*v48)
        {
          uint64_t v50 = *(void *)(v34 + 16);
          if (v50)
          {
            *(void *)(v50 + 24) = *(void *)(v34 + 24);
            uint64_t v50 = *(void *)(v34 + 16);
          }
          **(void **)(v34 + 24) = v50;
        }
        int v51 = *(_DWORD *)(StatusReg + 24);
        int v52 = v51;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v52, 0, memory_order_release, memory_order_relaxed);
        if (v52 != v51) {
          os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
        }
        if (v34)
        {
LABEL_97:
          _xzm_xzone_fresh_chunk_init(a2, v34, 5);
          *(_WORD *)(v34 + 34) = *(_WORD *)(a2 + 74);
          goto LABEL_98;
        }
      }
      uint64_t v105 = 0;
      mach_vm_address_t v53 = xzm_segment_group_alloc_chunk(*(void *)(a2 + 40), 5, (unsigned __int8 *)(a2 + 79), 4u, &v105, 0, 0, 0);
      if (v53)
      {
        uint64_t v34 = v53;
        *(unsigned char *)(v53 + 33) = *(unsigned char *)(a2 + 72);
        if (v105)
        {
          int v54 = 0;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v54, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
          if (v54) {
            os_unfair_lock_lock_with_options();
          }
          uint64_t v55 = v105;
          if (v105)
          {
            uint64_t v56 = v105;
            do
            {
              uint64_t v57 = *(void *)(v55 + 16);
              uint64_t v56 = *(void *)(v56 + 16);
              *(unsigned char *)(v55 + 33) = *(unsigned char *)(a2 + 72);
              *(unsigned char *)(v55 + 32) |= 0x40u;
              uint64_t v58 = *(void *)(a2 + 16);
              *(void *)(v55 + 16) = v58;
              if (v58) {
                *(void *)(*v48 + 24) = v55 + 16;
              }
              *unint64_t v48 = v55;
              *(void *)(v55 + 24) = v48;
              uint64_t v55 = v57;
            }
            while (v57);
            uint64_t v105 = v56;
          }
          int v59 = *(_DWORD *)(StatusReg + 24);
          int v60 = v59;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v60, 0, memory_order_release, memory_order_relaxed);
          if (v60 != v59) {
            os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
          }
        }
        goto LABEL_97;
      }
      v94 = 0;
      *(void *)&v12->_os_unfair_lock_opaque = 0;
LABEL_149:
      int v95 = *(_DWORD *)(StatusReg + 24);
      int v96 = v95;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v96, 0, memory_order_release, memory_order_relaxed);
      if (v96 != v95) {
        os_unfair_lock_unlock(lock);
      }
      if (v94)
      {
        v94[1] = 0;
        if (a3)
        {
          size_t v97 = *(void *)(a2 + 48);
          if (v97 >= 0x401) {
            bzero(v94, v97);
          }
        }
      }
      else
      {
        **(_DWORD **)(StatusReg + 8) = 12;
      }
      return;
    }
    int v40 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v34 + 8), (unsigned int *)&v40, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v40) {
      os_unfair_lock_lock_with_options();
    }
    uint64_t v41 = *(void *)(v34 + 16);
    if (v41)
    {
      *(void *)(v41 + 24) = *(void *)(v34 + 24);
      uint64_t v41 = *(void *)(v34 + 16);
    }
    **(void **)(v34 + 24) = v41;
    *(unsigned char *)(v34 + 32) &= ~0x20u;
    if (*(_DWORD *)(v34 + 4)) {
      break;
    }
    int v42 = *(_DWORD *)(StatusReg + 24);
    int v43 = v42;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v34 + 8), (unsigned int *)&v43, 0, memory_order_release, memory_order_relaxed);
    if (v43 != v42) {
      os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 8));
    }
  }
  *(void *)&v12->_os_unfair_lock_opaque = v34;
  *(unsigned char *)(v34 + 12) = v8 + 1;
  int v61 = *(_DWORD *)(StatusReg + 24);
  int v62 = v61;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v34 + 8), (unsigned int *)&v62, 0, memory_order_release, memory_order_relaxed);
  if (v62 != v61) {
    os_unfair_lock_unlock((os_unfair_lock_t)(v34 + 8));
  }
  int v63 = *(_DWORD *)(StatusReg + 24);
  int v64 = v63;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v64, 0, memory_order_release, memory_order_relaxed);
  if (v64 != v63) {
    os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
  }
LABEL_103:
  uint64_t v35 = *(unsigned char *)(v34 + 32) & 0xF;
  if ((v35 - 6) < 2)
  {
    uint64_t v65 = 0;
LABEL_108:
    if (v35 == 5)
    {
      unint64_t v66 = (0xAAAAAAAAAAAAC000 * (((unint64_t)(v34 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000;
      int v67 = *(_DWORD *)(v34 + 4);
      if (!v67 || !v65 || (uint64_t v68 = *(unsigned int *)(v34 + 40), !v68))
      {
        unsigned int v85 = *(_DWORD *)v34;
LABEL_144:
        unsigned int v91 = __clz(__rbit32(v85));
        BOOL v92 = v85 == 0;
LABEL_145:
        if (v92) {
          unsigned int v93 = -1;
        }
        else {
          unsigned int v93 = v91;
        }
LABEL_148:
        v94 = (void *)(v66 + *(void *)((v34 & 0xFFFFFFFFFFFFC000) + 0x30) + *(void *)(a2 + 48) * v93);
        *(_DWORD *)uint64_t v34 = v85 & ~(1 << v93);
        *(_DWORD *)(v34 + 4) = v67 + 1;
        goto LABEL_149;
      }
      uint64_t v69 = 0;
      unsigned int v70 = 0;
      uint64_t v71 = 0;
      unint64_t v72 = 0;
      uint64_t v73 = *(void *)(a1 + 216);
      uint64_t v74 = 48 * v68;
      unsigned int v75 = -1;
      while (1)
      {
        unint64_t v76 = v34 + v69;
        uint64_t v77 = v34 + v69;
        uint64_t v6 = v34 + v69;
        if ((*(unsigned char *)(v34 + v69 + 32) & 0xF) != 4) {
          goto LABEL_114;
        }
        uint64_t v86 = *(unsigned int *)(v76 + 36);
        uint64_t v87 = v76 - v86;
        unsigned int v88 = *(unsigned char *)(v76 - v86 + 32) & 0xF;
        uint64_t v77 = v34 + v69;
        uint64_t v6 = v34 + v69;
        if (v88 > 8) {
          goto LABEL_114;
        }
        int v89 = 1 << v88;
        if ((v89 & 0x1E8) == 0) {
          break;
        }
        uint64_t v77 = v34 + v69;
        uint64_t v6 = v34 + v69;
        if (v87 + 48 * (unint64_t)*(unsigned int *)(v87 + 40) > v76) {
          goto LABEL_142;
        }
LABEL_114:
        uint64_t v35 = *(unsigned char *)(v6 + 32) & 0xF;
        if ((v35 - 6) < 2)
        {
          unint64_t v78 = (unint64_t)*(unsigned int *)(v6 + 40) << 14;
        }
        else
        {
          if (v35 != 5 && v35 != 2)
          {
            qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: asking for size of chunk with invalid kind";
            qword_1E93090E0 = v35;
            __break(1u);
LABEL_167:
            qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: asking for size of chunk with invalid kind";
            qword_1E93090E0 = v35;
            __break(1u);
            goto LABEL_168;
          }
          unint64_t v78 = *(void *)(v73 + 88 * *(unsigned __int8 *)(v6 + 33) + 48);
        }
        unint64_t v79 = ((0xAAAAAAAAAAAAC000 * ((v76 - (v76 & 0xFFFFFFFFFFFFC000) - 2104) >> 4)) & 0x3FFFFFFFC000)
            + *(void *)((v76 & 0xFFFFFFFFFFFFC000) + 0x30);
        unint64_t v80 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)(v77 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
            + *(void *)((v77 & 0xFFFFFFFFFFFFC000) + 0x30);
        unint64_t v81 = (v79 - v80) / v78;
        int v82 = *(_DWORD *)(v73 + 88 * *(unsigned __int8 *)(v6 + 33) + 68);
        if (v82 == v81)
        {
          LODWORD(v83) = 0;
        }
        else
        {
          if ((v35 - 6) < 2)
          {
            unint64_t v84 = (unint64_t)*(unsigned int *)(v6 + 40) << 14;
          }
          else
          {
            if (v35 != 5 && v35 != 2) {
              goto LABEL_167;
            }
            unint64_t v84 = *(void *)(v73 + 88 * *(unsigned __int8 *)(v6 + 33) + 48);
          }
          unint64_t v83 = (unint64_t)~(-1 << ((v79 - v80 + 0x3FFF) / v84
                                                       - v81
                                                       - (v82 == ((v79 - v80 + 0x3FFF) / v84))
                                                       + 1)) << v81;
        }
        unsigned int v85 = *(_DWORD *)v34;
        if ((*(_DWORD *)v34 & v83) != 0 && (*(_DWORD *)v34 & v83) != v83)
        {
          a4.i32[0] = *(_DWORD *)v34 & v83;
          a4 = vcnt_s8(a4);
          a4.i16[0] = vaddlv_u8((uint8x8_t)a4);
          if (a4.i32[0] < v75)
          {
            unsigned int v70 = *(_DWORD *)v34 & v83;
            unsigned int v75 = a4.i32[0];
            unint64_t v72 = v34 + v69;
          }
        }
        ++v71;
        v69 += 48;
        if (v74 == v69)
        {
          if (!v72) {
            goto LABEL_144;
          }
          unsigned int v93 = __clz(__rbit32(v70));
          if (!v70)
          {
            unsigned int v93 = -1;
            goto LABEL_148;
          }
          a4.i32[0] = v70;
          uint8x8_t v98 = (uint8x8_t)vcnt_s8(a4);
          v98.i16[0] = vaddlv_u8(v98);
          if (v98.i32[0] >= 2u)
          {
            unint64_t v99 = (v66 + v93 + *(void *)(a2 + 48)) >> 14;
            unint64_t v100 = (v34 & 0xFFFFFFFFFFFFC000) + 48 * v99 + 2104;
            if (*(_DWORD *)((v34 & 0xFFFFFFFFFFFFC000) + 0x10) <= v99) {
              unint64_t v100 = 0;
            }
            if (v100 < v72)
            {
              BOOL v92 = (v70 & ~(1 << v93)) == 0;
              unsigned int v91 = __clz(__rbit32(v70 & ~(1 << v93)));
              goto LABEL_145;
            }
          }
          goto LABEL_148;
        }
      }
      BOOL v90 = (v89 & 6) != 0 && v76 == v87;
      uint64_t v77 = v34 + v69;
      uint64_t v6 = v34 + v69;
      if (!v90) {
        goto LABEL_114;
      }
LABEL_142:
      uint64_t v77 = v34 + 48 * v71 - v86;
      uint64_t v6 = v76 - v86;
      goto LABEL_114;
    }
LABEL_168:
    uint64_t v35 = v35;
    qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: attempting to allocate from chunk of bad kind";
    qword_1E93090E0 = v35;
    __break(1u);
LABEL_169:
    qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
    qword_1E93090E0 = v35;
    __break(1u);
    goto LABEL_170;
  }
  if (v35 == 5 || v35 == 2)
  {
    uint64_t v65 = *(void *)(*(void *)(a1 + 216) + 88 * *(unsigned __int8 *)(v34 + 33) + 48) & 0x3FFFLL;
    goto LABEL_108;
  }
LABEL_170:
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: asking for size of chunk with invalid kind";
  qword_1E93090E0 = v35;
  __break(1u);
LABEL_171:
  if (v6 == 2)
  {
    qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Can't upgrade from XZM_SLOT_CPU";
    __break(1u);
  }
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Invalid xzone slot config";
  __break(1u);
}

void _xzm_xzone_free_block_to_small_chunk(uint64_t a1, uint64_t a2, int8x8_t *a3, int a4)
{
  unsigned __int8 v8 = a3[1].u8[4];
  int v9 = (os_unfair_lock_s *)&a3[1];
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  while (1)
  {
    while (v8)
    {
      int v11 = 0;
      uint64_t v12 = *(void *)(a1 + 224);
      unint64_t v13 = *(unsigned __int8 *)(a2 + 72) + *(unsigned __int8 *)(a1 + 210) * (unint64_t)(v8 - 1);
      unint64_t v14 = (os_unfair_lock_s *)(v12 + 32 * v13 + 8);
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v14, (unsigned int *)&v11, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v11) {
        os_unfair_lock_lock_with_options();
      }
      int v15 = a3[1].u8[4];
      if (v15 == v8)
      {
        _xzm_xzone_free_to_chunk(a1, a3, a4);
        _xzm_xzone_chunk_madvise_free_slices(a1, a2, (uint64_t)a3, a4);
        uint64_t v21 = a3[4].i8[0] & 0xF;
        if (v21 == 2)
        {
          if ((~a3->i32[0] & 0x7FE) == 0 || (((unsigned __int32)a3->i32[0] >> 11) & 0x7FF) == *(_DWORD *)(a2 + 68)) {
            goto LABEL_24;
          }
        }
        else
        {
          if (v21 != 5)
          {
            qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
            qword_1E93090E0 = v21;
            __break(1u);
            goto LABEL_65;
          }
          if (!a3->i32[1])
          {
LABEL_24:
            *(void *)(v12 + 32 * v13) = 0;
            a3[1].i8[4] = 0;
            int v26 = *(_DWORD *)(StatusReg + 24);
            int v27 = v26;
            atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v14, (unsigned int *)&v27, 0, memory_order_release, memory_order_relaxed);
            if (v27 != v26)
            {
              int v28 = (os_unfair_lock_s *)(v12 + 32 * v13 + 8);
              goto LABEL_56;
            }
            goto LABEL_57;
          }
        }
        int v23 = *(_DWORD *)(StatusReg + 24);
        int v24 = v23;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v14, (unsigned int *)&v24, 0, memory_order_release, memory_order_relaxed);
        if (v24 == v23) {
          return;
        }
        int v25 = (os_unfair_lock_s *)(v12 + 32 * v13 + 8);
LABEL_61:
        os_unfair_lock_unlock(v25);
        return;
      }
      int v16 = *(_DWORD *)(StatusReg + 24);
      int v17 = v16;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v14, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
      unsigned __int8 v8 = v15;
      if (v17 != v16) {
LABEL_12:
      }
        os_unfair_lock_unlock(v14);
    }
    int v18 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v18, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v18) {
      os_unfair_lock_lock_with_options();
    }
    unsigned __int8 v8 = a3[1].u8[4];
    if (!v8) {
      break;
    }
    int v19 = *(_DWORD *)(StatusReg + 24);
    int v20 = v19;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v20, 0, memory_order_release, memory_order_relaxed);
    unint64_t v14 = v9;
    if (v20 != v19) {
      goto LABEL_12;
    }
  }
  uint64_t v21 = a3[4].i8[0] & 0xF;
  if (v21 != 2)
  {
    if (v21 == 5)
    {
      BOOL v22 = a3->i32[1] == *(_DWORD *)(a2 + 68);
      goto LABEL_29;
    }
LABEL_65:
    qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
    qword_1E93090E0 = v21;
    __break(1u);
LABEL_66:
    qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
    qword_1E93090E0 = v21;
    __break(1u);
    return;
  }
  BOOL v22 = (*(void *)a3 & 0x3FF800) == 0 && (a3->u32[0] | 0xFFFFF800) < 0xFFFFFFFE;
LABEL_29:
  _xzm_xzone_free_to_chunk(a1, a3, a4);
  _xzm_xzone_chunk_madvise_free_slices(a1, a2, (uint64_t)a3, a4);
  uint64_t v21 = a3[4].i8[0] & 0xF;
  if (v21 == 2)
  {
    if ((~a3->i32[0] & 0x7FE) == 0 || (((unsigned __int32)a3->i32[0] >> 11) & 0x7FF) == *(_DWORD *)(a2 + 68)) {
      goto LABEL_46;
    }
  }
  else
  {
    if (v21 != 5) {
      goto LABEL_66;
    }
    if (!a3->i32[1])
    {
LABEL_46:
      int v36 = *(_DWORD *)(StatusReg + 24);
      int v37 = v36;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v37, 0, memory_order_release, memory_order_relaxed);
      if (v37 != v36) {
        os_unfair_lock_unlock(v9);
      }
      int v38 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a2 + 24), (unsigned int *)&v38, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v38) {
        os_unfair_lock_lock_with_options();
      }
      if ((a3[4].i8[0] & 0x20) != 0)
      {
        uint64_t v39 = (int8x8_t *)a3[2];
        if (v39)
        {
          v39[3] = a3[3];
          uint64_t v39 = (int8x8_t *)a3[2];
        }
        **(void **)&a3[3] = v39;
        a3[4].i8[0] &= ~0x20u;
      }
      int v40 = *(_DWORD *)(StatusReg + 24);
      int v41 = v40;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a2 + 24), (unsigned int *)&v41, 0, memory_order_release, memory_order_relaxed);
      if (v41 != v40)
      {
        int v28 = (os_unfair_lock_s *)(a2 + 24);
LABEL_56:
        os_unfair_lock_unlock(v28);
      }
LABEL_57:
      _xzm_xzone_chunk_free(a1, a2, (unint64_t)a3);
      return;
    }
  }
  if (v22)
  {
    int v29 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a2 + 24), (unsigned int *)&v29, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v29) {
      os_unfair_lock_lock_with_options();
    }
    int v30 = (int8x8_t *)a3[2];
    if (v30)
    {
      v30[3] = a3[3];
      int v30 = (int8x8_t *)a3[2];
    }
    **(void **)&a3[3] = v30;
    int8x8_t v31 = *(int8x8_t *)a2;
    a3[2] = *(int8x8_t *)a2;
    if (v31) {
      *(void *)(*(void *)a2 + 24) = a3 + 2;
    }
    *(void *)a2 = a3;
    a3[3] = (int8x8_t)a2;
    a3[4].i8[0] |= 0x20u;
    int v32 = *(_DWORD *)(StatusReg + 24);
    int v33 = v32;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a2 + 24), (unsigned int *)&v33, 0, memory_order_release, memory_order_relaxed);
    if (v33 != v32) {
      os_unfair_lock_unlock((os_unfair_lock_t)(a2 + 24));
    }
  }
  int v34 = *(_DWORD *)(StatusReg + 24);
  int v35 = v34;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v35, 0, memory_order_release, memory_order_relaxed);
  if (v35 != v34)
  {
    int v25 = v9;
    goto LABEL_61;
  }
}

uint64_t _xzm_xzone_chunk_madvise_free_slices(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  if ((*(unsigned char *)(a3 + 32) & 0xF) == 5)
  {
    uint64_t v4 = result;
    uint64_t result = *(void *)(a3 & 0xFFFFFFFFFFFFC000);
    switch(*(unsigned char *)result)
    {
      case 0:
      case 2:
        if (((*(unsigned __int8 *)(*(void *)(result + 24) + 328) >> 2) & 1) == 0) {
          goto LABEL_6;
        }
        return result;
      case 1:
      case 3:
        if ((*(unsigned char *)(*(void *)(result + 24) + 328) & 8) == 0)
        {
LABEL_6:
          uint64_t v5 = *(void *)((a3 & 0xFFFFFFFFFFFFC000) + 0x30);
          unint64_t v6 = 0xAAAAAAAAAAAAC000 * ((a3 - (a3 & 0xFFFFFFFFFFFFC000) - 2104) >> 4);
          unint64_t v7 = *(void *)(*(void *)(v4 + 216) + 88 * *(unsigned __int8 *)(a3 + 33) + 48);
          unint64_t v8 = (a4 - v5 - v6) / v7;
          unint64_t v9 = (v6 & 0x3FFFFFFFC000) + v7 * v8;
          unint64_t v10 = v9 >> 14;
          unint64_t v11 = (v7 + v9 - 1) >> 14;
          unint64_t v12 = ((v9 - v6) & 0xFFFFC000) / v7;
          unint64_t v13 = (~v6 + ((v11 + 1) << 14)) / v7;
          if ((((unint64_t)~(-1 << (v8 - v12 + 1)) << v12) & ~*(_DWORD *)a3) != 0) {
            uint64_t v14 = (v10 + 1);
          }
          else {
            uint64_t v14 = v10;
          }
          if ((((unint64_t)~(-1 << (v13
                                                                      - v8
                                                                      - (*(_DWORD *)(a2 + 68) == v13)
                                                                      + 1)) << v8) & ~*(_DWORD *)a3) != 0)
            unsigned int v15 = v11;
          else {
            unsigned int v15 = v11 + 1;
          }
          BOOL v16 = v15 >= v14;
          unsigned int v17 = v15 - v14;
          if (v17 != 0 && v16)
          {
            if (v16) {
              unsigned int v18 = v17;
            }
            else {
              unsigned int v18 = 0;
            }
            uint64_t result = xzm_segment_group_segment_madvise_span(result, (void *)(v5 + (v14 << 14)), v18);
          }
        }
        break;
      default:
        _xzm_segment_group_find_and_allocate_chunk_cold_1(*(unsigned char *)result);
    }
  }
  return result;
}

int32x2_t _xzm_xzone_free_to_chunk(uint64_t a1, int8x8_t *a2, int a3)
{
  if ((a2[4].i8[0] & 0xF) != 5) {
    _xzm_xzone_free_to_chunk_cold_1(a2[4].i8[0] & 0xF);
  }
  v3.i32[1] = -1;
  v3.i32[0] = 1 << ((unint64_t)(a3
                                     + 1431650304 * ((a2 - (a2 & 0xFFFFC000 | 0x838)) >> 4)
                                     - *(_DWORD *)(((unint64_t)a2 & 0xFFFFFFFFFFFFC000) + 0x30))
                  / *(void *)(*(void *)(a1 + 216) + 88 * a2[4].u8[1] + 48));
  v3.i32[0] = vorr_s8(v3, *a2).u32[0];
  int32x2_t result = vadd_s32((int32x2_t)*a2, (int32x2_t)-1);
  v3.i32[1] = result.i32[1];
  *a2 = v3;
  return result;
}

BOOL xzm_segment_group_segment_madvise_chunk(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned char *)(a2 + 32) & 0xF;
  if ((v2 - 6) < 2)
  {
    size_t v3 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
  }
  else if (v2 == 2)
  {
    size_t v3 = 0x4000;
  }
  else
  {
    if (v2 != 5) {
      xzm_chunk_mark_free_cold_1(v2);
    }
    size_t v3 = 0x10000;
  }
  uint64_t v4 = (void *)(((0xAAAAAAAAAAAAC000 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
              + *(void *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30));

  return mvm_madvise(v4, v3, 7);
}

unint64_t _xzm_xzone_malloc_from_empty_tiny_chunk(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)a4, memory_order_acquire);
  uint64_t v8 = *(void *)(a1 + 232);
  if (!v8) {
    uint64_t v8 = a1;
  }
  if ((*(unsigned char *)(v8 + 328) & 4) != 0 && !xzm_chunk_mark_used(a1, a4)) {
    return 0;
  }
  unint64_t v9 = explicit;
  atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)a4, &v9, explicit & 0xFFFFFFFFD0000000 | ((unint64_t)((a3 + 1) & 0x3F) << 22) | ((*(_DWORD *)(a2 + 68) << 11)+ 4192256) & 0x3FF800 | 0x7FC, memory_order_acquire, memory_order_acquire);
  if (v9 != explicit) {
    _xzm_xzone_malloc_from_empty_tiny_chunk_cold_1();
  }
  return ((0xAAAAAAAAAAAAC000 * (((unint64_t)(a4 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(void *)((a4 & 0xFFFFFFFFFFFFC000) + 0x30);
}

void xzm_malloc(uint64_t a1, unint64_t a2, unint64_t a3, char a4, int8x8_t a5)
{
  if (a2 <= 0x8000)
  {
    if (*(void *)(a1 + 232)) {
      uint64_t v5 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v5 = a1;
    }
    unint64_t v6 = __clz(a2 - 1);
    unint64_t v7 = (((a2 - 1) >> (61 - v6)) & 3) - 4 * v6 + 488;
    if (a2 <= 0x80) {
      unint64_t v7 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    }
    if (!a2) {
      LOBYTE(v7) = 0;
    }
    uint64_t v8 = v7;
    char v9 = *(unsigned char *)(*(void *)(v5 + 368) + v7);
    if (HIWORD(a3) == 256)
    {
      char v10 = 0;
    }
    else if ((a3 & 0xC0000000000) == 0x40000000000)
    {
      char v10 = 1;
    }
    else
    {
      if (a3) {
        unsigned int v11 = a3;
      }
      else {
        unsigned int v11 = dword_1EB1C96FC;
      }
      LOBYTE(v12) = 0;
      switch(*(unsigned char *)(*(void *)(v5 + 360) + v8))
      {
        case 4:
          LODWORD(v12) = (*(_DWORD *)(v5 + 316) + *(_DWORD *)(v5 + 312) * v11) >> 31;
          break;
        case 5:
          unint64_t v13 = (*(void *)(v5 + 320) + *(void *)(v5 + 312) * (unint64_t)v11) >> 34;
          LODWORD(v12) = v13 - 3 * ((1431655766 * (unint64_t)v13) >> 32);
          break;
        case 6:
          unint64_t v12 = ((*(void *)(v5 + 320) + *(void *)(v5 + 312) * (unint64_t)v11) >> 32) & 3;
          break;
        default:
          break;
      }
      char v10 = v12 + 2;
    }
    _xzm_xzone_malloc(a1, a2, (v10 + v9), a4, a5);
  }
  else
  {
    _xzm_malloc_large_huge(a1, a2, 0, a3, a4);
  }
}

BOOL xzm_segment_group_segment_madvise_span(uint64_t a1, void *a2, unsigned int a3)
{
  return mvm_madvise(a2, (unint64_t)a3 << 14, 7);
}

unint64_t nanov2_pointer_size(uint64_t a1, unint64_t a2, int a3)
{
  if (a2 >> 29 != 24 || !a3 && (a2 & 0xF) != 0) {
    return 0;
  }
  if (*(void *)(a1 + 28720) > a2 || *(void *)(a1 + 28728) < a2) {
    return 0;
  }
  unint64_t v4 = 0;
  uint64_t v6 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  unsigned int v7 = *(_DWORD *)((*(void *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                 + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) & 0x7FF;
  if (v7 > 0x7FD)
  {
    if (v7 - 2046 < 2) {
      return v4;
    }
  }
  else
  {
    if (!v7 || v7 == 2042) {
      return v4;
    }
    if (v7 == 2044) {
      goto LABEL_17;
    }
  }
  if (((*(_DWORD *)((*(void *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                   + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) >> 11) & 0x3FF) == slots_by_size_class[v6] - 1)
    return 0;
LABEL_17:
  unint64_t v4 = 16 * (int)v6 + 16;
  if (!a3 && (a2 & 0x3FFF) != (a2 & 0x3FFF) / v4 * (int)v4) {
    return 0;
  }
  if ((*(void *)(a1 + 28696) ^ *(void *)a2) == a2) {
    return 0;
  }
  return v4;
}

uint64_t _xzm_xzone_allocate_chunk_from_isolation(uint64_t a1, uint64_t a2)
{
  int v2 = (os_unfair_lock_s *)(*(void *)(a1 + 376) + 16 * *(unsigned __int8 *)(a2 + 72));
  if (!*(void *)&v2->_os_unfair_lock_opaque) {
    return 0;
  }
  int v5 = 0;
  uint64_t v19 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v2[2], (unsigned int *)&v5, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v5) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v7 = *(void *)&v2->_os_unfair_lock_opaque;
  if (!*(void *)&v2->_os_unfair_lock_opaque)
  {
    uint64_t v8 = 0;
    goto LABEL_17;
  }
  do
  {
    uint64_t v8 = v7;
    char v10 = (uint64_t *)(v7 + 16);
    uint64_t v9 = *(void *)(v7 + 16);
    if (v9)
    {
      *(void *)(v9 + 24) = *(void *)(v8 + 24);
      uint64_t v9 = *(void *)(v8 + 16);
    }
    **(void **)(v8 + 24) = v9;
    if (*(void *)(a2 + 48) <= 0x1000uLL || (*(unsigned char *)(a1 + 328) & 4) == 0 || (xzm_chunk_mark_used(a1, v8) & 1) != 0)
    {
      *(_WORD *)(v8 + 34) = *(_WORD *)(a2 + 74);
LABEL_17:
      uint64_t v13 = v19;
      uint64_t v12 = v8;
      goto LABEL_18;
    }
    uint64_t v11 = v19;
    uint64_t *v10 = v19;
    if (v11) {
      *(void *)(v11 + 24) = v10;
    }
    uint64_t v19 = v8;
    *(void *)(v8 + 24) = &v19;
    uint64_t v7 = *(void *)&v2->_os_unfair_lock_opaque;
  }
  while (*(void *)&v2->_os_unfair_lock_opaque);
  uint64_t v12 = 0;
  do
  {
    uint64_t v13 = *(void *)(v8 + 16);
    if (v13)
    {
      *(void *)(v13 + 24) = *(void *)(v8 + 24);
      uint64_t v14 = *(void *)(v8 + 16);
    }
    else
    {
      uint64_t v14 = 0;
    }
    **(void **)(v8 + 24) = v14;
    uint64_t v15 = *(void *)&v2->_os_unfair_lock_opaque;
    *(void *)(v8 + 16) = *(void *)&v2->_os_unfair_lock_opaque;
    if (v15) {
      *(void *)(*(void *)&v2->_os_unfair_lock_opaque + 24) = v8 + 16;
    }
    *(void *)&v2->_os_unfair_lock_opaque = v8;
    *(void *)(v8 + 24) = v2;
LABEL_18:
    uint64_t v8 = v13;
  }
  while (v13);
  int v16 = *(_DWORD *)(StatusReg + 24);
  int v17 = v16;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v2[2], (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
  if (v17 != v16) {
    os_unfair_lock_unlock(v2 + 2);
  }
  return v12;
}

void _xzm_xzone_chunk_free(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 40);
  *(_WORD *)(a3 + 34) = 0;
  if (*(unsigned char *)(a2 + 78))
  {
    if (*(void *)(a1 + 232)) {
      uint64_t v8 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v8 = a1;
    }
    if ((*(unsigned char *)(v8 + 328) & 4) != 0)
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFC000)
                     + 0xFFFFFFFD55555558 * (((a3 & 0x3FFF) - 2104) >> 4)
                     + 0x38) == -1)
        xzm_chunk_mark_free(a1, a3);
    }
    else
    {
      int v9 = *(unsigned char *)(a3 + 32) & 0xF;
      if (v9 != 5)
      {
        if (v9 != 2) {
          _xzm_xzone_chunk_free_cold_2(*(unsigned char *)(a3 + 32) & 0xF);
        }
        if ((*(void *)a3 & 0x7FFLL) != 0x7FE)
        {
          *(void *)a3 = *(void *)a3 & 0xFFFFFFFFFFC00000 | 0x7FE;
          xzm_segment_group_segment_madvise_chunk(v6, a3);
        }
      }
    }
    char v10 = *(unsigned char *)(a3 + 32);
    int v11 = v10 & 0xF;
    if (v11 != 2)
    {
      if (v11 != 5) {
        _xzm_segment_group_segment_span_free_coalesce_cold_1(v11);
      }
      *(void *)a3 = *(_DWORD *)a3 | ~(-1 << *(_DWORD *)(a2 + 68));
    }
    *(unsigned char *)(a3 + 32) = v10 & 0xEF;
    if (v11 == 2) {
      *(void *)a3 = *(void *)a3 & 0xFFFFFFFFC03FFFFFLL | 0x20000000;
    }
    int v12 = 0;
    uint64_t v13 = (os_unfair_lock_s *)(*(void *)(v8 + 376) + 16 * *(unsigned __int8 *)(a2 + 72));
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v13[2], (unsigned int *)&v12, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v12) {
      os_unfair_lock_lock_with_options();
    }
    uint64_t v15 = *(void *)&v13->_os_unfair_lock_opaque;
    *(void *)(a3 + 16) = *(void *)&v13->_os_unfair_lock_opaque;
    if (v15) {
      *(void *)(*(void *)&v13->_os_unfair_lock_opaque + 24) = a3 + 16;
    }
    *(void *)&v13->_os_unfair_lock_opaque = a3;
    *(void *)(a3 + 24) = v13;
    int v16 = *(_DWORD *)(StatusReg + 24);
    int v17 = v16;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v13[2], (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
    if (v17 != v16)
    {
      os_unfair_lock_unlock(v13 + 2);
    }
  }
  else
  {
    int v7 = *(unsigned char *)(a3 + 32) & 0xF;
    if (v7 == 5)
    {
      *(_DWORD *)a3 = 0;
    }
    else
    {
      if (v7 != 2) {
        _xzm_segment_group_segment_span_free_coalesce_cold_1(v7);
      }
      *(void *)a3 &= 0xFFFFFFFFFFFFF800;
    }
    *(_DWORD *)(a3 + 4) = 0;
    *(unsigned char *)(a3 + 33) = 0;
    uint64_t v18 = *(void *)(a2 + 40);
    xzm_segment_group_free_chunk(v18, a3, 0);
  }
}

void *nanov2_memalign_type(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 > 0x10) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 184))();
  }
  else {
    return nanov2_malloc_type(a1, a3);
  }
}

uint64_t *mfm_alloc(unint64_t a1)
{
  uint64_t v1 = mfm_arena;
  if (a1 > 0x4000) {
    return 0;
  }
  int v3 = 0;
  unint64_t v4 = a1 >> 4;
  if ((a1 & 0xF) != 0) {
    ++v4;
  }
  if (a1) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 1;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v1, (unsigned int *)&v3, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v3) {
    os_unfair_lock_lock_with_options();
  }
  LODWORD(v7) = 64 - __clz(v5 - 1);
  if (v7 >= 0xA) {
    uint64_t v7 = 10;
  }
  else {
    uint64_t v7 = v7;
  }
  if (v5 < 2) {
    uint64_t v7 = 0;
  }
  uint64_t v8 = v1 + 32;
  uint64_t v9 = 16 * v7;
  while (1)
  {
    int v2 = (uint64_t *)(v1 + 16 * *(void *)(v8 + v9));
    if ((uint64_t *)(v8 + v9) != v2) {
      break;
    }
    v9 += 16;
    if (v9 == 176)
    {
      uint64_t v10 = mfm_arena;
      unint64_t v11 = *(void *)(mfm_arena + 8);
      if (v5 >= 516096 - v11)
      {
        int v2 = 0;
      }
      else
      {
        unint64_t v12 = v11 + v5;
        *(void *)(v1 + 16 * ((v11 + v5) >> 6) + 224) |= 1 << (v11 + v5);
        if (v5 > 0x3F)
        {
          __mfm_block_set_sizes(v1, 1, v11, v5);
          uint64_t v10 = mfm_arena;
          unint64_t v12 = *(void *)(mfm_arena + 8) + v5;
        }
        else
        {
          uint64_t v13 = v1 + 224;
          *(void *)(v13 + ((v11 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(void *)(v1
                                                                                 + 224
                                                                                 + ((v11 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) | (1 << v11);
          *(void *)(v13 + (((v5 + v11 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(void *)(v1
                                                                                            + 224
                                                                                            + (((v5 + v11 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) | (1 << (v5 + v11 - 1));
        }
        *(void *)(v10 + 8) = v12;
        *(_DWORD *)(v1 + 4) += v5;
        ++*(void *)(v1 + 24);
        int v2 = (uint64_t *)(v1 + 16 * v11 + 0x20000);
        if (*(void *)(v10 + 16) < v12) {
          *(void *)(v10 + 16) = v12;
        }
      }
      goto LABEL_32;
    }
  }
  uint64_t v14 = *v2;
  uint64_t v15 = 16 * *(void *)(v8 + v9);
  uint64_t v16 = v2[1];
  *(void *)(v1 + 16 * v14 + 8) = v16;
  *(void *)(v1 + 16 * v16) = v14;
  *int v2 = 0;
  v2[1] = 0;
  unint64_t v17 = v15 - 0x20000;
  unint64_t v18 = (v15 - 0x20000) >> 4;
  unint64_t v19 = (v18 + 1) >> 5;
  uint64_t v20 = v19 & 0x7FFFFFFFFFFFFFELL;
  unint64_t v21 = v1 + 8 * (v19 & 0x7FFFFFFFFFFFFFELL);
  unint64_t v22 = *(void *)(v21 + 224) >> (v18 + 1);
  if (v22)
  {
    unint64_t v23 = __clz(__rbit64(v22));
LABEL_25:
    unint64_t v24 = v23 + 1;
    goto LABEL_26;
  }
  unint64_t v29 = ((_BYTE)v18 + 1) & 0x3F;
  unint64_t v30 = *(void *)(v21 + 240);
  if (!v30)
  {
    unint64_t v31 = *(void *)(v1 + ((8 * v19) | 8) + 224);
    if (v29 < 0x2E) {
      LODWORD(v32) = 0;
    }
    else {
      uint64_t v32 = *(void *)(v1 + 8 * v20 + 248);
    }
    unint64_t v23 = ((v31 >> v29) | ((unint64_t)(2 * v32) << (v29 ^ 0x3Fu))) & 0x7FFFF;
    goto LABEL_25;
  }
  unint64_t v24 = __clz(__rbit64(v30)) - v29 + 65;
LABEL_26:
  if (v24 > v5)
  {
    *(void *)(v1 + 16 * ((v18 + v5) >> 6) + 224) |= 1 << (v18 + v5);
    __mfm_free_block(v1, v18 + v5, v24 - v5);
  }
  if (v5 > 0x3F)
  {
    __mfm_block_set_sizes(v1, 1, v18, v5);
  }
  else
  {
    uint64_t v25 = v1 + 224;
    *(void *)(v25 + ((v18 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(void *)(v1
                                                                           + 224
                                                                           + ((v18 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) | (1 << (v17 >> 4));
    *(void *)(v25 + (((v5 + v18 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(void *)(v1
                                                                                      + 224
                                                                                      + (((v5 + v18 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) | (1 << (v5 + v18 - 1));
  }
  *(_DWORD *)(v1 + 4) += v5;
  ++*(void *)(v1 + 24);
LABEL_32:
  int v26 = *(_DWORD *)(StatusReg + 24);
  int v27 = v26;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v1, (unsigned int *)&v27, 0, memory_order_release, memory_order_relaxed);
  if (v27 != v26) {
    os_unfair_lock_unlock((os_unfair_lock_t)v1);
  }
  return v2;
}

void xzm_malloc_zone_malloc_type_memalign(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int8x8_t a5)
{
}

void _xzm_free_large_huge(uint64_t a1, unint64_t a2)
{
  int v4 = 0;
  unint64_t v5 = (os_unfair_lock_s *)(a1 + 280);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 280), (unsigned int *)&v4, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v4) {
    os_unfair_lock_lock_with_options();
  }
  *(_WORD *)(a2 + 34) = 0;
  uint64_t v7 = *(void *)(a2 + 16);
  if (v7)
  {
    *(void *)(v7 + 24) = *(void *)(a2 + 24);
    uint64_t v7 = *(void *)(a2 + 16);
  }
  **(void **)(a2 + 24) = v7;
  int v8 = *(_DWORD *)(StatusReg + 24);
  int v9 = v8;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v5, (unsigned int *)&v9, 0, memory_order_release, memory_order_relaxed);
  if (v9 != v8) {
    os_unfair_lock_unlock(v5);
  }
  uint64_t v10 = *(void *)(a2 & 0xFFFFFFFFFFFFC000);
  uint64_t v11 = (*(void *)(a1 + 296) >> 7) & 1;

  xzm_segment_group_free_chunk(v10, a2, v11);
}

uint64_t _xzm_xzone_fresh_chunk_init(uint64_t result, uint64_t a2, int a3)
{
  char v3 = *(unsigned char *)(a2 + 32);
  *(unsigned char *)(a2 + 32) = v3 & 0xBF;
  if (a3 != 2)
  {
    if (a3 != 5) {
      _xzm_xzone_fresh_chunk_init_cold_1();
    }
    int v4 = v3 & 0xF;
    if (v4 != 2)
    {
      if (v4 != 5) {
        _xzm_segment_group_segment_span_free_coalesce_cold_1(v4);
      }
      *(void *)a2 = *(_DWORD *)a2 | ~(-1 << *(_DWORD *)(result + 68));
    }
  }
  return result;
}

void _xzm_fork_lock_wait(os_unfair_lock_s *a1)
{
  int v1 = 0;
  int v2 = a1 + 71;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&a1[71], (unsigned int *)&v1, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    os_unfair_lock_lock_with_options();
  }
  int v4 = *(_DWORD *)(StatusReg + 24);
  int v5 = v4;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v2, (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
  if (v5 != v4)
  {
    os_unfair_lock_unlock(v2);
  }
}

uint64_t xzm_segment_group_try_realloc_huge_chunk(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v8 = *(unsigned int *)(a4 + 40);
  if (a5 <= v8)
  {
    if (v8 <= a5) {
      return 1;
    }
    uint64_t v12 = *(unsigned int *)(a3 + 12);
    if (v12 == a5) {
      return 1;
    }
    uint64_t v13 = *(void *)(a3 + 48);
    mach_vm_address_t v14 = v13 + (v12 << 14);
    mach_vm_address_t v15 = v13 + ((unint64_t)a5 << 14);
    if (v15 >= v14) {
      return 1;
    }
    unint64_t v16 = (v15 + 0x3FFFFF) & 0xFFFFFFFFFFC00000;
    unint64_t v17 = *(os_unfair_lock_s **)(*(void *)(a1 + 24) + 400);
    unint64_t v18 = (void *)xzm_metapool_alloc((uint64_t)v17);
    unint64_t v19 = v14 - v16;
    if (v14 > v16)
    {
      unint64_t v20 = *(void *)(a3 + 48) + ((unint64_t)*(unsigned int *)(a3 + 12) << 14);
      if (v20 > v16)
      {
        uint64_t v21 = *(void *)(a1 + 24);
        unint64_t v22 = (v15 + 0x3FFFFF) & 0xFFFFFFFFFFC00000;
        do
        {
          unint64_t v23 = v22 >> 22;
          if (v22 >> 36) {
            unint64_t v23 = 0x4000;
          }
          if (v23 >> 14) {
            unint64_t v24 = 0;
          }
          else {
            unint64_t v24 = (_DWORD *)(*(void *)(v21 + 408) + 4 * v23);
          }
          *unint64_t v24 = 0;
          v22 += 0x400000;
        }
        while (v22 < v20);
      }
    }
    int v25 = 0;
    unint64_t v45 = (unint64_t)a5 << 14;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 488), (unsigned int *)&v25, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v25)
    {
      os_unfair_lock_lock_with_options();
      unint64_t v19 = v14 - v16;
    }
    mach_vm_size_t v27 = v14 - v15;
    if (v14 <= v16
      || v19 <= 0x200000
      || *(unsigned __int16 *)(a1 + 482) >= *(unsigned __int16 *)(a1 + 480))
    {
      int v42 = *(_DWORD *)(StatusReg + 24);
      int v43 = v42;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 488), (unsigned int *)&v43, 0, memory_order_release, memory_order_relaxed);
      if (v43 != v42) {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
      }
      xzm_metapool_free(v17, v18);
      unint64_t v31 = v45;
    }
    else
    {
      unint64_t v28 = v19;
      _xzm_segment_group_init_segment(a1, (unint64_t)v18, (v15 + 0x3FFFFF) & 0xFFFFFFFFFFC00000, v19, 1, 0);
      _xzm_segment_group_cache_mark_free(a1, v18);
      int v29 = *(_DWORD *)(StatusReg + 24);
      int v30 = v29;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 488), (unsigned int *)&v30, 0, memory_order_release, memory_order_relaxed);
      if (v30 != v29) {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
      }
      unint64_t v31 = v45;
      if (v15 >= v16) {
        goto LABEL_49;
      }
      v27 -= v28;
    }
    mvm_deallocate_plat(v15, v27, 0);
LABEL_49:
    uint64_t v32 = 1;
    _xzm_segment_group_init_segment(a1, a3, *(void *)(a3 + 48), v31, 1, 0);
    return v32;
  }
  int v10 = *(unsigned char *)(a4 + 32) & 0xF;
  if ((v10 - 6) < 2)
  {
    uint64_t v11 = v8 << 14;
  }
  else if (v10 == 2)
  {
    uint64_t v11 = 0x4000;
  }
  else
  {
    if (v10 != 5) {
      xzm_chunk_mark_free_cold_1(v10);
    }
    uint64_t v11 = 0x10000;
  }
  unint64_t v33 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)(a4 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
      + *(void *)((a4 & 0xFFFFFFFFFFFFC000) + 0x30);
  mach_vm_address_t v34 = v33 + v11;
  uint64_t v35 = a5 - v8;
  unint64_t v36 = (v33 + v11 + 0x3FFFFF) & 0xFFFFFFFFFFC00000;
  unint64_t v37 = v33 + v11 + (v35 << 14);
  if (v36 < v37)
  {
    unint64_t v38 = v36;
    do
    {
      unint64_t v39 = v38 >> 22;
      if (v38 >> 36) {
        unint64_t v39 = 0x4000;
      }
      if (!(v39 >> 14))
      {
        uint64_t v40 = *(void *)(*(void *)(a1 + 24) + 408);
        if (v40)
        {
          if (*(_DWORD *)(v40 + 4 * v39)) {
            return 0;
          }
        }
      }
      v38 += 0x400000;
    }
    while (v38 < v37);
  }
  if (!mvm_allocate_plat(v34, (unint64_t)v35 << 14, 0, 0, 0, 6)) {
    return 0;
  }
  uint64_t v32 = 1;
  _xzm_segment_group_init_segment(a1, a3, *(void *)(a3 + 48), (unint64_t)a5 << 14, 1, 0);
  if (v33 + ((unint64_t)a5 << 14) > v36)
  {
    if (*(void *)(a2 + 232)) {
      uint64_t v41 = *(void *)(a2 + 232);
    }
    else {
      uint64_t v41 = a2;
    }
    _xzm_segment_table_allocated_at(v41, v36, a3);
  }
  return v32;
}

void _xzm_walk_lock_wait(os_unfair_lock_s *a1)
{
  int v1 = 0;
  int v2 = a1 + 70;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&a1[70], (unsigned int *)&v1, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    os_unfair_lock_lock_with_options();
  }
  int v4 = *(_DWORD *)(StatusReg + 24);
  int v5 = v4;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v2, (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
  if (v5 != v4) {
    os_unfair_lock_unlock(v2);
  }
}

void xzm_malloc_zone_free_definite_size(uint64_t a1, unint64_t a2)
{
}

void xzm_malloc_zone_free_definite_size_slow(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!a2) {
    return;
  }
  if (a2 >> 36) {
    unint64_t v6 = 0x4000;
  }
  else {
    unint64_t v6 = a2 >> 22;
  }
  if (v6 >> 14) {
    goto LABEL_14;
  }
  uint64_t v7 = *(void *)(a1 + 232);
  if (!v7) {
    uint64_t v7 = a1;
  }
  uint64_t v8 = *(void *)(v7 + 408);
  if (!v8) {
    goto LABEL_14;
  }
  uint64_t v9 = *(unsigned int *)(v8 + 4 * v6);
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = v9 << 14;
  unint64_t v11 = a2 - *(void *)(v10 + 48);
  if (*(_DWORD *)(v10 + 16) <= (v11 >> 14)) {
    goto LABEL_14;
  }
  unsigned int v12 = v11 >> 14;
  unint64_t v13 = v10 + 48 * v12 + 2104;
  if ((*(unsigned char *)(v10 + 48 * v12 + 2136) & 0xF) == 4)
  {
    unint64_t v33 = v13 - *(unsigned int *)(v10 + 48 * v12 + 2140);
    unsigned int v34 = *(unsigned char *)(v33 + 32) & 0xF;
    if (v34 <= 8)
    {
      int v35 = 1 << v34;
      if ((v35 & 0x1E8) != 0)
      {
        if (v33 + 48 * *(unsigned int *)(v33 + 40) <= v13) {
          goto LABEL_12;
        }
        goto LABEL_84;
      }
      if ((v35 & 6) != 0 && v13 == v33) {
LABEL_84:
      }
        unint64_t v13 = v33;
    }
  }
LABEL_12:
  unsigned int v14 = *(unsigned char *)(v13 + 32) & 0xF;
  if (v14 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v14);
  }
  if (((1 << v14) & 0x1B) != 0 || *(unsigned __int16 *)(v13 + 34) != *(unsigned __int16 *)(a1 + 208)) {
    goto LABEL_14;
  }
  unint64_t v26 = a2
      - (((0xAAAAAAAAAAAAC000 * (((v13 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(void *)((v13 & 0xFFFFFFFFFFFFC000) + 0x30));
  if (v14 == 5 || v14 == 2)
  {
    uint64_t v28 = *(void *)(a1 + 216) + 88 * *(unsigned __int8 *)(v13 + 33);
    if ((*(_DWORD *)(v28 + 64) * v26) >= *(_DWORD *)(v28 + 64)) {
      goto LABEL_14;
    }
    unint64_t v15 = *(void *)(v28 + 48);
  }
  else
  {
    unint64_t v15 = (unint64_t)*(unsigned int *)(v13 + 40) << 14;
    if (v26 % v15) {
      goto LABEL_14;
    }
  }
  if (v14 == 5)
  {
    if (((*(_DWORD *)v13 >> (v26 / v15)) & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v14 == 2
    && *(void *)a2 == (*(void *)(a1 + 272) ^ a2)
    && _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v13, a2))
  {
LABEL_14:
    unint64_t v15 = _xzm_ptr_size_outlined(a1, a2);
  }
LABEL_15:
  if (v15 || (*(unsigned char *)(a1 + 296) & 0x80) == 0)
  {
    uint64_t v16 = 0;
    goto LABEL_18;
  }
  if (*(void *)(a1 + 232)) {
    uint64_t v16 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v16 = a1;
  }
  if (v6 >> 14) {
    goto LABEL_40;
  }
  uint64_t v18 = *(void *)(v16 + 232);
  if (!v18) {
    uint64_t v18 = v16;
  }
  uint64_t v19 = *(void *)(v18 + 408);
  if (!v19) {
    goto LABEL_40;
  }
  uint64_t v20 = *(unsigned int *)(v19 + 4 * v6);
  if (!v20) {
    goto LABEL_40;
  }
  uint64_t v21 = v20 << 14;
  unint64_t v22 = a2 - *(void *)(v21 + 48);
  if (*(_DWORD *)(v21 + 16) <= (v22 >> 14)) {
    goto LABEL_40;
  }
  unsigned int v23 = v22 >> 14;
  unint64_t v24 = v21 + 48 * v23 + 2104;
  if ((*(unsigned char *)(v21 + 48 * v23 + 2136) & 0xF) == 4)
  {
    unint64_t v37 = v24 - *(unsigned int *)(v21 + 48 * v23 + 2140);
    unsigned int v38 = *(unsigned char *)(v37 + 32) & 0xF;
    if (v38 <= 8)
    {
      int v39 = 1 << v38;
      if ((v39 & 0x1E8) != 0)
      {
        if (v37 + 48 * *(unsigned int *)(v37 + 40) <= v24) {
          goto LABEL_38;
        }
        goto LABEL_94;
      }
      if ((v39 & 6) != 0 && v24 == v37) {
LABEL_94:
      }
        unint64_t v24 = v37;
    }
  }
LABEL_38:
  unsigned int v25 = *(unsigned char *)(v24 + 32) & 0xF;
  if (v25 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v25);
  }
  if (((1 << v25) & 0x1B) != 0 || *(unsigned __int16 *)(v24 + 34) != *(unsigned __int16 *)(v16 + 208)) {
    goto LABEL_40;
  }
  unint64_t v29 = a2
      - (((0xAAAAAAAAAAAAC000 * (((v24 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(void *)((v24 & 0xFFFFFFFFFFFFC000) + 0x30));
  if (v25 == 5 || v25 == 2)
  {
    uint64_t v31 = *(void *)(v16 + 216) + 88 * *(unsigned __int8 *)(v24 + 33);
    if ((*(_DWORD *)(v31 + 64) * v29) >= *(_DWORD *)(v31 + 64)) {
      goto LABEL_40;
    }
    unint64_t v32 = *(void *)(v31 + 48);
  }
  else
  {
    unint64_t v32 = (unint64_t)*(unsigned int *)(v24 + 40) << 14;
    if (v29 % v32) {
      goto LABEL_40;
    }
  }
  if (v25 != 5)
  {
    if (v25 != 2
      || *(void *)a2 != (*(void *)(v16 + 272) ^ a2)
      || !_xzm_xzone_tiny_chunk_block_is_free_slow(v16, v24, a2))
    {
      goto LABEL_18;
    }
    goto LABEL_40;
  }
  if ((*(_DWORD *)v24 >> (v29 / v32))) {
LABEL_40:
  }
    _xzm_ptr_size_outlined(v16, a2);
LABEL_18:
  if (a3 >= 0x401 && (*(void *)(a1 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  if (v16) {
    uint64_t v17 = v16;
  }
  else {
    uint64_t v17 = a1;
  }

  _xzm_free(v17, a2, 0);
}

BOOL nanov2_claimed_address(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = 1;
  if (!nanov2_pointer_size(a1, a2, 1)) {
    return malloc_zone_claimed_address(*(void *)(a1 + 28704), a2) != 0;
  }
  return v4;
}

uint64_t malloc_zone_claimed_address(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  if (malloc_check_start) {
    internal_check();
  }
  if (*(_DWORD *)(a1 + 104) < 0xAu) {
    return 1;
  }
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 136);
  if (!v4) {
    return 1;
  }

  return v4(a1, a2);
}

BOOL xzm_malloc_zone_claimed_address(uint64_t a1, unint64_t a2)
{
  if (mfm_claimed_address(a2)) {
    return 1;
  }
  unint64_t v5 = a2 >> 22;
  if (a2 >> 36) {
    unint64_t v5 = 0x4000;
  }
  if (v5 >> 14) {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 232);
  if (!v6) {
    uint64_t v6 = a1;
  }
  uint64_t v7 = *(void *)(v6 + 408);
  return v7 && *(_DWORD *)(v7 + 4 * v5) != 0;
}

int malloc_make_nonpurgeable(void *ptr)
{
  registered_purgeable_zone = find_registered_purgeable_zone((uint64_t)ptr);
  if (registered_purgeable_zone)
  {
    int v4 = 0;
    MEMORY[0x1996FA0C0](*MEMORY[0x1E4F14C48], ptr, 0, &v4);
    if (v4 == 2) {
      LODWORD(registered_purgeable_zone) = 14;
    }
    else {
      LODWORD(registered_purgeable_zone) = 0;
    }
  }
  return (int)registered_purgeable_zone;
}

void malloc_make_purgeable(void *ptr)
{
  if (find_registered_purgeable_zone((uint64_t)ptr))
  {
    int v2 = 1;
    MEMORY[0x1996FA0C0](*MEMORY[0x1E4F14C48], ptr, 0, &v2);
  }
}

uint64_t (**find_registered_purgeable_zone(uint64_t a1))(void *, void)
{
  int32x2_t result = 0;
  if (!a1 || !malloc_num_zones) {
    return result;
  }
  if (lite_zone)
  {
    unint64_t v3 = (*(uint64_t (**)(void))(lite_zone + 16))();
    if (v3) {
      goto LABEL_5;
    }
  }
  if (initial_num_zones)
  {
    uint64_t v5 = 0;
    while (1)
    {
      int v4 = (uint64_t (**)(void *, void))*((void *)malloc_zones + v5);
      unint64_t v3 = v4[2](v4, a1);
      if (v3) {
        break;
      }
      if (++v5 >= (unint64_t)initial_num_zones) {
        goto LABEL_11;
      }
    }
    if (!v5 && (has_injected_zone0 & 1) == 0)
    {
LABEL_5:
      int v4 = (uint64_t (**)(void *, void))default_zone;
      if (!default_zone) {
        return 0;
      }
    }
  }
  else
  {
LABEL_11:
    uint64_t v6 = (atomic_uint *)pFRZCounterLive;
    atomic_fetch_add((atomic_uint *volatile)pFRZCounterLive, 1u);
    uint64_t v7 = malloc_num_zones;
    uint64_t v8 = initial_num_zones;
    if (initial_num_zones >= malloc_num_zones)
    {
LABEL_14:
      int v4 = 0;
      unint64_t v3 = 0;
    }
    else
    {
      while (1)
      {
        int v4 = (uint64_t (**)(void *, void))*((void *)malloc_zones + v8);
        unint64_t v3 = v4[2](v4, a1);
        if (v3) {
          break;
        }
        if (v7 == ++v8) {
          goto LABEL_14;
        }
      }
    }
    atomic_fetch_add(v6, 0xFFFFFFFF);
    if (!v4) {
      return 0;
    }
  }
  if (v3 < *MEMORY[0x1E4F14C80]) {
    return 0;
  }
  if (v3 % *MEMORY[0x1E4F14C80]) {
    return 0;
  }
  else {
    return v4;
  }
}

malloc_zone_t *__cdecl malloc_zone_from_ptr(const void *ptr)
{
  uint64_t v1 = 0;
  if (ptr && malloc_num_zones)
  {
    if (lite_zone && (*(uint64_t (**)(void))(lite_zone + 16))())
    {
      return (malloc_zone_t *)default_zone;
    }
    else if (initial_num_zones)
    {
      uint64_t v3 = 0;
      while (1)
      {
        uint64_t v1 = *((void *)malloc_zones + v3);
        if ((*(uint64_t (**)(uint64_t, const void *))(v1 + 16))(v1, ptr)) {
          break;
        }
        if (++v3 >= (unint64_t)initial_num_zones) {
          goto LABEL_10;
        }
      }
      if (!v3 && !has_injected_zone0) {
        return (malloc_zone_t *)default_zone;
      }
    }
    else
    {
LABEL_10:
      int v4 = (atomic_uint *)pFRZCounterLive;
      atomic_fetch_add((atomic_uint *volatile)pFRZCounterLive, 1u);
      uint64_t v5 = malloc_num_zones;
      uint64_t v6 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_13:
        uint64_t v1 = 0;
      }
      else
      {
        while (1)
        {
          uint64_t v1 = *((void *)malloc_zones + v6);
          if ((*(uint64_t (**)(uint64_t, const void *))(v1 + 16))(v1, ptr)) {
            break;
          }
          if (v5 == ++v6) {
            goto LABEL_13;
          }
        }
      }
      atomic_fetch_add(v4, 0xFFFFFFFF);
    }
  }
  return (malloc_zone_t *)v1;
}

void find_zone_and_free(void *a1, unsigned int a2)
{
  if (!a1) {
    return;
  }
  if (!malloc_num_zones) {
    goto LABEL_34;
  }
  if (lite_zone && (uint64_t v4 = (*(uint64_t (**)(void))(lite_zone + 16))()) != 0)
  {
    uint64_t v5 = v4;
  }
  else
  {
    if (initial_num_zones <= a2)
    {
LABEL_12:
      uint64_t v9 = (atomic_uint *)pFRZCounterLive;
      atomic_fetch_add((atomic_uint *volatile)pFRZCounterLive, 1u);
      uint64_t v10 = malloc_num_zones;
      uint64_t v11 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_15:
        uint64_t v6 = 0;
        uint64_t v5 = 0;
      }
      else
      {
        while (1)
        {
          uint64_t v6 = (uint64_t (**)(void *, void *))*((void *)malloc_zones + v11);
          uint64_t v12 = v6[2](v6, a1);
          if (v12) {
            break;
          }
          if (v10 == ++v11) {
            goto LABEL_15;
          }
        }
        uint64_t v5 = v12;
      }
      atomic_fetch_add(v9, 0xFFFFFFFF);
      if (!v6) {
        goto LABEL_34;
      }
      goto LABEL_21;
    }
    uint64_t v7 = a2;
    while (1)
    {
      uint64_t v6 = (uint64_t (**)(void *, void *))*((void *)malloc_zones + v7);
      uint64_t v8 = v6[2](v6, a1);
      if (v8) {
        break;
      }
      if (++v7 >= (unint64_t)initial_num_zones) {
        goto LABEL_12;
      }
    }
    uint64_t v5 = v8;
    if (v7 || (has_injected_zone0 & 1) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v6 = (uint64_t (**)(void *, void *))default_zone;
  if (!default_zone)
  {
LABEL_34:
    if ((malloc_debug_flags & 0x140) != 0) {
      unsigned int v14 = 80;
    }
    else {
      unsigned int v14 = 144;
    }
    malloc_report(v14, (uint64_t)"*** error for object %p: pointer being freed was not allocated\n");
    return;
  }
LABEL_21:
  if (*((_DWORD *)v6 + 26) >= 6u && v6[15])
  {
    if (malloc_tracing_enabled) {
      kdebug_trace();
    }
    if (malloc_logger) {
      malloc_logger(12, v6, a1, 0, 0, 0);
    }
    if (malloc_simple_stack_logging == 1) {
      malloc_report(0x325u, (uint64_t)"free (%p/%llu): ");
    }
    if (malloc_check_start) {
      internal_check();
    }
    unint64_t v13 = v6[15];
    ((void (*)(uint64_t (**)(void *, void *), void *, uint64_t))v13)(v6, a1, v5);
  }
  else
  {
    malloc_zone_free((malloc_zone_t *)v6, a1);
  }
}

uint64_t _xzm_ptr_size_outlined(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 232) || !mfm_claimed_address(a2)) {
    return 0;
  }

  return mfm_alloc_size(a2);
}

void _xzm_free_outlined(uint64_t a1, void *a2, char a3)
{
  if (*(void *)(a1 + 232) || !mfm_claimed_address((unint64_t)a2))
  {
    if (a3)
    {
      find_zone_and_free(a2, 1u);
    }
    else
    {
      qword_1E93090B0 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: pointer being freed was not allocated";
      qword_1E93090E0 = (uint64_t)a2;
      __break(1u);
    }
  }
  else
  {
    mfm_free(a2);
  }
}

BOOL mfm_claimed_address(unint64_t a1)
{
  if (mfm_arena) {
    BOOL v1 = mfm_arena + 0x20000 > a1;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1 && mfm_arena + 0x800000 > a1;
}

uint64_t pgm_size(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 248) <= a2 && *(void *)(a1 + 256) > a2)
  {
    int v6 = 0;
    uint64_t v7 = (os_unfair_lock_s *)(a1 + 16680);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 16680), (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v6) {
      os_unfair_lock_lock_with_options();
    }
    unint64_t v9 = lookup_slot(a1, a2);
    if ((v9 & 0x8000000000000000) != 0) {
      uint64_t v10 = *(unsigned __int16 *)(*(void *)(a1 + 280) + 8 * v9 + 4);
    }
    else {
      uint64_t v10 = 0;
    }
    int v11 = *(_DWORD *)(StatusReg + 24);
    int v12 = v11;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v7, (unsigned int *)&v12, 0, memory_order_release, memory_order_relaxed);
    if (v12 != v11) {
      os_unfair_lock_unlock(v7);
    }
    return v10;
  }
  else
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 16);
    return v4();
  }
}

size_t malloc_size(const void *ptr)
{
  size_t result = 0;
  if (ptr)
  {
    if (malloc_num_zones)
    {
      if (!lite_zone || (size_t result = (*(uint64_t (**)(void))(lite_zone + 16))()) == 0)
      {
        if (initial_num_zones)
        {
          uint64_t v3 = 0;
          while (1)
          {
            size_t result = (*(uint64_t (**)(void))(*((void *)malloc_zones + v3) + 16))();
            if (result) {
              break;
            }
            if (++v3 >= (unint64_t)initial_num_zones) {
              goto LABEL_9;
            }
          }
        }
        else
        {
LABEL_9:
          uint64_t v4 = (atomic_uint *)pFRZCounterLive;
          atomic_fetch_add((atomic_uint *volatile)pFRZCounterLive, 1u);
          uint64_t v5 = malloc_num_zones;
          uint64_t v6 = initial_num_zones;
          if (initial_num_zones >= malloc_num_zones)
          {
LABEL_12:
            size_t result = 0;
          }
          else
          {
            while (1)
            {
              size_t result = (*(uint64_t (**)(void))(*((void *)malloc_zones + v6) + 16))();
              if (result) {
                break;
              }
              if (v5 == ++v6) {
                goto LABEL_12;
              }
            }
          }
          atomic_fetch_add(v4, 0xFFFFFFFF);
        }
      }
    }
  }
  return result;
}

uint64_t nanov2_size(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0xFFFFFFFFE000000FLL) != 0x300000000) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16))();
  }
  if (*(void *)(a1 + 28720) > a2 || *(void *)(a1 + 28728) < a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16))();
  }
  uint64_t v3 = ptr_offset_to_size_class[((a2 >> 14) & 0xFFF ^ *(_DWORD *)(a1 + 28680)) >> 6];
  unsigned int v4 = *(_DWORD *)((*(void *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                 + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) & 0x7FF;
  if (v4 > 0x7FD)
  {
    if (v4 - 2046 < 2) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16))();
    }
    goto LABEL_13;
  }
  if (!v4 || v4 == 2042) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16))();
  }
  if (v4 != 2044)
  {
LABEL_13:
    if (((*(_DWORD *)((*(void *)(a1 + 28688) ^ a2 & 0xFFFFFFFFFC000000)
                     + 4 * ((a2 >> 8) & 0xFC0 | (a2 >> 20) & 0x3F)) >> 11) & 0x3FF) == slots_by_size_class[v3] - 1)
      return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16))();
  }
  unint64_t v5 = 16 * (int)v3 + 16;
  if ((a2 & 0x3FFF) == (a2 & 0x3FFF) / v5 * v5 && v5 && (*(void *)(a1 + 28696) ^ *(void *)a2) != a2) {
    return v5;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 16))();
}

uint64_t xzm_malloc_zone_size(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2;
  unint64_t v3 = a2 >> 22;
  if (a2 >> 36) {
    unint64_t v3 = 0x4000;
  }
  if (v3 >> 14) {
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)(a1 + 232);
  if (!v4) {
    uint64_t v4 = a1;
  }
  uint64_t v5 = *(void *)(v4 + 408);
  if (!v5) {
    goto LABEL_12;
  }
  uint64_t v6 = *(unsigned int *)(v5 + 4 * v3);
  if (!v6) {
    goto LABEL_12;
  }
  uint64_t v7 = v6 << 14;
  unint64_t v8 = a2 - *(void *)(v7 + 48);
  if (*(_DWORD *)(v7 + 16) <= (v8 >> 14)) {
    goto LABEL_12;
  }
  unsigned int v9 = v8 >> 14;
  unint64_t v10 = v7 + 48 * v9 + 2104;
  if ((*(unsigned char *)(v7 + 48 * v9 + 2136) & 0xF) == 4)
  {
    unint64_t v19 = v10 - *(unsigned int *)(v7 + 48 * v9 + 2140);
    unsigned int v20 = *(unsigned char *)(v19 + 32) & 0xF;
    if (v20 <= 8)
    {
      int v21 = 1 << v20;
      if ((v21 & 0x1E8) != 0)
      {
        if (v19 + 48 * *(unsigned int *)(v19 + 40) <= v10) {
          goto LABEL_10;
        }
        goto LABEL_41;
      }
      if ((v21 & 6) != 0 && v10 == v19) {
LABEL_41:
      }
        unint64_t v10 = v19;
    }
  }
LABEL_10:
  unsigned int v11 = *(unsigned char *)(v10 + 32) & 0xF;
  if (v11 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(*(unsigned char *)(v10 + 32) & 0xF);
  }
  if (((1 << v11) & 0x1B) != 0 || *(unsigned __int16 *)(v10 + 34) != *(unsigned __int16 *)(a1 + 208)) {
    goto LABEL_12;
  }
  unint64_t v13 = v2
      - *(void *)((v10 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v10 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v11 == 5 || v11 == 2)
  {
    uint64_t v15 = *(void *)(a1 + 216) + 88 * *(unsigned __int8 *)(v10 + 33);
    if ((*(_DWORD *)(v15 + 64) * v13) >= *(_DWORD *)(v15 + 64)) {
      goto LABEL_12;
    }
    unint64_t v16 = *(void *)(v15 + 48);
  }
  else
  {
    unint64_t v16 = (unint64_t)*(unsigned int *)(v10 + 40) << 14;
    if (v13 % v16) {
      goto LABEL_12;
    }
  }
  if (v11 == 5)
  {
    if ((*(_DWORD *)v10 >> (v13 / v16))) {
      goto LABEL_12;
    }
    return v16;
  }
  if (v11 != 2) {
    return v16;
  }
  if (*(void *)v2 != (*(void *)(a1 + 272) ^ v2)) {
    return v16;
  }
  uint64_t v25 = a1;
  unint64_t v23 = v16;
  unint64_t v24 = v2;
  int is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v10, v2);
  unint64_t v16 = v23;
  unint64_t v2 = v24;
  int v18 = is_free_slow;
  a1 = v25;
  if (!v18) {
    return v16;
  }
LABEL_12:

  return _xzm_ptr_size_outlined(a1, v2);
}

unsigned int malloc_zone_batch_malloc(malloc_zone_t *zone, size_t size, void **results, unsigned int num_requested)
{
  batch_malloc = zone->batch_malloc;
  if (!batch_malloc) {
    return 0;
  }
  uint64_t v5 = *(void *)&num_requested;
  uint64_t v6 = results;
  if (malloc_check_start)
  {
    internal_check();
    unsigned int result = ((uint64_t (*)(malloc_zone_t *, size_t, void **, uint64_t))zone->batch_malloc)(zone, size, v6, v5);
  }
  else
  {
    unsigned int result = ((uint64_t (*)(malloc_zone_t *, size_t, void **, void))batch_malloc)(zone, size, results, *(void *)&num_requested);
  }
  if (malloc_logger && result)
  {
    unsigned int v12 = result;
    uint64_t v10 = result;
    do
    {
      uint64_t v11 = (uint64_t)*v6++;
      malloc_logger(10, zone, size, 0, v11, 0);
      --v10;
    }
    while (v10);
    return v12;
  }
  return result;
}

uint64_t default_zone_batch_malloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 80))();
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = malloc_slowpath == 0;
  }
  if (!v6 || malloc_absolute_max_size < size)
  {
    return (void *)_malloc_type_realloc_outlined(ptr, size, type_id);
  }
  if (!ptr || !size)
  {
    uint64_t v10 = *(void *)malloc_zones;
    unsigned int v11 = *(_DWORD *)(*(void *)malloc_zones + 104);
    if (v11 < 0x10)
    {
      if (v11 > 0xC) {
        uint64_t v9 = (*(uint64_t (**)(uint64_t, size_t))(v10 + 24))(v10, size);
      }
      else {
        uint64_t v9 = _malloc_type_malloc_outlined(size, type_id, 0);
      }
    }
    else
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, size_t, malloc_type_id_t))(v10 + 160))(v10, size, type_id);
    }
LABEL_25:
    unint64_t v13 = (void *)v9;
    if (v9)
    {
      if (!size) {
        _free(ptr);
      }
    }
    else
    {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    }
    return v13;
  }
  registered_zone = (uint64_t (**)(void *, void *, size_t))find_registered_zone((uint64_t)ptr, 0, 0);
  if (registered_zone)
  {
    if (registered_zone == (uint64_t (**)(void *, void *, size_t))default_zone) {
      registered_zone = *(uint64_t (***)(void *, void *, size_t))malloc_zones;
    }
    if (*((_DWORD *)registered_zone + 26) < 0x10u) {
      uint64_t v9 = registered_zone[7](registered_zone, ptr, size);
    }
    else {
      uint64_t v9 = ((uint64_t (*)(uint64_t (**)(void *, void *, size_t), void *, size_t, malloc_type_id_t))registered_zone[22])(registered_zone, ptr, size, type_id);
    }
    goto LABEL_25;
  }

  return (void *)_realloc(ptr, size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  uint64_t v4 = j__realloc(__ptr, __size);
  uint64_t v5 = v4;
  if (__size && __ptr && !v4)
  {
    int v6 = *__error();
    j__free(__ptr);
    *__error() = v6;
  }
  return v5;
}

void xzm_malloc_zone_malloc_type_malloc(uint64_t a1, unint64_t a2, unint64_t a3, int8x8_t a4)
{
  if (a2 <= 0x8000)
  {
    if (*(void *)(a1 + 232)) {
      uint64_t v4 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v4 = a1;
    }
    unint64_t v5 = __clz(a2 - 1);
    unint64_t v6 = (((a2 - 1) >> (61 - v5)) & 3) - 4 * v5 + 488;
    if (a2 <= 0x80) {
      unint64_t v6 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    }
    if (!a2) {
      LOBYTE(v6) = 0;
    }
    uint64_t v7 = v6;
    char v8 = *(unsigned char *)(*(void *)(v4 + 368) + v6);
    if (HIWORD(a3) == 256)
    {
      char v9 = 0;
    }
    else if ((a3 & 0xC0000000000) == 0x40000000000)
    {
      char v9 = 1;
    }
    else
    {
      if (a3) {
        unsigned int v10 = a3;
      }
      else {
        unsigned int v10 = dword_1EB1C96FC;
      }
      LOBYTE(v11) = 0;
      switch(*(unsigned char *)(*(void *)(v4 + 360) + v7))
      {
        case 4:
          LODWORD(v11) = (*(_DWORD *)(v4 + 316) + *(_DWORD *)(v4 + 312) * v10) >> 31;
          break;
        case 5:
          unint64_t v12 = (*(void *)(v4 + 320) + *(void *)(v4 + 312) * (unint64_t)v10) >> 34;
          LODWORD(v11) = v12 - 3 * ((1431655766 * (unint64_t)v12) >> 32);
          break;
        case 6:
          unint64_t v11 = ((*(void *)(v4 + 320) + *(void *)(v4 + 312) * (unint64_t)v10) >> 32) & 3;
          break;
        default:
          break;
      }
      char v9 = v11 + 2;
    }
    _xzm_xzone_malloc(a1, a2, (v9 + v8), 0, a4);
  }
  else
  {
    _xzm_malloc_large_huge(a1, a2, 0, a3, 0);
  }
}

uint64_t _malloc_zone_malloc(uint64_t a1, unint64_t a2, char a3)
{
  if (default_zone == (_UNKNOWN *)a1 && lite_zone == 0) {
    a1 = *(void *)malloc_zones;
  }
  if (malloc_slowpath) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_logger == 0;
  }
  if (!v4) {
    return _malloc_zone_malloc_instrumented_or_legacy(a1, a2, a3);
  }
  unsigned int v5 = *(_DWORD *)(a1 + 104);
  if (v5 <= 0xC) {
    return _malloc_zone_malloc_instrumented_or_legacy(a1, a2, a3);
  }
  if (malloc_absolute_max_size < a2)
  {
    if (a3) {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    }
    return 0;
  }
  else if (v5 < 0x10)
  {
    return (*(uint64_t (**)(void))(a1 + 24))();
  }
  else
  {
    return (*(uint64_t (**)(void))(a1 + 160))();
  }
}

uint64_t _realloc(void *a1, unint64_t a2)
{
  if (a1)
  {
    if (!a2)
    {
      uint64_t v8 = _malloc_zone_malloc((uint64_t)default_zone, 0, 0);
      if (!v8)
      {
LABEL_29:
        uint64_t v9 = 0;
        **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
        return v9;
      }
      uint64_t v9 = v8;
      _free(a1);
      return v9;
    }
    if (!malloc_num_zones)
    {
LABEL_22:
      if ((malloc_debug_flags & 0x140) != 0) {
        unsigned int v14 = 80;
      }
      else {
        unsigned int v14 = 144;
      }
      malloc_report(v14, (uint64_t)"*** error for object %p: pointer being realloc'd was not allocated\n");
      goto LABEL_29;
    }
    if (!lite_zone || !(*(uint64_t (**)(void))(lite_zone + 16))())
    {
      if (!initial_num_zones)
      {
LABEL_17:
        unint64_t v11 = (atomic_uint *)pFRZCounterLive;
        atomic_fetch_add((atomic_uint *volatile)pFRZCounterLive, 1u);
        uint64_t v12 = malloc_num_zones;
        uint64_t v13 = initial_num_zones;
        if (initial_num_zones >= malloc_num_zones)
        {
LABEL_20:
          unsigned int v5 = 0;
        }
        else
        {
          while (1)
          {
            unsigned int v5 = (uint64_t (**)(void *, void *))*((void *)malloc_zones + v13);
            if (v5[2](v5, a1)) {
              break;
            }
            if (v12 == ++v13) {
              goto LABEL_20;
            }
          }
        }
        atomic_fetch_add(v11, 0xFFFFFFFF);
        if (!v5) {
          goto LABEL_22;
        }
        goto LABEL_28;
      }
      uint64_t v10 = 0;
      while (1)
      {
        unsigned int v5 = (uint64_t (**)(void *, void *))*((void *)malloc_zones + v10);
        if (v5[2](v5, a1)) {
          break;
        }
        if (++v10 >= (unint64_t)initial_num_zones) {
          goto LABEL_17;
        }
      }
      if (v10 || (has_injected_zone0 & 1) != 0) {
        goto LABEL_28;
      }
    }
    unsigned int v5 = (uint64_t (**)(void *, void *))default_zone;
    if (!default_zone) {
      goto LABEL_22;
    }
LABEL_28:
    uint64_t v9 = _malloc_zone_realloc((uint64_t)v5, (uint64_t)a1, a2, (v2 >> 2));
    if (!v9) {
      goto LABEL_29;
    }
    return v9;
  }
  unint64_t v6 = default_zone;

  return _malloc_zone_malloc((uint64_t)v6, a2, 1);
}

uint64_t _malloc_zone_realloc(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v8 = *(void *)(StatusReg + 904);
  uint64_t v9 = v8;
  if (!v8)
  {
    *(void *)(StatusReg + 904) = a4;
    uint64_t v9 = a4;
  }
  int v10 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_check_start) {
    internal_check();
  }
  if (malloc_absolute_max_size < a3)
  {
    uint64_t v11 = 0;
    if (!v8) {
      goto LABEL_15;
    }
    return v11;
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 56))(a1, a2, a3, a4, v9);
  if (malloc_logger) {
    malloc_logger(14, a1, a2, a3, v11, 0);
  }
  if (malloc_simple_stack_logging != 1)
  {
    if (!v10) {
      goto LABEL_14;
    }
LABEL_18:
    kdebug_trace();
    if (v8) {
      return v11;
    }
    goto LABEL_15;
  }
  malloc_report(0x325u, (uint64_t)"realloc (%p->%p/%llu): ");
  if (v10) {
    goto LABEL_18;
  }
LABEL_14:
  if (!v8) {
LABEL_15:
  }
    *(void *)(StatusReg + 904) = 0;
  return v11;
}

uint64_t default_zone_realloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 56))();
}

void xzm_malloc_zone_realloc(uint64_t a1, unint64_t a2, unint64_t a3, int8x8_t a4)
{
}

void *find_registered_zone(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  if (malloc_num_zones)
  {
    if (lite_zone && (uint64_t v6 = (*(uint64_t (**)(void))(lite_zone + 16))()) != 0)
    {
      if (a2) {
        *a2 = v6;
      }
      return default_zone;
    }
    else if (initial_num_zones <= a3)
    {
LABEL_11:
      int v10 = (atomic_uint *)pFRZCounterLive;
      atomic_fetch_add((atomic_uint *volatile)pFRZCounterLive, 1u);
      uint64_t v11 = malloc_num_zones;
      uint64_t v12 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_14:
        uint64_t v7 = 0;
        uint64_t v13 = 0;
      }
      else
      {
        while (1)
        {
          uint64_t v7 = *((void *)malloc_zones + v12);
          uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a1);
          if (v13) {
            break;
          }
          if (v11 == ++v12) {
            goto LABEL_14;
          }
        }
      }
      if (a2) {
        *a2 = v13;
      }
      atomic_fetch_add(v10, 0xFFFFFFFF);
    }
    else
    {
      uint64_t v8 = a3;
      while (1)
      {
        uint64_t v7 = *((void *)malloc_zones + v8);
        uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v7, a1);
        if (v9) {
          break;
        }
        if (++v8 >= (unint64_t)initial_num_zones) {
          goto LABEL_11;
        }
      }
      if (a2) {
        *a2 = v9;
      }
      if (!v8 && !has_injected_zone0) {
        return default_zone;
      }
    }
  }
  else
  {
    uint64_t v7 = 0;
    if (a2) {
      *a2 = 0;
    }
  }
  return (void *)v7;
}

uint64_t mfm_alloc_size(unint64_t a1)
{
  unint64_t v1 = mfm_arena + 0x20000;
  if (mfm_arena) {
    BOOL v2 = v1 > a1;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2) {
    return 0;
  }
  uint64_t v3 = 0;
  if ((a1 & 0xF) == 0 && mfm_arena + 0x800000 > a1)
  {
    unint64_t v4 = (uint64_t)(a1 - v1) >> 4;
    if ((*(void *)(mfm_arena + 224 + ((v4 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v4) & *(void *)(mfm_arena + 224 + ((v4 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8))) != 0)
    {
      unint64_t v5 = v4 + 1;
      unint64_t v6 = v5 >> 5;
      uint64_t v7 = (v5 >> 5) & 0x7FFFFFFFFFFFFFELL;
      uint64_t v8 = mfm_arena + 8 * v7;
      unint64_t v9 = *(void *)(v8 + 224) >> v5;
      if (v9)
      {
        unint64_t v10 = __clz(__rbit64(v9));
      }
      else
      {
        unint64_t v13 = v5 & 0x3F;
        unint64_t v14 = *(void *)(v8 + 240);
        if (v14)
        {
          unint64_t v11 = __clz(__rbit64(v14)) - v13 + 65;
          return 16 * v11;
        }
        unint64_t v15 = *(void *)(mfm_arena + ((8 * v6) | 8) + 224);
        if (v13 < 0x2E) {
          LODWORD(v16) = 0;
        }
        else {
          uint64_t v16 = *(void *)(mfm_arena + 8 * v7 + 248);
        }
        unint64_t v10 = ((v15 >> v13) | ((unint64_t)(2 * v16) << (v13 ^ 0x3Fu))) & 0x7FFFF;
      }
      unint64_t v11 = v10 + 1;
      return 16 * v11;
    }
    return 0;
  }
  return v3;
}

void *nanov2_realloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1;
  if (!a2)
  {
    unint64_t v10 = a3;
LABEL_6:
    return nanov2_malloc(a1, v10);
  }
  unint64_t v5 = (const void *)a2;
  uint64_t v6 = *(void *)(a1 + 28704);
  unint64_t v7 = nanov2_pointer_size(a1, a2, 0);
  if (v7)
  {
    size_t v8 = v7;
    if (a3 >= 0x101)
    {
      unint64_t v9 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(v6 + 24))(v6, a3);
      goto LABEL_25;
    }
    if (a3)
    {
      if (a3 <= 0x10) {
        unint64_t v13 = 16;
      }
      else {
        unint64_t v13 = (a3 + 15) & 0xFFFFFFFFFFFFFFF0;
      }
      if (v13 <= v7 && v13 > v7 >> 1)
      {
        if (v7 != a3)
        {
          if (v7 <= a3) {
            purgeable_ptr_in_use_enumerator_cold_1();
          }
          if ((*(unsigned char *)(v4 + 28676) & 0x20) != 0) {
            _platform_memset();
          }
        }
        return v5;
      }
      unint64_t v9 = nanov2_malloc(v4, v13);
LABEL_25:
      unint64_t v14 = v9;
      if (!v9) {
        return 0;
      }
      if (v8 >= a3) {
        size_t v15 = a3;
      }
      else {
        size_t v15 = v8;
      }
      memcpy(v9, v5, v15);
      _nanov2_free(v4, (unint64_t)v5, 0);
      return v14;
    }
    _nanov2_free(v4, (unint64_t)v5, 0);
    a1 = v4;
    unint64_t v10 = 0;
    goto LABEL_6;
  }
  uint64_t v12 = *(uint64_t (**)(uint64_t, const void *, unint64_t))(v6 + 56);

  return (void *)v12(v6, v5, a3);
}

uint64_t nanov2_batch_malloc(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (a2 <= 0x10) {
    unint64_t v7 = 16;
  }
  else {
    unint64_t v7 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  if (v7 > 0x100)
  {
    int v8 = 0;
    return (*(unsigned int (**)(void))(*(void *)(a1 + 28704) + 80))() + v8;
  }
  int v8 = 0;
  if (a4)
  {
    while (1)
    {
      unint64_t v9 = nanov2_malloc(a1, v7);
      if (!v9) {
        break;
      }
      *a3++ = v9;
      if (v4 == ++v8) {
        return v4;
      }
    }
  }
  if (v8 != v4) {
    return (*(unsigned int (**)(void))(*(void *)(a1 + 28704) + 80))() + v8;
  }
  return v4;
}

void *nanov2_malloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x10) {
    unint64_t v2 = 16;
  }
  else {
    unint64_t v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  if (v2 > 0x100)
  {
    unint64_t v22 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24);
    return (void *)v22();
  }
  uint64_t v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1) {
      unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }
  unsigned int v5 = v4 & 0x3F;
  uint64_t v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  unint64_t v7 = *(atomic_uint **)(v6 + 0x4000);
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = *v7;
    unint64_t v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    int v11 = 16 * v3 + 16;
    while (1)
    {
      uint64_t v12 = 0;
      if ((v9 & 0x80000000) == 0)
      {
        uint64_t v14 = 0;
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0);
      }
      int v13 = v9 & 0x7FF;
      uint64_t v14 = 0;
      if (v13 == 2044) {
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0);
      }
      unsigned int v15 = (v9 >> 11) & 0x3FF;
      int v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15) {
          int v17 = 2043;
        }
        else {
          int v17 = 2044;
        }
        unsigned int v18 = v16 | v17 | 0x80000000;
        uint64_t v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v18, memory_order_relaxed, memory_order_relaxed);
        if (v19 == v9)
        {
          int v24 = slots_by_size_class[v3] + ~v15;
          char v25 = 1;
          goto LABEL_30;
        }
      }
      else
      {
        if (!v8) {
          unint64_t v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        }
        int v24 = v13 - 1;
        uint64_t v14 = v8 + v24 * v11;
        if (v15) {
          __int16 v20 = *(_WORD *)(v14 + 8);
        }
        else {
          __int16 v20 = 2044;
        }
        unsigned int v21 = v16 | v20 & 0x7FF | 0x80000000;
        uint64_t v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v21, memory_order_relaxed, memory_order_relaxed);
        if (v19 == v9)
        {
          if (v14) {
            goto LABEL_38;
          }
          char v25 = 0;
LABEL_30:
          if (!v8) {
            unint64_t v8 = v10;
          }
          uint64_t v14 = v8 + v24 * v11;
          if (v25)
          {
            if (!v14)
            {
LABEL_34:
              uint64_t v12 = 0;
              return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0);
            }
          }
          else
          {
LABEL_38:
            if ((*(void *)(a1 + 28696) ^ *(void *)v14) != v14) {
              goto LABEL_34;
            }
          }
          *(void *)uint64_t v14 = 0;
          *(void *)(v14 + 8) = 0;
          return (void *)v14;
        }
      }
      uint64_t v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        uint64_t v14 = 0;
        uint64_t v12 = v7;
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0);
      }
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
  return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, v14, 0, 0);
}

uint64_t _malloc_type_zone_malloc_with_options_np_outlined(malloc_zone_t *a1, size_t a2, size_t a3, uint64_t a4, unint64_t a5)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v6 = *(void *)(StatusReg + 904);
  if (a5 <= 1) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = a5;
  }
  *(void *)(StatusReg + 904) = v7;
  uint64_t result = _malloc_zone_malloc_with_options_np_outlined(a1, a2, a3, a4);
  *(void *)(StatusReg + 904) = v6;
  return result;
}

uint64_t _malloc_zone_malloc_with_options_np_outlined(malloc_zone_t *zone, size_t alignment, size_t size, uint64_t a4)
{
  if (!zone || (unint64_t v8 = zone, default_zone == (_UNKNOWN *)zone))
  {
    unint64_t v8 = (malloc_zone_t *)lite_zone;
    if (!lite_zone) {
      unint64_t v8 = *(malloc_zone_t **)malloc_zones;
    }
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v10 = *(void *)(StatusReg + 904);
  if (!v10) {
    *(void *)(StatusReg + 904) = (v4 >> 2);
  }
  if (malloc_interposition_compat
    || v8->version < 0xF
    || (reserved1 = (uint64_t (*)(malloc_zone_t *, size_t, size_t, uint64_t))v8[1].reserved1) == 0)
  {
    if (alignment)
    {
      uint64_t v14 = (uint64_t)j__malloc_zone_memalign(v8, alignment, size);
      if (v14 && (a4 & 1) != 0) {
        _platform_memset();
      }
    }
    else
    {
      if (a4) {
        unsigned int v15 = j__malloc_zone_calloc(v8, 1uLL, size);
      }
      else {
        unsigned int v15 = j__malloc_zone_malloc(v8, size);
      }
      uint64_t v14 = (uint64_t)v15;
    }
  }
  else
  {
    int v12 = malloc_tracing_enabled;
    if (malloc_tracing_enabled)
    {
      kdebug_trace();
      uint64_t v13 = ((uint64_t (*)(malloc_zone_t *, size_t, size_t, uint64_t))v8[1].reserved1)(v8, alignment, size, a4);
    }
    else
    {
      uint64_t v13 = reserved1(v8, alignment, size, a4);
    }
    uint64_t v14 = v13;
    if (malloc_logger)
    {
      if (a4) {
        uint64_t v17 = 74;
      }
      else {
        uint64_t v17 = 10;
      }
      malloc_logger(v17, v8, size, 0, v14, 0);
    }
    if (malloc_simple_stack_logging != 1)
    {
      if (!v12) {
        goto LABEL_24;
      }
      goto LABEL_15;
    }
    malloc_report(0x325u, (uint64_t)"malloc_with_options (%p/%llu,%llu): ");
    if (v12) {
LABEL_15:
    }
      kdebug_trace();
  }
LABEL_24:
  if (!v10) {
    *(void *)(StatusReg + 904) = 0;
  }
  return v14;
}

void xzm_malloc_zone_malloc_type_calloc(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int8x8_t a5)
{
  if (a2 == 1 || is_mul_ok(a2, a3) && (a3 *= a2, a3 <= malloc_absolute_max_size))
  {
    if (a3 <= 0x8000)
    {
      if (*(void *)(a1 + 232)) {
        uint64_t v5 = *(void *)(a1 + 232);
      }
      else {
        uint64_t v5 = a1;
      }
      unint64_t v6 = __clz(a3 - 1);
      unint64_t v7 = (((a3 - 1) >> (61 - v6)) & 3) - 4 * v6 + 488;
      if (a3 <= 0x80) {
        unint64_t v7 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
      }
      if (!a3) {
        LOBYTE(v7) = 0;
      }
      uint64_t v8 = v7;
      char v9 = *(unsigned char *)(*(void *)(v5 + 368) + v7);
      if (HIWORD(a4) == 256)
      {
        char v10 = 0;
      }
      else if ((a4 & 0xC0000000000) == 0x40000000000)
      {
        char v10 = 1;
      }
      else
      {
        if (a4) {
          unsigned int v11 = a4;
        }
        else {
          unsigned int v11 = dword_1EB1C96FC;
        }
        LOBYTE(v12) = 0;
        switch(*(unsigned char *)(*(void *)(v5 + 360) + v8))
        {
          case 4:
            LODWORD(v12) = (*(_DWORD *)(v5 + 316) + *(_DWORD *)(v5 + 312) * v11) >> 31;
            break;
          case 5:
            unint64_t v13 = (*(void *)(v5 + 320) + *(void *)(v5 + 312) * (unint64_t)v11) >> 34;
            LODWORD(v12) = v13 - 3 * ((1431655766 * (unint64_t)v13) >> 32);
            break;
          case 6:
            unint64_t v12 = ((*(void *)(v5 + 320) + *(void *)(v5 + 312) * (unint64_t)v11) >> 32) & 3;
            break;
          default:
            break;
        }
        char v10 = v12 + 2;
      }
      _xzm_xzone_malloc(a1, a3, (v10 + v9), 1, a5);
    }
    else
    {
      _xzm_malloc_large_huge(a1, a3, 0, a4, 1);
    }
  }
  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }
}

void *nanov2_calloc_type(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (unint64_t v3 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    {
      int v16 = 0;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v16;
    }
  }
  if (v3 <= 0x10) {
    unint64_t v4 = 16;
  }
  else {
    unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  if (v3 > 0x100)
  {
    int v24 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 168);
    return (void *)v24();
  }
  uint64_t v5 = (v4 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v6) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1) {
      unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v6) = v6 % nano_common_max_magazines;
  }
  unsigned int v7 = v6 & 0x3F;
  uint64_t v8 = a1 + (v5 << 9) + 8 * (v6 & 0x3F);
  char v9 = *(atomic_uint **)(v8 + 0x4000);
  if (!v9)
  {
    uint64_t v14 = 0;
    int v16 = 0;
    return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, (v4 >> 4) - 1, v7, v14, (uint64_t)v16, 1, 1);
  }
  unint64_t v10 = 0;
  uint64_t v11 = *v9;
  unint64_t v12 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
  int v13 = 16 * v5 + 16;
  while (1)
  {
    uint64_t v14 = 0;
    if ((v11 & 0x80000000) == 0)
    {
      int v16 = 0;
      return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, (v4 >> 4) - 1, v7, v14, (uint64_t)v16, 1, 1);
    }
    int v15 = v11 & 0x7FF;
    int v16 = 0;
    if (v15 == 2044) {
      return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, (v4 >> 4) - 1, v7, v14, (uint64_t)v16, 1, 1);
    }
    unsigned int v17 = (v11 >> 11) & 0x3FF;
    int v18 = (v11 + 2095104) & 0x1FF800 | (v11 + 0x200000) & 0x7FE00000;
    if (v15 != 2043 && v15 != 2045) {
      break;
    }
    if (v17) {
      int v19 = 2043;
    }
    else {
      int v19 = 2044;
    }
    unsigned int v20 = v18 | v19 | 0x80000000;
    uint64_t v21 = v11;
    atomic_compare_exchange_strong_explicit(v9, (unsigned int *)&v21, v20, memory_order_relaxed, memory_order_relaxed);
    if (v21 == v11)
    {
      int v26 = slots_by_size_class[v5] + ~v17;
      char v27 = 1;
      goto LABEL_35;
    }
LABEL_27:
    uint64_t v11 = v21;
    if ((v21 & 0x7FF) - 2045 < 3)
    {
      int v16 = 0;
      uint64_t v14 = v9;
      return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, (v4 >> 4) - 1, v7, v14, (uint64_t)v16, 1, 1);
    }
  }
  if (!v10) {
    unint64_t v10 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
  }
  int v26 = v15 - 1;
  int v16 = (void *)(v10 + v26 * v13);
  if (v17) {
    __int16 v22 = *((_WORD *)v16 + 4);
  }
  else {
    __int16 v22 = 2044;
  }
  unsigned int v23 = v18 | v22 & 0x7FF | 0x80000000;
  uint64_t v21 = v11;
  atomic_compare_exchange_strong_explicit(v9, (unsigned int *)&v21, v23, memory_order_relaxed, memory_order_relaxed);
  if (v21 != v11) {
    goto LABEL_27;
  }
  if (v16) {
    goto LABEL_43;
  }
  char v27 = 0;
LABEL_35:
  if (!v10) {
    unint64_t v10 = v12;
  }
  int v16 = (void *)(v10 + v26 * v13);
  if (v27)
  {
    if (!v16)
    {
LABEL_39:
      uint64_t v14 = 0;
      return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, (v4 >> 4) - 1, v7, v14, (uint64_t)v16, 1, 1);
    }
  }
  else
  {
LABEL_43:
    if ((void *)(*(void *)(a1 + 28696) ^ *v16) != v16) {
      goto LABEL_39;
    }
  }
  if (malloc_zero_policy)
  {
    bzero(v16, v4);
  }
  else
  {
    *int v16 = 0;
    v16[1] = 0;
  }
  return v16;
}

void *nanov2_allocate_outlined(uint64_t a1, atomic_uint **a2, uint64_t a3, unsigned int a4, unsigned int a5, atomic_uint *a6, uint64_t a7, char a8, char a9)
{
  if (a7) {
    nanov2_guard_corruption_detected();
  }
  if (a6) {
    nanov2_madvise_block((const os_unfair_lock *)a1, a6, a4, 2047);
  }
  if (((1 << a4) & *(unsigned __int16 *)(a1 + 28672)) != 0)
  {
    uint64_t v15 = *(void *)(a1 + 28704);
    if (a9)
    {
      int v16 = *(uint64_t (**)(void))(v15 + 160);
LABEL_7:
      uint64_t v17 = v16();
      goto LABEL_19;
    }
  }
  else
  {
    char v25 = a8;
    int v18 = 0;
    int v19 = (os_unfair_lock_s *)(a1 + ((unint64_t)a4 << 8) + 4 * a5 + 24576);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v19, (unsigned int *)&v18, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v18) {
      os_unfair_lock_lock_with_options();
    }
    if (!*a2 || (uint64_t v21 = (void *)nanov2_allocate_from_block(a1, *a2, a4)) == 0) {
      uint64_t v21 = (void *)nanov2_find_block_and_allocate(a1, a4, a2);
    }
    int v22 = *(_DWORD *)(StatusReg + 24);
    int v23 = v22;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v19, (unsigned int *)&v23, 0, memory_order_release, memory_order_relaxed);
    if (v23 != v22) {
      os_unfair_lock_unlock(v19);
    }
    a8 = v25;
    if (v21) {
      goto LABEL_20;
    }
    atomic_fetch_or_explicit((atomic_ushort *volatile)(a1 + 28672), 1 << a4, memory_order_relaxed);
    uint64_t v15 = *(void *)(a1 + 28704);
    if (a9)
    {
      int v16 = *(uint64_t (**)(void))(v15 + 160);
      goto LABEL_7;
    }
  }
  uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(v15, a3);
LABEL_19:
  uint64_t v21 = (void *)v17;
  if (!v17)
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    return v21;
  }
LABEL_20:
  switch(malloc_zero_policy)
  {
    case 2:
LABEL_25:
      _platform_memset();
      return v21;
    case 1:
      if ((a8 & 1) == 0)
      {
        *uint64_t v21 = 0;
        return v21;
      }
      goto LABEL_25;
    case 0:
      *uint64_t v21 = 0;
      v21[1] = 0;
      break;
  }
  return v21;
}

unint64_t nanov2_find_block_and_allocate(uint64_t a1, unsigned int a2, atomic_uint **a3)
{
  unint64_t v4 = *a3;
  uint64_t v5 = *a3;
  if (!*a3) {
    uint64_t v5 = *(atomic_uint **)(a1 + 28720);
  }
  uint64_t v6 = a2;
  int v7 = slots_by_size_class[a2];
  unint64_t v8 = (unint64_t)v5 & 0xFFFFFFFFFC000000;
  int v52 = 1 << a2;
  int v49 = (unsigned char *)(a1 + 28676);
  uint64_t v50 = *a3;
  uint64_t v56 = (atomic_ullong *)(a1 + 28728);
  mach_vm_address_t v53 = (atomic_uint *)(a1 + 28716);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  do
  {
LABEL_4:
    unint64_t v9 = v8 & 0xFFFFFFFFE0000000;
    unint64_t explicit = atomic_load_explicit(v56, memory_order_acquire);
    unint64_t v11 = (v8 & 0xFFFFFFFFE0000000) + 0x20000000;
    unint64_t v57 = (explicit - 1) & 0xFFFFFFFFE0000000;
    unint64_t v59 = explicit;
    if (v57 == (v8 & 0xFFFFFFFFE0000000)) {
      unint64_t v11 = explicit;
    }
    int v12 = nanov2_policy_config;
    int v13 = unk_1EB1C9504;
    unint64_t v14 = v8;
    while (2)
    {
      unint64_t v15 = v8;
      unsigned int v16 = first_block_offset_by_size_class[v6] ^ *(_DWORD *)(a1 + 28680);
      unint64_t v17 = (*(void *)(a1 + 28688) ^ v14 & 0xFFFFFFFFFC000000)
          + 4 * (((unsigned __int16)(v16 >> 6) | (unsigned __int16)((_WORD)v16 << 6)) & 0xFFF);
      if (v4) {
        unint64_t v17 = (unint64_t)v4;
      }
      if (v12) {
        BOOL v18 = v4 == 0;
      }
      else {
        BOOL v18 = 1;
      }
LABEL_12:
      int v19 = 0;
      unsigned int v20 = 0;
      BOOL v21 = 1;
      unint64_t v22 = v17;
      int v23 = v13;
      while (1)
      {
        while (1)
        {
          if ((*(_DWORD *)v22 & 0x80000000) != 0) {
            goto LABEL_18;
          }
          switch(*(_DWORD *)v22 & 0x7FF)
          {
            case 0x7FC:
            case 0x7FE:
              goto LABEL_18;
            case 0x7FD:
              if (!v19) {
                int v19 = (atomic_uint *)v22;
              }
              if (!v18) {
                goto LABEL_18;
              }
              break;
            default:
              if (!v20) {
                unsigned int v20 = (atomic_uint *)v22;
              }
              if (!v18) {
                goto LABEL_18;
              }
              break;
          }
          if ((unint64_t)v20 != (unsigned __int128)0) {
            break;
          }
          unsigned int v20 = 0;
LABEL_18:
          if (v23 >= 1 && (unint64_t)v20 != (unsigned __int128)0 && !--v23) {
            break;
          }
          unsigned int v24 = *(_DWORD *)(a1 + 28680);
          int v25 = ((16 * v22) & 0xFC0 | (v22 >> 8) & 0x3F) ^ v24;
          if (v21)
          {
            int v26 = first_block_offset_by_size_class[v6];
            if (v25 == v26)
            {
              int v27 = last_block_offset_by_size_class[v6];
              int v23 = v13;
            }
            else
            {
              int v27 = v25 - 1;
            }
            BOOL v37 = v25 == v26;
            BOOL v21 = v25 != v26;
            unint64_t v29 = v22 & 0xFFFFFFFFFFFFC000 | (4
                                              * (((unsigned __int16)((v27 ^ v24) >> 6) | (unsigned __int16)(((unsigned __int16)v27 ^ (unsigned __int16)v24) << 6)) & 0xFFF));
            if (v37) {
              unint64_t v22 = v17;
            }
            else {
              unint64_t v22 = v29;
            }
          }
          else
          {
            if (v25 == last_block_offset_by_size_class[v6]) {
              int v28 = first_block_offset_by_size_class[v6];
            }
            else {
              int v28 = v25 + 1;
            }
            unint64_t v22 = v22 & 0xFFFFFFFFFFFFC000 | (4
                                              * (((unsigned __int16)((v28 ^ v24) >> 6) | (unsigned __int16)(((unsigned __int16)v28 ^ (unsigned __int16)v24) << 6)) & 0xFFF));
            if (v22 == v17) {
              break;
            }
            BOOL v21 = 0;
          }
        }
        unint64_t v4 = v20;
        if (!v20)
        {
          unint64_t v4 = v19;
          if (!v19) {
            break;
          }
        }
        int v19 = 0;
        unsigned int v20 = 0;
        atomic_uint v30 = *v4;
        int v31 = *v4 & 0x7FF;
        BOOL v21 = 1;
        unint64_t v22 = v17;
        int v23 = v13;
        if (v31 != 2046)
        {
          if (!v31 || v31 == 2045 || v31 == 2047)
          {
            int v32 = 0;
            int v33 = ((v7 << 11) + 2095104) & 0x1FF800 | 0x7FB;
          }
          else
          {
            int v33 = v30 & 0x1FFFFF;
            int v32 = (v30 + 0x200000) & 0x7FE00000;
          }
          atomic_uint v34 = *v4;
          atomic_compare_exchange_strong_explicit(v4, (unsigned int *)&v34, v33 | v32 | 0x80000000, memory_order_relaxed, memory_order_relaxed);
          int v12 = nanov2_policy_config;
          int v13 = unk_1EB1C9504;
          if (v34 != v30) {
            goto LABEL_12;
          }
          unint64_t result = nanov2_allocate_from_block(a1, v4, a2);
          if (!result)
          {
            atomic_fetch_and_explicit(v4, 0x7FFFFFFFu, memory_order_relaxed);
            unint64_t v8 = v14;
            goto LABEL_4;
          }
          *a3 = v4;
          if (v50) {
            atomic_fetch_and_explicit(v50, 0x7FFFFFFFu, memory_order_relaxed);
          }
          return result;
        }
      }
      v14 += 0x4000000;
      if (v14 >= v11)
      {
        uint64_t v35 = *(unsigned __int16 *)((*(void *)(a1 + 28688) ^ v9 & 0xFFFFFFFFFC000000)
                                  + 4
                                  * (((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF));
        unint64_t v14 = v9 + (v35 << 29);
        BOOL v37 = v35 == 0;
        unint64_t v11 = v59;
        BOOL v37 = v37 || v14 >= v59 || v9 == 0;
        if (v37) {
          unint64_t v14 = *(void *)(a1 + 28720);
        }
        if (v14 != v57) {
          unint64_t v11 = v14 + 0x20000000;
        }
        unint64_t v9 = v14;
      }
      unint64_t v8 = v15;
      unint64_t v4 = 0;
      if (v14 != v15) {
        continue;
      }
      break;
    }
    if (((unsigned __int16)v52 & (unsigned __int16)word_1EB1C9508) != 0) {
      return 0;
    }
    int v38 = 0;
    int v39 = v53;
    atomic_compare_exchange_strong_explicit(v53, (unsigned int *)&v38, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v38) {
      os_unfair_lock_lock_with_options();
    }
    uint64_t v40 = *(void *)(a1 + 28728);
    if (v40 == v59)
    {
      if ((v40 & 0xFFFFFFFFE0000000) == v59)
      {
        char v41 = 0;
        unint64_t v8 = 0;
      }
      else
      {
        *(void *)(a1 + 28728) = v59 + 0x4000000;
        if ((*v49 & 7) != 0)
        {
          int v58 = ((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF;
          unint64_t v47 = v40 & 0xFFFFFFFFFC000000;
          *(_DWORD *)((*(void *)(a1 + 28688) ^ v40 & 0xFFFFFFFFFC000000) + ((unint64_t)(v58 == 0) << 8)) = -2147481606;
          if (mprotect((void *)(v59 + ((unint64_t)(v58 == 0) << 14)), 0x4000uLL, 1)) {
            malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
          }
          if (v58 == 4095) {
            uint64_t v48 = 4094;
          }
          else {
            uint64_t v48 = 4095;
          }
          *(_DWORD *)((*(void *)(a1 + 28688) ^ v47) + 4 * (((v48 & 0x3F) << 6) | 0x3F)) = -2147481606;
          char v41 = 1;
          if (mprotect((void *)(v59 + (v48 << 14)), 0x4000uLL, 1)) {
            malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
          }
          unint64_t v8 = v59;
          int v39 = v53;
        }
        else
        {
          char v41 = 1;
          unint64_t v8 = v59;
        }
      }
    }
    else
    {
      unint64_t v8 = v40 - 0x4000000;
      char v41 = 1;
    }
    int v42 = *(_DWORD *)(StatusReg + 24);
    int v43 = v42;
    atomic_compare_exchange_strong_explicit(v39, (unsigned int *)&v43, 0, memory_order_release, memory_order_relaxed);
    if (v43 != v42)
    {
      int v44 = (os_unfair_lock_s *)v39;
      unint64_t v45 = v8;
      os_unfair_lock_unlock(v44);
      unint64_t v8 = v45;
    }
    unint64_t v4 = 0;
    unint64_t result = 0;
  }
  while ((v41 & 1) != 0);
  return result;
}

unint64_t nanov2_allocate_from_block(uint64_t a1, atomic_uint *a2, int a3)
{
  unint64_t v3 = 0;
  uint64_t v4 = *a2;
  int v5 = 16 * a3 + 16;
  while (1)
  {
    unint64_t v6 = 0;
    if ((v4 & 0x80000000) == 0) {
      return v6;
    }
    int v7 = v4 & 0x7FF;
    if (v7 == 2044) {
      return v6;
    }
    unsigned int v8 = (v4 >> 11) & 0x3FF;
    int v9 = (v4 + 2095104) & 0x1FF800 | (v4 + 0x200000) & 0x7FE00000;
    if (v7 != 2043 && v7 != 2045) {
      break;
    }
    if (v8) {
      int v10 = 2043;
    }
    else {
      int v10 = 2044;
    }
    unsigned int v11 = v9 | v10 | 0x80000000;
    uint64_t v12 = v4;
    atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v12, v11, memory_order_relaxed, memory_order_relaxed);
    if (v12 == v4)
    {
      int v15 = slots_by_size_class[a3] + ~v8;
      char v16 = 1;
      goto LABEL_19;
    }
LABEL_17:
    uint64_t v4 = v12;
    if ((v12 & 0x7FF) - 2045 < 3)
    {
      nanov2_madvise_block((const os_unfair_lock *)a1, a2, a3, 2047);
      return 0;
    }
  }
  if (!v3) {
    unint64_t v3 = (unint64_t)a2 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
  }
  int v15 = v7 - 1;
  unint64_t v6 = v3 + v15 * v5;
  if (v8) {
    __int16 v13 = *(_WORD *)(v6 + 8);
  }
  else {
    __int16 v13 = 2044;
  }
  unsigned int v14 = v9 | v13 & 0x7FF | 0x80000000;
  uint64_t v12 = v4;
  atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v12, v14, memory_order_relaxed, memory_order_relaxed);
  if (v12 != v4) {
    goto LABEL_17;
  }
  if (v6)
  {
LABEL_25:
    if ((*(void *)(a1 + 28696) ^ *(void *)v6) != v6) {
      nanov2_guard_corruption_detected();
    }
    return v6;
  }
  char v16 = 0;
LABEL_19:
  if (v3) {
    unint64_t v17 = v3;
  }
  else {
    unint64_t v17 = (unint64_t)a2 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
  }
  unint64_t v6 = v17 + v15 * v5;
  if ((v16 & 1) == 0) {
    goto LABEL_25;
  }
  return v6;
}

uint64_t _malloc_zone_calloc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (default_zone == (_UNKNOWN *)a1 && lite_zone == 0) {
    a1 = *(void *)malloc_zones;
  }
  if (malloc_slowpath) {
    BOOL v6 = 0;
  }
  else {
    BOOL v6 = malloc_logger == 0;
  }
  if (!v6) {
    return _malloc_zone_calloc_instrumented_or_legacy(a1, a2, a3, a4);
  }
  unsigned int v7 = *(_DWORD *)(a1 + 104);
  if (v7 <= 0xC) {
    return _malloc_zone_calloc_instrumented_or_legacy(a1, a2, a3, a4);
  }
  if (v7 < 0x10) {
    return (*(uint64_t (**)(void))(a1 + 32))();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(a1 + 168))(a1, a2, a3, (v4 >> 2));
}

void *__cdecl malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  return (void *)_malloc_zone_calloc((uint64_t)zone, num_items, size, 0);
}

uint64_t _malloc_zone_memalign(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  char v6 = a4;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v11 = *(void *)(StatusReg + 904);
  uint64_t v12 = v11;
  if (!v11)
  {
    *(void *)(StatusReg + 904) = a5;
    uint64_t v12 = a5;
  }
  int v13 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (*(_DWORD *)(a1 + 104) < 5u) {
    goto LABEL_9;
  }
  if (malloc_check_start) {
    internal_check();
  }
  if (malloc_absolute_max_size < a3) {
    goto LABEL_9;
  }
  uint64_t v14 = 0;
  int v15 = 22;
  if (a2 >= 8)
  {
    uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
    v17.i16[0] = vaddlv_u8(v17);
    if (v17.u32[0] <= 1uLL)
    {
      if (((a2 - 1) & a3) == 0 || (v6 & 2) == 0)
      {
        BOOL v18 = *(uint64_t (**)(uint64_t, unint64_t, unint64_t, uint64_t, uint64_t))(a1 + 112);
        if (v18)
        {
          uint64_t v14 = v18(a1, a2, a3, a4, v12);
          if (malloc_logger) {
            malloc_logger(10, a1, a3, 0, v14, 0);
          }
          if (malloc_simple_stack_logging == 1)
          {
            malloc_report(0x325u, (uint64_t)"memalign (%p/%llu,%llu): ");
            if (!v13) {
              goto LABEL_10;
            }
          }
          else if (!v13)
          {
            goto LABEL_10;
          }
          kdebug_trace();
          goto LABEL_10;
        }
LABEL_9:
        uint64_t v14 = 0;
LABEL_10:
        int v15 = 12;
        goto LABEL_11;
      }
      uint64_t v14 = 0;
      int v15 = 22;
    }
  }
LABEL_11:
  if (!v11) {
    *(void *)(StatusReg + 904) = 0;
  }
  if (!v14 && (v6 & 1) != 0) {
    **(_DWORD **)(StatusReg + 8) = v15;
  }
  return v14;
}

void _xzm_memalign(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, char a5, int8x8_t a6)
{
  unint64_t v6 = a2;
  char v7 = a5 | 2;
  if (a2 > 0x4000 || a3 > 0x8000)
  {
    _xzm_malloc_large_huge(a1, a3, a2, a4, v7);
  }
  else
  {
    if (a3 > a2)
    {
      a2 *= 2;
      if (2 * v6 < a3)
      {
        a2 = 4 * v6;
        if (4 * v6 <= a3) {
          a2 = a3;
        }
      }
    }
    xzm_malloc(a1, a2, a4, v7, a6);
  }
}

void *nanov2_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 > 0x10) {
    return (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 112))();
  }
  else {
    return nanov2_malloc(a1, a3);
  }
}

void *__cdecl malloc_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size)
{
  return (void *)_malloc_zone_memalign((uint64_t)zone, alignment, size, 0, (v3 >> 2));
}

uint64_t malloc_zone_batch_malloc_fallback(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!a4) {
    return 0;
  }
  uint64_t v7 = 0;
  uint64_t v8 = a4;
  while (1)
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a2);
    if (!v9) {
      break;
    }
    *(void *)(a3 + 8 * v7++) = v9;
    if (v8 == v7) {
      return v8;
    }
  }
  return v7;
}

void xzm_malloc_zone_malloc(uint64_t a1, unint64_t a2, int8x8_t a3)
{
}

uint64_t default_zone_memalign()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 112))();
}

void xzm_malloc_zone_memalign(uint64_t a1, unint64_t a2, unint64_t a3, int8x8_t a4)
{
}

void malloc_report(unsigned int a1, uint64_t a2)
{
  if (malloc_error_sleep) {
    unsigned int v3 = 3600;
  }
  else {
    unsigned int v3 = 0;
  }
  malloc_vreport(a1, v3, 0, 0, a2);
}

void malloc_vreport(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v44 = *MEMORY[0x1E4F14BF8];
  if (_simple_salloc())
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_sprintf();
    }
    if (a3) {
      _simple_sprintf();
    }
    _simple_vsprintf();
    if ((a1 & 0x100) != 0)
    {
      long long v43 = 0u;
      long long v42 = 0u;
      long long v41 = 0u;
      long long v40 = 0u;
      long long v39 = 0u;
      long long v38 = 0u;
      long long v37 = 0u;
      long long v36 = 0u;
      long long v35 = 0u;
      long long v34 = 0u;
      long long v33 = 0u;
      long long v32 = 0u;
      long long v31 = 0u;
      long long v30 = 0u;
      long long v29 = 0u;
      long long v28 = 0u;
      long long v27 = 0u;
      long long v26 = 0u;
      long long v25 = 0u;
      long long v24 = 0u;
      long long v23 = 0u;
      long long v22 = 0u;
      long long v21 = 0u;
      long long v20 = 0u;
      *(_OWORD *)array = 0u;
      int v9 = backtrace(array, 50);
      if (v9)
      {
        uint64_t v10 = v9;
        backtrace_image_offsets(array, &image_offsets, v9);
        if ((int)v10 >= 1)
        {
          uint64_t v11 = 0;
          p_image_offset image_offsets = &image_offsets;
          do
          {
            *(void *)uu1 = 0;
            uint64_t v17 = 0;
            if (!v11 || uuid_compare(uu1, p_image_offsets->uuid))
            {
              uuid_copy(uu1, p_image_offsets->uuid);
              memset(out, 0, 37);
              uuid_unparse(p_image_offsets->uuid, out);
            }
            _simple_sappend();
            _simple_sprintf();
            ++v11;
            ++p_image_offsets;
          }
          while (v10 != v11);
        }
      }
    }
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0)) {
      _simple_put();
    }
    if (!(_malloc_no_asl_log | a1 & 0x10))
    {
      _simple_string();
      _simple_asl_log();
    }
    if ((a1 & 0x40) != 0)
    {
      uint64_t v13 = _simple_string();
    }
    else
    {
      _simple_sfree();
      uint64_t v13 = 0;
    }
  }
  else
  {
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
    {
      if ((a1 & 0x20) == 0)
      {
        _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        getprogname();
        getpid();
        _simple_dprintf();
      }
      if (a3) {
        _simple_dprintf();
      }
      _simple_vdprintf();
    }
    if ((a1 & 0x40) != 0) {
      uint64_t v13 = a5;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  if ((a1 & 0xC0) != 0)
  {
    _malloc_put(a1, "*** set a breakpoint in malloc_error_break to debug\n");
    malloc_error_break();
    if (malloc_error_stop == 1)
    {
      _malloc_put(5u, "*** sending SIGSTOP to help debug\n");
      pid_t v14 = getpid();
      kill(v14, 17);
    }
    else if (a2)
    {
      _malloc_put(5u, "*** sleeping to help debug\n");
      sleep(a2);
    }
  }
  if ((a1 & 0x40) != 0)
  {
    qword_1E93090B0 = v13;
    abort();
  }
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_logger) {
    malloc_logger(12, zone, ptr, 0, 0, 0);
  }
  if (malloc_simple_stack_logging == 1) {
    malloc_report(0x325u, (uint64_t)"malloc_zone_free (%p): ");
  }
  if (malloc_check_start) {
    internal_check();
  }
  free = zone->free;

  ((void (*)(malloc_zone_t *, void *))free)(zone, ptr);
}

void internal_check()
{
  unsigned int v0 = malloc_check_counter++;
  if (v0 >= malloc_check_start)
  {
    if (malloc_zone_check(0))
    {
      if (!qword_1E930D260) {
        vm_allocate(*MEMORY[0x1E4F14C48], (vm_address_t *)&qword_1E930D260, *MEMORY[0x1E4F14C80], 1);
      }
      thread_stack_pcs();
    }
    malloc_check_start += malloc_check_each;
  }
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)_malloc_zone_calloc((uint64_t)default_zone, __count, __size, 1);
}

void __malloc_init(const char **a1)
{
  uint64_t v119 = *MEMORY[0x1E4F14BF8];
  bzero(v117, 0x400uLL);
  int v2 = getpid();
  if (v2 != 1) {
    int v2 = _os_feature_enabled_simple_impl();
  }
  size_t v115 = 1023;
  if (v2 && MEMORY[0xFFFFF4084] && !sysctlbyname("kern.bootargs", v117, &v115, 0, 0) && v115) {
    v117[v115 + 1] = 0;
  }
  uint64_t v3 = *MEMORY[0x1E4F14C68];
  if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
    uint64_t v3 = *MEMORY[0x1E4F14C80];
  }
  malloc_absolute_max_size = ~(2 * v3);
  int v4 = _malloc_allow_internal_security_policy();
  if (malloc_internal_security_policy != v4) {
    malloc_internal_security_policy = v4;
  }
  if (getpid() == 1)
  {
    int v5 = 1;
  }
  else
  {
    unint64_t v6 = (const char *)_simple_getenv();
    if (v6 && (strtoull(v6, 0, 0) & 0xF) != 0)
    {
      int v5 = 18;
    }
    else
    {
      getprogname();
      uint64_t v7 = 0;
      while (_platform_strcmp())
      {
        v7 += 2;
        if (v7 == 86) {
          goto LABEL_23;
        }
      }
      int v5 = (int)(&_malloc_check_process_identity_name_identity_mapping)[v7 + 1];
    }
  }
  malloc_process_identity = v5;
LABEL_23:
  int v8 = _os_feature_enabled_simple_impl();
  if (((v8 ^ (malloc_zero_policy != 0)) & 1) == 0) {
    malloc_zero_policy = v8 ^ 1;
  }
  int v9 = 1;
  if ((malloc_process_identity - 1) >= 0x1F)
  {
    if (malloc_process_identity > 32)
    {
      if (malloc_process_identity == 33)
      {
        if (malloc_internal_security_policy) {
          goto LABEL_158;
        }
      }
      else if (malloc_process_identity == 34)
      {
        goto LABEL_26;
      }
    }
    else
    {
      if (!malloc_process_identity)
      {
        if (!malloc_internal_security_policy) {
          goto LABEL_26;
        }
        goto LABEL_158;
      }
      if (malloc_process_identity == 32 && malloc_internal_security_policy)
      {
LABEL_158:
        int v9 = _os_feature_enabled_simple_impl();
        goto LABEL_26;
      }
    }
    int v9 = 0;
  }
LABEL_26:
  if (malloc_xzone_enabled != v9) {
    malloc_xzone_enabled = v9;
  }
  unint64_t v10 = 0x1EB1C9000uLL;
  if (a1 && *a1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = a1;
    do
    {
      if ((const char *)_platform_strstr() == *v12)
      {
        if (_platform_strchr())
        {
          unint64_t v13 = v10;
          uint64_t v14 = 0;
          char v15 = 1;
          do
          {
            uint64_t v16 = v14;
            _platform_strlcpy();
            uint64_t v17 = (unsigned char *)_platform_strchr();
            if (v17) {
              *uint64_t v17 = 0;
            }
            *((void *)&malloc_entropy + v16) = strtoull_l(v118, 0, 0, 0);
            char v18 = v15 & (_platform_strchr() != 0);
            uint64_t v14 = 1;
            char v15 = 0;
          }
          while ((v18 & 1) != 0);
          int v19 = v16 + 1;
          unint64_t v10 = v13;
        }
        else
        {
          int v19 = 0;
        }
        size_t v20 = strlen(*v12);
        bzero((void *)*v12, v20);
        if (v19 == 2) {
          *(unsigned char *)(v10 + 1898) = 1;
        }
      }
      if ((const char *)_platform_strstr() == *v12) {
        uint64_t v11 = *v12;
      }
      if ((const char *)_platform_strstr() == *v12) {
        large_cache_enabled = 1;
      }
      long long v21 = v12[1];
      ++v12;
    }
    while (v21);
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ((*(unsigned char *)(v10 + 1898) & 1) == 0)
  {
    getentropy(&malloc_entropy, 0x10uLL);
    *(unsigned char *)(v10 + 1898) = 1;
  }
  if (v11)
  {
    uint64_t v22 = _platform_strchr();
    if (v22)
    {
      if (strtoull_l((const char *)(v22 + 1), 0, 16, 0) == 1) {
        magazine_medium_enabled = 0;
      }
    }
  }
  long long v23 = malloc_common_value_for_key_copy(v117, "malloc_max_magazines", v118, 0x100uLL);
  if (v23)
  {
    v116 = 0;
    uint64_t v24 = malloc_common_convert_to_long(v23, &v116);
    if (*v116 || v24 < 0) {
      malloc_report(3u, (uint64_t)"malloc_max_magazines must be positive - ignored.\n");
    }
    else {
      max_magazines = v24;
    }
  }
  long long v25 = malloc_common_value_for_key_copy(v117, "malloc_large_expanded_cache_threshold", v118, 0x100uLL);
  if (v25)
  {
    v116 = 0;
    uint64_t v26 = malloc_common_convert_to_long(v25, &v116);
    if (*v116 || v26 < 0) {
      malloc_report(3u, (uint64_t)"malloc_large_expanded_cache_threshold must be positive - ignored.\n");
    }
    else {
      magazine_large_expanded_cache_threshold = v26;
    }
  }
  long long v27 = malloc_common_value_for_key_copy(v117, "malloc_zero_on_free_enabled", v118, 0x100uLL);
  if (v27)
  {
    v116 = 0;
    unint64_t v28 = malloc_common_convert_to_long(v27, &v116);
    if (*v116 || v28 > 1) {
      malloc_report(3u, (uint64_t)"malloc_zero_on_free_enabled must be 0 or 1 - ignored.\n");
    }
    else {
      malloc_zero_policy = v28 == 0;
    }
  }
  long long v29 = malloc_common_value_for_key_copy(v117, "malloc_zero_on_free_sample_period", v118, 0x100uLL);
  if (v29)
  {
    v116 = 0;
    uint64_t v30 = malloc_common_convert_to_long(v29, &v116);
    if (*v116 || v30 < 0) {
      malloc_report(3u, (uint64_t)"malloc_zero_on_free_sample_period must be positive - ignored.\n");
    }
    else {
      malloc_zero_on_free_sample_period = v30;
    }
  }
  long long v31 = malloc_common_value_for_key_copy(v117, "malloc_secure_allocator", v118, 0x100uLL);
  if (v31)
  {
    v116 = 0;
    unint64_t v32 = malloc_common_convert_to_long(v31, &v116);
    if (*v116 || v32 > 1) {
      malloc_report(3u, (uint64_t)"malloc_secure_allocator must be 0 or 1 - ignored.\n");
    }
    else {
      malloc_xzone_enabled = v32 != 0;
    }
  }
  mvm_aslr_init();
  j__malloc_default_zone();
  phys_ncpus = MEMORY[0xFFFFFC035];
  int v33 = MEMORY[0xFFFFFC036];
  logical_ncpus = MEMORY[0xFFFFFC036];
  ncpuclusters = MEMORY[0xFFFFFC02F];
  unsigned int v34 = MEMORY[0xFFFFFC036] / MEMORY[0xFFFFFC035];
  if (MEMORY[0xFFFFFC036] % MEMORY[0xFFFFFC035]) {
    __malloc_init_cold_2();
  }
  switch(v34)
  {
    case 1u:
      int v35 = 0;
      break;
    case 4u:
      int v35 = 2;
      break;
    case 2u:
      int v35 = 1;
      break;
    default:
      __malloc_init_cold_1();
  }
  hyper_shift = v35;
  if (max_magazines >= MEMORY[0xFFFFFC036]) {
    int v36 = MEMORY[0xFFFFFC036];
  }
  else {
    int v36 = max_magazines;
  }
  if (max_magazines) {
    int v37 = v36;
  }
  else {
    int v37 = MEMORY[0xFFFFFC036];
  }
  max_magazines = v37;
  if (max_medium_magazines < MEMORY[0xFFFFFC036]) {
    int v33 = max_medium_magazines;
  }
  if (!max_medium_magazines) {
    int v33 = v37;
  }
  max_medium_magazines = v33;
  _malloc_detect_interposition();
  long long v38 = *_NSGetEnviron();
  malloc_debug_flags = 256;
  getprogname();
  if (!_platform_strcmp() && (dyld_program_sdk_at_least() & 1) == 0) {
    malloc_zero_policy = 1;
  }
  getprogname();
  if (!_platform_strcmp() && (dyld_program_sdk_at_least() & 1) == 0) {
    malloc_xzone_enabled = 0;
  }
  if (!*v38)
  {
LABEL_107:
    dyld_process_is_restricted();
    malloc_print_configure();
    unint64_t v41 = 0x1EB1C9000;
    goto LABEL_275;
  }
  long long v39 = v38 + 1;
  while (_platform_strncmp() && _platform_strncmp())
  {
    if (!*v39++) {
      goto LABEL_107;
    }
  }
  unint64_t v41 = 0x1EB1C9000uLL;
  if (!issetugid())
  {
    dyld_process_is_restricted();
    malloc_print_configure();
    if (!getenv("MallocGuardEdges")) {
      goto LABEL_125;
    }
    if (_platform_strcmp())
    {
      malloc_debug_flags = malloc_debug_flags & 0xFFFFFFF8 | 3;
      malloc_report(5u, (uint64_t)"adding guard pages for large allocator blocks\n");
      if (getenv("MallocDoNotProtectPrelude"))
      {
        malloc_debug_flags |= 8u;
        malloc_report(5u, (uint64_t)"... but not protecting prelude guard page\n");
      }
      if (!getenv("MallocDoNotProtectPostlude"))
      {
LABEL_125:
        if (getenv("MallocScribble"))
        {
          malloc_debug_flags |= 0x20u;
          malloc_report(5u, (uint64_t)"enabling scribbling to detect mods to free blocks\n");
        }
        if (getenv("MallocErrorAbort"))
        {
          malloc_debug_flags |= 0x40u;
          malloc_report(5u, (uint64_t)"enabling abort() on bad malloc or free\n");
        }
        if (getenv("MallocTracing")) {
          malloc_tracing_enabled = 1;
        }
        if (getenv("MallocSimpleStackLogging")) {
          malloc_simple_stack_logging = 1;
        }
        if (getenv("MallocReportConfig")) {
          malloc_report_config = 1;
        }
        uint64_t v44 = getenv("MallocCheckHeapStart");
        if (!v44)
        {
LABEL_167:
          uint64_t v55 = getenv("MallocMaxMagazines");
          if (!v55)
          {
            uint64_t v55 = getenv("_MallocMaxMagazines");
            if (!v55) {
              goto LABEL_180;
            }
          }
          unsigned int v56 = strtol(v55, 0, 0);
          if (v56 == 0xFFFF)
          {
            max_magazines = ncpuclusters;
            unint64_t v57 = "Maximum magazines limited to ncpuclusters (%d)\n";
          }
          else if (v56)
          {
            if ((v56 & 0x80000000) != 0)
            {
              unint64_t v57 = "Maximum magazines must be positive - ignored.\n";
              unsigned int v58 = 3;
LABEL_179:
              malloc_report(v58, (uint64_t)v57);
LABEL_180:
              unint64_t v59 = getenv("MallocLargeExpandedCacheThreshold");
              if (v59)
              {
                unint64_t v60 = strtoull(v59, 0, 0);
                if (v60)
                {
                  magazine_large_expanded_cache_threshold = v60;
                  int v61 = "Large expanded cache threshold set to %lly\n";
                }
                else
                {
                  int v61 = "Large expanded cache threshold defaulted to %lly\n";
                }
                malloc_report(5u, (uint64_t)v61);
              }
              int v62 = getenv("MallocLargeDisableASLR");
              if (v62)
              {
                if (strtoull(v62, 0, 0))
                {
                  malloc_report(5u, (uint64_t)"Disabling ASLR slide on large allocations\n");
                  int v63 = malloc_debug_flags | 0x20000000;
                }
                else
                {
                  malloc_report(5u, (uint64_t)"Enabling ASLR slide on large allocations\n");
                  int v63 = malloc_debug_flags & 0xDFFFFFFF;
                }
                malloc_debug_flags = v63;
              }
              int v64 = getenv("MallocSpaceEfficient");
              if (v64)
              {
                uint64_t v65 = v64;
                *(void *)v118 = 0;
                unint64_t v66 = malloc_common_convert_to_long(v64, v118);
                if (*(char **)v118 == v65 || **(unsigned char **)v118 || v66 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocSpaceEfficient must be 0 or 1.\n");
                }
                else
                {
                  aggressive_madvise_enabled = v66 == 1;
                  if (v66) {
                    large_cache_enabled = 0;
                  }
                  malloc_space_efficient_enabled = v66 == 1;
                }
              }
              int v67 = getenv("MallocAggressiveMadvise");
              if (v67)
              {
                uint64_t v68 = v67;
                *(void *)v118 = 0;
                unint64_t v69 = malloc_common_convert_to_long(v67, v118);
                if (*(char **)v118 == v68 || **(unsigned char **)v118 || v69 > 1) {
                  malloc_report(3u, (uint64_t)"MallocAggressiveMadvise must be 0 or 1.\n");
                }
                else {
                  aggressive_madvise_enabled = v69 == 1;
                }
              }
              unsigned int v70 = getenv("MallocLargeCache");
              if (v70)
              {
                uint64_t v71 = v70;
                *(void *)v118 = 0;
                unint64_t v72 = malloc_common_convert_to_long(v70, v118);
                if (*(char **)v118 == v71 || **(unsigned char **)v118 || v72 > 1) {
                  malloc_report(3u, (uint64_t)"MallocLargeCache must be 0 or 1.\n");
                }
                else {
                  large_cache_enabled = v72 == 1;
                }
              }
              uint64_t v73 = getenv("MallocRecircRetainedRegions");
              if (v73)
              {
                int v74 = strtol(v73, 0, 0);
                if (v74 < 1) {
                  malloc_report(3u, (uint64_t)"MallocRecircRetainedRegions must be positive - ignored.\n");
                }
                else {
                  recirc_retained_regions = v74;
                }
              }
              unsigned int v75 = getenv("MallocZeroOnFree");
              if (v75)
              {
                unint64_t v76 = v75;
                *(void *)v118 = 0;
                unint64_t v77 = malloc_common_convert_to_long(v75, v118);
                if (*(char **)v118 == v76 || **(unsigned char **)v118 || v77 > 1) {
                  malloc_report(3u, (uint64_t)"MallocZeroOnFree must be 0 or 1.\n");
                }
                else {
                  malloc_zero_policy = v77 == 0;
                }
              }
              unint64_t v78 = getenv("MallocZeroOnAlloc");
              if (v78)
              {
                unint64_t v79 = v78;
                *(void *)v118 = 0;
                unint64_t v80 = malloc_common_convert_to_long(v78, v118);
                if (*(char **)v118 == v79 || **(unsigned char **)v118 || v80 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocZeroOnAlloc must be 0 or 1.\n");
                }
                else
                {
                  if (v80) {
                    int v81 = 2;
                  }
                  else {
                    int v81 = 1;
                  }
                  malloc_zero_policy = v81;
                }
              }
              int v82 = getenv("MallocCheckZeroOnFreeCorruption");
              if (v82)
              {
                int v83 = strtol(v82, 0, 0);
                if (v83 < 1) {
                  malloc_report(3u, (uint64_t)"malloc_zero_on_free_sample_period must be positive - ignored.\n");
                }
                else {
                  malloc_zero_on_free_sample_period = v83;
                }
              }
              unint64_t v84 = getenv("MallocSecureAllocator");
              if (v84 && malloc_internal_security_policy)
              {
                unsigned int v85 = v84;
                *(void *)v118 = 0;
                unint64_t v86 = malloc_common_convert_to_long(v84, v118);
                if (*(char **)v118 == v85 || **(unsigned char **)v118 || v86 > 1) {
                  malloc_report(3u, (uint64_t)"MallocSecureAllocator must be 0 or 1.\n");
                }
                else {
                  malloc_xzone_enabled = v86 != 0;
                }
              }
              uint64_t v87 = getenv("MallocSecureAllocatorNano");
              if (v87)
              {
                unsigned int v88 = v87;
                *(void *)v118 = 0;
                unint64_t v89 = malloc_common_convert_to_long(v87, v118);
                if (*(char **)v118 == v88 || **(unsigned char **)v118 || v89 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocSecureAllocatorNano must be 0 or 1.\n");
                }
                else
                {
                  if (v89) {
                    int v90 = 2;
                  }
                  else {
                    int v90 = 1;
                  }
                  malloc_xzone_nano_override = v90;
                }
              }
              unsigned int v91 = getenv("MallocNanoOnXzone");
              if (v91)
              {
                BOOL v92 = v91;
                *(void *)v118 = 0;
                unint64_t v93 = malloc_common_convert_to_long(v91, v118);
                if (*(char **)v118 == v92 || **(unsigned char **)v118 || v93 > 1)
                {
                  malloc_report(3u, (uint64_t)"MallocNanoOnXzone must be 0 or 1.\n");
                }
                else
                {
                  if (v93) {
                    int v94 = 2;
                  }
                  else {
                    int v94 = 1;
                  }
                  malloc_nano_on_xzone_override = v94;
                }
              }
              int v95 = getenv("MallocSecureAllocatorCreateMzones");
              int v96 = malloc_internal_security_policy;
              if (v95 && malloc_internal_security_policy)
              {
                size_t v97 = v95;
                *(void *)v118 = 0;
                unint64_t v98 = malloc_common_convert_to_long(v95, v118);
                if (*(char **)v118 == v97 || **(unsigned char **)v118 || v98 > 1) {
                  malloc_report(3u, (uint64_t)"MallocSecureAllocatorCreateMzones must be 0 or 1.\n");
                }
                else {
                  xzm_create_mzones = v98 != 0;
                }
                int v96 = malloc_internal_security_policy;
              }
              unint64_t v99 = getenv("MallocSecureAllocatorPurgeableZone");
              if (v99 && v96)
              {
                unint64_t v100 = v99;
                *(void *)v118 = 0;
                unint64_t v101 = malloc_common_convert_to_long(v99, v118);
                if (*(char **)v118 == v100 || **(unsigned char **)v118 || v101 > 1) {
                  malloc_report(3u, (uint64_t)"MallocSecureAllocatorPurgeableZone must be 0 or 1.\n");
                }
                else {
                  purgeable_zone_use_xzm = v101 != 0;
                }
              }
              if (getenv("MallocHelp")) {
                malloc_report(5u, (uint64_t)"environment variables that can be set for debug:\n- MallocLogFile <f> to create/append messages to file <f> instead of stderr\n- MallocGuardEdges to add 2 guard pages for each large block\n- MallocDoNotProtectPrelude to disable protection (when previous flag set)\n- MallocDoNotProtectPostlude to disable protection (when previous flag set)\n- MallocStackLogging to record all stacks.  Tools like leaks can then be applied\n- MallocStackLoggingNoCompact to record all stacks.  Needed for malloc_history\n- MallocStackLoggingDirectory to set location of stack logs, which can grow large; default is"
              }
                           " /tmp\n"
                           "- MallocScribble to detect writing on free blocks and missing initializers:\n"
                           "  0x55 is written upon free and 0xaa is written on allocation\n"
                           "- MallocCheckHeapStart <n> to start checking the heap after <n> operations\n"
                           "- MallocCheckHeapEach <s> to repeat the checking of the heap after <s> operations\n"
                           "- MallocCheckHeapSleep <t> to sleep <t> seconds on heap corruption\n"
                           "- MallocCheckHeapAbort <b> to abort on heap corruption if <b> is non-zero\n"
                           "- MallocCorruptionAbort to abort on malloc errors, but not on out of memory for 32-bit proces"
                           "ses\n"
                           "  MallocCorruptionAbort is always set on 64-bit processes\n"
                           "- MallocErrorAbort to abort on any malloc error, including out of memory\n"
                           "- MallocTracing to emit kdebug trace points on malloc entry points\n"
                           "- MallocZeroOnFree to enable or disable zero-on-free behavior (for debugging only)\n"
                           "- MallocCheckZeroOnFreeCorruption to enable zero-on-free corruption detection\n"
                           "- MallocHelp - this help!\n");
              goto LABEL_275;
            }
            if (logical_ncpus >= v56)
            {
              max_magazines = v56;
              unint64_t v57 = "Maximum magazines set to %d\n";
            }
            else
            {
              max_magazines = logical_ncpus;
              unint64_t v57 = "Maximum magazines limited to number of logical CPUs (%d)\n";
            }
          }
          else
          {
            unint64_t v57 = "Maximum magazines defaulted to %d\n";
          }
          unsigned int v58 = 5;
          goto LABEL_179;
        }
        unsigned int v45 = strtoul(v44, 0, 0);
        if (v45 <= 1) {
          int v46 = 1;
        }
        else {
          int v46 = v45;
        }
        if (v46 == -1) {
          int v47 = 1;
        }
        else {
          int v47 = v46;
        }
        malloc_check_start = v47;
        uint64_t v48 = getenv("MallocCheckHeapEach");
        if (v48)
        {
          unsigned int v49 = strtoul(v48, 0, 0);
          if (v49 <= 1) {
            int v50 = 1;
          }
          else {
            int v50 = v49;
          }
          if (v50 == -1) {
            int v50 = 1;
          }
          malloc_check_each = v50;
        }
        malloc_report(5u, (uint64_t)"checks heap after operation #%d and each %d operations\n");
        int v51 = getenv("MallocCheckHeapAbort");
        if (v51)
        {
          malloc_check_abort = strtol(v51, 0, 0);
          if (malloc_check_abort)
          {
LABEL_151:
            int v52 = "will abort on heap corruption\n";
LABEL_166:
            malloc_report(5u, (uint64_t)v52);
            goto LABEL_167;
          }
        }
        else if (malloc_check_abort)
        {
          goto LABEL_151;
        }
        mach_vm_address_t v53 = getenv("MallocCheckHeapSleep");
        if (v53)
        {
          int v54 = strtol(v53, 0, 0);
          malloc_check_sleep = v54;
        }
        else
        {
          int v54 = malloc_check_sleep;
        }
        if (v54 < 1)
        {
          if (v54 < 0) {
            int v52 = "will sleep once for %d seconds on heap corruption\n";
          }
          else {
            int v52 = "no sleep on heap corruption\n";
          }
        }
        else
        {
          int v52 = "will sleep for %d seconds on heap corruption\n";
        }
        goto LABEL_166;
      }
      int v42 = malloc_debug_flags | 0x10;
      long long v43 = "... but not protecting postlude guard page\n";
    }
    else
    {
      int v42 = malloc_debug_flags & 0xFFFFFFE0 | 7;
      long long v43 = "adding guard pages to all regions\n";
    }
    malloc_debug_flags = v42;
    malloc_report(5u, (uint64_t)v43);
    goto LABEL_125;
  }
LABEL_275:
  malloc_sanitizer_enabled = sanitizer_should_enable();
  unsigned __int8 v102 = (uint64_t *)_NSGetEnviron();
  uint64_t v103 = *v102;
  if (!malloc_sanitizer_enabled && !(malloc_debug_flags & 0x20 | malloc_zero_on_free_sample_period)) {
    nano_common_init(*v102, (uint64_t)a1, v117);
  }
  char v104 = _os_feature_enabled_simple_impl();
  if ((*(_DWORD *)(v41 + 1304) - 1) < 0x1F) {
    char v105 = 1;
  }
  else {
    char v105 = v104;
  }
  if (malloc_xzone_nano_override == 2)
  {
    char v105 = 1;
  }
  else if (malloc_xzone_nano_override == 1)
  {
    char v105 = 0;
  }
  if (malloc_nano_on_xzone_override == 2) {
    char v106 = 0;
  }
  else {
    char v106 = v105;
  }
  int v107 = malloc_xzone_enabled;
  if (malloc_xzone_enabled) {
    BOOL v108 = _malloc_engaged_nano == 2;
  }
  else {
    BOOL v108 = 0;
  }
  if (v108) {
    char v109 = v106;
  }
  else {
    char v109 = 1;
  }
  if ((v109 & 1) == 0)
  {
    int v110 = _os_feature_enabled_simple_impl();
    if (malloc_nano_on_xzone_override == 2)
    {
      int v110 = 1;
    }
    else if (malloc_nano_on_xzone_override == 1)
    {
      int v110 = 0;
    }
    if (malloc_nano_on_xzone != v110) {
      malloc_nano_on_xzone = v110;
    }
    if (!v110)
    {
      char v111 = 0;
      malloc_xzone_enabled = 0;
      goto LABEL_306;
    }
    int v107 = malloc_xzone_enabled;
  }
  char v111 = v109 ^ 1;
  if (v107)
  {
    mfm_initialize();
    initial_xzone_zone = xzm_main_malloc_zone_create(malloc_debug_flags, v103, (uint64_t)a1, v117);
    malloc_set_zone_name((malloc_zone_t *)initial_xzone_zone, "DefaultMallocZone");
    malloc_zone_register_while_locked(initial_xzone_zone, 1);
  }
LABEL_306:
  if ((v111 & 1) == 0 && initial_xzone_zone) {
    goto LABEL_320;
  }
  if (!initial_xzone_zone)
  {
    initial_scalable_zone = create_scalable_zone(0, malloc_debug_flags);
    malloc_set_zone_name((malloc_zone_t *)initial_scalable_zone, "DefaultMallocZone");
    malloc_zone_register_while_locked(initial_scalable_zone, 1);
  }
  nano_common_configure();
  if (initial_xzone_zone) {
    v112 = (malloc_zone_t *)initial_xzone_zone;
  }
  else {
    v112 = (malloc_zone_t *)initial_scalable_zone;
  }
  if (_malloc_engaged_nano != 2)
  {
    zone = (malloc_zone_t *)initial_nano_zone;
    if (!initial_nano_zone) {
      goto LABEL_320;
    }
    goto LABEL_319;
  }
  if (malloc_report_config == 1) {
    malloc_report(5u, (uint64_t)"NanoV2 Config:\n\tNano On Xzone: %d\n");
  }
  zone = (malloc_zone_t *)nanov2_create_zone((uint64_t)v112, malloc_debug_flags);
  initial_nano_zone = (uint64_t)zone;
  if (zone)
  {
LABEL_319:
    malloc_set_zone_name(zone, "DefaultMallocZone");
    malloc_set_zone_name(v112, "MallocHelperZone");
    malloc_zone_register_while_locked(initial_nano_zone, 1);
  }
LABEL_320:
  if (malloc_sanitizer_enabled)
  {
    mach_vm_address_t v114 = sanitizer_create_zone(*(void *)malloc_zones);
    malloc_zone_register_while_locked(v114, 1);
  }
  malloc_slowpath_update();
  initial_num_zones = malloc_num_zones;
  if (large_cache_enabled)
  {
    if (initial_xzone_zone)
    {
      large_cache_enabled = 0;
    }
    else if (mvm_deferred_reclaim_init())
    {
      large_cache_enabled = 0;
      malloc_report(3u, (uint64_t)"Unable to set up reclaim buffer (%d) - disabling large cache\n");
    }
  }
  if (malloc_report_config == 1)
  {
    if (initial_scalable_zone) {
      malloc_report(5u, (uint64_t)"Magazine Config:\n\tMax Magazines: %d\n\tMedium Enabled: %d\n\tAggressive Madvise: %d\n\tLarge Cache: %d%s\n\tScribble: %d\n");
    }
  }
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)default_zone;
}

unsigned char *malloc_common_value_for_key_copy(unsigned __int8 *a1, char *a2, unsigned char *a3, unint64_t a4)
{
  unint64_t v6 = malloc_common_value_for_key(a1, a2);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = a3;
  if (a4 >= 2)
  {
    uint64_t v7 = a3;
    do
    {
      unsigned int v8 = *v6;
      if (v8 <= 0x20 && ((1 << v8) & 0x100000601) != 0) {
        break;
      }
      ++v6;
      *v7++ = v8;
      --a4;
    }
    while (a4 > 1);
  }
  *uint64_t v7 = 0;
  return a3;
}

unsigned __int8 *malloc_common_value_for_key(unsigned __int8 *a1, char *__s)
{
  size_t v3 = strlen(__s);
  int v4 = *a1;
  while (v4)
  {
    if (_platform_strncmp())
    {
      int v5 = *++a1;
      int v4 = v5;
    }
    else
    {
      if (v3) {
        a1 += v3;
      }
      int v4 = *a1;
      if (v4 == 61) {
        return a1 + 1;
      }
    }
  }
  return 0;
}

void malloc_zone_register_while_locked(uint64_t a1, char a2)
{
  if (malloc_num_zones)
  {
    int v4 = malloc_zones;
    int v5 = malloc_num_zones;
    while (*v4 != a1)
    {
      ++v4;
      if (!--v5) {
        goto LABEL_5;
      }
    }
    unint64_t v10 = "Attempted to register zone more than once: %p\n";
    goto LABEL_10;
  }
LABEL_5:
  if (malloc_num_zones == malloc_num_zones_allocated)
  {
    size_t v6 = 8 * malloc_num_zones;
    uint64_t v7 = (void *)MEMORY[0x1E4F14C80];
    mach_vm_size_t v8 = (v6 - 1 + 2 * *MEMORY[0x1E4F14C80]) & -*MEMORY[0x1E4F14C80];
    mach_vm_address_t address = *MEMORY[0x1E4F14C80];
    int v9 = (vm_map_t *)MEMORY[0x1E4F14C48];
    if (mach_vm_allocate(*MEMORY[0x1E4F14C48], &address, v8, 16777217))
    {
      unint64_t v10 = "malloc_zone_register allocation failed: %d\n";
LABEL_10:
      malloc_report(3u, (uint64_t)v10);
      return;
    }
    uint64_t v11 = (void *)address;
    if (malloc_zones)
    {
      memcpy((void *)address, malloc_zones, v6);
      mach_vm_address_t address = (mach_vm_address_t)malloc_zones;
      mach_vm_deallocate(*v9, (mach_vm_address_t)malloc_zones, (v6 - 1 + *v7) & -*v7);
    }
    malloc_zones = v11;
    malloc_num_zones_allocated = v8 >> 3;
  }
  else
  {
    mach_vm_size_t v8 = 8 * malloc_num_zones_allocated;
    mprotect(malloc_zones, v8, 3);
  }
  if (a2)
  {
    memcpy((char *)malloc_zones + 8, malloc_zones, 8 * malloc_num_zones);
    *(void *)malloc_zones = a1;
    atomic_fetch_add(&malloc_num_zones, 1u);
    mprotect(malloc_zones, v8, 1);
    if (*(void *)malloc_zones != a1)
    {
      has_injected_zone0 = 1;
      malloc_slowpath_update();
    }
  }
  else
  {
    *((void *)malloc_zones + malloc_num_zones) = a1;
    atomic_fetch_add(&malloc_num_zones, 1u);
    mprotect(malloc_zones, v8, 1);
  }
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
  if (zone->version >= 0xE && zone->introspect->zone_type == 1)
  {
    char v4 = 1;
  }
  else
  {
    mprotect(zone, 0xC8uLL, 3);
    char v4 = 0;
  }
  zone_name = zone->zone_name;
  if (zone_name)
  {
    if (!malloc_num_zones)
    {
LABEL_24:
      zone->zone_name = 0;
      goto LABEL_25;
    }
    if (lite_zone && (*(uint64_t (**)(void))(lite_zone + 16))()) {
      goto LABEL_9;
    }
    if (initial_num_zones)
    {
      uint64_t v7 = 0;
      while (1)
      {
        size_t v6 = (uint64_t (**)(void *, const char *))*((void *)malloc_zones + v7);
        if (v6[2](v6, zone_name)) {
          break;
        }
        if (++v7 >= (unint64_t)initial_num_zones) {
          goto LABEL_15;
        }
      }
      if (!v7 && (has_injected_zone0 & 1) == 0)
      {
LABEL_9:
        size_t v6 = (uint64_t (**)(void *, const char *))default_zone;
        if (!default_zone) {
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_15:
      mach_vm_size_t v8 = (atomic_uint *)pFRZCounterLive;
      atomic_fetch_add((atomic_uint *volatile)pFRZCounterLive, 1u);
      uint64_t v9 = malloc_num_zones;
      uint64_t v10 = initial_num_zones;
      if (initial_num_zones >= malloc_num_zones)
      {
LABEL_18:
        size_t v6 = 0;
      }
      else
      {
        while (1)
        {
          size_t v6 = (uint64_t (**)(void *, const char *))*((void *)malloc_zones + v10);
          if (v6[2](v6, zone_name)) {
            break;
          }
          if (v9 == ++v10) {
            goto LABEL_18;
          }
        }
      }
      atomic_fetch_add(v8, 0xFFFFFFFF);
      if (!v6) {
        goto LABEL_24;
      }
    }
    malloc_zone_free((malloc_zone_t *)v6, (void *)zone->zone_name);
    goto LABEL_24;
  }
LABEL_25:
  if (!name) {
    goto LABEL_37;
  }
  unint64_t v11 = strlen(name) + 1;
  uint64_t v12 = name;
  if ((_dyld_is_memory_immutable() & 1) == 0)
  {
    uint64_t v13 = _malloc_zone_malloc((uint64_t)zone, v11, 0);
    if (!v13) {
      goto LABEL_30;
    }
    uint64_t v12 = (const char *)v13;
    _platform_strcpy();
  }
  zone->zone_name = v12;
LABEL_30:
  uint64_t wrapped_zone = get_wrapped_zone((uint64_t)zone);
  if (wrapped_zone)
  {
    if (zone->version <= 0xD) {
      purgeable_ptr_in_use_enumerator_cold_1();
    }
    char v15 = (malloc_zone_t *)wrapped_zone;
    if (zone->introspect->zone_type == 2) {
      uint64_t v16 = "PGM";
    }
    else {
      uint64_t v16 = "Sanitizer";
    }
    size_t v17 = strlen(name);
    size_t v18 = strlen(v16);
    size_t v19 = strlen("Wrapped");
    uint64_t v20 = _malloc_zone_malloc((uint64_t)v15, v17 + v19 + v18 + 3, 0);
    if (v20)
    {
      long long v21 = (char *)v20;
      _platform_strcpy();
      *(_WORD *)&v21[strlen(v21)] = 45;
      uint64_t v22 = strcat(v21, v16);
      *(_WORD *)&v21[strlen(v22)] = 45;
      *(void *)&v21[strlen(v21)] = 0x64657070617257;
      malloc_set_zone_name(v15, v21);
      malloc_zone_free(v15, v21);
    }
  }
LABEL_37:
  if ((v4 & 1) == 0)
  {
    mprotect(zone, 0xC8uLL, 1);
  }
}

uint64_t get_wrapped_zone(uint64_t a1)
{
  uint64_t v2 = 0;
  if (malloc_get_wrapped_zone(*MEMORY[0x1E4F14C48], 0, a1, &v2)) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  return v2;
}

uint64_t malloc_get_wrapped_zone(uint64_t task, uint64_t (*a2)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t a3, void *a4)
{
  size_t v6 = a2;
  if (!a2)
  {
    if (task && !mach_task_is_self(task)) {
      purgeable_ptr_in_use_enumerator_cold_1();
    }
    size_t v6 = _malloc_default_reader_5;
  }
  *a4 = 0;
  int v10 = 0;
  uint64_t result = get_zone_type(task, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _DWORD **))v6, a3, &v10);
  if (!result)
  {
    if ((v10 - 4) >= 0xFFFFFFFE)
    {
      uint64_t v9 = 0;
      uint64_t result = v6(task, a3 + 200, 8, &v9);
      if (!result) {
        *a4 = *(void *)v9;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t get_zone_type(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, _DWORD **), uint64_t a3, _DWORD *a4)
{
  if (!a2) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  *a4 = 0;
  uint64_t v10 = 0;
  uint64_t result = a2(a1, a3, 200, (_DWORD **)&v10);
  if (!result)
  {
    if (*(_DWORD *)(v10 + 104) >= 0xEu)
    {
      uint64_t v8 = *(void *)(v10 + 96) + 128;
      uint64_t v9 = 0;
      uint64_t result = a2(a1, v8, 4, &v9);
      if (!result) {
        *a4 = *v9;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL _malloc_allow_internal_security_policy()
{
  return MEMORY[0xFFFFF4084] != 0;
}

uint64_t xzm_main_malloc_zone_create(unsigned int a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  kern_return_t v42;
  const char *v43;
  unint64_t v44;
  BOOL v45;
  __int16 v46;
  __int16 v47;
  BOOL v48;
  const char *v49;
  unint64_t v50;
  const char *v51;
  unint64_t v52;
  BOOL v53;
  __int16 v54;
  BOOL v55;
  int v56;
  const char *v57;
  unsigned int v58;
  BOOL v59;
  const char *v60;
  unint64_t v61;
  const char *v62;
  unint64_t v63;
  const char *v64;
  char v65;
  char v66;
  char v67;
  char v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  unint64_t v73;
  int v74;
  int v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  unint64_t v85;
  const char *v86;
  unint64_t v87;
  int v88;
  const char *v89;
  unint64_t v90;
  unsigned int v91;
  const char *v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  mach_vm_address_t plat;
  uint64_t v99;
  unint64_t v100;
  char v101;
  char v102;
  char v103;
  char v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  __int16 v108;
  int v109;
  unint64_t v110;
  uint64_t v111;
  char v112;
  _DWORD *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _DWORD *v123;
  uint64_t v124;
  char v126;
  BOOL v127;
  char v128;
  char v129;
  char v130;
  uint64_t v131;
  char v132;
  uint64_t denom;
  unint64_t numer;
  uint64_t v135;
  uint64_t v136;
  __int16 v137;
  int v138;
  unsigned int v139;
  char v140;
  BOOL v141;
  uint64_t v142;
  BOOL v143;
  unint64_t v144;
  unsigned int v145;
  int v146;
  char v147;
  char v148;
  int v149;
  BOOL v150;
  size_t v151;
  uint64_t v152;
  mach_timebase_info info;
  long long __buf;
  long long v155;
  char __dst[256];
  uint64_t v157;

  v157 = *MEMORY[0x1E4F14BF8];
  __buf = 0uLL;
  size_t v6 = (const char *)_simple_getenv();
  if (v6)
  {
    uint64_t v7 = v6;
    size_t v8 = strlen(v6);
    if (v8 <= 0x1F) {
      xzm_main_malloc_zone_create_cold_7(v8);
    }
    uint64_t v9 = 0;
    char v10 = 1;
    do
    {
      char v11 = v10;
      memcpy(__dst, &v7[16 * v9], 0x10uLL);
      __dst[16] = 0;
      unint64_t v12 = strtoull(__dst, 0, 16);
      unint64_t v13 = v12;
      if (v12 == -1)
      {
        if (*__error() == 34) {
          goto LABEL_246;
        }
      }
      else if (!v12 && *__error() == 22)
      {
LABEL_246:
        xzm_main_malloc_zone_create_cold_8();
      }
      char v10 = 0;
      *((void *)&__buf + v9) = v13;
      uint64_t v9 = 1;
    }
    while ((v11 & 1) != 0);
  }
  else
  {
    if ((malloc_process_identity - 1) <= 0x1E) {
      xzm_main_malloc_zone_create_cold_1();
    }
    arc4random_buf(&__buf, 0x10uLL);
  }
  if (malloc_process_identity) {
    uint64_t v14 = (char *)_xzm_process_configs[malloc_process_identity];
  }
  else {
    uint64_t v14 = 0;
  }
  char v15 = malloc_common_value_for_key_copy(a4, "xzone_ptr_buckets", __dst, 0x100uLL);
  if (!v15) {
    goto LABEL_21;
  }
  info = 0;
  uint64_t v16 = malloc_common_convert_to_long(v15, &info);
  unint64_t v17 = v16;
  if (*(unsigned char *)info.numer || v16 < 1 || v16 >= 5)
  {
    malloc_report(3u, (uint64_t)"Invalid xzone_ptr_buckets value %ld - ignored.\n");
LABEL_21:
    unint64_t v17 = 0;
  }
  if ((malloc_process_identity - 1) >= 0x1F)
  {
    size_t v18 = (const char *)_simple_getenv();
    if (!v18) {
      goto LABEL_29;
    }
    uint64_t v19 = strtol(v18, 0, 10);
    unint64_t v17 = v19;
    if (v19 == 1)
    {
      char v20 = 0;
      goto LABEL_31;
    }
    if (v19 != 0xFFFF && v19 != 2)
    {
LABEL_29:
      unint64_t v17 = 2;
      char v20 = 2;
      goto LABEL_31;
    }
    unint64_t v17 = 1;
  }
  char v20 = 1;
LABEL_31:
  if (malloc_internal_security_policy)
  {
    long long v21 = (const char *)_simple_getenv();
    if (v21)
    {
      unint64_t v22 = strtol(v21, 0, 10);
      if (v22 < 5) {
        unint64_t v17 = v22;
      }
    }
  }
  if (v17)
  {
    if (v17 >= 5) {
      xzm_main_malloc_zone_create_cold_6();
    }
    uint64_t v23 = 40 * v17 + 81;
    if (v14) {
      goto LABEL_38;
    }
LABEL_40:
    BOOL v24 = 0;
    goto LABEL_41;
  }
  uint64_t v23 = 201;
  if (!v14) {
    goto LABEL_40;
  }
LABEL_38:
  BOOL v24 = v14[1] != 0;
LABEL_41:
  if (malloc_internal_security_policy)
  {
    long long v25 = (const char *)_simple_getenv();
    if (v25)
    {
      unint64_t v26 = strtol(v25, 0, 10);
      if (v26 < 2) {
        BOOL v24 = v26 != 0;
      }
    }
  }
  v144 = v17;
  if (v14) {
    BOOL v27 = v14[2] == 0;
  }
  else {
    BOOL v27 = 1;
  }
  v143 = v27;
  if (_malloc_engaged_nano == 2 && (malloc_process_identity - 32) < 0xFFFFFFE1) {
    char v20 = 2;
  }
  if (v14 && *v14 != 3) {
    char v20 = *v14;
  }
  long long v29 = malloc_common_value_for_key_copy(a4, "malloc_xzone_slot_config", __dst, 0x100uLL);
  if (v29)
  {
    unint64_t v30 = strtol(v29, 0, 10);
    if (v30 < 3) {
      char v20 = v30;
    }
  }
  v141 = v24;
  if (!malloc_internal_security_policy) {
    goto LABEL_69;
  }
  long long v31 = (const char *)_simple_getenv();
  if (v31)
  {
    unint64_t v32 = strtol(v31, 0, 10);
    if (v32 < 3) {
      char v20 = v32;
    }
  }
  if (!malloc_internal_security_policy)
  {
LABEL_69:
    v140 = 0;
LABEL_70:
    int v36 = 1024;
    v145 = 256;
    v146 = 64;
    goto LABEL_71;
  }
  int v33 = (const char *)_simple_getenv();
  if (v33)
  {
    unint64_t v34 = strtol(v33, 0, 10);
    if (v34 >= 3) {
      char v35 = 0;
    }
    else {
      char v35 = v34;
    }
    v140 = v35;
  }
  else
  {
    v140 = 0;
  }
  if (!malloc_internal_security_policy) {
    goto LABEL_70;
  }
  unint64_t v72 = (const char *)_simple_getenv();
  if (v72)
  {
    uint64_t v73 = strtol(v72, 0, 10);
    if (v73 >= 0xFFFFFFFF) {
      int v74 = 256;
    }
    else {
      int v74 = v73;
    }
    if (v73 >= 0xFFFFFFFF) {
      unsigned int v75 = 64;
    }
    else {
      unsigned int v75 = v73;
    }
    v145 = v74;
    v146 = v75;
  }
  else
  {
    v146 = 64;
    v145 = 256;
  }
  if (!malloc_internal_security_policy) {
    goto LABEL_199;
  }
  unint64_t v86 = (const char *)_simple_getenv();
  if (v86)
  {
    uint64_t v87 = strtol(v86, 0, 10);
    if (v87 >= 0xFFFFFFFF) {
      unsigned int v88 = v146;
    }
    else {
      unsigned int v88 = v87;
    }
    v146 = v88;
  }
  if (!malloc_internal_security_policy) {
    goto LABEL_199;
  }
  unint64_t v89 = (const char *)_simple_getenv();
  if (v89)
  {
    int v90 = strtol(v89, 0, 10);
    if (v90 >= 0xFFFFFFFF) {
      unsigned int v91 = v145;
    }
    else {
      unsigned int v91 = v90;
    }
    v145 = v91;
  }
  if (malloc_internal_security_policy)
  {
    BOOL v92 = (const char *)_simple_getenv();
    int v36 = 1024;
    if (v92)
    {
      unint64_t v93 = strtol(v92, 0, 10);
      if (v93 >= 0xFFFFFFFF) {
        int v36 = 1024;
      }
      else {
        int v36 = v93;
      }
    }
  }
  else
  {
LABEL_199:
    int v36 = 1024;
  }
LABEL_71:
  if (v20)
  {
    if (v20 == 2) {
      goto LABEL_76;
    }
    if (v20 != 1) {
      xzm_main_malloc_zone_create_cold_2();
    }
    unsigned __int8 v37 = ncpuclusters;
    if (ncpuclusters <= 1)
    {
LABEL_76:
      unsigned __int8 v37 = logical_ncpus;
      char v38 = 2;
    }
    else
    {
      char v38 = 1;
    }
    v148 = v38;
  }
  else
  {
    v148 = v20;
    unsigned __int8 v37 = 1;
  }
  uint64_t v39 = 1000000;
  if (malloc_internal_security_policy)
  {
    long long v40 = (const char *)_simple_getenv();
    if (v40)
    {
      unint64_t v41 = strtol(v40, 0, 10);
      if (v41 < 0xFFFFFFFF) {
        uint64_t v39 = 1000000 * v41;
      }
    }
  }
  info = 0;
  int v42 = mach_timebase_info(&info);
  if (v42) {
    xzm_main_malloc_zone_create_cold_5(v42);
  }
  denom = info.denom;
  numer = info.numer;
  long long v43 = (const char *)_simple_getenv();
  v139 = a1;
  if (!v43) {
    goto LABEL_88;
  }
  uint64_t v44 = strtol(v43, 0, 10);
  if (v44 > 1)
  {
    malloc_report(3u, (uint64_t)"MallocLargeCache must be 0 or 1.\n");
LABEL_88:
    int v46 = 0;
    unsigned int v45 = 0;
    goto LABEL_89;
  }
  unsigned int v45 = v44 == 1;
  int v46 = 16 * v45;
LABEL_89:
  if (_malloc_engaged_nano == 2) {
    int v47 = v46;
  }
  else {
    int v47 = 0;
  }
  uint64_t v48 = _malloc_engaged_nano == 2 && v45;
  v135 = v39;
  if (!malloc_internal_security_policy) {
    goto LABEL_104;
  }
  unsigned int v49 = (const char *)_simple_getenv();
  if (v49)
  {
    int v50 = strtol(v49, 0, 10);
    if (v50 >> 16) {
      malloc_report(3u, (uint64_t)"xzm: unsupported value for MallocXzoneHugeCacheSize (%ld)");
    }
    else {
      int v47 = v50;
    }
  }
  if (!malloc_internal_security_policy)
  {
LABEL_104:
    mach_vm_address_t v53 = 0;
    goto LABEL_105;
  }
  int v51 = (const char *)_simple_getenv();
  if (!v51) {
    goto LABEL_176;
  }
  int v52 = strtol(v51, 0, 10);
  if (v52 > 1)
  {
    malloc_report(3u, (uint64_t)"MallocDeferredReclaim must be one of 0,1 - got %ld\n");
LABEL_176:
    mach_vm_address_t v53 = 0;
    goto LABEL_177;
  }
  mach_vm_address_t v53 = v52 == 1;
  uint64_t v48 = v53;
LABEL_177:
  if (malloc_internal_security_policy)
  {
    unint64_t v84 = (const char *)_simple_getenv();
    if (v84)
    {
      unsigned int v85 = strtol(v84, 0, 10);
      if (v85 > 1) {
        malloc_report(3u, (uint64_t)"MallocDeferredReclaim must be one of 0,1 - got %ld\n");
      }
      else {
        uint64_t v48 = v85 == 1;
      }
    }
  }
LABEL_105:
  if ((malloc_process_identity - 32) >= 0xFFFFFFE1) {
    int v54 = 0;
  }
  else {
    int v54 = v47;
  }
  uint64_t v55 = (malloc_process_identity - 32) < 0xFFFFFFE1 && v53;
  v150 = v55;
  unsigned int v56 = (malloc_process_identity - 32) < 0xFFFFFFE1 && v48;
  v137 = v54;
  if (v54 && !v56)
  {
    unint64_t v57 = "Huge cache requires deferred reclamation for large.\n";
LABEL_119:
    malloc_report(3u, (uint64_t)v57);
    unsigned int v56 = 1;
    goto LABEL_120;
  }
  if (((!v150 | v56) & 1) == 0)
  {
    unint64_t v57 = "Deferred reclamation cannot be used for xzones without large\n";
    goto LABEL_119;
  }
LABEL_120:
  v149 = v56;
  unsigned int v58 = malloc_process_identity - 1;
  unint64_t v59 = (malloc_process_identity - 1) < 0x1F;
  if (malloc_internal_security_policy)
  {
    unint64_t v60 = (const char *)_simple_getenv();
    if (v60)
    {
      unint64_t v59 = v58 < 0x1F;
      int v61 = strtol(v60, 0, 10);
      if (v61 < 2) {
        unint64_t v59 = v61 != 0;
      }
    }
  }
  int v62 = malloc_common_value_for_key_copy(a4, "xzone_guard_pages", __dst, 0x100uLL);
  v138 = v36;
  if (v62)
  {
    int v63 = strtol(v62, 0, 10);
    if (v63 > 1)
    {
      malloc_report(3u, (uint64_t)"%s must be 0 or 1.\n");
      if (!v59)
      {
LABEL_134:
        v147 = 0;
        LOBYTE(v59) = 0;
        goto LABEL_135;
      }
    }
    else if (!v63)
    {
      goto LABEL_134;
    }
  }
  else if (!v59)
  {
    v147 = 0;
LABEL_135:
    uint64_t v65 = 0;
    unint64_t v66 = 0;
    int v67 = 0;
    uint64_t v68 = 0;
    goto LABEL_136;
  }
  if (!malloc_internal_security_policy)
  {
    v130 = 8;
    unint64_t v59 = 1;
LABEL_201:
    unint64_t v66 = 64;
LABEL_202:
    int v67 = 3;
LABEL_203:
    v128 = v67;
    v129 = v66;
    v126 = 32;
    v127 = v59;
    v147 = 1;
    goto LABEL_204;
  }
  int v64 = (const char *)_simple_getenv();
  if (v64) {
    unint64_t v59 = strtol(v64, 0, 10) != 0;
  }
  else {
    unint64_t v59 = 1;
  }
  if (!malloc_internal_security_policy)
  {
    v130 = 8;
    goto LABEL_201;
  }
  unint64_t v76 = (const char *)_simple_getenv();
  uint64_t v65 = 8;
  if (v76)
  {
    unint64_t v77 = strtol(v76, 0, 10);
    if (v77 <= 0) {
      uint64_t v65 = 8;
    }
    else {
      uint64_t v65 = v77;
    }
  }
  if (!malloc_internal_security_policy)
  {
    v130 = v65;
    goto LABEL_201;
  }
  unint64_t v78 = (const char *)_simple_getenv();
  unint64_t v66 = 64;
  if (v78)
  {
    unint64_t v79 = strtol(v78, 0, 10);
    if (v79 <= 0) {
      unint64_t v66 = 64;
    }
    else {
      unint64_t v66 = v79;
    }
  }
  if (!malloc_internal_security_policy)
  {
    v130 = v65;
    goto LABEL_202;
  }
  unint64_t v80 = (const char *)_simple_getenv();
  int v67 = 3;
  if (v80)
  {
    int v81 = strtol(v80, 0, 10);
    if (v81 <= 0) {
      int v67 = 3;
    }
    else {
      int v67 = v81;
    }
  }
  if (!malloc_internal_security_policy)
  {
    v130 = v65;
    goto LABEL_203;
  }
  int v82 = (const char *)_simple_getenv();
  LOBYTE(v59) = v59;
  uint64_t v68 = 32;
  if (v82)
  {
    int v83 = strtol(v82, 0, 10);
    if (v83 <= 0) {
      uint64_t v68 = 32;
    }
    else {
      uint64_t v68 = v83;
    }
  }
  v147 = 1;
LABEL_136:
  v129 = v66;
  v130 = v65;
  v127 = v59;
  v128 = v67;
  v126 = v68;
  if (malloc_internal_security_policy)
  {
    unint64_t v69 = (const char *)_simple_getenv();
    if (v69)
    {
      unsigned int v70 = strtol(v69, 0, 10);
      if (v70)
      {
        if (v70 == 1)
        {
          uint64_t v71 = 2;
          goto LABEL_205;
        }
        malloc_report(3u, (uint64_t)"MallocXzoneDataOnly must be 0 or 1.\n");
      }
    }
  }
LABEL_204:
  uint64_t v71 = 4;
LABEL_205:
  int v94 = 88 * v23 + 472;
  v132 = v37;
  int v95 = v94 + 32 * v23 * v37;
  int v96 = v95 + 400 + 16 * v23;
  size_t v97 = v96 + 112 + 496 * v71;
  v131 = v97 + 65792;
  plat = mvm_allocate_plat(0, v97 + 65792, 0, 1, 0, 1);
  if (!plat) {
    xzm_main_malloc_zone_create_cold_3();
  }
  unint64_t v99 = plat;
  unint64_t v100 = v135 * denom;
  if (v141) {
    unint64_t v101 = 2;
  }
  else {
    unint64_t v101 = 0;
  }
  if (v150) {
    unsigned __int8 v102 = 4;
  }
  else {
    unsigned __int8 v102 = 0;
  }
  uint64_t v103 = v102 | v101;
  if (v149) {
    char v104 = 8;
  }
  else {
    char v104 = 0;
  }
  char v105 = v103 | v104;
  v136 = plat + 472;
  v142 = plat + v94;
  v155 = __buf;
  char v106 = v100 / numer;
  int v107 = mfm_zone_address();
  *(_OWORD *)unint64_t v99 = 0u;
  *(_OWORD *)(v99 + 16) = 0u;
  *(_OWORD *)(v99 + 32) = 0u;
  *(_OWORD *)(v99 + 48) = 0u;
  *(_OWORD *)(v99 + 64) = 0u;
  *(_OWORD *)(v99 + 80) = 0u;
  *(_OWORD *)(v99 + 96) = 0u;
  *(_OWORD *)(v99 + 112) = 0u;
  *(_OWORD *)(v99 + 128) = 0u;
  *(_OWORD *)(v99 + 144) = 0u;
  *(_OWORD *)(v99 + 160) = 0u;
  *(_OWORD *)(v99 + 176) = 0u;
  *(_OWORD *)(v99 + 192) = 0u;
  *(_OWORD *)(v99 + 208) = 0u;
  *(_OWORD *)(v99 + 224) = 0u;
  *(_OWORD *)(v99 + 240) = 0u;
  *(_OWORD *)(v99 + 256) = 0u;
  *(_OWORD *)(v99 + 272) = 0u;
  *(_OWORD *)(v99 + 288) = 0u;
  *(void *)(v99 + 304) = v131;
  *(_OWORD *)(v99 + 312) = v155;
  *(unsigned char *)(v99 + 328) = v105;
  *(_WORD *)(v99 + 329) = 1026;
  *(_DWORD *)(v99 + 331) = 0;
  *(unsigned char *)(v99 + 335) = 0;
  *(void *)(v99 + 336) = v107;
  *(unsigned char *)(v99 + 344) = v71;
  *(unsigned char *)(v99 + 345) = 40;
  *(_DWORD *)(v99 + 346) = 0;
  *(_WORD *)(v99 + 350) = 0;
  *(void *)(v99 + 352) = v95 + v99;
  *(void *)(v99 + 360) = v95 + v99 + 320;
  *(void *)(v99 + 368) = v95 + v99 + 360;
  *(void *)(v99 + 376) = v95 + 400 + v99;
  *(void *)(v99 + 384) = v96 + v99;
  *(void *)(v99 + 392) = v96 + 112 + v99;
  *(void *)(v99 + 400) = v97 + v99;
  *(void *)(v99 + 408) = v97 + v99 + 256;
  *(void *)(v99 + 416) = 0;
  *(void *)(v99 + 424) = 0;
  *(_DWORD *)(v99 + 432) = 0;
  *(_WORD *)(v99 + 436) = 1;
  *(void *)(v99 + 444) = 0;
  *(void *)(v99 + 438) = 0;
  *(unsigned char *)(v99 + 452) = v147;
  *(unsigned char *)(v99 + 453) = v127;
  *(unsigned char *)(v99 + 454) = v130;
  *(unsigned char *)(v99 + 455) = v129;
  *(unsigned char *)(v99 + 456) = v128;
  *(unsigned char *)(v99 + 457) = v126;
  *(void *)(v99 + 464) = 0;
  *(void *)(v99 + 458) = 0;
  _xzm_initialize_const_zone_data(v99, v131, 1, v23, v132, v136, v142, 0, v148, v146, v145, v138, v106, v139);
  BOOL v108 = v137;
  char v109 = v149;
  if (v137) {
    char v109 = 1;
  }
  if ((v150 | v109) == 1)
  {
    int v110 = 0x1EB1C9000;
    if (!xzm_reclaim_init(v99))
    {
      BOOL v108 = 0;
      *(unsigned char *)(v99 + 328) &= 0xF3u;
    }
  }
  else
  {
    BOOL v108 = 0;
    int v110 = 0x1EB1C9000uLL;
  }
  memcpy(*(void **)(v99 + 352), &_xzm_bin_sizes, 0x140uLL);
  char v111 = 0;
  v112 = v144 + 2;
  if (!v144) {
    v112 = 5;
  }
  do
    *(unsigned char *)(*(void *)(v99 + 360) + v111++) = v112;
  while (v111 != 40);
  v113 = (_DWORD *)(*(void *)(v99 + 376) + 8);
  do
  {
    *v113 = 0;
    v113 += 4;
    --v23;
  }
  while (v23);
  mach_vm_address_t v114 = *(void *)(v99 + 384);
  *(unsigned char *)mach_vm_address_t v114 = 0;
  *(void *)(v114 + 8) = v99;
  *(_DWORD *)(v114 + 16) = 0;
  *(unsigned char *)(v114 + 56) = 1;
  *(void *)(v114 + 64) = v99;
  *(_DWORD *)(v114 + 72) = 0;
  if (v143) {
    xzm_main_malloc_zone_init_range_groups(v99);
  }
  size_t v115 = 0;
  v116 = 40;
  do
  {
    v117 = *(void *)(v99 + 392);
    v118 = v117 + 496 * v115;
    *(unsigned char *)v118 = v115;
    *(_DWORD *)(v118 + 4) = 0;
    *(_DWORD *)(v118 + 8) = 0;
    if (v115 < 2u)
    {
      v120 = v117 + 496 * v115;
      *(void *)(v120 + 16) = *(void *)(v99 + 384);
      *(void *)(v120 + 24) = v99;
      if (v115 == 1)
      {
        v121 = v117 + 496 * v115;
        *(_WORD *)(v121 + 480) = v108;
        *(_WORD *)(v121 + 482) = 0;
        *(void *)(v121 + 488) = 0;
        *(void *)(v121 + 464) = 0;
        *(void *)(v121 + 472) = v121 + 464;
        *(void *)(v121 + 484) = 0x3FFFFLL;
      }
    }
    else
    {
      if (v115 - 2 >= 2) {
        _xzm_segment_group_find_and_allocate_chunk_cold_1(v115);
      }
      uint64_t v119 = v117 + 496 * v115;
      *(void *)(v119 + 16) = *(void *)(v99 + 384) + 56;
      *(void *)(v119 + 24) = v99;
    }
    v122 = 0;
    v123 = (_DWORD *)(v117 + v116);
    do
    {
      *v123 = _xzm_span_queue_slice_counts[v122];
      v123 += 4;
      ++v122;
    }
    while (v122 != 27);
    ++v115;
    v116 += 496;
  }
  while (v115 != v71);
  v124 = *(void *)(v99 + 400) + 192;
  xzm_metapool_init(v124, 3, 0x4000, 16, 16, 0);
  xzm_metapool_init(*(void *)(v99 + 400), 0, 0x80000, 0x4000, 0x4000, v124);
  xzm_metapool_init(*(void *)(v99 + 400) + 64, 1, 0x40000, 0x10000, 0x10000, v124);
  xzm_metapool_init(*(void *)(v99 + 400) + 128, 2, 0x4000, 16, 16, 0);
  _xzm_initialize_xzone_data(v99, v140, (char *)(v99 + 452), *(unsigned __int8 *)(v99 + 344) == 2);
  if (*(unsigned char *)(v110 + 1716) && _simple_getenv())
  {
    v151 = 8;
    v152 = 0;
    sysctlbyname("vm.reclaim_max_threshold", &v152, &v151, 0, 0);
    malloc_report(6u, (uint64_t)"XZM Config:\n\tData Only: %d\n\tGuards Enabled: %d\n\tScribble: %d\n\tDefer Large: %d\n\tDefer Xzones: %d\n\tHuge cache size: %d\n\tReclaim Max Threshold: %lli%s\n\tRanges (ptr addr/size/data addr/size): 0x%llx/%lu/0x%llx/%lu\n\tInitial Slot Config: %s\n\tMax Slot Config: %s\n\tSlot Upgrade Thresholds: %d/%d, %d/%d\n\tPointer Bucket Count: %lu\n");
  }
  return v99;
}

uint64_t xzm_metapool_init(uint64_t result, char a2, int a3, int a4, int a5, uint64_t a6)
{
  *(_DWORD *)uint64_t result = 0;
  *(unsigned char *)(result + 4) = a2;
  *(_DWORD *)(result + 8) = a3;
  *(_DWORD *)(result + 12) = a4;
  *(_DWORD *)(result + 16) = a5;
  *(void *)(result + 32) = 0;
  *(void *)(result + 40) = 0;
  *(void *)(result + 24) = 0;
  *(_DWORD *)(result + 48) = 0;
  *(void *)(result + 56) = a6;
  return result;
}

void xzm_main_malloc_zone_init_range_groups(uint64_t a1)
{
  kern_return_t v25;
  const char *v26;
  int v27;
  kern_return_t v28;
  void *v29;
  char *__endptr;
  size_t address;
  char __str[8];
  unint64_t v33;
  size_t v34;
  uint64_t v35;

  char v35 = *MEMORY[0x1E4F14BF8];
  mach_vm_address_t address = 255;
  if (sysctlbyname("vm.malloc_ranges", __str, &address, 0, 0) == -1)
  {
    BOOL v27 = *__error();
    if (v27 != 2)
    {
      if (v27 != 1) {
        xzm_main_malloc_zone_init_range_groups_cold_1();
      }
      unint64_t v26 = "sysctlbyname(\"vm.malloc_ranges\") denied\n";
      goto LABEL_41;
    }
  }
  else
  {
    __str[address] = 0;
    __endptr = __str;
    unint64_t v2 = strtoull(__str, &__endptr, 16);
    ++__endptr;
    unint64_t v3 = strtoull(__endptr, &__endptr, 16);
    ++__endptr;
    unint64_t v4 = strtoull(__endptr, &__endptr, 16);
    ++__endptr;
    unint64_t v5 = strtoull(__endptr, &__endptr, 16);
    if (!v2) {
      xzm_main_malloc_zone_init_range_groups_cold_2();
    }
    if (v3 < v2) {
      xzm_main_malloc_zone_init_range_groups_cold_3();
    }
    unint64_t v6 = v4 - v3;
    if (v4 < v3) {
      xzm_main_malloc_zone_init_range_groups_cold_4();
    }
    if (v5 < v4) {
      xzm_main_malloc_zone_init_range_groups_cold_5();
    }
    unint64_t v7 = (v2 + 0x1FFFFFF) & 0xFFFFFFFFFE000000;
    unint64_t v8 = v3 - 0x300000000;
    if (v3 < 0x300000000) {
      unint64_t v8 = 0;
    }
    unint64_t v9 = v8 & 0xFFFFFFFFFE000000;
    BOOL v19 = v9 >= v7;
    unint64_t v10 = v9 - v7;
    if (v19) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = 0;
    }
    size_t v12 = v4 + 0x100000000;
    unint64_t v13 = (v4 & 0xFFFFFFFFFE000000) + 0x102000000;
    if ((v4 & 0x1FFFFFF) == 0) {
      unint64_t v13 = v4 + 0x100000000;
    }
    unint64_t v14 = v5 - 0x200000000;
    if (v5 < 0x200000000) {
      unint64_t v14 = 0;
    }
    unint64_t v15 = v14 & 0xFFFFFFFFFE000000;
    BOOL v19 = v15 >= v13;
    unint64_t v16 = v15 - v13;
    if (!v19) {
      unint64_t v16 = 0;
    }
    if ((v16 & 0x1FFFFFF) != 0) {
      xzm_main_malloc_zone_init_range_groups_cold_10();
    }
    unint64_t v17 = v16 + v11;
    if (!v17) {
      xzm_main_malloc_zone_init_range_groups_cold_6();
    }
    unint64_t v18 = qword_1EB1C9700 % (v17 >> 25);
    BOOL v19 = v18 >= v11 >> 25;
    if (v18 >= v11 >> 25) {
      unint64_t v20 = v11 >> 25;
    }
    else {
      unint64_t v20 = 0;
    }
    if (v19) {
      unint64_t v7 = v13;
    }
    size_t v21 = v7 + ((v18 - v20) << 25);
    if ((v21 < v2 || v21 + 0x300000000 > v3) && (v21 < v12 || v21 + 0x200000000 > v5)) {
      xzm_main_malloc_zone_init_range_groups_cold_7();
    }
    *(void *)__str = 0x202000000000000;
    int v33 = v7 + ((v18 - v20) << 25);
    unint64_t v34 = v21 + 0x200000000;
    BOOL v24 = (vm_map_t *)MEMORY[0x1E4F14C48];
    long long v25 = mach_vm_range_create(*MEMORY[0x1E4F14C48], MACH_VM_RANGE_FLAVOR_V1, (mach_vm_range_recipes_raw_t)__str, 0x18u);
    if (v25)
    {
      if (v25 != 46)
      {
        if (v25 != 53) {
          xzm_main_malloc_zone_init_range_groups_cold_8(v25);
        }
        unint64_t v26 = "mach_vm_range_create() denied\n";
LABEL_41:
        malloc_report(3u, (uint64_t)v26);
      }
    }
    else
    {
      mach_vm_address_t address = v21;
      unint64_t v28 = mach_vm_map(*v24, &address, 0x200000000uLL, 0, 0x4000, 0, 0, 0, 0, 0, 1u);
      if (v28) {
        xzm_main_malloc_zone_init_range_groups_cold_9(v28);
      }
      *(unsigned char *)(a1 + 328) |= 1u;
      long long v29 = *(void **)(a1 + 384);
      v29[10] = v21;
      v29[11] = 0x200000000;
      v29[12] = v21;
      v29[13] = 0x200000000;
      v29[3] = v3;
      v29[4] = v6;
    }
  }
}

unsigned __int8 *sanitizer_should_enable()
{
  if (env_BOOL()) {
    return (unsigned __int8 *)1;
  }

  return env_BOOL();
}

unsigned __int8 *env_BOOL()
{
  _NSGetEnviron();
  uint64_t result = (unsigned __int8 *)_simple_getenv();
  if (result) {
    return (unsigned __int8 *)(*result == 49);
  }
  return result;
}

void nano_common_init(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F14BF8];
  _malloc_engaged_nano = _nano_common_init_pick_mode(a1, a2, a3, malloc_space_efficient_enabled);
  if (_malloc_engaged_nano)
  {
    unint64_t v6 = malloc_common_value_for_key_copy(a3, "malloc_nano_max_magazines", v9, 0x100uLL);
    if (v6)
    {
      unint64_t v8 = 0;
      uint64_t v7 = malloc_common_convert_to_long(v6, &v8);
      if (*v8 || v7 < 0) {
        malloc_report(3u, (uint64_t)"malloc_nano_max_magazines must be positive - ignored.\n");
      }
      else {
        nano_common_max_magazines = v7;
      }
    }
    if (_malloc_engaged_nano == 2) {
      nanov2_init(a1, a2, a3);
    }
  }
}

uint64_t mvm_aslr_init()
{
  uint64_t result = _dyld_get_image_slide();
  if (result)
  {
    if (!entropic_address)
    {
      unint64_t v1 = 0x16FD00000 - (qword_1EB1C9700 << 25);
      mach_vm_address_t address = 0;
      unint64_t v2 = (vm_map_t *)MEMORY[0x1E4F14C48];
      unint64_t v3 = (mach_vm_size_t *)MEMORY[0x1E4F14C80];
      uint64_t result = mach_vm_allocate(*MEMORY[0x1E4F14C48], &address, *MEMORY[0x1E4F14C80], 117440513);
      if (!result)
      {
        mach_vm_address_t v4 = address;
        if (address > 0x16FE00000)
        {
          uint64_t v5 = 0;
          unint64_t v1 = (address & 0xFFFFFFFFFE000000) + 0x200000000;
          atomic_compare_exchange_strong_explicit(&entropic_base, (unint64_t *)&v5, address, memory_order_relaxed, memory_order_relaxed);
        }
        uint64_t result = mach_vm_deallocate(*v2, v4, *v3);
      }
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      atomic_compare_exchange_strong_explicit(&entropic_limit, (unint64_t *)&v6, v1, memory_order_relaxed, memory_order_relaxed);
      atomic_compare_exchange_strong_explicit(&entropic_address, (unint64_t *)&v7, v1 - 0x10000000, memory_order_relaxed, memory_order_relaxed);
    }
  }
  else
  {
    malloc_entropy = 0;
    qword_1EB1C9700 = 0;
  }
  return result;
}

uint64_t mfm_zone_address()
{
  return mfm_arena;
}

uint64_t mfm_initialize()
{
  mach_vm_address_t pages_plat = mvm_allocate_pages_plat(0x800000uLL, 0, 1073741827, 1);
  if (!pages_plat) {
    mfm_initialize_cold_1();
  }
  unint64_t v1 = pages_plat;
  mach_vm_address_t address = pages_plat;
  uint64_t result = mach_vm_map(*MEMORY[0x1E4F14C48], &address, 0x800000uLL, 0, 117456896, 0, 0, 0, 3, 7, 1u);
  if (result) {
    mfm_initialize_cold_2(result);
  }
  *(_DWORD *)unint64_t v1 = 0;
  *(void *)(v1 + 216) = 0x8000000000000000;
  unint64_t v3 = (uint64_t *)(v1 + 40);
  unint64_t v4 = v1 + 32;
  for (uint64_t i = 2; i != 13; ++i)
  {
    *(v3 - 1) = i;
    *unint64_t v3 = i;
    v3 += 2;
    v4 += 16;
  }
  *(void *)(v1 + 224) |= 1uLL;
  atomic_store(v1, &mfm_arena);
  return result;
}

mach_vm_address_t mvm_allocate_pages_plat(unint64_t a1, int a2, int a3, int a4)
{
  kern_return_t v12;
  mach_vm_address_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  const char *v21;
  uint64_t v23;
  kern_return_t v24;
  int v27;
  mach_vm_address_t address;

  unint64_t v5 = *MEMORY[0x1E4F14C80];
  if (((a1 + *MEMORY[0x1E4F14C80] - 1) & -*MEMORY[0x1E4F14C80]) != 0) {
    mach_vm_size_t v6 = (a1 + *MEMORY[0x1E4F14C80] - 1) & -*MEMORY[0x1E4F14C80];
  }
  else {
    mach_vm_size_t v6 = *MEMORY[0x1E4F14C80];
  }
  if ((a3 & 3) != 0)
  {
    if ((a3 & 1) != 0 && *MEMORY[0x1E4F14C78] < a2)
    {
      if (*MEMORY[0x1E4F14C68] > v5) {
        unint64_t v5 = *MEMORY[0x1E4F14C68];
      }
      v6 += (1 << a2) + v5;
    }
    else
    {
      if (*MEMORY[0x1E4F14C68] > v5) {
        unint64_t v5 = *MEMORY[0x1E4F14C68];
      }
      v6 += v5 << ((a3 & 3) == 3);
    }
  }
  if ((a3 & 0x80) != 0) {
    int v7 = 3;
  }
  else {
    int v7 = 1;
  }
  if (v6 < a1) {
    return 0;
  }
  BOOL v27 = a3 & 3;
  mach_vm_offset_t v8 = ~(-1 << a2);
  int v9 = v7 | (a4 << 24);
  uint64_t v10 = (vm_map_t *)MEMORY[0x1E4F14C48];
  if ((a3 & 0x40000000) != 0) {
    goto LABEL_19;
  }
LABEL_18:
  for (mach_vm_address_t i = entropic_address; ; mach_vm_address_t i = *MEMORY[0x1E4F14C80])
  {
    mach_vm_address_t address = i;
    size_t v12 = mach_vm_map(*v10, &address, v6, v8, v9, 0, 0, 0, 3, 7, 1u);
    if ((a3 & 0x40000000) == 0 && v12 == 3)
    {
      mach_vm_address_t address = *MEMORY[0x1E4F14C80];
      size_t v12 = mach_vm_map(*v10, &address, v6, v8, v9, 0, 0, 0, 3, 7, 1u);
    }
    if (v12)
    {
      if (v12 == 3) {
        return 0;
      }
      size_t v21 = "can't allocate region\n:*** mach_vm_map(size=%lu, flags: %x) failed (error code=%d)\n";
      goto LABEL_44;
    }
    unint64_t v13 = address;
    if ((a3 & 0x40000000) != 0) {
      goto LABEL_34;
    }
    if (address + v6 <= entropic_limit) {
      break;
    }
    unint64_t v14 = entropic_address;
    if (!((unint64_t)entropic_address >> 28) || entropic_address - 0x10000000 < (unint64_t)entropic_base) {
      break;
    }
    mach_vm_deallocate(*v10, address, v6);
    atomic_compare_exchange_strong_explicit(&entropic_address, &v15, v14 - 0x10000000, memory_order_relaxed, memory_order_relaxed);
    if ((a3 & 0x40000000) == 0) {
      goto LABEL_18;
    }
LABEL_19:
    ;
  }
  if (address < entropic_address)
  {
    unint64_t v16 = entropic_address;
    if ((unint64_t)entropic_address >> 28)
    {
      if (entropic_address - 0x10000000 >= (unint64_t)entropic_base) {
        atomic_compare_exchange_strong_explicit(&entropic_address, &v17, v16 - 0x10000000, memory_order_relaxed, memory_order_relaxed);
      }
    }
  }
LABEL_34:
  if (!v27) {
    return v13;
  }
  if ((a3 & 1) != 0 && *MEMORY[0x1E4F14C78] < a2)
  {
    if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
      unint64_t v18 = *MEMORY[0x1E4F14C80];
    }
    else {
      unint64_t v18 = *MEMORY[0x1E4F14C68];
    }
    BOOL v19 = 1 << a2;
    unint64_t v20 = (v18 + v13 + v19 - 1) & -v19;
    if (mach_vm_deallocate(*v10, v13, v20 - (v18 + v13)))
    {
      size_t v21 = "can't unmap excess guard region\n*** mach_vm_deallocate(addr=%p, size=%lu) failed (code=%d)\n";
LABEL_44:
      malloc_zone_error(a3, 0, (uint64_t)v21);
      return 0;
    }
    if (v19 == v20 - v13)
    {
      unint64_t v13 = (v18 + v13 + v19 - 1) & -v19;
    }
    else
    {
      BOOL v24 = mach_vm_deallocate(*v10, v6 - (v19 - v20), v19 - (v20 - v13));
      unint64_t v13 = (v18 + v13 + v19 - 1) & -v19;
      if (v24)
      {
        size_t v21 = "can't unmap excess trailing guard region\n*** mach_vm_deallocate(addr=%p, size=%lu) failed (code=%d)\n";
        goto LABEL_44;
      }
    }
  }
  else if (a3)
  {
    uint64_t v23 = *MEMORY[0x1E4F14C68];
    if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
      uint64_t v23 = *MEMORY[0x1E4F14C80];
    }
    v13 += v23;
  }
  mvm_protect_plat(v13, a1, 0, a3);
  return v13;
}

void mvm_protect_plat(uint64_t a1, uint64_t a2, int a3, char a4)
{
  if ((a4 & 9) == 1)
  {
    size_t v8 = *MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80] ? *MEMORY[0x1E4F14C80] : *MEMORY[0x1E4F14C68];
    if (mprotect((void *)(a1 - v8), v8, a3)) {
      malloc_report(3u, (uint64_t)"*** can't mvm_protect(%u) region for prelude guard page at %p\n");
    }
  }
  if ((a4 & 0x12) == 2)
  {
    if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
      size_t v9 = *MEMORY[0x1E4F14C80];
    }
    else {
      size_t v9 = *MEMORY[0x1E4F14C68];
    }
    if (mprotect((void *)((a1 + a2 + *MEMORY[0x1E4F14C80] - 1) & -*MEMORY[0x1E4F14C80]), v9, a3)) {
      malloc_report(3u, (uint64_t)"*** can't mvm_protect(%u) region for postlude guard page at %p\n");
    }
  }
}

void malloc_slowpath_update()
{
  BOOL v3 = has_injected_zone0 != 1
    && malloc_num_zones != 0
    && malloc_check_start == 0
    && lite_zone == 0
    && malloc_tracing_enabled == 0;
  int v4 = !v3
    || (malloc_simple_stack_logging & 1) != 0
    || (malloc_debug_flags & 0x20) != 0
    || malloc_interposition_compat != 0;
  if (malloc_slowpath != v4) {
    malloc_slowpath = v4;
  }
}

char *malloc_print_configure()
{
  unsigned int v0 = getenv("MallocDebugReport");
  if (v0)
  {
    unint64_t v1 = v0;
    if (_platform_strcmp())
    {
      if (_platform_strcmp())
      {
        if (_platform_strcmp())
        {
          debug_mode = 2;
          malloc_printf("Unrecognized value for MallocDebugReport (%s) - using 'stderr'\n", v1);
        }
        else
        {
          debug_mode = 0;
        }
        goto LABEL_12;
      }
      unint64_t v2 = &unk_1E930B000;
      int v3 = 1;
    }
    else
    {
      unint64_t v2 = (_DWORD *)&unk_1E930B000;
      int v3 = 2;
    }
    v2[106] = v3;
    goto LABEL_12;
  }
  if (isatty(2)) {
    debug_mode = 2;
  }
LABEL_12:
  if (getenv("MallocErrorStop")) {
    malloc_error_stop = 1;
  }
  uint64_t result = getenv("MallocErrorSleep");
  if (result) {
    malloc_error_sleep = 1;
  }
  return result;
}

uint64_t _nano_common_init_pick_mode(int a1, int a2, unsigned __int8 *a3, int a4)
{
  if (!malloc_common_value_for_key(a3, "nanov2_mode") || !_platform_strncmp()) {
    goto LABEL_5;
  }
  if (!_platform_strncmp()) {
    return 2;
  }
  if (!_platform_strncmp())
  {
    if (a4) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 2;
    }
  }
  else
  {
LABEL_5:
    unint64_t v5 = (unsigned char *)_simple_getenv();
    if (v5) {
      uint64_t v6 = 2 * (*v5 == 49);
    }
    else {
      uint64_t v6 = 0;
    }
  }
  int v7 = (unsigned __int8 *)_simple_getenv();
  if (v7)
  {
    unsigned int v8 = *v7;
    if (v8 > 0x55)
    {
      if (v8 == 86 || v8 == 118)
      {
        if (v7[1] - 49 >= 2) {
          return v6;
        }
        else {
          return 2;
        }
      }
    }
    else
    {
      if (v8 == 48) {
        return 0;
      }
      if (v8 == 49) {
        return 2;
      }
    }
  }
  return v6;
}

void _malloc_detect_interposition()
{
  BOOL v0 = (int *)malloc < &dword_193194000 || (unint64_t)malloc >= 0x1931D0000;
  if (v0 || ((int *)calloc >= &dword_193194000 ? (BOOL v1 = (unint64_t)calloc >= 0x1931D0000) : (BOOL v1 = 1), v1))
  {
    BOOL v2 = 1;
  }
  else
  {
    BOOL v2 = 1;
    if ((int *)free >= &dword_193194000
      && (unint64_t)free < 0x1931D0000
      && (int *)realloc >= &dword_193194000
      && (unint64_t)realloc < 0x1931D0000
      && (int *)valloc >= &dword_193194000
      && (unint64_t)valloc < 0x1931D0000
      && (int *)aligned_alloc >= &dword_193194000
      && (unint64_t)aligned_alloc < 0x1931D0000
      && (int *)posix_memalign >= &dword_193194000
      && (unint64_t)posix_memalign < 0x1931D0000
      && (int *)malloc_zone_malloc >= &dword_193194000
      && (unint64_t)malloc_zone_malloc < 0x1931D0000
      && (int *)malloc_zone_calloc >= &dword_193194000
      && (unint64_t)malloc_zone_calloc < 0x1931D0000
      && (int *)malloc_zone_free >= &dword_193194000
      && (unint64_t)malloc_zone_free < 0x1931D0000
      && (int *)malloc_zone_realloc >= &dword_193194000
      && (unint64_t)malloc_zone_realloc < 0x1931D0000
      && (int *)malloc_zone_valloc >= &dword_193194000
      && (unint64_t)malloc_zone_valloc < 0x1931D0000)
    {
      BOOL v2 = (int *)malloc_zone_memalign < &dword_193194000 || (unint64_t)malloc_zone_memalign >= 0x1931D0000;
    }
  }
  BOOL v3 = (int *)malloc_type_malloc < &dword_193194000 || (unint64_t)malloc_type_malloc >= 0x1931D0000;
  if (v3
    || ((int *)malloc_type_calloc >= &dword_193194000
      ? (BOOL v4 = (unint64_t)malloc_type_calloc >= 0x1931D0000)
      : (BOOL v4 = 1),
        v4))
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 0;
    if ((int *)malloc_type_free >= &dword_193194000 && (unint64_t)malloc_type_free < 0x1931D0000)
    {
      BOOL v5 = 0;
      if ((int *)malloc_type_realloc >= &dword_193194000 && (unint64_t)malloc_type_realloc < 0x1931D0000)
      {
        BOOL v5 = 0;
        if ((int *)malloc_type_valloc >= &dword_193194000 && (unint64_t)malloc_type_valloc < 0x1931D0000)
        {
          BOOL v5 = 0;
          if ((int *)malloc_type_aligned_alloc >= &dword_193194000
            && (unint64_t)malloc_type_aligned_alloc < 0x1931D0000)
          {
            BOOL v5 = 0;
            if ((int *)malloc_type_posix_memalign >= &dword_193194000
              && (unint64_t)malloc_type_posix_memalign < 0x1931D0000)
            {
              BOOL v5 = 0;
              if ((int *)malloc_type_zone_malloc >= &dword_193194000
                && (unint64_t)malloc_type_zone_malloc < 0x1931D0000)
              {
                BOOL v5 = 0;
                if ((int *)malloc_type_zone_calloc >= &dword_193194000
                  && (unint64_t)malloc_type_zone_calloc < 0x1931D0000)
                {
                  BOOL v5 = 0;
                  if ((int *)malloc_type_zone_free >= &dword_193194000
                    && (unint64_t)malloc_type_zone_free < 0x1931D0000)
                  {
                    BOOL v5 = 0;
                    if ((int *)malloc_type_zone_realloc >= &dword_193194000
                      && (unint64_t)malloc_type_zone_realloc < 0x1931D0000)
                    {
                      BOOL v5 = 0;
                      if ((int *)malloc_type_zone_valloc >= &dword_193194000
                        && (unint64_t)malloc_type_zone_valloc < 0x1931D0000)
                      {
                        BOOL v5 = (int *)malloc_type_zone_memalign >= &dword_193194000
                          && (unint64_t)malloc_type_zone_memalign < 0x1931D0000;
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
  if (malloc_interposition_compat != (v2 && v5)) {
    malloc_interposition_compat = v2 && v5;
  }
}

uint64_t malloc_common_convert_to_long(char *a1, void *a2)
{
  uint64_t v3 = 0;
  do
  {
    uint64_t result = v3;
    BOOL v5 = a1;
    uint64_t v6 = *a1;
    if (!v6) {
      break;
    }
    unsigned int v7 = (v6 - 58);
    uint64_t v3 = (v6 - 48) + 10 * v3;
    a1 = v5 + 1;
  }
  while (v7 > 0xF5);
  *a2 = v5;
  return result;
}

void nanov2_init(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  __src[8] = *MEMORY[0x1E4F14BF8];
  if ((_simple_getenv() || malloc_common_value_for_key(a3, "nanov2_madvise_policy"))
    && _platform_strncmp())
  {
    if (!_platform_strncmp())
    {
      int v4 = 1;
      goto LABEL_10;
    }
    if (!_platform_strncmp())
    {
      int v4 = 2;
      goto LABEL_10;
    }
    malloc_report(3u, (uint64_t)"%s value (%s) invalid - ignored.\n");
  }
  int v4 = 0;
LABEL_10:
  nanov2_madvise_policy = v4;
  uint64_t v5 = _simple_getenv();
  if (v5 || (uint64_t v5 = (uint64_t)malloc_common_value_for_key_copy(a3, "nanov2_single_arena", v44, 0x100uLL)) != 0)
  {
    int v6 = 0;
    __src[0] = 0;
    unsigned int v7 = (char *)v5;
    while (*v7)
    {
      unint64_t v8 = malloc_common_convert_to_long(v7, __src);
      if ((char *)__src[0] == v7
        || ((int v9 = *(unsigned __int8 *)__src[0], v9 != 58) ? (v10 = v9 == 0) : (v10 = 1),
            !v10 || v8 - 16 > 0xF0 || (v8 & 0xF) != 0))
      {
        malloc_report(3u, (uint64_t)"%s value (%s) invalid - ignored.\n");
        goto LABEL_25;
      }
      v6 |= 1 << ((v8 >> 4) - 1);
      unsigned int v7 = (char *)(__src[0] + 1);
      if (!*(unsigned char *)__src[0]) {
        break;
      }
    }
  }
  else
  {
LABEL_25:
    LOWORD(v6) = 0;
  }
  word_1EB1C9508 = v6;
  uint64_t v11 = _simple_getenv();
  if (v11)
  {
    size_t v12 = (char *)v11;
  }
  else
  {
    unint64_t v13 = malloc_common_value_for_key_copy(a3, "nanov2_scan_policy", v44, 0x100uLL);
    if (!v13) {
      goto LABEL_69;
    }
    size_t v12 = v13;
  }
  if (!_platform_strcmp())
  {
    int v33 = 0;
    goto LABEL_71;
  }
  __src[0] = 0;
  if (!*v12)
  {
LABEL_69:
    int v33 = 1;
LABEL_71:
    int v19 = 20;
    int v18 = 80;
    int v17 = 10;
    goto LABEL_72;
  }
  int v42 = a3;
  int v14 = 0;
  int v15 = 0;
  int v16 = 0;
  int v17 = 10;
  int v18 = 80;
  int v19 = 20;
  unint64_t v20 = v12;
  while (1)
  {
    if (_platform_strncmp() | v14)
    {
      if (_platform_strncmp() | v15)
      {
        if (_platform_strncmp() | v16)
        {
          LOBYTE(v21) = 1;
        }
        else
        {
          v20 += 3;
          uint64_t v30 = malloc_common_convert_to_long(v20, __src);
          int v21 = v20 == (char *)__src[0] || v30 < 0;
          if (!v21)
          {
            unint64_t v20 = (char *)__src[0];
            int v17 = v30;
          }
          int v16 = 1;
        }
      }
      else
      {
        v20 += 3;
        uint64_t v26 = malloc_common_convert_to_long(v20, __src);
        BOOL v28 = v20 != (char *)__src[0] && v26 >= 0;
        int v29 = v28 && v26 < 101;
        if (v29)
        {
          unint64_t v20 = (char *)__src[0];
          int v18 = v26;
        }
        LOBYTE(v21) = v29 ^ 1;
        int v15 = 1;
      }
    }
    else
    {
      v20 += 3;
      uint64_t v22 = malloc_common_convert_to_long(v20, __src);
      BOOL v24 = v20 != (char *)__src[0] && v22 >= 0;
      int v25 = v24 && v22 < 101;
      if (v25)
      {
        unint64_t v20 = (char *)__src[0];
        int v19 = v22;
      }
      LOBYTE(v21) = v25 ^ 1;
      int v14 = 1;
    }
    if (*v20 != 58) {
      break;
    }
    if (v21) {
      goto LABEL_75;
    }
    if (!*++v20)
    {
      if (v19 <= v18) {
        goto LABEL_92;
      }
LABEL_75:
      malloc_report(3u, (uint64_t)"%s value (%s) invalid - ignored.\n");
      a3 = v42;
      goto LABEL_76;
    }
  }
  if (*v20 || v21 & 1 | (v19 > v18)) {
    goto LABEL_75;
  }
LABEL_92:
  int v33 = 1;
  a3 = v42;
LABEL_72:
  nanov2_policy_config = v33;
  unk_1EB1C94FC = v19;
  dword_1EB1C9500 = v18;
  unk_1EB1C9504 = v17;
LABEL_76:
  uint64_t v34 = _simple_getenv();
  if (v34 || (uint64_t v34 = (uint64_t)malloc_common_value_for_key_copy(a3, "nanov2_size_class_blocks", v44, 0x100uLL)) != 0)
  {
    uint64_t v35 = 0;
    int v36 = 0;
    long long v43 = 0;
    unsigned __int8 v37 = (char *)v34;
    do
    {
      int v38 = malloc_common_convert_to_long(v37, &v43);
      uint64_t v39 = v43;
      if (v43 == v37 || (v35 != 60 ? (int v40 = 44) : (int v40 = 0), v40 != *v43 || v38 > 64))
      {
        unint64_t v41 = "%s value invalid: [%s] - ignored.\n";
        goto LABEL_89;
      }
      *(_DWORD *)((char *)__src + v35) = v38;
      v36 += v38;
      unsigned __int8 v37 = v39 + 1;
      v35 += 4;
    }
    while (v35 != 64);
    if (v36 == 64)
    {
      memcpy(block_units_by_size_class, __src, 0x40uLL);
      return;
    }
    unint64_t v41 = "%s value invalid - values must sum to %d, not %d - ignored.\n";
LABEL_89:
    malloc_report(3u, (uint64_t)v41);
  }
}

BOOL xzm_reclaim_init(uint64_t a1)
{
  word_1E93091A0 = 0;
  dword_1E9309198 = 0;
  int v2 = mach_vm_reclaim_ringbuffer_init();
  if (v2) {
    malloc_report(3u, (uint64_t)"xzm: failed to initialize deferred reclamation buffer (%d)\n");
  }
  else {
    *(void *)(a1 + 464) = &xzm_reclaim_buffer;
  }
  return v2 == 0;
}

mach_vm_address_t nanov2_create_zone(uint64_t a1, int a2)
{
  if (_malloc_engaged_nano != 2) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  int v4 = (_DWORD *)MEMORY[0x1E4F14C70];
  based_pages = (_DWORD *)nano_common_allocate_based_pages(~*MEMORY[0x1E4F14C70] & (unint64_t)(*MEMORY[0x1E4F14C70] + 29264), 0, 0, 1, 0);
  mach_vm_address_t v6 = (mach_vm_address_t)based_pages;
  if (!based_pages)
  {
    _malloc_engaged_nano = 0;
    return v6;
  }
  based_pages[26] = 16;
  *((void *)based_pages + 2) = nanov2_size;
  if (malloc_zero_policy == 2) {
    unsigned int v7 = nanov2_malloc_zero_on_alloc;
  }
  else {
    unsigned int v7 = nanov2_malloc;
  }
  unint64_t v8 = nanov2_malloc_type;
  if (malloc_zero_policy == 2) {
    unint64_t v8 = nanov2_malloc_type_zero_on_alloc;
  }
  *((void *)based_pages + 20) = v8;
  *((void *)based_pages + 3) = v7;
  *((void *)based_pages + 4) = nanov2_calloc;
  *((void *)based_pages + 5) = nanov2_valloc;
  *((void *)based_pages + 6) = nanov2_free;
  *((void *)based_pages + 7) = nanov2_realloc;
  *((void *)based_pages + 8) = nanov2_destroy;
  *((void *)based_pages + 10) = nanov2_batch_malloc;
  *((void *)based_pages + 11) = nanov2_batch_free;
  *((void *)based_pages + 12) = nanov2_introspect;
  *((void *)based_pages + 14) = nanov2_memalign;
  *((void *)based_pages + 15) = nanov2_free_definite_size;
  *((void *)based_pages + 16) = nanov2_pressure_relief;
  *((void *)based_pages + 17) = nanov2_claimed_address;
  *((void *)based_pages + 18) = nanov2_try_free_default;
  *((void *)based_pages + 21) = nanov2_calloc_type;
  *((void *)based_pages + 22) = nanov2_realloc_type;
  *((void *)based_pages + 23) = nanov2_memalign_type;
  int v9 = based_pages + 7169;
  *(void *)based_pages = 0;
  *((void *)based_pages + 1) = 0;
  mprotect(based_pages, 0xC8uLL, 1);
  *int v9 = a2;
  *(void *)(v6 + 28704) = a1;
  unint64_t v10 = (unint64_t)unk_1EB1C96FA << 16;
  unint64_t v11 = qword_1EB1C9700;
  uint64_t v12 = qword_1EB1C9700 & 0xFFFFFFFF0000;
  if ((qword_1EB1C9700 & 0xFFFFFFFF0000) == 0) {
    uint64_t v12 = 0xDEADDEAD0000;
  }
  if (!v10) {
    unint64_t v10 = v12;
  }
  *(void *)(v6 + 28696) = v10;
  unint64_t v13 = v11 >> 52;
  *(void *)(v6 + 28680) = v13;
  *(void *)(v6 + 28688) = v13 << 14;
  *(void *)(v6 + 28712) = 0;
  *(_DWORD *)(v6 + 28736) = 0;
  if (!malloc_tracing_enabled)
  {
    if (nano_common_allocate_vm_space(0x300000000uLL, 0x20000000uLL)) {
      goto LABEL_14;
    }
LABEL_24:
    nano_common_deallocate_pages(v6, ~*v4 & (unint64_t)(*(void *)v4 + 29264), 0);
    _malloc_engaged_nano = 0;
    malloc_report(5u, (uint64_t)"nano zone abandoned due to inability to reserve vm space.\n");
    return 0;
  }
  if (!nanov2_create_zone_cold_1()) {
    goto LABEL_24;
  }
LABEL_14:
  *(_WORD *)((*(void *)(v6 + 28688) ^ 0x300000000)
           + 4
           * (((unsigned __int16)(*(_DWORD *)(v6 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(v6 + 28680) << 6)) & 0xFFF)) = 0;
  *(void *)(v6 + 28720) = 0x300000000;
  atomic_store(0x304000000uLL, (unint64_t *)(v6 + 28728));
  *(_DWORD *)(v6 + 28744) = 1;
  if ((*(unsigned char *)v9 & 7) != 0)
  {
    int v14 = ((unsigned __int16)(*(_DWORD *)(v6 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(v6 + 28680) << 6)) & 0xFFF;
    *(_DWORD *)((*(void *)(v6 + 28688) ^ 0x300000000) + ((unint64_t)(v14 == 0) << 8)) = -2147481606;
    if (mprotect((void *)(((unint64_t)(v14 == 0) << 14) | 0x300000000), 0x4000uLL, 1)) {
      malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
    }
    if (v14 == 4095) {
      uint64_t v15 = 4094;
    }
    else {
      uint64_t v15 = 4095;
    }
    *(_DWORD *)((*(void *)(v6 + 28688) ^ 0x300000000) + 4 * (((v15 & 0x3F) << 6) | 0x3F)) = -2147481606;
    if (mprotect((void *)((v15 << 14) + 0x300000000), 0x4000uLL, 1)) {
      malloc_report(3u, (uint64_t)"Failed to create guard block at %p (%d)\n");
    }
  }
  return v6;
}

uint64_t nanov2_configure()
{
  if (nanov2_config_predicate != -1) {
    return _os_once();
  }
  return result;
}

uint64_t nano_common_configure()
{
  if (nano_common_max_magazines) {
    uint64_t v0 = nano_common_max_magazines;
  }
  else {
    uint64_t v0 = phys_ncpus;
  }
  BOOL v1 = getenv("MallocNanoMaxMagazines");
  if (v1 || (BOOL v1 = getenv("_MallocNanoMaxMagazines")) != 0)
  {
    uint64_t result = strtol(v1, 0, 0);
    char v3 = 0;
    if ((result & 0x80000000) == 0) {
      goto LABEL_10;
    }
    malloc_report(3u, (uint64_t)"MallocNanoMaxMagazines must be positive - ignored.\n");
    char v3 = 0;
  }
  else
  {
    char v3 = 1;
  }
  uint64_t result = v0;
LABEL_10:
  uint64_t v4 = phys_ncpus;
  if (result)
  {
    if (result <= phys_ncpus) {
      goto LABEL_14;
    }
    malloc_report(3u, (uint64_t)"Nano maximum magazines limited to number of physical CPUs [%d]\n");
  }
  uint64_t result = v4;
LABEL_14:
  nano_common_max_magazines = result;
  if ((v3 & 1) == 0)
  {
    malloc_report(6u, (uint64_t)"Nano maximum magazines set to %d\n");
    uint64_t result = nano_common_max_magazines;
  }
  if (_os_cpu_number_override != (_UNKNOWN *__ptr32)-1 || result != phys_ncpus) {
    nano_common_max_magazines_is_ncpu = 0;
  }
  if (_malloc_engaged_nano == 2)
  {
    return nanov2_configure();
  }
  return result;
}

BOOL nano_common_allocate_vm_space(mach_vm_address_t a1, mach_vm_size_t a2)
{
  return _nano_common_map_vm_space(a1, a2, 3) != 0;
}

mach_vm_address_t nano_common_allocate_based_pages(mach_vm_size_t a1, char a2, __int16 a3, int a4, uint64_t a5)
{
  kern_return_t v13;
  kern_return_t v14;
  mach_vm_address_t address;

  mach_vm_address_t result = 0;
  mach_vm_address_t v8 = *MEMORY[0x1E4F14C80];
  uint64_t v9 = *MEMORY[0x1E4F14C80] - 1;
  uint64_t v10 = -*MEMORY[0x1E4F14C80];
  if (((v9 + a1) & v10) != 0) {
    mach_vm_size_t v11 = (v9 + a1) & v10;
  }
  else {
    mach_vm_size_t v11 = *MEMORY[0x1E4F14C80];
  }
  if (v11 >= a1)
  {
    mach_vm_address_t v12 = (v9 + a5) & v10;
    if (v12) {
      mach_vm_address_t v8 = v12;
    }
    mach_vm_address_t address = v8;
    unint64_t v13 = mach_vm_map(*MEMORY[0x1E4F14C48], &address, v11, ~(-1 << a2), (a4 << 24) | 1, 0, 0, 0, 3, 7, 1u);
    if (v13)
    {
      int v14 = v13;
      mach_vm_address_t result = 0;
      if (v14 != 3)
      {
        malloc_zone_error(a3, 0, (uint64_t)"*** can't allocate pages: mach_vm_map(size=%lu) failed (error code=%d)\n");
        return 0;
      }
    }
    else
    {
      return address;
    }
  }
  return result;
}

uint64_t _nano_common_map_vm_space(mach_vm_address_t a1, mach_vm_size_t size, vm_prot_t cur_protection)
{
  kern_return_t v6;
  uint64_t result;
  mach_vm_address_t address;

  mach_vm_address_t address = a1;
  uint64_t v5 = (vm_map_t *)MEMORY[0x1E4F14C48];
  mach_vm_address_t v6 = mach_vm_map(*MEMORY[0x1E4F14C48], &address, size, 0, 184549376, 0, 0, 0, cur_protection, 7, 1u);
  mach_vm_address_t result = 0;
  if (!v6)
  {
    if (address == a1)
    {
      return 1;
    }
    else
    {
      mach_vm_deallocate(*v5, address, size);
      return 0;
    }
  }
  return result;
}

uint64_t malloc_type_zone_malloc_with_options_internal(malloc_zone_t *a1, size_t a2, size_t a3, unint64_t a4, uint64_t a5)
{
  if (!a2 || (a2 & (a2 - 1)) == 0 && ((a2 - 1) & a3) == 0)
  {
    if (malloc_logger) {
      BOOL v5 = 0;
    }
    else {
      BOOL v5 = malloc_slowpath == 0;
    }
    if (!v5) {
      return _malloc_type_zone_malloc_with_options_np_outlined(a1, a2, a3, a5, a4);
    }
    if (default_zone == (_UNKNOWN *)a1)
    {
      a1 = *(malloc_zone_t **)malloc_zones;
      if (*(void *)malloc_zones) {
        goto LABEL_12;
      }
    }
    else if (a1)
    {
LABEL_12:
      if (a1->version >= 0x10)
      {
        valloc = (uint64_t (*)(void))a1[1].valloc;
        if (valloc) {
          return valloc();
        }
      }
      return _malloc_type_zone_malloc_with_options_np_outlined(a1, a2, a3, a5, a4);
    }
    a1 = *(malloc_zone_t **)malloc_zones;
    goto LABEL_12;
  }
  return 0;
}

void *__cdecl malloc_type_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4 || malloc_absolute_max_size < size) {
    return (void *)_malloc_type_zone_realloc_outlined(zone, ptr, size, type_id);
  }
  if (default_zone == (_UNKNOWN *)zone) {
    zone = *(malloc_zone_t **)malloc_zones;
  }
  if (zone->version < 0x10) {
    return (void *)_malloc_zone_realloc((uint64_t)zone, (uint64_t)ptr, size, type_id);
  }
  else {
    return (void *)((uint64_t (*)(malloc_zone_t *, void *, size_t, malloc_type_id_t))zone[1].malloc)(zone, ptr, size, type_id);
  }
}

void xzm_malloc_zone_malloc_type_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4, unint64_t a5, int8x8_t a6)
{
  if (a2)
  {
    _xzm_memalign(a1, a2, a3, a5, a4 & 1, a6);
  }
  else if (a3 <= 0x8000)
  {
    if (*(void *)(a1 + 232)) {
      uint64_t v6 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v6 = a1;
    }
    unint64_t v7 = __clz(a3 - 1);
    unint64_t v8 = (((a3 - 1) >> (61 - v7)) & 3) - 4 * v7 + 488;
    if (a3 <= 0x80) {
      unint64_t v8 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    }
    if (!a3) {
      LOBYTE(v8) = 0;
    }
    uint64_t v9 = v8;
    char v10 = *(unsigned char *)(*(void *)(v6 + 368) + v8);
    if (HIWORD(a5) == 256)
    {
      char v11 = 0;
    }
    else if ((a5 & 0xC0000000000) == 0x40000000000)
    {
      char v11 = 1;
    }
    else
    {
      int v12 = *(unsigned __int8 *)(*(void *)(v6 + 360) + v9);
      unsigned int v13 = dword_1EB1C96FC;
      if (a5) {
        unsigned int v13 = a5;
      }
      LOBYTE(v14) = 0;
      switch(v12)
      {
        case 4:
          LODWORD(v14) = (*(_DWORD *)(v6 + 316) + *(_DWORD *)(v6 + 312) * v13) >> 31;
          break;
        case 5:
          unint64_t v15 = (*(void *)(v6 + 320) + *(void *)(v6 + 312) * (unint64_t)v13) >> 34;
          LODWORD(v14) = v15 - 3 * ((1431655766 * (unint64_t)v15) >> 32);
          break;
        case 6:
          unint64_t v14 = ((*(void *)(v6 + 320) + *(void *)(v6 + 312) * (unint64_t)v13) >> 32) & 3;
          break;
        default:
          break;
      }
      char v11 = v14 + 2;
    }
    _xzm_xzone_malloc(a1, a3, (v11 + v10), a4 & 1, a6);
  }
  else
  {
    _xzm_malloc_large_huge(a1, a3, 0, a5, a4 & 1);
  }
}

void mfm_free(void *a1)
{
  uint64_t v2 = mfm_arena;
  unint64_t v3 = mfm_arena + 0x20000;
  if (mfm_arena) {
    BOOL v4 = v3 > (unint64_t)a1;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4 || mfm_arena + 0x800000 <= (unint64_t)a1) {
    mfm_free_cold_4((uint64_t)a1);
  }
  if ((a1 & 0xF) != 0) {
    mfm_free_cold_3((uint64_t)a1);
  }
  unint64_t v6 = (uint64_t)((uint64_t)a1 - v3) >> 4;
  uint64_t v7 = mfm_arena + 224;
  uint64_t v8 = (v6 >> 5) | 1;
  if ((*(void *)(mfm_arena + 224 + 8 * ((v6 >> 5) & 0x7FFFFFFFFFFFFFELL)) & *(void *)(mfm_arena + 224 + 8 * v8) & (1 << v6)) == 0) {
    mfm_free_cold_1((uint64_t)a1);
  }
  unint64_t v9 = (v6 + 1) & 0x3F;
  unint64_t v10 = (v6 + 1) >> 5;
  uint64_t v11 = v10 & 0x7FFFFFFFFFFFFFELL;
  uint64_t v12 = mfm_arena + 8 * (v10 & 0x7FFFFFFFFFFFFFELL);
  unint64_t v14 = *(void *)(v12 + 224);
  unsigned int v13 = (void *)(v12 + 224);
  unint64_t v15 = v14 >> (v6 + 1);
  if (v15)
  {
    unint64_t v16 = __clz(__rbit64(v15));
LABEL_13:
    unint64_t v17 = v16 + 1;
    goto LABEL_14;
  }
  unint64_t v50 = *(void *)(mfm_arena + 8 * (v10 & 0x7FFFFFFFFFFFFFELL) + 240);
  if (!v50)
  {
    if (v9 < 0x2E) {
      LODWORD(v55) = 0;
    }
    else {
      uint64_t v55 = *(void *)(mfm_arena + 8 * v11 + 248);
    }
    unint64_t v16 = ((*(void *)(mfm_arena + ((8 * v10) | 8) + 224) >> v9) | ((unint64_t)(2 * v55) << (v9 ^ 0x3Fu))) & 0x7FFFF;
    goto LABEL_13;
  }
  unint64_t v17 = __clz(__rbit64(v50)) - v9 + 65;
LABEL_14:
  bzero(a1, 16 * v17);
  int v18 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v2, (unsigned int *)&v18, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v18) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v20 = 1 << v6;
  uint64_t v19 = (v6 >> 5) & 0x7FFFFFFFFFFFFFELL;
  uint64_t v21 = *(void *)(v7 + 8 * v19);
  if ((v21 & *(void *)(v7 + 8 * v8) & (1 << v6)) == 0
    || ((unint64_t v22 = *v13 >> v9) == 0
      ? ((unint64_t v51 = *(void *)(v2 + 8 * v11 + 240)) == 0
       ? (v9 < 0x2E ? (LODWORD(v56) = 0) : (uint64_t v56 = *(void *)(v2 + 8 * v11 + 248)),
          uint64_t v23 = (((*(void *)(v2 + ((8 * v10) | 8) + 224) >> v9) | ((unint64_t)(2 * v56) << (v9 ^ 0x3Fu))) & 0x7FFFF)
              + 1,
          uint64_t v20 = 1 << v6,
          uint64_t v19 = (v6 >> 5) & 0x7FFFFFFFFFFFFFELL)
       : (uint64_t v23 = __clz(__rbit64(v51)) - v9 + 65))
      : (uint64_t v23 = __clz(__rbit64(v22)) + 1),
        v17 != v23))
  {
    mfm_free_cold_2((uint64_t)a1);
  }
  *(_DWORD *)(v2 + 4) -= v17;
  --*(void *)(v2 + 24);
  uint64_t v24 = (uint64_t)(v6 - 1) >> 5;
  unint64_t v25 = *(void *)(v7 + ((8 * v24) | 8));
  if (((v25 >> (v6 - 1)) & 1) == 0)
  {
    unint64_t v26 = ((_BYTE)v6 - 1) & 0x3F;
    unint64_t v27 = v24 & 0xFFFFFFFFFFFFFFFELL;
    unint64_t v28 = v2 + 8 * v27;
    unint64_t v29 = *(void *)(v28 + 224) << (v26 ^ 0x3Fu);
    if (v29)
    {
      uint64_t v30 = __clz(v29) + 1;
    }
    else
    {
      unint64_t v52 = *(void *)(v28 + 208);
      if (v52)
      {
        uint64_t v30 = v26 + __clz(v52) + 2;
      }
      else
      {
        if (v26 > 0x12) {
          unint64_t v57 = 0;
        }
        else {
          unint64_t v57 = *(void *)(v2 + 8 * v27 + 216);
        }
        char v60 = v26 + 45;
        uint64_t v61 = ((2 * v25) << ~v60) | (v57 >> v60);
        unint64_t v62 = v25 >> v60;
        if ((v60 & 0x40) == 0) {
          LODWORD(v62) = v61;
        }
        uint64_t v30 = (v62 & 0x7FFFF) + 1;
        uint64_t v20 = 1 << v6;
        uint64_t v19 = (v6 >> 5) & 0x7FFFFFFFFFFFFFELL;
      }
    }
    v6 -= v30;
    *(void *)(v2 + 8 * v19 + 224) = v21 & ~v20;
    long long v31 = (uint64_t *)(v2 + 16 * v6 + 0x20000);
    uint64_t v33 = *v31;
    uint64_t v32 = *(void *)(v2 + 16 * v6 + 131080);
    *(void *)(v2 + 16 * v33 + 8) = v32;
    *(void *)(v2 + 16 * v32) = v33;
    *long long v31 = 0;
    *(void *)(v2 + 16 * v6 + 131080) = 0;
    v17 += v30;
  }
  unint64_t v34 = v6 + v17;
  unint64_t v35 = *(void *)(v2 + 8);
  if (v6 + v17 < v35)
  {
    uint64_t v36 = (v34 >> 5) & 0x7FFFFFFFFFFFFFELL;
    uint64_t v37 = *(void *)(v7 + 8 * v36);
    if ((v37 & (1 << v34) & *(void *)(v7 + ((8 * (v34 >> 5)) | 8))) == 0)
    {
      unint64_t v38 = (v34 + 1) >> 5;
      uint64_t v39 = v38 & 0x7FFFFFFFFFFFFFELL;
      unint64_t v40 = v2 + 8 * (v38 & 0x7FFFFFFFFFFFFFELL);
      unint64_t v41 = *(void *)(v40 + 224) >> (v34 + 1);
      if (v41)
      {
        unint64_t v42 = __clz(__rbit64(v41));
      }
      else
      {
        unint64_t v53 = ((_BYTE)v34 + 1) & 0x3F;
        unint64_t v54 = *(void *)(v40 + 240);
        if (v54)
        {
          unint64_t v43 = __clz(__rbit64(v54)) - v53 + 65;
          goto LABEL_29;
        }
        unint64_t v58 = *(void *)(v2 + ((8 * v38) | 8) + 224);
        if (v53 < 0x2E) {
          LODWORD(v59) = 0;
        }
        else {
          uint64_t v59 = *(void *)(v2 + 8 * v39 + 248);
        }
        unint64_t v42 = ((v58 >> v53) | ((unint64_t)(2 * v59) << (v53 ^ 0x3Fu))) & 0x7FFFF;
      }
      unint64_t v43 = v42 + 1;
LABEL_29:
      *(void *)(v2 + 8 * v36 + 224) = v37 & ~(1 << v34);
      uint64_t v44 = (uint64_t *)(v2 + 16 * v34 + 0x20000);
      uint64_t v46 = *v44;
      uint64_t v45 = *(void *)(v2 + 16 * v34 + 131080);
      *(void *)(v2 + 16 * v46 + 8) = v45;
      *(void *)(v2 + 16 * v45) = v46;
      *uint64_t v44 = 0;
      v44[1] = 0;
      v17 += v43;
      unint64_t v35 = *(void *)(v2 + 8);
      unint64_t v34 = v17 + v6;
    }
  }
  if (v34 == v35)
  {
    *(void *)(v2 + 16 * (v35 >> 6) + 224) &= ~(1 << v35);
    if (v17 > 0x3F)
    {
      __mfm_block_set_sizes(v2, 0, v6, v17);
    }
    else
    {
      uint64_t v47 = v2 + 224;
      *(void *)(v47 + ((v6 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(void *)(v2
                                                                            + 224
                                                                            + ((v6 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) & ~(1 << v6);
      *(void *)(v47 + (((v6 + v17 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(void *)(v2
                                                                                        + 224
                                                                                        + (((v6 + v17 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) & ~(1 << (v6 + v17 - 1));
    }
    *(void *)(v2 + 8) = v6;
  }
  else
  {
    __mfm_free_block(v2, v6, v17);
  }
  int v48 = *(_DWORD *)(StatusReg + 24);
  int v49 = v48;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v2, (unsigned int *)&v49, 0, memory_order_release, memory_order_relaxed);
  if (v49 != v48)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)v2);
  }
}

uint64_t __mfm_free_block(uint64_t result, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a2 & 0x3F;
  if (a3 > 0x3F)
  {
    unint64_t v10 = a3 - 1;
    *(void *)(result + ((8 * (a2 >> 5)) | 8) + 224) = *(void *)(result + ((8 * (a2 >> 5)) | 8) + 224) & ~(0xFFFFFLL << v3) | ((2 * (a3 - 1)) << v3);
    if (v3 >= 0x2D) {
      *(void *)(result + 8 * ((a2 >> 5) & 0x7FFFFFFFFFFFFFELL) + 248) = *(void *)(result
    }
                                                                                    + 8
                                                                                    * ((a2 >> 5) & 0x7FFFFFFFFFFFFFELL)
                                                                                    + 248) & ~(0x7FFFFuLL >> (v3 ^ 0x3Fu)) | ((v10 & 0x7FFFFFFFFFFFFFFFLL) >> (v3 ^ 0x3Fu));
    unint64_t v11 = (v10 + a2) >> 6;
    unint64_t v12 = (v10 + a2) & 0x3F;
    uint64_t v13 = 0xFFFFFLL << (v12 + 45);
    unint64_t v14 = 0x7FFFFuLL >> ~(v12 + 45);
    if (((v12 + 45) & 0x40) != 0)
    {
      unint64_t v14 = 0xFFFFFLL << (v12 + 45);
      uint64_t v13 = 0;
    }
    unint64_t v15 = v10 << (v12 + 45);
    unint64_t v16 = v10 >> 1 >> ~(v12 + 45);
    if (((v12 + 45) & 0x40) != 0)
    {
      unint64_t v16 = v15;
      unint64_t v15 = 0;
    }
    if (v12 >= 0x13)
    {
      uint64_t v17 = 2 * v11;
    }
    else
    {
      uint64_t v17 = 2 * v11;
      *(void *)(result + 16 * v11 + 216) = *(void *)(result + 16 * v11 + 216) & ~v13 | v15;
    }
    *(void *)(result + ((8 * v17) | 8) + 224) = *(void *)(result + ((8 * v17) | 8) + 224) & ~v14 | v16;
  }
  else
  {
    uint64_t v4 = result + 224;
    *(void *)(v4 + ((a2 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(void *)(result
                                                                         + 224
                                                                         + ((a2 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) & ~(1 << v3);
    *(void *)(v4 + (((a3 + a2 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) = *(void *)(result
                                                                                    + 224
                                                                                    + (((a3 + a2 - 1) >> 2) & 0x3FFFFFFFFFFFFFF0 | 8)) & ~(1 << (a3 + a2 - 1));
  }
  LODWORD(v5) = 63 - __clz(a3);
  if (v5 >= 0xA) {
    uint64_t v5 = 10;
  }
  else {
    uint64_t v5 = v5;
  }
  uint64_t v6 = result + 16 * v5;
  uint64_t v7 = 16 * a2 + 0x20000;
  uint64_t v8 = (void *)(v7 + result);
  uint64_t v9 = *(void *)(v6 + 32);
  *uint64_t v8 = v9;
  v8[1] = v5 + 2;
  *(void *)(v6 + 32) = v7 >> 4;
  *(void *)(result + 16 * v9 + 8) = v7 >> 4;
  return result;
}

uint64_t __mfm_block_set_sizes(uint64_t result, int a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 - 1;
  *(void *)(result + ((8 * (a3 >> 5)) | 8) + 224) = *(void *)(result + ((8 * (a3 >> 5)) | 8) + 224) & ~(0xFFFFFLL << a3) | ((a2 & 1 | (unint64_t)(2 * (a4 - 1))) << a3);
  if ((a3 & 0x3F) >= 0x2D) {
    *(void *)(result + 8 * ((a3 >> 5) & 0x7FFFFFFFFFFFFFELL) + 248) = *(void *)(result
  }
                                                                                  + 8
                                                                                  * ((a3 >> 5) & 0x7FFFFFFFFFFFFFELL)
                                                                                  + 248) & ~(0x7FFFFuLL >> (a3 & 0x3F ^ 0x3F)) | ((v4 & 0x7FFFFFFFFFFFFFFFuLL) >> (a3 & 0x3F ^ 0x3F));
  unint64_t v5 = (v4 + a3) >> 6;
  unint64_t v6 = (v4 + a3) & 0x3F;
  uint64_t v7 = 0x80000;
  if (!a2) {
    uint64_t v7 = 0;
  }
  unint64_t v8 = v4 + v7;
  uint64_t v9 = 0xFFFFFLL << (v6 + 45);
  unint64_t v10 = 0x7FFFFuLL >> ~(v6 + 45);
  if (((v6 + 45) & 0x40) != 0)
  {
    unint64_t v10 = 0xFFFFFLL << (v6 + 45);
    uint64_t v9 = 0;
  }
  uint64_t v11 = v8 << (v6 + 45);
  unint64_t v12 = v8 >> 1 >> ~(v6 + 45);
  if (((v6 + 45) & 0x40) != 0)
  {
    unint64_t v12 = v11;
    uint64_t v11 = 0;
  }
  if (v6 >= 0x13)
  {
    uint64_t v13 = 2 * v5;
  }
  else
  {
    uint64_t v13 = 2 * v5;
    *(void *)(result + 16 * v5 + 216) = *(void *)(result + 16 * v5 + 216) & ~v9 | v11;
  }
  *(void *)(result + ((8 * v13) | 8) + 224) = *(void *)(result + ((8 * v13) | 8) + 224) & ~v10 | v12;
  return result;
}

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
  if (zone)
  {
    if (zone->introspect) {
      introspect = zone->introspect;
    }
    else {
      introspect = 0;
    }
    statistics = (void (*)(void))introspect->statistics;
    statistics();
  }
  else
  {
    _platform_memset();
    if (malloc_num_zones)
    {
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = *((void *)malloc_zones + v4);
        memset(v8, 0, 24);
        if (*(void *)(v5 + 96)) {
          uint64_t v6 = *(void *)(v5 + 96);
        }
        else {
          uint64_t v6 = 0;
        }
        ++v4;
        (*(void (**)(void))(v6 + 56))();
        stats->blocks_in_use += v8[0].i32[0];
        *(int64x2_t *)&stats->size_in_use = vaddq_s64(*(int64x2_t *)&stats->size_in_use, *(int64x2_t *)((char *)v8 + 8));
        stats->size_allocated = stats->size_allocated;
      }
      while (v4 < malloc_num_zones);
    }
  }
}

void xzm_statistics_self(unint64_t a1, uint64_t a2)
{
  if (!*(void *)(a1 + 232)) {
    mfm_lock();
  }
  xzm_force_lock(a1);
  xzm_statistics(*MEMORY[0x1E4F14C48], a1, _malloc_default_reader_2, a2);
  xzm_force_unlock(a1);
  if (!*(void *)(a1 + 232))
  {
    mfm_unlock();
  }
}

void _xzm_foreach_lock(uint64_t a1, int a2)
{
  if (!a2)
  {
    int v4 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 284), (unsigned int *)&v4, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v4) {
      os_unfair_lock_lock_with_options();
    }
    int v6 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 280), (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v6) {
      os_unfair_lock_lock_with_options();
    }
    _xzm_allocation_slots_do_lock_action(a1, 0);
  }
  if (*(unsigned __int8 *)(a1 + 210) >= 2u)
  {
    unint64_t v7 = 1;
    unint64_t v8 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      uint64_t v9 = *(void *)(a1 + 216) + 88 * v7;
      if (*(void *)(v9 + 48) > 0x1000uLL)
      {
        if (a2)
        {
          for (atomic_ullong i = *(void *)v9; i; atomic_ullong i = *(void *)(i + 16))
            _xzm_do_lock_action((os_unfair_lock_s *)(i + 8), a2);
          for (uint64_t j = *(void *)(v9 + 8); j; uint64_t j = *(void *)(j + 16))
            _xzm_do_lock_action((os_unfair_lock_s *)(j + 8), a2);
          _xzm_do_lock_action((os_unfair_lock_s *)(v9 + 24), a2);
        }
        else
        {
          unint64_t v16 = (atomic_uint *)(v9 + 24);
          while (1)
          {
            int v17 = 0;
            atomic_compare_exchange_strong_explicit(v16, (unsigned int *)&v17, *(_DWORD *)(v8 + 24), memory_order_acquire, memory_order_acquire);
            if (v17) {
              os_unfair_lock_lock_with_options();
            }
            for (atomic_ullong k = *(void *)v9; k; atomic_ullong k = *(void *)(k + 16))
            {
              int v19 = 0;
              atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(k + 8), (unsigned int *)&v19, *(_DWORD *)(v8 + 24), memory_order_acquire, memory_order_acquire);
              if (v19) {
                os_unfair_lock_lock_with_options();
              }
            }
            uint64_t v20 = *(void *)(v9 + 8);
            if (!v20) {
              break;
            }
            while (1)
            {
              int v21 = 0;
              atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v20 + 8), (unsigned int *)&v21, *(_DWORD *)(v8 + 24), memory_order_acquire, memory_order_acquire);
              if (v21) {
                break;
              }
              uint64_t v20 = *(void *)(v20 + 16);
              if (!v20) {
                goto LABEL_28;
              }
            }
            for (atomic_ullong m = *(void *)v9; m; atomic_ullong m = *(void *)(m + 16))
            {
              int v23 = *(_DWORD *)(v8 + 24);
              int v24 = v23;
              atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(m + 8), (unsigned int *)&v24, 0, memory_order_release, memory_order_relaxed);
              if (v24 != v23) {
                os_unfair_lock_unlock((os_unfair_lock_t)(m + 8));
              }
            }
            for (uint64_t n = *(void *)(v9 + 8); ; uint64_t n = *(void *)(n + 16))
            {
              BOOL v26 = !n || n == v20;
              if (v26) {
                break;
              }
              int v27 = *(_DWORD *)(v8 + 24);
              int v28 = v27;
              atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(n + 8), (unsigned int *)&v28, 0, memory_order_release, memory_order_relaxed);
              if (v28 != v27) {
                os_unfair_lock_unlock((os_unfair_lock_t)(n + 8));
              }
            }
            int v29 = *(_DWORD *)(v8 + 24);
            int v30 = v29;
            atomic_compare_exchange_strong_explicit(v16, (unsigned int *)&v30, 0, memory_order_release, memory_order_relaxed);
            if (v30 != v29) {
              os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
            }
            MEMORY[0x1996FA050](0, 1, 1);
          }
        }
      }
      else
      {
        if (a2)
        {
          atomic_fetch_and_explicit((atomic_ullong *volatile)v9, 0x7FFFFFFFFFFFFFFFuLL, memory_order_relaxed);
          atomic_fetch_and_explicit((atomic_ullong *volatile)(v9 + 8), 0x7FFFFFFFFFFFFFFFuLL, memory_order_relaxed);
          atomic_fetch_and_explicit((atomic_ullong *volatile)(v9 + 16), 0x7FFFFFFFFFFFFFFFuLL, memory_order_relaxed);
        }
        else
        {
          atomic_fetch_or_explicit((atomic_ullong *volatile)v9, 0x8000000000000000, memory_order_relaxed);
          atomic_fetch_or_explicit((atomic_ullong *volatile)(v9 + 8), 0x8000000000000000, memory_order_relaxed);
          atomic_fetch_or_explicit((atomic_ullong *volatile)(v9 + 16), 0x8000000000000000, memory_order_relaxed);
        }
        for (iatomic_ullong i = (atomic_ullong *)(*(void *)(v9 + 16) & 0x7FFFFFFFFFFFLL); ii; iatomic_ullong i = (atomic_ullong *)ii[3])
        {
          atomic_ullong v13 = *ii;
          if (a2)
          {
            if ((~(_WORD)v13 & 0x7FE) != 0)
            {
              atomic_ullong v14 = *ii;
              atomic_compare_exchange_strong_explicit(ii, (unint64_t *)&v14, v13 & 0xFFFFFFFFBFFFFFFFLL, memory_order_relaxed, memory_order_relaxed);
              if (v14 != v13) {
                _xzm_foreach_lock_cold_1();
              }
            }
          }
          else
          {
            do
            {
              if ((~(_WORD)v13 & 0x7FE) == 0) {
                break;
              }
              atomic_ullong v15 = v13;
              atomic_compare_exchange_strong_explicit(ii, (unint64_t *)&v15, v13 | 0x40000000, memory_order_relaxed, memory_order_relaxed);
              BOOL v26 = v15 == v13;
              atomic_ullong v13 = v15;
            }
            while (!v26);
          }
        }
      }
LABEL_28:
      ++v7;
    }
    while (v7 < *(unsigned __int8 *)(a1 + 210));
  }
  if (a2)
  {
    _xzm_allocation_slots_do_lock_action(a1, a2);
    _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 280), a2);
    _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 284), a2);
  }
}

void _xzm_allocation_slots_do_lock_action(uint64_t a1, int a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a1 + 210);
  if (v2 >= 2)
  {
    LODWORD(v5) = *(unsigned __int8 *)(a1 + 211);
    for (unint64_t i = 1; i < v2; ++i)
    {
      if (v5)
      {
        unint64_t v7 = 0;
        unint64_t v8 = *(void *)(*(void *)(a1 + 216) + 88 * i + 48);
        do
        {
          unint64_t v9 = *(void *)(a1 + 224) + 32 * (i + v7 * *(unsigned __int8 *)(a1 + 210));
          if (v8 > 0x1000)
          {
            _xzm_do_lock_action((os_unfair_lock_s *)(v9 + 8), a2);
          }
          else
          {
            atomic_ullong v10 = *(void *)v9;
            if (a2)
            {
              if (atomic_exchange_explicit((atomic_ullong *volatile)v9, v10 & 0xFFFFFFFFFFFFFFFDLL, memory_order_release) != v10)_xzm_allocation_slots_do_lock_action_cold_2(); {
            }
              }
            else
            {
              do
              {
                while ((v10 & 1) != 0)
                {
                  if ((v10 & 2) == 0)
                  {
                    atomic_ullong v11 = v10;
                    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)v9, (unint64_t *)&v11, v10 | 2, memory_order_relaxed, memory_order_relaxed);
                    BOOL v12 = v11 == v10;
                    atomic_ullong v10 = v11;
                    if (!v12) {
                      continue;
                    }
                  }
                  int v13 = __ulock_wait();
                  if (v13 < 0 && v13 != -4)
                  {
                    unsigned int v14 = -v13;
                    if (v14 != 14) {
                      _xzm_allocation_slots_do_lock_action_cold_1(v14);
                    }
                  }
                  atomic_ullong v10 = *(void *)v9;
                }
                atomic_ullong v15 = v10;
                atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)v9, (unint64_t *)&v15, v10 | 2, memory_order_relaxed, memory_order_relaxed);
                BOOL v12 = v15 == v10;
                atomic_ullong v10 = v15;
              }
              while (!v12);
            }
          }
          ++v7;
          unint64_t v5 = *(unsigned __int8 *)(a1 + 211);
        }
        while (v7 < v5);
        unsigned int v2 = *(unsigned __int8 *)(a1 + 210);
      }
    }
  }
}

void _xzm_do_lock_action(os_unfair_lock_s *a1, int a2)
{
  switch(a2)
  {
    case 2:
      a1->_os_unfair_lock_opaque = 0;
      break;
    case 1:
      int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      int v4 = v3;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1, (unsigned int *)&v4, 0, memory_order_release, memory_order_relaxed);
      if (v4 != v3) {
        os_unfair_lock_unlock(a1);
      }
      break;
    case 0:
      int v2 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1, (unsigned int *)&v2, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
      if (v2) {
        os_unfair_lock_lock_with_options();
      }
      break;
  }
}

uint64_t xzm_statistics(uint64_t task, unint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t a4)
{
  unint64_t v5 = a3;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  if (!a3)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    unint64_t v5 = _malloc_default_reader_2;
  }
  uint64_t v16 = 0;
  uint64_t v17 = 0;
  unint64_t v15 = 0;
  uint64_t result = _xzm_introspect_map_zone_and_main(task, a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void **))v5, &v17, &v16, &v15);
  if (!result)
  {
    unint64_t v10 = v15;
    uint64_t v11 = v16;
    if (v15 == a2)
    {
      off_1EE3B88C0(task, *(void *)(v16 + 336), v5, (void *)a4);
      *(void *)(a4 + 16) = 0;
    }
    v14[0] = MEMORY[0x1E4F14BE8];
    v14[1] = 0x40000000;
    v14[2] = __xzm_statistics_block_invoke_3;
    v14[3] = &__block_descriptor_tmp_188;
    v14[4] = a4;
    if (v10 == a2)
    {
      BOOL v12 = v13;
      v13[0] = MEMORY[0x1E4F14BE8];
      v13[1] = 0x40000000;
      v13[2] = __xzm_statistics_block_invoke_4;
      v13[3] = &__block_descriptor_tmp_189;
      v13[4] = a4;
    }
    else
    {
      BOOL v12 = 0;
    }
    return _xzm_introspect_enumerate(task, (uint64_t (*)(void))v5, a2, v17, v10, v11, 0, (uint64_t)&__block_literal_global_184, (uint64_t)&__block_literal_global_187, (uint64_t)v14, (uint64_t)v12);
  }
  return result;
}

void xzm_force_unlock(uint64_t a1)
{
}

void xzm_force_lock(uint64_t a1)
{
}

uint64_t _xzm_introspect_map_zone_and_main(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, void **), void *a4, void *a5, void *a6)
{
  uint64_t v10 = a2;
  int v18 = 0;
  uint64_t result = a3(a1, a2, 304, &v18);
  if (!result)
  {
    unint64_t v13 = v18[25];
    if (v13 < 0x130) {
      return 5;
    }
    uint64_t result = a3(a1, v10, v18[25], &v18);
    if (!result)
    {
      uint64_t v17 = 0;
      unsigned int v14 = v18;
      uint64_t v15 = v18[29];
      if (v15)
      {
        uint64_t result = a3(a1, v18[29], 472, &v17);
        if (result) {
          return result;
        }
        unint64_t v16 = v17[38];
        if (v16 < 0x1D8) {
          return 5;
        }
        uint64_t result = a3(a1, v15, v17[38], &v17);
        if (result) {
          return result;
        }
        unsigned int v14 = v17;
        if (v16 < v17[38]) {
          return 5;
        }
        uint64_t v10 = v15;
      }
      else
      {
        uint64_t v17 = v18;
        if (v18[38] != v13) {
          return 5;
        }
      }
      if (!v18) {
        _xzm_introspect_map_zone_and_main_cold_1();
      }
      if (!v10) {
        _xzm_introspect_map_zone_and_main_cold_2();
      }
      uint64_t result = 0;
      *a4 = v18;
      *a5 = v14;
      *a6 = v10;
    }
  }
  return result;
}

uint64_t _xzm_introspect_enumerate(unsigned int a1, uint64_t (*a2)(void), unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  BOOL v15 = a3 == a5;
  unint64_t v16 = (void *)(a6 + 304);
  uint64_t v17 = (uint64_t *)(a4 + 200);
  if (a3 == a5) {
    uint64_t v17 = (uint64_t *)(a6 + 304);
  }
  uint64_t v18 = *v17;
  if (a3 != a5) {
    goto LABEL_17;
  }
  unint64_t v19 = *(void *)(a6 + 400);
  unint64_t v20 = v19 - a3;
  if (v19 < a3) {
    return 5;
  }
  uint64_t v21 = *(unsigned __int8 *)(a6 + 330);
  uint64_t result = 5;
  if (__CFADD__(v20, v21 << 6)) {
    return result;
  }
  if (v20 + (v21 << 6) > *(void *)(a6 + 304)) {
    return result;
  }
  uint64_t v23 = v20 + a6;
  if (!(v20 + a6)) {
    return result;
  }
  if (!*(unsigned char *)(a6 + 330))
  {
LABEL_17:
    unint64_t v29 = *(void *)(a6 + 408);
    BOOL v30 = v29 >= a5;
    unint64_t v31 = v29 - a5;
    if (v30)
    {
      uint64_t result = 5;
      if (v31 < 0xFFFFFFFFFFFF0000 && v31 + 0x10000 <= *v16)
      {
        uint64_t v32 = v31 + a6;
        if (v31 + a6)
        {
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          v55[0] = MEMORY[0x1E4F14BE8];
          v55[1] = 0x40000000;
          uint64_t v56 = ___xzm_introspect_enumerate_block_invoke;
          unint64_t v57 = &unk_1E574CF80;
          unsigned int v65 = a1;
          uint64_t v62 = a4;
          unint64_t v63 = a3;
          uint64_t v64 = v18;
          char v66 = a7;
          uint64_t v58 = a9;
          uint64_t v59 = a10;
          BOOL v67 = v15;
          uint64_t v60 = a11;
          uint64_t v61 = a2;
          while (1)
          {
            uint64_t v35 = *(unsigned int *)(v32 + v33);
            uint64_t v36 = v35 << 14;
            if (v35 && v34 != v36)
            {
              uint64_t result = v56((uint64_t)v55, v36);
              uint64_t v34 = v36;
              if (result) {
                break;
              }
            }
            v33 += 4;
            if (v33 == 0x10000)
            {
              unint64_t v38 = *(void *)(a6 + 416);
              if (v38 >> 62) {
                return 5;
              }
              unint64_t v39 = *(void *)(a6 + 424);
              uint64_t result = 0;
              BOOL v30 = v39 >= a5;
              unint64_t v40 = v39 - a5;
              if (v30 && !__CFADD__(v40, 4 * v38) && v40 + 4 * v38 <= *v16)
              {
                uint64_t result = 0;
                uint64_t v41 = v40 + a6;
                if (v40 + a6)
                {
                  if (v38)
                  {
                    uint64_t v42 = 0;
                    while (1)
                    {
                      uint64_t v43 = *(unsigned int *)(v41 + 4 * v42);
                      if (v43) {
                        break;
                      }
LABEL_48:
                      uint64_t result = 0;
                      if (++v42 >= v38) {
                        return result;
                      }
                    }
                    uint64_t v68 = 0;
                    uint64_t result = ((uint64_t (*)(void, uint64_t, uint64_t, void **))a2)(a1, v43 << 16, 0x10000, &v68);
                    if (!result)
                    {
                      uint64_t v44 = 0;
                      uint64_t v45 = v68;
                      while (1)
                      {
                        uint64_t v46 = *(unsigned int *)((char *)v45 + v44);
                        uint64_t v47 = v46 << 14;
                        if (v46 && v34 != v47)
                        {
                          uint64_t result = v56((uint64_t)v55, v47);
                          uint64_t v34 = v47;
                          if (result) {
                            break;
                          }
                        }
                        v44 += 4;
                        if (v44 == 0x10000)
                        {
                          unint64_t v38 = *(void *)(a6 + 416);
                          goto LABEL_48;
                        }
                      }
                    }
                  }
                }
              }
              return result;
            }
          }
        }
      }
      return result;
    }
    return 5;
  }
  uint64_t v25 = 0;
  BOOL v50 = a3 == a5;
  char v51 = a7;
  uint64_t v49 = v20 + a6;
  while (1)
  {
    uint64_t v26 = v23 + (v25 << 6);
    if (*(void *)(v26 + 24)) {
      break;
    }
LABEL_16:
    if (++v25 >= (unint64_t)v21) {
      goto LABEL_17;
    }
  }
  uint64_t v52 = v25;
  int v27 = (unsigned int *)(v26 + 8);
  int v28 = (unsigned __int8 *)(v26 + 4);
  while (1)
  {
    uint64_t v68 = 0;
    uint64_t result = a2(a1);
    if (result) {
      return result;
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void))(a8 + 16))(a8, v68[1], *v27, *v28);
    if (result) {
      return result;
    }
    if (!*v68)
    {
      LODWORD(v21) = *(unsigned __int8 *)(a6 + 330);
      BOOL v15 = v50;
      a7 = v51;
      uint64_t v23 = v49;
      uint64_t v25 = v52;
      goto LABEL_16;
    }
  }
}

uint64_t ___xzm_introspect_enumerate_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = 0;
  uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t *))(a1 + 56))(*(unsigned int *)(a1 + 88), a2, 14392, &v14);
  if (!result)
  {
    uint64_t v13 = 0;
    uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t *))(a1 + 56))(*(unsigned int *)(a1 + 88), *(void *)(v14 + 48), (unint64_t)*(unsigned int *)(v14 + 12) << 14, &v13);
    if (!result)
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      if (!result)
      {
        v5[0] = MEMORY[0x1E4F14BE8];
        v5[1] = 0x40000000;
        v5[2] = ___xzm_introspect_enumerate_block_invoke_2;
        v5[3] = &unk_1E574CF58;
        uint64_t v7 = v14;
        uint64_t v8 = v13;
        uint64_t v9 = *(void *)(a1 + 64);
        long long v10 = *(_OWORD *)(a1 + 72);
        __int16 v12 = *(_WORD *)(a1 + 92);
        uint64_t v11 = a2;
        long long v6 = *(_OWORD *)(a1 + 40);
        return xzm_segment_group_segment_foreach_span(v14, (uint64_t)v5);
      }
    }
  }
  return result;
}

uint64_t _malloc_default_reader(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self);
    }
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_0(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self);
    }
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_1(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self);
    }
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_2(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self);
    }
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_3(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self);
    }
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_4(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self);
    }
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_5(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1 && !mach_task_is_self(a1)) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  *a4 = a2;
  return 0;
}

uint64_t _malloc_default_reader_6(task_name_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a1)
  {
    is_self = mach_task_is_self(a1);
    if (!is_self) {
      purgeable_ptr_in_use_enumerator_cold_1(is_self);
    }
  }
  *a4 = a2;
  return 0;
}

uint64_t xzm_segment_group_segment_foreach_span(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1 + 2104;
  if (*(unsigned char *)(a1 + 20) != 1)
  {
    unint64_t v7 = v3 + 48 * *(unsigned int *)(a1 + 16);
    if (v3 >= v7) {
      return 0;
    }
    while (1)
    {
      int v8 = *(unsigned char *)(v3 + 32) & 0xF;
      if ((v8 - 5) < 4) {
        break;
      }
      if (v8 == 2)
      {
        uint64_t v9 = 1;
        goto LABEL_8;
      }
      unint64_t v10 = 0;
      do
      {
        unint64_t v11 = v3 + v10 + 48;
        unsigned int v12 = *(unsigned char *)(v3 + v10 + 80) & 0xF;
        BOOL v13 = v12 > 7 || ((1 << v12) & 0xE4) == 0;
        v10 += 48;
      }
      while (v13 && v12 != 8 && v11 < v7);
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, void))(a2 + 16))(a2, v3, -1431655765 * (v10 >> 4));
      if (result) {
        return result;
      }
      v3 += v10;
LABEL_10:
      if (v3 >= v7) {
        return 0;
      }
    }
    uint64_t v9 = *(unsigned int *)(v3 + 40);
LABEL_8:
    uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a2 + 16))(a2, v3, v9);
    if (result) {
      return result;
    }
    v3 += 48 * v9;
    goto LABEL_10;
  }
  uint64_t v4 = *(unsigned int *)(a1 + 2144);
  unint64_t v5 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(a2 + 16);

  return v5(a2, v3, v4);
}

uint64_t ___xzm_introspect_enumerate_block_invoke_2()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  uint64_t v3 = v2;
  uint64_t v4 = (unsigned int *)v1;
  v49[2048] = *MEMORY[0x1E4F14BF8];
  uint64_t v5 = *(void *)(v0 + 48);
  unint64_t v6 = 0xAAAAAAAAAAAAC000 * ((unint64_t)(v1 - v5 - 2104) >> 4);
  uint64_t v7 = (v6 & 0x3FFFFFFFC000) + *(void *)(v5 + 48);
  unsigned int v8 = *(unsigned char *)(v1 + 32) & 0xF;
  if (v8 <= 7 && ((1 << v8) & 0xE4) != 0)
  {
    uint64_t v10 = *(void *)(v0 + 64);
    if (*(unsigned __int16 *)(v1 + 34) == *(unsigned __int16 *)(v10 + 208))
    {
      uint64_t v11 = *(void *)(v0 + 56);
      if (v8 == 5 || v8 == 2)
      {
        unint64_t v12 = *(void *)(v0 + 72);
        unint64_t v13 = *(void *)(v10 + 216) + 88 * *(unsigned __int8 *)(v1 + 33);
        if (v12 > v13) {
          return 5;
        }
        unint64_t v21 = v13 - v12;
        BOOL v22 = __CFADD__(v13 - v12, 88);
        unint64_t v23 = v13 - v12 + 88;
        char v24 = v22;
        uint64_t v14 = 5;
        uint64_t v20 = v21 + v10;
        if (!(v21 + v10) || (v24 & 1) != 0 || v23 > *(void *)(v0 + 80)) {
          return v14;
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      if (!*(unsigned char *)(v0 + 96)) {
        return (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))(*(void *)(v0 + 32) + 16))(*(void *)(v0 + 32), *(void *)(v0 + 88), v5, v1, v2, v7, v20, 0, 0);
      }
      uint64_t v25 = *(void *)(v0 + 88);
      uint64_t v26 = *(void *)(v0 + 32);
      if (v8 == 2 || v8 == 5)
      {
        bzero(v49, 0x4000uLL);
        unint64_t v27 = *(unsigned int *)(v20 + 68);
        uint64_t v14 = 5;
        if (v27 > 0x400) {
          return v14;
        }
        uint64_t v28 = *(void *)(v20 + 48);
        uint64_t v29 = v28;
        if (((unint64_t)v3 << 14) / v28 != v27) {
          return v14;
        }
        if (v8 == 5)
        {
          if (v27)
          {
            unsigned int v30 = 0;
            uint64_t v31 = 0;
            uint64_t v32 = 0;
            unsigned int v33 = *v4;
            do
            {
              if (((v33 >> v31) & 1) == 0)
              {
                uint64_t v34 = &v49[2 * v32];
                *uint64_t v34 = v7 + v30;
                v34[1] = v28;
                ++v32;
              }
              ++v31;
              v30 += v28;
            }
            while (v27 != v31);
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void *, void))(v26 + 16))(v26, v25, v5, v4, v3, v7, v20, v49, v32);
          }
LABEL_58:
          LODWORD(v32) = 0;
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void *, void))(v26 + 16))(v26, v25, v5, v4, v3, v7, v20, v49, v32);
        }
        unint64_t v36 = *(void *)v4;
        if ((~*v4 & 0x7FELL) != 0)
        {
          unint64_t v37 = *(void *)v4 & 0x7FFLL;
          if (v37 > 0x3FF)
          {
            unint64_t v38 = 0;
          }
          else
          {
            unint64_t v38 = 0;
            unint64_t v39 = v28 >> 4;
            do
            {
              if (v37 % v39) {
                break;
              }
              unint64_t v40 = &v49[2 * (v37 / v39)];
              if (*v40) {
                break;
              }
              ++v38;
              *unint64_t v40 = 1;
              unint64_t v37 = *(void *)(v6 + v11 + 16 * v37 + 8) & 0x7FFLL;
            }
            while (v37 < 0x400);
          }
          unint64_t v41 = (v36 >> 11) & 0x7FF;
          if (v38 >= v41 || v41 > v27) {
            uint64_t v43 = 0;
          }
          else {
            uint64_t v43 = v38 - v41;
          }
          uint64_t v44 = v43 + v27;
          if (v44)
          {
            uint64_t v32 = 0;
            uint64_t v45 = (unsigned __int8 *)v49;
            uint64_t v46 = v7;
            do
            {
              int v47 = *v45;
              v45 += 16;
              if (!v47)
              {
                int v48 = &v49[2 * v32];
                *int v48 = v46;
                v48[1] = v29;
                ++v32;
              }
              v46 += v29;
              --v44;
            }
            while (v44);
            return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void *, void))(v26 + 16))(v26, v25, v5, v4, v3, v7, v20, v49, v32);
          }
          goto LABEL_58;
        }
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t, uint64_t, void, void))(v26 + 16))(v26, v25, v5, v4, v3, v7, v20, 0, 0);
      }
      else
      {
        v49[0] = (v6 & 0x3FFFFFFFC000) + *(void *)(v5 + 48);
        v49[1] = (unint64_t)v2 << 14;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void *, uint64_t))(v26 + 16))(v26, v25, v5, v1, v2, v7, 0, v49, 1);
      }
    }
  }
  uint64_t v14 = *(unsigned __int8 *)(v0 + 97);
  if (!*(unsigned char *)(v0 + 97)) {
    return v14;
  }
  if (*(_WORD *)(v1 + 34)) {
    return 0;
  }
  uint64_t v15 = *(void *)(v0 + 88);
  unint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unsigned int *, uint64_t, uint64_t))(*(void *)(v0 + 40)
                                                                                              + 16);
  uint64_t v17 = *(void *)(v0 + 40);
  uint64_t v18 = (v6 & 0x3FFFFFFFC000) + *(void *)(v5 + 48);

  return v16(v17, v15, v5, v4, v2, v18);
}

uint64_t __xzm_statistics_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  unint64_t v7 = (unint64_t)a5 << 14;
  int v8 = *(unsigned char *)(a4 + 32) & 0xF;
  if (v8 == 5)
  {
    uint64_t v10 = *(unsigned int *)(a4 + 4);
LABEL_8:
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)v9 += v10;
    unint64_t v11 = *(void *)(v9 + 8) + *(void *)(a7 + 48) * v10;
    goto LABEL_9;
  }
  if (v8 != 2)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    ++*(_DWORD *)v9;
    unint64_t v11 = *(void *)(v9 + 8) + v7;
LABEL_9:
    *(void *)(v9 + 8) = v11;
    goto LABEL_10;
  }
  if ((~*(_DWORD *)a4 & 0x7FE) != 0)
  {
    uint64_t v10 = *(_DWORD *)(a7 + 68) - ((*(_DWORD *)a4 >> 11) & 0x7FFu);
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(a1 + 32);
LABEL_10:
  *(void *)(v9 + 24) += v7;
  return 0;
}

uint64_t __xzm_statistics_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  *(void *)(*(void *)(a1 + 32) + 24) += (unint64_t)a5 << 14;
  return 0;
}

uint64_t __xzm_statistics_block_invoke_2()
{
  return 0;
}

uint64_t __xzm_statistics_block_invoke()
{
  return 0;
}

void mfmi_statistics_task(uint64_t a1, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void *a4)
{
  uint64_t v9 = 0;
  int v5 = mfmi_read_zone(a1, a2, a3, &v9);
  bzero(a4, 0x20uLL);
  if (!v5)
  {
    uint64_t v6 = v9;
    unint64_t v7 = *(void *)(v9 + 16);
    *(_DWORD *)a4 = *(void *)(v9 + 24);
    a4[3] = 0x800000;
    uint64_t v8 = ((((v7 >> 2) & 0x1FFFFFFFFFFFFFF8) + *MEMORY[0x1E4F14C80] + 223) & -*MEMORY[0x1E4F14C80])
       + a4[2]
       + ((*MEMORY[0x1E4F14C80] + 16 * v7 - 1) & -*MEMORY[0x1E4F14C80]);
    a4[1] = 16 * *(unsigned int *)(v6 + 4);
    a4[2] = v8;
  }
}

uint64_t mfmi_read_zone(uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void *a4)
{
  int v5 = a3;
  if (!a3)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    int v5 = _malloc_default_reader_1;
  }

  return v5(task, a2, 0x800000, a4);
}

void mfm_unlock()
{
  uint64_t v0 = (os_unfair_lock_s *)mfm_arena;
  if (mfm_arena)
  {
    int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    int v2 = v1;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v0, (unsigned int *)&v2, 0, memory_order_release, memory_order_relaxed);
    if (v2 != v1) {
      os_unfair_lock_unlock(v0);
    }
  }
}

uint64_t mfm_lock()
{
  uint64_t result = mfm_arena;
  if (mfm_arena)
  {
    int v1 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)mfm_arena, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
    if (v1) {
      return os_unfair_lock_lock_with_options();
    }
  }
  return result;
}

uint64_t nanov2_statistics_self(const void *a1, uint64_t a2)
{
  return nanov2_statistics(*MEMORY[0x1E4F14C48], a1, _malloc_default_reader_4, (void (*)(const char *, ...))malloc_report_simple, a2);
}

uint64_t nanov2_statistics(uint64_t task, const void *a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void (*a4)(const char *, ...), uint64_t a5)
{
  uint64_t v6 = a3;
  if (a4) {
    uint64_t v9 = a4;
  }
  else {
    uint64_t v9 = (void (*)(const char *, ...))nanov2_null_printer;
  }
  if (!a3)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    uint64_t v6 = _malloc_default_reader_4;
  }
  if (nanov2_config_predicate != -1) {
    _os_once();
  }
  _platform_memset();
  uint64_t v32 = 0;
  uint64_t v11 = v6(task, (uint64_t)a2, 29264, &v32);
  if (!v11)
  {
    uint64_t v13 = v32[3585];
    unint64_t explicit = atomic_load_explicit(v32 + 3591, memory_order_acquire);
    uint64_t v15 = v32[3590];
    if (!v15) {
      return 0;
    }
    uint64_t v16 = ((unsigned __int16)(v13 >> 6) | (unsigned __int16)((_WORD)v13 << 6)) & 0xFFF;
    while (1)
    {
      uint64_t v31 = 0;
      uint64_t v17 = v6(task, v15, 0x20000000, &v31);
      if (v17)
      {
        uint64_t v12 = v17;
        v9("Failed to map nanov2 region at %p\n", (const void *)v15);
        return v12;
      }
      uint64_t v18 = v31 - v15;
      unint64_t v19 = (char *)(v15 == ((explicit - 1) & 0xFFFFFFFFE0000000) ? explicit : v15 + 0x20000000);
      uint64_t v20 = v32;
      uint64_t v21 = v32[3586];
      if (v15 < (unint64_t)v19) {
        break;
      }
LABEL_33:
      uint64_t v28 = *(unsigned __int16 *)(v18
                                + (v21 ^ v15 & 0xFFFFFFFFFC000000)
                                + 4
                                * (((unsigned __int16)(*((_DWORD *)v20 + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)v20 + 7170) << 6)) & 0xFFF));
      if (v15 + (v28 << 29) >= explicit) {
        uint64_t v15 = 0;
      }
      else {
        v15 += v28 << 29;
      }
      if (v28) {
        BOOL v29 = v15 == 0;
      }
      else {
        BOOL v29 = 1;
      }
      if (v29) {
        return 0;
      }
    }
    unint64_t v22 = v15;
LABEL_20:
    unsigned __int16 v23 = 0;
    uint64_t v24 = 0;
    while (1)
    {
      if (v16 != v24)
      {
        uint64_t v25 = ptr_offset_to_size_class[((v23 | (unsigned __int16)(v24 >> 6)) & 0xFC0 ^ *((_DWORD *)v20 + 7170)) >> 6];
        unsigned int v26 = *(_DWORD *)((v21 ^ v22 & 0xFFFFFFFFFC000000) + v18 + 4 * v24) & 0x7FF;
        if (v26 > 0x7FC)
        {
          if (v26 - 2045 < 3) {
            goto LABEL_31;
          }
        }
        else
        {
          if (!v26 || v26 == 2042) {
            goto LABEL_31;
          }
          if (v26 == 2044)
          {
            unsigned int v27 = slots_by_size_class[v25];
            if (!v27) {
              goto LABEL_31;
            }
LABEL_30:
            *(_DWORD *)a5 += v27;
            *(void *)(a5 + 8) += (int)(v27 * (16 * v25 + 16));
            *(void *)(a5 + 24) += 0x4000;
            goto LABEL_31;
          }
        }
        unsigned int v27 = slots_by_size_class[v25]
            + (~(*(_DWORD *)((v21 ^ v22 & 0xFFFFFFFFFC000000) + v18 + 4 * v24) >> 11) | 0xFFFFFC00);
        if (v27) {
          goto LABEL_30;
        }
      }
LABEL_31:
      ++v24;
      v23 += 64;
      if (v24 == 4096)
      {
        v22 += 0x4000000;
        if (v22 >= (unint64_t)v19) {
          goto LABEL_33;
        }
        goto LABEL_20;
      }
    }
  }
  uint64_t v12 = v11;
  v9("Failed to map nanozonev2_s at %p\n", a2);
  return v12;
}

uint64_t default_zone_free_definite_size()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 120))();
}

void xzm_malloc_zone_calloc(uint64_t a1, unint64_t a2, unint64_t a3, int8x8_t a4)
{
}

void *__cdecl aligned_alloc(size_t __alignment, size_t __size)
{
  return (void *)_malloc_zone_memalign((uint64_t)default_zone, __alignment, __size, 3, (v2 >> 2));
}

void _malloc_create_purgeable_zone()
{
  if (initial_xzone_zone) {
    BOOL v0 = purgeable_zone_use_xzm == 0;
  }
  else {
    BOOL v0 = 1;
  }
  if (v0)
  {
    uint64_t v1 = initial_scalable_zone;
    if (!initial_scalable_zone)
    {
      initial_scalable_zone = create_scalable_zone(0, malloc_debug_flags);
      malloc_set_zone_name((malloc_zone_t *)initial_scalable_zone, "DefaultScalableMallocZone");
      malloc_zone_register((malloc_zone_t *)initial_scalable_zone);
      uint64_t v1 = initial_scalable_zone;
    }
    purgeable_zone = (malloc_zone_t *)create_purgeable_zone(0, v1, malloc_debug_flags);
  }
  else
  {
    purgeable_zone = (malloc_zone_t *)xzm_malloc_zone_create(malloc_debug_flags | 0x80u, initial_xzone_zone);
  }
  default_purgeable_zone = (uint64_t)purgeable_zone;
  malloc_zone_register(purgeable_zone);
  uint64_t v3 = (malloc_zone_t *)default_purgeable_zone;

  malloc_set_zone_name(v3, "DefaultPurgeableMallocZone");
}

uint64_t __malloc_late_init(uint64_t a1)
{
  pgm_init_config(*(unsigned __int8 *)(a1 + 24));
  if ((has_injected_zone0 & 1) == 0 && !malloc_sanitizer_enabled && pgm_should_enable())
  {
    uint64_t zone = pgm_create_zone(*(void *)malloc_zones);
    malloc_zone_register_while_locked(zone, 1);
  }
  _dlopeuint64_t n = *(_UNKNOWN **)(a1 + 8);
  _dlsyatomic_ullong m = *(uint64_t (**)(void, void))(a1 + 16);
  if (*(void *)a1 >= 2uLL)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      long long v4 = *(_OWORD *)v3;
      long long v5 = *(_OWORD *)(v3 + 32);
      *(_OWORD *)&xmmword_1E9309108 = *(_OWORD *)(v3 + 16);
      *(_OWORD *)&off_1E9309118 = v5;
      msl = v4;
      long long v6 = *(_OWORD *)(v3 + 48);
      long long v7 = *(_OWORD *)(v3 + 64);
      long long v8 = *(_OWORD *)(v3 + 80);
      qword_1E9309158 = *(void *)(v3 + 96);
      xmmword_1E9309138 = v7;
      unk_1E9309148 = v8;
      xmmword_1E9309128 = v6;
    }
  }
  uint64_t v9 = _NSGetEnviron();
  uint64_t v10 = (uint64_t *)*v9;
  uint64_t result = (uint64_t)**v9;
  if (result)
  {
    uint64_t v12 = v10 + 1;
    while (_platform_strncmp())
    {
      uint64_t v13 = *v12++;
      uint64_t result = v13;
      if (!v13) {
        goto LABEL_15;
      }
    }
    uint64_t result = _malloc_register_stack_logger(1);
    uint64_t v14 = (uint64_t (*)(char **))xmmword_1E9309128;
    if ((void)xmmword_1E9309128)
    {
      uint64_t v15 = _NSGetEnviron();
      uint64_t result = v14(*v15);
    }
  }
LABEL_15:
  if (*((void *)&xmmword_1E9309128 + 1)) {
    uint64_t result = (*((uint64_t (**)(uint64_t))&xmmword_1E9309128 + 1))(result);
  }
  initial_num_zones = malloc_num_zones;
  if (malloc_sanitizer_enabled)
  {
    return sanitizer_reset_environment();
  }
  return result;
}

char *pgm_init_config(int a1)
{
  if (a1) {
    g_env_0 = 1;
  }
  uint64_t result = getenv("MallocProbGuard");
  if (result)
  {
    g_env_1 = 1;
    uint64_t result = getenv("MallocProbGuard");
    if (result) {
      BOOL v2 = *result == 49;
    }
    else {
      BOOL v2 = 0;
    }
    g_env_2 = v2;
  }
  return result;
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v3 = *(void *)(StatusReg + 904);
  if (type_id <= 1) {
    malloc_type_id_t v4 = 1;
  }
  else {
    malloc_type_id_t v4 = type_id;
  }
  *(void *)(StatusReg + 904) = v4;
  if (malloc_interposition_compat) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    uint64_t result = j__valloc(size);
  }
  else {
    uint64_t result = (void *)_malloc_zone_valloc((uint64_t)default_zone, size, 1);
  }
  *(void *)(StatusReg + 904) = v3;
  return result;
}

uint64_t _malloc_zone_valloc(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v8 = *(void *)(StatusReg + 904);
  if (!v8) {
    *(void *)(StatusReg + 904) = (v3 >> 2);
  }
  int v9 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_check_start) {
    internal_check();
  }
  if (malloc_absolute_max_size >= a2)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 40))(a1, a2);
    if (malloc_logger) {
      malloc_logger(10, a1, a2, 0, v10, 0);
    }
    if (malloc_simple_stack_logging == 1)
    {
      malloc_report(0x325u, (uint64_t)"valloc (%p/%llu): ");
      if (!v9)
      {
LABEL_14:
        if (!v8) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
    }
    else if (!v9)
    {
      goto LABEL_14;
    }
    kdebug_trace();
    if (!v8) {
      goto LABEL_19;
    }
LABEL_15:
    if (v10) {
      return v10;
    }
    goto LABEL_21;
  }
  uint64_t v10 = 0;
  if (v8) {
    goto LABEL_15;
  }
LABEL_19:
  *(void *)(StatusReg + 904) = 0;
  if (v10) {
    return v10;
  }
LABEL_21:
  if (a3) {
    **(_DWORD **)(StatusReg + 8) = 12;
  }
  return v10;
}

void xzm_malloc_zone_valloc(uint64_t a1, unint64_t a2, int8x8_t a3)
{
}

uint64_t default_zone_valloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 40))();
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  if (malloc_absolute_max_size < start_size) {
    return 0;
  }
  if (initial_xzone_zone) {
    BOOL v5 = xzm_create_mzones == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5
    || (scalable_uint64_t zone = (malloc_zone_t *)xzm_malloc_zone_create(malloc_debug_flags | flags, initial_xzone_zone)) == 0)
  {
    scalable_uint64_t zone = (malloc_zone_t *)create_scalable_zone(start_size, malloc_debug_flags | flags);
  }
  if ((flags & 0x400) != 0 || has_injected_zone0 || malloc_sanitizer_enabled || !pgm_should_enable())
  {
    malloc_zone_register(scalable_zone);
  }
  else
  {
    uint64_t zone = (malloc_zone_t *)pgm_create_zone((uint64_t)scalable_zone);
    int v7 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v7, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v7) {
      os_unfair_lock_lock_with_options();
    }
    malloc_zone_register_while_locked((uint64_t)zone, 0);
    malloc_zone_register_while_locked((uint64_t)scalable_zone, 0);
    int v9 = *(_DWORD *)(StatusReg + 24);
    int v10 = v9;
    atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v10, 0, memory_order_release, memory_order_relaxed);
    if (v10 != v9) {
      os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
    }
    return zone;
  }
  return scalable_zone;
}

uint64_t pgm_should_enable()
{
  if (g_env_1 == 1) {
    return g_env_2 != 0;
  }
  char v1 = g_env_0;
  if (!_os_feature_enabled_simple_impl()) {
    goto LABEL_10;
  }
  if (v1)
  {
    uint32_t v2 = 250;
  }
  else
  {
    if (!_malloc_is_platform_binary()) {
      goto LABEL_10;
    }
    uint32_t v2 = 1000;
  }
  if (!arc4random_uniform(v2) && !main_image_has_section()) {
    return 1;
  }
LABEL_10:

  return _os_feature_enabled_simple_impl();
}

uint64_t _malloc_is_platform_binary()
{
  if (csops()) {
    return 0;
  }
  else {
    return 0;
  }
}

void malloc_zone_register(malloc_zone_t *zone)
{
  int v2 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v2) {
    os_unfair_lock_lock_with_options();
  }
  malloc_zone_register_while_locked((uint64_t)zone, 0);
  int v4 = *(_DWORD *)(StatusReg + 24);
  int v5 = v4;
  atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
  if (v5 != v4)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
  }
}

uint64_t xzm_malloc_zone_create(unsigned int a1, uint64_t a2)
{
  int v4 = 0;
  unsigned int v5 = *(unsigned __int8 *)(a2 + 210);
  unsigned int v6 = *(unsigned __int8 *)(a2 + 211);
  int v7 = (os_unfair_lock_s *)(a2 + 448);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a2 + 448), (unsigned int *)&v4, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v4) {
    os_unfair_lock_lock_with_options();
  }
  int v9 = *(void **)(a2 + 440);
  if (v9)
  {
    *(void *)(a2 + 440) = v9[1];
    __int16 v10 = *(_WORD *)v9;
    xzm_metapool_free((os_unfair_lock_t)(*(void *)(a2 + 400) + 128), v9);
  }
  else
  {
    int v11 = *(unsigned __int16 *)(a2 + 436);
    if (v11 == 0xFFFF)
    {
      __int16 v10 = 0;
    }
    else
    {
      __int16 v10 = v11 + 1;
      *(_WORD *)(a2 + 436) = v11 + 1;
    }
  }
  int v12 = *(_DWORD *)(StatusReg + 24);
  int v13 = v12;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v7, (unsigned int *)&v13, 0, memory_order_release, memory_order_relaxed);
  if (v13 != v12) {
    os_unfair_lock_unlock(v7);
  }
  if (!v10) {
    return 0;
  }
  uint64_t v14 = 88 * v5 + 304;
  mach_vm_address_t plat = mvm_allocate_plat(0, v14 + 32 * v5 * (unint64_t)v6, 0, 1, 0, 1);
  uint64_t v16 = plat;
  if (plat)
  {
    _xzm_initialize_const_zone_data(plat, v14 + 32 * v5 * (unint64_t)v6, v10, v5, v6, plat + 304, v14 + plat, a2, *(unsigned char *)(a2 + 240) & 3, *(void *)(a2 + 244), HIDWORD(*(void *)(a2 + 244)), *(_DWORD *)(a2 + 256), *(void *)(a2 + 264), a1);
    _xzm_initialize_xzone_data(v16, 0, (char *)(a2 + 452), *(unsigned __int8 *)(a2 + 344) == 2);
    *(void *)(v16 + 288) = 0;
  }
  return v16;
}

void xzm_metapool_free(os_unfair_lock_t lock, void *a2)
{
  int v4 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v4, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v4) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v6 = *(void *)&lock[14]._os_unfair_lock_opaque;
  int v7 = a2;
  if (v6)
  {
    int v7 = (void *)xzm_metapool_alloc(v6);
    if (*(void *)&lock[14]._os_unfair_lock_opaque)
    {
      size_t os_unfair_lock_opaque = lock[4]._os_unfair_lock_opaque;
      if (*MEMORY[0x1E4F14C80] <= os_unfair_lock_opaque) {
        mvm_madvise(a2, os_unfair_lock_opaque, 7);
      }
    }
  }
  *int v7 = *(void *)&lock[8]._os_unfair_lock_opaque;
  v7[1] = a2;
  *(void *)&lock[8]._size_t os_unfair_lock_opaque = v7;
  int v9 = *(_DWORD *)(StatusReg + 24);
  int v10 = v9;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v10, 0, memory_order_release, memory_order_relaxed);
  if (v10 != v9)
  {
    os_unfair_lock_unlock(lock);
  }
}

uint64_t _xzm_segment_group_alloc_segment(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, int a5)
{
  kern_return_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t inited;
  mach_vm_address_t address;

  int v8 = a2 != 0;
  if (a2) {
    mach_vm_size_t v9 = (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000;
  }
  else {
    mach_vm_size_t v9 = 0x400000;
  }
  uint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = v8 | 2u;
  if (a5) {
    LOBYTE(v8) = v8 | 2;
  }
  if (!*(unsigned char *)v10)
  {
    if (*(unsigned char *)(*(void *)(v10 + 8) + 328))
    {
      mach_vm_address_t pages_plat = _xzm_range_group_alloc_anywhere_segment(0, v9, a3, v11, v8);
      goto LABEL_28;
    }
    if (a5) {
      int v15 = 128;
    }
    else {
      int v15 = 0;
    }
    unint64_t v16 = __clz(__rbit64(a3));
    if (v16 <= 0x16) {
      LODWORD(v16) = 22;
    }
    if (a3) {
      int v14 = v16;
    }
    else {
      int v14 = 22;
    }
    unint64_t v13 = v9;
    int v12 = v15;
LABEL_22:
    mach_vm_address_t pages_plat = mvm_allocate_pages_plat(v13, v14, v12, v11);
LABEL_28:
    mach_vm_address_t v23 = pages_plat;
    goto LABEL_34;
  }
  if ((*(unsigned char *)(*(void *)(v10 + 8) + 328) & 1) == 0)
  {
    if (a5) {
      int v12 = 128;
    }
    else {
      int v12 = 0;
    }
    unint64_t v13 = v9;
    int v14 = 22;
    goto LABEL_22;
  }
  int v18 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v10 + 16), (unsigned int *)&v18, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v18) {
    os_unfair_lock_lock_with_options();
  }
  mach_vm_size_t v20 = *(void *)(v10 + 48);
  BOOL v21 = v20 >= v9;
  mach_vm_size_t v22 = v20 - v9;
  if (v21)
  {
    mach_vm_address_t v23 = *(void *)(v10 + 40);
    *(void *)(v10 + 40) = v23 + v9;
    *(void *)(v10 + 48) = v22;
  }
  else
  {
    mach_vm_address_t v23 = 0;
  }
  int v24 = *(_DWORD *)(StatusReg + 24);
  int v25 = v24;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v10 + 16), (unsigned int *)&v25, 0, memory_order_release, memory_order_relaxed);
  if (v25 != v24) {
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 16));
  }
  if (!v23)
  {
    malloc_zone_error(0, 0, (uint64_t)"Failed to allocate segment - out of space\n");
    return 0;
  }
  mach_vm_address_t address = v23;
  unsigned int v26 = mach_vm_map(*MEMORY[0x1E4F14C48], &address, v9, 0, 33570816, 0, 0, 0, 3, 7, 1u);
  if (v26) {
    _xzm_segment_group_alloc_segment_cold_2(v26);
  }
LABEL_34:
  if (!v23) {
    return 0;
  }
  if (v23 >> 36) {
    _xzm_segment_group_alloc_segment_cold_1();
  }
  unsigned int v27 = xzm_metapool_alloc(*(void *)(*(void *)(a1 + 24) + 400));
  uint64_t v28 = 1;
  inited = _xzm_segment_group_init_segment(a1, v27, v23, v9, a2 != 0, 1);
  _xzm_segment_table_allocated_at(*(void *)(a1 + 24), v23, v27);
  if (a2) {
    *a4 = inited;
  }
  return v28;
}

uint64_t xzm_metapool_alloc(uint64_t a1)
{
  int v2 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1, (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v2) {
    os_unfair_lock_lock_with_options();
  }
  int v4 = *(void **)(a1 + 32);
  if (!v4)
  {
    mach_vm_address_t plat = *(void **)(a1 + 40);
    if (plat)
    {
      unsigned int v8 = *(_DWORD *)(a1 + 48);
      if (v8 != *(_DWORD *)(a1 + 8))
      {
LABEL_16:
        uint64_t v5 = plat[1] + v8;
        *(_DWORD *)(a1 + 48) = *(_DWORD *)(a1 + 16) + v8;
        goto LABEL_17;
      }
    }
    else
    {
      unsigned int v8 = *(_DWORD *)(a1 + 8);
    }
    mach_vm_address_t plat = (void *)mvm_allocate_plat(0, v8, __clz(__rbit32(*(_DWORD *)(a1 + 12))), 1, 0, 1);
    if (!plat) {
      xzm_metapool_alloc_cold_1();
    }
    mach_vm_size_t v9 = plat;
    if (*(void *)(a1 + 56))
    {
      mach_vm_address_t plat = (void *)xzm_metapool_alloc();
      unsigned int v8 = 0;
    }
    else
    {
      unsigned int v8 = *(_DWORD *)(a1 + 16);
    }
    *(_DWORD *)(a1 + 48) = v8;
    *mach_vm_address_t plat = 0;
    plat[1] = v9;
    *(void *)(a1 + 40) = plat;
    *mach_vm_address_t plat = *(void *)(a1 + 24);
    *(void *)(a1 + 24) = plat;
    goto LABEL_16;
  }
  uint64_t v5 = v4[1];
  *(void *)(a1 + 32) = *v4;
  uint64_t v6 = *(os_unfair_lock_s **)(a1 + 56);
  if (v6)
  {
    xzm_metapool_free(v6);
  }
  else
  {
    *int v4 = 0;
    v4[1] = 0;
  }
LABEL_17:
  int v10 = *(_DWORD *)(StatusReg + 24);
  int v11 = v10;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1, (unsigned int *)&v11, 0, memory_order_release, memory_order_relaxed);
  if (v11 != v10) {
    os_unfair_lock_unlock((os_unfair_lock_t)a1);
  }
  return v5;
}

uint64_t _xzm_segment_table_allocated_at(uint64_t result, unint64_t a2, unint64_t a3)
{
  if (a3 >= 0x3FFFFFFFC000) {
    _xzm_segment_table_allocated_at_cold_1();
  }
  for (unint64_t i = *(void *)(a3 + 48) + ((unint64_t)*(unsigned int *)(a3 + 12) << 14); a2 < i; a2 += 0x400000)
  {
    unint64_t v4 = a2 >> 22;
    if (a2 >> 36) {
      unint64_t v4 = 0x4000;
    }
    if (v4 >> 14) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = (unsigned int *)(*(void *)(result + 408) + 4 * v4);
    }
    atomic_store(a3 >> 14, v5);
  }
  return result;
}

uint64_t _xzm_segment_group_init_segment(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int a5, int a6)
{
  if (a2 >> 36) {
    _xzm_segment_group_init_segment_cold_3();
  }
  if (a3 >> 36) {
    _xzm_segment_group_init_segment_cold_2();
  }
  if (a4 >> 46) {
    _xzm_segment_group_init_segment_cold_1();
  }
  *(void *)a2 = a1;
  int v9 = a4 >> 14;
  if (((a4 >> 14) & 0xFFFFFF00) != 0) {
    int v9 = 256;
  }
  unint64_t v10 = a4 >> 14;
  *(_DWORD *)(a2 + 12) = a4 >> 14;
  *(_DWORD *)(a2 + 16) = v9;
  *(_DWORD *)(a2 + 8) = 0;
  *(void *)(a2 + 40) = -1;
  *(void *)(a2 + 48) = a3;
  *(unsigned char *)(a2 + 20) = a5;
  if (a5)
  {
    uint64_t result = _xzm_segment_group_segment_span_mark_allocated(a2, 7, 0, a4 >> 14);
    if (a6) {
      char v12 = 16;
    }
    else {
      char v12 = 0;
    }
    *(unsigned char *)(result + 32) = *(unsigned char *)(result + 32) & 0xEF | v12;
  }
  else
  {
    int v13 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 4), (unsigned int *)&v13, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
    if (v13) {
      os_unfair_lock_lock_with_options();
    }
    _xzm_segment_group_segment_span_free(a1, a2, 0, v10, a6);
    return 0;
  }
  return result;
}

uint64_t xzm_segment_group_try_realloc_large_chunk(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int v7 = *(_DWORD *)(a3 + 40);
  if (v7 >= a4)
  {
    if (v7 > a4)
    {
      int v19 = 0;
      mach_vm_size_t v20 = (atomic_uint *)(a1 + 4);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 4), (unsigned int *)&v19, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v19) {
        os_unfair_lock_lock_with_options();
      }
      unsigned int v22 = *(_DWORD *)(a3 + 40) - a4;
      *(_DWORD *)(a3 + 40) = a4;
      uint64_t v23 = a3 + 48 * (a4 - 1);
      *(unsigned char *)(v23 + 32) = *(unsigned char *)(v23 + 32) & 0xF0 | 4;
      *(_DWORD *)(v23 + 36) = 48 * (a4 - 1);
      if (v22 >= 2) {
        int v24 = 6;
      }
      else {
        int v24 = 2;
      }
      _xzm_segment_group_segment_span_mark_allocated(a3 & 0xFFFFFFFFFFFFC000, v24, -1431655765 * ((a3 + 48 * a4 - (a3 & 0xFFFFFFFFFFFFC000) - 2104) >> 4), v22);
      int v25 = *(_DWORD *)(StatusReg + 24);
      int v26 = v25;
      atomic_compare_exchange_strong_explicit(v20, (unsigned int *)&v26, 0, memory_order_release, memory_order_relaxed);
      if (v26 != v25) {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
      }
      xzm_segment_group_free_chunk(a1, a3 + 48 * a4, 0);
    }
    return 1;
  }
  int v9 = 0;
  unint64_t v10 = (atomic_uint *)(a1 + 4);
  unint64_t v11 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 4), (unsigned int *)&v9, *(_DWORD *)(v11 + 24), memory_order_acquire, memory_order_acquire);
  if (v9) {
    os_unfair_lock_lock_with_options();
  }
  unsigned int v12 = *(_DWORD *)(a3 + 40);
  if (a3 + 48 * (unint64_t)v12 < a2 + 48 * (unint64_t)*(unsigned int *)(a2 + 16) + 2104)
  {
    uint64_t v13 = a3 + 48 * v12;
    char v16 = *(unsigned char *)(v13 + 32);
    int v15 = (unsigned char *)(v13 + 32);
    char v14 = v16;
    if ((v16 & 0xD) == 1)
    {
      uint64_t v17 = a4 - v12;
      unsigned int v18 = v14 & 0xF;
      if (v18 != 1) {
        unsigned int v18 = *(_DWORD *)(a3 + 48 * v12 + 40);
      }
      if (v18 >= v17)
      {
        switch(*(unsigned char *)a1)
        {
          case 0:
          case 2:
            if (((*(unsigned __int8 *)(*(void *)(a1 + 24) + 328) >> 2) & 1) == 0) {
              goto LABEL_24;
            }
            goto LABEL_23;
          case 1:
          case 3:
            if ((*(unsigned char *)(*(void *)(a1 + 24) + 328) & 8) == 0) {
              goto LABEL_24;
            }
LABEL_23:
            if ((_xzm_segment_group_span_mark_used(a1, a3 + 48 * v12) & 1) == 0) {
              goto LABEL_26;
            }
LABEL_24:
            uint64_t v28 = a3 + 48 * v12;
            uint64_t v31 = *(void *)(v28 + 16);
            BOOL v29 = (uint64_t *)(v28 + 16);
            uint64_t v30 = v31;
            if (v31)
            {
              *(void *)(v30 + 24) = *(void *)(a3 + 48 * v12 + 24);
              uint64_t v32 = *v29;
            }
            else
            {
              uint64_t v32 = 0;
            }
            **(void **)(a3 + 48 * v12 + 24) = v32;
            unsigned int v35 = *v15 & 0xF;
            if (v35 != 1) {
              unsigned int v35 = *(_DWORD *)(a3 + 48 * v12 + 40);
            }
            if (v35 > v17) {
              _xzm_segment_group_segment_slice_split(a1, a2, a3 + 48 * v12, a4 - v12, 0);
            }
            if (a4 != v12)
            {
              int v36 = 48 * v12;
              uint64_t v37 = a3 + 48 * v12 + 32;
              do
              {
                *(unsigned char *)uint64_t v37 = *(unsigned char *)v37 & 0xF0 | 4;
                *(_DWORD *)(v37 + 4) = v36;
                v36 += 48;
                v37 += 48;
                --v17;
              }
              while (v17);
            }
            *(_DWORD *)(a3 + 40) = a4;
            int v38 = *(_DWORD *)(v11 + 24);
            int v39 = v38;
            atomic_compare_exchange_strong_explicit(v10, (unsigned int *)&v39, 0, memory_order_release, memory_order_relaxed);
            if (v39 != v38) {
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
            }
            break;
          default:
            _xzm_segment_group_find_and_allocate_chunk_cold_1(*(unsigned char *)a1);
        }
        return 1;
      }
    }
  }
LABEL_26:
  uint64_t result = 0;
  int v33 = *(_DWORD *)(v11 + 24);
  int v34 = v33;
  atomic_compare_exchange_strong_explicit(v10, (unsigned int *)&v34, 0, memory_order_release, memory_order_relaxed);
  if (v34 != v33)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
    return 0;
  }
  return result;
}

void xzm_segment_group_free_chunk(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = a1;
  int v5 = *(unsigned char *)(a2 + 32) & 0xF;
  if (v5 == 7)
  {
    uint64_t v6 = (void *)(a2 & 0xFFFFFFFFFFFFC000);
    if (!*(_WORD *)(a1 + 480)
      || (a3 & 1) != 0
      || ((uint64_t v7 = *(unsigned int *)((a2 & 0xFFFFFFFFFFFFC000) + 0xC), v7 >= 0x81)
        ? (BOOL v8 = v7 >= *(_DWORD *)(a1 + 484))
        : (BOOL v8 = 1),
          v8))
    {
      unint64_t v9 = a2 & 0xFFFFFFFFFFFFC000;
      _xzm_segment_group_segment_deallocate(a1, v9, 1);
    }
    else
    {
      unint64_t v16 = *(void *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30);
      unint64_t v17 = v16 + (v7 << 14);
      if (v16 < v17)
      {
        uint64_t v18 = *(void *)(a1 + 24);
        do
        {
          unint64_t v19 = v16 >> 22;
          if (v16 >> 36) {
            unint64_t v19 = 0x4000;
          }
          if (v19 >> 14) {
            mach_vm_size_t v20 = 0;
          }
          else {
            mach_vm_size_t v20 = (_DWORD *)(*(void *)(v18 + 408) + 4 * v19);
          }
          *mach_vm_size_t v20 = 0;
          v16 += 0x400000;
        }
        while (v16 < v17);
      }
      int v21 = 0;
      unsigned int v22 = (os_unfair_lock_s *)(a1 + 488);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 488), (unsigned int *)&v21, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v21) {
        os_unfair_lock_lock_with_options();
      }
      int v24 = *(unsigned __int16 *)(v4 + 482);
      int v25 = *(unsigned __int16 *)(v4 + 480);
      if (v24 != v25) {
        goto LABEL_100;
      }
      int v26 = *(void **)(v4 + 464);
      if (!v26) {
        goto LABEL_101;
      }
      do
      {
        unsigned int v27 = (void *)v26[3];
        if (mach_vm_reclaim_is_available()) {
          break;
        }
        _xzm_segment_group_cache_invalidate(v4, v26);
        int v26 = v27;
      }
      while (v27);
      while (1)
      {
        int v24 = *(unsigned __int16 *)(v4 + 482);
        int v25 = *(unsigned __int16 *)(v4 + 480);
LABEL_100:
        if (v24 != v25) {
          break;
        }
LABEL_101:
        uint64_t v47 = **(void **)(*(void *)(v4 + 472) + 8);
        if (_xzm_segment_group_cache_mark_used(v4, v47))
        {
          int v48 = *(_DWORD *)(StatusReg + 24);
          int v49 = v48;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v22, (unsigned int *)&v49, 0, memory_order_release, memory_order_relaxed);
          if (v49 != v48) {
            os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 488));
          }
          mvm_deallocate_plat(*(void *)(v47 + 48), (unint64_t)*(unsigned int *)(v47 + 12) << 14, 0);
          xzm_metapool_free(*(os_unfair_lock_t *)(*(void *)(v4 + 24) + 400), (void *)v47);
          int v50 = 0;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v4 + 488), (unsigned int *)&v50, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
          if (v50) {
            os_unfair_lock_lock_with_options();
          }
        }
      }
      _xzm_segment_group_cache_mark_free(v4, v6);
      int v51 = *(_DWORD *)(StatusReg + 24);
      int v52 = v51;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v4 + 488), (unsigned int *)&v52, 0, memory_order_release, memory_order_relaxed);
      if (v52 != v51)
      {
LABEL_108:
        os_unfair_lock_unlock(v22);
      }
    }
    return;
  }
  if (a3)
  {
    if ((v5 - 6) < 2)
    {
      mach_vm_size_t v46 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
    }
    else if (v5 == 2)
    {
      mach_vm_size_t v46 = 0x4000;
    }
    else
    {
      if (v5 != 5) {
        xzm_chunk_mark_free_cold_1(*(unsigned char *)(a2 + 32) & 0xF);
      }
      mach_vm_size_t v46 = 0x10000;
    }
    unint64_t v10 = (unsigned __int8 **)(a2 & 0xFFFFFFFFFFFFC000);
    a1 = _xzm_segment_group_overwrite_chunk(((0xAAAAAAAAAAAAC000 * (((a2 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)+ *(void *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30), v46);
  }
  else
  {
    unint64_t v10 = (unsigned __int8 **)(a2 & 0xFFFFFFFFFFFFC000);
  }
  unsigned int v11 = *(unsigned __int8 *)(*(void *)(v4 + 24) + 328);
  if (v5 != 6 || (v11 & 2) == 0)
  {
    switch(*(unsigned char *)v4)
    {
      case 0:
      case 2:
        int v13 = (v11 >> 2) & 1;
        break;
      case 1:
      case 3:
        int v13 = v11 & 8;
        break;
      default:
        _xzm_segment_group_find_and_allocate_chunk_cold_1(*(unsigned char *)v4);
    }
    if (v5 != 5 && !v13) {
      xzm_segment_group_segment_madvise_chunk(a1, a2);
    }
  }
  else
  {
    int v14 = *(unsigned char *)(a2 + 32) & 0xF;
    if ((v14 - 6) < 2)
    {
      mach_vm_size_t v15 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
    }
    else if (v14 == 2)
    {
      mach_vm_size_t v15 = 0x4000;
    }
    else
    {
      if (v14 != 5) {
        xzm_chunk_mark_free_cold_1(v14);
      }
      mach_vm_size_t v15 = 0x10000;
    }
    _xzm_segment_group_overwrite_chunk((mach_vm_address_t)&v10[6][(0xAAAAAAAAAAAAC000 * ((a2 - (unint64_t)v10 - 2104) >> 4)) & 0x3FFFFFFFC000], v15);
  }
  int v28 = 0;
  unsigned int v22 = (os_unfair_lock_s *)(v4 + 4);
  unint64_t v29 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v4 + 4), (unsigned int *)&v28, *(_DWORD *)(v29 + 24), memory_order_acquire, memory_order_acquire);
  if (v28) {
    os_unfair_lock_lock_with_options();
  }
  unint64_t v30 = _xzm_segment_group_segment_span_free_coalesce(v4, (uint64_t)v10, a2, 0);
  int v31 = *((_DWORD *)v10 + 2) - 1;
  *((_DWORD *)v10 + 2) = v31;
  unsigned int v32 = **v10;
  if (v32 >= 2)
  {
    if (v32 - 2 >= 2) {
      _xzm_segment_group_find_and_allocate_chunk_cold_1(v32);
    }
LABEL_53:
    switch(*(unsigned char *)v4)
    {
      case 0:
      case 2:
        if (((*(unsigned __int8 *)(*(void *)(v4 + 24) + 328) >> 2) & 1) == 0) {
          goto LABEL_58;
        }
        goto LABEL_57;
      case 1:
      case 3:
        if ((*(unsigned char *)(*(void *)(v4 + 24) + 328) & 8) != 0) {
LABEL_57:
        }
          _xzm_segment_group_span_mark_free(v4, v30);
LABEL_58:
        int v33 = *(_DWORD *)(v29 + 24);
        int v34 = v33;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v22, (unsigned int *)&v34, 0, memory_order_release, memory_order_relaxed);
        if (v34 != v33) {
          goto LABEL_108;
        }
        return;
      default:
        _xzm_segment_group_find_and_allocate_chunk_cold_1(*(unsigned char *)v4);
    }
  }
  if (v31) {
    goto LABEL_53;
  }
  unsigned int v35 = v10 + 263;
  switch(*(unsigned char *)v4)
  {
    case 0:
    case 2:
      if (((*(unsigned __int8 *)(*(void *)(v4 + 24) + 328) >> 2) & 1) == 0) {
        goto LABEL_82;
      }
      goto LABEL_64;
    case 1:
    case 3:
      if ((*(unsigned char *)(*(void *)(v4 + 24) + 328) & 8) == 0) {
        goto LABEL_82;
      }
LABEL_64:
      if (!_xzm_segment_group_span_mark_used(v4, (uint64_t)(v10 + 263))) {
        goto LABEL_72;
      }
      unint64_t v36 = (unint64_t)(v10 + 263);
      break;
    default:
      _xzm_segment_group_find_and_allocate_chunk_cold_1(*(unsigned char *)v4);
  }
  while (1)
  {
    unsigned int v37 = *(unsigned char *)(v36 + 32) & 0xF;
    if (v37 != 1) {
      unsigned int v37 = *(_DWORD *)(v36 + 40);
    }
    if (v37 >= *((_DWORD *)v10 + 3)) {
      break;
    }
    char v53 = 0;
    uint64_t v38 = *(void *)(v36 + 16);
    if (v38)
    {
      *(void *)(v38 + 24) = *(void *)(v36 + 24);
      uint64_t v38 = *(void *)(v36 + 16);
    }
    **(void **)(v36 + 24) = v38;
    unint64_t v36 = _xzm_segment_group_segment_span_free_coalesce(v4, (uint64_t)v10, v36, &v53);
    if (!v53)
    {
LABEL_72:
      unint64_t v39 = (unint64_t)(v10 + 263);
      do
      {
        if (v10[-1431655765 * ((v39 - (unint64_t)v35) >> 4) + 7] == (unsigned __int8 *)-1) {
          _xzm_segment_group_span_mark_free(v4, v39);
        }
        if ((*(unsigned char *)(v39 + 32) & 0xF) == 1) {
          unsigned int v40 = 1;
        }
        else {
          unsigned int v40 = *(_DWORD *)(v39 + 40);
        }
        v39 += 48 * v40;
      }
      while (v39 < (unint64_t)&v10[6 * *((unsigned int *)v10 + 4) + 263]);
      int v41 = *(_DWORD *)(v29 + 24);
      int v42 = v41;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v22, (unsigned int *)&v42, 0, memory_order_release, memory_order_relaxed);
      if (v42 != v41) {
        os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 4));
      }
      return;
    }
  }
  unsigned int v35 = (unsigned __int8 **)v36;
LABEL_82:
  uint64_t v43 = v35[2];
  if (v43)
  {
    *((void *)v43 + 3) = v35[3];
    uint64_t v43 = v35[2];
  }
  *(void *)v35[3] = v43;
  int v44 = *(_DWORD *)(v29 + 24);
  int v45 = v44;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v22, (unsigned int *)&v45, 0, memory_order_release, memory_order_relaxed);
  if (v45 != v44) {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 4));
  }
  _xzm_segment_group_segment_deallocate(v4, (uint64_t)v10, 1);
}

unint64_t _xzm_segment_group_segment_span_free_coalesce(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  char v5 = *(unsigned char *)(a3 + 32);
  unsigned int v6 = v5 & 0xF;
  if (v6 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v6);
  }
  unsigned int v10 = 1;
  if (((1 << v6) & 0x1B) == 0)
  {
    if (((1 << v6) & 0xE0) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if ((v5 & 0xD) != 1) {
    _xzm_segment_group_segment_span_free_coalesce_cold_4();
  }
  if (v6 != 1) {
LABEL_7:
  }
    unsigned int v10 = *(_DWORD *)(a3 + 40);
LABEL_8:
  if (a4)
  {
    *a4 = 1;
    char v5 = *(unsigned char *)(a3 + 32);
  }
  *(unsigned char *)(a3 + 32) = v5 & 0xF0;
  unint64_t v11 = a3 + 48 * v10;
  if (v11 < a2 + 48 * (unint64_t)*(unsigned int *)(a2 + 16) + 2104)
  {
    unsigned int v12 = v10;
    unint64_t v13 = a3 + 48 * v10;
    char v16 = *(unsigned char *)(v13 + 32);
    mach_vm_size_t v15 = (char *)(v13 + 32);
    char v14 = v16;
    if ((v16 & 0xD) == 1)
    {
      switch(*(unsigned char *)a1)
      {
        case 0:
        case 2:
          if (((*(unsigned __int8 *)(*(void *)(a1 + 24) + 328) >> 2) & 1) == 0) {
            goto LABEL_18;
          }
          goto LABEL_16;
        case 1:
        case 3:
          if ((*(unsigned char *)(*(void *)(a1 + 24) + 328) & 8) == 0) {
            goto LABEL_18;
          }
LABEL_16:
          if (_xzm_segment_group_span_mark_used(a1, v11))
          {
            char v14 = *v15;
LABEL_18:
            int v17 = v14 & 0xF;
            if (v17 != 1) {
              int v17 = *(_DWORD *)(a3 + 48 * v10 + 40);
            }
            v10 += v17;
            unint64_t v18 = a3 + 48 * v12;
            uint64_t v21 = *(void *)(v18 + 16);
            unint64_t v19 = (uint64_t *)(v18 + 16);
            uint64_t v20 = v21;
            if (v21)
            {
              *(void *)(v20 + 24) = *(void *)(a3 + 48 * v12 + 24);
              uint64_t v22 = *v19;
            }
            else
            {
              uint64_t v22 = 0;
            }
            **(void **)(a3 + 48 * v12 + 24) = v22;
          }
          else if (a4)
          {
            *a4 = 0;
          }
          break;
        default:
          _xzm_segment_group_find_and_allocate_chunk_cold_1(*(unsigned char *)a1);
      }
    }
  }
  if (a2 + 2104 >= a3) {
    goto LABEL_42;
  }
  unint64_t v23 = a3 - 48;
  if ((*(unsigned char *)(a3 - 16) & 0xF) != 4) {
    goto LABEL_28;
  }
  unint64_t v28 = v23 - *(unsigned int *)(a3 - 12);
  unsigned int v29 = *(unsigned char *)(v28 + 32) & 0xF;
  if (v29 > 8) {
    goto LABEL_28;
  }
  int v30 = 1 << v29;
  if ((v30 & 0x1E8) != 0)
  {
    if (v28 + 48 * *(unsigned int *)(v28 + 40) <= v23) {
      goto LABEL_28;
    }
    goto LABEL_50;
  }
  if ((v30 & 6) != 0 && v23 == v28) {
LABEL_50:
  }
    v23 -= *(unsigned int *)(a3 - 12);
LABEL_28:
  char v24 = *(unsigned char *)(v23 + 32);
  if ((v24 & 0xD) != 1)
  {
LABEL_42:
    unint64_t v23 = a3;
    goto LABEL_43;
  }
  switch(*(unsigned char *)a1)
  {
    case 0:
    case 2:
      if (((*(unsigned __int8 *)(*(void *)(a1 + 24) + 328) >> 2) & 1) == 0) {
        goto LABEL_35;
      }
      goto LABEL_33;
    case 1:
    case 3:
      if ((*(unsigned char *)(*(void *)(a1 + 24) + 328) & 8) == 0) {
        goto LABEL_35;
      }
LABEL_33:
      if (!_xzm_segment_group_span_mark_used(a1, v23))
      {
        if (a4) {
          *a4 = 0;
        }
        goto LABEL_42;
      }
      char v24 = *(unsigned char *)(v23 + 32);
LABEL_35:
      int v25 = v24 & 0xF;
      if (v25 != 1) {
        int v25 = *(_DWORD *)(v23 + 40);
      }
      v10 += v25;
      uint64_t v26 = *(void *)(v23 + 16);
      if (v26)
      {
        *(void *)(v26 + 24) = *(void *)(v23 + 24);
        uint64_t v26 = *(void *)(v23 + 16);
      }
      **(void **)(v23 + 24) = v26;
      break;
    default:
      _xzm_segment_group_find_and_allocate_chunk_cold_1(*(unsigned char *)a1);
  }
LABEL_43:
  _xzm_segment_group_segment_span_free(a1, a2, -1431655765 * ((v23 - (a2 + 2104)) >> 4), v10, 0);
  return v23;
}

unint64_t _xzm_malloc_large_huge(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4, char a5)
{
  uint64_t v5 = *(void *)(a1 + 232);
  if (!v5) {
    uint64_t v5 = a1;
  }
  unint64_t v6 = a2 + 0x3FFF;
  BOOL v8 = a3 > 0x100000 || ((a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000) > 0x200000;
  if (v8) {
    unsigned __int8 v9 = 7;
  }
  else {
    unsigned __int8 v9 = 6;
  }
  if (v6 >> 46) {
    goto LABEL_13;
  }
  BOOL v12 = HIWORD(a4) == 256 || v8;
  if (v12 || *(unsigned char *)(v5 + 344) == 2) {
    unint64_t v13 = ((unint64_t)*(unsigned __int8 *)(v5 + 328) >> 3) & 1;
  }
  else {
    LODWORD(v13) = 3;
  }
  mach_vm_address_t v14 = xzm_segment_group_alloc_chunk(*(void *)(v5 + 392) + 496 * v13, v9, 0, v6 >> 14, 0, a3, a5 & 1, (*(void *)(a1 + 296) >> 7) & 1);
  if (!v14) {
    goto LABEL_13;
  }
  mach_vm_address_t v15 = v14;
  int v16 = 0;
  *(_WORD *)(v14 + 34) = *(_WORD *)(a1 + 208);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 280), (unsigned int *)&v16, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v16) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v18 = a1 + 288;
  uint64_t v19 = *(void *)(a1 + 288);
  *(void *)(v15 + 16) = v19;
  if (v19) {
    *(void *)(*(void *)v18 + 24) = v15 + 16;
  }
  *(void *)uint64_t v18 = v15;
  *(void *)(v15 + 24) = v18;
  int v20 = *(_DWORD *)(StatusReg + 24);
  int v21 = v20;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 280), (unsigned int *)&v21, 0, memory_order_release, memory_order_relaxed);
  if (v21 != v20) {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 280));
  }
  unint64_t result = ((0xAAAAAAAAAAAAC000 * (((v15 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
         + *(void *)((v15 & 0xFFFFFFFFFFFFC000) + 0x30);
  if (!result)
  {
LABEL_13:
    unint64_t result = 0;
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }
  return result;
}

mach_vm_address_t xzm_segment_group_alloc_chunk(uint64_t a1, int a2, unsigned __int8 *a3, unsigned int a4, uint64_t *a5, unint64_t a6, int a7, int a8)
{
  kern_return_t v58;
  int v59;
  int v60;
  int v61;
  int v62;
  os_unfair_lock_t lock;
  int v64;
  mach_vm_address_t address;

  if (a2 == 7)
  {
    if (a6 >= 0x400000) {
      unint64_t v13 = a6;
    }
    else {
      unint64_t v13 = 0;
    }
    mach_vm_address_t address = 0;
    if (*(unsigned char *)a1 == 1 && *(_WORD *)(a1 + 480) && v13 <= 0x400000 && *(_DWORD *)(a1 + 484) >= a4)
    {
      int v14 = 0;
      mach_vm_address_t v15 = (atomic_uint *)(a1 + 488);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 488), (unsigned int *)&v14, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v14) {
        os_unfair_lock_lock_with_options();
      }
      if (*(_WORD *)(a1 + 482))
      {
        uint64_t v64 = a7;
        while (1)
        {
          unint64_t v17 = *(void *)(a1 + 464);
          if (!v17)
          {
LABEL_69:
            int v54 = *(_DWORD *)(StatusReg + 24);
            goto LABEL_71;
          }
          unint64_t v18 = 0;
          do
          {
            while (1)
            {
              unint64_t v19 = v17;
              unint64_t v17 = *(void *)(v17 + 24);
              unsigned int v20 = *(_DWORD *)(v19 + 12);
              BOOL v21 = v20 < a4 || v20 >= 2 * a4;
              if (v21 || v18 && v20 >= *(_DWORD *)(v18 + 12)) {
                goto LABEL_23;
              }
              if ((mach_vm_reclaim_is_available() & 1) == 0) {
                break;
              }
              unint64_t v18 = v19;
LABEL_23:
              if (!v17) {
                goto LABEL_26;
              }
            }
            _xzm_segment_group_cache_invalidate(a1, (void *)v19);
          }
          while (v17);
LABEL_26:
          if (!v18) {
            goto LABEL_69;
          }
          if (_xzm_segment_group_cache_mark_used(a1, v18))
          {
            int v22 = *(_DWORD *)(StatusReg + 24);
            int v23 = v22;
            atomic_compare_exchange_strong_explicit(v15, (unsigned int *)&v23, 0, memory_order_release, memory_order_relaxed);
            if (v23 != v22) {
              os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
            }
            _xzm_segment_table_allocated_at(*(void *)(a1 + 24), *(void *)(v18 + 48), v18);
            uint64_t v24 = v18 + 2104;
            char v25 = *(unsigned char *)(v18 + 2136);
            if (v64)
            {
              int v26 = v25 & 0xF;
              if ((v26 - 6) < 2)
              {
                size_t v27 = (unint64_t)*(unsigned int *)(v18 + 2144) << 14;
              }
              else if (v26 == 2)
              {
                size_t v27 = 0x4000;
              }
              else
              {
                if (v26 != 5) {
                  xzm_chunk_mark_free_cold_1(v26);
                }
                size_t v27 = 0x10000;
              }
              _xzm_segment_group_clear_chunk((char *)(((0xAAAAAAAAAAAAC000 * (((unint64_t)(v24 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)+ *(void *)((v24 & 0xFFFFFFFFFFFFC000) + 0x30)), v27);
              char v57 = *(unsigned char *)(v18 + 2136) | 0x10;
            }
            else
            {
              char v57 = v25 & 0xEF;
            }
            *(unsigned char *)(v18 + 2136) = v57;
            return v24;
          }
        }
      }
      int v54 = *(_DWORD *)(StatusReg + 24);
LABEL_71:
      int v55 = v54;
      atomic_compare_exchange_strong_explicit(v15, (unsigned int *)&v55, 0, memory_order_release, memory_order_relaxed);
      if (v55 != v54) {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 488));
      }
      mach_vm_address_t address = 0;
    }
    if (_xzm_segment_group_alloc_segment(a1, (unint64_t)a4 << 14, v13, (uint64_t *)&address, a8)) {
      return address;
    }
    else {
      return 0;
    }
  }
  int v31 = 0;
  if (a4 == 1 && a2 == 6) {
    unsigned int v33 = 2;
  }
  else {
    unsigned int v33 = a4;
  }
  int v34 = (os_unfair_lock_s *)(a1 + 4);
  unint64_t v35 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 4), (unsigned int *)&v31, *(_DWORD *)(v35 + 24), memory_order_acquire, memory_order_acquire);
  if (v31) {
    os_unfair_lock_lock_with_options();
  }
  chunatomic_ullong k = _xzm_segment_group_find_and_allocate_chunk(a1, a2, a3, a5, v33, a6);
  if (chunk)
  {
    uint64_t v24 = chunk;
    int v37 = *(_DWORD *)(v35 + 24);
    int v38 = v37;
    goto LABEL_45;
  }
  int v39 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v39, *(_DWORD *)(v35 + 24), memory_order_acquire, memory_order_acquire);
  BOOL v40 = v39 == 0;
  int v41 = *(_DWORD *)(v35 + 24);
  int v42 = v41;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 4), (unsigned int *)&v42, 0, memory_order_release, memory_order_relaxed);
  BOOL v43 = v42 == v41;
  os_unfair_lock_t lock = (os_unfair_lock_t)(a1 + 8);
  if (v40)
  {
    if (!v43) {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
    }
  }
  else
  {
    if (!v43) {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
    }
    uint64_t v59 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v59, *(_DWORD *)(v35 + 24), memory_order_acquire, memory_order_acquire);
    if (v59) {
      os_unfair_lock_lock_with_options();
    }
    uint64_t v60 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v34, (unsigned int *)&v60, *(_DWORD *)(v35 + 24), memory_order_acquire, memory_order_acquire);
    if (v60) {
      os_unfair_lock_lock_with_options();
    }
    uint64_t v24 = _xzm_segment_group_find_and_allocate_chunk(a1, a2, a3, a5, v33, a6);
    uint64_t v61 = *(_DWORD *)(v35 + 24);
    uint64_t v62 = v61;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 4), (unsigned int *)&v62, 0, memory_order_release, memory_order_relaxed);
    if (v62 != v61) {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
    }
    if (v24)
    {
      int v37 = *(_DWORD *)(v35 + 24);
      int v38 = v37;
      int v34 = (os_unfair_lock_s *)(a1 + 8);
LABEL_45:
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v34, (unsigned int *)&v38, 0, memory_order_release, memory_order_relaxed);
      if (v38 != v37) {
        os_unfair_lock_unlock(v34);
      }
      goto LABEL_56;
    }
  }
  uint64_t v24 = 0;
  if (_xzm_segment_group_alloc_segment(a1, 0, 0, 0, 0))
  {
    uint64_t v24 = _xzm_segment_group_find_and_allocate_chunk(a1, a2, a3, a5, v33, a6);
    int v44 = *(_DWORD *)(v35 + 24);
    int v45 = v44;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 4), (unsigned int *)&v45, 0, memory_order_release, memory_order_relaxed);
    if (v45 != v44) {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 4));
    }
  }
  int v46 = *(_DWORD *)(v35 + 24);
  int v47 = v46;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v47, 0, memory_order_release, memory_order_relaxed);
  if (v47 != v46) {
    os_unfair_lock_unlock(lock);
  }
  if (v24)
  {
LABEL_56:
    int v48 = *(unsigned char *)(v24 + 32) & 0xF;
    if ((v48 - 6) < 2)
    {
      mach_vm_size_t v49 = (unint64_t)*(unsigned int *)(v24 + 40) << 14;
    }
    else if (v48 == 2)
    {
      mach_vm_size_t v49 = 0x4000;
    }
    else
    {
      if (v48 != 5) {
        xzm_chunk_mark_free_cold_1(v48);
      }
      mach_vm_size_t v49 = 0x10000;
    }
    uint64_t v50 = *(void *)((v24 & 0xFFFFFFFFFFFFC000) + 0x30);
    unint64_t v51 = (0xAAAAAAAAAAAAC000 * (((unint64_t)(v24 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000;
    mach_vm_address_t v52 = v51 + v50;
    if ((*(unsigned char *)(v24 + 32) & 0x10) != 0) {
      goto LABEL_79;
    }
    if (a2 == 6 && (*(unsigned char *)(*(void *)(a1 + 24) + 328) & 2) != 0)
    {
      _xzm_segment_group_overwrite_chunk(v51 + v50, v49);
    }
    else
    {
      if (!a7)
      {
LABEL_79:
        if (a8)
        {
          mach_vm_address_t address = v52;
          uint64_t v58 = mach_vm_map(*MEMORY[0x1E4F14C48], &address, v49, 0, 33570818, 0, 0, 0, 3, 7, 1u);
          if (v58) {
            xzm_segment_group_alloc_chunk_cold_3(v58);
          }
        }
        return v24;
      }
      char v53 = (void *)(v51 + v50);
      if (a2 == 2) {
        bzero(v53, v49);
      }
      else {
        _xzm_segment_group_clear_chunk((char *)v53, v49);
      }
    }
    *(unsigned char *)(v24 + 32) |= 0x10u;
    goto LABEL_79;
  }
  return v24;
}

uint64_t _xzm_segment_group_find_and_allocate_chunk(uint64_t a1, int a2, unsigned __int8 *a3, uint64_t *a4, unsigned int a5, unint64_t a6)
{
  uint64_t v6 = 0;
  if (a6 > 0x4000) {
    unint64_t v7 = a6 >> 14;
  }
  else {
    unint64_t v7 = 0;
  }
  if (HIDWORD(v7)) {
    return v6;
  }
  unsigned int v8 = a5;
  if (a3 && *a3)
  {
    int v12 = a2;
    char v13 = arc4random_uniform(*a3);
    unsigned __int8 v14 = v13 + 1;
    int v15 = (v13 + 1) * v8;
    unsigned int v16 = (v15 * a3[1]) >> 8;
    if ((v13 + 1) * (_BYTE)v8 * a3[1])
    {
      uint32_t v17 = ((v13 + 1) * v8 * a3[1]);
      if (v17 > arc4random_uniform(0x100u)) {
        LOBYTE(v16) = v16 + 1;
      }
    }
    unsigned int v18 = v15 + v16;
    a2 = v12;
    if (!v7) {
      goto LABEL_14;
    }
  }
  else
  {
    LOBYTE(v16) = 0;
    unsigned __int8 v14 = 1;
    unsigned int v18 = a5;
    if (!v7) {
      goto LABEL_14;
    }
  }
  BOOL v19 = __CFADD__(v18, v7 - 1);
  v18 += v7 - 1;
  if (v19) {
    return 0;
  }
LABEL_14:
  unsigned int v20 = v18 - 1;
  unsigned int v21 = __clz(v18 - 1);
  unsigned int v22 = (((v18 - 1) >> (29 - v21)) & 3) - 4 * v21 + 119;
  if (v18 >= 9) {
    unsigned int v20 = v22;
  }
  int v23 = (uint64_t *)(a1 + 16 * v20 + 32);
  if ((unint64_t)v23 >= a1 + 464) {
    return 0;
  }
  int v48 = a2;
  unsigned __int8 v49 = v16;
  while (1)
  {
    uint64_t v24 = *v23;
    if (*v23) {
      break;
    }
LABEL_29:
    uint64_t v6 = 0;
    v23 += 2;
    if ((unint64_t)v23 >= a1 + 464) {
      return v6;
    }
  }
  while (1)
  {
    unsigned int v25 = (*(unsigned char *)(v24 + 32) & 0xF) == 1 ? 1 : *(_DWORD *)(v24 + 40);
    uint64_t v26 = *(void *)(v24 + 16);
    if (v25 >= v18) {
      break;
    }
LABEL_28:
    uint64_t v24 = v26;
    if (!v26) {
      goto LABEL_29;
    }
  }
  switch(*(unsigned char *)a1)
  {
    case 0:
    case 2:
      if (((*(unsigned __int8 *)(*(void *)(a1 + 24) + 328) >> 2) & 1) == 0) {
        goto LABEL_33;
      }
      goto LABEL_27;
    case 1:
    case 3:
      if ((*(unsigned char *)(*(void *)(a1 + 24) + 328) & 8) == 0) {
        goto LABEL_33;
      }
LABEL_27:
      if (!_xzm_segment_group_span_mark_used(a1, v24)) {
        goto LABEL_28;
      }
      uint64_t v26 = *(void *)(v24 + 16);
LABEL_33:
      if (v26)
      {
        *(void *)(v26 + 24) = *(void *)(v24 + 24);
        uint64_t v27 = *(void *)(v24 + 16);
      }
      else
      {
        uint64_t v27 = 0;
      }
      **(void **)(v24 + 24) = v27;
      unint64_t v28 = v24 & 0xFFFFFFFFFFFFC000;
      if (v7 && (unsigned int v29 = -1431655765 * ((v24 - v28 - 2104) >> 4) % v7) != 0)
      {
        v25 += v29 - v7;
        uint64_t v24 = _xzm_segment_group_segment_slice_split(a1, v24 & 0xFFFFFFFFFFFFC000, v24, v25, 1);
      }
      else
      {
        unsigned int v8 = v18;
      }
      if (v25 > v8) {
        _xzm_segment_group_segment_slice_split(a1, v28, v24, v8, 0);
      }
      uint64_t v30 = (uint64_t)(v24 - v28 - 2104) >> 4;
      if (v49)
      {
        unsigned int v31 = v14 + 1;
        int v32 = ~(-1 << (v14 + 1));
        int v33 = v48;
        if (v49 >= (3 * v31) >> 2)
        {
          uint64_t v41 = ~(-1 << (v14 + 1));
          uint32_t v42 = v14 + 1;
        }
        else if (v49 <= v31 >> 2)
        {
          uint64_t v41 = 0;
          uint32_t v42 = 0;
        }
        else
        {
          uint32_t v34 = arc4random() & v32;
          v35.i32[0] = v34;
          uint8x8_t v36 = (uint8x8_t)vcnt_s8(v35);
          v36.i16[0] = vaddlv_u8(v36);
          unsigned int v37 = v49 - v36.i32[0];
          if (v36.i32[0] >= v49) {
            unsigned int v37 = v36.i32[0] - v49;
          }
          unsigned int v38 = v49 - (v31 - v36.i32[0]);
          if (v31 - v36.i32[0] >= v49) {
            unsigned int v38 = v31 - v36.i32[0] - v49;
          }
          BOOL v39 = v37 > v38;
          if (v37 <= v38) {
            int v40 = 0;
          }
          else {
            int v40 = ~(-1 << (v14 + 1));
          }
          uint64_t v41 = v40 ^ v34;
          if (v39) {
            uint32_t v42 = v31 - v36.i32[0];
          }
          else {
            uint32_t v42 = v36.i32[0];
          }
        }
        if (v42 >= v49)
        {
          if (v42 > v49) {
            LODWORD(v41) = _xzm_random_clear_n_bits(v41, v42, v42 - v49);
          }
        }
        else
        {
          LODWORD(v41) = _xzm_random_clear_n_bits(v41 ^ v32, v31 - v42, v49 - v42) ^ v32;
        }
      }
      else
      {
        LODWORD(v41) = 0;
        int v33 = v48;
      }
      unsigned int v43 = -1431655765 * v30;
      if (v33 == 2)
      {
        unsigned int v8 = 1;
        if (v14) {
          goto LABEL_66;
        }
      }
      else
      {
        if (v33 == 5) {
          unsigned int v8 = 4;
        }
        if (v14)
        {
LABEL_66:
          int v44 = 0;
          uint64_t v6 = 0;
          char v45 = *(unsigned char *)(v28 + 48 * v43 + 2136) & 0x10;
          do
          {
            if (v41) {
              _xzm_segment_group_segment_create_guard(v28, v43++);
            }
            uint64_t v46 = _xzm_segment_group_segment_span_mark_allocated(v28, v33, v43, v8);
            *(unsigned char *)(v46 + 32) = *(unsigned char *)(v46 + 32) & 0xEF | v45;
            if (v44)
            {
              *(void *)(v46 + 16) = *a4;
              *a4 = v46;
            }
            else
            {
              uint64_t v6 = v46;
            }
            LODWORD(v41) = v41 >> 1;
            v43 += v8;
            ++v44;
          }
          while (v14 != v44);
          if (v41) {
            goto LABEL_74;
          }
          return v6;
        }
      }
      uint64_t v6 = 0;
      if (v41)
      {
LABEL_74:
        _xzm_segment_group_segment_create_guard(v28, v43);
        return v6;
      }
      break;
    default:
      _xzm_segment_group_find_and_allocate_chunk_cold_1(*(unsigned char *)a1);
  }
  return v6;
}

uint64_t _xzm_segment_group_segment_span_mark_allocated(uint64_t a1, int a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = a1 + 48 * a3;
  uint64_t v5 = v4 + 2104;
  unsigned int v6 = a4 - 1;
  if (a4 - 1 >= 3) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = v6;
  }
  unint64_t v8 = *(unsigned int *)(a1 + 16);
  if (v7 + a3 >= v8) {
    uint64_t v7 = v8 + ~a3;
  }
  if (v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 2;
    if ((unint64_t)(v7 + 1) > 2) {
      uint64_t v10 = v7 + 1;
    }
    uint64_t v11 = a1 + 48 * a3;
    uint64_t v12 = v10 - 1;
    do
    {
      uint64_t v13 = v11 + v9;
      *(unsigned char *)(v13 + 2184) = *(unsigned char *)(v11 + v9 + 2184) & 0xF0 | 4;
      v9 += 48;
      *(_DWORD *)(v13 + 2188) = v9;
      --v12;
    }
    while (v12);
    uint64_t v4 = a1 + 48 * a3 + v9;
  }
  unint64_t v14 = v4 + 2152;
  if (a2 == 7) {
    goto LABEL_16;
  }
  uint64_t v15 = a3 + a4 - 1;
  if (a1 + 48 * v15 + 2104 >= v14)
  {
    uint64_t v16 = a1 + 48 * v15;
    *(unsigned char *)(v16 + 2136) = *(unsigned char *)(v16 + 2136) & 0xF0 | 4;
    *(_DWORD *)(v16 + 2140) = 48 * v6;
  }
  if (a2 != 2) {
LABEL_16:
  }
    *(_DWORD *)(a1 + 48 * a3 + 2144) = a4;
  *(unsigned char *)(a1 + 48 * a3 + 2136) = *(unsigned char *)(a1 + 48 * a3 + 2136) & 0xF0 | a2 & 0xF;
  *(void *)(a1 + 8 * a3 + 56) = -1;
  ++*(_DWORD *)(a1 + 8);
  return v5;
}

uint64_t _xzm_segment_group_segment_slice_split(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  unsigned int v8 = *(_DWORD *)(a3 + 40) - a4;
  if (a5)
  {
    uint64_t v9 = a3 + 48 * v8;
    *(_DWORD *)(v9 + 40) = a4;
    char v10 = *(unsigned char *)(v9 + 32) & 0xF0 | 3;
    *(unsigned char *)(v9 + 32) = v10;
    *(unsigned char *)(v9 + 32) = v10 & 0xEF | *(unsigned char *)(a3 + 32) & 0x10;
    unsigned int v11 = -1431655765 * ((unint64_t)(a3 - a2 - 2104) >> 4);
  }
  else
  {
    unsigned int v11 = a4 - 1431655765 * ((unint64_t)(a3 - a2 - 2104) >> 4);
    uint64_t v9 = a3;
  }
  _xzm_segment_group_segment_span_free(a1, a2, v11, v8, (*(unsigned __int8 *)(a3 + 32) >> 4) & 1);
  switch(*(unsigned char *)a1)
  {
    case 0:
    case 2:
      if (((*(unsigned __int8 *)(*(void *)(a1 + 24) + 328) >> 2) & 1) == 0) {
        return v9;
      }
      goto LABEL_8;
    case 1:
    case 3:
      if ((*(unsigned char *)(*(void *)(a1 + 24) + 328) & 8) != 0)
      {
LABEL_8:
        if ((*(unsigned char *)(a2 + 48 * v11 + 2136) & 0x10) == 0) {
          _xzm_segment_group_span_mark_free(a1, a2 + 48 * v11 + 2104);
        }
      }
      return v9;
    default:
      _xzm_segment_group_find_and_allocate_chunk_cold_1(*(unsigned char *)a1);
  }
}

uint64_t _xzm_segment_group_segment_span_free(uint64_t result, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v5 = a2 + 48 * a3;
  unsigned int v6 = (unsigned char *)(v5 + 2136);
  if (a5) {
    char v7 = 16;
  }
  else {
    char v7 = 0;
  }
  char v8 = *(unsigned char *)(v5 + 2136) & 0xE0 | v7;
  unsigned int v9 = a4 - 1;
  if (a4 == 1)
  {
    *unsigned int v6 = v8 | 1;
    unsigned int v9 = *(unsigned __int8 *)(a2 + 20);
    if (*(unsigned char *)(a2 + 20)) {
      goto LABEL_13;
    }
  }
  else
  {
    *unsigned int v6 = v8 | 3;
    *(_DWORD *)(a2 + 2104 + 48 * a3 + 40) = a4;
    uint64_t v10 = a2 + 2104 + 48 * (v9 + a3);
    *(unsigned char *)(v10 + 32) = *(unsigned char *)(v10 + 32) & 0xF0 | 4;
    *(_DWORD *)(v10 + 36) = 48 * a4 - 48;
    if (*(unsigned char *)(a2 + 20)) {
      goto LABEL_13;
    }
    unsigned int v11 = __clz(v9);
    int v12 = ((v9 >> (29 - v11)) & 3) - 4 * v11 + 119;
    if (a4 >= 9) {
      unsigned int v9 = v12;
    }
  }
  uint64_t v13 = v5 + 2104;
  uint64_t v14 = result + 16 * v9;
  uint64_t v16 = *(void *)(v14 + 32);
  uint64_t v15 = v14 + 32;
  uint64_t v17 = a2 + 48 * a3;
  *(void *)(v17 + 2120) = v16;
  if (v16) {
    *(void *)(*(void *)v15 + 24) = v17 + 2120;
  }
  *(void *)uint64_t v15 = v13;
  *(void *)(v17 + 2128) = v15;
LABEL_13:
  *(void *)(a2 + 8 * a3 + 56) = -1;
  return result;
}

uint64_t _xzm_segment_group_span_mark_used(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = a2 & 0xFFFFFFFFFFFFC000;
  uint64_t v4 = -1431655765 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4);
  unsigned int v6 = (void *)((a2 & 0xFFFFFFFFFFFFC000) + 8 * v4 + 56);
  uint64_t v5 = *(void *)((a2 & 0xFFFFFFFFFFFFC000) + 8 * v4 + 0x38);
  if (v5 == -1) {
    return 1;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 24) + 464);
  if ((*(unsigned char *)(a2 + 32) & 0xF) == 1) {
    uint64_t v8 = 0x4000;
  }
  else {
    uint64_t v8 = (*(_DWORD *)(a2 + 40) << 14);
  }
  uint64_t result = xzm_reclaim_mark_used(v7, v5, *(void *)(v3 + 48) + (v4 << 14), v8, 1);
  if (result)
  {
    *unsigned int v6 = -1;
    return 1;
  }
  return result;
}

uint64_t _xzm_segment_group_span_mark_free(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = (a2 & 0xFFFFFFFFFFFFC000)
     + 0xFFFFFFFD55555558 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4);
  uint64_t result = xzm_reclaim_mark_free(*(void *)(*(void *)(a1 + 24) + 464));
  *(void *)(v2 + 56) = result;
  return result;
}

uint64_t xzm_reclaim_mark_free(uint64_t a1)
{
  int v2 = 0;
  unint64_t v3 = (os_unfair_lock_s *)(a1 + 32);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 32), (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v2) {
    os_unfair_lock_lock_with_options();
  }
  do
  {
    if (!*(_WORD *)(a1 + 40))
    {
      uint64_t v6 = mach_vm_reclaim_mark_free();
      goto LABEL_8;
    }
    unsigned __int16 v5 = *(_WORD *)(a1 + 40) - 1;
    *(_WORD *)(a1 + 40) = v5;
    uint64_t v6 = *(void *)(a1 + 40 + 8 * v5 + 8);
    int v7 = mach_vm_reclaim_mark_free_with_id();
  }
  while (v7 == 5);
  if (v7) {
    xzm_reclaim_mark_free_cold_1(v7);
  }
LABEL_8:
  int v8 = *(_DWORD *)(StatusReg + 24);
  int v9 = v8;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v3, (unsigned int *)&v9, 0, memory_order_release, memory_order_relaxed);
  if (v9 != v8) {
    os_unfair_lock_unlock(v3);
  }
  return v6;
}

uint64_t xzm_reclaim_mark_used(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  int v8 = 0;
  int v9 = (os_unfair_lock_s *)(a1 + 32);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 32), (unsigned int *)&v8, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v8) {
    os_unfair_lock_lock_with_options();
  }
  if (mach_vm_reclaim_mark_used())
  {
    uint64_t v11 = *(unsigned __int16 *)(a1 + 40);
    if (v11 >= 0x400) {
      xzm_reclaim_mark_used_cold_1();
    }
    *(_WORD *)(a1 + 40) = v11 + 1;
    uint64_t v12 = a1 + 40;
    *(void *)(v12 + 8 * v11 + 8) = a2;
    int v13 = *(_DWORD *)(StatusReg + 24);
    int v14 = v13;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v12 - 8), (unsigned int *)&v14, 0, memory_order_release, memory_order_relaxed);
    if (v14 != v13) {
      os_unfair_lock_unlock(v9);
    }
    return 1;
  }
  else
  {
    int v16 = *(_DWORD *)(StatusReg + 24);
    int v17 = v16;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
    if (v17 != v16) {
      os_unfair_lock_unlock(v9);
    }
    if (a5)
    {
      return MEMORY[0x1F40D0230](a1, a2);
    }
    else
    {
      return 0;
    }
  }
}

uint64_t _xzm_segment_group_clear_chunk(char *a1, size_t a2)
{
  unint64_t v2 = a2;
  unint64_t v3 = a1;
  uint64_t result = madvise(a1, a2, 11);
  if (v2 && result)
  {
    do
    {
      if (v2 >= 0x80000) {
        size_t v5 = 0x80000;
      }
      else {
        size_t v5 = v2;
      }
      bzero(v3, v5);
      uint64_t result = mvm_madvise(v3, v5, 7);
      v3 += v5;
      v2 -= v5;
    }
    while (v2);
  }
  return result;
}

uint64_t _xzm_segment_group_segment_create_guard(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = a1 + 2104 + 48 * a2;
  if (v2 + 48 < a1 + 2104 + 48 * (unint64_t)*(unsigned int *)(a1 + 16) && (*(unsigned char *)(v2 + 80) & 0xF) == 8) {
    unsigned int v3 = *(_DWORD *)(v2 + 88) + 1;
  }
  else {
    unsigned int v3 = 1;
  }
  if (v2 <= a1 + 2104) {
    goto LABEL_9;
  }
  unint64_t v4 = v2 - 48;
  if ((*(unsigned char *)(v2 - 16) & 0xF) == 4)
  {
    unint64_t v10 = v4 - *(unsigned int *)(v2 - 12);
    unsigned int v11 = *(unsigned char *)(v10 + 32) & 0xF;
    if (v11 <= 8)
    {
      int v12 = 1 << v11;
      if ((v12 & 0x1E8) != 0)
      {
        if (v10 + 48 * *(unsigned int *)(v10 + 40) <= v4) {
          goto LABEL_7;
        }
        goto LABEL_26;
      }
      if ((v12 & 6) != 0 && v4 == v10) {
LABEL_26:
      }
        v4 -= *(unsigned int *)(v2 - 12);
    }
  }
LABEL_7:
  if ((*(unsigned char *)(v4 + 32) & 0xF) == 8)
  {
    int v5 = *(_DWORD *)(v4 + 40);
    a2 -= v5;
    v3 += v5;
    goto LABEL_10;
  }
LABEL_9:
  unint64_t v4 = a1 + 2104 + 48 * a2;
LABEL_10:
  if (v3 < 2)
  {
    ++*(_DWORD *)(a1 + 8);
    uint64_t v7 = v3;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = v3;
    do
    {
      uint64_t v8 = v4 + v6;
      *(_DWORD *)(v8 + 84) = v6 + 48;
      *(unsigned char *)(v8 + 80) = *(unsigned char *)(v4 + v6 + 80) & 0xF0 | 4;
      v6 += 48;
    }
    while (48 * v3 - 48 != v6);
  }
  *(_DWORD *)(v4 + 40) = v3;
  uint64_t result = mprotect((void *)(*(void *)(a1 + 48) + ((unint64_t)a2 << 14)), v7 << 14, 0);
  if (result) {
    _xzm_segment_group_segment_create_guard_cold_1();
  }
  *(unsigned char *)(v4 + 32) = *(unsigned char *)(v4 + 32) & 0xF0 | 8;
  return result;
}

uint64_t _xzm_random_clear_n_bits(uint64_t a1, uint32_t __upper_bound, int a3)
{
  if (a3)
  {
    int v4 = a3;
    do
    {
      uint32_t v6 = arc4random_uniform(__upper_bound);
      int v7 = a1;
      if (v6)
      {
        int v7 = a1;
        do
        {
          v7 &= v7 - 1;
          --v6;
        }
        while (v6);
      }
      a1 = v7 & -v7 ^ a1;
      --__upper_bound;
      --v4;
    }
    while (v4);
  }
  return a1;
}

mach_vm_address_t mvm_allocate_plat(mach_vm_address_t a1, mach_vm_size_t size, char a3, int a4, __int16 a5, int a6)
{
  if (a1 && (a4 & 1) != 0) {
    malloc_zone_error(a5 | 0x40, 0, (uint64_t)"Unsupported anywhere allocation at address 0x%lx of size 0x%lx with flags %d\n");
  }
  if ((a5 & 0x200) != 0) {
    malloc_zone_error(a5 | 0x40, 0, (uint64_t)"Unsupported unpopulated allocation at address 0x%lx of size 0x%lx with flags %d\n");
  }
  mach_vm_address_t address = a1;
  if (mach_vm_map(*MEMORY[0x1E4F14C48], &address, size, ~(-1 << a3), a4 | (a6 << 24), 0, 0, 0, 3, 7, 1u)) {
    return 0;
  }
  else {
    return address;
  }
}

mach_vm_address_t _xzm_range_group_alloc_anywhere_segment(mach_vm_address_t a1, mach_vm_size_t size, unint64_t a3, uint64_t a4, char a5)
{
  kern_return_t v7;
  uint64_t v8;
  mach_vm_address_t address;

  mach_vm_address_t address = a1;
  if ((a5 & 2) != 0) {
    int v5 = ((a5 & 1) << 24) | 0x2000003;
  }
  else {
    int v5 = ((a5 & 1) << 24) | 0x2000001;
  }
  uint64_t v6 = 0x400000;
  if (a3 > 0x400000) {
    uint64_t v6 = a3;
  }
  int v7 = mach_vm_map(*MEMORY[0x1E4F14C48], &address, size, v6 - 1, v5, 0, 0, 0, 3, 7, 1u);
  if (!v7) {
    return address;
  }
  uint64_t v8 = 0;
  if (v7 != 3)
  {
    malloc_zone_error(0, 0, (uint64_t)"Failed to allocate segment (size=%lu, flags=%x, kr=%d)\n");
    return 0;
  }
  return v8;
}

void _xzm_initialize_xzone_data(uint64_t a1, char a2, char *a3, int a4)
{
  uint64_t v8 = *(void *)(a1 + 232);
  if (v8) {
    int v9 = *(void **)(a1 + 232);
  }
  else {
    int v9 = (void *)a1;
  }
  unint64_t __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  unint64_t v11 = __buf;
  if (!__buf)
  {
    unint64_t v11 = 0xDEADDEADDEADDEADLL;
    unint64_t __buf = 0xDEADDEADDEADDEADLL;
  }
  uint64_t v12 = 0;
  uint64_t v13 = 1;
  *(void *)(a1 + 272) = v11;
  do
  {
    if (!v8) {
      *(unsigned char *)(*(void *)(a1 + 368) + v12) = v13;
    }
    if (*(unsigned char *)(v9[45] + v12))
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
      int v16 = 88 * *(unsigned __int8 *)(v9[45] + v12);
      uint64_t v17 = 88 * v13;
      while (1)
      {
        unint64_t v18 = *(void *)(v9[44] + 8 * v12);
        if (v18 > 0x1000) {
          unint64_t v19 = 0x10000;
        }
        else {
          unint64_t v19 = 0x4000;
        }
        if (v8)
        {
          LOWORD(v20) = 0;
        }
        else
        {
          if (v18 > 0x100)
          {
            if (v18 > 0x200)
            {
              if (v18 > 0x800)
              {
                LOWORD(v20) = v18 <= 0x2000;
                goto LABEL_23;
              }
              unsigned int v21 = (unsigned __int16)*(void *)(v9[44] + 8 * v12);
              unsigned int v22 = 0x2000;
            }
            else
            {
              unsigned int v21 = (unsigned __int16)*(void *)(v9[44] + 8 * v12);
              unsigned int v22 = 4096;
            }
          }
          else
          {
            unsigned int v21 = (unsigned __int16)*(void *)(v9[44] + 8 * v12);
            unsigned int v22 = 2048;
          }
          int v20 = v22 / v21;
        }
LABEL_23:
        if (v15) {
          int v23 = a4;
        }
        else {
          int v23 = 1;
        }
        if (v23) {
          uint64_t v24 = 0;
        }
        else {
          uint64_t v24 = 992;
        }
        char v25 = *a3;
        if (*a3)
        {
          if (a3[1]) {
            LOBYTE(v23) = 0;
          }
          if (v23)
          {
            char v26 = 0;
            char v25 = 0;
            int v27 = 0;
          }
          else
          {
            uint64_t v28 = 4;
            if (v18 <= 0x1000) {
              uint64_t v28 = 2;
            }
            uint64_t v29 = 3;
            if (v18 > 0x1000) {
              uint64_t v29 = 5;
            }
            char v26 = a3[v28];
            char v25 = a3[v29];
            int v27 = 1;
          }
        }
        else
        {
          char v26 = 0;
          int v27 = v23 ^ 1;
        }
        uint64_t v30 = *(void *)(a1 + 216);
        unsigned int v31 = (_OWORD *)(v30 + v17 + v15);
        uint64_t v32 = v9[49] + v24;
        __int16 v33 = *(_WORD *)(a1 + 208);
        *unsigned int v31 = 0uLL;
        v31[1] = 0uLL;
        uint64_t v34 = v30 + v17 + v15;
        *(_WORD *)(v34 + 32) = v20;
        *(void *)(v34 + 40) = v32;
        *(void *)(v34 + 48) = v18;
        *(void *)(v34 + 56) = 0xFFFFFFFF / v18 + 1;
        *(_DWORD *)(v34 + 64) = 0xFFFFFFFF / v18 + 1;
        *(_DWORD *)(v34 + 68) = v19 / v18;
        *(unsigned char *)(v34 + 72) = v13 + v14;
        *(_WORD *)(v34 + 74) = v33;
        *(unsigned char *)(v34 + 76) = v14;
        LOBYTE(v32) = v10 & 0xFE;
        unsigned int v10 = v10 & 0xFFFFFFFE | v27;
        *(unsigned char *)(v34 + 77) = a2;
        *(unsigned char *)(v34 + 78) = v32 | v27;
        *(unsigned char *)(v34 + 79) = v26;
        *(unsigned char *)(v34 + 80) = v25;
        v15 += 88;
        ++v14;
        if (v16 == v15)
        {
          v13 += v14;
          break;
        }
      }
    }
    ++v12;
  }
  while (v12 != 40);
}

uint64_t _xzm_initialize_const_zone_data(uint64_t result, uint64_t a2, __int16 a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, int a10, unsigned int a11, int a12, uint64_t a13, uint64_t a14)
{
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = xzm_malloc_zone_size;
  *(void *)(result + 24) = xzm_malloc_zone_malloc;
  *(void *)(result + 32) = xzm_malloc_zone_calloc;
  *(void *)(result + 40) = xzm_malloc_zone_valloc;
  *(void *)(result + 48) = xzm_malloc_zone_free;
  *(void *)(result + 56) = xzm_malloc_zone_realloc;
  *(void *)(result + 64) = xzm_malloc_zone_destroy;
  *(void *)(result + 72) = 0;
  *(void *)(result + 80) = malloc_zone_batch_malloc_fallback;
  *(void *)(result + 88) = malloc_zone_batch_free_fallback;
  *(void *)(result + 96) = &xzm_malloc_zone_introspect;
  *(_DWORD *)(result + 104) = 16;
  *(void *)(result + 112) = xzm_malloc_zone_memalign;
  *(void *)(result + 120) = xzm_malloc_zone_free_definite_size;
  *(void *)(result + 128) = malloc_zone_pressure_relief_fallback;
  *(void *)(result + 136) = xzm_malloc_zone_claimed_address;
  *(void *)(result + 144) = xzm_malloc_zone_try_free_default;
  *(void *)(result + 152) = xzm_malloc_zone_malloc_with_options;
  *(void *)(result + 160) = xzm_malloc_zone_malloc_type_malloc;
  *(void *)(result + 168) = xzm_malloc_zone_malloc_type_calloc;
  *(void *)(result + 176) = xzm_malloc_zone_malloc_type_realloc;
  *(void *)(result + 184) = xzm_malloc_zone_malloc_type_memalign;
  *(void *)(result + 192) = xzm_malloc_zone_malloc_type_malloc_with_options;
  *(void *)(result + 200) = a2;
  *(_WORD *)(result + 208) = a3;
  *(unsigned char *)(result + 210) = a4;
  *(unsigned char *)(result + 211) = a5;
  *(void *)(result + 216) = a6;
  *(void *)(result + 224) = a7;
  *(void *)(result + 232) = a8;
  *(unsigned char *)(result + 240) = a9 & 3;
  *(_DWORD *)(result + 244) = a10;
  *(void *)(result + 248) = a11;
  *(_DWORD *)(result + 256) = a12;
  *(void *)(result + 264) = a13;
  *(void *)(result + 272) = 0;
  *(void *)(result + 280) = 0;
  *(void *)(result + 288) = 0;
  *(void *)(result + 296) = a14;
  if ((a14 & 0xA0) != 0)
  {
    *(void *)(result + 24) = xzm_malloc_zone_malloc_slow;
    *(void *)(result + 32) = xzm_malloc_zone_calloc_slow;
    *(void *)(result + 40) = xzm_malloc_zone_valloc_slow;
    *(void *)(result + 48) = xzm_malloc_zone_free_slow;
    *(void *)(result + 56) = xzm_malloc_zone_realloc_slow;
    *(void *)(result + 112) = xzm_malloc_zone_memalign_slow;
    *(void *)(result + 120) = xzm_malloc_zone_free_definite_size_slow;
    *(void *)(result + 144) = xzm_malloc_zone_try_free_default_slow;
    *(void *)(result + 152) = xzm_malloc_zone_malloc_with_options_slow;
    *(void *)(result + 160) = xzm_malloc_zone_malloc_type_malloc_slow;
    *(void *)(result + 168) = xzm_malloc_zone_malloc_type_calloc_slow;
    *(void *)(result + 176) = xzm_malloc_zone_malloc_type_realloc_slow;
    *(void *)(result + 184) = xzm_malloc_zone_malloc_type_memalign_slow;
    *(void *)(result + 192) = xzm_malloc_zone_malloc_type_malloc_with_options_slow;
  }
  return result;
}

void _xzm_segment_group_segment_deallocate(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    unint64_t v5 = *(void *)(a2 + 48);
    unint64_t v6 = v5 + ((unint64_t)*(unsigned int *)(a2 + 12) << 14);
    if (v5 < v6)
    {
      uint64_t v7 = *(void *)(a1 + 24);
      do
      {
        unint64_t v8 = v5 >> 22;
        if (v5 >> 36) {
          unint64_t v8 = 0x4000;
        }
        if (v8 >> 14) {
          int v9 = 0;
        }
        else {
          int v9 = (_DWORD *)(*(void *)(v7 + 408) + 4 * v8);
        }
        *int v9 = 0;
        v5 += 0x400000;
      }
      while (v5 < v6);
    }
  }
  mvm_deallocate_plat(*(void *)(a2 + 48), (unint64_t)*(unsigned int *)(a2 + 12) << 14, 0);
  unsigned int v10 = *(os_unfair_lock_s **)(*(void *)(a1 + 24) + 400);

  xzm_metapool_free(v10, (void *)a2);
}

void mvm_deallocate_plat(mach_vm_address_t address, mach_vm_size_t size, __int16 a3)
{
  if (mach_vm_deallocate(*MEMORY[0x1E4F14C48], address, size)) {
    malloc_zone_error(a3, 0, (uint64_t)"Failed to deallocate at address %p of size 0x%lx: %d\n");
  }
}

uint64_t _xzm_segment_group_cache_mark_free(uint64_t a1, void *a2)
{
  uint64_t result = xzm_reclaim_mark_free(*(void *)(*(void *)(a1 + 24) + 464));
  uint64_t v5 = *(void *)(a1 + 464);
  a2[3] = v5;
  BOOL v6 = v5 == 0;
  uint64_t v7 = (void *)(v5 + 32);
  if (v6) {
    uint64_t v7 = (void *)(a1 + 472);
  }
  *uint64_t v7 = a2 + 3;
  *(void *)(a1 + 464) = a2;
  a2[4] = a1 + 464;
  a2[5] = result;
  ++*(_WORD *)(a1 + 482);
  return result;
}

uint64_t nanov2_valloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 40))();
}

uint64_t _xzm_segment_group_cache_mark_used(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = xzm_reclaim_mark_used(*(void *)(*(void *)(a1 + 24) + 464), *(void *)(a2 + 40), *(void *)(a2 + 48), (unint64_t)*(unsigned int *)(a2 + 12) << 14, 0);
  if (v4)
  {
    *(void *)(a2 + 40) = -1;
    --*(_WORD *)(a1 + 482);
    uint64_t v5 = *(void *)(a2 + 24);
    BOOL v6 = *(void **)(a2 + 32);
    if (v5)
    {
      *(void *)(v5 + 32) = v6;
      BOOL v6 = *(void **)(a2 + 32);
    }
    else
    {
      *(void *)(a1 + 472) = v6;
    }
    *BOOL v6 = v5;
  }
  else
  {
    _xzm_segment_group_cache_invalidate(a1, (void *)a2);
  }
  return v4;
}

void *__cdecl malloc_type_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4 || malloc_absolute_max_size < size) {
    return (void *)_malloc_type_zone_memalign_outlined(zone, alignment, size, type_id);
  }
  if (default_zone == (_UNKNOWN *)zone) {
    uint64_t zone = *(malloc_zone_t **)malloc_zones;
  }
  if (alignment >= 8
    && zone->version >= 0x10
    && (uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)alignment), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] <= 1uLL))
  {
    return (void *)((uint64_t (*)(void))zone[1].calloc)();
  }
  else
  {
    return (void *)_malloc_type_zone_memalign_outlined(zone, alignment, size, type_id);
  }
}

void nanov2_madvise_block(const os_unfair_lock *a1, atomic_uint *a2, int a3, int a4)
{
  int v8 = 0;
  unint64_t v9 = (unint64_t)a2 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * a2) & 0xFC0 | (a2 >> 8) & 0x3F) << 14);
  unsigned int v10 = (os_unfair_lock_s *)&a1[7184];
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&a1[7184], (unsigned int *)&v8, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v8) {
    os_unfair_lock_lock_with_options();
  }
  nanov2_madvise_block_locked(a1, a2, v9, a3, a4);
  int v12 = *(_DWORD *)(StatusReg + 24);
  int v13 = v12;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v10, (unsigned int *)&v13, 0, memory_order_release, memory_order_relaxed);
  if (v13 != v12)
  {
    os_unfair_lock_unlock(v10);
  }
}

uint64_t nanov2_madvise_block_locked(const os_unfair_lock *a1, atomic_uint *a2, uint64_t a3, int a4, int a5)
{
  os_unfair_lock_assert_owner(a1 + 7184);
  atomic_uint v10 = *a2;
  if ((*a2 & 0x7FF) != a5) {
    return 0;
  }
  unsigned int v11 = (v10 + 0x200000) & 0x7FE00000 | 0x7FE;
  atomic_uint v12 = *a2;
  atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v12, v11, memory_order_relaxed, memory_order_relaxed);
  if (v12 == v10)
  {
    if (mvm_madvise_free(a1, a3 & 0xFFFFFFFFE0000000, a3, a3 + 0x4000, 0, 0))
    {
      __error();
      malloc_zone_error(0, 0, (uint64_t)"Failed to madvise block at blockp: %p, error: %d\n");
      uint64_t v13 = 0;
    }
    else
    {
      ++*(void *)&a1[8 * a4 + 7192]._os_unfair_lock_opaque;
      uint64_t v13 = 1;
    }
    int v14 = (v10 + 0x200000) & 0x7FE00000 | 0x7FE;
    atomic_compare_exchange_strong_explicit(a2, (unsigned int *)&v14, (v10 + 0x400000) & 0x7FE00000 | 0x7FF, memory_order_relaxed, memory_order_relaxed);
    if (v14 != v11) {
      malloc_zone_error(a1[7169]._os_unfair_lock_opaque, 0, (uint64_t)"Failed when changing state from MADVISING to MADVISED, block_metap = %p, blockp = %p\n");
    }
  }
  else
  {
    uint64_t v13 = 0;
    ++*(void *)&a1[8 * a4 + 7194]._os_unfair_lock_opaque;
  }
  return v13;
}

uint64_t mvm_madvise_free_plat(int a1, int a2, void *a3, unint64_t a4, void **a5, int a6)
{
  size_t v6 = a4 - (void)a3;
  if (a4 <= (unint64_t)a3) {
    return 0;
  }
  if (a6 && malloc_zero_policy) {
    _platform_memset();
  }
  if (a5)
  {
    if (*a5 == a3) {
      return 0;
    }
    *a5 = a3;
  }
  if (madvise(a3, v6, 7) != -1)
  {
    if (malloc_tracing_enabled) {
      kdebug_trace();
    }
    return 0;
  }
  return 1;
}

void pgm_free_definite_size(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 248) <= a2 && *(void *)(a1 + 256) > a2)
  {
    int v5 = 0;
    size_t v6 = (atomic_uint *)(a1 + 16680);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 16680), (unsigned int *)&v5, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v5) {
      os_unfair_lock_lock_with_options();
    }
    deallocate(a1, a2);
    int v8 = *(_DWORD *)(StatusReg + 24);
    int v9 = v8;
    atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v9, 0, memory_order_release, memory_order_relaxed);
    if (v9 != v8)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
    }
  }
  else
  {
    BOOL v4 = *(void (**)(void))(*(void *)(a1 + 200) + 120);
    v4();
  }
}

uint64_t pgm_malloc(uint64_t a1, unint64_t a2)
{
  BOOL v4 = (os_unfair_lock_s *)(a1 + 16680);
  if (*MEMORY[0x1E4F14C80] >= a2 && *(_DWORD *)(a1 + 16684) != *(_DWORD *)(a1 + 212))
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v7 = *(_DWORD *)(StatusReg + 880);
    if (v7 != -1)
    {
      if (v7)
      {
        uint32_t v9 = v7 - 1;
      }
      else
      {
        uint64_t v8 = *(unsigned int *)(a1 + 220);
        if (!v8) {
          purgeable_ptr_in_use_enumerator_cold_1(v8);
        }
        uint32_t v9 = arc4random_uniform(v8);
      }
      *(void *)(StatusReg + 880) = v9;
      if (!v9)
      {
        int v12 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v4, (unsigned int *)&v12, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v12) {
          os_unfair_lock_lock_with_options();
        }
        uint64_t v13 = allocate(a1, a2, 0x10uLL);
        int v14 = *(_DWORD *)(StatusReg + 24);
        int v15 = v14;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v4, (unsigned int *)&v15, 0, memory_order_release, memory_order_relaxed);
        if (v15 != v14) {
          os_unfair_lock_unlock(v4);
        }
        if (v13) {
          return v13;
        }
      }
    }
  }
  atomic_uint v10 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 24);

  return v10();
}

uint64_t malloc_zone_pressure_relief_fallback()
{
  return 0;
}

uint64_t pgm_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!is_mul_ok(a2, a3)) {
    goto LABEL_12;
  }
  size_t v6 = (atomic_uint *)(a1 + 16680);
  if (*MEMORY[0x1E4F14C80] < a2 * a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    goto LABEL_12;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v9 = *(_DWORD *)(StatusReg + 880);
  if (v9 == -1) {
    goto LABEL_12;
  }
  if (v9)
  {
    uint32_t v11 = v9 - 1;
  }
  else
  {
    uint64_t v10 = *(unsigned int *)(a1 + 220);
    if (!v10) {
      purgeable_ptr_in_use_enumerator_cold_1(v10);
    }
    uint32_t v11 = arc4random_uniform(v10);
  }
  *(void *)(StatusReg + 880) = v11;
  if (v11) {
    goto LABEL_12;
  }
  int v14 = 0;
  atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v14, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v14) {
    os_unfair_lock_lock_with_options();
  }
  int v15 = (void *)allocate(a1, a2 * a3, 0x10uLL);
  int v16 = *(_DWORD *)(StatusReg + 24);
  int v17 = v16;
  atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
  if (v17 != v16) {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  }
  if (!v15)
  {
LABEL_12:
    int v12 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 32);
    return v12();
  }
  else
  {
    bzero(v15, a2 * a3);
    return (uint64_t)v15;
  }
}

uint64_t malloc_engaged_nano()
{
  if (initial_nano_zone | initial_xzone_zone) {
    return _malloc_engaged_nano;
  }
  else {
    return 0;
  }
}

uint64_t default_zone_malloc_claimed_address(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = lite_zone;
  if (!lite_zone) {
    uint64_t v2 = *(void *)malloc_zones;
  }
  return malloc_zone_claimed_address(v2, a2);
}

void *__cdecl valloc(size_t a1)
{
  return (void *)_malloc_zone_valloc((uint64_t)default_zone, a1, 1);
}

void *reallocarray_DARWIN_EXTSN(void *a1, unint64_t a2, unint64_t a3)
{
  if (is_mul_ok(a2, a3)) {
    return j__realloc(a1, a2 * a3);
  }
  **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return 0;
}

void nanov2_configure_once()
{
  uint64_t v0 = 0;
  int32x4_t v1 = 0uLL;
  do
    int32x4_t v1 = vaddq_s32(vshlq_n_s32((int32x4_t)block_units_by_size_class[v0++], 6uLL), v1);
  while (v0 != 4);
  if (vaddvq_s32(v1) != 4096) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  first_block_offset_by_size_class[0] = 1;
  int v2 = LODWORD(block_units_by_size_class[0]) << 6;
  last_block_offset_by_size_class[0] = (LODWORD(block_units_by_size_class[0]) << 6) - 1;
  uint64_t v3 = 1u;
  do
  {
    first_block_offset_by_size_class[v3] = v2;
    v2 += *(_DWORD *)((char *)block_units_by_size_class + v3 * 4) << 6;
    last_block_offset_by_size_class[v3++] = v2 - 1;
  }
  while (v3 != 16);
  if (v2 != 4096) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  uint64_t v4 = 0;
  int v5 = 0;
  do
  {
    int v6 = *((_DWORD *)block_units_by_size_class + v4);
    if (v6 >= 1)
    {
      int v7 = &ptr_offset_to_size_class[v5];
      v5 += v6;
      do
      {
        *v7++ = v4;
        --v6;
      }
      while (v6);
    }
    ++v4;
  }
  while (v4 != 16);
  if (v5 != 64) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
}

malloc_zone_t *malloc_default_purgeable_zone(void)
{
  if (malloc_default_purgeable_zone_pred != -1) {
    _os_once();
  }
  return (malloc_zone_t *)default_purgeable_zone;
}

size_t malloc_zone_pressure_relief(malloc_zone_t *zone, size_t goal)
{
  if (!zone)
  {
    int v6 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v6) {
      os_unfair_lock_lock_with_options();
    }
    unsigned int v8 = malloc_num_zones;
    if (malloc_num_zones)
    {
      size_t v5 = 0;
      unsigned int v9 = 0;
      do
      {
        unint64_t v10 = v9;
        unsigned int v11 = v9 + 1;
        while (1)
        {
          uint64_t v12 = *((void *)malloc_zones + v10);
          if (*(_DWORD *)(v12 + 104) > 7u)
          {
            uint64_t v13 = *(uint64_t (**)(void))(v12 + 128);
            if (v13) {
              break;
            }
          }
          ++v10;
          ++v11;
          if (v10 >= v8) {
            goto LABEL_22;
          }
        }
        if (goal && goal <= v5) {
          break;
        }
        unsigned int v9 = v10 + 1;
        v5 += v13();
        unsigned int v8 = malloc_num_zones;
      }
      while (malloc_num_zones > v11);
    }
    else
    {
      size_t v5 = 0;
    }
LABEL_22:
    int v14 = *(_DWORD *)(StatusReg + 24);
    int v15 = v14;
    atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v15, 0, memory_order_release, memory_order_relaxed);
    if (v15 != v14) {
      os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
    }
    return v5;
  }
  if (zone->version < 8) {
    return 0;
  }
  pressure_relief = (uint64_t (*)(void))zone->pressure_relief;
  if (!pressure_relief) {
    return 0;
  }

  return pressure_relief();
}

unint64_t xzm_malloc_zone_malloc_type_malloc_slow(uint64_t a1, unint64_t a2, unint64_t a3, int8x8_t a4)
{
  uint64_t v4 = a1;
  if (a2 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0)
  {
    if (*(void *)(a1 + 232)) {
      a1 = *(void *)(a1 + 232);
    }
    if (*(void *)(a1 + 232)) {
      uint64_t v5 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v5 = a1;
    }
    unint64_t v6 = __clz(a2 - 1);
    unint64_t v7 = (((a2 - 1) >> (61 - v6)) & 3) - 4 * v6 + 488;
    if (a2 <= 0x80) {
      unint64_t v7 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    }
    if (!a2) {
      LOBYTE(v7) = 0;
    }
    uint64_t v8 = v7;
    char v9 = *(unsigned char *)(*(void *)(v5 + 368) + v7);
    if (HIWORD(a3) == 256)
    {
      char v10 = 0;
    }
    else if ((a3 & 0xC0000000000) == 0x40000000000)
    {
      char v10 = 1;
    }
    else
    {
      if (a3) {
        unsigned int v18 = a3;
      }
      else {
        unsigned int v18 = dword_1EB1C96FC;
      }
      LOBYTE(v19) = 0;
      switch(*(unsigned char *)(*(void *)(v5 + 360) + v8))
      {
        case 4:
          LODWORD(v19) = (*(_DWORD *)(v5 + 316) + *(_DWORD *)(v5 + 312) * v18) >> 31;
          break;
        case 5:
          unint64_t v22 = (*(void *)(v5 + 320) + *(void *)(v5 + 312) * (unint64_t)v18) >> 34;
          LODWORD(v19) = v22 - 3 * ((1431655766 * (unint64_t)v22) >> 32);
          break;
        case 6:
          unint64_t v19 = ((*(void *)(v5 + 320) + *(void *)(v5 + 312) * (unint64_t)v18) >> 32) & 3;
          break;
        default:
          break;
      }
      char v10 = v19 + 2;
    }
    unsigned int v23 = (v10 + v9);
LABEL_47:
    _xzm_xzone_malloc(a1, a2, v23, 0, a4);
    goto LABEL_48;
  }
  if (a2 <= 0x8000)
  {
    if (*(void *)(a1 + 232)) {
      uint64_t v12 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v12 = a1;
    }
    unint64_t v13 = __clz(a2 - 1);
    unint64_t v14 = (((a2 - 1) >> (61 - v13)) & 3) - 4 * v13 + 488;
    if (a2 <= 0x80) {
      unint64_t v14 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    }
    if (!a2) {
      LOBYTE(v14) = 0;
    }
    uint64_t v15 = v14;
    char v16 = *(unsigned char *)(*(void *)(v12 + 368) + v14);
    if (HIWORD(a3) == 256)
    {
      char v17 = 0;
    }
    else if ((a3 & 0xC0000000000) == 0x40000000000)
    {
      char v17 = 1;
    }
    else
    {
      if (a3) {
        unsigned int v20 = a3;
      }
      else {
        unsigned int v20 = dword_1EB1C96FC;
      }
      LOBYTE(v21) = 0;
      switch(*(unsigned char *)(*(void *)(v12 + 360) + v15))
      {
        case 4:
          LODWORD(v21) = (*(_DWORD *)(v12 + 316) + *(_DWORD *)(v12 + 312) * v20) >> 31;
          break;
        case 5:
          unint64_t v24 = (*(void *)(v12 + 320) + *(void *)(v12 + 312) * (unint64_t)v20) >> 34;
          LODWORD(v21) = v24 - 3 * ((1431655766 * (unint64_t)v24) >> 32);
          break;
        case 6:
          unint64_t v21 = ((*(void *)(v12 + 320) + *(void *)(v12 + 312) * (unint64_t)v20) >> 32) & 3;
          break;
        default:
          break;
      }
      char v17 = v21 + 2;
    }
    unsigned int v23 = (v17 + v16);
    goto LABEL_47;
  }
  unint64_t v11 = _xzm_malloc_large_huge(a1, a2, 0, a3, 0);
LABEL_48:
  unint64_t v25 = v11;
  if (v11 && (*(unsigned char *)(v4 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  return v25;
}

void pgm_free(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 248) <= a2 && *(void *)(a1 + 256) > a2)
  {
    int v5 = 0;
    unint64_t v6 = (atomic_uint *)(a1 + 16680);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 16680), (unsigned int *)&v5, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v5) {
      os_unfair_lock_lock_with_options();
    }
    deallocate(a1, a2);
    int v8 = *(_DWORD *)(StatusReg + 24);
    int v9 = v8;
    atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v9, 0, memory_order_release, memory_order_relaxed);
    if (v9 != v8)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
    }
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 200) + 48);
    v4();
  }
}

unint64_t large_try_shrink_in_place(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3 - a4;
  if (a3 != a4)
  {
    uint64_t v6 = a4;
    int v8 = 0;
    int v9 = (_DWORD *)(a1 + 16392);
    char v10 = (os_unfair_lock_s *)(a1 + 18816);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 18816), (unsigned int *)&v8, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v8) {
      os_unfair_lock_lock_with_options();
    }
    uint64_t v12 = large_entry_for_pointer_no_lock(a1, a2);
    if (v12)
    {
      *uint64_t v12 = a2;
      v12[1] = v6;
      *(void *)(a1 + 18840) -= v5;
      int v13 = *v9 & 3;
      int v14 = *(_DWORD *)(StatusReg + 24);
      int v15 = v14;
      atomic_compare_exchange_strong_explicit(v9 + 606, (unsigned int *)&v15, 0, memory_order_release, memory_order_relaxed);
      if (v15 != v14) {
        os_unfair_lock_unlock(v10);
      }
      if (v13)
      {
        char v16 = (uint64_t *)MEMORY[0x1E4F14C68];
        char v17 = (uint64_t *)MEMORY[0x1E4F14C80];
        if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
          size_t v18 = *MEMORY[0x1E4F14C80];
        }
        else {
          size_t v18 = *MEMORY[0x1E4F14C68];
        }
        if (mprotect((void *)(a2 + v6), v18, 0)) {
          malloc_report(3u, (uint64_t)"*** can't mvm_protect(0x0) region for new postlude guard page at %p\n");
        }
        uint64_t v19 = *v16;
        if (*v16 <= (unint64_t)*v17) {
          uint64_t v19 = *v17;
        }
        v6 += v19;
        v5 -= v19;
      }
      mvm_deallocate_pages(v6 + a2, v5, 0);
    }
    else
    {
      malloc_zone_error(*v9, 1, (uint64_t)"large entry %p reallocated is not properly in table\n");
      int v20 = *(_DWORD *)(StatusReg + 24);
      int v21 = v20;
      atomic_compare_exchange_strong_explicit(v9 + 606, (unsigned int *)&v21, 0, memory_order_release, memory_order_relaxed);
      if (v21 != v20) {
        os_unfair_lock_unlock(v10);
      }
    }
  }
  return a2;
}

void xzm_print(uint64_t a1, const void *a2, uint64_t (*a3)(void), void (*a4)(const char *, ...))
{
  uint64_t v95 = 0;
  uint64_t v96 = 0;
  unint64_t v94 = 0;
  if (!_xzm_introspect_map_zone_and_main(a1, (uint64_t)a2, (uint64_t (*)(uint64_t, uint64_t, uint64_t, void **))a3, &v96, &v95, &v94))
  {
    int v8 = (const void *)v94;
    a4("Begin xzone malloc JSON:\n");
    a4("{\n");
    a4("\"desc\": \"xzone malloc\", \n");
    a4("\"addr\": \"%p\", \n", a2);
    a4("\"segment_size\": %zu, \n", 0x400000uLL);
    a4("\"slice_size\": %zu, \n", 0x4000uLL);
    uint64_t v9 = v96;
    a4("\"mzone\": %d, \n", *(unsigned __int16 *)(v96 + 208));
    a4("\"is_main\": %d, \n", v8 == a2);
    a4("\"max_slot_config\": %d, \n", *(unsigned char *)(v9 + 240) & 3);
    uint64_t v90 = 0;
    unsigned int v91 = &v90;
    uint64_t v92 = 0x2000000000;
    uint64_t v93 = 0;
    uint64_t v86 = 0;
    uint64_t v87 = &v86;
    uint64_t v88 = 0x2000000000;
    uint64_t v89 = 0;
    v85[0] = 0;
    v85[1] = v85;
    v85[2] = 0x2000000000;
    v85[3] = 0;
    v83[0] = MEMORY[0x1E4F14BE8];
    v83[1] = 0x40000000;
    v83[2] = __xzm_print_block_invoke;
    v83[3] = &unk_1E574CFA8;
    int v84 = a1;
    v83[4] = v85;
    v83[5] = &v90;
    v83[6] = &v86;
    v83[7] = a4;
    uint64_t v79 = 0;
    unint64_t v80 = &v79;
    uint64_t v81 = 0x2000000000;
    char v82 = 1;
    uint64_t v75 = 0;
    unint64_t v76 = &v75;
    uint64_t v77 = 0x2000000000;
    char v78 = 1;
    v67[0] = MEMORY[0x1E4F14BE8];
    v67[1] = 0x40000000;
    uint64_t v68 = __xzm_print_block_invoke_2;
    unint64_t v69 = &unk_1E574CFD0;
    uint64_t v10 = v95;
    uint64_t v73 = a4;
    uint64_t v74 = v95;
    uint64_t v71 = &v79;
    unint64_t v72 = &v75;
    unsigned int v70 = v83;
    if (v8 != a2)
    {
      uint64_t v16 = v96;
      unint64_t v17 = v94;
LABEL_15:
      a4("\"spans\": {\n");
      *((unsigned char *)v80 + 24) = 1;
      *((unsigned char *)v76 + 24) = 0;
      v66[0] = MEMORY[0x1E4F14BE8];
      v66[1] = 0x40000000;
      v66[2] = __xzm_print_block_invoke_3;
      v66[3] = &unk_1E574CFF8;
      v66[5] = &v79;
      v66[6] = a4;
      v66[4] = v83;
      v65[0] = MEMORY[0x1E4F14BE8];
      v65[1] = 0x40000000;
      v65[2] = __xzm_print_block_invoke_4;
      v65[3] = &unk_1E574D020;
      v65[6] = a4;
      v65[7] = v10;
      v65[4] = v83;
      v65[5] = &v79;
      if (v8 == a2)
      {
        size_t v18 = v64;
        v64[0] = MEMORY[0x1E4F14BE8];
        v64[1] = 0x40000000;
        v64[2] = __xzm_print_block_invoke_5;
        v64[3] = &unk_1E574D048;
        v64[6] = a4;
        v64[7] = v10;
        v64[4] = v83;
        v64[5] = &v79;
      }
      else
      {
        size_t v18 = 0;
      }
      int v19 = _xzm_introspect_enumerate(a1, a3, (unint64_t)a2, v16, v17, v10, 0, (uint64_t)v66, (uint64_t)v67, (uint64_t)v65, (uint64_t)v18);
      mach_vm_address_t v20 = v87[3];
      if (v20) {
        mach_vm_deallocate(*MEMORY[0x1E4F14C48], v20, 4 * v91[3]);
      }
      if (!v19)
      {
        a4("}\n");
        a4("}\n");
        a4("End xzone malloc JSON\n");
      }
      goto LABEL_33;
    }
    a4("\"bucketing_key\": \"%016llx%016llx\", \n", *(void *)(v95 + 312), *(void *)(v95 + 320));
    a4("\"guard_config\": {\n");
    a4("    \"guards_enabled\": %d, \n", *(unsigned __int8 *)(v10 + 452));
    a4("    \"data_guards_enabled\": %d, \n", *(unsigned __int8 *)(v10 + 453));
    a4("    \"tiny_run_size\": %d, \n", *(unsigned __int8 *)(v10 + 454));
    a4("    \"tiny_guard_density\": %d, \n", *(unsigned __int8 *)(v10 + 455));
    a4("    \"small_run_size\": %d, \n", *(unsigned __int8 *)(v10 + 456));
    a4("    \"small_guard_density\": %d \n", *(unsigned __int8 *)(v10 + 457));
    a4("}, \n");
    if ((*(unsigned char *)(v10 + 328) & 8) != 0) {
      unint64_t v11 = "true";
    }
    else {
      unint64_t v11 = "false";
    }
    a4("\"defer_large\": %s, \n", v11);
    if ((*(unsigned char *)(v10 + 328) & 4) != 0) {
      uint64_t v12 = "true";
    }
    else {
      uint64_t v12 = "false";
    }
    a4("\"defer_xzones\": %s, \n", v12);
    uint64_t v13 = *(void *)(v10 + 464);
    if (v13)
    {
      v98[0] = 0;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t, void *))a3)(a1, v13, 8240, v98)) {
        goto LABEL_33;
      }
      uint64_t v14 = v98[0];
      size_t v97 = 0;
      if (*(void *)v98[0])
      {
        if (((unsigned int (*)(uint64_t, void, uint64_t, void **))a3)(a1, *(void *)v98[0], 16 * *(void *)(v98[0] + 8) + 32, &v97))
        {
          goto LABEL_33;
        }
        uint64_t v61 = v8;
        int v15 = v97;
      }
      else
      {
        uint64_t v61 = v8;
        int v15 = 0;
      }
      a4("\"reclaim_buffer\": { \n");
      a4("    \"va_in_buffer\": %llu, \n", *(void *)(v14 + 16));
      a4("    \"last_accounting_given_to_kernel\": %llu, \n", *(void *)(v14 + 24));
      a4("    \"buffer\": \"%p\", \n", *(const void **)v14);
      a4("    \"buffer_len\": %llu, \n", *(void *)(v14 + 8));
      if (*(void *)v14 && *(void *)(v14 + 8))
      {
        a4("    \"indices\": { \n");
        a4("        \"head\": %llu, \n", *v15);
        a4("        \"busy\": %llu, \n", v15[2]);
        a4("        \"tail\": %llu \n", v15[1]);
        a4("    }, \n");
        a4("    \"entries\": [ \n");
        if (*(void *)(v14 + 8))
        {
          unint64_t v21 = 0;
          unsigned int v22 = 0;
          do
          {
            unsigned int v23 = &v15[2 * v21];
            a4("        { \n");
            a4("            \"index\": %u, \n", v22);
            a4("            \"address\": \"%p\", \n", (const void *)v23[4]);
            a4("            \"size\": %u, \n", *((_DWORD *)v23 + 10));
            a4("            \"behavior\": %u, \n", *((unsigned __int16 *)v23 + 22));
            a4("            \"flags\": \"0x%x\" \n", *((unsigned __int16 *)v23 + 23));
            a4("        }");
            if (*(void *)(v14 + 8) - 1 > v21) {
              a4(",");
            }
            a4(" \n");
            unint64_t v21 = ++v22;
          }
          while (*(void *)(v14 + 8) > (unint64_t)v22);
        }
        a4("    ] \n");
      }
      a4("}, \n");
      int v8 = v61;
    }
    a4("\"range_groups\": {\n");
    unint64_t v24 = *(void *)(v10 + 384);
    if (v94 <= v24)
    {
      uint64_t v25 = *(unsigned __int8 *)(v10 + 329);
      unint64_t v26 = v24 - v94;
      if (!__CFADD__(v26, 56 * v25) && v26 + 56 * v25 <= *(void *)(v10 + 304))
      {
        int v27 = (unsigned __int8 *)(v26 + v10);
        if (v26 + v10)
        {
          uint64_t v62 = v8;
          unint64_t v60 = v94;
          if (*(unsigned char *)(v10 + 329))
          {
            unint64_t v28 = 0;
            do
            {
              a4("    ");
              if (v28) {
                a4(", ");
              }
              a4("\"%d\": {\n", *v27);
              a4("        \"id\": %d, \n", *v27);
              a4("        \"lock\": %u, \n", *((_DWORD *)v27 + 4));
              a4("        \"base\": \"%p\", \n", *((const void **)v27 + 3));
              a4("        \"size\": %zu, \n", *((void *)v27 + 4));
              a4("        \"next\": \"%p\", \n", *((const void **)v27 + 5));
              a4("        \"remaining\": %zu\n", *((void *)v27 + 6));
              a4("    }\n");
              ++v28;
              v27 += 56;
            }
            while (v28 < *(unsigned __int8 *)(v10 + 329));
          }
          a4("}, \n");
          a4("\"segment_groups\": {\n");
          unint64_t v29 = *(void *)(v10 + 392);
          if (v60 <= v29)
          {
            uint64_t v30 = *(unsigned __int8 *)(v10 + 344);
            unint64_t v31 = v29 - v60;
            if (!__CFADD__(v31, 496 * v30) && v31 + 496 * v30 <= *(void *)(v10 + 304))
            {
              unint64_t v32 = v31 + v10;
              if (v31 + v10)
              {
                if (*(unsigned char *)(v10 + 344))
                {
                  uint64_t v33 = 0;
                  while (1)
                  {
                    a4("    ");
                    if (v33) {
                      a4(", ");
                    }
                    a4("\"%d\": {\n", *(unsigned __int8 *)(v32 + 496 * v33));
                    unint64_t v34 = *(char *)(v32 + 496 * v33);
                    int8x8_t v35 = "unknown";
                    if (v34 <= 3) {
                      int8x8_t v35 = off_1E574D100[v34];
                    }
                    a4("        \"id\": \"%s\", \n", v35);
                    a4("        \"segment_cache\": { \n");
                    unint64_t v36 = v32 + 496 * v33;
                    a4("            \"max_count\": %u, \n", *(unsigned __int16 *)(v36 + 480));
                    a4("            \"count\": %u, \n", *(unsigned __int16 *)(v36 + 482));
                    a4("            \"max_entry_slices\": %u, \n", *(_DWORD *)(v36 + 484));
                    a4("            \"segments\": { \n");
                    if (*(_WORD *)(v36 + 482))
                    {
                      unsigned int v37 = *(const void **)(v32 + 496 * v33 + 464);
                      if (v37) {
                        break;
                      }
                    }
LABEL_58:
                    a4("            } \n");
                    a4("        } \n");
                    a4("    }\n");
                    if (++v33 >= (unint64_t)*(unsigned __int8 *)(v10 + 344)) {
                      goto LABEL_59;
                    }
                  }
                  while (1)
                  {
                    v98[0] = 0;
                    if (((unsigned int (*)(uint64_t, const void *, uint64_t, void *))a3)(a1, v37, 14392, v98)|| v68((uint64_t)v67, v37, v98[0], "                    "))
                    {
                      goto LABEL_33;
                    }
                    unsigned int v37 = *(const void **)(v98[0] + 24);
                    if (!v37) {
                      goto LABEL_58;
                    }
                  }
                }
LABEL_59:
                a4("}, \n");
                a4("\"xzones\": {\n");
                unint64_t v38 = *(void *)(v10 + 216);
                if (v60 <= v38)
                {
                  uint64_t v39 = 88 * *(unsigned __int8 *)(v10 + 210);
                  unint64_t v40 = v38 - v60;
                  BOOL v41 = __CFADD__(v38 - v60, v39);
                  unint64_t v42 = v38 - v60 + v39;
                  if (!v41)
                  {
                    unint64_t v43 = *(void *)(v10 + 304);
                    if (v42 <= v43)
                    {
                      unint64_t v58 = v40 + v10;
                      if (v40 + v10)
                      {
                        unint64_t v44 = *(void *)(v10 + 224);
                        if (v60 <= v44)
                        {
                          unint64_t v45 = *(unsigned __int8 *)(v10 + 210) * (unint64_t)*(unsigned __int8 *)(v10 + 211);
                          unint64_t v46 = v44 - v60;
                          BOOL v41 = __CFADD__(v44 - v60, 32 * v45);
                          unint64_t v47 = v44 - v60 + 32 * v45;
                          if (!v41 && v47 <= v43)
                          {
                            unint64_t v63 = v46 + v10;
                            if (v46 + v10)
                            {
                              uint64_t v16 = v96;
                              if (*(unsigned __int8 *)(v96 + 210) >= 2u)
                              {
                                unint64_t v48 = 1;
                                do
                                {
                                  a4("    \"%d\": {\n", v48);
                                  unint64_t v49 = v58 + 88 * v48;
                                  a4("        \"id\": %d, \n", *(unsigned __int8 *)(v49 + 72));
                                  a4("        \"bucket\": %d, \n", *(unsigned __int8 *)(v49 + 76));
                                  a4("        \"segment_group\": %zu, \n", 0xEF7BDEF7BDEF7BDFLL* ((uint64_t)(*(void *)(v49 + 40) - *(void *)(v10 + 392)) >> 4));
                                  uint64_t v50 = *(void *)(v49 + 48);
                                  v49 += 48;
                                  a4("        \"block_size\": %llu, \n", v50);
                                  a4("        \"chunk_capacity\": %u, \n", *(_DWORD *)(v49 + 20));
                                  a4("        \"sequestered\": %d,\n", *(unsigned char *)(v49 + 30) & 1);
                                  uint64_t v59 = (void *)v49;
                                  unint64_t v51 = *(char *)(v49 + 29);
                                  mach_vm_address_t v52 = "UNKNOWN";
                                  if (v51 <= 2) {
                                    mach_vm_address_t v52 = off_1E574D0E8[v51];
                                  }
                                  a4("        \"slot_config\": \"%s\",\n", v52);
                                  a4("        \"allocation_slots\": [\n");
                                  if (*(unsigned char *)(v16 + 211))
                                  {
                                    int v53 = 0;
                                    do
                                    {
                                      unint64_t v54 = v48;
                                      uint64_t v55 = v48 + v53 * *(unsigned __int8 *)(v16 + 210);
                                      unint64_t v56 = v63 + 32 * v55;
                                      a4("            {\n");
                                      if (*v59 > 0x1000uLL)
                                      {
                                        a4("                \"chunk\": \"%p\",\n", *(const void **)v56);
                                        a4("                \"allocations\": %lu,\n", *(unsigned int *)(v56 + 16));
                                        char v57 = "                \"contentions\": %lu,\n";
                                      }
                                      else
                                      {
                                        a4("                \"atomic_value\": \"0x%llx\",\n", *(void *)v56);
                                        a4("                \"xsg_locked\": \"0x%llx\",\n", *(_DWORD *)v56 & 1);
                                        a4("                \"xsg_waiters\": \"0x%llx\",\n", (*(_DWORD *)v56 >> 1) & 1);
                                        a4("                \"xsc_ptr\": \"0x%llx\",\n", (*(void *)v56 >> 2) & 0x7FFFFFFFFFFFLL);
                                        a4("                \"allocations\": %lu,\n", *(unsigned int *)(v56 + 16));
                                        a4("                \"contentions\": %lu,\n", *(_DWORD *)(v56 + 20) & 0xFFFFFF);
                                        char v57 = "                \"slot_config\": \"%s\",\n";
                                      }
                                      a4(v57);
                                      unint64_t v48 = v54;
                                      a4("                \"last_chunk_empty_ts\": %llu\n", *(void *)(v63 + 32 * v55 + 24));
                                      a4("            }");
                                      if (*(unsigned __int8 *)(v16 + 211) - 1 > v53) {
                                        a4(",");
                                      }
                                      a4("\n");
                                      ++v53;
                                    }
                                    while (v53 < *(unsigned __int8 *)(v16 + 211));
                                  }
                                  a4("        ]\n");
                                  a4("    }");
                                  if (*(unsigned __int8 *)(v16 + 210) - 1 > (int)v48) {
                                    a4(",");
                                  }
                                  a4("\n");
                                  ++v48;
                                }
                                while (v48 < *(unsigned __int8 *)(v16 + 210));
                              }
                              a4("}, \n");
                              unint64_t v17 = v60;
                              int v8 = v62;
                              goto LABEL_15;
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
    }
LABEL_33:
    _Block_object_dispose(&v75, 8);
    _Block_object_dispose(&v79, 8);
    _Block_object_dispose(v85, 8);
    _Block_object_dispose(&v86, 8);
    _Block_object_dispose(&v90, 8);
  }
}

uint64_t trace_collect(uint64_t a1, uint64_t a2)
{
  v14[65] = *(void **)MEMORY[0x1E4F14BF8];
  unsigned int v4 = backtrace(v14, 65);
  if (v4 < 2) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = v4 - 1;
  while (2)
  {
    if (v6) {
      uint64_t v9 = v14[v6];
    }
    else {
      uint64_t v9 = 0;
    }
    uint64_t v10 = (unsigned char *)v14[v6 + 1] - v9;
    if (v10 >= -3) {
      unint64_t v11 = 2 * (v10 / 4);
    }
    else {
      unint64_t v11 = ~(2 * (v10 / 4));
    }
    uint64_t result = v7;
    do
    {
      if (a2 == result) {
        return v7;
      }
      char v12 = v11;
      *(unsigned char *)(a1 + result++) = v11 & 0x7F;
      BOOL v13 = v11 > 0x7F;
      v11 >>= 7;
    }
    while (v13);
    *(unsigned char *)(a1 + result - 1) = v12 | 0x80;
    ++v6;
    uint64_t v7 = result;
    if (v6 != v8) {
      continue;
    }
    break;
  }
  return result;
}

unint64_t small_size(uint64_t a1, uint64_t a2)
{
  int v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *v2;
  if (*v2)
  {
    unint64_t v4 = a2 & 0xFFFFFFFFFF800000;
    uint64_t v5 = v2[2];
    unint64_t v6 = (0x9E3779B97F4A7C55 * ((a2 & 0xFFFFFFFFFF800000) >> 20)) >> -*((unsigned char *)v2 + 8);
    unint64_t v7 = v6;
    while (1)
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7);
      if (!v8) {
        return 0;
      }
      if (v8 == v4) {
        break;
      }
      if (v7 + 1 == v3) {
        unint64_t v7 = 0;
      }
      else {
        ++v7;
      }
      if (v7 == v6) {
        return 0;
      }
    }
    if (v4)
    {
      unint64_t v9 = ((unint64_t)(a2 - v4 - 33280) >> 9) & 0x3FFF;
      if (v9 <= 0x3FBE)
      {
        int v10 = *(__int16 *)((a2 & 0xFFFFFFFFFF800000) + 2 * v9 + 0x28);
        if ((v10 & 0x80000000) == 0)
        {
          int v11 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
          if (v11 != -1)
          {
            if (*(void *)(*(void *)(a1 + 624) + 2560 * v11 + 8) == a2) {
              return 0;
            }
            return (unint64_t)(unsigned __int16)v10 << 9;
          }
          uint64_t v13 = *(unsigned int *)(a1 + 608);
          if ((int)v13 < 1) {
            return (unint64_t)(unsigned __int16)v10 << 9;
          }
          for (unint64_t i = (void *)(*(void *)(a1 + 624) + 8); *i != a2; i += 320)
          {
            if (!--v13) {
              return (unint64_t)(unsigned __int16)v10 << 9;
            }
          }
        }
      }
    }
  }
  return 0;
}

void small_free_list_remove_ptr(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  if (a3)
  {
    unint64_t v4 = a3 & 0xFFFFFFFFFF800000;
    if ((a3 & 0xFFFFFFFFFF800000 | 0x7FA6) > a3)
    {
      unint64_t v5 = a3;
    }
    else
    {
      unint64_t v5 = a3;
      if ((v4 | 0x81F8) > a3)
      {
        __int16 v6 = *(_WORD *)(a3 + 16);
        unint64_t v7 = v4 + ((unint64_t)(v6 & 0x7FFF) << 9);
        if (v6 < 0) {
          unint64_t v5 = v7;
        }
        else {
          unint64_t v5 = 0;
        }
      }
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  unint64_t v8 = v5 & 0xFFFFFFFFFF800000;
  unint64_t v9 = ((v5 - (v5 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF;
  unint64_t v10 = ((unint64_t)(v5 + (a4 << 9) - 33281) >> 9) & 0x3FFF;
  if (v9 > v10) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  uint64_t v11 = v8 | 0x28;
  if ((*(_WORD *)(v11 + 2 * v9) & 0x7FFF) != a4) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  *(_WORD *)(v11 + 2 * v9) = 0;
  *(_WORD *)(v11 + 2 * v10) = 0;

  small_free_list_remove_ptr_no_clear(a1, a2, a3, a4);
}

uint64_t my_vm_protect(mach_vm_address_t address, uint64_t a2, vm_prot_t new_protection)
{
  uint64_t result = mach_vm_protect(*MEMORY[0x1E4F14C48], address, (a2 + *MEMORY[0x1E4F14C80] - 1) & -*MEMORY[0x1E4F14C80], 0, new_protection);
  if (result) {
    purgeable_ptr_in_use_enumerator_cold_1(result);
  }
  return result;
}

void mvm_deallocate_pages_plat(mach_vm_address_t a1, mach_vm_size_t a2, __int16 a3)
{
  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) == 0) {
      goto LABEL_3;
    }
    goto LABEL_7;
  }
  uint64_t v3 = *MEMORY[0x1E4F14C68];
  if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
    uint64_t v3 = *MEMORY[0x1E4F14C80];
  }
  a1 -= v3;
  a2 += v3;
  if ((a3 & 2) != 0)
  {
LABEL_7:
    uint64_t v4 = *MEMORY[0x1E4F14C68];
    if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
      uint64_t v4 = *MEMORY[0x1E4F14C80];
    }
    a2 += v4;
  }
LABEL_3:
  mvm_deallocate_plat(a1, a2, a3);
}

mach_vm_address_t large_entry_grow_and_insert_no_lock(uint64_t a1, unint64_t a2, unint64_t a3, void *a4)
{
  unint64_t v7 = (_DWORD *)(a1 + 16392);
  unsigned int v8 = *(_DWORD *)(a1 + 18824);
  unint64_t v9 = (_DWORD *)MEMORY[0x1E4F14C78];
  if (4 * *(_DWORD *)(a1 + 18820) + 4 > v8)
  {
    if (v8)
    {
      unsigned int v11 = (2 * v8) | 1;
    }
    else
    {
      unint64_t v12 = *MEMORY[0x1E4F14C68];
      if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
        unint64_t v12 = *MEMORY[0x1E4F14C80];
      }
      unsigned int v11 = v12 / 0x18 - 1;
    }
    uint64_t v13 = *(void *)(a1 + 18832);
    uint64_t v14 = *MEMORY[0x1E4F14C58];
    int v15 = (uint64_t *)MEMORY[0x1E4F14C70];
    if (*MEMORY[0x1E4F14C58] <= *MEMORY[0x1E4F14C70]) {
      uint64_t v14 = *MEMORY[0x1E4F14C70];
    }
    mach_vm_address_t result = mvm_allocate_pages((v14 + 24 * v11) & ~v14, 0, (2 * *v7) & 0x40000000 | *v7 & 0x60000000u, 3);
    if (!result) {
      return result;
    }
    v7[608] = v11;
    *(void *)(a1 + 18832) = result;
    if (v8)
    {
      unsigned int v17 = v8;
      do
      {
        while (1)
        {
          size_t v18 = (uint64_t *)(v13 + 24 * --v17);
          unint64_t v19 = *v18;
          if (*v18) {
            break;
          }
LABEL_19:
          if (!v17) {
            goto LABEL_22;
          }
        }
        long long v27 = *(_OWORD *)(v18 + 1);
        unint64_t v20 = v7[608];
        unsigned int v21 = (v19 >> *v9) % v20;
        while (1)
        {
          uint64_t v22 = *(void *)(a1 + 18832) + 24 * v21;
          if (!*(void *)v22) {
            break;
          }
          if (v21 + 1 == v20) {
            unsigned int v21 = 0;
          }
          else {
            ++v21;
          }
          if (v21 == ((v19 >> *v9) % v20)) {
            goto LABEL_19;
          }
        }
        *(void *)uint64_t v22 = v19;
        *(_OWORD *)(v22 + 8) = v27;
      }
      while (v17);
    }
LABEL_22:
    if (v13)
    {
      *a4 = v13;
      uint64_t v23 = *MEMORY[0x1E4F14C58];
      if (*MEMORY[0x1E4F14C58] <= (unint64_t)*v15) {
        uint64_t v23 = *v15;
      }
      a4[1] = (v23 + 24 * v8) & ~v23;
    }
    else
    {
      *a4 = 0;
      a4[1] = 0;
    }
  }
  unint64_t v24 = v7[608];
  unsigned int v25 = (a2 >> *v9) % v24;
  while (1)
  {
    unint64_t v26 = (unint64_t *)(*(void *)(a1 + 18832) + 24 * v25);
    if (!*v26) {
      break;
    }
    if (v25 + 1 == v24) {
      unsigned int v25 = 0;
    }
    else {
      ++v25;
    }
    if (v25 == ((a2 >> *v9) % v24)) {
      goto LABEL_35;
    }
  }
  *unint64_t v26 = a2;
  v26[1] = a3;
  v26[2] = -1;
LABEL_35:
  ++v7[607];
  *(void *)(a1 + 18840) += a3;
  return 1;
}

uint64_t large_debug_print(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int (*a4)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a5)(const char *, ...))
{
  uint64_t v21 = 0;
  if (a4(a1, a3, 20480, &v21))
  {
    unsigned int v8 = "Failed to read szone structure\n";
    return ((uint64_t (*)(const char *))a5)(v8);
  }
  uint64_t result = _simple_salloc();
  if (result)
  {
    uint64_t v20 = 0;
    if (a4(a1, *(void *)(v21 + 18832), 24 * *(unsigned int *)(v21 + 18824), &v20))
    {
      unsigned int v8 = "Failed to read large entries\n";
      return ((uint64_t (*)(const char *))a5)(v8);
    }
    _simple_sprintf();
    uint64_t v10 = v21;
    unsigned int v11 = (uint64_t *)MEMORY[0x1E4F14C68];
    unint64_t v12 = (uint64_t *)MEMORY[0x1E4F14C80];
    if (*(_DWORD *)(v21 + 18824))
    {
      unsigned int v13 = 0;
      uint64_t v14 = (void *)(v20 + 8);
      do
      {
        if (*(v14 - 1))
        {
          _simple_sprintf();
          uint64_t v15 = *v11;
          if (*v11 <= (unint64_t)*v12) {
            uint64_t v15 = *v12;
          }
          if (!((unint64_t)(*v14 + 2 * v15) >> 32)) {
            mvm_reclaim_is_available();
          }
          _simple_sprintf();
          uint64_t v10 = v21;
        }
        ++v13;
        v14 += 3;
      }
      while (v13 < *(_DWORD *)(v10 + 18824));
    }
    if (large_cache_enabled)
    {
      _simple_sprintf();
      _simple_sprintf();
      if (*(_DWORD *)(v21 + 20392))
      {
        unsigned int v16 = 0;
        uint64_t v17 = v21 + 18872;
        do
        {
          _simple_sprintf();
          uint64_t v18 = *v11;
          if (*v11 <= (unint64_t)*v12) {
            uint64_t v18 = *v12;
          }
          if (!((unint64_t)(*(void *)(v17 - 8) + 2 * v18) >> 32)) {
            mvm_reclaim_is_available();
          }
          _simple_sprintf();
          ++v16;
          v17 += 24;
        }
        while (v16 < *(_DWORD *)(v21 + 20392));
      }
    }
    _simple_sprintf();
    unint64_t v19 = (const char *)_simple_string();
    a5("%s\n", v19);
    return _simple_sfree();
  }
  return result;
}

uint64_t debug_zone(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(result + 224))
  {
    uint64_t v4 = result;
    uint64_t v5 = mach_absolute_time();
    uint64_t v6 = v5 - *(void *)(v4 + 16712);
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    if (*(void *)(v4 + 232) <= v6 * info.numer / info.denom / 0xF4240)
    {
      *(void *)(v4 + 16712) = v5;
      malloc_report(6u, (uint64_t)"ProbGuard: %9s 0x%llx, fill state: %3u/%u\n");
    }
    uint64_t result = pgm_check(v4);
    if (!result) {
      debug_zone_cold_1(a3);
    }
  }
  return result;
}

uint64_t allocate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3 = (uint64_t *)MEMORY[0x1E4F14C80];
  unint64_t v4 = *MEMORY[0x1E4F14C80];
  if (*MEMORY[0x1E4F14C80] < a2) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  if (a3 < 0x10 || v4 < a3) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  uint8x8_t v6 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v6.i16[0] = vaddlv_u8(v6);
  if (v6.u32[0] != 1) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  uint64_t v7 = a1;
  unsigned int v8 = (_DWORD *)(a1 + 16684);
  if (*(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    return 0;
  }
  if (a2) {
    unint64_t v10 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  else {
    unint64_t v10 = 16;
  }
  uint64_t v11 = *(unsigned int *)(a1 + 16692);
  uint64_t v12 = *(void *)(a1 + 280);
  int v13 = *(_DWORD *)(v12 + 8 * v11) & 3;
  unsigned int v14 = *(_DWORD *)(a1 + 208);
  while (v13 == 1)
  {
    LODWORD(v11) = ((int)v11 + 1) % v14;
    int v13 = *(_DWORD *)(v12 + 8 * v11) & 3;
  }
  *(_DWORD *)(a1 + 16692) = ((int)v11 + 1) % v14;
  LODWORD(v15) = *(_DWORD *)(a1 + 16688);
  if (v15 >= *(_DWORD *)(a1 + 216))
  {
    unint64_t v15 = (unint64_t)*(unsigned int *)(v12 + 8 * v11) >> 2;
    if (*(_DWORD *)(*(void *)(a1 + 288) + (v15 << 8)) != v11)
    {
      do
      {
        uint64_t v16 = *(unsigned int *)(v7 + 216);
        if (!v16) {
          purgeable_ptr_in_use_enumerator_cold_1(v16);
        }
        a1 = arc4random_uniform(v16);
      }
      while ((*(_DWORD *)(*(void *)(v7 + 280)
                         + 8 * *(unsigned int *)(*(void *)(v7 + 288) + ((unint64_t)a1 << 8))) & 3) != 2);
      unint64_t v4 = *v3;
      LODWORD(v15) = a1;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 16688) = v15 + 1;
  }
  if ((unsigned __int16)v4 < v10) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  if ((unsigned __int16)v4 < a3) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)(unsigned __int16)v4);
  v17.i16[0] = vaddlv_u8(v17);
  if (v17.u32[0] != 1) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  uint64_t v18 = arc4random_uniform(2u);
  if (*(_DWORD *)(v7 + 208) <= v11) {
    purgeable_ptr_in_use_enumerator_cold_1(v18);
  }
  if (v18) {
    unsigned __int16 v19 = 0;
  }
  else {
    unsigned __int16 v19 = (v4 - v10) & -(__int16)a3;
  }
  mach_vm_address_t v20 = *(void *)(v7 + 248) + *v3 * ((2 * v11) | 1u);
  my_vm_protect(v20, *v3, 3);
  uint64_t v21 = *(void *)(v7 + 280) + 8 * v11;
  *(_DWORD *)uint64_t v21 = (4 * v15) | 1;
  *(_WORD *)(v21 + 4) = v10;
  *(_WORD *)(v21 + 6) = v19;
  unint64_t v22 = *(void *)(v7 + 288) + ((unint64_t)v15 << 8);
  *(_DWORD *)unint64_t v22 = v11;
  *(void *)(v22 + 4) = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  *(void *)(v22 + 12) = mach_absolute_time();
  *(void *)(v22 + 30) = 0;
  *(void *)(v22 + 22) = 0;
  *(_WORD *)(v22 + 38) = 0;
  *(_WORD *)(v22 + 20) = trace_collect(v22 + 40, 216);
  ++*v8;
  unint64_t v23 = *(void *)(v7 + 16696) + v10;
  *(void *)(v7 + 16696) = v23;
  if (v23 <= *(void *)(v7 + 16704)) {
    unint64_t v23 = *(void *)(v7 + 16704);
  }
  *(void *)(v7 + 16704) = v23;
  uint64_t v9 = v20 + v19;
  debug_zone(v7, (uint64_t)"allocated", v9);
  return v9;
}

uint64_t _malloc_type_malloc_outlined(size_t __size, unint64_t a2, int a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a2 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = a2;
  }
  *(void *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6 || a3 == 0) {
    uint64_t result = _malloc_zone_malloc((uint64_t)default_zone, __size, 1);
  }
  else {
    uint64_t result = (uint64_t)j__malloc(__size);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t bitarray_size(unsigned int a1)
{
  if (a1 < 0xA) {
    return 64;
  }
  else {
    return 8
  }
         * (*(_DWORD *)((char *)&levels_num_words
                                    + (((954437177 * (unint64_t)(a1 - 10)) >> 31) & 0x7FFFFFFC))
                        + (1 << (a1 - 6)));
}

void *bitarray_create(unsigned int a1)
{
  if (a1 < 0xA) {
    size_t v1 = 64;
  }
  else {
    size_t v1 = 8
  }
       * (*(_DWORD *)((char *)&levels_num_words
                                  + (((954437177 * (unint64_t)(a1 - 10)) >> 31) & 0x7FFFFFFC))
                      + (1 << (a1 - 6)));
  return j__calloc(1uLL, v1);
}

uint64_t bitarray_get(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 > 9)
  {
    a1 += 8
        * *(unsigned int *)((char *)&levels_num_words + (((954437177 * (unint64_t)(a2 - 10)) >> 31) & 0x7FFFFFFC))
        + 8 * ((a3 >> 6) & 0x3FFFFF8);
    unsigned int v3 = (a3 >> 6) & 7;
  }
  else
  {
    unsigned int v3 = a3 >> 6;
  }
  return (*(void *)(a1 + 8 * v3) >> a3) & 1;
}

uint64_t bitarray_set(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 <= 9)
  {
    uint64_t v3 = a3 >> 6;
    uint64_t v4 = *(void *)(a1 + 8 * v3);
    uint64_t v5 = v4 | (1 << a3);
    if (v4 != v5)
    {
      *(void *)(a1 + 8 * v3) = v5;
      return 1;
    }
    return 0;
  }
  unint64_t v6 = (a2 - 10) / 9uLL;
  unsigned int v7 = a3 >> 9;
  uint64_t v8 = a1 + 8 * levels_num_words[v6] + 64 * (a3 >> 9);
  uint64_t v9 = (a3 >> 6) & 7;
  uint64_t v10 = *(void *)(v8 + 8 * v9);
  uint64_t v11 = v10 | (1 << a3);
  if (v10 == v11) {
    return 0;
  }
  *(void *)(v8 + 8 * v9) = v11;
  if (v10) {
    return 1;
  }
  switch((int)v6)
  {
    case 0:
      goto LABEL_10;
    case 1:
      goto LABEL_16;
    case 2:
      goto LABEL_14;
    case 3:
      uint64_t v14 = a1 + 64 * (a3 >> 18) + 16810048;
      uint64_t v15 = (a3 >> 15) & 7;
      uint64_t v16 = *(void *)(v14 + 8 * v15);
      uint64_t v12 = 1;
      uint64_t v17 = v16 | (1 << v7);
      if (v16 == v17) {
        return v12;
      }
      *(void *)(v14 + 8 * v15) = v17;
      if (v16) {
        return 1;
      }
      unsigned int v7 = a3 >> 18;
LABEL_14:
      uint64_t v18 = (v7 >> 6) & 7;
      uint64_t v12 = 1;
      uint64_t v19 = 1 << v7;
      v7 >>= 9;
      uint64_t v20 = a1 + 64 * v7 + 32832;
      uint64_t v21 = *(void *)(v20 + 8 * v18);
      uint64_t v22 = v19 | v21;
      if (v21 == v22) {
        return v12;
      }
      *(void *)(v20 + 8 * v18) = v22;
      if (v21) {
        return 1;
      }
LABEL_16:
      uint64_t v23 = (v7 >> 6) & 7;
      uint64_t v12 = 1;
      uint64_t v24 = 1 << v7;
      v7 >>= 9;
      uint64_t v25 = a1 + 64 * v7 + 64;
      uint64_t v26 = *(void *)(v25 + 8 * v23);
      uint64_t v27 = v24 | v26;
      if (v26 == v27) {
        return v12;
      }
      *(void *)(v25 + 8 * v23) = v27;
      if (v26) {
        return 1;
      }
LABEL_10:
      *(void *)(a1 + 8 * ((v7 >> 6) & 7)) |= 1 << v7;
      uint64_t v12 = 1;
      break;
    default:
      bitarray_set_cold_1((a2 - 10) / 9uLL);
  }
  return v12;
}

uint64_t bitarray_zap(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a2 <= 9)
  {
    uint64_t v3 = a3 >> 6;
    uint64_t v4 = *(void *)(a1 + 8 * v3);
    uint64_t v5 = v4 & ~(1 << a3);
    if (v4 != v5)
    {
      *(void *)(a1 + 8 * v3) = v5;
      return 1;
    }
    return 0;
  }
  unint64_t v6 = (a2 - 10) / 9uLL;
  unsigned int v7 = (void *)(a1 + 8 * levels_num_words[v6] + 64 * (a3 >> 9));
  uint64_t v8 = (a3 >> 6) & 7;
  uint64_t v9 = v7[v8];
  uint64_t v10 = v9 & ~(1 << a3);
  if (v9 == v10) {
    return 0;
  }
  v7[v8] = v10;
  if (*v7) {
    return 1;
  }
  unsigned int v13 = a3 >> 9;
  uint64_t v14 = 1;
  do
  {
    if (v14 == 8)
    {
      if (v10) {
        return 1;
      }
      goto LABEL_16;
    }
  }
  while (!v7[v14++]);
  uint64_t v11 = 1;
  if ((unint64_t)(v14 - 2) < 7 || v10) {
    return v11;
  }
LABEL_16:
  switch((int)v6)
  {
    case 0:
      goto LABEL_17;
    case 1:
      goto LABEL_33;
    case 2:
      goto LABEL_24;
    case 3:
      unsigned int v13 = a3 >> 18;
      uint64_t v16 = (uint64_t *)(a1 + 64 * (a3 >> 18) + 16810048);
      uint64_t v17 = (a3 >> 15) & 7;
      uint64_t v18 = v16[v17];
      uint64_t v11 = 1;
      uint64_t v19 = v18 & ~(1 << (a3 >> 9));
      if (v18 == v19) {
        return v11;
      }
      v16[v17] = v19;
      if (v19) {
        return 1;
      }
      uint64_t v20 = *v16;
      if (*v16) {
        return 1;
      }
      break;
    default:
      bitarray_set_cold_1((a2 - 10) / 9uLL);
  }
  while (v20 != 7)
  {
    if (*(void *)(((a3 >> 12) & 0xFFFC0) + a1 + 16810056 + 8 * v20++))
    {
      if ((unint64_t)(v20 - 1) < 7) {
        return 1;
      }
      break;
    }
  }
LABEL_24:
  unsigned int v22 = v13 >> 9;
  uint64_t v23 = (uint64_t *)(a1 + 64 * (v13 >> 9) + 32832);
  uint64_t v24 = (v13 >> 6) & 7;
  uint64_t v25 = v23[v24];
  uint64_t v11 = 1;
  uint64_t v26 = v25 & ~(1 << v13);
  if (v25 != v26)
  {
    v23[v24] = v26;
    if (v26) {
      return 1;
    }
    uint64_t v27 = *v23;
    if (*v23) {
      return 1;
    }
    uint64_t v28 = ((v13 >> 3) & 0xFFFC0) + a1 + 32840;
    do
    {
      if (v27 == 7)
      {
        unsigned int v13 = v22;
        goto LABEL_33;
      }
    }
    while (!*(void *)(v28 + 8 * v27++));
    unsigned int v13 = v22;
    if ((unint64_t)(v27 - 1) < 7) {
      return 1;
    }
LABEL_33:
    unsigned int v30 = v13 >> 9;
    unint64_t v31 = (uint64_t *)(a1 + 64 * (v13 >> 9) + 64);
    uint64_t v32 = (v13 >> 6) & 7;
    uint64_t v33 = v31[v32];
    uint64_t v11 = 1;
    uint64_t v34 = v33 & ~(1 << v13);
    if (v33 != v34)
    {
      v31[v32] = v34;
      if (!v34)
      {
        uint64_t v35 = *v31;
        if (!*v31)
        {
          uint64_t v36 = ((v13 >> 3) & 0xFFFC0) + a1 + 72;
          do
          {
            if (v35 == 7)
            {
              unsigned int v13 = v30;
LABEL_17:
              *(void *)(a1 + 8 * ((v13 >> 6) & 7)) &= ~(1 << v13);
              return 1;
            }
          }
          while (!*(void *)(v36 + 8 * v35++));
          unsigned int v13 = v30;
          if ((unint64_t)(v35 - 1) >= 7) {
            goto LABEL_17;
          }
        }
      }
      return 1;
    }
  }
  return v11;
}

uint64_t bitarray_first_set(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = 0;
  for (int i = 0; ; i -= 64)
  {
    unint64_t v4 = *(void *)(a1 + v2);
    if (v4) {
      break;
    }
    v2 += 8;
    if (v2 == 64) {
      return 0;
    }
  }
  uint64_t v6 = __clz(__rbit64(v4)) - i;
  if (a2 < 0xA) {
    return (v6 + 1);
  }
  unsigned int v7 = (a2 - 1) / 9;
  switch(v7)
  {
    case 1u:
      goto LABEL_40;
    case 2u:
      uint64_t v8 = 0;
      a1 += 64;
      int v9 = v6 << 9;
      uint64_t v10 = (unint64_t *)(a1 + (v6 << 6));
      while (1)
      {
        unint64_t v12 = *v10++;
        unint64_t v11 = v12;
        if (v12) {
          goto LABEL_25;
        }
        v8 -= 64;
        if (v8 == -512) {
          goto LABEL_24;
        }
      }
    case 3u:
      uint64_t v13 = 0;
      uint64_t v14 = (unint64_t *)(a1 + (v6 << 6) + 64);
      while (1)
      {
        unint64_t v16 = *v14++;
        unint64_t v15 = v16;
        if (v16) {
          break;
        }
        v13 -= 64;
        if (v13 == -512)
        {
          int v17 = 0;
          goto LABEL_21;
        }
      }
      int v17 = __clz(__rbit64(v15)) - v13 + 1;
LABEL_21:
      uint64_t v8 = 0;
      a1 += 32832;
      int v9 = (((v6 << 9) + v17) << 9) - 512;
      uint64_t v23 = (unint64_t *)(a1 + 8 * (8 * (v17 + (v6 << 9)) - 8));
      while (1)
      {
        unint64_t v24 = *v23++;
        unint64_t v11 = v24;
        if (v24) {
          break;
        }
        v8 -= 64;
        if (v8 == -512)
        {
LABEL_24:
          int v25 = 0;
          goto LABEL_26;
        }
      }
LABEL_25:
      int v25 = __clz(__rbit64(v11)) - v8 + 1;
LABEL_26:
      int v26 = v9 + v25;
      goto LABEL_39;
    case 4u:
      uint64_t v18 = 0;
      uint64_t v19 = (unint64_t *)(a1 + (v6 << 6) + 64);
      break;
    default:
      bitarray_first_set_cold_1((a2 - 1) / 9);
  }
  while (1)
  {
    unint64_t v21 = *v19++;
    unint64_t v20 = v21;
    if (v21) {
      break;
    }
    v18 -= 64;
    if (v18 == -512)
    {
      int v22 = 0;
      goto LABEL_28;
    }
  }
  int v22 = __clz(__rbit64(v20)) - v18 + 1;
LABEL_28:
  uint64_t v27 = 0;
  uint64_t v28 = (unint64_t *)(a1 + 8 * (8 * (v22 + (v6 << 9)) - 8) + 32832);
  while (1)
  {
    unint64_t v30 = *v28++;
    unint64_t v29 = v30;
    if (v30) {
      break;
    }
    v27 -= 64;
    if (v27 == -512)
    {
      int v31 = 0;
      goto LABEL_33;
    }
  }
  int v31 = __clz(__rbit64(v29)) - v27 + 1;
LABEL_33:
  uint64_t v32 = 0;
  a1 += 16810048;
  int v33 = (((((v6 << 9) + v22) << 9) - 512 + v31) << 9) - 512;
  uint64_t v34 = (unint64_t *)(a1 + 8 * (8 * (v31 + (v22 << 9) + (v6 << 18)) - 4104));
  while (1)
  {
    unint64_t v36 = *v34++;
    unint64_t v35 = v36;
    if (v36) {
      break;
    }
    v32 -= 64;
    if (v32 == -512)
    {
      int v37 = 0;
      goto LABEL_38;
    }
  }
  int v37 = __clz(__rbit64(v35)) - v32 + 1;
LABEL_38:
  int v26 = v33 + v37;
LABEL_39:
  LODWORD(v6) = v26 - 1;
LABEL_40:
  uint64_t v38 = 0;
  uint64_t v39 = a1 + 8 * (8 << (9 * v7 - 9));
  int v40 = v6 << 9;
  BOOL v41 = (unint64_t *)(v39 + 8 * (8 * v6));
  while (1)
  {
    unint64_t v43 = *v41++;
    unint64_t v42 = v43;
    if (v43) {
      break;
    }
    v38 -= 64;
    if (v38 == -512)
    {
      int v44 = 0;
      return (v44 + v40);
    }
  }
  int v44 = __clz(__rbit64(v42)) - v38 + 1;
  return (v44 + v40);
}

BOOL bitarray_zap_first_set(uint64_t a1, int a2, unsigned int *a3)
{
  int v3 = 0;
  uint64_t v4 = 0;
  while (1)
  {
    unint64_t v5 = *(void *)(a1 + 8 * v4);
    if (v5) {
      break;
    }
    ++v4;
    v3 -= 64;
    if (v4 == 8) {
      return v5 != 0;
    }
  }
  int v6 = __clz(__rbit64(v5));
  unsigned int v7 = v6 - v3;
  if ((a2 - 1) > 8)
  {
    unsigned int v8 = (a2 - 1) / 9u;
    uint64_t v9 = v8 - 1;
    switch(v8)
    {
      case 1u:
        uint64_t v10 = a1;
        goto LABEL_42;
      case 2u:
        uint64_t v11 = 0;
        uint64_t v10 = a1 + 64;
        int v12 = v7 << 9;
        uint64_t v13 = (unint64_t *)(a1 + 64 + ((unint64_t)(v6 - v3) << 6));
        while (1)
        {
          unint64_t v15 = *v13++;
          unint64_t v14 = v15;
          if (v15) {
            goto LABEL_27;
          }
          v11 -= 64;
          if (v11 == -512) {
            goto LABEL_26;
          }
        }
      case 3u:
        uint64_t v16 = 0;
        unsigned int v17 = v7 << 9;
        uint64_t v18 = (unint64_t *)(a1 + ((unint64_t)(v6 - v3) << 6) + 64);
        while (1)
        {
          unint64_t v20 = *v18++;
          unint64_t v19 = v20;
          if (v20) {
            break;
          }
          v16 -= 64;
          if (v16 == -512)
          {
            int v21 = 0;
            goto LABEL_23;
          }
        }
        int v21 = __clz(__rbit64(v19)) - v16 + 1;
LABEL_23:
        uint64_t v11 = 0;
        int v28 = (v17 + v21) << 9;
        uint64_t v10 = a1 + 32832;
        int v12 = v28 - 512;
        unint64_t v29 = (unint64_t *)(a1 + 32832 + 8 * (8 * (v21 + ((v6 - v3) << 9)) - 8));
        while (1)
        {
          unint64_t v30 = *v29++;
          unint64_t v14 = v30;
          if (v30) {
            break;
          }
          v11 -= 64;
          if (v11 == -512)
          {
LABEL_26:
            int v31 = 0;
            goto LABEL_28;
          }
        }
LABEL_27:
        int v31 = __clz(__rbit64(v14)) - v11 + 1;
LABEL_28:
        int v32 = v12 + v31;
        goto LABEL_41;
      case 4u:
        uint64_t v22 = 0;
        unsigned int v23 = v7 << 9;
        unint64_t v24 = (unint64_t *)(a1 + ((unint64_t)(v6 - v3) << 6) + 64);
        break;
      default:
        bitarray_first_set_cold_1(v8);
    }
    while (1)
    {
      unint64_t v26 = *v24++;
      unint64_t v25 = v26;
      if (v26) {
        break;
      }
      v22 -= 64;
      if (v22 == -512)
      {
        int v27 = 0;
        goto LABEL_30;
      }
    }
    int v27 = __clz(__rbit64(v25)) - v22 + 1;
LABEL_30:
    uint64_t v33 = 0;
    int v34 = ((v23 + v27) << 9) - 512;
    unint64_t v35 = (unint64_t *)(a1 + 8 * (8 * (v27 + ((v6 - v3) << 9)) - 8) + 32832);
    while (1)
    {
      unint64_t v37 = *v35++;
      unint64_t v36 = v37;
      if (v37) {
        break;
      }
      v33 -= 64;
      if (v33 == -512)
      {
        int v38 = 0;
        goto LABEL_35;
      }
    }
    int v38 = __clz(__rbit64(v36)) - v33 + 1;
LABEL_35:
    uint64_t v39 = 0;
    int v40 = (v34 + v38) << 9;
    uint64_t v10 = a1 + 16810048;
    int v41 = v40 - 512;
    unint64_t v42 = (unint64_t *)(a1 + 16810048 + 8 * (8 * (v38 + (v27 << 9) + ((v6 - v3) << 18)) - 4104));
    while (1)
    {
      unint64_t v44 = *v42++;
      unint64_t v43 = v44;
      if (v44) {
        break;
      }
      v39 -= 64;
      if (v39 == -512)
      {
        int v45 = 0;
        goto LABEL_40;
      }
    }
    int v45 = __clz(__rbit64(v43)) - v39 + 1;
LABEL_40:
    int v32 = v41 + v45;
LABEL_41:
    unsigned int v7 = v32 - 1;
LABEL_42:
    uint64_t v46 = 0;
    unint64_t v47 = (unint64_t *)(v10 + 8 * (8 << (9 * v8 - 9)) + 64 * v7);
    while (1)
    {
      unint64_t v49 = *v47++;
      unint64_t v48 = v49;
      if (v49) {
        break;
      }
      v46 -= 64;
      if (v46 == -512)
      {
        int v50 = 0;
        goto LABEL_47;
      }
    }
    int v50 = __clz(__rbit64(v48)) - v46 + 1;
LABEL_47:
    unsigned int v51 = (v7 << 9) + v50 - 1;
    *a3 = v51;
    mach_vm_address_t v52 = (void *)(a1 + 8 * levels_num_words[v9] + 64 * (v51 >> 9));
    uint64_t v53 = (v51 >> 6) & 7;
    uint64_t v54 = v52[v53];
    uint64_t v55 = v54 & ~(1 << v51);
    if (v54 != v55)
    {
      v52[v53] = v55;
      if (!*v52)
      {
        unsigned int v57 = v51 >> 9;
        uint64_t v58 = 1;
        do
        {
          if (v58 == 8)
          {
            if (v55) {
              return v5 != 0;
            }
            goto LABEL_57;
          }
        }
        while (!v52[v58++]);
        if (v55 || (unint64_t)(v58 - 2) < 7) {
          return v5 != 0;
        }
LABEL_57:
        switch((int)v9)
        {
          case 0:
            goto LABEL_58;
          case 1:
            goto LABEL_75;
          case 2:
            goto LABEL_66;
          case 3:
            unsigned int v57 = v51 >> 18;
            unint64_t v60 = (uint64_t *)(a1 + 64 * (v51 >> 18) + 16810048);
            uint64_t v61 = (v51 >> 15) & 7;
            uint64_t v62 = v60[v61];
            uint64_t v63 = v62 & ~(1 << (v51 >> 9));
            if (v62 == v63) {
              return v5 != 0;
            }
            v60[v61] = v63;
            if (v63) {
              return v5 != 0;
            }
            uint64_t v64 = *v60;
            if (v64) {
              return v5 != 0;
            }
            uint64_t v65 = ((v51 >> 12) & 0xFFFC0) + a1 + 16810056;
            break;
          default:
            bitarray_set_cold_1(v9);
        }
        while (v64 != 7)
        {
          if (*(void *)(v65 + 8 * v64++))
          {
            if ((unint64_t)(v64 - 1) < 7) {
              return v5 != 0;
            }
            break;
          }
        }
LABEL_66:
        unsigned int v67 = v57 >> 9;
        uint64_t v68 = (uint64_t *)(a1 + 64 * (v57 >> 9) + 32832);
        uint64_t v69 = (v57 >> 6) & 7;
        uint64_t v70 = v68[v69];
        uint64_t v71 = v70 & ~(1 << v57);
        if (v70 != v71)
        {
          v68[v69] = v71;
          if (!v71)
          {
            uint64_t v72 = *v68;
            if (!v72)
            {
              uint64_t v73 = ((v57 >> 3) & 0xFFFC0) + a1 + 32840;
              do
              {
                if (v72 == 7)
                {
                  unsigned int v57 = v67;
                  goto LABEL_75;
                }
              }
              while (!*(void *)(v73 + 8 * v72++));
              unsigned int v57 = v67;
              if ((unint64_t)(v72 - 1) < 7) {
                return v5 != 0;
              }
LABEL_75:
              unsigned int v75 = v57 >> 9;
              unint64_t v76 = (uint64_t *)(a1 + 64 * (v57 >> 9) + 64);
              uint64_t v77 = (v57 >> 6) & 7;
              uint64_t v78 = v76[v77];
              uint64_t v79 = v78 & ~(1 << v57);
              if (v78 != v79)
              {
                v76[v77] = v79;
                if (!v79)
                {
                  uint64_t v80 = *v76;
                  if (!v80)
                  {
                    uint64_t v81 = ((v57 >> 3) & 0xFFFC0) + a1 + 72;
                    do
                    {
                      if (v80 == 7)
                      {
                        unsigned int v57 = v75;
LABEL_58:
                        uint64_t v4 = (v57 >> 6) & 7;
                        LOBYTE(v6) = v57 & 0x3F;
                        goto LABEL_7;
                      }
                    }
                    while (!*(void *)(v81 + 8 * v80++));
                    unsigned int v57 = v75;
                    if ((unint64_t)(v80 - 1) >= 7) {
                      goto LABEL_58;
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
  else
  {
    *a3 = v7;
LABEL_7:
    *(void *)(a1 + 8 * v4) &= ~(1 << v6);
  }
  return v5 != 0;
}

uint64_t bitarray_zap_first_set_multiple(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  if (a2 > 9)
  {
    uint64_t v8 = 0;
    if (a3)
    {
      unsigned int v9 = (a2 - 1) / 9;
      uint64_t v10 = a1 + 64;
      uint64_t v73 = a1 + 32832;
      uint64_t v72 = a1 + 16810048;
      uint64_t v69 = a1 + 16810056;
      uint64_t v70 = a1 + 32840;
      uint64_t v71 = a1 + 72;
      do
      {
        int v11 = 0;
        uint64_t v12 = 0;
        int v13 = 0;
        while (1)
        {
          unint64_t v14 = *(void *)(a1 + v12);
          if (v14) {
            break;
          }
          v13 -= 64;
          v12 += 8;
          v11 += 64;
          if (v12 == 64) {
            return v8;
          }
        }
        int v15 = __clz(__rbit64(v14));
        unsigned int v16 = v15 - v13;
        switch(v9)
        {
          case 1u:
            uint64_t v17 = a1;
            goto LABEL_46;
          case 2u:
            uint64_t v18 = 0;
            unint64_t v19 = (unint64_t *)(v10 + ((unint64_t)(v15 + v11) << 6));
            while (1)
            {
              unint64_t v21 = *v19++;
              unint64_t v20 = v21;
              if (v21) {
                break;
              }
              v18 -= 64;
              if (v18 == -512)
              {
                int v22 = 0;
                goto LABEL_26;
              }
            }
            int v22 = __clz(__rbit64(v20)) - v18 + 1;
LABEL_26:
            unsigned int v16 = (v16 << 9) + v22 - 1;
            uint64_t v17 = a1 + 64;
            goto LABEL_46;
          case 3u:
            uint64_t v23 = 0;
            unint64_t v24 = (unint64_t *)(v10 + ((unint64_t)(v15 + v11) << 6));
            while (1)
            {
              unint64_t v26 = *v24++;
              unint64_t v25 = v26;
              if (v26) {
                break;
              }
              v23 -= 64;
              if (v23 == -512)
              {
                int v27 = 0;
                goto LABEL_28;
              }
            }
            int v27 = __clz(__rbit64(v25)) - v23 + 1;
LABEL_28:
            uint64_t v33 = 0;
            int v34 = (unint64_t *)(v73 + 8 * (8 * (v27 + ((v15 + v11) << 9)) - 8));
            while (1)
            {
              unint64_t v36 = *v34++;
              unint64_t v35 = v36;
              if (v36) {
                break;
              }
              v33 -= 64;
              if (v33 == -512)
              {
                int v37 = 0;
                goto LABEL_38;
              }
            }
            int v37 = __clz(__rbit64(v35)) - v33 + 1;
LABEL_38:
            unsigned int v16 = (((v16 << 9) + v27) << 9) - 512 + v37 - 1;
            uint64_t v17 = v73;
            goto LABEL_46;
          case 4u:
            uint64_t v28 = 0;
            unint64_t v29 = (unint64_t *)(v10 + ((unint64_t)(v15 + v11) << 6));
            break;
          default:
            bitarray_first_set_cold_1(v9);
        }
        while (1)
        {
          unint64_t v31 = *v29++;
          unint64_t v30 = v31;
          if (v31) {
            break;
          }
          v28 -= 64;
          if (v28 == -512)
          {
            int v32 = 0;
            goto LABEL_33;
          }
        }
        int v32 = __clz(__rbit64(v30)) - v28 + 1;
LABEL_33:
        uint64_t v38 = 0;
        uint64_t v39 = (unint64_t *)(v73 + 8 * (8 * (v32 + ((v15 + v11) << 9)) - 8));
        while (1)
        {
          unint64_t v41 = *v39++;
          unint64_t v40 = v41;
          if (v41) {
            break;
          }
          v38 -= 64;
          if (v38 == -512)
          {
            int v42 = 0;
            goto LABEL_40;
          }
        }
        int v42 = __clz(__rbit64(v40)) - v38 + 1;
LABEL_40:
        uint64_t v43 = 0;
        unint64_t v44 = (unint64_t *)(v72 + 8 * (8 * (v42 + (v32 << 9) + ((v15 + v11) << 18)) - 4104));
        while (1)
        {
          unint64_t v46 = *v44++;
          unint64_t v45 = v46;
          if (v46) {
            break;
          }
          v43 -= 64;
          if (v43 == -512)
          {
            int v47 = 0;
            goto LABEL_45;
          }
        }
        int v47 = __clz(__rbit64(v45)) - v43 + 1;
LABEL_45:
        unsigned int v16 = (((((v16 << 9) + v32) << 9) - 512 + v42) << 9) - 512 + v47 - 1;
        uint64_t v17 = v72;
LABEL_46:
        unint64_t v48 = (void *)(v17 + 8 * (8 << (9 * (v9 - 1))) + 64 * v16);
        uint64_t v8 = FFS_and_zap_word((uint64_t)v48, a3 - v8, a4 + 4 * v8, v16 << 9)
           + v8;
        if (v8 >= a3)
        {
          if (*v48) {
            return v8;
          }
          uint64_t v49 = 1;
          while (v49 != 8)
          {
            if (v48[v49++])
            {
              if ((unint64_t)(v49 - 2) < 7) {
                goto LABEL_74;
              }
              break;
            }
          }
        }
        switch(v9)
        {
          case 1u:
            goto LABEL_48;
          case 2u:
            goto LABEL_71;
          case 3u:
            goto LABEL_63;
          case 4u:
            unsigned int v51 = (uint64_t *)(v72 + 64 * (v16 >> 9));
            uint64_t v52 = (v16 >> 6) & 7;
            uint64_t v53 = v51[v52];
            uint64_t v54 = v53 & ~(1 << v16);
            if (v53 == v54) {
              continue;
            }
            v51[v52] = v54;
            if (v54) {
              continue;
            }
            uint64_t v55 = *v51;
            if (v55) {
              continue;
            }
            break;
          default:
            bitarray_first_set_cold_1(v9 - 1);
        }
        do
        {
          if (v55 == 7)
          {
            v16 >>= 9;
            goto LABEL_63;
          }
        }
        while (!*(void *)(v69 + ((v16 >> 3) & 0x1FFFFFC0) + 8 * v55++));
        v16 >>= 9;
        if ((unint64_t)(v55 - 1) < 7) {
          continue;
        }
LABEL_63:
        unsigned int v57 = (uint64_t *)(v73 + 64 * (v16 >> 9));
        uint64_t v58 = (v16 >> 6) & 7;
        uint64_t v59 = v57[v58];
        uint64_t v60 = v59 & ~(1 << v16);
        if (v59 != v60)
        {
          v57[v58] = v60;
          if (!v60)
          {
            uint64_t v61 = *v57;
            if (!v61)
            {
              do
              {
                if (v61 == 7)
                {
                  v16 >>= 9;
                  goto LABEL_71;
                }
              }
              while (!*(void *)(v70 + ((v16 >> 3) & 0x1FFFFFC0) + 8 * v61++));
              v16 >>= 9;
              if ((unint64_t)(v61 - 1) < 7) {
                continue;
              }
LABEL_71:
              uint64_t v63 = (uint64_t *)(v10 + 64 * (v16 >> 9));
              uint64_t v64 = (v16 >> 6) & 7;
              uint64_t v65 = v63[v64];
              uint64_t v66 = v65 & ~(1 << v16);
              if (v65 != v66)
              {
                v63[v64] = v66;
                if (!v66)
                {
                  uint64_t v67 = *v63;
                  if (!v67)
                  {
                    while (v67 != 7)
                    {
                      if (*(void *)(v71 + ((v16 >> 3) & 0x1FFFFFC0) + 8 * v67++))
                      {
                        v16 >>= 9;
                        if ((unint64_t)(v67 - 1) < 7) {
                          goto LABEL_74;
                        }
LABEL_48:
                        *(void *)(a1 + 8 * ((v16 >> 6) & 7)) &= ~(1 << v16);
                        goto LABEL_74;
                      }
                    }
                    v16 >>= 9;
                    goto LABEL_48;
                  }
                }
              }
            }
          }
        }
LABEL_74:
        ;
      }
      while (v8 < a3);
    }
    return v8;
  }
  else
  {
    return FFS_and_zap_word(a1, a3, a4, 0);
  }
}

uint64_t FFS_and_zap_word(uint64_t a1, unsigned int a2, uint64_t a3, int a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  do
  {
    unint64_t v6 = *(void *)(a1 + 8 * v4);
    if (v6)
    {
      do
      {
        int v7 = __clz(__rbit64(v6));
        *(_DWORD *)(a3 + 4 * v5) = a4 + (v4 << 6) + v7;
        uint64_t v5 = (v5 + 1);
        v6 &= ~(1 << v7);
      }
      while (v5 < a2 && v6);
      *(void *)(a1 + 8 * v4) = v6;
      if (v5 >= a2) {
        break;
      }
    }
    ++v4;
  }
  while (v4 != 8);
  return v5;
}

uint64_t xzm_reclaim_force_sync(uint64_t a1)
{
  return MEMORY[0x1F40D0258](a1, 1024);
}

uint64_t xzm_chunk_mark_free(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 232);
  if (!v2) {
    uint64_t v2 = a1;
  }
  uint64_t v3 = *(void *)(v2 + 464);
  int v4 = *(unsigned char *)(a2 + 32) & 0xF;
  if ((v4 - 6) >= 2 && v4 != 2 && v4 != 5) {
    xzm_chunk_mark_free_cold_1(*(unsigned char *)(a2 + 32) & 0xF);
  }
  unint64_t v5 = (a2 & 0xFFFFFFFFFFFFC000)
     + 0xFFFFFFFD55555558 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4);
  uint64_t result = xzm_reclaim_mark_free(v3);
  *(void *)(v5 + 56) = result;
  return result;
}

uint64_t xzm_chunk_mark_used(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 232);
  if (!v2) {
    uint64_t v2 = a1;
  }
  uint64_t v3 = *(void *)(v2 + 464);
  int v4 = *(unsigned char *)(a2 + 32) & 0xF;
  if ((v4 - 6) < 2)
  {
    uint64_t v5 = (unint64_t)*(unsigned int *)(a2 + 40) << 14;
  }
  else if (v4 == 2)
  {
    uint64_t v5 = 0x4000;
  }
  else
  {
    if (v4 != 5) {
      xzm_chunk_mark_free_cold_1(*(unsigned char *)(a2 + 32) & 0xF);
    }
    uint64_t v5 = 0x10000;
  }
  uint64_t v6 = -1431655765 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4);
  int v7 = (void *)((a2 & 0xFFFFFFFFFFFFC000) + 8 * v6 + 56);
  uint64_t result = xzm_reclaim_mark_used(v3, *(void *)((a2 & 0xFFFFFFFFFFFFC000) + 8 * v6 + 0x38), *(void *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30) + (v6 << 14), v5, 1);
  if (result) {
    *int v7 = -1;
  }
  return result;
}

uint64_t _xzm_segment_group_overwrite_chunk(mach_vm_address_t a1, mach_vm_size_t size)
{
  mach_vm_address_t address = a1;
  uint64_t result = mach_vm_map(*MEMORY[0x1E4F14C48], &address, size, 0, 33570816, 0, 0, 0, 3, 7, 1u);
  if (result) {
    xzm_segment_group_alloc_chunk_cold_3(result);
  }
  return result;
}

void _xzm_segment_group_cache_invalidate(uint64_t a1, void *a2)
{
  --*(_WORD *)(a1 + 482);
  uint64_t v2 = a2[3];
  uint64_t v3 = (void *)a2[4];
  if (v2)
  {
    *(void *)(v2 + 32) = v3;
    uint64_t v3 = (void *)a2[4];
  }
  else
  {
    *(void *)(a1 + 472) = v3;
  }
  *uint64_t v3 = v2;
  xzm_metapool_free(*(os_unfair_lock_t *)(*(void *)(a1 + 24) + 400), a2);
}

unsigned char *malloc_common_strstr(unsigned char *a1)
{
  if (!*a1) {
    return 0;
  }
  size_t v1 = a1;
  while (_platform_strncmp())
  {
    if (!*++v1) {
      return 0;
    }
  }
  return v1;
}

uint64_t malloc_zone_batch_free_fallback(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v5 = result;
    unsigned int v6 = a3 - 1;
    for (unsigned int i = 1; i <= a3; ++i)
    {
      if (*(void *)(a2 + 8 * v6)) {
        uint64_t result = (*(uint64_t (**)(uint64_t))(v5 + 48))(v5);
      }
      --v6;
    }
  }
  return result;
}

mach_vm_address_t create_purgeable_zone(uint64_t a1, uint64_t a2, int a3)
{
  mach_vm_address_t pages = mvm_allocate_pages((*MEMORY[0x1E4F14C80] + 20479) & -*MEMORY[0x1E4F14C80], 0, 0x40000000, 1);
  mach_vm_address_t v6 = pages;
  if (pages)
  {
    int v7 = (int *)(pages + 16392);
    unint64_t v8 = MEMORY[0xFFFFFC038];
    int v9 = a3 | 0x80;
    rack_init(pages + 16512, 1, 0, a3 | 0x80);
    rack_init(v6 + 17280, 2, 0, a3 | 0x80);
    if (large_cache_enabled)
    {
      *(void *)(v6 + 20424) = v8 >> 10;
      int32_t v10 = NSVersionOfLinkTimeLibrary("System");
      BOOL v12 = v10 != -1 && v10 < 7340032;
      *(_DWORD *)(v6 + 20408) = v12;
    }
    *(_DWORD *)(v6 + 104) = 11;
    *(void *)(v6 + 16) = purgeable_size;
    *(void *)(v6 + 24) = purgeable_malloc;
    *(void *)(v6 + 32) = purgeable_calloc;
    *(void *)(v6 + 40) = purgeable_valloc;
    *(void *)(v6 + 48) = purgeable_free;
    *(void *)(v6 + 56) = purgeable_realloc;
    *(void *)(v6 + 64) = purgeable_destroy;
    *(void *)(v6 + 80) = purgeable_batch_malloc;
    *(void *)(v6 + 88) = purgeable_batch_free;
    *(void *)(v6 + 96) = &purgeable_introspect;
    *(void *)(v6 + 112) = purgeable_memalign;
    *(void *)(v6 + 120) = purgeable_free_definite_size;
    *(void *)(v6 + 128) = purgeable_pressure_relief;
    *(void *)(v6 + 136) = purgeable_claimed_address;
    *(void *)mach_vm_address_t v6 = 0;
    *(void *)(v6 + 8) = 0;
    mprotect((void *)v6, 0xC8uLL, 1);
    *int v7 = v9;
    if ((a3 & 7) != 0)
    {
      if ((a3 & 4) == 0)
      {
        malloc_report(6u, (uint64_t)"purgeable zone does not support guard pages\n");
        int v9 = *v7;
      }
      *int v7 = v9 & 0xFFFFFFF8;
    }
    *(_DWORD *)(v6 + 18816) = 0;
    *(void *)(v6 + 20456) = a2;
  }
  return v6;
}

unint64_t purgeable_malloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x3C00) {
    a1 = *(void *)(a1 + 20456);
  }
  return szone_malloc(a1, a2);
}

unint64_t purgeable_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 == 1 || is_mul_ok(a2, a3) && (a3 *= a2, a3 <= malloc_absolute_max_size))
  {
    if (a3 <= 0x3C00) {
      a1 = *(void *)(a1 + 20456);
    }
    return szone_calloc(a1, 1uLL, a3);
  }
  else
  {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
    return 0;
  }
}

mach_vm_address_t purgeable_valloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x3C00) {
    a1 = *(void *)(a1 + 20456);
  }
  return szone_valloc(a1, a2);
}

void purgeable_free(uint64_t a1, unint64_t a2)
{
  int v4 = 0;
  uint64_t v5 = (os_unfair_lock_s *)(a1 + 18816);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 18816), (unsigned int *)&v4, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v4) {
    os_unfair_lock_lock_with_options();
  }
  int v7 = large_entry_for_pointer_no_lock(a1, a2);
  int v8 = *(_DWORD *)(StatusReg + 24);
  int v9 = v8;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v5, (unsigned int *)&v9, 0, memory_order_release, memory_order_relaxed);
  if (v9 != v8) {
    os_unfair_lock_unlock(v5);
  }
  if (v7)
  {
    free_large(a1, a2, 0);
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 20456);
    szone_free(v10, a2);
  }
}

unint64_t purgeable_realloc(uint64_t a1, const void *a2, unint64_t a3)
{
  uint64_t v4 = a1;
  if (a2)
  {
    if (a3)
    {
      size_t v6 = szone_size_try_large(a1, (unint64_t)a2);
      if (!v6)
      {
        size_t v6 = szone_size(*(void *)(v4 + 20456), (unint64_t)a2);
        if (!v6)
        {
          malloc_zone_error(*(_DWORD *)(v4 + 16392), 1, (uint64_t)"pointer %p being reallocated was not allocated\n");
          return 0;
        }
      }
      if (v6 <= 0x3C00)
      {
        if (a3 <= 0x3C00)
        {
          uint64_t v7 = *(void *)(v4 + 20456);
          return szone_realloc(v7, (unint64_t)a2, a3);
        }
        int v15 = (void *)szone_malloc(v4, a3);
        BOOL v12 = v15;
        if (v15)
        {
          memcpy(v15, a2, v6);
          uint64_t v16 = *(void *)(v4 + 20456);
LABEL_28:
          szone_free_definite_size(v16, (unint64_t)a2, v6);
        }
        return (unint64_t)v12;
      }
      if (a3 > 0x3C00)
      {
        int v11 = (void *)szone_malloc(v4, a3);
        BOOL v12 = v11;
        if (!v11) {
          return (unint64_t)v12;
        }
        if (v6 >= a3) {
          size_t v14 = a3;
        }
        else {
          size_t v14 = v6;
        }
        int v13 = a2;
      }
      else
      {
        int v11 = (void *)szone_malloc(*(void *)(v4 + 20456), a3);
        BOOL v12 = v11;
        if (!v11) {
          return (unint64_t)v12;
        }
        int v13 = a2;
        size_t v14 = a3;
      }
      memcpy(v11, v13, v14);
      uint64_t v16 = v4;
      goto LABEL_28;
    }
    purgeable_free(a1, (unint64_t)a2);
    uint64_t v9 = *(void *)(v4 + 20456);
    unint64_t v10 = 1;
  }
  else
  {
    if (a3 <= 0x3C00) {
      uint64_t v4 = *(void *)(a1 + 20456);
    }
    uint64_t v9 = v4;
    unint64_t v10 = a3;
  }

  return szone_malloc(v9, v10);
}

uint64_t purgeable_destroy(uint64_t a1)
{
  uint64_t v2 = (unsigned int *)(a1 + 16392);
  uint64_t v3 = *(unsigned int *)(a1 + 18824);
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  if (v3)
  {
    uint64_t v4 = 24 * v3;
    do
    {
      uint64_t v5 = *(void *)(a1 + 18832) + v4;
      uint64_t v6 = *(void *)(v5 - 24);
      if (v6) {
        mvm_deallocate_pages(v6, *(void *)(v5 - 16), *v2);
      }
      v4 -= 24;
    }
    while (v4);
    unsigned int v7 = v2[608];
  }
  else
  {
    unsigned int v7 = 0;
  }
  large_entries_free_no_lock(a1, *(void *)(a1 + 18832), v7, &v9);
  if (v10) {
    mvm_deallocate_pages(v9, v10, 0);
  }
  return mvm_deallocate_pages(a1, (*MEMORY[0x1E4F14C80] + 20479) & -*MEMORY[0x1E4F14C80], 0);
}

uint64_t purgeable_batch_malloc(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return szone_batch_malloc(*(void *)(a1 + 20456), a2, a3, a4);
}

void purgeable_batch_free(uint64_t a1, uint64_t a2, unsigned int a3)
{
}

mach_vm_address_t purgeable_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 <= 0x3C00) {
    a1 = *(void *)(a1 + 20456);
  }
  return szone_memalign(a1, a2, a3);
}

void purgeable_free_definite_size(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 <= 0x3C00) {
    a1 = *(void *)(a1 + 20456);
  }
  szone_free_definite_size(a1, a2, a3);
}

uint64_t purgeable_pressure_relief()
{
  uint64_t v0 = szone_pressure_relief();
  return szone_pressure_relief() + v0;
}

BOOL purgeable_claimed_address(uint64_t a1, unint64_t a2)
{
  return szone_claimed_address(*(void *)(a1 + 20456), a2);
}

uint64_t purgeable_ptr_in_use_enumerator(uint64_t task, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4))
{
  uint64_t v5 = a5;
  if (!a5)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    uint64_t v5 = _malloc_default_reader;
  }
  uint64_t v10 = 0;
  uint64_t result = v5(task, a4, 20480, &v10);
  if (!result) {
    return large_in_use_enumerator();
  }
  return result;
}

uint64_t purgeable_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x3C00) {
    a1 = *(void *)(a1 + 20456);
  }
  return szone_good_size(a1, a2);
}

uint64_t purgeable_check()
{
  return 1;
}

uint64_t purgeable_print_self()
{
  uint64_t result = *MEMORY[0x1E4F14C48];
  if (result)
  {
    uint64_t result = mach_task_is_self(result);
    if (!result) {
      purgeable_ptr_in_use_enumerator_cold_1(result);
    }
  }
  return result;
}

uint64_t purgeable_log(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16400) = a2;
  return result;
}

atomic_uint *purgeable_force_lock(uint64_t a1)
{
  int v1 = 0;
  uint64_t result = (atomic_uint *)(a1 + 18816);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    return (atomic_uint *)os_unfair_lock_lock_with_options();
  }
  return result;
}

void purgeable_force_unlock(os_unfair_lock_s *a1)
{
  int v1 = a1 + 4704;
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v3 = v2;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v1, (unsigned int *)&v3, 0, memory_order_release, memory_order_relaxed);
  if (v3 != v2) {
    os_unfair_lock_unlock(v1);
  }
}

uint64_t purgeable_statistics(uint64_t result, uint64_t a2)
{
  *(_DWORD *)a2 = *(_DWORD *)(result + 18820);
  uint64_t v2 = *(void *)(result + 18840);
  *(void *)(a2 + 16) = v2;
  *(void *)(a2 + 24) = v2;
  *(void *)(a2 + 8) = v2;
  return result;
}

uint64_t purgeable_locked(os_unfair_lock_s *a1)
{
  uint64_t v3 = 0;
  int v1 = a1 + 4704;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v1, (unsigned int *)&v3, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v3) {
    return 1;
  }
  int v4 = *(_DWORD *)(StatusReg + 24);
  int v5 = v4;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v1, (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
  if (v5 != v4)
  {
    os_unfair_lock_unlock(v1);
    return 0;
  }
  return v3;
}

uint64_t purgeable_reinit_lock(uint64_t result)
{
  *(_DWORD *)(result + 18816) = 0;
  return result;
}

uint64_t purgeable_print_task(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t *), uint64_t (*a5)(const char *, ...))
{
  uint64_t v8 = 0;
  uint64_t result = a4(a1, a3, 20480, &v8);
  if (result) {
    return a5("Purgeable zone %p: inUse=%u(%y) flags=%d\n", a3, *(unsigned int *)(v8 + 18820), *(void *)(v8 + 18840), *(unsigned int *)(v8 + 16392));
  }
  return result;
}

uint64_t sanitizer_diagnose_fault_from_crash_reporter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  int v10 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&crash_reporter_lock, (unsigned int *)&v10, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v10) {
    os_unfair_lock_lock_with_options();
  }
  int v11 = (void *)((uint64_t (*)(uint64_t, uint64_t, uint64_t))a5)(a3, a4, 16680);
  unint64_t v21 = (void *)((uint64_t (*)(uint64_t, void, uint64_t))a5)(a3, v11[31], 0x1000000);
  BOOL v12 = (void *)((uint64_t (*)(uint64_t, void, uint64_t))a5)(a3, v11[30], 37748744);
  xmmword_1E930B1E0 = 0uLL;
  enumeration_context = a1;
  g_crm_reader = a5;
  num_read_memory = 0;
  szone_introspect(a3);
  if (num_read_memory)
  {
    unint64_t v13 = 0;
    do
      _free((void *)read_memory[v13++]);
    while (v13 < num_read_memory);
  }
  g_crm_reader = 0;
  _platform_memset();
  *(void *)a2 = a1;
  if ((void)xmmword_1E930B1E0)
  {
    uint64_t v14 = *((void *)&xmmword_1E930B1E0 + 1);
    *(void *)(a2 + 8) = xmmword_1E930B1E0;
    *(void *)(a2 + 16) = v14;
    int v15 = (_DWORD *)((uint64_t (*)(uint64_t))a5)(a3);
    int v16 = v15[2];
    int v17 = v15[3];
    *(void *)(a2 + 24) = 0;
    *(_DWORD *)(a2 + 40) = stacktrace_depo_find((uint64_t)v12, v16, a2 + 48);
    *(void *)(a2 + 560) = 0;
    *(_DWORD *)(a2 + 576) = stacktrace_depo_find((uint64_t)v12, v17, a2 + 584);
    _free(v15);
  }
  _free(v12);
  _free(v21);
  _free(v11);
  int v18 = *(_DWORD *)(StatusReg + 24);
  int v19 = v18;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&crash_reporter_lock, (unsigned int *)&v19, 0, memory_order_release, memory_order_relaxed);
  if (v19 != v18) {
    os_unfair_lock_unlock((os_unfair_lock_t)&crash_reporter_lock);
  }
  return 0;
}

uint64_t memory_reader_adapter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (num_read_memory >= 0x400) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  uint64_t v5 = g_crm_reader();
  *a4 = v5;
  uint64_t v6 = num_read_memory++;
  read_memory[v6] = v5;
  if (v5) {
    return 0;
  }
  else {
    return 5;
  }
}

__n128 pointer_recorder(uint64_t a1, uint64_t a2, uint64_t a3, __n128 *a4, unsigned int a5)
{
  if (a5)
  {
    uint64_t v5 = a5;
    while (a4->n128_u64[0] > enumeration_context || enumeration_context >= a4->n128_u64[1] + a4->n128_u64[0])
    {
      ++a4;
      if (!--v5) {
        return result;
      }
    }
    __n128 result = *a4;
    xmmword_1E930B1E0 = (__int128)*a4;
  }
  return result;
}

uint64_t stacktrace_depo_find(uint64_t a1, int a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(a1 + 8 * (a2 & 0x7FFFF));
  if (v3 != a2 || (v3 & 0xFFFFFF00000000) > 0x40000000000000) {
    return 0;
  }
  unsigned int v6 = -474048815;
  unint64_t v7 = HIBYTE(v3);
  if (HIBYTE(v3))
  {
    unint64_t v8 = 0;
    unint64_t v9 = HIDWORD(v3);
    if (v7 <= 1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = v7;
    }
    do
    {
      if (v8 >= 0x40)
      {
        uint64_t v11 = *(void *)(a3 + 8 * v8);
      }
      else
      {
        uint64_t v11 = *(void *)(a1 + 8 * ((v9 + v8) & 0x3FFFFF) + 0x400000);
        *(void *)(a3 + 8 * v8) = v11;
      }
      unsigned int v6 = (1540483477
          * ((1540483477 * ((1540483477 * v11) ^ ((1540483477 * v11) >> 24))) ^ (1540483477 * v6))) ^ (1540483477 * ((1540483477 * HIDWORD(v11)) ^ ((1540483477 * HIDWORD(v11)) >> 24)));
      ++v8;
    }
    while (v10 != v8);
  }
  if (v7 >= 0x40) {
    LODWORD(v7) = 64;
  }
  if (((1540483477 * (v6 ^ (v6 >> 13))) ^ ((1540483477 * (v6 ^ (v6 >> 13))) >> 15)) == a2) {
    return v7;
  }
  else {
    return 0;
  }
}

uint64_t sanitizer_reset_environment()
{
  unsetenv("MallocSanitizerZone");

  return unsetenv("MallocQuarantineZone");
}

mach_vm_address_t sanitizer_create_zone(uint64_t a1)
{
  uint64_t v2 = (vm_map_t *)MEMORY[0x1E4F14C48];
  vm_map_t v3 = *MEMORY[0x1E4F14C48];
  int v4 = (void *)MEMORY[0x1E4F14C80];
  mach_vm_address_t address = 0;
  if (mach_vm_map(v3, &address, (*MEMORY[0x1E4F14C80] + 16679) & -*MEMORY[0x1E4F14C80], 0, 16777217, 0, 0, 0, 3, 3, 1u))
  {
    ((void (*)(void))purgeable_ptr_in_use_enumerator_cold_1)();
  }
  mach_vm_address_t v5 = address;
  long long v6 = *(_OWORD *)&off_1EE3B86E8;
  *(_OWORD *)(address + 32) = xmmword_1EE3B86D8;
  *(_OWORD *)(v5 + 48) = v6;
  long long v7 = *(_OWORD *)&off_1EE3B8728;
  *(_OWORD *)(v5 + 96) = xmmword_1EE3B8718;
  *(_OWORD *)(v5 + 112) = v7;
  long long v8 = *(_OWORD *)&off_1EE3B8708;
  *(_OWORD *)(v5 + 64) = xmmword_1EE3B86F8;
  *(_OWORD *)(v5 + 80) = v8;
  *(void *)(v5 + 192) = qword_1EE3B8778;
  long long v9 = unk_1EE3B8768;
  *(_OWORD *)(v5 + 160) = xmmword_1EE3B8758;
  *(_OWORD *)(v5 + 176) = v9;
  long long v10 = unk_1EE3B8748;
  *(_OWORD *)(v5 + 128) = xmmword_1EE3B8738;
  *(_OWORD *)(v5 + 144) = v10;
  long long v11 = *(_OWORD *)&off_1EE3B86C8;
  *(_OWORD *)mach_vm_address_t v5 = malloc_zone_template;
  *(_OWORD *)(v5 + 16) = v11;
  BOOL v12 = *(uint64_t (***)(task_name_t))(a1 + 96);
  if (!v12 || v12 != &szone_introspect) {
    ((void (*)(void))purgeable_ptr_in_use_enumerator_cold_1)();
  }
  *(void *)(v5 + 200) = a1;
  if (*(_DWORD *)(a1 + 104) <= 0xCu) {
    malloc_report(0x40u, (uint64_t)"Unsupported wrapped zone version: %u\n");
  }
  *(unsigned char *)(v5 + 208) = env_BOOL();
  *(unsigned char *)(v5 + 209) = env_BOOL() ^ 1;
  unint64_t v13 = env_uint((uint64_t)"MallocSanitizerRedzoneSize", 16);
  *(void *)(v5 + 216) = v13;
  if ((v13 & 7) != 0) {
    purgeable_ptr_in_use_enumerator_cold_1(v13);
  }
  *(void *)(v5 + 224) = env_uint((uint64_t)"MallocQuarantineMaxItems", 0);
  *(void *)(v5 + 232) = (unint64_t)env_uint((uint64_t)"MallocQuarantineMaxSizeInMB", 256) << 20;
  uint64_t v14 = (unsigned __int8 *)MEMORY[0x1E4F14C78];
  *(void *)(v5 + 240) = mvm_allocate_pages(0x2400008uLL, *MEMORY[0x1E4F14C78], 0, 10);
  *(void *)(v5 + 248) = mvm_allocate_pages(0x1000000uLL, *v14, 0, 10);
  *(_DWORD *)(v5 + 16640) = 0;
  uint64_t v15 = mach_vm_protect(*v2, v5, (*v4 + 0x3FFFLL) & -*v4, 0, 1);
  if (v15) {
    purgeable_ptr_in_use_enumerator_cold_1(v15);
  }
  return v5;
}

unint64_t env_uint(uint64_t a1, uint64_t a2)
{
  _NSGetEnviron();
  vm_map_t v3 = (const char *)_simple_getenv();
  if (v3) {
    return strtoul(v3, 0, 0);
  }
  return a2;
}

unint64_t sanitizer_size(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16))();
  unint64_t v5 = v4;
  if (v4)
  {
    if (*(unsigned char *)(a1 + 209))
    {
      unint64_t v6 = *(void *)(a2 + v4 - (v4 & 7) - 8);
      if (*(void *)(a1 + 216) > v6 || v4 <= v6) {
        purgeable_ptr_in_use_enumerator_cold_1(v4);
      }
      if (*(unsigned char *)(a1 + 208)) {
        malloc_report(6u, (uint64_t)"size(%p) = 0x%lx - redzone 0x%lx\n");
      }
      v5 -= v6;
    }
    else if (*(unsigned char *)(a1 + 208))
    {
      malloc_report(6u, (uint64_t)"size(%p) = 0x%lx\n");
    }
  }
  return v5;
}

uint64_t sanitizer_malloc(uint64_t a1, unint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F14BF8];
  if (a2 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a2;
  }
  uint64_t v4 = *(void *)(a1 + 216);
  if (*(unsigned char *)(a1 + 209))
  {
    v4 += -(int)v3 & 7;
    unint64_t v5 = v4 + v3;
    if (__CFADD__(v4, v3))
    {
      _X22 = 0;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return _X22;
    }
  }
  else
  {
    unint64_t v5 = v3;
  }
  _X22 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24))();
  if (_X22) {
    BOOL v7 = *MEMORY[0x1E4F14C80] > v3;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 248);
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    thread_stack_pcs();
    unsigned int v9 = (1540483477 * ((1540483477 * ((1540483477 * _X22) ^ ((1540483477 * _X22) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(_X22)) ^ ((1540483477 * HIDWORD(_X22)) >> 24)));
    long long v10 = (uint64_t *)(v8 + 16
                         * ((1540483477 * (v9 ^ (v9 >> 13))) & 0xFFFFF ^ ((1540483477 * (v9 ^ (v9 >> 13))) >> 15)));
    uint64_t v11 = *v10;
    do
    {
      _X3 = v10[1];
      __asm { CASP            X2, X3, X22, X23, [X8] }
      _ZF = _X2 == v11;
      uint64_t v11 = _X2;
    }
    while (!_ZF);
  }
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"malloc(0x%lx) = %p\n");
  }
  if (_X22 && *(unsigned char *)(a1 + 209))
  {
    unint64_t v18 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 200) + 16))(*(void *)(a1 + 200), _X22);
    if (v18 < v5) {
      purgeable_ptr_in_use_enumerator_cold_1(v18);
    }
    poison_alloc(a1, _X22, v3, v4 - v5 + v18);
  }
  return _X22;
}

uint64_t sanitizer_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F14BF8];
  unint64_t v5 = 1;
  if (a2 && a3 && (unint64_t v5 = a3, a2 != 1) && (!is_mul_ok(a2, a3) || (unint64_t v5 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    || (uint64_t v6 = *(void *)(a1 + 216), *(unsigned char *)(a1 + 209)) && (uint64_t v6 = v6 - (v5 & 7) + 8, v3 = v6 + v5, __CFADD__(v6, v5)))
  {
    _X22 = 0;
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }
  else
  {
    _X22 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 32))();
    if (*(unsigned char *)(a1 + 208)) {
      malloc_report(6u, (uint64_t)"calloc(0x%lx, 0x%lx) = %p\n");
    }
    if (_X22) {
      BOOL v9 = *MEMORY[0x1E4F14C80] > v5;
    }
    else {
      BOOL v9 = 0;
    }
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 248);
      uint64_t v29 = 0;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      thread_stack_pcs();
      unsigned int v11 = (1540483477 * ((1540483477 * ((1540483477 * _X22) ^ ((1540483477 * _X22) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(_X22)) ^ ((1540483477 * HIDWORD(_X22)) >> 24)));
      BOOL v12 = (uint64_t *)(v10
                      + 16
                      * ((1540483477 * (v11 ^ (v11 >> 13))) & 0xFFFFF ^ ((1540483477 * (v11 ^ (v11 >> 13))) >> 15)));
      uint64_t v13 = *v12;
      do
      {
        _X3 = v12[1];
        __asm { CASP            X2, X3, X22, X23, [X8] }
        _ZF = _X2 == v13;
        uint64_t v13 = _X2;
      }
      while (!_ZF);
    }
    else if (!_X22)
    {
      return _X22;
    }
    if (*(unsigned char *)(a1 + 209))
    {
      unint64_t v19 = (*(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 200) + 16))(*(void *)(a1 + 200), _X22, _X2);
      if (v19 < v3) {
        purgeable_ptr_in_use_enumerator_cold_1(v19);
      }
      poison_alloc(a1, _X22, v5, v6 - v3 + v19);
    }
  }
  return _X22;
}

uint64_t sanitizer_valloc(uint64_t a1, unint64_t a2)
{
  uint64_t v29 = *MEMORY[0x1E4F14BF8];
  if (a2 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a2;
  }
  uint64_t v4 = *(void *)(a1 + 216);
  if (*(unsigned char *)(a1 + 209))
  {
    uint64_t v4 = v4 - (v3 & 7) + 8;
    unint64_t v5 = v4 + v3;
    if (__CFADD__(v4, v3)) {
      return 0;
    }
  }
  else
  {
    unint64_t v5 = v3;
  }
  _X22 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 40))();
  if (_X22) {
    BOOL v7 = *MEMORY[0x1E4F14C80] > v3;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    uint64_t v8 = *(void *)(a1 + 248);
    uint64_t v28 = 0;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    thread_stack_pcs();
    unsigned int v9 = (1540483477 * ((1540483477 * ((1540483477 * _X22) ^ ((1540483477 * _X22) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(_X22)) ^ ((1540483477 * HIDWORD(_X22)) >> 24)));
    uint64_t v10 = (uint64_t *)(v8 + 16
                         * ((1540483477 * (v9 ^ (v9 >> 13))) & 0xFFFFF ^ ((1540483477 * (v9 ^ (v9 >> 13))) >> 15)));
    uint64_t v11 = *v10;
    do
    {
      _X3 = v10[1];
      __asm { CASP            X2, X3, X22, X23, [X8] }
      _ZF = _X2 == v11;
      uint64_t v11 = _X2;
    }
    while (!_ZF);
  }
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"valloc(0x%lx) = %p\n");
  }
  if (_X22 && *(unsigned char *)(a1 + 209))
  {
    unint64_t v18 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 200) + 16))(*(void *)(a1 + 200), _X22);
    if (v18 < v5) {
      purgeable_ptr_in_use_enumerator_cold_1(v18);
    }
    poison_alloc(a1, _X22, v3, v4 - v5 + v18);
  }
  return _X22;
}

void sanitizer_free(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a1 + 209))
  {
    uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16))();
    poison_free(a1, a2, v4);
  }
  else
  {
    uint64_t v4 = 0;
  }
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"free(%p)\n");
  }

  place_into_quarantine(a1, a2, v4);
}

uint64_t sanitizer_realloc(uint64_t a1, char *a2, unint64_t a3)
{
  uint64_t v37 = *MEMORY[0x1E4F14BF8];
  if (a3 <= 1) {
    unint64_t v5 = 1;
  }
  else {
    unint64_t v5 = a3;
  }
  uint64_t v6 = *(void *)(a1 + 216);
  if (*(unsigned char *)(a1 + 209))
  {
    uint64_t v6 = v6 - (v5 & 7) + 8;
    unint64_t v7 = v6 + v5;
    if (__CFADD__(v6, v5)) {
      return 0;
    }
  }
  else
  {
    unint64_t v7 = v5;
  }
  _X22 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24))();
  if (_X22) {
    BOOL v12 = *MEMORY[0x1E4F14C80] > v5;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 248);
    uint64_t v36 = 0;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    thread_stack_pcs();
    unsigned int v14 = (1540483477 * ((1540483477 * ((1540483477 * _X22) ^ ((1540483477 * _X22) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(_X22)) ^ ((1540483477 * HIDWORD(_X22)) >> 24)));
    uint64_t v15 = (uint64_t *)(v13
                    + 16 * ((1540483477 * (v14 ^ (v14 >> 13))) & 0xFFFFF ^ ((1540483477 * (v14 ^ (v14 >> 13))) >> 15)));
    uint64_t v16 = *v15;
    do
    {
      _X3 = v15[1];
      __asm { CASP            X2, X3, X22, X23, [X8] }
      _ZF = _X2 == v16;
      uint64_t v16 = _X2;
    }
    while (!_ZF);
  }
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"realloc(%p, 0x%lx) = %p\n");
  }
  if (!a2)
  {
    if (!_X22) {
      return _X22;
    }
    goto LABEL_38;
  }
  unint64_t v21 = (*(uint64_t (**)(void, char *, uint64_t))(*(void *)(a1 + 200) + 16))(*(void *)(a1 + 200), a2, _X2);
  unint64_t v22 = v21;
  if (*(unsigned char *)(a1 + 209))
  {
    unint64_t v23 = *(void *)&a2[v21 - (v21 & 7) - 8];
    if (*(void *)(a1 + 216) > v23 || v21 <= v23) {
      purgeable_ptr_in_use_enumerator_cold_1(v21);
    }
  }
  else
  {
    unint64_t v23 = 0;
  }
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"realloc(%p, 0x%lx): size(%p) = 0x%lx - redzone 0x%lx)\n");
  }
  if (_X22)
  {
    if (v22 - v23 >= v5) {
      size_t v25 = v5;
    }
    else {
      size_t v25 = v22 - v23;
    }
    memcpy((void *)_X22, a2, v25);
    if (*(unsigned char *)(a1 + 209)) {
      poison_free(a1, (uint64_t)a2, v22);
    }
    place_into_quarantine(a1, (uint64_t)a2, v22);
LABEL_38:
    if (*(unsigned char *)(a1 + 209))
    {
      unint64_t v26 = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 200) + 16))(*(void *)(a1 + 200), _X22, _X2, _X3, v11);
      if (v26 < v7) {
        purgeable_ptr_in_use_enumerator_cold_1(v26);
      }
      poison_alloc(a1, _X22, v5, v6 - v7 + v26);
    }
  }
  return _X22;
}

uint64_t sanitizer_destroy(mach_vm_address_t a1)
{
  mvm_deallocate_pages(*(void *)(a1 + 240), 37748744, 0);
  mvm_deallocate_pages(*(void *)(a1 + 248), 0x1000000, 0);
  malloc_destroy_zone(*(malloc_zone_t **)(a1 + 200));
  uint64_t result = mach_vm_deallocate(*MEMORY[0x1E4F14C48], a1, (*MEMORY[0x1E4F14C80] + 16679) & -*MEMORY[0x1E4F14C80]);
  if (result) {
    purgeable_ptr_in_use_enumerator_cold_1(result);
  }
  return result;
}

uint64_t sanitizer_memalign(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v30 = *MEMORY[0x1E4F14BF8];
  if (a3 <= 1) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = a3;
  }
  uint64_t v5 = *(void *)(a1 + 216);
  unint64_t v6 = v4;
  if (*(unsigned char *)(a1 + 209))
  {
    unint64_t v6 = v5 + v4;
    if (__CFADD__(v5, v4)) {
      return 0;
    }
  }
  _X22 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 112))();
  if (_X22) {
    BOOL v8 = *MEMORY[0x1E4F14C80] > v4;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 248);
    uint64_t v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    thread_stack_pcs();
    unsigned int v10 = (1540483477 * ((1540483477 * ((1540483477 * _X22) ^ ((1540483477 * _X22) >> 24))) ^ 0x70D300A5)) ^ (1540483477 * ((1540483477 * HIDWORD(_X22)) ^ ((1540483477 * HIDWORD(_X22)) >> 24)));
    uint64_t v11 = (uint64_t *)(v9
                    + 16 * ((1540483477 * (v10 ^ (v10 >> 13))) & 0xFFFFF ^ ((1540483477 * (v10 ^ (v10 >> 13))) >> 15)));
    uint64_t v12 = *v11;
    do
    {
      _X3 = v11[1];
      __asm { CASP            X2, X3, X22, X23, [X8] }
      _ZF = _X2 == v12;
      uint64_t v12 = _X2;
    }
    while (!_ZF);
  }
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"memalign(0x%lx, 0x%lx)\n");
  }
  if (_X22 && *(unsigned char *)(a1 + 209))
  {
    unint64_t v19 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 200) + 16))(*(void *)(a1 + 200), _X22);
    if (v19 < v6) {
      purgeable_ptr_in_use_enumerator_cold_1(v19);
    }
    poison_alloc(a1, _X22, v4, v5 - v6 + v19);
  }
  return _X22;
}

void sanitizer_free_definite_size(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"free_definite_size(%p, 0x%lx)\n");
  }
  if (*(unsigned char *)(a1 + 209))
  {
    a3 = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 200) + 16))(*(void *)(a1 + 200), a2);
    poison_free(a1, a2, a3);
  }

  place_into_quarantine(a1, a2, a3);
}

BOOL sanitizer_claimed_address(uint64_t a1)
{
  return (*(unsigned int (**)(void))(*(void *)(a1 + 200) + 136))() != 0;
}

void poison_alloc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"poison_alloc(%p, 0x%lx, 0x%lx)\n");
  }
  if (!*(unsigned char *)(a1 + 209)) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  *(void *)(((a4 + a3) & 0xFFFFFFFFFFFFFFF8) + a2 - 8) = a4;
  functions = (void (**)(uint64_t, void, uint64_t, uint64_t))malloc_sanitizer_get_functions();
  if (functions && (uint64_t v9 = *functions) != 0)
  {
    v9(a2, 0, a3, a4);
  }
  else if (*(unsigned char *)(a1 + 208))
  {
    malloc_report(4u, (uint64_t)"MallocSanitizerZone: Not poisoning allocation %p of size %lu with redzone size %lu due to missing pointers!\n");
  }
}

uint64_t stacktrace_depo_insert(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 >= 0x100) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  unsigned int v3 = -474048815;
  if (a3)
  {
    unint64_t v4 = a2;
    unint64_t v5 = a3;
    do
    {
      uint64_t v6 = *v4++;
      unsigned int v3 = (1540483477
          * ((1540483477 * ((1540483477 * v6) ^ ((1540483477 * v6) >> 24))) ^ (1540483477 * v3))) ^ (1540483477 * ((1540483477 * HIDWORD(v6)) ^ ((1540483477 * HIDWORD(v6)) >> 24)));
      --v5;
    }
    while (v5);
  }
  uint64_t v7 = (1540483477 * (v3 ^ (v3 >> 13))) ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15);
  uint64_t v8 = v7 & 0x7FFFF;
  unint64_t v9 = *(void *)(a1 + 8 * v8);
  if (a3 != HIBYTE(v9) || v7 != v9)
  {
    add_unint64_t explicit = atomic_fetch_add_explicit((atomic_ullong *volatile)(a1 + 37748736), a3, memory_order_relaxed);
    for (*(void *)(a1 + 8 * v8) = v7 | ((unint64_t)(add_explicit & 0x3FFFFF | (a3 << 24)) << 32);
          a3;
          --a3)
    {
      uint64_t v12 = *a2++;
      *(void *)(a1 + 8 * (add_explicit++ & 0x3FFFFF) + 0x400000) = v12;
    }
  }
  return v7;
}

void poison_free(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"poison_free(%p, 0x%lx)\n");
  }
  if (!a2) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  uint64_t functions = malloc_sanitizer_get_functions();
  if (functions && (uint64_t v7 = *(void (**)(uint64_t, uint64_t))(functions + 8)) != 0)
  {
    v7(a2, a3);
  }
  else if (*(unsigned char *)(a1 + 208))
  {
    malloc_report(4u, (uint64_t)"MallocSanitizerZone: Not poisoning deallocation %p of size %lu due to missing pointers!\n");
  }
}

void place_into_quarantine(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2)
  {
    unint64_t v3 = a3;
    if (!a3) {
      unint64_t v3 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16))();
    }
    if (v3 <= *MEMORY[0x1E4F14C80])
    {
      thread_stack_pcs();
      _X0 = 0;
      _X1 = 0;
      int v9 = 0;
      __asm { CASP            X0, X1, X0, X1, [X10] }
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 16640), (unsigned int *)&v9, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v9) {
        os_unfair_lock_lock_with_options();
      }
      if (*(void *)(a1 + 16664)) {
        **(void **)(a1 + 16656) = **(void **)(a1 + 16656) & 0xFFFF000000000000 | a2 & 0xFFFFFFFFFFFFLL;
      }
      else {
        *(void *)(a1 + 16648) = a2;
      }
      *(void *)(a1 + 16656) = a2;
      *(void *)a2 = v3 << 48;
      *(void *)(*(void *)(a1 + 16656) + 8) = 0;
      unint64_t v16 = *(void *)(a1 + 16664) + 1;
      unint64_t v17 = *(void *)(a1 + 16672) + v3;
      unint64_t v18 = *(void *)(a1 + 224);
      unint64_t v19 = *(void *)(a1 + 232);
      uint64_t v20 = v16 - v18;
      if (v16 < v18) {
        uint64_t v20 = 0;
      }
      if (v18) {
        uint64_t v21 = v20;
      }
      else {
        uint64_t v21 = 0;
      }
      uint64_t v22 = v17 - v19;
      if (v17 < v19) {
        uint64_t v22 = 0;
      }
      if (!v19) {
        uint64_t v22 = 0;
      }
      long long v23 = *(uint64_t **)(a1 + 16648);
      if (v21 > 0 || (uint64_t v24 = 0, v25 = 0, v26 = *(unint64_t **)(a1 + 16648), v22 >= 1))
      {
        uint64_t v27 = 0;
        uint64_t v25 = 0;
        long long v26 = *(unint64_t **)(a1 + 16648);
        do
        {
          do
          {
            uint64_t v28 = v21 + v27;
            unint64_t v29 = *v26;
            v25 += HIWORD(v29);
            v22 -= HIWORD(v29);
            long long v26 = (unint64_t *)(v29 & 0xFFFFFFFFFFFFLL);
            --v27;
          }
          while (v28 > 1);
        }
        while (v22 >= 1);
        uint64_t v24 = -v27;
      }
      *(void *)(a1 + 16648) = v26;
      *(void *)(a1 + 16664) = v16 - v24;
      *(void *)(a1 + 16672) = v17 - v25;
      int v30 = *(_DWORD *)(StatusReg + 24);
      int v31 = v30;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 16640), (unsigned int *)&v31, 0, memory_order_release, memory_order_relaxed);
      if (v31 != v30) {
        os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16640));
      }
      for (; v24; --v24)
      {
        uint64_t v32 = *v23;
        uint64_t v33 = HIWORD(*v23);
        if (*(unsigned char *)(a1 + 208)) {
          malloc_report(6u, (uint64_t)"evicting %p from quarantine, size = 0x%lx\n");
        }
        if (*(unsigned char *)(a1 + 209)) {
          unpoison(a1, (uint64_t)v23, v33);
        }
        (*(void (**)(void, uint64_t *))(*(void *)(a1 + 200) + 120))(*(void *)(a1 + 200), v23);
        long long v23 = (uint64_t *)(v32 & 0xFFFFFFFFFFFFLL);
      }
    }
    else
    {
      if (*(unsigned char *)(a1 + 209)) {
        unpoison(a1, a2, v3);
      }
      uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 200) + 48);
      v6();
    }
  }
}

void unpoison(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 208)) {
    malloc_report(6u, (uint64_t)"unpoison(%p, 0x%lx)\n");
  }
  if (!a2) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  uint64_t functions = (void (**)(uint64_t, void, uint64_t, void))malloc_sanitizer_get_functions();
  if (functions && (uint64_t v7 = *functions) != 0)
  {
    v7(a2, 0, a3, 0);
  }
  else if (*(unsigned char *)(a1 + 208))
  {
    malloc_report(4u, (uint64_t)"MallocSanitizerZone: Not unpoisoning %p of size %lu due to missing pointers!\n");
  }
}

uint64_t sanitizer_enumerator()
{
  return 46;
}

uint64_t sanitizer_good_size(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 200) + 96)) {
    uint64_t v1 = *(void *)(*(void *)(a1 + 200) + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sanitizer_check()
{
  return 1;
}

atomic_uint *sanitizer_force_lock(uint64_t a1)
{
  int v1 = 0;
  uint64_t result = (atomic_uint *)(a1 + 16640);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    return (atomic_uint *)os_unfair_lock_lock_with_options();
  }
  return result;
}

void sanitizer_force_unlock(os_unfair_lock_s *a1)
{
  int v1 = a1 + 4160;
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v3 = v2;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v1, (unsigned int *)&v3, 0, memory_order_release, memory_order_relaxed);
  if (v3 != v2) {
    os_unfair_lock_unlock(v1);
  }
}

BOOL sanitizer_zone_locked(os_unfair_lock_s *a1)
{
  int v1 = 0;
  int v2 = a1 + 4160;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v2, (unsigned int *)&v1, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  BOOL v4 = v1 == 0;
  if (!v1)
  {
    int v5 = *(_DWORD *)(StatusReg + 24);
    int v6 = v5;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v2, (unsigned int *)&v6, 0, memory_order_release, memory_order_relaxed);
    if (v6 != v5) {
      os_unfair_lock_unlock(v2);
    }
  }
  return !v4;
}

uint64_t sanitizer_reinit_lock(uint64_t result)
{
  *(_DWORD *)(result + 16640) = 0;
  return result;
}

uint64_t sanitizer_statistics_task()
{
  return 46;
}

void *large_entry_for_pointer_no_lock(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(unsigned int *)(a1 + 18824);
  if (!v2) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 18832);
  unsigned int v4 = (a2 >> *MEMORY[0x1E4F14C78]) % v2;
  while (1)
  {
    uint64_t result = (void *)(v3 + 24 * v4);
    if (*result == a2) {
      break;
    }
    if (*result)
    {
      if (v4 + 1 == v2) {
        unsigned int v4 = 0;
      }
      else {
        ++v4;
      }
      if (v4 != ((a2 >> *MEMORY[0x1E4F14C78]) % v2)) {
        continue;
      }
    }
    return 0;
  }
  return result;
}

void large_entries_free_no_lock(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  *a4 = a2;
  uint64_t v4 = *MEMORY[0x1E4F14C58];
  if (*MEMORY[0x1E4F14C58] <= *MEMORY[0x1E4F14C70]) {
    uint64_t v4 = *MEMORY[0x1E4F14C70];
  }
  a4[1] = (v4 + 24 * a3) & ~v4;
}

uint64_t large_in_use_enumerator()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  unint64_t v2 = v1;
  unsigned int v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  uint64_t v25 = *MEMORY[0x1E4F14BF8];
  uint64_t v23 = 0;
  long long v22 = 0uLL;
  uint64_t v12 = 24 * v3;
  uint64_t result = v13(v0, v5, v12, &v23);
  if (!result)
  {
    if ((v8 & 4) != 0)
    {
      uint64_t v15 = *MEMORY[0x1E4F14C58];
      if (*MEMORY[0x1E4F14C58] <= *MEMORY[0x1E4F14C70]) {
        uint64_t v15 = *MEMORY[0x1E4F14C70];
      }
      *(void *)&long long v22 = v6;
      *((void *)&v22 + 1) = (v15 + v12) & ~v15;
      v2(v11, v10, 4, &v22, 1);
    }
    uint64_t result = 0;
    if ((v8 & 3) != 0 && v4)
    {
      int v16 = 0;
      unsigned int v17 = v4 - 1;
      do
      {
        uint64_t v18 = v17;
        unint64_t v19 = (uint64_t *)(v23 + 24 * v17);
        uint64_t v20 = *v19;
        if (*v19)
        {
          uint64_t v21 = v19[1];
          *(void *)&long long v22 = v20;
          *((void *)&v22 + 1) = v21;
          v24[v16] = v22;
          if ((v16 + 1) >= 0x100)
          {
            v2(v11, v10, 3, v24, (v16 + 1));
            int v16 = 0;
          }
          else
          {
            ++v16;
          }
        }
        --v17;
      }
      while (v18);
      if (v16) {
        ((void (*)(uint64_t, uint64_t, uint64_t, _OWORD *))v2)(v11, v10, 3, v24);
      }
      return 0;
    }
  }
  return result;
}

mach_vm_address_t large_malloc(uint64_t a1, unint64_t a2, int a3, int a4)
{
  char v8 = (os_unfair_lock_s *)(a1 + 16392);
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (a2 <= 1) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = a2;
  }
  int v10 = *MEMORY[0x1E4F14C60];
  if (*MEMORY[0x1E4F14C60] <= *MEMORY[0x1E4F14C78]) {
    LOBYTE(v10) = *MEMORY[0x1E4F14C78];
  }
  unint64_t v11 = v9 << v10;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  if (!large_cache_enabled || v11 > *(void *)(a1 + 20400)) {
    goto LABEL_53;
  }
  int v12 = 0;
  int v34 = a4;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v8[606], (unsigned int *)&v12, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v12) {
    os_unfair_lock_lock_with_options();
  }
  os_unfair_lock_t lock = v8 + 606;
  do
  {
    int v41 = -1;
    int os_unfair_lock_opaque = v8[615]._os_unfair_lock_opaque;
    uint32_t v14 = v8[614]._os_unfair_lock_opaque;
    uint64_t v40 = 0;
    long long v39 = 0uLL;
    _platform_memset();
    unint64_t v15 = -1;
    while (1)
    {
      while (1)
      {
        unint64_t v16 = *(void *)(a1 + 24 * os_unfair_lock_opaque + 18864);
        if (!a3 || (*(void *)(a1 + 24 * os_unfair_lock_opaque + 18856) & ~(-1 << a3)) == 0)
        {
          if (v16 == v11) {
            break;
          }
          if (v16 > v11 && v16 < v15) {
            break;
          }
        }
LABEL_26:
        if (os_unfair_lock_opaque == v14) {
          goto LABEL_33;
        }
        if (!os_unfair_lock_opaque) {
          int os_unfair_lock_opaque = v8[1000]._os_unfair_lock_opaque;
        }
        --os_unfair_lock_opaque;
      }
      uint64_t v18 = *MEMORY[0x1E4F14C68];
      if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
        uint64_t v18 = *MEMORY[0x1E4F14C80];
      }
      if ((v15 + 2 * v18) >> 32 || mvm_reclaim_is_available()) {
        break;
      }
      int os_unfair_lock_opaque = remove_from_death_row_no_lock((_DWORD *)a1, os_unfair_lock_opaque, &v41);
      uint32_t v14 = v8[614]._os_unfair_lock_opaque;
      if (os_unfair_lock_opaque == -1) {
        goto LABEL_33;
      }
    }
    int v41 = os_unfair_lock_opaque;
    unint64_t v15 = v16;
    if (v16 != v11) {
      goto LABEL_26;
    }
    unint64_t v15 = v11;
LABEL_33:
    if (v41 != -1 && v15 - v11 < v11)
    {
      uint64_t v19 = a1 + 24 * v41;
      long long v39 = *(_OWORD *)(v19 + 18856);
      uint64_t v40 = *(void *)(v19 + 18872);
      remove_from_death_row_no_lock((_DWORD *)a1, v41, 0);
    }
    mach_vm_address_t pages = v39;
    if (!(void)v39) {
      goto LABEL_51;
    }
    unint64_t v21 = *((void *)&v39 + 1);
    uint64_t v22 = *MEMORY[0x1E4F14C68];
    if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
      uint64_t v22 = *MEMORY[0x1E4F14C80];
    }
  }
  while (!((unint64_t)(*((void *)&v39 + 1) + 2 * v22) >> 32)
       && !mvm_reclaim_mark_used(v40, v39, DWORD2(v39), v8->_os_unfair_lock_opaque));
  long long v39 = 0uLL;
  if (large_entry_grow_and_insert_no_lock(a1, pages, v21, &v39))
  {
    unint64_t v23 = *(void *)(a1 + 20432) - v21;
    *(void *)(a1 + 20432) = v23;
    if (v8[1018]._os_unfair_lock_opaque && !(v23 >> 19)) {
      v8[1018]._int os_unfair_lock_opaque = 0;
    }
    int v24 = *(_DWORD *)(StatusReg + 24);
    int v25 = v24;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v25, 0, memory_order_release, memory_order_relaxed);
    if (v25 != v24) {
      os_unfair_lock_unlock(lock);
    }
    if (*((void *)&v39 + 1)) {
      mvm_deallocate_pages(v39, *((void *)&v39 + 1), 0);
    }
    if (v34) {
      _platform_memset();
    }
    return pages;
  }
LABEL_51:
  int v26 = *(_DWORD *)(StatusReg + 24);
  int v27 = v26;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v27, 0, memory_order_release, memory_order_relaxed);
  if (v27 != v26) {
    os_unfair_lock_unlock(lock);
  }
LABEL_53:
  mach_vm_address_t pages = mvm_allocate_pages(v11, a3, (2 * v8->_os_unfair_lock_opaque) & 0x40000000 | v8->_os_unfair_lock_opaque, 3);
  if (pages)
  {
    int v28 = 0;
    unint64_t v29 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v8[606], (unsigned int *)&v28, *(_DWORD *)(v29 + 24), memory_order_acquire, memory_order_acquire);
    if (v28) {
      os_unfair_lock_lock_with_options();
    }
    int inserted = large_entry_grow_and_insert_no_lock(a1, pages, v11, &v37);
    int v31 = *(_DWORD *)(v29 + 24);
    int v32 = v31;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&v8[606], (unsigned int *)&v32, 0, memory_order_release, memory_order_relaxed);
    if (v32 != v31) {
      os_unfair_lock_unlock(v8 + 606);
    }
    if (inserted)
    {
      if (v38) {
        mvm_deallocate_pages(v37, v38, 0);
      }
    }
    else
    {
      return 0;
    }
  }
  return pages;
}

BOOL free_large(uint64_t a1, unint64_t a2, char a3)
{
  int v6 = 0;
  char v7 = (atomic_uint *)(a1 + 16392);
  char v8 = (os_unfair_lock_s *)(a1 + 18816);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 18816), (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v6) {
    os_unfair_lock_lock_with_options();
  }
  int v10 = large_entry_for_pointer_no_lock(a1, a2);
  unint64_t v11 = v10;
  if (v10)
  {
    if (!large_cache_enabled || v10[1] > *(void *)(a1 + 20400))
    {
      int v12 = v10;
      goto LABEL_7;
    }
    size_t v55 = v10[1];
    unint64_t v56 = StatusReg;
    uint64_t v59 = v7;
    int v25 = v7[615];
    unsigned int v57 = v8;
    uint64_t v58 = (void *)*v10;
    uint64_t v54 = v10[2];
LABEL_20:
    unsigned int v26 = v59[614];
    while (1)
    {
      int v27 = (void *)(a1 + 24 * v25);
      uint64_t v28 = v27[2357];
      uint64_t v29 = v27[2358];
      uint64_t v30 = v27[2359];
      uint64_t v31 = *MEMORY[0x1E4F14C68];
      if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
        uint64_t v31 = *MEMORY[0x1E4F14C80];
      }
      if (!((unint64_t)(v29 + 2 * v31) >> 32) && (mvm_reclaim_is_available() & 1) == 0)
      {
        int v25 = remove_from_death_row_no_lock((_DWORD *)a1, v25, 0);
        if (v25 != -1) {
          goto LABEL_20;
        }
        goto LABEL_39;
      }
      if (v28 == *v11) {
        break;
      }
      if (v25 == v26) {
        goto LABEL_39;
      }
      if (!v25) {
        int v25 = v59[1000];
      }
      --v25;
    }
    uint64_t v32 = *MEMORY[0x1E4F14C68];
    if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
      uint64_t v32 = *MEMORY[0x1E4F14C80];
    }
    if ((unint64_t)(v29 + 2 * v32) >> 32)
    {
LABEL_37:
      malloc_zone_error(*v59, 1, (uint64_t)"pointer %p being freed already on death-row\n");
      unint64_t v23 = v57;
      int v33 = *(_DWORD *)(v56 + 24);
      int v34 = v33;
      atomic_compare_exchange_strong_explicit(v59 + 606, (unsigned int *)&v34, 0, memory_order_release, memory_order_relaxed);
      if (v34 != v33) {
        goto LABEL_17;
      }
      return v11 != 0;
    }
    if (mvm_reclaim_mark_used(v30, v28, v29, *v59))
    {
      v27[2359] = mvm_reclaim_mark_free(v28, v29, *v59);
      goto LABEL_37;
    }
LABEL_39:
    uint64_t v13 = large_entry_free_no_lock(a1, v11);
    uint64_t v15 = v35;
    unint64_t StatusReg = v56;
    char v8 = v57;
    int v36 = *(_DWORD *)(v56 + 24);
    int v37 = v36;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v57, (unsigned int *)&v37, 0, memory_order_release, memory_order_relaxed);
    if (v37 != v36) {
      os_unfair_lock_unlock(v57);
    }
    char v7 = v59;
    if ((*(unsigned char *)v59 & 0x80) != 0
      && (int v60 = 0, MEMORY[0x1996FA0C0](*MEMORY[0x1E4F14C48], v58, 0, &v60)))
    {
      malloc_report(3u, (uint64_t)"*** can't vm_purgable_control(..., VM_PURGABLE_SET_STATE) for large freed block at %p\n");
      BOOL v38 = 0;
    }
    else
    {
      BOOL v38 = 1;
    }
    if (v59[1004] && mprotect(v58, v55, 3))
    {
      malloc_report(3u, (uint64_t)"*** can't reset protection for large freed block at %p\n");
      BOOL v38 = 0;
    }
    else if (v38)
    {
      atomic_uint v39 = *v59;
      if ((*v59 & 0x20) != 0)
      {
        _platform_memset();
        atomic_uint v39 = *v59;
      }
      uint64_t v40 = *MEMORY[0x1E4F14C68];
      if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
        uint64_t v40 = *MEMORY[0x1E4F14C80];
      }
      BOOL v38 = (v55 + 2 * v40) >> 32 == 0;
      uint64_t v54 = mvm_reclaim_mark_free((uint64_t)v58, v55, v39);
    }
    int v41 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v57, (unsigned int *)&v41, *(_DWORD *)(v56 + 24), memory_order_acquire, memory_order_acquire);
    if (v41) {
      os_unfair_lock_lock_with_options();
    }
    --v59[607];
    *(void *)(a1 + 18840) -= v55;
    if (!v38)
    {
      if (v13) {
        goto LABEL_8;
      }
      int v12 = 0;
LABEL_7:
      --v7[607];
      *(void *)(a1 + 18840) -= v12[1];
      uint64_t v13 = large_entry_free_no_lock(a1, v12);
      uint64_t v15 = v14;
LABEL_8:
      int v16 = *(_DWORD *)(StatusReg + 24);
      int v17 = v16;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v8, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
      if (v17 != v16) {
        os_unfair_lock_unlock(v8);
      }
      if (v13)
      {
        uint64_t v18 = v13;
        uint64_t v19 = v15;
        uint64_t v20 = 0;
LABEL_12:
        mvm_deallocate_pages(v18, v19, v20);
      }
      return v11 != 0;
    }
    signed int v42 = v59[615];
    signed int v43 = v59[614];
    if ((v42 != v43 || *(void *)(a1 + 24 * v42 + 18856)) && (v42 != v59[1000] - 1 ? ++v42 : (signed int v42 = 0), v42 == v43))
    {
      unint64_t v44 = (void *)(a1 + 24 * v43);
      uint64_t v45 = v44[2357];
      uint64_t v46 = v44[2358];
      *(void *)(a1 + 20432) -= v46;
      uint64_t v47 = v44[2359];
      signed int v42 = v43;
    }
    else
    {
      uint64_t v45 = 0;
      uint64_t v46 = 0;
      uint64_t v47 = 0;
    }
    unint64_t v48 = *(void *)(a1 + 20432) + v55;
    *(void *)(a1 + 20432) = v48;
    if (!v59[1018] && v48 > 0x100000) {
      v59[1018] = 1;
    }
    uint64_t v49 = (void *)(a1 + 24 * v42);
    v49[2357] = v58;
    v49[2358] = v55;
    v49[2359] = v54;
    v59[615] = v42;
    if (!v45) {
      goto LABEL_15;
    }
    if (v43 == v59[1000] - 1) {
      unsigned int v50 = 0;
    }
    else {
      unsigned int v50 = v43 + 1;
    }
    v59[614] = v50;
    int v51 = *(_DWORD *)(v56 + 24);
    int v52 = v51;
    atomic_compare_exchange_strong_explicit(v59 + 606, (unsigned int *)&v52, 0, memory_order_release, memory_order_relaxed);
    if (v52 != v51) {
      os_unfair_lock_unlock(v57);
    }
    uint64_t v53 = *MEMORY[0x1E4F14C68];
    if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
      uint64_t v53 = *MEMORY[0x1E4F14C80];
    }
    if (!((unint64_t)(v46 + 2 * v53) >> 32) && mvm_reclaim_mark_used(v47, v45, v46, *v59))
    {
      uint64_t v20 = *v59;
      uint64_t v18 = v45;
      uint64_t v19 = v46;
      goto LABEL_12;
    }
  }
  else
  {
    if ((a3 & 1) == 0) {
      malloc_zone_error(*v7, 1, (uint64_t)"pointer %p being freed was not allocated\n");
    }
LABEL_15:
    int v21 = *(_DWORD *)(StatusReg + 24);
    int v22 = v21;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v8, (unsigned int *)&v22, 0, memory_order_release, memory_order_relaxed);
    if (v22 != v21)
    {
      unint64_t v23 = v8;
LABEL_17:
      os_unfair_lock_unlock(v23);
    }
  }
  return v11 != 0;
}

uint64_t remove_from_death_row_no_lock(_DWORD *a1, int a2, _DWORD *a3)
{
  uint64_t v5 = a1 + 4098;
  LODWORD(v6) = a1[4712];
  LODWORD(v7) = a1[4713];
  if ((int)v6 >= (int)v7)
  {
    if ((int)v7 >= (int)v6)
    {
      if (a3 && *a3 != -1) {
        malloc_zone_error(*v5, 1, (uint64_t)"Invalid best: %d\n");
      }
      uint64_t v13 = &a1[6 * a2];
      v13[2358] = 0;
      v13[2357] = 0;
      v13[2359] = -1;
      return 0xFFFFFFFFLL;
    }
    else if ((int)v7 >= a2)
    {
      if ((int)v7 > a2)
      {
        uint64_t v14 = a2;
        uint64_t v15 = (uint64_t)&a1[6 * a2 + 4714];
        do
        {
          ++v14;
          *(_OWORD *)uint64_t v15 = *(_OWORD *)(v15 + 24);
          *(void *)(v15 + 16) = *(void *)(v15 + 40);
          v15 += 24;
        }
        while (v14 < (int)a1[4713]);
        LODWORD(v7) = a1[4713];
      }
      if (a3 && *a3 != -1)
      {
        --*a3;
        LODWORD(v7) = a1[4713];
      }
      if ((int)v7 <= 0) {
        LODWORD(v7) = a1[5098];
      }
      a1[4713] = v7 - 1;
      if (a2) {
        return (a2 - 1);
      }
      else {
        return (a1[5098] - 1);
      }
    }
    else
    {
      if ((int)v6 < a2)
      {
        uint64_t v11 = a2;
        uint64_t v12 = (uint64_t)&a1[6 * a2 + 4714];
        do
        {
          --v11;
          *(_OWORD *)uint64_t v12 = *(_OWORD *)(v12 - 24);
          *(void *)(v12 + 16) = *(void *)(v12 - 8);
          v12 -= 24;
          uint64_t v6 = (int)a1[4712];
        }
        while (v11 > v6);
      }
      if (v6 == a2) {
        uint64_t result = 0xFFFFFFFFLL;
      }
      else {
        uint64_t result = a2;
      }
      if ((int)v6 >= v5[1000] - 1) {
        v5[614] = 0;
      }
      else {
        v5[614] = v6 + 1;
      }
    }
  }
  else
  {
    if ((int)v7 > a2)
    {
      uint64_t v8 = a2;
      uint64_t v9 = (uint64_t)&a1[6 * a2 + 4714];
      do
      {
        ++v8;
        *(_OWORD *)uint64_t v9 = *(_OWORD *)(v9 + 24);
        *(void *)(v9 + 16) = *(void *)(v9 + 40);
        v9 += 24;
        uint64_t v7 = (int)a1[4713];
      }
      while (v8 < v7);
    }
    if (a3 && *a3 != -1)
    {
      --*a3;
      LODWORD(v7) = a1[4713];
    }
    if (a1[4712] == a2) {
      uint64_t result = 0xFFFFFFFFLL;
    }
    else {
      uint64_t result = (a2 - 1);
    }
    v5[615] = v7 - 1;
  }
  return result;
}

uint64_t large_entry_free_no_lock(uint64_t a1, void *a2)
{
  unsigned int v4 = (_DWORD *)(a1 + 16392);
  if (malloc_tracing_enabled) {
    large_entry_free_no_lock_cold_1();
  }
  uint64_t v5 = *a2;
  if ((*v4 & 3) != 0)
  {
    mvm_protect(*a2, a2[1], 3);
    uint64_t v6 = *MEMORY[0x1E4F14C68];
    if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
      uint64_t v6 = *MEMORY[0x1E4F14C80];
    }
    v5 -= v6;
  }
  *a2 = 0;
  a2[1] = 0;
  a2[2] = -1;
  uint64_t v7 = v4[608];
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)a2 - *(void *)(a1 + 18832)) >> 3);
  uint64_t v9 = (_DWORD *)MEMORY[0x1E4F14C78];
  unint64_t v10 = v8;
  do
  {
    if (v10 + 1 == v7) {
      unint64_t v10 = 0;
    }
    else {
      ++v10;
    }
    uint64_t v11 = *(void *)(a1 + 18832);
    uint64_t v12 = (uint64_t *)(v11 + 24 * v10);
    unint64_t v13 = *v12;
    long long v18 = *(_OWORD *)(v12 + 1);
    if (!*v12) {
      break;
    }
    *uint64_t v12 = 0;
    v12[1] = 0;
    *(void *)(v11 + 24 * v10 + 16) = -1;
    unint64_t v14 = v4[608];
    unsigned int v15 = (v13 >> *v9) % v14;
    while (1)
    {
      uint64_t v16 = v11 + 24 * v15;
      if (!*(void *)v16) {
        break;
      }
      if (v15 + 1 == v14) {
        unsigned int v15 = 0;
      }
      else {
        ++v15;
      }
      if (v15 == ((v13 >> *v9) % v14)) {
        goto LABEL_20;
      }
    }
    *(void *)uint64_t v16 = v13;
    *(_OWORD *)(v16 + 8) = v18;
LABEL_20:
    ;
  }
  while (v10 != v8);
  return v5;
}

uint64_t large_try_realloc_in_place(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = 0;
  uint64_t v9 = (_DWORD *)(a1 + 16392);
  vm_address_t address = a2 + a3;
  unint64_t v10 = (os_unfair_lock_s *)(a1 + 18816);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 18816), (unsigned int *)&v8, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v8) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v12 = large_entry_for_pointer_no_lock(a1, address);
  int v13 = *(_DWORD *)(StatusReg + 24);
  int v14 = v13;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v10, (unsigned int *)&v14, 0, memory_order_release, memory_order_relaxed);
  if (v14 != v13) {
    os_unfair_lock_unlock(v10);
  }
  if (v12) {
    return 0;
  }
  uint64_t v15 = *MEMORY[0x1E4F14C58];
  if (*MEMORY[0x1E4F14C58] <= *MEMORY[0x1E4F14C70]) {
    uint64_t v15 = *MEMORY[0x1E4F14C70];
  }
  uint64_t v16 = (v15 + a4) & ~v15;
  vm_size_t v17 = v16 - a3;
  if (vm_allocate(*MEMORY[0x1E4F14C48], &address, v17, 100663296)) {
    return 0;
  }
  int v19 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v10, (unsigned int *)&v19, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v19) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v20 = large_entry_for_pointer_no_lock(a1, a2);
  if (v20)
  {
    *uint64_t v20 = a2;
    v20[1] = v16;
    *(void *)(a1 + 18840) += v17;
    int v21 = *(_DWORD *)(StatusReg + 24);
    int v22 = v21;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v10, (unsigned int *)&v22, 0, memory_order_release, memory_order_relaxed);
    uint64_t v23 = 1;
    uint64_t result = 1;
    if (v22 != v21) {
      goto LABEL_17;
    }
  }
  else
  {
    malloc_zone_error(*v9, 1, (uint64_t)"large entry %p reallocated is not properly in table\n");
    uint64_t v23 = 0;
    uint64_t result = 0;
    int v24 = *(_DWORD *)(StatusReg + 24);
    int v25 = v24;
    atomic_compare_exchange_strong_explicit(v9 + 606, (unsigned int *)&v25, 0, memory_order_release, memory_order_relaxed);
    if (v25 != v24)
    {
LABEL_17:
      os_unfair_lock_unlock(v10);
      return v23;
    }
  }
  return result;
}

uint64_t large_claimed_address(uint64_t a1, uint64_t a2)
{
  int v4 = 0;
  uint64_t v5 = (os_unfair_lock_s *)(a1 + 18816);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 18816), (unsigned int *)&v4, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v4) {
    os_unfair_lock_lock_with_options();
  }
  unint64_t os_unfair_lock_opaque = v5[2]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque)
  {
    unint64_t v8 = -*MEMORY[0x1E4F14C80] & a2;
    uint64_t v9 = *(void *)(a1 + 18832);
    uint32_t v10 = (v8 >> *MEMORY[0x1E4F14C78]) % os_unfair_lock_opaque;
    while (1)
    {
      unint64_t v11 = *(void *)(v9 + 24 * v10);
      if (v11 == v8 || v11 <= v8 && *(void *)(v9 + 24 * v10 + 8) + v11 > v8) {
        break;
      }
      if (!v10) {
        uint32_t v10 = v5[2]._os_unfair_lock_opaque;
      }
      if (--v10 == ((v8 >> *MEMORY[0x1E4F14C78]) % os_unfair_lock_opaque)) {
        goto LABEL_11;
      }
    }
    uint64_t v12 = 1;
  }
  else
  {
LABEL_11:
    uint64_t v12 = 0;
  }
  int v13 = *(_DWORD *)(StatusReg + 24);
  int v14 = v13;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v5, (unsigned int *)&v14, 0, memory_order_release, memory_order_relaxed);
  if (v14 != v13) {
    os_unfair_lock_unlock(v5);
  }
  return v12;
}

void large_destroy_cache(uint64_t a1)
{
  int v2 = 0;
  __dst[192] = *MEMORY[0x1E4F14BF8];
  uint64_t v3 = a1 + 18816;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 18816), (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v2) {
    os_unfair_lock_lock_with_options();
  }
  *(_DWORD *)(v3 + 1648) = 0;
  int v5 = *(_DWORD *)(v3 + 32);
  int v6 = *(_DWORD *)(v3 + 36);
  memcpy(__dst, (const void *)(a1 + 18856), 0x600uLL);
  *(void *)(a1 + 20432) = 0;
  *(void *)(a1 + 20416) = 0;
  *(void *)(v3 + 40) = 0;
  *(void *)(v3 + 48) = 0;
  *(void *)(v3 + 32) = 0;
  int v7 = *(_DWORD *)(StatusReg + 24);
  int v8 = v7;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v3, (unsigned int *)&v8, 0, memory_order_release, memory_order_relaxed);
  if (v8 != v7) {
    os_unfair_lock_unlock((os_unfair_lock_t)v3);
  }
  if (v5 != v6)
  {
    do
    {
      large_deallocate_cache_entry(a1, &__dst[3 * v5]);
      if (v5 + 1 == *(_DWORD *)(v3 + 1576)) {
        int v5 = 0;
      }
      else {
        ++v5;
      }
    }
    while (v5 != v6);
    int v5 = v6;
  }
  uint64_t v9 = &__dst[3 * v5];
  if (*v9)
  {
    if (__dst[3 * v5 + 1]) {
      large_deallocate_cache_entry(a1, v9);
    }
  }
}

uint64_t large_deallocate_cache_entry(uint64_t a1, uint64_t *a2)
{
  unint64_t v4 = a2[1];
  if (!HIDWORD(v4))
  {
    uint64_t result = mvm_reclaim_mark_used(a2[2], *a2, v4, *(_DWORD *)(a1 + 16392));
    if (!result) {
      return result;
    }
    unint64_t v4 = a2[1];
  }
  uint64_t v6 = *a2;
  uint64_t v7 = *(unsigned int *)(a1 + 16392);

  return mvm_deallocate_pages(v6, v4, v7);
}

void szone_free(uint64_t a1, unint64_t a2)
{
}

void _szone_free(uint64_t a1, unint64_t a2, int a3)
{
  if (a2)
  {
    if ((a2 & 0xF) != 0)
    {
      if ((a3 & 1) == 0)
      {
        int v5 = *(_DWORD *)(a1 + 16392);
        uint64_t v6 = "Non-aligned pointer %p being freed\n";
LABEL_35:
        malloc_zone_error(v5, 1, (uint64_t)v6);
        return;
      }
    }
    else
    {
      uint64_t v7 = *(uint64_t **)(a1 + 16536);
      uint64_t v8 = *v7;
      if (*v7)
      {
        unint64_t v9 = a2 & 0xFFFFFFFFFFF00000;
        uint64_t v10 = v7[2];
        unint64_t v11 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*((unsigned char *)v7 + 8);
        unint64_t v12 = v11;
        do
        {
          uint64_t v13 = *(void *)(v10 + 8 * v12);
          if (!v13) {
            break;
          }
          if (v13 == v9)
          {
            if (!v9) {
              break;
            }
            if (((a2 + 1032064) & 0xFFF80u) > 0xFBF70uLL)
            {
              int v5 = *(_DWORD *)(a1 + 16392);
              uint64_t v6 = "Pointer %p to metadata being freed\n";
              goto LABEL_35;
            }
            uint64_t v22 = a1 + 16512;
            free_tiny(v22, a2, v9, 0, 0);
            return;
          }
          if (v12 + 1 == v8) {
            unint64_t v12 = 0;
          }
          else {
            ++v12;
          }
        }
        while (v12 != v11);
      }
      if ((a2 & 0x1FF) != 0)
      {
        if ((a3 & 1) == 0)
        {
          int v5 = *(_DWORD *)(a1 + 16392);
          uint64_t v6 = "Non-aligned pointer %p being freed (2)\n";
          goto LABEL_35;
        }
      }
      else
      {
        int v14 = *(uint64_t **)(a1 + 17304);
        uint64_t v15 = *v14;
        if (*v14)
        {
          unint64_t v16 = a2 & 0xFFFFFFFFFF800000;
          uint64_t v17 = v14[2];
          unint64_t v18 = (0x9E3779B97F4A7C55 * ((a2 & 0xFFFFFFFFFF800000) >> 20)) >> -*((unsigned char *)v14 + 8);
          unint64_t v19 = v18;
          do
          {
            uint64_t v20 = *(void *)(v17 + 8 * v19);
            if (!v20) {
              break;
            }
            if (v20 == v16)
            {
              if (!v16) {
                break;
              }
              if (((a2 + 8355328) & 0x7FFE00u) > 0x7F7C00uLL)
              {
                int v5 = *(_DWORD *)(a1 + 16392);
                uint64_t v6 = "Pointer %p to metadata being freed (2)\n";
                goto LABEL_35;
              }
              unint64_t v23 = a1 + 17280;
              free_small(v23, a2, v16, 0);
              return;
            }
            if (v19 + 1 == v15) {
              unint64_t v19 = 0;
            }
            else {
              ++v19;
            }
          }
          while (v19 != v18);
        }
        if (((*MEMORY[0x1E4F14C80] - 1) & a2) != 0)
        {
          if ((a3 & 1) == 0)
          {
            int v5 = *(_DWORD *)(a1 + 16392);
            uint64_t v6 = "non-page-aligned, non-allocated pointer %p being freed\n";
            goto LABEL_35;
          }
        }
        else
        {
          BOOL v21 = free_large(a1, a2, a3);
          if (!a3 || v21) {
            return;
          }
        }
      }
    }
    find_zone_and_free((void *)a2, 1u);
  }
}

void szone_free_definite_size(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2)
  {
    if ((a2 & 0xF) != 0)
    {
      int v3 = *(_DWORD *)(a1 + 16392);
      unint64_t v4 = "Non-aligned pointer %p being freed\n";
LABEL_4:
      malloc_zone_error(v3, 1, (uint64_t)v4);
      return;
    }
    if (a3 > 0x3F0)
    {
      if ((a2 & 0x1FF) != 0)
      {
        int v3 = *(_DWORD *)(a1 + 16392);
        unint64_t v4 = "Non-aligned pointer %p being freed (2)\n";
        goto LABEL_4;
      }
      if (a3 > 0x3C00)
      {
        if (((*MEMORY[0x1E4F14C80] - 1) & a2) != 0)
        {
          int v3 = *(_DWORD *)(a1 + 16392);
          unint64_t v4 = "non-page-aligned, non-allocated pointer %p being freed\n";
          goto LABEL_4;
        }
        free_large(a1, a2, 0);
      }
      else
      {
        if (((a2 + 8355328) & 0x7FFE00u) > 0x7F7C00uLL)
        {
          int v3 = *(_DWORD *)(a1 + 16392);
          unint64_t v4 = "Pointer %p to metadata being freed (2)\n";
          goto LABEL_4;
        }
        unint64_t v6 = a1 + 17280;
        free_small(v6, a2, a2 & 0xFFFFFFFFFF800000, a3);
      }
    }
    else
    {
      if (((a2 + 1032064) & 0xFFF80u) > 0xFBF70uLL)
      {
        int v3 = *(_DWORD *)(a1 + 16392);
        unint64_t v4 = "Pointer %p to metadata being freed\n";
        goto LABEL_4;
      }
      uint64_t v5 = a1 + 16512;
      free_tiny(v5, a2, a2 & 0xFFFFFFFFFFF00000, a3, 0);
    }
  }
}

unint64_t szone_malloc_should_clear(uint64_t a1, unint64_t a2, int a3)
{
  if (a2 <= 0x3F0)
  {
    if ((((a2 + 15) >> 4) & 0xFFFE) != 0) {
      uint64_t v6 = (unsigned __int16)((a2 + 15) >> 4);
    }
    else {
      uint64_t v6 = 1;
    }
    mach_vm_address_t should_clear = tiny_malloc_should_clear(a1 + 16512, v6, a3);
LABEL_14:
    unint64_t v11 = should_clear;
    if (!a2) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  if (a2 <= 0x3C00)
  {
    mach_vm_address_t should_clear = small_malloc_should_clear(a1 + 17280, (unsigned __int16)((a2 + 511) >> 9), a3);
    goto LABEL_14;
  }
  uint64_t v8 = *MEMORY[0x1E4F14C58];
  if (*MEMORY[0x1E4F14C58] <= *MEMORY[0x1E4F14C70]) {
    uint64_t v8 = *MEMORY[0x1E4F14C70];
  }
  unint64_t v9 = (v8 + a2) & ~v8;
  int v10 = *MEMORY[0x1E4F14C60];
  if (*MEMORY[0x1E4F14C60] <= *MEMORY[0x1E4F14C78]) {
    LOBYTE(v10) = *MEMORY[0x1E4F14C78];
  }
  if (v9 >> v10)
  {
    mach_vm_address_t should_clear = large_malloc(a1, v9 >> v10, 0, a3);
    goto LABEL_14;
  }
  unint64_t v11 = 0;
LABEL_15:
  if (!a3 && (*(_DWORD *)(a1 + 16392) & 0x20) != 0 && v11 != 0)
  {
    szone_size(a1, v11);
    _platform_memset();
    return v11;
  }
LABEL_22:
  if (!v11) {
    **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  }
  return v11;
}

uint64_t szone_size(uint64_t a1, unint64_t a2)
{
  if (!a2 || (a2 & 0xF) != 0) {
    return 0;
  }
  uint64_t result = tiny_size(a1 + 16512, a2);
  if (!result)
  {
    if ((a2 & 0x1FF) != 0) {
      return 0;
    }
    uint64_t result = small_size(a1 + 17280, a2);
    if (result) {
      return result;
    }
    if (((*MEMORY[0x1E4F14C80] - 1) & a2) != 0) {
      return 0;
    }
    return szone_size_try_large(a1, a2);
  }
  return result;
}

unint64_t szone_malloc(uint64_t a1, unint64_t a2)
{
  return szone_malloc_should_clear(a1, a2, 0);
}

unint64_t szone_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 == 1) {
    return szone_malloc_should_clear(a1, a3, 1);
  }
  if (is_mul_ok(a2, a3))
  {
    a3 *= a2;
    if (a3 <= malloc_absolute_max_size) {
      return szone_malloc_should_clear(a1, a3, 1);
    }
  }
  **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return 0;
}

mach_vm_address_t szone_valloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x800000) {
    return szone_memalign(a1, *MEMORY[0x1E4F14C80], a2);
  }
  uint64_t v3 = *MEMORY[0x1E4F14C58];
  if (*MEMORY[0x1E4F14C58] <= *MEMORY[0x1E4F14C70]) {
    uint64_t v3 = *MEMORY[0x1E4F14C70];
  }
  unint64_t v4 = (v3 + a2) & ~v3;
  int v5 = *MEMORY[0x1E4F14C60];
  if (*MEMORY[0x1E4F14C60] <= *MEMORY[0x1E4F14C78]) {
    LOBYTE(v5) = *MEMORY[0x1E4F14C78];
  }
  return large_malloc(a1, v4 >> v5, 0, 0);
}

mach_vm_address_t szone_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a3 <= 1) {
    a3 = 1;
  }
  unint64_t v3 = a3 + a2;
  if (__CFADD__(a3, a2)) {
    return 0;
  }
  if (a2 <= 0x10) {
    return szone_malloc_should_clear(a1, a3, 0);
  }
  unint64_t v5 = v3 - 1;
  if (v3 - 1 <= 0x3F0) {
    return tiny_memalign(a1, a2, a3, v5);
  }
  if (a2 <= 0x200 && a3 >= 0x3F1) {
    return szone_malloc_should_clear(a1, a3, 0);
  }
  if (a3 < 0x3F1)
  {
    a3 = 1024;
    unint64_t v5 = a2 + 1023;
  }
  if (v5 <= 0x3C00) {
    return small_memalign(a1, a2, a3, v5);
  }
  if (a3 >= 0x3C01 && *MEMORY[0x1E4F14C80] >= a2) {
    return szone_malloc_should_clear(a1, a3, 0);
  }
  uint64_t v6 = 15361;
  if (a3 > 0x3C01) {
    uint64_t v6 = a3;
  }
  uint64_t v7 = *MEMORY[0x1E4F14C58];
  if (*MEMORY[0x1E4F14C58] <= *MEMORY[0x1E4F14C70]) {
    uint64_t v7 = *MEMORY[0x1E4F14C70];
  }
  unint64_t v8 = (v7 + v6) & ~v7;
  int v9 = *MEMORY[0x1E4F14C60];
  int v10 = *MEMORY[0x1E4F14C78];
  if (*MEMORY[0x1E4F14C60] <= *MEMORY[0x1E4F14C78]) {
    LOBYTE(v9) = *MEMORY[0x1E4F14C78];
  }
  unint64_t v11 = v8 >> v9;
  if (!v11) {
    return 0;
  }
  int v12 = __clz(__rbit64(a2));
  if (v10 <= v12) {
    LOBYTE(v10) = v12;
  }
  return large_malloc(a1, v11, v10, 0);
}

uint64_t szone_size_try_large(uint64_t a1, unint64_t a2)
{
  int v4 = 0;
  unint64_t v5 = (os_unfair_lock_s *)(a1 + 18816);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 18816), (unsigned int *)&v4, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v4) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v7 = large_entry_for_pointer_no_lock(a1, a2);
  if (v7) {
    uint64_t v8 = v7[1];
  }
  else {
    uint64_t v8 = 0;
  }
  int v9 = *(_DWORD *)(StatusReg + 24);
  int v10 = v9;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v5, (unsigned int *)&v10, 0, memory_order_release, memory_order_relaxed);
  if (v10 != v9) {
    os_unfair_lock_unlock(v5);
  }
  return v8;
}

unint64_t szone_realloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v4 = a1;
  if (!a2)
  {
    unint64_t v10 = a3;
LABEL_13:
    return szone_malloc_should_clear(a1, v10, 0);
  }
  unint64_t v5 = (const void *)a2;
  if (!a3)
  {
    _szone_free(a1, a2, 0);
    a1 = v4;
    unint64_t v10 = 1;
    goto LABEL_13;
  }
  uint64_t v6 = szone_size(a1, a2);
  if (!v6)
  {
    malloc_zone_error(*(_DWORD *)(v4 + 16392), 1, (uint64_t)"pointer %p being reallocated was not allocated\n");
    return 0;
  }
  unint64_t v7 = v6;
  unint64_t v8 = szone_good_size(v6, a3);
  if (v8 == v7) {
    return (unint64_t)v5;
  }
  unint64_t v9 = v8;
  if (v8 > 0x3F0)
  {
    if (v8 > 0x3C00)
    {
      if (v7 < 0x3C01) {
        goto LABEL_33;
      }
      int v12 = *(_DWORD *)(v4 + 16392);
      if ((v12 & 0x80) != 0) {
        goto LABEL_33;
      }
      if (v8 > v7 >> 1)
      {
        if (v8 <= v7) {
          goto LABEL_36;
        }
        if (large_try_realloc_in_place(v4, (unint64_t)v5, v7, v8))
        {
          if ((*(unsigned char *)(v4 + 16392) & 0x20) != 0) {
            goto LABEL_37;
          }
          return (unint64_t)v5;
        }
        goto LABEL_33;
      }
      return large_try_shrink_in_place(v4, (unint64_t)v5, v7, v8);
    }
    else
    {
      if ((v7 - 1009) >> 4 > 0x380) {
        goto LABEL_33;
      }
      if (v8 > v7 >> 1)
      {
        if (v8 > v7)
        {
          if (!small_try_realloc_in_place(v4 + 17280, (uint64_t)v5, v7, v8)) {
            goto LABEL_33;
          }
          goto LABEL_24;
        }
LABEL_35:
        LOBYTE(v12) = *(unsigned char *)(v4 + 16392);
LABEL_36:
        if ((v12 & 0x20) != 0) {
LABEL_37:
        }
          _platform_memset();
        return (unint64_t)v5;
      }
      return small_try_shrink_in_place(v4 + 17280, (uint64_t)v5, v7, v8);
    }
  }
  else
  {
    if (v7 > 0x3F0) {
      goto LABEL_33;
    }
    if (v8 > v7 >> 1)
    {
      if (v8 > v7)
      {
        if (!tiny_try_realloc_in_place(v4 + 16512, (uint64_t)v5, v7, v8))
        {
LABEL_33:
          if (v9 > v7 >> 1 && v9 <= v7) {
            goto LABEL_35;
          }
          mach_vm_address_t should_clear = (void *)szone_malloc_should_clear(v4, a3, 0);
          if (should_clear)
          {
            int v14 = should_clear;
            if (v7 >= a3) {
              size_t v15 = a3;
            }
            else {
              size_t v15 = v7;
            }
            memcpy(should_clear, v5, v15);
            _szone_free(v4, (unint64_t)v5, 0);
            return (unint64_t)v14;
          }
          return 0;
        }
LABEL_24:
        if ((*(unsigned char *)(v4 + 16392) & 0x20) != 0) {
          goto LABEL_37;
        }
        return (unint64_t)v5;
      }
      goto LABEL_35;
    }
    return tiny_try_shrink_in_place(v4 + 16512, (uint64_t)v5, v7, v8);
  }
}

uint64_t szone_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x3F0)
  {
    if (a2 > 0x3C00)
    {
      uint64_t v4 = *MEMORY[0x1E4F14C58];
      if (*MEMORY[0x1E4F14C58] <= *MEMORY[0x1E4F14C70]) {
        uint64_t v4 = *MEMORY[0x1E4F14C70];
      }
      unint64_t v5 = (v4 + a2) & ~v4;
      if (v5 < a2) {
        return -1;
      }
      else {
        return v5;
      }
    }
    else
    {
      return (a2 + 511) & 0x1FFFE00;
    }
  }
  else
  {
    if ((((a2 + 15) >> 4) & 0xFFFE) != 0) {
      unsigned int v2 = (unsigned __int16)((a2 + 15) >> 4);
    }
    else {
      unsigned int v2 = 1;
    }
    return 16 * v2;
  }
}

uint64_t szone_batch_malloc(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2 > 0x3F0) {
    return 0;
  }
  else {
    return tiny_batch_malloc(a1, a2, a3, a4);
  }
}

void szone_batch_free(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a3)
  {
    tiny_batch_free(a1, a2, a3);
    unsigned int v6 = a3 - 1;
    do
    {
      unint64_t v7 = *(void *)(a2 + 8 * v6);
      if (v7) {
        _szone_free(a1, v7, 0);
      }
    }
    while ((unint64_t)v6--);
  }
}

BOOL szone_claimed_address(uint64_t a1, unint64_t a2)
{
  return tiny_claimed_address(a1 + 16512, a2)
      || small_claimed_address(a1 + 17280, a2)
      || large_claimed_address(a1, a2) != 0;
}

uint64_t scalable_zone_info(uint64_t a1, void *a2, unsigned int a3)
{
  return scalable_zone_info_task(*MEMORY[0x1E4F14C48], (unsigned int (*)(uint64_t, void, uint64_t, uint64_t *))_malloc_default_reader_0, a1, a2, a3);
}

uint64_t scalable_zone_info_task(uint64_t a1, unsigned int (*a2)(uint64_t, void, uint64_t, uint64_t *), uint64_t a3, void *a4, unsigned int a5)
{
  uint64_t v31 = *MEMORY[0x1E4F14BF8];
  uint64_t v24 = 0;
  if (a2(a1, *(void *)(a3 + 17136), 2560, &v24)) {
    return 0;
  }
  uint64_t v10 = *(unsigned int *)(a3 + 17120);
  if ((v10 & 0x80000000) != 0)
  {
    uint64_t v13 = 0;
    int v12 = 0;
    LODWORD(v11) = 0;
  }
  else
  {
    uint64_t v11 = 0;
    int v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = v24 - 432;
    uint64_t v15 = v10 + 1;
    do
    {
      v13 += *(void *)(v14 + 8) + *(void *)v14;
      v12 += *(_DWORD *)(v14 + 40);
      v11 += *(void *)(v14 + 24);
      v14 += 2560;
      --v15;
    }
    while (v15);
  }
  __src[4] = v12;
  __src[5] = v11;
  if (a2(a1, *(void *)(a3 + 17904), 2560, &v24)) {
    return 0;
  }
  uint64_t v17 = *(unsigned int *)(a3 + 17888);
  if ((v17 & 0x80000000) != 0)
  {
    int v19 = 0;
    LODWORD(v18) = 0;
  }
  else
  {
    uint64_t v18 = 0;
    int v19 = 0;
    uint64_t v20 = v24 - 432;
    uint64_t v21 = v17 + 1;
    do
    {
      v13 += *(void *)(v20 + 8) + *(void *)v20;
      v19 += *(_DWORD *)(v20 + 40);
      v18 += *(void *)(v20 + 24);
      v20 += 2560;
      --v21;
    }
    while (v21);
  }
  __src[6] = v19;
  __src[7] = v18;
  int v22 = *(_DWORD *)(a3 + 18840);
  int v26 = *(_DWORD *)(a3 + 18820);
  int v27 = v22;
  int v28 = 0;
  int v29 = 0;
  int v30 = *(_DWORD *)(a3 + 16392);
  __src[0] = v26 + v19 + v12;
  __src[1] = v18 + v11 + v22;
  int v23 = ((*(_DWORD *)(a3 + 17288) - *(_DWORD *)(a3 + 17296)) << 23)
      + ((*(_DWORD *)(a3 + 16520) - *(_DWORD *)(a3 + 16528)) << 20)
      + v22;
  __src[2] = v23 - v13;
  __src[3] = v23;
  memcpy(a4, __src, 4 * a5);
  return 1;
}

uint64_t szone_pressure_relief()
{
  if (malloc_tracing_enabled) {
    szone_pressure_relief_cold_1();
  }
  return 0;
}

uint64_t scalable_zone_statistics(uint64_t a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 0:
      uint64_t v4 = *(unsigned int *)(a1 + 17120);
      if ((v4 & 0x80000000) != 0)
      {
        uint64_t v7 = 0;
        int v6 = 0;
        uint64_t v5 = 0;
      }
      else
      {
        uint64_t v5 = 0;
        int v6 = 0;
        uint64_t v7 = 0;
        uint64_t v8 = *(void *)(a1 + 17136) - 432;
        uint64_t v9 = v4 + 1;
        do
        {
          v5 += *(void *)(v8 + 8) + *(void *)v8;
          v6 += *(_DWORD *)(v8 + 40);
          v7 += *(void *)(v8 + 24);
          v8 += 2560;
          --v9;
        }
        while (v9);
      }
      *(_DWORD *)a2 = v6;
      uint64_t v17 = (*(void *)(a1 + 16520) - *(void *)(a1 + 16528)) << 20;
      *(void *)(a2 + 8) = v7;
      *(void *)(a2 + 16) = v17 - v5;
      *(void *)(a2 + 24) = v17;
      goto LABEL_18;
    case 1:
      uint64_t v10 = *(unsigned int *)(a1 + 17888);
      if ((v10 & 0x80000000) != 0)
      {
        uint64_t v13 = 0;
        int v12 = 0;
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = 0;
        int v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = *(void *)(a1 + 17904) - 432;
        uint64_t v15 = v10 + 1;
        do
        {
          v13 += *(void *)(v14 + 8) + *(void *)v14;
          v12 += *(_DWORD *)(v14 + 40);
          v11 += *(void *)(v14 + 24);
          v14 += 2560;
          --v15;
        }
        while (v15);
      }
      *(_DWORD *)a2 = v12;
      uint64_t v18 = (*(void *)(a1 + 17288) - *(void *)(a1 + 17296)) << 23;
      *(void *)(a2 + 24) = v18;
      uint64_t v16 = v18 - v13;
      *(void *)(a2 + 8) = v11;
      goto LABEL_17;
    case 2:
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 18820);
      uint64_t v16 = *(void *)(a1 + 18840);
      *(void *)(a2 + 24) = v16;
      *(void *)(a2 + 8) = v16;
LABEL_17:
      *(void *)(a2 + 16) = v16;
LABEL_18:
      uint64_t result = 1;
      break;
    case 3:
    case 4:
      *(_DWORD *)a2 = 0;
      *(void *)(a2 + 16) = 0;
      *(void *)(a2 + 24) = 0;
      uint64_t result = 1;
      *(void *)(a2 + 8) = 0;
      break;
    default:
      uint64_t result = 0;
      break;
  }
  return result;
}

uint64_t szone_ptr_in_use_enumerator(uint64_t task, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4))
{
  uint64_t v5 = a5;
  if (!a5)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    uint64_t v5 = _malloc_default_reader_0;
  }
  uint64_t v10 = 0;
  uint64_t result = v5(task, a4, 20480, &v10);
  if (!result)
  {
    uint64_t result = tiny_in_use_enumerator();
    if (!result)
    {
      uint64_t result = small_in_use_enumerator();
      if (!result) {
        return large_in_use_enumerator();
      }
    }
  }
  return result;
}

uint64_t szone_check(uint64_t a1)
{
  unsigned int v2 = szone_check_counter + 1;
  szone_check_counter = v2;
  HIDWORD(v3) = 989560465 * v2;
  LODWORD(v3) = 989560465 * v2;
  if ((v3 >> 4) <= 0x68DB8)
  {
    malloc_report(5u, (uint64_t)"at szone_check counter=%d\n");
    unsigned int v2 = szone_check_counter;
  }
  if (v2 < szone_check_start || v2 % szone_check_modulo) {
    return 1;
  }

  return szone_check_all(a1);
}

uint64_t szone_print_self(const void *a1, int a2)
{
  return szone_print(*MEMORY[0x1E4F14C48], 2 * (a2 != 0), a1, (unsigned int (*)(uint64_t, uint64_t, uint64_t, uint64_t *))_malloc_default_reader_0, (void (*)(const char *, ...))malloc_report_simple);
}

uint64_t szone_log(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16400) = a2;
  return result;
}

uint64_t szone_force_lock(uint64_t a1)
{
  unsigned int v2 = (int *)(a1 + 17120);
  if (*(int *)(a1 + 17120) >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      int v6 = 0;
      uint64_t v7 = (atomic_uint *)(*(void *)(a1 + 17136) + v3);
      atomic_compare_exchange_strong_explicit(v7 + 1, (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v6) {
        os_unfair_lock_lock_with_options();
      }
      int v8 = 0;
      atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v8, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v8) {
        os_unfair_lock_lock_with_options();
      }
      ++v4;
      v3 += 2560;
    }
    while (v4 < *v2);
  }
  int v9 = 0;
  uint64_t v10 = (atomic_uint *)(*(void *)(a1 + 17136) - 2560);
  uint64_t v11 = (atomic_uint *)(*(void *)(a1 + 17136) - 2556);
  unint64_t v12 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit(v11, (unsigned int *)&v9, *(_DWORD *)(v12 + 24), memory_order_acquire, memory_order_acquire);
  if (v9) {
    os_unfair_lock_lock_with_options();
  }
  int v13 = 0;
  atomic_compare_exchange_strong_explicit(v10, (unsigned int *)&v13, *(_DWORD *)(v12 + 24), memory_order_acquire, memory_order_acquire);
  if (v13) {
    os_unfair_lock_lock_with_options();
  }
  if (v2[192] >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    do
    {
      int v16 = 0;
      uint64_t v17 = (atomic_uint *)(*(void *)(a1 + 17904) + v14);
      atomic_compare_exchange_strong_explicit(v17 + 1, (unsigned int *)&v16, *(_DWORD *)(v12 + 24), memory_order_acquire, memory_order_acquire);
      if (v16) {
        os_unfair_lock_lock_with_options();
      }
      int v18 = 0;
      atomic_compare_exchange_strong_explicit(v17, (unsigned int *)&v18, *(_DWORD *)(v12 + 24), memory_order_acquire, memory_order_acquire);
      if (v18) {
        os_unfair_lock_lock_with_options();
      }
      ++v15;
      v14 += 2560;
    }
    while (v15 < v2[192]);
  }
  int v19 = 0;
  uint64_t v20 = (atomic_uint *)(*(void *)(a1 + 17904) - 2560);
  atomic_compare_exchange_strong_explicit(v20 + 1, (unsigned int *)&v19, *(_DWORD *)(v12 + 24), memory_order_acquire, memory_order_acquire);
  if (v19) {
    os_unfair_lock_lock_with_options();
  }
  int v21 = 0;
  atomic_compare_exchange_strong_explicit(v20, (unsigned int *)&v21, *(_DWORD *)(v12 + 24), memory_order_acquire, memory_order_acquire);
  if (v21) {
    os_unfair_lock_lock_with_options();
  }
  int v22 = 0;
  uint64_t result = (uint64_t)(v2 + 424);
  atomic_compare_exchange_strong_explicit(v2 + 424, (unsigned int *)&v22, *(_DWORD *)(v12 + 24), memory_order_acquire, memory_order_acquire);
  if (v22)
  {
    return os_unfair_lock_lock_with_options();
  }
  return result;
}

void szone_force_unlock(uint64_t a1)
{
  unsigned int v2 = (int *)(a1 + 17120);
  uint64_t v3 = (os_unfair_lock_s *)(a1 + 18816);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v5 = *(_DWORD *)(StatusReg + 24);
  int v6 = v5;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v3, (unsigned int *)&v6, 0, memory_order_release, memory_order_relaxed);
  if (v6 != v5) {
    os_unfair_lock_unlock(v3);
  }
  if ((v2[192] & 0x80000000) == 0)
  {
    uint64_t v7 = -1;
    uint64_t v8 = -2560;
    do
    {
      int v9 = (os_unfair_lock_s *)(*(void *)(a1 + 17904) + v8);
      int v10 = *(_DWORD *)(StatusReg + 24);
      int v11 = v10;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v11, 0, memory_order_release, memory_order_relaxed);
      if (v11 != v10) {
        os_unfair_lock_unlock(v9);
      }
      unint64_t v12 = (os_unfair_lock_s *)(*(void *)(a1 + 17904) + v8 + 4);
      int v13 = *(_DWORD *)(StatusReg + 24);
      int v14 = v13;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v12, (unsigned int *)&v14, 0, memory_order_release, memory_order_relaxed);
      if (v14 != v13) {
        os_unfair_lock_unlock(v12);
      }
      ++v7;
      v8 += 2560;
    }
    while (v7 < v2[192]);
  }
  if ((*v2 & 0x80000000) == 0)
  {
    uint64_t v15 = -1;
    uint64_t v16 = -2560;
    do
    {
      uint64_t v17 = (os_unfair_lock_s *)(*(void *)(a1 + 17136) + v16);
      int v18 = *(_DWORD *)(StatusReg + 24);
      int v19 = v18;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v17, (unsigned int *)&v19, 0, memory_order_release, memory_order_relaxed);
      if (v19 != v18) {
        os_unfair_lock_unlock(v17);
      }
      uint64_t v20 = (os_unfair_lock_s *)(*(void *)(a1 + 17136) + v16 + 4);
      int v21 = *(_DWORD *)(StatusReg + 24);
      int v22 = v21;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v20, (unsigned int *)&v22, 0, memory_order_release, memory_order_relaxed);
      if (v22 != v21) {
        os_unfair_lock_unlock(v20);
      }
      ++v15;
      v16 += 2560;
    }
    while (v15 < *v2);
  }
}

uint64_t szone_statistics(uint64_t a1, uint64_t a2)
{
  return szone_statistics_task(*MEMORY[0x1E4F14C48], a1, 0, a2);
}

uint64_t szone_locked(uint64_t a1)
{
  int v2 = 0;
  uint64_t v3 = (int *)(a1 + 17120);
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 18816);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v4, (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (!v2)
  {
    int v6 = *(_DWORD *)(StatusReg + 24);
    int v7 = v6;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v4, (unsigned int *)&v7, 0, memory_order_release, memory_order_relaxed);
    if (v7 != v6) {
      os_unfair_lock_unlock(v4);
    }
    if (v3[192] < 0)
    {
LABEL_13:
      if (*v3 < 0) {
        return 0;
      }
      uint64_t v18 = -1;
      for (uint64_t i = -2560; ; i += 2560)
      {
        int v20 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(*(void *)(a1 + 17136) + i), (unsigned int *)&v20, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v20) {
          break;
        }
        int v21 = (os_unfair_lock_s *)(*(void *)(a1 + 17136) + i);
        int v22 = *(_DWORD *)(StatusReg + 24);
        int v23 = v22;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v21, (unsigned int *)&v23, 0, memory_order_release, memory_order_relaxed);
        if (v23 != v22) {
          os_unfair_lock_unlock(v21);
        }
        int v24 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(*(void *)(a1 + 17136) + i + 4), (unsigned int *)&v24, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v24) {
          break;
        }
        int v25 = (os_unfair_lock_s *)(*(void *)(a1 + 17136) + i + 4);
        int v26 = *(_DWORD *)(StatusReg + 24);
        int v27 = v26;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v25, (unsigned int *)&v27, 0, memory_order_release, memory_order_relaxed);
        if (v27 != v26) {
          os_unfair_lock_unlock(v25);
        }
        if (++v18 >= *v3) {
          return 0;
        }
      }
    }
    else
    {
      uint64_t v8 = -1;
      uint64_t v9 = -2560;
      while (1)
      {
        int v10 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(*(void *)(a1 + 17904) + v9), (unsigned int *)&v10, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v10) {
          break;
        }
        int v11 = (os_unfair_lock_s *)(*(void *)(a1 + 17904) + v9);
        int v12 = *(_DWORD *)(StatusReg + 24);
        int v13 = v12;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v13, 0, memory_order_release, memory_order_relaxed);
        if (v13 != v12) {
          os_unfair_lock_unlock(v11);
        }
        int v14 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(*(void *)(a1 + 17904) + v9 + 4), (unsigned int *)&v14, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v14) {
          break;
        }
        uint64_t v15 = (os_unfair_lock_s *)(*(void *)(a1 + 17904) + v9 + 4);
        int v16 = *(_DWORD *)(StatusReg + 24);
        int v17 = v16;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v15, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
        if (v17 != v16) {
          os_unfair_lock_unlock(v15);
        }
        ++v8;
        v9 += 2560;
        if (v8 >= v3[192]) {
          goto LABEL_13;
        }
      }
    }
  }
  return 1;
}

uint64_t szone_reinit_lock(uint64_t result)
{
  int v1 = (int *)(result + 17120);
  *(_DWORD *)(result + 18816) = 0;
  if ((*(_DWORD *)(result + 17888) & 0x80000000) == 0)
  {
    int v2 = (void *)(*(void *)(result + 17904) - 2560);
    uint64_t v3 = -1;
    do
    {
      *int v2 = 0;
      ++v3;
      v2 += 320;
    }
    while (v3 < *(int *)(result + 17888));
  }
  if ((*v1 & 0x80000000) == 0)
  {
    uint64_t v4 = (void *)(*(void *)(result + 17136) - 2560);
    uint64_t v5 = -1;
    do
    {
      *uint64_t v4 = 0;
      ++v5;
      v4 += 320;
    }
    while (v5 < *v1);
  }
  return result;
}

uint64_t szone_statistics_task(uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4), uint64_t a4)
{
  uint64_t v5 = a3;
  if (!a3)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    uint64_t v5 = _malloc_default_reader_0;
  }
  uint64_t v23 = 0;
  uint64_t result = v5(task, a2, 20480, &v23);
  if (!result)
  {
    uint64_t v22 = 0;
    uint64_t result = v5(task, *(void *)(v23 + 17136), 2560 * *(int *)(v23 + 17120), &v22);
    if (!result)
    {
      uint64_t v10 = *(unsigned int *)(v23 + 17120);
      if ((v10 & 0x80000000) != 0)
      {
        uint64_t v13 = 0;
        int v12 = 0;
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = 0;
        int v12 = 0;
        uint64_t v13 = 0;
        uint64_t v14 = v22 - 432;
        uint64_t v15 = v10 + 1;
        do
        {
          v13 += *(void *)(v14 + 8) + *(void *)v14;
          v12 += *(_DWORD *)(v14 + 40);
          v11 += *(void *)(v14 + 24);
          v14 += 2560;
          --v15;
        }
        while (v15);
      }
      uint64_t result = v5(task, *(void *)(v23 + 17904), 2560 * *(int *)(v23 + 17888), &v22);
      if (!result)
      {
        int v16 = (void *)v23;
        uint64_t v17 = *(unsigned int *)(v23 + 17888);
        if ((v17 & 0x80000000) == 0)
        {
          uint64_t v18 = v22 - 432;
          uint64_t v19 = v17 + 1;
          do
          {
            v13 += *(void *)(v18 + 8) + *(void *)v18;
            v12 += *(_DWORD *)(v18 + 40);
            v11 += *(void *)(v18 + 24);
            v18 += 2560;
            --v19;
          }
          while (v19);
        }
        uint64_t result = 0;
        uint64_t v20 = *(void *)(v23 + 18840);
        *(_DWORD *)a4 = *(_DWORD *)(v23 + 18820) + v12;
        *(void *)(a4 + 8) = v20 + v11;
        uint64_t v21 = v20 + ((v16[2065] - v16[2066]) << 20) + ((v16[2161] - v16[2162]) << 23);
        *(void *)(a4 + 16) = v21 - v13;
        *(void *)(a4 + 24) = v21;
      }
    }
  }
  return result;
}

mach_vm_address_t create_scalable_szone(uint64_t a1, int a2)
{
  mach_vm_address_t pages = mvm_allocate_pages((*MEMORY[0x1E4F14C80] + 20479) & -*MEMORY[0x1E4F14C80], 0, 0x40000000, 1);
  mach_vm_address_t v4 = pages;
  if (pages)
  {
    uint64_t v5 = (unsigned int *)(pages + 16392);
    unsigned int v6 = a2 & 0xBFFFFFFF | ((_dyld_get_image_slide() == 0) << 30);
    unint64_t v7 = MEMORY[0xFFFFFC038];
    unsigned int v8 = max_magazines;
    if (max_magazines >= 0x40) {
      unsigned int v8 = 64;
    }
    if (v8 <= 1) {
      int v9 = 1;
    }
    else {
      int v9 = v8;
    }
    rack_init(v4 + 16512, 1, v9, v6);
    rack_init(v4 + 17280, 2, v9, v6);
    if (large_cache_enabled)
    {
      *(void *)(v4 + 20424) = v7 >> 10;
      if (v7 >= magazine_large_expanded_cache_threshold) {
        int v10 = 64;
      }
      else {
        int v10 = 16;
      }
      uint64_t v11 = 0x20000000;
      if (v7 < magazine_large_expanded_cache_threshold) {
        uint64_t v11 = 0x8000000;
      }
      *(_DWORD *)(v4 + 20392) = v10;
      *(void *)(v4 + 20400) = v11;
      int32_t v12 = NSVersionOfLinkTimeLibrary("System");
      BOOL v14 = v12 != -1 && v12 < 7340032;
      *(_DWORD *)(v4 + 20408) = v14;
    }
    *(void *)(v4 + 20448) = malloc_entropy;
    *(_DWORD *)(v4 + 104) = 16;
    *(void *)(v4 + 16) = szone_size;
    *(void *)(v4 + 24) = szone_malloc;
    *(void *)(v4 + 32) = szone_calloc;
    *(void *)(v4 + 40) = szone_valloc;
    *(void *)(v4 + 48) = szone_free;
    *(void *)(v4 + 56) = szone_realloc;
    *(void *)(v4 + 64) = szone_destroy;
    *(void *)(v4 + 80) = szone_batch_malloc;
    *(void *)(v4 + 88) = szone_batch_free;
    *(void *)(v4 + 96) = &szone_introspect;
    *(void *)(v4 + 112) = szone_memalign;
    *(void *)(v4 + 120) = szone_free_definite_size;
    *(void *)(v4 + 128) = szone_pressure_relief;
    *(void *)(v4 + 136) = szone_claimed_address;
    *(void *)(v4 + 144) = szone_try_free_default;
    *(void *)(v4 + 160) = szone_malloc_type_malloc;
    *(void *)(v4 + 168) = szone_malloc_type_calloc;
    *(void *)(v4 + 176) = szone_malloc_type_realloc;
    *(void *)(v4 + 184) = szone_malloc_type_memalign;
    *(void *)mach_vm_address_t v4 = 0;
    *(void *)(v4 + 8) = 0;
    mprotect((void *)v4, 0xC8uLL, 1);
    *uint64_t v5 = v6;
    *(_DWORD *)(v4 + 18816) = 0;
    *(void *)(v4 + 0x4000) = -1;
  }
  return v4;
}

uint64_t szone_destroy(uint64_t a1)
{
  int v2 = (unsigned int *)(a1 + 16392);
  if (large_cache_enabled) {
    large_destroy_cache(a1);
  }
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v3 = v2[608];
  if (v3)
  {
    uint64_t v4 = 24 * v3;
    do
    {
      uint64_t v5 = *(void *)(a1 + 18832) + v4;
      uint64_t v6 = *(void *)(v5 - 24);
      if (v6) {
        mvm_deallocate_pages(v6, *(void *)(v5 - 16), *v2);
      }
      v4 -= 24;
    }
    while (v4);
    unsigned int v7 = v2[608];
  }
  else
  {
    unsigned int v7 = 0;
  }
  large_entries_free_no_lock(a1, *(void *)(a1 + 18832), v7, &v9);
  if (v10) {
    mvm_deallocate_pages(v9, v10, *v2);
  }
  rack_destroy_regions(a1 + 16512);
  rack_destroy_regions(a1 + 17280);
  rack_destroy(a1 + 16512);
  rack_destroy(a1 + 17280);
  return mvm_deallocate_pages(a1, (*MEMORY[0x1E4F14C80] + 20479) & -*MEMORY[0x1E4F14C80], 0);
}

void szone_try_free_default(uint64_t a1, unint64_t a2)
{
}

unint64_t szone_malloc_type_malloc(uint64_t a1, unint64_t a2)
{
  return szone_malloc_should_clear(a1, a2, 0);
}

uint64_t szone_check_all(uint64_t a1)
{
  uint64_t v1 = a1;
  int v2 = &read_memory[960];
  if (tiny_check(a1 + 16512))
  {
    uint64_t v3 = v1 + 17280;
    uint64_t v4 = *(unint64_t **)(v1 + 17304);
    if (*v4)
    {
      unint64_t v5 = 0;
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      uint64_t v25 = v1;
      do
      {
        uint64_t v7 = *(void *)(v4[2] + 8 * v5);
        if ((unint64_t)(v7 + 1) >= 2)
        {
          unsigned int v8 = v2;
          int v9 = 0;
          uint64_t v10 = *(void *)(v1 + 17904);
          int v11 = *(_DWORD *)(v7 + 24);
          int32_t v12 = (os_unfair_lock_s *)(v10 + 2560 * v11);
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v12, (unsigned int *)&v9, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
          if (v9) {
            os_unfair_lock_lock_with_options();
          }
          int v13 = *(_DWORD *)(v7 + 24);
          if (v13 == v11)
          {
            int v2 = v8;
          }
          else
          {
            int v2 = v8;
            do
            {
              int v14 = *(_DWORD *)(StatusReg + 24);
              int v15 = v14;
              atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v12, (unsigned int *)&v15, 0, memory_order_release, memory_order_relaxed);
              if (v15 != v14) {
                os_unfair_lock_unlock(v12);
              }
              int v16 = 0;
              int32_t v12 = (os_unfair_lock_s *)(v10 + 2560 * v13);
              atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v12, (unsigned int *)&v16, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
              if (v16) {
                os_unfair_lock_lock_with_options();
              }
              BOOL v17 = v13 == *(_DWORD *)(v7 + 24);
              int v13 = *(_DWORD *)(v7 + 24);
            }
            while (!v17);
          }
          small_check_region(v3, v7);
          int v18 = *(_DWORD *)(StatusReg + 24);
          int v19 = v18;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v12, (unsigned int *)&v19, 0, memory_order_release, memory_order_relaxed);
          BOOL v20 = v19 == v18;
          if (!v21)
          {
            uint64_t v1 = v25;
            if (!v20) {
              os_unfair_lock_unlock(v12);
            }
            goto LABEL_27;
          }
          uint64_t v1 = v25;
          if (!v20) {
            os_unfair_lock_unlock(v12);
          }
        }
        ++v5;
        uint64_t v4 = *(unint64_t **)(v1 + 17304);
      }
      while (v5 < *v4);
    }
    uint64_t v22 = 0;
    while (1)
    {
      small_free_list_check(v3, v22);
      if (!v23) {
        break;
      }
      if (++v22 == 31) {
        return 1;
      }
    }
  }
LABEL_27:
  uint64_t result = 0;
  *(_DWORD *)(v1 + 16392) &= ~0x80000000;
  return result;
}

uint64_t szone_print(uint64_t a1, uint64_t a2, const void *a3, unsigned int (*a4)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a5)(const char *, ...))
{
  uint64_t v28 = *MEMORY[0x1E4F14BF8];
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  if (a4(a1, (uint64_t)a3, 20480, &v25))
  {
    uint64_t v10 = "Failed to read szone structure\n";
    return ((uint64_t (*)(const char *))a5)(v10);
  }
  if (!scalable_zone_info_task(a1, a4, v25, v27, 0xDu))
  {
    uint64_t v10 = "Failed to get scalable zone info\n";
    return ((uint64_t (*)(const char *))a5)(v10);
  }
  a5("Scalable zone %p: inUse=%u(%u) touched=%u allocated=%u flags=0x%x\n", a3, v27[0], v27[1], v27[2], v27[3], v27[12]);
  a5("\ttiny=%u(%u) small=%u(%u) large=%u(%u)\n", v27[4], v27[5], v27[6], v27[7], v27[8], v27[9]);
  if (!mach_task_is_self(a1))
  {
    uint64_t v10 = "(unable to safely further examine remote process)\n";
    return ((uint64_t (*)(void))a5)(v10);
  }
  a5("%lu tiny regions:\n", *(void *)(v25 + 16520));
  uint64_t v12 = v25;
  if (*(void *)(v25 + 16528))
  {
    a5("[%lu tiny regions have been vm_deallocate'd]\n", *(void *)(v25 + 16528));
    uint64_t v12 = v25;
  }
  uint64_t v23 = 0;
  int v24 = 0;
  uint64_t v22 = 0;
  if (a4(a1, *(void *)(v12 + 16536), 32, (uint64_t *)&v24))
  {
    uint64_t v10 = "Failed to map tiny rack region_generation\n";
    return ((uint64_t (*)(void))a5)(v10);
  }
  if (a4(a1, v24[2], 8, &v23))
  {
    uint64_t v10 = "Failed to map tiny rack hashed_regions\n";
    return ((uint64_t (*)(void))a5)(v10);
  }
  if (a4(a1, *(void *)(v25 + 17136), 2560 * *(int *)(v25 + 17120), &v22))
  {
    uint64_t v10 = "Failed to map tiny rack magazines\n";
    return ((uint64_t (*)(void))a5)(v10);
  }
  unint64_t v13 = *v24;
  if (*v24)
  {
    int v14 = 0;
    for (unint64_t i = 0; i < v13; ++i)
    {
      if ((unint64_t)(*(void *)(v23 + 8 * i) + 1) >= 2)
      {
        if (a4(a1, *(void *)(v23 + 8 * i), 0x100000, &v26))
        {
LABEL_46:
          uint64_t v10 = "Failed to map region %p\n";
          return ((uint64_t (*)(void))a5)(v10);
        }
        if (*(_DWORD *)(v26 + 24) == -1) {
          ++v14;
        }
        print_tiny_region();
        unint64_t v13 = *v24;
      }
    }
  }
  if (*(void *)(v22 - 408)) {
    int v16 = "Tiny recirc depot: total bytes: %llu, in-use bytes: %llu, allocations: %llu, regions: %d (min # retained regions: %d)\n";
  }
  else {
    int v16 = "Tiny recirc depot is empty\n";
  }
  a5(v16);
  if (a2) {
    print_tiny_free_list(a1, a4, a5, (uint64_t)a3 + 16512);
  }
  a5("%lu small regions:\n", *(void *)(v25 + 17288));
  uint64_t v17 = v25;
  if (*(void *)(v25 + 17296))
  {
    a5("[%lu small regions have been vm_deallocate'd]\n", *(void *)(v25 + 17296));
    uint64_t v17 = v25;
  }
  if (a4(a1, *(void *)(v17 + 17304), 32, (uint64_t *)&v24))
  {
    uint64_t v10 = "Failed to map small rack region_generation\n";
    return ((uint64_t (*)(void))a5)(v10);
  }
  if (a4(a1, v24[2], 8, &v23))
  {
    uint64_t v10 = "Failed to map small rack hashed_regions\n";
    return ((uint64_t (*)(void))a5)(v10);
  }
  if (a4(a1, *(void *)(v25 + 17904), 2560 * *(int *)(v25 + 17888), &v22))
  {
    uint64_t v10 = "Failed to map small rack magazines\n";
    return ((uint64_t (*)(void))a5)(v10);
  }
  unint64_t v18 = *v24;
  if (*v24)
  {
    int v19 = 0;
    unint64_t v20 = 0;
    do
    {
      if ((unint64_t)(*(void *)(v23 + 8 * v20) + 1) >= 2)
      {
        if (a4(a1, *(void *)(v23 + 8 * v20), 0x800000, &v26)) {
          goto LABEL_46;
        }
        if (*(_DWORD *)(v26 + 24) == -1) {
          ++v19;
        }
        print_small_region();
        unint64_t v18 = *v24;
      }
      ++v20;
    }
    while (v20 < v18);
  }
  if (*(void *)(v22 - 408)) {
    int v21 = "Small recirc depot: total bytes: %llu, in-use bytes: %llu, allocations: %llu, regions: %d (min # retained regions: %d)\n";
  }
  else {
    int v21 = "Small recirc depot is empty\n";
  }
  a5(v21);
  if (a2) {
    print_small_free_list(a1, a4, a5, (uint64_t)a3 + 17280);
  }
  return large_debug_print(a1, a2, (uint64_t)a3, a4, a5);
}

unint64_t small_finalize_region(unint64_t result, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 2128);
  if (v3)
  {
    uint64_t v4 = result;
    unint64_t v5 = *(void *)(a2 + 2144) - v3;
    unint64_t v6 = v5 + 0x800000;
    unint64_t v7 = v3 >> 9;
    unsigned int v8 = ((v5 + 8355328) >> 9) & 0x3FFF;
    uint64_t v9 = *(_WORD *)(((v5 + 0x7FFFFF) & 0xFFFFFFFFFF800000 | (2
                                                             * (((v5
                                                                + 0x7FFFFF
                                                                - ((v5 + 0x7FFFFF) & 0xFF800000 | 0x8200)) >> 9) & 0x3FFFLL)))
                  + 0x28) & 0x7FFF;
    if (v8) {
      BOOL v10 = v8 >= v9;
    }
    else {
      BOOL v10 = 0;
    }
    if (v10)
    {
      unint64_t v11 = v6 - (v9 << 9);
      if (*(__int16 *)((v11 & 0xFFFFFFFFFF800000 | (2
                                                     * (((v11 - (v11 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                      + 0x28) < 0)
      {
        small_free_list_find_by_ptr(result, v6 - (v9 << 9), v9);
        small_free_list_remove_ptr(v4, a2, v12, v9);
        LOWORD(v7) = v9 + v7;
        unint64_t v6 = v11;
      }
    }
    uint64_t result = small_free_list_add_ptr(v4, a2, v6, (unsigned __int16)v7);
    *(void *)(a2 + 2128) = 0;
  }
  *(void *)(a2 + 2144) = 0;
  return result;
}

void small_free_list_find_by_ptr(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v3 = a2 & 0xFFFFFFFFFF800000;
  if ((a3 | 0x8000) == *(unsigned __int16 *)((a2 & 0xFFFFFFFFFF800000 | (2
                                                                          * (((unint64_t)(a2
                                                                                               - (a2 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                                            + 0x28))
  {
    if (((*MEMORY[0x1E4F14C80] - 1) & a2) == 0 && (unint64_t)a3 << 9 >= *MEMORY[0x1E4F14C68])
    {
      for (uint64_t i = 0; i != 594; i += 18)
      {
        __int16 v6 = *(_WORD *)(v3 + 32694 + i);
        if (v6)
        {
          int v7 = v6;
          unint64_t v8 = ((v3 + 32678 + i) & 0xFFFFFFFFFF800000) + ((unint64_t)(v6 & 0x7FFF) << 9);
          if (v7 >= 0) {
            unint64_t v8 = 0;
          }
          if (v8 == a2) {
            break;
          }
        }
      }
    }
  }
  else
  {
    malloc_zone_error(*(_DWORD *)(a1 + 620), 1, (uint64_t)"small_free_list_find_by_ptr: ptr is not free (ptr metadata !SMALL_IS_FREE), ptr=%p msize=%d metadata=0x%x\n");
    __break(1u);
  }
}

unint64_t small_free_list_add_ptr(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  if (a4 >= 0x20) {
    unsigned int v4 = 30;
  }
  else {
    unsigned int v4 = a4 - 1;
  }
  if (!a4) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  uint64_t v5 = a2 + 8 * v4;
  unint64_t v8 = *(void *)(v5 + 32);
  __int16 v6 = (unint64_t *)(v5 + 32);
  unint64_t v7 = v8;
  if (((*MEMORY[0x1E4F14C80] - 1) & a3) == 0 && (unint64_t)a4 << 9 >= *MEMORY[0x1E4F14C68])
  {
    uint64_t v10 = 0;
    while (*(_WORD *)((a3 & 0xFFFFFFFFFF800000 | 0x7FB6) + v10))
    {
      v10 += 18;
      if (v10 == 594) {
        goto LABEL_15;
      }
    }
    uint64_t v11 = (a3 & 0xFFFFFFFFFF800000) + v10;
    *(_WORD *)(v11 + 32694) = (a3 >> 9) & 0x3FFF | 0x8000;
    a3 = v11 + 32678;
  }
LABEL_15:
  unint64_t v12 = a3 & 0xFFFFFFFFFF800000;
  if (a3 < (a3 & 0xFFFFFFFFFF800000 | 0x7FA6) || a3 >= (v12 | 0x81F8))
  {
    uint64_t v16 = *(void *)(a1 + 632) ^ a1;
    *(unsigned char *)(a3 + 8) = BYTE4(v16)
                       + v16
                       + ((HIDWORD(v16) + v16) >> 16)
                       + ((unsigned __int16)(WORD2(v16) + v16 + ((HIDWORD(v16) + v16) >> 16)) >> 8);
    *(void *)a3 = 0;
    LODWORD(v16) = ((v16 ^ v7) >> 32) + (v16 ^ v7) + ((((v16 ^ v7) >> 32) + (v16 ^ v7)) >> 16);
    *(unsigned char *)(a3 + 24) = v16 + BYTE1(v16);
    *(void *)(a3 + 16) = v7;
    unint64_t v15 = a3;
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = v7;
    if (a3)
    {
      __int16 v13 = *(_WORD *)(a3 + 16);
      unint64_t v14 = v12 + ((unint64_t)(v13 & 0x7FFF) << 9);
      if (v13 < 0) {
        unint64_t v15 = v14;
      }
      else {
        unint64_t v15 = 0;
      }
    }
    else
    {
      unint64_t v15 = 0;
    }
  }
  unint64_t v17 = ((v15 - (v15 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF;
  unint64_t v18 = ((unint64_t)(v15 + (a4 << 9) - 33281) >> 9) & 0x3FFF;
  if (v17 > v18) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  unint64_t v19 = (v15 & 0xFFFFFFFFFF800000) + 40;
  *(_WORD *)(v19 + 2 * v17) = a4 | 0x8000;
  *(_WORD *)(v19 + 2 * v18) = a4 | 0x8000;
  if (!v7) {
    goto LABEL_32;
  }
  unint64_t v20 = v7 & 0xFFFFFFFFFF800000;
  if (v7 < (v7 & 0xFFFFFFFFFF800000 | 0x7FA6) || v7 >= (v20 | 0x81F8))
  {
    unint64_t v21 = *(void *)(a1 + 632) ^ a1 ^ a3;
    *(unsigned char *)(v7 + 8) = BYTE4(v21)
                       + v21
                       + ((HIDWORD(v21) + v21) >> 16)
                       + ((unsigned __int16)(WORD2(v21) + v21 + ((HIDWORD(v21) + v21) >> 16)) >> 8);
  }
  else if ((*(_WORD *)(v7 + 16) & 0x8000) == 0 {
         || (unint64_t)(*(_WORD *)(v7 + 16) & 0x7FFF) << 9 == -(uint64_t)v20)
  }
  {
LABEL_32:
    *(_DWORD *)(a2 + 4 * (v4 >> 5) + 2088) |= 1 << v4;
    goto LABEL_33;
  }
  *(void *)unint64_t v7 = a3;
LABEL_33:
  *__int16 v6 = a3;
  return a3;
}

uint64_t small_free_detach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 + 33280;
  unint64_t v4 = a3 + 0x800000;
  if (a3 + 33280 >= (unint64_t)(a3 + 0x800000)) {
    return 0;
  }
  uint64_t v7 = 0;
  unint64_t v8 = v3 & 0xFFFFFFFFFF800000 | 0x28;
  do
  {
    int v9 = *(__int16 *)(v8 + 2 * (((unint64_t)(v3 - 33280) >> 9) & 0x3FFF));
    uint64_t v10 = v9 & 0x7FFF;
    if ((v9 & 0x7FFF) == 0) {
      break;
    }
    if (v9 < 0)
    {
      small_free_list_find_by_ptr(a1, v3, v9 & 0x7FFF);
      small_free_list_remove_ptr_no_clear(a1, a2, v11, v10);
    }
    else
    {
      uint64_t v7 = (v7 + 1);
    }
    v3 += v10 << 9;
  }
  while (v3 < v4);
  return v7;
}

void small_free_list_remove_ptr_no_clear(uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4)
{
  if (a4 >= 0x20) {
    unsigned int v4 = 30;
  }
  else {
    unsigned int v4 = a4 - 1;
  }
  if (!a3) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  unint64_t v5 = a3 & 0xFFFFFFFFFF800000;
  BOOL v7 = (a3 & 0xFFFFFFFFFF800000 | 0x7FA6) > a3 || (a3 & 0xFFFFFFFFFF800000 | 0x81F8) <= a3;
  if (v7)
  {
    unint64_t v8 = *(void *)a3;
    uint64_t v9 = *(void *)(a1 + 632) ^ a1;
    uint64_t v10 = v9 ^ *(void *)a3;
    if (*(unsigned __int8 *)(a3 + 8) != (BYTE4(v10)
                                                         + v10
                                                         + ((HIDWORD(v10) + v10) >> 16)
                                                         + ((unsigned __int16)(WORD2(v10)
                                                                             + v10
                                                                             + ((HIDWORD(v10) + v10) >> 16)) >> 8)))
      goto LABEL_92;
    unint64_t v11 = *(void *)(a3 + 16);
    unint64_t v12 = v9 ^ v11;
    if (*(unsigned __int8 *)(a3 + 24) != (BYTE4(v12)
                                                          + v12
                                                          + ((HIDWORD(v12) + v12) >> 16)
                                                          + ((unsigned __int16)(WORD2(v12)
                                                                              + v12
                                                                              + ((HIDWORD(v12) + v12) >> 16)) >> 8)))
      goto LABEL_92;
    if (!v8)
    {
LABEL_36:
      *(void *)(a2 + 8 * v4 + 32) = v11;
      if (v11)
      {
        unint64_t v21 = v11 & 0xFFFFFFFFFF800000;
        if (v11 < (v11 & 0xFFFFFFFFFF800000 | 0x7FA6)) {
          goto LABEL_56;
        }
        unint64_t v22 = v11;
        if (v11 >= (v21 | 0x81F8))
        {
LABEL_41:
          if (v22)
          {
LABEL_56:
            BOOL v27 = v11 < v21 + 32678 || v11 >= v21 + 33272;
            char v28 = v27;
            if (!v27)
            {
              if ((*(_WORD *)(v11 + 16) & 0x8000) == 0
                || (unint64_t)(*(_WORD *)(v11 + 16) & 0x7FFF) << 9 == -(uint64_t)v21)
              {
                goto LABEL_84;
              }
              unint64_t v29 = *(void *)v11;
              if (!*(void *)v11) {
                goto LABEL_74;
              }
              goto LABEL_66;
            }
            unint64_t v29 = *(void *)v11;
            uint64_t v30 = *(void *)(a1 + 632) ^ a1 ^ *(void *)v11;
            if (*(unsigned __int8 *)(v11 + 8) == (BYTE4(v30)
                                                                  + v30
                                                                  + ((HIDWORD(v30) + v30) >> 16)
                                                                  + ((unsigned __int16)(WORD2(v30)
                                                                                      + v30
                                                                                      + ((HIDWORD(v30) + v30) >> 16)) >> 8)))
            {
              if (!v29)
              {
LABEL_74:
                unint64_t v32 = 0;
LABEL_76:
                unint64_t v35 = a3;
                if (!v7)
                {
                  __int16 v36 = *(_WORD *)(a3 + 16);
                  unint64_t v37 = v5 + ((unint64_t)(v36 & 0x7FFF) << 9);
                  if (v36 < 0) {
                    unint64_t v35 = v37;
                  }
                  else {
                    unint64_t v35 = 0;
                  }
                }
                if (v32 != v35) {
                  small_free_list_remove_ptr_no_clear_cold_2(a1, a3, v29);
                }
                if (v28)
                {
                  unint64_t v38 = *(void *)(a1 + 632) ^ a1 ^ v8;
                  *(unsigned char *)(v11 + 8) = BYTE4(v38)
                                      + v38
                                      + ((HIDWORD(v38) + v38) >> 16)
                                      + ((unsigned __int16)(WORD2(v38) + v38 + ((HIDWORD(v38) + v38) >> 16)) >> 8);
                }
                *(void *)unint64_t v11 = v8;
                goto LABEL_84;
              }
LABEL_66:
              unint64_t v31 = v29 & 0xFFFFFFFFFF800000;
              if (v29 < (v29 & 0xFFFFFFFFFF800000 | 0x7FA6))
              {
                unint64_t v32 = v29;
              }
              else
              {
                unint64_t v32 = v29;
                if (v29 < (v31 | 0x81F8))
                {
                  __int16 v33 = *(_WORD *)(v29 + 16);
                  int v34 = v33;
                  unint64_t v32 = v31 + ((unint64_t)(v33 & 0x7FFF) << 9);
                  if (v34 >= 0) {
                    unint64_t v32 = 0;
                  }
                }
              }
              goto LABEL_76;
            }
LABEL_92:
            free_list_checksum_botch(a1);
            __break(1u);
            return;
          }
          goto LABEL_44;
        }
        if ((*(_WORD *)(v11 + 16) & 0x8000) != 0)
        {
          unint64_t v22 = v21 + ((unint64_t)(*(_WORD *)(v11 + 16) & 0x7FFF) << 9);
          goto LABEL_41;
        }
      }
LABEL_44:
      *(_DWORD *)(a2 + 4 * (v4 >> 5) + 2088) &= ~(1 << v4);
      if (!v11) {
        goto LABEL_84;
      }
      goto LABEL_55;
    }
  }
  else
  {
    unint64_t v8 = *(void *)a3;
    unint64_t v11 = *(void *)(a3 + 8);
    if (!*(void *)a3) {
      goto LABEL_36;
    }
  }
  BOOL v13 = v8 < (v8 & 0xFFFFFFFFFF800000 | 0x7FA6) || v8 >= (v8 & 0xFFFFFFFFFF800000 | 0x81F8);
  char v14 = v13;
  if (v13)
  {
    unint64_t v15 = *(void *)(v8 + 16);
    unint64_t v16 = *(void *)(a1 + 632) ^ a1 ^ v15;
    if (*(unsigned __int8 *)(v8 + 24) != (BYTE4(v16)
                                                          + v16
                                                          + ((HIDWORD(v16) + v16) >> 16)
                                                          + ((unsigned __int16)(WORD2(v16)
                                                                              + v16
                                                                              + ((HIDWORD(v16) + v16) >> 16)) >> 8)))
      goto LABEL_92;
    if (!v15)
    {
LABEL_35:
      unint64_t v18 = 0;
      goto LABEL_47;
    }
  }
  else
  {
    if ((*(_WORD *)(v8 + 16) & 0x8000) == 0
      || (unint64_t)(*(_WORD *)(v8 + 16) & 0x7FFF) << 9 == -(uint64_t)(v8 & 0xFFFFFFFFFF800000))
    {
      goto LABEL_36;
    }
    unint64_t v15 = *(void *)(v8 + 8);
    if (!v15) {
      goto LABEL_35;
    }
  }
  unint64_t v17 = v15 & 0xFFFFFFFFFF800000;
  if (v15 < (v15 & 0xFFFFFFFFFF800000 | 0x7FA6))
  {
    unint64_t v18 = v15;
  }
  else
  {
    unint64_t v18 = v15;
    if (v15 < (v17 | 0x81F8))
    {
      __int16 v19 = *(_WORD *)(v15 + 16);
      int v20 = v19;
      unint64_t v18 = v17 + ((unint64_t)(v19 & 0x7FFF) << 9);
      if (v20 >= 0) {
        unint64_t v18 = 0;
      }
    }
  }
LABEL_47:
  unint64_t v23 = a3;
  if (!v7)
  {
    __int16 v24 = *(_WORD *)(a3 + 16);
    int v25 = v24;
    unint64_t v23 = v5 + ((unint64_t)(v24 & 0x7FFF) << 9);
    if (v25 >= 0) {
      unint64_t v23 = 0;
    }
  }
  if (v18 != v23) {
    small_free_list_remove_ptr_no_clear_cold_3(a1, a3, v15);
  }
  if ((v14 & 1) == 0)
  {
    *(void *)(v8 + 8) = v11;
    if (!v11) {
      goto LABEL_84;
    }
    goto LABEL_55;
  }
  unint64_t v26 = *(void *)(a1 + 632) ^ a1 ^ v11;
  *(unsigned char *)(v8 + 24) = BYTE4(v26)
                      + v26
                      + ((HIDWORD(v26) + v26) >> 16)
                      + ((unsigned __int16)(WORD2(v26) + v26 + ((HIDWORD(v26) + v26) >> 16)) >> 8);
  *(void *)(v8 + 16) = v11;
  if (v11)
  {
LABEL_55:
    unint64_t v21 = v11 & 0xFFFFFFFFFF800000;
    goto LABEL_56;
  }
LABEL_84:
  if (!v7)
  {
    *(void *)a3 = -1;
    *(void *)(a3 + 8) = -1;
    *(_WORD *)(a3 + 16) = 0;
  }
}

uint64_t small_free_reattach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 + 33280;
  unint64_t v4 = a3 + 0x800000;
  if (a3 + 33280 >= (unint64_t)(a3 + 0x800000)) {
    return 0;
  }
  uint64_t v7 = 0;
  unint64_t v8 = v3 & 0xFFFFFFFFFF800000 | 0x28;
  do
  {
    int v9 = *(__int16 *)(v8 + 2 * (((unint64_t)(v3 - 33280) >> 9) & 0x3FFF));
    uint64_t v10 = v9 & 0x7FFF;
    if ((v9 & 0x7FFF) == 0) {
      break;
    }
    if (v9 < 0)
    {
      small_free_list_add_ptr(a1, a2, v3, v9 & 0x7FFF);
      unint64_t v11 = (unint64_t)v10 << 9;
    }
    else
    {
      unint64_t v11 = (unint64_t)(v9 & 0x7FFF) << 9;
      v7 += v10 << 9;
    }
    v3 += v11;
  }
  while (v3 < v4);
  return v7;
}

unint64_t small_free_scan_madvise_free(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3)
{
  v38[1] = *MEMORY[0x1E4F14BF8];
  __int16 v6 = (_DWORD *)MEMORY[0x1E4F14C60];
  unint64_t result = MEMORY[0x1F41887A8]();
  unint64_t v12 = (char *)v38 - v11;
  if (v8 < v10)
  {
    LODWORD(v13) = 0;
    uint64_t v14 = *MEMORY[0x1E4F14C58];
    uint64_t v15 = ~*MEMORY[0x1E4F14C58];
    unint64_t v16 = v8;
    while (1)
    {
      int v17 = *(unsigned __int16 *)((v8 & 0xFFFFFFFFFF800000 | 0x28)
                                + 2 * (((unint64_t)(v16 - 33280) >> 9) & 0x3FFF));
      if (v17 == 0x8000 && v16 == v8) {
        break;
      }
      uint64_t v19 = v17 & 0x7FFF;
      if ((v17 & 0x7FFF) != 0)
      {
        if ((v17 & 0x8000) != 0)
        {
          unint64_t v21 = (v16 + v14 + 10) & v15;
          uint64_t v22 = v19;
          unint64_t v20 = (unint64_t)v19 << 9;
          unint64_t v23 = (v16 + (v22 << 9) - 2) & v15;
          BOOL v24 = v23 > v21;
          unint64_t result = v23 - v21;
          if (v24)
          {
            int v25 = &v12[4 * (int)v13];
            *(_WORD *)int v25 = (v21 - a3) >> v9;
            *((_WORD *)v25 + 1) = result >> v9;
            LODWORD(v13) = v13 + 1;
          }
        }
        else
        {
          unint64_t v20 = v19 << 9;
        }
        v16 += v20;
        if (v16 < v10) {
          continue;
        }
      }
      goto LABEL_18;
    }
    unint64_t v26 = (v8 + v14 + 10) & v15;
    unint64_t v27 = (v8 + 8388606) & v15;
    BOOL v24 = v27 > v26;
    unint64_t v28 = v27 - v26;
    if (v24)
    {
      unint64_t v29 = (v26 - v8) >> v9;
      uint64_t v30 = &v12[4 * (int)v13];
      *(_WORD *)uint64_t v30 = v29;
      *((_WORD *)v30 + 1) = v28 >> v9;
      LODWORD(v13) = v13 + 1;
    }
LABEL_18:
    if ((int)v13 >= 1)
    {
      atomic_fetch_add((atomic_uint *volatile)(a3 + 28), 1u);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      int v32 = *(_DWORD *)(StatusReg + 24);
      int v33 = v32;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v33, 0, memory_order_release, memory_order_relaxed);
      if (v33 != v32) {
        os_unfair_lock_unlock(a2);
      }
      uint64_t v13 = v13;
      int v34 = (unsigned __int16 *)(v12 + 2);
      do
      {
        uint64_t v35 = a3 + (*(v34 - 1) << *v6);
        int v36 = *v34;
        v34 += 2;
        unint64_t result = mvm_madvise_free(a1, a3, v35, v35 + (v36 << *v6), 0, *(_DWORD *)(a1 + 620) & 0x20);
        --v13;
      }
      while (v13);
      int v37 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v37, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v37) {
        unint64_t result = os_unfair_lock_lock_with_options();
      }
      atomic_fetch_add((atomic_uint *volatile)(a3 + 28), 0xFFFFFFFF);
    }
  }
  return result;
}

unint64_t small_memalign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = a4 + 511;
  unint64_t v8 = a1 + 17280;
  mach_vm_address_t should_clear = small_malloc_should_clear(a1 + 17280, (unsigned __int16)((a4 + 511) >> 9), 0);
  unint64_t v10 = should_clear;
  if (should_clear)
  {
    unint64_t v43 = v8;
    if (((a2 - 1) & should_clear) != 0) {
      mach_vm_address_t v11 = a2 - ((a2 - 1) & should_clear);
    }
    else {
      mach_vm_address_t v11 = 0;
    }
    int v12 = a3 + 511;
    unint64_t v13 = (v11 + 511) >> 9;
    unint64_t v44 = (unint64_t)(a3 + 511) >> 9;
    unsigned __int16 v14 = (v7 >> 9) - v44 - v13;
    unsigned __int16 v45 = v14;
    if ((_WORD)v13)
    {
      int v15 = 0;
      unint64_t v42 = v11 + should_clear;
      uint64_t v16 = *(void *)(a1 + 17904);
      int v17 = *(_DWORD *)((should_clear & 0xFFFFFFFFFF800000) + 0x18);
      unint64_t v18 = (os_unfair_lock_s *)(v16 + 2560 * v17);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v18, (unsigned int *)&v15, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v15) {
        os_unfair_lock_lock_with_options();
      }
      int v20 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
      if (v20 != v17)
      {
        do
        {
          int v21 = *(_DWORD *)(StatusReg + 24);
          int v22 = v21;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v18, (unsigned int *)&v22, 0, memory_order_release, memory_order_relaxed);
          if (v22 != v21) {
            os_unfair_lock_unlock(v18);
          }
          int v23 = 0;
          unint64_t v18 = (os_unfair_lock_s *)(v16 + 2560 * v20);
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v18, (unsigned int *)&v23, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
          if (v23) {
            os_unfair_lock_lock_with_options();
          }
          BOOL v24 = v20 == *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
          int v20 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
        }
        while (!v24);
      }
      *(_WORD *)((v10 & 0xFFFFFFFFFF800000)
               + 2 * (((v10 - (v10 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
               + 0x28) = v13;
      unsigned __int16 v14 = v45;
      *(_WORD *)((v42 & 0xFFFFFFFFFF800000 | (2 * (((v42 - (v42 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
               + 0x28) = v45 + v44;
      ++v18[542]._os_unfair_lock_opaque;
      int v25 = *(_DWORD *)(StatusReg + 24);
      int v26 = v25;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v18, (unsigned int *)&v26, 0, memory_order_release, memory_order_relaxed);
      if (v26 != v25) {
        os_unfair_lock_unlock(v18);
      }
      unint64_t v27 = v43;
      free_small(v43, v10, v10 & 0xFFFFFFFFFF800000, (unsigned __int16)v13 << 9);
      unint64_t v10 = v42;
      int v12 = a3 + 511;
    }
    else
    {
      unint64_t v27 = v43;
    }
    int v28 = v14;
    if (v14)
    {
      int v29 = 0;
      unint64_t v30 = (v12 & 0x1FFFE00) + v10;
      uint64_t v31 = *(void *)(a1 + 17904);
      int v32 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
      int v33 = (os_unfair_lock_s *)(v31 + 2560 * v32);
      unint64_t v34 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v33, (unsigned int *)&v29, *(_DWORD *)(v34 + 24), memory_order_acquire, memory_order_acquire);
      if (v29) {
        os_unfair_lock_lock_with_options();
      }
      int v35 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
      if (v35 != v32)
      {
        do
        {
          int v36 = *(_DWORD *)(v34 + 24);
          int v37 = v36;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v33, (unsigned int *)&v37, 0, memory_order_release, memory_order_relaxed);
          if (v37 != v36) {
            os_unfair_lock_unlock(v33);
          }
          int v38 = 0;
          int v33 = (os_unfair_lock_s *)(v31 + 2560 * v35);
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v33, (unsigned int *)&v38, *(_DWORD *)(v34 + 24), memory_order_acquire, memory_order_acquire);
          if (v38) {
            os_unfair_lock_lock_with_options();
          }
          BOOL v24 = v35 == *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
          int v35 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x18);
        }
        while (!v24);
      }
      *(_WORD *)((v10 & 0xFFFFFFFFFF800000)
               + 2 * (((v10 - (v10 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
               + 0x28) = v44;
      *(_WORD *)((v30 & 0xFFFFFFFFFF800000 | (2 * (((v30 - (v30 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
               + 0x28) = v45;
      ++v33[542]._os_unfair_lock_opaque;
      int v39 = *(_DWORD *)(v34 + 24);
      int v40 = v39;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v33, (unsigned int *)&v40, 0, memory_order_release, memory_order_relaxed);
      if (v40 != v39) {
        os_unfair_lock_unlock(v33);
      }
      free_small(v27, v30, v30 & 0xFFFFFFFFFF800000, (v28 << 9));
    }
  }
  return v10;
}

mach_vm_address_t small_malloc_should_clear(unint64_t a1, unsigned int a2, int a3)
{
  signed int v6 = rack_get_thread_index(a1) % *(_DWORD *)(a1 + 608);
  uint64_t v7 = *(void *)(a1 + 624);
  unint64_t v8 = (atomic_uint *)(v7 + 2560 * v6);
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  int v9 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v9, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v9) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v11 = v7 + 2560 * v6;
  mach_vm_address_t v14 = *(void *)(v11 + 8);
  uint64_t v12 = v11 + 8;
  mach_vm_address_t v13 = v14;
  if (*(unsigned __int16 *)(v12 + 8) == a2)
  {
    *(void *)uint64_t v12 = 0;
    *(_WORD *)(v12 + 8) = 0;
    *(void *)(v7 + 2560 * v6 + 24) = 0;
LABEL_8:
    int v16 = *(_DWORD *)(StatusReg + 24);
    int v17 = v16;
    atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
    if (v17 != v16) {
      os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560 * v6));
    }
    if (a3) {
      _platform_memset();
    }
    return v13;
  }
  small_malloc_from_free_list(a1, v7 + 2560 * v6, a2);
  mach_vm_address_t v13 = v15;
  if (v15) {
    goto LABEL_8;
  }
  uint64_t v19 = v7 + 2560 * v6;
  uint64_t v87 = (_DWORD *)(v19 + 2168);
  uint64_t v88 = (int64x2_t *)(v19 + 2152);
  uint64_t v86 = (unint64_t *)(v19 + 2176);
  uint64_t v89 = (unint64_t *)(v19 + 2184);
  uint64_t v90 = (_DWORD *)(v19 + 2172);
  int64x2_t v84 = vdupq_n_s64(0x7F7E00uLL);
  int64x2_t v85 = vdupq_n_s64(0xFFFFFFFFFF808200);
  unsigned int v91 = (os_unfair_lock_s *)(v19 + 4);
  while (1)
  {
    int v20 = 0;
    uint64_t v21 = *(void *)(a1 + 624);
    int v22 = (os_unfair_lock_s *)(v21 - 2560);
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v21 - 2560), (unsigned int *)&v20, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v20)
    {
      os_unfair_lock_lock_with_options();
      int v22 = (os_unfair_lock_s *)(v21 - 2560);
    }
    uint64_t v23 = v21 - 2528;
    BOOL v24 = (unint64_t *)(v21 - 2288);
    unsigned __int16 v25 = a2;
    while (1)
    {
      if ((v25 & 0xFFE0) != 0) {
        unsigned int v26 = 30;
      }
      else {
        unsigned int v26 = v25 - 1;
      }
      unint64_t v27 = *(void *)(v23 + 8 * v26);
      if (!v27
        || ((unint64_t v28 = v27 & 0xFFFFFFFFFF800000, (v27 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v27)
          ? (BOOL v29 = (v27 & 0xFFFFFFFFFF800000 | 0x81F8) > v27)
          : (BOOL v29 = 0),
            v29
         && ((__int16 v30 = *(_WORD *)(v27 + 16), (v30 & 0x8000) == 0)
          || (unint64_t v27 = v28 + ((unint64_t)(v30 & 0x7FFF) << 9)) == 0)))
      {
        int v31 = v26 >> 5;
        int v32 = -1 << v26;
        while (1)
        {
          int v33 = v31;
          if (v31) {
            break;
          }
          int v31 = 1;
          unsigned int v34 = *(_DWORD *)(v21 - 472) & v32;
          int v32 = -1;
          if (v34) {
            goto LABEL_34;
          }
        }
        if (v31 == 1) {
          goto LABEL_54;
        }
        unsigned int v34 = 0;
LABEL_34:
        if ((int v35 = (unint64_t *)(v23 + 8 * (__clz(__rbit32(v34)) + 32 * v33)), v35 >= v24)
          || (unint64_t v27 = *v35) == 0
          || ((unint64_t v36 = v27 & 0xFFFFFFFFFF800000, (v27 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v27)
            ? (BOOL v37 = (v27 & 0xFFFFFFFFFF800000 | 0x81F8) > v27)
            : (BOOL v37 = 0),
              v37
           && ((__int16 v38 = *(_WORD *)(v27 + 16), (v38 & 0x8000) == 0)
            || (unint64_t v27 = v36 + ((unint64_t)(v38 & 0x7FFF) << 9)) == 0)))
        {
          unint64_t v27 = *v24;
          if (!*v24) {
            goto LABEL_54;
          }
          unint64_t v39 = v27 & 0xFFFFFFFFFF800000;
          if ((v27 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v27 && (v27 & 0xFFFFFFFFFF800000 | 0x81F8) > v27)
          {
            __int16 v41 = *(_WORD *)(v27 + 16);
            if ((v41 & 0x8000) == 0) {
              goto LABEL_54;
            }
            unint64_t v27 = v39 + ((unint64_t)(v41 & 0x7FFF) << 9);
            if (!v27) {
              goto LABEL_54;
            }
          }
        }
      }
      unint64_t v42 = v27 & 0xFFFFFFFFFF800000;
      if ((v27 & 0xFFFFFFFFFF800000) == 0)
      {
LABEL_54:
        int v43 = *(_DWORD *)(StatusReg + 24);
        int v44 = v43;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v22, (unsigned int *)&v44, 0, memory_order_release, memory_order_relaxed);
        if (v44 != v43) {
          os_unfair_lock_unlock(v22);
        }
        goto LABEL_56;
      }
      if (!*(_DWORD *)((v27 & 0xFFFFFFFFFF800000) + 0x1C)) {
        break;
      }
      if (++v25 >= 0x1Fu) {
        goto LABEL_54;
      }
    }
    uint64_t v55 = *(void *)v42;
    unint64_t v56 = *(void **)((v27 & 0xFFFFFFFFFF800000) + 8);
    if (*(void *)v42)
    {
      *(void *)(v55 + 8) = v56;
      unint64_t v56 = *(void **)((v27 & 0xFFFFFFFFFF800000) + 8);
    }
    else
    {
      *(void *)(v21 - 384) = v56;
    }
    if (!v56) {
      unint64_t v56 = (void *)(v21 - 376);
    }
    *unint64_t v56 = v55;
    *(void *)unint64_t v42 = 0;
    *(void *)((v27 & 0xFFFFFFFFFF800000) + 8) = 0;
    --*(_DWORD *)(v21 - 388);
    os_unfair_lock_t lock = v22;
    uint64_t v57 = small_free_detach_region(a1, (uint64_t)v22, v42);
    int v82 = v57;
    *(_DWORD *)(v42 + 24) = v6;
    if (*(_DWORD *)(v42 + 28)) {
      purgeable_ptr_in_use_enumerator_cold_1(v57);
    }
    uint64_t v58 = small_free_reattach_region(a1, v7 + 2560 * v6, v42);
    int64x2_t v59 = *(int64x2_t *)(v21 - 408);
    v60.i64[1] = v85.i64[1];
    v60.i64[0] = v58;
    v60.i64[0] = vsubq_s64(v59, v60).u64[0];
    v60.i64[1] = vaddq_s64(v59, v85).i64[1];
    *(int64x2_t *)(v21 - 408) = v60;
    *(_DWORD *)(v21 - 392) -= v82;
    v60.i64[1] = v84.i64[1];
    v60.i64[0] = v58;
    *uint64_t v88 = vaddq_s64(*v88, v60);
    *v87 += v82;
    unint64_t v61 = *v89;
    if (*v89) {
      *(void *)(v61 + 8) = v42;
    }
    else {
      *uint64_t v86 = v42;
    }
    *(void *)unint64_t v42 = v61;
    *uint64_t v89 = v42;
    *(void *)(v42 + 8) = 0;
    *(unsigned char *)(v42 + 32) = 0;
    ++*v90;
    int v62 = *(_DWORD *)(StatusReg + 24);
    int v63 = v62;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v63, 0, memory_order_release, memory_order_relaxed);
    if (v63 != v62) {
      os_unfair_lock_unlock(lock);
    }
    small_malloc_from_free_list(a1, v7 + 2560 * v6, a2);
    if (v64)
    {
      mach_vm_address_t v13 = v64;
      goto LABEL_8;
    }
LABEL_56:
    int v45 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v91, (unsigned int *)&v45, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    BOOL v46 = v45 == 0;
    int v47 = *(_DWORD *)(StatusReg + 24);
    int v48 = v47;
    atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v48, 0, memory_order_release, memory_order_relaxed);
    BOOL v49 = v48 == v47;
    if (v46) {
      break;
    }
    if (!v49) {
      os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560 * v6));
    }
    int v50 = 0;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v91, (unsigned int *)&v50, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v50) {
      os_unfair_lock_lock_with_options();
    }
    int v51 = *(_DWORD *)(StatusReg + 24);
    int v52 = v51;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v91, (unsigned int *)&v52, 0, memory_order_release, memory_order_relaxed);
    if (v52 != v51) {
      os_unfair_lock_unlock(v91);
    }
    int v53 = 0;
    atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v53, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v53) {
      os_unfair_lock_lock_with_options();
    }
    small_malloc_from_free_list(a1, v7 + 2560 * v6, a2);
    mach_vm_address_t v13 = v54;
    if (v54) {
      goto LABEL_8;
    }
  }
  if (!v49) {
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560 * v6));
  }
  unsigned int v65 = *(_DWORD *)(a1 + 620);
  if ((v65 & 4) != 0) {
    int v66 = -2;
  }
  else {
    int v66 = -4;
  }
  mach_vm_address_t pages = mvm_allocate_pages(0x800000uLL, 23, v66 & v65, 2);
  int v68 = 0;
  atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v68, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v68) {
    os_unfair_lock_lock_with_options();
  }
  if (pages)
  {
    *(_DWORD *)(pages + 33276) = unk_1EB1C96F9;
    uint64_t v69 = (void *)(v7 + 2560 * v6 + 2128);
    if (*v69 || *(void *)(v7 + 2560 * v6 + 2136)) {
      small_finalize_region(a1, v7 + 2560 * v6);
    }
    *(_DWORD *)(pages + 24) = v6;
    rack_region_insert((os_unfair_lock_t)a1, pages);
    uint64_t v70 = v7 + 2560 * v6;
    *(void *)(v70 + 2144) = pages;
    *(_DWORD *)(pages + 16) = a2 << 9;
    mach_vm_address_t v13 = pages + 33280;
    unint64_t v71 = (pages + 33280) & 0xFFFFFFFFFF800000;
    *(_WORD *)(v71 + 40) = a2;
    ++*v87;
    int64x2_t v72 = vdupq_n_s64(0x7F7E00uLL);
    v72.i64[0] = a2 << 9;
    *uint64_t v88 = vaddq_s64(*v88, v72);
    *(_WORD *)((v71 | 0x28) + 2 * a2) = 16319 - a2;
    *uint64_t v69 = (16319 - a2) << 9;
    *(void *)(v70 + 2136) = 0;
    unint64_t v73 = *v89;
    if (*v89) {
      *(void *)(v73 + 8) = pages;
    }
    else {
      *uint64_t v86 = pages;
    }
    *(void *)mach_vm_address_t pages = v73;
    *uint64_t v89 = pages;
    *(void *)(pages + 8) = 0;
    *(unsigned char *)(pages + 32) = 0;
    ++*v90;
    int v78 = *(_DWORD *)(StatusReg + 24);
    int v79 = v78;
    atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v79, 0, memory_order_release, memory_order_relaxed);
    if (v79 != v78) {
      os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560 * v6));
    }
    int v80 = *(_DWORD *)(StatusReg + 24);
    int v81 = v80;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v91, (unsigned int *)&v81, 0, memory_order_release, memory_order_relaxed);
    if (v81 != v80) {
      os_unfair_lock_unlock(v91);
    }
  }
  else
  {
    int v74 = *(_DWORD *)(StatusReg + 24);
    int v75 = v74;
    atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v75, 0, memory_order_release, memory_order_relaxed);
    if (v75 != v74) {
      os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 2560 * v6));
    }
    int v76 = *(_DWORD *)(StatusReg + 24);
    int v77 = v76;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v91, (unsigned int *)&v77, 0, memory_order_release, memory_order_relaxed);
    if (v77 != v76) {
      os_unfair_lock_unlock(v91);
    }
    return 0;
  }
  return v13;
}

void free_small(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
  uint64_t v8 = *(void *)(a1 + 624);
  if (a4)
  {
    unint64_t v9 = (unint64_t)(a4 + 511) >> 9;
  }
  else
  {
    LODWORD(v9) = *(__int16 *)((a2 & 0xFFFFFFFFFF800000)
                             + 2 * (((a2 - (a2 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
                             + 0x28);
    if ((v9 & 0x80000000) != 0) {
      goto LABEL_35;
    }
  }
  int v10 = 0;
  uint64_t v11 = v8 + 2560 * v7;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v10, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v10) {
    os_unfair_lock_lock_with_options();
  }
  if (v7 == -1)
  {
    unint64_t v19 = a2;
    goto LABEL_14;
  }
  uint64_t v13 = v8 + 2560 * v7;
  unint64_t v16 = *(void *)(v13 + 8);
  uint64_t v15 = v13 + 8;
  unint64_t v14 = v16;
  if (v16 != a2)
  {
    unint64_t v73 = v14;
    __int16 v17 = *(_WORD *)(v15 + 8);
    uint64_t v18 = *(void *)(v15 + 16);
    if ((_WORD)v9 && (*(_DWORD *)(a1 + 620) & 0x20) != 0)
    {
      __int16 v71 = *(_WORD *)(v15 + 8);
      uint64_t v70 = *(void *)(v15 + 16);
      _platform_memset();
      uint64_t v18 = v70;
      __int16 v17 = v71;
    }
    *(void *)uint64_t v15 = a2;
    *(_WORD *)(v15 + 8) = v9;
    *(void *)(v15 + 16) = a3;
    unint64_t v19 = v73;
    if (!v73) {
      goto LABEL_58;
    }
    a3 = v18;
    LOWORD(v9) = v17;
LABEL_14:
    for (int i = *(_DWORD *)(a3 + 24); v7 != i; int i = *(_DWORD *)(a3 + 24))
    {
      int v7 = i;
      int v21 = *(_DWORD *)(StatusReg + 24);
      int v22 = v21;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v22, 0, memory_order_release, memory_order_relaxed);
      if (v22 != v21) {
        os_unfair_lock_unlock((os_unfair_lock_t)v11);
      }
      int v23 = 0;
      uint64_t v11 = *(void *)(a1 + 624) + 2560 * v7;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v23, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v23) {
        os_unfair_lock_lock_with_options();
      }
    }
    uint64_t v24 = (unsigned __int16)v9 << 9;
    uint64_t v72 = v24;
    if (malloc_tracing_enabled)
    {
      kdebug_trace();
      uint64_t v24 = (unsigned __int16)v9 << 9;
    }
    if (*(_DWORD *)(a3 + 33276) != unk_1EB1C96F9)
    {
      malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
      __break(1u);
      return;
    }
    unint64_t v25 = v19 & 0xFFFFFFFFFF800000 | 0x28;
    unsigned int v26 = ((v19 + 8355328) >> 9) & 0x3FFF;
    unsigned __int16 v27 = v9;
    unint64_t v28 = v19;
    unint64_t v74 = v19;
    if (v26)
    {
      int v29 = *(__int16 *)(v25 + 2 * (v26 - 1));
      unsigned __int16 v27 = v9;
      unint64_t v28 = v19;
      if (v29 < 0)
      {
        uint64_t v30 = *(_WORD *)(v25 + 2 * (v26 - 1)) & 0x7FFF;
        if ((v29 & 0x7FFF | 0x8000) != *(unsigned __int16 *)(v25 + 2 * (v26 - (v29 & 0x7FFF)))) {
          free_small_cold_1();
        }
        unint64_t v28 = v74 - (v30 << 9);
        small_free_list_find_by_ptr(a1, v28, v30);
        small_free_list_remove_ptr(a1, v11, v31, v30);
        *(_WORD *)(v25 + 2 * v26) = 0;
        unsigned __int16 v27 = v30 + v9;
        uint64_t v24 = (unsigned __int16)v9 << 9;
        unint64_t v19 = v74;
      }
    }
    uint64_t v32 = v19 + v24;
    if (v19 + v24 < a3 + 0x800000)
    {
      int v33 = *(__int16 *)(v25 + 2 * (unsigned __int16)(v9 + v26));
      if (v33 < 0)
      {
        unsigned int v34 = v33 & 0x7FFF;
        unsigned __int16 v35 = v27;
        small_free_list_find_by_ptr(a1, v32, v34);
        small_free_list_remove_ptr(a1, v11, v36, v34);
        unsigned __int16 v27 = v34 + v35;
      }
    }
    int v37 = *(_DWORD *)(a1 + 620);
    unsigned __int16 v38 = v27;
    if ((v37 & 0x20) != 0)
    {
      if (v27) {
        _platform_memset();
      }
      else {
        malloc_zone_error(v37, 1, (uint64_t)"incorrect size information for %p - block header was damaged\n");
      }
      unsigned __int16 v27 = v38;
    }
    unsigned int v41 = v27;
    unint64_t v42 = small_free_list_add_ptr(a1, v11, v28, v27);
    *(void *)(v11 + 2152) -= v72;
    unsigned int v43 = *(_DWORD *)(a3 + 16) - v72;
    *(_DWORD *)(a3 + 16) = v43;
    if (aggressive_madvise_enabled)
    {
      small_madvise_free_range_no_lock(a1, (os_unfair_lock_s *)v11, a3, v42, v41, v74, v72);
      unsigned int v43 = *(_DWORD *)(a3 + 16);
    }
    if (v7 == -1)
    {
      if (aggressive_madvise_enabled)
      {
        if (v43) {
          goto LABEL_58;
        }
      }
      else
      {
        small_madvise_free_range_no_lock(a1, (os_unfair_lock_s *)v11, a3, v42, v38, v74, v72);
        if (v43) {
          goto LABEL_58;
        }
      }
      if (*(int *)(a3 + 28) <= 0)
      {
        unint64_t v52 = small_free_try_depot_unmap_no_lock((os_unfair_lock_s *)a1, v11, a3);
        int v53 = *(_DWORD *)(StatusReg + 24);
        int v54 = v53;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v54, 0, memory_order_release, memory_order_relaxed);
        if (v54 == v53) {
          goto LABEL_86;
        }
        uint64_t v55 = (os_unfair_lock_s *)v11;
LABEL_85:
        os_unfair_lock_unlock(v55);
LABEL_86:
        if (v52)
        {
          unsigned int v68 = *(_DWORD *)(a1 + 620);
          if ((v68 & 4) != 0) {
            int v69 = -2;
          }
          else {
            int v69 = -4;
          }
          mvm_deallocate_pages(v52, 0x800000, v69 & v68);
        }
        return;
      }
    }
    else
    {
      if (v43 <= 0x5F9E7F) {
        *(unsigned char *)(a3 + 32) = 1;
      }
      unint64_t v44 = *(void *)(v11 + 2160);
      unint64_t v45 = *(void *)(v11 + 2152);
      if (v44 - v45 >= 0xBF3D01 && v45 < v44 - (v44 >> 2))
      {
        uint64_t v46 = *(void *)(v11 + 2176);
        if (v46)
        {
          int v47 = (int64x2_t *)(v11 + 2152);
          while (!*(unsigned char *)(v46 + 32) || *(_DWORD *)(v46 + 28))
          {
            uint64_t v46 = *(void *)(v46 + 8);
            if (!v46) {
              goto LABEL_58;
            }
          }
          if (*(void *)(v11 + 2144) == (v46 & 0xFFFFFFFFFF800000)
            && (*(void *)(v11 + 2128) || *(void *)(v11 + 2136)))
          {
            small_finalize_region(a1, v11);
          }
          uint64_t v50 = *(void *)v46;
          int v51 = *(void **)(v46 + 8);
          if (*(void *)v46)
          {
            *(void *)(v50 + 8) = v51;
            int v51 = *(void **)(v46 + 8);
          }
          else
          {
            *(void *)(v11 + 2176) = v51;
          }
          if (!v51) {
            int v51 = (void *)(v11 + 2184);
          }
          *int v51 = v50;
          *(void *)uint64_t v46 = 0;
          *(void *)(v46 + 8) = 0;
          --*(_DWORD *)(v11 + 2172);
          int v75 = small_free_detach_region(a1, v11, v46 & 0xFFFFFFFFFF800000);
          int v56 = 0;
          uint64_t v57 = *(void *)(a1 + 624);
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v57 - 2560), (unsigned int *)&v56, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
          if (v56) {
            os_unfair_lock_lock_with_options();
          }
          *(_DWORD *)((v46 & 0xFFFFFFFFFF800000) + 0x18) = -1;
          *(_DWORD *)(v46 + 28) = 0;
          uint64_t v58 = small_free_reattach_region(a1, v57 - 2560, v46 & 0xFFFFFFFFFF800000);
          int64x2_t v59 = vdupq_n_s64(0xFFFFFFFFFF808200);
          v60.i64[1] = v59.i64[1];
          v60.i64[0] = v58;
          v61.i64[0] = vsubq_s64(*v47, v60).u64[0];
          v61.i64[1] = vaddq_s64(*v47, v59).i64[1];
          *int v47 = v61;
          *(_DWORD *)(v11 + 2168) -= v75;
          int v62 = *(_DWORD *)(StatusReg + 24);
          int v63 = v62;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v63, 0, memory_order_release, memory_order_relaxed);
          if (v63 != v62) {
            os_unfair_lock_unlock((os_unfair_lock_t)v11);
          }
          int64x2_t v64 = vdupq_n_s64(0x7F7E00uLL);
          v64.i64[0] = v58;
          *(int64x2_t *)(v57 - 408) = vaddq_s64(*(int64x2_t *)(v57 - 408), v64);
          *(_DWORD *)(v57 - 392) += v75;
          uint64_t v65 = *(void *)(v57 - 376);
          if (v65) {
            *(void *)(v65 + 8) = v46;
          }
          else {
            *(void *)(v57 - 384) = v46;
          }
          *(void *)uint64_t v46 = v65;
          *(void *)(v57 - 376) = v46;
          *(void *)(v46 + 8) = 0;
          *(unsigned char *)(v46 + 32) = 0;
          ++*(_DWORD *)(v57 - 388);
          if (!aggressive_madvise_enabled) {
            small_free_scan_madvise_free(a1, (os_unfair_lock_s *)(v57 - 2560), v46 & 0xFFFFFFFFFF800000);
          }
          unint64_t v52 = small_free_try_depot_unmap_no_lock((os_unfair_lock_s *)a1, v57 - 2560, v46);
          int v66 = *(_DWORD *)(StatusReg + 24);
          int v67 = v66;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v57 - 2560), (unsigned int *)&v67, 0, memory_order_release, memory_order_relaxed);
          if (v67 == v66) {
            goto LABEL_86;
          }
          uint64_t v55 = (os_unfair_lock_s *)(v57 - 2560);
          goto LABEL_85;
        }
      }
    }
LABEL_58:
    int v48 = *(_DWORD *)(StatusReg + 24);
    int v49 = v48;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v49, 0, memory_order_release, memory_order_relaxed);
    if (v49 != v48)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)v11);
    }
    return;
  }
  int v39 = *(_DWORD *)(StatusReg + 24);
  int v40 = v39;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v40, 0, memory_order_release, memory_order_relaxed);
  if (v40 != v39) {
    os_unfair_lock_unlock((os_unfair_lock_t)v11);
  }
LABEL_35:

  free_small_botch(a1);
}

BOOL small_claimed_address(uint64_t a1, unint64_t a2)
{
  int v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *v2;
  if (*v2)
  {
    unint64_t v4 = a2 & 0xFFFFFFFFFF800000;
    uint64_t v5 = v2[2];
    unint64_t v6 = (0x9E3779B97F4A7C55 * ((a2 & 0xFFFFFFFFFF800000) >> 20)) >> -*((unsigned char *)v2 + 8);
    unint64_t v7 = v6;
    do
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7);
      if (!v8) {
        break;
      }
      if (v8 == v4) {
        goto LABEL_10;
      }
      if (v7 + 1 == v3) {
        unint64_t v7 = 0;
      }
      else {
        ++v7;
      }
    }
    while (v7 != v6);
  }
  unint64_t v4 = 0;
LABEL_10:
  if (v4) {
    BOOL v9 = v4 + 33280 > a2;
  }
  else {
    BOOL v9 = 1;
  }
  unint64_t v10 = v4 + 0x800000;
  return !v9 && v10 > a2;
}

uint64_t small_try_shrink_in_place(unint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5 = a4 >> 9;
  __int16 v6 = (a3 >> 9) - (a4 >> 9);
  if (v6)
  {
    int v7 = 0;
    unint64_t v8 = (a4 & 0x1FFFE00) + a2;
    uint64_t v9 = *(void *)(a1 + 624);
    int v10 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
    uint64_t v11 = (os_unfair_lock_s *)(v9 + 2560 * v10);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v7, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v7) {
      os_unfair_lock_lock_with_options();
    }
    int v13 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
    if (v13 != v10)
    {
      do
      {
        int v14 = *(_DWORD *)(StatusReg + 24);
        int v15 = v14;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v15, 0, memory_order_release, memory_order_relaxed);
        if (v15 != v14) {
          os_unfair_lock_unlock(v11);
        }
        int v16 = 0;
        uint64_t v11 = (os_unfair_lock_s *)(v9 + 2560 * v13);
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v16, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v16) {
          os_unfair_lock_lock_with_options();
        }
        BOOL v17 = v13 == *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
        int v13 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
      }
      while (!v17);
    }
    *(_WORD *)((a2 & 0xFFFFFFFFFF800000)
             + 2 * (((unint64_t)(a2 - (a2 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
             + 0x28) = v5;
    *(_WORD *)((v8 & 0xFFFFFFFFFF800000 | (2 * (((v8 - (v8 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
             + 0x28) = v6;
    ++v11[542]._os_unfair_lock_opaque;
    int v18 = *(_DWORD *)(StatusReg + 24);
    int v19 = v18;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v19, 0, memory_order_release, memory_order_relaxed);
    if (v19 != v18) {
      os_unfair_lock_unlock(v11);
    }
    free_small(a1, v8, v8 & 0xFFFFFFFFFF800000, 0);
  }
  return a2;
}

uint64_t small_try_realloc_in_place(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5 = ((a2 + 8355328) >> 9) & 0x3FFF;
  unsigned int v6 = v5 + (unsigned __int16)(a3 >> 9);
  if (v6 > 0x3FBE) {
    return 0;
  }
  int v10 = 0;
  unint64_t v11 = a2 & 0xFFFFFFFFFF800000;
  uint64_t v12 = *(void *)(a1 + 624);
  int v13 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
  uint64_t v14 = v12 + 2560 * v13;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v14, (unsigned int *)&v10, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v10) {
    os_unfair_lock_lock_with_options();
  }
  int v16 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18);
  for (i = a1; v13 != v16; int v16 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x18))
  {
    int v13 = v16;
    int v17 = *(_DWORD *)(StatusReg + 24);
    int v18 = v17;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v14, (unsigned int *)&v18, 0, memory_order_release, memory_order_relaxed);
    if (v18 != v17) {
      os_unfair_lock_unlock((os_unfair_lock_t)v14);
    }
    int v19 = 0;
    uint64_t v14 = v12 + 2560 * v13;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v14, (unsigned int *)&v19, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v19) {
      os_unfair_lock_lock_with_options();
    }
  }
  if (v13 == -1) {
    goto LABEL_21;
  }
  uint64_t v20 = v11 | 0x28;
  unint64_t v21 = (unint64_t)(a4 + 511) >> 9;
  uint64_t v22 = a2 + a3;
  int v23 = (unsigned __int16)(a3 >> 9);
  int v24 = (unsigned __int16)v21;
  int v25 = (unsigned __int16)v21 - v23;
  if (*(void *)(v14 + 8) == a2 + a3)
  {
    int v26 = *(unsigned __int16 *)(v14 + 16);
    if (v23 + v26 >= (unsigned __int16)v21)
    {
      if (v26 == (unsigned __int16)v25)
      {
        uint64_t v34 = 0;
        *(_WORD *)(v14 + 16) = 0;
        *(void *)(v14 + 24) = 0;
      }
      else
      {
        __int16 v37 = v26 - v25;
        *(_WORD *)(v14 + 16) = v37;
        uint64_t v34 = a2 + a4;
        *(_WORD *)(v20 + 2 * (unsigned __int16)(v5 + v21)) = v37;
      }
      *(void *)(v14 + 8) = v34;
      *(_WORD *)(v20 + 2 * v5) = v21;
      LOWORD(v30) = 0;
      unsigned int v5 = (unsigned __int16)v6;
      goto LABEL_30;
    }
  }
  if (*(void *)(v14 + 2144) == v11)
  {
    uint64_t v27 = *(void *)(v14 + 2128);
    if ((unsigned __int16)(v21 - v23) < (unsigned __int16)(v27 >> 9)
      && v11 - v27 + 0x800000 == v22)
    {
      *(_WORD *)(v20 + 2 * v5) = v21;
      *(_WORD *)(v20 + 2 * (unsigned __int16)v6) = 0;
      unint64_t v35 = v27 - ((unsigned __int16)(v21 - v23) << 9);
      *(void *)(v14 + 2128) = v35;
      unsigned int v5 = (unsigned __int16)(v5 + v21);
      unint64_t v30 = v35 >> 9;
LABEL_30:
      *(_WORD *)(v20 + 2 * v5) = v30;
      *(void *)(v14 + 2152) += (v25 << 9);
      unsigned int v38 = *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x10) + (v25 << 9);
      *(_DWORD *)((a2 & 0xFFFFFFFFFF800000) + 0x10) = v38;
      if (v38 >= 0x5F9E80) {
        *(unsigned char *)((a2 & 0xFFFFFFFFFF800000) + 0x20) = 0;
      }
      int v32 = *(_DWORD *)(StatusReg + 24);
      int v33 = v32;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v14, (unsigned int *)&v33, 0, memory_order_release, memory_order_relaxed);
      uint64_t v7 = 1;
      goto LABEL_33;
    }
  }
  int v29 = *(__int16 *)(v20 + 2 * v6);
  if (v29 < 0)
  {
    unint64_t v44 = (unint64_t)(a4 + 511) >> 9;
    LODWORD(v30) = v29 & 0x7FFF;
    unsigned int v31 = v23 + v30;
    if (v31 >= (unsigned __int16)v21)
    {
      __int16 v40 = v31;
      int v41 = v25;
      small_free_list_find_by_ptr(i, v22, v29 & 0x7FFF);
      small_free_list_remove_ptr(i, v14, v36, v30);
      *(_WORD *)(v20 + 2 * (unsigned __int16)v6) = 0;
      LOWORD(v30) = v44;
      if (v40 != (_WORD)v44) {
        small_free_list_add_ptr(i, v14, a2 + (v24 << 9), (unsigned __int16)(v40 - v44));
      }
      int v25 = v41;
      goto LABEL_30;
    }
  }
LABEL_21:
  uint64_t v7 = 0;
  int v32 = *(_DWORD *)(StatusReg + 24);
  int v33 = v32;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v14, (unsigned int *)&v33, 0, memory_order_release, memory_order_relaxed);
LABEL_33:
  if (v33 != v32) {
    os_unfair_lock_unlock((os_unfair_lock_t)v14);
  }
  return v7;
}

void small_check_region(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = a2 + 0x800000;
  int v3 = *(_DWORD *)(((a2 + 33280) & 0xFFFFFFFFFF800000) + 0x18);
  uint64_t v4 = *(void *)(a1 + 624);
  unint64_t v5 = a2 + 33280;
  if (*(void *)(v4 + 2560 * v3 + 2144) == a2)
  {
    uint64_t v6 = v4 + 2560 * v3;
    unint64_t v5 = a2 + 33280 + *(void *)(v6 + 2136);
    v2 -= *(void *)(v6 + 2128);
  }
  if (v5 < v2)
  {
    unint64_t v7 = (a2 + 33280) & 0xFFFFFFFFFF800000 | 0x28;
    do
    {
      unint64_t v8 = v5 & 0xFFFFFFFFFF800000;
      uint64_t v9 = *(unsigned __int16 *)(v7 + 2 * (((v5 - (v5 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF));
      if (*(__int16 *)(v7 + 2 * (((v5 - (v5 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)) < 0)
      {
        uint64_t v11 = v9 & 0x7FFF;
        if ((v9 & 0x7FFF) == 0)
        {
          int v33 = "%ld, counter=%d\n*** invariant broken for free block %p this msize=%d\n";
          goto LABEL_55;
        }
        unint64_t v12 = v5;
        if ((v5 & (*MEMORY[0x1E4F14C80] - 1)) == 0)
        {
          unint64_t v12 = v5;
          if ((unint64_t)(v9 & 0x7FFF) << 9 >= *MEMORY[0x1E4F14C68])
          {
            unint64_t v13 = v8 + 32678;
            unint64_t v14 = v8 + 32678;
            uint64_t v15 = 33;
            while ((*(_WORD *)(v14 + 16) & 0x8000) == 0
                 || v5 != (v13 & 0xFFFFFFFFFF800000) + ((unint64_t)(*(_WORD *)(v14 + 16) & 0x7FFF) << 9))
            {
              v14 += 18;
              v13 += 18;
              if (!--v15)
              {
                unint64_t v14 = 0;
                break;
              }
            }
            if (v14) {
              unint64_t v12 = v14;
            }
            else {
              unint64_t v12 = v5;
            }
          }
        }
        if (!v12) {
          purgeable_ptr_in_use_enumerator_cold_1(a1);
        }
        if ((v12 & 0xFFFFFFFFFF800000 | 0x7FA6) > v12 || (v12 & 0xFFFFFFFFFF800000 | 0x81F8) <= v12)
        {
          unint64_t v17 = *(void *)v12;
          uint64_t v18 = *(void *)(a1 + 632) ^ a1;
          uint64_t v19 = v18 ^ *(void *)v12;
          if (*(unsigned __int8 *)(v12 + 8) != (BYTE4(v19)
                                                                + v19
                                                                + ((HIDWORD(v19) + v19) >> 16)
                                                                + ((unsigned __int16)(WORD2(v19)
                                                                                    + v19
                                                                                    + ((HIDWORD(v19) + v19) >> 16)) >> 8))
            || (unint64_t v16 = *(void *)(v12 + 16),
                unint64_t v20 = v18 ^ v16,
                *(unsigned __int8 *)(v12 + 24) != (BYTE4(v20)
                                                                  + v20
                                                                  + ((HIDWORD(v20) + v20) >> 16)
                                                                  + ((unsigned __int16)(WORD2(v20)
                                                                                      + v20
                                                                                      + ((HIDWORD(v20) + v20) >> 16)) >> 8))))
          {
            free_list_checksum_botch(a1);
            __break(1u);
            return;
          }
        }
        else
        {
          unint64_t v17 = *(void *)v12;
          unint64_t v16 = *(void *)(v12 + 8);
        }
        if (v17)
        {
          unint64_t v21 = v17 & 0xFFFFFFFFFF800000;
          BOOL v22 = v17 < (v17 & 0xFFFFFFFFFF800000 | 0x7FA6) || v17 >= (v17 & 0xFFFFFFFFFF800000 | 0x81F8);
          int v23 = v17;
          unint64_t v24 = v17 & 0xFFFFFFFFFF800000;
          if (!v22)
          {
            __int16 v25 = *(_WORD *)(v17 + 16);
            BOOL v26 = v25 < 0;
            unint64_t v24 = v25 < 0 ? v21 + ((unint64_t)(v25 & 0x4000) << 9) : 0;
            int v23 = v21 + ((v25 & 0x7FFF) << 9);
            if (!v26) {
              int v23 = 0;
            }
          }
          if ((*(__int16 *)(v24 + 2 * (((unint64_t)(v23 - 33280) >> 9) & 0x3FFF) + 40) & 0x80000000) == 0)
          {
            int v33 = "%ld, counter=%d\n*** invariant broken for %p (previous %p is not a free pointer)\n";
            goto LABEL_55;
          }
        }
        if (v16)
        {
          unint64_t v27 = v16 & 0xFFFFFFFFFF800000;
          BOOL v28 = v16 < (v16 & 0xFFFFFFFFFF800000 | 0x7FA6) || v16 >= (v16 & 0xFFFFFFFFFF800000 | 0x81F8);
          int v29 = v16;
          unint64_t v30 = v16 & 0xFFFFFFFFFF800000;
          if (!v28)
          {
            __int16 v31 = *(_WORD *)(v16 + 16);
            BOOL v32 = v31 < 0;
            if (v31 < 0) {
              unint64_t v30 = v27 + ((unint64_t)(v31 & 0x4000) << 9);
            }
            else {
              unint64_t v30 = 0;
            }
            int v29 = v27 + ((v31 & 0x7FFF) << 9);
            if (!v32) {
              int v29 = 0;
            }
          }
          if ((*(__int16 *)(v30 + 2 * (((unint64_t)(v29 - 33280) >> 9) & 0x3FFF) + 40) & 0x80000000) == 0)
          {
            int v33 = "%ld, counter=%d\n*** invariant broken for %p (next %p is not a free pointer)\n";
            goto LABEL_55;
          }
        }
        unint64_t v10 = v5 + (v11 << 9);
        if ((*(_WORD *)(((v10 - 2) & 0xFFFFFFFFFF800000 | (2
                                                            * (((v10
                                                               - 2
                                                               - ((v10 - 2) & 0xFF800000 | 0x8200)) >> 9) & 0x3FFFLL)))
                       + 0x28) & 0x7FFF) != v11)
        {
          int v33 = "%ld, counter=%d\n"
                "*** invariant broken for small free %p followed by %p in region [%p-%p] (end marker incorrect) should be"
                " %d; in fact %d\n";
          goto LABEL_55;
        }
      }
      else
      {
        if (!*(_WORD *)(v7 + 2 * (((v5 - (v5 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
        {
          int v33 = "%ld, counter=%d\n*** invariant broken: null msize ptr=%p num_small_regions=%d end=%p\n";
LABEL_55:
          malloc_zone_check_fail((uint64_t)"check: incorrect small region ", (uint64_t)v33);
          return;
        }
        unint64_t v10 = v5 + (v9 << 9);
      }
      unint64_t v5 = v10;
    }
    while (v10 < v2);
  }
}

unint64_t small_free_list_get_ptr(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result & 0xFFFFFFFFFF800000;
    if ((result & 0xFFFFFFFFFF800000 | 0x7FA6) <= result && (v1 | 0x81F8) > result)
    {
      __int16 v2 = *(_WORD *)(result + 16);
      unint64_t v3 = v1 + ((unint64_t)(v2 & 0x7FFF) << 9);
      if (v2 < 0) {
        return v3;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

uint64_t small_in_use_enumerator()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  __int16 v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  uint64_t v43 = *MEMORY[0x1E4F14BF8];
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t result = v3(v0, *(void *)(v5 + 17304), 32, (uint64_t *)&v34);
  if (!result)
  {
    uint64_t v33 = *v34;
    uint64_t result = v4(v11, v34[2], 8 * *v34, &v41);
    if (!result)
    {
      if ((v8 & 1) == 0
        || (uint64_t result = v4(v11, *(void *)(v6 + 17904), 2560 * *(int *)(v6 + 17888), &v35), !result))
      {
        if (v33)
        {
          uint64_t v13 = 0;
          __int16 v31 = v2;
          BOOL v32 = (unsigned int *)(v6 + 17888);
          uint64_t v30 = v10;
          while (1)
          {
            uint64_t v14 = *(void *)(v41 + 8 * v13);
            if ((unint64_t)(v14 + 1) >= 2)
            {
              if ((v8 & 4) != 0)
              {
                uint64_t v39 = *(void *)(v41 + 8 * v13);
                uint64_t v40 = 32678;
                ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))v2)(v11, v10, 4, &v39, 1);
              }
              uint64_t v15 = v14 + 33280;
              if ((v8 & 6) != 0)
              {
                uint64_t v37 = v14 + 33280;
                uint64_t v38 = 8355328;
                ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))v2)(v11, v10, 2, &v37, 1);
              }
              if (v8)
              {
                uint64_t result = v4(v11, v14, 0x800000, &v36);
                if (result) {
                  return result;
                }
                uint64_t v16 = *v32;
                if ((int)v16 < 1)
                {
                  int v17 = 0;
                }
                else
                {
                  int v17 = 0;
                  uint64_t v18 = (void *)(v35 + 24);
                  do
                  {
                    if (v14 == *v18) {
                      ++v17;
                    }
                    v18 += 320;
                    --v16;
                  }
                  while (v16);
                }
                int v19 = *(_DWORD *)(v36 + 24);
                if (v14 != *(void *)(v35 + 2560 * v19 + 2144))
                {
                  LODWORD(v20) = 0;
                  unsigned int v21 = 16319;
LABEL_27:
                  int v23 = 0;
                  uint64_t v24 = v36 + 40;
                  do
                  {
                    uint64_t v25 = *(_WORD *)(v24 + 2 * v20) & 0x7FFF;
                    if ((*(_WORD *)(v24 + 2 * v20) & 0x7FFF) == 0) {
                      return 5;
                    }
                    if ((*(_WORD *)(v24 + 2 * v20) & 0x8000) == 0)
                    {
                      uint64_t v26 = v15 + (v20 << 9);
                      if (v17 && (uint64_t v27 = *v32, (int)v27 >= 1))
                      {
                        BOOL v28 = (void *)(v35 + 8);
                        while (v26 != *v28)
                        {
                          v28 += 320;
                          if (!--v27) {
                            goto LABEL_35;
                          }
                        }
                        --v17;
                      }
                      else
                      {
LABEL_35:
                        int v29 = &v42[v23];
                        *int v29 = v26;
                        v29[1] = v25 << 9;
                        if (++v23 >= 0x100)
                        {
                          v31(v11, v30, 1, v42);
                          int v23 = 0;
                        }
                      }
                    }
                    LODWORD(v20) = v20 + v25;
                  }
                  while (v20 < v21);
                  uint64_t v10 = v30;
                  __int16 v2 = v31;
                  if (v23) {
                    v31(v11, v30, 1, v42);
                  }
                  goto LABEL_9;
                }
                uint64_t v22 = v35 + 2560 * v19;
                uint64_t v20 = *(void *)(v22 + 2136) >> 9;
                unsigned int v21 = 16319 - (*(void *)(v22 + 2128) >> 9);
                if (v21 > v20) {
                  goto LABEL_27;
                }
              }
            }
LABEL_9:
            uint64_t result = 0;
            if (++v13 == v33) {
              return result;
            }
          }
        }
        return 0;
      }
    }
  }
  return result;
}

void small_malloc_from_free_list(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v3 = a3;
  if (a3 >= 0x20) {
    unsigned int v6 = 30;
  }
  else {
    unsigned int v6 = a3 - 1;
  }
  unint64_t v7 = *(void *)(a2 + 32 + 8 * v6);
  if (v7)
  {
    unint64_t v8 = v7 & 0xFFFFFFFFFF800000;
    BOOL v9 = (v7 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v7 && (v7 & 0xFFFFFFFFFF800000 | 0x81F8) > v7;
    uint64_t v10 = *(void *)(a2 + 32 + 8 * v6);
    if (!v9) {
      goto LABEL_13;
    }
    if ((*(_WORD *)(v7 + 16) & 0x8000) != 0)
    {
      unint64_t v11 = (unint64_t)(*(_WORD *)(v7 + 16) & 0x7FFF) << 9;
      if (v11 != -(uint64_t)v8)
      {
        uint64_t v10 = v11 + v8;
LABEL_13:
        small_free_list_remove_ptr(a1, a2, v7, v3);
        goto LABEL_14;
      }
    }
  }
  int v14 = v6 >> 5;
  int v15 = -1 << v6;
  while (1)
  {
    int v16 = v14;
    if (v14) {
      break;
    }
    int v14 = 1;
    unsigned int v17 = *(_DWORD *)(a2 + 2088) & v15;
    int v15 = -1;
    if (v17) {
      goto LABEL_24;
    }
  }
  if (v14 == 1) {
    goto LABEL_34;
  }
  unsigned int v17 = 0;
LABEL_24:
  unint64_t v18 = *(void *)(a2 + 32 + 8 * (__clz(__rbit32(v17)) + 32 * v16));
  if (v18)
  {
    BOOL v19 = (v18 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v18 && (v18 & 0xFFFFFFFFFF800000 | 0x81F8) > v18;
    uint64_t v10 = v18;
    if (!v19
      || (*(_WORD *)(v18 + 16) & 0x8000) != 0
      && (uint64_t v10 = (v18 & 0xFFFFFFFFFF800000) + ((unint64_t)(*(_WORD *)(v18 + 16) & 0x7FFF) << 9)) != 0)
    {
      unsigned int v20 = *(_WORD *)((v10 & 0xFFFFFFFFFF800000 | (2
                                                    * (((unint64_t)(v10
                                                                         - (v10 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                     + 0x28) & 0x7FFF;
      small_free_list_remove_ptr(a1, a2, v18, v20);
      if (v20 <= v3) {
        unsigned int v3 = v20;
      }
      else {
        small_free_list_add_ptr(a1, a2, v10 + (v3 << 9), (unsigned __int16)(v20 - v3));
      }
      goto LABEL_14;
    }
  }
LABEL_34:
  unint64_t v21 = *(void *)(a2 + 2128);
  unint64_t v22 = v3 << 9;
  if (v21 < v22) {
    return;
  }
  uint64_t v10 = *(void *)(a2 + 2144) - v21 + 0x800000;
  unint64_t v23 = v21 - v22;
  *(void *)(a2 + 2128) = v23;
  if (v23) {
    *(_WORD *)((v10 & 0xFFFFFFFFFF800000 | (2 * (((v10 + v22 - 33280) >> 9) & 0x3FFFLL))) + 0x28) = v23 >> 9;
  }
LABEL_14:
  ++*(_DWORD *)(a2 + 2168);
  uint64_t v12 = v3 << 9;
  *(void *)(a2 + 2152) += v12;
  if (*(_DWORD *)(v10 & 0xFFFFFFFFFF800000 | 0x81FC) == unk_1EB1C96F9)
  {
    unsigned int v13 = *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x10) + v12;
    *(_DWORD *)((v10 & 0xFFFFFFFFFF800000) + 0x10) = v13;
    if (v13 >= 0x5F9E80) {
      *(unsigned char *)((v10 & 0xFFFFFFFFFF800000) + 0x20) = 0;
    }
    *(_WORD *)((v10 & 0xFFFFFFFFFF800000)
             + 2 * (((unint64_t)(v10 - (v10 & 0xFF800000) - 33280) >> 9) & 0x3FFF)
             + 0x28) = v3;
  }
  else
  {
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
  }
}

void free_small_botch(uint64_t a1)
{
}

void print_small_free_list(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a3)(const char *, ...), uint64_t a4)
{
  if (_simple_salloc())
  {
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    if (a2(a1, a4, 768, &v21))
    {
      unint64_t v8 = "Failed to map small rack\n";
LABEL_6:
      a3(v8);
      return;
    }
    if (a2(a1, *(void *)(v21 + 624), 2560 * *(int *)(v21 + 608), &v20))
    {
      unint64_t v8 = "Failed to map small rack magazines\n";
      goto LABEL_6;
    }
    _simple_sappend();
    if ((*(_DWORD *)(v21 + 608) & 0x80000000) != 0)
    {
LABEL_42:
      unint64_t v18 = (const char *)_simple_string();
      a3("%s\n", v18);
      _simple_sfree();
      return;
    }
    uint64_t v9 = -1;
LABEL_10:
    uint64_t v19 = v9;
    _simple_sprintf();
    uint64_t v10 = 0;
    uint64_t v11 = v19;
    while (1)
    {
      unint64_t v12 = *(void *)(v20 + 2560 * v11 + 8 * v10 + 32);
      if (v12)
      {
        if ((v12 & 0xFFFFFFFFFF800000 | 0x7FA6) > v12 || (v12 & 0xFFFFFFFFFF800000 | 0x81F8) <= v12)
        {
LABEL_16:
          int v14 = 0;
          while (1)
          {
            if (v12 >= (v12 & 0xFFFFFFFFFF800000 | 0x7FA6) && v12 < (v12 & 0xFFFFFFFFFF800000 | 0x81F8))
            {
              uint64_t v23 = 0;
              if (!a2(a1, v12, 18, &v23))
              {
                unint64_t v12 = *(void *)(v23 + 8);
                goto LABEL_31;
              }
              int v16 = "Failed to map small oobe pointer\n";
              goto LABEL_28;
            }
            uint64_t v22 = 0;
            uint64_t v23 = 0;
            if (a2(a1, v12 + 16, 16, &v23)) {
              break;
            }
            if (a2(a1, a4, 768, &v22))
            {
              int v16 = "Failed to map small rack\n";
              goto LABEL_28;
            }
            unint64_t v12 = *(void *)v23;
            uint64_t v17 = *(void *)(v22 + 632) ^ a4 ^ *(void *)v23;
            if (*(unsigned __int8 *)(v23 + 8) != (BYTE4(v17)
                                                                  + v17
                                                                  + ((HIDWORD(v17) + v17) >> 16)
                                                                  + ((unsigned __int16)(WORD2(v17)
                                                                                      + v17
                                                                                      + ((HIDWORD(v17) + v17) >> 16)) >> 8)))
            {
              free_list_checksum_botch(a4);
              __break(1u);
              return;
            }
LABEL_31:
            ++v14;
            if (!v12)
            {
              _simple_sprintf();
              goto LABEL_36;
            }
          }
          int v16 = "Unable to map small linkage pointer %p\n";
LABEL_28:
          a3(v16);
          unint64_t v12 = 0;
          goto LABEL_31;
        }
        uint64_t v23 = 0;
        if (a2(a1, v12, 18, &v23))
        {
          a3("Failed to map small oobe pointer\n");
        }
        else if (*(__int16 *)(v23 + 16) < 0)
        {
          uint64_t v11 = v19;
          if ((v12 & 0xFFFFFFFFFF800000) + ((unint64_t)(*(_WORD *)(v23 + 16) & 0x7FFF) << 9)) {
            goto LABEL_16;
          }
          goto LABEL_37;
        }
LABEL_36:
        uint64_t v11 = v19;
      }
LABEL_37:
      if (++v10 == 31)
      {
        _simple_sappend();
        uint64_t v9 = v19 + 1;
        if (v19 + 1 >= *(int *)(v21 + 608)) {
          goto LABEL_42;
        }
        goto LABEL_10;
      }
    }
  }
}

uint64_t print_small_region()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  int v8 = v7;
  uint64_t v10 = v9;
  uint64_t v37 = *MEMORY[0x1E4F14BF8];
  uint64_t v11 = (char *)(v5 + 33280);
  uint64_t v35 = 0;
  if (v12(v0, v5 + 33280, 0x800000, &v35)) {
    return v10("Failed to map small region at %p\n", v11);
  }
  if (v6 == -1)
  {
    uint64_t result = _simple_salloc();
    if (!result) {
      return result;
    }
    _simple_sprintf();
    BOOL v28 = (const char *)_simple_string();
    v10("%s\n", v28);
    return _simple_sfree();
  }
  int v34 = v8;
  unint64_t v14 = (unint64_t)&v11[v4];
  unint64_t v15 = v6 + 0x800000 - v2;
  uint64_t v16 = v35;
  _platform_memset();
  if ((unint64_t)&v11[v4] >= v15)
  {
    int v18 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    int v18 = 0;
    uint64_t v19 = v16 - (void)v11;
    uint64_t v20 = *MEMORY[0x1E4F14C80];
    uint64_t v21 = -*MEMORY[0x1E4F14C80];
    while (1)
    {
      uint64_t v22 = *(void *)((v14 & 0xFFFFFFFFFF800000 | (2
                                                     * (((v14 - (v14 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                      + v19
                      + 40);
      if ((*(_DWORD *)((v14 & 0xFFFFFFFFFF800000 | (2
                                                     * (((v14 - (v14 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                      + v19
                      + 40) & 0x7FFF) == 0)
        break;
      if ((v22 & 0x8000) != 0)
      {
        unint64_t v24 = (v14 + v20 + 9) & v21;
        unint64_t v23 = (unint64_t)(v22 & 0x7FFF) << 9;
        unint64_t v25 = (v14 + v23 - 2) & v21;
        BOOL v26 = v25 >= v24;
        unint64_t v27 = v25 - v24;
        if (!v26) {
          unint64_t v27 = 0;
        }
        v17 += v27;
      }
      else
      {
        if (((unsigned __int16)v22 & 0x7FFFu) <= 0x3FF) {
          ++v36[v22 & 0x7FFF];
        }
        ++v18;
        unint64_t v23 = (unint64_t)(v22 & 0x7FFF) << 9;
      }
      v14 += v23;
      if (v14 >= v15) {
        goto LABEL_20;
      }
    }
    v10("*** error with %p: msize=%d, free: %x\n", (const void *)v14, 0, v22 & 0x8000);
  }
LABEL_20:
  uint64_t result = _simple_salloc();
  if (result)
  {
    int v29 = *(_DWORD *)(v16 + 24);
    _simple_sprintf();
    _simple_sprintf();
    _simple_sprintf();
    if (v2 | v4) {
      _simple_sprintf();
    }
    if (v29 != -1) {
      _simple_sprintf();
    }
    _simple_sprintf();
    if (v34 >= 2 && v18)
    {
      _simple_sappend();
      uint64_t v30 = 0;
      __int16 v31 = v36;
      do
      {
        if (*v31++) {
          _simple_sprintf();
        }
        v30 += 512;
      }
      while (v30 != 0x80000);
    }
    uint64_t v33 = (const char *)_simple_string();
    v10("%s\n", v33);
    return _simple_sfree();
  }
  return result;
}

void small_free_list_check(uint64_t a1, unsigned int a2)
{
  if ((*(_DWORD *)(a1 + 608) & 0x80000000) != 0) {
    return;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = -1;
  uint64_t v5 = a2;
  while (1)
  {
    int v6 = 0;
    int v7 = (os_unfair_lock_s *)(*(void *)(a1 + 624) + 2560 * v4);
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v7, (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v6) {
      os_unfair_lock_lock_with_options();
    }
    unint64_t v8 = *(void *)(*(void *)(a1 + 624) + 2560 * v4 + 8 * v5 + 32);
    if (!v8) {
      goto LABEL_38;
    }
    unint64_t v9 = 0;
    int v10 = 0;
    unint64_t v11 = *(void *)(*(void *)(a1 + 624) + 2560 * v4 + 8 * v5 + 32);
LABEL_7:
    BOOL v12 = (v8 & 0xFFFFFFFFFF800000 | 0x7FA6) <= v11 && (v8 & 0xFFFFFFFFFF800000 | 0x81F8) > v11;
    int v13 = !v12;
    unint64_t v14 = v11;
    if (v12)
    {
      if ((*(_WORD *)(v11 + 16) & 0x8000) == 0) {
        goto LABEL_38;
      }
      unint64_t v14 = (v8 & 0xFFFFFFFFFF800000) + ((unint64_t)(*(_WORD *)(v11 + 16) & 0x7FFF) << 9);
    }
    if (!v14) {
      goto LABEL_38;
    }
    unint64_t v15 = v14 & 0xFFFFFFFFFF800000;
    if ((*(__int16 *)((v14 & 0xFFFFFFFFFF800000 | (2
                                                    * (((v14 - (v14 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF)))
                     + 0x28) & 0x80000000) == 0)
    {
      BOOL v26 = " (slot=%u), counter=%d\n*** in-use ptr in free list slot=%u count=%d ptr=%p\n";
      goto LABEL_43;
    }
    if ((v14 & 0x1FF) != 0) {
      break;
    }
    uint64_t v16 = *(uint64_t **)(a1 + 24);
    uint64_t v17 = *v16;
    if (!*v16)
    {
LABEL_42:
      BOOL v26 = " (slot=%u), counter=%d\n*** ptr not in szone slot=%d count=%d ptr=%p\n";
      goto LABEL_43;
    }
    uint64_t v18 = v16[2];
    unint64_t v19 = (0x9E3779B97F4A7C55 * (v15 >> 20)) >> -*((unsigned char *)v16 + 8);
    unint64_t v20 = v19;
    while (1)
    {
      uint64_t v21 = *(void *)(v18 + 8 * v20);
      if (!v21) {
        goto LABEL_42;
      }
      if (v21 == v15) {
        break;
      }
      if (v20 + 1 == v17) {
        unint64_t v20 = 0;
      }
      else {
        ++v20;
      }
      if (v20 == v19) {
        goto LABEL_42;
      }
    }
    if (!v15) {
      goto LABEL_42;
    }
    if (v13)
    {
      uint64_t v22 = *(void *)(a1 + 632) ^ a1;
      uint64_t v23 = v22 ^ *(void *)v11;
      if (*(unsigned __int8 *)(v11 + 8) != (BYTE4(v23)
                                                            + v23
                                                            + ((HIDWORD(v23) + v23) >> 16)
                                                            + ((unsigned __int16)(WORD2(v23)
                                                                                + v23
                                                                                + ((HIDWORD(v23) + v23) >> 16)) >> 8)))
        goto LABEL_49;
      if (v9 != *(void *)v11)
      {
LABEL_48:
        BOOL v26 = " (slot=%u), counter=%d\n*** previous incorrectly set slot=%u count=%d ptr=%p\n";
        goto LABEL_43;
      }
      unint64_t v8 = *(void *)(v11 + 16);
      if (*(unsigned __int8 *)(v11 + 24) != (((v22 ^ v8) >> 32)
                                                             + (v22 ^ v8)
                                                             + ((((v22 ^ v8) >> 32) + (v22 ^ v8)) >> 16)
                                                             + ((unsigned __int16)(((v22 ^ v8) >> 32)
                                                                                 + (v22 ^ v8)
                                                                                 + ((((v22 ^ v8) >> 32)
                                                                                                 + (v22 ^ v8)) >> 16)) >> 8)))
      {
LABEL_49:
        free_list_checksum_botch(a1);
        __break(1u);
        return;
      }
    }
    else
    {
      if (v9 != *(void *)v11) {
        goto LABEL_48;
      }
      unint64_t v8 = *(void *)(v11 + 8);
    }
    ++v10;
    unint64_t v9 = v11;
    unint64_t v11 = v8;
    if (v8) {
      goto LABEL_7;
    }
LABEL_38:
    int v24 = *(_DWORD *)(StatusReg + 24);
    int v25 = v24;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v7, (unsigned int *)&v25, 0, memory_order_release, memory_order_relaxed);
    if (v25 != v24) {
      os_unfair_lock_unlock(v7);
    }
    if (++v4 >= *(int *)(a1 + 608)) {
      return;
    }
  }
  BOOL v26 = " (slot=%u), counter=%d\n*** unaligned ptr in free list slot=%u count=%d ptr=%p\n";
LABEL_43:
  malloc_zone_check_fail((uint64_t)"check: small free list incorrect", (uint64_t)v26);
  int v27 = *(_DWORD *)(StatusReg + 24);
  int v28 = v27;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v7, (unsigned int *)&v28, 0, memory_order_release, memory_order_relaxed);
  if (v28 != v27) {
    os_unfair_lock_unlock(v7);
  }
}

void free_list_checksum_botch(uint64_t a1)
{
}

unint64_t small_madvise_free_range_no_lock(unint64_t result, os_unfair_lock_s *a2, uint64_t a3, unint64_t a4, unsigned int a5, unint64_t a6, uint64_t a7)
{
  uint64_t v10 = result;
  unint64_t v11 = a4 & 0xFFFFFFFFFF800000;
  if (a4)
  {
    if (v11 + 32678 > a4 || v11 + 33272 <= a4)
    {
      unint64_t v16 = a4 & 0xFFFFFFFFFF800000;
      unint64_t v15 = a4;
    }
    else
    {
      __int16 v12 = *(_WORD *)(a4 + 16);
      int v13 = v12;
      unint64_t v14 = v11 + ((unint64_t)(v12 & 0x7FFF) << 9);
      if (v13 < 0) {
        unint64_t v15 = v14;
      }
      else {
        unint64_t v15 = 0;
      }
      unint64_t v16 = a4 & 0xFFFFFFFFFF800000;
    }
  }
  else
  {
    unint64_t v16 = 0;
    unint64_t v15 = 0;
  }
  BOOL v18 = v11 + 32678 > a4;
  unint64_t v17 = v11 + 33272;
  BOOL v18 = !v18 && v17 > a4;
  int v19 = !v18;
  uint64_t v20 = 10;
  if (!v19) {
    uint64_t v20 = 0;
  }
  uint64_t v21 = *MEMORY[0x1E4F14C58];
  unint64_t v22 = (*MEMORY[0x1E4F14C58] + v20 + v15) & ~*MEMORY[0x1E4F14C58];
  unint64_t v23 = (v15 + ((unint64_t)a5 << 9)) & ~*MEMORY[0x1E4F14C58];
  if (v22 < v23)
  {
    unint64_t v24 = (a6 + a7 + v20 + v21) & ~v21;
    unint64_t v25 = v22 <= (~v21 & a6) ? ~v21 & a6 : v22;
    unint64_t v26 = v23 >= v24 ? v24 : (v15 + ((unint64_t)a5 << 9)) & ~*MEMORY[0x1E4F14C58];
    if (v25 < v26)
    {
      if (!a4) {
        LOBYTE(v19) = 1;
      }
      unint64_t v27 = a4;
      if ((v19 & 1) == 0)
      {
        __int16 v28 = *(_WORD *)(a4 + 16);
        unint64_t v29 = v16 + ((unint64_t)(v28 & 0x7FFF) << 9);
        if (v28 < 0) {
          unint64_t v27 = v29;
        }
        else {
          unint64_t v27 = 0;
        }
      }
      unint64_t v30 = ((v27 - (v27 & 0xFF800000 | 0x8200)) >> 9) & 0x3FFF;
      unint64_t v31 = ((unint64_t)(v27 + (a5 << 9) - 33281) >> 9) & 0x3FFF;
      if (v30 > v31) {
        purgeable_ptr_in_use_enumerator_cold_1(result);
      }
      unint64_t v32 = (v27 & 0xFFFFFFFFFF800000) + 40;
      *(_WORD *)(v32 + 2 * v30) &= ~0x8000u;
      *(_WORD *)(v32 + 2 * v31) &= ~0x8000u;
      small_free_list_remove_ptr_no_clear(result, (uint64_t)a2, a4, a5);
      atomic_fetch_add((atomic_uint *volatile)(a3 + 28), 1u);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      int v34 = *(_DWORD *)(StatusReg + 24);
      int v35 = v34;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v35, 0, memory_order_release, memory_order_relaxed);
      if (v35 != v34) {
        os_unfair_lock_unlock(a2);
      }
      mvm_madvise_free(v10, a3, v25, v26, v10 + 640, *(_DWORD *)(v10 + 620) & 0x20);
      int v36 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v36, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v36) {
        os_unfair_lock_lock_with_options();
      }
      atomic_fetch_add((atomic_uint *volatile)(a3 + 28), 0xFFFFFFFF);
      return small_free_list_add_ptr(v10, (uint64_t)a2, v15, a5);
    }
  }
  return result;
}

unint64_t small_free_try_depot_unmap_no_lock(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 16)) {
    return 0;
  }
  if (*(int *)(a3 + 28) > 0) {
    return 0;
  }
  unsigned int v5 = *(_DWORD *)(a2 + 2172);
  if (v5 < recirc_retained_regions) {
    return 0;
  }
  uint64_t v7 = *(void *)a3;
  unint64_t v8 = *(void **)(a3 + 8);
  if (*(void *)a3)
  {
    *(void *)(v7 + 8) = v8;
    unint64_t v8 = *(void **)(a3 + 8);
  }
  else
  {
    *(void *)(a2 + 2176) = v8;
  }
  if (!v8) {
    unint64_t v8 = (void *)(a2 + 2184);
  }
  *unint64_t v8 = v7;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_DWORD *)(a2 + 2172) = v5 - 1;
  unint64_t v9 = a3 & 0xFFFFFFFFFF800000;
  if (small_free_detach_region((uint64_t)a1, a2, a3 & 0xFFFFFFFFFF800000))
  {
    malloc_zone_error(a1[155]._os_unfair_lock_opaque, 1, (uint64_t)"small_free_try_depot_unmap_no_lock objects_in_use not zero: %d\n");
    return 0;
  }
  if (!rack_region_remove(a1, a3 & 0xFFFFFFFFFF800000, a3)) {
    return 0;
  }
  *(void *)(a2 + 2160) -= 8355328;
  return v9;
}

uint64_t trace_decode(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4)
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    do
    {
      uint64_t v6 = 0;
      unint64_t v7 = 0;
      uint64_t v8 = 0;
      do
      {
        if (!(v5 - a2 + v8)) {
          return v4;
        }
        char v9 = *(unsigned char *)(a1 + v5 + v8);
        v7 |= (unint64_t)(v9 & 0x7F) << v6;
        ++v8;
        v6 += 7;
      }
      while ((v9 & 0x80) == 0);
      if (!v8) {
        return v4;
      }
      if (v4) {
        uint64_t v10 = *(void *)(a3 + 8 * v4 - 8);
      }
      else {
        uint64_t v10 = 0;
      }
      v5 += v8;
      *(void *)(a3 + 8 * v4++) = v10 + 4 * (-(uint64_t)(v7 & 1) ^ (v7 >> 1));
    }
    while (v4 != a4);
  }
  return a4;
}

void *rack_init(uint64_t a1, int a2, int a3, int a4)
{
  *(_OWORD *)(a1 + 32) = xmmword_1931C7390;
  uint64_t v8 = a1 + 32;
  *(_DWORD *)(a1 + 4) = a2;
  *(void *)(a1 + 88) = a1 + 32;
  *(void *)(a1 + 24) = a1 + 32;
  *(void *)(a1 + 48) = a1 + 96;
  *(void *)(a1 + 56) = a1 + 64;
  uint64_t result = (void *)_platform_memset();
  uint64_t v10 = malloc_entropy;
  if (a2 == 2) {
    uint64_t v10 = ~malloc_entropy;
  }
  *(void *)(v8 + 600) = v10;
  *(_DWORD *)(v8 + 588) = a4;
  *(_DWORD *)(v8 + 576) = a3;
  *(void *)(v8 + 592) = 0;
  *(void *)(v8 - 24) = 0;
  *(void *)(v8 - 16) = 0;
  if (a3)
  {
    uint64_t result = (void *)mvm_allocate_pages((*MEMORY[0x1E4F14C80] + 2560 * (a3 + 1) - 1) & -*MEMORY[0x1E4F14C80], 0, 1073741827, 1);
    if (!result) {
      rack_init_cold_1();
    }
    unint64_t v11 = result + 320;
    *(void *)(a1 + 624) = result + 320;
    *(_DWORD *)(a1 + 616) = 0;
    unsigned int v12 = a3 - 1;
    if (a3 != 1)
    {
      int v13 = 0;
      unsigned int v14 = 1;
      do
      {
        ++v13;
        v14 *= 2;
      }
      while (v14 <= v12);
      *(_DWORD *)(a1 + 616) = v13;
      unsigned int v12 = v14 - 1;
    }
    *(_DWORD *)(a1 + 612) = v12;
    *(void *)(a1 + 640) = 0;
    *(_DWORD *)a1 = 0;
    void *result = 0;
    if (*(int *)(a1 + 608) >= 1)
    {
      uint64_t v15 = 0;
      do
      {
        void *v11 = 0;
        ++v15;
        v11 += 320;
      }
      while (v15 < *(int *)(a1 + 608));
    }
  }
  return result;
}

uint64_t rack_destroy_regions(uint64_t result)
{
  uint64_t v1 = *(unint64_t **)(result + 24);
  unint64_t v2 = *v1;
  if (*v1)
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    do
    {
      uint64_t result = *(void *)(v1[2] + 8 * v4);
      if ((unint64_t)(result + 1) >= 2)
      {
        uint64_t result = mvm_deallocate_pages();
        *(void *)(*(void *)(*(void *)(v3 + 24) + 16) + 8 * v4) = -1;
        uint64_t v1 = *(unint64_t **)(v3 + 24);
        unint64_t v2 = *v1;
      }
      ++v4;
    }
    while (v2 > v4);
  }
  return result;
}

uint64_t rack_destroy(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 24);
  uint64_t result = v2[2];
  unint64_t v4 = (void *)MEMORY[0x1E4F14C80];
  if (result != a1 + 96) {
    uint64_t result = mvm_deallocate_pages(result, (*MEMORY[0x1E4F14C80] + 8 * *v2 - 1) & -*MEMORY[0x1E4F14C80], 0);
  }
  int v5 = *(_DWORD *)(a1 + 608);
  if (v5 >= 1)
  {
    uint64_t result = mvm_deallocate_pages(*(void *)(a1 + 624) - 2560, (*v4 + 2560 * v5 + 2559) & -*v4, 3);
    *(void *)(a1 + 624) = 0;
  }
  return result;
}

void rack_region_insert(os_unfair_lock_t lock, unint64_t a2)
{
  int v4 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v4, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v4) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v6 = *(void **)&lock[6]._os_unfair_lock_opaque;
  uint64_t v7 = *v6;
  if (*v6 < (unint64_t)(2 * *(void *)&lock[2]._os_unfair_lock_opaque))
  {
    uint64_t v9 = v6[1];
    uint64_t v8 = v6[2];
    uint64_t v10 = 2 * v7;
    mach_vm_address_t pages = mvm_allocate_pages((*MEMORY[0x1E4F14C80] + 16 * v7 - 1) & -*MEMORY[0x1E4F14C80], 0, 0x40000000, 1);
    if (v7)
    {
      uint64_t v12 = 0;
      char v13 = 63 - v9;
      do
      {
        unint64_t v14 = *(void *)(v8 + 8 * v12);
        if (v14 + 1 >= 2)
        {
          unint64_t v15 = (0x9E3779B97F4A7C55 * (v14 >> 20)) >> v13;
          while ((unint64_t)(*(void *)(pages + 8 * v15) + 1) > 1)
          {
            if (v15 + 1 == v10) {
              unint64_t v15 = 0;
            }
            else {
              ++v15;
            }
            if (v15 == (0x9E3779B97F4A7C55 * (v14 >> 20)) >> v13) {
              goto LABEL_15;
            }
          }
          *(void *)(pages + 8 * v15) = v14;
        }
LABEL_15:
        ++v12;
      }
      while (v12 != v7);
    }
    unint64_t v16 = *(uint64_t **)(*(void *)&lock[6]._os_unfair_lock_opaque + 24);
    v16[1] = v9 + 1;
    v16[2] = pages;
    *unint64_t v16 = v10;
    __dmb(0xBu);
    uint64_t v6 = *(void **)(*(void *)&lock[6]._os_unfair_lock_opaque + 24);
    *(void *)&lock[6]._unint64_t os_unfair_lock_opaque = v6;
    uint64_t v7 = *v6;
  }
  uint64_t v17 = v6[2];
  unint64_t v18 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*((unsigned char *)v6 + 8);
  unint64_t v19 = v18;
  while ((unint64_t)(*(void *)(v17 + 8 * v19) + 1) > 1)
  {
    if (v19 + 1 == v7) {
      unint64_t v19 = 0;
    }
    else {
      ++v19;
    }
    if (v19 == v18) {
      goto LABEL_25;
    }
  }
  *(void *)(v17 + 8 * v19) = a2;
LABEL_25:
  ++*(void *)&lock[2]._os_unfair_lock_opaque;
  int v20 = *(_DWORD *)(StatusReg + 24);
  int v21 = v20;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v21, 0, memory_order_release, memory_order_relaxed);
  if (v21 != v20)
  {
    os_unfair_lock_unlock(lock);
  }
}

BOOL rack_region_remove(os_unfair_lock_t lock, unint64_t a2, uint64_t a3)
{
  int v6 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v6) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v8 = *(void *)&lock[6]._os_unfair_lock_opaque;
  uint64_t v9 = *(void **)v8;
  if (*(void *)v8)
  {
    uint64_t v10 = *(void *)(v8 + 16);
    unint64_t v11 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*(unsigned char *)(v8 + 8);
    unint64_t v12 = v11;
    while (1)
    {
      uint64_t v13 = *(void *)(v10 + 8 * v12);
      if (!v13)
      {
LABEL_11:
        uint64_t v9 = 0;
        goto LABEL_13;
      }
      if (v13 == a2) {
        break;
      }
      if ((void *)(v12 + 1) == v9) {
        unint64_t v12 = 0;
      }
      else {
        ++v12;
      }
      if (v12 == v11) {
        goto LABEL_11;
      }
    }
    uint64_t v9 = (void *)(v10 + 8 * v12);
  }
LABEL_13:
  int v14 = *(_DWORD *)(a3 + 36);
  BOOL v15 = (v14 & 1) == 0;
  if (v14) {
    *(_DWORD *)(a3 + 36) = v14 | 2;
  }
  if (v9)
  {
    *uint64_t v9 = -1;
    atomic_fetch_add_explicit((atomic_ullong *volatile)&lock[4], 1uLL, memory_order_relaxed);
  }
  else
  {
    malloc_zone_error(lock[155]._os_unfair_lock_opaque, 1, (uint64_t)"tiny_free_try_depot_unmap_no_lock hash lookup failed: %p\n");
    BOOL v15 = 0;
  }
  int v16 = *(_DWORD *)(StatusReg + 24);
  int v17 = v16;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
  if (v17 != v16) {
    os_unfair_lock_unlock(lock);
  }
  return v15;
}

uint64_t rack_region_maybe_dispose(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1, (unsigned int *)&v8, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v8) {
    os_unfair_lock_lock_with_options();
  }
  unsigned int v10 = *(_DWORD *)(a4 + 36);
  if ((v10 & 2) != 0)
  {
    uint32_t os_unfair_lock_opaque = a1[155]._os_unfair_lock_opaque;
    if ((os_unfair_lock_opaque & 4) != 0) {
      int v12 = -2;
    }
    else {
      int v12 = -4;
    }
    mvm_deallocate_pages(a2, a3, v12 & os_unfair_lock_opaque);
  }
  else
  {
    *(_DWORD *)(a4 + 36) = v10 & 0xFFFFFFFE;
  }
  int v13 = *(_DWORD *)(StatusReg + 24);
  int v14 = v13;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a1, (unsigned int *)&v14, 0, memory_order_release, memory_order_relaxed);
  if (v14 != v13) {
    os_unfair_lock_unlock(a1);
  }
  return (v10 >> 1) & 1;
}

uint64_t rack_get_thread_index(uint64_t a1)
{
  uint64_t result = _os_cpu_number_override;
  if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1)
  {
    __int16 StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2));
    if (*(_DWORD *)(a1 + 608) == ncpuclusters) {
      return (_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) >> 12);
    }
    else {
      return StatusReg & 0xFFF;
    }
  }
  else if (*(_DWORD *)(a1 + 608) == ncpuclusters)
  {
    return *((unsigned __int8 *)_os_cpu_number_override + 0xFFFFFC200);
  }
  return result;
}

void *create_legacy_scalable_zone(uint64_t a1, uint64_t a2)
{
  scalable_uint64_t zone = (void *)create_scalable_zone(a1, a2);
  uint64_t v3 = scalable_zone;
  if (scalable_zone)
  {
    mprotect(scalable_zone, 0xC8uLL, 3);
    v3[5] = legacy_valloc;
    v3[15] = 0;
    mprotect(v3, 0xC8uLL, 1);
  }
  return v3;
}

mach_vm_address_t legacy_valloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *MEMORY[0x1E4F14C58];
  if (*MEMORY[0x1E4F14C58] <= *MEMORY[0x1E4F14C70]) {
    uint64_t v2 = *MEMORY[0x1E4F14C70];
  }
  unint64_t v3 = (v2 + a2) & ~v2;
  int v4 = *MEMORY[0x1E4F14C60];
  if (*MEMORY[0x1E4F14C60] <= *MEMORY[0x1E4F14C78]) {
    LOBYTE(v4) = *MEMORY[0x1E4F14C78];
  }
  return large_malloc(a1, v3 >> v4, 0, 1);
}

mach_vm_address_t mvm_allocate_pages(unint64_t a1, int a2, int a3, int a4)
{
  return mvm_allocate_pages_plat(a1, a2, a3, a4);
}

uint64_t mvm_deferred_reclaim_init()
{
  return mach_vm_reclaim_ringbuffer_init();
}

uint64_t mvm_reclaim_mark_used(uint64_t a1, uint64_t a2, unsigned int a3, char a4)
{
  if ((a4 & 3) == 0) {
    goto LABEL_6;
  }
  uint64_t v4 = 0;
  uint64_t v5 = *MEMORY[0x1E4F14C68];
  if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
    uint64_t v5 = *MEMORY[0x1E4F14C80];
  }
  if (!__CFADD__(2 * v5, a3) && !((2 * v5 + (unint64_t)a3) >> 32))
  {
LABEL_6:
    int v6 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&reclaim_buffer_lock, (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v6) {
      os_unfair_lock_lock_with_options();
    }
    uint64_t v4 = mach_vm_reclaim_mark_used();
    int v8 = *(_DWORD *)(StatusReg + 24);
    int v9 = v8;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&reclaim_buffer_lock, (unsigned int *)&v9, 0, memory_order_release, memory_order_relaxed);
    if (v9 != v8) {
      os_unfair_lock_unlock((os_unfair_lock_t)&reclaim_buffer_lock);
    }
  }
  return v4;
}

uint64_t mvm_reclaim_mark_free(uint64_t a1, unsigned int a2, char a3)
{
  if ((a3 & 3) == 0) {
    goto LABEL_6;
  }
  uint64_t v3 = *MEMORY[0x1E4F14C68];
  if (*MEMORY[0x1E4F14C68] <= *MEMORY[0x1E4F14C80]) {
    uint64_t v3 = *MEMORY[0x1E4F14C80];
  }
  uint64_t v4 = -1;
  if (!__CFADD__(2 * v3, a2) && !((2 * v3 + (unint64_t)a2) >> 32))
  {
LABEL_6:
    int v5 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&reclaim_buffer_lock, (unsigned int *)&v5, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v5) {
      os_unfair_lock_lock_with_options();
    }
    uint64_t v4 = mach_vm_reclaim_mark_free();
    int v7 = *(_DWORD *)(StatusReg + 24);
    int v8 = v7;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&reclaim_buffer_lock, (unsigned int *)&v8, 0, memory_order_release, memory_order_relaxed);
    if (v8 != v7) {
      os_unfair_lock_unlock((os_unfair_lock_t)&reclaim_buffer_lock);
    }
  }
  return v4;
}

uint64_t mvm_reclaim_is_available()
{
  return mach_vm_reclaim_is_available();
}

void *__cdecl malloc_type_zone_valloc(malloc_zone_t *zone, size_t size, malloc_type_id_t type_id)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (type_id <= 1) {
    malloc_type_id_t v5 = 1;
  }
  else {
    malloc_type_id_t v5 = type_id;
  }
  *(void *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    uint64_t result = j__malloc_zone_valloc(zone, size);
  }
  else {
    uint64_t result = (void *)_malloc_zone_valloc((uint64_t)zone, size, 0);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_calloc_outlined(size_t __count, size_t __size, unint64_t a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = a3;
  }
  *(void *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    uint64_t result = (uint64_t)j__calloc(__count, __size);
  }
  else {
    uint64_t result = _malloc_zone_calloc((uint64_t)default_zone, __count, __size, 1);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_realloc_outlined(void *a1, size_t a2, unint64_t a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = a3;
  }
  *(void *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    uint64_t result = (uint64_t)j__realloc(a1, a2);
  }
  else {
    uint64_t result = _realloc(a1, a2);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_aligned_alloc_outlined(size_t __alignment, size_t __size, unint64_t a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = a3;
  }
  *(void *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    uint64_t result = (uint64_t)j__aligned_alloc(__alignment, __size);
  }
  else {
    uint64_t result = _malloc_zone_memalign((uint64_t)default_zone, __alignment, __size, 3, 0);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_posix_memalign_outlined(void **a1, size_t a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 904);
  if (a4 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = a4;
  }
  *(void *)(StatusReg + 904) = v6;
  if (malloc_interposition_compat) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t result = j__posix_memalign(a1, a2, a3);
  }
  else {
    uint64_t result = _posix_memalign((uint64_t *)a1, a2, a3);
  }
  *(void *)(StatusReg + 904) = v5;
  return result;
}

uint64_t _malloc_type_zone_malloc_outlined(malloc_zone_t *a1, size_t a2, unint64_t a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = *(void *)(StatusReg + 904);
  if (a3 <= 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = a3;
  }
  *(void *)(StatusReg + 904) = v5;
  if (malloc_interposition_compat) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6) {
    uint64_t result = (uint64_t)j__malloc_zone_malloc(a1, a2);
  }
  else {
    uint64_t result = _malloc_zone_malloc((uint64_t)a1, a2, 0);
  }
  *(void *)(StatusReg + 904) = v4;
  return result;
}

uint64_t _malloc_type_zone_calloc_outlined(malloc_zone_t *a1, size_t a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 904);
  if (a4 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = a4;
  }
  *(void *)(StatusReg + 904) = v6;
  if (malloc_interposition_compat) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t result = (uint64_t)j__malloc_zone_calloc(a1, a2, a3);
  }
  else {
    uint64_t result = _malloc_zone_calloc((uint64_t)a1, a2, a3, 0);
  }
  *(void *)(StatusReg + 904) = v5;
  return result;
}

uint64_t _malloc_type_zone_realloc_outlined(malloc_zone_t *a1, void *a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 904);
  if (a4 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = a4;
  }
  *(void *)(StatusReg + 904) = v6;
  if (malloc_interposition_compat) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t result = (uint64_t)j__malloc_zone_realloc(a1, a2, a3);
  }
  else {
    uint64_t result = _malloc_zone_realloc((uint64_t)a1, (uint64_t)a2, a3, 0);
  }
  *(void *)(StatusReg + 904) = v5;
  return result;
}

uint64_t _malloc_type_zone_memalign_outlined(malloc_zone_t *a1, size_t a2, size_t a3, unint64_t a4)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v5 = *(void *)(StatusReg + 904);
  if (a4 <= 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = a4;
  }
  *(void *)(StatusReg + 904) = v6;
  if (malloc_interposition_compat) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    uint64_t result = (uint64_t)j__malloc_zone_memalign(a1, a2, a3);
  }
  else {
    uint64_t result = _malloc_zone_memalign((uint64_t)a1, a2, a3, 0, 0);
  }
  *(void *)(StatusReg + 904) = v5;
  return result;
}

uint64_t malloc_type_zone_malloc_with_options_np(malloc_zone_t *a1, size_t a2, size_t a3, uint64_t a4, unint64_t a5)
{
  return malloc_type_zone_malloc_with_options_internal(a1, a2, a3, a5, a4);
}

uint64_t set_msl_lite_hooks(uint64_t (*a1)(uint64_t (**)(), uint64_t))
{
  return a1(malloc_msl_lite_hooks, 24);
}

void insert_msl_lite_zone(uint64_t a1)
{
  lite_uint64_t zone = a1;
  malloc_slowpath_update();
}

uint64_t get_global_helper_zone()
{
  return *(void *)malloc_zones;
}

void mfm_reinit_lock()
{
  if (mfm_arena) {
    *(_DWORD *)mfm_arena = 0;
  }
}

uint64_t mfmi_enumerator(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t (*a5)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))
{
  uint64_t v30 = *MEMORY[0x1E4F14BF8];
  uint64_t v27 = 0;
  uint64_t result = mfmi_read_zone(a1, a4, a5, &v27);
  if (result) {
    return result;
  }
  if ((a3 & 4) != 0)
  {
    uint64_t v28 = a4;
    uint64_t v29 = 0x20000;
    a6(a1, a2, 4, &v28, 1);
    if ((a3 & 2) == 0)
    {
LABEL_4:
      if ((a3 & 1) == 0) {
        return 0;
      }
      goto LABEL_8;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_4;
  }
  uint64_t v28 = a4 + 0x20000;
  uint64_t v29 = 8257536;
  a6(a1, a2, 2, &v28, 1);
  if ((a3 & 1) == 0) {
    return 0;
  }
LABEL_8:
  uint64_t v12 = v27;
  if (!*(void *)(v27 + 8)) {
    return 0;
  }
  unint64_t v13 = 0;
  unsigned int v14 = 0;
  do
  {
    unint64_t v15 = (v13 + 1) >> 5;
    uint64_t v16 = v15 & 0x7FFFFFFFFFFFFFELL;
    uint64_t v17 = v12 + 8 * (v15 & 0x7FFFFFFFFFFFFFELL);
    unint64_t v18 = *(void *)(v17 + 224) >> (v13 + 1);
    if (v18)
    {
      unint64_t v19 = __clz(__rbit64(v18));
LABEL_12:
      unint64_t v20 = v19 + 1;
      goto LABEL_13;
    }
    unint64_t v23 = ((_BYTE)v13 + 1) & 0x3F;
    unint64_t v24 = *(void *)(v17 + 240);
    if (!v24)
    {
      unint64_t v25 = *(void *)(v12 + ((8 * v15) | 8) + 224);
      if (v23 < 0x2E) {
        LODWORD(v26) = 0;
      }
      else {
        uint64_t v26 = *(void *)(v12 + 8 * v16 + 248);
      }
      unint64_t v19 = ((v25 >> v23) | ((unint64_t)(2 * v26) << (v23 ^ 0x3Fu))) & 0x7FFFF;
      goto LABEL_12;
    }
    unint64_t v20 = __clz(__rbit64(v24)) - v23 + 65;
LABEL_13:
    if ((*(void *)(v12 + 224 + ((v13 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v13) & *(void *)(v12
                                                                                                  + 224
                                                                                                  + ((v13 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8))) != 0)
    {
      uint64_t v21 = v12;
      if (v14 == 32)
      {
        ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))a6)(a1, a2, 1, &v28);
        unsigned int v14 = 0;
        uint64_t v21 = v27;
      }
      unint64_t v22 = &v28 + 2 * v14;
      *unint64_t v22 = v12 + 16 * v13 + 0x20000 + a4 - v21;
      v22[1] = 16 * v20;
      ++v14;
      uint64_t v12 = v21;
    }
    v13 += v20;
  }
  while (v13 < *(void *)(v12 + 8));
  if (v14) {
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *))a6)(a1, a2, 1, &v28);
  }
  return 0;
}

unint64_t mfmi_good_size(uint64_t a1, unint64_t a2)
{
  if (a2 > 0x4000) {
    return 0;
  }
  else {
    return (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
}

uint64_t mfmi_check()
{
  return 1;
}

uint64_t mfmi_print_self(uint64_t a1, int a2)
{
  uint64_t result = mfm_arena;
  if (mfm_arena) {
    return print_mfm_arena(mfm_arena, a2 != 0, (void (*)(const char *, ...))malloc_report_simple);
  }
  return result;
}

void mfmi_force_unlock()
{
  uint64_t v0 = (os_unfair_lock_s *)mfm_arena;
  if (mfm_arena)
  {
    int v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    int v2 = v1;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v0, (unsigned int *)&v2, 0, memory_order_release, memory_order_relaxed);
    if (v2 != v1) {
      os_unfair_lock_unlock(v0);
    }
  }
}

void mfmi_statistics_self(int a1, _DWORD *a2)
{
  unint64_t v3 = mfm_arena;
  bzero(a2, 0x20uLL);
  if (v3)
  {
    unint64_t v4 = *(void *)(v3 + 16);
    *a2 = *(void *)(v3 + 24);
    uint64_t v5 = 16 * *(unsigned int *)(v3 + 4);
    *((void *)a2 + 3) = 0x800000;
    uint64_t v6 = ((((v4 >> 2) & 0x1FFFFFFFFFFFFFF8) + *MEMORY[0x1E4F14C80] + 223) & -*MEMORY[0x1E4F14C80])
       + *((void *)a2 + 2)
       + ((*MEMORY[0x1E4F14C80] + 16 * v4 - 1) & -*MEMORY[0x1E4F14C80]);
    *((void *)a2 + 1) = v5;
    *((void *)a2 + 2) = v6;
  }
}

uint64_t mfmi_locked()
{
  uint64_t v0 = (os_unfair_lock_s *)mfm_arena;
  if (!mfm_arena) {
    return 0;
  }
  int v1 = 0;
  uint64_t v2 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v0, (unsigned int *)&v1, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (!v1)
  {
    int v4 = *(_DWORD *)(StatusReg + 24);
    int v5 = v4;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v0, (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
    if (v5 != v4) {
      os_unfair_lock_unlock(v0);
    }
    return 1;
  }
  return v2;
}

void mfmi_reinit_lock()
{
  if (mfm_arena) {
    *(_DWORD *)mfm_arena = 0;
  }
}

uint64_t mfmi_print_task(uint64_t a1, unsigned int a2, const void *a3, uint64_t (*a4)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t (*a5)(const char *, ...))
{
  uint64_t v9 = 0;
  if (mfmi_read_zone(a1, (uint64_t)a3, a4, &v9)) {
    return a5("Failed to read ProbGuard zone at %p\n", a3);
  }
  else {
    return print_mfm_arena(v9, a2 > 1, (void (*)(const char *, ...))a5);
  }
}

uint64_t print_mfm_arena(uint64_t a1, char a2, void (*a3)(const char *, ...))
{
  a3("mfm_arena info\n");
  a3(" address      : %p\n", (const void *)a1);
  a3(" size         : %zd\n", 16 * *(unsigned int *)(a1 + 4));
  a3(" high water   : %zd\n", 16 * *(void *)(a1 + 8));
  a3(" arena        : [%p, %p)\n", (const void *)(a1 + 0x20000), (const void *)(a1 + 0x800000));
  a3("\n");
  a3("freelists\n");
  for (uint64_t i = 0; i != 11; ++i)
  {
    uint64_t v6 = a1 + 16 * i;
    a3(" size %-8zd:\n", 16 << i);
    uint64_t v9 = *(void *)(v6 + 32);
    int v8 = (uint64_t *)(v6 + 32);
    for (uint64_t j = v9; ; uint64_t j = *v10)
    {
      unsigned int v10 = (uint64_t *)(a1 + 16 * j);
      if (v10 == v8) {
        break;
      }
      unint64_t v11 = ((16 * j - 0x20000) >> 4) + 1;
      unint64_t v12 = v11 >> 5;
      uint64_t v13 = (v11 >> 5) & 0x7FFFFFFFFFFFFFELL;
      uint64_t v14 = a1 + 8 * v13;
      unint64_t v15 = *(void *)(v14 + 224) >> v11;
      if (v15)
      {
        unint64_t v16 = __clz(__rbit64(v15)) + 1;
LABEL_6:
        a3("  [%p, %p) size=%zd\n", (const void *)(a1 + 16 * j), &v10[2 * v16], 16 * v16);
        continue;
      }
      unint64_t v17 = v11 & 0x3F;
      unint64_t v18 = *(void *)(v14 + 240);
      if (v18)
      {
        unint64_t v16 = __clz(__rbit64(v18)) - v17 + 65;
        goto LABEL_6;
      }
      unint64_t v19 = *(void *)(a1 + ((8 * v12) | 8) + 224);
      if (v17 < 0x2E) {
        LODWORD(v20) = 0;
      }
      else {
        uint64_t v20 = *(void *)(a1 + 8 * v13 + 248);
      }
      uint64_t v21 = (((v19 >> v17) | ((unint64_t)(2 * v20) << (v17 ^ 0x3Fu))) & 0x7FFFF)
          + 1;
      a3("  [%p, %p) size=%zd\n", (const void *)(a1 + 16 * j), &v10[2 * v21], 16 * v21);
    }
  }
  uint64_t result = ((uint64_t (*)(const char *))a3)("\n");
  if (a2)
  {
    a3("blocks\n");
    unint64_t v23 = *(void *)(a1 + 8);
    if (v23)
    {
      unint64_t v24 = 0;
      do
      {
        unint64_t v25 = (v24 + 1) >> 5;
        uint64_t v26 = v25 & 0x7FFFFFFFFFFFFFELL;
        uint64_t v27 = a1 + 8 * (v25 & 0x7FFFFFFFFFFFFFELL);
        unint64_t v28 = *(void *)(v27 + 224) >> (v24 + 1);
        if (v28)
        {
          unint64_t v29 = __clz(__rbit64(v28));
        }
        else
        {
          unint64_t v32 = ((_BYTE)v24 + 1) & 0x3F;
          unint64_t v33 = *(void *)(v27 + 240);
          if (v33)
          {
            unint64_t v30 = __clz(__rbit64(v33)) - v32 + 65;
            goto LABEL_21;
          }
          unint64_t v34 = *(void *)(a1 + ((8 * v25) | 8) + 224);
          if (v32 < 0x2E) {
            LODWORD(v35) = 0;
          }
          else {
            uint64_t v35 = *(void *)(a1 + 8 * v26 + 248);
          }
          unint64_t v29 = ((v34 >> v32) | ((unint64_t)(2 * v35) << (v32 ^ 0x3Fu))) & 0x7FFFF;
        }
        unint64_t v30 = v29 + 1;
LABEL_21:
        if ((*(void *)(a1 + 224 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0)) & (1 << v24) & *(void *)(a1 + 224 + ((v24 >> 2) & 0x3FFFFFFFFFFFFFF0 | 8))) != 0) {
          unint64_t v31 = "*";
        }
        else {
          unint64_t v31 = " *";
        }
        a3(" %c[%p, %p) size=%zd\n", *v31, (const void *)(a1 + 16 * v24 + 0x20000), (const void *)(a1 + 16 * v24 + 0x20000 + 16 * v30), 16 * v30);
        v24 += v30;
        unint64_t v23 = *(void *)(a1 + 8);
      }
      while (v24 < v23);
    }
    a3("  [%p, %p) size=%zd (bump)\n", (const void *)(a1 + 16 * v23 + 0x20000), (const void *)(a1 + 0x800000), 8257536 - 16 * v23);
    return ((uint64_t (*)(const char *))a3)("\n");
  }
  return result;
}

uint64_t xzm_segment_table_foreach(unsigned int *a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6 = a2;
  if (a4)
  {
    unint64_t v8 = *a4;
    if (a2) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  unint64_t v8 = 0;
  if (!a2)
  {
LABEL_11:
    uint64_t result = 0;
    if (a4) {
      *a4 = v8;
    }
    return result;
  }
LABEL_5:
  while (1)
  {
    unsigned int v9 = *a1++;
    unint64_t v10 = (unint64_t)v9 << 14;
    if (v9 && v8 != v10)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, unint64_t))(a3 + 16))(a3, v10);
      unint64_t v8 = v10;
      if (result) {
        return result;
      }
    }
    if (!--v6) {
      goto LABEL_11;
    }
  }
}

uint64_t xzm_ptr_in_use_enumerator(uint64_t task, uint64_t a2, char a3, unint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, void **), void (*a6)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))
{
  BOOL v7 = a5;
  if (!a5)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    BOOL v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, void **))_malloc_default_reader_2;
  }
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  unint64_t v30 = 0;
  uint64_t result = _xzm_introspect_map_zone_and_main(task, a4, v7, &v32, &v31, &v30);
  if (!result)
  {
    unint64_t v14 = v30;
    uint64_t v15 = v31;
    BOOL v16 = v30 == a4;
    if (v30 != a4
      || (uint64_t result = mfm_introspect(task, a2, a3, *(void *)(v31 + 336), (uint64_t (*)(task_name_t, uint64_t, uint64_t, void *))v7, a6), !result))
    {
      v26[0] = MEMORY[0x1E4F14BE8];
      v26[1] = 0x40000000;
      v26[2] = __xzm_ptr_in_use_enumerator_block_invoke;
      v26[3] = &__block_descriptor_tmp;
      BOOL v28 = (a3 & 4) != 0;
      BOOL v29 = v16;
      int v27 = task;
      v26[4] = a6;
      v26[5] = a2;
      v21[0] = MEMORY[0x1E4F14BE8];
      v21[1] = 0x40000000;
      v21[2] = __xzm_ptr_in_use_enumerator_block_invoke_3;
      v21[3] = &__block_descriptor_tmp_4;
      BOOL v23 = v28;
      int v22 = task;
      v21[4] = a6;
      v21[5] = a2;
      BOOL v24 = (a3 & 2) != 0;
      char v25 = a3 & 1;
      if (v14 == a4)
      {
        unint64_t v17 = v18;
        v18[0] = MEMORY[0x1E4F14BE8];
        v18[1] = 0x40000000;
        v18[2] = __xzm_ptr_in_use_enumerator_block_invoke_4;
        v18[3] = &__block_descriptor_tmp_6;
        BOOL v20 = (a3 & 2) != 0;
        int v19 = task;
        v18[4] = a6;
        v18[5] = a2;
      }
      else
      {
        unint64_t v17 = 0;
      }
      return _xzm_introspect_enumerate(task, (uint64_t (*)(void))v7, a4, v32, v14, v15, a3 & 1, (uint64_t)v26, (uint64_t)&__block_literal_global, (uint64_t)v21, (uint64_t)v17);
    }
  }
  return result;
}

void xzm_print_self(const void *a1)
{
}

void xzm_print_task(uint64_t a1, uint64_t a2, const void *a3, uint64_t (*a4)(void), void (*a5)(const char *, ...))
{
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(a1 + 52) && *(unsigned char *)(a1 + 53))
  {
    v4[0] = a2;
    v4[1] = a3;
    (*(void (**)(void, void, uint64_t, void *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 4, v4, 1);
  }
  return 0;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_2()
{
  return 0;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  int v13 = *(unsigned char *)(a4 + 32) & 0xF;
  if (*(unsigned char *)(a1 + 52)) {
    BOOL v14 = v13 == 7;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    uint64_t v18 = a2;
    unint64_t v19 = 0x4000;
    (*(void (**)(void, void, uint64_t, uint64_t *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 4, &v18, 1);
  }
  int v15 = *(unsigned __int8 *)(a1 + 53);
  if (*(unsigned char *)(a1 + 53) || *(unsigned char *)(a1 + 54))
  {
    uint64_t v18 = a6;
    unint64_t v19 = (unint64_t)a5 << 14;
    if (v13 == 5 || v13 == 2)
    {
      if (v15) {
        (*(void (**)(void, void, uint64_t, uint64_t *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 2, &v18, 1);
      }
      if (*(unsigned char *)(a1 + 54)) {
        (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 1, a8, a9);
      }
    }
    else
    {
      (*(void (**)(void, void, uint64_t, uint64_t *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 3, &v18, 1);
    }
  }
  return 0;
}

uint64_t __xzm_ptr_in_use_enumerator_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  if (*(unsigned char *)(a1 + 52) && (*(unsigned char *)(a3 + 20) != 1 || (*(unsigned char *)(a4 + 32) & 0xF) != 7))
  {
    v7[0] = a6;
    v7[1] = (unint64_t)a5 << 14;
    (*(void (**)(void, void, uint64_t, void *, uint64_t))(a1 + 32))(*(unsigned int *)(a1 + 48), *(void *)(a1 + 40), 2, v7, 1);
  }
  return 0;
}

uint64_t __xzm_print_block_invoke(uint64_t a1, mach_vm_offset_t address, unint64_t a3, const char *a4)
{
  uint64_t result = *(unsigned int *)(a1 + 64);
  if (!result) {
    return result;
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  mach_vm_offset_t v10 = *(void *)(v9 + 24);
  unint64_t v11 = (unint64_t *)MEMORY[0x1E4F14C80];
  unint64_t v12 = *MEMORY[0x1E4F14C80];
  if (v10 > address || v10 + v12 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < a3 + address)
  {
    *(void *)(v9 + 24) = address;
    mach_vm_size_t v13 = a3 / v12;
    if (a3 % v12) {
      ++v13;
    }
    unint64_t v14 = 0x400000 / v12;
    if (v13 <= v14) {
      mach_vm_size_t v15 = v14;
    }
    else {
      mach_vm_size_t v15 = v13;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    mach_vm_size_t v17 = *(void *)(v16 + 24);
    if (v15 > v17)
    {
      mach_vm_address_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      unint64_t v19 = (vm_map_t *)MEMORY[0x1E4F14C48];
      if (v18)
      {
        mach_vm_deallocate(*MEMORY[0x1E4F14C48], v18, 4 * v17);
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
        uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
      }
      *(void *)(v16 + 24) = v15;
      uint64_t result = mach_vm_allocate(*v19, (mach_vm_address_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 4 * *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 1);
      if (result) {
        return result;
      }
      LODWORD(result) = *(_DWORD *)(a1 + 64);
    }
    mach_vm_size_t dispositions_count = v15;
    if (a3 <= 0x400000) {
      mach_vm_size_t v20 = 0x400000;
    }
    else {
      mach_vm_size_t v20 = a3;
    }
    uint64_t result = mach_vm_page_range_query(result, address, v20, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), &dispositions_count);
    if (result) {
      return result;
    }
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"dispositions\": \"", a4);
  BOOL v28 = a4;
  if (*v11 > a3)
  {
    uint64_t v23 = 0;
    uint64_t v22 = 0;
LABEL_29:
    (*(void (**)(const char *))(a1 + 56))("\", \n");
    (*(void (**)(const char *, ...))(a1 + 56))("%s    \"dirty_count\": %zu, \n", v28, v23);
    (*(void (**)(const char *, ...))(a1 + 56))("%s    \"swapped_count\": %zu, \n", v28, v22);
    return 0;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    mach_vm_offset_t v24 = (address - *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) / *v11;
    while (v24 < *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      int v25 = *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + 4 * v24);
      if ((v25 & 8) != 0)
      {
        ++v23;
        int v27 = "d";
      }
      else
      {
        unint64_t v26 = v25 & 0x10;
        if (v26) {
          int v27 = "s";
        }
        else {
          int v27 = "c";
        }
        v22 += v26 >> 4;
      }
      (*(void (**)(const char *))(a1 + 56))(v27);
      ++v24;
      if (++v21 >= a3 / *v11) {
        goto LABEL_29;
      }
    }
    return 5;
  }
}

uint64_t __xzm_print_block_invoke_2(uint64_t a1, const void *a2, uint64_t a3, const char *a4)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    (*(void (**)(const char *))(a1 + 56))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s\"%p\": {\n", a4, a2);
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"addr\": \"%p\", \n", a4, a2);
  unint64_t v8 = 0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*(void *)a3 - *(void *)(*(void *)(a1 + 64) + 392)) >> 4);
  uint64_t v9 = "unknown";
  if ((v8 & 0xFC) == 0) {
    uint64_t v9 = off_1E574D100[(char)v8];
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"segment_group\": \"%s\", \n", a4, v9);
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"body_addr\": \"%p\", \n", a4, *(const void **)(a3 + 48));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"used\": %u, \n", a4, *(_DWORD *)(a3 + 8));
  mach_vm_offset_t v10 = "huge_segment";
  if (*(unsigned char *)(a3 + 20) != 1) {
    mach_vm_offset_t v10 = "unknown";
  }
  if (*(unsigned char *)(a3 + 20)) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = "normal_segment";
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"kind\": \"%s\", \n", a4, v11);
  if (*(void *)(a3 + 40) == -1) {
    unint64_t v12 = "%s    \"reclaim_id\": -1, \n";
  }
  else {
    unint64_t v12 = "%s    \"reclaim_id\": %llu, \n";
  }
  (*(void (**)(const char *))(a1 + 56))(v12);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a3 + 48));
  }
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"slice_count\": %u, \n", a4, *(_DWORD *)(a3 + 12));
  (*(void (**)(const char *, ...))(a1 + 56))("%s    \"slice_entry_count\": %u \n", a4, *(_DWORD *)(a3 + 16));
  (*(void (**)(const char *, ...))(a1 + 56))("%s}\n", a4);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return 0;
}

uint64_t __xzm_print_block_invoke_3(uint64_t a1, const void *a2, int a3, unsigned int a4)
{
  (*(void (**)(const char *))(a1 + 48))("    ");
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    (*(void (**)(const char *))(a1 + 48))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 48))("\"%p\": {\n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"addr\": \"%p\", \n", a2);
  if (a4 > 3) {
    unint64_t v8 = "unknown slab";
  }
  else {
    unint64_t v8 = off_1E574D120[(char)a4];
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v8);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  (*(void (**)(const char *, ...))(a1 + 48))("        \"size\": %u \n", a3);
  (*(void (**)(const char *))(a1 + 48))("    }\n");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  return 0;
}

uint64_t __xzm_print_block_invoke_4(uint64_t a1, unsigned char *a2, void *a3, uint64_t a4, int a5, const void *a6, uint64_t a7)
{
  (*(void (**)(const char *))(a1 + 48))("    ");
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    (*(void (**)(const char *))(a1 + 48))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 48))("\"%p\": {\n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"addr\": \"%p\", \n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"metadata_addr\": \"%p\", \n", (const void *)(a2 - (unsigned char *)a3 + a4));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"mzone\": %d, \n", *(unsigned __int16 *)(a4 + 34));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"xzone\": %d, \n", *(unsigned __int8 *)(a4 + 33));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment\": \"%p\", \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment_group\": %zu, \n", 0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*a3 - *(void *)(*(void *)(a1 + 56) + 392)) >> 4));
  uint64_t v14 = *(unsigned char *)(a4 + 32) & 0xF;
  if (v14 > 8) {
    mach_vm_size_t v15 = "unknown";
  }
  else {
    mach_vm_size_t v15 = off_1E574D140[v14];
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v15);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"slice_count\": %u, \n", a5);
  if (a7) {
    int v16 = *(_DWORD *)(a7 + 48);
  }
  else {
    int v16 = 0;
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        \"block_size\": %u, \n", v16);
  (*(void (**)(const char *))(a1 + 48))("        \"in_use\": 1, \n");
  if (a3[-1431655765 * ((unint64_t)(a4 - (void)a3 - 2104) >> 4) + 7] == -1) {
    mach_vm_size_t v17 = "        \"reclaim_id\": -1, \n";
  }
  else {
    mach_vm_size_t v17 = "        \"reclaim_id\": %llu, \n";
  }
  (*(void (**)(const char *))(a1 + 48))(v17);
  uint64_t v18 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  if (!v18)
  {
    if (v14 == 5 || v14 == 2) {
      (*(void (**)(const char *, ...))(a1 + 48))("        \"bucket\": %u,\n", *(unsigned __int8 *)(a7 + 76));
    }
    if (v14 == 5)
    {
      (*(void (**)(const char *, ...))(a1 + 48))("        \"free\": \"0x%x\",\n", *(_DWORD *)a4);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"used\": %u,\n", *(_DWORD *)(a4 + 4));
      (*(void (**)(const char *))(a1 + 48))("        \"alloc_idx\": %u,\n");
    }
    else if (v14 == 2)
    {
      (*(void (**)(const char *, ...))(a1 + 48))("        \"meta\": \"0x%llx\",\n", *(void *)a4);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_alloc_head\": \"0x%llx\",\n", *(_DWORD *)a4 & 0x7FF);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_free_count\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 11) & 0x7FF);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_alloc_idx\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 22) & 0x3F);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_on_partial_list\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 28) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_on_empty_list\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 29) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_walk_locked\": \"0x%llx\",\n", (*(_DWORD *)a4 >> 30) & 1);
      (*(void (**)(const char *, ...))(a1 + 48))("        \"xca_head_seqno\": \"0x%llx\",\n", (*(void *)a4 >> 38) & 0x1FFFLL);
      (*(void (**)(const char *))(a1 + 48))("        \"xca_seqno\": \"0x%llx\",\n");
    }
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_preallocated\": %d,\n", (*(unsigned __int8 *)(a4 + 32) >> 6) & 1);
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_pristine\": %d\n", (*(unsigned __int8 *)(a4 + 32) >> 4) & 1);
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return v18;
}

uint64_t __xzm_print_block_invoke_5(uint64_t a1, unsigned char *a2, void *a3, uint64_t a4, int a5, const void *a6)
{
  (*(void (**)(const char *))(a1 + 48))("    ");
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    (*(void (**)(const char *))(a1 + 48))(", ");
  }
  (*(void (**)(const char *, ...))(a1 + 48))("\"%p\": {\n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"addr\": \"%p\", \n", a6);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"metadata_addr\": \"%p\", \n", (const void *)(a2 - (unsigned char *)a3 + a4));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"mzone\": %d, \n", *(unsigned __int16 *)(a4 + 34));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"xzone\": %d, \n", *(unsigned __int8 *)(a4 + 33));
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment\": \"%p\", \n", a2);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"segment_group\": %zu, \n", 0xEF7BDEF7BDEF7BDFLL * ((uint64_t)(*a3 - *(void *)(*(void *)(a1 + 56) + 392)) >> 4));
  uint64_t v12 = *(unsigned char *)(a4 + 32) & 0xF;
  if (v12 > 8) {
    mach_vm_size_t v13 = "unknown";
  }
  else {
    mach_vm_size_t v13 = off_1E574D140[v12];
  }
  (*(void (**)(const char *, ...))(a1 + 48))("        \"kind\": \"%s\", \n", v13);
  (*(void (**)(const char *, ...))(a1 + 48))("        \"slice_count\": %u, \n", a5);
  if (a3[-1431655765 * ((unint64_t)(a4 - (void)a3 - 2104) >> 4) + 7] == -1) {
    uint64_t v14 = "        \"reclaim_id\": -1, \n";
  }
  else {
    uint64_t v14 = "        \"reclaim_id\": %llu, \n";
  }
  (*(void (**)(const char *))(a1 + 48))(v14);
  uint64_t v15 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
  if (!v15)
  {
    (*(void (**)(const char *, ...))(a1 + 48))("        \"is_preallocated\": %d,\n", (*(unsigned __int8 *)(a4 + 32) >> 6) & 1);
    (*(void (**)(const char *))(a1 + 48))("        \"in_use\": 0 \n");
    (*(void (**)(const char *))(a1 + 48))("    }\n");
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  return v15;
}

uint64_t main_image_has_section()
{
  image_header = _dyld_get_image_header(0);
  if (!image_header->ncmds) {
    return 0;
  }
  int v1 = image_header;
  int v2 = 0;
  p_cputype = &image_header[1].cputype;
  while (*p_cputype != 25 || _platform_strncmp() && v1->filetype != 1 || !p_cputype[16])
  {
LABEL_11:
    p_cputype = (int32_t *)((char *)p_cputype + p_cputype[1]);
    if (++v2 >= v1->ncmds) {
      return 0;
    }
  }
  unsigned int v4 = 0;
  int v5 = p_cputype + 22;
  while (_platform_strncmp() || _platform_strncmp())
  {
    ++v4;
    v5 += 20;
    if (v4 >= p_cputype[16]) {
      goto LABEL_11;
    }
  }
  return 1;
}

uint64_t pgm_thread_set_disabled(uint64_t result)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v2 = 0xFFFFFFFFLL;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(StatusReg + 880) = v2;
  return result;
}

uint64_t pgm_create_zone(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 104) <= 0xFu) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  my_vm_map_common(0, 16720, 3, 1, 1);
  MEMORY[0x20] = xmmword_1EE3B87A0;
  MEMORY[0x30] = *(_OWORD *)&off_1EE3B87B0;
  MEMORY[0x60] = xmmword_1EE3B87E0;
  MEMORY[0x70] = *(_OWORD *)&off_1EE3B87F0;
  MEMORY[0x40] = xmmword_1EE3B87C0;
  MEMORY[0x50] = *(_OWORD *)&off_1EE3B87D0;
  MEMORY[0xA0] = xmmword_1EE3B8820;
  MEMORY[0xB0] = *(_OWORD *)off_1EE3B8830;
  MEMORY[0x80] = xmmword_1EE3B8800;
  MEMORY[0x90] = unk_1EE3B8810;
  MEMORY[0] = malloc_zone_template_0;
  MEMORY[0x10] = *(_OWORD *)&off_1EE3B8790;
  MEMORY[0xC0] = off_1EE3B8840[0];
  MEMORY[0xC8] = a1;
  if (!*(void *)(a1 + 112)) {
    MEMORY[0x70] = 0;
  }
  if (!*(void *)(a1 + 184)) {
    MEMORY[0xB8] = 0;
  }
  if (!*(void *)(a1 + 120)) {
    MEMORY[0x78] = 0;
  }
  if (!*(void *)(a1 + 136)) {
    MEMORY[0x88] = 0;
  }
  if (!*(void *)(a1 + 152)) {
    MEMORY[0x98] = 0;
  }
  if (!*(void *)(a1 + 192)) {
    MEMORY[0xC0] = 0;
  }
  unint64_t v1 = (unint64_t)env_uint_0("MallocProbGuardMemoryBudgetInKB", 2048) << 10;
  uint64_t v2 = (void *)MEMORY[0x1E4F14C80];
  unint64_t v3 = (*MEMORY[0x1E4F14C80] + 16719) & -*MEMORY[0x1E4F14C80];
  BOOL v4 = v1 >= v3;
  unint64_t v5 = v1 - v3;
  if (!v4
    || (unint64_t v6 = v5 / (unint64_t)((double)(unint64_t)*MEMORY[0x1E4F14C80] + 1600.0 + 80.0 + 768.0), !v6))
  {
    pgm_create_zone_cold_2();
  }
  MEMORY[0xD4] = env_uint_0("MallocProbGuardAllocations", v6);
  MEMORY[0xD0] = env_uint_0("MallocProbGuardSlots", (10 * MEMORY[0xD4]));
  MEMORY[0xD8] = env_uint_0("MallocProbGuardMetadata", (3 * MEMORY[0xD4]));
  uint32_t v7 = arc4random_uniform(0x1194u);
  int v8 = env_uint_0("MallocProbGuardSampleRate", v7 + 500);
  int v9 = 2 * v8;
  if (v8 == 1) {
    int v9 = 1;
  }
  MEMORY[0xDC] = v9;
  mach_vm_offset_t v10 = getenv("MallocProbGuardDebug");
  if (v10) {
    BOOL v11 = *v10 == 49;
  }
  else {
    BOOL v11 = 0;
  }
  MEMORY[0xE0] = v11;
  MEMORY[0xE8] = env_uint_0("MallocProbGuardDebugLogThrottleInMillis", 1000);
  if (MEMORY[0xE0]) {
    malloc_report(6u, (uint64_t)"ProbGuard configuration: %u kB budget, 1/%u sample rate, %u/%u/%u allocations/metadata/slots\n");
  }
  if (!MEMORY[0xD4] || MEMORY[0xD4] > MEMORY[0xD8] >> 1 || MEMORY[0xD8] > MEMORY[0xD0] || !MEMORY[0xDC]) {
    pgm_create_zone_cold_3();
  }
  MEMORY[0xF0] = *v2 * ((2 * MEMORY[0xD0]) | 1u);
  MEMORY[0x108] = MEMORY[0xF0] + 0x4000000;
  my_vm_map_common(0, MEMORY[0xF0] + 0x4000000, 0, 1, 1);
  MEMORY[0x110] = 0;
  MEMORY[0xF8] = 0x2000000;
  MEMORY[0x100] = MEMORY[0xF0] + 0x2000000;
  my_vm_map_common(0x2000000, MEMORY[0xF0], 0, 0x4000, 13);
  MEMORY[0x118] = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(MEMORY[0xC8] + 32))(MEMORY[0xC8], MEMORY[0xD0], 8, v12, v13);
  uint64_t v16 = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(MEMORY[0xC8] + 32))(MEMORY[0xC8], MEMORY[0xD8], 256, v14, v15);
  MEMORY[0x120] = v16;
  if (!MEMORY[0x118] || !v16) {
    purgeable_ptr_in_use_enumerator_cold_1(v16);
  }
  MEMORY[0x4128] = 0;
  my_vm_protect(0, 0x4000, 1);
  return 0;
}

uint64_t pgm_extract_report_from_corpse()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  uint64_t v2 = v1;
  unsigned int v4 = v3;
  unint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  unint64_t v11 = v0;
  int v12 = 0;
  uint64_t v55 = *MEMORY[0x1E4F14BF8];
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&crash_reporter_lock_0, (unsigned int *)&v12, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v12) {
    uint64_t v0 = os_unfair_lock_lock_with_options();
  }
  if (!v2) {
    purgeable_ptr_in_use_enumerator_cold_1(v0);
  }
  g_crm_reader_0 = v2;
  num_read_memory_0 = 0;
  if (!v4)
  {
LABEL_21:
    uint64_t v18 = 5;
    goto LABEL_22;
  }
  uint64_t v14 = v4;
  while (1)
  {
    uint64_t v15 = *v6;
    LODWORD(v35[0]) = 0;
    unsigned int zone_type = get_zone_type(v8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _DWORD **))memory_reader_adapter_0, v15, v35);
    if (LODWORD(v35[0]) == 2) {
      unsigned int v17 = 0;
    }
    else {
      unsigned int v17 = 257;
    }
    if (zone_type) {
      uint64_t v18 = zone_type;
    }
    else {
      uint64_t v18 = v17;
    }
    free_read_memory();
    if (v18 == 257) {
      goto LABEL_20;
    }
    if (v18) {
      goto LABEL_22;
    }
    uint64_t v19 = *v6;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v36 = 0u;
    memset(v35, 0, sizeof(v35));
    uint64_t zone = read_zone(v8, v19, (uint64_t (*)(task_name_t, uint64_t, uint64_t, const void **))memory_reader_adapter_0, (uint64_t)v35, 6);
    if (zone)
    {
      uint64_t v18 = zone;
      free_read_memory();
      if (v18 != 257) {
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    if (*((void *)&v38 + 1) <= v11 && (unint64_t)v39 > v11) {
      break;
    }
    free_read_memory();
LABEL_20:
    ++v6;
    if (!--v14) {
      goto LABEL_21;
    }
  }
  unint64_t v24 = lookup_slot((uint64_t)v35, v11);
  if (v36 <= v24) {
    purgeable_ptr_in_use_enumerator_cold_1(v24);
  }
  uint64_t v25 = *((void *)&v40 + 1);
  unint64_t v26 = (_DWORD *)(*((void *)&v40 + 1) + 8 * v24);
  if (DWORD2(v36) <= *v26 >> 2) {
    purgeable_ptr_in_use_enumerator_cold_1(v24);
  }
  if ((*v26 & 3) == 0)
  {
    int v27 = "low";
    BOOL v28 = "long-range OOB";
    goto LABEL_36;
  }
  if ((*v26 & 3) == 2)
  {
    if ((v24 & 0x7FFFFFFE00000000) != 0)
    {
      if ((HIDWORD(v24) & 0x7FFFFFFE) != 2) {
        purgeable_ptr_in_use_enumerator_cold_1(v24);
      }
      int v27 = "low";
      BOOL v28 = "OOB + UAF";
    }
    else
    {
      int v27 = "high";
      BOOL v28 = "use-after-free";
    }
LABEL_36:
    uint64_t v18 = 0;
    *(void *)uint64_t v10 = v28;
    *(void *)(v10 + 8) = v27;
    *(void *)(v10 + 16) = v11;
    unint64_t v29 = (unint64_t)*v26 >> 2;
    uint64_t v30 = v41;
    uint64_t v31 = v25 + 8 * v24;
    *(void *)(v10 + 24) = *((void *)&v38 + 1)
                          + *MEMORY[0x1E4F14C80] * ((2 * v24) | 1)
                          + *(unsigned __int16 *)(v31 + 6);
    *(void *)(v10 + 32) = *(unsigned __int16 *)(v31 + 4);
    *(void *)(v10 + 40) = slot_state_labels[*v26 & 3];
    *(_DWORD *)(v10 + 48) = 0;
    if (*(_DWORD *)(v30 + (v29 << 8)) == v24)
    {
      *(_DWORD *)(v10 + 48) = 1;
      uint64_t v32 = v30 + (v29 << 8);
      unsigned int v33 = *(unsigned __int16 *)(v32 + 20);
      *(_OWORD *)(v10 + 56) = *(_OWORD *)(v32 + 4);
      *(_DWORD *)(v10 + 72) = trace_decode(v32 + 40, v33, v10 + 80, 64);
      if ((*v26 & 3) == 2)
      {
        ++*(_DWORD *)(v10 + 48);
        uint64_t v34 = v32 + *(unsigned __int16 *)(v32 + 20) + 40;
        *(_OWORD *)(v10 + 592) = *(_OWORD *)(v32 + 22);
        uint64_t v18 = 0;
        *(_DWORD *)(v10 + 608) = trace_decode(v34, *(unsigned __int16 *)(v32 + 38), v10 + 616, 64);
      }
      else
      {
        uint64_t v18 = 0;
      }
    }
  }
  else
  {
    if ((HIDWORD(v24) & 0x7FFFFFFF) == 3)
    {
      int v27 = "high";
      BOOL v28 = "out-of-bounds";
      goto LABEL_36;
    }
    malloc_report(0x223u, (uint64_t)"Failed to generate PGM report for fault address %p: slot is unexpectedly allocated with bounds %d\n");
    uint64_t v18 = 5;
  }
  free_read_memory();
LABEL_22:
  int v21 = *(_DWORD *)(StatusReg + 24);
  int v22 = v21;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&crash_reporter_lock_0, (unsigned int *)&v22, 0, memory_order_release, memory_order_relaxed);
  if (v22 != v21) {
    os_unfair_lock_unlock(&crash_reporter_lock_0);
  }
  return v18;
}

uint64_t pgm_valloc(uint64_t a1, unint64_t a2)
{
  unsigned int v4 = (unint64_t *)MEMORY[0x1E4F14C80];
  unint64_t v5 = (os_unfair_lock_s *)(a1 + 16680);
  if (*MEMORY[0x1E4F14C80] >= a2 && *(_DWORD *)(a1 + 16684) != *(_DWORD *)(a1 + 212))
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v8 = *(_DWORD *)(StatusReg + 880);
    if (v8 != -1)
    {
      if (v8)
      {
        uint32_t v10 = v8 - 1;
      }
      else
      {
        uint64_t v9 = *(unsigned int *)(a1 + 220);
        if (!v9) {
          purgeable_ptr_in_use_enumerator_cold_1(v9);
        }
        uint32_t v10 = arc4random_uniform(v9);
      }
      *(void *)(StatusReg + 880) = v10;
      if (!v10)
      {
        int v13 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v5, (unsigned int *)&v13, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v13) {
          os_unfair_lock_lock_with_options();
        }
        uint64_t v14 = allocate(a1, a2, *v4);
        int v15 = *(_DWORD *)(StatusReg + 24);
        int v16 = v15;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v5, (unsigned int *)&v16, 0, memory_order_release, memory_order_relaxed);
        if (v16 != v15) {
          os_unfair_lock_unlock(v5);
        }
        if (v14) {
          return v14;
        }
      }
    }
  }
  unint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 40);

  return v11();
}

uint64_t pgm_realloc(uint64_t a1, const void *a2, unint64_t a3)
{
  if (a2)
  {
    unint64_t v6 = (atomic_uint *)(a1 + 16680);
    if (*MEMORY[0x1E4F14C80] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
      goto LABEL_13;
    }
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v9 = *(_DWORD *)(StatusReg + 880);
    if (v9 == -1) {
      goto LABEL_13;
    }
    if (v9)
    {
      uint32_t v11 = v9 - 1;
    }
    else
    {
      uint64_t v10 = *(unsigned int *)(a1 + 220);
      if (!v10) {
        purgeable_ptr_in_use_enumerator_cold_1(v10);
      }
      uint32_t v11 = arc4random_uniform(v10);
    }
    *(void *)(StatusReg + 880) = v11;
    if (v11)
    {
LABEL_13:
      if (*(void *)(a1 + 248) > (unint64_t)a2 || *(void *)(a1 + 256) <= (unint64_t)a2)
      {
        int v12 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 56);
        return v12();
      }
      int v14 = 0;
    }
    else
    {
      int v14 = 1;
    }
    int v15 = 0;
    unint64_t v16 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v15, *(_DWORD *)(v16 + 24), memory_order_acquire, memory_order_acquire);
    if (v15) {
      os_unfair_lock_lock_with_options();
    }
    unsigned int v17 = reallocate(a1, a2, a3, v14);
    int v18 = *(_DWORD *)(v16 + 24);
    int v19 = v18;
    atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v19, 0, memory_order_release, memory_order_relaxed);
    if (v19 != v18) {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
    }
    return (uint64_t)v17;
  }
  else
  {
    return pgm_malloc(a1, a3);
  }
}

uint64_t pgm_destroy(mach_vm_address_t a1)
{
  malloc_destroy_zone(*(malloc_zone_t **)(a1 + 200));
  my_vm_deallocate(*(void *)(a1 + 272), *(void *)(a1 + 264));

  return my_vm_deallocate(a1, 16720);
}

uint64_t pgm_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (*MEMORY[0x1E4F14C80] >= a2)
  {
    unint64_t v6 = (atomic_uint *)(a1 + 16680);
    if (*MEMORY[0x1E4F14C80] >= a3 && *(_DWORD *)(a1 + 16684) != *(_DWORD *)(a1 + 212))
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      int v9 = *(_DWORD *)(StatusReg + 880);
      if (v9 != -1)
      {
        if (v9)
        {
          uint32_t v11 = v9 - 1;
        }
        else
        {
          uint64_t v10 = *(unsigned int *)(a1 + 220);
          if (!v10) {
            purgeable_ptr_in_use_enumerator_cold_1(v10);
          }
          uint32_t v11 = arc4random_uniform(v10);
        }
        *(void *)(StatusReg + 880) = v11;
        if (!v11)
        {
          int v14 = 0;
          if (a2 <= 0x10) {
            unint64_t v15 = 16;
          }
          else {
            unint64_t v15 = a2;
          }
          atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v14, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
          if (v14) {
            os_unfair_lock_lock_with_options();
          }
          uint64_t v16 = allocate(a1, a3, v15);
          int v17 = *(_DWORD *)(StatusReg + 24);
          int v18 = v17;
          atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v18, 0, memory_order_release, memory_order_relaxed);
          if (v18 != v17) {
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
          }
          if (v16) {
            return v16;
          }
        }
      }
    }
  }
  int v12 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 112);

  return v12();
}

uint64_t pgm_claimed_address(void *a1, unint64_t a2)
{
  if (a1[31] <= a2 && a1[32] > a2) {
    return 1;
  }
  else {
    return (*(uint64_t (**)(void))(a1[25] + 136))();
  }
}

uint64_t pgm_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  if (*MEMORY[0x1E4F14C80] < a2) {
    goto LABEL_12;
  }
  int v8 = (atomic_uint *)(a1 + 16680);
  if (*MEMORY[0x1E4F14C80] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    goto LABEL_12;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v11 = *(_DWORD *)(StatusReg + 880);
  if (v11 == -1) {
    goto LABEL_12;
  }
  if (v11)
  {
    uint32_t v13 = v11 - 1;
  }
  else
  {
    uint64_t v12 = *(unsigned int *)(a1 + 220);
    if (!v12) {
      purgeable_ptr_in_use_enumerator_cold_1(v12);
    }
    uint32_t v13 = arc4random_uniform(v12);
  }
  *(void *)(StatusReg + 880) = v13;
  if (v13) {
    goto LABEL_12;
  }
  int v16 = 0;
  if (a2 <= 0x10) {
    unint64_t v17 = 16;
  }
  else {
    unint64_t v17 = a2;
  }
  atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v16, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v16) {
    os_unfair_lock_lock_with_options();
  }
  int v18 = (void *)allocate(a1, a3, v17);
  int v19 = *(_DWORD *)(StatusReg + 24);
  int v20 = v19;
  atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v20, 0, memory_order_release, memory_order_relaxed);
  if (v20 != v19) {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  }
  if (!v18)
  {
LABEL_12:
    int v14 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 152);
    return v14();
  }
  else
  {
    if (a4) {
      bzero(v18, a3);
    }
    return (uint64_t)v18;
  }
}

uint64_t pgm_malloc_type_malloc(uint64_t a1, unint64_t a2)
{
  unsigned int v4 = (os_unfair_lock_s *)(a1 + 16680);
  if (*MEMORY[0x1E4F14C80] >= a2 && *(_DWORD *)(a1 + 16684) != *(_DWORD *)(a1 + 212))
  {
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v7 = *(_DWORD *)(StatusReg + 880);
    if (v7 != -1)
    {
      if (v7)
      {
        uint32_t v9 = v7 - 1;
      }
      else
      {
        uint64_t v8 = *(unsigned int *)(a1 + 220);
        if (!v8) {
          purgeable_ptr_in_use_enumerator_cold_1(v8);
        }
        uint32_t v9 = arc4random_uniform(v8);
      }
      *(void *)(StatusReg + 880) = v9;
      if (!v9)
      {
        int v12 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v4, (unsigned int *)&v12, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v12) {
          os_unfair_lock_lock_with_options();
        }
        uint64_t v13 = allocate(a1, a2, 0x10uLL);
        int v14 = *(_DWORD *)(StatusReg + 24);
        int v15 = v14;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v4, (unsigned int *)&v15, 0, memory_order_release, memory_order_relaxed);
        if (v15 != v14) {
          os_unfair_lock_unlock(v4);
        }
        if (v13) {
          return v13;
        }
      }
    }
  }
  uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 160);

  return v10();
}

uint64_t pgm_malloc_type_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (!is_mul_ok(a2, a3)) {
    goto LABEL_12;
  }
  unint64_t v6 = (atomic_uint *)(a1 + 16680);
  if (*MEMORY[0x1E4F14C80] < a2 * a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    goto LABEL_12;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v9 = *(_DWORD *)(StatusReg + 880);
  if (v9 == -1) {
    goto LABEL_12;
  }
  if (v9)
  {
    uint32_t v11 = v9 - 1;
  }
  else
  {
    uint64_t v10 = *(unsigned int *)(a1 + 220);
    if (!v10) {
      purgeable_ptr_in_use_enumerator_cold_1(v10);
    }
    uint32_t v11 = arc4random_uniform(v10);
  }
  *(void *)(StatusReg + 880) = v11;
  if (v11) {
    goto LABEL_12;
  }
  int v14 = 0;
  atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v14, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v14) {
    os_unfair_lock_lock_with_options();
  }
  int v15 = (void *)allocate(a1, a2 * a3, 0x10uLL);
  int v16 = *(_DWORD *)(StatusReg + 24);
  int v17 = v16;
  atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
  if (v17 != v16) {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  }
  if (!v15)
  {
LABEL_12:
    int v12 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 168);
    return v12();
  }
  else
  {
    bzero(v15, a2 * a3);
    return (uint64_t)v15;
  }
}

uint64_t pgm_malloc_type_realloc(uint64_t a1, const void *a2, unint64_t a3)
{
  if (a2)
  {
    unint64_t v6 = (atomic_uint *)(a1 + 16680);
    if (*MEMORY[0x1E4F14C80] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
      goto LABEL_13;
    }
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    int v9 = *(_DWORD *)(StatusReg + 880);
    if (v9 == -1) {
      goto LABEL_13;
    }
    if (v9)
    {
      uint32_t v11 = v9 - 1;
    }
    else
    {
      uint64_t v10 = *(unsigned int *)(a1 + 220);
      if (!v10) {
        purgeable_ptr_in_use_enumerator_cold_1(v10);
      }
      uint32_t v11 = arc4random_uniform(v10);
    }
    *(void *)(StatusReg + 880) = v11;
    if (v11)
    {
LABEL_13:
      if (*(void *)(a1 + 248) > (unint64_t)a2 || *(void *)(a1 + 256) <= (unint64_t)a2)
      {
        int v12 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 176);
        return v12();
      }
      int v14 = 0;
    }
    else
    {
      int v14 = 1;
    }
    int v15 = 0;
    unint64_t v16 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v15, *(_DWORD *)(v16 + 24), memory_order_acquire, memory_order_acquire);
    if (v15) {
      os_unfair_lock_lock_with_options();
    }
    int v17 = reallocate(a1, a2, a3, v14);
    int v18 = *(_DWORD *)(v16 + 24);
    int v19 = v18;
    atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v19, 0, memory_order_release, memory_order_relaxed);
    if (v19 != v18) {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
    }
    return (uint64_t)v17;
  }
  else
  {
    return pgm_malloc_type_malloc(a1, a3);
  }
}

uint64_t pgm_malloc_type_memalign(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (*MEMORY[0x1E4F14C80] >= a2)
  {
    unint64_t v6 = (atomic_uint *)(a1 + 16680);
    if (*MEMORY[0x1E4F14C80] >= a3 && *(_DWORD *)(a1 + 16684) != *(_DWORD *)(a1 + 212))
    {
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      int v9 = *(_DWORD *)(StatusReg + 880);
      if (v9 != -1)
      {
        if (v9)
        {
          uint32_t v11 = v9 - 1;
        }
        else
        {
          uint64_t v10 = *(unsigned int *)(a1 + 220);
          if (!v10) {
            purgeable_ptr_in_use_enumerator_cold_1(v10);
          }
          uint32_t v11 = arc4random_uniform(v10);
        }
        *(void *)(StatusReg + 880) = v11;
        if (!v11)
        {
          int v14 = 0;
          if (a2 <= 0x10) {
            unint64_t v15 = 16;
          }
          else {
            unint64_t v15 = a2;
          }
          atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v14, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
          if (v14) {
            os_unfair_lock_lock_with_options();
          }
          uint64_t v16 = allocate(a1, a3, v15);
          int v17 = *(_DWORD *)(StatusReg + 24);
          int v18 = v17;
          atomic_compare_exchange_strong_explicit(v6, (unsigned int *)&v18, 0, memory_order_release, memory_order_relaxed);
          if (v18 != v17) {
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
          }
          if (v16) {
            return v16;
          }
        }
      }
    }
  }
  int v12 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 184);

  return v12();
}

uint64_t pgm_malloc_type_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4)
{
  if (*MEMORY[0x1E4F14C80] < a2) {
    goto LABEL_12;
  }
  uint64_t v8 = (atomic_uint *)(a1 + 16680);
  if (*MEMORY[0x1E4F14C80] < a3 || *(_DWORD *)(a1 + 16684) == *(_DWORD *)(a1 + 212)) {
    goto LABEL_12;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  int v11 = *(_DWORD *)(StatusReg + 880);
  if (v11 == -1) {
    goto LABEL_12;
  }
  if (v11)
  {
    uint32_t v13 = v11 - 1;
  }
  else
  {
    uint64_t v12 = *(unsigned int *)(a1 + 220);
    if (!v12) {
      purgeable_ptr_in_use_enumerator_cold_1(v12);
    }
    uint32_t v13 = arc4random_uniform(v12);
  }
  *(void *)(StatusReg + 880) = v13;
  if (v13) {
    goto LABEL_12;
  }
  int v16 = 0;
  if (a2 <= 0x10) {
    unint64_t v17 = 16;
  }
  else {
    unint64_t v17 = a2;
  }
  atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v16, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v16) {
    os_unfair_lock_lock_with_options();
  }
  int v18 = (void *)allocate(a1, a3, v17);
  int v19 = *(_DWORD *)(StatusReg + 24);
  int v20 = v19;
  atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v20, 0, memory_order_release, memory_order_relaxed);
  if (v20 != v19) {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16680));
  }
  if (!v18)
  {
LABEL_12:
    int v14 = *(uint64_t (**)(void))(*(void *)(a1 + 200) + 192);
    return v14();
  }
  else
  {
    if (a4) {
      bzero(v18, a3);
    }
    return (uint64_t)v18;
  }
}

unint64_t lookup_slot(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 248);
  unint64_t v3 = a2 - v2;
  if (a2 < v2 || (unint64_t v4 = *(void *)(a1 + 256), v4 <= a2)) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  unint64_t v5 = *MEMORY[0x1E4F14C80];
  if (v2 % *MEMORY[0x1E4F14C80]) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  if (v5 + v2 <= a2)
  {
    if (v4 - v5 <= a2)
    {
      unsigned int v6 = *(_DWORD *)(a1 + 208) - 1;
    }
    else if (((v3 / v5) & 1) == 0 && a2 % v5 >= v5 >> 1)
    {
      unsigned int v6 = (((v3 / v5) - 1) >> 1) + 1;
    }
    else
    {
      unsigned int v6 = ((v3 / v5) - 1) >> 1;
    }
  }
  else
  {
    unsigned int v6 = 0;
  }
  uint64_t v8 = *(void *)(a1 + 280);
  uint64_t v9 = v6;
  if ((v3 / v5))
  {
    uint64_t v12 = v8 + 8 * v6;
    unsigned int v13 = *(unsigned __int16 *)(v12 + 6);
    unsigned int v14 = (unsigned __int16)(a2 % v5);
    if (v14 == v13)
    {
      uint64_t v11 = 0;
      char v10 = 1;
    }
    else
    {
      char v10 = 0;
      BOOL v15 = v14 < (unsigned __int16)(*(_WORD *)(v12 + 4) + v13) && v14 > v13;
      uint64_t v11 = 0x200000000;
      if (v15) {
        uint64_t v11 = 0x100000000;
      }
    }
  }
  else
  {
    char v10 = 0;
    uint64_t v11 = 0x300000000;
  }
  BOOL v16 = (v10 & ((*(_DWORD *)(v8 + 8 * v9) & 3) == 1)) == 0;
  unint64_t v17 = 0x8000000000000000;
  if (v16) {
    unint64_t v17 = 0;
  }
  return v11 | v9 | v17;
}

BOOL pgm_check(uint64_t a1)
{
  BOOL result = check_zone(a1);
  if (result)
  {
    BOOL result = check_slots(a1);
    if (result) {
      return check_metadata(a1);
    }
  }
  return result;
}

BOOL check_zone(uint64_t a1)
{
  unsigned int v1 = *(_DWORD *)(a1 + 212);
  if (!v1) {
    return 0;
  }
  unsigned int v2 = *(_DWORD *)(a1 + 216);
  if (v1 > v2 >> 1) {
    return 0;
  }
  unsigned int v3 = *(_DWORD *)(a1 + 208);
  if (v2 > v3) {
    return 0;
  }
  unint64_t v4 = *(unsigned int *)(a1 + 220);
  if (v4)
  {
    unint64_t v5 = *(void *)(a1 + 240);
    unint64_t v6 = *MEMORY[0x1E4F14C80];
    if (v5 != *MEMORY[0x1E4F14C80] * ((2 * v3) | 1)) {
      return 0;
    }
    unint64_t v7 = *(void *)(a1 + 248);
    if (v7 % v6) {
      return 0;
    }
    unint64_t v4 = v5 % v6;
    if (v4) {
      return 0;
    }
    unint64_t v9 = *(void *)(a1 + 256);
    if (v7 + v5 == v9 && v7 < v9)
    {
      if (*(void *)(a1 + 264) != v5 + 0x4000000) {
        return 0;
      }
      unint64_t v4 = 0;
      unint64_t v10 = *(void *)(a1 + 272);
      if (v10 != v7 - 0x2000000 || v10 >= v7) {
        return v4;
      }
      unsigned int v11 = *(_DWORD *)(a1 + 16684);
      if (v11 > v1) {
        return 0;
      }
      unint64_t v4 = 0;
      unsigned int v12 = *(_DWORD *)(a1 + 16688);
      if (v11 > v12 || v12 > v2) {
        return v4;
      }
      if (*(_DWORD *)(a1 + 16692) >= v3) {
        return 0;
      }
      unint64_t v4 = *(void *)(a1 + 280);
      if (v4)
      {
        unint64_t v4 = *(void *)(a1 + 288);
        if (v4) {
          return *(void *)(a1 + 16696) <= *(void *)(a1 + 16704);
        }
      }
    }
  }
  return v4;
}

BOOL check_slots(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 208);
  if (v1)
  {
    uint64_t v2 = 0;
    int v3 = 0;
    unint64_t v4 = *MEMORY[0x1E4F14C80];
    for (uint64_t i = (unsigned __int16 *)(*(void *)(a1 + 280) + 6); ; i += 4)
    {
      unsigned int v6 = *(_DWORD *)(i - 3);
      int v7 = v6 & 3;
      if ((v6 & 3) != 0)
      {
        if (v7 == 3) {
          return 0;
        }
        if (*(_DWORD *)(a1 + 16688) <= v6 >> 2) {
          return 0;
        }
        unint64_t v8 = *(i - 1);
        if (v4 < v8) {
          return 0;
        }
        uint64_t v9 = (v8 + 15) & 0x1FFF0;
        if (!*(i - 1)) {
          uint64_t v9 = 16;
        }
        if (v9 != v8) {
          return 0;
        }
        uint64_t v10 = 0;
        unint64_t v11 = *i;
        if (v4 < v11 || (v11 & 0xF) != 0 || v11 + v8 > v4) {
          return v10;
        }
        if (v7 == 1)
        {
          ++v3;
          v2 += v8;
        }
      }
      if (!--v1) {
        return v3 == *(_DWORD *)(a1 + 16684) && v2 == *(void *)(a1 + 16696);
      }
    }
  }
  int v3 = 0;
  uint64_t v2 = 0;
  return v3 == *(_DWORD *)(a1 + 16684) && v2 == *(void *)(a1 + 16696);
}

BOOL check_metadata(uint64_t a1)
{
  unint64_t v1 = *(unsigned int *)(a1 + 16688);
  if (v1)
  {
    uint64_t v2 = *(unsigned int **)(a1 + 288);
    unint64_t v3 = *(unsigned int *)(a1 + 208);
    unint64_t v4 = *v2;
    if (v4 >= v3)
    {
      return 0;
    }
    else
    {
      BOOL v5 = 0;
      unsigned int v6 = v2 + 64;
      unint64_t v7 = 1;
      do
      {
        if (v7 - 1 != (unint64_t)*(unsigned int *)(*(void *)(a1 + 280) + 8 * v4) >> 2) {
          break;
        }
        if (*((unsigned __int16 *)v6 - 109) + (unint64_t)*((unsigned __int16 *)v6 - 118) >= 0xD9) {
          break;
        }
        BOOL v5 = v7 >= v1;
        if (v1 == v7) {
          break;
        }
        unint64_t v4 = *v6;
        v6 += 64;
        ++v7;
      }
      while (v4 < v3);
    }
  }
  else
  {
    return 1;
  }
  return v5;
}

uint64_t deallocate(uint64_t a1, unint64_t a2)
{
  unint64_t v4 = lookup_slot(a1, a2);
  if ((v4 & 0x8000000000000000) == 0) {
    deallocate_cold_1(a2);
  }
  unsigned int v5 = v4;
  uint64_t v6 = *(void *)(a1 + 280);
  uint64_t v7 = 8 * v4;
  uint64_t v8 = *(unsigned int *)(v6 + v7);
  *(_DWORD *)(v6 + v7) = v8 & 0xFFFFFFFC | 2;
  uint64_t v9 = *(void *)(a1 + 288) + ((v8 << 6) & 0x3FFFFFFF00);
  *(void *)(v9 + 22) = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  *(void *)(v9 + 30) = mach_absolute_time();
  if (*(unsigned __int16 *)(v9 + 20) >= 0x6Cu) {
    uint64_t v10 = 108;
  }
  else {
    uint64_t v10 = *(unsigned __int16 *)(v9 + 20);
  }
  *(_WORD *)(v9 + 20) = v10;
  uint64_t v11 = trace_collect(v9 + v10 + 40, 216 - v10);
  int v12 = *(_DWORD *)(a1 + 16684);
  *(_WORD *)(v9 + 38) = v11;
  *(_DWORD *)(a1 + 16684) = v12 - 1;
  *(void *)(a1 + 16696) -= *(unsigned __int16 *)(*(void *)(a1 + 280) + v7 + 4);
  if (*(_DWORD *)(a1 + 208) <= v5) {
    purgeable_ptr_in_use_enumerator_cold_1(v11);
  }
  unsigned int v13 = (uint64_t *)MEMORY[0x1E4F14C80];
  unsigned int v14 = (void *)(*(void *)(a1 + 248) + *MEMORY[0x1E4F14C80] * ((2 * v5) | 1));
  uint64_t v15 = madvise(v14, *MEMORY[0x1E4F14C80], 7);
  if (v15) {
    purgeable_ptr_in_use_enumerator_cold_1(v15);
  }
  my_vm_protect((mach_vm_address_t)v14, *v13, 0);

  return debug_zone(a1, (uint64_t)"freed", a2);
}

void *reallocate(uint64_t a1, const void *a2, unint64_t a3, int a4)
{
  BOOL v8 = *(void *)(a1 + 248) <= (unint64_t)a2 && *(void *)(a1 + 256) > (unint64_t)a2;
  if (!(v8 | a4)) {
    purgeable_ptr_in_use_enumerator_cold_1(a1);
  }
  if (!v8)
  {
    unint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 200) + 16))();
    if (v11) {
      goto LABEL_8;
    }
LABEL_13:
    reallocate_cold_2((uint64_t)a2);
  }
  unint64_t v9 = lookup_slot(a1, (unint64_t)a2);
  if ((v9 & 0x8000000000000000) == 0) {
    goto LABEL_13;
  }
  uint64_t v10 = *(void *)(a1 + 280) + 8 * v9;
  unint64_t v11 = *(unsigned __int16 *)(v10 + 4);
  if (!*(_WORD *)(v10 + 4)) {
    goto LABEL_13;
  }
LABEL_8:
  if (a4 && *(_DWORD *)(a1 + 16684) != *(_DWORD *)(a1 + 212))
  {
    int v12 = (void *)allocate(a1, a3, 0x10uLL);
    if (!v12) {
      purgeable_ptr_in_use_enumerator_cold_1(0);
    }
  }
  else
  {
    int v12 = (void *)(*(uint64_t (**)(void))(*(void *)(a1 + 200) + 24))();
    if (!v12) {
      return v12;
    }
  }
  if (v11 >= a3) {
    size_t v13 = a3;
  }
  else {
    size_t v13 = v11;
  }
  memcpy(v12, a2, v13);
  if (v8) {
    deallocate(a1, (unint64_t)a2);
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 200) + 48))();
  }
  return v12;
}

uint64_t my_vm_deallocate(mach_vm_address_t address, uint64_t a2)
{
  uint64_t result = mach_vm_deallocate(*MEMORY[0x1E4F14C48], address, (a2 + *MEMORY[0x1E4F14C80] - 1) & -*MEMORY[0x1E4F14C80]);
  if (result) {
    purgeable_ptr_in_use_enumerator_cold_1(result);
  }
  return result;
}

uint64_t pgm_enumerator()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  uint64_t v39 = *MEMORY[0x1E4F14BF8];
  if ((v2 & 3) != 0)
  {
    uint64_t v6 = v5;
    char v7 = v2;
    uint64_t v8 = v1;
    uint64_t v9 = v0;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v20 = 0u;
    memset(v19, 0, sizeof(v19));
    uint64_t result = read_zone(v0, v3, v4, (uint64_t)v19, 2);
    if (result) {
      return result;
    }
    unint64_t v11 = v20;
    if (v20)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      unint64_t v14 = 0;
      uint64_t v15 = (uint64_t *)MEMORY[0x1E4F14C80];
      do
      {
        if ((*(_DWORD *)(*((void *)&v24 + 1) + 4 * v13) & 3) == 1)
        {
          if ((v7 & 2) != 0)
          {
            uint64_t v16 = *v15;
            uint64_t v17 = *((void *)&v22 + 1) + *v15 * (v13 & 0xFFFFFFFE | 1);
            uint64_t v18 = v16;
            uint64_t result = v6(v9, v8, 2, &v17, 1);
            unint64_t v11 = v20;
          }
          if (v7)
          {
            if (v14 >= v11) {
              purgeable_ptr_in_use_enumerator_cold_1(result);
            }
            uint64_t v17 = *((void *)&v22 + 1)
                + *v15 * (v13 & 0xFFFFFFFE | 1)
                + *(unsigned __int16 *)(*((void *)&v24 + 1) + v12 + 6);
            uint64_t v18 = 0;
            uint64_t v18 = *(unsigned __int16 *)(*((void *)&v24 + 1) + v12 + 4);
            uint64_t result = v6(v9, v8, 1, &v17, 1);
            unint64_t v11 = v20;
          }
        }
        ++v14;
        v13 += 2;
        v12 += 8;
      }
      while (v14 < v11);
    }
  }
  return 0;
}

uint64_t pgm_good_size(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 200) + 96)) {
    uint64_t v1 = *(void *)(*(void *)(a1 + 200) + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t pgm_print(uint64_t a1, int a2)
{
  return print_zone(a1, a2, (void (*)(const char *, ...))malloc_report_simple);
}

atomic_uint *pgm_force_lock(uint64_t a1)
{
  int v1 = 0;
  uint64_t result = (atomic_uint *)(a1 + 16680);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    return (atomic_uint *)os_unfair_lock_lock_with_options();
  }
  return result;
}

void pgm_force_unlock(os_unfair_lock_s *a1)
{
  int v1 = a1 + 4170;
  int v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v3 = v2;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v1, (unsigned int *)&v3, 0, memory_order_release, memory_order_relaxed);
  if (v3 != v2) {
    os_unfair_lock_unlock(v1);
  }
}

__n128 pgm_statistics(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 16684);
  uint64_t v3 = *MEMORY[0x1E4F14C80] * v2;
  *(_DWORD *)a2 = v2;
  __n128 result = *(__n128 *)(a1 + 16696);
  *(__n128 *)(a2 + 8) = result;
  *(void *)(a2 + 24) = v3;
  return result;
}

BOOL pgm_zone_locked(os_unfair_lock_s *a1)
{
  int v1 = 0;
  uint64_t v2 = a1 + 4170;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v2, (unsigned int *)&v1, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  BOOL v4 = v1 == 0;
  if (!v1)
  {
    int v5 = *(_DWORD *)(StatusReg + 24);
    int v6 = v5;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v2, (unsigned int *)&v6, 0, memory_order_release, memory_order_relaxed);
    if (v6 != v5) {
      os_unfair_lock_unlock(v2);
    }
  }
  return !v4;
}

uint64_t pgm_reinit_lock(uint64_t result)
{
  *(_DWORD *)(result + 16680) = 0;
  return result;
}

uint64_t pgm_print_task()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  uint64_t v2 = v1;
  BOOL v4 = (const void *)v3;
  unsigned int v6 = v5;
  uint64_t v10 = *MEMORY[0x1E4F14BF8];
  memset(v9, 0, 512);
  if (read_zone(v0, v3, v7, (uint64_t)v9, 2)) {
    return v2("Failed to read ProbGuard zone at %p\n", v4);
  }
  else {
    return print_zone((uint64_t)v9, v6 > 1, (void (*)(const char *, ...))v2);
  }
}

double pgm_statistics_task()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  uint64_t v2 = v1;
  uint64_t v10 = *MEMORY[0x1E4F14BF8];
  memset(v7, 0, 512);
  if (!read_zone(v0, v3, v4, (uint64_t)v7, 1))
  {
    uint64_t v6 = *MEMORY[0x1E4F14C80] * v8;
    *(_DWORD *)uint64_t v2 = v8;
    double result = v9[0];
    *(_OWORD *)(v2 + 8) = *(_OWORD *)v9;
    *(void *)(v2 + 24) = v6;
  }
  return result;
}

uint64_t read_zone(uint64_t task, uint64_t a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, const void **a4), uint64_t a4, char a5)
{
  char v7 = a3;
  if (!a3)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    char v7 = (uint64_t (*)(task_name_t, uint64_t, uint64_t, const void **))_malloc_default_reader_3;
  }
  uint64_t v13 = 0;
  uint64_t result = v7(task, a2, 16720, &v13);
  if (!result)
  {
    uint64_t v12 = v13;
    if (!check_zone((uint64_t)v13)) {
      return 5;
    }
    memcpy((void *)a4, v12, 0x4150uLL);
    if ((a5 & 2) != 0)
    {
      uint64_t result = v7(task, *(void *)(a4 + 280), 8 * *(unsigned int *)(a4 + 208), (const void **)(a4 + 280));
      if (result) {
        return result;
      }
      if (!check_slots(a4)) {
        return 5;
      }
    }
    if ((a5 & 4) == 0) {
      return 0;
    }
    uint64_t result = v7(task, *(void *)(a4 + 288), (unint64_t)*(unsigned int *)(a4 + 216) << 8, (const void **)(a4 + 288));
    if (!result)
    {
      if (check_metadata(a4)) {
        return 0;
      }
      return 5;
    }
  }
  return result;
}

uint64_t print_zone(uint64_t a1, int a2, void (*a3)(const char *, ...))
{
  uint64_t v6 = (void *)MEMORY[0x1E4F14C80];
  a3("ProbGuard zone: slots: %u, slots in use: %u, size in use: %llu, max size in use: %llu, allocated size: %llu\n", *(_DWORD *)(a1 + 208), *(_DWORD *)(a1 + 16684), *(void *)(a1 + 16696), *(void *)(a1 + 16704), *MEMORY[0x1E4F14C80] * *(unsigned int *)(a1 + 16684));
  a3("Quarantine: size: %llu, address range: [%p - %p)\n", *(void *)(a1 + 240), *(const void **)(a1 + 248), *(const void **)(a1 + 256));
  uint64_t result = ((uint64_t (*)(const char *))a3)("Slots (#, state, offset, size, block address):\n");
  unint64_t v8 = *(unsigned int *)(a1 + 208);
  if (v8)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 0;
    for (unint64_t i = 0; i < v8; ++i)
    {
      uint64_t v12 = *(void *)(a1 + 280);
      if (a2 || (*(_DWORD *)(v12 + 4 * v10) & 3) == 1)
      {
        uint64_t result = ((uint64_t (*)(const char *, ...))a3)("%4u, %9s, %4u, %4u, %p\n", i, slot_state_labels[*(_DWORD *)(v12 + 4 * v10) & 3], *(unsigned __int16 *)(v12 + v9 + 6), *(unsigned __int16 *)(v12 + v9 + 4), (const void *)(*(unsigned __int16 *)(v12 + v9 + 6)+ *v6 * (v10 & 0xFFFFFFFE | 1)+ *(void *)(a1 + 248)));
        unint64_t v8 = *(unsigned int *)(a1 + 208);
      }
      v10 += 2;
      v9 += 8;
    }
  }
  return result;
}

unint64_t env_uint_0(const char *a1, uint64_t a2)
{
  uint64_t v3 = getenv(a1);
  if (v3) {
    return strtoul(v3, 0, 0);
  }
  return a2;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> my_vm_map_common(int a1, uint64_t a2, vm_prot_t cur_protection, int a4, int a5)
{
  uint64_t v5 = mach_vm_map(*MEMORY[0x1E4F14C48], &address, (a2 + *MEMORY[0x1E4F14C80] - 1) & -*MEMORY[0x1E4F14C80], 0, a4 | (a5 << 24), 0, 0, 0, cur_protection, 3, 1u);
  if (v5) {
    purgeable_ptr_in_use_enumerator_cold_1(v5);
  }
}

uint64_t memory_reader_adapter_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (num_read_memory_0 >= 3) {
    purgeable_ptr_in_use_enumerator_cold_1();
  }
  uint64_t v5 = g_crm_reader_0();
  *a4 = v5;
  if (!v5) {
    return 5;
  }
  uint64_t v6 = v5;
  uint64_t result = 0;
  uint64_t v8 = num_read_memory_0++;
  read_memory_0[v8] = v6;
  return result;
}

void free_read_memory()
{
  if (num_read_memory_0)
  {
    unint64_t v0 = 0;
    do
      _free((void *)read_memory_0[v0++]);
    while (v0 < num_read_memory_0);
  }
  num_read_memory_0 = 0;
}

void nanov2_free_definite_size(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  if (!a2 || (unint64_t)a2 >> 29 != 24)
  {
    uint64_t v17 = *(void (**)(void))(*(void *)(a1 + 28704) + 120);
    v17();
    return;
  }
  unint64_t v5 = a3 >> 4;
  if ((a3 & 0xF) != 0) {
    LODWORD(v5) = v5 + 1;
  }
  int v6 = v5 - 1;
  if (malloc_zero_policy) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 1;
  }
  if (!v7) {
    bzero(a2 + 2, a3 - 16);
  }
  uint64_t v8 = (atomic_uint *)((*(void *)(a1 + 28688) ^ (unint64_t)a2 & 0xFFFFFFFFFC000000)
                     + 4 * (((unint64_t)a2 >> 8) & 0xFC0 | ((unint64_t)a2 >> 20) & 0x3F));
  uint64_t v9 = *v8;
  int v10 = slots_by_size_class[v6];
  *a2 = *(void *)(a1 + 28696) ^ (unint64_t)a2;
  while (1)
  {
    unsigned int v11 = v9 & 0x7FF;
    unsigned int v12 = (v9 + 2048) & 0x1FF800;
    int v13 = (v9 + 0x200000) & 0x7FE00000 | v9 & 0x80000000;
    if (v11 == 2044)
    {
      unsigned int v11 = 2043;
      goto LABEL_19;
    }
    if (v10 - 1 == v12 >> 11) {
      break;
    }
LABEL_19:
    unsigned int v15 = v12 | v13 | ((unsigned __int16)(((unsigned __int16)a2 & 0x3FFF) / (16 * v6 + 16)) + 1) & 0x7FF;
    a2[1] = v11;
    uint64_t v16 = v9;
    atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v16, v15, memory_order_release, memory_order_relaxed);
    if (v16 == v9) {
      goto LABEL_29;
    }
LABEL_20:
    uint64_t v9 = v16;
  }
  a2[1] = 0;
  if ((int)v9 < 0) {
    int v14 = 2043;
  }
  else {
    int v14 = 2045;
  }
  unsigned int v15 = v14 | v12 | v13;
  uint64_t v16 = v9;
  atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v16, v15, memory_order_release, memory_order_relaxed);
  if (v16 != v9) {
    goto LABEL_20;
  }
  if ((v9 & 0x80000000) != 0 || nanov2_madvise_policy)
  {
LABEL_29:
    if ((v15 & 0x80000000) == 0
      && ((1 << v6) & *(unsigned __int16 *)(a1 + 28672)) != 0
      && (double)v10 * 0.75 <= (double)((v15 >> 11) & 0x3FF))
    {
      atomic_fetch_and_explicit((atomic_ushort *volatile)(a1 + 28672), ~(unsigned __int16)(1 << v6), memory_order_relaxed);
    }
    return;
  }

  nanov2_madvise_block((const os_unfair_lock *)a1, v8, v6, 2045);
}

void *nanov2_calloc(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (unint64_t v3 = a2 * a3, a2 * a3 > malloc_absolute_max_size))
    {
      uint64_t v16 = 0;
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return v16;
    }
  }
  if (v3 <= 0x10) {
    unint64_t v4 = 16;
  }
  else {
    unint64_t v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  if (v3 > 0x100)
  {
    long long v24 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 32);
    return (void *)v24();
  }
  uint64_t v5 = (v4 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v6) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1) {
      unint64_t v6 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v6) = v6 % nano_common_max_magazines;
  }
  unsigned int v7 = v6 & 0x3F;
  uint64_t v8 = a1 + (v5 << 9) + 8 * (v6 & 0x3F);
  uint64_t v9 = *(atomic_uint **)(v8 + 0x4000);
  if (!v9)
  {
    int v14 = 0;
    uint64_t v16 = 0;
    return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0);
  }
  unint64_t v10 = 0;
  uint64_t v11 = *v9;
  unint64_t v12 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
  int v13 = 16 * v5 + 16;
  while (1)
  {
    int v14 = 0;
    if ((v11 & 0x80000000) == 0)
    {
      uint64_t v16 = 0;
      return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0);
    }
    int v15 = v11 & 0x7FF;
    uint64_t v16 = 0;
    if (v15 == 2044) {
      return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0);
    }
    unsigned int v17 = (v11 >> 11) & 0x3FF;
    int v18 = (v11 + 2095104) & 0x1FF800 | (v11 + 0x200000) & 0x7FE00000;
    if (v15 != 2043 && v15 != 2045) {
      break;
    }
    if (v17) {
      int v19 = 2043;
    }
    else {
      int v19 = 2044;
    }
    unsigned int v20 = v18 | v19 | 0x80000000;
    uint64_t v21 = v11;
    atomic_compare_exchange_strong_explicit(v9, (unsigned int *)&v21, v20, memory_order_relaxed, memory_order_relaxed);
    if (v21 == v11)
    {
      int v26 = slots_by_size_class[v5] + ~v17;
      char v27 = 1;
      goto LABEL_35;
    }
LABEL_27:
    uint64_t v11 = v21;
    if ((v21 & 0x7FF) - 2045 < 3)
    {
      uint64_t v16 = 0;
      int v14 = v9;
      return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0);
    }
  }
  if (!v10) {
    unint64_t v10 = (unint64_t)v9 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v9) & 0xFC0 | (v9 >> 8) & 0x3F) << 14);
  }
  int v26 = v15 - 1;
  uint64_t v16 = (void *)(v10 + v26 * v13);
  if (v17) {
    __int16 v22 = *((_WORD *)v16 + 4);
  }
  else {
    __int16 v22 = 2044;
  }
  unsigned int v23 = v18 | v22 & 0x7FF | 0x80000000;
  uint64_t v21 = v11;
  atomic_compare_exchange_strong_explicit(v9, (unsigned int *)&v21, v23, memory_order_relaxed, memory_order_relaxed);
  if (v21 != v11) {
    goto LABEL_27;
  }
  if (v16) {
    goto LABEL_43;
  }
  char v27 = 0;
LABEL_35:
  if (!v10) {
    unint64_t v10 = v12;
  }
  uint64_t v16 = (void *)(v10 + v26 * v13);
  if (v27)
  {
    if (!v16)
    {
LABEL_39:
      int v14 = 0;
      return nanov2_allocate_outlined(a1, (atomic_uint **)(v8 + 0x4000), v4, v5, v7, v14, (uint64_t)v16, 1, 0);
    }
  }
  else
  {
LABEL_43:
    if ((void *)(*(void *)(a1 + 28696) ^ *v16) != v16) {
      goto LABEL_39;
    }
  }
  if (malloc_zero_policy)
  {
    bzero(v16, v4);
  }
  else
  {
    *uint64_t v16 = 0;
    v16[1] = 0;
  }
  return v16;
}

void *nanov2_malloc_zero_on_alloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x10) {
    unint64_t v2 = 16;
  }
  else {
    unint64_t v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  if (v2 > 0x100)
  {
    __int16 v22 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24);
    return (void *)v22();
  }
  uint64_t v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1) {
      unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }
  unsigned int v5 = v4 & 0x3F;
  uint64_t v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  unsigned int v7 = *(atomic_uint **)(v6 + 0x4000);
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = *v7;
    unint64_t v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    int v11 = 16 * v3 + 16;
    while (1)
    {
      unint64_t v12 = 0;
      if ((v9 & 0x80000000) == 0)
      {
        int v14 = 0;
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0);
      }
      int v13 = v9 & 0x7FF;
      int v14 = 0;
      if (v13 == 2044) {
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0);
      }
      unsigned int v15 = (v9 >> 11) & 0x3FF;
      int v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15) {
          int v17 = 2043;
        }
        else {
          int v17 = 2044;
        }
        unsigned int v18 = v16 | v17 | 0x80000000;
        uint64_t v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v18, memory_order_relaxed, memory_order_relaxed);
        if (v19 == v9)
        {
          int v24 = slots_by_size_class[v3] + ~v15;
          char v25 = 1;
          goto LABEL_30;
        }
      }
      else
      {
        if (!v8) {
          unint64_t v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        }
        int v24 = v13 - 1;
        int v14 = (void *)(v8 + v24 * v11);
        if (v15) {
          __int16 v20 = *((_WORD *)v14 + 4);
        }
        else {
          __int16 v20 = 2044;
        }
        unsigned int v21 = v16 | v20 & 0x7FF | 0x80000000;
        uint64_t v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v21, memory_order_relaxed, memory_order_relaxed);
        if (v19 == v9)
        {
          if (v14) {
            goto LABEL_38;
          }
          char v25 = 0;
LABEL_30:
          if (!v8) {
            unint64_t v8 = v10;
          }
          int v14 = (void *)(v8 + v24 * v11);
          if (v25)
          {
            if (!v14)
            {
LABEL_34:
              unint64_t v12 = 0;
              return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0);
            }
          }
          else
          {
LABEL_38:
            if ((void *)(*(void *)(a1 + 28696) ^ *v14) != v14) {
              goto LABEL_34;
            }
          }
          if (malloc_zero_policy)
          {
            bzero(v14, v2);
          }
          else
          {
            *int v14 = 0;
            v14[1] = 0;
          }
          return v14;
        }
      }
      uint64_t v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        int v14 = 0;
        unint64_t v12 = v7;
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0);
      }
    }
  }
  unint64_t v12 = 0;
  int v14 = 0;
  return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 0);
}

void *nanov2_malloc_type_zero_on_alloc(uint64_t a1, unint64_t a2)
{
  if (a2 <= 0x10) {
    unint64_t v2 = 16;
  }
  else {
    unint64_t v2 = (a2 + 15) & 0xFFFFFFFFFFFFFFF0;
  }
  if (v2 > 0x100)
  {
    __int16 v22 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 160);
    return (void *)v22();
  }
  uint64_t v3 = (v2 >> 4) - 1;
  if (nano_common_max_magazines_is_ncpu)
  {
    unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
  }
  else
  {
    LODWORD(v4) = _os_cpu_number_override;
    if (_os_cpu_number_override == (_UNKNOWN *__ptr32)-1) {
      unint64_t v4 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 2)) & 0xFFF;
    }
    LODWORD(v4) = v4 % nano_common_max_magazines;
  }
  unsigned int v5 = v4 & 0x3F;
  uint64_t v6 = a1 + (v3 << 9) + 8 * (v4 & 0x3F);
  unsigned int v7 = *(atomic_uint **)(v6 + 0x4000);
  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = *v7;
    unint64_t v10 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
    int v11 = 16 * v3 + 16;
    while (1)
    {
      unint64_t v12 = 0;
      if ((v9 & 0x80000000) == 0)
      {
        int v14 = 0;
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 1);
      }
      int v13 = v9 & 0x7FF;
      int v14 = 0;
      if (v13 == 2044) {
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 1);
      }
      unsigned int v15 = (v9 >> 11) & 0x3FF;
      int v16 = (v9 + 2095104) & 0x1FF800 | (v9 + 0x200000) & 0x7FE00000;
      if (v13 == 2043 || v13 == 2045)
      {
        if (v15) {
          int v17 = 2043;
        }
        else {
          int v17 = 2044;
        }
        unsigned int v18 = v16 | v17 | 0x80000000;
        uint64_t v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v18, memory_order_relaxed, memory_order_relaxed);
        if (v19 == v9)
        {
          int v24 = slots_by_size_class[v3] + ~v15;
          char v25 = 1;
          goto LABEL_30;
        }
      }
      else
      {
        if (!v8) {
          unint64_t v8 = (unint64_t)v7 & 0xFFFFFFFFFC000000 | ((unint64_t)((16 * v7) & 0xFC0 | (v7 >> 8) & 0x3F) << 14);
        }
        int v24 = v13 - 1;
        int v14 = (void *)(v8 + v24 * v11);
        if (v15) {
          __int16 v20 = *((_WORD *)v14 + 4);
        }
        else {
          __int16 v20 = 2044;
        }
        unsigned int v21 = v16 | v20 & 0x7FF | 0x80000000;
        uint64_t v19 = v9;
        atomic_compare_exchange_strong_explicit(v7, (unsigned int *)&v19, v21, memory_order_relaxed, memory_order_relaxed);
        if (v19 == v9)
        {
          if (v14) {
            goto LABEL_38;
          }
          char v25 = 0;
LABEL_30:
          if (!v8) {
            unint64_t v8 = v10;
          }
          int v14 = (void *)(v8 + v24 * v11);
          if (v25)
          {
            if (!v14)
            {
LABEL_34:
              unint64_t v12 = 0;
              return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 1);
            }
          }
          else
          {
LABEL_38:
            if ((void *)(*(void *)(a1 + 28696) ^ *v14) != v14) {
              goto LABEL_34;
            }
          }
          if (malloc_zero_policy)
          {
            bzero(v14, v2);
          }
          else
          {
            *int v14 = 0;
            v14[1] = 0;
          }
          return v14;
        }
      }
      uint64_t v9 = v19;
      if ((v19 & 0x7FF) - 2045 < 3)
      {
        int v14 = 0;
        unint64_t v12 = v7;
        return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 1);
      }
    }
  }
  unint64_t v12 = 0;
  int v14 = 0;
  return nanov2_allocate_outlined(a1, (atomic_uint **)(v6 + 0x4000), v2, v3, v5, v12, (uint64_t)v14, 1, 1);
}

void nanov2_batch_free(uint64_t a1, uint64_t a2, int a3)
{
  if (a3)
  {
    unsigned int v5 = a3 - 1;
    do
    {
      unint64_t v6 = *(void *)(a2 + 8 * v5);
      if (v6) {
        _nanov2_free(a1, v6, 0);
      }
    }
    while ((unint64_t)v5--);
  }
}

unint64_t nanov2_pressure_relief(uint64_t a1, uint64_t a2)
{
  if ((nanov2_madvise_policy - 3) < 0xFFFFFFFE) {
    return 0;
  }
  int v25 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  uint64_t v5 = *(void *)(a1 + 28720);
  unsigned int v6 = *(_DWORD *)(a1 + 28680);
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(a1 + 28728), memory_order_acquire);
  uint64_t v27 = v5;
  unint64_t v2 = 0;
  if (v5)
  {
    unint64_t v26 = explicit;
    unint64_t v24 = (explicit - 1) & 0xFFFFFFFFE0000000;
    unint64_t v8 = (atomic_uint *)(a1 + 28736);
    int v9 = ((v6 >> 6) | (v6 << 6)) & 0xFFF;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    unint64_t v28 = StatusReg;
    do
    {
      unint64_t v11 = v27;
      unint64_t v12 = v27 + 0x20000000;
      if (v27 == v24) {
        unint64_t v12 = v26;
      }
      unint64_t v29 = v12;
      while (1)
      {
        uint64_t v13 = *(void *)(a1 + 28688);
        if (v11 >= v29) {
          break;
        }
        int v14 = 0;
        atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v14, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v14) {
          os_unfair_lock_lock_with_options();
        }
        unsigned __int16 v15 = 0;
        unsigned int v16 = 0;
        int v17 = (atomic_uint *)(v13 ^ v11 & 0xFFFFFFFFFC000000);
        do
        {
          if (v9 != v16 && (*v17 & 0x7FF) == 0x7FD)
          {
            uint64_t v18 = v11 + ((unint64_t)((v15 | (unsigned __int16)(v16 >> 6)) & 0xFFF) << 14);
            if (nanov2_madvise_block_locked((const os_unfair_lock *)a1, v17, v18, ptr_offset_to_size_class[(*(_DWORD *)(a1 + 28680) ^ (v18 >> 14) & 0xFC0) >> 6], 2045))v2 += 0x4000; {
          }
            }
          ++v17;
          ++v16;
          v15 += 64;
        }
        while (v16 != 4096);
        unint64_t StatusReg = v28;
        int v19 = *(_DWORD *)(v28 + 24);
        int v20 = v19;
        atomic_compare_exchange_strong_explicit(v8, (unsigned int *)&v20, 0, memory_order_release, memory_order_relaxed);
        if (v20 != v19) {
          os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 28736));
        }
        v11 += 0x4000000;
        if (a2 - 1 < v2) {
          goto LABEL_29;
        }
      }
      unint64_t v21 = v27
          + ((unint64_t)*(unsigned __int16 *)((v13 ^ v27 & 0xFFFFFFFFFC000000)
                                                   + 4
                                                   * (((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF)) << 29);
      if (v21 >= v26) {
        unint64_t v21 = 0;
      }
      if (*(_WORD *)((v13 ^ v27 & 0xFFFFFFFFFC000000)
                    + 4
                    * (((unsigned __int16)(*(_DWORD *)(a1 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(a1 + 28680) << 6)) & 0xFFF)))
        unint64_t v22 = v21;
      else {
        unint64_t v22 = 0;
      }
      uint64_t v27 = v22;
    }
    while (v22);
  }
LABEL_29:
  if (v25) {
    kdebug_trace();
  }
  return v2;
}

uint64_t nanov2_allocate_new_region()
{
  return 0;
}

void nanov2_destroy(mach_vm_address_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 28704) + 64))();
  mach_vm_size_t v2 = ~*MEMORY[0x1E4F14C70] & (unint64_t)(*MEMORY[0x1E4F14C70] + 29264);
  int v3 = *(_DWORD *)(a1 + 28676);

  nano_common_deallocate_pages(a1, v2, v3);
}

uint64_t nanov2_forked_malloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24))();
}

uint64_t nanov2_forked_malloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 160))();
}

unint64_t nanov2_forked_free(unint64_t result, unint64_t a2)
{
  if (a2)
  {
    unint64_t v3 = result;
    uint64_t result = nanov2_pointer_size(result, a2, 0);
    if (a2 >> 29 != 24 && !result)
    {
      unint64_t v4 = *(uint64_t (**)(void))(*(void *)(v3 + 28704) + 48);
      return v4();
    }
  }
  return result;
}

uint64_t nanov2_forked_realloc(uint64_t a1, const void *a2, size_t a3)
{
  if (!a2)
  {
    unint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24);
LABEL_14:
    return v8();
  }
  unint64_t v6 = nanov2_pointer_size(a1, (unint64_t)a2, 0);
  if (v6)
  {
    size_t v7 = v6;
    unint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 24);
    if (a3)
    {
      int v9 = (void *)v8();
      unint64_t v10 = v9;
      if (v9)
      {
        if (v7 >= a3) {
          size_t v11 = a3;
        }
        else {
          size_t v11 = v7;
        }
        memcpy(v9, a2, v11);
      }
      return (uint64_t)v10;
    }
    goto LABEL_14;
  }
  uint64_t v13 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 56);

  return v13();
}

uint64_t nanov2_forked_realloc_type(uint64_t a1, const void *a2, size_t a3, uint64_t a4)
{
  if (a2)
  {
    unint64_t v8 = nanov2_pointer_size(a1, (unint64_t)a2, 0);
    if (v8)
    {
      size_t v9 = v8;
      uint64_t v10 = *(void *)(a1 + 28704);
      if (a3)
      {
        size_t v11 = (void *)(*(uint64_t (**)(uint64_t, size_t, uint64_t))(v10 + 160))(v10, a3, a4);
        unint64_t v12 = v11;
        if (v11)
        {
          if (v9 >= a3) {
            size_t v13 = a3;
          }
          else {
            size_t v13 = v9;
          }
          memcpy(v11, a2, v13);
        }
        return (uint64_t)v12;
      }
      else
      {
        int v17 = *(uint64_t (**)(void))(v10 + 24);
        return v17();
      }
    }
    else
    {
      unsigned int v16 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 176);
      return v16();
    }
  }
  else
  {
    unsigned __int16 v15 = *(uint64_t (**)(void))(*(void *)(a1 + 28704) + 160);
    return v15();
  }
}

unint64_t nanov2_forked_batch_free(unint64_t result, uint64_t a2, int a3)
{
  if (a3)
  {
    unint64_t v4 = result;
    unsigned int v5 = a3 - 1;
    do
    {
      unint64_t v6 = *(void *)(a2 + 8 * v5);
      if (v6) {
        uint64_t result = nanov2_forked_free(v4, v6);
      }
    }
    while ((unint64_t)v5--);
  }
  return result;
}

uint64_t nanov2_forked_zone(void *a1)
{
  mprotect(a1, 0xC8uLL, 3);
  a1[2] = nanov2_size;
  a1[3] = nanov2_forked_malloc;
  a1[4] = nanov2_forked_calloc;
  a1[5] = nanov2_valloc;
  a1[6] = nanov2_forked_free;
  a1[7] = nanov2_forked_realloc;
  a1[8] = nanov2_destroy;
  a1[10] = nanov2_forked_batch_malloc;
  a1[11] = nanov2_forked_batch_free;
  a1[12] = nanov2_introspect;
  a1[14] = nanov2_forked_memalign;
  a1[15] = nanov2_forked_free_definite_size;
  a1[17] = nanov2_forked_claimed_address;
  a1[18] = 0;
  a1[20] = nanov2_forked_malloc_type;
  a1[21] = nanov2_forked_calloc_type;
  a1[22] = nanov2_forked_realloc_type;
  a1[23] = nanov2_forked_memalign_type;

  return mprotect(a1, 0xC8uLL, 1);
}

uint64_t nanov2_forked_calloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 32))();
}

uint64_t nanov2_forked_batch_malloc(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 80))();
}

uint64_t nanov2_forked_memalign(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 112))();
}

uint64_t nanov2_forked_claimed_address()
{
  return 1;
}

uint64_t nanov2_forked_calloc_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 168))();
}

uint64_t nanov2_forked_memalign_type(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 28704) + 184))();
}

void nanov2_guard_corruption_detected()
{
}

uint64_t nanov2_ptr_in_use_enumerator()
{
  task_name_t v0 = MEMORY[0x1F41887A8]();
  mach_vm_size_t v2 = v1;
  unint64_t v4 = v3;
  unint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  tasatomic_ullong k = v0;
  v72[3659] = *MEMORY[0x1E4F14BF8];
  if (nanov2_config_predicate != -1) {
    _os_once();
  }
  if ((v8 & 3) == 0) {
    return 0;
  }
  __src = 0;
  memset(v72, 0, 512);
  if (!v4)
  {
    if (task)
    {
      is_self = mach_task_is_self(task);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    unint64_t v4 = (uint64_t (*)(task_name_t, uint64_t, uint64_t, void **))_malloc_default_reader_4;
  }
  uint64_t result = v4(task, (uint64_t)v6, 29264, &__src);
  if (result) {
    return result;
  }
  BOOL v13 = mach_task_is_self(task) && __src == v6;
  BOOL v14 = v13;
  BOOL v56 = v14;
  memcpy(v72, __src, 0x7250uLL);
  __src = v72;
  unsigned int v15 = v72[3585];
  unint64_t v16 = v72[3590];
  unint64_t explicit = atomic_load_explicit(&v72[3591], memory_order_acquire);
  if (!v16) {
    return 0;
  }
  int v18 = ((unsigned __int16)(v15 >> 6) | (unsigned __int16)((_WORD)v15 << 6)) & 0xFFF;
  unint64_t v49 = (explicit - 1) & 0xFFFFFFFFE0000000;
  unint64_t v50 = explicit;
  uint64_t v53 = v10;
  uint64_t v19 = task;
  uint64_t v55 = v2;
  char v54 = v8;
  long long v51 = v4;
  while (1)
  {
    uint64_t v68 = 0;
    uint64_t result = v4(v19, v16, 0x20000000, (void **)&v68);
    if (result) {
      break;
    }
    uint64_t v59 = v16 - v68;
    unint64_t v20 = v16 + 0x20000000;
    if (v16 == v49) {
      unint64_t v20 = explicit;
    }
    unint64_t v66 = 0;
    uint64_t v67 = 0;
    unint64_t v52 = v16;
    unint64_t v58 = v20;
    if (v16 < v20)
    {
      unint64_t v60 = v16;
      unint64_t v21 = v16;
      do
      {
        unsigned int v22 = 0;
        unsigned int v23 = (unsigned int *)((*((void *)__src + 3586) ^ v21 & 0xFFFFFFFFFC000000) - v59);
        unint64_t v61 = v21;
        do
        {
          if (v22 != v18)
          {
            unsigned int v24 = *v23;
            int v25 = *v23 & 0x7FF;
            BOOL v26 = (v25 - 2042) > 5 || ((1 << (*v23 + 6)) & 0x31) == 0;
            if (v26 && v25 != 0)
            {
              uint64_t v28 = ((unsigned __int16)(v22 >> 6) | (unsigned __int16)((_WORD)v22 << 6)) & 0xFFF;
              unint64_t v63 = v21 + (v28 << 14);
              if ((v8 & 2) != 0)
              {
                unint64_t v66 = v21 + (v28 << 14);
                uint64_t v67 = 0x4000;
                ((void (*)(uint64_t, uint64_t, uint64_t, unint64_t *, uint64_t))v2)(v19, v10, 2, &v66, 1);
                unint64_t v21 = v61;
              }
              if (v8)
              {
                uint64_t v29 = ptr_offset_to_size_class[(*((_DWORD *)__src + 7170) ^ (v63 >> 14) & 0xFC0) >> 6];
                int v64 = 16 * v29 + 16;
                unint64_t v30 = (int)slots_by_size_class[v29];
                if ((v25 - 2043) > 1)
                {
                  int v62 = slots_by_size_class[v29];
                  unsigned int v36 = 64 - __clz(v30);
                  if (v56)
                  {
                    uint64_t v37 = *((void *)__src + 3588);
                    long long v38 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 32);
                    uint64_t v39 = bitarray_size(v36);
                    long long v40 = (void *)v38(v37, 1, v39);
                  }
                  else
                  {
                    long long v40 = bitarray_create(v36);
                  }
                  long long v41 = v40;
                  unsigned int v42 = 0;
                  if (v62 <= 1) {
                    int v43 = 1;
                  }
                  else {
                    int v43 = v62;
                  }
                  do
                    bitarray_set((uint64_t)v41, v36, v42++);
                  while (v43 != v42);
                  if (v25 == 2043)
                  {
                    int v44 = 0;
                  }
                  else
                  {
                    int v44 = 0;
                    do
                    {
                      if (!v25) {
                        break;
                      }
                      if (v25 > v62) {
                        break;
                      }
                      if (!bitarray_get((uint64_t)v41, v36, v25 - 1)) {
                        break;
                      }
                      bitarray_zap((uint64_t)v41, v36, v25 - 1);
                      int v25 = *(unsigned __int16 *)(v63 - v59 + (v25 - 1) * v64 + 8);
                      ++v44;
                    }
                    while (v25 != 2043);
                  }
                  unsigned int v65 = 0;
                  int v45 = 0;
                  if (bitarray_zap_first_set((uint64_t)v41, v36, &v65))
                  {
                    int v45 = 0;
                    unsigned int v46 = v62 + v44 + (~(v24 >> 11) | 0xFFFFFC00);
                    long long v47 = v71;
                    do
                    {
                      if (v65 >= v46) {
                        break;
                      }
                      *(v47 - 1) = v63 + (int)(v65 * v64);
                      *long long v47 = v64;
                      ++v45;
                      v47 += 2;
                    }
                    while (bitarray_zap_first_set((uint64_t)v41, v36, &v65));
                  }
                  _free(v41);
                  int v32 = v45;
                  mach_vm_size_t v2 = v55;
                  char v8 = v54;
                  uint64_t v10 = v53;
                  uint64_t v19 = task;
                }
                else
                {
                  unsigned int v31 = ~(v24 >> 11) | 0xFFFFFC00;
                  if (v25 != 2043) {
                    unsigned int v31 = 0;
                  }
                  int v32 = v30 + v31;
                  if ((int)(v30 + v31) >= 1)
                  {
                    uint64_t v33 = v30 + v31;
                    long long v34 = v71;
                    unint64_t v35 = v60 + (v28 << 14);
                    do
                    {
                      *(v34 - 1) = v35;
                      *long long v34 = v64;
                      v34 += 2;
                      v35 += v64;
                      --v33;
                    }
                    while (v33);
                  }
                }
                if (v32) {
                  v2(v19, v10, 1, v70);
                }
                unint64_t v21 = v61;
              }
            }
          }
          ++v22;
          ++v23;
        }
        while (v22 != 4096);
        v21 += 0x4000000;
        v60 += 0x4000000;
      }
      while (v21 < v58);
    }
    unint64_t v4 = v51;
    if (*(_WORD *)((*((void *)__src + 3586) ^ v52 & 0xFFFFFFFFFC000000)
                  + 4
                  * (((unsigned __int16)(*((_DWORD *)__src + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)__src + 7170) << 6)) & 0xFFF)
                  - v59))
      BOOL v48 = v52 == 0;
    else {
      BOOL v48 = 1;
    }
    unint64_t v16 = v52
        + ((unint64_t)*(unsigned __int16 *)((*((void *)__src + 3586) ^ v52 & 0xFFFFFFFFFC000000)
                                                 + 4
                                                 * (((unsigned __int16)(*((_DWORD *)__src + 7170) >> 6) | (unsigned __int16)((unsigned __int16)*((_DWORD *)__src + 7170) << 6)) & 0xFFF)
                                                 - v59) << 29);
    unint64_t explicit = v50;
    if (v48) {
      return 0;
    }
  }
  return result;
}

uint64_t nanov2_check()
{
  return 1;
}

uint64_t nanov2_print_self(const void *a1, int a2)
{
  return nanov2_print(*MEMORY[0x1E4F14C48], 2 * (a2 != 0), a1, _malloc_default_reader_4, (void (*)(const char *, ...))malloc_report_simple);
}

uint64_t nanov2_locked()
{
  return 0;
}

uint64_t nanov2_statistics_task(uint64_t a1, const void *a2, uint64_t (*a3)(task_name_t a1, uint64_t a2, uint64_t a3, void *a4), uint64_t a4)
{
  return nanov2_statistics(a1, a2, a3, 0, a4);
}

uint64_t nanov2_print(uint64_t a1, unsigned int a2, const void *a3, uint64_t (*a4)(task_name_t a1, uint64_t a2, uint64_t a3, uint64_t *a4), void (*a5)(const char *, ...))
{
  uint64_t v69 = *MEMORY[0x1E4F14BF8];
  if (nanov2_config_predicate != -1) {
    _os_once();
  }
  uint64_t v67 = 0;
  if (a4(a1, (uint64_t)a3, 29264, &v67))
  {
    uint64_t v9 = "Failed to map nanozonev2_s at %p\n";
    return ((uint64_t (*)(const char *))a5)(v9);
  }
  long long v65 = 0u;
  long long v66 = 0u;
  nanov2_statistics(a1, a3, a4, a5, (uint64_t)&v65);
  a5("Nanozonev2 %p: blocks in use: %llu, size in use: %llu allocated size: %llu, allocated regions: %d, region holes: %d\n", a3, v65, *((void *)&v65 + 1), *((void *)&v66 + 1), *(_DWORD *)(v67 + 28744), *(_DWORD *)(v67 + 28748));
  a5("Current Allocation Blocks By Size Class/Context [CPU]\n");
  uint64_t v11 = 0;
  uint64_t v12 = 0x4000;
  do
  {
    a5("  Class %d: ", v11);
    for (uint64_t i = 0; i != 64; ++i)
    {
      BOOL v14 = *(const void **)(v67 + v12 + 8 * i);
      if (v14) {
        a5("%d: %p; ", i, v14);
      }
    }
    uint64_t result = ((uint64_t (*)(const char *))a5)("\n");
    ++v11;
    v12 += 512;
  }
  while (v11 != 16);
  uint64_t v15 = *(void *)(v67 + 28680);
  unint64_t v16 = *(char **)(v67 + 28720);
  unint64_t explicit = atomic_load_explicit((atomic_ullong *volatile)(v67 + 28728), memory_order_acquire);
  if (v16)
  {
    int v17 = 0;
    uint64_t v18 = ((unsigned __int16)(v15 >> 6) | (unsigned __int16)((_WORD)v15 << 6)) & 0xFFF;
    int v62 = a5;
    unint64_t v52 = a4;
    unsigned int v51 = a1;
    while (1)
    {
      int v53 = v17;
      a5("\nRegion %d: base address %p\n", v17, v16);
      uint64_t v64 = 0;
      uint64_t result = a4(a1, (uint64_t)v16, 0x20000000, &v64);
      if (result) {
        break;
      }
      uint64_t v58 = v64 - (void)v16;
      uint64_t v19 = v16 + 0x20000000;
      if (v16 == (char *)((explicit - 1) & 0xFFFFFFFFE0000000)) {
        uint64_t v19 = (char *)explicit;
      }
      unint64_t v55 = (unint64_t)v16;
      unint64_t v57 = (unint64_t)v19;
      if (v16 < v19)
      {
        int v20 = 0;
        unint64_t v21 = (unint64_t)v16;
        while (1)
        {
          uint64_t v22 = 0;
          int v23 = 0;
          int v24 = 0;
          int v25 = 0;
          int v26 = 0;
          int v27 = 0;
          uint64_t v28 = (char *)(*(void *)(v67 + 28688) ^ v21 & 0xFFFFFFFFFC000000);
          uint64_t v29 = &v28[v58];
          do
          {
            if (4 * v18 != v22)
            {
              unsigned int v30 = *(_DWORD *)&v29[v22] & 0x7FF;
              if (v30 > 0x7FD)
              {
                if (v30 == 2046) {
                  ++v23;
                }
                else {
                  ++v24;
                }
              }
              else if (v30)
              {
                if (v30 == 2045) {
                  ++v26;
                }
                else {
                  ++v27;
                }
              }
              else
              {
                ++v25;
              }
            }
            v22 += 4;
          }
          while (v22 != 0x4000);
          unint64_t v63 = v21;
          a5("Arena #%d: base address %p. Blocks - active: %d, madvisable: %d, madvising: %d, madvised: %d, unused: %d\n", v20, (const void *)v21, v27, v26, v23, v24, v25);
          unsigned __int16 v31 = 0;
          uint64_t v32 = 0;
          memset(v68, 0, sizeof(v68));
          uint64_t v33 = v67;
          do
          {
            if (v18 != v32
              && (*(_DWORD *)&v29[4 * v32] & 0x7FFu) - 2045 >= 3
              && (*(_DWORD *)&v29[4 * v32] & 0x7FF) != 0)
            {
              uint64_t v35 = ptr_offset_to_size_class[((v31 | (unsigned __int16)(v32 >> 6)) & 0xFC0 ^ *(_DWORD *)(v33 + 28680)) >> 6];
              ++*((_DWORD *)v68 + v35);
            }
            ++v32;
            v31 += 64;
          }
          while (v32 != 4096);
          int v59 = v20;
          a5("Size classes with allocated blocks: ");
          for (uint64_t j = 0; j != 16; ++j)
          {
            if (*((_DWORD *)v68 + j)) {
              a5("%d ", j);
            }
          }
          uint64_t result = ((uint64_t (*)(const char *))a5)("\n");
          unint64_t v37 = v63;
          if (a2 >= 2) {
            break;
          }
LABEL_70:
          unint64_t v21 = v37 + 0x4000000;
          int v20 = v59 + 1;
          a5 = v62;
          if (v21 >= v57) {
            goto LABEL_71;
          }
        }
        unsigned __int16 v38 = 0;
        uint64_t v39 = 0;
        while (2)
        {
          if (v18 != v39)
          {
            unsigned int v40 = *(_DWORD *)&v29[4 * v39];
            int v41 = v40 & 0x7FF;
            BOOL v42 = (v41 - 2042) > 5 || ((1 << (v40 + 6)) & 0x31) == 0;
            if (v42 && v41 != 0)
            {
              if (v41 == 2044)
              {
                char v61 = 0;
                int v44 = "FULL";
LABEL_61:
                unint64_t v60 = v44;
              }
              else
              {
                if (v41 == 2045)
                {
                  char v61 = 0;
                  int v44 = "CAN MADVISE";
                  goto LABEL_61;
                }
                unint64_t v60 = 0;
                char v61 = 1;
              }
              uint64_t v45 = (v38 | (unsigned __int16)(v39 >> 6)) & 0xFFF;
              uint64_t v46 = ptr_offset_to_size_class[(int)(v45 ^ *(_DWORD *)(v67 + 28680)) >> 6];
              v62("    Block %d: base %p; metadata: %p, size %d (class %d) in-use: %d ",
                v39,
                (const void *)(v37 + (v45 << 14)),
                v28,
                16 * v46 + 16,
                v46,
                v40 >> 31);
              if (v61)
              {
                int v47 = slots_by_size_class[v46];
                if (v41 == 2043) {
                  BOOL v48 = "BUMP (free list empty)";
                }
                else {
                  BOOL v48 = "next_slot (1-based) = %d";
                }
                v62(v48);
                uint64_t result = ((uint64_t (*)(const char *, ...))v62)(", allocated slots: %d, free slots = %d, occupancy: %d%%\n", v47 + ~((v40 >> 11) & 0x3FF), ((v40 >> 11) & 0x3FF) + 1, (int)(100 * (v47 + ~((v40 >> 11) & 0x3FF))) / v47);
              }
              else
              {
                uint64_t result = ((uint64_t (*)(const char *, ...))v62)("%s\n", v60);
              }
              unint64_t v37 = v63;
            }
          }
          ++v39;
          v28 += 4;
          v38 += 64;
          if (v39 == 4096) {
            goto LABEL_70;
          }
          continue;
        }
      }
LABEL_71:
      uint64_t v49 = *(unsigned __int16 *)(v58
                                + (*(void *)(v67 + 28688) ^ v55 & 0xFFFFFFFFFC000000)
                                + 4
                                * (((unsigned __int16)(*(_DWORD *)(v67 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(v67 + 28680) << 6)) & 0xFFF));
      if (v55 + (v49 << 29) >= explicit) {
        unint64_t v16 = 0;
      }
      else {
        unint64_t v16 = (char *)(v55 + (v49 << 29));
      }
      a4 = v52;
      int v17 = v53 + 1;
      if (*(_WORD *)(v58
                    + (*(void *)(v67 + 28688) ^ v55 & 0xFFFFFFFFFC000000)
                    + 4
                    * (((unsigned __int16)(*(_DWORD *)(v67 + 28680) >> 6) | (unsigned __int16)((unsigned __int16)*(_DWORD *)(v67 + 28680) << 6)) & 0xFFF)))
        BOOL v50 = v16 == 0;
      else {
        BOOL v50 = 1;
      }
      a1 = v51;
      if (v50) {
        return result;
      }
    }
    uint64_t v9 = "Failed to map nanov2 region at %p\n";
    return ((uint64_t (*)(const char *))a5)(v9);
  }
  return result;
}

void nano_common_cpu_number_override_set()
{
  if (_os_cpu_number_override != (_UNKNOWN *__ptr32)-1 || nano_common_max_magazines != phys_ncpus) {
    nano_common_max_magazines_is_ncpu = 0;
  }
}

BOOL nano_common_reserve_vm_space(mach_vm_address_t a1, mach_vm_size_t a2)
{
  return _nano_common_map_vm_space(a1, a2, 0) != 0;
}

BOOL nano_common_unprotect_vm_space(mach_vm_address_t address, mach_vm_size_t size)
{
  kern_return_t v2;

  mach_vm_size_t v2 = mach_vm_protect(*MEMORY[0x1E4F14C48], address, size, 0, 3);
  if (v2) {
    malloc_report(3u, (uint64_t)"mach_vm_protect ret: %d\n");
  }
  return v2 == 0;
}

void nano_common_deallocate_pages(mach_vm_address_t address, mach_vm_size_t size, __int16 a3)
{
  if (mach_vm_deallocate(*MEMORY[0x1E4F14C48], address, size)) {
    malloc_zone_error(a3, 0, (uint64_t)"Can't deallocate_pages at %p\n");
  }
}

uint64_t nano_common_default_reader(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  *a4 = a2;
  return 0;
}

uint64_t _xzm_type_choose_ptr_bucket(uint64_t a1, int a2, unsigned int a3)
{
  LOBYTE(v3) = 0;
  switch(a2)
  {
    case 2:
      LODWORD(v3) = (*(_DWORD *)(a1 + 4) + *(_DWORD *)a1 * a3) >> 31;
      break;
    case 3:
      unint64_t v3 = (*(void *)(a1 + 8) + *(void *)a1 * (unint64_t)a3) >> 34;
      LODWORD(v3) = v3 - 3 * ((1431655766 * (unint64_t)v3) >> 32);
      break;
    case 4:
      unint64_t v3 = ((*(void *)(a1 + 8) + *(void *)a1 * (unint64_t)a3) >> 32) & 3;
      break;
    default:
      return v3;
  }
  return v3;
}

void xzm_malloc_inline(uint64_t a1, unint64_t a2, unint64_t a3, char a4, int8x8_t a5)
{
  if (a2 <= 0x8000)
  {
    if (*(void *)(a1 + 232)) {
      uint64_t v5 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v5 = a1;
    }
    unint64_t v6 = __clz(a2 - 1);
    unint64_t v7 = (((a2 - 1) >> (61 - v6)) & 3) - 4 * v6 + 488;
    if (a2 <= 0x80) {
      unint64_t v7 = (__PAIR128__(a2 >> 4, a2 & 0xF) - 1) >> 64;
    }
    if (!a2) {
      LOBYTE(v7) = 0;
    }
    uint64_t v8 = v7;
    char v9 = *(unsigned char *)(*(void *)(v5 + 368) + v7);
    if (HIWORD(a3) == 256)
    {
      char v10 = 0;
    }
    else if ((a3 & 0xC0000000000) == 0x40000000000)
    {
      char v10 = 1;
    }
    else
    {
      if (a3) {
        unsigned int v11 = a3;
      }
      else {
        unsigned int v11 = dword_1EB1C96FC;
      }
      LOBYTE(v12) = 0;
      switch(*(unsigned char *)(*(void *)(v5 + 360) + v8))
      {
        case 4:
          LODWORD(v12) = (*(_DWORD *)(v5 + 316) + *(_DWORD *)(v5 + 312) * v11) >> 31;
          break;
        case 5:
          unint64_t v13 = (*(void *)(v5 + 320) + *(void *)(v5 + 312) * (unint64_t)v11) >> 34;
          LODWORD(v12) = v13 - 3 * ((1431655766 * (unint64_t)v13) >> 32);
          break;
        case 6:
          unint64_t v12 = ((*(void *)(v5 + 320) + *(void *)(v5 + 312) * (unint64_t)v11) >> 32) & 3;
          break;
        default:
          break;
      }
      char v10 = v12 + 2;
    }
    _xzm_xzone_malloc(a1, a2, (v10 + v9), a4, a5);
  }
  else
  {
    _xzm_malloc_large_huge(a1, a2, 0, a3, a4);
  }
}

uint64_t xzm_check()
{
  return 1;
}

void xzm_reinit_lock(uint64_t a1)
{
}

void xzm_locked()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: xzm_locked not implemented";
  __break(1u);
}

void xzm_force_lock_global_state(uint64_t a1)
{
}

void _xzm_global_state_lock(uint64_t a1, int a2)
{
  if (*(unsigned __int8 *)(a1 + 210) >= 2u)
  {
    unint64_t v4 = 1;
    uint64_t v5 = 24;
    do
    {
      _xzm_do_lock_action((os_unfair_lock_s *)(*(void *)(a1 + 376) + v5), a2);
      ++v4;
      v5 += 16;
    }
    while (v4 < *(unsigned __int8 *)(a1 + 210));
  }
  if (*(unsigned char *)(a1 + 344))
  {
    uint64_t v6 = 0;
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = *(void *)(a1 + 392) + v6;
      _xzm_do_lock_action((os_unfair_lock_s *)(v8 + 8), a2);
      _xzm_do_lock_action((os_unfair_lock_s *)(v8 + 4), a2);
      if (*(unsigned char *)v8 == 1) {
        _xzm_do_lock_action((os_unfair_lock_s *)(v8 + 488), a2);
      }
      ++v7;
      v6 += 496;
    }
    while (v7 < *(unsigned __int8 *)(a1 + 344));
  }
  if (*(unsigned char *)(a1 + 329))
  {
    unint64_t v9 = 0;
    uint64_t v10 = 16;
    do
    {
      _xzm_do_lock_action((os_unfair_lock_s *)(*(void *)(a1 + 384) + v10), a2);
      ++v9;
      v10 += 56;
    }
    while (v9 < *(unsigned __int8 *)(a1 + 329));
  }
  _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 432), a2);
  if (*(unsigned char *)(a1 + 330))
  {
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    do
    {
      _xzm_do_lock_action((os_unfair_lock_s *)(*(void *)(a1 + 400) + v11), a2);
      ++v12;
      v11 += 64;
    }
    while (v12 < *(unsigned __int8 *)(a1 + 330));
  }

  _xzm_do_lock_action((os_unfair_lock_s *)(a1 + 448), a2);
}

void xzm_force_unlock_global_state(uint64_t a1)
{
}

void xzm_force_reinit_lock_global_state(uint64_t a1)
{
}

uint64_t xzm_ptr_lookup_4test(uint64_t a1, unint64_t a2, unsigned char *a3, unsigned char *a4, unsigned char *a5)
{
  unint64_t v5 = a2 >> 22;
  if (a2 >> 36) {
    unint64_t v5 = 0x4000;
  }
  if (v5 >> 14) {
    return 0;
  }
  uint64_t v6 = *(void *)(a1 + 232);
  if (!v6) {
    uint64_t v6 = a1;
  }
  uint64_t v7 = *(void *)(v6 + 408);
  if (!v7) {
    return 0;
  }
  uint64_t v8 = *(unsigned int *)(v7 + 4 * v5);
  if (!v8) {
    return 0;
  }
  uint64_t v10 = v8 << 14;
  unint64_t v11 = a2 - *(void *)(v10 + 48);
  if (*(_DWORD *)(v10 + 16) <= (v11 >> 14)) {
    return 0;
  }
  unsigned int v12 = v11 >> 14;
  unint64_t v13 = v10 + 48 * v12 + 2104;
  if ((*(unsigned char *)(v10 + 48 * v12 + 2136) & 0xF) == 4)
  {
    unint64_t v22 = v13 - *(unsigned int *)(v10 + 48 * v12 + 2140);
    unsigned int v23 = *(unsigned char *)(v22 + 32) & 0xF;
    if (v23 <= 8)
    {
      int v24 = 1 << v23;
      if ((v24 & 0x1E8) != 0)
      {
        if (v22 + 48 * *(unsigned int *)(v22 + 40) <= v13) {
          goto LABEL_10;
        }
        goto LABEL_48;
      }
      if ((v24 & 6) != 0 && v13 == v22) {
LABEL_48:
      }
        unint64_t v13 = v22;
    }
  }
LABEL_10:
  unsigned int v14 = *(unsigned char *)(v13 + 32) & 0xF;
  if (v14 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(*(unsigned char *)(v13 + 32) & 0xF);
  }
  if (((1 << v14) & 0x1B) != 0 || *(unsigned __int16 *)(v13 + 34) != *(unsigned __int16 *)(a1 + 208)) {
    return 0;
  }
  unint64_t v16 = (unsigned char **)(v13 & 0xFFFFFFFFFFFFC000);
  unint64_t v17 = a2
      - *(void *)((v13 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v13 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v14 == 5 || v14 == 2)
  {
    uint64_t v19 = *(void *)(a1 + 216) + 88 * *(unsigned __int8 *)(v13 + 33);
    if ((*(_DWORD *)(v19 + 64) * v17) >= *(_DWORD *)(v19 + 64)) {
      return 0;
    }
    unint64_t v20 = *(void *)(v19 + 48);
  }
  else
  {
    unint64_t v20 = (unint64_t)*(unsigned int *)(v13 + 40) << 14;
    uint64_t v19 = v17 % v20;
    if (v17 % v20) {
      return 0;
    }
  }
  if (v14 == 5)
  {
    if ((*(_DWORD *)v13 >> (v17 / v20))) {
      return 0;
    }
  }
  else
  {
    if (v14 != 2) {
      goto LABEL_26;
    }
    if (*(void *)a2 == (*(void *)(a1 + 272) ^ a2))
    {
      unint64_t v30 = v13 & 0xFFFFFFFFFFFFC000;
      uint64_t v31 = v19;
      uint64_t v28 = a4;
      uint64_t v29 = a3;
      unint64_t v26 = v13;
      int v27 = a5;
      if ((_xzm_xzone_tiny_chunk_block_is_free_slow(a1, v13, a2) & 1) == 0)
      {
        a5 = v27;
        unsigned int v14 = *(unsigned char *)(v26 + 32) & 0xF;
        a4 = v28;
        a3 = v29;
        unint64_t v16 = (unsigned char **)v30;
        uint64_t v19 = v31;
LABEL_26:
        *a3 = v14;
        *a4 = **v16;
        if (v14 != 5 && v14 != 2) {
          return 1;
        }
        goto LABEL_35;
      }
      return 0;
    }
  }
  *a3 = v14;
  *a4 = **v16;
LABEL_35:
  if (!v19) {
    xzm_ptr_lookup_4test_cold_2();
  }
  *a5 = *(unsigned char *)(v19 + 76);
  return 1;
}

uint64_t xzm_type_choose_ptr_bucket_4test(uint64_t a1, int a2, unsigned int a3)
{
  LOBYTE(v3) = 0;
  switch(a2)
  {
    case 2:
      LODWORD(v3) = (*(_DWORD *)(a1 + 4) + *(_DWORD *)a1 * a3) >> 31;
      break;
    case 3:
      unint64_t v3 = (*(void *)(a1 + 8) + *(void *)a1 * (unint64_t)a3) >> 34;
      LODWORD(v3) = v3 - 3 * ((1431655766 * (unint64_t)v3) >> 32);
      break;
    case 4:
      unint64_t v3 = ((*(void *)(a1 + 8) + *(void *)a1 * (unint64_t)a3) >> 32) & 3;
      break;
    default:
      return v3;
  }
  return v3;
}

uint64_t _xzm_xzone_tiny_chunk_block_is_free_slow(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  int v6 = 0;
  uint64_t v7 = (os_unfair_lock_s *)(result + 280);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(result + 280), (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v6) {
    uint64_t result = os_unfair_lock_lock_with_options();
  }
  atomic_ullong v9 = *(void *)a2;
  while (1)
  {
    unint64_t v10 = v9;
    if ((~(_WORD)v9 & 0x7FE) == 0) {
      break;
    }
    uint64_t v11 = v9 | 0x40000000;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)a2, (unint64_t *)&v9, v9 | 0x40000000, memory_order_relaxed, memory_order_relaxed);
    if (v9 == v10)
    {
      unint64_t v12 = ((0xAAAAAAAAAAAAC000 * (((unint64_t)(a2 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
          + *(void *)((a2 & 0xFFFFFFFFFFFFC000) + 0x30);
      if ((uint64_t)(a3 - v12) >= 0) {
        uint64_t v13 = a3 - v12;
      }
      else {
        uint64_t v13 = a3 - v12 + 15;
      }
      unint64_t v14 = v10 & 0x7FF;
      if (v14 - 2046 > 0xFFFFFFFFFFFFFFFDLL)
      {
        unint64_t v15 = 0;
      }
      else
      {
        unint64_t v15 = 0;
        uint64_t v16 = *(void *)(v5 + 216) + 88 * *(unsigned __int8 *)(a2 + 33);
        unint64_t v17 = *(void *)(v16 + 48) >> 4;
        uint64_t v18 = v13 >> 4;
        unint64_t v19 = v17 * (*(_DWORD *)(v16 + 68) - 1);
        unint64_t v20 = v12 + 8;
        do
        {
          BOOL v21 = v14 % v17 || v14 > v19;
          if (v21 || v15 > 0x3FF) {
            break;
          }
          if (v14 == v18)
          {
            uint64_t v22 = 1;
            goto LABEL_26;
          }
          ++v15;
          unint64_t v14 = *(void *)(v20 + 16 * v14) & 0x7FFLL;
        }
        while (v14 - 2046 < 0xFFFFFFFFFFFFFFFELL);
      }
      unint64_t v23 = (v10 >> 11) & 0x7FF;
      if (v15 == v23 && v14 == 2045 || v15 < v23 && v14 == 2044)
      {
        uint64_t v22 = 0;
LABEL_26:
        unint64_t v15 = v10 & 0xFFFFFFFFBFFFFFFFLL;
        uint64_t v24 = v10 | 0x40000000;
        atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)a2, (unint64_t *)&v24, v15, memory_order_relaxed, memory_order_relaxed);
        if (v24 == v11) {
          goto LABEL_27;
        }
        qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"success\" failed (/Library/Caches/com.apple.xbs/"
                                   "Sources/libmalloc/src/xzone/xzone_malloc.c:2724)";
        __break(1u);
      }
      qword_1E93090B0 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: corrupt tiny freelist";
      qword_1E93090E0 = v15;
      __break(1u);
      return result;
    }
  }
  uint64_t v22 = 1;
LABEL_27:
  int v25 = *(_DWORD *)(StatusReg + 24);
  int v26 = v25;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v7, (unsigned int *)&v26, 0, memory_order_release, memory_order_relaxed);
  if (v26 != v25) {
    os_unfair_lock_unlock(v7);
  }
  return v22;
}

void xzm_malloc_zone_destroy(mach_vm_address_t a1)
{
  if (*(void *)(a1 + 232))
  {
    int v2 = 0;
    unint64_t v3 = (os_unfair_lock_s *)(a1 + 280);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 280), (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v2) {
      os_unfair_lock_lock_with_options();
    }
    unint64_t v50 = 0;
    if (*(unsigned __int8 *)(a1 + 210) >= 2u)
    {
      unint64_t v4 = 1;
      do
      {
        uint64_t v5 = *(void *)(a1 + 216);
        int v6 = (void *)(v5 + 88 * v4);
        if (v6[6] <= 0x1000uLL)
        {
          while (1)
          {
            uint64_t v25 = _xzm_chunk_list_pop((os_unfair_lock_s *)a1, v6 + 2, 1u);
            if (!v25) {
              break;
            }
            if ((*(unsigned char *)(v25 + 32) & 0x40) != 0) {
              xzm_malloc_zone_destroy_cold_3();
            }
            *(void *)v25 &= 0xFFFFFFFFC03FFFFFLL;
            unint64_t v26 = v50;
            *(void *)(v25 + 16) = v50;
            if (v26) {
              *(void *)(v26 + 24) = v25 + 16;
            }
            unint64_t v50 = v25;
            *(void *)(v25 + 24) = &v50;
          }
          int v27 = v6 + 3;
          while (1)
          {
            uint64_t v28 = _xzm_chunk_list_pop((os_unfair_lock_s *)a1, v27, 0);
            if (!v28) {
              break;
            }
            unint64_t v29 = v50;
            *(void *)(v28 + 16) = v50;
            *(unsigned char *)(v28 + 32) &= ~0x40u;
            if (v29) {
              *(void *)(v29 + 24) = v28 + 16;
            }
            unint64_t v50 = v28;
            *(void *)(v28 + 24) = &v50;
          }
        }
        else
        {
          unint64_t v7 = *v6;
          if (*v6)
          {
            do
            {
              unint64_t v8 = *(void *)(v7 + 16);
              if (v8)
              {
                *(void *)(v8 + 24) = *(void *)(v7 + 24);
                uint64_t v9 = *(void *)(v7 + 16);
              }
              else
              {
                uint64_t v9 = 0;
              }
              **(void **)(v7 + 24) = v9;
              unint64_t v10 = v50;
              *(void *)(v7 + 16) = v50;
              if (v10) {
                *(void *)(v10 + 24) = v7 + 16;
              }
              unint64_t v50 = v7;
              *(void *)(v7 + 24) = &v50;
              unint64_t v7 = v8;
            }
            while (v8);
          }
          unint64_t v11 = v6[1];
          if (v11)
          {
            do
            {
              unint64_t v12 = *(void *)(v11 + 16);
              if (v12)
              {
                *(void *)(v12 + 24) = *(void *)(v11 + 24);
                uint64_t v13 = *(void *)(v11 + 16);
              }
              else
              {
                uint64_t v13 = 0;
              }
              **(void **)(v11 + 24) = v13;
              unint64_t v14 = v50;
              *(void *)(v11 + 16) = v50;
              if (v14) {
                *(void *)(v14 + 24) = v11 + 16;
              }
              unint64_t v50 = v11;
              *(void *)(v11 + 24) = &v50;
              unint64_t v11 = v12;
            }
            while (v12);
          }
          unsigned __int8 v15 = *(unsigned char *)(a1 + 211);
          if (v15)
          {
            unint64_t v16 = 0;
            unint64_t v17 = (unsigned __int8 *)(v5 + 88 * v4 + 72);
            do
            {
              uint64_t v18 = (unint64_t *)(*(void *)(a1 + 224) + 32 * (*v17 + v16 * *(unsigned __int8 *)(a1 + 210)));
              unint64_t v19 = *v18;
              if (*v18)
              {
                *uint64_t v18 = 0;
                unint64_t v20 = v50;
                *(void *)(v19 + 16) = v50;
                if (v20) {
                  *(void *)(v20 + 24) = v19 + 16;
                }
                unint64_t v50 = v19;
                *(void *)(v19 + 24) = &v50;
                unsigned __int8 v15 = *(unsigned char *)(a1 + 211);
              }
              ++v16;
            }
            while (v16 < v15);
          }
          uint64_t v21 = v6[2];
          if (v21)
          {
            do
            {
              uint64_t v22 = *(void *)(v21 + 16);
              if (v22)
              {
                *(void *)(v22 + 24) = *(void *)(v21 + 24);
                uint64_t v23 = *(void *)(v21 + 16);
              }
              else
              {
                uint64_t v23 = 0;
              }
              **(void **)(v21 + 24) = v23;
              _xzm_xzone_fresh_chunk_init((uint64_t)v6, v21, 5);
              unint64_t v24 = v50;
              *(void *)(v21 + 16) = v50;
              if (v24) {
                *(void *)(v24 + 24) = v21 + 16;
              }
              unint64_t v50 = v21;
              *(void *)(v21 + 24) = &v50;
              uint64_t v21 = v22;
            }
            while (v22);
          }
        }
        ++v4;
      }
      while (v4 < *(unsigned __int8 *)(a1 + 210));
    }
    int v30 = *(_DWORD *)(StatusReg + 24);
    int v31 = v30;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v3, (unsigned int *)&v31, 0, memory_order_release, memory_order_relaxed);
    if (v31 != v30) {
      os_unfair_lock_unlock(v3);
    }
    uint64_t v32 = *(void *)(a1 + 232);
    unint64_t v33 = v50;
    if (v50)
    {
      do
      {
        unint64_t v34 = *(void *)(v33 + 16);
        uint64_t v35 = *(void *)(a1 + 216);
        unsigned int v36 = *(unsigned __int8 *)(v33 + 33);
        if ((*(unsigned char *)(v35 + 88 * *(unsigned __int8 *)(v33 + 33) + 78) & 1) == 0 && (*(unsigned char *)(v32 + 328) & 4) != 0)
        {
          unsigned int v37 = -1431655765 * (((v33 & 0x3FFF) - 2104) >> 4);
          unsigned __int16 v38 = (void *)((v33 & 0xFFFFFFFFFFFFC000) + 8 * v37 + 56);
          if (*(void *)((v33 & 0xFFFFFFFFFFFFC000) + 8 * v37 + 0x38) != -1)
          {
            int v39 = 11;
            while (!xzm_chunk_mark_used(a1, v33))
            {
              xzm_reclaim_force_sync(*(void *)(v32 + 464));
              if (!--v39) {
                xzm_malloc_zone_destroy_cold_2();
              }
              if (*v38 == -1) {
                goto LABEL_59;
              }
            }
            *(void *)unint64_t v33 = *(void *)v33 & 0xFFFFFFFFFFFFF800 | 0x7FD;
          }
        }
LABEL_59:
        char v40 = *(unsigned char *)(v33 + 32);
        int v41 = v40 & 0xF;
        if (v41 == 5)
        {
          xzm_segment_group_segment_madvise_chunk(*(void *)(v33 & 0xFFFFFFFFFFFFC000), v33);
        }
        else
        {
          if (v41 != 2) {
            _xzm_xzone_chunk_free_cold_2(v41);
          }
          if ((*(void *)v33 & 0x7FFLL) == 0x7FE) {
            goto LABEL_67;
          }
          BOOL v42 = (uint64_t *)(v33 & 0xFFFFFFFFFFFFC000);
          if (*(void *)(v35 + 88 * v36 + 48) <= 0x400uLL) {
            bzero((void *)(((0xAAAAAAAAAAAAC000 * ((v33 - (unint64_t)v42 - 2104) >> 4)) & 0x3FFFFFFFC000)+ *(void *)((v33 & 0xFFFFFFFFFFFFC000) + 0x30)), 0x4000uLL);
          }
          xzm_segment_group_segment_madvise_chunk(*v42, v33);
          *(void *)unint64_t v33 = *(void *)v33 & 0xFFFFFFFFFFC00000 | 0x7FE;
        }
        char v40 = *(unsigned char *)(v33 + 32);
LABEL_67:
        *(unsigned char *)(v33 + 32) = v40 & 0xDF;
        _xzm_xzone_chunk_free(a1, *(void *)(a1 + 216) + 88 * *(unsigned __int8 *)(v33 + 33), v33);
        unint64_t v33 = v34;
      }
      while (v34);
    }
    unint64_t v43 = *(void *)(a1 + 288);
    if (v43)
    {
      do
      {
        unint64_t v44 = *(void *)(v43 + 16);
        _xzm_free_large_huge(a1, v43);
        unint64_t v43 = v44;
      }
      while (v44);
    }
    uint64_t v45 = xzm_metapool_alloc(*(void *)(v32 + 400) + 128);
    int v46 = 0;
    *(_WORD *)uint64_t v45 = *(_WORD *)(a1 + 208);
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v32 + 448), (unsigned int *)&v46, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v46) {
      os_unfair_lock_lock_with_options();
    }
    *(void *)(v45 + 8) = *(void *)(v32 + 440);
    *(void *)(v32 + 440) = v45;
    int v47 = *(_DWORD *)(StatusReg + 24);
    int v48 = v47;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v32 + 448), (unsigned int *)&v48, 0, memory_order_release, memory_order_relaxed);
    if (v48 != v47) {
      os_unfair_lock_unlock((os_unfair_lock_t)(v32 + 448));
    }
    mvm_deallocate_plat(a1, *(void *)(a1 + 200), 0);
  }
}

void xzm_malloc_zone_malloc_with_options(uint64_t a1, unint64_t a2, unint64_t a3, char a4, int8x8_t a5)
{
}

unint64_t xzm_malloc_zone_malloc_slow(uint64_t a1, unint64_t a2, int8x8_t a3)
{
  return xzm_malloc_zone_malloc_type_malloc_slow(a1, a2, *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904), a3);
}

void xzm_malloc_zone_calloc_slow(uint64_t a1, unint64_t a2, unint64_t a3, int8x8_t a4)
{
}

uint64_t xzm_malloc_zone_valloc_slow(uint64_t a1, unint64_t a2, int8x8_t a3)
{
  uint64_t v3 = a1;
  if (a2 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0 && *(void *)(a1 + 232)) {
    a1 = *(void *)(a1 + 232);
  }
  _xzm_memalign(a1, *MEMORY[0x1E4F14C80], a2, *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904), 0, a3);
  uint64_t v5 = v4;
  if (v4 && (*(unsigned char *)(v3 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  return v5;
}

void xzm_malloc_zone_free_slow(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return;
  }
  if (a2 >> 36) {
    unint64_t v4 = 0x4000;
  }
  else {
    unint64_t v4 = a2 >> 22;
  }
  if (v4 >> 14) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)(a1 + 232);
  if (!v5) {
    uint64_t v5 = a1;
  }
  uint64_t v6 = *(void *)(v5 + 408);
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = *(unsigned int *)(v6 + 4 * v4);
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = v7 << 14;
  unint64_t v9 = a2 - *(void *)(v8 + 48);
  if (*(_DWORD *)(v8 + 16) <= (v9 >> 14)) {
    goto LABEL_14;
  }
  unsigned int v10 = v9 >> 14;
  unint64_t v11 = v8 + 48 * v10 + 2104;
  if ((*(unsigned char *)(v8 + 48 * v10 + 2136) & 0xF) == 4)
  {
    unint64_t v34 = v11 - *(unsigned int *)(v8 + 48 * v10 + 2140);
    unsigned int v35 = *(unsigned char *)(v34 + 32) & 0xF;
    if (v35 <= 8)
    {
      int v36 = 1 << v35;
      if ((v36 & 0x1E8) != 0)
      {
        if (v34 + 48 * *(unsigned int *)(v34 + 40) <= v11) {
          goto LABEL_12;
        }
        goto LABEL_89;
      }
      if ((v36 & 6) != 0 && v11 == v34) {
LABEL_89:
      }
        unint64_t v11 = v34;
    }
  }
LABEL_12:
  unsigned int v12 = *(unsigned char *)(v11 + 32) & 0xF;
  if (v12 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v12);
  }
  if (((1 << v12) & 0x1B) != 0 || *(unsigned __int16 *)(v11 + 34) != *(unsigned __int16 *)(a1 + 208)) {
    goto LABEL_14;
  }
  unint64_t v24 = a2
      - (((0xAAAAAAAAAAAAC000 * (((v11 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(void *)((v11 & 0xFFFFFFFFFFFFC000) + 0x30));
  if (v12 == 5 || v12 == 2)
  {
    uint64_t v26 = *(void *)(a1 + 216) + 88 * *(unsigned __int8 *)(v11 + 33);
    if ((*(_DWORD *)(v26 + 64) * v24) >= *(_DWORD *)(v26 + 64)) {
      goto LABEL_14;
    }
    unint64_t v13 = *(void *)(v26 + 48);
  }
  else
  {
    unint64_t v13 = (unint64_t)*(unsigned int *)(v11 + 40) << 14;
    if (v24 % v13) {
      goto LABEL_14;
    }
  }
  if (v12 == 5)
  {
    if (((*(_DWORD *)v11 >> (v24 / v13)) & 1) == 0) {
      goto LABEL_15;
    }
LABEL_14:
    unint64_t v13 = _xzm_ptr_size_outlined(a1, a2);
    goto LABEL_15;
  }
  if (v12 == 2 && *(void *)a2 == (*(void *)(a1 + 272) ^ a2))
  {
    unint64_t v27 = v13;
    int is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v11, a2);
    unint64_t v13 = v27;
    if (is_free_slow) {
      goto LABEL_14;
    }
  }
LABEL_15:
  if (v13)
  {
    uint64_t v14 = 0;
    goto LABEL_33;
  }
  if ((*(unsigned char *)(a1 + 296) & 0x80) == 0) {
LABEL_96:
  }
    xzm_malloc_zone_free_slow_cold_1(a2);
  if (*(void *)(a1 + 232)) {
    uint64_t v14 = *(void *)(a1 + 232);
  }
  else {
    uint64_t v14 = a1;
  }
  if (v4 >> 14) {
    goto LABEL_31;
  }
  uint64_t v15 = *(void *)(v14 + 232);
  if (!v15) {
    uint64_t v15 = v14;
  }
  uint64_t v16 = *(void *)(v15 + 408);
  if (!v16) {
    goto LABEL_31;
  }
  uint64_t v17 = *(unsigned int *)(v16 + 4 * v4);
  if (!v17) {
    goto LABEL_31;
  }
  uint64_t v18 = v17 << 14;
  unint64_t v19 = a2 - *(void *)(v18 + 48);
  if (*(_DWORD *)(v18 + 16) <= (v19 >> 14)) {
    goto LABEL_31;
  }
  unsigned int v20 = v19 >> 14;
  unint64_t v21 = v18 + 48 * v20 + 2104;
  if ((*(unsigned char *)(v18 + 48 * v20 + 2136) & 0xF) == 4)
  {
    unint64_t v37 = v21 - *(unsigned int *)(v18 + 48 * v20 + 2140);
    unsigned int v38 = *(unsigned char *)(v37 + 32) & 0xF;
    if (v38 <= 8)
    {
      int v39 = 1 << v38;
      if ((v39 & 0x1E8) != 0)
      {
        if (v37 + 48 * *(unsigned int *)(v37 + 40) <= v21) {
          goto LABEL_29;
        }
        goto LABEL_95;
      }
      if ((v39 & 6) != 0 && v21 == v37) {
LABEL_95:
      }
        unint64_t v21 = v37;
    }
  }
LABEL_29:
  unsigned int v22 = *(unsigned char *)(v21 + 32) & 0xF;
  if (v22 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v22);
  }
  if (((1 << v22) & 0x1B) != 0 || *(unsigned __int16 *)(v21 + 34) != *(unsigned __int16 *)(v14 + 208)) {
    goto LABEL_31;
  }
  unint64_t v29 = a2
      - (((0xAAAAAAAAAAAAC000 * (((v21 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000)
       + *(void *)((v21 & 0xFFFFFFFFFFFFC000) + 0x30));
  if (v22 == 5 || v22 == 2)
  {
    uint64_t v31 = *(void *)(v14 + 216) + 88 * *(unsigned __int8 *)(v21 + 33);
    if ((*(_DWORD *)(v31 + 64) * v29) >= *(_DWORD *)(v31 + 64)) {
      goto LABEL_31;
    }
    unint64_t v13 = *(void *)(v31 + 48);
  }
  else
  {
    unint64_t v13 = (unint64_t)*(unsigned int *)(v21 + 40) << 14;
    if (v29 % v13) {
      goto LABEL_31;
    }
  }
  if (v22 == 5)
  {
    if (((*(_DWORD *)v21 >> (v29 / v13)) & 1) == 0) {
      goto LABEL_32;
    }
LABEL_31:
    unint64_t v13 = _xzm_ptr_size_outlined(v14, a2);
    goto LABEL_32;
  }
  if (v22 == 2 && *(void *)a2 == (*(void *)(v14 + 272) ^ a2))
  {
    unint64_t v32 = v13;
    int v33 = _xzm_xzone_tiny_chunk_block_is_free_slow(v14, v21, a2);
    unint64_t v13 = v32;
    if (v33) {
      goto LABEL_31;
    }
  }
LABEL_32:
  if (!v13) {
    goto LABEL_96;
  }
LABEL_33:
  if (v13 >= 0x401 && (*(void *)(a1 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  if (v14) {
    uint64_t v23 = v14;
  }
  else {
    uint64_t v23 = a1;
  }

  _xzm_free(v23, a2, 0);
}

void xzm_malloc_zone_realloc_slow(uint64_t a1, unint64_t a2, unint64_t a3, int8x8_t a4)
{
}

uint64_t xzm_malloc_zone_memalign_slow(uint64_t a1, unint64_t a2, unint64_t a3, int8x8_t a4)
{
  return xzm_malloc_zone_malloc_type_memalign_slow(a1, a2, a3, *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904), a4);
}

void xzm_malloc_zone_try_free_default_slow(uint64_t a1, unint64_t a2)
{
  if (!a2) {
    return;
  }
  if (a2 >> 36) {
    unint64_t v4 = 0x4000;
  }
  else {
    unint64_t v4 = a2 >> 22;
  }
  if (v4 >> 14) {
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)(a1 + 232);
  if (!v5) {
    uint64_t v5 = a1;
  }
  uint64_t v6 = *(void *)(v5 + 408);
  if (!v6) {
    goto LABEL_14;
  }
  uint64_t v7 = *(unsigned int *)(v6 + 4 * v4);
  if (!v7) {
    goto LABEL_14;
  }
  uint64_t v8 = v7 << 14;
  unint64_t v9 = a2 - *(void *)(v8 + 48);
  if (*(_DWORD *)(v8 + 16) <= (v9 >> 14)) {
    goto LABEL_14;
  }
  unsigned int v10 = v9 >> 14;
  unint64_t v11 = v8 + 48 * v10 + 2104;
  if ((*(unsigned char *)(v8 + 48 * v10 + 2136) & 0xF) == 4)
  {
    unint64_t v34 = v11 - *(unsigned int *)(v8 + 48 * v10 + 2140);
    unsigned int v35 = *(unsigned char *)(v34 + 32) & 0xF;
    if (v35 <= 8)
    {
      int v36 = 1 << v35;
      if ((v36 & 0x1E8) != 0)
      {
        if (v34 + 48 * *(unsigned int *)(v34 + 40) <= v11) {
          goto LABEL_12;
        }
        goto LABEL_88;
      }
      if ((v36 & 6) != 0 && v11 == v34) {
LABEL_88:
      }
        unint64_t v11 = v34;
    }
  }
LABEL_12:
  unsigned int v12 = *(unsigned char *)(v11 + 32) & 0xF;
  if (v12 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v12);
  }
  if (((1 << v12) & 0x1B) != 0 || *(unsigned __int16 *)(v11 + 34) != *(unsigned __int16 *)(a1 + 208)) {
    goto LABEL_14;
  }
  unint64_t v24 = a2
      - *(void *)((v11 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v11 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v12 == 5 || v12 == 2)
  {
    uint64_t v26 = *(void *)(a1 + 216) + 88 * *(unsigned __int8 *)(v11 + 33);
    if ((*(_DWORD *)(v26 + 64) * v24) >= *(_DWORD *)(v26 + 64)) {
      goto LABEL_14;
    }
    unint64_t v13 = *(void *)(v26 + 48);
  }
  else
  {
    unint64_t v13 = (unint64_t)*(unsigned int *)(v11 + 40) << 14;
    if (v24 % v13) {
      goto LABEL_14;
    }
  }
  if (v12 == 5)
  {
    if (((*(_DWORD *)v11 >> (v24 / v13)) & 1) == 0) {
      goto LABEL_15;
    }
LABEL_14:
    unint64_t v13 = _xzm_ptr_size_outlined(a1, a2);
    goto LABEL_15;
  }
  if (v12 == 2 && *(void *)a2 == (*(void *)(a1 + 272) ^ a2))
  {
    unint64_t v27 = v13;
    int is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(a1, v11, a2);
    unint64_t v13 = v27;
    if (is_free_slow) {
      goto LABEL_14;
    }
  }
LABEL_15:
  if (v13)
  {
    uint64_t v14 = 0;
    goto LABEL_17;
  }
  if ((*(unsigned char *)(a1 + 296) & 0x80) != 0)
  {
    if (*(void *)(a1 + 232)) {
      uint64_t v14 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v14 = a1;
    }
    if (v4 >> 14) {
      goto LABEL_36;
    }
    uint64_t v16 = *(void *)(v14 + 232);
    if (!v16) {
      uint64_t v16 = v14;
    }
    uint64_t v17 = *(void *)(v16 + 408);
    if (!v17) {
      goto LABEL_36;
    }
    uint64_t v18 = *(unsigned int *)(v17 + 4 * v4);
    if (!v18) {
      goto LABEL_36;
    }
    uint64_t v19 = v18 << 14;
    unint64_t v20 = a2 - *(void *)(v19 + 48);
    if (*(_DWORD *)(v19 + 16) <= (v20 >> 14)) {
      goto LABEL_36;
    }
    unsigned int v21 = v20 >> 14;
    unint64_t v22 = v19 + 48 * v21 + 2104;
    if ((*(unsigned char *)(v19 + 48 * v21 + 2136) & 0xF) == 4)
    {
      unint64_t v38 = v22 - *(unsigned int *)(v19 + 48 * v21 + 2140);
      unsigned int v39 = *(unsigned char *)(v38 + 32) & 0xF;
      if (v39 <= 8)
      {
        int v40 = 1 << v39;
        if ((v40 & 0x1E8) != 0)
        {
          if (v38 + 48 * *(unsigned int *)(v38 + 40) <= v22) {
            goto LABEL_34;
          }
          goto LABEL_98;
        }
        if ((v40 & 6) != 0 && v22 == v38) {
LABEL_98:
        }
          unint64_t v22 = v38;
      }
    }
LABEL_34:
    unsigned int v23 = *(unsigned char *)(v22 + 32) & 0xF;
    if (v23 > 7) {
      _xzm_segment_group_segment_span_free_coalesce_cold_1(v23);
    }
    if (((1 << v23) & 0x1B) != 0 || *(unsigned __int16 *)(v22 + 34) != *(unsigned __int16 *)(v14 + 208)) {
      goto LABEL_36;
    }
    unint64_t v29 = a2
        - *(void *)((v22 & 0xFFFFFFFFFFFFC000) + 0x30)
        - ((0xAAAAAAAAAAAAC000 * (((v22 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
    if (v23 == 5 || v23 == 2)
    {
      uint64_t v31 = *(void *)(v14 + 216) + 88 * *(unsigned __int8 *)(v22 + 33);
      if ((*(_DWORD *)(v31 + 64) * v29) >= *(_DWORD *)(v31 + 64)) {
        goto LABEL_36;
      }
      unint64_t v13 = *(void *)(v31 + 48);
    }
    else
    {
      unint64_t v13 = (unint64_t)*(unsigned int *)(v22 + 40) << 14;
      if (v29 % v13) {
        goto LABEL_36;
      }
    }
    if (v23 != 5)
    {
      if (v23 == 2 && *(void *)a2 == (*(void *)(v14 + 272) ^ a2))
      {
        unint64_t v32 = v13;
        int v33 = _xzm_xzone_tiny_chunk_block_is_free_slow(v14, v22, a2);
        unint64_t v13 = v32;
        if (v33) {
          goto LABEL_36;
        }
      }
LABEL_37:
      if (v13)
      {
LABEL_17:
        if (v13 >= 0x401 && (*(unsigned char *)(a1 + 296) & 0x20) != 0) {
          _platform_memset();
        }
        if (v14) {
          uint64_t v15 = v14;
        }
        else {
          uint64_t v15 = a1;
        }
        _xzm_free(v15, a2, 1);
        return;
      }
      goto LABEL_38;
    }
    if (((*(_DWORD *)v22 >> (v29 / v13)) & 1) == 0) {
      goto LABEL_37;
    }
LABEL_36:
    unint64_t v13 = _xzm_ptr_size_outlined(v14, a2);
    goto LABEL_37;
  }
LABEL_38:

  find_zone_and_free((void *)a2, 1u);
}

uint64_t xzm_malloc_zone_malloc_with_options_slow(uint64_t a1, unint64_t a2, unint64_t a3, char a4, int8x8_t a5)
{
  return xzm_malloc_zone_malloc_type_malloc_with_options_slow(a1, a2, a3, a4, *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 904), a5);
}

void xzm_malloc_zone_malloc_type_calloc_slow(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int8x8_t a5)
{
  if (a2 != 1)
  {
    if (!is_mul_ok(a2, a3) || (a3 *= a2, a3 > malloc_absolute_max_size))
    {
      **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
      return;
    }
  }
  if (a3 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0)
  {
    if (*(void *)(a1 + 232)) {
      a1 = *(void *)(a1 + 232);
    }
    if (*(void *)(a1 + 232)) {
      uint64_t v5 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v5 = a1;
    }
    unint64_t v6 = __clz(a3 - 1);
    unint64_t v7 = (((a3 - 1) >> (61 - v6)) & 3) - 4 * v6 + 488;
    if (a3 <= 0x80) {
      unint64_t v7 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    }
    if (!a3) {
      LOBYTE(v7) = 0;
    }
    uint64_t v8 = v7;
    char v9 = *(unsigned char *)(*(void *)(v5 + 368) + v7);
    if (HIWORD(a4) != 256)
    {
      if ((a4 & 0xC0000000000) != 0x40000000000)
      {
        int v10 = *(unsigned __int8 *)(*(void *)(v5 + 360) + v8);
        if (a4) {
          unsigned int v11 = a4;
        }
        else {
          unsigned int v11 = dword_1EB1C96FC;
        }
        uint64_t v12 = v11;
        LOBYTE(v13) = 0;
        switch(v10)
        {
          case 4:
            goto LABEL_39;
          case 5:
            goto LABEL_40;
          case 6:
            goto LABEL_41;
          default:
            break;
        }
LABEL_42:
        char v17 = v13 + 2;
        goto LABEL_43;
      }
LABEL_34:
      char v17 = 1;
      goto LABEL_43;
    }
  }
  else
  {
    if (a3 > 0x8000)
    {
      _xzm_malloc_large_huge(a1, a3, 0, a4, 1);
      return;
    }
    if (*(void *)(a1 + 232)) {
      uint64_t v5 = *(void *)(a1 + 232);
    }
    else {
      uint64_t v5 = a1;
    }
    unint64_t v14 = __clz(a3 - 1);
    unint64_t v15 = (((a3 - 1) >> (61 - v14)) & 3) - 4 * v14 + 488;
    if (a3 <= 0x80) {
      unint64_t v15 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    }
    if (!a3) {
      LOBYTE(v15) = 0;
    }
    uint64_t v16 = v15;
    char v9 = *(unsigned char *)(*(void *)(v5 + 368) + v15);
    if (HIWORD(a4) != 256)
    {
      if ((a4 & 0xC0000000000) != 0x40000000000)
      {
        int v18 = *(unsigned __int8 *)(*(void *)(v5 + 360) + v16);
        if (a4) {
          unsigned int v11 = a4;
        }
        else {
          unsigned int v11 = dword_1EB1C96FC;
        }
        uint64_t v12 = v11;
        LOBYTE(v13) = 0;
        switch(v18)
        {
          case 4:
LABEL_39:
            LODWORD(v13) = (*(_DWORD *)(v5 + 316) + *(_DWORD *)(v5 + 312) * v11) >> 31;
            break;
          case 5:
LABEL_40:
            unint64_t v19 = (unint64_t)(*(void *)(v5 + 320) + *(void *)(v5 + 312) * v12) >> 34;
            LODWORD(v13) = v19 - 3 * ((1431655766 * (unint64_t)v19) >> 32);
            break;
          case 6:
LABEL_41:
            uint64_t v13 = ((unint64_t)(*(void *)(v5 + 320) + *(void *)(v5 + 312) * v12) >> 32) & 3;
            break;
          default:
            goto LABEL_42;
        }
        goto LABEL_42;
      }
      goto LABEL_34;
    }
  }
  char v17 = 0;
LABEL_43:
  _xzm_xzone_malloc(a1, a3, (v17 + v9), 1, a5);
}

void xzm_malloc_zone_malloc_type_realloc_slow(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int8x8_t a5)
{
  uint64_t v8 = a1;
  uint64_t v9 = *(void *)(a1 + 296);
  if ((v9 & 0xA0) == 0)
  {
    xzm_realloc(a1, a2, a3, a4, a5);
    return;
  }
  if (!a2)
  {
    unint64_t v44 = a3;
LABEL_74:
    xzm_malloc_zone_malloc_type_malloc_slow(a1, v44, a4, a5);
    return;
  }
  if (!a3)
  {
    xzm_malloc_zone_free_slow(a1, a2);
    a1 = v8;
    unint64_t v44 = 0;
    goto LABEL_74;
  }
  if (a2 >> 36) {
    unint64_t v10 = 0x4000;
  }
  else {
    unint64_t v10 = a2 >> 22;
  }
  unint64_t v11 = v10 >> 14;
  if (v10 >> 14) {
    goto LABEL_16;
  }
  uint64_t v12 = *(void *)(a1 + 232);
  if (!v12) {
    uint64_t v12 = a1;
  }
  uint64_t v13 = *(void *)(v12 + 408);
  if (!v13) {
    goto LABEL_16;
  }
  uint64_t v14 = *(unsigned int *)(v13 + 4 * v10);
  if (!v14) {
    goto LABEL_16;
  }
  uint64_t v15 = v14 << 14;
  unint64_t v16 = a2 - *(void *)(v15 + 48);
  if (*(_DWORD *)(v15 + 16) <= (v16 >> 14)) {
    goto LABEL_16;
  }
  unsigned int v17 = v16 >> 14;
  unint64_t v18 = v15 + 48 * v17 + 2104;
  if ((*(unsigned char *)(v15 + 48 * v17 + 2136) & 0xF) == 4)
  {
    unint64_t v69 = v18 - *(unsigned int *)(v15 + 48 * v17 + 2140);
    unsigned int v70 = *(unsigned char *)(v69 + 32) & 0xF;
    if (v70 <= 8)
    {
      int v71 = 1 << v70;
      if ((v71 & 0x1E8) != 0)
      {
        if (v69 + 48 * *(unsigned int *)(v69 + 40) <= v18) {
          goto LABEL_14;
        }
        goto LABEL_187;
      }
      if ((v71 & 6) != 0 && v18 == v69) {
LABEL_187:
      }
        unint64_t v18 = v69;
    }
  }
LABEL_14:
  unsigned int v19 = *(unsigned char *)(v18 + 32) & 0xF;
  if (v19 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v19);
  }
  if (((1 << v19) & 0x1B) != 0 || *(unsigned __int16 *)(v18 + 34) != *(unsigned __int16 *)(v8 + 208)) {
    goto LABEL_16;
  }
  unint64_t v53 = a2
      - *(void *)((v18 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v18 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v19 == 5 || v19 == 2)
  {
    uint64_t v55 = *(void *)(v8 + 216) + 88 * *(unsigned __int8 *)(v18 + 33);
    if ((*(_DWORD *)(v55 + 64) * v53) >= *(_DWORD *)(v55 + 64)) {
      goto LABEL_16;
    }
    unint64_t v20 = *(void *)(v55 + 48);
  }
  else
  {
    unint64_t v20 = (unint64_t)*(unsigned int *)(v18 + 40) << 14;
    if (v53 % v20) {
      goto LABEL_16;
    }
  }
  if (v19 == 5)
  {
    if (((*(_DWORD *)v18 >> (v53 / v20)) & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (v19 == 2
    && *(void *)a2 == (*(void *)(v8 + 272) ^ a2)
    && _xzm_xzone_tiny_chunk_block_is_free_slow(v8, v18, a2))
  {
LABEL_16:
    unint64_t v20 = _xzm_ptr_size_outlined(v8, a2);
  }
LABEL_17:
  uint64_t v21 = 0;
  if ((v9 & 0x80) == 0 || v20) {
    goto LABEL_32;
  }
  if (*(void *)(v8 + 232)) {
    uint64_t v21 = *(void *)(v8 + 232);
  }
  else {
    uint64_t v21 = v8;
  }
  if (v11) {
    goto LABEL_31;
  }
  uint64_t v22 = *(void *)(v21 + 232);
  if (!v22) {
    uint64_t v22 = v21;
  }
  uint64_t v23 = *(void *)(v22 + 408);
  if (!v23) {
    goto LABEL_31;
  }
  uint64_t v24 = *(unsigned int *)(v23 + 4 * v10);
  if (!v24) {
    goto LABEL_31;
  }
  uint64_t v25 = v24 << 14;
  unint64_t v26 = a2 - *(void *)(v25 + 48);
  if (*(_DWORD *)(v25 + 16) <= (v26 >> 14)) {
    goto LABEL_31;
  }
  unsigned int v27 = v26 >> 14;
  unint64_t v28 = v25 + 48 * v27 + 2104;
  if ((*(unsigned char *)(v25 + 48 * v27 + 2136) & 0xF) == 4)
  {
    unint64_t v75 = v28 - *(unsigned int *)(v25 + 48 * v27 + 2140);
    unsigned int v76 = *(unsigned char *)(v75 + 32) & 0xF;
    if (v76 <= 8)
    {
      int v77 = 1 << v76;
      if ((v77 & 0x1E8) != 0)
      {
        if (v75 + 48 * *(unsigned int *)(v75 + 40) <= v28) {
          goto LABEL_29;
        }
        goto LABEL_199;
      }
      if ((v77 & 6) != 0 && v28 == v75) {
LABEL_199:
      }
        unint64_t v28 = v75;
    }
  }
LABEL_29:
  unsigned int v29 = *(unsigned char *)(v28 + 32) & 0xF;
  if (v29 > 7) {
    _xzm_segment_group_segment_span_free_coalesce_cold_1(v29);
  }
  if (((1 << v29) & 0x1B) != 0 || *(unsigned __int16 *)(v28 + 34) != *(unsigned __int16 *)(v21 + 208)) {
    goto LABEL_31;
  }
  unint64_t v62 = a2
      - *(void *)((v28 & 0xFFFFFFFFFFFFC000) + 0x30)
      - ((0xAAAAAAAAAAAAC000 * (((v28 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
  if (v29 == 5 || v29 == 2)
  {
    uint64_t v64 = *(void *)(v21 + 216) + 88 * *(unsigned __int8 *)(v28 + 33);
    if ((*(_DWORD *)(v64 + 64) * v62) >= *(_DWORD *)(v64 + 64)) {
      goto LABEL_31;
    }
    unint64_t v20 = *(void *)(v64 + 48);
  }
  else
  {
    unint64_t v20 = (unint64_t)*(unsigned int *)(v28 + 40) << 14;
    if (v62 % v20) {
      goto LABEL_31;
    }
  }
  if (v29 == 5)
  {
    if (((*(_DWORD *)v28 >> (v62 / v20)) & 1) == 0) {
      goto LABEL_32;
    }
  }
  else if (v29 != 2 {
         || *(void *)a2 != (*(void *)(v21 + 272) ^ a2)
  }
         || !_xzm_xzone_tiny_chunk_block_is_free_slow(v21, v28, a2))
  {
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v20 = _xzm_ptr_size_outlined(v21, a2);
LABEL_32:
  if (!v20) {
    xzm_malloc_zone_malloc_type_realloc_slow_cold_1();
  }
  if ((v9 & 0x20) != 0 && v20 > a3) {
    _platform_memset();
  }
  if ((v9 & 0x80) == 0 || a3 > 0x8000 && !v21 || a3 <= 0x8000 && v21)
  {
    if (v11) {
      goto LABEL_53;
    }
    uint64_t v31 = *(void *)(v8 + 232);
    if (!v31) {
      uint64_t v31 = v8;
    }
    uint64_t v32 = *(void *)(v31 + 408);
    if (!v32) {
      goto LABEL_53;
    }
    uint64_t v33 = *(unsigned int *)(v32 + 4 * v10);
    if (!v33) {
      goto LABEL_53;
    }
    uint64_t v34 = v33 << 14;
    unint64_t v35 = a2 - *(void *)(v34 + 48);
    if (*(_DWORD *)(v34 + 16) <= (v35 >> 14)) {
      goto LABEL_53;
    }
    unsigned int v36 = v35 >> 14;
    unint64_t v37 = v34 + 48 * v36 + 2104;
    if ((*(unsigned char *)(v34 + 48 * v36 + 2136) & 0xF) == 4)
    {
      unint64_t v72 = v37 - *(unsigned int *)(v34 + 48 * v36 + 2140);
      unsigned int v73 = *(unsigned char *)(v72 + 32) & 0xF;
      if (v73 <= 8)
      {
        int v74 = 1 << v73;
        if ((v74 & 0x1E8) != 0)
        {
          if (v72 + 48 * *(unsigned int *)(v72 + 40) <= v37) {
            goto LABEL_51;
          }
          goto LABEL_193;
        }
        if ((v74 & 6) != 0 && v37 == v72) {
LABEL_193:
        }
          unint64_t v37 = v72;
      }
    }
LABEL_51:
    unsigned int v38 = *(unsigned char *)(v37 + 32) & 0xF;
    if (v38 > 7) {
      _xzm_segment_group_segment_span_free_coalesce_cold_1(v38);
    }
    if (((1 << v38) & 0x1B) != 0 || *(unsigned __int16 *)(v37 + 34) != *(unsigned __int16 *)(v8 + 208)) {
      goto LABEL_53;
    }
    BOOL v56 = (uint64_t *)(v37 & 0xFFFFFFFFFFFFC000);
    unint64_t v57 = a2
        - *(void *)((v37 & 0xFFFFFFFFFFFFC000) + 0x30)
        - ((0xAAAAAAAAAAAAC000 * (((v37 & 0x3FFF) - 2104) >> 4)) & 0x3FFFFFFFC000);
    if (v38 == 5 || v38 == 2)
    {
      uint64_t v59 = *(void *)(v8 + 216) + 88 * *(unsigned __int8 *)(v37 + 33);
      if ((*(_DWORD *)(v59 + 64) * v57) >= *(_DWORD *)(v59 + 64)) {
        goto LABEL_53;
      }
      unint64_t v39 = *(void *)(v59 + 48);
    }
    else
    {
      unint64_t v39 = (unint64_t)*(unsigned int *)(v37 + 40) << 14;
      if (v57 % v39) {
        goto LABEL_53;
      }
    }
    if (v38 == 5)
    {
      if (((*(_DWORD *)v37 >> (v57 / v39)) & 1) == 0) {
        goto LABEL_147;
      }
    }
    else
    {
      if (v38 != 2 || *(void *)a2 != (*(void *)(v8 + 272) ^ a2)) {
        goto LABEL_147;
      }
      unint64_t v81 = v37 & 0xFFFFFFFFFFFFC000;
      unint64_t v60 = v37;
      int is_free_slow = _xzm_xzone_tiny_chunk_block_is_free_slow(v8, v37, a2);
      BOOL v56 = (uint64_t *)v81;
      if (!is_free_slow)
      {
        unint64_t v37 = v60;
        if (*(unsigned __int16 *)(v60 + 34) != *(unsigned __int16 *)(v8 + 208)) {
          xzm_realloc_cold_2(a2);
        }
LABEL_147:
        if (a3 > 0x8000 && v39 > 0x8000)
        {
          if (a3 <= 0x200000 || v39 <= 0x200000)
          {
            if (a3 <= 0x200000 && v39 < 0x200001 && (*(unsigned char *)(v8 + 296) & 0x80) == 0)
            {
              char v67 = xzm_segment_group_try_realloc_large_chunk(*v56, (uint64_t)v56, v37, (a3 + 0x3FFF) >> 14);
LABEL_157:
              int v40 = (void *)a2;
              if (v67)
              {
LABEL_61:
                if ((v9 & 0x20) != 0 && v20 < a3) {
                  _platform_memset();
                }
                if (v40 != (void *)a2)
                {
                  if ((v9 & 0x20) != 0) {
                    _platform_memset();
                  }
                  if (v21) {
                    uint64_t v43 = v21;
                  }
                  else {
                    uint64_t v43 = v8;
                  }
                  _xzm_free(v43, a2, 0);
                }
                return;
              }
            }
          }
          else if ((*(unsigned char *)(v8 + 296) & 0x80) == 0)
          {
            char v67 = xzm_segment_group_try_realloc_huge_chunk(*v56, v8, (unint64_t)v56, v37, (a3 + 0x3FFF) >> 14);
            goto LABEL_157;
          }
        }
LABEL_54:
        if (v39 >= a3)
        {
          int v40 = (void *)a2;
          if (v39 >> 1 <= a3) {
            goto LABEL_61;
          }
        }
        xzm_malloc(v8, a3, a4, 0, a5);
        int v40 = v41;
        if (!v41) {
          return;
        }
LABEL_57:
        if (v39 >= a3) {
          size_t v42 = a3;
        }
        else {
          size_t v42 = v39;
        }
        memcpy(v40, (const void *)a2, v42);
        goto LABEL_61;
      }
    }
LABEL_53:
    unint64_t v39 = _xzm_ptr_size_outlined(v8, a2);
    goto LABEL_54;
  }
  if (a3 > 0x8000)
  {
    unint64_t v52 = _xzm_malloc_large_huge(v8, a3, 0, a4, 0);
  }
  else
  {
    if (*(void *)(v8 + 232)) {
      uint64_t v45 = *(void *)(v8 + 232);
    }
    else {
      uint64_t v45 = v8;
    }
    if (*(void *)(v45 + 232)) {
      uint64_t v46 = *(void *)(v45 + 232);
    }
    else {
      uint64_t v46 = v45;
    }
    unint64_t v47 = __clz(a3 - 1);
    unint64_t v48 = (((a3 - 1) >> (61 - v47)) & 3) - 4 * v47 + 488;
    if (a3 <= 0x80) {
      unint64_t v48 = (__PAIR128__(a3 >> 4, a3 & 0xF) - 1) >> 64;
    }
    uint64_t v49 = v48;
    char v50 = *(unsigned char *)(*(void *)(v46 + 368) + v48);
    if (HIWORD(a4) == 256)
    {
      char v51 = 0;
    }
    else if ((a4 & 0xC0000000000) == 0x40000000000)
    {
      char v51 = 1;
    }
    else
    {
      if (a4) {
        unsigned int v65 = a4;
      }
      else {
        unsigned int v65 = dword_1EB1C96FC;
      }
      LOBYTE(v66) = 0;
      switch(*(unsigned char *)(*(void *)(v46 + 360) + v49))
      {
        case 4:
          LODWORD(v66) = (*(_DWORD *)(v46 + 316) + *(_DWORD *)(v46 + 312) * v65) >> 31;
          break;
        case 5:
          unint64_t v68 = (*(void *)(v46 + 320) + *(void *)(v46 + 312) * (unint64_t)v65) >> 34;
          LODWORD(v66) = v68 - 3 * ((1431655766 * (unint64_t)v68) >> 32);
          break;
        case 6:
          unint64_t v66 = ((*(void *)(v46 + 320) + *(void *)(v46 + 312) * (unint64_t)v65) >> 32) & 3;
          break;
        default:
          break;
      }
      char v51 = v66 + 2;
    }
    _xzm_xzone_malloc(v45, a3, (v51 + v50), 0, a5);
  }
  int v40 = (void *)v52;
  unint64_t v39 = v20;
  if (v52) {
    goto LABEL_57;
  }
}

uint64_t xzm_malloc_zone_malloc_type_memalign_slow(uint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, int8x8_t a5)
{
  uint64_t v5 = a1;
  if (a3 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0 && *(void *)(a1 + 232)) {
    a1 = *(void *)(a1 + 232);
  }
  _xzm_memalign(a1, a2, a3, a4, 0, a5);
  uint64_t v7 = v6;
  if (v6 && (*(unsigned char *)(v5 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  return v7;
}

uint64_t xzm_malloc_zone_malloc_type_malloc_with_options_slow(uint64_t a1, unint64_t a2, unint64_t a3, char a4, unint64_t a5, int8x8_t a6)
{
  uint64_t v7 = a1;
  if (a3 <= 0x8000 && (*(void *)(a1 + 296) & 0x80) != 0 && *(void *)(a1 + 232)) {
    a1 = *(void *)(a1 + 232);
  }
  xzm_malloc_zone_malloc_type_malloc_with_options(a1, a2, a3, a4, a5, a6);
  uint64_t v9 = v8;
  if ((a4 & 1) == 0 && v8 && (*(unsigned char *)(v7 + 296) & 0x20) != 0) {
    _platform_memset();
  }
  return v9;
}

BOOL has_default_zone0()
{
  return (has_injected_zone0 & 1) == 0;
}

uint64_t malloc_gdb_po_unsafe()
{
  if (xmmword_1E9309108 && xmmword_1E9309108()) {
    return 1;
  }
  uint64_t v1 = malloc_num_zones;
  if (malloc_num_zones)
  {
    for (uint64_t i = (char *)malloc_zones; ; i += 8)
    {
      if (*(_DWORD *)(*(void *)i + 104) >= 5u)
      {
        uint64_t v3 = *(void *)(*(void *)i + 96);
        uint64_t v4 = v3 ? *(void *)(*(void *)i + 96) : 0;
        if (*(void *)(v4 + 64) && (*(unsigned int (**)(void))(v3 + 64))()) {
          break;
        }
      }
      if (!--v1) {
        return 0;
      }
    }
    return 1;
  }
  return 0;
}

uint64_t zeroify_scalable_zone(uint64_t result)
{
  if (default_zone == (_UNKNOWN *)result)
  {
    *(void *)(result + 24) = legacy_zeroing_large_malloc;
    *(void *)(result + 40) = legacy_zeroing_large_valloc;
  }
  return result;
}

uint64_t legacy_zeroing_large_malloc(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = lite_zone;
  if (a2 < 0x1FC01)
  {
    if (!lite_zone) {
      uint64_t v2 = *(void *)malloc_zones;
    }
    return (*(uint64_t (**)(uint64_t, unint64_t))(v2 + 24))(v2, a2);
  }
  else
  {
    if (!lite_zone) {
      uint64_t v2 = *(void *)malloc_zones;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(v2 + 32))(v2, 1, a2);
  }
}

uint64_t legacy_zeroing_large_valloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = lite_zone;
  if (!lite_zone) {
    uint64_t v2 = *(void *)malloc_zones;
  }
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v2, a2);
  _platform_memset();
  return v3;
}

BOOL malloc_engaged_secure_allocator()
{
  return initial_xzone_zone != 0;
}

void malloc_create_legacy_default_zone()
{
  legacy_scalable_uint64_t zone = (malloc_zone_t *)create_legacy_scalable_zone(0, malloc_debug_flags);
  int v1 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v1, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v1) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v3 = *(malloc_zone_t **)malloc_zones;
  if (*(void *)(*(void *)malloc_zones + 72) && !_platform_strcmp()) {
    malloc_set_zone_name(v3, 0);
  }
  malloc_set_zone_name(legacy_scalable_zone, "DefaultMallocZone");
  malloc_zone_register_while_locked((uint64_t)legacy_scalable_zone, 1);
  int v4 = *(_DWORD *)(StatusReg + 24);
  int v5 = v4;
  atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v5, 0, memory_order_release, memory_order_relaxed);
  if (v5 != v4)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
  }
}

void malloc_destroy_zone(malloc_zone_t *zone)
{
  malloc_set_zone_name(zone, 0);
  malloc_zone_unregister(zone);
  destroy = zone->destroy;

  ((void (*)(malloc_zone_t *))destroy)(zone);
}

void malloc_zone_unregister(malloc_zone_t *zone)
{
  if (malloc_num_zones)
  {
    int v2 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v2, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v2) {
      os_unfair_lock_lock_with_options();
    }
    if (malloc_num_zones)
    {
      uint64_t v4 = 0;
      while (*(malloc_zone_t **)((char *)malloc_zones + v4) != zone)
      {
        v4 += 8;
        if (8 * malloc_num_zones == v4) {
          goto LABEL_8;
        }
      }
      size_t v7 = 8 * malloc_num_zones_allocated;
      mprotect(malloc_zones, v7, 3);
      uint64_t v8 = malloc_num_zones - 1;
      *(void *)((char *)malloc_zones + v4) = *((void *)malloc_zones + v8);
      malloc_num_zones = v8;
      mprotect(malloc_zones, v7, 1);
      unsigned int v9 = malloc_num_zones;
      if (malloc_num_zones >= initial_num_zones) {
        unsigned int v9 = initial_num_zones;
      }
      if (v9 <= 1) {
        unsigned int v9 = 1;
      }
      initial_num_zones = v9;
      unint64_t v10 = (int *)pFRZCounterLive;
      pFRZCounterLive = (uint64_t)pFRZCounterDrain;
      pFRZCounterDraiuint64_t n = v10;
      __dmb(0xBu);
      while (*pFRZCounterDrain)
        MEMORY[0x1996FA050](0, 1, 1);
      int v11 = *(_DWORD *)(StatusReg + 24);
      int v12 = v11;
      atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v12, 0, memory_order_release, memory_order_relaxed);
      if (v12 != v11)
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
      }
    }
    else
    {
LABEL_8:
      int v5 = *(_DWORD *)(StatusReg + 24);
      int v6 = v5;
      atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v6, 0, memory_order_release, memory_order_relaxed);
      if (v6 != v5) {
        os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
      }
      malloc_report(3u, (uint64_t)"*** malloc_zone_unregister() failed for %p\n");
    }
  }
}

void malloc_zone_check_fail(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = _simple_salloc();
  if (v4)
  {
    _simple_sprintf();
    if (!qword_1E930D260) {
      goto LABEL_13;
    }
    _simple_sappend();
    if (_MergedGlobals >= 2)
    {
      uint64_t v5 = 1;
      do
      {
        unint64_t v6 = v5 + 1;
        _simple_sprintf();
        uint64_t v5 = v6;
      }
      while (v6 < _MergedGlobals);
    }
    _simple_string();
    size_t v7 = "%s\n(Use 'atos' for a symbolic stack)\n";
  }
  else
  {
    malloc_report(0x10u, (uint64_t)"*** MallocCheckHeap: FAILED check at operation #%d\n");
    if (!qword_1E930D260) {
      goto LABEL_13;
    }
    malloc_report(0x10u, (uint64_t)"Stack for last operation where the malloc check succeeded: ");
    if (_MergedGlobals >= 2)
    {
      uint64_t v8 = 1;
      do
      {
        unint64_t v9 = v8 + 1;
        malloc_report(0x10u, (uint64_t)"%p ");
        uint64_t v8 = v9;
      }
      while (v9 < _MergedGlobals);
    }
    size_t v7 = "\n(Use 'atos' for a symbolic stack)\n";
  }
  malloc_report(0x10u, (uint64_t)v7);
LABEL_13:
  if (malloc_check_each >= 2) {
    malloc_report(0x10u, (uint64_t)"*** Recommend using 'setenv MallocCheckHeapStart %d; setenv MallocCheckHeapEach %d' to narrow down failure\n");
  }
  if (v4) {
    _simple_sfree();
  }
  if (malloc_check_abort)
  {
    unsigned int v10 = 0;
    unsigned int v11 = 211;
  }
  else
  {
    if (malloc_check_sleep < 1)
    {
      if (malloc_check_sleep < 0)
      {
        malloc_report(5u, (uint64_t)"*** Will sleep once for %d seconds to leave time to attach\n");
        unsigned int v10 = -malloc_check_sleep;
        malloc_check_sleep = 0;
      }
      else
      {
        unsigned int v10 = 0;
      }
    }
    else
    {
      malloc_report(5u, (uint64_t)"*** Will sleep for %d seconds to leave time to attach\n");
      unsigned int v10 = malloc_check_sleep;
    }
    unsigned int v11 = 147;
  }
  malloc_vreport(v11, v10, a1, 0, a2);
}

uint64_t _malloc_zone_malloc_instrumented_or_legacy(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v8 = *(void *)(StatusReg + 904);
  if (!v8) {
    *(void *)(StatusReg + 904) = (v3 >> 2);
  }
  int v9 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_check_start) {
    internal_check();
  }
  if (malloc_absolute_max_size >= a2)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, a2);
    if (malloc_logger) {
      malloc_logger(10, a1, a2, 0, v10, 0);
    }
    if (malloc_simple_stack_logging == 1)
    {
      malloc_report(0x325u, (uint64_t)"malloc (%p/%llu): ");
      if (!v9)
      {
LABEL_14:
        if (!v8) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
    }
    else if (!v9)
    {
      goto LABEL_14;
    }
    kdebug_trace();
    if (!v8) {
      goto LABEL_19;
    }
LABEL_15:
    if (v10) {
      return v10;
    }
    goto LABEL_21;
  }
  uint64_t v10 = 0;
  if (v8) {
    goto LABEL_15;
  }
LABEL_19:
  *(void *)(StatusReg + 904) = 0;
  if (v10) {
    return v10;
  }
LABEL_21:
  if (a3) {
    **(_DWORD **)(StatusReg + 8) = 12;
  }
  return v10;
}

void *__cdecl malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  return (void *)_malloc_zone_malloc((uint64_t)zone, size, 0);
}

uint64_t _malloc_zone_calloc_instrumented_or_legacy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v5 = a4;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v10 = *(void *)(StatusReg + 904);
  uint64_t v11 = v10;
  if (!v10)
  {
    uint64_t v11 = (v4 >> 2);
    *(void *)(StatusReg + 904) = v11;
  }
  int v12 = malloc_tracing_enabled;
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  if (malloc_check_start) {
    internal_check();
  }
  uint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a1, a2, a3, a4, v11);
  if (malloc_logger) {
    malloc_logger(74, a1, a3 * a2, 0, v13, 0);
  }
  if (malloc_simple_stack_logging == 1)
  {
    malloc_report(0x325u, (uint64_t)"calloc (%p/%llu*%llu): ");
    if (!v12)
    {
LABEL_11:
      if (v10) {
        goto LABEL_12;
      }
      goto LABEL_16;
    }
  }
  else if (!v12)
  {
    goto LABEL_11;
  }
  kdebug_trace();
  if (v10)
  {
LABEL_12:
    if (v13) {
      return v13;
    }
    goto LABEL_18;
  }
LABEL_16:
  *(void *)(StatusReg + 904) = 0;
  if (v13) {
    return v13;
  }
LABEL_18:
  if (v5) {
    **(_DWORD **)(StatusReg + 8) = 12;
  }
  return v13;
}

void *__cdecl malloc_zone_valloc(malloc_zone_t *zone, size_t size)
{
  return (void *)_malloc_zone_valloc((uint64_t)zone, size, 0);
}

void *__cdecl malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  return (void *)_malloc_zone_realloc((uint64_t)zone, (uint64_t)ptr, size, (v3 >> 2));
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return zone->zone_name;
}

uint64_t _posix_memalign(uint64_t *a1, unint64_t a2, unint64_t a3)
{
  uint64_t v6 = _malloc_zone_memalign((uint64_t)default_zone, a2, a3, 0, (v3 >> 2));
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t result = 0;
    *a1 = v7;
  }
  else if ((a2 & (a2 - 1)) == 0 && a2 > 7)
  {
    return 12;
  }
  else
  {
    return 22;
  }
  return result;
}

uint64_t malloc_claimed_address(uint64_t a1)
{
  if (!malloc_num_zones) {
    return 0;
  }
  if (lite_zone && malloc_zone_claimed_address(lite_zone, a1)) {
    return 1;
  }
  if (initial_num_zones)
  {
    uint64_t v3 = 0;
    while (!malloc_zone_claimed_address(*((void *)malloc_zones + v3), a1))
    {
      if (++v3 >= (unint64_t)initial_num_zones) {
        goto LABEL_9;
      }
    }
    return 1;
  }
LABEL_9:
  unint64_t v4 = (atomic_uint *)pFRZCounterLive;
  atomic_fetch_add((atomic_uint *volatile)pFRZCounterLive, 1u);
  if (malloc_num_zones <= initial_num_zones)
  {
LABEL_13:
    uint64_t result = 0;
  }
  else
  {
    uint64_t v5 = 8 * initial_num_zones;
    int v6 = malloc_num_zones - initial_num_zones;
    while (!malloc_zone_claimed_address(*(void *)((char *)malloc_zones + v5), a1))
    {
      v5 += 8;
      if (!--v6) {
        goto LABEL_13;
      }
    }
    uint64_t result = 1;
  }
  atomic_fetch_add(v4, 0xFFFFFFFF);
  return result;
}

void *reallocarrayf_DARWIN_EXTSN(void *a1, unint64_t a2, unint64_t a3)
{
  if (is_mul_ok(a2, a3)) {
    return reallocf(a1, a2 * a3);
  }
  **(_DWORD **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 8) = 12;
  return 0;
}

uint64_t malloc_zone_malloc_with_options_np(malloc_zone_t *a1, size_t a2, size_t a3, uint64_t a4)
{
  if (a2 && ((a2 & (a2 - 1)) != 0 || ((a2 - 1) & a3) != 0)) {
    return 0;
  }
  if (malloc_logger) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = malloc_slowpath == 0;
  }
  if (!v4) {
    return _malloc_zone_malloc_with_options_np_outlined(a1, a2, a3, a4);
  }
  if (!a1 || default_zone == (_UNKNOWN *)a1) {
    a1 = *(malloc_zone_t **)malloc_zones;
  }
  if (a1->version >= 0x10 && (valloc = (uint64_t (*)(void))a1[1].valloc) != 0) {
    return valloc();
  }
  else {
    return _malloc_zone_malloc_with_options_np_outlined(a1, a2, a3, a4);
  }
}

uint64_t malloc_memory_event_handler(uint64_t result)
{
  uint64_t v1 = result;
  if ((result & 0xF0000000) != 0 && (result & 0xFFFFFFF) == 0) {
    uint64_t result = _malloc_register_stack_logger(0);
  }
  int v2 = (uint64_t (*)(uint64_t))*((void *)&msl + 1);
  if (*((void *)&msl + 1))
  {
    return v2(v1);
  }
  return result;
}

uint64_t malloc_register_stack_logger()
{
  return _malloc_register_stack_logger(0);
}

void malloc_zone_batch_free(malloc_zone_t *zone, void **to_be_freed, unsigned int num)
{
  uint64_t v3 = *(void *)&num;
  if (malloc_check_start) {
    internal_check();
  }
  if (malloc_logger) {
    BOOL v6 = v3 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    uint64_t v10 = v3;
    uint64_t v11 = to_be_freed;
    do
    {
      uint64_t v12 = (uint64_t)*v11++;
      malloc_logger(12, zone, v12, 0, 0, 0);
      --v10;
    }
    while (v10);
  }
  batch_free = zone->batch_free;
  if (batch_free)
  {
    ((void (*)(malloc_zone_t *, void **, uint64_t))batch_free)(zone, to_be_freed, v3);
  }
  else
  {
    if (zone->free)
    {
      free = zone->free;
      if (!v3) {
        return;
      }
    }
    else
    {
      free = 0;
      if (!v3) {
        return;
      }
    }
    do
    {
      LODWORD(v3) = v3 - 1;
      uint64_t v9 = (uint64_t)*to_be_freed++;
      ((void (*)(malloc_zone_t *, uint64_t))free)(zone, v9);
    }
    while (v3);
  }
}

uint64_t malloc_sanitizer_is_enabled()
{
  return malloc_sanitizer_enabled;
}

uint64_t malloc_sanitizer_get_functions()
{
  return sanitizer;
}

uint64_t malloc_sanitizer_set_functions(uint64_t result)
{
  sanitizer = result;
  return result;
}

uint64_t malloc_get_all_zones(uint64_t a1, uint64_t (*a2)(task_name_t a1, uint64_t a2, uint64_t a3, unsigned int **a4), unsigned int **a3, _DWORD *a4)
{
  BOOL v6 = a2;
  if (!a2)
  {
    if (a1)
    {
      is_self = mach_task_is_self(a1);
      if (!is_self) {
        purgeable_ptr_in_use_enumerator_cold_1(is_self);
      }
    }
    BOOL v6 = (uint64_t (*)(task_name_t, uint64_t, uint64_t, unsigned int **))_malloc_default_reader_6;
  }
  unint64_t v16 = 0;
  v17[0] = 0;
  uint64_t v9 = v6(a1, (uint64_t)&malloc_zones, 8, (unsigned int **)v17);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = "*** malloc_get_all_zones: error reading zones_address at %p\n";
LABEL_11:
    malloc_report(3u, (uint64_t)v11);
    return v10;
  }
  uint64_t v12 = *(void *)v17[0];
  v17[1] = *(void *)v17[0];
  uint64_t v13 = v6(a1, (uint64_t)&malloc_num_zones, 4, &v16);
  if (v13)
  {
    uint64_t v10 = v13;
    uint64_t v11 = "*** malloc_get_all_zones: error reading num_zones at %p\n";
    goto LABEL_11;
  }
  uint64_t v14 = *v16;
  *a4 = v14;
  uint64_t v10 = v6(a1, v12, 8 * v14, a3);
  if (v10)
  {
    uint64_t v11 = "*** malloc_get_all_zones: error reading zones at %p\n";
    goto LABEL_11;
  }
  return v10;
}

void malloc_zone_print_ptr_info(void *ptr)
{
  if (ptr)
  {
    if (malloc_zone_from_ptr(ptr)) {
      printf("ptr %p in registered zone %p\n");
    }
    else {
      printf("ptr %p not in heap\n");
    }
  }
}

BOOLean_t malloc_zone_check(malloc_zone_t *zone)
{
  if (zone)
  {
    if (zone->introspect) {
      introspect = zone->introspect;
    }
    else {
      introspect = 0;
    }
    checatomic_ullong k = (uint64_t (*)(void))introspect->check;
    return check();
  }
  else
  {
    if (!malloc_num_zones) {
      return 1;
    }
    unint64_t v2 = 0;
    BOOLean_t v3 = 1;
    do
    {
      if (*(void *)(*((void *)malloc_zones + v2) + 96)) {
        uint64_t v4 = *(void *)(*((void *)malloc_zones + v2) + 96);
      }
      else {
        uint64_t v4 = 0;
      }
      ++v2;
      if (!(*(unsigned int (**)(void))(v4 + 16))()) {
        BOOLean_t v3 = 0;
      }
    }
    while (v2 < malloc_num_zones);
    return v3;
  }
}

void malloc_zone_print(malloc_zone_t *zone, BOOLean_t verbose)
{
  if (zone)
  {
    if (zone->introspect) {
      introspect = zone->introspect;
    }
    else {
      introspect = 0;
    }
    print = (void (*)(void))introspect->print;
    print();
  }
  else if (malloc_num_zones)
  {
    unint64_t v3 = 0;
    do
    {
      if (*(void *)(*((void *)malloc_zones + v3) + 96)) {
        uint64_t v4 = *(void *)(*((void *)malloc_zones + v3) + 96);
      }
      else {
        uint64_t v4 = 0;
      }
      ++v3;
      (*(void (**)(void))(v4 + 24))();
    }
    while (v3 < malloc_num_zones);
  }
}

void malloc_zone_log(malloc_zone_t *zone, void *address)
{
  if (zone)
  {
    if (zone->introspect) {
      introspect = zone->introspect;
    }
    else {
      introspect = 0;
    }
    log = (void (*)(void))introspect->log;
    log();
  }
  else if (malloc_num_zones)
  {
    unint64_t v3 = 0;
    do
    {
      if (*(void *)(*((void *)malloc_zones + v3) + 96)) {
        uint64_t v4 = *(void *)(*((void *)malloc_zones + v3) + 96);
      }
      else {
        uint64_t v4 = 0;
      }
      ++v3;
      (*(void (**)(void))(v4 + 32))();
    }
    while (v3 < malloc_num_zones);
  }
}

void mag_set_thread_index(int a1)
{
  _os_cpu_number_override = (_UNKNOWN *__ptr32)a1;
  nano_common_cpu_number_override_set();
}

void (*malloc_error())()
{
  return DefaultMallocError;
}

void DefaultMallocError()
{
  if (!_simple_salloc())
  {
    malloc_report(0x10u, (uint64_t)"*** error %d\n");
    qword_1E93090B0 = (uint64_t)"*** DefaultMallocError called";
    abort();
  }
  _simple_sprintf();
  _simple_string();
  malloc_report(0x10u, (uint64_t)"%s\n");
  qword_1E93090B0 = _simple_string();
  abort();
}

uint64_t _malloc_fork_prepare()
{
  int v0 = 0;
  uint64_t v4 = *(&xmmword_1E9309108 + 1);
  atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v0, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v0) {
    os_unfair_lock_lock_with_options();
  }
  mfm_lock();
  if (malloc_num_zones)
  {
    unint64_t v1 = 0;
    do
    {
      if (*(void *)(*((void *)malloc_zones + v1) + 96)) {
        uint64_t v2 = *(void *)(*((void *)malloc_zones + v1) + 96);
      }
      else {
        uint64_t v2 = 0;
      }
      ++v1;
      (*(void (**)(void))(v2 + 40))();
    }
    while (v1 < malloc_num_zones);
  }
  if (initial_xzone_zone) {
    xzm_force_lock_global_state(initial_xzone_zone);
  }
  uint64_t result = (uint64_t)v4;
  if (v4)
  {
    return v4();
  }
  return result;
}

void _malloc_fork_parent()
{
  int v0 = (void (*)(void))off_1E9309118;
  if (initial_xzone_zone) {
    xzm_force_unlock_global_state(initial_xzone_zone);
  }
  if (v0) {
    v0();
  }
  if (malloc_num_zones)
  {
    unint64_t v1 = 0;
    do
    {
      if (*(void *)(*((void *)malloc_zones + v1) + 96)) {
        uint64_t v2 = *(void *)(*((void *)malloc_zones + v1) + 96);
      }
      else {
        uint64_t v2 = 0;
      }
      ++v1;
      (*(void (**)(void))(v2 + 48))();
    }
    while (v1 < malloc_num_zones);
  }
  mfm_unlock();
  int v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  int v4 = v3;
  atomic_compare_exchange_strong_explicit(&_malloc_lock, (unsigned int *)&v4, 0, memory_order_release, memory_order_relaxed);
  if (v4 != v3)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_malloc_lock);
  }
}

void _malloc_fork_child()
{
  if (_malloc_entropy_initialized == 1 && initial_nano_zone != 0) {
    nanov2_forked_zone((void *)initial_nano_zone);
  }
  unint64_t v1 = (void (*)(void))off_1E9309120;
  if (initial_xzone_zone) {
    xzm_force_reinit_lock_global_state(initial_xzone_zone);
  }
  if (v1) {
    v1();
  }
  if (malloc_num_zones)
  {
    unint64_t v2 = 0;
    do
    {
      uint64_t v3 = *((void *)malloc_zones + v2);
      uint64_t v4 = *(void *)(v3 + 96);
      if (*(_DWORD *)(v3 + 104) > 8u)
      {
        if (v4) {
          uint64_t v6 = *(void *)(v3 + 96);
        }
        else {
          uint64_t v6 = 0;
        }
        (*(void (**)(void))(v6 + 104))();
      }
      else
      {
        if (v4) {
          uint64_t v5 = *(void *)(v3 + 96);
        }
        else {
          uint64_t v5 = 0;
        }
        (*(void (**)(void))(v5 + 48))();
      }
      ++v2;
    }
    while (v2 < malloc_num_zones);
  }
  mfm_reinit_lock();
  _malloc_os_unfair_lock_t lock = 0;
}

mstats *mstats(mstats *__return_ptr retstr)
{
  memset(&v6, 0, sizeof(v6));
  malloc_zone_statistics(0, &v6);
  size_t blocks_in_use = v6.blocks_in_use;
  size_t size_allocated = v6.size_allocated;
  size_t size_in_use = v6.size_in_use;
  retstr->bytes_total = v6.size_allocated;
  retstr->chunks_used = blocks_in_use;
  retstr->bytes_used = size_in_use;
  retstr->chunks_free = 0;
  retstr->bytes_free = size_allocated - size_in_use;
  return result;
}

BOOLean_t malloc_zone_enable_discharge_checking(malloc_zone_t *zone)
{
  if (zone->version < 7) {
    return 0;
  }
  introspect = zone->introspect;
  unint64_t v2 = introspect ? zone->introspect : 0;
  if (!v2->enable_discharge_checking) {
    return 0;
  }
  if (introspect) {
    uint64_t v3 = zone->introspect;
  }
  else {
    uint64_t v3 = 0;
  }
  return ((uint64_t (*)(void))v3->enable_discharge_checking)();
}

void malloc_zone_disable_discharge_checking(malloc_zone_t *zone)
{
  if (zone->version >= 7)
  {
    introspect = zone->introspect;
    unint64_t v2 = introspect ? zone->introspect : 0;
    if (v2->disable_discharge_checking)
    {
      if (introspect) {
        uint64_t v3 = zone->introspect;
      }
      else {
        uint64_t v3 = 0;
      }
      ((void (*)(void))v3->disable_discharge_checking)();
    }
  }
}

void malloc_zone_discharge(malloc_zone_t *zone, void *memory)
{
  if ((zone || (uint64_t zone = malloc_zone_from_ptr(memory)) != 0) && zone->version >= 7)
  {
    introspect = zone->introspect;
    uint64_t v3 = introspect ? zone->introspect : 0;
    if (v3->discharge)
    {
      if (introspect) {
        uint64_t v4 = zone->introspect;
      }
      else {
        uint64_t v4 = 0;
      }
      discharge = (void (*)(void))v4->discharge;
      discharge();
    }
  }
}

void malloc_zone_enumerate_discharged_pointers(malloc_zone_t *zone, void *report_discharged)
{
  if (zone)
  {
    if (zone->version >= 7)
    {
      introspect = zone->introspect;
      uint64_t v3 = introspect ? zone->introspect : 0;
      if (v3->enumerate_discharged_pointers)
      {
        if (introspect) {
          uint64_t v10 = zone->introspect;
        }
        else {
          uint64_t v10 = 0;
        }
        enumerate_discharged_pointers = (void (*)(void))v10->enumerate_discharged_pointers;
        enumerate_discharged_pointers();
      }
    }
  }
  else
  {
    unint64_t v4 = malloc_num_zones;
    if (malloc_num_zones)
    {
      unint64_t v5 = 0;
      malloc_statistics_t v6 = malloc_zones;
      do
      {
        uint64_t v7 = v6[v5];
        if (*(_DWORD *)(v7 + 104) >= 7u)
        {
          uint64_t v8 = *(void *)(v7 + 96);
          uint64_t v9 = v8 ? *(void *)(v7 + 96) : 0;
          if (*(void *)(v9 + 96))
          {
            (*(void (**)(void))(v8 + 96))();
            malloc_statistics_t v6 = malloc_zones;
            unint64_t v4 = malloc_num_zones;
          }
        }
        ++v5;
      }
      while (v5 < v4);
    }
  }
}

void malloc_zero_on_free_disable()
{
  malloc_zero_policy = 1;
}

uint64_t malloc_variant_is_debug_4test()
{
  return 0;
}

void set_malloc_singlethreaded()
{
  if ((set_malloc_singlethreaded_warned & 1) == 0) {
    set_malloc_singlethreaded_warned = 1;
  }
}

void malloc_singlethreaded()
{
  if ((malloc_singlethreaded_warned & 1) == 0)
  {
    malloc_report(3u, (uint64_t)"*** OBSOLETE: malloc_singlethreaded()\n");
    malloc_singlethreaded_warned = 1;
  }
}

uint64_t malloc_debug()
{
  return 0;
}

uint64_t malloc_get_thread_options()
{
  return *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 896);
}

uint64_t malloc_set_thread_options(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v4 = a1;
  unsigned int v2 = a1;
  if (a1)
  {
    unsigned int v2 = a1 | 6;
    LOBYTE(v4) = a1 | 6;
    uint64_t v1 = v4;
  }
  uint64_t result = pgm_thread_set_disabled((v2 >> 1) & 1);
  *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 896) = v1;
  return result;
}

uint64_t _malloc_register_stack_logger(int a1)
{
  if (malloc_sanitizer_enabled) {
    BOOL v1 = a1 == 0;
  }
  else {
    BOOL v1 = 0;
  }
  if (!v1)
  {
    if (*((void *)&msl + 1)) {
      return 1;
    }
    if (_dlopen)
    {
      uint64_t result = ((uint64_t (*)(const char *, uint64_t))_dlopen)("/System/Library/PrivateFrameworks/MallocStackLogging.framework/MallocStackLogging", 8);
      if (!result) {
        return result;
      }
      if (_register_msl_dylib_pred != -1) {
        _os_once();
      }
      if (*((void *)&msl + 1)) {
        return 1;
      }
      malloc_report(4u, (uint64_t)"failed to load MallocStackLogging.framework\n");
    }
  }
  return 0;
}

uint64_t turn_on_stack_logging(uint64_t a1)
{
  _malloc_register_stack_logger(0);
  unsigned int v2 = (uint64_t (*)(uint64_t))xmmword_1E9309138;
  if (!(void)xmmword_1E9309138) {
    return 0;
  }

  return v2(a1);
}

uint64_t (*turn_off_stack_logging())(void)
{
  _malloc_register_stack_logger(0);
  uint64_t result = (uint64_t (*)(void))*((void *)&xmmword_1E9309138 + 1);
  if (*((void *)&xmmword_1E9309138 + 1))
  {
    return (uint64_t (*)(void))result();
  }
  return result;
}

uint64_t default_zone_size()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t default_zone_malloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t default_zone_calloc()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t default_zone_destroy()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 64))();
}

uint64_t default_zone_batch_free()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t default_zone_pressure_relief()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t default_zone_ptr_in_use_enumerator()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  return (**(uint64_t (***)(void))(v0 + 96))();
}

uint64_t default_zone_check()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 16))();
}

uint64_t default_zone_print()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 24))();
}

uint64_t default_zone_log()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 32))();
}

uint64_t default_zone_force_lock()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 40))();
}

uint64_t default_zone_force_unlock()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 48))();
}

uint64_t default_zone_statistics()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 56))();
}

uint64_t default_zone_locked()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 64))();
}

uint64_t default_zone_reinit_lock()
{
  uint64_t v0 = lite_zone;
  if (!lite_zone) {
    uint64_t v0 = *(void *)malloc_zones;
  }
  if (*(void *)(v0 + 96)) {
    uint64_t v1 = *(void *)(v0 + 96);
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(v1 + 104))();
}

uint64_t (*register_msl_dylib(uint64_t (*result)(uint64_t (**)(), uint64_t)))(uint64_t (**)(), uint64_t)
{
  if (result)
  {
    uint64_t v1 = result;
    *((void *)&msl + 1) = _dlsym(result, "msl_handle_memory_event");
    xmmword_1E9309108 = (uint64_t (*)(void))_dlsym(v1, "msl_stack_logging_locked");
    *(&xmmword_1E9309108 + 1) = (uint64_t (*)(void))_dlsym(v1, "msl_fork_prepare");
    off_1E9309120 = (_UNKNOWN *)_dlsym(v1, "msl_fork_child");
    off_1E9309118 = (_UNKNOWN *)_dlsym(v1, "msl_fork_parent");
    *(void *)&xmmword_1E9309138 = _dlsym(v1, "msl_turn_on_stack_logging");
    *((void *)&xmmword_1E9309138 + 1) = _dlsym(v1, "msl_turn_off_stack_logging");
    *(void *)&xmmword_1E9309128 = _dlsym(v1, "msl_set_flags_from_environment");
    *((void *)&xmmword_1E9309128 + 1) = _dlsym(v1, "msl_initialize");
    uint64_t result = (uint64_t (*)(uint64_t (**)(), uint64_t))_dlsym(v1, "msl_copy_msl_lite_hooks");
    if (result)
    {
      return (uint64_t (*)(uint64_t (**)(), uint64_t))set_msl_lite_hooks(result);
    }
  }
  return result;
}

_DWORD *malloc_freezedry()
{
  uint64_t v0 = j__malloc(0x10uLL);
  size_t v1 = malloc_num_zones;
  *uint64_t v0 = 6;
  v0[1] = v1;
  *((void *)v0 + 1) = j__calloc(v1, 0x5000uLL);
  if (malloc_num_zones)
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    while (1)
    {
      int v4 = _platform_strcmp();
      unint64_t v5 = (char *)*((void *)v0 + 1);
      if (v4) {
        break;
      }
      memcpy(&v5[v2], *((const void **)malloc_zones + v3++), 0x5000uLL);
      v2 += 20480;
      if (v3 >= malloc_num_zones) {
        return v0;
      }
    }
    _free(v5);
    _free(v0);
    return 0;
  }
  return v0;
}

uint64_t malloc_jumpstart(uint64_t a1)
{
  if (*(_DWORD *)a1 != 6) {
    return 1;
  }
  if (*(_DWORD *)(a1 + 4))
  {
    uint64_t v2 = 0;
    unint64_t v3 = 0;
    do
    {
      int v4 = (malloc_zone_t *)(*(void *)(a1 + 8) + v2);
      v4->size = (size_t (__cdecl *)(_malloc_zone_t *, const void *))szone_size;
      v4->malloc = (void *(__cdecl *)(_malloc_zone_t *, size_t))frozen_malloc;
      v4->calloc = (void *(__cdecl *)(_malloc_zone_t *, size_t, size_t))frozen_calloc;
      v4->valloc = (void *(__cdecl *)(_malloc_zone_t *, size_t))frozen_valloc;
      v4->free = (void (__cdecl *)(_malloc_zone_t *, void *))frozen_free;
      v4->realloc = (void *(__cdecl *)(_malloc_zone_t *, void *, size_t))frozen_realloc;
      v4->destroy = (void (__cdecl *)(_malloc_zone_t *))frozen_destroy;
      v4->introspect = (malloc_introspection_t *)&szone_introspect;
      malloc_zone_register(v4);
      ++v3;
      v2 += 20480;
    }
    while (v3 < *(unsigned int *)(a1 + 4));
  }
  return 0;
}

void *frozen_malloc(int a1, size_t __size)
{
  return j__malloc(__size);
}

void *frozen_calloc(int a1, size_t __count, size_t __size)
{
  return j__calloc(__count, __size);
}

void *frozen_valloc(int a1, size_t a2)
{
  return j__valloc(a2);
}

void *frozen_realloc(uint64_t a1, const void *a2, size_t a3)
{
  unint64_t v5 = szone_size(a1, (unint64_t)a2);
  if (v5 >= a3) {
    return (void *)a2;
  }
  size_t v6 = v5;
  uint64_t v7 = j__malloc(a3);
  uint64_t v8 = v7;
  if (v6) {
    memcpy(v7, a2, v6);
  }
  return v8;
}

void tiny_print_region_free_list(uint64_t a1, unsigned int a2)
{
  int v2 = *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFF00000) + 4 * a2 + 0x3F28);
  unint64_t v3 = a1 & 0xFFFFFFFFFFF00000 | 0x4080;
  int v4 = (const void *)((16 * v2 - 16) + v3);
  if (!*(_WORD *)((a1 & 0xFFFFFFFFFFF00000) + 4 * a2 + 0x3F28)) {
    int v4 = 0;
  }
  int v5 = *(unsigned __int16 *)((a1 & 0xFFFFFFFFFFF00000) + 4 * a2 + 0x3F2A);
  size_t v6 = (const void *)((16 * v5 - 16) + v3);
  if (!*(_WORD *)((a1 & 0xFFFFFFFFFFF00000) + 4 * a2 + 0x3F2A)) {
    size_t v6 = 0;
  }
  malloc_printf("For region %p, first block: %d (%p), last block: %d (%p)\n", (const void *)(a1 & 0xFFFFFFFFFFF00000), v2, v4, v5, v6);
}

unint64_t tiny_finalize_region(unint64_t result, uint64_t a2)
{
  unint64_t v3 = *(void *)(a2 + 2128);
  if (v3)
  {
    unint64_t v4 = result;
    uint64_t v5 = *(void *)(a2 + 2144) - v3 + 0x100000;
    unint64_t v6 = v3 >> 4;
    unint64_t v7 = v5 & 0xFFFFFFFFFFF00000 | 0x4080;
    unint64_t v8 = v5 - v7;
    uint64_t v9 = (v5 - v7) & 0xFFFF0;
    unsigned int v10 = (v5 - v7) >> 4;
    if (v9 == 1032048
      || (unint64_t v11 = (v5 & 0xFFFFFFFFFFF00000) + 4 * (((v10 + 1) >> 4) & 0xFFE),
          *(_DWORD *)(v11 + 40) &= ~(1 << (v10 + 1)),
          v9))
    {
      unsigned int tiny_previous_free_msize = get_tiny_previous_free_msize(v5);
      if (tiny_previous_free_msize <= (unsigned __int16)v10)
      {
        unsigned int v13 = tiny_previous_free_msize;
        uint64_t v14 = ((v10 - tiny_previous_free_msize) >> 4) & 0xFFE;
        int v15 = 1 << (v10 - tiny_previous_free_msize);
        if ((*(_DWORD *)((v5 & 0xFFFFFFFFFFF00000) + 0x28 + 4 * v14) & v15) != 0
          && (*(_DWORD *)((v5 & 0xFFFFFFFFFFF00000) + 0x2C + 4 * v14) & v15) == 0)
        {
          unint64_t v16 = v7 + 16 * (unsigned __int16)(v10 - tiny_previous_free_msize);
          if (v16 + 16 >= (v16 & 0xFFFFFFFFFFF00000 | 0xFBF80) + 16512
            || ((*(_DWORD *)(((v16 + 16) & 0xFFFFFFFFFFF00000 | ((((v16 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8)
                           + 0x28) >> ((((v16 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
          {
            int v17 = 1;
          }
          else
          {
            int v17 = *(unsigned __int16 *)(v16 + 16);
          }
          if (v17 == tiny_previous_free_msize && v16)
          {
            *(int8x8_t *)((v5 & 0xFFFFFFFFFFF00000) + 0x28 + ((v8 >> 6) & 0x3FF8)) = vand_s8(*(int8x8_t *)((v5 & 0xFFFFFFFFFFF00000) + 0x28 + ((v8 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(~(1 << v10)));
            tiny_free_list_remove_ptr(v4, a2, v16, tiny_previous_free_msize);
            if (v13 >= 2 && !malloc_zero_policy) {
              *(_WORD *)(v16 + 16 * v13 - 2) = 0;
            }
            LOWORD(v6) = v13 + v6;
            uint64_t v5 = v16;
          }
        }
      }
    }
    uint64_t result = tiny_free_list_add_ptr(v4, a2, v5, (unsigned __int16)v6);
    *(void *)(a2 + 2128) = 0;
  }
  *(void *)(a2 + 2144) = 0;
  return result;
}

void tiny_free_list_remove_ptr(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  if ((a4 - 64) >= 0xFFFFFFC1) {
    unsigned int v4 = a4 - 1;
  }
  else {
    unsigned int v4 = 63;
  }
  uint64_t v5 = *(void **)(a3 + 8);
  unint64_t v6 = v5;
  uint64_t v7 = *(void *)a3;
  if (!*(void *)a3)
  {
    *(void *)(a2 + 8 * v4 + 32) = v5;
    if (!v5)
    {
      int v8 = 1;
      *(_DWORD *)(a2 + 4 * (v4 >> 5) + 2088) &= ~(1 << v4);
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if (*(void *)(v7 + 8) != a3)
  {
    int v14 = *(_DWORD *)(a1 + 620);
    int v15 = "tiny_free_list_remove_ptr: Internal invariant broken (next ptr of prev): ptr=%p, prev_next=%p\n";
    goto LABEL_26;
  }
  *(void *)(v7 + 8) = v5;
  if (v5)
  {
LABEL_9:
    if (*v5 == a3)
    {
      int v8 = 0;
      *unint64_t v6 = *(void *)a3;
      goto LABEL_11;
    }
    int v14 = *(_DWORD *)(a1 + 620);
    int v15 = "tiny_free_list_remove_ptr: Internal invariant broken (prev ptr of next): ptr=%p, next_prev=%p\n";
LABEL_26:
    malloc_zone_error(v14, 1, (uint64_t)v15);
    __break(1u);
    return;
  }
  int v8 = 1;
LABEL_11:
  unint64_t v9 = (a3 & 0xFFFFFFFFFFF00000) + 4 * v4 + 16168;
  int v10 = *(unsigned __int16 *)((a3 & 0xFFFFFFFFFFF00000) + 4 * v4 + 0x3F28);
  int v11 = (unsigned __int16)((a3 + 1032064) >> 4) + 1;
  uint64_t v12 = (_WORD *)(v9 | 2);
  int v13 = *(unsigned __int16 *)(v9 + 2);
  if (v11 == v10 && v11 == v13)
  {
    *uint64_t v12 = 0;
    *(_WORD *)unint64_t v9 = 0;
  }
  else if (v11 == v10)
  {
    if (v8) {
      purgeable_ptr_in_use_enumerator_cold_1(a1);
    }
    *(_WORD *)unint64_t v9 = ((v6 - 16512) >> 4) + 1;
  }
  else if (v11 == v13)
  {
    if (!v7) {
      purgeable_ptr_in_use_enumerator_cold_1(a1);
    }
    *uint64_t v12 = ((v7 - 16512) >> 4) + 1;
  }
}

unint64_t tiny_free_list_add_ptr(unint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 - 64 >= 0xFFFFFFC1) {
    uint64_t v4 = a4 - 1;
  }
  else {
    uint64_t v4 = 63;
  }
  uint64_t v5 = a2 + 8 * v4;
  unint64_t v6 = a3 & 0xFFFFFFFFFFF00000;
  unint64_t v7 = a3 & 0xFFFFFFFFFFF00000 | 0x4080;
  unint64_t v8 = a3 - v7;
  unint64_t v9 = a3 & 0xFFFFFFFFFFF00000 | ((a3 - v7) >> 6) & 0x3FF8;
  int v10 = 1 << ((a3 - v7) >> 4);
  int v11 = *(_DWORD *)(v9 + 0x28) | v10;
  int v12 = *(_DWORD *)(v9 + 0x2C) & ~v10;
  uint64_t v15 = *(void *)(v5 + 32);
  int v14 = (void *)(v5 + 32);
  uint64_t v13 = v15;
  *(_DWORD *)(v9 + 40) = v11;
  *(_DWORD *)(v9 + 44) = v12;
  if (a4 < 2)
  {
    if (a4) {
      goto LABEL_8;
    }
  }
  else
  {
    *(_WORD *)(a3 + 16 * a4 - 2) = a4;
  }
  *(_WORD *)(a3 + 16) = a4;
LABEL_8:
  if (!v13) {
    *(_DWORD *)(a2 + 4 * (v4 >> 5) + 2088) |= 1 << v4;
  }
  unint64_t v16 = (_WORD *)(v6 + 4 * v4 + 16168);
  if (*v16)
  {
    unint64_t v17 = 16 * (unsigned __int16)*v16 - 16 + v7;
    if (*(void *)v17)
    {
      uint64_t v18 = a3;
      *(void *)(*(void *)v17 + 8) = a3;
    }
    else
    {
      *int v14 = a3;
      uint64_t v18 = a3;
    }
    *(void *)a3 = *(void *)v17;
    *(void *)(a3 + 8) = v17;
    *(void *)unint64_t v17 = v18;
    __int16 v27 = (v8 >> 4) + 1;
  }
  else
  {
    unsigned int v19 = (void *)*v14;
    if (*(_DWORD *)((a3 & 0xFFFFFFFFFFF00000) + 0x18) == -1) {
      goto LABEL_31;
    }
    if (!v19) {
      goto LABEL_31;
    }
    uint64_t v20 = *(void *)(a2 + 2176);
    if (!v20 || v20 == v6) {
      goto LABEL_31;
    }
    unsigned int v21 = 0;
    uint64_t v22 = 0;
    int v23 = 0;
    do
    {
      if (*(_WORD *)((v20 & 0xFFFFFFFFFFF00000) + 4 * v4 + 0x3F2A))
      {
        int v23 = *(unsigned __int16 *)((v20 & 0xFFFFFFFFFFF00000) + 4 * v4 + 0x3F2A);
        uint64_t v22 = v20;
      }
      uint64_t v20 = *(void *)(v20 + 8);
      if (v20) {
        BOOL v24 = v20 == v6;
      }
      else {
        BOOL v24 = 1;
      }
    }
    while (!v24 && v21++ < 4);
    if (v23 && (unint64_t v26 = (v22 & 0xFFFFFFFFFFF00000) + 16512 + (16 * v23 - 16)) != 0)
    {
      unsigned int v19 = *(void **)((v22 & 0xFFFFFFFFFFF00000) + 0x4080 + (16 * v23 - 16) + 8);
      *(void *)((v22 & 0xFFFFFFFFFFF00000) + 0x4080 + (16 * v23 - 16) + 8) = a3;
      uint64_t result = result & 0xFFFFFFFFFFFFLL | 0xD796000000000000;
    }
    else
    {
LABEL_31:
      unint64_t v26 = 0;
      *int v14 = a3;
      uint64_t result = result & 0xFFFFFFFFFFFFLL | 0xD796000000000000;
    }
    *(void *)a3 = v26;
    if (v19) {
      *unsigned int v19 = a3;
    }
    *(void *)(a3 + 8) = v19;
    __int16 v27 = (v8 >> 4) + 1;
    *(_WORD *)((a3 & 0xFFFFFFFFFFF00000) + 4 * v4 + 0x3F2A) = v27;
  }
  *unint64_t v16 = v27;
  return result;
}

uint64_t tiny_free_detach_region(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = a3 + 16512;
  if ((unint64_t)(a3 + 16512) <= 0xFFFFFFFFFFF0407FLL)
  {
    unint64_t v7 = a3 + 0x100000;
    do
    {
      unint64_t v8 = v4 & 0xFFFFFFFFFFF00000 | 0x28;
      unint64_t v9 = v4 & 0xFFFFFFFFFFF00000 | 0x4080;
      unsigned int v10 = ((v4 - v9) >> 8) & 0xFFE;
      int v11 = 1 << ((v4 - v9) >> 4);
      int v12 = (unsigned int *)(v8 + 4 * v10);
      unint64_t v13 = *v12;
      if ((v13 & v11) == 0) {
        break;
      }
      if ((*(_DWORD *)(v8 + 4 * (v10 | 1)) & v11) != 0)
      {
        unsigned int v14 = ((v4 - v9) >> 4) & 0x1F;
        unint64_t v15 = ((unint64_t)v12[2] << (32 - v14)) | (v13 >> v14);
        if (v14) {
          v15 |= (unint64_t)v12[4] << -(char)v14;
        }
        if (v15 < 2) {
          return *(unsigned int *)(a3 + 20);
        }
        unsigned int v16 = __clz(__rbit64(v15 >> 1)) + 1;
      }
      else
      {
        if (v4 + 16 >= v9 + 1032064
          || ((*(_DWORD *)(((v4 + 16) & 0xFFFFFFFFFFF00000 | ((((v4 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((v4 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v16 = 1;
        }
        else
        {
          unsigned int v16 = *(unsigned __int16 *)(v4 + 16);
          if (!*(_WORD *)(v4 + 16)) {
            return *(unsigned int *)(a3 + 20);
          }
        }
        tiny_free_list_remove_ptr(a1, a2, v4, v16);
      }
      v4 += 16 * v16;
    }
    while (v4 < v7);
  }
  return *(unsigned int *)(a3 + 20);
}

uint64_t get_tiny_meta_header(uint64_t a1, _DWORD *a2)
{
  unint64_t v2 = a1 & 0xFFFFFFFFFFF00000 | 0x28;
  unint64_t v3 = a1 & 0xFFFFFFFFFFF00000 | 0x4080;
  unsigned int v4 = a1 - v3;
  unsigned int v5 = ((a1 - v3) >> 8) & 0xFFE;
  int v6 = 1 << ((a1 - v3) >> 4);
  *a2 = 0;
  unint64_t v7 = (unsigned int *)(v2 + 4 * v5);
  unint64_t v8 = *v7;
  if ((v8 & v6) == 0) {
    return 0;
  }
  if ((*(_DWORD *)(v2 + 4 * (v5 | 1)) & v6) != 0)
  {
    int v9 = (v4 >> 4) & 0x1F;
    unint64_t v10 = ((unint64_t)v7[2] << (32 - v9)) | (v8 >> ((v4 >> 4) & 0x1F));
    if (v9) {
      v10 |= (unint64_t)v7[4] << -(char)v9;
    }
    int v11 = __clz(__rbit64(v10 >> 1));
    if (v10 >= 2) {
      return (v11 + 1);
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v12 = 1;
    *a2 = 1;
    if (a1 + 16 < v3 + 1032064)
    {
      if ((*(_DWORD *)(((a1 + 16) & 0xFFFFFFFFFFF00000 | ((((a1 + 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((a1 + 16) & 0xFFFFFu) - 16512) >> 4))) {
        return 1;
      }
      else {
        return *(unsigned __int16 *)(a1 + 16);
      }
    }
  }
  return v12;
}

uint64_t tiny_free_reattach_region(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = a3 + 16512;
  uint64_t v4 = *(unsigned int *)(a3 + 16);
  if ((unint64_t)(a3 + 16512) <= 0xFFFFFFFFFFF0407FLL)
  {
    unint64_t v7 = a3 + 0x100000;
    do
    {
      unint64_t v8 = v3 & 0xFFFFFFFFFFF00000 | 0x28;
      unint64_t v9 = v3 & 0xFFFFFFFFFFF00000 | 0x4080;
      unsigned int v10 = ((v3 - v9) >> 8) & 0xFFE;
      int v11 = 1 << ((v3 - v9) >> 4);
      uint64_t v12 = (unsigned int *)(v8 + 4 * v10);
      unint64_t v13 = *v12;
      if ((v13 & v11) == 0) {
        break;
      }
      if ((*(_DWORD *)(v8 + 4 * (v10 | 1)) & v11) != 0)
      {
        unsigned int v14 = ((v3 - v9) >> 4) & 0x1F;
        unint64_t v15 = ((unint64_t)v12[2] << (32 - v14)) | (v13 >> v14);
        if (v14) {
          v15 |= (unint64_t)v12[4] << -(char)v14;
        }
        if (v15 < 2) {
          return v4;
        }
        unsigned int v16 = __clz(__rbit64(v15 >> 1)) + 1;
      }
      else
      {
        if (v3 + 16 >= v9 + 1032064
          || ((*(_DWORD *)(((v3 + 16) & 0xFFFFFFFFFFF00000 | ((((v3 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((v3 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v16 = 1;
        }
        else
        {
          unsigned int v16 = *(unsigned __int16 *)(v3 + 16);
          if (!*(_WORD *)(v3 + 16)) {
            return v4;
          }
        }
        tiny_free_list_add_ptr(a1, a2, v3, v16);
      }
      v3 += 16 * v16;
    }
    while (v3 < v7);
  }
  return v4;
}

uint64_t tiny_free_scan_madvise_free(uint64_t a1, os_unfair_lock_s *a2, uint64_t a3)
{
  v44[1] = *MEMORY[0x1E4F14BF8];
  int v6 = (_DWORD *)MEMORY[0x1E4F14C60];
  uint64_t result = MEMORY[0x1F41887A8]();
  uint64_t v12 = (char *)v44 - v11;
  if (v8 <= 0xFFFFFFFFFFF0407FLL)
  {
    LODWORD(v13) = 0;
    uint64_t v14 = *MEMORY[0x1E4F14C58];
    uint64_t v15 = ~*MEMORY[0x1E4F14C58];
    uint64_t result = 32;
    unint64_t v16 = v8;
    do
    {
      unint64_t v17 = v16 & 0xFFFFFFFFFFF00000 | 0x28;
      unint64_t v18 = v16 & 0xFFFFFFFFFFF00000 | 0x4080;
      unsigned int v19 = ((v16 - v18) >> 8) & 0xFFE;
      int v20 = 1 << ((v16 - v18) >> 4);
      unsigned int v21 = (unsigned int *)(v17 + 4 * v19);
      unint64_t v22 = *v21;
      if ((v22 & v20) == 0) {
        break;
      }
      if ((*(_DWORD *)(v17 + 4 * (v19 | 1)) & v20) != 0)
      {
        unsigned int v23 = ((v16 - v18) >> 4) & 0x1F;
        unint64_t v24 = ((unint64_t)v21[2] << (32 - v23)) | (v22 >> v23);
        if (v23) {
          v24 |= (unint64_t)v21[4] << -(char)v23;
        }
        if (v24 < 2) {
          break;
        }
        unint64_t v25 = 16 * __clz(__rbit64(v24 >> 1)) + 16;
      }
      else
      {
        if (v16 + 16 >= v18 + v10
          || ((*(_DWORD *)(((v16 + 16) & 0xFFFFFFFFFFF00000 | ((((v16 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((v16 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v26 = 1;
        }
        else
        {
          unsigned int v26 = *(unsigned __int16 *)(v16 + 16);
          if (v16 == v8 && !*(_WORD *)(v16 + 16))
          {
            unint64_t v32 = (v8 + v14 + 18) & v15;
            unint64_t v33 = (v8 + 1048574) & v15;
            BOOL v29 = v33 > v32;
            unint64_t v34 = v33 - v32;
            if (v29)
            {
              unint64_t v35 = (v32 - v8) >> v9;
              unsigned int v36 = &v12[2 * (int)v13];
              *unsigned int v36 = v35;
              v36[1] = v34 >> v9;
              LODWORD(v13) = v13 + 1;
            }
            break;
          }
          if (!*(_WORD *)(v16 + 16)) {
            break;
          }
        }
        unint64_t v27 = (v16 + v14 + 18) & v15;
        unint64_t v25 = 16 * v26;
        unint64_t v28 = (v16 + v25 - 2) & v15;
        BOOL v29 = v28 > v27;
        unint64_t v30 = v28 - v27;
        if (v29)
        {
          uint64_t v31 = &v12[2 * (int)v13];
          *uint64_t v31 = (v27 - a3) >> v9;
          v31[1] = v30 >> v9;
          LODWORD(v13) = v13 + 1;
        }
      }
      v16 += v25;
    }
    while (v16 < v8 + v10);
    if ((int)v13 >= 1)
    {
      atomic_fetch_add((atomic_uint *volatile)(a3 + 28), 1u);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      int v38 = *(_DWORD *)(StatusReg + 24);
      int v39 = v38;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v39, 0, memory_order_release, memory_order_relaxed);
      if (v39 != v38) {
        os_unfair_lock_unlock(a2);
      }
      uint64_t v13 = v13;
      int v40 = (unsigned __int8 *)(v12 + 1);
      do
      {
        uint64_t v41 = a3 + (*(v40 - 1) << *v6);
        int v42 = *v40;
        v40 += 2;
        uint64_t result = mvm_madvise_free(a1, a3, v41, v41 + (v42 << *v6), 0, *(_DWORD *)(a1 + 620) & 0x20);
        --v13;
      }
      while (v13);
      int v43 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v43, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v43) {
        uint64_t result = os_unfair_lock_lock_with_options();
      }
      atomic_fetch_add((atomic_uint *volatile)(a3 + 28), 0xFFFFFFFF);
    }
  }
  return result;
}

void tiny_free_no_lock(os_unfair_lock_s *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, int a6, char a7)
{
  if (*(_DWORD *)(a4 + 16508) != unk_1EB1C96F9)
  {
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
    return;
  }
  unsigned __int16 v8 = a6;
  int v71 = (unsigned __int16 *)(a4 + 16420);
  uint64_t v11 = (16 * a6);
  unint64_t v12 = a5 + v11;
  unint64_t v13 = a5 & 0xFFFFFFFFFFF00000;
  unint64_t v14 = a5 & 0xFFFFFFFFFFF00000 | 0x4080;
  unint64_t v15 = a5 - v14;
  unint64_t v16 = read_memory + 7680;
  if (((a5 - v14) & 0xFFFF0) == 0) {
    goto LABEL_7;
  }
  unsigned int tiny_previous_free_msize = get_tiny_previous_free_msize(a5);
  if (tiny_previous_free_msize > (unsigned __int16)(v15 >> 4))
  {
    unint64_t v18 = a5;
    unint64_t v16 = read_memory + 7680;
    goto LABEL_18;
  }
  unsigned int v19 = tiny_previous_free_msize;
  uint64_t v20 = v13 | 0x28;
  unsigned int v21 = (v15 >> 4) - tiny_previous_free_msize;
  uint64_t v22 = (v21 >> 4) & 0xFFE;
  int v23 = 1 << ((v15 >> 4) - tiny_previous_free_msize);
  unint64_t v16 = read_memory + 7680;
  if ((*(_DWORD *)((v13 | 0x28) + 4 * v22) & v23) == 0)
  {
    unint64_t v18 = a5;
    goto LABEL_18;
  }
  if ((*(_DWORD *)((v13 | 0x2C) + 4 * v22) & v23) != 0
    || ((unint64_t v24 = v14 + 16 * (unsigned __int16)v21, v24 + 16 < (v24 & 0xFFFFFFFFFFF00000 | 0xFBF80) + 16512)
     && ((*(_DWORD *)(((v24 + 16) & 0xFFFFFFFFFFF00000 | ((((v24 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((v24 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) == 0
      ? (int v25 = *(unsigned __int16 *)(v24 + 16))
      : (int v25 = 1),
        v25 != tiny_previous_free_msize))
  {
LABEL_7:
    unint64_t v18 = a5;
    goto LABEL_18;
  }
  unint64_t v18 = a5;
  if (v24)
  {
    *(int8x8_t *)(v20 + ((v15 >> 6) & 0x3FF8)) = vand_s8(*(int8x8_t *)(v20 + ((v15 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(~(1 << (v15 >> 4))));
    tiny_free_list_remove_ptr((uint64_t)a1, a2, v24, tiny_previous_free_msize);
    unint64_t v16 = &read_memory[960];
    if (v19 >= 2 && !malloc_zero_policy) {
      *(_WORD *)(v24 + 16 * v19 - 2) = 0;
    }
    v8 += v19;
    unint64_t v18 = v24;
  }
LABEL_18:
  if (v12 >= a4 + 0x100000
    || (unint64_t v26 = v12 & 0xFFFFFFFFFFF00000 | 0x4080,
        unsigned int v27 = v12 - v26,
        unint64_t v28 = ((v12 - v26) >> 8) & 0xFFE,
        BOOL v29 = (int8x8_t *)((v12 & 0xFFFFFFFFFFF00000 | (8 * ((v28 >> 1) & 0x7FF))) + 40),
        int v30 = 1 << ((v12 - v26) >> 4),
        (*(_DWORD *)((v12 & 0xFFFFFFFFFFF00000 | (8 * ((v28 >> 1) & 0x7FF))) + 0x28) & v30) == 0)
    || (*(_DWORD *)((v12 & 0xFFFFFFFFFFF00000) + 4 * v28 + 0x2C) & v30) != 0)
  {
    char v31 = a7;
    goto LABEL_22;
  }
  if (v12 + 16 >= v26 + 1032064
    || ((*(_DWORD *)(((v12 + 16) & 0xFFFFFFFFFFF00000 | ((((v12 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((v12 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
  {
    LODWORD(v38) = 1;
    goto LABEL_51;
  }
  unint64_t v38 = *(unsigned __int16 *)(v12 + 16);
  if (v38 < 0x40)
  {
LABEL_51:
    tiny_free_list_remove_ptr((uint64_t)a1, a2, v12, v38);
    unsigned int v39 = v38;
    *BOOL v29 = vand_s8(*v29, (int8x8_t)vdup_n_s32(~v30));
    unint64_t v16 = &read_memory[960];
    char v31 = a7;
    if (!malloc_zero_policy)
    {
      *(void *)unint64_t v12 = 0;
      *(void *)(v12 + 8) = 0;
      if (v39 >= 2)
      {
        *(_WORD *)(v12 + 16) = 0;
        int v40 = (_WORD *)(v12 + 16 * (v39 & 0xFFF) - 2);
LABEL_88:
        *int v40 = 0;
        goto LABEL_89;
      }
      if (!v39)
      {
        int v40 = (_WORD *)(v12 + 16);
        goto LABEL_88;
      }
    }
LABEL_89:
    v8 += v39;
LABEL_22:
    unint64_t v32 = (unint64_t)a1;
    if (*((_DWORD *)v16 + 173) && (v31 & 2) == 0 && (a1[155]._os_unfair_lock_opaque & 0x20) != 0) {
      _platform_memset();
    }
    tiny_free_list_add_ptr((unint64_t)a1, a2, v18, v8);
    goto LABEL_27;
  }
  uint64_t v64 = *(unint64_t **)(v12 + 8);
  if (*(void *)v12) {
    *(void *)(*(void *)v12 + 8) = v18;
  }
  else {
    *(void *)(a2 + 536) = v18;
  }
  if (v64) {
    *uint64_t v64 = v18;
  }
  v8 += v38;
  *(void *)unint64_t v18 = *(void *)v12;
  *(void *)(v18 + 8) = *(void *)(v12 + 8);
  *BOOL v29 = vand_s8(*v29, (int8x8_t)vdup_n_s32(~v30));
  if (!*((_DWORD *)v16 + 173))
  {
    *(_WORD *)(v12 + 16) = 0;
    *(void *)unint64_t v12 = 0;
    *(void *)(v12 + 8) = 0;
    *(_WORD *)(v12 + 16 * v38 - 2) = 0;
  }
  unint64_t v65 = (v18 & 0xFFFFF) - 16512;
  unint64_t v66 = v18 & 0xFFFFFFFFFFF00000 | (v65 >> 6) & 0x3FF8;
  int v67 = 1 << (v65 >> 4);
  int v68 = *(_DWORD *)(v66 + 0x2C);
  *(_DWORD *)(v66 + 40) |= v67;
  *(_DWORD *)(v66 + 44) = v68 & ~v67;
  char v31 = a7;
  if (v8 >= 2u)
  {
    *(_WORD *)(v18 + 16 * v8 - 2) = v8;
    unint64_t v32 = (unint64_t)a1;
LABEL_99:
    *(_WORD *)(v18 + 16) = v8;
    goto LABEL_100;
  }
  unint64_t v32 = (unint64_t)a1;
  if (!v8) {
    goto LABEL_99;
  }
LABEL_100:
  unsigned __int16 v69 = (v65 >> 4) + 1;
  unsigned __int16 v70 = (v27 >> 4) + 1;
  if (*v71 == v70) {
    *int v71 = v69;
  }
  if (v71[1] == v70) {
    v71[1] = v69;
  }
LABEL_27:
  *(void *)(a2 + 2152) -= v11;
  unsigned int v33 = *(_DWORD *)(a4 + 16) - v11;
  *(_DWORD *)(a4 + 16) = v33;
  if ((v31 & 1) == 0)
  {
    --*(_DWORD *)(a4 + 20);
    --*(_DWORD *)(a2 + 2168);
  }
  if (aggressive_madvise_enabled)
  {
    tiny_madvise_free_range_no_lock(v32, (os_unfair_lock_s *)a2, a4, a5, v11, v18, v8);
    unsigned int v33 = *(_DWORD *)(a4 + 16);
  }
  if (a3 == -1)
  {
    if (aggressive_madvise_enabled)
    {
      if (v33) {
        return;
      }
    }
    else
    {
      tiny_madvise_free_range_no_lock(v32, (os_unfair_lock_s *)a2, a4, a5, v11, v18, v8);
      if (v33) {
        return;
      }
    }
    if (*(int *)(a4 + 28) <= 0)
    {
      unint64_t v43 = tiny_free_try_depot_unmap_no_lock((os_unfair_lock_s *)v32, a2, a4);
      int v44 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      int v45 = v44;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v45, 0, memory_order_release, memory_order_relaxed);
      if (v45 == v44) {
        goto LABEL_77;
      }
      uint64_t v46 = (os_unfair_lock_s *)a2;
LABEL_76:
      os_unfair_lock_unlock(v46);
LABEL_77:
      if (v43)
      {
        unsigned int v62 = *(_DWORD *)(v32 + 620);
        if ((v62 & 4) != 0) {
          int v63 = -2;
        }
        else {
          int v63 = -4;
        }
        mvm_deallocate_pages(v43, 0x100000, v63 & v62);
      }
    }
  }
  else
  {
    if (v33 <= 0xBCF9F) {
      *(unsigned char *)(a4 + 32) = 1;
    }
    unint64_t v34 = *(void *)(a2 + 2160);
    unint64_t v35 = *(void *)(a2 + 2152);
    if (v34 - v35 >= 0x179F41 && v35 < v34 - (v34 >> 2))
    {
      uint64_t v36 = *(void *)(a2 + 2184);
      if (v36)
      {
        unint64_t v37 = (int64x2_t *)(a2 + 2152);
        while (!*(unsigned char *)(v36 + 32) || *(_DWORD *)(v36 + 28))
        {
          uint64_t v36 = *(void *)v36;
          if (!v36) {
            return;
          }
        }
        if (*(void *)(a2 + 2144) == (v36 & 0xFFFFFFFFFFF00000)
          && (*(void *)(a2 + 2128) || *(void *)(a2 + 2136)))
        {
          tiny_finalize_region(v32, a2);
        }
        uint64_t v41 = *(void *)v36;
        int v42 = *(uint64_t **)(v36 + 8);
        if (*(void *)v36)
        {
          *(void *)(v41 + 8) = v42;
          int v42 = *(uint64_t **)(v36 + 8);
        }
        else
        {
          *(void *)(a2 + 2176) = v42;
        }
        if (!v42) {
          int v42 = (uint64_t *)(a2 + 2184);
        }
        *int v42 = v41;
        *(void *)uint64_t v36 = 0;
        *(void *)(v36 + 8) = 0;
        --*(_DWORD *)(a2 + 2172);
        int v47 = tiny_free_detach_region(v32, a2, v36 & 0xFFFFFFFFFFF00000);
        int v48 = 0;
        uint64_t v49 = *(void *)(v32 + 624);
        char v50 = (os_unfair_lock_s *)(v49 - 2560);
        unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v49 - 2560), (unsigned int *)&v48, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v48) {
          os_unfair_lock_lock_with_options();
        }
        *(_DWORD *)((v36 & 0xFFFFFFFFFFF00000) + 0x18) = -1;
        *(_DWORD *)(v36 + 28) = 0;
        uint64_t v52 = tiny_free_reattach_region((unint64_t)a1, v49 - 2560, v36 & 0xFFFFFFFFFFF00000);
        int64x2_t v53 = vdupq_n_s64(0xFFFFFFFFFFF04080);
        v54.i64[1] = v53.i64[1];
        v54.i64[0] = v52;
        v55.i64[0] = vsubq_s64(*v37, v54).u64[0];
        v55.i64[1] = vaddq_s64(*v37, v53).i64[1];
        *unint64_t v37 = v55;
        *(_DWORD *)(a2 + 2168) -= v47;
        int v56 = *(_DWORD *)(StatusReg + 24);
        int v57 = v56;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v57, 0, memory_order_release, memory_order_relaxed);
        if (v57 != v56) {
          os_unfair_lock_unlock((os_unfair_lock_t)a2);
        }
        int64x2_t v58 = vdupq_n_s64(0xFBF80uLL);
        v58.i64[0] = v52;
        *(int64x2_t *)(v49 - 408) = vaddq_s64(*(int64x2_t *)(v49 - 408), v58);
        *(_DWORD *)(v49 - 392) += v47;
        uint64_t v59 = *(void *)(v49 - 376);
        if (v59) {
          *(void *)(v59 + 8) = v36;
        }
        else {
          *(void *)(v49 - 384) = v36;
        }
        *(void *)uint64_t v36 = v59;
        *(void *)(v49 - 376) = v36;
        *(void *)(v36 + 8) = 0;
        *(unsigned char *)(v36 + 32) = 0;
        ++*(_DWORD *)(v49 - 388);
        unint64_t v32 = (unint64_t)a1;
        if (!aggressive_madvise_enabled) {
          tiny_free_scan_madvise_free((uint64_t)a1, v50, v36 & 0xFFFFFFFFFFF00000);
        }
        unint64_t v43 = tiny_free_try_depot_unmap_no_lock(a1, (uint64_t)v50, v36);
        int v60 = *(_DWORD *)(StatusReg + 24);
        int v61 = v60;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v50, (unsigned int *)&v61, 0, memory_order_release, memory_order_relaxed);
        if (v61 == v60) {
          goto LABEL_77;
        }
        uint64_t v46 = v50;
        goto LABEL_76;
      }
    }
  }
}

unint64_t tiny_madvise_free_range_no_lock(unint64_t result, os_unfair_lock_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, unsigned int a7)
{
  uint64_t v7 = *MEMORY[0x1E4F14C58];
  unint64_t v8 = (*MEMORY[0x1E4F14C58] + a6 + 18) & ~*MEMORY[0x1E4F14C58];
  unint64_t v9 = (a6 + 16 * a7 - 2) & ~*MEMORY[0x1E4F14C58];
  if (v8 < v9)
  {
    unint64_t v10 = (a4 - 2) & ~v7;
    unint64_t v11 = (a5 + a4 + v7 + 18) & ~v7;
    unint64_t v12 = v8 <= v10 ? v10 : (*MEMORY[0x1E4F14C58] + a6 + 18) & ~*MEMORY[0x1E4F14C58];
    unint64_t v13 = v9 >= v11 ? v11 : (a6 + 16 * a7 - 2) & ~*MEMORY[0x1E4F14C58];
    if (v12 < v13)
    {
      unint64_t v18 = result;
      tiny_free_list_remove_ptr(result, (uint64_t)a2, a6, a7);
      set_tiny_meta_header_in_use(a6, a7);
      atomic_fetch_add((atomic_uint *volatile)(a3 + 28), 1u);
      unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      int v20 = *(_DWORD *)(StatusReg + 24);
      int v21 = v20;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v21, 0, memory_order_release, memory_order_relaxed);
      if (v21 != v20) {
        os_unfair_lock_unlock(a2);
      }
      mvm_madvise_free(v18, a3, v12, v13, v18 + 640, *(_DWORD *)(v18 + 620) & 0x20);
      int v22 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)a2, (unsigned int *)&v22, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v22) {
        os_unfair_lock_lock_with_options();
      }
      atomic_fetch_add((atomic_uint *volatile)(a3 + 28), 0xFFFFFFFF);
      unint64_t v23 = (a6 & 0xFFFFF) - 16512;
      unint64_t v24 = a6 & 0xFFFFFFFFFFF00000 | (v23 >> 6) & 0x3FF8;
      LODWORD(v23) = 1 << (v23 >> 4);
      int v25 = *(_DWORD *)(v24 + 40) | v23;
      LODWORD(v23) = *(_DWORD *)(v24 + 44) & ~v23;
      *(_DWORD *)(v24 + 40) = v25;
      *(_DWORD *)(v24 + 44) = v23;
      if (a7 < 2)
      {
        if (a7)
        {
LABEL_18:
          return tiny_free_list_add_ptr(v18, (uint64_t)a2, a6, a7);
        }
      }
      else
      {
        *(_WORD *)(a6 + 16 * a7 - 2) = a7;
      }
      *(_WORD *)(a6 + 16) = a7;
      goto LABEL_18;
    }
  }
  return result;
}

uint64_t tiny_memalign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = a4 + 15;
  uint64_t v8 = a1 + 16512;
  uint64_t should_clear = tiny_malloc_should_clear(a1 + 16512, (unsigned __int16)((a4 + 15) >> 4), 0);
  uint64_t v10 = should_clear;
  if (!should_clear) {
    return v10;
  }
  unint64_t v11 = v7 >> 4;
  if (((a2 - 1) & should_clear) != 0) {
    uint64_t v12 = a2 - ((a2 - 1) & should_clear);
  }
  else {
    uint64_t v12 = 0;
  }
  int v13 = a3 + 15;
  unint64_t v14 = (unint64_t)(a3 + 15) >> 4;
  int v15 = v11 - (v14 + ((v12 + 15) >> 4));
  if (!(unsigned __int16)((v12 + 15) >> 4))
  {
    int v27 = (unsigned __int16)(v11 - (v14 + ((v12 + 15) >> 4)));
    if ((_WORD)v11 == (_WORD)v14 + (unsigned __int16)((v12 + 15) >> 4)) {
      return v10;
    }
    goto LABEL_22;
  }
  int v43 = (unsigned __int16)((v12 + 15) >> 4);
  int v44 = a3 + 15;
  int v45 = v11 - (v14 + ((v12 + 15) >> 4));
  uint64_t v46 = v8;
  int v16 = 0;
  uint64_t v17 = v12 + should_clear;
  uint64_t v18 = *(void *)(a1 + 17136);
  int v19 = *(_DWORD *)((should_clear & 0xFFFFFFFFFFF00000) + 0x18);
  int v20 = (os_unfair_lock_s *)(v18 + 2560 * v19);
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v20, (unsigned int *)&v16, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v16) {
    os_unfair_lock_lock_with_options();
  }
  int v22 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
  if (v22 != v19)
  {
    do
    {
      int v23 = *(_DWORD *)(StatusReg + 24);
      int v24 = v23;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v20, (unsigned int *)&v24, 0, memory_order_release, memory_order_relaxed);
      if (v24 != v23) {
        os_unfair_lock_unlock(v20);
      }
      int v25 = 0;
      int v20 = (os_unfair_lock_s *)(v18 + 2560 * v22);
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v20, (unsigned int *)&v25, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v25) {
        os_unfair_lock_lock_with_options();
      }
      BOOL v26 = v22 == *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
      int v22 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
    }
    while (!v26);
  }
  set_tiny_meta_header_in_use(v17, (unsigned __int16)v14);
  ++v20[542]._os_unfair_lock_opaque;
  LOWORD(v15) = v45;
  int v27 = (unsigned __int16)v45;
  if ((_WORD)v45) {
    *(_DWORD *)((v17 & 0xFFFFFFFFFFF00000 | ((v14 + (((v17 & 0xFFFFFuLL) - 16512) >> 4)) >> 2) & 0x3FF8) + 0x2C) |= 1 << (v14 + (((v17 & 0xFFFFFuLL) - 16512) >> 4));
  }
  int v28 = *(_DWORD *)(StatusReg + 24);
  int v29 = v28;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v20, (unsigned int *)&v29, 0, memory_order_release, memory_order_relaxed);
  uint64_t v8 = v46;
  if (v29 != v28) {
    os_unfair_lock_unlock(v20);
  }
  free_tiny(v46, v10, v10 & 0xFFFFFFFFFFF00000, (16 * v43), 1);
  uint64_t v10 = v17;
  int v13 = v44;
  if ((_WORD)v45)
  {
LABEL_22:
    int v47 = v27;
    int v30 = 0;
    uint64_t v31 = (*(void *)&v13 & 0xFFFF0) + v10;
    uint64_t v32 = *(void *)(a1 + 17136);
    int v33 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
    unint64_t v34 = (os_unfair_lock_s *)(v32 + 2560 * v33);
    unint64_t v35 = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v34, (unsigned int *)&v30, *(_DWORD *)(v35 + 24), memory_order_acquire, memory_order_acquire);
    if (v30) {
      os_unfair_lock_lock_with_options();
    }
    int v36 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
    if (v36 != v33)
    {
      do
      {
        int v37 = *(_DWORD *)(v35 + 24);
        int v38 = v37;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v34, (unsigned int *)&v38, 0, memory_order_release, memory_order_relaxed);
        if (v38 != v37) {
          os_unfair_lock_unlock(v34);
        }
        int v39 = 0;
        unint64_t v34 = (os_unfair_lock_s *)(v32 + 2560 * v36);
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v34, (unsigned int *)&v39, *(_DWORD *)(v35 + 24), memory_order_acquire, memory_order_acquire);
        if (v39) {
          os_unfair_lock_lock_with_options();
        }
        BOOL v26 = v36 == *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
        int v36 = *(_DWORD *)((v10 & 0xFFFFFFFFFFF00000) + 0x18);
      }
      while (!v26);
    }
    set_tiny_meta_header_in_use(v31, (unsigned __int16)v15);
    ++v34[542]._os_unfair_lock_opaque;
    int v40 = *(_DWORD *)(v35 + 24);
    int v41 = v40;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v34, (unsigned int *)&v41, 0, memory_order_release, memory_order_relaxed);
    if (v41 != v40) {
      os_unfair_lock_unlock(v34);
    }
    free_tiny(v8, v31, v31 & 0xFFFFFFFFFFF00000, (16 * v47), 1);
  }
  return v10;
}

uint64_t tiny_malloc_should_clear(unint64_t a1, uint64_t a2, int a3)
{
  signed int v7 = rack_get_thread_index(a1) % *(_DWORD *)(a1 + 608);
  uint64_t v8 = *(void *)(a1 + 624);
  unint64_t v9 = (os_unfair_lock_s *)(v8 + 2560 * v7);
  if (malloc_tracing_enabled) {
    kdebug_trace();
  }
  int v10 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v10, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v10) {
    os_unfair_lock_lock_with_options();
  }
  uint64_t v12 = v8 + 2560 * v7;
  int v14 = *(unsigned __int16 *)(v12 + 16);
  int v13 = (_WORD *)(v12 + 16);
  if (v14 == a2)
  {
    uint64_t v15 = v8 + 2560 * v7;
    uint64_t v16 = *(void *)(v15 + 8);
    *(void *)(v15 + 8) = 0;
    *int v13 = 0;
    *(void *)(v15 + 24) = 0;
    int v17 = *(_DWORD *)(StatusReg + 24);
    LODWORD(v15) = v17;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v15, 0, memory_order_release, memory_order_relaxed);
    if (v15 != v17) {
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 2560 * v7));
    }
    if (malloc_zero_policy == 2) {
      goto LABEL_33;
    }
    if (malloc_zero_policy != 1)
    {
      if (malloc_zero_policy || !malloc_zero_on_free_sample_period) {
        return v16;
      }
      uint64_t v18 = *(void *)(StatusReg + 888);
      BOOL v19 = v18 + 1 == malloc_zero_on_free_sample_period;
      uint64_t v20 = v18 + 1 == malloc_zero_on_free_sample_period ? 0 : v18 + 1;
      *(void *)(StatusReg + 888) = v20;
      if (!v19) {
        return v16;
      }
LABEL_30:
      if (_platform_memcmp_zero_aligned8()) {
        tiny_zero_corruption_abort(v16);
      }
      return v16;
    }
LABEL_32:
    if (!a3) {
      return v16;
    }
LABEL_33:
    _platform_memset();
    return v16;
  }
  tiny_malloc_from_free_list(a1, v8 + 2560 * v7, v6, a2);
  uint64_t v16 = v22;
  if (!v22)
  {
    uint64_t v29 = v8 + 2560 * v7;
    uint64_t v92 = (_DWORD *)(v29 + 2168);
    uint64_t v93 = (int64x2_t *)(v29 + 2152);
    unsigned int v91 = (unint64_t *)(v29 + 2176);
    unint64_t v94 = (unint64_t *)(v29 + 2184);
    uint64_t v95 = (_DWORD *)(v29 + 2172);
    int v30 = (os_unfair_lock_s *)(v29 + 4);
    int64x2_t v89 = vdupq_n_s64(0xFBF80uLL);
    int64x2_t v90 = vdupq_n_s64(0xFFFFFFFFFFF04080);
    os_unfair_lock_t v96 = (os_unfair_lock_t)(v29 + 4);
    int v88 = a3;
    while (2)
    {
      int v31 = 0;
      uint64_t v32 = *(void *)(a1 + 624);
      int v33 = (os_unfair_lock_s *)(v32 - 2560);
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v32 - 2560), (unsigned int *)&v31, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v31)
      {
        os_unfair_lock_lock_with_options();
        int v33 = (os_unfair_lock_s *)(v32 - 2560);
      }
      uint64_t v34 = v32 - 2528;
      unint64_t v35 = (uint64_t *)(v32 - 2024);
      unsigned __int16 v36 = a2;
      while (1)
      {
        uint64_t v37 = v36 - 1;
        if ((unsigned __int16)(v36 - 64) < 0xFFC1u) {
          uint64_t v37 = 63;
        }
        uint64_t v38 = *(void *)(v34 + 8 * v37);
        if (!v38
          && ((unint64_t v39 = *(void *)(v32 - 472) & (-1 << v37)) == 0
           || ((int v40 = (uint64_t *)(v34 + 8 * __clz(__rbit64(v39))), v40 >= v35) || (v38 = *v40) == 0)
           && (uint64_t v38 = *v35) == 0)
          || (unint64_t v41 = v38 & 0xFFFFFFFFFFF00000, (v38 & 0xFFFFFFFFFFF00000) == 0))
        {
LABEL_49:
          int v42 = *(_DWORD *)(StatusReg + 24);
          int v43 = v42;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v33, (unsigned int *)&v43, 0, memory_order_release, memory_order_relaxed);
          if (v43 != v42) {
            os_unfair_lock_unlock(v33);
          }
          goto LABEL_63;
        }
        if (!*(_DWORD *)((v38 & 0xFFFFFFFFFFF00000) + 0x1C)) {
          break;
        }
        if (++v36 >= 0x40u) {
          goto LABEL_49;
        }
      }
      uint64_t v44 = *(void *)v41;
      int v45 = *(void **)((v38 & 0xFFFFFFFFFFF00000) + 8);
      if (*(void *)v41)
      {
        *(void *)(v44 + 8) = v45;
        int v45 = *(void **)((v38 & 0xFFFFFFFFFFF00000) + 8);
      }
      else
      {
        *(void *)(v32 - 384) = v45;
      }
      if (!v45) {
        int v45 = (void *)(v32 - 376);
      }
      void *v45 = v44;
      *(void *)unint64_t v41 = 0;
      *(void *)((v38 & 0xFFFFFFFFFFF00000) + 8) = 0;
      --*(_DWORD *)(v32 - 388);
      os_unfair_lock_t lock = v33;
      uint64_t v46 = tiny_free_detach_region(a1, (uint64_t)v33, v41);
      *(_DWORD *)(v41 + 24) = v7;
      if (*(_DWORD *)(v41 + 28)) {
        purgeable_ptr_in_use_enumerator_cold_1(v46);
      }
      int v47 = v46;
      uint64_t v48 = tiny_free_reattach_region(a1, v8 + 2560 * v7, v41);
      int64x2_t v49 = *(int64x2_t *)(v32 - 408);
      v50.i64[1] = v90.i64[1];
      v50.i64[0] = v48;
      v50.i64[0] = vsubq_s64(v49, v50).u64[0];
      v50.i64[1] = vaddq_s64(v49, v90).i64[1];
      *(int64x2_t *)(v32 - 408) = v50;
      *(_DWORD *)(v32 - 392) -= v47;
      v50.i64[1] = v89.i64[1];
      v50.i64[0] = v48;
      *uint64_t v93 = vaddq_s64(*v93, v50);
      *v92 += v47;
      unint64_t v51 = *v94;
      if (*v94) {
        *(void *)(v51 + 8) = v41;
      }
      else {
        *unsigned int v91 = v41;
      }
      *(void *)unint64_t v41 = v51;
      unint64_t *v94 = v41;
      *(void *)(v41 + 8) = 0;
      *(unsigned char *)(v41 + 32) = 0;
      int v30 = v96;
      ++*v95;
      int v52 = *(_DWORD *)(StatusReg + 24);
      int v53 = v52;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)lock, (unsigned int *)&v53, 0, memory_order_release, memory_order_relaxed);
      if (v53 != v52) {
        os_unfair_lock_unlock(lock);
      }
      tiny_malloc_from_free_list(a1, v8 + 2560 * v7, v41, a2);
      if (v54)
      {
        uint64_t v16 = v54;
        int v85 = *(_DWORD *)(StatusReg + 24);
        int v86 = v85;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v86, 0, memory_order_release, memory_order_relaxed);
        if (v86 != v85) {
          os_unfair_lock_unlock(v9);
        }
        tiny_check_zero_or_clear(v16, a2, v88);
        return v16;
      }
LABEL_63:
      int v55 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v30, (unsigned int *)&v55, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      BOOL v56 = v55 == 0;
      int v57 = *(_DWORD *)(StatusReg + 24);
      int v58 = v57;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v58, 0, memory_order_release, memory_order_relaxed);
      BOOL v59 = v58 == v57;
      if (v56)
      {
        if (!v59) {
          os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 2560 * v7));
        }
        unsigned int v65 = *(_DWORD *)(a1 + 620);
        if ((v65 & 4) != 0) {
          int v66 = -2;
        }
        else {
          int v66 = -4;
        }
        mach_vm_address_t pages = mvm_allocate_pages(0x100000uLL, 20, v66 & v65, 7);
        int v68 = 0;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v68, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v68) {
          os_unfair_lock_lock_with_options();
        }
        if (pages)
        {
          *(_DWORD *)(pages + 16508) = unk_1EB1C96F9;
          unsigned __int16 v69 = (void *)(v8 + 2560 * v7 + 2128);
          if (*v69 || *(void *)(v8 + 2560 * v7 + 2136)) {
            tiny_finalize_region(a1, v8 + 2560 * v7);
          }
          *(void *)(pages + 16160) = 4278190080;
          *(_DWORD *)(pages + 24) = v7;
          rack_region_insert((os_unfair_lock_t)a1, pages);
          uint64_t v70 = v8 + 2560 * v7;
          *(void *)(v70 + 2144) = pages;
          uint64_t v71 = (16 * a2);
          *(_DWORD *)(pages + 16) = v71;
          *(_DWORD *)(pages + 20) = 1;
          uint64_t v16 = pages + 16512;
          set_tiny_meta_header_in_use(pages + 16512, a2);
          ++*v92;
          int64x2_t v72 = vdupq_n_s64(0xFBF80uLL);
          v72.i64[0] = v71;
          unint64_t v73 = (pages + 16512 + v71) & 0xFFFFFFFFFFF00000 | 0x28;
          unint64_t v74 = ((pages + 16512 + v71) & 0xFFFFF) - 16512;
          int64x2_t v75 = vaddq_s64(*v93, v72);
          *(int8x8_t *)(v73 + ((v74 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(v73 + ((v74 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << (v74 >> 4)));
          *(_DWORD *)(v73 + 4 * ((((v74 >> 4) + 1) >> 4) & 0xFFE)) |= 1 << ((v74 >> 4) + 1);
          *uint64_t v93 = v75;
          *unsigned __int16 v69 = 1032064 - 16 * (int)a2;
          *(void *)(v70 + 2136) = 0;
          unint64_t v76 = *v94;
          if (*v94) {
            *(void *)(v76 + 8) = pages;
          }
          else {
            *unsigned int v91 = pages;
          }
          *(void *)mach_vm_address_t pages = v76;
          unint64_t *v94 = pages;
          *(void *)(pages + 8) = 0;
          *(unsigned char *)(pages + 32) = 0;
          ++*v95;
          int v81 = *(_DWORD *)(StatusReg + 24);
          int v82 = v81;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v82, 0, memory_order_release, memory_order_relaxed);
          if (v82 != v81) {
            os_unfair_lock_unlock(v9);
          }
          int v83 = *(_DWORD *)(StatusReg + 24);
          int v84 = v83;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v96, (unsigned int *)&v84, 0, memory_order_release, memory_order_relaxed);
          if (v84 != v83) {
            os_unfair_lock_unlock(v96);
          }
        }
        else
        {
          int v77 = *(_DWORD *)(StatusReg + 24);
          int v78 = v77;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v78, 0, memory_order_release, memory_order_relaxed);
          if (v78 != v77) {
            os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 2560 * v7));
          }
          int v79 = *(_DWORD *)(StatusReg + 24);
          int v80 = v79;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v96, (unsigned int *)&v80, 0, memory_order_release, memory_order_relaxed);
          if (v80 != v79) {
            os_unfair_lock_unlock(v96);
          }
          return 0;
        }
        return v16;
      }
      if (!v59) {
        os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 2560 * v7));
      }
      int v60 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v30, (unsigned int *)&v60, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v60) {
        os_unfair_lock_lock_with_options();
      }
      int v61 = *(_DWORD *)(StatusReg + 24);
      int v62 = v61;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v30, (unsigned int *)&v62, 0, memory_order_release, memory_order_relaxed);
      if (v62 != v61) {
        os_unfair_lock_unlock(v30);
      }
      int v63 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v63, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
      if (v63) {
        os_unfair_lock_lock_with_options();
      }
      tiny_malloc_from_free_list(a1, v8 + 2560 * v7, v21, a2);
      uint64_t v16 = v64;
      a3 = v88;
      if (!v64) {
        continue;
      }
      break;
    }
  }
  int v23 = *(_DWORD *)(StatusReg + 24);
  int v24 = v23;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v24, 0, memory_order_release, memory_order_relaxed);
  if (v24 != v23) {
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 2560 * v7));
  }
  if (malloc_zero_policy == 2) {
    goto LABEL_33;
  }
  if (malloc_zero_policy == 1) {
    goto LABEL_32;
  }
  if (!malloc_zero_policy && malloc_zero_on_free_sample_period)
  {
    uint64_t v25 = *(void *)(StatusReg + 888);
    BOOL v26 = v25 + 1 == malloc_zero_on_free_sample_period;
    uint64_t v27 = v25 + 1 == malloc_zero_on_free_sample_period ? 0 : v25 + 1;
    *(void *)(StatusReg + 888) = v27;
    if (v26) {
      goto LABEL_30;
    }
  }
  return v16;
}

unint64_t set_tiny_meta_header_in_use(uint64_t a1, int a2)
{
  unint64_t v2 = a1 & 0xFFFFF;
  unint64_t result = a1 & 0xFFFFFFFFFFF00000 | 0x28;
  v2 -= 16512;
  unint64_t v4 = v2 >> 4;
  *(int8x8_t *)(result + ((v2 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(result + ((v2 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << (v2 >> 4)));
  int v5 = (v2 >> 4) + 1;
  int v6 = (unsigned __int16)(v4 + 1) >> 4;
  int v7 = v6 & 0xFFE;
  char v8 = v5 & 0x1F;
  unsigned int v9 = (v5 & 0x1F) + (unsigned __int16)(a2 - 1);
  if (v9 < 0x40)
  {
    unsigned int v12 = 0x7FFFFFFFu >> (v8 ^ 0x1F);
    if (v9 < 0x20)
    {
      int v10 = v12 | (-1 << v9);
      *(_DWORD *)(result + 4 * (v6 & 0xFFE)) &= v10;
      uint64_t v11 = v6 | 1u;
    }
    else
    {
      int v10 = -1 << v9;
      *(int8x8_t *)(result + 4 * (v6 & 0xFFE)) = vand_s8(*(int8x8_t *)(result + 4 * (v6 & 0xFFE)), (int8x8_t)vdup_n_s32(v12));
      *(_DWORD *)(result + 4 * (v7 + 2)) &= v10;
      uint64_t v11 = (v7 + 3);
    }
  }
  else
  {
    *(int8x8_t *)(result + 4 * (v6 & 0xFFE)) = vand_s8(*(int8x8_t *)(result + 4 * (v6 & 0xFFE)), (int8x8_t)vdup_n_s32(0x7FFFFFFFu >> (v8 ^ 0x1F)));
    int v10 = -1 << v9;
    *(void *)(result + 4 * (v7 + 2)) = 0;
    *(_DWORD *)(result + 4 * (v7 + 4)) &= v10;
    uint64_t v11 = (v7 + 5);
  }
  *(_DWORD *)(result + 4 * v11) &= v10;
  *(_DWORD *)(result + 4 * (((a2 - 1 + v5) >> 4) & 0xFFE)) |= 1 << (a2 - 1 + v5);
  return result;
}

void free_tiny(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v6 = a3;
  int v9 = *(_DWORD *)(a3 + 24);
  uint64_t v10 = *(void *)(a1 + 624);
  uint64_t v11 = (os_unfair_lock_s *)(v10 + 2560 * v9);
  if (malloc_tracing_enabled)
  {
    kdebug_trace();
    if (a4) {
      goto LABEL_3;
    }
  }
  else if (a4)
  {
LABEL_3:
    unint64_t v12 = (unint64_t)(a4 + 15) >> 4;
LABEL_4:
    int v13 = a5;
    goto LABEL_5;
  }
  unint64_t v33 = a2 & 0xFFFFFFFFFFF00000 | 0x28;
  unsigned int v34 = a2 - (a2 & 0xFFF00000 | 0x4080);
  unsigned int v35 = (v34 >> 8) & 0xFFE;
  int v36 = 1 << (v34 >> 4);
  uint64_t v37 = (unsigned int *)(v33 + 4 * v35);
  unint64_t v38 = *v37;
  if ((v38 & v36) == 0)
  {
    LOWORD(v12) = 0;
    goto LABEL_4;
  }
  int v13 = a5;
  if ((*(_DWORD *)(v33 + 4 * (v35 | 1)) & v36) == 0)
  {
LABEL_42:
    free_tiny_botch(a1);
    return;
  }
  int v39 = (v34 >> 4) & 0x1F;
  unint64_t v40 = ((unint64_t)v37[2] << (32 - v39)) | (v38 >> v39);
  if (v39) {
    v40 |= (unint64_t)v37[4] << -(char)v39;
  }
  __int16 v41 = __clz(__rbit64(v40 >> 1));
  if (v40 >= 2) {
    LOWORD(v12) = v41 + 1;
  }
  else {
    LOWORD(v12) = 0;
  }
LABEL_5:
  if (!malloc_zero_policy) {
    _platform_memset();
  }
  int v14 = 0;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v14, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v14) {
    os_unfair_lock_lock_with_options();
  }
  char v16 = 0;
  if (v13 || v9 == -1 || (unsigned __int16)v12 > 0xFu)
  {
    uint64_t v23 = a2;
    goto LABEL_20;
  }
  uint64_t v17 = v10 + 2560 * v9;
  uint64_t v20 = *(void *)(v17 + 8);
  uint64_t v19 = v17 + 8;
  uint64_t v18 = v20;
  if (v20 == a2)
  {
    int v31 = *(_DWORD *)(StatusReg + 24);
    int v32 = v31;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v32, 0, memory_order_release, memory_order_relaxed);
    if (v32 != v31) {
      os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 2560 * v9));
    }
    goto LABEL_42;
  }
  uint64_t v44 = v18;
  __int16 v21 = *(_WORD *)(v19 + 8);
  uint64_t v22 = *(void *)(v19 + 16);
  if (malloc_zero_policy && (*(unsigned char *)(a1 + 620) & 0x20) != 0 && (_WORD)v12)
  {
    __int16 v43 = *(_WORD *)(v19 + 8);
    uint64_t v42 = *(void *)(v19 + 16);
    _platform_memset();
    uint64_t v22 = v42;
    __int16 v21 = v43;
  }
  *(void *)uint64_t v19 = a2;
  *(_WORD *)(v19 + 8) = v12;
  *(void *)(v19 + 16) = v6;
  uint64_t v23 = v44;
  if (!v44) {
    goto LABEL_27;
  }
  char v16 = 2;
  uint64_t v6 = v22;
  LOWORD(v12) = v21;
  int v13 = a5;
LABEL_20:
  for (int i = *(_DWORD *)(v6 + 24); v9 != i; int i = *(_DWORD *)(v6 + 24))
  {
    int v9 = i;
    int v25 = *(_DWORD *)(StatusReg + 24);
    int v26 = v25;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v26, 0, memory_order_release, memory_order_relaxed);
    if (v26 != v25) {
      os_unfair_lock_unlock(v11);
    }
    int v27 = 0;
    uint64_t v11 = (os_unfair_lock_s *)(*(void *)(a1 + 624) + 2560 * v9);
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v27, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v27) {
      os_unfair_lock_lock_with_options();
    }
  }
  tiny_free_no_lock((os_unfair_lock_s *)a1, (uint64_t)v11, v9, v6, v23, (unsigned __int16)v12, v16 | (v13 != 0));
  if (v28)
  {
LABEL_27:
    int v29 = *(_DWORD *)(StatusReg + 24);
    int v30 = v29;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v30, 0, memory_order_release, memory_order_relaxed);
    if (v30 != v29)
    {
      os_unfair_lock_unlock(v11);
    }
  }
}

BOOL tiny_claimed_address(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *v2;
  if (*v2)
  {
    unint64_t v4 = a2 & 0xFFFFFFFFFFF00000;
    uint64_t v5 = v2[2];
    unint64_t v6 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*((unsigned char *)v2 + 8);
    unint64_t v7 = v6;
    do
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7);
      if (!v8) {
        break;
      }
      if (v8 == v4)
      {
        BOOL v10 = v4 + 16512 <= a2 && v4 + 0x100000 > a2;
        return v4 && v10;
      }
      if (v7 + 1 == v3) {
        unint64_t v7 = 0;
      }
      else {
        ++v7;
      }
    }
    while (v7 != v6);
  }
  return 0;
}

uint64_t tiny_try_shrink_in_place(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned __int16 v5 = (a3 >> 4) - (a4 >> 4);
  if (v5)
  {
    int v7 = 0;
    uint64_t v8 = (a4 & 0xFFFF0) + a2;
    uint64_t v9 = *(void *)(a1 + 624);
    int v10 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
    uint64_t v11 = (os_unfair_lock_s *)(v9 + 2560 * v10);
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v7, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v7) {
      os_unfair_lock_lock_with_options();
    }
    int v13 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
    if (v13 != v10)
    {
      do
      {
        int v14 = *(_DWORD *)(StatusReg + 24);
        int v15 = v14;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v15, 0, memory_order_release, memory_order_relaxed);
        if (v15 != v14) {
          os_unfair_lock_unlock(v11);
        }
        int v16 = 0;
        uint64_t v11 = (os_unfair_lock_s *)(v9 + 2560 * v13);
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v16, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v16) {
          os_unfair_lock_lock_with_options();
        }
        BOOL v17 = v13 == *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
        int v13 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
      }
      while (!v17);
    }
    set_tiny_meta_header_in_use(v8, v5);
    ++v11[542]._os_unfair_lock_opaque;
    int v18 = *(_DWORD *)(StatusReg + 24);
    int v19 = v18;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v11, (unsigned int *)&v19, 0, memory_order_release, memory_order_relaxed);
    if (v19 != v18) {
      os_unfair_lock_unlock(v11);
    }
    free_tiny(a1, v8, v8 & 0xFFFFFFFFFFF00000, 0, 1);
  }
  return a2;
}

uint64_t tiny_try_realloc_in_place(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v5 = a3 >> 4;
  if ((unsigned __int16)((a2 - 16512) >> 4) + (unsigned __int16)(a3 >> 4) > 0xFBF7) {
    return 0;
  }
  int v9 = 0;
  unint64_t v10 = a2 & 0xFFFFFFFFFFF00000;
  uint64_t v11 = *(void *)(a1 + 624);
  int v12 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
  uint64_t v13 = v11 + 2560 * v12;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v13, (unsigned int *)&v9, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v9) {
    os_unfair_lock_lock_with_options();
  }
  for (int i = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18); v12 != i; int i = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18))
  {
    int v12 = i;
    int v16 = *(_DWORD *)(StatusReg + 24);
    int v17 = v16;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v13, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
    if (v17 != v16) {
      os_unfair_lock_unlock((os_unfair_lock_t)v13);
    }
    int v18 = 0;
    uint64_t v13 = v11 + 2560 * v12;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v13, (unsigned int *)&v18, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v18) {
      os_unfair_lock_lock_with_options();
    }
  }
  if (v12 == -1) {
    goto LABEL_25;
  }
  unint64_t v19 = a2 + a3;
  int v20 = (unsigned __int16)(a3 >> 4);
  unsigned int v21 = (unsigned __int16)((a4 + 15) >> 4);
  unsigned int v22 = ((a4 + 15) >> 4) - v5;
  if (*(void *)(v13 + 8) == v19)
  {
    int v23 = *(unsigned __int16 *)(v13 + 16);
    if (v20 + v23 >= v21)
    {
      if (v23 == (unsigned __int16)v22)
      {
        *(void *)(v13 + 8) = 0;
        *(_WORD *)(v13 + 16) = 0;
        *(void *)(v13 + 24) = 0;
        --*(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x14);
      }
      else
      {
        *(_WORD *)(v13 + 16) = v23 - v22;
        *(void *)(v13 + 8) = a2 + a4;
        set_tiny_meta_header_in_use(v19 + 16 * (unsigned __int16)v22, (unsigned __int16)(v23 - v22));
      }
      *(int8x8_t *)((v19 & 0xFFFFFFFFFFF00000 | (((v19 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) = vand_s8(*(int8x8_t *)((v19 & 0xFFFFFFFFFFF00000 | (((v19 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28), (int8x8_t)vdup_n_s32(~(1 << (((v19 & 0xFFFFF) - 16512) >> 4))));
      if (malloc_zero_policy == 2)
      {
        _platform_memset();
      }
      else if (!malloc_zero_policy && malloc_zero_on_free_sample_period)
      {
        uint64_t v42 = *(void *)(StatusReg + 888);
        BOOL v43 = v42 + 1 == malloc_zero_on_free_sample_period;
        uint64_t v44 = v42 + 1 == malloc_zero_on_free_sample_period ? 0 : v42 + 1;
        *(void *)(StatusReg + 888) = v44;
        if (v43)
        {
          if (_platform_memcmp_zero_aligned8()) {
            tiny_zero_corruption_abort(v19);
          }
        }
      }
      LOWORD(v22) = 0;
      goto LABEL_73;
    }
  }
  if (*(void *)(v13 + 2144) == v10)
  {
    uint64_t v24 = *(void *)(v13 + 2128);
    if ((unsigned __int16)v22 < (unsigned __int16)(v24 >> 4)
      && (v10 | 0x4080) - v24 + 1032064 == v19)
    {
      *(int8x8_t *)((v19 & 0xFFFFFFFFFFF00000 | (((v19 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) = vand_s8(*(int8x8_t *)((v19 & 0xFFFFFFFFFFF00000 | (((v19 & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28), (int8x8_t)vdup_n_s32(~(1 << (((v19 & 0xFFFFF) - 16512) >> 4))));
      if ((unsigned __int16)v22 >= 2u) {
        *(int8x8_t *)(((v19 + 16) & 0xFFFFFFFFFFF00000 | ((((v19 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) = vand_s8(*(int8x8_t *)(((v19 + 16) & 0xFFFFFFFFFFF00000 | ((((v19 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28), (int8x8_t)vdup_n_s32(~(1 << ((((v19 + 16) & 0xFFFFFu) - 16512) >> 4))));
      }
      uint64_t v33 = v24 - 16 * (unsigned __int16)v22;
      *(void *)(v13 + 2128) = v33;
      if (v33)
      {
        uint64_t v34 = a2 + 16 * v21;
        uint64_t v35 = v34 & 0xFFFFF;
        unint64_t v36 = v34 & 0xFFFFFFFFFFF00000 | 0x28;
        unint64_t v37 = v35 - 16512;
        unint64_t v38 = (unint64_t)(v35 - 16512) >> 4;
        *(int8x8_t *)(v36 + ((v37 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(v36 + ((v37 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << v38));
        *(_DWORD *)(v36 + 4 * (((v38 + 1) >> 4) & 0xFFE)) |= 1 << (v38 + 1);
      }
      if (malloc_zero_policy == 2)
      {
        _platform_memset();
      }
      else if (!malloc_zero_policy && malloc_zero_on_free_sample_period)
      {
        uint64_t v39 = *(void *)(StatusReg + 888);
        BOOL v40 = v39 + 1 == malloc_zero_on_free_sample_period;
        uint64_t v41 = v39 + 1 == malloc_zero_on_free_sample_period ? 0 : v39 + 1;
        *(void *)(StatusReg + 888) = v41;
        if (v40)
        {
          if (_platform_memcmp_zero_aligned8()) {
            tiny_zero_corruption_abort(v19);
          }
        }
      }
      goto LABEL_73;
    }
  }
  unint64_t v26 = v19 & 0xFFFFFFFFFFF00000 | 0x4080;
  unint64_t v27 = ((v19 - v26) >> 8) & 0xFFE;
  int v28 = (int8x8_t *)((v19 & 0xFFFFFFFFFFF00000 | (8 * ((v27 >> 1) & 0x7FF))) + 40);
  int v29 = 1 << ((v19 - v26) >> 4);
  if ((*(_DWORD *)((v19 & 0xFFFFFFFFFFF00000 | (8 * ((v27 >> 1) & 0x7FF))) + 0x28) & v29) != 0
    && (*(_DWORD *)((v19 & 0xFFFFFFFFFFF00000) + 4 * v27 + 0x2C) & v29) == 0)
  {
    int v30 = v19 + 16 >= v26 + 1032064
       || ((*(_DWORD *)(((v19 + 16) & 0xFFFFFFFFFFF00000 | ((((v19 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((v19 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0
        ? 1
        : *(unsigned __int16 *)(v19 + 16);
    if (v20 + v30 >= v21)
    {
      unsigned int v51 = v30;
      tiny_free_list_remove_ptr(a1, v13, v19, v30);
      *int v28 = vand_s8(*v28, (int8x8_t)vdup_n_s32(~v29));
      int v45 = malloc_zero_policy;
      if (!malloc_zero_policy)
      {
        _tiny_check_and_zero_inline_meta_from_freelist(a1, v19, v51);
        int v45 = malloc_zero_policy;
      }
      if (v45 == 2)
      {
        _platform_memset();
      }
      else if (!v45 && malloc_zero_on_free_sample_period)
      {
        uint64_t v46 = *(void *)(StatusReg + 888);
        BOOL v47 = v46 + 1 == malloc_zero_on_free_sample_period;
        uint64_t v48 = v46 + 1 == malloc_zero_on_free_sample_period ? 0 : v46 + 1;
        *(void *)(StatusReg + 888) = v48;
        if (v47)
        {
          if (_platform_memcmp_zero_aligned8()) {
            tiny_zero_corruption_abort(v19);
          }
        }
      }
      if (v51 != (unsigned __int16)v22) {
        tiny_free_list_add_ptr(a1, v13, 16 * (unsigned __int16)v22 + v19, (unsigned __int16)(v51 - v22));
      }
      set_tiny_meta_header_in_use(a2, v21);
LABEL_73:
      uint64_t v49 = 16 * (unsigned __int16)v22;
      *(void *)(v13 + 2152) += v49;
      LODWORD(v49) = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x10) + v49;
      *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x10) = v49;
      if (v49 >= 0xBCFA0) {
        *(unsigned char *)((a2 & 0xFFFFFFFFFFF00000) + 0x20) = 0;
      }
      int v31 = *(_DWORD *)(StatusReg + 24);
      int v32 = v31;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v13, (unsigned int *)&v32, 0, memory_order_release, memory_order_relaxed);
      uint64_t v6 = 1;
      goto LABEL_76;
    }
  }
LABEL_25:
  uint64_t v6 = 0;
  int v31 = *(_DWORD *)(StatusReg + 24);
  int v32 = v31;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v13, (unsigned int *)&v32, 0, memory_order_release, memory_order_relaxed);
LABEL_76:
  if (v32 != v31) {
    os_unfair_lock_unlock((os_unfair_lock_t)v13);
  }
  return v6;
}

void tiny_check_zero_or_clear(uint64_t a1, uint64_t a2, int a3)
{
  if (malloc_zero_policy != 2)
  {
    if (malloc_zero_policy != 1)
    {
      if (!malloc_zero_policy)
      {
        uint64_t v4 = malloc_zero_on_free_sample_period;
        if (malloc_zero_on_free_sample_period)
        {
          unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
          uint64_t v6 = *(void *)(StatusReg + 888);
          BOOL v7 = v6 + 1 == v4;
          uint64_t v8 = v6 + 1 == v4 ? 0 : v6 + 1;
          *(void *)(StatusReg + 888) = v8;
          if (v7)
          {
            if (_platform_memcmp_zero_aligned8())
            {
              tiny_zero_corruption_abort(a1);
            }
          }
        }
      }
      return;
    }
    if (!a3) {
      return;
    }
  }

  _platform_memset();
}

uint64_t tiny_check_region(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a2 + 24);
  uint64_t v3 = *(void *)(a1 + 624);
  if (!*(_DWORD *)(a2 + 28)) {
    return 1;
  }
  if (*(void *)(v3 + 2560 * v2 + 2144) == a2)
  {
    uint64_t v7 = *(void *)(v3 + 2560 * v2 + 2136);
    unint64_t v6 = v7 + a2 + 16512;
    if (v7)
    {
      unint64_t v8 = (v6 - 16) & 0xFFFFFFFFFFF00000;
      uint64_t v9 = v8 | 0x28;
      unsigned int v10 = v6 - 16 - (v8 | 0x4080);
      unsigned int v11 = (v10 >> 8) & 0xFFE;
      int v12 = 1 << (v10 >> 4);
      uint64_t v13 = (unsigned int *)((v8 | 0x28) + 4 * v11);
      unint64_t v14 = *v13;
      if ((v14 & v12) == 0 || (*(_DWORD *)(v9 + 4 * (v11 | 1)) & v12) == 0) {
        goto LABEL_53;
      }
      int v15 = (v10 >> 4) & 0x1F;
      unint64_t v16 = ((unint64_t)v13[2] << (32 - v15)) | (v14 >> ((v10 >> 4) & 0x1F));
      if (v15) {
        v16 |= (unint64_t)v13[4] << -(char)v15;
      }
      int v17 = __clz(__rbit64(v16 >> 1));
      int v18 = v16 >= 2 ? v17 + 1 : 0;
      if (v18 != 1)
      {
LABEL_53:
        uint64_t v41 = "%ld, counter=%d\n*** invariant broken for leader block %p - %d %d\n";
        goto LABEL_54;
      }
    }
    uint64_t v44 = *(void *)(v3 + 2560 * v2 + 2144);
    unint64_t v5 = a2 + 0x100000 - *(void *)(v3 + 2560 * v2 + 2128);
  }
  else
  {
    uint64_t v44 = *(void *)(v3 + 2560 * v2 + 2144);
    unint64_t v5 = a2 + 0x100000;
    unint64_t v6 = a2 + 16512;
  }
  if (v6 >= v5)
  {
    int v29 = 0;
LABEL_42:
    int v45 = v29;
    if (v6 != v5)
    {
      uint64_t v41 = "%ld, counter=%d\n*** invariant broken for region end %p - %p\n";
      goto LABEL_54;
    }
LABEL_43:
    if (v44 == a2 && *(void *)(v3 + 2560 * v2 + 2128))
    {
      uint64_t result = get_tiny_meta_header(v5, &v45);
      if (v45 || result != 1)
      {
        uint64_t v41 = "%ld, counter=%d\n*** invariant broken for blocker block %p - %d %d\n";
        goto LABEL_54;
      }
      return result;
    }
    return 1;
  }
  uint64_t v43 = a2 + 16512;
  while (1)
  {
    unint64_t v19 = v6 & 0xFFFFFFFFFFF00000 | 0x28;
    unint64_t v20 = v6 & 0xFFFFFFFFFFF00000 | 0x4080;
    unsigned int v21 = ((v6 - v20) >> 8) & 0xFFE;
    int v22 = 1 << ((v6 - v20) >> 4);
    int v23 = (unsigned int *)(v19 + 4 * v21);
    unint64_t v24 = *v23;
    if ((v24 & v22) == 0)
    {
LABEL_40:
      uint64_t v41 = "%ld, counter=%d\n*** invariant broken for tiny block %p this msize=%d - size is too small\n";
      goto LABEL_54;
    }
    if ((*(_DWORD *)(v19 + 4 * (v21 | 1)) & v22) == 0) {
      break;
    }
    unsigned int v25 = ((v6 - v20) >> 4) & 0x1F;
    unint64_t v26 = ((unint64_t)v23[2] << (32 - v25)) | (v24 >> v25);
    if (v25) {
      v26 |= (unint64_t)v23[4] << -(char)v25;
    }
    if (v26 < 2) {
      goto LABEL_40;
    }
    int v27 = __clz(__rbit64(v26 >> 1));
    int v28 = v27 + 1;
    if (v27 == 63)
    {
      uint64_t v41 = "%ld, counter=%d\n*** invariant broken for %p this tiny msize=%d - size is too large\n";
      goto LABEL_54;
    }
    int v29 = 0;
    v6 += (16 * v28);
LABEL_35:
    if (v6 >= v5) {
      goto LABEL_42;
    }
  }
  if (v6 + 16 >= v20 + 1032064
    || ((*(_DWORD *)(((v6 + 16) & 0xFFFFFFFFFFF00000 | ((((v6 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((v6 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
  {
    int v30 = 1;
  }
  else
  {
    int v30 = *(unsigned __int16 *)(v6 + 16);
    if (!*(_WORD *)(v6 + 16) && v6 == v43) {
      return 1;
    }
    if (!*(_WORD *)(v6 + 16)) {
      goto LABEL_40;
    }
  }
  uint64_t v31 = *(void *)v6;
  uint64_t v32 = *(void *)(v6 + 8);
  if (*(void *)v6)
  {
    unint64_t v33 = (v31 & 0xFFFFF) - 16512;
    unint64_t v34 = (v33 >> 8) & 0xFFE;
    int v35 = 1 << (v33 >> 4);
    if ((*(_DWORD *)((v31 & 0xFFFFFFFFFFF00000 | (8 * ((v34 >> 1) & 0x7FF))) + 0x28) & v35) == 0
      || (*(_DWORD *)((v31 & 0xFFFFFFFFFFF00000) + 4 * v34 + 0x2C) & v35) != 0)
    {
      uint64_t v41 = "%ld, counter=%d\n*** invariant broken for %p (previous %p is not a free pointer)\n";
      goto LABEL_54;
    }
  }
  if (v32)
  {
    unint64_t v36 = (v32 & 0xFFFFF) - 16512;
    unint64_t v37 = (v36 >> 8) & 0xFFE;
    int v38 = 1 << (v36 >> 4);
    if ((*(_DWORD *)((v32 & 0xFFFFFFFFFFF00000 | (8 * ((v37 >> 1) & 0x7FF))) + 0x28) & v38) == 0
      || (*(_DWORD *)((v32 & 0xFFFFFFFFFFF00000) + 4 * v37 + 0x2C) & v38) != 0)
    {
      uint64_t v41 = "%ld, counter=%d\n*** invariant broken for %p (next in free list %p is not a free pointer)\n";
      goto LABEL_54;
    }
  }
  uint64_t v39 = (16 * v30);
  unint64_t v40 = v6 + v39;
  if (v5 == v6 + v39)
  {
    int v45 = 1;
    goto LABEL_43;
  }
  if (get_tiny_previous_free_msize(v6 + v39) == v30)
  {
    int v29 = 1;
    unint64_t v6 = v40;
    goto LABEL_35;
  }
  uint64_t v41 = "%ld, counter=%d\n"
        "*** invariant broken for tiny free %p followed by %p in region %p [%p-%p] (end marker incorrect) should be %d; in fact %d\n";
LABEL_54:
  malloc_zone_check_fail((uint64_t)"*** check: incorrect tiny region ", (uint64_t)v41);
  return 0;
}

uint64_t get_tiny_previous_free_msize(uint64_t a1)
{
  if ((a1 & 0xFFFFFFFFFFF00000 | 0x4080) == a1)
  {
    return 0;
  }
  else if ((*(_DWORD *)(((a1 - 16) & 0xFFFFFFFFFFF00000 | ((((a1 - 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((a1 - 16) & 0xFFFFFu) - 16512) >> 4)))
  {
    return 1;
  }
  else
  {
    return *(unsigned __int16 *)(a1 - 2);
  }
}

uint64_t tiny_in_use_enumerator()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  int v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  char v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v0;
  uint64_t v49 = *MEMORY[0x1E4F14BF8];
  uint64_t v46 = 0;
  uint64_t v47 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  unint64_t v40 = 0;
  uint64_t v41 = 0;
  uint64_t result = v3(v0, *(void *)(v5 + 16536), 32, (uint64_t *)&v40);
  if (!result)
  {
    uint64_t v39 = *v40;
    uint64_t result = v4(v11, v40[2], 8 * *v40, &v47);
    if (!result)
    {
      if ((v8 & 1) == 0
        || (uint64_t result = v4(v11, *(void *)(v6 + 17136), 2560 * *(int *)(v6 + 17120), &v41), !result))
      {
        if (v39)
        {
          uint64_t v13 = 0;
          char v34 = v8;
          int v35 = v8 & 6;
          unint64_t v37 = v2;
          int v38 = (unsigned int *)(v6 + 17120);
          uint64_t v36 = v10;
          while (1)
          {
            uint64_t v14 = *(void *)(v47 + 8 * v13);
            if ((unint64_t)(v14 + 1) >= 2)
            {
              if ((v8 & 4) != 0)
              {
                uint64_t v45 = *(void *)(v47 + 8 * v13);
                uint64_t v46 = 16420;
                ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))v2)(v11, v10, 4, &v45, 1);
              }
              uint64_t v15 = v14 + 16512;
              if (v35)
              {
                uint64_t v43 = v14 + 16512;
                uint64_t v44 = 1032064;
                ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t *, uint64_t))v2)(v11, v10, 2, &v43, 1);
              }
              if (v8) {
                break;
              }
            }
LABEL_9:
            uint64_t result = 0;
            if (++v13 == v39) {
              return result;
            }
          }
          uint64_t result = v4(v11, v14, 0x100000, &v42);
          if (!result)
          {
            uint64_t v16 = *v38;
            if ((int)v16 < 1)
            {
              int v17 = 0;
            }
            else
            {
              int v17 = 0;
              int v18 = (void *)(v41 + 24);
              do
              {
                if (v14 == *v18) {
                  ++v17;
                }
                v18 += 320;
                --v16;
              }
              while (v16);
            }
            int v19 = *(_DWORD *)(v42 + 24);
            if (v14 == *(void *)(v41 + 2560 * v19 + 2144))
            {
              uint64_t v22 = v41 + 2560 * v19;
              uint64_t v20 = *(void *)(v22 + 2136) >> 4;
              unsigned int v21 = 64504 - (*(void *)(v22 + 2128) >> 4);
              if (v21 <= v20) {
                goto LABEL_9;
              }
            }
            else
            {
              LODWORD(v20) = 0;
              unsigned int v21 = 64504;
            }
            int v23 = 0;
            uint64_t v24 = v42 + 40;
            uint64_t v25 = v42 + 44;
            while (1)
            {
              uint64_t v26 = (16 * v20);
              if ((*(_DWORD *)(v25 + 4 * ((v20 >> 4) & 0xFFE)) >> v20)) {
                break;
              }
              if (((*(_DWORD *)(v24 + 4 * (((v20 + 1) >> 4) & 0xFFE)) >> (v20 + 1)) & 1) == 0)
              {
                unsigned __int16 v31 = *(_WORD *)(v42 + v26 + 16528);
LABEL_41:
                if (!v31) {
                  return 5;
                }
                goto LABEL_42;
              }
              unsigned __int16 v31 = 1;
LABEL_42:
              LODWORD(v20) = v20 + v31;
              if (v20 >= v21)
              {
                uint64_t v10 = v36;
                int v2 = v37;
                char v8 = v34;
                if (v23) {
                  v37(v11, v36, 1, v48);
                }
                goto LABEL_9;
              }
            }
            if (v17)
            {
              uint64_t v27 = *v38;
              if ((int)v27 >= 1)
              {
                int v28 = (_WORD *)(v41 + 16);
                while (v15 + v26 != *((void *)v28 - 1))
                {
                  v28 += 1280;
                  if (!--v27) {
                    goto LABEL_34;
                  }
                }
                unsigned __int16 v31 = *v28;
                if (!*v28) {
                  return 5;
                }
                --v17;
                goto LABEL_42;
              }
            }
LABEL_34:
            unsigned int v29 = v20 + 1;
            int v30 = 1;
            do
            {
              unsigned __int16 v31 = v30++;
              int v32 = *(_DWORD *)(v24 + 4 * ((v29 >> 4) & 0xFFE)) >> v29;
              ++v29;
            }
            while ((v32 & 1) == 0);
            unint64_t v33 = &v48[v23];
            *unint64_t v33 = v26 + v15;
            v33[1] = 16 * v31;
            if (++v23 >= 0x100)
            {
              v37(v11, v36, 1, v48);
              int v23 = 0;
            }
            goto LABEL_41;
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

void tiny_malloc_from_free_list(unint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  unsigned int v4 = a4;
  LODWORD(v7) = a4 - 1;
  if ((unsigned __int16)(a4 - 64) >= 0xFFC1u) {
    uint64_t v7 = v7;
  }
  else {
    uint64_t v7 = 63;
  }
  uint64_t v8 = a2 + 32;
  uint64_t v9 = *(void *)(a2 + 32 + 8 * v7);
  if (v9)
  {
    unint64_t v10 = *(void *)(v9 + 8);
    if (v10) {
      *(void *)unint64_t v10 = *(void *)v9;
    }
    else {
      *(_DWORD *)(a2 + 4 * (v7 >> 5) + 2088) &= ~(1 << v7);
    }
    *(void *)(v8 + 8 * v7) = v10;
    unint64_t v17 = v9 & 0xFFFFFFFFFFF00000;
    int v18 = (_WORD *)((v9 & 0xFFFFFFFFFFF00000) + 4 * v7 + 16168);
    int v19 = *(unsigned __int16 *)((v9 & 0xFFFFFFFFFFF00000) + 4 * v7 + 0x3F28);
    if (v19 - 1 != (unsigned __int16)((v9 - 16512) >> 4)) {
      purgeable_ptr_in_use_enumerator_cold_1(a1);
    }
    if (v10) {
      BOOL v20 = (v10 & 0xFFFFFFFFFFF00000) == v17;
    }
    else {
      BOOL v20 = 0;
    }
    if (v20)
    {
      unsigned int v21 = ((v10 - (v17 | 0x4080)) >> 4) + 1;
      uint64_t v22 = (_WORD *)(v17 + 4 * v7 + 16170);
      if (v19 == (unsigned __int16)*v22) {
        *uint64_t v22 = v21;
      }
    }
    else
    {
      LOWORD(v21) = 0;
      *(_WORD *)((v9 & 0xFFFFFFFFFFF00000) + 4 * v7 + 0x3F2A) = 0;
    }
    *int v18 = v21;
    if (!malloc_zero_policy) {
      _tiny_check_and_zero_inline_meta_from_freelist(a1, v9, a4);
    }
    goto LABEL_73;
  }
  unint64_t v11 = *(void *)(a2 + 2088) & (-1 << v7);
  if (v11)
  {
    unint64_t v12 = __clz(__rbit64(v11));
    uint64_t v13 = (uint64_t *)(a2 + 536);
    uint64_t v14 = (uint64_t *)(v8 + 8 * v12);
    if ((unint64_t)v14 < a2 + 536)
    {
      uint64_t v9 = *v14;
      if (*v14)
      {
        uint64_t v15 = *(void **)(v9 + 8);
        unint64_t v16 = (unint64_t)v15;
        *uint64_t v14 = (uint64_t)v15;
        if (v15) {
          void *v15 = *(void *)v9;
        }
        else {
          *(_DWORD *)(a2 + ((v12 >> 3) & 0xC) + 2088) &= ~(1 << v12);
        }
        unint64_t v49 = v9 & 0xFFFFFFFFFFF00000;
        unint64_t v50 = v9 & 0xFFFFFFFFFFF00000 | 0x4080;
        if (v9 + 16 >= v50 + 1032064
          || ((*(_DWORD *)(((v9 + 16) & 0xFFFFFFFFFFF00000 | ((((v9 + 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((v9 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v25 = 1;
        }
        else
        {
          unsigned int v25 = *(unsigned __int16 *)(v9 + 16);
        }
        if (v25 < a4)
        {
          unsigned int v63 = v25;
          uint64_t v64 = (void *)v16;
          malloc_zone_error(256, 1, (uint64_t)"Corruption of tiny freelist %p: size too small (%u/%u)\n");
          unsigned int v25 = v63;
          unint64_t v16 = (unint64_t)v64;
        }
        unsigned int v51 = (_WORD *)(v49 + 4 * v12 + 16168);
        int v52 = (unsigned __int16)*v51;
        if (v52 - 1 != (unsigned __int16)((v9 - v50) >> 4)) {
          purgeable_ptr_in_use_enumerator_cold_1(a1);
        }
        if (v16) {
          BOOL v53 = (v16 & 0xFFFFFFFFFFF00000) == v49;
        }
        else {
          BOOL v53 = 0;
        }
        if (v53)
        {
          unsigned int v54 = ((v16 - v50) >> 4) + 1;
          int v55 = (_WORD *)(v49 + 4 * v12 + 16170);
          if (v52 == (unsigned __int16)*v55) {
            *int v55 = v54;
          }
        }
        else
        {
          LOWORD(v54) = 0;
          *(_WORD *)((v9 & 0xFFFFFFFFFFF00000) + 4 * v12 + 0x3F2A) = 0;
        }
        *unsigned int v51 = v54;
LABEL_64:
        if (!malloc_zero_policy)
        {
          unsigned int v56 = v25;
          _tiny_check_and_zero_inline_meta_from_freelist(a1, v9, v25);
          unsigned int v25 = v56;
        }
        if (v4 <= (unsigned __int16)(v25 - 1)) {
          tiny_free_list_add_ptr(a1, a2, v9 + 16 * v4, (unsigned __int16)(v25 - v4));
        }
        else {
          unsigned int v4 = v25;
        }
        goto LABEL_73;
      }
    }
    uint64_t v9 = *v13;
    if (*v13)
    {
      unint64_t v23 = v9 & 0xFFFFFFFFFFF00000;
      unint64_t v24 = v9 & 0xFFFFFFFFFFF00000 | 0x4080;
      if (v9 + 16 >= v24 + 1032064
        || ((*(_DWORD *)(((v9 + 16) & 0xFFFFFFFFFFF00000 | ((((v9 + 16) & 0xFFFFFuLL) - 16512) >> 6) & 0x3FF8) + 0x28) >> ((((v9 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
      {
        unsigned int v25 = 1;
      }
      else
      {
        unsigned int v25 = *(unsigned __int16 *)(v9 + 16);
      }
      int v26 = v25 - a4;
      if (v25 < a4)
      {
        unsigned int v62 = v25;
        malloc_zone_error(256, 1, (uint64_t)"Corruption of tiny freelist %p: size too small (%u/%u)\n");
        LODWORD(v24) = v9 & 0xFFF00000 | 0x4080;
        unint64_t v23 = v9 & 0xFFFFFFFFFFF00000;
        unsigned int v25 = v62;
      }
      uint64_t v27 = *(void *)(v9 + 8);
      if (v26 >= 64)
      {
        uint64_t v28 = v9 + 16 * v4;
        uint64_t v29 = *(void *)v9;
        if (!malloc_zero_policy)
        {
          uint64_t v30 = a1;
          uint64_t v65 = *(void *)v9;
          unint64_t v66 = v23;
          int v31 = v24;
          _tiny_check_and_zero_inline_meta_from_freelist(v30, v9, v25);
          uint64_t v29 = v65;
          unint64_t v23 = v66;
          LODWORD(v24) = v31;
        }
        *uint64_t v13 = v28;
        if (v27) {
          *(void *)uint64_t v27 = v28;
        }
        *(void *)uint64_t v28 = v29;
        *(void *)(v28 + 8) = v27;
        unint64_t v32 = (v28 & 0xFFFFF) - 16512;
        unint64_t v33 = v28 & 0xFFFFFFFFFFF00000 | (v32 >> 6) & 0x3FF8;
        LODWORD(v32) = 1 << (v32 >> 4);
        int v34 = *(_DWORD *)(v33 + 40) | v32;
        LODWORD(v32) = *(_DWORD *)(v33 + 44) & ~v32;
        *(_DWORD *)(v33 + 40) = v34;
        *(_DWORD *)(v33 + 44) = v32;
        *(_WORD *)(v28 + 16 * (unsigned __int16)v26 - 2) = v26;
        *(_WORD *)(v28 + 16) = v26;
        int v35 = *(unsigned __int16 *)(v23 + 16420);
        if (v35 - 1 != (unsigned __int16)((v9 - v24) >> 4)) {
          purgeable_ptr_in_use_enumerator_cold_1(a1);
        }
        if ((v28 & 0xFFFFFFFFFFF00000) == v23)
        {
          unsigned int v36 = ((v28 - v24) >> 4) + 1;
          if (v35 == *(unsigned __int16 *)(v23 + 16422)) {
            *(_WORD *)(v23 + 16422) = v36;
          }
        }
        else
        {
          LOWORD(v36) = 0;
          *(_WORD *)(v23 + 16422) = 0;
        }
        *(_WORD *)(v23 + 16420) = v36;
        goto LABEL_73;
      }
      if (v27) {
        *(void *)uint64_t v27 = *(void *)v9;
      }
      *uint64_t v13 = v27;
      uint64_t v45 = (_WORD *)(v23 + 4 * v12 + 16168);
      int v46 = (unsigned __int16)*v45;
      if (v46 - 1 != (unsigned __int16)((v9 - v24) >> 4)) {
        purgeable_ptr_in_use_enumerator_cold_1(a1);
      }
      if (v27 && (v27 & 0xFFFFFFFFFFF00000) == v23)
      {
        unsigned int v47 = ((v27 - v24) >> 4) + 1;
        uint64_t v48 = (_WORD *)(v23 + 4 * v12 + 16170);
        if (v46 == (unsigned __int16)*v48) {
          *uint64_t v48 = v47;
        }
      }
      else
      {
        LOWORD(v47) = 0;
        *(_WORD *)(v23 + 4 * v12 + 16170) = 0;
      }
      _WORD *v45 = v47;
      goto LABEL_64;
    }
  }
  unint64_t v37 = *(void *)(a2 + 2128);
  if (v37 < 16 * (unint64_t)a4) {
    return;
  }
  uint64_t v38 = 16 * a4;
  uint64_t v9 = *(void *)(a2 + 2144) - v37 + 0x100000;
  unint64_t v39 = v37 - v38;
  *(void *)(a2 + 2128) = v39;
  if (v39)
  {
    uint64_t v40 = v9 + v38;
    uint64_t v41 = v40 & 0xFFFFF;
    unint64_t v42 = v40 & 0xFFFFFFFFFFF00000 | 0x28;
    unint64_t v43 = v41 - 16512;
    unint64_t v44 = (unint64_t)(v41 - 16512) >> 4;
    *(int8x8_t *)(v42 + ((v43 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(v42 + ((v43 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << v44));
    *(_DWORD *)(v42 + 4 * (((v44 + 1) >> 4) & 0xFFE)) |= 1 << (v44 + 1);
  }
LABEL_73:
  ++*(_DWORD *)(a2 + 2168);
  uint64_t v57 = 16 * v4;
  *(void *)(a2 + 2152) += v57;
  unint64_t v58 = v9 & 0xFFFFFFFFFFF00000;
  if (*(_DWORD *)(v9 & 0xFFFFFFFFFFF00000 | 0x407C) == unk_1EB1C96F9)
  {
    int32x2_t v59 = vadd_s32(*(int32x2_t *)((v9 & 0xFFFFFFFFFFF00000) + 0x10), (int32x2_t)(v57 | 0x100000000));
    *(int32x2_t *)((v9 & 0xFFFFFFFFFFF00000) + 0x10) = v59;
    if (v59.i32[0] >= 0xBCFA0u) {
      *(unsigned char *)((v9 & 0xFFFFFFFFFFF00000) + 0x20) = 0;
    }
    if (v4 < 2)
    {
      unint64_t v60 = v58 + 40;
      unint64_t v61 = v9 - v58 - 16512;
      *(int8x8_t *)(v60 + ((v61 >> 6) & 0x3FF8)) = vorr_s8(*(int8x8_t *)(v60 + ((v61 >> 6) & 0x3FF8)), (int8x8_t)vdup_n_s32(1 << (v61 >> 4)));
      *(_DWORD *)(v60 + 4 * ((((v61 >> 4) + 1) >> 4) & 0xFFE)) |= 1 << ((v61 >> 4) + 1);
    }
    else
    {
      set_tiny_meta_header_in_use(v9, v4);
    }
  }
  else
  {
    malloc_zone_error(64, 1, (uint64_t)"Region cookie corrupted for region %p (value is %x)[%p]\n");
    __break(1u);
  }
}

uint64_t tiny_size(uint64_t a1, unint64_t a2)
{
  int v2 = *(uint64_t **)(a1 + 24);
  uint64_t v3 = *v2;
  if (*v2)
  {
    unint64_t v4 = a2 & 0xFFFFFFFFFFF00000;
    uint64_t v5 = v2[2];
    unint64_t v6 = (0x9E3779B97F4A7C55 * (a2 >> 20)) >> -*((unsigned char *)v2 + 8);
    unint64_t v7 = v6;
    while (1)
    {
      uint64_t v8 = *(void *)(v5 + 8 * v7);
      if (!v8) {
        return 0;
      }
      if (v8 == v4) {
        break;
      }
      if (v7 + 1 == v3) {
        unint64_t v7 = 0;
      }
      else {
        ++v7;
      }
      if (v7 == v6) {
        return 0;
      }
    }
    if (!v4) {
      return 0;
    }
    if (((a2 + 1032064) & 0xFFF80u) > 0xFBF70uLL)
    {
      malloc_printf("NO ZONE for ptr %p\n", (const void *)a2);
      return 0;
    }
    unsigned int v10 = a2 - v4 - 16512;
    unsigned int v11 = (v10 >> 8) & 0xFFE;
    int v12 = 1 << (v10 >> 4);
    uint64_t v13 = (unsigned int *)(v4 + 40 + 4 * v11);
    unint64_t v14 = *v13;
    if ((v14 & v12) != 0)
    {
      if ((*(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x28 + 4 * (v11 | 1)) & v12) == 0) {
        return 0;
      }
      int v15 = (v10 >> 4) & 0x1F;
      unint64_t v16 = ((unint64_t)v13[2] << (32 - v15)) | (v14 >> v15);
      if (v15) {
        v16 |= (unint64_t)v13[4] << -(char)v15;
      }
      int v17 = __clz(__rbit64(v16 >> 1));
      if (v16 >= 2) {
        unsigned int v18 = v17 + 1;
      }
      else {
        unsigned int v18 = 0;
      }
      int v19 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
      if (v19 != -1)
      {
        if (v18 > 0xF)
        {
          unsigned int v18 = v17 + 1;
          return 16 * v18;
        }
LABEL_26:
        if (*(void *)(*(void *)(a1 + 624) + 2560 * v19 + 8) == a2) {
          return 0;
        }
        return 16 * v18;
      }
    }
    else
    {
      unsigned int v18 = 0;
      int v19 = *(_DWORD *)((a2 & 0xFFFFFFFFFFF00000) + 0x18);
      if (v19 != -1) {
        goto LABEL_26;
      }
    }
    uint64_t v20 = *(unsigned int *)(a1 + 608);
    if ((int)v20 < 1) {
      return 16 * v18;
    }
    uint64_t v21 = 0;
    uint64_t v22 = 2560 * v20;
    while (v18 > 0xF || *(void *)(*(void *)(a1 + 624) + v21 + 8) != a2)
    {
      v21 += 2560;
      if (v22 == v21) {
        return 16 * v18;
      }
    }
  }
  return 0;
}

void free_tiny_botch(uint64_t a1)
{
}

uint64_t tiny_batch_malloc(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  unsigned int v7 = a2 + 15;
  unsigned int v8 = (unsigned __int16)((a2 + 15) >> 4);
  unint64_t v9 = a1 + 16512;
  unsigned int thread_index = rack_get_thread_index(a1 + 16512);
  int v12 = 0;
  uint64_t v13 = (os_unfair_lock_s *)(*(void *)(a1 + 17136) + 2560 * (int)(thread_index % *(_DWORD *)(v9 + 608)));
  if (((v7 >> 4) & 0xFFFE) != 0) {
    unsigned int v14 = v8;
  }
  else {
    unsigned int v14 = 1;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v13, (unsigned int *)&v12, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
  if (v12) {
    os_unfair_lock_lock_with_options();
  }
  if (a4)
  {
    uint64_t v16 = 0;
    a4 = a4;
    while (1)
    {
      tiny_malloc_from_free_list(v9, (uint64_t)v13, v11, v14);
      if (!v17) {
        break;
      }
      *(void *)(a3 + 8 * v16++) = v17;
      if (a4 == v16) {
        goto LABEL_12;
      }
    }
    a4 = v16;
  }
LABEL_12:
  int v18 = *(_DWORD *)(StatusReg + 24);
  int v19 = v18;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v13, (unsigned int *)&v19, 0, memory_order_release, memory_order_relaxed);
  if (v19 != v18) {
    os_unfair_lock_unlock(v13);
  }
  return a4;
}

void tiny_batch_free(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a3) {
    return;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  unint64_t v7 = 0;
  unint64_t v39 = (os_unfair_lock_s *)(a1 + 16512);
  int v8 = -1;
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v10 = a3;
  while (1)
  {
    unint64_t v11 = *(void *)(a2 + 8 * v5);
    if (!v11) {
      goto LABEL_42;
    }
    unint64_t v12 = v11 & 0xFFFFFFFFFFF00000;
    if (!v7 || v7 != v12) {
      break;
    }
LABEL_28:
    if (((v11 + 1032064) & 0xFFF80u) > 0xFBF70uLL) {
      goto LABEL_43;
    }
    unsigned int v27 = v11 - v12 - 16512;
    unsigned int v28 = (v27 >> 8) & 0xFFE;
    int v29 = 1 << (v27 >> 4);
    uint64_t v30 = (unsigned int *)(v12 + 40 + 4 * v28);
    unint64_t v31 = *v30;
    if ((v31 & v29) != 0)
    {
      if ((*(_DWORD *)((v11 & 0xFFFFFFFFFFF00000) + 0x28 + 4 * (v28 | 1)) & v29) == 0) {
        goto LABEL_43;
      }
      int v32 = (v27 >> 4) & 0x1F;
      unint64_t v33 = ((unint64_t)v30[2] << (32 - ((v27 >> 4) & 0x1F))) | (v31 >> ((v27 >> 4) & 0x1F));
      if (v32) {
        v33 |= (unint64_t)v30[4] << -(char)v32;
      }
      int v34 = __clz(__rbit64(v33 >> 1));
      if (v33 >= 2) {
        int v35 = v34 + 1;
      }
      else {
        int v35 = 0;
      }
    }
    else
    {
      int v35 = 0;
    }
    if (!malloc_zero_policy) {
      _platform_memset();
    }
    tiny_free_no_lock(v39, (uint64_t)v6, v8, v7, v11, v35, 0);
    if (!v36)
    {
      unint64_t v7 = 0;
      unint64_t v6 = 0;
    }
    *(void *)(a2 + 8 * v5) = 0;
LABEL_42:
    if (++v5 == v10)
    {
LABEL_43:
      if (v6)
      {
        int v37 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
        int v38 = v37;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v38, 0, memory_order_release, memory_order_relaxed);
        if (v38 != v37)
        {
          os_unfair_lock_unlock(v6);
        }
      }
      return;
    }
  }
  if (v6)
  {
    int v13 = *(_DWORD *)(StatusReg + 24);
    int v14 = v13;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v14, 0, memory_order_release, memory_order_relaxed);
    if (v14 != v13) {
      os_unfair_lock_unlock(v6);
    }
  }
  int v15 = *(uint64_t **)(a1 + 16536);
  uint64_t v16 = *v15;
  if (*v15)
  {
    uint64_t v17 = v15[2];
    unint64_t v18 = (0x9E3779B97F4A7C55 * (v11 >> 20)) >> -*((unsigned char *)v15 + 8);
    unint64_t v19 = v18;
    do
    {
      uint64_t v20 = *(void *)(v17 + 8 * v19);
      if (!v20) {
        break;
      }
      if (v20 == v12)
      {
        if (!v12) {
          return;
        }
        int v21 = 0;
        uint64_t v22 = *(void *)(a1 + 17136);
        int v8 = *(_DWORD *)((v11 & 0xFFFFFFFFFFF00000) + 0x18);
        unint64_t v6 = (os_unfair_lock_s *)(v22 + 2560 * v8);
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v21, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v21) {
          os_unfair_lock_lock_with_options();
        }
        for (int i = *(_DWORD *)((v11 & 0xFFFFFFFFFFF00000) + 0x18);
              v8 != i;
              int i = *(_DWORD *)((v11 & 0xFFFFFFFFFFF00000) + 0x18))
        {
          int v8 = i;
          int v24 = *(_DWORD *)(StatusReg + 24);
          int v25 = v24;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v25, 0, memory_order_release, memory_order_relaxed);
          if (v25 != v24) {
            os_unfair_lock_unlock(v6);
          }
          int v26 = 0;
          unint64_t v6 = (os_unfair_lock_s *)(v22 + 2560 * v8);
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v6, (unsigned int *)&v26, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
          if (v26) {
            os_unfair_lock_lock_with_options();
          }
        }
        unint64_t v7 = v11 & 0xFFFFFFFFFFF00000;
        goto LABEL_28;
      }
      if (v19 + 1 == v16) {
        unint64_t v19 = 0;
      }
      else {
        ++v19;
      }
    }
    while (v19 != v18);
  }
}

uint64_t print_tiny_free_list(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t, uint64_t *), void (*a3)(const char *, ...), uint64_t a4)
{
  uint64_t result = _simple_salloc();
  if (result)
  {
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    if (a2(a1, a4, 768, &v16))
    {
      int v8 = "Failed to map tiny rack\n";
      return ((uint64_t (*)(const char *))a3)(v8);
    }
    _simple_sappend();
    if (a2(a1, *(void *)(v16 + 624), 2560 * *(int *)(v16 + 608), &v15))
    {
      int v8 = "Failed to map tiny rack magazines\n";
      return ((uint64_t (*)(const char *))a3)(v8);
    }
    if ((*(_DWORD *)(v16 + 608) & 0x80000000) == 0)
    {
      uint64_t v9 = -1;
      do
      {
        _simple_sprintf();
        for (uint64_t i = 0; i != 64; ++i)
        {
          unint64_t v11 = *(const void **)(v15 + 2560 * v9 + 8 * i + 32);
          if (v11)
          {
            int v12 = 0;
            uint64_t v17 = 0;
            while (v11)
            {
              if (a2(a1, (uint64_t)v11, 16, &v17))
              {
                a3("** invalid pointer in free list: %p\n", v11);
                break;
              }
              unint64_t v11 = *(const void **)(v17 + 8);
              ++v12;
            }
            _simple_sprintf();
          }
        }
        _simple_sappend();
        ++v9;
      }
      while (v9 < *(int *)(v16 + 608));
    }
    int v13 = (const char *)_simple_string();
    a3("%s\n", v13);
    return _simple_sfree();
  }
  return result;
}

uint64_t print_tiny_region()
{
  uint64_t v0 = MEMORY[0x1F41887A8]();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  int v8 = v7;
  uint64_t v10 = v9;
  uint64_t v48 = *MEMORY[0x1E4F14BF8];
  unint64_t v11 = (char *)(v5 + 16512);
  uint64_t v46 = 0;
  if (v12(v0, v5 + 16512, 0x100000, &v46)) {
    return v10("Failed to map tiny region at %p\n", v11);
  }
  if (v6 == -1)
  {
    uint64_t result = _simple_salloc();
    if (!result) {
      return result;
    }
    _simple_sprintf();
    int v37 = (const char *)_simple_string();
    v10("%s\n", v37);
    return _simple_sfree();
  }
  int v45 = v8;
  unint64_t v14 = (unint64_t)&v11[v4];
  uint64_t v44 = v2;
  uint64_t v15 = &v11[-v2 + 1032064];
  uint64_t v16 = v46;
  _platform_memset();
  uint64_t v43 = v16;
  if (&v11[v4] >= v15)
  {
    int v18 = 0;
  }
  else
  {
    uint64_t v17 = 0;
    int v18 = 0;
    uint64_t v19 = v16 - (void)v11;
    while (1)
    {
      unint64_t v20 = (v14 & 0xFFFFFFFFFFF00000) + v19 + 40;
      unint64_t v21 = v14 & 0xFFFFFFFFFFF00000 | 0x4080;
      unsigned int v22 = ((v14 - v21) >> 8) & 0xFFE;
      int v23 = 1 << ((v14 - v21) >> 4);
      int v24 = (unsigned int *)(v20 + 4 * v22);
      unint64_t v25 = *v24;
      if ((v25 & v23) == 0) {
        break;
      }
      if ((*(_DWORD *)(v20 + 4 * (v22 | 1)) & v23) != 0)
      {
        unsigned int v26 = ((v14 - v21) >> 4) & 0x1F;
        unint64_t v27 = ((unint64_t)v24[2] << (32 - v26)) | (v25 >> v26);
        if (v26) {
          v27 |= (unint64_t)v24[4] << -(char)v26;
        }
        if (v27 < 2) {
          break;
        }
        int v28 = __clz(__rbit64(v27 >> 1));
        unsigned int v29 = v28 + 1;
        if (v28 == 63) {
          v10("*** error at %p msize for in_use is %d\n", (const void *)v14, v29);
        }
        ++v47[v29];
        ++v18;
        uint64_t v30 = 16 * v29;
      }
      else
      {
        if (v14 + 16 >= v21 + 1032064
          || ((*(_DWORD *)(((v14 + 16) & 0xFFFFFFFFFFF00000)
                         + v19
                         + (((((v14 + 16) & 0xFFFFF) - 16512) >> 6) & 0x3FF8)
                         + 40) >> ((((v14 + 16) & 0xFFFFFu) - 16512) >> 4)) & 1) != 0)
        {
          unsigned int v31 = 1;
        }
        else
        {
          unsigned int v31 = *(unsigned __int16 *)(v14 + v19 + 16);
          if ((char *)v14 == v11 && !*(_WORD *)(v14 + v19 + 16)) {
            goto LABEL_29;
          }
          if (!*(_WORD *)(v14 + v19 + 16)) {
            break;
          }
        }
        uint64_t v32 = -*MEMORY[0x1E4F14C80];
        unint64_t v33 = (v14 + *MEMORY[0x1E4F14C80] + 17) & v32;
        uint64_t v30 = 16 * v31;
        unint64_t v34 = (v14 + v30 - 2) & v32;
        BOOL v35 = v34 >= v33;
        unint64_t v36 = v34 - v33;
        if (!v35) {
          unint64_t v36 = 0;
        }
        v17 += v36;
      }
      v14 += v30;
      if (v14 >= (unint64_t)v15) {
        goto LABEL_29;
      }
    }
    v10("*** error with %p: msize=%d\n", (const void *)v14, 0);
  }
LABEL_29:
  uint64_t result = _simple_salloc();
  if (result)
  {
    int v38 = *(_DWORD *)(v43 + 24);
    _simple_sprintf();
    _simple_sprintf();
    _simple_sprintf();
    if (v44 | v4) {
      _simple_sprintf();
    }
    if (v38 != -1) {
      _simple_sprintf();
    }
    _simple_sprintf();
    if (v45 >= 2 && v18)
    {
      _simple_sappend();
      uint64_t v39 = 0;
      uint64_t v40 = v47;
      do
      {
        if (*v40++) {
          _simple_sprintf();
        }
        v39 += 16;
      }
      while (v39 != 0x4000);
    }
    unint64_t v42 = (const char *)_simple_string();
    v10("%s\n", v42);
    return _simple_sfree();
  }
  return result;
}

uint64_t tiny_free_list_check(uint64_t a1, unsigned int a2)
{
  if ((*(_DWORD *)(a1 + 608) & 0x80000000) != 0) {
    return 1;
  }
  unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  uint64_t v4 = -1;
  uint64_t v5 = a2;
  while (1)
  {
    int v6 = 0;
    int v7 = (os_unfair_lock_s *)(*(void *)(a1 + 624) + 2560 * v4);
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v7, (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
    if (v6) {
      os_unfair_lock_lock_with_options();
    }
    unint64_t v8 = *(void *)(*(void *)(a1 + 624) + 2560 * v4 + 8 * v5 + 32);
    if (v8) {
      break;
    }
LABEL_22:
    int v21 = *(_DWORD *)(StatusReg + 24);
    int v22 = v21;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v7, (unsigned int *)&v22, 0, memory_order_release, memory_order_relaxed);
    if (v22 != v21) {
      os_unfair_lock_unlock(v7);
    }
    ++v4;
    uint64_t result = 1;
    if (v4 >= *(int *)(a1 + 608)) {
      return result;
    }
  }
  unint64_t v9 = 0;
  int v10 = 0;
LABEL_7:
  unint64_t v11 = v8 & 0xFFFFFFFFFFF00000;
  unint64_t v12 = (v8 & 0xFFFFF) - 16512;
  unint64_t v13 = (v12 >> 8) & 0xFFE;
  int v14 = 1 << (v12 >> 4);
  if ((*(_DWORD *)((v8 & 0xFFFFFFFFFFF00000 | (8 * ((v13 >> 1) & 0x7FF))) + 0x28) & v14) == 0
    || (*(_DWORD *)((v8 & 0xFFFFFFFFFFF00000) + 4 * v13 + 0x2C) & v14) != 0)
  {
    int v24 = " (slot=%u), counter=%d\n*** in-use ptr in free list slot=%u count=%d ptr=%p\n";
  }
  else if ((v8 & 0xF) != 0)
  {
    int v24 = " (slot=%u), counter=%d\n*** unaligned ptr in free list slot=%u count=%d ptr=%p\n";
  }
  else
  {
    uint64_t v15 = *(uint64_t **)(a1 + 24);
    uint64_t v16 = *v15;
    if (*v15)
    {
      uint64_t v17 = v15[2];
      unint64_t v18 = (0x9E3779B97F4A7C55 * (v8 >> 20)) >> -*((unsigned char *)v15 + 8);
      unint64_t v19 = v18;
      do
      {
        uint64_t v20 = *(void *)(v17 + 8 * v19);
        if (!v20) {
          break;
        }
        if (v20 == v11)
        {
          if (!v11) {
            break;
          }
          if (v9 != *(void *)v8)
          {
            int v24 = " (slot=%u), counter=%d\n*** previous incorrectly set slot=%u count=%d ptr=%p\n";
            goto LABEL_27;
          }
          ++v10;
          unint64_t v9 = v8;
          unint64_t v8 = *(void *)(v8 + 8);
          if (v8) {
            goto LABEL_7;
          }
          goto LABEL_22;
        }
        if (v19 + 1 == v16) {
          unint64_t v19 = 0;
        }
        else {
          ++v19;
        }
      }
      while (v19 != v18);
    }
    int v24 = " (slot=%u), counter=%d\n*** ptr not in szone slot=%d  count=%u ptr=%p\n";
  }
LABEL_27:
  malloc_zone_check_fail((uint64_t)"check: tiny free list incorrect ", (uint64_t)v24);
  uint64_t result = 0;
  int v25 = *(_DWORD *)(StatusReg + 24);
  int v26 = v25;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v7, (unsigned int *)&v26, 0, memory_order_release, memory_order_relaxed);
  if (v26 != v25)
  {
    os_unfair_lock_unlock(v7);
    return 0;
  }
  return result;
}

uint64_t tiny_check(uint64_t a1)
{
  uint64_t v2 = *(unint64_t **)(a1 + 24);
  if (*v2)
  {
    unint64_t v3 = 0;
    unint64_t StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      uint64_t v5 = *(void *)(v2[2] + 8 * v3);
      if ((unint64_t)(v5 + 1) >= 2)
      {
        int v6 = 0;
        uint64_t v7 = *(void *)(a1 + 624);
        int v8 = *(_DWORD *)(v5 + 24);
        unint64_t v9 = (os_unfair_lock_s *)(v7 + 2560 * v8);
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v6, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
        if (v6) {
          os_unfair_lock_lock_with_options();
        }
        int v10 = *(_DWORD *)(v5 + 24);
        if (v10 != v8)
        {
          do
          {
            int v11 = *(_DWORD *)(StatusReg + 24);
            int v12 = v11;
            atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v12, 0, memory_order_release, memory_order_relaxed);
            if (v12 != v11) {
              os_unfair_lock_unlock(v9);
            }
            int v13 = 0;
            unint64_t v9 = (os_unfair_lock_s *)(v7 + 2560 * v10);
            atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v13, *(_DWORD *)(StatusReg + 24), memory_order_acquire, memory_order_acquire);
            if (v13) {
              os_unfair_lock_lock_with_options();
            }
            BOOL v14 = v10 == *(_DWORD *)(v5 + 24);
            int v10 = *(_DWORD *)(v5 + 24);
          }
          while (!v14);
        }
        int v15 = tiny_check_region(a1, v5);
        int v16 = *(_DWORD *)(StatusReg + 24);
        int v17 = v16;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)v9, (unsigned int *)&v17, 0, memory_order_release, memory_order_relaxed);
        BOOL v18 = v17 == v16;
        if (!v15)
        {
          if (!v18) {
            os_unfair_lock_unlock(v9);
          }
          return 0;
        }
        if (!v18) {
          os_unfair_lock_unlock(v9);
        }
      }
      ++v3;
      uint64_t v2 = *(unint64_t **)(a1 + 24);
    }
    while (v3 < *v2);
  }
  uint64_t v19 = 0;
  while (1)
  {
    uint64_t result = tiny_free_list_check(a1, v19);
    if (!result) {
      break;
    }
    if (++v19 == 63) {
      return 1;
    }
  }
  return result;
}

unint64_t tiny_free_try_depot_unmap_no_lock(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)(a3 + 16)) {
    return 0;
  }
  if (*(int *)(a3 + 28) > 0) {
    return 0;
  }
  unsigned int v5 = *(_DWORD *)(a2 + 2172);
  if (v5 < recirc_retained_regions) {
    return 0;
  }
  uint64_t v7 = *(void *)a3;
  int v8 = *(void **)(a3 + 8);
  if (*(void *)a3)
  {
    *(void *)(v7 + 8) = v8;
    int v8 = *(void **)(a3 + 8);
  }
  else
  {
    *(void *)(a2 + 2176) = v8;
  }
  if (!v8) {
    int v8 = (void *)(a2 + 2184);
  }
  *int v8 = v7;
  *(void *)a3 = 0;
  *(void *)(a3 + 8) = 0;
  *(_DWORD *)(a2 + 2172) = v5 - 1;
  unint64_t v9 = a3 & 0xFFFFFFFFFFF00000;
  if (tiny_free_detach_region((uint64_t)a1, a2, a3 & 0xFFFFFFFFFFF00000))
  {
    malloc_zone_error(a1[155]._os_unfair_lock_opaque, 1, (uint64_t)"tiny_free_try_depot_unmap_no_lock objects_in_use not zero: %d\n");
    return 0;
  }
  if (!rack_region_remove(a1, a3 & 0xFFFFFFFFFFF00000, a3)) {
    return 0;
  }
  *(void *)(a2 + 2160) -= 1032064;
  return v9;
}

void _tiny_check_and_zero_inline_meta_from_freelist(uint64_t a1, uint64_t a2, unsigned int a3)
{
  *(void *)a2 = 0;
  *(void *)(a2 + 8) = 0;
  if (a3 >= 2)
  {
    int v4 = *(unsigned __int16 *)(a2 + 16);
    uint64_t v5 = a2 + 16 * a3;
    if (v4 == *(unsigned __int16 *)(v5 - 2))
    {
      if (v4 == a3)
      {
LABEL_10:
        *(_WORD *)(a2 + 16) = 0;
        *(_WORD *)(v5 - 2) = 0;
        return;
      }
      int v6 = "Corruption at %p: unexpected msizes %u/%u\n";
    }
    else
    {
      int v6 = "Corruption of free object %p: msizes %u/%u disagree\n";
    }
    malloc_zone_error(256, 1, (uint64_t)v6);
    goto LABEL_10;
  }
  if (!a3)
  {
    if (*(_WORD *)(a2 + 16)) {
      malloc_zone_error(256, 1, (uint64_t)"Corruption at %p: unexpected nonzero msize %u\n");
    }
  }
}

uint64_t _malloc_default_debug_sleep_time()
{
  if (malloc_error_sleep) {
    return 3600;
  }
  else {
    return 0;
  }
}

void malloc_printf(const char *format, ...)
{
}

ssize_t _malloc_put(unsigned int a1, const char *a2)
{
  ssize_t result = _simple_salloc();
  if (result)
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_sprintf();
    }
    _simple_sprintf();
    if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0)) {
      _simple_put();
    }
    if (_malloc_no_asl_log & ~(a1 >> 4))
    {
      _simple_string();
      _simple_asl_log();
    }
    return _simple_sfree();
  }
  else if ((a1 & 0x200) == 0 && (debug_mode == 2 || debug_mode == 1 && (a1 & 0x40) != 0))
  {
    if ((a1 & 0x20) == 0)
    {
      _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
      getprogname();
      getpid();
      _simple_dprintf();
    }
    size_t v5 = strlen(a2);
    return write(2, a2, v5);
  }
  return result;
}

void malloc_report_simple(uint64_t a1)
{
  if (malloc_error_sleep) {
    unsigned int v1 = 3600;
  }
  else {
    unsigned int v1 = 0;
  }
  malloc_vreport(0x30u, v1, 0, 0, a1);
}

void malloc_zone_error(__int16 a1, char a2, uint64_t a3)
{
  char v3 = a2 ^ 1;
  if ((a1 & 0x100) == 0) {
    char v3 = 1;
  }
  if ((((a1 & 0x40) == 0) & v3) != 0) {
    unsigned int v4 = 147;
  }
  else {
    unsigned int v4 = 67;
  }
  if (malloc_error_sleep) {
    unsigned int v5 = 3600;
  }
  else {
    unsigned int v5 = 0;
  }
  malloc_vreport(v4, v5, 0, 0, a3);
}

void bitarray_set_cold_1(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - invalid bitarray level";
  qword_1E93090E0 = a1;
  __break(1u);
}

void bitarray_first_set_cold_1(unsigned int a1)
{
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - invalid bitarray level";
  qword_1E93090E0 = a1;
  __break(1u);
}

void xzm_reclaim_mark_used_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"cache->ric_head < XZM_RECLAIM_ID_COUNT\" failed (/Libr"
                             "ary/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:141)";
  __break(1u);
}

void xzm_reclaim_mark_free_cold_1(int a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: mach_vm_reclaim_mark_free_with_id failed";
  qword_1E93090E0 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_1()
{
  uint64_t v0 = *__error();
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: sysctlbyname(\"vm.malloc_ranges\") failed";
  qword_1E93090E0 = v0;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_2()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"left_void.min_address\" failed (/Library/Caches/com.ap"
                             "ple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:611)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_3()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"left_void.max_address >= left_void.min_address\" faile"
                             "d (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:612)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_4()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"right_void.min_address >= left_void.max_address\" fail"
                             "ed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:613)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_5()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"right_void.max_address >= right_void.min_address\" fai"
                             "led (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:614)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_6()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"candidate_span\" failed (/Library/Caches/com.apple.xbs"
                             "/Sources/libmalloc/src/xzone/xzone_segment.c:675)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_7()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"(start_address >= left_void.min_address && end_address"
                             " + XZM_RANGE_SEPARATION <= left_void.max_address) || (start_address >= right_void.min_addre"
                             "ss + XZM_RANGE_SEPARATION && start_address + XZM_POINTER_RANGE_SIZE <= right_void.max_addre"
                             "ss)\" failed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:700)";
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_8(int a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: unexpected error from mach_vm_range_create()";
  qword_1E93090E0 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_9(int a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: pointer range initial overwrite failed";
  qword_1E93090E0 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_init_range_groups_cold_10()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"right_candidate_span % XZM_PAGE_TABLE_GRANULE == 0\" f"
                             "ailed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:669)";
  __break(1u);
}

void xzm_chunk_mark_free_cold_1(unsigned __int8 a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: asking for start of chunk with invalid kind";
  qword_1E93090E0 = a1;
  __break(1u);
}

void xzm_segment_group_alloc_chunk_cold_3(int a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: mach_vm_map() overwrite failed";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_segment_group_find_and_allocate_chunk_cold_1(unsigned __int8 a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: unknown segment group id";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_segment_group_segment_span_free_coalesce_cold_1(unsigned __int8 a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: bad chunk kind";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_segment_group_segment_span_free_coalesce_cold_4()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: attempting to coalesce slice of unexpected type";
  __break(1u);
}

void _xzm_segment_group_init_segment_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Slice count too large in init_segment";
  __break(1u);
}

void _xzm_segment_group_init_segment_cold_2()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"(uintptr_t)body < XZM_LIMIT_ADDRESS\" failed (/Library"
                             "/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:1766)";
  __break(1u);
}

void _xzm_segment_group_init_segment_cold_3()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"(uintptr_t)segment < XZM_LIMIT_ADDRESS\" failed (/Libr"
                             "ary/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:1765)";
  __break(1u);
}

void _xzm_segment_table_allocated_at_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"((uintptr_t)segment >> XZM_METAPOOL_SEGMENT_BLOCK_SHIF"
                             "T) < UINT32_MAX\" failed (/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/../xzon"
                             "e/xzone_inline_internal.h:190)";
  __break(1u);
}

void _xzm_segment_group_alloc_segment_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"(uintptr_t)segment_body < XZM_LIMIT_ADDRESS\" failed ("
                             "/Library/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_segment.c:1870)";
  __break(1u);
}

void _xzm_segment_group_alloc_segment_cold_2(int a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: pointer range mach_vm_map() overwrite failed";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_segment_group_segment_create_guard_cold_1()
{
  uint64_t v0 = *__error();
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Failed to mprotect guard page";
  qword_1E93090E0 = v0;
  __break(1u);
}

uint64_t large_entry_free_no_lock_cold_1()
{
  return kdebug_trace();
}

uint64_t szone_pressure_relief_cold_1()
{
  OUTLINED_FUNCTION_0();
  kdebug_trace();
  OUTLINED_FUNCTION_0();

  return kdebug_trace();
}

void small_free_list_remove_ptr_no_clear_cold_2(uint64_t a1, unint64_t a2, unint64_t a3)
{
  int v4 = *(_DWORD *)(a1 + 620);
  small_free_list_get_ptr(a2);
  small_free_list_get_ptr(a3);
  malloc_zone_error(v4, 1, (uint64_t)"small_free_list_remove_ptr_no_clear: Internal invariant broken (prev ptr of next) for %p, next_prev=%p\n");
  __break(1u);
}

void small_free_list_remove_ptr_no_clear_cold_3(uint64_t a1, unint64_t a2, unint64_t a3)
{
  int v4 = *(_DWORD *)(a1 + 620);
  small_free_list_get_ptr(a2);
  small_free_list_get_ptr(a3);
  malloc_zone_error(v4, 1, (uint64_t)"small_free_list_remove_ptr_no_clear: Internal invariant broken (next ptr of prev) for %p, prev_next=%p\n");
  __break(1u);
}

void free_small_cold_1()
{
  qword_1E93090B0 = (uint64_t)"small free list metadata inconsistency (headers[previous] != previous size)";
  __break(1u);
}

void xzm_metapool_alloc_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Failed to allocate malloc metadata";
  __break(1u);
}

void rack_init_cold_1()
{
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - unable to allocate magazine array";
  __break(1u);
}

void mfm_initialize_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: failed to allocate memory";
  qword_1E93090E0 = 0;
  __break(1u);
}

void mfm_initialize_cold_2(int a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: failed to overwrite mfm arena";
  qword_1E93090E0 = a1;
  __break(1u);
}

void mfm_free_cold_1(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: not an allocated block";
  qword_1E93090E0 = a1;
  __break(1u);
}

void mfm_free_cold_2(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: double free detected";
  qword_1E93090E0 = a1;
  __break(1u);
}

void mfm_free_cold_3(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: invalid address";
  qword_1E93090E0 = a1;
  __break(1u);
}

void mfm_free_cold_4(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: not MFM owned";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_introspect_map_zone_and_main_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"zone\" failed (/Library/Caches/com.apple.xbs/Sources/l"
                             "ibmalloc/src/xzone/xzone_introspect.c:557)";
  __break(1u);
}

void _xzm_introspect_map_zone_and_main_cold_2()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"main_address\" failed (/Library/Caches/com.apple.xbs/S"
                             "ources/libmalloc/src/xzone/xzone_introspect.c:559)";
  __break(1u);
}

void pgm_create_zone_cold_2()
{
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - ProbGuard: memory budget too small";
  __break(1u);
}

void pgm_create_zone_cold_3()
{
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - ProbGuard: bad configuration";
  __break(1u);
}

void debug_zone_cold_1(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - ProbGuard: zone integrity check failed";
  qword_1E93090E0 = a1;
  __break(1u);
}

void deallocate_cold_1(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - ProbGuard: invalid pointer passed to free";
  qword_1E93090E0 = a1;
  __break(1u);
}

void reallocate_cold_2(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - ProbGuard: invalid pointer passed to realloc";
  qword_1E93090E0 = a1;
  __break(1u);
}

BOOL nanov2_create_zone_cold_1()
{
  kdebug_trace();
  BOOL vm_space = nano_common_allocate_vm_space(0x300000000uLL, 0x20000000uLL);
  kdebug_trace();
  return vm_space;
}

void xzm_realloc_cold_2(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: pointer being reallocated with wrong zone";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_foreach_lock_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"success\" failed (/Library/Caches/com.apple.xbs/Source"
                             "s/libmalloc/src/xzone/xzone_malloc.c:2724)";
  __break(1u);
}

void xzm_ptr_lookup_4test_cold_2()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"xz\" failed (/Library/Caches/com.apple.xbs/Sources/lib"
                             "malloc/src/xzone/xzone_malloc.c:4172)";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: couldn't find executable_boothash";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_2()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Invalid xzone slot config";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_3()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Failed to allocate xzm zone";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_5(int a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: mach_timebase_info failed";
  qword_1E93090E0 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_6()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"xzone_count <= UINT8_MAX\" failed (/Library/Caches/com"
                             ".apple.xbs/Sources/libmalloc/src/xzone/xzone_malloc.c:4732)";
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_7(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: invalid executable_boothash length";
  qword_1E93090E0 = a1;
  __break(1u);
}

void xzm_main_malloc_zone_create_cold_8()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: invalid executable_boothash string";
  __break(1u);
}

void _xzm_xzone_malloc_from_tiny_chunk_cold_1(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: memory corruption of free block";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_xzone_malloc_from_empty_tiny_chunk_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"success\" failed (/Library/Caches/com.apple.xbs/Source"
                             "s/libmalloc/src/xzone/xzone_malloc.c:805)";
  __break(1u);
}

void _xzm_xzone_fresh_chunk_init_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Unexpected chunk kind";
  __break(1u);
}

void _xzm_xzone_free_to_chunk_cold_1(unsigned __int8 a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Attempting to free to non-chunk slice";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_xzone_chunk_free_cold_2(unsigned __int8 a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: Unexpected chunk kind";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_allocation_slots_do_lock_action_cold_1(unsigned int a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: ulock_wait failure";
  qword_1E93090E0 = a1;
  __break(1u);
}

void _xzm_allocation_slots_do_lock_action_cold_2()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"prev_slot_value == slot_meta.xasa_value\" failed (/Lib"
                             "rary/Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_malloc.c:1114)";
  __break(1u);
}

void xzm_malloc_zone_destroy_cold_2()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"retries < 10\" failed (/Library/Caches/com.apple.xbs/S"
                             "ources/libmalloc/src/xzone/xzone_malloc.c:4085)";
  __break(1u);
}

void xzm_malloc_zone_destroy_cold_3()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"!chunk->xzc_bits.xzcb_preallocated\" failed (/Library/"
                             "Caches/com.apple.xbs/Sources/libmalloc/src/xzone/xzone_malloc.c:4039)";
  __break(1u);
}

void xzm_malloc_zone_free_slow_cold_1(uint64_t a1)
{
  qword_1E93090B0 = (uint64_t)"BUG IN CLIENT OF LIBMALLOC: pointer being freed was not allocated";
  qword_1E93090E0 = a1;
  __break(1u);
}

void xzm_malloc_zone_malloc_type_realloc_slow_cold_1()
{
  qword_1E93090B0 = (uint64_t)"BUG IN LIBMALLOC: malloc assertion \"old_size\" failed (/Library/Caches/com.apple.xbs/Sourc"
                             "es/libmalloc/src/xzone/xzone_malloc.c:3472)";
  __break(1u);
}

void __malloc_init_cold_1()
{
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - logical_ncpus / phys_ncpus not 1, 2, or 4";
  qword_1E93090E0 = logical_ncpus / phys_ncpus;
  __break(1u);
}

void __malloc_init_cold_2()
{
  malloc_report(3u, (uint64_t)"*** FATAL ERROR - logical_ncpus %% phys_ncpus != 0\n.\n");
  qword_1E93090B0 = (uint64_t)"FATAL ERROR - logical_ncpus %% phys_ncpus != 0\n";
  qword_1E93090E0 = logical_ncpus % phys_ncpus;
  __break(1u);
}

void tiny_zero_corruption_abort(uint64_t a1)
{
  uint64_t v1 = 0;
  while (!*(unsigned __int8 *)(a1 + v1++))
    ;
  malloc_zone_error(256, 1, (uint64_t)"Corruption detected in block %p of size %u at offset %u, first 32 bytes at that offset are %02X %02X %02X %02X %02X %02X %02X %02X | %02X %02X %02X %02X %02X %02X %02X %02X | %02X %02X %02X %02X %02X %02X %02X %02X | %02X %02X %02X %02X %02X %02X %02X %02X\n");
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1F40CF590](libraryName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

char ***_NSGetEnviron(void)
{
  return (char ***)MEMORY[0x1F40CF700]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40CFD60]();
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1F40CFE60]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1F40CFE68]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1F40CF5A0](*(void *)&image_index);
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x1F40CF5B0]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1F40CF5E8]();
}

uint64_t _os_feature_enabled_simple_impl()
{
  return MEMORY[0x1F40CFCC8]();
}

uint64_t _os_once()
{
  return MEMORY[0x1F40D0728]();
}

uint64_t _platform_bzero()
{
  return MEMORY[0x1F40D0740]();
}

uint64_t _platform_memcmp_zero_aligned8()
{
  return MEMORY[0x1F40D0748]();
}

uint64_t _platform_memmove()
{
  return MEMORY[0x1F40D0750]();
}

uint64_t _platform_memset()
{
  return MEMORY[0x1F40D0758]();
}

uint64_t _platform_strchr()
{
  return MEMORY[0x1F40D0760]();
}

uint64_t _platform_strcmp()
{
  return MEMORY[0x1F40D0768]();
}

uint64_t _platform_strcpy()
{
  return MEMORY[0x1F40D0770]();
}

uint64_t _platform_strlcpy()
{
  return MEMORY[0x1F40D0778]();
}

uint64_t _platform_strlen()
{
  return MEMORY[0x1F40D0780]();
}

uint64_t _platform_strncmp()
{
  return MEMORY[0x1F40D0788]();
}

uint64_t _platform_strstr()
{
  return MEMORY[0x1F40D0790]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1F40D0798]();
}

uint64_t _simple_dprintf()
{
  return MEMORY[0x1F40D07B0]();
}

uint64_t _simple_getenv()
{
  return MEMORY[0x1F40D07B8]();
}

uint64_t _simple_put()
{
  return MEMORY[0x1F40D07C0]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x1F40D07C8]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x1F40D07D0]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x1F40D07D8]();
}

uint64_t _simple_sprintf()
{
  return MEMORY[0x1F40D07E0]();
}

uint64_t _simple_string()
{
  return MEMORY[0x1F40D07F0]();
}

uint64_t _simple_vdprintf()
{
  return MEMORY[0x1F40D07F8]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x1F40D0800]();
}

void abort(void)
{
}

void *__cdecl j__aligned_alloc(size_t __alignment, size_t __size)
{
  while (1)
    ;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CF7C8]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CF7D8](*(void *)&__upper_bound);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CF7F0](a1, *(void *)&a2);
}

void backtrace_image_offsets(void *const *array, image_offset *image_offsets, int size)
{
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl j__calloc(size_t __count, size_t __size)
{
  while (1)
    ;
}

uint64_t csops()
{
  return MEMORY[0x1F40CFF00]();
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1F40CF648]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1F40CF650]();
}

void j__free(void *a1)
{
  while (1)
    ;
}

int getentropy(void *buffer, size_t size)
{
  return MEMORY[0x1F40CFFD8](buffer, size);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CF8B8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40D0000]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CF8C8]();
}

int isatty(int a1)
{
  return MEMORY[0x1F40CF900](*(void *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1F40D0080]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1F40D0088]();
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x1F40D00A8](*(void *)&a1, *(void *)&a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40D00F8]();
}

BOOLean_t mach_task_is_self(task_name_t task)
{
  return MEMORY[0x1F40D01E0](*(void *)&task);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40D01E8](info);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1F40D01F0](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40D01F8](*(void *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1F40D0200](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

kern_return_t mach_vm_page_range_query(vm_map_read_t target_map, mach_vm_offset_t address, mach_vm_size_t size, mach_vm_address_t dispositions, mach_vm_size_t *dispositions_count)
{
  return MEMORY[0x1F40D0208](*(void *)&target_map, address, size, dispositions, dispositions_count);
}

kern_return_t mach_vm_protect(vm_map_t target_task, mach_vm_address_t address, mach_vm_size_t size, BOOLean_t set_maximum, vm_prot_t new_protection)
{
  return MEMORY[0x1F40D0210](*(void *)&target_task, address, size, *(void *)&set_maximum, *(void *)&new_protection);
}

kern_return_t mach_vm_range_create(vm_map_t target_task, mach_vm_range_flavor_t flavor, mach_vm_range_recipes_raw_t recipes, mach_msg_type_number_t recipesCnt)
{
  return MEMORY[0x1F40D0218](*(void *)&target_task, *(void *)&flavor, recipes, *(void *)&recipesCnt);
}

uint64_t mach_vm_reclaim_is_available()
{
  return MEMORY[0x1F40D0228]();
}

uint64_t mach_vm_reclaim_mark_free()
{
  return MEMORY[0x1F40D0238]();
}

uint64_t mach_vm_reclaim_mark_free_with_id()
{
  return MEMORY[0x1F40D0240]();
}

uint64_t mach_vm_reclaim_mark_used()
{
  return MEMORY[0x1F40D0248]();
}

uint64_t mach_vm_reclaim_ringbuffer_init()
{
  return MEMORY[0x1F40D0250]();
}

uint64_t mach_vm_reclaim_update_kernel_accounting()
{
  return MEMORY[0x1F40D0260]();
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40D0290](a1, a2, *(void *)&a3);
}

void *__cdecl j__malloc(size_t __size)
{
  while (1)
    ;
}

malloc_zone_t *j__malloc_default_zone(void)
{
  while (1)
    ;
}

void *__cdecl j__malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  while (1)
    ;
}

void *__cdecl j__malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  while (1)
    ;
}

void *__cdecl j__malloc_zone_memalign(malloc_zone_t *zone, size_t alignment, size_t size)
{
  while (1)
    ;
}

void *__cdecl j__malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  while (1)
    ;
}

void *__cdecl j__malloc_zone_valloc(malloc_zone_t *zone, size_t size)
{
  while (1)
    ;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CF920](__dst, __src, __n);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1F40D02E8](a1, a2, *(void *)&a3);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40D0838]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int j__posix_memalign(void **__memptr, size_t __alignment, size_t __size)
{
  while (1)
    ;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CF960](a1);
}

void *__cdecl j__realloc(void *__ptr, size_t __size)
{
  while (1)
    ;
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CF9D8](*(void *)&a1);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CFA10](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CFA60](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CFAC0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CFAC8](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CFAD0](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull_l(const char *a1, char **a2, int a3, locale_t a4)
{
  return MEMORY[0x1F40CFAD8](a1, a2, *(void *)&a3, a4);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CFAF0](a1, a2, a3, a4, a5);
}

uint64_t thread_stack_pcs()
{
  return MEMORY[0x1F40CFB00]();
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return MEMORY[0x1F40D0510](*(void *)&thread_name, *(void *)&option, *(void *)&option_time);
}

int unsetenv(const char *a1)
{
  return MEMORY[0x1F40CFB10](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CFB30](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void *__cdecl j__valloc(size_t a1)
{
  while (1)
    ;
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40D0530](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_purgable_control(vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1F40D0548](*(void *)&target_task, address, *(void *)&control, state);
}