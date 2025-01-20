void ___os_log_watch_for_prefchanges_block_invoke()
{
  atomic_fetch_add_explicit(&dword_1EB1CF808, 1u, memory_order_relaxed);
}

BOOL _os_trace_lazy_init_completed_4swift()
{
  return _os_trace != 0;
}

void _os_activity_initiate_impl(unint64_t a1, uint64_t a2, char a3, uint64_t a4, void (*a5)(uint64_t))
{
  _os_activity_create_addr(a1, a2, -3, a3, v5);
  voucher_adopt();
  a5(a4);
  v8 = (void *)voucher_adopt();

  os_release(v8);
}

uint64_t _os_activity_create_addr(unint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v69 = *MEMORY[0x1E4F14BF8];
  if (a4) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = a3;
  }
  if ((a4 & 2) == 0) {
    goto LABEL_11;
  }
  if (a4)
  {
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Invalid flags passed";
    __break(1u);
    goto LABEL_87;
  }
  if (a3 != -3)
  {
LABEL_87:
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Parent must be OS_ACTIVITY_CURRENT when OS_ACTIVITY_FLAG_NONE_PRESENT is used";
    __break(1u);
    return MEMORY[0x1F40CF568]();
  }
  if (voucher_get_activity_id())
  {
    return MEMORY[0x1F40CF568]();
  }
LABEL_11:
  unint64_t v48 = a1;
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  v67 = 0;
  unint64_t v68 = 0;
  unint64_t v65 = 0;
  uint64_t v66 = 0;
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  uint64_t v47 = a2;
  int v9 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v39 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v39, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v39 == v9) {
      _os_log_preferences_refresh_process();
    }
  }
  if (off_1EB1CF7E8) {
    v10 = (atomic_ullong *)((char *)off_1EB1CF7E8 + 8);
  }
  else {
    v10 = 0;
  }
  unint64_t v11 = 0x1EB1CF000uLL;
  unint64_t v12 = v48;
  uint64_t v46 = v8;
  if (_os_trace_dsc_load_addr <= v48 && _os_trace_dsc_size + _os_trace_dsc_load_addr > v48)
  {
    int v13 = a5 - _os_trace_dsc_load_addr;
    LODWORD(v66) = a5 - _os_trace_dsc_load_addr;
    WORD2(v66) = (unint64_t)(a5 - _os_trace_dsc_load_addr) >> 32;
    v67 = 0;
    if (WORD2(v66))
    {
      v44 = 0;
      int v45 = 0;
      uint64_t v14 = 6;
      HIWORD(v66) = 6;
      unsigned int v15 = 12;
      int v16 = 1;
    }
    else
    {
      HIDWORD(v66) = 0x40000;
      v44 = 0;
      int v16 = 0;
      uint64_t v14 = 4;
      int v45 = 1;
      unsigned int v15 = 4;
    }
    goto LABEL_55;
  }
  if (*(_DWORD *)(v48 + 12) != 2)
  {
    if (off_1EB1CF7E8)
    {
LABEL_26:
      atomic_ullong v17 = *v10;
      do
      {
        if (v17)
        {
          unint64_t v19 = v11;
          v20 = v10;
          _os_trace_rwptr_rdlock_wait((uint64_t)v10);
          v10 = v20;
          unint64_t v11 = v19;
          unint64_t v12 = v48;
          goto LABEL_26;
        }
        atomic_ullong v18 = v17;
        atomic_compare_exchange_strong_explicit(v10, (unint64_t *)&v18, v17 + 0x200000000, memory_order_relaxed, memory_order_relaxed);
        BOOL v26 = v18 == v17;
        atomic_ullong v17 = v18;
      }
      while (!v26);
      atomic_ullong v21 = v10[1];
      unint64_t v22 = *(unsigned __int16 *)(v21 + 10);
      unint64_t v23 = (v12 >> *MEMORY[0x1E4F14C78]) % v22;
      while (1)
      {
        unint64_t v24 = v21 + 16 * v23;
        uint64_t v25 = *(void *)(v24 + 16);
        if (v25 == v12) {
          break;
        }
        if (v23 + 1 == v22) {
          unint64_t v23 = 0;
        }
        else {
          ++v23;
        }
        if (v25) {
          BOOL v26 = v23 == (v12 >> *MEMORY[0x1E4F14C78]) % v22;
        }
        else {
          BOOL v26 = 1;
        }
        if (v26)
        {
          v27 = 0;
          goto LABEL_43;
        }
      }
      v27 = *(_OWORD **)(v24 + 24);
LABEL_43:
      unint64_t v28 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      atomic_ullong v29 = *v10;
      atomic_ullong v30 = *v10;
      do
      {
        unint64_t v31 = v29 - 0x200000000;
        if (v29 == 0x300000000) {
          unint64_t v31 = v28;
        }
        atomic_compare_exchange_strong_explicit(v10, (unint64_t *)&v30, v31, memory_order_relaxed, memory_order_relaxed);
        BOOL v26 = v30 == v29;
        atomic_ullong v29 = v30;
      }
      while (!v26);
      if (v31 == v28)
      {
        __dmb(9u);
        _os_trace_rwptr_cleanup((uint64_t)v10, (void (*)(void))_os_trace_mh_map_cleanup);
      }
      v67 = v27;
      if (v27)
      {
        v44 = v27;
        int v16 = 0;
        int v45 = 0;
        int v13 = a5 - v12;
        LODWORD(v66) = a5 - v12;
        WORD2(v66) = (a5 - v12) >> 32;
        uint64_t v14 = 20;
        HIWORD(v66) = 20;
        unsigned int v15 = 10;
        goto LABEL_55;
      }
    }
    else
    {
      v67 = 0;
    }
    v44 = 0;
    int v45 = 0;
    LODWORD(v66) = a5;
    WORD2(v66) = WORD2(a5);
    uint64_t v14 = 6;
    HIWORD(v66) = 6;
    unsigned int v15 = 8;
    int v16 = 1;
    int v13 = a5;
    goto LABEL_55;
  }
  v44 = 0;
  int v16 = 0;
  int v13 = a5 - v48;
  LODWORD(v66) = a5 - v48;
  WORD2(v66) = (a5 - v48) >> 32;
  uint64_t v14 = 4;
  HIWORD(v66) = 4;
  v67 = 0;
  unsigned int v15 = 2;
  int v45 = 1;
LABEL_55:
  if (v47)
  {
    unint64_t v32 = *(void *)(v11 + 2360);
    if (v32 <= v12)
    {
      if (_os_trace_dsc_size + v32 <= v12) {
        unint64_t v32 = v12;
      }
      unint64_t v33 = v47 - v32;
    }
    else
    {
      unint64_t v33 = v47 - v12;
    }
    unint64_t v34 = v33 & 0x7FFFFFFF | ((unint64_t)(unsigned __int16)(v33 >> 31) << 32);
  }
  else
  {
    unint64_t v34 = 0;
  }
  unint64_t v65 = v34;
  MEMORY[0x1F41887A8](v10);
  v36 = (char *)&v43 - v35;
  bzero((char *)&v43 - v35, v14 + 2 * ((v34 & 0xFFFF00000000) != 0));
  if (v16)
  {
    *(_DWORD *)v36 = v66;
    *((_WORD *)v36 + 2) = WORD2(v66);
  }
  else
  {
    *(_DWORD *)v36 = v13;
    if ((v45 & 1) == 0) {
      *(_OWORD *)(v36 + 4) = *v44;
    }
  }
  if ((v34 & 0xFFFF00000000) != 0)
  {
    v15 |= 0x20u;
    *(_WORD *)&v36[v14] = WORD2(v34);
  }
  unint64_t v68 = ((unint64_t)v15 << 16) | (v34 << 32) | 0x102;
  _os_get_logging_unreliable_for_current_thread();
  uint64_t v37 = voucher_activity_create_with_data_2();
  if ((WORD4(xmmword_1EB1CF7F0) & 0x500) == 0
    && (MEMORY[0xFFFFFC104] & 0x500) == 0
    && ((BYTE8(xmmword_1EB1CF7F0) & 8) != 0
     || (MEMORY[0xFFFFFC104] & 8) != 0
     || (voucher_get_activity_id() & 0x800000000000000) != 0)
    && (byte_1EB1CF868 & 1) != 0)
  {
    v40 = _os_trace_diagnosticd_pipe(0);
    if (v40)
    {
      v41 = v40;
      unint64_t v63 = 0;
      uint64_t v64 = 0;
      uint64_t v62 = 0;
      if (mach_get_times()) {
        _os_assumes_log();
      }
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
      memset(v49, 0, sizeof(v49));
      if (v68 <= 6u && ((1 << v68) & 0x58) != 0) {
        unsigned int v42 = v68 << 8;
      }
      else {
        unsigned int v42 = bswap32(v68) >> 16;
      }
      v49[0] = v42;
      *((void *)&v50 + 1) = v68;
      *(void *)&long long v51 = v64;
      *(void *)&long long v53 = v62;
      *((void *)&v53 + 1) = (v63 / 0x3E8);
      *(void *)&long long v56 = v47;
      _os_activity_stream_reflect((uint64_t)v41, (uint64_t)v49, v48, v37, (unsigned int *)&v66, (uint64_t)&v65);
      xpc_release(v41);
    }
  }
  return v37;
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  if (!os_signpost_enabled(log)) {
    return 0;
  }
  if ((~HIDWORD(log[7].isa) & 0x18000) != 0) {
    return atomic_fetch_add_explicit(&os_signpost_id_generate__os_signpost_id_next, 1uLL, memory_order_relaxed);
  }

  return MEMORY[0x1F40CF538](0);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  if (!os_signpost_enabled(log)) {
    return 0;
  }
  if ((~HIDWORD(log[7].isa) & 0x18000) == 0) {
    return -1;
  }
  unint64_t v5 = os_signpost_id_make_with_pointer__os_signpost_slide;
  uint64_t __buf = os_signpost_id_make_with_pointer__os_signpost_slide;
  if (os_signpost_id_make_with_pointer__os_signpost_slide == -1)
  {
    _NSGetMachExecuteHeader();
    if (_dyld_get_image_slide())
    {
      arc4random_buf(&__buf, 8uLL);
      unint64_t v5 = __buf & ~*MEMORY[0x1E4F14C58];
      uint64_t v6 = -1;
      atomic_compare_exchange_strong_explicit(&os_signpost_id_make_with_pointer__os_signpost_slide, (unint64_t *)&v6, v5, memory_order_relaxed, memory_order_relaxed);
      if (v6 != -1) {
        unint64_t v5 = v6;
      }
    }
    else
    {
      unint64_t v5 = 0;
      os_signpost_id_make_with_pointer__os_signpost_slide = 0;
    }
  }
  return (os_signpost_id_t)ptr + v5;
}

BOOL os_signpost_enabled(os_log_t log)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v2 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v5 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v5, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v5 == v2) {
      _os_log_preferences_refresh_process();
    }
  }
  if ((BYTE9(xmmword_1EB1CF7F0) & 5) != 0 || (MEMORY[0xFFFFFC104] & 0x500) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    LOBYTE(v3) = 0;
    if (log && log != (os_log_t)&_os_log_disabled)
    {
      if (log[3].isa)
      {
        int isa = (int)log[6].isa;
        if (isa != dword_1EB1CF808)
        {
          int v6 = (int)log[6].isa;
          atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&log[6], (unsigned int *)&v6, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
          if (v6 == isa) {
            _os_log_preferences_refresh((uint64_t)log);
          }
        }
      }
      return (BYTE6(log[7].isa) >> 2) & 1;
    }
  }
  return v3;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  v23[1] = *MEMORY[0x1E4F14BF8];
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v4 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v22 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v22, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v22 == v4) {
      _os_log_preferences_refresh_process();
    }
  }
  if ((BYTE9(xmmword_1EB1CF7F0) & 1) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0) {
    return (os_log_t)&_os_log_disabled;
  }
  unsigned __int8 v5 = strlen(subsystem) + 1;
  size_t v6 = strlen(category);
  char v7 = v6 + 1;
  size_t v8 = (v6 + 1);
  size_t v9 = v5 + v8 + 4;
  MEMORY[0x1F41887A8](v6);
  unint64_t v11 = (char *)v23 - v10;
  bzero((char *)v23 - v10, v9);
  v23[0] = 0;
  v11[2] = v5;
  v11[3] = v7;
  strlcpy(v11 + 4, subsystem, v5);
  strlcpy(&v11[v5 + 4], category, v8);
  unint64_t v12 = _os_log_find((uint64_t)v11);
  if (v12) {
    return (os_log_t)v12;
  }
  os_unfair_lock_lock_with_options();
  os_log_t result = (os_log_t)_os_log_find((uint64_t)v11);
  if (result)
  {
    unint64_t v12 = (unint64_t)result;
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_1EB1CFB58);
    return (os_log_t)v12;
  }
  if ((MEMORY[0xFFFFFC104] & 0x80000000) != 0
    || (MEMORY[0xFFFFFC104] & 0x10000000) == 0
    || (unsigned __int16)os_log_create_subsystem_id < 0xFA0u)
  {
    unint64_t v12 = _os_object_alloc_realized();
    *(_DWORD *)(v12 + 8) = 0x7FFFFFFF;
    *(_DWORD *)(v12 + 12) = 0x7FFFFFFF;
    *(void *)(v12 + 56) = 0x45000000000000;
    _os_log_set_default_signpost_opts(category, v12 + 56);
    uint64_t metadata_buffer = voucher_activity_get_metadata_buffer();
    if (!metadata_buffer
      || (unint64_t v15 = v23[0] - 568,
          v23[0] -= 568,
          uint64_t v16 = *(unsigned __int16 *)(metadata_buffer + 4),
          unint64_t v17 = (v9 & 1) + v9 + v16,
          WORD1(v17))
      || v15 <= v17)
    {
      *(_DWORD *)(v12 + 60) |= 0x4000000u;
      while (1)
      {
        v20 = malloc_type_malloc(v9, 0x91D685AAuLL);
        if (v20) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }
      atomic_ullong v18 = v20;
      char v19 = 0;
    }
    else
    {
      atomic_ullong v18 = (_WORD *)(metadata_buffer + v16 + 568);
      *(_WORD *)(metadata_buffer + 4) = (v9 & 1) + v9 + v16;
      char v19 = 1;
    }
    memcpy(v18, v11, v9);
    *atomic_ullong v18 = atomic_fetch_add_explicit(&os_log_create_subsystem_id, 1u, memory_order_relaxed);
    *(void *)(v12 + 24) = v18;
    *(_DWORD *)(v12 + 48) = dword_1EB1CF808;
    atomic_ullong v21 = &_os_log_globals[os_simple_hash() & 0x3F];
    os_unfair_lock_assert_owner((const os_unfair_lock *)&dword_1EB1CFB58);
    ++dword_1EB1CFB5C;
    *(void *)(v12 + 16) = *v21;
    atomic_store(v12, v21);
    os_unfair_lock_unlock((os_unfair_lock_t)&dword_1EB1CFB58);
    if ((v19 & 1) == 0)
    {
      mach_continuous_time();
      voucher_activity_trace();
    }
    _os_log_preferences_refresh(v12);
    return (os_log_t)v12;
  }
  qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Too many os_log_t objects";
  qword_1E9450118 = (unsigned __int16)os_log_create_subsystem_id;
  __break(1u);
  return result;
}

int *_os_log_preferences_refresh(uint64_t a1)
{
  int v2 = *__error();
  if (a1)
  {
    uint64_t v3 = *(void *)(a1 + 24);
    if (v3)
    {
      int v4 = (char *)(v3 + 4);
      unsigned __int8 v5 = (char *)(v3 + *(unsigned __int8 *)(v3 + 2) + 4);
      uint64_t v15 = 0;
      if (qword_1EB1CF878)
      {
        xpc_object_t dictionary = xpc_dictionary_get_dictionary((xpc_object_t)qword_1EB1CF878, v4);
        os_unfair_lock_lock_with_options();
        if (dictionary)
        {
LABEL_17:
          _os_log_stream_filter_refresh(a1);
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_1EB1CF818);
          unint64_t v12 = _os_log_preferences_load(v4, v5);
          _os_log_preferences_compute(v12, v5, (uint64_t)&v15);
          if (v12) {
            xpc_release(v12);
          }
          goto LABEL_23;
        }
      }
      else
      {
        os_unfair_lock_lock_with_options();
      }
      if (byte_1EB1CF873) {
        goto LABEL_17;
      }
      if (dword_1EB1CF81C != dword_1EB1CF808) {
        _os_log_preference_load_cache();
      }
      if (!*((void *)&xmmword_1EB1CF820 + 1)) {
        goto LABEL_17;
      }
      record_by_name = (unsigned int *)_os_log_preferences_cache_find_record_by_name((unsigned int *)(*((void *)&xmmword_1EB1CF820 + 1) + 4), xmmword_1EB1CF820 - 4, v4);
      if (record_by_name)
      {
        size_t v8 = record_by_name;
        unsigned int v9 = record_by_name[1];
        if ((((_BYTE)v9 + 1) & 3) != 0) {
          uint64_t v10 = v9 - (((_BYTE)v9 + 1) & 3) + 5;
        }
        else {
          uint64_t v10 = v9 + 1;
        }
        uint64_t v11 = _os_log_preferences_cache_find_record_by_name((unsigned int *)((char *)record_by_name + v10 + 20), *record_by_name - v10 - 20, v5);
        if (v11)
        {
          uint64_t v15 = *(void *)(v11 + 12);
LABEL_22:
          _os_log_stream_filter_refresh(a1);
          os_unfair_lock_unlock((os_unfair_lock_t)&dword_1EB1CF818);
LABEL_23:
          HIDWORD(v15) = HIDWORD(v15) & 0x83FFFFFF | (((*(_DWORD *)(a1 + 60) >> 26) & 0x1F) << 26);
          *(void *)(a1 + 56) = v15;
          goto LABEL_24;
        }
        uint64_t v13 = *(void *)(v8 + 3);
      }
      else
      {
        uint64_t v13 = 0x45000000000000;
      }
      uint64_t v15 = v13;
      _os_log_set_default_signpost_opts(v5, (uint64_t)&v15);
      goto LABEL_22;
    }
  }
LABEL_24:
  os_log_t result = __error();
  *os_log_t result = v2;
  return result;
}

uint64_t _os_log_preferences_cache_find_record_by_name(unsigned int *a1, unint64_t a2, char *__s)
{
  int v6 = strlen(__s);
  int v7 = os_simple_hash();
  uint64_t v8 = 0;
  uint64_t v20 = 0;
  atomic_ullong v21 = &v20;
  uint64_t v22 = 0x2000000000;
  uint64_t v23 = 0;
  v13[0] = MEMORY[0x1E4F14BE8];
  v13[1] = 0x40000000;
  uint64_t v14 = ___os_log_preferences_cache_find_record_by_name_block_invoke;
  uint64_t v15 = &unk_1E59845D0;
  int v18 = v7;
  int v19 = v6;
  uint64_t v16 = &v20;
  unint64_t v17 = __s;
  if (a2 >= 0x14)
  {
    do
    {
      unint64_t v9 = *a1;
      if (a2 < v9) {
        break;
      }
      uint64_t v10 = a1[1];
      if (v10 + 21 > v9) {
        break;
      }
      if (*((unsigned char *)a1 + v10 + 20)) {
        break;
      }
      if (!((unsigned int (*)(void *, unsigned int *))v14)(v13, a1)) {
        break;
      }
      uint64_t v11 = *a1;
      a1 = (unsigned int *)((char *)a1 + v11);
      a2 -= v11;
    }
    while (a2 > 0x13);
    uint64_t v8 = v21[3];
  }
  _Block_object_dispose(&v20, 8);
  return v8;
}

BOOL ___os_log_preferences_cache_find_record_by_name_block_invoke(uint64_t a1, unsigned int *a2)
{
  if (a2[2] == *(_DWORD *)(a1 + 48))
  {
    size_t v4 = a2[1];
    if (v4 == *(_DWORD *)(a1 + 52) && !memcmp(a2 + 5, *(const void **)(a1 + 40), v4)) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    }
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
}

BOOL _os_log_stream_filter_refresh(BOOL result)
{
  uint64_t v1 = result;
  int v2 = (void *)qword_1EB1CF810;
  if (!qword_1EB1CF810) {
    goto LABEL_9;
  }
  uint64_t proc_path = _os_log_get_proc_path();
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = v5 + 4;
  if (!v5) {
    uint64_t v6 = 0;
  }
  v9[0] = v6;
  if (v5) {
    v5 += *(unsigned __int8 *)(v5 + 2) + 4;
  }
  v9[1] = v5;
  v9[2] = proc_path;
  v9[3] = v4;
  pid_t v10 = getpid();
  uid_t v11 = geteuid();
  v8[0] = 0;
  v8[1] = 0;
  os_log_t result = _os_log_matches_filter(v2, (uint64_t)v9, v8);
  if (result)
  {
    if ((v8[0] & 0x40000) != 0)
    {
      if ((v8[0] & 0x200000000) != 0)
      {
        unsigned int v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x18000000;
      }
      else if ((v8[0] & 0x100000000) != 0)
      {
        unsigned int v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x10000000;
      }
      else if ((v8[0] & 0x800000000) != 0)
      {
        unsigned int v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x8000000;
      }
      else
      {
        unsigned int v7 = *(_DWORD *)(v1 + 60);
      }
    }
    else
    {
      unsigned int v7 = *(_DWORD *)(v1 + 60) & 0xC7FFFFFF | 0x20000000;
    }
    *(_DWORD *)(v1 + 60) = v7 & 0xBFFFFFFF | (((LODWORD(v8[0]) >> 19) & 1) << 30);
  }
  else
  {
LABEL_9:
    *(_DWORD *)(v1 + 60) &= 0x87FFFFFF;
  }
  return result;
}

uint64_t _os_log_set_default_signpost_opts(const char *a1, uint64_t a2)
{
  uint64_t result = strcmp(a1, "DynamicTracing");
  if (result)
  {
    uint64_t result = strcmp(a1, "DynamicStackTracing");
    if (result) {
      return result;
    }
    unsigned int v5 = *(_DWORD *)(a2 + 4) & 0xFFCBFFFF | 0x100000;
  }
  else
  {
    unsigned int v5 = *(_DWORD *)(a2 + 4) & 0xFFFBFFFF;
  }
  *(_DWORD *)(a2 + 4) = v5;
  return result;
}

uint64_t _os_log_find(uint64_t a1)
{
  int v2 = (const void *)(a1 + 4);
  for (uint64_t i = _os_log_globals[os_simple_hash() & 0x3F]; i; uint64_t i = *(void *)(i + 16))
  {
    uint64_t v4 = *(void *)(i + 24);
    unsigned int v5 = *(unsigned __int16 *)(v4 + 2);
    if (v5 == *(unsigned __int16 *)(a1 + 2) && !memcmp((const void *)(v4 + 4), v2, (v5 >> 8) + v5)) {
      break;
    }
  }
  return i;
}

void _os_log_preferences_refresh_process()
{
  uint64_t v17 = *MEMORY[0x1E4F14BF8];
  if ((BYTE9(xmmword_1EB1CF7F0) & 1) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
  {
    int v0 = *__error();
    if (_os_trace_paths_init_once != -1) {
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
    }
    snprintf(__str, 0x400uLL, "%s/%s.plist", (const char *)_os_trace_preferences_path, "com.apple.diagnosticd.filter");
    uint64_t plist_at = _os_trace_read_plist_at(4294967294, __str);
    if (plist_at)
    {
      int v2 = (void *)plist_at;
      xpc_object_t dictionary = 0;
      xpc_object_t v11 = 0;
      uint64_t proc_path = _os_log_get_proc_path();
      uint64_t v13 = v3;
      pid_t v14 = getpid();
      uid_t v15 = geteuid();
      v9[0] = 0;
      v9[1] = 0;
      if (!_os_log_matches_filter(v2, (uint64_t)&dictionary, v9)) {
        v9[0] = 0;
      }
      int64_t int64 = xpc_dictionary_get_int64(v2, "global");
      v9[0] |= int64;
      HIDWORD(qword_1EB1CF860) = HIDWORD(v9[0]);
      *(_DWORD *)&byte_1EB1CF868 = WORD1(v9[0]);
      xpc_release(v2);
    }
    else
    {
      *(uint64_t *)((char *)&qword_1EB1CF860 + 4) = 0x70000000BLL;
    }
    if (qword_1EB1CF880)
    {
      xpc_object_t dictionary = 0;
      xpc_object_t v11 = 0;
      if (_os_trace_paths_init_once != -1) {
        dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
      }
      snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_system_preferences_path, "Processes", (const char *)qword_1EB1CF880);
      unsigned int v5 = (void *)_os_trace_read_plist_at(4294967294, __str);
      uint64_t v6 = v5;
      if (v5) {
        xpc_object_t dictionary = xpc_dictionary_get_dictionary(v5, "Level");
      }
      if (_os_trace_paths_init_once != -1) {
        dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
      }
      snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_preferences_path, "Processes", (const char *)qword_1EB1CF880);
      unsigned int v7 = (void *)_os_trace_read_plist_at(4294967294, __str);
      uint64_t v8 = v7;
      if (v7) {
        xpc_object_t v11 = xpc_dictionary_get_dictionary(v7, "Level");
      }
      process_prefs_0 = process_prefs_0 & 0xFC | _os_log_preference_option(&dictionary, "Enable") & 3;
      process_prefs_0 = process_prefs_0 & 0xE3 | (4 * _os_log_preference_option(&dictionary, "Persist"));
      if (v8) {
        xpc_release(v8);
      }
      if (v6) {
        xpc_release(v6);
      }
    }
    *__error() = v0;
  }
}

void *_os_log_preference_load_cache()
{
  uint64_t v4 = *MEMORY[0x1E4F14BF8];
  dword_1EB1CF81C = dword_1EB1CF808;
  int v0 = (vm_map_t *)MEMORY[0x1E4F14C48];
  if (*((void *)&xmmword_1EB1CF820 + 1)) {
    mach_vm_deallocate(*MEMORY[0x1E4F14C48], *((mach_vm_address_t *)&xmmword_1EB1CF820 + 1), xmmword_1EB1CF820);
  }
  logging_preferences = (_DWORD *)voucher_activity_get_logging_preferences();
  *((void *)&xmmword_1EB1CF820 + 1) = logging_preferences;
  if (logging_preferences && ((unint64_t)xmmword_1EB1CF820 < 4 || *logging_preferences != 6))
  {
    mach_vm_deallocate(*v0, (mach_vm_address_t)logging_preferences, xmmword_1EB1CF820);
    xmmword_1EB1CF820 = 0uLL;
  }
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
  }
  snprintf(__str, 0x400uLL, "%s/%s.plist", (const char *)_os_trace_preferences_path, "com.apple.diagnosticd.filter");
  if (qword_1EB1CF810)
  {
    xpc_release((xpc_object_t)qword_1EB1CF810);
    qword_1EB1CF810 = 0;
  }
  uint64_t result = _os_trace_read_plist_at(-2, __str);
  qword_1EB1CF810 = (uint64_t)result;
  return result;
}

void *_os_log_preferences_load(const char *a1, char *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F14BF8];
  base_sysprefs_file = _os_log_preferences_load_base_sysprefs_file(__str, a1, 1);
  if ((MEMORY[0xFFFFFC104] & 0x80000000) == 0 && (MEMORY[0xFFFFFC104] & 0x10000000) != 0)
  {
    if (_os_trace_paths_init_once != -1) {
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
    }
    snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_internal_preferences_path, "Subsystems", a1);
    uint64_t plist_at = _os_trace_read_plist_at(-2, __str);
  }
  else
  {
    uint64_t plist_at = 0;
  }
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
  }
  snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_preferences_path, "Subsystems", a1);
  uint64_t v6 = _os_trace_read_plist_at(-2, __str);
  if (qword_1EB1CF878)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary((xpc_object_t)qword_1EB1CF878, a1);
    if (dictionary)
    {
      xpc_object_t v8 = xpc_copy(dictionary);
      if (!v6) {
        goto LABEL_12;
      }
LABEL_16:
      if (v8)
      {
        _os_log_preferences_merge(v8, v6, a2);
        if (plist_at)
        {
LABEL_23:
          _os_log_preferences_merge(plist_at, v8, a2);
          unint64_t v9 = v8;
          goto LABEL_24;
        }
LABEL_18:
        unint64_t v9 = 0;
        if (base_sysprefs_file) {
          goto LABEL_25;
        }
        goto LABEL_19;
      }
      xpc_object_t v8 = v6;
LABEL_22:
      uint64_t v6 = 0;
      if (plist_at) {
        goto LABEL_23;
      }
      goto LABEL_18;
    }
  }
  xpc_object_t v8 = 0;
  if (v6) {
    goto LABEL_16;
  }
LABEL_12:
  if (v8) {
    goto LABEL_22;
  }
  if (!plist_at) {
    return base_sysprefs_file;
  }
  unint64_t v9 = 0;
  uint64_t v6 = 0;
LABEL_24:
  xpc_object_t v8 = plist_at;
  if (base_sysprefs_file)
  {
LABEL_25:
    _os_log_preferences_merge(base_sysprefs_file, v8, a2);
    xpc_release(v8);
    if (!v6) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_19:
  base_sysprefs_file = v8;
  if (v6) {
LABEL_26:
  }
    xpc_release(v6);
LABEL_27:
  if (v9) {
    xpc_release(v9);
  }
  return base_sysprefs_file;
}

void *_os_log_preferences_load_base_sysprefs_file(char *__str, const char *a2, int a3)
{
  if (!a3) {
    goto LABEL_9;
  }
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
  }
  snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_app_cryptex_system_preferences_path, "Subsystems", a2);
  uint64_t result = _os_trace_read_plist_at(-2, __str);
  if (!result)
  {
    if (_os_trace_paths_init_once != -1) {
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
    }
    snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_os_cryptex_system_preferences_path, "Subsystems", a2);
    uint64_t result = _os_trace_read_plist_at(-2, __str);
    if (!result)
    {
LABEL_9:
      if (_os_trace_paths_init_once != -1) {
        dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
      }
      snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_system_preferences_path, "Subsystems", a2);
      return _os_trace_read_plist_at(-2, __str);
    }
  }
  return result;
}

void *_os_trace_read_plist_at(int a1, const char *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F14BF8];
  int64_t v10 = 0;
  uint64_t v3 = _os_trace_read_file_at(a1, a2, 0x10000, &v10);
  if (!v3)
  {
    int v8 = *__error();
    if (v8 == 2 || !os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v12 = a2;
    __int16 v13 = 1024;
    int v14 = v8;
    uint64_t v6 = "failed to read %{public}s: %{darwin.errno}d";
    uint32_t v7 = 18;
    goto LABEL_12;
  }
  uint64_t v4 = (void *)v3;
  unsigned int v5 = (void *)xpc_create_from_plist();
  free(v4);
  if (!v5)
  {
LABEL_5:
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v12 = a2;
    uint64_t v6 = "invalid property list at %{public}s";
    uint32_t v7 = 12;
LABEL_12:
    _os_log_error_impl(&dword_19DC79000, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v6, buf, v7);
    return 0;
  }
  if (object_getClass(v5) != (Class)MEMORY[0x1E4F14D40])
  {
    xpc_release(v5);
    goto LABEL_5;
  }
  return v5;
}

uint64_t _os_trace_read_file_at(int a1, const char *a2, off_t a3, int64_t *a4)
{
  int v6 = openat(a1, a2, 16777476);
  if (v6 < 0)
  {
    int v10 = *__error();
    goto LABEL_21;
  }
  int v7 = v6;
  off_t v8 = lseek(v6, 0, 2);
  if (v8 < 0)
  {
    int v10 = *__error();
    goto LABEL_20;
  }
  int64_t v9 = v8;
  if (v8 > a3)
  {
    int v10 = 34;
    goto LABEL_20;
  }
  while (1)
  {
    xpc_object_t v11 = (char *)malloc_type_malloc(v9, 0x91D685AAuLL);
    if (v11) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  uint64_t v12 = v11;
  if (v9 < 1)
  {
LABEL_16:
    if (close(v7) == -1)
    {
      int v17 = *__error();
      uint64_t result = *__error();
      if (v17 == 9)
      {
LABEL_28:
        qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
        qword_1E9450118 = result;
        __break(1u);
        return result;
      }
      _os_assumes_log();
    }
    *a4 = v9;
    return (uint64_t)v12;
  }
  off_t v13 = 0;
  while (1)
  {
    ssize_t v14 = pread(v7, &v12[v13], v9 - v13, v13);
    if ((v14 & 0x8000000000000000) == 0) {
      break;
    }
    int v10 = *__error();
    if (v10 != 4) {
      goto LABEL_19;
    }
LABEL_15:
    if (v13 >= v9) {
      goto LABEL_16;
    }
  }
  if (v14)
  {
    v13 += v14;
    goto LABEL_15;
  }
  int v10 = 70;
LABEL_19:
  free(v12);
LABEL_20:
  if (close(v7) == -1)
  {
    int v16 = *__error();
    uint64_t result = *__error();
    if (v16 != 9)
    {
      _os_assumes_log();
      goto LABEL_21;
    }
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
    qword_1E9450118 = result;
    __break(1u);
    goto LABEL_28;
  }
LABEL_21:
  *a4 = 0;
  uint64_t v12 = 0;
  *__error() = v10;
  return (uint64_t)v12;
}

void _os_log_preferences_merge(void *a1, xpc_object_t xdict, char *a3)
{
  if (a3)
  {
    _os_log_preferences_merge_category(a1, xdict, "DEFAULT-OPTIONS");
    _os_log_preferences_merge_category(a1, xdict, a3);
  }
  else
  {
    v6[0] = MEMORY[0x1E4F14BE8];
    v6[1] = 0x40000000;
    v6[2] = ___os_log_preferences_merge_block_invoke;
    v6[3] = &__block_descriptor_tmp_221;
    v6[4] = a1;
    v6[5] = xdict;
    xpc_dictionary_apply(xdict, v6);
  }
}

int *_os_trace_prefs_and_mode_refresh_slow(int a1)
{
  int v1 = a1;
  uint64_t v13 = *MEMORY[0x1E4F14BF8];
  int check = 0;
  int out_token = a1;
  int v2 = *__error();
  __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW_APPROX);
  __uint64_t v4 = xmmword_1EB1CF7F0;
  while (v3 >= v4)
  {
    __uint64_t v5 = v4;
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)&xmmword_1EB1CF7F0, &v5, v3 + 1000000000, memory_order_relaxed, memory_order_relaxed);
    BOOL v6 = v5 == v4;
    __uint64_t v4 = v5;
    if (v6)
    {
      mach_port_name_t v7 = dword_1EB1CF800;
      memset(msg, 0, 108);
      while (!mach_msg(msg, 67109122, 0, 0x6Cu, v7, 0, 0))
        _os_trace_mig_server(108, msg);
      if (v1 != -2) {
        goto LABEL_14;
      }
      if (!notify_register_check("com.apple.system.logging.prefschanged", &out_token))
      {
        int v1 = out_token;
        int v8 = -2;
        atomic_compare_exchange_strong_explicit(&dword_1EB1CF804, (unsigned int *)&v8, out_token, memory_order_relaxed, memory_order_relaxed);
        if (v8 != -2)
        {
          notify_cancel(v1);
          int out_token = v8;
          int v1 = v8;
        }
        if ((v1 & 0x80000000) == 0)
        {
LABEL_14:
          if (!notify_check(v1, &check) && check) {
            atomic_fetch_add_explicit(&dword_1EB1CF808, 1u, memory_order_relaxed);
          }
        }
      }
      break;
    }
  }
  if ((byte_1EB1CF86C & 1) == 0)
  {
    if (_dispatch_is_multithreaded())
    {
      __swp(&byte_1EB1CF86C, (unsigned int *)&byte_1EB1CF86C);
      if ((&byte_1EB1CF86C & 1) == 0) {
        _os_log_watch_for_prefchanges();
      }
    }
  }
  uint64_t result = __error();
  *uint64_t result = v2;
  return result;
}

void _os_log_watch_for_prefchanges()
{
  int out_token = 0;
  int v0 = dispatch_queue_create_with_target_V2("com.apple.os.log.notify", 0, 0);
  uint32_t v1 = notify_register_dispatch("com.apple.system.logging.prefschanged", &out_token, v0, &__block_literal_global_287);
  dispatch_release(v0);
  if (!v1)
  {
    __swp(v2, (unsigned int *)&dword_1EB1CF804);
    int out_token = v2;
    if ((v2 & 0x80000000) == 0)
    {
      int check = 0;
      if (notify_check(v2, &check)) {
        BOOL v3 = 1;
      }
      else {
        BOOL v3 = check == 0;
      }
      if (!v3) {
        atomic_fetch_add_explicit(&dword_1EB1CF808, 1u, memory_order_relaxed);
      }
      notify_cancel(out_token);
    }
  }
}

uint64_t _os_log_get_proc_path()
{
  uint64_t v0 = xmmword_1EB1CF830;
  if ((void)xmmword_1EB1CF830) {
    strrchr((char *)xmmword_1EB1CF830, 47);
  }
  else {
    _os_assumes_log();
  }
  return v0;
}

void _os_trace_image_was_loaded(_DWORD *a1)
{
  if (off_1EB1CF7E8
    && (_os_trace_dsc_load_addr > (unint64_t)a1
     || _os_trace_dsc_size + _os_trace_dsc_load_addr <= (unint64_t)a1))
  {
    _os_trace_dylib_or_main_executable_was_loaded(a1);
  }
}

uint64_t _os_log_pack_size(uint64_t a1)
{
  return a1 + 72;
}

void *_os_trace_calloc(size_t count, size_t size)
{
  while (1)
  {
    uint64_t result = malloc_type_calloc(count, size, 0x478C0A82uLL);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  _os_log((uint64_t)dso, (uint64_t)log, type, (uint64_t)format, (uint64_t)buf, *(uint64_t *)&size, v6);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  _os_log(dso, log, type, format, buf, *(void *)&size, v6, 0);
}

void _os_log(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = 0;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v9 = a1;
  uint64_t v10 = a7;
  uint64_t v11 = a4;
  long long v12 = 0uLL;
  __error();
  _os_log_impl_flatten_and_send((uint64_t)&v7);
}

xpc_object_t _os_log_preferences_compute(void *a1, const char *a2, uint64_t a3)
{
  xpc_object_t v52 = 0;
  xpc_object_t v53 = 0;
  xpc_object_t v50 = 0;
  xpc_object_t v51 = 0;
  xpc_object_t v48 = 0;
  xpc_object_t v49 = 0;
  if (a1)
  {
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "DEFAULT-OPTIONS");
    xpc_object_t v52 = dictionary;
    if (dictionary)
    {
      long long v7 = dictionary;
      xpc_object_t v48 = xpc_dictionary_get_dictionary(dictionary, "Level");
      xpc_object_t v50 = xpc_dictionary_get_dictionary(v7, "TTL");
    }
    if (a2)
    {
      xpc_object_t v8 = xpc_dictionary_get_dictionary(a1, a2);
      xpc_object_t v53 = v8;
      if (v8)
      {
        uint64_t v9 = v8;
        xpc_object_t v49 = xpc_dictionary_get_dictionary(v8, "Level");
        xpc_object_t v51 = xpc_dictionary_get_dictionary(v9, "TTL");
      }
    }
  }
  unsigned __int8 v10 = _os_log_preference_option_ttl((uint64_t)&v50, "Default");
  unsigned __int8 v11 = _os_log_preference_option_ttl((uint64_t)&v50, "Info");
  unsigned __int8 v12 = _os_log_preference_option_ttl((uint64_t)&v50, "Debug");
  char v45 = _os_log_preference_option(&v48, "Enable");
  char v44 = _os_log_preference_option(&v48, "Persist");
  uint64_t v13 = (objc_class *)MEMORY[0x1E4F14D20];
  xpc_object_t v43 = _os_log_preference_value((uint64_t)&v52, "Symptoms", MEMORY[0x1E4F14D20]);
  xpc_object_t v42 = _os_log_preference_value((uint64_t)&v52, "Enable-Oversize-Messages", v13);
  xpc_object_t v14 = _os_log_preference_value((uint64_t)&v52, "Default-Privacy-Setting", MEMORY[0x1E4F14D78]);
  unsigned __int8 v46 = v12;
  if (!v14) {
    goto LABEL_11;
  }
  string_ptr = xpc_string_get_string_ptr(v14);
  if (!strcasecmp(string_ptr, "Sensitive"))
  {
    int v16 = 6144;
  }
  else if (!strcasecmp(string_ptr, "Private"))
  {
    int v16 = 4096;
  }
  else
  {
    if (strcasecmp(string_ptr, "Public"))
    {
LABEL_11:
      int v41 = 0;
      goto LABEL_16;
    }
    int v16 = 2048;
  }
  int v41 = v16;
LABEL_16:
  xpc_object_t v17 = _os_log_preference_value((uint64_t)&v52, "Privacy-Enable-Level", MEMORY[0x1E4F14D78]);
  xpc_object_t v18 = (xpc_object_t)MEMORY[0x1E4F14CF0];
  if (!v17)
  {
LABEL_20:
    int v20 = (_os_log_preference_value((uint64_t)&v52, "Enable-Private-Data", MEMORY[0x1E4F14D20]) == v18) << 14;
    goto LABEL_24;
  }
  int v19 = xpc_string_get_string_ptr(v17);
  if (!strcasecmp(v19, "Sensitive"))
  {
    int v20 = 24576;
  }
  else if (!strcasecmp(v19, "Private"))
  {
    int v20 = 0x4000;
  }
  else
  {
    if (strcasecmp(v19, "Public")) {
      goto LABEL_20;
    }
    int v20 = 0x2000;
  }
LABEL_24:
  int v40 = v20;
  xpc_object_t v21 = _os_log_preference_value((uint64_t)&v52, "Signpost-Scope", MEMORY[0x1E4F14D78]);
  if (!v21)
  {
LABEL_28:
    int v23 = 0x10000;
    goto LABEL_31;
  }
  uint64_t v22 = xpc_string_get_string_ptr(v21);
  if (!strcasecmp(v22, "Thread"))
  {
    int v23 = 0x8000;
  }
  else
  {
    if (!strcasecmp(v22, "Process") || strcasecmp(v22, "System")) {
      goto LABEL_28;
    }
    int v23 = 98304;
  }
LABEL_31:
  unint64_t v24 = (objc_class *)MEMORY[0x1E4F14D20];
  xpc_object_t v25 = _os_log_preference_value((uint64_t)&v52, "Supports-Signpost-Introspection", MEMORY[0x1E4F14D20]);
  xpc_object_t v26 = _os_log_preference_value((uint64_t)&v52, "Signpost-Enabled", v24);
  unsigned __int8 v47 = v10;
  if (v26)
  {
    if (v26 == v18)
    {
LABEL_36:
      int v27 = 0x40000;
      goto LABEL_38;
    }
  }
  else if (strcmp(a2, "DynamicTracing") && strcmp(a2, "DynamicStackTracing"))
  {
    goto LABEL_36;
  }
  int v27 = 0;
LABEL_38:
  unint64_t v28 = (objc_class *)MEMORY[0x1E4F14D20];
  xpc_object_t v29 = _os_log_preference_value((uint64_t)&v52, "Signpost-Persisted", MEMORY[0x1E4F14D20]);
  xpc_object_t v30 = _os_log_preference_value((uint64_t)&v52, "Signpost-Backtraces-Enabled", v28);
  if (v30)
  {
    if (v30 == v18) {
      int v31 = 1;
    }
    else {
      int v31 = 2;
    }
  }
  else
  {
    int v31 = strcmp(a2, "DynamicStackTracing") == 0;
  }
  xpc_object_t v32 = _os_log_preference_value((uint64_t)&v52, "Signpost-Allow-Streaming", v28);
  xpc_object_t v33 = _os_log_preference_value((uint64_t)&v52, "Enable-Fault-Crashlogs", v28);
  if (v33 == v18)
  {
LABEL_50:
    int v36 = 0x1000000;
    goto LABEL_51;
  }
  if (v33 == (xpc_object_t)MEMORY[0x1E4F14CE8]) {
    goto LABEL_49;
  }
  xpc_object_t v34 = _os_log_preference_value((uint64_t)&v52, "Enable-Fault-Crashlogs", MEMORY[0x1E4F14D78]);
  if (!v34) {
    goto LABEL_49;
  }
  uint64_t v35 = xpc_string_get_string_ptr(v34);
  if (strcasecmp(v35, "Once"))
  {
    if (!strcasecmp(v35, "None") || strcasecmp(v35, "Always"))
    {
LABEL_49:
      int v36 = 0;
      goto LABEL_51;
    }
    goto LABEL_50;
  }
  int v36 = 0x800000;
LABEL_51:
  if (v32 == v18 || v32 == 0) {
    int v38 = 0x400000;
  }
  else {
    int v38 = 0;
  }
  xpc_object_t result = _os_log_preference_value((uint64_t)&v52, "Enable-Fault-Crashlog-Excerpts", MEMORY[0x1E4F14D20]);
  *(unsigned char *)a3 = 0;
  *(unsigned char *)(a3 + 1) = v47;
  *(unsigned char *)(a3 + 2) = v11;
  *(unsigned char *)(a3 + 3) = v46;
  *(_DWORD *)(a3 + 4) = (v45 | (8 * v44)) | ((v43 == v18) << 9) | ((v42 == v18) << 10) | v41 | v40 | v23 | ((v25 == v18) << 17) | v27 | ((v29 == v18) << 19) | (v31 << 20) | v38 | v36 | ((result == v18) << 25);
  return result;
}

xpc_object_t _os_log_preference_value(uint64_t a1, char *key, objc_class *a3)
{
  uint64_t v6 = *(void **)(a1 + 8);
  if (!v6 || (v7 = xpc_dictionary_get_value(v6, key)) == 0 || (xpc_object_t v8 = v7, object_getClass(v7) != a3))
  {
    if (*(void *)a1 && (xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)a1, key)) != 0)
    {
      xpc_object_t v10 = value;
      if (object_getClass(value) == a3) {
        return v10;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

uint64_t _os_log_fmt_flatten_object_impl(unsigned char *a1, unsigned int a2, uint64_t a3, void *a4, size_t a5, uint64_t a6, uint64_t a7, size_t a8, char a9)
{
  uint64_t v43 = *MEMORY[0x1E4F14BF8];
  char v39 = a9;
  uint64_t Name = [a4 isProxy];
  if (Name)
  {
LABEL_2:
    size_t v18 = a5;
    if (a8 >= 0x400)
    {
      while (1)
      {
        uint64_t v22 = (char *)malloc_type_malloc(a8, 0x91D685AAuLL);
        if (v22) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }
      int v20 = v22;
      int v19 = _os_log_fmt_flatten_NSCF(a4, v22, a8, &v39);
    }
    else
    {
      MEMORY[0x1F41887A8](Name);
      bzero(&v38[-((a8 + 15) & 0xFFFFFFFFFFFFFFF0)], a8);
      int v19 = _os_log_fmt_flatten_NSCF(a4, &v38[-((a8 + 15) & 0xFFFFFFFFFFFFFFF0)], a8, &v39);
      int v20 = 0;
    }
    goto LABEL_68;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    __stringp = out;
    if (object_isClass(a4))
    {
      uint64_t Name = (uint64_t)class_getName((Class)a4);
      goto LABEL_13;
    }
    if ([a4 isNSString])
    {
      int v24 = [a4 isNSCFConstantString] ^ 1;
      uint64_t Name = [a4 _fastCStringContents:1];
      char v23 = v24;
      int v19 = (const char *)Name;
      if (!Name) {
        goto LABEL_2;
      }
      goto LABEL_67;
    }
    if ([a4 isNSNumber])
    {
      xpc_object_t v25 = (unsigned char *)[a4 objCType];
      char v23 = 0;
      int v26 = (char)*v25;
      int v19 = "<NSNumber: invalid type>";
      if (v26 > 80)
      {
        switch(*v25)
        {
          case 'c':
            goto LABEL_45;
          case 'd':
            [a4 doubleValue];
            unint64_t v28 = "%0.16g";
            goto LABEL_54;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            goto LABEL_67;
          case 'f':
            [a4 floatValue];
            double v27 = v33;
            unint64_t v28 = "%0.7g";
            goto LABEL_54;
          case 'i':
            *(double *)&uint64_t v31 = COERCE_DOUBLE([a4 intValue]);
            unint64_t v28 = "%d";
            goto LABEL_65;
          case 'l':
            *(double *)&uint64_t v31 = COERCE_DOUBLE([a4 longValue]);
            unint64_t v28 = "%ld";
            goto LABEL_65;
          case 'q':
            *(double *)&uint64_t v31 = COERCE_DOUBLE([a4 longLongValue]);
            goto LABEL_62;
          case 's':
            *(void *)&double v30 = (int)[a4 shortValue];
            unint64_t v28 = "%hi";
            break;
          default:
            if (v26 == 81)
            {
              *(double *)&uint64_t v31 = COERCE_DOUBLE([a4 unsignedLongLongValue]);
              goto LABEL_64;
            }
            if (v26 != 83) {
              goto LABEL_67;
            }
            *(void *)&double v30 = [a4 unsignedShortValue];
            unint64_t v28 = "%hu";
            break;
        }
LABEL_59:
        double v37 = v30;
        goto LABEL_66;
      }
      if (v26 <= 72)
      {
        if (v26 == 66)
        {
LABEL_45:
          *(void *)&double v30 = (int)[a4 charValue];
          unint64_t v28 = "%d";
        }
        else
        {
          if (v26 != 67) {
            goto LABEL_67;
          }
          *(void *)&double v30 = [a4 unsignedCharValue];
          unint64_t v28 = "%u";
        }
        goto LABEL_59;
      }
      if (v26 == 73)
      {
        *(double *)&uint64_t v31 = COERCE_DOUBLE([a4 unsignedIntValue]);
        unint64_t v28 = "%u";
      }
      else
      {
        if (v26 != 76) {
          goto LABEL_67;
        }
        *(double *)&uint64_t v31 = COERCE_DOUBLE([a4 unsignedLongValue]);
        unint64_t v28 = "%lu";
      }
    }
    else
    {
      if ([a4 isNSDate])
      {
        [a4 timeIntervalSince1970];
        time_t v40 = (uint64_t)v29;
        uint64_t Name = (uint64_t)ctime_r(&v40, out);
        if (!Name)
        {
          int v19 = 0;
LABEL_14:
          char v23 = 0;
          if (!v19) {
            goto LABEL_2;
          }
          goto LABEL_67;
        }
        uint64_t Name = (uint64_t)strsep(&__stringp, "\n\r");
LABEL_13:
        int v19 = (const char *)Name;
        goto LABEL_14;
      }
      objc_opt_class();
      uint64_t Name = objc_opt_isKindOfClass();
      if ((Name & 1) == 0) {
        goto LABEL_2;
      }
      uint64_t Name = (uint64_t)object_getClass(a4);
      if (Name == MEMORY[0x1E4F14D78])
      {
        uint64_t Name = (uint64_t)xpc_string_get_string_ptr(a4);
        int v19 = (const char *)Name;
        char v23 = 1;
        if (!Name) {
          goto LABEL_2;
        }
LABEL_67:
        size_t v18 = a5;
        int v20 = 0;
        char v39 = v23;
LABEL_68:
        if ((*a1 & 7) == 0 && v39 != 0) {
          *a1 |= 1u;
        }
        uint64_t v35 = _os_log_fmt_flatten_to_blob((uint64_t)a1, a2, a3, a4, v18, a6, a7, a8, (unint64_t)v19, 0);
        free(v20);
        return v35;
      }
      if (Name == MEMORY[0x1E4F14D88])
      {
        bytes = xpc_uuid_get_bytes(a4);
        int v19 = out;
        uuid_unparse_upper(bytes, out);
        char v23 = 1;
        goto LABEL_67;
      }
      if (Name == MEMORY[0x1E4F14D68])
      {
        *(double *)&uint64_t v31 = COERCE_DOUBLE(xpc_int64_get_value(a4));
LABEL_62:
        unint64_t v28 = "%lld";
      }
      else
      {
        if (Name != MEMORY[0x1E4F14D80])
        {
          if (Name != MEMORY[0x1E4F14D48])
          {
            if (Name == MEMORY[0x1E4F14D20])
            {
              BOOL value = xpc_BOOL_get_value(a4);
              char v23 = 0;
              if (value) {
                int v19 = "true";
              }
              else {
                int v19 = "false";
              }
              goto LABEL_67;
            }
            if (Name == MEMORY[0x1E4F14D70])
            {
              char v23 = 0;
              int v19 = "(null)";
              goto LABEL_67;
            }
            if (Name != MEMORY[0x1E4F14D58])
            {
              if (Name == MEMORY[0x1E4F14D38]) {
                goto LABEL_2;
              }
              char v23 = 0;
              int v19 = "<xpc object>";
              goto LABEL_67;
            }
            uint64_t Name = (uint64_t)xpc_dictionary_get_string(a4, (const char *)*MEMORY[0x1E4F14D08]);
            goto LABEL_13;
          }
          double v27 = xpc_double_get_value(a4);
          unint64_t v28 = "%f";
LABEL_54:
          double v37 = v27;
LABEL_66:
          int v19 = out;
          __sprintf_chk(out, 0, 0x40uLL, v28, *(void *)&v37);
          char v23 = 0;
          goto LABEL_67;
        }
        *(double *)&uint64_t v31 = COERCE_DOUBLE(xpc_uint64_get_value(a4));
LABEL_64:
        unint64_t v28 = "%llu";
      }
    }
LABEL_65:
    double v37 = *(double *)&v31;
    goto LABEL_66;
  }

  return _os_log_fmt_flatten_coder((uint64_t)a1, a4, a8, a2, a3, a6, a7);
}

uint64_t _os_log_fmt_flatten_to_blob(uint64_t a1, unsigned int a2, uint64_t a3, void *a4, size_t a5, uint64_t a6, uint64_t a7, size_t a8, unint64_t a9, unint64_t a10)
{
  uint64_t v26 = *MEMORY[0x1E4F14BF8];
  BOOL v24 = 0;
  if (privacy_flags2opt[*(unsigned char *)a1 & 7] <= a2 || (*(unsigned char *)a1 & 0xF0) == 0x80)
  {
    if (*(unsigned char *)a1) {
      uint64_t v18 = a7;
    }
    else {
      uint64_t v18 = a6;
    }
    int v15 = *(_DWORD *)(v18 + 8);
    unsigned __int16 v17 = _os_log_fmt_flatten_data_into_blob(v18, a9, a10, a4, a5, a8, &v24);
  }
  else
  {
    if (!a3) {
      return 0;
    }
    uint64_t v23 = 0x1000000010000;
    xpc_object_t v21 = &v25;
    uint64_t v22 = 0x36200000000;
    _os_log_fmt_flatten_data_into_blob((uint64_t)&v21, a9, a10, a4, a5, 0x10000uLL, &v24);
    int v15 = *(_DWORD *)(a6 + 8);
    int v16 = v21;
    unsigned __int16 v17 = _os_log_fmt_flatten_masked_data((unsigned char *)a1, a2, a3, a6, v21, v22, a8, &v24);
    if ((v23 & 0x100000000) != 0) {
      free(v16);
    }
  }
  __int16 v19 = v17 & 0x7FFF | (v24 << 15);
  *(_WORD *)(a1 + 2) = v15;
  *(_WORD *)(a1 + 4) = v19;
  return v17;
}

size_t _os_log_fmt_flatten_data_into_blob(uint64_t a1, unint64_t __src, unint64_t a3, void *a4, size_t __n, size_t a6, BOOL *a7)
{
  size_t v8 = __n;
  uint64_t v9 = (_DWORD *)a3;
  uint64_t v11 = a1;
  *a7 = 0;
  if (__src && a6)
  {
    double v37 = 0;
    if (__n + 1 < a6) {
      size_t v12 = __n + 1;
    }
    else {
      size_t v12 = a6;
    }
    if (!__n) {
      size_t v12 = a6;
    }
    int v13 = os_trace_blob_addns(a1, (unsigned char *)__src, v12 - 1, &v37);
    char v39 = 0;
    if ((*(_WORD *)(v11 + 20) & 2) == 0)
    {
      uint64_t v14 = *(unsigned int *)(v11 + 8);
      if (*(char *)(v11 + 22) + *(_DWORD *)(v11 + 12) - 1 == v14)
      {
        os_trace_blob_add_slow(v11, &v39, 1uLL);
      }
      else
      {
        *(unsigned char *)(*(void *)v11 + v14) = 0;
        unsigned int v15 = *(_DWORD *)(v11 + 8) + 1;
        *(_DWORD *)(v11 + 8) = v15;
        if (!*(unsigned char *)(v11 + 22)) {
          *(unsigned char *)(*(void *)v11 + v15) = 0;
        }
      }
    }
    BOOL v16 = (!v8 || (unint64_t)v37 < __src + v8) && *v37 != 0;
    *a7 = v16;
    return (v13 + 1);
  }
  if (a3 && a6)
  {
    size_t v17 = a6 - 1;
    int v18 = *(_DWORD *)(a1 + 8);
    if (!*(unsigned char *)(a1 + 22)) {
      ++v18;
    }
    int v19 = *(_DWORD *)(a1 + 16);
    if (v19)
    {
      size_t v20 = (v19 - v18);
    }
    else
    {
      int v23 = *(_DWORD *)(a1 + 12);
      LODWORD(v20) = v23 - v18;
      if (v23) {
        size_t v20 = v20;
      }
      else {
        size_t v20 = 0;
      }
    }
    if (v17 > v20) {
      size_t v17 = v20;
    }
    unsigned int v24 = *(_DWORD *)a3;
    if (*(_DWORD *)a3)
    {
      uint64_t v25 = 0;
      do
      {
        if (v24 >= 0x80)
        {
          if (v24 >= 0x800)
          {
            if (HIWORD(v24))
            {
              if (HIWORD(v24) > 0x10u) {
                break;
              }
              char v27 = -16;
              size_t v26 = 4;
            }
            else
            {
              if (v24 >> 11 == 27) {
                break;
              }
              char v27 = -32;
              size_t v26 = 3;
            }
          }
          else
          {
            char v27 = -64;
            size_t v26 = 2;
          }
          size_t v28 = v26 - 1;
          do
          {
            __srca[v28] = v24 & 0x3F | 0x80;
            unsigned int v24 = (int)v24 >> 6;
            --v28;
          }
          while (v28);
          LOBYTE(v24) = v24 | v27;
        }
        else
        {
          size_t v26 = 1;
        }
        __srca[0] = v24;
        if (v26 + v25 > v17 || (*(_WORD *)(v11 + 20) & 2) != 0) {
          break;
        }
        uint64_t v29 = *(unsigned int *)(v11 + 8);
        if (v26 > (*(char *)(v11 + 22) + *(_DWORD *)(v11 + 12) - v29 - 1))
        {
          LODWORD(v26) = os_trace_blob_add_slow(v11, __srca, v26);
          if (!v26) {
            break;
          }
        }
        else
        {
          memcpy((void *)(*(void *)v11 + v29), __srca, v26);
          unsigned int v30 = *(_DWORD *)(v11 + 8) + v26;
          *(_DWORD *)(v11 + 8) = v30;
          if (!*(unsigned char *)(v11 + 22)) {
            *(unsigned char *)(*(void *)v11 + v30) = 0;
          }
        }
        v25 += v26;
        unsigned int v31 = v9[1];
        ++v9;
        unsigned int v24 = v31;
      }
      while (v31);
    }
    else
    {
      LODWORD(v25) = 0;
    }
    size_t v8 = (v25 + 1);
    __int16 v32 = *(_WORD *)(v11 + 20);
    *a7 = *v9 != 0;
    char v38 = 0;
    if ((v32 & 2) == 0)
    {
      uint64_t v33 = *(unsigned int *)(v11 + 8);
      if (*(char *)(v11 + 22) + *(_DWORD *)(v11 + 12) - 1 != v33)
      {
        *(unsigned char *)(*(void *)v11 + v33) = 0;
        unsigned int v22 = *(_DWORD *)(v11 + 8) + 1;
LABEL_62:
        *(_DWORD *)(v11 + 8) = v22;
        if (!*(unsigned char *)(v11 + 22)) {
          *(unsigned char *)(*(void *)v11 + v22) = 0;
        }
        return v8;
      }
      uint64_t v35 = &v38;
      a1 = v11;
      size_t v36 = 1;
      goto LABEL_68;
    }
  }
  else
  {
    if (__src | a3)
    {
      size_t v8 = 0;
      *a7 = 1;
      return v8;
    }
    if (__n > a6)
    {
      *a7 = 1;
      size_t v8 = a6;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v21 = *(unsigned int *)(a1 + 8);
      if (v8 <= (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v21 - 1))
      {
        memcpy((void *)(*(void *)a1 + v21), a4, v8);
        unsigned int v22 = *(_DWORD *)(v11 + 8) + v8;
        goto LABEL_62;
      }
      uint64_t v35 = (char *)a4;
      size_t v36 = v8;
LABEL_68:
      os_trace_blob_add_slow(a1, v35, v36);
    }
  }
  return v8;
}

unint64_t os_trace_blob_addns(uint64_t a1, unsigned char *__src, unint64_t a3, void *a4)
{
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0;
  }
  unint64_t v5 = a3;
  uint64_t v6 = __src;
  int v8 = *(_DWORD *)(a1 + 8);
  if (!*(unsigned char *)(a1 + 22)) {
    ++v8;
  }
  int v9 = *(_DWORD *)(a1 + 16);
  if (v9)
  {
    unint64_t v10 = (v9 - v8);
  }
  else
  {
    int v11 = *(_DWORD *)(a1 + 12);
    LODWORD(v10) = v11 - v8;
    if (v11) {
      unint64_t v10 = v10;
    }
    else {
      unint64_t v10 = 0;
    }
  }
  if (v10 < a3) {
    unint64_t v5 = v10;
  }
  if (!*__src)
  {
    unint64_t v19 = 0;
LABEL_76:
    if (a4) {
      goto LABEL_77;
    }
    return v19;
  }
  unint64_t v12 = 0;
  uint64_t v13 = MEMORY[0x1E4F14BF0];
  while (1)
  {
    size_t v14 = 0;
    size_t v15 = v5 - v12;
    if (v5 != v12)
    {
      while ((char)v6[v14] >= 1 && (*(_DWORD *)(v13 + 4 * v6[v14] + 60) & 0x4200) != 0x200)
      {
        if (v15 == ++v14)
        {
          size_t v14 = v5 - v12;
          break;
        }
      }
    }
    if (v14 >= v15) {
      size_t v16 = v5 - v12;
    }
    else {
      size_t v16 = v14;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v17 = *(unsigned int *)(a1 + 8);
      if (v16 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v17 - 1))
      {
        os_trace_blob_add_slow(a1, v6, v16);
      }
      else
      {
        memcpy((void *)(*(void *)a1 + v17), v6, v16);
        unsigned int v18 = *(_DWORD *)(a1 + 8) + v16;
        *(_DWORD *)(a1 + 8) = v18;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v18) = 0;
        }
      }
    }
    v6 += v16;
    unint64_t v19 = v16 + v12;
    if (v5 == v19) {
      break;
    }
    int v20 = *v6;
    if (!*v6) {
      goto LABEL_76;
    }
    if ((v20 & 0x80) == 0)
    {
      unint64_t v12 = v19 + 3;
      if (v19 + 3 > v5) {
        goto LABEL_76;
      }
      if (v20 == 127) {
        char v21 = 63;
      }
      else {
        char v21 = v20 + 64;
      }
      __int16 v40 = 24156;
      char v41 = v21;
      if ((*(unsigned char *)(a1 + 20) & 2) != 0) {
        goto LABEL_65;
      }
      uint64_t v22 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v22 - 1) <= 2)
      {
        p_srca = &v40;
        uint64_t v35 = a1;
        size_t v36 = 3;
        goto LABEL_74;
      }
      uint64_t v23 = *(void *)a1 + v22;
      *(_WORD *)uint64_t v23 = v40;
      *(unsigned char *)(v23 + 2) = v41;
      unsigned int v24 = *(_DWORD *)(a1 + 8) + 3;
      goto LABEL_63;
    }
    if ((v20 & 0xF8) == 0xF0)
    {
      size_t v25 = 4;
    }
    else if ((v20 & 0xF0) == 0xE0)
    {
      size_t v25 = 3;
    }
    else
    {
      if ((v20 & 0xE0) != 0xC0) {
        goto LABEL_51;
      }
      size_t v25 = 2;
    }
    if (v25 > v5 - v19) {
      goto LABEL_76;
    }
    uint64_t v26 = 1;
    while ((v6[v26] & 0xC0) == 0x80)
    {
      if (v25 == ++v26)
      {
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v27 = *(unsigned int *)(a1 + 8);
          if (v25 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
          {
            os_trace_blob_add_slow(a1, v6, v25);
          }
          else
          {
            memcpy((void *)(*(void *)a1 + v27), v6, v25);
            unsigned int v28 = *(_DWORD *)(a1 + 8) + v25;
            *(_DWORD *)(a1 + 8) = v28;
            if (!*(unsigned char *)(a1 + 22)) {
              *(unsigned char *)(*(void *)a1 + v28) = 0;
            }
          }
        }
        v6 += v25;
        unint64_t v12 = v25 + v19;
        if (v12 != v5) {
          goto LABEL_66;
        }
        goto LABEL_79;
      }
    }
LABEL_51:
    unint64_t v12 = v19 + 4;
    if (v19 + 4 > v5) {
      goto LABEL_76;
    }
    uint64_t v29 = v20 & 0x7F;
    if ((*(_DWORD *)(v13 + 4 * v29 + 60) & 0x200) == 0)
    {
      qmemcpy(&v38, "\\M-", 3);
      HIBYTE(v38) = v29;
      if ((*(unsigned char *)(a1 + 20) & 2) != 0) {
        goto LABEL_65;
      }
      uint64_t v30 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 3)
      {
        p_srca = (__int16 *)&v38;
        goto LABEL_73;
      }
      uint64_t v31 = *(void *)a1;
      int v32 = v38;
      goto LABEL_62;
    }
    if (v29 == 127) {
      char v33 = 63;
    }
    else {
      char v33 = v29 + 64;
    }
    qmemcpy(&__srca, "\\M^", 3);
    HIBYTE(__srca) = v33;
    if ((*(unsigned char *)(a1 + 20) & 2) == 0)
    {
      uint64_t v30 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 3)
      {
        p_srca = (__int16 *)&__srca;
LABEL_73:
        uint64_t v35 = a1;
        size_t v36 = 4;
LABEL_74:
        os_trace_blob_add_slow(v35, p_srca, v36);
        goto LABEL_65;
      }
      uint64_t v31 = *(void *)a1;
      int v32 = __srca;
LABEL_62:
      *(_DWORD *)(v31 + v30) = v32;
      unsigned int v24 = *(_DWORD *)(a1 + 8) + 4;
LABEL_63:
      *(_DWORD *)(a1 + 8) = v24;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v24) = 0;
      }
    }
LABEL_65:
    ++v6;
LABEL_66:
    unint64_t v19 = v12;
    if (!*v6) {
      goto LABEL_76;
    }
  }
LABEL_79:
  unint64_t v19 = v5;
  if (!a4) {
    return v19;
  }
LABEL_77:
  *a4 = v6;
  return v19;
}

void _os_log_impl_flatten_and_send(uint64_t a1)
{
  uint64_t v10 = MEMORY[0x1F41887A8](a1);
  uint64_t v285 = *MEMORY[0x1E4F14BF8];
  uint64_t v251 = 0x1000000000000;
  uint64_t v248 = 0x1000000000000;
  v249 = &v274;
  uint64_t v250 = 0x40000000000;
  uint64_t v245 = 0x1000000000000;
  v246 = &v273;
  uint64_t v247 = 0x40000000000;
  v243 = &v272;
  *(void *)v244 = 0x40000000000;
  if (!v14)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_520:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_521:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_522;
  }
  LODWORD(v17) = v15;
  if (v15 <= 1) {
    goto LABEL_520;
  }
  uint64_t v18 = v16;
  unsigned int v2 = v14;
  LODWORD(v7) = v13;
  unsigned int v3 = v12;
  uint64_t v4 = v11;
  uint64_t v6 = v10;
  if ((v13 & 0x200000) != 0 || _os_get_logging_unreliable_for_current_thread() == 1)
  {
    *v2 |= 0x10u;
    LODWORD(v5) = 1;
  }
  else
  {
    LODWORD(v5) = 0;
  }
  *(void *)v229 = v18;
  unint64_t v19 = *(unsigned int *)(v4 + 60);
  uint64_t v210 = v9;
  if ((v5 & 1) != 0
    || !(*(_DWORD *)(v4 + 60) & 0x400 | byte_1EB1CF86F | byte_1EB1CF871))
  {
    int v20 = v2;
    if ((v7 & 0x100000) != 0) {
      char v21 = v5;
    }
    else {
      char v21 = 1;
    }
    if (v21)
    {
      LOWORD(v2) = 1024;
      goto LABEL_16;
    }
    LODWORD(v2) = 2048;
  }
  else
  {
    int v20 = v2;
    LODWORD(v2) = 0x8000;
  }
  LODWORD(v245) = v2;
  LODWORD(v248) = v2;
  LODWORD(v251) = v2;
LABEL_16:
  char v22 = 0;
  unsigned int v231 = 3;
  char v23 = 1;
  if ((v19 & 0x6000) == 0x6000 || byte_1EB1CF86F || byte_1EB1CF870) {
    goto LABEL_29;
  }
  if ((DWORD2(xmmword_1EB1CF7F0) & 0x2000000) != 0)
  {
    char v22 = 0;
    int v24 = 3;
LABEL_27:
    unsigned int v231 = v24;
    goto LABEL_29;
  }
  if ((MEMORY[0xFFFFFC104] & 0x2000000) == 0)
  {
    char v22 = 0;
    unsigned int v231 = 2;
    char v23 = 1;
    if ((v7 & 0x40000000) != 0 || (v19 & 0x6000) == 0x4000) {
      goto LABEL_29;
    }
    if ((DWORD2(xmmword_1EB1CF7F0) & 0x1000000) != 0 || (MEMORY[0xFFFFFC104] & 0x1000000) != 0)
    {
      char v22 = 0;
      int v24 = 2;
    }
    else
    {
      char v23 = 0;
      char v22 = 1;
      int v24 = 1;
    }
    goto LABEL_27;
  }
  char v22 = 0;
  unsigned int v231 = 3;
  char v23 = 1;
LABEL_29:
  if ((v7 & 0x100000) != 0) {
    char v25 = v5;
  }
  else {
    char v25 = 1;
  }
  char v226 = v23;
  char v211 = v22;
  if ((v25 & 1) == 0) {
    goto LABEL_529;
  }
  while (2)
  {
    char v26 = *v20;
    size_t v1 = (unsigned __int16)v2;
    if ((*v20 & 3) == 0 && (unsigned __int16)v2 >= v17 && (v19 & 0x1000) == 0)
    {
      unsigned int v2 = v20;
      size_t v1 = *(void *)v229;
      if ((v251 & 0x200000000) == 0)
      {
        if (SBYTE6(v251) + HIDWORD(v250) - (int)v250 - 1 < v17)
        {
          os_trace_blob_add_slow((uint64_t)&v249, v20, v17);
        }
        else
        {
          memcpy((char *)v249 + v250, v20, v17);
          unsigned int v27 = v250 + v17;
          LODWORD(v250) = v250 + v17;
          if (!BYTE6(v251)) {
            *((unsigned char *)v249 + v27) = 0;
          }
        }
      }
      goto LABEL_174;
    }
    LODWORD(v278) = (unsigned __int16)v7;
    int v28 = v250;
    uint64_t v223 = v250;
    if (!BYTE6(v251)) {
      int v28 = v250 + 1;
    }
    if (v251)
    {
      unsigned int v29 = v251 - v28;
    }
    else
    {
      unsigned int v29 = HIDWORD(v250) - v28;
      if (!HIDWORD(v250)) {
        unsigned int v29 = 0;
      }
    }
    unsigned int v2 = v20;
    if (v29 < v1) {
      goto LABEL_521;
    }
    int v30 = v247;
    if (!BYTE6(v248)) {
      int v30 = v247 + 1;
    }
    if (v248)
    {
      unsigned int v31 = v248 - v30;
    }
    else
    {
      unsigned int v31 = HIDWORD(v247) - v30;
      if (!HIDWORD(v247)) {
        unsigned int v31 = 0;
      }
    }
    if (v31 < v1) {
      goto LABEL_521;
    }
    int v32 = *(_DWORD *)v244;
    if (!BYTE6(v245)) {
      int v32 = *(_DWORD *)v244 + 1;
    }
    if (v245)
    {
      unsigned int v33 = v245 - v32;
    }
    else
    {
      unsigned int v33 = *(_DWORD *)&v244[2] - v32;
      if (!*(_DWORD *)&v244[2]) {
        unsigned int v33 = 0;
      }
    }
    if (v33 < v1) {
      goto LABEL_521;
    }
    uint64_t v213 = v6;
    uint64_t v220 = v4;
    char v34 = privacy_opt2flags[(v19 >> 11) & 3];
    uint64_t v4 = v231;
    LOWORD(v275) = (32 * v231);
    if ((v26 & 0x10) != 0) {
      LOBYTE(v275) = (32 * v231) | 0x10;
    }
    int v208 = (int)v7;
    int v215 = v5;
    unsigned int v217 = v3;
    if ((v251 & 0x200000000) == 0)
    {
      if ((~v250 + SBYTE6(v251) + HIDWORD(v250)) <= 1)
      {
        os_trace_blob_add_slow((uint64_t)&v249, &v275, 2uLL);
      }
      else
      {
        *(_WORD *)((char *)v249 + v250) = v275;
        unsigned int v35 = v250 + 2;
        LODWORD(v250) = v250 + 2;
        if (!BYTE6(v251)) {
          *((unsigned char *)v249 + v35) = 0;
        }
      }
    }
    if (!v20[1]) {
      goto LABEL_173;
    }
    uint64_t v5 = 0;
    uint64_t v233 = 0;
    unsigned int v3 = 0;
    int v20 = (unsigned char *)(v1 - v223 - 2);
    uint64_t v6 = (uint64_t)(v2 + 2);
    int v221 = v34 & 0xF;
LABEL_69:
    xpc_object_t v7 = (int *)(v6 + 2);
    LOWORD(v235) = *(_WORD *)v6;
    unsigned int v36 = (unsigned __int16)v235;
    unsigned int v37 = v235;
    if ((v235 & 7) == 0)
    {
      unsigned int v37 = v221 | v235;
      LOBYTE(v235) = v221 | v235;
    }
    uint64_t v17 = v36 >> 8;
    uint64_t v38 = v37 >> 4;
    switch((int)v38)
    {
      case 0:
        uint64_t v8 = v6 + 2;
        uint64_t v5 = v17;
        if (v37) {
          goto LABEL_98;
        }
        goto LABEL_84;
      case 1:
        if (v17 != 4) {
          goto LABEL_527;
        }
        uint64_t v5 = *v7 & ~(*v7 >> 31);
        char v39 = v37 & 0xF0;
        unsigned int v37 = v37 & 0xF0 | 2;
        LOBYTE(v235) = v39 | 2;
        uint64_t v8 = v6 + 2;
        if (v39) {
          goto LABEL_98;
        }
        goto LABEL_84;
      case 6:
        v37 &= 0xFu;
        LOBYTE(v235) = v37;
        LODWORD(v17) = 4;
        BYTE1(v235) = 4;
        uint64_t v8 = (uint64_t)&v278;
        uint64_t v5 = 4;
        if (v37) {
          goto LABEL_98;
        }
        goto LABEL_84;
      case 7:
        if (v17 == 8)
        {
          uint64_t v233 = *(void *)v7;
          goto LABEL_163;
        }
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_526:
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_527:
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_528:
        _os_assert_log();
        _os_crash();
        __break(1u);
LABEL_529:
        LOWORD(v278) = 0;
        if (v247)
        {
          _os_assert_log();
          _os_crash();
          __break(1u);
LABEL_590:
          os_trace_blob_add_slow((uint64_t)&v246, &v278, 2uLL);
          goto LABEL_534;
        }
        LODWORD(v7) = v7 | 0x80000;
        if ((v248 & 0x200000000) != 0) {
          goto LABEL_534;
        }
        if ((SBYTE6(v248) + HIDWORD(v247) - 1) <= 1) {
          goto LABEL_590;
        }
        *(_WORD *)v246 = 0;
        unsigned int v195 = v247 + 2;
        LODWORD(v247) = v247 + 2;
        if (!BYTE6(v248)) {
          *((unsigned char *)v246 + v195) = 0;
        }
LABEL_534:
        v196 = (void **)os_log_backtrace_create_from_return_address(64, *(void *)(v6 + 32));
        os_log_backtrace_serialize_to_blob((uint64_t)v196);
        free(*v196);
        free(v196);
        os_trace_blob_pwrite(v246, v247, 1);
        LOWORD(v2) = (_WORD)v2 - v247;
        unint64_t v19 = *(unsigned int *)(v4 + 60);
        continue;
      default:
        if ((unint64_t)(v38 - 2) >= 4) {
          goto LABEL_526;
        }
        if (v17 != 8) {
          goto LABEL_528;
        }
        uint64_t v8 = *(void *)v7;
        LOBYTE(v275) = v275 | 2;
        if (v37) {
          goto LABEL_98;
        }
LABEL_84:
        if ((unint64_t)(v37 >> 4) - 6 <= 0xFFFFFFFFFFFFFFFBLL)
        {
          unint64_t v40 = v17 + 2;
          BOOL v41 = (unint64_t)v20 >= v40;
          v20 -= v40;
          if (!v41) {
            goto LABEL_172;
          }
          ++BYTE1(v275);
          if ((v251 & 0x200000000) == 0)
          {
            if ((SBYTE6(v251) + HIDWORD(v250) - v250 - 1) <= 1)
            {
              os_trace_blob_add_slow((uint64_t)&v249, &v235, 2uLL);
            }
            else
            {
              unsigned int v42 = (unsigned __int16)v235;
              *(_WORD *)((char *)v249 + v250) = (_WORD)v235;
              unsigned int v43 = v250 + 2;
              LODWORD(v250) = v250 + 2;
              LODWORD(v17) = v42 >> 8;
              if (!BYTE6(v251)) {
                *((unsigned char *)v249 + v43) = 0;
              }
            }
          }
          if ((v251 & 0x200000000) == 0)
          {
            if (SBYTE6(v251) + HIDWORD(v250) - (int)v250 - 1 < v17)
            {
              os_trace_blob_add_slow((uint64_t)&v249, (void *)v8, v17);
            }
            else
            {
              memcpy((char *)v249 + v250, (const void *)v8, v17);
              unsigned int v44 = v250 + v17;
              LODWORD(v250) = v250 + v17;
              if (!BYTE6(v251)) {
                *((unsigned char *)v249 + v44) = 0;
              }
            }
          }
          if (!v249) {
            goto LABEL_173;
          }
          if ((v235 & 0xF0) != 0x10) {
            goto LABEL_162;
          }
LABEL_163:
          ++v3;
          uint64_t v6 = (uint64_t)v7 + *(unsigned __int8 *)(v6 + 1);
          if (v3 >= v2[1]) {
            goto LABEL_173;
          }
          goto LABEL_69;
        }
LABEL_98:
        BYTE1(v235) = 4;
        LODWORD(__src) = 0;
        BOOL v41 = (unint64_t)v20 >= 6;
        v20 -= 6;
        if (!v41)
        {
LABEL_172:
          LOBYTE(v275) = v275 | 0x80;
LABEL_173:
          *(_WORD *)((char *)v249 + v223) = v275;
          LODWORD(v5) = v215;
          unsigned int v3 = v217;
          uint64_t v4 = v220;
          uint64_t v6 = v213;
          size_t v1 = *(void *)v229;
          LODWORD(v7) = v208;
LABEL_174:
          int v65 = v247;
          int v66 = *(_DWORD *)v244;
          if ((v7 & 0x8000000) == 0)
          {
LABEL_175:
            unsigned int v67 = v65 + v66 + v250;
            if ((v7 & 0x100000) != 0) {
              int v68 = v5;
            }
            else {
              int v68 = 1;
            }
            if (v68) {
              unsigned int v69 = 1024;
            }
            else {
              unsigned int v69 = 2048;
            }
            if (v67 > v69) {
              LODWORD(v7) = v7 | 0x2000000;
            }
            BOOL v93 = v66 == 0;
            char v70 = v226;
            if (v93) {
              char v70 = 1;
            }
            if ((v70 & 1) != 0 || (v245 & 0x400000000) != 0)
            {
              uint64_t v8 = 3954044928;
              v235 = &v249;
              v236 = &v246;
              v237 = &v243;
              size_t v238 = v1;
              uint64_t v241 = 0;
              long long v239 = 0u;
              long long v240 = 0u;
              uint64_t v242 = v7;
              if ((BYTE9(xmmword_1EB1CF7F0) & 8) != 0 || MEMORY[0xFFFFFC104] & 0x800 | v7 & 0x1000000) {
                goto LABEL_507;
              }
              int v216 = v5;
              uint64_t v220 = v4;
              if ((v7 & 0x800000) != 0)
              {
                *(void *)&long long v239 = os_log_fmt_extract_symptom((uint64_t)v2);
                *((void *)&v239 + 1) = v198;
              }
              unint64_t v72 = *(void *)(v6 + 24);
              unint64_t v71 = *(void *)(v6 + 32);
              unint64_t v73 = *(void *)(v6 + 40);
              if ((v7 & 0x400000) == 0)
              {
                uint64_t v253 = 0;
                v254 = 0;
                unint64_t v252 = 0;
                if (off_1EB1CF7E8) {
                  v74 = (atomic_ullong *)((char *)off_1EB1CF7E8 + 8);
                }
                else {
                  v74 = 0;
                }
                if (_os_trace_dsc_load_addr > v72 || _os_trace_dsc_size + _os_trace_dsc_load_addr <= v72)
                {
                  if (*(_DWORD *)(v72 + 12) != 2)
                  {
                    if (off_1EB1CF7E8)
                    {
LABEL_215:
                      atomic_ullong v84 = *v74;
                      do
                      {
                        if (v84)
                        {
                          _os_trace_rwptr_rdlock_wait((uint64_t)v74);
                          goto LABEL_215;
                        }
                        atomic_ullong v85 = v84;
                        atomic_compare_exchange_strong_explicit(v74, (unint64_t *)&v85, v84 + 0x200000000, memory_order_relaxed, memory_order_relaxed);
                        BOOL v93 = v85 == v84;
                        atomic_ullong v84 = v85;
                      }
                      while (!v93);
                      atomic_ullong v88 = v74[1];
                      unint64_t v89 = *(unsigned __int16 *)(v88 + 10);
                      unint64_t v90 = (v72 >> *MEMORY[0x1E4F14C78]) % v89;
                      while (1)
                      {
                        unint64_t v91 = v88 + 16 * v90;
                        uint64_t v92 = *(void *)(v91 + 16);
                        if (v72 == v92) {
                          break;
                        }
                        if (v90 + 1 == v89) {
                          unint64_t v90 = 0;
                        }
                        else {
                          ++v90;
                        }
                        if (v92) {
                          BOOL v93 = v90 == (v72 >> *MEMORY[0x1E4F14C78]) % v89;
                        }
                        else {
                          BOOL v93 = 1;
                        }
                        if (v93)
                        {
                          v81 = 0;
                          goto LABEL_249;
                        }
                      }
                      v81 = *(_OWORD **)(v91 + 24);
LABEL_249:
                      unint64_t v101 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
                      atomic_ullong v102 = *v74;
                      atomic_ullong v103 = *v74;
                      do
                      {
                        unint64_t v104 = v102 - 0x200000000;
                        if (v102 == 0x300000000) {
                          unint64_t v104 = v101;
                        }
                        atomic_compare_exchange_strong_explicit(v74, (unint64_t *)&v103, v104, memory_order_relaxed, memory_order_relaxed);
                        BOOL v93 = v103 == v102;
                        atomic_ullong v102 = v103;
                      }
                      while (!v93);
                      if (v104 == v101)
                      {
                        __dmb(9u);
                        v201 = v81;
                        _os_trace_rwptr_cleanup((uint64_t)v74, (void (*)(void))_os_trace_mh_map_cleanup);
                        v81 = v201;
                      }
                      v254 = v81;
                      if (v81)
                      {
                        LODWORD(v253) = v71 - v72;
                        WORD2(v253) = (v71 - v72) >> 32;
                        unsigned int v82 = 20;
                        HIWORD(v253) = 20;
                        int v275 = v71 - v72;
                        long long v276 = *v81;
                        int v76 = 10;
                        unsigned int v222 = v71 - v72;
                        unint64_t v224 = (v71 - v72) >> 32;
                        goto LABEL_271;
                      }
                    }
                    else
                    {
                      v254 = 0;
                    }
                    LODWORD(v253) = v71;
                    unint64_t v224 = HIDWORD(v71);
                    WORD2(v253) = WORD2(v71);
                    int v76 = 8;
                    unsigned int v222 = v71;
LABEL_270:
                    v81 = 0;
                    unsigned int v82 = 6;
                    HIWORD(v253) = 6;
                    int v275 = v253;
                    LOWORD(v276) = WORD2(v253);
LABEL_271:
                    uint64_t v109 = v242 & 0x20000000;
                    if (v109) {
                      unint64_t v110 = v71;
                    }
                    else {
                      unint64_t v110 = v73;
                    }
                    char v218 = v3;
                    if (v110)
                    {
                      uint64_t v111 = 4 * v109;
                      uint64_t v112 = _os_trace_dsc_load_addr;
                      if (_os_trace_dsc_load_addr <= v72)
                      {
                        if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= v72) {
                          uint64_t v112 = v72;
                        }
                        unint64_t v113 = v110 - v112;
                      }
                      else
                      {
                        unint64_t v113 = v110 - v72;
                      }
                      uint64_t v115 = v220;
                      uint64_t v116 = v113 & 0x7FFFFFFF;
                      unint64_t v110 = v113 >> 31;
                      uint64_t v114 = v116 | v111;
                    }
                    else
                    {
                      uint64_t v114 = 0;
                      uint64_t v115 = v220;
                    }
                    unint64_t v117 = v114 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)v110 << 32);
                    unint64_t v252 = v117;
                    if ((((unint64_t)(unsigned __int16)v110 << 32) & 0xFFFF00000000) != 0)
                    {
                      v76 |= 0x20u;
                      *(_WORD *)((char *)&v275 + v82) = WORD2(v117);
                      v82 += 2;
                    }
                    v118 = *(_WORD **)(v115 + 24);
                    uint64_t v214 = v6;
                    if (v118)
                    {
                      v76 |= 0x200u;
                      *(_WORD *)((char *)&v275 + v82) = *v118;
                      v82 += 2;
                    }
                    uint64_t v119 = v218 & 0x7F;
                    uint64_t v232 = v114;
                    if (v119 == 17)
                    {
                      v120 = (atomic_uint *)(v115 + 44);
                    }
                    else
                    {
                      if (v119 != 16)
                      {
                        unsigned int v121 = 0;
LABEL_292:
                        unsigned int v122 = *(_DWORD *)(v115 + 60);
                        int v123 = process_prefs_0 & 3;
                        if ((v122 & 7) != 0) {
                          int v123 = *(_DWORD *)(v115 + 60) & 7;
                        }
                        v227 = (char *)v81;
                        if (v123 == 4)
                        {
                          char v124 = 0;
LABEL_296:
                          int v125 = 255;
                          goto LABEL_388;
                        }
                        int v126 = (v122 >> 3) & 7;
                        if (v126) {
                          char v127 = v126;
                        }
                        else {
                          char v127 = (process_prefs_0 >> 2) & 7;
                        }
                        if ((v218 & 0x7Fu) > 0xF)
                        {
                          if ((v119 - 16) >= 2) {
                            goto LABEL_382;
                          }
                        }
                        else if ((v218 & 0x7F) != 0)
                        {
                          if (v119 != 1)
                          {
                            if (v119 == 2)
                            {
                              if (v123 != 3
                                && ((_BYTE)v123
                                 || (BYTE8(xmmword_1EB1CF7F0) & 2) == 0
                                 && (MEMORY[0xFFFFFC104] & 2) == 0
                                 && (voucher_get_activity_id() & 0x200000000000000) == 0))
                              {
                                char v124 = *(unsigned char *)(v115 + 59);
                                goto LABEL_296;
                              }
                              BOOL v128 = v127 == 3;
                              uint64_t v129 = 59;
                              goto LABEL_312;
                            }
LABEL_382:
                            if (v218 < 0)
                            {
LABEL_385:
                              char v124 = 14;
LABEL_386:
                              v76 |= 0x400u;
                              *((unsigned char *)&v275 + v82++) = v124;
                              int v125 = 1;
                              goto LABEL_387;
                            }
                            char v124 = 0;
                            goto LABEL_384;
                          }
                          if ((v123 & 6) != 2
                            && ((_BYTE)v123
                             || (BYTE8(xmmword_1EB1CF7F0) & 3) == 0
                             && (MEMORY[0xFFFFFC104] & 3) == 0
                             && (voucher_get_activity_id() & 0x300000000000000) == 0))
                          {
                            char v124 = *(unsigned char *)(v115 + 58);
                            goto LABEL_296;
                          }
                          BOOL v128 = (v127 & 6) == 2;
                          uint64_t v129 = 58;
LABEL_312:
                          char v124 = *(unsigned char *)(v115 + v129);
                          if ((v218 & 0x80) == 0 && v128)
                          {
                            if (v119 != 17 && !*(unsigned char *)(v115 + v129))
                            {
                              char v124 = 0;
                              int v125 = 0;
LABEL_387:
                              LODWORD(v242) = v242 | 0x10000000;
LABEL_388:
                              int v155 = v242;
                              if ((v242 & 0x2000000) != 0)
                              {
                                if (v216)
                                {
LABEL_592:
                                  qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Using oversized messages with unreliable i"
                                                             "nterfaces shouldn't be possible";
                                  __break(1u);
                                  goto LABEL_593;
                                }
                                v76 |= 0x800u;
                                unsigned int add_explicit = atomic_fetch_add_explicit(&_oversize_message_id, 1u, memory_order_relaxed);
                                *(int *)((char *)&v275 + v82) = add_explicit;
                                v82 += 4;
                              }
                              else
                              {
                                unsigned int add_explicit = 0;
                              }
                              unsigned int v234 = v125;
                              if ((v155 & 0x80000) != 0) {
                                v76 |= 0x1000u;
                              }
                              unsigned __int8 v212 = v124;
                              unsigned int v207 = v121;
                              if ((BYTE8(xmmword_1EB1CF7F0) & 8) == 0
                                && (MEMORY[0xFFFFFC104] & 8) == 0
                                && (voucher_get_activity_id() & 0x800000000000000) == 0
                                || (*(_DWORD *)(v115 + 60) & 7) == 4)
                              {
                                goto LABEL_395;
                              }
                              if ((byte_1EB1CF868 & 4) == 0) {
                                goto LABEL_539;
                              }
                              if ((v218 & 0x7Fu) > 0xF)
                              {
                                if ((v119 - 16) >= 2) {
                                  goto LABEL_539;
                                }
                              }
                              else if ((v218 & 0x7F) != 0)
                              {
                                if (v119 == 1)
                                {
                                  if ((qword_1EB1CF860 & 0x100000000) != 0) {
                                    goto LABEL_575;
                                  }
                                }
                                else if (v119 == 2 && (qword_1EB1CF860 & 0x200000000) != 0)
                                {
                                  goto LABEL_575;
                                }
LABEL_539:
                                int v197 = (*(_DWORD *)(v115 + 60) >> 27) & 7;
                                if (v197 != 3)
                                {
                                  if (v197 != 2)
                                  {
                                    if (v197 == 1)
                                    {
                                      BOOL v156 = ((v218 & 0x7F) - 3) < 0xFEu;
                                      goto LABEL_396;
                                    }
LABEL_395:
                                    BOOL v156 = 0;
                                    goto LABEL_396;
                                  }
                                  BOOL v156 = v119 != 2;
LABEL_396:
                                  BOOL v158 = v234 != 255
                                      && (byte_1EB1CF86E | byte_1EB1CF86F) != 0;
                                  char v159 = _os_log_hook;
                                  BOOL v230 = v156;
                                  if (_os_log_hook)
                                  {
                                    char v159 = 0;
                                    if (_os_log_hook_level <= 1u)
                                    {
                                      if (_os_log_hook_level)
                                      {
                                        if (_os_log_hook_level == 1) {
                                          char v159 = v119 != 2;
                                        }
                                      }
                                      else
                                      {
                                        char v159 = ((v218 & 0x7F) - 16) < 0xF1u;
                                      }
                                    }
                                    else
                                    {
                                      switch(_os_log_hook_level)
                                      {
                                        case 2:
                                          goto LABEL_428;
                                        case 16:
                                          char v159 = v119 > 0xF;
                                          break;
                                        case 17:
                                          char v159 = v119 == 17;
                                          break;
                                      }
                                    }
                                  }
                                  if (!v156 && !v158 && (v159 & 1) == 0 && (v242 & 0x4000000) == 0)
                                  {
                                    *(void *)uint64_t v214 = mach_continuous_time();
                                    goto LABEL_417;
                                  }
LABEL_428:
                                  if (mach_get_times()) {
                                    _os_assumes_log();
                                  }
LABEL_417:
                                  uint64_t v161 = (v119 << 8) | (v76 << 16) | ((unint64_t)v232 << 32) | 4;
                                  uint64_t v162 = _os_log_hook;
                                  if (!_os_log_hook) {
                                    goto LABEL_472;
                                  }
                                  if (_os_log_hook_level <= 1u)
                                  {
                                    if (_os_log_hook_level)
                                    {
                                      if (_os_log_hook_level != 1 || v119 == 2) {
                                        goto LABEL_472;
                                      }
                                    }
                                    else if (((v218 & 0x7F) - 16) >= 0xF1u)
                                    {
                                      goto LABEL_472;
                                    }
                                  }
                                  else if (_os_log_hook_level != 2)
                                  {
                                    if (_os_log_hook_level == 16)
                                    {
                                      if (v119 <= 0xF) {
                                        goto LABEL_472;
                                      }
                                    }
                                    else if (_os_log_hook_level != 17 || v119 != 17)
                                    {
                                      goto LABEL_472;
                                    }
                                  }
                                  v163 = pthread_getspecific(_os_log_hook_thread_key);
                                  uint64_t v161 = (v119 << 8) | (v76 << 16) | ((unint64_t)v232 << 32) | 4;
                                  if (v163) {
                                    goto LABEL_472;
                                  }
                                  uint64_t v271 = 0x1000000000000;
                                  uint64_t v269 = (uint64_t)&v278;
                                  uint64_t v270 = 0x40000000000;
                                  if ((v242 & 0x2000000) != 0) {
                                    LODWORD(v271) = 0x8000;
                                  }
                                  unsigned int v164 = *((_DWORD *)v235 + 2);
                                  if (v164 > 0x400)
                                  {
                                    os_trace_blob_add_slow((uint64_t)&v269, *v235, *((unsigned int *)v235 + 2));
                                    unsigned int v164 = v270;
                                    if ((v271 & 0x200000000) != 0) {
                                      goto LABEL_441;
                                    }
                                    int v204 = HIDWORD(v270);
                                    int v165 = BYTE6(v271);
                                  }
                                  else
                                  {
                                    int v204 = 1024;
                                    __memcpy_chk();
                                    LODWORD(v270) = v164;
                                    int v165 = 1;
                                  }
                                  v166 = *v236;
                                  size_t v167 = *((unsigned int *)v236 + 2);
                                  int v203 = v165;
                                  if (v204 - v164 + (char)(v165 - 1) < v167)
                                  {
                                    os_trace_blob_add_slow((uint64_t)&v269, v166, v167);
                                    LOWORD(v164) = v270;
                                  }
                                  else
                                  {
                                    uint64_t v205 = v269;
                                    memcpy((void *)(v269 + v164), v166, v167);
                                    v164 += v167;
                                    LODWORD(v270) = v164;
                                    if (!v203) {
                                      *(unsigned char *)(v205 + v164) = 0;
                                    }
                                  }
LABEL_441:
                                  v168 = v227;
                                  long long v266 = 0u;
                                  long long v267 = 0u;
                                  long long v264 = 0u;
                                  long long v265 = 0u;
                                  long long v263 = 0u;
                                  uint64_t v169 = *(void *)v214;
                                  time_t v170 = *(void *)(v214 + 8);
                                  unint64_t __src = (v119 << 8) | (v76 << 16) | ((unint64_t)v232 << 32) | 4;
                                  uint64_t v258 = v169;
                                  uint64_t v259 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
                                  long long v260 = 0uLL;
                                  uint64_t v171 = (*(void *)(v214 + 16) / 0x3E8uLL);
                                  *(void *)&long long v261 = v170;
                                  *((void *)&v261 + 1) = v171;
                                  memset(v262, 0, sizeof(v262));
                                  v262[4] = *(void *)(v214 + 40);
                                  *(void *)&long long v263 = v269;
                                  *((void *)&v263 + 1) = (unsigned __int16)v164;
                                  *(void *)&long long v264 = *v237;
                                  uint64_t v172 = *(void *)(v220 + 24);
                                  uint64_t v173 = v172 + 4;
                                  if (!v172) {
                                    uint64_t v173 = 0;
                                  }
                                  *((void *)&v264 + 1) = *((unsigned __int16 *)v237 + 4);
                                  *(void *)&long long v265 = v173;
                                  v228 = (void *)v269;
                                  if (v172) {
                                    v172 += *(unsigned __int8 *)(v172 + 2) + 4;
                                  }
                                  int v174 = v232;
                                  *((void *)&v265 + 1) = v172;
                                  BYTE4(v266) = 0;
                                  uint64_t v268 = 0;
                                  *(void *)&long long v267 = 0;
                                  *((void *)&v266 + 1) = 0;
                                  WORD4(v267) = 0;
                                  v277[1] = 0;
                                  v277[0] = 0;
                                  uint64_t v175 = _os_log_hook_params;
                                  if ((_os_log_hook_params & 0x8000000000000002) == 0) {
                                    goto LABEL_467;
                                  }
                                  uint64_t v176 = v232 << 32;
                                  unint64_t v177 = v222 | ((unint64_t)(unsigned __int16)v224 << 32);
                                  time_t v206 = v170;
                                  if (*(_DWORD *)(*(void *)(v214 + 24) + 12) == 2)
                                  {
                                    LODWORD(v262[1]) = v222;
                                    WORD2(v262[1]) = v224;
                                    if (off_1EB1CF7E8) {
                                      v168 = (char *)off_1EB1CF7E8 + 24;
                                    }
                                    else {
                                      v168 = 0;
                                    }
                                  }
                                  else if (v168)
                                  {
                                    LODWORD(v262[1]) = v222;
                                    WORD2(v262[1]) = v224;
                                  }
                                  else
                                  {
                                    unint64_t v225 = *(void *)(v214 + 24);
                                    int image_uuid = _dyld_get_image_uuid();
                                    uint64_t v176 = v232 << 32;
                                    int v174 = v232;
                                    if (!image_uuid)
                                    {
LABEL_466:
                                      v262[2] = v176 & 0x8000000000000000 | v174 & 0x7FFFFFFF | (v117 >> 1) & 0x7FFF80000000;
                                      *((void *)&v260 + 1) = dyld_image_path_containing_address();
                                      time_t v170 = v206;
LABEL_467:
                                      if ((v175 & 0x8000000000000001) != 0)
                                      {
                                        time_t v256 = v170;
                                        memset(&v255, 0, sizeof(v255));
                                        localtime_r(&v256, &v255);
                                        unint64_t v180 = ((unsigned __int128)(v255.tm_gmtoff * (__int128)0x7777777777777777) >> 64)
                                             - v255.tm_gmtoff;
                                        HIDWORD(v262[0]) = v255.tm_isdst;
                                        LODWORD(v262[0]) = (v180 >> 5) + (v180 >> 63) + 60 * v255.tm_isdst;
                                      }
                                      pthread_setspecific(_os_log_hook_thread_key, (const void *)1);
                                      (*(void (**)(uint64_t, uint64_t, unint64_t *))(v162 + 16))(v162, v119, &__src);
                                      pthread_setspecific(_os_log_hook_thread_key, 0);
                                      if ((v271 & 0x100000000) != 0)
                                      {
                                        uint64_t v269 = 3954044928;
                                        free(v228);
                                      }
                                      uint64_t v161 = (v119 << 8) | (v76 << 16) | ((unint64_t)v232 << 32) | 4;
LABEL_472:
                                      uint64_t v4 = v220;
                                      if (v158)
                                      {
                                        uint64_t v199 = v161;
                                        _os_log_impl_mirror_to_stderr((char *)v214, v220, v119, (uint64_t)&v235, v76);
                                        uint64_t v161 = v199;
                                      }
                                      LOBYTE(v3) = v218;
                                      uint64_t v8 = 3954044928;
                                      if ((WORD4(xmmword_1EB1CF7F0) & 0x400) != 0 || (MEMORY[0xFFFFFC104] & 0x400) != 0) {
                                        goto LABEL_506;
                                      }
                                      if ((DWORD2(xmmword_1EB1CF7F0) & 0x40000000) != 0)
                                      {
                                        int v182 = v216;
                                        if (v234 == 255)
                                        {
                                          int v183 = 0;
                                          goto LABEL_503;
                                        }
                                      }
                                      else
                                      {
                                        unsigned int v181 = v234;
                                        int v182 = v216;
                                        if (v234 == 255 || (MEMORY[0xFFFFFC104] & 0x40000000) == 0) {
                                          goto LABEL_479;
                                        }
                                      }
                                      uint64_t v200 = v161;
                                      _os_log_mirror_syslog(v214, v220, v160, v119, (uint64_t)&v235);
                                      uint64_t v161 = v200;
                                      unsigned int v181 = v234;
LABEL_479:
                                      int v183 = 0;
                                      if (v181 == 255 || !off_1EB1CF7E8)
                                      {
LABEL_503:
                                        if (v230)
                                        {
                                          _os_log_impl_stream((unint64_t *)v214, v4, (unsigned int *)&v253, (uint64_t)&v252, (uint64_t *)&v235, v161, v212);
                                          if (!v183) {
                                            goto LABEL_506;
                                          }
                                        }
                                        else if (!v183)
                                        {
LABEL_506:
                                          uint64_t v6 = v214;
                                          goto LABEL_507;
                                        }
                                        v189 = (void *)voucher_adopt();
                                        os_release(v189);
                                        goto LABEL_506;
                                      }
                                      if ((void)v239) {
                                        _os_log_impl_mirror_symptom(v214, v220, (uint64_t)&v235);
                                      }
                                      if (v119 == 17) {
                                        char v184 = v182;
                                      }
                                      else {
                                        char v184 = 1;
                                      }
                                      if ((v184 & 1) == 0)
                                      {
                                        int v202 = (*(_DWORD *)(v220 + 60) >> 23) & 3;
                                        if (v202 == 2
                                          || v202 == 1
                                          && (byte_1EB1CF874 == 2
                                           || byte_1EB1CF874 != 3
                                           && (MEMORY[0xFFFFFC104] & 0x80000000) == 0
                                           && (MEMORY[0xFFFFFC104] & 0x10000000) != 0
                                           && !v207))
                                        {
                                          _os_log_impl_generate_crashlog(v220, v214, (uint64_t)&v235);
                                        }
                                      }
                                      if (v218 < 0 || v119 == 17) {
                                        int v186 = v182;
                                      }
                                      else {
                                        int v186 = 1;
                                      }
                                      if ((v186 & 1) == 0)
                                      {
                                        long long v278 = 1uLL;
                                        if (v119 == 17) {
                                          unsigned int v187 = 2;
                                        }
                                        else {
                                          unsigned int v187 = 1;
                                        }
                                        uint64_t v279 = v187 | 0x100000000;
                                        _os_activity_create_addr((unint64_t)&dword_19DC79000, (uint64_t)"Activity for state dumps", -3, 0, v210);
                                        uint64_t activity_id = voucher_get_activity_id();
                                        voucher_adopt();
                                        _os_state_request_for_self(activity_id, &v278, v212, v72);
                                      }
                                      int v183 = v186 ^ 1;
                                      if ((v242 & 0x2000000) == 0)
                                      {
                                        *(void *)&long long v278 = &v275;
                                        *((void *)&v278 + 1) = v82;
                                        uint64_t v279 = (uint64_t)*v235;
                                        uint64_t v280 = *((unsigned int *)v235 + 2);
                                        v281 = *v236;
                                        uint64_t v282 = *((unsigned int *)v236 + 2);
                                        v283 = *v237;
                                        uint64_t v284 = *((unsigned int *)v237 + 2);
                                        uint64_t v161 = voucher_activity_trace_v_2();
                                        LOBYTE(v3) = v218;
                                        uint64_t v4 = v220;
                                        goto LABEL_503;
                                      }
                                      if (!v182)
                                      {
                                        _os_log_impl_send_oversize(v220, v234, v212, *(void *)v214, add_explicit, (const void ***)&v235);
                                        uint64_t v161 = voucher_activity_trace();
                                        LOBYTE(v3) = v218;
                                        uint64_t v4 = v220;
                                        uint64_t v8 = 3954044928;
                                        goto LABEL_503;
                                      }
LABEL_593:
                                      qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Using oversized messages with unreliab"
                                                                 "le interfaces shouldn't be possible";
                                      __break(1u);
                                      return;
                                    }
                                    uint64_t v179 = _os_trace_dsc_load_addr;
                                    if (_os_trace_dsc_load_addr <= v225)
                                    {
                                      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= v225) {
                                        uint64_t v179 = 0;
                                      }
                                      v177 += v179;
                                    }
                                    v262[1] = v177 - v225;
                                    v168 = (char *)v277;
                                  }
                                  *(void *)&long long v260 = v168;
                                  goto LABEL_466;
                                }
LABEL_575:
                                BOOL v156 = 1;
                                goto LABEL_396;
                              }
                              if ((qword_1EB1CF860 & 0x800000000) != 0) {
                                goto LABEL_575;
                              }
                              goto LABEL_539;
                            }
LABEL_318:
                            if (*(unsigned __int8 *)(v115 + v129) >= 0x1Eu) {
                              char v124 = 30;
                            }
                            if (*(unsigned char *)(v115 + v129)) {
                              goto LABEL_386;
                            }
                            goto LABEL_385;
                          }
                          if (v218 < 0) {
                            goto LABEL_318;
                          }
LABEL_384:
                          int v125 = 2;
                          goto LABEL_388;
                        }
                        BOOL v128 = v127 != 4;
                        uint64_t v129 = 57;
                        goto LABEL_312;
                      }
                      v120 = (atomic_uint *)(v115 + 40);
                    }
                    unsigned int v121 = atomic_fetch_add_explicit(v120, 1u, memory_order_relaxed);
                    goto LABEL_292;
                  }
                  LODWORD(v253) = v71 - v72;
                  unint64_t v224 = (v71 - v72) >> 32;
                  WORD2(v253) = (v71 - v72) >> 32;
                  HIWORD(v253) = 4;
                  v254 = 0;
                  int v76 = 2;
                  unsigned int v75 = v71 - v72;
                }
                else
                {
                  unsigned int v75 = v71 - _os_trace_dsc_load_addr;
                  LODWORD(v253) = v71 - _os_trace_dsc_load_addr;
                  WORD2(v253) = (v71 - _os_trace_dsc_load_addr) >> 32;
                  v254 = 0;
                  if (WORD2(v253))
                  {
                    unsigned int v222 = v71 - _os_trace_dsc_load_addr;
                    unint64_t v224 = (v71 - _os_trace_dsc_load_addr) >> 32;
                    int v76 = 12;
                    goto LABEL_270;
                  }
                  HIDWORD(v253) = 0x40000;
                  LOWORD(v224) = 0;
                  int v76 = 4;
                }
                v81 = 0;
                unsigned int v222 = v75;
                int v275 = v75;
                unsigned int v82 = 4;
                goto LABEL_271;
              }
              uint64_t v270 = 0;
              uint64_t v269 = 0;
              v277[0] = 0;
              uint64_t v8 = v6;
              uint64_t v77 = *(void *)(v6 + 56);
              if (off_1EB1CF7E8) {
                v78 = (atomic_ullong *)((char *)off_1EB1CF7E8 + 8);
              }
              else {
                v78 = 0;
              }
              uint64_t v233 = *(void *)(v6 + 56);
              if (_os_trace_dsc_load_addr > v72 || _os_trace_dsc_size + _os_trace_dsc_load_addr <= v72)
              {
                if (*(_DWORD *)(v72 + 12) != 2)
                {
                  if (off_1EB1CF7E8)
                  {
LABEL_221:
                    atomic_ullong v86 = *v78;
                    do
                    {
                      if (v86)
                      {
                        _os_trace_rwptr_rdlock_wait((uint64_t)v78);
                        uint64_t v77 = v233;
                        goto LABEL_221;
                      }
                      atomic_ullong v87 = v86;
                      atomic_compare_exchange_strong_explicit(v78, (unint64_t *)&v87, v86 + 0x200000000, memory_order_relaxed, memory_order_relaxed);
                      BOOL v93 = v87 == v86;
                      atomic_ullong v86 = v87;
                    }
                    while (!v93);
                    atomic_ullong v94 = v78[1];
                    unint64_t v95 = *(unsigned __int16 *)(v94 + 10);
                    unint64_t v96 = (v72 >> *MEMORY[0x1E4F14C78]) % v95;
                    while (1)
                    {
                      unint64_t v97 = v94 + 16 * v96;
                      uint64_t v98 = *(void *)(v97 + 16);
                      if (v72 == v98) {
                        break;
                      }
                      if (v96 + 1 == v95) {
                        unint64_t v96 = 0;
                      }
                      else {
                        ++v96;
                      }
                      if (v98) {
                        BOOL v99 = v96 == (v72 >> *MEMORY[0x1E4F14C78]) % v95;
                      }
                      else {
                        BOOL v99 = 1;
                      }
                      if (v99)
                      {
                        v100 = 0;
                        goto LABEL_259;
                      }
                    }
                    v100 = *(long long **)(v97 + 24);
LABEL_259:
                    unint64_t v105 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
                    atomic_ullong v106 = *v78;
                    atomic_ullong v107 = *v78;
                    do
                    {
                      unint64_t v108 = v106 - 0x200000000;
                      if (v106 == 0x300000000) {
                        unint64_t v108 = v105;
                      }
                      atomic_compare_exchange_strong_explicit(v78, (unint64_t *)&v107, v108, memory_order_relaxed, memory_order_relaxed);
                      BOOL v93 = v107 == v106;
                      atomic_ullong v106 = v107;
                    }
                    while (!v93);
                    if (v108 == v105)
                    {
                      __dmb(9u);
                      _os_trace_rwptr_cleanup((uint64_t)v78, (void (*)(void))_os_trace_mh_map_cleanup);
                      uint64_t v77 = v233;
                    }
                    uint64_t v270 = (uint64_t)v100;
                    if (v100)
                    {
                      LODWORD(v269) = v71 - v72;
                      WORD2(v269) = (v71 - v72) >> 32;
                      unsigned int v83 = 20;
                      HIWORD(v269) = 20;
                      int v275 = v71 - v72;
                      long long v276 = *v100;
                      unsigned int v80 = 10;
                      uint64_t v4 = v220;
                      goto LABEL_325;
                    }
                  }
                  else
                  {
                    uint64_t v270 = 0;
                  }
                  LODWORD(v269) = v71;
                  WORD2(v269) = WORD2(v71);
                  unsigned int v80 = 8;
LABEL_324:
                  uint64_t v4 = v220;
                  unsigned int v83 = 6;
                  HIWORD(v269) = 6;
                  int v275 = v269;
                  LOWORD(v276) = WORD2(v269);
LABEL_325:
                  if (v73)
                  {
                    uint64_t v130 = _os_trace_dsc_load_addr;
                    if (_os_trace_dsc_load_addr <= v72)
                    {
                      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= v72) {
                        uint64_t v130 = v72;
                      }
                      unint64_t v131 = v73 - v130;
                    }
                    else
                    {
                      unint64_t v131 = v73 - v72;
                    }
                    unint64_t v73 = v131 & 0x7FFFFFFF;
                    unint64_t v132 = v131 >> 31;
                  }
                  else
                  {
                    LOWORD(v132) = 0;
                  }
                  v277[0] = v73 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)v132 << 32);
                  uint64_t v133 = *(void *)(v6 + 48);
                  if (v133)
                  {
                    uint64_t v134 = _os_trace_dsc_load_addr;
                    if (_os_trace_dsc_load_addr <= v72)
                    {
                      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= v72) {
                        uint64_t v134 = v72;
                      }
                      unint64_t v135 = v133 - v134;
                    }
                    else
                    {
                      unint64_t v135 = v133 - v72;
                    }
                    int v137 = v135 & 0x7FFFFFFF;
                    unint64_t v136 = v135 >> 31;
                  }
                  else
                  {
                    LOWORD(v136) = 0;
                    int v137 = 0;
                  }
                  if ((unsigned __int16)v136 | (unsigned __int16)v132)
                  {
                    v80 |= 0x20u;
                    *(_WORD *)((char *)&v275 + v83) = v132;
                    v83 += 2;
                  }
                  v138 = *(_WORD **)(v4 + 24);
                  if (v138)
                  {
                    v80 |= 0x200u;
                    *(_WORD *)((char *)&v275 + v83) = *v138;
                    v83 += 2;
                  }
                  int v139 = *(_DWORD *)(v4 + 60);
                  if ((v139 & 0x80000) != 0)
                  {
                    LODWORD(v242) = v242 | 0x10000000;
                    LODWORD(v50) = 4;
                  }
                  else
                  {
                    LODWORD(v50) = 2;
                  }
                  *(void *)((char *)&v275 + v83) = v77;
                  int v20 = (unsigned char *)(v83 + 8);
                  if (v133)
                  {
                    *(int *)((char *)&v275 + (void)v20) = v137;
                    int v20 = (unsigned char *)(v83 + 12);
                    if ((v80 & 0x20) != 0)
                    {
                      *(_WORD *)((char *)&v275 + (void)v20) = v136;
                      LODWORD(v20) = v83 + 14;
                    }
                    v80 |= 0x8000u;
                  }
                  int v140 = v242;
                  if ((v242 & 0x2000000) != 0)
                  {
                    v80 |= 0x800u;
                    unsigned int v231 = atomic_fetch_add_explicit(&_oversize_message_id, 1u, memory_order_relaxed);
                    *(int *)((char *)&v275 + v20) = v231;
                    LODWORD(v20) = v20 + 4;
                    if ((v140 & 0x80000) == 0)
                    {
LABEL_354:
                      if ((v139 & 0x400000) == 0) {
                        goto LABEL_360;
                      }
                      goto LABEL_355;
                    }
                  }
                  else
                  {
                    unsigned int v231 = 0;
                    if ((v242 & 0x80000) == 0) {
                      goto LABEL_354;
                    }
                  }
                  v80 |= 0x1000u;
                  if ((v139 & 0x400000) == 0) {
                    goto LABEL_360;
                  }
LABEL_355:
                  if (((BYTE8(xmmword_1EB1CF7F0) & 8) != 0
                     || (MEMORY[0xFFFFFC104] & 8) != 0
                     || (voucher_get_activity_id() & 0x800000000000000) != 0)
                    && ((byte_1EB1CF868 & 8) != 0 || (*(unsigned char *)(v4 + 63) & 0x40) != 0))
                  {
                    if (mach_get_times()) {
                      _os_assumes_log();
                    }
                    LODWORD(v6) = 1;
LABEL_361:
                    uint64_t v5 = (v73 << 32) | ((unint64_t)v80 << 16) | ((unint64_t)v3 << 8) | 6;
                    if ((*(unsigned char *)(v4 + 62) & 2) != 0 && _signpost_hook)
                    {
                      *(void *)&v255.tm_mon = 0x1000000000000;
                      *(void *)&v255.tm_sec = &v278;
                      *(void *)&v255.unsigned int tm_hour = 0x40000000000;
                      if ((v242 & 0x2000000) != 0) {
                        goto LABEL_563;
                      }
                      goto LABEL_364;
                    }
                    goto LABEL_375;
                  }
LABEL_360:
                  LODWORD(v6) = 0;
                  *(void *)uint64_t v8 = mach_continuous_time();
                  goto LABEL_361;
                }
                int v79 = v71 - v72;
                LODWORD(v269) = v71 - v72;
                WORD2(v269) = (v71 - v72) >> 32;
                HIWORD(v269) = 4;
                uint64_t v270 = 0;
                unsigned int v80 = 2;
              }
              else
              {
                int v79 = v71 - _os_trace_dsc_load_addr;
                LODWORD(v269) = v71 - _os_trace_dsc_load_addr;
                WORD2(v269) = (v71 - _os_trace_dsc_load_addr) >> 32;
                uint64_t v270 = 0;
                if (WORD2(v269))
                {
                  unsigned int v80 = 12;
                  goto LABEL_324;
                }
                HIDWORD(v269) = 0x40000;
                unsigned int v80 = 4;
              }
              uint64_t v4 = v220;
              int v275 = v79;
              unsigned int v83 = 4;
              goto LABEL_325;
            }
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_524:
            _os_log_invoke_callback(v6, v4, v3, (uint64_t)&v235, (uint64_t (**)(void *))&_os_log_current_fault_callback);
            goto LABEL_508;
          }
LABEL_522:
          os_log_fmt_compose(v1, *(char **)(v6 + 40), 2, 3u, 8, (unsigned __int8 *)v249, (uint64_t)v246, (unsigned __int16)v65, (uint64_t)v243, v66);
          int v65 = v247;
          int v66 = *(_DWORD *)v244;
          goto LABEL_175;
        }
        uint64_t v45 = v250;
        ++BYTE1(v275);
        if ((v251 & 0x200000000) != 0) {
          goto LABEL_168;
        }
        if ((SBYTE6(v251) + HIDWORD(v250) - v250 - 1) <= 1)
        {
          os_trace_blob_add_slow((uint64_t)&v249, &v235, 2uLL);
LABEL_168:
          size_t v48 = 4;
          goto LABEL_104;
        }
        unsigned int v46 = (unsigned __int16)v235;
        *(_WORD *)((char *)v249 + v250) = (_WORD)v235;
        unsigned int v47 = v250 + 2;
        LODWORD(v250) = v250 + 2;
        size_t v48 = v46 >> 8;
        if (!BYTE6(v251)) {
          *((unsigned char *)v249 + v47) = 0;
        }
LABEL_104:
        if ((v251 & 0x200000000) == 0)
        {
          if (SBYTE6(v251) + HIDWORD(v250) - (int)v250 - 1 < v48)
          {
            os_trace_blob_add_slow((uint64_t)&v249, &__src, v48);
          }
          else
          {
            memcpy((char *)v249 + v250, &__src, v48);
            unsigned int v49 = v250 + v48;
            LODWORD(v250) = v250 + v48;
            if (!BYTE6(v251)) {
              *((unsigned char *)v249 + v49) = 0;
            }
          }
        }
        if (!v249) {
          goto LABEL_173;
        }
        xpc_object_t v50 = (unsigned __int8 *)v249 + v45;
        unsigned int v51 = privacy_flags2opt[v235 & 7];
        if (!v8)
        {
          if (v51 <= v4 || !v233) {
            goto LABEL_157;
          }
          unsigned __int8 v58 = *v50 & 8 | 0xF2;
          *xpc_object_t v50 = v58;
          if ((v58 & 1) == 0) {
            goto LABEL_162;
          }
          goto LABEL_161;
        }
        if (v51 > v4 && !v233)
        {
          unsigned int v52 = *v50;
          if ((v52 & 0xF0) == 0x40)
          {
            if (([(id)v8 isProxy] & 1) == 0
              && ((objc_opt_respondsToSelector() & 1) == 0
               || ([(id)v8 isNSNumber] & 1) == 0 && (objc_msgSend((id)v8, "isNSString") & 1) == 0))
            {
              sel_registerName("redactedDescription");
              if (objc_opt_respondsToSelector())
              {
                uint64_t v233 = 0;
                *xpc_object_t v50 = *v50 & 0xF | 0x80;
                WORD2(v245) |= 4u;
                goto LABEL_119;
              }
            }
LABEL_157:
            unsigned int v52 = *v50;
          }
          if (v52 > 0xF || (*((_WORD *)v50 + 2) & 0x7FFF) != 0)
          {
            if (v52) {
              goto LABEL_161;
            }
LABEL_162:
            uint64_t v233 = 0;
            uint64_t v5 = 0;
            goto LABEL_163;
          }
          *((_WORD *)v50 + 2) |= 0x8000u;
          if ((v52 & 1) == 0) {
            goto LABEL_162;
          }
LABEL_161:
          LOBYTE(v275) = v275 | 1;
          goto LABEL_162;
        }
LABEL_119:
        xpc_object_t v53 = v2;
        if ((unint64_t)v20 >= 0x7FFF) {
          size_t v54 = 0x7FFFLL;
        }
        else {
          size_t v54 = (size_t)v20;
        }
        unsigned int v55 = *v50;
        switch(v55 >> 4)
        {
          case 0u:
            if (v5)
            {
              unint64_t v56 = 0;
              unint64_t v57 = 0;
LABEL_154:
              unsigned int v60 = _os_log_fmt_flatten_to_blob((uint64_t)v50, v231, v233, (void *)v8, v5, (uint64_t)&v246, (uint64_t)&v243, v54, v57, v56);
LABEL_155:
              unint64_t v56 = v60;
LABEL_156:
              v20 -= v56;
              unsigned int v2 = v53;
              uint64_t v4 = v231;
              goto LABEL_157;
            }
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_561:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_562:
            _os_assert_log();
            _os_crash();
            __break(1u);
LABEL_563:
            v255.tm_mon = 0x8000;
LABEL_364:
            int v141 = (int)v50;
            unsigned int v219 = v3;
            unsigned int tm_hour = *((_DWORD *)v235 + 2);
            if (tm_hour > 0x400)
            {
              os_trace_blob_add_slow((uint64_t)&v255, *v235, *((unsigned int *)v235 + 2));
              unsigned int tm_hour = v255.tm_hour;
              if ((v255.tm_year & 2) == 0)
              {
                int tm_mday = v255.tm_mday;
                int v145 = BYTE2(v255.tm_year);
                int v144 = SBYTE2(v255.tm_year) - 1;
                goto LABEL_366;
              }
            }
            else
            {
              int tm_mday = 1024;
              __memcpy_chk();
              int v144 = 0;
              v255.unsigned int tm_hour = tm_hour;
              int v145 = 1;
LABEL_366:
              v146 = *v236;
              unsigned int v147 = *((_DWORD *)v236 + 2);
              if (tm_mday - tm_hour + v144 < v147)
              {
                os_trace_blob_add_slow((uint64_t)&v255, v146, *((unsigned int *)v236 + 2));
                LOWORD(tm_hour) = v255.tm_hour;
              }
              else
              {
                uint64_t v148 = *(void *)&v255.tm_sec;
                memcpy((void *)(*(void *)&v255.tm_sec + tm_hour), v146, *((unsigned int *)v236 + 2));
                tm_hour += v147;
                if (!v145) {
                  *(unsigned char *)(v148 + tm_hour) = 0;
                }
              }
            }
            LODWORD(v50) = v141;
            long long v266 = 0u;
            long long v267 = 0u;
            long long v264 = 0u;
            long long v265 = 0u;
            long long v263 = 0u;
            uint64_t v149 = *(void *)v8;
            unint64_t __src = v5;
            uint64_t v258 = v149;
            uint64_t v150 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
            long long v260 = 0u;
            long long v261 = 0u;
            memset(v262, 0, sizeof(v262));
            uint64_t v151 = *(void *)(v8 + 40);
            uint64_t v259 = v150;
            v152 = *(void **)&v255.tm_sec;
            v262[4] = v151;
            *(void *)&long long v263 = *(void *)&v255.tm_sec;
            *((void *)&v263 + 1) = (unsigned __int16)tm_hour;
            *(void *)&long long v264 = *v237;
            uint64_t v153 = *(void *)(v220 + 24);
            uint64_t v154 = v153 + 4;
            if (!v153) {
              uint64_t v154 = 0;
            }
            *((void *)&v264 + 1) = *((unsigned __int16 *)v237 + 4);
            *(void *)&long long v265 = v154;
            LOBYTE(v3) = v219;
            if (v153) {
              v153 += *(unsigned __int8 *)(v153 + 2) + 4;
            }
            *((void *)&v265 + 1) = v153;
            *((void *)&v266 + 1) = v233;
            uint64_t v268 = 0;
            _signpost_hook(v219 >> 6, v219 & 3, &__src);
            uint64_t v4 = v220;
            if (v255.tm_year) {
              free(v152);
            }
LABEL_375:
            if ((v242 & 0x2000000) != 0)
            {
              _os_log_impl_send_oversize(v4, v50, 0, *(void *)v8, v231, (const void ***)&v235);
              voucher_activity_trace();
              if (v6) {
                goto LABEL_548;
              }
            }
            else
            {
              *(void *)&long long v278 = &v275;
              *((void *)&v278 + 1) = v20;
              uint64_t v279 = (uint64_t)*v235;
              uint64_t v280 = *((unsigned int *)v235 + 2);
              v281 = *v236;
              uint64_t v282 = *((unsigned int *)v236 + 2);
              v283 = *v237;
              uint64_t v284 = *((unsigned int *)v237 + 2);
              voucher_activity_trace_v_2();
              if (!v6) {
                goto LABEL_377;
              }
LABEL_548:
              _os_log_impl_stream((unint64_t *)v8, v4, (unsigned int *)&v269, (uint64_t)v277, (uint64_t *)&v235, v5, 0);
            }
LABEL_377:
            uint64_t v6 = v8;
            uint64_t v8 = 3954044928;
LABEL_507:
            if ((v3 & 0x7F) == 0x11) {
              goto LABEL_524;
            }
LABEL_508:
            _os_log_invoke_callback(v6, v4, v3, (uint64_t)&v235, &_os_log_current_test_callback);
            if ((v251 & 0x100000000) != 0)
            {
              v190 = v249;
              v249 = (void *)v8;
              WORD2(v251) = 0;
              free(v190);
            }
            if ((v248 & 0x100000000) != 0)
            {
              v191 = v246;
              v246 = (void *)v8;
              WORD2(v248) = 0;
              free(v191);
            }
            if ((v245 & 0x100000000) != 0)
            {
              v192 = v243;
              v243 = (void *)v8;
              WORD2(v245) = 0;
              free(v192);
            }
            if ((v7 & 0x8000000) == 0)
            {
              size_t v193 = v238;
              if (v238)
              {
                if (*(_WORD *)(v238 + 20))
                {
                  v194 = *(void **)v238;
                  *(void *)size_t v238 = v8;
                  *(_WORD *)(v193 + 20) = 0;
                  free(v194);
                }
              }
            }
            return;
          case 2u:
            if ((v55 & 7) != 0)
            {
              unint64_t v56 = 0;
              unint64_t v57 = v8;
              goto LABEL_154;
            }
            if (v5) {
              strnlen((const char *)v8, v5);
            }
            else {
              strlen((const char *)v8);
            }
            char is_memory_immutable = _dyld_is_memory_immutable();
            unint64_t v63 = 0;
            unint64_t v56 = 0;
            unint64_t v61 = v8;
            unint64_t v57 = v8;
            if ((is_memory_immutable & 1) == 0) {
              goto LABEL_152;
            }
            goto LABEL_154;
          case 3u:
            unint64_t v56 = 0;
            if (!v5) {
              goto LABEL_156;
            }
            if ((v55 & 7) != 0)
            {
              unint64_t v57 = 0;
              goto LABEL_154;
            }
            unint64_t v61 = 0;
            goto LABEL_153;
          case 4u:
            if ((v55 & 0xF0) != 0x40) {
              goto LABEL_562;
            }
            char v59 = v211;
            if ((v55 & 2) != 0) {
              char v59 = 0;
            }
            goto LABEL_141;
          case 5u:
            if ((v55 & 7) != 0)
            {
              unint64_t v57 = 0;
              unint64_t v56 = v8;
            }
            else
            {
              if (v5) {
                wcsnlen((const __int32 *)v8, v5);
              }
              else {
                wcslen((const __int32 *)v8);
              }
              char v62 = _dyld_is_memory_immutable();
              unint64_t v61 = 0;
              unint64_t v57 = 0;
              unint64_t v63 = v8;
              unint64_t v56 = v8;
              if ((v62 & 1) == 0)
              {
LABEL_152:
                LOBYTE(v55) = *v50;
                unint64_t v56 = v63;
LABEL_153:
                *xpc_object_t v50 = v55 | 1;
                unint64_t v57 = v61;
              }
            }
            goto LABEL_154;
          case 8u:
            if ((v55 & 0xF0) != 0x80) {
              goto LABEL_561;
            }
            char v59 = 1;
LABEL_141:
            unsigned int v60 = _os_log_fmt_flatten_object_impl(v50, v231, v233, (void *)v8, v5, (uint64_t)&v246, (uint64_t)&v243, v54, v59);
            goto LABEL_155;
          default:
            _os_crash();
            __break(1u);
            goto LABEL_592;
        }
    }
  }
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  int v2 = type;
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v4 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v11 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v11, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v11 == v4) {
      _os_log_preferences_refresh_process();
    }
  }
  char v5 = BYTE8(xmmword_1EB1CF7F0);
  if ((WORD4(xmmword_1EB1CF7F0) & 0x100) != 0
    || (MEMORY[0xFFFFFC104] & 0x100) != 0
    || !byte_1EB1CF86F
    && ((WORD4(xmmword_1EB1CF7F0) & 0x400) != 0 || (MEMORY[0xFFFFFC104] & 0x400) != 0)
    && !_os_log_hook)
  {
    goto LABEL_36;
  }
  LOBYTE(v6) = 0;
  if (oslog && oslog != (os_log_t)&_os_log_disabled)
  {
    if (oslog[3].isa)
    {
      int isa = (int)oslog[6].isa;
      if (isa != dword_1EB1CF808)
      {
        int v13 = (int)oslog[6].isa;
        atomic_compare_exchange_strong_explicit((atomic_uint *volatile)&oslog[6], (unsigned int *)&v13, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
        if (v13 == isa)
        {
          _os_log_preferences_refresh(oslog);
          char v5 = BYTE8(xmmword_1EB1CF7F0);
        }
      }
    }
    if ((v5 & 8) == 0 && (MEMORY[0xFFFFFC104] & 8) == 0 && (voucher_get_activity_id() & 0x800000000000000) == 0
      || (HIDWORD(oslog[7].isa) & 7) == 4)
    {
      goto LABEL_19;
    }
    if ((byte_1EB1CF868 & 4) == 0)
    {
LABEL_54:
      int v12 = (HIDWORD(oslog[7].isa) >> 27) & 7;
      if (v12 == 1)
      {
        if ((v2 - 3) < 0xFFFFFFFE) {
          goto LABEL_73;
        }
      }
      else if (v12 == 3 || v12 == 2 && v2 != 2)
      {
        goto LABEL_73;
      }
LABEL_19:
      if (_os_log_hook)
      {
        if (_os_log_hook_level <= 1u)
        {
          if (_os_log_hook_level)
          {
            if (_os_log_hook_level == 1 && v2 != 2) {
              goto LABEL_73;
            }
          }
          else if ((v2 - 16) < 0xFFFFFFF1)
          {
            goto LABEL_73;
          }
        }
        else
        {
          if (_os_log_hook_level == 2) {
            goto LABEL_73;
          }
          if (_os_log_hook_level == 16)
          {
            if (v2 > 0xF) {
              goto LABEL_73;
            }
          }
          else if (_os_log_hook_level == 17 && v2 == 17)
          {
            goto LABEL_73;
          }
        }
      }
      int v8 = HIDWORD(oslog[7].isa) & 7;
      if (!v8) {
        int v8 = process_prefs_0 & 3;
      }
      if (v8 == 4)
      {
LABEL_36:
        LOBYTE(v6) = 0;
        return v6;
      }
      if (v2 == 2)
      {
        unsigned int v10 = v8 - 1;
        if (v10 < 3)
        {
          LOBYTE(v6) = (v10 & 7) == 2;
          return v6;
        }
        if ((BYTE8(xmmword_1EB1CF7F0) & 2) == 0 && (MEMORY[0xFFFFFC104] & 2) == 0) {
          return ((unint64_t)voucher_get_activity_id() >> 57) & 1;
        }
      }
      else if (v2 == 1)
      {
        unsigned int v9 = v8 - 1;
        if (v9 < 3)
        {
          LODWORD(v6) = (6u >> (v9 & 7)) & 1;
          return v6;
        }
        if ((BYTE8(xmmword_1EB1CF7F0) & 3) == 0 && (MEMORY[0xFFFFFC104] & 3) == 0)
        {
          LOBYTE(v6) = (voucher_get_activity_id() & 0x300000000000000) != 0;
          return v6;
        }
      }
LABEL_73:
      LOBYTE(v6) = 1;
      return v6;
    }
    if (v2 > 15)
    {
      if ((v2 - 16) >= 2) {
        goto LABEL_54;
      }
    }
    else if (v2)
    {
      if (v2 == 1)
      {
        if ((qword_1EB1CF860 & 0x100000000) != 0) {
          goto LABEL_73;
        }
      }
      else if (v2 == 2 && (qword_1EB1CF860 & 0x200000000) != 0)
      {
        goto LABEL_73;
      }
      goto LABEL_54;
    }
    if ((qword_1EB1CF860 & 0x800000000) != 0) {
      goto LABEL_73;
    }
    goto LABEL_54;
  }
  return v6;
}

void *_os_get_logging_unreliable_for_current_thread()
{
  if (_init_unreliable_thread_key_unreliable_once != -1) {
    dispatch_once(&_init_unreliable_thread_key_unreliable_once, &__block_literal_global_82);
  }
  return pthread_getspecific(_os_log_unreliable_thread_key);
}

uint64_t _os_log_invoke_callback(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t (**a5)(void *))
{
  char v5 = *a5;
  if (*a5)
  {
    uint64_t v9 = result;
    if (!*(void *)(a4 + 24)) {
      _os_log_impl_compose(*(char **)(result + 40), a4);
    }
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    v14[0] = 1;
    v14[1] = a2;
    if (a2)
    {
      uint64_t v10 = *(void *)(a2 + 24);
      uint64_t v11 = v10 + 4;
      if (!v10) {
        uint64_t v11 = 0;
      }
      *(void *)&long long v15 = v11;
      if (v10) {
        v10 += *(unsigned __int8 *)(v10 + 2) + 4;
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    uint64_t v13 = *(void *)(v9 + 32);
    uint64_t v12 = *(void *)(v9 + 40);
    *((void *)&v15 + 1) = v10;
    *(void *)&long long v16 = v12;
    *((void *)&v16 + 1) = **(void **)(a4 + 24);
    *(void *)&long long v17 = v13;
    BYTE8(v17) = a3 & 0x7F;
    return v5(v14);
  }
  return result;
}

xpc_object_t _os_log_preference_option_ttl(uint64_t a1, char *a2)
{
  xpc_object_t result = _os_log_preference_value(a1, a2, MEMORY[0x1E4F14D68]);
  if (result) {
    LOBYTE(result) = xpc_int64_get_value(result);
  }
  return (xpc_object_t)result;
}

uint64_t _os_log_preference_option(void **a1, const char *a2)
{
  uint64_t result = _os_log_option_for_key(a1[1], a2);
  if (!result)
  {
    char v5 = *a1;
    return _os_log_option_for_key(v5, a2);
  }
  return result;
}

uint64_t _os_log_option_for_key(void *a1, const char *a2)
{
  if (!a1) {
    return 0;
  }
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 0;
  }
  unsigned int v3 = value;
  if (object_getClass(value) != (Class)MEMORY[0x1E4F14D78]) {
    return 0;
  }
  string_ptr = xpc_string_get_string_ptr(v3);
  if (!strcasecmp(string_ptr, "default")) {
    return 1;
  }
  BOOL v6 = xpc_string_get_string_ptr(v3);
  if (!strcasecmp(v6, "info")) {
    return 2;
  }
  xpc_object_t v7 = xpc_string_get_string_ptr(v3);
  if (!strcasecmp(v7, "debug")) {
    return 3;
  }
  int v8 = xpc_string_get_string_ptr(v3);
  if (strcasecmp(v8, "off"))
  {
    uint64_t v9 = xpc_string_get_string_ptr(v3);
    if (strcasecmp(v9, "none")) {
      return 0;
    }
  }
  return 4;
}

const char *_os_log_fmt_flatten_NSCF(void *a1, char *a2, size_t a3, unsigned char *a4)
{
  BOOL v6 = a2;
  if (_NSCF_function)
  {
    if ((_NSCF_function(a1, a2, a3, a4) & 1) == 0)
    {
      *a4 = 0;
      return "<invalid NS/CF object>";
    }
  }
  else
  {
    Class = object_getClass(a1);
    *a4 = 0;
    if (!Class) {
      return "<invalid NS/CF object>";
    }
    uint64_t Name = class_getName(Class);
    snprintf(v6, a3, "<%s instance>", Name);
  }
  return v6;
}

void _os_log_impl_send_oversize(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, unsigned int a5, const void ***a6)
{
  if (off_1EB1CF7E8)
  {
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v12, "operation", 3uLL);
    xpc_dictionary_set_uuid(v12, "dsc_uuid", (const unsigned __int8 *)off_1EB1CF7E8 + 40);
    if (*(_WORD *)off_1EB1CF7E8) {
      xpc_dictionary_set_BOOL(v12, "32bits", 1);
    }
    xpc_dictionary_set_uint64(v12, "stream_id", a2);
    xpc_dictionary_set_uint64(v12, "message_id", a5);
    xpc_dictionary_set_data(v12, "commands", **a6, *((unsigned int *)*a6 + 2));
    xpc_dictionary_set_data(v12, "pubdata", *a6[1], *((unsigned int *)a6[1] + 2));
    xpc_dictionary_set_data(v12, "privdata", *a6[2], *((unsigned int *)a6[2] + 2));
    xpc_dictionary_set_uint64(v12, "ts", a4);
    if (a3) {
      xpc_dictionary_set_uint64(v12, "ttl", a3);
    }
    if (byte_1EB1CF872) {
      xpc_dictionary_set_BOOL(v12, "quarantined", 1);
    }
    if (a1)
    {
      uint64_t v13 = *(unsigned __int8 **)(a1 + 24);
      if (v13) {
        xpc_dictionary_set_data(v12, "subsystem", v13, v13[2] + (unint64_t)v13[3] + 4);
      }
    }
    size_t v14 = (void *)_os_trace_logd_send_with_reply();
    if (v14) {
      xpc_release(v14);
    }
    xpc_release(v12);
  }
}

_WORD *os_trace_blob_pwrite(_WORD *result, unsigned int a2, __int16 a3)
{
  if (a2 <= 1)
  {
    _os_assert_log();
    uint64_t result = (_WORD *)_os_crash();
    __break(1u);
  }
  else
  {
    *uint64_t result = a3;
  }
  return result;
}

void os_log_backtrace_serialize_to_blob(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F41887A8](a1);
  uint64_t v3 = v2;
  uint64_t v4 = v1;
  uint64_t v36 = *MEMORY[0x1E4F14BF8];
  uint64_t v5 = MEMORY[0x1F41887A8](v1);
  BOOL v6 = (char *)&v33 - ((v7 + 15) & 0x1FFFFFFF0);
  LODWORD(v7) = *(_DWORD *)(v5 + 8);
  if ((int)v7 < 1)
  {
    int v9 = 255;
  }
  else
  {
    uint64_t v33 = (uint64_t)&v33;
    uint64_t v8 = 0;
    int v9 = 255;
    do
    {
      if (uuid_is_null((const unsigned __int8 *)(*(void *)v4 + 20 * v8))) {
        goto LABEL_4;
      }
      if (v9 > 254) {
        goto LABEL_12;
      }
      int v10 = v9;
      uint64_t v11 = (const unsigned __int8 *)&v35[4 * v9 + 1];
      while (uuid_compare(v11, (const unsigned __int8 *)(*(void *)v4 + 20 * v8)))
      {
        ++v10;
        v11 += 16;
        if (v10 == 255) {
          goto LABEL_11;
        }
      }
      if (v10 != -1) {
        goto LABEL_13;
      }
LABEL_11:
      if (v9 < 1)
      {
LABEL_4:
        LOBYTE(v10) = -1;
      }
      else
      {
LABEL_12:
        uuid_copy((unsigned __int8 *)&v35[4 * --v9 + 1], (const unsigned __int8 *)(*(void *)v4 + 20 * v8));
        LOBYTE(v10) = v9;
      }
LABEL_13:
      v6[v8++] = v10;
      uint64_t v7 = *(int *)(v4 + 8);
    }
    while (v8 < v7);
  }
  LOBYTE(v35[0]) = 18;
  BYTE1(v35[0]) = -1 - v9;
  HIWORD(v35[0]) = v7;
  if ((*(unsigned char *)(v3 + 20) & 2) == 0)
  {
    uint64_t v12 = *(unsigned int *)(v3 + 8);
    if ((*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - v12 - 1) <= 3)
    {
      os_trace_blob_add_slow(v3, v35, 4uLL);
    }
    else
    {
      *(_DWORD *)(*(void *)v3 + v12) = v35[0];
      unsigned int v13 = *(_DWORD *)(v3 + 8) + 4;
      *(_DWORD *)(v3 + 8) = v13;
      if (!*(unsigned char *)(v3 + 22)) {
        *(unsigned char *)(*(void *)v3 + v13) = 0;
      }
    }
  }
  if ((*(_WORD *)(v3 + 20) & 2) == 0)
  {
    size_t v14 = &v35[4 * v9 + 1];
    size_t v15 = 16 * (255 - v9);
    uint64_t v16 = *(unsigned int *)(v3 + 8);
    if (v15 > (*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - v16 - 1))
    {
      os_trace_blob_add_slow(v3, v14, v15);
    }
    else
    {
      memcpy((void *)(*(void *)v3 + v16), v14, v15);
      unsigned int v17 = *(_DWORD *)(v3 + 8) + v15;
      *(_DWORD *)(v3 + 8) = v17;
      if (!*(unsigned char *)(v3 + 22)) {
        *(unsigned char *)(*(void *)v3 + v17) = 0;
      }
    }
  }
  LODWORD(v18) = *(_DWORD *)(v4 + 8);
  if ((int)v18 >= 1)
  {
    uint64_t v19 = 0;
    uint64_t v20 = 16;
    do
    {
      if ((*(_WORD *)(v3 + 20) & 2) == 0)
      {
        char v21 = (_DWORD *)(*(void *)v4 + v20);
        uint64_t v22 = *(unsigned int *)(v3 + 8);
        if ((*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - v22 - 1) <= 3)
        {
          os_trace_blob_add_slow(v3, v21, 4uLL);
        }
        else
        {
          *(_DWORD *)(*(void *)v3 + v22) = *v21;
          unsigned int v23 = *(_DWORD *)(v3 + 8) + 4;
          *(_DWORD *)(v3 + 8) = v23;
          if (!*(unsigned char *)(v3 + 22)) {
            *(unsigned char *)(*(void *)v3 + v23) = 0;
          }
        }
      }
      ++v19;
      uint64_t v18 = *(int *)(v4 + 8);
      v20 += 20;
    }
    while (v19 < v18);
    if ((int)v18 >= 1)
    {
      for (uint64_t i = 0; i < v18; ++i)
      {
        char v25 = &v6[i];
        int v26 = v6[i];
        if (v26 != 255)
        {
          LOBYTE(v26) = v26 - v9;
          *char v25 = v26;
        }
        if ((*(_WORD *)(v3 + 20) & 2) == 0)
        {
          uint64_t v27 = *(unsigned int *)(v3 + 8);
          if (*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - 1 == v27)
          {
            os_trace_blob_add_slow(v3, v25, 1uLL);
          }
          else
          {
            *(unsigned char *)(*(void *)v3 + v27) = v26;
            unsigned int v28 = *(_DWORD *)(v3 + 8) + 1;
            *(_DWORD *)(v3 + 8) = v28;
            if (!*(unsigned char *)(v3 + 22)) {
              *(unsigned char *)(*(void *)v3 + v28) = 0;
            }
          }
        }
        uint64_t v18 = *(int *)(v4 + 8);
      }
    }
  }
  int v29 = v18 & 3;
  if (v29)
  {
    int v34 = 0;
    if ((*(_WORD *)(v3 + 20) & 2) == 0)
    {
      size_t v30 = (4 - v29);
      uint64_t v31 = *(unsigned int *)(v3 + 8);
      if (*(char *)(v3 + 22) + *(_DWORD *)(v3 + 12) - (int)v31 - 1 < v30)
      {
        os_trace_blob_add_slow(v3, &v34, v30);
      }
      else
      {
        memcpy((void *)(*(void *)v3 + v31), &v34, v30);
        unsigned int v32 = *(_DWORD *)(v3 + 8) + v30;
        *(_DWORD *)(v3 + 8) = v32;
        if (!*(unsigned char *)(v3 + 22)) {
          *(unsigned char *)(*(void *)v3 + v32) = 0;
        }
      }
    }
  }
}

void _os_state_request_for_self(uint64_t a1, long long *a2, char a3, uint64_t a4)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v8 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v9 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v9, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v9 == v8) {
      _os_log_preferences_refresh_process();
    }
  }
  if ((BYTE9(xmmword_1EB1CF7F0) & 5) == 0
    && (MEMORY[0xFFFFFC104] & 0x500) == 0
    && off_1EB1CF7E8
    && dword_1EB1CF804 == -1
    && dword_1EB1CF7DC)
  {
    os_unfair_lock_lock_with_options();
    if (byte_1EB1CF7D8)
    {
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB1CF7C8);
    }
    else
    {
      byte_1EB1CF7D8 = 1;
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB1CF7C8);
      long long v11 = *a2;
      uint64_t v12 = *((void *)a2 + 2);
      uint64_t v13 = a4;
      v10[0] = MEMORY[0x1E4F14BE8];
      v10[1] = 0x40000000;
      v10[2] = ___os_state_request_for_self_block_invoke;
      v10[3] = &__block_descriptor_tmp_381;
      char v14 = a3;
      v10[4] = a1;
      dispatch_async((dispatch_queue_t)qword_1EB1CF7D0, v10);
    }
  }
}

unint64_t _os_log_impl_compose(char *__s, uint64_t a2)
{
  *(void *)(a2 + 48) = a2 + 76;
  *(void *)(a2 + 56) = 0x100000000;
  *(_WORD *)(a2 + 68) = 0;
  *(unsigned char *)(a2 + 70) = 0;
  *(_DWORD *)(a2 + 64) = 0x10000;
  *(void *)(a2 + 24) = a2 + 48;
  return os_log_fmt_compose(a2 + 48, __s, 2, 3u, 8, **(unsigned __int8 ***)a2, **(void **)(a2 + 8), *(unsigned __int16 *)(*(void *)(a2 + 8) + 8), **(void **)(a2 + 16), *(_DWORD *)(*(void *)(a2 + 16) + 8));
}

BOOL _os_trace_lazy_init_completed_4libxpc()
{
  return _os_trace != 0;
}

void _os_signpost_emit_unreliably_with_name_impl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __os_signpost_emit_impl(a1, a2, a3, a4, a5, a6, a7, a8, v8);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  __os_signpost_emit_impl((uint64_t)dso, (uint64_t)log, type, spid, (uint64_t)name, (uint64_t)format, (uint64_t)buf, *(uint64_t *)&size, v8);
}

void __os_signpost_emit_impl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16 = a4;
  uint64_t v17 = 0;
  long long v10 = 0u;
  uint64_t v11 = 0;
  uint64_t v12 = a1;
  uint64_t v13 = a9;
  uint64_t v14 = a6;
  uint64_t v15 = a5;
  __error();
  if (((*(_DWORD *)(a2 + 60) >> 20) & 3) == 0 && (BYTE8(xmmword_1EB1CF7F0) & 4) == 0 && (MEMORY[0xFFFFFC104] & 4) == 0) {
    voucher_get_activity_id();
  }
  _os_log_impl_flatten_and_send((uint64_t)&v10);
}

void *_os_trace_malloc(size_t size)
{
  while (1)
  {
    uint64_t result = malloc_type_malloc(size, 0x91D685AAuLL);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  uint64_t v5 = -3;
  if (activity != (os_activity_t)&_os_activity_current) {
    uint64_t v5 = (uint64_t)activity;
  }
  if (activity == (os_activity_t)&_os_activity_none) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = v5;
  }
  return (os_activity_t)_os_activity_create_addr((unint64_t)dso, (uint64_t)description, v6, flags, v4);
}

void os_log_with_args(NSObject *a1, char a2, char *a3, _DWORD *a4, void (*a5)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6))
{
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  if (*((void *)activity_block + 2)) {
    uint64_t v4 = (void (*)(uint64_t))*((void *)activity_block + 2);
  }
  else {
    uint64_t v4 = 0;
  }
  _os_activity_initiate_impl((unint64_t)dso, (uint64_t)description, flags, (uint64_t)activity_block, v4);
}

void os_log_pack_send(uint64_t a1)
{
}

void *_os_trace_memdup(const void *a1, size_t size)
{
  while (1)
  {
    uint64_t v4 = malloc_type_malloc(size, 0x91D685AAuLL);
    if (v4) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }

  return memcpy(v4, a1, size);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  uint64_t activity_id = voucher_get_activity_id();
  if (activity_id && activity_id != state->opaque[0])
  {
    _os_assumes_log_ctx();
    uint64_t v3 = (void *)state->opaque[1];
  }
  else
  {
    uint64_t v3 = (void *)voucher_adopt();
  }
  os_release(v3);
  state->opaque[0] = 0;
  state->opaque[1] = 0;
}

uint64_t _os_trace_prefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
  }
  return _os_trace_preferences_path;
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  if (activity == (os_activity_t)&_os_activity_current)
  {
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OS_ACTIVITY_CURRENT passed";
    __break(1u);
  }
  else
  {
    if (activity != (os_activity_t)&_os_activity_none) {
      os_retain(activity);
    }
    state->opaque[0] = voucher_get_activity_id();
    state->opaque[1] = voucher_adopt();
  }
}

uint64_t _os_log_pack_fill(uint64_t result, unint64_t a2, __int16 a3, uint64_t a4, uint64_t a5)
{
  *(void *)uint64_t result = 0;
  *(void *)(result + 8) = 0;
  *(void *)(result + 16) = 0;
  *(void *)(result + 24) = a4;
  *(void *)(result + 32) = v5;
  *(void *)(result + 40) = a5;
  if (a2 >= 0x10000)
  {
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Absurdly large size";
    qword_1E9450118 = a2;
    __break(1u);
  }
  else
  {
    *(void *)(result + 48) = 0;
    *(void *)(result + 56) = 0;
    *(_WORD *)(result + 64) = a3;
    *(_WORD *)(result + 66) = a2 - 72;
    result += 68;
  }
  return result;
}

uint64_t ___os_log_preferences_merge_block_invoke(uint64_t a1, char *key)
{
  return 1;
}

void _os_log_preferences_merge_category(void *a1, xpc_object_t xdict, char *key)
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, key);
  if (dictionary)
  {
    uint64_t v6 = dictionary;
    xpc_object_t v7 = xpc_dictionary_get_dictionary(a1, key);
    if (v7)
    {
      _os_log_preferences_apply_overrides(v7, v6);
    }
    else
    {
      xpc_dictionary_set_value(a1, key, v6);
    }
  }
}

uint64_t _os_log_preferences_apply_overrides(void *a1, void *a2)
{
  if (a1 == a2)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  else
  {
    uint64_t result = (uint64_t)object_getClass(a1);
    if (a2)
    {
      uint64_t v5 = MEMORY[0x1E4F14D40];
      if (result == MEMORY[0x1E4F14D40])
      {
        uint64_t result = (uint64_t)object_getClass(a2);
        if (result == v5)
        {
          applier[0] = MEMORY[0x1E4F14BE8];
          applier[1] = 0x40000000;
          applier[2] = ___os_log_preferences_apply_overrides_block_invoke;
          applier[3] = &__block_descriptor_tmp_32_223;
          applier[4] = a1;
          return xpc_dictionary_apply(a2, applier);
        }
      }
    }
  }
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  _os_log((uint64_t)dso, (uint64_t)log, type, (uint64_t)format, (uint64_t)buf, *(uint64_t *)&size, v6);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  if (*((void *)block + 2)) {
    uint64_t v2 = (void (__cdecl *)(void *))*((void *)block + 2);
  }
  else {
    uint64_t v2 = 0;
  }
  os_activity_apply_f(activity, block, v2);
}

void _os_trace_formatters_list()
{
  uint64_t v23 = *MEMORY[0x1E4F14BF8];
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  uint64_t v0 = getenv("OS_ACTIVITY_FORMATTER");
  if (!v0 || strcmp(v0, "disable"))
  {
    uint64_t v1 = 0;
    char v2 = 1;
    do
    {
      char v3 = v2;
      uint64_t v4 = opendir((&plugin_dirs)[2 * v1]);
      uint64_t v5 = v4;
      if (v4)
      {
        for (uint64_t i = readdir(v4); i; uint64_t i = readdir(v5))
        {
          if (i->d_type == 8)
          {
            xpc_object_t v7 = _os_trace_formatter_record((char *)v18[3], i->d_name, v1, v14 + 3, v10 + 3);
            v18[3] = (uint64_t)v7;
          }
        }
        closedir(v5);
      }
      char v2 = 0;
      uint64_t v1 = 1;
    }
    while ((v3 & 1) != 0);
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    if (_dyld_get_shared_cache_uuid()) {
      dyld_shared_cache_iterate_text();
    }
    qsort_b((void *)v18[3], v14[3], 0x28uLL, &__block_literal_global_62);
    uint64_t v8 = v14[3];
    _formatters = v18[3];
    qword_1EB1CF8C8 = v8;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
}

void sub_19DC822DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

char *___os_trace_formatters_list_block_invoke(char *result, uint64_t a2)
{
  char v3 = result;
  char v4 = 0;
  uint64_t v5 = 0;
  char v6 = 1;
  do
  {
    char v7 = v6;
    if ((v4 & 1) != 0 || !v3[56])
    {
      size_t v8 = strlen((&plugin_dirs)[2 * v5]);
      uint64_t v9 = *(const char **)(a2 + 40);
      uint64_t result = (char *)strncmp(v9, (&plugin_dirs)[2 * v5], v8);
      if (!result)
      {
        uint64_t result = _os_trace_formatter_record(*(char **)(*(void *)(*((void *)v3 + 4) + 8) + 24), (char *)&v9[v8], v5, (uint64_t *)(*(void *)(*((void *)v3 + 5) + 8) + 24), (void *)(*(void *)(*((void *)v3 + 6) + 8) + 24));
        *(void *)(*(void *)(*((void *)v3 + 4) + 8) + 24) = result;
      }
    }
    char v6 = 0;
    char v4 = 1;
    uint64_t v5 = 1;
  }
  while ((v7 & 1) != 0);
  return result;
}

char *_os_trace_formatter_record(char *a1, char *__s1, uint64_t a3, uint64_t *a4, void *a5)
{
  if (!strncmp(__s1, "liblog_", 7uLL) && !strchr(__s1, 47))
  {
    uint64_t v11 = strrchr(__s1, 46);
    if (v11)
    {
      uint64_t v12 = v11;
      if (!strcmp(v11, ".dylib"))
      {
        uint64_t v13 = strndup(__s1 + 7, v12 - (__s1 + 7));
        uint64_t v14 = *a4;
        if (*a4)
        {
          uint64_t v15 = 8;
          uint64_t v16 = *a4;
          while (strcasecmp(*(const char **)&a1[v15], v13))
          {
            v15 += 40;
            if (!--v16) {
              goto LABEL_10;
            }
          }
          free(v13);
        }
        else
        {
LABEL_10:
          if (v14 == *a5)
          {
            *a5 = v14 + 8;
            a1 = (char *)_os_trace_realloc(a1, 40 * (v14 + 8));
            uint64_t v14 = *a4;
          }
          *a4 = v14 + 1;
          uint64_t v17 = &a1[40 * v14];
          *(void *)uint64_t v17 = 0;
          *((void *)v17 + 1) = v13;
          *((void *)v17 + 3) = 0;
          *((void *)v17 + 4) = 0;
          *((void *)v17 + 2) = a3;
        }
      }
    }
  }
  return a1;
}

void *_os_trace_realloc(void *ptr, size_t size)
{
  while (1)
  {
    uint64_t result = malloc_type_realloc(ptr, size, 0x543E7918uLL);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

void _os_signpost_pack_send(uint64_t a1)
{
}

uint64_t ___os_log_preferences_apply_overrides_block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), a2);
  if (!value) {
    goto LABEL_5;
  }
  xpc_object_t v7 = value;
  if (object_getClass(value) == (Class)MEMORY[0x1E4F14D40])
  {
    _os_log_preferences_apply_overrides(v7, a3);
    return 1;
  }
  if (object_getClass(a3) != (Class)MEMORY[0x1E4F14D78]
    || (string_ptr = xpc_string_get_string_ptr(a3), strcasecmp(string_ptr, "inherit")))
  {
LABEL_5:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  }
  return 1;
}

void _os_trace_scandir_free_namelist(int a1, void **a2)
{
  if (a1 >= 1)
  {
    unint64_t v3 = a1 + 1;
    do
      free(a2[(v3-- - 2)]);
    while (v3 > 1);
  }

  free(a2);
}

uint64_t ___os_trace_formatters_list_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return strcasecmp(*(const char **)(a2 + 8), *(const char **)(a3 + 8));
}

void *_os_trace_get_boot_uuid()
{
  if (_os_trace_get_boot_uuid_once != -1) {
    dispatch_once_f(&_os_trace_get_boot_uuid_once, &_os_trace_get_boot_uuid_uuid_str, (dispatch_function_t)_os_trace_get_boot_uuid_slow);
  }
  return &_os_trace_get_boot_uuid_uuid_str;
}

uint64_t _os_trace_write(int __fd, uint64_t a2, size_t __nbyte)
{
  if (__nbyte)
  {
    size_t v3 = __nbyte;
    uint64_t v6 = 0;
    while (1)
    {
      ssize_t v7 = write(__fd, (const void *)(a2 + v6), v3);
      if (v7 < 0)
      {
        int v8 = *__error();
        if (v8 != 4)
        {
          _os_trace_undo_write(__fd, v6, v8);
          return -1;
        }
      }
      else
      {
        v6 += v7;
        v3 -= v7;
      }
      if (!v3) {
        return v6;
      }
    }
  }
  return 0;
}

os_activity_id_t os_activity_get_identifier(os_activity_t activity, os_activity_id_t *parent_id)
{
  return voucher_get_activity_id();
}

void os_activity_apply_f(os_activity_t activity, void *context, os_function_t function)
{
  if (activity == (os_activity_t)&_os_activity_current)
  {
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: OS_ACTIVITY_CURRENT passed";
    __break(1u);
  }
  else
  {
    if (activity != (os_activity_t)&_os_activity_none) {
      os_retain(activity);
    }
    voucher_adopt();
    ((void (*)(void *))function)(context);
    uint64_t v5 = (void *)voucher_adopt();
    os_release(v5);
  }
}

char *_os_log_send_and_compose_impl(char a1, void *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    *a2 = a8;
  }
  uint64_t v21 = 0;
  long long v15 = 0u;
  uint64_t v16 = 0;
  uint64_t v17 = a5;
  uint64_t v18 = v8;
  uint64_t v19 = a8;
  long long v20 = 0uLL;
  __error();
  char v14 = 0;
  if (a3) {
    uint64_t v11 = a3;
  }
  else {
    uint64_t v11 = &v14;
  }
  uint64_t v13 = v11;
  _os_log_impl_flatten_and_send((uint64_t)&v15);
  uint64_t result = 0;
  if ((a1 & 2) != 0)
  {
    uint64_t result = v13;
    if (v13 == &v14)
    {
      while (1)
      {
        uint64_t result = strdup((const char *)&unk_19DC93A71);
        if (result) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }
    }
  }
  return result;
}

uint64_t os_log_shim_enabled(uint64_t a1)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if ((BYTE11(xmmword_1EB1CF7F0) & 0x60) != 0 || (MEMORY[0xFFFFFC104] & 0x60000000) != 0) {
    return 0;
  }
  if (!a1 || !dyld_image_header_containing_address()) {
    return 1;
  }

  return dyld_sdk_at_least();
}

uint64_t _os_trace_is_development_build()
{
  if ((MEMORY[0xFFFFFC104] & 0x80000000) != 0) {
    return 0;
  }
  else {
    return (MEMORY[0xFFFFFC104] >> 28) & 1;
  }
}

uint64_t _os_trace_mmap_at(int a1, const char *a2, int a3, size_t *a4)
{
  int v5 = openat(a1, a2, a3 | 0x1000004);
  if (v5 < 0) {
    goto LABEL_8;
  }
  int v6 = v5;
  ssize_t v7 = _os_trace_mmap(v5, a4);
  if (!v7)
  {
    int v11 = *__error();
    if (close(v6) == -1)
    {
      int v12 = *__error();
      uint64_t result = *__error();
      if (v12 == 9) {
        goto LABEL_13;
      }
      _os_assumes_log();
    }
    *__error() = v11;
LABEL_8:
    uint64_t v8 = 0;
    *a4 = 0;
    return (uint64_t)v8;
  }
  uint64_t v8 = v7;
  if (close(v6) != -1) {
    return (uint64_t)v8;
  }
  int v9 = *__error();
  uint64_t result = *__error();
  if (v9 != 9)
  {
    _os_assumes_log();
    return (uint64_t)v8;
  }
  qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E9450118 = result;
  __break(1u);
LABEL_13:
  qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E9450118 = result;
  __break(1u);
  return result;
}

void *_os_trace_mmap(int a1, size_t *a2)
{
  size_t v4 = lseek(a1, 0, 2);
  if ((v4 & 0x8000000000000000) != 0) {
    goto LABEL_4;
  }
  size_t v5 = v4;
  if (!v4)
  {
    int v7 = 34;
    goto LABEL_6;
  }
  uint64_t result = mmap(0, v4, 1, 8194, a1, 0);
  if ((unint64_t)result + 1 <= 1)
  {
LABEL_4:
    int v7 = *__error();
LABEL_6:
    uint64_t v8 = __error();
    size_t v5 = 0;
    uint64_t result = 0;
    int *v8 = v7;
  }
  *a2 = v5;
  return result;
}

void *_os_trace_zalloc(size_t size)
{
  while (1)
  {
    uint64_t result = malloc_type_calloc(1uLL, size, 0x86D6D554uLL);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

uint64_t _os_trace_sysprefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
  }
  return _os_trace_system_preferences_path;
}

uint64_t _os_trace_os_cryptex_sysprefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
  }
  return _os_trace_os_cryptex_system_preferences_path;
}

uint64_t _os_trace_app_cryptex_sysprefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
  }
  return _os_trace_app_cryptex_system_preferences_path;
}

size_t _os_signpost_pack_fill(size_t result, unint64_t a2, __int16 a3, uint64_t a4, char *a5, char *__s, uint64_t a7)
{
  uint64_t v13 = result;
  if (!a5)
  {
    uint64_t result = strlen(__s);
    a5 = &__s[result];
  }
  *(void *)uint64_t v13 = 0;
  *(void *)(v13 + 8) = 0;
  *(void *)(v13 + 16) = 0;
  *(void *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v7;
  *(void *)(v13 + 40) = a5;
  if (a2 >= 0x10000)
  {
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Absurdly large size";
    qword_1E9450118 = a2;
    __break(1u);
  }
  else
  {
    *(void *)(v13 + 48) = __s;
    *(void *)(v13 + 56) = a7;
    *(_WORD *)(v13 + 64) = a3;
    *(_WORD *)(v13 + 66) = a2 - 72;
    return v13 + 68;
  }
  return result;
}

void *_os_log_set_nscf_formatter(void *result)
{
  _NSCF_function = result;
  return result;
}

uint64_t _os_trace_writev(int a1, iovec *a2, uint64_t a3)
{
  uint64_t v6 = 0;
  int v7 = 0;
  uint64_t v8 = a2;
  while (2)
  {
    if ((int)a3 - v7 >= 1024) {
      int v9 = 1024;
    }
    else {
      int v9 = a3 - v7;
    }
    uint64_t v10 = v7;
    while (1)
    {
      ssize_t v11 = writev(a1, &v8[v7], v9);
      if ((v11 & 0x8000000000000000) == 0) {
        break;
      }
      if (*__error() != 4)
      {
        if (v8 != a2) {
          free(v8);
        }
        if (v6)
        {
          long long v20 = __error();
          _os_trace_undo_write(a1, v6, *v20);
        }
        return -1;
      }
    }
    unint64_t v12 = v11;
    v6 += v11;
    if ((int)a3 > v7)
    {
      p_iov_len = &v8[v7].iov_len;
      while (1)
      {
        size_t v14 = *p_iov_len;
        p_iov_len += 2;
        unint64_t v15 = v12 - v14;
        if (v12 < v14) {
          break;
        }
        ++v10;
        unint64_t v12 = v15;
        if ((int)a3 == v10) {
          goto LABEL_29;
        }
      }
      int v7 = v10;
    }
    uint64_t v16 = (a3 - v7);
    if (a3 != v7)
    {
      if (v8 == a2 && v12)
      {
        while (1)
        {
          uint64_t v17 = (iovec *)malloc_type_malloc(16 * (int)v16, 0x91D685AAuLL);
          if (v17) {
            break;
          }
          _os_trace_temporary_resource_shortage();
        }
        uint64_t v8 = v17;
        memcpy(v17, &a2[v7], 16 * (int)v16);
        int v7 = 0;
      }
      else
      {
        uint64_t v16 = a3;
      }
      uint64_t v18 = &v8[v7];
      unint64_t v19 = v18->iov_len - v12;
      v18->iov_base = (char *)v18->iov_base + v12;
      v18->iov_len = v19;
      a3 = v16;
      continue;
    }
    break;
  }
LABEL_29:
  if (v8 != a2) {
    free(v8);
  }
  return v6;
}

void os_log_shim_with_CFString(void (*a1)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6), NSObject *a2, int a3, void *a4, _DWORD *a5)
{
  ssize_t v11 = (char *)[a4 _fastCStringContents:1];
  if (!a1) {
    a1 = v5;
  }
  if (a3 == 4) {
    char v12 = 1;
  }
  else {
    char v12 = 2 * (a3 == 2);
  }

  _os_log_with_args_impl(a2, v12, v11, a5, a1, a4);
}

uint64_t _os_trace_fdscandir_b(int a1, void *a2, uint64_t a3, void *a4)
{
  int v7 = dup(a1);
  if (v7 == -1)
  {
    __error();
    _os_assumes_log();
LABEL_25:
    *a2 = 0;
    return 0xFFFFFFFFLL;
  }
  int v8 = v7;
  if (lseek(v7, 0, 0) == -1)
  {
    __error();
    _os_assumes_log();
  }
  int v9 = fdopendir(v8);
  if (v9)
  {
    uint64_t v10 = v9;
    int v24 = a2;
    while (1)
    {
      ssize_t v11 = malloc_type_malloc(0x100uLL, 0x91D685AAuLL);
      if (v11) {
        break;
      }
      _os_trace_temporary_resource_shortage();
    }
    char v12 = v11;
    rewinddir(v10);
    size_t v13 = 0;
    unint64_t v14 = 32;
    while (1)
    {
      unint64_t v15 = readdir(v10);
      if (!v15) {
        break;
      }
      uint64_t v16 = (unsigned __int16 *)v15;
      if (!a3 || (*(unsigned int (**)(uint64_t, dirent *))(a3 + 16))(a3, v15))
      {
        size_t v17 = v16[9] + 22;
        while (1)
        {
          uint64_t v18 = malloc_type_malloc(v17, 0x91D685AAuLL);
          if (v18) {
            break;
          }
          _os_trace_temporary_resource_shortage();
        }
        unint64_t v19 = v18;
        memcpy(v18, v16, v17);
        if (v13 >= v14)
        {
          long long v20 = malloc_type_realloc(v12, 16 * v14, 0x2004093837F09uLL);
          if (!v20)
          {
            free(v19);
            closedir(v10);
            _os_trace_scandir_free_namelist(v13, (void **)v12);
            *int v24 = 0;
            return 0xFFFFFFFFLL;
          }
          v14 *= 2;
          char v12 = v20;
        }
        *((void *)v12 + v13++) = v19;
      }
    }
    closedir(v10);
    if (a4 && v13) {
      qsort_b(v12, v13, 8uLL, a4);
    }
    *int v24 = v12;
    return v13;
  }
  int v21 = *__error();
  if (close(v8) != -1)
  {
LABEL_24:
    *__error() = v21;
    goto LABEL_25;
  }
  int v23 = *__error();
  uint64_t result = *__error();
  if (v23 != 9)
  {
    _os_assumes_log();
    goto LABEL_24;
  }
  qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E9450118 = result;
  __break(1u);
  return result;
}

void _os_trace_dylib_or_main_executable_was_loaded(_DWORD *a1)
{
  uint64_t v25 = *MEMORY[0x1E4F14BF8];
  char v2 = (atomic_uint *)off_1EB1CF7E8;
  size_t v3 = (const char *)dyld_image_path_containing_address();
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v24 = 0;
    memset(v23, 0, sizeof(v23));
    size_t v5 = strlen(v3);
    uint64_t v6 = (void *)((char *)v23 - ((MEMORY[0x1F41887A8]() + 48) & 0xFFFFFFFFFFFFFFF0));
    bzero(v6, v5 + 33);
    v6[2] = a1;
    uint64_t image_info = _os_trace_get_image_info(a1, 0, (unsigned __int8 *)v6, (uint64_t)v23, 1);
    v6[3] = image_info;
    if (image_info)
    {
      memcpy(v6 + 4, v4, v5 + 1);
      if (LOBYTE(v23[0]))
      {
        __int16 v8 = *(_WORD *)v2;
        if ((*(_WORD *)v2 & 4) == 0)
        {
          if ((v8 & 2) == 0)
          {
            if (voucher_activity_should_send_strings()) {
              __int16 v9 = 2;
            }
            else {
              __int16 v9 = 4;
            }
            __int16 v8 = *(_WORD *)v2 | v9;
            *(_WORD *)char v2 = v8;
          }
          if ((v8 & 2) != 0) {
            _os_trace_send_sections_to_logd((uint64_t)v6, (uint64_t)a1, (uint64_t)v23);
          }
        }
      }
      if (a1[3] != 2)
      {
        if (BYTE1(v23[0]))
        {
          int v10 = 0;
          uint64_t v11 = (uint64_t)(v2 + 2);
          uint64_t v12 = *((void *)&v23[0] + 1);
          atomic_compare_exchange_strong_explicit(v2 + 2, (unsigned int *)&v10, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
          if (v10) {
            os_unfair_lock_lock_with_options();
          }
          uint64_t v13 = *((void *)v2 + 2);
          uint64_t v14 = *(unsigned __int16 *)(v13 + 10);
          uint64_t v15 = v13;
          if (3 * (int)v14 < 4 * *(unsigned __int16 *)(v13 + 8))
          {
            size_t v16 = (32 * v14) | 0x10;
            while (1)
            {
              size_t v17 = malloc_type_calloc(1uLL, v16, 0x478C0A82uLL);
              if (v17) {
                break;
              }
              _os_trace_temporary_resource_shortage();
            }
            uint64_t v15 = (uint64_t)v17;
            v17[5] = 2 * *(_WORD *)(v13 + 10);
            *((unsigned char *)v17 + 12) = 1;
            unsigned int v18 = *(unsigned __int16 *)(v13 + 10);
            if (*(_WORD *)(v13 + 10))
            {
              unint64_t v19 = 0;
              long long v20 = (uint64_t *)(v13 + 24);
              do
              {
                unint64_t v21 = *(v20 - 1);
                if (v21) {
                  BOOL v22 = v21 == -1;
                }
                else {
                  BOOL v22 = 1;
                }
                if (!v22)
                {
                  _os_trace_mh_map_insert_impl(0, v21, *v20, v15);
                  unsigned int v18 = *(unsigned __int16 *)(v13 + 10);
                }
                ++v19;
                v20 += 2;
              }
              while (v19 < v18);
            }
          }
          _os_trace_mh_map_insert_impl(v11, (unint64_t)a1, v12, v15);
        }
        mach_continuous_time();
        voucher_activity_trace();
      }
    }
  }
  else
  {
    _os_trace_log_simple("no path for address %p", a1);
  }
}

uint64_t _os_trace_get_image_info(_DWORD *a1, unint64_t a2, uuid_t uu, uint64_t a4, char a5)
{
  uint64_t v55 = 0;
  unint64_t v56 = &v55;
  uint64_t v57 = 0x2000000000;
  char v58 = 0;
  uint64_t v51 = 0;
  unsigned int v52 = &v51;
  uint64_t v53 = 0x2000000000;
  char v54 = 0;
  uint64_t v47 = 0;
  size_t v48 = &v47;
  uint64_t v49 = 0x2000000000;
  uint64_t v50 = 0;
  uint64_t v43 = 0;
  unsigned int v44 = &v43;
  uint64_t v45 = 0x2000000000;
  uint64_t v46 = 0;
  if (a4)
  {
    *(void *)(a4 + 48) = 0;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)a4 = 0u;
    *(unsigned char *)(a4 + 1) = _dyld_is_memory_immutable() ^ 1;
  }
  v42[0] = MEMORY[0x1E4F14BE8];
  v42[1] = 0x40000000;
  v42[2] = ___os_trace_get_image_info_block_invoke;
  v42[3] = &unk_1E5984258;
  v42[4] = &v43;
  v42[5] = a4;
  v33[0] = MEMORY[0x1E4F14BE8];
  v33[1] = 0x40000000;
  int v34 = ___os_trace_get_image_info_block_invoke_2;
  unsigned int v35 = &unk_1E5984280;
  unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v40 = uu;
  uint64_t v41 = a4;
  uint64_t v36 = v42;
  unsigned int v37 = &v55;
  uint64_t v38 = &v47;
  char v39 = &v51;
  if (a2 <= 3 && (a5 & 1) == 0) {
    goto LABEL_14;
  }
  if (*a1 != -17958194)
  {
    if (*a1 == -17958193 && ((a5 & 1) != 0 || a2 >= 0x20 && a2 - 32 >= a1[5]))
    {
      int v10 = a1 + 8;
      char v31 = 1;
      goto LABEL_37;
    }
LABEL_14:
    int v11 = 88;
    goto LABEL_15;
  }
  if ((a5 & 1) == 0 && (a2 < 0x1C || a2 - 28 < a1[5])) {
    goto LABEL_14;
  }
  char v31 = 0;
  int v10 = a1 + 7;
LABEL_37:
  int v19 = 0;
  unsigned int v20 = a1[4];
  BOOL v21 = v20 == 0;
  if (v20)
  {
    unint64_t v22 = a1[5];
    if (v22 >= 8)
    {
      unsigned int v23 = 1;
      unsigned int v32 = uu;
      while (1)
      {
        unint64_t v24 = v10[1];
        BOOL v16 = v22 >= v24;
        v22 -= v24;
        if (!v16) {
          goto LABEL_14;
        }
        int v19 = 0;
        int v25 = *v10;
        if ((int)*v10 > 26) {
          break;
        }
        switch(v25)
        {
          case 1:
            BOOL v26 = v24 >= 0x38;
            char v27 = v31;
            break;
          case 12:
            goto LABEL_50;
          case 25:
            BOOL v26 = v24 >= 0x48;
            char v27 = v31 ^ 1;
            break;
          default:
            goto LABEL_68;
        }
        if (!v26) {
          char v27 = 1;
        }
        if (v27) {
          goto LABEL_77;
        }
        if (strcmp((const char *)v10 + 8, "__TEXT")
          && strcmp((const char *)v10 + 8, "__CTF")
          && strcmp((const char *)v10 + 8, "__OS_LOG"))
        {
          int v19 = 0;
          goto LABEL_68;
        }
LABEL_67:
        int v19 = v34(v33, (uint64_t)v10);
LABEL_68:
        if (v19) {
          BOOL v30 = 1;
        }
        else {
          BOOL v30 = v23 >= v20;
        }
        BOOL v21 = v30;
        if (v22 < 8)
        {
          uu = v32;
          goto LABEL_79;
        }
        int v10 = (_DWORD *)((char *)v10 + v24);
        ++v23;
        uu = v32;
        if (v21) {
          goto LABEL_79;
        }
      }
      if (v25 == 44)
      {
        char v28 = v31;
        if (v24 <= 0x17) {
          char v28 = 0;
        }
        if ((v28 & 1) == 0)
        {
LABEL_77:
          int v11 = 88;
          uu = v32;
          goto LABEL_15;
        }
        goto LABEL_67;
      }
      if (v25 == 33)
      {
        char v29 = v31;
        if (v24 < 0x14) {
          char v29 = 1;
        }
        if (v29) {
          goto LABEL_77;
        }
        goto LABEL_67;
      }
      if (v25 != 27) {
        goto LABEL_68;
      }
LABEL_50:
      if (v24 < 0x18) {
        goto LABEL_77;
      }
      goto LABEL_67;
    }
  }
LABEL_79:
  if (v21) {
    int v11 = v19;
  }
  else {
    int v11 = 88;
  }
LABEL_15:
  if (a4)
  {
    if (*((unsigned char *)v52 + 24) && !*(_DWORD *)(a4 + 32))
    {
      *(void *)(a4 + 32) = v44[3];
      if ((a5 & 1) == 0)
      {
LABEL_19:
        for (uint64_t i = 0; i != 40; i += 8)
        {
          unint64_t v13 = *(unsigned int *)(a4 + i + 20);
          if (v13)
          {
            unint64_t v14 = *(unsigned int *)(a4 + i + 16);
            BOOL v16 = a2 >= v14;
            unint64_t v15 = a2 - v14;
            BOOL v16 = v16 && v15 >= v13;
            if (!v16) {
              goto LABEL_34;
            }
          }
        }
      }
    }
    else if ((a5 & 1) == 0)
    {
      goto LABEL_19;
    }
  }
  if (v11 != 89 && v11 || !*((unsigned char *)v56 + 24) || (uint64_t v17 = v48[3]) == 0)
  {
    uuid_clear(uu);
LABEL_34:
    uint64_t v17 = 0;
  }
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  return v17;
}

uint64_t ___os_trace_get_image_info_block_invoke_2(void *a1, uint64_t a2)
{
  uint64_t result = 0;
  int v4 = *(_DWORD *)a2;
  if (*(int *)a2 > 26)
  {
    if (v4 == 44 || v4 == 33)
    {
      unint64_t v14 = (unsigned char *)a1[9];
      if (!v14 || !*(_DWORD *)(a2 + 16)) {
        goto LABEL_58;
      }
      goto LABEL_29;
    }
    if (v4 != 27) {
      goto LABEL_59;
    }
    int v11 = (_OWORD *)a1[8];
    if (v11) {
      *int v11 = *(_OWORD *)(a2 + 8);
    }
    uint64_t v12 = a1[9];
    if (v12) {
      *(void *)(v12 + 8) = a2 + 8;
    }
    unint64_t v13 = a1 + 5;
LABEL_26:
    unint64_t v14 = (unsigned char *)(*(void *)(*v13 + 8) + 24);
LABEL_29:
    uint64_t result = 0;
    *unint64_t v14 = 1;
    goto LABEL_59;
  }
  switch(v4)
  {
    case 1:
      *(void *)(*(void *)(a1[6] + 8) + 24) = *(unsigned int *)(a2 + 36);
      unint64_t v15 = (unsigned char *)a1[9];
      if (v15)
      {
        if ((*(unsigned char *)(a2 + 52) & 8) != 0) {
          *unint64_t v15 = 1;
        }
        unint64_t v16 = *(unsigned int *)(a2 + 48);
        if (68 * (unint64_t)v16 + 56 <= *(unsigned int *)(a2 + 4))
        {
          if (v16)
          {
            uint64_t v26 = a1[4];
            uint64_t v27 = a2 + 56;
            unint64_t v28 = 1;
            do
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(v26 + 16))(v26, v27, *(unsigned int *)(v27 + 40), *(unsigned int *)(v27 + 36));
              if (result) {
                BOOL v29 = 1;
              }
              else {
                BOOL v29 = v28 >= v16;
              }
              ++v28;
              v27 += 68;
            }
            while (!v29);
            break;
          }
          goto LABEL_58;
        }
LABEL_34:
        uint64_t result = 88;
        break;
      }
LABEL_58:
      uint64_t result = 0;
      break;
    case 12:
      unsigned int v18 = *(_DWORD *)(a2 + 4);
      uint64_t v17 = *(unsigned int *)(a2 + 8);
      if (v18 <= v17) {
        return 88;
      }
      if (v18 - v17 < 0x18 || a1[9] == 0) {
        goto LABEL_58;
      }
      unsigned int v20 = (uint64_t *)(a2 + v17);
      uint64_t v21 = *v20;
      uint64_t v22 = v20[1];
      uint64_t v23 = *(uint64_t *)((char *)v20 + 15);
      BOOL v24 = v21 == 0x6C2F687461707240 && v22 == 0x5F676E616C636269;
      if (!v24 || v23 != 0x6E6173612E74725FLL) {
        goto LABEL_58;
      }
      unint64_t v13 = a1 + 7;
      goto LABEL_26;
    case 25:
      *(void *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a2 + 48);
      size_t v5 = (unsigned char *)a1[9];
      if (v5)
      {
        if ((*(unsigned char *)(a2 + 68) & 8) != 0) {
          *size_t v5 = 1;
        }
        unint64_t v6 = *(unsigned int *)(a2 + 64);
        if (80 * (unint64_t)v6 + 72 <= *(unsigned int *)(a2 + 4))
        {
          if (v6)
          {
            uint64_t v7 = a1[4];
            uint64_t v8 = a2 + 72;
            unint64_t v9 = 1;
            while (!HIDWORD(*(void *)(v8 + 40)))
            {
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(v7 + 16))(v7, v8, *(unsigned int *)(v8 + 48));
              if (result) {
                BOOL v10 = 1;
              }
              else {
                BOOL v10 = v9 >= v6;
              }
              ++v9;
              v8 += 80;
              if (v10) {
                goto LABEL_59;
              }
            }
            uint64_t result = 34;
            break;
          }
          goto LABEL_58;
        }
        goto LABEL_34;
      }
      goto LABEL_58;
  }
LABEL_59:
  if (!a1[9] && *(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    if (*(void *)(*(void *)(a1[6] + 8) + 24)) {
      return 89;
    }
  }
  return result;
}

uint64_t ___os_trace_get_image_info_block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  uint64_t v4 = 0;
  size_t v5 = "__cstring";
  do
  {
    if (*a2 == *(void *)v5 && a2[1] == *((void *)v5 + 1))
    {
      uint64_t v8 = *(void *)(a1 + 40) + 8 * v4;
      *(_DWORD *)(v8 + 16) = a3;
      uint64_t v7 = (_DWORD *)(v8 + 20);
      goto LABEL_10;
    }
    ++v4;
    v5 += 16;
  }
  while (v4 != 5);
  if (*a2 ^ 0x74736E6F635F5FLL | a2[1]) {
    return 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
  uint64_t v7 = (_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 28);
LABEL_10:
  *uint64_t v7 = a4;
  return 0;
}

void _os_trace_rwptr_wrunlock(uint64_t a1, void *a2)
{
  char v2 = *(void **)(a1 + 8);
  if (v2 != a2) {
    *a2 = v2;
  }
  atomic_store((unint64_t)a2, (unint64_t *)(a1 + 8));
  atomic_ullong v3 = *(void *)a1;
  do
  {
    atomic_ullong v4 = v3;
    unint64_t v5 = v3 | 0x100000000;
    if (v2 == a2) {
      unint64_t v5 = v3;
    }
    unint64_t v6 = v5 >> 33;
    unint64_t v7 = v5 & ((int)(v5 >> 1) >> 31);
    unint64_t v8 = v5 & 0xFFFFFFFF00000000;
    if (!v6) {
      unint64_t v8 = v7;
    }
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)a1, (unint64_t *)&v3, v8, memory_order_release, memory_order_relaxed);
  }
  while (v3 != v4);
  if (v8)
  {
    _os_trace_rwptr_cleanup(a1, (void (*)(void))_os_trace_mh_map_cleanup);
  }
  else
  {
    int v9 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    if (v9 != v4) {
      _os_trace_rwptr_wrunlock_slow(a1, v9, v4);
    }
  }
}

void _os_trace_mh_map_insert_impl(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = *(unsigned __int16 *)(a4 + 10);
  unint64_t v5 = (a2 >> *MEMORY[0x1E4F14C78]) % v4;
  while (1)
  {
    uint64_t v6 = a4 + 16 * v5;
    uint64_t v7 = *(void *)(v6 + 16);
    if (!v7 || v7 == -1) {
      break;
    }
    if (v7 == a2) {
      goto LABEL_11;
    }
    if (v5 + 1 == v4) {
      unint64_t v5 = 0;
    }
    else {
      ++v5;
    }
  }
  *(void *)(a4 + 16 * v5 + 24) = a3;
  atomic_store(a2, (unint64_t *)(v6 + 16));
  ++*(_WORD *)(a4 + 8);
LABEL_11:
  if (a1) {
    _os_trace_rwptr_wrunlock(a1, (void *)a4);
  }
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if ((BYTE11(xmmword_1EB1CF7F0) & 0x20) != 0) {
    return 1;
  }
  else {
    return (MEMORY[0xFFFFFC104] >> 29) & 1;
  }
}

uint64_t os_state_add_handler(NSObject *a1, const void *a2)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if ((BYTE9(xmmword_1EB1CF7F0) & 1) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0) {
    return 0;
  }
  while (1)
  {
    unint64_t v4 = malloc_type_calloc(1uLL, 0x40uLL, 0x478C0A82uLL);
    if (v4) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  uint64_t v6 = v4;
  v4[2] = atomic_fetch_add_explicit(&os_state_add_handler_handle, 1uLL, memory_order_relaxed);
  v4[3] = _Block_copy(a2);
  v6[4] = a1;
  dispatch_retain(a1);
  v6[5] = dyld_image_header_containing_address();
  void v6[6] = 0;
  *((_DWORD *)v6 + 14) = 1;
  os_unfair_lock_lock_with_options();
  uint64_t v7 = 24;
  if (!byte_1EB1CF7D8) {
    uint64_t v7 = 8;
  }
  unint64_t v8 = *(_UNKNOWN **)((char *)&os_state_blocks + v7);
  *uint64_t v6 = 0;
  v6[1] = v8;
  void *v8 = v6;
  *(_UNKNOWN **)((char *)&os_state_blocks + v7) = v6;
  atomic_fetch_add_explicit(&dword_1EB1CF7DC, 1u, memory_order_relaxed);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB1CF7C8);
  return v6[2];
}

void _os_log_with_args_impl(NSObject *a1, char a2, char *a3, _DWORD *a4, void (*a5)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6), void *a6)
{
  uint64_t v7 = a5;
  va_list v8 = (va_list)a4;
  uint64_t v28 = *MEMORY[0x1E4F14BF8];
  int v25 = a5;
  uint64_t v26 = a4;
  int v12 = *(unsigned __int16 *)__error();
  uint64_t v13 = a2 & 0x7F;
  if (os_log_type_enabled(a1, (os_log_type_t)v13))
  {
    uint64_t v14 = dyld_image_header_containing_address();
    if (v14)
    {
      first_non_jit_frame = (const mach_header_64 *)v14;
      if (a3 || !a6)
      {
        uint64_t v16 = dyld_image_header_containing_address();
        if (v16)
        {
          if (first_non_jit_frame == (const mach_header_64 *)v16)
          {
            unint64_t size = 0;
            uint64_t v17 = getsegmentdata(first_non_jit_frame, "__TEXT", &size);
            if (v17)
            {
              if (v17 <= (uint8_t *)a3 && &a3[strlen(a3)] < (char *)&v17[size])
              {
                uint64_t v23 = 0;
                long long v21 = 0u;
                long long v22 = 0u;
                long long v19 = 0u;
                long long v20 = 0u;
                __int16 v18 = 0;
                if (os_log_fmt_encode(a3, 3, v27, &v18, v26))
                {
                  *((void *)&v20 + 1) = first_non_jit_frame;
                  *(void *)&long long v21 = v7;
                  *((void *)&v21 + 1) = a3;
                  _os_log_impl_flatten_and_send((uint64_t)&v19);
                  return;
                }
                va_list v8 = (va_list)v26;
              }
            }
          }
        }
      }
    }
    else
    {
      first_non_jit_frame = (const mach_header_64 *)os_log_with_args_find_first_non_jit_frame(&v25);
      uint64_t v7 = v25;
    }
    *((void *)&v20 + 1) = first_non_jit_frame;
    *(void *)&long long v21 = v7;
    *((void *)&v21 + 1) = a3;
    _os_log_impl_dynamic((uint64_t)&v19, (uint64_t)a1, v13, a6, v12, v8);
  }
}

size_t os_log_fmt_encode(char *a1, uint64_t a2, _WORD *a3, _WORD *a4, _DWORD *a5)
{
  uint64_t v6 = a3;
  char v62 = a5;
  uint64_t v58 = 0x1000000000000;
  unint64_t v56 = a3;
  uint64_t v57 = 0x36200000000;
  memset(v60, 0, sizeof(v60));
  long long v61 = 0u;
  size_t result = strnlen(a1, 0x801uLL);
  if (result >= 0x801)
  {
LABEL_2:
    if (a4) {
      *a4 = 0;
    }
    if ((v58 & 0x100000000) == 0) {
      return 0;
    }
    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Buffer needs free";
    __break(1u);
    goto LABEL_131;
  }
  *uint64_t v6 = 0;
  LODWORD(v57) = 2;
  size_t result = (size_t)strchr(a1, 37);
  if (!result)
  {
    __int16 v54 = 0;
    goto LABEL_126;
  }
  BOOL v10 = (char *)result;
  __int16 v11 = 0;
  int v12 = 0;
  int v13 = 0;
  unsigned __int16 v59 = 0;
  while (1)
  {
    size_t result = (size_t)os_log_fmt_delimit(v10, a2, (uint64_t)v60);
    if (!result)
    {
      if (!v10[1]) {
        goto LABEL_125;
      }
      int v25 = v10 + 2;
      goto LABEL_105;
    }
    unsigned int v14 = WORD4(v60[0]);
    if (BYTE8(v60[0])) {
      goto LABEL_2;
    }
    if (v13 == 48) {
      goto LABEL_125;
    }
    size_t v15 = result;
    if ((WORD4(v60[0]) & 0x800) != 0) {
      break;
    }
LABEL_22:
    if ((v14 & 2) == 0) {
      goto LABEL_33;
    }
    unsigned __int16 v59 = 1024;
    long long v20 = v62;
    v62 += 2;
    LODWORD(__src) = *v20;
    if ((v58 & 0x200000000) == 0)
    {
      if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) > 1)
      {
        unsigned int v21 = v59;
        *(_WORD *)((char *)v56 + v57) = v59;
        unsigned int v22 = v57 + 2;
        LODWORD(v57) = v57 + 2;
        size_t v23 = v21 >> 8;
        if (!BYTE6(v58)) {
          *((unsigned char *)v56 + v22) = 0;
        }
        goto LABEL_27;
      }
      size_t result = os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
    }
    size_t v23 = 4;
LABEL_27:
    if ((v58 & 0x200000000) == 0)
    {
      if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 < v23)
      {
        size_t result = os_trace_blob_add_slow((uint64_t)&v56, &__src, v23);
      }
      else
      {
        size_t result = (size_t)memcpy((char *)v56 + v57, &__src, v23);
        unsigned int v24 = v57 + v23;
        LODWORD(v57) = v57 + v23;
        if (!BYTE6(v58)) {
          *((unsigned char *)v56 + v24) = 0;
        }
      }
    }
    if (++v13 == 48) {
      goto LABEL_124;
    }
    unsigned int v14 = WORD4(v60[0]);
LABEL_33:
    if ((v14 & 4) != 0)
    {
      uint64_t v26 = v62;
      v62 += 2;
      DWORD2(v60[1]) = *v26;
      if ((v14 & 8) == 0) {
        goto LABEL_38;
      }
    }
    else
    {
      if ((v14 & 0x10) != 0 || BYTE10(v60[0]) == 18)
      {
        v14 &= ~8u;
        WORD4(v60[0]) = v14;
      }
      if ((v14 & 8) == 0)
      {
LABEL_38:
        if ((v14 & 0x10) != 0) {
          goto LABEL_65;
        }
        goto LABEL_39;
      }
    }
    if ((v14 & 0x10) != 0 || BYTE10(v60[0]) == 18)
    {
      LOBYTE(v59) = 0;
    }
    else
    {
      if ((v14 & 4) != 0)
      {
        char v28 = 16;
      }
      else
      {
        if ((v14 & 0x400) != 0)
        {
          LOBYTE(v27) = 5;
        }
        else if ((v14 & 0x200) != 0)
        {
          LOBYTE(v27) = 1;
        }
        else
        {
          int v27 = (v14 >> 7) & 2;
        }
        char v28 = v27 | 0x10;
      }
      LOBYTE(v59) = v28;
    }
    HIBYTE(v59) = 4;
    if ((v58 & 0x200000000) != 0) {
      goto LABEL_118;
    }
    if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) <= 1)
    {
      size_t result = os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_118:
      size_t v31 = 4;
      goto LABEL_59;
    }
    unsigned int v29 = v59;
    *(_WORD *)((char *)v56 + v57) = v59;
    unsigned int v30 = v57 + 2;
    LODWORD(v57) = v57 + 2;
    size_t v31 = v29 >> 8;
    if (!BYTE6(v58)) {
      *((unsigned char *)v56 + v30) = 0;
    }
LABEL_59:
    if ((v58 & 0x200000000) == 0)
    {
      if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 < v31)
      {
        size_t result = os_trace_blob_add_slow((uint64_t)&v56, (char *)&v60[1] + 8, v31);
      }
      else
      {
        size_t result = (size_t)memcpy((char *)v56 + v57, (char *)&v60[1] + 8, v31);
        unsigned int v32 = v57 + v31;
        LODWORD(v57) = v57 + v31;
        if (!BYTE6(v58)) {
          *((unsigned char *)v56 + v32) = 0;
        }
      }
    }
    if (++v13 == 48) {
      goto LABEL_124;
    }
    unsigned int v14 = WORD4(v60[0]);
    if ((BYTE8(v60[0]) & 0x10) != 0)
    {
LABEL_65:
      LOBYTE(v59) = v59 & 0xF;
      goto LABEL_66;
    }
LABEL_39:
    v12 |= 2u;
LABEL_66:
    v12 |= (v14 & 0x600) != 0;
    int v33 = (v14 >> 7) & 2;
    if ((v14 & 0x200) != 0) {
      LOBYTE(v33) = 1;
    }
    if ((v14 & 0x400) != 0) {
      unsigned __int8 v34 = 5;
    }
    else {
      unsigned __int8 v34 = v33;
    }
    LOBYTE(v59) = v59 & 0xF0 | v34;
    switch(BYTE10(v60[0]))
    {
      case 0:
        goto LABEL_132;
      case 1:
        uint64_t v38 = (char *)v62;
        v62 += 2;
        int v36 = *v38;
        goto LABEL_78;
      case 2:
        char v39 = (unsigned __int8 *)v62;
        v62 += 2;
        int v36 = *v39;
        goto LABEL_78;
      case 3:
        unsigned __int8 *__attribute__((__org_typedef(uuid_t))) v40 = (__int16 *)v62;
        v62 += 2;
        int v36 = *v40;
        goto LABEL_78;
      case 4:
        uint64_t v41 = (unsigned __int16 *)v62;
        v62 += 2;
        int v36 = *v41;
        goto LABEL_78;
      case 5:
      case 6:
      case 7:
        unsigned int v35 = v62;
        v62 += 2;
        int v36 = *v35;
LABEL_78:
        LODWORD(__src) = v36;
        HIBYTE(v59) = 4;
        if ((v58 & 0x200000000) != 0) {
          goto LABEL_81;
        }
        uint64_t v42 = v57;
        if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) > 1) {
          goto LABEL_97;
        }
        os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_81:
        size_t v43 = 4;
        goto LABEL_99;
      case 8:
        unsigned __int16 v59 = v34 | 0x60;
        if ((v58 & 0x200000000) != 0) {
          goto LABEL_121;
        }
        if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) <= 1)
        {
          os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_121:
          size_t v43 = 0;
        }
        else
        {
          unsigned int v44 = v59;
          *(_WORD *)((char *)v56 + v57) = v59;
          unsigned int v45 = v57 + 2;
          LODWORD(v57) = v57 + 2;
          size_t v43 = v44 >> 8;
          if (!BYTE6(v58)) {
            *((unsigned char *)v56 + v45) = 0;
          }
        }
        v12 |= 2u;
        if ((v58 & 0x200000000) != 0) {
          goto LABEL_104;
        }
        if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 >= v43)
        {
          uint64_t v46 = (char *)v56 + v57;
          uint64_t v47 = 0;
          goto LABEL_102;
        }
        p_src = 0;
        goto LABEL_108;
      case 9:
      case 0xA:
      case 0xB:
      case 0xC:
      case 0xD:
        goto LABEL_94;
      case 0xE:
      case 0xF:
        unsigned int v37 = (uint64_t *)v62;
        v62 += 2;
        uint64_t __src = *v37;
        goto LABEL_95;
      case 0x10:
        char v48 = v34 | 0x20;
        goto LABEL_93;
      case 0x11:
        char v48 = v34 | 0x50;
        goto LABEL_93;
      case 0x12:
        char v48 = v34 | 0x40;
        goto LABEL_93;
      case 0x13:
        char v48 = v34 | 0x30;
LABEL_93:
        LOBYTE(v59) = v48;
LABEL_94:
        uint64_t v49 = (uint64_t *)v62;
        v62 += 2;
        uint64_t __src = *v49;
LABEL_95:
        HIBYTE(v59) = 8;
        if ((v58 & 0x200000000) != 0) {
          goto LABEL_110;
        }
        uint64_t v42 = v57;
        if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) <= 1)
        {
          os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_110:
          size_t v43 = 8;
        }
        else
        {
LABEL_97:
          unsigned int v50 = v59;
          *(_WORD *)((char *)v56 + v42) = v59;
          unsigned int v51 = v57 + 2;
          LODWORD(v57) = v57 + 2;
          size_t v43 = v50 >> 8;
          if (!BYTE6(v58)) {
            *((unsigned char *)v56 + v51) = 0;
          }
        }
LABEL_99:
        if ((v58 & 0x200000000) != 0) {
          goto LABEL_104;
        }
        if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 < v43)
        {
          p_src = &__src;
LABEL_108:
          os_trace_blob_add_slow((uint64_t)&v56, p_src, v43);
        }
        else
        {
          uint64_t v46 = (char *)v56 + v57;
          uint64_t v47 = &__src;
LABEL_102:
          memcpy(v46, v47, v43);
          unsigned int v52 = v57 + v43;
          LODWORD(v57) = v57 + v43;
          if (!BYTE6(v58)) {
            *((unsigned char *)v56 + v52) = 0;
          }
        }
LABEL_104:
        int v25 = &v10[v15];
        __int16 v11 = ++v13;
        break;
      default:
        goto LABEL_104;
    }
LABEL_105:
    size_t result = (size_t)strchr(v25, 37);
    BOOL v10 = (char *)result;
    if (!result) {
      goto LABEL_125;
    }
  }
  unsigned __int16 v59 = 2160;
  if ((v58 & 0x200000000) != 0) {
    goto LABEL_112;
  }
  if ((SBYTE6(v58) + HIDWORD(v57) - v57 - 1) <= 1)
  {
    size_t result = os_trace_blob_add_slow((uint64_t)&v56, &v59, 2uLL);
LABEL_112:
    size_t v18 = 8;
    goto LABEL_16;
  }
  unsigned int v16 = v59;
  *(_WORD *)((char *)v56 + v57) = v59;
  unsigned int v17 = v57 + 2;
  LODWORD(v57) = v57 + 2;
  size_t v18 = v16 >> 8;
  if (!BYTE6(v58)) {
    *((unsigned char *)v56 + v17) = 0;
  }
LABEL_16:
  if ((v58 & 0x200000000) == 0)
  {
    if (SBYTE6(v58) + HIDWORD(v57) - (int)v57 - 1 < v18)
    {
      size_t result = os_trace_blob_add_slow((uint64_t)&v56, (char *)&v61 + 8, v18);
    }
    else
    {
      size_t result = (size_t)memcpy((char *)v56 + v57, (char *)&v61 + 8, v18);
      unsigned int v19 = v57 + v18;
      LODWORD(v57) = v57 + v18;
      if (!BYTE6(v58)) {
        *((unsigned char *)v56 + v19) = 0;
      }
    }
  }
  v12 |= 2u;
  if (++v13 != 48)
  {
    unsigned int v14 = WORD4(v60[0]);
    goto LABEL_22;
  }
LABEL_124:
  __int16 v11 = 48;
LABEL_125:
  __int16 v54 = v12 | (unsigned __int16)(v11 << 8);
LABEL_126:
  *uint64_t v6 = v54;
  if (a4) {
    *a4 = v57;
  }
  if ((v58 & 0x100000000) == 0) {
    return (size_t)v6;
  }
LABEL_131:
  qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Buffer needs free";
  __break(1u);
LABEL_132:
  qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
  qword_1E9450118 = 0;
  __break(1u);
  return result;
}

unint64_t os_log_fmt_compose(size_t a1, char *__s, uint64_t a3, unsigned int a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned __int16 a10)
{
  int v13 = a6 + 2;
  int v14 = a6[1];
  unsigned int v69 = (unsigned __int16)a5;
  unsigned int v70 = (*a6 >> 5) & 3;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  while (1)
  {
    unint64_t result = strcspn(__s, "%");
    unint64_t v16 = result;
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v17 = *(unsigned int *)(a1 + 8);
      if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v17 - 1))
      {
        unint64_t result = os_trace_blob_add_slow(a1, __s, result);
      }
      else
      {
        unint64_t result = (unint64_t)memcpy((void *)(*(void *)a1 + v17), __s, result);
        unsigned int v18 = *(_DWORD *)(a1 + 8) + v16;
        *(_DWORD *)(a1 + 8) = v18;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v18) = 0;
        }
      }
    }
    unsigned int v19 = &__s[v16];
    if (!*v19) {
      break;
    }
    unint64_t result = (unint64_t)os_log_fmt_delimit(v19, a3, (uint64_t)&v75);
    if (result)
    {
      char v27 = BYTE8(v75);
      if (BYTE8(v75)) {
        return _os_log_fmt_decode_give_up(a1, v75, WORD6(v75), v21, v22, v23, v24, v25);
      }
      if ((BYTE8(v75) & 2) != 0)
      {
        if ((_WORD)v14)
        {
          --v14;
          uint64_t v28 = v13[1];
          unsigned int v29 = &v13[v28 + 2];
          if (v28 == 4 && ((unsigned int v30 = *v13, v30 < 0x10) || (v30 & 0xF0) == 0x10)) {
            int v31 = *(_DWORD *)(v13 + 2);
          }
          else {
            int v31 = 0;
          }
        }
        else
        {
          int v31 = 0;
          int v14 = 0;
          unsigned int v29 = v13;
        }
        DWORD1(v76) = v31;
        int v13 = v29;
      }
      if ((BYTE8(v75) & 8) == 0) {
        goto LABEL_41;
      }
      if ((BYTE8(v75) & 4) == 0 && ((BYTE8(v75) & 0x10) != 0 || BYTE10(v75) == 18))
      {
        if ((_WORD)v14)
        {
          if ((*v13 & 0xF0) == 0x10)
          {
            --v14;
            v13 += v13[1] + 2;
          }
        }
        else
        {
          int v14 = 0;
        }
        char v27 = BYTE8(v75) & 0xF7;
        WORD4(v75) &= ~8u;
        goto LABEL_41;
      }
      if (!(_WORD)v14)
      {
        int v14 = 0;
        goto LABEL_34;
      }
      --v14;
      uint64_t v35 = v13[1];
      int v36 = &v13[v35 + 2];
      if (v35 != 4 || (unsigned int v37 = *v13, v37 >= 0x10) && (v37 & 0xF0) != 0x10)
      {
        int v13 = v36;
LABEL_34:
        DWORD2(v76) = -1;
LABEL_41:
        int v36 = v13;
        goto LABEL_42;
      }
      DWORD2(v76) = *(_DWORD *)(v13 + 2);
LABEL_42:
      __s = &v19[result];
      if (!(_WORD)v14)
      {
        int v14 = 0;
        int v13 = v36;
        goto LABEL_106;
      }
      --v14;
      uint64_t v38 = v36 + 2;
      uint64_t v39 = v36[1];
      int v13 = &v36[v39 + 2];
      unsigned __int8 v40 = *v36;
      if ((*v36 & 0xF0) == 0xE0)
      {
        uint64_t v56 = 10;
        if (*((uint64_t *)&v78 + 1) > 0x656D616E6C69616CLL)
        {
          if (*((uint64_t *)&v78 + 1) > 0x6F6363616C69616CLL)
          {
            if (*((void *)&v78 + 1) != 0x6F6363616C69616DLL && *((void *)&v78 + 1) != 0x7075626D6C69616DLL)
            {
              uint64_t v59 = 0x726464616C69616DLL;
              goto LABEL_145;
            }
          }
          else if (*((void *)&v78 + 1) != 0x656D616E6C69616DLL && *((void *)&v78 + 1) != 0x6A6275736C69616DLL)
          {
            uint64_t v59 = 0x6D6D75736C69616DLL;
            goto LABEL_145;
          }
LABEL_146:
          uint64_t v56 = 8;
          goto LABEL_147;
        }
        if (*((uint64_t *)&v78 + 1) > 0x786F626C69616CLL)
        {
          if (*((void *)&v78 + 1) != 0x786F626C69616DLL && *((void *)&v78 + 1) != 0x35646D6E69616C70)
          {
            uint64_t v59 = 0x617474616C69616DLL;
            goto LABEL_145;
          }
          goto LABEL_146;
        }
        if (*((void *)&v78 + 1))
        {
          if (*((void *)&v78 + 1) != 1752392040)
          {
            uint64_t v59 = 0x68736168766564;
LABEL_145:
            if (*((void *)&v78 + 1) != v59) {
              goto LABEL_147;
            }
          }
          goto LABEL_146;
        }
LABEL_159:
        unint64_t v48 = 0;
        goto LABEL_160;
      }
      uint64_t v41 = a7;
      unsigned int v42 = a8;
      if ((*v36 & 1) == 0) {
        goto LABEL_45;
      }
      if ((0xD8uLL >> (v40 & 7))) {
        goto LABEL_159;
      }
      unsigned int v44 = privacy_flags2opt[v40 & 7];
      if (v44 <= a4)
      {
        if (v70 - 1 > 2)
        {
          if (a9)
          {
            BOOL v43 = 0;
            unsigned int v42 = a10;
            uint64_t v41 = a9;
            goto LABEL_61;
          }
          goto LABEL_50;
        }
        uint64_t v41 = a9;
        unsigned int v42 = a10;
        if ((v40 & 0xF0) != 0x80)
        {
          uint64_t v41 = a9;
          unsigned int v42 = a10;
          if (v44 > v70) {
            goto LABEL_50;
          }
        }
LABEL_45:
        BOOL v43 = v41 == 0;
        if (v41 || !v42)
        {
LABEL_61:
          if ((*v36 & 0xF1) == 0)
          {
            LODWORD(v55) = v39 == 0;
            unint64_t v48 = v36[1];
            goto LABEL_84;
          }
          unint64_t v48 = 0;
          if ((*v36 & 0xE1) != 0 && v39 == 4)
          {
            uint64_t v49 = *(unsigned __int16 *)v38;
            if (v49 > v42) {
              goto LABEL_96;
            }
            int v50 = v42 - v49;
            __int16 v51 = *((_WORD *)v36 + 2);
            unsigned __int16 v52 = v51 & 0x7FFF;
            if (v50 < (v51 & 0x7FFF)) {
              goto LABEL_96;
            }
            if (*v36 <= 0xFu && v51 < 0)
            {
LABEL_106:
              _os_log_fmt_decode_error(a1);
            }
            else
            {
              unint64_t result = v51 < 0;
              uint64_t v53 = (unsigned __int8 *)(v41 + v49);
              if (v43) {
                uint64_t v38 = 0;
              }
              else {
                uint64_t v38 = v53;
              }
              int v54 = v50 >= 0x8000;
              if (((((unsigned __int16)v14 | v52) == 0) & result) != 0) {
                unint64_t v48 = (v54 << 15);
              }
              else {
                unint64_t v48 = v51 & 0x7FFF;
              }
              if (((((unsigned __int16)v14 | v52) == 0) & result & v54) != 0) {
                uint64_t v55 = 0;
              }
              else {
                uint64_t v55 = (v51 >> 15) & 1;
              }
              if (*v36 < 0xF0u)
              {
LABEL_84:
                if (v55 && *v36 < 0x10u) {
                  goto LABEL_106;
                }
                if ((v40 & 0xF0) == 0x10) {
                  goto LABEL_160;
                }
                if (*v36 < 0x10u != (v27 & 0x10) >> 4) {
                  goto LABEL_160;
                }
                if ((v27 & 0x10) != 0)
                {
                  v26.i32[0] = v48;
                  if (vaddlv_u8((uint8x8_t)vcnt_s8(v26)) != 1) {
                    goto LABEL_160;
                  }
                }
                switch(BYTE10(v75))
                {
                  case 1:
                  case 2:
                  case 3:
                  case 4:
                  case 5:
                  case 6:
                  case 7:
                  case 8:
                    unsigned __int16 v58 = v48;
                    if (v48 >= 5) {
                      goto LABEL_160;
                    }
                    goto LABEL_92;
                  case 9:
                  case 0xA:
                    unsigned __int16 v58 = v48;
                    if (v69 < v48) {
                      goto LABEL_160;
                    }
                    goto LABEL_92;
                  case 0xB:
                  case 0xC:
                    unsigned __int16 v58 = v48;
                    if (v48 >= 9) {
                      goto LABEL_160;
                    }
                    goto LABEL_92;
                  case 0xD:
                    unsigned __int16 v58 = a5;
                    if (v48 != (unsigned __int16)a5) {
                      goto LABEL_160;
                    }
                    goto LABEL_92;
                  case 0xE:
                  case 0xF:
                    if (v48 != 8) {
                      goto LABEL_160;
                    }
                    unsigned __int16 v58 = 8;
                    goto LABEL_92;
                  case 0x10:
                    unsigned __int16 v58 = v48;
                    if ((v40 & 0xF0) != 0x20) {
                      goto LABEL_160;
                    }
                    goto LABEL_92;
                  case 0x11:
                    unsigned __int16 v58 = v48;
                    if ((v40 & 0xF0) != 0x50) {
                      goto LABEL_160;
                    }
                    goto LABEL_92;
                  case 0x12:
                    unsigned int v64 = (v40 >> 4) - 2;
                    if (v64 < 7)
                    {
                      unsigned __int16 v58 = v48;
                      switch((0x30303000000uLL >> (8 * v64)) & 3)
                      {
                        case 1uLL:
                          goto LABEL_50;
                        case 2uLL:
                          goto LABEL_106;
                        case 3uLL:
                          goto LABEL_160;
                        default:
                          goto LABEL_92;
                      }
                    }
                    goto LABEL_160;
                  case 0x13:
                    unsigned __int16 v58 = v48;
                    if ((v40 & 0xF0) != 0x30) {
                      goto LABEL_160;
                    }
LABEL_92:
                    if ((v27 & 0x40) == 0) {
                      goto LABEL_102;
                    }
                    if (v27 < 0)
                    {
                      if (_os_log_fmt_builtin_annotated(a1, a5, (uint64_t)&v75, (uint64_t)v36, (uint64_t)v38, v58, v55)) {
                        continue;
                      }
                    }
                    else if (_os_log_fmt_plugin_annotated(a1, a5, (uint64_t)&v75, (char *)v36, v38, v58, v55))
                    {
                      continue;
                    }
LABEL_102:
                    if ((BYTE8(v75) & 0x10) != 0) {
                      _os_log_fmt_compose_scalar(a1, (uint64_t)&v75, a5, v38, v58);
                    }
                    else {
                      _os_log_fmt_compose_data(a1, (uint64_t)&v75, v36, (const char *)v38, v58, v55);
                    }
                    break;
                  default:
                    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
                    qword_1E9450118 = BYTE10(v75);
                    __break(1u);
                    return result;
                }
              }
              else
              {
                uint64_t v56 = 9;
                if (*((uint64_t *)&v78 + 1) <= 0x656D616E6C69616CLL)
                {
                  if (*((uint64_t *)&v78 + 1) > 0x786F626C69616CLL)
                  {
                    if (*((void *)&v78 + 1) == 0x786F626C69616DLL) {
                      goto LABEL_116;
                    }
                    if (*((void *)&v78 + 1) != 0x35646D6E69616C70)
                    {
                      uint64_t v57 = 0x617474616C69616DLL;
                      goto LABEL_115;
                    }
                    goto LABEL_129;
                  }
                  if (*((void *)&v78 + 1) != 1752392040 && *((void *)&v78 + 1) != 0x68736168766564)
                  {
                    if (*((void *)&v78 + 1)) {
                      goto LABEL_147;
                    }
                    goto LABEL_159;
                  }
LABEL_129:
                  os_trace_blob_addf(a1, "<mask.%.*s: ", v20, 9, v22, v23, v24, v25, SBYTE2(v76));
                  if (v48 || v55)
                  {
                    os_trace_blob_add_hexdump(a1, (uint64_t)v38, v48, v55);
                  }
                  else if ((*(_WORD *)(a1 + 20) & 2) == 0)
                  {
                    uint64_t v60 = *(unsigned int *)(a1 + 8);
                    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v60 - 1) <= 5)
                    {
                      os_trace_blob_add_slow(a1, "(null)", 6uLL);
                    }
                    else
                    {
                      uint64_t v61 = *(void *)a1 + v60;
                      *(_WORD *)(v61 + 4) = 10604;
                      *(_DWORD *)uint64_t v61 = 1819635240;
                      unsigned int v62 = *(_DWORD *)(a1 + 8) + 6;
                      *(_DWORD *)(a1 + 8) = v62;
                      if (!*(unsigned char *)(a1 + 22)) {
                        *(unsigned char *)(*(void *)a1 + v62) = 0;
                      }
                    }
                  }
                  if ((*(_WORD *)(a1 + 20) & 2) == 0)
                  {
                    uint64_t v63 = *(unsigned int *)(a1 + 8);
                    if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 != v63)
                    {
                      *(unsigned char *)(*(void *)a1 + v63) = 62;
                      unsigned int v47 = *(_DWORD *)(a1 + 8) + 1;
                      goto LABEL_53;
                    }
                    os_trace_blob_add_slow(a1, ">", 1uLL);
                  }
                }
                else if (*((uint64_t *)&v78 + 1) > 0x6F6363616C69616CLL)
                {
                  if (*((void *)&v78 + 1) == 0x6F6363616C69616DLL) {
                    goto LABEL_116;
                  }
                  if (*((void *)&v78 + 1) == 0x7075626D6C69616DLL) {
                    goto LABEL_129;
                  }
                  uint64_t v57 = 0x726464616C69616DLL;
LABEL_115:
                  if (*((void *)&v78 + 1) == v57) {
                    goto LABEL_116;
                  }
LABEL_147:
                  _os_log_fmt_decode_masked_unknown(a1, SBYTE2(v76), v78, v56, v22, v23, v24, v25);
                }
                else
                {
                  if (*((void *)&v78 + 1) != 0x656D616E6C69616DLL && *((void *)&v78 + 1) != 0x6A6275736C69616DLL)
                  {
                    uint64_t v57 = 0x6D6D75736C69616DLL;
                    goto LABEL_115;
                  }
LABEL_116:
                  _os_log_fmt_compose_masked_partial_redacted(a1, v38, v48, v55, v22, v23, v24, v25);
                }
              }
            }
          }
          else
          {
LABEL_160:
            _os_log_fmt_decode_cmd_mismatch(a1, v75, WORD6(v75), v36, v48, v23, v24, v25);
          }
        }
        else
        {
LABEL_96:
          _os_log_fmt_decode_bad_range(a1, v75, WORD6(v75), *((unsigned __int16 *)v36 + 1), *((unsigned __int16 *)v36 + 2), 0, v24, v25);
        }
      }
      else
      {
LABEL_50:
        if ((*(_WORD *)(a1 + 20) & 2) == 0)
        {
          uint64_t v45 = *(unsigned int *)(a1 + 8);
          if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v45 - 1) <= 8)
          {
            os_trace_blob_add_slow(a1, "<private>", 9uLL);
          }
          else
          {
            uint64_t v46 = *(void *)a1 + v45;
            *(void *)uint64_t v46 = *(void *)"<private>";
            *(unsigned char *)(v46 + 8) = 62;
            unsigned int v47 = *(_DWORD *)(a1 + 8) + 9;
LABEL_53:
            *(_DWORD *)(a1 + 8) = v47;
            if (!*(unsigned char *)(a1 + 22)) {
              *(unsigned char *)(*(void *)a1 + v47) = 0;
            }
          }
        }
      }
    }
    else
    {
      char v32 = v19[1];
      if (!v32) {
        break;
      }
      __src[0] = v19[1];
      if ((*(unsigned char *)(a1 + 20) & 2) == 0)
      {
        uint64_t v33 = *(unsigned int *)(a1 + 8);
        if (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - 1 == v33)
        {
          os_trace_blob_add_slow(a1, __src, 1uLL);
        }
        else
        {
          *(unsigned char *)(*(void *)a1 + v33) = v32;
          unsigned int v34 = *(_DWORD *)(a1 + 8) + 1;
          *(_DWORD *)(a1 + 8) = v34;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v34) = 0;
          }
        }
      }
      __s = v19 + 2;
    }
  }
  uint64_t v65 = *(unsigned int *)(a1 + 8) - 1;
  uint64_t v66 = MEMORY[0x1E4F14BF0];
  while (v65 != -1)
  {
    unsigned int v67 = *(char *)(*(void *)a1 + v65);
    if ((v67 & 0x80000000) != 0) {
      unint64_t result = __maskrune(v67, 0x4000uLL);
    }
    else {
      unint64_t result = *(_DWORD *)(v66 + 4 * v67 + 60) & 0x4000;
    }
    --v65;
    if (!result)
    {
      unsigned int v68 = v65 + 2;
      goto LABEL_174;
    }
  }
  unsigned int v68 = 0;
LABEL_174:
  *(_DWORD *)(a1 + 8) = v68;
  if (!*(unsigned char *)(a1 + 22)) {
    *(unsigned char *)(*(void *)a1 + v68) = 0;
  }
  return result;
}

char *os_log_fmt_delimit(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *a1;
  unint64_t result = a1 + 1;
  uint64_t v5 = v6;
  if (v6 == 37)
  {
    *(void *)(a3 + 56) = 0;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 8) = 0u;
    *(void *)a3 = a1;
    if (a1[1] != 123)
    {
      unsigned int v11 = 0;
LABEL_49:
      unsigned int v24 = 0;
      while (1)
      {
        while (1)
        {
          int v26 = *result++;
          int v25 = v26;
LABEL_51:
          if ((v25 - 49) >= 9) {
            break;
          }
          do
          {
            int v27 = *result++;
            int v25 = v27;
          }
          while ((v27 - 48) < 0xA);
          if (v25 != 36) {
            goto LABEL_51;
          }
          v11 |= 1u;
          *(_WORD *)(a3 + 8) = v11;
        }
        switch(v25)
        {
          case ' ':
          case '#':
          case '\'':
          case '+':
          case '-':
          case '0':
            continue;
          case '*':
            if ((v11 & 8) != 0)
            {
              v11 |= 1u;
              *(_WORD *)(a3 + 8) = v11;
            }
            uint64_t v33 = result;
            do
            {
              int v35 = *v33++;
              char v34 = v35;
            }
            while ((v35 - 48) < 0xA);
            if (v34 == 36) {
              v11 |= 1u;
            }
            else {
              v11 |= (v11 >> 1) & 1 | 2;
            }
            if (v34 == 36) {
              unint64_t result = v33;
            }
            *(_WORD *)(a3 + 8) = v11;
            continue;
          case '.':
            int v28 = *result++;
            int v25 = v28;
            if (v28 != 42)
            {
              *(_DWORD *)(a3 + 24) = 0;
              int v29 = v25 - 48;
              if ((v25 - 48) <= 9)
              {
                int v30 = 0;
                do
                {
                  int v30 = v29 + 10 * v30;
                  *(_DWORD *)(a3 + 24) = v30;
                  int v31 = *result++;
                  int v25 = v31;
                  int v29 = v31 - 48;
                }
                while ((v31 - 48) < 0xA);
              }
              int v32 = (v11 >> 3) & 1 | v11;
              unsigned int v11 = v32 | 8;
              *(_WORD *)(a3 + 8) = v32 | 8;
              goto LABEL_51;
            }
            int v36 = result;
            do
            {
              int v38 = *v36++;
              char v37 = v38;
            }
            while ((v38 - 48) < 0xA);
            if (v37 == 36)
            {
              v11 |= 1u;
              *(_WORD *)(a3 + 8) = v11;
              unint64_t result = v36;
            }
            else
            {
              int v39 = v11 | ((v11 & 0xC) != 0);
              unsigned int v11 = v39 | 0xC;
              *(_WORD *)(a3 + 8) = v39 | 0xC;
            }
            break;
          case '@':
            char v45 = 18;
            goto LABEL_134;
          case 'A':
          case 'E':
          case 'F':
          case 'G':
          case 'a':
          case 'e':
          case 'f':
          case 'g':
            if ((v24 & 8) != 0) {
              char v40 = 15;
            }
            else {
              char v40 = 14;
            }
            goto LABEL_136;
          case 'C':
            LOBYTE(v24) = 16;
            goto LABEL_111;
          case 'D':
            LOWORD(v24) = v24 | 0x10;
            goto LABEL_115;
          case 'L':
            v24 |= 8u;
            continue;
          case 'O':
          case 'U':
            LOWORD(v24) = v24 | 0x10;
            goto LABEL_91;
          case 'P':
            if (a2 != 2) {
              return 0;
            }
            if ((v11 & 8) == 0) {
              *(_WORD *)(a3 + 8) = v11 | 1;
            }
            char v45 = 19;
            goto LABEL_134;
          case 'S':
            LOBYTE(v24) = 16;
            goto LABEL_131;
          case 'X':
          case 'o':
          case 'u':
          case 'x':
LABEL_91:
            if ((v24 & 0x2000) != 0) {
              char v41 = 2;
            }
            else {
              char v41 = 6;
            }
            if ((v24 & 0x40) != 0) {
              char v42 = 4;
            }
            else {
              char v42 = v41;
            }
            if ((v24 & 0x10) != 0) {
              char v43 = 10;
            }
            else {
              char v43 = v42;
            }
            if ((v24 & 0x20) != 0) {
              char v44 = 12;
            }
            else {
              char v44 = v43;
            }
            if ((v24 & 0xC00) != 0) {
              char v44 = 10;
            }
            if ((v24 & 0x1000) != 0) {
              char v45 = 12;
            }
            else {
              char v45 = v44;
            }
            *(_WORD *)(a3 + 8) = v11 | 0x30;
            goto LABEL_134;
          case 'c':
LABEL_111:
            if ((v24 & 0x10) != 0) {
              char v40 = 7;
            }
            else {
              char v40 = 5;
            }
            goto LABEL_136;
          case 'd':
          case 'i':
LABEL_115:
            if ((v24 & 0x1000) != 0) {
              goto LABEL_123;
            }
            if ((v24 & 0x400) != 0 || (v24 & 0x800) != 0) {
              goto LABEL_124;
            }
            if ((v24 & 0x20) != 0)
            {
LABEL_123:
              char v40 = 11;
            }
            else if ((v24 & 0x10) != 0)
            {
LABEL_124:
              char v40 = 9;
            }
            else if ((v24 & 0x40) != 0)
            {
              char v40 = 3;
            }
            else if ((v24 & 0x2000) != 0)
            {
              char v40 = 1;
            }
            else
            {
              char v40 = 5;
            }
LABEL_136:
            *(unsigned char *)(a3 + 10) = v40;
            __int16 v46 = v11 | 0x10;
LABEL_137:
            *(_WORD *)(a3 + 8) = v46;
LABEL_138:
            *(_WORD *)(a3 + 12) = (_WORD)result - (_WORD)a1;
            return (char *)(unsigned __int16)((_WORD)result - (_WORD)a1);
          case 'h':
            if ((v24 & 0x40) != 0) {
              unsigned int v24 = v24 & 0xFFFFDFBF | 0x2000;
            }
            else {
              v24 |= 0x40u;
            }
            continue;
          case 'j':
            v24 |= 0x1000u;
            continue;
          case 'l':
            if ((v24 & 0x10) != 0) {
              unsigned int v24 = v24 & 0xFFFFFFCF | 0x20;
            }
            else {
              v24 |= 0x10u;
            }
            continue;
          case 'm':
            char v40 = 8;
            goto LABEL_136;
          case 'n':
            __int16 v46 = v11 | 1;
            goto LABEL_137;
          case 'p':
            *(unsigned char *)(a3 + 10) = 13;
            __int16 v46 = v11 | 0x30;
            goto LABEL_137;
          case 'q':
            v24 |= 0x20u;
            continue;
          case 's':
LABEL_131:
            if ((v24 & 0x10) != 0) {
              char v45 = 17;
            }
            else {
              char v45 = 16;
            }
LABEL_134:
            *(unsigned char *)(a3 + 10) = v45;
            goto LABEL_138;
          case 't':
            v24 |= 0x800u;
            continue;
          case 'z':
            v24 |= 0x400u;
            continue;
          default:
            return 0;
        }
      }
    }
    if (a2 == 2)
    {
      unint64_t result = strchr(result, 125);
      if (result)
      {
        int v9 = result;
        BOOL v10 = a1 + 2;
        if (a1[2] == 125)
        {
          unsigned int v11 = 0;
LABEL_48:
          unint64_t result = v9 + 1;
          goto LABEL_49;
        }
        unsigned int v11 = 0;
        do
        {
          int v12 = (char *)&v10[strspn(v10, ", ")];
          size_t v13 = strcspn(v12, ",}");
          switch(v13)
          {
            case 0uLL:
              goto LABEL_48;
            case 6uLL:
              if (*(_DWORD *)v12 != 1818391920 || *((_WORD *)v12 + 2) != 25449) {
                goto LABEL_26;
              }
              v11 |= 0x100u;
              goto LABEL_38;
            case 7uLL:
              if (*(_DWORD *)v12 != 1986622064 || *(_DWORD *)(v12 + 3) != 1702125942) {
                goto LABEL_26;
              }
              v11 |= 0x200u;
              goto LABEL_38;
            case 9uLL:
              if (*(void *)v12 != 0x76697469736E6573 || v12[8] != 101) {
                goto LABEL_26;
              }
              v11 |= 0x400u;
LABEL_38:
              *(_WORD *)(a3 + 8) = v11;
              break;
            default:
LABEL_26:
              if (!memchr(v12, 61, v13))
              {
                if (!strncmp(v12, "mask.", 5uLL))
                {
                  if (v13 - 6 <= 7)
                  {
                    uint64_t v19 = 0;
                    uint64_t v20 = 0;
                    v11 |= 0x800u;
                    *(_WORD *)(a3 + 8) = v11;
                    uint64_t v21 = v12 + 5;
                    *(void *)(a3 + 48) = v12 + 5;
                    *(_WORD *)(a3 + 18) = v13 - 5;
                    do
                    {
                      uint64_t v22 = *v21++;
                      v20 |= v22 << v19;
                      v19 += 8;
                    }
                    while (8 * (unsigned __int16)(v13 - 5) != v19);
                    *(void *)(a3 + 56) = v20;
                  }
                }
                else
                {
                  int v17 = v11 | 0x40;
                  *(_WORD *)(a3 + 8) = v11 | 0x40;
                  if (!strncmp(v12, "builtin:", 8uLL))
                  {
                    v11 |= 0xC0u;
                    *(_WORD *)(a3 + 8) = v11;
                    *(_WORD *)(a3 + 14) = 7;
                    *(void *)(a3 + 32) = "builtin";
                    *(void *)(a3 + 40) = v12 + 8;
                    *(_WORD *)(a3 + 16) = v13 - 8;
                  }
                  else
                  {
                    unsigned int v18 = (char *)memchr(v12, 58, v13);
                    if (v18)
                    {
                      if ((v11 & 0x80) != 0)
                      {
                        v17 ^= 0x80u;
                        *(_WORD *)(a3 + 8) = v17;
                      }
                      *(_WORD *)(a3 + 14) = (_WORD)v18 - (_WORD)v12;
                      *(void *)(a3 + 32) = v12;
                      *(void *)(a3 + 40) = v18 + 1;
                      *(_WORD *)(a3 + 16) = (_WORD)v12 + v13 - ((_WORD)v18 + 1);
                      unsigned int v11 = v17;
                    }
                    else
                    {
                      v11 |= 0xC0u;
                      *(_WORD *)(a3 + 8) = v11;
                      *(_WORD *)(a3 + 14) = 7;
                      *(void *)(a3 + 32) = "builtin";
                      *(void *)(a3 + 40) = v12;
                      *(_WORD *)(a3 + 16) = v13;
                    }
                  }
                }
              }
              break;
          }
          BOOL v10 = &v12[v13];
        }
        while (*v10 != 125);
        if ((v11 & 0x400) != 0)
        {
          int v23 = 64767;
        }
        else
        {
          if ((v11 & 0x200) == 0) {
            goto LABEL_48;
          }
          int v23 = 65279;
        }
        v11 &= v23;
        *(_WORD *)(a3 + 8) = v11;
        goto LABEL_48;
      }
    }
    else
    {
      return 0;
    }
  }
  else
  {
    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Should start with '%'";
    qword_1E9450118 = v5;
    __break(1u);
  }
  return result;
}

_DWORD *_os_log_fmt_compose_data(unint64_t a1, uint64_t a2, unsigned char *a3, const char *a4, unsigned int a5, int a6)
{
  uint64_t v29 = *MEMORY[0x1E4F14BF8];
  MEMORY[0x1F41887A8](a1);
  size_t v13 = (char *)&v28 - v12;
  unint64_t result = (_DWORD *)_os_log_fmt_compose_format_copy((unsigned char *)&v28 - v12, *v14, *(_WORD *)(a2 + 12));
  if ((*a3 & 0xF0) == 0x30) {
    return (_DWORD *)os_trace_blob_add_hexdump(a1, (uint64_t)a4, a5, a6);
  }
  if (*(unsigned char *)(a2 + 10) == 18) {
    v13[result - 1] = 115;
  }
  __int16 v22 = *(_WORD *)(a2 + 8);
  if ((v22 & 2) == 0)
  {
    unsigned int v23 = 0;
    if (a5) {
      goto LABEL_7;
    }
LABEL_10:
    if (a6) {
      a4 = (const char *)&unk_19DC93A71;
    }
    else {
      a4 = "(null)";
    }
    if ((v22 & 4) != 0)
    {
      unsigned int v24 = v23 + 1;
      *(&v28 + v23) = 0x7FFFFFFF;
    }
    else
    {
      unsigned int v24 = v23;
    }
    goto LABEL_21;
  }
  int v28 = *(_DWORD *)(a2 + 20);
  unsigned int v23 = 1;
  if (!a5) {
    goto LABEL_10;
  }
LABEL_7:
  if ((v22 & 8) != 0)
  {
    unsigned int v24 = v23 + 1;
    uint64_t v25 = v23;
    if ((v22 & 4) != 0)
    {
      unsigned int v26 = *(_DWORD *)(a2 + 24);
      if (v26 <= a5)
      {
        *(&v28 + v25) = v26;
        goto LABEL_21;
      }
    }
    else
    {
      unint64_t result = strrchr(v13, 46);
      *unint64_t result = 7547438;
    }
    *(&v28 + v25) = a5;
  }
  else
  {
    *(_DWORD *)&v13[result - 1] = 7547438;
    unsigned int v24 = v23 + 1;
    *(&v28 + v23) = a5;
  }
LABEL_21:
  switch(v24)
  {
    case 2u:
      unint64_t result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, v28);
      break;
    case 1u:
      HIBYTE(v27) = HIBYTE(a4);
      unint64_t result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, v28);
      break;
    case 0u:
      unint64_t result = (_DWORD *)os_trace_blob_addf(a1, v13, v16, v17, v18, v19, v20, v21, (char)a4);
      break;
  }
  if (a6) {
    return (_DWORD *)os_trace_blob_addns(a1, "<…>", 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  return result;
}

uint64_t os_trace_blob_addf(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return os_trace_blob_vaddf(a1, a2, 0, &a9);
}

uint64_t os_trace_blob_vaddf(uint64_t a1, const char *a2, int a3, va_list a4)
{
  if (*(unsigned char *)(a1 + 22))
  {
    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
    return 0;
  }
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0;
  }
  int v8 = *(_DWORD *)(a1 + 8);
  int v7 = *(_DWORD *)(a1 + 12);
  *__error() = a3;
  uint64_t v9 = vsnprintf((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), (v7 - v8), a2, a4);
  if ((v9 & 0x80000000) != 0)
  {
    uint64_t v10 = 0;
    *(unsigned char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)) = 0;
  }
  else
  {
    uint64_t v10 = v9;
    uint64_t v11 = (v7 + ~v8);
    if (v9 > v11)
    {
      if (*(_DWORD *)(a1 + 12) < *(_DWORD *)(a1 + 16))
      {
        uint64_t v11 = os_trace_blob_grow(a1, v9);
        *__error() = a3;
        vsnprintf((char *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), (v11 + 1), a2, a4);
      }
      if (v10 > v11)
      {
        *(_WORD *)(a1 + 20) |= 2u;
        uint64_t v10 = v11;
      }
    }
    *(_DWORD *)(a1 + 8) += v10;
  }
  return v10;
}

uint64_t _os_log_fmt_compose_format_copy(unsigned char *a1, void *__s, unsigned __int16 a3)
{
  unsigned __int16 v3 = a3;
  size_t v6 = a3;
  int v7 = memchr(__s, 125, a3);
  if (v7)
  {
    v3 += (_WORD)__s - (_WORD)v7;
    size_t v6 = v3;
    memcpy(a1, v7, v3);
    *a1 = 37;
  }
  else
  {
    memcpy(a1, __s, v6);
  }
  a1[v6] = 0;
  return v3;
}

size_t os_trace_blob_add_slow(uint64_t a1, void *__src, size_t __n)
{
  if ((*(_WORD *)(a1 + 20) & 2) != 0) {
    return 0;
  }
  size_t v3 = __n;
  unsigned int v6 = *(_DWORD *)(a1 + 12);
  size_t v7 = *(char *)(a1 + 22) + v6 - *(_DWORD *)(a1 + 8) - 1;
  if (v7 < __n)
  {
    if (v6 < *(_DWORD *)(a1 + 16)) {
      size_t v7 = os_trace_blob_grow(a1, __n);
    }
    if (v7 < v3)
    {
      *(_WORD *)(a1 + 20) |= 2u;
      size_t v3 = v7;
    }
  }
  memcpy((void *)(*(void *)a1 + *(unsigned int *)(a1 + 8)), __src, v3);
  unsigned int v8 = *(_DWORD *)(a1 + 8) + v3;
  *(_DWORD *)(a1 + 8) = v8;
  if (!*(unsigned char *)(a1 + 22)) {
    *(unsigned char *)(*(void *)a1 + v8) = 0;
  }
  return v3;
}

uint64_t os_trace_blob_grow(uint64_t a1, uint64_t a2)
{
  unsigned int v3 = *(_DWORD *)(a1 + 8);
  if (*(unsigned char *)(a1 + 22)) {
    size_t v4 = v3;
  }
  else {
    size_t v4 = v3 + 1;
  }
  size_t v5 = v4 + a2;
  if (__CFADD__(v4, a2) || HIDWORD(v5))
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    unsigned int v7 = *(_DWORD *)(a1 + 16);
  }
  else
  {
    unsigned int v6 = *(_DWORD *)(a1 + 12);
    if ((v6 & 0x80000000) != 0)
    {
      unsigned int v7 = *(_DWORD *)(a1 + 16);
    }
    else
    {
      if (2 * v6 > v5) {
        LODWORD(v5) = 2 * v6;
      }
      if (*(_DWORD *)(a1 + 16) >= v5) {
        unsigned int v7 = v5;
      }
      else {
        unsigned int v7 = *(_DWORD *)(a1 + 16);
      }
    }
  }
  if (v7 > v6)
  {
    unsigned int v8 = *(void **)a1;
    if (*(_WORD *)(a1 + 20))
    {
      while (1)
      {
        uint64_t v10 = malloc_type_realloc(v8, v7, 0x543E7918uLL);
        if (v10) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }
      *(void *)a1 = v10;
    }
    else
    {
      while (1)
      {
        uint64_t v9 = malloc_type_malloc(v7, 0x91D685AAuLL);
        if (v9) {
          break;
        }
        _os_trace_temporary_resource_shortage();
      }
      *(void *)a1 = v9;
      memcpy(v9, v8, v4);
      *(_WORD *)(a1 + 20) |= 1u;
    }
    *(_DWORD *)(a1 + 12) = v7;
  }
  return v7 - v4;
}

unint64_t _os_log_fmt_plugin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, unsigned __int8 *a5, unsigned int a6, char a7)
{
  uint64_t v25 = *MEMORY[0x1E4F14BF8];
  plugin = os_log_fmt_get_plugin(*(const char **)(a3 + 32), *(unsigned __int16 *)(a3 + 14));
  unint64_t v15 = (unint64_t)plugin;
  if (plugin)
  {
    if (!plugin[3]) {
      return 0;
    }
    char v16 = *a4;
    if (os_log_fmt_object_for_data_onceToken != -1) {
      dispatch_once(&os_log_fmt_object_for_data_onceToken, &__block_literal_global);
    }
    double v17 = (*(_WORD *)(a3 + 8) & 0x10) != 0 ? COERCE_DOUBLE(os_log_fmt_read_scalar(a3, a5, a6)) : 0.0;
    switch(*(unsigned char *)(a3 + 10))
    {
      case 1:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithChar:SLOBYTE(v17)];
        break;
      case 2:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedChar:LOBYTE(v17)];
        break;
      case 3:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithShort:SLOWORD(v17)];
        break;
      case 4:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedShort:LOWORD(v17)];
        break;
      case 5:
      case 7:
      case 8:
        goto LABEL_21;
      case 6:
        goto LABEL_17;
      case 9:
        if (a2 == 4)
        {
LABEL_21:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithInt:*(void *)&v17];
        }
        else
        {
          if (a2 == 8) {
            goto LABEL_20;
          }
LABEL_22:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithLongLong:*(void *)&v17];
        }
        break;
      case 0xA:
      case 0xD:
        if (a2 == 4)
        {
LABEL_17:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedInt:*(void *)&v17];
        }
        else if (a2 == 8)
        {
LABEL_20:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithLong:*(void *)&v17];
        }
        else
        {
LABEL_15:
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithUnsignedLongLong:*(void *)&v17];
        }
        break;
      case 0xB:
        goto LABEL_22;
      case 0xC:
        goto LABEL_15;
      case 0xE:
      case 0xF:
        id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSNumber) initWithDouble:v17];
        break;
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x13:
        if ((v16 & 0xF0) == 0x30)
        {
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSData) initWithBytes:a5 length:a6];
        }
        else if (a6)
        {
          id v18 = (id)[objc_alloc((Class)os_log_fmt_object_for_data__NSString) initWithBytes:a5 length:a6 - 1 encoding:4];
        }
        else
        {
          id v18 = objc_alloc_init((Class)os_log_fmt_object_for_data__NSString);
        }
        break;
      default:
        return 0;
    }
    uint64_t v19 = v18;
    if (v18)
    {
      uint64_t v23 = 1;
      BYTE4(v23) = a7;
      __strlcpy_chk();
      uint64_t v20 = (void *)(*(uint64_t (**)(char *, void *, uint64_t *))(v15 + 24))(v24, v19, &v23);
      uint64_t v21 = (void *)[v20 string];
      unint64_t v15 = v21 != 0;
      if (v21) {
        os_trace_blob_adds_CF(a1, v21);
      }
    }
    else
    {
      return 0;
    }
  }
  return v15;
}

#error "19DC86308: call analysis failed (funcsize=18)"

void *os_log_fmt_get_plugin(const char *a1, size_t a2)
{
  if (_dyld_dlsym_blocked()) {
    return 0;
  }
  if (qword_1EB1CF8D0 != -1) {
    dispatch_once_f(&qword_1EB1CF8D0, 0, (dispatch_function_t)_os_trace_formatters_list);
  }
  unint64_t v4 = qword_1EB1CF8C8;
  if (!qword_1EB1CF8C8) {
    return 0;
  }
  unint64_t v5 = 0;
  uint64_t v6 = _formatters;
  while (1)
  {
    unint64_t v7 = (v4 + v5) >> 1;
    unsigned int v8 = *(const char **)(v6 + 40 * v7 + 8);
    int v9 = strncasecmp(a1, v8, a2);
    if (!v9) {
      break;
    }
LABEL_9:
    if (v9 < 0) {
      unint64_t v4 = (v4 + v5) >> 1;
    }
    else {
      unint64_t v5 = v7 + 1;
    }
    if (v5 >= v4) {
      return 0;
    }
  }
  if (v8[a2])
  {
    int v9 = -v8[a2];
    goto LABEL_9;
  }
  uint64_t v10 = (void *)(v6 + 40 * v7);
  if (*v10 != -1) {
    dispatch_once_f((dispatch_once_t *)(v6 + 40 * v7), (void *)(v6 + 40 * v7), (dispatch_function_t)_os_trace_load_formatter);
  }
  return v10;
}

unint64_t os_trace_blob_adds_CF(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (unsigned char *)[v3 _fastCStringContents:1];
  if (v4)
  {
    unint64_t v5 = os_trace_blob_addns(a1, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    unint64_t v6 = [v3 lengthOfBytesUsingEncoding:4];
    unint64_t v12 = v6;
    unsigned int v7 = *(_DWORD *)(a1 + 8);
    unint64_t v8 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v7 - 1;
    if (v6 > v8)
    {
      unint64_t v9 = v6;
      os_trace_blob_grow(a1, v6);
      unsigned int v7 = *(_DWORD *)(a1 + 8);
      unint64_t v8 = *(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v7 - 1;
      if (v9 > v8) {
        *(_WORD *)(a1 + 20) |= 2u;
      }
    }
    [v3 getBytes:*(void *)a1 + v7 maxLength:v8 usedLength:&v12 encoding:4 options:1 range:0 remainingRange:objc_msgSend(v3, "length")];
    unint64_t v5 = v12;
    unsigned int v10 = *(_DWORD *)(a1 + 8) + v12;
    *(_DWORD *)(a1 + 8) = v10;
    if (!*(unsigned char *)(a1 + 22)) {
      *(unsigned char *)(*(void *)a1 + v10) = 0;
    }
  }

  return v5;
}

void _os_log_impl_dynamic(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6)
{
  uint64_t v18 = *MEMORY[0x1E4F14BF8];
  void v14[2] = 0;
  v14[0] = &v17;
  v14[1] = 0x40000000000;
  if (a4)
  {
    if (os_trace_blob_vaddf_CF_once != -1) {
      dispatch_once(&os_trace_blob_vaddf_CF_once, &__block_literal_global_350);
    }
    *__error() = a5;
    unsigned int v10 = (void *)MEMORY[0x19F3B0E70]();
    uint64_t v11 = (objc_class *)os_trace_blob_vaddf_CF__NSString;
    id v12 = a4;
    size_t v13 = (void *)[[v11 alloc] initWithFormat:v12 arguments:a6];

    os_trace_blob_adds_CF((uint64_t)v14, v13);
  }
  else
  {
    os_trace_blob_vaddf((uint64_t)v14, *(const char **)(a1 + 40), a5, a6);
  }
  int v15 = 136380675;
  uint64_t v16 = v14[0];
  *(void *)(a1 + 40) = "%s";
  _os_log_impl_flatten_and_send(a1);
}

unint64_t _os_log_fmt_compose_scalar(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, int a5)
{
  uint64_t v33 = *MEMORY[0x1E4F14BF8];
  uint64_t scalar = os_log_fmt_read_scalar(a2, a4, a5);
  uint64_t v9 = scalar;
  __int16 v10 = *(_WORD *)(a2 + 8);
  if ((v10 & 2) == 0)
  {
    unsigned int v11 = 0;
    if ((v10 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v32 = *(_DWORD *)(a2 + 20);
  unsigned int v11 = 1;
  if ((v10 & 4) != 0) {
LABEL_5:
  }
    *(&v32 + v11++) = *(_DWORD *)(a2 + 24);
LABEL_6:
  MEMORY[0x1F41887A8](scalar);
  size_t v13 = (char *)&v32 - v12;
  unint64_t result = _os_log_fmt_compose_format_copy((unsigned char *)&v32 - v12, *(void **)a2, *(_WORD *)(a2 + 12));
  uint64_t v21 = *(unsigned __int8 *)(a2 + 10);
  switch(*(unsigned char *)(a2 + 10))
  {
    case 0:
    case 0x10:
    case 0x11:
    case 0x12:
    case 0x13:
      qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Unexpected type";
      qword_1E9450118 = v21;
      __break(1u);
      return result;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_7;
    case 8:
      unsigned int v26 = strerror(v9);
      unint64_t result = strlen(v26);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        int v27 = result;
        uint64_t v28 = *(unsigned int *)(a1 + 8);
        if (result > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v28 - 1))
        {
          return os_trace_blob_add_slow(a1, v26, result);
        }
        else
        {
          unint64_t result = (unint64_t)memcpy((void *)(*(void *)a1 + v28), v26, result);
          unsigned int v29 = *(_DWORD *)(a1 + 8) + v27;
          *(_DWORD *)(a1 + 8) = v29;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v29) = 0;
          }
        }
      }
      return result;
    case 9:
    case 0xA:
    case 0xD:
      if (a3 == 8 || v21 == 13) {
        goto LABEL_34;
      }
      unsigned int v22 = result;
      uint64_t v23 = result;
      uint64_t v24 = result - 1;
      unsigned int v25 = v13[v24];
      if (a3 == 4)
      {
        if ((v25 & 0x80000000) != 0) {
          unint64_t result = __maskrune(v13[v24], 0x8000uLL);
        }
        else {
          unint64_t result = *(_DWORD *)(MEMORY[0x1E4F14BF0] + 4 * v25 + 60) & 0x8000;
        }
        if (result) {
          unint64_t result = __tolower(v25);
        }
        else {
          v13[v22 - 2] = v25;
        }
        v13[v24] = result;
LABEL_7:
        if (v11 != 2)
        {
          if (v11 != 1)
          {
            if (v11) {
              return result;
            }
            return os_trace_blob_addf(a1, v13, v15, v16, v17, v18, v19, v20, v9);
          }
LABEL_38:
          HIWORD(v31) = HIWORD(v9);
          return os_trace_blob_addf(a1, v13, v15, v16, v17, v18, v19, v20, v32);
        }
      }
      else
      {
        if ((v25 & 0x80000000) != 0) {
          unint64_t result = __maskrune(v13[v24], 0x8000uLL);
        }
        else {
          unint64_t result = *(_DWORD *)(MEMORY[0x1E4F14BF0] + 4 * v25 + 60) & 0x8000;
        }
        if (result)
        {
          v13[v22] = 108;
          unint64_t result = __tolower(v25);
          LOBYTE(v25) = result;
          uint64_t v23 = v22 + 1;
          unsigned int v30 = 2;
        }
        else
        {
          v13[v22 - 2] = 108;
          unsigned int v30 = 1;
        }
        v13[v24] = 108;
        v13[v23] = v25;
        v13[v30 + (unint64_t)v22] = 0;
LABEL_34:
        if (v11 != 2)
        {
          if (v11 != 1)
          {
            if (v11) {
              return result;
            }
            return os_trace_blob_addf(a1, v13, v15, v16, v17, v18, v19, v20, v9);
          }
          goto LABEL_38;
        }
      }
      return os_trace_blob_addf(a1, v13, v15, v16, v17, v18, v19, v20, v32);
    case 0xB:
    case 0xC:
    case 0xE:
    case 0xF:
      goto LABEL_34;
    default:
      return result;
  }
}

uint64_t os_log_fmt_read_scalar(uint64_t a1, unsigned __int8 *a2, int a3)
{
  int v3 = *(unsigned __int8 *)(a1 + 10);
  if (v3 == 15 || v3 == 14) {
    return *(void *)a2;
  }
  if ((*(_WORD *)(a1 + 8) & 0x20) != 0)
  {
    switch(a3)
    {
      case 1:
        uint64_t result = *a2;
        break;
      case 2:
        uint64_t result = *(unsigned __int16 *)a2;
        break;
      case 4:
        uint64_t result = *(unsigned int *)a2;
        break;
      case 8:
        return *(void *)a2;
      default:
LABEL_14:
        uint64_t result = _os_crash();
        __break(1u);
        break;
    }
  }
  else
  {
    switch(a3)
    {
      case 1:
        uint64_t result = (char)*a2;
        break;
      case 2:
        uint64_t result = *(__int16 *)a2;
        break;
      case 4:
        uint64_t result = *(int *)a2;
        break;
      case 8:
        return *(void *)a2;
      default:
        goto LABEL_14;
    }
  }
  return result;
}

uint64_t ___os_state_request_for_self_impl_block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 24) + 16))();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t _os_log_fmt_flatten_masked_data(unsigned char *a1, int a2, uint64_t a3, uint64_t a4, unsigned char *a5, unint64_t a6, size_t a7, unsigned char *a8)
{
  uint64_t v20 = *MEMORY[0x1E4F14BF8];
  if (!a3)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_47;
  }
  size_t v8 = a7;
  uint64_t v10 = a4;
  uint64_t v9 = a1;
  unsigned int v12 = *a1;
  *a1 = v12 & 0xF8 | 2;
  if (a3 <= 0x656D616E6C69616CLL)
  {
    if (a3 <= 0x786F626C69616CLL)
    {
      if (a3 == 1752392040) {
        goto LABEL_17;
      }
      uint64_t v13 = 0x68736168766564;
      goto LABEL_16;
    }
    if (a3 == 0x786F626C69616DLL) {
      goto LABEL_17;
    }
    if (a3 != 0x35646D6E69616C70)
    {
      uint64_t v13 = 0x617474616C69616DLL;
      goto LABEL_16;
    }
    if (*a8)
    {
      LOWORD(v8) = 0;
      goto LABEL_34;
    }
    ccmd5_di();
    ccdigest();
    if (v8 > 0xF) {
      size_t v8 = 16;
    }
    else {
      *a8 = 1;
    }
    if ((*(_WORD *)(v10 + 20) & 2) != 0) {
      goto LABEL_34;
    }
    uint64_t v17 = *(unsigned int *)(v10 + 8);
    if (v8 <= (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v17 - 1))
    {
      memcpy((void *)(*(void *)v10 + v17), __src, v8);
      unsigned int v18 = *(_DWORD *)(v10 + 8) + v8;
      *(_DWORD *)(v10 + 8) = v18;
      if (!*(unsigned char *)(v10 + 22)) {
        *(unsigned char *)(*(void *)v10 + v18) = 0;
      }
      goto LABEL_34;
    }
LABEL_47:
    os_trace_blob_add_slow(v10, __src, v8);
    goto LABEL_34;
  }
  if (a3 > 0x6F6363616C69616CLL)
  {
    if (a3 == 0x6F6363616C69616DLL || a3 == 0x7075626D6C69616DLL) {
      goto LABEL_17;
    }
    uint64_t v13 = 0x726464616C69616DLL;
  }
  else
  {
    if (a3 == 0x656D616E6C69616DLL || a3 == 0x6A6275736C69616DLL) {
      goto LABEL_17;
    }
    uint64_t v13 = 0x6D6D75736C69616DLL;
  }
LABEL_16:
  if (a3 != v13)
  {
    LOWORD(v8) = 0;
    *a1 = v12 & 8 | 0xE2;
    *a8 = 0;
    return (unsigned __int16)v8;
  }
LABEL_17:
  if (!_os_log_mask_callback) {
    goto LABEL_33;
  }
  if (a3 > 0x6D6D75736C69616CLL)
  {
    if (a3 > 0x7075626D6C69616CLL)
    {
      if (a3 == 0x726464616C69616DLL) {
        goto LABEL_30;
      }
      uint64_t v14 = 0x7075626D6C69616DLL;
    }
    else
    {
      if (a3 == 0x6D6D75736C69616DLL) {
        goto LABEL_30;
      }
      uint64_t v14 = 0x6F6363616C69616DLL;
    }
  }
  else
  {
    if (a3 <= 0x656D616E6C69616CLL)
    {
      if (a3 != 0x786F626C69616DLL)
      {
        uint64_t v14 = 0x617474616C69616DLL;
        goto LABEL_29;
      }
LABEL_30:
      unsigned int v15 = v12 >> 4;
      if (v15 == 4 || v15 == 2) {
        goto LABEL_32;
      }
LABEL_33:
      LOWORD(v8) = 0;
      *a8 = 0;
      goto LABEL_34;
    }
    if (a3 == 0x656D616E6C69616DLL) {
      goto LABEL_30;
    }
    uint64_t v14 = 0x6A6275736C69616DLL;
  }
LABEL_29:
  if (a3 == v14) {
    goto LABEL_30;
  }
LABEL_32:
  __src[0] = 2;
  LOWORD(v8) = _os_log_mask_callback_impl(a2, __src, a3, a4, a5, a6, a7, a8);
  *uint64_t v9 = __src[0] & 0xF | *v9 & 0xF8;
LABEL_34:
  *v9 |= 0xF0u;
  return (unsigned __int16)v8;
}

uint64_t _os_log_mask_callback_impl(int a1, unsigned char *a2, uint64_t a3, uint64_t a4, unsigned char *a5, unint64_t a6, size_t a7, unsigned char *a8)
{
  size_t v8 = a8;
  __src[4] = *MEMORY[0x1E4F14BF8];
  if (a1 == 1)
  {
    if (a3 <= 0x6A6275736C69616CLL)
    {
      if (a3 > 0x786F626C69616CLL)
      {
        if (a3 == 0x786F626C69616DLL || a3 == 0x617474616C69616DLL) {
          goto LABEL_38;
        }
        uint64_t v13 = 0x656D616E6C69616DLL;
LABEL_37:
        if (a3 == v13) {
          goto LABEL_38;
        }
        goto LABEL_213;
      }
LABEL_31:
      if (a3 == 1752392040)
      {
        if (*a8)
        {
          LOWORD(a7) = 0;
        }
        else
        {
          _os_log_mask_create_digest((uint64_t)a5, a6, (uint64_t)&xmmword_1EB1CF840, (uint64_t)__src);
          if (a7 > 0xF) {
            a7 = 16;
          }
          else {
            unsigned char *v8 = 1;
          }
          if ((*(_WORD *)(a4 + 20) & 2) == 0)
          {
            uint64_t v59 = *(unsigned int *)(a4 + 8);
            if (a7 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v59 - 1))
            {
              os_trace_blob_add_slow(a4, __src, a7);
            }
            else
            {
              memcpy((void *)(*(void *)a4 + v59), __src, a7);
              unsigned int v60 = *(_DWORD *)(a4 + 8) + a7;
              *(_DWORD *)(a4 + 8) = v60;
              if (!*(unsigned char *)(a4 + 22)) {
                *(unsigned char *)(*(void *)a4 + v60) = 0;
              }
            }
          }
        }
        return (unsigned __int16)a7;
      }
      if (a3 == 0x68736168766564) {
        goto LABEL_33;
      }
LABEL_213:
      _os_crash();
      __break(1u);
      goto LABEL_214;
    }
    if (a3 <= 0x6F6363616C69616CLL)
    {
      if (a3 != 0x6A6275736C69616DLL)
      {
        uint64_t v13 = 0x6D6D75736C69616DLL;
        goto LABEL_37;
      }
    }
    else if (a3 != 0x726464616C69616DLL)
    {
      if (a3 != 0x7075626D6C69616DLL)
      {
        uint64_t v13 = 0x6F6363616C69616DLL;
        goto LABEL_37;
      }
      goto LABEL_33;
    }
LABEL_38:
    LOWORD(a7) = 0;
    *a2 = 1;
    return (unsigned __int16)a7;
  }
  if (a3 > 0x6A6275736C69616CLL)
  {
    if (a3 <= 0x6F6363616C69616CLL)
    {
      if (a3 == 0x6A6275736C69616DLL) {
        goto LABEL_42;
      }
      uint64_t v14 = 0x6D6D75736C69616DLL;
      goto LABEL_41;
    }
    if (a3 != 0x6F6363616C69616DLL)
    {
      if (a3 != 0x7075626D6C69616DLL)
      {
        if (a3 == 0x726464616C69616DLL)
        {
          LODWORD(v89) = 0x2000000;
          __src[0] = 0;
          unint64_t v15 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, a6, a6, __src, 0);
          uint64_t v16 = v15;
          char v17 = __src[0];
          if (__src[0] <= 1)
          {
            if (v15 >= 0xFF) {
              size_t v55 = 255;
            }
            else {
              size_t v55 = v15;
            }
            BYTE1(v89) = v55;
            uint64_t v56 = v8;
            if (a7 > 3)
            {
              size_t v57 = 4;
            }
            else
            {
              unsigned char *v8 = 1;
              size_t v57 = a7;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v76 = *(unsigned int *)(a4 + 8);
              if (v57 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v76 - 1))
              {
                os_trace_blob_add_slow(a4, &v89, v57);
              }
              else
              {
                memcpy((void *)(*(void *)a4 + v76), &v89, v57);
                unsigned int v77 = *(_DWORD *)(a4 + 8) + v57;
                *(_DWORD *)(a4 + 8) = v77;
                if (!*(unsigned char *)(a4 + 22)) {
                  *(unsigned char *)(*(void *)a4 + v77) = 0;
                }
              }
            }
            if (a7 - v57 < v55)
            {
              *uint64_t v56 = 1;
              size_t v55 = a7 - v57;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v78 = *(unsigned int *)(a4 + 8);
              if (v55 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v78 - 1))
              {
                os_trace_blob_add_slow(a4, a5, v55);
              }
              else
              {
                memcpy((void *)(*(void *)a4 + v78), a5, v55);
                unsigned int v79 = *(_DWORD *)(a4 + 8) + v55;
                *(_DWORD *)(a4 + 8) = v79;
                if (!*(unsigned char *)(a4 + 22)) {
                  *(unsigned char *)(*(void *)a4 + v79) = 0;
                }
              }
            }
            LOWORD(a7) = v55 + v57;
          }
          else
          {
            unsigned int v18 = v8;
            if (__src[0] >= 0xFF) {
              char v17 = -1;
            }
            BYTE1(v89) = v17;
            unint64_t v19 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, v15, 1uLL, __src, 64);
            if (v19 >= 0xFF) {
              size_t v20 = 255;
            }
            else {
              size_t v20 = v19;
            }
            BYTE2(v89) = v20;
            uint64_t v21 = strnstr(&a5[v19], "@", v16 - v19);
            if (v21) {
              unsigned int v22 = v21;
            }
            else {
              unsigned int v22 = &a5[v16];
            }
            size_t v23 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(v22, &a5[v16] - v22, 2uLL, __src, 0);
            _os_log_mask_create_device_digest((uint64_t)a5, v16, (uint64_t)__src);
            LOBYTE(v89) = 2;
            if (a7 > 3)
            {
              size_t v24 = 4;
            }
            else
            {
              *unsigned int v18 = 1;
              size_t v24 = a7;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v73 = *(unsigned int *)(a4 + 8);
              if (v24 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v73 - 1))
              {
                os_trace_blob_add_slow(a4, &v89, v24);
              }
              else
              {
                memcpy((void *)(*(void *)a4 + v73), &v89, v24);
                unsigned int v74 = *(_DWORD *)(a4 + 8) + v24;
                *(_DWORD *)(a4 + 8) = v74;
                if (!*(unsigned char *)(a4 + 22)) {
                  *(unsigned char *)(*(void *)a4 + v74) = 0;
                }
              }
            }
            size_t v75 = a7 - v24;
            if (a7 - v24 > 1) {
              size_t v75 = 2;
            }
            else {
              *unsigned int v18 = 1;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v80 = *(unsigned int *)(a4 + 8);
              if (v75 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v80 - 1))
              {
                os_trace_blob_add_slow(a4, __src, v75);
              }
              else
              {
                memcpy((void *)(*(void *)a4 + v80), __src, v75);
                unsigned int v81 = *(_DWORD *)(a4 + 8) + v75;
                *(_DWORD *)(a4 + 8) = v81;
                if (!*(unsigned char *)(a4 + 22)) {
                  *(unsigned char *)(*(void *)a4 + v81) = 0;
                }
              }
            }
            size_t v82 = v75 + v24;
            if (a7 - v82 < v20)
            {
              *unsigned int v18 = 1;
              size_t v20 = a7 - v82;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v83 = *(unsigned int *)(a4 + 8);
              if (v20 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v83 - 1))
              {
                os_trace_blob_add_slow(a4, a5, v20);
              }
              else
              {
                memcpy((void *)(*(void *)a4 + v83), a5, v20);
                unsigned int v84 = *(_DWORD *)(a4 + 8) + v20;
                *(_DWORD *)(a4 + 8) = v84;
                if (!*(unsigned char *)(a4 + 22)) {
                  *(unsigned char *)(*(void *)a4 + v84) = 0;
                }
              }
            }
            if (v23 > a7 - (v20 + v82))
            {
              *unsigned int v18 = 1;
              size_t v23 = a7 - (v20 + v82);
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v85 = *(unsigned int *)(a4 + 8);
              if (v23 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v85 - 1))
              {
                os_trace_blob_add_slow(a4, v22, v23);
              }
              else
              {
                memcpy((void *)(*(void *)a4 + v85), v22, v23);
                unsigned int v86 = *(_DWORD *)(a4 + 8) + v23;
                *(_DWORD *)(a4 + 8) = v86;
                if (!*(unsigned char *)(a4 + 22)) {
                  *(unsigned char *)(*(void *)a4 + v86) = 0;
                }
              }
            }
            LOWORD(a7) = v23 + v20 + v82;
          }
          return (unsigned __int16)a7;
        }
        goto LABEL_213;
      }
LABEL_33:
      if (*a8)
      {
        LOWORD(v25) = 0;
      }
      else
      {
        _os_log_mask_create_device_digest((uint64_t)a5, a6, (uint64_t)__src);
        if (a3 == 0x7075626D6C69616DLL) {
          size_t v25 = 2;
        }
        else {
          size_t v25 = 16;
        }
        if (v25 > a7)
        {
          unsigned char *v8 = 1;
          size_t v25 = a7;
        }
        if ((*(_WORD *)(a4 + 20) & 2) == 0)
        {
          uint64_t v29 = *(unsigned int *)(a4 + 8);
          if (v25 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v29 - 1))
          {
            os_trace_blob_add_slow(a4, __src, v25);
          }
          else
          {
            memcpy((void *)(*(void *)a4 + v29), __src, v25);
            unsigned int v30 = *(_DWORD *)(a4 + 8) + v25;
            *(_DWORD *)(a4 + 8) = v30;
            if (!*(unsigned char *)(a4 + 22)) {
              *(unsigned char *)(*(void *)a4 + v30) = 0;
            }
          }
        }
      }
      LOWORD(a7) = v25;
      return (unsigned __int16)a7;
    }
  }
  else
  {
    if (a3 <= 0x786F626C69616CLL) {
      goto LABEL_31;
    }
    if (a3 != 0x786F626C69616DLL)
    {
      if (a3 != 0x617474616C69616DLL)
      {
        uint64_t v14 = 0x656D616E6C69616DLL;
LABEL_41:
        if (a3 != v14) {
          goto LABEL_213;
        }
        goto LABEL_42;
      }
      LODWORD(v89) = 0x1000000;
      __src[0] = 0;
      unint64_t v31 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, a6, a6, __src, 0);
      unint64_t v32 = v31;
      if (v31)
      {
        uint64_t v33 = 0;
        unint64_t v34 = __src[0];
        uint64_t v35 = 5;
        if (v31 < 5) {
          uint64_t v35 = v31;
        }
        int v36 = a5 - 1;
        while (v35 != v33)
        {
          int v37 = v36[v31];
          ++v33;
          --v36;
          if (v37 == 46) {
            goto LABEL_134;
          }
        }
        uint64_t v33 = v35;
LABEL_134:
        unsigned __int16 v58 = v8;
        uint64_t v61 = &a5[v31 - v33];
        if (v61 != a5)
        {
          _os_log_mask_create_device_digest((uint64_t)a5, v31, (uint64_t)__src);
          char v62 = 0;
          size_t v63 = 2;
          LOBYTE(v89) = 2;
          char v64 = -1;
          if (v34 < 0xFF) {
            char v64 = v34;
          }
          BYTE1(v89) = v64;
LABEL_139:
          if (a7 > 3)
          {
            size_t v65 = 4;
          }
          else
          {
            *unsigned __int16 v58 = 1;
            size_t v65 = a7;
          }
          if ((*(_WORD *)(a4 + 20) & 2) == 0)
          {
            uint64_t v66 = *(unsigned int *)(a4 + 8);
            if (v65 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v66 - 1))
            {
              os_trace_blob_add_slow(a4, &v89, v65);
              if ((v62 & 1) == 0) {
                goto LABEL_147;
              }
              goto LABEL_154;
            }
            memcpy((void *)(*(void *)a4 + v66), &v89, v65);
            unsigned int v67 = *(_DWORD *)(a4 + 8) + v65;
            *(_DWORD *)(a4 + 8) = v67;
            if (!*(unsigned char *)(a4 + 22)) {
              *(unsigned char *)(*(void *)a4 + v67) = 0;
            }
          }
          if ((v62 & 1) == 0)
          {
LABEL_147:
            if (a7 - v65 < v63)
            {
              *unsigned __int16 v58 = 1;
              size_t v63 = a7 - v65;
            }
            if ((*(_WORD *)(a4 + 20) & 2) == 0)
            {
              uint64_t v68 = *(unsigned int *)(a4 + 8);
              if (v63 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v68 - 1))
              {
                os_trace_blob_add_slow(a4, __src, v63);
              }
              else
              {
                memcpy((void *)(*(void *)a4 + v68), __src, v63);
                unsigned int v69 = *(_DWORD *)(a4 + 8) + v63;
                *(_DWORD *)(a4 + 8) = v69;
                if (!*(unsigned char *)(a4 + 22)) {
                  *(unsigned char *)(*(void *)a4 + v69) = 0;
                }
              }
            }
            v65 += v63;
          }
LABEL_154:
          size_t v70 = a5 - v61 + v32;
          if (v70 > a7 - v65)
          {
            *unsigned __int16 v58 = 1;
            size_t v70 = a7 - v65;
          }
          if ((*(_WORD *)(a4 + 20) & 2) == 0)
          {
            uint64_t v71 = *(unsigned int *)(a4 + 8);
            if (v70 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v71 - 1))
            {
              os_trace_blob_add_slow(a4, v61, v70);
            }
            else
            {
              memcpy((void *)(*(void *)a4 + v71), v61, v70);
              unsigned int v72 = *(_DWORD *)(a4 + 8) + v70;
              *(_DWORD *)(a4 + 8) = v72;
              if (!*(unsigned char *)(a4 + 22)) {
                *(unsigned char *)(*(void *)a4 + v72) = 0;
              }
            }
          }
          LOWORD(a7) = v70 + v65;
          return (unsigned __int16)a7;
        }
      }
      else
      {
        unsigned __int16 v58 = v8;
      }
      size_t v63 = 0;
      char v62 = 1;
      uint64_t v61 = a5;
      goto LABEL_139;
    }
  }
LABEL_42:
  int v88 = 0;
  __src[0] = 0;
  unint64_t v26 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, a6, a6, __src, 0);
  unint64_t v27 = __src[0];
  if (a3 > 0x6D6D75736C69616CLL)
  {
    if (a3 > 0x7075626D6C69616CLL)
    {
      if (a3 == 0x7075626D6C69616DLL)
      {
        unint64_t v28 = 0;
        goto LABEL_79;
      }
      if (a3 == 0x726464616C69616DLL)
      {
        unint64_t v28 = 1;
        goto LABEL_79;
      }
      goto LABEL_214;
    }
    if (a3 != 0x6D6D75736C69616DLL)
    {
      if (a3 != 0x6F6363616C69616DLL) {
        goto LABEL_214;
      }
LABEL_50:
      unint64_t v28 = 2;
      goto LABEL_79;
    }
LABEL_65:
    unint64_t v28 = 3;
    goto LABEL_79;
  }
  if (a3 > 0x656D616E6C69616CLL)
  {
    if (a3 != 0x656D616E6C69616DLL && a3 != 0x6A6275736C69616DLL) {
      goto LABEL_214;
    }
    goto LABEL_65;
  }
  if (a3 == 0x786F626C69616DLL) {
    goto LABEL_50;
  }
  if (a3 == 0x617474616C69616DLL)
  {
    unint64_t v28 = 5;
LABEL_79:
    char v38 = -1;
    if (__src[0] < 0xFF) {
      char v38 = __src[0];
    }
    BYTE1(v88) = v38;
    if (__src[0] <= v28)
    {
      unsigned int v39 = 0;
    }
    else
    {
      _os_log_mask_create_device_digest((uint64_t)a5, v26, (uint64_t)__src);
      unsigned int v39 = 2;
    }
    LOBYTE(v88) = v39;
    if (a7 > 3)
    {
      size_t v40 = 4;
    }
    else
    {
      unsigned char *v8 = 1;
      size_t v40 = a7;
    }
    if ((*(_WORD *)(a4 + 20) & 2) == 0)
    {
      uint64_t v41 = *(unsigned int *)(a4 + 8);
      if (v40 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v41 - 1))
      {
        os_trace_blob_add_slow(a4, &v88, v40);
      }
      else
      {
        memcpy((void *)(*(void *)a4 + v41), &v88, v40);
        unsigned int v42 = *(_DWORD *)(a4 + 8) + v40;
        *(_DWORD *)(a4 + 8) = v42;
        if (!*(unsigned char *)(a4 + 22)) {
          *(unsigned char *)(*(void *)a4 + v42) = 0;
        }
      }
    }
    if (v27 > v28)
    {
      size_t v43 = a7 - v40;
      if (a7 - v40 >= v39) {
        size_t v43 = v39;
      }
      else {
        unsigned char *v8 = 1;
      }
      if ((*(_WORD *)(a4 + 20) & 2) == 0)
      {
        uint64_t v44 = *(unsigned int *)(a4 + 8);
        if (v43 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v44 - 1))
        {
          os_trace_blob_add_slow(a4, __src, v43);
        }
        else
        {
          memcpy((void *)(*(void *)a4 + v44), __src, v43);
          unsigned int v45 = *(_DWORD *)(a4 + 8) + v43;
          *(_DWORD *)(a4 + 8) = v45;
          if (!*(unsigned char *)(a4 + 22)) {
            *(unsigned char *)(*(void *)a4 + v45) = 0;
          }
        }
      }
      v40 += v43;
    }
    if (a3 == 0x6A6275736C69616DLL)
    {
      __int16 v46 = a5;
      atomic_ullong v87 = v8;
      if (v26 >= 4)
      {
        unint64_t v47 = v26;
        __int16 v46 = a5;
        do
        {
          if (!strncmp(v46, "Re: ", 4uLL))
          {
            uint64_t v48 = -4;
            uint64_t v49 = 4;
          }
          else
          {
            if (v47 < 5 || strncmp(v46, "Fwd: ", 5uLL)) {
              break;
            }
            uint64_t v48 = -5;
            uint64_t v49 = 5;
          }
          v46 += v49;
          v47 += v48;
        }
        while (v47 > 3);
      }
      unsigned __int8 v50 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(v46, v26 - (v46 - a5), v28, &v89, 0)
          + (_BYTE)v46
          - (_BYTE)a5;
      size_t v8 = v87;
    }
    else
    {
      unsigned __int8 v50 = _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(a5, v26, v28, &v89, 0);
    }
    if (v50 >= v26) {
      size_t v51 = v26;
    }
    else {
      size_t v51 = v50;
    }
    if (v51 > a7 - v40)
    {
      unsigned char *v8 = 1;
      size_t v51 = a7 - v40;
    }
    if ((*(_WORD *)(a4 + 20) & 2) == 0)
    {
      uint64_t v52 = *(unsigned int *)(a4 + 8);
      if (v51 > (*(char *)(a4 + 22) + *(_DWORD *)(a4 + 12) - v52 - 1))
      {
        os_trace_blob_add_slow(a4, a5, v51);
      }
      else
      {
        memcpy((void *)(*(void *)a4 + v52), a5, v51);
        unsigned int v53 = *(_DWORD *)(a4 + 8) + v51;
        *(_DWORD *)(a4 + 8) = v53;
        if (!*(unsigned char *)(a4 + 22)) {
          *(unsigned char *)(*(void *)a4 + v53) = 0;
        }
      }
    }
    LOWORD(a7) = v51 + v40;
    return (unsigned __int16)a7;
  }
LABEL_214:
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _os_log_mask_create_digest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v9[1] = *MEMORY[0x1E4F14BF8];
  uint64_t v5 = ccsha256_di();
  MEMORY[0x1F41887A8](v5);
  unsigned int v7 = (char *)v9 - v6;
  ccdigest_init();
  ccdigest_update();
  ccdigest_update();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 56))(v5, v7, a4);
  return cc_clear();
}

void _os_state_block_entry_free(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  _Block_release(*(const void **)(a1 + 24));

  free((void *)a1);
}

uint64_t _os_trace_assumes_log()
{
  return 1;
}

void *___os_state_request_for_self_block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F14BF8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t value = *(unsigned __int8 *)(a1 + 72);
  long long v29 = *(_OWORD *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 64);
  uint64_t v30 = *(void *)(a1 + 56);
  time_t v3 = time(0);
  xpc_object_t v4 = xpc_array_create(0, 0);
  uint64_t v5 = (int *)os_state_blocks;
  if (os_state_blocks)
  {
    dispatch_block_t destructor = (dispatch_block_t)*MEMORY[0x1E4F14BC0];
    while (1)
    {
      if (v30 != 1 || *((void *)v5 + 5) == v2)
      {
        uint64_t v6 = v3 - *((void *)v5 + 6);
        uint64_t v7 = v5[14];
        if (v6 >= v7) {
          break;
        }
      }
LABEL_29:
      uint64_t v5 = *(int **)v5;
      if (!v5) {
        goto LABEL_30;
      }
    }
    if (v6 >= v7 + 10)
    {
      if (v6 < 70) {
        goto LABEL_13;
      }
      int v8 = 1;
    }
    else if ((int)v7 <= 30)
    {
      int v8 = 2 * v7;
    }
    else
    {
      int v8 = 60;
    }
    v5[14] = v8;
LABEL_13:
    *((void *)v5 + 6) = v3;
    *(void *)uuid = 0;
    uint64_t v37 = 0;
    if (_dyld_get_image_uuid())
    {
      *(void *)unint64_t v32 = 0;
      uint64_t v33 = v32;
      uint64_t v34 = 0x2000000000;
      uint64_t v35 = 0;
      uint64_t v9 = *((void *)v5 + 4);
      block[0] = MEMORY[0x1E4F14BE8];
      block[1] = 0x40000000;
      block[2] = ___os_state_request_for_self_impl_block_invoke;
      block[3] = &unk_1E59846B8;
      block[4] = v32;
      block[5] = v5;
      block[6] = &v29;
      dispatch_sync(v9, block);
      uint64_t v10 = *((void *)v33 + 3);
      if (v10)
      {
        uint64_t v11 = *(unsigned int *)(v10 + 4);
        if (v11 < 0x7F39)
        {
          uint64_t v12 = v1;
          size_t v13 = v11 + 200;
          *(unsigned char *)(v10 + 199) = 0;
          *(unsigned char *)(v10 + 71) = 0;
          *(unsigned char *)(v10 + 135) = 0;
          xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
          unint64_t v15 = dispatch_data_create(*((const void **)v33 + 3), v13, 0, destructor);
          xpc_object_t v16 = xpc_data_create_with_dispatch_data(v15);
          xpc_dictionary_set_value(v14, "data", v16);
          xpc_release(v16);
          dispatch_release(v15);
          uint64_t v17 = mach_continuous_time();
          xpc_dictionary_set_uint64(v14, "ts", v17);
          xpc_dictionary_set_uuid(v14, "uuid", uuid);
          if (value) {
            xpc_dictionary_set_uint64(v14, "ttl", value);
          }
          xpc_array_append_value(v4, v14);
          xpc_release(v14);
          uint64_t v1 = v12;
          if (xpc_array_get_count(v4) == 10)
          {
            int v18 = v30;
            xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
            *(void *)buf = 0;
            uint64_t v39 = 0;
            xpc_dictionary_set_uint64(v19, "operation", 2uLL);
            if (_dyld_get_shared_cache_uuid()) {
              xpc_dictionary_set_uuid(v19, "dsc_uuid", buf);
            }
            xpc_dictionary_set_uint64(v19, "aid", v12);
            xpc_dictionary_set_value(v19, "entries", v4);
            if (byte_1EB1CF872 && v18 != 3) {
              xpc_dictionary_set_BOOL(v19, "quarantined", 1);
            }
            _os_trace_logd_send();
            xpc_release(v19);
            xpc_release(v4);
            xpc_object_t v4 = xpc_array_create(0, 0);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19DC79000, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Statedump too large", buf, 2u);
            uint64_t v10 = *((void *)v33 + 3);
          }
          free((void *)v10);
        }
      }
      _Block_object_dispose(v32, 8);
    }
    goto LABEL_29;
  }
LABEL_30:
  if (xpc_array_get_count(v4))
  {
    int v20 = v30;
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    *(void *)unint64_t v32 = 0;
    uint64_t v33 = 0;
    xpc_dictionary_set_uint64(v21, "operation", 2uLL);
    if (_dyld_get_shared_cache_uuid()) {
      xpc_dictionary_set_uuid(v21, "dsc_uuid", v32);
    }
    xpc_dictionary_set_uint64(v21, "aid", v1);
    xpc_dictionary_set_value(v21, "entries", v4);
    if (byte_1EB1CF872 && v20 != 3) {
      xpc_dictionary_set_BOOL(v21, "quarantined", 1);
    }
    _os_trace_logd_send();
    xpc_release(v21);
  }
  xpc_release(v4);
  *(void *)unint64_t v32 = 0;
  uint64_t v33 = v32;
  os_unfair_lock_lock_with_options();
  unsigned int v22 = (unsigned __int8 *)os_state_blocks;
  if (os_state_blocks)
  {
    do
    {
      size_t v23 = *(unsigned __int8 **)v22;
      if (v22[60])
      {
        size_t v24 = (unsigned __int8 **)*((void *)v22 + 1);
        if (v23)
        {
          *((void *)v23 + 1) = v24;
          size_t v24 = (unsigned __int8 **)*((void *)v22 + 1);
        }
        else
        {
          off_1EB1CF7B0 = (_UNKNOWN **)*((void *)v22 + 1);
        }
        *size_t v24 = v23;
        *(void *)unsigned int v22 = 0;
        *((void *)v22 + 1) = v33;
        *(void *)uint64_t v33 = v22;
        uint64_t v33 = v22;
        atomic_fetch_add_explicit(&dword_1EB1CF7DC, 0xFFFFFFFF, memory_order_relaxed);
      }
      unsigned int v22 = v23;
    }
    while (v23);
  }
  if (off_1EB1CF7B8)
  {
    *off_1EB1CF7B0 = off_1EB1CF7B8;
    *((void *)off_1EB1CF7B8 + 1) = off_1EB1CF7B0;
    off_1EB1CF7B0 = off_1EB1CF7C0;
    off_1EB1CF7B8 = 0;
    off_1EB1CF7C0 = &off_1EB1CF7B8;
  }
  byte_1EB1CF7D8 = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB1CF7C8);
  uint64_t result = *(void **)v32;
  if (*(void *)v32)
  {
    do
    {
      unint64_t v26 = (void *)*result;
      _os_state_block_entry_free((uint64_t)result);
      uint64_t result = v26;
    }
    while (v26);
  }
  return result;
}

void _os_trace_logd_send()
{
  uint64_t v0 = _os_trace_logd_pipe_copy(0);
  if (v0)
  {
    uint64_t v1 = v0;
    if (xpc_pipe_simpleroutine() == 32)
    {
      uint64_t v2 = _os_trace_logd_pipe_copy(v1);
      if (!v2) {
        return;
      }
      uint64_t v1 = v2;
      xpc_pipe_simpleroutine();
    }
    xpc_release(v1);
  }
}

uint64_t _os_trace_logd_send_with_reply()
{
  uint64_t v0 = _os_trace_logd_pipe_copy(0);
  if (v0)
  {
    uint64_t v1 = v0;
    if (xpc_pipe_routine() != 32)
    {
LABEL_5:
      xpc_release(v1);
      return 0;
    }
    uint64_t v2 = _os_trace_logd_pipe_copy(v1);
    if (v2)
    {
      uint64_t v1 = v2;
      xpc_pipe_routine();
      goto LABEL_5;
    }
  }
  return 0;
}

void *_os_trace_logd_pipe_copy(void *a1)
{
  os_unfair_lock_lock_with_options();
  uint64_t v2 = (void *)_event_pipe;
  if (a1)
  {
    if ((void *)_event_pipe == a1)
    {
      xpc_release(a1);
      uint64_t v2 = 0;
    }
    xpc_release(a1);
  }
  if (v2 || (uint64_t v2 = (void *)xpc_pipe_create(), (_event_pipe = (uint64_t)v2) != 0)) {
    xpc_retain(v2);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_event_lock);
  return v2;
}

uint64_t ___init_unreliable_thread_key_block_invoke()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&_os_log_unreliable_thread_key, 0);
  if (result)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  return result;
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  _os_log((uint64_t)dso, (uint64_t)log, type, (uint64_t)format, (uint64_t)buf, *(uint64_t *)&size, v6);
}

void ___os_trace_paths_init_block_invoke()
{
  _os_trace_system_preferences_path = (uint64_t)"/System/Library/Preferences/Logging";
  _os_trace_os_cryptex_system_preferences_path = (uint64_t)"/System/Cryptexes/OS/System/Library/Preferences/Logging";
  _os_trace_app_cryptex_system_preferences_path = (uint64_t)"/System/Cryptexes/App/System/Library/Preferences/Logging";
  _os_trace_internal_preferences_path = (uint64_t)"/AppleInternal/Library/Preferences/Logging";
  _os_trace_preferences_path = (uint64_t)"/Library/Preferences/Logging";
}

uint64_t ___os_trace_allow_development_env_vars_block_invoke()
{
  uint64_t v2 = 0;
  uint64_t result = amfi_check_dyld_policy_self(0, &v2);
  char v1 = BYTE1(v2) & 1;
  if (result) {
    char v1 = 0;
  }
  _os_trace_allow_development_env_vars_allowed = v1;
  return result;
}

uint64_t amfi_check_dyld_policy_self(uint64_t a1, void *a2)
{
  if (!a2) {
    return 22;
  }
  *a2 = 0;
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  v4[1] = a1;
  v4[2] = v4;
  uint64_t result = __sandbox_ms();
  if (result) {
    uint64_t result = *__error();
  }
  *a2 = v4[0];
  return result;
}

void __client_has_mach_ports_disabled_block_invoke()
{
  uint64_t v0 = (void *)xpc_copy_entitlement_for_token();
  if (v0 == (void *)MEMORY[0x1E4F14CF0])
  {
    client_has_mach_ports_disabled_has_entitlement = 1;
  }
  else if (!v0)
  {
    return;
  }

  xpc_release(v0);
}

uint64_t _libtrace_init()
{
  _os_trace_dsc_load_addr = _dyld_get_shared_cache_range();
  if (getpid() == 1) {
    _os_trace_commpage_setup();
  }
  dword_1EB1CFB58 = 0;
  _os_log_mask_callback = (uint64_t)_os_log_mask_callback_impl;
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  qword_1EB1CF7D0 = (uint64_t)dispatch_queue_create("com.apple.libtrace.state.block-list", v0);
  dword_1EB1CF800 = _os_trace_create_debug_control_port();

  return MEMORY[0x1F40CF540](&_libtrace_hooks);
}

uint64_t _os_trace_create_debug_control_port()
{
  options.reserved[1] = 0;
  *(_OWORD *)&options.flags = xmmword_19DC940A8;
  mach_port_name_t name = 0;
  uint64_t v0 = (task_t *)MEMORY[0x1E4F14C48];
  if (mach_port_construct(*MEMORY[0x1E4F14C48], &options, 0x71B75ACEuLL, &name))
  {
    _os_assumes_log();
    return 0;
  }
  else
  {
    if (task_set_special_port(*v0, 10, name)) {
      _os_assumes_log();
    }
    return name;
  }
}

void os_state_remove_handler(void *a1)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if ((BYTE9(xmmword_1EB1CF7F0) & 1) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
  {
    uint64_t v2 = &os_state_blocks;
    os_unfair_lock_lock_with_options();
    do
    {
      uint64_t v2 = (_UNKNOWN **)*v2;
      if (!v2)
      {
        uint64_t v2 = &off_1EB1CF7B8;
        while (1)
        {
          uint64_t v2 = (_UNKNOWN **)*v2;
          if (!v2) {
            goto LABEL_11;
          }
          if (v2[2] == a1)
          {
            time_t v3 = (_UNKNOWN **)*v2;
            xpc_object_t v4 = v2[1];
            if (*v2) {
              goto LABEL_19;
            }
            off_1EB1CF7C0 = (_UNKNOWN **)v2[1];
            goto LABEL_21;
          }
        }
      }
    }
    while (*((unsigned char *)v2 + 60) || v2[2] != a1);
    if (byte_1EB1CF7D8)
    {
      *((unsigned char *)v2 + 60) = 1;
LABEL_11:
      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB1CF7C8);
      return;
    }
    time_t v3 = (_UNKNOWN **)*v2;
    xpc_object_t v4 = v2[1];
    if (*v2)
    {
LABEL_19:
      v3[1] = v4;
      xpc_object_t v4 = v2[1];
    }
    else
    {
      off_1EB1CF7B0 = (_UNKNOWN **)v2[1];
    }
LABEL_21:
    *xpc_object_t v4 = v3;
    atomic_fetch_add_explicit(&dword_1EB1CF7DC, 0xFFFFFFFF, memory_order_relaxed);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EB1CF7C8);
    _os_state_block_entry_free((uint64_t)v2);
  }
}

uint64_t _os_trace_get_logd_port()
{
  if ((BYTE9(xmmword_1EB1CF7F0) & 1) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0) {
    return 0;
  }
  if (client_has_mach_ports_disabled_once != -1) {
    dispatch_once(&client_has_mach_ports_disabled_once, &__block_literal_global_34);
  }
  if (client_has_mach_ports_disabled_has_entitlement) {
    return 0;
  }
  if (bootstrap_look_up2()) {
    return 0;
  }
  return HIDWORD(xmmword_1EB1CF7F0);
}

image_offset **os_log_backtrace_create_from_return_address(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F14BF8];
  MEMORY[0x1F41887A8](a1);
  uint64_t v5 = &v12[-v4];
  if (v3 >= 0x200) {
    size_t v6 = 512;
  }
  else {
    size_t v6 = v3;
  }
  bzero(&v12[-v4], v6);
  unsigned int v13 = 0;
  thread_stack_async_pcs();
  uint64_t v7 = v13;
  if (v13)
  {
    unsigned int v8 = v13 - 1;
    while (!*(void *)&v5[8 * (v7 - 1)])
    {
      unsigned int v13 = v8--;
      --v7;
      if (v8 == -1)
      {
        LODWORD(v7) = 0;
        goto LABEL_9;
      }
    }
    BOOL v9 = v7 != 0;
    if (v7)
    {
      uint64_t v11 = 0;
      while (*(void *)&v5[8 * v11] != a2)
      {
        if (v7 == ++v11) {
          return os_log_backtrace_create_from_pcs((void *const *)&v5[8 * v9], (int)v7 - v9);
        }
      }
      BOOL v9 = v11;
    }
  }
  else
  {
LABEL_9:
    BOOL v9 = 0;
  }
  return os_log_backtrace_create_from_pcs((void *const *)&v5[8 * v9], (int)v7 - v9);
}

image_offset **os_log_backtrace_create_from_pcs(void *const *a1, int a2)
{
  while (1)
  {
    uint64_t v4 = (image_offset **)malloc_type_calloc(1uLL, 0x10uLL, 0x478C0A82uLL);
    if (v4) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  uint64_t v5 = v4;
  *((_DWORD *)v4 + 2) = a2;
  while (1)
  {
    size_t v6 = (image_offset *)malloc_type_malloc(20 * a2, 0x91D685AAuLL);
    if (v6) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  *uint64_t v5 = v6;
  backtrace_image_offsets(a1, v6, a2);
  return v5;
}

uint64_t os_trace_set_mode(uint64_t result)
{
  if ((BYTE9(xmmword_1EB1CF7F0) & 1) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0) {
    DWORD2(xmmword_1EB1CF7F0) = result & 0xFFFFFF;
  }
  return result;
}

int *_os_trace_get_boot_uuid_slow(void *a1)
{
  size_t v3 = 37;
  uint64_t result = (int *)sysctlbyname("kern.bootsessionuuid", a1, &v3, 0, 0);
  if ((result & 0x80000000) != 0)
  {
    uint64_t result = __error();
    uint64_t v2 = *result;
    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Unable to grab boot uuid";
    qword_1E9450118 = v2;
    __break(1u);
  }
  return result;
}

size_t _os_trace_metadata_init(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  off_1EB1CF7E8 = (_UNKNOWN *)a1;
  if (a2 != 2048)
  {
    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Invalid metadata buffer size";
    qword_1E9450118 = a2;
    __break(1u);
LABEL_7:
    uint64_t v6 = *__error();
    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Unable to get unique pid";
    qword_1E9450118 = v6;
    __break(1u);
  }
  *(_WORD *)(a1 + 66) = 31;
  *(void *)(a1 + 16) = a1 + 56;
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  pid_t v3 = getpid();
  if (proc_pidinfo(v3, 17, 0, &v7, 56) != 56) {
    goto LABEL_7;
  }
  *((void *)&xmmword_1EB1CF830 + 1) = v8;
  *(_OWORD *)(a1 + 24) = v7;
  _dyld_get_shared_cache_uuid();
  strlcpy((char *)(a1 + 568), (const char *)xmmword_1EB1CF830, 0x400uLL);
  size_t result = strlen((const char *)(a1 + 568));
  __int16 v5 = result + 1;
  if ((result + 1)) {
    __int16 v5 = result + 2;
  }
  *(_WORD *)(a1 + 4) = v5;
  *(_WORD *)(a1 + 2) = v5;
  return result;
}

uint64_t _os_trace_getxattr_at(int a1, const char *a2, int a3, const char *a4, void *a5, size_t a6)
{
  int v9 = openat(a1, a2, a3 | 0x1000004);
  if (v9 < 0) {
    return -1;
  }
  int v10 = v9;
  ssize_t v11 = fgetxattr(v9, a4, a5, a6, 0, 0);
  if (v11 == -1)
  {
    int v15 = *__error();
    if (close(v10) == -1)
    {
      int v16 = *__error();
      uint64_t result = *__error();
      if (v16 == 9) {
        goto LABEL_13;
      }
      _os_assumes_log();
    }
    *__error() = v15;
    return -1;
  }
  ssize_t v12 = v11;
  if (close(v10) != -1) {
    return v12;
  }
  int v13 = *__error();
  uint64_t result = *__error();
  if (v13 != 9)
  {
    _os_assumes_log();
    return v12;
  }
  qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E9450118 = result;
  __break(1u);
LABEL_13:
  qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: don't close random fds";
  qword_1E9450118 = result;
  __break(1u);
  return result;
}

void _os_trace_init_slow()
{
  uint64_t v58 = *MEMORY[0x1E4F14BF8];
  if ((BYTE9(xmmword_1EB1CF7F0) & 1) == 0 && (MEMORY[0xFFFFFC104] & 0x100) == 0)
  {
    int v0 = *__error();
    _dyld_get_prog_image_header();
    *(void *)&xmmword_1EB1CF830 = dyld_image_path_containing_address();
    main = (void *)xpc_bundle_create_main();
    info_xpc_object_t dictionary = (void *)xpc_bundle_get_info_dictionary();
    if (info_dictionary)
    {
      pid_t v3 = info_dictionary;
      string = xpc_dictionary_get_string(info_dictionary, "CFBundleIdentifier");
      if (string) {
        qword_1EB1CF880 = (uint64_t)strdup(string);
      }
      xpc_object_t dictionary = xpc_dictionary_get_dictionary(v3, "OSLogPreferences");
      if (dictionary) {
        qword_1EB1CF878 = (uint64_t)xpc_retain(dictionary);
      }
    }
    xpc_release(main);
    if (_os_trace_allow_development_env_vars_once != -1) {
      dispatch_once(&_os_trace_allow_development_env_vars_once, &__block_literal_global_37);
    }
    int v6 = _os_trace_allow_development_env_vars_allowed;
    voucher_activity_get_metadata_buffer();
    long long v7 = getenv("OS_ACTIVITY_MODE");
    long long v8 = getenv("OS_ACTIVITY_STREAM");
    int v9 = getenv("OS_ACTIVITY_PROPAGATE_MODE");
    int v10 = DWORD2(xmmword_1EB1CF7F0);
    if (v8 && !strcasecmp(v8, "live")) {
      v10 |= 8u;
    }
    if (v9) {
      int v11 = v10 | 0x10000;
    }
    else {
      int v11 = v10;
    }
    if (v7)
    {
      if (!strcasecmp(v7, "info"))
      {
        v11 |= 1u;
      }
      else if (!strcasecmp(v7, "debug"))
      {
        v11 |= 3u;
      }
      else if (!strcasecmp(v7, "off"))
      {
        v11 |= 0x400u;
      }
      else if (!strcasecmp(v7, "disable"))
      {
        v11 |= 0x100u;
      }
      else if (!strcasecmp(v7, "stream"))
      {
        v11 |= 0xBu;
        if (isatty(2)) {
          fputs("use OS_ACTIVITY_STREAM for configuring streaming.\n", (FILE *)*MEMORY[0x1E4F14C00]);
        }
      }
    }
    DWORD2(xmmword_1EB1CF7F0) = v11;
    *(uint64_t *)((char *)&qword_1EB1CF860 + 4) = 0x70000000BLL;
    arc4random_buf(&xmmword_1EB1CF840, 8uLL);
    if (byte_1EB1CF86D)
    {
      uint32_t v12 = _dyld_image_count();
      if (v12)
      {
        uint32_t v13 = v12;
        for (uint32_t i = 0; i != v13; ++i)
        {
          image_header = (mach_header *)_dyld_get_image_header(i);
          if (image_header) {
            _os_trace_image_was_loaded(image_header);
          }
        }
      }
    }
    else
    {
      _dyld_register_func_for_add_image((void (__cdecl *)(const mach_header *, intptr_t))_os_trace_image_was_loaded);
      _dyld_register_func_for_remove_image((void (__cdecl *)(const mach_header *, intptr_t))_os_trace_image_was_unloaded);
    }
    voucher_activity_flush();
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
    memset(v24, 0, sizeof(v24));
    LODWORD(v25) = 0;
    *(void *)size_t v55 = 0xE00000001;
    int v56 = 1;
    pid_t v57 = getpid();
    size_t v23 = 648;
    sysctl(v55, 4u, v24, &v23, 0, 0);
    if ((v25 & 0x800) != 0)
    {
      if (!v7) {
        DWORD2(xmmword_1EB1CF7F0) |= 3u;
      }
    }
    else if (issetugid())
    {
      goto LABEL_61;
    }
    int v16 = getenv("ACTIVITY_LOG_STDERR");
    if (!v16) {
      int v16 = getenv("CFLOG_FORCE_STDERR");
    }
    if (v6 && v16) {
      byte_1EB1CF86E = 1;
    }
    uint64_t v17 = getenv("OS_ACTIVITY_DT_MODE");
    if (v6 && v17) {
      byte_1EB1CF86F = 1;
    }
    int v18 = getenv("OS_ACTIVITY_TOOLS_PRIVACY");
    if (v6 && v18) {
      byte_1EB1CF870 = 1;
    }
    xpc_object_t v19 = getenv("OS_ACTIVITY_TOOLS_OVERSIZE");
    if (v6)
    {
      if (v19) {
        byte_1EB1CF871 = 1;
      }
    }
    int v20 = getenv("OS_LOG_FAULT_REPORTS");
    if (!v20) {
      goto LABEL_61;
    }
    xpc_object_t v21 = v20;
    if (!strcasecmp(v20, "always"))
    {
      char v22 = 2;
      goto LABEL_60;
    }
    if (!strcasecmp(v21, "off"))
    {
      char v22 = 3;
LABEL_60:
      byte_1EB1CF874 = v22;
    }
LABEL_61:
    *__error() = v0;
  }
}

Class __os_log_fmt_object_for_data_block_invoke()
{
  os_log_fmt_object_for_data__NSString = (uint64_t)objc_getClass("NSString");
  os_log_fmt_object_for_data__NSNumber = (uint64_t)objc_getClass("NSNumber");
  Class result = objc_getClass("NSData");
  os_log_fmt_object_for_data__NSData = (uint64_t)result;
  return result;
}

void _os_activity_label_useraction_impl(unint64_t a1, uint64_t a2)
{
  uint64_t v63 = *MEMORY[0x1E4F14BF8];
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  uint64_t v61 = 0;
  char v62 = 0;
  unint64_t v60 = 0;
  uint64_t refreshed = dword_1EB1CF804;
  if (dword_1EB1CF804 != -1) {
    uint64_t refreshed = (uint64_t)_os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v6 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v33 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v33, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v33 == v6) {
      _os_log_preferences_refresh_process();
    }
  }
  if ((BYTE9(xmmword_1EB1CF7F0) & 5) == 0 && (MEMORY[0xFFFFFC104] & 0x500) == 0)
  {
    uint64_t v7 = v2;
    if (off_1EB1CF7E8) {
      long long v8 = (atomic_ullong *)((char *)off_1EB1CF7E8 + 8);
    }
    else {
      long long v8 = 0;
    }
    if (_os_trace_dsc_load_addr <= a1 && _os_trace_dsc_size + _os_trace_dsc_load_addr > a1)
    {
      int v9 = v2 - _os_trace_dsc_load_addr;
      LODWORD(v61) = v2 - _os_trace_dsc_load_addr;
      WORD2(v61) = (unint64_t)(v2 - _os_trace_dsc_load_addr) >> 32;
      char v62 = 0;
      if (WORD2(v61))
      {
        long long v40 = 0;
        uint64_t v10 = 6;
        HIWORD(v61) = 6;
        uint64_t v41 = 0x100000000;
        if (!a2) {
          goto LABEL_54;
        }
      }
      else
      {
        HIDWORD(v61) = 0x40000;
        long long v40 = 0;
        uint64_t v10 = 4;
        uint64_t v41 = 1;
        if (!a2) {
          goto LABEL_54;
        }
      }
LABEL_46:
      uint64_t v25 = _os_trace_dsc_load_addr;
      if (_os_trace_dsc_load_addr <= a1)
      {
        if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= a1) {
          uint64_t v25 = a1;
        }
        unint64_t v26 = a2 - v25;
      }
      else
      {
        unint64_t v26 = a2 - a1;
      }
      unint64_t v27 = v26 & 0x7FFFFFFF | ((unint64_t)(unsigned __int16)(v26 >> 31) << 32);
      goto LABEL_55;
    }
    if (*(_DWORD *)(a1 + 12) == 2)
    {
      long long v40 = 0;
      int v9 = v2 - a1;
      LODWORD(v61) = v2 - a1;
      WORD2(v61) = (v2 - a1) >> 32;
      uint64_t v10 = 4;
      HIWORD(v61) = 4;
      char v62 = 0;
      uint64_t v41 = 1;
      goto LABEL_45;
    }
    if (off_1EB1CF7E8)
    {
LABEL_19:
      atomic_ullong v11 = *v8;
      do
      {
        if (v11)
        {
          uint64_t v13 = v7;
          uint64_t refreshed = _os_trace_rwptr_rdlock_wait((uint64_t)v8);
          uint64_t v7 = v13;
          goto LABEL_19;
        }
        atomic_ullong v12 = v11;
        atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v12, v11 + 0x200000000, memory_order_relaxed, memory_order_relaxed);
        BOOL v19 = v12 == v11;
        atomic_ullong v11 = v12;
      }
      while (!v19);
      atomic_ullong v14 = v8[1];
      unint64_t v15 = *(unsigned __int16 *)(v14 + 10);
      unint64_t v16 = (a1 >> *MEMORY[0x1E4F14C78]) % v15;
      while (1)
      {
        unint64_t v17 = v14 + 16 * v16;
        uint64_t v18 = *(void *)(v17 + 16);
        if (v18 == a1) {
          break;
        }
        if (v16 + 1 == v15) {
          unint64_t v16 = 0;
        }
        else {
          ++v16;
        }
        if (v18) {
          BOOL v19 = v16 == (a1 >> *MEMORY[0x1E4F14C78]) % v15;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
          int v20 = 0;
          goto LABEL_36;
        }
      }
      int v20 = *(_OWORD **)(v17 + 24);
LABEL_36:
      unint64_t v21 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      atomic_ullong v22 = *v8;
      atomic_ullong v23 = *v8;
      do
      {
        unint64_t v24 = v22 - 0x200000000;
        if (v22 == 0x300000000) {
          unint64_t v24 = v21;
        }
        atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v23, v24, memory_order_relaxed, memory_order_relaxed);
        BOOL v19 = v23 == v22;
        atomic_ullong v22 = v23;
      }
      while (!v19);
      if (v24 == v21)
      {
        __dmb(9u);
        uint64_t v38 = (uint64_t)v8;
        uint64_t v39 = v7;
        _os_trace_rwptr_cleanup(v38, (void (*)(void))_os_trace_mh_map_cleanup);
        uint64_t v7 = v39;
      }
      char v62 = v20;
      if (v20)
      {
        long long v40 = v20;
        uint64_t v41 = 0;
        int v9 = v7 - a1;
        LODWORD(v61) = v7 - a1;
        WORD2(v61) = (v7 - a1) >> 32;
        uint64_t v10 = 20;
        HIWORD(v61) = 20;
LABEL_45:
        if (a2) {
          goto LABEL_46;
        }
LABEL_54:
        unint64_t v27 = 0;
LABEL_55:
        unint64_t v60 = v27;
        MEMORY[0x1F41887A8](refreshed);
        long long v29 = (char *)&v40 - v28;
        bzero((char *)&v40 - v28, v10 + 2 * ((v27 & 0xFFFF00000000) != 0));
        if (HIDWORD(v41))
        {
          *(_DWORD *)long long v29 = v61;
          *((_WORD *)v29 + 2) = WORD2(v61);
        }
        else
        {
          *(_DWORD *)long long v29 = v9;
          if ((v41 & 1) == 0) {
            *(_OWORD *)(v29 + 4) = *v40;
          }
        }
        if ((v27 & 0xFFFF00000000) != 0) {
          *(_WORD *)&v29[v10] = WORD2(v27);
        }
        if ((BYTE8(xmmword_1EB1CF7F0) & 8) != 0 || (MEMORY[0xFFFFFC104] & 8) != 0) {
          LODWORD(v30) = 1;
        }
        else {
          unint64_t v30 = ((unint64_t)voucher_get_activity_id() >> 59) & 1;
        }
        int v31 = v30 & *(_DWORD *)&byte_1EB1CF868;
        unint64_t v58 = 0;
        uint64_t v59 = 0;
        uint64_t v57 = 0;
        if ((v30 & *(_DWORD *)&byte_1EB1CF868) == 1)
        {
          if (mach_get_times()) {
            _os_assumes_log();
          }
        }
        else
        {
          uint64_t v59 = mach_continuous_time();
        }
        _os_get_logging_unreliable_for_current_thread();
        size_t v55 = v29;
        uint64_t v56 = v10 + 2 * ((v27 & 0xFFFF00000000) != 0);
        uint64_t v32 = voucher_activity_trace_v_2();
        if (v31)
        {
          uint64_t v34 = v32;
          long long v35 = _os_trace_diagnosticd_pipe(0);
          if (v35)
          {
            long long v36 = v35;
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
            memset(v42, 0, sizeof(v42));
            if (v34 <= 6u && ((1 << v34) & 0x58) != 0) {
              unsigned int v37 = v34 << 8;
            }
            else {
              unsigned int v37 = bswap32(v34) >> 16;
            }
            v42[0] = v37;
            *((void *)&v43 + 1) = v34;
            *(void *)&long long v44 = v59;
            *(void *)&long long v46 = v57;
            *((void *)&v46 + 1) = (v58 / 0x3E8);
            *(void *)&long long v49 = a2;
            BYTE8(v49) = 1;
            _os_activity_stream_reflect((uint64_t)v35, (uint64_t)v42, a1, -3, (unsigned int *)&v61, (uint64_t)&v60);
            xpc_release(v36);
          }
        }
        return;
      }
    }
    else
    {
      char v62 = 0;
    }
    long long v40 = 0;
    LODWORD(v61) = v7;
    WORD2(v61) = WORD2(v7);
    uint64_t v10 = 6;
    HIWORD(v61) = 6;
    uint64_t v41 = 0x100000000;
    int v9 = v7;
    if (a2) {
      goto LABEL_46;
    }
    goto LABEL_54;
  }
}

void *_os_trace_load_formatter(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F14BF8];
  snprintf(__str, 0x400uLL, "%sliblog_%s.dylib", (&plugin_dirs)[2 * *(void *)(a1 + 16)], *(const char **)(a1 + 8));
  Class result = dlopen(__str, 6);
  *(void *)(a1 + 16) = result;
  if (result)
  {
    *(void *)(a1 + 24) = dlsym(result, "OSLogCopyFormattedString");
    Class result = dlsym(*(void **)(a1 + 16), "OSStateCreateStringWithData");
    *(void *)(a1 + 32) = result;
  }
  return result;
}

uint64_t _os_log_fmt_flatten_coder(uint64_t a1, void *a2, size_t a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v27[1] = *MEMORY[0x1E4F14BF8];
  atomic_ullong v14 = (objc_class *)objc_opt_class();
  size_t InstanceSize = class_getInstanceSize(v14);
  unint64_t v16 = (char *)v27 - ((MEMORY[0x1F41887A8](InstanceSize) + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v16, v17);
  uint64_t v18 = objc_constructInstance(v14, v16);
  v18[1] = a1;
  v18[3] = a6;
  v18[4] = a7;
  *((unsigned char *)v18 + 40) = a4;
  *((unsigned char *)v18 + 214) = a5 != 0;
  v18[25] = a3;
  if (a5) {
    BOOL v19 = 1;
  }
  else {
    BOOL v19 = a4 > 1;
  }
  if (*(unsigned char *)a1) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = *(unsigned char *)a1 & 2;
  }
  if (v19) {
    uint64_t v21 = v20 | 0x100;
  }
  else {
    uint64_t v21 = v20;
  }
  atomic_ullong v22 = (void *)MEMORY[0x19F3B0E70]();
  [a2 encodeWithOSLogCoder:v18 options:v21 maxLength:a3];
  if ([v18 retainCount] != 1)
  {
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: A reference to the coder escaped";
    __break(1u);
  }
  atomic_ullong v23 = (unsigned char **)v18[2];
  if (v23 == v18 + 6)
  {
    *((_WORD *)v18 + 105) = *(_DWORD *)(a6 + 8);
    *((_WORD *)v18 + 104) = _os_log_fmt_flatten_masked_data((unsigned char *)a1, a4, a5, a6, *v23, *((unsigned int *)v18 + 14), a3, (unsigned char *)v18 + 212);
    if (*((_WORD *)v18 + 34))
    {
      unint64_t v24 = *v23;
      *atomic_ullong v23 = (unsigned char *)3954044928;
      *((_WORD *)v23 + 10) = 0;
      free(v24);
    }
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a1 & 0xF | 0x30;
  }
  __int16 v25 = v18[26] & 0x7FFF | (*((unsigned __int8 *)v18 + 212) << 15);
  *(_WORD *)(a1 + 2) = *((_WORD *)v18 + 105);
  *(_WORD *)(a1 + 4) = v25;
  return *((unsigned __int16 *)v18 + 104);
}

void *_os_trace_diagnosticd_pipe(void *a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&qword_1EB1CF860);
  uint64_t v2 = (void *)qword_1EB1CF858;
  if ((void *)qword_1EB1CF858 != a1 || qword_1EB1CF858 == 0)
  {
    if (qword_1EB1CF858)
    {
LABEL_8:
      xpc_retain(v2);
      goto LABEL_9;
    }
  }
  else
  {
    xpc_release(a1);
    qword_1EB1CF858 = 0;
  }
  uint64_t v2 = (void *)xpc_pipe_create();
  qword_1EB1CF858 = (uint64_t)v2;
  if (v2) {
    goto LABEL_8;
  }
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)&qword_1EB1CF860);
  return v2;
}

uint64_t amfi_check_dyld_policy_for_pid(int a1, uint64_t a2, void *a3)
{
  if (!a3) {
    return 22;
  }
  *a3 = 0;
  int v7 = -1431655766;
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  v5[1] = a2;
  v5[2] = v5;
  int v6 = a1;
  uint64_t result = __sandbox_ms();
  if (result) {
    uint64_t result = *__error();
  }
  *a3 = v5[0];
  return result;
}

uint64_t amfi_load_trust_cache()
{
  return __sandbox_ms();
}

void *_os_log_get_nscf_formatter()
{
  return _NSCF_function;
}

uint64_t _os_trace_macho_for_each_slice(_DWORD *a1, unint64_t a2, uint64_t a3)
{
  if (a2 < 4) {
    return 88;
  }
  int v7 = *a1;
  uint64_t result = 88;
  if (v7 > -805638659)
  {
    if (v7 != -17958193)
    {
      if (v7 == -17958194)
      {
LABEL_14:
        if (a2 < 0x1C) {
          return result;
        }
        goto LABEL_15;
      }
      if (v7 != -805638658) {
        return result;
      }
    }
    if (a2 < 0x20) {
      return result;
    }
LABEL_15:
    long long v8 = *(uint64_t (**)(uint64_t, _DWORD *, unint64_t))(a3 + 16);
    return v8(a3, a1, a2);
  }
  switch(v7)
  {
    case -1095041334:
      if (a2 < 8) {
        return result;
      }
      unsigned int v9 = bswap32(a1[1]);
      int v10 = 1;
      break;
    case -889275714:
      if (a2 < 8) {
        return result;
      }
      int v10 = 0;
      unsigned int v9 = a1[1];
      break;
    case -822415874:
      goto LABEL_14;
    default:
      return result;
  }
  if (20 * v9 == 20 * v9 && a2 - 8 >= 20 * v9)
  {
    unint64_t v12 = v9;
    if (!v9) {
      return 0;
    }
    uint64_t v13 = a1 + 5;
    for (unint64_t i = 1; ; ++i)
    {
      unsigned int v15 = *(v13 - 1);
      if (v10)
      {
        unsigned int v15 = bswap32(v15);
        unsigned int v16 = bswap32(*v13);
      }
      else
      {
        unsigned int v16 = *v13;
      }
      if (a2 < v15 || a2 - v15 < v16) {
        break;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, void))(a3 + 16))(a3, (char *)a1 + v15, v16);
      if (result) {
        BOOL v17 = 1;
      }
      else {
        BOOL v17 = i >= v12;
      }
      v13 += 5;
      if (v17) {
        return result;
      }
    }
    return 88;
  }
  return result;
}

void _os_trace_mh_map_cleanup(void *a1)
{
  if (*((unsigned char *)a1 + 12)) {
    free(a1);
  }
}

uint64_t _os_trace_rwptr_rdlock_wait(uint64_t result)
{
  char v1 = (atomic_ullong *)result;
  uint64_t v2 = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
LABEL_2:
  atomic_ullong v3 = *v1;
  while (1)
  {
    atomic_ullong v4 = v3;
    if (!v3) {
      return result;
    }
    if ((v3 & 0xFFFFFFFE) != v3)
    {
      atomic_compare_exchange_strong_explicit(v1, (unint64_t *)&v3, v3 & 0xFFFFFFFE, memory_order_relaxed, memory_order_relaxed);
      if (v3 != v4) {
        continue;
      }
    }
    unsigned int v5 = v4 ^ v2;
    if ((v5 & 0xFFFFFFFE) == 0)
    {
      qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: trying to lock recursively";
      __break(1u);
LABEL_18:
      qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: ulock_wait() failed";
      qword_1E9450118 = (int)v5;
      __break(1u);
      return result;
    }
    while (1)
    {
      uint64_t result = __ulock_wait();
      if ((result & 0x80000000) == 0) {
        goto LABEL_2;
      }
      uint64_t result = (uint64_t)__error();
      unsigned int v5 = *(_DWORD *)result;
      if (*(_DWORD *)result != 4)
      {
        if (v5 > 0x3C || ((1 << v5) & 0x1000000000004001) == 0) {
          goto LABEL_18;
        }
        goto LABEL_2;
      }
    }
  }
}

void _os_trace_rwptr_cleanup(uint64_t a1, void (*a2)(void))
{
  atomic_ullong v3 = *(void ***)(a1 + 8);
  atomic_ullong v4 = *v3;
  if (*v3)
  {
    do
    {
      int v6 = (void *)*v4;
      a2();
      atomic_ullong v4 = v6;
    }
    while (v6);
  }
  *atomic_ullong v3 = 0;
  int v7 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  unsigned int v8 = atomic_exchange_explicit((atomic_uint *volatile)a1, 0, memory_order_release);
  if (v8 != v7)
  {
    _os_trace_rwptr_wrunlock_slow(a1, v7, v8);
  }
}

void _os_trace_rwptr_wrunlock_slow(uint64_t a1, int a2, unsigned int a3)
{
  if ((a3 ^ a2) > 1)
  {
    int v3 = a3;
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: lock not owned by current thread";
    qword_1E9450118 = a3;
    __break(1u);
LABEL_11:
    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: ulock_wake() failed";
    qword_1E9450118 = v3;
    __break(1u);
  }
  else
  {
    while ((__ulock_wake() & 0x80000000) != 0)
    {
      int v3 = *__error();
      if (v3 != 4)
      {
        if (v3) {
          BOOL v4 = v3 == 2;
        }
        else {
          BOOL v4 = 1;
        }
        if (v4) {
          return;
        }
        goto LABEL_11;
      }
    }
  }
}

void _os_activity_stream_reflect(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned int *a5, uint64_t a6)
{
  void v27[2] = *MEMORY[0x1E4F14BF8];
  atomic_ullong v11 = (char *)off_1EB1CF7E8;
  v27[0] = 0;
  v27[1] = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2000000000;
  int v26 = 0;
  *(_DWORD *)(a2 + 4) = getpid();
  *(void *)(a2 + 8) = *((void *)&xmmword_1EB1CF830 + 1);
  *(_DWORD *)(a2 + 16) = geteuid();
  if (v11) {
    unint64_t v12 = v11 + 24;
  }
  else {
    unint64_t v12 = 0;
  }
  *(void *)(a2 + 24) = v12;
  *(void *)(a2 + 32) = xmmword_1EB1CF830;
  *(void *)(a2 + 40) = voucher_get_activity_id();
  unint64_t v13 = *a5 | ((unint64_t)*((unsigned __int16 *)a5 + 2) << 32);
  if (*(_DWORD *)(a3 + 12) == 2)
  {
    *(void *)(a2 + 120) = v13;
  }
  else if (*((void *)a5 + 1))
  {
    *(void *)(a2 + 120) = v13;
    unint64_t v12 = (void *)*((void *)a5 + 1);
  }
  else
  {
    if (!_dyld_get_image_uuid()) {
      goto LABEL_22;
    }
    uint64_t v14 = _os_trace_dsc_load_addr;
    if (_os_trace_dsc_load_addr <= a3)
    {
      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= a3) {
        uint64_t v14 = 0;
      }
      v13 += v14;
    }
    *(void *)(a2 + 120) = v13 - a3;
    unint64_t v12 = v27;
  }
  *(void *)(a2 + 80) = v12;
  int v15 = *(_DWORD *)a6;
  if (*(int *)a6 >= 0) {
    unint64_t v16 = v15 & 0x7FFFFFFF | ((unint64_t)*(unsigned __int16 *)(a6 + 4) << 31);
  }
  else {
    unint64_t v16 = v15 & 0x7FFFFFFF | ((unint64_t)*(unsigned __int16 *)(a6 + 4) << 31) | 0x8000000000000000;
  }
  *(void *)(a2 + 128) = v16;
  uint64_t v17 = dyld_image_path_containing_address();
  uint64_t v18 = *(void *)(a2 + 96);
  *(void *)(a2 + 88) = v17;
  *(void *)(a2 + 72) = *(void *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  if (!v18) {
    gettimeofday((timeval *)(a2 + 96), 0);
  }
  if (!*(_DWORD *)(a2 + 112))
  {
    time_t v24 = *(void *)(a2 + 96);
    memset(&v23, 0, sizeof(v23));
    localtime_r(&v24, &v23);
    int tm_isdst = v23.tm_isdst;
    unint64_t v20 = ((unsigned __int128)(v23.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v23.tm_gmtoff;
    *(_DWORD *)(a2 + 112) = (v20 >> 5) + (v20 >> 63) + 60 * v23.tm_isdst;
    *(_DWORD *)(a2 + 116) = tm_isdst;
  }
  xpc_object_t v21 = _os_activity_stream_entry_encode((unsigned int *)a2);
  xpc_dictionary_set_uint64(v21, "action", 6uLL);
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = ___os_activity_stream_reflect_block_invoke;
  block[3] = &unk_1E59842A8;
  block[5] = a1;
  block[6] = v21;
  block[4] = v25;
  dispatch_block_perform(DISPATCH_BLOCK_DETACHED, block);
  xpc_release(v21);
LABEL_22:
  _Block_object_dispose(v25, 8);
}

xpc_object_t _os_activity_stream_entry_encode(unsigned int *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "pid", (int)a1[1]);
  xpc_dictionary_set_uint64(v2, "procid", *((void *)a1 + 1));
  xpc_dictionary_set_uint64(v2, "uid", a1[4]);
  int v3 = (const unsigned __int8 *)*((void *)a1 + 3);
  if (v3) {
    xpc_dictionary_set_uuid(v2, "procuuid", v3);
  }
  BOOL v4 = (const char *)*((void *)a1 + 4);
  if (v4) {
    xpc_dictionary_set_string(v2, "procpath", v4);
  }
  uint64_t v5 = *((void *)a1 + 5);
  if (v5) {
    xpc_dictionary_set_uint64(v2, "aid", v5);
  }
  uint64_t v6 = *((void *)a1 + 6);
  if (v6) {
    xpc_dictionary_set_uint64(v2, "paid", v6);
  }
  xpc_dictionary_set_uint64(v2, "type", *a1);
  if (a1[34]) {
    xpc_dictionary_set_BOOL(v2, "32bits", 1);
  }
  int64_t v7 = *((void *)a1 + 12);
  if (v7)
  {
    xpc_dictionary_set_int64(v2, "timeGMTsec", v7);
    xpc_dictionary_set_int64(v2, "timeGMTusec", (int)a1[26]);
  }
  int64_t v8 = (int)a1[29];
  if (v8) {
    xpc_dictionary_set_int64(v2, "timezoneDSTflag", v8);
  }
  int64_t v9 = (int)a1[28];
  if (v9) {
    xpc_dictionary_set_int64(v2, "timezoneMinutesWest", v9);
  }
  int v10 = *a1;
  if ((int)*a1 > 767)
  {
    if (v10 == 1536)
    {
      xpc_dictionary_set_uint64(v2, "signpostid", *((void *)a1 + 26));
      unint64_t v20 = (const char *)*((void *)a1 + 27);
      if (v20) {
        xpc_dictionary_set_string(v2, "signpostname", v20);
      }
    }
    else if (v10 != 1024)
    {
      if (v10 == 768)
      {
        xpc_dictionary_set_uint64(v2, "traceid", *((void *)a1 + 7));
        xpc_dictionary_set_uint64(v2, "thread", *((void *)a1 + 9));
        xpc_dictionary_set_uint64(v2, "timestamp", *((void *)a1 + 8));
        xpc_dictionary_set_uint64(v2, "offset", *((void *)a1 + 15));
        xpc_dictionary_set_uint64(v2, "formatoffset", *((void *)a1 + 16));
        xpc_dictionary_set_value(v2, "payload", *((xpc_object_t *)a1 + 21));
        atomic_ullong v11 = (const unsigned __int8 *)*((void *)a1 + 10);
        if (v11) {
          xpc_dictionary_set_uuid(v2, "imageuuid", v11);
        }
        unint64_t v12 = (const char *)*((void *)a1 + 11);
        if (v12) {
          xpc_dictionary_set_string(v2, "imagepath", v12);
        }
        unint64_t v13 = (const char *)*((void *)a1 + 18);
        if (v13) {
          xpc_dictionary_set_string(v2, "name", v13);
        }
        uint64_t v14 = (const void *)*((void *)a1 + 19);
        if (v14)
        {
          size_t v15 = *((void *)a1 + 20);
          if (v15) {
            xpc_dictionary_set_data(v2, "buffer", v14, v15);
          }
        }
      }
      return v2;
    }
    xpc_dictionary_set_uint64(v2, "traceid", *((void *)a1 + 7));
    xpc_dictionary_set_uint64(v2, "thread", *((void *)a1 + 9));
    xpc_dictionary_set_uint64(v2, "timestamp", *((void *)a1 + 8));
    xpc_dictionary_set_uint64(v2, "offset", *((void *)a1 + 15));
    xpc_dictionary_set_uint64(v2, "formatoffset", *((void *)a1 + 16));
    xpc_dictionary_set_uint64(v2, "timeToLive", *((unsigned __int8 *)a1 + 204));
    xpc_object_t v21 = (const unsigned __int8 *)*((void *)a1 + 10);
    if (v21) {
      xpc_dictionary_set_uuid(v2, "imageuuid", v21);
    }
    atomic_ullong v22 = (const char *)*((void *)a1 + 11);
    if (v22) {
      xpc_dictionary_set_string(v2, "imagepath", v22);
    }
    tm v23 = (const char *)*((void *)a1 + 18);
    if (v23)
    {
      xpc_dictionary_set_string(v2, "name", v23);
      time_t v24 = (const char *)*((void *)a1 + 18);
      if (v24) {
        xpc_dictionary_set_string(v2, "formatstring", v24);
      }
    }
    __int16 v25 = (const void *)*((void *)a1 + 19);
    if (v25)
    {
      size_t v26 = *((void *)a1 + 20);
      if (v26) {
        xpc_dictionary_set_data(v2, "buffer", v25, v26);
      }
    }
    unint64_t v27 = (const void *)*((void *)a1 + 21);
    if (v27)
    {
      size_t v28 = *((void *)a1 + 22);
      if (v28) {
        xpc_dictionary_set_data(v2, "privdata", v27, v28);
      }
    }
    long long v29 = (const char *)*((void *)a1 + 24);
    if (v29) {
      xpc_dictionary_set_string(v2, "category", v29);
    }
    unint64_t v30 = (const char *)*((void *)a1 + 23);
    if (v30) {
      xpc_dictionary_set_string(v2, "subsystem", v30);
    }
    char v19 = *((unsigned char *)a1 + 205);
LABEL_59:
    xpc_dictionary_set_BOOL(v2, "persisted", v19);
    return v2;
  }
  if (v10 != 513)
  {
    if (v10 != 515) {
      return v2;
    }
    xpc_dictionary_set_uint64(v2, "traceid", *((void *)a1 + 7));
    xpc_dictionary_set_uint64(v2, "thread", *((void *)a1 + 9));
    xpc_dictionary_set_uint64(v2, "timestamp", *((void *)a1 + 8));
    xpc_dictionary_set_uint64(v2, "offset", *((void *)a1 + 15));
    xpc_dictionary_set_uint64(v2, "formatoffset", *((void *)a1 + 16));
    unint64_t v16 = (const unsigned __int8 *)*((void *)a1 + 10);
    if (v16) {
      xpc_dictionary_set_uuid(v2, "imageuuid", v16);
    }
    uint64_t v17 = (const char *)*((void *)a1 + 11);
    if (v17) {
      xpc_dictionary_set_string(v2, "imagepath", v17);
    }
    uint64_t v18 = (const char *)*((void *)a1 + 18);
    if (v18) {
      xpc_dictionary_set_string(v2, "name", v18);
    }
    char v19 = *((unsigned char *)a1 + 152);
    goto LABEL_59;
  }
  xpc_dictionary_set_uint64(v2, "traceid", *((void *)a1 + 7));
  xpc_dictionary_set_uint64(v2, "thread", *((void *)a1 + 9));
  xpc_dictionary_set_uint64(v2, "timestamp", *((void *)a1 + 8));
  int v31 = (const char *)*((void *)a1 + 18);
  if (v31) {
    xpc_dictionary_set_string(v2, "name", v31);
  }
  uint64_t v32 = (const unsigned __int8 *)*((void *)a1 + 10);
  if (v32) {
    xpc_dictionary_set_uuid(v2, "imageuuid", v32);
  }
  int v33 = (const char *)*((void *)a1 + 11);
  if (v33) {
    xpc_dictionary_set_string(v2, "imagepath", v33);
  }
  xpc_dictionary_set_uint64(v2, "offset", *((void *)a1 + 15));
  xpc_dictionary_set_uint64(v2, "formatoffset", *((void *)a1 + 16));
  return v2;
}

void ___os_activity_stream_reflect_block_invoke(uint64_t a1)
{
  xpc_object_t v2 = *(void **)(a1 + 40);
  while (1)
  {
    int v3 = xpc_pipe_simpleroutine();
    if (v3 != 32) {
      break;
    }
    if (v2 != *(void **)(a1 + 40)) {
      xpc_release(v2);
    }
    xpc_object_t v2 = _os_trace_diagnosticd_pipe(v2);
    if (!v2)
    {
      int v4 = 32;
      goto LABEL_10;
    }
  }
  int v4 = v3;
  if (v2 && v2 != *(void **)(a1 + 40)) {
    xpc_release(v2);
  }
LABEL_10:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

void _os_trace_image_was_unloaded(unint64_t a1)
{
  if (off_1EB1CF7E8
    && (_os_trace_dsc_load_addr > a1 || _os_trace_dsc_size + _os_trace_dsc_load_addr <= a1)
    && _dyld_get_image_uuid())
  {
    mach_continuous_time();
    voucher_activity_trace();
    int v2 = 0;
    int v3 = off_1EB1CF7E8;
    atomic_compare_exchange_strong_explicit((atomic_uint *volatile)off_1EB1CF7E8 + 2, (unsigned int *)&v2, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
    if (v2) {
      os_unfair_lock_lock_with_options();
    }
    uint64_t v4 = v3[2];
    unint64_t v5 = *(unsigned __int16 *)(v4 + 10);
    unint64_t v6 = (a1 >> *MEMORY[0x1E4F14C78]) % v5;
    while (1)
    {
      uint64_t v7 = v4 + 16 * v6;
      uint64_t v8 = *(void *)(v7 + 16);
      if (v8 == a1) {
        break;
      }
      if (v6 + 1 == v5) {
        unint64_t v6 = 0;
      }
      else {
        ++v6;
      }
      if (v8) {
        BOOL v9 = v6 == (a1 >> *MEMORY[0x1E4F14C78]) % v5;
      }
      else {
        BOOL v9 = 1;
      }
      if (v9) {
        goto LABEL_32;
      }
    }
    int v10 = (unint64_t *)(v7 + 16);
    *(void *)(v4 + 16 + 16 * v6 + 8) = 0;
    --*(_WORD *)(v4 + 8);
    unint64_t v11 = *(unsigned __int16 *)(v4 + 10);
    if (v6 + 1 < v11) {
      unint64_t v12 = v6 + 1;
    }
    else {
      unint64_t v12 = 0;
    }
    uint64_t v13 = *(void *)(v4 + 16 + 16 * v12);
    if (v13) {
      unint64_t v14 = -1;
    }
    else {
      unint64_t v14 = 0;
    }
    atomic_store(v14, v10);
    if (!v13)
    {
      if (!v6) {
        unint64_t v6 = v11;
      }
      unint64_t v15 = v6 - 1;
      uint64_t v16 = v4 + 16 * v15;
      if (*(void *)(v16 + 16) == -1)
      {
        uint64_t v17 = (void *)(v16 + 16);
        do
        {
          *uint64_t v17 = 0;
          if (!v15) {
            unint64_t v15 = v11;
          }
          --v15;
          uint64_t v17 = (void *)(v4 + 16 * v15 + 16);
        }
        while (*v17 == -1);
      }
    }
LABEL_32:
    _os_trace_rwptr_wrunlock((uint64_t)(v3 + 1), (void *)v4);
  }
}

void _os_trace_send_sections_to_logd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_object_t v7 = xpc_array_create(0, 0);
  for (uint64_t i = 0; i != 40; i += 8)
    xpc_array_set_data(v7, 0xFFFFFFFFFFFFFFFFLL, (const void *)(a2 + *(unsigned int *)(a3 + i + 16)), *(unsigned int *)(a3 + i + 20));
  xpc_dictionary_set_uint64(v6, "operation", 4uLL);
  xpc_dictionary_set_uuid(v6, "uuid", (const unsigned __int8 *)a1);
  xpc_dictionary_set_string(v6, "path", (const char *)(a1 + 32));
  xpc_dictionary_set_value(v6, "sections", v7);
  xpc_release(v7);
  _os_trace_logd_send();

  xpc_release(v6);
}

void _os_trace_mig_server(uint64_t a1, mach_msg_header_t *a2)
{
  v11[1] = *MEMORY[0x1E4F14BF8];
  int v3 = (int *)((char *)v11 - ((MEMORY[0x1F41887A8]() + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v3, v4);
  int v5 = a2->msgh_bits & 0x1F;
  mach_port_t msgh_remote_port = a2->msgh_remote_port;
  *int v3 = v5;
  v3[1] = 36;
  mach_msg_id_t msgh_id = a2->msgh_id;
  v3[4] = 0;
  v3[5] = msgh_id + 100;
  v3[2] = msgh_remote_port;
  v3[3] = 0;
  if ((msgh_id - 50003) < 0xFFFFFFFD
    || (uint64_t v8 = ostracemig_do_libtraceMIG_subsystem[5 * (msgh_id - 50000) + 5]) == 0)
  {
    *((void *)v3 + 3) = *MEMORY[0x1E4F14C30];
    v3[8] = -303;
LABEL_7:
    a2->mach_port_t msgh_remote_port = 0;
    mach_msg_destroy(a2);
    return;
  }
  ((void (*)(mach_msg_header_t *, int *))v8)(a2, v3);
  if (*v3 < 0)
  {
    int v9 = 0;
  }
  else
  {
    int v9 = v3[8];
    if (v9) {
      goto LABEL_11;
    }
  }
  if (v5 == 18)
  {
    uint64_t v10 = v3[5];
    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: _os_trace_mig_server doesn't handle replies";
    qword_1E9450118 = v10;
    __break(1u);
    return;
  }
LABEL_11:
  if (v9 != -305 && v9) {
    goto LABEL_7;
  }
}

void _libtrace_fork_child()
{
  if (qword_1EB1CF858)
  {
    xpc_pipe_invalidate();
    xpc_release((xpc_object_t)qword_1EB1CF858);
  }
  memset(&v0, 0, 17);
  dword_1EB1CF800 = 0;
  xmmword_1EB1CF7F0 = 0u;
  *(_OWORD *)&_os_trace = 0u;
  dword_1EB1CF804 = -2;
  dword_1EB1CF808 = 0;
  dword_1EB1CF80C = -1;
  dword_1EB1CF818 = 0;
  qword_1EB1CF810 = 0;
  dword_1EB1CF81C = -1;
  byte_1EB1CF86C = 0;
  *(_DWORD *)&byte_1EB1CF868 = 0;
  qword_1EB1CF860 = 0;
  *(_OWORD *)&qword_1EB1CF850 = v0;
  xmmword_1EB1CF840 = 0u;
  xmmword_1EB1CF820 = 0u;
  xmmword_1EB1CF830 = 0u;
  byte_1EB1CF86D = 1;
  word_1EB1CF88E = 0;
  *(_OWORD *)((char *)&qword_1EB1CF878 + 6) = 0u;
  *(_OWORD *)&byte_1EB1CF86E = 0u;
  dword_1EB1CF800 = _os_trace_create_debug_control_port();
  if (_event_pipe)
  {
    xpc_pipe_invalidate();
    xpc_release((xpc_object_t)_event_pipe);
    _event_pipe = 0;
  }
  _event_lock = 0;
}

char *_os_trace_atm_diagnostic_config(_DWORD *a1)
{
  uint64_t v8 = *MEMORY[0x1E4F14BF8];
  size_t v6 = 1024;
  if (sysctlbyname("kern.bootargs", __big, &v6, 0, 0)) {
    return 0;
  }
  uint64_t result = strcasestr(__big, "atm_diagnostic_config=");
  if (result)
  {
    __endptr = 0;
    int v3 = strtoul(result + 22, &__endptr, 16);
    if (__endptr)
    {
      unsigned int v4 = *__endptr;
      if (*__endptr)
      {
        if ((v4 & 0x80000000) != 0)
        {
          uint64_t result = (char *)__maskrune(v4, 0x4000uLL);
          if (!result) {
            return result;
          }
        }
        else
        {
          uint64_t result = (char *)(*(_DWORD *)(MEMORY[0x1E4F14BF0] + 4 * v4 + 60) & 0x4000);
          if (!result) {
            return result;
          }
        }
      }
    }
    *a1 = v3;
    return (char *)1;
  }
  return result;
}

uint64_t _os_trace_prefs_latest_version_4tests()
{
  if ((byte_1EB1CF86C & 1) == 0)
  {
    if (_dispatch_is_multithreaded())
    {
      __swp(&byte_1EB1CF86C, (unsigned int *)&byte_1EB1CF86C);
      if ((&byte_1EB1CF86C & 1) == 0) {
        _os_log_watch_for_prefchanges();
      }
    }
  }
  return dword_1EB1CF808;
}

BOOL _os_trace_mode_match_4tests(int a1)
{
  if ((byte_1EB1CF86C & 1) == 0)
  {
    if (_dispatch_is_multithreaded())
    {
      __swp(&byte_1EB1CF86C, (unsigned int *)&byte_1EB1CF86C);
      if ((&byte_1EB1CF86C & 1) == 0) {
        _os_log_watch_for_prefchanges();
      }
    }
  }
  return (DWORD2(xmmword_1EB1CF7F0) & a1) != 0
      || (MEMORY[0xFFFFFC104] & a1) != 0
      || (_BYTE)a1 && (((unint64_t)voucher_get_activity_id() >> 56) & a1) != 0;
}

uint64_t _os_trace_set_diagnostic_flags(uint32_t a1)
{
  host_t v2 = MEMORY[0x19F3B0CF0]();
  uint64_t v3 = host_set_atm_diagnostic_flag(v2, a1);
  mach_port_deallocate(*MEMORY[0x1E4F14C48], v2);
  return v3;
}

uint64_t _os_trace_commpage_compute(int a1, int a2, int a3, int a4, char a5)
{
  unsigned int v5 = a1 & 0x8000000 | 0x80000000;
  if (a1 >= 0) {
    unsigned int v5 = a1 & 0x8000000;
  }
  if (a2 && (v5 |= 0x60000000u, (a5 & 1) == 0))
  {
    unsigned int v11 = a1 & 0x8000000 | 0x71000000;
    if (!a4) {
      unsigned int v11 = v5;
    }
    if (a1 >= 0) {
      return v11;
    }
    else {
      return v5;
    }
  }
  else
  {
    int v6 = a3 ^ 1 | a1 | v5;
    unsigned int v7 = v6 & 0xEEFFFFFF;
    unsigned int v8 = v6 | 0x11000001;
    if (!a4) {
      unsigned int v8 = v7;
    }
    unsigned int v9 = v5 | 1;
    if (a1 < 0) {
      return v9;
    }
    else {
      return v8;
    }
  }
}

uint64_t _os_trace_update_with_datavolume_4launchd()
{
  os_variant_check();

  return _os_trace_commpage_setup();
}

uint64_t _os_trace_commpage_setup()
{
  int v0 = MEMORY[0xFFFFFC104];
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  unsigned int v2 = v0 & 0xEEFFFFFE | 1;
  if (has_internal_diagnostics) {
    unsigned int v2 = v0 | 0x11000001;
  }
  if (v0 < 0) {
    uint64_t result = v0 & 0x8000000 | 0x80000001;
  }
  else {
    uint64_t result = v2;
  }
  if (result != v0)
  {
    return _os_trace_set_diagnostic_flags(result);
  }
  return result;
}

void __LIBTRACE_CLIENT_QUARANTINED_DUE_TO_HIGH_LOGGING_VOLUME__()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)int v0 = 0;
    _os_log_fault_impl(&dword_19DC79000, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "QUARANTINED DUE TO HIGH LOGGING VOLUME", v0, 2u);
  }
  byte_1EB1CF872 = 1;
}

uint64_t _os_trace_get_reconnect_info(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F41887A8](a1);
  long long v53 = v2;
  address = (mach_vm_address_t *)v1;
  uint64_t v63 = *MEMORY[0x1E4F14BF8];
  unint64_t v58 = 0;
  uint64_t __src = 0;
  uint64_t v57 = 0x1000000100000;
  size_t v55 = &v62;
  uint64_t v56 = 0x100000000000;
  uint32_t v3 = _dyld_image_count();
  if (v3)
  {
    uint32_t v4 = v3;
    uint32_t v5 = 0;
    while (1)
    {
      image_header = _dyld_get_image_header(v5);
      if (image_header)
      {
        unsigned int v7 = (mach_header *)image_header;
        if ((_os_trace_dsc_load_addr > (unint64_t)image_header
           || _os_trace_dsc_size + _os_trace_dsc_load_addr <= (unint64_t)image_header)
          && image_header->filetype != 2)
        {
          image_mach_port_name_t name = _dyld_get_image_name(v5);
          if (image_name)
          {
            unsigned int v9 = (char *)image_name;
            size_t v10 = strlen(image_name);
            *(_OWORD *)uuid_t uu = 0u;
            long long v61 = (unint64_t)v7;
            *((void *)&v61 + 1) = _os_trace_get_image_info(v7, 0, uu, 0, 1);
            if (*((void *)&v61 + 1)) {
              break;
            }
          }
        }
      }
LABEL_26:
      if (v4 == ++v5) {
        goto LABEL_33;
      }
    }
    LOBYTE(v11) = v10 + 33;
    LODWORD(v58) = 3;
    HIDWORD(v58) = v10 + 33;
    char v12 = BYTE4(v57);
    if ((v57 & 0x200000000) == 0)
    {
      char v13 = BYTE6(v57);
      int v14 = v56;
      if ((SBYTE6(v57) + HIDWORD(v56) - v56 - 1) <= 7)
      {
        os_trace_blob_add_slow((uint64_t)&v55, &v58, 8uLL);
        char v12 = BYTE4(v57);
        if ((v57 & 0x200000000) == 0)
        {
LABEL_14:
          char v18 = BYTE6(v57);
          int v19 = v56;
          if ((SBYTE6(v57) + HIDWORD(v56) - v56 - 1) <= 0x1F)
          {
            os_trace_blob_add_slow((uint64_t)&v55, uu, 0x20uLL);
            char v12 = BYTE4(v57);
          }
          else
          {
            unint64_t v20 = v55;
            xpc_object_t v21 = (char *)v55 + v56;
            long long v22 = v61;
            *xpc_object_t v21 = *(_OWORD *)uu;
            v21[1] = v22;
            int v23 = v19 + 32;
            LODWORD(v56) = v23;
            if (!v18) {
              v20[v23] = 0;
            }
          }
        }
LABEL_17:
        if ((v12 & 2) == 0)
        {
          size_t v24 = v10 + 1;
          int v25 = v56;
          if (v24 > (SBYTE6(v57) + HIDWORD(v56) - v56 - 1))
          {
            os_trace_blob_add_slow((uint64_t)&v55, v9, v24);
          }
          else
          {
            int v26 = BYTE6(v57);
            unint64_t v27 = v55;
            memcpy((char *)v55 + v56, v9, v24);
            LODWORD(v56) = v25 + v24;
            if (!v26) {
              v27[(v25 + v24)] = 0;
            }
          }
        }
        if ((v11 & 7) != 0 && (v57 & 0x200000000) == 0)
        {
          size_t v28 = 8 - (v11 & 7);
          int v29 = v56;
          if (SBYTE6(v57) + HIDWORD(v56) - (int)v56 - 1 < v28)
          {
            os_trace_blob_add_slow((uint64_t)&v55, &__src, v28);
          }
          else
          {
            int v30 = BYTE6(v57);
            int v31 = v55;
            memcpy((char *)v55 + v56, &__src, v28);
            LODWORD(v56) = v29 + v28;
            if (!v30) {
              v31[(v29 + v28)] = 0;
            }
          }
        }
        goto LABEL_26;
      }
      unint64_t v15 = v55;
      unint64_t v16 = v58;
      *(void *)((char *)v55 + v56) = v58;
      int v17 = v14 + 8;
      LODWORD(v56) = v17;
      unint64_t v11 = HIDWORD(v16);
      if (!v13) {
        v15[v17] = 0;
      }
    }
    if ((v12 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_17;
  }
LABEL_33:
  os_unfair_lock_lock_with_options();
  for (uint64_t i = 0; i != 64; ++i)
  {
    for (uint64_t j = _os_log_globals[i]; j; uint64_t j = *(void *)(j + 16))
    {
      if ((*(unsigned char *)(j + 63) & 4) != 0)
      {
        uint64_t v34 = *(unsigned __int8 **)(j + 24);
        LODWORD(v35) = v34[2] + v34[3] + 4;
        LODWORD(v58) = 2;
        HIDWORD(v58) = v35;
        char v36 = BYTE4(v57);
        if ((v57 & 0x200000000) == 0)
        {
          char v37 = BYTE6(v57);
          int v38 = v56;
          if ((SBYTE6(v57) + HIDWORD(v56) - v56 - 1) <= 7)
          {
            os_trace_blob_add_slow((uint64_t)&v55, &v58, 8uLL);
            char v36 = BYTE4(v57);
          }
          else
          {
            uint64_t v39 = v55;
            unint64_t v40 = v58;
            *(void *)((char *)v55 + v56) = v58;
            int v41 = v38 + 8;
            LODWORD(v56) = v41;
            unint64_t v35 = HIDWORD(v40);
            if (!v37) {
              v39[v41] = 0;
            }
          }
        }
        if ((v36 & 2) == 0)
        {
          int v42 = v56;
          if (SBYTE6(v57) + HIDWORD(v56) - (int)v56 - 1 < v35)
          {
            os_trace_blob_add_slow((uint64_t)&v55, v34, v35);
          }
          else
          {
            int v43 = BYTE6(v57);
            long long v44 = v55;
            memcpy((char *)v55 + v56, v34, v35);
            LODWORD(v56) = v42 + v35;
            if (!v43) {
              v44[(v42 + v35)] = 0;
            }
          }
        }
        if ((v35 & 7) != 0 && (v57 & 0x200000000) == 0)
        {
          size_t v45 = 8 - (v35 & 7);
          int v46 = v56;
          if (SBYTE6(v57) + HIDWORD(v56) - (int)v56 - 1 < v45)
          {
            os_trace_blob_add_slow((uint64_t)&v55, &__src, v45);
          }
          else
          {
            int v47 = BYTE6(v57);
            long long v48 = v55;
            memcpy((char *)v55 + v56, &__src, v45);
            LODWORD(v56) = v46 + v45;
            if (!v47) {
              v48[(v46 + v45)] = 0;
            }
          }
        }
      }
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1EB1CFB58);
  mach_vm_address_t *address = 0;
  size_t v49 = v56;
  mach_vm_size_t v50 = ~*MEMORY[0x1E4F14C70] & (*MEMORY[0x1E4F14C70] + v56);
  *long long v53 = v50;
  if (!v50) {
    return 0;
  }
  uint64_t v51 = mach_vm_allocate(*MEMORY[0x1E4F14C48], address, v50, 1);
  if (!v51) {
    memcpy((void *)*address, v55, v49);
  }
  if ((v57 & 0x100000000) != 0) {
    free(v55);
  }
  return v51;
}

void _os_trace_debug_channel_handler(uint64_t a1, uint64_t a2)
{
  if (a2 == 2)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    _os_trace_mig_server(48, msg);
  }
  else if (a2 == 1 && (byte_1EB1CF86C & 1) == 0)
  {
    if (_dispatch_is_multithreaded())
    {
      __swp(&byte_1EB1CF86C, (unsigned int *)&byte_1EB1CF86C);
      if ((&byte_1EB1CF86C & 1) == 0)
      {
        _os_log_watch_for_prefchanges();
      }
    }
  }
}

void _os_trace_with_buffer(void *dso, const char *message, uint8_t type, const void *buffer, size_t buffer_size, os_trace_payload_t payload)
{
  int v7 = v6;
  int v11 = type;
  uint64_t v68 = *MEMORY[0x1E4F14BF8];
  if (!dyld_sdk_at_least()) {
    return;
  }
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v14 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v19 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v19, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v19 == v14) {
      _os_log_preferences_refresh_process();
    }
  }
  if ((WORD4(xmmword_1EB1CF7F0) & 0x500) != 0 || (MEMORY[0xFFFFFC104] & 0x500) != 0) {
    return;
  }
  uint64_t v66 = 0;
  unsigned int v67 = 0;
  unint64_t v65 = 0;
  if ((BYTE8(xmmword_1EB1CF7F0) & 8) == 0
    && (MEMORY[0xFFFFFC104] & 8) == 0
    && (voucher_get_activity_id() & 0x800000000000000) == 0
    || (byte_1EB1CF868 & 2) == 0)
  {
    int v63 = 0;
    goto LABEL_13;
  }
  if (v11 == 2)
  {
    int v63 = (BYTE4(qword_1EB1CF860) >> 1) & 1;
    goto LABEL_35;
  }
  if (v11 != 4)
  {
    int v63 = (BYTE4(qword_1EB1CF860) >> 3) & 1;
LABEL_13:
    uint64_t v15 = 0;
    BOOL v16 = 0;
    if (v11 > 64)
    {
      if (v11 == 65)
      {
        BOOL v16 = 0;
        uint64_t v15 = 4096;
      }
      else if (v11 == 193)
      {
        BOOL v16 = 0;
        uint64_t v15 = 4352;
      }
      goto LABEL_41;
    }
    if (v11 != 2)
    {
      if (v11 != 4) {
        goto LABEL_41;
      }
      goto LABEL_16;
    }
LABEL_35:
    if ((BYTE8(xmmword_1EB1CF7F0) & 2) != 0 || (MEMORY[0xFFFFFC104] & 2) != 0)
    {
      BOOL v16 = 0;
    }
    else
    {
      uint64_t activity_id = voucher_get_activity_id();
      BOOL v16 = (activity_id & 0x200000000000000) == 0;
      if (((((activity_id & 0x200000000000000uLL) >> 57) | v63) & 1) == 0) {
        return;
      }
    }
    uint64_t v15 = 512;
    goto LABEL_41;
  }
  int v63 = BYTE4(qword_1EB1CF860) & 1;
LABEL_16:
  if ((BYTE8(xmmword_1EB1CF7F0) & 3) != 0 || (MEMORY[0xFFFFFC104] & 3) != 0)
  {
    BOOL v16 = 0;
  }
  else
  {
    uint64_t v17 = voucher_get_activity_id();
    BOOL v16 = (v17 & 0x300000000000000) == 0;
    char v18 = v63;
    if ((v17 & 0x300000000000000) != 0) {
      char v18 = 1;
    }
    if ((v18 & 1) == 0) {
      return;
    }
  }
  uint64_t v15 = 256;
LABEL_41:
  uint64_t v60 = v15;
  if (off_1EB1CF7E8) {
    xpc_object_t v21 = (atomic_ullong *)((char *)off_1EB1CF7E8 + 8);
  }
  else {
    xpc_object_t v21 = 0;
  }
  os_trace_payload_t v62 = payload;
  BOOL v61 = v16;
  if (_os_trace_dsc_load_addr > (unint64_t)dso
    || _os_trace_dsc_size + _os_trace_dsc_load_addr <= (unint64_t)dso)
  {
    if (*((_DWORD *)dso + 3) == 2)
    {
      long long v22 = 0;
      int v7 = v6 - dso;
      LODWORD(v66) = v6 - dso;
      WORD2(v66) = (unint64_t)(v6 - (void)dso) >> 32;
      uint64_t v23 = 4;
      HIWORD(v66) = 4;
      unsigned int v67 = 0;
      uint64_t v24 = 2;
      goto LABEL_80;
    }
    if (off_1EB1CF7E8)
    {
LABEL_52:
      atomic_ullong v25 = *v21;
      do
      {
        if (v25)
        {
          BOOL v27 = v16;
          _os_trace_rwptr_rdlock_wait((uint64_t)v21);
          BOOL v16 = v27;
          goto LABEL_52;
        }
        atomic_ullong v26 = v25;
        atomic_compare_exchange_strong_explicit(v21, (unint64_t *)&v26, v25 + 0x200000000, memory_order_relaxed, memory_order_relaxed);
        BOOL v33 = v26 == v25;
        atomic_ullong v25 = v26;
      }
      while (!v33);
      atomic_ullong v28 = v21[1];
      unint64_t v29 = *(unsigned __int16 *)(v28 + 10);
      unint64_t v30 = ((unint64_t)dso >> *MEMORY[0x1E4F14C78]) % v29;
      while (1)
      {
        unint64_t v31 = v28 + 16 * v30;
        uint64_t v32 = *(void **)(v31 + 16);
        if (v32 == dso) {
          break;
        }
        if (v30 + 1 == v29) {
          unint64_t v30 = 0;
        }
        else {
          ++v30;
        }
        if (v32) {
          BOOL v33 = v30 == ((unint64_t)dso >> *MEMORY[0x1E4F14C78]) % v29;
        }
        else {
          BOOL v33 = 1;
        }
        if (v33)
        {
          long long v22 = 0;
          goto LABEL_69;
        }
      }
      long long v22 = *(_OWORD **)(v31 + 24);
LABEL_69:
      unint64_t v34 = *(unsigned int *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
      atomic_ullong v35 = *v21;
      atomic_ullong v36 = *v21;
      do
      {
        unint64_t v37 = v35 - 0x200000000;
        if (v35 == 0x300000000) {
          unint64_t v37 = v34;
        }
        atomic_compare_exchange_strong_explicit(v21, (unint64_t *)&v36, v37, memory_order_relaxed, memory_order_relaxed);
        BOOL v33 = v36 == v35;
        atomic_ullong v35 = v36;
      }
      while (!v33);
      if (v37 == v34)
      {
        __dmb(9u);
        _os_trace_rwptr_cleanup((uint64_t)v21, (void (*)(void))_os_trace_mh_map_cleanup);
      }
      unsigned int v67 = v22;
      if (v22)
      {
        int v7 = v6 - dso;
        LODWORD(v66) = v6 - dso;
        WORD2(v66) = (unint64_t)(v6 - (void)dso) >> 32;
        uint64_t v23 = 20;
        HIWORD(v66) = 20;
        uint64_t v24 = 10;
        goto LABEL_80;
      }
    }
    else
    {
      unsigned int v67 = 0;
    }
    long long v22 = 0;
    LODWORD(v66) = v6;
    WORD2(v66) = WORD2(v6);
    uint64_t v23 = 6;
    HIWORD(v66) = 6;
    uint64_t v24 = 8;
LABEL_80:
    if (message) {
      goto LABEL_81;
    }
    goto LABEL_88;
  }
  int v7 = v6 - _os_trace_dsc_load_addr;
  LODWORD(v66) = v6 - _os_trace_dsc_load_addr;
  WORD2(v66) = (unint64_t)(v6 - _os_trace_dsc_load_addr) >> 32;
  unsigned int v67 = 0;
  long long v22 = 0;
  if (WORD2(v66))
  {
    uint64_t v23 = 6;
    HIWORD(v66) = 6;
    uint64_t v24 = 12;
    if (!message) {
      goto LABEL_88;
    }
LABEL_81:
    uint64_t v38 = _os_trace_dsc_load_addr;
    if (_os_trace_dsc_load_addr <= (unint64_t)dso)
    {
      if (_os_trace_dsc_size + _os_trace_dsc_load_addr <= (unint64_t)dso) {
        uint64_t v38 = (uint64_t)dso;
      }
      unint64_t v39 = (unint64_t)&message[-v38];
    }
    else
    {
      unint64_t v39 = message - (unsigned char *)dso;
    }
    unint64_t v40 = v39 & 0x7FFFFFFF | ((unint64_t)(unsigned __int16)(v39 >> 31) << 32);
    goto LABEL_89;
  }
  HIDWORD(v66) = 0x40000;
  uint64_t v23 = 4;
  uint64_t v24 = 4;
  if (message) {
    goto LABEL_81;
  }
LABEL_88:
  unint64_t v40 = 0;
LABEL_89:
  unint64_t v65 = v40;
  uint64_t v41 = v23 + 2 * ((v40 & 0xFFFF00000000) != 0);
  uint64_t v42 = MEMORY[0x1F41887A8](v24);
  long long v48 = (char *)v58 - v47;
  if (v49)
  {
    *(_DWORD *)long long v48 = v66;
    *((_WORD *)v48 + 2) = WORD2(v66);
  }
  else
  {
    *(_DWORD *)long long v48 = v7;
    if ((v45 & 1) == 0) {
      *(_OWORD *)(v48 + 4) = *v22;
    }
  }
  if (v46)
  {
    uint64_t v42 = v42 | 0x20;
    *(_WORD *)&v48[v44] = WORD2(v40);
  }
  char v64 = buffer;
  v58[1] = v43;
  uint64_t v59 = v42;
  if (buffer_size > 0x3FF)
  {
    uint64_t v50 = *((char *)buffer + buffer_size - 1);
    if (*((char *)buffer + buffer_size - 1))
    {
      size_t v51 = 0;
      size_t v52 = 0;
      long long v53 = (char *)buffer + buffer_size + ~v50;
      while (1)
      {
        size_t v54 = v52 + (v53[v51] & 0x3F);
        size_t v55 = v51 + 1;
        if (v51 + 1 + v54 >= 0x401) {
          break;
        }
        ++v51;
        size_t v52 = v54;
        if (v50 == v55) {
          goto LABEL_104;
        }
      }
      memcpy(&v48[v41], v64, v52);
      memcpy(&v48[v41 + v52], v53, v51);
      v48[v52 + v41 + v51] = v51;
    }
  }
  else
  {
    memcpy(&v48[v41], buffer, buffer_size);
  }
LABEL_104:
  uint64_t v56 = mach_continuous_time();
  uint64_t v57 = ((unint64_t)v59 << 16) | (v40 << 32) | v60 | 3;
  if (!v61) {
    uint64_t v57 = voucher_activity_trace();
  }
  if (v63) {
    _os_trace_stream((unint64_t)dso, (uint64_t)message, (unsigned int *)&v66, (uint64_t)&v65, (uint64_t)v64, (void *)buffer_size, v57, v56, (uint64_t)v62);
  }
}

void _os_trace_stream(unint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v17 = _os_trace_diagnosticd_pipe(0);
  if (v17)
  {
    char v18 = v17;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    *(_OWORD *)object = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    memset(v21, 0, sizeof(v21));
    if (a7 <= 6u && ((1 << a7) & 0x58) != 0) {
      unsigned int v19 = a7 << 8;
    }
    else {
      unsigned int v19 = bswap32(a7) >> 16;
    }
    LODWORD(v21[0]) = v19;
    *((void *)&v22 + 1) = a7;
    *(void *)&long long v23 = a8;
    *(void *)&long long v28 = a2;
    *((void *)&v28 + 1) = a5;
    object[0] = a6;
    if (a9)
    {
      xpc_object_t v20 = xpc_dictionary_create(0, 0, 0);
      (*(void (**)(uint64_t, xpc_object_t))(a9 + 16))(a9, v20);
      if (xpc_dictionary_get_count(v20)) {
        object[1] = v20;
      }
      else {
        xpc_release(v20);
      }
    }
    _os_activity_stream_reflect((uint64_t)v18, (uint64_t)v21, a1, -3, a3, a4);
    if (object[1])
    {
      xpc_release(object[1]);
      object[1] = 0;
    }
    xpc_release(v18);
  }
}

uint64_t os_trace_get_type(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 1);
  if (v1 <= 1)
  {
    if (!*(unsigned char *)(a1 + 1)) {
      return 1;
    }
    if (v1 == 1) {
      return 4;
    }
  }
  else
  {
    switch(v1)
    {
      case 2u:
        return 2;
      case 0x10u:
        return 65;
      case 0x11u:
        return 193;
    }
  }
  return 0;
}

uint64_t os_trace_get_mode()
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v0 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v2 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v2, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v2 == v0) {
      _os_log_preferences_refresh_process();
    }
  }
  return DWORD2(xmmword_1EB1CF7F0);
}

BOOL _os_trace_set_mode_for_pid(int pid, int a2)
{
  mach_port_name_t name = 0;
  uint32_t v3 = (ipc_space_t *)MEMORY[0x1E4F14C48];
  BOOL v4 = 0;
  if (!debug_control_port_for_pid(*MEMORY[0x1E4F14C48], pid, &name))
  {
    if (name)
    {
      uint64_t v8 = *MEMORY[0x1E4F14C30];
      int v9 = a2;
      uint64_t v10 = 0;
      *(void *)&msg.msgh_bits = 19;
      msg.mach_port_t msgh_remote_port = name;
      msg.mach_msg_id_t msgh_id = 50000;
      *(void *)&msg.msgh_local_port = 0;
      if (MEMORY[0x1E4F14C88]) {
        voucher_mach_msg_set(&msg);
      }
      BOOL v4 = mach_msg(&msg, 1, 0x2Cu, 0, 0, 0, 0) == 0;
      if (mach_port_deallocate(*v3, name)) {
        _os_assumes_log();
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

BOOL _os_trace_get_mode_for_pid(int pid, _DWORD *a2)
{
  kern_return_t v4;
  BOOL result;
  mach_port_name_t v6;
  mach_port_name_t reply_port;
  mach_msg_return_t v8;
  int v9;
  BOOL v10;
  unsigned __int16 v11;
  mach_port_name_t name;
  unsigned char msg[36];
  long long v14;
  int v15;
  uint64_t v16;

  BOOL v16 = *MEMORY[0x1E4F14BF8];
  mach_port_name_t name = 0;
  uint32_t v3 = (ipc_space_t *)MEMORY[0x1E4F14C48];
  BOOL v4 = debug_control_port_for_pid(*MEMORY[0x1E4F14C48], pid, &name);
  uint64_t result = 0;
  if (v4) {
    return result;
  }
  uint64_t v6 = name;
  if (!name) {
    return 0;
  }
  uint64_t v15 = 0;
  int v14 = 0u;
  memset(&msg[4], 0, 32);
  reply_port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = v6;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0xC35200000000;
  if (MEMORY[0x1E4F14C88])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_port = *(_DWORD *)&msg[12];
  }
  uint64_t v8 = mach_msg((mach_msg_header_t *)msg, 275, 0x18u, 0x38u, reply_port, 0x3E8u, 0);
  int v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    goto LABEL_22;
  }
  if (!v8)
  {
    if (*(_DWORD *)&msg[20] == 71)
    {
      int v9 = -308;
    }
    else if (*(_DWORD *)&msg[20] == 50102)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 48)
        {
          if (!*(_DWORD *)&msg[8])
          {
            int v9 = *(_DWORD *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              *a2 = v14;
              goto LABEL_36;
            }
            goto LABEL_30;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8]) {
            uint64_t v10 = 1;
          }
          else {
            uint64_t v10 = *(_DWORD *)&msg[32] == 0;
          }
          if (v10) {
            int v9 = -300;
          }
          else {
            int v9 = *(_DWORD *)&msg[32];
          }
          goto LABEL_30;
        }
      }
      int v9 = -300;
    }
    else
    {
      int v9 = -301;
    }
LABEL_30:
    mach_msg_destroy((mach_msg_header_t *)msg);
    goto LABEL_31;
  }
  mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
LABEL_22:
  if (v9 == 268435460)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100) {
      mach_port_deallocate(*v3, *(mach_port_name_t *)&msg[12]);
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
    int v11 = 4;
LABEL_35:
    int v9 = v11 | 0x10000000;
    goto LABEL_36;
  }
LABEL_31:
  if (v9 == 268451843)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)mach_msg_header_t msg = 67109120;
      *(_DWORD *)&msg[4] = 268451843;
      _os_log_error_impl(&dword_19DC79000, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Timed out get mode error %d", msg, 8u);
    }
    int v11 = 16387;
    goto LABEL_35;
  }
LABEL_36:
  if (mach_port_deallocate(*v3, name)) {
    _os_assumes_log();
  }
  return v9 == 0;
}

BOOL os_trace_info_enabled(void)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v0 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v2 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v2, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v2 == v0) {
      _os_log_preferences_refresh_process();
    }
  }
  if ((BYTE8(xmmword_1EB1CF7F0) & 3) != 0
    || (MEMORY[0xFFFFFC104] & 3) != 0
    || (voucher_get_activity_id() & 0x300000000000000) != 0)
  {
    return 1;
  }
  if (((BYTE8(xmmword_1EB1CF7F0) & 8) != 0
     || (MEMORY[0xFFFFFC104] & 8) != 0
     || (voucher_get_activity_id() & 0x800000000000000) != 0)
    && (byte_1EB1CF868 & 2) != 0)
  {
    return BYTE4(qword_1EB1CF860) & 1;
  }
  return 0;
}

BOOL os_trace_debug_enabled(void)
{
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v0 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v2 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v2, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v2 == v0) {
      _os_log_preferences_refresh_process();
    }
  }
  if ((BYTE8(xmmword_1EB1CF7F0) & 2) != 0
    || (MEMORY[0xFFFFFC104] & 2) != 0
    || (voucher_get_activity_id() & 0x200000000000000) != 0)
  {
    LOBYTE(v1) = 1;
  }
  else if (((BYTE8(xmmword_1EB1CF7F0) & 8) != 0 {
          || (MEMORY[0xFFFFFC104] & 8) != 0
  }
          || (voucher_get_activity_id() & 0x800000000000000) != 0)
         && (byte_1EB1CF868 & 2) != 0)
  {
    return (BYTE4(qword_1EB1CF860) >> 1) & 1;
  }
  else
  {
    LOBYTE(v1) = 0;
  }
  return v1;
}

uint64_t _os_log_mask_create_device_digest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1EB1CF850 != -1) {
    dispatch_once(&qword_1EB1CF850, &__block_literal_global_108);
  }

  return _os_log_mask_create_digest(a1, a2, (uint64_t)&xmmword_1EB1CF840 + 8, a3);
}

unint64_t _os_log_mask_bytes_size_for_unicode_codepoint_count_stop(unsigned char *a1, unint64_t a2, unint64_t a3, unint64_t *a4, int a5)
{
  unint64_t v5 = 0;
  if (a2)
  {
    unint64_t result = 0;
    if (a3)
    {
      unint64_t result = 0;
      unint64_t v5 = 0;
      while (1)
      {
        int v8 = *a1;
        if (!*a1 || v8 == a5) {
          break;
        }
        if ((v8 & 0x80) != 0)
        {
          if ((v8 & 0xF8) == 0xF0)
          {
            uint64_t v10 = 4;
          }
          else if ((v8 & 0xF0) == 0xE0)
          {
            uint64_t v10 = 3;
          }
          else
          {
            if ((v8 & 0xE0) != 0xC0) {
              break;
            }
            uint64_t v10 = 2;
          }
          if (v10 + result <= a2)
          {
            uint64_t v11 = 1;
            while ((a1[v11] & 0xC0) == 0x80)
            {
              if (v10 == ++v11)
              {
                result += v10;
                goto LABEL_22;
              }
            }
          }
          break;
        }
        if (result < a2)
        {
          ++result;
          uint64_t v10 = 1;
LABEL_22:
          ++v5;
          if (result < a2)
          {
            a1 += v10;
            if (v5 < a3) {
              continue;
            }
          }
        }
        break;
      }
    }
  }
  else
  {
    unint64_t result = 0;
  }
  *a4 = v5;
  return result;
}

void ___os_log_mask_create_device_digest_block_invoke()
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "operation", 5uLL);
  BOOL v1 = (void *)_os_trace_logd_send_with_reply();
  if (!v1)
  {
    xpc_release(empty);
LABEL_5:
    uint64_t int64 = xmmword_1EB1CF840;
    goto LABEL_6;
  }
  int v2 = v1;
  uint64_t int64 = xpc_dictionary_get_uint64(v1, "device_salt");
  xpc_release(v2);
  xpc_release(empty);
  if (!uint64) {
    goto LABEL_5;
  }
LABEL_6:
  *((void *)&xmmword_1EB1CF840 + 1) = uint64;
}

void *os_trace_blob_detach(uint64_t a1, void *a2)
{
  __int16 v2 = *(_WORD *)(a1 + 20);
  uint32_t v3 = *(const void **)a1;
  *(void *)a1 = 3954044928;
  *(_WORD *)(a1 + 20) = 0;
  if (a2) {
    *a2 = *(unsigned int *)(a1 + 8);
  }
  if ((v2 & 1) == 0)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 8);
    if (*(unsigned char *)(a1 + 22)) {
      size_t v5 = v4;
    }
    else {
      size_t v5 = v4 + 1;
    }
    while (1)
    {
      uint64_t v6 = malloc_type_malloc(v5, 0x91D685AAuLL);
      if (v6) {
        break;
      }
      _os_trace_temporary_resource_shortage();
    }
    int v7 = v6;
    memcpy(v6, v3, v5);
    return v7;
  }
  return (void *)v3;
}

tm *os_trace_blob_add_localtime(tm *result, time_t a2, char a3, unsigned int a4)
{
  time_t v20 = a2;
  if (BYTE2(result->tm_year))
  {
    qword_1E94500E8 = (uint64_t)"BUG IN LIBTRACE: Can't use addf() in binary blobs";
    __break(1u);
  }
  else
  {
    uint64_t v4 = (uint64_t)result;
    if ((result->tm_year & 2) == 0)
    {
      memset(&v19, 0, sizeof(v19));
      unint64_t result = localtime_r(&v20, &v19);
      if (result)
      {
        os_trace_blob_addf(v4, "%04d-%02d-%02d %02d:%02d:%02d", v7, v8, v9, v10, v11, v12, LOBYTE(v19.tm_year) + 108);
        if (a4 <= 2) {
          os_trace_blob_addf(v4, off_1E5984308[a4], v13, v14, v15, v16, v17, v18, a3);
        }
        return (tm *)os_trace_blob_addf(v4, "%+05ld", v13, v14, v15, v16, v17, v18, (v19.tm_gmtoff / 60 % 60) + 100 * (v19.tm_gmtoff / 3600));
      }
    }
  }
  return result;
}

unint64_t os_trace_blob_add_hexdump(unint64_t result, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v7 = result;
  char v27 = 39;
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    uint64_t v8 = *(unsigned int *)(result + 8);
    if (*(char *)(result + 22) + *(_DWORD *)(result + 12) - 1 == v8)
    {
      unint64_t result = os_trace_blob_add_slow(result, &v27, 1uLL);
      if (!a3) {
        goto LABEL_27;
      }
      goto LABEL_6;
    }
    *(unsigned char *)(*(void *)result + v8) = 39;
    unsigned int v9 = *(_DWORD *)(result + 8) + 1;
    *(_DWORD *)(result + 8) = v9;
    if (!*(unsigned char *)(result + 22)) {
      *(unsigned char *)(*(void *)result + v9) = 0;
    }
  }
  if (!a3) {
    goto LABEL_27;
  }
LABEL_6:
  uint64_t v10 = 0;
  do
  {
    unint64_t v11 = *(unsigned __int8 *)(a2 + v10);
    __int16 v12 = *(_WORD *)(v7 + 20);
    if (v10)
    {
      char v26 = 32;
      if ((v12 & 2) == 0)
      {
        uint64_t v13 = *(unsigned int *)(v7 + 8);
        if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == v13)
        {
          unint64_t result = os_trace_blob_add_slow(v7, &v26, 1uLL);
        }
        else
        {
          *(unsigned char *)(*(void *)v7 + v13) = 32;
          unsigned int v14 = *(_DWORD *)(v7 + 8) + 1;
          *(_DWORD *)(v7 + 8) = v14;
          if (!*(unsigned char *)(v7 + 22)) {
            *(unsigned char *)(*(void *)v7 + v14) = 0;
          }
        }
      }
      __int16 v12 = *(_WORD *)(v7 + 20);
    }
    char v15 = a0123456789abcd[v11 >> 4];
    char __src = v15;
    if ((v12 & 2) == 0)
    {
      uint64_t v16 = *(unsigned int *)(v7 + 8);
      if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == v16)
      {
        unint64_t result = os_trace_blob_add_slow(v7, &__src, 1uLL);
      }
      else
      {
        *(unsigned char *)(*(void *)v7 + v16) = v15;
        unsigned int v17 = *(_DWORD *)(v7 + 8) + 1;
        *(_DWORD *)(v7 + 8) = v17;
        if (!*(unsigned char *)(v7 + 22)) {
          *(unsigned char *)(*(void *)v7 + v17) = 0;
        }
      }
    }
    char v18 = a0123456789abcd[v11 & 0xF];
    char v24 = v18;
    if ((*(_WORD *)(v7 + 20) & 2) == 0)
    {
      uint64_t v19 = *(unsigned int *)(v7 + 8);
      if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == v19)
      {
        unint64_t result = os_trace_blob_add_slow(v7, &v24, 1uLL);
      }
      else
      {
        *(unsigned char *)(*(void *)v7 + v19) = v18;
        unsigned int v20 = *(_DWORD *)(v7 + 8) + 1;
        *(_DWORD *)(v7 + 8) = v20;
        if (!*(unsigned char *)(v7 + 22)) {
          *(unsigned char *)(*(void *)v7 + v20) = 0;
        }
      }
    }
    ++v10;
  }
  while (a3 != v10);
LABEL_27:
  if (a4)
  {
    return os_trace_blob_addns(v7, "…'", 0xFFFFFFFFFFFFFFFFLL, 0);
  }
  else
  {
    char v23 = 39;
    if ((*(_WORD *)(v7 + 20) & 2) == 0)
    {
      uint64_t v21 = *(unsigned int *)(v7 + 8);
      if (*(char *)(v7 + 22) + *(_DWORD *)(v7 + 12) - 1 == v21)
      {
        return os_trace_blob_add_slow(v7, &v23, 1uLL);
      }
      else
      {
        *(unsigned char *)(*(void *)v7 + v21) = 39;
        unsigned int v22 = *(_DWORD *)(v7 + 8) + 1;
        *(_DWORD *)(v7 + 8) = v22;
        if (!*(unsigned char *)(v7 + 22)) {
          *(unsigned char *)(*(void *)v7 + v22) = 0;
        }
      }
    }
  }
  return result;
}

const char *os_log_fmt_extract_symptom(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 1)) {
    return 0;
  }
  int v1 = *(unsigned char *)(a1 + 2) & 0xF0;
  if (v1 == 32)
  {
    uint64_t v4 = *(const char **)(a1 + 4);
    strlen(v4);
    return v4;
  }
  if (v1 != 16 || *(unsigned __int8 *)(a1 + 1) < 2u) {
    return 0;
  }
  uint64_t v2 = a1 + 4 + *(unsigned __int8 *)(a1 + 3);
  int v3 = *(unsigned char *)v2 & 0xF0;
  if (v3 == 32)
  {
    uint64_t v4 = *(const char **)(v2 + 2);
    strnlen(v4, *(int *)(a1 + 4));
    return v4;
  }
  if (v3 == 48) {
    return *(const char **)(v2 + 2);
  }
  else {
    return 0;
  }
}

unsigned char *os_log_fmt_convert_trace(unsigned char *a1, char *a2, uint64_t a3)
{
  int v3 = a1;
  size_t v5 = &a2[a3 - 1];
  uint64_t v4 = *v5;
  *a1 = 0;
  a1[1] = v4;
  if (v4)
  {
    uint64_t v6 = -v4;
    uint64_t v7 = &a2[a3 + ~v4];
    uint64_t v8 = a1 + 2;
    while (1)
    {
      size_t v9 = v5[v6] & 0x3F;
      uint64_t v10 = &a2[v9];
      if (&a2[v9] > v7) {
        break;
      }
      unsigned char *v8 = 0;
      v8[1] = v9;
      unint64_t v11 = v8 + 2;
      memcpy(v8 + 2, a2, v9);
      uint64_t v8 = &v11[v9];
      a2 = v10;
      if (__CFADD__(v6++, 1)) {
        return v3;
      }
    }
    return 0;
  }
  return v3;
}

unsigned char *os_log_fmt_extract_pubdata(unsigned char *result, int a2, void *a3, unsigned __int16 *a4)
{
  *a3 = 0;
  *a4 = 0;
  if (!a2) {
    return &os_log_fmt_extract_pubdata_empty_hdr;
  }
  if (a2 == 1) {
    return 0;
  }
  uint64_t v4 = result + 2;
  unsigned __int16 v5 = a2 - 2;
  if (result[1])
  {
    int v6 = 0;
    while (v5 >= 2u)
    {
      unint64_t v7 = v4[1] + 2;
      if (v7 > v5) {
        break;
      }
      v4 += v7;
      v5 -= v7;
      if (result[1] <= (unsigned __int16)++v6) {
        goto LABEL_10;
      }
    }
    return 0;
  }
LABEL_10:
  *a3 = v4;
  *a4 = v5;
  return result;
}

size_t _os_log_fmt_compose_masked_partial_redacted(size_t result, unsigned __int8 *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a4;
  unint64_t v10 = result;
  if (!a3 && (a4 & 1) == 0)
  {
    if ((*(_WORD *)(result + 20) & 2) != 0) {
      return result;
    }
    uint64_t v11 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v11 - 1) > 7)
    {
      *(void *)(*(void *)result + v11) = 0x3E296C6C756E283CLL;
      unsigned int v12 = *(_DWORD *)(result + 8) + 8;
      goto LABEL_71;
    }
    char v45 = "<(null)>";
    size_t v46 = 8;
    goto LABEL_78;
  }
  if (a3 <= 3)
  {
    if ((*(_WORD *)(result + 20) & 2) != 0) {
      return result;
    }
    uint64_t v13 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v13 - 1) > 4)
    {
      uint64_t v14 = *(void *)result + v13;
      *(unsigned char *)(v14 + 4) = 62;
      *(_DWORD *)uint64_t v14 = -1501502916;
      unsigned int v12 = *(_DWORD *)(result + 8) + 5;
      goto LABEL_71;
    }
    char v45 = "<…>";
    size_t v46 = 5;
    goto LABEL_78;
  }
  unint64_t v15 = a3;
  unint64_t v16 = *a2;
  char v17 = a2[1];
  unint64_t v18 = a2[2];
  int v19 = a2[3];
  BOOL v21 = v19 != 2 || v18 == 0;
  if (!a4 && !*a2 && v21)
  {
    unsigned int v22 = a2 + 4;
    unint64_t v23 = a3 - 4;
    return os_trace_blob_addns(result, v22, v23, 0);
  }
  BOOL v24 = v19 == 1;
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    uint64_t v25 = *(unsigned int *)(result + 8);
    if (*(char *)(result + 22) + *(_DWORD *)(result + 12) - 1 == v25)
    {
      os_trace_blob_add_slow(result, "<", 1uLL);
    }
    else
    {
      *(unsigned char *)(*(void *)result + v25) = 60;
      unsigned int v26 = *(_DWORD *)(result + 8) + 1;
      *(_DWORD *)(result + 8) = v26;
      if (!*(unsigned char *)(result + 22)) {
        *(unsigned char *)(*(void *)result + v26) = 0;
      }
    }
  }
  unint64_t v27 = v16 + 4;
  if (v15 > v16 + 4)
  {
    if (v15 - (v16 + 4) < v18) {
      unint64_t v18 = v15 - (v16 + 4);
    }
    if (v19 == 2) {
      a3 = v18;
    }
    else {
      a3 = v15 - (v16 + 4);
    }
    if (a3)
    {
      if (v19 == 1 && (*(_WORD *)(v10 + 20) & 2) == 0)
      {
        uint64_t v28 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v28 - 1) <= 2)
        {
          unint64_t v47 = a3;
          os_trace_blob_add_slow(v10, "…", 3uLL);
          a3 = v47;
        }
        else
        {
          uint64_t v29 = *(void *)v10 + v28;
          *(unsigned char *)(v29 + 2) = -90;
          *(_WORD *)uint64_t v29 = -32542;
          unsigned int v30 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v30;
          if (!*(unsigned char *)(v10 + 22)) {
            *(unsigned char *)(*(void *)v10 + v30) = 0;
          }
        }
      }
      if (os_trace_blob_addns(v10, &a2[v27], a3, 0))
      {
        if (((v19 | 2) == 2 || v8) && (*(_WORD *)(v10 + 20) & 2) == 0)
        {
          uint64_t v31 = *(unsigned int *)(v10 + 8);
          if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v31 - 1) <= 2)
          {
            os_trace_blob_add_slow(v10, "…", 3uLL);
          }
          else
          {
            uint64_t v32 = *(void *)v10 + v31;
            *(unsigned char *)(v32 + 2) = -90;
            *(_WORD *)uint64_t v32 = -32542;
            unsigned int v33 = *(_DWORD *)(v10 + 8) + 3;
            *(_DWORD *)(v10 + 8) = v33;
            if (!*(unsigned char *)(v10 + 22)) {
              *(unsigned char *)(*(void *)v10 + v33) = 0;
            }
          }
        }
        BOOL v24 = 1;
      }
    }
    else
    {
      BOOL v24 = 0;
    }
    if (v19 == 2
      && (a3 = v15 - (v18 + v27), v15 != v18 + v27)
      && os_trace_blob_addns(v10, &a2[v18 + v27], a3, 0))
    {
      if ((*(_WORD *)(v10 + 20) & 2) == 0)
      {
        uint64_t v34 = *(unsigned int *)(v10 + 8);
        if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v34 - 1) <= 2)
        {
          os_trace_blob_add_slow(v10, "…", 3uLL);
        }
        else
        {
          uint64_t v35 = *(void *)v10 + v34;
          *(unsigned char *)(v35 + 2) = -90;
          *(_WORD *)uint64_t v35 = -32542;
          unsigned int v36 = *(_DWORD *)(v10 + 8) + 3;
          *(_DWORD *)(v10 + 8) = v36;
          if (!*(unsigned char *)(v10 + 22)) {
            *(unsigned char *)(*(void *)v10 + v36) = 0;
          }
        }
      }
    }
    else if (!v24)
    {
      goto LABEL_59;
    }
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      uint64_t v37 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v37 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }
      else
      {
        *(_WORD *)(*(void *)v10 + v37) = 8236;
        unsigned int v38 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v38;
        if (!*(unsigned char *)(v10 + 22)) {
          *(unsigned char *)(*(void *)v10 + v38) = 0;
        }
      }
    }
  }
LABEL_59:
  unint64_t result = os_trace_blob_addf(v10, "length=%u", a3, a4, a5, a6, a7, a8, v17);
  unint64_t v39 = v15 - 4;
  if (v39 >= v16) {
    uint64_t v40 = v16;
  }
  else {
    uint64_t v40 = v39;
  }
  if (v40)
  {
    uint64_t v41 = (uint64_t)(a2 + 4);
    if ((*(_WORD *)(v10 + 20) & 2) == 0)
    {
      uint64_t v42 = *(unsigned int *)(v10 + 8);
      if ((*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - v42 - 1) <= 1)
      {
        os_trace_blob_add_slow(v10, ", ", 2uLL);
      }
      else
      {
        *(_WORD *)(*(void *)v10 + v42) = 8236;
        unsigned int v43 = *(_DWORD *)(v10 + 8) + 2;
        *(_DWORD *)(v10 + 8) = v43;
        if (!*(unsigned char *)(v10 + 22)) {
          *(unsigned char *)(*(void *)v10 + v43) = 0;
        }
      }
    }
    unint64_t result = os_trace_blob_add_hexdump(v10, v41, v40, v39 < v16);
  }
  if ((*(_WORD *)(v10 + 20) & 2) == 0)
  {
    uint64_t v44 = *(unsigned int *)(v10 + 8);
    if (*(char *)(v10 + 22) + *(_DWORD *)(v10 + 12) - 1 != v44)
    {
      *(unsigned char *)(*(void *)v10 + v44) = 62;
      unsigned int v12 = *(_DWORD *)(v10 + 8) + 1;
LABEL_71:
      *(_DWORD *)(v10 + 8) = v12;
      if (!*(unsigned char *)(v10 + 22)) {
        *(unsigned char *)(*(void *)v10 + v12) = 0;
      }
      return result;
    }
    char v45 = ">";
    unint64_t result = v10;
    size_t v46 = 1;
LABEL_78:
    return os_trace_blob_add_slow(result, v45, v46);
  }
  return result;
}

uint64_t _os_log_fmt_builtin_annotated(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int a7)
{
  unint64_t v10 = 0;
  uint64_t v11 = *(const char **)(a3 + 40);
  size_t v12 = *(unsigned __int16 *)(a3 + 16);
  unint64_t v13 = 17;
  while (1)
  {
    unint64_t v14 = (v13 + v10) >> 1;
    unint64_t v15 = (&_os_log_fmt_builtin_annotated_functions)[2 * v14];
    int v16 = strncmp(v11, v15, v12);
    if (!v16) {
      break;
    }
LABEL_5:
    if (v16 < 0) {
      unint64_t v13 = (v13 + v10) >> 1;
    }
    else {
      unint64_t v10 = v14 + 1;
    }
    if (v10 >= v13) {
      return 0;
    }
  }
  if (v15[v12])
  {
    int v16 = -v15[v12];
    goto LABEL_5;
  }
  unint64_t v18 = (&_os_log_fmt_builtin_annotated_functions)[2 * v14 + 1];

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void))v18)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t _os_log_fmt_builtin_uuid_t(size_t a1, int a2, uint64_t a3, unsigned char *a4, unsigned __int8 *uu, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15 = *MEMORY[0x1E4F14BF8];
  if (*(unsigned char *)(a3 + 10) == 19 && a6 <= 0x10 && (a6 == 16 || (a7 & 1) != 0))
  {
    if (a6 != 16 && a7)
    {
      _os_log_fmt_decode_error(a1);
    }
    else
    {
      memset(v14, 0, sizeof(v14));
      uuid_unparse_upper(uu, v14);
      unint64_t v9 = strlen(v14);
      if ((*(_WORD *)(a1 + 20) & 2) == 0)
      {
        int v10 = v9;
        uint64_t v11 = *(unsigned int *)(a1 + 8);
        if (v9 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v11 - 1))
        {
          os_trace_blob_add_slow(a1, v14, v9);
        }
        else
        {
          memcpy((void *)(*(void *)a1 + v11), v14, v9);
          unsigned int v12 = *(_DWORD *)(a1 + 8) + v10;
          *(_DWORD *)(a1 + 8) = v12;
          if (!*(unsigned char *)(a1 + 22)) {
            *(unsigned char *)(*(void *)a1 + v12) = 0;
          }
        }
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_timeval(tm *a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a3 + 10) == 19 && a6 <= 0x10 && (a6 == 16 || (a7 & 1) != 0))
  {
    if (a6 != 16 && a7) {
      _os_log_fmt_decode_error((size_t)a1);
    }
    else {
      os_trace_blob_add_localtime(a1, *(void *)a5, *(_DWORD *)(a5 + 8), 1u);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_timespec(tm *a1, uint64_t a2, uint64_t a3, unsigned char *a4, time_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(unsigned char *)(a3 + 10) == 19 && a6 <= 0x10 && (a6 == 16 || (a7 & 1) != 0))
  {
    if (a6 != 16 && a7) {
      _os_log_fmt_decode_error((size_t)a1);
    }
    else {
      os_trace_blob_add_localtime(a1, *a5, a5[1], 0);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, a6, a7, a8);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_time(tm *a1, uint64_t a2, uint64_t a3, unsigned char *a4, time_t *a5, uint64_t a6)
{
  if (!_os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0)) {
    goto LABEL_8;
  }
  if (a6 == 4)
  {
    time_t v14 = *(int *)a5;
    goto LABEL_6;
  }
  if (a6 != 8)
  {
LABEL_8:
    _os_log_fmt_decode_cmd_mismatch((uint64_t)a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1;
  }
  time_t v14 = *a5;
LABEL_6:
  os_trace_blob_add_localtime(a1, v14, 0, 3u);
  return 1;
}

BOOL _os_log_fmt_spec_is_integer(unsigned __int8 a1, int a2)
{
  int v2 = a2 ^ 1;
  if (a1 - 1 < 0xC) {
    int v2 = 1;
  }
  if (v2) {
    return a1 - 1 < 0xC;
  }
  else {
    return a1 == 13;
  }
}

uint64_t _os_log_fmt_builtin_trace_mode(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, int *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 != 4 || !is_integer)
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
    return 1;
  }
  int v18 = *a5;
  os_trace_blob_addf(a1, "0x%X", v12, v13, v14, v15, v16, v17, *a5);
  uint64_t v19 = 0;
  char v20 = 1;
  do
  {
    if ((_os_log_fmt_builtin_trace_mode_masks[v19] & v18) == 0) {
      goto LABEL_20;
    }
    if (v20) {
      BOOL v21 = "(";
    }
    else {
      BOOL v21 = ", ";
    }
    if (v20) {
      size_t v22 = 3;
    }
    else {
      size_t v22 = 2;
    }
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      uint64_t v23 = *(unsigned int *)(a1 + 8);
      if (v22 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v23 - 1))
      {
        os_trace_blob_add_slow(a1, v21, v22);
      }
      else
      {
        memcpy((void *)(*(void *)a1 + v23), v21, v22);
        unsigned int v24 = *(_DWORD *)(a1 + 8) + v22;
        *(_DWORD *)(a1 + 8) = v24;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v24) = 0;
        }
      }
    }
    uint64_t v25 = *(char **)&_os_log_fmt_builtin_trace_mode_masks[v19 + 2];
    unint64_t v26 = strlen(v25);
    if ((*(_WORD *)(a1 + 20) & 2) != 0) {
      goto LABEL_18;
    }
    int v27 = v26;
    uint64_t v28 = *(unsigned int *)(a1 + 8);
    if (v26 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v28 - 1))
    {
      os_trace_blob_add_slow(a1, v25, v26);
LABEL_18:
      char v20 = 0;
      goto LABEL_20;
    }
    memcpy((void *)(*(void *)a1 + v28), v25, v26);
    unsigned int v29 = *(_DWORD *)(a1 + 8) + v27;
    *(_DWORD *)(a1 + 8) = v29;
    char v20 = *(unsigned char *)(a1 + 22);
    if (v20) {
      goto LABEL_18;
    }
    *(unsigned char *)(*(void *)a1 + v29) = 0;
LABEL_20:
    v19 += 4;
  }
  while (v19 != 28);
  if ((v20 & 1) == 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v30 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v30 - 1) <= 1)
    {
      os_trace_blob_add_slow(a1, ")", 2uLL);
    }
    else
    {
      *(_WORD *)(*(void *)a1 + v30) = 10528;
      unsigned int v31 = *(_DWORD *)(a1 + 8) + 2;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v31) = 0;
      }
    }
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_mach_errno(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, kern_return_t *a5, uint64_t a6)
{
  kern_return_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 == 4 && is_integer)
  {
    uint64_t v15 = *a5;
    if ((*a5 - 1100) > 6) {
      mach_error_string(v15 & 0xFFFFC1FF);
    }
    else {
      bootstrap_strerror(*a5);
    }
    os_trace_blob_addf(a1, "[%#x: %s]", v16, v17, v18, v19, v20, v21, v15);
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_iec_bytes(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  return 1;
}

uint64_t _os_log_fmt_builtin_scaled(uint64_t a1, unsigned int a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6, void *a7)
{
  if (_os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0))
  {
    unint64_t scalar = os_log_fmt_read_scalar(a3, a5, a6);
    double v24 = 0.0;
    int v25 = 0;
    if (*a7 && a7[1] && scalar >= 0x3E8)
    {
      int v25 = 0;
      do
      {
        int v26 = scalar;
        uint64_t v27 = a7[v25 + 2];
        ++v25;
        scalar /= a2;
      }
      while (v27 && scalar > 0x3E7);
      double v24 = (double)(v26 - scalar * a2) * 100.0;
    }
    unsigned int v28 = vcvtad_u64_f64(v24 / (double)a2);
    if (v28 == 100) {
      unint64_t v29 = scalar + 1;
    }
    else {
      unint64_t v29 = scalar;
    }
    if (v28 == 100) {
      unsigned int v28 = 0;
    }
    if (!v25) {
      return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
    }
    if (v29 <= 9 && -10 * (v28 / 0xA) != -v28) {
      return os_trace_blob_addf(a1, "%llu.%02u %s", v18, v19, v20, v21, v22, v23, v29);
    }
    if (v28 && v29 <= 0x63) {
      return os_trace_blob_addf(a1, "%llu.%01u %s", v18, v19, v20, v21, v22, v23, v29);
    }
    else {
      return os_trace_blob_addf(a1, "%llu %s", v18, v19, v20, v21, v22, v23, v29);
    }
  }
  else
  {
    uint64_t v32 = *(void *)a3;
    uint64_t v33 = *(unsigned __int16 *)(a3 + 12);
    return _os_log_fmt_decode_cmd_mismatch(a1, v32, v33, a4, a6, v14, v15, v16);
  }
}

uint64_t _os_log_fmt_builtin_iec_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_signal(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, _DWORD *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 == 4 && is_integer)
  {
    uint64_t v18 = *a5;
    if (v18 < 0x20) {
      os_trace_blob_addf(a1, "[sig%s: %s]", v12, v13, v14, v15, v16, v17, *(void *)(MEMORY[0x1E4F14C20] + 8 * v18));
    }
    else {
      os_trace_blob_addf(a1, "[%d: Unknown signal]", v12, v13, v14, v15, v16, v17, *a5);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_mode(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned int *a5, uint64_t a6)
{
  uint64_t v31 = *MEMORY[0x1E4F14BF8];
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 == 4 && is_integer)
  {
    unsigned int v15 = *a5;
    __src[0] = aPcDBLSW[(unsigned __int16)*a5 >> 12];
    if ((v15 & 0x40) != 0) {
      __int8 v16 = 120;
    }
    else {
      __int8 v16 = 45;
    }
    if ((v15 & 0x40) != 0) {
      __int8 v17 = 115;
    }
    else {
      __int8 v17 = 83;
    }
    if ((v15 & 8) != 0) {
      __int8 v18 = 120;
    }
    else {
      __int8 v18 = 45;
    }
    if ((v15 & 8) != 0) {
      __int8 v19 = 115;
    }
    else {
      __int8 v19 = 83;
    }
    int8x16_t v20 = (int8x16_t)vdupq_n_s32(v15);
    v21.i16[0] = 11565;
    v21.i8[3] = 45;
    v21.i8[4] = 45;
    v21.i16[3] = 11565;
    v21.i8[2] = v16;
    v21.i8[5] = v18;
    v22.i16[0] = 30578;
    v22.i8[2] = v17;
    v22.i8[3] = 114;
    v22.i8[4] = 119;
    v22.i8[5] = v19;
    v22.i16[3] = 30578;
    *(int8x8_t *)&__src[1] = vbsl_s8(vmovn_s16(vuzp1q_s16((int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_19DC94000)), (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v20, (int8x16_t)xmmword_19DC94010)))), v21, v22);
    if (v15) {
      char v23 = 120;
    }
    else {
      char v23 = 45;
    }
    if (v15) {
      char v24 = 116;
    }
    else {
      char v24 = 84;
    }
    if ((v15 & 0x200) != 0) {
      char v25 = v24;
    }
    else {
      char v25 = v23;
    }
    char __src[9] = v25;
    if ((*(unsigned char *)(a1 + 20) & 2) == 0)
    {
      uint64_t v26 = *(unsigned int *)(a1 + 8);
      if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v26 - 1) <= 9)
      {
        os_trace_blob_add_slow(a1, __src, 0xAuLL);
      }
      else
      {
        uint64_t v27 = *(void *)a1 + v26;
        *(void *)uint64_t v27 = *(void *)__src;
        *(_WORD *)(v27 + 8) = *(_WORD *)&__src[8];
        unsigned int v28 = *(_DWORD *)(a1 + 8) + 10;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v28) = 0;
        }
      }
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v12, v13, v14);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_darwin_errno(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, int *a5, uint64_t a6)
{
  BOOL is_integer = _os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 0);
  if (a6 == 4 && is_integer)
  {
    int v18 = *a5;
    if (*a5)
    {
      strerror(*a5);
      os_trace_blob_addf(a1, "[%d: %s]", v19, v20, v21, v22, v23, v24, v18);
    }
    else
    {
      os_trace_blob_addf(a1, "[%d: %s]", v12, v13, v14, v15, v16, v17, 0);
    }
  }
  else
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v15, v16, v17);
  }
  return 1;
}

uint64_t _os_log_fmt_builtin_bytes(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  return 1;
}

uint64_t _os_log_fmt_builtin_bitrate(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  return 1;
}

uint64_t _os_log_fmt_builtin_BOOL(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, unsigned __int8 *a5, uint64_t a6)
{
  if (!_os_log_fmt_spec_is_integer(*(unsigned char *)(a3 + 10), 1))
  {
    _os_log_fmt_decode_cmd_mismatch(a1, *(void *)a3, *(unsigned __int16 *)(a3 + 12), a4, a6, v11, v12, v13);
    return 1;
  }
  uint64_t scalar = os_log_fmt_read_scalar(a3, a5, a6);
  __int16 v15 = *(_WORD *)(a1 + 20);
  if (**(unsigned char **)(a3 + 40) == 66)
  {
    if (scalar) {
      uint64_t v16 = "YES";
    }
    else {
      uint64_t v16 = "NO";
    }
    if (scalar) {
      size_t v17 = 3;
    }
    else {
      size_t v17 = 2;
    }
    if ((v15 & 2) != 0) {
      return 1;
    }
LABEL_18:
    uint64_t v18 = *(unsigned int *)(a1 + 8);
    if (v17 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v18 - 1))
    {
      os_trace_blob_add_slow(a1, v16, v17);
    }
    else
    {
      memcpy((void *)(*(void *)a1 + v18), v16, v17);
      unsigned int v19 = *(_DWORD *)(a1 + 8) + v17;
      *(_DWORD *)(a1 + 8) = v19;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v19) = 0;
      }
    }
    return 1;
  }
  if (scalar) {
    uint64_t v16 = "true";
  }
  else {
    uint64_t v16 = "false";
  }
  if (scalar) {
    size_t v17 = 4;
  }
  else {
    size_t v17 = 5;
  }
  if ((v15 & 2) == 0) {
    goto LABEL_18;
  }
  return 1;
}

uint64_t _os_trace_intprefsdir_path()
{
  if (_os_trace_paths_init_once != -1) {
    dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
  }
  return _os_trace_internal_preferences_path;
}

void *_os_log_preferences_load_sysprefs(const char *a1, char *a2, int a3)
{
  uint64_t v10 = *MEMORY[0x1E4F14BF8];
  base_sysprefs_file = _os_log_preferences_load_base_sysprefs_file(__str, a1, a3);
  if ((MEMORY[0xFFFFFC104] & 0x80000000) == 0 && (MEMORY[0xFFFFFC104] & 0x10000000) != 0)
  {
    if (_os_trace_paths_init_once != -1) {
      dispatch_once(&_os_trace_paths_init_once, &__block_literal_global_209);
    }
    snprintf(__str, 0x400uLL, "%s/%s/%s.plist", (const char *)_os_trace_internal_preferences_path, "Subsystems", a1);
    uint64_t plist_at = _os_trace_read_plist_at(-2, __str);
    if (plist_at)
    {
      unint64_t v7 = plist_at;
      if (base_sysprefs_file)
      {
        _os_log_preferences_merge(base_sysprefs_file, plist_at, a2);
        xpc_release(v7);
      }
      else
      {
        return plist_at;
      }
    }
  }
  return base_sysprefs_file;
}

void *_os_log_preferences_copy_cache(void *a1)
{
  *a1 = 0;
  if (_os_trace != -1) {
    dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
  }
  if (dword_1EB1CF804 != -1) {
    _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
  }
  int v2 = dword_1EB1CF80C;
  if (dword_1EB1CF80C != dword_1EB1CF808)
  {
    int v8 = dword_1EB1CF80C;
    atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v8, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
    if (v8 == v2) {
      _os_log_preferences_refresh_process();
    }
  }
  if ((BYTE9(xmmword_1EB1CF7F0) & 1) != 0 || (MEMORY[0xFFFFFC104] & 0x100) != 0) {
    return 0;
  }
  os_unfair_lock_lock_with_options();
  if (byte_1EB1CF873) {
    goto LABEL_9;
  }
  if (dword_1EB1CF81C != dword_1EB1CF808) {
    _os_log_preference_load_cache();
  }
  uint64_t v4 = (const void *)*((void *)&xmmword_1EB1CF820 + 1);
  if (!*((void *)&xmmword_1EB1CF820 + 1))
  {
LABEL_9:
    int v3 = 0;
  }
  else
  {
    size_t v5 = xmmword_1EB1CF820;
    while (1)
    {
      int v6 = malloc_type_malloc(v5, 0x91D685AAuLL);
      if (v6) {
        break;
      }
      _os_trace_temporary_resource_shortage();
    }
    int v3 = v6;
    memcpy(v6, v4, v5);
    *a1 = xmmword_1EB1CF820;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_1EB1CF818);
  return v3;
}

BOOL _os_log_matches_filter(void *a1, uint64_t a2, uint64_t *a3)
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "logicalExp");
  if (!dictionary)
  {
    BOOL v11 = _os_log_simple_filter_subtype_matches_string(a1, "subsystem", *(void *)a2, (uint64_t)a3);
    BOOL v12 = _os_log_simple_filter_subtype_matches_string(a1, "category", *(void *)(a2 + 8), (uint64_t)a3);
    BOOL v13 = _os_log_simple_filter_subtype_matches_string(a1, "processImagePath", *(void *)(a2 + 16), (uint64_t)a3);
    BOOL v14 = _os_log_simple_filter_subtype_matches_string(a1, "process", *(void *)(a2 + 24), (uint64_t)a3);
    BOOL v15 = _os_log_simple_filter_subtype_matches_number(a1, "pid", *(int *)(a2 + 32), -1, (uint64_t)a3);
    return _os_log_simple_filter_subtype_matches_number(a1, "uid", *(unsigned int *)(a2 + 36), 0xFFFFFFFFLL, (uint64_t)a3)|| v15|| v14|| v13|| v12|| v11;
  }
  unint64_t v7 = dictionary;
  xpc_object_t array = xpc_dictionary_get_array(dictionary, "subfilters");
  if (!array) {
    return 0;
  }
  unint64_t v9 = array;
  if (object_getClass(array) != (Class)MEMORY[0x1E4F14D18] || !xpc_array_get_count(v9)) {
    return 0;
  }
  xpc_object_t value = xpc_dictionary_get_value(v7, "operator");
  if (!value)
  {
    uint64_t v19 = 2;
    goto LABEL_14;
  }
  int64_t v18 = xpc_int64_get_value(value);
  uint64_t v19 = v18;
  if ((unint64_t)(v18 - 1) >= 2)
  {
    if (!v18 && xpc_array_get_count(v9) == 1)
    {
      uint64_t v19 = 0;
      goto LABEL_14;
    }
    return 0;
  }
LABEL_14:
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2800000000;
  uint64_t v35 = 0;
  uint64_t v36 = 0;
  uint64_t v28 = 0;
  unint64_t v29 = &v28;
  uint64_t v30 = 0x2000000000;
  char v31 = 0;
  uint64_t v24 = 0;
  char v25 = &v24;
  uint64_t v26 = 0x2000000000;
  char v27 = 1;
  applier[0] = MEMORY[0x1E4F14BE8];
  applier[1] = 0x40000000;
  applier[2] = ___os_log_matches_logical_expression_filter_block_invoke;
  applier[3] = &unk_1E5984558;
  applier[4] = &v32;
  void applier[5] = &v28;
  applier[6] = &v24;
  applier[7] = a2;
  xpc_array_apply(v9, applier);
  uint64_t v20 = v33;
  uint64_t v21 = *a3;
  if ((unint64_t)(v19 - 1) >= 2)
  {
    *a3 = v33[4] | v21;
    a3[1] |= v20[3];
    BOOL v10 = *((unsigned char *)v29 + 24) == 0;
  }
  else
  {
    *a3 = v33[3] | v21;
    a3[1] |= v20[4];
    if (v19 == 2) {
      uint64_t v22 = v29;
    }
    else {
      uint64_t v22 = v25;
    }
    BOOL v10 = *((unsigned __int8 *)v22 + 24) != 0;
  }
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v10;
}

uint64_t ___os_log_matches_logical_expression_filter_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = _os_log_matches_filter(a3, *(void *)(a1 + 56), *(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v5 = 48;
  if (v4) {
    uint64_t v5 = 40;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + v5) + 8) + 24) = v4;
  return 1;
}

BOOL _os_log_simple_filter_subtype_matches_string(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return 0;
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, a2);
  if (!dictionary) {
    return 0;
  }
  uint64_t v10 = 0;
  BOOL v11 = &v10;
  uint64_t v12 = 0x2000000000;
  char v13 = 0;
  applier[0] = MEMORY[0x1E4F14BE8];
  applier[1] = 0x40000000;
  applier[2] = ___os_log_simple_filter_subtype_matches_string_block_invoke;
  applier[3] = &unk_1E5984580;
  applier[4] = &v10;
  void applier[5] = a3;
  applier[6] = a4;
  xpc_dictionary_apply(dictionary, applier);
  BOOL v7 = *((unsigned char *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

BOOL _os_log_simple_filter_subtype_matches_number(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a3 == a4) {
    return 0;
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, a2);
  if (!dictionary) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  applier[0] = MEMORY[0x1E4F14BE8];
  applier[1] = 0x40000000;
  applier[2] = ___os_log_simple_filter_subtype_matches_number_block_invoke;
  applier[3] = &unk_1E59845A8;
  applier[4] = &v11;
  void applier[5] = a3;
  applier[6] = a5;
  xpc_dictionary_apply(dictionary, applier);
  BOOL v8 = *((unsigned char *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

uint64_t ___os_log_simple_filter_subtype_matches_number_block_invoke(void *a1, const char *a2, xpc_object_t xint)
{
  int64_t value = xpc_int64_get_value(xint);
  uint64_t v6 = a1[5];
  if (v6 == strtoul(a2, 0, 10))
  {
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    BOOL v7 = (void *)a1[6];
  }
  else
  {
    BOOL v7 = (void *)(a1[6] + 8);
  }
  *v7 |= value;
  return 1;
}

uint64_t ___os_log_simple_filter_subtype_matches_string_block_invoke(void *a1, const char *a2, xpc_object_t xint)
{
  int64_t value = xpc_int64_get_value(xint);
  uint64_t v6 = (const char *)a1[5];
  if (value)
  {
    if (!strcasestr(v6, a2)) {
      goto LABEL_3;
    }
LABEL_5:
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
    BOOL v7 = (void *)a1[6];
    goto LABEL_6;
  }
  if (!strcmp(v6, a2)) {
    goto LABEL_5;
  }
LABEL_3:
  BOOL v7 = (void *)(a1[6] + 8);
LABEL_6:
  *v7 |= value;
  return 1;
}

uint64_t os_log_set_client_type(uint64_t a1)
{
  if (pthread_is_threaded_np())
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_9;
  }
  uint64_t result = _dispatch_is_multithreaded();
  if (result)
  {
LABEL_9:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_10;
  }
  if (_os_trace)
  {
LABEL_10:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  if (HIDWORD(xmmword_1EB1CF7F0))
  {
LABEL_11:
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
    return result;
  }
  if (a1 == 1) {
    byte_1EB1CF873 = 1;
  }
  return result;
}

os_log_t _os_log_create(void *dso, const char *subsystem, const char *category)
{
  return os_log_create(subsystem, category);
}

uint64_t os_log_errors_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t os_log_faults_count(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t os_log_get_type(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1);
}

BOOL os_log_is_debug_enabled(os_log_t log)
{
  return os_log_type_enabled(log, OS_LOG_TYPE_DEBUG);
}

BOOL os_log_is_enabled(os_log_t log)
{
  return 1;
}

const char *os_log_type_get_name(int a1)
{
  if (a1 <= 1)
  {
    if (!a1) {
      return "Default";
    }
    if (a1 == 1) {
      return "Info";
    }
  }
  else
  {
    switch(a1)
    {
      case 2:
        return "Debug";
      case 16:
        return "Error";
      case 17:
        return "Fault";
    }
  }
  uint64_t result = (const char *)_os_crash();
  __break(1u);
  return result;
}

char *os_log_copy_message_string(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F14BF8];
  int v1 = *(char **)(a1 + 88);
  int v2 = *(unsigned __int8 **)(a1 + 96);
  if (!v2)
  {
    if (v1)
    {
      BOOL v8 = *(const char **)(a1 + 88);
      return strdup(v8);
    }
LABEL_23:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_24;
  }
  unint64_t v3 = *(void *)(a1 + 104);
  if (v3 >= 0x10000)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v4 = *(void *)(a1 + 120);
  if (v4 >= 0x10000)
  {
LABEL_22:
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_23;
  }
  if ((unsigned __int16)*(void *)(a1 + 104))
  {
    if ((unsigned __int16)*(void *)(a1 + 104) == 1) {
      goto LABEL_24;
    }
    uint64_t v5 = (uint64_t)(v2 + 2);
    LOWORD(v3) = v3 - 2;
    if (v2[1])
    {
      int v6 = 0;
      while ((unsigned __int16)v3 >= 2u)
      {
        unint64_t v7 = *(unsigned __int8 *)(v5 + 1) + 2;
        if (v7 > (unsigned __int16)v3) {
          break;
        }
        v5 += v7;
        LOWORD(v3) = v3 - v7;
        if (v2[1] <= (unsigned __int16)++v6) {
          goto LABEL_17;
        }
      }
LABEL_24:
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
  }
  else
  {
    uint64_t v5 = 0;
    int v2 = (unsigned __int8 *)&os_log_fmt_extract_pubdata_empty_hdr;
  }
LABEL_17:
  void v11[2] = 0x10000;
  v11[0] = &v12;
  v11[1] = 0x40000000000;
  if (*(_DWORD *)(a1 + 80)) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 8;
  }
  os_log_fmt_compose((size_t)v11, v1, 2, 3u, v10, v2, v5, (unsigned __int16)v3, *(void *)(a1 + 112), v4);
  return (char *)os_trace_blob_detach((uint64_t)v11, 0);
}

void *os_log_copy_decorated_message(int a1, uint64_t a2)
{
  uint64_t v33 = *MEMORY[0x1E4F14BF8];
  *(void *)&v32[0].tm_mon = 0;
  *(void *)&v32[0].tm_sec = &v32[0].tm_wday;
  *(void *)&v32[0].unsigned int tm_hour = 0x40000000000;
  os_trace_blob_add_localtime(v32, *(void *)(a2 + 40), *(_DWORD *)(a2 + 48), 1u);
  char name = os_log_type_get_name(a1);
  os_trace_blob_addf((uint64_t)v32, " %s", v5, v6, v7, v8, v9, v10, name);
  LOBYTE(a1) = getprogname();
  getpid();
  os_trace_blob_addf((uint64_t)v32, " %s[%d:%llx]", v11, v12, v13, v14, v15, v16, a1);
  uint64_t v23 = *(void *)(a2 + 128);
  if (v23)
  {
    if (*(void *)(a2 + 136)
      || (os_trace_blob_addf((uint64_t)v32, "[%s]", v17, v18, v19, v20, v21, v22, *(void *)(a2 + 128)),
          (uint64_t v23 = *(void *)(a2 + 128)) != 0)
      && *(void *)(a2 + 136))
    {
      os_trace_blob_addf((uint64_t)v32, "[%s:%s]", v17, v18, v19, v20, v21, v22, v23);
    }
  }
  uint64_t v24 = os_log_copy_message_string(a2);
  os_trace_blob_addf((uint64_t)v32, " %s\n", v25, v26, v27, v28, v29, v30, (char)v24);
  free(v24);
  return os_trace_blob_detach((uint64_t)v32, 0);
}

uint64_t os_log_compare_enablement(uint64_t a1, uint64_t a2)
{
  enablement_int64_t value = _os_log_get_enablement_value(a1);
  return enablement_value - _os_log_get_enablement_value(a2);
}

uint64_t _os_log_get_enablement_value(uint64_t result)
{
  if ((int)result > 1)
  {
    switch(result)
    {
      case 2:
        return 0;
      case 0x10:
        return 3;
      case 0x11:
        return 4;
    }
LABEL_12:
    uint64_t result = _os_crash();
    __break(1u);
    return result;
  }
  if (!result) {
    return 2;
  }
  if (result != 1) {
    goto LABEL_12;
  }
  return result;
}

uint64_t os_log_set_hook(unsigned __int8 a1, void *aBlock)
{
  return _os_log_set_hook_impl(a1, 0, aBlock);
}

uint64_t _os_log_set_hook_impl(unsigned __int8 a1, unint64_t a2, void *aBlock)
{
  if (!aBlock)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v3 = aBlock;
  unint64_t v4 = a2;
  unsigned __int8 v5 = a1;
  if (_os_log_set_hook_impl_once != -1)
  {
LABEL_9:
    dispatch_once(&_os_log_set_hook_impl_once, &__block_literal_global_79);
    goto LABEL_3;
  }
  do
  {
LABEL_3:
    int v6 = _os_log_hook_level;
    if (_os_log_hook_level)
    {
      enablement_int64_t value = _os_log_get_enablement_value(_os_log_hook_level);
      if (enablement_value < _os_log_get_enablement_value(v5)) {
        unsigned __int8 v5 = v6;
      }
    }
    int v8 = v6;
    atomic_compare_exchange_strong_explicit(&_os_log_hook_level, (unsigned __int8 *)&v8, v5, memory_order_relaxed, memory_order_relaxed);
  }
  while (v8 != v6);
  atomic_fetch_or_explicit(&_os_log_hook_params, v4, memory_order_relaxed);
  return __swp(_Block_copy(v3), (unsigned int *)&_os_log_hook);
}

uint64_t ___os_log_set_hook_impl_block_invoke()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&_os_log_hook_thread_key, 0);
  if (result)
  {
    _os_assert_log();
    uint64_t result = _os_crash();
    __break(1u);
  }
  return result;
}

uint64_t os_log_set_fault_callback(uint64_t a1)
{
  if (a1) {
    return __swp(a1, (unsigned int *)&_os_log_current_fault_callback);
  }
  else {
    return _os_log_current_fault_callback;
  }
}

uint64_t os_log_set_test_callback(unsigned int a1)
{
  return __swp(a1, (unsigned int *)&_os_log_current_test_callback);
}

void _os_log_impl_stream(unint64_t *a1, uint64_t a2, unsigned int *a3, uint64_t a4, uint64_t *a5, uint64_t a6, char a7)
{
  uint64_t v14 = _os_trace_diagnosticd_pipe(0);
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *a5;
    if ((*(_WORD *)(*a5 + 20) & 2) == 0)
    {
      uint64_t v17 = (void **)a5[1];
      uint64_t v18 = *v17;
      size_t v19 = *((unsigned int *)v17 + 2);
      uint64_t v20 = *(unsigned int *)(v16 + 8);
      if (*(char *)(v16 + 22) + *(_DWORD *)(v16 + 12) - (int)v20 - 1 < v19)
      {
        os_trace_blob_add_slow(*a5, v18, v19);
      }
      else
      {
        memcpy((void *)(*(void *)v16 + v20), v18, v19);
        unsigned int v21 = *(_DWORD *)(v16 + 8) + v19;
        *(_DWORD *)(v16 + 8) = v21;
        if (!*(unsigned char *)(v16 + 22)) {
          *(unsigned char *)(*(void *)v16 + v21) = 0;
        }
      }
    }
    uint64_t v44 = 0;
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
    memset(&v33[4], 0, 48);
    if (a6 <= 6u && ((1 << a6) & 0x58) != 0) {
      unsigned int v22 = a6 << 8;
    }
    else {
      unsigned int v22 = bswap32(a6) >> 16;
    }
    unsigned int v31 = v22;
    *(void *)uint64_t v33 = 0;
    uint64_t v32 = 0;
    memset(&v33[12], 0, 32);
    unint64_t v23 = *a1;
    unint64_t v24 = a1[1];
    *(void *)&v33[44] = a6;
    long long v34 = v23;
    long long v35 = 0uLL;
    uint64_t v25 = (a1[2] / 0x3E8);
    *(void *)&long long v36 = v24;
    *((void *)&v36 + 1) = v25;
    long long v37 = 0uLL;
    DWORD2(v38) = 0;
    *(void *)&long long v38 = 0;
    *(void *)&long long v39 = a1[5];
    uint64_t v26 = *a5;
    *((void *)&v39 + 1) = *(void *)*a5;
    *(void *)&long long v40 = *(unsigned __int16 *)(v26 + 8);
    uint64_t v27 = (void *)a5[2];
    *((void *)&v40 + 1) = *v27;
    *(void *)&long long v41 = *((unsigned __int16 *)v27 + 4);
    if (a2)
    {
      uint64_t v28 = *(void *)(a2 + 24);
      uint64_t v29 = v28 + 4;
      if (!v28) {
        uint64_t v29 = 0;
      }
      *((void *)&v41 + 1) = v29;
      if (v28) {
        v28 += *(unsigned __int8 *)(v28 + 2) + 4;
      }
    }
    else
    {
      uint64_t v28 = 0;
    }
    *(void *)&long long v42 = v28;
    DWORD2(v42) = 0;
    BYTE12(v42) = a7;
    BYTE13(v42) = (a5[9] & 0x10000000) != 0;
    unint64_t v30 = a1[6];
    *(void *)&long long v43 = a1[7];
    *((void *)&v43 + 1) = v30;
    LOWORD(v44) = 0;
    uint64_t v45 = 0;
    _os_activity_stream_reflect((uint64_t)v15, (uint64_t)&v31, a1[3], -3, a3, a4);
    xpc_release(v15);
  }
}

char *_os_log_impl_mirror_to_stderr(char *result, uint64_t a2, int a3, uint64_t a4, char a5)
{
  int v8 = result;
  uint64_t v35 = *MEMORY[0x1E4F14BF8];
  int v9 = byte_1EB1CF86F;
  if (byte_1EB1CF86E) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = byte_1EB1CF86F == 0;
  }
  if (!v10)
  {
    if ((a3 & 0xFE) != 0x10 && (a5 & 0xE) != 2 && (*(_DWORD *)(a4 + 72) & 0x40000000) == 0)
    {
      if ((a5 & 6 | 8) == 0xC) {
        return result;
      }
      uint64_t v11 = (const char *)dyld_image_path_containing_address();
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t result = (char *)strncmp(v11, "/System/Developer/", 0x12uLL);
        if (!result) {
          return result;
        }
        uint64_t result = (char *)strncmp(v12, "/System/Library/", 0x10uLL);
        if (!result) {
          return result;
        }
        uint64_t result = (char *)strncmp(v12, "/usr/lib/", 9uLL);
        if (!result) {
          return result;
        }
      }
    }
    int v9 = byte_1EB1CF86F;
  }
  if (!a2
    || a3 != 17
    || !v9
    || (uint64_t v13 = *(void *)(a2 + 24)) == 0
    || strcmp((const char *)(v13 + 4), "com.apple.runtime-issues")
    && strcmp((const char *)(v13 + *(unsigned __int8 *)(v13 + 2) + 4), "RuntimeIssues")
    || (uint64_t result = strstr(*((char **)v8 + 5), "xcode:text-backtrace")) == 0)
  {
    time_t v14 = *((void *)v8 + 1);
    unint64_t v15 = *((void *)v8 + 2);
    *(void *)&v31.tm_mon = 0;
    *(void *)&v31.tm_sec = &v34;
    *(void *)&v31.unsigned int tm_hour = 0x10000000000;
    os_trace_blob_add_localtime(&v31, v14, v15 / 0x3E8, 1u);
    char v16 = getprogname();
    getpid();
    _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    os_trace_blob_addf((uint64_t)&v31, " %s[%d:%llu] ", v17, v18, v19, v20, v21, v22, v16);
    if (a2)
    {
      uint64_t v29 = *(void *)(a2 + 24);
      if (v29) {
        os_trace_blob_addf((uint64_t)&v31, "[%s] ", v23, v24, v25, v26, v27, v28, v29 + *(unsigned char *)(v29 + 2) + 4);
      }
    }
    uint64_t v30 = *(void *)(a4 + 24);
    if (!v30)
    {
      _os_log_impl_compose(*((char **)v8 + 5), a4);
      uint64_t v30 = *(void *)(a4 + 24);
    }
    *(void *)&v31.tm_wday = *(void *)&v31.tm_sec;
    *(void *)&v31.int tm_isdst = v31.tm_hour;
    v31.tm_gmtoff = *(void *)v30;
    v31.tm_zone = (char *)*(unsigned int *)(v30 + 8);
    uint64_t v32 = "\n";
    uint64_t v33 = 1;
    return (char *)_os_trace_writev(2, (iovec *)&v31.tm_wday, 3);
  }
  return result;
}

uint64_t _os_log_mirror_syslog(uint64_t result, uint64_t a2, double a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = 0;
  if ((*(unsigned char *)(a5 + 75) & 0x40) != 0) {
    return result;
  }
  uint64_t v7 = result;
  uint64_t result = asl_new_delayInitStub(a3);
  if (a2)
  {
    uint64_t v9 = *(void *)(a2 + 24);
    if (v9) {
      BOOL v10 = (const char *)(v9 + *(unsigned __int8 *)(v9 + 2) + 4);
    }
    else {
      BOOL v10 = 0;
    }
    if (!result) {
      return result;
    }
  }
  else
  {
    BOOL v10 = 0;
    if (!result) {
      return result;
    }
  }
  asl_set_delayInitStub(v8);
  uint64_t v12 = *(const char ***)(a5 + 24);
  if (!v12)
  {
    _os_log_impl_compose(*(char **)(v7 + 40), a5);
    uint64_t v12 = *(const char ***)(a5 + 24);
  }
  if (v10)
  {
    asprintf(&v17, "[%s] %s", v10, *v12);
    asl_set_delayInitStub(v13);
    free(v17);
  }
  else
  {
    asl_set_delayInitStub(v11);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_os_log_mirror_syslog_asl_lock);
  if (!*(void *)(a2 + 32))
  {
    *(void *)(a2 + 32) = asl_open_delayInitStub(v14);
    asl_set_filter_delayInitStub(v16);
  }
  asl_send_delayInitStub(v14);
  os_unfair_lock_unlock((os_unfair_lock_t)&_os_log_mirror_syslog_asl_lock);
  return asl_release_delayInitStub(v15);
}

uint64_t _os_log_impl_mirror_symptom(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (off_1EB1CF7E8)
  {
    uint64_t v5 = result;
    if (_os_log_impl_mirror_symptom_reporter
      || (uint64_t result = symptom_framework_init(), (_os_log_impl_mirror_symptom_reporter = result) != 0))
    {
      uint64_t result = symptom_new();
      if (result)
      {
        voucher_get_activity_id();
        if (a2)
        {
          uint64_t v6 = *(void *)(a2 + 24);
          if (v6) {
            a2 = v6 + *(unsigned __int8 *)(v6 + 2) + 4;
          }
          else {
            a2 = 0;
          }
        }
        if (!*(void *)(a3 + 24)) {
          _os_log_impl_compose(*(char **)(v5 + 40), a3);
        }
        symptom_set_qualifier();
        symptom_set_qualifier();
        symptom_set_qualifier();
        strlen((const char *)a2);
        symptom_set_additional_qualifier();
        symptom_set_additional_qualifier();
        symptom_set_additional_qualifier();
        if (_dyld_get_image_uuid()) {
          symptom_set_additional_qualifier();
        }
        symptom_set_additional_qualifier();
        return symptom_send();
      }
    }
  }
  return result;
}

void _os_log_impl_generate_crashlog(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(const char ***)(a3 + 24);
  if (!v5)
  {
    _os_log_impl_compose(*(char **)(a2 + 40), a3);
    uint64_t v5 = *(const char ***)(a3 + 24);
  }
  uint64_t v6 = *v5;
  size_t v7 = strlen(*v5);
  unint64_t v8 = v7 + 1;
  unint64_t v9 = *(void *)(a1 + 24);
  if (v9) {
    unint64_t v9 = *(unsigned __int8 *)(v9 + 3) + (unint64_t)*(unsigned __int8 *)(v9 + 2);
  }
  size_t v10 = v7 + v9 + 21;
  if (v10 >= 0x801 && v8 > 2028 - v9)
  {
    *(_DWORD *)&v6[-v9 + 2024] = 3026478;
    size_t v10 = 2048;
    unint64_t v8 = 2028 - v9;
  }
  while (1)
  {
    double v11 = (char *)malloc_type_malloc(v10, 0x91D685AAuLL);
    if (v11) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  uint64_t v12 = v11;
  *(_DWORD *)double v11 = 1;
  *(void *)(v11 + 12) = 0;
  *(void *)(v11 + 4) = 0;
  double v13 = v11 + 20;
  uint64_t v14 = *(void *)(a1 + 24);
  if (v14)
  {
    *((_DWORD *)v11 + 2) = 20;
    size_t v15 = *(unsigned __int8 *)(v14 + 2);
    if (strlcpy(v11 + 20, (const char *)(v14 + 4), v15) + 1 != v15)
    {
LABEL_19:
      _os_assert_log();
      _os_crash();
      __break(1u);
      goto LABEL_20;
    }
    double v16 = &v13[v15];
    v12[3] = v16 - v12;
    uint64_t v17 = *(void *)(a1 + 24);
    size_t v18 = *(unsigned __int8 *)(v17 + 3);
    if (strlcpy(v16, (const char *)(v17 + *(unsigned __int8 *)(v17 + 2) + 4), v18) + 1 != v18)
    {
LABEL_20:
      _os_assert_log();
      _os_crash();
      __break(1u);
      return;
    }
    double v13 = &v16[v18];
  }
  unsigned char v12[4] = v13 - v12;
  if (v8 != strlcpy(v13, **(const char ***)(a3 + 24), v10 - (v13 - v12)) + 1)
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_19;
  }
  os_fault_with_payload();

  free(v12);
}

void _os_log_unreliable_impl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a3 == 17)
  {
    qword_1E94500E8 = (uint64_t)"BUG IN CLIENT OF LIBTRACE: Calling the unreliable interfaces on a fault is not supported";
    __break(1u);
  }
  else
  {
    _os_log(a1, a2, a3, a4, a5, a6, v6);
  }
}

uint64_t os_set_logging_unreliable_for_current_thread()
{
  if (_init_unreliable_thread_key_unreliable_once != -1) {
    dispatch_once(&_init_unreliable_thread_key_unreliable_once, &__block_literal_global_82);
  }
  pthread_key_t v0 = _os_log_unreliable_thread_key;

  return pthread_setspecific(v0, (const void *)1);
}

uint64_t os_signpost_set_introspection_hook_4Perf(unsigned int a1)
{
  return __swp(a1, (unsigned int *)&_signpost_hook);
}

void _os_signpost_emit_impl(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  __os_signpost_emit_impl(a1, a2, a3, a4, 0, a5, a6, a7, v7);
}

void _os_log_internal(void *dso, os_log_t log, os_log_type_t type, const char *message, ...)
{
  va_start(va, message);
  uint64_t v22 = *MEMORY[0x1E4F14BF8];
  int v9 = *(unsigned __int16 *)__error();
  if (dyld_sdk_at_least() && log && log != (os_log_t)&_os_log_disabled)
  {
    os_log_type_t isa = (os_log_type_t)log[7].isa;
    if (isa == OS_LOG_TYPE_DEFAULT) {
      os_log_type_t isa = type;
    }
    uint64_t v11 = isa & 0x7F;
    if (os_log_type_enabled(log, (os_log_type_t)(isa & 0x7F)))
    {
      __int16 v20 = 0;
      va_copy(v19, va);
      uint64_t v18 = 0;
      long long v12 = 0u;
      uint64_t v13 = 0;
      uint64_t v14 = dso;
      uint64_t v15 = v4;
      double v16 = message;
      long long v17 = 0uLL;
      if (os_log_fmt_encode((char *)message, 2, v21, &v20, (int *)va))
      {
        _os_log_impl_flatten_and_send((uint64_t)&v12);
      }
      else
      {
        va_copy(v19, va);
        _os_log_impl_dynamic((uint64_t)&v12, (uint64_t)log, v11, 0, v9, va);
      }
    }
  }
}

char *os_log_pack_send_and_compose(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  char v7 = 0;
  uint64_t v4 = &v7;
  if (a4) {
    uint64_t v4 = a4;
  }
  uint64_t v6 = v4;
  _os_log_impl_flatten_and_send(a1);
  return v6;
}

char *os_log_pack_compose(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  char v7 = 0;
  uint64_t v4 = &v7;
  if (a4) {
    uint64_t v4 = a4;
  }
  uint64_t v6 = v4;
  _os_log_impl_flatten_and_send(a1);
  return v6;
}

int *os_log_with_args_find_first_non_jit_frame(void (**a1)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, va_list a6))
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  memset(v10, 0, sizeof(v10));
  int v2 = backtrace((void **)v10, 32);
  unint64_t v3 = &dword_19DC79000;
  uint64_t v4 = _os_log_impl_dynamic;
  if (v2 >= 1)
  {
    uint64_t v5 = 0;
    uint64_t v6 = v2;
    while (1)
    {
      char v7 = (int *)dyld_image_header_containing_address();
      if (v7 && v7 != &dword_19DC79000) {
        break;
      }
      ++v5;
      uint64_t v4 = _os_log_impl_dynamic;
      if (v6 == v5) {
        goto LABEL_9;
      }
    }
    uint64_t v4 = (void (*)(uint64_t, uint64_t, uint64_t, void *, int, va_list))*((void *)v10 + v5);
    unint64_t v3 = v7;
  }
LABEL_9:
  *a1 = v4;
  return v3;
}

image_offset **os_log_backtrace_create_from_current(uint64_t a1, void *a2)
{
  int v3 = a1;
  v10[1] = *MEMORY[0x1E4F14BF8];
  MEMORY[0x1F41887A8](a1);
  uint64_t v6 = (void **)((char *)v10 - v5);
  if (v4 >= 0x200) {
    size_t v7 = 512;
  }
  else {
    size_t v7 = v4;
  }
  bzero((char *)v10 - v5, v7);
  if (a2) {
    int v8 = backtrace_from_fp(a2, v6, v3);
  }
  else {
    int v8 = backtrace(v6, v3);
  }
  return os_log_backtrace_create_from_pcs(v6, v8);
}

void os_log_backtrace_destroy(void **a1)
{
  free(*a1);

  free(a1);
}

uint64_t os_log_backtrace_get_frames(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t os_log_backtrace_get_length(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

void *os_log_backtrace_copy_serialized_buffer(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F41887A8](a1);
  int v3 = v2;
  uint64_t v9 = *MEMORY[0x1E4F14BF8];
  uint64_t v7 = 0x1000000000000;
  v6[0] = &v8;
  v6[1] = (void *)0x100000000000;
  os_log_backtrace_serialize_to_blob(v1);
  unint64_t v4 = os_trace_blob_detach((uint64_t)v6, v3);
  if ((v7 & 0x100000000) != 0) {
    free(v6[0]);
  }
  return v4;
}

_DWORD *os_log_backtrace_create_from_buffer(void *a1, unint64_t *a2)
{
  unint64_t v2 = *a2;
  if (*a2 < 4) {
    return 0;
  }
  unint64_t v4 = (unsigned char *)*a1;
  if (*(unsigned char *)*a1 != 18) {
    return 0;
  }
  uint64_t v5 = *((unsigned __int16 *)v4 + 1);
  unint64_t v6 = (v5 & 3) != 0
     ? v5 + 16 * v4[1] + 4 * v5 + 4 - (v5 & 3) + 4
     : v5 + 16 * v4[1] + 4 * v5 + 4;
  BOOL v7 = v2 >= v6;
  unint64_t v8 = v2 - v6;
  if (!v7) {
    return 0;
  }
  unint64_t v21 = v8;
  while (1)
  {
    long long v12 = malloc_type_calloc(1uLL, 0x10uLL, 0x478C0A82uLL);
    if (v12) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  uint64_t v9 = v12;
  size_t v13 = 20 * *((unsigned __int16 *)v4 + 1);
  while (1)
  {
    uint64_t v14 = (char *)malloc_type_malloc(v13, 0x91D685AAuLL);
    if (v14) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  *(void *)uint64_t v9 = v14;
  uint64_t v15 = *((unsigned __int16 *)v4 + 1);
  void v9[2] = v15;
  if (v15)
  {
    unint64_t v16 = 0;
    uint64_t v17 = (uint64_t)&v4[16 * v4[1] + 4];
    uint64_t v18 = v17 + 4 * v15;
    uint64_t v19 = 16;
    do
    {
      uint64_t v20 = *(unsigned __int8 *)(v18 + v16);
      if (v20 == 255)
      {
        uuid_clear((unsigned __int8 *)&v14[v19 - 16]);
      }
      else
      {
        if (v20 >= v4[1])
        {
          free(v14);
          free(v9);
          return 0;
        }
        uuid_copy((unsigned __int8 *)&v14[v19 - 16], &v4[16 * v20 + 4]);
      }
      uint64_t v14 = *(char **)v9;
      *(_DWORD *)(*(void *)v9 + v19) = *(_DWORD *)(v17 + 4 * v16++);
      v19 += 20;
    }
    while (v16 < *((unsigned __int16 *)v4 + 1));
  }
  *a1 = &v4[v6];
  *a2 = v21;
  return v9;
}

uint64_t os_log_backtrace_print_to_blob(uint64_t result, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F14BF8];
  if (*(int *)(result + 8) >= 1)
  {
    uint64_t v3 = result;
    uint64_t v4 = 0;
    memset(out, 0, 37);
    uint64_t v5 = 16;
    do
    {
      uuid_unparse((const unsigned __int8 *)(*(void *)v3 + v5 - 16), out);
      uint64_t result = os_trace_blob_addf(a2, "%s +0x%x\n", v6, v7, v8, v9, v10, v11, (char)out);
      ++v4;
      v5 += 20;
    }
    while (v4 < *(int *)(v3 + 8));
  }
  return result;
}

void *os_log_backtrace_copy_description(uint64_t a1)
{
  uint64_t v1 = MEMORY[0x1F41887A8](a1);
  uint64_t v7 = *MEMORY[0x1E4F14BF8];
  uint64_t v5 = 0;
  v4[0] = &v6;
  v4[1] = (void *)0x100000000000;
  os_log_backtrace_print_to_blob(v1, (uint64_t)v4);
  unint64_t v2 = os_trace_blob_detach((uint64_t)v4, 0);
  if ((v5 & 0x100000000) != 0) {
    free(v4[0]);
  }
  return v2;
}

uint64_t _os_trace_temporary_resource_shortage()
{
  return sleep(1u);
}

int *_os_trace_undo_write(int a1, uint64_t a2, int a3)
{
  off_t v5 = lseek(a1, -a2, 1);
  if (v5 != -1) {
    ftruncate(a1, v5);
  }
  uint64_t result = __error();
  *uint64_t result = a3;
  return result;
}

void *_os_trace_mmap_offset(int a1, size_t a2, off_t a3)
{
  uint64_t result = mmap(0, a2, 1, 8194, a1, a3);
  if (result == (void *)-1) {
    return 0;
  }
  return result;
}

uint64_t _os_trace_get_times_now(void *a1, void *a2, _DWORD *a3)
{
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  time_t v13 = 0;
  uint64_t result = mach_get_times();
  if (result) {
    uint64_t result = _os_assumes_log();
  }
  uint64_t v7 = v14;
  *a1 = v15;
  time_t v8 = v13;
  *a2 = v7 + 1000000000 * v13;
  if (a3)
  {
    time_t v12 = v8;
    memset(&v11, 0, sizeof(v11));
    uint64_t result = (uint64_t)localtime_r(&v12, &v11);
    int tm_isdst = v11.tm_isdst;
    unint64_t v10 = ((unsigned __int128)(v11.tm_gmtoff * (__int128)0x7777777777777777) >> 64) - v11.tm_gmtoff;
    *a3 = (v10 >> 5) + (v10 >> 63) + 60 * v11.tm_isdst;
    a3[1] = tm_isdst;
  }
  return result;
}

void _os_trace_log_simple(char *a1, ...)
{
  va_start(va, a1);
  v1[0] = 0;
  va_copy((va_list)&v1[1], va);
  vasprintf((char **)v1, a1, va);
  _simple_asl_log();
  free(v1[0]);
}

char *_os_trace_strdup(char *__s1)
{
  while (1)
  {
    uint64_t result = strdup(__s1);
    if (result) {
      break;
    }
    _os_trace_temporary_resource_shortage();
  }
  return result;
}

intptr_t _os_state_request_for_pidlist(uint64_t a1, int a2)
{
  if (_os_state_request_for_pidlist_onceToken != -1) {
    dispatch_once(&_os_state_request_for_pidlist_onceToken, &__block_literal_global_393);
  }
  intptr_t result = dispatch_semaphore_wait((dispatch_semaphore_t)_os_state_request_for_pidlist_sema, 0);
  if (!result)
  {
    if (_os_trace != -1) {
      dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
    }
    if (dword_1EB1CF804 != -1) {
      _os_trace_prefs_and_mode_refresh_slow(dword_1EB1CF804);
    }
    int v5 = dword_1EB1CF80C;
    if (dword_1EB1CF80C != dword_1EB1CF808)
    {
      int v7 = dword_1EB1CF80C;
      atomic_compare_exchange_strong_explicit(&dword_1EB1CF80C, (unsigned int *)&v7, dword_1EB1CF808, memory_order_relaxed, memory_order_relaxed);
      if (v7 == v5) {
        _os_log_preferences_refresh_process();
      }
    }
    v8[0] = MEMORY[0x1E4F14BE8];
    v8[1] = 0x40000000;
    uint64_t v8[2] = ___os_state_request_for_pidlist_block_invoke_2;
    v8[3] = &__block_descriptor_tmp_3_394;
    int v9 = a2;
    v8[4] = a1;
    if (___os_state_request_for_pidlist_block_invoke_2) {
      char v6 = (void (*)(uint64_t))___os_state_request_for_pidlist_block_invoke_2;
    }
    else {
      char v6 = 0;
    }
    _os_activity_initiate_impl((unint64_t)&dword_19DC79000, (uint64_t)"System-wide statedump", 0, (uint64_t)v8, v6);
    return dispatch_semaphore_signal((dispatch_semaphore_t)_os_state_request_for_pidlist_sema);
  }
  return result;
}

uint64_t ___os_state_request_for_pidlist_block_invoke_2(uint64_t a1)
{
  uint64_t result = voucher_get_activity_id();
  if (*(_DWORD *)(a1 + 40))
  {
    uint64_t v3 = result;
    unint64_t v4 = 0;
    int v5 = (mach_port_name_t *)MEMORY[0x1E4F14C48];
    char v6 = (uint64_t *)MEMORY[0x1E4F14C30];
    uint64_t v7 = MEMORY[0x1E4F14C88];
    do
    {
      mach_port_name_t name = 0;
      uint64_t result = debug_control_port_for_pid(*v5, *(_DWORD *)(*(void *)(a1 + 32) + 4 * v4), &name);
      if (result) {
        BOOL v8 = 1;
      }
      else {
        BOOL v8 = name == 0;
      }
      if (!v8)
      {
        uint64_t v11 = *v6;
        uint64_t v12 = v3;
        *(void *)&msg.msgh_bits = 19;
        msg.msgh_voucher_port = 0;
        msg.mach_msg_id_t msgh_id = 50001;
        msg.mach_port_t msgh_remote_port = name;
        msg.msgh_local_port = 0;
        if (v7) {
          voucher_mach_msg_set(&msg);
        }
        if (mach_msg(&msg, 17, 0x28u, 0, 0, 0x32u, 0) == 268435460)
        {
          if ((msg.msgh_bits & 0x1F00) == 0x1100) {
            mach_port_deallocate(*v5, msg.msgh_local_port);
          }
          mach_msg_destroy(&msg);
        }
        uint64_t result = mach_port_deallocate(*v5, name);
      }
      ++v4;
    }
    while (v4 < *(unsigned int *)(a1 + 40));
  }
  return result;
}

dispatch_semaphore_t ___os_state_request_for_pidlist_block_invoke()
{
  dispatch_semaphore_t result = dispatch_semaphore_create(1);
  _os_state_request_for_pidlist_sema = (uint64_t)result;
  return result;
}

unsigned int os_activity_get_active(os_activity_id_t *entries, unsigned int *count)
{
  if (*count >= 2)
  {
    os_activity_id_t activity_id = voucher_get_activity_id();
    *entries = activity_id;
    if (entries[1]) {
      unsigned int result = (activity_id != 0) + 1;
    }
    else {
      unsigned int result = activity_id != 0;
    }
    goto LABEL_7;
  }
  if (*count == 1)
  {
    os_activity_id_t v6 = voucher_get_activity_id();
    *entries = v6;
    unsigned int result = v6 != 0;
LABEL_7:
    *count = result;
    return result;
  }
  return 0;
}

os_activity_t _os_activity_start(void *dso, const char *description, os_activity_flag_t flags)
{
  return 0;
}

uint64_t os_activity_diagnostic_for_pid()
{
  return 0;
}

uint64_t os_activity_for_task_thread()
{
  return 0;
}

uint64_t os_activity_for_thread()
{
  return 0;
}

uint64_t os_activity_messages_for_thread()
{
  return 0;
}

_DWORD *_XGetMode(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    uint64_t v5 = *MEMORY[0x1E4F14C30];
  }
  else
  {
    mach_port_t v3 = result[2];
    unint64_t v4 = (uint64_t *)MEMORY[0x1E4F14C30];
    uint64_t v7 = *MEMORY[0x1E4F14C30];
    int v8 = 0;
    int v9 = DWORD2(xmmword_1EB1CF7F0);
    uint64_t v10 = 0;
    *(void *)&v6.msgh_bits = 18;
    v6.mach_port_t msgh_remote_port = v3;
    v6.mach_msg_id_t msgh_id = 50102;
    *(void *)&v6.msgh_local_port = 0;
    if (MEMORY[0x1E4F14C88]) {
      voucher_mach_msg_set(&v6);
    }
    unsigned int result = (_DWORD *)mach_msg(&v6, 1, 0x30u, 0, 0, 0, 0);
    *(_DWORD *)(a2 + 32) = -305;
    uint64_t v5 = *v4;
  }
  *(void *)(a2 + 24) = v5;
  return result;
}

void _XStateDump(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14C30];
  }
  else
  {
    _os_state_request_for_self(*(void *)(a1 + 32), &ostracemig_do_StateDump_hints, 14, 0);
    *(_DWORD *)(a2 + 32) = 0;
  }
}

void _XChangeMode(_DWORD *a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  if ((*a1 & 0x80000000) != 0 || a1[1] != 44)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(void *)(a2 + 24) = *MEMORY[0x1E4F14C30];
  }
  else
  {
    if ((BYTE9(xmmword_1EB1CF7F0) & 1) == 0)
    {
      int v3 = a1[8];
      int v4 = a1[9];
      int v5 = a1[10];
      if ((MEMORY[0xFFFFFC104] & 0x100) == 0)
      {
        if (_os_trace != -1)
        {
          int v8 = a1[8];
          dispatch_once_f(&_os_trace, 0, (dispatch_function_t)_os_trace_init_slow);
          int v3 = v8;
        }
        int v6 = DWORD2(xmmword_1EB1CF7F0);
        int v7 = v3 & 0xFFFFFF;
        DWORD2(xmmword_1EB1CF7F0) = v3 & 0xFFFFFF;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v9[0] = 67109888;
          v9[1] = v6;
          __int16 v10 = 1024;
          int v11 = v7;
          __int16 v12 = 1024;
          int v13 = v4;
          __int16 v14 = 1024;
          int v15 = v5;
          _os_log_impl(&dword_19DC79000, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Change Mode: %{os_trace_procmode_t}d, Final: %{os_trace_procmode_t}d, Interval: %d, Filter: 0x%x", (uint8_t *)v9, 0x1Au);
        }
      }
    }
    *(_DWORD *)(a2 + 32) = 0;
  }
}

uint64_t (*libtraceMIG_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 50003) >= 0xFFFFFFFD) {
    return ostracemig_do_libtraceMIG_subsystem[5 * (v1 - 50000) + 5];
  }
  else {
    return 0;
  }
}

size_t _os_log_fmt_decode_error(size_t result)
{
  if ((*(_WORD *)(result + 20) & 2) == 0)
  {
    uint64_t v1 = *(unsigned int *)(result + 8);
    if ((*(char *)(result + 22) + *(_DWORD *)(result + 12) - v1 - 1) <= 0x15)
    {
      return os_trace_blob_add_slow(result, "<decode: missing data>", 0x16uLL);
    }
    else
    {
      qmemcpy((void *)(*(void *)result + v1), "<decode: missing data>", 22);
      unsigned int v2 = *(_DWORD *)(result + 8) + 22;
      *(_DWORD *)(result + 8) = v2;
      if (!*(unsigned char *)(result + 22)) {
        *(unsigned char *)(*(void *)result + v2) = 0;
      }
    }
  }
  return result;
}

uint64_t _os_log_fmt_decode_cmd_mismatch(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8 = a5;
  os_trace_blob_addf(a1, "<decode: mismatch for [%.*s] got [", a3, (uint64_t)a4, a5, a6, a7, a8, a3);
  unint64_t v17 = *a4;
  if (v17 > 0x4F)
  {
    os_trace_blob_addf(a1, "%d", v11, v12, v13, v14, v15, v16, *a4 >> 4);
  }
  else
  {
    uint64_t v18 = _cmd_type2str[v17 >> 4];
    unint64_t v19 = strlen(v18);
    if ((*(_WORD *)(a1 + 20) & 2) == 0)
    {
      int v26 = v19;
      uint64_t v27 = *(unsigned int *)(a1 + 8);
      if (v19 > (*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v27 - 1))
      {
        os_trace_blob_add_slow(a1, v18, v19);
      }
      else
      {
        memcpy((void *)(*(void *)a1 + v27), v18, v19);
        unsigned int v28 = *(_DWORD *)(a1 + 8) + v26;
        *(_DWORD *)(a1 + 8) = v28;
        if (!*(unsigned char *)(a1 + 22)) {
          *(unsigned char *)(*(void *)a1 + v28) = 0;
        }
      }
    }
  }
  if ((*a4 & 2) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v29 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v29 - 1) <= 6)
    {
      os_trace_blob_add_slow(a1, " public", 7uLL);
    }
    else
    {
      uint64_t v30 = (_DWORD *)(*(void *)a1 + v29);
      *(_DWORD *)((char *)v30 + 3) = 1667853410;
      *uint64_t v30 = 1651863584;
      unsigned int v31 = *(_DWORD *)(a1 + 8) + 7;
      *(_DWORD *)(a1 + 8) = v31;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v31) = 0;
      }
    }
  }
  if ((*a4 & 1) != 0 && (*(_WORD *)(a1 + 20) & 2) == 0)
  {
    uint64_t v32 = *(unsigned int *)(a1 + 8);
    if ((*(char *)(a1 + 22) + *(_DWORD *)(a1 + 12) - v32 - 1) <= 7)
    {
      os_trace_blob_add_slow(a1, " private", 8uLL);
    }
    else
    {
      *(void *)(*(void *)a1 + v32) = 0x6574617669727020;
      unsigned int v33 = *(_DWORD *)(a1 + 8) + 8;
      *(_DWORD *)(a1 + 8) = v33;
      if (!*(unsigned char *)(a1 + 22)) {
        *(unsigned char *)(*(void *)a1 + v33) = 0;
      }
    }
  }
  return os_trace_blob_addf(a1, " sz:%d]>", v20, v21, v22, v23, v24, v25, v8);
}

uint64_t _os_log_fmt_decode_bad_range(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: bad range for [%.*s] got [offs:%d len:%d within:%d]>", a3, a4, a5, a6, a7, a8, a3);
}

uint64_t _os_log_fmt_decode_masked_unknown(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a4 - 8) < 3) {
    return os_trace_blob_addf(a1, "<decode: mask \"%.*s\" is %s>", a3, a4, a5, a6, a7, a8, a2);
  }
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t _os_log_fmt_decode_give_up(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_trace_blob_addf(a1, "<decode: can't compose [%.*s]>", a3, a4, a5, a6, a7, a8, a3);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40CF6D8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return (mach_header_64 *)MEMORY[0x1F40CF708]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40CFD60]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1F40CF720](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1F40CF728]();
}

uint64_t __sandbox_ms()
{
  return MEMORY[0x1F40CFE08]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1F40CF740](a1, a2, *(void *)&a3, a4, a5);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1F40CF748](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1F40CF770]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1F40CF780](*(void *)&a1);
}

uint64_t __ulock_wait()
{
  return MEMORY[0x1F40CFE60]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x1F40CFE68]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1F40CF3E0]();
}

uint64_t _dyld_dlsym_blocked()
{
  return MEMORY[0x1F40CF598]();
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1F40CF5A0](*(void *)&image_index);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x1F40CF5A8](*(void *)&image_index);
}

uint64_t _dyld_get_image_slide()
{
  return MEMORY[0x1F40CF5B0]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1F40CF5B8]();
}

uint64_t _dyld_get_prog_image_header()
{
  return MEMORY[0x1F40CF5C0]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x1F40CF5C8]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1F40CF5D0]();
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1F40CF5D8]();
}

uint64_t _dyld_is_memory_immutable()
{
  return MEMORY[0x1F40CF5E8]();
}

void _dyld_register_func_for_add_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

void _dyld_register_func_for_remove_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1F40CF790]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1F40CF798]();
}

uint64_t _os_assumes_log_ctx()
{
  return MEMORY[0x1F40CF7A0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40CF7A8]();
}

uint64_t _os_object_alloc_realized()
{
  return MEMORY[0x1F40CF3E8]();
}

uint64_t _simple_asl_log()
{
  return MEMORY[0x1F40D0798]();
}

uint64_t _simple_sappend()
{
  return MEMORY[0x1F40D07D0]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CF7E0](a1, a2);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1F40CF7F0](a1, *(void *)&a2);
}

int backtrace_from_fp(void *startfp, void **array, int size)
{
  return MEMORY[0x1F40CF7F8](startfp, array, *(void *)&size);
}

void backtrace_image_offsets(void *const *array, image_offset *image_offsets, int size)
{
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1F40D0B48]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1F40D0B58](*(void *)&r);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1F40CF398]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1F40CF3A0]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1F40CF3A8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1F40CF3B0]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1F40CF3B8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1F40CF3D0]();
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1F4181530](cls);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1F4181548](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1F40CF818](*(void *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1F40CFEE8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CF820](a1);
}

char *__cdecl ctime_r(const time_t *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CF830](a1, a2);
}

kern_return_t debug_control_port_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return MEMORY[0x1F40CFF10](*(void *)&target_tport, *(void *)&pid, t);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_perform(dispatch_block_flags_t flags, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CF438](buffer, size, queue, destructor);
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1F40CF468]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CF480](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CF488](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CF490](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CF4B0](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CF4B8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CF4C0](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CF620](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CF628](__handle, __symbol);
}

int dup(int a1)
{
  return MEMORY[0x1F40CFF18](*(void *)&a1);
}

uint64_t dyld_image_header_containing_address()
{
  return MEMORY[0x1F40CF638]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1F40CF640]();
}

uint64_t dyld_sdk_at_least()
{
  return MEMORY[0x1F40CF658]();
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1F40CF660]();
}

DIR *__cdecl fdopendir(int a1)
{
  return (DIR *)MEMORY[0x1F40CF858](*(void *)&a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CFF60](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CF888](a1, a2);
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1F40CFFB0](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CF8B8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CFFE0]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40D0000]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CF8C8]();
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return (uint8_t *)MEMORY[0x1F40CF670](mhp, segname, size);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1F40CF8D0](a1, a2);
}

kern_return_t host_set_atm_diagnostic_flag(host_t host, uint32_t diagnostic_flag)
{
  return MEMORY[0x1F40D0070](*(void *)&host, *(void *)&diagnostic_flag);
}

int isatty(int a1)
{
  return MEMORY[0x1F40CF900](*(void *)&a1);
}

int issetugid(void)
{
  return MEMORY[0x1F40D0080]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1F40CF908](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1F40D00E8](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40D0118]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40D0120](*(void *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1F40D0168]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40D0170]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1F40D0180](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_construct(ipc_space_t task, mach_port_options_ptr_t options, mach_port_context_t context, mach_port_name_t *name)
{
  return MEMORY[0x1F40D01A0](*(void *)&task, options, context, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40D01A8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1F40D01F0](*(void *)&target, address, size, *(void *)&flags);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1F40D01F8](*(void *)&target, address, size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0670](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0678](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0688](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CF910](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CF918](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CF920](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1F40D02A8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40D02E0](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40D06B8](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1F40D06C0](*(void *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40D06E8](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40D06F0](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x1F4181690](cls, bytes);
}

void objc_end_catch(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

void objc_terminate(void)
{
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1F4181A58](a1);
}

BOOL object_isClass(id obj)
{
  return MEMORY[0x1F4181A88](obj);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return MEMORY[0x1F40D0320](*(void *)&a1, a2, *(void *)&a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CF950](a1);
}

uint64_t os_fault_with_payload()
{
  return MEMORY[0x1F40D0338]();
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return (void *)MEMORY[0x1F40CF510](object);
}

uint64_t os_simple_hash()
{
  return MEMORY[0x1F40CFC60]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40D0838]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_check()
{
  return MEMORY[0x1F40CFC68]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CFC78]();
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40D03A8](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1F40D03C0](*(void *)&pid, *(void *)&flavor, arg, buffer, *(void *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40D0970](a1);
}

int pthread_is_threaded_np(void)
{
  return MEMORY[0x1F40D0980]();
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40D0988](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40D0A10](a1, a2);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CF988](a1);
}

void rewinddir(DIR *a1)
{
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x1F4181B48](str);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1F40CF9D8](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CF9E8](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CFA00](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1F40CFA08](__big, __little);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CFA18](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CFA20](__s1, __s2);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CFA30](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CFA38](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CFA40](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CFA58](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CFA60](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1F40CFA68](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CFA70](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CFA80](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CFA88](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CFA90](__big, __little, __len);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CFA98](__s, *(void *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1F40CFAA0](__stringp, __delim);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1F40CFAA8](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CFAB0](__s1, __s2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CFAC8](__str, __endptr, *(void *)&__base);
}

uint64_t symptom_framework_init()
{
  return MEMORY[0x1F40D0A88]();
}

uint64_t symptom_new()
{
  return MEMORY[0x1F40D0A90]();
}

uint64_t symptom_send()
{
  return MEMORY[0x1F40D0A98]();
}

uint64_t symptom_set_additional_qualifier()
{
  return MEMORY[0x1F40D0AA0]();
}

uint64_t symptom_set_qualifier()
{
  return MEMORY[0x1F40D0AA8]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CFAE8](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CFAF0](a1, a2, a3, a4, a5);
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return MEMORY[0x1F40D04F8](*(void *)&task, *(void *)&which_port, *(void *)&special_port);
}

uint64_t thread_stack_async_pcs()
{
  return MEMORY[0x1F40CFAF8]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CFB08](a1);
}

void uuid_clear(uuid_t uu)
{
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1F40CFB30](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CFB40](uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1F40CFB60](a1, a2, a3);
}

uint64_t voucher_activity_create_with_data_2()
{
  return MEMORY[0x1F40CF518]();
}

uint64_t voucher_activity_flush()
{
  return MEMORY[0x1F40CF520]();
}

uint64_t voucher_activity_get_logging_preferences()
{
  return MEMORY[0x1F40CF528]();
}

uint64_t voucher_activity_get_metadata_buffer()
{
  return MEMORY[0x1F40CF530]();
}

uint64_t voucher_activity_should_send_strings()
{
  return MEMORY[0x1F40CF548]();
}

uint64_t voucher_activity_trace()
{
  return MEMORY[0x1F40CF550]();
}

uint64_t voucher_activity_trace_v_2()
{
  return MEMORY[0x1F40CF558]();
}

uint64_t voucher_adopt()
{
  return MEMORY[0x1F40CF560]();
}

uint64_t voucher_get_activity_id()
{
  return MEMORY[0x1F40CF570]();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1F40D0558](msg);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1F40CFB68](__str, __size, __format, a4);
}

size_t wcslen(const __int32 *a1)
{
  return MEMORY[0x1F40CFB78](a1);
}

size_t wcsnlen(const __int32 *a1, size_t a2)
{
  return MEMORY[0x1F40CFB80](a1, a2);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40D05F8](*(void *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1F40D0608](*(void *)&a1, a2, *(void *)&a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40D0B70](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40D0B78](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1F40D0B80](xarray);
}

void xpc_array_set_data(xpc_object_t xarray, size_t index, const void *bytes, size_t length)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1F40D0BB8](xBOOL);
}

uint64_t xpc_bundle_create_main()
{
  return MEMORY[0x1F40D0BC8]();
}

uint64_t xpc_bundle_get_info_dictionary()
{
  return MEMORY[0x1F40D0BD8]();
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40D0C48](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1F40D0C58]();
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1F40D0C60]();
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1F40D0C70](ddata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40D0C90](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40D0CA0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40D0CA8]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40D0CB8](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1F40D0CC8](xdict);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40D0CD8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40D0CE0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40D0CE8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40D0CF0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40D0D00](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  MEMORY[0x1F40D0D50](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40D0D70](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1F40D0D80](xint);
}

uint64_t xpc_pipe_create()
{
  return MEMORY[0x1F40D0D90]();
}

uint64_t xpc_pipe_invalidate()
{
  return MEMORY[0x1F40D0DA0]();
}

uint64_t xpc_pipe_routine()
{
  return MEMORY[0x1F40D0DA8]();
}

uint64_t xpc_pipe_simpleroutine()
{
  return MEMORY[0x1F40D0DB0]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40D0DC0](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40D0DE0](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40D0DF0](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1F40D0E18](xuuid);
}

uint64_t asl_new_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsystem_asl_dylib)) {
    dlopenHelper_libsystem_asl_dylib(a1);
  }
  return MEMORY[0x1F40CF690]();
}

uint64_t asl_set_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsystem_asl_dylib)) {
    dlopenHelper_libsystem_asl_dylib(a1);
  }
  return MEMORY[0x1F40CF6B8]();
}

uint64_t asl_send_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsystem_asl_dylib)) {
    dlopenHelper_libsystem_asl_dylib(a1);
  }
  return MEMORY[0x1F40CF6B0]();
}

uint64_t asl_release_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsystem_asl_dylib)) {
    dlopenHelper_libsystem_asl_dylib(a1);
  }
  return MEMORY[0x1F40CF6A8]();
}

uint64_t asl_open_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsystem_asl_dylib)) {
    dlopenHelper_libsystem_asl_dylib(a1);
  }
  return MEMORY[0x1F40CF6A0]();
}

uint64_t asl_set_filter_delayInitStub(double a1)
{
  if (!atomic_load(&dlopenHelperFlag_libsystem_asl_dylib)) {
    dlopenHelper_libsystem_asl_dylib(a1);
  }
  return MEMORY[0x1F40CF6C0]();
}

double __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> dlopenHelper_libsystem_asl_dylib(double a1)
{
  return a1;
}