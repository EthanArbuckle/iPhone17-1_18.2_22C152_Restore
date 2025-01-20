uint64_t dyld_program_sdk_at_least(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 600))(dyld4::gDyld, a1);
}

uint64_t _dyld_objc_class_count()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 816))();
}

uint64_t _dyld_find_protocol_conformance(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 832))(dyld4::gDyld, a1, a2, a3);
}

uint64_t dyld_get_active_platform()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 560))();
}

uint64_t _dyld_for_each_objc_class(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 720))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_find_protocol_conformance_on_disk(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 912))(dyld4::gDyld, a1, a2, a3, a4);
}

uint64_t _dyld_get_objc_selector(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 712))(dyld4::gDyld, a1);
}

uint64_t dyld4::LibSystemHelpers::os_unfair_recursive_lock_unlock(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40D0858](a2);
}

uint64_t _dyld_lookup_section_info(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 928))(dyld4::gDyld, a1, a2, a3);
}

uint64_t _dyld_is_objc_constant(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 744))(dyld4::gDyld, a1, a2);
}

uint64_t dyld4::LibSystemHelpers::os_unfair_recursive_lock_lock_with_options(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F40D0850](a2, a3);
}

uint64_t dyld_shared_cache_some_image_overridden()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 424))();
}

uint64_t _dyld_is_memory_immutable(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 520))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_for_each_objc_protocol(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 728))(dyld4::gDyld, a1, a2);
}

void *dyld4::LibSystemHelpers::pthread_getspecific(dyld4::LibSystemHelpers *this, pthread_key_t a2)
{
  return pthread_getspecific(a2);
}

uint64_t dyld4::LibSystemHelpers::version(dyld4::LibSystemHelpers *this)
{
  return 6;
}

__n128 tlv_get_addr(uint64_t a1, __n128 result)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!*(void *)((_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) & 0xFFFFFFFFFFFFFFF8) + 8 * v2))
  {
    __n128 v3 = result;
    instantiateTLVs_thunk(v2);
    return v3;
  }
  return result;
}

uint64_t instantiateTLVs_thunk(unsigned int a1)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)dyld4::gDyld + 8))(dyld4::gDyld, a1);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)(*(uint64_t (**)(uint64_t, void))(*(void *)dyld4::gDyld + 48))(dyld4::gDyld, *(void *)&image_index);
}

uint64_t dyld4::LibSystemHelpers::pthread_key_init_free(dyld4::LibSystemHelpers *this, uint64_t a2)
{
  return MEMORY[0x1F40D0990](a2, MEMORY[0x1E4F14C90]);
}

uint64_t _dyld_find_foreign_type_protocol_conformance(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 840))(dyld4::gDyld, a1, a2, a3);
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)(*(uint64_t (**)(uint64_t, void))(*(void *)dyld4::gDyld + 32))(dyld4::gDyld, *(void *)&image_index);
}

uint64_t dyld_image_header_containing_address(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 464))(dyld4::gDyld, a1);
}

uint64_t _dyld_process_info_create(RemoteBuffer *a1, uint64_t a2, unsigned int *a3)
{
  kern_return_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  mach_msg_type_number_t v12;
  integer_t v13[4];
  int v14;
  void v15[7];
  long long v16;
  int v17;
  int v18;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  int v21;
  int v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2000000000;
  v26 = 0;
  v22 = 0;
  if (a3) {
    v5 = a3;
  }
  else {
    v5 = (unsigned int *)&v22;
  }
  unsigned int *v5 = 0;
  task_info_outCnt = 5;
  v6 = task_info((task_name_t)a1, 0x11u, task_info_out, &task_info_outCnt);
  if (v6)
  {
    v7 = 0;
    v8 = v6 | 0xFF000000;
LABEL_6:
    unsigned int *v5 = v8;
    goto LABEL_14;
  }
  if (!*(void *)task_info_out)
  {
    v7 = 0;
    v8 = -33554427;
    goto LABEL_6;
  }
  v9 = MEMORY[0x1E4F14BE8];
  v10 = 10;
  do
  {
    v15[0] = v9;
    v15[1] = 0x40000000;
    v15[2] = ___dyld_process_info_create_block_invoke;
    v15[3] = &unk_1E5E6D198;
    v16 = *(_OWORD *)task_info_out;
    v17 = v21;
    v18 = (int)a1;
    v15[5] = a2;
    v15[6] = v5;
    v15[4] = &v23;
    withRemoteBuffer(a1, *(mach_vm_address_t *)task_info_out, *(mach_vm_size_t *)&task_info_out[2], 0, v5, (uint64_t)v15);
    if (!*v5) {
      break;
    }
    v12 = 5;
    if (!task_info((task_name_t)a1, 0x11u, v13, &v12))
    {
      *(_OWORD *)task_info_out = *(_OWORD *)v13;
      v21 = v14;
    }
    --v10;
  }
  while (v10);
  v7 = v24[3];
LABEL_14:
  _Block_object_dispose(&v23, 8);
  return v7;
}

uint64_t dyld_process_info_base::addDyldImage(dyld_process_info_base *this, RemoteBuffer *a2, mach_vm_address_t a3, mach_vm_address_t a4, const char *__s1)
{
  int v13 = 0;
  uint64_t v9 = *((void *)this + 7);
  *(void *)(v9 + 16) = a3;
  *(_DWORD *)(v9 + 32) = *((_DWORD *)this + 24);
  if (__s1)
  {
    v10 = dyld_process_info_base::addString(this, __s1, 0x400uLL);
    *(void *)(*((void *)this + 7) + 24) = v10;
  }
  else
  {
    v10 = (const char *)dyld_process_info_base::copyPath(this, a2, &v13, a4);
    *(void *)(*((void *)this + 7) + 24) = v10;
    uint64_t result = v13;
    if (v13) {
      return result;
    }
  }
  checkPath(v10, a4, -1);
  uint64_t result = dyld_process_info_base::addInfoFromRemoteLoadCommands(this, a2, a3);
  if (!result)
  {
    uint64_t v12 = *((void *)this + 7);
    *(_DWORD *)(v12 + 36) = *((_DWORD *)this + 24) - *(_DWORD *)(v12 + 32);
    *((void *)this + 7) = v12 + 40;
  }
  return result;
}

void ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_6418dyld_image_info_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!*(void *)(v4 + 176)
    || !*(void *)(qword_1EAE9C008 + 176)
    || *(unsigned char *)(v4 + 24)
    || *(unsigned char *)(qword_1EAE9C008 + 24)
    || (*(void *)(qword_1EAE9C008 + 160) == *(void *)(v4 + 160)
      ? (BOOL v5 = *(void *)(qword_1EAE9C008 + 168) == *(void *)(v4 + 168))
      : (BOOL v5 = 0),
        !v5))
  {
    BOOL v6 = 0;
LABEL_10:
    unsigned int v7 = *(_DWORD *)(a1 + 80) + 1;
    unsigned int v8 = v7;
    goto LABEL_11;
  }
  uint64_t v41 = *(void *)(qword_1EAE9C008 + 152);
  uint64_t v42 = *(void *)(v4 + 152);
  BOOL v6 = v41 == v42;
  v43 = *(DyldSharedCache **)(a1 + 48);
  if (v41 != v42 || v43 == 0) {
    goto LABEL_10;
  }
  BOOL v50 = 0;
  if (*(_DWORD *)(a1 + 80))
  {
    unint64_t v45 = 0;
    unsigned int v8 = 0;
    v46 = (DyldSharedCache **)(a2 + 8);
    do
    {
      v47 = *v46;
      v46 += 3;
      int v48 = !DyldSharedCache::inCache(v43, v47, 1, &v50);
      if (!v50) {
        int v48 = 1;
      }
      v8 += v48;
      ++v45;
      unint64_t v49 = *(unsigned int *)(a1 + 80);
    }
    while (v45 < v49);
    uint64_t v4 = *(void *)(a1 + 40);
    unsigned int v7 = v49 + 1;
  }
  else
  {
    unsigned int v8 = 0;
    unsigned int v7 = 1;
  }
  BOOL v6 = 1;
LABEL_11:
  uint64_t v9 = *(unsigned int *)(v4 + 324);
  uint64_t v10 = 56 * v9;
  BOOL v19 = v9 >= 0x2000;
  uint64_t v11 = 458752;
  if (!v19) {
    uint64_t v11 = v10;
  }
  uint64_t v12 = (v8 << 10) + 40 * v7 + 240 * v7 + v11 + 32960;
  int v13 = (dyld_process_info_base *)malloc_type_malloc(v12, 0xBA843F37uLL);
  if (!v13)
  {
    **(_DWORD **)(a1 + 56) = 3;
    uint64_t v38 = *(void *)(*(void *)(a1 + 32) + 8);
    v14 = *(dyld_process_info_base **)(v38 + 40);
    *(void *)(v38 + 40) = 0;
    if (!v14) {
      return;
    }
    goto LABEL_49;
  }
  v14 = v13;
  unint64_t v15 = 40 * v7;
  dyld_process_info_base::dyld_process_info_base(v13, *(_DWORD *)(*(void *)(a1 + 40) + 320), v7, *(_DWORD *)(*(void *)(a1 + 40) + 324), v12);
  unint64_t v18 = *(void *)(v17 + 32);
  if (v18 <= 0xBF)
  {
    BOOL v19 = v18 >= v15;
  }
  else
  {
    v18 -= 192;
    BOOL v19 = 1;
  }
  if (v19)
  {
    if (v18 < v15) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = 40 * v7;
    }
    *((void *)v14 + 4) = v18 - v20;
  }
  uint64_t v21 = 0;
  v22 = (char *)v14 + *((unsigned int *)v14 + 1);
  *(_OWORD *)v22 = *(_OWORD *)(*(void *)(a1 + 40) + 160);
  uint64_t v23 = *(void *)(a1 + 40);
  *((void *)v22 + 2) = *(void *)(v23 + 176);
  v22[25] = *(unsigned char *)(v23 + 24);
  v22[24] = 1;
  do
  {
    if (v22[v21]) {
      v22[24] = 0;
    }
    ++v21;
  }
  while (v21 != 16);
  v24 = (char *)v14 + *((unsigned int *)v14 + 2);
  *(_OWORD *)v24 = *(_OWORD *)(v23 + 352);
  uint64_t v25 = *(void *)(a1 + 40);
  *((void *)v24 + 2) = *(void *)(v25 + 344);
  v26 = (char *)v14 + *((unsigned int *)v14 + 3);
  *(void *)v26 = *(void *)(a1 + 64);
  uint64_t v27 = *(void *)(v25 + 112);
  *((_DWORD *)v26 + 2) = v7;
  *((_DWORD *)v26 + 3) = v27 + 1;
  v26[16] = 16;
  if (*(unsigned char *)(v25 + 25))
  {
    if (v27 == *(_DWORD *)(a1 + 80)) {
      char v28 = 48;
    }
    else {
      char v28 = 80;
    }
    v26[16] = v28;
    uint64_t v25 = *(void *)(a1 + 40);
  }
  if (*(void *)(v25 + 56))
  {
    if (*(void *)(v25 + 64)) {
      char v29 = 32;
    }
    else {
      char v29 = 96;
    }
    v26[16] = v29;
  }
  mach_vm_address_t v30 = *(void *)(v25 + 192);
  if (v30)
  {
    int v31 = dyld_process_info_base::addDyldImage(v14, (RemoteBuffer *)*(unsigned int *)(a1 + 84), *(void *)(v25 + 32), v30, 0);
    v32 = *(_DWORD **)(a1 + 56);
    _DWORD *v32 = v31;
    if (v31) {
      goto LABEL_45;
    }
  }
  if (*(_DWORD *)(a1 + 80))
  {
    uint64_t v33 = 0;
    v34 = (DyldSharedCache **)(a2 + 8);
    do
    {
      int v35 = dyld_process_info_base::addImage(v14, (RemoteBuffer *)*(unsigned int *)(a1 + 84), v6, *(DyldSharedCache **)(a1 + 48), v16, (mach_header *)*(v34 - 1), *v34, 0, v33);
      **(_DWORD **)(a1 + 56) = v35;
      if (v35) {
        goto LABEL_46;
      }
      v34 += 3;
    }
    while (++v33 < (unint64_t)*(unsigned int *)(a1 + 80));
  }
  if (*((void *)v14 + 13) < *((void *)v14 + 11))
  {
    v32 = *(_DWORD **)(a1 + 56);
LABEL_45:
    _DWORD *v32 = 5;
LABEL_46:
    uint64_t v36 = *(void *)(*(void *)(a1 + 32) + 8);
    v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = 0;
    if (v37) {
      free(v37);
    }
    goto LABEL_49;
  }
  uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 8);
  v40 = *(dyld_process_info_base **)(v39 + 40);
  *(void *)(v39 + 40) = v14;
  v14 = v40;
  if (v40) {
LABEL_49:
  }
    free(v14);
}

uint64_t dyld_process_info_base::addImage(dyld_process_info_base *this, RemoteBuffer *a2, int a3, DyldSharedCache *a4, unint64_t a5, mach_header *a6, DyldSharedCache *a7, const char *__s1, unsigned int a9)
{
  v14 = this;
  int v22 = 0;
  BOOL v21 = 0;
  uint64_t v15 = *((void *)this + 7);
  *(void *)(v15 + 16) = a6;
  *(_DWORD *)(v15 + 32) = *((_DWORD *)this + 24);
  if (__s1)
  {
    unint64_t v16 = __s1;
LABEL_3:
    uint64_t v17 = dyld_process_info_base::addString(this, v16, 0x400uLL);
LABEL_4:
    *(void *)(*((void *)v14 + 7) + 24) = v17;
    goto LABEL_5;
  }
  if (a4)
  {
    if (a3)
    {
      if (DyldSharedCache::inCache(a4, a7, 1, &v21))
      {
        uint64_t v17 = (const char *)a7;
        if (v21) {
          goto LABEL_4;
        }
      }
    }
  }
  if (!a7)
  {
    unint64_t v16 = "/<unknown>";
    this = v14;
    goto LABEL_3;
  }
  uint64_t v17 = (const char *)dyld_process_info_base::copyPath(v14, a2, &v22, (mach_vm_address_t)a7);
  *(void *)(*((void *)v14 + 7) + 24) = v17;
  uint64_t Commands = v22;
  if (v22) {
    return Commands;
  }
LABEL_5:
  checkPath(v17, (uint64_t)a7, a9);
  if (a4 && a3 && DyldSharedCache::inCache(a4, (DyldSharedCache *)a6, 0x8000, &v21))
  {
    dyld_process_info_base::addInfoFromLoadCommands((const char *)v14, a6);
    uint64_t Commands = v22;
LABEL_10:
    uint64_t v19 = *((void *)v14 + 7);
    *(_DWORD *)(v19 + 36) = *((_DWORD *)v14 + 24) - *(_DWORD *)(v19 + 32);
    *((void *)v14 + 7) = v19 + 40;
    return Commands;
  }
  uint64_t Commands = dyld_process_info_base::addInfoFromRemoteLoadCommands(v14, a2, (mach_vm_address_t)a6);
  if (!Commands) {
    goto LABEL_10;
  }
  return Commands;
}

BOOL DyldSharedCache::inCache(DyldSharedCache *this, DyldSharedCache *a2, uint64_t a3, BOOL *a4)
{
  if (a2 < this) {
    return 0;
  }
  int64_t v5 = a2 - this + *(void *)((char *)this + *((unsigned int *)this + 4));
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2000000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F14BE8];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK15DyldSharedCache7inCacheEPKvmRb_block_invoke;
  v7[3] = &unk_1E5E6CFC8;
  v7[4] = &v8;
  v7[5] = v5;
  v7[6] = a3;
  v7[7] = a4;
  DyldSharedCache::forEachRange((char *)this, (uint64_t)v7, 0);
  BOOL v4 = *((unsigned char *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v4;
}

void DyldSharedCache::forEachRange(char *a1, uint64_t a2, uint64_t a3)
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2000000000;
  int v5 = 0;
  v3[0] = MEMORY[0x1E4F14BE8];
  v3[1] = 0x40000000;
  v3[2] = ___ZNK15DyldSharedCache12forEachRangeEU13block_pointerFvPKcyyjyjjRbEU13block_pointerFvPKS_jE_block_invoke;
  v3[3] = &unk_1E5E6CFA0;
  v3[5] = a3;
  v3[6] = v4;
  v3[4] = a2;
  DyldSharedCache::forEachCache(a1, (uint64_t)v3);
  _Block_object_dispose(v4, 8);
}

const char *checkPath(const char *result, uint64_t a2, int a3)
{
  uint64_t v12 = *MEMORY[0x1E4F14BF8];
  if (*result != 47)
  {
    __n128 v3 = result;
    snprintf(sCrashReporterInfo, 0x1000uLL, "dyld: found non-UTF8 string on image[%d]: 0x%llx [ ", a3, a2);
    size_t v4 = strnlen(v3, 8uLL);
    if (v4)
    {
      size_t v5 = v4;
      do
      {
        unsigned int v7 = *(unsigned __int8 *)v3++;
        unsigned int v6 = v7;
        if (v7 >= 0xA0) {
          char v8 = 87;
        }
        else {
          char v8 = 48;
        }
        __source[0] = v8 + (v6 >> 4);
        unsigned int v9 = v6 & 0xF;
        if (v9 >= 0xA) {
          char v10 = 87;
        }
        else {
          char v10 = 48;
        }
        __source[1] = v10 + v9;
        __source[2] = 0;
        strlcat(sCrashReporterInfo, __source, 0x1000uLL);
        strlcat(sCrashReporterInfo, " ", 0x1000uLL);
        --v5;
      }
      while (v5);
    }
    uint64_t result = (const char *)strlcat(sCrashReporterInfo, " ]\n", 0x1000uLL);
    qword_1E9A22C98 = (uint64_t)sCrashReporterInfo;
  }
  return result;
}

const char *dyld_process_info_base::addInfoFromLoadCommands(const char *this, const mach_header *a2)
{
  uint64_t v3 = (uint64_t)this;
  if (a2->magic == -17958193)
  {
    uint64_t v4 = 32;
  }
  else
  {
    if (a2->magic != -17958194) {
      return this;
    }
    uint64_t v4 = 28;
  }
  if (a2->ncmds)
  {
    uint32_t v5 = 0;
    unsigned int v6 = (char *)a2 + v4;
    unsigned int v7 = (char *)a2 + v4 + a2->sizeofcmds;
    char v8 = (char *)a2 + v4;
    do
    {
      uint64_t v9 = *((unsigned int *)v8 + 1);
      char v10 = &v8[v9];
      BOOL v12 = v9 >= 8 && v10 <= v7 && v10 >= v6;
      if (!v12) {
        return this;
      }
      int v13 = *(_DWORD *)v8;
      if (*(_DWORD *)v8 == 1)
      {
        unint64_t v14 = *(void *)(v3 + 32);
        BOOL v12 = v14 >= 0x18;
        unint64_t v15 = v14 - 24;
        if (!v12) {
          return this;
        }
        *(void *)(v3 + 32) = v15;
        this = dyld_process_info_base::copySegmentName((dyld_process_info_base *)v3, v8 + 8);
        uint64_t v16 = *(void *)(v3 + 88);
        *(void *)uint64_t v16 = this;
        uint64_t v17 = *((void *)v8 + 3);
        *(void *)&long long v18 = v17;
        *((void *)&v18 + 1) = HIDWORD(v17);
        long long v19 = v18;
      }
      else
      {
        if (v13 != 25)
        {
          if (v13 == 27) {
            *(_OWORD *)*(void *)(v3 + 56) = *(_OWORD *)(v8 + 8);
          }
          goto LABEL_26;
        }
        unint64_t v20 = *(void *)(v3 + 32);
        BOOL v12 = v20 >= 0x18;
        unint64_t v21 = v20 - 24;
        if (!v12) {
          return this;
        }
        *(void *)(v3 + 32) = v21;
        this = dyld_process_info_base::copySegmentName((dyld_process_info_base *)v3, v8 + 8);
        uint64_t v16 = *(void *)(v3 + 88);
        *(void *)uint64_t v16 = this;
        long long v19 = *(_OWORD *)(v8 + 24);
      }
      *(_OWORD *)(v16 + 8) = v19;
      *(void *)(v3 + 88) = v16 + 24;
      ++*(_DWORD *)(v3 + 96);
LABEL_26:
      ++v5;
      char v8 = v10;
    }
    while (v5 < a2->ncmds);
  }
  return this;
}

const char *dyld_process_info_base::copySegmentName(dyld_process_info_base *this, const char *__s1)
{
  uint64_t v4 = "__TEXT";
  uint32_t v5 = off_1E5E6D148;
  do
  {
    if (!strcmp(__s1, v4)) {
      return v4;
    }
    unsigned int v6 = *v5++;
    uint64_t v4 = v6;
  }
  while (v6);

  return dyld_process_info_base::addString(this, __s1, 0x10uLL);
}

uint64_t DyldSharedCache::forEachCache(char *a1, uint64_t a2)
{
  char v10 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, char *))(a2 + 16))(a2, a1, &v10);
  if (!v10 && *((_DWORD *)a1 + 4) >= 0x18Du && *((_DWORD *)a1 + 99))
  {
    int v5 = 0;
    do
    {
      unsigned int v6 = &a1[*((unsigned int *)a1 + 98)];
      uint64_t v7 = (uint64_t)&v6[24 * v5 + 16];
      uint64_t v8 = (uint64_t)&v6[56 * v5 + 16];
      if (*((_DWORD *)a1 + 4) >= 0x1C9u) {
        uint64_t v9 = (void *)v8;
      }
      else {
        uint64_t v9 = (void *)v7;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, char *, char *))(a2 + 16))(a2, &a1[*v9], &v10);
      if (v10) {
        break;
      }
      ++v5;
    }
    while (v5 != *((_DWORD *)a1 + 99));
  }
  return result;
}

uint64_t ___ZNK15DyldSharedCache12forEachRangeEU13block_pointerFvPKcyyjyjjRbEU13block_pointerFvPKS_jE_block_invoke(void *a1, uint64_t a2, unsigned char *a3)
{
  v8[0] = MEMORY[0x1E4F14BE8];
  v8[1] = 0x40000000;
  v8[2] = ___ZNK15DyldSharedCache12forEachRangeEU13block_pointerFvPKcyyjyjjRbEU13block_pointerFvPKS_jE_block_invoke_2;
  v8[3] = &unk_1E5E6CF78;
  uint64_t v6 = a1[6];
  v8[4] = a1[4];
  v8[5] = v6;
  v8[6] = a2;
  v8[7] = a3;
  uint64_t result = DyldSharedCache::forEachRegion(a2, (uint64_t)v8);
  if (!*a3)
  {
    uint64_t result = a1[5];
    if (result) {
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, *(unsigned int *)(*(void *)(a1[6] + 8) + 24));
    }
    ++*(_DWORD *)(*(void *)(a1[6] + 8) + 24);
  }
  return result;
}

uint64_t DyldSharedCache::forEachRegion(uint64_t a1, uint64_t a2)
{
  uint64_t result = strncmp((const char *)a1, "dyld_v1", 7uLL);
  if (!result)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 16);
    if (v5 <= 0x400)
    {
      uint64_t v6 = *(unsigned int *)(a1 + 20);
      if (v6 <= 0x14)
      {
        if (v5 > 0x138)
        {
          if (v6)
          {
            uint64_t v10 = a1 + *(unsigned int *)(a1 + 312);
            unint64_t v11 = v10 + 56 * v6;
            unint64_t v12 = v10 + 56;
            do
            {
              char v13 = 0;
              uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void, void, void, void, char *))(a2 + 16))(a2, a1 + *(void *)(v12 - 40), *(void *)(v12 - 56), *(void *)(v12 - 48), *(unsigned int *)(v12 - 4), *(unsigned int *)(v12 - 8), *(void *)(v12 - 16), &v13);
              if (v13) {
                break;
              }
              BOOL v9 = v12 >= v11;
              v12 += 56;
            }
            while (!v9);
          }
        }
        else if (v6)
        {
          unint64_t v7 = a1 + v5 + 32 * v6;
          unint64_t v8 = v5 + a1 + 32;
          do
          {
            char v14 = 0;
            uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, void, void, void, void, char *))(a2 + 16))(a2, a1 + *(void *)(v8 - 16), *(void *)(v8 - 32), *(void *)(v8 - 24), *(unsigned int *)(v8 - 4), *(unsigned int *)(v8 - 8), 0, &v14);
            if (v14) {
              BOOL v9 = 1;
            }
            else {
              BOOL v9 = v8 >= v7;
            }
            v8 += 32;
          }
          while (!v9);
        }
      }
    }
  }
  return result;
}

uint64_t ___ZNK15DyldSharedCache12forEachRangeEU13block_pointerFvPKcyyjyjjRbEU13block_pointerFvPKS_jE_block_invoke_2(uint64_t a1, int a2, int a3, int a4, int a5, DyldSharedCache *this, char a7)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32));
}

uint64_t ___ZNK15DyldSharedCache7inCacheEPKvmRb_block_invoke(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, unsigned char *a9)
{
  unint64_t v9 = *(void *)(result + 40);
  if (v9 >= a3 && *(void *)(result + 48) + v9 < a4 + a3)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    **(unsigned char **)(result + 56) = (a8 & 2) == 0;
    *a9 = 1;
  }
  return result;
}

const char *DyldSharedCache::mappingName(DyldSharedCache *this, char a2)
{
  if ((this & 4) != 0)
  {
    if ((a2 & 8) != 0) {
      return "__TEXT_STUBS";
    }
    else {
      return "__TEXT";
    }
  }
  else
  {
    if ((this & 2) != 0)
    {
      uint64_t v2 = "__DATA_DIRTY";
      uint64_t v6 = "__TPRO_CONST";
      unint64_t v7 = "__DATA_CONST";
      if ((a2 & 4) == 0) {
        unint64_t v7 = "__DATA";
      }
      if ((a2 & 0x40) == 0) {
        uint64_t v6 = v7;
      }
      if ((a2 & 2) == 0) {
        uint64_t v2 = v6;
      }
      uint64_t v3 = "__AUTH_DIRTY";
      unint64_t v8 = "__AUTH_TPRO_CONST";
      unint64_t v9 = "__AUTH_CONST";
      if ((a2 & 4) == 0) {
        unint64_t v9 = "__AUTH";
      }
      if ((a2 & 0x40) == 0) {
        unint64_t v8 = v9;
      }
      if ((a2 & 2) == 0) {
        uint64_t v3 = v8;
      }
      BOOL v4 = (a2 & 1) == 0;
    }
    else
    {
      uint64_t v2 = "*unknown*";
      uint64_t v3 = "__READ_ONLY";
      if ((a2 & 0x20) == 0) {
        uint64_t v3 = "__LINKEDIT";
      }
      BOOL v4 = (this & 1) == 0;
    }
    if (v4) {
      return v2;
    }
    else {
      return v3;
    }
  }
}

const char *dyld_process_info_base::addString(dyld_process_info_base *this, const char *__s1, size_t __n)
{
  size_t v5 = strnlen(__s1, __n);
  size_t v6 = v5 + 1;
  unint64_t v7 = *((void *)this + 4);
  BOOL v8 = v7 >= v5 + 1;
  unint64_t v9 = v7 - (v5 + 1);
  if (!v8) {
    return "";
  }
  *((void *)this + 4) = v9;
  unint64_t v11 = (char *)(*((void *)this + 13) + ~v5);
  *((void *)this + 13) = v11;
  strlcpy(v11, __s1, v6);
  return (const char *)*((void *)this + 13);
}

uint64_t dyld_process_info_base::copyPath(dyld_process_info_base *this, RemoteBuffer *a2, int *a3, mach_vm_address_t a4)
{
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x2000000000;
  uint64_t v10 = "";
  v6[0] = MEMORY[0x1E4F14BE8];
  v6[1] = 0x40000000;
  v6[2] = ___ZN22dyld_process_info_base8copyPathEjPiy_block_invoke;
  v6[3] = &unk_1E5E6D0D8;
  v6[4] = &v7;
  v6[5] = this;
  withRemoteBuffer(a2, a4, 0x400uLL, 1, a3, (uint64_t)v6);
  uint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t dyld_process_info_base::addInfoFromRemoteLoadCommands(dyld_process_info_base *this, RemoteBuffer *a2, mach_vm_address_t a3)
{
  unsigned int v19 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000;
  uint64_t v18 = 0;
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F14BE8];
  v10[1] = 0x40000000;
  v10[2] = ___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke;
  v10[3] = &unk_1E5E6D100;
  v10[6] = this;
  v10[7] = a3;
  v10[4] = &v15;
  v10[5] = &v11;
  withRemoteBuffer(a2, a3, 0x1000uLL, 1, &v19, (uint64_t)v10);
  if (!*((unsigned char *)v12 + 24))
  {
    uint64_t v6 = v19;
    if (v19) {
      goto LABEL_4;
    }
    mach_vm_size_t v8 = v16[3];
    v9[0] = MEMORY[0x1E4F14BE8];
    v9[1] = 0x40000000;
    v9[2] = ___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke_2;
    v9[3] = &__block_descriptor_tmp_4_0;
    v9[4] = this;
    v9[5] = a3;
    withRemoteBuffer(a2, a3, v8, 0, &v19, (uint64_t)v9);
  }
  uint64_t v6 = v19;
LABEL_4:
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

void withRemoteBuffer(RemoteBuffer *a1, mach_vm_address_t a2, mach_vm_size_t a3, int a4, _DWORD *a5, uint64_t a6)
{
  RemoteBuffer::create(a1, a2, a3, a4, (uint64_t)v10);
  int v8 = v11;
  if (a5) {
    *a5 = v11;
  }
  uint64_t v9 = v10[0];
  if (v8)
  {
    if (!v10[0]) {
      return;
    }
  }
  else
  {
    (*(void (**)(uint64_t, void *, void *))(a6 + 16))(a6, v10[0], v10[1]);
    if (!v9) {
      return;
    }
  }

  free(v9);
}

unsigned char *RemoteBuffer::create@<X0>(RemoteBuffer *this@<X0>, mach_vm_address_t a2@<X1>, mach_vm_size_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  vm_map_read_t v8 = this;
  uint64_t result = RemoteBuffer::map((vm_map_read_t)this, a2, a3);
  if (v11)
  {
    if (!a4 || (uint64_t result = RemoteBuffer::map(v8, a2, 4096 - (a2 & 0xFFF)), v11))
    {
      *(void *)a5 = 0;
      *(void *)(a5 + 8) = 0;
      *(_DWORD *)(a5 + 16) = v11;
      return result;
    }
    *(void *)a5 = result;
    *(void *)(a5 + 8) = 4096 - (a2 & 0xFFF);
  }
  else
  {
    *(void *)a5 = result;
    *(void *)(a5 + 8) = a3;
  }
  *(_DWORD *)(a5 + 16) = 0;
  return result;
}

unsigned char *RemoteBuffer::map(vm_map_read_t src_task, mach_vm_address_t src_address, mach_vm_size_t a3)
{
  vm_prot_t cur_protection = 0;
  vm_prot_t v9 = 1;
  if (!a3) {
    return 0;
  }
  mach_vm_address_t target_address = 0;
  uint64_t v4 = (unsigned int *)MEMORY[0x1E4F14C48];
  if (mach_vm_remap_new(*MEMORY[0x1E4F14C48], &target_address, a3, 0, 97, src_task, src_address, 1, &cur_protection, &v9, 2u))
  {
    return 0;
  }
  uint64_t v6 = malloc_type_malloc(a3 + 1, 0x2363440CuLL);
  size_t v5 = v6;
  if (v6)
  {
    memcpy(v6, (const void *)target_address, a3);
    v5[a3] = 0;
  }
  MEMORY[0x1AD11BB30](*v4, target_address, a3);
  return v5;
}

const char *___ZN22dyld_process_info_base8copyPathEjPiy_block_invoke(uint64_t a1, const char *a2, size_t a3)
{
  uint64_t result = dyld_process_info_base::addString(*(dyld_process_info_base **)(a1 + 40), a2, a3);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

const char *___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke(const char *result, const mach_header *a2, unint64_t a3)
{
  if (a3 >= 0x1D)
  {
    uint64_t v3 = result;
    uint64_t result = (const char *)*((void *)result + 6);
    *(void *)(*(void *)(*((void *)v3 + 4) + 8) + 24) = a2->sizeofcmds + 28;
    if (*(void *)(*(void *)(*((void *)v3 + 4) + 8) + 24) <= a3)
    {
      uint64_t result = dyld_process_info_base::addInfoFromLoadCommands(result, a2);
      *(unsigned char *)(*(void *)(*((void *)v3 + 5) + 8) + 24) = 1;
    }
  }
  return result;
}

void ___dyld_process_info_create_block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 72)) {
    dyld_process_info_base::make<dyld_all_image_infos_64,dyld_image_info_64>((RemoteBuffer *)*(unsigned int *)(a1 + 76), a2, *(void *)(a1 + 40), *(int **)(a1 + 48), &v6);
  }
  else {
    dyld_process_info_base::make<dyld_all_image_infos_32,dyld_image_info_32>((RemoteBuffer *)*(unsigned int *)(a1 + 76), a2, *(void *)(a1 + 40), *(int **)(a1 + 48), &v6);
  }
  uint64_t v3 = v6;
  if (v6)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    size_t v5 = *(void **)(v4 + 24);
    if (v5)
    {
      free(v5);
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    }
    *(void *)(v4 + 24) = v3;
  }
}

const char *___ZN22dyld_process_info_base29addInfoFromRemoteLoadCommandsEjy_block_invoke_2(uint64_t a1, const mach_header *a2)
{
  return dyld_process_info_base::addInfoFromLoadCommands(*(const char **)(a1 + 32), a2);
}

void dyld_process_info_base::dyld_process_info_base(dyld_process_info_base *this, int a2, int a3, int a4, uint64_t a5)
{
  *(_OWORD *)this = xmmword_1ACF93B00;
  *((_DWORD *)this + 4) = 192;
  unsigned int v5 = 40 * a3 + 192;
  if ((40 * a3) >= 0xFFFFFF40) {
    dyld_process_info_base::dyld_process_info_base();
  }
  *((_DWORD *)this + 5) = v5;
  unsigned int v6 = v5 + 56 * a4;
  if (__CFADD__(v5, 56 * a4)) {
    dyld_process_info_base::dyld_process_info_base();
  }
  *((_DWORD *)this + 6) = v6;
  *((void *)this + 4) = a5;
  *((_DWORD *)this + 10) = a2;
  *((void *)this + 6) = (char *)this + 192;
  *((void *)this + 7) = (char *)this + 192;
  uint64_t v7 = (char *)this + v5;
  *((void *)this + 8) = v7;
  *((void *)this + 9) = v7;
  vm_map_read_t v8 = (char *)this + v6;
  *((void *)this + 10) = v8;
  *((void *)this + 11) = v8;
  *((_DWORD *)this + 24) = 0;
  *((void *)this + 13) = (char *)this + a5;
}

void dyld_process_info_base::make<dyld_all_image_infos_64,dyld_image_info_64>(RemoteBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, void *a5@<X8>)
{
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x3002000000;
  v37 = __Block_byref_object_copy__5;
  uint64_t v38 = __Block_byref_object_dispose__5;
  uint64_t v39 = 0;
  if (*(_DWORD *)a2 <= 0xEu)
  {
    int v7 = 5;
LABEL_3:
    *a4 = v7;
LABEL_4:
    *a5 = 0;
    goto LABEL_27;
  }
  unint64_t v10 = atomic_load((unint64_t *)(a2 + 184));
  if (v10
    && ((unint64_t v11 = atomic_load((unint64_t *)(a2 + 8))) != 0
     || (unint64_t v22 = *(void *)(a2 + 176)) == 0
     || *(void *)(a2 + 32) <= v22))
  {
    if (a3)
    {
      unint64_t v12 = atomic_load((unint64_t *)(a2 + 184));
      if (v12 == a3)
      {
        *a4 = 0;
        goto LABEL_4;
      }
    }
    unint64_t v13 = atomic_load((unint64_t *)(a2 + 184));
    mach_vm_address_t v14 = atomic_load((unint64_t *)(a2 + 8));
    if (!v14)
    {
      usleep(0xC350u);
      int v7 = 19;
      goto LABEL_3;
    }
    if (*(_DWORD *)(a2 + 4) >= 0x2000u) {
      int v15 = 0x2000;
    }
    else {
      int v15 = *(_DWORD *)(a2 + 4);
    }
    uint64_t v33 = 0;
    uint64_t shared_cache_range = _dyld_get_shared_cache_range((uint64_t)&v33);
    v30[0] = MEMORY[0x1E4F14BE8];
    uint64_t v17 = (char *)v33 + shared_cache_range;
    v30[1] = 0x40000000;
    v30[2] = ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_6418dyld_image_info_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke;
    v30[3] = &unk_1E5E6D260;
    if (!shared_cache_range) {
      uint64_t v17 = 0;
    }
    v30[6] = shared_cache_range;
    v30[7] = a4;
    v30[4] = &v34;
    v30[5] = a2;
    int v31 = v15;
    int v32 = (int)a1;
    v30[8] = v13;
    v30[9] = v17;
    withRemoteBuffer(a1, v14, (24 * v15), 0, a4, (uint64_t)v30);
    mach_vm_address_t v18 = atomic_load((unint64_t *)(a2 + 328));
    unsigned int v19 = v35;
    if (v18 && v35[5])
    {
      uint64_t v20 = *(unsigned int *)(a2 + 324);
      v28[0] = MEMORY[0x1E4F14BE8];
      v28[1] = 0x40000000;
      v28[2] = ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_6418dyld_image_info_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke_2;
      v28[3] = &unk_1E5E6D288;
      int v29 = v20;
      v28[4] = &v34;
      v28[5] = a4;
      withRemoteBuffer(a1, v18, 56 * v20, 0, a4, (uint64_t)v28);
      unsigned int v19 = v35;
    }
    uint64_t v21 = v19[5];
  }
  else
  {
    uint64_t v23 = atomic_load((unint64_t *)(a2 + 184));
    dyld_process_info_base::makeSuspended<dyld_all_image_infos_64>(a1, a2, v23, a4, (dyld_process_info_base **)&v33);
    v24 = v33;
    uint64_t v33 = 0;
    uint64_t v25 = (void *)v35[5];
    v35[5] = (uint64_t)v24;
    if (v25)
    {
      free(v25);
      v26 = v33;
      uint64_t v33 = 0;
      if (v26) {
        free(v26);
      }
    }
    unsigned int v19 = v35;
    uint64_t v21 = v35[5];
    if (!v21)
    {
      usleep(0xC350u);
      if (*a4) {
        goto LABEL_4;
      }
      int v7 = 6;
      goto LABEL_3;
    }
  }
  v19[5] = 0;
  *a5 = v21;
LABEL_27:
  _Block_object_dispose(&v34, 8);
  uint64_t v27 = v39;
  uint64_t v39 = 0;
  if (v27) {
    free(v27);
  }
}

uint64_t _dyld_get_shared_cache_range(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 536))(dyld4::gDyld, a1);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)(*(uint64_t (**)(uint64_t, void *, const char *))(*(void *)dyld4::gDyld + 136))(dyld4::gDyld, __handle, __symbol);
}

uint64_t _dyld_dlsym_blocked()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 992))();
}

uint64_t _dyld_find_foreign_type_protocol_conformance_on_disk(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 920))(dyld4::gDyld, a1, a2, a3, a4);
}

void dyld4::LibSystemHelpers::os_unfair_lock_unlock(dyld4::LibSystemHelpers *this, os_unfair_lock_t lock)
{
}

__n128 (*dyld4::LibSystemHelpers::getTLVGetAddrFunc(dyld4::LibSystemHelpers *this))(uint64_t a1, __n128 result)
{
  return tlv_get_addr;
}

uint32_t _dyld_image_count(void)
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 24))();
}

uint64_t dyld4::LibSystemHelpers::os_unfair_lock_lock_with_options(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F40D0838](a2, a3);
}

uint64_t dyld_image_path_containing_address(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 368))(dyld4::gDyld, a1);
}

uint64_t dyld_sdk_at_least(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 584))(dyld4::gDyld, a1, a2);
}

uint64_t dyld4::LibSystemHelpers::pthread_setspecific(dyld4::LibSystemHelpers *this, pthread_key_t a2, const void *a3)
{
  return pthread_setspecific(a2, a3);
}

void *dyld4::LibSystemHelpers::malloc(dyld4::LibSystemHelpers *this, size_t size)
{
  return malloc_type_malloc(size, 0xBCC707ACuLL);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)(*(uint64_t (**)(uint64_t, const char *, void))(*(void *)dyld4::gDyld + 112))(dyld4::gDyld, __path, *(void *)&__mode);
}

int dladdr(const void *a1, Dl_info *a2)
{
  return (*(uint64_t (**)(uint64_t, const void *, Dl_info *))(*(void *)dyld4::gDyld + 104))(dyld4::gDyld, a1, a2);
}

uint64_t dlopen_from(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 776))(dyld4::gDyld, a1, a2, a3);
}

uint64_t _dyld_get_prog_image_header()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 792))();
}

uint64_t _dyld_find_unwind_sections(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 376))(dyld4::gDyld, a1, a2);
}

BOOL _dyld_shared_cache_contains_path(const char *path)
{
  return (*(uint64_t (**)(uint64_t, const char *))(*(void *)dyld4::gDyld + 768))(dyld4::gDyld, path);
}

uint64_t dyld_program_minos_at_least(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 608))(dyld4::gDyld, a1);
}

uint64_t _dyld_get_image_uuid(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 504))(dyld4::gDyld, a1, a2);
}

uint64_t dyld_get_base_platform(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 568))(dyld4::gDyld, a1);
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return (*(uint64_t (**)(uint64_t, char *, uint32_t *))(*(void *)dyld4::gDyld + 88))(dyld4::gDyld, buf, bufsize);
}

uint64_t _dyld_get_shared_cache_uuid(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 512))(dyld4::gDyld, a1);
}

uint64_t _dyld_launch_mode()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 736))();
}

uint64_t dyld4::LibSystemHelpers::pthread_key_create_thread_exit(dyld4::LibSystemHelpers *this, pthread_key_t *a2)
{
  return pthread_key_create(a2, (void (__cdecl *)(void *))dyld4::finalizeListTLV_thunk);
}

uint64_t dyld4::LibSystemHelpers::pthread_key_create_free(dyld4::LibSystemHelpers *this, pthread_key_t *a2)
{
  return pthread_key_create(a2, MEMORY[0x1E4F14C90]);
}

uint64_t dyld_get_program_sdk_version()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 400))();
}

void dyld4::LibSystemHelpers::free(dyld4::LibSystemHelpers *this, void *a2)
{
}

uint64_t _dyld_get_image_slide(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 360))(dyld4::gDyld, a1);
}

uint64_t _dyld_register_for_bulk_image_loads(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 688))(dyld4::gDyld, a1);
}

uint64_t dyld_process_is_restricted()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 416))();
}

uint64_t _dyld_images_for_addresses(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 624))(dyld4::gDyld, a1, a2, a3);
}

uint64_t _dyld_has_preoptimized_swift_protocol_conformances(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 904))(dyld4::gDyld, a1);
}

BOOL dlopen_preflight(const char *__path)
{
  return (*(uint64_t (**)(uint64_t, const char *))(*(void *)dyld4::gDyld + 144))(dyld4::gDyld, __path);
}

uint64_t _dyld_initializer()
{
  return (*(uint64_t (**)(uint64_t, _UNKNOWN **))(*(void *)dyld4::gDyld + 16))(dyld4::gDyld, &sHelpers);
}

uint64_t _dyld_get_swift_prespecialized_data()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 1008))();
}

uint64_t _dyld_for_objc_header_opt_rw()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 976))();
}

uint64_t _dyld_for_objc_header_opt_ro()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 984))();
}

uint64_t _dyld_shared_cache_real_path(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 760))(dyld4::gDyld, a1);
}

uint64_t dyld_has_inserted_or_interposing_libraries()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 664))();
}

void _dyld_register_func_for_remove_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

void _dyld_register_func_for_add_image(void (__cdecl *func)(const mach_header *, intptr_t))
{
}

uint64_t _dyld_objc_register_callbacks(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 896))(dyld4::gDyld, a1);
}

uint64_t _dyld_swift_optimizations_version()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 848))();
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return (*(uint64_t (**)(uint64_t, const char *))(*(void *)dyld4::gDyld + 72))(dyld4::gDyld, libraryName);
}

uint64_t dyld_shared_cache_iterate_text(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 456))(dyld4::gDyld, a1, a2);
}

void _tlv_atexit(void (__cdecl *termFunc)(void *), void *objAddr)
{
}

uint64_t _tlv_exit()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 448))();
}

char *dlerror(void)
{
  return (char *)(*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 128))();
}

uint64_t dyld_get_program_sdk_version_token()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 1024))();
}

uint64_t _dyld_register_dlsym_notifier(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1000))(dyld4::gDyld, a1);
}

int32_t NSVersionOfRunTimeLibrary(const char *libraryName)
{
  return (*(uint64_t (**)(uint64_t, const char *))(*(void *)dyld4::gDyld + 80))(dyld4::gDyld, libraryName);
}

void _dyld_process_info_release(void *a1)
{
  if (atomic_fetch_add((atomic_uint *volatile)a1, 0xFFFFFFFF) == 1) {
    free(a1);
  }
}

__n128 _dyld_process_info_get_state(uint64_t a1, __n128 *a2)
{
  uint64_t v2 = (__n128 *)(a1 + *(unsigned int *)(a1 + 12));
  __n128 result = *v2;
  a2[1].n128_u64[0] = v2[1].n128_u64[0];
  *a2 = result;
  return result;
}

int dlclose(void *__handle)
{
  return (*(uint64_t (**)(uint64_t, void *))(*(void *)dyld4::gDyld + 120))(dyld4::gDyld, __handle);
}

intptr_t _dyld_get_image_vmaddr_slide(uint32_t image_index)
{
  return (*(uint64_t (**)(uint64_t, void))(*(void *)dyld4::gDyld + 40))(dyld4::gDyld, *(void *)&image_index);
}

char *dyld3::MachOFile::installName(dyld3::MachOFile *this)
{
  *(void *)uint64_t v2 = 0;
  uint64_t v3 = 0;
  if (dyld3::MachOFile::getDylibInstallName(this, (const char **)&v3, &v2[1], v2)) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t dyld3::MachOFile::getDylibInstallName(dyld3::MachOFile *this, const char **a2, unsigned int *a3, unsigned int *a4)
{
  Diagnostics::Diagnostics((Diagnostics *)v15);
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2000000000;
  char v14 = 0;
  v10[0] = MEMORY[0x1E4F14BE8];
  v10[1] = 0x40000000;
  v10[2] = ___ZNK5dyld39MachOFile19getDylibInstallNameEPPKcPjS4__block_invoke;
  v10[3] = &unk_1E5E6D448;
  v10[6] = a4;
  v10[7] = a2;
  v10[4] = &v11;
  v10[5] = a3;
  dyld3::MachOFile::forEachLoadCommand(this, (Diagnostics *)v15, (uint64_t)v10);
  Diagnostics::assertNoError((Diagnostics *)v15);
  uint64_t v8 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  mach_o::Error::~Error((mach_o::Error *)v15);
  return v8;
}

_DWORD *dyld3::MachOFile::forEachLoadCommand(_DWORD *result, Diagnostics *this, uint64_t a3)
{
  unsigned int v5 = result;
  int v6 = *result;
  if (*result == -17958193)
  {
    uint64_t v7 = 8;
  }
  else
  {
    if (v6 != -17958194)
    {
      if ((v6 & 0xFEFFFFFF) != 0xCEFAEDFE) {
        return (_DWORD *)Diagnostics::error(this, "file does not start with MH_MAGIC[_64]: 0x%08X 0x%08X");
      }
      return result;
    }
    uint64_t v7 = 7;
  }
  if (result[3] >= 0xDu) {
    return (_DWORD *)Diagnostics::error(this, "unknown mach-o filetype (%u)");
  }
  if (result[4])
  {
    unsigned int v8 = 0;
    vm_prot_t v9 = &result[v7];
    unint64_t v10 = (unint64_t)&result[v7] + result[5];
    unint64_t v11 = (unint64_t)&result[v7];
    while (1)
    {
      if (v11 > v10 - 8) {
        return (_DWORD *)Diagnostics::error(this, "malformed load command #%u of %u at %p with mh=%p, extends past sizeofcmds");
      }
      uint64_t v12 = *(unsigned int *)(v11 + 4);
      if (v12 <= 7) {
        return (_DWORD *)Diagnostics::error(this, "malformed load command #%u of %u at %p with mh=%p, size (0x%X) too small");
      }
      if ((v12 & 3) != 0) {
        break;
      }
      unint64_t v13 = v11 + v12;
      if (v11 + v12 > v10 || v13 < (unint64_t)v9) {
        return (_DWORD *)Diagnostics::error(this, "malformed load command #%u of %u at %p with mh=%p, size (0x%X) is too large, load commands end at %p");
      }
      __n128 result = (_DWORD *)(*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
      ++v8;
      unint64_t v11 = v13;
      if (v8 >= v5[4]) {
        return result;
      }
    }
    return (_DWORD *)Diagnostics::error(this, "malformed load command #%u of %u at %p with mh=%p, size (0x%X) not multiple of 4");
  }
  return result;
}

uint64_t ___ZNK5dyld39MachOFile19getDylibInstallNameEPPKcPjS4__block_invoke(uint64_t result, _DWORD *a2, unsigned char *a3)
{
  if ((*a2 | 2) == 0xF)
  {
    uint64_t v3 = *(_DWORD **)(result + 48);
    **(_DWORD **)(result + 40) = a2[5];
    *uint64_t v3 = a2[4];
    **(void **)(result + 56) = (char *)a2 + a2[2];
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

Diagnostics *Diagnostics::assertNoError(Diagnostics *this)
{
  if (*(void *)this) {
    Diagnostics::assertNoError(this);
  }
  return this;
}

void mach_o::Error::~Error(mach_o::Error *this)
{
  if (*(void *)this) {
    _simple_sfree();
  }
  *(void *)this = 0;
}

void Diagnostics::Diagnostics(Diagnostics *this)
{
  *(void *)this = 0;
}

uint64_t _dyld_process_info_for_each_image(uint64_t result, uint64_t a2)
{
  unint64_t v2 = *(void *)(result + 48);
  if (v2 < *(void *)(result + 56))
  {
    uint64_t v4 = result;
    do
    {
      __n128 result = (*(uint64_t (**)(uint64_t, void, unint64_t, void))(a2 + 16))(a2, *(void *)(v2 + 16), v2, *(void *)(v2 + 24));
      v2 += 40;
    }
    while (v2 < *(void *)(v4 + 56));
  }
  return result;
}

char *macho_dylib_install_name(_DWORD *a1, const void *a2)
{
  __n128 result = (char *)dyld3::MachOFile::isMachO(a1, a2);
  if (result)
  {
    return dyld3::MachOFile::installName((dyld3::MachOFile *)result);
  }
  return result;
}

_DWORD *dyld3::MachOFile::isMachO(_DWORD *this, const void *a2)
{
  if (*this >> 1 != 2138504551) {
    return 0;
  }
  return this;
}

uint64_t dyld_get_image_versions(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 616))(dyld4::gDyld, a1, a2);
}

__n128 dyld4::FileRecord::swap(dyld4::FileRecord *this, dyld4::FileRecord *a2)
{
  long long v4 = *(_OWORD *)((char *)this + 24);
  *(_OWORD *)((char *)this + 24) = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a2 + 24) = v4;
  uint64_t v5 = *((void *)this + 1);
  *((void *)this + 1) = *((void *)a2 + 1);
  *((void *)a2 + 1) = v5;
  uint64_t v6 = *((void *)this + 2);
  *((void *)this + 2) = *((void *)a2 + 2);
  *((void *)a2 + 2) = v6;
  uint64_t v7 = *((void *)this + 5);
  *((void *)this + 5) = 0;
  unsigned int v8 = (lsl::Allocator *)*((void *)a2 + 5);
  if (a2 == this)
  {
    *((void *)a2 + 5) = v7;
    if (v8) {
      lsl::Allocator::freeObject(v8, a2);
    }
  }
  else
  {
    *((void *)this + 5) = v8;
    *((void *)a2 + 5) = v7;
  }
  uint64_t v9 = *(void *)this;
  *(void *)this = *(void *)a2;
  *(void *)a2 = v9;
  __n128 result = *((__n128 *)a2 + 3);
  long long v11 = *((_OWORD *)this + 3);
  *((__n128 *)this + 3) = result;
  *((_OWORD *)a2 + 3) = v11;
  LODWORD(v9) = *((_DWORD *)this + 16);
  *((_DWORD *)this + 16) = *((_DWORD *)a2 + 16);
  *((_DWORD *)a2 + 16) = v9;
  LODWORD(v9) = *((_DWORD *)this + 17);
  *((_DWORD *)this + 17) = *((_DWORD *)a2 + 17);
  *((_DWORD *)a2 + 17) = v9;
  LOWORD(v9) = *((_WORD *)this + 36);
  *((_WORD *)this + 36) = *((_WORD *)a2 + 36);
  *((_WORD *)a2 + 36) = v9;
  LOBYTE(v9) = *((unsigned char *)this + 74);
  *((unsigned char *)this + 74) = *((unsigned char *)a2 + 74);
  *((unsigned char *)a2 + 74) = v9;
  return result;
}

BOOL mach_o::hasWarningHandler(mach_o *this)
{
  return mach_o::sHandler != 0;
}

uint64_t mach_o::warning(uint64_t this, const void *a2, const char *a3, ...)
{
  va_start(va, a3);
  if (mach_o::sHandler) {
    return mach_o::sHandler(this, a2, (uint64_t *)va);
  }
  return this;
}

int32_t *mach_o::Architecture::Architecture(int32_t *this, const mach_header *a2)
{
  int32_t cputype = a2->cputype;
  int32_t cpusubtype = a2->cpusubtype;
  uint32_t magic = a2->magic;
  *this = cputype;
  this[1] = cpusubtype;
  if ((magic | 0x1000000) == 0xCFFAEDFE)
  {
    *this = bswap32(cputype);
    this[1] = bswap32(cpusubtype);
  }
  return this;
}

const char *mach_o::Architecture::name(mach_o::Architecture *this)
{
  int v1 = *(_DWORD *)this;
  if (*(int *)this <= 16777222)
  {
    if (v1 == 7)
    {
      if ((*((_DWORD *)this + 1) & 0xFFFFFF) == 3) {
        return "i386";
      }
    }
    else if (v1 == 12)
    {
      uint64_t v5 = (*((_DWORD *)this + 1) & 0xFFFFFF) - 9;
      if (v5 < 8) {
        return off_1E5E6C2A0[v5];
      }
    }
    else if (v1 == 18 && (*((_DWORD *)this + 1) & 0xFFFFFF) == 0)
    {
      return "ppc";
    }
    return "unknown";
  }
  if (v1 == 33554444)
  {
    if ((*((_DWORD *)this + 1) & 0xFFFFFE) == 0) {
      return "arm64_32";
    }
    return "unknown";
  }
  if (v1 == 16777228)
  {
    int v6 = *((_DWORD *)this + 1);
    if (v6 == -2147483646) {
      return "arm64e";
    }
    if (!v6) {
      return "arm64";
    }
    if ((v6 & 0xFFFFFF) != 2)
    {
      if ((v6 & 0xFFFFFF) != 1 || v6 != 1) {
        return "unknown";
      }
      return "arm64";
    }
    switch(v6)
    {
      case -2130706430:
        return "arm64e.v1";
      case -1073741822:
        return "arm64e.kernel";
      case 2:
        return "arm64e.old";
    }
    return "unknown";
  }
  if (v1 != 16777223) {
    return "unknown";
  }
  int v3 = *((_DWORD *)this + 1) & 0xFFFFFF;
  long long v4 = "unknown";
  if (v3 == 8) {
    long long v4 = "x86_64h";
  }
  if (v3 == 3) {
    return "x86_64";
  }
  else {
    return v4;
  }
}

uint64_t (****mach_o::Platform::Platform(uint64_t (****this)(mach_o::PlatformInfo_macOS *__hidden this, unsigned __int16, BOOL), int a2))(mach_o::PlatformInfo_macOS *__hidden this, unsigned __int16, BOOL)
{
  uint64_t v2 = 0;
  *this = 0;
  while (1)
  {
    int v3 = mach_o::PlatformInfo::knownPlatformInfos[v2];
    int v4 = *((_DWORD *)v3 + 2);
    if (!v4) {
      mach_o::Platform::Platform();
    }
    if (v4 == a2) {
      break;
    }
    if (++v2 == 31) {
      return this;
    }
  }
  *this = v3;
  return this;
}

mach_o::Error *mach_o::Platform::valid@<X0>(mach_o::Error *this@<X0>, mach_o::Error *a2@<X8>)
{
  if (!*(void *)this) {
    return mach_o::Error::Error(a2, "unknown platform");
  }
  *(void *)a2 = 0;
  return this;
}

BOOL mach_o::Platform::isExclaveKit(mach_o::Platform *this)
{
  return *(void *)this && *(unsigned char *)(*(void *)this + 50) != 0;
}

uint64_t mach_o::Platform::epoch(uint64_t *a1, unsigned int a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = 5;
  if (v2)
  {
    unsigned __int16 v7 = 0;
    char v6 = 0;
    (*(void (**)(uint64_t, void, unsigned __int16 *, char *))(*(void *)v2 + 8))(v2, a2, &v7, &v6);
    if (v6) {
      int v4 = 0;
    }
    else {
      int v4 = 5;
    }
    return v4 + 10 * v7;
  }
  return v3;
}

void mach_o::PlatformAndVersions::zip(uint64_t *a1@<X0>, uint64_t *a2@<X1>, mach_o::Error *a3@<X8>)
{
  if (!*a1)
  {
    *a1 = *a2;
LABEL_11:
    long long v8 = *(_OWORD *)(a2 + 1);
LABEL_12:
    *(_OWORD *)(a1 + 1) = v8;
LABEL_13:
    *(void *)a3 = 0;
    return;
  }
  if (*a2)
  {
    uint64_t v12 = 0;
  }
  else
  {
    mach_o::Error::Error((mach_o::Error *)&v12, "unknown platform");
    if (v12)
    {
      mach_o::Error::Error(a3, "can't zip with invalid platform");
      mach_o::Error::~Error((mach_o::Error *)&v12);
      return;
    }
  }
  mach_o::Error::~Error((mach_o::Error *)&v12);
  uint64_t v6 = *a1;
  uint64_t v7 = *a2;
  if (*a1 == *a2) {
    goto LABEL_11;
  }
  if ((uint64_t (***)(mach_o::PlatformInfo_macOS *__hidden, unsigned __int16, BOOL))v6 == &mach_o::PlatformInfo_macOS::singleton)
  {
    if ((uint64_t (***)(mach_o::PlatformInfo *__hidden, unsigned __int16, BOOL))v7 == &mach_o::PlatformInfo_macCatalyst::singleton)
    {
      *a1 = (uint64_t)&mach_o::PlatformInfo_zippered::singleton;
      goto LABEL_18;
    }
    goto LABEL_22;
  }
  if ((uint64_t (***)(mach_o::PlatformInfo_macOS *__hidden, unsigned __int16, BOOL))v7 != &mach_o::PlatformInfo_macOS::singleton)
  {
    if ((uint64_t (***)(mach_o::PlatformInfo_macOS *__hidden, unsigned __int16, BOOL))v6 == &mach_o::PlatformInfo_zippered::singleton)
    {
      if ((uint64_t (***)(mach_o::PlatformInfo *__hidden, unsigned __int16, BOOL))v7 == &mach_o::PlatformInfo_macCatalyst::singleton)
      {
        *a1 = (uint64_t)&mach_o::PlatformInfo_zippered::singleton;
LABEL_18:
        a1[2] = a2[1];
        goto LABEL_13;
      }
      goto LABEL_22;
    }
    goto LABEL_21;
  }
  if ((uint64_t (***)(mach_o::PlatformInfo *__hidden, unsigned __int16, BOOL))v6 == &mach_o::PlatformInfo_macCatalyst::singleton)
  {
    long long v8 = *(_OWORD *)(a2 + 1);
    uint64_t v11 = a1[1];
    *a1 = (uint64_t)&mach_o::PlatformInfo_zippered::singleton;
LABEL_30:
    *((void *)&v8 + 1) = v11;
    goto LABEL_12;
  }
  if ((uint64_t (***)(mach_o::PlatformInfo_macOS *__hidden, unsigned __int16, BOOL))v6 == &mach_o::PlatformInfo_zippered::singleton)
  {
    long long v8 = *(_OWORD *)(a2 + 1);
    uint64_t v11 = a1[2];
    *a1 = (uint64_t)&mach_o::PlatformInfo_zippered::singleton;
    goto LABEL_30;
  }
LABEL_21:
  if (!v6)
  {
    uint64_t v9 = "unknown";
    if (v7) {
      goto LABEL_23;
    }
LABEL_25:
    unint64_t v10 = "unknown";
    goto LABEL_26;
  }
LABEL_22:
  uint64_t v9 = *(const char **)(v6 + 16);
  if (!v7) {
    goto LABEL_25;
  }
LABEL_23:
  unint64_t v10 = *(const char **)(v7 + 16);
LABEL_26:
  mach_o::Error::Error(a3, "incompatible platforms: %s - %s", v9, v10);
}

uint64_t mach_o::PlatformAndVersions::unzip(void *a1, uint64_t a2)
{
  if ((uint64_t (***)(mach_o::PlatformInfo_macOS *__hidden, unsigned __int16, BOOL))*a1 == &mach_o::PlatformInfo_zippered::singleton)
  {
    v6[0] = &mach_o::PlatformInfo_macOS::singleton;
    v6[1] = a1[1];
    v6[2] = 0x1000000010000;
    (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v6);
    v5[0] = &mach_o::PlatformInfo_macCatalyst::singleton;
    v5[1] = a1[2];
    v5[2] = 0x1000000010000;
    return (*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v5);
  }
  else
  {
    uint64_t v7 = (uint64_t (***)(mach_o::PlatformInfo_macOS *__hidden, unsigned __int16, BOOL))*a1;
    long long v8 = *(_OWORD *)(a1 + 1);
    return (*(uint64_t (**)(uint64_t, uint64_t (****)(mach_o::PlatformInfo_macOS *__hidden, unsigned __int16, BOOL)))(a2 + 16))(a2, &v7);
  }
}

uint64_t mach_o::PlatformInfo_macOS::versionForYear(mach_o::PlatformInfo_macOS *this, unsigned int a2, int a3)
{
  if (a2 == 2020) {
    char v3 = a3;
  }
  else {
    char v3 = 1;
  }
  if (a2 <= 0x7E4 && (v3 & 1) != 0)
  {
    if (a3) {
      int v4 = 655364;
    }
    else {
      int v4 = 655360;
    }
    return ((((_WORD)a2 - (_WORD)a3) << 8) + 11264) & 0xFF00 | v4;
  }
  else
  {
    unsigned int v6 = a2 - *((unsigned __int16 *)this + 27);
    if (a3) {
      int v7 = (*(unsigned __int8 (**)(mach_o::PlatformInfo_macOS *, void))(*(void *)this + 16))(this, (unsigned __int16)--v6) << 8;
    }
    else {
      int v7 = 0;
    }
    return v7 | (v6 << 16);
  }
}

_WORD *mach_o::PlatformInfo_macOS::yearForVersion(_WORD *result, unsigned int a2, _WORD *a3, BOOL *a4)
{
  if (a2 >= 0xB0000) {
    return (_WORD *)mach_o::PlatformInfo::yearForMajorVersion(result, a2, a3, a4);
  }
  unsigned int v4 = (a2 + 16121856) >> 8;
  *a3 = v4 + 2004;
  *a4 = (a2 & 0xFC) != 0;
  if ((a2 & 0xFC) != 0) {
    *a3 = v4 + 2003;
  }
  return result;
}

uint64_t mach_o::PlatformInfo_macOS::minorVersionForSpring(mach_o::PlatformInfo_macOS *this, unsigned int a2)
{
  if (a2 < 0xE) {
    return 3;
  }
  else {
    return 4;
  }
}

uint64_t mach_o::PlatformInfo::versionForYear(mach_o::PlatformInfo *this, int a2, int a3)
{
  int v3 = a2 - *((unsigned __int16 *)this + 27);
  if (a3) {
    int v4 = (*(unsigned __int8 (**)(mach_o::PlatformInfo *, void))(*(void *)this + 16))(this, (unsigned __int16)--v3) << 8;
  }
  else {
    int v4 = 0;
  }
  return v4 | (v3 << 16);
}

uint64_t mach_o::PlatformInfo::yearForVersion(_WORD *a1, int a2, _WORD *a3, BOOL *a4)
{
  return mach_o::PlatformInfo::yearForMajorVersion(a1, a2, a3, a4);
}

uint64_t mach_o::PlatformInfo::minorVersionForSpring(mach_o::PlatformInfo *this)
{
  return 4;
}

uint64_t mach_o::PlatformInfo_bridgeOS::minorVersionForSpring(mach_o::PlatformInfo_bridgeOS *this, unsigned int a2)
{
  if (a2 < 9) {
    return 3;
  }
  else {
    return 4;
  }
}

uint64_t mach_o::PlatformInfo_firmware::versionForYear(mach_o::PlatformInfo_firmware *this)
{
  return 0x10000;
}

void mach_o::PlatformInfo_firmware::yearForVersion(uint64_t a1, uint64_t a2, _WORD *a3, unsigned char *a4)
{
  *a3 = 2020;
  *a4 = 0;
}

uint64_t mach_o::PlatformInfo_sepOS::versionForYear(mach_o::PlatformInfo_sepOS *this)
{
  return 0x10000;
}

void mach_o::PlatformInfo_sepOS::yearForVersion(uint64_t a1, uint64_t a2, _WORD *a3, unsigned char *a4)
{
  *a3 = 2020;
  *a4 = 0;
}

uint64_t mach_o::PlatformInfo_visionOS::minorVersionForSpring(mach_o::PlatformInfo_visionOS *this, int a2)
{
  if (a2 == 1) {
    return 1;
  }
  else {
    return 4;
  }
}

uint64_t mach_o::PlatformInfo::yearForMajorVersion(_WORD *a1, int a2, _WORD *a3, BOOL *a4)
{
  *a3 = a1[27] + HIWORD(a2);
  unsigned int v6 = BYTE1(a2);
  uint64_t result = (*(uint64_t (**)(_WORD *, void))(*(void *)a1 + 16))(a1, HIWORD(a2));
  *a4 = v6 >= result;
  if (v6 >= result) {
    ++*a3;
  }
  return result;
}

void *mach_o::FunctionStarts::FunctionStarts(void *this, const unsigned __int8 *a2, uint64_t a3)
{
  *this = a2;
  this[1] = &a2[a3];
  return this;
}

double mach_o::CompactUnwind::CompactUnwind(void *a1, double *a2, uint64_t a3, uint64_t a4)
{
  double result = *a2;
  *a1 = *(void *)a2;
  a1[1] = a3;
  a1[2] = a4;
  return result;
}

uint64_t mach_o::Policy::Policy(uint64_t a1, void *a2, uint64_t a3, int a4, char a5, char a6)
{
  *(_DWORD *)a1 = mach_o::Platform::epoch((uint64_t *)a3, *(_DWORD *)(a3 + 8));
  *(_DWORD *)(a1 + 4) = mach_o::Platform::epoch((uint64_t *)a3, *(_DWORD *)(a3 + 12));
  *(void *)(a1 + 8) = *a2;
  *(void *)(a1 + 16) = *(void *)a3;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a3 + 8);
  *(_DWORD *)(a1 + 40) = a4;
  *(unsigned char *)(a1 + 44) = a5;
  *(unsigned char *)(a1 + 45) = a6;
  return a1;
}

BOOL mach_o::Policy::enforceReadOnlyLinkedit(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4EBBu;
}

BOOL mach_o::Policy::enforceLinkeditContentAlignment(mach_o::Policy *this)
{
  return *((_DWORD *)this + 10) != 1 && *((_DWORD *)this + 1) >= 0x4ED9u;
}

BOOL mach_o::Policy::enforceOneFixupEncoding(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4ED9u;
}

BOOL mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4EE3u;
}

BOOL mach_o::Policy::enforceSectionsInSegment(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4EEDu;
}

BOOL mach_o::Policy::enforceHasLinkedDylibs(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4EF7u;
}

BOOL mach_o::Policy::enforceHasUUID(mach_o::Policy *this)
{
  return *((_DWORD *)this + 10) != 1 && *((_DWORD *)this + 1) >= 0x4EF7u;
}

BOOL mach_o::Policy::enforceNoDuplicateDylibs(mach_o::Policy *this)
{
  return *((_DWORD *)this + 1) >= 0x4F15u;
}

BOOL mach_o::Policy::enforceDataSegmentPermissions(mach_o::Policy *this)
{
  return !*((unsigned char *)this + 44) && *((_DWORD *)this + 1) >= 0x4F0Bu;
}

uint64_t mach_o::RebaseOpcodes::RebaseOpcodes(uint64_t this, const unsigned __int8 *a2, uint64_t a3, int a4)
{
  *(void *)this = a2;
  *(void *)(this + 8) = &a2[a3];
  if (a4) {
    int v4 = 8;
  }
  else {
    int v4 = 4;
  }
  *(_DWORD *)(this + 16) = v4;
  return this;
}

void mach_o::RebaseOpcodes::valid(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, BOOL *a4@<X3>, char a5@<W4>, void *a6@<X8>)
{
  uint64_t v12 = 0;
  unint64_t v13 = &v12;
  uint64_t v14 = 0x3002000000;
  int v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  uint64_t v17 = 0;
  v8[0] = MEMORY[0x1E4F14BE8];
  v8[1] = 0x40000000;
  v8[2] = ___ZNK6mach_o13RebaseOpcodes5validENSt3__14spanIKNS_13MappedSegmentELm18446744073709551615EEEbb_block_invoke;
  v8[3] = &unk_1E5E6C328;
  v8[4] = &v12;
  v8[5] = a1;
  v8[6] = a2;
  v8[7] = a3;
  char v9 = a5;
  char v10 = (char)a4;
  mach_o::RebaseOpcodes::forEachRebase(a1, (uint64_t)v8, a4, (mach_o::Error *)&v11);
  if (v11) {
    int v7 = &v11;
  }
  else {
    int v7 = v13 + 5;
  }
  mach_o::Error::Error(a6, v7);
  mach_o::Error::~Error((mach_o::Error *)&v11);
  _Block_object_dispose(&v12, 8);
  mach_o::Error::~Error((mach_o::Error *)&v17);
}

void *__Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t mach_o::RebaseOpcodes::forEachRebase@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, BOOL *a3@<X3>, mach_o::Error *a4@<X8>)
{
  uint64_t v5 = result;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v43 = *(const unsigned __int8 ***)result;
  *(_WORD *)uint64_t v42 = 0;
  uint64_t v10 = a2 + 16;
  while (2)
  {
    uint64_t v11 = *(const unsigned __int8 ***)(v5 + 8);
    if (v43 >= v11)
    {
LABEL_48:
      *(void *)a4 = 0;
    }
    else
    {
      unsigned __int8 v13 = *(unsigned char *)v43;
      uint64_t v12 = (char *)v43 + 1;
      v43 = (const unsigned __int8 **)((char *)v43 + 1);
      uint64_t v14 = v13 & 0xF;
      switch(v13 >> 4)
      {
        case 0:
          if ((char *)v11 - v12 < 16) {
            goto LABEL_38;
          }
          return (uint64_t)mach_o::Error::Error(a4, "rebase opcodes terminated early at offset %d of %d");
        case 1:
          if ((v14 - 1) >= 3) {
            uint64_t v9 = 0;
          }
          else {
            uint64_t v9 = v14;
          }
          goto LABEL_38;
        case 2:
          double result = mach_o::read_uleb128(&v43, v11, v42, a3);
          uint64_t v7 = result;
          uint64_t v6 = 1;
          uint64_t v8 = v14;
          goto LABEL_38;
        case 3:
          double result = mach_o::read_uleb128(&v43, v11, v42, a3);
          v7 += result;
          goto LABEL_38;
        case 4:
          v7 += (*(_DWORD *)(v5 + 16) * v14);
          goto LABEL_38;
        case 5:
          if (!v14) {
            goto LABEL_38;
          }
          uint64_t v15 = v5;
          uint64_t v16 = v8;
          uint64_t v17 = v9;
          uint64_t v18 = v6;
          uint64_t v19 = v10;
          unsigned int v20 = 1;
          do
          {
            double result = (*(uint64_t (**)(uint64_t, const char *, uint64_t, uint64_t, void, uint64_t, unsigned __int8 *))(a2 + 16))(a2, "REBASE_OPCODE_DO_REBASE_IMM_TIMES", v17, v18 & 1, v16, v7, &v42[1]);
            v7 += *(unsigned int *)(v15 + 16);
            if (v42[1]) {
              BOOL v21 = 1;
            }
            else {
              BOOL v21 = v20 >= v14;
            }
            ++v20;
          }
          while (!v21);
          goto LABEL_27;
        case 6:
          double result = mach_o::read_uleb128(&v43, v11, v42, a3);
          if (v42[0]) {
            goto LABEL_46;
          }
          unint64_t v22 = result;
          if (!result) {
            goto LABEL_44;
          }
          uint64_t v15 = v5;
          uint64_t v16 = v8;
          uint64_t v17 = v9;
          uint64_t v18 = v6;
          uint64_t v19 = v10;
          unsigned int v23 = 1;
          do
          {
            double result = (*(uint64_t (**)(uint64_t, const char *, uint64_t, uint64_t, void, uint64_t, unsigned __int8 *))(a2 + 16))(a2, "REBASE_OPCODE_DO_REBASE_ADD_ADDR_ULEB", v17, v18 & 1, v16, v7, &v42[1]);
            v7 += *(unsigned int *)(v15 + 16);
            unint64_t v24 = v23++;
            if (v42[1]) {
              BOOL v25 = 0;
            }
            else {
              BOOL v25 = v22 > v24;
            }
          }
          while (v25);
LABEL_27:
          uint64_t v10 = v19;
          uint64_t v6 = v18;
          uint64_t v9 = v17;
          uint64_t v8 = v16;
          uint64_t v5 = v15;
          goto LABEL_38;
        case 7:
          (*(void (**)(uint64_t, const char *, uint64_t, uint64_t, void, uint64_t, unsigned __int8 *))(a2 + 16))(a2, "REBASE_OPCODE_DO_REBASE_ADD_ADDR_ULEB", v9, v6 & 1, v8, v7, &v42[1]);
          double result = mach_o::read_uleb128(&v43, *(const unsigned __int8 ***)(v5 + 8), v42, v26);
          v7 += result + *(unsigned int *)(v5 + 16);
          goto LABEL_38;
        case 8:
          uint64_t v27 = mach_o::read_uleb128(&v43, v11, v42, a3);
          if (v42[0]) {
            goto LABEL_46;
          }
          unint64_t v29 = v27;
          double result = mach_o::read_uleb128(&v43, *(const unsigned __int8 ***)(v5 + 8), v42, v28);
          if (v42[0]) {
            goto LABEL_46;
          }
          if (v29)
          {
            uint64_t v30 = result;
            uint64_t v41 = v5;
            uint64_t v31 = v8;
            uint64_t v32 = v9;
            uint64_t v33 = v6;
            uint64_t v34 = v10;
            unsigned int v35 = 1;
            do
            {
              double result = (*(uint64_t (**)(uint64_t, const char *, uint64_t, uint64_t, void, uint64_t, unsigned __int8 *))(a2 + 16))(a2, "REBASE_OPCODE_DO_REBASE_ULEB_TIMES_SKIPPING_ULEB", v32, v33 & 1, v31, v7, &v42[1]);
              v7 += v30 + *(unsigned int *)(v41 + 16);
              unint64_t v36 = v35++;
              if (v42[1]) {
                BOOL v37 = 0;
              }
              else {
                BOOL v37 = v29 > v36;
              }
            }
            while (v37);
            uint64_t v10 = v34;
            uint64_t v6 = v33;
            uint64_t v9 = v32;
            uint64_t v8 = v31;
            uint64_t v5 = v41;
LABEL_38:
            int v38 = v42[0];
          }
          else
          {
LABEL_44:
            int v38 = 0;
          }
          if (v42[1]) {
            BOOL v39 = 0;
          }
          else {
            BOOL v39 = v38 == 0;
          }
          if (v39) {
            continue;
          }
          if (!v38) {
            goto LABEL_48;
          }
LABEL_46:
          double result = (uint64_t)mach_o::Error::Error(a4, "malformed uleb128");
          break;
        default:
          return (uint64_t)mach_o::Error::Error(a4, "unknown rebase opcode 0x%02X");
      }
    }
    return result;
  }
}

void ___ZNK6mach_o13RebaseOpcodes5validENSt3__14spanIKNS_13MappedSegmentELm18446744073709551615EEEbb_block_invoke(uint64_t a1, uint64_t a2, int a3, char a4, unsigned int a5, unint64_t a6, unsigned char *a7)
{
  if ((a4 & 1) == 0)
  {
    mach_o::Error::Error((mach_o::Error *)&v10, "%s missing preceding REBASE_OPCODE_SET_SEGMENT_AND_OFFSET_ULEB");
    goto LABEL_7;
  }
  if (*(void *)(a1 + 56) <= (unint64_t)a5)
  {
    mach_o::Error::Error((mach_o::Error *)&v10, "%s segment index %d too large");
    goto LABEL_7;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (*(void *)(v9 + 56 * a5 + 8) - (unint64_t)*(unsigned int *)(*(void *)(a1 + 40) + 16) < a6)
  {
    mach_o::Error::Error((mach_o::Error *)&v10, "%s segment offset 0x%08llX beyond segment '%.*s' size (0x%08llX)");
LABEL_7:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v10);
    mach_o::Error::~Error((mach_o::Error *)&v10);
    *a7 = 1;
    return;
  }
  if ((a3 - 2) >= 2)
  {
    if (a3 != 1)
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s unknown rebase type");
      goto LABEL_7;
    }
    if (!*(unsigned char *)(v9 + 56 * a5 + 49) && *(unsigned char *)(a1 + 64))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s pointer rebase is in non-writable segment '%.*s'");
      goto LABEL_7;
    }
    if (*(unsigned char *)(v9 + 56 * a5 + 50) && *(unsigned char *)(a1 + 64))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s pointer rebase is in executable segment '%.*s'");
      goto LABEL_7;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 65))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s text rebase not supported for architecture");
      goto LABEL_7;
    }
    if (*(unsigned char *)(v9 + 56 * a5 + 49))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s text rebase is in writable segment '%.*s'");
      goto LABEL_7;
    }
    if (!*(unsigned char *)(v9 + 56 * a5 + 50))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "%s text rebase is in non-executable segment '%.*s'");
      goto LABEL_7;
    }
  }
}

uint64_t mach_o::read_uleb128(const unsigned __int8 ***this, const unsigned __int8 **a2, unsigned __int8 *a3, BOOL *a4)
{
  unint64_t v5 = 0;
  uint64_t result = 0;
  *a3 = 0;
  for (i = *this; i != a2 && v5 <= 0x3F; i = (const unsigned __int8 **)((char *)i + 1))
  {
    result |= (unint64_t)(*(unsigned char *)i & 0x7F) << v5;
    v5 += 7;
    *this = (const unsigned __int8 **)((char *)i + 1);
    int v8 = *(char *)i;
    if ((v8 & 0x80000000) == 0) {
      return result;
    }
  }
  *a3 = 1;
  return result;
}

uint64_t mach_o::read_sleb128(const unsigned __int8 ***this, const unsigned __int8 **a2, unsigned __int8 *a3, BOOL *a4)
{
  *a3 = 0;
  int v4 = *this;
  if (*this == a2)
  {
    uint64_t v6 = 0;
    int v7 = 0;
    unsigned int v9 = 0;
LABEL_7:
    *a3 = 1;
  }
  else
  {
    int v5 = 0;
    uint64_t v6 = 0;
    int v7 = -7 * v4 - a2 + 8 * a2;
    while (1)
    {
      int v8 = (const unsigned __int8 **)((char *)v4 + 1);
      *this = (const unsigned __int8 **)((char *)v4 + 1);
      unsigned int v9 = *(unsigned __int8 *)v4;
      v6 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        break;
      }
      v5 += 7;
      int v4 = (const unsigned __int8 **)((char *)v4 + 1);
      if (v8 == a2) {
        goto LABEL_7;
      }
    }
    int v7 = v5 + 7;
  }
  BOOL v10 = v7 < 64;
  uint64_t v11 = -1 << v7;
  if ((v10 & (v9 >> 6)) == 0) {
    uint64_t v11 = 0;
  }
  return v11 | v6;
}

void *mach_o::Error::Error(void *result, void *a2)
{
  *uint64_t result = 0;
  *uint64_t result = *a2;
  *a2 = 0;
  return result;
}

void *mach_o::Error::operator=(void *result, void *a2)
{
  *uint64_t result = *a2;
  *a2 = 0;
  return result;
}

mach_o::Error *mach_o::Error::Error(mach_o::Error *this, const char *a2, ...)
{
  *(void *)this = 0;
  *(void *)this = _simple_salloc();
  _simple_vsprintf();
  return this;
}

char *mach_o::LinkedDylibAttributes::toString(char *this, char *__dst)
{
  int v3 = this;
  *__dst = 0;
  char v4 = *this;
  if (*this)
  {
    strcpy(__dst, "weak-link");
    char v4 = *this;
    if ((*this & 4) == 0) {
      goto LABEL_7;
    }
    strlcat(__dst, ",", 0x40uLL);
    goto LABEL_6;
  }
  if ((*this & 4) != 0)
  {
LABEL_6:
    this = (char *)strlcat(__dst, "upward", 0x40uLL);
    char v4 = *v3;
  }
LABEL_7:
  if ((v4 & 8) != 0)
  {
    if (*__dst) {
      strlcat(__dst, ",", 0x40uLL);
    }
    this = (char *)strlcat(__dst, "delay-init", 0x40uLL);
    char v4 = *v3;
  }
  if ((v4 & 2) != 0)
  {
    if (*__dst) {
      strlcat(__dst, ",", 0x40uLL);
    }
    return (char *)strlcat(__dst, "re-export", 0x40uLL);
  }
  return this;
}

BOOL mach_o::Header::hasMachOMagic(mach_o::Header *this)
{
  return *(_DWORD *)this >> 1 == 2138504551;
}

BOOL mach_o::Header::is64(mach_o::Header *this)
{
  return *(_DWORD *)this == -17958193;
}

uint64_t mach_o::Header::pointerSize(mach_o::Header *this)
{
  if (*(_DWORD *)this == -17958193) {
    return 8;
  }
  else {
    return 4;
  }
}

BOOL mach_o::Header::isArch(mach_header *this, const char *a2)
{
  mach_o::Architecture::Architecture(&v5, this);
  int v3 = mach_o::Architecture::name((mach_o::Architecture *)&v5);
  return strcmp(a2, v3) == 0;
}

int32_t *mach_o::Header::arch@<X0>(mach_header *this@<X0>, int32_t *a2@<X8>)
{
  return mach_o::Architecture::Architecture(a2, this);
}

uint64_t mach_o::Header::inDyldCache(mach_o::Header *this)
{
  return *((_DWORD *)this + 6) >> 31;
}

uint64_t mach_o::Header::isDyldManaged(mach_o::Header *this)
{
  unsigned int v1 = *((_DWORD *)this + 3);
  BOOL v2 = v1 > 8;
  int v3 = (1 << v1) & 0x144;
  if (v2 || v3 == 0) {
    return 0;
  }
  else {
    return (*((unsigned __int8 *)this + 24) >> 2) & 1;
  }
}

BOOL mach_o::Header::isObjectFile(mach_o::Header *this)
{
  return *((_DWORD *)this + 3) == 1;
}

BOOL mach_o::Header::isFileSet(mach_o::Header *this)
{
  return *((_DWORD *)this + 3) == 12;
}

BOOL mach_o::Header::isPreload(mach_o::Header *this)
{
  return *((_DWORD *)this + 3) == 5;
}

BOOL mach_o::Header::mayHaveTextFixups(mach_o::Header *this)
{
  int v1 = *((_DWORD *)this + 1);
  if (v1 == 7) {
    return 1;
  }
  return v1 == 16777223 && *((_DWORD *)this + 3) == 11;
}

void mach_o::Header::platformAndVersions(mach_o::Header *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x4002000000;
  BOOL v10 = __Block_byref_object_copy__0;
  uint64_t v11 = __Block_byref_object_dispose__0;
  mach_o::Platform::Platform((mach_o::Platform *)v12, 0);
  *(void *)&long long v4 = 0x1000000010000;
  *((void *)&v4 + 1) = 0x1000000010000;
  *(_OWORD *)&v12[8] = v4;
  v6[0] = MEMORY[0x1E4F14BE8];
  v6[1] = 0x40000000;
  v6[2] = ___ZNK6mach_o6Header19platformAndVersionsEv_block_invoke;
  void v6[3] = &unk_1E5E6C350;
  v6[4] = &v7;
  mach_o::Header::forEachPlatformLoadCommand(this, (uint64_t)v6);
  int32_t v5 = v8;
  *(void *)a2 = v8[5];
  *(_OWORD *)(a2 + 8) = *((_OWORD *)v5 + 3);
  _Block_object_dispose(&v7, 8);
}

__n128 __Block_byref_object_copy__0(__n128 *a1, __n128 *a2)
{
  a1[2].n128_u64[1] = a2[2].n128_u64[1];
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void mach_o::Header::forEachPlatformLoadCommand(mach_o::Error *a1, uint64_t a2)
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2000000000;
  char v4 = 0;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZNK6mach_o6Header26forEachPlatformLoadCommandEU13block_pointerFvNS_8PlatformENS_9Version32ES2_E_block_invoke;
  v2[3] = &unk_1E5E6C4E0;
  v2[5] = v3;
  v2[6] = a1;
  v2[4] = a2;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v5);
  mach_o::Error::~Error((mach_o::Error *)v5);
  _Block_object_dispose(v3, 8);
}

void ___ZNK6mach_o6Header19platformAndVersionsEv_block_invoke(uint64_t a1, uint64_t *a2, int a3, int a4)
{
  char v4 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  uint64_t v5 = *a2;
  int v6 = a3;
  int v7 = a4;
  uint64_t v8 = 0x1000000010000;
  mach_o::PlatformAndVersions::zip(v4, &v5, (mach_o::Error *)&v9);
  if (v9) {
    ___ZNK6mach_o6Header19platformAndVersionsEv_block_invoke_cold_1();
  }
  mach_o::Error::~Error((mach_o::Error *)&v9);
}

void mach_o::Header::validSemanticsPlatform(mach_o::Header *this@<X0>, mach_o::Error *a2@<X8>)
{
  uint64_t v12 = 0;
  unsigned __int8 v13 = &v12;
  uint64_t v14 = 0x4002000000;
  uint64_t v15 = __Block_byref_object_copy__0;
  uint64_t v16 = __Block_byref_object_dispose__0;
  mach_o::Platform::Platform((mach_o::Platform *)v17, 0);
  *(void *)&long long v4 = 0x1000000010000;
  *((void *)&v4 + 1) = 0x1000000010000;
  *(_OWORD *)&v17[8] = v4;
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3002000000;
  uint64_t v9 = __Block_byref_object_copy__8;
  BOOL v10 = __Block_byref_object_dispose__9;
  uint64_t v11 = 0;
  v5[0] = MEMORY[0x1E4F14BE8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK6mach_o6Header22validSemanticsPlatformEv_block_invoke;
  void v5[3] = &unk_1E5E6C378;
  v5[4] = &v6;
  v5[5] = &v12;
  mach_o::Header::forEachPlatformLoadCommand(this, (uint64_t)v5);
  if (v7[5])
  {
    mach_o::Error::Error(a2, v7 + 5);
  }
  else if (*((_DWORD *)this + 3) == 5)
  {
    *(void *)a2 = 0;
  }
  else
  {
    mach_o::Platform::valid((mach_o::Error *)(v13 + 5), a2);
  }
  _Block_object_dispose(&v6, 8);
  mach_o::Error::~Error((mach_o::Error *)&v11);
  _Block_object_dispose(&v12, 8);
}

void *__Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void ___ZNK6mach_o6Header22validSemanticsPlatformEv_block_invoke(uint64_t a1, mach_o::Platform *this, int a3, int a4)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    mach_o::Platform::valid(this, (mach_o::Error *)&v10);
    if (v10)
    {
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v10);
      uint64_t v8 = (mach_o::Error *)&v10;
    }
    else
    {
      mach_o::Error::~Error((mach_o::Error *)&v10);
      uint64_t v9 = (uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v10 = *(void *)this;
      int v11 = a3;
      int v12 = a4;
      uint64_t v13 = 0x1000000010000;
      mach_o::PlatformAndVersions::zip(v9, &v10, (mach_o::Error *)&v14);
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v14);
      uint64_t v8 = (mach_o::Error *)&v14;
    }
    mach_o::Error::~Error(v8);
  }
}

void mach_o::Header::valid(mach_o::Header *this@<X0>, unint64_t a2@<X1>, mach_o::Error *a3@<X8>)
{
  if (a2 <= 0x1B)
  {
    long long v4 = "file is too short";
LABEL_18:
    mach_o::Error::Error(a3, v4);
    return;
  }
  if (*(_DWORD *)this >> 1 != 2138504551)
  {
    long long v4 = "not a mach-o file (start is no MH_MAGIC[_64])";
    goto LABEL_18;
  }
  mach_o::Header::validStructureLoadCommands(this, a2, a3);
  if (!*(void *)a3)
  {
    mach_o::Error::~Error(a3);
    mach_o::Header::validSemanticsPlatform(this, a3);
    if (!*(void *)a3)
    {
      mach_o::Error::~Error(a3);
      mach_o::Architecture::Architecture(&v8, (const mach_header *)this);
      mach_o::Header::platformAndVersions(this, (uint64_t)v7);
      mach_o::Policy::Policy(v9, &v8, v7, *((unsigned int *)this + 3), 0, 0);
      mach_o::Header::validSemanticsUUID(this, (const mach_o::Policy *)v9, a3);
      if (!*(void *)a3)
      {
        mach_o::Error::~Error(a3);
        mach_o::Header::validSemanticsInstallName(this, a3);
        if (!*(void *)a3)
        {
          mach_o::Error::~Error(a3);
          mach_o::Header::validSemanticsLinkedDylibs(this, (const mach_o::Policy *)v9, a3);
          if (!*(void *)a3)
          {
            mach_o::Error::~Error(a3);
            mach_o::Header::validSemanticsRPath(this, (const mach_o::Policy *)v9, a3);
            if (!*(void *)a3)
            {
              mach_o::Error::~Error(a3);
              mach_o::Header::validSemanticsSegments(this, (const mach_o::Policy *)v9, a2, a3);
              if (!*(void *)a3)
              {
                mach_o::Error::~Error(a3);
                mach_o::Header::validSemanticsLinkerOptions(this, a3);
                if (!*(void *)a3)
                {
                  mach_o::Error::~Error(a3);
                  if (*((_DWORD *)this + 3) == 2)
                  {
                    mach_o::Header::validSemanticsMain(this, (const mach_o::Policy *)v9, a3);
                    if (*(void *)a3) {
                      return;
                    }
                    mach_o::Error::~Error(a3);
                  }
                  *(void *)a3 = 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

void mach_o::Header::validStructureLoadCommands(mach_o::Header *this@<X0>, unint64_t a2@<X1>, mach_o::Error *a3@<X8>)
{
  if (*(_DWORD *)this == -17958193) {
    int v4 = 32;
  }
  else {
    int v4 = 28;
  }
  if ((v4 + *((_DWORD *)this + 5)) <= a2)
  {
    unsigned int v5 = *((_DWORD *)this + 3);
    if (v5 > 0xC || ((1 << v5) & 0x1BE6) == 0)
    {
      mach_o::Error::Error(a3, "unknown filetype %d");
    }
    else
    {
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x2000000000;
      int v15 = 1;
      uint64_t v8 = 0;
      uint64_t v9 = &v8;
      uint64_t v10 = 0x3002000000;
      int v11 = __Block_byref_object_copy__8;
      int v12 = __Block_byref_object_dispose__9;
      uint64_t v13 = 0;
      v7[0] = MEMORY[0x1E4F14BE8];
      v7[1] = 0x40000000;
      v7[2] = ___ZNK6mach_o6Header26validStructureLoadCommandsEy_block_invoke;
      v7[3] = &unk_1E5E6C3A0;
      v7[4] = &v8;
      v7[5] = v14;
      mach_o::Header::forEachLoadCommand(this, (uint64_t)v7, a3);
      if (!*(void *)a3)
      {
        mach_o::Error::~Error(a3);
        if (v9[5]) {
          mach_o::Error::Error(a3, v9 + 5);
        }
        else {
          *(void *)a3 = 0;
        }
      }
      _Block_object_dispose(&v8, 8);
      mach_o::Error::~Error((mach_o::Error *)&v13);
      _Block_object_dispose(v14, 8);
    }
  }
  else
  {
    mach_o::Error::Error(a3, "load commands length (%llu) exceeds length of file (%llu)");
  }
}

void mach_o::Header::validSemanticsUUID(mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F14BE8];
  v6[1] = 0x40000000;
  v6[2] = ___ZNK6mach_o6Header18validSemanticsUUIDERKNS_6PolicyE_block_invoke;
  void v6[3] = &unk_1E5E6C3C8;
  v6[4] = &v7;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v6, (mach_o::Error *)v11);
  mach_o::Error::~Error((mach_o::Error *)v11);
  unsigned int v5 = *((_DWORD *)v8 + 6);
  if (v5 < 2)
  {
    if (v5 || !mach_o::Policy::enforceHasUUID(a2)) {
      *(void *)a3 = 0;
    }
    else {
      mach_o::Error::Error(a3, "missing LC_UUID load command");
    }
  }
  else
  {
    mach_o::Error::Error(a3, "too many LC_UUID load commands");
  }
  _Block_object_dispose(&v7, 8);
}

void mach_o::Header::validSemanticsInstallName(mach_o::Header *this@<X0>, mach_o::Error *a2@<X8>)
{
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2000000000;
  uint64_t v14 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = (int *)&v7;
  uint64_t v9 = 0x2000000000;
  int v10 = 0;
  v6[0] = MEMORY[0x1E4F14BE8];
  v6[1] = 0x40000000;
  v6[2] = ___ZNK6mach_o6Header25validSemanticsInstallNameERKNS_6PolicyE_block_invoke;
  void v6[3] = &unk_1E5E6C3F0;
  v6[4] = &v11;
  void v6[5] = &v7;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v6, (mach_o::Error *)v15);
  mach_o::Error::~Error((mach_o::Error *)v15);
  if (v8[6] < 2)
  {
    int v5 = *((_DWORD *)this + 3);
    if (v5 == 9 || v5 == 6)
    {
      if (!v12[3])
      {
        mach_o::Error::Error(a2, "MH_DYLIB is missing LC_ID_DYLIB");
        goto LABEL_10;
      }
    }
    else if (v12[3])
    {
      mach_o::Error::Error(a2, "found LC_ID_DYLIB found in non-MH_DYLIB");
      goto LABEL_10;
    }
    *(void *)a2 = 0;
    goto LABEL_10;
  }
  mach_o::Error::Error(a2, "multiple LC_ID_DYLIB found");
LABEL_10:
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
}

void mach_o::Header::validSemanticsLinkedDylibs(mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F14BF8];
  uint64_t v21 = 0;
  unint64_t v22 = &v21;
  uint64_t v23 = 0x3002000000;
  unint64_t v24 = __Block_byref_object_copy__8;
  BOOL v25 = __Block_byref_object_dispose__9;
  uint64_t v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2000000000;
  int v20 = 0;
  memset(v30, 0, 512);
  BOOL v6 = mach_o::Policy::enforceNoDuplicateDylibs(a2);
  BOOL v7 = v6;
  BOOL hasWarningHandler = mach_o::hasWarningHandler((mach_o *)v6);
  v14[0] = MEMORY[0x1E4F14BE8];
  v14[1] = 0x40000000;
  v14[2] = ___ZNK6mach_o6Header26validSemanticsLinkedDylibsERKNS_6PolicyE_block_invoke;
  void v14[3] = &unk_1E5E6C418;
  BOOL v15 = v7;
  BOOL v16 = hasWarningHandler;
  v14[6] = this;
  v14[7] = v30;
  v14[4] = &v17;
  v14[5] = &v21;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v14, (mach_o::Error *)v29);
  mach_o::Error::~Error((mach_o::Error *)v29);
  if (v22[5])
  {
    mach_o::Error::Error(a3, v22 + 5);
  }
  else
  {
    unsigned int v9 = *((_DWORD *)this + 3);
    if (v9 > 8
      || ((1 << v9) & 0x144) == 0
      || (*((unsigned char *)this + 24) & 4) == 0
      || !mach_o::Policy::enforceHasLinkedDylibs(a2)
      || *((_DWORD *)v18 + 6))
    {
      goto LABEL_8;
    }
    v29[0] = 0;
    int v27 = 0x10000;
    int v28 = 0x10000;
    if (!mach_o::Header::getDylibInstallName(this, (uint64_t)v29, (uint64_t)&v28, (uint64_t)&v27)) {
      goto LABEL_18;
    }
    int v10 = (const char *)v29[0];
    if (!v29[0]) {
      goto LABEL_18;
    }
    mach_o::Header::platformAndVersions(this, (uint64_t)v29);
    if (v29[0] == 0x1F03D8F20)
    {
      uint64_t v11 = "/System/DriverKit/usr/lib/system/";
      int v12 = v10;
      size_t v13 = 33;
    }
    else
    {
      mach_o::Header::platformAndVersions(this, (uint64_t)v29);
      if (mach_o::Platform::isExclaveKit((mach_o::Platform *)v29))
      {
        uint64_t v11 = "/System/ExclaveKit/usr/lib/system/";
        int v12 = v10;
        size_t v13 = 34;
      }
      else
      {
        uint64_t v11 = "/usr/lib/system/";
        int v12 = v10;
        size_t v13 = 16;
      }
    }
    if (!strncmp(v12, v11, v13)) {
LABEL_8:
    }
      *(void *)a3 = 0;
    else {
LABEL_18:
    }
      mach_o::Error::Error(a3, "missing LC_LOAD_DYLIB (must link with at least libSystem.dylib)");
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  mach_o::Error::~Error((mach_o::Error *)&v26);
}

void mach_o::Header::validSemanticsRPath(mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, void *a3@<X8>)
{
  uint64_t v18 = *MEMORY[0x1E4F14BF8];
  BOOL v5 = mach_o::Policy::enforceNoDuplicateDylibs(a2);
  BOOL v6 = v5;
  if (v5 || mach_o::hasWarningHandler((mach_o *)v5))
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x3002000000;
    uint64_t v14 = __Block_byref_object_copy__8;
    BOOL v15 = __Block_byref_object_dispose__9;
    uint64_t v16 = 0;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2000000000;
    int v10 = 0;
    memset(v17, 0, sizeof(v17));
    v7[0] = MEMORY[0x1E4F14BE8];
    v7[1] = 0x40000000;
    v7[2] = ___ZNK6mach_o6Header19validSemanticsRPathERKNS_6PolicyE_block_invoke;
    v7[3] = &unk_1E5E6C440;
    v7[5] = &v11;
    void v7[6] = v17;
    BOOL v8 = v6;
    v7[4] = v9;
    mach_o::Header::forEachRPath(this, (uint64_t)v7);
    mach_o::Error::Error(a3, v12 + 5);
    _Block_object_dispose(v9, 8);
    _Block_object_dispose(&v11, 8);
    mach_o::Error::~Error((mach_o::Error *)&v16);
  }
  else
  {
    *a3 = 0;
  }
}

void mach_o::Header::validSemanticsSegments(mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, uint64_t a3@<X2>, mach_o::Error *a4@<X8>)
{
  uint64_t v55 = *MEMORY[0x1E4F14BF8];
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x5002000000;
  v46 = __Block_byref_object_copy__51;
  v47 = __Block_byref_object_dispose__52;
  int v48 = &v54;
  uint64_t v49 = 12;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v37 = 0;
  int v38 = &v37;
  uint64_t v39 = 0x3002000000;
  v40 = __Block_byref_object_copy__8;
  uint64_t v41 = __Block_byref_object_dispose__9;
  uint64_t v42 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2000000000;
  char v36 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2000000000;
  char v32 = 0;
  uint64_t v27 = 0;
  int v28 = &v27;
  uint64_t v29 = 0x2000000000;
  uint64_t v30 = 0;
  v26[0] = MEMORY[0x1E4F14BE8];
  v26[1] = 0x40000000;
  v26[2] = ___ZNK6mach_o6Header22validSemanticsSegmentsERKNS_6PolicyEy_block_invoke;
  v26[3] = &unk_1E5E6C468;
  v26[4] = &v33;
  v26[5] = &v27;
  v26[6] = &v43;
  v26[7] = v31;
  v26[8] = &v37;
  v26[9] = this;
  v26[10] = a2;
  v26[11] = a3;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v26, (mach_o::Error *)v53);
  mach_o::Error::~Error((mach_o::Error *)v53);
  if (v38[5])
  {
    mach_o::Error::Error(a4, v38 + 5);
    goto LABEL_41;
  }
  unsigned int v7 = *((_DWORD *)this + 3);
  if (v7 <= 8 && ((1 << v7) & 0x144) != 0)
  {
    int v8 = *((_DWORD *)this + 6);
    if ((v8 & 4) != 0)
    {
      if (!*((unsigned char *)v34 + 24))
      {
        mach_o::Error::Error(a4, "missing __TEXT segment");
        goto LABEL_41;
      }
      if ((v8 & 0x80000000) == 0
        && *(void *)(dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::operator[]((uint64_t)(v44 + 5), v28[3])+ 16))
      {
        mach_o::Error::Error(a4, "__TEXT segment fileoffset is not zero");
        goto LABEL_41;
      }
      if (*(_DWORD *)this == -17958193) {
        int v24 = 32;
      }
      else {
        int v24 = 28;
      }
      unint64_t v25 = (v24 + *((_DWORD *)this + 5));
      if (*(void *)(dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::operator[]((uint64_t)(v44 + 5), v28[3])+ 24) < v25)
      {
        mach_o::Error::Error(a4, "load commands do not fit in __TEXT segment");
        goto LABEL_41;
      }
    }
  }
  uint64_t v9 = v44[7];
  if (v9)
  {
    uint64_t v10 = 0;
    uint64_t v11 = (void *)v44[5];
    int v12 = &v11[5 * v9];
    uint64_t v13 = v11 + 4;
    uint64_t v14 = 40 * v9;
    do
    {
      uint64_t v15 = v10;
      uint64_t v16 = v14;
      uint64_t v17 = v13;
      do
      {
        if (v15)
        {
          if (*(v17 - 4) < v11[1] && *(v17 - 3) > *v11)
          {
            mach_o::Error::Error(a4, "vm range of segment '%s' overlaps segment '%s'");
            goto LABEL_41;
          }
          if ((*((_DWORD *)this + 6) & 0x80000000) == 0 && *(v17 - 2) < v11[3] && *(v17 - 1) > v11[2])
          {
            mach_o::Error::Error(a4, "file range of segment '%s' overlaps segment '%s'");
            goto LABEL_41;
          }
        }
        v17 += 5;
        v15 -= 40;
        v16 -= 40;
      }
      while (v16);
      v11 += 5;
      v10 += 40;
    }
    while (v11 != v12);
  }
  if (!mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2)
    || (*((_DWORD *)this + 6) & 0x80000000) != 0
    || (uint64_t v18 = v44[7]) == 0)
  {
LABEL_28:
    *(void *)a4 = 0;
    goto LABEL_41;
  }
  uint64_t v19 = 0;
  uint64_t v20 = v44[5];
  uint64_t v21 = 40 * v18;
  while (1)
  {
    unint64_t v22 = (void *)v19;
    uint64_t v19 = v20;
    if (!v22) {
      goto LABEL_27;
    }
    unint64_t v23 = *(void *)(v20 + 16);
    if (v23 < v22[2] && v23 != *(void *)(v19 + 24)) {
      break;
    }
    if (*(void *)v19 < *v22 && (*((_DWORD *)this + 3) != 12 || strcmp(*(const char **)(v19 + 32), "__PRELINK_INFO")))
    {
      mach_o::Error::Error(a4, "segment '%s' vm address out of order");
      goto LABEL_41;
    }
LABEL_27:
    uint64_t v20 = v19 + 40;
    v21 -= 40;
    if (!v21) {
      goto LABEL_28;
    }
  }
  mach_o::Error::Error(a4, "segment '%s' file offset out of order");
LABEL_41:
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  mach_o::Error::~Error((mach_o::Error *)&v42);
  _Block_object_dispose(&v43, 8);
  uint64_t v50 = 0;
  if (v51) {
    MEMORY[0x1AD11BB30](*MEMORY[0x1E4F14C48], v51, v52);
  }
}

void mach_o::Header::validSemanticsLinkerOptions(mach_o::Header *this@<X0>, void *a2@<X8>)
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3002000000;
  int v8 = __Block_byref_object_copy__8;
  uint64_t v9 = __Block_byref_object_dispose__9;
  uint64_t v10 = 0;
  v4[0] = MEMORY[0x1E4F14BE8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK6mach_o6Header27validSemanticsLinkerOptionsERKNS_6PolicyE_block_invoke;
  void v4[3] = &unk_1E5E6C4B8;
  v4[4] = &v5;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v4, (mach_o::Error *)v11);
  mach_o::Error::~Error((mach_o::Error *)v11);
  mach_o::Error::Error(a2, v6 + 5);
  _Block_object_dispose(&v5, 8);
  mach_o::Error::~Error((mach_o::Error *)&v10);
}

void mach_o::Header::validSemanticsMain(mach_o::Header *this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  if ((*((_DWORD *)this + 6) & 0x80000000) == 0 || !mach_o::Policy::enforceHasLinkedDylibs(a2))
  {
    uint64_t v18 = 0;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3002000000;
    uint64_t v21 = __Block_byref_object_copy__8;
    unint64_t v22 = __Block_byref_object_dispose__9;
    uint64_t v23 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2000000000;
    v17[3] = 0;
    uint64_t v13 = 0;
    uint64_t v14 = &v13;
    uint64_t v15 = 0x2000000000;
    uint64_t v16 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2000000000;
    uint64_t v12 = 0;
    v8[0] = MEMORY[0x1E4F14BE8];
    v8[1] = 0x40000000;
    v8[2] = ___ZNK6mach_o6Header18validSemanticsMainERKNS_6PolicyE_block_invoke;
    v8[3] = &unk_1E5E6C490;
    v8[7] = v17;
    void v8[8] = this;
    v8[4] = &v13;
    v8[5] = &v18;
    v8[6] = &v9;
    mach_o::Header::forEachLoadCommand(this, (uint64_t)v8, (mach_o::Error *)v24);
    mach_o::Error::~Error((mach_o::Error *)v24);
    if (v19[5])
    {
      mach_o::Error::Error(a3, v19 + 5);
    }
    else if (v14[3] && v10[3])
    {
      mach_o::Error::Error(a3, "can't have LC_MAIN and LC_UNIXTHREAD load commands");
    }
    else
    {
      uint64_t v7 = 0x1F03D8F20;
      BOOL v5 = mach_o::Header::builtForPlatform(this, &v7, 0);
      uint64_t v6 = v14[3];
      if (v5)
      {
        if (v6 || v10[3])
        {
          mach_o::Error::Error(a3, "LC_MAIN not allowed for driverkit");
          goto LABEL_19;
        }
      }
      else if (!v6 && !v10[3])
      {
        mach_o::Error::Error(a3, "missing LC_MAIN or LC_UNIXTHREAD in main executable");
        goto LABEL_19;
      }
      *(void *)a3 = 0;
    }
LABEL_19:
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v18, 8);
    mach_o::Error::~Error((mach_o::Error *)&v23);
    return;
  }

  mach_o::Error::Error(a3, "MH_EXECUTE has MH_DYLIB_IN_CACHE bit set");
}

void ___ZNK6mach_o6Header26validStructureLoadCommandsEy_block_invoke(uint64_t a1, mach_o *this, unsigned char *a3)
{
  int v5 = *(_DWORD *)this;
  if (*(int *)this <= -2147483596)
  {
    if (v5 > -2147483609)
    {
      switch(v5)
      {
        case -2147483608:
          if (*((_DWORD *)this + 1) == 24) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_MAIN size wrong");
          break;
        case -2147483597:
          if (*((_DWORD *)this + 1) == 16) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_DYLD_EXPORTS_TRIE size wrong");
          break;
        case -2147483596:
          if (*((_DWORD *)this + 1) == 16) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_DYLD_CHAINED_FIXUPS size wrong");
          break;
        default:
LABEL_24:
          if ((v5 & 0x80000000) == 0) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d unknown required load command 0x%08X");
          break;
      }
    }
    else
    {
      switch(v5)
      {
        case -2147483624:
        case -2147483620:
        case -2147483617:
        case -2147483613:
LABEL_7:
          unsigned int v6 = *((_DWORD *)this + 2);
LABEL_8:
          mach_o::stringOverflow(this, v6, (mach_o::Error *)&v7);
          break;
        case -2147483614:
LABEL_18:
          if (*((_DWORD *)this + 1) == 48) {
            goto LABEL_47;
          }
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_DYLD_INFO_ONLY size wrong");
          break;
        default:
          goto LABEL_24;
      }
    }
LABEL_46:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v7);
    mach_o::Error::~Error((mach_o::Error *)&v7);
  }
  else
  {
    switch(v5)
    {
      case 1:
        if (68 * *((unsigned int *)this + 12) + 56 == *((_DWORD *)this + 1)) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_SEGMENT size does not match number of sections");
        goto LABEL_46;
      case 2:
        if (*((_DWORD *)this + 1) == 24) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_SYMTAB size wrong");
        goto LABEL_46;
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 22:
      case 23:
      case 24:
      case 26:
      case 28:
      case 29:
      case 31:
      case 32:
      case 35:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 45:
      case 46:
      case 49:
        goto LABEL_24;
      case 11:
        if (*((_DWORD *)this + 1) == 80) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_DYSYMTAB size wrong");
        goto LABEL_46;
      case 12:
      case 13:
      case 19:
      case 20:
      case 21:
        goto LABEL_7;
      case 25:
        if (80 * *((unsigned int *)this + 16) + 72 == *((_DWORD *)this + 1)) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_SEGMENT_64 size does not match number of sections");
        goto LABEL_46;
      case 27:
        if (*((_DWORD *)this + 1) == 24) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_UUID size wrong");
        goto LABEL_46;
      case 30:
        if (*((_DWORD *)this + 1) == 16) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_SEGMENT_SPLIT_INFO size wrong");
        goto LABEL_46;
      case 33:
        if (*((_DWORD *)this + 1) == 20) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_ENCRYPTION_INFO size wrong");
        goto LABEL_46;
      case 34:
        goto LABEL_18;
      case 36:
      case 37:
      case 47:
      case 48:
        if (*((_DWORD *)this + 1) == 16) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_VERSION_MIN_* size wrong");
        goto LABEL_46;
      case 38:
        if (*((_DWORD *)this + 1) == 16) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_FUNCTION_STARTS size wrong");
        goto LABEL_46;
      case 44:
        if (*((_DWORD *)this + 1) == 24) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_ENCRYPTION_INFO_64 size wrong");
        goto LABEL_46;
      case 50:
        if (8 * *((unsigned int *)this + 5) + 24 == *((_DWORD *)this + 1)) {
          break;
        }
        mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_BUILD_VERSION size wrong");
        goto LABEL_46;
      default:
        if (v5 == -2147483595)
        {
          unsigned int v6 = *((_DWORD *)this + 6);
          goto LABEL_8;
        }
        if (v5 != 54) {
          goto LABEL_24;
        }
        if (*((_DWORD *)this + 1) != 16)
        {
          mach_o::Error::Error((mach_o::Error *)&v7, "load command #%d LC_ATOM_INFO size wrong");
          goto LABEL_46;
        }
        break;
    }
  }
LABEL_47:
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *a3 = 1;
  }
}

mach_o::Error *mach_o::stringOverflow@<X0>(mach_o::Error *this@<X0>, unsigned int a2@<W2>, mach_o::Error *a3@<X8>)
{
  uint64_t v4 = *((unsigned int *)this + 1);
  if (v4 <= a2) {
    return mach_o::Error::Error(a3, "load command #%d string offset (%u) outside its size (%u)");
  }
  int v5 = (char *)this + v4;
  unsigned int v6 = (char *)this + a2;
  while (*v6)
  {
    if (++v6 >= v5) {
      return mach_o::Error::Error(a3, "load command #%d string extends beyond end of load command");
    }
  }
  *(void *)a3 = 0;
  return this;
}

mach_o::Error *mach_o::Header::forEachLoadCommand@<X0>(mach_o::Error *result@<X0>, uint64_t a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v4 = result;
  int v6 = *(_DWORD *)result;
  if (*(_DWORD *)result == -17958193)
  {
    uint64_t v7 = 32;
  }
  else
  {
    if (v6 != -17958194)
    {
      if ((v6 & 0xFEFFFFFF) != 0xCEFAEDFE) {
        return mach_o::Error::Error(a3, "file does not start with MH_MAGIC[_64]: 0x%08X 0x%08X");
      }
      return mach_o::Error::Error(a3, "big endian mach-o file");
    }
    uint64_t v7 = 28;
  }
  if (*((_DWORD *)result + 3) >= 0xDu) {
    return mach_o::Error::Error(a3, "unknown mach-o filetype (%u)");
  }
  if (*((_DWORD *)result + 4))
  {
    int v8 = (char *)result + v7;
    uint64_t v9 = (char *)result + v7 + *((unsigned int *)result + 5);
    unsigned int v10 = 1;
    uint64_t v11 = (char *)result + v7;
    while (1)
    {
      if (v11 >= v9) {
        return mach_o::Error::Error(a3, "malformed load command (%d of %d) at %p with mh=%p, off end of load commands");
      }
      uint64_t v12 = *((unsigned int *)v11 + 1);
      if (v12 <= 7) {
        return mach_o::Error::Error(a3, "malformed load command (%d of %d) at %p with mh=%p, size (0x%X) too small");
      }
      uint64_t v13 = &v11[v12];
      if (&v11[v12] > v9 || v13 < v8) {
        return mach_o::Error::Error(a3, "malformed load command (%d of %d) at %p with mh=%p, size (0x%X) is too large, load commands end at %p");
      }
      __n128 result = (mach_o::Error *)(*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
      ++v10;
      uint64_t v11 = v13;
      if (v10 > *((_DWORD *)v4 + 4)) {
        goto LABEL_21;
      }
    }
  }
  else
  {
LABEL_21:
    *(void *)a3 = 0;
  }
  return result;
}

void mach_o::Header::forEachLoadCommandSafe(mach_o::Error *a1, uint64_t a2)
{
  mach_o::Header::forEachLoadCommand(a1, a2, (mach_o::Error *)v2);
  mach_o::Error::~Error((mach_o::Error *)v2);
}

uint64_t ___ZNK6mach_o6Header18validSemanticsUUIDERKNS_6PolicyE_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 == 27) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

uint64_t ___ZNK6mach_o6Header25validSemanticsInstallNameERKNS_6PolicyE_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 == 13)
  {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = (char *)a2 + a2[2];
    ++*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24);
  }
  return result;
}

void ___ZNK6mach_o6Header26validSemanticsLinkedDylibsERKNS_6PolicyE_block_invoke(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  if ((*a2 + 2147483624) <= 0xB && ((1 << (*a2 - 24)) & 0x881) != 0 || *a2 == 12)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    LODWORD(v7) = *(_DWORD *)(v6 + 24);
    if ((int)v7 <= 255)
    {
      uint64_t v9 = *(void *)(a1 + 48);
      if (*(unsigned char *)(a1 + 64) || *(unsigned char *)(a1 + 65))
      {
        unsigned int v10 = (char *)a2 + a2[2];
        if ((int)v7 <= 0)
        {
          uint64_t v7 = (int)v7;
        }
        else
        {
          uint64_t v11 = 0;
          do
          {
            if (!strcmp(v10, *(const char **)(*(void *)(a1 + 56) + 8 * v11)))
            {
              if (*(unsigned char *)(a1 + 64))
              {
                mach_o::Error::Error((mach_o::Error *)&v13, "duplicate linked dylib '%s'", v10);
                mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), &v13);
                mach_o::Error::~Error((mach_o::Error *)&v13);
                *a3 = 1;
              }
              else
              {
                mach_o::warning(v9, "duplicate linked dylib are deprecated ('%s')", v12, v10);
              }
            }
            ++v11;
            uint64_t v7 = *(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
          }
          while (v11 < v7);
        }
        *(void *)(*(void *)(a1 + 56) + 8 * v7) = v10;
        uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
        LODWORD(v7) = *(_DWORD *)(v6 + 24);
      }
    }
    *(_DWORD *)(v6 + 24) = v7 + 1;
  }
}

BOOL mach_o::Header::builtForPlatform(mach_o::Header *a1, uint64_t *a2, char a3)
{
  mach_o::Header::platformAndVersions(a1, (uint64_t)v14);
  uint64_t v5 = *a2;
  BOOL v6 = v14[0] == *a2;
  BOOL v7 = v6;
  if (!v6 && (a3 & 1) == 0)
  {
    uint64_t v10 = 0;
    uint64_t v11 = &v10;
    uint64_t v12 = 0x2000000000;
    char v13 = 0;
    v9[0] = MEMORY[0x1E4F14BE8];
    v9[1] = 1174405120;
    v9[2] = ___ZNK6mach_o6Header16builtForPlatformENS_8PlatformEb_block_invoke;
    void v9[3] = &unk_1F03DA100;
    v9[4] = &v10;
    v9[5] = v5;
    mach_o::PlatformAndVersions::unzip(v14, (uint64_t)v9);
    BOOL v7 = *((unsigned char *)v11 + 24) != 0;
    _Block_object_dispose(&v10, 8);
  }
  return v7;
}

void mach_o::Header::forEachRPath(mach_o::Error *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZNK6mach_o6Header12forEachRPathEU13block_pointerFvPKcRbE_block_invoke;
  v2[3] = &unk_1E5E6C758;
  v2[4] = a2;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void ___ZNK6mach_o6Header19validSemanticsRPathERKNS_6PolicyE_block_invoke(uint64_t a1, char *__s1, unsigned char *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 8);
  LODWORD(v5) = *(_DWORD *)(v4 + 24);
  if ((int)v5 <= 63)
  {
    if ((int)v5 <= 0)
    {
      uint64_t v5 = (int)v5;
    }
    else
    {
      uint64_t v9 = 0;
      do
      {
        if (!strcmp(__s1, *(const char **)(*(void *)(a1 + 48) + 8 * v9)) && *(unsigned char *)(a1 + 56))
        {
          mach_o::Error::Error((mach_o::Error *)&v10, "duplicate LC_RPATH '%s'", __s1);
          mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), &v10);
          mach_o::Error::~Error((mach_o::Error *)&v10);
          *a3 = 1;
          uint64_t v3 = *(void *)(a1 + 32);
        }
        ++v9;
        uint64_t v5 = *(int *)(*(void *)(v3 + 8) + 24);
      }
      while (v9 < v5);
    }
    *(void *)(*(void *)(a1 + 48) + 8 * v5) = __s1;
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    LODWORD(v5) = *(_DWORD *)(v4 + 24);
  }
  *(_DWORD *)(v4 + 24) = v5 + 1;
}

double __Block_byref_object_copy__51(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 72) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  uint64_t v3 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v3;
  *(void *)(a2 + 72) = 0;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 40) = 0u;
  return result;
}

uint64_t __Block_byref_object_dispose__52(uint64_t result)
{
  *(void *)(result + 56) = 0;
  if (*(void *)(result + 64)) {
    JUMPOUT(0x1AD11BB30);
  }
  return result;
}

void ___ZNK6mach_o6Header22validSemanticsSegmentsERKNS_6PolicyEy_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = *(void *)(a1 + 72);
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t v7 = a2 + 8;
    if (!strcmp((const char *)(a2 + 8), "__TEXT"))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 56);
    }
    else if (!strcmp((const char *)(a2 + 8), "__LINKEDIT"))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    mach_o::Header::validSegment<segment_command,section>(*(mach_o::Policy **)(a1 + 80), v6, *(void *)(a1 + 88), a2, (mach_o::Error *)&v13);
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), &v13);
    mach_o::Error::~Error((mach_o::Error *)&v13);
    int v8 = (vm_address_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v12 = (*(_DWORD *)(a2 + 28) + *(_DWORD *)(a2 + 24));
    uint64_t v13 = *(unsigned int *)(a2 + 24);
    uint64_t v14 = v12;
    uint64_t v10 = *(unsigned int *)(a2 + 32);
    uint64_t v11 = (*(_DWORD *)(a2 + 36) + v10);
  }
  else
  {
    if (*(_DWORD *)a2 != 25) {
      goto LABEL_14;
    }
    uint64_t v7 = a2 + 8;
    if (!strcmp((const char *)(a2 + 8), "__TEXT"))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                              + 56);
    }
    else if (!strcmp((const char *)(a2 + 8), "__LINKEDIT"))
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    }
    mach_o::Header::validSegment<segment_command_64,section_64>(*(mach_o::Policy **)(a1 + 80), v6, *(void *)(a1 + 88), a2, (mach_o::Error *)&v13);
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), &v13);
    mach_o::Error::~Error((mach_o::Error *)&v13);
    int v8 = (vm_address_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v9 = *(void *)(a2 + 32) + *(void *)(a2 + 24);
    uint64_t v13 = *(void *)(a2 + 24);
    uint64_t v14 = v9;
    uint64_t v10 = *(void *)(a2 + 40);
    uint64_t v11 = *(void *)(a2 + 48) + v10;
  }
  uint64_t v15 = v10;
  uint64_t v16 = v11;
  uint64_t v17 = v7;
  dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back(v8, (uint64_t)&v13);
LABEL_14:
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
    *a3 = 1;
  }
}

mach_o::Error *mach_o::Header::validSegment<segment_command_64,section_64>@<X0>(mach_o::Policy *this@<X1>, uint64_t a2@<X0>, unint64_t a3@<X2>, uint64_t a4@<X3>, mach_o::Error *a5@<X8>)
{
  uint64_t v7 = *(void *)(a4 + 40);
  unint64_t v8 = *(void *)(a4 + 48);
  BOOL v9 = __CFADD__(v7, v8);
  unint64_t v10 = v7 + v8;
  if (v9 || v10 > a3) {
    return mach_o::Error::Error(a5, "segment '%s' load command content extends beyond end of file");
  }
  unsigned int v13 = *(_DWORD *)(a2 + 12);
  if (v13 != 1)
  {
    unint64_t v14 = *(void *)(a4 + 32);
    if (v8 > v14 && (v14 || (*(unsigned char *)(a4 + 68) & 4) == 0)) {
      return mach_o::Error::Error(a5, "segment '%s' filesize exceeds vmsize");
    }
  }
  if (*(_DWORD *)(a4 + 60) >= 8u) {
    return mach_o::Error::Error(a5, "%s segment permissions has invalid bits set (0x%08X)");
  }
  if (v13 <= 8
    && ((1 << v13) & 0x144) != 0
    && (*(unsigned char *)(a2 + 24) & 4) != 0
    && mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(this)
    && !strcmp((const char *)(a4 + 8), "__TEXT")
    && *(_DWORD *)(a4 + 60) != 5)
  {
    uint64_t v19 = "__TEXT segment permissions is not 'r-x'";
    goto LABEL_51;
  }
  double result = (mach_o::Error *)mach_o::Policy::enforceReadOnlyLinkedit(this);
  if (result)
  {
    double result = (mach_o::Error *)strcmp((const char *)(a4 + 8), "__LINKEDIT");
    if (!result && *(_DWORD *)(a4 + 60) != 1)
    {
      uint64_t v19 = "__LINKEDIT segment permissions is not 'r--'";
      goto LABEL_51;
    }
  }
  if (*(_DWORD *)(a2 + 12) != 9)
  {
    double result = (mach_o::Error *)mach_o::Policy::enforceDataSegmentPermissions(this);
    if (result)
    {
      if (!strcmp((const char *)(a4 + 8), "__DATA") && *(_DWORD *)(a4 + 60) != 3)
      {
        uint64_t v19 = "__DATA segment permissions is not 'rw-'";
      }
      else
      {
        double result = (mach_o::Error *)strcmp((const char *)(a4 + 8), "__DATA_CONST");
        if (result) {
          goto LABEL_24;
        }
        if (*(_DWORD *)(a4 + 60) == 3)
        {
          if ((*(unsigned char *)(a4 + 68) & 0x10) == 0)
          {
            if ((v21 = 0, int v20 = *(_DWORD *)(a2 + 12), v20 != 9) && v20 != 6
              || (double result = (mach_o::Error *)mach_o::Header::hasSplitSegInfo((mach_o::Header *)a2, &v21), !result)
              || v21)
            {
              if ((*(_DWORD *)(a2 + 24) & 0x80000000) == 0) {
                return mach_o::Error::Error(a5, "__DATA_CONST segment missing SG_READ_ONLY flag");
              }
            }
          }
          goto LABEL_24;
        }
        uint64_t v19 = "__DATA_CONST segment permissions is not 'rw-'";
      }
LABEL_51:
      return mach_o::Error::Error(a5, v19);
    }
  }
LABEL_24:
  if (__CFADD__(*(void *)(a4 + 24), *(void *)(a4 + 32))) {
    return mach_o::Error::Error(a5, "'%s' segment vm range wraps");
  }
  if (*(_DWORD *)(a2 + 12) == 9 || (unsigned int v16 = *(_DWORD *)(a4 + 64)) == 0)
  {
LABEL_36:
    *(void *)a5 = 0;
  }
  else
  {
    unint64_t v17 = a4 + 72;
    unint64_t v18 = a4 + 72 + 80 * v16;
    while (1)
    {
      if ((*(void *)(v17 + 40) & 0x8000000000000000) != 0) {
        return mach_o::Error::Error(a5, "section '%s' size too large 0x%lX");
      }
      if (*(void *)(v17 + 32) < *(void *)(a4 + 24)) {
        return mach_o::Error::Error(a5, "section '%s' start address 0x%lX is before containing segment's address 0x%0lX");
      }
      double result = (mach_o::Error *)mach_o::Policy::enforceSectionsInSegment(this);
      if (result)
      {
        if (*(void *)(v17 + 40) + *(void *)(v17 + 32) > *(void *)(a4 + 32) + *(void *)(a4 + 24)) {
          return mach_o::Error::Error(a5, "section '%s' end address 0x%lX is beyond containing segment's end address 0x%0lX");
        }
      }
      v17 += 80;
      if (v17 >= v18) {
        goto LABEL_36;
      }
    }
  }
  return result;
}

__n128 dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back(vm_address_t *a1, uint64_t a2)
{
  kern_return_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  __n128 result;
  long long v17;
  char v18[256];
  uint64_t v19;

  uint64_t v19 = *MEMORY[0x1E4F14BF8];
  unint64_t v4 = a1[1];
  unint64_t v5 = a1[2] + 1;
  if (v5 > v4)
  {
    uint64_t v6 = (char *)a1[3];
    uint64_t v7 = (char *)a1[4];
    unint64_t v8 = 2 * v4;
    if (v8 > v5) {
      unint64_t v5 = v8;
    }
    vm_size_t v9 = (*MEMORY[0x1E4F14C80] + 40 * v5 - 1) & -*MEMORY[0x1E4F14C80];
    a1[4] = v9;
    unint64_t v10 = (unsigned int *)MEMORY[0x1E4F14C48];
    uint64_t v11 = vm_allocate(*MEMORY[0x1E4F14C48], a1 + 3, v9, 1006632961);
    if (v11) {
      dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back(v18, a1 + 4, v11);
    }
    memcpy((void *)a1[3], (const void *)*a1, 40 * a1[2]);
    uint64_t v12 = a1[4] / 0x28;
    *a1 = a1[3];
    a1[1] = v12;
    if (v6) {
      MEMORY[0x1AD11BB30](*v10, v6, v7);
    }
  }
  unsigned int v13 = (char *)*a1;
  unint64_t v14 = (char *)a1[2];
  a1[2] = (vm_address_t)(v14 + 1);
  uint64_t v15 = &v13[40 * (void)v14];
  double result = *(__n128 *)a2;
  unint64_t v17 = *(_OWORD *)(a2 + 16);
  *((void *)v15 + 4) = *(void *)(a2 + 32);
  *(__n128 *)uint64_t v15 = result;
  *((_OWORD *)v15 + 1) = v17;
  return result;
}

mach_o::Error *mach_o::Header::validSegment<segment_command,section>@<X0>(mach_o::Policy *this@<X1>, uint64_t a2@<X0>, unint64_t a3@<X2>, uint64_t a4@<X3>, mach_o::Error *a5@<X8>)
{
  int v7 = *(_DWORD *)(a4 + 32);
  unsigned int v8 = *(_DWORD *)(a4 + 36);
  BOOL v9 = __CFADD__(v7, v8);
  unint64_t v10 = v7 + v8;
  if (v9 || v10 > a3) {
    return mach_o::Error::Error(a5, "segment '%s' load command content extends beyond end of file");
  }
  unsigned int v13 = *(_DWORD *)(a2 + 12);
  if (v13 != 1)
  {
    unsigned int v14 = *(_DWORD *)(a4 + 28);
    if (v8 > v14 && (v14 || (*(unsigned char *)(a4 + 52) & 4) == 0)) {
      return mach_o::Error::Error(a5, "segment '%s' filesize exceeds vmsize");
    }
  }
  if (*(_DWORD *)(a4 + 44) >= 8u) {
    return mach_o::Error::Error(a5, "%s segment permissions has invalid bits set (0x%08X)");
  }
  if (v13 <= 8
    && ((1 << v13) & 0x144) != 0
    && (*(unsigned char *)(a2 + 24) & 4) != 0
    && mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(this)
    && !strcmp((const char *)(a4 + 8), "__TEXT")
    && *(_DWORD *)(a4 + 44) != 5)
  {
    uint64_t v19 = "__TEXT segment permissions is not 'r-x'";
    goto LABEL_49;
  }
  double result = (mach_o::Error *)mach_o::Policy::enforceReadOnlyLinkedit(this);
  if (result)
  {
    double result = (mach_o::Error *)strcmp((const char *)(a4 + 8), "__LINKEDIT");
    if (!result && *(_DWORD *)(a4 + 44) != 1)
    {
      uint64_t v19 = "__LINKEDIT segment permissions is not 'r--'";
      goto LABEL_49;
    }
  }
  if (*(_DWORD *)(a2 + 12) != 9)
  {
    double result = (mach_o::Error *)mach_o::Policy::enforceDataSegmentPermissions(this);
    if (result)
    {
      if (!strcmp((const char *)(a4 + 8), "__DATA") && *(_DWORD *)(a4 + 44) != 3)
      {
        uint64_t v19 = "__DATA segment permissions is not 'rw-'";
      }
      else
      {
        double result = (mach_o::Error *)strcmp((const char *)(a4 + 8), "__DATA_CONST");
        if (result) {
          goto LABEL_24;
        }
        if (*(_DWORD *)(a4 + 44) == 3)
        {
          if ((*(unsigned char *)(a4 + 52) & 0x10) == 0)
          {
            if ((v21 = 0, int v20 = *(_DWORD *)(a2 + 12), v20 != 9) && v20 != 6
              || (double result = (mach_o::Error *)mach_o::Header::hasSplitSegInfo((mach_o::Header *)a2, &v21), !result)
              || v21)
            {
              if ((*(_DWORD *)(a2 + 24) & 0x80000000) == 0) {
                return mach_o::Error::Error(a5, "__DATA_CONST segment missing SG_READ_ONLY flag");
              }
            }
          }
          goto LABEL_24;
        }
        uint64_t v19 = "__DATA_CONST segment permissions is not 'rw-'";
      }
LABEL_49:
      return mach_o::Error::Error(a5, v19);
    }
  }
LABEL_24:
  if (__CFADD__(*(_DWORD *)(a4 + 24), *(_DWORD *)(a4 + 28))) {
    return mach_o::Error::Error(a5, "'%s' segment vm range wraps");
  }
  if (*(_DWORD *)(a2 + 12) == 9 || (unsigned int v16 = *(_DWORD *)(a4 + 48)) == 0)
  {
LABEL_35:
    *(void *)a5 = 0;
  }
  else
  {
    unint64_t v17 = a4 + 56;
    unint64_t v18 = a4 + 56 + 68 * v16;
    while (1)
    {
      if (*(_DWORD *)(v17 + 32) < *(_DWORD *)(a4 + 24)) {
        return mach_o::Error::Error(a5, "section '%s' start address 0x%lX is before containing segment's address 0x%0lX");
      }
      double result = (mach_o::Error *)mach_o::Policy::enforceSectionsInSegment(this);
      if (result)
      {
        if (*(_DWORD *)(v17 + 36) + *(_DWORD *)(v17 + 32) > (*(_DWORD *)(a4 + 28) + *(_DWORD *)(a4 + 24))) {
          return mach_o::Error::Error(a5, "section '%s' end address 0x%lX is beyond containing segment's end address 0x%0lX");
        }
      }
      v17 += 68;
      if (v17 >= v18) {
        goto LABEL_35;
      }
    }
  }
  return result;
}

uint64_t dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::operator[](uint64_t a1, unint64_t a2)
{
  kern_return_t v13;
  unint64_t v14;
  char v16[256];
  uint64_t v17;

  unint64_t v17 = *MEMORY[0x1E4F14BF8];
  unint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = a2 + 1;
  if (v4 <= a2 && v4 != v5)
  {
    if (v4 <= v5)
    {
      unint64_t v7 = *(void *)(a1 + 8);
      if (v7 < v5)
      {
        uint64_t v8 = *(void *)(a1 + 24);
        uint64_t v9 = *(void *)(a1 + 32);
        unint64_t v10 = 2 * v7;
        if (v10 <= v5) {
          unint64_t v10 = a2 + 1;
        }
        vm_size_t v11 = (*MEMORY[0x1E4F14C80] + 40 * v10 - 1) & -*MEMORY[0x1E4F14C80];
        *(void *)(a1 + 32) = v11;
        uint64_t v12 = (unsigned int *)MEMORY[0x1E4F14C48];
        unsigned int v13 = vm_allocate(*MEMORY[0x1E4F14C48], (vm_address_t *)(a1 + 24), v11, 1006632961);
        if (v13) {
          dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back(v16, (void *)(a1 + 32), v13);
        }
        memcpy(*(void **)(a1 + 24), *(const void **)a1, 40 * *(void *)(a1 + 16));
        unsigned int v14 = *(void *)(a1 + 32) / 0x28uLL;
        *(void *)a1 = *(void *)(a1 + 24);
        *(void *)(a1 + 8) = v14;
        if (v8) {
          MEMORY[0x1AD11BB30](*v12, v8, v9);
        }
      }
    }
    *(void *)(a1 + 16) = v5;
  }
  return *(void *)a1 + 40 * a2;
}

void ___ZNK6mach_o6Header18validSemanticsMainERKNS_6PolicyE_block_invoke(void *a1, _DWORD *a2)
{
  if (*a2 == 5)
  {
    unint64_t v5 = (mach_o::Header *)a1[8];
    uint64_t v6 = *(void *)(a1[6] + 8);
    if (*(void *)(v6 + 24))
    {
      mach_o::Error::Error((mach_o::Error *)&v7, "multiple LC_UNIXTHREAD load commands");
      mach_o::Error::operator=((void *)(*(void *)(a1[5] + 8) + 40), &v7);
      mach_o::Error::~Error((mach_o::Error *)&v7);
      uint64_t v6 = *(void *)(a1[6] + 8);
    }
    *(void *)(v6 + 24) = a2;
    if ((mach_o::Header::entryAddrFromThreadCmd(v5, *(const thread_command **)(*(void *)(a1[6] + 8) + 24), (unint64_t *)(*(void *)(a1[7] + 8) + 24)) & 1) == 0)
    {
      mach_o::Error::Error((mach_o::Error *)&v7, "invalid LC_UNIXTHREAD");
      mach_o::Error::operator=((void *)(*(void *)(a1[5] + 8) + 40), &v7);
      mach_o::Error::~Error((mach_o::Error *)&v7);
    }
  }
  else if (*a2 == -2147483608)
  {
    uint64_t v4 = *(void *)(a1[4] + 8);
    if (*(void *)(v4 + 24))
    {
      mach_o::Error::Error((mach_o::Error *)&v7, "multiple LC_MAIN load commands");
      mach_o::Error::operator=((void *)(*(void *)(a1[5] + 8) + 40), &v7);
      mach_o::Error::~Error((mach_o::Error *)&v7);
      uint64_t v4 = *(void *)(a1[4] + 8);
    }
    *(void *)(v4 + 24) = a2;
  }
}

uint64_t mach_o::Header::entryAddrFromThreadCmd(mach_o::Header *this, const thread_command *a2, unint64_t *a3)
{
  uint64_t result = 0;
  uint32_t cmd = a2[1].cmd;
  int v6 = *((_DWORD *)this + 1);
  if (v6 > 16777222)
  {
    if (v6 == 16777223)
    {
      if (cmd == 4)
      {
        unint64_t cmdsize = (unint64_t)a2[18];
        goto LABEL_14;
      }
    }
    else
    {
      if (v6 != 16777228) {
        return result;
      }
      if (cmd == 6)
      {
        unint64_t cmdsize = (unint64_t)a2[34];
        goto LABEL_14;
      }
    }
    return 0;
  }
  if (v6 == 7)
  {
    if (cmd == 1)
    {
      unint64_t cmdsize = a2[7].cmd;
      goto LABEL_14;
    }
    return 0;
  }
  if (v6 != 12) {
    return result;
  }
  if (cmd != 1) {
    return 0;
  }
  unint64_t cmdsize = a2[9].cmdsize;
LABEL_14:
  *a3 = cmdsize;
  return 1;
}

void ___ZNK6mach_o6Header27validSemanticsLinkerOptionsERKNS_6PolicyE_block_invoke(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  if (*a2 == 45)
  {
    int v3 = a2[2];
    if (v3)
    {
      int v6 = (char *)a2 + a2[1];
      uint64_t v7 = (const char *)(a2 + 3);
      while (1)
      {
        v7 += strlen(v7) + 1;
        if (v7 > v6) {
          break;
        }
        if (!--v3) {
          return;
        }
      }
      mach_o::Error::Error((mach_o::Error *)&v8, "malformed LC_LINKER_OPTION command");
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v8);
      mach_o::Error::~Error((mach_o::Error *)&v8);
      *a3 = 1;
    }
  }
}

uint64_t ___ZNK6mach_o6Header26forEachPlatformLoadCommandEU13block_pointerFvNS_8PlatformENS_9Version32ES2_E_block_invoke(uint64_t result, int *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = *(void *)(result + 48);
  int v5 = *a2;
  if (*a2 <= 46)
  {
    if (v5 == 36)
    {
      uint64_t v11 = a2[2];
      unsigned int v12 = a2[3];
      if (v12) {
        uint64_t v13 = v12;
      }
      else {
        uint64_t v13 = v11;
      }
      uint64_t v14 = *(void *)(result + 32);
      uint64_t v21 = 0x1F03D8D98;
      uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v14 + 16))(v14, &v21, v11, v13);
    }
    else
    {
      if (v5 != 37) {
        return result;
      }
      uint64_t v7 = *(void *)(result + 32);
      if ((*(_DWORD *)(v4 + 4) | 0x1000000) == 0x1000007)
      {
        uint64_t v20 = 0x1F03D8FC8;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v7 + 16))(v7, &v20, a2[2], a2[3]);
      }
      else
      {
        uint64_t v19 = 0x1F03D8D28;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v7 + 16))(v7, &v19, a2[2], a2[3]);
      }
    }
  }
  else
  {
    switch(v5)
    {
      case '/':
        uint64_t v8 = *(void *)(result + 32);
        if (*(_DWORD *)(v4 + 4) == 16777223)
        {
          uint64_t v18 = 0x1F03D9070;
          uint64_t v9 = &v18;
        }
        else
        {
          uint64_t v17 = 0x1F03D8D60;
          uint64_t v9 = &v17;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v8 + 16))(v8, v9, a2[2], a2[3]);
        break;
      case '0':
        uint64_t v10 = *(void *)(result + 32);
        if ((*(_DWORD *)(v4 + 4) | 0x1000000) == 0x1000007)
        {
          uint64_t v16 = 0x1F03D9230;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v10 + 16))(v10, &v16, a2[2], a2[3]);
        }
        else
        {
          uint64_t v15 = 0x1F03D8E08;
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *, void, void))(v10 + 16))(v10, &v15, a2[2], a2[3]);
        }
        break;
      case '2':
        uint64_t v6 = *(void *)(result + 32);
        mach_o::Platform::Platform((mach_o::Platform *)v22, a2[2]);
        uint64_t result = (*(uint64_t (**)(uint64_t, char *, void, void))(v6 + 16))(v6, v22, a2[3], a2[4]);
        break;
      default:
        return result;
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = 1;
  return result;
}

uint64_t ___ZNK6mach_o6Header16builtForPlatformENS_8PlatformEb_block_invoke(uint64_t result, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) |= *a2 == *(void *)(result + 40);
  return result;
}

uint64_t __copy_helper_block_8_40c22_ZTSN6mach_o8PlatformE(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  return result;
}

void mach_o::Header::forEachSection(mach_o::Error *a1, uint64_t a2)
{
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2000000000;
  int v4 = 0;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZNK6mach_o6Header14forEachSectionEU13block_pointerFvRKNS0_11SectionInfoERbE_block_invoke;
  v2[3] = &unk_1E5E6C708;
  v2[4] = a2;
  void v2[5] = v3;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v5);
  mach_o::Error::~Error((mach_o::Error *)v5);
  _Block_object_dispose(v3, 8);
}

BOOL std::string_view::starts_with[abi:nn180100](void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  return a1[1] >= v4 && std::string_view::compare[abi:nn180100](a1, 0, v4, __s, v4) == 0;
}

uint64_t mach_o::Header::getDylibInstallName(mach_o::Error *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F14BE8];
  v6[1] = 0x40000000;
  v6[2] = ___ZNK6mach_o6Header19getDylibInstallNameEPPKcPNS_9Version32ES5__block_invoke;
  void v6[3] = &unk_1E5E6C508;
  void v6[6] = a4;
  v6[7] = a2;
  v6[4] = &v7;
  void v6[5] = a3;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v6, (mach_o::Error *)v11);
  mach_o::Error::~Error((mach_o::Error *)v11);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t ___ZNK6mach_o6Header19getDylibInstallNameEPPKcPNS_9Version32ES5__block_invoke(uint64_t result, _DWORD *a2, unsigned char *a3)
{
  if (*a2 == 13)
  {
    uint64_t v3 = *(_DWORD **)(result + 48);
    **(_DWORD **)(result + 40) = a2[5];
    *uint64_t v3 = a2[4];
    **(void **)(result + 56) = (char *)a2 + a2[2];
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t mach_o::Header::linkedDylibLoadPath(mach_o::Header *this, int a2)
{
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2000000000;
  int v11 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  v4[0] = MEMORY[0x1E4F14BE8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK6mach_o6Header19linkedDylibLoadPathEj_block_invoke;
  void v4[3] = &unk_1E5E6C530;
  int v5 = a2;
  v4[4] = v10;
  void v4[5] = &v6;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v4, (mach_o::Error *)v12);
  mach_o::Error::~Error((mach_o::Error *)v12);
  uint64_t v2 = v7[3];
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);
  return v2;
}

uint64_t ___ZNK6mach_o6Header19linkedDylibLoadPathEj_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 + 2147483624) <= 0xB && ((1 << (*a2 - 24)) & 0x881) != 0 || *a2 == 12)
  {
    uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
    int v5 = *(_DWORD *)(v4 + 24);
    if (v5 == *(_DWORD *)(result + 48))
    {
      *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = (char *)a2 + a2[2];
      uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
      int v5 = *(_DWORD *)(v4 + 24);
    }
    *(_DWORD *)(v4 + 24) = v5 + 1;
  }
  return result;
}

uint64_t mach_o::Header::linkedDylibCount(mach_o::Header *this, BOOL *a2)
{
  if (a2) {
    *a2 = 1;
  }
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F14BE8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK6mach_o6Header16linkedDylibCountEPb_block_invoke;
  void v4[3] = &unk_1E5E6C558;
  v4[4] = &v5;
  void v4[5] = a2;
  mach_o::Header::forEachLinkedDylib(this, (uint64_t)v4);
  uint64_t v2 = *((unsigned int *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void mach_o::Header::forEachLinkedDylib(mach_o::Error *a1, uint64_t a2)
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2000000000;
  int v6 = 0;
  v3[0] = 0;
  v3[1] = v3;
  v3[2] = 0x2000000000;
  char v4 = 0;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZNK6mach_o6Header18forEachLinkedDylibEU13block_pointerFvPKcNS_21LinkedDylibAttributesENS_9Version32ES4_RbE_block_invoke;
  v2[3] = &unk_1E5E6C580;
  v2[4] = a2;
  void v2[5] = v5;
  void v2[6] = v3;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v7);
  mach_o::Error::~Error((mach_o::Error *)v7);
  _Block_object_dispose(v3, 8);
  _Block_object_dispose(v5, 8);
}

uint64_t ___ZNK6mach_o6Header16linkedDylibCountEPb_block_invoke(uint64_t result, uint64_t a2, char a3)
{
  uint64_t v3 = *(unsigned char **)(result + 40);
  if (v3) {
    BOOL v4 = a3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    *uint64_t v3 = 0;
  }
  ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  return result;
}

uint64_t mach_o::Header::loadCommandToDylibKind(mach_o::Header *this, const dylib_command *a2)
{
  if (*((_DWORD *)this + 3) == 443815936 && *((_DWORD *)this + 2) == 28) {
    return *((unsigned int *)this + 6);
  }
  int v3 = *(_DWORD *)this;
  if (*(int *)this > -2147483614)
  {
    if (v3 == -2147483613)
    {
      return 4;
    }
    else
    {
      if (v3 != 12) {
        goto LABEL_14;
      }
      return 0;
    }
  }
  else
  {
    if (v3 != -2147483624)
    {
      if (v3 == -2147483617) {
        return 2;
      }
LABEL_14:
      mach_o::Header::loadCommandToDylibKind();
    }
    return 1;
  }
}

uint64_t ___ZNK6mach_o6Header18forEachLinkedDylibEU13block_pointerFvPKcNS_21LinkedDylibAttributesENS_9Version32ES4_RbE_block_invoke(uint64_t result, mach_o::Header *this, unsigned char *a3)
{
  if ((*(_DWORD *)this + 2147483624) <= 0xB && ((1 << (*(_DWORD *)this - 24)) & 0x881) != 0
    || *(_DWORD *)this == 12)
  {
    uint64_t v7 = result;
    int v8 = (char *)this + *((unsigned int *)this + 2);
    uint64_t v9 = *(void *)(result + 32);
    unsigned __int8 CommandToDylibKind = mach_o::Header::loadCommandToDylibKind(this, (const dylib_command *)this);
    uint64_t result = (*(uint64_t (**)(uint64_t, char *, void, void, void, unsigned char *))(v9 + 16))(v9, v8, CommandToDylibKind, *((unsigned int *)this + 5), *((unsigned int *)this + 4), a3);
    ++*(_DWORD *)(*(void *)(*(void *)(v7 + 40) + 8) + 24);
    if (*a3) {
      *(unsigned char *)(*(void *)(*(void *)(v7 + 48) + 8) + 24) = 1;
    }
  }
  return result;
}

uint64_t mach_o::Header::preferredLoadAddress(mach_o::Header *this)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x1E4F14BE8];
  v3[1] = 0x40000000;
  v3[2] = ___ZNK6mach_o6Header20preferredLoadAddressEv_block_invoke;
  void v3[3] = &unk_1E5E6C5F8;
  v3[4] = &v4;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v3, (mach_o::Error *)v8);
  mach_o::Error::~Error((mach_o::Error *)v8);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t mach_o::Header::hasCodeSignature(mach_o::Header *this, unsigned int *a2, unsigned int *a3)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F14BE8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK6mach_o6Header16hasCodeSignatureERjS1__block_invoke;
  void v5[3] = &unk_1E5E6C5A8;
  v5[5] = a2;
  void v5[6] = a3;
  v5[4] = &v6;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v5, (mach_o::Error *)v10);
  mach_o::Error::~Error((mach_o::Error *)v10);
  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t ___ZNK6mach_o6Header16hasCodeSignatureERjS1__block_invoke(uint64_t result, _DWORD *a2, unsigned char *a3)
{
  if (*a2 == 29)
  {
    uint64_t v3 = *(_DWORD **)(result + 48);
    **(_DWORD **)(result + 40) = a2[2];
    *uint64_t v3 = a2[3];
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t mach_o::Header::hasSplitSegInfo(mach_o::Header *this, BOOL *a2)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2000000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F14BE8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK6mach_o6Header15hasSplitSegInfoERb_block_invoke;
  void v4[3] = &unk_1E5E6C5D0;
  v4[4] = &v5;
  void v4[5] = a2;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v4, (mach_o::Error *)v9);
  mach_o::Error::~Error((mach_o::Error *)v9);
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t ___ZNK6mach_o6Header15hasSplitSegInfoERb_block_invoke(uint64_t result, _DWORD *a2, unsigned char *a3)
{
  if (*a2 == 30)
  {
    **(unsigned char **)(result + 40) = a2[3] == 0;
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

const char *mach_o::Header::libOrdinalName(mach_o::Header *this, int a2)
{
  if ((a2 + 3) < 4) {
    return off_1E5E6C778[a2 + 3];
  }
  int v3 = a2 - 1;
  if (a2 < 1 || mach_o::Header::linkedDylibCount(this, 0) < a2) {
    return "<invalid-lib-ordinal>";
  }
  Path = (const char *)mach_o::Header::linkedDylibLoadPath(this, v3);
  uint64_t v2 = Path;
  if (Path) {
    strlen(Path);
  }
  return v2;
}

uint64_t ___ZNK6mach_o6Header20preferredLoadAddressEv_block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t result = strcmp((const char *)(a2 + 8), "__TEXT");
    if (result) {
      return result;
    }
    uint64_t v6 = *(unsigned int *)(a2 + 24);
    goto LABEL_7;
  }
  if (*(_DWORD *)a2 == 25)
  {
    uint64_t result = strcmp((const char *)(a2 + 8), "__TEXT");
    if (!result)
    {
      uint64_t v6 = *(void *)(a2 + 24);
LABEL_7:
      *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = v6;
      *a3 = 1;
    }
  }
  return result;
}

uint64_t mach_o::Header::getSlide(mach_o::Header *this)
{
  return (uint64_t)this - mach_o::Header::preferredLoadAddress(this);
}

void mach_o::Header::forEachSegment(mach_o::Error *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZNK6mach_o6Header14forEachSegmentEU13block_pointerFvRKNS0_11SegmentInfoERbE_block_invoke;
  v2[3] = &unk_1E5E6C6E0;
  v2[4] = a2;
  mach_o::Header::forEachLoadCommand(a1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

char *mach_o::Header::name16(mach_o::Header *this, const char *a2)
{
  uint64_t v2 = this;
  if (strnlen((const char *)this, 0x10uLL) >= 0x10)
  {
    uint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = mach_o::Header::name16(char const*)::knownName16s[v3];
      if (*(void *)v2 == *(void *)v4 && *((void *)v2 + 1) == *((void *)v4 + 1)) {
        break;
      }
      if (++v3 == 24)
      {
        uint64_t v6 = malloc_type_malloc(0x11uLL, 0xAFF771EEuLL);
        *(_OWORD *)uint64_t v6 = *(_OWORD *)v2;
        v6[16] = 0;
        return v6;
      }
    }
    return mach_o::Header::name16(char const*)::knownName16s[v3];
  }
  return (char *)v2;
}

uint64_t ___ZNK6mach_o6Header14forEachSegmentEU13block_pointerFvRKNS0_11SegmentInfoERbE_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    int v11 = mach_o::Header::name16((mach_o::Header *)(a2 + 8), (const char *)a2);
    uint64_t v12 = *(void *)(a2 + 24);
    int32x2_t v13 = *(int32x2_t *)(a2 + 32);
    *(void *)&long long v14 = v12;
    *((void *)&v14 + 1) = HIDWORD(v12);
    long long v18 = v14;
    uint64_t v16 = v11;
    uint64_t v17 = v15;
    int32x2_t v19 = v13;
    int v20 = *(_DWORD *)(a2 + 52);
    int v10 = *(_DWORD *)(a2 + 44);
  }
  else
  {
    if (*(_DWORD *)a2 != 25) {
      return result;
    }
    uint64_t v16 = mach_o::Header::name16((mach_o::Header *)(a2 + 8), (const char *)a2);
    uint64_t v17 = v6;
    long long v18 = *(_OWORD *)(a2 + 24);
    int32x2_t v19 = vmovn_s64(*(int64x2_t *)(a2 + 40));
    int v20 = *(_DWORD *)(a2 + 68);
    int v10 = *(_DWORD *)(a2 + 60);
  }
  char v21 = v10;
  return (*(uint64_t (**)(void, char **, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 + 32) + 16))(*(void *)(v5 + 32), &v16, a3, v7, v8, v9);
}

uint64_t ___ZNK6mach_o6Header14forEachSectionEU13block_pointerFvRKNS0_11SectionInfoERbE_block_invoke(uint64_t result, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    unsigned int v16 = *(_DWORD *)(a2 + 48);
    if (*a3) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v16 == 0;
    }
    if (!v17)
    {
      unint64_t v18 = a2 + 56;
      unint64_t v19 = a2 + 56 + 68 * v16;
      do
      {
        uint64_t v29 = mach_o::Header::name16((mach_o::Header *)v18, (const char *)a2);
        uint64_t v30 = v20;
        uint64_t v31 = mach_o::Header::name16((mach_o::Header *)(v18 + 16), v20);
        uint64_t v32 = v21;
        uint64_t v22 = *(void *)(v5 + 32);
        int v23 = *(_DWORD *)(a2 + 44);
        int v33 = *(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8) + 24);
        int v34 = v23;
        int v25 = *(_DWORD *)(v18 + 40);
        int v24 = *(_DWORD *)(v18 + 44);
        int v35 = *(_DWORD *)(v18 + 56);
        int v36 = v24;
        uint64_t v26 = *(void *)(v18 + 32);
        *(void *)&long long v27 = v26;
        *((void *)&v27 + 1) = HIDWORD(v26);
        long long v37 = v27;
        int v38 = v25;
        *(void *)&long long v28 = *(void *)(v18 + 48);
        *((void *)&v28 + 1) = *(void *)(v18 + 60);
        long long v39 = v28;
        uint64_t result = (*(uint64_t (**)(void))(v22 + 16))();
        if (*a3) {
          break;
        }
        v18 += 68;
      }
      while (v18 < v19);
    }
  }
  else
  {
    if (*(_DWORD *)a2 != 25) {
      return result;
    }
    if (!*a3)
    {
      unsigned int v6 = *(_DWORD *)(a2 + 64);
      if (v6)
      {
        unint64_t v7 = a2 + 72;
        unint64_t v8 = a2 + 72 + 80 * v6;
        do
        {
          uint64_t v29 = mach_o::Header::name16((mach_o::Header *)v7, (const char *)a2);
          uint64_t v30 = v9;
          uint64_t v31 = mach_o::Header::name16((mach_o::Header *)(v7 + 16), v9);
          uint64_t v32 = v10;
          uint64_t v11 = *(void *)(v5 + 32);
          int v12 = *(_DWORD *)(a2 + 60);
          int v33 = *(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8) + 24);
          int v34 = v12;
          int v14 = *(_DWORD *)(v7 + 48);
          int v13 = *(_DWORD *)(v7 + 52);
          int v35 = *(_DWORD *)(v7 + 64);
          int v36 = v13;
          long long v37 = *(_OWORD *)(v7 + 32);
          int v38 = v14;
          *(void *)&long long v15 = *(void *)(v7 + 56);
          *((void *)&v15 + 1) = *(void *)(v7 + 68);
          long long v39 = v15;
          uint64_t result = (*(uint64_t (**)(void))(v11 + 16))();
          if (*a3) {
            break;
          }
          v7 += 80;
        }
        while (v7 < v8);
      }
    }
  }
  ++*(_DWORD *)(*(void *)(*(void *)(v5 + 40) + 8) + 24);
  return result;
}

mach_o::Header *mach_o::Header::computeLinkEditBias(mach_o::Header *this, int a2)
{
  uint64_t v2 = this;
  if (a2) {
    return (mach_o::Header *)((char *)this + mach_o::Header::zerofillExpansionAmount(this));
  }
  return v2;
}

uint64_t mach_o::Header::zerofillExpansionAmount(mach_o::Header *this)
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  uint64_t v9 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2000000000;
  void v5[3] = 0;
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2000000000;
  void v4[3] = 0;
  v3[0] = MEMORY[0x1E4F14BE8];
  v3[1] = 0x40000000;
  v3[2] = ___ZNK6mach_o6Header23zerofillExpansionAmountEv_block_invoke;
  void v3[3] = &unk_1E5E6C730;
  v3[4] = v5;
  void v3[5] = v4;
  v3[6] = &v6;
  mach_o::Header::forEachLoadCommand(this, (uint64_t)v3, (mach_o::Error *)v10);
  mach_o::Error::~Error((mach_o::Error *)v10);
  uint64_t v1 = v7[3];
  _Block_object_dispose(v4, 8);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v6, 8);
  return v1;
}

BOOL mach_o::Header::hasZerofillExpansion(mach_o::Header *this)
{
  return mach_o::Header::zerofillExpansionAmount(this) != 0;
}

void *___ZNK6mach_o6Header23zerofillExpansionAmountEv_block_invoke(void *result, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t result = (void *)strcmp((const char *)(a2 + 8), "__TEXT");
    if (result)
    {
      uint64_t result = (void *)strcmp((const char *)(a2 + 8), "__LINKEDIT");
      if (result) {
        return result;
      }
      uint64_t v6 = *(void *)(*(void *)(v5[5] + 8) + 24)
         - (*(void *)(*(void *)(v5[4] + 8) + 24)
          + *(unsigned int *)(a2 + 32))
         + *(unsigned int *)(a2 + 24);
      goto LABEL_9;
    }
    *(void *)(*(void *)(v5[4] + 8) + 24) = *(unsigned int *)(a2 + 24);
    uint64_t v7 = *(unsigned int *)(a2 + 32);
  }
  else
  {
    if (*(_DWORD *)a2 != 25) {
      return result;
    }
    uint64_t result = (void *)strcmp((const char *)(a2 + 8), "__TEXT");
    if (result)
    {
      uint64_t result = (void *)strcmp((const char *)(a2 + 8), "__LINKEDIT");
      if (result) {
        return result;
      }
      uint64_t v6 = *(void *)(a2 + 24) - *(void *)(a2 + 40) - *(void *)(*(void *)(v5[4] + 8) + 24);
LABEL_9:
      *(void *)(*(void *)(v5[6] + 8) + 24) = v6;
      *a3 = 1;
      return result;
    }
    *(void *)(*(void *)(v5[4] + 8) + 24) = *(void *)(a2 + 24);
    uint64_t v7 = *(void *)(a2 + 40);
  }
  *(void *)(*(void *)(v5[5] + 8) + 24) = v7;
  return result;
}

uint64_t ___ZNK6mach_o6Header12forEachRPathEU13block_pointerFvPKcRbE_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 == -2147483620) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t std::string_view::compare[abi:nn180100](void *a1, unint64_t a2, size_t a3, void *__s2, size_t a5)
{
  unint64_t v5 = a1[1];
  BOOL v6 = v5 >= a2;
  size_t v7 = v5 - a2;
  if (!v6) {
    abort();
  }
  uint64_t v9 = (const void *)(*a1 + a2);
  if (v7 >= a3) {
    size_t v10 = a3;
  }
  else {
    size_t v10 = v7;
  }
  if (a5 >= v10) {
    size_t v11 = v10;
  }
  else {
    size_t v11 = a5;
  }
  LODWORD(result) = memcmp(v9, __s2, v11);
  if (v10 < a5) {
    unsigned int v13 = -1;
  }
  else {
    unsigned int v13 = 1;
  }
  if (v10 == a5) {
    unsigned int v13 = 0;
  }
  if (result) {
    return result;
  }
  else {
    return v13;
  }
}

uint64_t mach_o::Symbol::makeRegularExport@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, int a7@<W6>, uint64_t a8@<X8>)
{
  *(void *)a8 = result;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 31) = 0;
  *(unsigned char *)(a8 + 33) = a4;
  if (a7) {
    char v8 = 5;
  }
  else {
    char v8 = 4;
  }
  *(unsigned char *)(a8 + 34) = v8;
  *(void *)(a8 + 16) = a3;
  *(void *)(a8 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_8:
    *(unsigned char *)(a8 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a8 + 36) = 1;
  if (a6) {
    goto LABEL_8;
  }
  return result;
}

uint64_t mach_o::Symbol::makeRegularHidden@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0;
  *(unsigned char *)(a7 + 33) = a4;
  *(unsigned char *)(a7 + 34) = 2;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a7 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeRegularLocal@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0;
  *(unsigned char *)(a7 + 33) = a4;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a7 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeRegularWasPrivateExtern@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0;
  *(unsigned char *)(a7 + 33) = a4;
  *(unsigned char *)(a7 + 34) = 1;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a7 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeWeakDefExport@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0;
  *(unsigned char *)(a7 + 33) = a4;
  *(_WORD *)(a7 + 34) = 260;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a7 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeWeakDefAutoHide@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0;
  *(unsigned char *)(a7 + 33) = a4;
  *(_WORD *)(a7 + 34) = 259;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a7 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeWeakDefHidden@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0;
  *(unsigned char *)(a7 + 33) = a4;
  *(_WORD *)(a7 + 34) = 258;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a7 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeWeakDefWasPrivateExtern@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0;
  *(unsigned char *)(a7 + 33) = a4;
  *(_WORD *)(a7 + 34) = 257;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a7 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeAltEntry@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, int a6@<W5>, int a7@<W6>, char a8@<W7>, uint64_t a9@<X8>)
{
  *(void *)a9 = result;
  *(void *)(a9 + 8) = a2;
  *(void *)(a9 + 31) = 0;
  *(unsigned char *)(a9 + 32) = 1;
  *(unsigned char *)(a9 + 33) = a4;
  *(unsigned char *)(a9 + 34) = a5;
  *(unsigned char *)(a9 + 35) = a8;
  *(void *)(a9 + 16) = a3;
  *(void *)(a9 + 24) = 0;
  if (!a6)
  {
    if (!a7) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a9 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a9 + 36) = 1;
  if (a7) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeDynamicResolver@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(_DWORD *)(a6 + 32) = 0;
  *(_DWORD *)(a6 + 35) = 0;
  *(unsigned char *)(a6 + 32) = 2;
  *(unsigned char *)(a6 + 34) = 4;
  *(unsigned char *)(a6 + 33) = a3;
  *(void *)(a6 + 16) = a5;
  *(void *)(a6 + 24) = a4;
  return result;
}

uint64_t mach_o::Symbol::makeThreadLocalExport@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, char a7@<W6>, uint64_t a8@<X8>)
{
  *(void *)a8 = result;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 31) = 0;
  *(unsigned char *)(a8 + 32) = 5;
  *(unsigned char *)(a8 + 34) = 4;
  *(unsigned char *)(a8 + 33) = a4;
  *(void *)(a8 + 16) = a3;
  *(void *)(a8 + 24) = 0;
  *(unsigned char *)(a8 + 35) = a7;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a8 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a8 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeAbsoluteExport@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 31) = 0;
  *(unsigned char *)(a5 + 32) = 3;
  *(unsigned char *)(a5 + 34) = 4;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = 0;
  if (a4) {
    *(unsigned char *)(a5 + 36) = 1;
  }
  return result;
}

uint64_t mach_o::Symbol::makeAbsoluteLocal@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 31) = 0;
  *(unsigned char *)(a5 + 32) = 3;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = 0;
  if (a4) {
    *(unsigned char *)(a5 + 36) = 1;
  }
  return result;
}

uint64_t mach_o::Symbol::makeReExport@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(void *)a6 = result;
  *(void *)(a6 + 8) = a2;
  *(_DWORD *)(a6 + 32) = 0;
  *(_DWORD *)(a6 + 35) = 0;
  *(unsigned char *)(a6 + 32) = 4;
  *(unsigned char *)(a6 + 34) = a5;
  *(void *)(a6 + 16) = a3;
  *(void *)(a6 + 24) = a4;
  return result;
}

uint64_t mach_o::Symbol::makeUndefined@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X8>)
{
  *(void *)a5 = result;
  *(void *)(a5 + 8) = a2;
  *(void *)(a5 + 31) = 0;
  *(unsigned char *)(a5 + 32) = 7;
  *(unsigned char *)(a5 + 34) = 4;
  *(void *)(a5 + 16) = a3;
  *(void *)(a5 + 24) = 0;
  *(unsigned char *)(a5 + 38) = a4;
  return result;
}

uint64_t mach_o::Symbol::makeTentativeDef@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0;
  *(unsigned char *)(a7 + 32) = 6;
  *(unsigned char *)(a7 + 34) = 4;
  *(unsigned char *)(a7 + 33) = a4;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a7 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::makeHiddenTentativeDef@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, int a5@<W4>, int a6@<W5>, uint64_t a7@<X8>)
{
  *(void *)a7 = result;
  *(void *)(a7 + 8) = a2;
  *(void *)(a7 + 31) = 0;
  *(unsigned char *)(a7 + 32) = 6;
  *(unsigned char *)(a7 + 34) = 2;
  *(unsigned char *)(a7 + 33) = a4;
  *(void *)(a7 + 16) = a3;
  *(void *)(a7 + 24) = 0;
  if (!a5)
  {
    if (!a6) {
      return result;
    }
LABEL_5:
    *(unsigned char *)(a7 + 37) = 1;
    return result;
  }
  *(unsigned char *)(a7 + 36) = 1;
  if (a6) {
    goto LABEL_5;
  }
  return result;
}

uint64_t mach_o::Symbol::implOffset(mach_o::Symbol *this)
{
  if (*((unsigned __int8 *)this + 32) - 3 <= 1) {
    mach_o::Symbol::implOffset();
  }
  return *((void *)this + 2);
}

BOOL mach_o::Symbol::isDynamicResolver(mach_o::Symbol *this, unint64_t *a2)
{
  int v2 = *((unsigned __int8 *)this + 32);
  if (v2 == 2) {
    *a2 = *((void *)this + 3);
  }
  return v2 == 2;
}

BOOL mach_o::Symbol::isReExport(mach_o::Symbol *this, int *a2, const char **a3)
{
  int v3 = *((unsigned __int8 *)this + 32);
  if (v3 == 4)
  {
    *a2 = *((void *)this + 2);
    uint64_t v4 = (const char *)*((void *)this + 3);
    if (!v4) {
      uint64_t v4 = *(const char **)this;
    }
    *a3 = v4;
  }
  return v3 == 4;
}

BOOL mach_o::Symbol::isAbsolute(mach_o::Symbol *this, unint64_t *a2)
{
  int v2 = *((unsigned __int8 *)this + 32);
  if (v2 == 3) {
    *a2 = *((void *)this + 2);
  }
  return v2 == 3;
}

void mach_o::GenericTrie::recurseTrie(uint64_t a1@<X0>, const unsigned __int8 **a2@<X1>, vm_address_t *a3@<X2>, BOOL *a4@<X3>, unsigned char *a5@<X4>, uint64_t a6@<X5>, mach_o::Error *a7@<X8>)
{
  int v35 = a2;
  uint64_t v9 = *(const unsigned __int8 ***)(a1 + 8);
  if (v9 > a2)
  {
    LODWORD(v12) = a4;
    unsigned __int8 v34 = 0;
    uint64_t v15 = mach_o::read_uleb128(&v35, v9, &v34, a4);
    if (v34)
    {
LABEL_3:
      mach_o::Error::Error(a7, "malformed uleb128", v32);
      return;
    }
    unsigned int v16 = (unsigned __int8 *)v35 + v15;
    if ((unint64_t)v35 + v15 > *(void *)(a1 + 8))
    {
      mach_o::Error::Error(a7, "malformed trie, terminalSize extends beyond trie data");
      return;
    }
    if (v15)
    {
      if (a6) {
        (*(void (**)(uint64_t, vm_address_t))(a6 + 16))(a6, *a3);
      }
      if (*a5)
      {
LABEL_20:
        *(void *)a7 = 0;
        return;
      }
      BOOL v17 = 1;
    }
    else
    {
      BOOL v17 = *a5 == 0;
    }
    unsigned int v19 = *v16;
    unsigned int v18 = v19;
    int v33 = (const unsigned __int8 **)(v16 + 1);
    if (v19) {
      BOOL v20 = !v17;
    }
    else {
      BOOL v20 = 1;
    }
    if (!v20)
    {
      unsigned int v21 = 0;
      vm_address_t v12 = (int)v12;
      vm_address_t v32 = (int)v12;
      while (1)
      {
        uint64_t v22 = v33;
        while (*(unsigned char *)v22)
        {
          vm_address_t v23 = v12 + 1;
          vm_address_t v24 = a3[2];
          if (v12 + 1 != v24)
          {
            if (v24 <= v23)
            {
              dyld3::OverflowSafeArray<char,4294967295ull>::reserve(a3, v12 + 1);
              uint64_t v22 = v33;
            }
            a3[2] = v23;
          }
          int v33 = (const unsigned __int8 **)((char *)v22 + 1);
          char v25 = *(unsigned char *)v22;
          *(unsigned char *)dyld3::OverflowSafeArray<char,4294967295ull>::operator[](a3, v12) = v25;
          uint64_t v22 = v33;
          ++v12;
          if ((unint64_t)v33 > *(void *)(a1 + 8))
          {
            mach_o::Error::Error(a7, "malformed trie node, child node name extends beyond trie data", v32);
            return;
          }
        }
        int v26 = v12 + 1;
        unint64_t v27 = a3[2];
        if (v27 != v12 + 1)
        {
          vm_address_t v28 = v26;
          if (v27 <= v26)
          {
            dyld3::OverflowSafeArray<char,4294967295ull>::reserve(a3, v26);
            uint64_t v22 = v33;
          }
          a3[2] = v28;
        }
        int v33 = (const unsigned __int8 **)((char *)v22 + 1);
        char v29 = *(unsigned char *)v22;
        *(unsigned char *)dyld3::OverflowSafeArray<char,4294967295ull>::operator[](a3, (int)v12) = v29;
        uint64_t v31 = mach_o::read_uleb128(&v33, *(const unsigned __int8 ***)(a1 + 8), &v34, v30);
        if (v34) {
          goto LABEL_3;
        }
        if (!v31)
        {
          mach_o::Error::Error(a7, "malformed trie, childNodeOffset==0", v32);
          return;
        }
        mach_o::GenericTrie::recurseTrie(a1, *(void *)a1 + v31, a3, v12, a5, a6);
        if (*(void *)a7) {
          return;
        }
        mach_o::Error::~Error(a7);
        ++v21;
        vm_address_t v12 = v32;
        if (v21 >= v18 || *a5) {
          goto LABEL_20;
        }
      }
    }
    goto LABEL_20;
  }

  mach_o::Error::Error(a7, "malformed trie, node past end");
}

void mach_o::GenericTrie::forEachEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = (const unsigned __int8 ***)MEMORY[0x1F41887A8](a1, a2, a3, a4);
  uint64_t v6 = v5;
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  size_t v7 = *v4;
  if (*v4 != v4[1])
  {
    char v14 = 0;
    v10[0] = (vm_address_t)&v15;
    v10[1] = 4096;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v11 = 0;
    v8[0] = MEMORY[0x1E4F14BE8];
    v8[1] = 0x40000000;
    v8[2] = ___ZNK6mach_o11GenericTrie12forEachEntryEU13block_pointerFvRKNS0_5EntryERbE_block_invoke;
    v8[3] = &unk_1E5E6C7A0;
    v8[4] = v6;
    mach_o::GenericTrie::recurseTrie((uint64_t)v4, v7, v10, 0, &v14, (uint64_t)v8, (mach_o::Error *)v9);
    mach_o::Error::~Error((mach_o::Error *)v9);
    uint64_t v11 = 0;
    if (v12) {
      MEMORY[0x1AD11BB30](*MEMORY[0x1E4F14C48], v12, v13);
    }
  }
}

uint64_t ___ZNK6mach_o11GenericTrie12forEachEntryEU13block_pointerFvRKNS0_5EntryERbE_block_invoke(uint64_t a1, char *__s, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v11[0] = __s;
  v11[1] = strlen(__s);
  v11[2] = a3;
  v11[3] = a4;
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v11, a5, v9);
}

vm_address_t dyld3::OverflowSafeArray<char,4294967295ull>::operator[](vm_address_t *address, vm_address_t a2)
{
  vm_address_t v4 = address[2];
  vm_address_t v5 = a2 + 1;
  if (v4 <= a2 && v4 != v5)
  {
    if (v4 <= v5) {
      dyld3::OverflowSafeArray<char,4294967295ull>::reserve(address, a2 + 1);
    }
    address[2] = v5;
  }
  return *address + a2;
}

mach_o::Error *mach_o::ExportsTrie::terminalPayloadToSymbol@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, BOOL *a3@<X3>, mach_o::Error *a4@<X8>)
{
  unsigned __int8 v36 = 0;
  uint64_t v7 = *(void *)(a1 + 24);
  int v35 = *(const unsigned __int8 ***)(a1 + 16);
  char v8 = (const unsigned __int8 **)((char *)v35 + v7);
  unint64_t v9 = mach_o::read_uleb128(&v35, (const unsigned __int8 **)((char *)v35 + v7), &v36, a3);
  if (v36) {
    return mach_o::Error::Error(a4, "malformed uleb128");
  }
  char v12 = v9;
  if (v9 < 0x40)
  {
    uint64_t v13 = mach_o::read_uleb128(&v35, v8, &v36, v10);
    if (!v36)
    {
      uint64_t v15 = v13;
      if ((v12 & 3) == 1)
      {
        BOOL v17 = *(const char **)a1;
        if (v17) {
          size_t v18 = strlen(v17);
        }
        else {
          size_t v18 = 0;
        }
        uint64_t result = (mach_o::Error *)mach_o::Symbol::makeThreadLocalExport((uint64_t)v17, v18, v15, 0, 0, 0, (v12 & 4) != 0, (uint64_t)&v33);
        goto LABEL_26;
      }
      if ((v12 & 3) == 2)
      {
        if (*(void *)a1) {
          size_t v16 = strlen(*(const char **)a1);
        }
        else {
          size_t v16 = 0;
        }
        uint64_t result = (mach_o::Error *)mach_o::Symbol::makeAbsoluteExport(*(void *)a1, v16, v15, 0, (uint64_t)&v33);
LABEL_26:
        long long v25 = *(_OWORD *)v34;
        *(_OWORD *)a2 = v33;
        *(_OWORD *)(a2 + 16) = v25;
        *(void *)(a2 + 31) = *(void *)&v34[15];
LABEL_27:
        *(void *)a4 = 0;
        return result;
      }
      if ((v12 & 8) != 0)
      {
        BOOL v20 = *(const char **)a1;
        unsigned int v21 = v35;
        if (*(unsigned char *)v35)
        {
          uint64_t v22 = (const unsigned __int8 **)((char *)v35 + 1);
          do
          {
            int v35 = v22;
            int v23 = *(unsigned __int8 *)v22;
            uint64_t v22 = (const unsigned __int8 **)((char *)v22 + 1);
          }
          while (v23);
          vm_address_t v24 = (const unsigned __int8 **)((char *)v22 - 1);
        }
        else
        {
          vm_address_t v24 = v35;
          unsigned int v21 = (const unsigned __int8 **)v20;
        }
        int v35 = (const unsigned __int8 **)((char *)v24 + 1);
        if (v20) {
          size_t v30 = strlen(v20);
        }
        else {
          size_t v30 = 0;
        }
        uint64_t result = (mach_o::Error *)mach_o::Symbol::makeReExport((uint64_t)v20, v30, v15, (uint64_t)v21, 4, (uint64_t)&v33);
        long long v31 = *(_OWORD *)v34;
        *(_OWORD *)a2 = v33;
        *(_OWORD *)(a2 + 16) = v31;
        *(void *)(a2 + 31) = *(void *)&v34[15];
        if ((v12 & 4) != 0) {
          *(unsigned char *)(a2 + 35) = 1;
        }
        goto LABEL_27;
      }
      if ((v12 & 0x10) == 0)
      {
        if ((v12 & 4) != 0)
        {
          if (*(void *)a1) {
            size_t v32 = strlen(*(const char **)a1);
          }
          else {
            size_t v32 = 0;
          }
          uint64_t result = (mach_o::Error *)mach_o::Symbol::makeWeakDefExport(*(void *)a1, v32, v15, 0, 0, 0, (uint64_t)&v33);
        }
        else
        {
          if (*(void *)a1) {
            size_t v19 = strlen(*(const char **)a1);
          }
          else {
            size_t v19 = 0;
          }
          uint64_t result = (mach_o::Error *)mach_o::Symbol::makeRegularExport(*(void *)a1, v19, v15, 0, 0, 0, 0, (uint64_t)&v33);
        }
        goto LABEL_26;
      }
      uint64_t v26 = mach_o::read_uleb128(&v35, v8, &v36, v14);
      if (!v36)
      {
        uint64_t v27 = v26;
        vm_address_t v28 = *(const char **)a1;
        if (v28) {
          size_t v29 = strlen(v28);
        }
        else {
          size_t v29 = 0;
        }
        uint64_t result = (mach_o::Error *)mach_o::Symbol::makeDynamicResolver((uint64_t)v28, v29, 1, v15, v27, (uint64_t)&v33);
        goto LABEL_26;
      }
    }
    return mach_o::Error::Error(a4, "malformed uleb128");
  }
  return mach_o::Error::Error(a4, "unknown exports flag bits");
}

void mach_o::ExportsTrie::forEachExportedSymbol(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[0] = MEMORY[0x1E4F14BE8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK6mach_o11ExportsTrie21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolERbE_block_invoke;
  void v4[3] = &unk_1E5E6C7C8;
  void v4[4] = a2;
  void v4[5] = a1;
  mach_o::GenericTrie::forEachEntry(a1, (uint64_t)v4, a3, a4);
}

void ___ZNK6mach_o11ExportsTrie21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolERbE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  v7[0] = "";
  v7[1] = 0;
  v7[2] = 0;
  v8[0] = 0;
  *(void *)((char *)v8 + 7) = 0;
  mach_o::ExportsTrie::terminalPayloadToSymbol(a2, (uint64_t)v7, a4, (mach_o::Error *)&v6);
  uint64_t v5 = v6;
  mach_o::Error::~Error((mach_o::Error *)&v6);
  if (!v5) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void mach_o::ExportsTrie::valid(mach_o::ExportsTrie *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  vm_address_t v4 = (const unsigned __int8 ***)MEMORY[0x1F41887A8](this, a2, a3, a4);
  uint64_t v7 = v6;
  char v8 = v5;
  uint64_t v25 = *MEMORY[0x1E4F14BF8];
  unint64_t v9 = *v4;
  if (*v4 == v4[1])
  {
    void *v5 = 0;
  }
  else
  {
    v20[0] = (vm_address_t)&v24;
    v20[1] = 4096;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    uint64_t v21 = 0;
    char v19 = 0;
    uint64_t v13 = 0;
    char v14 = &v13;
    uint64_t v15 = 0x3002000000;
    size_t v16 = __Block_byref_object_copy__1;
    BOOL v17 = __Block_byref_object_dispose__1;
    uint64_t v18 = 0;
    v11[0] = MEMORY[0x1E4F14BE8];
    v11[1] = 0x40000000;
    v11[2] = ___ZNK6mach_o11ExportsTrie5validEy_block_invoke;
    v11[3] = &unk_1E5E6C7F0;
    void v11[4] = &v13;
    v11[5] = v4;
    v11[6] = v7;
    mach_o::GenericTrie::recurseTrie((uint64_t)v4, v9, v20, 0, &v19, (uint64_t)v11, (mach_o::Error *)&v12);
    if (v12) {
      size_t v10 = &v12;
    }
    else {
      size_t v10 = v14 + 5;
    }
    mach_o::Error::Error(v8, v10);
    mach_o::Error::~Error((mach_o::Error *)&v12);
    _Block_object_dispose(&v13, 8);
    mach_o::Error::~Error((mach_o::Error *)&v18);
    uint64_t v21 = 0;
    if (v22) {
      MEMORY[0x1AD11BB30](*MEMORY[0x1E4F14C48], v22, v23);
    }
  }
}

void *__Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void ___ZNK6mach_o11ExportsTrie5validEy_block_invoke(uint64_t a1, char *__s, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  v16[0] = __s;
  v16[1] = strlen(__s);
  v16[2] = a3;
  v16[3] = a4;
  v14[0] = "";
  v14[1] = 0;
  v14[2] = 0;
  v15[0] = 0;
  *(void *)((char *)v15 + 7) = 0;
  mach_o::ExportsTrie::terminalPayloadToSymbol((uint64_t)v16, (uint64_t)v14, v9, (mach_o::Error *)&v13);
  if (v13)
  {
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v13);
    *a5 = 1;
    mach_o::Error::~Error((mach_o::Error *)&v13);
  }
  else
  {
    mach_o::Error::~Error((mach_o::Error *)&v13);
    unint64_t v13 = 0;
    int v12 = 0;
    uint64_t v11 = 0;
    if (!mach_o::Symbol::isAbsolute((mach_o::Symbol *)v14, &v13)
      && !mach_o::Symbol::isReExport((mach_o::Symbol *)v14, &v12, (const char **)&v11)
      && (unint64_t)mach_o::Symbol::implOffset((mach_o::Symbol *)v14) > *(void *)(a1 + 48))
    {
      mach_o::Error::Error((mach_o::Error *)&v10, "vmOffset too large for %s", v14[0]);
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v10);
      mach_o::Error::~Error((mach_o::Error *)&v10);
      *a5 = 1;
    }
  }
}

void *dyld3::OverflowSafeArray<char,4294967295ull>::reserve(void *address, unint64_t a2)
{
  kern_return_t v8;
  uint64_t v9;
  char v10[256];
  uint64_t v11;
  uint64_t vars8;

  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  unint64_t v2 = address[1];
  if (v2 < a2)
  {
    uint64_t v3 = (uint64_t)address;
    uint64_t v4 = address[3];
    uint64_t v5 = address + 4;
    unint64_t v6 = 2 * v2;
    if (v6 <= a2) {
      unint64_t v6 = a2;
    }
    vm_size_t v7 = (v6 + *MEMORY[0x1E4F14C80] - 1) & -*MEMORY[0x1E4F14C80];
    vm_size_t *v5 = v7;
    char v8 = vm_allocate(*MEMORY[0x1E4F14C48], address + 3, v7, 1006632961);
    if (v8) {
      dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back(v10, v5, v8);
    }
    address = memcpy(*(void **)(v3 + 24), *(const void **)v3, *(void *)(v3 + 16));
    unint64_t v9 = *(void *)(v3 + 32);
    *(void *)uint64_t v3 = *(void *)(v3 + 24);
    *(void *)(v3 + 8) = v9;
    if (v4)
    {
      JUMPOUT(0x1AD11BB30);
    }
  }
  return address;
}

void *mach_o::ChainedFixups::ChainedFixups(void *this, const dyld_chained_fixups_header *a2, uint64_t a3)
{
  *this = a2;
  this[1] = a3;
  return this;
}

void mach_o::ChainedFixups::forEachBindTarget(mach_o::Error *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZNK6mach_o13ChainedFixups17forEachBindTargetEU13block_pointerFvRKNS_5Fixup10BindTargetERbE_block_invoke;
  v2[3] = &unk_1E5E6C818;
  v2[4] = a2;
  mach_o::ChainedFixups::forEachBindTarget(a1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

mach_o::Error *mach_o::ChainedFixups::forEachBindTarget@<X0>(mach_o::Error *result@<X0>, uint64_t a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v4 = *(unsigned int **)result;
  unint64_t v5 = *((void *)result + 1);
  unint64_t v6 = *(unsigned int *)(*(void *)result + 8);
  if (v5 >= v6)
  {
    unint64_t v8 = v4[3];
    unint64_t v9 = v5 - v8;
    if (v5 < v8)
    {
      vm_size_t v7 = "malformed import table, symbols_offset too large";
      goto LABEL_5;
    }
    uint64_t v11 = result;
    int v12 = (char *)v4 + v8;
    char v31 = 0;
    unsigned int v13 = v4[5];
    switch(v13)
    {
      case 3u:
        if (v4[4])
        {
          uint64_t v19 = 0;
          BOOL v20 = (void *)((char *)v4 + v6 + 8);
          while (1)
          {
            unint64_t v21 = *(v20 - 1);
            if (HIDWORD(v21) > v9) {
              return mach_o::Error::Error(a3, "malformed import table, imports[%d].name_offset (%d) out of range");
            }
            uint64_t v22 = v20 + 2;
            if ((unsigned __int16)*(v20 - 1) <= 0xFFF0u) {
              uint64_t v23 = (unsigned __int16)*(v20 - 1);
            }
            else {
              uint64_t v23 = (__int16)v21;
            }
            uint64_t result = (mach_o::Error *)(*(uint64_t (**)(uint64_t, uint64_t, char *, void, unint64_t, char *))(a2 + 16))(a2, v23, &v12[HIDWORD(v21)], *v20, (v21 >> 16) & 1, &v31);
            BOOL v24 = ++v19 < (unint64_t)*(unsigned int *)(*(void *)v11 + 16) && v31 == 0;
            BOOL v20 = v22;
            if (!v24) {
              goto LABEL_43;
            }
          }
        }
        break;
      case 2u:
        if (v4[4])
        {
          uint64_t v25 = 0;
          uint64_t v26 = (int *)((char *)v4 + v6 + 4);
          while (1)
          {
            unint64_t v27 = *(v26 - 1);
            if (v9 < v27 >> 9) {
              return mach_o::Error::Error(a3, "malformed import table, imports[%d].name_offset (%d) out of range");
            }
            vm_address_t v28 = v26 + 2;
            if (*(v26 - 1) <= 0xF0u) {
              uint64_t v29 = *(v26 - 1);
            }
            else {
              uint64_t v29 = (char)v27;
            }
            uint64_t result = (mach_o::Error *)(*(uint64_t (**)(uint64_t, uint64_t, char *, void, void, char *))(a2 + 16))(a2, v29, &v12[v27 >> 9], *v26, (v27 >> 8) & 1, &v31);
            BOOL v30 = ++v25 < (unint64_t)*(unsigned int *)(*(void *)v11 + 16) && v31 == 0;
            uint64_t v26 = v28;
            if (!v30) {
              goto LABEL_43;
            }
          }
        }
        break;
      case 1u:
        if (v4[4])
        {
          uint64_t v14 = 0;
          uint64_t v15 = (char *)v4 + v6;
          while (1)
          {
            unint64_t v16 = *(unsigned int *)&v15[4 * v14];
            if (v9 < v16 >> 9) {
              return mach_o::Error::Error(a3, "malformed import table, imports[%d].name_offset (%d) out of range");
            }
            if (*(_DWORD *)&v15[4 * v14] <= 0xF0u) {
              uint64_t v17 = *(_DWORD *)&v15[4 * v14];
            }
            else {
              uint64_t v17 = (char)v16;
            }
            uint64_t result = (mach_o::Error *)(*(uint64_t (**)(uint64_t, uint64_t, char *, void, void, char *))(a2 + 16))(a2, v17, &v12[v16 >> 9], 0, (v16 >> 8) & 1, &v31);
            if (++v14 >= (unint64_t)*(unsigned int *)(*(void *)v11 + 16) || v31 != 0) {
              goto LABEL_43;
            }
          }
        }
        break;
      default:
        return mach_o::Error::Error(a3, "unknown imports format %d");
    }
LABEL_43:
    *(void *)a3 = 0;
    return result;
  }
  vm_size_t v7 = "malformed import table, imports_offset too large";
LABEL_5:

  return mach_o::Error::Error(a3, v7);
}

uint64_t ___ZNK6mach_o13ChainedFixups17forEachBindTargetEU13block_pointerFvRKNS_5Fixup10BindTargetERbE_block_invoke(uint64_t a1, int a2, char *__s, uint64_t a4, char a5, uint64_t a6)
{
  if (__s) {
    size_t v12 = strlen(__s);
  }
  else {
    size_t v12 = 0;
  }
  v14[0] = __s;
  v14[1] = v12;
  int v15 = a2;
  char v16 = a5;
  uint64_t v17 = a4;
  return (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v14, a6, a4);
}

uint64_t (***mach_o::ChainedFixups::PointerFormat::make(mach_o::ChainedFixups::PointerFormat *this))(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *__hidden this)
{
  if ((this - 2) > 0xA) {
    return mach_o::p1;
  }
  else {
    return off_1E5E6C838[(__int16)((_WORD)this - 2)];
  }
}

mach_o::Error *mach_o::ChainedFixups::valid@<X0>(unsigned int **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, mach_o::Error *a5@<X8>)
{
  unint64_t v6 = *a1;
  if (**a1) {
    return mach_o::Error::Error(a5, "chained fixups, unknown header version (%d)");
  }
  unint64_t v9 = v6[1];
  uint64_t v10 = a1[1];
  if ((unint64_t)v10 <= v9)
  {
    size_t v12 = "chained fixups, starts_offset exceeds LC_DYLD_CHAINED_FIXUPS size";
    goto LABEL_7;
  }
  unint64_t v11 = v6[2];
  if ((unint64_t)v10 < v11)
  {
    size_t v12 = "chained fixups, imports_offset exceeds LC_DYLD_CHAINED_FIXUPS size";
LABEL_7:
    return mach_o::Error::Error(a5, v12);
  }
  int v13 = v6[5] - 1;
  if (v13 >= 3) {
    return mach_o::Error::Error(a5, "chained fixups, unknown imports_format (%d)");
  }
  int v14 = v6[4] * dword_1ACF93AA0[v13];
  BOOL v15 = __CFADD__(v11, v14);
  unsigned int v16 = v11 + v14;
  if (v15 || v16 > v6[3])
  {
    size_t v12 = "chained fixups, imports array overlaps symbols";
    goto LABEL_7;
  }
  if (v6[6]) {
    return mach_o::Error::Error(a5, "chained fixups, symbols_format unknown (%d)");
  }
  BOOL v20 = (char *)v6 + v9;
  unint64_t v21 = *(unsigned int *)((char *)v6 + v9);
  if (a4 != v21)
  {
    if (a4 < v21)
    {
      size_t v12 = "chained fixups, seg_count exceeds number of segments";
      goto LABEL_7;
    }
    if (*(void *)(a3 + 56 * (a4 - 1) + 40) != 5
      || ((v44 = *(int **)(a3 + 56 * (a4 - 1) + 32), int v45 = *v44, v46 = *((unsigned __int8 *)v44 + 4), v45 == 1413701471)
        ? (BOOL v47 = v46 == 70)
        : (BOOL v47 = 0),
          !v47))
    {
      size_t v12 = "chained fixups, seg_count does not match number of segments";
      goto LABEL_7;
    }
  }
  if (!v21)
  {
    LOWORD(v32) = 0;
    unsigned int v23 = 0;
LABEL_61:
    int v48 = mach_o::ChainedFixups::PointerFormat::make((mach_o::ChainedFixups::PointerFormat *)(unsigned __int16)v32);
    uint64_t result = (mach_o::Error *)((uint64_t (*)(uint64_t (***)(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *__hidden), void))(*v48)[9])(v48, 0);
    if ((*a1)[4] >= result) {
      return mach_o::Error::Error(a5, "chained fixups, imports_count (%d) exceeds max of %d");
    }
    if (!v23) {
      goto LABEL_79;
    }
    unint64_t v49 = a4 - 1;
    if (*(void *)(a3 + 56 * (a4 - 1) + 40) == 10)
    {
      uint64_t v50 = *(void *)(a3 + 56 * v49 + 32);
      unint64_t v51 = 0x5F5F4C494E4B4544;
      unint64_t v52 = bswap64(*(void *)v50);
      if (v52 == 0x5F5F4C494E4B4544
        && (v52 = bswap32(*(unsigned __int16 *)(v50 + 8)) >> 16, unint64_t v51 = 18772, v52 == 18772))
      {
        int v53 = 0;
      }
      else if (v52 < v51)
      {
        int v53 = -1;
      }
      else
      {
        int v53 = 1;
      }
      BOOL v47 = v53 == 0;
      uint64_t v54 = -2;
      if (!v47) {
        uint64_t v54 = -1;
      }
      unint64_t v49 = v54 + a4;
    }
    if (*(void *)(a3 + 56 * v49) + a2 + *(void *)(a3 + 56 * v49 + 8) > (unint64_t)v23) {
      return mach_o::Error::Error(a5, "chained fixups, max_valid_pointer (0x%x) too small for image last vm address 0x%llx");
    }
LABEL_79:
    *(void *)a5 = 0;
    return result;
  }
  uint64_t v22 = 0;
  unsigned int v23 = 0;
  char v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = (char *)v6 + v11;
  uint64_t v27 = (uint64_t)v6 + v9 + 24;
  while (1)
  {
    uint64_t v28 = *(unsigned int *)&v20[4 * v22 + 4];
    if (v28) {
      break;
    }
    uint64_t v32 = v25;
LABEL_50:
    ++v22;
    uint64_t v25 = v32;
    if (v22 == v21) {
      goto LABEL_61;
    }
  }
  uint64_t v29 = &v20[v28];
  unint64_t v30 = *(unsigned int *)&v20[v28];
  if (v26 - &v20[v28] < (uint64_t)v30) {
    return mach_o::Error::Error(a5, "chained fixups, dyld_chained_starts_in_segment for segment #%d overruns imports table");
  }
  unsigned int v31 = *((unsigned __int16 *)v29 + 2);
  if (v31 != 4096 && v31 != 0x4000) {
    return mach_o::Error::Error(a5, "chained fixups, page_size not 4KB or 16KB in segment #%d");
  }
  uint64_t v32 = *((unsigned __int16 *)v29 + 3);
  if (v32 >= 0xE) {
    return mach_o::Error::Error(a5, "chained fixups, unknown pointer_format in segment #%d");
  }
  if (v24)
  {
    if (v32 != (unsigned __int16)v25) {
      return mach_o::Error::Error(a5, "chained fixups, pointer_format not same for all segments %d and %d");
    }
    uint64_t v32 = v25;
  }
  int v33 = *((_DWORD *)v29 + 4);
  if (v33)
  {
    if (v23)
    {
      if (v23 != v33)
      {
        size_t v12 = "chained fixups, different max_valid_pointer values seen in different segments";
        goto LABEL_7;
      }
    }
    else
    {
      unsigned int v23 = *((_DWORD *)v29 + 4);
    }
  }
  uint64_t v34 = *((unsigned __int16 *)v29 + 10);
  if (2 * v34 + 22 > v30)
  {
    size_t v12 = "chained fixups, page_start array overflows size";
    goto LABEL_7;
  }
  if (!*((_WORD *)v29 + 10))
  {
LABEL_49:
    char v24 = 1;
    goto LABEL_50;
  }
  uint64_t v35 = 0;
  unint64_t v36 = (v30 - 22) >> 1;
  uint64_t v37 = v27 + v28;
  while (1)
  {
    unsigned int v38 = *(unsigned __int16 *)&v29[2 * v35 + 22];
    if (v38 == 0xFFFF) {
      goto LABEL_40;
    }
    if ((v38 & 0x8000) != 0) {
      break;
    }
    if (v38 > v31) {
      return mach_o::Error::Error(a5, "chained fixups, in segment #%d page_start[%d]=0x%04X exceeds page size");
    }
LABEL_40:
    if (++v35 == v34) {
      goto LABEL_49;
    }
  }
  unsigned int v39 = 0;
  unint64_t v40 = v38 & 0x7FFF;
  uint64_t v41 = (__int16 *)(v37 + 2 * v40);
  while (1)
  {
    if (v40 > v36) {
      return mach_o::Error::Error(a5, "chain overflow index out of range %d (max=%d) in segment #%d");
    }
    unsigned int v42 = *(v41 - 1) & 0x7FFF;
    if (v42 > v31) {
      return mach_o::Error::Error(a5, "chained fixups, in segment #%d overflow page_start[%d]=0x%04X exceeds page size");
    }
    if (v39 && v42 <= v39) {
      return mach_o::Error::Error(a5, "chained fixups, in segment #%d overflow page_start[%d]=0x%04X is before previous at 0x%04X\n");
    }
    ++v40;
    int v43 = *v41++;
    unsigned int v39 = v42;
    if (v43 < 0) {
      goto LABEL_40;
    }
  }
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return 1;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return "DYLD_CHAINED_PTR_ARM64E";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return "authenticated arm64e, 8-byte stride, target vmadddr";
}

uint64_t mach_o::PointerFormat_Generic_arm64e::is64(mach_o::PointerFormat_Generic_arm64e *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_Generic_arm64e::supportsAuth(mach_o::PointerFormat_Generic_arm64e *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_Generic_arm64e::minNext(mach_o::PointerFormat_Generic_arm64e *this)
{
  return (*(uint64_t (**)(void))(*(void *)this + 120))();
}

uint64_t mach_o::PointerFormat_Generic_arm64e::maxNext(mach_o::PointerFormat_Generic_arm64e *this)
{
  return 2047 * (*(unsigned int (**)(mach_o::PointerFormat_Generic_arm64e *))(*(void *)this + 120))(this);
}

uint64_t mach_o::PointerFormat_Generic_arm64e::maxRebaseTargetOffset(mach_o::PointerFormat_Generic_arm64e *this, int a2)
{
  if (a2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0x7FFFFFFFFFFLL;
  }
}

uint64_t mach_o::PointerFormat_Generic_arm64e::supportsBinds(mach_o::PointerFormat_Generic_arm64e *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_Generic_arm64e::maxBindOrdinal(mach_o::PointerFormat_Generic_arm64e *this)
{
  return ~(-1 << (*(uint64_t (**)(mach_o::PointerFormat_Generic_arm64e *))(*(void *)this
                                                                                                 + 112))(this));
}

uint64_t mach_o::PointerFormat_Generic_arm64e::bindMaxEmbeddableAddend(mach_o::PointerFormat_Generic_arm64e *this, int a2)
{
  if (a2) {
    return 0;
  }
  else {
    return 0x3FFFFLL;
  }
}

uint64_t mach_o::PointerFormat_Generic_arm64e::bindMinEmbeddableAddend(mach_o::PointerFormat_Generic_arm64e *this, int a2)
{
  if (a2) {
    return 0;
  }
  else {
    return 4294705153;
  }
}

uint64_t mach_o::PointerFormat_Generic_arm64e::nextLocation(mach_o::PointerFormat_Generic_arm64e *this, void *a2)
{
  uint64_t v2 = (*a2 >> 51) & 0x7FFLL;
  if (v2) {
    return (uint64_t)a2
  }
         + (*(unsigned int (**)(mach_o::PointerFormat_Generic_arm64e *))(*(void *)this + 120))(this)
         * v2;
  else {
    return 0;
  }
}

uint64_t mach_o::PointerFormat_Generic_arm64e::parseChainEntry@<X0>(uint64_t result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  unint64_t v8 = *a2;
  if ((*a2 & 0x4000000000000000) != 0)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 112))(result);
    unint64_t v8 = *a2;
    if (result == 24)
    {
      uint64_t v12 = *a2 & 0xFFFFFF;
      if ((v8 & 0x8000000000000000) == 0)
      {
LABEL_8:
        *(void *)a5 = a2;
        *(void *)(a5 + 8) = a3;
        *(unsigned char *)(a5 + 16) = 0;
        *(unsigned char *)(a5 + 18) &= 0xF8u;
        *(_DWORD *)(a5 + 20) = 0x10000;
        *(_DWORD *)(a5 + 24) = v12;
        *(_DWORD *)(a5 + 28) = HIDWORD(v8) & 0x7FFFF;
        return result;
      }
    }
    else
    {
      LODWORD(v12) = (unsigned __int16)*a2;
      if ((v8 & 0x8000000000000000) == 0) {
        goto LABEL_8;
      }
    }
    uint64_t v13 = (v8 >> 49) & 3;
    unint64_t v14 = HIDWORD(v8);
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    char v15 = *(unsigned char *)(a5 + 18) & 0xF8;
    *(_WORD *)(a5 + 22) = 1;
    *(_DWORD *)(a5 + 24) = v12;
    *(_DWORD *)(a5 + 28) = 0;
    *(unsigned char *)(a5 + 16) = 1;
LABEL_12:
    *(unsigned char *)(a5 + 18) = (v8 >> 46) & 4 | v13 | v15;
    *(_WORD *)(a5 + 20) = v14;
    return result;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
    uint64_t v13 = (v8 >> 49) & 3;
    unint64_t v14 = HIDWORD(v8);
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    char v15 = *(unsigned char *)(a5 + 18) & 0xF8;
    *(_WORD *)(a5 + 22) = 0;
    *(void *)(a5 + 24) = v8;
    *(unsigned char *)(a5 + 16) = 1;
    goto LABEL_12;
  }
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 128))(result);
  uint64_t v10 = *a2 & 0x7FFFFFFFFFFLL;
  if (result) {
    v10 -= a4;
  }
  unint64_t v11 = (*a2 << 13) & 0xFF00000000000000 | v10;
  *(void *)a5 = a2;
  *(void *)(a5 + 8) = a3;
  *(unsigned char *)(a5 + 16) = 0;
  *(unsigned char *)(a5 + 18) &= 0xF8u;
  *(_DWORD *)(a5 + 20) = 0;
  *(void *)(a5 + 24) = v11;
  return result;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::bindBitCount(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return 16;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::stride(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return 8;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E::unauthRebaseIsVmAddr(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 2;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return "DYLD_CHAINED_PTR_64";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return "generic 64-bit, 4-byte stride, target vmadddr";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::is64(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::supportsAuth(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::minNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 4;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::maxNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 16380;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::maxRebaseTargetOffset(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 0xFFFFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::supportsBinds(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::maxBindOrdinal(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 0xFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::bindMaxEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 255;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::bindMinEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::nextLocation(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this, void *a2)
{
  if (((*a2 >> 51) & 0xFFF) != 0) {
    return (uint64_t)a2 + 4 * ((*a2 >> 51) & 0xFFF);
  }
  else {
    return 0;
  }
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::parseChainEntry@<X0>(uint64_t result@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8 = *a2;
  if (*a2 < 0)
  {
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    *(unsigned char *)(a5 + 16) = 0;
    *(unsigned char *)(a5 + 18) &= 0xF8u;
    *(_DWORD *)(a5 + 20) = 0x10000;
    *(_DWORD *)(a5 + 24) = v8 & 0xFFFFFF;
    *(_DWORD *)(a5 + 28) = BYTE3(v8);
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 112))(result);
    uint64_t v10 = *a2 & 0xFFFFFFFFFLL;
    if (result) {
      v10 -= a4;
    }
    unint64_t v11 = (*a2 << 20) & 0xFF00000000000000 | v10;
    *(void *)a5 = a2;
    *(void *)(a5 + 8) = a3;
    *(unsigned char *)(a5 + 16) = 0;
    *(unsigned char *)(a5 + 18) &= 0xF8u;
    *(_DWORD *)(a5 + 20) = 0;
    *(void *)(a5 + 24) = v11;
  }
  return result;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64::unauthRebaseIsVmAddr(mach_o::PointerFormat_DYLD_CHAINED_PTR_64 *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 3;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return "DYLD_CHAINED_PTR_32";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return "generic 32-bit, 4-byte stride";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::is64(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::supportsAuth(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::minNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 4;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::maxNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 124;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::maxRebaseTargetOffset(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0x3FFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::supportsBinds(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::maxBindOrdinal(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0xFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::bindMaxEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 63;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32::bindMinEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this)
{
  return 0;
}

unsigned int *mach_o::PointerFormat_DYLD_CHAINED_PTR_32::nextLocation(mach_o::PointerFormat_DYLD_CHAINED_PTR_32 *this, unsigned int *a2)
{
  unint64_t v2 = ((unint64_t)*a2 >> 26) & 0x1F;
  if (v2) {
    return &a2[v2];
  }
  else {
    return 0;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_32::parseChainEntry(unsigned int *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  unsigned int v3 = *a1;
  if ((*a1 & 0x80000000) != 0)
  {
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    *(unsigned char *)(a3 + 16) = 0;
    *(unsigned char *)(a3 + 18) &= 0xF8u;
    *(_DWORD *)(a3 + 24) = v3 & 0xFFFFF;
    *(_DWORD *)(a3 + 28) = (v3 >> 20) & 0x3F;
    char v4 = 1;
  }
  else
  {
    char v4 = 0;
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    *(unsigned char *)(a3 + 16) = 0;
    *(unsigned char *)(a3 + 18) &= 0xF8u;
    *(void *)(a3 + 24) = v3 & 0x3FFFFFF;
  }
  *(_WORD *)(a3 + 20) = 0;
  *(unsigned char *)(a3 + 22) = v4;
  *(unsigned char *)(a3 + 23) = 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 4;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return "DYLD_CHAINED_PTR_32_CACHE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return "generic 32-bit, 4-byte stride";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::is64(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::supportsAuth(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::minNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 4;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::maxNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 12;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::maxRebaseTargetOffset(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0x3FFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::supportsBinds(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::maxBindOrdinal(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::bindMaxEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::bindMinEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::nextLocation(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE *this, unsigned int *a2)
{
  unint64_t v2 = *a2;
  if (v2 >> 30) {
    return (uint64_t)a2 + ((v2 >> 28) & 0xC);
  }
  else {
    return 0;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_32_CACHE::parseChainEntry(_DWORD *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3 = *a1 & 0x3FFFFFFF;
  *(void *)a3 = a1;
  *(void *)(a3 + 8) = a2;
  *(unsigned char *)(a3 + 16) = 0;
  *(unsigned char *)(a3 + 18) &= 0xF8u;
  *(_DWORD *)(a3 + 20) = 0;
  *(void *)(a3 + 24) = v3;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 5;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return "DYLD_CHAINED_PTR_32_FIRMWARE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return "generic 32-bit, 4-byte stride";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::is64(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::supportsAuth(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::minNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 4;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::maxNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 124;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::maxRebaseTargetOffset(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0x3FFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::supportsBinds(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::maxBindOrdinal(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0xFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::bindMaxEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::bindMinEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::nextLocation(mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE *this, unsigned int *a2)
{
  unint64_t v2 = *a2;
  if (v2 >> 26) {
    return (uint64_t)a2 + ((v2 >> 24) & 0xFC);
  }
  else {
    return 0;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_32_FIRMWARE::parseChainEntry(_DWORD *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4 = (*a1 & 0x3FFFFFF) - a3;
  *(void *)a4 = a1;
  *(void *)(a4 + 8) = a2;
  *(unsigned char *)(a4 + 16) = 0;
  *(unsigned char *)(a4 + 18) &= 0xF8u;
  *(_DWORD *)(a4 + 20) = 0;
  *(void *)(a4 + 24) = v4;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET *this)
{
  return 6;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET *this)
{
  return "DYLD_CHAINED_PTR_64_OFFSET";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET *this)
{
  return "generic 64-bit, 4-byte stride, target vmoffset";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET::unauthRebaseIsVmAddr(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_OFFSET *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return 7;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return "DYLD_CHAINED_PTR_ARM64E_KERNEL";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return "authenticated arm64e, 4-byte stride, target vmoffset";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::bindBitCount(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return 16;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::stride(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return 4;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL::unauthRebaseIsVmAddr(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_KERNEL *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 8;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return "DYLD_CHAINED_PTR_64_KERNEL_CACHE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return "authenticated arm64e, 4-byte stride, for kernel cache";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::is64(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::supportsAuth(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::minNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 4;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::maxNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 16380;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::maxRebaseTargetOffset(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0x3FFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::supportsBinds(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::maxBindOrdinal(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::bindMaxEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::bindMinEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::nextLocation(mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE *this, void *a2)
{
  if (((*a2 >> 51) & 0xFFF) != 0) {
    return (uint64_t)a2 + 4 * ((*a2 >> 51) & 0xFFF);
  }
  else {
    return 0;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_64_KERNEL_CACHE::parseChainEntry(unint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  unint64_t v3 = *a1;
  if ((*a1 & 0x8000000000000000) != 0)
  {
    unint64_t v4 = HIDWORD(v3);
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    int v6 = *(unsigned char *)(a3 + 18) & 0xF8;
    *(unsigned char *)(a3 + 16) = 1;
    int v5 = (v3 >> 46) & 4 | (v3 >> 49) & 3 | v6;
  }
  else
  {
    LOWORD(v4) = 0;
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    *(unsigned char *)(a3 + 16) = 0;
    LOBYTE(v5) = *(unsigned char *)(a3 + 18) & 0xF8;
  }
  *(unsigned char *)(a3 + 18) = v5;
  *(_WORD *)(a3 + 20) = v4;
  *(_WORD *)(a3 + 22) = 0;
  *(void *)(a3 + 24) = v3 & 0x3FFFFFFF;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return 9;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return "DYLD_CHAINED_PTR_ARM64E_USERLAND";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return "authenticated arm64e, 8-byte stride, target vmoffset";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::bindBitCount(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return 16;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::stride(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return 8;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND::unauthRebaseIsVmAddr(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 10;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return "DYLD_CHAINED_PTR_ARM64E_FIRMWARE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return "authenticated arm64e, 4-byte stride, target vmaddr";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::is64(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::bindBitCount(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 16;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::stride(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 4;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE::unauthRebaseIsVmAddr(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_FIRMWARE *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 11;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return "DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return "1-byte stride, for x86_64 kernel cache";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::is64(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::supportsAuth(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::minNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 1;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::maxNext(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 4095;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::maxRebaseTargetOffset(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0x3FFFFFFFLL;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::supportsBinds(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::maxBindOrdinal(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::bindMaxEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::bindMinEmbeddableAddend(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this)
{
  return 0;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::nextLocation(mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE *this, void *a2)
{
  if ((*a2 & 0x7FF8000000000000) != 0) {
    return (uint64_t)a2 + ((*a2 >> 51) & 0xFFFLL);
  }
  else {
    return 0;
  }
}

void mach_o::PointerFormat_DYLD_CHAINED_PTR_X86_64_KERNEL_CACHE::parseChainEntry(unint64_t *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  unint64_t v3 = *a1;
  if ((*a1 & 0x8000000000000000) != 0)
  {
    unint64_t v4 = HIDWORD(v3);
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    int v6 = *(unsigned char *)(a3 + 18) & 0xF8;
    *(unsigned char *)(a3 + 16) = 1;
    int v5 = (v3 >> 46) & 4 | (v3 >> 49) & 3 | v6;
  }
  else
  {
    LOWORD(v4) = 0;
    *(void *)a3 = a1;
    *(void *)(a3 + 8) = a2;
    *(unsigned char *)(a3 + 16) = 0;
    LOBYTE(v5) = *(unsigned char *)(a3 + 18) & 0xF8;
  }
  *(unsigned char *)(a3 + 18) = v5;
  *(_WORD *)(a3 + 20) = v4;
  *(_WORD *)(a3 + 22) = 0;
  *(void *)(a3 + 24) = v3 & 0x3FFFFFFF;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::value(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return 12;
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::name(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return "DYLD_CHAINED_PTR_ARM64E_USERLAND24";
}

const char *mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::description(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return "authenticated arm64e, 8-byte stride, target vmoffset";
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::bindBitCount(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return 24;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::stride(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return 8;
}

uint64_t mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24::unauthRebaseIsVmAddr(mach_o::PointerFormat_DYLD_CHAINED_PTR_ARM64E_USERLAND24 *this)
{
  return 0;
}

uint64_t mach_o::BindOpcodes::BindOpcodes(uint64_t this, const unsigned __int8 *a2, uint64_t a3, int a4)
{
  *(void *)this = &unk_1F03D9568;
  *(void *)(this + 8) = a2;
  *(void *)(this + 16) = &a2[a3];
  if (a4) {
    int v4 = 8;
  }
  else {
    int v4 = 4;
  }
  *(_DWORD *)(this + 24) = v4;
  return this;
}

uint64_t mach_o::BindOpcodes::hasDoneBetweenBinds(mach_o::BindOpcodes *this)
{
  return 0;
}

uint64_t mach_o::BindOpcodes::implicitLibraryOrdinal(mach_o::BindOpcodes *this)
{
  return 0;
}

void mach_o::BindOpcodes::valid(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, char a5@<W4>, char a6@<W5>, void *a7@<X8>)
{
  uint64_t v14 = 0;
  char v15 = &v14;
  uint64_t v16 = 0x3002000000;
  uint64_t v17 = __Block_byref_object_copy__2;
  uint64_t v18 = __Block_byref_object_dispose__2;
  uint64_t v19 = 0;
  v9[0] = MEMORY[0x1E4F14BE8];
  v9[1] = 0x40000000;
  v9[2] = ___ZNK6mach_o11BindOpcodes5validENSt3__14spanIKNS_13MappedSegmentELm18446744073709551615EEEjbb_block_invoke;
  void v9[3] = &unk_1E5E6C898;
  v9[4] = &v14;
  v9[5] = a1;
  void v9[6] = a2;
  v9[7] = a3;
  int v10 = a4;
  char v11 = a6;
  char v12 = a5;
  mach_o::BindOpcodes::forEachBind(a1, (uint64_t)v9, (uint64_t)&__block_literal_global, (mach_o::Error *)&v13);
  if (v13) {
    uint64_t v8 = &v13;
  }
  else {
    uint64_t v8 = v15 + 5;
  }
  mach_o::Error::Error(a7, v8);
  mach_o::Error::~Error((mach_o::Error *)&v13);
  _Block_object_dispose(&v14, 8);
  mach_o::Error::~Error((mach_o::Error *)&v19);
}

void *__Block_byref_object_copy__2(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t mach_o::BindOpcodes::forEachBind@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, mach_o::Error *a4@<X8>)
{
  uint64_t v8 = *(uint64_t (***)(void))a1;
  uint64_t v41 = *(const unsigned __int8 ***)(a1 + 8);
  unsigned int v39 = (*v8)();
  *(_WORD *)unint64_t v40 = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 8))(a1);
  char v36 = 0;
  uint64_t v37 = 0;
  uint64_t v38 = 0;
  char v11 = 0;
  uint64_t v12 = 0;
  BOOL v13 = (result & 0xFF00000000) != 0;
  if ((result & 0xFF00000000) != 0) {
    uint64_t v14 = result;
  }
  else {
    uint64_t v14 = 0;
  }
  uint64_t v35 = a3;
  char v15 = 1;
  while (2)
  {
    uint64_t v16 = v41;
    uint64_t v17 = *(const unsigned __int8 ***)(a1 + 16);
    if (v41 >= v17)
    {
LABEL_39:
      *(void *)a4 = 0;
    }
    else
    {
      uint64_t v19 = (char *)v41 + 1;
      unsigned __int8 v18 = *(unsigned char *)v41;
      uint64_t v41 = (const unsigned __int8 **)((char *)v41 + 1);
      unsigned int v20 = v18 & 0xF;
      switch(v18 >> 4)
      {
        case 0:
          uint64_t result = (**(uint64_t (***)(uint64_t))a1)(a1);
          if ((result & 1) == 0) {
            v40[1] = 1;
          }
          goto LABEL_35;
        case 1:
          BOOL v13 = 1;
          uint64_t v14 = v18 & 0xF;
          goto LABEL_35;
        case 2:
          uint64_t result = mach_o::read_uleb128(&v41, v17, v40, v10);
          uint64_t v14 = result;
          goto LABEL_14;
        case 3:
          unsigned int v21 = *(_DWORD *)&v18 | 0xFFFFFFF0;
          if (v20) {
            uint64_t v14 = v21;
          }
          else {
            uint64_t v14 = 0;
          }
LABEL_14:
          BOOL v13 = 1;
          goto LABEL_35;
        case 4:
          if (*v19)
          {
            uint64_t v22 = (const unsigned __int8 **)((char *)v16 + 2);
            do
            {
              uint64_t v41 = v22;
              int v23 = *(unsigned __int8 *)v22;
              uint64_t v22 = (const unsigned __int8 **)((char *)v22 + 1);
            }
            while (v23);
            uint64_t v16 = (const unsigned __int8 **)((char *)v22 - 2);
          }
          char v36 = v18 & 1;
          uint64_t v41 = (const unsigned __int8 **)((char *)v16 + 2);
          if (v20 >= 8) {
            uint64_t result = (*(uint64_t (**)(uint64_t, unsigned char *))(v35 + 16))(v35, v19);
          }
          char v15 = 1;
          char v11 = v19;
          goto LABEL_35;
        case 5:
          unsigned int v39 = v18 & 0xF;
          goto LABEL_35;
        case 6:
          uint64_t result = mach_o::read_sleb128(&v41, v17, v40, v10);
          uint64_t v38 = result;
          char v15 = 1;
          goto LABEL_35;
        case 7:
          uint64_t result = mach_o::read_uleb128(&v41, v17, v40, v10);
          uint64_t v12 = result;
          LOBYTE(v37) = v20;
          BYTE4(v37) = 1;
          goto LABEL_35;
        case 8:
          uint64_t result = mach_o::read_uleb128(&v41, v17, v40, v10);
          v12 += result;
          goto LABEL_35;
        case 9:
          LOBYTE(v33) = v15;
          LOBYTE(v32) = v36 & 1;
          uint64_t result = (*(uint64_t (**)(uint64_t, const char *, void, void, void, uint64_t, BOOL, uint64_t, unsigned char *, int, uint64_t, int, unsigned __int8 *))(a2 + 16))(a2, "BIND_OPCODE_DO_BIND", v39, BYTE4(v37) & 1, v37, v12, v13, v14, v11, v32, v38, v33, &v40[1]);
          char v15 = 0;
          uint64_t v24 = *(unsigned int *)(a1 + 24);
          goto LABEL_29;
        case 10:
          LOBYTE(v33) = v15;
          LOBYTE(v32) = v36 & 1;
          (*(void (**)(uint64_t, const char *, void, void, void, uint64_t, BOOL, uint64_t, unsigned char *, int, uint64_t, int, unsigned __int8 *))(a2 + 16))(a2, "BIND_OPCODE_DO_BIND_ADD_ADDR_ULEB", v39, BYTE4(v37) & 1, v37, v12, v13, v14, v11, v32, v38, v33, &v40[1]);
          uint64_t result = mach_o::read_uleb128(&v41, *(const unsigned __int8 ***)(a1 + 16), v40, v25);
          char v15 = 0;
          v12 += result + *(unsigned int *)(a1 + 24);
          goto LABEL_35;
        case 11:
          LOBYTE(v33) = v15;
          LOBYTE(v32) = v36 & 1;
          uint64_t result = (*(uint64_t (**)(uint64_t, const char *, void, void, void, uint64_t, BOOL, uint64_t, unsigned char *, int, uint64_t, int, unsigned __int8 *))(a2 + 16))(a2, "BIND_OPCODE_DO_BIND_ADD_ADDR_IMM_SCALED", v39, BYTE4(v37) & 1, v37, v12, v13, v14, v11, v32, v38, v33, &v40[1]);
          char v15 = 0;
          uint64_t v24 = *(_DWORD *)(a1 + 24) + *(_DWORD *)(a1 + 24) * v20;
LABEL_29:
          v12 += v24;
          goto LABEL_35;
        case 12:
          unint64_t v26 = mach_o::read_uleb128(&v41, v17, v40, v10);
          uint64_t result = mach_o::read_uleb128(&v41, *(const unsigned __int8 ***)(a1 + 16), v40, v27);
          if (v26)
          {
            uint64_t v28 = result;
            uint64_t v34 = a4;
            unsigned int v29 = 1;
            do
            {
              LOBYTE(v33) = v15;
              LOBYTE(v32) = v36 & 1;
              uint64_t result = (*(uint64_t (**)(uint64_t, const char *, void, void, void, uint64_t, BOOL, uint64_t, unsigned char *, int, uint64_t, int, unsigned __int8 *))(a2 + 16))(a2, "BIND_OPCODE_DO_BIND_ULEB_TIMES_SKIPPING_ULEB", v39, BYTE4(v37) & 1, v37, v12, v13, v14, v11, v32, v38, v33, &v40[1]);
              char v15 = 0;
              v12 += v28 + *(unsigned int *)(a1 + 24);
              if (v40[1]) {
                break;
              }
              unint64_t v30 = v29++;
            }
            while (v26 > v30);
            a4 = v34;
          }
LABEL_35:
          if (!*(_WORD *)v40) {
            continue;
          }
          if (!v40[0]) {
            goto LABEL_39;
          }
          uint64_t result = (uint64_t)mach_o::Error::Error(a4, "malformed uleb128", v31);
          break;
        case 13:
          return (uint64_t)mach_o::Error::Error(a4, "old arm64e bind opcodes not supported", v31);
        default:
          return (uint64_t)mach_o::Error::Error(a4, "unknown bind opcode 0x%02X");
      }
    }
    return result;
  }
}

void ___ZNK6mach_o11BindOpcodes5validENSt3__14spanIKNS_13MappedSegmentELm18446744073709551615EEEjbb_block_invoke(uint64_t a1, uint64_t a2, int a3, char a4, unsigned int a5, unint64_t a6, char a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, unsigned char *a13)
{
  if ((a4 & 1) == 0)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s missing preceding BIND_OPCODE_SET_SEGMENT_AND_OFFSET_ULEB");
    goto LABEL_7;
  }
  if (*(void *)(a1 + 56) <= (unint64_t)a5)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s segment index %d too large");
    goto LABEL_7;
  }
  if (*(void *)(*(void *)(a1 + 48) + 56 * a5 + 8)
     - (unint64_t)*(unsigned int *)(*(void *)(a1 + 40) + 24) < a6)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s segment offset 0x%08llX beyond segment '%.*s' size (0x%08llX)");
LABEL_7:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v18);
    mach_o::Error::~Error((mach_o::Error *)&v18);
    *a13 = 1;
    goto LABEL_8;
  }
  if (!a9)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s missing preceding BIND_OPCODE_SET_SYMBOL_TRAILING_FLAGS_IMM");
    goto LABEL_7;
  }
  if ((a7 & 1) == 0)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s missing preceding BIND_OPCODE_SET_DYLIB_ORDINAL");
    goto LABEL_7;
  }
  if (a8 < 1)
  {
    if (a8 <= -4)
    {
      mach_o::Error::Error((mach_o::Error *)&v18, "%s has unknown library special ordinal (%d)");
      goto LABEL_7;
    }
  }
  else if (*(_DWORD *)(a1 + 64) < a8)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s has library ordinal too large (%d) max (%d)");
    goto LABEL_7;
  }
LABEL_8:
  if ((a3 - 2) < 2)
  {
    if (*(unsigned char *)(a1 + 69))
    {
      uint64_t v16 = *(void *)(a1 + 48);
      if (*(unsigned char *)(v16 + 56 * a5 + 49))
      {
        mach_o::Error::Error((mach_o::Error *)&v18, "%s text bind is in writable segment");
      }
      else
      {
        if (*(unsigned char *)(v16 + 56 * a5 + 50)) {
          return;
        }
        mach_o::Error::Error((mach_o::Error *)&v18, "%s text bind is in non-executable segment");
      }
    }
    else
    {
      mach_o::Error::Error((mach_o::Error *)&v18, "%s text binds not supported for architecture");
    }
    goto LABEL_28;
  }
  if (a3 != 1)
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s unknown bind type %d");
    goto LABEL_28;
  }
  uint64_t v17 = *(void *)(a1 + 48);
  if (!*(unsigned char *)(v17 + 56 * a5 + 49) && *(unsigned char *)(a1 + 68))
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s pointer bind is in non-writable segment '%.*s'");
    goto LABEL_28;
  }
  if (*(unsigned char *)(v17 + 56 * a5 + 50) && *(unsigned char *)(a1 + 68))
  {
    mach_o::Error::Error((mach_o::Error *)&v18, "%s pointer bind is in executable segment '%.*s'");
LABEL_28:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), &v18);
    mach_o::Error::~Error((mach_o::Error *)&v18);
    *a13 = 1;
  }
}

void mach_o::BindOpcodes::forEachBindTarget(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2000000000;
  void v5[3] = 0;
  v3[0] = MEMORY[0x1E4F14BE8];
  v3[1] = 0x40000000;
  v3[2] = ___ZNK6mach_o11BindOpcodes17forEachBindTargetEU13block_pointerFvRKNS_5Fixup10BindTargetERbEU13block_pointerFvPKcE_block_invoke;
  void v3[3] = &unk_1E5E6C8E0;
  v3[4] = a2;
  void v3[5] = v5;
  mach_o::BindOpcodes::forEachBind(a1, (uint64_t)v3, a3, (mach_o::Error *)v4);
  mach_o::Error::~Error((mach_o::Error *)v4);
  _Block_object_dispose(v5, 8);
}

uint64_t ___ZNK6mach_o11BindOpcodes17forEachBindTargetEU13block_pointerFvRKNS_5Fixup10BindTargetERbEU13block_pointerFvPKcE_block_invoke(uint64_t result, int a2, int a3, uint64_t a4, int a5, int a6, int a7, int a8, char *__s, char a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (*(char **)(*(void *)(*(void *)(result + 40) + 8) + 24) != __s)
  {
    uint64_t v14 = result;
    if (__s) {
      size_t v15 = strlen(__s);
    }
    else {
      size_t v15 = 0;
    }
    v16[0] = __s;
    v16[1] = v15;
    int v17 = a8;
    char v18 = a10;
    uint64_t v19 = a11;
    uint64_t result = (*(uint64_t (**)(void, void *, uint64_t, uint64_t))(*(void *)(v14 + 32) + 16))(*(void *)(v14 + 32), v16, a13, a4);
    *(void *)(*(void *)(*(void *)(v14 + 40) + 8) + 24) = __s;
  }
  return result;
}

uint64_t mach_o::LazyBindOpcodes::hasDoneBetweenBinds(mach_o::LazyBindOpcodes *this)
{
  return 1;
}

uint64_t mach_o::NListSymbolTable::NListSymbolTable(uint64_t this, unsigned int a2, const nlist *a3, int a4, const char *a5, int a6, int a7, int a8, unsigned int a9)
{
  *(void *)this = a2;
  *(void *)(this + 8) = a5;
  *(void *)(this + 16) = a3;
  *(void *)(this + 24) = 0;
  *(_DWORD *)(this + 32) = a6;
  *(_DWORD *)(this + 36) = a4;
  *(_DWORD *)(this + 40) = a7;
  *(_DWORD *)(this + 44) = a8;
  *(_DWORD *)(this + 48) = a9;
  return this;
}

uint64_t mach_o::NListSymbolTable::NListSymbolTable(uint64_t this, uint64_t a2, const nlist_64 *a3, int a4, const char *a5, int a6, int a7, int a8, unsigned int a9)
{
  *(void *)this = a2;
  *(void *)(this + 8) = a5;
  *(void *)(this + 16) = 0;
  *(void *)(this + 24) = a3;
  *(_DWORD *)(this + 32) = a6;
  *(_DWORD *)(this + 36) = a4;
  *(_DWORD *)(this + 40) = a7;
  *(_DWORD *)(this + 44) = a8;
  *(_DWORD *)(this + 48) = a9;
  return this;
}

void mach_o::NListSymbolTable::valid(void *a1@<X8>)
{
  *a1 = 0;
}

uint64_t mach_o::NListSymbolTable::symbolFromNList@<X0>(uint64_t this@<X0>, const char *__s@<X1>, unint64_t a3@<X2>, unsigned int a4@<W3>, char a5@<W4>, unsigned int a6@<W5>, void *a7@<X8>)
{
  char v11 = (void *)this;
  switch((a4 >> 1) & 7)
  {
    case 0u:
      if (a3)
      {
        if ((a4 & 0x10) != 0)
        {
          if (__s) {
            size_t v21 = strlen(__s);
          }
          else {
            size_t v21 = 0;
          }
          return mach_o::Symbol::makeHiddenTentativeDef((uint64_t)__s, v21, a3, BYTE1(a6) & 0xF, (a6 >> 5) & 1, (a6 >> 10) & 1, (uint64_t)a7);
        }
        else
        {
          if (__s) {
            size_t v12 = strlen(__s);
          }
          else {
            size_t v12 = 0;
          }
          return mach_o::Symbol::makeTentativeDef((uint64_t)__s, v12, a3, BYTE1(a6) & 0xF, (a6 >> 5) & 1, (a6 >> 10) & 1, (uint64_t)a7);
        }
      }
      else
      {
        if (__s) {
          size_t v20 = strlen(__s);
        }
        else {
          size_t v20 = 0;
        }
        unsigned int v24 = (BYTE1(a6) + 2);
        if (v24 >= 3) {
          int v25 = a6 >> 8;
        }
        else {
          int v25 = v24 - 2;
        }
        return mach_o::Symbol::makeUndefined((uint64_t)__s, v20, v25, (a6 & 0x40) != 0, (uint64_t)a7);
      }
    case 1u:
      if (a4)
      {
        if (__s) {
          size_t v18 = strlen(__s);
        }
        else {
          size_t v18 = 0;
        }
        return mach_o::Symbol::makeAbsoluteExport((uint64_t)__s, v18, a3, (a6 >> 5) & 1, (uint64_t)a7);
      }
      else
      {
        if (__s) {
          size_t v13 = strlen(__s);
        }
        else {
          size_t v13 = 0;
        }
        return mach_o::Symbol::makeAbsoluteLocal((uint64_t)__s, v13, a3, (a6 >> 5) & 1, (uint64_t)a7);
      }
    case 5u:
      uint64_t v14 = __s;
      if (*(unsigned int *)(this + 32) > a3) {
        uint64_t v14 = (const char *)(*(void *)(this + 8) + a3);
      }
      if (a4)
      {
        if ((a4 & 0x10) != 0)
        {
          if (__s) {
            size_t v15 = strlen(__s);
          }
          else {
            size_t v15 = 0;
          }
          uint64_t v27 = (uint64_t)a7;
          uint64_t v28 = __s;
          uint64_t v29 = (uint64_t)v14;
          char v30 = 2;
        }
        else
        {
          if (__s) {
            size_t v15 = strlen(__s);
          }
          else {
            size_t v15 = 0;
          }
          uint64_t v27 = (uint64_t)a7;
          uint64_t v28 = __s;
          uint64_t v29 = (uint64_t)v14;
          char v30 = 4;
        }
      }
      else if ((a4 & 0x10) != 0)
      {
        if (__s) {
          size_t v15 = strlen(__s);
        }
        else {
          size_t v15 = 0;
        }
        uint64_t v27 = (uint64_t)a7;
        uint64_t v28 = __s;
        uint64_t v29 = (uint64_t)v14;
        char v30 = 1;
      }
      else
      {
        if (__s) {
          size_t v15 = strlen(__s);
        }
        else {
          size_t v15 = 0;
        }
        uint64_t v27 = (uint64_t)a7;
        uint64_t v28 = __s;
        uint64_t v29 = (uint64_t)v14;
        char v30 = 0;
      }
      return mach_o::Symbol::makeReExport((uint64_t)v28, v15, 0, v29, v30, v27);
    case 7u:
      if ((a4 & 1) == 0)
      {
        if ((a6 & 0x200) == 0)
        {
          if ((a4 & 0x10) != 0)
          {
            if ((a6 & 0x80) != 0)
            {
              if (__s) {
                size_t v41 = strlen(__s);
              }
              else {
                size_t v41 = 0;
              }
              uint64_t v48 = a3 - *v11;
              return mach_o::Symbol::makeWeakDefWasPrivateExtern((uint64_t)__s, v41, v48, a5, (a6 >> 5) & 1, (a6 >> 10) & 1, (uint64_t)a7);
            }
            else
            {
              if (__s) {
                size_t v26 = strlen(__s);
              }
              else {
                size_t v26 = 0;
              }
              uint64_t v46 = a3 - *v11;
              return mach_o::Symbol::makeRegularWasPrivateExtern((uint64_t)__s, v26, v46, a5, (a6 >> 5) & 1, (a6 >> 10) & 1, (uint64_t)a7);
            }
          }
          else
          {
            if (__s) {
              size_t v17 = strlen(__s);
            }
            else {
              size_t v17 = 0;
            }
            uint64_t v42 = a3 - *v11;
            return mach_o::Symbol::makeRegularLocal((uint64_t)__s, v17, v42, a5, (a6 >> 5) & 1, (a6 >> 10) & 1, (uint64_t)a7);
          }
        }
        if (__s) {
          size_t v22 = strlen(__s);
        }
        else {
          size_t v22 = 0;
        }
        int v31 = (a6 >> 10) & 1;
        int v32 = (a6 >> 5) & 1;
        uint64_t v33 = a3 - *v11;
        int v34 = (a6 >> 7) & 1;
        uint64_t v35 = (uint64_t)a7;
        char v36 = __s;
        char v37 = a5;
        char v38 = 0;
        goto LABEL_104;
      }
      if ((a4 & 0x10) == 0)
      {
        if ((a6 & 0x200) == 0)
        {
          if ((~a6 & 0xC0) != 0)
          {
            if ((a6 & 0x80) != 0)
            {
              if (__s) {
                size_t v43 = strlen(__s);
              }
              else {
                size_t v43 = 0;
              }
              uint64_t v50 = a3 - *v11;
              return mach_o::Symbol::makeWeakDefExport((uint64_t)__s, v43, v50, a5, (a6 >> 5) & 1, (a6 >> 10) & 1, (uint64_t)a7);
            }
            else if ((a6 & 0x100) != 0)
            {
              if (__s) {
                size_t v49 = strlen(__s);
              }
              else {
                size_t v49 = 0;
              }
              uint64_t v52 = a3 - *v11;
              return mach_o::Symbol::makeDynamicResolver((uint64_t)__s, v49, a5, 0, v52, (uint64_t)a7);
            }
            else
            {
              if (__s) {
                size_t v39 = strlen(__s);
              }
              else {
                size_t v39 = 0;
              }
              uint64_t v51 = a3 - *v11;
              return mach_o::Symbol::makeRegularExport((uint64_t)__s, v39, v51, a5, (a6 >> 5) & 1, (a6 >> 10) & 1, (a6 >> 4) & 1, (uint64_t)a7);
            }
          }
          else
          {
            if (__s) {
              size_t v19 = strlen(__s);
            }
            else {
              size_t v19 = 0;
            }
            uint64_t v44 = a3 - *v11;
            return mach_o::Symbol::makeWeakDefAutoHide((uint64_t)__s, v19, v44, a5, (a6 >> 5) & 1, (a6 >> 10) & 1, (uint64_t)a7);
          }
        }
        if (__s) {
          size_t v22 = strlen(__s);
        }
        else {
          size_t v22 = 0;
        }
        int v31 = (a6 >> 10) & 1;
        int v32 = (a6 >> 5) & 1;
        uint64_t v33 = a3 - *v11;
        int v34 = (a6 >> 7) & 1;
        uint64_t v35 = (uint64_t)a7;
        char v36 = __s;
        char v37 = a5;
        char v38 = 4;
LABEL_104:
        return mach_o::Symbol::makeAltEntry((uint64_t)v36, v22, v33, v37, v38, v32, v31, v34, v35);
      }
      if ((a6 & 0x200) != 0)
      {
        if (__s) {
          size_t v22 = strlen(__s);
        }
        else {
          size_t v22 = 0;
        }
        int v31 = (a6 >> 10) & 1;
        int v32 = (a6 >> 5) & 1;
        uint64_t v33 = a3 - *v11;
        int v34 = (a6 >> 7) & 1;
        uint64_t v35 = (uint64_t)a7;
        char v36 = __s;
        char v37 = a5;
        char v38 = 2;
        goto LABEL_104;
      }
      if ((a6 & 0x80) != 0)
      {
        if (__s) {
          size_t v40 = strlen(__s);
        }
        else {
          size_t v40 = 0;
        }
        uint64_t v47 = a3 - *v11;
        return mach_o::Symbol::makeWeakDefHidden((uint64_t)__s, v40, v47, a5, (a6 >> 5) & 1, (a6 >> 10) & 1, (uint64_t)a7);
      }
      else
      {
        if (__s) {
          size_t v23 = strlen(__s);
        }
        else {
          size_t v23 = 0;
        }
        uint64_t v45 = a3 - *v11;
        return mach_o::Symbol::makeRegularHidden((uint64_t)__s, v23, v45, a5, (a6 >> 5) & 1, (a6 >> 10) & 1, (uint64_t)a7);
      }
    default:
      a7[3] = 0;
      a7[4] = 0;
      a7[1] = 0;
      a7[2] = 0;
      *a7 = "";
      *(void *)((char *)a7 + 31) = 0;
      return this;
  }
}

uint64_t mach_o::NListSymbolTable::forEachExportedSymbol(_DWORD *a1, uint64_t a2)
{
  int v3 = a1[10];
  unsigned int v2 = a1[11];
  if (!*((void *)a1 + 5))
  {
    if (a1[12])
    {
      unsigned int v2 = 0;
    }
    else
    {
      unsigned int v2 = a1[9];
      if (v2)
      {
        v8[0] = MEMORY[0x1E4F14BE8];
        v8[1] = 0x40000000;
        void v8[2] = ___ZNK6mach_o16NListSymbolTable21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolEjRbE_block_invoke;
        v8[3] = &unk_1E5E6C908;
        v8[4] = a2;
        void v8[5] = a1;
        v9[0] = MEMORY[0x1E4F14BE8];
        v9[1] = 0x40000000;
        v9[2] = ___ZNK6mach_o16NListSymbolTable13forEachSymbolEU13block_pointerFvPKcyhhtjRbE_block_invoke;
        void v9[3] = &unk_1E5E6C958;
        v9[4] = v8;
        int v4 = v9;
        int v5 = 0;
        return mach_o::NListSymbolTable::forEachSymbol((uint64_t)a1, v5, v2, (uint64_t)v4);
      }
    }
  }
  v7[0] = MEMORY[0x1E4F14BE8];
  v7[1] = 0x40000000;
  v7[2] = ___ZNK6mach_o16NListSymbolTable21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolEjRbE_block_invoke_2;
  void v7[3] = &unk_1E5E6C930;
  v7[4] = a2;
  v7[5] = a1;
  int v4 = v7;
  int v5 = v3;
  return mach_o::NListSymbolTable::forEachSymbol((uint64_t)a1, v5, v2, (uint64_t)v4);
}

uint64_t ___ZNK6mach_o16NListSymbolTable21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolEjRbE_block_invoke(uint64_t result, const char *a2, unint64_t a3, unsigned int a4, char a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  if (a4)
  {
    BOOL v11 = (~a4 & 0xA) == 0 || (a4 & 0xE) == 2;
    if (a4 <= 0x1F && v11)
    {
      v15[9] = v8;
      v15[10] = v9;
      uint64_t v14 = *(void *)(result + 32);
      mach_o::NListSymbolTable::symbolFromNList(*(void *)(result + 40), a2, a3, a4, a5, a6, v15);
      return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v14 + 16))(v14, v15, a7, a8);
    }
  }
  return result;
}

uint64_t mach_o::NListSymbolTable::forEachSymbol(uint64_t a1, int a2, unsigned int a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = 1;
    unint64_t v7 = a3;
    while (1)
    {
      uint64_t v9 = *(void *)(a1 + 24);
      if (v9)
      {
        uint64_t v10 = (a2 + v6 - 1);
        uint64_t v11 = *(unsigned int *)(v9 + 16 * v10);
        if (v11 > *(_DWORD *)(a1 + 32)) {
          goto LABEL_9;
        }
        uint64_t v12 = *(void *)(a1 + 8) + v11;
        uint64_t v13 = v9 + 16 * v10;
        uint64_t v14 = *(void *)(v13 + 8);
      }
      else
      {
        uint64_t v15 = *(void *)(a1 + 16);
        unsigned int v16 = a2 + v6 - 1;
        uint64_t v17 = *(unsigned int *)(v15 + 12 * v16);
        if (v17 > *(_DWORD *)(a1 + 32)) {
          goto LABEL_9;
        }
        uint64_t v12 = *(void *)(a1 + 8) + v17;
        uint64_t v13 = v15 + 12 * v16;
        uint64_t v14 = *(unsigned int *)(v13 + 8);
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, void, void, void))(a4 + 16))(a4, v12, v14, *(unsigned __int8 *)(v13 + 4), *(unsigned __int8 *)(v13 + 5), *(unsigned __int16 *)(v13 + 6));
LABEL_9:
      uint64_t result = 0;
      if (v6 >= v7) {
        return result;
      }
      ++v6;
    }
  }
  return 0;
}

uint64_t ___ZNK6mach_o16NListSymbolTable21forEachExportedSymbolEU13block_pointerFvRKNS_6SymbolEjRbE_block_invoke_2(uint64_t result, const char *a2, unint64_t a3, unsigned int a4, char a5, unsigned int a6, uint64_t a7, uint64_t a8)
{
  if (a4)
  {
    BOOL v11 = (~a4 & 0xA) == 0 || (a4 & 0xE) == 2;
    if (a4 <= 0x1F && v11)
    {
      v15[9] = v8;
      v15[10] = v9;
      uint64_t v14 = *(void *)(result + 32);
      mach_o::NListSymbolTable::symbolFromNList(*(void *)(result + 40), a2, a3, a4, a5, a6, v15);
      return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(v14 + 16))(v14, v15, a7, a8);
    }
  }
  return result;
}

uint64_t ___ZNK6mach_o16NListSymbolTable13forEachSymbolEU13block_pointerFvPKcyhhtjRbE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t mach_o::DebugNoteFileInfo::dump(const char **this)
{
  unsigned int v2 = (FILE **)MEMORY[0x1E4F14C08];
  fprintf((FILE *)*MEMORY[0x1E4F14C08], "scrDir:      %s\n", this[1]);
  fprintf(*v2, "scrName:     %s\n", this[3]);
  fprintf(*v2, "objPath:     %s\n", this[5]);
  fprintf(*v2, "objModTime:  0x%08X\n", *(_DWORD *)this);
  fprintf(*v2, "objSubType:  0X%02X\n", *((unsigned __int8 *)this + 4));
  if (this[8]) {
    int v3 = this[7];
  }
  else {
    int v3 = "N/A";
  }
  fprintf(*v2, "libPath:     %s\n", v3);
  if (this[10]) {
    int v4 = this[9];
  }
  else {
    int v4 = "N/A";
  }
  return fprintf(*v2, "origlibPath: %s\n", v4);
}

mach_o::Image *mach_o::Image::Image(mach_o::Image *this, mach_o::Header *a2, unint64_t a3, int a4)
{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((void *)this + 2) = 0;
  *((unsigned char *)this + 24) = a4;
  *((unsigned char *)this + 25) = 0;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  if ((a4 - 1) >= 2)
  {
    int v7 = 0;
    if (a4 != 3) {
      goto LABEL_6;
    }
    BOOL hasZerofillExpansion = mach_o::Image::inferIfZerofillExpanded((mach_o::Header **)this);
  }
  else
  {
    BOOL hasZerofillExpansion = mach_o::Header::hasZerofillExpansion(a2);
  }
  int v7 = hasZerofillExpansion;
  *((unsigned char *)this + 25) = hasZerofillExpansion;
LABEL_6:
  *((void *)this + 2) = mach_o::Header::computeLinkEditBias(*(mach_o::Header **)this, v7);
  mach_o::Header::validStructureLoadCommands(*(mach_o::Header **)this, a3, (mach_o::Error *)v11);
  uint64_t v8 = v11[0];
  mach_o::Error::~Error((mach_o::Error *)v11);
  if (!v8)
  {
    mach_o::Image::makeExportsTrie((mach_o::Error **)this);
    mach_o::Image::makeSymbolTable((mach_o::Header **)this);
    mach_o::Image::makeRebaseOpcodes((mach_o::Error **)this);
    mach_o::Image::makeBindOpcodes((mach_o::Error **)this);
    mach_o::Image::makeLazyBindOpcodes((mach_o::Error **)this);
    mach_o::Image::makeWeakBindOpcodes((mach_o::Error **)this);
    mach_o::Image::makeChainedFixups((mach_o::Error **)this);
    mach_o::Image::makeFunctionStarts((mach_o::Error **)this);
    uint64_t v9 = *(mach_o::Error **)this;
    v11[0] = MEMORY[0x1E4F14BE8];
    v11[1] = 0x40000000;
    v11[2] = ___ZN6mach_o5Image17makeCompactUnwindEv_block_invoke;
    v11[3] = &__block_descriptor_tmp_70;
    void v11[4] = this;
    mach_o::Header::forEachSection(v9, (uint64_t)v11);
    mach_o::Image::makeSplitSegInfo((mach_o::Error **)this);
  }
  return this;
}

BOOL mach_o::Image::inferIfZerofillExpanded(mach_o::Header **this)
{
  if (mach_o::Header::isPreload(*this)
    || mach_o::Header::isFileSet(*this)
    || !mach_o::Header::hasZerofillExpansion(*this))
  {
    return 0;
  }
  *(void *)int v7 = 0;
  if (!mach_o::Header::hasCodeSignature(*this, &v7[1], v7)
    || (unint64_t)this[1] <= v7[1]
    || (unsigned int v2 = *this, v3 = *(_DWORD *)((char *)*this + v7[1]), v4 = v3 != -1072898310)
    && (uint64_t v5 = mach_o::Header::zerofillExpansionAmount(v2), *(_DWORD *)((char *)v2 + v5 + v7[1]) != -1072898310))
  {
    __assert_rtn("inferIfZerofillExpanded", "Image.cpp", 148, "false && \"handle unsigned\"");
  }
  return v4;
}

void mach_o::Image::makeExportsTrie(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZN6mach_o5Image15makeExportsTrieEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_60;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeSymbolTable(mach_o::Header **this)
{
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000;
  uint64_t v19 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2000000000;
  uint64_t v15 = 0;
  unsigned int v2 = *this;
  v10[0] = MEMORY[0x1E4F14BE8];
  v10[1] = 0x40000000;
  vm_address_t v10[2] = ___ZN6mach_o5Image15makeSymbolTableEv_block_invoke;
  void v10[3] = &unk_1E5E6CAE0;
  v10[4] = &v16;
  v10[5] = &v12;
  mach_o::Header::forEachLoadCommand(v2, (uint64_t)v10, (mach_o::Error *)v11);
  mach_o::Error::~Error((mach_o::Error *)v11);
  if (v17[3])
  {
    int v3 = (_DWORD *)v13[3];
    if (v3)
    {
      int v4 = v3[3];
      int v5 = v3[5];
      unsigned int v6 = v3[7];
    }
    else
    {
      unsigned int v6 = 0;
      int v5 = 0;
      int v4 = 0;
    }
    BOOL v7 = mach_o::Header::is64(*this);
    uint64_t Address = mach_o::Header::preferredLoadAddress(*this);
    if (v7) {
      uint64_t v9 = mach_o::NListSymbolTable::NListSymbolTable((uint64_t)(this + 16), Address, (const nlist_64 *)((char *)this[2] + *(unsigned int *)(v17[3] + 8)), *(_DWORD *)(v17[3] + 12), (const char *)this[2] + *(unsigned int *)(v17[3] + 16), *(_DWORD *)(v17[3] + 20), v4, v5, v6);
    }
    else {
      uint64_t v9 = mach_o::NListSymbolTable::NListSymbolTable((uint64_t)(this + 16), Address, (const nlist *)((char *)this[2] + *(unsigned int *)(v17[3] + 8)), *(_DWORD *)(v17[3] + 12), (const char *)this[2] + *(unsigned int *)(v17[3] + 16), *(_DWORD *)(v17[3] + 20), v4, v5, v6);
    }
    this[5] = (mach_o::Header *)v9;
  }
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
}

void mach_o::Image::makeRebaseOpcodes(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZN6mach_o5Image17makeRebaseOpcodesEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_62;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeBindOpcodes(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZN6mach_o5Image15makeBindOpcodesEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_63;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeLazyBindOpcodes(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZN6mach_o5Image19makeLazyBindOpcodesEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_64;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeWeakBindOpcodes(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZN6mach_o5Image19makeWeakBindOpcodesEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_65;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeChainedFixups(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZN6mach_o5Image17makeChainedFixupsEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_66;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeFunctionStarts(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZN6mach_o5Image18makeFunctionStartsEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_67;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

void mach_o::Image::makeSplitSegInfo(mach_o::Error **this)
{
  uint64_t v1 = *this;
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = ___ZN6mach_o5Image16makeSplitSegInfoEv_block_invoke;
  v2[3] = &__block_descriptor_tmp_71;
  v2[4] = this;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v2, (mach_o::Error *)v3);
  mach_o::Error::~Error((mach_o::Error *)v3);
}

mach_o::Image *mach_o::Image::Image(mach_o::Image *this, mach_header *a2)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *(void *)this = a2;
  *((unsigned char *)this + 24) = 2;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  BOOL hasZerofillExpansion = mach_o::Header::hasZerofillExpansion((mach_o::Header *)a2);
  *((unsigned char *)this + 25) = hasZerofillExpansion;
  *((void *)this + 2) = mach_o::Header::computeLinkEditBias(*(mach_o::Header **)this, hasZerofillExpansion);
  mach_o::Image::makeExportsTrie((mach_o::Error **)this);
  mach_o::Image::makeSymbolTable((mach_o::Header **)this);
  mach_o::Image::makeRebaseOpcodes((mach_o::Error **)this);
  mach_o::Image::makeBindOpcodes((mach_o::Error **)this);
  mach_o::Image::makeLazyBindOpcodes((mach_o::Error **)this);
  mach_o::Image::makeWeakBindOpcodes((mach_o::Error **)this);
  mach_o::Image::makeChainedFixups((mach_o::Error **)this);
  mach_o::Image::makeFunctionStarts((mach_o::Error **)this);
  int v4 = *(mach_o::Error **)this;
  v6[0] = MEMORY[0x1E4F14BE8];
  v6[1] = 0x40000000;
  v6[2] = ___ZN6mach_o5Image17makeCompactUnwindEv_block_invoke;
  void v6[3] = &__block_descriptor_tmp_70;
  v6[4] = this;
  mach_o::Header::forEachSection(v4, (uint64_t)v6);
  mach_o::Image::makeSplitSegInfo((mach_o::Error **)this);
  return this;
}

void mach_o::Image::validate(mach_o::Image *this@<X0>, mach_o::Error *a2@<X8>)
{
  mach_o::Header::valid(*(mach_o::Header **)this, *((void *)this + 1), a2);
  if (!*(void *)a2)
  {
    mach_o::Error::~Error(a2);
    mach_o::Header::arch(*(mach_header **)this, &v5);
    mach_o::Header::platformAndVersions(*(mach_o::Header **)this, (uint64_t)v4);
    mach_o::Policy::Policy(v6, &v5, v4, *(unsigned int *)(*(void *)this + 12), 0, 0);
    mach_o::Image::validInitializers((mach_o::Header **)this, a2);
    if (!*(void *)a2)
    {
      mach_o::Error::~Error(a2);
      mach_o::Image::validLinkedit((mach_o::Header **)this, (const mach_o::Policy *)v6, a2);
      if (!*(void *)a2)
      {
        mach_o::Error::~Error(a2);
        *(void *)a2 = 0;
      }
    }
  }
}

void mach_o::Image::validInitializers(mach_o::Header **this@<X0>, mach_o::Error *a2@<X8>)
{
  uint64_t Address = mach_o::Header::preferredLoadAddress(*this);
  uint64_t Slide = mach_o::Header::getSlide(*this);
  uint64_t v23 = 0;
  unsigned int v24 = &v23;
  uint64_t v25 = 0x3002000000;
  size_t v26 = __Block_byref_object_copy__3;
  uint64_t v27 = __Block_byref_object_dispose__3;
  uint64_t v28 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x10002000000;
  uint64_t v19 = __Block_byref_object_copy__42;
  size_t v20 = __Block_byref_object_dispose__43;
  v21[24] = v21;
  long long v22 = xmmword_1ACF93AC0;
  BOOL v7 = *this;
  v15[0] = MEMORY[0x1E4F14BE8];
  v15[1] = 0x40000000;
  void v15[2] = ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke;
  v15[3] = &unk_1E5E6CA20;
  v15[4] = &v16;
  mach_o::Header::forEachSegment(v7, (uint64_t)v15);
  if (v17[31])
  {
    uint64_t v8 = *this;
    v14[0] = MEMORY[0x1E4F14BE8];
    v14[1] = 0x40000000;
    void v14[2] = ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_2;
    void v14[3] = &unk_1E5E6CA48;
    v14[4] = &v16;
    v14[5] = &v23;
    mach_o::Header::forEachLoadCommandSafe(v8, (uint64_t)v14);
    uint64_t v9 = *this;
    v13[0] = MEMORY[0x1E4F14BE8];
    v13[1] = 0x40000000;
    v13[2] = ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_3;
    v13[3] = &unk_1E5E6CA70;
    v13[4] = &v23;
    v13[5] = &v16;
    v13[6] = this;
    v13[7] = Address;
    mach_o::Header::forEachSection(v9, (uint64_t)v13);
    uint64_t v10 = v24 + 5;
    if (v24[5]) {
      goto LABEL_4;
    }
    BOOL v11 = *this;
    v12[0] = MEMORY[0x1E4F14BE8];
    v12[1] = 0x40000000;
    v12[2] = ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_4;
    v12[3] = &unk_1E5E6CA98;
    v12[4] = &v23;
    v12[5] = &v16;
    v12[6] = Slide;
    v12[7] = Address;
    mach_o::Header::forEachSection(v11, (uint64_t)v12);
    uint64_t v10 = v24 + 5;
    if (v24[5]) {
LABEL_4:
    }
      mach_o::Error::Error(a2, v10);
    else {
      *(void *)a2 = 0;
    }
  }
  else
  {
    mach_o::Error::Error(a2, "no executable segments");
  }
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v23, 8);
  mach_o::Error::~Error((mach_o::Error *)&v28);
}

void mach_o::Image::validLinkedit(mach_o::Header **this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v37 = *MEMORY[0x1E4F14BF8];
  mach_o::Image::validStructureLinkedit(this, a2, a3);
  if (!*(void *)a3)
  {
    mach_o::Error::~Error(a3);
    uint64_t v8 = this[4];
    if (v8)
    {
      mach_o::ExportsTrie::valid(v8, 0x200000000, v6, v7);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }
    if (this[5])
    {
      mach_o::NListSymbolTable::valid(a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }
    uint64_t v9 = mach_o::Image::segmentCount(this);
    unint64_t v10 = v9;
    int v14 = MEMORY[0x1F41887A8](v9, v11, v12, v13);
    uint64_t v16 = (char *)v35 - v15;
    if (v14)
    {
      uint64_t v17 = v16 + 32;
      uint64_t v18 = 56 * v10;
      do
      {
        *uint64_t v17 = 0;
        v17[1] = 0;
        v17 += 7;
        v18 -= 56;
      }
      while (v18);
      uint64_t v19 = 0;
      size_t v20 = v16;
      do
      {
        mach_o::Image::segment(this, v19, (uint64_t)v35);
        long long v21 = v35[1];
        *(_OWORD *)size_t v20 = v35[0];
        *((_OWORD *)v20 + 1) = v21;
        *((_OWORD *)v20 + 2) = *(_OWORD *)v36;
        *(_DWORD *)(v20 + 47) = *(_DWORD *)&v36[15];
        ++v19;
        v20 += 56;
      }
      while (v10 != v19);
    }
    uint64_t v22 = (uint64_t)this[6];
    if (v22)
    {
      BOOL HaveTextFixups = mach_o::Header::mayHaveTextFixups(*this);
      char Cmds = mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2);
      mach_o::RebaseOpcodes::valid(v22, (uint64_t)v16, v10, (BOOL *)HaveTextFixups, Cmds, a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }
    uint64_t v25 = (uint64_t)this[7];
    if (v25)
    {
      int v26 = mach_o::Header::linkedDylibCount(*this, 0);
      char v27 = mach_o::Header::mayHaveTextFixups(*this);
      char v28 = mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2);
      mach_o::BindOpcodes::valid(v25, (uint64_t)v16, v10, v26, v27, v28, a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }
    uint64_t v29 = (uint64_t)this[8];
    if (v29)
    {
      int v30 = mach_o::Header::linkedDylibCount(*this, 0);
      char v31 = mach_o::Header::mayHaveTextFixups(*this);
      char v32 = mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2);
      mach_o::BindOpcodes::valid(v29, (uint64_t)v16, v10, v30, v31, v32, a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }
    uint64_t v33 = (unsigned int **)this[10];
    if (v33)
    {
      uint64_t Address = mach_o::Header::preferredLoadAddress(*this);
      mach_o::ChainedFixups::valid(v33, Address, (uint64_t)v16, v10, a3);
      if (*(void *)a3) {
        return;
      }
      mach_o::Error::~Error(a3);
    }
    *(void *)a3 = 0;
  }
}

void mach_o::Image::validStructureLinkedit(mach_o::Header **this@<X0>, const mach_o::Policy *a2@<X1>, mach_o::Error *a3@<X8>)
{
  uint64_t v87 = *MEMORY[0x1E4F14BF8];
  int v6 = mach_o::Header::pointerSize(*this);
  uint64_t v81 = 0;
  v82 = &v81;
  uint64_t v83 = 0x2000000000;
  v84 = v85;
  uint64_t v77 = 0;
  v78 = &v77;
  uint64_t v79 = 0x2000000000;
  int v80 = 0;
  uint64_t v73 = 0;
  v74 = &v73;
  uint64_t v75 = 0x2000000000;
  int v76 = 0;
  uint64_t v69 = 0;
  v70 = &v69;
  uint64_t v71 = 0x2000000000;
  char v72 = 0;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2000000000;
  char v68 = 0;
  uint64_t v61 = 0;
  v62 = &v61;
  uint64_t v63 = 0x2000000000;
  char v64 = 0;
  uint64_t v57 = 0;
  v58 = &v57;
  uint64_t v59 = 0x2000000000;
  char v60 = 0;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x2000000000;
  char v56 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = &v47;
  uint64_t v49 = 0x3002000000;
  uint64_t v50 = __Block_byref_object_copy__3;
  uint64_t v51 = __Block_byref_object_dispose__3;
  uint64_t v52 = 0;
  uint64_t v7 = *this;
  v44[0] = MEMORY[0x1E4F14BE8];
  v44[1] = 0x40000000;
  v44[2] = ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke;
  v44[3] = &unk_1E5E6C980;
  v44[4] = &v77;
  v44[5] = &v47;
  int v45 = v6;
  v44[6] = &v81;
  v44[7] = &v69;
  v44[8] = &v73;
  v44[9] = &v65;
  v44[10] = &v61;
  v44[11] = &v57;
  v44[12] = &v53;
  mach_o::Header::forEachLoadCommand(v7, (uint64_t)v44, (mach_o::Error *)v46);
  mach_o::Error::~Error((mach_o::Error *)v46);
  if (v48[5])
  {
    mach_o::Error::Error(a3, v48 + 5);
  }
  else
  {
    if (*((unsigned char *)v70 + 24) && *((_DWORD *)v78 + 6) != *((_DWORD *)v74 + 6))
    {
      mach_o::Error::Error(a3, "symbol count from symbol table and dynamic symbol table differ");
      goto LABEL_57;
    }
    if (*((unsigned char *)v58 + 24) && mach_o::Policy::enforceOneFixupEncoding(a2))
    {
      if (*((unsigned char *)v66 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_INFO_ONLY and local relocations");
        goto LABEL_57;
      }
      if (*((unsigned char *)v62 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_INFO_ONLY and external relocations");
        goto LABEL_57;
      }
    }
    if (*((unsigned char *)v54 + 24))
    {
      if (*((unsigned char *)v66 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_CHAINED_FIXUPS and local relocations");
        goto LABEL_57;
      }
      if (*((unsigned char *)v62 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_CHAINED_FIXUPS and external relocations");
        goto LABEL_57;
      }
      if (*((unsigned char *)v58 + 24))
      {
        mach_o::Error::Error(a3, "malformed mach-o contains LC_DYLD_INFO and LC_DYLD_CHAINED_FIXUPS");
        goto LABEL_57;
      }
    }
    uint64_t v40 = 0;
    size_t v41 = &v40;
    uint64_t v42 = 0x2000000000;
    uint64_t v43 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = &v36;
    uint64_t v38 = 0x2000000000;
    uint64_t v39 = 0;
    if (mach_o::Header::isObjectFile(*this) || mach_o::Header::isPreload(*this))
    {
      uint64_t v8 = *this;
      v35[0] = MEMORY[0x1E4F14BE8];
      v35[1] = 0x40000000;
      _OWORD v35[2] = ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_2;
      v35[3] = &unk_1E5E6C9A8;
      v35[4] = &v40;
      mach_o::Header::forEachSection(v8, (uint64_t)v35);
      v37[3] = (uint64_t)this[1];
      if (!v41[3])
      {
        uint64_t v9 = *this;
        v34[0] = MEMORY[0x1E4F14BE8];
        v34[1] = 0x40000000;
        v34[2] = ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_3;
        v34[3] = &unk_1E5E6C9D0;
        v34[4] = &v40;
        mach_o::Header::forEachLoadCommandSafe(v9, (uint64_t)v34);
      }
    }
    else
    {
      unint64_t v10 = *this;
      v32[0] = MEMORY[0x1E4F14BE8];
      v32[1] = 0x40000000;
      v32[2] = ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_4;
      v32[3] = &unk_1E5E6C9F8;
      v32[4] = &v40;
      v32[5] = &v36;
      mach_o::Header::forEachLoadCommand(v10, (uint64_t)v32, (mach_o::Error *)v33);
      mach_o::Error::~Error((mach_o::Error *)v33);
      if (!v41[3] || !v37[3])
      {
        mach_o::Error::Error(a3, "bad or unknown fileoffset/size for LINKEDIT");
        goto LABEL_56;
      }
    }
    uint64_t v11 = v82[3] - (void)v85;
    if (v11)
    {
      unint64_t v12 = v11 / 24;
      if (v12 != 1)
      {
        uint64_t v13 = 0;
        unsigned int v14 = 0;
        do
        {
          unint64_t v15 = v12 + ~v13;
          if (!v15) {
            break;
          }
          unint64_t v16 = 0;
          unsigned int v17 = 1;
          char v18 = 1;
          do
          {
            unint64_t v19 = v17;
            if (*(_DWORD *)&v85[24 * v16 + 12] > *(_DWORD *)&v85[24 * v17 + 12])
            {
              char v18 = 0;
              size_t v20 = &v85[24 * v17];
              long long v21 = &v85[24 * v16];
              uint64_t v22 = *((void *)v21 + 2);
              long long v23 = *(_OWORD *)v21;
              uint64_t v24 = *((void *)v20 + 2);
              *(_OWORD *)long long v21 = *(_OWORD *)v20;
              *((void *)v21 + 2) = v24;
              *(_OWORD *)size_t v20 = v23;
              *((void *)v20 + 2) = v22;
            }
            unsigned int v17 = v19 + 1;
            unint64_t v16 = v19;
          }
          while (v15 > v19);
          uint64_t v13 = ++v14;
        }
        while (!(v18 & 1 | (v12 - 1 <= v14)));
      }
      if (v12 <= 1) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = v12;
      }
      unint64_t v26 = v86;
      if (v41[3] > (unint64_t)v86)
      {
LABEL_51:
        mach_o::Error::Error(a3, "LINKEDIT overlap of %s and %s");
        goto LABEL_56;
      }
      char v27 = v85;
      while (1)
      {
        uint64_t v28 = *((void *)v27 + 2);
        BOOL v29 = __CFADD__(v26, v28);
        unint64_t v30 = v26 + v28;
        if (v29 || v30 > v37[3])
        {
          mach_o::Error::Error(a3, "LINKEDIT content '%s' extends beyond end of segment");
          goto LABEL_56;
        }
        if (((*((_DWORD *)v27 + 2) - 1) & v26) != 0)
        {
          if (!strcmp(*(const char **)v27, "code signature"))
          {
            if (mach_o::Policy::enforceSegmentOrderMatchesLoadCmds(a2))
            {
              mach_o::Error::Error(a3, "mis-aligned code signature");
              goto LABEL_56;
            }
          }
          else if (mach_o::Policy::enforceLinkeditContentAlignment(a2))
          {
            mach_o::Error::Error(a3, "mis-aligned LINKEDIT content '%s'");
            goto LABEL_56;
          }
        }
        if (!--v25) {
          goto LABEL_40;
        }
        unint64_t v31 = *((void *)v27 + 2) + *((unsigned int *)v27 + 3);
        unint64_t v26 = *((unsigned int *)v27 + 9);
        v27 += 24;
        if (v31 > v26) {
          goto LABEL_51;
        }
      }
    }
    if (mach_o::Header::isObjectFile(*this)) {
LABEL_40:
    }
      *(void *)a3 = 0;
    else {
      mach_o::Error::Error(a3, "malformed mach-o has no LINKEDIT information");
    }
LABEL_56:
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
LABEL_57:
  _Block_object_dispose(&v47, 8);
  mach_o::Error::~Error((mach_o::Error *)&v52);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);
}

uint64_t mach_o::Image::segmentCount(mach_o::Error **this)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2000000000;
  int v9 = 0;
  uint64_t v1 = *this;
  v4[0] = MEMORY[0x1E4F14BE8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK6mach_o5Image12segmentCountEv_block_invoke;
  void v4[3] = &unk_1E5E6CC08;
  void v4[4] = &v6;
  mach_o::Header::forEachLoadCommand(v1, (uint64_t)v4, (mach_o::Error *)v5);
  mach_o::Error::~Error((mach_o::Error *)v5);
  uint64_t v2 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

void mach_o::Image::segment(mach_o::Error **this@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v13 = 0;
  unsigned int v14 = &v13;
  uint64_t v15 = 0x6002000000;
  unint64_t v16 = __Block_byref_object_copy__73;
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  unsigned int v17 = __Block_byref_object_dispose__74;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2000000000;
  int v12 = 0;
  v10[0] = 0;
  v10[1] = v10;
  vm_address_t v10[2] = 0x2000000000;
  void v10[3] = 0;
  int v4 = *this;
  v7[0] = MEMORY[0x1E4F14BE8];
  v7[1] = 0x40000000;
  unsigned int v7[2] = ___ZNK6mach_o5Image7segmentEj_block_invoke;
  void v7[3] = &unk_1E5E6CC30;
  v7[4] = v10;
  v7[5] = v11;
  int v8 = a2;
  void v7[6] = &v13;
  void v7[7] = this;
  mach_o::Header::forEachLoadCommand(v4, (uint64_t)v7, (mach_o::Error *)v9);
  mach_o::Error::~Error((mach_o::Error *)v9);
  int32_t v5 = v14;
  long long v6 = *(_OWORD *)(v14 + 7);
  *(_OWORD *)a3 = *(_OWORD *)(v14 + 5);
  *(_OWORD *)(a3 + 16) = v6;
  *(_OWORD *)(a3 + 32) = *(_OWORD *)(v5 + 9);
  *(void *)(a3 + 48) = v5[11];
  _Block_object_dispose(v10, 8);
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);
}

void *__Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  return mach_o::Error::Error((void *)(a1 + 40), (void *)(a2 + 40));
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke(uint64_t a1, int *a2, unsigned char *a3)
{
  int v5 = *a2;
  if (*a2 > 28)
  {
    switch(v5)
    {
      case 29:
        unsigned int v6 = a2[3];
        if (!v6) {
          return;
        }
        int v7 = *(_DWORD *)(a1 + 104);
        int v8 = a2[2];
        uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v10 = *(void *)(v9 + 24);
        *(void *)(v9 + 24) = v10 + 24;
        uint64_t v11 = "code signature";
        goto LABEL_48;
      case 30:
        unsigned int v6 = a2[3];
        if (!v6) {
          return;
        }
        int v7 = *(_DWORD *)(a1 + 104);
        int v8 = a2[2];
        uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v10 = *(void *)(v14 + 24);
        *(void *)(v14 + 24) = v10 + 24;
        uint64_t v11 = "shared cache info";
        goto LABEL_48;
      case 31:
      case 32:
      case 33:
      case 35:
      case 36:
      case 37:
        return;
      case 34:
        goto LABEL_35;
      case 38:
        unsigned int v6 = a2[3];
        if (!v6) {
          return;
        }
        int v7 = *(_DWORD *)(a1 + 104);
        int v8 = a2[2];
        uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v10 = *(void *)(v15 + 24);
        *(void *)(v15 + 24) = v10 + 24;
        uint64_t v11 = "function starts";
        goto LABEL_48;
      default:
        if (v5 != 41)
        {
          if (v5 == 54)
          {
            unsigned int v6 = a2[3];
            if (v6)
            {
              int v7 = *(_DWORD *)(a1 + 104);
              int v8 = a2[2];
              uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
              uint64_t v10 = *(void *)(v13 + 24);
              *(void *)(v13 + 24) = v10 + 24;
              uint64_t v11 = "atom info";
              goto LABEL_48;
            }
          }
          return;
        }
        unsigned int v6 = a2[3];
        if (!v6) {
          return;
        }
        int v7 = *(_DWORD *)(a1 + 104);
        int v8 = a2[2];
        uint64_t v46 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v10 = *(void *)(v46 + 24);
        *(void *)(v46 + 24) = v10 + 24;
        uint64_t v11 = "data in code";
        break;
    }
    goto LABEL_48;
  }
  if (v5 <= -2147483597)
  {
    if (v5 == -2147483614)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
LABEL_35:
      uint64_t v25 = a2[3];
      if (v25)
      {
        int v26 = *(_DWORD *)(a1 + 104);
        int v27 = a2[2];
        uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v29 = *(void *)(v28 + 24);
        *(void *)(v28 + 24) = v29 + 24;
        *(void *)uint64_t v29 = "rebase opcodes";
        *(_DWORD *)(v29 + 8) = v26;
        *(_DWORD *)(v29 + 12) = v27;
        *(void *)(v29 + 16) = v25;
      }
      uint64_t v30 = a2[5];
      if (v30)
      {
        int v31 = *(_DWORD *)(a1 + 104);
        int v32 = a2[4];
        uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v34 = *(void *)(v33 + 24);
        *(void *)(v33 + 24) = v34 + 24;
        *(void *)uint64_t v34 = "bind opcodes";
        *(_DWORD *)(v34 + 8) = v31;
        *(_DWORD *)(v34 + 12) = v32;
        *(void *)(v34 + 16) = v30;
      }
      uint64_t v35 = a2[7];
      if (v35)
      {
        int v36 = *(_DWORD *)(a1 + 104);
        int v37 = a2[6];
        uint64_t v38 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v39 = *(void *)(v38 + 24);
        *(void *)(v38 + 24) = v39 + 24;
        *(void *)uint64_t v39 = "weak bind opcodes";
        *(_DWORD *)(v39 + 8) = v36;
        *(_DWORD *)(v39 + 12) = v37;
        *(void *)(v39 + 16) = v35;
      }
      uint64_t v40 = a2[9];
      if (v40)
      {
        int v41 = *(_DWORD *)(a1 + 104);
        int v42 = a2[8];
        uint64_t v43 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v44 = *(void *)(v43 + 24);
        *(void *)(v43 + 24) = v44 + 24;
        *(void *)uint64_t v44 = "lazy bind opcodes";
        *(_DWORD *)(v44 + 8) = v41;
        *(_DWORD *)(v44 + 12) = v42;
        *(void *)(v44 + 16) = v40;
      }
      unsigned int v6 = a2[11];
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)(a1 + 104);
      int v8 = a2[10];
    }
    else
    {
      if (v5 != -2147483597) {
        return;
      }
      unsigned int v6 = a2[3];
      if (!v6) {
        return;
      }
      int v7 = *(_DWORD *)(a1 + 104);
      int v8 = a2[2];
    }
    uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void *)(v45 + 24);
    *(void *)(v45 + 24) = v10 + 24;
    uint64_t v11 = "exports trie";
LABEL_48:
    *(void *)uint64_t v10 = v11;
    goto LABEL_49;
  }
  if (v5 == -2147483596)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 1;
    unsigned int v6 = a2[3];
    if (!v6) {
      return;
    }
    int v7 = *(_DWORD *)(a1 + 104);
    int v8 = a2[2];
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void *)(v16 + 24);
    *(void *)(v16 + 24) = v10 + 24;
    uint64_t v11 = "chained fixups";
    goto LABEL_48;
  }
  if (v5 != 2)
  {
    if (v5 != 11) {
      return;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    if (a2[15] < 0x10000001)
    {
      if (a2[2])
      {
        mach_o::Error::Error((mach_o::Error *)&v60, "malformed mach-o image: indirect symbol table ilocalsym != 0");
      }
      else
      {
        int v47 = a2[4];
        if (v47 == a2[3])
        {
          if (a2[6] == a2[5] + v47) {
            goto LABEL_58;
          }
          mach_o::Error::Error((mach_o::Error *)&v60, "malformed mach-o image: indirect symbol table iundefsym != iextdefsym+nextdefsym");
        }
        else
        {
          mach_o::Error::Error((mach_o::Error *)&v60, "malformed mach-o image: indirect symbol table iextdefsym != nlocalsym");
        }
      }
    }
    else
    {
      mach_o::Error::Error((mach_o::Error *)&v60, "malformed mach-o image: indirect symbol table too large");
    }
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), &v60);
    mach_o::Error::~Error((mach_o::Error *)&v60);
    *a3 = 1;
LABEL_58:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a2[7] + a2[6];
    uint64_t v48 = a2[19];
    if (v48)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      int v49 = *(_DWORD *)(a1 + 104);
      int v50 = a2[18];
      uint64_t v51 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v52 = *(void *)(v51 + 24);
      *(void *)(v51 + 24) = v52 + 24;
      *(void *)uint64_t v52 = "local relocations";
      *(_DWORD *)(v52 + 8) = v49;
      *(_DWORD *)(v52 + 12) = v50;
      *(void *)(v52 + 16) = 8 * v48;
    }
    uint64_t v53 = a2[17];
    if (v53)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      int v54 = *(_DWORD *)(a1 + 104);
      int v55 = a2[16];
      uint64_t v56 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v57 = *(void *)(v56 + 24);
      *(void *)(v56 + 24) = v57 + 24;
      *(void *)uint64_t v57 = "external relocations";
      *(_DWORD *)(v57 + 8) = v54;
      *(_DWORD *)(v57 + 12) = v55;
      *(void *)(v57 + 16) = 8 * v53;
    }
    int v58 = a2[15];
    if (v58)
    {
      int v8 = a2[14];
      unsigned int v6 = 4 * v58;
      uint64_t v59 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v10 = *(void *)(v59 + 24);
      *(void *)(v59 + 24) = v10 + 24;
      *(void *)uint64_t v10 = "indirect symbol table";
      int v7 = 4;
      goto LABEL_49;
    }
    return;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2[3];
  unsigned int v17 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v17)
  {
    if (v17 >= 0x10000001)
    {
      mach_o::Error::Error((mach_o::Error *)&v60, "malformed mach-o image: symbol table too large");
      mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), &v60);
      mach_o::Error::~Error((mach_o::Error *)&v60);
      *a3 = 1;
      unsigned int v17 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    }
    int v18 = *(_DWORD *)(a1 + 104);
    if (v18 == 8) {
      int v19 = 16;
    }
    else {
      int v19 = 12;
    }
    uint64_t v20 = v19 * v17;
    int v21 = a2[2];
    uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v23 = *(void *)(v22 + 24);
    *(void *)(v22 + 24) = v23 + 24;
    *(void *)uint64_t v23 = "symbol table";
    *(_DWORD *)(v23 + 8) = v18;
    *(_DWORD *)(v23 + 12) = v21;
    *(void *)(v23 + 16) = v20;
  }
  unsigned int v6 = a2[5];
  if (v6)
  {
    int v8 = a2[4];
    uint64_t v24 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v10 = *(void *)(v24 + 24);
    *(void *)(v24 + 24) = v10 + 24;
    *(void *)uint64_t v10 = "symbol table strings";
    int v7 = 1;
LABEL_49:
    *(_DWORD *)(v10 + 8) = v7;
    *(_DWORD *)(v10 + 12) = v8;
    *(void *)(v10 + 16) = v6;
  }
}

uint64_t ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_2(uint64_t result, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 40);
  if (v2 != 1 && v2 != 18)
  {
    unint64_t v4 = *(void *)(a2 + 56) + *(unsigned int *)(a2 + 64);
    uint64_t v5 = *(void *)(*(void *)(result + 32) + 8);
    if (v4 > *(void *)(v5 + 24)) {
      *(void *)(v5 + 24) = v4;
    }
  }
  return result;
}

uint64_t ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_3(uint64_t result, _DWORD *a2)
{
  if (*a2 == 2) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2[2];
  }
  return result;
}

uint64_t ___ZNK6mach_o5Image22validStructureLinkeditERKNS_6PolicyE_block_invoke_4(uint64_t result, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = result;
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t result = strcmp((const char *)(a2 + 8), "__LINKEDIT");
    if (result) {
      return result;
    }
    uint64_t v7 = *(unsigned int *)(a2 + 32);
    int v8 = *(_DWORD *)(a2 + 36);
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = v7;
    uint64_t v6 = (v8 + v7);
    goto LABEL_7;
  }
  if (*(_DWORD *)a2 == 25)
  {
    uint64_t result = strcmp((const char *)(a2 + 8), "__LINKEDIT");
    if (!result)
    {
      *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = *(void *)(a2 + 40);
      uint64_t v6 = *(void *)(a2 + 48) + *(void *)(a2 + 40);
LABEL_7:
      *(void *)(*(void *)(*(void *)(v5 + 40) + 8) + 24) = v6;
      *a3 = 1;
    }
  }
  return result;
}

__n128 __Block_byref_object_copy__42(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = v2;
  long long v3 = *(_OWORD *)(a2 + 72);
  long long v4 = *(_OWORD *)(a2 + 88);
  long long v5 = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v5;
  *(_OWORD *)(a1 + 88) = v4;
  *(_OWORD *)(a1 + 72) = v3;
  long long v6 = *(_OWORD *)(a2 + 136);
  long long v7 = *(_OWORD *)(a2 + 152);
  long long v8 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 168) = v8;
  *(_OWORD *)(a1 + 152) = v7;
  *(_OWORD *)(a1 + 136) = v6;
  __n128 result = *(__n128 *)(a2 + 200);
  long long v10 = *(_OWORD *)(a2 + 216);
  long long v11 = *(_OWORD *)(a2 + 232);
  *(void *)(a1 + 248) = *(void *)(a2 + 248);
  *(_OWORD *)(a1 + 232) = v11;
  *(_OWORD *)(a1 + 216) = v10;
  *(__n128 *)(a1 + 200) = result;
  return result;
}

double ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(a2 + 44) & 4) != 0)
  {
    long long v2 = (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 232);
    unint64_t v3 = *(void *)(a2 + 24) + *(void *)(a2 + 16);
    v5.n128_u64[0] = *(void *)(a2 + 16);
    v5.n128_u64[1] = v3;
    int v6 = *(_DWORD *)(a2 + 36);
    *(void *)&double result = dyld3::Array<mach_o::SegmentRanges::SegmentRange>::push_back(v2, &v5).n128_u64[0];
  }
  return result;
}

__n128 dyld3::Array<mach_o::SegmentRanges::SegmentRange>::push_back(uint64_t *a1, __n128 *a2)
{
  unint64_t v2 = a1[2];
  if (v2 >= a1[1]) {
    dyld3::Array<mach_o::SegmentRanges::SegmentRange>::push_back();
  }
  uint64_t v3 = *a1;
  a1[2] = v2 + 1;
  long long v4 = (__n128 *)(v3 + 24 * v2);
  __n128 result = *a2;
  v4[1].n128_u64[0] = a2[1].n128_u64[0];
  *long long v4 = result;
  return result;
}

void ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_2(uint64_t a1, _DWORD *a2, unsigned char *a3)
{
  if (*a2 != 26)
  {
    if (*a2 != 17) {
      return;
    }
    unint64_t v5 = a2[2];
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = *(void *)(v6 + 248);
    if (v7)
    {
      uint64_t v8 = *(void *)(v6 + 232);
      uint64_t v9 = 24 * v7;
      long long v10 = (unint64_t *)(v8 + 8);
      while (*(v10 - 1) > v5 || *v10 <= v5)
      {
        v10 += 3;
        v9 -= 24;
        if (!v9) {
          goto LABEL_8;
        }
      }
      return;
    }
LABEL_8:
    mach_o::Error::Error((mach_o::Error *)&v17, "LC_ROUTINES initializer 0x%08llX is not an offset to an executable segment");
LABEL_15:
    mach_o::Error::operator=((void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), &v17);
    mach_o::Error::~Error((mach_o::Error *)&v17);
    *a3 = 1;
    return;
  }
  unint64_t v11 = *((void *)a2 + 1);
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = *(void *)(v12 + 248);
  if (!v13)
  {
LABEL_14:
    mach_o::Error::Error((mach_o::Error *)&v17, "LC_ROUTINES _64 initializer 0x%08llX is not an offset to an executable segment");
    goto LABEL_15;
  }
  uint64_t v14 = *(void *)(v12 + 232);
  uint64_t v15 = 24 * v13;
  uint64_t v16 = (unint64_t *)(v14 + 8);
  while (*(v16 - 1) > v11 || *v16 <= v11)
  {
    v16 += 3;
    v15 -= 24;
    if (!v15) {
      goto LABEL_14;
    }
  }
}

void ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_3(void *a1, uint64_t a2, unsigned char *a3)
{
  int v3 = *(unsigned __int8 *)(a2 + 40);
  if ((v3 - 9) > 1) {
    return;
  }
  uint64_t v7 = (mach_o::Header **)a1[6];
  unint64_t v8 = *(void *)(a2 + 56);
  if (v8 % mach_o::Header::pointerSize(*v7))
  {
    mach_o::Error::Error((mach_o::Error *)&v34, "section %s/%s size (%llu) is not a multiple of pointer-size");
LABEL_6:
    mach_o::Error::operator=((void *)(*(void *)(a1[4] + 8) + 40), &v34);
    mach_o::Error::~Error((mach_o::Error *)&v34);
    *a3 = 1;
    return;
  }
  unint64_t v9 = *(void *)(a2 + 48);
  if (v9 % mach_o::Header::pointerSize(*v7))
  {
    mach_o::Error::Error((mach_o::Error *)&v34, "section %s/%s address (0x%llX) is not pointer aligned");
    goto LABEL_6;
  }
  long long v10 = *v7;
  uint64_t v11 = *(unsigned int *)(a2 + 64);
  if (mach_o::Header::inDyldCache(*v7))
  {
    uint64_t v12 = *(void *)(a2 + 48);
    uint64_t v13 = (char *)(mach_o::Header::getSlide(*v7) + v12);
  }
  else
  {
    uint64_t v13 = (char *)v10 + v11;
  }
  BOOL v14 = mach_o::Header::is64(*v7);
  uint64_t v15 = *(void *)(a2 + 56);
  unint64_t v16 = (unint64_t)&v13[v15];
  if (v14)
  {
    if (v15 >= 1)
    {
      uint64_t v17 = *(void *)(a1[5] + 8);
      uint64_t v18 = *(void *)(v17 + 232);
      uint64_t v19 = *(void *)(v17 + 248);
      uint64_t v20 = (unint64_t *)(v18 + 8);
      int v21 = v13;
      while (v19)
      {
        unint64_t v22 = a1[7] + *(unsigned int *)v21;
        uint64_t v23 = v20;
        uint64_t v24 = 24 * v19;
        while (*(v23 - 1) > v22 || *v23 <= v22)
        {
          v23 += 3;
          v24 -= 24;
          if (!v24) {
            goto LABEL_33;
          }
        }
        v21 += 8;
        if ((unint64_t)v21 >= v16) {
          goto LABEL_37;
        }
      }
      int v21 = v13;
LABEL_33:
      uint64_t v33 = (v21 - v13) >> 3;
LABEL_36:
      mach_o::Error::Error((mach_o::Error *)&v34, "initializer %lu/%llu is not in an executable segment", v33, (unint64_t)v15 >> 3);
      mach_o::Error::operator=((void *)(*(void *)(a1[4] + 8) + 40), &v34);
      mach_o::Error::~Error((mach_o::Error *)&v34);
    }
  }
  else if (v15 >= 1)
  {
    uint64_t v25 = *(void *)(a1[5] + 8);
    uint64_t v26 = *(void *)(v25 + 232);
    uint64_t v27 = *(void *)(v25 + 248);
    uint64_t v28 = (unint64_t *)(v26 + 8);
    uint64_t v29 = v13;
    while (v27)
    {
      unint64_t v30 = a1[7] + (*(_DWORD *)v29 & 0x3FFFFFF);
      int v31 = v28;
      uint64_t v32 = 24 * v27;
      while (*(v31 - 1) > v30 || *v31 <= v30)
      {
        v31 += 3;
        v32 -= 24;
        if (!v32) {
          goto LABEL_35;
        }
      }
      v29 += 4;
      if ((unint64_t)v29 >= v16) {
        goto LABEL_37;
      }
    }
    uint64_t v29 = v13;
LABEL_35:
    uint64_t v33 = (v29 - v13) >> 2;
    uint64_t v15 = (((unint64_t)v15 >> 2) * (unsigned __int128)0x6186186186186187uLL) >> 64;
    goto LABEL_36;
  }
LABEL_37:
  if (v3 == 10
    && mach_o::Header::isDyldManaged(*v7)
    && mach_o::Header::isArch((mach_header *)*v7, "arm6e"))
  {
    mach_o::Error::Error((mach_o::Error *)&v34, "terminators section %s/%s not supported for arm64e", *(const char **)(a2 + 16), *(const char **)a2);
    mach_o::Error::operator=((void *)(*(void *)(a1[4] + 8) + 40), &v34);
    mach_o::Error::~Error((mach_o::Error *)&v34);
  }
}

void ___ZNK6mach_o5Image17validInitializersERKNS_6PolicyE_block_invoke_4(void *a1, uint64_t a2, unsigned char *a3)
{
  if (*(unsigned char *)(a2 + 40) == 22)
  {
    if ((*(unsigned char *)(a2 + 36) & 2) != 0)
    {
      mach_o::Error::Error((mach_o::Error *)&v16, "initializer offsets section %s/%s must be in read-only segment");
      goto LABEL_6;
    }
    uint64_t v5 = *(void *)(a2 + 56);
    if ((v5 & 3) != 0)
    {
      mach_o::Error::Error((mach_o::Error *)&v16, "initializer offsets section %s/%s has bad size");
LABEL_6:
      mach_o::Error::operator=((void *)(*(void *)(a1[4] + 8) + 40), &v16);
      mach_o::Error::~Error((mach_o::Error *)&v16);
      *a3 = 1;
      return;
    }
    uint64_t v6 = *(void *)(a2 + 48);
    if ((v6 & 3) != 0)
    {
      mach_o::Error::Error((mach_o::Error *)&v16, "initializer offsets section %s/%s is not 4-byte aligned");
      goto LABEL_6;
    }
    if (v5 >= 1)
    {
      uint64_t v7 = (unsigned int *)(a1[6] + v6);
      unint64_t v8 = (unsigned int *)((char *)v7 + v5);
      uint64_t v9 = *(void *)(a1[5] + 8);
      uint64_t v10 = *(void *)(v9 + 232);
      uint64_t v11 = *(void *)(v9 + 248);
      uint64_t v12 = (unint64_t *)(v10 + 8);
      while (v11)
      {
        unint64_t v13 = a1[7] + *v7;
        BOOL v14 = v12;
        uint64_t v15 = 24 * v11;
        while (*(v14 - 1) > v13 || *v14 <= v13)
        {
          v14 += 3;
          v15 -= 24;
          if (!v15) {
            goto LABEL_20;
          }
        }
        if (++v7 >= v8) {
          return;
        }
      }
LABEL_20:
      mach_o::Error::Error((mach_o::Error *)&v16, "initializer 0x%08X is not an offset to an executable segment");
      goto LABEL_6;
    }
  }
}

void *___ZN6mach_o5Image15makeExportsTrieEv_block_invoke(void *result, int *a2)
{
  unint64_t v2 = (void *)result[4];
  int v3 = *a2;
  if (*a2 == -2147483614 || v3 == 34)
  {
    uint64_t v8 = a2[10];
    if (!v8) {
      return result;
    }
    uint64_t v5 = v2 + 14;
    uint64_t v6 = (const unsigned __int8 *)(v2[2] + v8);
    uint64_t v7 = a2[11];
    goto LABEL_8;
  }
  if (v3 == -2147483597)
  {
    uint64_t v4 = a2[2];
    if (v4)
    {
      uint64_t v5 = v2 + 14;
      uint64_t v6 = (const unsigned __int8 *)(v2[2] + v4);
      uint64_t v7 = a2[3];
LABEL_8:
      __n128 result = mach_o::FunctionStarts::FunctionStarts(v5, v6, v7);
      v2[4] = result;
    }
  }
  return result;
}

uint64_t ___ZN6mach_o5Image15makeSymbolTableEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 == 11)
  {
    uint64_t v2 = *(void *)(result + 40);
  }
  else
  {
    if (*a2 != 2) {
      return result;
    }
    uint64_t v2 = *(void *)(result + 32);
  }
  *(void *)(*(void *)(v2 + 8) + 24) = a2;
  return result;
}

uint64_t ___ZN6mach_o5Image17makeRebaseOpcodesEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 | 0x80000000) == 0x80000022)
  {
    uint64_t v2 = a2[3];
    if (v2)
    {
      uint64_t v3 = *(void *)(result + 32);
      uint64_t v4 = (const unsigned __int8 *)(*(void *)(v3 + 16) + a2[2]);
      BOOL v5 = mach_o::Header::is64(*(mach_o::Header **)v3);
      __n128 result = mach_o::RebaseOpcodes::RebaseOpcodes(v3 + 184, v4, v2, v5);
      *(void *)(v3 + 48) = v3 + 184;
    }
  }
  return result;
}

uint64_t ___ZN6mach_o5Image15makeBindOpcodesEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 | 0x80000000) == 0x80000022)
  {
    uint64_t v2 = a2[5];
    if (v2)
    {
      uint64_t v3 = *(void *)(result + 32);
      uint64_t v4 = (const unsigned __int8 *)(*(void *)(v3 + 16) + a2[4]);
      BOOL v5 = mach_o::Header::is64(*(mach_o::Header **)v3);
      __n128 result = mach_o::BindOpcodes::BindOpcodes(v3 + 208, v4, v2, v5);
      *(void *)(v3 + 56) = v3 + 208;
    }
  }
  return result;
}

uint64_t ___ZN6mach_o5Image19makeLazyBindOpcodesEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 | 0x80000000) == 0x80000022)
  {
    uint64_t v2 = a2[9];
    if (v2)
    {
      uint64_t v3 = *(void *)(result + 32);
      uint64_t v4 = (const unsigned __int8 *)(*(void *)(v3 + 16) + a2[8]);
      BOOL v5 = mach_o::Header::is64(*(mach_o::Header **)v3);
      __n128 result = mach_o::BindOpcodes::BindOpcodes(v3 + 240, v4, v2, v5);
      *(void *)(v3 + 240) = &unk_1F03D9588;
      *(void *)(v3 + 64) = v3 + 240;
    }
  }
  return result;
}

uint64_t ___ZN6mach_o5Image19makeWeakBindOpcodesEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if ((*a2 | 0x80000000) == 0x80000022)
  {
    uint64_t v2 = a2[7];
    if (v2)
    {
      uint64_t v3 = *(void *)(result + 32);
      uint64_t v4 = (const unsigned __int8 *)(*(void *)(v3 + 16) + a2[6]);
      BOOL v5 = mach_o::Header::is64(*(mach_o::Header **)v3);
      __n128 result = mach_o::BindOpcodes::BindOpcodes(v3 + 272, v4, v2, v5);
      *(void *)(v3 + 72) = v3 + 272;
    }
  }
  return result;
}

void *___ZN6mach_o5Image17makeChainedFixupsEv_block_invoke(void *result, _DWORD *a2)
{
  if (*a2 == -2147483596)
  {
    uint64_t v2 = a2[3];
    if (v2)
    {
      uint64_t v3 = (void *)result[4];
      __n128 result = mach_o::ChainedFixups::ChainedFixups(v3 + 38, (const dyld_chained_fixups_header *)(v3[2] + a2[2]), v2);
      v3[10] = result;
    }
  }
  return result;
}

void *___ZN6mach_o5Image18makeFunctionStartsEv_block_invoke(void *result, _DWORD *a2)
{
  if (*a2 == 38)
  {
    uint64_t v2 = a2[3];
    if (v2)
    {
      uint64_t v3 = (void *)result[4];
      __n128 result = mach_o::FunctionStarts::FunctionStarts(v3 + 40, (const unsigned __int8 *)(v3[2] + a2[2]), v2);
      v3[11] = result;
    }
  }
  return result;
}

void ___ZN6mach_o5Image17makeCompactUnwindEv_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(void *)(a2 + 8) == 13
    && **(void **)a2 == 0x646E69776E755F5FLL
    && *(void *)(*(void *)a2 + 5) == 0x6F666E695F646E69)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (std::string_view::starts_with[abi:nn180100]((void *)(a2 + 16), "__TEXT"))
    {
      uint64_t v7 = *(void *)v6 + *(unsigned int *)(a2 + 64);
      mach_o::Header::arch(*(mach_header **)v6, (int32_t *)&v8);
      mach_o::CompactUnwind::CompactUnwind((void *)(v6 + 336), &v8, v7, *(void *)(a2 + 56));
      *(void *)(v6 + 96) = v6 + 336;
      *a3 = 1;
    }
  }
}

void *___ZN6mach_o5Image16makeSplitSegInfoEv_block_invoke(void *result, _DWORD *a2, unsigned char *a3)
{
  if (*a2 == 30)
  {
    uint64_t v4 = (void *)result[4];
    __n128 result = mach_o::FunctionStarts::FunctionStarts(v4 + 45, (const unsigned __int8 *)(v4[2] + a2[2]), a2[3]);
    v4[13] = result;
    *a3 = 1;
  }
  return result;
}

uint64_t ___ZNK6mach_o5Image12segmentCountEv_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 == 25 || *a2 == 1) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

__n128 __Block_byref_object_copy__73(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 40);
  long long v3 = *(_OWORD *)(a2 + 56);
  long long v4 = *(_OWORD *)(a2 + 72);
  *(_DWORD *)(a1 + 87) = *(_DWORD *)(a2 + 87);
  *(_OWORD *)(a1 + 72) = v4;
  *(_OWORD *)(a1 + 56) = v3;
  *(__n128 *)(a1 + 40) = result;
  return result;
}

size_t ___ZNK6mach_o5Image7segmentEj_block_invoke(size_t result, uint64_t a2, unsigned char *a3)
{
  size_t v5 = result;
  uint64_t v6 = *(uint64_t **)(result + 56);
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t v15 = a2 + 8;
    __n128 result = strcmp((const char *)(a2 + 8), "__TEXT");
    if (!result) {
      *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = *(unsigned int *)(a2 + 24);
    }
    size_t v8 = v5 + 40;
    uint64_t v9 = *(void *)(*(void *)(v5 + 40) + 8);
    int v10 = *(_DWORD *)(v9 + 24);
    if (v10 != *(_DWORD *)(v5 + 64)) {
      goto LABEL_18;
    }
    uint64_t v16 = *(unsigned int *)(a2 + 24);
    size_t v12 = v5 + 48;
    *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 40) = v16
                                                                - *(void *)(*(void *)(*(void *)(v5 + 32) + 8)
                                                                            + 24);
    uint64_t v17 = *v6;
    if (*((unsigned char *)v6 + 25))
    {
      *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 64) = v17
                                                                  + v16
                                                                  - *(void *)(*(void *)(*(void *)(v5 + 32) + 8)
                                                                              + 24);
      uint64_t v18 = *(unsigned int *)(a2 + 32);
    }
    else
    {
      uint64_t v18 = *(unsigned int *)(a2 + 32);
      *(void *)(*(void *)(*(void *)v12 + 8) + 64) = v17 + v18;
    }
    *(void *)(*(void *)(*(void *)v12 + 8) + 48) = *(unsigned int *)(a2 + 28);
    *(void *)(*(void *)(*(void *)v12 + 8) + 56) = v18;
    __n128 result = strlen((const char *)(a2 + 8));
    uint64_t v21 = *(void *)(*(void *)v12 + 8);
    *(void *)(v21 + 72) = v15;
    *(void *)(v21 + 80) = result;
    uint64_t v20 = (char *)(a2 + 44);
    goto LABEL_17;
  }
  if (*(_DWORD *)a2 != 25) {
    return result;
  }
  uint64_t v7 = a2 + 8;
  __n128 result = strcmp((const char *)(a2 + 8), "__TEXT");
  if (!result) {
    *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = *(void *)(a2 + 24);
  }
  size_t v8 = v5 + 40;
  uint64_t v9 = *(void *)(*(void *)(v5 + 40) + 8);
  int v10 = *(_DWORD *)(v9 + 24);
  if (v10 == *(_DWORD *)(v5 + 64))
  {
    uint64_t v11 = *(void *)(a2 + 24);
    size_t v12 = v5 + 48;
    *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 40) = v11
                                                                - *(void *)(*(void *)(*(void *)(v5 + 32) + 8)
                                                                            + 24);
    uint64_t v13 = *v6;
    if (*((unsigned char *)v6 + 25))
    {
      *(void *)(*(void *)(*(void *)(v5 + 48) + 8) + 64) = v13
                                                                  + v11
                                                                  - *(void *)(*(void *)(*(void *)(v5 + 32) + 8)
                                                                              + 24);
      uint64_t v14 = *(void *)(a2 + 40);
    }
    else
    {
      uint64_t v14 = *(void *)(a2 + 40);
      *(void *)(*(void *)(*(void *)v12 + 8) + 64) = v13 + v14;
    }
    *(void *)(*(void *)(*(void *)v12 + 8) + 48) = *(void *)(a2 + 32);
    *(void *)(*(void *)(*(void *)v12 + 8) + 56) = v14;
    __n128 result = strlen((const char *)(a2 + 8));
    uint64_t v19 = *(void *)(*(void *)v12 + 8);
    *(void *)(v19 + 72) = v7;
    *(void *)(v19 + 80) = result;
    uint64_t v20 = (char *)(a2 + 60);
LABEL_17:
    char v22 = *v20;
    *(unsigned char *)(*(void *)(*(void *)v12 + 8) + 88) = v22 & 1;
    *(unsigned char *)(*(void *)(*(void *)v12 + 8) + 89) = (v22 & 2) != 0;
    *(unsigned char *)(*(void *)(*(void *)v12 + 8) + 90) = (v22 & 4) != 0;
    *a3 = 1;
    uint64_t v9 = *(void *)(*(void *)v8 + 8);
    int v10 = *(_DWORD *)(v9 + 24);
  }
LABEL_18:
  *(_DWORD *)(v9 + 24) = v10 + 1;
  return result;
}

uint64_t Diagnostics::clearError(Diagnostics *this)
{
  uint64_t result = *(void *)this;
  if (result) {
    uint64_t result = _simple_sfree();
  }
  *(void *)this = 0;
  return result;
}

uint64_t Diagnostics::error(Diagnostics *this, const char *a2, ...)
{
  va_start(va, a2);
  return Diagnostics::error(this, a2, va);
}

uint64_t Diagnostics::error(Diagnostics *this, const char *a2, char *a3)
{
  if (!*(void *)this) {
    *(void *)this = _simple_salloc();
  }

  return _simple_vsprintf();
}

uint64_t Diagnostics::appendError(Diagnostics *this, const char *a2, ...)
{
  va_start(va, a2);
  if (*(void *)this) {
    _simple_sresize();
  }
  return Diagnostics::error(this, a2, va);
}

BOOL Diagnostics::hasError(Diagnostics *this)
{
  return *(void *)this != 0;
}

BOOL Diagnostics::noError(Diagnostics *this)
{
  return *(void *)this == 0;
}

const char *Diagnostics::errorMessageCStr(Diagnostics *this)
{
  if (*(void *)this) {
    return (const char *)MEMORY[0x1F40D07F0]();
  }
  else {
    return "";
  }
}

uint64_t legacyDyldLookup4OldBinaries(const char *a1, void **a2)
{
  *a2 = 0;
  return 0;
}

uint64_t _dyld_fork_child()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 96))();
}

uint64_t dyld_get_sdk_version(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 384))(dyld4::gDyld, a1);
}

uint64_t dyld_get_min_os_version(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 392))(dyld4::gDyld, a1);
}

uint64_t dyld_get_program_min_os_version()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 408))();
}

void _tlv_bootstrap(void)
{
}

uint64_t dyld_shared_cache_file_path()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 472))();
}

uint64_t _dyld_objc_notify_register(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 496))(dyld4::gDyld, a1, a2, a3);
}

uint64_t dyld_shared_cache_find_iterate_text(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 528))(dyld4::gDyld, a1, a2, a3);
}

uint64_t dyld_is_simulator_platform(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 576))(dyld4::gDyld, a1);
}

uint64_t dyld_minos_at_least(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 592))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_register_for_image_loads(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 632))(dyld4::gDyld, a1);
}

uint64_t _dyld_atfork_prepare()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 640))();
}

uint64_t _dyld_atfork_parent()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 648))();
}

uint64_t dyld_need_closure(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 656))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_shared_cache_optimized()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 672))();
}

uint64_t _dyld_shared_cache_is_locally_built()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 680))();
}

uint64_t _dyld_register_driverkit_main(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 696))(dyld4::gDyld, a1);
}

uint64_t _dyld_missing_symbol_abort()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 704))();
}

uint64_t _dyld_has_fix_for_radar(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 752))(dyld4::gDyld, a1);
}

uint64_t dlopen_audited(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 784))(dyld4::gDyld, a1, a2);
}

uint64_t _dyld_visit_objc_classes(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 808))(dyld4::gDyld, a1);
}

uint64_t _dyld_objc_uses_large_shared_cache()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 824))();
}

uint64_t _dyld_get_dlopen_image_header(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 888))(dyld4::gDyld, a1);
}

uint64_t _dyld_dlopen_atfork_prepare()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 864))();
}

uint64_t _dyld_dlopen_atfork_parent()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 872))();
}

uint64_t _dyld_dlopen_atfork_child()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 880))();
}

uint64_t _dyld_pseudodylib_register_callbacks(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 936))(dyld4::gDyld, a1);
}

uint64_t _dyld_pseudodylib_deregister_callbacks(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 944))(dyld4::gDyld, a1);
}

uint64_t _dyld_pseudodylib_register(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 952))(dyld4::gDyld, a1, a2, a3, a4);
}

uint64_t _dyld_pseudodylib_deregister(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 960))(dyld4::gDyld, a1);
}

uint64_t _dyld_is_preoptimized_objc_image_loaded(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 968))(dyld4::gDyld, a1);
}

uint64_t _dyld_is_pseudodylib(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1056))(dyld4::gDyld, a1);
}

uint64_t _dyld_find_pointer_hash_table_entry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1016))(dyld4::gDyld, a1, a2, a3, a4);
}

uint64_t dyld_get_program_minos_version_token()
{
  return (*(uint64_t (**)(void))(*(void *)dyld4::gDyld + 1032))();
}

uint64_t dyld_version_token_get_platform(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1040))(dyld4::gDyld, a1);
}

uint64_t dyld_version_token_at_least(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)dyld4::gDyld + 1048))(dyld4::gDyld, a1, a2);
}

uint64_t dyld4::Atlas::Bitmap::Bitmap(uint64_t a1, lsl::Lock **a2, uint64_t a3)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  uint64_t PVLEUInt64 = lsl::readPVLEUInt64((unsigned __int8 **)a3);
  *(void *)a1 = PVLEUInt64;
  unint64_t v7 = PVLEUInt64 + 7;
  unint64_t v8 = (unint64_t)(PVLEUInt64 + 7) >> 3;
  int v10 = lsl::Allocator::malloc(a2, v8);
  uint64_t v11 = *(lsl::Allocator **)(a1 + 8);
  *(void *)(a1 + 8) = v10;
  if (v11) {
    lsl::Allocator::freeObject(v11, v9);
  }
  if (v7 >= 8) {
    memmove(*(void **)(a1 + 8), *(const void **)a3, v8);
  }
  unint64_t v12 = *(void *)(a3 + 8) - v8;
  *(void *)a3 += v8;
  *(void *)(a3 + 8) = v12;
  return a1;
}

void dyld4::Atlas::Mapper::mapperForSharedCache(dyld4::Atlas::Mapper *this, lsl::Allocator *a2, dyld4::FileRecord *a3, const void *a4)
{
  uint64_t v4 = MEMORY[0x1F41887A8](this, a2, a3, a4);
  uint64_t v6 = v5;
  unint64_t v8 = v7;
  uint64_t v9 = (lsl::Lock **)v4;
  uint64_t v11 = v10;
  uint64_t v155 = *MEMORY[0x1E4F14BF8];
  *(void *)&v127[1] = 0;
  Path = (const char *)dyld4::FileRecord::getPath(v7);
  v127[0] = open(Path, 0);
  if (v127[0] == -1)
  {
    *uint64_t v11 = 0;
    return;
  }
  v116 = v11;
  v117 = v8;
  uint64_t v123 = 0;
  v124 = v9;
  uint64_t v125 = 0;
  char v126 = 0;
  lsl::OrderedSet<int,std::less<int>>::insert(&v123, v127, (uint64_t)v148);
  if (!v14)
  {
    *(void *)__dst = &v123;
    memset(&__dst[8], 0, 32);
    long long v139 = 0u;
    memset(v140, 0, 25);
    char v22 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t **)__dst);
    uint64_t v23 = *v22;
    long long v24 = *(_OWORD *)(v22 + 7);
    long long v25 = *(_OWORD *)(v22 + 5);
    long long v26 = *(_OWORD *)(v22 + 3);
    long long v142 = *(_OWORD *)(v22 + 1);
    long long v143 = v26;
    long long v144 = v25;
    long long v145 = v24;
    uint64_t v27 = v22[9];
    unsigned __int8 v28 = *((unsigned char *)v22 + 80);
    v141 = v23;
    v146 = v27;
    unsigned __int8 v147 = v28;
    long long v139 = 0u;
    memset(v140, 0, 25);
    memset(&__dst[8], 0, 32);
    *(void *)__dst = &v123;
    while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>((uint64_t)&v141, (uint64_t)__dst))
    {
      close(*(_DWORD *)(*((void *)&v142 + v147 - 1) + 4 * *((unsigned __int8 *)&v146 + v147 - 1)));
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(&v141);
    }
    goto LABEL_76;
  }
  uint64_t v15 = v14;
  long long v149 = *(_OWORD *)(v14 + 88);
  uint64_t shared_cache_range = _dyld_get_shared_cache_range((uint64_t)&v127[1]);
  uint64_t v118 = shared_cache_range;
  if (shared_cache_range)
  {
    uint64_t v17 = 0;
    *(_OWORD *)__dst = *(_OWORD *)(shared_cache_range + 88);
    do
    {
      int v18 = __dst[v17];
      int v19 = *((unsigned __int8 *)&v149 + v17);
      BOOL v20 = v18 == v19;
    }
    while (v18 == v19 && v17++ != 15);
  }
  else
  {
    BOOL v20 = 0;
  }
  uint64_t v29 = *((void *)v15 + 28);
  if (!v6) {
    uint64_t v6 = *((void *)v15 + 28);
  }
  unsigned int v30 = *((_DWORD *)v15 + 4);
  if (v30 > 0x18B)
  {
    if (!*((_DWORD *)v15 + 113))
    {
      *(void *)__dst = &v123;
      memset(&__dst[8], 0, 32);
      long long v139 = 0u;
      memset(v140, 0, 25);
      v99 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t **)__dst);
      v100 = *v99;
      long long v101 = *(_OWORD *)(v99 + 7);
      long long v102 = *(_OWORD *)(v99 + 5);
      long long v103 = *(_OWORD *)(v99 + 3);
      long long v142 = *(_OWORD *)(v99 + 1);
      long long v143 = v103;
      long long v144 = v102;
      long long v145 = v101;
      v104 = v99[9];
      unsigned __int8 v105 = *((unsigned char *)v99 + 80);
      v141 = v100;
      v146 = v104;
      unsigned __int8 v147 = v105;
      long long v139 = 0u;
      memset(v140, 0, 25);
      memset(&__dst[8], 0, 32);
      *(void *)__dst = &v123;
      while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>((uint64_t)&v141, (uint64_t)__dst))
      {
        close(*(_DWORD *)(*((void *)&v142 + v147 - 1) + 4 * *((unsigned __int8 *)&v146 + v147 - 1)));
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(&v141);
      }
      goto LABEL_76;
    }
    size_t v31 = *((unsigned int *)v15 + 98) + 56 * *((unsigned int *)v15 + 99);
  }
  else
  {
    size_t v31 = *((unsigned int *)v15 + 6) + 32 * *((unsigned int *)v15 + 7);
  }
  size_t v113 = v31;
  uint64_t v32 = (lsl::Allocator *)mmap(0, v31, 1, 2, v127[0], 0);
  v115 = v32;
  if (v32 == (lsl::Allocator *)-1)
  {
    *(void *)__dst = &v123;
    memset(&__dst[8], 0, 32);
    long long v139 = 0u;
    memset(v140, 0, 25);
    v92 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t **)__dst);
    v93 = *v92;
    long long v94 = *(_OWORD *)(v92 + 7);
    long long v95 = *(_OWORD *)(v92 + 5);
    long long v96 = *(_OWORD *)(v92 + 3);
    long long v142 = *(_OWORD *)(v92 + 1);
    long long v143 = v96;
    long long v144 = v95;
    long long v145 = v94;
    v97 = v92[9];
    unsigned __int8 v98 = *((unsigned char *)v92 + 80);
    v141 = v93;
    v146 = v97;
    unsigned __int8 v147 = v98;
    long long v139 = 0u;
    memset(v140, 0, 25);
    memset(&__dst[8], 0, 32);
    *(void *)__dst = &v123;
    while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>((uint64_t)&v141, (uint64_t)__dst))
    {
      close(*(_DWORD *)(*((void *)&v142 + v147 - 1) + 4 * *((unsigned __int8 *)&v146 + v147 - 1)));
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(&v141);
    }
LABEL_76:
    void *v116 = 0;
    goto LABEL_77;
  }
  uint64_t v33 = v6 - v29;
  uint64_t v34 = *((unsigned int *)v15 + 78);
  uint64_t v119 = lsl::Allocator::defaultAllocator(v32);
  v120 = 0;
  uint64_t v121 = 0;
  uint64_t v122 = 0;
  if (*((_DWORD *)v15 + 79))
  {
    uint64_t v35 = 0;
    unint64_t v36 = 0;
    int v37 = (char *)v115 + v34;
    do
    {
      if (!v20 || (v37[48] & 2) != 0)
      {
        int v42 = v127[0];
        uint64_t v39 = *((void *)v37 + 1);
        uint64_t v43 = *((void *)v37 + 2);
        uint64_t v38 = *(void *)v37;
        lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v119, v35 + 1);
        int v41 = &v120[2 * v121];
        *(void *)int v41 = v43;
      }
      else
      {
        uint64_t v38 = *(void *)v37;
        uint64_t v39 = *((void *)v37 + 1);
        uint64_t v40 = *(void *)v37 + v118 - *((void *)v15 + 28);
        lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v119, v35 + 1);
        int v41 = &v120[2 * v121];
        *(void *)int v41 = v40;
        int v42 = -1;
      }
      *((void *)v41 + 1) = v39;
      *((void *)v41 + 2) = v38 + v33;
      *((_DWORD *)v41 + 6) = v42;
      uint64_t v35 = ++v121;
      ++v36;
      v37 += 56;
    }
    while (v36 < *((unsigned int *)v15 + 79));
  }
  BOOL v44 = v30 >= 0x18C;
  uint64_t v45 = v117;
  if (!v44 || !*((_DWORD *)v15 + 99))
  {
LABEL_63:
    if (v121)
    {
      v78 = v120;
      uint64_t v79 = 32 * v121;
      do
      {
        long long v80 = *v78;
        long long v81 = v78[1];
        v78 += 2;
        *(_OWORD *)&__dst[16] = v81;
        *(_OWORD *)__dst = v80;
        lsl::BTree<int,std::less<int>,false>::erase(&v123, &__dst[24]);
        v79 -= 32;
      }
      while (v79);
    }
    *(void *)__dst = &v123;
    memset(&__dst[8], 0, 32);
    long long v139 = 0u;
    memset(v140, 0, 25);
    v82 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t **)__dst);
    uint64_t v83 = *v82;
    long long v84 = *(_OWORD *)(v82 + 7);
    long long v85 = *(_OWORD *)(v82 + 5);
    long long v86 = *(_OWORD *)(v82 + 3);
    long long v142 = *(_OWORD *)(v82 + 1);
    long long v143 = v86;
    long long v144 = v85;
    long long v145 = v84;
    uint64_t v87 = v82[9];
    unsigned __int8 v88 = *((unsigned char *)v82 + 80);
    v141 = v83;
    v146 = v87;
    unsigned __int8 v147 = v88;
    long long v139 = 0u;
    memset(v140, 0, 25);
    memset(&__dst[8], 0, 32);
    *(void *)__dst = &v123;
    while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>((uint64_t)&v141, (uint64_t)__dst))
    {
      close(*(_DWORD *)(*((void *)&v142 + v147 - 1) + 4 * *((unsigned __int8 *)&v146 + v147 - 1)));
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(&v141);
    }
    v89 = (lsl::Allocator *)munmap(v115, v113);
    v90 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v89);
    uint64_t v91 = lsl::Allocator::defaultAllocator(v90);
    lsl::Allocator::makeShared<dyld4::Atlas::Mapper,lsl::Allocator&,lsl::Vector<dyld4::Atlas::Mapper::Mapping> &>((lsl::Lock **)v90, v91, (uint64_t)&v119, v116);
    goto LABEL_69;
  }
  uint64_t v46 = 0;
  while (1)
  {
    if (*((_DWORD *)v15 + 4) > 0x1C8u)
    {
      int v47 = (dyld4::Utils *)dyld4::FileRecord::getPath(v45);
      int v49 = dyld4::Utils::strrstr(v47, ".development", v48);
      if (v49)
      {
        int64_t v50 = v49 - (char *)v47;
        strncpy(__dst, (const char *)v47, v49 - (char *)v47);
        __dst[v50] = 0;
      }
      else
      {
        strcpy(__dst, (const char *)v47);
      }
      snprintf((char *)&v141, 0x400uLL, "%s%s");
    }
    else
    {
      dyld4::FileRecord::getPath(v45);
      snprintf((char *)&v141, 0x400uLL, "%s.%u");
    }
    v127[0] = open((const char *)&v141, 0);
    lsl::OrderedSet<int,std::less<int>>::insert(&v123, v127, (uint64_t)__dst);
    if (v127[0] == -1) {
      goto LABEL_63;
    }
    if (!v52)
    {
      v150 = &v123;
      long long v151 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      memset(v154, 0, sizeof(v154));
      uint64_t v71 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(&v150);
      char v72 = *v71;
      long long v73 = *(_OWORD *)(v71 + 7);
      long long v74 = *(_OWORD *)(v71 + 5);
      long long v75 = *(_OWORD *)(v71 + 3);
      long long v132 = *(_OWORD *)(v71 + 1);
      long long v133 = v75;
      long long v134 = v74;
      long long v135 = v73;
      int v76 = v71[9];
      unsigned __int8 v77 = *((unsigned char *)v71 + 80);
      v131 = v72;
      v136 = v76;
      unsigned __int8 v137 = v77;
      long long v153 = 0u;
      memset(v154, 0, sizeof(v154));
      long long v151 = 0u;
      long long v152 = 0u;
      v150 = &v123;
      while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>((uint64_t)&v131, (uint64_t)&v150))
      {
        close(*(_DWORD *)(*((void *)&v132 + v137 - 1) + 4 * *((unsigned __int8 *)&v136 + v137 - 1)));
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(&v131);
      }
      goto LABEL_62;
    }
    uint64_t v53 = v52;
    uint64_t v54 = 0;
    int v55 = &v52[*((unsigned int *)v52 + 78)];
    long long v56 = *(_OWORD *)(v52 + 88);
    uint64_t v57 = (char *)v115 + *((unsigned int *)v15 + 98);
    int v58 = &v57[56 * v46];
    uint64_t v59 = &v57[24 * v46];
    if (*((_DWORD *)v15 + 4) < 0x1C9u) {
      int v58 = v59;
    }
    long long v129 = *(_OWORD *)v58;
    long long v130 = v56;
    long long v128 = v129;
    do
    {
      int v60 = *((unsigned __int8 *)&v130 + v54);
      int v61 = *((unsigned __int8 *)&v128 + v54);
    }
    while (v60 == v61 && v54++ != 15);
    if (v60 != v61) {
      break;
    }
    uint64_t v114 = v46;
    if (*((_DWORD *)v52 + 79))
    {
      unint64_t v63 = 0;
      while (v20)
      {
        uint64_t v64 = v121;
        if ((v55[48] & 2) != 0) {
          goto LABEL_57;
        }
        uint64_t v66 = *(void *)v55;
        uint64_t v65 = *((void *)v55 + 1);
        uint64_t v67 = *(void *)v55 + v118 - *((void *)v15 + 28);
        lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v119, v121 + 1);
        char v68 = &v120[2 * v121];
        *(void *)char v68 = v67;
        int v69 = -1;
LABEL_58:
        *((void *)v68 + 1) = v65;
        *((void *)v68 + 2) = v66 + v33;
        *((_DWORD *)v68 + 6) = v69;
        ++v121;
        ++v63;
        v55 += 56;
        if (v63 >= *((unsigned int *)v53 + 79)) {
          goto LABEL_59;
        }
      }
      uint64_t v64 = v121;
LABEL_57:
      int v69 = v127[0];
      uint64_t v65 = *((void *)v55 + 1);
      uint64_t v70 = *((void *)v55 + 2);
      uint64_t v66 = *(void *)v55;
      lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v119, v64 + 1);
      char v68 = &v120[2 * v121];
      *(void *)char v68 = v70;
      goto LABEL_58;
    }
LABEL_59:
    uint64_t v45 = v117;
    uint64_t v46 = v114;
LABEL_62:
    if (++v46 >= (unint64_t)*((unsigned int *)v15 + 99)) {
      goto LABEL_63;
    }
  }
  v150 = &v123;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  memset(v154, 0, sizeof(v154));
  v106 = lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(&v150);
  v107 = *v106;
  long long v108 = *(_OWORD *)(v106 + 7);
  long long v109 = *(_OWORD *)(v106 + 5);
  long long v110 = *(_OWORD *)(v106 + 3);
  long long v132 = *(_OWORD *)(v106 + 1);
  long long v133 = v110;
  long long v134 = v109;
  long long v135 = v108;
  v111 = v106[9];
  unsigned __int8 v112 = *((unsigned char *)v106 + 80);
  v131 = v107;
  v136 = v111;
  unsigned __int8 v137 = v112;
  memset(v154, 0, sizeof(v154));
  long long v153 = 0u;
  long long v152 = 0u;
  long long v151 = 0u;
  v150 = &v123;
  while (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>((uint64_t)&v131, (uint64_t)&v150))
  {
    close(*(_DWORD *)(*((void *)&v132 + v137 - 1) + 4 * *((unsigned __int8 *)&v136 + v137 - 1)));
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(&v131);
  }
  void *v116 = 0;
LABEL_69:
  if (v120) {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize((uint64_t)&v119, 0);
  }
LABEL_77:
  if (v123) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::deallocate(v123, v124);
  }
}

double lsl::OrderedSet<int,std::less<int>>::insert@<D0>(uint64_t *a1@<X0>, int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v19 = *MEMORY[0x1E4F14BF8];
  int v9 = *a2;
  lsl::BTree<int,std::less<int>,false>::const_iterator::const_iterator((uint64_t)v18, a1, &v9);
  lsl::BTree<int,std::less<int>,false>::insert_internal((uint64_t)a1, (uint64_t)v18, &v9, (uint64_t)&v10);
  uint64_t v5 = v10;
  *(_OWORD *)(a3 + 8) = v11;
  *(_OWORD *)(a3 + 24) = v12;
  *(_OWORD *)(a3 + 40) = v13;
  double result = *(double *)&v14;
  *(_OWORD *)(a3 + 56) = v14;
  uint64_t v7 = v15;
  char v8 = v16;
  *(void *)a3 = v5;
  *(void *)(a3 + 72) = v7;
  *(unsigned char *)(a3 + 80) = v8;
  *(unsigned char *)(a3 + 88) = v17;
  return result;
}

void *anonymous namespace'::cacheFilePeek(_anonymous_namespace_ *this, void *a2, unsigned __int8 *a3)
{
  ssize_t v4 = pread((int)this, a2, 0x4000uLL, 0);
  double result = 0;
  if (v4 == 0x4000)
  {
    if (!strncmp((const char *)a2, "dyld_v1", 7uLL)) {
      return a2;
    }
    else {
      return 0;
    }
  }
  return result;
}

void *lsl::Allocator::makeShared<dyld4::Atlas::Mapper,lsl::Allocator&,lsl::Vector<dyld4::Atlas::Mapper::Mapping> &>@<X0>(lsl::Lock **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  uint64_t v7 = (lsl::Allocator::AllocationMetadata *)lsl::Allocator::aligned_alloc(a1, 8uLL, 0x30uLL);
  char v8 = lsl::Vector<dyld4::Atlas::Mapper::Mapping>::Vector(v7, a3, a2);
  v8[4] = 0;
  void v8[5] = a2;

  return lsl::SharedPtr<dyld4::Atlas::Mapper>::SharedPtr(a4, v7);
}

void dyld4::Atlas::Mapper::mapperForSharedCacheLocals(dyld4::Atlas::Mapper *this, lsl::Allocator *a2, dyld4::FileRecord *a3, uint64_t a4)
{
  MEMORY[0x1F41887A8](this, a2, a3, a4);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v24 = *MEMORY[0x1E4F14BF8];
  uint64_t v8 = dyld4::FileRecord::open(v4, 0);
  if (v8 == -1) {
    goto LABEL_9;
  }
  int v9 = (_anonymous_namespace_ *)v8;
  uint64_t v10 = dyld4::FileRecord::size(v5);
  if (!v9) {
    goto LABEL_9;
  }
  uint64_t v12 = v10;
  if (!v13)
  {
    dyld4::FileRecord::close(v5);
LABEL_9:
    *uint64_t v7 = 0;
    v7[1] = 0;
    return;
  }
  uint64_t v19 = lsl::Allocator::defaultAllocator(v13);
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)&v19, 1uLL);
  uint64_t v14 = v20 + 32 * v21;
  *(void *)uint64_t v14 = 0;
  *(void *)(v14 + 8) = v12;
  *(void *)(v14 + 16) = 0;
  *(_DWORD *)(v14 + 24) = v9;
  ++v21;
  char v16 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v15);
  uint64_t v17 = lsl::Allocator::defaultAllocator(v16);
  lsl::Allocator::makeShared<dyld4::Atlas::Mapper,lsl::Allocator&,lsl::Vector<dyld4::Atlas::Mapper::Mapping> &>((lsl::Lock **)v16, v17, (uint64_t)&v19, &v18);
  *uint64_t v7 = 0;
  if (&v18 != v7) {
    *uint64_t v7 = v18;
  }
  v7[1] = 0;
  if (v20) {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize((uint64_t)&v19, 0);
  }
}

void dyld4::Atlas::Mapper::mapperForMachO(lsl::Allocator *a1@<X1>, dyld4::FileRecord *a2@<X2>, const UUID *a3@<X3>, void *a4@<X8>)
{
  uint64_t v48 = *MEMORY[0x1E4F14BF8];
  Path = (dyld3 *)dyld4::FileRecord::getPath(a1);
  int v10 = dyld3::open(Path, 0, 0);
  if (v10 == -1) {
    goto LABEL_11;
  }
  int v11 = v10;
  if (fstat(v10, &v36) == -1 || (uint64_t v12 = mmap(0, v36.st_size, 1, 8194, v11, 0), v12 == (_DWORD *)-1))
  {
    int v10 = v11;
LABEL_11:
    close(v10);
    *a4 = 0;
    return;
  }
  uint64_t v14 = v12;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2000000000;
  uint64_t v35 = 0;
  Uuid = (dyld3::MachOFile *)dyld3::FatFile::isFatFile(v12, v13);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2000000000;
  void v31[3] = 0;
  if (Uuid)
  {
    uint64_t v17 = Uuid;
    off_t st_size = v36.st_size;
    Diagnostics::Diagnostics((Diagnostics *)&v40);
    v30[0] = MEMORY[0x1E4F14BE8];
    v30[1] = 0x40000000;
    v30[2] = ___ZN5dyld45Atlas6Mapper14mapperForMachOERN3lsl9AllocatorERNS_10FileRecordERKNS2_4UUIDEPKv_block_invoke;
    v30[3] = &unk_1E5E6CC58;
    v30[4] = &v32;
    v30[5] = v31;
    v30[6] = a2;
    v30[7] = v17;
    dyld3::FatFile::forEachSlice(v17, (Diagnostics *)&v40, st_size, (uint64_t)v30);
    Diagnostics::clearError((Diagnostics *)&v40);
    mach_o::Error::~Error((mach_o::Error *)&v40);
  }
  if (!v33[3])
  {
    Uuid = (dyld3::MachOFile *)dyld3::MachOFile::isMachO(v14, v16);
    if (Uuid)
    {
      uint64_t v23 = Uuid;
      long long v40 = 0uLL;
      Uuid = (dyld3::MachOFile *)dyld3::MachOFile::getUuid(Uuid, (unsigned __int8 *)&v40);
      uint64_t v24 = 0;
      long long v37 = v40;
      do
      {
        int v25 = *((unsigned __int8 *)a2 + v24);
        int v26 = *((unsigned __int8 *)&v37 + v24);
      }
      while (v25 == v26 && v24++ != 15);
      if (v25 == v26) {
        v33[3] = (uint64_t)v23;
      }
    }
  }
  if (v33[3])
  {
    *(void *)&long long v40 = 0;
    *((void *)&v40 + 1) = &v40;
    uint64_t v41 = 0x4802000000;
    int v42 = __Block_byref_object_copy__4;
    uint64_t v43 = __Block_byref_object_dispose__4;
    uint64_t v44 = lsl::Allocator::defaultAllocator(Uuid);
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    *(void *)&long long v37 = 0;
    *((void *)&v37 + 1) = &v37;
    uint64_t v38 = 0x2000000000;
    uint64_t v39 = 0;
    uint64_t v19 = (_DWORD *)v33[3];
    v28[0] = MEMORY[0x1E4F14BE8];
    v28[1] = 0x40000000;
    v28[2] = ___ZN5dyld45Atlas6Mapper14mapperForMachOERN3lsl9AllocatorERNS_10FileRecordERKNS2_4UUIDEPKv_block_invoke_3;
    v28[3] = &unk_1E5E6CC80;
    v28[4] = &v37;
    v28[5] = &v40;
    void v28[6] = v31;
    v28[7] = a3;
    int v29 = v11;
    dyld3::MachOFile::forEachSegment(v19, (uint64_t)v28);
    uint64_t v20 = (lsl::Allocator *)munmap(v14, v36.st_size);
    uint64_t v21 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v20);
    uint64_t v22 = lsl::Allocator::defaultAllocator(v21);
    lsl::Allocator::makeShared<dyld4::Atlas::Mapper,lsl::Allocator&,lsl::Vector<dyld4::Atlas::Mapper::Mapping> &>((lsl::Lock **)v21, v22, *((void *)&v40 + 1) + 40, a4);
    _Block_object_dispose(&v37, 8);
    _Block_object_dispose(&v40, 8);
    if (v45) {
      lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize((uint64_t)&v44, 0);
    }
  }
  else
  {
    munmap(v14, v36.st_size);
    close(v11);
    *a4 = 0;
  }
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v32, 8);
}

BOOL ___ZN5dyld45Atlas6Mapper14mapperForMachOERN3lsl9AllocatorERNS_10FileRecordERKNS2_4UUIDEPKv_block_invoke(void *a1, int a2, int a3, dyld3::MachOFile *this, uint64_t a5, unsigned char *a6)
{
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  memset(v15, 0, sizeof(v15));
  BOOL result = dyld3::MachOFile::getUuid(this, v15);
  uint64_t v10 = 0;
  long long v14 = *(_OWORD *)v15;
  do
  {
    int v11 = *(unsigned __int8 *)(a1[6] + v10);
    int v12 = v15[v10 - 8];
  }
  while (v11 == v12 && v10++ != 15);
  if (v11 == v12)
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = this;
    *(void *)(*(void *)(a1[5] + 8) + 24) = (char *)this - a1[7];
    *a6 = 1;
  }
  return result;
}

uint64_t *__Block_byref_object_copy__4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 40) = 0u;
  uint64_t v2 = a1 + 40;
  *(_OWORD *)(v2 + 16) = 0u;
  return lsl::Vector<dyld4::Atlas::Mapper::Mapping>::swap((uint64_t *)v2, (uint64_t *)(a2 + 40));
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  if (*(void *)(a1 + 48)) {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize(a1 + 40, 0);
  }
}

void ___ZN5dyld45Atlas6Mapper14mapperForMachOERN3lsl9AllocatorERNS_10FileRecordERKNS2_4UUIDEPKv_block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!strncmp(*(const char **)(a2 + 40), "__TEXT", 0x10uLL)) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a1 + 56) - *(void *)(a2 + 16);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + *(void *)a2;
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + *(void *)(a2 + 16);
  int v8 = *(_DWORD *)(a1 + 64);
  lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve(v4 + 40, *(void *)(v4 + 56) + 1);
  uint64_t v9 = *(void *)(v4 + 48) + 32 * *(void *)(v4 + 56);
  *(void *)uint64_t v9 = v5;
  *(void *)(v9 + 8) = v6;
  *(void *)(v9 + 16) = v7;
  *(_DWORD *)(v9 + 24) = v8;
  ++*(void *)(v4 + 56);
}

void dyld4::Atlas::Mapper::~Mapper(dyld4::Atlas::Mapper *this)
{
  if (*((void *)this + 4)) {
    dyld4::Atlas::Mapper::~Mapper();
  }
  uint64_t v15 = *((void *)this + 5);
  uint64_t v16 = 0;
  size_t v17 = 0;
  uint64_t v18 = 0;
  uint64_t v2 = *((void *)this + 1);
  uint64_t v3 = *((void *)this + 2);
  if (v3)
  {
    size_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 32 * v3;
    uint64_t v7 = (__int32 *)(v2 + 24);
    do
    {
      if (*v7 != -1)
      {
        int v8 = &v5[v4];
        uint64_t v9 = wmemchr(v5, *v7, v4);
        uint64_t v10 = v9 ? v9 : v8;
        uint64_t v5 = v16;
        size_t v4 = v17;
        if (v10 == &v16[v17])
        {
          lsl::Vector<unsigned int>::reserve((uint64_t)&v15, v17 + 1);
          __int32 v11 = *v7;
          uint64_t v5 = v16;
          size_t v12 = v17;
          size_t v4 = ++v17;
          v16[v12] = v11;
        }
      }
      v7 += 8;
      v6 -= 32;
    }
    while (v6);
    if (v4)
    {
      uint64_t v13 = 4 * v4;
      do
      {
        int v14 = *v5++;
        close(v14);
        v13 -= 4;
      }
      while (v13);
      uint64_t v5 = v16;
    }
    if (v5) {
      lsl::Vector<unsigned int>::resize((uint64_t)&v15, 0);
    }
    uint64_t v2 = *((void *)this + 1);
  }
  if (v2) {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize((uint64_t)this, 0);
  }
}

char *dyld4::Atlas::Mapper::map(dyld4::Atlas::Mapper *this, char *a2, uint64_t a3)
{
  uint64_t v3 = *((void *)this + 4);
  if (v3) {
    return &a2[v3 - *(void *)(*((void *)this + 1) + 16)];
  }
  uint64_t v5 = *((void *)this + 2);
  if (v5)
  {
    uint64_t v6 = *((void *)this + 1);
    uint64_t v7 = 32 * v5;
    while (1)
    {
      unint64_t v8 = *(void *)(v6 + 16);
      if (v8 <= (unint64_t)a2)
      {
        unint64_t v9 = *(void *)(v6 + 8) + v8;
        if (v9 > (unint64_t)a2) {
          break;
        }
      }
      v6 += 32;
      v7 -= 32;
      if (!v7) {
        return 0;
      }
    }
    int v10 = *(_DWORD *)(v6 + 24);
    if (v10 == -1)
    {
      return &a2[*(void *)v6 - v8];
    }
    else
    {
      if ((unint64_t)&a2[a3] > v9) {
        dyld4::Atlas::Mapper::map();
      }
      unint64_t v11 = (unint64_t)&a2[*(void *)v6 - v8];
      uint64_t v12 = -*MEMORY[0x1E4F14C80];
      uint64_t v13 = (char *)(v11 - (v11 & v12));
      int v14 = (char *)mmap(0, (size_t)&v13[a3], 1, 2, v10, v11 & v12);
      if (v14 == (char *)-1) {
        return 0;
      }
      else {
        return &v14[(void)v13];
      }
    }
  }
  return a2;
}

uint64_t dyld4::Atlas::Mapper::pin(dyld4::Atlas::Mapper *this)
{
  if (*((void *)this + 4)) {
    dyld4::Atlas::Mapper::pin();
  }
  uint64_t v2 = (vm_map_t *)MEMORY[0x1E4F14C48];
  if (vm_allocate(*MEMORY[0x1E4F14C48], (vm_address_t *)this + 4, *(void *)(*((void *)this + 1) + 32 * *((void *)this + 2) - 16)- *(void *)(*((void *)this + 1) + 16)+ *(void *)(*((void *)this + 1) + 32 * *((void *)this + 2) - 24), 1))
  {
    return 0;
  }
  uint64_t v4 = *((void *)this + 2);
  if (v4)
  {
    uint64_t v5 = *((void *)this + 1) + 16;
    for (uint64_t i = 32 * v4; i; i -= 32)
    {
      uint64_t v7 = *(void *)v5 - *(void *)(*((void *)this + 1) + 16);
      int v8 = *(_DWORD *)(v5 + 8);
      if (v8 == -1)
      {
        if (vm_copy(*v2, *(void *)v5, *(void *)(v5 - 8), v7 + *((void *)this + 4)))
        {
LABEL_12:
          dyld4::Atlas::Mapper::unpin(this);
          return 0;
        }
      }
      else if (mmap((void *)(v7 + *((void *)this + 4)), *(void *)(v5 - 8), 1, 18, v8, *(void *)(v5 - 16)) == (void *)-1)
      {
        goto LABEL_12;
      }
      v5 += 32;
    }
  }
  return 1;
}

uint64_t dyld4::Atlas::Mapper::unpin(dyld4::Atlas::Mapper *this)
{
  uint64_t v1 = *((void *)this + 4);
  if (!v1) {
    dyld4::Atlas::Mapper::unpin();
  }
  uint64_t result = MEMORY[0x1AD11BB30](*MEMORY[0x1E4F14C48], v1, *(void *)(*((void *)this + 1) + 32 * *((void *)this + 2) - 16)- *(void *)(*((void *)this + 1) + 16)+ *(void *)(*((void *)this + 1) + 32 * *((void *)this + 2) - 24));
  *((void *)this + 4) = 0;
  return result;
}

void dyld4::Atlas::Image::swap(dyld4::Atlas::Image *this, dyld4::Atlas::Image *a2)
{
  if (this != a2)
  {
    long long v4 = *((_OWORD *)this + 6);
    *((_OWORD *)this + 6) = *((_OWORD *)a2 + 6);
    *((_OWORD *)a2 + 6) = v4;
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::swap((uint64_t *)this + 14, (uint64_t *)a2 + 14);
    std::optional<unsigned long long>::swap[abi:nn180100]((uint64_t *)this + 18, (uint64_t *)a2 + 18);
    uint64_t v5 = *((void *)this + 20);
    *((void *)this + 20) = *((void *)a2 + 20);
    *((void *)a2 + 20) = v5;
    uint64_t v6 = *((void *)this + 11);
    *((void *)this + 11) = *((void *)a2 + 11);
    *((void *)a2 + 11) = v6;
    uint64_t v7 = *((void *)this + 21);
    *((void *)this + 21) = *((void *)a2 + 21);
    *((void *)a2 + 21) = v7;
    uint64_t v8 = *((void *)this + 22);
    *((void *)this + 22) = *((void *)a2 + 22);
    *((void *)a2 + 22) = v8;
    dyld4::FileRecord::swap((dyld4::Atlas::Image *)((char *)this + 8), (dyld4::Atlas::Image *)((char *)a2 + 8));
    char v9 = *((unsigned char *)this + 184);
    *((unsigned char *)this + 184) = *((unsigned char *)a2 + 184);
    *((unsigned char *)a2 + 184) = v9;
    char v10 = *((unsigned char *)this + 185);
    *((unsigned char *)this + 185) = *((unsigned char *)a2 + 185);
    *((unsigned char *)a2 + 185) = v10;
    char v11 = *((unsigned char *)this + 186);
    *((unsigned char *)this + 186) = *((unsigned char *)a2 + 186);
    *((unsigned char *)a2 + 186) = v11;
  }
}

_DWORD *dyld4::Atlas::Image::ml(dyld4::Atlas::Image *this)
{
  if (*((unsigned char *)this + 186)) {
    return 0;
  }
  uint64_t result = (_DWORD *)*((void *)this + 16);
  if (result) {
    return result;
  }
  long long v4 = (long long *)((char *)this + 88);
  uint64_t v3 = (lsl::Allocator *)*((void *)this + 11);
  uint64_t v5 = (char *)*((void *)this + 20);
  if (!v3 || !*((void *)v3 + 1))
  {
    lsl::Allocator::defaultAllocator(0);
    dyld4::Atlas::Mapper::mapperForMachO((dyld4::Atlas::Image *)((char *)this + 8), (dyld4::Atlas::Image *)((char *)this + 96), *((const UUID **)this + 20), &v19);
    if (&v19 == v4)
    {
      uint64_t v7 = (lsl::Allocator *)v19;
      if (!(void)v19)
      {
LABEL_9:
        uint64_t v3 = *(lsl::Allocator **)v4;
        if (!*(void *)v4)
        {
LABEL_25:
          uint64_t result = 0;
          *((unsigned char *)this + 186) = 1;
          return result;
        }
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v7 = *(lsl::Allocator **)v4;
      *(void *)long long v4 = v19;
      *(void *)&long long v19 = v7;
      if (!v7) {
        goto LABEL_9;
      }
    }
    lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v7, v6);
    goto LABEL_9;
  }
LABEL_10:
  uint64_t v8 = (dyld4::Atlas::Mapper *)*((void *)v3 + 1);
  if (!v8) {
    goto LABEL_25;
  }
  *(void *)&long long v19 = *((void *)v3 + 1);
  *((void *)&v19 + 1) = 4096;
  char v9 = dyld4::Atlas::Mapper::map(v8, v5, 4096);
  uint64_t v20 = v9;
  char v21 = v10;
  if ((long long *)((char *)this + 112) != &v19)
  {
    long long v19 = *((_OWORD *)this + 7);
    *((void *)this + 14) = v8;
    *((void *)this + 15) = 4096;
    char v11 = (char *)*((void *)this + 16);
    *((void *)this + 16) = v9;
    uint64_t v20 = v11;
    LOBYTE(v11) = *((unsigned char *)this + 136);
    *((unsigned char *)this + 136) = v10;
    char v21 = (char)v11;
  }
  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v19);
  uint64_t result = (_DWORD *)*((void *)this + 16);
  if (!result) {
    goto LABEL_25;
  }
  uint64_t v12 = result[5];
  uint64_t v13 = 28;
  if (*result == -17958193) {
    uint64_t v13 = 32;
  }
  uint64_t v14 = v13 + v12;
  if ((unint64_t)(v13 + v12) > 0x1000)
  {
    uint64_t v15 = *(void *)v4 ? *(dyld4::Atlas::Mapper **)(*(void *)v4 + 8) : 0;
    *(void *)&long long v19 = v15;
    *((void *)&v19 + 1) = v13 + v12;
    uint64_t v16 = dyld4::Atlas::Mapper::map(v15, v5, v14);
    uint64_t v20 = v16;
    char v21 = v17;
    if ((long long *)((char *)this + 112) != &v19)
    {
      long long v19 = *((_OWORD *)this + 7);
      *((void *)this + 14) = v15;
      *((void *)this + 15) = v14;
      uint64_t v18 = (char *)*((void *)this + 16);
      *((void *)this + 16) = v16;
      uint64_t v20 = v18;
      LOBYTE(v18) = *((unsigned char *)this + 136);
      *((unsigned char *)this + 136) = v17;
      char v21 = (char)v18;
    }
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v19);
    uint64_t result = (_DWORD *)*((void *)this + 16);
    if (!result) {
      goto LABEL_25;
    }
  }
  return result;
}

uint64_t dyld4::Atlas::Image::uuid(dyld4::Atlas::Image *this)
{
  uint64_t v6 = *MEMORY[0x1E4F14BF8];
  if (!*((unsigned char *)this + 184))
  {
    memset(v5, 0, sizeof(v5));
    uint64_t v2 = (mach_o::Header *)dyld4::Atlas::Image::ml(this);
    if (v2)
    {
      uint64_t v3 = v2;
      if (mach_o::Header::hasMachOMagic(v2) && dyld3::MachOFile::getUuid(v3, v5)) {
        *((_OWORD *)this + 6) = *(_OWORD *)v5;
      }
    }
    *((unsigned char *)this + 184) = 1;
  }
  return (uint64_t)this + 96;
}

uint64_t dyld4::Atlas::Image::installname(dyld4::Atlas::Image *this)
{
  if (!*((unsigned char *)this + 185))
  {
    if (dyld4::Atlas::Image::ml(this))
    {
      uint64_t v2 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(this);
      *((void *)this + 22) = dyld3::MachOFile::installName(v2);
    }
    *((unsigned char *)this + 185) = 1;
  }
  return *((void *)this + 22);
}

uint64_t dyld4::Atlas::Image::filename(dyld4::Atlas::Image *this)
{
  if (*((void *)this + 21)) {
    return 0;
  }
  else {
    return dyld4::FileRecord::getPath((dyld4::Atlas::Image *)((char *)this + 8));
  }
}

uint64_t dyld4::Atlas::Image::sharedCache(dyld4::Atlas::Image *this)
{
  return *((void *)this + 21);
}

uint64_t dyld4::Atlas::Image::sharedCacheVMOffset(dyld4::Atlas::Image *this)
{
  return *((void *)this + 20) - *(void *)(*((void *)this + 21) + 160);
}

uint64_t dyld4::Atlas::SharedCache::rebasedAddress(dyld4::Atlas::SharedCache *this)
{
  return *((void *)this + 20);
}

_DWORD *dyld4::Atlas::Image::pointerSize(dyld4::Atlas::Image *this)
{
  uint64_t result = dyld4::Atlas::Image::ml(this);
  if (result)
  {
    uint64_t v3 = (mach_o::Header *)dyld4::Atlas::Image::ml(this);
    return (_DWORD *)mach_o::Header::pointerSize(v3);
  }
  return result;
}

BOOL dyld4::Atlas::Image::forEachSegment(dyld4::Atlas::Image *a1, uint64_t a2)
{
  long long v4 = dyld4::Atlas::Image::ml(a1);
  if (v4)
  {
    v10[0] = 0;
    v10[1] = v10;
    vm_address_t v10[2] = 0x2000000000;
    uint64_t v11 = 0;
    uint64_t v5 = *((void *)a1 + 20);
    uint64_t v6 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(a1);
    uint64_t v11 = v5 - dyld3::MachOFile::preferredLoadAddress(v6);
    uint64_t v7 = dyld4::Atlas::Image::ml(a1);
    v9[0] = MEMORY[0x1E4F14BE8];
    v9[1] = 0x40000000;
    v9[2] = ___ZN5dyld45Atlas5Image14forEachSegmentEU13block_pointerFvPKcyyiE_block_invoke;
    void v9[3] = &unk_1E5E6CCA8;
    void v9[5] = v10;
    void v9[6] = a1;
    v9[4] = a2;
    dyld3::MachOFile::forEachSegment(v7, (uint64_t)v9);
    _Block_object_dispose(v10, 8);
  }
  return v4 != 0;
}

uint64_t ___ZN5dyld45Atlas5Image14forEachSegmentEU13block_pointerFvPKcyyiE_block_invoke(uint64_t a1, uint64_t a2)
{
  long long v4 = *(dyld4::Atlas::Image **)(a1 + 48);
  if (*((unsigned char *)v4 + 152)
    || (uint64_t v5 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(v4), !dyld3::MachOFile::isMainExecutable(v5))
    || (uint64_t result = strncmp(*(const char **)(a2 + 40), "__PAGEZERO", 0xAuLL), result))
  {
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
    return v7();
  }
  return result;
}

BOOL dyld4::Atlas::Image::forEachSection(dyld4::Atlas::Image *a1, uint64_t a2)
{
  long long v4 = dyld4::Atlas::Image::ml(a1);
  if (v4)
  {
    v10[0] = 0;
    v10[1] = v10;
    vm_address_t v10[2] = 0x2000000000;
    uint64_t v11 = 0;
    uint64_t v5 = *((void *)a1 + 20);
    uint64_t v6 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(a1);
    uint64_t v11 = v5 - dyld3::MachOFile::preferredLoadAddress(v6);
    uint64_t v7 = dyld4::Atlas::Image::ml(a1);
    v9[0] = MEMORY[0x1E4F14BE8];
    v9[1] = 0x40000000;
    v9[2] = ___ZN5dyld45Atlas5Image14forEachSectionEU13block_pointerFvPKcS3_yyE_block_invoke;
    void v9[3] = &unk_1E5E6CCD0;
    void v9[5] = v10;
    void v9[6] = a1;
    v9[4] = a2;
    dyld3::MachOFile::forEachSection(v7, (uint64_t)v9);
    _Block_object_dispose(v10, 8);
  }
  return v4 != 0;
}

uint64_t ___ZN5dyld45Atlas5Image14forEachSectionEU13block_pointerFvPKcS3_yyE_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL dyld4::Atlas::Image::contentForSegment(dyld4::Atlas::Image *a1, uint64_t a2, uint64_t a3)
{
  if (!dyld4::Atlas::Image::ml(a1)) {
    return 0;
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000;
  char v17 = 0;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2000000000;
  uint64_t v13 = 0;
  uint64_t v6 = *((void *)a1 + 20);
  uint64_t v7 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(a1);
  uint64_t v13 = v6 - dyld3::MachOFile::preferredLoadAddress(v7);
  uint64_t v8 = dyld4::Atlas::Image::ml(a1);
  v11[0] = MEMORY[0x1E4F14BE8];
  v11[1] = 0x40000000;
  v11[2] = ___ZN5dyld45Atlas5Image17contentForSegmentEPKcU13block_pointerFvPKvyyE_block_invoke;
  void v11[3] = &unk_1E5E6CCF8;
  void v11[7] = a1;
  unsigned char v11[8] = a2;
  void v11[4] = a3;
  void v11[5] = v12;
  v11[6] = &v14;
  dyld3::MachOFile::forEachSegment(v8, (uint64_t)v11);
  BOOL v9 = *((unsigned char *)v15 + 24) != 0;
  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v14, 8);
  return v9;
}

uint64_t ___ZN5dyld45Atlas5Image17contentForSegmentEPKcU13block_pointerFvPKvyyE_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t result = strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 40));
  if (!result)
  {
    if (*(unsigned char *)(v6 + 152))
    {
      uint64_t v8 = (void *)(v6 + 144);
    }
    else
    {
      BOOL v9 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml((dyld4::Atlas::Image *)v6);
      if (dyld3::MachOFile::isMainExecutable(v9))
      {
        uint64_t result = strncmp(*(const char **)(a2 + 40), "__PAGEZERO", 0xAuLL);
        if (!result) {
          return result;
        }
      }
      uint64_t v8 = (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    uint64_t v10 = *(void *)(a2 + 24);
    uint64_t v11 = (char *)(*v8 + *(void *)(a2 + 16));
    if (v10)
    {
      uint64_t v12 = *(void *)(v6 + 88);
      if (v12) {
        uint64_t v13 = *(dyld4::Atlas::Mapper **)(v12 + 8);
      }
      else {
        uint64_t v13 = 0;
      }
      v15[0] = v13;
      v15[1] = v10;
      uint64_t v16 = dyld4::Atlas::Mapper::map(v13, v11, v10);
      char v17 = v14;
      (*(void (**)(void, char *, char *, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v16, v11, *(void *)(a2 + 24));
      uint64_t result = dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v15);
    }
    else
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t dyld4::Atlas::Image::contentForSection(dyld4::Atlas::Image *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x2000000000;
  char v19 = 0;
  v14[0] = 0;
  v14[1] = v14;
  void v14[2] = 0x2000000000;
  uint64_t v15 = 0;
  uint64_t v8 = *((void *)a1 + 20);
  BOOL v9 = (dyld3::MachOFile *)dyld4::Atlas::Image::ml(a1);
  uint64_t v15 = v8 - dyld3::MachOFile::preferredLoadAddress(v9);
  uint64_t v10 = dyld4::Atlas::Image::ml(a1);
  v13[0] = MEMORY[0x1E4F14BE8];
  v13[1] = 0x40000000;
  v13[2] = ___ZN5dyld45Atlas5Image17contentForSectionEPKcS3_U13block_pointerFvPKvyyE_block_invoke;
  v13[3] = &unk_1E5E6CD20;
  void v13[8] = a2;
  v13[9] = a3;
  v13[4] = a4;
  v13[5] = v14;
  v13[6] = &v16;
  v13[7] = a1;
  dyld3::MachOFile::forEachSection(v10, (uint64_t)v13);
  uint64_t v11 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
  return v11;
}

uint64_t ___ZN5dyld45Atlas5Image17contentForSectionEPKcS3_U13block_pointerFvPKvyyE_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t result = strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 40));
  if (!result)
  {
    uint64_t result = strcmp(*(const char **)(a1 + 72), *(const char **)(a2 + 80));
    if (!result)
    {
      if (*(unsigned char *)(v7 + 152)) {
        BOOL v9 = (void *)(v7 + 144);
      }
      else {
        BOOL v9 = (void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      uint64_t v10 = *(void *)(a2 + 72);
      uint64_t v11 = (char *)(*v9 + *(void *)(a2 + 64));
      if (v10)
      {
        uint64_t v12 = *(void *)(v7 + 88);
        if (v12) {
          uint64_t v13 = *(dyld4::Atlas::Mapper **)(v12 + 8);
        }
        else {
          uint64_t v13 = 0;
        }
        v15[0] = v13;
        v15[1] = v10;
        uint64_t v16 = dyld4::Atlas::Mapper::map(v13, v11, v10);
        char v17 = v14;
        (*(void (**)(void, char *, char *, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v16, v11, *(void *)(a2 + 72));
        uint64_t result = dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v15);
      }
      else
      {
        uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  return result;
}

atomic_uint **dyld4::Atlas::SharedCacheLocals::SharedCacheLocals(atomic_uint **a1, atomic_uint **a2, char a3)
{
  long long v4 = *a2;
  *a1 = *a2;
  if (v4)
  {
    atomic_fetch_add_explicit(v4, 1u, memory_order_relaxed);
    uint64_t v5 = *a1;
    a1[1] = 0;
    uint64_t v6 = (long long *)(a1 + 1);
    a1[2] = 0;
    a1[3] = 0;
    *((unsigned char *)a1 + 32) = 0;
    *((unsigned char *)a1 + 40) = a3;
    if (v5) {
      uint64_t v7 = (dyld4::Atlas::Mapper *)*((void *)v5 + 1);
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
    a1[1] = 0;
    uint64_t v6 = (long long *)(a1 + 1);
    *((unsigned char *)a1 + 32) = 0;
    a1[2] = 0;
    a1[3] = 0;
    *((unsigned char *)a1 + 40) = a3;
  }
  v20[0] = v7;
  v20[1] = 520;
  uint64_t v8 = dyld4::Atlas::Mapper::map(v7, 0, 520);
  vm_address_t v20[2] = v8;
  char v21 = v9;
  if (*a1) {
    uint64_t v10 = (dyld4::Atlas::Mapper *)*((void *)*a1 + 1);
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = (char *)*((void *)v8 + 9);
  uint64_t v12 = *((void *)v8 + 10);
  *(void *)&long long v17 = v10;
  *((void *)&v17 + 1) = v12;
  uint64_t v13 = dyld4::Atlas::Mapper::map(v10, v11, v12);
  uint64_t v18 = v13;
  char v19 = v14;
  if (v6 != &v17)
  {
    long long v17 = *(_OWORD *)(a1 + 1);
    a1[1] = (atomic_uint *)v10;
    a1[2] = (atomic_uint *)v12;
    uint64_t v15 = (char *)a1[3];
    a1[3] = (atomic_uint *)v13;
    uint64_t v18 = v15;
    LOBYTE(v15) = *((unsigned char *)a1 + 32);
    *((unsigned char *)a1 + 32) = v14;
    char v19 = (char)v15;
  }
  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v17);
  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v20);
  return a1;
}

uint64_t dyld4::Atlas::SharedCacheLocals::localInfo(dyld4::Atlas::SharedCacheLocals *this)
{
  return *((void *)this + 3);
}

uint64_t dyld4::Atlas::SharedCacheLocals::use64BitDylibOffsets(dyld4::Atlas::SharedCacheLocals *this)
{
  return *((unsigned __int8 *)this + 40);
}

uint64_t dyld4::Atlas::SharedCache::SharedCache(uint64_t a1, uint64_t a2, dyld4::FileRecord *a3, atomic_uint **a4, char *a5, char a6)
{
  *(void *)a1 = a2;
  dyld4::FileRecord::FileRecord(a1 + 8, a3);
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 112) = 0;
  uint64_t v10 = (long long *)(a1 + 112);
  *(void *)(a1 + 96) = 0;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 128) = 0;
  *(unsigned char *)(a1 + 136) = 0;
  uint64_t v11 = *a4;
  *(void *)(a1 + 144) = *a4;
  if (!v11)
  {
    *(void *)(a1 + 152) = 0;
    *(void *)(a1 + 160) = a5;
    *(unsigned char *)(a1 + 168) = a6;
    goto LABEL_51;
  }
  atomic_fetch_add_explicit(v11, 1u, memory_order_relaxed);
  uint64_t v12 = *(void *)(a1 + 144);
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = a5;
  *(unsigned char *)(a1 + 168) = a6;
  if (!v12 || (uint64_t v13 = *(dyld4::Atlas::Mapper **)(v12 + 8)) == 0) {
LABEL_51:
  }
    dyld4::Atlas::SharedCache::SharedCache();
  char v14 = (uint64_t *)MEMORY[0x1E4F14C80];
  uint64_t v15 = *MEMORY[0x1E4F14C80];
  *(void *)&long long v58 = *(void *)(v12 + 8);
  *((void *)&v58 + 1) = v15;
  uint64_t v16 = dyld4::Atlas::Mapper::map(v13, a5, v15);
  uint64_t v59 = v16;
  char v60 = v17;
  if (v10 != &v58)
  {
    long long v58 = *(_OWORD *)(a1 + 112);
    *(void *)(a1 + 112) = v13;
    *(void *)(a1 + 120) = v15;
    uint64_t v18 = *(char **)(a1 + 128);
    *(void *)(a1 + 128) = v16;
    uint64_t v59 = v18;
    LOBYTE(v18) = *(unsigned char *)(a1 + 136);
    *(unsigned char *)(a1 + 136) = v17;
    char v60 = (char)v18;
  }
  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v58);
  uint64_t v19 = *(void *)(a1 + 128);
  unsigned int v20 = *(_DWORD *)(v19 + 16);
  if (v20 >= 0x18C) {
    unint64_t v21 = *(unsigned int *)(v19 + 392) + 56 * *(unsigned int *)(v19 + 396);
  }
  else {
    unint64_t v21 = *(unsigned int *)(v19 + 24) + 32 * *(unsigned int *)(v19 + 28);
  }
  if (v21 > *v14)
  {
    uint64_t v22 = *(void *)(a1 + 144);
    if (v22) {
      uint64_t v23 = *(dyld4::Atlas::Mapper **)(v22 + 8);
    }
    else {
      uint64_t v23 = 0;
    }
    uint64_t v24 = *(char **)(a1 + 160);
    *(void *)&long long v58 = v23;
    *((void *)&v58 + 1) = v21;
    int v25 = dyld4::Atlas::Mapper::map(v23, v24, v21);
    uint64_t v59 = v25;
    char v60 = v26;
    if (v10 != &v58)
    {
      long long v58 = *(_OWORD *)(a1 + 112);
      *(void *)(a1 + 112) = v23;
      *(void *)(a1 + 120) = v21;
      uint64_t v27 = *(char **)(a1 + 128);
      *(void *)(a1 + 128) = v25;
      uint64_t v59 = v27;
      LOBYTE(v27) = *(unsigned char *)(a1 + 136);
      *(unsigned char *)(a1 + 136) = v26;
      char v60 = (char)v27;
    }
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v58);
    uint64_t v19 = *(void *)(a1 + 128);
  }
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(v19 + 88);
  uint64_t v28 = *(void *)(v19 + 224);
  *(void *)(a1 + 152) = *(void *)(a1 + 160) - v28;
  if (*(_DWORD *)(v19 + 16) < 0x18Cu)
  {
    uint64_t v30 = *(unsigned int *)(v19 + 316);
    if (v30)
    {
      unint64_t v31 = 0;
      uint64_t v32 = (void *)(*(unsigned int *)(v19 + 312) + v19 + 8);
      do
      {
        if (v31 <= *v32 + *(v32 - 1)) {
          unint64_t v31 = *v32 + *(v32 - 1);
        }
        v32 += 7;
        --v30;
      }
      while (v30);
    }
    else
    {
      unint64_t v31 = 0;
    }
    if (v20 >= 0x18C && *(_DWORD *)(v19 + 396))
    {
      unint64_t v33 = 0;
      uint64_t v34 = v19;
      do
      {
        unsigned int v35 = *(_DWORD *)(v34 + 16);
        uint64_t v36 = v19 + *(unsigned int *)(v34 + 392);
        uint64_t v37 = v36 + 24 * v33 + 16;
        uint64_t v38 = (void *)(v36 + 56 * v33 + 16);
        if (v35 < 0x1C9) {
          uint64_t v38 = (void *)v37;
        }
        uint64_t v39 = *(void *)(a1 + 144);
        if (v39) {
          long long v40 = *(dyld4::Atlas::Mapper **)(v39 + 8);
        }
        else {
          long long v40 = 0;
        }
        uint64_t v41 = &a5[*v38];
        uint64_t v42 = *v14;
        *(void *)&long long v58 = v40;
        *((void *)&v58 + 1) = v42;
        uint64_t v43 = dyld4::Atlas::Mapper::map(v40, v41, v42);
        uint64_t v59 = v43;
        char v60 = v44;
        if (*((_DWORD *)v43 + 4) < 0x18Cu) {
          unint64_t v45 = *((unsigned int *)v43 + 6) + 32 * *((unsigned int *)v43 + 7);
        }
        else {
          unint64_t v45 = *((unsigned int *)v43 + 98) + 56 * *((unsigned int *)v43 + 99);
        }
        if (v45 > *v14)
        {
          uint64_t v46 = *(void *)(a1 + 144);
          if (v46) {
            uint64_t v47 = *(dyld4::Atlas::Mapper **)(v46 + 8);
          }
          else {
            uint64_t v47 = 0;
          }
          *(void *)&long long v55 = v47;
          *((void *)&v55 + 1) = v45;
          uint64_t v48 = dyld4::Atlas::Mapper::map(v47, v41, v45);
          long long v49 = v55;
          long long v55 = v58;
          long long v58 = v49;
          int64_t v50 = v59;
          uint64_t v59 = v48;
          long long v56 = v50;
          LOBYTE(v50) = v60;
          char v60 = v51;
          char v57 = (char)v50;
          dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v55);
          uint64_t v43 = v59;
        }
        uint64_t v52 = *((unsigned int *)v43 + 79);
        if (v52)
        {
          uint64_t v53 = &v43[*((unsigned int *)v43 + 78) + 8];
          do
          {
            if (v31 <= *(void *)v53 + *((void *)v53 - 1)) {
              unint64_t v31 = *(void *)v53 + *((void *)v53 - 1);
            }
            v53 += 56;
            --v52;
          }
          while (v52);
        }
        dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v58);
        ++v33;
        uint64_t v34 = *(void *)(a1 + 128);
      }
      while (v33 < *(unsigned int *)(v34 + 396));
      uint64_t v28 = *(void *)(v34 + 224);
    }
    uint64_t v29 = v31 - v28;
  }
  else
  {
    uint64_t v29 = *(void *)(v19 + 232);
  }
  *(void *)(a1 + 104) = v29;
  return a1;
}

void dyld4::Atlas::SharedCache::forEachInstalledCacheWithSystemPath(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  long long v4 = (lsl::Lock **)MEMORY[0x1F41887A8](a1, a2, a3, a4);
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v11 = v4;
  uint64_t v12 = 0;
  uint64_t v43 = *MEMORY[0x1E4F14BF8];
  uint64_t v28 = 0;
  uint64_t v29 = v4;
  uint64_t v30 = 0;
  char v31 = 0;
  do
  {
    v38[0] = 0;
    if ((!v8 || dyld4::Utils::concatenatePaths((dyld4::Utils *)v38, v8, (const char *)0x400) <= 0x3FF)
      && dyld4::Utils::concatenatePaths((dyld4::Utils *)v38, dyld4::Atlas::SharedCache::forEachInstalledCacheWithSystemPath(lsl::Allocator &,dyld4::FileManager &,char const*,void({block_pointer})(dyld4::Atlas::SharedCache*))::cacheDirPaths[v12], (const char *)0x400) <= 0x3FF)
    {
      __source[0] = 0;
      if (realpath_DARWIN_EXTSN(v38, __source))
      {
        if (dyld4::Utils::concatenatePaths((dyld4::Utils *)__source, "/", (const char *)0x400) <= 0x3FF)
        {
          uint64_t v27 = 0;
          uint64_t v27 = lsl::Allocator::strdup(v11, __source);
          lsl::OrderedSet<char const*,lsl::ConstCharStarCompare>::insert(&v28, (char **)&v27, (uint64_t)v35);
          if (v35[104])
          {
            uint64_t v13 = opendir(__source);
            if (v13)
            {
              char v14 = v13;
              char v26 = 0;
              __dst[0] = 0;
              while (!readdir_r(v14, &v34, &v26) && v26)
              {
                if (v26->d_type == 8
                  && !DyldSharedCache::isSubCachePath((DyldSharedCache *)v26->d_name, v15)
                  && strlcpy(__dst, __source, 0x400uLL) <= 0x3FF
                  && dyld4::Utils::concatenatePaths((dyld4::Utils *)__dst, v26->d_name, (const char *)0x400) <= 0x3FF)
                {
                  dyld4::FileManager::fileRecordForPath(v10, v11, __dst, (uint64_t)v32);
                  dyld4::Atlas::SharedCache::createForFileRecord((dyld4::Atlas::Mapper *)v11, (lsl::Allocator *)v32, v16, &v25);
                  char v17 = v25;
                  if (v25) {
                    (*(void (**)(uint64_t))(v6 + 16))(v6);
                  }
                  lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr(&v25, v17);
                  dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v32);
                }
              }
              closedir(v14);
            }
          }
          else
          {
            lsl::Allocator::free(v11, v27);
          }
        }
      }
    }
    ++v12;
  }
  while (v12 != 15);
  v34.d_ino = (__uint64_t)&v28;
  memset(&v34.d_seekoff, 0, 91);
  uint64_t v18 = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t **)&v34);
  uint64_t v19 = *v18;
  v39[0] = *(_OWORD *)(v18 + 1);
  long long v20 = *(_OWORD *)(v18 + 9);
  long long v21 = *(_OWORD *)(v18 + 7);
  long long v22 = *(_OWORD *)(v18 + 5);
  v39[1] = *(_OWORD *)(v18 + 3);
  v39[2] = v22;
  v39[3] = v21;
  v39[4] = v20;
  uint64_t v23 = v18[11];
  __int16 v41 = *((_WORD *)v18 + 48);
  unsigned __int8 v24 = *((unsigned char *)v18 + 98);
  long long v40 = v23;
  *(void *)uint64_t v38 = v19;
  unsigned __int8 v42 = v24;
  long long v37 = 0u;
  memset(&v34.d_seekoff, 0, 91);
  v34.d_ino = (__uint64_t)&v28;
  while (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>((uint64_t)v38, (uint64_t)&v34))
  {
    lsl::Allocator::free(v11, *(void **)(*((void *)v39 + v42 - 1) + 8 * *((unsigned __int8 *)&v40 + v42 - 1)));
    lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++((uint64_t **)v38);
  }
  if (v28) {
    lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::deallocate(v28, v29);
  }
}

double lsl::OrderedSet<char const*,lsl::ConstCharStarCompare>::insert@<D0>(uint64_t *a1@<X0>, char **a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = *MEMORY[0x1E4F14BF8];
  uint64_t v8 = *a2;
  lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::const_iterator((uint64_t)v19, a1, &v8);
  lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::insert_internal((uint64_t)a1, (uint64_t)v19, &v8, (uint64_t)&v9);
  uint64_t v5 = v9;
  *(_OWORD *)(a3 + 24) = v11;
  *(_OWORD *)(a3 + 40) = v12;
  *(_OWORD *)(a3 + 56) = v13;
  *(_OWORD *)(a3 + 72) = v14;
  double result = *(double *)&v10;
  *(_OWORD *)(a3 + 8) = v10;
  *(void *)(a3 + 88) = v15;
  *(_WORD *)(a3 + 96) = v16;
  char v7 = v17;
  *(void *)a3 = v5;
  *(unsigned char *)(a3 + 98) = v7;
  *(unsigned char *)(a3 + 104) = v18;
  return result;
}

void dyld4::Atlas::SharedCache::createForFileRecord(dyld4::Atlas::Mapper *a1@<X0>, lsl::Allocator *a2@<X1>, const void *a3@<X3>, void *a4@<X8>)
{
  dyld4::Atlas::Mapper::mapperForSharedCache(a1, a2, 0, a3);
  uint64_t v8 = v12;
  if (!v12)
  {
    *a4 = 0;
    return;
  }
  if (!*((void *)v12 + 1))
  {
    *a4 = 0;
    goto LABEL_7;
  }
  uint64_t v9 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v12);
  long long v10 = *(char **)(*(void *)(*((void *)v12 + 1) + 8) + 16);
  long long v11 = lsl::Allocator::aligned_alloc(v9, 8uLL, 0xB0uLL);
  dyld4::Atlas::SharedCache::SharedCache((uint64_t)v11, (uint64_t)a1, a2, (atomic_uint **)&v12, v10, 1);
  uint64_t v8 = v12;
  *a4 = v11;
  if (v8) {
LABEL_7:
  }
    lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v8, v7);
}

uint64_t dyld4::Atlas::SharedCache::uuid(dyld4::Atlas::SharedCache *this)
{
  return (uint64_t)this + 88;
}

uint64_t dyld4::Atlas::SharedCache::size(dyld4::Atlas::SharedCache *this)
{
  return *((void *)this + 13);
}

uint64_t dyld4::Atlas::SharedCache::forEachFilePath(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F14BF8];
  long long v4 = (dyld4::FileRecord *)(a1 + 8);
  uint64_t Path = dyld4::FileRecord::getPath((dyld4::FileRecord *)(a1 + 8));
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, Path);
  uint64_t v7 = *(void *)(a1 + 128);
  unsigned int v8 = *(_DWORD *)(v7 + 16);
  if (v8 >= 0x18C)
  {
    if (v8 > 0x1C8)
    {
      if (*(_DWORD *)(v7 + 396))
      {
        unint64_t v11 = 0;
        long long v12 = (const char *)(*(unsigned int *)(v7 + 392) + v7 + 24);
        do
        {
          long long v13 = (const char *)dyld4::FileRecord::getPath(v4);
          snprintf(__str, 0x400uLL, "%s%s", v13, v12);
          uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, __str);
          ++v11;
          uint64_t v7 = *(void *)(a1 + 128);
          v12 += 56;
        }
        while (v11 < *(unsigned int *)(v7 + 396));
      }
    }
    else if (*(_DWORD *)(v7 + 396))
    {
      unsigned int v9 = 0;
      do
      {
        long long v10 = (const char *)dyld4::FileRecord::getPath(v4);
        snprintf(__str, 0x400uLL, "%s.%u", v10, ++v9);
        uint64_t result = (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, __str);
        uint64_t v7 = *(void *)(a1 + 128);
      }
      while (v9 < *(_DWORD *)(v7 + 396));
    }
    if (*(_DWORD *)(v7 + 16) >= 0x190u)
    {
      uint64_t result = uuid_is_null((const unsigned __int8 *)(v7 + 400));
      if (!result)
      {
        long long v14 = (const char *)dyld4::FileRecord::getPath(v4);
        strlcpy(__str, v14, 0x400uLL);
        if (strstr(__str, ".development")) {
          __str[strlen(__str) - 12] = 0;
        }
        strlcat(__str, ".symbols", 0x400uLL);
        return (*(uint64_t (**)(uint64_t, char *))(a2 + 16))(a2, __str);
      }
    }
  }
  return result;
}

uint64_t dyld4::Atlas::SharedCache::isPrivateMapped(dyld4::Atlas::SharedCache *this)
{
  return *((unsigned __int8 *)this + 168);
}

void dyld4::Atlas::SharedCache::forEachImage(void *a1, uint64_t a2)
{
  v26[2] = *MEMORY[0x1E4F14BF8];
  uint64_t v2 = a1[16];
  uint64_t v3 = *(void *)(v2 + 144);
  if (v3)
  {
    uint64_t v6 = (uint64_t *)(*(void *)(v2 + 136) + v2 + 16);
    uint64_t v7 = 32 * v3;
    long long v8 = 0uLL;
    do
    {
      uint64_t v10 = *v6;
      v6 += 4;
      uint64_t v9 = v10;
      uint64_t v14 = *a1;
      v15[0] = v8;
      v15[1] = v8;
      void v15[2] = v8;
      v15[3] = v8;
      uint64_t v16 = 0x1FFFFFFFFLL;
      __int16 v17 = 0;
      char v18 = 1;
      long long v12 = (lsl::Allocator *)a1[18];
      uint64_t v11 = a1[19];
      uint64_t v19 = v12;
      if (v12) {
        atomic_fetch_add_explicit((atomic_uint *volatile)v12, 1u, memory_order_relaxed);
      }
      *(_OWORD *)((char *)v21 + 9) = v8;
      long long v20 = v8;
      v21[0] = v8;
      uint64_t v22 = v11;
      char v23 = 1;
      uint64_t v24 = v11 + v9;
      int v25 = a1;
      v26[0] = 0;
      *(_DWORD *)((char *)v26 + 7) = 0;
      (*(void (**)(uint64_t, uint64_t *))(a2 + 16))(a2, &v14);
      dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v21);
      if (v19) {
        lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v19, v13);
      }
      dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v15);
      v7 -= 32;
      long long v8 = 0uLL;
    }
    while (v7);
  }
}

void dyld4::Atlas::SharedCache::withImageForIndex(void *a1, unsigned int a2, uint64_t a3)
{
  v19[2] = *MEMORY[0x1E4F14BF8];
  uint64_t v3 = *(void *)(a1[16] + *(void *)(a1[16] + 136) + 32 * a2 + 16);
  uint64_t v7 = *a1;
  memset(v8, 0, sizeof(v8));
  uint64_t v9 = 0x1FFFFFFFFLL;
  __int16 v10 = 0;
  char v11 = 1;
  uint64_t v5 = (lsl::Allocator *)a1[18];
  uint64_t v4 = a1[19];
  long long v12 = v5;
  if (v5) {
    atomic_fetch_add_explicit((atomic_uint *volatile)v5, 1u, memory_order_relaxed);
  }
  memset(v14, 0, 25);
  long long v13 = 0uLL;
  uint64_t v15 = v4;
  char v16 = 1;
  uint64_t v17 = v4 + v3;
  char v18 = a1;
  v19[0] = 0;
  *(_DWORD *)((char *)v19 + 7) = 0;
  (*(void (**)(uint64_t, uint64_t *))(a3 + 16))(a3, &v7);
  dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v14);
  if (v12) {
    lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v12, v6);
  }
  dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v8);
}

void dyld4::Atlas::SharedCache::localSymbols(dyld4::Atlas::SharedCache *this@<X0>, atomic_uint ***a2@<X8>)
{
  uint64_t v19 = *MEMORY[0x1E4F14BF8];
  uint64_t v4 = (dyld4::Atlas::SharedCache *)((char *)this + 8);
  uint64_t Path = (const char *)dyld4::FileRecord::getPath((dyld4::Atlas::SharedCache *)((char *)this + 8));
  strlcpy(__dst, Path, 0x400uLL);
  uint64_t v6 = *((void *)this + 16);
  unsigned int v7 = *(_DWORD *)(v6 + 16);
  if (v7 < 0x190)
  {
    if (*(void *)(v6 + 80) && *(void *)(v6 + 72)) {
      goto LABEL_8;
    }
LABEL_12:
    *a2 = 0;
    return;
  }
  if (uuid_is_null((const unsigned __int8 *)(v6 + 400))) {
    goto LABEL_12;
  }
  if (strstr(__dst, ".development")) {
    __dst[strlen(__dst) - 12] = 0;
  }
  strlcat(__dst, ".symbols", 0x400uLL);
LABEL_8:
  long long v8 = (dyld4::FileManager *)dyld4::FileRecord::fileManager(v4);
  dyld4::FileManager::fileRecordForPath(v8, *(lsl::Lock ***)this, __dst, (uint64_t)v17);
  dyld4::Atlas::Mapper::mapperForSharedCacheLocals(v9, (lsl::Allocator *)v17, v10, v11);
  long long v13 = v16;
  if (v16)
  {
    if (*((void *)v16 + 1))
    {
      uint64_t v14 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v16);
      uint64_t v15 = (atomic_uint **)lsl::Allocator::aligned_alloc(v14, 8uLL, 0x30uLL);
      dyld4::Atlas::SharedCacheLocals::SharedCacheLocals(v15, (atomic_uint **)&v16, v7 > 0x18F);
      long long v13 = v16;
      *a2 = v15;
      if (!v13) {
        goto LABEL_16;
      }
    }
    else
    {
      *a2 = 0;
    }
    lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v13, v12);
  }
  else
  {
    *a2 = 0;
  }
LABEL_16:
  dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v17);
}

uint64_t dyld4::Atlas::SharedCache::pin(dyld4::Atlas::SharedCache *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1) {
    return dyld4::Atlas::Mapper::pin(*(dyld4::Atlas::Mapper **)(v1 + 8));
  }
  else {
    return dyld4::Atlas::Mapper::pin(0);
  }
}

uint64_t dyld4::Atlas::SharedCache::unpin(dyld4::Atlas::SharedCache *this)
{
  uint64_t v1 = *((void *)this + 18);
  if (v1) {
    return dyld4::Atlas::Mapper::unpin(*(dyld4::Atlas::Mapper **)(v1 + 8));
  }
  else {
    return dyld4::Atlas::Mapper::unpin(0);
  }
}

dyld4::Atlas::Process *dyld4::Atlas::Process::Process(dyld4::Atlas::Process *this, lsl::Allocator *a2, dyld4::FileManager *a3, int a4, int *a5)
{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  *((_DWORD *)this + 4) = a4;
  *((_DWORD *)this + 5) = 0;
  unsigned int v7 = (lsl::Allocator *)dispatch_queue_create("com.apple.dyld.introspection", 0);
  *((void *)this + 3) = v7;
  *((void *)this + 4) = 0;
  *((_DWORD *)this + 10) = 0;
  long long v8 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v7);
  *((void *)this + 6) = 0;
  *((void *)this + 7) = v8;
  *((void *)this + 9) = 0;
  *((unsigned char *)this + 80) = 0;
  uint64_t v9 = lsl::Allocator::defaultAllocator(v8);
  *((void *)this + 11) = 0;
  *((void *)this + 12) = v9;
  *((void *)this + 14) = 0;
  *((unsigned char *)this + 120) = 0;
  *((void *)this + 16) = 0;
  __int16 v10 = (lsl::Allocator **)((char *)this + 128);
  *((_DWORD *)this + 34) = 1;
  dyld4::Atlas::Process::getSnapshot(this, a5, v11, v12);
  if (&v16 != (lsl::Allocator **)((char *)this + 128))
  {
    uint64_t v14 = *v10;
    dyld4::FileRecord *v10 = v16;
    char v16 = v14;
  }
  lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v16, v13);
  return this;
}

void dyld4::Atlas::Process::getSnapshot(dyld4::Atlas::Process *this, int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = MEMORY[0x1F41887A8](this, a2, a3, a4);
  uint64_t v6 = v4;
  long long v8 = v7;
  uint64_t v38 = *MEMORY[0x1E4F14BF8];
  if (v5) {
    uint64_t v9 = v5;
  }
  else {
    uint64_t v9 = (unsigned int *)&v32;
  }
  mach_msg_type_number_t task_info_outCnt = 5;
  int v32 = 0;
  LODWORD(v10) = task_info(*(_DWORD *)(v4 + 16), 0x11u, task_info_out, &task_info_outCnt);
  *uint64_t v9 = v10;
  if (v10)
  {
    int v11 = -285212672;
LABEL_6:
    int v12 = v11 & 0xFF000000 | v10 & 0xFFFFFF;
    goto LABEL_7;
  }
  if (!*(void *)task_info_out)
  {
    int v12 = -301989888;
LABEL_7:
    *uint64_t v9 = v12;
    *long long v8 = 0;
    return;
  }
  mach_vm_size_t outsize = 0;
  while (1)
  {
    __int16 v10 = (lsl::Allocator *)mach_vm_read_overwrite(*(_DWORD *)(v6 + 16), *(mach_vm_address_t *)task_info_out, v29, (mach_vm_address_t)v33, &outsize);
    *uint64_t v9 = v10;
    if (v10)
    {
      int v11 = -318767104;
      goto LABEL_6;
    }
    if (!v30) {
      break;
    }
    mach_vm_address_t v13 = v36;
    unint64_t v14 = v37;
    if (!v37) {
      goto LABEL_28;
    }
LABEL_15:
    uint64_t v15 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v10);
    char v16 = (lsl::Allocator *)lsl::Allocator::malloc(v15, v14);
    uint64_t v17 = (lsl::Allocator *)mach_vm_read_overwrite(*(_DWORD *)(v6 + 16), v13, v14, (mach_vm_address_t)v16, &outsize);
    int v19 = (int)v17;
    *uint64_t v9 = v17;
    if (!v17)
    {
      long long v20 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v17);
      uint64_t v21 = *(void *)v6;
      uint64_t v22 = *(void *)(v6 + 8);
      char v23 = (long long *)lsl::Allocator::aligned_alloc(v20, 8uLL, 0x70uLL);
      uint64_t v24 = dyld4::Atlas::ProcessSnapshot::ProcessSnapshot(v23, v21, v22, 0, (uint64_t)v16, v14);
      char v26 = (lsl::Allocator *)v24;
      if (*((unsigned char *)v24 + 105))
      {
        *long long v8 = 0;
        if (&v26 != v8)
        {
          *long long v8 = (lsl::Allocator *)v24;
          char v26 = 0;
        }
      }
      else
      {
        *uint64_t v9 = -352321531;
        *long long v8 = 0;
      }
      lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v26, v25);
      if (!v16) {
        goto LABEL_18;
      }
LABEL_17:
      lsl::Allocator::freeObject(v16, v18);
      goto LABEL_18;
    }
    *uint64_t v9 = v17 & 0xFFFFFF | 0xEC000000;
    if (v16) {
      goto LABEL_17;
    }
LABEL_18:
    if (!v19) {
      return;
    }
  }
  mach_vm_address_t v13 = v34;
  unint64_t v14 = v35;
  if (v35) {
    goto LABEL_15;
  }
LABEL_28:
  dyld4::Atlas::Process::synthesizeSnapshot((mach_port_name_t *)v6, v9, v8);
}

void dyld4::Atlas::Process::~Process(dyld4::Atlas::Process *this)
{
  uint64_t v2 = *((void *)this + 3);
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = ___ZN5dyld45Atlas7ProcessD2Ev_block_invoke;
  block[3] = &__block_descriptor_tmp_42;
  block[4] = this;
  dispatch_async_and_wait(v2, block);
  dispatch_release(*((dispatch_object_t *)this + 3));
  lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr((lsl::Allocator **)this + 16, v3);
  uint64_t v4 = *((void *)this + 11);
  if (v4)
  {
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::deallocate(v4, *((lsl::Lock ***)this + 12));
    *((void *)this + 11) = 0;
  }
  *((void *)this + 14) = 0;
  *((unsigned char *)this + 120) = 0;
  uint64_t v5 = *((void *)this + 6);
  if (v5)
  {
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::deallocate(v5, *((lsl::Lock ***)this + 7));
    *((void *)this + 6) = 0;
  }
  *((void *)this + 9) = 0;
  *((unsigned char *)this + 80) = 0;
}

NSObject *___ZN5dyld45Atlas7ProcessD2Ev_block_invoke(uint64_t a1)
{
  uint64_t result = *(NSObject **)(a1 + 32);
  if (LODWORD(result[5].isa) == 1) {
    return dyld4::Atlas::Process::teardownNotifications((dispatch_queue_t *)result);
  }
  return result;
}

NSObject *dyld4::Atlas::Process::teardownNotifications(dispatch_queue_t *this)
{
  uint64_t v56 = *MEMORY[0x1E4F14BF8];
  if (dispatch_get_current_queue() != this[3]) {
    dyld4::Atlas::Process::teardownNotifications();
  }
  if (*((_DWORD *)this + 10) != 1) {
    dyld4::Atlas::Process::teardownNotifications();
  }
  uint64_t result = this[4];
  if (result)
  {
    dispatch_source_cancel(result);
    *((_DWORD *)this + 5) = 0;
    this[4] = 0;
    *((_DWORD *)this + 10) = 0;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    memset(v46, 0, 24);
    uint64_t v38 = (uint64_t *)(this + 11);
    uint64_t v3 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v38);
    uint64_t v4 = *v3;
    long long v5 = *(_OWORD *)(v3 + 13);
    long long v6 = *(_OWORD *)(v3 + 11);
    unsigned int v7 = v3[15];
    long long v8 = v3[16];
    long long v33 = *(_OWORD *)(v3 + 9);
    long long v34 = v6;
    long long v35 = v5;
    *(void *)mach_vm_address_t v36 = v7;
    long long v9 = *(_OWORD *)(v3 + 7);
    long long v10 = *(_OWORD *)(v3 + 5);
    long long v11 = *(_OWORD *)(v3 + 3);
    long long v29 = *(_OWORD *)(v3 + 1);
    long long v30 = v11;
    long long v31 = v10;
    long long v32 = v9;
    *(void *)&v36[15] = *(uint64_t **)((char *)v3 + 135);
    *(void *)&v36[8] = v8;
    LOBYTE(v7) = *((unsigned char *)v3 + 143);
    uint64_t v28 = v4;
    v36[23] = (_BYTE)v7;
    long long v54 = 0u;
    memset(v55, 0, 23);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    uint64_t v38 = (uint64_t *)(this + 11);
    memset(v46, 0, 24);
    while (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v28, (uint64_t)&v38))
    {
      uint64_t v12 = *((void *)&v29 + v36[23] - 1) + 24 * v36[v36[23] + 7];
      if (!*(_DWORD *)v12) {
        dyld4::Atlas::Process::teardownNotifications();
      }
      mach_vm_address_t v13 = *(NSObject **)(v12 + 8);
      if (v13)
      {
        dispatch_release(v13);
        *(void *)(v12 + 8) = 0;
      }
      unint64_t v14 = *(const void **)(v12 + 16);
      if (v14)
      {
        _Block_release(v14);
        *(void *)(v12 + 16) = 0;
      }
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v28);
    }
    uint64_t v15 = (uint64_t *)(this + 6);
    uint64_t v38 = v15;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    memset(v46, 0, sizeof(v46));
    char v47 = 0;
    char v16 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v38);
    uint64_t v17 = *v16;
    long long v18 = *(_OWORD *)(v16 + 15);
    long long v19 = *(_OWORD *)(v16 + 13);
    long long v20 = *(_OWORD *)(v16 + 11);
    long long v33 = *(_OWORD *)(v16 + 9);
    long long v34 = v20;
    long long v35 = v19;
    *(_OWORD *)mach_vm_address_t v36 = v18;
    long long v21 = *(_OWORD *)(v16 + 7);
    long long v22 = *(_OWORD *)(v16 + 5);
    long long v23 = *(_OWORD *)(v16 + 3);
    long long v29 = *(_OWORD *)(v16 + 1);
    long long v30 = v23;
    long long v31 = v22;
    long long v32 = v21;
    *(_OWORD *)&v36[16] = *(_OWORD *)(v16 + 17);
    unsigned __int8 v24 = *((unsigned char *)v16 + 152);
    uint64_t v28 = v17;
    unsigned __int8 v37 = v24;
    memset(v55, 0, sizeof(v55));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v48 = 0u;
    uint64_t v38 = v15;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    memset(v46, 0, sizeof(v46));
    char v47 = 0;
    for (uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v28, (uint64_t)&v38);
          (_BYTE)result;
          uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v28, (uint64_t)&v38))
    {
      uint64_t v25 = *((void *)&v29 + v37 - 1) + 32 * v36[v37 + 15];
      if (!*(_DWORD *)v25) {
        dyld4::Atlas::Process::teardownNotifications();
      }
      char v26 = *(NSObject **)(v25 + 8);
      if (v26)
      {
        dispatch_release(v26);
        *(void *)(v25 + 8) = 0;
      }
      uint64_t v27 = *(const void **)(v25 + 16);
      if (v27)
      {
        _Block_release(v27);
        *(void *)(v25 + 16) = 0;
      }
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v28);
    }
  }
  return result;
}

lsl::Allocator **dyld4::Atlas::Process::synthesizeSnapshot@<X0>(mach_port_name_t *this@<X0>, unsigned int *a2@<X1>, lsl::Allocator **a3@<X8>)
{
  kern_return_t v10;
  void *v11;
  int v12;
  unsigned int v13;
  unsigned int v15;
  int v16;
  int v17;
  lsl::Allocator *v18;
  kern_return_t v19;
  dyld3::MachOFile *v20;
  dyld3::MachOFile *v21;
  int v22;
  lsl::Allocator *v23;
  dyld4::FileManager *v24;
  lsl::Lock **v25;
  BOOL v26;
  lsl::Allocator *v27;
  uint64_t v28;
  mach_vm_address_t v29;
  void *v30;
  lsl::Allocator *v31;
  dyld4::FileManager *v32;
  lsl::Lock **v33;
  BOOL Uuid;
  lsl::Allocator *v35;
  uint64_t v36;
  mach_vm_address_t v37;
  void *v38;
  BOOL v39;
  int v40;
  unsigned int v41;
  mach_msg_type_number_t infoCnt;
  mach_port_t object_name;
  int info[9];
  mach_vm_address_t address;
  mach_vm_size_t size;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[12];
  int x;
  lsl::Allocator *v50;
  mach_vm_size_t outsize;
  char buffer[1025];
  uint64_t v53;
  unsigned char v54[80];
  lsl::Allocator *v55;
  long long v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  char v62;
  mach_vm_address_t v63;
  uint64_t v64;
  void v65[2];
  long long v66;
  long long v67;
  unsigned char v68[80];
  uint64_t v69;

  int v69 = *MEMORY[0x1E4F14BF8];
  long long v6 = (lsl::Lock **)lsl::Allocator::defaultAllocator((lsl::Allocator *)this);
  unsigned int v7 = *(lsl::Allocator **)this;
  long long v8 = (dyld4::FileManager *)*((void *)this + 1);
  long long v9 = (dyld4::Atlas::ProcessSnapshot *)lsl::Allocator::aligned_alloc(v6, 8uLL, 0x70uLL);
  long long v50 = dyld4::Atlas::ProcessSnapshot::ProcessSnapshot(v9, v7, v8, 0);
  x = 0;
  long long v10 = pid_for_task(this[4], &x);
  if (a2)
  {
    *a2 = v10;
    if (v10)
    {
      uint64_t v12 = -352321536;
LABEL_9:
      mach_vm_address_t v13 = v12 & 0xFF000000 | v10 & 0xFFFFFF;
      goto LABEL_10;
    }
    mach_msg_type_number_t task_info_outCnt = 12;
    long long v10 = task_info(this[4], 0x14u, task_info_out, &task_info_outCnt);
    *a2 = v10;
    if (v10)
    {
      uint64_t v12 = -385875968;
      goto LABEL_9;
    }
  }
  else
  {
    if (v10) {
      goto LABEL_11;
    }
    mach_msg_type_number_t task_info_outCnt = 12;
    if (task_info(this[4], 0x14u, task_info_out, &task_info_outCnt)) {
      goto LABEL_11;
    }
  }
  address = 0;
  size = 0;
  infoCnt = 9;
  object_name = 0;
  uint64_t v15 = 0;
  char v16 = 0;
  if (!mach_vm_region(this[4], &address, &size, 10, info, &infoCnt, &object_name))
  {
    uint64_t v15 = 0;
    uint64_t v17 = 0;
    char v16 = 0;
    do
    {
      if (info[0] != 5) {
        goto LABEL_48;
      }
      long long v18 = (lsl::Allocator *)lsl::Allocator::malloc(*(lsl::Lock ***)this, size);
      mach_vm_size_t outsize = 0;
      long long v19 = mach_vm_read_overwrite(this[4], address, size, (mach_vm_address_t)v18, &outsize);
      if (a2)
      {
        *a2 = v19;
        if (v19)
        {
          *a2 = v19 & 0xFFFFFF | 0xE8000000;
          goto LABEL_36;
        }
      }
      else
      {
        if (v19)
        {
          uint64_t v15 = v19 & 0xFFFFFF | 0xE8000000;
          goto LABEL_36;
        }
        uint64_t v15 = 0;
      }
      long long v20 = (dyld3::MachOFile *)dyld3::MachOFile::isMachO(v18, v11);
      if (v20)
      {
        long long v21 = v20;
        long long v22 = *((_DWORD *)v20 + 3);
        if (v22 == 7)
        {
          long long v41 = v15;
          long long v31 = (lsl::Allocator *)proc_regionfilename(x, address, buffer, 0x400u);
          if (v31) {
            buffer[(int)v31] = 0;
          }
          long long v32 = (dyld4::FileManager *)*((void *)this + 1);
          long long v33 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v31);
          dyld4::FileManager::fileRecordForPath(v32, v33, buffer, (uint64_t)v68);
          uint64_t v67 = 0uLL;
          Uuid = dyld3::MachOFile::getUuid(v21, (unsigned __int8 *)&v67);
          uint64_t v66 = v67;
          long long v35 = v50;
          mach_vm_address_t v36 = lsl::Allocator::defaultAllocator((lsl::Allocator *)Uuid);
          unsigned __int8 v37 = address;
          long long v53 = v36;
          dyld4::FileRecord::FileRecord((uint64_t)v54, (dyld4::FileRecord *)v68);
          long long v55 = 0;
          uint64_t v56 = v66;
          long long v58 = 0;
          uint64_t v59 = 0;
          char v57 = 0;
          char v60 = 0;
          int v61 = 0;
          v62 = 0;
          unint64_t v63 = v37;
          uint64_t v64 = 0;
          v65[0] = 0;
          *(_DWORD *)((char *)v65 + 7) = 0;
          dyld4::Atlas::ProcessSnapshot::addImage(v35, (dyld4::Atlas::Image *)&v53);
          dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v57);
          if (v55) {
            lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v55, v38);
          }
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v54);
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v68);
          uint64_t v17 = 1;
        }
        else
        {
          if (v22 != 2) {
            goto LABEL_36;
          }
          long long v41 = v15;
          long long v23 = (lsl::Allocator *)proc_regionfilename(x, address, buffer, 0x400u);
          if (v23) {
            buffer[(int)v23] = 0;
          }
          unsigned __int8 v24 = (dyld4::FileManager *)*((void *)this + 1);
          uint64_t v25 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v23);
          dyld4::FileManager::fileRecordForPath(v24, v25, buffer, (uint64_t)v68);
          uint64_t v67 = 0uLL;
          char v26 = dyld3::MachOFile::getUuid(v21, (unsigned __int8 *)&v67);
          uint64_t v66 = v67;
          uint64_t v27 = v50;
          uint64_t v28 = lsl::Allocator::defaultAllocator((lsl::Allocator *)v26);
          long long v29 = address;
          long long v53 = v28;
          dyld4::FileRecord::FileRecord((uint64_t)v54, (dyld4::FileRecord *)v68);
          long long v55 = 0;
          uint64_t v56 = v66;
          long long v58 = 0;
          uint64_t v59 = 0;
          char v57 = 0;
          char v60 = 0;
          int v61 = 0;
          v62 = 0;
          unint64_t v63 = v29;
          uint64_t v64 = 0;
          v65[0] = 0;
          *(_DWORD *)((char *)v65 + 7) = 0;
          dyld4::Atlas::ProcessSnapshot::addImage(v27, (dyld4::Atlas::Image *)&v53);
          dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)&v57);
          if (v55) {
            lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v55, v30);
          }
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v54);
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v68);
          char v16 = 1;
        }
        uint64_t v15 = v41;
      }
LABEL_36:
      if (v17) {
        long long v39 = v16 == 0;
      }
      else {
        long long v39 = 1;
      }
      long long v40 = v39;
      if (!v39)
      {
        *a3 = 0;
        if (&v50 != a3)
        {
          *a3 = v50;
          long long v50 = 0;
        }
      }
      if (v18) {
        lsl::Allocator::freeObject(v18, v11);
      }
      if (!v40) {
        return lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v50, v11);
      }
LABEL_48:
      address += size;
      infoCnt = 9;
      object_name = 0;
    }
    while (!mach_vm_region(this[4], &address, &size, 10, info, &infoCnt, &object_name));
  }
  if (a2) {
    uint64_t v15 = *a2;
  }
  if (v15) {
    goto LABEL_11;
  }
  if (!v16)
  {
    if (!a2) {
      goto LABEL_11;
    }
    mach_vm_address_t v13 = 5;
LABEL_10:
    *a2 = v13;
LABEL_11:
    *a3 = 0;
    return lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v50, v11);
  }
  *a3 = 0;
  if (&v50 != a3)
  {
    *a3 = v50;
    long long v50 = 0;
  }
  return lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v50, v11);
}

uint64_t dyld4::Atlas::ProcessSnapshot::valid(dyld4::Atlas::ProcessSnapshot *this)
{
  return *((unsigned __int8 *)this + 105);
}

void dyld4::Atlas::Process::setupNotifications(dyld4::Atlas::Process *this, int *a2)
{
  kern_return_t v5;
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v8;
  NSObject *v9;
  void v10[7];
  void handler[5];
  mach_port_t previous;
  mach_port_options_t options;

  if (dispatch_get_current_queue() != *((dispatch_queue_t *)this + 3)) {
    dyld4::Atlas::Process::setupNotifications();
  }
  if (!a2) {
    dyld4::Atlas::Process::setupNotifications();
  }
  if (*((_DWORD *)this + 10)) {
    dyld4::Atlas::Process::setupNotifications();
  }
  options.reserved[1] = 0;
  *(_OWORD *)&options.flags = xmmword_1ACF93AE0;
  uint64_t v4 = (ipc_space_t *)MEMORY[0x1E4F14C48];
  long long v5 = mach_port_construct(*MEMORY[0x1E4F14C48], &options, (mach_port_context_t)this, (mach_port_name_t *)this + 5);
  *a2 = v5;
  if (!v5)
  {
    previous = 0;
    long long v6 = mach_port_request_notification(*v4, *((_DWORD *)this + 5), 70, 1u, *((_DWORD *)this + 5), 0x15u, &previous);
    *a2 = v6;
    if (v6 | previous
      || (unsigned int v7 = task_dyld_process_info_notify_register(*((_DWORD *)this + 4), *((_DWORD *)this + 5)), (*a2 = v7) != 0)
      || (long long v8 = dispatch_source_create(MEMORY[0x1E4F14BC8], *((unsigned int *)this + 5), 0, *((dispatch_queue_t *)this + 3)), (*((void *)this + 4) = v8) == 0))
    {
      mach_port_destruct(*v4, *((_DWORD *)this + 5), 0, (mach_port_context_t)this);
    }
    else
    {
      handler[0] = MEMORY[0x1E4F14BE8];
      handler[1] = 0x40000000;
      handler[2] = ___ZN5dyld45Atlas7Process18setupNotificationsEPi_block_invoke;
      handler[3] = &__block_descriptor_tmp_46;
      handler[4] = this;
      dispatch_source_set_event_handler(v8, handler);
      long long v9 = *((void *)this + 4);
      v10[0] = MEMORY[0x1E4F14BE8];
      v10[1] = 0x40000000;
      vm_address_t v10[2] = ___ZN5dyld45Atlas7Process18setupNotificationsEPi_block_invoke_2;
      void v10[3] = &__block_descriptor_tmp_47;
      void v10[6] = *((void *)this + 2);
      void v10[4] = this;
      v10[5] = v9;
      dispatch_source_set_cancel_handler(v9, v10);
      dispatch_activate(*((dispatch_object_t *)this + 4));
      *((_DWORD *)this + 10) = 1;
    }
  }
}

void ___ZN5dyld45Atlas7Process18setupNotificationsEPi_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void dyld4::Atlas::Process::handleNotifications(dyld4::Atlas::Process *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = MEMORY[0x1F41887A8](this, a2, a3, a4);
  uint64_t v48 = *MEMORY[0x1E4F14BF8];
  if (*(_DWORD *)(v4 + 40) == 1)
  {
    uint64_t v5 = v4;
    bzero(&msg, 0x8000uLL);
    if (mach_msg(&msg, 50333698, 0, 0x7FCCu, *(_DWORD *)(v5 + 20), 0, 0) || (msg.msgh_bits & 0x80000000) != 0)
    {
      long long v19 = (FILE *)*MEMORY[0x1E4F14C00];
      mach_msg_id_t msgh_id = msg.msgh_id;
    }
    else
    {
      mach_msg_id_t msgh_id = msg.msgh_id;
      if ((msg.msgh_id & 0xFFFFF000) == 0x4000)
      {
        if (msg.msgh_size == 24)
        {
          if ((msg.msgh_id & 0xFFF) != 0)
          {
            *(void *)&v29.msgh_bits = v5 + 48;
            *(_OWORD *)&v29.msgh_remote_port = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            char v38 = 0;
            long long v9 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++((uint64_t **)&v29);
            long long v10 = *v9;
            long long v11 = *(_OWORD *)(v9 + 15);
            long long v12 = *(_OWORD *)(v9 + 13);
            long long v13 = *(_OWORD *)(v9 + 11);
            v25[4] = *(_OWORD *)(v9 + 9);
            v25[5] = v13;
            v25[6] = v12;
            v25[7] = v11;
            long long v14 = *(_OWORD *)(v9 + 7);
            long long v15 = *(_OWORD *)(v9 + 5);
            long long v16 = *(_OWORD *)(v9 + 3);
            v25[0] = *(_OWORD *)(v9 + 1);
            v25[1] = v16;
            v25[2] = v15;
            v25[3] = v14;
            long long v26 = *(_OWORD *)(v9 + 17);
            unsigned __int8 v17 = *((unsigned char *)v9 + 152);
            *(void *)unsigned __int8 v24 = v10;
            unsigned __int8 v27 = v17;
            long long v46 = 0u;
            long long v47 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            long long v42 = 0u;
            long long v43 = 0u;
            long long v40 = 0u;
            long long v41 = 0u;
            long long v39 = 0u;
            *(void *)&v29.msgh_bits = v5 + 48;
            *(_OWORD *)&v29.msgh_remote_port = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            char v38 = 0;
            while (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)v24, (uint64_t)&v29))
            {
              uint64_t v18 = *((void *)v25 + v27 - 1) + 32 * *((unsigned __int8 *)&v26 + v27 - 1);
              if ((msg.msgh_id & 0xFFF) == *(_DWORD *)(v18 + 24)) {
                dispatch_async_and_wait(*(dispatch_queue_t *)(v18 + 8), *(dispatch_block_t *)(v18 + 16));
              }
              lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++((uint64_t **)v24);
            }
          }
          else
          {
            v24[0] = 0;
            dyld4::Atlas::Process::getSnapshot((dyld4::Atlas::Process *)v5, v24, v6, v7);
            if (!v24[0])
            {
              lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::withUnsafe<dyld4::Atlas::Process::handleNotifications(void)::$_0>((uint64_t *)&v29, v5);
              lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::withUnsafe<dyld4::Atlas::Process::handleNotifications(void)::$_1>((uint64_t *)(v5 + 128), (uint64_t **)&v29, v5);
            }
            long long v22 = (uint64_t *)(v5 + 128);
            if (&v29 != (mach_msg_header_t *)(v5 + 128))
            {
              uint64_t v23 = *v22;
              uint64_t *v22 = *(void *)&v29.msgh_bits;
              *(void *)&v29.msgh_bits = v23;
            }
            lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr((lsl::Allocator **)&v29, v21);
          }
        }
        else
        {
          dyld4::Atlas::Process::teardownNotifications((dispatch_queue_t *)v5);
        }
        *(void *)&v29.msgh_voucher_port = 0;
        v29.msgh_remote_port = msg.msgh_remote_port;
        v29.msgh_local_port = 0;
        v29.msgh_bits = msg.msgh_bits & 0x1F;
        v29.msgh_size = 24;
        if (!mach_msg(&v29, 1, 0x18u, 0, 0, 0, 0))
        {
          msg.msgh_remote_port = 0;
          goto LABEL_34;
        }
        goto LABEL_32;
      }
      if (msg.msgh_id >= 0x2000)
      {
        if (msg.msgh_id == 0x2000 || msg.msgh_id == 12288) {
          goto LABEL_34;
        }
      }
      else
      {
        if (msg.msgh_id == 70)
        {
          long long v20 = (mach_msg_bits_t *)((char *)&msg.msgh_bits + ((msg.msgh_size + 3) & 0x1FFFFFFFCLL));
          if (*v20 || v20[1] < 0x34u || v20[10]) {
            goto LABEL_34;
          }
LABEL_32:
          dyld4::Atlas::Process::teardownNotifications((dispatch_queue_t *)v5);
          goto LABEL_34;
        }
        if (msg.msgh_id == 4096)
        {
LABEL_34:
          mach_msg_destroy(&msg);
          return;
        }
      }
      long long v19 = (FILE *)*MEMORY[0x1E4F14C00];
    }
    fprintf(v19, "dyld: received unknown message id=0x%X, size=%d\n", msgh_id, msg.msgh_size);
    goto LABEL_34;
  }
}

void ___ZN5dyld45Atlas7Process18setupNotificationsEPi_block_invoke_2(uint64_t a1)
{
  mach_port_context_t v2 = *(void *)(a1 + 32);
  task_dyld_process_info_notify_deregister(*(_DWORD *)(a1 + 48), *(_DWORD *)(a1 + 52));
  mach_port_destruct(*MEMORY[0x1E4F14C48], *(_DWORD *)(a1 + 52), 0, v2);
  uint64_t v3 = *(NSObject **)(a1 + 40);

  dispatch_release(v3);
}

void *lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::withUnsafe<dyld4::Atlas::Process::handleNotifications(void)::$_0>(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(uint64_t **)(a2 + 128);
  v5[0] = MEMORY[0x1E4F14BE8];
  v5[1] = 0x40000000;
  v5[2] = ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__0clEPNS0_15ProcessSnapshotE_block_invoke;
  void v5[3] = &__block_descriptor_tmp_69;
  void v5[4] = a2;
  return dyld4::Atlas::ProcessSnapshot::forEachImageNotIn(v3, v2, (uint64_t)v5);
}

void *lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::withUnsafe<dyld4::Atlas::Process::handleNotifications(void)::$_1>(uint64_t *a1, uint64_t **a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  v6[0] = MEMORY[0x1E4F14BE8];
  v6[1] = 0x40000000;
  v6[2] = ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__1clEPNS0_15ProcessSnapshotE_block_invoke;
  void v6[3] = &__block_descriptor_tmp_71_0;
  v6[4] = a3;
  return dyld4::Atlas::ProcessSnapshot::forEachImageNotIn(v4, v3, (uint64_t)v6);
}

uint64_t dyld4::Atlas::Process::registerAtlasChangedEventHandler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x2000000000;
  int v11 = 0;
  uint64_t v4 = *(NSObject **)(a1 + 24);
  block[0] = MEMORY[0x1E4F14BE8];
  block[1] = 0x40000000;
  block[2] = ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke;
  block[3] = &unk_1E5E6CE48;
  block[6] = a1;
  block[7] = a2;
  block[8] = a3;
  block[4] = a4;
  void block[5] = &v8;
  dispatch_async_and_wait(v4, block);
  uint64_t v5 = *((unsigned int *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v5;
}

double ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F14BF8];
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v2 = *(int **)(a1 + 56);
  if (*(_DWORD *)(v3 + 40))
  {
    if (*v2)
    {
      uint64_t v4 = *(dispatch_queue_t **)(a1 + 48);
      dyld4::Atlas::Process::teardownNotifications(v4);
      return result;
    }
  }
  else
  {
    dyld4::Atlas::Process::setupNotifications(*(dyld4::Atlas::Process **)(a1 + 48), v2);
    if (**(_DWORD **)(a1 + 56)) {
      return result;
    }
  }
  uint64_t v6 = *(uint64_t **)(v3 + 128);
  v15[0] = MEMORY[0x1E4F14BE8];
  v15[1] = 0x40000000;
  void v15[2] = ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke_2;
  v15[3] = &unk_1E5E6CE20;
  _OWORD v15[4] = *(void *)(a1 + 32);
  dyld4::Atlas::ProcessSnapshot::forEachImage(v6, (uint64_t)v15);
  if (*(_DWORD *)(v3 + 40) != 1) {
    ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke_cold_1();
  }
  dispatch_retain(*(dispatch_object_t *)(a1 + 64));
  int v7 = *(_DWORD *)(v3 + 136);
  *(_DWORD *)(v3 + 136) = v7 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  uint64_t v8 = *(const void **)(a1 + 32);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void *)(a1 + 64);
  int v11 = _Block_copy(v8);
  int v12 = *(_DWORD *)(v9 + 24);
  uint64_t v13 = v10;
  long long v14 = v11;
  return lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::insert((uint64_t *)(v3 + 88), (uint64_t)&v12, (uint64_t)v16);
}

void *dyld4::Atlas::ProcessSnapshot::forEachImage(uint64_t *a1, uint64_t a2)
{
  uint64_t v34 = *MEMORY[0x1E4F14BF8];
  uint64_t v20 = a2;
  uint64_t v3 = a1 + 2;
  long long v26 = a1 + 2;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  memset(v31, 0, 27);
  uint64_t v4 = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++(&v26);
  uint64_t v5 = *v4;
  v22[0] = *(_OWORD *)(v4 + 1);
  long long v6 = *(_OWORD *)(v4 + 9);
  long long v7 = *(_OWORD *)(v4 + 7);
  long long v8 = *(_OWORD *)(v4 + 5);
  v22[1] = *(_OWORD *)(v4 + 3);
  v22[2] = v8;
  v22[3] = v7;
  v22[4] = v6;
  uint64_t v9 = v4[11];
  __int16 v24 = *((_WORD *)v4 + 48);
  uint64_t v23 = v9;
  LOBYTE(v9) = *((unsigned char *)v4 + 98);
  long long v21 = v5;
  unsigned __int8 v25 = v9;
  long long v33 = 0u;
  long long v26 = v3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  memset(v31, 0, 27);
  if (!lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>((uint64_t)&v21, (uint64_t)&v26))
  {
    int v11 = (void **)(a1 + 8);
    double result = (void *)a1[8];
    if (!result) {
      return result;
    }
    goto LABEL_18;
  }
  int v10 = 0;
  int v11 = (void **)(a1 + 8);
  do
  {
    uint64_t v12 = v25 - 1;
    uint64_t v13 = *((void *)v22 + v12);
    uint64_t v14 = *((unsigned __int8 *)&v23 + v12);
    long long v15 = *v11;
    uint64_t v16 = *(void *)(v13 + 8 * v14);
    if (*v11 && v15[20] <= *(void *)(v16 + 160))
    {
      if (!v10)
      {
        if (*(void *)(v15[16] + 144))
        {
          unint64_t v17 = 0;
          do
          {
            if ((*(unsigned __int8 *)(*(void *)(a1[7] + 8) + (v17 >> 3)) >> (v17 & 7)))
            {
              v32[0] = MEMORY[0x1E4F14BE8];
              v32[1] = 0x40000000;
              v32[2] = ___ZZN5dyld45Atlas15ProcessSnapshot12forEachImageEU13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke;
              v32[3] = &__block_descriptor_tmp_74;
              v32[4] = &v20;
              dyld4::Atlas::SharedCache::withImageForIndex(v15, v17, (uint64_t)v32);
              long long v15 = *v11;
            }
            ++v17;
          }
          while (*(void *)(v15[16] + 144) > v17);
        }
        int v10 = 1;
      }
      uint64_t v16 = *(void *)(v13 + 8 * v14);
    }
    (*(void (**)(uint64_t, uint64_t))(v20 + 16))(v20, v16);
    lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++(&v21);
  }
  while (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>((uint64_t)&v21, (uint64_t)&v26));
  double result = *v11;
  if (*v11 && !v10)
  {
LABEL_18:
    if (*(void *)(result[16] + 144))
    {
      unint64_t v19 = 0;
      do
      {
        if ((*(unsigned __int8 *)(*(void *)(a1[7] + 8) + (v19 >> 3)) >> (v19 & 7)))
        {
          long long v26 = (uint64_t *)MEMORY[0x1E4F14BE8];
          *(void *)&long long v27 = 0x40000000;
          *((void *)&v27 + 1) = ___ZZN5dyld45Atlas15ProcessSnapshot12forEachImageEU13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke;
          *(void *)&long long v28 = &__block_descriptor_tmp_74;
          *((void *)&v28 + 1) = &v20;
          dyld4::Atlas::SharedCache::withImageForIndex(result, v19, (uint64_t)&v26);
          double result = *v11;
        }
        ++v19;
      }
      while (*(void *)(result[16] + 144) > v19);
    }
  }
  return result;
}

uint64_t ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

double lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::insert@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = *MEMORY[0x1E4F14BF8];
  unsigned int v9 = *(_DWORD *)a2;
  long long v10 = *(_OWORD *)(a2 + 8);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator((uint64_t)v22, a1, &v9);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::insert_internal((uint64_t)a1, (uint64_t)v22, &v9, (uint64_t)&v11);
  uint64_t v5 = v11;
  *(_OWORD *)(a3 + 72) = v16;
  *(_OWORD *)(a3 + 88) = v17;
  *(_OWORD *)(a3 + 104) = v18;
  *(_OWORD *)(a3 + 8) = v12;
  *(_OWORD *)(a3 + 24) = v13;
  *(_OWORD *)(a3 + 40) = v14;
  double result = *(double *)&v15;
  *(_OWORD *)(a3 + 56) = v15;
  *(void *)(a3 + 135) = *(void *)&v20[7];
  uint64_t v7 = *(void *)v20;
  *(void *)(a3 + 120) = v19;
  *(void *)(a3 + 128) = v7;
  __int16 v8 = v21;
  *(void *)a3 = v5;
  *(_WORD *)(a3 + 143) = v8;
  return result;
}

uint64_t dyld4::Atlas::Process::registerEventHandler(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  int v13 = 0;
  uint64_t v5 = *(NSObject **)(a1 + 24);
  v8[0] = MEMORY[0x1E4F14BE8];
  v8[1] = 0x40000000;
  void v8[2] = ___ZN5dyld45Atlas7Process20registerEventHandlerEPijP16dispatch_queue_sU13block_pointerFvvE_block_invoke;
  v8[3] = &unk_1E5E6CE70;
  void v8[6] = a1;
  v8[7] = a2;
  unsigned char v8[8] = a4;
  _OWORD v8[4] = a5;
  void v8[5] = &v10;
  int v9 = a3;
  dispatch_async_and_wait(v5, v8);
  uint64_t v6 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void ___ZN5dyld45Atlas7Process20registerEventHandlerEPijP16dispatch_queue_sU13block_pointerFvvE_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F14BF8];
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = *(_DWORD *)(v2 + 40);
  if (!v3)
  {
    dyld4::Atlas::Process::setupNotifications(*(dyld4::Atlas::Process **)(a1 + 48), *(int **)(a1 + 56));
    if (**(_DWORD **)(a1 + 56)) {
      return;
    }
    int v3 = *(_DWORD *)(v2 + 40);
  }
  if (v3 != 1) {
    ___ZN5dyld45Atlas7Process20registerEventHandlerEPijP16dispatch_queue_sU13block_pointerFvvE_block_invoke_cold_1();
  }
  dispatch_retain(*(dispatch_object_t *)(a1 + 64));
  int v4 = *(_DWORD *)(v2 + 136);
  *(_DWORD *)(v2 + 136) = v4 + 1;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t v7 = _Block_copy(*(const void **)(a1 + 32));
  int v8 = *(_DWORD *)(a1 + 72);
  int v9 = *(_DWORD *)(v5 + 24);
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  int v12 = v8;
  lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::insert((uint64_t *)(v2 + 48), (uint64_t)&v9, (uint64_t)v13);
}

double lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::insert@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v24 = *MEMORY[0x1E4F14BF8];
  unsigned int v8 = *(_DWORD *)a2;
  long long v9 = *(_OWORD *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 24);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator((uint64_t)v23, a1, &v8);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::insert_internal((uint64_t)a1, (uint64_t)v23, &v8, (uint64_t)&v11);
  uint64_t v5 = v11;
  *(_OWORD *)(a3 + 72) = v16;
  *(_OWORD *)(a3 + 88) = v17;
  *(_OWORD *)(a3 + 104) = v18;
  *(_OWORD *)(a3 + 120) = v19;
  *(_OWORD *)(a3 + 8) = v12;
  *(_OWORD *)(a3 + 24) = v13;
  *(_OWORD *)(a3 + 40) = v14;
  *(_OWORD *)(a3 + 56) = v15;
  double result = *(double *)&v20;
  *(_OWORD *)(a3 + 136) = v20;
  char v7 = v21;
  *(void *)a3 = v5;
  *(unsigned char *)(a3 + 152) = v7;
  *(unsigned char *)(a3 + 160) = v22;
  return result;
}

void dyld4::Atlas::Process::unregisterEventHandler(dyld4::Atlas::Process *this, int a2)
{
  uint64_t v2 = *((void *)this + 3);
  v3[0] = MEMORY[0x1E4F14BE8];
  v3[1] = 0x40000000;
  v3[2] = ___ZN5dyld45Atlas7Process22unregisterEventHandlerEj_block_invoke;
  void v3[3] = &__block_descriptor_tmp_56;
  v3[4] = this;
  int v4 = a2;
  dispatch_async_and_wait(v2, v3);
}

double ___ZN5dyld45Atlas7Process22unregisterEventHandlerEj_block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F14BF8];
  uint64_t v2 = *(void *)(a1 + 32);
  *(void *)&v34[8] = 0;
  *(void *)&v34[16] = 0;
  *(_DWORD *)uint64_t v34 = *(_DWORD *)(a1 + 40);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::find((uint64_t *)(v2 + 88), (unsigned int *)v34, (uint64_t)&v36);
  long long v29 = v41;
  long long v30 = v42;
  long long v31 = v43;
  uint64_t v24 = v36;
  long long v25 = v37;
  long long v26 = v38;
  long long v27 = v39;
  long long v28 = v40;
  *(void *)&v32[15] = *(void *)((char *)v44 + 15);
  *(_OWORD *)long long v32 = v44[0];
  unsigned __int8 v33 = BYTE7(v44[1]);
  memset(v34, 0, 135);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v36 = v2 + 88;
  memset(v44, 0, 24);
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v24, (uint64_t)&v36))
  {
    unsigned __int8 v3 = v33;
    uint64_t v4 = v33 - 1;
    uint64_t v5 = *((void *)&v25 + v4) + 24 * v32[v4 + 8];
    if (!*(void *)(v5 + 16)) {
      ___ZN5dyld45Atlas7Process22unregisterEventHandlerEj_block_invoke_cold_1();
    }
    uint64_t v6 = *(NSObject **)(v5 + 8);
    if (v6)
    {
      dispatch_release(v6);
      unsigned __int8 v3 = v33;
      uint64_t v4 = v33 - 1;
    }
    char v7 = *(const void **)(*((void *)&v25 + v4) + 24 * v32[v4 + 8] + 16);
    if (v7)
    {
      _Block_release(v7);
      unsigned __int8 v3 = v33;
    }
    *(_OWORD *)&v34[72] = v29;
    *(_OWORD *)&v34[88] = v30;
    *(_OWORD *)&v34[104] = v31;
    *(_OWORD *)&v34[8] = v25;
    *(_OWORD *)&v34[24] = v26;
    *(_OWORD *)&v34[40] = v27;
    *(_OWORD *)&v34[56] = v28;
    *(void *)&v34[135] = *(void *)&v32[15];
    *(void *)&v34[120] = *(void *)v32;
    *(void *)&v34[128] = *(void *)&v32[8];
    *(void *)uint64_t v34 = v24;
    v34[143] = v3;
    *(void *)&double result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::erase(v2 + 88, (uint64_t)v34, (uint64_t)&v36).n128_u64[0];
  }
  else
  {
    memset(&v34[8], 0, 24);
    *(_DWORD *)uint64_t v34 = *(_DWORD *)(a1 + 40);
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::find((uint64_t *)(v2 + 48), (unsigned int *)v34, (uint64_t)&v36);
    uint64_t v13 = v36;
    long long v18 = v41;
    long long v19 = v42;
    long long v20 = v43;
    long long v21 = v44[0];
    long long v14 = v37;
    long long v15 = v38;
    long long v16 = v39;
    long long v17 = v40;
    long long v22 = v44[1];
    unsigned __int8 v23 = v45;
    memset(v34, 0, 144);
    uint64_t v36 = v2 + 48;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    memset(v44, 0, sizeof(v44));
    unsigned __int8 v45 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v13, (uint64_t)&v36))
    {
      unsigned __int8 v9 = v23;
      uint64_t v10 = v23 - 1;
      uint64_t v11 = *(NSObject **)(*((void *)&v14 + v10) + 32 * *((unsigned __int8 *)&v22 + v10) + 8);
      if (v11)
      {
        dispatch_release(v11);
        unsigned __int8 v9 = v23;
        uint64_t v10 = v23 - 1;
      }
      long long v12 = *(const void **)(*((void *)&v14 + v10) + 32 * *((unsigned __int8 *)&v22 + v10) + 16);
      if (v12)
      {
        _Block_release(v12);
        unsigned __int8 v9 = v23;
      }
      *(_OWORD *)&v34[72] = v18;
      *(_OWORD *)&v34[88] = v19;
      *(_OWORD *)&v34[104] = v20;
      *(_OWORD *)&v34[120] = v21;
      *(_OWORD *)&v34[8] = v14;
      *(_OWORD *)&v34[24] = v15;
      *(_OWORD *)&v34[40] = v16;
      *(_OWORD *)&v34[56] = v17;
      *(_OWORD *)&v34[136] = v22;
      *(void *)uint64_t v34 = v13;
      unsigned __int8 v35 = v9;
      *(void *)&double result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::erase(v2 + 48, (uint64_t)v34, (uint64_t)&v36).n128_u64[0];
    }
  }
  return result;
}

dyld4::Atlas::ProcessSnapshot *dyld4::Atlas::ProcessSnapshot::ProcessSnapshot(dyld4::Atlas::ProcessSnapshot *this, lsl::Allocator *a2, dyld4::FileManager *a3, char a4)
{
  *(void *)this = a2;
  *((void *)this + 1) = a3;
  uint64_t v6 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(this);
  *((void *)this + 2) = 0;
  *((void *)this + 3) = v6;
  *((void *)this + 5) = 0;
  *((unsigned char *)this + 48) = 0;
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  char v7 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v6);
  uint64_t v8 = lsl::Allocator::defaultAllocator(v7);
  unsigned __int8 v9 = lsl::Allocator::aligned_alloc((lsl::Lock **)v7, 8uLL, 0x30uLL);
  *unsigned __int8 v9 = v8;
  *(_OWORD *)(v9 + 1) = 0u;
  *(_OWORD *)(v9 + 3) = 0u;
  void v9[5] = v8;
  lsl::SharedPtr<dyld4::Atlas::Mapper>::SharedPtr((void *)this + 9, (lsl::Allocator::AllocationMetadata *)v9);
  *((void *)this + 10) = 0;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((unsigned char *)this + 104) = a4;
  *((unsigned char *)this + 105) = 1;
  return this;
}

long long *dyld4::Atlas::ProcessSnapshot::ProcessSnapshot(long long *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  *(void *)a1 = a2;
  *((void *)a1 + 1) = a3;
  uint64_t v10 = (lsl::Allocator *)lsl::Allocator::defaultAllocator((lsl::Allocator *)a1);
  *((void *)a1 + 2) = 0;
  uint64_t v11 = (uint64_t *)(a1 + 1);
  *((void *)a1 + 3) = v10;
  *((void *)a1 + 5) = 0;
  *((unsigned char *)a1 + 48) = 0;
  *((void *)a1 + 7) = 0;
  long long v12 = (lsl::Allocator ***)a1 + 7;
  *((void *)a1 + 8) = 0;
  uint64_t v13 = (lsl::Allocator ***)(a1 + 4);
  long long v14 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v10);
  uint64_t v15 = lsl::Allocator::defaultAllocator(v14);
  long long v16 = lsl::Allocator::aligned_alloc((lsl::Lock **)v14, 8uLL, 0x30uLL);
  *long long v16 = v15;
  *(_OWORD *)(v16 + 1) = 0u;
  *(_OWORD *)(v16 + 3) = 0u;
  v16[5] = v15;
  lsl::SharedPtr<dyld4::Atlas::Mapper>::SharedPtr((void *)a1 + 9, (lsl::Allocator::AllocationMetadata *)v16);
  *((void *)a1 + 10) = 0;
  *((void *)a1 + 12) = 0;
  *((void *)a1 + 11) = 0;
  *((unsigned char *)a1 + 104) = a4;
  *((unsigned char *)a1 + 105) = 1;
  unsigned __int8 v23 = a1;
  long long v24 = *a1;
  long long v25 = a1 + 1;
  long long v26 = a1 + 4;
  uint64_t v27 = (uint64_t)a1 + 56;
  uint64_t v28 = v24;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  uint64_t v29 = 0;
  uint64_t v32 = v24;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  uint64_t v33 = 0;
  uint64_t v36 = v24;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v37 = 0;
  uint64_t v40 = v24;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  uint64_t v43 = 0;
  int v44 = -1491447450;
  uint64_t v46 = 0;
  uint64_t v45 = 0;
  uint64_t v47 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  long long v50 = a1 + 5;
  uint64_t v51 = (uint64_t)a1 + 88;
  long long v52 = a1 + 6;
  if ((dyld4::Atlas::ProcessSnapshot::Serializer::deserialize((uint64_t)&v23, a5, a6) & 1) == 0)
  {
    if (*v11)
    {
      lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::deallocate(*v11, *((lsl::Lock ***)a1 + 3));
      *((void *)a1 + 2) = 0;
    }
    *((void *)a1 + 5) = 0;
    *((unsigned char *)a1 + 48) = 0;
    long long v22 = 0;
    if (&v22 != v12)
    {
      long long v18 = *v12;
      *long long v12 = 0;
      long long v22 = v18;
    }
    lsl::UniquePtr<dyld4::Atlas::Bitmap>::~UniquePtr(&v22, v17);
    long long v22 = 0;
    if (&v22 != v13)
    {
      long long v20 = *v13;
      *uint64_t v13 = 0;
      long long v22 = v20;
    }
    lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr((lsl::Allocator **)&v22, v19);
    *((unsigned char *)a1 + 105) = 0;
    *((void *)a1 + 11) = 0;
    *((void *)a1 + 12) = 0;
    *((void *)a1 + 10) = 0;
  }
  if (v41) {
    lsl::Vector<unsigned int>::resize((uint64_t)&v40, 0);
  }
  if (v37) {
    lsl::Vector<char>::resize((uint64_t)&v36, 0);
  }
  if (v33) {
    lsl::Vector<char const*>::resize((uint64_t)&v32, 0);
  }
  if (v29) {
    lsl::Vector<lsl::UUID>::resize((uint64_t)&v28, 0);
  }
  return a1;
}

uint64_t dyld4::Atlas::ProcessSnapshot::Serializer::deserialize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v72 = *MEMORY[0x1E4F14BF8];
  unsigned int v4 = *(_DWORD *)a2;
  *(_DWORD *)(a1 + 176) = *(_DWORD *)a2;
  unsigned int v5 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a1 + 180) = v5;
  *(void *)(a1 + 184) = *(void *)(a2 + 8);
  *(_DWORD *)(a1 + 192) = *(_DWORD *)(a2 + 16);
  *(_DWORD *)(a1 + 208) = *(_DWORD *)(a2 + 20);
  *(void *)(a1 + 200) = *(void *)(a2 + 24);
  int v6 = *(_DWORD *)(a2 + 32);
  uint64_t v7 = a3 - 36;
  uint64_t v8 = a2 + 36;
  long long v54 = (char *)(a2 + 36);
  uint64_t v55 = a3 - 36;
  *(_DWORD *)(a1 + 212) = v6;
  if (__PAIR64__(v5, v4) != 2803519846) {
    return v3;
  }
  uint64_t v9 = a2;
  lsl::CRC32c::CRC32c((uint64_t)v53);
  lsl::CRC32c::operator()(v53, v9, 32);
  lsl::CRC32c::operator()(v53, 0);
  lsl::CRC32c::operator()(v53, v8, v7);
  LODWORD(v9) = *(_DWORD *)(a1 + 212);
  uint64_t v3 = 0;
  if (v9 != lsl::CRC32c::operator unsigned int((uint64_t)v53)) {
    return v3;
  }
  *(void *)(a1 + 216) = lsl::readPVLEUInt64((unsigned __int8 **)&v54);
  **(void **)(a1 + 224) = lsl::readPVLEUInt64((unsigned __int8 **)&v54);
  **(void **)(a1 + 232) = lsl::readPVLEUInt64((unsigned __int8 **)&v54);
  **(void **)(a1 + 240) = lsl::readPVLEUInt64((unsigned __int8 **)&v54);
  uint64_t PVLEUInt64 = lsl::readPVLEUInt64((unsigned __int8 **)&v54);
  uint64_t v12 = PVLEUInt64;
  if (PVLEUInt64)
  {
    uint64_t v13 = 0;
    uint64_t v14 = PVLEUInt64;
    do
    {
      v57[0] = *(_OWORD *)&v54[v13];
      lsl::Vector<lsl::UUID>::reserve(a1 + 48, *(void *)(a1 + 64) + 1);
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v16 = *(void *)(a1 + 64);
      *(void *)(a1 + 64) = v16 + 1;
      *(_OWORD *)(v15 + 16 * v16) = v57[0];
      v13 += 16;
      --v14;
    }
    while (v14);
  }
  v54 += 16 * v12;
  v55 -= 16 * v12;
  unint64_t v17 = lsl::readPVLEUInt64((unsigned __int8 **)&v54);
  lsl::Vector<char>::reserve(a1 + 112, v17);
  std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<unsigned char *,unsigned char *,std::back_insert_iterator<lsl::Vector<char>>>((uint64_t)v57, v54, &v54[v17], a1 + 112);
  v54 += v17;
  v55 -= v17;
  if (*(unsigned char *)(a1 + 216))
  {
    *(void *)&v67[0] = 0;
    v56[0] = 0uLL;
    memset(v57, 0, sizeof(v57));
    uint64_t v58 = 0x1FFFFFFFFLL;
    __int16 v59 = 0;
    char v60 = 1;
    uint64_t MappedFileInfo = dyld4::Atlas::ProcessSnapshot::Serializer::readMappedFileInfo(a1, (unsigned __int8 **)&v54, (uint64_t *)v67, v56, (dyld4::FileRecord *)v57);
    if (MappedFileInfo)
    {
      char v30 = 14;
      if ((*(void *)(a1 + 216) & 4) == 0) {
        char v30 = 12;
      }
      uint64_t v31 = (dyld4::FileRecord *)(*(void *)&v67[0] << v30);
      *(void *)&v67[0] <<= v30;
      if (*(unsigned char *)(*(void *)a1 + 104))
      {
        uint64_t v32 = *(lsl::Allocator **)(*(void *)a1 + 72);
        if (v32) {
          atomic_fetch_add_explicit((atomic_uint *volatile)v32, 1u, memory_order_relaxed);
        }
      }
      else
      {
        uint64_t v34 = (dyld4::Atlas::Mapper *)lsl::Allocator::defaultAllocator((lsl::Allocator *)MappedFileInfo);
        dyld4::Atlas::Mapper::mapperForSharedCache(v34, (lsl::Allocator *)v57, v31, v35);
        uint64_t v32 = v52;
      }
      *(void *)&long long v71 = v32;
      if (v32)
      {
        if (*((void *)v32 + 1))
        {
          uint64_t v36 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v32);
          uint64_t v37 = *(void *)(a1 + 8);
          uint64_t v51 = (lsl::Allocator *)(*(void *)(a1 + 216) & 2);
          lsl::Allocator::makeUnique<dyld4::Atlas::SharedCache,lsl::Allocator&,dyld4::FileRecord,lsl::SharedPtr<dyld4::Atlas::Mapper> &,unsigned long long &,unsigned long long>(v36, v37, (dyld4::FileRecord *)v57, (atomic_uint **)&v71, (char **)v67, &v51, (uint64_t *)&v52);
          uint64_t v39 = *(lsl::Allocator ***)(a1 + 32);
          if (&v52 != v39)
          {
            uint64_t v40 = *v39;
            *uint64_t v39 = v52;
            long long v52 = v40;
          }
          uint64_t v41 = lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr(&v52, v38);
          uint64_t v42 = (lsl::Allocator *)lsl::Allocator::defaultAllocator((lsl::Allocator *)v41);
          uint64_t v43 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v42);
          int v44 = lsl::Allocator::aligned_alloc((lsl::Lock **)v42, 8uLL, 0x10uLL);
          uint64_t v45 = (lsl::Allocator *)dyld4::Atlas::Bitmap::Bitmap((uint64_t)v44, v43, (uint64_t)&v54);
          long long v52 = v45;
          uint64_t v47 = *(lsl::Allocator ***)(a1 + 40);
          if (&v52 != v47)
          {
            uint64_t v48 = *v47;
            dyld4::Atlas::Mapper *v47 = v45;
            long long v52 = v48;
          }
          lsl::UniquePtr<dyld4::Atlas::Bitmap>::~UniquePtr((lsl::Allocator ***)&v52, v46);
          if ((void)v71) {
            lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount((lsl::Allocator *)v71, v49);
          }
          dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v57);
          goto LABEL_7;
        }
        lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v32, v29);
      }
    }
    uint64_t v33 = (dyld4::FileRecord *)v57;
LABEL_43:
    dyld4::FileRecord::~FileRecord(v33);
    return 0;
  }
LABEL_7:
  uint64_t v18 = lsl::readPVLEUInt64((unsigned __int8 **)&v54);
  uint64_t v3 = 1;
  if (v18)
  {
    uint64_t v19 = v18;
    long long v20 = 0;
    while (1)
    {
      long long v52 = 0;
      long long v71 = 0uLL;
      memset(v67, 0, sizeof(v67));
      uint64_t v68 = 0x1FFFFFFFFLL;
      __int16 v69 = 0;
      char v70 = 1;
      if (!dyld4::Atlas::ProcessSnapshot::Serializer::readMappedFileInfo(a1, (unsigned __int8 **)&v54, (uint64_t *)&v52, &v71, (dyld4::FileRecord *)v67))break; {
      char v21 = 14;
      }
      if ((*(void *)(a1 + 216) & 4) == 0) {
        char v21 = 12;
      }
      long long v20 = (lsl::Allocator *)((char *)v20 + ((void)v52 << v21));
      long long v52 = v20;
      if (*(unsigned char *)(*(void *)a1 + 104))
      {
        long long v22 = *(atomic_uint **)(*(void *)a1 + 72);
        if (v22) {
          atomic_fetch_add_explicit(v22, 1u, memory_order_relaxed);
        }
      }
      else
      {
        long long v22 = 0;
      }
      *(void *)&v57[0] = *(void *)(a1 + 8);
      unsigned __int8 v23 = (lsl::Allocator *)dyld4::FileRecord::FileRecord((uint64_t)v57 + 8, (dyld4::FileRecord *)v67);
      int v61 = (lsl::Allocator *)v22;
      if (v22) {
        atomic_fetch_add_explicit(v22, 1u, memory_order_relaxed);
      }
      long long v62 = v71;
      memset(v63, 0, 25);
      v63[32] = 0;
      v63[40] = 0;
      uint64_t v64 = v20;
      uint64_t v65 = 0;
      v66[0] = 0;
      *(_DWORD *)((char *)v66 + 7) = 0;
      uint64_t v24 = *(void *)(a1 + 24);
      long long v25 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v23);
      lsl::Allocator::makeUnique<dyld4::Atlas::Image,dyld4::Atlas::Image>(v25, (dyld4::Atlas::Image *)v57, &v51);
      lsl::OrderedSet<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>>::insert(v24, (uint64_t *)&v51, (uint64_t)v56);
      lsl::UniquePtr<dyld4::Atlas::Image>::~UniquePtr(&v51);
      dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v63);
      if (v61) {
        lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v61, v26);
      }
      dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)((char *)v57 + 8));
      if (v22) {
        lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount((lsl::Allocator *)v22, v27);
      }
      dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v67);
      if (!--v19) {
        return 1;
      }
    }
    uint64_t v33 = (dyld4::FileRecord *)v67;
    goto LABEL_43;
  }
  return v3;
}

void *dyld4::Atlas::ProcessSnapshot::forEachImageNotIn(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v61 = *MEMORY[0x1E4F14BF8];
  uint64_t v36 = a3;
  unsigned int v4 = (uint64_t *)(a2 + 16);
  uint64_t v34 = a2 + 16;
  long long v54 = (uint64_t *)(a2 + 16);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  memset(v59, 0, 27);
  unsigned int v5 = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++(&v54);
  int v6 = *v5;
  v50[0] = *(_OWORD *)(v5 + 1);
  long long v7 = *(_OWORD *)(v5 + 9);
  long long v8 = *(_OWORD *)(v5 + 7);
  long long v9 = *(_OWORD *)(v5 + 5);
  v50[1] = *(_OWORD *)(v5 + 3);
  v50[2] = v9;
  v50[3] = v8;
  v50[4] = v7;
  uint64_t v10 = v5[11];
  __int16 v52 = *((_WORD *)v5 + 48);
  unsigned __int8 v11 = *((unsigned char *)v5 + 98);
  uint64_t v51 = v10;
  uint64_t v49 = v6;
  unsigned __int8 v53 = v11;
  *(_OWORD *)&v46[2] = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  memset(v59, 0, 27);
  long long v54 = v4;
  if (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>((uint64_t)&v49, (uint64_t)&v54))unint64_t v12 = *(void *)(*(void *)(*((void *)v50 + v53 - 1) + 8 * *((unsigned __int8 *)&v51 + v53 - 1)) + 160); {
  else
  }
    unint64_t v12 = -1;
  long long v54 = a1 + 2;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  memset(v59, 0, 27);
  uint64_t v13 = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++(&v54);
  uint64_t v14 = *v13;
  v45[0] = *(_OWORD *)(v13 + 1);
  long long v15 = *(_OWORD *)(v13 + 9);
  long long v16 = *(_OWORD *)(v13 + 7);
  long long v17 = *(_OWORD *)(v13 + 5);
  v45[1] = *(_OWORD *)(v13 + 3);
  v45[2] = v17;
  v45[3] = v16;
  *(_OWORD *)uint64_t v46 = v15;
  uint64_t v18 = v13[11];
  __int16 v47 = *((_WORD *)v13 + 48);
  unsigned __int8 v19 = *((unsigned char *)v13 + 98);
  *(void *)&v46[16] = v18;
  int v44 = v14;
  unsigned __int8 v48 = v19;
  *(_OWORD *)&v42[1] = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  memset(v59, 0, 27);
  long long v54 = a1 + 2;
  uint64_t v20 = v34;
  while (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>((uint64_t)&v44, (uint64_t)&v54))
  {
    uint64_t v21 = v48 - 1;
    uint64_t v22 = *((void *)v45 + v21);
    uint64_t v23 = v46[v21 + 16];
    uint64_t v24 = (void *)a1[8];
    uint64_t v25 = *(void *)(v22 + 8 * v23);
    if (v24 && v24[20] <= *(void *)(v25 + 160))
    {
      uint64_t v26 = a2;
      if (*(void *)(v24[16] + 144))
      {
        unint64_t v27 = 0;
        do
        {
          int v28 = 1 << (v27 & 7);
          if ((*(unsigned char *)(*(void *)(a1[7] + 8) + (v27 >> 3)) & v28) != 0
            && (!*(void *)(v26 + 64)
             || (*(unsigned char *)(*(void *)(*(void *)(v26 + 56) + 8) + (v27 >> 3)) & v28) == 0))
          {
            uint64_t v37 = MEMORY[0x1E4F14BE8];
            *(void *)&long long v38 = 0x40000000;
            *((void *)&v38 + 1) = ___ZZN5dyld45Atlas15ProcessSnapshot17forEachImageNotInERKS1_U13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke;
            *(void *)&long long v39 = &__block_descriptor_tmp_75_0;
            *((void *)&v39 + 1) = &v36;
            dyld4::Atlas::SharedCache::withImageForIndex(v24, v27, (uint64_t)&v37);
            uint64_t v26 = a2;
            uint64_t v24 = (void *)a1[8];
          }
          ++v27;
        }
        while (*(void *)(v24[16] + 144) > v27);
      }
      uint64_t v25 = *(void *)(v22 + 8 * v23);
      uint64_t v20 = v34;
    }
    while (1)
    {
      unint64_t v29 = *(void *)(v25 + 160);
      if (v12 >= v29) {
        break;
      }
      long long v60 = 0u;
      uint64_t v37 = v20;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      memset(v42, 0, sizeof(v42));
      char v43 = 0;
      if (!lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>((uint64_t)&v49, (uint64_t)&v37))
      {
        unint64_t v29 = *(void *)(*(void *)(v22 + 8 * v23) + 160);
        unint64_t v12 = -1;
        break;
      }
      unint64_t v12 = *(void *)(*(void *)(*((void *)v50 + v53 - 1) + 8 * *((unsigned __int8 *)&v51 + v53 - 1)) + 160);
      lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++(&v49);
      uint64_t v25 = *(void *)(v22 + 8 * v23);
    }
    if (v12 != v29) {
      (*(void (**)(void))(v36 + 16))();
    }
    lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++(&v44);
  }
  double result = (void *)a1[8];
  if (result)
  {
    uint64_t v31 = a2;
    if (*(void *)(result[16] + 144))
    {
      unint64_t v32 = 0;
      do
      {
        int v33 = 1 << (v32 & 7);
        if ((*(unsigned char *)(*(void *)(a1[7] + 8) + (v32 >> 3)) & v33) != 0
          && (!*(void *)(v31 + 64)
           || (*(unsigned char *)(*(void *)(*(void *)(v31 + 56) + 8) + (v32 >> 3)) & v33) == 0))
        {
          long long v54 = (uint64_t *)MEMORY[0x1E4F14BE8];
          *(void *)&long long v55 = 0x40000000;
          *((void *)&v55 + 1) = ___ZZN5dyld45Atlas15ProcessSnapshot17forEachImageNotInERKS1_U13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke;
          *(void *)&long long v56 = &__block_descriptor_tmp_75_0;
          *((void *)&v56 + 1) = &v36;
          dyld4::Atlas::SharedCache::withImageForIndex(result, v32, (uint64_t)&v54);
          uint64_t v31 = a2;
          double result = (void *)a1[8];
        }
        ++v32;
      }
      while (*(void *)(result[16] + 144) > v32);
    }
  }
  return result;
}

uint64_t dyld4::Atlas::ProcessSnapshot::sharedCache(dyld4::Atlas::ProcessSnapshot *this)
{
  return (uint64_t)this + 64;
}

lsl::Allocator **dyld4::Atlas::ProcessSnapshot::addImage(lsl::Allocator *a1, dyld4::Atlas::Image *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F14BF8];
  uint64_t v3 = (uint64_t)a1 + 16;
  unsigned int v4 = (lsl::Lock **)lsl::Allocator::defaultAllocator(a1);
  lsl::Allocator::makeUnique<dyld4::Atlas::Image,dyld4::Atlas::Image>(v4, a2, &v6);
  lsl::OrderedSet<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>>::insert(v3, (uint64_t *)&v6, (uint64_t)v7);
  return lsl::UniquePtr<dyld4::Atlas::Image>::~UniquePtr(&v6);
}

double lsl::OrderedSet<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>>::insert@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v20 = *MEMORY[0x1E4F14BF8];
  lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::const_iterator((uint64_t)v19, a1, (uint64_t)a2);
  lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::insert_internal(a1, (uint64_t)v19, a2, (uint64_t)&v9);
  uint64_t v6 = v9;
  *(_OWORD *)(a3 + 24) = v11;
  *(_OWORD *)(a3 + 40) = v12;
  *(_OWORD *)(a3 + 56) = v13;
  *(_OWORD *)(a3 + 72) = v14;
  double result = *(double *)&v10;
  *(_OWORD *)(a3 + 8) = v10;
  *(void *)(a3 + 88) = v15;
  *(_WORD *)(a3 + 96) = v16;
  char v8 = v17;
  *(void *)a3 = v6;
  *(unsigned char *)(a3 + 98) = v8;
  *(unsigned char *)(a3 + 104) = v18;
  return result;
}

void lsl::Allocator::makeUnique<dyld4::Atlas::Image,dyld4::Atlas::Image>(lsl::Lock **a1@<X0>, dyld4::Atlas::Image *a2@<X1>, void *a3@<X8>)
{
  unsigned int v5 = lsl::Allocator::aligned_alloc(a1, 8uLL, 0xC0uLL);
  void *v5 = *(void *)a2;
  *(_OWORD *)(v5 + 7) = 0u;
  *(_OWORD *)(v5 + 5) = 0u;
  *(_OWORD *)(v5 + 3) = 0u;
  *(_OWORD *)(v5 + 1) = 0u;
  v5[9] = 0x1FFFFFFFFLL;
  *((_WORD *)v5 + 40) = 0;
  *((unsigned char *)v5 + 82) = 1;
  *((unsigned char *)v5 + 144) = 0;
  *((unsigned char *)v5 + 152) = 0;
  *((unsigned char *)v5 + 136) = 0;
  *(_OWORD *)(v5 + 15) = 0u;
  *(_OWORD *)(v5 + 13) = 0u;
  *(_OWORD *)(v5 + 11) = 0u;
  *(_DWORD *)((char *)v5 + 183) = 0;
  v5[21] = 0;
  v5[22] = 0;
  v5[20] = 0;
  dyld4::Atlas::Image::swap((dyld4::Atlas::Image *)v5, a2);
  *a3 = v5;
}

uint64_t dyld4::Atlas::ProcessSnapshot::Serializer::readMappedFileInfo(uint64_t a1, unsigned __int8 **a2, uint64_t *a3, _OWORD *a4, dyld4::FileRecord *a5)
{
  uint64_t v17 = *MEMORY[0x1E4F14BF8];
  char PVLEUInt64 = lsl::readPVLEUInt64(a2);
  *a3 = lsl::readPVLEUInt64(a2);
  if ((PVLEUInt64 & 4) != 0)
  {
    *a4 = *(_OWORD *)*a2;
    uint64_t v11 = (uint64_t)(a2[1] - 16);
    *a2 += 16;
    a2[1] = (unsigned __int8 *)v11;
  }
  if (PVLEUInt64)
  {
    unint64_t v12 = lsl::readPVLEUInt64(a2);
    uint64_t v13 = lsl::readPVLEUInt64(a2);
    if (v12 >= *(void *)(a1 + 64)) {
      return 0;
    }
    dyld4::FileManager::fileRecordForVolumeUUIDAndObjID(*(dyld4::FileManager **)(a1 + 16), (const UUID *)(*(void *)(a1 + 56) + 16 * v12), v13, (uint64_t)v16);
    dyld4::FileRecord::operator=(a5, (dyld4::FileRecord *)v16);
    dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v16);
  }
  if ((PVLEUInt64 & 2) == 0) {
    return 1;
  }
  unint64_t v14 = lsl::readPVLEUInt64(a2);
  if (v14 < *(void *)(a1 + 128))
  {
    dyld4::FileManager::fileRecordForPath(*(dyld4::FileManager **)(a1 + 16), *(lsl::Lock ***)(a1 + 8), (const char *)(*(void *)(a1 + 120) + v14), (uint64_t)v16);
    dyld4::FileRecord::operator=(a5, (dyld4::FileRecord *)v16);
    dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v16);
    return 1;
  }
  return 0;
}

void lsl::Vector<char>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }
    else
    {
      unint64_t v2 = 16;
    }
    lsl::Vector<char>::reserveExact(a1, v2);
  }
}

uint64_t lsl::Allocator::makeUnique<dyld4::Atlas::SharedCache,lsl::Allocator&,dyld4::FileRecord,lsl::SharedPtr<dyld4::Atlas::Mapper> &,unsigned long long &,unsigned long long>@<X0>(lsl::Lock **a1@<X0>, uint64_t a2@<X1>, dyld4::FileRecord *a3@<X2>, atomic_uint **a4@<X3>, char **a5@<X4>, void *a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v13 = lsl::Allocator::aligned_alloc(a1, 8uLL, 0xB0uLL);
  uint64_t result = dyld4::Atlas::SharedCache::SharedCache((uint64_t)v13, a2, a3, a4, *a5, *a6 != 0);
  *a7 = result;
  return result;
}

uint64_t lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 80);
  unsigned int v3 = *(unsigned __int8 *)(a1 + 80);
  if (v2 >= v3) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 80);
  }
  else {
    uint64_t v4 = *(unsigned __int8 *)(a2 + 80);
  }
  if (v4)
  {
    unsigned int v5 = (unsigned __int8 *)(a1 + 72);
    uint64_t v6 = (unsigned __int8 *)(a2 + 72);
    while (1)
    {
      unsigned int v8 = *v5++;
      unsigned int v7 = v8;
      unsigned int v9 = *v6++;
      BOOL v10 = v7 >= v9;
      if (v7 != v9) {
        break;
      }
      if (!--v4) {
        goto LABEL_8;
      }
    }
    if (v10) {
      return 1;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
LABEL_8:
    BOOL v11 = v3 == v2;
    if (v3 < v2) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v11) {
      return 0;
    }
    else {
      return v12;
    }
  }
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::deallocate(uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 248) & 0x80000000) == 0)
  {
    uint64_t v4 = (uint64_t *)(a1 + 80);
    uint64_t v5 = 8 * *(unsigned __int8 *)(a1 + 248) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::deallocate(v6, a2);
      v5 -= 8;
    }
    while (v5);
  }

  lsl::Allocator::free(a2, (void *)a1);
}

uint64_t *std::optional<unsigned long long>::swap[abi:nn180100](uint64_t *result, uint64_t *a2)
{
  if ((*((unsigned char *)result + 8) != 0) != (*((unsigned char *)a2 + 8) != 0))
  {
    if (*((unsigned char *)result + 8))
    {
      *a2 = *result;
      *((unsigned char *)a2 + 8) = 1;
      if (*((unsigned char *)result + 8)) {
        *((unsigned char *)result + 8) = 0;
      }
    }
    else
    {
      *uint64_t result = *a2;
      *((unsigned char *)result + 8) = 1;
      if (*((unsigned char *)a2 + 8)) {
        *((unsigned char *)a2 + 8) = 0;
      }
    }
  }
  else if (*((unsigned char *)result + 8))
  {
    uint64_t v2 = *result;
    *uint64_t result = *a2;
    *a2 = v2;
  }
  return result;
}

uint64_t lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 98);
  unsigned int v3 = *(unsigned __int8 *)(a1 + 98);
  if (v2 >= v3) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 98);
  }
  else {
    uint64_t v4 = *(unsigned __int8 *)(a2 + 98);
  }
  if (v4)
  {
    uint64_t v5 = (unsigned __int8 *)(a1 + 88);
    uint64_t v6 = (unsigned __int8 *)(a2 + 88);
    while (1)
    {
      unsigned int v8 = *v5++;
      unsigned int v7 = v8;
      unsigned int v9 = *v6++;
      BOOL v10 = v7 >= v9;
      if (v7 != v9) {
        break;
      }
      if (!--v4) {
        goto LABEL_8;
      }
    }
    if (v10) {
      return 1;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
LABEL_8:
    BOOL v11 = v3 == v2;
    if (v3 < v2) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v11) {
      return 0;
    }
    else {
      return v12;
    }
  }
}

void lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::deallocate(uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 248) & 0x80000000) == 0)
  {
    uint64_t v4 = (uint64_t *)(a1 + 120);
    uint64_t v5 = 8 * *(unsigned __int8 *)(a1 + 248) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::deallocate(v6, a2);
      v5 -= 8;
    }
    while (v5);
  }

  lsl::Allocator::free(a2, (void *)a1);
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::deallocate(uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 240) & 0x80000000) == 0)
  {
    uint64_t v4 = (uint64_t *)(a1 + 168);
    uint64_t v5 = 8 * *(unsigned __int8 *)(a1 + 240) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::deallocate(v6, a2);
      v5 -= 8;
    }
    while (v5);
  }

  lsl::Allocator::free(a2, (void *)a1);
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::deallocate(uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 248) & 0x80000000) == 0)
  {
    uint64_t v4 = (uint64_t *)(a1 + 192);
    uint64_t v5 = 8 * *(unsigned __int8 *)(a1 + 248) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::deallocate(v6, a2);
      v5 -= 8;
    }
    while (v5);
  }

  lsl::Allocator::free(a2, (void *)a1);
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 143);
  unsigned int v3 = *(unsigned __int8 *)(a1 + 143);
  if (v2 >= v3) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 143);
  }
  else {
    uint64_t v4 = *(unsigned __int8 *)(a2 + 143);
  }
  if (v4)
  {
    uint64_t v5 = (unsigned __int8 *)(a1 + 128);
    uint64_t v6 = (unsigned __int8 *)(a2 + 128);
    while (1)
    {
      unsigned int v8 = *v5++;
      unsigned int v7 = v8;
      unsigned int v9 = *v6++;
      BOOL v10 = v7 >= v9;
      if (v7 != v9) {
        break;
      }
      if (!--v4) {
        goto LABEL_8;
      }
    }
    if (v10) {
      return 1;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
LABEL_8:
    BOOL v11 = v3 == v2;
    if (v3 < v2) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v11) {
      return 0;
    }
    else {
      return v12;
    }
  }
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(unsigned __int8 *)(a2 + 152);
  unsigned int v3 = *(unsigned __int8 *)(a1 + 152);
  if (v2 >= v3) {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 152);
  }
  else {
    uint64_t v4 = *(unsigned __int8 *)(a2 + 152);
  }
  if (v4)
  {
    uint64_t v5 = (unsigned __int8 *)(a1 + 136);
    uint64_t v6 = (unsigned __int8 *)(a2 + 136);
    while (1)
    {
      unsigned int v8 = *v5++;
      unsigned int v7 = v8;
      unsigned int v9 = *v6++;
      BOOL v10 = v7 >= v9;
      if (v7 != v9) {
        break;
      }
      if (!--v4) {
        goto LABEL_8;
      }
    }
    if (v10) {
      return 1;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  else
  {
LABEL_8:
    BOOL v11 = v3 == v2;
    if (v3 < v2) {
      unsigned int v12 = -1;
    }
    else {
      unsigned int v12 = 1;
    }
    if (v11) {
      return 0;
    }
    else {
      return v12;
    }
  }
}

uint64_t ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__0clEPNS0_15ProcessSnapshotE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1E4F14BF8];
  uint64_t v3 = *(void *)(a1 + 32);
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = (uint64_t *)(v3 + 88);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  memset(v32, 0, sizeof(v32));
  uint64_t v24 = (uint64_t *)(v3 + 88);
  uint64_t v5 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v24);
  uint64_t v6 = *v5;
  long long v7 = *(_OWORD *)(v5 + 13);
  long long v8 = *(_OWORD *)(v5 + 11);
  unsigned int v9 = v5[15];
  BOOL v10 = v5[16];
  v20[4] = *(_OWORD *)(v5 + 9);
  v20[5] = v8;
  v20[6] = v7;
  uint64_t v21 = v9;
  long long v11 = *(_OWORD *)(v5 + 7);
  long long v12 = *(_OWORD *)(v5 + 5);
  long long v13 = *(_OWORD *)(v5 + 3);
  v20[0] = *(_OWORD *)(v5 + 1);
  v20[1] = v13;
  vm_address_t v20[2] = v12;
  void v20[3] = v11;
  *(void *)&v22[7] = *(uint64_t **)((char *)v5 + 135);
  *(void *)uint64_t v22 = v10;
  LOBYTE(v9) = *((unsigned char *)v5 + 143);
  unsigned __int8 v19 = v6;
  unsigned __int8 v23 = v9;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v24 = v4;
  memset(v32, 0, sizeof(v32));
  uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v19, (uint64_t)&v24);
  if ((_BYTE)result)
  {
    uint64_t v15 = MEMORY[0x1E4F14BE8];
    do
    {
      uint64_t v16 = *((void *)v20 + v23 - 1) + 24 * v22[v23 - 1];
      uint64_t v17 = *(NSObject **)(v16 + 8);
      v18[0] = v15;
      v18[1] = 0x40000000;
      v18[2] = ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__0clEPNS0_15ProcessSnapshotE_block_invoke_2;
      v18[3] = &__block_descriptor_tmp_68_0;
      v18[4] = v16;
      v18[5] = a2;
      dispatch_async_and_wait(v17, v18);
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v19);
      uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v19, (uint64_t)&v24);
    }
    while ((_BYTE)result);
  }
  return result;
}

uint64_t ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__0clEPNS0_15ProcessSnapshotE_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

uint64_t ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__1clEPNS0_15ProcessSnapshotE_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v41 = *MEMORY[0x1E4F14BF8];
  uint64_t v3 = *(void *)(a1 + 32);
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v4 = (uint64_t *)(v3 + 88);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  memset(v32, 0, sizeof(v32));
  uint64_t v24 = (uint64_t *)(v3 + 88);
  uint64_t v5 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v24);
  uint64_t v6 = *v5;
  long long v7 = *(_OWORD *)(v5 + 13);
  long long v8 = *(_OWORD *)(v5 + 11);
  unsigned int v9 = v5[15];
  BOOL v10 = v5[16];
  v20[4] = *(_OWORD *)(v5 + 9);
  v20[5] = v8;
  v20[6] = v7;
  uint64_t v21 = v9;
  long long v11 = *(_OWORD *)(v5 + 7);
  long long v12 = *(_OWORD *)(v5 + 5);
  long long v13 = *(_OWORD *)(v5 + 3);
  v20[0] = *(_OWORD *)(v5 + 1);
  v20[1] = v13;
  vm_address_t v20[2] = v12;
  void v20[3] = v11;
  *(void *)&v22[7] = *(uint64_t **)((char *)v5 + 135);
  *(void *)uint64_t v22 = v10;
  LOBYTE(v9) = *((unsigned char *)v5 + 143);
  unsigned __int8 v19 = v6;
  unsigned __int8 v23 = v9;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v24 = v4;
  memset(v32, 0, sizeof(v32));
  uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v19, (uint64_t)&v24);
  if ((_BYTE)result)
  {
    uint64_t v15 = MEMORY[0x1E4F14BE8];
    do
    {
      uint64_t v16 = *((void *)v20 + v23 - 1) + 24 * v22[v23 - 1];
      uint64_t v17 = *(NSObject **)(v16 + 8);
      v18[0] = v15;
      v18[1] = 0x40000000;
      v18[2] = ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__1clEPNS0_15ProcessSnapshotE_block_invoke_2;
      v18[3] = &__block_descriptor_tmp_70_0;
      v18[4] = v16;
      v18[5] = a2;
      dispatch_async_and_wait(v17, v18);
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v19);
      uint64_t result = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v19, (uint64_t)&v24);
    }
    while ((_BYTE)result);
  }
  return result;
}

uint64_t ___ZZN5dyld45Atlas7Process19handleNotificationsEvENK3__1clEPNS0_15ProcessSnapshotE_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

void lsl::Vector<unsigned int>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      unsigned int v2 = *(void **)(a1 + 8);
      uint64_t v3 = *(lsl::Lock ***)a1;
      lsl::Allocator::realloc(v3, v2, 4 * a2);
    }
    else
    {
      uint64_t v5 = (void *)(a1 + 8);
      uint64_t v4 = *(void **)(a1 + 8);
      if (v4) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v4);
      }
      void *v5 = 0;
      v5[1] = 0;
      v5[2] = 0;
    }
  }
  else
  {
    lsl::Vector<unsigned int>::reserve(a1, a2);
  }
}

void lsl::Vector<unsigned int>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }
    else
    {
      unint64_t v2 = 16;
    }
    lsl::Vector<unsigned int>::reserveExact(a1, v2);
  }
}

void lsl::Vector<unsigned int>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 4 * a2))
    {
LABEL_12:
      *(void *)(a1 + 24) = a2;
      return;
    }
    unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, 4 * a2);
    uint64_t v5 = v4;
    uint64_t v6 = *(void **)(a1 + 8);
    uint64_t v7 = *(void *)(a1 + 16);
    if (v7)
    {
      long long v8 = v4;
      unsigned int v9 = *(int **)(a1 + 8);
      do
      {
        int v10 = *v9++;
        *v8++ = v10;
        --v7;
      }
      while (v7);
    }
    else if (!v6)
    {
      unint64_t v11 = 0;
      goto LABEL_9;
    }
    lsl::Allocator::free(*(lsl::Lock ***)a1, v6);
    unint64_t v11 = *(void *)(a1 + 16);
LABEL_9:
    if (v11 >= a2) {
      unint64_t v11 = a2;
    }
    *(void *)(a1 + 8) = v5;
    *(void *)(a1 + 16) = v11;
    goto LABEL_12;
  }
}

void lsl::Vector<char>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      unint64_t v3 = *(void **)(a1 + 8);
      unint64_t v4 = *(lsl::Lock ***)a1;
      lsl::Allocator::realloc(v4, v3, a2);
    }
    else
    {
      uint64_t v6 = (void *)(a1 + 8);
      uint64_t v5 = *(void **)(a1 + 8);
      if (v5) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v5);
      }
      *uint64_t v6 = 0;
      v6[1] = 0;
      v6[2] = 0;
    }
  }
  else
  {
    lsl::Vector<char>::reserve(a1, a2);
  }
}

void lsl::Vector<char const*>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      unint64_t v2 = *(void **)(a1 + 8);
      unint64_t v3 = *(lsl::Lock ***)a1;
      lsl::Allocator::realloc(v3, v2, 8 * a2);
    }
    else
    {
      uint64_t v5 = (void *)(a1 + 8);
      unint64_t v4 = *(void **)(a1 + 8);
      if (v4) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v4);
      }
      void *v5 = 0;
      v5[1] = 0;
      v5[2] = 0;
    }
  }
  else
  {
    lsl::Vector<char const*>::reserve(a1, a2);
  }
}

void lsl::Vector<char const*>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }
    else
    {
      unint64_t v2 = 16;
    }
    lsl::Vector<char const*>::reserveExact(a1, v2);
  }
}

void lsl::Vector<char const*>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if ((lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 8 * a2) & 1) == 0)
    {
      unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, 8 * a2);
      uint64_t v5 = v4;
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        uint64_t v7 = 0;
        long long v8 = v4;
        do
          *v8++ = *(void *)(*(void *)(a1 + 8) + 8 * v7++);
        while (v6 != v7);
      }
      unsigned int v9 = *(void **)(a1 + 8);
      if (v9)
      {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v9);
        unint64_t v6 = *(void *)(a1 + 16);
      }
      if (v6 >= a2) {
        unint64_t v6 = a2;
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v6;
    }
    *(void *)(a1 + 24) = a2;
  }
}

void *___ZZN5dyld45Atlas15ProcessSnapshot12forEachImageEU13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 32) + 16))(*(void **)(a1 + 32));
}

void *___ZZN5dyld45Atlas15ProcessSnapshot17forEachImageNotInERKS1_U13block_pointerFvPNS0_5ImageEEENK3__0clEv_block_invoke(uint64_t a1)
{
  return (*(void *(**)(void *__return_ptr))(**(void **)(a1 + 32) + 16))(*(void **)(a1 + 32));
}

char *std::__copy_loop<std::_ClassicAlgPolicy>::operator()[abi:nn180100]<unsigned char *,unsigned char *,std::back_insert_iterator<lsl::Vector<char>>>(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      char v7 = *v5++;
      lsl::Vector<char>::reserve(a4, *(void *)(a4 + 16) + 1);
      uint64_t v8 = *(void *)(a4 + 8);
      uint64_t v9 = *(void *)(a4 + 16);
      *(void *)(a4 + 16) = v9 + 1;
      *(unsigned char *)(v8 + v9) = v7;
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t lsl::BTree<int,std::less<int>,false>::insert_internal@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v22 = *MEMORY[0x1E4F14BF8];
  if (*(void *)a1)
  {
    uint64_t v17 = a1;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    memset(v21, 0, sizeof(v21));
    uint64_t result = lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>(a2, (uint64_t)&v17);
    if ((_BYTE)result
      && (uint64_t v9 = *(unsigned __int8 *)(a2 + 80),
          *a3 >= *(_DWORD *)(*(void *)(a2 + 8 + 8 * (v9 - 1)) + 4 * *(unsigned __int8 *)(a2 + v9 - 1 + 72))))
    {
      char v13 = 0;
      *(void *)a4 = *(void *)a2;
      long long v15 = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a4 + 24) = v15;
      long long v16 = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = v16;
      *(void *)(a4 + 72) = *(void *)(a2 + 72);
      *(unsigned char *)(a4 + 80) = v9;
    }
    else
    {
      uint64_t v17 = a1;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      memset(v21, 0, sizeof(v21));
      if (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>(a2, (uint64_t)&v17)
        && *(unsigned __int8 *)(a2 + 80) == *(unsigned __int8 *)(a1 + 32))
      {
        lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
        uint64_t v10 = *(unsigned __int8 *)(a2 + 80) - 1;
        unsigned __int8 v11 = *(unsigned char *)(a2 + v10 + 72);
      }
      else
      {
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t **)a2);
        lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
        uint64_t v14 = *(unsigned __int8 *)(a2 + 80) + a2;
        unsigned __int8 v11 = *(unsigned char *)(v14 + 71) + 1;
        *(unsigned char *)(v14 + 71) = v11;
        uint64_t v10 = *(unsigned __int8 *)(a2 + 80) - 1;
      }
      uint64_t result = (uint64_t)lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert(*(char **)(a2 + 8 + 8 * v10), v11, a3);
      ++*(void *)(a1 + 24);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
      *(void *)(a4 + 72) = *(void *)(a2 + 72);
      *(unsigned char *)(a4 + 80) = *(unsigned char *)(a2 + 80);
      char v13 = 1;
    }
  }
  else
  {
    long long v12 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    *((unsigned char *)v12 + 248) = 0x80;
    *(_OWORD *)long long v12 = 0u;
    *((_OWORD *)v12 + 1) = 0u;
    *((_OWORD *)v12 + 2) = 0u;
    *((_OWORD *)v12 + 3) = 0u;
    *((_OWORD *)v12 + 4) = 0u;
    *((_OWORD *)v12 + 5) = 0u;
    *((_OWORD *)v12 + 6) = 0u;
    *((_OWORD *)v12 + 7) = 0u;
    *((_OWORD *)v12 + 8) = 0u;
    *((_OWORD *)v12 + 9) = 0u;
    *((_OWORD *)v12 + 10) = 0u;
    *((_OWORD *)v12 + 11) = 0u;
    *((_OWORD *)v12 + 12) = 0u;
    *((_OWORD *)v12 + 13) = 0u;
    *((_OWORD *)v12 + 14) = 0u;
    v12[30] = 0;
    *(void *)a1 = v12;
    char v13 = 1;
    *(unsigned char *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v12;
    *(unsigned char *)(a2 + 80) = 1;
    uint64_t result = (uint64_t)lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert((char *)v12, 0, a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(void *)(a4 + 72) = *(void *)(a2 + 72);
    *(unsigned char *)(a4 + 80) = *(unsigned char *)(a2 + 80);
  }
  *(unsigned char *)(a4 + 88) = v13;
  return result;
}

char *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert(char *result, unsigned int a2, _DWORD *a3)
{
  int v3 = result[248];
  int v4 = v3 & 0x7F;
  if (v3 >= 0) {
    int v5 = 20;
  }
  else {
    int v5 = 62;
  }
  if (v4 == v5) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  if (v5 == a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  char v7 = result;
  uint64_t v8 = &result[4 * a2];
  if (v4 != a2)
  {
    uint64_t result = (char *)memmove(&result[4 * a2 + 4], &result[4 * a2], 4 * (v3 & 0x7F) - 4 * a2);
    LOBYTE(v3) = v7[248];
  }
  v7[248] = v3 + 1;
  *(_DWORD *)uint64_t v8 = *a3;
  return result;
}

uint64_t **lsl::BTree<int,std::less<int>,false>::const_iterator::operator--(uint64_t **result)
{
  uint64_t v1 = *((unsigned __int8 *)result + 80);
  unint64_t v2 = *result;
  if (*((unsigned char *)result + 80))
  {
    if (v1 == *((unsigned __int8 *)v2 + 32))
    {
      int v3 = result + 9;
      uint64_t v4 = v1 - 1;
      int v5 = (char *)result + v1 + 71;
      char v6 = *v5;
      if (!*((unsigned char *)result + (v1 - 1) + 72))
      {
        if (!*v5)
        {
          do
          {
            LODWORD(v1) = v1 - 1;
            *((unsigned char *)result + 80) = v1;
            uint64_t v4 = v1 - 1;
            char v6 = *((unsigned char *)v3 + v4);
          }
          while (!v6);
        }
        int v5 = (char *)v3 + v4;
      }
    }
    else
    {
      uint64_t v14 = result + 1;
      long long v15 = result + 9;
      do
      {
        long long v16 = v14[v1 - 1];
        if ((char)v16[31] < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v17 = v16[*((unsigned __int8 *)v15 + v1 - 1) + 10];
        v14[v1] = (uint64_t *)v17;
        *((unsigned char *)v15 + v1) = *(unsigned char *)(v17 + 248) & 0x7F;
        LOBYTE(v1) = *((unsigned char *)result + 80) + 1;
        *((unsigned char *)result + 80) = v1;
      }
      while (*((unsigned __int8 *)v2 + 32) != v1);
      uint64_t v18 = (uint64_t)v15 + v1;
      char v19 = *(unsigned char *)(v18 - 1);
      int v5 = (char *)(v18 - 1);
      char v6 = v19;
    }
  }
  else
  {
    uint64_t v7 = *v2;
    *((unsigned char *)result + 80) = 0;
    if (*((unsigned char *)v2 + 32))
    {
      unsigned __int8 v8 = 0;
      uint64_t v9 = result + 1;
      do
      {
        v9[v8] = (uint64_t *)v7;
        *((unsigned char *)result + v8 + 72) = *(unsigned char *)(v7 + 248) & 0x7F;
        uint64_t v10 = *((unsigned __int8 *)result + 80);
        unsigned int v11 = *((unsigned __int8 *)v2 + 32);
        if (v10 + 1 != v11)
        {
          long long v12 = v9[v10];
          if ((char)v12[31] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          uint64_t v7 = v12[*((unsigned __int8 *)v12 + 248) + 10];
        }
        unsigned __int8 v8 = v10 + 1;
        *((unsigned char *)result + 80) = v8;
      }
      while (v11 > v8);
      uint64_t v13 = v8 - 1;
    }
    else
    {
      uint64_t v13 = -1;
    }
    int v5 = (char *)result + v13 + 72;
    char v6 = *v5;
  }
  char *v5 = v6 - 1;
  return result;
}

unsigned __int8 *lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion(unsigned __int8 *result)
{
  uint64_t v1 = result[80];
  if (v1 != *(unsigned __int8 *)(*(void *)result + 32)) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion();
  }
  unint64_t v2 = result;
  int v3 = result + 8;
  if (*(char *)(*(void *)&result[8 * v1] + 248) >= 0) {
    int v4 = 20;
  }
  else {
    int v4 = 62;
  }
  if ((*(unsigned char *)(*(void *)&result[8 * v1] + 248) & 0x7F) == v4)
  {
    if (!result[80]) {
      goto LABEL_15;
    }
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    do
    {
      if (*(char *)(v3[v5] + 248) >= 0) {
        int v7 = 20;
      }
      else {
        int v7 = 62;
      }
      if ((*(unsigned char *)(v3[v5] + 248) & 0x7F) != v7) {
        unsigned int v6 = v5;
      }
      ++v5;
    }
    while (v1 != v5);
    if (!v6)
    {
LABEL_15:
      if (*(char *)(*v3 + 248) >= 0) {
        int v8 = 20;
      }
      else {
        int v8 = 62;
      }
      if ((*(unsigned char *)(*v3 + 248) & 0x7F) == v8)
      {
        uint64_t result = (unsigned __int8 *)lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(*(void *)result + 8), 0x100uLL, 0x100uLL);
        uint64_t v9 = **(void **)v2;
        result[248] = 0;
        *(_OWORD *)uint64_t result = 0u;
        *((_OWORD *)result + 1) = 0u;
        *((_OWORD *)result + 2) = 0u;
        *((_OWORD *)result + 3) = 0u;
        *((_OWORD *)result + 4) = 0u;
        *((void *)result + 10) = v9;
        **(void **)unint64_t v2 = result;
        if (v2[80] && (uint64_t result = (unsigned __int8 *)memmove(v2 + 73, v2 + 72, v2[80]), v2[80]))
        {
          uint64_t result = (unsigned __int8 *)memmove(v3 + 1, v3, 8 * v2[80]);
          LOBYTE(v1) = v2[80] + 1;
        }
        else
        {
          LOBYTE(v1) = 1;
        }
        unsigned int v6 = 0;
        v2[72] = 0;
        uint64_t v10 = *(uint64_t **)v2;
        *((void *)v2 + 1) = **(void **)v2;
        ++*((unsigned char *)v10 + 32);
        v2[80] = v1;
      }
      else
      {
        unsigned int v6 = 0;
      }
    }
    if (v6 + 1 < v1)
    {
      unsigned int v11 = v2 + 72;
      uint64_t v12 = v6;
      do
      {
        int v13 = v12;
        uint64_t result = (unsigned __int8 *)lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild(v3[v12], v11[v12], *(lsl::Lock ***)(*(void *)v2 + 8));
        uint64_t v14 = v3[v12];
        if (*(char *)(v14 + 248) < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v15 = v11[v12];
        uint64_t v16 = *(void *)(v14 + 8 * v15 + 80);
        unsigned int v17 = v2[v12 + 73];
        if (v17 > (*(unsigned char *)(v16 + 248) & 0x7Fu))
        {
          unsigned __int8 v18 = v15 + 1;
          v11[v12] = v18;
          v2[v12 + 73] = v17 + (~*(unsigned char *)(v16 + 248) | 0x80);
          uint64_t v19 = v3[v12];
          if (*(char *)(v19 + 248) < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          *(void *)&v2[8 * v12 + 16] = *(void *)(v19 + 8 * v18 + 80);
        }
        ++v12;
      }
      while (v13 + 2 < v2[80]);
    }
  }
  return result;
}

char *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild(uint64_t a1, unsigned int a2, lsl::Lock **this)
{
  if (*(char *)(a1 + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 248);
  if (v3 >= 0x14) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v5 = a1 + 80;
  uint64_t v6 = a1 + 80 + 8 * a2;
  char v7 = *(unsigned char *)(*(void *)v6 + 248);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 20;
  }
  else {
    int v10 = 62;
  }
  if (v9 != v10) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v12 = a2;
  if (v8 >= 0) {
    uint64_t v13 = 10;
  }
  else {
    uint64_t v13 = 31;
  }
  uint64_t v14 = (_DWORD *)(a1 + 4 * a2);
  if (v3 != a2)
  {
    memmove((void *)(a1 + 4 * a2 + 4), (const void *)(a1 + 4 * a2), 4 * v3 - 4 * a2);
    a2 = *(unsigned __int8 *)(a1 + 248);
  }
  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v15 = v5 + 8 * a2;
  if (v15 != v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v15 - v6);
    LOBYTE(a2) = *(unsigned char *)(a1 + 248);
  }
  *(unsigned char *)(a1 + 248) = a2 + 1;
  _DWORD *v14 = *(_DWORD *)(*(void *)v6 + 4 * v13);
  uint64_t result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  unsigned int v17 = result;
  uint64_t v18 = *(void *)v6;
  char v19 = *(unsigned char *)(*(void *)v6 + 248);
  result[248] = v19 & 0x80;
  if (v19 < 0)
  {
    *((void *)result + 30) = 0;
    long long v20 = 0uLL;
    *((_OWORD *)result + 13) = 0u;
    *((_OWORD *)result + 14) = 0u;
    *((_OWORD *)result + 11) = 0u;
    *((_OWORD *)result + 12) = 0u;
    *((_OWORD *)result + 9) = 0u;
    *((_OWORD *)result + 10) = 0u;
    *((_OWORD *)result + 7) = 0u;
    *((_OWORD *)result + 8) = 0u;
    *((_OWORD *)result + 5) = 0u;
    *((_OWORD *)result + 6) = 0u;
  }
  else
  {
    long long v20 = 0uLL;
  }
  *((_OWORD *)result + 3) = v20;
  *((_OWORD *)result + 4) = v20;
  *((_OWORD *)result + 1) = v20;
  *((_OWORD *)result + 2) = v20;
  *(_OWORD *)uint64_t result = v20;
  if (*(char *)(a1 + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  unsigned __int8 v21 = v9 + ~(_BYTE)v13;
  *(void *)(v5 + 8 * v12 + 8) = result;
  if (v21)
  {
    uint64_t result = (char *)memmove(result, (const void *)(v18 + 4 * v13 + 4), 4 * v21);
    uint64_t v18 = *(void *)v6;
  }
  int v22 = *(char *)(v18 + 248);
  if ((v22 & 0x80000000) == 0)
  {
    if (v17[248] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    uint64_t result = (char *)memmove(v17 + 80, (const void *)(v18 + 8 * v13 + 88), 8 * v21 + 8);
    uint64_t v18 = *(void *)v6;
    LOBYTE(v22) = *(unsigned char *)(*(void *)v6 + 248);
  }
  *(unsigned char *)(v18 + 248) = v22 + ~v21;
  char v23 = v17[248] + v21;
  v17[248] = v23;
  if (v23 >= 0) {
    int v24 = 20;
  }
  else {
    int v24 = 62;
  }
  if ((v23 & 0x7F) == v24
    || ((char v25 = *(unsigned char *)(v18 + 248), v26 = v25, v27 = v25 & 0x7F, v26 >= 0) ? (v28 = 20) : (v28 = 62), v27 == v28))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  return result;
}

uint64_t lsl::BTree<int,std::less<int>,false>::const_iterator::const_iterator(uint64_t result, uint64_t *a2, _DWORD *a3)
{
  *(_OWORD *)(result + 8) = 0u;
  uint64_t v3 = result + 8;
  *(void *)uint64_t result = a2;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 65) = 0u;
  if (*((unsigned char *)a2 + 32))
  {
    unint64_t v4 = 0;
    uint64_t v5 = *a2;
    uint64_t v6 = result + 72;
    do
    {
      *(void *)(v3 + 8 * v4) = v5;
      unint64_t v7 = *(unsigned char *)(v5 + 248) & 0x7F;
      if ((*(unsigned char *)(v5 + 248) & 0x7F) != 0)
      {
        int v8 = (_DWORD *)v5;
        do
        {
          unint64_t v9 = v7 >> 1;
          int v10 = &v8[v7 >> 1];
          int v12 = *v10;
          unsigned int v11 = v10 + 1;
          v7 += ~(v7 >> 1);
          if (v12 < *a3) {
            int v8 = v11;
          }
          else {
            unint64_t v7 = v9;
          }
        }
        while (v7);
      }
      else
      {
        int v8 = (_DWORD *)(v5 + 4 * v7);
      }
      __int16 v13 = (_WORD)v8 - v5;
      unint64_t v14 = ((unint64_t)v8 - v5) >> 2;
      *(unsigned char *)(v6 + v4) = v14;
      uint64_t v15 = *(void *)(v3 + 8 * v4);
      if ((*(unsigned char *)(v15 + 248) & 0x7F) != v14 && *(_DWORD *)(v15 + (v13 & 0x3FC)) < *a3)
      {
        *(unsigned char *)(result + 80) = v4 + 1;
        return result;
      }
      unint64_t v16 = *((unsigned __int8 *)a2 + 32);
      if (v4 + 1 != v16)
      {
        if ((*(unsigned char *)(v15 + 248) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v5 = *(void *)(v15 + 8 * v14 + 80);
      }
      ++v4;
    }
    while (v4 < v16);
    for (*(unsigned char *)(result + 80) = v16; (_BYTE)v16; *(unsigned char *)(result + 80) = v16)
    {
      if (*(unsigned char *)(v6 + v16 - 1) != (*(unsigned char *)(*(void *)(result
                                                                                            + 8 * v16)
                                                                                + 248) & 0x7F))
        break;
      LOBYTE(v16) = v16 - 1;
    }
  }
  return result;
}

uint64_t **lsl::BTree<int,std::less<int>,false>::const_iterator::operator++(uint64_t **result)
{
  int v1 = *((unsigned __int8 *)result + 80);
  unint64_t v2 = (uint64_t **)*result;
  if (*((unsigned char *)result + 80))
  {
    int v3 = *((unsigned __int8 *)v2 + 32);
    unint64_t v4 = result + 9;
    ++*((unsigned char *)result + (v1 - 1) + 72);
    if (v1 == v3)
    {
      uint64_t v5 = *((unsigned __int8 *)v2 + 32);
      if (v5)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*((unsigned char *)v4 + (v5 + ~(_BYTE)i)) != (result[(v5 + ~(_BYTE)i) + 1][31] & 0x7F)) {
            break;
          }
          *((unsigned char *)result + 80) = v5 + ~(_BYTE)i;
        }
      }
    }
    else
    {
      int v13 = *((unsigned __int8 *)result + 80);
      if (v13 != *((unsigned __int8 *)v2 + 32))
      {
        unint64_t v14 = result + 1;
        do
        {
          uint64_t v15 = v14[v13 - 1];
          if ((char)v15[31] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          v14[v13] = (uint64_t *)v15[*((unsigned __int8 *)v4 + v13 - 1) + 10];
          *((unsigned char *)v4 + v13) = 0;
          LOBYTE(v13) = *((unsigned char *)result + 80) + 1;
          *((unsigned char *)result + 80) = v13;
        }
        while (*((unsigned __int8 *)v2 + 32) != v13);
      }
    }
  }
  else
  {
    unint64_t v7 = *v2;
    *((unsigned char *)result + 80) = 0;
    if (*((unsigned char *)v2 + 32))
    {
      unsigned __int8 v8 = 0;
      unint64_t v9 = result + 1;
      do
      {
        v9[v8] = v7;
        *((unsigned char *)result + v8 + 72) = 0;
        uint64_t v10 = *((unsigned __int8 *)result + 80);
        unsigned int v11 = *((unsigned __int8 *)v2 + 32);
        if (v10 + 1 != v11)
        {
          int v12 = v9[v10];
          if ((char)v12[31] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          unint64_t v7 = (uint64_t *)v12[10];
        }
        unsigned __int8 v8 = v10 + 1;
        *((unsigned char *)result + 80) = v8;
      }
      while (v11 > v8);
    }
  }
  return result;
}

void lsl::Vector<dyld4::Atlas::Mapper::Mapping>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      unint64_t v2 = *(void **)(a1 + 8);
      int v3 = *(lsl::Lock ***)a1;
      lsl::Allocator::realloc(v3, v2, 32 * a2);
    }
    else
    {
      uint64_t v5 = (void *)(a1 + 8);
      unint64_t v4 = *(void **)(a1 + 8);
      if (v4) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v4);
      }
      void *v5 = 0;
      v5[1] = 0;
      v5[2] = 0;
    }
  }
  else
  {
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve(a1, a2);
  }
}

void lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }
    else
    {
      unint64_t v2 = 16;
    }
    lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserveExact(a1, v2);
  }
}

void lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if ((lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 32 * a2) & 1) == 0)
    {
      unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, 32 * a2);
      uint64_t v5 = v4;
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        uint64_t v7 = 0;
        for (unint64_t i = 0; i < v6; ++i)
        {
          unint64_t v9 = &v4[v7];
          uint64_t v10 = (_OWORD *)(*(void *)(a1 + 8) + v7 * 8);
          long long v11 = v10[1];
          *unint64_t v9 = *v10;
          v9[1] = v11;
          unint64_t v6 = *(void *)(a1 + 16);
          v7 += 4;
        }
      }
      int v12 = *(void **)(a1 + 8);
      if (v12)
      {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v12);
        unint64_t v6 = *(void *)(a1 + 16);
      }
      if (v6 >= a2) {
        unint64_t v6 = a2;
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v6;
    }
    *(void *)(a1 + 24) = a2;
  }
}

uint64_t lsl::BTree<int,std::less<int>,false>::erase(uint64_t *a1, _DWORD *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F14BF8];
  lsl::BTree<int,std::less<int>,false>::find(a1, a2, (uint64_t)&v16);
  long long v11 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  memset(v15, 0, sizeof(v15));
  if (!lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>((uint64_t)&v16, (uint64_t)&v11)) {
    return 0;
  }
  uint64_t v4 = v16;
  long long v5 = v17;
  long long v6 = v18;
  long long v7 = v19;
  long long v8 = v20;
  uint64_t v9 = v21;
  char v10 = v22;
  lsl::BTree<int,std::less<int>,false>::erase((uint64_t)a1, (uint64_t)&v4, (uint64_t)&v11);
  return 1;
}

__n128 lsl::BTree<int,std::less<int>,false>::erase@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(unsigned __int8 *)(a2 + 80);
  int v7 = *(unsigned __int8 *)(a1 + 32);
  if (v6 == v7)
  {
    uint64_t v8 = v6 - 1;
  }
  else
  {
    uint64_t v9 = *(void *)(a2 + 8 + 8 * (v6 - 1));
    uint64_t v10 = *(unsigned __int8 *)(a2 + 72 + v6 - 1);
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator++((uint64_t **)a2);
    uint64_t v8 = *(unsigned __int8 *)(a2 + 80) - 1;
    uint64_t v11 = *(void *)(a2 + 8 + 8 * v8);
    uint64_t v12 = *(unsigned __int8 *)(a2 + 72 + v8);
    int v13 = *(_DWORD *)(v9 + 4 * v10);
    *(_DWORD *)(v9 + 4 * v10) = *(_DWORD *)(v11 + 4 * v12);
    *(_DWORD *)(v11 + 4 * v12) = v13;
  }
  uint64_t v14 = *(void *)(a2 + 8 + 8 * v8);
  if ((*(char *)(v14 + 248) & 0x80000000) == 0) {
    lsl::BTree<int,std::less<int>,false>::erase();
  }
  lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase(v14, *(unsigned __int8 *)(a2 + v8 + 72));
  lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure((char *)a2);
  if (v6 != v7) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--((uint64_t **)a2);
  }
  --*(void *)(a1 + 24);
  long long v15 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a3 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a3 + 24) = v15;
  __n128 result = *(__n128 *)(a2 + 40);
  long long v17 = *(_OWORD *)(a2 + 56);
  *(__n128 *)(a3 + 40) = result;
  *(void *)a3 = *(void *)a2;
  *(_OWORD *)(a3 + 56) = v17;
  *(void *)(a3 + 72) = *(void *)(a2 + 72);
  *(unsigned char *)(a3 + 80) = *(unsigned char *)(a2 + 80);
  return result;
}

__n128 lsl::BTree<int,std::less<int>,false>::find@<Q0>(uint64_t *a1@<X0>, _DWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v22 = *MEMORY[0x1E4F14BF8];
  lsl::BTree<int,std::less<int>,false>::const_iterator::const_iterator((uint64_t)&v16, a1, a2);
  uint64_t v11 = a1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  memset(v15, 0, sizeof(v15));
  if (lsl::BTree<int,std::less<int>,false>::const_iterator::operator<=>((uint64_t)&v16, (uint64_t)&v11)
    && (unsigned __int8 v7 = v21, *a2 >= *(_DWORD *)(*((void *)v17 + v21 - 1) + 4 * *((unsigned __int8 *)&v20 + v21 - 1))))
  {
    uint64_t v8 = v20;
    *(void *)a3 = v16;
    long long v9 = v17[1];
    *(_OWORD *)(a3 + 8) = v17[0];
    *(_OWORD *)(a3 + 24) = v9;
    __n128 result = v18;
    long long v10 = v19;
    *(__n128 *)(a3 + 40) = v18;
    *(_OWORD *)(a3 + 56) = v10;
    *(void *)(a3 + 72) = v8;
    *(unsigned char *)(a3 + 80) = v7;
  }
  else
  {
    *(void *)a3 = a1;
    result.n128_u64[0] = 0;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 65) = 0u;
  }
  return result;
}

char *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase(uint64_t a1, unsigned int a2)
{
  int v2 = *(char *)(a1 + 248);
  if ((v2 & 0x80000000) == 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase();
  }
  if ((v2 & 0x7Fu) <= a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase();
  }
  __n128 result = (char *)(a1 + 4 * a2);
  long long v5 = (char *)(a1 + 4 * (v2 & 0x7F));
  if (v5 != result + 4)
  {
    __n128 result = (char *)memmove(result, result + 4, v5 - (result + 4));
    LOBYTE(v2) = *(unsigned char *)(a1 + 248);
  }
  *(unsigned char *)(a1 + 248) = v2 - 1;
  return result;
}

void lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure(char *__dst)
{
  unsigned int v1 = __dst[80];
  uint64_t v2 = *(void *)__dst;
  if (v1 != *(unsigned __int8 *)(*(void *)__dst + 32)) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure();
  }
  if (v1 >= 2)
  {
    unsigned __int8 v4 = 0;
    long long v5 = __dst + 8;
    uint64_t v6 = __dst + 72;
    do
    {
      uint64_t v7 = (v1 - v4 - 2);
      uint64_t v8 = v7 + 1;
      if (*(char *)(*(void *)&v5[8 * v7 + 8] + 248) >= 0) {
        unsigned int v9 = 10;
      }
      else {
        unsigned int v9 = 31;
      }
      if ((*(unsigned char *)(*(void *)&v5[8 * v7 + 8] + 248) & 0x7Fu) >= v9) {
        break;
      }
      uint64_t v10 = v6[v7];
      uint64_t v11 = *(void *)&v5[8 * v7];
      int v12 = *(char *)(v11 + 248);
      if (v10 == (v12 & 0x7F))
      {
        int v13 = 0;
        if (v6[v7]) {
          goto LABEL_10;
        }
      }
      else
      {
        if (v12 < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        if (*(char *)(*(void *)(v11 + 8 * v10 + 88) + 248) >= 0) {
          int v18 = -10;
        }
        else {
          int v18 = -31;
        }
        int v13 = v18 + (*(unsigned char *)(*(void *)(v11 + 8 * v10 + 88) + 248) & 0x7F);
        if (v6[v7])
        {
LABEL_10:
          if (v12 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          int v14 = *(char *)(*(void *)(v11 + 8 * v10 + 72) + 248);
          char v15 = v14 & 0x7F;
          if (v14 >= 0) {
            char v16 = -10;
          }
          else {
            char v16 = -31;
          }
          char v17 = v16 + v15;
          goto LABEL_21;
        }
      }
      char v17 = 0;
LABEL_21:
      if (v13 < 1 || v13 < v17)
      {
        if (v17 < 1 || v13 >= v17)
        {
          if (v10 == (v12 & 0x7F))
          {
            if (v12 < 0) {
              lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
            }
            v6[v7] = v10 - 1;
            v6[v8] += (*(unsigned char *)(*(void *)(v11 + 8 * (v10 - 1) + 80) + 248) & 0x7F) + 1;
            lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge(*(void *)&v5[8 * v7], *(lsl::Lock ***)(v2 + 8), (v10 - 1));
            uint64_t v21 = *(void *)&v5[8 * v7];
            if (*(char *)(v21 + 248) < 0) {
              lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
            }
            *(void *)&v5[8 * v8] = *(void *)(v21 + 8 * v6[v7] + 80);
          }
          else
          {
            lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge(v11, *(lsl::Lock ***)(v2 + 8), v10);
          }
        }
        else
        {
          if (v12 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          char v19 = *(unsigned char *)(*(void *)(v11 + 8 * v10 + 80) + 248);
          lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::rotateFromLeft((void *)v11, v6[v7]);
          uint64_t v20 = *(void *)&v5[8 * v7];
          if (*(char *)(v20 + 248) < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          v6[v8] += (*(unsigned char *)(*(void *)(v20 + 8 * v6[v7] + 80) + 248) & 0x7F) - (v19 & 0x7F);
        }
      }
      else
      {
        lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::rotateFromRight((_DWORD *)v11, v6[v7]);
      }
      ++v4;
      uint64_t v2 = *(void *)__dst;
      unsigned int v1 = *(unsigned __int8 *)(*(void *)__dst + 32);
    }
    while ((int)(v1 - 1) > v4);
  }
  uint64_t v22 = __dst + 8;
  if ((*(unsigned char *)(*((void *)__dst + 1) + 248) & 0x7F) != 0)
  {
    unsigned __int8 v23 = *(unsigned char *)(v2 + 32);
  }
  else
  {
    int v24 = __dst + 72;
    if (__dst[72]) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure();
    }
    uint64_t v25 = __dst[80];
    if (&v24[v25] != __dst + 73)
    {
      memmove(v24, __dst + 73, v25 - 1);
      uint64_t v25 = __dst[80];
    }
    int v26 = (unsigned __int8 *)&v22[v25];
    if (v26 != (unsigned __int8 *)(__dst + 16))
    {
      memmove(__dst + 8, __dst + 16, v26 - (unsigned __int8 *)(__dst + 16));
      LOBYTE(v25) = __dst[80];
    }
    __dst[80] = v25 - 1;
    lsl::Allocator::free(*(lsl::Lock ***)(v2 + 8), *(void **)v2);
    int v27 = *(void **)__dst;
    unsigned __int8 v23 = *(unsigned char *)(*(void *)__dst + 32) - 1;
    *(unsigned char *)(*(void *)__dst + 32) = v23;
    if (__dst[80]) {
      *int v27 = *v22;
    }
    else {
      *int v27 = 0;
    }
  }
  if (v23)
  {
    uint64_t v28 = 0;
    do
    {
      if ((*(unsigned char *)(v22[(v23 + ~(_BYTE)v28)] + 248) & 0x7F) != __dst[(v23 + ~(_BYTE)v28)
                                                                                         + 72])
        break;
      --__dst[80];
      ++v28;
    }
    while (v23 != v28);
  }
}

_DWORD *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::rotateFromRight(_DWORD *result, int a2)
{
  if ((char)result[62] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v2 = (char *)&result[2 * a2];
  uint64_t v4 = *((void *)v2 + 10);
  unint64_t v3 = (unsigned char *)*((void *)v2 + 11);
  uint64_t v5 = *(unsigned char *)(v4 + 248) & 0x7F;
  int v6 = v3[248] & 0x7F;
  unsigned int v7 = v6 + v5;
  uint64_t v8 = (_DWORD *)(v4 + 4 * v5);
  *uint64_t v8 = result[a2];
  uint64_t v9 = (v6 - ((v6 + v5) >> 1));
  result[a2] = *(_DWORD *)&v3[4 * v9 - 4];
  unsigned int v10 = v6;
  if (v6 != v7 >> 1)
  {
    __n128 result = memmove(v8 + 1, v3, 4 * v9);
    unsigned int v10 = v3[248] & 0x7F;
  }
  if (v10 != v9) {
    __n128 result = memmove(v3, &v3[4 * (v6 - (v7 >> 1))], 4 * v10 - 4 * v9);
  }
  if ((*(char *)(v4 + 248) & 0x80000000) == 0)
  {
    int v11 = (char)v3[248];
    if (v11 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    if (v6 != v7 >> 1)
    {
      __n128 result = memmove((void *)(v4 + 8 * *(unsigned __int8 *)(v4 + 248) + 88), v3 + 80, 8 * v9);
      int v11 = (char)v3[248];
      if (v11 < 0) {
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
      }
    }
    uint64_t v12 = v11 + 1;
    if (v12 != v9) {
      __n128 result = memmove(v3 + 80, &v3[8 * v9 + 80], 8 * v12 - 8 * v9);
    }
  }
  *(unsigned char *)(v4 + 248) += v9;
  v3[248] -= v9;
  return result;
}

void *lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::rotateFromLeft(void *result, unsigned int a2)
{
  if ((char)result[31] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v2 = result;
  uint64_t v3 = a2 - 1;
  uint64_t v4 = result[v3 + 10];
  uint64_t v5 = (unsigned char *)result[a2 + 10];
  LOBYTE(v6) = *(unsigned char *)(v4 + 248);
  int v7 = v6 & 0x7F;
  uint64_t v8 = v5[248] & 0x7F;
  unsigned int v9 = v8 + v7;
  uint64_t v10 = ((v6 & 0x7F) - ((v8 + v7) >> 1));
  if ((v5[248] & 0x7F) != 0)
  {
    __n128 result = memmove(&v5[4 * v8 + 4 * v10 + -4 * v8], v5, 4 * v8);
    LOBYTE(v6) = *(unsigned char *)(v4 + 248);
  }
  int v11 = v6 & 0x7F;
  if (-4 * v10 != -4)
  {
    __n128 result = memmove(v5, (const void *)(v4 + 4 * (v6 & 0x7F) - 4 * v10 + 4), -(-4 * v10 + 4));
    LOBYTE(v6) = *(unsigned char *)(v4 + 248);
    int v11 = v6 & 0x7F;
  }
  uint64_t v12 = v5[248];
  *(_DWORD *)&v5[4 * v10 - 4] = *((_DWORD *)v2 + v3);
  *((_DWORD *)v2 + v3) = *(_DWORD *)(v4 + 4 * (v11 - (int)v10));
  if ((v6 & 0x80) == 0)
  {
    if ((v12 & 0x80) != 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    __n128 result = memmove(&v5[8 * v12 + 88 + 8 * v10 + 8 * ~v12], v5 + 80, 8 * v12 + 8);
    int v6 = *(char *)(v4 + 248);
    if (v6 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    if ((char)v5[248] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    if (v7 != v9 >> 1)
    {
      __n128 result = memmove(v5 + 80, (const void *)(v4 + 8 * *(unsigned __int8 *)(v4 + 248) + 88 - 8 * v10), 8 * v10);
      LOBYTE(v6) = *(unsigned char *)(v4 + 248);
    }
  }
  *(unsigned char *)(v4 + 248) = v6 - v10;
  v5[248] += v10;
  return result;
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge(uint64_t a1, lsl::Lock **this, unsigned int a3)
{
  int v3 = *(char *)(a1 + 248);
  if (v3 < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge();
  }
  LOBYTE(v4) = *(unsigned char *)(a1 + 248);
  if (v4 <= a3) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge();
  }
  uint64_t v7 = a1 + 80;
  uint64_t v8 = (void *)(a1 + 80 + 8 * a3);
  uint64_t v10 = *v8;
  unsigned int v9 = (unsigned __int8 *)v8[1];
  int v11 = (_DWORD *)(a1 + 4 * a3);
  *(_DWORD *)(*v8 + 4 * (*(unsigned char *)(*v8 + 248) & 0x7F)) = *v11;
  uint64_t v12 = (char *)(a1 + 4 * v3);
  if (v12 != (char *)(v11 + 1))
  {
    memmove(v11, v11 + 1, v12 - (char *)(v11 + 1));
    int v4 = *(char *)(a1 + 248);
    if (v4 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
  }
  uint64_t v13 = v7 + 8 * v4 + 8;
  if ((void *)v13 != v8 + 2) {
    memmove(v8 + 1, v8 + 2, v13 - (void)(v8 + 2));
  }
  unsigned int v14 = v9[248];
  unsigned int v15 = *(unsigned __int8 *)(v10 + 248);
  if ((v14 & 0x7F) != 0)
  {
    memmove((void *)(v10 + 4 * (v15 & 0x7F) + 4), v9, 4 * (v14 & 0x7F));
    unsigned int v15 = *(unsigned __int8 *)(v10 + 248);
    unsigned int v14 = v9[248];
  }
  if ((v15 & 0x80) == 0)
  {
    if ((v14 & 0x80) != 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    memmove((void *)(v10 + 8 * v15 + 88), v9 + 80, 8 * v14 + 8);
    LOBYTE(v14) = v9[248];
    LOBYTE(v15) = *(unsigned char *)(v10 + 248);
  }
  *(unsigned char *)(v10 + 248) = (v14 & 0x7F) + v15 + 1;
  --*(unsigned char *)(a1 + 248);

  lsl::Allocator::free(this, v9);
}

void *lsl::SharedPtr<dyld4::Atlas::Mapper>::SharedPtr(void *a1, lsl::Allocator::AllocationMetadata *this)
{
  *a1 = 0;
  int v4 = (lsl::Allocator::AllocationMetadata *)lsl::Allocator::AllocationMetadata::forPtr(this, this);
  uint64_t v5 = (dyld4::FileRecord *)lsl::Allocator::AllocationMetadata::pool(v4, 1);
  int v6 = (lsl::Lock **)dyld4::FileRecord::fileManager(v5);
  uint64_t v7 = lsl::Allocator::aligned_alloc(v6, 8uLL, 0x10uLL);
  *(_DWORD *)uint64_t v7 = 0;
  v7[1] = this;
  *a1 = v7;
  return a1;
}

void lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(lsl::Allocator *this, void *a2)
{
  if (!atomic_fetch_add((atomic_uint *volatile)this, 0xFFFFFFFF))
  {
    int v3 = (dyld4::Atlas::Mapper *)*((void *)this + 1);
    if (v3)
    {
      dyld4::Atlas::Mapper::~Mapper(v3);
      lsl::Allocator::freeObject(*((lsl::Allocator **)this + 1), v4);
    }
    lsl::Allocator::freeObject(this, a2);
  }
}

uint64_t *lsl::Vector<dyld4::Atlas::Mapper::Mapping>::swap(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v2 = *result;
    *__n128 result = *a2;
    *a2 = v2;
    uint64_t v4 = result[1];
    uint64_t v3 = result[2];
    uint64_t v5 = a2[2];
    result[1] = a2[1];
    result[2] = v5;
    a2[2] = v3;
    uint64_t v6 = result[3];
    result[3] = a2[3];
    a2[3] = v6;
    a2[1] = v4;
  }
  return result;
}

void *lsl::Vector<dyld4::Atlas::Mapper::Mapping>::Vector(void *a1, uint64_t a2, uint64_t a3)
{
  *a1 = a3;
  a1[1] = 0;
  uint64_t v5 = (void **)(a1 + 1);
  a1[2] = 0;
  a1[3] = 0;
  lsl::Vector<dyld4::Atlas::Mapper::Mapping>::reserve((uint64_t)a1, *(void *)(a2 + 16));
  a1[2] = *(void *)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6) {
    memmove(*v5, *(const void **)(a2 + 8), 32 * v6);
  }
  return a1;
}

uint64_t dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 && *(unsigned char *)(a1 + 24)) {
    munmap((void *)(-*MEMORY[0x1E4F14C80] & v2), *(void *)(a1 + 8) + v2 - (-*MEMORY[0x1E4F14C80] & v2));
  }
  return a1;
}

uint64_t *dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::swap(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    uint64_t v2 = *result;
    uint64_t v3 = result[1];
    uint64_t v4 = a2[1];
    *__n128 result = *a2;
    result[1] = v4;
    *a2 = v2;
    a2[1] = v3;
    uint64_t v5 = result[2];
    result[2] = a2[2];
    a2[2] = v5;
    LOBYTE(v5) = *((unsigned char *)result + 24);
    *((unsigned char *)result + 24) = *((unsigned char *)a2 + 24);
    *((unsigned char *)a2 + 24) = v5;
  }
  return result;
}

uint64_t lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::insert_internal@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x1E4F14BF8];
  if (*(void *)a1)
  {
    uint64_t v25 = a1;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    memset(v30, 0, sizeof(v30));
    uint64_t result = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>(a2, (uint64_t)&v25);
    if ((_BYTE)result
      && (uint64_t v9 = *(unsigned __int8 *)(a2 + 98),
          uint64_t v10 = *(char **)(*(void *)(a2 + 8 + 8 * (v9 - 1)) + 8 * *(unsigned __int8 *)(a2 + 88 + v9 - 1)),
          int v11 = **a3,
          v11 >= *v10))
    {
      int v12 = *v10;
      uint64_t v13 = v10 + 1;
      unsigned int v14 = *a3 + 1;
      while (v12 && (char)v12 >= (char)v11)
      {
        if ((_BYTE)v11)
        {
          int v15 = *v14++;
          int v11 = v15;
          int v16 = *v13++;
          int v12 = v16;
          if (v11 >= v16) {
            continue;
          }
        }
        goto LABEL_9;
      }
      char v21 = 0;
      long long v23 = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      long long v24 = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = v24;
      *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 8) = v23;
      *(void *)(a4 + 88) = *(void *)(a2 + 88);
      *(_WORD *)(a4 + 96) = *(_WORD *)(a2 + 96);
      *(unsigned char *)(a4 + 98) = v9;
    }
    else
    {
LABEL_9:
      uint64_t v25 = a1;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      memset(v30, 0, sizeof(v30));
      if (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>(a2, (uint64_t)&v25)&& *(unsigned __int8 *)(a2 + 98) == *(unsigned __int8 *)(a1 + 32))
      {
        lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
        uint64_t v17 = a2 + 88;
        uint64_t v18 = *(unsigned __int8 *)(a2 + 98) - 1;
        unsigned __int8 v19 = *(unsigned char *)(a2 + 88 + v18);
      }
      else
      {
        lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator--((uint64_t **)a2);
        lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
        uint64_t v17 = a2 + 88;
        uint64_t v20 = *(unsigned __int8 *)(a2 + 98) + a2 + 88;
        unsigned __int8 v19 = *(unsigned char *)(v20 - 1) + 1;
        *(unsigned char *)(v20 - 1) = v19;
        uint64_t v18 = *(unsigned __int8 *)(a2 + 98) - 1;
      }
      uint64_t result = (uint64_t)lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::insert(*(char **)(a2 + 8 + 8 * v18), v19, a3);
      ++*(void *)(a1 + 24);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
      *(void *)(a4 + 88) = *(void *)v17;
      *(_WORD *)(a4 + 96) = *(_WORD *)(v17 + 8);
      *(unsigned char *)(a4 + 98) = *(unsigned char *)(a2 + 98);
      char v21 = 1;
    }
  }
  else
  {
    uint64_t v22 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    *((unsigned char *)v22 + 248) = 0x80;
    *(_OWORD *)uint64_t v22 = 0u;
    *((_OWORD *)v22 + 1) = 0u;
    *((_OWORD *)v22 + 2) = 0u;
    *((_OWORD *)v22 + 3) = 0u;
    *((_OWORD *)v22 + 4) = 0u;
    *((_OWORD *)v22 + 5) = 0u;
    *((_OWORD *)v22 + 6) = 0u;
    *((_OWORD *)v22 + 7) = 0u;
    *((_OWORD *)v22 + 8) = 0u;
    *((_OWORD *)v22 + 9) = 0u;
    *((_OWORD *)v22 + 10) = 0u;
    *((_OWORD *)v22 + 11) = 0u;
    *((_OWORD *)v22 + 12) = 0u;
    *((_OWORD *)v22 + 13) = 0u;
    *((_OWORD *)v22 + 14) = 0u;
    v22[30] = 0;
    *(void *)a1 = v22;
    char v21 = 1;
    *(unsigned char *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v22;
    *(unsigned char *)(a2 + 98) = 1;
    uint64_t result = (uint64_t)lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::insert((char *)v22, 0, a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(void *)(a4 + 88) = *(void *)(a2 + 88);
    *(_WORD *)(a4 + 96) = *(_WORD *)(a2 + 96);
    *(unsigned char *)(a4 + 98) = *(unsigned char *)(a2 + 98);
  }
  *(unsigned char *)(a4 + 104) = v21;
  return result;
}

char *lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::insert(char *result, unsigned int a2, void *a3)
{
  int v3 = result[248];
  int v4 = v3 & 0x7F;
  if (v3 >= 0) {
    int v5 = 15;
  }
  else {
    int v5 = 31;
  }
  if (v4 == v5) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  if (v5 == a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  uint64_t v7 = result;
  uint64_t v8 = &result[8 * a2];
  if (v4 != a2)
  {
    uint64_t result = (char *)memmove(&result[8 * a2 + 8], &result[8 * a2], 8 * (v3 & 0x7F) - 8 * a2);
    LOBYTE(v3) = v7[248];
  }
  v7[248] = v3 + 1;
  *(void *)uint64_t v8 = *a3;
  return result;
}

uint64_t **lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator--(uint64_t **result)
{
  uint64_t v1 = *((unsigned __int8 *)result + 98);
  uint64_t v2 = *result;
  if (*((unsigned char *)result + 98))
  {
    if (v1 == *((unsigned __int8 *)v2 + 32))
    {
      int v3 = result + 11;
      uint64_t v4 = v1 - 1;
      int v5 = (char *)result + v1 + 87;
      char v6 = *v5;
      if (!*((unsigned char *)result + (v1 - 1) + 88))
      {
        if (!*v5)
        {
          do
          {
            LODWORD(v1) = v1 - 1;
            *((unsigned char *)result + 98) = v1;
            uint64_t v4 = v1 - 1;
            char v6 = *((unsigned char *)v3 + v4);
          }
          while (!v6);
        }
        int v5 = (char *)v3 + v4;
      }
    }
    else
    {
      unsigned int v14 = result + 1;
      int v15 = result + 11;
      do
      {
        int v16 = v14[v1 - 1];
        if ((char)v16[31] < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v17 = v16[*((unsigned __int8 *)v15 + v1 - 1) + 15];
        v14[v1] = (uint64_t *)v17;
        *((unsigned char *)v15 + v1) = *(unsigned char *)(v17 + 248) & 0x7F;
        LOBYTE(v1) = *((unsigned char *)result + 98) + 1;
        *((unsigned char *)result + 98) = v1;
      }
      while (*((unsigned __int8 *)v2 + 32) != v1);
      uint64_t v18 = (uint64_t)v15 + v1;
      char v19 = *(unsigned char *)(v18 - 1);
      int v5 = (char *)(v18 - 1);
      char v6 = v19;
    }
  }
  else
  {
    uint64_t v7 = *v2;
    *((unsigned char *)result + 98) = 0;
    if (*((unsigned char *)v2 + 32))
    {
      unsigned __int8 v8 = 0;
      uint64_t v9 = result + 1;
      do
      {
        v9[v8] = (uint64_t *)v7;
        *((unsigned char *)result + v8 + 88) = *(unsigned char *)(v7 + 248) & 0x7F;
        uint64_t v10 = *((unsigned __int8 *)result + 98);
        unsigned int v11 = *((unsigned __int8 *)v2 + 32);
        if (v10 + 1 != v11)
        {
          int v12 = v9[v10];
          if ((char)v12[31] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          uint64_t v7 = v12[*((unsigned __int8 *)v12 + 248) + 15];
        }
        unsigned __int8 v8 = v10 + 1;
        *((unsigned char *)result + 98) = v8;
      }
      while (v11 > v8);
      uint64_t v13 = v8 - 1;
    }
    else
    {
      uint64_t v13 = -1;
    }
    int v5 = (char *)result + v13 + 88;
    char v6 = *v5;
  }
  char *v5 = v6 - 1;
  return result;
}

unsigned __int8 *lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::prepareForInsertion(unsigned __int8 *result)
{
  uint64_t v1 = result[98];
  if (v1 != *(unsigned __int8 *)(*(void *)result + 32)) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion();
  }
  uint64_t v2 = result;
  int v3 = result + 8;
  if (*(char *)(*(void *)&result[8 * v1] + 248) >= 0) {
    int v4 = 15;
  }
  else {
    int v4 = 31;
  }
  if ((*(unsigned char *)(*(void *)&result[8 * v1] + 248) & 0x7F) == v4)
  {
    if (!result[98]) {
      goto LABEL_15;
    }
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    do
    {
      if (*(char *)(v3[v5] + 248) >= 0) {
        int v7 = 15;
      }
      else {
        int v7 = 31;
      }
      if ((*(unsigned char *)(v3[v5] + 248) & 0x7F) != v7) {
        unsigned int v6 = v5;
      }
      ++v5;
    }
    while (v1 != v5);
    if (!v6)
    {
LABEL_15:
      if (*(char *)(*v3 + 248) >= 0) {
        int v8 = 15;
      }
      else {
        int v8 = 31;
      }
      if ((*(unsigned char *)(*v3 + 248) & 0x7F) == v8)
      {
        uint64_t result = (unsigned __int8 *)lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(*(void *)result + 8), 0x100uLL, 0x100uLL);
        uint64_t v9 = **(void **)v2;
        result[248] = 0;
        *(_OWORD *)uint64_t result = 0u;
        *((_OWORD *)result + 1) = 0u;
        *((_OWORD *)result + 2) = 0u;
        *((_OWORD *)result + 3) = 0u;
        *((_OWORD *)result + 4) = 0u;
        *((_OWORD *)result + 5) = 0u;
        *((_OWORD *)result + 6) = 0u;
        *((void *)result + 14) = 0;
        *((void *)result + 15) = v9;
        **(void **)uint64_t v2 = result;
        if (v2[98] && (uint64_t result = (unsigned __int8 *)memmove(v2 + 89, v2 + 88, v2[98]), v2[98]))
        {
          uint64_t result = (unsigned __int8 *)memmove(v3 + 1, v3, 8 * v2[98]);
          LOBYTE(v1) = v2[98] + 1;
        }
        else
        {
          LOBYTE(v1) = 1;
        }
        unsigned int v6 = 0;
        v2[88] = 0;
        uint64_t v10 = *(uint64_t **)v2;
        *((void *)v2 + 1) = **(void **)v2;
        ++*((unsigned char *)v10 + 32);
        v2[98] = v1;
      }
      else
      {
        unsigned int v6 = 0;
      }
    }
    if (v6 + 1 < v1)
    {
      unsigned int v11 = v2 + 88;
      uint64_t v12 = v6;
      do
      {
        int v13 = v12;
        uint64_t result = (unsigned __int8 *)lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::splitChild(v3[v12], v11[v12], *(lsl::Lock ***)(*(void *)v2 + 8));
        uint64_t v14 = v3[v12];
        if (*(char *)(v14 + 248) < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v15 = v11[v12];
        uint64_t v16 = *(void *)(v14 + 8 * v15 + 120);
        unsigned int v17 = v2[v12 + 89];
        if (v17 > (*(unsigned char *)(v16 + 248) & 0x7Fu))
        {
          unsigned __int8 v18 = v15 + 1;
          v11[v12] = v18;
          v2[v12 + 89] = v17 + (~*(unsigned char *)(v16 + 248) | 0x80);
          uint64_t v19 = v3[v12];
          if (*(char *)(v19 + 248) < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          *(void *)&v2[8 * v12 + 16] = *(void *)(v19 + 8 * v18 + 120);
        }
        ++v12;
      }
      while (v13 + 2 < v2[98]);
    }
  }
  return result;
}

char *lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::NodeCore<31u,15u>::splitChild(uint64_t a1, unsigned int a2, lsl::Lock **this)
{
  if (*(char *)(a1 + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 248);
  if (v3 >= 0xF) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v5 = a1 + 120;
  uint64_t v6 = a1 + 120 + 8 * a2;
  char v7 = *(unsigned char *)(*(void *)v6 + 248);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 15;
  }
  else {
    int v10 = 31;
  }
  if (v9 != v10) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v12 = a2;
  if (v8 >= 0) {
    uint64_t v13 = 7;
  }
  else {
    uint64_t v13 = 15;
  }
  uint64_t v14 = (void *)(a1 + 8 * a2);
  if (v3 != a2)
  {
    memmove((void *)(a1 + 8 * a2 + 8), (const void *)(a1 + 8 * a2), 8 * v3 - 8 * a2);
    a2 = *(unsigned __int8 *)(a1 + 248);
  }
  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v15 = v5 + 8 * a2;
  if (v15 != v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v15 - v6);
    LOBYTE(a2) = *(unsigned char *)(a1 + 248);
  }
  *(unsigned char *)(a1 + 248) = a2 + 1;
  void *v14 = *(void *)(*(void *)v6 + 8 * v13);
  uint64_t result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  unsigned int v17 = result;
  char v18 = *(unsigned char *)(*(void *)v6 + 248);
  result[248] = v18 & 0x80;
  if (v18 < 0)
  {
    *((void *)result + 30) = 0;
    long long v19 = 0uLL;
    *((_OWORD *)result + 13) = 0u;
    *((_OWORD *)result + 14) = 0u;
    *((_OWORD *)result + 11) = 0u;
    *((_OWORD *)result + 12) = 0u;
    *((_OWORD *)result + 9) = 0u;
    *((_OWORD *)result + 10) = 0u;
    *((_OWORD *)result + 7) = 0u;
    *((_OWORD *)result + 8) = 0u;
  }
  else
  {
    *((void *)result + 14) = 0;
    long long v19 = 0uLL;
  }
  *((_OWORD *)result + 5) = v19;
  *((_OWORD *)result + 6) = v19;
  *((_OWORD *)result + 3) = v19;
  *((_OWORD *)result + 4) = v19;
  *((_OWORD *)result + 1) = v19;
  *((_OWORD *)result + 2) = v19;
  *(_OWORD *)uint64_t result = v19;
  if (*(char *)(a1 + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  char v20 = v9 + ~(_BYTE)v13;
  *(void *)(v5 + 8 * v12 + 8) = result;
  if (v20) {
    uint64_t result = (char *)memmove(result, (const void *)(*(void *)v6 + 8 * v13 + 8), 8 * (v9 + ~(_BYTE)v13));
  }
  uint64_t v21 = *(void *)v6;
  int v22 = *(char *)(*(void *)v6 + 248);
  if ((v22 & 0x80000000) == 0)
  {
    if (v17[248] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    uint64_t result = (char *)memmove(v17 + 120, (const void *)(v21 + 8 * v13 + 128), 8 * (v9 + ~(_BYTE)v13) + 8);
    uint64_t v21 = *(void *)v6;
    LOBYTE(v22) = *(unsigned char *)(*(void *)v6 + 248);
  }
  *(unsigned char *)(v21 + 248) = v22 + ~v20;
  char v23 = v17[248] + v20;
  v17[248] = v23;
  if (v23 >= 0) {
    int v24 = 15;
  }
  else {
    int v24 = 31;
  }
  if ((v23 & 0x7F) == v24
    || ((char v25 = *(unsigned char *)(v21 + 248), v26 = v25, v27 = v25 & 0x7F, v26 >= 0) ? (v28 = 15) : (v28 = 31), v27 == v28))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  return result;
}

uint64_t lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::const_iterator(uint64_t a1, uint64_t *a2, void *a3)
{
  *(void *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = a1 + 8;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 83) = 0u;
  if (*((unsigned char *)a2 + 32))
  {
    unint64_t v7 = 0;
    uint64_t v8 = *a2;
    uint64_t v9 = a1 + 88;
    do
    {
      *(void *)(v4 + 8 * v7) = v8;
      int v10 = std::__lower_bound[abi:nn180100]<std::_ClassicAlgPolicy,std::__wrap_iter<char const**>,std::__wrap_iter<char const**>,char const*,std::__identity,lsl::ConstCharStarCompare>((void *)v8, (void *)(v8 + 8 * (*(unsigned char *)(v8 + 248) & 0x7F)), a3);
      __int16 v11 = (_WORD)v10 - v8;
      unint64_t v12 = ((unint64_t)v10 - v8) >> 3;
      *(unsigned char *)(v9 + v7) = v12;
      uint64_t v13 = *(void *)(v4 + 8 * v7);
      if ((*(unsigned char *)(v13 + 248) & 0x7F) != v12)
      {
        uint64_t v15 = *(char **)(v13 + (v11 & 0x7F8));
        int v16 = *v15;
        if (v16 < *(char *)*a3)
        {
LABEL_15:
          *(unsigned char *)(a1 + 98) = v7 + 1;
          return a1;
        }
        int v17 = *(unsigned __int8 *)*a3;
        char v18 = (char *)(*a3 + 1);
        long long v19 = v15 + 1;
        while (v17 && (char)v17 >= (char)v16)
        {
          if ((_BYTE)v16)
          {
            int v20 = *v19++;
            int v16 = v20;
            int v21 = *v18++;
            int v17 = v21;
            if (v16 >= v21) {
              continue;
            }
          }
          goto LABEL_15;
        }
      }
      unint64_t v14 = *((unsigned __int8 *)a2 + 32);
      if (v7 + 1 != v14)
      {
        if ((*(unsigned char *)(v13 + 248) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v8 = *(void *)(v13 + (v11 & 0x7F8) + 120);
      }
      ++v7;
    }
    while (v7 < v14);
    for (*(unsigned char *)(a1 + 98) = v14; (_BYTE)v14; *(unsigned char *)(a1 + 98) = v14)
    {
      if (*(unsigned char *)(v9 + v14 - 1) != (*(unsigned char *)(*(void *)(v4
                                                                                            + 8 * v14
                                                                                            - 8)
                                                                                + 248) & 0x7F))
        break;
      LOBYTE(v14) = v14 - 1;
    }
  }
  return a1;
}

void *std::__lower_bound[abi:nn180100]<std::_ClassicAlgPolicy,std::__wrap_iter<char const**>,std::__wrap_iter<char const**>,char const*,std::__identity,lsl::ConstCharStarCompare>(void *result, void *a2, void *a3)
{
  if (a2 != result)
  {
    unint64_t v3 = a2 - result;
    do
    {
      unint64_t v4 = v3 >> 1;
      uint64_t v5 = &result[v3 >> 1];
      int v6 = *(char *)*v5;
      if (v6 < *(char *)*a3)
      {
LABEL_9:
        uint64_t result = v5 + 1;
        unint64_t v4 = v3 + ~v4;
      }
      else
      {
        unint64_t v7 = (char *)(*v5 + 1);
        uint64_t v8 = (char *)(*a3 + 1);
        int v9 = *(unsigned __int8 *)*a3;
        while (v9 && (char)v9 >= (char)v6)
        {
          if ((_BYTE)v6)
          {
            int v10 = *v7++;
            int v6 = v10;
            int v11 = *v8++;
            int v9 = v11;
            if (v6 >= v11) {
              continue;
            }
          }
          goto LABEL_9;
        }
      }
      unint64_t v3 = v4;
    }
    while (v4);
  }
  return result;
}

lsl::Allocator **lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr(lsl::Allocator **a1, void *a2)
{
  unint64_t v3 = *a1;
  if (*a1)
  {
    unint64_t v4 = (lsl::Allocator *)*((void *)v3 + 18);
    if (v4) {
      lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v4, a2);
    }
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v3 + 112);
    dyld4::FileRecord::~FileRecord((lsl::Allocator *)((char *)v3 + 8));
    lsl::Allocator::freeObject(*a1, v5);
  }
  return a1;
}

uint64_t **lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator++(uint64_t **result)
{
  int v1 = *((unsigned __int8 *)result + 98);
  uint64_t v2 = (uint64_t **)*result;
  if (*((unsigned char *)result + 98))
  {
    int v3 = *((unsigned __int8 *)v2 + 32);
    unint64_t v4 = result + 11;
    ++*((unsigned char *)result + (v1 - 1) + 88);
    if (v1 == v3)
    {
      uint64_t v5 = *((unsigned __int8 *)v2 + 32);
      if (v5)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*((unsigned char *)v4 + (v5 + ~(_BYTE)i)) != (result[(v5 + ~(_BYTE)i) + 1][31] & 0x7F)) {
            break;
          }
          *((unsigned char *)result + 98) = v5 + ~(_BYTE)i;
        }
      }
    }
    else
    {
      int v13 = *((unsigned __int8 *)result + 98);
      if (v13 != *((unsigned __int8 *)v2 + 32))
      {
        unint64_t v14 = result + 1;
        do
        {
          uint64_t v15 = v14[v13 - 1];
          if ((char)v15[31] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          v14[v13] = (uint64_t *)v15[*((unsigned __int8 *)v4 + v13 - 1) + 15];
          *((unsigned char *)v4 + v13) = 0;
          LOBYTE(v13) = *((unsigned char *)result + 98) + 1;
          *((unsigned char *)result + 98) = v13;
        }
        while (*((unsigned __int8 *)v2 + 32) != v13);
      }
    }
  }
  else
  {
    unint64_t v7 = *v2;
    *((unsigned char *)result + 98) = 0;
    if (*((unsigned char *)v2 + 32))
    {
      unsigned __int8 v8 = 0;
      int v9 = result + 1;
      do
      {
        v9[v8] = v7;
        *((unsigned char *)result + v8 + 88) = 0;
        uint64_t v10 = *((unsigned __int8 *)result + 98);
        unsigned int v11 = *((unsigned __int8 *)v2 + 32);
        if (v10 + 1 != v11)
        {
          unint64_t v12 = v9[v10];
          if ((char)v12[31] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          unint64_t v7 = (uint64_t *)v12[15];
        }
        unsigned __int8 v8 = v10 + 1;
        *((unsigned char *)result + 98) = v8;
      }
      while (v11 > v8);
    }
  }
  return result;
}

lsl::Allocator **lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(lsl::Allocator **a1, void *a2)
{
  int v3 = *a1;
  if (*a1)
  {
    unint64_t v4 = (lsl::Allocator *)*((void *)v3 + 9);
    if (v4) {
      lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v4, a2);
    }
    lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr((lsl::Allocator **)v3 + 8, a2);
    lsl::UniquePtr<dyld4::Atlas::Bitmap>::~UniquePtr((lsl::Allocator ***)v3 + 7, v5);
    uint64_t v7 = *((void *)v3 + 2);
    if (v7)
    {
      lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::deallocate(v7, *((lsl::Lock ***)v3 + 3));
      *((void *)v3 + 2) = 0;
    }
    *((void *)v3 + 5) = 0;
    *((unsigned char *)v3 + 48) = 0;
    lsl::Allocator::freeObject(*a1, v6);
  }
  return a1;
}

void lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::deallocate(uint64_t a1, lsl::Lock **a2)
{
  if ((*(char *)(a1 + 248) & 0x80000000) == 0)
  {
    unint64_t v4 = (uint64_t *)(a1 + 120);
    uint64_t v5 = 8 * *(unsigned __int8 *)(a1 + 248) + 8;
    do
    {
      uint64_t v6 = *v4++;
      lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::deallocate(v6, a2);
      v5 -= 8;
    }
    while (v5);
  }
  unint64_t v7 = 0;
  unsigned __int8 v8 = (lsl::Allocator **)a1;
  do
  {
    int v9 = lsl::UniquePtr<dyld4::Atlas::Image>::~UniquePtr(v8);
    ++v7;
    if (*(char *)(a1 + 248) >= 0) {
      unint64_t v10 = 15;
    }
    else {
      unint64_t v10 = 31;
    }
    unsigned __int8 v8 = v9 + 1;
  }
  while (v7 < v10);

  lsl::Allocator::free(a2, (void *)a1);
}

uint64_t **lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(uint64_t **result)
{
  int v1 = *((unsigned __int8 *)result + 143);
  uint64_t v2 = (uint64_t **)*result;
  if (*((unsigned char *)result + 143))
  {
    int v3 = *((unsigned __int8 *)v2 + 32);
    unint64_t v4 = result + 16;
    ++*((unsigned char *)result + (v1 - 1) + 128);
    if (v1 == v3)
    {
      uint64_t v5 = *((unsigned __int8 *)v2 + 32);
      if (v5)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*((unsigned char *)v4 + (v5 + ~(_BYTE)i)) != (result[(v5 + ~(_BYTE)i) + 1][30] & 0x7F)) {
            break;
          }
          *((unsigned char *)result + 143) = v5 + ~(_BYTE)i;
        }
      }
    }
    else
    {
      int v13 = *((unsigned __int8 *)result + 143);
      if (v13 != *((unsigned __int8 *)v2 + 32))
      {
        unint64_t v14 = result + 1;
        do
        {
          uint64_t v15 = v14[v13 - 1];
          if ((char)v15[30] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          v14[v13] = (uint64_t *)v15[*((unsigned __int8 *)v4 + v13 - 1) + 21];
          *((unsigned char *)v4 + v13) = 0;
          LOBYTE(v13) = *((unsigned char *)result + 143) + 1;
          *((unsigned char *)result + 143) = v13;
        }
        while (*((unsigned __int8 *)v2 + 32) != v13);
      }
    }
  }
  else
  {
    unint64_t v7 = *v2;
    *((unsigned char *)result + 143) = 0;
    if (*((unsigned char *)v2 + 32))
    {
      unsigned __int8 v8 = 0;
      int v9 = result + 1;
      do
      {
        v9[v8] = v7;
        *((unsigned char *)result + v8 + 128) = 0;
        uint64_t v10 = *((unsigned __int8 *)result + 143);
        unsigned int v11 = *((unsigned __int8 *)v2 + 32);
        if (v10 + 1 != v11)
        {
          unint64_t v12 = v9[v10];
          if ((char)v12[30] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          unint64_t v7 = (uint64_t *)v12[21];
        }
        unsigned __int8 v8 = v10 + 1;
        *((unsigned char *)result + 143) = v8;
      }
      while (v11 > v8);
    }
  }
  return result;
}

uint64_t **lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(uint64_t **result)
{
  int v1 = *((unsigned __int8 *)result + 152);
  uint64_t v2 = (uint64_t **)*result;
  if (*((unsigned char *)result + 152))
  {
    int v3 = *((unsigned __int8 *)v2 + 32);
    unint64_t v4 = result + 17;
    ++*((unsigned char *)result + (v1 - 1) + 136);
    if (v1 == v3)
    {
      uint64_t v5 = *((unsigned __int8 *)v2 + 32);
      if (v5)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*((unsigned char *)v4 + (v5 + ~(_BYTE)i)) != (result[(v5 + ~(_BYTE)i) + 1][31] & 0x7F)) {
            break;
          }
          *((unsigned char *)result + 152) = v5 + ~(_BYTE)i;
        }
      }
    }
    else
    {
      int v13 = *((unsigned __int8 *)result + 152);
      if (v13 != *((unsigned __int8 *)v2 + 32))
      {
        unint64_t v14 = result + 1;
        do
        {
          uint64_t v15 = v14[v13 - 1];
          if ((char)v15[31] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          v14[v13] = (uint64_t *)v15[*((unsigned __int8 *)v4 + v13 - 1) + 24];
          *((unsigned char *)v4 + v13) = 0;
          LOBYTE(v13) = *((unsigned char *)result + 152) + 1;
          *((unsigned char *)result + 152) = v13;
        }
        while (*((unsigned __int8 *)v2 + 32) != v13);
      }
    }
  }
  else
  {
    unint64_t v7 = *v2;
    *((unsigned char *)result + 152) = 0;
    if (*((unsigned char *)v2 + 32))
    {
      unsigned __int8 v8 = 0;
      int v9 = result + 1;
      do
      {
        v9[v8] = v7;
        *((unsigned char *)result + v8 + 136) = 0;
        uint64_t v10 = *((unsigned __int8 *)result + 152);
        unsigned int v11 = *((unsigned __int8 *)v2 + 32);
        if (v10 + 1 != v11)
        {
          unint64_t v12 = v9[v10];
          if ((char)v12[31] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          unint64_t v7 = (uint64_t *)v12[24];
        }
        unsigned __int8 v8 = v10 + 1;
        *((unsigned char *)result + 152) = v8;
      }
      while (v11 > v8);
    }
  }
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::insert_internal(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v36 = *MEMORY[0x1E4F14BF8];
  if (*(void *)a1)
  {
    uint64_t v26 = a1;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v35 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>(a2, (uint64_t)&v26))
    {
      uint64_t v8 = *(unsigned __int8 *)(a2 + 143);
      if (*a3 >= *(_DWORD *)(*(void *)(a2 + 8 + 8 * (v8 - 1)) + 24 * *(unsigned __int8 *)(a2 + 128 + v8 - 1)))
      {
        char v15 = 0;
        long long v21 = *(_OWORD *)(a2 + 88);
        *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
        *(_OWORD *)(a4 + 88) = v21;
        *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
        long long v22 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a4 + 24) = v22;
        long long v23 = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
        *(void *)a4 = *(void *)a2;
        *(void *)(a4 + 135) = *(void *)(a2 + 135);
        uint64_t v24 = *(void *)(a2 + 120);
        *(_OWORD *)(a4 + 56) = v23;
        uint64_t v25 = *(void *)(a2 + 128);
        *(void *)(a4 + 120) = v24;
        *(void *)(a4 + 128) = v25;
        *(unsigned char *)(a4 + 143) = v8;
        goto LABEL_13;
      }
    }
    uint64_t v26 = a1;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v35 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>(a2, (uint64_t)&v26)&& *(unsigned __int8 *)(a2 + 143) == *(unsigned __int8 *)(a1 + 32))
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
      int v9 = (uint64_t *)(a2 + 128);
      uint64_t v10 = *(unsigned __int8 *)(a2 + 143) - 1;
      unsigned __int8 v11 = *(unsigned char *)(a2 + 128 + v10);
    }
    else
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--((uint64_t **)a2);
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
      int v9 = (uint64_t *)(a2 + 128);
      uint64_t v18 = *(unsigned __int8 *)(a2 + 143) + a2 + 128;
      unsigned __int8 v11 = *(unsigned char *)(v18 - 1) + 1;
      *(unsigned char *)(v18 - 1) = v11;
      uint64_t v10 = *(unsigned __int8 *)(a2 + 143) - 1;
    }
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::insert(*(void *)(a2 + 8 + 8 * v10), v11, (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    uint64_t v19 = *(void *)(a2 + 120);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    uint64_t v20 = *v9;
    *(void *)(a4 + 135) = *(uint64_t *)((char *)v9 + 7);
    *(void *)(a4 + 120) = v19;
    *(void *)(a4 + 128) = v20;
    char v17 = *(unsigned char *)(a2 + 143);
    char v15 = 1;
  }
  else
  {
    unint64_t v12 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    uint64_t v13 = 0;
    *((unsigned char *)v12 + 240) = 0x80;
    do
    {
      unint64_t v14 = &v12[v13];
      *(_DWORD *)unint64_t v14 = 0;
      v14[1] = 0;
      void v14[2] = 0;
      v13 += 3;
    }
    while (v13 != 30);
    *(void *)a1 = v12;
    char v15 = 1;
    *(unsigned char *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v12;
    *(unsigned char *)(a2 + 143) = 1;
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::insert((uint64_t)v12, 0, (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(void *)(a4 + 135) = *(void *)(a2 + 135);
    uint64_t v16 = *(void *)(a2 + 128);
    *(void *)(a4 + 120) = *(void *)(a2 + 120);
    *(void *)(a4 + 128) = v16;
    char v17 = *(unsigned char *)(a2 + 143);
  }
  *(unsigned char *)(a4 + 143) = v17;
LABEL_13:
  *(unsigned char *)(a4 + 144) = v15;
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::insert(uint64_t a1, unsigned int a2, uint64_t a3)
{
  char v3 = *(unsigned char *)(a1 + 240);
  char v4 = v3;
  uint64_t v5 = v3 & 0x7F;
  if (v3 >= 0) {
    int v6 = 7;
  }
  else {
    int v6 = 10;
  }
  if (v5 == v6) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  if (v6 == a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  if (v5 != a2)
  {
    uint64_t v7 = 3 * v5;
    uint64_t v8 = a1 + 8 * v7;
    uint64_t v9 = 24 * a2 - 8 * v7;
    uint64_t v10 = v8;
    do
    {
      int v11 = *(_DWORD *)(v10 - 24);
      v10 -= 24;
      *(_DWORD *)uint64_t v8 = v11;
      *(_OWORD *)(v8 + 8) = *(_OWORD *)(v8 - 16);
      uint64_t v8 = v10;
      v9 += 24;
    }
    while (v9);
    char v4 = *(unsigned char *)(a1 + 240);
  }
  *(unsigned char *)(a1 + 240) = v4 + 1;
  *(_DWORD *)(a1 + 24 * a2) = *(_DWORD *)a3;
  __n128 result = *(__n128 *)(a3 + 8);
  *(__n128 *)(a1 + 24 * a2 + 8) = result;
  return result;
}

uint64_t **lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--(uint64_t **result)
{
  uint64_t v1 = *((unsigned __int8 *)result + 143);
  uint64_t v2 = *result;
  if (*((unsigned char *)result + 143))
  {
    if (v1 == *((unsigned __int8 *)v2 + 32))
    {
      char v3 = result + 16;
      uint64_t v4 = v1 - 1;
      uint64_t v5 = (char *)result + v1 + 127;
      char v6 = *v5;
      if (!*((unsigned char *)result + (v1 - 1) + 128))
      {
        if (!*v5)
        {
          do
          {
            LODWORD(v1) = v1 - 1;
            *((unsigned char *)result + 143) = v1;
            uint64_t v4 = v1 - 1;
            char v6 = *((unsigned char *)v3 + v4);
          }
          while (!v6);
        }
        uint64_t v5 = (char *)v3 + v4;
      }
    }
    else
    {
      unint64_t v14 = result + 1;
      char v15 = result + 16;
      do
      {
        uint64_t v16 = v14[v1 - 1];
        if ((char)v16[30] < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v17 = v16[*((unsigned __int8 *)v15 + v1 - 1) + 21];
        v14[v1] = (uint64_t *)v17;
        *((unsigned char *)v15 + v1) = *(unsigned char *)(v17 + 240) & 0x7F;
        LOBYTE(v1) = *((unsigned char *)result + 143) + 1;
        *((unsigned char *)result + 143) = v1;
      }
      while (*((unsigned __int8 *)v2 + 32) != v1);
      uint64_t v18 = (uint64_t)v15 + v1;
      char v19 = *(unsigned char *)(v18 - 1);
      uint64_t v5 = (char *)(v18 - 1);
      char v6 = v19;
    }
  }
  else
  {
    uint64_t v7 = *v2;
    *((unsigned char *)result + 143) = 0;
    if (*((unsigned char *)v2 + 32))
    {
      unsigned __int8 v8 = 0;
      uint64_t v9 = result + 1;
      do
      {
        v9[v8] = (uint64_t *)v7;
        *((unsigned char *)result + v8 + 128) = *(unsigned char *)(v7 + 240) & 0x7F;
        uint64_t v10 = *((unsigned __int8 *)result + 143);
        unsigned int v11 = *((unsigned __int8 *)v2 + 32);
        if (v10 + 1 != v11)
        {
          unint64_t v12 = v9[v10];
          if ((char)v12[30] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          uint64_t v7 = v12[*((unsigned __int8 *)v12 + 240) + 21];
        }
        unsigned __int8 v8 = v10 + 1;
        *((unsigned char *)result + 143) = v8;
      }
      while (v11 > v8);
      uint64_t v13 = v8 - 1;
    }
    else
    {
      uint64_t v13 = -1;
    }
    uint64_t v5 = (char *)result + v13 + 128;
    char v6 = *v5;
  }
  char *v5 = v6 - 1;
  return result;
}

unsigned __int8 *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion(unsigned __int8 *result)
{
  uint64_t v1 = result[143];
  if (v1 != *(unsigned __int8 *)(*(void *)result + 32)) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion();
  }
  uint64_t v2 = result;
  char v3 = result + 8;
  if (*(char *)(*(void *)&result[8 * v1] + 240) >= 0) {
    int v4 = 7;
  }
  else {
    int v4 = 10;
  }
  if ((*(unsigned char *)(*(void *)&result[8 * v1] + 240) & 0x7F) == v4)
  {
    if (!result[143]) {
      goto LABEL_15;
    }
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    do
    {
      if (*(char *)(v3[v5] + 240) >= 0) {
        int v7 = 7;
      }
      else {
        int v7 = 10;
      }
      if ((*(unsigned char *)(v3[v5] + 240) & 0x7F) != v7) {
        unsigned int v6 = v5;
      }
      ++v5;
    }
    while (v1 != v5);
    if (!v6)
    {
LABEL_15:
      if (*(char *)(*v3 + 240) >= 0) {
        int v8 = 7;
      }
      else {
        int v8 = 10;
      }
      if ((*(unsigned char *)(*v3 + 240) & 0x7F) == v8)
      {
        __n128 result = (unsigned __int8 *)lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(*(void *)result + 8), 0x100uLL, 0x100uLL);
        uint64_t v9 = 0;
        uint64_t v10 = **(void **)v2;
        result[240] = 0;
        do
        {
          unsigned int v11 = &result[v9];
          *(_DWORD *)unsigned int v11 = 0;
          *((void *)v11 + 1) = 0;
          *((void *)v11 + 2) = 0;
          v9 += 24;
        }
        while (v9 != 168);
        *((void *)result + 21) = v10;
        **(void **)uint64_t v2 = result;
        if (v2[143] && (__n128 result = (unsigned __int8 *)memmove(v2 + 129, v2 + 128, v2[143]), v2[143]))
        {
          __n128 result = (unsigned __int8 *)memmove(v3 + 1, v3, 8 * v2[143]);
          LOBYTE(v1) = v2[143] + 1;
        }
        else
        {
          LOBYTE(v1) = 1;
        }
        unsigned int v6 = 0;
        v2[128] = 0;
        unint64_t v12 = *(uint64_t **)v2;
        *((void *)v2 + 1) = **(void **)v2;
        ++*((unsigned char *)v12 + 32);
        v2[143] = v1;
      }
      else
      {
        unsigned int v6 = 0;
      }
    }
    if (v6 + 1 < v1)
    {
      uint64_t v13 = v2 + 128;
      uint64_t v14 = v6;
      do
      {
        int v15 = v14;
        __n128 result = (unsigned __int8 *)lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::splitChild(v3[v14], v13[v14], *(lsl::Lock ***)(*(void *)v2 + 8));
        uint64_t v16 = v3[v14];
        if (*(char *)(v16 + 240) < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v17 = v13[v14];
        uint64_t v18 = *(void *)(v16 + 8 * v17 + 168);
        unsigned int v19 = v2[v14 + 129];
        if (v19 > (*(unsigned char *)(v18 + 240) & 0x7Fu))
        {
          unsigned __int8 v20 = v17 + 1;
          v13[v14] = v20;
          v2[v14 + 129] = v19 + (~*(unsigned char *)(v18 + 240) | 0x80);
          uint64_t v21 = v3[v14];
          if (*(char *)(v21 + 240) < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          *(void *)&v2[8 * v14 + 16] = *(void *)(v21 + 8 * v20 + 168);
        }
        ++v14;
      }
      while (v15 + 2 < v2[143]);
    }
  }
  return result;
}

char *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::splitChild(uint64_t a1, unsigned int a2, lsl::Lock **this)
{
  if (*(char *)(a1 + 240) < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 240);
  if (v3 >= 7) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v5 = a1 + 168;
  uint64_t v6 = a1 + 168 + 8 * a2;
  char v7 = *(unsigned char *)(*(void *)v6 + 240);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 7;
  }
  else {
    int v10 = 10;
  }
  if (v9 != v10) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v12 = a2;
  if (v8 >= 0) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 5;
  }
  if (v3 != a2)
  {
    uint64_t v14 = 3 * v3;
    uint64_t v15 = a1 + 24 * v3;
    uint64_t v16 = 24 * a2 - 8 * v14;
    uint64_t v17 = v15;
    do
    {
      int v18 = *(_DWORD *)(v17 - 24);
      v17 -= 24;
      *(_DWORD *)uint64_t v15 = v18;
      *(_OWORD *)(v15 + 8) = *(_OWORD *)(v15 - 16);
      uint64_t v15 = v17;
      v16 += 24;
    }
    while (v16);
    a2 = *(unsigned __int8 *)(a1 + 240);
  }
  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v19 = v5 + 8 * a2;
  if (v19 != v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v19 - v6);
    LOBYTE(a2) = *(unsigned char *)(a1 + 240);
  }
  *(unsigned char *)(a1 + 240) = a2 + 1;
  uint64_t v20 = *(void *)v6 + 24 * v13;
  *(_DWORD *)(a1 + 24 * v12) = *(_DWORD *)v20;
  *(_OWORD *)(a1 + 24 * v12 + 8) = *(_OWORD *)(v20 + 8);
  __n128 result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  long long v22 = result;
  char v23 = *(unsigned char *)(*(void *)v6 + 240);
  result[240] = v23 & 0x80;
  if (v23 < 0)
  {
    for (uint64_t i = 0; i != 240; i += 24)
    {
      long long v27 = &result[i];
      *(_DWORD *)long long v27 = 0;
      *((void *)v27 + 1) = 0;
      *((void *)v27 + 2) = 0;
    }
  }
  else
  {
    for (uint64_t j = 0; j != 168; j += 24)
    {
      uint64_t v25 = &result[j];
      *(_DWORD *)uint64_t v25 = 0;
      *((void *)v25 + 1) = 0;
      *((void *)v25 + 2) = 0;
    }
  }
  if (*(char *)(a1 + 240) < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  unsigned __int8 v28 = v9 + ~(_BYTE)v13;
  long long v29 = (uint64_t *)(v5 + 8 * v12);
  v29[1] = (uint64_t)result;
  uint64_t v30 = *v29;
  if (v28)
  {
    uint64_t v31 = v30 + 24 * v13;
    uint64_t v32 = v31 + 24 * v28 + 24;
    uint64_t v33 = v31 + 24;
    uint64_t v34 = (uint64_t)result;
    do
    {
      *(_DWORD *)uint64_t v34 = *(_DWORD *)v33;
      *(_OWORD *)(v34 + 8) = *(_OWORD *)(v33 + 8);
      v33 += 24;
      v34 += 24;
    }
    while (v33 != v32);
    uint64_t v30 = *(void *)v6;
  }
  int v35 = *(char *)(v30 + 240);
  if ((v35 & 0x80000000) == 0)
  {
    if (result[240] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    __n128 result = (char *)memmove(result + 168, (const void *)(v30 + 8 * v13 + 176), 8 * v28 + 8);
    uint64_t v30 = *(void *)v6;
    LOBYTE(v35) = *(unsigned char *)(*(void *)v6 + 240);
  }
  *(unsigned char *)(v30 + 240) = v35 + ~v28;
  char v36 = v22[240] + v28;
  v22[240] = v36;
  if (v36 >= 0) {
    int v37 = 7;
  }
  else {
    int v37 = 10;
  }
  if ((v36 & 0x7F) == v37
    || ((char v38 = *(unsigned char *)(v30 + 240), v39 = v38, v40 = v38 & 0x7F, v39 >= 0) ? (v41 = 7) : (v41 = 10), v40 == v41))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator(uint64_t result, uint64_t *a2, unsigned int *a3)
{
  *(void *)__n128 result = a2;
  *(_OWORD *)(result + 8) = 0u;
  uint64_t v3 = result + 8;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 72) = 0u;
  *(_OWORD *)(result + 88) = 0u;
  *(_OWORD *)(result + 104) = 0u;
  *(_OWORD *)(result + 120) = 0u;
  *(void *)(result + 136) = 0;
  if (*((unsigned char *)a2 + 32))
  {
    unint64_t v4 = 0;
    uint64_t v5 = *a2;
    uint64_t v6 = result + 128;
    do
    {
      *(void *)(v3 + 8 * v4) = v5;
      unint64_t v7 = *(unsigned char *)(v5 + 240) & 0x7F;
      if ((*(unsigned char *)(v5 + 240) & 0x7F) != 0)
      {
        int v8 = (_DWORD *)v5;
        do
        {
          unint64_t v9 = v7 >> 1;
          int v10 = &v8[6 * (v7 >> 1)];
          unsigned int v12 = *v10;
          unsigned int v11 = v10 + 6;
          v7 += ~(v7 >> 1);
          if (v12 < *a3) {
            int v8 = v11;
          }
          else {
            unint64_t v7 = v9;
          }
        }
        while (v7);
      }
      else
      {
        int v8 = (_DWORD *)(v5 + 24 * (*(unsigned char *)(v5 + 240) & 0x7F));
      }
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v5) >> 3);
      *(unsigned char *)(v6 + v4) = v13;
      uint64_t v14 = *(void *)(v3 + 8 * v4);
      if ((*(unsigned char *)(v14 + 240) & 0x7F) != v13
        && *(_DWORD *)(v14 + 24 * v13) < *a3)
      {
        *(unsigned char *)(result + 143) = v4 + 1;
        return result;
      }
      unint64_t v15 = *((unsigned __int8 *)a2 + 32);
      if (v4 + 1 != v15)
      {
        if ((*(unsigned char *)(v14 + 240) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v5 = *(void *)(v14 + 8 * v13 + 168);
      }
      ++v4;
    }
    while (v4 < v15);
    for (*(unsigned char *)(result + 143) = v15; (_BYTE)v15; *(unsigned char *)(result + 143) = v15)
    {
      if (*(unsigned char *)(v6 + v15 - 1) != (*(unsigned char *)(*(void *)(result
                                                                                            + 8 * v15)
                                                                                + 240) & 0x7F))
        break;
      LOBYTE(v15) = v15 - 1;
    }
  }
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::insert_internal(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v33 = *MEMORY[0x1E4F14BF8];
  if (*(void *)a1)
  {
    uint64_t v22 = a1;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    char v32 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>(a2, (uint64_t)&v22))
    {
      uint64_t v8 = *(unsigned __int8 *)(a2 + 152);
      if (*a3 >= *(_DWORD *)(*(void *)(a2 + 8 + 8 * (v8 - 1)) + 32 * *(unsigned __int8 *)(a2 + 136 + v8 - 1)))
      {
        char v15 = 0;
        long long v18 = *(_OWORD *)(a2 + 88);
        *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
        *(_OWORD *)(a4 + 88) = v18;
        long long v19 = *(_OWORD *)(a2 + 120);
        *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
        *(_OWORD *)(a4 + 120) = v19;
        long long v20 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a4 + 24) = v20;
        long long v21 = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
        *(void *)a4 = *(void *)a2;
        *(_OWORD *)(a4 + 56) = v21;
        *(_OWORD *)(a4 + 136) = *(_OWORD *)(a2 + 136);
        *(unsigned char *)(a4 + 152) = v8;
        goto LABEL_13;
      }
    }
    uint64_t v22 = a1;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    char v32 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>(a2, (uint64_t)&v22)&& *(unsigned __int8 *)(a2 + 152) == *(unsigned __int8 *)(a1 + 32))
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
      unint64_t v9 = (_OWORD *)(a2 + 136);
      uint64_t v10 = *(unsigned __int8 *)(a2 + 152) - 1;
      unsigned __int8 v11 = *(unsigned char *)(a2 + 136 + v10);
    }
    else
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--((uint64_t **)a2);
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
      unint64_t v9 = (_OWORD *)(a2 + 136);
      uint64_t v17 = *(unsigned __int8 *)(a2 + 152) + a2 + 136;
      unsigned __int8 v11 = *(unsigned char *)(v17 - 1) + 1;
      *(unsigned char *)(v17 - 1) = v11;
      uint64_t v10 = *(unsigned __int8 *)(a2 + 152) - 1;
    }
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::insert(*(void *)(a2 + 8 + 8 * v10), v11, (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a4 + 120) = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a4 + 136) = *v9;
    char v16 = *(unsigned char *)(a2 + 152);
    char v15 = 1;
  }
  else
  {
    unsigned int v12 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    uint64_t v13 = 0;
    *((unsigned char *)v12 + 248) = 0x80;
    do
    {
      uint64_t v14 = &v12[v13];
      *(_DWORD *)uint64_t v14 = 0;
      void v14[2] = 0;
      void v14[3] = 0;
      v14[1] = 0;
      v13 += 4;
    }
    while (v13 != 28);
    *(void *)a1 = v12;
    char v15 = 1;
    *(unsigned char *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v12;
    *(unsigned char *)(a2 + 152) = 1;
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::insert((uint64_t)v12, 0, (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a4 + 120) = *(_OWORD *)(a2 + 120);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a4 + 136) = *(_OWORD *)(a2 + 136);
    char v16 = *(unsigned char *)(a2 + 152);
  }
  *(unsigned char *)(a4 + 152) = v16;
LABEL_13:
  *(unsigned char *)(a4 + 160) = v15;
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::insert(uint64_t a1, unsigned int a2, uint64_t a3)
{
  char v3 = *(unsigned char *)(a1 + 248);
  LOBYTE(v4) = v3;
  uint64_t v5 = v3 & 0x7F;
  if (v3 >= 0) {
    int v6 = 6;
  }
  else {
    int v6 = 7;
  }
  if (v5 == v6) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  if (a2 == v6) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  uint64_t v7 = a1 + 32 * a2;
  if (v5 != a2)
  {
    uint64_t v8 = a1 + 32 * v5;
    uint64_t v9 = 32 * a2 - 32 * v5;
    uint64_t v10 = v8;
    do
    {
      int v11 = *(_DWORD *)(v10 - 32);
      v10 -= 32;
      *(_DWORD *)uint64_t v8 = v11;
      *(_OWORD *)(v8 + 8) = *(_OWORD *)(v8 - 24);
      *(void *)(v8 + 24) = *(void *)(v8 - 8);
      uint64_t v8 = v10;
      v9 += 32;
    }
    while (v9);
    uint64_t v4 = *(unsigned __int8 *)(a1 + 248);
  }
  *(unsigned char *)(a1 + 248) = v4 + 1;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)a3;
  __n128 result = *(__n128 *)(a3 + 8);
  *(void *)(v7 + 24) = *(void *)(a3 + 24);
  *(__n128 *)(v7 + 8) = result;
  return result;
}

uint64_t **lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--(uint64_t **result)
{
  uint64_t v1 = *((unsigned __int8 *)result + 152);
  uint64_t v2 = *result;
  if (*((unsigned char *)result + 152))
  {
    if (v1 == *((unsigned __int8 *)v2 + 32))
    {
      char v3 = result + 17;
      uint64_t v4 = v1 - 1;
      uint64_t v5 = (char *)result + v1 + 135;
      char v6 = *v5;
      if (!*((unsigned char *)result + (v1 - 1) + 136))
      {
        if (!*v5)
        {
          do
          {
            LODWORD(v1) = v1 - 1;
            *((unsigned char *)result + 152) = v1;
            uint64_t v4 = v1 - 1;
            char v6 = *((unsigned char *)v3 + v4);
          }
          while (!v6);
        }
        uint64_t v5 = (char *)v3 + v4;
      }
    }
    else
    {
      uint64_t v14 = result + 1;
      char v15 = result + 17;
      do
      {
        char v16 = v14[v1 - 1];
        if ((char)v16[31] < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v17 = v16[*((unsigned __int8 *)v15 + v1 - 1) + 24];
        v14[v1] = (uint64_t *)v17;
        *((unsigned char *)v15 + v1) = *(unsigned char *)(v17 + 248) & 0x7F;
        LOBYTE(v1) = *((unsigned char *)result + 152) + 1;
        *((unsigned char *)result + 152) = v1;
      }
      while (*((unsigned __int8 *)v2 + 32) != v1);
      uint64_t v18 = (uint64_t)v15 + v1;
      char v19 = *(unsigned char *)(v18 - 1);
      uint64_t v5 = (char *)(v18 - 1);
      char v6 = v19;
    }
  }
  else
  {
    uint64_t v7 = *v2;
    *((unsigned char *)result + 152) = 0;
    if (*((unsigned char *)v2 + 32))
    {
      unsigned __int8 v8 = 0;
      uint64_t v9 = result + 1;
      do
      {
        v9[v8] = (uint64_t *)v7;
        *((unsigned char *)result + v8 + 136) = *(unsigned char *)(v7 + 248) & 0x7F;
        uint64_t v10 = *((unsigned __int8 *)result + 152);
        unsigned int v11 = *((unsigned __int8 *)v2 + 32);
        if (v10 + 1 != v11)
        {
          unsigned int v12 = v9[v10];
          if ((char)v12[31] < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          uint64_t v7 = v12[*((unsigned __int8 *)v12 + 248) + 24];
        }
        unsigned __int8 v8 = v10 + 1;
        *((unsigned char *)result + 152) = v8;
      }
      while (v11 > v8);
      uint64_t v13 = v8 - 1;
    }
    else
    {
      uint64_t v13 = -1;
    }
    uint64_t v5 = (char *)result + v13 + 136;
    char v6 = *v5;
  }
  char *v5 = v6 - 1;
  return result;
}

unsigned __int8 *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::prepareForInsertion(unsigned __int8 *result)
{
  uint64_t v1 = result[152];
  if (v1 != *(unsigned __int8 *)(*(void *)result + 32)) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion();
  }
  uint64_t v2 = result;
  char v3 = result + 8;
  if (*(char *)(*(void *)&result[8 * v1] + 248) >= 0) {
    int v4 = 6;
  }
  else {
    int v4 = 7;
  }
  if ((*(unsigned char *)(*(void *)&result[8 * v1] + 248) & 0x7F) == v4)
  {
    if (!result[152]) {
      goto LABEL_15;
    }
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    do
    {
      if (*(char *)(v3[v5] + 248) >= 0) {
        int v7 = 6;
      }
      else {
        int v7 = 7;
      }
      if ((*(unsigned char *)(v3[v5] + 248) & 0x7F) != v7) {
        unsigned int v6 = v5;
      }
      ++v5;
    }
    while (v1 != v5);
    if (!v6)
    {
LABEL_15:
      if (*(char *)(*v3 + 248) >= 0) {
        int v8 = 6;
      }
      else {
        int v8 = 7;
      }
      if ((*(unsigned char *)(*v3 + 248) & 0x7F) == v8)
      {
        uint64_t v9 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(*(void *)result + 8), 0x100uLL, 0x100uLL);
        __n128 result = (unsigned __int8 *)lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::NodeCore((uint64_t)v9, **(void **)v2);
        **(void **)uint64_t v2 = result;
        if (v2[152] && (__n128 result = (unsigned __int8 *)memmove(v2 + 137, v2 + 136, v2[152]), v2[152]))
        {
          __n128 result = (unsigned __int8 *)memmove(v3 + 1, v3, 8 * v2[152]);
          LOBYTE(v1) = v2[152] + 1;
        }
        else
        {
          LOBYTE(v1) = 1;
        }
        unsigned int v6 = 0;
        v2[136] = 0;
        uint64_t v10 = *(uint64_t **)v2;
        *((void *)v2 + 1) = **(void **)v2;
        ++*((unsigned char *)v10 + 32);
        v2[152] = v1;
      }
      else
      {
        unsigned int v6 = 0;
      }
    }
    if (v6 + 1 < v1)
    {
      unsigned int v11 = v2 + 136;
      uint64_t v12 = v6;
      do
      {
        int v13 = v12;
        __n128 result = (unsigned __int8 *)lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::splitChild(v3[v12], v11[v12], *(lsl::Lock ***)(*(void *)v2 + 8));
        uint64_t v14 = v3[v12];
        if (*(char *)(v14 + 248) < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v15 = v11[v12];
        uint64_t v16 = *(void *)(v14 + 8 * v15 + 192);
        unsigned int v17 = v2[v12 + 137];
        if (v17 > (*(unsigned char *)(v16 + 248) & 0x7Fu))
        {
          unsigned __int8 v18 = v15 + 1;
          v11[v12] = v18;
          v2[v12 + 137] = v17 + (~*(unsigned char *)(v16 + 248) | 0x80);
          uint64_t v19 = v3[v12];
          if (*(char *)(v19 + 248) < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          *(void *)&v2[8 * v12 + 16] = *(void *)(v19 + 8 * v18 + 192);
        }
        ++v12;
      }
      while (v13 + 2 < v2[152]);
    }
  }
  return result;
}

char *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::splitChild(uint64_t a1, unsigned int a2, lsl::Lock **this)
{
  if (*(char *)(a1 + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 248);
  if (v3 >= 6) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v5 = a1 + 192;
  uint64_t v6 = a1 + 192 + 8 * a2;
  char v7 = *(unsigned char *)(*(void *)v6 + 248);
  int v8 = v7 & 0x7F;
  if (v7 >= 0) {
    int v9 = 6;
  }
  else {
    int v9 = 7;
  }
  if (v8 != v9) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v11 = a2;
  if (v3 != a2)
  {
    uint64_t v12 = a1 + 32 * v3;
    uint64_t v13 = 32 * a2 - 32 * v3;
    uint64_t v14 = v12;
    do
    {
      int v15 = *(_DWORD *)(v14 - 32);
      v14 -= 32;
      *(_DWORD *)uint64_t v12 = v15;
      *(_OWORD *)(v12 + 8) = *(_OWORD *)(v12 - 24);
      *(void *)(v12 + 24) = *(void *)(v12 - 8);
      uint64_t v12 = v14;
      v13 += 32;
    }
    while (v13);
    a2 = *(unsigned __int8 *)(a1 + 248);
  }
  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v16 = v5 + 8 * a2;
  if (v16 != v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v16 - v6);
    LOBYTE(a2) = *(unsigned char *)(a1 + 248);
  }
  *(unsigned char *)(a1 + 248) = a2 + 1;
  uint64_t v17 = *(void *)v6;
  *(_DWORD *)(a1 + 32 * v11) = *(_DWORD *)(*(void *)v6 + 96);
  uint64_t v18 = a1 + 32 * v11;
  long long v19 = *(_OWORD *)(v17 + 104);
  *(void *)(v18 + 24) = *(void *)(v17 + 120);
  *(_OWORD *)(v18 + 8) = v19;
  __n128 result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  long long v21 = result;
  char v22 = *(unsigned char *)(*(void *)v6 + 248);
  result[248] = v22 & 0x80;
  if (v22 < 0)
  {
    for (uint64_t i = 0; i != 224; i += 32)
    {
      long long v26 = &result[i];
      *(_DWORD *)long long v26 = 0;
      *((void *)v26 + 2) = 0;
      *((void *)v26 + 3) = 0;
      *((void *)v26 + 1) = 0;
    }
  }
  else
  {
    for (uint64_t j = 0; j != 192; j += 32)
    {
      long long v24 = &result[j];
      *(_DWORD *)long long v24 = 0;
      *((void *)v24 + 2) = 0;
      *((void *)v24 + 3) = 0;
      *((void *)v24 + 1) = 0;
    }
  }
  if (*(char *)(a1 + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  char v27 = v8 - 4;
  long long v28 = (uint64_t *)(v5 + 8 * v11);
  v28[1] = (uint64_t)result;
  uint64_t v29 = *v28;
  uint64_t v30 = (v8 - 4);
  if ((_BYTE)v8 != 4)
  {
    uint64_t v31 = v29 + 32 * v30 + 128;
    uint64_t v32 = v29 + 128;
    uint64_t v33 = (uint64_t)result;
    do
    {
      *(_DWORD *)uint64_t v33 = *(_DWORD *)v32;
      long long v34 = *(_OWORD *)(v32 + 8);
      *(void *)(v33 + 24) = *(void *)(v32 + 24);
      *(_OWORD *)(v33 + 8) = v34;
      v32 += 32;
      v33 += 32;
    }
    while (v32 != v31);
    uint64_t v29 = *(void *)v6;
  }
  int v35 = *(char *)(v29 + 248);
  if ((v35 & 0x80000000) == 0)
  {
    if (result[248] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    uint64_t v36 = v29 + 8 * v30 + 232;
    if (v36 != v29 + 224)
    {
      __n128 result = (char *)memmove(result + 192, (const void *)(v29 + 224), v36 - (v29 + 224));
      uint64_t v29 = *(void *)v6;
      LOBYTE(v35) = *(unsigned char *)(*(void *)v6 + 248);
    }
  }
  *(unsigned char *)(v29 + 248) = v35 + ~v27;
  char v37 = v21[248] + v27;
  v21[248] = v37;
  if (v37 >= 0) {
    int v38 = 6;
  }
  else {
    int v38 = 7;
  }
  if ((v37 & 0x7F) == v38
    || ((char v39 = *(unsigned char *)(v29 + 248), v40 = v39, v41 = v39 & 0x7F, v40 >= 0) ? (v42 = 6) : (v42 = 7), v41 == v42))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::NodeCore(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 0;
  *(unsigned char *)(result + 248) = 0;
  do
  {
    uint64_t v3 = result + v2;
    *(_DWORD *)uint64_t v3 = 0;
    *(void *)(v3 + 16) = 0;
    *(void *)(v3 + 24) = 0;
    *(void *)(v3 + 8) = 0;
    v2 += 32;
  }
  while (v2 != 192);
  if (*(char *)(result + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  *(void *)(result + 192) = a2;
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator(uint64_t result, uint64_t *a2, unsigned int *a3)
{
  *(void *)__n128 result = a2;
  *(_OWORD *)(result + 8) = 0u;
  uint64_t v3 = result + 8;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 72) = 0u;
  *(_OWORD *)(result + 88) = 0u;
  *(_OWORD *)(result + 104) = 0u;
  *(_OWORD *)(result + 120) = 0u;
  *(_OWORD *)(result + 136) = 0u;
  *(unsigned char *)(result + 152) = 0;
  if (*((unsigned char *)a2 + 32))
  {
    unint64_t v4 = 0;
    uint64_t v5 = *a2;
    uint64_t v6 = result + 136;
    do
    {
      *(void *)(v3 + 8 * v4) = v5;
      unint64_t v7 = *(unsigned char *)(v5 + 248) & 0x7F;
      if ((*(unsigned char *)(v5 + 248) & 0x7F) != 0)
      {
        int v8 = (_DWORD *)v5;
        do
        {
          unint64_t v9 = v7 >> 1;
          uint64_t v10 = &v8[8 * (v7 >> 1)];
          unsigned int v12 = *v10;
          uint64_t v11 = v10 + 8;
          v7 += ~(v7 >> 1);
          if (v12 < *a3) {
            int v8 = v11;
          }
          else {
            unint64_t v7 = v9;
          }
        }
        while (v7);
      }
      else
      {
        int v8 = (_DWORD *)(v5 + 32 * v7);
      }
      __int16 v13 = (_WORD)v8 - v5;
      unint64_t v14 = ((unint64_t)v8 - v5) >> 5;
      *(unsigned char *)(v6 + v4) = v14;
      uint64_t v15 = *(void *)(v3 + 8 * v4);
      if ((*(unsigned char *)(v15 + 248) & 0x7F) != v14 && *(_DWORD *)(v15 + (v13 & 0x1FE0)) < *a3)
      {
        *(unsigned char *)(result + 152) = v4 + 1;
        return result;
      }
      unint64_t v16 = *((unsigned __int8 *)a2 + 32);
      if (v4 + 1 != v16)
      {
        if ((*(unsigned char *)(v15 + 248) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v5 = *(void *)(v15 + 8 * v14 + 192);
      }
      ++v4;
    }
    while (v4 < v16);
    for (*(unsigned char *)(result + 152) = v16; (_BYTE)v16; *(unsigned char *)(result + 152) = v16)
    {
      if (*(unsigned char *)(v6 + v16 - 1) != (*(unsigned char *)(*(void *)(result
                                                                                            + 8 * v16)
                                                                                + 248) & 0x7F))
        break;
      LOBYTE(v16) = v16 - 1;
    }
  }
  return result;
}

double lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::find@<D0>(uint64_t *a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = *MEMORY[0x1E4F14BF8];
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator((uint64_t)&v23, a1, a2);
  __int16 v13 = a1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v23, (uint64_t)&v13)&& (unsigned __int8 v6 = v32, *a2 >= *(_DWORD *)(*((void *)v24 + v32 - 1) + 24 * v31[v32 - 1])))
  {
    long long v8 = v28;
    *(_OWORD *)(a3 + 72) = v27;
    *(_OWORD *)(a3 + 88) = v8;
    *(_OWORD *)(a3 + 104) = v29;
    long long v9 = v24[1];
    *(_OWORD *)(a3 + 8) = v24[0];
    *(_OWORD *)(a3 + 24) = v9;
    double result = *(double *)&v25;
    long long v10 = v26;
    *(_OWORD *)(a3 + 40) = v25;
    *(void *)a3 = v23;
    uint64_t v11 = v30;
    *(_OWORD *)(a3 + 56) = v10;
    *(void *)(a3 + 135) = *(void *)&v31[7];
    uint64_t v12 = *(void *)v31;
    *(void *)(a3 + 120) = v11;
    *(void *)(a3 + 128) = v12;
    *(unsigned char *)(a3 + 143) = v6;
  }
  else
  {
    *(void *)a3 = a1;
    double result = 0.0;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(_OWORD *)(a3 + 120) = 0u;
    *(void *)(a3 + 136) = 0;
  }
  return result;
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::erase@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(unsigned __int8 *)(a2 + 143);
  int v7 = *(unsigned __int8 *)(a1 + 32);
  unsigned int v8 = v6;
  if (v6 != v7)
  {
    uint64_t v9 = *(void *)(a2 + 8 + 8 * (v6 - 1)) + 24 * *(unsigned __int8 *)(a2 + 128 + v6 - 1);
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++((uint64_t **)a2);
    uint64_t v10 = *(void *)(a2 + 8 + 8 * (*(unsigned __int8 *)(a2 + 143) - 1))
        + 24 * *(unsigned __int8 *)(a2 + 128 + *(unsigned __int8 *)(a2 + 143) - 1);
    int v11 = *(_DWORD *)v9;
    *(_DWORD *)uint64_t v9 = *(_DWORD *)v10;
    *(_DWORD *)uint64_t v10 = v11;
    long long v12 = *(_OWORD *)(v9 + 8);
    *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
    *(_OWORD *)(v10 + 8) = v12;
    unsigned int v8 = *(unsigned __int8 *)(a2 + 143);
  }
  uint64_t v13 = v8 - 1;
  uint64_t v14 = *(void *)(a2 + 8 + 8 * v13);
  if ((*(char *)(v14 + 240) & 0x80000000) == 0) {
    lsl::BTree<int,std::less<int>,false>::erase();
  }
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::erase(v14, *(unsigned __int8 *)(a2 + 128 + v13));
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::rebalanceFromErasure((char *)a2);
  if (v6 != v7) {
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--((uint64_t **)a2);
  }
  --*(void *)(a1 + 24);
  long long v15 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a3 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a3 + 88) = v15;
  *(_OWORD *)(a3 + 104) = *(_OWORD *)(a2 + 104);
  long long v16 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a3 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a3 + 24) = v16;
  __n128 result = *(__n128 *)(a2 + 40);
  long long v18 = *(_OWORD *)(a2 + 56);
  *(__n128 *)(a3 + 40) = result;
  *(void *)a3 = *(void *)a2;
  uint64_t v19 = *(void *)(a2 + 120);
  *(_OWORD *)(a3 + 56) = v18;
  uint64_t v20 = *(void *)(a2 + 128);
  *(void *)(a3 + 120) = v19;
  *(void *)(a3 + 128) = v20;
  *(void *)(a3 + 135) = *(void *)(a2 + 135);
  *(unsigned char *)(a3 + 143) = *(unsigned char *)(a2 + 143);
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::erase(uint64_t result, unsigned int a2)
{
  int v2 = *(char *)(result + 240);
  if ((v2 & 0x80000000) == 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase();
  }
  unsigned int v3 = v2 & 0x7F;
  if (v3 <= a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase();
  }
  if (result + 24 * a2 + 24 != result + 24 * (v2 & 0x7F))
  {
    unint64_t v4 = (_OWORD *)(result + 24 * a2 + 32);
    uint64_t v5 = 24 * v3 - 24 * a2 - 24;
    do
    {
      *((_DWORD *)v4 - 8) = *((_DWORD *)v4 - 2);
      *(_OWORD *)((char *)v4 - 24) = *v4;
      unint64_t v4 = (_OWORD *)((char *)v4 + 24);
      v5 -= 24;
    }
    while (v5);
    LOBYTE(v2) = *(unsigned char *)(result + 240);
  }
  *(unsigned char *)(result + 240) = v2 - 1;
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::rebalanceFromErasure(char *__dst)
{
  unsigned int v1 = __dst[143];
  uint64_t v2 = *(void *)__dst;
  if (v1 != *(unsigned __int8 *)(*(void *)__dst + 32)) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure();
  }
  if (v1 >= 2)
  {
    unsigned __int8 v4 = 0;
    uint64_t v5 = __dst + 8;
    uint64_t v6 = __dst + 128;
    do
    {
      uint64_t v7 = (v1 - v4 - 2);
      uint64_t v8 = v7 + 1;
      if (*(char *)(*(void *)&v5[8 * v7 + 8] + 240) >= 0) {
        unsigned int v9 = 3;
      }
      else {
        unsigned int v9 = 5;
      }
      if ((*(unsigned char *)(*(void *)&v5[8 * v7 + 8] + 240) & 0x7Fu) >= v9) {
        break;
      }
      uint64_t v10 = v6[v7];
      uint64_t v11 = *(void *)&v5[8 * v7];
      int v12 = *(char *)(v11 + 240);
      if (v10 == (v12 & 0x7F))
      {
        int v13 = 0;
        if (v6[v7]) {
          goto LABEL_10;
        }
      }
      else
      {
        if (v12 < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        if (*(char *)(*(void *)(v11 + 8 * v10 + 176) + 240) >= 0) {
          int v18 = -3;
        }
        else {
          int v18 = -5;
        }
        int v13 = v18 + (*(unsigned char *)(*(void *)(v11 + 8 * v10 + 176) + 240) & 0x7F);
        if (v6[v7])
        {
LABEL_10:
          if (v12 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          int v14 = *(char *)(*(void *)(v11 + 8 * v10 + 160) + 240);
          char v15 = v14 & 0x7F;
          if (v14 >= 0) {
            char v16 = -3;
          }
          else {
            char v16 = -5;
          }
          char v17 = v16 + v15;
          goto LABEL_21;
        }
      }
      char v17 = 0;
LABEL_21:
      if (v13 < 1 || v13 < v17)
      {
        if (v17 < 1 || v13 >= v17)
        {
          if (v10 == (v12 & 0x7F))
          {
            if (v12 < 0) {
              lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
            }
            v6[v7] = v10 - 1;
            v6[v8] += (*(unsigned char *)(*(void *)(v11 + 8 * (v10 - 1) + 168) + 240) & 0x7F) + 1;
            lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::merge(*(void *)&v5[8 * v7], *(lsl::Lock ***)(v2 + 8), (v10 - 1));
            uint64_t v21 = *(void *)&v5[8 * v7];
            if (*(char *)(v21 + 240) < 0) {
              lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
            }
            *(void *)&v5[8 * v8] = *(void *)(v21 + 8 * v6[v7] + 168);
          }
          else
          {
            lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::merge(v11, *(lsl::Lock ***)(v2 + 8), v10);
          }
        }
        else
        {
          if (v12 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          char v19 = *(unsigned char *)(*(void *)(v11 + 8 * v10 + 168) + 240);
          lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::rotateFromLeft((void *)v11, v6[v7]);
          uint64_t v20 = *(void *)&v5[8 * v7];
          if (*(char *)(v20 + 240) < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          v6[v8] += (*(unsigned char *)(*(void *)(v20 + 8 * v6[v7] + 168) + 240) & 0x7F) - (v19 & 0x7F);
        }
      }
      else
      {
        lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::rotateFromRight((char *)v11, v6[v7]);
      }
      ++v4;
      uint64_t v2 = *(void *)__dst;
      unsigned int v1 = *(unsigned __int8 *)(*(void *)__dst + 32);
    }
    while ((int)(v1 - 1) > v4);
  }
  uint64_t v22 = __dst + 8;
  if ((*(unsigned char *)(*((void *)__dst + 1) + 240) & 0x7F) != 0)
  {
    unsigned __int8 v23 = *(unsigned char *)(v2 + 32);
  }
  else
  {
    long long v24 = __dst + 128;
    if (__dst[128]) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure();
    }
    uint64_t v25 = __dst[143];
    if (&v24[v25] != __dst + 129)
    {
      memmove(v24, __dst + 129, v25 - 1);
      uint64_t v25 = __dst[143];
    }
    long long v26 = (unsigned __int8 *)&v22[v25];
    if (v26 != (unsigned __int8 *)(__dst + 16))
    {
      memmove(__dst + 8, __dst + 16, v26 - (unsigned __int8 *)(__dst + 16));
      LOBYTE(v25) = __dst[143];
    }
    __dst[143] = v25 - 1;
    lsl::Allocator::free(*(lsl::Lock ***)(v2 + 8), *(void **)v2);
    long long v27 = *(void **)__dst;
    unsigned __int8 v23 = *(unsigned char *)(*(void *)__dst + 32) - 1;
    *(unsigned char *)(*(void *)__dst + 32) = v23;
    if (__dst[143]) {
      *long long v27 = *v22;
    }
    else {
      *long long v27 = 0;
    }
  }
  if (v23)
  {
    uint64_t v28 = 0;
    do
    {
      if ((*(unsigned char *)(v22[(v23 + ~(_BYTE)v28)] + 240) & 0x7F) != __dst[(v23 + ~(_BYTE)v28)
                                                                                         + 128])
        break;
      --__dst[143];
      ++v28;
    }
    while (v23 != v28);
  }
}

char *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::rotateFromRight(char *result, int a2)
{
  if (result[240] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v2 = &result[8 * a2];
  uint64_t v4 = *((void *)v2 + 21);
  uint64_t v3 = *((void *)v2 + 22);
  int v5 = *(unsigned char *)(v3 + 240) & 0x7F;
  unsigned int v6 = v5 + (*(unsigned char *)(v4 + 240) & 0x7F);
  uint64_t v7 = &result[24 * a2];
  uint64_t v8 = v4 + 24 * (*(unsigned char *)(v4 + 240) & 0x7F);
  *(_DWORD *)uint64_t v8 = *(_DWORD *)v7;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)(v7 + 8);
  uint64_t v9 = (v5 - (v6 >> 1));
  uint64_t v10 = v3 + 24 * v9;
  *(_DWORD *)uint64_t v7 = *(_DWORD *)(v10 - 24);
  *(_OWORD *)(v7 + 8) = *(_OWORD *)(v10 - 16);
  if (v5 != v6 >> 1)
  {
    uint64_t v11 = (_OWORD *)(v4 + 24 * (*(unsigned char *)(v4 + 240) & 0x7F) + 32);
    uint64_t v12 = v3;
    do
    {
      *((_DWORD *)v11 - 2) = *(_DWORD *)v12;
      *uint64_t v11 = *(_OWORD *)(v12 + 8);
      uint64_t v11 = (_OWORD *)((char *)v11 + 24);
      v12 += 24;
    }
    while (v12 != v10);
  }
  if (v9 != (*(unsigned char *)(v3 + 240) & 0x7F))
  {
    uint64_t v13 = v3 + 24 * (*(unsigned char *)(v3 + 240) & 0x7F);
    uint64_t v14 = 24 * v9;
    uint64_t v15 = v3;
    do
    {
      *(_DWORD *)uint64_t v15 = *(_DWORD *)(v15 + 24 * v9);
      *(_OWORD *)(v15 + 8) = *(_OWORD *)(v15 + v14 + 8);
      uint64_t v16 = v15 + v14 + 24;
      v15 += 24;
    }
    while (v16 != v13);
  }
  if ((*(char *)(v4 + 240) & 0x80000000) == 0)
  {
    int v17 = *(char *)(v3 + 240);
    if (v17 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    if (v5 != v6 >> 1)
    {
      __n128 result = (char *)memmove((void *)(v4 + 8 * *(unsigned __int8 *)(v4 + 240) + 176), (const void *)(v3 + 168), 8 * v9);
      int v17 = *(char *)(v3 + 240);
      if (v17 < 0) {
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
      }
    }
    uint64_t v18 = v17 + 1;
    if (v18 != v9) {
      __n128 result = (char *)memmove((void *)(v3 + 168), (const void *)(v3 + 168 + 8 * v9), 8 * v18 - 8 * v9);
    }
  }
  *(unsigned char *)(v4 + 240) += v9;
  *(unsigned char *)(v3 + 240) -= v9;
  return result;
}

void *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::rotateFromLeft(void *result, unsigned int a2)
{
  if ((char)result[30] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v2 = a2 - 1;
  uint64_t v3 = result[v2 + 21];
  uint64_t v4 = result[a2 + 21];
  int v5 = *(unsigned char *)(v3 + 240) & 0x7F;
  uint64_t v6 = *(unsigned char *)(v4 + 240) & 0x7F;
  unsigned int v7 = v6 + v5;
  uint64_t v8 = (v5 - ((v6 + v5) >> 1));
  if ((*(unsigned char *)(v4 + 240) & 0x7F) != 0)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 24 * v6;
    uint64_t v11 = v4 + 24 * v8;
    uint64_t v12 = result[a2 + 21];
    do
    {
      uint64_t v13 = v11 + v10;
      *(_DWORD *)(v13 - 24) = *(_DWORD *)(v12 + v10 - 24);
      *(_OWORD *)(v13 - 16) = *(_OWORD *)(v12 + v10 - 16);
      v11 -= 24;
      v12 -= 24;
      v9 += 24;
    }
    while (v10 != v9);
    unsigned int v14 = *(unsigned char *)(v3 + 240) & 0x7F;
  }
  else
  {
    unsigned int v14 = *(unsigned char *)(v3 + 240) & 0x7F;
  }
  uint64_t v15 = v3 + 24 * v14;
  uint64_t v16 = v15 + 24 * -(int)v8 + 24;
  if (v16 != v15)
  {
    uint64_t v17 = v4;
    do
    {
      *(_DWORD *)uint64_t v17 = *(_DWORD *)v16;
      *(_OWORD *)(v17 + 8) = *(_OWORD *)(v16 + 8);
      v16 += 24;
      v17 += 24;
    }
    while (v16 != v15);
  }
  uint64_t v18 = (char *)&result[3 * (int)v2];
  uint64_t v19 = v4 + 24 * v8;
  *(_DWORD *)(v19 - 24) = *(_DWORD *)v18;
  *(_OWORD *)(v19 - 16) = *(_OWORD *)(v18 + 8);
  uint64_t v20 = v3 + 24 * ((*(unsigned char *)(v3 + 240) & 0x7F) - (int)v8);
  *(_DWORD *)uint64_t v18 = *(_DWORD *)v20;
  *(_OWORD *)(v18 + 8) = *(_OWORD *)(v20 + 8);
  int v21 = *(char *)(v3 + 240);
  if ((v21 & 0x80000000) == 0)
  {
    if (*(char *)(v4 + 240) < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    __n128 result = memmove((void *)(v4+ 168+ 8 * *(unsigned __int8 *)(v4 + 240)+ 8+ 8 * v8+ 8 * ~(unint64_t)*(unsigned __int8 *)(v4 + 240)), (const void *)(v4 + 168), 8 * *(unsigned __int8 *)(v4 + 240) + 8);
    int v21 = *(char *)(v3 + 240);
    if (v21 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    if (*(char *)(v4 + 240) < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    if (v5 != v7 >> 1)
    {
      __n128 result = memmove((void *)(v4 + 168), (const void *)(v3 + 8 * *(unsigned __int8 *)(v3 + 240) + 176 - 8 * v8), 8 * v8);
      LOBYTE(v21) = *(unsigned char *)(v3 + 240);
    }
  }
  *(unsigned char *)(v3 + 240) = v21 - v8;
  *(unsigned char *)(v4 + 240) += v8;
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<10u,7u>::merge(uint64_t a1, lsl::Lock **this, unsigned int a3)
{
  if (*(char *)(a1 + 240) < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge();
  }
  if (*(unsigned __int8 *)(a1 + 240) <= a3) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge();
  }
  int v5 = (void *)(a1 + 168 + 8 * a3);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v8 = a1 + 24 * a3;
  uint64_t v9 = *v5 + 24 * (*(unsigned char *)(*v5 + 240) & 0x7F);
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v8;
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v8 + 8);
  unsigned int v10 = *(unsigned __int8 *)(a1 + 240);
  unsigned int v11 = v10 & 0x7F;
  if (v8 + 24 != a1 + 24 * (v10 & 0x7F))
  {
    uint64_t v12 = (_OWORD *)(a1 + 24 * a3 + 32);
    uint64_t v13 = 24 * v11 - 24 * a3 - 24;
    do
    {
      *((_DWORD *)v12 - 8) = *((_DWORD *)v12 - 2);
      *(_OWORD *)((char *)v12 - 24) = *v12;
      uint64_t v12 = (_OWORD *)((char *)v12 + 24);
      v13 -= 24;
    }
    while (v13);
    unsigned int v10 = *(unsigned __int8 *)(a1 + 240);
  }
  if ((v10 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v14 = a1 + 168 + 8 * v10 + 8;
  if ((void *)v14 != v5 + 2) {
    memmove(v5 + 1, v5 + 2, v14 - (void)(v5 + 2));
  }
  unsigned int v15 = *(unsigned __int8 *)(v6 + 240);
  unsigned int v16 = *(unsigned __int8 *)(v7 + 240);
  if ((v15 & 0x7F) != 0)
  {
    uint64_t v17 = v6 + 24 * (v15 & 0x7F);
    uint64_t v18 = (_OWORD *)(v7 + 24 * (v16 & 0x7F) + 32);
    uint64_t v19 = v6;
    do
    {
      *((_DWORD *)v18 - 2) = *(_DWORD *)v19;
      *uint64_t v18 = *(_OWORD *)(v19 + 8);
      uint64_t v18 = (_OWORD *)((char *)v18 + 24);
      v19 += 24;
    }
    while (v19 != v17);
    unsigned int v16 = *(unsigned __int8 *)(v7 + 240);
    unsigned int v15 = *(unsigned __int8 *)(v6 + 240);
  }
  if ((v16 & 0x80) == 0)
  {
    if ((v15 & 0x80) != 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    memmove((void *)(v7 + 8 * v16 + 176), (const void *)(v6 + 168), 8 * v15 + 8);
    LOBYTE(v15) = *(unsigned char *)(v6 + 240);
    LOBYTE(v16) = *(unsigned char *)(v7 + 240);
  }
  *(unsigned char *)(v7 + 240) = (v15 & 0x7F) + v16 + 1;
  --*(unsigned char *)(a1 + 240);

  lsl::Allocator::free(this, (void *)v6);
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::find@<Q0>(uint64_t *a1@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v27 = *MEMORY[0x1E4F14BF8];
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::const_iterator((uint64_t)&v23, a1, a2);
  uint64_t v12 = a1;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  char v22 = 0;
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v23, (uint64_t)&v12)&& (unsigned __int8 v7 = v26, *a2 >= *(_DWORD *)(*((void *)v24 + v26 - 1) + 32 * v25.n128_u8[v26 - 1])))
  {
    long long v8 = v24[5];
    *(_OWORD *)(a3 + 72) = v24[4];
    *(_OWORD *)(a3 + 88) = v8;
    long long v9 = v24[7];
    *(_OWORD *)(a3 + 104) = v24[6];
    *(_OWORD *)(a3 + 120) = v9;
    long long v10 = v24[1];
    *(_OWORD *)(a3 + 8) = v24[0];
    *(_OWORD *)(a3 + 24) = v10;
    long long v11 = v24[3];
    *(_OWORD *)(a3 + 40) = v24[2];
    *(void *)a3 = v23;
    *(_OWORD *)(a3 + 56) = v11;
    __n128 result = v25;
    *(__n128 *)(a3 + 136) = v25;
    *(unsigned char *)(a3 + 152) = v7;
  }
  else
  {
    *(void *)a3 = a1;
    result.n128_u64[0] = 0;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(_OWORD *)(a3 + 120) = 0u;
    *(_OWORD *)(a3 + 136) = 0u;
    *(unsigned char *)(a3 + 152) = 0;
  }
  return result;
}

__n128 lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::erase@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = *(unsigned __int8 *)(a2 + 152);
  int v7 = *(unsigned __int8 *)(a1 + 32);
  unsigned int v8 = v6;
  if (v6 != v7)
  {
    uint64_t v9 = *(void *)(a2 + 8 + 8 * (v6 - 1)) + 32 * *(unsigned __int8 *)(a2 + 136 + v6 - 1);
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++((uint64_t **)a2);
    uint64_t v10 = *(void *)(a2 + 8 + 8 * (*(unsigned __int8 *)(a2 + 152) - 1))
        + 32 * *(unsigned __int8 *)(a2 + 136 + *(unsigned __int8 *)(a2 + 152) - 1);
    int v11 = *(_DWORD *)v9;
    *(_DWORD *)uint64_t v9 = *(_DWORD *)v10;
    *(_DWORD *)uint64_t v10 = v11;
    uint64_t v12 = *(void *)(v9 + 24);
    long long v13 = *(_OWORD *)(v9 + 8);
    uint64_t v14 = *(void *)(v10 + 24);
    *(_OWORD *)(v9 + 8) = *(_OWORD *)(v10 + 8);
    *(void *)(v9 + 24) = v14;
    *(_OWORD *)(v10 + 8) = v13;
    *(void *)(v10 + 24) = v12;
    unsigned int v8 = *(unsigned __int8 *)(a2 + 152);
  }
  uint64_t v15 = v8 - 1;
  uint64_t v16 = *(void *)(a2 + 8 + 8 * v15);
  if ((*(char *)(v16 + 248) & 0x80000000) == 0) {
    lsl::BTree<int,std::less<int>,false>::erase();
  }
  long long v17 = (__n128 *)(a2 + 136);
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::erase(v16, *(unsigned __int8 *)(a2 + 136 + v15));
  lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::rebalanceFromErasure((char *)a2);
  if (v6 != v7) {
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--((uint64_t **)a2);
  }
  --*(void *)(a1 + 24);
  long long v18 = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a3 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a3 + 88) = v18;
  long long v19 = *(_OWORD *)(a2 + 120);
  *(_OWORD *)(a3 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a3 + 120) = v19;
  long long v20 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a3 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a3 + 24) = v20;
  long long v21 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a3 + 40) = *(_OWORD *)(a2 + 40);
  *(void *)a3 = *(void *)a2;
  *(_OWORD *)(a3 + 56) = v21;
  __n128 result = *v17;
  *(__n128 *)(a3 + 136) = *v17;
  *(unsigned char *)(a3 + 152) = *(unsigned char *)(a2 + 152);
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::erase(uint64_t result, unsigned int a2)
{
  int v2 = *(char *)(result + 248);
  if ((v2 & 0x80000000) == 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase();
  }
  uint64_t v3 = v2 & 0x7F;
  if (v3 <= a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase();
  }
  uint64_t v4 = result + 32 * a2;
  if (v4 + 32 != result + 32 * v3)
  {
    uint64_t v5 = v4 + 40;
    uint64_t v6 = 32 * v3 - 32 * a2 - 32;
    do
    {
      *(_DWORD *)(v5 - 40) = *(_DWORD *)(v5 - 8);
      *(_OWORD *)(v5 - 32) = *(_OWORD *)v5;
      *(void *)(v5 - 16) = *(void *)(v5 + 16);
      v5 += 32;
      v6 -= 32;
    }
    while (v6);
    LOBYTE(v2) = *(unsigned char *)(result + 248);
  }
  *(unsigned char *)(result + 248) = v2 - 1;
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::rebalanceFromErasure(char *__dst)
{
  unsigned int v1 = __dst[152];
  uint64_t v2 = *(void *)__dst;
  if (v1 != *(unsigned __int8 *)(*(void *)__dst + 32)) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure();
  }
  if (v1 >= 2)
  {
    unsigned __int8 v4 = 0;
    uint64_t v5 = __dst + 8;
    uint64_t v6 = __dst + 136;
    do
    {
      uint64_t v7 = (v1 - v4 - 2);
      uint64_t v8 = v7 + 1;
      if ((*(unsigned char *)(*(void *)&v5[8 * v7 + 8] + 248) & 0x7Fu) > 2) {
        break;
      }
      uint64_t v9 = v6[v7];
      uint64_t v10 = *(void *)&v5[8 * v7];
      int v11 = *(char *)(v10 + 248);
      if (v9 == (v11 & 0x7F))
      {
        int v12 = 0;
        if (v6[v7]) {
          goto LABEL_7;
        }
      }
      else
      {
        if (v11 < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        int v12 = (*(unsigned char *)(*(void *)(v10 + 8 * v9 + 200) + 248) & 0x7F) - 3;
        if (v6[v7])
        {
LABEL_7:
          if (v11 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          char v13 = (*(unsigned char *)(*(void *)(v10 + 8 * v9 + 184) + 248) & 0x7F) - 3;
          goto LABEL_12;
        }
      }
      char v13 = 0;
LABEL_12:
      if (v12 < 1 || v12 < v13)
      {
        if (v13 < 1 || v12 >= v13)
        {
          if (v9 == (v11 & 0x7F))
          {
            if (v11 < 0) {
              lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
            }
            v6[v7] = v9 - 1;
            v6[v8] += (*(unsigned char *)(*(void *)(v10 + 8 * (v9 - 1) + 192) + 248) & 0x7F) + 1;
            lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::merge(*(void *)&v5[8 * v7], *(lsl::Lock ***)(v2 + 8), (v9 - 1));
            uint64_t v16 = *(void *)&v5[8 * v7];
            if (*(char *)(v16 + 248) < 0) {
              lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
            }
            *(void *)&v5[8 * v8] = *(void *)(v16 + 8 * v6[v7] + 192);
          }
          else
          {
            lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::merge(v10, *(lsl::Lock ***)(v2 + 8), v9);
          }
        }
        else
        {
          if (v11 < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          char v14 = *(unsigned char *)(*(void *)(v10 + 8 * v9 + 192) + 248);
          lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::rotateFromLeft((void *)v10, v6[v7]);
          uint64_t v15 = *(void *)&v5[8 * v7];
          if (*(char *)(v15 + 248) < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          v6[v8] += (*(unsigned char *)(*(void *)(v15 + 8 * v6[v7] + 192) + 248) & 0x7F) - (v14 & 0x7F);
        }
      }
      else
      {
        lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::rotateFromRight((char *)v10, v6[v7]);
      }
      ++v4;
      uint64_t v2 = *(void *)__dst;
      unsigned int v1 = *(unsigned __int8 *)(*(void *)__dst + 32);
    }
    while ((int)(v1 - 1) > v4);
  }
  long long v17 = __dst + 8;
  if ((*(unsigned char *)(*((void *)__dst + 1) + 248) & 0x7F) != 0)
  {
    unsigned __int8 v18 = *(unsigned char *)(v2 + 32);
  }
  else
  {
    long long v19 = __dst + 136;
    if (__dst[136]) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure();
    }
    uint64_t v20 = __dst[152];
    if (&v19[v20] != __dst + 137)
    {
      memmove(v19, __dst + 137, v20 - 1);
      uint64_t v20 = __dst[152];
    }
    long long v21 = (unsigned __int8 *)&v17[v20];
    if (v21 != (unsigned __int8 *)(__dst + 16))
    {
      memmove(__dst + 8, __dst + 16, v21 - (unsigned __int8 *)(__dst + 16));
      LOBYTE(v20) = __dst[152];
    }
    __dst[152] = v20 - 1;
    lsl::Allocator::free(*(lsl::Lock ***)(v2 + 8), *(void **)v2);
    char v22 = *(void **)__dst;
    unsigned __int8 v18 = *(unsigned char *)(*(void *)__dst + 32) - 1;
    *(unsigned char *)(*(void *)__dst + 32) = v18;
    if (__dst[152]) {
      void *v22 = *v17;
    }
    else {
      void *v22 = 0;
    }
  }
  if (v18)
  {
    uint64_t v23 = 0;
    do
    {
      if ((*(unsigned char *)(v17[(v18 + ~(_BYTE)v23)] + 248) & 0x7F) != __dst[(v18 + ~(_BYTE)v23)
                                                                                         + 136])
        break;
      --__dst[152];
      ++v23;
    }
    while (v18 != v23);
  }
}

char *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::rotateFromRight(char *result, int a2)
{
  if (result[248] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v2 = &result[8 * a2];
  uint64_t v4 = *((void *)v2 + 24);
  uint64_t v3 = *((void *)v2 + 25);
  uint64_t v5 = *(unsigned char *)(v4 + 248) & 0x7F;
  int v6 = *(unsigned char *)(v3 + 248) & 0x7F;
  unsigned int v7 = v6 + v5;
  uint64_t v8 = &result[32 * a2];
  uint64_t v9 = v4 + 32 * v5;
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v8;
  uint64_t v10 = *((void *)v8 + 3);
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v8 + 8);
  *(void *)(v9 + 24) = v10;
  uint64_t v11 = (v6 - (v7 >> 1));
  uint64_t v12 = v3 + 32 * v11;
  *(_DWORD *)uint64_t v8 = *(_DWORD *)(v12 - 32);
  long long v13 = *(_OWORD *)(v12 - 24);
  *((void *)v8 + 3) = *(void *)(v12 - 8);
  *(_OWORD *)(v8 + 8) = v13;
  if (v6 != v7 >> 1)
  {
    uint64_t v14 = v4 + 32 * (*(unsigned char *)(v4 + 248) & 0x7F) + 40;
    uint64_t v15 = v3;
    do
    {
      *(_DWORD *)(v14 - 8) = *(_DWORD *)v15;
      long long v16 = *(_OWORD *)(v15 + 8);
      *(void *)(v14 + 16) = *(void *)(v15 + 24);
      *(_OWORD *)uint64_t v14 = v16;
      v14 += 32;
      v15 += 32;
    }
    while (v15 != v12);
  }
  uint64_t v17 = *(unsigned char *)(v3 + 248) & 0x7F;
  if (v11 != v17)
  {
    uint64_t v18 = 32 * v11;
    uint64_t v19 = v3;
    uint64_t v20 = v3 + 32 * v17;
    do
    {
      *(_DWORD *)uint64_t v19 = *(_DWORD *)(v19 + 32 * v11);
      uint64_t v21 = *(void *)(v19 + v18 + 24);
      *(_OWORD *)(v19 + 8) = *(_OWORD *)(v19 + v18 + 8);
      *(void *)(v19 + 24) = v21;
      uint64_t v22 = v19 + v18 + 32;
      v19 += 32;
    }
    while (v22 != v20);
  }
  if ((*(char *)(v4 + 248) & 0x80000000) == 0)
  {
    int v23 = *(char *)(v3 + 248);
    if (v23 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    if (v6 != v7 >> 1)
    {
      __n128 result = (char *)memmove((void *)(v4 + 8 * *(unsigned __int8 *)(v4 + 248) + 200), (const void *)(v3 + 192), 8 * v11);
      int v23 = *(char *)(v3 + 248);
      if (v23 < 0) {
        lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
      }
    }
    uint64_t v24 = v23 + 1;
    if (v24 != v11) {
      __n128 result = (char *)memmove((void *)(v3 + 192), (const void *)(v3 + 192 + 8 * v11), 8 * v24 - 8 * v11);
    }
  }
  *(unsigned char *)(v4 + 248) += v11;
  *(unsigned char *)(v3 + 248) -= v11;
  return result;
}

void *lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::rotateFromLeft(void *result, unsigned int a2)
{
  if ((char)result[31] < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v2 = a2 - 1;
  uint64_t v3 = result[v2 + 24];
  uint64_t v4 = result[a2 + 24];
  int v5 = *(unsigned char *)(v3 + 248) & 0x7F;
  uint64_t v6 = *(unsigned char *)(v4 + 248) & 0x7F;
  unsigned int v7 = v6 + v5;
  uint64_t v8 = (v5 - ((v6 + v5) >> 1));
  if ((*(unsigned char *)(v4 + 248) & 0x7F) != 0)
  {
    uint64_t v9 = 0;
    uint64_t v10 = 32 * v6;
    uint64_t v11 = result[a2 + 24];
    uint64_t v12 = v4 + 32 * v8;
    do
    {
      uint64_t v13 = v12 + v10;
      *(_DWORD *)(v13 - 32) = *(_DWORD *)(v11 + v10 - 32);
      long long v14 = *(_OWORD *)(v11 + v10 - 24);
      *(void *)(v13 - 8) = *(void *)(v11 + v10 - 8);
      *(_OWORD *)(v13 - 24) = v14;
      v12 -= 32;
      v11 -= 32;
      v9 += 32;
    }
    while (v10 != v9);
    unsigned int v15 = *(unsigned char *)(v3 + 248) & 0x7F;
  }
  else
  {
    unsigned int v15 = *(unsigned char *)(v3 + 248) & 0x7F;
  }
  uint64_t v16 = v3 + 32 * v15;
  uint64_t v17 = v16 - 32 * v8 + 32;
  if (v17 != v16)
  {
    uint64_t v18 = v4;
    do
    {
      *(_DWORD *)uint64_t v18 = *(_DWORD *)v17;
      long long v19 = *(_OWORD *)(v17 + 8);
      *(void *)(v18 + 24) = *(void *)(v17 + 24);
      *(_OWORD *)(v18 + 8) = v19;
      v17 += 32;
      v18 += 32;
    }
    while (v17 != v16);
  }
  uint64_t v20 = (char *)&result[4 * v2];
  uint64_t v21 = v4 + 32 * v8;
  *(_DWORD *)(v21 - 32) = *(_DWORD *)v20;
  long long v22 = *(_OWORD *)(v20 + 8);
  *(void *)(v21 - 8) = *((void *)v20 + 3);
  *(_OWORD *)(v21 - 24) = v22;
  uint64_t v23 = v3 + 32 * ((*(unsigned char *)(v3 + 248) & 0x7F) - v8);
  *(_DWORD *)uint64_t v20 = *(_DWORD *)v23;
  long long v24 = *(_OWORD *)(v23 + 8);
  *((void *)v20 + 3) = *(void *)(v23 + 24);
  *(_OWORD *)(v20 + 8) = v24;
  int v25 = *(char *)(v3 + 248);
  if ((v25 & 0x80000000) == 0)
  {
    if (*(char *)(v4 + 248) < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    __n128 result = memmove((void *)(v4+ 192+ 8 * *(unsigned __int8 *)(v4 + 248)+ 8+ 8 * v8+ 8 * ~(unint64_t)*(unsigned __int8 *)(v4 + 248)), (const void *)(v4 + 192), 8 * *(unsigned __int8 *)(v4 + 248) + 8);
    int v25 = *(char *)(v3 + 248);
    if (v25 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    if (*(char *)(v4 + 248) < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    if (v5 != v7 >> 1)
    {
      __n128 result = memmove((void *)(v4 + 192), (const void *)(v3 + 8 * *(unsigned __int8 *)(v3 + 248) + 200 - 8 * v8), 8 * v8);
      LOBYTE(v25) = *(unsigned char *)(v3 + 248);
    }
  }
  *(unsigned char *)(v3 + 248) = v25 - v8;
  *(unsigned char *)(v4 + 248) += v8;
  return result;
}

void lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessNotifierRecord,std::less<unsigned int>>::value_compare,false>::NodeCore<7u,6u>::merge(uint64_t a1, lsl::Lock **this, unsigned int a3)
{
  if (*(char *)(a1 + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge();
  }
  if (*(unsigned __int8 *)(a1 + 248) <= a3) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge();
  }
  int v5 = (void *)(a1 + 192 + 8 * a3);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v8 = a1 + 32 * a3;
  uint64_t v9 = *v5 + 32 * (*(unsigned char *)(*v5 + 248) & 0x7F);
  *(_DWORD *)uint64_t v9 = *(_DWORD *)v8;
  uint64_t v10 = *(void *)(v8 + 24);
  *(_OWORD *)(v9 + 8) = *(_OWORD *)(v8 + 8);
  *(void *)(v9 + 24) = v10;
  unsigned int v11 = *(unsigned __int8 *)(a1 + 248);
  uint64_t v12 = v11 & 0x7F;
  if (v8 + 32 != a1 + 32 * v12)
  {
    uint64_t v13 = v8 + 40;
    uint64_t v14 = 32 * v12 - 32 * a3 - 32;
    do
    {
      *(_DWORD *)(v13 - 40) = *(_DWORD *)(v13 - 8);
      *(_OWORD *)(v13 - 32) = *(_OWORD *)v13;
      *(void *)(v13 - 16) = *(void *)(v13 + 16);
      v13 += 32;
      v14 -= 32;
    }
    while (v14);
    unsigned int v11 = *(unsigned __int8 *)(a1 + 248);
  }
  if ((v11 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v15 = a1 + 192 + 8 * v11 + 8;
  if ((void *)v15 != v5 + 2) {
    memmove(v5 + 1, v5 + 2, v15 - (void)(v5 + 2));
  }
  unsigned int v16 = *(unsigned __int8 *)(v6 + 248);
  unsigned int v17 = *(unsigned __int8 *)(v7 + 248);
  if ((v16 & 0x7F) != 0)
  {
    uint64_t v18 = v6 + 32 * (v16 & 0x7F);
    uint64_t v19 = v7 + 32 * (v17 & 0x7F) + 40;
    uint64_t v20 = v6;
    do
    {
      *(_DWORD *)(v19 - 8) = *(_DWORD *)v20;
      long long v21 = *(_OWORD *)(v20 + 8);
      *(void *)(v19 + 16) = *(void *)(v20 + 24);
      *(_OWORD *)uint64_t v19 = v21;
      v19 += 32;
      v20 += 32;
    }
    while (v20 != v18);
    unsigned int v17 = *(unsigned __int8 *)(v7 + 248);
    unsigned int v16 = *(unsigned __int8 *)(v6 + 248);
  }
  if ((v17 & 0x80) == 0)
  {
    if ((v16 & 0x80) != 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    memmove((void *)(v7 + 8 * v17 + 200), (const void *)(v6 + 192), 8 * v16 + 8);
    LOBYTE(v16) = *(unsigned char *)(v6 + 248);
    LOBYTE(v17) = *(unsigned char *)(v7 + 248);
  }
  *(unsigned char *)(v7 + 248) = (v16 & 0x7F) + v17 + 1;
  --*(unsigned char *)(a1 + 248);

  lsl::Allocator::free(this, (void *)v6);
}

lsl::Allocator ***lsl::UniquePtr<dyld4::Atlas::Bitmap>::~UniquePtr(lsl::Allocator ***a1, void *a2)
{
  uint64_t v3 = *a1;
  if (v3)
  {
    if (v3[1])
    {
      lsl::Allocator::freeObject(v3[1], a2);
      uint64_t v3 = *a1;
    }
    lsl::Allocator::freeObject((lsl::Allocator *)v3, a2);
  }
  return a1;
}

void lsl::Vector<lsl::UUID>::resize(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) >= a2)
  {
    if (a2)
    {
      *(void *)(a1 + 16) = a2;
      *(void *)(a1 + 24) = a2;
      uint64_t v2 = *(void **)(a1 + 8);
      uint64_t v3 = *(lsl::Lock ***)a1;
      lsl::Allocator::realloc(v3, v2, 16 * a2);
    }
    else
    {
      int v5 = (void *)(a1 + 8);
      uint64_t v4 = *(void **)(a1 + 8);
      if (v4) {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v4);
      }
      void *v5 = 0;
      v5[1] = 0;
      v5[2] = 0;
    }
  }
  else
  {
    lsl::Vector<lsl::UUID>::reserve(a1, a2);
  }
}

void lsl::Vector<lsl::UUID>::reserve(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if (a2 >= 0x10)
    {
      unint64_t v3 = (a2 - 1) | ((a2 - 1) >> 1) | (((a2 - 1) | ((a2 - 1) >> 1)) >> 2);
      unint64_t v4 = v3 | (v3 >> 4) | ((v3 | (v3 >> 4)) >> 8);
      unint64_t v2 = (v4 | (v4 >> 16) | ((v4 | (v4 >> 16)) >> 32)) + 1;
    }
    else
    {
      unint64_t v2 = 16;
    }
    lsl::Vector<lsl::UUID>::reserveExact(a1, v2);
  }
}

void lsl::Vector<lsl::UUID>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if ((lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), 16 * a2) & 1) == 0)
    {
      unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, 16 * a2);
      int v5 = v4;
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        uint64_t v7 = 0;
        for (unint64_t i = 0; i < v6; ++i)
        {
          *(_OWORD *)&v4[v7] = *(_OWORD *)(*(void *)(a1 + 8) + v7 * 8);
          unint64_t v6 = *(void *)(a1 + 16);
          v7 += 2;
        }
      }
      uint64_t v9 = *(void **)(a1 + 8);
      if (v9)
      {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v9);
        unint64_t v6 = *(void *)(a1 + 16);
      }
      if (v6 >= a2) {
        unint64_t v6 = a2;
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v6;
    }
    *(void *)(a1 + 24) = a2;
  }
}

lsl::Allocator **lsl::UniquePtr<dyld4::Atlas::Image>::~UniquePtr(lsl::Allocator **a1)
{
  unint64_t v2 = *a1;
  if (*a1)
  {
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v2 + 112);
    unint64_t v4 = (lsl::Allocator *)*((void *)v2 + 11);
    if (v4) {
      lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(v4, v3);
    }
    dyld4::FileRecord::~FileRecord((lsl::Allocator *)((char *)v2 + 8));
    lsl::Allocator::freeObject(*a1, v5);
  }
  return a1;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::insert_internal@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v24 = *MEMORY[0x1E4F14BF8];
  if (*(void *)a1)
  {
    uint64_t v18 = a1;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    memset(v23, 0, sizeof(v23));
    uint64_t result = lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>(a2, (uint64_t)&v18);
    if ((_BYTE)result
      && (uint64_t v9 = *(unsigned __int8 *)(a2 + 98),
          *(void *)(*a3 + 160) >= *(void *)(*(void *)(*(void *)(a2 + 8 + 8 * (v9 - 1))
                                                          + 8 * *(unsigned __int8 *)(a2 + 88 + v9 - 1))
                                              + 160)))
    {
      char v14 = 0;
      long long v16 = *(_OWORD *)(a2 + 8);
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      long long v17 = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = v17;
      *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 8) = v16;
      *(void *)(a4 + 88) = *(void *)(a2 + 88);
      *(_WORD *)(a4 + 96) = *(_WORD *)(a2 + 96);
      *(unsigned char *)(a4 + 98) = v9;
    }
    else
    {
      uint64_t v18 = a1;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      memset(v23, 0, sizeof(v23));
      if (lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator<=>(a2, (uint64_t)&v18)&& *(unsigned __int8 *)(a2 + 98) == *(unsigned __int8 *)(a1 + 32))
      {
        lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
        uint64_t v10 = a2 + 88;
        uint64_t v11 = *(unsigned __int8 *)(a2 + 98) - 1;
        unsigned __int8 v12 = *(unsigned char *)(a2 + 88 + v11);
      }
      else
      {
        lsl::BTree<char const*,lsl::ConstCharStarCompare,false>::const_iterator::operator--((uint64_t **)a2);
        lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
        uint64_t v10 = a2 + 88;
        uint64_t v15 = *(unsigned __int8 *)(a2 + 98) + a2 + 88;
        unsigned __int8 v12 = *(unsigned char *)(v15 - 1) + 1;
        *(unsigned char *)(v15 - 1) = v12;
        uint64_t v11 = *(unsigned __int8 *)(a2 + 98) - 1;
      }
      uint64_t result = lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::insert(*(void *)(a2 + 8 + 8 * v11), v12, a3);
      ++*(void *)(a1 + 24);
      *(void *)a4 = *(void *)a2;
      *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
      *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
      *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
      *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
      *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
      *(void *)(a4 + 88) = *(void *)v10;
      *(_WORD *)(a4 + 96) = *(_WORD *)(v10 + 8);
      *(unsigned char *)(a4 + 98) = *(unsigned char *)(a2 + 98);
      char v14 = 1;
    }
  }
  else
  {
    uint64_t v13 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    *((unsigned char *)v13 + 248) = 0x80;
    *(_OWORD *)uint64_t v13 = 0u;
    *((_OWORD *)v13 + 1) = 0u;
    *((_OWORD *)v13 + 2) = 0u;
    *((_OWORD *)v13 + 3) = 0u;
    *((_OWORD *)v13 + 4) = 0u;
    *((_OWORD *)v13 + 5) = 0u;
    *((_OWORD *)v13 + 6) = 0u;
    *((_OWORD *)v13 + 7) = 0u;
    *((_OWORD *)v13 + 8) = 0u;
    *((_OWORD *)v13 + 9) = 0u;
    *((_OWORD *)v13 + 10) = 0u;
    *((_OWORD *)v13 + 11) = 0u;
    *((_OWORD *)v13 + 12) = 0u;
    *((_OWORD *)v13 + 13) = 0u;
    *((_OWORD *)v13 + 14) = 0u;
    v13[30] = 0;
    *(void *)a1 = v13;
    char v14 = 1;
    *(unsigned char *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v13;
    *(unsigned char *)(a2 + 98) = 1;
    uint64_t result = lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::insert((uint64_t)v13, 0, a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(void *)(a4 + 88) = *(void *)(a2 + 88);
    *(_WORD *)(a4 + 96) = *(_WORD *)(a2 + 96);
    *(unsigned char *)(a4 + 98) = *(unsigned char *)(a2 + 98);
  }
  *(unsigned char *)(a4 + 104) = v14;
  return result;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::insert(uint64_t result, unsigned int a2, uint64_t *a3)
{
  int v3 = *(char *)(result + 248);
  int v4 = v3 & 0x7F;
  if (v3 >= 0) {
    int v5 = 15;
  }
  else {
    int v5 = 31;
  }
  if (v4 == v5) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  if (v5 == a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  unint64_t v6 = (uint64_t *)(result + 8 * a2);
  if (v4 != a2)
  {
    uint64_t v7 = (uint64_t *)(result + 8 * (v3 & 0x7F));
    uint64_t v10 = *v7;
    uint64_t v8 = v7 - 1;
    uint64_t v9 = v10;
    uint64_t v11 = 8 * a2 - 8 * (v3 & 0x7F);
    do
    {
      uint64_t v12 = *v8;
      *uint64_t v8 = v9;
      v8[1] = v12;
      --v8;
      v11 += 8;
    }
    while (v11);
  }
  *(unsigned char *)(result + 248) = v3 + 1;
  if (v6 != a3)
  {
    uint64_t v13 = *v6;
    *unint64_t v6 = *a3;
    *a3 = v13;
  }
  return result;
}

unsigned __int8 *lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::prepareForInsertion(unsigned __int8 *result)
{
  uint64_t v1 = result[98];
  if (v1 != *(unsigned __int8 *)(*(void *)result + 32)) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion();
  }
  unint64_t v2 = result;
  int v3 = result + 8;
  if (*(char *)(*(void *)&result[8 * v1] + 248) >= 0) {
    int v4 = 15;
  }
  else {
    int v4 = 31;
  }
  if ((*(unsigned char *)(*(void *)&result[8 * v1] + 248) & 0x7F) == v4)
  {
    if (!result[98]) {
      goto LABEL_15;
    }
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    do
    {
      if (*(char *)(v3[v5] + 248) >= 0) {
        int v7 = 15;
      }
      else {
        int v7 = 31;
      }
      if ((*(unsigned char *)(v3[v5] + 248) & 0x7F) != v7) {
        unsigned int v6 = v5;
      }
      ++v5;
    }
    while (v1 != v5);
    if (!v6)
    {
LABEL_15:
      if (*(char *)(*v3 + 248) >= 0) {
        int v8 = 15;
      }
      else {
        int v8 = 31;
      }
      if ((*(unsigned char *)(*v3 + 248) & 0x7F) == v8)
      {
        uint64_t v9 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(*(void *)result + 8), 0x100uLL, 0x100uLL);
        uint64_t result = (unsigned __int8 *)lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::NodeCore((uint64_t)v9, **(void **)v2);
        **(void **)unint64_t v2 = result;
        if (v2[98] && (uint64_t result = (unsigned __int8 *)memmove(v2 + 89, v2 + 88, v2[98]), v2[98]))
        {
          uint64_t result = (unsigned __int8 *)memmove(v3 + 1, v3, 8 * v2[98]);
          LOBYTE(v1) = v2[98] + 1;
        }
        else
        {
          LOBYTE(v1) = 1;
        }
        unsigned int v6 = 0;
        v2[88] = 0;
        uint64_t v10 = *(uint64_t **)v2;
        *((void *)v2 + 1) = **(void **)v2;
        ++*((unsigned char *)v10 + 32);
        v2[98] = v1;
      }
      else
      {
        unsigned int v6 = 0;
      }
    }
    if (v6 + 1 < v1)
    {
      uint64_t v11 = v2 + 88;
      uint64_t v12 = v6;
      do
      {
        int v13 = v12;
        uint64_t result = (unsigned __int8 *)lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::splitChild(v3[v12], v11[v12], *(lsl::Lock ***)(*(void *)v2 + 8));
        uint64_t v14 = v3[v12];
        if (*(char *)(v14 + 248) < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v15 = v11[v12];
        uint64_t v16 = *(void *)(v14 + 8 * v15 + 120);
        unsigned int v17 = v2[v12 + 89];
        if (v17 > (*(unsigned char *)(v16 + 248) & 0x7Fu))
        {
          unsigned __int8 v18 = v15 + 1;
          v11[v12] = v18;
          v2[v12 + 89] = v17 + (~*(unsigned char *)(v16 + 248) | 0x80);
          uint64_t v19 = v3[v12];
          if (*(char *)(v19 + 248) < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          *(void *)&v2[8 * v12 + 16] = *(void *)(v19 + 8 * v18 + 120);
        }
        ++v12;
      }
      while (v13 + 2 < v2[98]);
    }
  }
  return result;
}

char *lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::splitChild(uint64_t a1, unsigned int a2, lsl::Lock **this)
{
  if (*(char *)(a1 + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 248);
  if (v3 >= 0xF) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v5 = a1 + 120;
  uint64_t v6 = a1 + 120 + 8 * a2;
  char v7 = *(unsigned char *)(*(void *)v6 + 248);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 15;
  }
  else {
    int v10 = 31;
  }
  if (v9 != v10) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v12 = *(unsigned __int8 *)(a1 + 248);
  uint64_t v13 = v12 + 1;
  uint64_t v14 = a2;
  if (v8 >= 0) {
    uint64_t v15 = 7;
  }
  else {
    uint64_t v15 = 15;
  }
  if (v3 != a2)
  {
    uint64_t v16 = (uint64_t *)(a1 + 8 * v12);
    uint64_t v19 = *v16;
    unsigned int v17 = v16 - 1;
    uint64_t v18 = v19;
    uint64_t v20 = 8 * a2 - 8 * v12;
    do
    {
      uint64_t v21 = *v17;
      *unsigned int v17 = v18;
      v17[1] = v21;
      --v17;
      v20 += 8;
    }
    while (v20);
  }
  long long v22 = (uint64_t *)(a1 + 8 * a2);
  uint64_t v23 = v5 + 8 * v13;
  if (v23 != v6 + 8)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v23 - (v6 + 8));
    LOBYTE(v3) = *(unsigned char *)(a1 + 248);
  }
  *(unsigned char *)(a1 + 248) = v3 + 1;
  uint64_t v24 = (uint64_t *)(*(void *)v6 + 8 * v15);
  if (v24 != v22)
  {
    uint64_t v25 = *v22;
    uint64_t *v22 = *v24;
    uint64_t *v24 = v25;
  }
  uint64_t result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  uint64_t v27 = result;
  int v28 = *(char *)(*(void *)v6 + 248);
  result[248] = *(unsigned char *)(*(void *)v6 + 248) & 0x80;
  if (v28 < 0)
  {
    *((void *)result + 30) = 0;
    long long v29 = 0uLL;
    *((_OWORD *)result + 13) = 0u;
    *((_OWORD *)result + 14) = 0u;
    *((_OWORD *)result + 11) = 0u;
    *((_OWORD *)result + 12) = 0u;
    *((_OWORD *)result + 9) = 0u;
    *((_OWORD *)result + 10) = 0u;
    *((_OWORD *)result + 7) = 0u;
    *((_OWORD *)result + 8) = 0u;
  }
  else
  {
    *((void *)result + 14) = 0;
    long long v29 = 0uLL;
  }
  *((_OWORD *)result + 5) = v29;
  *((_OWORD *)result + 6) = v29;
  *((_OWORD *)result + 3) = v29;
  *((_OWORD *)result + 4) = v29;
  *((_OWORD *)result + 1) = v29;
  *((_OWORD *)result + 2) = v29;
  *(_OWORD *)uint64_t result = v29;
  if (*(char *)(a1 + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  char v30 = v9 + ~(_BYTE)v15;
  uint64_t v31 = (uint64_t *)(v5 + 8 * v14);
  v31[1] = (uint64_t)result;
  uint64_t v32 = *v31;
  if (v30)
  {
    uint64_t v33 = (uint64_t *)(v32 + 8 * v15 + 8);
    uint64_t v34 = 8 * (v9 + ~(_BYTE)v15);
    int v35 = (uint64_t *)result;
    do
    {
      if (v33 != v35)
      {
        uint64_t v36 = *v35;
        *int v35 = *v33;
        *uint64_t v33 = v36;
      }
      ++v33;
      ++v35;
      v34 -= 8;
    }
    while (v34);
    uint64_t v32 = *(void *)v6;
  }
  int v37 = *(char *)(v32 + 248);
  if ((v37 & 0x80000000) == 0)
  {
    if (v28 < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    uint64_t result = (char *)memmove(result + 120, (const void *)(v32 + 8 * v15 + 128), 8 * (v9 + ~(_BYTE)v15) + 8);
    uint64_t v32 = *(void *)v6;
    LOBYTE(v37) = *(unsigned char *)(*(void *)v6 + 248);
  }
  *(unsigned char *)(v32 + 248) = v37 + ~v30;
  char v38 = v27[248] + v30;
  v27[248] = v38;
  if (v38 >= 0) {
    int v39 = 15;
  }
  else {
    int v39 = 31;
  }
  if ((v38 & 0x7F) == v39
    || ((v40 = *(unsigned char *)(v32 + 248), int v41 = v40, v42 = v40 & 0x7F, v41 >= 0) ? (v43 = 15) : (v43 = 31), v42 == v43))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  return result;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::NodeCore(uint64_t result, uint64_t a2)
{
  uint64_t v2 = 0;
  *(unsigned char *)(result + 248) = 0;
  do
  {
    *(void *)(result + v2) = 0;
    v2 += 8;
  }
  while (v2 != 120);
  if (*(char *)(result + 248) < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  *(void *)(result + 120) = a2;
  return result;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::const_iterator::const_iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = a2;
  *(_OWORD *)(a1 + 8) = 0u;
  uint64_t v4 = a1 + 8;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 83) = 0u;
  if (*(unsigned char *)(a2 + 32))
  {
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)a2;
    uint64_t v9 = a1 + 88;
    do
    {
      uint64_t v10 = v9 + 8 * v7;
      *(void *)(v10 - 80) = v8;
      unsigned int v11 = lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::lower_bound_index(v8, a3);
      *(unsigned char *)(v9 + v7) = v11;
      uint64_t v12 = *(void *)(v10 - 80);
      int v13 = *(char *)(v12 + 248);
      if (v11 != (v13 & 0x7F) && *(void *)(*(void *)(v12 + 8 * v11) + 160) < *(void *)(*(void *)a3 + 160))
      {
        *(unsigned char *)(a1 + 98) = v7 + 1;
        return a1;
      }
      unint64_t v14 = *(unsigned __int8 *)(a2 + 32);
      if (v7 + 1 != v14)
      {
        if (v13 < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v8 = *(void *)(v12 + 8 * v11 + 120);
      }
      ++v7;
    }
    while (v7 < v14);
    for (*(unsigned char *)(a1 + 98) = v14; (_BYTE)v14; *(unsigned char *)(a1 + 98) = v14)
    {
      if (*(unsigned char *)(v9 + v14 - 1) != (*(unsigned char *)(*(void *)(v4
                                                                                            + 8 * v14
                                                                                            - 8)
                                                                                + 248) & 0x7F))
        break;
      LOBYTE(v14) = v14 - 1;
    }
  }
  return a1;
}

uint64_t lsl::BTree<lsl::UniquePtr<dyld4::Atlas::Image>,std::less<lsl::UniquePtr<dyld4::Atlas::Image>>,false>::NodeCore<31u,15u>::lower_bound_index(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(unsigned char *)(a1 + 248) & 0x7F;
  if ((*(unsigned char *)(a1 + 248) & 0x7F) != 0)
  {
    unsigned int v3 = (void *)a1;
    do
    {
      unint64_t v4 = v2 >> 1;
      uint64_t v5 = &v3[v2 >> 1];
      uint64_t v7 = *v5;
      uint64_t v6 = v5 + 1;
      v2 += ~(v2 >> 1);
      if (*(void *)(v7 + 160) < *(void *)(*(void *)a2 + 160)) {
        unsigned int v3 = v6;
      }
      else {
        unint64_t v2 = v4;
      }
    }
    while (v2);
  }
  else
  {
    LODWORD(v3) = a1 + 8 * v2;
  }
  return ((v3 - a1) >> 3);
}

void lsl::Vector<char>::reserveExact(uint64_t a1, unint64_t a2)
{
  if (*(void *)(a1 + 24) < a2)
  {
    if ((lsl::Allocator::realloc(*(lsl::Lock ***)a1, *(void **)(a1 + 8), a2) & 1) == 0)
    {
      unint64_t v4 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)a1, 0x10uLL, a2);
      uint64_t v5 = v4;
      unint64_t v6 = *(void *)(a1 + 16);
      if (v6)
      {
        for (unint64_t i = 0; i < v6; ++i)
        {
          *((unsigned char *)v4 + i) = *(unsigned char *)(*(void *)(a1 + 8) + i);
          unint64_t v6 = *(void *)(a1 + 16);
        }
      }
      uint64_t v8 = *(void **)(a1 + 8);
      if (v8)
      {
        lsl::Allocator::free(*(lsl::Lock ***)a1, v8);
        unint64_t v6 = *(void *)(a1 + 16);
      }
      if (v6 >= a2) {
        unint64_t v6 = a2;
      }
      *(void *)(a1 + 8) = v5;
      *(void *)(a1 + 16) = v6;
    }
    *(void *)(a1 + 24) = a2;
  }
}

char *dyld4::Utils::strrstr(dyld4::Utils *this, const char *__s, const char *a3)
{
  size_t v5 = strlen(__s);
  size_t v6 = strlen((const char *)this);
  if (!v6) {
    return 0;
  }
  size_t v7 = v6;
  while (1)
  {
    uint64_t v8 = (char *)this + v7;
    if (!strncmp((const char *)this + v7, __s, v5)) {
      break;
    }
    if (!--v7) {
      return 0;
    }
  }
  return v8;
}

size_t dyld4::Utils::concatenatePaths(dyld4::Utils *this, char *a2, const char *a3)
{
  if (*((unsigned char *)this + strlen((const char *)this) - 1) == 47 && *a2 == 47)
  {
    size_t v6 = a2 + 1;
    size_t v7 = (char *)this;
  }
  else
  {
    size_t v7 = (char *)this;
    size_t v6 = a2;
  }

  return strlcat(v7, v6, (size_t)a3);
}

size_t dyld4::LibSystemHelpers::malloc_size(dyld4::LibSystemHelpers *this, const void *ptr)
{
  return malloc_size(ptr);
}

uint64_t dyld4::LibSystemHelpers::vm_allocate(dyld4::LibSystemHelpers *this, vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return vm_allocate(target_task, address, size, flags);
}

void dyld4::LibSystemHelpers::vm_deallocate(dyld4::LibSystemHelpers *this)
{
}

uint64_t dyld4::LibSystemHelpers::run_async(dyld4::LibSystemHelpers *this, void *(__cdecl *a2)(void *), void *a3)
{
  pthread_t v4 = 0;
  pthread_create(&v4, 0, a2, a3);
  return pthread_detach(v4);
}

uint64_t dyld4::finalizeListTLV_thunk(dyld4 *this, void *a2)
{
  return (**(uint64_t (***)(uint64_t, dyld4 *))dyld4::gDyld)(dyld4::gDyld, this);
}

uint64_t dyld4::LibSystemHelpers::__cxa_finalize_ranges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F40CF718](a2, a3);
}

uint64_t dyld4::LibSystemHelpers::isLaunchdOwned(dyld4::LibSystemHelpers *this)
{
  return 0;
}

void dyld4::LibSystemHelpers::exit(dyld4::LibSystemHelpers *this, int a2)
{
}

char *dyld4::LibSystemHelpers::getenv(dyld4::LibSystemHelpers *this, const char *a2)
{
  return getenv(a2);
}

uint64_t dyld4::LibSystemHelpers::mkstemp(dyld4::LibSystemHelpers *this, char *a2)
{
  return mkstemp(a2);
}

uint64_t dyld4::LibSystemHelpers::os_unfair_recursive_lock_unlock_forked_child(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F40D0860](a2);
}

void dyld4::LibSystemHelpers::setDyldPatchedObjCClasses(dyld4::LibSystemHelpers *this)
{
  dyld_process_has_objc_patches = 1;
}

BOOL DyldSharedCache::isSubCachePath(DyldSharedCache *this, const char *a2)
{
  unint64_t v2 = strchr((char *)this, 46);
  return v2 && strcmp(v2, ".development");
}

uint64_t dyld_process_create_for_task(lsl::Allocator *a1, int *a2)
{
  unsigned int v3 = a1;
  pthread_t v4 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(a1);
  size_t v5 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(v4);
  if (defaultFileManager(void)::onceToken != -1) {
    dispatch_once(&defaultFileManager(void)::onceToken, &__block_literal_global_0);
  }
  size_t v6 = (dyld4::FileManager *)defaultFileManager(void)::sFileManager;
  size_t v7 = (dyld4::Atlas::Process *)lsl::Allocator::aligned_alloc((lsl::Lock **)v4, 8uLL, 0x90uLL);

  return dyld4::Atlas::Process::Process(v7, v5, v6, v3, a2);
}

uint64_t dyld_process_create_for_current_task()
{
  return dyld_process_create_for_task((lsl::Allocator *)*MEMORY[0x1E4F14C48], 0);
}

void dyld_process_dispose(dyld4::Atlas::Process *a1)
{
  if (a1)
  {
    dyld4::Atlas::Process::~Process(a1);
    lsl::Allocator::freeObject(v1, v2);
  }
}

uint64_t dyld_process_register_for_image_notifications(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v5 = 0;
  if (!a2) {
    a2 = &v5;
  }
  return dyld4::Atlas::Process::registerAtlasChangedEventHandler(a1, (uint64_t)a2, a3, a4);
}

uint64_t dyld_process_register_for_event_notification(uint64_t a1, int *a2, int a3, uint64_t a4, uint64_t a5)
{
  int v6 = 0;
  if (!a2) {
    a2 = &v6;
  }
  return dyld4::Atlas::Process::registerEventHandler(a1, (uint64_t)a2, a3, a4, a5);
}

lsl::Allocator *dyld_process_snapshot_create_for_process(dyld4::Atlas::Process *a1, int *a2, uint64_t a3, uint64_t a4)
{
  dyld4::Atlas::Process::getSnapshot(a1, a2, a3, a4);
  pthread_t v4 = v7;
  size_t v7 = 0;
  lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v7, v5);
  return v4;
}

void *dyld_process_snapshot_create_from_data(lsl::AllocatorLayout *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v22[1] = *(lsl::Allocator **)MEMORY[0x1E4F14BF8];
  if (a3) {
    dyld_process_snapshot_create_from_data_cold_2();
  }
  if (a4) {
    dyld_process_snapshot_create_from_data_cold_1();
  }
  uint64_t v6 = lsl::AllocatorLayout::minSize(a1);
  uint64_t v9 = (char *)v22 - ((MEMORY[0x1F41887A8](v6, v6, v7, v8) + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v9, v10);
  uint64_t v12 = (char *)lsl::AllocatorLayout::minSize(v11);
  uint64_t v16 = (lsl::Allocator *)lsl::Allocator::stackAllocatorInternal((lsl::Allocator *)v9, v12, v13, v14, v15);
  unsigned int v17 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v16);
  if (defaultFileManager(void)::onceToken != -1) {
    dispatch_once(&defaultFileManager(void)::onceToken, &__block_literal_global_0);
  }
  uint64_t v18 = defaultFileManager(void)::sFileManager;
  uint64_t v19 = lsl::Allocator::aligned_alloc(v17, 8uLL, 0x70uLL);
  dyld4::Atlas::ProcessSnapshot::ProcessSnapshot(v19, v16, v18, 0, a1, a2);
  v22[0] = 0;
  lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(v22, v20);
  lsl::Allocator::~Allocator(v16);
  return v19;
}

lsl::Allocator **dyld_process_snapshot_dispose(dyld4::Atlas::ProcessSnapshot *a1)
{
  uint64_t result = (lsl::Allocator **)dyld4::Atlas::ProcessSnapshot::valid(a1);
  if (result)
  {
    pthread_t v4 = a1;
    return lsl::UniquePtr<dyld4::Atlas::ProcessSnapshot>::~UniquePtr(&v4, v3);
  }
  return result;
}

void *dyld_process_snapshot_for_each_image(dyld4::Atlas::ProcessSnapshot *a1, uint64_t a2)
{
  uint64_t result = (void *)dyld4::Atlas::ProcessSnapshot::valid(a1);
  if (result)
  {
    v5[0] = MEMORY[0x1E4F14BE8];
    v5[1] = 0x40000000;
    v5[2] = __dyld_process_snapshot_for_each_image_block_invoke;
    void v5[3] = &unk_1E5E6CFF0;
    void v5[4] = a2;
    return dyld4::Atlas::ProcessSnapshot::forEachImage((uint64_t *)a1, (uint64_t)v5);
  }
  return result;
}

uint64_t __dyld_process_snapshot_for_each_image_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t dyld_process_snapshot_get_shared_cache(dyld4::Atlas::ProcessSnapshot *a1)
{
  if (dyld4::Atlas::ProcessSnapshot::valid(a1)) {
    return *(void *)dyld4::Atlas::ProcessSnapshot::sharedCache(a1);
  }
  else {
    return 0;
  }
}

__n128 dyld_shared_cache_copy_uuid(dyld4::Atlas::SharedCache *a1, __n128 *a2)
{
  unsigned int v3 = (__n128 *)dyld4::Atlas::SharedCache::uuid(a1);
  __n128 result = *v3;
  *a2 = *v3;
  return result;
}

void dyld_shared_cache_for_each_image(void *a1, uint64_t a2)
{
  v2[0] = MEMORY[0x1E4F14BE8];
  v2[1] = 0x40000000;
  unsigned int v2[2] = __dyld_shared_cache_for_each_image_block_invoke;
  v2[3] = &unk_1E5E6D018;
  v2[4] = a2;
  dyld4::Atlas::SharedCache::forEachImage(a1, (uint64_t)v2);
}

uint64_t __dyld_shared_cache_for_each_image_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void dyld_for_each_installed_shared_cache_with_system_path(lsl::AllocatorLayout *a1, uint64_t a2)
{
  void v15[5] = *MEMORY[0x1E4F14BF8];
  uint64_t v4 = lsl::AllocatorLayout::minSize(a1);
  uint64_t v7 = (char *)v15 - ((MEMORY[0x1F41887A8](v4, v4, v5, v6) + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v7, v8);
  size_t v10 = (char *)lsl::AllocatorLayout::minSize(v9);
  unint64_t v14 = (lsl::Allocator *)lsl::Allocator::stackAllocatorInternal((lsl::Allocator *)v7, v10, v11, v12, v13);
  if (defaultFileManager(void)::onceToken != -1) {
    dispatch_once(&defaultFileManager(void)::onceToken, &__block_literal_global_0);
  }
  v15[0] = MEMORY[0x1E4F14BE8];
  v15[1] = 0x40000000;
  void v15[2] = __dyld_for_each_installed_shared_cache_with_system_path_block_invoke;
  v15[3] = &unk_1E5E6D040;
  _OWORD v15[4] = a2;
  dyld4::Atlas::SharedCache::forEachInstalledCacheWithSystemPath((uint64_t)v14, defaultFileManager(void)::sFileManager, (uint64_t)a1, (uint64_t)v15);
  lsl::Allocator::~Allocator(v14);
}

uint64_t __dyld_for_each_installed_shared_cache_with_system_path_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void dyld_for_each_installed_shared_cache(lsl::AllocatorLayout *a1)
{
  v13[5] = *MEMORY[0x1E4F14BF8];
  uint64_t v2 = lsl::AllocatorLayout::minSize(a1);
  uint64_t v5 = (char *)v13 - ((MEMORY[0x1F41887A8](v2, v2, v3, v4) + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v5, v6);
  size_t v8 = (char *)lsl::AllocatorLayout::minSize(v7);
  uint64_t v12 = (lsl::Allocator *)lsl::Allocator::stackAllocatorInternal((lsl::Allocator *)v5, v8, v9, v10, v11);
  if (defaultFileManager(void)::onceToken != -1) {
    dispatch_once(&defaultFileManager(void)::onceToken, &__block_literal_global_0);
  }
  v13[0] = MEMORY[0x1E4F14BE8];
  v13[1] = 0x40000000;
  v13[2] = __dyld_for_each_installed_shared_cache_block_invoke;
  v13[3] = &unk_1E5E6D068;
  v13[4] = a1;
  dyld4::Atlas::SharedCache::forEachInstalledCacheWithSystemPath((uint64_t)v12, defaultFileManager(void)::sFileManager, (uint64_t)"/", (uint64_t)v13);
  lsl::Allocator::~Allocator(v12);
}

uint64_t __dyld_for_each_installed_shared_cache_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL dyld_shared_cache_for_file(lsl::AllocatorLayout *a1, uint64_t a2)
{
  uint64_t v21 = *MEMORY[0x1E4F14BF8];
  uint64_t v4 = lsl::AllocatorLayout::minSize(a1);
  uint64_t v7 = &v20[-((MEMORY[0x1F41887A8](v4, v4, v5, v6) + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  bzero(v7, v8);
  size_t v10 = (char *)lsl::AllocatorLayout::minSize(v9);
  unint64_t v14 = (lsl::Lock **)lsl::Allocator::stackAllocatorInternal((lsl::Allocator *)v7, v10, v11, v12, v13);
  if (defaultFileManager(void)::onceToken != -1) {
    dispatch_once(&defaultFileManager(void)::onceToken, &__block_literal_global_0);
  }
  dyld4::FileManager::fileRecordForPath((dyld4::FileManager *)defaultFileManager(void)::sFileManager, v14, (const char *)a1, (uint64_t)v20);
  dyld4::Atlas::SharedCache::createForFileRecord((dyld4::Atlas::Mapper *)v14, (lsl::Allocator *)v20, v15, &v19);
  unsigned int v17 = v19;
  if (v19) {
    (*(void (**)(uint64_t, lsl::Allocator *))(a2 + 16))(a2, v19);
  }
  lsl::UniquePtr<dyld4::Atlas::SharedCache>::~UniquePtr(&v19, v16);
  dyld4::FileRecord::~FileRecord((dyld4::FileRecord *)v20);
  lsl::Allocator::~Allocator((lsl::Allocator *)v14);
  return v17 != 0;
}

uint64_t dyld_image_copy_uuid(dyld4::Atlas::Image *a1, long long *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F14BF8];
  uint64_t v3 = (long long *)dyld4::Atlas::Image::uuid(a1);
  long long v7 = *v3;
  if (!(_BYTE)v7)
  {
    unint64_t v4 = 0;
    do
    {
      unint64_t v5 = v4;
      if (v4 == 15) {
        break;
      }
      ++v4;
    }
    while (!*((unsigned char *)&v7 + v5 + 1));
    if (v5 > 0xE) {
      return 0;
    }
  }
  *a2 = *v3;
  return 1;
}

BOOL dyld_image_local_nlist_content_4Symbolication(dyld4::Atlas::Image *a1, uint64_t a2)
{
  unint64_t v4 = (dyld4::Atlas::SharedCache *)dyld4::Atlas::Image::sharedCache(a1);
  if (!v4) {
    return 0;
  }
  uint64_t v25 = 0;
  unsigned __int8 v26 = &v25;
  uint64_t v27 = 0x2000000000;
  char v28 = 1;
  dyld4::Atlas::SharedCache::localSymbols(v4, (atomic_uint ***)&v24);
  if (v24)
  {
    uint64_t v5 = dyld4::Atlas::Image::sharedCacheVMOffset(a1);
    uint64_t v6 = dyld4::Atlas::SharedCacheLocals::localInfo(v24);
    int v7 = dyld4::Atlas::SharedCacheLocals::use64BitDylibOffsets(v24);
    v16[0] = MEMORY[0x1E4F14BE8];
    v16[1] = 0x40000000;
    unsigned int v17 = __dyld_image_local_nlist_content_4Symbolication_block_invoke;
    uint64_t v18 = &unk_1E5E6D090;
    uint64_t v21 = v5;
    long long v22 = a1;
    uint64_t v23 = v6;
    uint64_t v19 = a2;
    uint64_t v20 = &v25;
    uint64_t v8 = *(unsigned int *)(v6 + 16);
    if (v7)
    {
      char v29 = 0;
      if (*(_DWORD *)(v6 + 20))
      {
        unint64_t v9 = 0;
        size_t v10 = (unsigned int *)(v8 + v6 + 12);
        do
        {
          v17((dyld4::Atlas::Image **)v16, *(dyld4::Atlas::Image **)(v10 - 3), *(v10 - 1), *v10, &v29);
          if (v29) {
            break;
          }
          v10 += 4;
          ++v9;
        }
        while (v9 < *(unsigned int *)(v6 + 20));
      }
    }
    else
    {
      char v29 = 0;
      if (*(_DWORD *)(v6 + 20))
      {
        unint64_t v13 = 0;
        unint64_t v14 = (unsigned int *)(v8 + v6 + 8);
        do
        {
          v17((dyld4::Atlas::Image **)v16, (dyld4::Atlas::Image *)*(v14 - 2), *(v14 - 1), *v14, &v29);
          if (v29) {
            break;
          }
          v14 += 3;
          ++v13;
        }
        while (v13 < *(unsigned int *)(v6 + 20));
      }
    }
    int v12 = *((unsigned __int8 *)v26 + 24);
    lsl::UniquePtr<dyld4::Atlas::SharedCacheLocals>::~UniquePtr(&v24);
  }
  else
  {
    lsl::UniquePtr<dyld4::Atlas::SharedCacheLocals>::~UniquePtr(&v24);
    int v12 = *((unsigned __int8 *)v26 + 24);
  }
  BOOL v11 = v12 != 0;
  _Block_object_dispose(&v25, 8);
  return v11;
}

dyld4::Atlas::Image **__dyld_image_local_nlist_content_4Symbolication_block_invoke(dyld4::Atlas::Image **result, dyld4::Atlas::Image *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (result[6] == a2)
  {
    uint64_t v6 = result;
    if (dyld4::Atlas::Image::pointerSize(result[7]) == 8
      || (__n128 result = (dyld4::Atlas::Image **)dyld4::Atlas::Image::pointerSize(v6[7]), result == 4))
    {
      __n128 result = (dyld4::Atlas::Image **)(*((uint64_t (**)(void))v6[4] + 2))();
    }
    else
    {
      *(unsigned char *)(*((void *)v6[5] + 1) + 24) = 0;
    }
    *a5 = 1;
  }
  return result;
}

uint64_t ___ZL18defaultFileManagerv_block_invoke(lsl::Allocator *a1)
{
  uint64_t v1 = (lsl::Allocator *)lsl::Allocator::defaultAllocator(a1);
  uint64_t v2 = (lsl::Lock **)lsl::Allocator::defaultAllocator(v1);
  uint64_t v3 = lsl::Allocator::aligned_alloc((lsl::Lock **)v1, 8uLL, 0x20uLL);
  uint64_t result = dyld4::FileManager::FileManager((uint64_t)v3, v2, 0);
  defaultFileManager(void)::sFileManager = result;
  return result;
}

lsl::Allocator **lsl::UniquePtr<dyld4::Atlas::SharedCacheLocals>::~UniquePtr(lsl::Allocator **a1)
{
  uint64_t v2 = *a1;
  if (*a1)
  {
    dyld4::Atlas::Mapper::Pointer<dyld3::MachOLoaded>::~Pointer((uint64_t)v2 + 8);
    if (*(void *)v2) {
      lsl::SharedPtr<dyld4::Atlas::Mapper>::Ctrl::decrementRefCount(*(lsl::Allocator **)v2, v3);
    }
    lsl::Allocator::freeObject(*a1, v3);
  }
  return a1;
}

uint64_t lsl::readPVLEUInt64(unsigned __int8 **a1)
{
  uint64_t __dst = 0;
  uint64_t v2 = *a1;
  unsigned int v3 = **a1;
  unsigned int v4 = __clz(__rbit32(v3));
  if (**a1) {
    BOOL v5 = v4 == 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    uint64_t result = *(void *)(v2 + 1);
    uint64_t v7 = (uint64_t)(a1[1] - 9);
    *a1 = v2 + 9;
    a1[1] = (unsigned __int8 *)v7;
  }
  else
  {
    uint64_t v8 = v4 + 1;
    char v9 = 7 - v4;
    uint64_t v10 = (v3 >> (v4 + 1)) & ~(-1 << (7 - v4));
    if (v4)
    {
      memcpy(&__dst, v2 + 1, v8 - 1);
      uint64_t v11 = __dst;
    }
    else
    {
      uint64_t v11 = 0;
    }
    uint64_t result = (v11 << v9) | v10;
    int v12 = &a1[1][-v8];
    *a1 = &v2[v8];
    a1[1] = v12;
  }
  return result;
}

void RemoteBuffer::RemoteBuffer(RemoteBuffer *this)
{
  *(void *)this = 0;
  *((void *)this + 1) = 0;
  *((_DWORD *)this + 4) = 0;
}

void RemoteBuffer::~RemoteBuffer(void **this)
{
  uint64_t v1 = *this;
  if (v1) {
    free(v1);
  }
}

void *dyld_process_info_base::forEachSegment(void *result, uint64_t a2, uint64_t a3)
{
  unint64_t v4 = result[6];
  unint64_t v3 = result[7];
  if (v4 < v3)
  {
    uint64_t v7 = result;
    while (*(void *)(v4 + 16) != a2)
    {
      v4 += 40;
      if (v4 >= v3) {
        return result;
      }
    }
    uint64_t v8 = *(unsigned int *)(v4 + 36);
    if (v8)
    {
      uint64_t v9 = result[10];
      unsigned int v10 = *(_DWORD *)(v4 + 32);
      while (1)
      {
        unsigned int v11 = v10;
        if (!strcmp(*(const char **)(v9 + 24 * v10), "__TEXT")) {
          break;
        }
        unsigned int v10 = v11 + 1;
        if (!--v8)
        {
          uint64_t v12 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v12 = a2 - *(void *)(v9 + 24 * v11 + 8);
LABEL_12:
      unsigned int v13 = 0;
      do
      {
        unint64_t v14 = (void *)(v7[10] + 24 * (v13 + *(_DWORD *)(v4 + 32)));
        uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, void, void))(a3 + 16))(a3, v14[1] + v12, v14[2], *v14);
        ++v13;
      }
      while (v13 < *(_DWORD *)(v4 + 36));
    }
  }
  return result;
}

void dyld_process_info_base::make<dyld_all_image_infos_32,dyld_image_info_32>(RemoteBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int *a4@<X3>, void *a5@<X8>)
{
  uint64_t v34 = 0;
  int v35 = &v34;
  uint64_t v36 = 0x3002000000;
  int v37 = __Block_byref_object_copy__5;
  char v38 = __Block_byref_object_dispose__5;
  int v39 = 0;
  if (*(_DWORD *)a2 <= 0xEu)
  {
    int v7 = 5;
LABEL_3:
    *a4 = v7;
LABEL_4:
    *a5 = 0;
    goto LABEL_27;
  }
  unint64_t v10 = atomic_load((unint64_t *)(a2 + 104));
  if (v10
    && ((unsigned int v11 = atomic_load((unsigned int *)(a2 + 8))) != 0
     || (unsigned int v22 = *(_DWORD *)(a2 + 100)) == 0
     || *(_DWORD *)(a2 + 20) <= v22))
  {
    if (a3)
    {
      unint64_t v12 = atomic_load((unint64_t *)(a2 + 104));
      if (v12 == a3)
      {
        *a4 = 0;
        goto LABEL_4;
      }
    }
    unint64_t v13 = atomic_load((unint64_t *)(a2 + 104));
    mach_vm_address_t v14 = atomic_load((unsigned int *)(a2 + 8));
    if (!v14)
    {
      usleep(0xC350u);
      int v7 = 19;
      goto LABEL_3;
    }
    if (*(_DWORD *)(a2 + 4) >= 0x2000u) {
      int v15 = 0x2000;
    }
    else {
      int v15 = *(_DWORD *)(a2 + 4);
    }
    uint64_t v33 = 0;
    uint64_t shared_cache_range = _dyld_get_shared_cache_range((uint64_t)&v33);
    v30[0] = MEMORY[0x1E4F14BE8];
    unsigned int v17 = (char *)v33 + shared_cache_range;
    v30[1] = 0x40000000;
    v30[2] = ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_3218dyld_image_info_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke;
    v30[3] = &unk_1E5E6D1C0;
    if (!shared_cache_range) {
      unsigned int v17 = 0;
    }
    v30[4] = &v34;
    v30[5] = a2;
    v30[6] = a4;
    v30[7] = v13;
    int v31 = v15;
    int v32 = (int)a1;
    void v30[8] = shared_cache_range;
    v30[9] = v17;
    withRemoteBuffer(a1, v14, (12 * v15), 0, a4, (uint64_t)v30);
    mach_vm_address_t v18 = atomic_load((unint64_t *)(a2 + 184));
    uint64_t v19 = v35;
    if (v18 && v35[5])
    {
      uint64_t v20 = *(unsigned int *)(a2 + 180);
      v28[0] = MEMORY[0x1E4F14BE8];
      v28[1] = 0x40000000;
      v28[2] = ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_3218dyld_image_info_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke_2;
      v28[3] = &unk_1E5E6D1E8;
      int v29 = v20;
      v28[4] = &v34;
      v28[5] = a4;
      withRemoteBuffer(a1, v18, 56 * v20, 0, a4, (uint64_t)v28);
      uint64_t v19 = v35;
    }
    uint64_t v21 = v19[5];
  }
  else
  {
    uint64_t v23 = atomic_load((unint64_t *)(a2 + 104));
    dyld_process_info_base::makeSuspended<dyld_all_image_infos_32>(a1, a2, v23, a4, (dyld_process_info_base **)&v33);
    uint64_t v24 = v33;
    uint64_t v33 = 0;
    uint64_t v25 = (void *)v35[5];
    void v35[5] = (uint64_t)v24;
    if (v25)
    {
      free(v25);
      unsigned __int8 v26 = v33;
      uint64_t v33 = 0;
      if (v26) {
        free(v26);
      }
    }
    uint64_t v19 = v35;
    uint64_t v21 = v35[5];
    if (!v21)
    {
      usleep(0xC350u);
      if (*a4) {
        goto LABEL_4;
      }
      int v7 = 6;
      goto LABEL_3;
    }
  }
  v19[5] = 0;
  *a5 = v21;
LABEL_27:
  _Block_object_dispose(&v34, 8);
  uint64_t v27 = v39;
  int v39 = 0;
  if (v27) {
    free(v27);
  }
}

__n128 _dyld_process_info_get_cache(uint64_t a1, _OWORD *a2)
{
  uint64_t v2 = a1 + *(unsigned int *)(a1 + 4);
  __n128 result = *(__n128 *)v2;
  long long v4 = *(_OWORD *)(v2 + 16);
  *a2 = *(_OWORD *)v2;
  a2[1] = v4;
  return result;
}

__n128 _dyld_process_info_get_aot_cache(uint64_t a1, __n128 *a2)
{
  uint64_t v2 = (__n128 *)(a1 + *(unsigned int *)(a1 + 8));
  __n128 result = *v2;
  a2[1].n128_u64[0] = v2[1].n128_u64[0];
  *a2 = result;
  return result;
}

atomic_uint *_dyld_process_info_retain(atomic_uint *result)
{
  return result;
}

uint64_t _dyld_process_info_get_platform(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  *(void *)(result + 40) = v2;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  *(void *)(a1 + 40) = 0;
  if (v2) {
    free(v2);
  }
}

void dyld_process_info_base::makeSuspended<dyld_all_image_infos_32>(RemoteBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X3>, dyld_process_info_base **a5@<X8>)
{
  kern_return_t v10;
  kern_return_t v11;
  unsigned int v12;
  uint64_t *v13;
  unsigned int v14;
  unsigned int *v15;
  kern_return_t v16;
  size_t v17;
  dyld_process_info_base *v18;
  dyld_process_info_base *v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;
  char *v24;
  void *v25;
  unint64_t v26;
  char *v27;
  mach_vm_address_t v28;
  int v29;
  mach_header *v30;
  int v31;
  unint64_t v32;
  uint64_t v33;
  void v34[10];
  int v35;
  mach_msg_type_number_t infoCnt;
  mach_port_t object_name;
  int info[9];
  mach_vm_address_t address;
  mach_vm_size_t size;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  mach_vm_size_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  mach_vm_address_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  int v60;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[12];
  int x;
  void v64[5];
  mach_vm_size_t kcd_size[97];
  mach_vm_address_t kcd_addr_begin[131];

  kcd_addr_begin[129] = *MEMORY[0x1E4F14BF8];
  x = 0;
  unint64_t v10 = pid_for_task((mach_port_name_t)a1, &x);
  *a4 = v10;
  if (v10) {
    goto LABEL_5;
  }
  mach_msg_type_number_t task_info_outCnt = 12;
  unsigned int v11 = task_info((task_name_t)a1, 0x14u, task_info_out, &task_info_outCnt);
  *a4 = v11;
  if (v11)
  {
    unint64_t v12 = -67108861;
LABEL_4:
    *a4 = v12;
LABEL_5:
    *a5 = 0;
    return;
  }
  if (!task_info_out[11])
  {
    kcd_addr_begin[0] = 0;
    kcd_size[0] = 0;
    int v15 = (unsigned int *)MEMORY[0x1E4F14C48];
    uint64_t v16 = task_map_corpse_info_64(*MEMORY[0x1E4F14C48], (task_read_t)a1, kcd_addr_begin, kcd_size);
    *a4 = v16;
    if (v16)
    {
      unint64_t v12 = v16 & 0xFFFFFF | 0xFB000000;
      goto LABEL_4;
    }
    MEMORY[0x1AD11BB30](*v15, kcd_addr_begin[0], kcd_size[0]);
  }
  uint64_t v33 = a2;
  long long v57 = 0;
  long long v58 = &v57;
  __int16 v59 = 0x2000000000;
  long long v60 = 0;
  unsigned __int8 v53 = 0;
  long long v54 = &v53;
  long long v55 = 0x2000000000;
  long long v56 = 0;
  uint64_t v49 = 0;
  long long v50 = &v49;
  uint64_t v51 = 0x2000000000;
  __int16 v52 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  __int16 v47 = 0x2000000000;
  unsigned __int8 v48 = kcd_addr_begin;
  int v41 = 0;
  int v42 = &v41;
  int v43 = 0x2000000000;
  int v44 = kcd_size;
  address = 0;
  size = 0;
  LOBYTE(kcd_addr_begin[0]) = 0;
  LOBYTE(kcd_size[0]) = 0;
  infoCnt = 9;
  for (object_name = 0;
        !mach_vm_region((vm_map_read_t)a1, &address, &size, 10, info, &infoCnt, &object_name);
        object_name = 0)
  {
    if (info[0] == 5)
    {
      v34[0] = MEMORY[0x1E4F14BE8];
      v34[1] = 0x40000000;
      v34[2] = ___ZN22dyld_process_info_base13makeSuspendedI23dyld_all_image_infos_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke;
      v34[3] = &unk_1E5E6D210;
      int v35 = x;
      v34[4] = &v53;
      void v34[5] = &v41;
      v34[6] = &v57;
      v34[7] = &v49;
      v34[8] = &v45;
      v34[9] = address;
      v64[0] = MEMORY[0x1E4F14BE8];
      v64[1] = 0x40000000;
      v64[2] = ___Z16withRemoteObjectI14mach_header_64EvjyPiU13block_pointerFvT_E_block_invoke;
      v64[3] = &unk_1E5E6D238;
      v64[4] = v34;
      withRemoteBuffer(a1, address, 0x20uLL, 0, 0, (uint64_t)v64);
    }
    address += size;
    infoCnt = 9;
  }
  unint64_t v13 = v58;
  if (v50[3])
  {
    mach_vm_address_t v14 = *((_DWORD *)v58 + 6);
  }
  else
  {
    v50[3] = *(unsigned int *)(a2 + 20);
    strcpy((char *)kcd_addr_begin, "/usr/lib/dyld");
    mach_vm_address_t v14 = *((_DWORD *)v13 + 6) + 1;
  }
  if (v14 >= 0x2000) {
    mach_vm_address_t v14 = 0x2000;
  }
  *((_DWORD *)v13 + 6) = v14;
  unsigned int v17 = 1304 * v14 + 192;
  mach_vm_address_t v18 = (dyld_process_info_base *)malloc_type_malloc(v17, 0xDF73CFF1uLL);
  if (!v18)
  {
    *a4 = -100663293;
    *a5 = 0;
    goto LABEL_32;
  }
  uint64_t v19 = v18;
  dyld_process_info_base::dyld_process_info_base(v18, 0, *((_DWORD *)v58 + 6), 0, v17);
  uint64_t v21 = *(void *)(v20 + 32);
  unsigned int v22 = v21 >= 0xC0;
  uint64_t v23 = v21 - 192;
  if (v22) {
    *((void *)v19 + 4) = v23;
  }
  uint64_t v24 = (char *)v19 + *((unsigned int *)v19 + 1);
  bzero(v24, 0x10uLL);
  *((void *)v24 + 2) = 0;
  *((_WORD *)v24 + 12) = 1;
  uint64_t v25 = (void *)((char *)v19 + *((unsigned int *)v19 + 2));
  bzero(v25, 0x10uLL);
  v25[2] = 0;
  uint64_t v27 = (char *)v19 + *((unsigned int *)v19 + 3);
  *(void *)uint64_t v27 = a3;
  *((_DWORD *)v27 + 2) = *((_DWORD *)v58 + 6);
  *((_DWORD *)v27 + 3) = *((_DWORD *)v58 + 6);
  v27[16] = 0;
  char v28 = v50[3];
  if (v28 && (int v29 = dyld_process_info_base::addDyldImage(v19, a1, v28, 0, (const char *)v46[3]), (*a4 = v29) != 0)
    || (char v30 = (mach_header *)v54[3]) != 0
    && (int v31 = dyld_process_info_base::addImage(v19, a1, 0, 0, v26, v30, 0, (const char *)v42[3], 0), (*a4 = v31) != 0))
  {
LABEL_31:
    *a5 = 0;
    free(v19);
    goto LABEL_32;
  }
  int v32 = atomic_load((unint64_t *)(v33 + 104));
  if (v32 != a3)
  {
    *a4 = 18;
    goto LABEL_31;
  }
  *a5 = v19;
LABEL_32:
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
}

void ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_3218dyld_image_info_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  int v6 = *(_DWORD *)(v4 + 100)
    && *(void *)(qword_1EAE9C008 + 176)
    && !*(unsigned char *)(v4 + 16)
    && !*(unsigned char *)(qword_1EAE9C008 + 24)
    && (*(void *)(qword_1EAE9C008 + 160) == *(void *)(v4 + 84)
      ? (BOOL v5 = *(void *)(qword_1EAE9C008 + 168) == *(void *)(v4 + 92))
      : (BOOL v5 = 0),
        v5)
    && *(void *)(qword_1EAE9C008 + 152) == *(_DWORD *)(v4 + 80);
  uint64_t v7 = (*(_DWORD *)(a1 + 80) + 1);
  uint64_t v8 = *(unsigned int *)(v4 + 180);
  uint64_t v9 = 56 * v8;
  BOOL v18 = v8 >= 0x2000;
  uint64_t v10 = 458752;
  if (!v18) {
    uint64_t v10 = v9;
  }
  unint64_t v11 = 40 * (*(_DWORD *)(a1 + 80) + 1);
  uint64_t v12 = v11 + 240 * v7 + (v7 << 10) + v10 + 32960;
  unint64_t v13 = (dyld_process_info_base *)malloc_type_malloc(v12, 0xBA843F37uLL);
  if (!v13)
  {
    **(_DWORD **)(a1 + 48) = 3;
    uint64_t v37 = *(void *)(*(void *)(a1 + 32) + 8);
    mach_vm_address_t v14 = *(dyld_process_info_base **)(v37 + 40);
    *(void *)(v37 + 40) = 0;
    if (!v14) {
      return;
    }
    goto LABEL_48;
  }
  mach_vm_address_t v14 = v13;
  dyld_process_info_base::dyld_process_info_base(v13, *(_DWORD *)(*(void *)(a1 + 40) + 176), v7, *(_DWORD *)(*(void *)(a1 + 40) + 180), v12);
  unint64_t v17 = *(void *)(v16 + 32);
  if (v17 <= 0xBF)
  {
    BOOL v18 = v17 >= v11;
  }
  else
  {
    v17 -= 192;
    BOOL v18 = 1;
  }
  if (v18)
  {
    if (v17 < v11) {
      uint64_t v19 = 0;
    }
    else {
      uint64_t v19 = 8 * (v7 + 4 * v7);
    }
    *((void *)v14 + 4) = v17 - v19;
  }
  uint64_t v20 = 0;
  uint64_t v21 = (char *)v14 + *((unsigned int *)v14 + 1);
  *(_OWORD *)uint64_t v21 = *(_OWORD *)(*(void *)(a1 + 40) + 84);
  uint64_t v22 = *(void *)(a1 + 40);
  *((void *)v21 + 2) = *(unsigned int *)(v22 + 100);
  unsigned char v21[25] = *(unsigned char *)(v22 + 16);
  v21[24] = 1;
  do
  {
    if (v21[v20]) {
      v21[24] = 0;
    }
    ++v20;
  }
  while (v20 != 16);
  uint64_t v23 = (char *)v14 + *((unsigned int *)v14 + 2);
  *(_OWORD *)uint64_t v23 = *(_OWORD *)(v22 + 208);
  uint64_t v24 = *(void *)(a1 + 40);
  *((void *)v23 + 2) = *(void *)(v24 + 200);
  uint64_t v25 = (char *)v14 + *((unsigned int *)v14 + 3);
  *(void *)uint64_t v25 = *(void *)(a1 + 56);
  int v26 = *(_DWORD *)(v24 + 60);
  *((_DWORD *)v25 + 2) = v7;
  *((_DWORD *)v25 + 3) = v26 + 1;
  v25[16] = 16;
  if (*(unsigned char *)(v24 + 17))
  {
    if (v26 == *(_DWORD *)(a1 + 80)) {
      char v27 = 48;
    }
    else {
      char v27 = 80;
    }
    v25[16] = v27;
    uint64_t v24 = *(void *)(a1 + 40);
  }
  if (*(_DWORD *)(v24 + 32))
  {
    if (*(_DWORD *)(v24 + 36)) {
      char v28 = 32;
    }
    else {
      char v28 = 96;
    }
    v25[16] = v28;
  }
  mach_vm_address_t v29 = *(unsigned int *)(v24 + 112);
  if (!v29
    || (int v30 = dyld_process_info_base::addDyldImage(v14, (RemoteBuffer *)*(unsigned int *)(a1 + 84), *(unsigned int *)(v24 + 20), v29, 0), v31 = *(_DWORD **)(a1 + 48), (*v31 = v30) == 0))
  {
    if (*(_DWORD *)(a1 + 80))
    {
      uint64_t v32 = 0;
      uint64_t v33 = (unsigned int *)(a2 + 4);
      do
      {
        int v34 = dyld_process_info_base::addImage(v14, (RemoteBuffer *)*(unsigned int *)(a1 + 84), v6, *(DyldSharedCache **)(a1 + 64), v15, (mach_header *)*(v33 - 1), (DyldSharedCache *)*v33, 0, v32);
        **(_DWORD **)(a1 + 48) = v34;
        if (v34) {
          goto LABEL_45;
        }
        v33 += 3;
      }
      while (++v32 < (unint64_t)*(unsigned int *)(a1 + 80));
    }
    if (*((void *)v14 + 13) >= *((void *)v14 + 11))
    {
      uint64_t v38 = *(void *)(*(void *)(a1 + 32) + 8);
      int v39 = *(dyld_process_info_base **)(v38 + 40);
      *(void *)(v38 + 40) = v14;
      mach_vm_address_t v14 = v39;
      if (!v39) {
        return;
      }
      goto LABEL_48;
    }
    int v31 = *(_DWORD **)(a1 + 48);
  }
  *int v31 = 5;
LABEL_45:
  uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v36 = *(void **)(v35 + 40);
  *(void *)(v35 + 40) = 0;
  if (v36) {
    free(v36);
  }
LABEL_48:

  free(v14);
}

void ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_3218dyld_image_info_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v2 = 0;
    for (unint64_t i = (_OWORD *)(a2 + 24); ; unint64_t i = (_OWORD *)((char *)i + 56))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      long long v5 = *(_OWORD *)((char *)i - 24);
      uint64_t v6 = *((void *)i - 1);
      long long v11 = *i;
      long long v12 = i[1];
      unint64_t v7 = *(void *)(v4 + 32);
      if (v7 <= 0x37) {
        break;
      }
      *(void *)(v4 + 32) = v7 - 56;
      uint64_t v8 = *(void *)(v4 + 72);
      *(_OWORD *)uint64_t v8 = v5;
      *(_OWORD *)(v8 + 24) = v11;
      *(void *)(v8 + 16) = v6;
      *(_OWORD *)(v8 + 40) = v12;
      *(void *)(v4 + 72) += 56;
      **(_DWORD **)(a1 + 40) = 0;
      if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 48)) {
        return;
      }
    }
    **(_DWORD **)(a1 + 40) = 3;
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
    if (v10)
    {
      free(v10);
    }
  }
}

uint64_t ___ZN22dyld_process_info_base13makeSuspendedI23dyld_all_image_infos_32EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 >> 1 == 2138504551)
  {
    uint64_t v2 = (void *)result;
    int v3 = a2[3];
    if (v3 == 7)
    {
      *(void *)(*(void *)(*(void *)(result + 56) + 8) + 24) = *(void *)(result + 72);
      __n128 result = proc_regionfilename(*(_DWORD *)(result + 80), *(void *)(*(void *)(*(void *)(result + 56) + 8) + 24), *(void **)(*(void *)(*(void *)(result + 64) + 8) + 24), 0x400u);
      if ((int)result <= 0) {
        strcpy(*(char **)(*(void *)(v2[8] + 8) + 24), "/dyld_path_missing");
      }
    }
    else
    {
      if (v3 != 2) {
        return result;
      }
      *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(result + 72);
      __n128 result = proc_regionfilename(*(_DWORD *)(result + 80), *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24), *(void **)(*(void *)(*(void *)(result + 40) + 8) + 24), 0x400u);
      if ((int)result <= 0) {
        strcpy(*(char **)(*(void *)(v2[5] + 8) + 24), "/main_executable_path_missing");
      }
    }
    ++*(_DWORD *)(*(void *)(v2[6] + 8) + 24);
  }
  return result;
}

uint64_t ___Z16withRemoteObjectI14mach_header_64EvjyPiU13block_pointerFvT_E_block_invoke(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  long long v5 = a2[1];
  v7[0] = *a2;
  v7[1] = v5;
  return (*(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t))(v4 + 16))(v4, v7, a3, a4);
}

void dyld_process_info_base::makeSuspended<dyld_all_image_infos_64>(RemoteBuffer *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X3>, dyld_process_info_base **a5@<X8>)
{
  kern_return_t v10;
  kern_return_t v11;
  unsigned int v12;
  uint64_t *v13;
  unsigned int v14;
  unsigned int *v15;
  kern_return_t v16;
  size_t v17;
  dyld_process_info_base *v18;
  dyld_process_info_base *v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;
  char *v24;
  void *v25;
  unint64_t v26;
  char *v27;
  mach_vm_address_t v28;
  int v29;
  mach_header *v30;
  int v31;
  unint64_t v32;
  uint64_t v33;
  void v34[10];
  int v35;
  mach_msg_type_number_t infoCnt;
  mach_port_t object_name;
  int info[9];
  mach_vm_address_t address;
  mach_vm_size_t size;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  mach_vm_size_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  mach_vm_address_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  int v60;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[12];
  int x;
  void v64[5];
  mach_vm_size_t kcd_size[97];
  mach_vm_address_t kcd_addr_begin[131];

  kcd_addr_begin[129] = *MEMORY[0x1E4F14BF8];
  x = 0;
  uint64_t v10 = pid_for_task((mach_port_name_t)a1, &x);
  *a4 = v10;
  if (v10) {
    goto LABEL_5;
  }
  mach_msg_type_number_t task_info_outCnt = 12;
  long long v11 = task_info((task_name_t)a1, 0x14u, task_info_out, &task_info_outCnt);
  *a4 = v11;
  if (v11)
  {
    long long v12 = -67108861;
LABEL_4:
    *a4 = v12;
LABEL_5:
    *a5 = 0;
    return;
  }
  if (!task_info_out[11])
  {
    kcd_addr_begin[0] = 0;
    kcd_size[0] = 0;
    unint64_t v15 = (unsigned int *)MEMORY[0x1E4F14C48];
    uint64_t v16 = task_map_corpse_info_64(*MEMORY[0x1E4F14C48], (task_read_t)a1, kcd_addr_begin, kcd_size);
    *a4 = v16;
    if (v16)
    {
      long long v12 = v16 & 0xFFFFFF | 0xFB000000;
      goto LABEL_4;
    }
    MEMORY[0x1AD11BB30](*v15, kcd_addr_begin[0], kcd_size[0]);
  }
  uint64_t v33 = a2;
  long long v57 = 0;
  long long v58 = &v57;
  __int16 v59 = 0x2000000000;
  long long v60 = 0;
  unsigned __int8 v53 = 0;
  long long v54 = &v53;
  long long v55 = 0x2000000000;
  long long v56 = 0;
  uint64_t v49 = 0;
  long long v50 = &v49;
  uint64_t v51 = 0x2000000000;
  __int16 v52 = 0;
  uint64_t v45 = 0;
  uint64_t v46 = &v45;
  __int16 v47 = 0x2000000000;
  unsigned __int8 v48 = kcd_addr_begin;
  int v41 = 0;
  int v42 = &v41;
  int v43 = 0x2000000000;
  int v44 = kcd_size;
  address = 0;
  size = 0;
  LOBYTE(kcd_addr_begin[0]) = 0;
  LOBYTE(kcd_size[0]) = 0;
  infoCnt = 9;
  for (object_name = 0;
        !mach_vm_region((vm_map_read_t)a1, &address, &size, 10, info, &infoCnt, &object_name);
        object_name = 0)
  {
    if (info[0] == 5)
    {
      v34[0] = MEMORY[0x1E4F14BE8];
      v34[1] = 0x40000000;
      v34[2] = ___ZN22dyld_process_info_base13makeSuspendedI23dyld_all_image_infos_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke;
      v34[3] = &unk_1E5E6D2B0;
      uint64_t v35 = x;
      v34[4] = &v53;
      void v34[5] = &v41;
      v34[6] = &v57;
      v34[7] = &v49;
      v34[8] = &v45;
      v34[9] = address;
      v64[0] = MEMORY[0x1E4F14BE8];
      v64[1] = 0x40000000;
      v64[2] = ___Z16withRemoteObjectI14mach_header_64EvjyPiU13block_pointerFvT_E_block_invoke;
      v64[3] = &unk_1E5E6D238;
      v64[4] = v34;
      withRemoteBuffer(a1, address, 0x20uLL, 0, 0, (uint64_t)v64);
    }
    address += size;
    infoCnt = 9;
  }
  unint64_t v13 = v58;
  if (v50[3])
  {
    mach_vm_address_t v14 = *((_DWORD *)v58 + 6);
  }
  else
  {
    v50[3] = *(void *)(a2 + 32);
    strcpy((char *)kcd_addr_begin, "/usr/lib/dyld");
    mach_vm_address_t v14 = *((_DWORD *)v13 + 6) + 1;
  }
  if (v14 >= 0x2000) {
    mach_vm_address_t v14 = 0x2000;
  }
  *((_DWORD *)v13 + 6) = v14;
  unint64_t v17 = 1304 * v14 + 192;
  BOOL v18 = (dyld_process_info_base *)malloc_type_malloc(v17, 0xDF73CFF1uLL);
  if (!v18)
  {
    *a4 = -100663293;
    *a5 = 0;
    goto LABEL_32;
  }
  uint64_t v19 = v18;
  dyld_process_info_base::dyld_process_info_base(v18, 0, *((_DWORD *)v58 + 6), 0, v17);
  uint64_t v21 = *(void *)(v20 + 32);
  uint64_t v22 = v21 >= 0xC0;
  uint64_t v23 = v21 - 192;
  if (v22) {
    *((void *)v19 + 4) = v23;
  }
  uint64_t v24 = (char *)v19 + *((unsigned int *)v19 + 1);
  bzero(v24, 0x10uLL);
  *((void *)v24 + 2) = 0;
  *((_WORD *)v24 + 12) = 1;
  uint64_t v25 = (void *)((char *)v19 + *((unsigned int *)v19 + 2));
  bzero(v25, 0x10uLL);
  v25[2] = 0;
  char v27 = (char *)v19 + *((unsigned int *)v19 + 3);
  *(void *)char v27 = a3;
  *((_DWORD *)v27 + 2) = *((_DWORD *)v58 + 6);
  *((_DWORD *)v27 + 3) = *((_DWORD *)v58 + 6);
  v27[16] = 0;
  char v28 = v50[3];
  if (v28 && (mach_vm_address_t v29 = dyld_process_info_base::addDyldImage(v19, a1, v28, 0, (const char *)v46[3]), (*a4 = v29) != 0)
    || (int v30 = (mach_header *)v54[3]) != 0
    && (int v31 = dyld_process_info_base::addImage(v19, a1, 0, 0, v26, v30, 0, (const char *)v42[3], 0), (*a4 = v31) != 0))
  {
LABEL_31:
    *a5 = 0;
    free(v19);
    goto LABEL_32;
  }
  uint64_t v32 = atomic_load((unint64_t *)(v33 + 184));
  if (v32 != a3)
  {
    *a4 = 18;
    goto LABEL_31;
  }
  *a5 = v19;
LABEL_32:
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v57, 8);
}

void ___ZN22dyld_process_info_base4makeI23dyld_all_image_infos_6418dyld_image_info_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 48))
  {
    uint64_t v2 = 0;
    for (unint64_t i = (_OWORD *)(a2 + 24); ; unint64_t i = (_OWORD *)((char *)i + 56))
    {
      uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      long long v5 = *(_OWORD *)((char *)i - 24);
      uint64_t v6 = *((void *)i - 1);
      long long v11 = *i;
      long long v12 = i[1];
      unint64_t v7 = *(void *)(v4 + 32);
      if (v7 <= 0x37) {
        break;
      }
      *(void *)(v4 + 32) = v7 - 56;
      uint64_t v8 = *(void *)(v4 + 72);
      *(_OWORD *)uint64_t v8 = v5;
      *(_OWORD *)(v8 + 24) = v11;
      *(void *)(v8 + 16) = v6;
      *(_OWORD *)(v8 + 40) = v12;
      *(void *)(v4 + 72) += 56;
      **(_DWORD **)(a1 + 40) = 0;
      if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 48)) {
        return;
      }
    }
    **(_DWORD **)(a1 + 40) = 3;
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
    if (v10)
    {
      free(v10);
    }
  }
}

uint64_t ___ZN22dyld_process_info_base13makeSuspendedI23dyld_all_image_infos_64EENSt3__110unique_ptrIS_25dyld_process_info_deleterEEjRKT_yPi_block_invoke(uint64_t result, _DWORD *a2)
{
  if (*a2 >> 1 == 2138504551)
  {
    uint64_t v2 = (void *)result;
    int v3 = a2[3];
    if (v3 == 7)
    {
      *(void *)(*(void *)(*(void *)(result + 56) + 8) + 24) = *(void *)(result + 72);
      __n128 result = proc_regionfilename(*(_DWORD *)(result + 80), *(void *)(*(void *)(*(void *)(result + 56) + 8) + 24), *(void **)(*(void *)(*(void *)(result + 64) + 8) + 24), 0x400u);
      if ((int)result <= 0) {
        strcpy(*(char **)(*(void *)(v2[8] + 8) + 24), "/dyld_path_missing");
      }
    }
    else
    {
      if (v3 != 2) {
        return result;
      }
      *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = *(void *)(result + 72);
      __n128 result = proc_regionfilename(*(_DWORD *)(result + 80), *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24), *(void **)(*(void *)(*(void *)(result + 40) + 8) + 24), 0x400u);
      if ((int)result <= 0) {
        strcpy(*(char **)(*(void *)(v2[5] + 8) + 24), "/main_executable_path_missing");
      }
    }
    ++*(_DWORD *)(*(void *)(v2[6] + 8) + 24);
  }
  return result;
}

uint64_t lsl::CRC32c::CRC32c(uint64_t this)
{
  *(void *)this = &lsl::sCRC32cSW;
  *(_DWORD *)(this + 8) = -1;
  return this;
}

uint64_t lsl::CRC32c::operator unsigned int(uint64_t a1)
{
  return ~*(_DWORD *)(a1 + 8);
}

uint64_t lsl::CRC32c::operator()(unsigned int *a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(void, void, uint64_t))(**(void **)a1 + 16))(*(void *)a1, a1[2], a2);
  a1[2] = result;
  return result;
}

uint64_t lsl::CRC32c::operator()(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void, void, uint64_t, uint64_t))(**(void **)a1 + 32))(*(void *)a1, a1[2], a2, a3);
  a1[2] = result;
  return result;
}

uint64_t lsl::CRC32cSW::checksum(lsl::CRC32cSW *this, unsigned int a2, char a3)
{
  return lsl::CRC32cSW::sCRC32cTable[(a2 ^ a3)] ^ (a2 >> 8);
}

uint64_t lsl::CRC32cSW::checksum(lsl::CRC32cSW *this, uint64_t a2, __int16 a3)
{
  __int16 v4 = a3;
  return (*(uint64_t (**)(lsl::CRC32cSW *, uint64_t, __int16 *, uint64_t))(*(void *)this + 32))(this, a2, &v4, 2);
}

uint64_t lsl::CRC32cSW::checksum(lsl::CRC32cSW *this, uint64_t a2, int a3)
{
  int v4 = a3;
  return (*(uint64_t (**)(lsl::CRC32cSW *, uint64_t, int *, uint64_t))(*(void *)this + 32))(this, a2, &v4, 4);
}

uint64_t lsl::CRC32cSW::checksum(lsl::CRC32cSW *this, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a3;
  return (*(uint64_t (**)(lsl::CRC32cSW *, uint64_t, uint64_t *, uint64_t))(*(void *)this + 32))(this, a2, &v4, 8);
}

uint64_t lsl::CRC32cSW::checksum(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  for (uint64_t result = a2; a4; --a4)
  {
    char v5 = *a3++;
    uint64_t result = lsl::CRC32cSW::sCRC32cTable[(v5 ^ result)] ^ (result >> 8);
  }
  return result;
}

uint64_t dyld3::open(dyld3 *this, const char *a2, uint64_t a3)
{
  int v4 = (int)a2;
  for (uint64_t result = open((const char *)this, (int)a2, a3); result == -1; uint64_t result = open((const char *)this, v4, a3))
  {
    if (*__error() != 35 && *__error() != 4) {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

_DWORD *dyld3::FatFile::isFatFile(_DWORD *this, const void *a2)
{
  if ((*this | 0x1000000) != 0xBFBAFECA) {
    return 0;
  }
  return this;
}

BOOL dyld3::FatFile::isValidSlice(dyld3::FatFile *this, Diagnostics *a2, unint64_t a3, unsigned int a4, int a5, int a6, unint64_t a7, unint64_t a8)
{
  if (a3 < a7 || a3 - a7 < a8)
  {
    Diagnostics::error(a2, "slice %d extends beyond end of file");
  }
  else
  {
    long long v12 = (char *)this + a7;
    BOOL result = dyld3::MachOFile::isMachO((dyld3::FatFile *)((char *)this + a7), a2, a8);
    if (!result) {
      return result;
    }
    if (*((_DWORD *)v12 + 1) == a5)
    {
      int v14 = *((_DWORD *)v12 + 2);
      if (((v14 ^ a6) & 0xFFFFFF) != 0)
      {
        Diagnostics::error(a2, "cpu subtype in slice (0x%08X) does not match fat header (0x%08X)");
      }
      else
      {
        if (a5 == 33554444 || a5 == 16777228 || (uint64_t v15 = 4095, a5 == 12) && v14 == 12 && *((_DWORD *)v12 + 3) != 11) {
          uint64_t v15 = 0x3FFFLL;
        }
        if ((v15 & a7) == 0) {
          return 1;
        }
        if (!strncmp(v12, "!<arch>", 7uLL)) {
          Diagnostics::error(a2, "file is static library");
        }
        else {
          Diagnostics::error(a2, "slice is not page aligned");
        }
      }
    }
    else
    {
      Diagnostics::error(a2, "cpu type in slice (0x%08X) does not match fat header (0x%08X)");
    }
  }
  return 0;
}

BOOL dyld3::MachOFile::isMachO(dyld3::MachOFile *this, Diagnostics *a2, unint64_t a3)
{
  if (a3 <= 0x1B)
  {
    Diagnostics::error(a2, "MachO header exceeds file length");
    return 0;
  }
  int v4 = *(_DWORD *)this;
  if (*(_DWORD *)this >> 1 != 2138504551)
  {
    if ((v4 & 0xFEFFFFFF) != 0xCEFAEDFE) {
      Diagnostics::error(a2, "file does not start with MH_MAGIC[_64]");
    }
    return 0;
  }
  BOOL v5 = v4 == -17958193;
  uint64_t v6 = 28;
  if (v5) {
    uint64_t v6 = 32;
  }
  if (v6 + (unint64_t)*((unsigned int *)this + 5) > a3)
  {
    Diagnostics::error(a2, "load commands exceed length of first segment");
    return 0;
  }
  dyld3::MachOFile::forEachLoadCommand(this, a2, (uint64_t)&__block_literal_global_1);

  return Diagnostics::noError(a2);
}

void dyld3::FatFile::forEachSlice(dyld3::FatFile *this, Diagnostics *a2, unint64_t a3, int a4, uint64_t a5)
{
  if (*(_DWORD *)this == -1078264118)
  {
    unsigned int v10 = *((_DWORD *)this + 1);
    uint64_t v11 = bswap32(v10);
    if (v11 >= 0x80)
    {
      Diagnostics::error(a2, "fat header too large: %u entries", v11);
      return;
    }
    if (((32 * v11) | 8uLL) <= a3)
    {
      char v39 = 0;
      if (v10)
      {
        uint64_t v20 = 0;
        uint64_t v21 = v11 - 1;
        uint64_t v22 = (char *)this + 12;
        do
        {
          uint64_t v23 = bswap32(*((_DWORD *)v22 - 1));
          uint64_t v24 = bswap32(*(_DWORD *)v22);
          unint64_t v25 = bswap64(*(void *)(v22 + 4));
          unint64_t v26 = bswap64(*(void *)(v22 + 12));
          if (!a4 || dyld3::FatFile::isValidSlice(this, a2, a3, v20, v23, v24, v25, v26)) {
            (*(void (**)(uint64_t, uint64_t, uint64_t, char *, unint64_t, char *))(a5 + 16))(a5, v23, v24, (char *)this + v25, v26, &v39);
          }
          if (v39) {
            break;
          }
          v22 += 32;
        }
        while (v21 != v20++);
      }
      return;
    }
    goto LABEL_21;
  }
  if (*(_DWORD *)this != -1095041334)
  {
    long long v12 = "not a fat file";
LABEL_22:
    Diagnostics::error(a2, v12);
    return;
  }
  unsigned int v8 = *((_DWORD *)this + 1);
  uint64_t v9 = bswap32(v8);
  if (v9 >= 0xCD)
  {
    Diagnostics::error(a2, "fat header too large: %u entries", v9);
    return;
  }
  if (20 * (unint64_t)(v9 + 1) + 8 > a3)
  {
LABEL_21:
    long long v12 = "fat header malformed, architecture slices extend beyond end of file";
    goto LABEL_22;
  }
  char v41 = 0;
  if (!v8) {
    goto LABEL_36;
  }
  unsigned int v34 = v8;
  uint64_t v13 = 0;
  int v14 = (unsigned int *)((char *)this + 20);
  while (1)
  {
    uint64_t v15 = bswap32(*(v14 - 3));
    uint64_t v16 = bswap32(*(v14 - 2));
    unint64_t v17 = bswap32(*(v14 - 1));
    unint64_t v18 = bswap32(*v14);
    Diagnostics::Diagnostics((Diagnostics *)v40);
    if (!a4 || dyld3::FatFile::isValidSlice(this, (Diagnostics *)v40, a3, v13, v15, v16, v17, v18)) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, char *, unint64_t, char *))(a5 + 16))(a5, v15, v16, (char *)this + v17, v18, &v41);
    }
    if (v41) {
      break;
    }
    if (Diagnostics::hasError((Diagnostics *)v40))
    {
      uint64_t v19 = Diagnostics::errorMessageCStr((Diagnostics *)v40);
      Diagnostics::appendError(a2, "%s, ", v19);
    }
    v14 += 5;
    mach_o::Error::~Error((mach_o::Error *)v40);
    if (v9 == ++v13) {
      goto LABEL_35;
    }
  }
  mach_o::Error::~Error((mach_o::Error *)v40);
LABEL_35:
  if (v34 != -872415232)
  {
LABEL_36:
    char v28 = (char *)this + 8;
    mach_vm_address_t v29 = (_DWORD *)((char *)this + 20 * v9 + 8);
    uint64_t v30 = bswap32(v29[1]);
    if (*v29 == 201326593 && v30 <= 1)
    {
      unint64_t v32 = bswap32(*(_DWORD *)&v28[20 * v9 + 12]);
      unint64_t v33 = bswap32(*(_DWORD *)&v28[20 * v9 + 8]);
      if (!a4 || dyld3::FatFile::isValidSlice(this, a2, a3, v9, 16777228, v30, v33, v32)) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, char *, unint64_t, char *))(a5 + 16))(a5, 16777228, v30, (char *)this + v33, v32, &v41);
      }
    }
  }
}

void dyld3::FatFile::forEachSlice(dyld3::FatFile *a1, Diagnostics *a2, unint64_t a3, uint64_t a4)
{
}

const char *dyld3::MachOFile::archName(dyld3::MachOFile *this, int a2)
{
  int v2 = (int)this;
  uint64_t v3 = 0;
  BOOL result = "unknown";
  while (LODWORD((&dyld3::MachOFile::_s_archInfos)[v3 + 1]) != v2
       || (a2 & 0xFFFFFF) != *((_DWORD *)&dyld3::MachOFile::_s_archInfos + 2 * v3 + 3))
  {
    v3 += 2;
    if (v3 == 26) {
      return result;
    }
  }
  return (&dyld3::MachOFile::_s_archInfos)[v3];
}

uint64_t dyld3::GradedArchs::grade(dyld3::GradedArchs *this, int a2, int a3, char a4)
{
  uint64_t v4 = 0;
  while (1)
  {
    int v5 = *(_DWORD *)((char *)this + v4);
    if (!v5) {
      return 0;
    }
    if (v5 == a2
      && *(_DWORD *)((char *)this + v4 + 4) == (a3 & 0xFFFFFF)
      && (!*((unsigned char *)this + v4 + 8) || (a4 & 1) != 0))
    {
      break;
    }
    v4 += 12;
    if (v4 == 48) {
      return 0;
    }
  }
  return *(unsigned __int16 *)((char *)this + v4 + 10);
}

void *dyld3::GradedArchs::forCurrentOS(dyld3::GradedArchs *this, int a2)
{
  int v2 = &dyld3::GradedArchs::arm64e_pb;
  if (this) {
    int v2 = &dyld3::GradedArchs::arm64e_keysoff_pb;
  }
  uint64_t v3 = &dyld3::GradedArchs::arm64e;
  if (this) {
    uint64_t v3 = &dyld3::GradedArchs::arm64e_keysoff;
  }
  if (a2) {
    return v2;
  }
  else {
    return v3;
  }
}

void *dyld3::GradedArchs::launchCurrentOS(dyld3::GradedArchs *this, const char *a2)
{
  return &dyld3::GradedArchs::arm64e_keysoff;
}

BOOL dyld3::MachOFile::cpuTypeFromArchName(dyld3::MachOFile *this, char *a2, int *a3, int *a4)
{
  uint64_t v7 = 0;
  while (1)
  {
    int v8 = strcmp((const char *)this, (&dyld3::MachOFile::_s_archInfos)[v7]);
    if (!v8) {
      break;
    }
    v7 += 2;
    if (v7 == 26) {
      return v8 == 0;
    }
  }
  *(_DWORD *)a2 = (&dyld3::MachOFile::_s_archInfos)[v7 + 1];
  *a3 = *((_DWORD *)&dyld3::MachOFile::_s_archInfos + 2 * v7 + 3);
  return v8 == 0;
}

BOOL dyld3::MachOFile::builtForPlatform(_DWORD *a1, int a2, int a3)
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2000000000;
  char v17 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2000000000;
  char v13 = 0;
  v8[0] = MEMORY[0x1E4F14BE8];
  v8[1] = 0x40000000;
  void v8[2] = ___ZNK5dyld39MachOFile16builtForPlatformENS_8PlatformEb_block_invoke;
  v8[3] = &unk_1E5E6D3A8;
  int v9 = a2;
  _OWORD v8[4] = &v14;
  void v8[5] = &v10;
  dyld3::MachOFile::forEachSupportedPlatform(a1, (uint64_t)v8);
  if (!*((unsigned char *)v11 + 24) || (BOOL v6 = 0, !a3))
  {
    if (*((unsigned char *)v15 + 24))
    {
      BOOL v6 = 1;
    }
    else
    {
      BOOL v6 = 0;
      if (a2 == 1 && !*((unsigned char *)v11 + 24)) {
        BOOL v6 = ((a1[1] - 7) & 0xFEFFFFFF) == 0;
      }
    }
  }
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

void dyld3::MachOFile::forEachSupportedPlatform(_DWORD *a1, uint64_t a2)
{
  Diagnostics::Diagnostics((Diagnostics *)v7);
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2000000000;
  char v6 = 0;
  v4[0] = MEMORY[0x1E4F14BE8];
  v4[1] = 0x40000000;
  v4[2] = ___ZNK5dyld39MachOFile24forEachSupportedPlatformEU13block_pointerFvNS_8PlatformEjjE_block_invoke;
  void v4[3] = &unk_1E5E6D400;
  void v4[5] = v5;
  void v4[6] = a1;
  void v4[4] = a2;
  dyld3::MachOFile::forEachLoadCommand(a1, (Diagnostics *)v7, (uint64_t)v4);
  Diagnostics::assertNoError((Diagnostics *)v7);
  _Block_object_dispose(v5, 8);
  mach_o::Error::~Error((mach_o::Error *)v7);
}

uint64_t ___ZNK5dyld39MachOFile16builtForPlatformENS_8PlatformEb_block_invoke(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 48) == a2) {
    uint64_t v2 = *(void *)(result + 32);
  }
  else {
    uint64_t v2 = *(void *)(result + 40);
  }
  *(unsigned char *)(*(void *)(v2 + 8) + 24) = 1;
  return result;
}

uint64_t dyld3::MachOFile::loadableIntoProcess(_DWORD *a1, unsigned int a2, const char *a3, int a4)
{
  if (!dyld3::MachOFile::builtForPlatform(a1, a2, 0))
  {
    if (a2 <= 0xC && ((1 << a2) & 0x1380) != 0)
    {
      if (dyld3::MachOFile::builtForPlatform(a1, 1, 0))
      {
        uint64_t v10 = 0;
        while (strcmp(dyld3::MachOFile::loadableIntoProcess(dyld3::Platform,char const*,BOOL)const::macOSHost[v10], a3))
        {
          if (++v10 == 6) {
            goto LABEL_10;
          }
        }
        return 1;
      }
    }
    else
    {
LABEL_10:
      if (a2 == 1 && a1[3] == 2)
      {
        uint64_t v8 = 1;
        uint64_t v11 = a1;
        int v12 = 6;
        goto LABEL_17;
      }
    }
    if (a2 == 7)
    {
      uint64_t v8 = 1;
      uint64_t v11 = a1;
      int v12 = 12;
    }
    else
    {
      if (a2 != 2) {
        goto LABEL_18;
      }
      uint64_t v8 = 1;
      uint64_t v11 = a1;
      int v12 = 11;
    }
LABEL_17:
    if (dyld3::MachOFile::builtForPlatform(v11, v12, 1)) {
      return v8;
    }
LABEL_18:
    if (!a4)
    {
LABEL_33:
      if (a2 == 6)
      {
LABEL_34:
        uint64_t v8 = 1;
        if (dyld3::MachOFile::builtForPlatform(a1, 1, 1)) {
          return v8;
        }
      }
      return 0;
    }
    if (a2 == 12)
    {
      uint64_t v8 = 1;
      char v13 = a1;
      int v14 = 7;
    }
    else
    {
      if (a2 != 11) {
        goto LABEL_24;
      }
      uint64_t v8 = 1;
      char v13 = a1;
      int v14 = 2;
    }
    if (dyld3::MachOFile::builtForPlatform(v13, v14, 1)) {
      return v8;
    }
LABEL_24:
    HIDWORD(v15) = a2;
    LODWORD(v15) = a2 - 6;
    switch((v15 >> 1))
    {
      case 0u:
        goto LABEL_34;
      case 5u:
        uint64_t v8 = 1;
        if (dyld3::MachOFile::builtForPlatform(a1, 1, 0)) {
          return v8;
        }
        if (a2 == 6) {
          goto LABEL_34;
        }
        if (a2 == 20) {
          goto LABEL_32;
        }
        if (a2 != 18) {
          return 0;
        }
LABEL_29:
        uint64_t v8 = 1;
        if (dyld3::MachOFile::builtForPlatform(a1, 2, 1)) {
          return v8;
        }
        if (a2 == 6) {
          goto LABEL_34;
        }
        if (a2 != 20) {
          return 0;
        }
LABEL_32:
        uint64_t v8 = 1;
        if (!dyld3::MachOFile::builtForPlatform(a1, 3, 1)) {
          goto LABEL_33;
        }
        return v8;
      case 6u:
        goto LABEL_29;
      case 7u:
        goto LABEL_32;
      default:
        return 0;
    }
  }
  return 1;
}

uint64_t dyld3::MachOFile::currentPlatform(dyld3::MachOFile *this)
{
  return 2;
}

BOOL dyld3::MachOFile::isMainExecutable(dyld3::MachOFile *this)
{
  return *((_DWORD *)this + 3) == 2;
}

uint64_t ___ZNK5dyld39MachOFile24forEachSupportedPlatformEU13block_pointerFvNS_8PlatformEjjE_block_invoke(uint64_t result, int *a2)
{
  uint64_t v2 = result;
  int v3 = *a2;
  if (*a2 <= 46)
  {
    if (v3 == 36)
    {
      int v5 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16);
    }
    else
    {
      if (v3 != 37) {
        return result;
      }
      int v5 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16);
    }
    goto LABEL_13;
  }
  if (v3 != 47)
  {
    if (v3 != 48)
    {
      if (v3 != 50) {
        return result;
      }
      uint64_t v4 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16);
      goto LABEL_10;
    }
    int v5 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16);
LABEL_13:
    BOOL result = v5();
    goto LABEL_14;
  }
  uint64_t v4 = *(uint64_t (**)(void))(*(void *)(result + 32) + 16);
LABEL_10:
  BOOL result = v4();
LABEL_14:
  *(unsigned char *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = 1;
  return result;
}

void dyld3::MachOFile::forEachSection(_DWORD *a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1E4F14BF8];
  Diagnostics::Diagnostics((Diagnostics *)v9);
  BOOL v4 = a1[1] == 7;
  v7[0] = 0;
  v7[1] = v7;
  _OWORD v7[2] = 0x2000000000;
  int v8 = 0;
  v5[0] = MEMORY[0x1E4F14BE8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5dyld39MachOFile14forEachSectionEU13block_pointerFvRKNS0_11SectionInfoEbRbE_block_invoke;
  void v5[3] = &unk_1E5E6D4E8;
  void v5[6] = a1;
  void v5[7] = &v10;
  void v5[4] = a2;
  void v5[5] = v7;
  BOOL v6 = v4;
  dyld3::MachOFile::forEachLoadCommand(a1, (Diagnostics *)v9, (uint64_t)v5);
  Diagnostics::assertNoError((Diagnostics *)v9);
  _Block_object_dispose(v7, 8);
  mach_o::Error::~Error((mach_o::Error *)v9);
}

BOOL dyld3::MachOFile::getUuid(dyld3::MachOFile *this, unsigned __int8 *a2)
{
  Diagnostics::Diagnostics((Diagnostics *)v12);
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2000000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F14BE8];
  v7[1] = 0x40000000;
  _OWORD v7[2] = ___ZNK5dyld39MachOFile7getUuidEPh_block_invoke;
  void v7[3] = &unk_1E5E6D470;
  v7[4] = &v8;
  v7[5] = a2;
  dyld3::MachOFile::forEachLoadCommand(this, (Diagnostics *)v12, (uint64_t)v7);
  Diagnostics::assertNoError((Diagnostics *)v12);
  BOOL v4 = v9;
  if (*((unsigned char *)v9 + 24))
  {
    BOOL v5 = 1;
  }
  else
  {
    bzero(a2, 0x10uLL);
    BOOL v5 = *((unsigned char *)v4 + 24) != 0;
  }
  _Block_object_dispose(&v8, 8);
  mach_o::Error::~Error((mach_o::Error *)v12);
  return v5;
}

__n128 ___ZNK5dyld39MachOFile7getUuidEPh_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(_DWORD *)a2 == 27)
  {
    __n128 result = *(__n128 *)(a2 + 8);
    *(__n128 *)*(void *)(a1 + 40) = result;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t dyld3::MachOFile::preferredLoadAddress(dyld3::MachOFile *this)
{
  uint64_t v4 = 0;
  BOOL v5 = &v4;
  uint64_t v6 = 0x2000000000;
  uint64_t v7 = 0;
  v3[0] = MEMORY[0x1E4F14BE8];
  v3[1] = 0x40000000;
  v3[2] = ___ZNK5dyld39MachOFile20preferredLoadAddressEv_block_invoke;
  void v3[3] = &unk_1E5E6D4C0;
  v3[4] = &v4;
  dyld3::MachOFile::forEachSegment(this, (uint64_t)v3);
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void dyld3::MachOFile::forEachSegment(_DWORD *a1, uint64_t a2)
{
  Diagnostics::Diagnostics((Diagnostics *)v9);
  BOOL v4 = a1[1] == 7;
  v7[0] = 0;
  v7[1] = v7;
  _OWORD v7[2] = 0x2000000000;
  int v8 = 0;
  v5[0] = MEMORY[0x1E4F14BE8];
  v5[1] = 0x40000000;
  v5[2] = ___ZNK5dyld39MachOFile14forEachSegmentEU13block_pointerFvRKNS0_11SegmentInfoERbE_block_invoke;
  void v5[3] = &unk_1E5E6D498;
  void v5[5] = v7;
  void v5[6] = a1;
  void v5[4] = a2;
  BOOL v6 = v4;
  dyld3::MachOFile::forEachLoadCommand(a1, (Diagnostics *)v9, (uint64_t)v5);
  Diagnostics::assertNoError((Diagnostics *)v9);
  _Block_object_dispose(v7, 8);
  mach_o::Error::~Error((mach_o::Error *)v9);
}

uint64_t ___ZNK5dyld39MachOFile14forEachSegmentEU13block_pointerFvRKNS0_11SegmentInfoERbE_block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result;
  uint64_t v3 = *(void *)(result + 48);
  if (*(_DWORD *)a2 == 1)
  {
    unint64_t v13 = *(unsigned int *)(a2 + 28);
    unsigned int v14 = *(_DWORD *)(a2 + 48);
    if (v14)
    {
      int v15 = 0;
      LOBYTE(v16) = 0;
      unint64_t v17 = a2 + 56;
      unint64_t v18 = a2 + 56 + 68 * v14;
      do
      {
        if (*(_DWORD *)(v17 + 44) > v16) {
          int v16 = *(_DWORD *)(v17 + 44);
        }
        v15 |= (*(unsigned char *)(v17 + 57) & 3) != 0;
        v17 += 68;
      }
      while (v17 < v18);
      int v19 = *(_DWORD *)(v17 - 32) + *(_DWORD *)(v17 - 36);
      unsigned int v20 = *(_DWORD *)(a2 + 24);
      unsigned int v21 = v19 - v20;
      int v22 = v16 << 16;
    }
    else
    {
      int v22 = 0;
      int v15 = 0;
      unsigned int v20 = *(_DWORD *)(a2 + 24);
      unsigned int v21 = *(_DWORD *)(a2 + 28);
    }
    unint64_t v29 = *(unsigned int *)(a2 + 36);
    uint64_t v36 = *(unsigned int *)(a2 + 32);
    unint64_t v37 = v29;
    uint64_t v38 = v20;
    unint64_t v39 = v13;
    uint64_t v40 = v21;
    uint64_t v41 = a2 + 8;
    int v30 = *(_DWORD *)(a2 + 44);
    int v42 = a2 - v3;
    int v43 = v30;
    BOOL v32 = (v30 & 2) == 0 && *(unsigned char *)(result + 56) != 0;
    int v33 = (*(_DWORD *)(a2 + 52) >> 3) & 2 | (*(_DWORD *)(a2 + 52) >> 1) & 4 | v32 & v15;
    if (v29 < v13 && v30 == 3) {
      int v35 = 8;
    }
    else {
      int v35 = 0;
    }
    uint64_t v27 = *(void *)(result + 32);
    int v28 = v35 | v22 | v33 | (16 * (*(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) & 0xFFF));
  }
  else
  {
    if (*(_DWORD *)a2 != 25) {
      return result;
    }
    unint64_t v4 = *(void *)(a2 + 32);
    unsigned int v5 = *(_DWORD *)(a2 + 64);
    if (v5)
    {
      LOBYTE(v6) = 0;
      unint64_t v7 = a2 + 72;
      unint64_t v8 = a2 + 72 + 80 * v5;
      do
      {
        if (*(_DWORD *)(v7 + 52) > v6) {
          int v6 = *(_DWORD *)(v7 + 52);
        }
        v7 += 80;
      }
      while (v7 < v8);
      uint64_t v9 = *(void *)(v7 - 40) + *(void *)(v7 - 48);
      uint64_t v10 = *(void *)(a2 + 24);
      uint64_t v11 = v9 - v10;
      int v12 = v6 << 16;
    }
    else
    {
      int v12 = 0;
      uint64_t v10 = *(void *)(a2 + 24);
      uint64_t v11 = *(void *)(a2 + 32);
    }
    unint64_t v23 = *(void *)(a2 + 48);
    uint64_t v36 = *(void *)(a2 + 40);
    unint64_t v37 = v23;
    uint64_t v38 = v10;
    unint64_t v39 = v4;
    uint64_t v40 = v11;
    uint64_t v41 = a2 + 8;
    int v24 = *(_DWORD *)(a2 + 60);
    int v42 = a2 - v3;
    int v43 = v24;
    if (v23 < v4 && v24 == 3) {
      int v26 = 8;
    }
    else {
      int v26 = 0;
    }
    uint64_t v27 = *(void *)(result + 32);
    int v28 = v26 | v12 | (*(_DWORD *)(a2 + 68) >> 3) & 2 | (*(_DWORD *)(a2 + 68) >> 1) & 4 | (16
                                                                                         * (*(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) & 0xFFF));
  }
  int v44 = v28;
  __n128 result = (*(uint64_t (**)(uint64_t, uint64_t *))(v27 + 16))(v27, &v36);
  ++*(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8) + 24);
  return result;
}

uint64_t ___ZNK5dyld39MachOFile20preferredLoadAddressEv_block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = strcmp(*(const char **)(a2 + 40), "__TEXT");
  if (!result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a2 + 16);
    *a3 = 1;
  }
  return result;
}

uint64_t ___ZNK5dyld39MachOFile14forEachSectionEU13block_pointerFvRKNS0_11SectionInfoEbRbE_block_invoke(uint64_t result, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = result;
  uint64_t v11 = *(void *)(result + 48);
  if (*(_DWORD *)a2 == 1)
  {
    uint64_t v20 = *(unsigned int *)(a2 + 28);
    unint64_t v21 = a2 + 56;
    unsigned int v22 = *(_DWORD *)(a2 + 48);
    unint64_t v23 = a2 + 56 + 68 * v22;
    if (v22)
    {
      int v24 = 0;
      LOBYTE(v25) = 0;
      do
      {
        if (*(_DWORD *)(v21 + 44) > v25) {
          int v25 = *(_DWORD *)(v21 + 44);
        }
        v24 |= (*(unsigned char *)(v21 + 57) & 3) != 0;
        v21 += 68;
      }
      while (v21 < v23);
      unsigned int v26 = *(_DWORD *)(a2 + 24);
      unsigned int v27 = *(_DWORD *)(v21 - 32) + *(_DWORD *)(v21 - 36) - v26;
      int v28 = v25 << 16;
    }
    else
    {
      int v28 = 0;
      int v24 = 0;
      unsigned int v26 = *(_DWORD *)(a2 + 24);
      unsigned int v27 = *(_DWORD *)(a2 + 28);
    }
    uint64_t v42 = *(void *)(a2 + 32);
    *(void *)&long long v43 = v42;
    *((void *)&v43 + 1) = HIDWORD(v42);
    long long v57 = v43;
    uint64_t v58 = v26;
    uint64_t v59 = v20;
    uint64_t v60 = v27;
    uint64_t v61 = a2 + 8;
    int v44 = *(_DWORD *)(a2 + 44);
    int v62 = a2 - v11;
    int v63 = v44;
    int v31 = (uint64_t *)(result + 40);
    uint64_t v30 = *(void *)(result + 40);
    BOOL v46 = (v44 & 2) == 0 && *(unsigned char *)(result + 64) != 0;
    int v64 = (*(_DWORD *)(a2 + 52) >> 3) & 2 | v46 & v24 & 0xFF0007 | (*(_DWORD *)(a2 + 52) >> 1) & 4 | v28 & 0xFF0007 | (16 * (*(_DWORD *)(*(void *)(v30 + 8) + 24) & 0xFFF));
    if (*a3 || !v22) {
      goto LABEL_57;
    }
    unint64_t v47 = a2 + 124;
    do
    {
      unsigned __int8 v48 = (const char *)(v47 - 68);
      if (*(unsigned char *)(v47 - 53))
      {
        strlcpy(*(char **)(v10 + 56), v48, 0x11uLL);
        unsigned __int8 v48 = *(const char **)(v10 + 56);
      }
      unsigned int v49 = *(_DWORD *)(a2 + 24);
      unint64_t v50 = *(unsigned int *)(v47 - 36);
      if (v50 >= v49)
      {
        unsigned int v52 = *(_DWORD *)(a2 + 36) + v49;
        BOOL v39 = v52 >= v50;
        unsigned int v53 = v52 - v50;
        uint64_t v51 = !v39 || v53 < *(_DWORD *)(v47 - 32);
      }
      else
      {
        uint64_t v51 = 1;
      }
      uint64_t v66 = *(unsigned int *)(v47 - 32);
      uint64_t v67 = v48;
      int v55 = *(_DWORD *)(v47 - 12);
      int v56 = *(_DWORD *)(v47 - 24);
      int v68 = *(_DWORD *)(v47 - 28);
      int v69 = v55;
      unint64_t v65 = v50;
      int v70 = v56;
      uint64_t v71 = *(void *)(v47 - 8);
      uint64_t result = (*(uint64_t (**)(void, long long *, uint64_t, unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 32) + 16))(*(void *)(v10 + 32), &v57, v51, a3, a5, a6, a7, a8);
      if (*a3) {
        break;
      }
      BOOL v39 = v47 >= v23;
      v47 += 68;
    }
    while (!v39);
    goto LABEL_56;
  }
  if (*(_DWORD *)a2 != 25) {
    return result;
  }
  uint64_t v12 = *(void *)(a2 + 32);
  unint64_t v13 = a2 + 72;
  unsigned int v14 = *(_DWORD *)(a2 + 64);
  unint64_t v15 = a2 + 72 + 80 * v14;
  if (v14)
  {
    LOBYTE(v16) = 0;
    do
    {
      if (*(_DWORD *)(v13 + 52) > v16) {
        int v16 = *(_DWORD *)(v13 + 52);
      }
      v13 += 80;
    }
    while (v13 < v15);
    uint64_t v17 = *(void *)(a2 + 24);
    uint64_t v18 = *(void *)(v13 - 40) + *(void *)(v13 - 48) - v17;
    int v19 = v16 << 16;
  }
  else
  {
    int v19 = 0;
    uint64_t v17 = *(void *)(a2 + 24);
    uint64_t v18 = *(void *)(a2 + 32);
  }
  long long v57 = *(_OWORD *)(a2 + 40);
  uint64_t v58 = v17;
  uint64_t v59 = v12;
  uint64_t v60 = v18;
  uint64_t v61 = a2 + 8;
  int v29 = *(_DWORD *)(a2 + 60);
  int v62 = a2 - v11;
  int v63 = v29;
  int v64 = (*(_DWORD *)(a2 + 68) >> 3) & 2 | (*(_DWORD *)(a2 + 68) >> 1) & 4 | v19;
  int v31 = (uint64_t *)(result + 40);
  uint64_t v30 = *(void *)(result + 40);
  int v64 = v64 & 0xFF0006 | (16 * (*(_DWORD *)(*(void *)(v30 + 8) + 24) & 0xFFF));
  if (!*a3 && v14)
  {
    unint64_t v32 = a2 + 152;
    do
    {
      int v33 = (const char *)(v32 - 80);
      if (*(unsigned char *)(v32 - 65))
      {
        strlcpy(*(char **)(v10 + 56), v33, 0x11uLL);
        int v33 = *(const char **)(v10 + 56);
      }
      unint64_t v34 = *(void *)(a2 + 24);
      unint64_t v35 = *(void *)(v32 - 48);
      if (v35 >= v34)
      {
        unint64_t v37 = *(void *)(a2 + 48) + v34;
        BOOL v39 = v37 >= v35;
        unint64_t v38 = v37 - v35;
        BOOL v39 = v39 && v38 >= *(void *)(v32 - 40);
        uint64_t v36 = !v39;
      }
      else
      {
        uint64_t v36 = 1;
      }
      uint64_t v66 = *(void *)(v32 - 40);
      uint64_t v67 = v33;
      int v40 = *(_DWORD *)(v32 - 16);
      int v41 = *(_DWORD *)(v32 - 28);
      int v68 = *(_DWORD *)(v32 - 32);
      int v69 = v40;
      unint64_t v65 = v35;
      int v70 = v41;
      uint64_t v71 = *(void *)(v32 - 12);
      uint64_t result = (*(uint64_t (**)(void, long long *, uint64_t, unsigned char *, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v10 + 32) + 16))(*(void *)(v10 + 32), &v57, v36, a3, a5, a6, a7, a8);
      if (*a3) {
        break;
      }
      BOOL v39 = v32 >= v15;
      v32 += 80;
    }
    while (!v39);
LABEL_56:
    uint64_t v30 = *v31;
  }
LABEL_57:
  ++*(_DWORD *)(*(void *)(v30 + 8) + 24);
  return result;
}

uint64_t dyld4::FileManager::FileManager(uint64_t a1, lsl::Lock **this, uint64_t a3)
{
  *(void *)a1 = a3;
  *(void *)(a1 + 8) = this;
  unsigned int v5 = lsl::Allocator::aligned_alloc(this, 8uLL, 0x28uLL);
  void *v5 = 0;
  v5[1] = this;
  void v5[3] = 0;
  *((unsigned char *)v5 + 32) = 0;
  *(void *)(a1 + 16) = v5;
  *(_DWORD *)(a1 + 24) = 0;
  return a1;
}

double dyld4::FileManager::fileRecordForPath@<D0>(dyld4::FileManager *this@<X0>, lsl::Lock **a2@<X1>, const char *__s@<X2>, uint64_t a4@<X8>)
{
  if (__s) {
    int v6 = lsl::Allocator::strdup(a2, __s);
  }
  else {
    int v6 = 0;
  }
  *(void *)a4 = this;
  *(_OWORD *)(a4 + 8) = 0u;
  *(_OWORD *)(a4 + 24) = 0u;
  *(void *)(a4 + 48) = 0;
  *(void *)(a4 + 56) = 0;
  *(void *)(a4 + 40) = v6;
  *(void *)&double result = 0x1FFFFFFFFLL;
  *(void *)(a4 + 64) = 0x1FFFFFFFFLL;
  *(_WORD *)(a4 + 72) = 0;
  *(unsigned char *)(a4 + 74) = 1;
  return result;
}

double dyld4::FileManager::fileRecordForVolumeUUIDAndObjID@<D0>(dyld4::FileManager *this@<X0>, const UUID *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)a4 = this;
  *(void *)(a4 + 8) = a3;
  *(void *)(a4 + 16) = 0;
  *(_OWORD *)(a4 + 24) = *(_OWORD *)a2;
  *(void *)(a4 + 48) = 0;
  *(void *)(a4 + 56) = 0;
  *(void *)(a4 + 40) = 0;
  *(void *)&double result = 0x1FFFFFFFFLL;
  *(void *)(a4 + 64) = 0x1FFFFFFFFLL;
  *(_WORD *)(a4 + 72) = 0;
  *(unsigned char *)(a4 + 74) = 1;
  return result;
}

void dyld4::FileManager::reloadFSInfos(dyld4::FileManager *this)
{
  unint64_t v34 = this;
  uint64_t v62 = *MEMORY[0x1E4F14BF8];
  lsl::AllocatorLayout::minSize(this);
  uint64_t v1 = (char *)&v29 - ((MEMORY[0x1F41887A8]() + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v1, v2);
  unint64_t v4 = (char *)lsl::AllocatorLayout::minSize(v3);
  unint64_t v8 = (lsl::Lock **)lsl::Allocator::stackAllocatorInternal((lsl::Allocator *)v1, v4, v5, v6, v7);
  int v9 = getfsstat(0, 0, 2);
  if (v9 != -1)
  {
    LODWORD(v10) = v9;
    while (1)
    {
      uint64_t v11 = (statfs *)lsl::Allocator::malloc(v8, 2168 * (int)v10);
      if (getfsstat(v11, 2168 * v10, 2) == v10) {
        break;
      }
      lsl::Allocator::free(v8, v11);
      LODWORD(v10) = getfsstat(0, 0, 2);
      if (v10 == -1) {
        goto LABEL_20;
      }
    }
    if ((int)v10 >= 1)
    {
      int v33 = (void *)&v54 + 1;
      int v31 = (uint64_t *)&v61[8];
      unint64_t v32 = v53;
      int v29 = (_OWORD *)((char *)v51 + 8);
      uint64_t v30 = &v36;
      _X22 = v11;
      uint64_t v10 = v10;
      unint64_t v13 = v34;
      do
      {
        __asm { PRFM            #0, [X22,#0x1998] }
        uint64_t v19 = _X22->f_fsid.val[0];
        uint64_t v20 = (uint64_t *)*((void *)v13 + 2);
        unint64_t v21 = v33;
        *int v33 = 0;
        v21[1] = 0;
        *(void *)&long long v54 = v19;
        lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find(v20, (unint64_t *)&v54, (uint64_t)&v37);
        uint64_t v48 = v37;
        v51[2] = v42;
        v51[3] = v43;
        v51[4] = v44;
        uint64_t v52 = v45;
        long long v49 = v38;
        long long v50 = v39;
        v51[0] = v40;
        v51[1] = v41;
        uint64_t v22 = *(void *)v46;
        unint64_t v23 = v32;
        *(void *)(v32 + 7) = *(void *)&v46[7];
        *unint64_t v23 = v22;
        v53[15] = v47;
        uint64_t v24 = *((void *)v13 + 2);
        long long v60 = 0u;
        memset(v61, 0, 23);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        uint64_t v37 = v24;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v45 = 0;
        uint64_t v25 = *v31;
        *(void *)&v46[7] = *(uint64_t *)((char *)v31 + 7);
        *(void *)BOOL v46 = v25;
        char v47 = 0;
        if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v48, (uint64_t)&v37))
        {
          if ((_X22->f_flags & 0x4000) != 0)
          {
            LODWORD(v54) = 5;
            HIDWORD(v54) = 0;
            *(void *)&long long v55 = 0;
            *(void *)((char *)&v54 + 4) = 0x8006000000000006;
            if (!getattrlist(_X22->f_mntonname, &v54, &v48, 0x40uLL, 0) && (BYTE8(v49) & 1) != 0)
            {
              unsigned int v26 = (uint64_t *)*((void *)v34 + 2);
              uint64_t v35 = v19;
              *(_OWORD *)uint64_t v30 = *v29;
            }
            else
            {
              unsigned int v26 = (uint64_t *)*((void *)v34 + 2);
              int v28 = v30;
              *uint64_t v30 = 0;
              v28[1] = 0;
              uint64_t v35 = v19;
            }
            unsigned int v27 = &v35;
          }
          else
          {
            unsigned int v26 = (uint64_t *)*((void *)v34 + 2);
            long long v49 = 0uLL;
            uint64_t v48 = v19;
            unsigned int v27 = &v48;
          }
          lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::insert(v26, (uint64_t)v27, (uint64_t)&v37);
        }
        ++_X22;
        --v10;
      }
      while (v10);
    }
    lsl::Allocator::free(v8, v11);
  }
LABEL_20:
  lsl::Allocator::~Allocator((lsl::Allocator *)v8);
}

double lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::insert@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v23 = *MEMORY[0x1E4F14BF8];
  unint64_t v9 = *(void *)a2;
  long long v10 = *(_OWORD *)(a2 + 8);
  lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::const_iterator((uint64_t)v22, a1, &v9);
  lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::insert_internal((uint64_t)a1, (uint64_t)v22, &v9, (uint64_t)&v11);
  uint64_t v5 = v11;
  *(_OWORD *)(a3 + 72) = v16;
  *(_OWORD *)(a3 + 88) = v17;
  *(_OWORD *)(a3 + 104) = v18;
  *(_OWORD *)(a3 + 8) = v12;
  *(_OWORD *)(a3 + 24) = v13;
  *(_OWORD *)(a3 + 40) = v14;
  double result = *(double *)&v15;
  *(_OWORD *)(a3 + 56) = v15;
  *(void *)(a3 + 135) = *(void *)&v20[7];
  uint64_t v7 = *(void *)v20;
  *(void *)(a3 + 120) = v19;
  *(void *)(a3 + 128) = v7;
  __int16 v8 = v21;
  *(void *)a3 = v5;
  *(_WORD *)(a3 + 143) = v8;
  return result;
}

uint64_t dyld4::FileManager::uuidForFileSystem(os_unfair_lock_s *this, unsigned int a2)
{
  uint64_t v35 = *MEMORY[0x1E4F14BF8];
  unint64_t v4 = this + 6;
  os_unfair_lock_lock(this + 6);
  uint64_t v5 = *(uint64_t **)&this[4]._os_unfair_lock_opaque;
  *(void *)&_OWORD v25[8] = 0;
  *(void *)&v25[16] = 0;
  *(void *)uint64_t v25 = a2;
  lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find(v5, (unint64_t *)v25, (uint64_t)&v14);
  v28[4] = v19;
  v28[5] = v20;
  void v28[6] = v21;
  uint64_t v27 = v14;
  v28[0] = v15;
  v28[1] = v16;
  v28[2] = v17;
  v28[3] = v18;
  *(void *)&v30[7] = *(void *)&v23[7];
  uint64_t v29 = v22;
  *(void *)uint64_t v30 = *(void *)v23;
  unsigned __int8 v31 = v24;
  uint64_t v6 = *(void *)&this[4]._os_unfair_lock_opaque;
  memset(v25, 0, 135);
  uint64_t v14 = v6;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  memset(v23, 0, sizeof(v23));
  unsigned __int8 v24 = 0;
  if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v27, (uint64_t)&v14))
  {
    dyld4::FileManager::reloadFSInfos((dyld4::FileManager *)this);
    uint64_t v7 = *(uint64_t **)&this[4]._os_unfair_lock_opaque;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    unint64_t v32 = a2;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find(v7, &v32, (uint64_t)&v14);
    *(_OWORD *)&v25[72] = v19;
    *(_OWORD *)&v25[88] = v20;
    *(_OWORD *)&v25[104] = v21;
    *(void *)uint64_t v25 = v14;
    *(_OWORD *)&_OWORD v25[8] = v15;
    *(_OWORD *)&v25[24] = v16;
    *(_OWORD *)&v25[40] = v17;
    *(_OWORD *)&v25[56] = v18;
    *(void *)&v25[135] = *(void *)&v23[7];
    *(void *)&v25[120] = v22;
    *(void *)&v25[128] = *(void *)v23;
    unsigned __int8 v26 = v24;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::swap(&v27, (uint64_t *)v25);
  }
  uint64_t v8 = *(void *)&this[4]._os_unfair_lock_opaque;
  memset(v25, 0, 135);
  uint64_t v14 = v8;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  memset(v23, 0, sizeof(v23));
  unsigned __int8 v24 = 0;
  if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v27, (uint64_t)&v14))
  {
    unint64_t v9 = *(uint64_t **)&this[4]._os_unfair_lock_opaque;
    *(void *)&_OWORD v25[8] = 0;
    *(void *)&v25[16] = 0;
    *(void *)uint64_t v25 = a2;
    lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::insert(v9, (uint64_t)v25, (uint64_t)&v14);
    long long v10 = *(uint64_t **)&this[4]._os_unfair_lock_opaque;
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    unint64_t v32 = a2;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find(v10, &v32, (uint64_t)&v14);
    *(_OWORD *)&v25[72] = v19;
    *(_OWORD *)&v25[88] = v20;
    *(_OWORD *)&v25[104] = v21;
    *(void *)uint64_t v25 = v14;
    *(_OWORD *)&_OWORD v25[8] = v15;
    *(_OWORD *)&v25[24] = v16;
    *(_OWORD *)&v25[40] = v17;
    *(_OWORD *)&v25[56] = v18;
    *(void *)&v25[135] = *(void *)&v23[7];
    *(void *)&v25[120] = v22;
    *(void *)&v25[128] = *(void *)v23;
    unsigned __int8 v26 = v24;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::swap(&v27, (uint64_t *)v25);
  }
  uint64_t v11 = *(void *)&this[4]._os_unfair_lock_opaque;
  memset(v25, 0, 135);
  uint64_t v14 = v11;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  memset(v23, 0, sizeof(v23));
  unsigned __int8 v24 = 0;
  if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v27, (uint64_t)&v14))dyld4::FileManager::uuidForFileSystem(); {
  uint64_t v12 = *(void *)(*((void *)v28 + v31 - 1) + 24 * v30[v31 - 1] + 8);
  }
  os_unfair_lock_unlock(v4);
  return v12;
}

uint64_t dyld4::FileManager::fsidForUUID(os_unfair_lock_s *this, const UUID *a2)
{
  uint64_t v64 = *MEMORY[0x1E4F14BF8];
  unint64_t v4 = this + 6;
  os_unfair_lock_lock(this + 6);
  uint64_t v5 = *(uint64_t **)&this[4]._os_unfair_lock_opaque;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  memset(v55, 0, sizeof(v55));
  char v47 = v5;
  uint64_t v6 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v47);
  uint64_t v7 = *v6;
  long long v8 = *(_OWORD *)(v6 + 13);
  long long v9 = *(_OWORD *)(v6 + 11);
  long long v10 = v6[15];
  uint64_t v11 = v6[16];
  long long v41 = *(_OWORD *)(v6 + 9);
  long long v42 = v9;
  long long v43 = v8;
  long long v44 = v10;
  long long v12 = *(_OWORD *)(v6 + 7);
  long long v13 = *(_OWORD *)(v6 + 5);
  long long v14 = *(_OWORD *)(v6 + 3);
  long long v37 = *(_OWORD *)(v6 + 1);
  long long v38 = v14;
  long long v39 = v13;
  long long v40 = v12;
  *(void *)&v45[7] = *(uint64_t **)((char *)v6 + 135);
  *(void *)uint64_t v45 = v11;
  LOBYTE(v10) = *((unsigned char *)v6 + 143);
  uint64_t v36 = v7;
  unsigned __int8 v46 = v10;
  long long v62 = 0u;
  memset(v63, 0, sizeof(v63));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  char v47 = v5;
  memset(v55, 0, sizeof(v55));
  while (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v36, (uint64_t)&v47))
  {
    uint64_t v15 = 0;
    long long v16 = (uint64_t *)(*((void *)&v37 + v46 - 1) + 24 * v45[v46 - 1]);
    do
    {
      int v17 = *((unsigned __int8 *)v16 + v15 + 8);
      int v18 = (*a2)[v15];
    }
    while (v17 == v18 && v15++ != 15);
    if (v17 == v18) {
      goto LABEL_20;
    }
    lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v36);
  }
  dyld4::FileManager::reloadFSInfos((dyld4::FileManager *)this);
  long long v20 = *(uint64_t **)&this[4]._os_unfair_lock_opaque;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  memset(v55, 0, sizeof(v55));
  char v47 = v20;
  long long v21 = lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v47);
  uint64_t v22 = *v21;
  long long v23 = *(_OWORD *)(v21 + 13);
  long long v24 = *(_OWORD *)(v21 + 11);
  uint64_t v25 = v21[15];
  unsigned __int8 v26 = v21[16];
  long long v41 = *(_OWORD *)(v21 + 9);
  long long v42 = v24;
  long long v43 = v23;
  long long v44 = v25;
  long long v27 = *(_OWORD *)(v21 + 7);
  long long v28 = *(_OWORD *)(v21 + 5);
  long long v29 = *(_OWORD *)(v21 + 3);
  long long v37 = *(_OWORD *)(v21 + 1);
  long long v38 = v29;
  long long v39 = v28;
  long long v40 = v27;
  *(void *)&v45[7] = *(uint64_t **)((char *)v21 + 135);
  *(void *)uint64_t v45 = v26;
  LOBYTE(v25) = *((unsigned char *)v21 + 143);
  uint64_t v36 = v22;
  unsigned __int8 v46 = v25;
  long long v62 = 0u;
  memset(v63, 0, sizeof(v63));
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  char v47 = v20;
  memset(v55, 0, sizeof(v55));
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v36, (uint64_t)&v47))
  {
    while (1)
    {
      uint64_t v30 = 0;
      long long v16 = (uint64_t *)(*((void *)&v37 + v46 - 1) + 24 * v45[v46 - 1]);
      do
      {
        int v31 = *((unsigned __int8 *)v16 + v30 + 8);
        int v32 = (*a2)[v30];
      }
      while (v31 == v32 && v30++ != 15);
      if (v31 == v32) {
        break;
      }
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator++(&v36);
      if (!lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v36, (uint64_t)&v47))goto LABEL_19; {
    }
      }
LABEL_20:
    uint64_t v34 = *v16;
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v34 = 0;
LABEL_21:
  os_unfair_lock_unlock(v4);
  return v34;
}

char *dyld4::FileManager::getPath@<X0>(char *this@<X0>, const UUID *a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v5 = this;
  uint64_t v7 = 0;
  do
  {
    int v8 = (*a2)[v7];
    if ((*a2)[v7]) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7 == 15;
    }
    ++v7;
  }
  while (!v9);
  if (v8)
  {
    uint64_t v10 = dyld4::FileManager::fsidForUUID((os_unfair_lock_s *)this, a2);
    return dyld4::FileManager::getPath(v5, (fsid_t)v10, a3, a4);
  }
  else
  {
    *a4 = 0;
  }
  return this;
}

char *dyld4::FileManager::getPath@<X0>(char *this@<X0>, fsid_t a2@<X1>, uint64_t a3@<X2>, char **a4@<X8>)
{
  uint64_t v8 = *MEMORY[0x1E4F14BF8];
  if (*(void *)&a2 && a3)
  {
    uint64_t v5 = (uint64_t)this;
    fsid_t v6 = a2;
    if (fsgetpath(__s, 0x400uLL, &v6, a3) == -1) {
      this = 0;
    }
    else {
      this = lsl::Allocator::strdup(*(lsl::Lock ***)(v5 + 8), __s);
    }
    *a4 = this;
  }
  else
  {
    *a4 = 0;
  }
  return this;
}

uint64_t dyld4::FileRecord::FileRecord(uint64_t a1, dyld4::FileRecord *a2)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 64) = 0x1FFFFFFFFLL;
  *(_WORD *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 74) = 1;
  dyld4::FileRecord::swap((dyld4::FileRecord *)a1, a2);
  return a1;
}

dyld4::FileRecord *dyld4::FileRecord::operator=(dyld4::FileRecord *a1, dyld4::FileRecord *a2)
{
  return a1;
}

void dyld4::FileRecord::~FileRecord(dyld4::FileRecord *this, void *a2)
{
  int v3 = *((_DWORD *)this + 16);
  if (v3 != -1)
  {
    close(v3);
    *((_DWORD *)this + 16) = -1;
  }
  unint64_t v4 = (lsl::Allocator *)*((void *)this + 5);
  if (v4) {
    lsl::Allocator::freeObject(v4, a2);
  }
}

uint64_t dyld4::FileRecord::close(dyld4::FileRecord *this)
{
  uint64_t result = *((unsigned int *)this + 16);
  if (result != -1)
  {
    uint64_t result = close(result);
    *((_DWORD *)this + 16) = -1;
  }
  return result;
}

uint64_t dyld4::FileRecord::open(dyld4::FileRecord *this, int a2)
{
  if (*((_DWORD *)this + 16) != -1) {
    dyld4::FileRecord::open();
  }
  uint64_t v4 = 24;
  do
  {
    int v5 = *((unsigned __int8 *)this + v4);
    if (*((unsigned char *)this + v4)) {
      break;
    }
  }
  while (v4++ != 39);
  if (v5
    && dyld4::FileManager::fsidForUUID(*(os_unfair_lock_s **)this, (const UUID *)((char *)this + 24))
    && *((void *)this + 1))
  {
    uint64_t result = openbyid_np();
    *((_DWORD *)this + 16) = result;
  }
  else
  {
    uint64_t result = *((unsigned int *)this + 16);
  }
  if (result == -1)
  {
    uint64_t Path = (const char *)dyld4::FileRecord::getPath(this);
    uint64_t result = open(Path, a2);
    *((_DWORD *)this + 16) = result;
  }
  return result;
}

uint64_t dyld4::FileRecord::getPath(dyld4::FileRecord *this)
{
  if (!*((void *)this + 5))
  {
    fsid_t v2 = (fsid_t)*((void *)this + 2);
    if (v2) {
      dyld4::FileManager::getPath(*(char **)this, v2, *((void *)this + 1), &v6);
    }
    else {
      dyld4::FileManager::getPath(*(char **)this, (const UUID *)((char *)this + 24), *((void *)this + 1), &v6);
    }
    uint64_t v4 = (lsl::Allocator *)*((void *)this + 5);
    *((void *)this + 5) = v6;
    if (v4) {
      lsl::Allocator::freeObject(v4, v3);
    }
  }
  return *((void *)this + 5);
}

uint64_t dyld4::FileRecord::stat(uint64_t this)
{
  if (*(_DWORD *)(this + 68) == 1)
  {
    uint64_t v1 = this;
    int v2 = *(_DWORD *)(this + 64);
    if (v2 == -1)
    {
      uint64_t Path = (const char *)dyld4::FileRecord::getPath((dyld4::FileRecord *)v1);
      this = stat(Path, &v9);
    }
    else
    {
      this = fstat(v2, &v9);
    }
    *(_DWORD *)(v1 + 68) = this;
    if (!this)
    {
      __darwin_time_t tv_sec = v9.st_mtimespec.tv_sec;
      *(void *)(v1 + 48) = v9.st_size;
      *(void *)(v1 + 56) = tv_sec;
      *(_WORD *)(v1 + 72) = v9.st_mode;
      if (!*(void *)(v1 + 8))
      {
        uint64_t v5 = 24;
        do
        {
          int v6 = *(unsigned __int8 *)(v1 + v5);
          if (*(unsigned char *)(v1 + v5)) {
            break;
          }
        }
        while (v5++ != 39);
        if (!v6)
        {
          *(void *)(v1 + 8) = v9.st_ino;
          this = dyld4::FileManager::uuidForFileSystem(*(os_unfair_lock_s **)v1, v9.st_dev);
          *(void *)(v1 + 24) = this;
          *(void *)(v1 + 32) = v8;
        }
      }
    }
  }
  return this;
}

uint64_t dyld4::FileRecord::size(dyld4::FileRecord *this)
{
  uint64_t result = *((void *)this + 6);
  if (!result)
  {
    dyld4::FileRecord::stat((uint64_t)this);
    return *((void *)this + 6);
  }
  return result;
}

uint64_t dyld4::FileRecord::fileManager(dyld4::FileRecord *this)
{
  return *(void *)this;
}

uint64_t *lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::swap(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *result;
  *uint64_t result = *a2;
  *a2 = v2;
  for (uint64_t i = 1; i != 16; ++i)
  {
    uint64_t v4 = result[i];
    result[i] = a2[i];
    a2[i] = v4;
  }
  uint64_t v5 = 0;
  int v6 = result + 16;
  uint64_t v7 = a2 + 16;
  do
  {
    char v8 = *((unsigned char *)v6 + v5);
    *((unsigned char *)v6 + v5) = *((unsigned char *)v7 + v5);
    *((unsigned char *)v7 + v5++) = v8;
  }
  while (v5 != 15);
  char v9 = *((unsigned char *)result + 143);
  *((unsigned char *)result + 143) = *((unsigned char *)a2 + 143);
  *((unsigned char *)a2 + 143) = v9;
  return result;
}

double lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::find@<D0>(uint64_t *a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = *MEMORY[0x1E4F14BF8];
  lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::const_iterator((uint64_t)&v23, a1, a2);
  long long v13 = a1;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v22 = 0;
  if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>((uint64_t)&v23, (uint64_t)&v13)&& (unsigned __int8 v6 = v32, *a2 >= *(void *)(*((void *)v24 + v32 - 1) + 24 * v31[v32 - 1])))
  {
    long long v8 = v28;
    *(_OWORD *)(a3 + 72) = v27;
    *(_OWORD *)(a3 + 88) = v8;
    *(_OWORD *)(a3 + 104) = v29;
    long long v9 = v24[1];
    *(_OWORD *)(a3 + 8) = v24[0];
    *(_OWORD *)(a3 + 24) = v9;
    double result = *(double *)&v25;
    long long v10 = v26;
    *(_OWORD *)(a3 + 40) = v25;
    *(void *)a3 = v23;
    uint64_t v11 = v30;
    *(_OWORD *)(a3 + 56) = v10;
    *(void *)(a3 + 135) = *(void *)&v31[7];
    uint64_t v12 = *(void *)v31;
    *(void *)(a3 + 120) = v11;
    *(void *)(a3 + 128) = v12;
    *(unsigned char *)(a3 + 143) = v6;
  }
  else
  {
    *(void *)a3 = a1;
    double result = 0.0;
    *(_OWORD *)(a3 + 8) = 0u;
    *(_OWORD *)(a3 + 24) = 0u;
    *(_OWORD *)(a3 + 40) = 0u;
    *(_OWORD *)(a3 + 56) = 0u;
    *(_OWORD *)(a3 + 72) = 0u;
    *(_OWORD *)(a3 + 88) = 0u;
    *(_OWORD *)(a3 + 104) = 0u;
    *(_OWORD *)(a3 + 120) = 0u;
    *(void *)(a3 + 136) = 0;
  }
  return result;
}

uint64_t lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::const_iterator(uint64_t result, uint64_t *a2, unint64_t *a3)
{
  *(void *)double result = a2;
  *(_OWORD *)(result + 8) = 0u;
  uint64_t v3 = result + 8;
  *(_OWORD *)(result + 24) = 0u;
  *(_OWORD *)(result + 40) = 0u;
  *(_OWORD *)(result + 56) = 0u;
  *(_OWORD *)(result + 72) = 0u;
  *(_OWORD *)(result + 88) = 0u;
  *(_OWORD *)(result + 104) = 0u;
  *(_OWORD *)(result + 120) = 0u;
  *(void *)(result + 136) = 0;
  if (*((unsigned char *)a2 + 32))
  {
    unint64_t v4 = 0;
    uint64_t v5 = *a2;
    uint64_t v6 = result + 128;
    do
    {
      *(void *)(v3 + 8 * v4) = v5;
      unint64_t v7 = *(unsigned char *)(v5 + 240) & 0x7F;
      if ((*(unsigned char *)(v5 + 240) & 0x7F) != 0)
      {
        long long v8 = (void *)v5;
        do
        {
          unint64_t v9 = v7 >> 1;
          long long v10 = &v8[3 * (v7 >> 1)];
          unint64_t v12 = *v10;
          uint64_t v11 = v10 + 3;
          v7 += ~(v7 >> 1);
          if (v12 < *a3) {
            long long v8 = v11;
          }
          else {
            unint64_t v7 = v9;
          }
        }
        while (v7);
      }
      else
      {
        long long v8 = (void *)(v5 + 24 * (*(unsigned char *)(v5 + 240) & 0x7F));
      }
      unint64_t v13 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v8 - v5) >> 3);
      *(unsigned char *)(v6 + v4) = v13;
      uint64_t v14 = *(void *)(v3 + 8 * v4);
      if ((*(unsigned char *)(v14 + 240) & 0x7F) != v13
        && *(void *)(v14 + 24 * v13) < *a3)
      {
        *(unsigned char *)(result + 143) = v4 + 1;
        return result;
      }
      unint64_t v15 = *((unsigned __int8 *)a2 + 32);
      if (v4 + 1 != v15)
      {
        if ((*(unsigned char *)(v14 + 240) & 0x80) != 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v5 = *(void *)(v14 + 8 * v13 + 168);
      }
      ++v4;
    }
    while (v4 < v15);
    for (*(unsigned char *)(result + 143) = v15; (_BYTE)v15; *(unsigned char *)(result + 143) = v15)
    {
      if (*(unsigned char *)(v6 + v15 - 1) != (*(unsigned char *)(*(void *)(result
                                                                                            + 8 * v15)
                                                                                + 240) & 0x7F))
        break;
      LOBYTE(v15) = v15 - 1;
    }
  }
  return result;
}

void lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::insert_internal(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v34 = *MEMORY[0x1E4F14BF8];
  if (*(void *)a1)
  {
    uint64_t v24 = a1;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v33 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>(a2, (uint64_t)&v24))
    {
      uint64_t v8 = *(unsigned __int8 *)(a2 + 143);
      if (*a3 >= *(void *)(*(void *)(a2 + 8 + 8 * (v8 - 1)) + 24 * *(unsigned __int8 *)(a2 + 128 + v8 - 1)))
      {
        char v13 = 0;
        long long v19 = *(_OWORD *)(a2 + 88);
        *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
        *(_OWORD *)(a4 + 88) = v19;
        *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
        long long v20 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
        *(_OWORD *)(a4 + 24) = v20;
        long long v21 = *(_OWORD *)(a2 + 56);
        *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
        *(void *)a4 = *(void *)a2;
        *(void *)(a4 + 135) = *(void *)(a2 + 135);
        uint64_t v22 = *(void *)(a2 + 120);
        *(_OWORD *)(a4 + 56) = v21;
        uint64_t v23 = *(void *)(a2 + 128);
        *(void *)(a4 + 120) = v22;
        *(void *)(a4 + 128) = v23;
        *(unsigned char *)(a4 + 143) = v8;
        goto LABEL_11;
      }
    }
    uint64_t v24 = a1;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v33 = 0;
    if (lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator<=>(a2, (uint64_t)&v24)&& *(unsigned __int8 *)(a2 + 143) == *(unsigned __int8 *)(a1 + 32))
    {
      lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
      unint64_t v9 = (uint64_t *)(a2 + 128);
      uint64_t v10 = *(unsigned __int8 *)(a2 + 143) - 1;
      unsigned __int8 v11 = *(unsigned char *)(a2 + 128 + v10);
    }
    else
    {
      lsl::BTree<std::pair<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord>,lsl::OrderedMap<unsigned int,dyld4::Atlas::Process::ProcessUpdateRecord,std::less<unsigned int>>::value_compare,false>::const_iterator::operator--((uint64_t **)a2);
      lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::prepareForInsertion((unsigned __int8 *)a2);
      unint64_t v9 = (uint64_t *)(a2 + 128);
      uint64_t v16 = *(unsigned __int8 *)(a2 + 143) + a2 + 128;
      unsigned __int8 v11 = *(unsigned char *)(v16 - 1) + 1;
      *(unsigned char *)(v16 - 1) = v11;
      uint64_t v10 = *(unsigned __int8 *)(a2 + 143) - 1;
    }
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::insert(*(void *)(a2 + 8 + 8 * v10), v11, (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    uint64_t v17 = *(void *)(a2 + 120);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    uint64_t v18 = *v9;
    *(void *)(a4 + 135) = *(uint64_t *)((char *)v9 + 7);
    *(void *)(a4 + 120) = v17;
    *(void *)(a4 + 128) = v18;
    char v15 = *(unsigned char *)(a2 + 143);
    char v13 = 1;
  }
  else
  {
    unint64_t v12 = lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(a1 + 8), 0x100uLL, 0x100uLL);
    *((unsigned char *)v12 + 240) = 0x80;
    *(_OWORD *)unint64_t v12 = 0u;
    *((_OWORD *)v12 + 1) = 0u;
    *((_OWORD *)v12 + 2) = 0u;
    *((_OWORD *)v12 + 3) = 0u;
    *((_OWORD *)v12 + 4) = 0u;
    *((_OWORD *)v12 + 5) = 0u;
    *((_OWORD *)v12 + 6) = 0u;
    *((_OWORD *)v12 + 7) = 0u;
    *((_OWORD *)v12 + 8) = 0u;
    *((_OWORD *)v12 + 9) = 0u;
    *((_OWORD *)v12 + 10) = 0u;
    *((_OWORD *)v12 + 11) = 0u;
    *((_OWORD *)v12 + 12) = 0u;
    *((_OWORD *)v12 + 13) = 0u;
    *((_OWORD *)v12 + 14) = 0u;
    *(void *)a1 = v12;
    char v13 = 1;
    *(unsigned char *)(a1 + 32) = 1;
    *(void *)(a2 + 8) = v12;
    *(unsigned char *)(a2 + 143) = 1;
    lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::insert((uint64_t)v12, 0, (uint64_t)a3);
    ++*(void *)(a1 + 24);
    *(void *)a4 = *(void *)a2;
    *(_OWORD *)(a4 + 72) = *(_OWORD *)(a2 + 72);
    *(_OWORD *)(a4 + 88) = *(_OWORD *)(a2 + 88);
    *(_OWORD *)(a4 + 104) = *(_OWORD *)(a2 + 104);
    *(_OWORD *)(a4 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a4 + 24) = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a4 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a4 + 56) = *(_OWORD *)(a2 + 56);
    *(void *)(a4 + 135) = *(void *)(a2 + 135);
    uint64_t v14 = *(void *)(a2 + 128);
    *(void *)(a4 + 120) = *(void *)(a2 + 120);
    *(void *)(a4 + 128) = v14;
    char v15 = *(unsigned char *)(a2 + 143);
  }
  *(unsigned char *)(a4 + 143) = v15;
LABEL_11:
  *(unsigned char *)(a4 + 144) = v13;
}

__n128 lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::insert(uint64_t a1, unsigned int a2, uint64_t a3)
{
  char v3 = *(unsigned char *)(a1 + 240);
  char v4 = v3;
  uint64_t v5 = v3 & 0x7F;
  if (v3 >= 0) {
    int v6 = 7;
  }
  else {
    int v6 = 10;
  }
  if (v5 == v6) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  if (v6 == a2) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert();
  }
  if (v5 != a2)
  {
    uint64_t v7 = 3 * v5;
    uint64_t v8 = a1 + 8 * v7;
    uint64_t v9 = 24 * a2 - 8 * v7;
    uint64_t v10 = v8;
    do
    {
      uint64_t v11 = *(void *)(v10 - 24);
      v10 -= 24;
      *(void *)uint64_t v8 = v11;
      *(_OWORD *)(v8 + 8) = *(_OWORD *)(v8 - 16);
      uint64_t v8 = v10;
      v9 += 24;
    }
    while (v9);
    char v4 = *(unsigned char *)(a1 + 240);
  }
  *(unsigned char *)(a1 + 240) = v4 + 1;
  *(void *)(a1 + 24 * a2) = *(void *)a3;
  __n128 result = *(__n128 *)(a3 + 8);
  *(__n128 *)(a1 + 24 * a2 + 8) = result;
  return result;
}

unsigned __int8 *lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::const_iterator::prepareForInsertion(unsigned __int8 *result)
{
  uint64_t v1 = result[143];
  if (v1 != *(unsigned __int8 *)(*(void *)result + 32)) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion();
  }
  uint64_t v2 = result;
  char v3 = result + 8;
  if (*(char *)(*(void *)&result[8 * v1] + 240) >= 0) {
    int v4 = 7;
  }
  else {
    int v4 = 10;
  }
  if ((*(unsigned char *)(*(void *)&result[8 * v1] + 240) & 0x7F) == v4)
  {
    if (!result[143]) {
      goto LABEL_15;
    }
    uint64_t v5 = 0;
    unsigned int v6 = 0;
    do
    {
      if (*(char *)(v3[v5] + 240) >= 0) {
        int v7 = 7;
      }
      else {
        int v7 = 10;
      }
      if ((*(unsigned char *)(v3[v5] + 240) & 0x7F) != v7) {
        unsigned int v6 = v5;
      }
      ++v5;
    }
    while (v1 != v5);
    if (!v6)
    {
LABEL_15:
      if (*(char *)(*v3 + 240) >= 0) {
        int v8 = 7;
      }
      else {
        int v8 = 10;
      }
      if ((*(unsigned char *)(*v3 + 240) & 0x7F) == v8)
      {
        __n128 result = (unsigned __int8 *)lsl::Allocator::aligned_alloc(*(lsl::Lock ***)(*(void *)result + 8), 0x100uLL, 0x100uLL);
        uint64_t v9 = **(void **)v2;
        result[240] = 0;
        *(_OWORD *)__n128 result = 0u;
        *((_OWORD *)result + 1) = 0u;
        *((_OWORD *)result + 2) = 0u;
        *((_OWORD *)result + 3) = 0u;
        *((_OWORD *)result + 4) = 0u;
        *((_OWORD *)result + 5) = 0u;
        *((_OWORD *)result + 6) = 0u;
        *((_OWORD *)result + 7) = 0u;
        *((_OWORD *)result + 8) = 0u;
        *((_OWORD *)result + 9) = 0u;
        *((void *)result + 20) = 0;
        *((void *)result + 21) = v9;
        **(void **)uint64_t v2 = result;
        if (v2[143] && (__n128 result = (unsigned __int8 *)memmove(v2 + 129, v2 + 128, v2[143]), v2[143]))
        {
          __n128 result = (unsigned __int8 *)memmove(v3 + 1, v3, 8 * v2[143]);
          LOBYTE(v1) = v2[143] + 1;
        }
        else
        {
          LOBYTE(v1) = 1;
        }
        unsigned int v6 = 0;
        v2[128] = 0;
        uint64_t v10 = *(uint64_t **)v2;
        *((void *)v2 + 1) = **(void **)v2;
        ++*((unsigned char *)v10 + 32);
        v2[143] = v1;
      }
      else
      {
        unsigned int v6 = 0;
      }
    }
    if (v6 + 1 < v1)
    {
      uint64_t v11 = v2 + 128;
      uint64_t v12 = v6;
      do
      {
        int v13 = v12;
        __n128 result = (unsigned __int8 *)lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::splitChild(v3[v12], v11[v12], *(lsl::Lock ***)(*(void *)v2 + 8));
        uint64_t v14 = v3[v12];
        if (*(char *)(v14 + 240) < 0) {
          lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
        }
        uint64_t v15 = v11[v12];
        uint64_t v16 = *(void *)(v14 + 8 * v15 + 168);
        unsigned int v17 = v2[v12 + 129];
        if (v17 > (*(unsigned char *)(v16 + 240) & 0x7Fu))
        {
          unsigned __int8 v18 = v15 + 1;
          v11[v12] = v18;
          v2[v12 + 129] = v17 + (~*(unsigned char *)(v16 + 240) | 0x80);
          uint64_t v19 = v3[v12];
          if (*(char *)(v19 + 240) < 0) {
            lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
          }
          *(void *)&v2[8 * v12 + 16] = *(void *)(v19 + 8 * v18 + 168);
        }
        ++v12;
      }
      while (v13 + 2 < v2[143]);
    }
  }
  return result;
}

char *lsl::BTree<std::pair<unsigned long long,lsl::UUID>,lsl::OrderedMap<unsigned long long,lsl::UUID,std::less<unsigned long long>>::value_compare,false>::NodeCore<10u,7u>::splitChild(uint64_t a1, unsigned int a2, lsl::Lock **this)
{
  if (*(char *)(a1 + 240) < 0) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 240);
  if (v3 >= 7) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v5 = a1 + 168;
  uint64_t v6 = a1 + 168 + 8 * a2;
  char v7 = *(unsigned char *)(*(void *)v6 + 240);
  int v8 = v7;
  int v9 = v7 & 0x7F;
  if (v7 >= 0) {
    int v10 = 7;
  }
  else {
    int v10 = 10;
  }
  if (v9 != v10) {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  uint64_t v12 = a2;
  if (v8 >= 0) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 5;
  }
  if (v3 != a2)
  {
    uint64_t v14 = 3 * v3;
    uint64_t v15 = a1 + 24 * v3;
    uint64_t v16 = 24 * a2 - 8 * v14;
    uint64_t v17 = v15;
    do
    {
      uint64_t v18 = *(void *)(v17 - 24);
      v17 -= 24;
      *(void *)uint64_t v15 = v18;
      *(_OWORD *)(v15 + 8) = *(_OWORD *)(v15 - 16);
      uint64_t v15 = v17;
      v16 += 24;
    }
    while (v16);
    a2 = *(unsigned __int8 *)(a1 + 240);
  }
  if ((a2 & 0x80) != 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  uint64_t v19 = v5 + 8 * a2;
  if (v19 != v6)
  {
    memmove((void *)(v6 + 16), (const void *)(v6 + 8), v19 - v6);
    LOBYTE(a2) = *(unsigned char *)(a1 + 240);
  }
  *(unsigned char *)(a1 + 240) = a2 + 1;
  uint64_t v20 = *(void *)v6 + 24 * v13;
  *(void *)(a1 + 24 * v12) = *(void *)v20;
  *(_OWORD *)(a1 + 24 * v12 + 8) = *(_OWORD *)(v20 + 8);
  __n128 result = (char *)lsl::Allocator::aligned_alloc(this, 0x100uLL, 0x100uLL);
  uint64_t v22 = result;
  char v23 = *(unsigned char *)(*(void *)v6 + 240);
  result[240] = v23 & 0x80;
  if (v23 < 0)
  {
    long long v24 = 0uLL;
    *((_OWORD *)result + 13) = 0u;
    *((_OWORD *)result + 14) = 0u;
    *((_OWORD *)result + 11) = 0u;
    *((_OWORD *)result + 12) = 0u;
    *((_OWORD *)result + 10) = 0u;
  }
  else
  {
    *((void *)result + 20) = 0;
    long long v24 = 0uLL;
  }
  *((_OWORD *)result + 8) = v24;
  *((_OWORD *)result + 9) = v24;
  *((_OWORD *)result + 6) = v24;
  *((_OWORD *)result + 7) = v24;
  *((_OWORD *)result + 4) = v24;
  *((_OWORD *)result + 5) = v24;
  *((_OWORD *)result + 2) = v24;
  *((_OWORD *)result + 3) = v24;
  *(_OWORD *)__n128 result = v24;
  *((_OWORD *)result + 1) = v24;
  if (*(char *)(a1 + 240) < 0) {
    lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
  }
  unsigned __int8 v25 = v9 + ~(_BYTE)v13;
  long long v26 = (uint64_t *)(v5 + 8 * v12);
  v26[1] = (uint64_t)result;
  uint64_t v27 = *v26;
  if (v25)
  {
    uint64_t v28 = v27 + 24 * v13;
    uint64_t v29 = v28 + 24 * v25 + 24;
    uint64_t v30 = v28 + 24;
    uint64_t v31 = (uint64_t)result;
    do
    {
      *(void *)uint64_t v31 = *(void *)v30;
      *(_OWORD *)(v31 + 8) = *(_OWORD *)(v30 + 8);
      v30 += 24;
      v31 += 24;
    }
    while (v30 != v29);
    uint64_t v27 = *(void *)v6;
  }
  int v32 = *(char *)(v27 + 240);
  if ((v32 & 0x80000000) == 0)
  {
    if (result[240] < 0) {
      lsl::BTree<int,std::less<int>,false>::const_iterator::operator--();
    }
    __n128 result = (char *)memmove(result + 168, (const void *)(v27 + 8 * v13 + 176), 8 * v25 + 8);
    uint64_t v27 = *(void *)v6;
    LOBYTE(v32) = *(unsigned char *)(*(void *)v6 + 240);
  }
  *(unsigned char *)(v27 + 240) = v32 + ~v25;
  char v33 = v22[240] + v25;
  v22[240] = v33;
  if (v33 >= 0) {
    int v34 = 7;
  }
  else {
    int v34 = 10;
  }
  if ((v33 & 0x7F) == v34
    || ((char v35 = *(unsigned char *)(v27 + 240), v36 = v35, v37 = v35 & 0x7F, v36 >= 0) ? (v38 = 7) : (v38 = 10), v37 == v38))
  {
    lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild();
  }
  return result;
}

const os_unfair_lock *lsl::Lock::lock(lsl::Lock *this)
{
  __n128 result = (const os_unfair_lock *)*((void *)this + 1);
  if (result)
  {
    os_unfair_lock_assert_not_owner(result);
    uint64_t v3 = *((void *)this + 1);
    return (const os_unfair_lock *)MEMORY[0x1F40D0838](v3, 0);
  }
  return result;
}

void lsl::Lock::unlock(lsl::Lock *this)
{
  uint64_t v2 = (const os_unfair_lock *)*((void *)this + 1);
  if (v2)
  {
    os_unfair_lock_assert_owner(v2);
    uint64_t v3 = (os_unfair_lock_s *)*((void *)this + 1);
    os_unfair_lock_unlock(v3);
  }
}

mach_vm_address_t lsl::MemoryManager::vm_allocate_bytes(lsl::MemoryManager *this, uint64_t a2)
{
  kern_return_t v5;
  mach_vm_address_t address;
  char v8[1024];
  uint64_t v9;

  int v9 = *MEMORY[0x1E4F14BF8];
  unint64_t v3 = (a2 + 0x3FFF) & 0xFFFFFFFFFFFFC000;
  address = 0x100000000;
  int v4 = (vm_map_t *)MEMORY[0x1E4F14C48];
  if (mach_vm_map(*MEMORY[0x1E4F14C48], &address, v3, *MEMORY[0x1E4F14C70], 1, 0, 0, 0, 3, 7, 1u))
  {
    uint64_t v5 = vm_allocate(*v4, &address, v3, 1);
    if (v5) {
      lsl::MemoryManager::vm_allocate_bytes(v8, v3, (uint64_t *)this, v5);
    }
  }
  return address;
}

size_t lsl::appendHexToString<unsigned long long>(char *a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F14BF8];
  v7.val[0] = (int8x8_t)vsra_n_u8((uint8x8_t)vbsl_s8((int8x8_t)vcgt_u8((uint8x8_t)0xA0A0A0A0A0A0A0A0, (uint8x8_t)a2), (int8x8_t)0x3030303030303030, (int8x8_t)0x5757575757575757), (uint8x8_t)a2, 4uLL);
  int8x8_t v2 = vand_s8((int8x8_t)a2, (int8x8_t)0xF0F0F0F0F0F0F0FLL);
  v7.val[1] = vadd_s8(vbsl_s8((int8x8_t)vcgt_u8((uint8x8_t)0xA0A0A0A0A0A0A0ALL, (uint8x8_t)v2), (int8x8_t)0x3030303030303030, (int8x8_t)0x5757575757575757), v2);
  unint64_t v3 = v5;
  vst2_s8(v3, v7);
  v3 += 16;
  *unint64_t v3 = 0;
  return strlcat(a1, v5, 0x400uLL);
}

size_t lsl::appendHexToString<int>(char *a1, __int32 a2, int8x8_t a3)
{
  uint64_t v8 = *MEMORY[0x1E4F14BF8];
  a3.i32[0] = a2;
  int8x8_t v3 = vzip1_s8(a3, a3);
  int16x4_t v4 = (int16x4_t)vand_s8(v3, (int8x8_t)0xF000F000F000FLL);
  int8x8_t v6 = vtrn1_s8((int8x8_t)vsra_n_u16((uint16x4_t)vbsl_s8((int8x8_t)vcgt_u16((uint16x4_t)0xA000A000A000A0, (uint16x4_t)(*(void *)&v3 & 0xFF00FF00FF00FFLL)), (int8x8_t)0x30003000300030, (int8x8_t)0x57005700570057), (uint16x4_t)(*(void *)&v3 & 0xFF00FF00FF00FFLL), 4uLL), (int8x8_t)vadd_s16((int16x4_t)vbsl_s8((int8x8_t)vcgt_u16((uint16x4_t)0xA000A000A000ALL, (uint16x4_t)v4), (int8x8_t)0x30003000300030, (int8x8_t)0x57005700570057), v4));
  char v7 = 0;
  return strlcat(a1, (const char *)&v6, 0x400uLL);
}

mach_vm_address_t lsl::Allocator::createAllocator(lsl::Allocator *this)
{
  memset(v4, 0, sizeof(v4));
  mach_vm_address_t bytes = lsl::MemoryManager::vm_allocate_bytes((lsl::MemoryManager *)v4, 0x40000);
  *(_OWORD *)mach_vm_address_t bytes = 0u;
  *(_OWORD *)(bytes + 16) = 0u;
  *(_OWORD *)(bytes + 32) = 0u;
  *(_OWORD *)(bytes + 48) = 0u;
  *(_OWORD *)(bytes + 80) = 0u;
  *(_OWORD *)(bytes + 96) = 0u;
  *(_OWORD *)(bytes + 128) = 0u;
  *(_OWORD *)(bytes + 144) = 0u;
  *(_OWORD *)(bytes + 64) = 0u;
  *(_OWORD *)(bytes + 112) = 0u;
  int8x8_t v2 = lsl::Allocator::Pool::Pool(bytes + 112, bytes + 64, 0, bytes, 0x40000, (unint64_t *)(bytes + 160), 261984);
  *(void *)(bytes + 64) = bytes;
  *(void *)(bytes + 72) = v2;
  *(void *)(bytes + 80) = v2;
  *(void *)(bytes + 88) = 0;
  *(void *)(bytes + 96) = 0;
  *(unsigned char *)(bytes + 104) = 0;
  return bytes + 64;
}

lsl::Allocator::Pool *lsl::AllocatorLayout::init(lsl::AllocatorLayout *this, unint64_t a2, const char **a3, const char **a4, void *a5)
{
  if (a2 <= 0x9F) {
    lsl::AllocatorLayout::init();
  }
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  __n128 result = lsl::Allocator::Pool::Pool((unint64_t)this + 112, (uint64_t)this + 64, 0, (unint64_t)this, a2, (unint64_t *)this + 20, a2 - 160);
  *((void *)this + 8) = this;
  *((void *)this + 9) = result;
  *((void *)this + 11) = 0;
  *((void *)this + 12) = 0;
  *((void *)this + 10) = result;
  *((unsigned char *)this + 104) = 0;
  return result;
}

_OWORD *lsl::Allocator::stackAllocatorInternal(lsl::Allocator *this, char *a2, const char **a3, const char **a4, void *a5)
{
  if (!this) {
    lsl::Allocator::stackAllocatorInternal();
  }
  if (!a2) {
    lsl::Allocator::stackAllocatorInternal();
  }
  if ((unint64_t)a2 < 0xA0
    || (int8x8_t v6 = (char *)(((unint64_t)this + 15) & 0xFFFFFFFFFFFFFFF0),
        char v7 = (char *)(v6 - (char *)this),
        v7 > a2 - 160))
  {
    lsl::Allocator::stackAllocatorInternal();
  }
  *((_OWORD *)v6 + 8) = 0u;
  *((_OWORD *)v6 + 9) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *(_OWORD *)int8x8_t v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  uint64_t v8 = v6 + 64;
  lsl::AllocatorLayout::init((lsl::AllocatorLayout *)v6, a2 - v7, a3, a4, a5);
  return v8;
}

void *lsl::Allocator::malloc(lsl::Lock **this, unint64_t a2)
{
  return lsl::Allocator::aligned_alloc(this, 0x10uLL, a2);
}

void *lsl::Allocator::aligned_alloc(lsl::Lock **this, unint64_t a2, unint64_t a3)
{
  int8x8_t v6 = *this;
  lsl::Lock::lock(*this);
  uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
  v7.i16[0] = vaddlv_u8(v7);
  if (v7.u32[0] != 1) {
    lsl::Allocator::aligned_alloc();
  }
  uint64_t v8 = 16;
  if (a2 <= 0x10) {
    uint64_t v9 = 16;
  }
  else {
    uint64_t v9 = a2;
  }
  if (a3 > 0x10) {
    uint64_t v8 = a3;
  }
  uint64_t v10 = (v9 + v8 - 1) & -v9;
  uint64_t v11 = *this;
  *((void *)v11 + 4) = a2;
  *((void *)v11 + 5) = a3;
  *((void *)v11 + 6) = v9;
  *((void *)v11 + 7) = v10;
  uint64_t v12 = this[2];
  if (*((unsigned char *)this + 40)) {
    uint64_t v13 = lsl::Allocator::Pool::aligned_alloc_best_fit(v12, v9, v10);
  }
  else {
    uint64_t v13 = lsl::Allocator::Pool::aligned_alloc(v12, v9, v10);
  }
  uint64_t v14 = v13;
  if (!v13)
  {
    uint64_t v15 = (uint64_t)this[2];
    if (((v9 + v10 + 16463) & 0xFFFFFFFFFFFFC000) <= 0x40000) {
      unint64_t v16 = 0x40000;
    }
    else {
      unint64_t v16 = (v9 + v10 + 16463) & 0xFFFFFFFFFFFFC000;
    }
    unint64_t v17 = *(void *)(v15 + 8);
    mach_vm_address_t bytes = (unint64_t *)lsl::MemoryManager::vm_allocate_bytes(*this, v16);
    lsl::Allocator::Pool::Pool(v17, (uint64_t)this, v15, (unint64_t)bytes, v19, bytes, v19);
    *(void *)(v15 + 8) = v17;
    uint64_t v20 = (lsl::Allocator::Pool *)*((void *)this[2] + 1);
    this[2] = v20;
    uint64_t v14 = lsl::Allocator::Pool::aligned_alloc(v20, v9, v10);
    if (!v14) {
      lsl::Allocator::aligned_alloc();
    }
  }
  this[3] = (lsl::Lock *)((char *)this[3] + v10);
  lsl::Lock::unlock(v6);
  return v14;
}

lsl::Allocator::Pool *lsl::Allocator::Pool::aligned_alloc_best_fit(lsl::Allocator::Pool *this, uint64_t a2, unint64_t a3)
{
  if (a2 == 16 && (int16x4_t v4 = (void *)**((void **)this + 3), (v4 & 1) == 0) && v4)
  {
    uint64_t v5 = 0;
    unint64_t v6 = -1;
    do
    {
      uint64_t v7 = v4[1];
      if ((v7 & 1) == 0)
      {
        unint64_t v8 = (v7 & 0xFFFFFFFFFFFFFFFCLL) - (void)v4 - 16;
        if (v8 >= a3)
        {
          if (v8 - a3 < v6)
          {
            uint64_t v5 = v4;
            unint64_t v6 = v8 - a3;
          }
          if (v8 == a3)
          {
            uint64_t v5 = v4;
            goto LABEL_18;
          }
        }
      }
      int16x4_t v4 = (void *)*v4;
    }
    while ((v4 & 1) == 0 && v4);
    if (!v5)
    {
      a2 = 16;
      goto LABEL_14;
    }
LABEL_18:
    uint64_t v10 = v5[1];
    if (v10) {
      lsl::Allocator::Pool::aligned_alloc_best_fit();
    }
    uint64_t v11 = (lsl::Allocator::Pool *)(v5 + 2);
    v5[1] = v10 | 1;
    if ((v10 & 0xFFFFFFFFFFFFFFFCLL) - (unint64_t)v5 - 16 > a3) {
      lsl::Allocator::AllocationMetadata::returnToNext((lsl::Allocator::AllocationMetadata *)v5, a3);
    }
    if (v11 == this) {
      lsl::Allocator::Pool::aligned_alloc_best_fit();
    }
    return v11;
  }
  else
  {
LABEL_14:
    return (lsl::Allocator::Pool *)lsl::Allocator::Pool::aligned_alloc(this, a2, a3);
  }
}

void *lsl::Allocator::Pool::aligned_alloc(lsl::Allocator::Pool *this, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = (lsl::Allocator::AllocationMetadata *)*((void *)this + 3);
  if ((lsl::Allocator::Pool *)lsl::Allocator::AllocationMetadata::pool(v6, 1) != this) {
    lsl::Allocator::Pool::aligned_alloc();
  }
  unint64_t v7 = (*((void *)v6 + 1) & 0xFFFFFFFFFFFFFFFCLL) - (void)v6 - 16;
  unint64_t v8 = 0;
  if (v7 >= a3 + 16)
  {
    uint64_t v9 = ((unint64_t)v6 + a2 + 15) & -a2;
    if (v9 - ((uint64_t)v6 + 16) <= v7 - (a3 + 16))
    {
      if ((lsl::Allocator::AllocationMetadata *)((char *)v6 + 16) != (lsl::Allocator::AllocationMetadata *)v9)
      {
        lsl::Allocator::AllocationMetadata::reserve(v6, (unsigned __int16)(v9 - (_WORD)v6 - 32), 0);
        unint64_t v6 = (lsl::Allocator::AllocationMetadata *)*((void *)this + 3);
      }
      unint64_t v8 = (void *)((char *)v6 + 16);
      lsl::Allocator::AllocationMetadata::reserve(v6, a3, 1u);
      if ((lsl::Allocator::AllocationMetadata *)((char *)v6 + 16) == this) {
        lsl::Allocator::Pool::aligned_alloc();
      }
    }
  }
  return v8;
}

void lsl::Allocator::freeObject(lsl::Allocator *this, void *a2)
{
  if (this)
  {
    int8x8_t v3 = *(lsl::Lock ***)lsl::Allocator::AllocationMetadata::pool((lsl::Allocator *)((char *)this - 16), 1);
    lsl::Allocator::free(v3, this);
  }
}

uint64_t lsl::Allocator::AllocationMetadata::forPtr(lsl::Allocator::AllocationMetadata *this, void *a2)
{
  return (uint64_t)this - 16;
}

unint64_t lsl::Allocator::AllocationMetadata::pool(lsl::Allocator::AllocationMetadata *this, int a2)
{
  for (uint64_t i = *(lsl::Allocator::AllocationMetadata **)this;
        i && (i & 1) == 0;
        uint64_t i = *(lsl::Allocator::AllocationMetadata **)i)
  {
    if (a2)
    {
      uint64_t v4 = *((void *)this + 1);
      if ((v4 & 1) == 0 && (((v4 & 0xFFFFFFFFFFFFFFFCLL) - (void)this) & 0xFFFFFFFFFFFFFFF8) != 0x10)
      {
        unint64_t result = *((void *)this + 2);
        if (result) {
          return result;
        }
      }
    }
    this = i;
  }
  return (unint64_t)i & 0xFFFFFFFFFFFFFFFELL;
}

void lsl::Allocator::free(lsl::Lock **this, void *a2)
{
  uint64_t v4 = *this;
  lsl::Lock::lock(*this);
  if (a2)
  {
    this[3] = (lsl::Lock *)((char *)this[3] + (void)a2 - (*(a2 - 1) & 0xFFFFFFFFFFFFFFFCLL));
    lsl::Allocator::AllocationMetadata::deallocate((lsl::Allocator::AllocationMetadata *)(a2 - 2));
  }

  lsl::Lock::unlock(v4);
}

unint64_t lsl::Allocator::AllocationMetadata::deallocate(lsl::Allocator::AllocationMetadata *this)
{
  uint64_t v1 = *((void *)this + 1);
  if ((v1 & 1) == 0) {
    lsl::Allocator::AllocationMetadata::deallocate();
  }
  unint64_t v3 = lsl::Allocator::AllocationMetadata::pool(this, 1);
  *((void *)this + 1) = v1 & 0xFFFFFFFFFFFFFFFCLL;

  return lsl::Allocator::AllocationMetadata::coalesce((unint64_t *)this, v3);
}

uint64_t lsl::Allocator::realloc(lsl::Lock **this, void *a2, unint64_t a3)
{
  unint64_t v6 = *this;
  lsl::Lock::lock(*this);
  if (!a2) {
    goto LABEL_6;
  }
  unint64_t v7 = (lsl::Allocator::AllocationMetadata *)(a2 - 2);
  uint64_t v8 = 16;
  if (a3 > 0x10) {
    uint64_t v8 = a3;
  }
  unint64_t v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
  unint64_t v10 = (*(a2 - 1) & 0xFFFFFFFFFFFFFFFCLL) - (void)v7;
  if (v10 - 16 >= v9)
  {
    if (v10 - 16 > v9) {
      lsl::Allocator::AllocationMetadata::returnToNext(v7, v9);
    }
    goto LABEL_9;
  }
  if (lsl::Allocator::AllocationMetadata::consumeFromNext(v7, v9))
  {
LABEL_9:
    this[3] = (lsl::Lock *)((char *)this[3] + v9 - v10 + 16);
    uint64_t v11 = 1;
    goto LABEL_10;
  }
LABEL_6:
  uint64_t v11 = 0;
LABEL_10:
  lsl::Lock::unlock(v6);
  return v11;
}

uint64_t lsl::Allocator::AllocationMetadata::consumeFromNext(lsl::Allocator::AllocationMetadata *this, uint64_t a2)
{
  uint64_t v2 = *((void *)this + 1);
  unint64_t v3 = v2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((v2 & 2) != 0) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = v2 & 0xFFFFFFFFFFFFFFFCLL;
  }
  uint64_t v5 = *(void *)(v4 + 8);
  if (v5) {
    return 0;
  }
  unint64_t v7 = (char *)this + a2 + 16;
  uint64_t v8 = &v7[-v3];
  unint64_t v9 = (v5 & 0xFFFFFFFFFFFFFFFCLL) - v4;
  if (v9 - 16 >= (unint64_t)&v7[-v3])
  {
    lsl::Allocator::AllocationMetadata::AllocationMetadata((unint64_t)v7, this, v9 - 16 - (void)&v7[-v3], v5 & 3, v2 & 3);
    return 1;
  }
  uint64_t result = 0;
  if ((v5 & 2) == 0 && v8 == (char *)v9)
  {
    *((void *)this + 1) = v5 | 1;
    *(void *)(v5 & 0xFFFFFFFFFFFFFFFCLL) = this;
    return 1;
  }
  return result;
}

unint64_t lsl::Allocator::AllocationMetadata::returnToNext(lsl::Allocator::AllocationMetadata *this, uint64_t a2)
{
  unint64_t v4 = lsl::Allocator::AllocationMetadata::pool(this, 1);
  lsl::Allocator::AllocationMetadata::AllocationMetadata((unint64_t)this + a2 + 16, this, (*((void *)this + 1) & 0xFFFFFFFFFFFFFFFCLL) - ((void)this + a2) - 32, 0, *((void *)this + 1) & 3);
  uint64_t v5 = *((void *)this + 1);
  if ((v5 & 2) != 0) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = (unint64_t *)(v5 & 0xFFFFFFFFFFFFFFFCLL);
  }

  return lsl::Allocator::AllocationMetadata::coalesce(v6, v4);
}

char *lsl::Allocator::strdup(lsl::Lock **this, const char *__s)
{
  unint64_t v4 = strlen(__s) + 1;
  uint64_t v5 = (char *)lsl::Allocator::aligned_alloc(this, 0x10uLL, v4);
  strlcpy(v5, __s, v4);
  return v5;
}

uint64_t lsl::Allocator::defaultAllocator(lsl::Allocator *this)
{
  if (lsl::Allocator::defaultAllocator(void)::onceToken != -1) {
    dispatch_once(&lsl::Allocator::defaultAllocator(void)::onceToken, &__block_literal_global_2);
  }
  return lsl::Allocator::defaultAllocator(void)::allocator;
}

void **___ZN3lsl9Allocator16defaultAllocatorEv_block_invoke(lsl::Allocator *a1)
{
  uint64_t result = (void **)lsl::Allocator::createAllocator(a1);
  lsl::Allocator::defaultAllocator(void)::allocator = (uint64_t)result;
  uint64_t v2 = *result;
  *uint64_t v2 = 0;
  v2[1] = &lsl::Allocator::defaultAllocator(void)::unfairLock;
  return result;
}

uint64_t lsl::Allocator::forEachVMAllocatedBuffer(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void **)(result + 16);
  if (v2)
  {
    while (1)
    {
      unint64_t v4 = v2[4];
      if ((unint64_t)v2 < v4) {
        break;
      }
      uint64_t v5 = v2[5];
      if ((unint64_t)(v2 + 6) > v5 + v4) {
        goto LABEL_5;
      }
LABEL_6:
      uint64_t v2 = (void *)v2[2];
      if (!v2) {
        return result;
      }
    }
    uint64_t v5 = v2[5];
LABEL_5:
    v6[0] = v2[4];
    v6[1] = v5;
    uint64_t result = (*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v6);
    goto LABEL_6;
  }
  return result;
}

void ___ZN3lsl9AllocatorD2Ev_block_invoke()
{
}

void lsl::Allocator::~Allocator(lsl::Allocator *this)
{
  v1[0] = MEMORY[0x1E4F14BE8];
  v1[1] = 0x40000000;
  v1[2] = ___ZN3lsl9AllocatorD2Ev_block_invoke;
  v1[3] = &__block_descriptor_tmp_18_0;
  v1[4] = this;
  lsl::Allocator::forEachVMAllocatedBuffer((uint64_t)this, (uint64_t)v1);
}

lsl::Allocator::Pool *lsl::Allocator::Pool::Pool(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t *a6, uint64_t a7)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 16) = a3;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = a4;
  *(void *)(a1 + 40) = a5;
  if ((unint64_t)a6 < a4 || (unint64_t)a6 + a7 > a5 + a4) {
    lsl::Allocator::Pool::Pool();
  }
  *a6 = a1 | 1;
  a6[1] = ((unint64_t)a6 + (a7 & 0xFFFFFFFFFFFFFFF0)) | 2;
  *(void *)(a1 + 24) = a6;
  uint64_t v8 = lsl::Allocator::Pool::aligned_alloc((lsl::Allocator::Pool *)a1, 16, 48);
  *uint64_t v8 = 0u;
  v8[1] = 0u;
  void v8[2] = 0u;
  *(void *)(a1 + 8) = v8;
  return (lsl::Allocator::Pool *)a1;
}

unint64_t lsl::Allocator::AllocationMetadata::reserve(lsl::Allocator::AllocationMetadata *this, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *((void *)this + 1);
  if (v3) {
    lsl::Allocator::AllocationMetadata::reserve();
  }
  uint64_t v5 = (v3 & 0xFFFFFFFFFFFFFFFCLL) - ((void)this + a2) - 32;
  unint64_t v6 = (char *)this + a2 + 16;

  return lsl::Allocator::AllocationMetadata::AllocationMetadata((unint64_t)v6, this, v5, 2, a3);
}

unint64_t lsl::Allocator::AllocationMetadata::AllocationMetadata(unint64_t this, lsl::Allocator::AllocationMetadata *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)this = 0;
  *(void *)(this + 8) = 0;
  unint64_t v10 = lsl::Allocator::AllocationMetadata::pool(a2, 1);
  if (!v10) {
    lsl::Allocator::AllocationMetadata::AllocationMetadata();
  }
  *(void *)this = a2;
  if ((a4 & 2) != 0)
  {
    *(void *)(v10 + 24) = this;
  }
  else
  {
    uint64_t v11 = *((void *)a2 + 1);
    if ((v11 & 2) != 0) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = (void *)(v11 & 0xFFFFFFFFFFFFFFFCLL);
    }
    *uint64_t v12 = this;
  }
  *((void *)a2 + 1) = this | a5;
  unint64_t v13 = (this + 16 + a3) | a4;
  *(void *)(this + 8) = v13;
  if ((v13 & 1) == 0 && (((v13 & 0xFFFFFFFFFFFFFFFCLL) - this) & 0xFFFFFFFFFFFFFFF8) != 0x10) {
    *(void *)(this + 16) = v10;
  }
  if ((v13 & 2) == 0) {
    *(void *)(v13 & 0xFFFFFFFFFFFFFFFCLL) = this;
  }
  return this;
}

unint64_t lsl::Allocator::AllocationMetadata::setPoolHint(unint64_t result, unint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  if ((v2 & 1) == 0)
  {
    unint64_t v3 = result;
    if ((((v2 & 0xFFFFFFFFFFFFFFFCLL) - result) & 0xFFFFFFFFFFFFFFF8) != 0x10)
    {
      if (!a2)
      {
        if (*(void *)result) {
          unint64_t v4 = 0;
        }
        else {
          unint64_t v4 = *(lsl::Allocator::AllocationMetadata **)result;
        }
        uint64_t result = lsl::Allocator::AllocationMetadata::pool(v4, 1);
        a2 = result;
        if (!result) {
          lsl::Allocator::AllocationMetadata::setPoolHint();
        }
      }
      *(void *)(v3 + 16) = a2;
    }
  }
  return result;
}

unint64_t lsl::Allocator::AllocationMetadata::coalesce(unint64_t *a1, unint64_t a2)
{
  unint64_t v3 = a1[1];
  if ((v3 & 2) == 0 && (v3 & 0xFFFFFFFFFFFFFFFCLL) != 0)
  {
    unint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFFFCLL) + 8);
    if ((v4 & 1) == 0)
    {
      a1[1] = v4;
      if ((v4 & 2) == 0) {
        *(void *)(v4 & 0xFFFFFFFFFFFFFFFCLL) = a1;
      }
      unint64_t v3 = v4;
    }
  }
  unint64_t v5 = *a1;
  if (*a1) {
    BOOL v6 = (*a1 & 1) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6 || (*(unsigned char *)(v5 + 8) & 1) != 0)
  {
    unint64_t v5 = (unint64_t)a1;
  }
  else
  {
    *(void *)(v5 + 8) = v3;
    if ((v3 & 2) == 0)
    {
      unint64_t v7 = a1[1];
      if ((v7 & 2) != 0) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = (void *)(v7 & 0xFFFFFFFFFFFFFFFCLL);
      }
      *uint64_t v8 = v5;
    }
  }
  unint64_t result = lsl::Allocator::AllocationMetadata::setPoolHint(v5, a2);
  if ((*(unsigned char *)(v5 + 8) & 2) != 0) {
    *(void *)(a2 + 24) = v5;
  }
  return result;
}

uint64_t lsl::AllocatorLayout::minSize(lsl::AllocatorLayout *this)
{
  return 240;
}

size_t OUTLINED_FUNCTION_0(uint64_t a1, const char *a2)
{
  return strlcat(v2, a2, 0x400uLL);
}

mach_port_context_t dyld_process_info_notify_base::dyld_process_info_notify_base(mach_port_context_t a1, uint64_t a2, const void *a3, const void *a4, int a5, kern_return_t *a6)
{
  kern_return_t v15;
  kern_return_t v16;
  kern_return_t v17;
  NSObject *v19;
  NSObject *v20;
  void v21[5];
  void handler[5];
  mach_port_t previous;
  mach_port_options_t options;

  RemoteBuffer::RemoteBuffer((RemoteBuffer *)a1);
  *(_DWORD *)(v12 + 24) = 0;
  *(void *)(v12 + 32) = a2;
  *(void *)(a1 + 40) = _Block_copy(a3);
  unint64_t v13 = _Block_copy(a4);
  *(_DWORD *)(a1 + 76) = 0;
  *(void *)(a1 + 48) = v13;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 72) = a5;
  *(unsigned char *)(a1 + 80) = 0;
  if (!a6) {
    dyld_process_info_notify_base::dyld_process_info_notify_base();
  }
  dispatch_retain(*(dispatch_object_t *)(a1 + 32));
  *(_OWORD *)&options.flags = xmmword_1ACF93FD8;
  options.reserved[1] = 0;
  uint64_t v14 = (ipc_space_t *)MEMORY[0x1E4F14C48];
  uint64_t v15 = mach_port_construct(*MEMORY[0x1E4F14C48], &options, a1, (mach_port_name_t *)(a1 + 76));
  *a6 = v15;
  if (v15
    || (previous = 0,
        unint64_t v16 = mach_port_request_notification(*v14, *(_DWORD *)(a1 + 76), 70, 1u, *(_DWORD *)(a1 + 76), 0x15u, &previous),
        *a6 = v16,
        v16 | previous)
    || (unint64_t v17 = task_dyld_process_info_notify_register(*(_DWORD *)(a1 + 72), *(_DWORD *)(a1 + 76)), (*a6 = v17) != 0)
    || (uint64_t v19 = dispatch_source_create(MEMORY[0x1E4F14BC8], *(unsigned int *)(a1 + 76), 0, *(dispatch_queue_t *)(a1 + 32)), (*(void *)(a1 + 64) = v19) == 0))
  {
    dyld_process_info_notify_base::teardownMachPorts(a1);
  }
  else
  {
    handler[0] = MEMORY[0x1E4F14BE8];
    handler[1] = 0x40000000;
    handler[2] = ___ZN29dyld_process_info_notify_baseC2EP16dispatch_queue_sU13block_pointerFvbyyPKhPKcEU13block_pointerFvvEjPi_block_invoke;
    handler[3] = &__block_descriptor_tmp_10;
    handler[4] = a1;
    dispatch_source_set_event_handler(v19, handler);
    uint64_t v20 = *(NSObject **)(a1 + 64);
    v21[0] = MEMORY[0x1E4F14BE8];
    v21[1] = 0x40000000;
    _OWORD v21[2] = ___ZN29dyld_process_info_notify_baseC2EP16dispatch_queue_sU13block_pointerFvbyyPKhPKcEU13block_pointerFvvEjPi_block_invoke_2;
    v21[3] = &__block_descriptor_tmp_3_0;
    v21[4] = a1;
    dispatch_source_set_cancel_handler(v20, v21);
    dispatch_activate(*(dispatch_object_t *)(a1 + 64));
    atomic_store(1u, (unsigned __int8 *)(a1 + 80));
  }
  return a1;
}

mach_port_context_t dyld_process_info_notify_base::teardownMachPorts(mach_port_context_t this)
{
  mach_port_name_t v1 = *(_DWORD *)(this + 76);
  if (v1)
  {
    mach_port_context_t v2 = this;
    this = task_dyld_process_info_notify_deregister(*(_DWORD *)(this + 72), v1);
    if (!this) {
      this = mach_port_destruct(*MEMORY[0x1E4F14C48], *(_DWORD *)(v2 + 76), 0, v2);
    }
    *(_DWORD *)(v2 + 76) = 0;
  }
  return this;
}

void ___ZN29dyld_process_info_notify_baseC2EP16dispatch_queue_sU13block_pointerFvbyyPKhPKcEU13block_pointerFvvEjPi_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

void dyld_process_info_notify_base::handleEvent(dyld_process_info_notify_base *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = MEMORY[0x1F41887A8](this, a2, a3, a4);
  uint64_t v17 = *MEMORY[0x1E4F14BF8];
  unsigned __int8 v5 = atomic_load((unsigned __int8 *)(v4 + 80));
  if (v5)
  {
    uint64_t v6 = v4;
    bzero(&msg, 0x8000uLL);
    if (mach_msg(&msg, 50333698, 0, 0x7FCCu, *(_DWORD *)(v6 + 76), 0, 0) || (msg.msgh_bits & 0x80000000) != 0)
    {
      uint64_t v8 = (FILE *)*MEMORY[0x1E4F14C00];
      mach_msg_id_t msgh_id = msg.msgh_id;
      goto LABEL_10;
    }
    mach_msg_id_t msgh_id = msg.msgh_id;
    if (msg.msgh_id >= 0x2000)
    {
      if (msg.msgh_id == 12288)
      {
        if (msg.msgh_size == 24)
        {
          uint64_t v12 = *(void *)(v6 + 56);
          if (v12) {
            (*(void (**)(void))(v12 + 16))();
          }
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      if (msg.msgh_id != 0x2000) {
        goto LABEL_7;
      }
    }
    else
    {
      if (msg.msgh_id == 70)
      {
        uint64_t v11 = (mach_msg_bits_t *)((char *)&msg.msgh_bits + ((msg.msgh_size + 3) & 0x1FFFFFFFCLL));
        if (*v11 || v11[1] < 0x34u || v11[10]) {
          goto LABEL_31;
        }
        goto LABEL_25;
      }
      if (msg.msgh_id != 4096)
      {
LABEL_7:
        if ((msg.msgh_id & 0x4000) != 0)
        {
LABEL_31:
          mach_msg_destroy(&msg);
          return;
        }
        uint64_t v8 = (FILE *)*MEMORY[0x1E4F14C00];
LABEL_10:
        fprintf(v8, "dyld: received unknown message id=0x%X, size=%d\n", msgh_id, msg.msgh_size);
        goto LABEL_31;
      }
    }
    if (msg.msgh_size >= 0x30
      && msg.msgh_size >= v15
      && v16 <= msg.msgh_size
      && msg.msgh_size - v15 >= 32 * (unint64_t)v14)
    {
      if (!v14)
      {
LABEL_30:
        dyld_process_info_notify_base::replyToMonitoredProcess((dyld_process_info_notify_base *)v6, &msg);
        goto LABEL_31;
      }
      unint64_t v9 = 0;
      unint64_t v10 = (char *)&msg + v15;
      while (*((_DWORD *)v10 + 6) <= msg.msgh_size - v16)
      {
        (*(void (**)(void))(*(void *)(v6 + 40) + 16))();
        ++v9;
        v10 += 32;
        if (v9 >= v14) {
          goto LABEL_30;
        }
      }
LABEL_29:
      dyld_process_info_notify_base::disconnect((dyld_process_info_notify_base *)v6);
      goto LABEL_30;
    }
LABEL_25:
    dyld_process_info_notify_base::disconnect((dyld_process_info_notify_base *)v6);
    goto LABEL_31;
  }
}

mach_port_context_t ___ZN29dyld_process_info_notify_baseC2EP16dispatch_queue_sU13block_pointerFvbyyPKhPKcEU13block_pointerFvvEjPi_block_invoke_2(uint64_t a1)
{
  return dyld_process_info_notify_base::teardownMachPorts(*(void *)(a1 + 32));
}

void dyld_process_info_notify_base::~dyld_process_info_notify_base(dyld_process_info_notify_base *this)
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)this + 80);
  if (v2) {
    fwrite("dyld: ~dyld_process_info_notify_base called while still connected\n", 0x42uLL, 1uLL, (FILE *)*MEMORY[0x1E4F14C00]);
  }
  _Block_release(*((const void **)this + 5));
  _Block_release(*((const void **)this + 7));
  _Block_release(*((const void **)this + 6));
  dispatch_release(*((dispatch_object_t *)this + 4));

  RemoteBuffer::~RemoteBuffer((void **)this);
}

void dyld_process_info_notify_base::disconnect(dyld_process_info_notify_base *this)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)this + 80);
  if (v1)
  {
    atomic_store(0, (unsigned __int8 *)this + 80);
    uint64_t v3 = *((void *)this + 8);
    if (v3)
    {
      dispatch_source_cancel(v3);
      dispatch_release(*((dispatch_object_t *)this + 8));
      *((void *)this + 8) = 0;
    }
    if (*((void *)this + 6))
    {
      uint64_t v4 = *((void *)this + 4);
      block[0] = MEMORY[0x1E4F14BE8];
      block[1] = 0x40000000;
      block[2] = ___ZN29dyld_process_info_notify_base10disconnectEv_block_invoke;
      block[3] = &__block_descriptor_tmp_5_1;
      block[4] = this;
      dispatch_async(v4, block);
    }
  }
}

uint64_t ___ZN29dyld_process_info_notify_base10disconnectEv_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
}

void dyld_process_info_notify_base::release(atomic_uint *this)
{
  if (!atomic_fetch_add(this + 6, 0xFFFFFFFF))
  {
    dyld_process_info_notify_base::disconnect((dyld_process_info_notify_base *)this);
    unsigned __int8 v2 = *((void *)this + 4);
    block[0] = MEMORY[0x1E4F14BE8];
    block[1] = 0x40000000;
    block[2] = ___ZN29dyld_process_info_notify_base7releaseEv_block_invoke;
    block[3] = &__block_descriptor_tmp_6_0;
    block[4] = this;
    dispatch_async(v2, block);
  }
}

void ___ZN29dyld_process_info_notify_base7releaseEv_block_invoke(uint64_t a1)
{
  unsigned __int8 v1 = *(dyld_process_info_notify_base **)(a1 + 32);
  if (v1)
  {
    dyld_process_info_notify_base::~dyld_process_info_notify_base(v1);
    free(v2);
  }
}

void dyld_process_info_notify_base::replyToMonitoredProcess(dyld_process_info_notify_base *this, mach_msg_header_t *a2)
{
  mach_msg_bits_t v4 = a2->msgh_bits & 0x1F;
  mach_port_t msgh_remote_port = a2->msgh_remote_port;
  *(void *)&msg.msgh_voucher_port = 0;
  msg.mach_port_t msgh_remote_port = msgh_remote_port;
  msg.msgh_local_port = 0;
  msg.msgh_bits = v4;
  msg.msgh_size = 24;
  if (mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0)) {
    dyld_process_info_notify_base::disconnect(this);
  }
  else {
    a2->mach_port_t msgh_remote_port = 0;
  }
}

mach_port_context_t _dyld_process_info_notify(int a1, uint64_t a2, const void *a3, const void *a4, kern_return_t *a5)
{
  kern_return_t *v9;
  void *v10;
  mach_port_context_t result;
  unsigned __int8 v12;
  int v13;

  unint64_t v13 = 0;
  if (a5) {
    unint64_t v9 = a5;
  }
  else {
    unint64_t v9 = &v13;
  }
  *unint64_t v9 = 0;
  unint64_t v10 = malloc_type_malloc(0x58uLL, 0x3754CC55uLL);
  unint64_t result = dyld_process_info_notify_base::dyld_process_info_notify_base((mach_port_context_t)v10, a2, a3, a4, a1, v9);
  uint64_t v12 = atomic_load((unsigned __int8 *)(result + 80));
  if ((v12 & 1) == 0)
  {
    dyld_process_info_notify_base::release((atomic_uint *)result);
    return 0;
  }
  return result;
}

void *dyld_process_info_notify_base::setNotifyMain(uint64_t a1, const void *a2)
{
  unint64_t result = *(void **)(a1 + 56);
  if (result != a2)
  {
    _Block_release(result);
    unint64_t result = _Block_copy(a2);
    *(void *)(a1 + 56) = result;
  }
  return result;
}

uint64_t _dyld_process_info_notify_retain(uint64_t result)
{
  return result;
}

const char *__cdecl macho_arch_name_for_cpu_type(cpu_type_t type, cpu_subtype_t subtype)
{
  unsigned __int8 v2 = dyld3::MachOFile::archName(*(dyld3::MachOFile **)&type, subtype);
  if (!strcmp(v2, "unknown")) {
    return 0;
  }
  else {
    return v2;
  }
}

const char *__cdecl macho_arch_name_for_mach_header(const mach_header *mh)
{
  if (!mh) {
    mh = (const mach_header *)_dyld_get_prog_image_header();
  }
  unsigned __int8 v1 = dyld3::MachOFile::archName((dyld3::MachOFile *)mh->cputype, mh->cpusubtype);
  if (!strcmp(v1, "unknown")) {
    return 0;
  }
  else {
    return v1;
  }
}

int macho_for_each_slice(const char *path, void *callback)
{
  int v3 = open(path, 0, 0);
  if (v3 == -1) {
    return *__error();
  }
  int v4 = v3;
  int v5 = macho_for_each_slice_in_fd(v3, callback);
  close(v4);
  return v5;
}

int macho_for_each_slice_in_fd(int fd, void *callback)
{
  if (fstat(fd, &v13) == -1) {
    return *__error();
  }
  int v4 = (dyld3::MachOFile *)mmap(0, v13.st_size, 1, 2, fd, 0);
  if (v4 == (dyld3::MachOFile *)-1) {
    return *__error();
  }
  int v5 = v4;
  Diagnostics::Diagnostics((Diagnostics *)v12);
  unint64_t v7 = (dyld3::FatFile *)dyld3::FatFile::isFatFile(v5, v6);
  if (v7)
  {
    v11[0] = MEMORY[0x1E4F14BE8];
    v11[1] = 0x40000000;
    v11[2] = __macho_for_each_slice_in_fd_block_invoke;
    void v11[3] = &unk_1E5E6D5D0;
    void v11[4] = callback;
    void v11[5] = v5;
    dyld3::FatFile::forEachSlice(v7, (Diagnostics *)v12, v13.st_size, (uint64_t)v11);
    if (Diagnostics::hasError((Diagnostics *)v12)) {
      int v8 = 88;
    }
    else {
      int v8 = 0;
    }
  }
  else if (dyld3::MachOFile::isMachO(v5, (Diagnostics *)v12, v13.st_size))
  {
    char v10 = 0;
    if (callback) {
      (*((void (**)(void *, dyld3::MachOFile *, void, off_t, char *))callback + 2))(callback, v5, 0, v13.st_size, &v10);
    }
    int v8 = 0;
  }
  else
  {
    int v8 = 79;
  }
  munmap(v5, v13.st_size);
  mach_o::Error::~Error((mach_o::Error *)v12);
  return v8;
}

uint64_t __macho_for_each_slice_in_fd_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a4, a4 - *(void *)(a1 + 40), a5, a6);
  }
  return result;
}

int macho_best_slice(const char *path, void *bestSlice)
{
  int v3 = open(path, 0, 0);
  if (v3 == -1) {
    return *__error();
  }
  int v4 = v3;
  int v5 = macho_best_slice_in_fd(v3, bestSlice);
  close(v4);
  return v5;
}

int macho_best_slice_in_fd(int fd, void *bestSlice)
{
  unsigned int v4 = dyld3::MachOFile::currentPlatform(*(dyld3::MachOFile **)&fd);
  uint64_t v6 = (dyld3::GradedArchs *)dyld3::GradedArchs::launchCurrentOS((dyld3::GradedArchs *)"", v5);
  unint64_t v7 = (dyld3::GradedArchs *)dyld3::GradedArchs::forCurrentOS((dyld3::GradedArchs *)1, 0);

  return macho_best_slice_fd_internal(fd, v4, v6, v7, 0, (uint64_t)bestSlice);
}

uint64_t macho_best_slice_fd_internal(int a1, unsigned int a2, dyld3::GradedArchs *a3, dyld3::GradedArchs *a4, char a5, uint64_t a6)
{
  if (fstat(a1, &v40) != -1)
  {
    uint64_t v12 = (char *)mmap(0, v40.st_size, 1, 2, a1, 0);
    if (v12 != (char *)-1)
    {
      stat v13 = v12;
      Diagnostics::Diagnostics((Diagnostics *)v39);
      mach_msg_size_t v15 = (dyld3::FatFile *)dyld3::FatFile::isFatFile(v13, v14);
      if (v15)
      {
        uint64_t v35 = 0;
        int v36 = &v35;
        uint64_t v37 = 0x2000000000;
        int v38 = 0;
        uint64_t v31 = 0;
        int v32 = &v31;
        uint64_t v33 = 0x2000000000;
        uint64_t v34 = 0;
        uint64_t v27 = 0;
        uint64_t v28 = &v27;
        uint64_t v29 = 0x2000000000;
        uint64_t v30 = 0;
        v24[0] = MEMORY[0x1E4F14BE8];
        v24[1] = 0x40000000;
        _OWORD v24[2] = ___Z28macho_best_slice_fd_internaliN5dyld38PlatformERKNS_11GradedArchsES3_bU13block_pointerFvPK11mach_headerymE_block_invoke;
        v24[3] = &unk_1E5E6D5F8;
        char v26 = a5;
        v24[4] = &v35;
        v24[5] = &v31;
        v24[6] = &v27;
        v24[7] = a3;
        _OWORD v24[8] = v13;
        v24[9] = a4;
        unsigned int v25 = a2;
        dyld3::FatFile::forEachSlice(v15, (Diagnostics *)v39, v40.st_size, (uint64_t)v24);
        BOOL hasError = Diagnostics::hasError((Diagnostics *)v39);
        uint64_t v18 = 0;
        if (!hasError)
        {
          if (*((_DWORD *)v36 + 6))
          {
            if (a6) {
              (*(void (**)(uint64_t, char *, uint64_t, uint64_t))(a6 + 16))(a6, &v13[v32[3]], v32[3], v28[3]);
            }
            uint64_t v18 = 0;
          }
          else
          {
            uint64_t v18 = 86;
          }
        }
        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v31, 8);
        _Block_object_dispose(&v35, 8);
        if (hasError)
        {
          uint64_t v18 = 88;
LABEL_25:
          mach_o::Error::~Error((mach_o::Error *)v39);
          return v18;
        }
      }
      else
      {
        uint64_t v19 = dyld3::MachOFile::isMachO(v13, v16);
        if (v19)
        {
          uint64_t v20 = v19;
          if (v19[3] == 2
            && (long long v21 = (dyld3::MachOFile *)dyld3::GradedArchs::grade(a3, v19[1], v19[2], a5), v21)
            && (int v22 = dyld3::MachOFile::currentPlatform(v21), dyld3::MachOFile::builtForPlatform(v20, v22, 0))
            || dyld3::GradedArchs::grade(a4, v20[1], v20[2], a5)
            && dyld3::MachOFile::loadableIntoProcess(v20, a2, "", 0))
          {
            if (a6) {
              (*(void (**)(uint64_t, int *, void, off_t))(a6 + 16))(a6, v20, 0, v40.st_size);
            }
            uint64_t v18 = 0;
          }
          else
          {
            uint64_t v18 = 86;
          }
        }
        else
        {
          uint64_t v18 = 79;
        }
      }
      munmap(v13, v40.st_size);
      goto LABEL_25;
    }
  }
  return *__error();
}

uint64_t ___Z28macho_best_slice_fd_internaliN5dyld38PlatformERKNS_11GradedArchsES3_bU13block_pointerFvPK11mach_headerymE_block_invoke(uint64_t a1, const void *a2, int a3, dyld3::MachOFile *this, uint64_t a5)
{
  uint64_t result = (uint64_t)dyld3::MachOFile::isMachO(this, a2);
  if (result)
  {
    unint64_t v9 = (_DWORD *)result;
    int v10 = *(_DWORD *)(result + 8);
    int v11 = *(_DWORD *)(result + 4);
    int v12 = *(unsigned __int8 *)(a1 + 84);
    if (*(_DWORD *)(result + 12) == 2)
    {
      uint64_t result = dyld3::GradedArchs::grade(*(dyld3::GradedArchs **)(a1 + 56), v11, v10, v12 != 0);
      if ((int)result <= *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
        return result;
      }
      int v13 = result;
      int v14 = dyld3::MachOFile::currentPlatform((dyld3::MachOFile *)result);
      uint64_t result = dyld3::MachOFile::builtForPlatform(v9, v14, 0);
      if ((result & 1) == 0) {
        return result;
      }
LABEL_8:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (char *)this - *(void *)(a1 + 64);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a5;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v13;
      return result;
    }
    uint64_t result = dyld3::GradedArchs::grade(*(dyld3::GradedArchs **)(a1 + 72), v11, v10, v12 != 0);
    if ((int)result > *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      int v13 = result;
      uint64_t result = dyld3::MachOFile::loadableIntoProcess(v9, *(_DWORD *)(a1 + 80), "", 0);
      if (result) {
        goto LABEL_8;
      }
    }
  }
  return result;
}

uint64_t macho_for_each_dependent_dylib(mach_header *a1, uint64_t a2, uint64_t a3)
{
  v12[47] = *(mach_o::Header **)MEMORY[0x1E4F14BF8];
  if (a2)
  {
    mach_o::Image::Image(v12, a1, a2, 0);
    if (!mach_o::Header::hasMachOMagic(v12[0])) {
      return 79;
    }
    mach_o::Image::validate((mach_o::Image *)v12, (mach_o::Error *)&v7);
    uint64_t v4 = v7;
    mach_o::Error::~Error((mach_o::Error *)&v7);
    if (v4) {
      return 88;
    }
    uint64_t v6 = v12[0];
    uint64_t v7 = MEMORY[0x1E4F14BE8];
    uint64_t v8 = 0x40000000;
  }
  else
  {
    mach_o::Image::Image((mach_o::Image *)v12, a1);
    uint64_t v6 = v12[0];
    uint64_t v7 = MEMORY[0x1E4F14BE8];
    uint64_t v8 = 0x40000000;
  }
  unint64_t v9 = ___ZL19iterateDependenciesRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke;
  int v10 = &unk_1E5E6D670;
  uint64_t v11 = a3;
  mach_o::Header::forEachLinkedDylib(v6, (uint64_t)&v7);
  return 0;
}

uint64_t macho_for_each_imported_symbol(mach_header *this, uint64_t a2, uint64_t a3)
{
  v8[47] = *(mach_o::Header **)MEMORY[0x1E4F14BF8];
  if (a2)
  {
    mach_o::Image::Image(v8, this, a2, 0);
    if (mach_o::Header::hasMachOMagic(v8[0]))
    {
      mach_o::Image::validate((mach_o::Image *)v8, (mach_o::Error *)&v7);
      uint64_t v5 = v7;
      mach_o::Error::~Error((mach_o::Error *)&v7);
      if (v5) {
        return 88;
      }
      goto LABEL_7;
    }
  }
  else if (mach_o::Header::hasMachOMagic((mach_o::Header *)this))
  {
    mach_o::Image::Image((mach_o::Image *)v8, this);
LABEL_7:
    iterateImportedSymbols(v8, a3);
    return 0;
  }
  return 79;
}

void iterateImportedSymbols(void *a1, uint64_t a2)
{
  uint64_t v4 = (mach_o::Error *)a1[10];
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F14BE8];
    v9[1] = 0x40000000;
    v9[2] = ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke;
    void v9[3] = &unk_1E5E6D698;
    v9[4] = a2;
    void v9[5] = a1;
    mach_o::ChainedFixups::forEachBindTarget(v4, (uint64_t)v9);
  }
  else
  {
    uint64_t v5 = a1[7];
    if (v5)
    {
      v8[0] = MEMORY[0x1E4F14BE8];
      v8[1] = 0x40000000;
      void v8[2] = ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke_2;
      v8[3] = &unk_1E5E6D6C0;
      _OWORD v8[4] = a2;
      void v8[5] = a1;
      mach_o::BindOpcodes::forEachBindTarget(v5, (uint64_t)v8, (uint64_t)&__block_literal_global_3);
    }
    uint64_t v6 = a1[8];
    if (v6)
    {
      v7[0] = MEMORY[0x1E4F14BE8];
      v7[1] = 0x40000000;
      _OWORD v7[2] = ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke_4;
      void v7[3] = &unk_1E5E6D708;
      v7[4] = a2;
      v7[5] = a1;
      mach_o::BindOpcodes::forEachBindTarget(v6, (uint64_t)v7, (uint64_t)&__block_literal_global_17);
    }
  }
}

uint64_t macho_for_each_exported_symbol(mach_header *this, uint64_t a2, uint64_t a3)
{
  v10[47] = *(mach_o::Header **)MEMORY[0x1E4F14BF8];
  if (a2)
  {
    mach_o::Image::Image(v10, this, a2, 0);
    if (mach_o::Header::hasMachOMagic(v10[0]))
    {
      mach_o::Image::validate((mach_o::Image *)v10, (mach_o::Error *)&v9);
      uint64_t v5 = v9;
      mach_o::Error::~Error((mach_o::Error *)&v9);
      if (v5) {
        return 88;
      }
      goto LABEL_7;
    }
  }
  else if (mach_o::Header::hasMachOMagic((mach_o::Header *)this))
  {
    mach_o::Image::Image((mach_o::Image *)v10, this);
LABEL_7:
    iterateExportedSymbols((uint64_t)v10, a3, v6, v7);
    return 0;
  }
  return 79;
}

void iterateExportedSymbols(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    v8[0] = MEMORY[0x1E4F14BE8];
    v8[1] = 0x40000000;
    void v8[2] = ___ZL22iterateExportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke;
    v8[3] = &unk_1E5E6D750;
    _OWORD v8[4] = a2;
    mach_o::ExportsTrie::forEachExportedSymbol(v5, (uint64_t)v8, a3, a4);
  }
  else
  {
    uint64_t v6 = *(_DWORD **)(a1 + 40);
    if (v6)
    {
      v7[0] = MEMORY[0x1E4F14BE8];
      v7[1] = 0x40000000;
      _OWORD v7[2] = ___ZL22iterateExportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke_2;
      void v7[3] = &unk_1E5E6D778;
      v7[4] = a2;
      mach_o::NListSymbolTable::forEachExportedSymbol(v6, (uint64_t)v7);
    }
  }
}

uint64_t macho_for_each_defined_rpath(mach_header *a1, uint64_t a2, uint64_t a3)
{
  v11[47] = *(mach_o::Header **)MEMORY[0x1E4F14BF8];
  if (a2)
  {
    mach_o::Image::Image(v11, a1, a2, 0);
    if (!mach_o::Header::hasMachOMagic(v11[0])) {
      return 79;
    }
    mach_o::Image::validate((mach_o::Image *)v11, (mach_o::Error *)&v9);
    uint64_t v4 = v9;
    mach_o::Error::~Error((mach_o::Error *)&v9);
    if (v4) {
      return 88;
    }
    uint64_t v6 = v11[0];
    v8[0] = MEMORY[0x1E4F14BE8];
    v8[1] = 0x40000000;
    void v8[2] = __macho_for_each_defined_rpath_block_invoke_2;
    v8[3] = &unk_1E5E6D648;
    _OWORD v8[4] = a3;
    uint64_t v7 = v8;
  }
  else
  {
    mach_o::Image::Image((mach_o::Image *)v11, a1);
    uint64_t v6 = v11[0];
    v10[0] = MEMORY[0x1E4F14BE8];
    v10[1] = 0x40000000;
    vm_address_t v10[2] = __macho_for_each_defined_rpath_block_invoke;
    void v10[3] = &unk_1E5E6D620;
    void v10[4] = a3;
    uint64_t v7 = v10;
  }
  mach_o::Header::forEachRPath(v6, (uint64_t)v7);
  return 0;
}

uint64_t __macho_for_each_defined_rpath_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __macho_for_each_defined_rpath_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___ZL19iterateDependenciesRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v7 = *MEMORY[0x1E4F14BF8];
  char v5 = a3;
  mach_o::LinkedDylibAttributes::toString(&v5, __dst);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = mach_o::Header::libOrdinalName(**(mach_o::Header ***)(a1 + 40), *((_DWORD *)a2 + 4));
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v9 = *((unsigned __int8 *)a2 + 20);

  return v8(v6, v5, v7, v9, a3);
}

uint64_t ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke_2(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = mach_o::Header::libOrdinalName(**(mach_o::Header ***)(a1 + 40), *((_DWORD *)a2 + 4));
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v9 = *((unsigned __int8 *)a2 + 20);

  return v8(v6, v5, v7, v9, a3);
}

uint64_t ___ZL22iterateImportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_bPbE_block_invoke_4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *a2;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = mach_o::Header::libOrdinalName(**(mach_o::Header ***)(a1 + 40), *((_DWORD *)a2 + 4));
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v9 = *((unsigned __int8 *)a2 + 20);

  return v8(v6, v5, v7, v9, a3);
}

uint64_t ___ZL22iterateExportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke(uint64_t a1, mach_o::Symbol *this, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)this;
  uint64_t v6 = exportSymbolAttrString(this);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t))(v4 + 16);

  return v7(v4, v5, v6, a3);
}

const char *exportSymbolAttrString(const mach_o::Symbol *this)
{
  if (*((unsigned char *)this + 35)) {
    return "weak-def";
  }
  if (*((unsigned char *)this + 32) == 5) {
    return "thread-local";
  }
  unint64_t v3 = 0;
  if (mach_o::Symbol::isDynamicResolver(this, &v3)) {
    return "dynamic-resolver";
  }
  if (mach_o::Symbol::isAbsolute(this, &v3)) {
    return "absolute";
  }
  return "";
}

uint64_t ___ZL22iterateExportedSymbolsRKN6mach_o5ImageEU13block_pointerFvPKcS4_PbE_block_invoke_2(uint64_t a1, mach_o::Symbol *this, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)this;
  uint64_t v7 = exportSymbolAttrString(this);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, const char *, uint64_t))(v5 + 16);

  return v8(v5, v6, v7, a4);
}

void mach_o::Platform::Platform()
{
  __assert_rtn("Platform", "Platform.cpp", 745, "p->value != 0 && \"PlatformInfo value uninitialized, this might be a problem with C++ static initializers order\"");
}

void ___ZNK6mach_o6Header19platformAndVersionsEv_block_invoke_cold_1()
{
}

void dyld3::OverflowSafeArray<mach_o::Header::validSemanticsSegments(mach_o::Policy const&,unsigned long long)::SegRange,4294967295ull>::push_back(char *a1, void *a2, int a3)
{
  snprintf(a1, 0x100uLL, "OverflowSafeArray failed to allocate %llu bytes, vm_allocate returned: %d\n", *a2, a3);
  qword_1E9A22C80 = (uint64_t)a1;
  __assert_rtn("growTo", "Array.h", 184, "0");
}

void mach_o::Header::loadCommandToDylibKind()
{
}

void mach_o::Symbol::implOffset()
{
  __assert_rtn("implOffset", "Symbol.cpp", 297, "(_kind != Kind::reExport) && (_kind != Kind::absolute)");
}

void dyld3::Array<mach_o::SegmentRanges::SegmentRange>::push_back()
{
}

void Diagnostics::assertNoError(Diagnostics *a1)
{
  Diagnostics::errorMessageCStr(a1);
  uint64_t v1 = abort_report_np();
  dyld4::Atlas::Mapper::~Mapper(v1);
}

void dyld4::Atlas::Mapper::~Mapper()
{
  __assert_rtn("~Mapper", "ProcessAtlas.cpp", 493, "_flatMapping == nullptr");
}

void dyld4::Atlas::Mapper::map()
{
  __assert_rtn("map", "ProcessAtlas.cpp", 521, "((uint64_t)addr + size) <= mapping.address + mapping.size");
}

void dyld4::Atlas::Mapper::pin()
{
  __assert_rtn("pin", "ProcessAtlas.cpp", 554, "_flatMapping == nullptr");
}

void dyld4::Atlas::Mapper::unpin()
{
  __assert_rtn("unpin", "ProcessAtlas.cpp", 576, "_flatMapping != nullptr");
}

void dyld4::Atlas::SharedCache::SharedCache()
{
}

void dyld4::Atlas::Process::teardownNotifications()
{
  __assert_rtn("teardownNotifications", "ProcessAtlas.cpp", 1452, "handle != 0");
}

{
  __assert_rtn("teardownNotifications", "ProcessAtlas.cpp", 1441, "handle != 0");
}

{
  __assert_rtn("teardownNotifications", "ProcessAtlas.cpp", 1432, "_state == Connected");
}

{
  __assert_rtn("teardownNotifications", "ProcessAtlas.cpp", 1431, "dispatch_get_current_queue() == _queue");
}

void dyld4::Atlas::Process::setupNotifications()
{
  __assert_rtn("setupNotifications", "ProcessAtlas.cpp", 1391, "kr != NULL");
}

{
  __assert_rtn("setupNotifications", "ProcessAtlas.cpp", 1392, "_state == Disconnected");
}

{
  __assert_rtn("setupNotifications", "ProcessAtlas.cpp", 1390, "dispatch_get_current_queue() == _queue");
}

void ___ZN5dyld45Atlas7Process32registerAtlasChangedEventHandlerEPiP16dispatch_queue_sU13block_pointerFvPNS0_5ImageEbE_block_invoke_cold_1()
{
  __assert_rtn("registerAtlasChangedEventHandler_block_invoke", "ProcessAtlas.cpp", 1563, "_state == Connected");
}

void ___ZN5dyld45Atlas7Process20registerEventHandlerEPijP16dispatch_queue_sU13block_pointerFvvE_block_invoke_cold_1()
{
  __assert_rtn("registerEventHandler_block_invoke", "ProcessAtlas.cpp", 1580, "_state == Connected");
}

void ___ZN5dyld45Atlas7Process22unregisterEventHandlerEj_block_invoke_cold_1()
{
  __assert_rtn("unregisterEventHandler_block_invoke", "ProcessAtlas.cpp", 1591, "i->second.block != NULL");
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::insert()
{
  __assert_rtn("insert", "BTree.h", 140, "size() != capacity()");
}

{
  __assert_rtn("insert", "BTree.h", 141, "index != capacity()");
}

void lsl::BTree<int,std::less<int>,false>::const_iterator::operator--()
{
}

void lsl::BTree<int,std::less<int>,false>::const_iterator::prepareForInsertion()
{
  __assert_rtn("prepareForInsertion", "BTree.h", 573, "_depth == _btree->_depth && \"prepareForInsertion only works on iterators leaf nodes\"");
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::splitChild()
{
}

{
  __assert_rtn("splitChild", "BTree.h", 194, "!newChild->full() && !child->full() && \"After split the child nodes should be full\"");
}

{
  __assert_rtn("splitChild", "BTree.h", 160, "children()[index]->full() && \"The child being split must be full\"");
}

{
  __assert_rtn("splitChild", "BTree.h", 159, "size() < capacity() && \"There must be room in this node for an additional child\"");
}

void lsl::BTree<int,std::less<int>,false>::erase()
{
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::erase()
{
}

{
  __assert_rtn("erase", "BTree.h", 150, "leaf()");
}

void lsl::BTree<int,std::less<int>,false>::const_iterator::rebalanceFromErasure()
{
  __assert_rtn("rebalanceFromErasure", "BTree.h", 651, "_indexes[0] == 0");
}

{
  __assert_rtn("rebalanceFromErasure", "BTree.h", 610, "_depth == _btree->_depth && \"rebalanceFromErasure only works on iterators to leaf nodes\"");
}

void lsl::BTree<int,std::less<int>,false>::NodeCore<62u,20u>::merge()
{
}

{
  __assert_rtn("merge", "BTree.h", 247, "index < size() && \"A node must have a successor node to merge with\"");
}

void dyld_process_snapshot_create_from_data_cold_1()
{
  __assert_rtn("dyld_process_snapshot_create_from_data", "dyld_introspection.cpp", 122, "reserved2 == 0");
}

void dyld_process_snapshot_create_from_data_cold_2()
{
  __assert_rtn("dyld_process_snapshot_create_from_data", "dyld_introspection.cpp", 121, "reserved1 == nullptr");
}

void dyld_process_info_base::dyld_process_info_base()
{
}

void dyld4::FileManager::uuidForFileSystem()
{
  __assert_rtn("operator()", "FileManager.cpp", 161, "i != _fsUUIDMap->end()");
}

void dyld4::FileRecord::open()
{
  __assert_rtn("open", "FileManager.cpp", 295, "_fd == -1");
}

void lsl::MemoryManager::vm_allocate_bytes(char *a1, uint64_t a2, uint64_t *a3, __int32 a4)
{
  strcpy(a1, "Could not vm_allocate 0x");
  size_t appended = lsl::appendHexToString<unsigned long long>(a1, a2);
  OUTLINED_FUNCTION_0(appended, "\n\tRequested size: 0x");
  size_t v8 = lsl::appendHexToString<unsigned long long>(a1, a3[5]);
  OUTLINED_FUNCTION_0(v8, "\n\tRequested allgnment: 0x");
  size_t v9 = lsl::appendHexToString<unsigned long long>(a1, a3[4]);
  OUTLINED_FUNCTION_0(v9, "\n\tRequested target size: 0x");
  size_t v10 = lsl::appendHexToString<unsigned long long>(a1, a3[7]);
  OUTLINED_FUNCTION_0(v10, "\n\tRequested target allgnment: 0x");
  size_t v11 = lsl::appendHexToString<unsigned long long>(a1, a3[6]);
  OUTLINED_FUNCTION_0(v11, "\n\tkern return: 0x");
  lsl::appendHexToString<int>(a1, a4, v12);
  qword_1E9A22C98 = (uint64_t)a1;
  __assert_rtn("vm_allocate_bytes", "Allocator.cpp", 342, "0 && \"vm_allocate failed\"");
}

void lsl::AllocatorLayout::init()
{
  __assert_rtn("consumeSpace", "Allocator.cpp", 426, "consumedSpace <= size");
}

void lsl::Allocator::stackAllocatorInternal()
{
  __assert_rtn("stackAllocatorInternal", "Allocator.cpp", 471, "buffer != nullptr");
}

{
  __assert_rtn("stackAllocatorInternal", "Allocator.cpp", 472, "size != 0");
}

{
  __assert_rtn("stackAllocatorInternal", "Allocator.cpp", 475, "0");
}

void lsl::Allocator::aligned_alloc()
{
}

{
  __assert_rtn("aligned_alloc", "Allocator.cpp", 499, "std::popcount(alignment) == 1");
}

void lsl::Allocator::Pool::aligned_alloc_best_fit()
{
  __assert_rtn("aligned_alloc_best_fit", "Allocator.cpp", 754, "(uint64_t)result != (uint64_t)this");
}

{
  __assert_rtn("markAllocated", "Allocator.cpp", 1025, "!allocated()");
}

void lsl::Allocator::Pool::aligned_alloc()
{
  __assert_rtn("aligned_alloc", "Allocator.cpp", 705, "(uint64_t)result != (uint64_t)this");
}

{
  __assert_rtn("aligned_alloc", "Allocator.cpp", 674, "_lastFreeMetadata->pool() == this");
}

void lsl::Allocator::AllocationMetadata::deallocate()
{
}

void lsl::Allocator::Pool::Pool()
{
}

void lsl::Allocator::AllocationMetadata::reserve()
{
}

void lsl::Allocator::AllocationMetadata::AllocationMetadata()
{
}

void lsl::Allocator::AllocationMetadata::setPoolHint()
{
}

void dyld_process_info_notify_base::dyld_process_info_notify_base()
{
  __assert_rtn("dyld_process_info_notify_base", "dyld_process_info_notify.cpp", 222, "kr != NULL");
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40CFD60]();
}

uint64_t _simple_salloc()
{
  return MEMORY[0x1F40D07C8]();
}

uint64_t _simple_sfree()
{
  return MEMORY[0x1F40D07D8]();
}

uint64_t _simple_sresize()
{
  return MEMORY[0x1F40D07E8]();
}

uint64_t _simple_vsprintf()
{
  return MEMORY[0x1F40D0800]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CF7C0]();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CFEE8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CF820](a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1F40CF440]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CF488](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CF4D8](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CF880](a1, a2);
}

void free(void *a1)
{
}

ssize_t fsgetpath(char *a1, size_t a2, fsid_t *a3, uint64_t a4)
{
  return MEMORY[0x1F40CFF80](a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CFF88](*(void *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CF8A8](__ptr, __size, __nitems, __stream);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CFFB8](a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1F40CF8B8](a1);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x1F40CFFE8](a1, *(void *)&a2, *(void *)&a3);
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

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x1F40D01B0](*(void *)&task, *(void *)&name, *(void *)&srdelta, guard);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1F40D01D8](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1F40D0200](*(void *)&target_task, address, size, mask, *(void *)&flags, *(void *)&object, offset, *(void *)&copy);
}

kern_return_t mach_vm_read_overwrite(vm_map_read_t target_task, mach_vm_address_t address, mach_vm_size_t size, mach_vm_address_t data, mach_vm_size_t *outsize)
{
  return MEMORY[0x1F40D0220](*(void *)&target_task, address, size, data, outsize);
}

kern_return_t mach_vm_region(vm_map_read_t target_task, mach_vm_address_t *address, mach_vm_size_t *size, vm_region_flavor_t flavor, vm_region_info_t info, mach_msg_type_number_t *infoCnt, mach_port_t *object_name)
{
  return MEMORY[0x1F40D0268](*(void *)&target_task, address, size, *(void *)&flavor, info, infoCnt, object_name);
}

kern_return_t mach_vm_remap_new(vm_map_t target_task, mach_vm_address_t *target_address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, vm_map_read_t src_task, mach_vm_address_t src_address, BOOLean_t copy, vm_prot_t *cur_protection, vm_prot_t *max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1F40D0270](*(void *)&target_task, target_address, size, mask, *(void *)&flags, *(void *)&src_task, src_address, *(void *)&copy);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40D0668](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40D0678](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1F40CF918](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CF920](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CF928](__dst, __src, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1F40CF940](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40D02E0](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40D02F8](a1, a2);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40D0308](a1, *(void *)&a2);
}

uint64_t openbyid_np()
{
  return MEMORY[0x1F40D0330]();
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CF950](a1);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
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

kern_return_t pid_for_task(mach_port_name_t t, int *x)
{
  return MEMORY[0x1F40D0348](*(void *)&t, x);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1F40D03A8](*(void *)&__fd, __buf, __nbyte, a4);
}

int proc_regionfilename(int pid, uint64_t address, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1F40D03D0](*(void *)&pid, address, buffer, *(void *)&buffersize);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1F40D0940](a1, a2, a3, a4);
}

int pthread_detach(pthread_t a1)
{
  return MEMORY[0x1F40D0948](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1F40D0970](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1F40D0988](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1F40D0A10](a1, a2);
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1F40CF990](a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1F40CF998](a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CF9E8](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40D04B8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1F40CFA18](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CFA20](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1F40CFA28](__dst, __src);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CFA50](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CFA58](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CFA60](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CFA70](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1F40CFA78](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CFA88](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CFAB0](__s1, __s2);
}

kern_return_t task_dyld_process_info_notify_deregister(task_read_t target_task, mach_port_name_t notify)
{
  return MEMORY[0x1F40D04C8](*(void *)&target_task, *(void *)&notify);
}

kern_return_t task_dyld_process_info_notify_register(task_read_t target_task, mach_port_t notify)
{
  return MEMORY[0x1F40D04D0](*(void *)&target_task, *(void *)&notify);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1F40D04E0](*(void *)&target_task, *(void *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_map_corpse_info_64(task_t task, task_read_t corspe_task, mach_vm_address_t *kcd_addr_begin, mach_vm_size_t *kcd_size)
{
  return MEMORY[0x1F40D04E8](*(void *)&task, *(void *)&corspe_task, kcd_addr_begin, kcd_size);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CFB18](*(void *)&a1);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1F40CFB40](uu);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1F40D0530](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_copy(vm_map_t target_task, vm_address_t source_address, vm_size_t size, vm_address_t dest_address)
{
  return MEMORY[0x1F40D0538](*(void *)&target_task, source_address, size, dest_address);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40D0540](*(void *)&target_task, address, size);
}

uint64_t vproc_swap_integer()
{
  return MEMORY[0x1F40D0B60]();
}